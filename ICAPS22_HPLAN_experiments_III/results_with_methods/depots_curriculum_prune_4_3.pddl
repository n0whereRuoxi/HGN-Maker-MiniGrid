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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_793 - SURFACE
      ?auto_794 - SURFACE
      ?auto_795 - SURFACE
    )
    :vars
    (
      ?auto_796 - HOIST
      ?auto_801 - PLACE
      ?auto_797 - PLACE
      ?auto_799 - HOIST
      ?auto_800 - SURFACE
      ?auto_803 - PLACE
      ?auto_802 - HOIST
      ?auto_804 - SURFACE
      ?auto_798 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_796 ?auto_801 ) ( IS-CRATE ?auto_795 ) ( not ( = ?auto_797 ?auto_801 ) ) ( HOIST-AT ?auto_799 ?auto_797 ) ( AVAILABLE ?auto_799 ) ( SURFACE-AT ?auto_795 ?auto_797 ) ( ON ?auto_795 ?auto_800 ) ( CLEAR ?auto_795 ) ( not ( = ?auto_794 ?auto_795 ) ) ( not ( = ?auto_794 ?auto_800 ) ) ( not ( = ?auto_795 ?auto_800 ) ) ( not ( = ?auto_796 ?auto_799 ) ) ( SURFACE-AT ?auto_793 ?auto_801 ) ( CLEAR ?auto_793 ) ( IS-CRATE ?auto_794 ) ( AVAILABLE ?auto_796 ) ( not ( = ?auto_803 ?auto_801 ) ) ( HOIST-AT ?auto_802 ?auto_803 ) ( AVAILABLE ?auto_802 ) ( SURFACE-AT ?auto_794 ?auto_803 ) ( ON ?auto_794 ?auto_804 ) ( CLEAR ?auto_794 ) ( TRUCK-AT ?auto_798 ?auto_801 ) ( not ( = ?auto_793 ?auto_794 ) ) ( not ( = ?auto_793 ?auto_804 ) ) ( not ( = ?auto_794 ?auto_804 ) ) ( not ( = ?auto_796 ?auto_802 ) ) ( not ( = ?auto_793 ?auto_795 ) ) ( not ( = ?auto_793 ?auto_800 ) ) ( not ( = ?auto_795 ?auto_804 ) ) ( not ( = ?auto_797 ?auto_803 ) ) ( not ( = ?auto_799 ?auto_802 ) ) ( not ( = ?auto_800 ?auto_804 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_793 ?auto_794 )
      ( MAKE-1CRATE ?auto_794 ?auto_795 )
      ( MAKE-2CRATE-VERIFY ?auto_793 ?auto_794 ?auto_795 ) )
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
      ?auto_828 - HOIST
      ?auto_826 - PLACE
      ?auto_824 - PLACE
      ?auto_827 - HOIST
      ?auto_825 - SURFACE
      ?auto_834 - PLACE
      ?auto_832 - HOIST
      ?auto_833 - SURFACE
      ?auto_830 - PLACE
      ?auto_829 - HOIST
      ?auto_831 - SURFACE
      ?auto_823 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_828 ?auto_826 ) ( IS-CRATE ?auto_822 ) ( not ( = ?auto_824 ?auto_826 ) ) ( HOIST-AT ?auto_827 ?auto_824 ) ( AVAILABLE ?auto_827 ) ( SURFACE-AT ?auto_822 ?auto_824 ) ( ON ?auto_822 ?auto_825 ) ( CLEAR ?auto_822 ) ( not ( = ?auto_821 ?auto_822 ) ) ( not ( = ?auto_821 ?auto_825 ) ) ( not ( = ?auto_822 ?auto_825 ) ) ( not ( = ?auto_828 ?auto_827 ) ) ( IS-CRATE ?auto_821 ) ( not ( = ?auto_834 ?auto_826 ) ) ( HOIST-AT ?auto_832 ?auto_834 ) ( AVAILABLE ?auto_832 ) ( SURFACE-AT ?auto_821 ?auto_834 ) ( ON ?auto_821 ?auto_833 ) ( CLEAR ?auto_821 ) ( not ( = ?auto_820 ?auto_821 ) ) ( not ( = ?auto_820 ?auto_833 ) ) ( not ( = ?auto_821 ?auto_833 ) ) ( not ( = ?auto_828 ?auto_832 ) ) ( SURFACE-AT ?auto_819 ?auto_826 ) ( CLEAR ?auto_819 ) ( IS-CRATE ?auto_820 ) ( AVAILABLE ?auto_828 ) ( not ( = ?auto_830 ?auto_826 ) ) ( HOIST-AT ?auto_829 ?auto_830 ) ( AVAILABLE ?auto_829 ) ( SURFACE-AT ?auto_820 ?auto_830 ) ( ON ?auto_820 ?auto_831 ) ( CLEAR ?auto_820 ) ( TRUCK-AT ?auto_823 ?auto_826 ) ( not ( = ?auto_819 ?auto_820 ) ) ( not ( = ?auto_819 ?auto_831 ) ) ( not ( = ?auto_820 ?auto_831 ) ) ( not ( = ?auto_828 ?auto_829 ) ) ( not ( = ?auto_819 ?auto_821 ) ) ( not ( = ?auto_819 ?auto_833 ) ) ( not ( = ?auto_821 ?auto_831 ) ) ( not ( = ?auto_834 ?auto_830 ) ) ( not ( = ?auto_832 ?auto_829 ) ) ( not ( = ?auto_833 ?auto_831 ) ) ( not ( = ?auto_819 ?auto_822 ) ) ( not ( = ?auto_819 ?auto_825 ) ) ( not ( = ?auto_820 ?auto_822 ) ) ( not ( = ?auto_820 ?auto_825 ) ) ( not ( = ?auto_822 ?auto_833 ) ) ( not ( = ?auto_822 ?auto_831 ) ) ( not ( = ?auto_824 ?auto_834 ) ) ( not ( = ?auto_824 ?auto_830 ) ) ( not ( = ?auto_827 ?auto_832 ) ) ( not ( = ?auto_827 ?auto_829 ) ) ( not ( = ?auto_825 ?auto_833 ) ) ( not ( = ?auto_825 ?auto_831 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_819 ?auto_820 ?auto_821 )
      ( MAKE-1CRATE ?auto_821 ?auto_822 )
      ( MAKE-3CRATE-VERIFY ?auto_819 ?auto_820 ?auto_821 ?auto_822 ) )
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
      ?auto_860 - HOIST
      ?auto_855 - PLACE
      ?auto_856 - PLACE
      ?auto_859 - HOIST
      ?auto_857 - SURFACE
      ?auto_862 - PLACE
      ?auto_861 - HOIST
      ?auto_869 - SURFACE
      ?auto_866 - PLACE
      ?auto_865 - HOIST
      ?auto_868 - SURFACE
      ?auto_863 - PLACE
      ?auto_864 - HOIST
      ?auto_867 - SURFACE
      ?auto_858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_860 ?auto_855 ) ( IS-CRATE ?auto_854 ) ( not ( = ?auto_856 ?auto_855 ) ) ( HOIST-AT ?auto_859 ?auto_856 ) ( AVAILABLE ?auto_859 ) ( SURFACE-AT ?auto_854 ?auto_856 ) ( ON ?auto_854 ?auto_857 ) ( CLEAR ?auto_854 ) ( not ( = ?auto_853 ?auto_854 ) ) ( not ( = ?auto_853 ?auto_857 ) ) ( not ( = ?auto_854 ?auto_857 ) ) ( not ( = ?auto_860 ?auto_859 ) ) ( IS-CRATE ?auto_853 ) ( not ( = ?auto_862 ?auto_855 ) ) ( HOIST-AT ?auto_861 ?auto_862 ) ( AVAILABLE ?auto_861 ) ( SURFACE-AT ?auto_853 ?auto_862 ) ( ON ?auto_853 ?auto_869 ) ( CLEAR ?auto_853 ) ( not ( = ?auto_852 ?auto_853 ) ) ( not ( = ?auto_852 ?auto_869 ) ) ( not ( = ?auto_853 ?auto_869 ) ) ( not ( = ?auto_860 ?auto_861 ) ) ( IS-CRATE ?auto_852 ) ( not ( = ?auto_866 ?auto_855 ) ) ( HOIST-AT ?auto_865 ?auto_866 ) ( AVAILABLE ?auto_865 ) ( SURFACE-AT ?auto_852 ?auto_866 ) ( ON ?auto_852 ?auto_868 ) ( CLEAR ?auto_852 ) ( not ( = ?auto_851 ?auto_852 ) ) ( not ( = ?auto_851 ?auto_868 ) ) ( not ( = ?auto_852 ?auto_868 ) ) ( not ( = ?auto_860 ?auto_865 ) ) ( SURFACE-AT ?auto_850 ?auto_855 ) ( CLEAR ?auto_850 ) ( IS-CRATE ?auto_851 ) ( AVAILABLE ?auto_860 ) ( not ( = ?auto_863 ?auto_855 ) ) ( HOIST-AT ?auto_864 ?auto_863 ) ( AVAILABLE ?auto_864 ) ( SURFACE-AT ?auto_851 ?auto_863 ) ( ON ?auto_851 ?auto_867 ) ( CLEAR ?auto_851 ) ( TRUCK-AT ?auto_858 ?auto_855 ) ( not ( = ?auto_850 ?auto_851 ) ) ( not ( = ?auto_850 ?auto_867 ) ) ( not ( = ?auto_851 ?auto_867 ) ) ( not ( = ?auto_860 ?auto_864 ) ) ( not ( = ?auto_850 ?auto_852 ) ) ( not ( = ?auto_850 ?auto_868 ) ) ( not ( = ?auto_852 ?auto_867 ) ) ( not ( = ?auto_866 ?auto_863 ) ) ( not ( = ?auto_865 ?auto_864 ) ) ( not ( = ?auto_868 ?auto_867 ) ) ( not ( = ?auto_850 ?auto_853 ) ) ( not ( = ?auto_850 ?auto_869 ) ) ( not ( = ?auto_851 ?auto_853 ) ) ( not ( = ?auto_851 ?auto_869 ) ) ( not ( = ?auto_853 ?auto_868 ) ) ( not ( = ?auto_853 ?auto_867 ) ) ( not ( = ?auto_862 ?auto_866 ) ) ( not ( = ?auto_862 ?auto_863 ) ) ( not ( = ?auto_861 ?auto_865 ) ) ( not ( = ?auto_861 ?auto_864 ) ) ( not ( = ?auto_869 ?auto_868 ) ) ( not ( = ?auto_869 ?auto_867 ) ) ( not ( = ?auto_850 ?auto_854 ) ) ( not ( = ?auto_850 ?auto_857 ) ) ( not ( = ?auto_851 ?auto_854 ) ) ( not ( = ?auto_851 ?auto_857 ) ) ( not ( = ?auto_852 ?auto_854 ) ) ( not ( = ?auto_852 ?auto_857 ) ) ( not ( = ?auto_854 ?auto_869 ) ) ( not ( = ?auto_854 ?auto_868 ) ) ( not ( = ?auto_854 ?auto_867 ) ) ( not ( = ?auto_856 ?auto_862 ) ) ( not ( = ?auto_856 ?auto_866 ) ) ( not ( = ?auto_856 ?auto_863 ) ) ( not ( = ?auto_859 ?auto_861 ) ) ( not ( = ?auto_859 ?auto_865 ) ) ( not ( = ?auto_859 ?auto_864 ) ) ( not ( = ?auto_857 ?auto_869 ) ) ( not ( = ?auto_857 ?auto_868 ) ) ( not ( = ?auto_857 ?auto_867 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_850 ?auto_851 ?auto_852 ?auto_853 )
      ( MAKE-1CRATE ?auto_853 ?auto_854 )
      ( MAKE-4CRATE-VERIFY ?auto_850 ?auto_851 ?auto_852 ?auto_853 ?auto_854 ) )
  )

)

