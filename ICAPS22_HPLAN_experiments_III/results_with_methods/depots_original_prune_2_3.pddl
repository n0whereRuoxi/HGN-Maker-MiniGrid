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
      ?auto_712 - SURFACE
      ?auto_713 - SURFACE
    )
    :vars
    (
      ?auto_714 - HOIST
      ?auto_715 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_714 ?auto_715 ) ( SURFACE-AT ?auto_712 ?auto_715 ) ( CLEAR ?auto_712 ) ( LIFTING ?auto_714 ?auto_713 ) ( IS-CRATE ?auto_713 ) ( not ( = ?auto_712 ?auto_713 ) ) )
    :subtasks
    ( ( !DROP ?auto_714 ?auto_713 ?auto_712 ?auto_715 )
      ( MAKE-1CRATE-VERIFY ?auto_712 ?auto_713 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_716 - SURFACE
      ?auto_717 - SURFACE
    )
    :vars
    (
      ?auto_718 - HOIST
      ?auto_719 - PLACE
      ?auto_720 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_718 ?auto_719 ) ( SURFACE-AT ?auto_716 ?auto_719 ) ( CLEAR ?auto_716 ) ( IS-CRATE ?auto_717 ) ( not ( = ?auto_716 ?auto_717 ) ) ( TRUCK-AT ?auto_720 ?auto_719 ) ( AVAILABLE ?auto_718 ) ( IN ?auto_717 ?auto_720 ) )
    :subtasks
    ( ( !UNLOAD ?auto_718 ?auto_717 ?auto_720 ?auto_719 )
      ( MAKE-1CRATE ?auto_716 ?auto_717 )
      ( MAKE-1CRATE-VERIFY ?auto_716 ?auto_717 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_721 - SURFACE
      ?auto_722 - SURFACE
    )
    :vars
    (
      ?auto_723 - HOIST
      ?auto_724 - PLACE
      ?auto_725 - TRUCK
      ?auto_726 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_723 ?auto_724 ) ( SURFACE-AT ?auto_721 ?auto_724 ) ( CLEAR ?auto_721 ) ( IS-CRATE ?auto_722 ) ( not ( = ?auto_721 ?auto_722 ) ) ( AVAILABLE ?auto_723 ) ( IN ?auto_722 ?auto_725 ) ( TRUCK-AT ?auto_725 ?auto_726 ) ( not ( = ?auto_726 ?auto_724 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_725 ?auto_726 ?auto_724 )
      ( MAKE-1CRATE ?auto_721 ?auto_722 )
      ( MAKE-1CRATE-VERIFY ?auto_721 ?auto_722 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_727 - SURFACE
      ?auto_728 - SURFACE
    )
    :vars
    (
      ?auto_732 - HOIST
      ?auto_729 - PLACE
      ?auto_731 - TRUCK
      ?auto_730 - PLACE
      ?auto_733 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_732 ?auto_729 ) ( SURFACE-AT ?auto_727 ?auto_729 ) ( CLEAR ?auto_727 ) ( IS-CRATE ?auto_728 ) ( not ( = ?auto_727 ?auto_728 ) ) ( AVAILABLE ?auto_732 ) ( TRUCK-AT ?auto_731 ?auto_730 ) ( not ( = ?auto_730 ?auto_729 ) ) ( HOIST-AT ?auto_733 ?auto_730 ) ( LIFTING ?auto_733 ?auto_728 ) ( not ( = ?auto_732 ?auto_733 ) ) )
    :subtasks
    ( ( !LOAD ?auto_733 ?auto_728 ?auto_731 ?auto_730 )
      ( MAKE-1CRATE ?auto_727 ?auto_728 )
      ( MAKE-1CRATE-VERIFY ?auto_727 ?auto_728 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_734 - SURFACE
      ?auto_735 - SURFACE
    )
    :vars
    (
      ?auto_736 - HOIST
      ?auto_739 - PLACE
      ?auto_738 - TRUCK
      ?auto_740 - PLACE
      ?auto_737 - HOIST
      ?auto_741 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_736 ?auto_739 ) ( SURFACE-AT ?auto_734 ?auto_739 ) ( CLEAR ?auto_734 ) ( IS-CRATE ?auto_735 ) ( not ( = ?auto_734 ?auto_735 ) ) ( AVAILABLE ?auto_736 ) ( TRUCK-AT ?auto_738 ?auto_740 ) ( not ( = ?auto_740 ?auto_739 ) ) ( HOIST-AT ?auto_737 ?auto_740 ) ( not ( = ?auto_736 ?auto_737 ) ) ( AVAILABLE ?auto_737 ) ( SURFACE-AT ?auto_735 ?auto_740 ) ( ON ?auto_735 ?auto_741 ) ( CLEAR ?auto_735 ) ( not ( = ?auto_734 ?auto_741 ) ) ( not ( = ?auto_735 ?auto_741 ) ) )
    :subtasks
    ( ( !LIFT ?auto_737 ?auto_735 ?auto_741 ?auto_740 )
      ( MAKE-1CRATE ?auto_734 ?auto_735 )
      ( MAKE-1CRATE-VERIFY ?auto_734 ?auto_735 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_742 - SURFACE
      ?auto_743 - SURFACE
    )
    :vars
    (
      ?auto_745 - HOIST
      ?auto_744 - PLACE
      ?auto_747 - PLACE
      ?auto_748 - HOIST
      ?auto_749 - SURFACE
      ?auto_746 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_745 ?auto_744 ) ( SURFACE-AT ?auto_742 ?auto_744 ) ( CLEAR ?auto_742 ) ( IS-CRATE ?auto_743 ) ( not ( = ?auto_742 ?auto_743 ) ) ( AVAILABLE ?auto_745 ) ( not ( = ?auto_747 ?auto_744 ) ) ( HOIST-AT ?auto_748 ?auto_747 ) ( not ( = ?auto_745 ?auto_748 ) ) ( AVAILABLE ?auto_748 ) ( SURFACE-AT ?auto_743 ?auto_747 ) ( ON ?auto_743 ?auto_749 ) ( CLEAR ?auto_743 ) ( not ( = ?auto_742 ?auto_749 ) ) ( not ( = ?auto_743 ?auto_749 ) ) ( TRUCK-AT ?auto_746 ?auto_744 ) )
    :subtasks
    ( ( !DRIVE ?auto_746 ?auto_744 ?auto_747 )
      ( MAKE-1CRATE ?auto_742 ?auto_743 )
      ( MAKE-1CRATE-VERIFY ?auto_742 ?auto_743 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_759 - SURFACE
      ?auto_760 - SURFACE
      ?auto_761 - SURFACE
    )
    :vars
    (
      ?auto_763 - HOIST
      ?auto_762 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_763 ?auto_762 ) ( SURFACE-AT ?auto_760 ?auto_762 ) ( CLEAR ?auto_760 ) ( LIFTING ?auto_763 ?auto_761 ) ( IS-CRATE ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( ON ?auto_760 ?auto_759 ) ( not ( = ?auto_759 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_761 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_760 ?auto_761 )
      ( MAKE-2CRATE-VERIFY ?auto_759 ?auto_760 ?auto_761 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_769 - SURFACE
      ?auto_770 - SURFACE
      ?auto_771 - SURFACE
    )
    :vars
    (
      ?auto_773 - HOIST
      ?auto_772 - PLACE
      ?auto_774 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_773 ?auto_772 ) ( SURFACE-AT ?auto_770 ?auto_772 ) ( CLEAR ?auto_770 ) ( IS-CRATE ?auto_771 ) ( not ( = ?auto_770 ?auto_771 ) ) ( TRUCK-AT ?auto_774 ?auto_772 ) ( AVAILABLE ?auto_773 ) ( IN ?auto_771 ?auto_774 ) ( ON ?auto_770 ?auto_769 ) ( not ( = ?auto_769 ?auto_770 ) ) ( not ( = ?auto_769 ?auto_771 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_770 ?auto_771 )
      ( MAKE-2CRATE-VERIFY ?auto_769 ?auto_770 ?auto_771 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_775 - SURFACE
      ?auto_776 - SURFACE
    )
    :vars
    (
      ?auto_778 - HOIST
      ?auto_777 - PLACE
      ?auto_780 - TRUCK
      ?auto_779 - SURFACE
      ?auto_781 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_778 ?auto_777 ) ( SURFACE-AT ?auto_775 ?auto_777 ) ( CLEAR ?auto_775 ) ( IS-CRATE ?auto_776 ) ( not ( = ?auto_775 ?auto_776 ) ) ( AVAILABLE ?auto_778 ) ( IN ?auto_776 ?auto_780 ) ( ON ?auto_775 ?auto_779 ) ( not ( = ?auto_779 ?auto_775 ) ) ( not ( = ?auto_779 ?auto_776 ) ) ( TRUCK-AT ?auto_780 ?auto_781 ) ( not ( = ?auto_781 ?auto_777 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_780 ?auto_781 ?auto_777 )
      ( MAKE-2CRATE ?auto_779 ?auto_775 ?auto_776 )
      ( MAKE-1CRATE-VERIFY ?auto_775 ?auto_776 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_782 - SURFACE
      ?auto_783 - SURFACE
      ?auto_784 - SURFACE
    )
    :vars
    (
      ?auto_785 - HOIST
      ?auto_788 - PLACE
      ?auto_787 - TRUCK
      ?auto_786 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_785 ?auto_788 ) ( SURFACE-AT ?auto_783 ?auto_788 ) ( CLEAR ?auto_783 ) ( IS-CRATE ?auto_784 ) ( not ( = ?auto_783 ?auto_784 ) ) ( AVAILABLE ?auto_785 ) ( IN ?auto_784 ?auto_787 ) ( ON ?auto_783 ?auto_782 ) ( not ( = ?auto_782 ?auto_783 ) ) ( not ( = ?auto_782 ?auto_784 ) ) ( TRUCK-AT ?auto_787 ?auto_786 ) ( not ( = ?auto_786 ?auto_788 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_783 ?auto_784 )
      ( MAKE-2CRATE-VERIFY ?auto_782 ?auto_783 ?auto_784 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_789 - SURFACE
      ?auto_790 - SURFACE
    )
    :vars
    (
      ?auto_794 - HOIST
      ?auto_795 - PLACE
      ?auto_792 - SURFACE
      ?auto_791 - TRUCK
      ?auto_793 - PLACE
      ?auto_796 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_794 ?auto_795 ) ( SURFACE-AT ?auto_789 ?auto_795 ) ( CLEAR ?auto_789 ) ( IS-CRATE ?auto_790 ) ( not ( = ?auto_789 ?auto_790 ) ) ( AVAILABLE ?auto_794 ) ( ON ?auto_789 ?auto_792 ) ( not ( = ?auto_792 ?auto_789 ) ) ( not ( = ?auto_792 ?auto_790 ) ) ( TRUCK-AT ?auto_791 ?auto_793 ) ( not ( = ?auto_793 ?auto_795 ) ) ( HOIST-AT ?auto_796 ?auto_793 ) ( LIFTING ?auto_796 ?auto_790 ) ( not ( = ?auto_794 ?auto_796 ) ) )
    :subtasks
    ( ( !LOAD ?auto_796 ?auto_790 ?auto_791 ?auto_793 )
      ( MAKE-2CRATE ?auto_792 ?auto_789 ?auto_790 )
      ( MAKE-1CRATE-VERIFY ?auto_789 ?auto_790 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_797 - SURFACE
      ?auto_798 - SURFACE
      ?auto_799 - SURFACE
    )
    :vars
    (
      ?auto_800 - HOIST
      ?auto_803 - PLACE
      ?auto_802 - TRUCK
      ?auto_801 - PLACE
      ?auto_804 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_800 ?auto_803 ) ( SURFACE-AT ?auto_798 ?auto_803 ) ( CLEAR ?auto_798 ) ( IS-CRATE ?auto_799 ) ( not ( = ?auto_798 ?auto_799 ) ) ( AVAILABLE ?auto_800 ) ( ON ?auto_798 ?auto_797 ) ( not ( = ?auto_797 ?auto_798 ) ) ( not ( = ?auto_797 ?auto_799 ) ) ( TRUCK-AT ?auto_802 ?auto_801 ) ( not ( = ?auto_801 ?auto_803 ) ) ( HOIST-AT ?auto_804 ?auto_801 ) ( LIFTING ?auto_804 ?auto_799 ) ( not ( = ?auto_800 ?auto_804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_798 ?auto_799 )
      ( MAKE-2CRATE-VERIFY ?auto_797 ?auto_798 ?auto_799 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_805 - SURFACE
      ?auto_806 - SURFACE
    )
    :vars
    (
      ?auto_811 - HOIST
      ?auto_812 - PLACE
      ?auto_808 - SURFACE
      ?auto_809 - TRUCK
      ?auto_807 - PLACE
      ?auto_810 - HOIST
      ?auto_813 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_811 ?auto_812 ) ( SURFACE-AT ?auto_805 ?auto_812 ) ( CLEAR ?auto_805 ) ( IS-CRATE ?auto_806 ) ( not ( = ?auto_805 ?auto_806 ) ) ( AVAILABLE ?auto_811 ) ( ON ?auto_805 ?auto_808 ) ( not ( = ?auto_808 ?auto_805 ) ) ( not ( = ?auto_808 ?auto_806 ) ) ( TRUCK-AT ?auto_809 ?auto_807 ) ( not ( = ?auto_807 ?auto_812 ) ) ( HOIST-AT ?auto_810 ?auto_807 ) ( not ( = ?auto_811 ?auto_810 ) ) ( AVAILABLE ?auto_810 ) ( SURFACE-AT ?auto_806 ?auto_807 ) ( ON ?auto_806 ?auto_813 ) ( CLEAR ?auto_806 ) ( not ( = ?auto_805 ?auto_813 ) ) ( not ( = ?auto_806 ?auto_813 ) ) ( not ( = ?auto_808 ?auto_813 ) ) )
    :subtasks
    ( ( !LIFT ?auto_810 ?auto_806 ?auto_813 ?auto_807 )
      ( MAKE-2CRATE ?auto_808 ?auto_805 ?auto_806 )
      ( MAKE-1CRATE-VERIFY ?auto_805 ?auto_806 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_814 - SURFACE
      ?auto_815 - SURFACE
      ?auto_816 - SURFACE
    )
    :vars
    (
      ?auto_818 - HOIST
      ?auto_819 - PLACE
      ?auto_817 - TRUCK
      ?auto_822 - PLACE
      ?auto_820 - HOIST
      ?auto_821 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_818 ?auto_819 ) ( SURFACE-AT ?auto_815 ?auto_819 ) ( CLEAR ?auto_815 ) ( IS-CRATE ?auto_816 ) ( not ( = ?auto_815 ?auto_816 ) ) ( AVAILABLE ?auto_818 ) ( ON ?auto_815 ?auto_814 ) ( not ( = ?auto_814 ?auto_815 ) ) ( not ( = ?auto_814 ?auto_816 ) ) ( TRUCK-AT ?auto_817 ?auto_822 ) ( not ( = ?auto_822 ?auto_819 ) ) ( HOIST-AT ?auto_820 ?auto_822 ) ( not ( = ?auto_818 ?auto_820 ) ) ( AVAILABLE ?auto_820 ) ( SURFACE-AT ?auto_816 ?auto_822 ) ( ON ?auto_816 ?auto_821 ) ( CLEAR ?auto_816 ) ( not ( = ?auto_815 ?auto_821 ) ) ( not ( = ?auto_816 ?auto_821 ) ) ( not ( = ?auto_814 ?auto_821 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_815 ?auto_816 )
      ( MAKE-2CRATE-VERIFY ?auto_814 ?auto_815 ?auto_816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_823 - SURFACE
      ?auto_824 - SURFACE
    )
    :vars
    (
      ?auto_826 - HOIST
      ?auto_829 - PLACE
      ?auto_828 - SURFACE
      ?auto_830 - PLACE
      ?auto_827 - HOIST
      ?auto_831 - SURFACE
      ?auto_825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_826 ?auto_829 ) ( SURFACE-AT ?auto_823 ?auto_829 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_824 ) ( not ( = ?auto_823 ?auto_824 ) ) ( AVAILABLE ?auto_826 ) ( ON ?auto_823 ?auto_828 ) ( not ( = ?auto_828 ?auto_823 ) ) ( not ( = ?auto_828 ?auto_824 ) ) ( not ( = ?auto_830 ?auto_829 ) ) ( HOIST-AT ?auto_827 ?auto_830 ) ( not ( = ?auto_826 ?auto_827 ) ) ( AVAILABLE ?auto_827 ) ( SURFACE-AT ?auto_824 ?auto_830 ) ( ON ?auto_824 ?auto_831 ) ( CLEAR ?auto_824 ) ( not ( = ?auto_823 ?auto_831 ) ) ( not ( = ?auto_824 ?auto_831 ) ) ( not ( = ?auto_828 ?auto_831 ) ) ( TRUCK-AT ?auto_825 ?auto_829 ) )
    :subtasks
    ( ( !DRIVE ?auto_825 ?auto_829 ?auto_830 )
      ( MAKE-2CRATE ?auto_828 ?auto_823 ?auto_824 )
      ( MAKE-1CRATE-VERIFY ?auto_823 ?auto_824 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_832 - SURFACE
      ?auto_833 - SURFACE
      ?auto_834 - SURFACE
    )
    :vars
    (
      ?auto_840 - HOIST
      ?auto_839 - PLACE
      ?auto_837 - PLACE
      ?auto_836 - HOIST
      ?auto_838 - SURFACE
      ?auto_835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_840 ?auto_839 ) ( SURFACE-AT ?auto_833 ?auto_839 ) ( CLEAR ?auto_833 ) ( IS-CRATE ?auto_834 ) ( not ( = ?auto_833 ?auto_834 ) ) ( AVAILABLE ?auto_840 ) ( ON ?auto_833 ?auto_832 ) ( not ( = ?auto_832 ?auto_833 ) ) ( not ( = ?auto_832 ?auto_834 ) ) ( not ( = ?auto_837 ?auto_839 ) ) ( HOIST-AT ?auto_836 ?auto_837 ) ( not ( = ?auto_840 ?auto_836 ) ) ( AVAILABLE ?auto_836 ) ( SURFACE-AT ?auto_834 ?auto_837 ) ( ON ?auto_834 ?auto_838 ) ( CLEAR ?auto_834 ) ( not ( = ?auto_833 ?auto_838 ) ) ( not ( = ?auto_834 ?auto_838 ) ) ( not ( = ?auto_832 ?auto_838 ) ) ( TRUCK-AT ?auto_835 ?auto_839 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_833 ?auto_834 )
      ( MAKE-2CRATE-VERIFY ?auto_832 ?auto_833 ?auto_834 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_841 - SURFACE
      ?auto_842 - SURFACE
    )
    :vars
    (
      ?auto_846 - HOIST
      ?auto_845 - PLACE
      ?auto_848 - SURFACE
      ?auto_849 - PLACE
      ?auto_844 - HOIST
      ?auto_847 - SURFACE
      ?auto_843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_846 ?auto_845 ) ( IS-CRATE ?auto_842 ) ( not ( = ?auto_841 ?auto_842 ) ) ( not ( = ?auto_848 ?auto_841 ) ) ( not ( = ?auto_848 ?auto_842 ) ) ( not ( = ?auto_849 ?auto_845 ) ) ( HOIST-AT ?auto_844 ?auto_849 ) ( not ( = ?auto_846 ?auto_844 ) ) ( AVAILABLE ?auto_844 ) ( SURFACE-AT ?auto_842 ?auto_849 ) ( ON ?auto_842 ?auto_847 ) ( CLEAR ?auto_842 ) ( not ( = ?auto_841 ?auto_847 ) ) ( not ( = ?auto_842 ?auto_847 ) ) ( not ( = ?auto_848 ?auto_847 ) ) ( TRUCK-AT ?auto_843 ?auto_845 ) ( SURFACE-AT ?auto_848 ?auto_845 ) ( CLEAR ?auto_848 ) ( LIFTING ?auto_846 ?auto_841 ) ( IS-CRATE ?auto_841 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_848 ?auto_841 )
      ( MAKE-2CRATE ?auto_848 ?auto_841 ?auto_842 )
      ( MAKE-1CRATE-VERIFY ?auto_841 ?auto_842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_850 - SURFACE
      ?auto_851 - SURFACE
      ?auto_852 - SURFACE
    )
    :vars
    (
      ?auto_853 - HOIST
      ?auto_856 - PLACE
      ?auto_854 - PLACE
      ?auto_858 - HOIST
      ?auto_855 - SURFACE
      ?auto_857 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_853 ?auto_856 ) ( IS-CRATE ?auto_852 ) ( not ( = ?auto_851 ?auto_852 ) ) ( not ( = ?auto_850 ?auto_851 ) ) ( not ( = ?auto_850 ?auto_852 ) ) ( not ( = ?auto_854 ?auto_856 ) ) ( HOIST-AT ?auto_858 ?auto_854 ) ( not ( = ?auto_853 ?auto_858 ) ) ( AVAILABLE ?auto_858 ) ( SURFACE-AT ?auto_852 ?auto_854 ) ( ON ?auto_852 ?auto_855 ) ( CLEAR ?auto_852 ) ( not ( = ?auto_851 ?auto_855 ) ) ( not ( = ?auto_852 ?auto_855 ) ) ( not ( = ?auto_850 ?auto_855 ) ) ( TRUCK-AT ?auto_857 ?auto_856 ) ( SURFACE-AT ?auto_850 ?auto_856 ) ( CLEAR ?auto_850 ) ( LIFTING ?auto_853 ?auto_851 ) ( IS-CRATE ?auto_851 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_851 ?auto_852 )
      ( MAKE-2CRATE-VERIFY ?auto_850 ?auto_851 ?auto_852 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_859 - SURFACE
      ?auto_860 - SURFACE
    )
    :vars
    (
      ?auto_866 - HOIST
      ?auto_863 - PLACE
      ?auto_861 - SURFACE
      ?auto_864 - PLACE
      ?auto_862 - HOIST
      ?auto_865 - SURFACE
      ?auto_867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_866 ?auto_863 ) ( IS-CRATE ?auto_860 ) ( not ( = ?auto_859 ?auto_860 ) ) ( not ( = ?auto_861 ?auto_859 ) ) ( not ( = ?auto_861 ?auto_860 ) ) ( not ( = ?auto_864 ?auto_863 ) ) ( HOIST-AT ?auto_862 ?auto_864 ) ( not ( = ?auto_866 ?auto_862 ) ) ( AVAILABLE ?auto_862 ) ( SURFACE-AT ?auto_860 ?auto_864 ) ( ON ?auto_860 ?auto_865 ) ( CLEAR ?auto_860 ) ( not ( = ?auto_859 ?auto_865 ) ) ( not ( = ?auto_860 ?auto_865 ) ) ( not ( = ?auto_861 ?auto_865 ) ) ( TRUCK-AT ?auto_867 ?auto_863 ) ( SURFACE-AT ?auto_861 ?auto_863 ) ( CLEAR ?auto_861 ) ( IS-CRATE ?auto_859 ) ( AVAILABLE ?auto_866 ) ( IN ?auto_859 ?auto_867 ) )
    :subtasks
    ( ( !UNLOAD ?auto_866 ?auto_859 ?auto_867 ?auto_863 )
      ( MAKE-2CRATE ?auto_861 ?auto_859 ?auto_860 )
      ( MAKE-1CRATE-VERIFY ?auto_859 ?auto_860 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_868 - SURFACE
      ?auto_869 - SURFACE
      ?auto_870 - SURFACE
    )
    :vars
    (
      ?auto_876 - HOIST
      ?auto_874 - PLACE
      ?auto_873 - PLACE
      ?auto_871 - HOIST
      ?auto_872 - SURFACE
      ?auto_875 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_876 ?auto_874 ) ( IS-CRATE ?auto_870 ) ( not ( = ?auto_869 ?auto_870 ) ) ( not ( = ?auto_868 ?auto_869 ) ) ( not ( = ?auto_868 ?auto_870 ) ) ( not ( = ?auto_873 ?auto_874 ) ) ( HOIST-AT ?auto_871 ?auto_873 ) ( not ( = ?auto_876 ?auto_871 ) ) ( AVAILABLE ?auto_871 ) ( SURFACE-AT ?auto_870 ?auto_873 ) ( ON ?auto_870 ?auto_872 ) ( CLEAR ?auto_870 ) ( not ( = ?auto_869 ?auto_872 ) ) ( not ( = ?auto_870 ?auto_872 ) ) ( not ( = ?auto_868 ?auto_872 ) ) ( TRUCK-AT ?auto_875 ?auto_874 ) ( SURFACE-AT ?auto_868 ?auto_874 ) ( CLEAR ?auto_868 ) ( IS-CRATE ?auto_869 ) ( AVAILABLE ?auto_876 ) ( IN ?auto_869 ?auto_875 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_869 ?auto_870 )
      ( MAKE-2CRATE-VERIFY ?auto_868 ?auto_869 ?auto_870 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_877 - SURFACE
      ?auto_878 - SURFACE
    )
    :vars
    (
      ?auto_883 - HOIST
      ?auto_881 - PLACE
      ?auto_882 - SURFACE
      ?auto_879 - PLACE
      ?auto_885 - HOIST
      ?auto_880 - SURFACE
      ?auto_884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_883 ?auto_881 ) ( IS-CRATE ?auto_878 ) ( not ( = ?auto_877 ?auto_878 ) ) ( not ( = ?auto_882 ?auto_877 ) ) ( not ( = ?auto_882 ?auto_878 ) ) ( not ( = ?auto_879 ?auto_881 ) ) ( HOIST-AT ?auto_885 ?auto_879 ) ( not ( = ?auto_883 ?auto_885 ) ) ( AVAILABLE ?auto_885 ) ( SURFACE-AT ?auto_878 ?auto_879 ) ( ON ?auto_878 ?auto_880 ) ( CLEAR ?auto_878 ) ( not ( = ?auto_877 ?auto_880 ) ) ( not ( = ?auto_878 ?auto_880 ) ) ( not ( = ?auto_882 ?auto_880 ) ) ( SURFACE-AT ?auto_882 ?auto_881 ) ( CLEAR ?auto_882 ) ( IS-CRATE ?auto_877 ) ( AVAILABLE ?auto_883 ) ( IN ?auto_877 ?auto_884 ) ( TRUCK-AT ?auto_884 ?auto_879 ) )
    :subtasks
    ( ( !DRIVE ?auto_884 ?auto_879 ?auto_881 )
      ( MAKE-2CRATE ?auto_882 ?auto_877 ?auto_878 )
      ( MAKE-1CRATE-VERIFY ?auto_877 ?auto_878 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_886 - SURFACE
      ?auto_887 - SURFACE
      ?auto_888 - SURFACE
    )
    :vars
    (
      ?auto_892 - HOIST
      ?auto_891 - PLACE
      ?auto_889 - PLACE
      ?auto_894 - HOIST
      ?auto_893 - SURFACE
      ?auto_890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_892 ?auto_891 ) ( IS-CRATE ?auto_888 ) ( not ( = ?auto_887 ?auto_888 ) ) ( not ( = ?auto_886 ?auto_887 ) ) ( not ( = ?auto_886 ?auto_888 ) ) ( not ( = ?auto_889 ?auto_891 ) ) ( HOIST-AT ?auto_894 ?auto_889 ) ( not ( = ?auto_892 ?auto_894 ) ) ( AVAILABLE ?auto_894 ) ( SURFACE-AT ?auto_888 ?auto_889 ) ( ON ?auto_888 ?auto_893 ) ( CLEAR ?auto_888 ) ( not ( = ?auto_887 ?auto_893 ) ) ( not ( = ?auto_888 ?auto_893 ) ) ( not ( = ?auto_886 ?auto_893 ) ) ( SURFACE-AT ?auto_886 ?auto_891 ) ( CLEAR ?auto_886 ) ( IS-CRATE ?auto_887 ) ( AVAILABLE ?auto_892 ) ( IN ?auto_887 ?auto_890 ) ( TRUCK-AT ?auto_890 ?auto_889 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_887 ?auto_888 )
      ( MAKE-2CRATE-VERIFY ?auto_886 ?auto_887 ?auto_888 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_895 - SURFACE
      ?auto_896 - SURFACE
    )
    :vars
    (
      ?auto_898 - HOIST
      ?auto_900 - PLACE
      ?auto_899 - SURFACE
      ?auto_902 - PLACE
      ?auto_897 - HOIST
      ?auto_903 - SURFACE
      ?auto_901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_898 ?auto_900 ) ( IS-CRATE ?auto_896 ) ( not ( = ?auto_895 ?auto_896 ) ) ( not ( = ?auto_899 ?auto_895 ) ) ( not ( = ?auto_899 ?auto_896 ) ) ( not ( = ?auto_902 ?auto_900 ) ) ( HOIST-AT ?auto_897 ?auto_902 ) ( not ( = ?auto_898 ?auto_897 ) ) ( SURFACE-AT ?auto_896 ?auto_902 ) ( ON ?auto_896 ?auto_903 ) ( CLEAR ?auto_896 ) ( not ( = ?auto_895 ?auto_903 ) ) ( not ( = ?auto_896 ?auto_903 ) ) ( not ( = ?auto_899 ?auto_903 ) ) ( SURFACE-AT ?auto_899 ?auto_900 ) ( CLEAR ?auto_899 ) ( IS-CRATE ?auto_895 ) ( AVAILABLE ?auto_898 ) ( TRUCK-AT ?auto_901 ?auto_902 ) ( LIFTING ?auto_897 ?auto_895 ) )
    :subtasks
    ( ( !LOAD ?auto_897 ?auto_895 ?auto_901 ?auto_902 )
      ( MAKE-2CRATE ?auto_899 ?auto_895 ?auto_896 )
      ( MAKE-1CRATE-VERIFY ?auto_895 ?auto_896 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_904 - SURFACE
      ?auto_905 - SURFACE
      ?auto_906 - SURFACE
    )
    :vars
    (
      ?auto_909 - HOIST
      ?auto_908 - PLACE
      ?auto_911 - PLACE
      ?auto_910 - HOIST
      ?auto_912 - SURFACE
      ?auto_907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_909 ?auto_908 ) ( IS-CRATE ?auto_906 ) ( not ( = ?auto_905 ?auto_906 ) ) ( not ( = ?auto_904 ?auto_905 ) ) ( not ( = ?auto_904 ?auto_906 ) ) ( not ( = ?auto_911 ?auto_908 ) ) ( HOIST-AT ?auto_910 ?auto_911 ) ( not ( = ?auto_909 ?auto_910 ) ) ( SURFACE-AT ?auto_906 ?auto_911 ) ( ON ?auto_906 ?auto_912 ) ( CLEAR ?auto_906 ) ( not ( = ?auto_905 ?auto_912 ) ) ( not ( = ?auto_906 ?auto_912 ) ) ( not ( = ?auto_904 ?auto_912 ) ) ( SURFACE-AT ?auto_904 ?auto_908 ) ( CLEAR ?auto_904 ) ( IS-CRATE ?auto_905 ) ( AVAILABLE ?auto_909 ) ( TRUCK-AT ?auto_907 ?auto_911 ) ( LIFTING ?auto_910 ?auto_905 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_905 ?auto_906 )
      ( MAKE-2CRATE-VERIFY ?auto_904 ?auto_905 ?auto_906 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_913 - SURFACE
      ?auto_914 - SURFACE
    )
    :vars
    (
      ?auto_915 - HOIST
      ?auto_921 - PLACE
      ?auto_920 - SURFACE
      ?auto_919 - PLACE
      ?auto_918 - HOIST
      ?auto_916 - SURFACE
      ?auto_917 - TRUCK
      ?auto_922 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_915 ?auto_921 ) ( IS-CRATE ?auto_914 ) ( not ( = ?auto_913 ?auto_914 ) ) ( not ( = ?auto_920 ?auto_913 ) ) ( not ( = ?auto_920 ?auto_914 ) ) ( not ( = ?auto_919 ?auto_921 ) ) ( HOIST-AT ?auto_918 ?auto_919 ) ( not ( = ?auto_915 ?auto_918 ) ) ( SURFACE-AT ?auto_914 ?auto_919 ) ( ON ?auto_914 ?auto_916 ) ( CLEAR ?auto_914 ) ( not ( = ?auto_913 ?auto_916 ) ) ( not ( = ?auto_914 ?auto_916 ) ) ( not ( = ?auto_920 ?auto_916 ) ) ( SURFACE-AT ?auto_920 ?auto_921 ) ( CLEAR ?auto_920 ) ( IS-CRATE ?auto_913 ) ( AVAILABLE ?auto_915 ) ( TRUCK-AT ?auto_917 ?auto_919 ) ( AVAILABLE ?auto_918 ) ( SURFACE-AT ?auto_913 ?auto_919 ) ( ON ?auto_913 ?auto_922 ) ( CLEAR ?auto_913 ) ( not ( = ?auto_913 ?auto_922 ) ) ( not ( = ?auto_914 ?auto_922 ) ) ( not ( = ?auto_920 ?auto_922 ) ) ( not ( = ?auto_916 ?auto_922 ) ) )
    :subtasks
    ( ( !LIFT ?auto_918 ?auto_913 ?auto_922 ?auto_919 )
      ( MAKE-2CRATE ?auto_920 ?auto_913 ?auto_914 )
      ( MAKE-1CRATE-VERIFY ?auto_913 ?auto_914 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_923 - SURFACE
      ?auto_924 - SURFACE
      ?auto_925 - SURFACE
    )
    :vars
    (
      ?auto_930 - HOIST
      ?auto_932 - PLACE
      ?auto_931 - PLACE
      ?auto_928 - HOIST
      ?auto_929 - SURFACE
      ?auto_927 - TRUCK
      ?auto_926 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_932 ) ( IS-CRATE ?auto_925 ) ( not ( = ?auto_924 ?auto_925 ) ) ( not ( = ?auto_923 ?auto_924 ) ) ( not ( = ?auto_923 ?auto_925 ) ) ( not ( = ?auto_931 ?auto_932 ) ) ( HOIST-AT ?auto_928 ?auto_931 ) ( not ( = ?auto_930 ?auto_928 ) ) ( SURFACE-AT ?auto_925 ?auto_931 ) ( ON ?auto_925 ?auto_929 ) ( CLEAR ?auto_925 ) ( not ( = ?auto_924 ?auto_929 ) ) ( not ( = ?auto_925 ?auto_929 ) ) ( not ( = ?auto_923 ?auto_929 ) ) ( SURFACE-AT ?auto_923 ?auto_932 ) ( CLEAR ?auto_923 ) ( IS-CRATE ?auto_924 ) ( AVAILABLE ?auto_930 ) ( TRUCK-AT ?auto_927 ?auto_931 ) ( AVAILABLE ?auto_928 ) ( SURFACE-AT ?auto_924 ?auto_931 ) ( ON ?auto_924 ?auto_926 ) ( CLEAR ?auto_924 ) ( not ( = ?auto_924 ?auto_926 ) ) ( not ( = ?auto_925 ?auto_926 ) ) ( not ( = ?auto_923 ?auto_926 ) ) ( not ( = ?auto_929 ?auto_926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_924 ?auto_925 )
      ( MAKE-2CRATE-VERIFY ?auto_923 ?auto_924 ?auto_925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_933 - SURFACE
      ?auto_934 - SURFACE
    )
    :vars
    (
      ?auto_942 - HOIST
      ?auto_941 - PLACE
      ?auto_940 - SURFACE
      ?auto_937 - PLACE
      ?auto_935 - HOIST
      ?auto_936 - SURFACE
      ?auto_938 - SURFACE
      ?auto_939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_942 ?auto_941 ) ( IS-CRATE ?auto_934 ) ( not ( = ?auto_933 ?auto_934 ) ) ( not ( = ?auto_940 ?auto_933 ) ) ( not ( = ?auto_940 ?auto_934 ) ) ( not ( = ?auto_937 ?auto_941 ) ) ( HOIST-AT ?auto_935 ?auto_937 ) ( not ( = ?auto_942 ?auto_935 ) ) ( SURFACE-AT ?auto_934 ?auto_937 ) ( ON ?auto_934 ?auto_936 ) ( CLEAR ?auto_934 ) ( not ( = ?auto_933 ?auto_936 ) ) ( not ( = ?auto_934 ?auto_936 ) ) ( not ( = ?auto_940 ?auto_936 ) ) ( SURFACE-AT ?auto_940 ?auto_941 ) ( CLEAR ?auto_940 ) ( IS-CRATE ?auto_933 ) ( AVAILABLE ?auto_942 ) ( AVAILABLE ?auto_935 ) ( SURFACE-AT ?auto_933 ?auto_937 ) ( ON ?auto_933 ?auto_938 ) ( CLEAR ?auto_933 ) ( not ( = ?auto_933 ?auto_938 ) ) ( not ( = ?auto_934 ?auto_938 ) ) ( not ( = ?auto_940 ?auto_938 ) ) ( not ( = ?auto_936 ?auto_938 ) ) ( TRUCK-AT ?auto_939 ?auto_941 ) )
    :subtasks
    ( ( !DRIVE ?auto_939 ?auto_941 ?auto_937 )
      ( MAKE-2CRATE ?auto_940 ?auto_933 ?auto_934 )
      ( MAKE-1CRATE-VERIFY ?auto_933 ?auto_934 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_943 - SURFACE
      ?auto_944 - SURFACE
      ?auto_945 - SURFACE
    )
    :vars
    (
      ?auto_951 - HOIST
      ?auto_949 - PLACE
      ?auto_947 - PLACE
      ?auto_950 - HOIST
      ?auto_948 - SURFACE
      ?auto_946 - SURFACE
      ?auto_952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_951 ?auto_949 ) ( IS-CRATE ?auto_945 ) ( not ( = ?auto_944 ?auto_945 ) ) ( not ( = ?auto_943 ?auto_944 ) ) ( not ( = ?auto_943 ?auto_945 ) ) ( not ( = ?auto_947 ?auto_949 ) ) ( HOIST-AT ?auto_950 ?auto_947 ) ( not ( = ?auto_951 ?auto_950 ) ) ( SURFACE-AT ?auto_945 ?auto_947 ) ( ON ?auto_945 ?auto_948 ) ( CLEAR ?auto_945 ) ( not ( = ?auto_944 ?auto_948 ) ) ( not ( = ?auto_945 ?auto_948 ) ) ( not ( = ?auto_943 ?auto_948 ) ) ( SURFACE-AT ?auto_943 ?auto_949 ) ( CLEAR ?auto_943 ) ( IS-CRATE ?auto_944 ) ( AVAILABLE ?auto_951 ) ( AVAILABLE ?auto_950 ) ( SURFACE-AT ?auto_944 ?auto_947 ) ( ON ?auto_944 ?auto_946 ) ( CLEAR ?auto_944 ) ( not ( = ?auto_944 ?auto_946 ) ) ( not ( = ?auto_945 ?auto_946 ) ) ( not ( = ?auto_943 ?auto_946 ) ) ( not ( = ?auto_948 ?auto_946 ) ) ( TRUCK-AT ?auto_952 ?auto_949 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_944 ?auto_945 )
      ( MAKE-2CRATE-VERIFY ?auto_943 ?auto_944 ?auto_945 ) )
  )

)

