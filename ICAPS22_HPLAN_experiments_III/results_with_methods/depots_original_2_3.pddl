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
      ?auto_745 - SURFACE
      ?auto_746 - SURFACE
    )
    :vars
    (
      ?auto_747 - HOIST
      ?auto_748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_747 ?auto_748 ) ( SURFACE-AT ?auto_745 ?auto_748 ) ( CLEAR ?auto_745 ) ( LIFTING ?auto_747 ?auto_746 ) ( IS-CRATE ?auto_746 ) ( not ( = ?auto_745 ?auto_746 ) ) )
    :subtasks
    ( ( !DROP ?auto_747 ?auto_746 ?auto_745 ?auto_748 )
      ( MAKE-1CRATE-VERIFY ?auto_745 ?auto_746 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_749 - SURFACE
      ?auto_750 - SURFACE
    )
    :vars
    (
      ?auto_752 - HOIST
      ?auto_751 - PLACE
      ?auto_753 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_752 ?auto_751 ) ( SURFACE-AT ?auto_749 ?auto_751 ) ( CLEAR ?auto_749 ) ( IS-CRATE ?auto_750 ) ( not ( = ?auto_749 ?auto_750 ) ) ( TRUCK-AT ?auto_753 ?auto_751 ) ( AVAILABLE ?auto_752 ) ( IN ?auto_750 ?auto_753 ) )
    :subtasks
    ( ( !UNLOAD ?auto_752 ?auto_750 ?auto_753 ?auto_751 )
      ( MAKE-1CRATE ?auto_749 ?auto_750 )
      ( MAKE-1CRATE-VERIFY ?auto_749 ?auto_750 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_754 - SURFACE
      ?auto_755 - SURFACE
    )
    :vars
    (
      ?auto_756 - HOIST
      ?auto_757 - PLACE
      ?auto_758 - TRUCK
      ?auto_759 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_756 ?auto_757 ) ( SURFACE-AT ?auto_754 ?auto_757 ) ( CLEAR ?auto_754 ) ( IS-CRATE ?auto_755 ) ( not ( = ?auto_754 ?auto_755 ) ) ( AVAILABLE ?auto_756 ) ( IN ?auto_755 ?auto_758 ) ( TRUCK-AT ?auto_758 ?auto_759 ) ( not ( = ?auto_759 ?auto_757 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_758 ?auto_759 ?auto_757 )
      ( MAKE-1CRATE ?auto_754 ?auto_755 )
      ( MAKE-1CRATE-VERIFY ?auto_754 ?auto_755 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_760 - SURFACE
      ?auto_761 - SURFACE
    )
    :vars
    (
      ?auto_763 - HOIST
      ?auto_765 - PLACE
      ?auto_762 - TRUCK
      ?auto_764 - PLACE
      ?auto_766 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_763 ?auto_765 ) ( SURFACE-AT ?auto_760 ?auto_765 ) ( CLEAR ?auto_760 ) ( IS-CRATE ?auto_761 ) ( not ( = ?auto_760 ?auto_761 ) ) ( AVAILABLE ?auto_763 ) ( TRUCK-AT ?auto_762 ?auto_764 ) ( not ( = ?auto_764 ?auto_765 ) ) ( HOIST-AT ?auto_766 ?auto_764 ) ( LIFTING ?auto_766 ?auto_761 ) ( not ( = ?auto_763 ?auto_766 ) ) )
    :subtasks
    ( ( !LOAD ?auto_766 ?auto_761 ?auto_762 ?auto_764 )
      ( MAKE-1CRATE ?auto_760 ?auto_761 )
      ( MAKE-1CRATE-VERIFY ?auto_760 ?auto_761 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_767 - SURFACE
      ?auto_768 - SURFACE
    )
    :vars
    (
      ?auto_771 - HOIST
      ?auto_769 - PLACE
      ?auto_770 - TRUCK
      ?auto_773 - PLACE
      ?auto_772 - HOIST
      ?auto_774 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_771 ?auto_769 ) ( SURFACE-AT ?auto_767 ?auto_769 ) ( CLEAR ?auto_767 ) ( IS-CRATE ?auto_768 ) ( not ( = ?auto_767 ?auto_768 ) ) ( AVAILABLE ?auto_771 ) ( TRUCK-AT ?auto_770 ?auto_773 ) ( not ( = ?auto_773 ?auto_769 ) ) ( HOIST-AT ?auto_772 ?auto_773 ) ( not ( = ?auto_771 ?auto_772 ) ) ( AVAILABLE ?auto_772 ) ( SURFACE-AT ?auto_768 ?auto_773 ) ( ON ?auto_768 ?auto_774 ) ( CLEAR ?auto_768 ) ( not ( = ?auto_767 ?auto_774 ) ) ( not ( = ?auto_768 ?auto_774 ) ) )
    :subtasks
    ( ( !LIFT ?auto_772 ?auto_768 ?auto_774 ?auto_773 )
      ( MAKE-1CRATE ?auto_767 ?auto_768 )
      ( MAKE-1CRATE-VERIFY ?auto_767 ?auto_768 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_775 - SURFACE
      ?auto_776 - SURFACE
    )
    :vars
    (
      ?auto_782 - HOIST
      ?auto_778 - PLACE
      ?auto_777 - PLACE
      ?auto_781 - HOIST
      ?auto_779 - SURFACE
      ?auto_780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_782 ?auto_778 ) ( SURFACE-AT ?auto_775 ?auto_778 ) ( CLEAR ?auto_775 ) ( IS-CRATE ?auto_776 ) ( not ( = ?auto_775 ?auto_776 ) ) ( AVAILABLE ?auto_782 ) ( not ( = ?auto_777 ?auto_778 ) ) ( HOIST-AT ?auto_781 ?auto_777 ) ( not ( = ?auto_782 ?auto_781 ) ) ( AVAILABLE ?auto_781 ) ( SURFACE-AT ?auto_776 ?auto_777 ) ( ON ?auto_776 ?auto_779 ) ( CLEAR ?auto_776 ) ( not ( = ?auto_775 ?auto_779 ) ) ( not ( = ?auto_776 ?auto_779 ) ) ( TRUCK-AT ?auto_780 ?auto_778 ) )
    :subtasks
    ( ( !DRIVE ?auto_780 ?auto_778 ?auto_777 )
      ( MAKE-1CRATE ?auto_775 ?auto_776 )
      ( MAKE-1CRATE-VERIFY ?auto_775 ?auto_776 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_788 - SURFACE
      ?auto_789 - SURFACE
    )
    :vars
    (
      ?auto_790 - HOIST
      ?auto_791 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_790 ?auto_791 ) ( SURFACE-AT ?auto_788 ?auto_791 ) ( CLEAR ?auto_788 ) ( LIFTING ?auto_790 ?auto_789 ) ( IS-CRATE ?auto_789 ) ( not ( = ?auto_788 ?auto_789 ) ) )
    :subtasks
    ( ( !DROP ?auto_790 ?auto_789 ?auto_788 ?auto_791 )
      ( MAKE-1CRATE-VERIFY ?auto_788 ?auto_789 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_792 - SURFACE
      ?auto_793 - SURFACE
      ?auto_794 - SURFACE
    )
    :vars
    (
      ?auto_795 - HOIST
      ?auto_796 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_795 ?auto_796 ) ( SURFACE-AT ?auto_793 ?auto_796 ) ( CLEAR ?auto_793 ) ( LIFTING ?auto_795 ?auto_794 ) ( IS-CRATE ?auto_794 ) ( not ( = ?auto_793 ?auto_794 ) ) ( ON ?auto_793 ?auto_792 ) ( not ( = ?auto_792 ?auto_793 ) ) ( not ( = ?auto_792 ?auto_794 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_793 ?auto_794 )
      ( MAKE-2CRATE-VERIFY ?auto_792 ?auto_793 ?auto_794 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_797 - SURFACE
      ?auto_798 - SURFACE
    )
    :vars
    (
      ?auto_799 - HOIST
      ?auto_800 - PLACE
      ?auto_801 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_799 ?auto_800 ) ( SURFACE-AT ?auto_797 ?auto_800 ) ( CLEAR ?auto_797 ) ( IS-CRATE ?auto_798 ) ( not ( = ?auto_797 ?auto_798 ) ) ( TRUCK-AT ?auto_801 ?auto_800 ) ( AVAILABLE ?auto_799 ) ( IN ?auto_798 ?auto_801 ) )
    :subtasks
    ( ( !UNLOAD ?auto_799 ?auto_798 ?auto_801 ?auto_800 )
      ( MAKE-1CRATE ?auto_797 ?auto_798 )
      ( MAKE-1CRATE-VERIFY ?auto_797 ?auto_798 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_802 - SURFACE
      ?auto_803 - SURFACE
      ?auto_804 - SURFACE
    )
    :vars
    (
      ?auto_807 - HOIST
      ?auto_806 - PLACE
      ?auto_805 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_807 ?auto_806 ) ( SURFACE-AT ?auto_803 ?auto_806 ) ( CLEAR ?auto_803 ) ( IS-CRATE ?auto_804 ) ( not ( = ?auto_803 ?auto_804 ) ) ( TRUCK-AT ?auto_805 ?auto_806 ) ( AVAILABLE ?auto_807 ) ( IN ?auto_804 ?auto_805 ) ( ON ?auto_803 ?auto_802 ) ( not ( = ?auto_802 ?auto_803 ) ) ( not ( = ?auto_802 ?auto_804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_803 ?auto_804 )
      ( MAKE-2CRATE-VERIFY ?auto_802 ?auto_803 ?auto_804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_808 - SURFACE
      ?auto_809 - SURFACE
    )
    :vars
    (
      ?auto_810 - HOIST
      ?auto_812 - PLACE
      ?auto_811 - TRUCK
      ?auto_813 - SURFACE
      ?auto_814 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_810 ?auto_812 ) ( SURFACE-AT ?auto_808 ?auto_812 ) ( CLEAR ?auto_808 ) ( IS-CRATE ?auto_809 ) ( not ( = ?auto_808 ?auto_809 ) ) ( AVAILABLE ?auto_810 ) ( IN ?auto_809 ?auto_811 ) ( ON ?auto_808 ?auto_813 ) ( not ( = ?auto_813 ?auto_808 ) ) ( not ( = ?auto_813 ?auto_809 ) ) ( TRUCK-AT ?auto_811 ?auto_814 ) ( not ( = ?auto_814 ?auto_812 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_811 ?auto_814 ?auto_812 )
      ( MAKE-2CRATE ?auto_813 ?auto_808 ?auto_809 )
      ( MAKE-1CRATE-VERIFY ?auto_808 ?auto_809 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_815 - SURFACE
      ?auto_816 - SURFACE
      ?auto_817 - SURFACE
    )
    :vars
    (
      ?auto_821 - HOIST
      ?auto_820 - PLACE
      ?auto_818 - TRUCK
      ?auto_819 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_821 ?auto_820 ) ( SURFACE-AT ?auto_816 ?auto_820 ) ( CLEAR ?auto_816 ) ( IS-CRATE ?auto_817 ) ( not ( = ?auto_816 ?auto_817 ) ) ( AVAILABLE ?auto_821 ) ( IN ?auto_817 ?auto_818 ) ( ON ?auto_816 ?auto_815 ) ( not ( = ?auto_815 ?auto_816 ) ) ( not ( = ?auto_815 ?auto_817 ) ) ( TRUCK-AT ?auto_818 ?auto_819 ) ( not ( = ?auto_819 ?auto_820 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_816 ?auto_817 )
      ( MAKE-2CRATE-VERIFY ?auto_815 ?auto_816 ?auto_817 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_822 - SURFACE
      ?auto_823 - SURFACE
    )
    :vars
    (
      ?auto_825 - HOIST
      ?auto_828 - PLACE
      ?auto_826 - SURFACE
      ?auto_824 - TRUCK
      ?auto_827 - PLACE
      ?auto_829 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_825 ?auto_828 ) ( SURFACE-AT ?auto_822 ?auto_828 ) ( CLEAR ?auto_822 ) ( IS-CRATE ?auto_823 ) ( not ( = ?auto_822 ?auto_823 ) ) ( AVAILABLE ?auto_825 ) ( ON ?auto_822 ?auto_826 ) ( not ( = ?auto_826 ?auto_822 ) ) ( not ( = ?auto_826 ?auto_823 ) ) ( TRUCK-AT ?auto_824 ?auto_827 ) ( not ( = ?auto_827 ?auto_828 ) ) ( HOIST-AT ?auto_829 ?auto_827 ) ( LIFTING ?auto_829 ?auto_823 ) ( not ( = ?auto_825 ?auto_829 ) ) )
    :subtasks
    ( ( !LOAD ?auto_829 ?auto_823 ?auto_824 ?auto_827 )
      ( MAKE-2CRATE ?auto_826 ?auto_822 ?auto_823 )
      ( MAKE-1CRATE-VERIFY ?auto_822 ?auto_823 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_830 - SURFACE
      ?auto_831 - SURFACE
      ?auto_832 - SURFACE
    )
    :vars
    (
      ?auto_834 - HOIST
      ?auto_836 - PLACE
      ?auto_835 - TRUCK
      ?auto_833 - PLACE
      ?auto_837 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_834 ?auto_836 ) ( SURFACE-AT ?auto_831 ?auto_836 ) ( CLEAR ?auto_831 ) ( IS-CRATE ?auto_832 ) ( not ( = ?auto_831 ?auto_832 ) ) ( AVAILABLE ?auto_834 ) ( ON ?auto_831 ?auto_830 ) ( not ( = ?auto_830 ?auto_831 ) ) ( not ( = ?auto_830 ?auto_832 ) ) ( TRUCK-AT ?auto_835 ?auto_833 ) ( not ( = ?auto_833 ?auto_836 ) ) ( HOIST-AT ?auto_837 ?auto_833 ) ( LIFTING ?auto_837 ?auto_832 ) ( not ( = ?auto_834 ?auto_837 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_831 ?auto_832 )
      ( MAKE-2CRATE-VERIFY ?auto_830 ?auto_831 ?auto_832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_838 - SURFACE
      ?auto_839 - SURFACE
    )
    :vars
    (
      ?auto_845 - HOIST
      ?auto_840 - PLACE
      ?auto_843 - SURFACE
      ?auto_841 - TRUCK
      ?auto_842 - PLACE
      ?auto_844 - HOIST
      ?auto_846 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_845 ?auto_840 ) ( SURFACE-AT ?auto_838 ?auto_840 ) ( CLEAR ?auto_838 ) ( IS-CRATE ?auto_839 ) ( not ( = ?auto_838 ?auto_839 ) ) ( AVAILABLE ?auto_845 ) ( ON ?auto_838 ?auto_843 ) ( not ( = ?auto_843 ?auto_838 ) ) ( not ( = ?auto_843 ?auto_839 ) ) ( TRUCK-AT ?auto_841 ?auto_842 ) ( not ( = ?auto_842 ?auto_840 ) ) ( HOIST-AT ?auto_844 ?auto_842 ) ( not ( = ?auto_845 ?auto_844 ) ) ( AVAILABLE ?auto_844 ) ( SURFACE-AT ?auto_839 ?auto_842 ) ( ON ?auto_839 ?auto_846 ) ( CLEAR ?auto_839 ) ( not ( = ?auto_838 ?auto_846 ) ) ( not ( = ?auto_839 ?auto_846 ) ) ( not ( = ?auto_843 ?auto_846 ) ) )
    :subtasks
    ( ( !LIFT ?auto_844 ?auto_839 ?auto_846 ?auto_842 )
      ( MAKE-2CRATE ?auto_843 ?auto_838 ?auto_839 )
      ( MAKE-1CRATE-VERIFY ?auto_838 ?auto_839 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_847 - SURFACE
      ?auto_848 - SURFACE
      ?auto_849 - SURFACE
    )
    :vars
    (
      ?auto_855 - HOIST
      ?auto_850 - PLACE
      ?auto_852 - TRUCK
      ?auto_853 - PLACE
      ?auto_851 - HOIST
      ?auto_854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_855 ?auto_850 ) ( SURFACE-AT ?auto_848 ?auto_850 ) ( CLEAR ?auto_848 ) ( IS-CRATE ?auto_849 ) ( not ( = ?auto_848 ?auto_849 ) ) ( AVAILABLE ?auto_855 ) ( ON ?auto_848 ?auto_847 ) ( not ( = ?auto_847 ?auto_848 ) ) ( not ( = ?auto_847 ?auto_849 ) ) ( TRUCK-AT ?auto_852 ?auto_853 ) ( not ( = ?auto_853 ?auto_850 ) ) ( HOIST-AT ?auto_851 ?auto_853 ) ( not ( = ?auto_855 ?auto_851 ) ) ( AVAILABLE ?auto_851 ) ( SURFACE-AT ?auto_849 ?auto_853 ) ( ON ?auto_849 ?auto_854 ) ( CLEAR ?auto_849 ) ( not ( = ?auto_848 ?auto_854 ) ) ( not ( = ?auto_849 ?auto_854 ) ) ( not ( = ?auto_847 ?auto_854 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_848 ?auto_849 )
      ( MAKE-2CRATE-VERIFY ?auto_847 ?auto_848 ?auto_849 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_856 - SURFACE
      ?auto_857 - SURFACE
    )
    :vars
    (
      ?auto_861 - HOIST
      ?auto_864 - PLACE
      ?auto_862 - SURFACE
      ?auto_859 - PLACE
      ?auto_863 - HOIST
      ?auto_860 - SURFACE
      ?auto_858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_861 ?auto_864 ) ( SURFACE-AT ?auto_856 ?auto_864 ) ( CLEAR ?auto_856 ) ( IS-CRATE ?auto_857 ) ( not ( = ?auto_856 ?auto_857 ) ) ( AVAILABLE ?auto_861 ) ( ON ?auto_856 ?auto_862 ) ( not ( = ?auto_862 ?auto_856 ) ) ( not ( = ?auto_862 ?auto_857 ) ) ( not ( = ?auto_859 ?auto_864 ) ) ( HOIST-AT ?auto_863 ?auto_859 ) ( not ( = ?auto_861 ?auto_863 ) ) ( AVAILABLE ?auto_863 ) ( SURFACE-AT ?auto_857 ?auto_859 ) ( ON ?auto_857 ?auto_860 ) ( CLEAR ?auto_857 ) ( not ( = ?auto_856 ?auto_860 ) ) ( not ( = ?auto_857 ?auto_860 ) ) ( not ( = ?auto_862 ?auto_860 ) ) ( TRUCK-AT ?auto_858 ?auto_864 ) )
    :subtasks
    ( ( !DRIVE ?auto_858 ?auto_864 ?auto_859 )
      ( MAKE-2CRATE ?auto_862 ?auto_856 ?auto_857 )
      ( MAKE-1CRATE-VERIFY ?auto_856 ?auto_857 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_865 - SURFACE
      ?auto_866 - SURFACE
      ?auto_867 - SURFACE
    )
    :vars
    (
      ?auto_869 - HOIST
      ?auto_870 - PLACE
      ?auto_868 - PLACE
      ?auto_873 - HOIST
      ?auto_872 - SURFACE
      ?auto_871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_869 ?auto_870 ) ( SURFACE-AT ?auto_866 ?auto_870 ) ( CLEAR ?auto_866 ) ( IS-CRATE ?auto_867 ) ( not ( = ?auto_866 ?auto_867 ) ) ( AVAILABLE ?auto_869 ) ( ON ?auto_866 ?auto_865 ) ( not ( = ?auto_865 ?auto_866 ) ) ( not ( = ?auto_865 ?auto_867 ) ) ( not ( = ?auto_868 ?auto_870 ) ) ( HOIST-AT ?auto_873 ?auto_868 ) ( not ( = ?auto_869 ?auto_873 ) ) ( AVAILABLE ?auto_873 ) ( SURFACE-AT ?auto_867 ?auto_868 ) ( ON ?auto_867 ?auto_872 ) ( CLEAR ?auto_867 ) ( not ( = ?auto_866 ?auto_872 ) ) ( not ( = ?auto_867 ?auto_872 ) ) ( not ( = ?auto_865 ?auto_872 ) ) ( TRUCK-AT ?auto_871 ?auto_870 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_866 ?auto_867 )
      ( MAKE-2CRATE-VERIFY ?auto_865 ?auto_866 ?auto_867 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_874 - SURFACE
      ?auto_875 - SURFACE
    )
    :vars
    (
      ?auto_882 - HOIST
      ?auto_878 - PLACE
      ?auto_876 - SURFACE
      ?auto_881 - PLACE
      ?auto_877 - HOIST
      ?auto_880 - SURFACE
      ?auto_879 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_882 ?auto_878 ) ( IS-CRATE ?auto_875 ) ( not ( = ?auto_874 ?auto_875 ) ) ( not ( = ?auto_876 ?auto_874 ) ) ( not ( = ?auto_876 ?auto_875 ) ) ( not ( = ?auto_881 ?auto_878 ) ) ( HOIST-AT ?auto_877 ?auto_881 ) ( not ( = ?auto_882 ?auto_877 ) ) ( AVAILABLE ?auto_877 ) ( SURFACE-AT ?auto_875 ?auto_881 ) ( ON ?auto_875 ?auto_880 ) ( CLEAR ?auto_875 ) ( not ( = ?auto_874 ?auto_880 ) ) ( not ( = ?auto_875 ?auto_880 ) ) ( not ( = ?auto_876 ?auto_880 ) ) ( TRUCK-AT ?auto_879 ?auto_878 ) ( SURFACE-AT ?auto_876 ?auto_878 ) ( CLEAR ?auto_876 ) ( LIFTING ?auto_882 ?auto_874 ) ( IS-CRATE ?auto_874 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_876 ?auto_874 )
      ( MAKE-2CRATE ?auto_876 ?auto_874 ?auto_875 )
      ( MAKE-1CRATE-VERIFY ?auto_874 ?auto_875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_883 - SURFACE
      ?auto_884 - SURFACE
      ?auto_885 - SURFACE
    )
    :vars
    (
      ?auto_889 - HOIST
      ?auto_891 - PLACE
      ?auto_886 - PLACE
      ?auto_890 - HOIST
      ?auto_888 - SURFACE
      ?auto_887 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_889 ?auto_891 ) ( IS-CRATE ?auto_885 ) ( not ( = ?auto_884 ?auto_885 ) ) ( not ( = ?auto_883 ?auto_884 ) ) ( not ( = ?auto_883 ?auto_885 ) ) ( not ( = ?auto_886 ?auto_891 ) ) ( HOIST-AT ?auto_890 ?auto_886 ) ( not ( = ?auto_889 ?auto_890 ) ) ( AVAILABLE ?auto_890 ) ( SURFACE-AT ?auto_885 ?auto_886 ) ( ON ?auto_885 ?auto_888 ) ( CLEAR ?auto_885 ) ( not ( = ?auto_884 ?auto_888 ) ) ( not ( = ?auto_885 ?auto_888 ) ) ( not ( = ?auto_883 ?auto_888 ) ) ( TRUCK-AT ?auto_887 ?auto_891 ) ( SURFACE-AT ?auto_883 ?auto_891 ) ( CLEAR ?auto_883 ) ( LIFTING ?auto_889 ?auto_884 ) ( IS-CRATE ?auto_884 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_884 ?auto_885 )
      ( MAKE-2CRATE-VERIFY ?auto_883 ?auto_884 ?auto_885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_892 - SURFACE
      ?auto_893 - SURFACE
    )
    :vars
    (
      ?auto_900 - HOIST
      ?auto_898 - PLACE
      ?auto_895 - SURFACE
      ?auto_897 - PLACE
      ?auto_896 - HOIST
      ?auto_899 - SURFACE
      ?auto_894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_900 ?auto_898 ) ( IS-CRATE ?auto_893 ) ( not ( = ?auto_892 ?auto_893 ) ) ( not ( = ?auto_895 ?auto_892 ) ) ( not ( = ?auto_895 ?auto_893 ) ) ( not ( = ?auto_897 ?auto_898 ) ) ( HOIST-AT ?auto_896 ?auto_897 ) ( not ( = ?auto_900 ?auto_896 ) ) ( AVAILABLE ?auto_896 ) ( SURFACE-AT ?auto_893 ?auto_897 ) ( ON ?auto_893 ?auto_899 ) ( CLEAR ?auto_893 ) ( not ( = ?auto_892 ?auto_899 ) ) ( not ( = ?auto_893 ?auto_899 ) ) ( not ( = ?auto_895 ?auto_899 ) ) ( TRUCK-AT ?auto_894 ?auto_898 ) ( SURFACE-AT ?auto_895 ?auto_898 ) ( CLEAR ?auto_895 ) ( IS-CRATE ?auto_892 ) ( AVAILABLE ?auto_900 ) ( IN ?auto_892 ?auto_894 ) )
    :subtasks
    ( ( !UNLOAD ?auto_900 ?auto_892 ?auto_894 ?auto_898 )
      ( MAKE-2CRATE ?auto_895 ?auto_892 ?auto_893 )
      ( MAKE-1CRATE-VERIFY ?auto_892 ?auto_893 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_901 - SURFACE
      ?auto_902 - SURFACE
      ?auto_903 - SURFACE
    )
    :vars
    (
      ?auto_907 - HOIST
      ?auto_908 - PLACE
      ?auto_909 - PLACE
      ?auto_906 - HOIST
      ?auto_905 - SURFACE
      ?auto_904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_907 ?auto_908 ) ( IS-CRATE ?auto_903 ) ( not ( = ?auto_902 ?auto_903 ) ) ( not ( = ?auto_901 ?auto_902 ) ) ( not ( = ?auto_901 ?auto_903 ) ) ( not ( = ?auto_909 ?auto_908 ) ) ( HOIST-AT ?auto_906 ?auto_909 ) ( not ( = ?auto_907 ?auto_906 ) ) ( AVAILABLE ?auto_906 ) ( SURFACE-AT ?auto_903 ?auto_909 ) ( ON ?auto_903 ?auto_905 ) ( CLEAR ?auto_903 ) ( not ( = ?auto_902 ?auto_905 ) ) ( not ( = ?auto_903 ?auto_905 ) ) ( not ( = ?auto_901 ?auto_905 ) ) ( TRUCK-AT ?auto_904 ?auto_908 ) ( SURFACE-AT ?auto_901 ?auto_908 ) ( CLEAR ?auto_901 ) ( IS-CRATE ?auto_902 ) ( AVAILABLE ?auto_907 ) ( IN ?auto_902 ?auto_904 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_902 ?auto_903 )
      ( MAKE-2CRATE-VERIFY ?auto_901 ?auto_902 ?auto_903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_910 - SURFACE
      ?auto_911 - SURFACE
    )
    :vars
    (
      ?auto_913 - HOIST
      ?auto_914 - PLACE
      ?auto_915 - SURFACE
      ?auto_916 - PLACE
      ?auto_917 - HOIST
      ?auto_918 - SURFACE
      ?auto_912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_913 ?auto_914 ) ( IS-CRATE ?auto_911 ) ( not ( = ?auto_910 ?auto_911 ) ) ( not ( = ?auto_915 ?auto_910 ) ) ( not ( = ?auto_915 ?auto_911 ) ) ( not ( = ?auto_916 ?auto_914 ) ) ( HOIST-AT ?auto_917 ?auto_916 ) ( not ( = ?auto_913 ?auto_917 ) ) ( AVAILABLE ?auto_917 ) ( SURFACE-AT ?auto_911 ?auto_916 ) ( ON ?auto_911 ?auto_918 ) ( CLEAR ?auto_911 ) ( not ( = ?auto_910 ?auto_918 ) ) ( not ( = ?auto_911 ?auto_918 ) ) ( not ( = ?auto_915 ?auto_918 ) ) ( SURFACE-AT ?auto_915 ?auto_914 ) ( CLEAR ?auto_915 ) ( IS-CRATE ?auto_910 ) ( AVAILABLE ?auto_913 ) ( IN ?auto_910 ?auto_912 ) ( TRUCK-AT ?auto_912 ?auto_916 ) )
    :subtasks
    ( ( !DRIVE ?auto_912 ?auto_916 ?auto_914 )
      ( MAKE-2CRATE ?auto_915 ?auto_910 ?auto_911 )
      ( MAKE-1CRATE-VERIFY ?auto_910 ?auto_911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_919 - SURFACE
      ?auto_920 - SURFACE
      ?auto_921 - SURFACE
    )
    :vars
    (
      ?auto_925 - HOIST
      ?auto_926 - PLACE
      ?auto_922 - PLACE
      ?auto_923 - HOIST
      ?auto_927 - SURFACE
      ?auto_924 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_925 ?auto_926 ) ( IS-CRATE ?auto_921 ) ( not ( = ?auto_920 ?auto_921 ) ) ( not ( = ?auto_919 ?auto_920 ) ) ( not ( = ?auto_919 ?auto_921 ) ) ( not ( = ?auto_922 ?auto_926 ) ) ( HOIST-AT ?auto_923 ?auto_922 ) ( not ( = ?auto_925 ?auto_923 ) ) ( AVAILABLE ?auto_923 ) ( SURFACE-AT ?auto_921 ?auto_922 ) ( ON ?auto_921 ?auto_927 ) ( CLEAR ?auto_921 ) ( not ( = ?auto_920 ?auto_927 ) ) ( not ( = ?auto_921 ?auto_927 ) ) ( not ( = ?auto_919 ?auto_927 ) ) ( SURFACE-AT ?auto_919 ?auto_926 ) ( CLEAR ?auto_919 ) ( IS-CRATE ?auto_920 ) ( AVAILABLE ?auto_925 ) ( IN ?auto_920 ?auto_924 ) ( TRUCK-AT ?auto_924 ?auto_922 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_920 ?auto_921 )
      ( MAKE-2CRATE-VERIFY ?auto_919 ?auto_920 ?auto_921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_928 - SURFACE
      ?auto_929 - SURFACE
    )
    :vars
    (
      ?auto_930 - HOIST
      ?auto_932 - PLACE
      ?auto_936 - SURFACE
      ?auto_935 - PLACE
      ?auto_933 - HOIST
      ?auto_931 - SURFACE
      ?auto_934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_930 ?auto_932 ) ( IS-CRATE ?auto_929 ) ( not ( = ?auto_928 ?auto_929 ) ) ( not ( = ?auto_936 ?auto_928 ) ) ( not ( = ?auto_936 ?auto_929 ) ) ( not ( = ?auto_935 ?auto_932 ) ) ( HOIST-AT ?auto_933 ?auto_935 ) ( not ( = ?auto_930 ?auto_933 ) ) ( SURFACE-AT ?auto_929 ?auto_935 ) ( ON ?auto_929 ?auto_931 ) ( CLEAR ?auto_929 ) ( not ( = ?auto_928 ?auto_931 ) ) ( not ( = ?auto_929 ?auto_931 ) ) ( not ( = ?auto_936 ?auto_931 ) ) ( SURFACE-AT ?auto_936 ?auto_932 ) ( CLEAR ?auto_936 ) ( IS-CRATE ?auto_928 ) ( AVAILABLE ?auto_930 ) ( TRUCK-AT ?auto_934 ?auto_935 ) ( LIFTING ?auto_933 ?auto_928 ) )
    :subtasks
    ( ( !LOAD ?auto_933 ?auto_928 ?auto_934 ?auto_935 )
      ( MAKE-2CRATE ?auto_936 ?auto_928 ?auto_929 )
      ( MAKE-1CRATE-VERIFY ?auto_928 ?auto_929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_937 - SURFACE
      ?auto_938 - SURFACE
      ?auto_939 - SURFACE
    )
    :vars
    (
      ?auto_944 - HOIST
      ?auto_940 - PLACE
      ?auto_942 - PLACE
      ?auto_941 - HOIST
      ?auto_943 - SURFACE
      ?auto_945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_944 ?auto_940 ) ( IS-CRATE ?auto_939 ) ( not ( = ?auto_938 ?auto_939 ) ) ( not ( = ?auto_937 ?auto_938 ) ) ( not ( = ?auto_937 ?auto_939 ) ) ( not ( = ?auto_942 ?auto_940 ) ) ( HOIST-AT ?auto_941 ?auto_942 ) ( not ( = ?auto_944 ?auto_941 ) ) ( SURFACE-AT ?auto_939 ?auto_942 ) ( ON ?auto_939 ?auto_943 ) ( CLEAR ?auto_939 ) ( not ( = ?auto_938 ?auto_943 ) ) ( not ( = ?auto_939 ?auto_943 ) ) ( not ( = ?auto_937 ?auto_943 ) ) ( SURFACE-AT ?auto_937 ?auto_940 ) ( CLEAR ?auto_937 ) ( IS-CRATE ?auto_938 ) ( AVAILABLE ?auto_944 ) ( TRUCK-AT ?auto_945 ?auto_942 ) ( LIFTING ?auto_941 ?auto_938 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_938 ?auto_939 )
      ( MAKE-2CRATE-VERIFY ?auto_937 ?auto_938 ?auto_939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_946 - SURFACE
      ?auto_947 - SURFACE
    )
    :vars
    (
      ?auto_952 - HOIST
      ?auto_950 - PLACE
      ?auto_949 - SURFACE
      ?auto_948 - PLACE
      ?auto_951 - HOIST
      ?auto_954 - SURFACE
      ?auto_953 - TRUCK
      ?auto_955 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_952 ?auto_950 ) ( IS-CRATE ?auto_947 ) ( not ( = ?auto_946 ?auto_947 ) ) ( not ( = ?auto_949 ?auto_946 ) ) ( not ( = ?auto_949 ?auto_947 ) ) ( not ( = ?auto_948 ?auto_950 ) ) ( HOIST-AT ?auto_951 ?auto_948 ) ( not ( = ?auto_952 ?auto_951 ) ) ( SURFACE-AT ?auto_947 ?auto_948 ) ( ON ?auto_947 ?auto_954 ) ( CLEAR ?auto_947 ) ( not ( = ?auto_946 ?auto_954 ) ) ( not ( = ?auto_947 ?auto_954 ) ) ( not ( = ?auto_949 ?auto_954 ) ) ( SURFACE-AT ?auto_949 ?auto_950 ) ( CLEAR ?auto_949 ) ( IS-CRATE ?auto_946 ) ( AVAILABLE ?auto_952 ) ( TRUCK-AT ?auto_953 ?auto_948 ) ( AVAILABLE ?auto_951 ) ( SURFACE-AT ?auto_946 ?auto_948 ) ( ON ?auto_946 ?auto_955 ) ( CLEAR ?auto_946 ) ( not ( = ?auto_946 ?auto_955 ) ) ( not ( = ?auto_947 ?auto_955 ) ) ( not ( = ?auto_949 ?auto_955 ) ) ( not ( = ?auto_954 ?auto_955 ) ) )
    :subtasks
    ( ( !LIFT ?auto_951 ?auto_946 ?auto_955 ?auto_948 )
      ( MAKE-2CRATE ?auto_949 ?auto_946 ?auto_947 )
      ( MAKE-1CRATE-VERIFY ?auto_946 ?auto_947 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_956 - SURFACE
      ?auto_957 - SURFACE
      ?auto_958 - SURFACE
    )
    :vars
    (
      ?auto_961 - HOIST
      ?auto_962 - PLACE
      ?auto_959 - PLACE
      ?auto_960 - HOIST
      ?auto_965 - SURFACE
      ?auto_963 - TRUCK
      ?auto_964 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_961 ?auto_962 ) ( IS-CRATE ?auto_958 ) ( not ( = ?auto_957 ?auto_958 ) ) ( not ( = ?auto_956 ?auto_957 ) ) ( not ( = ?auto_956 ?auto_958 ) ) ( not ( = ?auto_959 ?auto_962 ) ) ( HOIST-AT ?auto_960 ?auto_959 ) ( not ( = ?auto_961 ?auto_960 ) ) ( SURFACE-AT ?auto_958 ?auto_959 ) ( ON ?auto_958 ?auto_965 ) ( CLEAR ?auto_958 ) ( not ( = ?auto_957 ?auto_965 ) ) ( not ( = ?auto_958 ?auto_965 ) ) ( not ( = ?auto_956 ?auto_965 ) ) ( SURFACE-AT ?auto_956 ?auto_962 ) ( CLEAR ?auto_956 ) ( IS-CRATE ?auto_957 ) ( AVAILABLE ?auto_961 ) ( TRUCK-AT ?auto_963 ?auto_959 ) ( AVAILABLE ?auto_960 ) ( SURFACE-AT ?auto_957 ?auto_959 ) ( ON ?auto_957 ?auto_964 ) ( CLEAR ?auto_957 ) ( not ( = ?auto_957 ?auto_964 ) ) ( not ( = ?auto_958 ?auto_964 ) ) ( not ( = ?auto_956 ?auto_964 ) ) ( not ( = ?auto_965 ?auto_964 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_957 ?auto_958 )
      ( MAKE-2CRATE-VERIFY ?auto_956 ?auto_957 ?auto_958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_966 - SURFACE
      ?auto_967 - SURFACE
    )
    :vars
    (
      ?auto_975 - HOIST
      ?auto_969 - PLACE
      ?auto_970 - SURFACE
      ?auto_968 - PLACE
      ?auto_974 - HOIST
      ?auto_971 - SURFACE
      ?auto_972 - SURFACE
      ?auto_973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_975 ?auto_969 ) ( IS-CRATE ?auto_967 ) ( not ( = ?auto_966 ?auto_967 ) ) ( not ( = ?auto_970 ?auto_966 ) ) ( not ( = ?auto_970 ?auto_967 ) ) ( not ( = ?auto_968 ?auto_969 ) ) ( HOIST-AT ?auto_974 ?auto_968 ) ( not ( = ?auto_975 ?auto_974 ) ) ( SURFACE-AT ?auto_967 ?auto_968 ) ( ON ?auto_967 ?auto_971 ) ( CLEAR ?auto_967 ) ( not ( = ?auto_966 ?auto_971 ) ) ( not ( = ?auto_967 ?auto_971 ) ) ( not ( = ?auto_970 ?auto_971 ) ) ( SURFACE-AT ?auto_970 ?auto_969 ) ( CLEAR ?auto_970 ) ( IS-CRATE ?auto_966 ) ( AVAILABLE ?auto_975 ) ( AVAILABLE ?auto_974 ) ( SURFACE-AT ?auto_966 ?auto_968 ) ( ON ?auto_966 ?auto_972 ) ( CLEAR ?auto_966 ) ( not ( = ?auto_966 ?auto_972 ) ) ( not ( = ?auto_967 ?auto_972 ) ) ( not ( = ?auto_970 ?auto_972 ) ) ( not ( = ?auto_971 ?auto_972 ) ) ( TRUCK-AT ?auto_973 ?auto_969 ) )
    :subtasks
    ( ( !DRIVE ?auto_973 ?auto_969 ?auto_968 )
      ( MAKE-2CRATE ?auto_970 ?auto_966 ?auto_967 )
      ( MAKE-1CRATE-VERIFY ?auto_966 ?auto_967 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_976 - SURFACE
      ?auto_977 - SURFACE
      ?auto_978 - SURFACE
    )
    :vars
    (
      ?auto_982 - HOIST
      ?auto_979 - PLACE
      ?auto_984 - PLACE
      ?auto_983 - HOIST
      ?auto_981 - SURFACE
      ?auto_980 - SURFACE
      ?auto_985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_982 ?auto_979 ) ( IS-CRATE ?auto_978 ) ( not ( = ?auto_977 ?auto_978 ) ) ( not ( = ?auto_976 ?auto_977 ) ) ( not ( = ?auto_976 ?auto_978 ) ) ( not ( = ?auto_984 ?auto_979 ) ) ( HOIST-AT ?auto_983 ?auto_984 ) ( not ( = ?auto_982 ?auto_983 ) ) ( SURFACE-AT ?auto_978 ?auto_984 ) ( ON ?auto_978 ?auto_981 ) ( CLEAR ?auto_978 ) ( not ( = ?auto_977 ?auto_981 ) ) ( not ( = ?auto_978 ?auto_981 ) ) ( not ( = ?auto_976 ?auto_981 ) ) ( SURFACE-AT ?auto_976 ?auto_979 ) ( CLEAR ?auto_976 ) ( IS-CRATE ?auto_977 ) ( AVAILABLE ?auto_982 ) ( AVAILABLE ?auto_983 ) ( SURFACE-AT ?auto_977 ?auto_984 ) ( ON ?auto_977 ?auto_980 ) ( CLEAR ?auto_977 ) ( not ( = ?auto_977 ?auto_980 ) ) ( not ( = ?auto_978 ?auto_980 ) ) ( not ( = ?auto_976 ?auto_980 ) ) ( not ( = ?auto_981 ?auto_980 ) ) ( TRUCK-AT ?auto_985 ?auto_979 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_977 ?auto_978 )
      ( MAKE-2CRATE-VERIFY ?auto_976 ?auto_977 ?auto_978 ) )
  )

)

