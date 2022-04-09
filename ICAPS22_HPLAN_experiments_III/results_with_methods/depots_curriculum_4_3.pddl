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

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_772 - SURFACE
      ?auto_773 - SURFACE
    )
    :vars
    (
      ?auto_774 - HOIST
      ?auto_775 - PLACE
      ?auto_777 - PLACE
      ?auto_778 - HOIST
      ?auto_779 - SURFACE
      ?auto_776 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_774 ?auto_775 ) ( SURFACE-AT ?auto_772 ?auto_775 ) ( CLEAR ?auto_772 ) ( IS-CRATE ?auto_773 ) ( AVAILABLE ?auto_774 ) ( not ( = ?auto_777 ?auto_775 ) ) ( HOIST-AT ?auto_778 ?auto_777 ) ( AVAILABLE ?auto_778 ) ( SURFACE-AT ?auto_773 ?auto_777 ) ( ON ?auto_773 ?auto_779 ) ( CLEAR ?auto_773 ) ( TRUCK-AT ?auto_776 ?auto_775 ) ( not ( = ?auto_772 ?auto_773 ) ) ( not ( = ?auto_772 ?auto_779 ) ) ( not ( = ?auto_773 ?auto_779 ) ) ( not ( = ?auto_774 ?auto_778 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_776 ?auto_775 ?auto_777 )
      ( !LIFT ?auto_778 ?auto_773 ?auto_779 ?auto_777 )
      ( !LOAD ?auto_778 ?auto_773 ?auto_776 ?auto_777 )
      ( !DRIVE ?auto_776 ?auto_777 ?auto_775 )
      ( !UNLOAD ?auto_774 ?auto_773 ?auto_776 ?auto_775 )
      ( !DROP ?auto_774 ?auto_773 ?auto_772 ?auto_775 )
      ( MAKE-1CRATE-VERIFY ?auto_772 ?auto_773 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_782 - SURFACE
      ?auto_783 - SURFACE
    )
    :vars
    (
      ?auto_784 - HOIST
      ?auto_785 - PLACE
      ?auto_787 - PLACE
      ?auto_788 - HOIST
      ?auto_789 - SURFACE
      ?auto_786 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_784 ?auto_785 ) ( SURFACE-AT ?auto_782 ?auto_785 ) ( CLEAR ?auto_782 ) ( IS-CRATE ?auto_783 ) ( AVAILABLE ?auto_784 ) ( not ( = ?auto_787 ?auto_785 ) ) ( HOIST-AT ?auto_788 ?auto_787 ) ( AVAILABLE ?auto_788 ) ( SURFACE-AT ?auto_783 ?auto_787 ) ( ON ?auto_783 ?auto_789 ) ( CLEAR ?auto_783 ) ( TRUCK-AT ?auto_786 ?auto_785 ) ( not ( = ?auto_782 ?auto_783 ) ) ( not ( = ?auto_782 ?auto_789 ) ) ( not ( = ?auto_783 ?auto_789 ) ) ( not ( = ?auto_784 ?auto_788 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_786 ?auto_785 ?auto_787 )
      ( !LIFT ?auto_788 ?auto_783 ?auto_789 ?auto_787 )
      ( !LOAD ?auto_788 ?auto_783 ?auto_786 ?auto_787 )
      ( !DRIVE ?auto_786 ?auto_787 ?auto_785 )
      ( !UNLOAD ?auto_784 ?auto_783 ?auto_786 ?auto_785 )
      ( !DROP ?auto_784 ?auto_783 ?auto_782 ?auto_785 )
      ( MAKE-1CRATE-VERIFY ?auto_782 ?auto_783 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_793 - SURFACE
      ?auto_794 - SURFACE
      ?auto_795 - SURFACE
    )
    :vars
    (
      ?auto_799 - HOIST
      ?auto_796 - PLACE
      ?auto_800 - PLACE
      ?auto_797 - HOIST
      ?auto_801 - SURFACE
      ?auto_804 - PLACE
      ?auto_802 - HOIST
      ?auto_803 - SURFACE
      ?auto_798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_799 ?auto_796 ) ( IS-CRATE ?auto_795 ) ( not ( = ?auto_800 ?auto_796 ) ) ( HOIST-AT ?auto_797 ?auto_800 ) ( AVAILABLE ?auto_797 ) ( SURFACE-AT ?auto_795 ?auto_800 ) ( ON ?auto_795 ?auto_801 ) ( CLEAR ?auto_795 ) ( not ( = ?auto_794 ?auto_795 ) ) ( not ( = ?auto_794 ?auto_801 ) ) ( not ( = ?auto_795 ?auto_801 ) ) ( not ( = ?auto_799 ?auto_797 ) ) ( SURFACE-AT ?auto_793 ?auto_796 ) ( CLEAR ?auto_793 ) ( IS-CRATE ?auto_794 ) ( AVAILABLE ?auto_799 ) ( not ( = ?auto_804 ?auto_796 ) ) ( HOIST-AT ?auto_802 ?auto_804 ) ( AVAILABLE ?auto_802 ) ( SURFACE-AT ?auto_794 ?auto_804 ) ( ON ?auto_794 ?auto_803 ) ( CLEAR ?auto_794 ) ( TRUCK-AT ?auto_798 ?auto_796 ) ( not ( = ?auto_793 ?auto_794 ) ) ( not ( = ?auto_793 ?auto_803 ) ) ( not ( = ?auto_794 ?auto_803 ) ) ( not ( = ?auto_799 ?auto_802 ) ) ( not ( = ?auto_793 ?auto_795 ) ) ( not ( = ?auto_793 ?auto_801 ) ) ( not ( = ?auto_795 ?auto_803 ) ) ( not ( = ?auto_800 ?auto_804 ) ) ( not ( = ?auto_797 ?auto_802 ) ) ( not ( = ?auto_801 ?auto_803 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_793 ?auto_794 )
      ( MAKE-1CRATE ?auto_794 ?auto_795 )
      ( MAKE-2CRATE-VERIFY ?auto_793 ?auto_794 ?auto_795 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_807 - SURFACE
      ?auto_808 - SURFACE
    )
    :vars
    (
      ?auto_809 - HOIST
      ?auto_810 - PLACE
      ?auto_812 - PLACE
      ?auto_813 - HOIST
      ?auto_814 - SURFACE
      ?auto_811 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_809 ?auto_810 ) ( SURFACE-AT ?auto_807 ?auto_810 ) ( CLEAR ?auto_807 ) ( IS-CRATE ?auto_808 ) ( AVAILABLE ?auto_809 ) ( not ( = ?auto_812 ?auto_810 ) ) ( HOIST-AT ?auto_813 ?auto_812 ) ( AVAILABLE ?auto_813 ) ( SURFACE-AT ?auto_808 ?auto_812 ) ( ON ?auto_808 ?auto_814 ) ( CLEAR ?auto_808 ) ( TRUCK-AT ?auto_811 ?auto_810 ) ( not ( = ?auto_807 ?auto_808 ) ) ( not ( = ?auto_807 ?auto_814 ) ) ( not ( = ?auto_808 ?auto_814 ) ) ( not ( = ?auto_809 ?auto_813 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_811 ?auto_810 ?auto_812 )
      ( !LIFT ?auto_813 ?auto_808 ?auto_814 ?auto_812 )
      ( !LOAD ?auto_813 ?auto_808 ?auto_811 ?auto_812 )
      ( !DRIVE ?auto_811 ?auto_812 ?auto_810 )
      ( !UNLOAD ?auto_809 ?auto_808 ?auto_811 ?auto_810 )
      ( !DROP ?auto_809 ?auto_808 ?auto_807 ?auto_810 )
      ( MAKE-1CRATE-VERIFY ?auto_807 ?auto_808 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_819 - SURFACE
      ?auto_820 - SURFACE
      ?auto_821 - SURFACE
      ?auto_822 - SURFACE
    )
    :vars
    (
      ?auto_824 - HOIST
      ?auto_823 - PLACE
      ?auto_828 - PLACE
      ?auto_825 - HOIST
      ?auto_826 - SURFACE
      ?auto_832 - PLACE
      ?auto_833 - HOIST
      ?auto_834 - SURFACE
      ?auto_831 - PLACE
      ?auto_829 - HOIST
      ?auto_830 - SURFACE
      ?auto_827 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_824 ?auto_823 ) ( IS-CRATE ?auto_822 ) ( not ( = ?auto_828 ?auto_823 ) ) ( HOIST-AT ?auto_825 ?auto_828 ) ( AVAILABLE ?auto_825 ) ( SURFACE-AT ?auto_822 ?auto_828 ) ( ON ?auto_822 ?auto_826 ) ( CLEAR ?auto_822 ) ( not ( = ?auto_821 ?auto_822 ) ) ( not ( = ?auto_821 ?auto_826 ) ) ( not ( = ?auto_822 ?auto_826 ) ) ( not ( = ?auto_824 ?auto_825 ) ) ( IS-CRATE ?auto_821 ) ( not ( = ?auto_832 ?auto_823 ) ) ( HOIST-AT ?auto_833 ?auto_832 ) ( AVAILABLE ?auto_833 ) ( SURFACE-AT ?auto_821 ?auto_832 ) ( ON ?auto_821 ?auto_834 ) ( CLEAR ?auto_821 ) ( not ( = ?auto_820 ?auto_821 ) ) ( not ( = ?auto_820 ?auto_834 ) ) ( not ( = ?auto_821 ?auto_834 ) ) ( not ( = ?auto_824 ?auto_833 ) ) ( SURFACE-AT ?auto_819 ?auto_823 ) ( CLEAR ?auto_819 ) ( IS-CRATE ?auto_820 ) ( AVAILABLE ?auto_824 ) ( not ( = ?auto_831 ?auto_823 ) ) ( HOIST-AT ?auto_829 ?auto_831 ) ( AVAILABLE ?auto_829 ) ( SURFACE-AT ?auto_820 ?auto_831 ) ( ON ?auto_820 ?auto_830 ) ( CLEAR ?auto_820 ) ( TRUCK-AT ?auto_827 ?auto_823 ) ( not ( = ?auto_819 ?auto_820 ) ) ( not ( = ?auto_819 ?auto_830 ) ) ( not ( = ?auto_820 ?auto_830 ) ) ( not ( = ?auto_824 ?auto_829 ) ) ( not ( = ?auto_819 ?auto_821 ) ) ( not ( = ?auto_819 ?auto_834 ) ) ( not ( = ?auto_821 ?auto_830 ) ) ( not ( = ?auto_832 ?auto_831 ) ) ( not ( = ?auto_833 ?auto_829 ) ) ( not ( = ?auto_834 ?auto_830 ) ) ( not ( = ?auto_819 ?auto_822 ) ) ( not ( = ?auto_819 ?auto_826 ) ) ( not ( = ?auto_820 ?auto_822 ) ) ( not ( = ?auto_820 ?auto_826 ) ) ( not ( = ?auto_822 ?auto_834 ) ) ( not ( = ?auto_822 ?auto_830 ) ) ( not ( = ?auto_828 ?auto_832 ) ) ( not ( = ?auto_828 ?auto_831 ) ) ( not ( = ?auto_825 ?auto_833 ) ) ( not ( = ?auto_825 ?auto_829 ) ) ( not ( = ?auto_826 ?auto_834 ) ) ( not ( = ?auto_826 ?auto_830 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_819 ?auto_820 ?auto_821 )
      ( MAKE-1CRATE ?auto_821 ?auto_822 )
      ( MAKE-3CRATE-VERIFY ?auto_819 ?auto_820 ?auto_821 ?auto_822 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_837 - SURFACE
      ?auto_838 - SURFACE
    )
    :vars
    (
      ?auto_839 - HOIST
      ?auto_840 - PLACE
      ?auto_842 - PLACE
      ?auto_843 - HOIST
      ?auto_844 - SURFACE
      ?auto_841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_839 ?auto_840 ) ( SURFACE-AT ?auto_837 ?auto_840 ) ( CLEAR ?auto_837 ) ( IS-CRATE ?auto_838 ) ( AVAILABLE ?auto_839 ) ( not ( = ?auto_842 ?auto_840 ) ) ( HOIST-AT ?auto_843 ?auto_842 ) ( AVAILABLE ?auto_843 ) ( SURFACE-AT ?auto_838 ?auto_842 ) ( ON ?auto_838 ?auto_844 ) ( CLEAR ?auto_838 ) ( TRUCK-AT ?auto_841 ?auto_840 ) ( not ( = ?auto_837 ?auto_838 ) ) ( not ( = ?auto_837 ?auto_844 ) ) ( not ( = ?auto_838 ?auto_844 ) ) ( not ( = ?auto_839 ?auto_843 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_841 ?auto_840 ?auto_842 )
      ( !LIFT ?auto_843 ?auto_838 ?auto_844 ?auto_842 )
      ( !LOAD ?auto_843 ?auto_838 ?auto_841 ?auto_842 )
      ( !DRIVE ?auto_841 ?auto_842 ?auto_840 )
      ( !UNLOAD ?auto_839 ?auto_838 ?auto_841 ?auto_840 )
      ( !DROP ?auto_839 ?auto_838 ?auto_837 ?auto_840 )
      ( MAKE-1CRATE-VERIFY ?auto_837 ?auto_838 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_850 - SURFACE
      ?auto_851 - SURFACE
      ?auto_852 - SURFACE
      ?auto_853 - SURFACE
      ?auto_854 - SURFACE
    )
    :vars
    (
      ?auto_855 - HOIST
      ?auto_858 - PLACE
      ?auto_859 - PLACE
      ?auto_857 - HOIST
      ?auto_856 - SURFACE
      ?auto_867 - PLACE
      ?auto_868 - HOIST
      ?auto_869 - SURFACE
      ?auto_863 - PLACE
      ?auto_864 - HOIST
      ?auto_866 - SURFACE
      ?auto_865 - PLACE
      ?auto_861 - HOIST
      ?auto_862 - SURFACE
      ?auto_860 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_855 ?auto_858 ) ( IS-CRATE ?auto_854 ) ( not ( = ?auto_859 ?auto_858 ) ) ( HOIST-AT ?auto_857 ?auto_859 ) ( AVAILABLE ?auto_857 ) ( SURFACE-AT ?auto_854 ?auto_859 ) ( ON ?auto_854 ?auto_856 ) ( CLEAR ?auto_854 ) ( not ( = ?auto_853 ?auto_854 ) ) ( not ( = ?auto_853 ?auto_856 ) ) ( not ( = ?auto_854 ?auto_856 ) ) ( not ( = ?auto_855 ?auto_857 ) ) ( IS-CRATE ?auto_853 ) ( not ( = ?auto_867 ?auto_858 ) ) ( HOIST-AT ?auto_868 ?auto_867 ) ( AVAILABLE ?auto_868 ) ( SURFACE-AT ?auto_853 ?auto_867 ) ( ON ?auto_853 ?auto_869 ) ( CLEAR ?auto_853 ) ( not ( = ?auto_852 ?auto_853 ) ) ( not ( = ?auto_852 ?auto_869 ) ) ( not ( = ?auto_853 ?auto_869 ) ) ( not ( = ?auto_855 ?auto_868 ) ) ( IS-CRATE ?auto_852 ) ( not ( = ?auto_863 ?auto_858 ) ) ( HOIST-AT ?auto_864 ?auto_863 ) ( AVAILABLE ?auto_864 ) ( SURFACE-AT ?auto_852 ?auto_863 ) ( ON ?auto_852 ?auto_866 ) ( CLEAR ?auto_852 ) ( not ( = ?auto_851 ?auto_852 ) ) ( not ( = ?auto_851 ?auto_866 ) ) ( not ( = ?auto_852 ?auto_866 ) ) ( not ( = ?auto_855 ?auto_864 ) ) ( SURFACE-AT ?auto_850 ?auto_858 ) ( CLEAR ?auto_850 ) ( IS-CRATE ?auto_851 ) ( AVAILABLE ?auto_855 ) ( not ( = ?auto_865 ?auto_858 ) ) ( HOIST-AT ?auto_861 ?auto_865 ) ( AVAILABLE ?auto_861 ) ( SURFACE-AT ?auto_851 ?auto_865 ) ( ON ?auto_851 ?auto_862 ) ( CLEAR ?auto_851 ) ( TRUCK-AT ?auto_860 ?auto_858 ) ( not ( = ?auto_850 ?auto_851 ) ) ( not ( = ?auto_850 ?auto_862 ) ) ( not ( = ?auto_851 ?auto_862 ) ) ( not ( = ?auto_855 ?auto_861 ) ) ( not ( = ?auto_850 ?auto_852 ) ) ( not ( = ?auto_850 ?auto_866 ) ) ( not ( = ?auto_852 ?auto_862 ) ) ( not ( = ?auto_863 ?auto_865 ) ) ( not ( = ?auto_864 ?auto_861 ) ) ( not ( = ?auto_866 ?auto_862 ) ) ( not ( = ?auto_850 ?auto_853 ) ) ( not ( = ?auto_850 ?auto_869 ) ) ( not ( = ?auto_851 ?auto_853 ) ) ( not ( = ?auto_851 ?auto_869 ) ) ( not ( = ?auto_853 ?auto_866 ) ) ( not ( = ?auto_853 ?auto_862 ) ) ( not ( = ?auto_867 ?auto_863 ) ) ( not ( = ?auto_867 ?auto_865 ) ) ( not ( = ?auto_868 ?auto_864 ) ) ( not ( = ?auto_868 ?auto_861 ) ) ( not ( = ?auto_869 ?auto_866 ) ) ( not ( = ?auto_869 ?auto_862 ) ) ( not ( = ?auto_850 ?auto_854 ) ) ( not ( = ?auto_850 ?auto_856 ) ) ( not ( = ?auto_851 ?auto_854 ) ) ( not ( = ?auto_851 ?auto_856 ) ) ( not ( = ?auto_852 ?auto_854 ) ) ( not ( = ?auto_852 ?auto_856 ) ) ( not ( = ?auto_854 ?auto_869 ) ) ( not ( = ?auto_854 ?auto_866 ) ) ( not ( = ?auto_854 ?auto_862 ) ) ( not ( = ?auto_859 ?auto_867 ) ) ( not ( = ?auto_859 ?auto_863 ) ) ( not ( = ?auto_859 ?auto_865 ) ) ( not ( = ?auto_857 ?auto_868 ) ) ( not ( = ?auto_857 ?auto_864 ) ) ( not ( = ?auto_857 ?auto_861 ) ) ( not ( = ?auto_856 ?auto_869 ) ) ( not ( = ?auto_856 ?auto_866 ) ) ( not ( = ?auto_856 ?auto_862 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_850 ?auto_851 ?auto_852 ?auto_853 )
      ( MAKE-1CRATE ?auto_853 ?auto_854 )
      ( MAKE-4CRATE-VERIFY ?auto_850 ?auto_851 ?auto_852 ?auto_853 ?auto_854 ) )
  )

)

