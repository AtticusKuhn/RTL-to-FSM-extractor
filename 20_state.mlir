fsm.machine @top(%mispec_x: i32) -> (i1, i1, i32, i32, i32, i1, i32, i1, i32) attributes {initialState = "SpecSCC_NUM_fsm_Init0_ar"} {
	%rewindCpt = fsm.variable "rewindCpt" {initValue = 0 : i3} : i3
	%delayed_commit_0 = fsm.variable "delayed_commit_0" {initValue = 0 : i1} : i1
	%delayed_commit_1 = fsm.variable "delayed_commit_1" {initValue = 0 : i1} : i1
	%delayed_commit_2 = fsm.variable "delayed_commit_2" {initValue = 0 : i1} : i1
	%delayed_commit_3 = fsm.variable "delayed_commit_3" {initValue = 0 : i1} : i1
	%delayed_commit_4 = fsm.variable "delayed_commit_4" {initValue = 0 : i1} : i1
	%array_rollback = fsm.variable "array_rollback" {initValue = 0 : i32} : i32
	%mu_rollback = fsm.variable "mu_rollback" {initValue = 0 : i32} : i32
	%rewind = fsm.variable "rewind" {initValue = 0 : i32} : i32
	%rbwe = fsm.variable "rbwe" {initValue = 0 : i1} : i1
	%commit_x = fsm.variable "commit_x" {initValue = 0 : i1} : i1
	%selSlowPath_x = fsm.variable "selSlowPath_x" {initValue = 0 : i32} : i32
	%rollback_x = fsm.variable "rollback_x" {initValue = 0 : i32} : i32
	%startStall_x = fsm.variable "startStall_x" {initValue = 0 : i1} : i1
	%rewindDepth = fsm.variable "rewindDepth" {initValue = 0 : i32} : i32
	%slowPath_x = fsm.variable "slowPath_x" {initValue = 0 : i32} : i32

	%c1_i32 = hw.constant 1 : i32
	%c0_i1 = hw.constant 0 : i1
	%c5_i32 = hw.constant 5 : i32
	%c1_i1 = hw.constant 1 : i1
	%c0_i32 = hw.constant 0 : i32
	%c0_i3 = hw.constant 0 : i3
	%c0_i2 = hw.constant 0 : i2
	fsm.state @SpecSCC_NUM_fsm_Init0_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init0_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Proceed_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Rollback_ar guard {
			%tmp0 =  comb.icmp eq %mispec_x, %c1_i32 : i32
			fsm.return %tmp0

		} action {
			fsm.update %commit_x, %c0_i1 : i1
			fsm.update %rewindDepth, %c5_i32 : i32
			fsm.update %slowPath_x, %c1_i32 : i32
			fsm.update %startStall_x, %c1_i1 : i1
			fsm.update %selSlowPath_x, %slowPath_x : i32
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %array_rollback, %c5_i32 : i32
			fsm.update %mu_rollback, %c5_i32 : i32
			fsm.update %rewind, %rewindDepth : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Rollback_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill0_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill0_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill1_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill1_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill2_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill2_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill3_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill3_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Proceed_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init0_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init1_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init1_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init2_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init2_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init3_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init3_st output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Proceed_ar guard {

		} action {

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Proceed_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Proceed_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32
			fsm.update %commit_x, %c1_i1 : i1

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Rollback_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Rollback_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill0_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill0_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill1_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill1_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill2_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill2_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_x1__Fill3_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_x1__Fill3_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %commit_x, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}

	fsm.state @SpecSCC_NUM_fsm_Init1_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init1_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init2_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init2_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
	fsm.state @SpecSCC_NUM_fsm_Init3_ar output  {

        %r1 = comb.icmp eq %rewindCpt, %c0_i3 : i3
        fsm.output %r1, %delayed_commit_0, %mu_rollback, %array_rollback, %rewind, %rbwe, %rollback_x, %startStall_x, %selSlowPath_x : i1, i1, i32, i32, i32, i1, i32, i1, i32
	} transitions {
		fsm.transition @SpecSCC_NUM_fsm_Init3_st guard {

		} action {
			fsm.update %rbwe, %c1_i1 : i1
			fsm.update %selSlowPath_x, %c0_i32 : i32

		}
	}
}
