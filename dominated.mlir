"builtin.module"() ({
  "fsm.machine"() <{function_type = (!seq.clock, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> (i1, i1, i1, i1, i1, i1, i1, i1, i1), initialState = "state_0", sym_name = "mbx_fsm"}> ({
  ^bb0(%arg0: !seq.clock, %arg1: i1, %arg2: i1, %arg3: i1, %arg4: i1, %arg5: i1, %arg6: i1, %arg7: i1, %arg8: i1, %arg9: i1):
    "fsm.state"() <{sym_name = "state_7"}> ({
      %6828 = "hw.constant"() <{value = true}> : () -> i1
      %6829 = "hw.constant"() <{value = false}> : () -> i1
      %6830 = "hw.constant"() <{value = false}> : () -> i1
      %6831 = "hw.constant"() <{value = false}> : () -> i1
      %6832 = "hw.constant"() <{value = false}> : () -> i1
      %6833 = "hw.constant"() <{value = false}> : () -> i1
      %6834 = "hw.constant"() <{value = false}> : () -> i1
      %6835 = "hw.constant"() <{value = false}> : () -> i1
      %6836 = "comb.or"(%arg4, %arg5, %arg3, %6835) : (i1, i1, i1, i1) -> i1
      %6837 = "comb.xor"(%6836, %6828) : (i1, i1) -> i1
      %6838 = "hw.constant"() <{value = true}> : () -> i1
      %6839 = "comb.xor"(%arg3, %6828) : (i1, i1) -> i1
      %6840 = "hw.constant"() <{value = true}> : () -> i1
      %6841 = "hw.constant"() <{value = true}> : () -> i1
      %6842 = "hw.constant"() <{value = true}> : () -> i1
      %6843 = "hw.constant"() <{value = true}> : () -> i1
      %6844 = "hw.constant"() <{value = true}> : () -> i1
      %6845 = "hw.constant"() <{value = true}> : () -> i1
      %6846 = "hw.constant"() <{value = true}> : () -> i1
      %6847 = "hw.constant"() <{value = true}> : () -> i1
      %6848 = "comb.and"(%6839, %6846, %6845, %6844, %6843, %6847, %6842, %6840, %6841, %6838) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      "fsm.output"(%6829, %6830, %6831, %6832, %6836, %6837, %6834, %6833, %6848) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %6725 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6726 = "hw.constant"() <{value = true}> : () -> i1
        %6727 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6728 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6729 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6730 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6731 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6732 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6733 = "hw.constant"() <{value = true}> : () -> i1
        %6734 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6735 = "comb.xor"(%arg1, %6733) : (i1, i1) -> i1
        %6736 = "seq.initial"() ({
          %6827 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6827) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6737 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %6738 = "comb.icmp"(%6823, %6737) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6739 = "seq.compreg"(%6823, %arg0, %6735, %6734, %6736) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6740 = "comb.icmp"(%6739, %6732) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6741 = "comb.and"(%6740, %arg2) : (i1, i1) -> i1
        %6742 = "comb.icmp"(%6739, %6731) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6743 = "comb.icmp"(%6739, %6730) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6744 = "comb.icmp"(%6739, %6729) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6745 = "comb.icmp"(%6739, %6729) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6746 = "comb.icmp"(%6823, %6729) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6747 = "comb.and"(%6745, %6746) : (i1, i1) -> i1
        %6748 = "comb.icmp"(%6739, %6730) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6749 = "comb.icmp"(%6823, %6730) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6750 = "comb.and"(%6748, %6749) : (i1, i1) -> i1
        %6751 = "comb.and"(%6740, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6752 = "comb.and"(%6743, %arg6) : (i1, i1) -> i1
        %6753 = "comb.or"(%arg4, %arg5, %arg3, %6752) : (i1, i1, i1, i1) -> i1
        %6754 = "comb.or"(%6751, %6753) : (i1, i1) -> i1
        %6755 = "comb.xor"(%6753, %6726) : (i1, i1) -> i1
        %6756 = "comb.icmp"(%6739, %6732) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6757 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6758 = "comb.icmp"(%6739, %6731) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6759 = "comb.icmp"(%6739, %6727) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6760 = "comb.icmp"(%6739, %6730) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6761 = "comb.mux"(%6759, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6762 = "comb.mux"(%6759, %6730, %6732) : (i1, i3, i3) -> i3
        %6763 = "comb.icmp"(%6739, %6728) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6764 = "comb.xor"(%arg4, %6726) : (i1, i1) -> i1
        %6765 = "comb.and"(%6756, %6764) : (i1, i1) -> i1
        %6766 = "comb.xor"(%6756, %6726) : (i1, i1) -> i1
        %6767 = "comb.xor"(%6758, %6726) : (i1, i1) -> i1
        %6768 = "comb.xor"(%6759, %6726) : (i1, i1) -> i1
        %6769 = "comb.xor"(%6760, %6726) : (i1, i1) -> i1
        %6770 = "comb.and"(%6769, %6768, %6767, %6766, %6763) : (i1, i1, i1, i1, i1) -> i1
        %6771 = "comb.or"(%6770, %6765) : (i1, i1) -> i1
        %6772 = "comb.mux"(%6771, %arg5, %6761) : (i1, i1, i1) -> i1
        %6773 = "comb.mux"(%6771, %6729, %6762) : (i1, i3, i3) -> i3
        %6774 = "comb.xor"(%6765, %6726) : (i1, i1) -> i1
        %6775 = "comb.xor"(%6757, %6726) : (i1, i1) -> i1
        %6776 = "comb.or"(%6770, %6774, %6775) : (i1, i1, i1) -> i1
        %6777 = "comb.mux"(%6776, %6739, %6730) : (i1, i3, i3) -> i3
        %6778 = "comb.icmp"(%6739, %6729) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6779 = "comb.mux"(%6778, %6739, %6732) : (i1, i3, i3) -> i3
        %6780 = "comb.xor"(%6778, %6726) : (i1, i1) -> i1
        %6781 = "comb.xor"(%arg3, %6726) : (i1, i1) -> i1
        %6782 = "comb.and"(%6766, %6781) : (i1, i1) -> i1
        %6783 = "comb.and"(%6767, %6782) : (i1, i1) -> i1
        %6784 = "comb.and"(%6768, %6783) : (i1, i1) -> i1
        %6785 = "comb.and"(%6760, %6784) : (i1, i1) -> i1
        %6786 = "comb.and"(%6759, %6783) : (i1, i1) -> i1
        %6787 = "comb.or"(%6785, %6786) : (i1, i1) -> i1
        %6788 = "comb.and"(%6764, %6787) : (i1, i1) -> i1
        %6789 = "comb.and"(%6788, %arg5) : (i1, i1) -> i1
        %6790 = "comb.mux"(%6789, %6729, %6779) : (i1, i3, i3) -> i3
        %6791 = "comb.xor"(%6789, %6726) : (i1, i1) -> i1
        %6792 = "comb.and"(%6787, %arg4) : (i1, i1) -> i1
        %6793 = "comb.mux"(%6792, %6728, %6790) : (i1, i3, i3) -> i3
        %6794 = "comb.xor"(%6792, %6726) : (i1, i1) -> i1
        %6795 = "comb.concat"(%6725, %arg8) : (i2, i1) -> i3
        %6796 = "comb.and"(%6758, %6782) : (i1, i1) -> i1
        %6797 = "comb.and"(%6764, %6796) : (i1, i1) -> i1
        %6798 = "comb.xor"(%arg5, %6726) : (i1, i1) -> i1
        %6799 = "comb.and"(%6798, %6797) : (i1, i1) -> i1
        %6800 = "comb.and"(%arg7, %6799) : (i1, i1) -> i1
        %6801 = "comb.mux"(%6800, %6795, %6793) : (i1, i3, i3) -> i3
        %6802 = "comb.xor"(%6800, %6726) : (i1, i1) -> i1
        %6803 = "comb.and"(%6797, %arg5) : (i1, i1) -> i1
        %6804 = "comb.mux"(%6803, %6729, %6801) : (i1, i3, i3) -> i3
        %6805 = "comb.xor"(%6803, %6726) : (i1, i1) -> i1
        %6806 = "comb.and"(%6796, %arg4) : (i1, i1) -> i1
        %6807 = "comb.mux"(%6806, %6728, %6804) : (i1, i3, i3) -> i3
        %6808 = "comb.xor"(%6806, %6726) : (i1, i1) -> i1
        %6809 = "comb.mux"(%6772, %6773, %6777) : (i1, i3, i3) -> i3
        %6810 = "comb.and"(%6756, %6781) : (i1, i1) -> i1
        %6811 = "comb.and"(%6798, %6788) : (i1, i1) -> i1
        %6812 = "comb.and"(%6764, %6810) : (i1, i1) -> i1
        %6813 = "comb.and"(%6763, %6769, %6784) : (i1, i1, i1) -> i1
        %6814 = "comb.or"(%6811, %6812, %6813) : (i1, i1, i1) -> i1
        %6815 = "comb.mux"(%6814, %6809, %6807) : (i1, i3, i3) -> i3
        %6816 = "comb.xor"(%6814, %6726) : (i1, i1) -> i1
        %6817 = "comb.and"(%6810, %arg4) : (i1, i1) -> i1
        %6818 = "comb.mux"(%6817, %6728, %6815) : (i1, i3, i3) -> i3
        %6819 = "comb.xor"(%6817, %6726) : (i1, i1) -> i1
        %6820 = "comb.mux"(%arg3, %6732, %6818) : (i1, i3, i3) -> i3
        %6821 = "comb.xor"(%arg7, %6726) : (i1, i1) -> i1
        %6822 = "comb.and"(%6799, %6821) : (i1, i1) -> i1
        %6823 = "comb.mux"(%6822, %6739, %6820) : (i1, i3, i3) -> i3
        %6824 = "comb.xor"(%6822, %6726) : (i1, i1) -> i1
        %6825 = "comb.and"(%6824, %6781, %6819, %6816, %6808, %6805, %6802, %6794, %6791, %6780) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6826 = "comb.and"(%6738) : (i1) -> i1
        "fsm.return"(%6826) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %6622 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6623 = "hw.constant"() <{value = true}> : () -> i1
        %6624 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6625 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6626 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6627 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6628 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6629 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6630 = "hw.constant"() <{value = true}> : () -> i1
        %6631 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6632 = "comb.xor"(%arg1, %6630) : (i1, i1) -> i1
        %6633 = "seq.initial"() ({
          %6724 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6724) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6634 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %6635 = "comb.icmp"(%6720, %6634) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6636 = "seq.compreg"(%6720, %arg0, %6632, %6631, %6633) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6637 = "comb.icmp"(%6636, %6629) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6638 = "comb.and"(%6637, %arg2) : (i1, i1) -> i1
        %6639 = "comb.icmp"(%6636, %6628) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6640 = "comb.icmp"(%6636, %6627) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6641 = "comb.icmp"(%6636, %6626) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6642 = "comb.icmp"(%6636, %6626) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6643 = "comb.icmp"(%6720, %6626) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6644 = "comb.and"(%6642, %6643) : (i1, i1) -> i1
        %6645 = "comb.icmp"(%6636, %6627) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6646 = "comb.icmp"(%6720, %6627) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6647 = "comb.and"(%6645, %6646) : (i1, i1) -> i1
        %6648 = "comb.and"(%6637, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6649 = "comb.and"(%6640, %arg6) : (i1, i1) -> i1
        %6650 = "comb.or"(%arg4, %arg5, %arg3, %6649) : (i1, i1, i1, i1) -> i1
        %6651 = "comb.or"(%6648, %6650) : (i1, i1) -> i1
        %6652 = "comb.xor"(%6650, %6623) : (i1, i1) -> i1
        %6653 = "comb.icmp"(%6636, %6629) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6654 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6655 = "comb.icmp"(%6636, %6628) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6656 = "comb.icmp"(%6636, %6624) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6657 = "comb.icmp"(%6636, %6627) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6658 = "comb.mux"(%6656, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6659 = "comb.mux"(%6656, %6627, %6629) : (i1, i3, i3) -> i3
        %6660 = "comb.icmp"(%6636, %6625) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6661 = "comb.xor"(%arg4, %6623) : (i1, i1) -> i1
        %6662 = "comb.and"(%6653, %6661) : (i1, i1) -> i1
        %6663 = "comb.xor"(%6653, %6623) : (i1, i1) -> i1
        %6664 = "comb.xor"(%6655, %6623) : (i1, i1) -> i1
        %6665 = "comb.xor"(%6656, %6623) : (i1, i1) -> i1
        %6666 = "comb.xor"(%6657, %6623) : (i1, i1) -> i1
        %6667 = "comb.and"(%6666, %6665, %6664, %6663, %6660) : (i1, i1, i1, i1, i1) -> i1
        %6668 = "comb.or"(%6667, %6662) : (i1, i1) -> i1
        %6669 = "comb.mux"(%6668, %arg5, %6658) : (i1, i1, i1) -> i1
        %6670 = "comb.mux"(%6668, %6626, %6659) : (i1, i3, i3) -> i3
        %6671 = "comb.xor"(%6662, %6623) : (i1, i1) -> i1
        %6672 = "comb.xor"(%6654, %6623) : (i1, i1) -> i1
        %6673 = "comb.or"(%6667, %6671, %6672) : (i1, i1, i1) -> i1
        %6674 = "comb.mux"(%6673, %6636, %6627) : (i1, i3, i3) -> i3
        %6675 = "comb.icmp"(%6636, %6626) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6676 = "comb.mux"(%6675, %6636, %6629) : (i1, i3, i3) -> i3
        %6677 = "comb.xor"(%6675, %6623) : (i1, i1) -> i1
        %6678 = "comb.xor"(%arg3, %6623) : (i1, i1) -> i1
        %6679 = "comb.and"(%6663, %6678) : (i1, i1) -> i1
        %6680 = "comb.and"(%6664, %6679) : (i1, i1) -> i1
        %6681 = "comb.and"(%6665, %6680) : (i1, i1) -> i1
        %6682 = "comb.and"(%6657, %6681) : (i1, i1) -> i1
        %6683 = "comb.and"(%6656, %6680) : (i1, i1) -> i1
        %6684 = "comb.or"(%6682, %6683) : (i1, i1) -> i1
        %6685 = "comb.and"(%6661, %6684) : (i1, i1) -> i1
        %6686 = "comb.and"(%6685, %arg5) : (i1, i1) -> i1
        %6687 = "comb.mux"(%6686, %6626, %6676) : (i1, i3, i3) -> i3
        %6688 = "comb.xor"(%6686, %6623) : (i1, i1) -> i1
        %6689 = "comb.and"(%6684, %arg4) : (i1, i1) -> i1
        %6690 = "comb.mux"(%6689, %6625, %6687) : (i1, i3, i3) -> i3
        %6691 = "comb.xor"(%6689, %6623) : (i1, i1) -> i1
        %6692 = "comb.concat"(%6622, %arg8) : (i2, i1) -> i3
        %6693 = "comb.and"(%6655, %6679) : (i1, i1) -> i1
        %6694 = "comb.and"(%6661, %6693) : (i1, i1) -> i1
        %6695 = "comb.xor"(%arg5, %6623) : (i1, i1) -> i1
        %6696 = "comb.and"(%6695, %6694) : (i1, i1) -> i1
        %6697 = "comb.and"(%arg7, %6696) : (i1, i1) -> i1
        %6698 = "comb.mux"(%6697, %6692, %6690) : (i1, i3, i3) -> i3
        %6699 = "comb.xor"(%6697, %6623) : (i1, i1) -> i1
        %6700 = "comb.and"(%6694, %arg5) : (i1, i1) -> i1
        %6701 = "comb.mux"(%6700, %6626, %6698) : (i1, i3, i3) -> i3
        %6702 = "comb.xor"(%6700, %6623) : (i1, i1) -> i1
        %6703 = "comb.and"(%6693, %arg4) : (i1, i1) -> i1
        %6704 = "comb.mux"(%6703, %6625, %6701) : (i1, i3, i3) -> i3
        %6705 = "comb.xor"(%6703, %6623) : (i1, i1) -> i1
        %6706 = "comb.mux"(%6669, %6670, %6674) : (i1, i3, i3) -> i3
        %6707 = "comb.and"(%6653, %6678) : (i1, i1) -> i1
        %6708 = "comb.and"(%6695, %6685) : (i1, i1) -> i1
        %6709 = "comb.and"(%6661, %6707) : (i1, i1) -> i1
        %6710 = "comb.and"(%6660, %6666, %6681) : (i1, i1, i1) -> i1
        %6711 = "comb.or"(%6708, %6709, %6710) : (i1, i1, i1) -> i1
        %6712 = "comb.mux"(%6711, %6706, %6704) : (i1, i3, i3) -> i3
        %6713 = "comb.xor"(%6711, %6623) : (i1, i1) -> i1
        %6714 = "comb.and"(%6707, %arg4) : (i1, i1) -> i1
        %6715 = "comb.mux"(%6714, %6625, %6712) : (i1, i3, i3) -> i3
        %6716 = "comb.xor"(%6714, %6623) : (i1, i1) -> i1
        %6717 = "comb.mux"(%arg3, %6629, %6715) : (i1, i3, i3) -> i3
        %6718 = "comb.xor"(%arg7, %6623) : (i1, i1) -> i1
        %6719 = "comb.and"(%6696, %6718) : (i1, i1) -> i1
        %6720 = "comb.mux"(%6719, %6636, %6717) : (i1, i3, i3) -> i3
        %6721 = "comb.xor"(%6719, %6623) : (i1, i1) -> i1
        %6722 = "comb.and"(%6721, %6678, %6716, %6713, %6705, %6702, %6699, %6691, %6688, %6677) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6723 = "comb.and"(%6635) : (i1) -> i1
        "fsm.return"(%6723) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %6519 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6520 = "hw.constant"() <{value = true}> : () -> i1
        %6521 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6522 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6523 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6524 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6525 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6526 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6527 = "hw.constant"() <{value = true}> : () -> i1
        %6528 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6529 = "comb.xor"(%arg1, %6527) : (i1, i1) -> i1
        %6530 = "seq.initial"() ({
          %6621 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6621) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6531 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6532 = "comb.icmp"(%6617, %6531) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6533 = "seq.compreg"(%6617, %arg0, %6529, %6528, %6530) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6534 = "comb.icmp"(%6533, %6526) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6535 = "comb.and"(%6534, %arg2) : (i1, i1) -> i1
        %6536 = "comb.icmp"(%6533, %6525) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6537 = "comb.icmp"(%6533, %6524) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6538 = "comb.icmp"(%6533, %6523) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6539 = "comb.icmp"(%6533, %6523) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6540 = "comb.icmp"(%6617, %6523) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6541 = "comb.and"(%6539, %6540) : (i1, i1) -> i1
        %6542 = "comb.icmp"(%6533, %6524) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6543 = "comb.icmp"(%6617, %6524) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6544 = "comb.and"(%6542, %6543) : (i1, i1) -> i1
        %6545 = "comb.and"(%6534, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6546 = "comb.and"(%6537, %arg6) : (i1, i1) -> i1
        %6547 = "comb.or"(%arg4, %arg5, %arg3, %6546) : (i1, i1, i1, i1) -> i1
        %6548 = "comb.or"(%6545, %6547) : (i1, i1) -> i1
        %6549 = "comb.xor"(%6547, %6520) : (i1, i1) -> i1
        %6550 = "comb.icmp"(%6533, %6526) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6551 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6552 = "comb.icmp"(%6533, %6525) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6553 = "comb.icmp"(%6533, %6521) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6554 = "comb.icmp"(%6533, %6524) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6555 = "comb.mux"(%6553, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6556 = "comb.mux"(%6553, %6524, %6526) : (i1, i3, i3) -> i3
        %6557 = "comb.icmp"(%6533, %6522) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6558 = "comb.xor"(%arg4, %6520) : (i1, i1) -> i1
        %6559 = "comb.and"(%6550, %6558) : (i1, i1) -> i1
        %6560 = "comb.xor"(%6550, %6520) : (i1, i1) -> i1
        %6561 = "comb.xor"(%6552, %6520) : (i1, i1) -> i1
        %6562 = "comb.xor"(%6553, %6520) : (i1, i1) -> i1
        %6563 = "comb.xor"(%6554, %6520) : (i1, i1) -> i1
        %6564 = "comb.and"(%6563, %6562, %6561, %6560, %6557) : (i1, i1, i1, i1, i1) -> i1
        %6565 = "comb.or"(%6564, %6559) : (i1, i1) -> i1
        %6566 = "comb.mux"(%6565, %arg5, %6555) : (i1, i1, i1) -> i1
        %6567 = "comb.mux"(%6565, %6523, %6556) : (i1, i3, i3) -> i3
        %6568 = "comb.xor"(%6559, %6520) : (i1, i1) -> i1
        %6569 = "comb.xor"(%6551, %6520) : (i1, i1) -> i1
        %6570 = "comb.or"(%6564, %6568, %6569) : (i1, i1, i1) -> i1
        %6571 = "comb.mux"(%6570, %6533, %6524) : (i1, i3, i3) -> i3
        %6572 = "comb.icmp"(%6533, %6523) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6573 = "comb.mux"(%6572, %6533, %6526) : (i1, i3, i3) -> i3
        %6574 = "comb.xor"(%6572, %6520) : (i1, i1) -> i1
        %6575 = "comb.xor"(%arg3, %6520) : (i1, i1) -> i1
        %6576 = "comb.and"(%6560, %6575) : (i1, i1) -> i1
        %6577 = "comb.and"(%6561, %6576) : (i1, i1) -> i1
        %6578 = "comb.and"(%6562, %6577) : (i1, i1) -> i1
        %6579 = "comb.and"(%6554, %6578) : (i1, i1) -> i1
        %6580 = "comb.and"(%6553, %6577) : (i1, i1) -> i1
        %6581 = "comb.or"(%6579, %6580) : (i1, i1) -> i1
        %6582 = "comb.and"(%6558, %6581) : (i1, i1) -> i1
        %6583 = "comb.and"(%6582, %arg5) : (i1, i1) -> i1
        %6584 = "comb.mux"(%6583, %6523, %6573) : (i1, i3, i3) -> i3
        %6585 = "comb.xor"(%6583, %6520) : (i1, i1) -> i1
        %6586 = "comb.and"(%6581, %arg4) : (i1, i1) -> i1
        %6587 = "comb.mux"(%6586, %6522, %6584) : (i1, i3, i3) -> i3
        %6588 = "comb.xor"(%6586, %6520) : (i1, i1) -> i1
        %6589 = "comb.concat"(%6519, %arg8) : (i2, i1) -> i3
        %6590 = "comb.and"(%6552, %6576) : (i1, i1) -> i1
        %6591 = "comb.and"(%6558, %6590) : (i1, i1) -> i1
        %6592 = "comb.xor"(%arg5, %6520) : (i1, i1) -> i1
        %6593 = "comb.and"(%6592, %6591) : (i1, i1) -> i1
        %6594 = "comb.and"(%arg7, %6593) : (i1, i1) -> i1
        %6595 = "comb.mux"(%6594, %6589, %6587) : (i1, i3, i3) -> i3
        %6596 = "comb.xor"(%6594, %6520) : (i1, i1) -> i1
        %6597 = "comb.and"(%6591, %arg5) : (i1, i1) -> i1
        %6598 = "comb.mux"(%6597, %6523, %6595) : (i1, i3, i3) -> i3
        %6599 = "comb.xor"(%6597, %6520) : (i1, i1) -> i1
        %6600 = "comb.and"(%6590, %arg4) : (i1, i1) -> i1
        %6601 = "comb.mux"(%6600, %6522, %6598) : (i1, i3, i3) -> i3
        %6602 = "comb.xor"(%6600, %6520) : (i1, i1) -> i1
        %6603 = "comb.mux"(%6566, %6567, %6571) : (i1, i3, i3) -> i3
        %6604 = "comb.and"(%6550, %6575) : (i1, i1) -> i1
        %6605 = "comb.and"(%6592, %6582) : (i1, i1) -> i1
        %6606 = "comb.and"(%6558, %6604) : (i1, i1) -> i1
        %6607 = "comb.and"(%6557, %6563, %6578) : (i1, i1, i1) -> i1
        %6608 = "comb.or"(%6605, %6606, %6607) : (i1, i1, i1) -> i1
        %6609 = "comb.mux"(%6608, %6603, %6601) : (i1, i3, i3) -> i3
        %6610 = "comb.xor"(%6608, %6520) : (i1, i1) -> i1
        %6611 = "comb.and"(%6604, %arg4) : (i1, i1) -> i1
        %6612 = "comb.mux"(%6611, %6522, %6609) : (i1, i3, i3) -> i3
        %6613 = "comb.xor"(%6611, %6520) : (i1, i1) -> i1
        %6614 = "comb.mux"(%arg3, %6526, %6612) : (i1, i3, i3) -> i3
        %6615 = "comb.xor"(%arg7, %6520) : (i1, i1) -> i1
        %6616 = "comb.and"(%6593, %6615) : (i1, i1) -> i1
        %6617 = "comb.mux"(%6616, %6533, %6614) : (i1, i3, i3) -> i3
        %6618 = "comb.xor"(%6616, %6520) : (i1, i1) -> i1
        %6619 = "comb.and"(%6618, %6575, %6613, %6610, %6602, %6599, %6596, %6588, %6585, %6574) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6620 = "comb.and"(%6532) : (i1) -> i1
        "fsm.return"(%6620) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %6416 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6417 = "hw.constant"() <{value = true}> : () -> i1
        %6418 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6419 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6420 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6421 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6422 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6423 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6424 = "hw.constant"() <{value = true}> : () -> i1
        %6425 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6426 = "comb.xor"(%arg1, %6424) : (i1, i1) -> i1
        %6427 = "seq.initial"() ({
          %6518 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6518) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6428 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6429 = "comb.icmp"(%6514, %6428) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6430 = "seq.compreg"(%6514, %arg0, %6426, %6425, %6427) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6431 = "comb.icmp"(%6430, %6423) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6432 = "comb.and"(%6431, %arg2) : (i1, i1) -> i1
        %6433 = "comb.icmp"(%6430, %6422) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6434 = "comb.icmp"(%6430, %6421) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6435 = "comb.icmp"(%6430, %6420) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6436 = "comb.icmp"(%6430, %6420) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6437 = "comb.icmp"(%6514, %6420) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6438 = "comb.and"(%6436, %6437) : (i1, i1) -> i1
        %6439 = "comb.icmp"(%6430, %6421) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6440 = "comb.icmp"(%6514, %6421) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6441 = "comb.and"(%6439, %6440) : (i1, i1) -> i1
        %6442 = "comb.and"(%6431, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6443 = "comb.and"(%6434, %arg6) : (i1, i1) -> i1
        %6444 = "comb.or"(%arg4, %arg5, %arg3, %6443) : (i1, i1, i1, i1) -> i1
        %6445 = "comb.or"(%6442, %6444) : (i1, i1) -> i1
        %6446 = "comb.xor"(%6444, %6417) : (i1, i1) -> i1
        %6447 = "comb.icmp"(%6430, %6423) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6448 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6449 = "comb.icmp"(%6430, %6422) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6450 = "comb.icmp"(%6430, %6418) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6451 = "comb.icmp"(%6430, %6421) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6452 = "comb.mux"(%6450, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6453 = "comb.mux"(%6450, %6421, %6423) : (i1, i3, i3) -> i3
        %6454 = "comb.icmp"(%6430, %6419) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6455 = "comb.xor"(%arg4, %6417) : (i1, i1) -> i1
        %6456 = "comb.and"(%6447, %6455) : (i1, i1) -> i1
        %6457 = "comb.xor"(%6447, %6417) : (i1, i1) -> i1
        %6458 = "comb.xor"(%6449, %6417) : (i1, i1) -> i1
        %6459 = "comb.xor"(%6450, %6417) : (i1, i1) -> i1
        %6460 = "comb.xor"(%6451, %6417) : (i1, i1) -> i1
        %6461 = "comb.and"(%6460, %6459, %6458, %6457, %6454) : (i1, i1, i1, i1, i1) -> i1
        %6462 = "comb.or"(%6461, %6456) : (i1, i1) -> i1
        %6463 = "comb.mux"(%6462, %arg5, %6452) : (i1, i1, i1) -> i1
        %6464 = "comb.mux"(%6462, %6420, %6453) : (i1, i3, i3) -> i3
        %6465 = "comb.xor"(%6456, %6417) : (i1, i1) -> i1
        %6466 = "comb.xor"(%6448, %6417) : (i1, i1) -> i1
        %6467 = "comb.or"(%6461, %6465, %6466) : (i1, i1, i1) -> i1
        %6468 = "comb.mux"(%6467, %6430, %6421) : (i1, i3, i3) -> i3
        %6469 = "comb.icmp"(%6430, %6420) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6470 = "comb.mux"(%6469, %6430, %6423) : (i1, i3, i3) -> i3
        %6471 = "comb.xor"(%6469, %6417) : (i1, i1) -> i1
        %6472 = "comb.xor"(%arg3, %6417) : (i1, i1) -> i1
        %6473 = "comb.and"(%6457, %6472) : (i1, i1) -> i1
        %6474 = "comb.and"(%6458, %6473) : (i1, i1) -> i1
        %6475 = "comb.and"(%6459, %6474) : (i1, i1) -> i1
        %6476 = "comb.and"(%6451, %6475) : (i1, i1) -> i1
        %6477 = "comb.and"(%6450, %6474) : (i1, i1) -> i1
        %6478 = "comb.or"(%6476, %6477) : (i1, i1) -> i1
        %6479 = "comb.and"(%6455, %6478) : (i1, i1) -> i1
        %6480 = "comb.and"(%6479, %arg5) : (i1, i1) -> i1
        %6481 = "comb.mux"(%6480, %6420, %6470) : (i1, i3, i3) -> i3
        %6482 = "comb.xor"(%6480, %6417) : (i1, i1) -> i1
        %6483 = "comb.and"(%6478, %arg4) : (i1, i1) -> i1
        %6484 = "comb.mux"(%6483, %6419, %6481) : (i1, i3, i3) -> i3
        %6485 = "comb.xor"(%6483, %6417) : (i1, i1) -> i1
        %6486 = "comb.concat"(%6416, %arg8) : (i2, i1) -> i3
        %6487 = "comb.and"(%6449, %6473) : (i1, i1) -> i1
        %6488 = "comb.and"(%6455, %6487) : (i1, i1) -> i1
        %6489 = "comb.xor"(%arg5, %6417) : (i1, i1) -> i1
        %6490 = "comb.and"(%6489, %6488) : (i1, i1) -> i1
        %6491 = "comb.and"(%arg7, %6490) : (i1, i1) -> i1
        %6492 = "comb.mux"(%6491, %6486, %6484) : (i1, i3, i3) -> i3
        %6493 = "comb.xor"(%6491, %6417) : (i1, i1) -> i1
        %6494 = "comb.and"(%6488, %arg5) : (i1, i1) -> i1
        %6495 = "comb.mux"(%6494, %6420, %6492) : (i1, i3, i3) -> i3
        %6496 = "comb.xor"(%6494, %6417) : (i1, i1) -> i1
        %6497 = "comb.and"(%6487, %arg4) : (i1, i1) -> i1
        %6498 = "comb.mux"(%6497, %6419, %6495) : (i1, i3, i3) -> i3
        %6499 = "comb.xor"(%6497, %6417) : (i1, i1) -> i1
        %6500 = "comb.mux"(%6463, %6464, %6468) : (i1, i3, i3) -> i3
        %6501 = "comb.and"(%6447, %6472) : (i1, i1) -> i1
        %6502 = "comb.and"(%6489, %6479) : (i1, i1) -> i1
        %6503 = "comb.and"(%6455, %6501) : (i1, i1) -> i1
        %6504 = "comb.and"(%6454, %6460, %6475) : (i1, i1, i1) -> i1
        %6505 = "comb.or"(%6502, %6503, %6504) : (i1, i1, i1) -> i1
        %6506 = "comb.mux"(%6505, %6500, %6498) : (i1, i3, i3) -> i3
        %6507 = "comb.xor"(%6505, %6417) : (i1, i1) -> i1
        %6508 = "comb.and"(%6501, %arg4) : (i1, i1) -> i1
        %6509 = "comb.mux"(%6508, %6419, %6506) : (i1, i3, i3) -> i3
        %6510 = "comb.xor"(%6508, %6417) : (i1, i1) -> i1
        %6511 = "comb.mux"(%arg3, %6423, %6509) : (i1, i3, i3) -> i3
        %6512 = "comb.xor"(%arg7, %6417) : (i1, i1) -> i1
        %6513 = "comb.and"(%6490, %6512) : (i1, i1) -> i1
        %6514 = "comb.mux"(%6513, %6430, %6511) : (i1, i3, i3) -> i3
        %6515 = "comb.xor"(%6513, %6417) : (i1, i1) -> i1
        %6516 = "comb.and"(%6515, %6472, %6510, %6507, %6499, %6496, %6493, %6485, %6482, %6471) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6517 = "comb.and"(%6429) : (i1) -> i1
        "fsm.return"(%6517) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %6313 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6314 = "hw.constant"() <{value = true}> : () -> i1
        %6315 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6316 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6317 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6318 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6319 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6320 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6321 = "hw.constant"() <{value = true}> : () -> i1
        %6322 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6323 = "comb.xor"(%arg1, %6321) : (i1, i1) -> i1
        %6324 = "seq.initial"() ({
          %6415 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6415) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6325 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6326 = "comb.icmp"(%6411, %6325) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6327 = "seq.compreg"(%6411, %arg0, %6323, %6322, %6324) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6328 = "comb.icmp"(%6327, %6320) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6329 = "comb.and"(%6328, %arg2) : (i1, i1) -> i1
        %6330 = "comb.icmp"(%6327, %6319) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6331 = "comb.icmp"(%6327, %6318) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6332 = "comb.icmp"(%6327, %6317) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6333 = "comb.icmp"(%6327, %6317) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6334 = "comb.icmp"(%6411, %6317) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6335 = "comb.and"(%6333, %6334) : (i1, i1) -> i1
        %6336 = "comb.icmp"(%6327, %6318) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6337 = "comb.icmp"(%6411, %6318) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6338 = "comb.and"(%6336, %6337) : (i1, i1) -> i1
        %6339 = "comb.and"(%6328, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6340 = "comb.and"(%6331, %arg6) : (i1, i1) -> i1
        %6341 = "comb.or"(%arg4, %arg5, %arg3, %6340) : (i1, i1, i1, i1) -> i1
        %6342 = "comb.or"(%6339, %6341) : (i1, i1) -> i1
        %6343 = "comb.xor"(%6341, %6314) : (i1, i1) -> i1
        %6344 = "comb.icmp"(%6327, %6320) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6345 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6346 = "comb.icmp"(%6327, %6319) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6347 = "comb.icmp"(%6327, %6315) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6348 = "comb.icmp"(%6327, %6318) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6349 = "comb.mux"(%6347, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6350 = "comb.mux"(%6347, %6318, %6320) : (i1, i3, i3) -> i3
        %6351 = "comb.icmp"(%6327, %6316) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6352 = "comb.xor"(%arg4, %6314) : (i1, i1) -> i1
        %6353 = "comb.and"(%6344, %6352) : (i1, i1) -> i1
        %6354 = "comb.xor"(%6344, %6314) : (i1, i1) -> i1
        %6355 = "comb.xor"(%6346, %6314) : (i1, i1) -> i1
        %6356 = "comb.xor"(%6347, %6314) : (i1, i1) -> i1
        %6357 = "comb.xor"(%6348, %6314) : (i1, i1) -> i1
        %6358 = "comb.and"(%6357, %6356, %6355, %6354, %6351) : (i1, i1, i1, i1, i1) -> i1
        %6359 = "comb.or"(%6358, %6353) : (i1, i1) -> i1
        %6360 = "comb.mux"(%6359, %arg5, %6349) : (i1, i1, i1) -> i1
        %6361 = "comb.mux"(%6359, %6317, %6350) : (i1, i3, i3) -> i3
        %6362 = "comb.xor"(%6353, %6314) : (i1, i1) -> i1
        %6363 = "comb.xor"(%6345, %6314) : (i1, i1) -> i1
        %6364 = "comb.or"(%6358, %6362, %6363) : (i1, i1, i1) -> i1
        %6365 = "comb.mux"(%6364, %6327, %6318) : (i1, i3, i3) -> i3
        %6366 = "comb.icmp"(%6327, %6317) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6367 = "comb.mux"(%6366, %6327, %6320) : (i1, i3, i3) -> i3
        %6368 = "comb.xor"(%6366, %6314) : (i1, i1) -> i1
        %6369 = "comb.xor"(%arg3, %6314) : (i1, i1) -> i1
        %6370 = "comb.and"(%6354, %6369) : (i1, i1) -> i1
        %6371 = "comb.and"(%6355, %6370) : (i1, i1) -> i1
        %6372 = "comb.and"(%6356, %6371) : (i1, i1) -> i1
        %6373 = "comb.and"(%6348, %6372) : (i1, i1) -> i1
        %6374 = "comb.and"(%6347, %6371) : (i1, i1) -> i1
        %6375 = "comb.or"(%6373, %6374) : (i1, i1) -> i1
        %6376 = "comb.and"(%6352, %6375) : (i1, i1) -> i1
        %6377 = "comb.and"(%6376, %arg5) : (i1, i1) -> i1
        %6378 = "comb.mux"(%6377, %6317, %6367) : (i1, i3, i3) -> i3
        %6379 = "comb.xor"(%6377, %6314) : (i1, i1) -> i1
        %6380 = "comb.and"(%6375, %arg4) : (i1, i1) -> i1
        %6381 = "comb.mux"(%6380, %6316, %6378) : (i1, i3, i3) -> i3
        %6382 = "comb.xor"(%6380, %6314) : (i1, i1) -> i1
        %6383 = "comb.concat"(%6313, %arg8) : (i2, i1) -> i3
        %6384 = "comb.and"(%6346, %6370) : (i1, i1) -> i1
        %6385 = "comb.and"(%6352, %6384) : (i1, i1) -> i1
        %6386 = "comb.xor"(%arg5, %6314) : (i1, i1) -> i1
        %6387 = "comb.and"(%6386, %6385) : (i1, i1) -> i1
        %6388 = "comb.and"(%arg7, %6387) : (i1, i1) -> i1
        %6389 = "comb.mux"(%6388, %6383, %6381) : (i1, i3, i3) -> i3
        %6390 = "comb.xor"(%6388, %6314) : (i1, i1) -> i1
        %6391 = "comb.and"(%6385, %arg5) : (i1, i1) -> i1
        %6392 = "comb.mux"(%6391, %6317, %6389) : (i1, i3, i3) -> i3
        %6393 = "comb.xor"(%6391, %6314) : (i1, i1) -> i1
        %6394 = "comb.and"(%6384, %arg4) : (i1, i1) -> i1
        %6395 = "comb.mux"(%6394, %6316, %6392) : (i1, i3, i3) -> i3
        %6396 = "comb.xor"(%6394, %6314) : (i1, i1) -> i1
        %6397 = "comb.mux"(%6360, %6361, %6365) : (i1, i3, i3) -> i3
        %6398 = "comb.and"(%6344, %6369) : (i1, i1) -> i1
        %6399 = "comb.and"(%6386, %6376) : (i1, i1) -> i1
        %6400 = "comb.and"(%6352, %6398) : (i1, i1) -> i1
        %6401 = "comb.and"(%6351, %6357, %6372) : (i1, i1, i1) -> i1
        %6402 = "comb.or"(%6399, %6400, %6401) : (i1, i1, i1) -> i1
        %6403 = "comb.mux"(%6402, %6397, %6395) : (i1, i3, i3) -> i3
        %6404 = "comb.xor"(%6402, %6314) : (i1, i1) -> i1
        %6405 = "comb.and"(%6398, %arg4) : (i1, i1) -> i1
        %6406 = "comb.mux"(%6405, %6316, %6403) : (i1, i3, i3) -> i3
        %6407 = "comb.xor"(%6405, %6314) : (i1, i1) -> i1
        %6408 = "comb.mux"(%arg3, %6320, %6406) : (i1, i3, i3) -> i3
        %6409 = "comb.xor"(%arg7, %6314) : (i1, i1) -> i1
        %6410 = "comb.and"(%6387, %6409) : (i1, i1) -> i1
        %6411 = "comb.mux"(%6410, %6327, %6408) : (i1, i3, i3) -> i3
        %6412 = "comb.xor"(%6410, %6314) : (i1, i1) -> i1
        %6413 = "comb.and"(%6412, %6369, %6407, %6404, %6396, %6393, %6390, %6382, %6379, %6368) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6414 = "comb.and"(%6326) : (i1) -> i1
        "fsm.return"(%6414) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %6210 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6211 = "hw.constant"() <{value = true}> : () -> i1
        %6212 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6213 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6214 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6215 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6216 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6217 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6218 = "hw.constant"() <{value = true}> : () -> i1
        %6219 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6220 = "comb.xor"(%arg1, %6218) : (i1, i1) -> i1
        %6221 = "seq.initial"() ({
          %6312 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6312) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6222 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6223 = "comb.icmp"(%6308, %6222) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6224 = "seq.compreg"(%6308, %arg0, %6220, %6219, %6221) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6225 = "comb.icmp"(%6224, %6217) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6226 = "comb.and"(%6225, %arg2) : (i1, i1) -> i1
        %6227 = "comb.icmp"(%6224, %6216) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6228 = "comb.icmp"(%6224, %6215) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6229 = "comb.icmp"(%6224, %6214) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6230 = "comb.icmp"(%6224, %6214) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6231 = "comb.icmp"(%6308, %6214) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6232 = "comb.and"(%6230, %6231) : (i1, i1) -> i1
        %6233 = "comb.icmp"(%6224, %6215) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6234 = "comb.icmp"(%6308, %6215) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6235 = "comb.and"(%6233, %6234) : (i1, i1) -> i1
        %6236 = "comb.and"(%6225, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6237 = "comb.and"(%6228, %arg6) : (i1, i1) -> i1
        %6238 = "comb.or"(%arg4, %arg5, %arg3, %6237) : (i1, i1, i1, i1) -> i1
        %6239 = "comb.or"(%6236, %6238) : (i1, i1) -> i1
        %6240 = "comb.xor"(%6238, %6211) : (i1, i1) -> i1
        %6241 = "comb.icmp"(%6224, %6217) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6242 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6243 = "comb.icmp"(%6224, %6216) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6244 = "comb.icmp"(%6224, %6212) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6245 = "comb.icmp"(%6224, %6215) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6246 = "comb.mux"(%6244, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6247 = "comb.mux"(%6244, %6215, %6217) : (i1, i3, i3) -> i3
        %6248 = "comb.icmp"(%6224, %6213) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6249 = "comb.xor"(%arg4, %6211) : (i1, i1) -> i1
        %6250 = "comb.and"(%6241, %6249) : (i1, i1) -> i1
        %6251 = "comb.xor"(%6241, %6211) : (i1, i1) -> i1
        %6252 = "comb.xor"(%6243, %6211) : (i1, i1) -> i1
        %6253 = "comb.xor"(%6244, %6211) : (i1, i1) -> i1
        %6254 = "comb.xor"(%6245, %6211) : (i1, i1) -> i1
        %6255 = "comb.and"(%6254, %6253, %6252, %6251, %6248) : (i1, i1, i1, i1, i1) -> i1
        %6256 = "comb.or"(%6255, %6250) : (i1, i1) -> i1
        %6257 = "comb.mux"(%6256, %arg5, %6246) : (i1, i1, i1) -> i1
        %6258 = "comb.mux"(%6256, %6214, %6247) : (i1, i3, i3) -> i3
        %6259 = "comb.xor"(%6250, %6211) : (i1, i1) -> i1
        %6260 = "comb.xor"(%6242, %6211) : (i1, i1) -> i1
        %6261 = "comb.or"(%6255, %6259, %6260) : (i1, i1, i1) -> i1
        %6262 = "comb.mux"(%6261, %6224, %6215) : (i1, i3, i3) -> i3
        %6263 = "comb.icmp"(%6224, %6214) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6264 = "comb.mux"(%6263, %6224, %6217) : (i1, i3, i3) -> i3
        %6265 = "comb.xor"(%6263, %6211) : (i1, i1) -> i1
        %6266 = "comb.xor"(%arg3, %6211) : (i1, i1) -> i1
        %6267 = "comb.and"(%6251, %6266) : (i1, i1) -> i1
        %6268 = "comb.and"(%6252, %6267) : (i1, i1) -> i1
        %6269 = "comb.and"(%6253, %6268) : (i1, i1) -> i1
        %6270 = "comb.and"(%6245, %6269) : (i1, i1) -> i1
        %6271 = "comb.and"(%6244, %6268) : (i1, i1) -> i1
        %6272 = "comb.or"(%6270, %6271) : (i1, i1) -> i1
        %6273 = "comb.and"(%6249, %6272) : (i1, i1) -> i1
        %6274 = "comb.and"(%6273, %arg5) : (i1, i1) -> i1
        %6275 = "comb.mux"(%6274, %6214, %6264) : (i1, i3, i3) -> i3
        %6276 = "comb.xor"(%6274, %6211) : (i1, i1) -> i1
        %6277 = "comb.and"(%6272, %arg4) : (i1, i1) -> i1
        %6278 = "comb.mux"(%6277, %6213, %6275) : (i1, i3, i3) -> i3
        %6279 = "comb.xor"(%6277, %6211) : (i1, i1) -> i1
        %6280 = "comb.concat"(%6210, %arg8) : (i2, i1) -> i3
        %6281 = "comb.and"(%6243, %6267) : (i1, i1) -> i1
        %6282 = "comb.and"(%6249, %6281) : (i1, i1) -> i1
        %6283 = "comb.xor"(%arg5, %6211) : (i1, i1) -> i1
        %6284 = "comb.and"(%6283, %6282) : (i1, i1) -> i1
        %6285 = "comb.and"(%arg7, %6284) : (i1, i1) -> i1
        %6286 = "comb.mux"(%6285, %6280, %6278) : (i1, i3, i3) -> i3
        %6287 = "comb.xor"(%6285, %6211) : (i1, i1) -> i1
        %6288 = "comb.and"(%6282, %arg5) : (i1, i1) -> i1
        %6289 = "comb.mux"(%6288, %6214, %6286) : (i1, i3, i3) -> i3
        %6290 = "comb.xor"(%6288, %6211) : (i1, i1) -> i1
        %6291 = "comb.and"(%6281, %arg4) : (i1, i1) -> i1
        %6292 = "comb.mux"(%6291, %6213, %6289) : (i1, i3, i3) -> i3
        %6293 = "comb.xor"(%6291, %6211) : (i1, i1) -> i1
        %6294 = "comb.mux"(%6257, %6258, %6262) : (i1, i3, i3) -> i3
        %6295 = "comb.and"(%6241, %6266) : (i1, i1) -> i1
        %6296 = "comb.and"(%6283, %6273) : (i1, i1) -> i1
        %6297 = "comb.and"(%6249, %6295) : (i1, i1) -> i1
        %6298 = "comb.and"(%6248, %6254, %6269) : (i1, i1, i1) -> i1
        %6299 = "comb.or"(%6296, %6297, %6298) : (i1, i1, i1) -> i1
        %6300 = "comb.mux"(%6299, %6294, %6292) : (i1, i3, i3) -> i3
        %6301 = "comb.xor"(%6299, %6211) : (i1, i1) -> i1
        %6302 = "comb.and"(%6295, %arg4) : (i1, i1) -> i1
        %6303 = "comb.mux"(%6302, %6213, %6300) : (i1, i3, i3) -> i3
        %6304 = "comb.xor"(%6302, %6211) : (i1, i1) -> i1
        %6305 = "comb.mux"(%arg3, %6217, %6303) : (i1, i3, i3) -> i3
        %6306 = "comb.xor"(%arg7, %6211) : (i1, i1) -> i1
        %6307 = "comb.and"(%6284, %6306) : (i1, i1) -> i1
        %6308 = "comb.mux"(%6307, %6224, %6305) : (i1, i3, i3) -> i3
        %6309 = "comb.xor"(%6307, %6211) : (i1, i1) -> i1
        %6310 = "comb.and"(%6309, %6266, %6304, %6301, %6293, %6290, %6287, %6279, %6276, %6265) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6311 = "comb.and"(%6223) : (i1) -> i1
        "fsm.return"(%6311) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %6107 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6108 = "hw.constant"() <{value = true}> : () -> i1
        %6109 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6110 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6111 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6112 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6113 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6114 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6115 = "hw.constant"() <{value = true}> : () -> i1
        %6116 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6117 = "comb.xor"(%arg1, %6115) : (i1, i1) -> i1
        %6118 = "seq.initial"() ({
          %6209 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6209) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6119 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6120 = "comb.icmp"(%6205, %6119) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6121 = "seq.compreg"(%6205, %arg0, %6117, %6116, %6118) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6122 = "comb.icmp"(%6121, %6114) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6123 = "comb.and"(%6122, %arg2) : (i1, i1) -> i1
        %6124 = "comb.icmp"(%6121, %6113) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6125 = "comb.icmp"(%6121, %6112) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6126 = "comb.icmp"(%6121, %6111) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6127 = "comb.icmp"(%6121, %6111) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6128 = "comb.icmp"(%6205, %6111) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6129 = "comb.and"(%6127, %6128) : (i1, i1) -> i1
        %6130 = "comb.icmp"(%6121, %6112) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6131 = "comb.icmp"(%6205, %6112) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6132 = "comb.and"(%6130, %6131) : (i1, i1) -> i1
        %6133 = "comb.and"(%6122, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6134 = "comb.and"(%6125, %arg6) : (i1, i1) -> i1
        %6135 = "comb.or"(%arg4, %arg5, %arg3, %6134) : (i1, i1, i1, i1) -> i1
        %6136 = "comb.or"(%6133, %6135) : (i1, i1) -> i1
        %6137 = "comb.xor"(%6135, %6108) : (i1, i1) -> i1
        %6138 = "comb.icmp"(%6121, %6114) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6139 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6140 = "comb.icmp"(%6121, %6113) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6141 = "comb.icmp"(%6121, %6109) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6142 = "comb.icmp"(%6121, %6112) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6143 = "comb.mux"(%6141, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6144 = "comb.mux"(%6141, %6112, %6114) : (i1, i3, i3) -> i3
        %6145 = "comb.icmp"(%6121, %6110) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6146 = "comb.xor"(%arg4, %6108) : (i1, i1) -> i1
        %6147 = "comb.and"(%6138, %6146) : (i1, i1) -> i1
        %6148 = "comb.xor"(%6138, %6108) : (i1, i1) -> i1
        %6149 = "comb.xor"(%6140, %6108) : (i1, i1) -> i1
        %6150 = "comb.xor"(%6141, %6108) : (i1, i1) -> i1
        %6151 = "comb.xor"(%6142, %6108) : (i1, i1) -> i1
        %6152 = "comb.and"(%6151, %6150, %6149, %6148, %6145) : (i1, i1, i1, i1, i1) -> i1
        %6153 = "comb.or"(%6152, %6147) : (i1, i1) -> i1
        %6154 = "comb.mux"(%6153, %arg5, %6143) : (i1, i1, i1) -> i1
        %6155 = "comb.mux"(%6153, %6111, %6144) : (i1, i3, i3) -> i3
        %6156 = "comb.xor"(%6147, %6108) : (i1, i1) -> i1
        %6157 = "comb.xor"(%6139, %6108) : (i1, i1) -> i1
        %6158 = "comb.or"(%6152, %6156, %6157) : (i1, i1, i1) -> i1
        %6159 = "comb.mux"(%6158, %6121, %6112) : (i1, i3, i3) -> i3
        %6160 = "comb.icmp"(%6121, %6111) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6161 = "comb.mux"(%6160, %6121, %6114) : (i1, i3, i3) -> i3
        %6162 = "comb.xor"(%6160, %6108) : (i1, i1) -> i1
        %6163 = "comb.xor"(%arg3, %6108) : (i1, i1) -> i1
        %6164 = "comb.and"(%6148, %6163) : (i1, i1) -> i1
        %6165 = "comb.and"(%6149, %6164) : (i1, i1) -> i1
        %6166 = "comb.and"(%6150, %6165) : (i1, i1) -> i1
        %6167 = "comb.and"(%6142, %6166) : (i1, i1) -> i1
        %6168 = "comb.and"(%6141, %6165) : (i1, i1) -> i1
        %6169 = "comb.or"(%6167, %6168) : (i1, i1) -> i1
        %6170 = "comb.and"(%6146, %6169) : (i1, i1) -> i1
        %6171 = "comb.and"(%6170, %arg5) : (i1, i1) -> i1
        %6172 = "comb.mux"(%6171, %6111, %6161) : (i1, i3, i3) -> i3
        %6173 = "comb.xor"(%6171, %6108) : (i1, i1) -> i1
        %6174 = "comb.and"(%6169, %arg4) : (i1, i1) -> i1
        %6175 = "comb.mux"(%6174, %6110, %6172) : (i1, i3, i3) -> i3
        %6176 = "comb.xor"(%6174, %6108) : (i1, i1) -> i1
        %6177 = "comb.concat"(%6107, %arg8) : (i2, i1) -> i3
        %6178 = "comb.and"(%6140, %6164) : (i1, i1) -> i1
        %6179 = "comb.and"(%6146, %6178) : (i1, i1) -> i1
        %6180 = "comb.xor"(%arg5, %6108) : (i1, i1) -> i1
        %6181 = "comb.and"(%6180, %6179) : (i1, i1) -> i1
        %6182 = "comb.and"(%arg7, %6181) : (i1, i1) -> i1
        %6183 = "comb.mux"(%6182, %6177, %6175) : (i1, i3, i3) -> i3
        %6184 = "comb.xor"(%6182, %6108) : (i1, i1) -> i1
        %6185 = "comb.and"(%6179, %arg5) : (i1, i1) -> i1
        %6186 = "comb.mux"(%6185, %6111, %6183) : (i1, i3, i3) -> i3
        %6187 = "comb.xor"(%6185, %6108) : (i1, i1) -> i1
        %6188 = "comb.and"(%6178, %arg4) : (i1, i1) -> i1
        %6189 = "comb.mux"(%6188, %6110, %6186) : (i1, i3, i3) -> i3
        %6190 = "comb.xor"(%6188, %6108) : (i1, i1) -> i1
        %6191 = "comb.mux"(%6154, %6155, %6159) : (i1, i3, i3) -> i3
        %6192 = "comb.and"(%6138, %6163) : (i1, i1) -> i1
        %6193 = "comb.and"(%6180, %6170) : (i1, i1) -> i1
        %6194 = "comb.and"(%6146, %6192) : (i1, i1) -> i1
        %6195 = "comb.and"(%6145, %6151, %6166) : (i1, i1, i1) -> i1
        %6196 = "comb.or"(%6193, %6194, %6195) : (i1, i1, i1) -> i1
        %6197 = "comb.mux"(%6196, %6191, %6189) : (i1, i3, i3) -> i3
        %6198 = "comb.xor"(%6196, %6108) : (i1, i1) -> i1
        %6199 = "comb.and"(%6192, %arg4) : (i1, i1) -> i1
        %6200 = "comb.mux"(%6199, %6110, %6197) : (i1, i3, i3) -> i3
        %6201 = "comb.xor"(%6199, %6108) : (i1, i1) -> i1
        %6202 = "comb.mux"(%arg3, %6114, %6200) : (i1, i3, i3) -> i3
        %6203 = "comb.xor"(%arg7, %6108) : (i1, i1) -> i1
        %6204 = "comb.and"(%6181, %6203) : (i1, i1) -> i1
        %6205 = "comb.mux"(%6204, %6121, %6202) : (i1, i3, i3) -> i3
        %6206 = "comb.xor"(%6204, %6108) : (i1, i1) -> i1
        %6207 = "comb.and"(%6206, %6163, %6201, %6198, %6190, %6187, %6184, %6176, %6173, %6162) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6208 = "comb.and"(%6120) : (i1) -> i1
        "fsm.return"(%6208) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %6004 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %6005 = "hw.constant"() <{value = true}> : () -> i1
        %6006 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %6007 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %6008 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %6009 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6010 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %6011 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6012 = "hw.constant"() <{value = true}> : () -> i1
        %6013 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6014 = "comb.xor"(%arg1, %6012) : (i1, i1) -> i1
        %6015 = "seq.initial"() ({
          %6106 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%6106) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %6016 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %6017 = "comb.icmp"(%6102, %6016) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6018 = "seq.compreg"(%6102, %arg0, %6014, %6013, %6015) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %6019 = "comb.icmp"(%6018, %6011) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %6020 = "comb.and"(%6019, %arg2) : (i1, i1) -> i1
        %6021 = "comb.icmp"(%6018, %6010) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6022 = "comb.icmp"(%6018, %6009) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6023 = "comb.icmp"(%6018, %6008) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6024 = "comb.icmp"(%6018, %6008) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6025 = "comb.icmp"(%6102, %6008) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6026 = "comb.and"(%6024, %6025) : (i1, i1) -> i1
        %6027 = "comb.icmp"(%6018, %6009) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %6028 = "comb.icmp"(%6102, %6009) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %6029 = "comb.and"(%6027, %6028) : (i1, i1) -> i1
        %6030 = "comb.and"(%6019, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %6031 = "comb.and"(%6022, %arg6) : (i1, i1) -> i1
        %6032 = "comb.or"(%arg4, %arg5, %arg3, %6031) : (i1, i1, i1, i1) -> i1
        %6033 = "comb.or"(%6030, %6032) : (i1, i1) -> i1
        %6034 = "comb.xor"(%6032, %6005) : (i1, i1) -> i1
        %6035 = "comb.icmp"(%6018, %6011) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6036 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %6037 = "comb.icmp"(%6018, %6010) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6038 = "comb.icmp"(%6018, %6006) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6039 = "comb.icmp"(%6018, %6009) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6040 = "comb.mux"(%6038, %arg8, %arg6) : (i1, i1, i1) -> i1
        %6041 = "comb.mux"(%6038, %6009, %6011) : (i1, i3, i3) -> i3
        %6042 = "comb.icmp"(%6018, %6007) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6043 = "comb.xor"(%arg4, %6005) : (i1, i1) -> i1
        %6044 = "comb.and"(%6035, %6043) : (i1, i1) -> i1
        %6045 = "comb.xor"(%6035, %6005) : (i1, i1) -> i1
        %6046 = "comb.xor"(%6037, %6005) : (i1, i1) -> i1
        %6047 = "comb.xor"(%6038, %6005) : (i1, i1) -> i1
        %6048 = "comb.xor"(%6039, %6005) : (i1, i1) -> i1
        %6049 = "comb.and"(%6048, %6047, %6046, %6045, %6042) : (i1, i1, i1, i1, i1) -> i1
        %6050 = "comb.or"(%6049, %6044) : (i1, i1) -> i1
        %6051 = "comb.mux"(%6050, %arg5, %6040) : (i1, i1, i1) -> i1
        %6052 = "comb.mux"(%6050, %6008, %6041) : (i1, i3, i3) -> i3
        %6053 = "comb.xor"(%6044, %6005) : (i1, i1) -> i1
        %6054 = "comb.xor"(%6036, %6005) : (i1, i1) -> i1
        %6055 = "comb.or"(%6049, %6053, %6054) : (i1, i1, i1) -> i1
        %6056 = "comb.mux"(%6055, %6018, %6009) : (i1, i3, i3) -> i3
        %6057 = "comb.icmp"(%6018, %6008) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %6058 = "comb.mux"(%6057, %6018, %6011) : (i1, i3, i3) -> i3
        %6059 = "comb.xor"(%6057, %6005) : (i1, i1) -> i1
        %6060 = "comb.xor"(%arg3, %6005) : (i1, i1) -> i1
        %6061 = "comb.and"(%6045, %6060) : (i1, i1) -> i1
        %6062 = "comb.and"(%6046, %6061) : (i1, i1) -> i1
        %6063 = "comb.and"(%6047, %6062) : (i1, i1) -> i1
        %6064 = "comb.and"(%6039, %6063) : (i1, i1) -> i1
        %6065 = "comb.and"(%6038, %6062) : (i1, i1) -> i1
        %6066 = "comb.or"(%6064, %6065) : (i1, i1) -> i1
        %6067 = "comb.and"(%6043, %6066) : (i1, i1) -> i1
        %6068 = "comb.and"(%6067, %arg5) : (i1, i1) -> i1
        %6069 = "comb.mux"(%6068, %6008, %6058) : (i1, i3, i3) -> i3
        %6070 = "comb.xor"(%6068, %6005) : (i1, i1) -> i1
        %6071 = "comb.and"(%6066, %arg4) : (i1, i1) -> i1
        %6072 = "comb.mux"(%6071, %6007, %6069) : (i1, i3, i3) -> i3
        %6073 = "comb.xor"(%6071, %6005) : (i1, i1) -> i1
        %6074 = "comb.concat"(%6004, %arg8) : (i2, i1) -> i3
        %6075 = "comb.and"(%6037, %6061) : (i1, i1) -> i1
        %6076 = "comb.and"(%6043, %6075) : (i1, i1) -> i1
        %6077 = "comb.xor"(%arg5, %6005) : (i1, i1) -> i1
        %6078 = "comb.and"(%6077, %6076) : (i1, i1) -> i1
        %6079 = "comb.and"(%arg7, %6078) : (i1, i1) -> i1
        %6080 = "comb.mux"(%6079, %6074, %6072) : (i1, i3, i3) -> i3
        %6081 = "comb.xor"(%6079, %6005) : (i1, i1) -> i1
        %6082 = "comb.and"(%6076, %arg5) : (i1, i1) -> i1
        %6083 = "comb.mux"(%6082, %6008, %6080) : (i1, i3, i3) -> i3
        %6084 = "comb.xor"(%6082, %6005) : (i1, i1) -> i1
        %6085 = "comb.and"(%6075, %arg4) : (i1, i1) -> i1
        %6086 = "comb.mux"(%6085, %6007, %6083) : (i1, i3, i3) -> i3
        %6087 = "comb.xor"(%6085, %6005) : (i1, i1) -> i1
        %6088 = "comb.mux"(%6051, %6052, %6056) : (i1, i3, i3) -> i3
        %6089 = "comb.and"(%6035, %6060) : (i1, i1) -> i1
        %6090 = "comb.and"(%6077, %6067) : (i1, i1) -> i1
        %6091 = "comb.and"(%6043, %6089) : (i1, i1) -> i1
        %6092 = "comb.and"(%6042, %6048, %6063) : (i1, i1, i1) -> i1
        %6093 = "comb.or"(%6090, %6091, %6092) : (i1, i1, i1) -> i1
        %6094 = "comb.mux"(%6093, %6088, %6086) : (i1, i3, i3) -> i3
        %6095 = "comb.xor"(%6093, %6005) : (i1, i1) -> i1
        %6096 = "comb.and"(%6089, %arg4) : (i1, i1) -> i1
        %6097 = "comb.mux"(%6096, %6007, %6094) : (i1, i3, i3) -> i3
        %6098 = "comb.xor"(%6096, %6005) : (i1, i1) -> i1
        %6099 = "comb.mux"(%arg3, %6011, %6097) : (i1, i3, i3) -> i3
        %6100 = "comb.xor"(%arg7, %6005) : (i1, i1) -> i1
        %6101 = "comb.and"(%6078, %6100) : (i1, i1) -> i1
        %6102 = "comb.mux"(%6101, %6018, %6099) : (i1, i3, i3) -> i3
        %6103 = "comb.xor"(%6101, %6005) : (i1, i1) -> i1
        %6104 = "comb.and"(%6103, %6060, %6098, %6095, %6087, %6084, %6081, %6073, %6070, %6059) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %6105 = "comb.and"(%6017) : (i1) -> i1
        "fsm.return"(%6105) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_6"}> ({
      %5983 = "hw.constant"() <{value = true}> : () -> i1
      %5984 = "hw.constant"() <{value = false}> : () -> i1
      %5985 = "hw.constant"() <{value = false}> : () -> i1
      %5986 = "hw.constant"() <{value = false}> : () -> i1
      %5987 = "hw.constant"() <{value = false}> : () -> i1
      %5988 = "hw.constant"() <{value = false}> : () -> i1
      %5989 = "hw.constant"() <{value = false}> : () -> i1
      %5990 = "hw.constant"() <{value = false}> : () -> i1
      %5991 = "comb.or"(%arg4, %arg5, %arg3, %5990) : (i1, i1, i1, i1) -> i1
      %5992 = "comb.xor"(%5991, %5983) : (i1, i1) -> i1
      %5993 = "hw.constant"() <{value = true}> : () -> i1
      %5994 = "comb.xor"(%arg3, %5983) : (i1, i1) -> i1
      %5995 = "hw.constant"() <{value = true}> : () -> i1
      %5996 = "hw.constant"() <{value = true}> : () -> i1
      %5997 = "hw.constant"() <{value = true}> : () -> i1
      %5998 = "hw.constant"() <{value = true}> : () -> i1
      %5999 = "hw.constant"() <{value = true}> : () -> i1
      %6000 = "hw.constant"() <{value = true}> : () -> i1
      %6001 = "hw.constant"() <{value = true}> : () -> i1
      %6002 = "hw.constant"() <{value = true}> : () -> i1
      %6003 = "comb.and"(%5994, %6001, %6000, %5999, %5998, %6002, %5997, %5995, %5996, %5993) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      "fsm.output"(%5984, %5985, %5986, %5987, %5991, %5992, %5989, %5988, %6003) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %5880 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5881 = "hw.constant"() <{value = true}> : () -> i1
        %5882 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5883 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5884 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5885 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5886 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5887 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5888 = "hw.constant"() <{value = true}> : () -> i1
        %5889 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5890 = "comb.xor"(%arg1, %5888) : (i1, i1) -> i1
        %5891 = "seq.initial"() ({
          %5982 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5982) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5892 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %5893 = "comb.icmp"(%5978, %5892) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5894 = "seq.compreg"(%5978, %arg0, %5890, %5889, %5891) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5895 = "comb.icmp"(%5894, %5887) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5896 = "comb.and"(%5895, %arg2) : (i1, i1) -> i1
        %5897 = "comb.icmp"(%5894, %5886) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5898 = "comb.icmp"(%5894, %5885) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5899 = "comb.icmp"(%5894, %5884) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5900 = "comb.icmp"(%5894, %5884) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5901 = "comb.icmp"(%5978, %5884) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5902 = "comb.and"(%5900, %5901) : (i1, i1) -> i1
        %5903 = "comb.icmp"(%5894, %5885) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5904 = "comb.icmp"(%5978, %5885) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5905 = "comb.and"(%5903, %5904) : (i1, i1) -> i1
        %5906 = "comb.and"(%5895, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5907 = "comb.and"(%5898, %arg6) : (i1, i1) -> i1
        %5908 = "comb.or"(%arg4, %arg5, %arg3, %5907) : (i1, i1, i1, i1) -> i1
        %5909 = "comb.or"(%5906, %5908) : (i1, i1) -> i1
        %5910 = "comb.xor"(%5908, %5881) : (i1, i1) -> i1
        %5911 = "comb.icmp"(%5894, %5887) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5912 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5913 = "comb.icmp"(%5894, %5886) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5914 = "comb.icmp"(%5894, %5882) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5915 = "comb.icmp"(%5894, %5885) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5916 = "comb.mux"(%5914, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5917 = "comb.mux"(%5914, %5885, %5887) : (i1, i3, i3) -> i3
        %5918 = "comb.icmp"(%5894, %5883) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5919 = "comb.xor"(%arg4, %5881) : (i1, i1) -> i1
        %5920 = "comb.and"(%5911, %5919) : (i1, i1) -> i1
        %5921 = "comb.xor"(%5911, %5881) : (i1, i1) -> i1
        %5922 = "comb.xor"(%5913, %5881) : (i1, i1) -> i1
        %5923 = "comb.xor"(%5914, %5881) : (i1, i1) -> i1
        %5924 = "comb.xor"(%5915, %5881) : (i1, i1) -> i1
        %5925 = "comb.and"(%5924, %5923, %5922, %5921, %5918) : (i1, i1, i1, i1, i1) -> i1
        %5926 = "comb.or"(%5925, %5920) : (i1, i1) -> i1
        %5927 = "comb.mux"(%5926, %arg5, %5916) : (i1, i1, i1) -> i1
        %5928 = "comb.mux"(%5926, %5884, %5917) : (i1, i3, i3) -> i3
        %5929 = "comb.xor"(%5920, %5881) : (i1, i1) -> i1
        %5930 = "comb.xor"(%5912, %5881) : (i1, i1) -> i1
        %5931 = "comb.or"(%5925, %5929, %5930) : (i1, i1, i1) -> i1
        %5932 = "comb.mux"(%5931, %5894, %5885) : (i1, i3, i3) -> i3
        %5933 = "comb.icmp"(%5894, %5884) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5934 = "comb.mux"(%5933, %5894, %5887) : (i1, i3, i3) -> i3
        %5935 = "comb.xor"(%5933, %5881) : (i1, i1) -> i1
        %5936 = "comb.xor"(%arg3, %5881) : (i1, i1) -> i1
        %5937 = "comb.and"(%5921, %5936) : (i1, i1) -> i1
        %5938 = "comb.and"(%5922, %5937) : (i1, i1) -> i1
        %5939 = "comb.and"(%5923, %5938) : (i1, i1) -> i1
        %5940 = "comb.and"(%5915, %5939) : (i1, i1) -> i1
        %5941 = "comb.and"(%5914, %5938) : (i1, i1) -> i1
        %5942 = "comb.or"(%5940, %5941) : (i1, i1) -> i1
        %5943 = "comb.and"(%5919, %5942) : (i1, i1) -> i1
        %5944 = "comb.and"(%5943, %arg5) : (i1, i1) -> i1
        %5945 = "comb.mux"(%5944, %5884, %5934) : (i1, i3, i3) -> i3
        %5946 = "comb.xor"(%5944, %5881) : (i1, i1) -> i1
        %5947 = "comb.and"(%5942, %arg4) : (i1, i1) -> i1
        %5948 = "comb.mux"(%5947, %5883, %5945) : (i1, i3, i3) -> i3
        %5949 = "comb.xor"(%5947, %5881) : (i1, i1) -> i1
        %5950 = "comb.concat"(%5880, %arg8) : (i2, i1) -> i3
        %5951 = "comb.and"(%5913, %5937) : (i1, i1) -> i1
        %5952 = "comb.and"(%5919, %5951) : (i1, i1) -> i1
        %5953 = "comb.xor"(%arg5, %5881) : (i1, i1) -> i1
        %5954 = "comb.and"(%5953, %5952) : (i1, i1) -> i1
        %5955 = "comb.and"(%arg7, %5954) : (i1, i1) -> i1
        %5956 = "comb.mux"(%5955, %5950, %5948) : (i1, i3, i3) -> i3
        %5957 = "comb.xor"(%5955, %5881) : (i1, i1) -> i1
        %5958 = "comb.and"(%5952, %arg5) : (i1, i1) -> i1
        %5959 = "comb.mux"(%5958, %5884, %5956) : (i1, i3, i3) -> i3
        %5960 = "comb.xor"(%5958, %5881) : (i1, i1) -> i1
        %5961 = "comb.and"(%5951, %arg4) : (i1, i1) -> i1
        %5962 = "comb.mux"(%5961, %5883, %5959) : (i1, i3, i3) -> i3
        %5963 = "comb.xor"(%5961, %5881) : (i1, i1) -> i1
        %5964 = "comb.mux"(%5927, %5928, %5932) : (i1, i3, i3) -> i3
        %5965 = "comb.and"(%5911, %5936) : (i1, i1) -> i1
        %5966 = "comb.and"(%5953, %5943) : (i1, i1) -> i1
        %5967 = "comb.and"(%5919, %5965) : (i1, i1) -> i1
        %5968 = "comb.and"(%5918, %5924, %5939) : (i1, i1, i1) -> i1
        %5969 = "comb.or"(%5966, %5967, %5968) : (i1, i1, i1) -> i1
        %5970 = "comb.mux"(%5969, %5964, %5962) : (i1, i3, i3) -> i3
        %5971 = "comb.xor"(%5969, %5881) : (i1, i1) -> i1
        %5972 = "comb.and"(%5965, %arg4) : (i1, i1) -> i1
        %5973 = "comb.mux"(%5972, %5883, %5970) : (i1, i3, i3) -> i3
        %5974 = "comb.xor"(%5972, %5881) : (i1, i1) -> i1
        %5975 = "comb.mux"(%arg3, %5887, %5973) : (i1, i3, i3) -> i3
        %5976 = "comb.xor"(%arg7, %5881) : (i1, i1) -> i1
        %5977 = "comb.and"(%5954, %5976) : (i1, i1) -> i1
        %5978 = "comb.mux"(%5977, %5894, %5975) : (i1, i3, i3) -> i3
        %5979 = "comb.xor"(%5977, %5881) : (i1, i1) -> i1
        %5980 = "comb.and"(%5979, %5936, %5974, %5971, %5963, %5960, %5957, %5949, %5946, %5935) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5981 = "comb.and"(%5893) : (i1) -> i1
        "fsm.return"(%5981) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %5777 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5778 = "hw.constant"() <{value = true}> : () -> i1
        %5779 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5780 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5781 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5782 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5783 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5784 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5785 = "hw.constant"() <{value = true}> : () -> i1
        %5786 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5787 = "comb.xor"(%arg1, %5785) : (i1, i1) -> i1
        %5788 = "seq.initial"() ({
          %5879 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5879) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5789 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %5790 = "comb.icmp"(%5875, %5789) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5791 = "seq.compreg"(%5875, %arg0, %5787, %5786, %5788) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5792 = "comb.icmp"(%5791, %5784) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5793 = "comb.and"(%5792, %arg2) : (i1, i1) -> i1
        %5794 = "comb.icmp"(%5791, %5783) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5795 = "comb.icmp"(%5791, %5782) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5796 = "comb.icmp"(%5791, %5781) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5797 = "comb.icmp"(%5791, %5781) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5798 = "comb.icmp"(%5875, %5781) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5799 = "comb.and"(%5797, %5798) : (i1, i1) -> i1
        %5800 = "comb.icmp"(%5791, %5782) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5801 = "comb.icmp"(%5875, %5782) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5802 = "comb.and"(%5800, %5801) : (i1, i1) -> i1
        %5803 = "comb.and"(%5792, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5804 = "comb.and"(%5795, %arg6) : (i1, i1) -> i1
        %5805 = "comb.or"(%arg4, %arg5, %arg3, %5804) : (i1, i1, i1, i1) -> i1
        %5806 = "comb.or"(%5803, %5805) : (i1, i1) -> i1
        %5807 = "comb.xor"(%5805, %5778) : (i1, i1) -> i1
        %5808 = "comb.icmp"(%5791, %5784) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5809 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5810 = "comb.icmp"(%5791, %5783) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5811 = "comb.icmp"(%5791, %5779) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5812 = "comb.icmp"(%5791, %5782) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5813 = "comb.mux"(%5811, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5814 = "comb.mux"(%5811, %5782, %5784) : (i1, i3, i3) -> i3
        %5815 = "comb.icmp"(%5791, %5780) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5816 = "comb.xor"(%arg4, %5778) : (i1, i1) -> i1
        %5817 = "comb.and"(%5808, %5816) : (i1, i1) -> i1
        %5818 = "comb.xor"(%5808, %5778) : (i1, i1) -> i1
        %5819 = "comb.xor"(%5810, %5778) : (i1, i1) -> i1
        %5820 = "comb.xor"(%5811, %5778) : (i1, i1) -> i1
        %5821 = "comb.xor"(%5812, %5778) : (i1, i1) -> i1
        %5822 = "comb.and"(%5821, %5820, %5819, %5818, %5815) : (i1, i1, i1, i1, i1) -> i1
        %5823 = "comb.or"(%5822, %5817) : (i1, i1) -> i1
        %5824 = "comb.mux"(%5823, %arg5, %5813) : (i1, i1, i1) -> i1
        %5825 = "comb.mux"(%5823, %5781, %5814) : (i1, i3, i3) -> i3
        %5826 = "comb.xor"(%5817, %5778) : (i1, i1) -> i1
        %5827 = "comb.xor"(%5809, %5778) : (i1, i1) -> i1
        %5828 = "comb.or"(%5822, %5826, %5827) : (i1, i1, i1) -> i1
        %5829 = "comb.mux"(%5828, %5791, %5782) : (i1, i3, i3) -> i3
        %5830 = "comb.icmp"(%5791, %5781) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5831 = "comb.mux"(%5830, %5791, %5784) : (i1, i3, i3) -> i3
        %5832 = "comb.xor"(%5830, %5778) : (i1, i1) -> i1
        %5833 = "comb.xor"(%arg3, %5778) : (i1, i1) -> i1
        %5834 = "comb.and"(%5818, %5833) : (i1, i1) -> i1
        %5835 = "comb.and"(%5819, %5834) : (i1, i1) -> i1
        %5836 = "comb.and"(%5820, %5835) : (i1, i1) -> i1
        %5837 = "comb.and"(%5812, %5836) : (i1, i1) -> i1
        %5838 = "comb.and"(%5811, %5835) : (i1, i1) -> i1
        %5839 = "comb.or"(%5837, %5838) : (i1, i1) -> i1
        %5840 = "comb.and"(%5816, %5839) : (i1, i1) -> i1
        %5841 = "comb.and"(%5840, %arg5) : (i1, i1) -> i1
        %5842 = "comb.mux"(%5841, %5781, %5831) : (i1, i3, i3) -> i3
        %5843 = "comb.xor"(%5841, %5778) : (i1, i1) -> i1
        %5844 = "comb.and"(%5839, %arg4) : (i1, i1) -> i1
        %5845 = "comb.mux"(%5844, %5780, %5842) : (i1, i3, i3) -> i3
        %5846 = "comb.xor"(%5844, %5778) : (i1, i1) -> i1
        %5847 = "comb.concat"(%5777, %arg8) : (i2, i1) -> i3
        %5848 = "comb.and"(%5810, %5834) : (i1, i1) -> i1
        %5849 = "comb.and"(%5816, %5848) : (i1, i1) -> i1
        %5850 = "comb.xor"(%arg5, %5778) : (i1, i1) -> i1
        %5851 = "comb.and"(%5850, %5849) : (i1, i1) -> i1
        %5852 = "comb.and"(%arg7, %5851) : (i1, i1) -> i1
        %5853 = "comb.mux"(%5852, %5847, %5845) : (i1, i3, i3) -> i3
        %5854 = "comb.xor"(%5852, %5778) : (i1, i1) -> i1
        %5855 = "comb.and"(%5849, %arg5) : (i1, i1) -> i1
        %5856 = "comb.mux"(%5855, %5781, %5853) : (i1, i3, i3) -> i3
        %5857 = "comb.xor"(%5855, %5778) : (i1, i1) -> i1
        %5858 = "comb.and"(%5848, %arg4) : (i1, i1) -> i1
        %5859 = "comb.mux"(%5858, %5780, %5856) : (i1, i3, i3) -> i3
        %5860 = "comb.xor"(%5858, %5778) : (i1, i1) -> i1
        %5861 = "comb.mux"(%5824, %5825, %5829) : (i1, i3, i3) -> i3
        %5862 = "comb.and"(%5808, %5833) : (i1, i1) -> i1
        %5863 = "comb.and"(%5850, %5840) : (i1, i1) -> i1
        %5864 = "comb.and"(%5816, %5862) : (i1, i1) -> i1
        %5865 = "comb.and"(%5815, %5821, %5836) : (i1, i1, i1) -> i1
        %5866 = "comb.or"(%5863, %5864, %5865) : (i1, i1, i1) -> i1
        %5867 = "comb.mux"(%5866, %5861, %5859) : (i1, i3, i3) -> i3
        %5868 = "comb.xor"(%5866, %5778) : (i1, i1) -> i1
        %5869 = "comb.and"(%5862, %arg4) : (i1, i1) -> i1
        %5870 = "comb.mux"(%5869, %5780, %5867) : (i1, i3, i3) -> i3
        %5871 = "comb.xor"(%5869, %5778) : (i1, i1) -> i1
        %5872 = "comb.mux"(%arg3, %5784, %5870) : (i1, i3, i3) -> i3
        %5873 = "comb.xor"(%arg7, %5778) : (i1, i1) -> i1
        %5874 = "comb.and"(%5851, %5873) : (i1, i1) -> i1
        %5875 = "comb.mux"(%5874, %5791, %5872) : (i1, i3, i3) -> i3
        %5876 = "comb.xor"(%5874, %5778) : (i1, i1) -> i1
        %5877 = "comb.and"(%5876, %5833, %5871, %5868, %5860, %5857, %5854, %5846, %5843, %5832) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5878 = "comb.and"(%5790) : (i1) -> i1
        "fsm.return"(%5878) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %5674 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5675 = "hw.constant"() <{value = true}> : () -> i1
        %5676 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5677 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5678 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5679 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5680 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5681 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5682 = "hw.constant"() <{value = true}> : () -> i1
        %5683 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5684 = "comb.xor"(%arg1, %5682) : (i1, i1) -> i1
        %5685 = "seq.initial"() ({
          %5776 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5776) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5686 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5687 = "comb.icmp"(%5772, %5686) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5688 = "seq.compreg"(%5772, %arg0, %5684, %5683, %5685) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5689 = "comb.icmp"(%5688, %5681) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5690 = "comb.and"(%5689, %arg2) : (i1, i1) -> i1
        %5691 = "comb.icmp"(%5688, %5680) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5692 = "comb.icmp"(%5688, %5679) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5693 = "comb.icmp"(%5688, %5678) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5694 = "comb.icmp"(%5688, %5678) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5695 = "comb.icmp"(%5772, %5678) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5696 = "comb.and"(%5694, %5695) : (i1, i1) -> i1
        %5697 = "comb.icmp"(%5688, %5679) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5698 = "comb.icmp"(%5772, %5679) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5699 = "comb.and"(%5697, %5698) : (i1, i1) -> i1
        %5700 = "comb.and"(%5689, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5701 = "comb.and"(%5692, %arg6) : (i1, i1) -> i1
        %5702 = "comb.or"(%arg4, %arg5, %arg3, %5701) : (i1, i1, i1, i1) -> i1
        %5703 = "comb.or"(%5700, %5702) : (i1, i1) -> i1
        %5704 = "comb.xor"(%5702, %5675) : (i1, i1) -> i1
        %5705 = "comb.icmp"(%5688, %5681) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5706 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5707 = "comb.icmp"(%5688, %5680) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5708 = "comb.icmp"(%5688, %5676) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5709 = "comb.icmp"(%5688, %5679) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5710 = "comb.mux"(%5708, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5711 = "comb.mux"(%5708, %5679, %5681) : (i1, i3, i3) -> i3
        %5712 = "comb.icmp"(%5688, %5677) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5713 = "comb.xor"(%arg4, %5675) : (i1, i1) -> i1
        %5714 = "comb.and"(%5705, %5713) : (i1, i1) -> i1
        %5715 = "comb.xor"(%5705, %5675) : (i1, i1) -> i1
        %5716 = "comb.xor"(%5707, %5675) : (i1, i1) -> i1
        %5717 = "comb.xor"(%5708, %5675) : (i1, i1) -> i1
        %5718 = "comb.xor"(%5709, %5675) : (i1, i1) -> i1
        %5719 = "comb.and"(%5718, %5717, %5716, %5715, %5712) : (i1, i1, i1, i1, i1) -> i1
        %5720 = "comb.or"(%5719, %5714) : (i1, i1) -> i1
        %5721 = "comb.mux"(%5720, %arg5, %5710) : (i1, i1, i1) -> i1
        %5722 = "comb.mux"(%5720, %5678, %5711) : (i1, i3, i3) -> i3
        %5723 = "comb.xor"(%5714, %5675) : (i1, i1) -> i1
        %5724 = "comb.xor"(%5706, %5675) : (i1, i1) -> i1
        %5725 = "comb.or"(%5719, %5723, %5724) : (i1, i1, i1) -> i1
        %5726 = "comb.mux"(%5725, %5688, %5679) : (i1, i3, i3) -> i3
        %5727 = "comb.icmp"(%5688, %5678) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5728 = "comb.mux"(%5727, %5688, %5681) : (i1, i3, i3) -> i3
        %5729 = "comb.xor"(%5727, %5675) : (i1, i1) -> i1
        %5730 = "comb.xor"(%arg3, %5675) : (i1, i1) -> i1
        %5731 = "comb.and"(%5715, %5730) : (i1, i1) -> i1
        %5732 = "comb.and"(%5716, %5731) : (i1, i1) -> i1
        %5733 = "comb.and"(%5717, %5732) : (i1, i1) -> i1
        %5734 = "comb.and"(%5709, %5733) : (i1, i1) -> i1
        %5735 = "comb.and"(%5708, %5732) : (i1, i1) -> i1
        %5736 = "comb.or"(%5734, %5735) : (i1, i1) -> i1
        %5737 = "comb.and"(%5713, %5736) : (i1, i1) -> i1
        %5738 = "comb.and"(%5737, %arg5) : (i1, i1) -> i1
        %5739 = "comb.mux"(%5738, %5678, %5728) : (i1, i3, i3) -> i3
        %5740 = "comb.xor"(%5738, %5675) : (i1, i1) -> i1
        %5741 = "comb.and"(%5736, %arg4) : (i1, i1) -> i1
        %5742 = "comb.mux"(%5741, %5677, %5739) : (i1, i3, i3) -> i3
        %5743 = "comb.xor"(%5741, %5675) : (i1, i1) -> i1
        %5744 = "comb.concat"(%5674, %arg8) : (i2, i1) -> i3
        %5745 = "comb.and"(%5707, %5731) : (i1, i1) -> i1
        %5746 = "comb.and"(%5713, %5745) : (i1, i1) -> i1
        %5747 = "comb.xor"(%arg5, %5675) : (i1, i1) -> i1
        %5748 = "comb.and"(%5747, %5746) : (i1, i1) -> i1
        %5749 = "comb.and"(%arg7, %5748) : (i1, i1) -> i1
        %5750 = "comb.mux"(%5749, %5744, %5742) : (i1, i3, i3) -> i3
        %5751 = "comb.xor"(%5749, %5675) : (i1, i1) -> i1
        %5752 = "comb.and"(%5746, %arg5) : (i1, i1) -> i1
        %5753 = "comb.mux"(%5752, %5678, %5750) : (i1, i3, i3) -> i3
        %5754 = "comb.xor"(%5752, %5675) : (i1, i1) -> i1
        %5755 = "comb.and"(%5745, %arg4) : (i1, i1) -> i1
        %5756 = "comb.mux"(%5755, %5677, %5753) : (i1, i3, i3) -> i3
        %5757 = "comb.xor"(%5755, %5675) : (i1, i1) -> i1
        %5758 = "comb.mux"(%5721, %5722, %5726) : (i1, i3, i3) -> i3
        %5759 = "comb.and"(%5705, %5730) : (i1, i1) -> i1
        %5760 = "comb.and"(%5747, %5737) : (i1, i1) -> i1
        %5761 = "comb.and"(%5713, %5759) : (i1, i1) -> i1
        %5762 = "comb.and"(%5712, %5718, %5733) : (i1, i1, i1) -> i1
        %5763 = "comb.or"(%5760, %5761, %5762) : (i1, i1, i1) -> i1
        %5764 = "comb.mux"(%5763, %5758, %5756) : (i1, i3, i3) -> i3
        %5765 = "comb.xor"(%5763, %5675) : (i1, i1) -> i1
        %5766 = "comb.and"(%5759, %arg4) : (i1, i1) -> i1
        %5767 = "comb.mux"(%5766, %5677, %5764) : (i1, i3, i3) -> i3
        %5768 = "comb.xor"(%5766, %5675) : (i1, i1) -> i1
        %5769 = "comb.mux"(%arg3, %5681, %5767) : (i1, i3, i3) -> i3
        %5770 = "comb.xor"(%arg7, %5675) : (i1, i1) -> i1
        %5771 = "comb.and"(%5748, %5770) : (i1, i1) -> i1
        %5772 = "comb.mux"(%5771, %5688, %5769) : (i1, i3, i3) -> i3
        %5773 = "comb.xor"(%5771, %5675) : (i1, i1) -> i1
        %5774 = "comb.and"(%5773, %5730, %5768, %5765, %5757, %5754, %5751, %5743, %5740, %5729) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5775 = "comb.and"(%5687) : (i1) -> i1
        "fsm.return"(%5775) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %5571 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5572 = "hw.constant"() <{value = true}> : () -> i1
        %5573 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5574 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5575 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5576 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5577 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5578 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5579 = "hw.constant"() <{value = true}> : () -> i1
        %5580 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5581 = "comb.xor"(%arg1, %5579) : (i1, i1) -> i1
        %5582 = "seq.initial"() ({
          %5673 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5673) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5583 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5584 = "comb.icmp"(%5669, %5583) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5585 = "seq.compreg"(%5669, %arg0, %5581, %5580, %5582) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5586 = "comb.icmp"(%5585, %5578) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5587 = "comb.and"(%5586, %arg2) : (i1, i1) -> i1
        %5588 = "comb.icmp"(%5585, %5577) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5589 = "comb.icmp"(%5585, %5576) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5590 = "comb.icmp"(%5585, %5575) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5591 = "comb.icmp"(%5585, %5575) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5592 = "comb.icmp"(%5669, %5575) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5593 = "comb.and"(%5591, %5592) : (i1, i1) -> i1
        %5594 = "comb.icmp"(%5585, %5576) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5595 = "comb.icmp"(%5669, %5576) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5596 = "comb.and"(%5594, %5595) : (i1, i1) -> i1
        %5597 = "comb.and"(%5586, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5598 = "comb.and"(%5589, %arg6) : (i1, i1) -> i1
        %5599 = "comb.or"(%arg4, %arg5, %arg3, %5598) : (i1, i1, i1, i1) -> i1
        %5600 = "comb.or"(%5597, %5599) : (i1, i1) -> i1
        %5601 = "comb.xor"(%5599, %5572) : (i1, i1) -> i1
        %5602 = "comb.icmp"(%5585, %5578) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5603 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5604 = "comb.icmp"(%5585, %5577) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5605 = "comb.icmp"(%5585, %5573) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5606 = "comb.icmp"(%5585, %5576) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5607 = "comb.mux"(%5605, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5608 = "comb.mux"(%5605, %5576, %5578) : (i1, i3, i3) -> i3
        %5609 = "comb.icmp"(%5585, %5574) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5610 = "comb.xor"(%arg4, %5572) : (i1, i1) -> i1
        %5611 = "comb.and"(%5602, %5610) : (i1, i1) -> i1
        %5612 = "comb.xor"(%5602, %5572) : (i1, i1) -> i1
        %5613 = "comb.xor"(%5604, %5572) : (i1, i1) -> i1
        %5614 = "comb.xor"(%5605, %5572) : (i1, i1) -> i1
        %5615 = "comb.xor"(%5606, %5572) : (i1, i1) -> i1
        %5616 = "comb.and"(%5615, %5614, %5613, %5612, %5609) : (i1, i1, i1, i1, i1) -> i1
        %5617 = "comb.or"(%5616, %5611) : (i1, i1) -> i1
        %5618 = "comb.mux"(%5617, %arg5, %5607) : (i1, i1, i1) -> i1
        %5619 = "comb.mux"(%5617, %5575, %5608) : (i1, i3, i3) -> i3
        %5620 = "comb.xor"(%5611, %5572) : (i1, i1) -> i1
        %5621 = "comb.xor"(%5603, %5572) : (i1, i1) -> i1
        %5622 = "comb.or"(%5616, %5620, %5621) : (i1, i1, i1) -> i1
        %5623 = "comb.mux"(%5622, %5585, %5576) : (i1, i3, i3) -> i3
        %5624 = "comb.icmp"(%5585, %5575) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5625 = "comb.mux"(%5624, %5585, %5578) : (i1, i3, i3) -> i3
        %5626 = "comb.xor"(%5624, %5572) : (i1, i1) -> i1
        %5627 = "comb.xor"(%arg3, %5572) : (i1, i1) -> i1
        %5628 = "comb.and"(%5612, %5627) : (i1, i1) -> i1
        %5629 = "comb.and"(%5613, %5628) : (i1, i1) -> i1
        %5630 = "comb.and"(%5614, %5629) : (i1, i1) -> i1
        %5631 = "comb.and"(%5606, %5630) : (i1, i1) -> i1
        %5632 = "comb.and"(%5605, %5629) : (i1, i1) -> i1
        %5633 = "comb.or"(%5631, %5632) : (i1, i1) -> i1
        %5634 = "comb.and"(%5610, %5633) : (i1, i1) -> i1
        %5635 = "comb.and"(%5634, %arg5) : (i1, i1) -> i1
        %5636 = "comb.mux"(%5635, %5575, %5625) : (i1, i3, i3) -> i3
        %5637 = "comb.xor"(%5635, %5572) : (i1, i1) -> i1
        %5638 = "comb.and"(%5633, %arg4) : (i1, i1) -> i1
        %5639 = "comb.mux"(%5638, %5574, %5636) : (i1, i3, i3) -> i3
        %5640 = "comb.xor"(%5638, %5572) : (i1, i1) -> i1
        %5641 = "comb.concat"(%5571, %arg8) : (i2, i1) -> i3
        %5642 = "comb.and"(%5604, %5628) : (i1, i1) -> i1
        %5643 = "comb.and"(%5610, %5642) : (i1, i1) -> i1
        %5644 = "comb.xor"(%arg5, %5572) : (i1, i1) -> i1
        %5645 = "comb.and"(%5644, %5643) : (i1, i1) -> i1
        %5646 = "comb.and"(%arg7, %5645) : (i1, i1) -> i1
        %5647 = "comb.mux"(%5646, %5641, %5639) : (i1, i3, i3) -> i3
        %5648 = "comb.xor"(%5646, %5572) : (i1, i1) -> i1
        %5649 = "comb.and"(%5643, %arg5) : (i1, i1) -> i1
        %5650 = "comb.mux"(%5649, %5575, %5647) : (i1, i3, i3) -> i3
        %5651 = "comb.xor"(%5649, %5572) : (i1, i1) -> i1
        %5652 = "comb.and"(%5642, %arg4) : (i1, i1) -> i1
        %5653 = "comb.mux"(%5652, %5574, %5650) : (i1, i3, i3) -> i3
        %5654 = "comb.xor"(%5652, %5572) : (i1, i1) -> i1
        %5655 = "comb.mux"(%5618, %5619, %5623) : (i1, i3, i3) -> i3
        %5656 = "comb.and"(%5602, %5627) : (i1, i1) -> i1
        %5657 = "comb.and"(%5644, %5634) : (i1, i1) -> i1
        %5658 = "comb.and"(%5610, %5656) : (i1, i1) -> i1
        %5659 = "comb.and"(%5609, %5615, %5630) : (i1, i1, i1) -> i1
        %5660 = "comb.or"(%5657, %5658, %5659) : (i1, i1, i1) -> i1
        %5661 = "comb.mux"(%5660, %5655, %5653) : (i1, i3, i3) -> i3
        %5662 = "comb.xor"(%5660, %5572) : (i1, i1) -> i1
        %5663 = "comb.and"(%5656, %arg4) : (i1, i1) -> i1
        %5664 = "comb.mux"(%5663, %5574, %5661) : (i1, i3, i3) -> i3
        %5665 = "comb.xor"(%5663, %5572) : (i1, i1) -> i1
        %5666 = "comb.mux"(%arg3, %5578, %5664) : (i1, i3, i3) -> i3
        %5667 = "comb.xor"(%arg7, %5572) : (i1, i1) -> i1
        %5668 = "comb.and"(%5645, %5667) : (i1, i1) -> i1
        %5669 = "comb.mux"(%5668, %5585, %5666) : (i1, i3, i3) -> i3
        %5670 = "comb.xor"(%5668, %5572) : (i1, i1) -> i1
        %5671 = "comb.and"(%5670, %5627, %5665, %5662, %5654, %5651, %5648, %5640, %5637, %5626) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5672 = "comb.and"(%5584) : (i1) -> i1
        "fsm.return"(%5672) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %5468 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5469 = "hw.constant"() <{value = true}> : () -> i1
        %5470 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5471 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5472 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5473 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5474 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5475 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5476 = "hw.constant"() <{value = true}> : () -> i1
        %5477 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5478 = "comb.xor"(%arg1, %5476) : (i1, i1) -> i1
        %5479 = "seq.initial"() ({
          %5570 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5570) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5480 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5481 = "comb.icmp"(%5566, %5480) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5482 = "seq.compreg"(%5566, %arg0, %5478, %5477, %5479) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5483 = "comb.icmp"(%5482, %5475) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5484 = "comb.and"(%5483, %arg2) : (i1, i1) -> i1
        %5485 = "comb.icmp"(%5482, %5474) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5486 = "comb.icmp"(%5482, %5473) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5487 = "comb.icmp"(%5482, %5472) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5488 = "comb.icmp"(%5482, %5472) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5489 = "comb.icmp"(%5566, %5472) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5490 = "comb.and"(%5488, %5489) : (i1, i1) -> i1
        %5491 = "comb.icmp"(%5482, %5473) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5492 = "comb.icmp"(%5566, %5473) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5493 = "comb.and"(%5491, %5492) : (i1, i1) -> i1
        %5494 = "comb.and"(%5483, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5495 = "comb.and"(%5486, %arg6) : (i1, i1) -> i1
        %5496 = "comb.or"(%arg4, %arg5, %arg3, %5495) : (i1, i1, i1, i1) -> i1
        %5497 = "comb.or"(%5494, %5496) : (i1, i1) -> i1
        %5498 = "comb.xor"(%5496, %5469) : (i1, i1) -> i1
        %5499 = "comb.icmp"(%5482, %5475) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5500 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5501 = "comb.icmp"(%5482, %5474) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5502 = "comb.icmp"(%5482, %5470) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5503 = "comb.icmp"(%5482, %5473) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5504 = "comb.mux"(%5502, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5505 = "comb.mux"(%5502, %5473, %5475) : (i1, i3, i3) -> i3
        %5506 = "comb.icmp"(%5482, %5471) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5507 = "comb.xor"(%arg4, %5469) : (i1, i1) -> i1
        %5508 = "comb.and"(%5499, %5507) : (i1, i1) -> i1
        %5509 = "comb.xor"(%5499, %5469) : (i1, i1) -> i1
        %5510 = "comb.xor"(%5501, %5469) : (i1, i1) -> i1
        %5511 = "comb.xor"(%5502, %5469) : (i1, i1) -> i1
        %5512 = "comb.xor"(%5503, %5469) : (i1, i1) -> i1
        %5513 = "comb.and"(%5512, %5511, %5510, %5509, %5506) : (i1, i1, i1, i1, i1) -> i1
        %5514 = "comb.or"(%5513, %5508) : (i1, i1) -> i1
        %5515 = "comb.mux"(%5514, %arg5, %5504) : (i1, i1, i1) -> i1
        %5516 = "comb.mux"(%5514, %5472, %5505) : (i1, i3, i3) -> i3
        %5517 = "comb.xor"(%5508, %5469) : (i1, i1) -> i1
        %5518 = "comb.xor"(%5500, %5469) : (i1, i1) -> i1
        %5519 = "comb.or"(%5513, %5517, %5518) : (i1, i1, i1) -> i1
        %5520 = "comb.mux"(%5519, %5482, %5473) : (i1, i3, i3) -> i3
        %5521 = "comb.icmp"(%5482, %5472) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5522 = "comb.mux"(%5521, %5482, %5475) : (i1, i3, i3) -> i3
        %5523 = "comb.xor"(%5521, %5469) : (i1, i1) -> i1
        %5524 = "comb.xor"(%arg3, %5469) : (i1, i1) -> i1
        %5525 = "comb.and"(%5509, %5524) : (i1, i1) -> i1
        %5526 = "comb.and"(%5510, %5525) : (i1, i1) -> i1
        %5527 = "comb.and"(%5511, %5526) : (i1, i1) -> i1
        %5528 = "comb.and"(%5503, %5527) : (i1, i1) -> i1
        %5529 = "comb.and"(%5502, %5526) : (i1, i1) -> i1
        %5530 = "comb.or"(%5528, %5529) : (i1, i1) -> i1
        %5531 = "comb.and"(%5507, %5530) : (i1, i1) -> i1
        %5532 = "comb.and"(%5531, %arg5) : (i1, i1) -> i1
        %5533 = "comb.mux"(%5532, %5472, %5522) : (i1, i3, i3) -> i3
        %5534 = "comb.xor"(%5532, %5469) : (i1, i1) -> i1
        %5535 = "comb.and"(%5530, %arg4) : (i1, i1) -> i1
        %5536 = "comb.mux"(%5535, %5471, %5533) : (i1, i3, i3) -> i3
        %5537 = "comb.xor"(%5535, %5469) : (i1, i1) -> i1
        %5538 = "comb.concat"(%5468, %arg8) : (i2, i1) -> i3
        %5539 = "comb.and"(%5501, %5525) : (i1, i1) -> i1
        %5540 = "comb.and"(%5507, %5539) : (i1, i1) -> i1
        %5541 = "comb.xor"(%arg5, %5469) : (i1, i1) -> i1
        %5542 = "comb.and"(%5541, %5540) : (i1, i1) -> i1
        %5543 = "comb.and"(%arg7, %5542) : (i1, i1) -> i1
        %5544 = "comb.mux"(%5543, %5538, %5536) : (i1, i3, i3) -> i3
        %5545 = "comb.xor"(%5543, %5469) : (i1, i1) -> i1
        %5546 = "comb.and"(%5540, %arg5) : (i1, i1) -> i1
        %5547 = "comb.mux"(%5546, %5472, %5544) : (i1, i3, i3) -> i3
        %5548 = "comb.xor"(%5546, %5469) : (i1, i1) -> i1
        %5549 = "comb.and"(%5539, %arg4) : (i1, i1) -> i1
        %5550 = "comb.mux"(%5549, %5471, %5547) : (i1, i3, i3) -> i3
        %5551 = "comb.xor"(%5549, %5469) : (i1, i1) -> i1
        %5552 = "comb.mux"(%5515, %5516, %5520) : (i1, i3, i3) -> i3
        %5553 = "comb.and"(%5499, %5524) : (i1, i1) -> i1
        %5554 = "comb.and"(%5541, %5531) : (i1, i1) -> i1
        %5555 = "comb.and"(%5507, %5553) : (i1, i1) -> i1
        %5556 = "comb.and"(%5506, %5512, %5527) : (i1, i1, i1) -> i1
        %5557 = "comb.or"(%5554, %5555, %5556) : (i1, i1, i1) -> i1
        %5558 = "comb.mux"(%5557, %5552, %5550) : (i1, i3, i3) -> i3
        %5559 = "comb.xor"(%5557, %5469) : (i1, i1) -> i1
        %5560 = "comb.and"(%5553, %arg4) : (i1, i1) -> i1
        %5561 = "comb.mux"(%5560, %5471, %5558) : (i1, i3, i3) -> i3
        %5562 = "comb.xor"(%5560, %5469) : (i1, i1) -> i1
        %5563 = "comb.mux"(%arg3, %5475, %5561) : (i1, i3, i3) -> i3
        %5564 = "comb.xor"(%arg7, %5469) : (i1, i1) -> i1
        %5565 = "comb.and"(%5542, %5564) : (i1, i1) -> i1
        %5566 = "comb.mux"(%5565, %5482, %5563) : (i1, i3, i3) -> i3
        %5567 = "comb.xor"(%5565, %5469) : (i1, i1) -> i1
        %5568 = "comb.and"(%5567, %5524, %5562, %5559, %5551, %5548, %5545, %5537, %5534, %5523) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5569 = "comb.and"(%5481) : (i1) -> i1
        "fsm.return"(%5569) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %5365 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5366 = "hw.constant"() <{value = true}> : () -> i1
        %5367 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5368 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5369 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5370 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5371 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5372 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5373 = "hw.constant"() <{value = true}> : () -> i1
        %5374 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5375 = "comb.xor"(%arg1, %5373) : (i1, i1) -> i1
        %5376 = "seq.initial"() ({
          %5467 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5467) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5377 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5378 = "comb.icmp"(%5463, %5377) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5379 = "seq.compreg"(%5463, %arg0, %5375, %5374, %5376) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5380 = "comb.icmp"(%5379, %5372) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5381 = "comb.and"(%5380, %arg2) : (i1, i1) -> i1
        %5382 = "comb.icmp"(%5379, %5371) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5383 = "comb.icmp"(%5379, %5370) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5384 = "comb.icmp"(%5379, %5369) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5385 = "comb.icmp"(%5379, %5369) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5386 = "comb.icmp"(%5463, %5369) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5387 = "comb.and"(%5385, %5386) : (i1, i1) -> i1
        %5388 = "comb.icmp"(%5379, %5370) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5389 = "comb.icmp"(%5463, %5370) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5390 = "comb.and"(%5388, %5389) : (i1, i1) -> i1
        %5391 = "comb.and"(%5380, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5392 = "comb.and"(%5383, %arg6) : (i1, i1) -> i1
        %5393 = "comb.or"(%arg4, %arg5, %arg3, %5392) : (i1, i1, i1, i1) -> i1
        %5394 = "comb.or"(%5391, %5393) : (i1, i1) -> i1
        %5395 = "comb.xor"(%5393, %5366) : (i1, i1) -> i1
        %5396 = "comb.icmp"(%5379, %5372) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5397 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5398 = "comb.icmp"(%5379, %5371) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5399 = "comb.icmp"(%5379, %5367) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5400 = "comb.icmp"(%5379, %5370) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5401 = "comb.mux"(%5399, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5402 = "comb.mux"(%5399, %5370, %5372) : (i1, i3, i3) -> i3
        %5403 = "comb.icmp"(%5379, %5368) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5404 = "comb.xor"(%arg4, %5366) : (i1, i1) -> i1
        %5405 = "comb.and"(%5396, %5404) : (i1, i1) -> i1
        %5406 = "comb.xor"(%5396, %5366) : (i1, i1) -> i1
        %5407 = "comb.xor"(%5398, %5366) : (i1, i1) -> i1
        %5408 = "comb.xor"(%5399, %5366) : (i1, i1) -> i1
        %5409 = "comb.xor"(%5400, %5366) : (i1, i1) -> i1
        %5410 = "comb.and"(%5409, %5408, %5407, %5406, %5403) : (i1, i1, i1, i1, i1) -> i1
        %5411 = "comb.or"(%5410, %5405) : (i1, i1) -> i1
        %5412 = "comb.mux"(%5411, %arg5, %5401) : (i1, i1, i1) -> i1
        %5413 = "comb.mux"(%5411, %5369, %5402) : (i1, i3, i3) -> i3
        %5414 = "comb.xor"(%5405, %5366) : (i1, i1) -> i1
        %5415 = "comb.xor"(%5397, %5366) : (i1, i1) -> i1
        %5416 = "comb.or"(%5410, %5414, %5415) : (i1, i1, i1) -> i1
        %5417 = "comb.mux"(%5416, %5379, %5370) : (i1, i3, i3) -> i3
        %5418 = "comb.icmp"(%5379, %5369) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5419 = "comb.mux"(%5418, %5379, %5372) : (i1, i3, i3) -> i3
        %5420 = "comb.xor"(%5418, %5366) : (i1, i1) -> i1
        %5421 = "comb.xor"(%arg3, %5366) : (i1, i1) -> i1
        %5422 = "comb.and"(%5406, %5421) : (i1, i1) -> i1
        %5423 = "comb.and"(%5407, %5422) : (i1, i1) -> i1
        %5424 = "comb.and"(%5408, %5423) : (i1, i1) -> i1
        %5425 = "comb.and"(%5400, %5424) : (i1, i1) -> i1
        %5426 = "comb.and"(%5399, %5423) : (i1, i1) -> i1
        %5427 = "comb.or"(%5425, %5426) : (i1, i1) -> i1
        %5428 = "comb.and"(%5404, %5427) : (i1, i1) -> i1
        %5429 = "comb.and"(%5428, %arg5) : (i1, i1) -> i1
        %5430 = "comb.mux"(%5429, %5369, %5419) : (i1, i3, i3) -> i3
        %5431 = "comb.xor"(%5429, %5366) : (i1, i1) -> i1
        %5432 = "comb.and"(%5427, %arg4) : (i1, i1) -> i1
        %5433 = "comb.mux"(%5432, %5368, %5430) : (i1, i3, i3) -> i3
        %5434 = "comb.xor"(%5432, %5366) : (i1, i1) -> i1
        %5435 = "comb.concat"(%5365, %arg8) : (i2, i1) -> i3
        %5436 = "comb.and"(%5398, %5422) : (i1, i1) -> i1
        %5437 = "comb.and"(%5404, %5436) : (i1, i1) -> i1
        %5438 = "comb.xor"(%arg5, %5366) : (i1, i1) -> i1
        %5439 = "comb.and"(%5438, %5437) : (i1, i1) -> i1
        %5440 = "comb.and"(%arg7, %5439) : (i1, i1) -> i1
        %5441 = "comb.mux"(%5440, %5435, %5433) : (i1, i3, i3) -> i3
        %5442 = "comb.xor"(%5440, %5366) : (i1, i1) -> i1
        %5443 = "comb.and"(%5437, %arg5) : (i1, i1) -> i1
        %5444 = "comb.mux"(%5443, %5369, %5441) : (i1, i3, i3) -> i3
        %5445 = "comb.xor"(%5443, %5366) : (i1, i1) -> i1
        %5446 = "comb.and"(%5436, %arg4) : (i1, i1) -> i1
        %5447 = "comb.mux"(%5446, %5368, %5444) : (i1, i3, i3) -> i3
        %5448 = "comb.xor"(%5446, %5366) : (i1, i1) -> i1
        %5449 = "comb.mux"(%5412, %5413, %5417) : (i1, i3, i3) -> i3
        %5450 = "comb.and"(%5396, %5421) : (i1, i1) -> i1
        %5451 = "comb.and"(%5438, %5428) : (i1, i1) -> i1
        %5452 = "comb.and"(%5404, %5450) : (i1, i1) -> i1
        %5453 = "comb.and"(%5403, %5409, %5424) : (i1, i1, i1) -> i1
        %5454 = "comb.or"(%5451, %5452, %5453) : (i1, i1, i1) -> i1
        %5455 = "comb.mux"(%5454, %5449, %5447) : (i1, i3, i3) -> i3
        %5456 = "comb.xor"(%5454, %5366) : (i1, i1) -> i1
        %5457 = "comb.and"(%5450, %arg4) : (i1, i1) -> i1
        %5458 = "comb.mux"(%5457, %5368, %5455) : (i1, i3, i3) -> i3
        %5459 = "comb.xor"(%5457, %5366) : (i1, i1) -> i1
        %5460 = "comb.mux"(%arg3, %5372, %5458) : (i1, i3, i3) -> i3
        %5461 = "comb.xor"(%arg7, %5366) : (i1, i1) -> i1
        %5462 = "comb.and"(%5439, %5461) : (i1, i1) -> i1
        %5463 = "comb.mux"(%5462, %5379, %5460) : (i1, i3, i3) -> i3
        %5464 = "comb.xor"(%5462, %5366) : (i1, i1) -> i1
        %5465 = "comb.and"(%5464, %5421, %5459, %5456, %5448, %5445, %5442, %5434, %5431, %5420) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5466 = "comb.and"(%5378) : (i1) -> i1
        "fsm.return"(%5466) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %5262 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5263 = "hw.constant"() <{value = true}> : () -> i1
        %5264 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5265 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5266 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5267 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5268 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5269 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5270 = "hw.constant"() <{value = true}> : () -> i1
        %5271 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5272 = "comb.xor"(%arg1, %5270) : (i1, i1) -> i1
        %5273 = "seq.initial"() ({
          %5364 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5364) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5274 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5275 = "comb.icmp"(%5360, %5274) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5276 = "seq.compreg"(%5360, %arg0, %5272, %5271, %5273) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5277 = "comb.icmp"(%5276, %5269) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5278 = "comb.and"(%5277, %arg2) : (i1, i1) -> i1
        %5279 = "comb.icmp"(%5276, %5268) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5280 = "comb.icmp"(%5276, %5267) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5281 = "comb.icmp"(%5276, %5266) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5282 = "comb.icmp"(%5276, %5266) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5283 = "comb.icmp"(%5360, %5266) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5284 = "comb.and"(%5282, %5283) : (i1, i1) -> i1
        %5285 = "comb.icmp"(%5276, %5267) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5286 = "comb.icmp"(%5360, %5267) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5287 = "comb.and"(%5285, %5286) : (i1, i1) -> i1
        %5288 = "comb.and"(%5277, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5289 = "comb.and"(%5280, %arg6) : (i1, i1) -> i1
        %5290 = "comb.or"(%arg4, %arg5, %arg3, %5289) : (i1, i1, i1, i1) -> i1
        %5291 = "comb.or"(%5288, %5290) : (i1, i1) -> i1
        %5292 = "comb.xor"(%5290, %5263) : (i1, i1) -> i1
        %5293 = "comb.icmp"(%5276, %5269) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5294 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5295 = "comb.icmp"(%5276, %5268) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5296 = "comb.icmp"(%5276, %5264) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5297 = "comb.icmp"(%5276, %5267) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5298 = "comb.mux"(%5296, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5299 = "comb.mux"(%5296, %5267, %5269) : (i1, i3, i3) -> i3
        %5300 = "comb.icmp"(%5276, %5265) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5301 = "comb.xor"(%arg4, %5263) : (i1, i1) -> i1
        %5302 = "comb.and"(%5293, %5301) : (i1, i1) -> i1
        %5303 = "comb.xor"(%5293, %5263) : (i1, i1) -> i1
        %5304 = "comb.xor"(%5295, %5263) : (i1, i1) -> i1
        %5305 = "comb.xor"(%5296, %5263) : (i1, i1) -> i1
        %5306 = "comb.xor"(%5297, %5263) : (i1, i1) -> i1
        %5307 = "comb.and"(%5306, %5305, %5304, %5303, %5300) : (i1, i1, i1, i1, i1) -> i1
        %5308 = "comb.or"(%5307, %5302) : (i1, i1) -> i1
        %5309 = "comb.mux"(%5308, %arg5, %5298) : (i1, i1, i1) -> i1
        %5310 = "comb.mux"(%5308, %5266, %5299) : (i1, i3, i3) -> i3
        %5311 = "comb.xor"(%5302, %5263) : (i1, i1) -> i1
        %5312 = "comb.xor"(%5294, %5263) : (i1, i1) -> i1
        %5313 = "comb.or"(%5307, %5311, %5312) : (i1, i1, i1) -> i1
        %5314 = "comb.mux"(%5313, %5276, %5267) : (i1, i3, i3) -> i3
        %5315 = "comb.icmp"(%5276, %5266) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5316 = "comb.mux"(%5315, %5276, %5269) : (i1, i3, i3) -> i3
        %5317 = "comb.xor"(%5315, %5263) : (i1, i1) -> i1
        %5318 = "comb.xor"(%arg3, %5263) : (i1, i1) -> i1
        %5319 = "comb.and"(%5303, %5318) : (i1, i1) -> i1
        %5320 = "comb.and"(%5304, %5319) : (i1, i1) -> i1
        %5321 = "comb.and"(%5305, %5320) : (i1, i1) -> i1
        %5322 = "comb.and"(%5297, %5321) : (i1, i1) -> i1
        %5323 = "comb.and"(%5296, %5320) : (i1, i1) -> i1
        %5324 = "comb.or"(%5322, %5323) : (i1, i1) -> i1
        %5325 = "comb.and"(%5301, %5324) : (i1, i1) -> i1
        %5326 = "comb.and"(%5325, %arg5) : (i1, i1) -> i1
        %5327 = "comb.mux"(%5326, %5266, %5316) : (i1, i3, i3) -> i3
        %5328 = "comb.xor"(%5326, %5263) : (i1, i1) -> i1
        %5329 = "comb.and"(%5324, %arg4) : (i1, i1) -> i1
        %5330 = "comb.mux"(%5329, %5265, %5327) : (i1, i3, i3) -> i3
        %5331 = "comb.xor"(%5329, %5263) : (i1, i1) -> i1
        %5332 = "comb.concat"(%5262, %arg8) : (i2, i1) -> i3
        %5333 = "comb.and"(%5295, %5319) : (i1, i1) -> i1
        %5334 = "comb.and"(%5301, %5333) : (i1, i1) -> i1
        %5335 = "comb.xor"(%arg5, %5263) : (i1, i1) -> i1
        %5336 = "comb.and"(%5335, %5334) : (i1, i1) -> i1
        %5337 = "comb.and"(%arg7, %5336) : (i1, i1) -> i1
        %5338 = "comb.mux"(%5337, %5332, %5330) : (i1, i3, i3) -> i3
        %5339 = "comb.xor"(%5337, %5263) : (i1, i1) -> i1
        %5340 = "comb.and"(%5334, %arg5) : (i1, i1) -> i1
        %5341 = "comb.mux"(%5340, %5266, %5338) : (i1, i3, i3) -> i3
        %5342 = "comb.xor"(%5340, %5263) : (i1, i1) -> i1
        %5343 = "comb.and"(%5333, %arg4) : (i1, i1) -> i1
        %5344 = "comb.mux"(%5343, %5265, %5341) : (i1, i3, i3) -> i3
        %5345 = "comb.xor"(%5343, %5263) : (i1, i1) -> i1
        %5346 = "comb.mux"(%5309, %5310, %5314) : (i1, i3, i3) -> i3
        %5347 = "comb.and"(%5293, %5318) : (i1, i1) -> i1
        %5348 = "comb.and"(%5335, %5325) : (i1, i1) -> i1
        %5349 = "comb.and"(%5301, %5347) : (i1, i1) -> i1
        %5350 = "comb.and"(%5300, %5306, %5321) : (i1, i1, i1) -> i1
        %5351 = "comb.or"(%5348, %5349, %5350) : (i1, i1, i1) -> i1
        %5352 = "comb.mux"(%5351, %5346, %5344) : (i1, i3, i3) -> i3
        %5353 = "comb.xor"(%5351, %5263) : (i1, i1) -> i1
        %5354 = "comb.and"(%5347, %arg4) : (i1, i1) -> i1
        %5355 = "comb.mux"(%5354, %5265, %5352) : (i1, i3, i3) -> i3
        %5356 = "comb.xor"(%5354, %5263) : (i1, i1) -> i1
        %5357 = "comb.mux"(%arg3, %5269, %5355) : (i1, i3, i3) -> i3
        %5358 = "comb.xor"(%arg7, %5263) : (i1, i1) -> i1
        %5359 = "comb.and"(%5336, %5358) : (i1, i1) -> i1
        %5360 = "comb.mux"(%5359, %5276, %5357) : (i1, i3, i3) -> i3
        %5361 = "comb.xor"(%5359, %5263) : (i1, i1) -> i1
        %5362 = "comb.and"(%5361, %5318, %5356, %5353, %5345, %5342, %5339, %5331, %5328, %5317) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5363 = "comb.and"(%5275) : (i1) -> i1
        "fsm.return"(%5363) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %5159 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5160 = "hw.constant"() <{value = true}> : () -> i1
        %5161 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5162 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5163 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5164 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5165 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5166 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5167 = "hw.constant"() <{value = true}> : () -> i1
        %5168 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5169 = "comb.xor"(%arg1, %5167) : (i1, i1) -> i1
        %5170 = "seq.initial"() ({
          %5261 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5261) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5171 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5172 = "comb.icmp"(%5257, %5171) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5173 = "seq.compreg"(%5257, %arg0, %5169, %5168, %5170) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5174 = "comb.icmp"(%5173, %5166) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5175 = "comb.and"(%5174, %arg2) : (i1, i1) -> i1
        %5176 = "comb.icmp"(%5173, %5165) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5177 = "comb.icmp"(%5173, %5164) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5178 = "comb.icmp"(%5173, %5163) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5179 = "comb.icmp"(%5173, %5163) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5180 = "comb.icmp"(%5257, %5163) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5181 = "comb.and"(%5179, %5180) : (i1, i1) -> i1
        %5182 = "comb.icmp"(%5173, %5164) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5183 = "comb.icmp"(%5257, %5164) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5184 = "comb.and"(%5182, %5183) : (i1, i1) -> i1
        %5185 = "comb.and"(%5174, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5186 = "comb.and"(%5177, %arg6) : (i1, i1) -> i1
        %5187 = "comb.or"(%arg4, %arg5, %arg3, %5186) : (i1, i1, i1, i1) -> i1
        %5188 = "comb.or"(%5185, %5187) : (i1, i1) -> i1
        %5189 = "comb.xor"(%5187, %5160) : (i1, i1) -> i1
        %5190 = "comb.icmp"(%5173, %5166) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5191 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5192 = "comb.icmp"(%5173, %5165) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5193 = "comb.icmp"(%5173, %5161) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5194 = "comb.icmp"(%5173, %5164) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5195 = "comb.mux"(%5193, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5196 = "comb.mux"(%5193, %5164, %5166) : (i1, i3, i3) -> i3
        %5197 = "comb.icmp"(%5173, %5162) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5198 = "comb.xor"(%arg4, %5160) : (i1, i1) -> i1
        %5199 = "comb.and"(%5190, %5198) : (i1, i1) -> i1
        %5200 = "comb.xor"(%5190, %5160) : (i1, i1) -> i1
        %5201 = "comb.xor"(%5192, %5160) : (i1, i1) -> i1
        %5202 = "comb.xor"(%5193, %5160) : (i1, i1) -> i1
        %5203 = "comb.xor"(%5194, %5160) : (i1, i1) -> i1
        %5204 = "comb.and"(%5203, %5202, %5201, %5200, %5197) : (i1, i1, i1, i1, i1) -> i1
        %5205 = "comb.or"(%5204, %5199) : (i1, i1) -> i1
        %5206 = "comb.mux"(%5205, %arg5, %5195) : (i1, i1, i1) -> i1
        %5207 = "comb.mux"(%5205, %5163, %5196) : (i1, i3, i3) -> i3
        %5208 = "comb.xor"(%5199, %5160) : (i1, i1) -> i1
        %5209 = "comb.xor"(%5191, %5160) : (i1, i1) -> i1
        %5210 = "comb.or"(%5204, %5208, %5209) : (i1, i1, i1) -> i1
        %5211 = "comb.mux"(%5210, %5173, %5164) : (i1, i3, i3) -> i3
        %5212 = "comb.icmp"(%5173, %5163) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5213 = "comb.mux"(%5212, %5173, %5166) : (i1, i3, i3) -> i3
        %5214 = "comb.xor"(%5212, %5160) : (i1, i1) -> i1
        %5215 = "comb.xor"(%arg3, %5160) : (i1, i1) -> i1
        %5216 = "comb.and"(%5200, %5215) : (i1, i1) -> i1
        %5217 = "comb.and"(%5201, %5216) : (i1, i1) -> i1
        %5218 = "comb.and"(%5202, %5217) : (i1, i1) -> i1
        %5219 = "comb.and"(%5194, %5218) : (i1, i1) -> i1
        %5220 = "comb.and"(%5193, %5217) : (i1, i1) -> i1
        %5221 = "comb.or"(%5219, %5220) : (i1, i1) -> i1
        %5222 = "comb.and"(%5198, %5221) : (i1, i1) -> i1
        %5223 = "comb.and"(%5222, %arg5) : (i1, i1) -> i1
        %5224 = "comb.mux"(%5223, %5163, %5213) : (i1, i3, i3) -> i3
        %5225 = "comb.xor"(%5223, %5160) : (i1, i1) -> i1
        %5226 = "comb.and"(%5221, %arg4) : (i1, i1) -> i1
        %5227 = "comb.mux"(%5226, %5162, %5224) : (i1, i3, i3) -> i3
        %5228 = "comb.xor"(%5226, %5160) : (i1, i1) -> i1
        %5229 = "comb.concat"(%5159, %arg8) : (i2, i1) -> i3
        %5230 = "comb.and"(%5192, %5216) : (i1, i1) -> i1
        %5231 = "comb.and"(%5198, %5230) : (i1, i1) -> i1
        %5232 = "comb.xor"(%arg5, %5160) : (i1, i1) -> i1
        %5233 = "comb.and"(%5232, %5231) : (i1, i1) -> i1
        %5234 = "comb.and"(%arg7, %5233) : (i1, i1) -> i1
        %5235 = "comb.mux"(%5234, %5229, %5227) : (i1, i3, i3) -> i3
        %5236 = "comb.xor"(%5234, %5160) : (i1, i1) -> i1
        %5237 = "comb.and"(%5231, %arg5) : (i1, i1) -> i1
        %5238 = "comb.mux"(%5237, %5163, %5235) : (i1, i3, i3) -> i3
        %5239 = "comb.xor"(%5237, %5160) : (i1, i1) -> i1
        %5240 = "comb.and"(%5230, %arg4) : (i1, i1) -> i1
        %5241 = "comb.mux"(%5240, %5162, %5238) : (i1, i3, i3) -> i3
        %5242 = "comb.xor"(%5240, %5160) : (i1, i1) -> i1
        %5243 = "comb.mux"(%5206, %5207, %5211) : (i1, i3, i3) -> i3
        %5244 = "comb.and"(%5190, %5215) : (i1, i1) -> i1
        %5245 = "comb.and"(%5232, %5222) : (i1, i1) -> i1
        %5246 = "comb.and"(%5198, %5244) : (i1, i1) -> i1
        %5247 = "comb.and"(%5197, %5203, %5218) : (i1, i1, i1) -> i1
        %5248 = "comb.or"(%5245, %5246, %5247) : (i1, i1, i1) -> i1
        %5249 = "comb.mux"(%5248, %5243, %5241) : (i1, i3, i3) -> i3
        %5250 = "comb.xor"(%5248, %5160) : (i1, i1) -> i1
        %5251 = "comb.and"(%5244, %arg4) : (i1, i1) -> i1
        %5252 = "comb.mux"(%5251, %5162, %5249) : (i1, i3, i3) -> i3
        %5253 = "comb.xor"(%5251, %5160) : (i1, i1) -> i1
        %5254 = "comb.mux"(%arg3, %5166, %5252) : (i1, i3, i3) -> i3
        %5255 = "comb.xor"(%arg7, %5160) : (i1, i1) -> i1
        %5256 = "comb.and"(%5233, %5255) : (i1, i1) -> i1
        %5257 = "comb.mux"(%5256, %5173, %5254) : (i1, i3, i3) -> i3
        %5258 = "comb.xor"(%5256, %5160) : (i1, i1) -> i1
        %5259 = "comb.and"(%5258, %5215, %5253, %5250, %5242, %5239, %5236, %5228, %5225, %5214) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5260 = "comb.and"(%5172) : (i1) -> i1
        "fsm.return"(%5260) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_5"}> ({
      %5144 = "hw.constant"() <{value = true}> : () -> i1
      %5145 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %5146 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %5147 = "hw.constant"() <{value = false}> : () -> i1
      %5148 = "hw.constant"() <{value = false}> : () -> i1
      %5149 = "hw.constant"() <{value = false}> : () -> i1
      %5150 = "hw.constant"() <{value = true}> : () -> i1
      %5151 = "hw.constant"() <{value = false}> : () -> i1
      %5152 = "hw.constant"() <{value = false}> : () -> i1
      %5153 = "comb.or"(%arg4, %arg5, %arg3, %5152) : (i1, i1, i1, i1) -> i1
      %5154 = "comb.xor"(%5153, %5144) : (i1, i1) -> i1
      %5155 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %5156 = "comb.mux"(%arg3, %5146, %5155) : (i1, i3, i3) -> i3
      %5157 = "hw.constant"() <{value = false}> : () -> i1
      %5158 = "comb.icmp"(%5156, %5145) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%5147, %5148, %5149, %5150, %5153, %5154, %5158, %5151, %5157) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %5041 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %5042 = "hw.constant"() <{value = true}> : () -> i1
        %5043 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %5044 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %5045 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5046 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %5047 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %5048 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5049 = "hw.constant"() <{value = true}> : () -> i1
        %5050 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %5051 = "comb.xor"(%arg1, %5049) : (i1, i1) -> i1
        %5052 = "seq.initial"() ({
          %5143 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5143) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %5053 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %5054 = "comb.icmp"(%5139, %5053) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5055 = "seq.compreg"(%5139, %arg0, %5051, %5050, %5052) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %5056 = "comb.icmp"(%5055, %5048) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %5057 = "comb.and"(%5056, %arg2) : (i1, i1) -> i1
        %5058 = "comb.icmp"(%5055, %5047) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5059 = "comb.icmp"(%5055, %5046) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5060 = "comb.icmp"(%5055, %5045) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5061 = "comb.icmp"(%5055, %5045) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5062 = "comb.icmp"(%5139, %5045) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5063 = "comb.and"(%5061, %5062) : (i1, i1) -> i1
        %5064 = "comb.icmp"(%5055, %5046) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %5065 = "comb.icmp"(%5139, %5046) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %5066 = "comb.and"(%5064, %5065) : (i1, i1) -> i1
        %5067 = "comb.and"(%5056, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %5068 = "comb.and"(%5059, %arg6) : (i1, i1) -> i1
        %5069 = "comb.or"(%arg4, %arg5, %arg3, %5068) : (i1, i1, i1, i1) -> i1
        %5070 = "comb.or"(%5067, %5069) : (i1, i1) -> i1
        %5071 = "comb.xor"(%5069, %5042) : (i1, i1) -> i1
        %5072 = "comb.icmp"(%5055, %5048) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5073 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %5074 = "comb.icmp"(%5055, %5047) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5075 = "comb.icmp"(%5055, %5043) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5076 = "comb.icmp"(%5055, %5046) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5077 = "comb.mux"(%5075, %arg8, %arg6) : (i1, i1, i1) -> i1
        %5078 = "comb.mux"(%5075, %5046, %5048) : (i1, i3, i3) -> i3
        %5079 = "comb.icmp"(%5055, %5044) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5080 = "comb.xor"(%arg4, %5042) : (i1, i1) -> i1
        %5081 = "comb.and"(%5072, %5080) : (i1, i1) -> i1
        %5082 = "comb.xor"(%5072, %5042) : (i1, i1) -> i1
        %5083 = "comb.xor"(%5074, %5042) : (i1, i1) -> i1
        %5084 = "comb.xor"(%5075, %5042) : (i1, i1) -> i1
        %5085 = "comb.xor"(%5076, %5042) : (i1, i1) -> i1
        %5086 = "comb.and"(%5085, %5084, %5083, %5082, %5079) : (i1, i1, i1, i1, i1) -> i1
        %5087 = "comb.or"(%5086, %5081) : (i1, i1) -> i1
        %5088 = "comb.mux"(%5087, %arg5, %5077) : (i1, i1, i1) -> i1
        %5089 = "comb.mux"(%5087, %5045, %5078) : (i1, i3, i3) -> i3
        %5090 = "comb.xor"(%5081, %5042) : (i1, i1) -> i1
        %5091 = "comb.xor"(%5073, %5042) : (i1, i1) -> i1
        %5092 = "comb.or"(%5086, %5090, %5091) : (i1, i1, i1) -> i1
        %5093 = "comb.mux"(%5092, %5055, %5046) : (i1, i3, i3) -> i3
        %5094 = "comb.icmp"(%5055, %5045) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %5095 = "comb.mux"(%5094, %5055, %5048) : (i1, i3, i3) -> i3
        %5096 = "comb.xor"(%5094, %5042) : (i1, i1) -> i1
        %5097 = "comb.xor"(%arg3, %5042) : (i1, i1) -> i1
        %5098 = "comb.and"(%5082, %5097) : (i1, i1) -> i1
        %5099 = "comb.and"(%5083, %5098) : (i1, i1) -> i1
        %5100 = "comb.and"(%5084, %5099) : (i1, i1) -> i1
        %5101 = "comb.and"(%5076, %5100) : (i1, i1) -> i1
        %5102 = "comb.and"(%5075, %5099) : (i1, i1) -> i1
        %5103 = "comb.or"(%5101, %5102) : (i1, i1) -> i1
        %5104 = "comb.and"(%5080, %5103) : (i1, i1) -> i1
        %5105 = "comb.and"(%5104, %arg5) : (i1, i1) -> i1
        %5106 = "comb.mux"(%5105, %5045, %5095) : (i1, i3, i3) -> i3
        %5107 = "comb.xor"(%5105, %5042) : (i1, i1) -> i1
        %5108 = "comb.and"(%5103, %arg4) : (i1, i1) -> i1
        %5109 = "comb.mux"(%5108, %5044, %5106) : (i1, i3, i3) -> i3
        %5110 = "comb.xor"(%5108, %5042) : (i1, i1) -> i1
        %5111 = "comb.concat"(%5041, %arg8) : (i2, i1) -> i3
        %5112 = "comb.and"(%5074, %5098) : (i1, i1) -> i1
        %5113 = "comb.and"(%5080, %5112) : (i1, i1) -> i1
        %5114 = "comb.xor"(%arg5, %5042) : (i1, i1) -> i1
        %5115 = "comb.and"(%5114, %5113) : (i1, i1) -> i1
        %5116 = "comb.and"(%arg7, %5115) : (i1, i1) -> i1
        %5117 = "comb.mux"(%5116, %5111, %5109) : (i1, i3, i3) -> i3
        %5118 = "comb.xor"(%5116, %5042) : (i1, i1) -> i1
        %5119 = "comb.and"(%5113, %arg5) : (i1, i1) -> i1
        %5120 = "comb.mux"(%5119, %5045, %5117) : (i1, i3, i3) -> i3
        %5121 = "comb.xor"(%5119, %5042) : (i1, i1) -> i1
        %5122 = "comb.and"(%5112, %arg4) : (i1, i1) -> i1
        %5123 = "comb.mux"(%5122, %5044, %5120) : (i1, i3, i3) -> i3
        %5124 = "comb.xor"(%5122, %5042) : (i1, i1) -> i1
        %5125 = "comb.mux"(%5088, %5089, %5093) : (i1, i3, i3) -> i3
        %5126 = "comb.and"(%5072, %5097) : (i1, i1) -> i1
        %5127 = "comb.and"(%5114, %5104) : (i1, i1) -> i1
        %5128 = "comb.and"(%5080, %5126) : (i1, i1) -> i1
        %5129 = "comb.and"(%5079, %5085, %5100) : (i1, i1, i1) -> i1
        %5130 = "comb.or"(%5127, %5128, %5129) : (i1, i1, i1) -> i1
        %5131 = "comb.mux"(%5130, %5125, %5123) : (i1, i3, i3) -> i3
        %5132 = "comb.xor"(%5130, %5042) : (i1, i1) -> i1
        %5133 = "comb.and"(%5126, %arg4) : (i1, i1) -> i1
        %5134 = "comb.mux"(%5133, %5044, %5131) : (i1, i3, i3) -> i3
        %5135 = "comb.xor"(%5133, %5042) : (i1, i1) -> i1
        %5136 = "comb.mux"(%arg3, %5048, %5134) : (i1, i3, i3) -> i3
        %5137 = "comb.xor"(%arg7, %5042) : (i1, i1) -> i1
        %5138 = "comb.and"(%5115, %5137) : (i1, i1) -> i1
        %5139 = "comb.mux"(%5138, %5055, %5136) : (i1, i3, i3) -> i3
        %5140 = "comb.xor"(%5138, %5042) : (i1, i1) -> i1
        %5141 = "comb.and"(%5140, %5097, %5135, %5132, %5124, %5121, %5118, %5110, %5107, %5096) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5142 = "comb.and"(%5054) : (i1) -> i1
        "fsm.return"(%5142) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %4938 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4939 = "hw.constant"() <{value = true}> : () -> i1
        %4940 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4941 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4942 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4943 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4944 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4945 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4946 = "hw.constant"() <{value = true}> : () -> i1
        %4947 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4948 = "comb.xor"(%arg1, %4946) : (i1, i1) -> i1
        %4949 = "seq.initial"() ({
          %5040 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%5040) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4950 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %4951 = "comb.icmp"(%5036, %4950) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4952 = "seq.compreg"(%5036, %arg0, %4948, %4947, %4949) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4953 = "comb.icmp"(%4952, %4945) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4954 = "comb.and"(%4953, %arg2) : (i1, i1) -> i1
        %4955 = "comb.icmp"(%4952, %4944) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4956 = "comb.icmp"(%4952, %4943) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4957 = "comb.icmp"(%4952, %4942) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4958 = "comb.icmp"(%4952, %4942) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4959 = "comb.icmp"(%5036, %4942) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4960 = "comb.and"(%4958, %4959) : (i1, i1) -> i1
        %4961 = "comb.icmp"(%4952, %4943) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4962 = "comb.icmp"(%5036, %4943) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4963 = "comb.and"(%4961, %4962) : (i1, i1) -> i1
        %4964 = "comb.and"(%4953, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4965 = "comb.and"(%4956, %arg6) : (i1, i1) -> i1
        %4966 = "comb.or"(%arg4, %arg5, %arg3, %4965) : (i1, i1, i1, i1) -> i1
        %4967 = "comb.or"(%4964, %4966) : (i1, i1) -> i1
        %4968 = "comb.xor"(%4966, %4939) : (i1, i1) -> i1
        %4969 = "comb.icmp"(%4952, %4945) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4970 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4971 = "comb.icmp"(%4952, %4944) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4972 = "comb.icmp"(%4952, %4940) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4973 = "comb.icmp"(%4952, %4943) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4974 = "comb.mux"(%4972, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4975 = "comb.mux"(%4972, %4943, %4945) : (i1, i3, i3) -> i3
        %4976 = "comb.icmp"(%4952, %4941) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4977 = "comb.xor"(%arg4, %4939) : (i1, i1) -> i1
        %4978 = "comb.and"(%4969, %4977) : (i1, i1) -> i1
        %4979 = "comb.xor"(%4969, %4939) : (i1, i1) -> i1
        %4980 = "comb.xor"(%4971, %4939) : (i1, i1) -> i1
        %4981 = "comb.xor"(%4972, %4939) : (i1, i1) -> i1
        %4982 = "comb.xor"(%4973, %4939) : (i1, i1) -> i1
        %4983 = "comb.and"(%4982, %4981, %4980, %4979, %4976) : (i1, i1, i1, i1, i1) -> i1
        %4984 = "comb.or"(%4983, %4978) : (i1, i1) -> i1
        %4985 = "comb.mux"(%4984, %arg5, %4974) : (i1, i1, i1) -> i1
        %4986 = "comb.mux"(%4984, %4942, %4975) : (i1, i3, i3) -> i3
        %4987 = "comb.xor"(%4978, %4939) : (i1, i1) -> i1
        %4988 = "comb.xor"(%4970, %4939) : (i1, i1) -> i1
        %4989 = "comb.or"(%4983, %4987, %4988) : (i1, i1, i1) -> i1
        %4990 = "comb.mux"(%4989, %4952, %4943) : (i1, i3, i3) -> i3
        %4991 = "comb.icmp"(%4952, %4942) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4992 = "comb.mux"(%4991, %4952, %4945) : (i1, i3, i3) -> i3
        %4993 = "comb.xor"(%4991, %4939) : (i1, i1) -> i1
        %4994 = "comb.xor"(%arg3, %4939) : (i1, i1) -> i1
        %4995 = "comb.and"(%4979, %4994) : (i1, i1) -> i1
        %4996 = "comb.and"(%4980, %4995) : (i1, i1) -> i1
        %4997 = "comb.and"(%4981, %4996) : (i1, i1) -> i1
        %4998 = "comb.and"(%4973, %4997) : (i1, i1) -> i1
        %4999 = "comb.and"(%4972, %4996) : (i1, i1) -> i1
        %5000 = "comb.or"(%4998, %4999) : (i1, i1) -> i1
        %5001 = "comb.and"(%4977, %5000) : (i1, i1) -> i1
        %5002 = "comb.and"(%5001, %arg5) : (i1, i1) -> i1
        %5003 = "comb.mux"(%5002, %4942, %4992) : (i1, i3, i3) -> i3
        %5004 = "comb.xor"(%5002, %4939) : (i1, i1) -> i1
        %5005 = "comb.and"(%5000, %arg4) : (i1, i1) -> i1
        %5006 = "comb.mux"(%5005, %4941, %5003) : (i1, i3, i3) -> i3
        %5007 = "comb.xor"(%5005, %4939) : (i1, i1) -> i1
        %5008 = "comb.concat"(%4938, %arg8) : (i2, i1) -> i3
        %5009 = "comb.and"(%4971, %4995) : (i1, i1) -> i1
        %5010 = "comb.and"(%4977, %5009) : (i1, i1) -> i1
        %5011 = "comb.xor"(%arg5, %4939) : (i1, i1) -> i1
        %5012 = "comb.and"(%5011, %5010) : (i1, i1) -> i1
        %5013 = "comb.and"(%arg7, %5012) : (i1, i1) -> i1
        %5014 = "comb.mux"(%5013, %5008, %5006) : (i1, i3, i3) -> i3
        %5015 = "comb.xor"(%5013, %4939) : (i1, i1) -> i1
        %5016 = "comb.and"(%5010, %arg5) : (i1, i1) -> i1
        %5017 = "comb.mux"(%5016, %4942, %5014) : (i1, i3, i3) -> i3
        %5018 = "comb.xor"(%5016, %4939) : (i1, i1) -> i1
        %5019 = "comb.and"(%5009, %arg4) : (i1, i1) -> i1
        %5020 = "comb.mux"(%5019, %4941, %5017) : (i1, i3, i3) -> i3
        %5021 = "comb.xor"(%5019, %4939) : (i1, i1) -> i1
        %5022 = "comb.mux"(%4985, %4986, %4990) : (i1, i3, i3) -> i3
        %5023 = "comb.and"(%4969, %4994) : (i1, i1) -> i1
        %5024 = "comb.and"(%5011, %5001) : (i1, i1) -> i1
        %5025 = "comb.and"(%4977, %5023) : (i1, i1) -> i1
        %5026 = "comb.and"(%4976, %4982, %4997) : (i1, i1, i1) -> i1
        %5027 = "comb.or"(%5024, %5025, %5026) : (i1, i1, i1) -> i1
        %5028 = "comb.mux"(%5027, %5022, %5020) : (i1, i3, i3) -> i3
        %5029 = "comb.xor"(%5027, %4939) : (i1, i1) -> i1
        %5030 = "comb.and"(%5023, %arg4) : (i1, i1) -> i1
        %5031 = "comb.mux"(%5030, %4941, %5028) : (i1, i3, i3) -> i3
        %5032 = "comb.xor"(%5030, %4939) : (i1, i1) -> i1
        %5033 = "comb.mux"(%arg3, %4945, %5031) : (i1, i3, i3) -> i3
        %5034 = "comb.xor"(%arg7, %4939) : (i1, i1) -> i1
        %5035 = "comb.and"(%5012, %5034) : (i1, i1) -> i1
        %5036 = "comb.mux"(%5035, %4952, %5033) : (i1, i3, i3) -> i3
        %5037 = "comb.xor"(%5035, %4939) : (i1, i1) -> i1
        %5038 = "comb.and"(%5037, %4994, %5032, %5029, %5021, %5018, %5015, %5007, %5004, %4993) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %5039 = "comb.and"(%4951) : (i1) -> i1
        "fsm.return"(%5039) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %4835 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4836 = "hw.constant"() <{value = true}> : () -> i1
        %4837 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4838 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4839 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4840 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4841 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4842 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4843 = "hw.constant"() <{value = true}> : () -> i1
        %4844 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4845 = "comb.xor"(%arg1, %4843) : (i1, i1) -> i1
        %4846 = "seq.initial"() ({
          %4937 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4937) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4847 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4848 = "comb.icmp"(%4933, %4847) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4849 = "seq.compreg"(%4933, %arg0, %4845, %4844, %4846) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4850 = "comb.icmp"(%4849, %4842) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4851 = "comb.and"(%4850, %arg2) : (i1, i1) -> i1
        %4852 = "comb.icmp"(%4849, %4841) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4853 = "comb.icmp"(%4849, %4840) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4854 = "comb.icmp"(%4849, %4839) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4855 = "comb.icmp"(%4849, %4839) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4856 = "comb.icmp"(%4933, %4839) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4857 = "comb.and"(%4855, %4856) : (i1, i1) -> i1
        %4858 = "comb.icmp"(%4849, %4840) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4859 = "comb.icmp"(%4933, %4840) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4860 = "comb.and"(%4858, %4859) : (i1, i1) -> i1
        %4861 = "comb.and"(%4850, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4862 = "comb.and"(%4853, %arg6) : (i1, i1) -> i1
        %4863 = "comb.or"(%arg4, %arg5, %arg3, %4862) : (i1, i1, i1, i1) -> i1
        %4864 = "comb.or"(%4861, %4863) : (i1, i1) -> i1
        %4865 = "comb.xor"(%4863, %4836) : (i1, i1) -> i1
        %4866 = "comb.icmp"(%4849, %4842) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4867 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4868 = "comb.icmp"(%4849, %4841) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4869 = "comb.icmp"(%4849, %4837) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4870 = "comb.icmp"(%4849, %4840) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4871 = "comb.mux"(%4869, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4872 = "comb.mux"(%4869, %4840, %4842) : (i1, i3, i3) -> i3
        %4873 = "comb.icmp"(%4849, %4838) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4874 = "comb.xor"(%arg4, %4836) : (i1, i1) -> i1
        %4875 = "comb.and"(%4866, %4874) : (i1, i1) -> i1
        %4876 = "comb.xor"(%4866, %4836) : (i1, i1) -> i1
        %4877 = "comb.xor"(%4868, %4836) : (i1, i1) -> i1
        %4878 = "comb.xor"(%4869, %4836) : (i1, i1) -> i1
        %4879 = "comb.xor"(%4870, %4836) : (i1, i1) -> i1
        %4880 = "comb.and"(%4879, %4878, %4877, %4876, %4873) : (i1, i1, i1, i1, i1) -> i1
        %4881 = "comb.or"(%4880, %4875) : (i1, i1) -> i1
        %4882 = "comb.mux"(%4881, %arg5, %4871) : (i1, i1, i1) -> i1
        %4883 = "comb.mux"(%4881, %4839, %4872) : (i1, i3, i3) -> i3
        %4884 = "comb.xor"(%4875, %4836) : (i1, i1) -> i1
        %4885 = "comb.xor"(%4867, %4836) : (i1, i1) -> i1
        %4886 = "comb.or"(%4880, %4884, %4885) : (i1, i1, i1) -> i1
        %4887 = "comb.mux"(%4886, %4849, %4840) : (i1, i3, i3) -> i3
        %4888 = "comb.icmp"(%4849, %4839) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4889 = "comb.mux"(%4888, %4849, %4842) : (i1, i3, i3) -> i3
        %4890 = "comb.xor"(%4888, %4836) : (i1, i1) -> i1
        %4891 = "comb.xor"(%arg3, %4836) : (i1, i1) -> i1
        %4892 = "comb.and"(%4876, %4891) : (i1, i1) -> i1
        %4893 = "comb.and"(%4877, %4892) : (i1, i1) -> i1
        %4894 = "comb.and"(%4878, %4893) : (i1, i1) -> i1
        %4895 = "comb.and"(%4870, %4894) : (i1, i1) -> i1
        %4896 = "comb.and"(%4869, %4893) : (i1, i1) -> i1
        %4897 = "comb.or"(%4895, %4896) : (i1, i1) -> i1
        %4898 = "comb.and"(%4874, %4897) : (i1, i1) -> i1
        %4899 = "comb.and"(%4898, %arg5) : (i1, i1) -> i1
        %4900 = "comb.mux"(%4899, %4839, %4889) : (i1, i3, i3) -> i3
        %4901 = "comb.xor"(%4899, %4836) : (i1, i1) -> i1
        %4902 = "comb.and"(%4897, %arg4) : (i1, i1) -> i1
        %4903 = "comb.mux"(%4902, %4838, %4900) : (i1, i3, i3) -> i3
        %4904 = "comb.xor"(%4902, %4836) : (i1, i1) -> i1
        %4905 = "comb.concat"(%4835, %arg8) : (i2, i1) -> i3
        %4906 = "comb.and"(%4868, %4892) : (i1, i1) -> i1
        %4907 = "comb.and"(%4874, %4906) : (i1, i1) -> i1
        %4908 = "comb.xor"(%arg5, %4836) : (i1, i1) -> i1
        %4909 = "comb.and"(%4908, %4907) : (i1, i1) -> i1
        %4910 = "comb.and"(%arg7, %4909) : (i1, i1) -> i1
        %4911 = "comb.mux"(%4910, %4905, %4903) : (i1, i3, i3) -> i3
        %4912 = "comb.xor"(%4910, %4836) : (i1, i1) -> i1
        %4913 = "comb.and"(%4907, %arg5) : (i1, i1) -> i1
        %4914 = "comb.mux"(%4913, %4839, %4911) : (i1, i3, i3) -> i3
        %4915 = "comb.xor"(%4913, %4836) : (i1, i1) -> i1
        %4916 = "comb.and"(%4906, %arg4) : (i1, i1) -> i1
        %4917 = "comb.mux"(%4916, %4838, %4914) : (i1, i3, i3) -> i3
        %4918 = "comb.xor"(%4916, %4836) : (i1, i1) -> i1
        %4919 = "comb.mux"(%4882, %4883, %4887) : (i1, i3, i3) -> i3
        %4920 = "comb.and"(%4866, %4891) : (i1, i1) -> i1
        %4921 = "comb.and"(%4908, %4898) : (i1, i1) -> i1
        %4922 = "comb.and"(%4874, %4920) : (i1, i1) -> i1
        %4923 = "comb.and"(%4873, %4879, %4894) : (i1, i1, i1) -> i1
        %4924 = "comb.or"(%4921, %4922, %4923) : (i1, i1, i1) -> i1
        %4925 = "comb.mux"(%4924, %4919, %4917) : (i1, i3, i3) -> i3
        %4926 = "comb.xor"(%4924, %4836) : (i1, i1) -> i1
        %4927 = "comb.and"(%4920, %arg4) : (i1, i1) -> i1
        %4928 = "comb.mux"(%4927, %4838, %4925) : (i1, i3, i3) -> i3
        %4929 = "comb.xor"(%4927, %4836) : (i1, i1) -> i1
        %4930 = "comb.mux"(%arg3, %4842, %4928) : (i1, i3, i3) -> i3
        %4931 = "comb.xor"(%arg7, %4836) : (i1, i1) -> i1
        %4932 = "comb.and"(%4909, %4931) : (i1, i1) -> i1
        %4933 = "comb.mux"(%4932, %4849, %4930) : (i1, i3, i3) -> i3
        %4934 = "comb.xor"(%4932, %4836) : (i1, i1) -> i1
        %4935 = "comb.and"(%4934, %4891, %4929, %4926, %4918, %4915, %4912, %4904, %4901, %4890) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4936 = "comb.and"(%4848) : (i1) -> i1
        "fsm.return"(%4936) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %4732 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4733 = "hw.constant"() <{value = true}> : () -> i1
        %4734 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4735 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4736 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4737 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4738 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4739 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4740 = "hw.constant"() <{value = true}> : () -> i1
        %4741 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4742 = "comb.xor"(%arg1, %4740) : (i1, i1) -> i1
        %4743 = "seq.initial"() ({
          %4834 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4834) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4744 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4745 = "comb.icmp"(%4830, %4744) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4746 = "seq.compreg"(%4830, %arg0, %4742, %4741, %4743) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4747 = "comb.icmp"(%4746, %4739) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4748 = "comb.and"(%4747, %arg2) : (i1, i1) -> i1
        %4749 = "comb.icmp"(%4746, %4738) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4750 = "comb.icmp"(%4746, %4737) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4751 = "comb.icmp"(%4746, %4736) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4752 = "comb.icmp"(%4746, %4736) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4753 = "comb.icmp"(%4830, %4736) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4754 = "comb.and"(%4752, %4753) : (i1, i1) -> i1
        %4755 = "comb.icmp"(%4746, %4737) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4756 = "comb.icmp"(%4830, %4737) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4757 = "comb.and"(%4755, %4756) : (i1, i1) -> i1
        %4758 = "comb.and"(%4747, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4759 = "comb.and"(%4750, %arg6) : (i1, i1) -> i1
        %4760 = "comb.or"(%arg4, %arg5, %arg3, %4759) : (i1, i1, i1, i1) -> i1
        %4761 = "comb.or"(%4758, %4760) : (i1, i1) -> i1
        %4762 = "comb.xor"(%4760, %4733) : (i1, i1) -> i1
        %4763 = "comb.icmp"(%4746, %4739) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4764 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4765 = "comb.icmp"(%4746, %4738) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4766 = "comb.icmp"(%4746, %4734) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4767 = "comb.icmp"(%4746, %4737) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4768 = "comb.mux"(%4766, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4769 = "comb.mux"(%4766, %4737, %4739) : (i1, i3, i3) -> i3
        %4770 = "comb.icmp"(%4746, %4735) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4771 = "comb.xor"(%arg4, %4733) : (i1, i1) -> i1
        %4772 = "comb.and"(%4763, %4771) : (i1, i1) -> i1
        %4773 = "comb.xor"(%4763, %4733) : (i1, i1) -> i1
        %4774 = "comb.xor"(%4765, %4733) : (i1, i1) -> i1
        %4775 = "comb.xor"(%4766, %4733) : (i1, i1) -> i1
        %4776 = "comb.xor"(%4767, %4733) : (i1, i1) -> i1
        %4777 = "comb.and"(%4776, %4775, %4774, %4773, %4770) : (i1, i1, i1, i1, i1) -> i1
        %4778 = "comb.or"(%4777, %4772) : (i1, i1) -> i1
        %4779 = "comb.mux"(%4778, %arg5, %4768) : (i1, i1, i1) -> i1
        %4780 = "comb.mux"(%4778, %4736, %4769) : (i1, i3, i3) -> i3
        %4781 = "comb.xor"(%4772, %4733) : (i1, i1) -> i1
        %4782 = "comb.xor"(%4764, %4733) : (i1, i1) -> i1
        %4783 = "comb.or"(%4777, %4781, %4782) : (i1, i1, i1) -> i1
        %4784 = "comb.mux"(%4783, %4746, %4737) : (i1, i3, i3) -> i3
        %4785 = "comb.icmp"(%4746, %4736) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4786 = "comb.mux"(%4785, %4746, %4739) : (i1, i3, i3) -> i3
        %4787 = "comb.xor"(%4785, %4733) : (i1, i1) -> i1
        %4788 = "comb.xor"(%arg3, %4733) : (i1, i1) -> i1
        %4789 = "comb.and"(%4773, %4788) : (i1, i1) -> i1
        %4790 = "comb.and"(%4774, %4789) : (i1, i1) -> i1
        %4791 = "comb.and"(%4775, %4790) : (i1, i1) -> i1
        %4792 = "comb.and"(%4767, %4791) : (i1, i1) -> i1
        %4793 = "comb.and"(%4766, %4790) : (i1, i1) -> i1
        %4794 = "comb.or"(%4792, %4793) : (i1, i1) -> i1
        %4795 = "comb.and"(%4771, %4794) : (i1, i1) -> i1
        %4796 = "comb.and"(%4795, %arg5) : (i1, i1) -> i1
        %4797 = "comb.mux"(%4796, %4736, %4786) : (i1, i3, i3) -> i3
        %4798 = "comb.xor"(%4796, %4733) : (i1, i1) -> i1
        %4799 = "comb.and"(%4794, %arg4) : (i1, i1) -> i1
        %4800 = "comb.mux"(%4799, %4735, %4797) : (i1, i3, i3) -> i3
        %4801 = "comb.xor"(%4799, %4733) : (i1, i1) -> i1
        %4802 = "comb.concat"(%4732, %arg8) : (i2, i1) -> i3
        %4803 = "comb.and"(%4765, %4789) : (i1, i1) -> i1
        %4804 = "comb.and"(%4771, %4803) : (i1, i1) -> i1
        %4805 = "comb.xor"(%arg5, %4733) : (i1, i1) -> i1
        %4806 = "comb.and"(%4805, %4804) : (i1, i1) -> i1
        %4807 = "comb.and"(%arg7, %4806) : (i1, i1) -> i1
        %4808 = "comb.mux"(%4807, %4802, %4800) : (i1, i3, i3) -> i3
        %4809 = "comb.xor"(%4807, %4733) : (i1, i1) -> i1
        %4810 = "comb.and"(%4804, %arg5) : (i1, i1) -> i1
        %4811 = "comb.mux"(%4810, %4736, %4808) : (i1, i3, i3) -> i3
        %4812 = "comb.xor"(%4810, %4733) : (i1, i1) -> i1
        %4813 = "comb.and"(%4803, %arg4) : (i1, i1) -> i1
        %4814 = "comb.mux"(%4813, %4735, %4811) : (i1, i3, i3) -> i3
        %4815 = "comb.xor"(%4813, %4733) : (i1, i1) -> i1
        %4816 = "comb.mux"(%4779, %4780, %4784) : (i1, i3, i3) -> i3
        %4817 = "comb.and"(%4763, %4788) : (i1, i1) -> i1
        %4818 = "comb.and"(%4805, %4795) : (i1, i1) -> i1
        %4819 = "comb.and"(%4771, %4817) : (i1, i1) -> i1
        %4820 = "comb.and"(%4770, %4776, %4791) : (i1, i1, i1) -> i1
        %4821 = "comb.or"(%4818, %4819, %4820) : (i1, i1, i1) -> i1
        %4822 = "comb.mux"(%4821, %4816, %4814) : (i1, i3, i3) -> i3
        %4823 = "comb.xor"(%4821, %4733) : (i1, i1) -> i1
        %4824 = "comb.and"(%4817, %arg4) : (i1, i1) -> i1
        %4825 = "comb.mux"(%4824, %4735, %4822) : (i1, i3, i3) -> i3
        %4826 = "comb.xor"(%4824, %4733) : (i1, i1) -> i1
        %4827 = "comb.mux"(%arg3, %4739, %4825) : (i1, i3, i3) -> i3
        %4828 = "comb.xor"(%arg7, %4733) : (i1, i1) -> i1
        %4829 = "comb.and"(%4806, %4828) : (i1, i1) -> i1
        %4830 = "comb.mux"(%4829, %4746, %4827) : (i1, i3, i3) -> i3
        %4831 = "comb.xor"(%4829, %4733) : (i1, i1) -> i1
        %4832 = "comb.and"(%4831, %4788, %4826, %4823, %4815, %4812, %4809, %4801, %4798, %4787) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4833 = "comb.and"(%4745) : (i1) -> i1
        "fsm.return"(%4833) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %4629 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4630 = "hw.constant"() <{value = true}> : () -> i1
        %4631 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4632 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4633 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4634 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4635 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4636 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4637 = "hw.constant"() <{value = true}> : () -> i1
        %4638 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4639 = "comb.xor"(%arg1, %4637) : (i1, i1) -> i1
        %4640 = "seq.initial"() ({
          %4731 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4731) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4641 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4642 = "comb.icmp"(%4727, %4641) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4643 = "seq.compreg"(%4727, %arg0, %4639, %4638, %4640) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4644 = "comb.icmp"(%4643, %4636) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4645 = "comb.and"(%4644, %arg2) : (i1, i1) -> i1
        %4646 = "comb.icmp"(%4643, %4635) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4647 = "comb.icmp"(%4643, %4634) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4648 = "comb.icmp"(%4643, %4633) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4649 = "comb.icmp"(%4643, %4633) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4650 = "comb.icmp"(%4727, %4633) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4651 = "comb.and"(%4649, %4650) : (i1, i1) -> i1
        %4652 = "comb.icmp"(%4643, %4634) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4653 = "comb.icmp"(%4727, %4634) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4654 = "comb.and"(%4652, %4653) : (i1, i1) -> i1
        %4655 = "comb.and"(%4644, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4656 = "comb.and"(%4647, %arg6) : (i1, i1) -> i1
        %4657 = "comb.or"(%arg4, %arg5, %arg3, %4656) : (i1, i1, i1, i1) -> i1
        %4658 = "comb.or"(%4655, %4657) : (i1, i1) -> i1
        %4659 = "comb.xor"(%4657, %4630) : (i1, i1) -> i1
        %4660 = "comb.icmp"(%4643, %4636) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4661 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4662 = "comb.icmp"(%4643, %4635) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4663 = "comb.icmp"(%4643, %4631) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4664 = "comb.icmp"(%4643, %4634) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4665 = "comb.mux"(%4663, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4666 = "comb.mux"(%4663, %4634, %4636) : (i1, i3, i3) -> i3
        %4667 = "comb.icmp"(%4643, %4632) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4668 = "comb.xor"(%arg4, %4630) : (i1, i1) -> i1
        %4669 = "comb.and"(%4660, %4668) : (i1, i1) -> i1
        %4670 = "comb.xor"(%4660, %4630) : (i1, i1) -> i1
        %4671 = "comb.xor"(%4662, %4630) : (i1, i1) -> i1
        %4672 = "comb.xor"(%4663, %4630) : (i1, i1) -> i1
        %4673 = "comb.xor"(%4664, %4630) : (i1, i1) -> i1
        %4674 = "comb.and"(%4673, %4672, %4671, %4670, %4667) : (i1, i1, i1, i1, i1) -> i1
        %4675 = "comb.or"(%4674, %4669) : (i1, i1) -> i1
        %4676 = "comb.mux"(%4675, %arg5, %4665) : (i1, i1, i1) -> i1
        %4677 = "comb.mux"(%4675, %4633, %4666) : (i1, i3, i3) -> i3
        %4678 = "comb.xor"(%4669, %4630) : (i1, i1) -> i1
        %4679 = "comb.xor"(%4661, %4630) : (i1, i1) -> i1
        %4680 = "comb.or"(%4674, %4678, %4679) : (i1, i1, i1) -> i1
        %4681 = "comb.mux"(%4680, %4643, %4634) : (i1, i3, i3) -> i3
        %4682 = "comb.icmp"(%4643, %4633) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4683 = "comb.mux"(%4682, %4643, %4636) : (i1, i3, i3) -> i3
        %4684 = "comb.xor"(%4682, %4630) : (i1, i1) -> i1
        %4685 = "comb.xor"(%arg3, %4630) : (i1, i1) -> i1
        %4686 = "comb.and"(%4670, %4685) : (i1, i1) -> i1
        %4687 = "comb.and"(%4671, %4686) : (i1, i1) -> i1
        %4688 = "comb.and"(%4672, %4687) : (i1, i1) -> i1
        %4689 = "comb.and"(%4664, %4688) : (i1, i1) -> i1
        %4690 = "comb.and"(%4663, %4687) : (i1, i1) -> i1
        %4691 = "comb.or"(%4689, %4690) : (i1, i1) -> i1
        %4692 = "comb.and"(%4668, %4691) : (i1, i1) -> i1
        %4693 = "comb.and"(%4692, %arg5) : (i1, i1) -> i1
        %4694 = "comb.mux"(%4693, %4633, %4683) : (i1, i3, i3) -> i3
        %4695 = "comb.xor"(%4693, %4630) : (i1, i1) -> i1
        %4696 = "comb.and"(%4691, %arg4) : (i1, i1) -> i1
        %4697 = "comb.mux"(%4696, %4632, %4694) : (i1, i3, i3) -> i3
        %4698 = "comb.xor"(%4696, %4630) : (i1, i1) -> i1
        %4699 = "comb.concat"(%4629, %arg8) : (i2, i1) -> i3
        %4700 = "comb.and"(%4662, %4686) : (i1, i1) -> i1
        %4701 = "comb.and"(%4668, %4700) : (i1, i1) -> i1
        %4702 = "comb.xor"(%arg5, %4630) : (i1, i1) -> i1
        %4703 = "comb.and"(%4702, %4701) : (i1, i1) -> i1
        %4704 = "comb.and"(%arg7, %4703) : (i1, i1) -> i1
        %4705 = "comb.mux"(%4704, %4699, %4697) : (i1, i3, i3) -> i3
        %4706 = "comb.xor"(%4704, %4630) : (i1, i1) -> i1
        %4707 = "comb.and"(%4701, %arg5) : (i1, i1) -> i1
        %4708 = "comb.mux"(%4707, %4633, %4705) : (i1, i3, i3) -> i3
        %4709 = "comb.xor"(%4707, %4630) : (i1, i1) -> i1
        %4710 = "comb.and"(%4700, %arg4) : (i1, i1) -> i1
        %4711 = "comb.mux"(%4710, %4632, %4708) : (i1, i3, i3) -> i3
        %4712 = "comb.xor"(%4710, %4630) : (i1, i1) -> i1
        %4713 = "comb.mux"(%4676, %4677, %4681) : (i1, i3, i3) -> i3
        %4714 = "comb.and"(%4660, %4685) : (i1, i1) -> i1
        %4715 = "comb.and"(%4702, %4692) : (i1, i1) -> i1
        %4716 = "comb.and"(%4668, %4714) : (i1, i1) -> i1
        %4717 = "comb.and"(%4667, %4673, %4688) : (i1, i1, i1) -> i1
        %4718 = "comb.or"(%4715, %4716, %4717) : (i1, i1, i1) -> i1
        %4719 = "comb.mux"(%4718, %4713, %4711) : (i1, i3, i3) -> i3
        %4720 = "comb.xor"(%4718, %4630) : (i1, i1) -> i1
        %4721 = "comb.and"(%4714, %arg4) : (i1, i1) -> i1
        %4722 = "comb.mux"(%4721, %4632, %4719) : (i1, i3, i3) -> i3
        %4723 = "comb.xor"(%4721, %4630) : (i1, i1) -> i1
        %4724 = "comb.mux"(%arg3, %4636, %4722) : (i1, i3, i3) -> i3
        %4725 = "comb.xor"(%arg7, %4630) : (i1, i1) -> i1
        %4726 = "comb.and"(%4703, %4725) : (i1, i1) -> i1
        %4727 = "comb.mux"(%4726, %4643, %4724) : (i1, i3, i3) -> i3
        %4728 = "comb.xor"(%4726, %4630) : (i1, i1) -> i1
        %4729 = "comb.and"(%4728, %4685, %4723, %4720, %4712, %4709, %4706, %4698, %4695, %4684) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4730 = "comb.and"(%4642) : (i1) -> i1
        "fsm.return"(%4730) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %4526 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4527 = "hw.constant"() <{value = true}> : () -> i1
        %4528 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4529 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4530 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4531 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4532 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4533 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4534 = "hw.constant"() <{value = true}> : () -> i1
        %4535 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4536 = "comb.xor"(%arg1, %4534) : (i1, i1) -> i1
        %4537 = "seq.initial"() ({
          %4628 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4628) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4538 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4539 = "comb.icmp"(%4624, %4538) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4540 = "seq.compreg"(%4624, %arg0, %4536, %4535, %4537) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4541 = "comb.icmp"(%4540, %4533) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4542 = "comb.and"(%4541, %arg2) : (i1, i1) -> i1
        %4543 = "comb.icmp"(%4540, %4532) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4544 = "comb.icmp"(%4540, %4531) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4545 = "comb.icmp"(%4540, %4530) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4546 = "comb.icmp"(%4540, %4530) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4547 = "comb.icmp"(%4624, %4530) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4548 = "comb.and"(%4546, %4547) : (i1, i1) -> i1
        %4549 = "comb.icmp"(%4540, %4531) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4550 = "comb.icmp"(%4624, %4531) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4551 = "comb.and"(%4549, %4550) : (i1, i1) -> i1
        %4552 = "comb.and"(%4541, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4553 = "comb.and"(%4544, %arg6) : (i1, i1) -> i1
        %4554 = "comb.or"(%arg4, %arg5, %arg3, %4553) : (i1, i1, i1, i1) -> i1
        %4555 = "comb.or"(%4552, %4554) : (i1, i1) -> i1
        %4556 = "comb.xor"(%4554, %4527) : (i1, i1) -> i1
        %4557 = "comb.icmp"(%4540, %4533) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4558 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4559 = "comb.icmp"(%4540, %4532) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4560 = "comb.icmp"(%4540, %4528) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4561 = "comb.icmp"(%4540, %4531) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4562 = "comb.mux"(%4560, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4563 = "comb.mux"(%4560, %4531, %4533) : (i1, i3, i3) -> i3
        %4564 = "comb.icmp"(%4540, %4529) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4565 = "comb.xor"(%arg4, %4527) : (i1, i1) -> i1
        %4566 = "comb.and"(%4557, %4565) : (i1, i1) -> i1
        %4567 = "comb.xor"(%4557, %4527) : (i1, i1) -> i1
        %4568 = "comb.xor"(%4559, %4527) : (i1, i1) -> i1
        %4569 = "comb.xor"(%4560, %4527) : (i1, i1) -> i1
        %4570 = "comb.xor"(%4561, %4527) : (i1, i1) -> i1
        %4571 = "comb.and"(%4570, %4569, %4568, %4567, %4564) : (i1, i1, i1, i1, i1) -> i1
        %4572 = "comb.or"(%4571, %4566) : (i1, i1) -> i1
        %4573 = "comb.mux"(%4572, %arg5, %4562) : (i1, i1, i1) -> i1
        %4574 = "comb.mux"(%4572, %4530, %4563) : (i1, i3, i3) -> i3
        %4575 = "comb.xor"(%4566, %4527) : (i1, i1) -> i1
        %4576 = "comb.xor"(%4558, %4527) : (i1, i1) -> i1
        %4577 = "comb.or"(%4571, %4575, %4576) : (i1, i1, i1) -> i1
        %4578 = "comb.mux"(%4577, %4540, %4531) : (i1, i3, i3) -> i3
        %4579 = "comb.icmp"(%4540, %4530) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4580 = "comb.mux"(%4579, %4540, %4533) : (i1, i3, i3) -> i3
        %4581 = "comb.xor"(%4579, %4527) : (i1, i1) -> i1
        %4582 = "comb.xor"(%arg3, %4527) : (i1, i1) -> i1
        %4583 = "comb.and"(%4567, %4582) : (i1, i1) -> i1
        %4584 = "comb.and"(%4568, %4583) : (i1, i1) -> i1
        %4585 = "comb.and"(%4569, %4584) : (i1, i1) -> i1
        %4586 = "comb.and"(%4561, %4585) : (i1, i1) -> i1
        %4587 = "comb.and"(%4560, %4584) : (i1, i1) -> i1
        %4588 = "comb.or"(%4586, %4587) : (i1, i1) -> i1
        %4589 = "comb.and"(%4565, %4588) : (i1, i1) -> i1
        %4590 = "comb.and"(%4589, %arg5) : (i1, i1) -> i1
        %4591 = "comb.mux"(%4590, %4530, %4580) : (i1, i3, i3) -> i3
        %4592 = "comb.xor"(%4590, %4527) : (i1, i1) -> i1
        %4593 = "comb.and"(%4588, %arg4) : (i1, i1) -> i1
        %4594 = "comb.mux"(%4593, %4529, %4591) : (i1, i3, i3) -> i3
        %4595 = "comb.xor"(%4593, %4527) : (i1, i1) -> i1
        %4596 = "comb.concat"(%4526, %arg8) : (i2, i1) -> i3
        %4597 = "comb.and"(%4559, %4583) : (i1, i1) -> i1
        %4598 = "comb.and"(%4565, %4597) : (i1, i1) -> i1
        %4599 = "comb.xor"(%arg5, %4527) : (i1, i1) -> i1
        %4600 = "comb.and"(%4599, %4598) : (i1, i1) -> i1
        %4601 = "comb.and"(%arg7, %4600) : (i1, i1) -> i1
        %4602 = "comb.mux"(%4601, %4596, %4594) : (i1, i3, i3) -> i3
        %4603 = "comb.xor"(%4601, %4527) : (i1, i1) -> i1
        %4604 = "comb.and"(%4598, %arg5) : (i1, i1) -> i1
        %4605 = "comb.mux"(%4604, %4530, %4602) : (i1, i3, i3) -> i3
        %4606 = "comb.xor"(%4604, %4527) : (i1, i1) -> i1
        %4607 = "comb.and"(%4597, %arg4) : (i1, i1) -> i1
        %4608 = "comb.mux"(%4607, %4529, %4605) : (i1, i3, i3) -> i3
        %4609 = "comb.xor"(%4607, %4527) : (i1, i1) -> i1
        %4610 = "comb.mux"(%4573, %4574, %4578) : (i1, i3, i3) -> i3
        %4611 = "comb.and"(%4557, %4582) : (i1, i1) -> i1
        %4612 = "comb.and"(%4599, %4589) : (i1, i1) -> i1
        %4613 = "comb.and"(%4565, %4611) : (i1, i1) -> i1
        %4614 = "comb.and"(%4564, %4570, %4585) : (i1, i1, i1) -> i1
        %4615 = "comb.or"(%4612, %4613, %4614) : (i1, i1, i1) -> i1
        %4616 = "comb.mux"(%4615, %4610, %4608) : (i1, i3, i3) -> i3
        %4617 = "comb.xor"(%4615, %4527) : (i1, i1) -> i1
        %4618 = "comb.and"(%4611, %arg4) : (i1, i1) -> i1
        %4619 = "comb.mux"(%4618, %4529, %4616) : (i1, i3, i3) -> i3
        %4620 = "comb.xor"(%4618, %4527) : (i1, i1) -> i1
        %4621 = "comb.mux"(%arg3, %4533, %4619) : (i1, i3, i3) -> i3
        %4622 = "comb.xor"(%arg7, %4527) : (i1, i1) -> i1
        %4623 = "comb.and"(%4600, %4622) : (i1, i1) -> i1
        %4624 = "comb.mux"(%4623, %4540, %4621) : (i1, i3, i3) -> i3
        %4625 = "comb.xor"(%4623, %4527) : (i1, i1) -> i1
        %4626 = "comb.and"(%4625, %4582, %4620, %4617, %4609, %4606, %4603, %4595, %4592, %4581) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4627 = "comb.and"(%4539) : (i1) -> i1
        "fsm.return"(%4627) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %4423 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4424 = "hw.constant"() <{value = true}> : () -> i1
        %4425 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4426 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4427 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4428 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4429 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4430 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4431 = "hw.constant"() <{value = true}> : () -> i1
        %4432 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4433 = "comb.xor"(%arg1, %4431) : (i1, i1) -> i1
        %4434 = "seq.initial"() ({
          %4525 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4525) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4435 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4436 = "comb.icmp"(%4521, %4435) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4437 = "seq.compreg"(%4521, %arg0, %4433, %4432, %4434) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4438 = "comb.icmp"(%4437, %4430) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4439 = "comb.and"(%4438, %arg2) : (i1, i1) -> i1
        %4440 = "comb.icmp"(%4437, %4429) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4441 = "comb.icmp"(%4437, %4428) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4442 = "comb.icmp"(%4437, %4427) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4443 = "comb.icmp"(%4437, %4427) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4444 = "comb.icmp"(%4521, %4427) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4445 = "comb.and"(%4443, %4444) : (i1, i1) -> i1
        %4446 = "comb.icmp"(%4437, %4428) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4447 = "comb.icmp"(%4521, %4428) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4448 = "comb.and"(%4446, %4447) : (i1, i1) -> i1
        %4449 = "comb.and"(%4438, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4450 = "comb.and"(%4441, %arg6) : (i1, i1) -> i1
        %4451 = "comb.or"(%arg4, %arg5, %arg3, %4450) : (i1, i1, i1, i1) -> i1
        %4452 = "comb.or"(%4449, %4451) : (i1, i1) -> i1
        %4453 = "comb.xor"(%4451, %4424) : (i1, i1) -> i1
        %4454 = "comb.icmp"(%4437, %4430) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4455 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4456 = "comb.icmp"(%4437, %4429) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4457 = "comb.icmp"(%4437, %4425) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4458 = "comb.icmp"(%4437, %4428) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4459 = "comb.mux"(%4457, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4460 = "comb.mux"(%4457, %4428, %4430) : (i1, i3, i3) -> i3
        %4461 = "comb.icmp"(%4437, %4426) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4462 = "comb.xor"(%arg4, %4424) : (i1, i1) -> i1
        %4463 = "comb.and"(%4454, %4462) : (i1, i1) -> i1
        %4464 = "comb.xor"(%4454, %4424) : (i1, i1) -> i1
        %4465 = "comb.xor"(%4456, %4424) : (i1, i1) -> i1
        %4466 = "comb.xor"(%4457, %4424) : (i1, i1) -> i1
        %4467 = "comb.xor"(%4458, %4424) : (i1, i1) -> i1
        %4468 = "comb.and"(%4467, %4466, %4465, %4464, %4461) : (i1, i1, i1, i1, i1) -> i1
        %4469 = "comb.or"(%4468, %4463) : (i1, i1) -> i1
        %4470 = "comb.mux"(%4469, %arg5, %4459) : (i1, i1, i1) -> i1
        %4471 = "comb.mux"(%4469, %4427, %4460) : (i1, i3, i3) -> i3
        %4472 = "comb.xor"(%4463, %4424) : (i1, i1) -> i1
        %4473 = "comb.xor"(%4455, %4424) : (i1, i1) -> i1
        %4474 = "comb.or"(%4468, %4472, %4473) : (i1, i1, i1) -> i1
        %4475 = "comb.mux"(%4474, %4437, %4428) : (i1, i3, i3) -> i3
        %4476 = "comb.icmp"(%4437, %4427) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4477 = "comb.mux"(%4476, %4437, %4430) : (i1, i3, i3) -> i3
        %4478 = "comb.xor"(%4476, %4424) : (i1, i1) -> i1
        %4479 = "comb.xor"(%arg3, %4424) : (i1, i1) -> i1
        %4480 = "comb.and"(%4464, %4479) : (i1, i1) -> i1
        %4481 = "comb.and"(%4465, %4480) : (i1, i1) -> i1
        %4482 = "comb.and"(%4466, %4481) : (i1, i1) -> i1
        %4483 = "comb.and"(%4458, %4482) : (i1, i1) -> i1
        %4484 = "comb.and"(%4457, %4481) : (i1, i1) -> i1
        %4485 = "comb.or"(%4483, %4484) : (i1, i1) -> i1
        %4486 = "comb.and"(%4462, %4485) : (i1, i1) -> i1
        %4487 = "comb.and"(%4486, %arg5) : (i1, i1) -> i1
        %4488 = "comb.mux"(%4487, %4427, %4477) : (i1, i3, i3) -> i3
        %4489 = "comb.xor"(%4487, %4424) : (i1, i1) -> i1
        %4490 = "comb.and"(%4485, %arg4) : (i1, i1) -> i1
        %4491 = "comb.mux"(%4490, %4426, %4488) : (i1, i3, i3) -> i3
        %4492 = "comb.xor"(%4490, %4424) : (i1, i1) -> i1
        %4493 = "comb.concat"(%4423, %arg8) : (i2, i1) -> i3
        %4494 = "comb.and"(%4456, %4480) : (i1, i1) -> i1
        %4495 = "comb.and"(%4462, %4494) : (i1, i1) -> i1
        %4496 = "comb.xor"(%arg5, %4424) : (i1, i1) -> i1
        %4497 = "comb.and"(%4496, %4495) : (i1, i1) -> i1
        %4498 = "comb.and"(%arg7, %4497) : (i1, i1) -> i1
        %4499 = "comb.mux"(%4498, %4493, %4491) : (i1, i3, i3) -> i3
        %4500 = "comb.xor"(%4498, %4424) : (i1, i1) -> i1
        %4501 = "comb.and"(%4495, %arg5) : (i1, i1) -> i1
        %4502 = "comb.mux"(%4501, %4427, %4499) : (i1, i3, i3) -> i3
        %4503 = "comb.xor"(%4501, %4424) : (i1, i1) -> i1
        %4504 = "comb.and"(%4494, %arg4) : (i1, i1) -> i1
        %4505 = "comb.mux"(%4504, %4426, %4502) : (i1, i3, i3) -> i3
        %4506 = "comb.xor"(%4504, %4424) : (i1, i1) -> i1
        %4507 = "comb.mux"(%4470, %4471, %4475) : (i1, i3, i3) -> i3
        %4508 = "comb.and"(%4454, %4479) : (i1, i1) -> i1
        %4509 = "comb.and"(%4496, %4486) : (i1, i1) -> i1
        %4510 = "comb.and"(%4462, %4508) : (i1, i1) -> i1
        %4511 = "comb.and"(%4461, %4467, %4482) : (i1, i1, i1) -> i1
        %4512 = "comb.or"(%4509, %4510, %4511) : (i1, i1, i1) -> i1
        %4513 = "comb.mux"(%4512, %4507, %4505) : (i1, i3, i3) -> i3
        %4514 = "comb.xor"(%4512, %4424) : (i1, i1) -> i1
        %4515 = "comb.and"(%4508, %arg4) : (i1, i1) -> i1
        %4516 = "comb.mux"(%4515, %4426, %4513) : (i1, i3, i3) -> i3
        %4517 = "comb.xor"(%4515, %4424) : (i1, i1) -> i1
        %4518 = "comb.mux"(%arg3, %4430, %4516) : (i1, i3, i3) -> i3
        %4519 = "comb.xor"(%arg7, %4424) : (i1, i1) -> i1
        %4520 = "comb.and"(%4497, %4519) : (i1, i1) -> i1
        %4521 = "comb.mux"(%4520, %4437, %4518) : (i1, i3, i3) -> i3
        %4522 = "comb.xor"(%4520, %4424) : (i1, i1) -> i1
        %4523 = "comb.and"(%4522, %4479, %4517, %4514, %4506, %4503, %4500, %4492, %4489, %4478) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4524 = "comb.and"(%4436) : (i1) -> i1
        "fsm.return"(%4524) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %4320 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4321 = "hw.constant"() <{value = true}> : () -> i1
        %4322 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4323 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4324 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4325 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4326 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4327 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4328 = "hw.constant"() <{value = true}> : () -> i1
        %4329 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4330 = "comb.xor"(%arg1, %4328) : (i1, i1) -> i1
        %4331 = "seq.initial"() ({
          %4422 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4422) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4332 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4333 = "comb.icmp"(%4418, %4332) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4334 = "seq.compreg"(%4418, %arg0, %4330, %4329, %4331) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4335 = "comb.icmp"(%4334, %4327) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4336 = "comb.and"(%4335, %arg2) : (i1, i1) -> i1
        %4337 = "comb.icmp"(%4334, %4326) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4338 = "comb.icmp"(%4334, %4325) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4339 = "comb.icmp"(%4334, %4324) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4340 = "comb.icmp"(%4334, %4324) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4341 = "comb.icmp"(%4418, %4324) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4342 = "comb.and"(%4340, %4341) : (i1, i1) -> i1
        %4343 = "comb.icmp"(%4334, %4325) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4344 = "comb.icmp"(%4418, %4325) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4345 = "comb.and"(%4343, %4344) : (i1, i1) -> i1
        %4346 = "comb.and"(%4335, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4347 = "comb.and"(%4338, %arg6) : (i1, i1) -> i1
        %4348 = "comb.or"(%arg4, %arg5, %arg3, %4347) : (i1, i1, i1, i1) -> i1
        %4349 = "comb.or"(%4346, %4348) : (i1, i1) -> i1
        %4350 = "comb.xor"(%4348, %4321) : (i1, i1) -> i1
        %4351 = "comb.icmp"(%4334, %4327) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4352 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4353 = "comb.icmp"(%4334, %4326) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4354 = "comb.icmp"(%4334, %4322) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4355 = "comb.icmp"(%4334, %4325) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4356 = "comb.mux"(%4354, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4357 = "comb.mux"(%4354, %4325, %4327) : (i1, i3, i3) -> i3
        %4358 = "comb.icmp"(%4334, %4323) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4359 = "comb.xor"(%arg4, %4321) : (i1, i1) -> i1
        %4360 = "comb.and"(%4351, %4359) : (i1, i1) -> i1
        %4361 = "comb.xor"(%4351, %4321) : (i1, i1) -> i1
        %4362 = "comb.xor"(%4353, %4321) : (i1, i1) -> i1
        %4363 = "comb.xor"(%4354, %4321) : (i1, i1) -> i1
        %4364 = "comb.xor"(%4355, %4321) : (i1, i1) -> i1
        %4365 = "comb.and"(%4364, %4363, %4362, %4361, %4358) : (i1, i1, i1, i1, i1) -> i1
        %4366 = "comb.or"(%4365, %4360) : (i1, i1) -> i1
        %4367 = "comb.mux"(%4366, %arg5, %4356) : (i1, i1, i1) -> i1
        %4368 = "comb.mux"(%4366, %4324, %4357) : (i1, i3, i3) -> i3
        %4369 = "comb.xor"(%4360, %4321) : (i1, i1) -> i1
        %4370 = "comb.xor"(%4352, %4321) : (i1, i1) -> i1
        %4371 = "comb.or"(%4365, %4369, %4370) : (i1, i1, i1) -> i1
        %4372 = "comb.mux"(%4371, %4334, %4325) : (i1, i3, i3) -> i3
        %4373 = "comb.icmp"(%4334, %4324) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4374 = "comb.mux"(%4373, %4334, %4327) : (i1, i3, i3) -> i3
        %4375 = "comb.xor"(%4373, %4321) : (i1, i1) -> i1
        %4376 = "comb.xor"(%arg3, %4321) : (i1, i1) -> i1
        %4377 = "comb.and"(%4361, %4376) : (i1, i1) -> i1
        %4378 = "comb.and"(%4362, %4377) : (i1, i1) -> i1
        %4379 = "comb.and"(%4363, %4378) : (i1, i1) -> i1
        %4380 = "comb.and"(%4355, %4379) : (i1, i1) -> i1
        %4381 = "comb.and"(%4354, %4378) : (i1, i1) -> i1
        %4382 = "comb.or"(%4380, %4381) : (i1, i1) -> i1
        %4383 = "comb.and"(%4359, %4382) : (i1, i1) -> i1
        %4384 = "comb.and"(%4383, %arg5) : (i1, i1) -> i1
        %4385 = "comb.mux"(%4384, %4324, %4374) : (i1, i3, i3) -> i3
        %4386 = "comb.xor"(%4384, %4321) : (i1, i1) -> i1
        %4387 = "comb.and"(%4382, %arg4) : (i1, i1) -> i1
        %4388 = "comb.mux"(%4387, %4323, %4385) : (i1, i3, i3) -> i3
        %4389 = "comb.xor"(%4387, %4321) : (i1, i1) -> i1
        %4390 = "comb.concat"(%4320, %arg8) : (i2, i1) -> i3
        %4391 = "comb.and"(%4353, %4377) : (i1, i1) -> i1
        %4392 = "comb.and"(%4359, %4391) : (i1, i1) -> i1
        %4393 = "comb.xor"(%arg5, %4321) : (i1, i1) -> i1
        %4394 = "comb.and"(%4393, %4392) : (i1, i1) -> i1
        %4395 = "comb.and"(%arg7, %4394) : (i1, i1) -> i1
        %4396 = "comb.mux"(%4395, %4390, %4388) : (i1, i3, i3) -> i3
        %4397 = "comb.xor"(%4395, %4321) : (i1, i1) -> i1
        %4398 = "comb.and"(%4392, %arg5) : (i1, i1) -> i1
        %4399 = "comb.mux"(%4398, %4324, %4396) : (i1, i3, i3) -> i3
        %4400 = "comb.xor"(%4398, %4321) : (i1, i1) -> i1
        %4401 = "comb.and"(%4391, %arg4) : (i1, i1) -> i1
        %4402 = "comb.mux"(%4401, %4323, %4399) : (i1, i3, i3) -> i3
        %4403 = "comb.xor"(%4401, %4321) : (i1, i1) -> i1
        %4404 = "comb.mux"(%4367, %4368, %4372) : (i1, i3, i3) -> i3
        %4405 = "comb.and"(%4351, %4376) : (i1, i1) -> i1
        %4406 = "comb.and"(%4393, %4383) : (i1, i1) -> i1
        %4407 = "comb.and"(%4359, %4405) : (i1, i1) -> i1
        %4408 = "comb.and"(%4358, %4364, %4379) : (i1, i1, i1) -> i1
        %4409 = "comb.or"(%4406, %4407, %4408) : (i1, i1, i1) -> i1
        %4410 = "comb.mux"(%4409, %4404, %4402) : (i1, i3, i3) -> i3
        %4411 = "comb.xor"(%4409, %4321) : (i1, i1) -> i1
        %4412 = "comb.and"(%4405, %arg4) : (i1, i1) -> i1
        %4413 = "comb.mux"(%4412, %4323, %4410) : (i1, i3, i3) -> i3
        %4414 = "comb.xor"(%4412, %4321) : (i1, i1) -> i1
        %4415 = "comb.mux"(%arg3, %4327, %4413) : (i1, i3, i3) -> i3
        %4416 = "comb.xor"(%arg7, %4321) : (i1, i1) -> i1
        %4417 = "comb.and"(%4394, %4416) : (i1, i1) -> i1
        %4418 = "comb.mux"(%4417, %4334, %4415) : (i1, i3, i3) -> i3
        %4419 = "comb.xor"(%4417, %4321) : (i1, i1) -> i1
        %4420 = "comb.and"(%4419, %4376, %4414, %4411, %4403, %4400, %4397, %4389, %4386, %4375) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4421 = "comb.and"(%4333) : (i1) -> i1
        "fsm.return"(%4421) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_4"}> ({
      %4286 = "hw.constant"() <{value = true}> : () -> i1
      %4287 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %4288 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %4289 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %4290 = "hw.constant"() <{value = -4 : i3}> : () -> i3
      %4291 = "hw.constant"() <{value = false}> : () -> i1
      %4292 = "hw.constant"() <{value = false}> : () -> i1
      %4293 = "hw.constant"() <{value = false}> : () -> i1
      %4294 = "hw.constant"() <{value = false}> : () -> i1
      %4295 = "hw.constant"() <{value = false}> : () -> i1
      %4296 = "comb.or"(%arg4, %arg5, %arg3, %4295) : (i1, i1, i1, i1) -> i1
      %4297 = "comb.xor"(%4296, %4286) : (i1, i1) -> i1
      %4298 = "hw.constant"() <{value = true}> : () -> i1
      %4299 = "hw.constant"() <{value = true}> : () -> i1
      %4300 = "hw.constant"() <{value = true}> : () -> i1
      %4301 = "comb.xor"(%arg3, %4286) : (i1, i1) -> i1
      %4302 = "hw.constant"() <{value = true}> : () -> i1
      %4303 = "hw.constant"() <{value = true}> : () -> i1
      %4304 = "hw.constant"() <{value = true}> : () -> i1
      %4305 = "hw.constant"() <{value = true}> : () -> i1
      %4306 = "hw.constant"() <{value = true}> : () -> i1
      %4307 = "comb.mux"(%arg5, %4287, %4290) : (i1, i3, i3) -> i3
      %4308 = "hw.constant"() <{value = false}> : () -> i1
      %4309 = "hw.constant"() <{value = false}> : () -> i1
      %4310 = "comb.and"(%4301, %4299, %4298) : (i1, i1, i1) -> i1
      %4311 = "comb.or"(%4310, %4309, %4308) : (i1, i1, i1) -> i1
      %4312 = "comb.mux"(%4311, %4307, %4289) : (i1, i3, i3) -> i3
      %4313 = "comb.xor"(%4311, %4286) : (i1, i1) -> i1
      %4314 = "hw.constant"() <{value = true}> : () -> i1
      %4315 = "comb.mux"(%arg3, %4289, %4312) : (i1, i3, i3) -> i3
      %4316 = "hw.constant"() <{value = true}> : () -> i1
      %4317 = "comb.and"(%4301, %4313, %4314, %4306, %4305, %4316, %4304, %4302, %4303, %4300) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      %4318 = "comb.icmp"(%4315, %4287) <{predicate = 0 : i64}> : (i3, i3) -> i1
      %4319 = "comb.icmp"(%4315, %4288) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%4291, %4292, %4293, %4294, %4296, %4297, %4319, %4318, %4317) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %4183 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4184 = "hw.constant"() <{value = true}> : () -> i1
        %4185 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4186 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4187 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4188 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4189 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4190 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4191 = "hw.constant"() <{value = true}> : () -> i1
        %4192 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4193 = "comb.xor"(%arg1, %4191) : (i1, i1) -> i1
        %4194 = "seq.initial"() ({
          %4285 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4285) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4195 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %4196 = "comb.icmp"(%4281, %4195) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4197 = "seq.compreg"(%4281, %arg0, %4193, %4192, %4194) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4198 = "comb.icmp"(%4197, %4190) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4199 = "comb.and"(%4198, %arg2) : (i1, i1) -> i1
        %4200 = "comb.icmp"(%4197, %4189) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4201 = "comb.icmp"(%4197, %4188) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4202 = "comb.icmp"(%4197, %4187) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4203 = "comb.icmp"(%4197, %4187) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4204 = "comb.icmp"(%4281, %4187) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4205 = "comb.and"(%4203, %4204) : (i1, i1) -> i1
        %4206 = "comb.icmp"(%4197, %4188) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4207 = "comb.icmp"(%4281, %4188) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4208 = "comb.and"(%4206, %4207) : (i1, i1) -> i1
        %4209 = "comb.and"(%4198, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4210 = "comb.and"(%4201, %arg6) : (i1, i1) -> i1
        %4211 = "comb.or"(%arg4, %arg5, %arg3, %4210) : (i1, i1, i1, i1) -> i1
        %4212 = "comb.or"(%4209, %4211) : (i1, i1) -> i1
        %4213 = "comb.xor"(%4211, %4184) : (i1, i1) -> i1
        %4214 = "comb.icmp"(%4197, %4190) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4215 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4216 = "comb.icmp"(%4197, %4189) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4217 = "comb.icmp"(%4197, %4185) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4218 = "comb.icmp"(%4197, %4188) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4219 = "comb.mux"(%4217, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4220 = "comb.mux"(%4217, %4188, %4190) : (i1, i3, i3) -> i3
        %4221 = "comb.icmp"(%4197, %4186) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4222 = "comb.xor"(%arg4, %4184) : (i1, i1) -> i1
        %4223 = "comb.and"(%4214, %4222) : (i1, i1) -> i1
        %4224 = "comb.xor"(%4214, %4184) : (i1, i1) -> i1
        %4225 = "comb.xor"(%4216, %4184) : (i1, i1) -> i1
        %4226 = "comb.xor"(%4217, %4184) : (i1, i1) -> i1
        %4227 = "comb.xor"(%4218, %4184) : (i1, i1) -> i1
        %4228 = "comb.and"(%4227, %4226, %4225, %4224, %4221) : (i1, i1, i1, i1, i1) -> i1
        %4229 = "comb.or"(%4228, %4223) : (i1, i1) -> i1
        %4230 = "comb.mux"(%4229, %arg5, %4219) : (i1, i1, i1) -> i1
        %4231 = "comb.mux"(%4229, %4187, %4220) : (i1, i3, i3) -> i3
        %4232 = "comb.xor"(%4223, %4184) : (i1, i1) -> i1
        %4233 = "comb.xor"(%4215, %4184) : (i1, i1) -> i1
        %4234 = "comb.or"(%4228, %4232, %4233) : (i1, i1, i1) -> i1
        %4235 = "comb.mux"(%4234, %4197, %4188) : (i1, i3, i3) -> i3
        %4236 = "comb.icmp"(%4197, %4187) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4237 = "comb.mux"(%4236, %4197, %4190) : (i1, i3, i3) -> i3
        %4238 = "comb.xor"(%4236, %4184) : (i1, i1) -> i1
        %4239 = "comb.xor"(%arg3, %4184) : (i1, i1) -> i1
        %4240 = "comb.and"(%4224, %4239) : (i1, i1) -> i1
        %4241 = "comb.and"(%4225, %4240) : (i1, i1) -> i1
        %4242 = "comb.and"(%4226, %4241) : (i1, i1) -> i1
        %4243 = "comb.and"(%4218, %4242) : (i1, i1) -> i1
        %4244 = "comb.and"(%4217, %4241) : (i1, i1) -> i1
        %4245 = "comb.or"(%4243, %4244) : (i1, i1) -> i1
        %4246 = "comb.and"(%4222, %4245) : (i1, i1) -> i1
        %4247 = "comb.and"(%4246, %arg5) : (i1, i1) -> i1
        %4248 = "comb.mux"(%4247, %4187, %4237) : (i1, i3, i3) -> i3
        %4249 = "comb.xor"(%4247, %4184) : (i1, i1) -> i1
        %4250 = "comb.and"(%4245, %arg4) : (i1, i1) -> i1
        %4251 = "comb.mux"(%4250, %4186, %4248) : (i1, i3, i3) -> i3
        %4252 = "comb.xor"(%4250, %4184) : (i1, i1) -> i1
        %4253 = "comb.concat"(%4183, %arg8) : (i2, i1) -> i3
        %4254 = "comb.and"(%4216, %4240) : (i1, i1) -> i1
        %4255 = "comb.and"(%4222, %4254) : (i1, i1) -> i1
        %4256 = "comb.xor"(%arg5, %4184) : (i1, i1) -> i1
        %4257 = "comb.and"(%4256, %4255) : (i1, i1) -> i1
        %4258 = "comb.and"(%arg7, %4257) : (i1, i1) -> i1
        %4259 = "comb.mux"(%4258, %4253, %4251) : (i1, i3, i3) -> i3
        %4260 = "comb.xor"(%4258, %4184) : (i1, i1) -> i1
        %4261 = "comb.and"(%4255, %arg5) : (i1, i1) -> i1
        %4262 = "comb.mux"(%4261, %4187, %4259) : (i1, i3, i3) -> i3
        %4263 = "comb.xor"(%4261, %4184) : (i1, i1) -> i1
        %4264 = "comb.and"(%4254, %arg4) : (i1, i1) -> i1
        %4265 = "comb.mux"(%4264, %4186, %4262) : (i1, i3, i3) -> i3
        %4266 = "comb.xor"(%4264, %4184) : (i1, i1) -> i1
        %4267 = "comb.mux"(%4230, %4231, %4235) : (i1, i3, i3) -> i3
        %4268 = "comb.and"(%4214, %4239) : (i1, i1) -> i1
        %4269 = "comb.and"(%4256, %4246) : (i1, i1) -> i1
        %4270 = "comb.and"(%4222, %4268) : (i1, i1) -> i1
        %4271 = "comb.and"(%4221, %4227, %4242) : (i1, i1, i1) -> i1
        %4272 = "comb.or"(%4269, %4270, %4271) : (i1, i1, i1) -> i1
        %4273 = "comb.mux"(%4272, %4267, %4265) : (i1, i3, i3) -> i3
        %4274 = "comb.xor"(%4272, %4184) : (i1, i1) -> i1
        %4275 = "comb.and"(%4268, %arg4) : (i1, i1) -> i1
        %4276 = "comb.mux"(%4275, %4186, %4273) : (i1, i3, i3) -> i3
        %4277 = "comb.xor"(%4275, %4184) : (i1, i1) -> i1
        %4278 = "comb.mux"(%arg3, %4190, %4276) : (i1, i3, i3) -> i3
        %4279 = "comb.xor"(%arg7, %4184) : (i1, i1) -> i1
        %4280 = "comb.and"(%4257, %4279) : (i1, i1) -> i1
        %4281 = "comb.mux"(%4280, %4197, %4278) : (i1, i3, i3) -> i3
        %4282 = "comb.xor"(%4280, %4184) : (i1, i1) -> i1
        %4283 = "comb.and"(%4282, %4239, %4277, %4274, %4266, %4263, %4260, %4252, %4249, %4238) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4284 = "comb.and"(%4196) : (i1) -> i1
        "fsm.return"(%4284) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %4080 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %4081 = "hw.constant"() <{value = true}> : () -> i1
        %4082 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %4083 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4084 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %4085 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %4086 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %4087 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4088 = "hw.constant"() <{value = true}> : () -> i1
        %4089 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %4090 = "comb.xor"(%arg1, %4088) : (i1, i1) -> i1
        %4091 = "seq.initial"() ({
          %4182 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4182) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %4092 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %4093 = "comb.icmp"(%4178, %4092) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4094 = "seq.compreg"(%4178, %arg0, %4090, %4089, %4091) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %4095 = "comb.icmp"(%4094, %4087) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %4096 = "comb.and"(%4095, %arg2) : (i1, i1) -> i1
        %4097 = "comb.icmp"(%4094, %4086) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4098 = "comb.icmp"(%4094, %4085) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4099 = "comb.icmp"(%4094, %4084) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4100 = "comb.icmp"(%4094, %4084) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4101 = "comb.icmp"(%4178, %4084) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4102 = "comb.and"(%4100, %4101) : (i1, i1) -> i1
        %4103 = "comb.icmp"(%4094, %4085) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4104 = "comb.icmp"(%4178, %4085) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4105 = "comb.and"(%4103, %4104) : (i1, i1) -> i1
        %4106 = "comb.and"(%4095, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4107 = "comb.and"(%4098, %arg6) : (i1, i1) -> i1
        %4108 = "comb.or"(%arg4, %arg5, %arg3, %4107) : (i1, i1, i1, i1) -> i1
        %4109 = "comb.or"(%4106, %4108) : (i1, i1) -> i1
        %4110 = "comb.xor"(%4108, %4081) : (i1, i1) -> i1
        %4111 = "comb.icmp"(%4094, %4087) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4112 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4113 = "comb.icmp"(%4094, %4086) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4114 = "comb.icmp"(%4094, %4082) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4115 = "comb.icmp"(%4094, %4085) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4116 = "comb.mux"(%4114, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4117 = "comb.mux"(%4114, %4085, %4087) : (i1, i3, i3) -> i3
        %4118 = "comb.icmp"(%4094, %4083) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4119 = "comb.xor"(%arg4, %4081) : (i1, i1) -> i1
        %4120 = "comb.and"(%4111, %4119) : (i1, i1) -> i1
        %4121 = "comb.xor"(%4111, %4081) : (i1, i1) -> i1
        %4122 = "comb.xor"(%4113, %4081) : (i1, i1) -> i1
        %4123 = "comb.xor"(%4114, %4081) : (i1, i1) -> i1
        %4124 = "comb.xor"(%4115, %4081) : (i1, i1) -> i1
        %4125 = "comb.and"(%4124, %4123, %4122, %4121, %4118) : (i1, i1, i1, i1, i1) -> i1
        %4126 = "comb.or"(%4125, %4120) : (i1, i1) -> i1
        %4127 = "comb.mux"(%4126, %arg5, %4116) : (i1, i1, i1) -> i1
        %4128 = "comb.mux"(%4126, %4084, %4117) : (i1, i3, i3) -> i3
        %4129 = "comb.xor"(%4120, %4081) : (i1, i1) -> i1
        %4130 = "comb.xor"(%4112, %4081) : (i1, i1) -> i1
        %4131 = "comb.or"(%4125, %4129, %4130) : (i1, i1, i1) -> i1
        %4132 = "comb.mux"(%4131, %4094, %4085) : (i1, i3, i3) -> i3
        %4133 = "comb.icmp"(%4094, %4084) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4134 = "comb.mux"(%4133, %4094, %4087) : (i1, i3, i3) -> i3
        %4135 = "comb.xor"(%4133, %4081) : (i1, i1) -> i1
        %4136 = "comb.xor"(%arg3, %4081) : (i1, i1) -> i1
        %4137 = "comb.and"(%4121, %4136) : (i1, i1) -> i1
        %4138 = "comb.and"(%4122, %4137) : (i1, i1) -> i1
        %4139 = "comb.and"(%4123, %4138) : (i1, i1) -> i1
        %4140 = "comb.and"(%4115, %4139) : (i1, i1) -> i1
        %4141 = "comb.and"(%4114, %4138) : (i1, i1) -> i1
        %4142 = "comb.or"(%4140, %4141) : (i1, i1) -> i1
        %4143 = "comb.and"(%4119, %4142) : (i1, i1) -> i1
        %4144 = "comb.and"(%4143, %arg5) : (i1, i1) -> i1
        %4145 = "comb.mux"(%4144, %4084, %4134) : (i1, i3, i3) -> i3
        %4146 = "comb.xor"(%4144, %4081) : (i1, i1) -> i1
        %4147 = "comb.and"(%4142, %arg4) : (i1, i1) -> i1
        %4148 = "comb.mux"(%4147, %4083, %4145) : (i1, i3, i3) -> i3
        %4149 = "comb.xor"(%4147, %4081) : (i1, i1) -> i1
        %4150 = "comb.concat"(%4080, %arg8) : (i2, i1) -> i3
        %4151 = "comb.and"(%4113, %4137) : (i1, i1) -> i1
        %4152 = "comb.and"(%4119, %4151) : (i1, i1) -> i1
        %4153 = "comb.xor"(%arg5, %4081) : (i1, i1) -> i1
        %4154 = "comb.and"(%4153, %4152) : (i1, i1) -> i1
        %4155 = "comb.and"(%arg7, %4154) : (i1, i1) -> i1
        %4156 = "comb.mux"(%4155, %4150, %4148) : (i1, i3, i3) -> i3
        %4157 = "comb.xor"(%4155, %4081) : (i1, i1) -> i1
        %4158 = "comb.and"(%4152, %arg5) : (i1, i1) -> i1
        %4159 = "comb.mux"(%4158, %4084, %4156) : (i1, i3, i3) -> i3
        %4160 = "comb.xor"(%4158, %4081) : (i1, i1) -> i1
        %4161 = "comb.and"(%4151, %arg4) : (i1, i1) -> i1
        %4162 = "comb.mux"(%4161, %4083, %4159) : (i1, i3, i3) -> i3
        %4163 = "comb.xor"(%4161, %4081) : (i1, i1) -> i1
        %4164 = "comb.mux"(%4127, %4128, %4132) : (i1, i3, i3) -> i3
        %4165 = "comb.and"(%4111, %4136) : (i1, i1) -> i1
        %4166 = "comb.and"(%4153, %4143) : (i1, i1) -> i1
        %4167 = "comb.and"(%4119, %4165) : (i1, i1) -> i1
        %4168 = "comb.and"(%4118, %4124, %4139) : (i1, i1, i1) -> i1
        %4169 = "comb.or"(%4166, %4167, %4168) : (i1, i1, i1) -> i1
        %4170 = "comb.mux"(%4169, %4164, %4162) : (i1, i3, i3) -> i3
        %4171 = "comb.xor"(%4169, %4081) : (i1, i1) -> i1
        %4172 = "comb.and"(%4165, %arg4) : (i1, i1) -> i1
        %4173 = "comb.mux"(%4172, %4083, %4170) : (i1, i3, i3) -> i3
        %4174 = "comb.xor"(%4172, %4081) : (i1, i1) -> i1
        %4175 = "comb.mux"(%arg3, %4087, %4173) : (i1, i3, i3) -> i3
        %4176 = "comb.xor"(%arg7, %4081) : (i1, i1) -> i1
        %4177 = "comb.and"(%4154, %4176) : (i1, i1) -> i1
        %4178 = "comb.mux"(%4177, %4094, %4175) : (i1, i3, i3) -> i3
        %4179 = "comb.xor"(%4177, %4081) : (i1, i1) -> i1
        %4180 = "comb.and"(%4179, %4136, %4174, %4171, %4163, %4160, %4157, %4149, %4146, %4135) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4181 = "comb.and"(%4093) : (i1) -> i1
        "fsm.return"(%4181) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %3977 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3978 = "hw.constant"() <{value = true}> : () -> i1
        %3979 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3980 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3981 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3982 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3983 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3984 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3985 = "hw.constant"() <{value = true}> : () -> i1
        %3986 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3987 = "comb.xor"(%arg1, %3985) : (i1, i1) -> i1
        %3988 = "seq.initial"() ({
          %4079 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%4079) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3989 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3990 = "comb.icmp"(%4075, %3989) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3991 = "seq.compreg"(%4075, %arg0, %3987, %3986, %3988) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3992 = "comb.icmp"(%3991, %3984) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3993 = "comb.and"(%3992, %arg2) : (i1, i1) -> i1
        %3994 = "comb.icmp"(%3991, %3983) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3995 = "comb.icmp"(%3991, %3982) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3996 = "comb.icmp"(%3991, %3981) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3997 = "comb.icmp"(%3991, %3981) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3998 = "comb.icmp"(%4075, %3981) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3999 = "comb.and"(%3997, %3998) : (i1, i1) -> i1
        %4000 = "comb.icmp"(%3991, %3982) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %4001 = "comb.icmp"(%4075, %3982) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %4002 = "comb.and"(%4000, %4001) : (i1, i1) -> i1
        %4003 = "comb.and"(%3992, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %4004 = "comb.and"(%3995, %arg6) : (i1, i1) -> i1
        %4005 = "comb.or"(%arg4, %arg5, %arg3, %4004) : (i1, i1, i1, i1) -> i1
        %4006 = "comb.or"(%4003, %4005) : (i1, i1) -> i1
        %4007 = "comb.xor"(%4005, %3978) : (i1, i1) -> i1
        %4008 = "comb.icmp"(%3991, %3984) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4009 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %4010 = "comb.icmp"(%3991, %3983) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4011 = "comb.icmp"(%3991, %3979) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4012 = "comb.icmp"(%3991, %3982) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4013 = "comb.mux"(%4011, %arg8, %arg6) : (i1, i1, i1) -> i1
        %4014 = "comb.mux"(%4011, %3982, %3984) : (i1, i3, i3) -> i3
        %4015 = "comb.icmp"(%3991, %3980) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4016 = "comb.xor"(%arg4, %3978) : (i1, i1) -> i1
        %4017 = "comb.and"(%4008, %4016) : (i1, i1) -> i1
        %4018 = "comb.xor"(%4008, %3978) : (i1, i1) -> i1
        %4019 = "comb.xor"(%4010, %3978) : (i1, i1) -> i1
        %4020 = "comb.xor"(%4011, %3978) : (i1, i1) -> i1
        %4021 = "comb.xor"(%4012, %3978) : (i1, i1) -> i1
        %4022 = "comb.and"(%4021, %4020, %4019, %4018, %4015) : (i1, i1, i1, i1, i1) -> i1
        %4023 = "comb.or"(%4022, %4017) : (i1, i1) -> i1
        %4024 = "comb.mux"(%4023, %arg5, %4013) : (i1, i1, i1) -> i1
        %4025 = "comb.mux"(%4023, %3981, %4014) : (i1, i3, i3) -> i3
        %4026 = "comb.xor"(%4017, %3978) : (i1, i1) -> i1
        %4027 = "comb.xor"(%4009, %3978) : (i1, i1) -> i1
        %4028 = "comb.or"(%4022, %4026, %4027) : (i1, i1, i1) -> i1
        %4029 = "comb.mux"(%4028, %3991, %3982) : (i1, i3, i3) -> i3
        %4030 = "comb.icmp"(%3991, %3981) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %4031 = "comb.mux"(%4030, %3991, %3984) : (i1, i3, i3) -> i3
        %4032 = "comb.xor"(%4030, %3978) : (i1, i1) -> i1
        %4033 = "comb.xor"(%arg3, %3978) : (i1, i1) -> i1
        %4034 = "comb.and"(%4018, %4033) : (i1, i1) -> i1
        %4035 = "comb.and"(%4019, %4034) : (i1, i1) -> i1
        %4036 = "comb.and"(%4020, %4035) : (i1, i1) -> i1
        %4037 = "comb.and"(%4012, %4036) : (i1, i1) -> i1
        %4038 = "comb.and"(%4011, %4035) : (i1, i1) -> i1
        %4039 = "comb.or"(%4037, %4038) : (i1, i1) -> i1
        %4040 = "comb.and"(%4016, %4039) : (i1, i1) -> i1
        %4041 = "comb.and"(%4040, %arg5) : (i1, i1) -> i1
        %4042 = "comb.mux"(%4041, %3981, %4031) : (i1, i3, i3) -> i3
        %4043 = "comb.xor"(%4041, %3978) : (i1, i1) -> i1
        %4044 = "comb.and"(%4039, %arg4) : (i1, i1) -> i1
        %4045 = "comb.mux"(%4044, %3980, %4042) : (i1, i3, i3) -> i3
        %4046 = "comb.xor"(%4044, %3978) : (i1, i1) -> i1
        %4047 = "comb.concat"(%3977, %arg8) : (i2, i1) -> i3
        %4048 = "comb.and"(%4010, %4034) : (i1, i1) -> i1
        %4049 = "comb.and"(%4016, %4048) : (i1, i1) -> i1
        %4050 = "comb.xor"(%arg5, %3978) : (i1, i1) -> i1
        %4051 = "comb.and"(%4050, %4049) : (i1, i1) -> i1
        %4052 = "comb.and"(%arg7, %4051) : (i1, i1) -> i1
        %4053 = "comb.mux"(%4052, %4047, %4045) : (i1, i3, i3) -> i3
        %4054 = "comb.xor"(%4052, %3978) : (i1, i1) -> i1
        %4055 = "comb.and"(%4049, %arg5) : (i1, i1) -> i1
        %4056 = "comb.mux"(%4055, %3981, %4053) : (i1, i3, i3) -> i3
        %4057 = "comb.xor"(%4055, %3978) : (i1, i1) -> i1
        %4058 = "comb.and"(%4048, %arg4) : (i1, i1) -> i1
        %4059 = "comb.mux"(%4058, %3980, %4056) : (i1, i3, i3) -> i3
        %4060 = "comb.xor"(%4058, %3978) : (i1, i1) -> i1
        %4061 = "comb.mux"(%4024, %4025, %4029) : (i1, i3, i3) -> i3
        %4062 = "comb.and"(%4008, %4033) : (i1, i1) -> i1
        %4063 = "comb.and"(%4050, %4040) : (i1, i1) -> i1
        %4064 = "comb.and"(%4016, %4062) : (i1, i1) -> i1
        %4065 = "comb.and"(%4015, %4021, %4036) : (i1, i1, i1) -> i1
        %4066 = "comb.or"(%4063, %4064, %4065) : (i1, i1, i1) -> i1
        %4067 = "comb.mux"(%4066, %4061, %4059) : (i1, i3, i3) -> i3
        %4068 = "comb.xor"(%4066, %3978) : (i1, i1) -> i1
        %4069 = "comb.and"(%4062, %arg4) : (i1, i1) -> i1
        %4070 = "comb.mux"(%4069, %3980, %4067) : (i1, i3, i3) -> i3
        %4071 = "comb.xor"(%4069, %3978) : (i1, i1) -> i1
        %4072 = "comb.mux"(%arg3, %3984, %4070) : (i1, i3, i3) -> i3
        %4073 = "comb.xor"(%arg7, %3978) : (i1, i1) -> i1
        %4074 = "comb.and"(%4051, %4073) : (i1, i1) -> i1
        %4075 = "comb.mux"(%4074, %3991, %4072) : (i1, i3, i3) -> i3
        %4076 = "comb.xor"(%4074, %3978) : (i1, i1) -> i1
        %4077 = "comb.and"(%4076, %4033, %4071, %4068, %4060, %4057, %4054, %4046, %4043, %4032) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %4078 = "comb.and"(%3990) : (i1) -> i1
        "fsm.return"(%4078) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %3874 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3875 = "hw.constant"() <{value = true}> : () -> i1
        %3876 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3877 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3878 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3879 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3880 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3881 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3882 = "hw.constant"() <{value = true}> : () -> i1
        %3883 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3884 = "comb.xor"(%arg1, %3882) : (i1, i1) -> i1
        %3885 = "seq.initial"() ({
          %3976 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3976) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3886 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3887 = "comb.icmp"(%3972, %3886) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3888 = "seq.compreg"(%3972, %arg0, %3884, %3883, %3885) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3889 = "comb.icmp"(%3888, %3881) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3890 = "comb.and"(%3889, %arg2) : (i1, i1) -> i1
        %3891 = "comb.icmp"(%3888, %3880) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3892 = "comb.icmp"(%3888, %3879) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3893 = "comb.icmp"(%3888, %3878) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3894 = "comb.icmp"(%3888, %3878) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3895 = "comb.icmp"(%3972, %3878) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3896 = "comb.and"(%3894, %3895) : (i1, i1) -> i1
        %3897 = "comb.icmp"(%3888, %3879) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3898 = "comb.icmp"(%3972, %3879) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3899 = "comb.and"(%3897, %3898) : (i1, i1) -> i1
        %3900 = "comb.and"(%3889, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3901 = "comb.and"(%3892, %arg6) : (i1, i1) -> i1
        %3902 = "comb.or"(%arg4, %arg5, %arg3, %3901) : (i1, i1, i1, i1) -> i1
        %3903 = "comb.or"(%3900, %3902) : (i1, i1) -> i1
        %3904 = "comb.xor"(%3902, %3875) : (i1, i1) -> i1
        %3905 = "comb.icmp"(%3888, %3881) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3906 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3907 = "comb.icmp"(%3888, %3880) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3908 = "comb.icmp"(%3888, %3876) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3909 = "comb.icmp"(%3888, %3879) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3910 = "comb.mux"(%3908, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3911 = "comb.mux"(%3908, %3879, %3881) : (i1, i3, i3) -> i3
        %3912 = "comb.icmp"(%3888, %3877) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3913 = "comb.xor"(%arg4, %3875) : (i1, i1) -> i1
        %3914 = "comb.and"(%3905, %3913) : (i1, i1) -> i1
        %3915 = "comb.xor"(%3905, %3875) : (i1, i1) -> i1
        %3916 = "comb.xor"(%3907, %3875) : (i1, i1) -> i1
        %3917 = "comb.xor"(%3908, %3875) : (i1, i1) -> i1
        %3918 = "comb.xor"(%3909, %3875) : (i1, i1) -> i1
        %3919 = "comb.and"(%3918, %3917, %3916, %3915, %3912) : (i1, i1, i1, i1, i1) -> i1
        %3920 = "comb.or"(%3919, %3914) : (i1, i1) -> i1
        %3921 = "comb.mux"(%3920, %arg5, %3910) : (i1, i1, i1) -> i1
        %3922 = "comb.mux"(%3920, %3878, %3911) : (i1, i3, i3) -> i3
        %3923 = "comb.xor"(%3914, %3875) : (i1, i1) -> i1
        %3924 = "comb.xor"(%3906, %3875) : (i1, i1) -> i1
        %3925 = "comb.or"(%3919, %3923, %3924) : (i1, i1, i1) -> i1
        %3926 = "comb.mux"(%3925, %3888, %3879) : (i1, i3, i3) -> i3
        %3927 = "comb.icmp"(%3888, %3878) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3928 = "comb.mux"(%3927, %3888, %3881) : (i1, i3, i3) -> i3
        %3929 = "comb.xor"(%3927, %3875) : (i1, i1) -> i1
        %3930 = "comb.xor"(%arg3, %3875) : (i1, i1) -> i1
        %3931 = "comb.and"(%3915, %3930) : (i1, i1) -> i1
        %3932 = "comb.and"(%3916, %3931) : (i1, i1) -> i1
        %3933 = "comb.and"(%3917, %3932) : (i1, i1) -> i1
        %3934 = "comb.and"(%3909, %3933) : (i1, i1) -> i1
        %3935 = "comb.and"(%3908, %3932) : (i1, i1) -> i1
        %3936 = "comb.or"(%3934, %3935) : (i1, i1) -> i1
        %3937 = "comb.and"(%3913, %3936) : (i1, i1) -> i1
        %3938 = "comb.and"(%3937, %arg5) : (i1, i1) -> i1
        %3939 = "comb.mux"(%3938, %3878, %3928) : (i1, i3, i3) -> i3
        %3940 = "comb.xor"(%3938, %3875) : (i1, i1) -> i1
        %3941 = "comb.and"(%3936, %arg4) : (i1, i1) -> i1
        %3942 = "comb.mux"(%3941, %3877, %3939) : (i1, i3, i3) -> i3
        %3943 = "comb.xor"(%3941, %3875) : (i1, i1) -> i1
        %3944 = "comb.concat"(%3874, %arg8) : (i2, i1) -> i3
        %3945 = "comb.and"(%3907, %3931) : (i1, i1) -> i1
        %3946 = "comb.and"(%3913, %3945) : (i1, i1) -> i1
        %3947 = "comb.xor"(%arg5, %3875) : (i1, i1) -> i1
        %3948 = "comb.and"(%3947, %3946) : (i1, i1) -> i1
        %3949 = "comb.and"(%arg7, %3948) : (i1, i1) -> i1
        %3950 = "comb.mux"(%3949, %3944, %3942) : (i1, i3, i3) -> i3
        %3951 = "comb.xor"(%3949, %3875) : (i1, i1) -> i1
        %3952 = "comb.and"(%3946, %arg5) : (i1, i1) -> i1
        %3953 = "comb.mux"(%3952, %3878, %3950) : (i1, i3, i3) -> i3
        %3954 = "comb.xor"(%3952, %3875) : (i1, i1) -> i1
        %3955 = "comb.and"(%3945, %arg4) : (i1, i1) -> i1
        %3956 = "comb.mux"(%3955, %3877, %3953) : (i1, i3, i3) -> i3
        %3957 = "comb.xor"(%3955, %3875) : (i1, i1) -> i1
        %3958 = "comb.mux"(%3921, %3922, %3926) : (i1, i3, i3) -> i3
        %3959 = "comb.and"(%3905, %3930) : (i1, i1) -> i1
        %3960 = "comb.and"(%3947, %3937) : (i1, i1) -> i1
        %3961 = "comb.and"(%3913, %3959) : (i1, i1) -> i1
        %3962 = "comb.and"(%3912, %3918, %3933) : (i1, i1, i1) -> i1
        %3963 = "comb.or"(%3960, %3961, %3962) : (i1, i1, i1) -> i1
        %3964 = "comb.mux"(%3963, %3958, %3956) : (i1, i3, i3) -> i3
        %3965 = "comb.xor"(%3963, %3875) : (i1, i1) -> i1
        %3966 = "comb.and"(%3959, %arg4) : (i1, i1) -> i1
        %3967 = "comb.mux"(%3966, %3877, %3964) : (i1, i3, i3) -> i3
        %3968 = "comb.xor"(%3966, %3875) : (i1, i1) -> i1
        %3969 = "comb.mux"(%arg3, %3881, %3967) : (i1, i3, i3) -> i3
        %3970 = "comb.xor"(%arg7, %3875) : (i1, i1) -> i1
        %3971 = "comb.and"(%3948, %3970) : (i1, i1) -> i1
        %3972 = "comb.mux"(%3971, %3888, %3969) : (i1, i3, i3) -> i3
        %3973 = "comb.xor"(%3971, %3875) : (i1, i1) -> i1
        %3974 = "comb.and"(%3973, %3930, %3968, %3965, %3957, %3954, %3951, %3943, %3940, %3929) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3975 = "comb.and"(%3887) : (i1) -> i1
        "fsm.return"(%3975) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %3771 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3772 = "hw.constant"() <{value = true}> : () -> i1
        %3773 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3774 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3775 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3776 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3777 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3778 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3779 = "hw.constant"() <{value = true}> : () -> i1
        %3780 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3781 = "comb.xor"(%arg1, %3779) : (i1, i1) -> i1
        %3782 = "seq.initial"() ({
          %3873 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3873) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3783 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3784 = "comb.icmp"(%3869, %3783) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3785 = "seq.compreg"(%3869, %arg0, %3781, %3780, %3782) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3786 = "comb.icmp"(%3785, %3778) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3787 = "comb.and"(%3786, %arg2) : (i1, i1) -> i1
        %3788 = "comb.icmp"(%3785, %3777) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3789 = "comb.icmp"(%3785, %3776) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3790 = "comb.icmp"(%3785, %3775) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3791 = "comb.icmp"(%3785, %3775) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3792 = "comb.icmp"(%3869, %3775) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3793 = "comb.and"(%3791, %3792) : (i1, i1) -> i1
        %3794 = "comb.icmp"(%3785, %3776) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3795 = "comb.icmp"(%3869, %3776) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3796 = "comb.and"(%3794, %3795) : (i1, i1) -> i1
        %3797 = "comb.and"(%3786, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3798 = "comb.and"(%3789, %arg6) : (i1, i1) -> i1
        %3799 = "comb.or"(%arg4, %arg5, %arg3, %3798) : (i1, i1, i1, i1) -> i1
        %3800 = "comb.or"(%3797, %3799) : (i1, i1) -> i1
        %3801 = "comb.xor"(%3799, %3772) : (i1, i1) -> i1
        %3802 = "comb.icmp"(%3785, %3778) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3803 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3804 = "comb.icmp"(%3785, %3777) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3805 = "comb.icmp"(%3785, %3773) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3806 = "comb.icmp"(%3785, %3776) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3807 = "comb.mux"(%3805, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3808 = "comb.mux"(%3805, %3776, %3778) : (i1, i3, i3) -> i3
        %3809 = "comb.icmp"(%3785, %3774) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3810 = "comb.xor"(%arg4, %3772) : (i1, i1) -> i1
        %3811 = "comb.and"(%3802, %3810) : (i1, i1) -> i1
        %3812 = "comb.xor"(%3802, %3772) : (i1, i1) -> i1
        %3813 = "comb.xor"(%3804, %3772) : (i1, i1) -> i1
        %3814 = "comb.xor"(%3805, %3772) : (i1, i1) -> i1
        %3815 = "comb.xor"(%3806, %3772) : (i1, i1) -> i1
        %3816 = "comb.and"(%3815, %3814, %3813, %3812, %3809) : (i1, i1, i1, i1, i1) -> i1
        %3817 = "comb.or"(%3816, %3811) : (i1, i1) -> i1
        %3818 = "comb.mux"(%3817, %arg5, %3807) : (i1, i1, i1) -> i1
        %3819 = "comb.mux"(%3817, %3775, %3808) : (i1, i3, i3) -> i3
        %3820 = "comb.xor"(%3811, %3772) : (i1, i1) -> i1
        %3821 = "comb.xor"(%3803, %3772) : (i1, i1) -> i1
        %3822 = "comb.or"(%3816, %3820, %3821) : (i1, i1, i1) -> i1
        %3823 = "comb.mux"(%3822, %3785, %3776) : (i1, i3, i3) -> i3
        %3824 = "comb.icmp"(%3785, %3775) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3825 = "comb.mux"(%3824, %3785, %3778) : (i1, i3, i3) -> i3
        %3826 = "comb.xor"(%3824, %3772) : (i1, i1) -> i1
        %3827 = "comb.xor"(%arg3, %3772) : (i1, i1) -> i1
        %3828 = "comb.and"(%3812, %3827) : (i1, i1) -> i1
        %3829 = "comb.and"(%3813, %3828) : (i1, i1) -> i1
        %3830 = "comb.and"(%3814, %3829) : (i1, i1) -> i1
        %3831 = "comb.and"(%3806, %3830) : (i1, i1) -> i1
        %3832 = "comb.and"(%3805, %3829) : (i1, i1) -> i1
        %3833 = "comb.or"(%3831, %3832) : (i1, i1) -> i1
        %3834 = "comb.and"(%3810, %3833) : (i1, i1) -> i1
        %3835 = "comb.and"(%3834, %arg5) : (i1, i1) -> i1
        %3836 = "comb.mux"(%3835, %3775, %3825) : (i1, i3, i3) -> i3
        %3837 = "comb.xor"(%3835, %3772) : (i1, i1) -> i1
        %3838 = "comb.and"(%3833, %arg4) : (i1, i1) -> i1
        %3839 = "comb.mux"(%3838, %3774, %3836) : (i1, i3, i3) -> i3
        %3840 = "comb.xor"(%3838, %3772) : (i1, i1) -> i1
        %3841 = "comb.concat"(%3771, %arg8) : (i2, i1) -> i3
        %3842 = "comb.and"(%3804, %3828) : (i1, i1) -> i1
        %3843 = "comb.and"(%3810, %3842) : (i1, i1) -> i1
        %3844 = "comb.xor"(%arg5, %3772) : (i1, i1) -> i1
        %3845 = "comb.and"(%3844, %3843) : (i1, i1) -> i1
        %3846 = "comb.and"(%arg7, %3845) : (i1, i1) -> i1
        %3847 = "comb.mux"(%3846, %3841, %3839) : (i1, i3, i3) -> i3
        %3848 = "comb.xor"(%3846, %3772) : (i1, i1) -> i1
        %3849 = "comb.and"(%3843, %arg5) : (i1, i1) -> i1
        %3850 = "comb.mux"(%3849, %3775, %3847) : (i1, i3, i3) -> i3
        %3851 = "comb.xor"(%3849, %3772) : (i1, i1) -> i1
        %3852 = "comb.and"(%3842, %arg4) : (i1, i1) -> i1
        %3853 = "comb.mux"(%3852, %3774, %3850) : (i1, i3, i3) -> i3
        %3854 = "comb.xor"(%3852, %3772) : (i1, i1) -> i1
        %3855 = "comb.mux"(%3818, %3819, %3823) : (i1, i3, i3) -> i3
        %3856 = "comb.and"(%3802, %3827) : (i1, i1) -> i1
        %3857 = "comb.and"(%3844, %3834) : (i1, i1) -> i1
        %3858 = "comb.and"(%3810, %3856) : (i1, i1) -> i1
        %3859 = "comb.and"(%3809, %3815, %3830) : (i1, i1, i1) -> i1
        %3860 = "comb.or"(%3857, %3858, %3859) : (i1, i1, i1) -> i1
        %3861 = "comb.mux"(%3860, %3855, %3853) : (i1, i3, i3) -> i3
        %3862 = "comb.xor"(%3860, %3772) : (i1, i1) -> i1
        %3863 = "comb.and"(%3856, %arg4) : (i1, i1) -> i1
        %3864 = "comb.mux"(%3863, %3774, %3861) : (i1, i3, i3) -> i3
        %3865 = "comb.xor"(%3863, %3772) : (i1, i1) -> i1
        %3866 = "comb.mux"(%arg3, %3778, %3864) : (i1, i3, i3) -> i3
        %3867 = "comb.xor"(%arg7, %3772) : (i1, i1) -> i1
        %3868 = "comb.and"(%3845, %3867) : (i1, i1) -> i1
        %3869 = "comb.mux"(%3868, %3785, %3866) : (i1, i3, i3) -> i3
        %3870 = "comb.xor"(%3868, %3772) : (i1, i1) -> i1
        %3871 = "comb.and"(%3870, %3827, %3865, %3862, %3854, %3851, %3848, %3840, %3837, %3826) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3872 = "comb.and"(%3784) : (i1) -> i1
        "fsm.return"(%3872) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %3668 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3669 = "hw.constant"() <{value = true}> : () -> i1
        %3670 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3671 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3672 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3673 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3674 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3675 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3676 = "hw.constant"() <{value = true}> : () -> i1
        %3677 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3678 = "comb.xor"(%arg1, %3676) : (i1, i1) -> i1
        %3679 = "seq.initial"() ({
          %3770 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3770) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3680 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3681 = "comb.icmp"(%3766, %3680) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3682 = "seq.compreg"(%3766, %arg0, %3678, %3677, %3679) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3683 = "comb.icmp"(%3682, %3675) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3684 = "comb.and"(%3683, %arg2) : (i1, i1) -> i1
        %3685 = "comb.icmp"(%3682, %3674) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3686 = "comb.icmp"(%3682, %3673) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3687 = "comb.icmp"(%3682, %3672) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3688 = "comb.icmp"(%3682, %3672) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3689 = "comb.icmp"(%3766, %3672) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3690 = "comb.and"(%3688, %3689) : (i1, i1) -> i1
        %3691 = "comb.icmp"(%3682, %3673) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3692 = "comb.icmp"(%3766, %3673) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3693 = "comb.and"(%3691, %3692) : (i1, i1) -> i1
        %3694 = "comb.and"(%3683, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3695 = "comb.and"(%3686, %arg6) : (i1, i1) -> i1
        %3696 = "comb.or"(%arg4, %arg5, %arg3, %3695) : (i1, i1, i1, i1) -> i1
        %3697 = "comb.or"(%3694, %3696) : (i1, i1) -> i1
        %3698 = "comb.xor"(%3696, %3669) : (i1, i1) -> i1
        %3699 = "comb.icmp"(%3682, %3675) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3700 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3701 = "comb.icmp"(%3682, %3674) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3702 = "comb.icmp"(%3682, %3670) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3703 = "comb.icmp"(%3682, %3673) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3704 = "comb.mux"(%3702, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3705 = "comb.mux"(%3702, %3673, %3675) : (i1, i3, i3) -> i3
        %3706 = "comb.icmp"(%3682, %3671) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3707 = "comb.xor"(%arg4, %3669) : (i1, i1) -> i1
        %3708 = "comb.and"(%3699, %3707) : (i1, i1) -> i1
        %3709 = "comb.xor"(%3699, %3669) : (i1, i1) -> i1
        %3710 = "comb.xor"(%3701, %3669) : (i1, i1) -> i1
        %3711 = "comb.xor"(%3702, %3669) : (i1, i1) -> i1
        %3712 = "comb.xor"(%3703, %3669) : (i1, i1) -> i1
        %3713 = "comb.and"(%3712, %3711, %3710, %3709, %3706) : (i1, i1, i1, i1, i1) -> i1
        %3714 = "comb.or"(%3713, %3708) : (i1, i1) -> i1
        %3715 = "comb.mux"(%3714, %arg5, %3704) : (i1, i1, i1) -> i1
        %3716 = "comb.mux"(%3714, %3672, %3705) : (i1, i3, i3) -> i3
        %3717 = "comb.xor"(%3708, %3669) : (i1, i1) -> i1
        %3718 = "comb.xor"(%3700, %3669) : (i1, i1) -> i1
        %3719 = "comb.or"(%3713, %3717, %3718) : (i1, i1, i1) -> i1
        %3720 = "comb.mux"(%3719, %3682, %3673) : (i1, i3, i3) -> i3
        %3721 = "comb.icmp"(%3682, %3672) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3722 = "comb.mux"(%3721, %3682, %3675) : (i1, i3, i3) -> i3
        %3723 = "comb.xor"(%3721, %3669) : (i1, i1) -> i1
        %3724 = "comb.xor"(%arg3, %3669) : (i1, i1) -> i1
        %3725 = "comb.and"(%3709, %3724) : (i1, i1) -> i1
        %3726 = "comb.and"(%3710, %3725) : (i1, i1) -> i1
        %3727 = "comb.and"(%3711, %3726) : (i1, i1) -> i1
        %3728 = "comb.and"(%3703, %3727) : (i1, i1) -> i1
        %3729 = "comb.and"(%3702, %3726) : (i1, i1) -> i1
        %3730 = "comb.or"(%3728, %3729) : (i1, i1) -> i1
        %3731 = "comb.and"(%3707, %3730) : (i1, i1) -> i1
        %3732 = "comb.and"(%3731, %arg5) : (i1, i1) -> i1
        %3733 = "comb.mux"(%3732, %3672, %3722) : (i1, i3, i3) -> i3
        %3734 = "comb.xor"(%3732, %3669) : (i1, i1) -> i1
        %3735 = "comb.and"(%3730, %arg4) : (i1, i1) -> i1
        %3736 = "comb.mux"(%3735, %3671, %3733) : (i1, i3, i3) -> i3
        %3737 = "comb.xor"(%3735, %3669) : (i1, i1) -> i1
        %3738 = "comb.concat"(%3668, %arg8) : (i2, i1) -> i3
        %3739 = "comb.and"(%3701, %3725) : (i1, i1) -> i1
        %3740 = "comb.and"(%3707, %3739) : (i1, i1) -> i1
        %3741 = "comb.xor"(%arg5, %3669) : (i1, i1) -> i1
        %3742 = "comb.and"(%3741, %3740) : (i1, i1) -> i1
        %3743 = "comb.and"(%arg7, %3742) : (i1, i1) -> i1
        %3744 = "comb.mux"(%3743, %3738, %3736) : (i1, i3, i3) -> i3
        %3745 = "comb.xor"(%3743, %3669) : (i1, i1) -> i1
        %3746 = "comb.and"(%3740, %arg5) : (i1, i1) -> i1
        %3747 = "comb.mux"(%3746, %3672, %3744) : (i1, i3, i3) -> i3
        %3748 = "comb.xor"(%3746, %3669) : (i1, i1) -> i1
        %3749 = "comb.and"(%3739, %arg4) : (i1, i1) -> i1
        %3750 = "comb.mux"(%3749, %3671, %3747) : (i1, i3, i3) -> i3
        %3751 = "comb.xor"(%3749, %3669) : (i1, i1) -> i1
        %3752 = "comb.mux"(%3715, %3716, %3720) : (i1, i3, i3) -> i3
        %3753 = "comb.and"(%3699, %3724) : (i1, i1) -> i1
        %3754 = "comb.and"(%3741, %3731) : (i1, i1) -> i1
        %3755 = "comb.and"(%3707, %3753) : (i1, i1) -> i1
        %3756 = "comb.and"(%3706, %3712, %3727) : (i1, i1, i1) -> i1
        %3757 = "comb.or"(%3754, %3755, %3756) : (i1, i1, i1) -> i1
        %3758 = "comb.mux"(%3757, %3752, %3750) : (i1, i3, i3) -> i3
        %3759 = "comb.xor"(%3757, %3669) : (i1, i1) -> i1
        %3760 = "comb.and"(%3753, %arg4) : (i1, i1) -> i1
        %3761 = "comb.mux"(%3760, %3671, %3758) : (i1, i3, i3) -> i3
        %3762 = "comb.xor"(%3760, %3669) : (i1, i1) -> i1
        %3763 = "comb.mux"(%arg3, %3675, %3761) : (i1, i3, i3) -> i3
        %3764 = "comb.xor"(%arg7, %3669) : (i1, i1) -> i1
        %3765 = "comb.and"(%3742, %3764) : (i1, i1) -> i1
        %3766 = "comb.mux"(%3765, %3682, %3763) : (i1, i3, i3) -> i3
        %3767 = "comb.xor"(%3765, %3669) : (i1, i1) -> i1
        %3768 = "comb.and"(%3767, %3724, %3762, %3759, %3751, %3748, %3745, %3737, %3734, %3723) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3769 = "comb.and"(%3681) : (i1) -> i1
        "fsm.return"(%3769) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %3565 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3566 = "hw.constant"() <{value = true}> : () -> i1
        %3567 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3568 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3569 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3570 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3571 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3572 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3573 = "hw.constant"() <{value = true}> : () -> i1
        %3574 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3575 = "comb.xor"(%arg1, %3573) : (i1, i1) -> i1
        %3576 = "seq.initial"() ({
          %3667 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3667) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3577 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3578 = "comb.icmp"(%3663, %3577) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3579 = "seq.compreg"(%3663, %arg0, %3575, %3574, %3576) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3580 = "comb.icmp"(%3579, %3572) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3581 = "comb.and"(%3580, %arg2) : (i1, i1) -> i1
        %3582 = "comb.icmp"(%3579, %3571) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3583 = "comb.icmp"(%3579, %3570) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3584 = "comb.icmp"(%3579, %3569) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3585 = "comb.icmp"(%3579, %3569) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3586 = "comb.icmp"(%3663, %3569) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3587 = "comb.and"(%3585, %3586) : (i1, i1) -> i1
        %3588 = "comb.icmp"(%3579, %3570) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3589 = "comb.icmp"(%3663, %3570) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3590 = "comb.and"(%3588, %3589) : (i1, i1) -> i1
        %3591 = "comb.and"(%3580, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3592 = "comb.and"(%3583, %arg6) : (i1, i1) -> i1
        %3593 = "comb.or"(%arg4, %arg5, %arg3, %3592) : (i1, i1, i1, i1) -> i1
        %3594 = "comb.or"(%3591, %3593) : (i1, i1) -> i1
        %3595 = "comb.xor"(%3593, %3566) : (i1, i1) -> i1
        %3596 = "comb.icmp"(%3579, %3572) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3597 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3598 = "comb.icmp"(%3579, %3571) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3599 = "comb.icmp"(%3579, %3567) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3600 = "comb.icmp"(%3579, %3570) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3601 = "comb.mux"(%3599, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3602 = "comb.mux"(%3599, %3570, %3572) : (i1, i3, i3) -> i3
        %3603 = "comb.icmp"(%3579, %3568) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3604 = "comb.xor"(%arg4, %3566) : (i1, i1) -> i1
        %3605 = "comb.and"(%3596, %3604) : (i1, i1) -> i1
        %3606 = "comb.xor"(%3596, %3566) : (i1, i1) -> i1
        %3607 = "comb.xor"(%3598, %3566) : (i1, i1) -> i1
        %3608 = "comb.xor"(%3599, %3566) : (i1, i1) -> i1
        %3609 = "comb.xor"(%3600, %3566) : (i1, i1) -> i1
        %3610 = "comb.and"(%3609, %3608, %3607, %3606, %3603) : (i1, i1, i1, i1, i1) -> i1
        %3611 = "comb.or"(%3610, %3605) : (i1, i1) -> i1
        %3612 = "comb.mux"(%3611, %arg5, %3601) : (i1, i1, i1) -> i1
        %3613 = "comb.mux"(%3611, %3569, %3602) : (i1, i3, i3) -> i3
        %3614 = "comb.xor"(%3605, %3566) : (i1, i1) -> i1
        %3615 = "comb.xor"(%3597, %3566) : (i1, i1) -> i1
        %3616 = "comb.or"(%3610, %3614, %3615) : (i1, i1, i1) -> i1
        %3617 = "comb.mux"(%3616, %3579, %3570) : (i1, i3, i3) -> i3
        %3618 = "comb.icmp"(%3579, %3569) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3619 = "comb.mux"(%3618, %3579, %3572) : (i1, i3, i3) -> i3
        %3620 = "comb.xor"(%3618, %3566) : (i1, i1) -> i1
        %3621 = "comb.xor"(%arg3, %3566) : (i1, i1) -> i1
        %3622 = "comb.and"(%3606, %3621) : (i1, i1) -> i1
        %3623 = "comb.and"(%3607, %3622) : (i1, i1) -> i1
        %3624 = "comb.and"(%3608, %3623) : (i1, i1) -> i1
        %3625 = "comb.and"(%3600, %3624) : (i1, i1) -> i1
        %3626 = "comb.and"(%3599, %3623) : (i1, i1) -> i1
        %3627 = "comb.or"(%3625, %3626) : (i1, i1) -> i1
        %3628 = "comb.and"(%3604, %3627) : (i1, i1) -> i1
        %3629 = "comb.and"(%3628, %arg5) : (i1, i1) -> i1
        %3630 = "comb.mux"(%3629, %3569, %3619) : (i1, i3, i3) -> i3
        %3631 = "comb.xor"(%3629, %3566) : (i1, i1) -> i1
        %3632 = "comb.and"(%3627, %arg4) : (i1, i1) -> i1
        %3633 = "comb.mux"(%3632, %3568, %3630) : (i1, i3, i3) -> i3
        %3634 = "comb.xor"(%3632, %3566) : (i1, i1) -> i1
        %3635 = "comb.concat"(%3565, %arg8) : (i2, i1) -> i3
        %3636 = "comb.and"(%3598, %3622) : (i1, i1) -> i1
        %3637 = "comb.and"(%3604, %3636) : (i1, i1) -> i1
        %3638 = "comb.xor"(%arg5, %3566) : (i1, i1) -> i1
        %3639 = "comb.and"(%3638, %3637) : (i1, i1) -> i1
        %3640 = "comb.and"(%arg7, %3639) : (i1, i1) -> i1
        %3641 = "comb.mux"(%3640, %3635, %3633) : (i1, i3, i3) -> i3
        %3642 = "comb.xor"(%3640, %3566) : (i1, i1) -> i1
        %3643 = "comb.and"(%3637, %arg5) : (i1, i1) -> i1
        %3644 = "comb.mux"(%3643, %3569, %3641) : (i1, i3, i3) -> i3
        %3645 = "comb.xor"(%3643, %3566) : (i1, i1) -> i1
        %3646 = "comb.and"(%3636, %arg4) : (i1, i1) -> i1
        %3647 = "comb.mux"(%3646, %3568, %3644) : (i1, i3, i3) -> i3
        %3648 = "comb.xor"(%3646, %3566) : (i1, i1) -> i1
        %3649 = "comb.mux"(%3612, %3613, %3617) : (i1, i3, i3) -> i3
        %3650 = "comb.and"(%3596, %3621) : (i1, i1) -> i1
        %3651 = "comb.and"(%3638, %3628) : (i1, i1) -> i1
        %3652 = "comb.and"(%3604, %3650) : (i1, i1) -> i1
        %3653 = "comb.and"(%3603, %3609, %3624) : (i1, i1, i1) -> i1
        %3654 = "comb.or"(%3651, %3652, %3653) : (i1, i1, i1) -> i1
        %3655 = "comb.mux"(%3654, %3649, %3647) : (i1, i3, i3) -> i3
        %3656 = "comb.xor"(%3654, %3566) : (i1, i1) -> i1
        %3657 = "comb.and"(%3650, %arg4) : (i1, i1) -> i1
        %3658 = "comb.mux"(%3657, %3568, %3655) : (i1, i3, i3) -> i3
        %3659 = "comb.xor"(%3657, %3566) : (i1, i1) -> i1
        %3660 = "comb.mux"(%arg3, %3572, %3658) : (i1, i3, i3) -> i3
        %3661 = "comb.xor"(%arg7, %3566) : (i1, i1) -> i1
        %3662 = "comb.and"(%3639, %3661) : (i1, i1) -> i1
        %3663 = "comb.mux"(%3662, %3579, %3660) : (i1, i3, i3) -> i3
        %3664 = "comb.xor"(%3662, %3566) : (i1, i1) -> i1
        %3665 = "comb.and"(%3664, %3621, %3659, %3656, %3648, %3645, %3642, %3634, %3631, %3620) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3666 = "comb.and"(%3578) : (i1) -> i1
        "fsm.return"(%3666) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %3462 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3463 = "hw.constant"() <{value = true}> : () -> i1
        %3464 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3465 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3466 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3467 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3468 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3469 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3470 = "hw.constant"() <{value = true}> : () -> i1
        %3471 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3472 = "comb.xor"(%arg1, %3470) : (i1, i1) -> i1
        %3473 = "seq.initial"() ({
          %3564 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3564) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3474 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3475 = "comb.icmp"(%3560, %3474) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3476 = "seq.compreg"(%3560, %arg0, %3472, %3471, %3473) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3477 = "comb.icmp"(%3476, %3469) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3478 = "comb.and"(%3477, %arg2) : (i1, i1) -> i1
        %3479 = "comb.icmp"(%3476, %3468) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3480 = "comb.icmp"(%3476, %3467) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3481 = "comb.icmp"(%3476, %3466) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3482 = "comb.icmp"(%3476, %3466) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3483 = "comb.icmp"(%3560, %3466) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3484 = "comb.and"(%3482, %3483) : (i1, i1) -> i1
        %3485 = "comb.icmp"(%3476, %3467) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3486 = "comb.icmp"(%3560, %3467) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3487 = "comb.and"(%3485, %3486) : (i1, i1) -> i1
        %3488 = "comb.and"(%3477, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3489 = "comb.and"(%3480, %arg6) : (i1, i1) -> i1
        %3490 = "comb.or"(%arg4, %arg5, %arg3, %3489) : (i1, i1, i1, i1) -> i1
        %3491 = "comb.or"(%3488, %3490) : (i1, i1) -> i1
        %3492 = "comb.xor"(%3490, %3463) : (i1, i1) -> i1
        %3493 = "comb.icmp"(%3476, %3469) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3494 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3495 = "comb.icmp"(%3476, %3468) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3496 = "comb.icmp"(%3476, %3464) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3497 = "comb.icmp"(%3476, %3467) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3498 = "comb.mux"(%3496, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3499 = "comb.mux"(%3496, %3467, %3469) : (i1, i3, i3) -> i3
        %3500 = "comb.icmp"(%3476, %3465) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3501 = "comb.xor"(%arg4, %3463) : (i1, i1) -> i1
        %3502 = "comb.and"(%3493, %3501) : (i1, i1) -> i1
        %3503 = "comb.xor"(%3493, %3463) : (i1, i1) -> i1
        %3504 = "comb.xor"(%3495, %3463) : (i1, i1) -> i1
        %3505 = "comb.xor"(%3496, %3463) : (i1, i1) -> i1
        %3506 = "comb.xor"(%3497, %3463) : (i1, i1) -> i1
        %3507 = "comb.and"(%3506, %3505, %3504, %3503, %3500) : (i1, i1, i1, i1, i1) -> i1
        %3508 = "comb.or"(%3507, %3502) : (i1, i1) -> i1
        %3509 = "comb.mux"(%3508, %arg5, %3498) : (i1, i1, i1) -> i1
        %3510 = "comb.mux"(%3508, %3466, %3499) : (i1, i3, i3) -> i3
        %3511 = "comb.xor"(%3502, %3463) : (i1, i1) -> i1
        %3512 = "comb.xor"(%3494, %3463) : (i1, i1) -> i1
        %3513 = "comb.or"(%3507, %3511, %3512) : (i1, i1, i1) -> i1
        %3514 = "comb.mux"(%3513, %3476, %3467) : (i1, i3, i3) -> i3
        %3515 = "comb.icmp"(%3476, %3466) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3516 = "comb.mux"(%3515, %3476, %3469) : (i1, i3, i3) -> i3
        %3517 = "comb.xor"(%3515, %3463) : (i1, i1) -> i1
        %3518 = "comb.xor"(%arg3, %3463) : (i1, i1) -> i1
        %3519 = "comb.and"(%3503, %3518) : (i1, i1) -> i1
        %3520 = "comb.and"(%3504, %3519) : (i1, i1) -> i1
        %3521 = "comb.and"(%3505, %3520) : (i1, i1) -> i1
        %3522 = "comb.and"(%3497, %3521) : (i1, i1) -> i1
        %3523 = "comb.and"(%3496, %3520) : (i1, i1) -> i1
        %3524 = "comb.or"(%3522, %3523) : (i1, i1) -> i1
        %3525 = "comb.and"(%3501, %3524) : (i1, i1) -> i1
        %3526 = "comb.and"(%3525, %arg5) : (i1, i1) -> i1
        %3527 = "comb.mux"(%3526, %3466, %3516) : (i1, i3, i3) -> i3
        %3528 = "comb.xor"(%3526, %3463) : (i1, i1) -> i1
        %3529 = "comb.and"(%3524, %arg4) : (i1, i1) -> i1
        %3530 = "comb.mux"(%3529, %3465, %3527) : (i1, i3, i3) -> i3
        %3531 = "comb.xor"(%3529, %3463) : (i1, i1) -> i1
        %3532 = "comb.concat"(%3462, %arg8) : (i2, i1) -> i3
        %3533 = "comb.and"(%3495, %3519) : (i1, i1) -> i1
        %3534 = "comb.and"(%3501, %3533) : (i1, i1) -> i1
        %3535 = "comb.xor"(%arg5, %3463) : (i1, i1) -> i1
        %3536 = "comb.and"(%3535, %3534) : (i1, i1) -> i1
        %3537 = "comb.and"(%arg7, %3536) : (i1, i1) -> i1
        %3538 = "comb.mux"(%3537, %3532, %3530) : (i1, i3, i3) -> i3
        %3539 = "comb.xor"(%3537, %3463) : (i1, i1) -> i1
        %3540 = "comb.and"(%3534, %arg5) : (i1, i1) -> i1
        %3541 = "comb.mux"(%3540, %3466, %3538) : (i1, i3, i3) -> i3
        %3542 = "comb.xor"(%3540, %3463) : (i1, i1) -> i1
        %3543 = "comb.and"(%3533, %arg4) : (i1, i1) -> i1
        %3544 = "comb.mux"(%3543, %3465, %3541) : (i1, i3, i3) -> i3
        %3545 = "comb.xor"(%3543, %3463) : (i1, i1) -> i1
        %3546 = "comb.mux"(%3509, %3510, %3514) : (i1, i3, i3) -> i3
        %3547 = "comb.and"(%3493, %3518) : (i1, i1) -> i1
        %3548 = "comb.and"(%3535, %3525) : (i1, i1) -> i1
        %3549 = "comb.and"(%3501, %3547) : (i1, i1) -> i1
        %3550 = "comb.and"(%3500, %3506, %3521) : (i1, i1, i1) -> i1
        %3551 = "comb.or"(%3548, %3549, %3550) : (i1, i1, i1) -> i1
        %3552 = "comb.mux"(%3551, %3546, %3544) : (i1, i3, i3) -> i3
        %3553 = "comb.xor"(%3551, %3463) : (i1, i1) -> i1
        %3554 = "comb.and"(%3547, %arg4) : (i1, i1) -> i1
        %3555 = "comb.mux"(%3554, %3465, %3552) : (i1, i3, i3) -> i3
        %3556 = "comb.xor"(%3554, %3463) : (i1, i1) -> i1
        %3557 = "comb.mux"(%arg3, %3469, %3555) : (i1, i3, i3) -> i3
        %3558 = "comb.xor"(%arg7, %3463) : (i1, i1) -> i1
        %3559 = "comb.and"(%3536, %3558) : (i1, i1) -> i1
        %3560 = "comb.mux"(%3559, %3476, %3557) : (i1, i3, i3) -> i3
        %3561 = "comb.xor"(%3559, %3463) : (i1, i1) -> i1
        %3562 = "comb.and"(%3561, %3518, %3556, %3553, %3545, %3542, %3539, %3531, %3528, %3517) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3563 = "comb.and"(%3475) : (i1) -> i1
        "fsm.return"(%3563) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_3"}> ({
      %3424 = "hw.constant"() <{value = true}> : () -> i1
      %3425 = "hw.constant"() <{value = -4 : i3}> : () -> i3
      %3426 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %3427 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %3428 = "hw.constant"() <{value = false}> : () -> i1
      %3429 = "hw.constant"() <{value = false}> : () -> i1
      %3430 = "hw.constant"() <{value = true}> : () -> i1
      %3431 = "hw.constant"() <{value = false}> : () -> i1
      %3432 = "hw.constant"() <{value = false}> : () -> i1
      %3433 = "comb.or"(%arg4, %arg5, %arg3, %arg6) : (i1, i1, i1, i1) -> i1
      %3434 = "comb.xor"(%3433, %3424) : (i1, i1) -> i1
      %3435 = "comb.xor"(%arg4, %3424) : (i1, i1) -> i1
      %3436 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %3437 = "hw.constant"() <{value = true}> : () -> i1
      %3438 = "comb.xor"(%arg3, %3424) : (i1, i1) -> i1
      %3439 = "comb.and"(%3435, %3438) : (i1, i1) -> i1
      %3440 = "comb.and"(%3439, %arg5) : (i1, i1) -> i1
      %3441 = "comb.mux"(%3440, %3426, %3427) : (i1, i3, i3) -> i3
      %3442 = "comb.xor"(%3440, %3424) : (i1, i1) -> i1
      %3443 = "comb.and"(%3438, %arg4) : (i1, i1) -> i1
      %3444 = "comb.mux"(%3443, %3425, %3441) : (i1, i3, i3) -> i3
      %3445 = "comb.xor"(%3443, %3424) : (i1, i1) -> i1
      %3446 = "comb.xor"(%arg5, %3424) : (i1, i1) -> i1
      %3447 = "hw.constant"() <{value = true}> : () -> i1
      %3448 = "hw.constant"() <{value = true}> : () -> i1
      %3449 = "hw.constant"() <{value = true}> : () -> i1
      %3450 = "comb.mux"(%arg6, %3427, %3436) : (i1, i3, i3) -> i3
      %3451 = "comb.and"(%3446, %3439) : (i1, i1) -> i1
      %3452 = "hw.constant"() <{value = false}> : () -> i1
      %3453 = "hw.constant"() <{value = false}> : () -> i1
      %3454 = "comb.or"(%3451, %3452, %3453) : (i1, i1, i1) -> i1
      %3455 = "comb.mux"(%3454, %3450, %3444) : (i1, i3, i3) -> i3
      %3456 = "comb.xor"(%3454, %3424) : (i1, i1) -> i1
      %3457 = "hw.constant"() <{value = true}> : () -> i1
      %3458 = "comb.mux"(%arg3, %3427, %3455) : (i1, i3, i3) -> i3
      %3459 = "hw.constant"() <{value = true}> : () -> i1
      %3460 = "comb.and"(%3438, %3456, %3445, %3442, %3457, %3449, %3448, %3459, %3447, %3437) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      %3461 = "comb.icmp"(%3458, %3426) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%3428, %3429, %3430, %3431, %3433, %3434, %3432, %3461, %3460) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %3321 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3322 = "hw.constant"() <{value = true}> : () -> i1
        %3323 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3324 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3325 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3326 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3327 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3328 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3329 = "hw.constant"() <{value = true}> : () -> i1
        %3330 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3331 = "comb.xor"(%arg1, %3329) : (i1, i1) -> i1
        %3332 = "seq.initial"() ({
          %3423 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3423) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3333 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %3334 = "comb.icmp"(%3419, %3333) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3335 = "seq.compreg"(%3419, %arg0, %3331, %3330, %3332) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3336 = "comb.icmp"(%3335, %3328) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3337 = "comb.and"(%3336, %arg2) : (i1, i1) -> i1
        %3338 = "comb.icmp"(%3335, %3327) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3339 = "comb.icmp"(%3335, %3326) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3340 = "comb.icmp"(%3335, %3325) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3341 = "comb.icmp"(%3335, %3325) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3342 = "comb.icmp"(%3419, %3325) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3343 = "comb.and"(%3341, %3342) : (i1, i1) -> i1
        %3344 = "comb.icmp"(%3335, %3326) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3345 = "comb.icmp"(%3419, %3326) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3346 = "comb.and"(%3344, %3345) : (i1, i1) -> i1
        %3347 = "comb.and"(%3336, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3348 = "comb.and"(%3339, %arg6) : (i1, i1) -> i1
        %3349 = "comb.or"(%arg4, %arg5, %arg3, %3348) : (i1, i1, i1, i1) -> i1
        %3350 = "comb.or"(%3347, %3349) : (i1, i1) -> i1
        %3351 = "comb.xor"(%3349, %3322) : (i1, i1) -> i1
        %3352 = "comb.icmp"(%3335, %3328) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3353 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3354 = "comb.icmp"(%3335, %3327) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3355 = "comb.icmp"(%3335, %3323) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3356 = "comb.icmp"(%3335, %3326) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3357 = "comb.mux"(%3355, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3358 = "comb.mux"(%3355, %3326, %3328) : (i1, i3, i3) -> i3
        %3359 = "comb.icmp"(%3335, %3324) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3360 = "comb.xor"(%arg4, %3322) : (i1, i1) -> i1
        %3361 = "comb.and"(%3352, %3360) : (i1, i1) -> i1
        %3362 = "comb.xor"(%3352, %3322) : (i1, i1) -> i1
        %3363 = "comb.xor"(%3354, %3322) : (i1, i1) -> i1
        %3364 = "comb.xor"(%3355, %3322) : (i1, i1) -> i1
        %3365 = "comb.xor"(%3356, %3322) : (i1, i1) -> i1
        %3366 = "comb.and"(%3365, %3364, %3363, %3362, %3359) : (i1, i1, i1, i1, i1) -> i1
        %3367 = "comb.or"(%3366, %3361) : (i1, i1) -> i1
        %3368 = "comb.mux"(%3367, %arg5, %3357) : (i1, i1, i1) -> i1
        %3369 = "comb.mux"(%3367, %3325, %3358) : (i1, i3, i3) -> i3
        %3370 = "comb.xor"(%3361, %3322) : (i1, i1) -> i1
        %3371 = "comb.xor"(%3353, %3322) : (i1, i1) -> i1
        %3372 = "comb.or"(%3366, %3370, %3371) : (i1, i1, i1) -> i1
        %3373 = "comb.mux"(%3372, %3335, %3326) : (i1, i3, i3) -> i3
        %3374 = "comb.icmp"(%3335, %3325) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3375 = "comb.mux"(%3374, %3335, %3328) : (i1, i3, i3) -> i3
        %3376 = "comb.xor"(%3374, %3322) : (i1, i1) -> i1
        %3377 = "comb.xor"(%arg3, %3322) : (i1, i1) -> i1
        %3378 = "comb.and"(%3362, %3377) : (i1, i1) -> i1
        %3379 = "comb.and"(%3363, %3378) : (i1, i1) -> i1
        %3380 = "comb.and"(%3364, %3379) : (i1, i1) -> i1
        %3381 = "comb.and"(%3356, %3380) : (i1, i1) -> i1
        %3382 = "comb.and"(%3355, %3379) : (i1, i1) -> i1
        %3383 = "comb.or"(%3381, %3382) : (i1, i1) -> i1
        %3384 = "comb.and"(%3360, %3383) : (i1, i1) -> i1
        %3385 = "comb.and"(%3384, %arg5) : (i1, i1) -> i1
        %3386 = "comb.mux"(%3385, %3325, %3375) : (i1, i3, i3) -> i3
        %3387 = "comb.xor"(%3385, %3322) : (i1, i1) -> i1
        %3388 = "comb.and"(%3383, %arg4) : (i1, i1) -> i1
        %3389 = "comb.mux"(%3388, %3324, %3386) : (i1, i3, i3) -> i3
        %3390 = "comb.xor"(%3388, %3322) : (i1, i1) -> i1
        %3391 = "comb.concat"(%3321, %arg8) : (i2, i1) -> i3
        %3392 = "comb.and"(%3354, %3378) : (i1, i1) -> i1
        %3393 = "comb.and"(%3360, %3392) : (i1, i1) -> i1
        %3394 = "comb.xor"(%arg5, %3322) : (i1, i1) -> i1
        %3395 = "comb.and"(%3394, %3393) : (i1, i1) -> i1
        %3396 = "comb.and"(%arg7, %3395) : (i1, i1) -> i1
        %3397 = "comb.mux"(%3396, %3391, %3389) : (i1, i3, i3) -> i3
        %3398 = "comb.xor"(%3396, %3322) : (i1, i1) -> i1
        %3399 = "comb.and"(%3393, %arg5) : (i1, i1) -> i1
        %3400 = "comb.mux"(%3399, %3325, %3397) : (i1, i3, i3) -> i3
        %3401 = "comb.xor"(%3399, %3322) : (i1, i1) -> i1
        %3402 = "comb.and"(%3392, %arg4) : (i1, i1) -> i1
        %3403 = "comb.mux"(%3402, %3324, %3400) : (i1, i3, i3) -> i3
        %3404 = "comb.xor"(%3402, %3322) : (i1, i1) -> i1
        %3405 = "comb.mux"(%3368, %3369, %3373) : (i1, i3, i3) -> i3
        %3406 = "comb.and"(%3352, %3377) : (i1, i1) -> i1
        %3407 = "comb.and"(%3394, %3384) : (i1, i1) -> i1
        %3408 = "comb.and"(%3360, %3406) : (i1, i1) -> i1
        %3409 = "comb.and"(%3359, %3365, %3380) : (i1, i1, i1) -> i1
        %3410 = "comb.or"(%3407, %3408, %3409) : (i1, i1, i1) -> i1
        %3411 = "comb.mux"(%3410, %3405, %3403) : (i1, i3, i3) -> i3
        %3412 = "comb.xor"(%3410, %3322) : (i1, i1) -> i1
        %3413 = "comb.and"(%3406, %arg4) : (i1, i1) -> i1
        %3414 = "comb.mux"(%3413, %3324, %3411) : (i1, i3, i3) -> i3
        %3415 = "comb.xor"(%3413, %3322) : (i1, i1) -> i1
        %3416 = "comb.mux"(%arg3, %3328, %3414) : (i1, i3, i3) -> i3
        %3417 = "comb.xor"(%arg7, %3322) : (i1, i1) -> i1
        %3418 = "comb.and"(%3395, %3417) : (i1, i1) -> i1
        %3419 = "comb.mux"(%3418, %3335, %3416) : (i1, i3, i3) -> i3
        %3420 = "comb.xor"(%3418, %3322) : (i1, i1) -> i1
        %3421 = "comb.and"(%3420, %3377, %3415, %3412, %3404, %3401, %3398, %3390, %3387, %3376) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3422 = "comb.and"(%3334) : (i1) -> i1
        "fsm.return"(%3422) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %3218 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3219 = "hw.constant"() <{value = true}> : () -> i1
        %3220 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3221 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3222 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3223 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3224 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3225 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3226 = "hw.constant"() <{value = true}> : () -> i1
        %3227 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3228 = "comb.xor"(%arg1, %3226) : (i1, i1) -> i1
        %3229 = "seq.initial"() ({
          %3320 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3320) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3230 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %3231 = "comb.icmp"(%3316, %3230) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3232 = "seq.compreg"(%3316, %arg0, %3228, %3227, %3229) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3233 = "comb.icmp"(%3232, %3225) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3234 = "comb.and"(%3233, %arg2) : (i1, i1) -> i1
        %3235 = "comb.icmp"(%3232, %3224) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3236 = "comb.icmp"(%3232, %3223) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3237 = "comb.icmp"(%3232, %3222) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3238 = "comb.icmp"(%3232, %3222) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3239 = "comb.icmp"(%3316, %3222) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3240 = "comb.and"(%3238, %3239) : (i1, i1) -> i1
        %3241 = "comb.icmp"(%3232, %3223) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3242 = "comb.icmp"(%3316, %3223) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3243 = "comb.and"(%3241, %3242) : (i1, i1) -> i1
        %3244 = "comb.and"(%3233, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3245 = "comb.and"(%3236, %arg6) : (i1, i1) -> i1
        %3246 = "comb.or"(%arg4, %arg5, %arg3, %3245) : (i1, i1, i1, i1) -> i1
        %3247 = "comb.or"(%3244, %3246) : (i1, i1) -> i1
        %3248 = "comb.xor"(%3246, %3219) : (i1, i1) -> i1
        %3249 = "comb.icmp"(%3232, %3225) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3250 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3251 = "comb.icmp"(%3232, %3224) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3252 = "comb.icmp"(%3232, %3220) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3253 = "comb.icmp"(%3232, %3223) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3254 = "comb.mux"(%3252, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3255 = "comb.mux"(%3252, %3223, %3225) : (i1, i3, i3) -> i3
        %3256 = "comb.icmp"(%3232, %3221) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3257 = "comb.xor"(%arg4, %3219) : (i1, i1) -> i1
        %3258 = "comb.and"(%3249, %3257) : (i1, i1) -> i1
        %3259 = "comb.xor"(%3249, %3219) : (i1, i1) -> i1
        %3260 = "comb.xor"(%3251, %3219) : (i1, i1) -> i1
        %3261 = "comb.xor"(%3252, %3219) : (i1, i1) -> i1
        %3262 = "comb.xor"(%3253, %3219) : (i1, i1) -> i1
        %3263 = "comb.and"(%3262, %3261, %3260, %3259, %3256) : (i1, i1, i1, i1, i1) -> i1
        %3264 = "comb.or"(%3263, %3258) : (i1, i1) -> i1
        %3265 = "comb.mux"(%3264, %arg5, %3254) : (i1, i1, i1) -> i1
        %3266 = "comb.mux"(%3264, %3222, %3255) : (i1, i3, i3) -> i3
        %3267 = "comb.xor"(%3258, %3219) : (i1, i1) -> i1
        %3268 = "comb.xor"(%3250, %3219) : (i1, i1) -> i1
        %3269 = "comb.or"(%3263, %3267, %3268) : (i1, i1, i1) -> i1
        %3270 = "comb.mux"(%3269, %3232, %3223) : (i1, i3, i3) -> i3
        %3271 = "comb.icmp"(%3232, %3222) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3272 = "comb.mux"(%3271, %3232, %3225) : (i1, i3, i3) -> i3
        %3273 = "comb.xor"(%3271, %3219) : (i1, i1) -> i1
        %3274 = "comb.xor"(%arg3, %3219) : (i1, i1) -> i1
        %3275 = "comb.and"(%3259, %3274) : (i1, i1) -> i1
        %3276 = "comb.and"(%3260, %3275) : (i1, i1) -> i1
        %3277 = "comb.and"(%3261, %3276) : (i1, i1) -> i1
        %3278 = "comb.and"(%3253, %3277) : (i1, i1) -> i1
        %3279 = "comb.and"(%3252, %3276) : (i1, i1) -> i1
        %3280 = "comb.or"(%3278, %3279) : (i1, i1) -> i1
        %3281 = "comb.and"(%3257, %3280) : (i1, i1) -> i1
        %3282 = "comb.and"(%3281, %arg5) : (i1, i1) -> i1
        %3283 = "comb.mux"(%3282, %3222, %3272) : (i1, i3, i3) -> i3
        %3284 = "comb.xor"(%3282, %3219) : (i1, i1) -> i1
        %3285 = "comb.and"(%3280, %arg4) : (i1, i1) -> i1
        %3286 = "comb.mux"(%3285, %3221, %3283) : (i1, i3, i3) -> i3
        %3287 = "comb.xor"(%3285, %3219) : (i1, i1) -> i1
        %3288 = "comb.concat"(%3218, %arg8) : (i2, i1) -> i3
        %3289 = "comb.and"(%3251, %3275) : (i1, i1) -> i1
        %3290 = "comb.and"(%3257, %3289) : (i1, i1) -> i1
        %3291 = "comb.xor"(%arg5, %3219) : (i1, i1) -> i1
        %3292 = "comb.and"(%3291, %3290) : (i1, i1) -> i1
        %3293 = "comb.and"(%arg7, %3292) : (i1, i1) -> i1
        %3294 = "comb.mux"(%3293, %3288, %3286) : (i1, i3, i3) -> i3
        %3295 = "comb.xor"(%3293, %3219) : (i1, i1) -> i1
        %3296 = "comb.and"(%3290, %arg5) : (i1, i1) -> i1
        %3297 = "comb.mux"(%3296, %3222, %3294) : (i1, i3, i3) -> i3
        %3298 = "comb.xor"(%3296, %3219) : (i1, i1) -> i1
        %3299 = "comb.and"(%3289, %arg4) : (i1, i1) -> i1
        %3300 = "comb.mux"(%3299, %3221, %3297) : (i1, i3, i3) -> i3
        %3301 = "comb.xor"(%3299, %3219) : (i1, i1) -> i1
        %3302 = "comb.mux"(%3265, %3266, %3270) : (i1, i3, i3) -> i3
        %3303 = "comb.and"(%3249, %3274) : (i1, i1) -> i1
        %3304 = "comb.and"(%3291, %3281) : (i1, i1) -> i1
        %3305 = "comb.and"(%3257, %3303) : (i1, i1) -> i1
        %3306 = "comb.and"(%3256, %3262, %3277) : (i1, i1, i1) -> i1
        %3307 = "comb.or"(%3304, %3305, %3306) : (i1, i1, i1) -> i1
        %3308 = "comb.mux"(%3307, %3302, %3300) : (i1, i3, i3) -> i3
        %3309 = "comb.xor"(%3307, %3219) : (i1, i1) -> i1
        %3310 = "comb.and"(%3303, %arg4) : (i1, i1) -> i1
        %3311 = "comb.mux"(%3310, %3221, %3308) : (i1, i3, i3) -> i3
        %3312 = "comb.xor"(%3310, %3219) : (i1, i1) -> i1
        %3313 = "comb.mux"(%arg3, %3225, %3311) : (i1, i3, i3) -> i3
        %3314 = "comb.xor"(%arg7, %3219) : (i1, i1) -> i1
        %3315 = "comb.and"(%3292, %3314) : (i1, i1) -> i1
        %3316 = "comb.mux"(%3315, %3232, %3313) : (i1, i3, i3) -> i3
        %3317 = "comb.xor"(%3315, %3219) : (i1, i1) -> i1
        %3318 = "comb.and"(%3317, %3274, %3312, %3309, %3301, %3298, %3295, %3287, %3284, %3273) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3319 = "comb.and"(%3231) : (i1) -> i1
        "fsm.return"(%3319) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %3115 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3116 = "hw.constant"() <{value = true}> : () -> i1
        %3117 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3118 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3119 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3120 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3121 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3122 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3123 = "hw.constant"() <{value = true}> : () -> i1
        %3124 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3125 = "comb.xor"(%arg1, %3123) : (i1, i1) -> i1
        %3126 = "seq.initial"() ({
          %3217 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3217) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3127 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3128 = "comb.icmp"(%3213, %3127) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3129 = "seq.compreg"(%3213, %arg0, %3125, %3124, %3126) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3130 = "comb.icmp"(%3129, %3122) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3131 = "comb.and"(%3130, %arg2) : (i1, i1) -> i1
        %3132 = "comb.icmp"(%3129, %3121) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3133 = "comb.icmp"(%3129, %3120) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3134 = "comb.icmp"(%3129, %3119) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3135 = "comb.icmp"(%3129, %3119) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3136 = "comb.icmp"(%3213, %3119) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3137 = "comb.and"(%3135, %3136) : (i1, i1) -> i1
        %3138 = "comb.icmp"(%3129, %3120) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3139 = "comb.icmp"(%3213, %3120) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3140 = "comb.and"(%3138, %3139) : (i1, i1) -> i1
        %3141 = "comb.and"(%3130, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3142 = "comb.and"(%3133, %arg6) : (i1, i1) -> i1
        %3143 = "comb.or"(%arg4, %arg5, %arg3, %3142) : (i1, i1, i1, i1) -> i1
        %3144 = "comb.or"(%3141, %3143) : (i1, i1) -> i1
        %3145 = "comb.xor"(%3143, %3116) : (i1, i1) -> i1
        %3146 = "comb.icmp"(%3129, %3122) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3147 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3148 = "comb.icmp"(%3129, %3121) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3149 = "comb.icmp"(%3129, %3117) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3150 = "comb.icmp"(%3129, %3120) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3151 = "comb.mux"(%3149, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3152 = "comb.mux"(%3149, %3120, %3122) : (i1, i3, i3) -> i3
        %3153 = "comb.icmp"(%3129, %3118) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3154 = "comb.xor"(%arg4, %3116) : (i1, i1) -> i1
        %3155 = "comb.and"(%3146, %3154) : (i1, i1) -> i1
        %3156 = "comb.xor"(%3146, %3116) : (i1, i1) -> i1
        %3157 = "comb.xor"(%3148, %3116) : (i1, i1) -> i1
        %3158 = "comb.xor"(%3149, %3116) : (i1, i1) -> i1
        %3159 = "comb.xor"(%3150, %3116) : (i1, i1) -> i1
        %3160 = "comb.and"(%3159, %3158, %3157, %3156, %3153) : (i1, i1, i1, i1, i1) -> i1
        %3161 = "comb.or"(%3160, %3155) : (i1, i1) -> i1
        %3162 = "comb.mux"(%3161, %arg5, %3151) : (i1, i1, i1) -> i1
        %3163 = "comb.mux"(%3161, %3119, %3152) : (i1, i3, i3) -> i3
        %3164 = "comb.xor"(%3155, %3116) : (i1, i1) -> i1
        %3165 = "comb.xor"(%3147, %3116) : (i1, i1) -> i1
        %3166 = "comb.or"(%3160, %3164, %3165) : (i1, i1, i1) -> i1
        %3167 = "comb.mux"(%3166, %3129, %3120) : (i1, i3, i3) -> i3
        %3168 = "comb.icmp"(%3129, %3119) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3169 = "comb.mux"(%3168, %3129, %3122) : (i1, i3, i3) -> i3
        %3170 = "comb.xor"(%3168, %3116) : (i1, i1) -> i1
        %3171 = "comb.xor"(%arg3, %3116) : (i1, i1) -> i1
        %3172 = "comb.and"(%3156, %3171) : (i1, i1) -> i1
        %3173 = "comb.and"(%3157, %3172) : (i1, i1) -> i1
        %3174 = "comb.and"(%3158, %3173) : (i1, i1) -> i1
        %3175 = "comb.and"(%3150, %3174) : (i1, i1) -> i1
        %3176 = "comb.and"(%3149, %3173) : (i1, i1) -> i1
        %3177 = "comb.or"(%3175, %3176) : (i1, i1) -> i1
        %3178 = "comb.and"(%3154, %3177) : (i1, i1) -> i1
        %3179 = "comb.and"(%3178, %arg5) : (i1, i1) -> i1
        %3180 = "comb.mux"(%3179, %3119, %3169) : (i1, i3, i3) -> i3
        %3181 = "comb.xor"(%3179, %3116) : (i1, i1) -> i1
        %3182 = "comb.and"(%3177, %arg4) : (i1, i1) -> i1
        %3183 = "comb.mux"(%3182, %3118, %3180) : (i1, i3, i3) -> i3
        %3184 = "comb.xor"(%3182, %3116) : (i1, i1) -> i1
        %3185 = "comb.concat"(%3115, %arg8) : (i2, i1) -> i3
        %3186 = "comb.and"(%3148, %3172) : (i1, i1) -> i1
        %3187 = "comb.and"(%3154, %3186) : (i1, i1) -> i1
        %3188 = "comb.xor"(%arg5, %3116) : (i1, i1) -> i1
        %3189 = "comb.and"(%3188, %3187) : (i1, i1) -> i1
        %3190 = "comb.and"(%arg7, %3189) : (i1, i1) -> i1
        %3191 = "comb.mux"(%3190, %3185, %3183) : (i1, i3, i3) -> i3
        %3192 = "comb.xor"(%3190, %3116) : (i1, i1) -> i1
        %3193 = "comb.and"(%3187, %arg5) : (i1, i1) -> i1
        %3194 = "comb.mux"(%3193, %3119, %3191) : (i1, i3, i3) -> i3
        %3195 = "comb.xor"(%3193, %3116) : (i1, i1) -> i1
        %3196 = "comb.and"(%3186, %arg4) : (i1, i1) -> i1
        %3197 = "comb.mux"(%3196, %3118, %3194) : (i1, i3, i3) -> i3
        %3198 = "comb.xor"(%3196, %3116) : (i1, i1) -> i1
        %3199 = "comb.mux"(%3162, %3163, %3167) : (i1, i3, i3) -> i3
        %3200 = "comb.and"(%3146, %3171) : (i1, i1) -> i1
        %3201 = "comb.and"(%3188, %3178) : (i1, i1) -> i1
        %3202 = "comb.and"(%3154, %3200) : (i1, i1) -> i1
        %3203 = "comb.and"(%3153, %3159, %3174) : (i1, i1, i1) -> i1
        %3204 = "comb.or"(%3201, %3202, %3203) : (i1, i1, i1) -> i1
        %3205 = "comb.mux"(%3204, %3199, %3197) : (i1, i3, i3) -> i3
        %3206 = "comb.xor"(%3204, %3116) : (i1, i1) -> i1
        %3207 = "comb.and"(%3200, %arg4) : (i1, i1) -> i1
        %3208 = "comb.mux"(%3207, %3118, %3205) : (i1, i3, i3) -> i3
        %3209 = "comb.xor"(%3207, %3116) : (i1, i1) -> i1
        %3210 = "comb.mux"(%arg3, %3122, %3208) : (i1, i3, i3) -> i3
        %3211 = "comb.xor"(%arg7, %3116) : (i1, i1) -> i1
        %3212 = "comb.and"(%3189, %3211) : (i1, i1) -> i1
        %3213 = "comb.mux"(%3212, %3129, %3210) : (i1, i3, i3) -> i3
        %3214 = "comb.xor"(%3212, %3116) : (i1, i1) -> i1
        %3215 = "comb.and"(%3214, %3171, %3209, %3206, %3198, %3195, %3192, %3184, %3181, %3170) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3216 = "comb.and"(%3128) : (i1) -> i1
        "fsm.return"(%3216) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %3012 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %3013 = "hw.constant"() <{value = true}> : () -> i1
        %3014 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3015 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3016 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %3017 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %3018 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %3019 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3020 = "hw.constant"() <{value = true}> : () -> i1
        %3021 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %3022 = "comb.xor"(%arg1, %3020) : (i1, i1) -> i1
        %3023 = "seq.initial"() ({
          %3114 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3114) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %3024 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %3025 = "comb.icmp"(%3110, %3024) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3026 = "seq.compreg"(%3110, %arg0, %3022, %3021, %3023) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %3027 = "comb.icmp"(%3026, %3019) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %3028 = "comb.and"(%3027, %arg2) : (i1, i1) -> i1
        %3029 = "comb.icmp"(%3026, %3018) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3030 = "comb.icmp"(%3026, %3017) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3031 = "comb.icmp"(%3026, %3016) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3032 = "comb.icmp"(%3026, %3016) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3033 = "comb.icmp"(%3110, %3016) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3034 = "comb.and"(%3032, %3033) : (i1, i1) -> i1
        %3035 = "comb.icmp"(%3026, %3017) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %3036 = "comb.icmp"(%3110, %3017) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %3037 = "comb.and"(%3035, %3036) : (i1, i1) -> i1
        %3038 = "comb.and"(%3027, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %3039 = "comb.and"(%3030, %arg6) : (i1, i1) -> i1
        %3040 = "comb.or"(%arg4, %arg5, %arg3, %3039) : (i1, i1, i1, i1) -> i1
        %3041 = "comb.or"(%3038, %3040) : (i1, i1) -> i1
        %3042 = "comb.xor"(%3040, %3013) : (i1, i1) -> i1
        %3043 = "comb.icmp"(%3026, %3019) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3044 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %3045 = "comb.icmp"(%3026, %3018) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3046 = "comb.icmp"(%3026, %3014) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3047 = "comb.icmp"(%3026, %3017) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3048 = "comb.mux"(%3046, %arg8, %arg6) : (i1, i1, i1) -> i1
        %3049 = "comb.mux"(%3046, %3017, %3019) : (i1, i3, i3) -> i3
        %3050 = "comb.icmp"(%3026, %3015) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3051 = "comb.xor"(%arg4, %3013) : (i1, i1) -> i1
        %3052 = "comb.and"(%3043, %3051) : (i1, i1) -> i1
        %3053 = "comb.xor"(%3043, %3013) : (i1, i1) -> i1
        %3054 = "comb.xor"(%3045, %3013) : (i1, i1) -> i1
        %3055 = "comb.xor"(%3046, %3013) : (i1, i1) -> i1
        %3056 = "comb.xor"(%3047, %3013) : (i1, i1) -> i1
        %3057 = "comb.and"(%3056, %3055, %3054, %3053, %3050) : (i1, i1, i1, i1, i1) -> i1
        %3058 = "comb.or"(%3057, %3052) : (i1, i1) -> i1
        %3059 = "comb.mux"(%3058, %arg5, %3048) : (i1, i1, i1) -> i1
        %3060 = "comb.mux"(%3058, %3016, %3049) : (i1, i3, i3) -> i3
        %3061 = "comb.xor"(%3052, %3013) : (i1, i1) -> i1
        %3062 = "comb.xor"(%3044, %3013) : (i1, i1) -> i1
        %3063 = "comb.or"(%3057, %3061, %3062) : (i1, i1, i1) -> i1
        %3064 = "comb.mux"(%3063, %3026, %3017) : (i1, i3, i3) -> i3
        %3065 = "comb.icmp"(%3026, %3016) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %3066 = "comb.mux"(%3065, %3026, %3019) : (i1, i3, i3) -> i3
        %3067 = "comb.xor"(%3065, %3013) : (i1, i1) -> i1
        %3068 = "comb.xor"(%arg3, %3013) : (i1, i1) -> i1
        %3069 = "comb.and"(%3053, %3068) : (i1, i1) -> i1
        %3070 = "comb.and"(%3054, %3069) : (i1, i1) -> i1
        %3071 = "comb.and"(%3055, %3070) : (i1, i1) -> i1
        %3072 = "comb.and"(%3047, %3071) : (i1, i1) -> i1
        %3073 = "comb.and"(%3046, %3070) : (i1, i1) -> i1
        %3074 = "comb.or"(%3072, %3073) : (i1, i1) -> i1
        %3075 = "comb.and"(%3051, %3074) : (i1, i1) -> i1
        %3076 = "comb.and"(%3075, %arg5) : (i1, i1) -> i1
        %3077 = "comb.mux"(%3076, %3016, %3066) : (i1, i3, i3) -> i3
        %3078 = "comb.xor"(%3076, %3013) : (i1, i1) -> i1
        %3079 = "comb.and"(%3074, %arg4) : (i1, i1) -> i1
        %3080 = "comb.mux"(%3079, %3015, %3077) : (i1, i3, i3) -> i3
        %3081 = "comb.xor"(%3079, %3013) : (i1, i1) -> i1
        %3082 = "comb.concat"(%3012, %arg8) : (i2, i1) -> i3
        %3083 = "comb.and"(%3045, %3069) : (i1, i1) -> i1
        %3084 = "comb.and"(%3051, %3083) : (i1, i1) -> i1
        %3085 = "comb.xor"(%arg5, %3013) : (i1, i1) -> i1
        %3086 = "comb.and"(%3085, %3084) : (i1, i1) -> i1
        %3087 = "comb.and"(%arg7, %3086) : (i1, i1) -> i1
        %3088 = "comb.mux"(%3087, %3082, %3080) : (i1, i3, i3) -> i3
        %3089 = "comb.xor"(%3087, %3013) : (i1, i1) -> i1
        %3090 = "comb.and"(%3084, %arg5) : (i1, i1) -> i1
        %3091 = "comb.mux"(%3090, %3016, %3088) : (i1, i3, i3) -> i3
        %3092 = "comb.xor"(%3090, %3013) : (i1, i1) -> i1
        %3093 = "comb.and"(%3083, %arg4) : (i1, i1) -> i1
        %3094 = "comb.mux"(%3093, %3015, %3091) : (i1, i3, i3) -> i3
        %3095 = "comb.xor"(%3093, %3013) : (i1, i1) -> i1
        %3096 = "comb.mux"(%3059, %3060, %3064) : (i1, i3, i3) -> i3
        %3097 = "comb.and"(%3043, %3068) : (i1, i1) -> i1
        %3098 = "comb.and"(%3085, %3075) : (i1, i1) -> i1
        %3099 = "comb.and"(%3051, %3097) : (i1, i1) -> i1
        %3100 = "comb.and"(%3050, %3056, %3071) : (i1, i1, i1) -> i1
        %3101 = "comb.or"(%3098, %3099, %3100) : (i1, i1, i1) -> i1
        %3102 = "comb.mux"(%3101, %3096, %3094) : (i1, i3, i3) -> i3
        %3103 = "comb.xor"(%3101, %3013) : (i1, i1) -> i1
        %3104 = "comb.and"(%3097, %arg4) : (i1, i1) -> i1
        %3105 = "comb.mux"(%3104, %3015, %3102) : (i1, i3, i3) -> i3
        %3106 = "comb.xor"(%3104, %3013) : (i1, i1) -> i1
        %3107 = "comb.mux"(%arg3, %3019, %3105) : (i1, i3, i3) -> i3
        %3108 = "comb.xor"(%arg7, %3013) : (i1, i1) -> i1
        %3109 = "comb.and"(%3086, %3108) : (i1, i1) -> i1
        %3110 = "comb.mux"(%3109, %3026, %3107) : (i1, i3, i3) -> i3
        %3111 = "comb.xor"(%3109, %3013) : (i1, i1) -> i1
        %3112 = "comb.and"(%3111, %3068, %3106, %3103, %3095, %3092, %3089, %3081, %3078, %3067) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3113 = "comb.and"(%3025) : (i1) -> i1
        "fsm.return"(%3113) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %2909 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2910 = "hw.constant"() <{value = true}> : () -> i1
        %2911 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2912 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2913 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2914 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2915 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2916 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2917 = "hw.constant"() <{value = true}> : () -> i1
        %2918 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2919 = "comb.xor"(%arg1, %2917) : (i1, i1) -> i1
        %2920 = "seq.initial"() ({
          %3011 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%3011) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2921 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2922 = "comb.icmp"(%3007, %2921) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2923 = "seq.compreg"(%3007, %arg0, %2919, %2918, %2920) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2924 = "comb.icmp"(%2923, %2916) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2925 = "comb.and"(%2924, %arg2) : (i1, i1) -> i1
        %2926 = "comb.icmp"(%2923, %2915) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2927 = "comb.icmp"(%2923, %2914) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2928 = "comb.icmp"(%2923, %2913) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2929 = "comb.icmp"(%2923, %2913) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2930 = "comb.icmp"(%3007, %2913) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2931 = "comb.and"(%2929, %2930) : (i1, i1) -> i1
        %2932 = "comb.icmp"(%2923, %2914) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2933 = "comb.icmp"(%3007, %2914) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2934 = "comb.and"(%2932, %2933) : (i1, i1) -> i1
        %2935 = "comb.and"(%2924, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2936 = "comb.and"(%2927, %arg6) : (i1, i1) -> i1
        %2937 = "comb.or"(%arg4, %arg5, %arg3, %2936) : (i1, i1, i1, i1) -> i1
        %2938 = "comb.or"(%2935, %2937) : (i1, i1) -> i1
        %2939 = "comb.xor"(%2937, %2910) : (i1, i1) -> i1
        %2940 = "comb.icmp"(%2923, %2916) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2941 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2942 = "comb.icmp"(%2923, %2915) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2943 = "comb.icmp"(%2923, %2911) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2944 = "comb.icmp"(%2923, %2914) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2945 = "comb.mux"(%2943, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2946 = "comb.mux"(%2943, %2914, %2916) : (i1, i3, i3) -> i3
        %2947 = "comb.icmp"(%2923, %2912) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2948 = "comb.xor"(%arg4, %2910) : (i1, i1) -> i1
        %2949 = "comb.and"(%2940, %2948) : (i1, i1) -> i1
        %2950 = "comb.xor"(%2940, %2910) : (i1, i1) -> i1
        %2951 = "comb.xor"(%2942, %2910) : (i1, i1) -> i1
        %2952 = "comb.xor"(%2943, %2910) : (i1, i1) -> i1
        %2953 = "comb.xor"(%2944, %2910) : (i1, i1) -> i1
        %2954 = "comb.and"(%2953, %2952, %2951, %2950, %2947) : (i1, i1, i1, i1, i1) -> i1
        %2955 = "comb.or"(%2954, %2949) : (i1, i1) -> i1
        %2956 = "comb.mux"(%2955, %arg5, %2945) : (i1, i1, i1) -> i1
        %2957 = "comb.mux"(%2955, %2913, %2946) : (i1, i3, i3) -> i3
        %2958 = "comb.xor"(%2949, %2910) : (i1, i1) -> i1
        %2959 = "comb.xor"(%2941, %2910) : (i1, i1) -> i1
        %2960 = "comb.or"(%2954, %2958, %2959) : (i1, i1, i1) -> i1
        %2961 = "comb.mux"(%2960, %2923, %2914) : (i1, i3, i3) -> i3
        %2962 = "comb.icmp"(%2923, %2913) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2963 = "comb.mux"(%2962, %2923, %2916) : (i1, i3, i3) -> i3
        %2964 = "comb.xor"(%2962, %2910) : (i1, i1) -> i1
        %2965 = "comb.xor"(%arg3, %2910) : (i1, i1) -> i1
        %2966 = "comb.and"(%2950, %2965) : (i1, i1) -> i1
        %2967 = "comb.and"(%2951, %2966) : (i1, i1) -> i1
        %2968 = "comb.and"(%2952, %2967) : (i1, i1) -> i1
        %2969 = "comb.and"(%2944, %2968) : (i1, i1) -> i1
        %2970 = "comb.and"(%2943, %2967) : (i1, i1) -> i1
        %2971 = "comb.or"(%2969, %2970) : (i1, i1) -> i1
        %2972 = "comb.and"(%2948, %2971) : (i1, i1) -> i1
        %2973 = "comb.and"(%2972, %arg5) : (i1, i1) -> i1
        %2974 = "comb.mux"(%2973, %2913, %2963) : (i1, i3, i3) -> i3
        %2975 = "comb.xor"(%2973, %2910) : (i1, i1) -> i1
        %2976 = "comb.and"(%2971, %arg4) : (i1, i1) -> i1
        %2977 = "comb.mux"(%2976, %2912, %2974) : (i1, i3, i3) -> i3
        %2978 = "comb.xor"(%2976, %2910) : (i1, i1) -> i1
        %2979 = "comb.concat"(%2909, %arg8) : (i2, i1) -> i3
        %2980 = "comb.and"(%2942, %2966) : (i1, i1) -> i1
        %2981 = "comb.and"(%2948, %2980) : (i1, i1) -> i1
        %2982 = "comb.xor"(%arg5, %2910) : (i1, i1) -> i1
        %2983 = "comb.and"(%2982, %2981) : (i1, i1) -> i1
        %2984 = "comb.and"(%arg7, %2983) : (i1, i1) -> i1
        %2985 = "comb.mux"(%2984, %2979, %2977) : (i1, i3, i3) -> i3
        %2986 = "comb.xor"(%2984, %2910) : (i1, i1) -> i1
        %2987 = "comb.and"(%2981, %arg5) : (i1, i1) -> i1
        %2988 = "comb.mux"(%2987, %2913, %2985) : (i1, i3, i3) -> i3
        %2989 = "comb.xor"(%2987, %2910) : (i1, i1) -> i1
        %2990 = "comb.and"(%2980, %arg4) : (i1, i1) -> i1
        %2991 = "comb.mux"(%2990, %2912, %2988) : (i1, i3, i3) -> i3
        %2992 = "comb.xor"(%2990, %2910) : (i1, i1) -> i1
        %2993 = "comb.mux"(%2956, %2957, %2961) : (i1, i3, i3) -> i3
        %2994 = "comb.and"(%2940, %2965) : (i1, i1) -> i1
        %2995 = "comb.and"(%2982, %2972) : (i1, i1) -> i1
        %2996 = "comb.and"(%2948, %2994) : (i1, i1) -> i1
        %2997 = "comb.and"(%2947, %2953, %2968) : (i1, i1, i1) -> i1
        %2998 = "comb.or"(%2995, %2996, %2997) : (i1, i1, i1) -> i1
        %2999 = "comb.mux"(%2998, %2993, %2991) : (i1, i3, i3) -> i3
        %3000 = "comb.xor"(%2998, %2910) : (i1, i1) -> i1
        %3001 = "comb.and"(%2994, %arg4) : (i1, i1) -> i1
        %3002 = "comb.mux"(%3001, %2912, %2999) : (i1, i3, i3) -> i3
        %3003 = "comb.xor"(%3001, %2910) : (i1, i1) -> i1
        %3004 = "comb.mux"(%arg3, %2916, %3002) : (i1, i3, i3) -> i3
        %3005 = "comb.xor"(%arg7, %2910) : (i1, i1) -> i1
        %3006 = "comb.and"(%2983, %3005) : (i1, i1) -> i1
        %3007 = "comb.mux"(%3006, %2923, %3004) : (i1, i3, i3) -> i3
        %3008 = "comb.xor"(%3006, %2910) : (i1, i1) -> i1
        %3009 = "comb.and"(%3008, %2965, %3003, %3000, %2992, %2989, %2986, %2978, %2975, %2964) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %3010 = "comb.and"(%2922) : (i1) -> i1
        "fsm.return"(%3010) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %2806 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2807 = "hw.constant"() <{value = true}> : () -> i1
        %2808 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2809 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2810 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2811 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2812 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2813 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2814 = "hw.constant"() <{value = true}> : () -> i1
        %2815 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2816 = "comb.xor"(%arg1, %2814) : (i1, i1) -> i1
        %2817 = "seq.initial"() ({
          %2908 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2908) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2818 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2819 = "comb.icmp"(%2904, %2818) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2820 = "seq.compreg"(%2904, %arg0, %2816, %2815, %2817) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2821 = "comb.icmp"(%2820, %2813) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2822 = "comb.and"(%2821, %arg2) : (i1, i1) -> i1
        %2823 = "comb.icmp"(%2820, %2812) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2824 = "comb.icmp"(%2820, %2811) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2825 = "comb.icmp"(%2820, %2810) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2826 = "comb.icmp"(%2820, %2810) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2827 = "comb.icmp"(%2904, %2810) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2828 = "comb.and"(%2826, %2827) : (i1, i1) -> i1
        %2829 = "comb.icmp"(%2820, %2811) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2830 = "comb.icmp"(%2904, %2811) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2831 = "comb.and"(%2829, %2830) : (i1, i1) -> i1
        %2832 = "comb.and"(%2821, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2833 = "comb.and"(%2824, %arg6) : (i1, i1) -> i1
        %2834 = "comb.or"(%arg4, %arg5, %arg3, %2833) : (i1, i1, i1, i1) -> i1
        %2835 = "comb.or"(%2832, %2834) : (i1, i1) -> i1
        %2836 = "comb.xor"(%2834, %2807) : (i1, i1) -> i1
        %2837 = "comb.icmp"(%2820, %2813) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2838 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2839 = "comb.icmp"(%2820, %2812) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2840 = "comb.icmp"(%2820, %2808) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2841 = "comb.icmp"(%2820, %2811) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2842 = "comb.mux"(%2840, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2843 = "comb.mux"(%2840, %2811, %2813) : (i1, i3, i3) -> i3
        %2844 = "comb.icmp"(%2820, %2809) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2845 = "comb.xor"(%arg4, %2807) : (i1, i1) -> i1
        %2846 = "comb.and"(%2837, %2845) : (i1, i1) -> i1
        %2847 = "comb.xor"(%2837, %2807) : (i1, i1) -> i1
        %2848 = "comb.xor"(%2839, %2807) : (i1, i1) -> i1
        %2849 = "comb.xor"(%2840, %2807) : (i1, i1) -> i1
        %2850 = "comb.xor"(%2841, %2807) : (i1, i1) -> i1
        %2851 = "comb.and"(%2850, %2849, %2848, %2847, %2844) : (i1, i1, i1, i1, i1) -> i1
        %2852 = "comb.or"(%2851, %2846) : (i1, i1) -> i1
        %2853 = "comb.mux"(%2852, %arg5, %2842) : (i1, i1, i1) -> i1
        %2854 = "comb.mux"(%2852, %2810, %2843) : (i1, i3, i3) -> i3
        %2855 = "comb.xor"(%2846, %2807) : (i1, i1) -> i1
        %2856 = "comb.xor"(%2838, %2807) : (i1, i1) -> i1
        %2857 = "comb.or"(%2851, %2855, %2856) : (i1, i1, i1) -> i1
        %2858 = "comb.mux"(%2857, %2820, %2811) : (i1, i3, i3) -> i3
        %2859 = "comb.icmp"(%2820, %2810) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2860 = "comb.mux"(%2859, %2820, %2813) : (i1, i3, i3) -> i3
        %2861 = "comb.xor"(%2859, %2807) : (i1, i1) -> i1
        %2862 = "comb.xor"(%arg3, %2807) : (i1, i1) -> i1
        %2863 = "comb.and"(%2847, %2862) : (i1, i1) -> i1
        %2864 = "comb.and"(%2848, %2863) : (i1, i1) -> i1
        %2865 = "comb.and"(%2849, %2864) : (i1, i1) -> i1
        %2866 = "comb.and"(%2841, %2865) : (i1, i1) -> i1
        %2867 = "comb.and"(%2840, %2864) : (i1, i1) -> i1
        %2868 = "comb.or"(%2866, %2867) : (i1, i1) -> i1
        %2869 = "comb.and"(%2845, %2868) : (i1, i1) -> i1
        %2870 = "comb.and"(%2869, %arg5) : (i1, i1) -> i1
        %2871 = "comb.mux"(%2870, %2810, %2860) : (i1, i3, i3) -> i3
        %2872 = "comb.xor"(%2870, %2807) : (i1, i1) -> i1
        %2873 = "comb.and"(%2868, %arg4) : (i1, i1) -> i1
        %2874 = "comb.mux"(%2873, %2809, %2871) : (i1, i3, i3) -> i3
        %2875 = "comb.xor"(%2873, %2807) : (i1, i1) -> i1
        %2876 = "comb.concat"(%2806, %arg8) : (i2, i1) -> i3
        %2877 = "comb.and"(%2839, %2863) : (i1, i1) -> i1
        %2878 = "comb.and"(%2845, %2877) : (i1, i1) -> i1
        %2879 = "comb.xor"(%arg5, %2807) : (i1, i1) -> i1
        %2880 = "comb.and"(%2879, %2878) : (i1, i1) -> i1
        %2881 = "comb.and"(%arg7, %2880) : (i1, i1) -> i1
        %2882 = "comb.mux"(%2881, %2876, %2874) : (i1, i3, i3) -> i3
        %2883 = "comb.xor"(%2881, %2807) : (i1, i1) -> i1
        %2884 = "comb.and"(%2878, %arg5) : (i1, i1) -> i1
        %2885 = "comb.mux"(%2884, %2810, %2882) : (i1, i3, i3) -> i3
        %2886 = "comb.xor"(%2884, %2807) : (i1, i1) -> i1
        %2887 = "comb.and"(%2877, %arg4) : (i1, i1) -> i1
        %2888 = "comb.mux"(%2887, %2809, %2885) : (i1, i3, i3) -> i3
        %2889 = "comb.xor"(%2887, %2807) : (i1, i1) -> i1
        %2890 = "comb.mux"(%2853, %2854, %2858) : (i1, i3, i3) -> i3
        %2891 = "comb.and"(%2837, %2862) : (i1, i1) -> i1
        %2892 = "comb.and"(%2879, %2869) : (i1, i1) -> i1
        %2893 = "comb.and"(%2845, %2891) : (i1, i1) -> i1
        %2894 = "comb.and"(%2844, %2850, %2865) : (i1, i1, i1) -> i1
        %2895 = "comb.or"(%2892, %2893, %2894) : (i1, i1, i1) -> i1
        %2896 = "comb.mux"(%2895, %2890, %2888) : (i1, i3, i3) -> i3
        %2897 = "comb.xor"(%2895, %2807) : (i1, i1) -> i1
        %2898 = "comb.and"(%2891, %arg4) : (i1, i1) -> i1
        %2899 = "comb.mux"(%2898, %2809, %2896) : (i1, i3, i3) -> i3
        %2900 = "comb.xor"(%2898, %2807) : (i1, i1) -> i1
        %2901 = "comb.mux"(%arg3, %2813, %2899) : (i1, i3, i3) -> i3
        %2902 = "comb.xor"(%arg7, %2807) : (i1, i1) -> i1
        %2903 = "comb.and"(%2880, %2902) : (i1, i1) -> i1
        %2904 = "comb.mux"(%2903, %2820, %2901) : (i1, i3, i3) -> i3
        %2905 = "comb.xor"(%2903, %2807) : (i1, i1) -> i1
        %2906 = "comb.and"(%2905, %2862, %2900, %2897, %2889, %2886, %2883, %2875, %2872, %2861) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2907 = "comb.and"(%2819) : (i1) -> i1
        "fsm.return"(%2907) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %2703 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2704 = "hw.constant"() <{value = true}> : () -> i1
        %2705 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2706 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2707 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2708 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2709 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2710 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2711 = "hw.constant"() <{value = true}> : () -> i1
        %2712 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2713 = "comb.xor"(%arg1, %2711) : (i1, i1) -> i1
        %2714 = "seq.initial"() ({
          %2805 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2805) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2715 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2716 = "comb.icmp"(%2801, %2715) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2717 = "seq.compreg"(%2801, %arg0, %2713, %2712, %2714) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2718 = "comb.icmp"(%2717, %2710) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2719 = "comb.and"(%2718, %arg2) : (i1, i1) -> i1
        %2720 = "comb.icmp"(%2717, %2709) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2721 = "comb.icmp"(%2717, %2708) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2722 = "comb.icmp"(%2717, %2707) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2723 = "comb.icmp"(%2717, %2707) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2724 = "comb.icmp"(%2801, %2707) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2725 = "comb.and"(%2723, %2724) : (i1, i1) -> i1
        %2726 = "comb.icmp"(%2717, %2708) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2727 = "comb.icmp"(%2801, %2708) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2728 = "comb.and"(%2726, %2727) : (i1, i1) -> i1
        %2729 = "comb.and"(%2718, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2730 = "comb.and"(%2721, %arg6) : (i1, i1) -> i1
        %2731 = "comb.or"(%arg4, %arg5, %arg3, %2730) : (i1, i1, i1, i1) -> i1
        %2732 = "comb.or"(%2729, %2731) : (i1, i1) -> i1
        %2733 = "comb.xor"(%2731, %2704) : (i1, i1) -> i1
        %2734 = "comb.icmp"(%2717, %2710) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2735 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2736 = "comb.icmp"(%2717, %2709) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2737 = "comb.icmp"(%2717, %2705) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2738 = "comb.icmp"(%2717, %2708) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2739 = "comb.mux"(%2737, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2740 = "comb.mux"(%2737, %2708, %2710) : (i1, i3, i3) -> i3
        %2741 = "comb.icmp"(%2717, %2706) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2742 = "comb.xor"(%arg4, %2704) : (i1, i1) -> i1
        %2743 = "comb.and"(%2734, %2742) : (i1, i1) -> i1
        %2744 = "comb.xor"(%2734, %2704) : (i1, i1) -> i1
        %2745 = "comb.xor"(%2736, %2704) : (i1, i1) -> i1
        %2746 = "comb.xor"(%2737, %2704) : (i1, i1) -> i1
        %2747 = "comb.xor"(%2738, %2704) : (i1, i1) -> i1
        %2748 = "comb.and"(%2747, %2746, %2745, %2744, %2741) : (i1, i1, i1, i1, i1) -> i1
        %2749 = "comb.or"(%2748, %2743) : (i1, i1) -> i1
        %2750 = "comb.mux"(%2749, %arg5, %2739) : (i1, i1, i1) -> i1
        %2751 = "comb.mux"(%2749, %2707, %2740) : (i1, i3, i3) -> i3
        %2752 = "comb.xor"(%2743, %2704) : (i1, i1) -> i1
        %2753 = "comb.xor"(%2735, %2704) : (i1, i1) -> i1
        %2754 = "comb.or"(%2748, %2752, %2753) : (i1, i1, i1) -> i1
        %2755 = "comb.mux"(%2754, %2717, %2708) : (i1, i3, i3) -> i3
        %2756 = "comb.icmp"(%2717, %2707) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2757 = "comb.mux"(%2756, %2717, %2710) : (i1, i3, i3) -> i3
        %2758 = "comb.xor"(%2756, %2704) : (i1, i1) -> i1
        %2759 = "comb.xor"(%arg3, %2704) : (i1, i1) -> i1
        %2760 = "comb.and"(%2744, %2759) : (i1, i1) -> i1
        %2761 = "comb.and"(%2745, %2760) : (i1, i1) -> i1
        %2762 = "comb.and"(%2746, %2761) : (i1, i1) -> i1
        %2763 = "comb.and"(%2738, %2762) : (i1, i1) -> i1
        %2764 = "comb.and"(%2737, %2761) : (i1, i1) -> i1
        %2765 = "comb.or"(%2763, %2764) : (i1, i1) -> i1
        %2766 = "comb.and"(%2742, %2765) : (i1, i1) -> i1
        %2767 = "comb.and"(%2766, %arg5) : (i1, i1) -> i1
        %2768 = "comb.mux"(%2767, %2707, %2757) : (i1, i3, i3) -> i3
        %2769 = "comb.xor"(%2767, %2704) : (i1, i1) -> i1
        %2770 = "comb.and"(%2765, %arg4) : (i1, i1) -> i1
        %2771 = "comb.mux"(%2770, %2706, %2768) : (i1, i3, i3) -> i3
        %2772 = "comb.xor"(%2770, %2704) : (i1, i1) -> i1
        %2773 = "comb.concat"(%2703, %arg8) : (i2, i1) -> i3
        %2774 = "comb.and"(%2736, %2760) : (i1, i1) -> i1
        %2775 = "comb.and"(%2742, %2774) : (i1, i1) -> i1
        %2776 = "comb.xor"(%arg5, %2704) : (i1, i1) -> i1
        %2777 = "comb.and"(%2776, %2775) : (i1, i1) -> i1
        %2778 = "comb.and"(%arg7, %2777) : (i1, i1) -> i1
        %2779 = "comb.mux"(%2778, %2773, %2771) : (i1, i3, i3) -> i3
        %2780 = "comb.xor"(%2778, %2704) : (i1, i1) -> i1
        %2781 = "comb.and"(%2775, %arg5) : (i1, i1) -> i1
        %2782 = "comb.mux"(%2781, %2707, %2779) : (i1, i3, i3) -> i3
        %2783 = "comb.xor"(%2781, %2704) : (i1, i1) -> i1
        %2784 = "comb.and"(%2774, %arg4) : (i1, i1) -> i1
        %2785 = "comb.mux"(%2784, %2706, %2782) : (i1, i3, i3) -> i3
        %2786 = "comb.xor"(%2784, %2704) : (i1, i1) -> i1
        %2787 = "comb.mux"(%2750, %2751, %2755) : (i1, i3, i3) -> i3
        %2788 = "comb.and"(%2734, %2759) : (i1, i1) -> i1
        %2789 = "comb.and"(%2776, %2766) : (i1, i1) -> i1
        %2790 = "comb.and"(%2742, %2788) : (i1, i1) -> i1
        %2791 = "comb.and"(%2741, %2747, %2762) : (i1, i1, i1) -> i1
        %2792 = "comb.or"(%2789, %2790, %2791) : (i1, i1, i1) -> i1
        %2793 = "comb.mux"(%2792, %2787, %2785) : (i1, i3, i3) -> i3
        %2794 = "comb.xor"(%2792, %2704) : (i1, i1) -> i1
        %2795 = "comb.and"(%2788, %arg4) : (i1, i1) -> i1
        %2796 = "comb.mux"(%2795, %2706, %2793) : (i1, i3, i3) -> i3
        %2797 = "comb.xor"(%2795, %2704) : (i1, i1) -> i1
        %2798 = "comb.mux"(%arg3, %2710, %2796) : (i1, i3, i3) -> i3
        %2799 = "comb.xor"(%arg7, %2704) : (i1, i1) -> i1
        %2800 = "comb.and"(%2777, %2799) : (i1, i1) -> i1
        %2801 = "comb.mux"(%2800, %2717, %2798) : (i1, i3, i3) -> i3
        %2802 = "comb.xor"(%2800, %2704) : (i1, i1) -> i1
        %2803 = "comb.and"(%2802, %2759, %2797, %2794, %2786, %2783, %2780, %2772, %2769, %2758) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2804 = "comb.and"(%2716) : (i1) -> i1
        "fsm.return"(%2804) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %2600 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2601 = "hw.constant"() <{value = true}> : () -> i1
        %2602 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2603 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2604 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2605 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2606 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2607 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2608 = "hw.constant"() <{value = true}> : () -> i1
        %2609 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2610 = "comb.xor"(%arg1, %2608) : (i1, i1) -> i1
        %2611 = "seq.initial"() ({
          %2702 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2702) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2612 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2613 = "comb.icmp"(%2698, %2612) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2614 = "seq.compreg"(%2698, %arg0, %2610, %2609, %2611) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2615 = "comb.icmp"(%2614, %2607) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2616 = "comb.and"(%2615, %arg2) : (i1, i1) -> i1
        %2617 = "comb.icmp"(%2614, %2606) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2618 = "comb.icmp"(%2614, %2605) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2619 = "comb.icmp"(%2614, %2604) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2620 = "comb.icmp"(%2614, %2604) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2621 = "comb.icmp"(%2698, %2604) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2622 = "comb.and"(%2620, %2621) : (i1, i1) -> i1
        %2623 = "comb.icmp"(%2614, %2605) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2624 = "comb.icmp"(%2698, %2605) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2625 = "comb.and"(%2623, %2624) : (i1, i1) -> i1
        %2626 = "comb.and"(%2615, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2627 = "comb.and"(%2618, %arg6) : (i1, i1) -> i1
        %2628 = "comb.or"(%arg4, %arg5, %arg3, %2627) : (i1, i1, i1, i1) -> i1
        %2629 = "comb.or"(%2626, %2628) : (i1, i1) -> i1
        %2630 = "comb.xor"(%2628, %2601) : (i1, i1) -> i1
        %2631 = "comb.icmp"(%2614, %2607) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2632 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2633 = "comb.icmp"(%2614, %2606) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2634 = "comb.icmp"(%2614, %2602) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2635 = "comb.icmp"(%2614, %2605) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2636 = "comb.mux"(%2634, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2637 = "comb.mux"(%2634, %2605, %2607) : (i1, i3, i3) -> i3
        %2638 = "comb.icmp"(%2614, %2603) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2639 = "comb.xor"(%arg4, %2601) : (i1, i1) -> i1
        %2640 = "comb.and"(%2631, %2639) : (i1, i1) -> i1
        %2641 = "comb.xor"(%2631, %2601) : (i1, i1) -> i1
        %2642 = "comb.xor"(%2633, %2601) : (i1, i1) -> i1
        %2643 = "comb.xor"(%2634, %2601) : (i1, i1) -> i1
        %2644 = "comb.xor"(%2635, %2601) : (i1, i1) -> i1
        %2645 = "comb.and"(%2644, %2643, %2642, %2641, %2638) : (i1, i1, i1, i1, i1) -> i1
        %2646 = "comb.or"(%2645, %2640) : (i1, i1) -> i1
        %2647 = "comb.mux"(%2646, %arg5, %2636) : (i1, i1, i1) -> i1
        %2648 = "comb.mux"(%2646, %2604, %2637) : (i1, i3, i3) -> i3
        %2649 = "comb.xor"(%2640, %2601) : (i1, i1) -> i1
        %2650 = "comb.xor"(%2632, %2601) : (i1, i1) -> i1
        %2651 = "comb.or"(%2645, %2649, %2650) : (i1, i1, i1) -> i1
        %2652 = "comb.mux"(%2651, %2614, %2605) : (i1, i3, i3) -> i3
        %2653 = "comb.icmp"(%2614, %2604) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2654 = "comb.mux"(%2653, %2614, %2607) : (i1, i3, i3) -> i3
        %2655 = "comb.xor"(%2653, %2601) : (i1, i1) -> i1
        %2656 = "comb.xor"(%arg3, %2601) : (i1, i1) -> i1
        %2657 = "comb.and"(%2641, %2656) : (i1, i1) -> i1
        %2658 = "comb.and"(%2642, %2657) : (i1, i1) -> i1
        %2659 = "comb.and"(%2643, %2658) : (i1, i1) -> i1
        %2660 = "comb.and"(%2635, %2659) : (i1, i1) -> i1
        %2661 = "comb.and"(%2634, %2658) : (i1, i1) -> i1
        %2662 = "comb.or"(%2660, %2661) : (i1, i1) -> i1
        %2663 = "comb.and"(%2639, %2662) : (i1, i1) -> i1
        %2664 = "comb.and"(%2663, %arg5) : (i1, i1) -> i1
        %2665 = "comb.mux"(%2664, %2604, %2654) : (i1, i3, i3) -> i3
        %2666 = "comb.xor"(%2664, %2601) : (i1, i1) -> i1
        %2667 = "comb.and"(%2662, %arg4) : (i1, i1) -> i1
        %2668 = "comb.mux"(%2667, %2603, %2665) : (i1, i3, i3) -> i3
        %2669 = "comb.xor"(%2667, %2601) : (i1, i1) -> i1
        %2670 = "comb.concat"(%2600, %arg8) : (i2, i1) -> i3
        %2671 = "comb.and"(%2633, %2657) : (i1, i1) -> i1
        %2672 = "comb.and"(%2639, %2671) : (i1, i1) -> i1
        %2673 = "comb.xor"(%arg5, %2601) : (i1, i1) -> i1
        %2674 = "comb.and"(%2673, %2672) : (i1, i1) -> i1
        %2675 = "comb.and"(%arg7, %2674) : (i1, i1) -> i1
        %2676 = "comb.mux"(%2675, %2670, %2668) : (i1, i3, i3) -> i3
        %2677 = "comb.xor"(%2675, %2601) : (i1, i1) -> i1
        %2678 = "comb.and"(%2672, %arg5) : (i1, i1) -> i1
        %2679 = "comb.mux"(%2678, %2604, %2676) : (i1, i3, i3) -> i3
        %2680 = "comb.xor"(%2678, %2601) : (i1, i1) -> i1
        %2681 = "comb.and"(%2671, %arg4) : (i1, i1) -> i1
        %2682 = "comb.mux"(%2681, %2603, %2679) : (i1, i3, i3) -> i3
        %2683 = "comb.xor"(%2681, %2601) : (i1, i1) -> i1
        %2684 = "comb.mux"(%2647, %2648, %2652) : (i1, i3, i3) -> i3
        %2685 = "comb.and"(%2631, %2656) : (i1, i1) -> i1
        %2686 = "comb.and"(%2673, %2663) : (i1, i1) -> i1
        %2687 = "comb.and"(%2639, %2685) : (i1, i1) -> i1
        %2688 = "comb.and"(%2638, %2644, %2659) : (i1, i1, i1) -> i1
        %2689 = "comb.or"(%2686, %2687, %2688) : (i1, i1, i1) -> i1
        %2690 = "comb.mux"(%2689, %2684, %2682) : (i1, i3, i3) -> i3
        %2691 = "comb.xor"(%2689, %2601) : (i1, i1) -> i1
        %2692 = "comb.and"(%2685, %arg4) : (i1, i1) -> i1
        %2693 = "comb.mux"(%2692, %2603, %2690) : (i1, i3, i3) -> i3
        %2694 = "comb.xor"(%2692, %2601) : (i1, i1) -> i1
        %2695 = "comb.mux"(%arg3, %2607, %2693) : (i1, i3, i3) -> i3
        %2696 = "comb.xor"(%arg7, %2601) : (i1, i1) -> i1
        %2697 = "comb.and"(%2674, %2696) : (i1, i1) -> i1
        %2698 = "comb.mux"(%2697, %2614, %2695) : (i1, i3, i3) -> i3
        %2699 = "comb.xor"(%2697, %2601) : (i1, i1) -> i1
        %2700 = "comb.and"(%2699, %2656, %2694, %2691, %2683, %2680, %2677, %2669, %2666, %2655) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2701 = "comb.and"(%2613) : (i1) -> i1
        "fsm.return"(%2701) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_2"}> ({
      %2560 = "hw.constant"() <{value = true}> : () -> i1
      %2561 = "hw.constant"() <{value = -4 : i3}> : () -> i3
      %2562 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %2563 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %2564 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %2565 = "hw.constant"() <{value = 2 : i3}> : () -> i3
      %2566 = "hw.constant"() <{value = false}> : () -> i1
      %2567 = "hw.constant"() <{value = false}> : () -> i1
      %2568 = "hw.constant"() <{value = false}> : () -> i1
      %2569 = "hw.constant"() <{value = false}> : () -> i1
      %2570 = "hw.constant"() <{value = false}> : () -> i1
      %2571 = "comb.or"(%arg4, %arg5, %arg3, %2570) : (i1, i1, i1, i1) -> i1
      %2572 = "comb.xor"(%2571, %2560) : (i1, i1) -> i1
      %2573 = "comb.xor"(%arg4, %2560) : (i1, i1) -> i1
      %2574 = "hw.constant"() <{value = true}> : () -> i1
      %2575 = "comb.xor"(%arg3, %2560) : (i1, i1) -> i1
      %2576 = "comb.and"(%2573, %2575) : (i1, i1) -> i1
      %2577 = "comb.and"(%2576, %arg5) : (i1, i1) -> i1
      %2578 = "comb.mux"(%2577, %2562, %2564) : (i1, i3, i3) -> i3
      %2579 = "comb.xor"(%2577, %2560) : (i1, i1) -> i1
      %2580 = "comb.and"(%2575, %arg4) : (i1, i1) -> i1
      %2581 = "comb.mux"(%2580, %2561, %2578) : (i1, i3, i3) -> i3
      %2582 = "comb.xor"(%2580, %2560) : (i1, i1) -> i1
      %2583 = "comb.xor"(%arg5, %2560) : (i1, i1) -> i1
      %2584 = "hw.constant"() <{value = true}> : () -> i1
      %2585 = "hw.constant"() <{value = true}> : () -> i1
      %2586 = "hw.constant"() <{value = true}> : () -> i1
      %2587 = "comb.mux"(%arg8, %2563, %2565) : (i1, i3, i3) -> i3
      %2588 = "comb.and"(%2583, %2576) : (i1, i1) -> i1
      %2589 = "hw.constant"() <{value = false}> : () -> i1
      %2590 = "hw.constant"() <{value = false}> : () -> i1
      %2591 = "comb.or"(%2588, %2589, %2590) : (i1, i1, i1) -> i1
      %2592 = "comb.mux"(%2591, %2587, %2581) : (i1, i3, i3) -> i3
      %2593 = "comb.xor"(%2591, %2560) : (i1, i1) -> i1
      %2594 = "hw.constant"() <{value = true}> : () -> i1
      %2595 = "comb.mux"(%arg3, %2564, %2592) : (i1, i3, i3) -> i3
      %2596 = "hw.constant"() <{value = true}> : () -> i1
      %2597 = "comb.and"(%2575, %2593, %2582, %2579, %2594, %2586, %2585, %2596, %2584, %2574) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      %2598 = "comb.icmp"(%2595, %2562) <{predicate = 0 : i64}> : (i3, i3) -> i1
      %2599 = "comb.icmp"(%2595, %2563) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%2566, %2567, %2568, %2569, %2571, %2572, %2599, %2598, %2597) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %2457 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2458 = "hw.constant"() <{value = true}> : () -> i1
        %2459 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2460 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2461 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2462 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2463 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2464 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2465 = "hw.constant"() <{value = true}> : () -> i1
        %2466 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2467 = "comb.xor"(%arg1, %2465) : (i1, i1) -> i1
        %2468 = "seq.initial"() ({
          %2559 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2559) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2469 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %2470 = "comb.icmp"(%2555, %2469) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2471 = "seq.compreg"(%2555, %arg0, %2467, %2466, %2468) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2472 = "comb.icmp"(%2471, %2464) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2473 = "comb.and"(%2472, %arg2) : (i1, i1) -> i1
        %2474 = "comb.icmp"(%2471, %2463) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2475 = "comb.icmp"(%2471, %2462) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2476 = "comb.icmp"(%2471, %2461) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2477 = "comb.icmp"(%2471, %2461) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2478 = "comb.icmp"(%2555, %2461) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2479 = "comb.and"(%2477, %2478) : (i1, i1) -> i1
        %2480 = "comb.icmp"(%2471, %2462) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2481 = "comb.icmp"(%2555, %2462) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2482 = "comb.and"(%2480, %2481) : (i1, i1) -> i1
        %2483 = "comb.and"(%2472, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2484 = "comb.and"(%2475, %arg6) : (i1, i1) -> i1
        %2485 = "comb.or"(%arg4, %arg5, %arg3, %2484) : (i1, i1, i1, i1) -> i1
        %2486 = "comb.or"(%2483, %2485) : (i1, i1) -> i1
        %2487 = "comb.xor"(%2485, %2458) : (i1, i1) -> i1
        %2488 = "comb.icmp"(%2471, %2464) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2489 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2490 = "comb.icmp"(%2471, %2463) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2491 = "comb.icmp"(%2471, %2459) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2492 = "comb.icmp"(%2471, %2462) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2493 = "comb.mux"(%2491, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2494 = "comb.mux"(%2491, %2462, %2464) : (i1, i3, i3) -> i3
        %2495 = "comb.icmp"(%2471, %2460) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2496 = "comb.xor"(%arg4, %2458) : (i1, i1) -> i1
        %2497 = "comb.and"(%2488, %2496) : (i1, i1) -> i1
        %2498 = "comb.xor"(%2488, %2458) : (i1, i1) -> i1
        %2499 = "comb.xor"(%2490, %2458) : (i1, i1) -> i1
        %2500 = "comb.xor"(%2491, %2458) : (i1, i1) -> i1
        %2501 = "comb.xor"(%2492, %2458) : (i1, i1) -> i1
        %2502 = "comb.and"(%2501, %2500, %2499, %2498, %2495) : (i1, i1, i1, i1, i1) -> i1
        %2503 = "comb.or"(%2502, %2497) : (i1, i1) -> i1
        %2504 = "comb.mux"(%2503, %arg5, %2493) : (i1, i1, i1) -> i1
        %2505 = "comb.mux"(%2503, %2461, %2494) : (i1, i3, i3) -> i3
        %2506 = "comb.xor"(%2497, %2458) : (i1, i1) -> i1
        %2507 = "comb.xor"(%2489, %2458) : (i1, i1) -> i1
        %2508 = "comb.or"(%2502, %2506, %2507) : (i1, i1, i1) -> i1
        %2509 = "comb.mux"(%2508, %2471, %2462) : (i1, i3, i3) -> i3
        %2510 = "comb.icmp"(%2471, %2461) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2511 = "comb.mux"(%2510, %2471, %2464) : (i1, i3, i3) -> i3
        %2512 = "comb.xor"(%2510, %2458) : (i1, i1) -> i1
        %2513 = "comb.xor"(%arg3, %2458) : (i1, i1) -> i1
        %2514 = "comb.and"(%2498, %2513) : (i1, i1) -> i1
        %2515 = "comb.and"(%2499, %2514) : (i1, i1) -> i1
        %2516 = "comb.and"(%2500, %2515) : (i1, i1) -> i1
        %2517 = "comb.and"(%2492, %2516) : (i1, i1) -> i1
        %2518 = "comb.and"(%2491, %2515) : (i1, i1) -> i1
        %2519 = "comb.or"(%2517, %2518) : (i1, i1) -> i1
        %2520 = "comb.and"(%2496, %2519) : (i1, i1) -> i1
        %2521 = "comb.and"(%2520, %arg5) : (i1, i1) -> i1
        %2522 = "comb.mux"(%2521, %2461, %2511) : (i1, i3, i3) -> i3
        %2523 = "comb.xor"(%2521, %2458) : (i1, i1) -> i1
        %2524 = "comb.and"(%2519, %arg4) : (i1, i1) -> i1
        %2525 = "comb.mux"(%2524, %2460, %2522) : (i1, i3, i3) -> i3
        %2526 = "comb.xor"(%2524, %2458) : (i1, i1) -> i1
        %2527 = "comb.concat"(%2457, %arg8) : (i2, i1) -> i3
        %2528 = "comb.and"(%2490, %2514) : (i1, i1) -> i1
        %2529 = "comb.and"(%2496, %2528) : (i1, i1) -> i1
        %2530 = "comb.xor"(%arg5, %2458) : (i1, i1) -> i1
        %2531 = "comb.and"(%2530, %2529) : (i1, i1) -> i1
        %2532 = "comb.and"(%arg7, %2531) : (i1, i1) -> i1
        %2533 = "comb.mux"(%2532, %2527, %2525) : (i1, i3, i3) -> i3
        %2534 = "comb.xor"(%2532, %2458) : (i1, i1) -> i1
        %2535 = "comb.and"(%2529, %arg5) : (i1, i1) -> i1
        %2536 = "comb.mux"(%2535, %2461, %2533) : (i1, i3, i3) -> i3
        %2537 = "comb.xor"(%2535, %2458) : (i1, i1) -> i1
        %2538 = "comb.and"(%2528, %arg4) : (i1, i1) -> i1
        %2539 = "comb.mux"(%2538, %2460, %2536) : (i1, i3, i3) -> i3
        %2540 = "comb.xor"(%2538, %2458) : (i1, i1) -> i1
        %2541 = "comb.mux"(%2504, %2505, %2509) : (i1, i3, i3) -> i3
        %2542 = "comb.and"(%2488, %2513) : (i1, i1) -> i1
        %2543 = "comb.and"(%2530, %2520) : (i1, i1) -> i1
        %2544 = "comb.and"(%2496, %2542) : (i1, i1) -> i1
        %2545 = "comb.and"(%2495, %2501, %2516) : (i1, i1, i1) -> i1
        %2546 = "comb.or"(%2543, %2544, %2545) : (i1, i1, i1) -> i1
        %2547 = "comb.mux"(%2546, %2541, %2539) : (i1, i3, i3) -> i3
        %2548 = "comb.xor"(%2546, %2458) : (i1, i1) -> i1
        %2549 = "comb.and"(%2542, %arg4) : (i1, i1) -> i1
        %2550 = "comb.mux"(%2549, %2460, %2547) : (i1, i3, i3) -> i3
        %2551 = "comb.xor"(%2549, %2458) : (i1, i1) -> i1
        %2552 = "comb.mux"(%arg3, %2464, %2550) : (i1, i3, i3) -> i3
        %2553 = "comb.xor"(%arg7, %2458) : (i1, i1) -> i1
        %2554 = "comb.and"(%2531, %2553) : (i1, i1) -> i1
        %2555 = "comb.mux"(%2554, %2471, %2552) : (i1, i3, i3) -> i3
        %2556 = "comb.xor"(%2554, %2458) : (i1, i1) -> i1
        %2557 = "comb.and"(%2556, %2513, %2551, %2548, %2540, %2537, %2534, %2526, %2523, %2512) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2558 = "comb.and"(%2470) : (i1) -> i1
        "fsm.return"(%2558) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %2354 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2355 = "hw.constant"() <{value = true}> : () -> i1
        %2356 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2357 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2358 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2359 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2360 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2361 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2362 = "hw.constant"() <{value = true}> : () -> i1
        %2363 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2364 = "comb.xor"(%arg1, %2362) : (i1, i1) -> i1
        %2365 = "seq.initial"() ({
          %2456 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2456) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2366 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %2367 = "comb.icmp"(%2452, %2366) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2368 = "seq.compreg"(%2452, %arg0, %2364, %2363, %2365) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2369 = "comb.icmp"(%2368, %2361) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2370 = "comb.and"(%2369, %arg2) : (i1, i1) -> i1
        %2371 = "comb.icmp"(%2368, %2360) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2372 = "comb.icmp"(%2368, %2359) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2373 = "comb.icmp"(%2368, %2358) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2374 = "comb.icmp"(%2368, %2358) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2375 = "comb.icmp"(%2452, %2358) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2376 = "comb.and"(%2374, %2375) : (i1, i1) -> i1
        %2377 = "comb.icmp"(%2368, %2359) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2378 = "comb.icmp"(%2452, %2359) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2379 = "comb.and"(%2377, %2378) : (i1, i1) -> i1
        %2380 = "comb.and"(%2369, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2381 = "comb.and"(%2372, %arg6) : (i1, i1) -> i1
        %2382 = "comb.or"(%arg4, %arg5, %arg3, %2381) : (i1, i1, i1, i1) -> i1
        %2383 = "comb.or"(%2380, %2382) : (i1, i1) -> i1
        %2384 = "comb.xor"(%2382, %2355) : (i1, i1) -> i1
        %2385 = "comb.icmp"(%2368, %2361) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2386 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2387 = "comb.icmp"(%2368, %2360) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2388 = "comb.icmp"(%2368, %2356) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2389 = "comb.icmp"(%2368, %2359) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2390 = "comb.mux"(%2388, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2391 = "comb.mux"(%2388, %2359, %2361) : (i1, i3, i3) -> i3
        %2392 = "comb.icmp"(%2368, %2357) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2393 = "comb.xor"(%arg4, %2355) : (i1, i1) -> i1
        %2394 = "comb.and"(%2385, %2393) : (i1, i1) -> i1
        %2395 = "comb.xor"(%2385, %2355) : (i1, i1) -> i1
        %2396 = "comb.xor"(%2387, %2355) : (i1, i1) -> i1
        %2397 = "comb.xor"(%2388, %2355) : (i1, i1) -> i1
        %2398 = "comb.xor"(%2389, %2355) : (i1, i1) -> i1
        %2399 = "comb.and"(%2398, %2397, %2396, %2395, %2392) : (i1, i1, i1, i1, i1) -> i1
        %2400 = "comb.or"(%2399, %2394) : (i1, i1) -> i1
        %2401 = "comb.mux"(%2400, %arg5, %2390) : (i1, i1, i1) -> i1
        %2402 = "comb.mux"(%2400, %2358, %2391) : (i1, i3, i3) -> i3
        %2403 = "comb.xor"(%2394, %2355) : (i1, i1) -> i1
        %2404 = "comb.xor"(%2386, %2355) : (i1, i1) -> i1
        %2405 = "comb.or"(%2399, %2403, %2404) : (i1, i1, i1) -> i1
        %2406 = "comb.mux"(%2405, %2368, %2359) : (i1, i3, i3) -> i3
        %2407 = "comb.icmp"(%2368, %2358) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2408 = "comb.mux"(%2407, %2368, %2361) : (i1, i3, i3) -> i3
        %2409 = "comb.xor"(%2407, %2355) : (i1, i1) -> i1
        %2410 = "comb.xor"(%arg3, %2355) : (i1, i1) -> i1
        %2411 = "comb.and"(%2395, %2410) : (i1, i1) -> i1
        %2412 = "comb.and"(%2396, %2411) : (i1, i1) -> i1
        %2413 = "comb.and"(%2397, %2412) : (i1, i1) -> i1
        %2414 = "comb.and"(%2389, %2413) : (i1, i1) -> i1
        %2415 = "comb.and"(%2388, %2412) : (i1, i1) -> i1
        %2416 = "comb.or"(%2414, %2415) : (i1, i1) -> i1
        %2417 = "comb.and"(%2393, %2416) : (i1, i1) -> i1
        %2418 = "comb.and"(%2417, %arg5) : (i1, i1) -> i1
        %2419 = "comb.mux"(%2418, %2358, %2408) : (i1, i3, i3) -> i3
        %2420 = "comb.xor"(%2418, %2355) : (i1, i1) -> i1
        %2421 = "comb.and"(%2416, %arg4) : (i1, i1) -> i1
        %2422 = "comb.mux"(%2421, %2357, %2419) : (i1, i3, i3) -> i3
        %2423 = "comb.xor"(%2421, %2355) : (i1, i1) -> i1
        %2424 = "comb.concat"(%2354, %arg8) : (i2, i1) -> i3
        %2425 = "comb.and"(%2387, %2411) : (i1, i1) -> i1
        %2426 = "comb.and"(%2393, %2425) : (i1, i1) -> i1
        %2427 = "comb.xor"(%arg5, %2355) : (i1, i1) -> i1
        %2428 = "comb.and"(%2427, %2426) : (i1, i1) -> i1
        %2429 = "comb.and"(%arg7, %2428) : (i1, i1) -> i1
        %2430 = "comb.mux"(%2429, %2424, %2422) : (i1, i3, i3) -> i3
        %2431 = "comb.xor"(%2429, %2355) : (i1, i1) -> i1
        %2432 = "comb.and"(%2426, %arg5) : (i1, i1) -> i1
        %2433 = "comb.mux"(%2432, %2358, %2430) : (i1, i3, i3) -> i3
        %2434 = "comb.xor"(%2432, %2355) : (i1, i1) -> i1
        %2435 = "comb.and"(%2425, %arg4) : (i1, i1) -> i1
        %2436 = "comb.mux"(%2435, %2357, %2433) : (i1, i3, i3) -> i3
        %2437 = "comb.xor"(%2435, %2355) : (i1, i1) -> i1
        %2438 = "comb.mux"(%2401, %2402, %2406) : (i1, i3, i3) -> i3
        %2439 = "comb.and"(%2385, %2410) : (i1, i1) -> i1
        %2440 = "comb.and"(%2427, %2417) : (i1, i1) -> i1
        %2441 = "comb.and"(%2393, %2439) : (i1, i1) -> i1
        %2442 = "comb.and"(%2392, %2398, %2413) : (i1, i1, i1) -> i1
        %2443 = "comb.or"(%2440, %2441, %2442) : (i1, i1, i1) -> i1
        %2444 = "comb.mux"(%2443, %2438, %2436) : (i1, i3, i3) -> i3
        %2445 = "comb.xor"(%2443, %2355) : (i1, i1) -> i1
        %2446 = "comb.and"(%2439, %arg4) : (i1, i1) -> i1
        %2447 = "comb.mux"(%2446, %2357, %2444) : (i1, i3, i3) -> i3
        %2448 = "comb.xor"(%2446, %2355) : (i1, i1) -> i1
        %2449 = "comb.mux"(%arg3, %2361, %2447) : (i1, i3, i3) -> i3
        %2450 = "comb.xor"(%arg7, %2355) : (i1, i1) -> i1
        %2451 = "comb.and"(%2428, %2450) : (i1, i1) -> i1
        %2452 = "comb.mux"(%2451, %2368, %2449) : (i1, i3, i3) -> i3
        %2453 = "comb.xor"(%2451, %2355) : (i1, i1) -> i1
        %2454 = "comb.and"(%2453, %2410, %2448, %2445, %2437, %2434, %2431, %2423, %2420, %2409) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2455 = "comb.and"(%2367) : (i1) -> i1
        "fsm.return"(%2455) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %2251 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2252 = "hw.constant"() <{value = true}> : () -> i1
        %2253 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2254 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2255 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2256 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2257 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2258 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2259 = "hw.constant"() <{value = true}> : () -> i1
        %2260 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2261 = "comb.xor"(%arg1, %2259) : (i1, i1) -> i1
        %2262 = "seq.initial"() ({
          %2353 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2353) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2263 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2264 = "comb.icmp"(%2349, %2263) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2265 = "seq.compreg"(%2349, %arg0, %2261, %2260, %2262) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2266 = "comb.icmp"(%2265, %2258) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2267 = "comb.and"(%2266, %arg2) : (i1, i1) -> i1
        %2268 = "comb.icmp"(%2265, %2257) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2269 = "comb.icmp"(%2265, %2256) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2270 = "comb.icmp"(%2265, %2255) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2271 = "comb.icmp"(%2265, %2255) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2272 = "comb.icmp"(%2349, %2255) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2273 = "comb.and"(%2271, %2272) : (i1, i1) -> i1
        %2274 = "comb.icmp"(%2265, %2256) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2275 = "comb.icmp"(%2349, %2256) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2276 = "comb.and"(%2274, %2275) : (i1, i1) -> i1
        %2277 = "comb.and"(%2266, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2278 = "comb.and"(%2269, %arg6) : (i1, i1) -> i1
        %2279 = "comb.or"(%arg4, %arg5, %arg3, %2278) : (i1, i1, i1, i1) -> i1
        %2280 = "comb.or"(%2277, %2279) : (i1, i1) -> i1
        %2281 = "comb.xor"(%2279, %2252) : (i1, i1) -> i1
        %2282 = "comb.icmp"(%2265, %2258) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2283 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2284 = "comb.icmp"(%2265, %2257) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2285 = "comb.icmp"(%2265, %2253) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2286 = "comb.icmp"(%2265, %2256) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2287 = "comb.mux"(%2285, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2288 = "comb.mux"(%2285, %2256, %2258) : (i1, i3, i3) -> i3
        %2289 = "comb.icmp"(%2265, %2254) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2290 = "comb.xor"(%arg4, %2252) : (i1, i1) -> i1
        %2291 = "comb.and"(%2282, %2290) : (i1, i1) -> i1
        %2292 = "comb.xor"(%2282, %2252) : (i1, i1) -> i1
        %2293 = "comb.xor"(%2284, %2252) : (i1, i1) -> i1
        %2294 = "comb.xor"(%2285, %2252) : (i1, i1) -> i1
        %2295 = "comb.xor"(%2286, %2252) : (i1, i1) -> i1
        %2296 = "comb.and"(%2295, %2294, %2293, %2292, %2289) : (i1, i1, i1, i1, i1) -> i1
        %2297 = "comb.or"(%2296, %2291) : (i1, i1) -> i1
        %2298 = "comb.mux"(%2297, %arg5, %2287) : (i1, i1, i1) -> i1
        %2299 = "comb.mux"(%2297, %2255, %2288) : (i1, i3, i3) -> i3
        %2300 = "comb.xor"(%2291, %2252) : (i1, i1) -> i1
        %2301 = "comb.xor"(%2283, %2252) : (i1, i1) -> i1
        %2302 = "comb.or"(%2296, %2300, %2301) : (i1, i1, i1) -> i1
        %2303 = "comb.mux"(%2302, %2265, %2256) : (i1, i3, i3) -> i3
        %2304 = "comb.icmp"(%2265, %2255) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2305 = "comb.mux"(%2304, %2265, %2258) : (i1, i3, i3) -> i3
        %2306 = "comb.xor"(%2304, %2252) : (i1, i1) -> i1
        %2307 = "comb.xor"(%arg3, %2252) : (i1, i1) -> i1
        %2308 = "comb.and"(%2292, %2307) : (i1, i1) -> i1
        %2309 = "comb.and"(%2293, %2308) : (i1, i1) -> i1
        %2310 = "comb.and"(%2294, %2309) : (i1, i1) -> i1
        %2311 = "comb.and"(%2286, %2310) : (i1, i1) -> i1
        %2312 = "comb.and"(%2285, %2309) : (i1, i1) -> i1
        %2313 = "comb.or"(%2311, %2312) : (i1, i1) -> i1
        %2314 = "comb.and"(%2290, %2313) : (i1, i1) -> i1
        %2315 = "comb.and"(%2314, %arg5) : (i1, i1) -> i1
        %2316 = "comb.mux"(%2315, %2255, %2305) : (i1, i3, i3) -> i3
        %2317 = "comb.xor"(%2315, %2252) : (i1, i1) -> i1
        %2318 = "comb.and"(%2313, %arg4) : (i1, i1) -> i1
        %2319 = "comb.mux"(%2318, %2254, %2316) : (i1, i3, i3) -> i3
        %2320 = "comb.xor"(%2318, %2252) : (i1, i1) -> i1
        %2321 = "comb.concat"(%2251, %arg8) : (i2, i1) -> i3
        %2322 = "comb.and"(%2284, %2308) : (i1, i1) -> i1
        %2323 = "comb.and"(%2290, %2322) : (i1, i1) -> i1
        %2324 = "comb.xor"(%arg5, %2252) : (i1, i1) -> i1
        %2325 = "comb.and"(%2324, %2323) : (i1, i1) -> i1
        %2326 = "comb.and"(%arg7, %2325) : (i1, i1) -> i1
        %2327 = "comb.mux"(%2326, %2321, %2319) : (i1, i3, i3) -> i3
        %2328 = "comb.xor"(%2326, %2252) : (i1, i1) -> i1
        %2329 = "comb.and"(%2323, %arg5) : (i1, i1) -> i1
        %2330 = "comb.mux"(%2329, %2255, %2327) : (i1, i3, i3) -> i3
        %2331 = "comb.xor"(%2329, %2252) : (i1, i1) -> i1
        %2332 = "comb.and"(%2322, %arg4) : (i1, i1) -> i1
        %2333 = "comb.mux"(%2332, %2254, %2330) : (i1, i3, i3) -> i3
        %2334 = "comb.xor"(%2332, %2252) : (i1, i1) -> i1
        %2335 = "comb.mux"(%2298, %2299, %2303) : (i1, i3, i3) -> i3
        %2336 = "comb.and"(%2282, %2307) : (i1, i1) -> i1
        %2337 = "comb.and"(%2324, %2314) : (i1, i1) -> i1
        %2338 = "comb.and"(%2290, %2336) : (i1, i1) -> i1
        %2339 = "comb.and"(%2289, %2295, %2310) : (i1, i1, i1) -> i1
        %2340 = "comb.or"(%2337, %2338, %2339) : (i1, i1, i1) -> i1
        %2341 = "comb.mux"(%2340, %2335, %2333) : (i1, i3, i3) -> i3
        %2342 = "comb.xor"(%2340, %2252) : (i1, i1) -> i1
        %2343 = "comb.and"(%2336, %arg4) : (i1, i1) -> i1
        %2344 = "comb.mux"(%2343, %2254, %2341) : (i1, i3, i3) -> i3
        %2345 = "comb.xor"(%2343, %2252) : (i1, i1) -> i1
        %2346 = "comb.mux"(%arg3, %2258, %2344) : (i1, i3, i3) -> i3
        %2347 = "comb.xor"(%arg7, %2252) : (i1, i1) -> i1
        %2348 = "comb.and"(%2325, %2347) : (i1, i1) -> i1
        %2349 = "comb.mux"(%2348, %2265, %2346) : (i1, i3, i3) -> i3
        %2350 = "comb.xor"(%2348, %2252) : (i1, i1) -> i1
        %2351 = "comb.and"(%2350, %2307, %2345, %2342, %2334, %2331, %2328, %2320, %2317, %2306) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2352 = "comb.and"(%2264) : (i1) -> i1
        "fsm.return"(%2352) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %2148 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2149 = "hw.constant"() <{value = true}> : () -> i1
        %2150 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2151 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2152 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2153 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2154 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2155 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2156 = "hw.constant"() <{value = true}> : () -> i1
        %2157 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2158 = "comb.xor"(%arg1, %2156) : (i1, i1) -> i1
        %2159 = "seq.initial"() ({
          %2250 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2250) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2160 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2161 = "comb.icmp"(%2246, %2160) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2162 = "seq.compreg"(%2246, %arg0, %2158, %2157, %2159) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2163 = "comb.icmp"(%2162, %2155) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2164 = "comb.and"(%2163, %arg2) : (i1, i1) -> i1
        %2165 = "comb.icmp"(%2162, %2154) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2166 = "comb.icmp"(%2162, %2153) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2167 = "comb.icmp"(%2162, %2152) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2168 = "comb.icmp"(%2162, %2152) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2169 = "comb.icmp"(%2246, %2152) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2170 = "comb.and"(%2168, %2169) : (i1, i1) -> i1
        %2171 = "comb.icmp"(%2162, %2153) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2172 = "comb.icmp"(%2246, %2153) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2173 = "comb.and"(%2171, %2172) : (i1, i1) -> i1
        %2174 = "comb.and"(%2163, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2175 = "comb.and"(%2166, %arg6) : (i1, i1) -> i1
        %2176 = "comb.or"(%arg4, %arg5, %arg3, %2175) : (i1, i1, i1, i1) -> i1
        %2177 = "comb.or"(%2174, %2176) : (i1, i1) -> i1
        %2178 = "comb.xor"(%2176, %2149) : (i1, i1) -> i1
        %2179 = "comb.icmp"(%2162, %2155) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2180 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2181 = "comb.icmp"(%2162, %2154) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2182 = "comb.icmp"(%2162, %2150) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2183 = "comb.icmp"(%2162, %2153) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2184 = "comb.mux"(%2182, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2185 = "comb.mux"(%2182, %2153, %2155) : (i1, i3, i3) -> i3
        %2186 = "comb.icmp"(%2162, %2151) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2187 = "comb.xor"(%arg4, %2149) : (i1, i1) -> i1
        %2188 = "comb.and"(%2179, %2187) : (i1, i1) -> i1
        %2189 = "comb.xor"(%2179, %2149) : (i1, i1) -> i1
        %2190 = "comb.xor"(%2181, %2149) : (i1, i1) -> i1
        %2191 = "comb.xor"(%2182, %2149) : (i1, i1) -> i1
        %2192 = "comb.xor"(%2183, %2149) : (i1, i1) -> i1
        %2193 = "comb.and"(%2192, %2191, %2190, %2189, %2186) : (i1, i1, i1, i1, i1) -> i1
        %2194 = "comb.or"(%2193, %2188) : (i1, i1) -> i1
        %2195 = "comb.mux"(%2194, %arg5, %2184) : (i1, i1, i1) -> i1
        %2196 = "comb.mux"(%2194, %2152, %2185) : (i1, i3, i3) -> i3
        %2197 = "comb.xor"(%2188, %2149) : (i1, i1) -> i1
        %2198 = "comb.xor"(%2180, %2149) : (i1, i1) -> i1
        %2199 = "comb.or"(%2193, %2197, %2198) : (i1, i1, i1) -> i1
        %2200 = "comb.mux"(%2199, %2162, %2153) : (i1, i3, i3) -> i3
        %2201 = "comb.icmp"(%2162, %2152) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2202 = "comb.mux"(%2201, %2162, %2155) : (i1, i3, i3) -> i3
        %2203 = "comb.xor"(%2201, %2149) : (i1, i1) -> i1
        %2204 = "comb.xor"(%arg3, %2149) : (i1, i1) -> i1
        %2205 = "comb.and"(%2189, %2204) : (i1, i1) -> i1
        %2206 = "comb.and"(%2190, %2205) : (i1, i1) -> i1
        %2207 = "comb.and"(%2191, %2206) : (i1, i1) -> i1
        %2208 = "comb.and"(%2183, %2207) : (i1, i1) -> i1
        %2209 = "comb.and"(%2182, %2206) : (i1, i1) -> i1
        %2210 = "comb.or"(%2208, %2209) : (i1, i1) -> i1
        %2211 = "comb.and"(%2187, %2210) : (i1, i1) -> i1
        %2212 = "comb.and"(%2211, %arg5) : (i1, i1) -> i1
        %2213 = "comb.mux"(%2212, %2152, %2202) : (i1, i3, i3) -> i3
        %2214 = "comb.xor"(%2212, %2149) : (i1, i1) -> i1
        %2215 = "comb.and"(%2210, %arg4) : (i1, i1) -> i1
        %2216 = "comb.mux"(%2215, %2151, %2213) : (i1, i3, i3) -> i3
        %2217 = "comb.xor"(%2215, %2149) : (i1, i1) -> i1
        %2218 = "comb.concat"(%2148, %arg8) : (i2, i1) -> i3
        %2219 = "comb.and"(%2181, %2205) : (i1, i1) -> i1
        %2220 = "comb.and"(%2187, %2219) : (i1, i1) -> i1
        %2221 = "comb.xor"(%arg5, %2149) : (i1, i1) -> i1
        %2222 = "comb.and"(%2221, %2220) : (i1, i1) -> i1
        %2223 = "comb.and"(%arg7, %2222) : (i1, i1) -> i1
        %2224 = "comb.mux"(%2223, %2218, %2216) : (i1, i3, i3) -> i3
        %2225 = "comb.xor"(%2223, %2149) : (i1, i1) -> i1
        %2226 = "comb.and"(%2220, %arg5) : (i1, i1) -> i1
        %2227 = "comb.mux"(%2226, %2152, %2224) : (i1, i3, i3) -> i3
        %2228 = "comb.xor"(%2226, %2149) : (i1, i1) -> i1
        %2229 = "comb.and"(%2219, %arg4) : (i1, i1) -> i1
        %2230 = "comb.mux"(%2229, %2151, %2227) : (i1, i3, i3) -> i3
        %2231 = "comb.xor"(%2229, %2149) : (i1, i1) -> i1
        %2232 = "comb.mux"(%2195, %2196, %2200) : (i1, i3, i3) -> i3
        %2233 = "comb.and"(%2179, %2204) : (i1, i1) -> i1
        %2234 = "comb.and"(%2221, %2211) : (i1, i1) -> i1
        %2235 = "comb.and"(%2187, %2233) : (i1, i1) -> i1
        %2236 = "comb.and"(%2186, %2192, %2207) : (i1, i1, i1) -> i1
        %2237 = "comb.or"(%2234, %2235, %2236) : (i1, i1, i1) -> i1
        %2238 = "comb.mux"(%2237, %2232, %2230) : (i1, i3, i3) -> i3
        %2239 = "comb.xor"(%2237, %2149) : (i1, i1) -> i1
        %2240 = "comb.and"(%2233, %arg4) : (i1, i1) -> i1
        %2241 = "comb.mux"(%2240, %2151, %2238) : (i1, i3, i3) -> i3
        %2242 = "comb.xor"(%2240, %2149) : (i1, i1) -> i1
        %2243 = "comb.mux"(%arg3, %2155, %2241) : (i1, i3, i3) -> i3
        %2244 = "comb.xor"(%arg7, %2149) : (i1, i1) -> i1
        %2245 = "comb.and"(%2222, %2244) : (i1, i1) -> i1
        %2246 = "comb.mux"(%2245, %2162, %2243) : (i1, i3, i3) -> i3
        %2247 = "comb.xor"(%2245, %2149) : (i1, i1) -> i1
        %2248 = "comb.and"(%2247, %2204, %2242, %2239, %2231, %2228, %2225, %2217, %2214, %2203) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2249 = "comb.and"(%2161) : (i1) -> i1
        "fsm.return"(%2249) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %2045 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %2046 = "hw.constant"() <{value = true}> : () -> i1
        %2047 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %2048 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %2049 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %2050 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2051 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %2052 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2053 = "hw.constant"() <{value = true}> : () -> i1
        %2054 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %2055 = "comb.xor"(%arg1, %2053) : (i1, i1) -> i1
        %2056 = "seq.initial"() ({
          %2147 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2147) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %2057 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %2058 = "comb.icmp"(%2143, %2057) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2059 = "seq.compreg"(%2143, %arg0, %2055, %2054, %2056) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %2060 = "comb.icmp"(%2059, %2052) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %2061 = "comb.and"(%2060, %arg2) : (i1, i1) -> i1
        %2062 = "comb.icmp"(%2059, %2051) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2063 = "comb.icmp"(%2059, %2050) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2064 = "comb.icmp"(%2059, %2049) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2065 = "comb.icmp"(%2059, %2049) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2066 = "comb.icmp"(%2143, %2049) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2067 = "comb.and"(%2065, %2066) : (i1, i1) -> i1
        %2068 = "comb.icmp"(%2059, %2050) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %2069 = "comb.icmp"(%2143, %2050) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %2070 = "comb.and"(%2068, %2069) : (i1, i1) -> i1
        %2071 = "comb.and"(%2060, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %2072 = "comb.and"(%2063, %arg6) : (i1, i1) -> i1
        %2073 = "comb.or"(%arg4, %arg5, %arg3, %2072) : (i1, i1, i1, i1) -> i1
        %2074 = "comb.or"(%2071, %2073) : (i1, i1) -> i1
        %2075 = "comb.xor"(%2073, %2046) : (i1, i1) -> i1
        %2076 = "comb.icmp"(%2059, %2052) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2077 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %2078 = "comb.icmp"(%2059, %2051) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2079 = "comb.icmp"(%2059, %2047) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2080 = "comb.icmp"(%2059, %2050) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2081 = "comb.mux"(%2079, %arg8, %arg6) : (i1, i1, i1) -> i1
        %2082 = "comb.mux"(%2079, %2050, %2052) : (i1, i3, i3) -> i3
        %2083 = "comb.icmp"(%2059, %2048) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2084 = "comb.xor"(%arg4, %2046) : (i1, i1) -> i1
        %2085 = "comb.and"(%2076, %2084) : (i1, i1) -> i1
        %2086 = "comb.xor"(%2076, %2046) : (i1, i1) -> i1
        %2087 = "comb.xor"(%2078, %2046) : (i1, i1) -> i1
        %2088 = "comb.xor"(%2079, %2046) : (i1, i1) -> i1
        %2089 = "comb.xor"(%2080, %2046) : (i1, i1) -> i1
        %2090 = "comb.and"(%2089, %2088, %2087, %2086, %2083) : (i1, i1, i1, i1, i1) -> i1
        %2091 = "comb.or"(%2090, %2085) : (i1, i1) -> i1
        %2092 = "comb.mux"(%2091, %arg5, %2081) : (i1, i1, i1) -> i1
        %2093 = "comb.mux"(%2091, %2049, %2082) : (i1, i3, i3) -> i3
        %2094 = "comb.xor"(%2085, %2046) : (i1, i1) -> i1
        %2095 = "comb.xor"(%2077, %2046) : (i1, i1) -> i1
        %2096 = "comb.or"(%2090, %2094, %2095) : (i1, i1, i1) -> i1
        %2097 = "comb.mux"(%2096, %2059, %2050) : (i1, i3, i3) -> i3
        %2098 = "comb.icmp"(%2059, %2049) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %2099 = "comb.mux"(%2098, %2059, %2052) : (i1, i3, i3) -> i3
        %2100 = "comb.xor"(%2098, %2046) : (i1, i1) -> i1
        %2101 = "comb.xor"(%arg3, %2046) : (i1, i1) -> i1
        %2102 = "comb.and"(%2086, %2101) : (i1, i1) -> i1
        %2103 = "comb.and"(%2087, %2102) : (i1, i1) -> i1
        %2104 = "comb.and"(%2088, %2103) : (i1, i1) -> i1
        %2105 = "comb.and"(%2080, %2104) : (i1, i1) -> i1
        %2106 = "comb.and"(%2079, %2103) : (i1, i1) -> i1
        %2107 = "comb.or"(%2105, %2106) : (i1, i1) -> i1
        %2108 = "comb.and"(%2084, %2107) : (i1, i1) -> i1
        %2109 = "comb.and"(%2108, %arg5) : (i1, i1) -> i1
        %2110 = "comb.mux"(%2109, %2049, %2099) : (i1, i3, i3) -> i3
        %2111 = "comb.xor"(%2109, %2046) : (i1, i1) -> i1
        %2112 = "comb.and"(%2107, %arg4) : (i1, i1) -> i1
        %2113 = "comb.mux"(%2112, %2048, %2110) : (i1, i3, i3) -> i3
        %2114 = "comb.xor"(%2112, %2046) : (i1, i1) -> i1
        %2115 = "comb.concat"(%2045, %arg8) : (i2, i1) -> i3
        %2116 = "comb.and"(%2078, %2102) : (i1, i1) -> i1
        %2117 = "comb.and"(%2084, %2116) : (i1, i1) -> i1
        %2118 = "comb.xor"(%arg5, %2046) : (i1, i1) -> i1
        %2119 = "comb.and"(%2118, %2117) : (i1, i1) -> i1
        %2120 = "comb.and"(%arg7, %2119) : (i1, i1) -> i1
        %2121 = "comb.mux"(%2120, %2115, %2113) : (i1, i3, i3) -> i3
        %2122 = "comb.xor"(%2120, %2046) : (i1, i1) -> i1
        %2123 = "comb.and"(%2117, %arg5) : (i1, i1) -> i1
        %2124 = "comb.mux"(%2123, %2049, %2121) : (i1, i3, i3) -> i3
        %2125 = "comb.xor"(%2123, %2046) : (i1, i1) -> i1
        %2126 = "comb.and"(%2116, %arg4) : (i1, i1) -> i1
        %2127 = "comb.mux"(%2126, %2048, %2124) : (i1, i3, i3) -> i3
        %2128 = "comb.xor"(%2126, %2046) : (i1, i1) -> i1
        %2129 = "comb.mux"(%2092, %2093, %2097) : (i1, i3, i3) -> i3
        %2130 = "comb.and"(%2076, %2101) : (i1, i1) -> i1
        %2131 = "comb.and"(%2118, %2108) : (i1, i1) -> i1
        %2132 = "comb.and"(%2084, %2130) : (i1, i1) -> i1
        %2133 = "comb.and"(%2083, %2089, %2104) : (i1, i1, i1) -> i1
        %2134 = "comb.or"(%2131, %2132, %2133) : (i1, i1, i1) -> i1
        %2135 = "comb.mux"(%2134, %2129, %2127) : (i1, i3, i3) -> i3
        %2136 = "comb.xor"(%2134, %2046) : (i1, i1) -> i1
        %2137 = "comb.and"(%2130, %arg4) : (i1, i1) -> i1
        %2138 = "comb.mux"(%2137, %2048, %2135) : (i1, i3, i3) -> i3
        %2139 = "comb.xor"(%2137, %2046) : (i1, i1) -> i1
        %2140 = "comb.mux"(%arg3, %2052, %2138) : (i1, i3, i3) -> i3
        %2141 = "comb.xor"(%arg7, %2046) : (i1, i1) -> i1
        %2142 = "comb.and"(%2119, %2141) : (i1, i1) -> i1
        %2143 = "comb.mux"(%2142, %2059, %2140) : (i1, i3, i3) -> i3
        %2144 = "comb.xor"(%2142, %2046) : (i1, i1) -> i1
        %2145 = "comb.and"(%2144, %2101, %2139, %2136, %2128, %2125, %2122, %2114, %2111, %2100) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2146 = "comb.and"(%2058) : (i1) -> i1
        "fsm.return"(%2146) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %1942 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1943 = "hw.constant"() <{value = true}> : () -> i1
        %1944 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1945 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1946 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1947 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1948 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1949 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1950 = "hw.constant"() <{value = true}> : () -> i1
        %1951 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1952 = "comb.xor"(%arg1, %1950) : (i1, i1) -> i1
        %1953 = "seq.initial"() ({
          %2044 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%2044) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1954 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1955 = "comb.icmp"(%2040, %1954) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1956 = "seq.compreg"(%2040, %arg0, %1952, %1951, %1953) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1957 = "comb.icmp"(%1956, %1949) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1958 = "comb.and"(%1957, %arg2) : (i1, i1) -> i1
        %1959 = "comb.icmp"(%1956, %1948) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1960 = "comb.icmp"(%1956, %1947) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1961 = "comb.icmp"(%1956, %1946) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1962 = "comb.icmp"(%1956, %1946) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1963 = "comb.icmp"(%2040, %1946) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1964 = "comb.and"(%1962, %1963) : (i1, i1) -> i1
        %1965 = "comb.icmp"(%1956, %1947) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1966 = "comb.icmp"(%2040, %1947) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1967 = "comb.and"(%1965, %1966) : (i1, i1) -> i1
        %1968 = "comb.and"(%1957, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1969 = "comb.and"(%1960, %arg6) : (i1, i1) -> i1
        %1970 = "comb.or"(%arg4, %arg5, %arg3, %1969) : (i1, i1, i1, i1) -> i1
        %1971 = "comb.or"(%1968, %1970) : (i1, i1) -> i1
        %1972 = "comb.xor"(%1970, %1943) : (i1, i1) -> i1
        %1973 = "comb.icmp"(%1956, %1949) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1974 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1975 = "comb.icmp"(%1956, %1948) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1976 = "comb.icmp"(%1956, %1944) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1977 = "comb.icmp"(%1956, %1947) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1978 = "comb.mux"(%1976, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1979 = "comb.mux"(%1976, %1947, %1949) : (i1, i3, i3) -> i3
        %1980 = "comb.icmp"(%1956, %1945) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1981 = "comb.xor"(%arg4, %1943) : (i1, i1) -> i1
        %1982 = "comb.and"(%1973, %1981) : (i1, i1) -> i1
        %1983 = "comb.xor"(%1973, %1943) : (i1, i1) -> i1
        %1984 = "comb.xor"(%1975, %1943) : (i1, i1) -> i1
        %1985 = "comb.xor"(%1976, %1943) : (i1, i1) -> i1
        %1986 = "comb.xor"(%1977, %1943) : (i1, i1) -> i1
        %1987 = "comb.and"(%1986, %1985, %1984, %1983, %1980) : (i1, i1, i1, i1, i1) -> i1
        %1988 = "comb.or"(%1987, %1982) : (i1, i1) -> i1
        %1989 = "comb.mux"(%1988, %arg5, %1978) : (i1, i1, i1) -> i1
        %1990 = "comb.mux"(%1988, %1946, %1979) : (i1, i3, i3) -> i3
        %1991 = "comb.xor"(%1982, %1943) : (i1, i1) -> i1
        %1992 = "comb.xor"(%1974, %1943) : (i1, i1) -> i1
        %1993 = "comb.or"(%1987, %1991, %1992) : (i1, i1, i1) -> i1
        %1994 = "comb.mux"(%1993, %1956, %1947) : (i1, i3, i3) -> i3
        %1995 = "comb.icmp"(%1956, %1946) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1996 = "comb.mux"(%1995, %1956, %1949) : (i1, i3, i3) -> i3
        %1997 = "comb.xor"(%1995, %1943) : (i1, i1) -> i1
        %1998 = "comb.xor"(%arg3, %1943) : (i1, i1) -> i1
        %1999 = "comb.and"(%1983, %1998) : (i1, i1) -> i1
        %2000 = "comb.and"(%1984, %1999) : (i1, i1) -> i1
        %2001 = "comb.and"(%1985, %2000) : (i1, i1) -> i1
        %2002 = "comb.and"(%1977, %2001) : (i1, i1) -> i1
        %2003 = "comb.and"(%1976, %2000) : (i1, i1) -> i1
        %2004 = "comb.or"(%2002, %2003) : (i1, i1) -> i1
        %2005 = "comb.and"(%1981, %2004) : (i1, i1) -> i1
        %2006 = "comb.and"(%2005, %arg5) : (i1, i1) -> i1
        %2007 = "comb.mux"(%2006, %1946, %1996) : (i1, i3, i3) -> i3
        %2008 = "comb.xor"(%2006, %1943) : (i1, i1) -> i1
        %2009 = "comb.and"(%2004, %arg4) : (i1, i1) -> i1
        %2010 = "comb.mux"(%2009, %1945, %2007) : (i1, i3, i3) -> i3
        %2011 = "comb.xor"(%2009, %1943) : (i1, i1) -> i1
        %2012 = "comb.concat"(%1942, %arg8) : (i2, i1) -> i3
        %2013 = "comb.and"(%1975, %1999) : (i1, i1) -> i1
        %2014 = "comb.and"(%1981, %2013) : (i1, i1) -> i1
        %2015 = "comb.xor"(%arg5, %1943) : (i1, i1) -> i1
        %2016 = "comb.and"(%2015, %2014) : (i1, i1) -> i1
        %2017 = "comb.and"(%arg7, %2016) : (i1, i1) -> i1
        %2018 = "comb.mux"(%2017, %2012, %2010) : (i1, i3, i3) -> i3
        %2019 = "comb.xor"(%2017, %1943) : (i1, i1) -> i1
        %2020 = "comb.and"(%2014, %arg5) : (i1, i1) -> i1
        %2021 = "comb.mux"(%2020, %1946, %2018) : (i1, i3, i3) -> i3
        %2022 = "comb.xor"(%2020, %1943) : (i1, i1) -> i1
        %2023 = "comb.and"(%2013, %arg4) : (i1, i1) -> i1
        %2024 = "comb.mux"(%2023, %1945, %2021) : (i1, i3, i3) -> i3
        %2025 = "comb.xor"(%2023, %1943) : (i1, i1) -> i1
        %2026 = "comb.mux"(%1989, %1990, %1994) : (i1, i3, i3) -> i3
        %2027 = "comb.and"(%1973, %1998) : (i1, i1) -> i1
        %2028 = "comb.and"(%2015, %2005) : (i1, i1) -> i1
        %2029 = "comb.and"(%1981, %2027) : (i1, i1) -> i1
        %2030 = "comb.and"(%1980, %1986, %2001) : (i1, i1, i1) -> i1
        %2031 = "comb.or"(%2028, %2029, %2030) : (i1, i1, i1) -> i1
        %2032 = "comb.mux"(%2031, %2026, %2024) : (i1, i3, i3) -> i3
        %2033 = "comb.xor"(%2031, %1943) : (i1, i1) -> i1
        %2034 = "comb.and"(%2027, %arg4) : (i1, i1) -> i1
        %2035 = "comb.mux"(%2034, %1945, %2032) : (i1, i3, i3) -> i3
        %2036 = "comb.xor"(%2034, %1943) : (i1, i1) -> i1
        %2037 = "comb.mux"(%arg3, %1949, %2035) : (i1, i3, i3) -> i3
        %2038 = "comb.xor"(%arg7, %1943) : (i1, i1) -> i1
        %2039 = "comb.and"(%2016, %2038) : (i1, i1) -> i1
        %2040 = "comb.mux"(%2039, %1956, %2037) : (i1, i3, i3) -> i3
        %2041 = "comb.xor"(%2039, %1943) : (i1, i1) -> i1
        %2042 = "comb.and"(%2041, %1998, %2036, %2033, %2025, %2022, %2019, %2011, %2008, %1997) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %2043 = "comb.and"(%1955) : (i1) -> i1
        "fsm.return"(%2043) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %1839 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1840 = "hw.constant"() <{value = true}> : () -> i1
        %1841 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1842 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1843 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1844 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1845 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1846 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1847 = "hw.constant"() <{value = true}> : () -> i1
        %1848 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1849 = "comb.xor"(%arg1, %1847) : (i1, i1) -> i1
        %1850 = "seq.initial"() ({
          %1941 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1941) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1851 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1852 = "comb.icmp"(%1937, %1851) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1853 = "seq.compreg"(%1937, %arg0, %1849, %1848, %1850) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1854 = "comb.icmp"(%1853, %1846) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1855 = "comb.and"(%1854, %arg2) : (i1, i1) -> i1
        %1856 = "comb.icmp"(%1853, %1845) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1857 = "comb.icmp"(%1853, %1844) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1858 = "comb.icmp"(%1853, %1843) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1859 = "comb.icmp"(%1853, %1843) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1860 = "comb.icmp"(%1937, %1843) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1861 = "comb.and"(%1859, %1860) : (i1, i1) -> i1
        %1862 = "comb.icmp"(%1853, %1844) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1863 = "comb.icmp"(%1937, %1844) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1864 = "comb.and"(%1862, %1863) : (i1, i1) -> i1
        %1865 = "comb.and"(%1854, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1866 = "comb.and"(%1857, %arg6) : (i1, i1) -> i1
        %1867 = "comb.or"(%arg4, %arg5, %arg3, %1866) : (i1, i1, i1, i1) -> i1
        %1868 = "comb.or"(%1865, %1867) : (i1, i1) -> i1
        %1869 = "comb.xor"(%1867, %1840) : (i1, i1) -> i1
        %1870 = "comb.icmp"(%1853, %1846) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1871 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1872 = "comb.icmp"(%1853, %1845) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1873 = "comb.icmp"(%1853, %1841) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1874 = "comb.icmp"(%1853, %1844) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1875 = "comb.mux"(%1873, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1876 = "comb.mux"(%1873, %1844, %1846) : (i1, i3, i3) -> i3
        %1877 = "comb.icmp"(%1853, %1842) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1878 = "comb.xor"(%arg4, %1840) : (i1, i1) -> i1
        %1879 = "comb.and"(%1870, %1878) : (i1, i1) -> i1
        %1880 = "comb.xor"(%1870, %1840) : (i1, i1) -> i1
        %1881 = "comb.xor"(%1872, %1840) : (i1, i1) -> i1
        %1882 = "comb.xor"(%1873, %1840) : (i1, i1) -> i1
        %1883 = "comb.xor"(%1874, %1840) : (i1, i1) -> i1
        %1884 = "comb.and"(%1883, %1882, %1881, %1880, %1877) : (i1, i1, i1, i1, i1) -> i1
        %1885 = "comb.or"(%1884, %1879) : (i1, i1) -> i1
        %1886 = "comb.mux"(%1885, %arg5, %1875) : (i1, i1, i1) -> i1
        %1887 = "comb.mux"(%1885, %1843, %1876) : (i1, i3, i3) -> i3
        %1888 = "comb.xor"(%1879, %1840) : (i1, i1) -> i1
        %1889 = "comb.xor"(%1871, %1840) : (i1, i1) -> i1
        %1890 = "comb.or"(%1884, %1888, %1889) : (i1, i1, i1) -> i1
        %1891 = "comb.mux"(%1890, %1853, %1844) : (i1, i3, i3) -> i3
        %1892 = "comb.icmp"(%1853, %1843) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1893 = "comb.mux"(%1892, %1853, %1846) : (i1, i3, i3) -> i3
        %1894 = "comb.xor"(%1892, %1840) : (i1, i1) -> i1
        %1895 = "comb.xor"(%arg3, %1840) : (i1, i1) -> i1
        %1896 = "comb.and"(%1880, %1895) : (i1, i1) -> i1
        %1897 = "comb.and"(%1881, %1896) : (i1, i1) -> i1
        %1898 = "comb.and"(%1882, %1897) : (i1, i1) -> i1
        %1899 = "comb.and"(%1874, %1898) : (i1, i1) -> i1
        %1900 = "comb.and"(%1873, %1897) : (i1, i1) -> i1
        %1901 = "comb.or"(%1899, %1900) : (i1, i1) -> i1
        %1902 = "comb.and"(%1878, %1901) : (i1, i1) -> i1
        %1903 = "comb.and"(%1902, %arg5) : (i1, i1) -> i1
        %1904 = "comb.mux"(%1903, %1843, %1893) : (i1, i3, i3) -> i3
        %1905 = "comb.xor"(%1903, %1840) : (i1, i1) -> i1
        %1906 = "comb.and"(%1901, %arg4) : (i1, i1) -> i1
        %1907 = "comb.mux"(%1906, %1842, %1904) : (i1, i3, i3) -> i3
        %1908 = "comb.xor"(%1906, %1840) : (i1, i1) -> i1
        %1909 = "comb.concat"(%1839, %arg8) : (i2, i1) -> i3
        %1910 = "comb.and"(%1872, %1896) : (i1, i1) -> i1
        %1911 = "comb.and"(%1878, %1910) : (i1, i1) -> i1
        %1912 = "comb.xor"(%arg5, %1840) : (i1, i1) -> i1
        %1913 = "comb.and"(%1912, %1911) : (i1, i1) -> i1
        %1914 = "comb.and"(%arg7, %1913) : (i1, i1) -> i1
        %1915 = "comb.mux"(%1914, %1909, %1907) : (i1, i3, i3) -> i3
        %1916 = "comb.xor"(%1914, %1840) : (i1, i1) -> i1
        %1917 = "comb.and"(%1911, %arg5) : (i1, i1) -> i1
        %1918 = "comb.mux"(%1917, %1843, %1915) : (i1, i3, i3) -> i3
        %1919 = "comb.xor"(%1917, %1840) : (i1, i1) -> i1
        %1920 = "comb.and"(%1910, %arg4) : (i1, i1) -> i1
        %1921 = "comb.mux"(%1920, %1842, %1918) : (i1, i3, i3) -> i3
        %1922 = "comb.xor"(%1920, %1840) : (i1, i1) -> i1
        %1923 = "comb.mux"(%1886, %1887, %1891) : (i1, i3, i3) -> i3
        %1924 = "comb.and"(%1870, %1895) : (i1, i1) -> i1
        %1925 = "comb.and"(%1912, %1902) : (i1, i1) -> i1
        %1926 = "comb.and"(%1878, %1924) : (i1, i1) -> i1
        %1927 = "comb.and"(%1877, %1883, %1898) : (i1, i1, i1) -> i1
        %1928 = "comb.or"(%1925, %1926, %1927) : (i1, i1, i1) -> i1
        %1929 = "comb.mux"(%1928, %1923, %1921) : (i1, i3, i3) -> i3
        %1930 = "comb.xor"(%1928, %1840) : (i1, i1) -> i1
        %1931 = "comb.and"(%1924, %arg4) : (i1, i1) -> i1
        %1932 = "comb.mux"(%1931, %1842, %1929) : (i1, i3, i3) -> i3
        %1933 = "comb.xor"(%1931, %1840) : (i1, i1) -> i1
        %1934 = "comb.mux"(%arg3, %1846, %1932) : (i1, i3, i3) -> i3
        %1935 = "comb.xor"(%arg7, %1840) : (i1, i1) -> i1
        %1936 = "comb.and"(%1913, %1935) : (i1, i1) -> i1
        %1937 = "comb.mux"(%1936, %1853, %1934) : (i1, i3, i3) -> i3
        %1938 = "comb.xor"(%1936, %1840) : (i1, i1) -> i1
        %1939 = "comb.and"(%1938, %1895, %1933, %1930, %1922, %1919, %1916, %1908, %1905, %1894) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1940 = "comb.and"(%1852) : (i1) -> i1
        "fsm.return"(%1940) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %1736 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1737 = "hw.constant"() <{value = true}> : () -> i1
        %1738 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1739 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1740 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1741 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1742 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1743 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1744 = "hw.constant"() <{value = true}> : () -> i1
        %1745 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1746 = "comb.xor"(%arg1, %1744) : (i1, i1) -> i1
        %1747 = "seq.initial"() ({
          %1838 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1838) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1748 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1749 = "comb.icmp"(%1834, %1748) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1750 = "seq.compreg"(%1834, %arg0, %1746, %1745, %1747) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1751 = "comb.icmp"(%1750, %1743) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1752 = "comb.and"(%1751, %arg2) : (i1, i1) -> i1
        %1753 = "comb.icmp"(%1750, %1742) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1754 = "comb.icmp"(%1750, %1741) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1755 = "comb.icmp"(%1750, %1740) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1756 = "comb.icmp"(%1750, %1740) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1757 = "comb.icmp"(%1834, %1740) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1758 = "comb.and"(%1756, %1757) : (i1, i1) -> i1
        %1759 = "comb.icmp"(%1750, %1741) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1760 = "comb.icmp"(%1834, %1741) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1761 = "comb.and"(%1759, %1760) : (i1, i1) -> i1
        %1762 = "comb.and"(%1751, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1763 = "comb.and"(%1754, %arg6) : (i1, i1) -> i1
        %1764 = "comb.or"(%arg4, %arg5, %arg3, %1763) : (i1, i1, i1, i1) -> i1
        %1765 = "comb.or"(%1762, %1764) : (i1, i1) -> i1
        %1766 = "comb.xor"(%1764, %1737) : (i1, i1) -> i1
        %1767 = "comb.icmp"(%1750, %1743) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1768 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1769 = "comb.icmp"(%1750, %1742) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1770 = "comb.icmp"(%1750, %1738) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1771 = "comb.icmp"(%1750, %1741) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1772 = "comb.mux"(%1770, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1773 = "comb.mux"(%1770, %1741, %1743) : (i1, i3, i3) -> i3
        %1774 = "comb.icmp"(%1750, %1739) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1775 = "comb.xor"(%arg4, %1737) : (i1, i1) -> i1
        %1776 = "comb.and"(%1767, %1775) : (i1, i1) -> i1
        %1777 = "comb.xor"(%1767, %1737) : (i1, i1) -> i1
        %1778 = "comb.xor"(%1769, %1737) : (i1, i1) -> i1
        %1779 = "comb.xor"(%1770, %1737) : (i1, i1) -> i1
        %1780 = "comb.xor"(%1771, %1737) : (i1, i1) -> i1
        %1781 = "comb.and"(%1780, %1779, %1778, %1777, %1774) : (i1, i1, i1, i1, i1) -> i1
        %1782 = "comb.or"(%1781, %1776) : (i1, i1) -> i1
        %1783 = "comb.mux"(%1782, %arg5, %1772) : (i1, i1, i1) -> i1
        %1784 = "comb.mux"(%1782, %1740, %1773) : (i1, i3, i3) -> i3
        %1785 = "comb.xor"(%1776, %1737) : (i1, i1) -> i1
        %1786 = "comb.xor"(%1768, %1737) : (i1, i1) -> i1
        %1787 = "comb.or"(%1781, %1785, %1786) : (i1, i1, i1) -> i1
        %1788 = "comb.mux"(%1787, %1750, %1741) : (i1, i3, i3) -> i3
        %1789 = "comb.icmp"(%1750, %1740) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1790 = "comb.mux"(%1789, %1750, %1743) : (i1, i3, i3) -> i3
        %1791 = "comb.xor"(%1789, %1737) : (i1, i1) -> i1
        %1792 = "comb.xor"(%arg3, %1737) : (i1, i1) -> i1
        %1793 = "comb.and"(%1777, %1792) : (i1, i1) -> i1
        %1794 = "comb.and"(%1778, %1793) : (i1, i1) -> i1
        %1795 = "comb.and"(%1779, %1794) : (i1, i1) -> i1
        %1796 = "comb.and"(%1771, %1795) : (i1, i1) -> i1
        %1797 = "comb.and"(%1770, %1794) : (i1, i1) -> i1
        %1798 = "comb.or"(%1796, %1797) : (i1, i1) -> i1
        %1799 = "comb.and"(%1775, %1798) : (i1, i1) -> i1
        %1800 = "comb.and"(%1799, %arg5) : (i1, i1) -> i1
        %1801 = "comb.mux"(%1800, %1740, %1790) : (i1, i3, i3) -> i3
        %1802 = "comb.xor"(%1800, %1737) : (i1, i1) -> i1
        %1803 = "comb.and"(%1798, %arg4) : (i1, i1) -> i1
        %1804 = "comb.mux"(%1803, %1739, %1801) : (i1, i3, i3) -> i3
        %1805 = "comb.xor"(%1803, %1737) : (i1, i1) -> i1
        %1806 = "comb.concat"(%1736, %arg8) : (i2, i1) -> i3
        %1807 = "comb.and"(%1769, %1793) : (i1, i1) -> i1
        %1808 = "comb.and"(%1775, %1807) : (i1, i1) -> i1
        %1809 = "comb.xor"(%arg5, %1737) : (i1, i1) -> i1
        %1810 = "comb.and"(%1809, %1808) : (i1, i1) -> i1
        %1811 = "comb.and"(%arg7, %1810) : (i1, i1) -> i1
        %1812 = "comb.mux"(%1811, %1806, %1804) : (i1, i3, i3) -> i3
        %1813 = "comb.xor"(%1811, %1737) : (i1, i1) -> i1
        %1814 = "comb.and"(%1808, %arg5) : (i1, i1) -> i1
        %1815 = "comb.mux"(%1814, %1740, %1812) : (i1, i3, i3) -> i3
        %1816 = "comb.xor"(%1814, %1737) : (i1, i1) -> i1
        %1817 = "comb.and"(%1807, %arg4) : (i1, i1) -> i1
        %1818 = "comb.mux"(%1817, %1739, %1815) : (i1, i3, i3) -> i3
        %1819 = "comb.xor"(%1817, %1737) : (i1, i1) -> i1
        %1820 = "comb.mux"(%1783, %1784, %1788) : (i1, i3, i3) -> i3
        %1821 = "comb.and"(%1767, %1792) : (i1, i1) -> i1
        %1822 = "comb.and"(%1809, %1799) : (i1, i1) -> i1
        %1823 = "comb.and"(%1775, %1821) : (i1, i1) -> i1
        %1824 = "comb.and"(%1774, %1780, %1795) : (i1, i1, i1) -> i1
        %1825 = "comb.or"(%1822, %1823, %1824) : (i1, i1, i1) -> i1
        %1826 = "comb.mux"(%1825, %1820, %1818) : (i1, i3, i3) -> i3
        %1827 = "comb.xor"(%1825, %1737) : (i1, i1) -> i1
        %1828 = "comb.and"(%1821, %arg4) : (i1, i1) -> i1
        %1829 = "comb.mux"(%1828, %1739, %1826) : (i1, i3, i3) -> i3
        %1830 = "comb.xor"(%1828, %1737) : (i1, i1) -> i1
        %1831 = "comb.mux"(%arg3, %1743, %1829) : (i1, i3, i3) -> i3
        %1832 = "comb.xor"(%arg7, %1737) : (i1, i1) -> i1
        %1833 = "comb.and"(%1810, %1832) : (i1, i1) -> i1
        %1834 = "comb.mux"(%1833, %1750, %1831) : (i1, i3, i3) -> i3
        %1835 = "comb.xor"(%1833, %1737) : (i1, i1) -> i1
        %1836 = "comb.and"(%1835, %1792, %1830, %1827, %1819, %1816, %1813, %1805, %1802, %1791) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1837 = "comb.and"(%1749) : (i1) -> i1
        "fsm.return"(%1837) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_1"}> ({
      %1694 = "hw.constant"() <{value = 1 : i2}> : () -> i2
      %1695 = "hw.constant"() <{value = true}> : () -> i1
      %1696 = "hw.constant"() <{value = -4 : i3}> : () -> i3
      %1697 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %1698 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %1699 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %1700 = "hw.constant"() <{value = 1 : i3}> : () -> i3
      %1701 = "hw.constant"() <{value = false}> : () -> i1
      %1702 = "hw.constant"() <{value = true}> : () -> i1
      %1703 = "hw.constant"() <{value = false}> : () -> i1
      %1704 = "hw.constant"() <{value = false}> : () -> i1
      %1705 = "hw.constant"() <{value = false}> : () -> i1
      %1706 = "comb.or"(%arg4, %arg5, %arg3, %1705) : (i1, i1, i1, i1) -> i1
      %1707 = "comb.xor"(%1706, %1695) : (i1, i1) -> i1
      %1708 = "comb.xor"(%arg4, %1695) : (i1, i1) -> i1
      %1709 = "hw.constant"() <{value = true}> : () -> i1
      %1710 = "comb.xor"(%arg3, %1695) : (i1, i1) -> i1
      %1711 = "hw.constant"() <{value = true}> : () -> i1
      %1712 = "hw.constant"() <{value = true}> : () -> i1
      %1713 = "comb.concat"(%1694, %arg8) : (i2, i1) -> i3
      %1714 = "comb.and"(%1708, %1710) : (i1, i1) -> i1
      %1715 = "comb.xor"(%arg5, %1695) : (i1, i1) -> i1
      %1716 = "comb.and"(%1715, %1714) : (i1, i1) -> i1
      %1717 = "comb.and"(%arg7, %1716) : (i1, i1) -> i1
      %1718 = "comb.mux"(%1717, %1713, %1699) : (i1, i3, i3) -> i3
      %1719 = "comb.xor"(%1717, %1695) : (i1, i1) -> i1
      %1720 = "comb.and"(%1714, %arg5) : (i1, i1) -> i1
      %1721 = "comb.mux"(%1720, %1697, %1718) : (i1, i3, i3) -> i3
      %1722 = "comb.xor"(%1720, %1695) : (i1, i1) -> i1
      %1723 = "comb.and"(%1710, %arg4) : (i1, i1) -> i1
      %1724 = "comb.mux"(%1723, %1696, %1721) : (i1, i3, i3) -> i3
      %1725 = "comb.xor"(%1723, %1695) : (i1, i1) -> i1
      %1726 = "hw.constant"() <{value = true}> : () -> i1
      %1727 = "hw.constant"() <{value = true}> : () -> i1
      %1728 = "comb.mux"(%arg3, %1699, %1724) : (i1, i3, i3) -> i3
      %1729 = "comb.xor"(%arg7, %1695) : (i1, i1) -> i1
      %1730 = "comb.and"(%1716, %1729) : (i1, i1) -> i1
      %1731 = "comb.mux"(%1730, %1700, %1728) : (i1, i3, i3) -> i3
      %1732 = "comb.xor"(%1730, %1695) : (i1, i1) -> i1
      %1733 = "comb.and"(%1732, %1710, %1725, %1722, %1719, %1727, %1726, %1711, %1712, %1709) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      %1734 = "comb.icmp"(%1731, %1697) <{predicate = 0 : i64}> : (i3, i3) -> i1
      %1735 = "comb.icmp"(%1731, %1698) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%1701, %1702, %1703, %1704, %1706, %1707, %1735, %1734, %1733) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %1591 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1592 = "hw.constant"() <{value = true}> : () -> i1
        %1593 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1594 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1595 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1596 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1597 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1598 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1599 = "hw.constant"() <{value = true}> : () -> i1
        %1600 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1601 = "comb.xor"(%arg1, %1599) : (i1, i1) -> i1
        %1602 = "seq.initial"() ({
          %1693 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1693) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1603 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %1604 = "comb.icmp"(%1689, %1603) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1605 = "seq.compreg"(%1689, %arg0, %1601, %1600, %1602) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1606 = "comb.icmp"(%1605, %1598) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1607 = "comb.and"(%1606, %arg2) : (i1, i1) -> i1
        %1608 = "comb.icmp"(%1605, %1597) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1609 = "comb.icmp"(%1605, %1596) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1610 = "comb.icmp"(%1605, %1595) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1611 = "comb.icmp"(%1605, %1595) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1612 = "comb.icmp"(%1689, %1595) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1613 = "comb.and"(%1611, %1612) : (i1, i1) -> i1
        %1614 = "comb.icmp"(%1605, %1596) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1615 = "comb.icmp"(%1689, %1596) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1616 = "comb.and"(%1614, %1615) : (i1, i1) -> i1
        %1617 = "comb.and"(%1606, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1618 = "comb.and"(%1609, %arg6) : (i1, i1) -> i1
        %1619 = "comb.or"(%arg4, %arg5, %arg3, %1618) : (i1, i1, i1, i1) -> i1
        %1620 = "comb.or"(%1617, %1619) : (i1, i1) -> i1
        %1621 = "comb.xor"(%1619, %1592) : (i1, i1) -> i1
        %1622 = "comb.icmp"(%1605, %1598) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1623 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1624 = "comb.icmp"(%1605, %1597) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1625 = "comb.icmp"(%1605, %1593) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1626 = "comb.icmp"(%1605, %1596) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1627 = "comb.mux"(%1625, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1628 = "comb.mux"(%1625, %1596, %1598) : (i1, i3, i3) -> i3
        %1629 = "comb.icmp"(%1605, %1594) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1630 = "comb.xor"(%arg4, %1592) : (i1, i1) -> i1
        %1631 = "comb.and"(%1622, %1630) : (i1, i1) -> i1
        %1632 = "comb.xor"(%1622, %1592) : (i1, i1) -> i1
        %1633 = "comb.xor"(%1624, %1592) : (i1, i1) -> i1
        %1634 = "comb.xor"(%1625, %1592) : (i1, i1) -> i1
        %1635 = "comb.xor"(%1626, %1592) : (i1, i1) -> i1
        %1636 = "comb.and"(%1635, %1634, %1633, %1632, %1629) : (i1, i1, i1, i1, i1) -> i1
        %1637 = "comb.or"(%1636, %1631) : (i1, i1) -> i1
        %1638 = "comb.mux"(%1637, %arg5, %1627) : (i1, i1, i1) -> i1
        %1639 = "comb.mux"(%1637, %1595, %1628) : (i1, i3, i3) -> i3
        %1640 = "comb.xor"(%1631, %1592) : (i1, i1) -> i1
        %1641 = "comb.xor"(%1623, %1592) : (i1, i1) -> i1
        %1642 = "comb.or"(%1636, %1640, %1641) : (i1, i1, i1) -> i1
        %1643 = "comb.mux"(%1642, %1605, %1596) : (i1, i3, i3) -> i3
        %1644 = "comb.icmp"(%1605, %1595) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1645 = "comb.mux"(%1644, %1605, %1598) : (i1, i3, i3) -> i3
        %1646 = "comb.xor"(%1644, %1592) : (i1, i1) -> i1
        %1647 = "comb.xor"(%arg3, %1592) : (i1, i1) -> i1
        %1648 = "comb.and"(%1632, %1647) : (i1, i1) -> i1
        %1649 = "comb.and"(%1633, %1648) : (i1, i1) -> i1
        %1650 = "comb.and"(%1634, %1649) : (i1, i1) -> i1
        %1651 = "comb.and"(%1626, %1650) : (i1, i1) -> i1
        %1652 = "comb.and"(%1625, %1649) : (i1, i1) -> i1
        %1653 = "comb.or"(%1651, %1652) : (i1, i1) -> i1
        %1654 = "comb.and"(%1630, %1653) : (i1, i1) -> i1
        %1655 = "comb.and"(%1654, %arg5) : (i1, i1) -> i1
        %1656 = "comb.mux"(%1655, %1595, %1645) : (i1, i3, i3) -> i3
        %1657 = "comb.xor"(%1655, %1592) : (i1, i1) -> i1
        %1658 = "comb.and"(%1653, %arg4) : (i1, i1) -> i1
        %1659 = "comb.mux"(%1658, %1594, %1656) : (i1, i3, i3) -> i3
        %1660 = "comb.xor"(%1658, %1592) : (i1, i1) -> i1
        %1661 = "comb.concat"(%1591, %arg8) : (i2, i1) -> i3
        %1662 = "comb.and"(%1624, %1648) : (i1, i1) -> i1
        %1663 = "comb.and"(%1630, %1662) : (i1, i1) -> i1
        %1664 = "comb.xor"(%arg5, %1592) : (i1, i1) -> i1
        %1665 = "comb.and"(%1664, %1663) : (i1, i1) -> i1
        %1666 = "comb.and"(%arg7, %1665) : (i1, i1) -> i1
        %1667 = "comb.mux"(%1666, %1661, %1659) : (i1, i3, i3) -> i3
        %1668 = "comb.xor"(%1666, %1592) : (i1, i1) -> i1
        %1669 = "comb.and"(%1663, %arg5) : (i1, i1) -> i1
        %1670 = "comb.mux"(%1669, %1595, %1667) : (i1, i3, i3) -> i3
        %1671 = "comb.xor"(%1669, %1592) : (i1, i1) -> i1
        %1672 = "comb.and"(%1662, %arg4) : (i1, i1) -> i1
        %1673 = "comb.mux"(%1672, %1594, %1670) : (i1, i3, i3) -> i3
        %1674 = "comb.xor"(%1672, %1592) : (i1, i1) -> i1
        %1675 = "comb.mux"(%1638, %1639, %1643) : (i1, i3, i3) -> i3
        %1676 = "comb.and"(%1622, %1647) : (i1, i1) -> i1
        %1677 = "comb.and"(%1664, %1654) : (i1, i1) -> i1
        %1678 = "comb.and"(%1630, %1676) : (i1, i1) -> i1
        %1679 = "comb.and"(%1629, %1635, %1650) : (i1, i1, i1) -> i1
        %1680 = "comb.or"(%1677, %1678, %1679) : (i1, i1, i1) -> i1
        %1681 = "comb.mux"(%1680, %1675, %1673) : (i1, i3, i3) -> i3
        %1682 = "comb.xor"(%1680, %1592) : (i1, i1) -> i1
        %1683 = "comb.and"(%1676, %arg4) : (i1, i1) -> i1
        %1684 = "comb.mux"(%1683, %1594, %1681) : (i1, i3, i3) -> i3
        %1685 = "comb.xor"(%1683, %1592) : (i1, i1) -> i1
        %1686 = "comb.mux"(%arg3, %1598, %1684) : (i1, i3, i3) -> i3
        %1687 = "comb.xor"(%arg7, %1592) : (i1, i1) -> i1
        %1688 = "comb.and"(%1665, %1687) : (i1, i1) -> i1
        %1689 = "comb.mux"(%1688, %1605, %1686) : (i1, i3, i3) -> i3
        %1690 = "comb.xor"(%1688, %1592) : (i1, i1) -> i1
        %1691 = "comb.and"(%1690, %1647, %1685, %1682, %1674, %1671, %1668, %1660, %1657, %1646) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1692 = "comb.and"(%1604) : (i1) -> i1
        "fsm.return"(%1692) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %1488 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1489 = "hw.constant"() <{value = true}> : () -> i1
        %1490 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1491 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1492 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1493 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1494 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1495 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1496 = "hw.constant"() <{value = true}> : () -> i1
        %1497 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1498 = "comb.xor"(%arg1, %1496) : (i1, i1) -> i1
        %1499 = "seq.initial"() ({
          %1590 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1590) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1500 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %1501 = "comb.icmp"(%1586, %1500) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1502 = "seq.compreg"(%1586, %arg0, %1498, %1497, %1499) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1503 = "comb.icmp"(%1502, %1495) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1504 = "comb.and"(%1503, %arg2) : (i1, i1) -> i1
        %1505 = "comb.icmp"(%1502, %1494) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1506 = "comb.icmp"(%1502, %1493) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1507 = "comb.icmp"(%1502, %1492) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1508 = "comb.icmp"(%1502, %1492) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1509 = "comb.icmp"(%1586, %1492) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1510 = "comb.and"(%1508, %1509) : (i1, i1) -> i1
        %1511 = "comb.icmp"(%1502, %1493) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1512 = "comb.icmp"(%1586, %1493) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1513 = "comb.and"(%1511, %1512) : (i1, i1) -> i1
        %1514 = "comb.and"(%1503, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1515 = "comb.and"(%1506, %arg6) : (i1, i1) -> i1
        %1516 = "comb.or"(%arg4, %arg5, %arg3, %1515) : (i1, i1, i1, i1) -> i1
        %1517 = "comb.or"(%1514, %1516) : (i1, i1) -> i1
        %1518 = "comb.xor"(%1516, %1489) : (i1, i1) -> i1
        %1519 = "comb.icmp"(%1502, %1495) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1520 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1521 = "comb.icmp"(%1502, %1494) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1522 = "comb.icmp"(%1502, %1490) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1523 = "comb.icmp"(%1502, %1493) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1524 = "comb.mux"(%1522, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1525 = "comb.mux"(%1522, %1493, %1495) : (i1, i3, i3) -> i3
        %1526 = "comb.icmp"(%1502, %1491) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1527 = "comb.xor"(%arg4, %1489) : (i1, i1) -> i1
        %1528 = "comb.and"(%1519, %1527) : (i1, i1) -> i1
        %1529 = "comb.xor"(%1519, %1489) : (i1, i1) -> i1
        %1530 = "comb.xor"(%1521, %1489) : (i1, i1) -> i1
        %1531 = "comb.xor"(%1522, %1489) : (i1, i1) -> i1
        %1532 = "comb.xor"(%1523, %1489) : (i1, i1) -> i1
        %1533 = "comb.and"(%1532, %1531, %1530, %1529, %1526) : (i1, i1, i1, i1, i1) -> i1
        %1534 = "comb.or"(%1533, %1528) : (i1, i1) -> i1
        %1535 = "comb.mux"(%1534, %arg5, %1524) : (i1, i1, i1) -> i1
        %1536 = "comb.mux"(%1534, %1492, %1525) : (i1, i3, i3) -> i3
        %1537 = "comb.xor"(%1528, %1489) : (i1, i1) -> i1
        %1538 = "comb.xor"(%1520, %1489) : (i1, i1) -> i1
        %1539 = "comb.or"(%1533, %1537, %1538) : (i1, i1, i1) -> i1
        %1540 = "comb.mux"(%1539, %1502, %1493) : (i1, i3, i3) -> i3
        %1541 = "comb.icmp"(%1502, %1492) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1542 = "comb.mux"(%1541, %1502, %1495) : (i1, i3, i3) -> i3
        %1543 = "comb.xor"(%1541, %1489) : (i1, i1) -> i1
        %1544 = "comb.xor"(%arg3, %1489) : (i1, i1) -> i1
        %1545 = "comb.and"(%1529, %1544) : (i1, i1) -> i1
        %1546 = "comb.and"(%1530, %1545) : (i1, i1) -> i1
        %1547 = "comb.and"(%1531, %1546) : (i1, i1) -> i1
        %1548 = "comb.and"(%1523, %1547) : (i1, i1) -> i1
        %1549 = "comb.and"(%1522, %1546) : (i1, i1) -> i1
        %1550 = "comb.or"(%1548, %1549) : (i1, i1) -> i1
        %1551 = "comb.and"(%1527, %1550) : (i1, i1) -> i1
        %1552 = "comb.and"(%1551, %arg5) : (i1, i1) -> i1
        %1553 = "comb.mux"(%1552, %1492, %1542) : (i1, i3, i3) -> i3
        %1554 = "comb.xor"(%1552, %1489) : (i1, i1) -> i1
        %1555 = "comb.and"(%1550, %arg4) : (i1, i1) -> i1
        %1556 = "comb.mux"(%1555, %1491, %1553) : (i1, i3, i3) -> i3
        %1557 = "comb.xor"(%1555, %1489) : (i1, i1) -> i1
        %1558 = "comb.concat"(%1488, %arg8) : (i2, i1) -> i3
        %1559 = "comb.and"(%1521, %1545) : (i1, i1) -> i1
        %1560 = "comb.and"(%1527, %1559) : (i1, i1) -> i1
        %1561 = "comb.xor"(%arg5, %1489) : (i1, i1) -> i1
        %1562 = "comb.and"(%1561, %1560) : (i1, i1) -> i1
        %1563 = "comb.and"(%arg7, %1562) : (i1, i1) -> i1
        %1564 = "comb.mux"(%1563, %1558, %1556) : (i1, i3, i3) -> i3
        %1565 = "comb.xor"(%1563, %1489) : (i1, i1) -> i1
        %1566 = "comb.and"(%1560, %arg5) : (i1, i1) -> i1
        %1567 = "comb.mux"(%1566, %1492, %1564) : (i1, i3, i3) -> i3
        %1568 = "comb.xor"(%1566, %1489) : (i1, i1) -> i1
        %1569 = "comb.and"(%1559, %arg4) : (i1, i1) -> i1
        %1570 = "comb.mux"(%1569, %1491, %1567) : (i1, i3, i3) -> i3
        %1571 = "comb.xor"(%1569, %1489) : (i1, i1) -> i1
        %1572 = "comb.mux"(%1535, %1536, %1540) : (i1, i3, i3) -> i3
        %1573 = "comb.and"(%1519, %1544) : (i1, i1) -> i1
        %1574 = "comb.and"(%1561, %1551) : (i1, i1) -> i1
        %1575 = "comb.and"(%1527, %1573) : (i1, i1) -> i1
        %1576 = "comb.and"(%1526, %1532, %1547) : (i1, i1, i1) -> i1
        %1577 = "comb.or"(%1574, %1575, %1576) : (i1, i1, i1) -> i1
        %1578 = "comb.mux"(%1577, %1572, %1570) : (i1, i3, i3) -> i3
        %1579 = "comb.xor"(%1577, %1489) : (i1, i1) -> i1
        %1580 = "comb.and"(%1573, %arg4) : (i1, i1) -> i1
        %1581 = "comb.mux"(%1580, %1491, %1578) : (i1, i3, i3) -> i3
        %1582 = "comb.xor"(%1580, %1489) : (i1, i1) -> i1
        %1583 = "comb.mux"(%arg3, %1495, %1581) : (i1, i3, i3) -> i3
        %1584 = "comb.xor"(%arg7, %1489) : (i1, i1) -> i1
        %1585 = "comb.and"(%1562, %1584) : (i1, i1) -> i1
        %1586 = "comb.mux"(%1585, %1502, %1583) : (i1, i3, i3) -> i3
        %1587 = "comb.xor"(%1585, %1489) : (i1, i1) -> i1
        %1588 = "comb.and"(%1587, %1544, %1582, %1579, %1571, %1568, %1565, %1557, %1554, %1543) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1589 = "comb.and"(%1501) : (i1) -> i1
        "fsm.return"(%1589) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %1385 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1386 = "hw.constant"() <{value = true}> : () -> i1
        %1387 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1388 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1389 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1390 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1391 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1392 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1393 = "hw.constant"() <{value = true}> : () -> i1
        %1394 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1395 = "comb.xor"(%arg1, %1393) : (i1, i1) -> i1
        %1396 = "seq.initial"() ({
          %1487 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1487) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1397 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1398 = "comb.icmp"(%1483, %1397) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1399 = "seq.compreg"(%1483, %arg0, %1395, %1394, %1396) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1400 = "comb.icmp"(%1399, %1392) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1401 = "comb.and"(%1400, %arg2) : (i1, i1) -> i1
        %1402 = "comb.icmp"(%1399, %1391) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1403 = "comb.icmp"(%1399, %1390) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1404 = "comb.icmp"(%1399, %1389) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1405 = "comb.icmp"(%1399, %1389) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1406 = "comb.icmp"(%1483, %1389) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1407 = "comb.and"(%1405, %1406) : (i1, i1) -> i1
        %1408 = "comb.icmp"(%1399, %1390) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1409 = "comb.icmp"(%1483, %1390) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1410 = "comb.and"(%1408, %1409) : (i1, i1) -> i1
        %1411 = "comb.and"(%1400, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1412 = "comb.and"(%1403, %arg6) : (i1, i1) -> i1
        %1413 = "comb.or"(%arg4, %arg5, %arg3, %1412) : (i1, i1, i1, i1) -> i1
        %1414 = "comb.or"(%1411, %1413) : (i1, i1) -> i1
        %1415 = "comb.xor"(%1413, %1386) : (i1, i1) -> i1
        %1416 = "comb.icmp"(%1399, %1392) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1417 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1418 = "comb.icmp"(%1399, %1391) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1419 = "comb.icmp"(%1399, %1387) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1420 = "comb.icmp"(%1399, %1390) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1421 = "comb.mux"(%1419, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1422 = "comb.mux"(%1419, %1390, %1392) : (i1, i3, i3) -> i3
        %1423 = "comb.icmp"(%1399, %1388) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1424 = "comb.xor"(%arg4, %1386) : (i1, i1) -> i1
        %1425 = "comb.and"(%1416, %1424) : (i1, i1) -> i1
        %1426 = "comb.xor"(%1416, %1386) : (i1, i1) -> i1
        %1427 = "comb.xor"(%1418, %1386) : (i1, i1) -> i1
        %1428 = "comb.xor"(%1419, %1386) : (i1, i1) -> i1
        %1429 = "comb.xor"(%1420, %1386) : (i1, i1) -> i1
        %1430 = "comb.and"(%1429, %1428, %1427, %1426, %1423) : (i1, i1, i1, i1, i1) -> i1
        %1431 = "comb.or"(%1430, %1425) : (i1, i1) -> i1
        %1432 = "comb.mux"(%1431, %arg5, %1421) : (i1, i1, i1) -> i1
        %1433 = "comb.mux"(%1431, %1389, %1422) : (i1, i3, i3) -> i3
        %1434 = "comb.xor"(%1425, %1386) : (i1, i1) -> i1
        %1435 = "comb.xor"(%1417, %1386) : (i1, i1) -> i1
        %1436 = "comb.or"(%1430, %1434, %1435) : (i1, i1, i1) -> i1
        %1437 = "comb.mux"(%1436, %1399, %1390) : (i1, i3, i3) -> i3
        %1438 = "comb.icmp"(%1399, %1389) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1439 = "comb.mux"(%1438, %1399, %1392) : (i1, i3, i3) -> i3
        %1440 = "comb.xor"(%1438, %1386) : (i1, i1) -> i1
        %1441 = "comb.xor"(%arg3, %1386) : (i1, i1) -> i1
        %1442 = "comb.and"(%1426, %1441) : (i1, i1) -> i1
        %1443 = "comb.and"(%1427, %1442) : (i1, i1) -> i1
        %1444 = "comb.and"(%1428, %1443) : (i1, i1) -> i1
        %1445 = "comb.and"(%1420, %1444) : (i1, i1) -> i1
        %1446 = "comb.and"(%1419, %1443) : (i1, i1) -> i1
        %1447 = "comb.or"(%1445, %1446) : (i1, i1) -> i1
        %1448 = "comb.and"(%1424, %1447) : (i1, i1) -> i1
        %1449 = "comb.and"(%1448, %arg5) : (i1, i1) -> i1
        %1450 = "comb.mux"(%1449, %1389, %1439) : (i1, i3, i3) -> i3
        %1451 = "comb.xor"(%1449, %1386) : (i1, i1) -> i1
        %1452 = "comb.and"(%1447, %arg4) : (i1, i1) -> i1
        %1453 = "comb.mux"(%1452, %1388, %1450) : (i1, i3, i3) -> i3
        %1454 = "comb.xor"(%1452, %1386) : (i1, i1) -> i1
        %1455 = "comb.concat"(%1385, %arg8) : (i2, i1) -> i3
        %1456 = "comb.and"(%1418, %1442) : (i1, i1) -> i1
        %1457 = "comb.and"(%1424, %1456) : (i1, i1) -> i1
        %1458 = "comb.xor"(%arg5, %1386) : (i1, i1) -> i1
        %1459 = "comb.and"(%1458, %1457) : (i1, i1) -> i1
        %1460 = "comb.and"(%arg7, %1459) : (i1, i1) -> i1
        %1461 = "comb.mux"(%1460, %1455, %1453) : (i1, i3, i3) -> i3
        %1462 = "comb.xor"(%1460, %1386) : (i1, i1) -> i1
        %1463 = "comb.and"(%1457, %arg5) : (i1, i1) -> i1
        %1464 = "comb.mux"(%1463, %1389, %1461) : (i1, i3, i3) -> i3
        %1465 = "comb.xor"(%1463, %1386) : (i1, i1) -> i1
        %1466 = "comb.and"(%1456, %arg4) : (i1, i1) -> i1
        %1467 = "comb.mux"(%1466, %1388, %1464) : (i1, i3, i3) -> i3
        %1468 = "comb.xor"(%1466, %1386) : (i1, i1) -> i1
        %1469 = "comb.mux"(%1432, %1433, %1437) : (i1, i3, i3) -> i3
        %1470 = "comb.and"(%1416, %1441) : (i1, i1) -> i1
        %1471 = "comb.and"(%1458, %1448) : (i1, i1) -> i1
        %1472 = "comb.and"(%1424, %1470) : (i1, i1) -> i1
        %1473 = "comb.and"(%1423, %1429, %1444) : (i1, i1, i1) -> i1
        %1474 = "comb.or"(%1471, %1472, %1473) : (i1, i1, i1) -> i1
        %1475 = "comb.mux"(%1474, %1469, %1467) : (i1, i3, i3) -> i3
        %1476 = "comb.xor"(%1474, %1386) : (i1, i1) -> i1
        %1477 = "comb.and"(%1470, %arg4) : (i1, i1) -> i1
        %1478 = "comb.mux"(%1477, %1388, %1475) : (i1, i3, i3) -> i3
        %1479 = "comb.xor"(%1477, %1386) : (i1, i1) -> i1
        %1480 = "comb.mux"(%arg3, %1392, %1478) : (i1, i3, i3) -> i3
        %1481 = "comb.xor"(%arg7, %1386) : (i1, i1) -> i1
        %1482 = "comb.and"(%1459, %1481) : (i1, i1) -> i1
        %1483 = "comb.mux"(%1482, %1399, %1480) : (i1, i3, i3) -> i3
        %1484 = "comb.xor"(%1482, %1386) : (i1, i1) -> i1
        %1485 = "comb.and"(%1484, %1441, %1479, %1476, %1468, %1465, %1462, %1454, %1451, %1440) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1486 = "comb.and"(%1398) : (i1) -> i1
        "fsm.return"(%1486) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %1282 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1283 = "hw.constant"() <{value = true}> : () -> i1
        %1284 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1285 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1286 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1287 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1288 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1289 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1290 = "hw.constant"() <{value = true}> : () -> i1
        %1291 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1292 = "comb.xor"(%arg1, %1290) : (i1, i1) -> i1
        %1293 = "seq.initial"() ({
          %1384 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1384) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1294 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1295 = "comb.icmp"(%1380, %1294) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1296 = "seq.compreg"(%1380, %arg0, %1292, %1291, %1293) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1297 = "comb.icmp"(%1296, %1289) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1298 = "comb.and"(%1297, %arg2) : (i1, i1) -> i1
        %1299 = "comb.icmp"(%1296, %1288) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1300 = "comb.icmp"(%1296, %1287) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1301 = "comb.icmp"(%1296, %1286) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1302 = "comb.icmp"(%1296, %1286) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1303 = "comb.icmp"(%1380, %1286) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1304 = "comb.and"(%1302, %1303) : (i1, i1) -> i1
        %1305 = "comb.icmp"(%1296, %1287) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1306 = "comb.icmp"(%1380, %1287) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1307 = "comb.and"(%1305, %1306) : (i1, i1) -> i1
        %1308 = "comb.and"(%1297, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1309 = "comb.and"(%1300, %arg6) : (i1, i1) -> i1
        %1310 = "comb.or"(%arg4, %arg5, %arg3, %1309) : (i1, i1, i1, i1) -> i1
        %1311 = "comb.or"(%1308, %1310) : (i1, i1) -> i1
        %1312 = "comb.xor"(%1310, %1283) : (i1, i1) -> i1
        %1313 = "comb.icmp"(%1296, %1289) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1314 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1315 = "comb.icmp"(%1296, %1288) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1316 = "comb.icmp"(%1296, %1284) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1317 = "comb.icmp"(%1296, %1287) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1318 = "comb.mux"(%1316, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1319 = "comb.mux"(%1316, %1287, %1289) : (i1, i3, i3) -> i3
        %1320 = "comb.icmp"(%1296, %1285) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1321 = "comb.xor"(%arg4, %1283) : (i1, i1) -> i1
        %1322 = "comb.and"(%1313, %1321) : (i1, i1) -> i1
        %1323 = "comb.xor"(%1313, %1283) : (i1, i1) -> i1
        %1324 = "comb.xor"(%1315, %1283) : (i1, i1) -> i1
        %1325 = "comb.xor"(%1316, %1283) : (i1, i1) -> i1
        %1326 = "comb.xor"(%1317, %1283) : (i1, i1) -> i1
        %1327 = "comb.and"(%1326, %1325, %1324, %1323, %1320) : (i1, i1, i1, i1, i1) -> i1
        %1328 = "comb.or"(%1327, %1322) : (i1, i1) -> i1
        %1329 = "comb.mux"(%1328, %arg5, %1318) : (i1, i1, i1) -> i1
        %1330 = "comb.mux"(%1328, %1286, %1319) : (i1, i3, i3) -> i3
        %1331 = "comb.xor"(%1322, %1283) : (i1, i1) -> i1
        %1332 = "comb.xor"(%1314, %1283) : (i1, i1) -> i1
        %1333 = "comb.or"(%1327, %1331, %1332) : (i1, i1, i1) -> i1
        %1334 = "comb.mux"(%1333, %1296, %1287) : (i1, i3, i3) -> i3
        %1335 = "comb.icmp"(%1296, %1286) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1336 = "comb.mux"(%1335, %1296, %1289) : (i1, i3, i3) -> i3
        %1337 = "comb.xor"(%1335, %1283) : (i1, i1) -> i1
        %1338 = "comb.xor"(%arg3, %1283) : (i1, i1) -> i1
        %1339 = "comb.and"(%1323, %1338) : (i1, i1) -> i1
        %1340 = "comb.and"(%1324, %1339) : (i1, i1) -> i1
        %1341 = "comb.and"(%1325, %1340) : (i1, i1) -> i1
        %1342 = "comb.and"(%1317, %1341) : (i1, i1) -> i1
        %1343 = "comb.and"(%1316, %1340) : (i1, i1) -> i1
        %1344 = "comb.or"(%1342, %1343) : (i1, i1) -> i1
        %1345 = "comb.and"(%1321, %1344) : (i1, i1) -> i1
        %1346 = "comb.and"(%1345, %arg5) : (i1, i1) -> i1
        %1347 = "comb.mux"(%1346, %1286, %1336) : (i1, i3, i3) -> i3
        %1348 = "comb.xor"(%1346, %1283) : (i1, i1) -> i1
        %1349 = "comb.and"(%1344, %arg4) : (i1, i1) -> i1
        %1350 = "comb.mux"(%1349, %1285, %1347) : (i1, i3, i3) -> i3
        %1351 = "comb.xor"(%1349, %1283) : (i1, i1) -> i1
        %1352 = "comb.concat"(%1282, %arg8) : (i2, i1) -> i3
        %1353 = "comb.and"(%1315, %1339) : (i1, i1) -> i1
        %1354 = "comb.and"(%1321, %1353) : (i1, i1) -> i1
        %1355 = "comb.xor"(%arg5, %1283) : (i1, i1) -> i1
        %1356 = "comb.and"(%1355, %1354) : (i1, i1) -> i1
        %1357 = "comb.and"(%arg7, %1356) : (i1, i1) -> i1
        %1358 = "comb.mux"(%1357, %1352, %1350) : (i1, i3, i3) -> i3
        %1359 = "comb.xor"(%1357, %1283) : (i1, i1) -> i1
        %1360 = "comb.and"(%1354, %arg5) : (i1, i1) -> i1
        %1361 = "comb.mux"(%1360, %1286, %1358) : (i1, i3, i3) -> i3
        %1362 = "comb.xor"(%1360, %1283) : (i1, i1) -> i1
        %1363 = "comb.and"(%1353, %arg4) : (i1, i1) -> i1
        %1364 = "comb.mux"(%1363, %1285, %1361) : (i1, i3, i3) -> i3
        %1365 = "comb.xor"(%1363, %1283) : (i1, i1) -> i1
        %1366 = "comb.mux"(%1329, %1330, %1334) : (i1, i3, i3) -> i3
        %1367 = "comb.and"(%1313, %1338) : (i1, i1) -> i1
        %1368 = "comb.and"(%1355, %1345) : (i1, i1) -> i1
        %1369 = "comb.and"(%1321, %1367) : (i1, i1) -> i1
        %1370 = "comb.and"(%1320, %1326, %1341) : (i1, i1, i1) -> i1
        %1371 = "comb.or"(%1368, %1369, %1370) : (i1, i1, i1) -> i1
        %1372 = "comb.mux"(%1371, %1366, %1364) : (i1, i3, i3) -> i3
        %1373 = "comb.xor"(%1371, %1283) : (i1, i1) -> i1
        %1374 = "comb.and"(%1367, %arg4) : (i1, i1) -> i1
        %1375 = "comb.mux"(%1374, %1285, %1372) : (i1, i3, i3) -> i3
        %1376 = "comb.xor"(%1374, %1283) : (i1, i1) -> i1
        %1377 = "comb.mux"(%arg3, %1289, %1375) : (i1, i3, i3) -> i3
        %1378 = "comb.xor"(%arg7, %1283) : (i1, i1) -> i1
        %1379 = "comb.and"(%1356, %1378) : (i1, i1) -> i1
        %1380 = "comb.mux"(%1379, %1296, %1377) : (i1, i3, i3) -> i3
        %1381 = "comb.xor"(%1379, %1283) : (i1, i1) -> i1
        %1382 = "comb.and"(%1381, %1338, %1376, %1373, %1365, %1362, %1359, %1351, %1348, %1337) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1383 = "comb.and"(%1295) : (i1) -> i1
        "fsm.return"(%1383) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %1179 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1180 = "hw.constant"() <{value = true}> : () -> i1
        %1181 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1182 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1183 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1184 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1185 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1186 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1187 = "hw.constant"() <{value = true}> : () -> i1
        %1188 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1189 = "comb.xor"(%arg1, %1187) : (i1, i1) -> i1
        %1190 = "seq.initial"() ({
          %1281 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1281) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1191 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1192 = "comb.icmp"(%1277, %1191) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1193 = "seq.compreg"(%1277, %arg0, %1189, %1188, %1190) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1194 = "comb.icmp"(%1193, %1186) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1195 = "comb.and"(%1194, %arg2) : (i1, i1) -> i1
        %1196 = "comb.icmp"(%1193, %1185) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1197 = "comb.icmp"(%1193, %1184) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1198 = "comb.icmp"(%1193, %1183) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1199 = "comb.icmp"(%1193, %1183) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1200 = "comb.icmp"(%1277, %1183) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1201 = "comb.and"(%1199, %1200) : (i1, i1) -> i1
        %1202 = "comb.icmp"(%1193, %1184) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1203 = "comb.icmp"(%1277, %1184) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1204 = "comb.and"(%1202, %1203) : (i1, i1) -> i1
        %1205 = "comb.and"(%1194, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1206 = "comb.and"(%1197, %arg6) : (i1, i1) -> i1
        %1207 = "comb.or"(%arg4, %arg5, %arg3, %1206) : (i1, i1, i1, i1) -> i1
        %1208 = "comb.or"(%1205, %1207) : (i1, i1) -> i1
        %1209 = "comb.xor"(%1207, %1180) : (i1, i1) -> i1
        %1210 = "comb.icmp"(%1193, %1186) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1211 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1212 = "comb.icmp"(%1193, %1185) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1213 = "comb.icmp"(%1193, %1181) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1214 = "comb.icmp"(%1193, %1184) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1215 = "comb.mux"(%1213, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1216 = "comb.mux"(%1213, %1184, %1186) : (i1, i3, i3) -> i3
        %1217 = "comb.icmp"(%1193, %1182) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1218 = "comb.xor"(%arg4, %1180) : (i1, i1) -> i1
        %1219 = "comb.and"(%1210, %1218) : (i1, i1) -> i1
        %1220 = "comb.xor"(%1210, %1180) : (i1, i1) -> i1
        %1221 = "comb.xor"(%1212, %1180) : (i1, i1) -> i1
        %1222 = "comb.xor"(%1213, %1180) : (i1, i1) -> i1
        %1223 = "comb.xor"(%1214, %1180) : (i1, i1) -> i1
        %1224 = "comb.and"(%1223, %1222, %1221, %1220, %1217) : (i1, i1, i1, i1, i1) -> i1
        %1225 = "comb.or"(%1224, %1219) : (i1, i1) -> i1
        %1226 = "comb.mux"(%1225, %arg5, %1215) : (i1, i1, i1) -> i1
        %1227 = "comb.mux"(%1225, %1183, %1216) : (i1, i3, i3) -> i3
        %1228 = "comb.xor"(%1219, %1180) : (i1, i1) -> i1
        %1229 = "comb.xor"(%1211, %1180) : (i1, i1) -> i1
        %1230 = "comb.or"(%1224, %1228, %1229) : (i1, i1, i1) -> i1
        %1231 = "comb.mux"(%1230, %1193, %1184) : (i1, i3, i3) -> i3
        %1232 = "comb.icmp"(%1193, %1183) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1233 = "comb.mux"(%1232, %1193, %1186) : (i1, i3, i3) -> i3
        %1234 = "comb.xor"(%1232, %1180) : (i1, i1) -> i1
        %1235 = "comb.xor"(%arg3, %1180) : (i1, i1) -> i1
        %1236 = "comb.and"(%1220, %1235) : (i1, i1) -> i1
        %1237 = "comb.and"(%1221, %1236) : (i1, i1) -> i1
        %1238 = "comb.and"(%1222, %1237) : (i1, i1) -> i1
        %1239 = "comb.and"(%1214, %1238) : (i1, i1) -> i1
        %1240 = "comb.and"(%1213, %1237) : (i1, i1) -> i1
        %1241 = "comb.or"(%1239, %1240) : (i1, i1) -> i1
        %1242 = "comb.and"(%1218, %1241) : (i1, i1) -> i1
        %1243 = "comb.and"(%1242, %arg5) : (i1, i1) -> i1
        %1244 = "comb.mux"(%1243, %1183, %1233) : (i1, i3, i3) -> i3
        %1245 = "comb.xor"(%1243, %1180) : (i1, i1) -> i1
        %1246 = "comb.and"(%1241, %arg4) : (i1, i1) -> i1
        %1247 = "comb.mux"(%1246, %1182, %1244) : (i1, i3, i3) -> i3
        %1248 = "comb.xor"(%1246, %1180) : (i1, i1) -> i1
        %1249 = "comb.concat"(%1179, %arg8) : (i2, i1) -> i3
        %1250 = "comb.and"(%1212, %1236) : (i1, i1) -> i1
        %1251 = "comb.and"(%1218, %1250) : (i1, i1) -> i1
        %1252 = "comb.xor"(%arg5, %1180) : (i1, i1) -> i1
        %1253 = "comb.and"(%1252, %1251) : (i1, i1) -> i1
        %1254 = "comb.and"(%arg7, %1253) : (i1, i1) -> i1
        %1255 = "comb.mux"(%1254, %1249, %1247) : (i1, i3, i3) -> i3
        %1256 = "comb.xor"(%1254, %1180) : (i1, i1) -> i1
        %1257 = "comb.and"(%1251, %arg5) : (i1, i1) -> i1
        %1258 = "comb.mux"(%1257, %1183, %1255) : (i1, i3, i3) -> i3
        %1259 = "comb.xor"(%1257, %1180) : (i1, i1) -> i1
        %1260 = "comb.and"(%1250, %arg4) : (i1, i1) -> i1
        %1261 = "comb.mux"(%1260, %1182, %1258) : (i1, i3, i3) -> i3
        %1262 = "comb.xor"(%1260, %1180) : (i1, i1) -> i1
        %1263 = "comb.mux"(%1226, %1227, %1231) : (i1, i3, i3) -> i3
        %1264 = "comb.and"(%1210, %1235) : (i1, i1) -> i1
        %1265 = "comb.and"(%1252, %1242) : (i1, i1) -> i1
        %1266 = "comb.and"(%1218, %1264) : (i1, i1) -> i1
        %1267 = "comb.and"(%1217, %1223, %1238) : (i1, i1, i1) -> i1
        %1268 = "comb.or"(%1265, %1266, %1267) : (i1, i1, i1) -> i1
        %1269 = "comb.mux"(%1268, %1263, %1261) : (i1, i3, i3) -> i3
        %1270 = "comb.xor"(%1268, %1180) : (i1, i1) -> i1
        %1271 = "comb.and"(%1264, %arg4) : (i1, i1) -> i1
        %1272 = "comb.mux"(%1271, %1182, %1269) : (i1, i3, i3) -> i3
        %1273 = "comb.xor"(%1271, %1180) : (i1, i1) -> i1
        %1274 = "comb.mux"(%arg3, %1186, %1272) : (i1, i3, i3) -> i3
        %1275 = "comb.xor"(%arg7, %1180) : (i1, i1) -> i1
        %1276 = "comb.and"(%1253, %1275) : (i1, i1) -> i1
        %1277 = "comb.mux"(%1276, %1193, %1274) : (i1, i3, i3) -> i3
        %1278 = "comb.xor"(%1276, %1180) : (i1, i1) -> i1
        %1279 = "comb.and"(%1278, %1235, %1273, %1270, %1262, %1259, %1256, %1248, %1245, %1234) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1280 = "comb.and"(%1192) : (i1) -> i1
        "fsm.return"(%1280) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %1076 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1077 = "hw.constant"() <{value = true}> : () -> i1
        %1078 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1079 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %1080 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %1081 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %1082 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %1083 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1084 = "hw.constant"() <{value = true}> : () -> i1
        %1085 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %1086 = "comb.xor"(%arg1, %1084) : (i1, i1) -> i1
        %1087 = "seq.initial"() ({
          %1178 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1178) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %1088 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %1089 = "comb.icmp"(%1174, %1088) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1090 = "seq.compreg"(%1174, %arg0, %1086, %1085, %1087) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %1091 = "comb.icmp"(%1090, %1083) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %1092 = "comb.and"(%1091, %arg2) : (i1, i1) -> i1
        %1093 = "comb.icmp"(%1090, %1082) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1094 = "comb.icmp"(%1090, %1081) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1095 = "comb.icmp"(%1090, %1080) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1096 = "comb.icmp"(%1090, %1080) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1097 = "comb.icmp"(%1174, %1080) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1098 = "comb.and"(%1096, %1097) : (i1, i1) -> i1
        %1099 = "comb.icmp"(%1090, %1081) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %1100 = "comb.icmp"(%1174, %1081) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %1101 = "comb.and"(%1099, %1100) : (i1, i1) -> i1
        %1102 = "comb.and"(%1091, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1103 = "comb.and"(%1094, %arg6) : (i1, i1) -> i1
        %1104 = "comb.or"(%arg4, %arg5, %arg3, %1103) : (i1, i1, i1, i1) -> i1
        %1105 = "comb.or"(%1102, %1104) : (i1, i1) -> i1
        %1106 = "comb.xor"(%1104, %1077) : (i1, i1) -> i1
        %1107 = "comb.icmp"(%1090, %1083) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1108 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1109 = "comb.icmp"(%1090, %1082) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1110 = "comb.icmp"(%1090, %1078) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1111 = "comb.icmp"(%1090, %1081) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1112 = "comb.mux"(%1110, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1113 = "comb.mux"(%1110, %1081, %1083) : (i1, i3, i3) -> i3
        %1114 = "comb.icmp"(%1090, %1079) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1115 = "comb.xor"(%arg4, %1077) : (i1, i1) -> i1
        %1116 = "comb.and"(%1107, %1115) : (i1, i1) -> i1
        %1117 = "comb.xor"(%1107, %1077) : (i1, i1) -> i1
        %1118 = "comb.xor"(%1109, %1077) : (i1, i1) -> i1
        %1119 = "comb.xor"(%1110, %1077) : (i1, i1) -> i1
        %1120 = "comb.xor"(%1111, %1077) : (i1, i1) -> i1
        %1121 = "comb.and"(%1120, %1119, %1118, %1117, %1114) : (i1, i1, i1, i1, i1) -> i1
        %1122 = "comb.or"(%1121, %1116) : (i1, i1) -> i1
        %1123 = "comb.mux"(%1122, %arg5, %1112) : (i1, i1, i1) -> i1
        %1124 = "comb.mux"(%1122, %1080, %1113) : (i1, i3, i3) -> i3
        %1125 = "comb.xor"(%1116, %1077) : (i1, i1) -> i1
        %1126 = "comb.xor"(%1108, %1077) : (i1, i1) -> i1
        %1127 = "comb.or"(%1121, %1125, %1126) : (i1, i1, i1) -> i1
        %1128 = "comb.mux"(%1127, %1090, %1081) : (i1, i3, i3) -> i3
        %1129 = "comb.icmp"(%1090, %1080) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1130 = "comb.mux"(%1129, %1090, %1083) : (i1, i3, i3) -> i3
        %1131 = "comb.xor"(%1129, %1077) : (i1, i1) -> i1
        %1132 = "comb.xor"(%arg3, %1077) : (i1, i1) -> i1
        %1133 = "comb.and"(%1117, %1132) : (i1, i1) -> i1
        %1134 = "comb.and"(%1118, %1133) : (i1, i1) -> i1
        %1135 = "comb.and"(%1119, %1134) : (i1, i1) -> i1
        %1136 = "comb.and"(%1111, %1135) : (i1, i1) -> i1
        %1137 = "comb.and"(%1110, %1134) : (i1, i1) -> i1
        %1138 = "comb.or"(%1136, %1137) : (i1, i1) -> i1
        %1139 = "comb.and"(%1115, %1138) : (i1, i1) -> i1
        %1140 = "comb.and"(%1139, %arg5) : (i1, i1) -> i1
        %1141 = "comb.mux"(%1140, %1080, %1130) : (i1, i3, i3) -> i3
        %1142 = "comb.xor"(%1140, %1077) : (i1, i1) -> i1
        %1143 = "comb.and"(%1138, %arg4) : (i1, i1) -> i1
        %1144 = "comb.mux"(%1143, %1079, %1141) : (i1, i3, i3) -> i3
        %1145 = "comb.xor"(%1143, %1077) : (i1, i1) -> i1
        %1146 = "comb.concat"(%1076, %arg8) : (i2, i1) -> i3
        %1147 = "comb.and"(%1109, %1133) : (i1, i1) -> i1
        %1148 = "comb.and"(%1115, %1147) : (i1, i1) -> i1
        %1149 = "comb.xor"(%arg5, %1077) : (i1, i1) -> i1
        %1150 = "comb.and"(%1149, %1148) : (i1, i1) -> i1
        %1151 = "comb.and"(%arg7, %1150) : (i1, i1) -> i1
        %1152 = "comb.mux"(%1151, %1146, %1144) : (i1, i3, i3) -> i3
        %1153 = "comb.xor"(%1151, %1077) : (i1, i1) -> i1
        %1154 = "comb.and"(%1148, %arg5) : (i1, i1) -> i1
        %1155 = "comb.mux"(%1154, %1080, %1152) : (i1, i3, i3) -> i3
        %1156 = "comb.xor"(%1154, %1077) : (i1, i1) -> i1
        %1157 = "comb.and"(%1147, %arg4) : (i1, i1) -> i1
        %1158 = "comb.mux"(%1157, %1079, %1155) : (i1, i3, i3) -> i3
        %1159 = "comb.xor"(%1157, %1077) : (i1, i1) -> i1
        %1160 = "comb.mux"(%1123, %1124, %1128) : (i1, i3, i3) -> i3
        %1161 = "comb.and"(%1107, %1132) : (i1, i1) -> i1
        %1162 = "comb.and"(%1149, %1139) : (i1, i1) -> i1
        %1163 = "comb.and"(%1115, %1161) : (i1, i1) -> i1
        %1164 = "comb.and"(%1114, %1120, %1135) : (i1, i1, i1) -> i1
        %1165 = "comb.or"(%1162, %1163, %1164) : (i1, i1, i1) -> i1
        %1166 = "comb.mux"(%1165, %1160, %1158) : (i1, i3, i3) -> i3
        %1167 = "comb.xor"(%1165, %1077) : (i1, i1) -> i1
        %1168 = "comb.and"(%1161, %arg4) : (i1, i1) -> i1
        %1169 = "comb.mux"(%1168, %1079, %1166) : (i1, i3, i3) -> i3
        %1170 = "comb.xor"(%1168, %1077) : (i1, i1) -> i1
        %1171 = "comb.mux"(%arg3, %1083, %1169) : (i1, i3, i3) -> i3
        %1172 = "comb.xor"(%arg7, %1077) : (i1, i1) -> i1
        %1173 = "comb.and"(%1150, %1172) : (i1, i1) -> i1
        %1174 = "comb.mux"(%1173, %1090, %1171) : (i1, i3, i3) -> i3
        %1175 = "comb.xor"(%1173, %1077) : (i1, i1) -> i1
        %1176 = "comb.and"(%1175, %1132, %1170, %1167, %1159, %1156, %1153, %1145, %1142, %1131) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1177 = "comb.and"(%1089) : (i1) -> i1
        "fsm.return"(%1177) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %973 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %974 = "hw.constant"() <{value = true}> : () -> i1
        %975 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %976 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %977 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %978 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %979 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %980 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %981 = "hw.constant"() <{value = true}> : () -> i1
        %982 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %983 = "comb.xor"(%arg1, %981) : (i1, i1) -> i1
        %984 = "seq.initial"() ({
          %1075 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%1075) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %985 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %986 = "comb.icmp"(%1071, %985) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %987 = "seq.compreg"(%1071, %arg0, %983, %982, %984) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %988 = "comb.icmp"(%987, %980) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %989 = "comb.and"(%988, %arg2) : (i1, i1) -> i1
        %990 = "comb.icmp"(%987, %979) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %991 = "comb.icmp"(%987, %978) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %992 = "comb.icmp"(%987, %977) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %993 = "comb.icmp"(%987, %977) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %994 = "comb.icmp"(%1071, %977) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %995 = "comb.and"(%993, %994) : (i1, i1) -> i1
        %996 = "comb.icmp"(%987, %978) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %997 = "comb.icmp"(%1071, %978) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %998 = "comb.and"(%996, %997) : (i1, i1) -> i1
        %999 = "comb.and"(%988, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %1000 = "comb.and"(%991, %arg6) : (i1, i1) -> i1
        %1001 = "comb.or"(%arg4, %arg5, %arg3, %1000) : (i1, i1, i1, i1) -> i1
        %1002 = "comb.or"(%999, %1001) : (i1, i1) -> i1
        %1003 = "comb.xor"(%1001, %974) : (i1, i1) -> i1
        %1004 = "comb.icmp"(%987, %980) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1005 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %1006 = "comb.icmp"(%987, %979) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1007 = "comb.icmp"(%987, %975) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1008 = "comb.icmp"(%987, %978) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1009 = "comb.mux"(%1007, %arg8, %arg6) : (i1, i1, i1) -> i1
        %1010 = "comb.mux"(%1007, %978, %980) : (i1, i3, i3) -> i3
        %1011 = "comb.icmp"(%987, %976) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1012 = "comb.xor"(%arg4, %974) : (i1, i1) -> i1
        %1013 = "comb.and"(%1004, %1012) : (i1, i1) -> i1
        %1014 = "comb.xor"(%1004, %974) : (i1, i1) -> i1
        %1015 = "comb.xor"(%1006, %974) : (i1, i1) -> i1
        %1016 = "comb.xor"(%1007, %974) : (i1, i1) -> i1
        %1017 = "comb.xor"(%1008, %974) : (i1, i1) -> i1
        %1018 = "comb.and"(%1017, %1016, %1015, %1014, %1011) : (i1, i1, i1, i1, i1) -> i1
        %1019 = "comb.or"(%1018, %1013) : (i1, i1) -> i1
        %1020 = "comb.mux"(%1019, %arg5, %1009) : (i1, i1, i1) -> i1
        %1021 = "comb.mux"(%1019, %977, %1010) : (i1, i3, i3) -> i3
        %1022 = "comb.xor"(%1013, %974) : (i1, i1) -> i1
        %1023 = "comb.xor"(%1005, %974) : (i1, i1) -> i1
        %1024 = "comb.or"(%1018, %1022, %1023) : (i1, i1, i1) -> i1
        %1025 = "comb.mux"(%1024, %987, %978) : (i1, i3, i3) -> i3
        %1026 = "comb.icmp"(%987, %977) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %1027 = "comb.mux"(%1026, %987, %980) : (i1, i3, i3) -> i3
        %1028 = "comb.xor"(%1026, %974) : (i1, i1) -> i1
        %1029 = "comb.xor"(%arg3, %974) : (i1, i1) -> i1
        %1030 = "comb.and"(%1014, %1029) : (i1, i1) -> i1
        %1031 = "comb.and"(%1015, %1030) : (i1, i1) -> i1
        %1032 = "comb.and"(%1016, %1031) : (i1, i1) -> i1
        %1033 = "comb.and"(%1008, %1032) : (i1, i1) -> i1
        %1034 = "comb.and"(%1007, %1031) : (i1, i1) -> i1
        %1035 = "comb.or"(%1033, %1034) : (i1, i1) -> i1
        %1036 = "comb.and"(%1012, %1035) : (i1, i1) -> i1
        %1037 = "comb.and"(%1036, %arg5) : (i1, i1) -> i1
        %1038 = "comb.mux"(%1037, %977, %1027) : (i1, i3, i3) -> i3
        %1039 = "comb.xor"(%1037, %974) : (i1, i1) -> i1
        %1040 = "comb.and"(%1035, %arg4) : (i1, i1) -> i1
        %1041 = "comb.mux"(%1040, %976, %1038) : (i1, i3, i3) -> i3
        %1042 = "comb.xor"(%1040, %974) : (i1, i1) -> i1
        %1043 = "comb.concat"(%973, %arg8) : (i2, i1) -> i3
        %1044 = "comb.and"(%1006, %1030) : (i1, i1) -> i1
        %1045 = "comb.and"(%1012, %1044) : (i1, i1) -> i1
        %1046 = "comb.xor"(%arg5, %974) : (i1, i1) -> i1
        %1047 = "comb.and"(%1046, %1045) : (i1, i1) -> i1
        %1048 = "comb.and"(%arg7, %1047) : (i1, i1) -> i1
        %1049 = "comb.mux"(%1048, %1043, %1041) : (i1, i3, i3) -> i3
        %1050 = "comb.xor"(%1048, %974) : (i1, i1) -> i1
        %1051 = "comb.and"(%1045, %arg5) : (i1, i1) -> i1
        %1052 = "comb.mux"(%1051, %977, %1049) : (i1, i3, i3) -> i3
        %1053 = "comb.xor"(%1051, %974) : (i1, i1) -> i1
        %1054 = "comb.and"(%1044, %arg4) : (i1, i1) -> i1
        %1055 = "comb.mux"(%1054, %976, %1052) : (i1, i3, i3) -> i3
        %1056 = "comb.xor"(%1054, %974) : (i1, i1) -> i1
        %1057 = "comb.mux"(%1020, %1021, %1025) : (i1, i3, i3) -> i3
        %1058 = "comb.and"(%1004, %1029) : (i1, i1) -> i1
        %1059 = "comb.and"(%1046, %1036) : (i1, i1) -> i1
        %1060 = "comb.and"(%1012, %1058) : (i1, i1) -> i1
        %1061 = "comb.and"(%1011, %1017, %1032) : (i1, i1, i1) -> i1
        %1062 = "comb.or"(%1059, %1060, %1061) : (i1, i1, i1) -> i1
        %1063 = "comb.mux"(%1062, %1057, %1055) : (i1, i3, i3) -> i3
        %1064 = "comb.xor"(%1062, %974) : (i1, i1) -> i1
        %1065 = "comb.and"(%1058, %arg4) : (i1, i1) -> i1
        %1066 = "comb.mux"(%1065, %976, %1063) : (i1, i3, i3) -> i3
        %1067 = "comb.xor"(%1065, %974) : (i1, i1) -> i1
        %1068 = "comb.mux"(%arg3, %980, %1066) : (i1, i3, i3) -> i3
        %1069 = "comb.xor"(%arg7, %974) : (i1, i1) -> i1
        %1070 = "comb.and"(%1047, %1069) : (i1, i1) -> i1
        %1071 = "comb.mux"(%1070, %987, %1068) : (i1, i3, i3) -> i3
        %1072 = "comb.xor"(%1070, %974) : (i1, i1) -> i1
        %1073 = "comb.and"(%1072, %1029, %1067, %1064, %1056, %1053, %1050, %1042, %1039, %1028) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %1074 = "comb.and"(%986) : (i1) -> i1
        "fsm.return"(%1074) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %870 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %871 = "hw.constant"() <{value = true}> : () -> i1
        %872 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %873 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %874 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %875 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %876 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %877 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %878 = "hw.constant"() <{value = true}> : () -> i1
        %879 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %880 = "comb.xor"(%arg1, %878) : (i1, i1) -> i1
        %881 = "seq.initial"() ({
          %972 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%972) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %882 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %883 = "comb.icmp"(%968, %882) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %884 = "seq.compreg"(%968, %arg0, %880, %879, %881) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %885 = "comb.icmp"(%884, %877) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %886 = "comb.and"(%885, %arg2) : (i1, i1) -> i1
        %887 = "comb.icmp"(%884, %876) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %888 = "comb.icmp"(%884, %875) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %889 = "comb.icmp"(%884, %874) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %890 = "comb.icmp"(%884, %874) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %891 = "comb.icmp"(%968, %874) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %892 = "comb.and"(%890, %891) : (i1, i1) -> i1
        %893 = "comb.icmp"(%884, %875) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %894 = "comb.icmp"(%968, %875) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %895 = "comb.and"(%893, %894) : (i1, i1) -> i1
        %896 = "comb.and"(%885, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %897 = "comb.and"(%888, %arg6) : (i1, i1) -> i1
        %898 = "comb.or"(%arg4, %arg5, %arg3, %897) : (i1, i1, i1, i1) -> i1
        %899 = "comb.or"(%896, %898) : (i1, i1) -> i1
        %900 = "comb.xor"(%898, %871) : (i1, i1) -> i1
        %901 = "comb.icmp"(%884, %877) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %902 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %903 = "comb.icmp"(%884, %876) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %904 = "comb.icmp"(%884, %872) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %905 = "comb.icmp"(%884, %875) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %906 = "comb.mux"(%904, %arg8, %arg6) : (i1, i1, i1) -> i1
        %907 = "comb.mux"(%904, %875, %877) : (i1, i3, i3) -> i3
        %908 = "comb.icmp"(%884, %873) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %909 = "comb.xor"(%arg4, %871) : (i1, i1) -> i1
        %910 = "comb.and"(%901, %909) : (i1, i1) -> i1
        %911 = "comb.xor"(%901, %871) : (i1, i1) -> i1
        %912 = "comb.xor"(%903, %871) : (i1, i1) -> i1
        %913 = "comb.xor"(%904, %871) : (i1, i1) -> i1
        %914 = "comb.xor"(%905, %871) : (i1, i1) -> i1
        %915 = "comb.and"(%914, %913, %912, %911, %908) : (i1, i1, i1, i1, i1) -> i1
        %916 = "comb.or"(%915, %910) : (i1, i1) -> i1
        %917 = "comb.mux"(%916, %arg5, %906) : (i1, i1, i1) -> i1
        %918 = "comb.mux"(%916, %874, %907) : (i1, i3, i3) -> i3
        %919 = "comb.xor"(%910, %871) : (i1, i1) -> i1
        %920 = "comb.xor"(%902, %871) : (i1, i1) -> i1
        %921 = "comb.or"(%915, %919, %920) : (i1, i1, i1) -> i1
        %922 = "comb.mux"(%921, %884, %875) : (i1, i3, i3) -> i3
        %923 = "comb.icmp"(%884, %874) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %924 = "comb.mux"(%923, %884, %877) : (i1, i3, i3) -> i3
        %925 = "comb.xor"(%923, %871) : (i1, i1) -> i1
        %926 = "comb.xor"(%arg3, %871) : (i1, i1) -> i1
        %927 = "comb.and"(%911, %926) : (i1, i1) -> i1
        %928 = "comb.and"(%912, %927) : (i1, i1) -> i1
        %929 = "comb.and"(%913, %928) : (i1, i1) -> i1
        %930 = "comb.and"(%905, %929) : (i1, i1) -> i1
        %931 = "comb.and"(%904, %928) : (i1, i1) -> i1
        %932 = "comb.or"(%930, %931) : (i1, i1) -> i1
        %933 = "comb.and"(%909, %932) : (i1, i1) -> i1
        %934 = "comb.and"(%933, %arg5) : (i1, i1) -> i1
        %935 = "comb.mux"(%934, %874, %924) : (i1, i3, i3) -> i3
        %936 = "comb.xor"(%934, %871) : (i1, i1) -> i1
        %937 = "comb.and"(%932, %arg4) : (i1, i1) -> i1
        %938 = "comb.mux"(%937, %873, %935) : (i1, i3, i3) -> i3
        %939 = "comb.xor"(%937, %871) : (i1, i1) -> i1
        %940 = "comb.concat"(%870, %arg8) : (i2, i1) -> i3
        %941 = "comb.and"(%903, %927) : (i1, i1) -> i1
        %942 = "comb.and"(%909, %941) : (i1, i1) -> i1
        %943 = "comb.xor"(%arg5, %871) : (i1, i1) -> i1
        %944 = "comb.and"(%943, %942) : (i1, i1) -> i1
        %945 = "comb.and"(%arg7, %944) : (i1, i1) -> i1
        %946 = "comb.mux"(%945, %940, %938) : (i1, i3, i3) -> i3
        %947 = "comb.xor"(%945, %871) : (i1, i1) -> i1
        %948 = "comb.and"(%942, %arg5) : (i1, i1) -> i1
        %949 = "comb.mux"(%948, %874, %946) : (i1, i3, i3) -> i3
        %950 = "comb.xor"(%948, %871) : (i1, i1) -> i1
        %951 = "comb.and"(%941, %arg4) : (i1, i1) -> i1
        %952 = "comb.mux"(%951, %873, %949) : (i1, i3, i3) -> i3
        %953 = "comb.xor"(%951, %871) : (i1, i1) -> i1
        %954 = "comb.mux"(%917, %918, %922) : (i1, i3, i3) -> i3
        %955 = "comb.and"(%901, %926) : (i1, i1) -> i1
        %956 = "comb.and"(%943, %933) : (i1, i1) -> i1
        %957 = "comb.and"(%909, %955) : (i1, i1) -> i1
        %958 = "comb.and"(%908, %914, %929) : (i1, i1, i1) -> i1
        %959 = "comb.or"(%956, %957, %958) : (i1, i1, i1) -> i1
        %960 = "comb.mux"(%959, %954, %952) : (i1, i3, i3) -> i3
        %961 = "comb.xor"(%959, %871) : (i1, i1) -> i1
        %962 = "comb.and"(%955, %arg4) : (i1, i1) -> i1
        %963 = "comb.mux"(%962, %873, %960) : (i1, i3, i3) -> i3
        %964 = "comb.xor"(%962, %871) : (i1, i1) -> i1
        %965 = "comb.mux"(%arg3, %877, %963) : (i1, i3, i3) -> i3
        %966 = "comb.xor"(%arg7, %871) : (i1, i1) -> i1
        %967 = "comb.and"(%944, %966) : (i1, i1) -> i1
        %968 = "comb.mux"(%967, %884, %965) : (i1, i3, i3) -> i3
        %969 = "comb.xor"(%967, %871) : (i1, i1) -> i1
        %970 = "comb.and"(%969, %926, %964, %961, %953, %950, %947, %939, %936, %925) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %971 = "comb.and"(%883) : (i1) -> i1
        "fsm.return"(%971) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
    "fsm.state"() <{sym_name = "state_0"}> ({
      %824 = "hw.constant"() <{value = true}> : () -> i1
      %825 = "hw.constant"() <{value = -4 : i3}> : () -> i3
      %826 = "hw.constant"() <{value = -3 : i3}> : () -> i3
      %827 = "hw.constant"() <{value = 3 : i3}> : () -> i3
      %828 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %829 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %830 = "hw.constant"() <{value = true}> : () -> i1
      %831 = "hw.constant"() <{value = false}> : () -> i1
      %832 = "hw.constant"() <{value = false}> : () -> i1
      %833 = "hw.constant"() <{value = false}> : () -> i1
      %834 = "comb.and"(%arg2, %arg7, %830) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
      %835 = "hw.constant"() <{value = false}> : () -> i1
      %836 = "comb.or"(%arg4, %arg5, %arg3, %835) : (i1, i1, i1, i1) -> i1
      %837 = "comb.or"(%834, %836) : (i1, i1) -> i1
      %838 = "comb.xor"(%836, %824) : (i1, i1) -> i1
      %839 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
      %840 = "comb.xor"(%arg4, %824) : (i1, i1) -> i1
      %841 = "hw.constant"() <{value = false}> : () -> i1
      %842 = "comb.mux"(%840, %arg5, %arg6) : (i1, i1, i1) -> i1
      %843 = "comb.mux"(%840, %826, %828) : (i1, i3, i3) -> i3
      %844 = "comb.xor"(%839, %824) : (i1, i1) -> i1
      %845 = "comb.or"(%arg4, %844, %841) : (i1, i1, i1) -> i1
      %846 = "comb.mux"(%845, %829, %827) : (i1, i3, i3) -> i3
      %847 = "hw.constant"() <{value = 0 : i3}> : () -> i3
      %848 = "hw.constant"() <{value = true}> : () -> i1
      %849 = "comb.xor"(%arg3, %824) : (i1, i1) -> i1
      %850 = "hw.constant"() <{value = true}> : () -> i1
      %851 = "hw.constant"() <{value = true}> : () -> i1
      %852 = "hw.constant"() <{value = true}> : () -> i1
      %853 = "hw.constant"() <{value = true}> : () -> i1
      %854 = "hw.constant"() <{value = true}> : () -> i1
      %855 = "comb.mux"(%842, %843, %846) : (i1, i3, i3) -> i3
      %856 = "hw.constant"() <{value = false}> : () -> i1
      %857 = "comb.and"(%840, %849) : (i1, i1) -> i1
      %858 = "hw.constant"() <{value = false}> : () -> i1
      %859 = "comb.or"(%857, %856, %858) : (i1, i1, i1) -> i1
      %860 = "comb.mux"(%859, %855, %847) : (i1, i3, i3) -> i3
      %861 = "comb.xor"(%859, %824) : (i1, i1) -> i1
      %862 = "comb.and"(%849, %arg4) : (i1, i1) -> i1
      %863 = "comb.mux"(%862, %825, %860) : (i1, i3, i3) -> i3
      %864 = "comb.xor"(%862, %824) : (i1, i1) -> i1
      %865 = "comb.mux"(%arg3, %828, %863) : (i1, i3, i3) -> i3
      %866 = "hw.constant"() <{value = true}> : () -> i1
      %867 = "comb.and"(%849, %864, %861, %854, %853, %866, %852, %850, %851, %848) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
      %868 = "comb.icmp"(%865, %826) <{predicate = 0 : i64}> : (i3, i3) -> i1
      %869 = "comb.icmp"(%865, %827) <{predicate = 0 : i64}> : (i3, i3) -> i1
      "fsm.output"(%arg2, %831, %832, %833, %837, %838, %869, %868, %867) : (i1, i1, i1, i1, i1, i1, i1, i1, i1) -> ()
    }, {
      "fsm.transition"() <{nextState = @state_7}> ({
        %721 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %722 = "hw.constant"() <{value = true}> : () -> i1
        %723 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %724 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %725 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %726 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %727 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %728 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %729 = "hw.constant"() <{value = true}> : () -> i1
        %730 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %731 = "comb.xor"(%arg1, %729) : (i1, i1) -> i1
        %732 = "seq.initial"() ({
          %823 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%823) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %733 = "hw.constant"() <{value = -1 : i3}> : () -> i3
        %734 = "comb.icmp"(%819, %733) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %735 = "seq.compreg"(%819, %arg0, %731, %730, %732) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %736 = "comb.icmp"(%735, %728) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %737 = "comb.and"(%736, %arg2) : (i1, i1) -> i1
        %738 = "comb.icmp"(%735, %727) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %739 = "comb.icmp"(%735, %726) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %740 = "comb.icmp"(%735, %725) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %741 = "comb.icmp"(%735, %725) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %742 = "comb.icmp"(%819, %725) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %743 = "comb.and"(%741, %742) : (i1, i1) -> i1
        %744 = "comb.icmp"(%735, %726) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %745 = "comb.icmp"(%819, %726) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %746 = "comb.and"(%744, %745) : (i1, i1) -> i1
        %747 = "comb.and"(%736, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %748 = "comb.and"(%739, %arg6) : (i1, i1) -> i1
        %749 = "comb.or"(%arg4, %arg5, %arg3, %748) : (i1, i1, i1, i1) -> i1
        %750 = "comb.or"(%747, %749) : (i1, i1) -> i1
        %751 = "comb.xor"(%749, %722) : (i1, i1) -> i1
        %752 = "comb.icmp"(%735, %728) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %753 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %754 = "comb.icmp"(%735, %727) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %755 = "comb.icmp"(%735, %723) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %756 = "comb.icmp"(%735, %726) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %757 = "comb.mux"(%755, %arg8, %arg6) : (i1, i1, i1) -> i1
        %758 = "comb.mux"(%755, %726, %728) : (i1, i3, i3) -> i3
        %759 = "comb.icmp"(%735, %724) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %760 = "comb.xor"(%arg4, %722) : (i1, i1) -> i1
        %761 = "comb.and"(%752, %760) : (i1, i1) -> i1
        %762 = "comb.xor"(%752, %722) : (i1, i1) -> i1
        %763 = "comb.xor"(%754, %722) : (i1, i1) -> i1
        %764 = "comb.xor"(%755, %722) : (i1, i1) -> i1
        %765 = "comb.xor"(%756, %722) : (i1, i1) -> i1
        %766 = "comb.and"(%765, %764, %763, %762, %759) : (i1, i1, i1, i1, i1) -> i1
        %767 = "comb.or"(%766, %761) : (i1, i1) -> i1
        %768 = "comb.mux"(%767, %arg5, %757) : (i1, i1, i1) -> i1
        %769 = "comb.mux"(%767, %725, %758) : (i1, i3, i3) -> i3
        %770 = "comb.xor"(%761, %722) : (i1, i1) -> i1
        %771 = "comb.xor"(%753, %722) : (i1, i1) -> i1
        %772 = "comb.or"(%766, %770, %771) : (i1, i1, i1) -> i1
        %773 = "comb.mux"(%772, %735, %726) : (i1, i3, i3) -> i3
        %774 = "comb.icmp"(%735, %725) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %775 = "comb.mux"(%774, %735, %728) : (i1, i3, i3) -> i3
        %776 = "comb.xor"(%774, %722) : (i1, i1) -> i1
        %777 = "comb.xor"(%arg3, %722) : (i1, i1) -> i1
        %778 = "comb.and"(%762, %777) : (i1, i1) -> i1
        %779 = "comb.and"(%763, %778) : (i1, i1) -> i1
        %780 = "comb.and"(%764, %779) : (i1, i1) -> i1
        %781 = "comb.and"(%756, %780) : (i1, i1) -> i1
        %782 = "comb.and"(%755, %779) : (i1, i1) -> i1
        %783 = "comb.or"(%781, %782) : (i1, i1) -> i1
        %784 = "comb.and"(%760, %783) : (i1, i1) -> i1
        %785 = "comb.and"(%784, %arg5) : (i1, i1) -> i1
        %786 = "comb.mux"(%785, %725, %775) : (i1, i3, i3) -> i3
        %787 = "comb.xor"(%785, %722) : (i1, i1) -> i1
        %788 = "comb.and"(%783, %arg4) : (i1, i1) -> i1
        %789 = "comb.mux"(%788, %724, %786) : (i1, i3, i3) -> i3
        %790 = "comb.xor"(%788, %722) : (i1, i1) -> i1
        %791 = "comb.concat"(%721, %arg8) : (i2, i1) -> i3
        %792 = "comb.and"(%754, %778) : (i1, i1) -> i1
        %793 = "comb.and"(%760, %792) : (i1, i1) -> i1
        %794 = "comb.xor"(%arg5, %722) : (i1, i1) -> i1
        %795 = "comb.and"(%794, %793) : (i1, i1) -> i1
        %796 = "comb.and"(%arg7, %795) : (i1, i1) -> i1
        %797 = "comb.mux"(%796, %791, %789) : (i1, i3, i3) -> i3
        %798 = "comb.xor"(%796, %722) : (i1, i1) -> i1
        %799 = "comb.and"(%793, %arg5) : (i1, i1) -> i1
        %800 = "comb.mux"(%799, %725, %797) : (i1, i3, i3) -> i3
        %801 = "comb.xor"(%799, %722) : (i1, i1) -> i1
        %802 = "comb.and"(%792, %arg4) : (i1, i1) -> i1
        %803 = "comb.mux"(%802, %724, %800) : (i1, i3, i3) -> i3
        %804 = "comb.xor"(%802, %722) : (i1, i1) -> i1
        %805 = "comb.mux"(%768, %769, %773) : (i1, i3, i3) -> i3
        %806 = "comb.and"(%752, %777) : (i1, i1) -> i1
        %807 = "comb.and"(%794, %784) : (i1, i1) -> i1
        %808 = "comb.and"(%760, %806) : (i1, i1) -> i1
        %809 = "comb.and"(%759, %765, %780) : (i1, i1, i1) -> i1
        %810 = "comb.or"(%807, %808, %809) : (i1, i1, i1) -> i1
        %811 = "comb.mux"(%810, %805, %803) : (i1, i3, i3) -> i3
        %812 = "comb.xor"(%810, %722) : (i1, i1) -> i1
        %813 = "comb.and"(%806, %arg4) : (i1, i1) -> i1
        %814 = "comb.mux"(%813, %724, %811) : (i1, i3, i3) -> i3
        %815 = "comb.xor"(%813, %722) : (i1, i1) -> i1
        %816 = "comb.mux"(%arg3, %728, %814) : (i1, i3, i3) -> i3
        %817 = "comb.xor"(%arg7, %722) : (i1, i1) -> i1
        %818 = "comb.and"(%795, %817) : (i1, i1) -> i1
        %819 = "comb.mux"(%818, %735, %816) : (i1, i3, i3) -> i3
        %820 = "comb.xor"(%818, %722) : (i1, i1) -> i1
        %821 = "comb.and"(%820, %777, %815, %812, %804, %801, %798, %790, %787, %776) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %822 = "comb.and"(%734) : (i1) -> i1
        "fsm.return"(%822) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_6}> ({
        %618 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %619 = "hw.constant"() <{value = true}> : () -> i1
        %620 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %621 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %622 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %623 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %624 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %625 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %626 = "hw.constant"() <{value = true}> : () -> i1
        %627 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %628 = "comb.xor"(%arg1, %626) : (i1, i1) -> i1
        %629 = "seq.initial"() ({
          %720 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%720) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %630 = "hw.constant"() <{value = -2 : i3}> : () -> i3
        %631 = "comb.icmp"(%716, %630) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %632 = "seq.compreg"(%716, %arg0, %628, %627, %629) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %633 = "comb.icmp"(%632, %625) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %634 = "comb.and"(%633, %arg2) : (i1, i1) -> i1
        %635 = "comb.icmp"(%632, %624) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %636 = "comb.icmp"(%632, %623) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %637 = "comb.icmp"(%632, %622) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %638 = "comb.icmp"(%632, %622) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %639 = "comb.icmp"(%716, %622) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %640 = "comb.and"(%638, %639) : (i1, i1) -> i1
        %641 = "comb.icmp"(%632, %623) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %642 = "comb.icmp"(%716, %623) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %643 = "comb.and"(%641, %642) : (i1, i1) -> i1
        %644 = "comb.and"(%633, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %645 = "comb.and"(%636, %arg6) : (i1, i1) -> i1
        %646 = "comb.or"(%arg4, %arg5, %arg3, %645) : (i1, i1, i1, i1) -> i1
        %647 = "comb.or"(%644, %646) : (i1, i1) -> i1
        %648 = "comb.xor"(%646, %619) : (i1, i1) -> i1
        %649 = "comb.icmp"(%632, %625) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %650 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %651 = "comb.icmp"(%632, %624) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %652 = "comb.icmp"(%632, %620) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %653 = "comb.icmp"(%632, %623) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %654 = "comb.mux"(%652, %arg8, %arg6) : (i1, i1, i1) -> i1
        %655 = "comb.mux"(%652, %623, %625) : (i1, i3, i3) -> i3
        %656 = "comb.icmp"(%632, %621) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %657 = "comb.xor"(%arg4, %619) : (i1, i1) -> i1
        %658 = "comb.and"(%649, %657) : (i1, i1) -> i1
        %659 = "comb.xor"(%649, %619) : (i1, i1) -> i1
        %660 = "comb.xor"(%651, %619) : (i1, i1) -> i1
        %661 = "comb.xor"(%652, %619) : (i1, i1) -> i1
        %662 = "comb.xor"(%653, %619) : (i1, i1) -> i1
        %663 = "comb.and"(%662, %661, %660, %659, %656) : (i1, i1, i1, i1, i1) -> i1
        %664 = "comb.or"(%663, %658) : (i1, i1) -> i1
        %665 = "comb.mux"(%664, %arg5, %654) : (i1, i1, i1) -> i1
        %666 = "comb.mux"(%664, %622, %655) : (i1, i3, i3) -> i3
        %667 = "comb.xor"(%658, %619) : (i1, i1) -> i1
        %668 = "comb.xor"(%650, %619) : (i1, i1) -> i1
        %669 = "comb.or"(%663, %667, %668) : (i1, i1, i1) -> i1
        %670 = "comb.mux"(%669, %632, %623) : (i1, i3, i3) -> i3
        %671 = "comb.icmp"(%632, %622) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %672 = "comb.mux"(%671, %632, %625) : (i1, i3, i3) -> i3
        %673 = "comb.xor"(%671, %619) : (i1, i1) -> i1
        %674 = "comb.xor"(%arg3, %619) : (i1, i1) -> i1
        %675 = "comb.and"(%659, %674) : (i1, i1) -> i1
        %676 = "comb.and"(%660, %675) : (i1, i1) -> i1
        %677 = "comb.and"(%661, %676) : (i1, i1) -> i1
        %678 = "comb.and"(%653, %677) : (i1, i1) -> i1
        %679 = "comb.and"(%652, %676) : (i1, i1) -> i1
        %680 = "comb.or"(%678, %679) : (i1, i1) -> i1
        %681 = "comb.and"(%657, %680) : (i1, i1) -> i1
        %682 = "comb.and"(%681, %arg5) : (i1, i1) -> i1
        %683 = "comb.mux"(%682, %622, %672) : (i1, i3, i3) -> i3
        %684 = "comb.xor"(%682, %619) : (i1, i1) -> i1
        %685 = "comb.and"(%680, %arg4) : (i1, i1) -> i1
        %686 = "comb.mux"(%685, %621, %683) : (i1, i3, i3) -> i3
        %687 = "comb.xor"(%685, %619) : (i1, i1) -> i1
        %688 = "comb.concat"(%618, %arg8) : (i2, i1) -> i3
        %689 = "comb.and"(%651, %675) : (i1, i1) -> i1
        %690 = "comb.and"(%657, %689) : (i1, i1) -> i1
        %691 = "comb.xor"(%arg5, %619) : (i1, i1) -> i1
        %692 = "comb.and"(%691, %690) : (i1, i1) -> i1
        %693 = "comb.and"(%arg7, %692) : (i1, i1) -> i1
        %694 = "comb.mux"(%693, %688, %686) : (i1, i3, i3) -> i3
        %695 = "comb.xor"(%693, %619) : (i1, i1) -> i1
        %696 = "comb.and"(%690, %arg5) : (i1, i1) -> i1
        %697 = "comb.mux"(%696, %622, %694) : (i1, i3, i3) -> i3
        %698 = "comb.xor"(%696, %619) : (i1, i1) -> i1
        %699 = "comb.and"(%689, %arg4) : (i1, i1) -> i1
        %700 = "comb.mux"(%699, %621, %697) : (i1, i3, i3) -> i3
        %701 = "comb.xor"(%699, %619) : (i1, i1) -> i1
        %702 = "comb.mux"(%665, %666, %670) : (i1, i3, i3) -> i3
        %703 = "comb.and"(%649, %674) : (i1, i1) -> i1
        %704 = "comb.and"(%691, %681) : (i1, i1) -> i1
        %705 = "comb.and"(%657, %703) : (i1, i1) -> i1
        %706 = "comb.and"(%656, %662, %677) : (i1, i1, i1) -> i1
        %707 = "comb.or"(%704, %705, %706) : (i1, i1, i1) -> i1
        %708 = "comb.mux"(%707, %702, %700) : (i1, i3, i3) -> i3
        %709 = "comb.xor"(%707, %619) : (i1, i1) -> i1
        %710 = "comb.and"(%703, %arg4) : (i1, i1) -> i1
        %711 = "comb.mux"(%710, %621, %708) : (i1, i3, i3) -> i3
        %712 = "comb.xor"(%710, %619) : (i1, i1) -> i1
        %713 = "comb.mux"(%arg3, %625, %711) : (i1, i3, i3) -> i3
        %714 = "comb.xor"(%arg7, %619) : (i1, i1) -> i1
        %715 = "comb.and"(%692, %714) : (i1, i1) -> i1
        %716 = "comb.mux"(%715, %632, %713) : (i1, i3, i3) -> i3
        %717 = "comb.xor"(%715, %619) : (i1, i1) -> i1
        %718 = "comb.and"(%717, %674, %712, %709, %701, %698, %695, %687, %684, %673) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %719 = "comb.and"(%631) : (i1) -> i1
        "fsm.return"(%719) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_5}> ({
        %515 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %516 = "hw.constant"() <{value = true}> : () -> i1
        %517 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %518 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %519 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %520 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %521 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %522 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %523 = "hw.constant"() <{value = true}> : () -> i1
        %524 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %525 = "comb.xor"(%arg1, %523) : (i1, i1) -> i1
        %526 = "seq.initial"() ({
          %617 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%617) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %527 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %528 = "comb.icmp"(%613, %527) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %529 = "seq.compreg"(%613, %arg0, %525, %524, %526) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %530 = "comb.icmp"(%529, %522) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %531 = "comb.and"(%530, %arg2) : (i1, i1) -> i1
        %532 = "comb.icmp"(%529, %521) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %533 = "comb.icmp"(%529, %520) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %534 = "comb.icmp"(%529, %519) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %535 = "comb.icmp"(%529, %519) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %536 = "comb.icmp"(%613, %519) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %537 = "comb.and"(%535, %536) : (i1, i1) -> i1
        %538 = "comb.icmp"(%529, %520) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %539 = "comb.icmp"(%613, %520) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %540 = "comb.and"(%538, %539) : (i1, i1) -> i1
        %541 = "comb.and"(%530, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %542 = "comb.and"(%533, %arg6) : (i1, i1) -> i1
        %543 = "comb.or"(%arg4, %arg5, %arg3, %542) : (i1, i1, i1, i1) -> i1
        %544 = "comb.or"(%541, %543) : (i1, i1) -> i1
        %545 = "comb.xor"(%543, %516) : (i1, i1) -> i1
        %546 = "comb.icmp"(%529, %522) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %547 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %548 = "comb.icmp"(%529, %521) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %549 = "comb.icmp"(%529, %517) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %550 = "comb.icmp"(%529, %520) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %551 = "comb.mux"(%549, %arg8, %arg6) : (i1, i1, i1) -> i1
        %552 = "comb.mux"(%549, %520, %522) : (i1, i3, i3) -> i3
        %553 = "comb.icmp"(%529, %518) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %554 = "comb.xor"(%arg4, %516) : (i1, i1) -> i1
        %555 = "comb.and"(%546, %554) : (i1, i1) -> i1
        %556 = "comb.xor"(%546, %516) : (i1, i1) -> i1
        %557 = "comb.xor"(%548, %516) : (i1, i1) -> i1
        %558 = "comb.xor"(%549, %516) : (i1, i1) -> i1
        %559 = "comb.xor"(%550, %516) : (i1, i1) -> i1
        %560 = "comb.and"(%559, %558, %557, %556, %553) : (i1, i1, i1, i1, i1) -> i1
        %561 = "comb.or"(%560, %555) : (i1, i1) -> i1
        %562 = "comb.mux"(%561, %arg5, %551) : (i1, i1, i1) -> i1
        %563 = "comb.mux"(%561, %519, %552) : (i1, i3, i3) -> i3
        %564 = "comb.xor"(%555, %516) : (i1, i1) -> i1
        %565 = "comb.xor"(%547, %516) : (i1, i1) -> i1
        %566 = "comb.or"(%560, %564, %565) : (i1, i1, i1) -> i1
        %567 = "comb.mux"(%566, %529, %520) : (i1, i3, i3) -> i3
        %568 = "comb.icmp"(%529, %519) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %569 = "comb.mux"(%568, %529, %522) : (i1, i3, i3) -> i3
        %570 = "comb.xor"(%568, %516) : (i1, i1) -> i1
        %571 = "comb.xor"(%arg3, %516) : (i1, i1) -> i1
        %572 = "comb.and"(%556, %571) : (i1, i1) -> i1
        %573 = "comb.and"(%557, %572) : (i1, i1) -> i1
        %574 = "comb.and"(%558, %573) : (i1, i1) -> i1
        %575 = "comb.and"(%550, %574) : (i1, i1) -> i1
        %576 = "comb.and"(%549, %573) : (i1, i1) -> i1
        %577 = "comb.or"(%575, %576) : (i1, i1) -> i1
        %578 = "comb.and"(%554, %577) : (i1, i1) -> i1
        %579 = "comb.and"(%578, %arg5) : (i1, i1) -> i1
        %580 = "comb.mux"(%579, %519, %569) : (i1, i3, i3) -> i3
        %581 = "comb.xor"(%579, %516) : (i1, i1) -> i1
        %582 = "comb.and"(%577, %arg4) : (i1, i1) -> i1
        %583 = "comb.mux"(%582, %518, %580) : (i1, i3, i3) -> i3
        %584 = "comb.xor"(%582, %516) : (i1, i1) -> i1
        %585 = "comb.concat"(%515, %arg8) : (i2, i1) -> i3
        %586 = "comb.and"(%548, %572) : (i1, i1) -> i1
        %587 = "comb.and"(%554, %586) : (i1, i1) -> i1
        %588 = "comb.xor"(%arg5, %516) : (i1, i1) -> i1
        %589 = "comb.and"(%588, %587) : (i1, i1) -> i1
        %590 = "comb.and"(%arg7, %589) : (i1, i1) -> i1
        %591 = "comb.mux"(%590, %585, %583) : (i1, i3, i3) -> i3
        %592 = "comb.xor"(%590, %516) : (i1, i1) -> i1
        %593 = "comb.and"(%587, %arg5) : (i1, i1) -> i1
        %594 = "comb.mux"(%593, %519, %591) : (i1, i3, i3) -> i3
        %595 = "comb.xor"(%593, %516) : (i1, i1) -> i1
        %596 = "comb.and"(%586, %arg4) : (i1, i1) -> i1
        %597 = "comb.mux"(%596, %518, %594) : (i1, i3, i3) -> i3
        %598 = "comb.xor"(%596, %516) : (i1, i1) -> i1
        %599 = "comb.mux"(%562, %563, %567) : (i1, i3, i3) -> i3
        %600 = "comb.and"(%546, %571) : (i1, i1) -> i1
        %601 = "comb.and"(%588, %578) : (i1, i1) -> i1
        %602 = "comb.and"(%554, %600) : (i1, i1) -> i1
        %603 = "comb.and"(%553, %559, %574) : (i1, i1, i1) -> i1
        %604 = "comb.or"(%601, %602, %603) : (i1, i1, i1) -> i1
        %605 = "comb.mux"(%604, %599, %597) : (i1, i3, i3) -> i3
        %606 = "comb.xor"(%604, %516) : (i1, i1) -> i1
        %607 = "comb.and"(%600, %arg4) : (i1, i1) -> i1
        %608 = "comb.mux"(%607, %518, %605) : (i1, i3, i3) -> i3
        %609 = "comb.xor"(%607, %516) : (i1, i1) -> i1
        %610 = "comb.mux"(%arg3, %522, %608) : (i1, i3, i3) -> i3
        %611 = "comb.xor"(%arg7, %516) : (i1, i1) -> i1
        %612 = "comb.and"(%589, %611) : (i1, i1) -> i1
        %613 = "comb.mux"(%612, %529, %610) : (i1, i3, i3) -> i3
        %614 = "comb.xor"(%612, %516) : (i1, i1) -> i1
        %615 = "comb.and"(%614, %571, %609, %606, %598, %595, %592, %584, %581, %570) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %616 = "comb.and"(%528) : (i1) -> i1
        "fsm.return"(%616) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_4}> ({
        %412 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %413 = "hw.constant"() <{value = true}> : () -> i1
        %414 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %415 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %416 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %417 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %418 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %419 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %420 = "hw.constant"() <{value = true}> : () -> i1
        %421 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %422 = "comb.xor"(%arg1, %420) : (i1, i1) -> i1
        %423 = "seq.initial"() ({
          %514 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%514) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %424 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %425 = "comb.icmp"(%510, %424) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %426 = "seq.compreg"(%510, %arg0, %422, %421, %423) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %427 = "comb.icmp"(%426, %419) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %428 = "comb.and"(%427, %arg2) : (i1, i1) -> i1
        %429 = "comb.icmp"(%426, %418) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %430 = "comb.icmp"(%426, %417) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %431 = "comb.icmp"(%426, %416) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %432 = "comb.icmp"(%426, %416) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %433 = "comb.icmp"(%510, %416) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %434 = "comb.and"(%432, %433) : (i1, i1) -> i1
        %435 = "comb.icmp"(%426, %417) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %436 = "comb.icmp"(%510, %417) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %437 = "comb.and"(%435, %436) : (i1, i1) -> i1
        %438 = "comb.and"(%427, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %439 = "comb.and"(%430, %arg6) : (i1, i1) -> i1
        %440 = "comb.or"(%arg4, %arg5, %arg3, %439) : (i1, i1, i1, i1) -> i1
        %441 = "comb.or"(%438, %440) : (i1, i1) -> i1
        %442 = "comb.xor"(%440, %413) : (i1, i1) -> i1
        %443 = "comb.icmp"(%426, %419) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %444 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %445 = "comb.icmp"(%426, %418) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %446 = "comb.icmp"(%426, %414) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %447 = "comb.icmp"(%426, %417) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %448 = "comb.mux"(%446, %arg8, %arg6) : (i1, i1, i1) -> i1
        %449 = "comb.mux"(%446, %417, %419) : (i1, i3, i3) -> i3
        %450 = "comb.icmp"(%426, %415) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %451 = "comb.xor"(%arg4, %413) : (i1, i1) -> i1
        %452 = "comb.and"(%443, %451) : (i1, i1) -> i1
        %453 = "comb.xor"(%443, %413) : (i1, i1) -> i1
        %454 = "comb.xor"(%445, %413) : (i1, i1) -> i1
        %455 = "comb.xor"(%446, %413) : (i1, i1) -> i1
        %456 = "comb.xor"(%447, %413) : (i1, i1) -> i1
        %457 = "comb.and"(%456, %455, %454, %453, %450) : (i1, i1, i1, i1, i1) -> i1
        %458 = "comb.or"(%457, %452) : (i1, i1) -> i1
        %459 = "comb.mux"(%458, %arg5, %448) : (i1, i1, i1) -> i1
        %460 = "comb.mux"(%458, %416, %449) : (i1, i3, i3) -> i3
        %461 = "comb.xor"(%452, %413) : (i1, i1) -> i1
        %462 = "comb.xor"(%444, %413) : (i1, i1) -> i1
        %463 = "comb.or"(%457, %461, %462) : (i1, i1, i1) -> i1
        %464 = "comb.mux"(%463, %426, %417) : (i1, i3, i3) -> i3
        %465 = "comb.icmp"(%426, %416) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %466 = "comb.mux"(%465, %426, %419) : (i1, i3, i3) -> i3
        %467 = "comb.xor"(%465, %413) : (i1, i1) -> i1
        %468 = "comb.xor"(%arg3, %413) : (i1, i1) -> i1
        %469 = "comb.and"(%453, %468) : (i1, i1) -> i1
        %470 = "comb.and"(%454, %469) : (i1, i1) -> i1
        %471 = "comb.and"(%455, %470) : (i1, i1) -> i1
        %472 = "comb.and"(%447, %471) : (i1, i1) -> i1
        %473 = "comb.and"(%446, %470) : (i1, i1) -> i1
        %474 = "comb.or"(%472, %473) : (i1, i1) -> i1
        %475 = "comb.and"(%451, %474) : (i1, i1) -> i1
        %476 = "comb.and"(%475, %arg5) : (i1, i1) -> i1
        %477 = "comb.mux"(%476, %416, %466) : (i1, i3, i3) -> i3
        %478 = "comb.xor"(%476, %413) : (i1, i1) -> i1
        %479 = "comb.and"(%474, %arg4) : (i1, i1) -> i1
        %480 = "comb.mux"(%479, %415, %477) : (i1, i3, i3) -> i3
        %481 = "comb.xor"(%479, %413) : (i1, i1) -> i1
        %482 = "comb.concat"(%412, %arg8) : (i2, i1) -> i3
        %483 = "comb.and"(%445, %469) : (i1, i1) -> i1
        %484 = "comb.and"(%451, %483) : (i1, i1) -> i1
        %485 = "comb.xor"(%arg5, %413) : (i1, i1) -> i1
        %486 = "comb.and"(%485, %484) : (i1, i1) -> i1
        %487 = "comb.and"(%arg7, %486) : (i1, i1) -> i1
        %488 = "comb.mux"(%487, %482, %480) : (i1, i3, i3) -> i3
        %489 = "comb.xor"(%487, %413) : (i1, i1) -> i1
        %490 = "comb.and"(%484, %arg5) : (i1, i1) -> i1
        %491 = "comb.mux"(%490, %416, %488) : (i1, i3, i3) -> i3
        %492 = "comb.xor"(%490, %413) : (i1, i1) -> i1
        %493 = "comb.and"(%483, %arg4) : (i1, i1) -> i1
        %494 = "comb.mux"(%493, %415, %491) : (i1, i3, i3) -> i3
        %495 = "comb.xor"(%493, %413) : (i1, i1) -> i1
        %496 = "comb.mux"(%459, %460, %464) : (i1, i3, i3) -> i3
        %497 = "comb.and"(%443, %468) : (i1, i1) -> i1
        %498 = "comb.and"(%485, %475) : (i1, i1) -> i1
        %499 = "comb.and"(%451, %497) : (i1, i1) -> i1
        %500 = "comb.and"(%450, %456, %471) : (i1, i1, i1) -> i1
        %501 = "comb.or"(%498, %499, %500) : (i1, i1, i1) -> i1
        %502 = "comb.mux"(%501, %496, %494) : (i1, i3, i3) -> i3
        %503 = "comb.xor"(%501, %413) : (i1, i1) -> i1
        %504 = "comb.and"(%497, %arg4) : (i1, i1) -> i1
        %505 = "comb.mux"(%504, %415, %502) : (i1, i3, i3) -> i3
        %506 = "comb.xor"(%504, %413) : (i1, i1) -> i1
        %507 = "comb.mux"(%arg3, %419, %505) : (i1, i3, i3) -> i3
        %508 = "comb.xor"(%arg7, %413) : (i1, i1) -> i1
        %509 = "comb.and"(%486, %508) : (i1, i1) -> i1
        %510 = "comb.mux"(%509, %426, %507) : (i1, i3, i3) -> i3
        %511 = "comb.xor"(%509, %413) : (i1, i1) -> i1
        %512 = "comb.and"(%511, %468, %506, %503, %495, %492, %489, %481, %478, %467) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %513 = "comb.and"(%425) : (i1) -> i1
        "fsm.return"(%513) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_3}> ({
        %309 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %310 = "hw.constant"() <{value = true}> : () -> i1
        %311 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %312 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %313 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %314 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %315 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %316 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %317 = "hw.constant"() <{value = true}> : () -> i1
        %318 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %319 = "comb.xor"(%arg1, %317) : (i1, i1) -> i1
        %320 = "seq.initial"() ({
          %411 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%411) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %321 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %322 = "comb.icmp"(%407, %321) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %323 = "seq.compreg"(%407, %arg0, %319, %318, %320) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %324 = "comb.icmp"(%323, %316) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %325 = "comb.and"(%324, %arg2) : (i1, i1) -> i1
        %326 = "comb.icmp"(%323, %315) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %327 = "comb.icmp"(%323, %314) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %328 = "comb.icmp"(%323, %313) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %329 = "comb.icmp"(%323, %313) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %330 = "comb.icmp"(%407, %313) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %331 = "comb.and"(%329, %330) : (i1, i1) -> i1
        %332 = "comb.icmp"(%323, %314) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %333 = "comb.icmp"(%407, %314) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %334 = "comb.and"(%332, %333) : (i1, i1) -> i1
        %335 = "comb.and"(%324, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %336 = "comb.and"(%327, %arg6) : (i1, i1) -> i1
        %337 = "comb.or"(%arg4, %arg5, %arg3, %336) : (i1, i1, i1, i1) -> i1
        %338 = "comb.or"(%335, %337) : (i1, i1) -> i1
        %339 = "comb.xor"(%337, %310) : (i1, i1) -> i1
        %340 = "comb.icmp"(%323, %316) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %341 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %342 = "comb.icmp"(%323, %315) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %343 = "comb.icmp"(%323, %311) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %344 = "comb.icmp"(%323, %314) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %345 = "comb.mux"(%343, %arg8, %arg6) : (i1, i1, i1) -> i1
        %346 = "comb.mux"(%343, %314, %316) : (i1, i3, i3) -> i3
        %347 = "comb.icmp"(%323, %312) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %348 = "comb.xor"(%arg4, %310) : (i1, i1) -> i1
        %349 = "comb.and"(%340, %348) : (i1, i1) -> i1
        %350 = "comb.xor"(%340, %310) : (i1, i1) -> i1
        %351 = "comb.xor"(%342, %310) : (i1, i1) -> i1
        %352 = "comb.xor"(%343, %310) : (i1, i1) -> i1
        %353 = "comb.xor"(%344, %310) : (i1, i1) -> i1
        %354 = "comb.and"(%353, %352, %351, %350, %347) : (i1, i1, i1, i1, i1) -> i1
        %355 = "comb.or"(%354, %349) : (i1, i1) -> i1
        %356 = "comb.mux"(%355, %arg5, %345) : (i1, i1, i1) -> i1
        %357 = "comb.mux"(%355, %313, %346) : (i1, i3, i3) -> i3
        %358 = "comb.xor"(%349, %310) : (i1, i1) -> i1
        %359 = "comb.xor"(%341, %310) : (i1, i1) -> i1
        %360 = "comb.or"(%354, %358, %359) : (i1, i1, i1) -> i1
        %361 = "comb.mux"(%360, %323, %314) : (i1, i3, i3) -> i3
        %362 = "comb.icmp"(%323, %313) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %363 = "comb.mux"(%362, %323, %316) : (i1, i3, i3) -> i3
        %364 = "comb.xor"(%362, %310) : (i1, i1) -> i1
        %365 = "comb.xor"(%arg3, %310) : (i1, i1) -> i1
        %366 = "comb.and"(%350, %365) : (i1, i1) -> i1
        %367 = "comb.and"(%351, %366) : (i1, i1) -> i1
        %368 = "comb.and"(%352, %367) : (i1, i1) -> i1
        %369 = "comb.and"(%344, %368) : (i1, i1) -> i1
        %370 = "comb.and"(%343, %367) : (i1, i1) -> i1
        %371 = "comb.or"(%369, %370) : (i1, i1) -> i1
        %372 = "comb.and"(%348, %371) : (i1, i1) -> i1
        %373 = "comb.and"(%372, %arg5) : (i1, i1) -> i1
        %374 = "comb.mux"(%373, %313, %363) : (i1, i3, i3) -> i3
        %375 = "comb.xor"(%373, %310) : (i1, i1) -> i1
        %376 = "comb.and"(%371, %arg4) : (i1, i1) -> i1
        %377 = "comb.mux"(%376, %312, %374) : (i1, i3, i3) -> i3
        %378 = "comb.xor"(%376, %310) : (i1, i1) -> i1
        %379 = "comb.concat"(%309, %arg8) : (i2, i1) -> i3
        %380 = "comb.and"(%342, %366) : (i1, i1) -> i1
        %381 = "comb.and"(%348, %380) : (i1, i1) -> i1
        %382 = "comb.xor"(%arg5, %310) : (i1, i1) -> i1
        %383 = "comb.and"(%382, %381) : (i1, i1) -> i1
        %384 = "comb.and"(%arg7, %383) : (i1, i1) -> i1
        %385 = "comb.mux"(%384, %379, %377) : (i1, i3, i3) -> i3
        %386 = "comb.xor"(%384, %310) : (i1, i1) -> i1
        %387 = "comb.and"(%381, %arg5) : (i1, i1) -> i1
        %388 = "comb.mux"(%387, %313, %385) : (i1, i3, i3) -> i3
        %389 = "comb.xor"(%387, %310) : (i1, i1) -> i1
        %390 = "comb.and"(%380, %arg4) : (i1, i1) -> i1
        %391 = "comb.mux"(%390, %312, %388) : (i1, i3, i3) -> i3
        %392 = "comb.xor"(%390, %310) : (i1, i1) -> i1
        %393 = "comb.mux"(%356, %357, %361) : (i1, i3, i3) -> i3
        %394 = "comb.and"(%340, %365) : (i1, i1) -> i1
        %395 = "comb.and"(%382, %372) : (i1, i1) -> i1
        %396 = "comb.and"(%348, %394) : (i1, i1) -> i1
        %397 = "comb.and"(%347, %353, %368) : (i1, i1, i1) -> i1
        %398 = "comb.or"(%395, %396, %397) : (i1, i1, i1) -> i1
        %399 = "comb.mux"(%398, %393, %391) : (i1, i3, i3) -> i3
        %400 = "comb.xor"(%398, %310) : (i1, i1) -> i1
        %401 = "comb.and"(%394, %arg4) : (i1, i1) -> i1
        %402 = "comb.mux"(%401, %312, %399) : (i1, i3, i3) -> i3
        %403 = "comb.xor"(%401, %310) : (i1, i1) -> i1
        %404 = "comb.mux"(%arg3, %316, %402) : (i1, i3, i3) -> i3
        %405 = "comb.xor"(%arg7, %310) : (i1, i1) -> i1
        %406 = "comb.and"(%383, %405) : (i1, i1) -> i1
        %407 = "comb.mux"(%406, %323, %404) : (i1, i3, i3) -> i3
        %408 = "comb.xor"(%406, %310) : (i1, i1) -> i1
        %409 = "comb.and"(%408, %365, %403, %400, %392, %389, %386, %378, %375, %364) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %410 = "comb.and"(%322) : (i1) -> i1
        "fsm.return"(%410) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_2}> ({
        %206 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %207 = "hw.constant"() <{value = true}> : () -> i1
        %208 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %209 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %210 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %211 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %212 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %213 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %214 = "hw.constant"() <{value = true}> : () -> i1
        %215 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %216 = "comb.xor"(%arg1, %214) : (i1, i1) -> i1
        %217 = "seq.initial"() ({
          %308 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%308) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %218 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %219 = "comb.icmp"(%304, %218) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %220 = "seq.compreg"(%304, %arg0, %216, %215, %217) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %221 = "comb.icmp"(%220, %213) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %222 = "comb.and"(%221, %arg2) : (i1, i1) -> i1
        %223 = "comb.icmp"(%220, %212) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %224 = "comb.icmp"(%220, %211) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %225 = "comb.icmp"(%220, %210) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %226 = "comb.icmp"(%220, %210) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %227 = "comb.icmp"(%304, %210) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %228 = "comb.and"(%226, %227) : (i1, i1) -> i1
        %229 = "comb.icmp"(%220, %211) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %230 = "comb.icmp"(%304, %211) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %231 = "comb.and"(%229, %230) : (i1, i1) -> i1
        %232 = "comb.and"(%221, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %233 = "comb.and"(%224, %arg6) : (i1, i1) -> i1
        %234 = "comb.or"(%arg4, %arg5, %arg3, %233) : (i1, i1, i1, i1) -> i1
        %235 = "comb.or"(%232, %234) : (i1, i1) -> i1
        %236 = "comb.xor"(%234, %207) : (i1, i1) -> i1
        %237 = "comb.icmp"(%220, %213) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %238 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %239 = "comb.icmp"(%220, %212) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %240 = "comb.icmp"(%220, %208) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %241 = "comb.icmp"(%220, %211) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %242 = "comb.mux"(%240, %arg8, %arg6) : (i1, i1, i1) -> i1
        %243 = "comb.mux"(%240, %211, %213) : (i1, i3, i3) -> i3
        %244 = "comb.icmp"(%220, %209) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %245 = "comb.xor"(%arg4, %207) : (i1, i1) -> i1
        %246 = "comb.and"(%237, %245) : (i1, i1) -> i1
        %247 = "comb.xor"(%237, %207) : (i1, i1) -> i1
        %248 = "comb.xor"(%239, %207) : (i1, i1) -> i1
        %249 = "comb.xor"(%240, %207) : (i1, i1) -> i1
        %250 = "comb.xor"(%241, %207) : (i1, i1) -> i1
        %251 = "comb.and"(%250, %249, %248, %247, %244) : (i1, i1, i1, i1, i1) -> i1
        %252 = "comb.or"(%251, %246) : (i1, i1) -> i1
        %253 = "comb.mux"(%252, %arg5, %242) : (i1, i1, i1) -> i1
        %254 = "comb.mux"(%252, %210, %243) : (i1, i3, i3) -> i3
        %255 = "comb.xor"(%246, %207) : (i1, i1) -> i1
        %256 = "comb.xor"(%238, %207) : (i1, i1) -> i1
        %257 = "comb.or"(%251, %255, %256) : (i1, i1, i1) -> i1
        %258 = "comb.mux"(%257, %220, %211) : (i1, i3, i3) -> i3
        %259 = "comb.icmp"(%220, %210) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %260 = "comb.mux"(%259, %220, %213) : (i1, i3, i3) -> i3
        %261 = "comb.xor"(%259, %207) : (i1, i1) -> i1
        %262 = "comb.xor"(%arg3, %207) : (i1, i1) -> i1
        %263 = "comb.and"(%247, %262) : (i1, i1) -> i1
        %264 = "comb.and"(%248, %263) : (i1, i1) -> i1
        %265 = "comb.and"(%249, %264) : (i1, i1) -> i1
        %266 = "comb.and"(%241, %265) : (i1, i1) -> i1
        %267 = "comb.and"(%240, %264) : (i1, i1) -> i1
        %268 = "comb.or"(%266, %267) : (i1, i1) -> i1
        %269 = "comb.and"(%245, %268) : (i1, i1) -> i1
        %270 = "comb.and"(%269, %arg5) : (i1, i1) -> i1
        %271 = "comb.mux"(%270, %210, %260) : (i1, i3, i3) -> i3
        %272 = "comb.xor"(%270, %207) : (i1, i1) -> i1
        %273 = "comb.and"(%268, %arg4) : (i1, i1) -> i1
        %274 = "comb.mux"(%273, %209, %271) : (i1, i3, i3) -> i3
        %275 = "comb.xor"(%273, %207) : (i1, i1) -> i1
        %276 = "comb.concat"(%206, %arg8) : (i2, i1) -> i3
        %277 = "comb.and"(%239, %263) : (i1, i1) -> i1
        %278 = "comb.and"(%245, %277) : (i1, i1) -> i1
        %279 = "comb.xor"(%arg5, %207) : (i1, i1) -> i1
        %280 = "comb.and"(%279, %278) : (i1, i1) -> i1
        %281 = "comb.and"(%arg7, %280) : (i1, i1) -> i1
        %282 = "comb.mux"(%281, %276, %274) : (i1, i3, i3) -> i3
        %283 = "comb.xor"(%281, %207) : (i1, i1) -> i1
        %284 = "comb.and"(%278, %arg5) : (i1, i1) -> i1
        %285 = "comb.mux"(%284, %210, %282) : (i1, i3, i3) -> i3
        %286 = "comb.xor"(%284, %207) : (i1, i1) -> i1
        %287 = "comb.and"(%277, %arg4) : (i1, i1) -> i1
        %288 = "comb.mux"(%287, %209, %285) : (i1, i3, i3) -> i3
        %289 = "comb.xor"(%287, %207) : (i1, i1) -> i1
        %290 = "comb.mux"(%253, %254, %258) : (i1, i3, i3) -> i3
        %291 = "comb.and"(%237, %262) : (i1, i1) -> i1
        %292 = "comb.and"(%279, %269) : (i1, i1) -> i1
        %293 = "comb.and"(%245, %291) : (i1, i1) -> i1
        %294 = "comb.and"(%244, %250, %265) : (i1, i1, i1) -> i1
        %295 = "comb.or"(%292, %293, %294) : (i1, i1, i1) -> i1
        %296 = "comb.mux"(%295, %290, %288) : (i1, i3, i3) -> i3
        %297 = "comb.xor"(%295, %207) : (i1, i1) -> i1
        %298 = "comb.and"(%291, %arg4) : (i1, i1) -> i1
        %299 = "comb.mux"(%298, %209, %296) : (i1, i3, i3) -> i3
        %300 = "comb.xor"(%298, %207) : (i1, i1) -> i1
        %301 = "comb.mux"(%arg3, %213, %299) : (i1, i3, i3) -> i3
        %302 = "comb.xor"(%arg7, %207) : (i1, i1) -> i1
        %303 = "comb.and"(%280, %302) : (i1, i1) -> i1
        %304 = "comb.mux"(%303, %220, %301) : (i1, i3, i3) -> i3
        %305 = "comb.xor"(%303, %207) : (i1, i1) -> i1
        %306 = "comb.and"(%305, %262, %300, %297, %289, %286, %283, %275, %272, %261) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %307 = "comb.and"(%219) : (i1) -> i1
        "fsm.return"(%307) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_1}> ({
        %103 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %104 = "hw.constant"() <{value = true}> : () -> i1
        %105 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %106 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %107 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %108 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %109 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %110 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %111 = "hw.constant"() <{value = true}> : () -> i1
        %112 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %113 = "comb.xor"(%arg1, %111) : (i1, i1) -> i1
        %114 = "seq.initial"() ({
          %205 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%205) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %115 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %116 = "comb.icmp"(%201, %115) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %117 = "seq.compreg"(%201, %arg0, %113, %112, %114) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %118 = "comb.icmp"(%117, %110) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %119 = "comb.and"(%118, %arg2) : (i1, i1) -> i1
        %120 = "comb.icmp"(%117, %109) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %121 = "comb.icmp"(%117, %108) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %122 = "comb.icmp"(%117, %107) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %123 = "comb.icmp"(%117, %107) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %124 = "comb.icmp"(%201, %107) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %125 = "comb.and"(%123, %124) : (i1, i1) -> i1
        %126 = "comb.icmp"(%117, %108) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %127 = "comb.icmp"(%201, %108) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %128 = "comb.and"(%126, %127) : (i1, i1) -> i1
        %129 = "comb.and"(%118, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %130 = "comb.and"(%121, %arg6) : (i1, i1) -> i1
        %131 = "comb.or"(%arg4, %arg5, %arg3, %130) : (i1, i1, i1, i1) -> i1
        %132 = "comb.or"(%129, %131) : (i1, i1) -> i1
        %133 = "comb.xor"(%131, %104) : (i1, i1) -> i1
        %134 = "comb.icmp"(%117, %110) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %135 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %136 = "comb.icmp"(%117, %109) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %137 = "comb.icmp"(%117, %105) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %138 = "comb.icmp"(%117, %108) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %139 = "comb.mux"(%137, %arg8, %arg6) : (i1, i1, i1) -> i1
        %140 = "comb.mux"(%137, %108, %110) : (i1, i3, i3) -> i3
        %141 = "comb.icmp"(%117, %106) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %142 = "comb.xor"(%arg4, %104) : (i1, i1) -> i1
        %143 = "comb.and"(%134, %142) : (i1, i1) -> i1
        %144 = "comb.xor"(%134, %104) : (i1, i1) -> i1
        %145 = "comb.xor"(%136, %104) : (i1, i1) -> i1
        %146 = "comb.xor"(%137, %104) : (i1, i1) -> i1
        %147 = "comb.xor"(%138, %104) : (i1, i1) -> i1
        %148 = "comb.and"(%147, %146, %145, %144, %141) : (i1, i1, i1, i1, i1) -> i1
        %149 = "comb.or"(%148, %143) : (i1, i1) -> i1
        %150 = "comb.mux"(%149, %arg5, %139) : (i1, i1, i1) -> i1
        %151 = "comb.mux"(%149, %107, %140) : (i1, i3, i3) -> i3
        %152 = "comb.xor"(%143, %104) : (i1, i1) -> i1
        %153 = "comb.xor"(%135, %104) : (i1, i1) -> i1
        %154 = "comb.or"(%148, %152, %153) : (i1, i1, i1) -> i1
        %155 = "comb.mux"(%154, %117, %108) : (i1, i3, i3) -> i3
        %156 = "comb.icmp"(%117, %107) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %157 = "comb.mux"(%156, %117, %110) : (i1, i3, i3) -> i3
        %158 = "comb.xor"(%156, %104) : (i1, i1) -> i1
        %159 = "comb.xor"(%arg3, %104) : (i1, i1) -> i1
        %160 = "comb.and"(%144, %159) : (i1, i1) -> i1
        %161 = "comb.and"(%145, %160) : (i1, i1) -> i1
        %162 = "comb.and"(%146, %161) : (i1, i1) -> i1
        %163 = "comb.and"(%138, %162) : (i1, i1) -> i1
        %164 = "comb.and"(%137, %161) : (i1, i1) -> i1
        %165 = "comb.or"(%163, %164) : (i1, i1) -> i1
        %166 = "comb.and"(%142, %165) : (i1, i1) -> i1
        %167 = "comb.and"(%166, %arg5) : (i1, i1) -> i1
        %168 = "comb.mux"(%167, %107, %157) : (i1, i3, i3) -> i3
        %169 = "comb.xor"(%167, %104) : (i1, i1) -> i1
        %170 = "comb.and"(%165, %arg4) : (i1, i1) -> i1
        %171 = "comb.mux"(%170, %106, %168) : (i1, i3, i3) -> i3
        %172 = "comb.xor"(%170, %104) : (i1, i1) -> i1
        %173 = "comb.concat"(%103, %arg8) : (i2, i1) -> i3
        %174 = "comb.and"(%136, %160) : (i1, i1) -> i1
        %175 = "comb.and"(%142, %174) : (i1, i1) -> i1
        %176 = "comb.xor"(%arg5, %104) : (i1, i1) -> i1
        %177 = "comb.and"(%176, %175) : (i1, i1) -> i1
        %178 = "comb.and"(%arg7, %177) : (i1, i1) -> i1
        %179 = "comb.mux"(%178, %173, %171) : (i1, i3, i3) -> i3
        %180 = "comb.xor"(%178, %104) : (i1, i1) -> i1
        %181 = "comb.and"(%175, %arg5) : (i1, i1) -> i1
        %182 = "comb.mux"(%181, %107, %179) : (i1, i3, i3) -> i3
        %183 = "comb.xor"(%181, %104) : (i1, i1) -> i1
        %184 = "comb.and"(%174, %arg4) : (i1, i1) -> i1
        %185 = "comb.mux"(%184, %106, %182) : (i1, i3, i3) -> i3
        %186 = "comb.xor"(%184, %104) : (i1, i1) -> i1
        %187 = "comb.mux"(%150, %151, %155) : (i1, i3, i3) -> i3
        %188 = "comb.and"(%134, %159) : (i1, i1) -> i1
        %189 = "comb.and"(%176, %166) : (i1, i1) -> i1
        %190 = "comb.and"(%142, %188) : (i1, i1) -> i1
        %191 = "comb.and"(%141, %147, %162) : (i1, i1, i1) -> i1
        %192 = "comb.or"(%189, %190, %191) : (i1, i1, i1) -> i1
        %193 = "comb.mux"(%192, %187, %185) : (i1, i3, i3) -> i3
        %194 = "comb.xor"(%192, %104) : (i1, i1) -> i1
        %195 = "comb.and"(%188, %arg4) : (i1, i1) -> i1
        %196 = "comb.mux"(%195, %106, %193) : (i1, i3, i3) -> i3
        %197 = "comb.xor"(%195, %104) : (i1, i1) -> i1
        %198 = "comb.mux"(%arg3, %110, %196) : (i1, i3, i3) -> i3
        %199 = "comb.xor"(%arg7, %104) : (i1, i1) -> i1
        %200 = "comb.and"(%177, %199) : (i1, i1) -> i1
        %201 = "comb.mux"(%200, %117, %198) : (i1, i3, i3) -> i3
        %202 = "comb.xor"(%200, %104) : (i1, i1) -> i1
        %203 = "comb.and"(%202, %159, %197, %194, %186, %183, %180, %172, %169, %158) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %204 = "comb.and"(%116) : (i1) -> i1
        "fsm.return"(%204) : (i1) -> ()
      }, {
      }) : () -> ()
      "fsm.transition"() <{nextState = @state_0}> ({
        %0 = "hw.constant"() <{value = 1 : i2}> : () -> i2
        %1 = "hw.constant"() <{value = true}> : () -> i1
        %2 = "hw.constant"() <{value = 2 : i3}> : () -> i3
        %3 = "hw.constant"() <{value = -4 : i3}> : () -> i3
        %4 = "hw.constant"() <{value = -3 : i3}> : () -> i3
        %5 = "hw.constant"() <{value = 3 : i3}> : () -> i3
        %6 = "hw.constant"() <{value = 1 : i3}> : () -> i3
        %7 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %8 = "hw.constant"() <{value = true}> : () -> i1
        %9 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %10 = "comb.xor"(%arg1, %8) : (i1, i1) -> i1
        %11 = "seq.initial"() ({
          %102 = "hw.constant"() <{value = 0 : i3}> : () -> i3
          "seq.yield"(%102) : (i3) -> ()
        }) : () -> !seq.immutable<i3>
        %12 = "hw.constant"() <{value = 0 : i3}> : () -> i3
        %13 = "comb.icmp"(%98, %12) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %14 = "seq.compreg"(%98, %arg0, %10, %9, %11) <{name = "aff_ctrl_state_q/q_o", operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (i3, !seq.clock, i1, i3, !seq.immutable<i3>) -> i3
        %15 = "comb.icmp"(%14, %7) <{predicate = 0 : i64}> {sv.namehint = "mbx_idle"} : (i3, i3) -> i1
        %16 = "comb.and"(%15, %arg2) : (i1, i1) -> i1
        %17 = "comb.icmp"(%14, %6) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %18 = "comb.icmp"(%14, %5) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %19 = "comb.icmp"(%14, %4) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %20 = "comb.icmp"(%14, %4) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %21 = "comb.icmp"(%98, %4) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %22 = "comb.and"(%20, %21) : (i1, i1) -> i1
        %23 = "comb.icmp"(%14, %5) <{predicate = 1 : i64}> : (i3, i3) -> i1
        %24 = "comb.icmp"(%98, %5) <{predicate = 0 : i64}> : (i3, i3) -> i1
        %25 = "comb.and"(%23, %24) : (i1, i1) -> i1
        %26 = "comb.and"(%15, %arg2, %arg7) {sv.namehint = "ombx_set_ready"} : (i1, i1, i1) -> i1
        %27 = "comb.and"(%18, %arg6) : (i1, i1) -> i1
        %28 = "comb.or"(%arg4, %arg5, %arg3, %27) : (i1, i1, i1, i1) -> i1
        %29 = "comb.or"(%26, %28) : (i1, i1) -> i1
        %30 = "comb.xor"(%28, %1) : (i1, i1) -> i1
        %31 = "comb.icmp"(%14, %7) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %32 = "comb.and"(%arg2, %arg7) : (i1, i1) -> i1
        %33 = "comb.icmp"(%14, %6) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %34 = "comb.icmp"(%14, %2) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %35 = "comb.icmp"(%14, %5) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %36 = "comb.mux"(%34, %arg8, %arg6) : (i1, i1, i1) -> i1
        %37 = "comb.mux"(%34, %5, %7) : (i1, i3, i3) -> i3
        %38 = "comb.icmp"(%14, %3) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %39 = "comb.xor"(%arg4, %1) : (i1, i1) -> i1
        %40 = "comb.and"(%31, %39) : (i1, i1) -> i1
        %41 = "comb.xor"(%31, %1) : (i1, i1) -> i1
        %42 = "comb.xor"(%33, %1) : (i1, i1) -> i1
        %43 = "comb.xor"(%34, %1) : (i1, i1) -> i1
        %44 = "comb.xor"(%35, %1) : (i1, i1) -> i1
        %45 = "comb.and"(%44, %43, %42, %41, %38) : (i1, i1, i1, i1, i1) -> i1
        %46 = "comb.or"(%45, %40) : (i1, i1) -> i1
        %47 = "comb.mux"(%46, %arg5, %36) : (i1, i1, i1) -> i1
        %48 = "comb.mux"(%46, %4, %37) : (i1, i3, i3) -> i3
        %49 = "comb.xor"(%40, %1) : (i1, i1) -> i1
        %50 = "comb.xor"(%32, %1) : (i1, i1) -> i1
        %51 = "comb.or"(%45, %49, %50) : (i1, i1, i1) -> i1
        %52 = "comb.mux"(%51, %14, %5) : (i1, i3, i3) -> i3
        %53 = "comb.icmp"(%14, %4) <{predicate = 10 : i64}> : (i3, i3) -> i1
        %54 = "comb.mux"(%53, %14, %7) : (i1, i3, i3) -> i3
        %55 = "comb.xor"(%53, %1) : (i1, i1) -> i1
        %56 = "comb.xor"(%arg3, %1) : (i1, i1) -> i1
        %57 = "comb.and"(%41, %56) : (i1, i1) -> i1
        %58 = "comb.and"(%42, %57) : (i1, i1) -> i1
        %59 = "comb.and"(%43, %58) : (i1, i1) -> i1
        %60 = "comb.and"(%35, %59) : (i1, i1) -> i1
        %61 = "comb.and"(%34, %58) : (i1, i1) -> i1
        %62 = "comb.or"(%60, %61) : (i1, i1) -> i1
        %63 = "comb.and"(%39, %62) : (i1, i1) -> i1
        %64 = "comb.and"(%63, %arg5) : (i1, i1) -> i1
        %65 = "comb.mux"(%64, %4, %54) : (i1, i3, i3) -> i3
        %66 = "comb.xor"(%64, %1) : (i1, i1) -> i1
        %67 = "comb.and"(%62, %arg4) : (i1, i1) -> i1
        %68 = "comb.mux"(%67, %3, %65) : (i1, i3, i3) -> i3
        %69 = "comb.xor"(%67, %1) : (i1, i1) -> i1
        %70 = "comb.concat"(%0, %arg8) : (i2, i1) -> i3
        %71 = "comb.and"(%33, %57) : (i1, i1) -> i1
        %72 = "comb.and"(%39, %71) : (i1, i1) -> i1
        %73 = "comb.xor"(%arg5, %1) : (i1, i1) -> i1
        %74 = "comb.and"(%73, %72) : (i1, i1) -> i1
        %75 = "comb.and"(%arg7, %74) : (i1, i1) -> i1
        %76 = "comb.mux"(%75, %70, %68) : (i1, i3, i3) -> i3
        %77 = "comb.xor"(%75, %1) : (i1, i1) -> i1
        %78 = "comb.and"(%72, %arg5) : (i1, i1) -> i1
        %79 = "comb.mux"(%78, %4, %76) : (i1, i3, i3) -> i3
        %80 = "comb.xor"(%78, %1) : (i1, i1) -> i1
        %81 = "comb.and"(%71, %arg4) : (i1, i1) -> i1
        %82 = "comb.mux"(%81, %3, %79) : (i1, i3, i3) -> i3
        %83 = "comb.xor"(%81, %1) : (i1, i1) -> i1
        %84 = "comb.mux"(%47, %48, %52) : (i1, i3, i3) -> i3
        %85 = "comb.and"(%31, %56) : (i1, i1) -> i1
        %86 = "comb.and"(%73, %63) : (i1, i1) -> i1
        %87 = "comb.and"(%39, %85) : (i1, i1) -> i1
        %88 = "comb.and"(%38, %44, %59) : (i1, i1, i1) -> i1
        %89 = "comb.or"(%86, %87, %88) : (i1, i1, i1) -> i1
        %90 = "comb.mux"(%89, %84, %82) : (i1, i3, i3) -> i3
        %91 = "comb.xor"(%89, %1) : (i1, i1) -> i1
        %92 = "comb.and"(%85, %arg4) : (i1, i1) -> i1
        %93 = "comb.mux"(%92, %3, %90) : (i1, i3, i3) -> i3
        %94 = "comb.xor"(%92, %1) : (i1, i1) -> i1
        %95 = "comb.mux"(%arg3, %7, %93) : (i1, i3, i3) -> i3
        %96 = "comb.xor"(%arg7, %1) : (i1, i1) -> i1
        %97 = "comb.and"(%74, %96) : (i1, i1) -> i1
        %98 = "comb.mux"(%97, %14, %95) : (i1, i3, i3) -> i3
        %99 = "comb.xor"(%97, %1) : (i1, i1) -> i1
        %100 = "comb.and"(%99, %56, %94, %91, %83, %80, %77, %69, %66, %55) : (i1, i1, i1, i1, i1, i1, i1, i1, i1, i1) -> i1
        %101 = "comb.and"(%13) : (i1) -> i1
        "fsm.return"(%101) : (i1) -> ()
      }, {
      }) : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()


