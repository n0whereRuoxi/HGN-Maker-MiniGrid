( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_693 - SURFACE
      ?auto_694 - SURFACE
    )
    :vars
    (
      ?auto_695 - HOIST
      ?auto_696 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_695 ?auto_696 ) ( SURFACE-AT ?auto_693 ?auto_696 ) ( CLEAR ?auto_693 ) ( LIFTING ?auto_695 ?auto_694 ) ( IS-CRATE ?auto_694 ) ( not ( = ?auto_693 ?auto_694 ) ) )
    :subtasks
    ( ( !DROP ?auto_695 ?auto_694 ?auto_693 ?auto_696 )
      ( MAKE-1CRATE-VERIFY ?auto_693 ?auto_694 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_697 - SURFACE
      ?auto_698 - SURFACE
    )
    :vars
    (
      ?auto_699 - HOIST
      ?auto_700 - PLACE
      ?auto_701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699 ?auto_700 ) ( SURFACE-AT ?auto_697 ?auto_700 ) ( CLEAR ?auto_697 ) ( IS-CRATE ?auto_698 ) ( not ( = ?auto_697 ?auto_698 ) ) ( TRUCK-AT ?auto_701 ?auto_700 ) ( AVAILABLE ?auto_699 ) ( IN ?auto_698 ?auto_701 ) )
    :subtasks
    ( ( !UNLOAD ?auto_699 ?auto_698 ?auto_701 ?auto_700 )
      ( MAKE-1CRATE ?auto_697 ?auto_698 )
      ( MAKE-1CRATE-VERIFY ?auto_697 ?auto_698 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_702 - SURFACE
      ?auto_703 - SURFACE
    )
    :vars
    (
      ?auto_705 - HOIST
      ?auto_704 - PLACE
      ?auto_706 - TRUCK
      ?auto_707 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_705 ?auto_704 ) ( SURFACE-AT ?auto_702 ?auto_704 ) ( CLEAR ?auto_702 ) ( IS-CRATE ?auto_703 ) ( not ( = ?auto_702 ?auto_703 ) ) ( AVAILABLE ?auto_705 ) ( IN ?auto_703 ?auto_706 ) ( TRUCK-AT ?auto_706 ?auto_707 ) ( not ( = ?auto_707 ?auto_704 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_706 ?auto_707 ?auto_704 )
      ( MAKE-1CRATE ?auto_702 ?auto_703 )
      ( MAKE-1CRATE-VERIFY ?auto_702 ?auto_703 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_708 - SURFACE
      ?auto_709 - SURFACE
    )
    :vars
    (
      ?auto_713 - HOIST
      ?auto_710 - PLACE
      ?auto_711 - TRUCK
      ?auto_712 - PLACE
      ?auto_714 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_713 ?auto_710 ) ( SURFACE-AT ?auto_708 ?auto_710 ) ( CLEAR ?auto_708 ) ( IS-CRATE ?auto_709 ) ( not ( = ?auto_708 ?auto_709 ) ) ( AVAILABLE ?auto_713 ) ( TRUCK-AT ?auto_711 ?auto_712 ) ( not ( = ?auto_712 ?auto_710 ) ) ( HOIST-AT ?auto_714 ?auto_712 ) ( LIFTING ?auto_714 ?auto_709 ) ( not ( = ?auto_713 ?auto_714 ) ) )
    :subtasks
    ( ( !LOAD ?auto_714 ?auto_709 ?auto_711 ?auto_712 )
      ( MAKE-1CRATE ?auto_708 ?auto_709 )
      ( MAKE-1CRATE-VERIFY ?auto_708 ?auto_709 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_715 - SURFACE
      ?auto_716 - SURFACE
    )
    :vars
    (
      ?auto_719 - HOIST
      ?auto_717 - PLACE
      ?auto_721 - TRUCK
      ?auto_720 - PLACE
      ?auto_718 - HOIST
      ?auto_722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_719 ?auto_717 ) ( SURFACE-AT ?auto_715 ?auto_717 ) ( CLEAR ?auto_715 ) ( IS-CRATE ?auto_716 ) ( not ( = ?auto_715 ?auto_716 ) ) ( AVAILABLE ?auto_719 ) ( TRUCK-AT ?auto_721 ?auto_720 ) ( not ( = ?auto_720 ?auto_717 ) ) ( HOIST-AT ?auto_718 ?auto_720 ) ( not ( = ?auto_719 ?auto_718 ) ) ( AVAILABLE ?auto_718 ) ( SURFACE-AT ?auto_716 ?auto_720 ) ( ON ?auto_716 ?auto_722 ) ( CLEAR ?auto_716 ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_716 ?auto_722 ) ) )
    :subtasks
    ( ( !LIFT ?auto_718 ?auto_716 ?auto_722 ?auto_720 )
      ( MAKE-1CRATE ?auto_715 ?auto_716 )
      ( MAKE-1CRATE-VERIFY ?auto_715 ?auto_716 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_723 - SURFACE
      ?auto_724 - SURFACE
    )
    :vars
    (
      ?auto_728 - HOIST
      ?auto_730 - PLACE
      ?auto_726 - PLACE
      ?auto_725 - HOIST
      ?auto_729 - SURFACE
      ?auto_727 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_728 ?auto_730 ) ( SURFACE-AT ?auto_723 ?auto_730 ) ( CLEAR ?auto_723 ) ( IS-CRATE ?auto_724 ) ( not ( = ?auto_723 ?auto_724 ) ) ( AVAILABLE ?auto_728 ) ( not ( = ?auto_726 ?auto_730 ) ) ( HOIST-AT ?auto_725 ?auto_726 ) ( not ( = ?auto_728 ?auto_725 ) ) ( AVAILABLE ?auto_725 ) ( SURFACE-AT ?auto_724 ?auto_726 ) ( ON ?auto_724 ?auto_729 ) ( CLEAR ?auto_724 ) ( not ( = ?auto_723 ?auto_729 ) ) ( not ( = ?auto_724 ?auto_729 ) ) ( TRUCK-AT ?auto_727 ?auto_730 ) )
    :subtasks
    ( ( !DRIVE ?auto_727 ?auto_730 ?auto_726 )
      ( MAKE-1CRATE ?auto_723 ?auto_724 )
      ( MAKE-1CRATE-VERIFY ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_740 - SURFACE
      ?auto_741 - SURFACE
      ?auto_742 - SURFACE
    )
    :vars
    (
      ?auto_743 - HOIST
      ?auto_744 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_743 ?auto_744 ) ( SURFACE-AT ?auto_741 ?auto_744 ) ( CLEAR ?auto_741 ) ( LIFTING ?auto_743 ?auto_742 ) ( IS-CRATE ?auto_742 ) ( not ( = ?auto_741 ?auto_742 ) ) ( ON ?auto_741 ?auto_740 ) ( not ( = ?auto_740 ?auto_741 ) ) ( not ( = ?auto_740 ?auto_742 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_741 ?auto_742 )
      ( MAKE-2CRATE-VERIFY ?auto_740 ?auto_741 ?auto_742 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_750 - SURFACE
      ?auto_751 - SURFACE
      ?auto_752 - SURFACE
    )
    :vars
    (
      ?auto_755 - HOIST
      ?auto_754 - PLACE
      ?auto_753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_755 ?auto_754 ) ( SURFACE-AT ?auto_751 ?auto_754 ) ( CLEAR ?auto_751 ) ( IS-CRATE ?auto_752 ) ( not ( = ?auto_751 ?auto_752 ) ) ( TRUCK-AT ?auto_753 ?auto_754 ) ( AVAILABLE ?auto_755 ) ( IN ?auto_752 ?auto_753 ) ( ON ?auto_751 ?auto_750 ) ( not ( = ?auto_750 ?auto_751 ) ) ( not ( = ?auto_750 ?auto_752 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_751 ?auto_752 )
      ( MAKE-2CRATE-VERIFY ?auto_750 ?auto_751 ?auto_752 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_756 - SURFACE
      ?auto_757 - SURFACE
    )
    :vars
    (
      ?auto_758 - HOIST
      ?auto_759 - PLACE
      ?auto_760 - TRUCK
      ?auto_761 - SURFACE
      ?auto_762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_758 ?auto_759 ) ( SURFACE-AT ?auto_756 ?auto_759 ) ( CLEAR ?auto_756 ) ( IS-CRATE ?auto_757 ) ( not ( = ?auto_756 ?auto_757 ) ) ( AVAILABLE ?auto_758 ) ( IN ?auto_757 ?auto_760 ) ( ON ?auto_756 ?auto_761 ) ( not ( = ?auto_761 ?auto_756 ) ) ( not ( = ?auto_761 ?auto_757 ) ) ( TRUCK-AT ?auto_760 ?auto_762 ) ( not ( = ?auto_762 ?auto_759 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_760 ?auto_762 ?auto_759 )
      ( MAKE-2CRATE ?auto_761 ?auto_756 ?auto_757 )
      ( MAKE-1CRATE-VERIFY ?auto_756 ?auto_757 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_763 - SURFACE
      ?auto_764 - SURFACE
      ?auto_765 - SURFACE
    )
    :vars
    (
      ?auto_768 - HOIST
      ?auto_766 - PLACE
      ?auto_769 - TRUCK
      ?auto_767 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_768 ?auto_766 ) ( SURFACE-AT ?auto_764 ?auto_766 ) ( CLEAR ?auto_764 ) ( IS-CRATE ?auto_765 ) ( not ( = ?auto_764 ?auto_765 ) ) ( AVAILABLE ?auto_768 ) ( IN ?auto_765 ?auto_769 ) ( ON ?auto_764 ?auto_763 ) ( not ( = ?auto_763 ?auto_764 ) ) ( not ( = ?auto_763 ?auto_765 ) ) ( TRUCK-AT ?auto_769 ?auto_767 ) ( not ( = ?auto_767 ?auto_766 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_764 ?auto_765 )
      ( MAKE-2CRATE-VERIFY ?auto_763 ?auto_764 ?auto_765 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_770 - SURFACE
      ?auto_771 - SURFACE
    )
    :vars
    (
      ?auto_772 - HOIST
      ?auto_775 - PLACE
      ?auto_776 - SURFACE
      ?auto_773 - TRUCK
      ?auto_774 - PLACE
      ?auto_777 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_772 ?auto_775 ) ( SURFACE-AT ?auto_770 ?auto_775 ) ( CLEAR ?auto_770 ) ( IS-CRATE ?auto_771 ) ( not ( = ?auto_770 ?auto_771 ) ) ( AVAILABLE ?auto_772 ) ( ON ?auto_770 ?auto_776 ) ( not ( = ?auto_776 ?auto_770 ) ) ( not ( = ?auto_776 ?auto_771 ) ) ( TRUCK-AT ?auto_773 ?auto_774 ) ( not ( = ?auto_774 ?auto_775 ) ) ( HOIST-AT ?auto_777 ?auto_774 ) ( LIFTING ?auto_777 ?auto_771 ) ( not ( = ?auto_772 ?auto_777 ) ) )
    :subtasks
    ( ( !LOAD ?auto_777 ?auto_771 ?auto_773 ?auto_774 )
      ( MAKE-2CRATE ?auto_776 ?auto_770 ?auto_771 )
      ( MAKE-1CRATE-VERIFY ?auto_770 ?auto_771 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_778 - SURFACE
      ?auto_779 - SURFACE
      ?auto_780 - SURFACE
    )
    :vars
    (
      ?auto_782 - HOIST
      ?auto_785 - PLACE
      ?auto_784 - TRUCK
      ?auto_781 - PLACE
      ?auto_783 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_782 ?auto_785 ) ( SURFACE-AT ?auto_779 ?auto_785 ) ( CLEAR ?auto_779 ) ( IS-CRATE ?auto_780 ) ( not ( = ?auto_779 ?auto_780 ) ) ( AVAILABLE ?auto_782 ) ( ON ?auto_779 ?auto_778 ) ( not ( = ?auto_778 ?auto_779 ) ) ( not ( = ?auto_778 ?auto_780 ) ) ( TRUCK-AT ?auto_784 ?auto_781 ) ( not ( = ?auto_781 ?auto_785 ) ) ( HOIST-AT ?auto_783 ?auto_781 ) ( LIFTING ?auto_783 ?auto_780 ) ( not ( = ?auto_782 ?auto_783 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_779 ?auto_780 )
      ( MAKE-2CRATE-VERIFY ?auto_778 ?auto_779 ?auto_780 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_786 - SURFACE
      ?auto_787 - SURFACE
    )
    :vars
    (
      ?auto_789 - HOIST
      ?auto_792 - PLACE
      ?auto_788 - SURFACE
      ?auto_790 - TRUCK
      ?auto_791 - PLACE
      ?auto_793 - HOIST
      ?auto_794 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_789 ?auto_792 ) ( SURFACE-AT ?auto_786 ?auto_792 ) ( CLEAR ?auto_786 ) ( IS-CRATE ?auto_787 ) ( not ( = ?auto_786 ?auto_787 ) ) ( AVAILABLE ?auto_789 ) ( ON ?auto_786 ?auto_788 ) ( not ( = ?auto_788 ?auto_786 ) ) ( not ( = ?auto_788 ?auto_787 ) ) ( TRUCK-AT ?auto_790 ?auto_791 ) ( not ( = ?auto_791 ?auto_792 ) ) ( HOIST-AT ?auto_793 ?auto_791 ) ( not ( = ?auto_789 ?auto_793 ) ) ( AVAILABLE ?auto_793 ) ( SURFACE-AT ?auto_787 ?auto_791 ) ( ON ?auto_787 ?auto_794 ) ( CLEAR ?auto_787 ) ( not ( = ?auto_786 ?auto_794 ) ) ( not ( = ?auto_787 ?auto_794 ) ) ( not ( = ?auto_788 ?auto_794 ) ) )
    :subtasks
    ( ( !LIFT ?auto_793 ?auto_787 ?auto_794 ?auto_791 )
      ( MAKE-2CRATE ?auto_788 ?auto_786 ?auto_787 )
      ( MAKE-1CRATE-VERIFY ?auto_786 ?auto_787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_795 - SURFACE
      ?auto_796 - SURFACE
      ?auto_797 - SURFACE
    )
    :vars
    (
      ?auto_802 - HOIST
      ?auto_801 - PLACE
      ?auto_799 - TRUCK
      ?auto_798 - PLACE
      ?auto_803 - HOIST
      ?auto_800 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_802 ?auto_801 ) ( SURFACE-AT ?auto_796 ?auto_801 ) ( CLEAR ?auto_796 ) ( IS-CRATE ?auto_797 ) ( not ( = ?auto_796 ?auto_797 ) ) ( AVAILABLE ?auto_802 ) ( ON ?auto_796 ?auto_795 ) ( not ( = ?auto_795 ?auto_796 ) ) ( not ( = ?auto_795 ?auto_797 ) ) ( TRUCK-AT ?auto_799 ?auto_798 ) ( not ( = ?auto_798 ?auto_801 ) ) ( HOIST-AT ?auto_803 ?auto_798 ) ( not ( = ?auto_802 ?auto_803 ) ) ( AVAILABLE ?auto_803 ) ( SURFACE-AT ?auto_797 ?auto_798 ) ( ON ?auto_797 ?auto_800 ) ( CLEAR ?auto_797 ) ( not ( = ?auto_796 ?auto_800 ) ) ( not ( = ?auto_797 ?auto_800 ) ) ( not ( = ?auto_795 ?auto_800 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_796 ?auto_797 )
      ( MAKE-2CRATE-VERIFY ?auto_795 ?auto_796 ?auto_797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_804 - SURFACE
      ?auto_805 - SURFACE
    )
    :vars
    (
      ?auto_806 - HOIST
      ?auto_812 - PLACE
      ?auto_811 - SURFACE
      ?auto_810 - PLACE
      ?auto_808 - HOIST
      ?auto_807 - SURFACE
      ?auto_809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_806 ?auto_812 ) ( SURFACE-AT ?auto_804 ?auto_812 ) ( CLEAR ?auto_804 ) ( IS-CRATE ?auto_805 ) ( not ( = ?auto_804 ?auto_805 ) ) ( AVAILABLE ?auto_806 ) ( ON ?auto_804 ?auto_811 ) ( not ( = ?auto_811 ?auto_804 ) ) ( not ( = ?auto_811 ?auto_805 ) ) ( not ( = ?auto_810 ?auto_812 ) ) ( HOIST-AT ?auto_808 ?auto_810 ) ( not ( = ?auto_806 ?auto_808 ) ) ( AVAILABLE ?auto_808 ) ( SURFACE-AT ?auto_805 ?auto_810 ) ( ON ?auto_805 ?auto_807 ) ( CLEAR ?auto_805 ) ( not ( = ?auto_804 ?auto_807 ) ) ( not ( = ?auto_805 ?auto_807 ) ) ( not ( = ?auto_811 ?auto_807 ) ) ( TRUCK-AT ?auto_809 ?auto_812 ) )
    :subtasks
    ( ( !DRIVE ?auto_809 ?auto_812 ?auto_810 )
      ( MAKE-2CRATE ?auto_811 ?auto_804 ?auto_805 )
      ( MAKE-1CRATE-VERIFY ?auto_804 ?auto_805 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_813 - SURFACE
      ?auto_814 - SURFACE
      ?auto_815 - SURFACE
    )
    :vars
    (
      ?auto_820 - HOIST
      ?auto_821 - PLACE
      ?auto_816 - PLACE
      ?auto_819 - HOIST
      ?auto_817 - SURFACE
      ?auto_818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_820 ?auto_821 ) ( SURFACE-AT ?auto_814 ?auto_821 ) ( CLEAR ?auto_814 ) ( IS-CRATE ?auto_815 ) ( not ( = ?auto_814 ?auto_815 ) ) ( AVAILABLE ?auto_820 ) ( ON ?auto_814 ?auto_813 ) ( not ( = ?auto_813 ?auto_814 ) ) ( not ( = ?auto_813 ?auto_815 ) ) ( not ( = ?auto_816 ?auto_821 ) ) ( HOIST-AT ?auto_819 ?auto_816 ) ( not ( = ?auto_820 ?auto_819 ) ) ( AVAILABLE ?auto_819 ) ( SURFACE-AT ?auto_815 ?auto_816 ) ( ON ?auto_815 ?auto_817 ) ( CLEAR ?auto_815 ) ( not ( = ?auto_814 ?auto_817 ) ) ( not ( = ?auto_815 ?auto_817 ) ) ( not ( = ?auto_813 ?auto_817 ) ) ( TRUCK-AT ?auto_818 ?auto_821 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_814 ?auto_815 )
      ( MAKE-2CRATE-VERIFY ?auto_813 ?auto_814 ?auto_815 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_827 - HOIST
      ?auto_829 - PLACE
      ?auto_826 - SURFACE
      ?auto_828 - PLACE
      ?auto_830 - HOIST
      ?auto_824 - SURFACE
      ?auto_825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_827 ?auto_829 ) ( IS-CRATE ?auto_823 ) ( not ( = ?auto_822 ?auto_823 ) ) ( not ( = ?auto_826 ?auto_822 ) ) ( not ( = ?auto_826 ?auto_823 ) ) ( not ( = ?auto_828 ?auto_829 ) ) ( HOIST-AT ?auto_830 ?auto_828 ) ( not ( = ?auto_827 ?auto_830 ) ) ( AVAILABLE ?auto_830 ) ( SURFACE-AT ?auto_823 ?auto_828 ) ( ON ?auto_823 ?auto_824 ) ( CLEAR ?auto_823 ) ( not ( = ?auto_822 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_824 ) ) ( not ( = ?auto_826 ?auto_824 ) ) ( TRUCK-AT ?auto_825 ?auto_829 ) ( SURFACE-AT ?auto_826 ?auto_829 ) ( CLEAR ?auto_826 ) ( LIFTING ?auto_827 ?auto_822 ) ( IS-CRATE ?auto_822 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_826 ?auto_822 )
      ( MAKE-2CRATE ?auto_826 ?auto_822 ?auto_823 )
      ( MAKE-1CRATE-VERIFY ?auto_822 ?auto_823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_831 - SURFACE
      ?auto_832 - SURFACE
      ?auto_833 - SURFACE
    )
    :vars
    (
      ?auto_835 - HOIST
      ?auto_836 - PLACE
      ?auto_834 - PLACE
      ?auto_838 - HOIST
      ?auto_837 - SURFACE
      ?auto_839 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_835 ?auto_836 ) ( IS-CRATE ?auto_833 ) ( not ( = ?auto_832 ?auto_833 ) ) ( not ( = ?auto_831 ?auto_832 ) ) ( not ( = ?auto_831 ?auto_833 ) ) ( not ( = ?auto_834 ?auto_836 ) ) ( HOIST-AT ?auto_838 ?auto_834 ) ( not ( = ?auto_835 ?auto_838 ) ) ( AVAILABLE ?auto_838 ) ( SURFACE-AT ?auto_833 ?auto_834 ) ( ON ?auto_833 ?auto_837 ) ( CLEAR ?auto_833 ) ( not ( = ?auto_832 ?auto_837 ) ) ( not ( = ?auto_833 ?auto_837 ) ) ( not ( = ?auto_831 ?auto_837 ) ) ( TRUCK-AT ?auto_839 ?auto_836 ) ( SURFACE-AT ?auto_831 ?auto_836 ) ( CLEAR ?auto_831 ) ( LIFTING ?auto_835 ?auto_832 ) ( IS-CRATE ?auto_832 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_832 ?auto_833 )
      ( MAKE-2CRATE-VERIFY ?auto_831 ?auto_832 ?auto_833 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_840 - SURFACE
      ?auto_841 - SURFACE
    )
    :vars
    (
      ?auto_847 - HOIST
      ?auto_846 - PLACE
      ?auto_845 - SURFACE
      ?auto_848 - PLACE
      ?auto_843 - HOIST
      ?auto_842 - SURFACE
      ?auto_844 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_847 ?auto_846 ) ( IS-CRATE ?auto_841 ) ( not ( = ?auto_840 ?auto_841 ) ) ( not ( = ?auto_845 ?auto_840 ) ) ( not ( = ?auto_845 ?auto_841 ) ) ( not ( = ?auto_848 ?auto_846 ) ) ( HOIST-AT ?auto_843 ?auto_848 ) ( not ( = ?auto_847 ?auto_843 ) ) ( AVAILABLE ?auto_843 ) ( SURFACE-AT ?auto_841 ?auto_848 ) ( ON ?auto_841 ?auto_842 ) ( CLEAR ?auto_841 ) ( not ( = ?auto_840 ?auto_842 ) ) ( not ( = ?auto_841 ?auto_842 ) ) ( not ( = ?auto_845 ?auto_842 ) ) ( TRUCK-AT ?auto_844 ?auto_846 ) ( SURFACE-AT ?auto_845 ?auto_846 ) ( CLEAR ?auto_845 ) ( IS-CRATE ?auto_840 ) ( AVAILABLE ?auto_847 ) ( IN ?auto_840 ?auto_844 ) )
    :subtasks
    ( ( !UNLOAD ?auto_847 ?auto_840 ?auto_844 ?auto_846 )
      ( MAKE-2CRATE ?auto_845 ?auto_840 ?auto_841 )
      ( MAKE-1CRATE-VERIFY ?auto_840 ?auto_841 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_849 - SURFACE
      ?auto_850 - SURFACE
      ?auto_851 - SURFACE
    )
    :vars
    (
      ?auto_852 - HOIST
      ?auto_853 - PLACE
      ?auto_856 - PLACE
      ?auto_854 - HOIST
      ?auto_855 - SURFACE
      ?auto_857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_852 ?auto_853 ) ( IS-CRATE ?auto_851 ) ( not ( = ?auto_850 ?auto_851 ) ) ( not ( = ?auto_849 ?auto_850 ) ) ( not ( = ?auto_849 ?auto_851 ) ) ( not ( = ?auto_856 ?auto_853 ) ) ( HOIST-AT ?auto_854 ?auto_856 ) ( not ( = ?auto_852 ?auto_854 ) ) ( AVAILABLE ?auto_854 ) ( SURFACE-AT ?auto_851 ?auto_856 ) ( ON ?auto_851 ?auto_855 ) ( CLEAR ?auto_851 ) ( not ( = ?auto_850 ?auto_855 ) ) ( not ( = ?auto_851 ?auto_855 ) ) ( not ( = ?auto_849 ?auto_855 ) ) ( TRUCK-AT ?auto_857 ?auto_853 ) ( SURFACE-AT ?auto_849 ?auto_853 ) ( CLEAR ?auto_849 ) ( IS-CRATE ?auto_850 ) ( AVAILABLE ?auto_852 ) ( IN ?auto_850 ?auto_857 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_850 ?auto_851 )
      ( MAKE-2CRATE-VERIFY ?auto_849 ?auto_850 ?auto_851 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_894 - SURFACE
      ?auto_895 - SURFACE
    )
    :vars
    (
      ?auto_900 - HOIST
      ?auto_896 - PLACE
      ?auto_899 - SURFACE
      ?auto_898 - PLACE
      ?auto_902 - HOIST
      ?auto_897 - SURFACE
      ?auto_901 - TRUCK
      ?auto_903 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_900 ?auto_896 ) ( SURFACE-AT ?auto_894 ?auto_896 ) ( CLEAR ?auto_894 ) ( IS-CRATE ?auto_895 ) ( not ( = ?auto_894 ?auto_895 ) ) ( AVAILABLE ?auto_900 ) ( ON ?auto_894 ?auto_899 ) ( not ( = ?auto_899 ?auto_894 ) ) ( not ( = ?auto_899 ?auto_895 ) ) ( not ( = ?auto_898 ?auto_896 ) ) ( HOIST-AT ?auto_902 ?auto_898 ) ( not ( = ?auto_900 ?auto_902 ) ) ( AVAILABLE ?auto_902 ) ( SURFACE-AT ?auto_895 ?auto_898 ) ( ON ?auto_895 ?auto_897 ) ( CLEAR ?auto_895 ) ( not ( = ?auto_894 ?auto_897 ) ) ( not ( = ?auto_895 ?auto_897 ) ) ( not ( = ?auto_899 ?auto_897 ) ) ( TRUCK-AT ?auto_901 ?auto_903 ) ( not ( = ?auto_903 ?auto_896 ) ) ( not ( = ?auto_898 ?auto_903 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_901 ?auto_903 ?auto_896 )
      ( MAKE-1CRATE ?auto_894 ?auto_895 )
      ( MAKE-1CRATE-VERIFY ?auto_894 ?auto_895 ) )
  )

)

