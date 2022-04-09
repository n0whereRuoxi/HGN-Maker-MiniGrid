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
      ?auto_776 - SURFACE
      ?auto_777 - SURFACE
    )
    :vars
    (
      ?auto_778 - HOIST
      ?auto_779 - PLACE
      ?auto_781 - PLACE
      ?auto_782 - HOIST
      ?auto_783 - SURFACE
      ?auto_780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_778 ?auto_779 ) ( SURFACE-AT ?auto_776 ?auto_779 ) ( CLEAR ?auto_776 ) ( IS-CRATE ?auto_777 ) ( AVAILABLE ?auto_778 ) ( not ( = ?auto_781 ?auto_779 ) ) ( HOIST-AT ?auto_782 ?auto_781 ) ( AVAILABLE ?auto_782 ) ( SURFACE-AT ?auto_777 ?auto_781 ) ( ON ?auto_777 ?auto_783 ) ( CLEAR ?auto_777 ) ( TRUCK-AT ?auto_780 ?auto_779 ) ( not ( = ?auto_776 ?auto_777 ) ) ( not ( = ?auto_776 ?auto_783 ) ) ( not ( = ?auto_777 ?auto_783 ) ) ( not ( = ?auto_778 ?auto_782 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_780 ?auto_779 ?auto_781 )
      ( !LIFT ?auto_782 ?auto_777 ?auto_783 ?auto_781 )
      ( !LOAD ?auto_782 ?auto_777 ?auto_780 ?auto_781 )
      ( !DRIVE ?auto_780 ?auto_781 ?auto_779 )
      ( !UNLOAD ?auto_778 ?auto_777 ?auto_780 ?auto_779 )
      ( !DROP ?auto_778 ?auto_777 ?auto_776 ?auto_779 )
      ( MAKE-1CRATE-VERIFY ?auto_776 ?auto_777 ) )
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
      ?auto_801 - PLACE
      ?auto_805 - PLACE
      ?auto_804 - HOIST
      ?auto_803 - SURFACE
      ?auto_807 - PLACE
      ?auto_806 - HOIST
      ?auto_808 - SURFACE
      ?auto_802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_800 ?auto_801 ) ( IS-CRATE ?auto_799 ) ( not ( = ?auto_805 ?auto_801 ) ) ( HOIST-AT ?auto_804 ?auto_805 ) ( AVAILABLE ?auto_804 ) ( SURFACE-AT ?auto_799 ?auto_805 ) ( ON ?auto_799 ?auto_803 ) ( CLEAR ?auto_799 ) ( not ( = ?auto_798 ?auto_799 ) ) ( not ( = ?auto_798 ?auto_803 ) ) ( not ( = ?auto_799 ?auto_803 ) ) ( not ( = ?auto_800 ?auto_804 ) ) ( SURFACE-AT ?auto_797 ?auto_801 ) ( CLEAR ?auto_797 ) ( IS-CRATE ?auto_798 ) ( AVAILABLE ?auto_800 ) ( not ( = ?auto_807 ?auto_801 ) ) ( HOIST-AT ?auto_806 ?auto_807 ) ( AVAILABLE ?auto_806 ) ( SURFACE-AT ?auto_798 ?auto_807 ) ( ON ?auto_798 ?auto_808 ) ( CLEAR ?auto_798 ) ( TRUCK-AT ?auto_802 ?auto_801 ) ( not ( = ?auto_797 ?auto_798 ) ) ( not ( = ?auto_797 ?auto_808 ) ) ( not ( = ?auto_798 ?auto_808 ) ) ( not ( = ?auto_800 ?auto_806 ) ) ( not ( = ?auto_797 ?auto_799 ) ) ( not ( = ?auto_797 ?auto_803 ) ) ( not ( = ?auto_799 ?auto_808 ) ) ( not ( = ?auto_805 ?auto_807 ) ) ( not ( = ?auto_804 ?auto_806 ) ) ( not ( = ?auto_803 ?auto_808 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_797 ?auto_798 )
      ( MAKE-1CRATE ?auto_798 ?auto_799 )
      ( MAKE-2CRATE-VERIFY ?auto_797 ?auto_798 ?auto_799 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_823 - SURFACE
      ?auto_824 - SURFACE
      ?auto_825 - SURFACE
      ?auto_826 - SURFACE
    )
    :vars
    (
      ?auto_832 - HOIST
      ?auto_831 - PLACE
      ?auto_827 - PLACE
      ?auto_829 - HOIST
      ?auto_828 - SURFACE
      ?auto_833 - PLACE
      ?auto_838 - HOIST
      ?auto_834 - SURFACE
      ?auto_836 - PLACE
      ?auto_835 - HOIST
      ?auto_837 - SURFACE
      ?auto_830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_832 ?auto_831 ) ( IS-CRATE ?auto_826 ) ( not ( = ?auto_827 ?auto_831 ) ) ( HOIST-AT ?auto_829 ?auto_827 ) ( AVAILABLE ?auto_829 ) ( SURFACE-AT ?auto_826 ?auto_827 ) ( ON ?auto_826 ?auto_828 ) ( CLEAR ?auto_826 ) ( not ( = ?auto_825 ?auto_826 ) ) ( not ( = ?auto_825 ?auto_828 ) ) ( not ( = ?auto_826 ?auto_828 ) ) ( not ( = ?auto_832 ?auto_829 ) ) ( IS-CRATE ?auto_825 ) ( not ( = ?auto_833 ?auto_831 ) ) ( HOIST-AT ?auto_838 ?auto_833 ) ( AVAILABLE ?auto_838 ) ( SURFACE-AT ?auto_825 ?auto_833 ) ( ON ?auto_825 ?auto_834 ) ( CLEAR ?auto_825 ) ( not ( = ?auto_824 ?auto_825 ) ) ( not ( = ?auto_824 ?auto_834 ) ) ( not ( = ?auto_825 ?auto_834 ) ) ( not ( = ?auto_832 ?auto_838 ) ) ( SURFACE-AT ?auto_823 ?auto_831 ) ( CLEAR ?auto_823 ) ( IS-CRATE ?auto_824 ) ( AVAILABLE ?auto_832 ) ( not ( = ?auto_836 ?auto_831 ) ) ( HOIST-AT ?auto_835 ?auto_836 ) ( AVAILABLE ?auto_835 ) ( SURFACE-AT ?auto_824 ?auto_836 ) ( ON ?auto_824 ?auto_837 ) ( CLEAR ?auto_824 ) ( TRUCK-AT ?auto_830 ?auto_831 ) ( not ( = ?auto_823 ?auto_824 ) ) ( not ( = ?auto_823 ?auto_837 ) ) ( not ( = ?auto_824 ?auto_837 ) ) ( not ( = ?auto_832 ?auto_835 ) ) ( not ( = ?auto_823 ?auto_825 ) ) ( not ( = ?auto_823 ?auto_834 ) ) ( not ( = ?auto_825 ?auto_837 ) ) ( not ( = ?auto_833 ?auto_836 ) ) ( not ( = ?auto_838 ?auto_835 ) ) ( not ( = ?auto_834 ?auto_837 ) ) ( not ( = ?auto_823 ?auto_826 ) ) ( not ( = ?auto_823 ?auto_828 ) ) ( not ( = ?auto_824 ?auto_826 ) ) ( not ( = ?auto_824 ?auto_828 ) ) ( not ( = ?auto_826 ?auto_834 ) ) ( not ( = ?auto_826 ?auto_837 ) ) ( not ( = ?auto_827 ?auto_833 ) ) ( not ( = ?auto_827 ?auto_836 ) ) ( not ( = ?auto_829 ?auto_838 ) ) ( not ( = ?auto_829 ?auto_835 ) ) ( not ( = ?auto_828 ?auto_834 ) ) ( not ( = ?auto_828 ?auto_837 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_823 ?auto_824 ?auto_825 )
      ( MAKE-1CRATE ?auto_825 ?auto_826 )
      ( MAKE-3CRATE-VERIFY ?auto_823 ?auto_824 ?auto_825 ?auto_826 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_854 - SURFACE
      ?auto_855 - SURFACE
      ?auto_856 - SURFACE
      ?auto_857 - SURFACE
      ?auto_858 - SURFACE
    )
    :vars
    (
      ?auto_859 - HOIST
      ?auto_860 - PLACE
      ?auto_864 - PLACE
      ?auto_863 - HOIST
      ?auto_862 - SURFACE
      ?auto_867 - PLACE
      ?auto_868 - HOIST
      ?auto_869 - SURFACE
      ?auto_870 - PLACE
      ?auto_865 - HOIST
      ?auto_871 - SURFACE
      ?auto_866 - SURFACE
      ?auto_861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_859 ?auto_860 ) ( IS-CRATE ?auto_858 ) ( not ( = ?auto_864 ?auto_860 ) ) ( HOIST-AT ?auto_863 ?auto_864 ) ( SURFACE-AT ?auto_858 ?auto_864 ) ( ON ?auto_858 ?auto_862 ) ( CLEAR ?auto_858 ) ( not ( = ?auto_857 ?auto_858 ) ) ( not ( = ?auto_857 ?auto_862 ) ) ( not ( = ?auto_858 ?auto_862 ) ) ( not ( = ?auto_859 ?auto_863 ) ) ( IS-CRATE ?auto_857 ) ( not ( = ?auto_867 ?auto_860 ) ) ( HOIST-AT ?auto_868 ?auto_867 ) ( AVAILABLE ?auto_868 ) ( SURFACE-AT ?auto_857 ?auto_867 ) ( ON ?auto_857 ?auto_869 ) ( CLEAR ?auto_857 ) ( not ( = ?auto_856 ?auto_857 ) ) ( not ( = ?auto_856 ?auto_869 ) ) ( not ( = ?auto_857 ?auto_869 ) ) ( not ( = ?auto_859 ?auto_868 ) ) ( IS-CRATE ?auto_856 ) ( not ( = ?auto_870 ?auto_860 ) ) ( HOIST-AT ?auto_865 ?auto_870 ) ( AVAILABLE ?auto_865 ) ( SURFACE-AT ?auto_856 ?auto_870 ) ( ON ?auto_856 ?auto_871 ) ( CLEAR ?auto_856 ) ( not ( = ?auto_855 ?auto_856 ) ) ( not ( = ?auto_855 ?auto_871 ) ) ( not ( = ?auto_856 ?auto_871 ) ) ( not ( = ?auto_859 ?auto_865 ) ) ( SURFACE-AT ?auto_854 ?auto_860 ) ( CLEAR ?auto_854 ) ( IS-CRATE ?auto_855 ) ( AVAILABLE ?auto_859 ) ( AVAILABLE ?auto_863 ) ( SURFACE-AT ?auto_855 ?auto_864 ) ( ON ?auto_855 ?auto_866 ) ( CLEAR ?auto_855 ) ( TRUCK-AT ?auto_861 ?auto_860 ) ( not ( = ?auto_854 ?auto_855 ) ) ( not ( = ?auto_854 ?auto_866 ) ) ( not ( = ?auto_855 ?auto_866 ) ) ( not ( = ?auto_854 ?auto_856 ) ) ( not ( = ?auto_854 ?auto_871 ) ) ( not ( = ?auto_856 ?auto_866 ) ) ( not ( = ?auto_870 ?auto_864 ) ) ( not ( = ?auto_865 ?auto_863 ) ) ( not ( = ?auto_871 ?auto_866 ) ) ( not ( = ?auto_854 ?auto_857 ) ) ( not ( = ?auto_854 ?auto_869 ) ) ( not ( = ?auto_855 ?auto_857 ) ) ( not ( = ?auto_855 ?auto_869 ) ) ( not ( = ?auto_857 ?auto_871 ) ) ( not ( = ?auto_857 ?auto_866 ) ) ( not ( = ?auto_867 ?auto_870 ) ) ( not ( = ?auto_867 ?auto_864 ) ) ( not ( = ?auto_868 ?auto_865 ) ) ( not ( = ?auto_868 ?auto_863 ) ) ( not ( = ?auto_869 ?auto_871 ) ) ( not ( = ?auto_869 ?auto_866 ) ) ( not ( = ?auto_854 ?auto_858 ) ) ( not ( = ?auto_854 ?auto_862 ) ) ( not ( = ?auto_855 ?auto_858 ) ) ( not ( = ?auto_855 ?auto_862 ) ) ( not ( = ?auto_856 ?auto_858 ) ) ( not ( = ?auto_856 ?auto_862 ) ) ( not ( = ?auto_858 ?auto_869 ) ) ( not ( = ?auto_858 ?auto_871 ) ) ( not ( = ?auto_858 ?auto_866 ) ) ( not ( = ?auto_862 ?auto_869 ) ) ( not ( = ?auto_862 ?auto_871 ) ) ( not ( = ?auto_862 ?auto_866 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_854 ?auto_855 ?auto_856 ?auto_857 )
      ( MAKE-1CRATE ?auto_857 ?auto_858 )
      ( MAKE-4CRATE-VERIFY ?auto_854 ?auto_855 ?auto_856 ?auto_857 ?auto_858 ) )
  )

)

