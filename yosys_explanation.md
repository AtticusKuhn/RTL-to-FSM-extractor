 This is a problem in the field of Electronic Design Automation (EDA), often referred to as *design recovery* or *functional abstraction*. We're trying to reverse-engineer high-level design intent from a low-level, "flattened" representation.

The core challenge, is distinguishing a *control-oriented Finite State Machine* from other sequential circuits that also have feedback, like accumulators, counters, or shift registers. An FSM's "purpose" is to orchestrate control flow, while an accumulator's purpose is to perform arithmetic. The Yosys algorithm is a collection of heuristics designed to make this distinction.

### The Grand Strategy: The `fsm` Macro

 The `fsm` command is not a single, monolithic algorithm but a **macro**—a carefully orchestrated sequence of more specialized passes. See this script in `fsm.cc`. This is an example of the "divide and conquer" strategy mentioned in the paper's introduction. The typical flow is:

1.  `fsm_detect`: Find the state registers.
2.  `fsm_extract`: Build an abstract representation of the FSM logic.
3.  `fsm_opt`: Perform logic optimizations on the abstract FSM.
4.  `fsm_recode`: Change the state encoding (e.g., from binary to one-hot).
5.  `fsm_map`: Map the abstract FSM back down to logic gates.

***

### Part 1: `fsm_detect` — The Detective Work

Its goal is to look at every register (or more specifically, the `wire` that represents the register's output) in the design and ask: *Are you the state register of a Finite State Machine?* To answer this, it doesn't use formal proof but a set of "rules of thumb" that align with how designers structure FSMs.

Think of it as a checklist. For a wire to be marked with the `fsm_encoding = "auto"` attribute, it must satisfy several conditions, from `fsm_detect.cc` and `fsm.rst`.

**The Heuristic Checklist:**

*   **Is it a Register?** The wire must be driven by a simple D-type flip-flop (`$dff`) or an asynchronous-reset D-type flip-flop (`$adff`). This is the fundamental requirement for a synchronous state element.
*   **Is the Next-State Logic "Closed"?** This is the most crucial condition. The input to the state register (`D` port) must be driven by a multiplexer tree whose leaves consist *only* of two types of signals:
    1.  Constant values (e.g., `3'b010`, `3'b101`). These represent the next states.
    2.  The state register's own output value. This represents the FSM holding its current state.
    This check is performed by the recursive function `check_state_mux_tree`. It traverses the logic cone feeding the register's `D` input. If it encounters any signal that isn't a constant or the state signal itself, it concludes this is not a "closed" FSM logic structure. An adder or multiplier, for example, would introduce other data inputs, failing this check.

*   **Is its Usage "Control-Like"?** This is how Yosys distinguishes FSMs from datapath elements. The state register's output value should only be used in two places:
    1.  Within its own next-state logic multiplexer tree (as we just discussed).
    2.  In simple relational cells that compare the state value to a constant (e.g., `$eq`, `$ne`). This pattern—`if (state == STATE_A) ...`—is the defining characteristic of FSM-based control logic. The `check_state_users` function verifies this.

If a register's output is, for instance, fed into an adder (`$add`), it fails this test because it's being used for computation, not just comparison. This filters out accumulators and other datapath circuits.

*   **Is it Internal Logic?** The wire must not be a primary output of the module. While you *can* expose an FSM's state, it suggests the register has a datapath-like purpose, and re-encoding it could break the downstream module that depends on its specific bit pattern. Yosys plays it safe here.

> **Key Term: Heuristic**
>
> A **heuristic** is a practical method or rule of thumb that is not guaranteed to be optimal or perfect, but is sufficient for reaching an immediate, short-term goal. The FSM detection in Yosys is heuristic because it relies on recognizing common design patterns rather than a formal mathematical proof of FSM-ness. Its success depends on the design adhering to conventional coding styles.

When you re-implement this, you'll need to replicate this pattern-matching logic. The key data structures in Yosys that enable this are `SigMap` (for tracing signals through the netlist) and `SigSet` (for efficiently mapping signals to their drivers and users). You will need analogous tools in MLIR/CIRCT to query the connectivity and cell types within your IR.

***

### Part 2: `fsm_extract` — The Reconstruction

Once `fsm_detect` has tagged a wire as a state register, `fsm_extract` takes over. Its job is to consume the surrounding gate-level logic and replace it with a single, abstract `$fsm` cell. 

The process, detailed in `fsm_extract.cc`, is a systematic exploration of the FSM's logic cones.

1.  **Find States and Control Inputs:** The pass starts from the state register and traverses the input multiplexer tree *again*. But this time, its purpose is different.
    *   The constant values found at the leaves of the mux tree are collected and become the FSM's **state encodings**.
    *   The select signals (`S` ports) of the multiplexers (`$mux`, `$pmux`) in the tree are collected. These become the FSM's **control inputs**. This is based on the logic that `next_state = (control_signal) ? STATE_B : STATE_A;`.

2.  **Find Control Outputs:** The algorithm identifies outputs by looking for logic that is *dependent on the state register*. It starts by including the state register itself as a "pass-through" output. Then, it finds all the cells that were identified by `fsm_detect`'s `check_state_users` logic—those simple comparators. The outputs of these comparators are the FSM's **control outputs**, as they represent the decoded logic like `is_state_A = (state == STATE_A);`.

3.  **Build the Transition Table:** This is the most computationally intensive and brilliant part of the algorithm. The goal is to fill a table that answers the question: "For every possible *current state* and every combination of *control inputs*, what is the *next state* and what are the *control outputs*?"

    To do this, it uses a Yosys utility called `ConstEval`.

    > **Key Concept: `ConstEval`**
    >
    > `ConstEval` is a C++ helper class in Yosys that can evaluate parts of the design. You can give it a set of known input values and ask it to compute the value of an output signal. Crucially, you can also provide it with a list of "stop signals." If it needs the value of a stop signal to continue its calculation, it will halt and report that signal.

    The `fsm_extract` pass uses `ConstEval` in a recursive search:
    *   For each known state from step 1, it tells `ConstEval`: "Assume the state register has this value."
    *   It defines all the control inputs as **stop signals**.
    *   It then asks `ConstEval` to calculate the *next state* (the value at the `D` input of the register) and the *control outputs*.
    *   If `ConstEval` succeeds without hitting a stop signal, a transition is recorded.
    *   If `ConstEval` stops because it needs a control input value, the algorithm branches. It recursively calls itself twice: once assuming the control input is 0, and once assuming it is 1.

    This recursive exploration simulates every possible transition and records the result in a transition table.

4.  **Create the `$fsm` Cell:** Finally, all this extracted information—the control in/out ports, the state encodings, the reset state, and the complete transition table—is used to instantiate a new, abstract `$fsm` cell. This cell functionally replaces the original flip-flop and all its associated next-state and output-decoding logic. The original state register wire is renamed (e.g., to `$fsm$oldstate...`) so it can eventually be optimized away by a later pass like `opt_clean`.
