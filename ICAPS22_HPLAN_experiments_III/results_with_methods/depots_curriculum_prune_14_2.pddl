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

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-7CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( CLEAR ?c7 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-8CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( CLEAR ?c8 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-9CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( CLEAR ?c9 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-10CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( CLEAR ?c10 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-11CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( CLEAR ?c11 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-12CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( CLEAR ?c12 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-13CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( CLEAR ?c13 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-14CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
      ?c7 - SURFACE
      ?c8 - SURFACE
      ?c9 - SURFACE
      ?c10 - SURFACE
      ?c11 - SURFACE
      ?c12 - SURFACE
      ?c13 - SURFACE
      ?c14 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( CLEAR ?c14 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17786 - SURFACE
      ?auto_17787 - SURFACE
    )
    :vars
    (
      ?auto_17788 - HOIST
      ?auto_17789 - PLACE
      ?auto_17791 - PLACE
      ?auto_17792 - HOIST
      ?auto_17793 - SURFACE
      ?auto_17790 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17788 ?auto_17789 ) ( SURFACE-AT ?auto_17786 ?auto_17789 ) ( CLEAR ?auto_17786 ) ( IS-CRATE ?auto_17787 ) ( AVAILABLE ?auto_17788 ) ( not ( = ?auto_17791 ?auto_17789 ) ) ( HOIST-AT ?auto_17792 ?auto_17791 ) ( AVAILABLE ?auto_17792 ) ( SURFACE-AT ?auto_17787 ?auto_17791 ) ( ON ?auto_17787 ?auto_17793 ) ( CLEAR ?auto_17787 ) ( TRUCK-AT ?auto_17790 ?auto_17789 ) ( not ( = ?auto_17786 ?auto_17787 ) ) ( not ( = ?auto_17786 ?auto_17793 ) ) ( not ( = ?auto_17787 ?auto_17793 ) ) ( not ( = ?auto_17788 ?auto_17792 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17790 ?auto_17789 ?auto_17791 )
      ( !LIFT ?auto_17792 ?auto_17787 ?auto_17793 ?auto_17791 )
      ( !LOAD ?auto_17792 ?auto_17787 ?auto_17790 ?auto_17791 )
      ( !DRIVE ?auto_17790 ?auto_17791 ?auto_17789 )
      ( !UNLOAD ?auto_17788 ?auto_17787 ?auto_17790 ?auto_17789 )
      ( !DROP ?auto_17788 ?auto_17787 ?auto_17786 ?auto_17789 )
      ( MAKE-1CRATE-VERIFY ?auto_17786 ?auto_17787 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_17807 - SURFACE
      ?auto_17808 - SURFACE
      ?auto_17809 - SURFACE
    )
    :vars
    (
      ?auto_17811 - HOIST
      ?auto_17815 - PLACE
      ?auto_17812 - PLACE
      ?auto_17813 - HOIST
      ?auto_17810 - SURFACE
      ?auto_17816 - PLACE
      ?auto_17817 - HOIST
      ?auto_17818 - SURFACE
      ?auto_17814 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17811 ?auto_17815 ) ( IS-CRATE ?auto_17809 ) ( not ( = ?auto_17812 ?auto_17815 ) ) ( HOIST-AT ?auto_17813 ?auto_17812 ) ( AVAILABLE ?auto_17813 ) ( SURFACE-AT ?auto_17809 ?auto_17812 ) ( ON ?auto_17809 ?auto_17810 ) ( CLEAR ?auto_17809 ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17810 ) ) ( not ( = ?auto_17809 ?auto_17810 ) ) ( not ( = ?auto_17811 ?auto_17813 ) ) ( SURFACE-AT ?auto_17807 ?auto_17815 ) ( CLEAR ?auto_17807 ) ( IS-CRATE ?auto_17808 ) ( AVAILABLE ?auto_17811 ) ( not ( = ?auto_17816 ?auto_17815 ) ) ( HOIST-AT ?auto_17817 ?auto_17816 ) ( AVAILABLE ?auto_17817 ) ( SURFACE-AT ?auto_17808 ?auto_17816 ) ( ON ?auto_17808 ?auto_17818 ) ( CLEAR ?auto_17808 ) ( TRUCK-AT ?auto_17814 ?auto_17815 ) ( not ( = ?auto_17807 ?auto_17808 ) ) ( not ( = ?auto_17807 ?auto_17818 ) ) ( not ( = ?auto_17808 ?auto_17818 ) ) ( not ( = ?auto_17811 ?auto_17817 ) ) ( not ( = ?auto_17807 ?auto_17809 ) ) ( not ( = ?auto_17807 ?auto_17810 ) ) ( not ( = ?auto_17809 ?auto_17818 ) ) ( not ( = ?auto_17812 ?auto_17816 ) ) ( not ( = ?auto_17813 ?auto_17817 ) ) ( not ( = ?auto_17810 ?auto_17818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17807 ?auto_17808 )
      ( MAKE-1CRATE ?auto_17808 ?auto_17809 )
      ( MAKE-2CRATE-VERIFY ?auto_17807 ?auto_17808 ?auto_17809 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_17833 - SURFACE
      ?auto_17834 - SURFACE
      ?auto_17835 - SURFACE
      ?auto_17836 - SURFACE
    )
    :vars
    (
      ?auto_17842 - HOIST
      ?auto_17838 - PLACE
      ?auto_17839 - PLACE
      ?auto_17840 - HOIST
      ?auto_17837 - SURFACE
      ?auto_17846 - PLACE
      ?auto_17843 - HOIST
      ?auto_17847 - SURFACE
      ?auto_17848 - PLACE
      ?auto_17844 - HOIST
      ?auto_17845 - SURFACE
      ?auto_17841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17842 ?auto_17838 ) ( IS-CRATE ?auto_17836 ) ( not ( = ?auto_17839 ?auto_17838 ) ) ( HOIST-AT ?auto_17840 ?auto_17839 ) ( AVAILABLE ?auto_17840 ) ( SURFACE-AT ?auto_17836 ?auto_17839 ) ( ON ?auto_17836 ?auto_17837 ) ( CLEAR ?auto_17836 ) ( not ( = ?auto_17835 ?auto_17836 ) ) ( not ( = ?auto_17835 ?auto_17837 ) ) ( not ( = ?auto_17836 ?auto_17837 ) ) ( not ( = ?auto_17842 ?auto_17840 ) ) ( IS-CRATE ?auto_17835 ) ( not ( = ?auto_17846 ?auto_17838 ) ) ( HOIST-AT ?auto_17843 ?auto_17846 ) ( AVAILABLE ?auto_17843 ) ( SURFACE-AT ?auto_17835 ?auto_17846 ) ( ON ?auto_17835 ?auto_17847 ) ( CLEAR ?auto_17835 ) ( not ( = ?auto_17834 ?auto_17835 ) ) ( not ( = ?auto_17834 ?auto_17847 ) ) ( not ( = ?auto_17835 ?auto_17847 ) ) ( not ( = ?auto_17842 ?auto_17843 ) ) ( SURFACE-AT ?auto_17833 ?auto_17838 ) ( CLEAR ?auto_17833 ) ( IS-CRATE ?auto_17834 ) ( AVAILABLE ?auto_17842 ) ( not ( = ?auto_17848 ?auto_17838 ) ) ( HOIST-AT ?auto_17844 ?auto_17848 ) ( AVAILABLE ?auto_17844 ) ( SURFACE-AT ?auto_17834 ?auto_17848 ) ( ON ?auto_17834 ?auto_17845 ) ( CLEAR ?auto_17834 ) ( TRUCK-AT ?auto_17841 ?auto_17838 ) ( not ( = ?auto_17833 ?auto_17834 ) ) ( not ( = ?auto_17833 ?auto_17845 ) ) ( not ( = ?auto_17834 ?auto_17845 ) ) ( not ( = ?auto_17842 ?auto_17844 ) ) ( not ( = ?auto_17833 ?auto_17835 ) ) ( not ( = ?auto_17833 ?auto_17847 ) ) ( not ( = ?auto_17835 ?auto_17845 ) ) ( not ( = ?auto_17846 ?auto_17848 ) ) ( not ( = ?auto_17843 ?auto_17844 ) ) ( not ( = ?auto_17847 ?auto_17845 ) ) ( not ( = ?auto_17833 ?auto_17836 ) ) ( not ( = ?auto_17833 ?auto_17837 ) ) ( not ( = ?auto_17834 ?auto_17836 ) ) ( not ( = ?auto_17834 ?auto_17837 ) ) ( not ( = ?auto_17836 ?auto_17847 ) ) ( not ( = ?auto_17836 ?auto_17845 ) ) ( not ( = ?auto_17839 ?auto_17846 ) ) ( not ( = ?auto_17839 ?auto_17848 ) ) ( not ( = ?auto_17840 ?auto_17843 ) ) ( not ( = ?auto_17840 ?auto_17844 ) ) ( not ( = ?auto_17837 ?auto_17847 ) ) ( not ( = ?auto_17837 ?auto_17845 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17833 ?auto_17834 ?auto_17835 )
      ( MAKE-1CRATE ?auto_17835 ?auto_17836 )
      ( MAKE-3CRATE-VERIFY ?auto_17833 ?auto_17834 ?auto_17835 ?auto_17836 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_17864 - SURFACE
      ?auto_17865 - SURFACE
      ?auto_17866 - SURFACE
      ?auto_17867 - SURFACE
      ?auto_17868 - SURFACE
    )
    :vars
    (
      ?auto_17873 - HOIST
      ?auto_17874 - PLACE
      ?auto_17871 - PLACE
      ?auto_17872 - HOIST
      ?auto_17869 - SURFACE
      ?auto_17878 - PLACE
      ?auto_17879 - HOIST
      ?auto_17875 - SURFACE
      ?auto_17882 - PLACE
      ?auto_17881 - HOIST
      ?auto_17880 - SURFACE
      ?auto_17876 - PLACE
      ?auto_17877 - HOIST
      ?auto_17883 - SURFACE
      ?auto_17870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17873 ?auto_17874 ) ( IS-CRATE ?auto_17868 ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( HOIST-AT ?auto_17872 ?auto_17871 ) ( AVAILABLE ?auto_17872 ) ( SURFACE-AT ?auto_17868 ?auto_17871 ) ( ON ?auto_17868 ?auto_17869 ) ( CLEAR ?auto_17868 ) ( not ( = ?auto_17867 ?auto_17868 ) ) ( not ( = ?auto_17867 ?auto_17869 ) ) ( not ( = ?auto_17868 ?auto_17869 ) ) ( not ( = ?auto_17873 ?auto_17872 ) ) ( IS-CRATE ?auto_17867 ) ( not ( = ?auto_17878 ?auto_17874 ) ) ( HOIST-AT ?auto_17879 ?auto_17878 ) ( AVAILABLE ?auto_17879 ) ( SURFACE-AT ?auto_17867 ?auto_17878 ) ( ON ?auto_17867 ?auto_17875 ) ( CLEAR ?auto_17867 ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( not ( = ?auto_17866 ?auto_17875 ) ) ( not ( = ?auto_17867 ?auto_17875 ) ) ( not ( = ?auto_17873 ?auto_17879 ) ) ( IS-CRATE ?auto_17866 ) ( not ( = ?auto_17882 ?auto_17874 ) ) ( HOIST-AT ?auto_17881 ?auto_17882 ) ( AVAILABLE ?auto_17881 ) ( SURFACE-AT ?auto_17866 ?auto_17882 ) ( ON ?auto_17866 ?auto_17880 ) ( CLEAR ?auto_17866 ) ( not ( = ?auto_17865 ?auto_17866 ) ) ( not ( = ?auto_17865 ?auto_17880 ) ) ( not ( = ?auto_17866 ?auto_17880 ) ) ( not ( = ?auto_17873 ?auto_17881 ) ) ( SURFACE-AT ?auto_17864 ?auto_17874 ) ( CLEAR ?auto_17864 ) ( IS-CRATE ?auto_17865 ) ( AVAILABLE ?auto_17873 ) ( not ( = ?auto_17876 ?auto_17874 ) ) ( HOIST-AT ?auto_17877 ?auto_17876 ) ( AVAILABLE ?auto_17877 ) ( SURFACE-AT ?auto_17865 ?auto_17876 ) ( ON ?auto_17865 ?auto_17883 ) ( CLEAR ?auto_17865 ) ( TRUCK-AT ?auto_17870 ?auto_17874 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( not ( = ?auto_17864 ?auto_17883 ) ) ( not ( = ?auto_17865 ?auto_17883 ) ) ( not ( = ?auto_17873 ?auto_17877 ) ) ( not ( = ?auto_17864 ?auto_17866 ) ) ( not ( = ?auto_17864 ?auto_17880 ) ) ( not ( = ?auto_17866 ?auto_17883 ) ) ( not ( = ?auto_17882 ?auto_17876 ) ) ( not ( = ?auto_17881 ?auto_17877 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17864 ?auto_17867 ) ) ( not ( = ?auto_17864 ?auto_17875 ) ) ( not ( = ?auto_17865 ?auto_17867 ) ) ( not ( = ?auto_17865 ?auto_17875 ) ) ( not ( = ?auto_17867 ?auto_17880 ) ) ( not ( = ?auto_17867 ?auto_17883 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17876 ) ) ( not ( = ?auto_17879 ?auto_17881 ) ) ( not ( = ?auto_17879 ?auto_17877 ) ) ( not ( = ?auto_17875 ?auto_17880 ) ) ( not ( = ?auto_17875 ?auto_17883 ) ) ( not ( = ?auto_17864 ?auto_17868 ) ) ( not ( = ?auto_17864 ?auto_17869 ) ) ( not ( = ?auto_17865 ?auto_17868 ) ) ( not ( = ?auto_17865 ?auto_17869 ) ) ( not ( = ?auto_17866 ?auto_17868 ) ) ( not ( = ?auto_17866 ?auto_17869 ) ) ( not ( = ?auto_17868 ?auto_17875 ) ) ( not ( = ?auto_17868 ?auto_17880 ) ) ( not ( = ?auto_17868 ?auto_17883 ) ) ( not ( = ?auto_17871 ?auto_17878 ) ) ( not ( = ?auto_17871 ?auto_17882 ) ) ( not ( = ?auto_17871 ?auto_17876 ) ) ( not ( = ?auto_17872 ?auto_17879 ) ) ( not ( = ?auto_17872 ?auto_17881 ) ) ( not ( = ?auto_17872 ?auto_17877 ) ) ( not ( = ?auto_17869 ?auto_17875 ) ) ( not ( = ?auto_17869 ?auto_17880 ) ) ( not ( = ?auto_17869 ?auto_17883 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17864 ?auto_17865 ?auto_17866 ?auto_17867 )
      ( MAKE-1CRATE ?auto_17867 ?auto_17868 )
      ( MAKE-4CRATE-VERIFY ?auto_17864 ?auto_17865 ?auto_17866 ?auto_17867 ?auto_17868 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_17900 - SURFACE
      ?auto_17901 - SURFACE
      ?auto_17902 - SURFACE
      ?auto_17903 - SURFACE
      ?auto_17904 - SURFACE
      ?auto_17905 - SURFACE
    )
    :vars
    (
      ?auto_17907 - HOIST
      ?auto_17906 - PLACE
      ?auto_17910 - PLACE
      ?auto_17909 - HOIST
      ?auto_17911 - SURFACE
      ?auto_17919 - PLACE
      ?auto_17921 - HOIST
      ?auto_17920 - SURFACE
      ?auto_17915 - PLACE
      ?auto_17912 - HOIST
      ?auto_17918 - SURFACE
      ?auto_17923 - PLACE
      ?auto_17913 - HOIST
      ?auto_17922 - SURFACE
      ?auto_17914 - PLACE
      ?auto_17916 - HOIST
      ?auto_17917 - SURFACE
      ?auto_17908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17907 ?auto_17906 ) ( IS-CRATE ?auto_17905 ) ( not ( = ?auto_17910 ?auto_17906 ) ) ( HOIST-AT ?auto_17909 ?auto_17910 ) ( AVAILABLE ?auto_17909 ) ( SURFACE-AT ?auto_17905 ?auto_17910 ) ( ON ?auto_17905 ?auto_17911 ) ( CLEAR ?auto_17905 ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17904 ?auto_17911 ) ) ( not ( = ?auto_17905 ?auto_17911 ) ) ( not ( = ?auto_17907 ?auto_17909 ) ) ( IS-CRATE ?auto_17904 ) ( not ( = ?auto_17919 ?auto_17906 ) ) ( HOIST-AT ?auto_17921 ?auto_17919 ) ( AVAILABLE ?auto_17921 ) ( SURFACE-AT ?auto_17904 ?auto_17919 ) ( ON ?auto_17904 ?auto_17920 ) ( CLEAR ?auto_17904 ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17920 ) ) ( not ( = ?auto_17904 ?auto_17920 ) ) ( not ( = ?auto_17907 ?auto_17921 ) ) ( IS-CRATE ?auto_17903 ) ( not ( = ?auto_17915 ?auto_17906 ) ) ( HOIST-AT ?auto_17912 ?auto_17915 ) ( AVAILABLE ?auto_17912 ) ( SURFACE-AT ?auto_17903 ?auto_17915 ) ( ON ?auto_17903 ?auto_17918 ) ( CLEAR ?auto_17903 ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17918 ) ) ( not ( = ?auto_17903 ?auto_17918 ) ) ( not ( = ?auto_17907 ?auto_17912 ) ) ( IS-CRATE ?auto_17902 ) ( not ( = ?auto_17923 ?auto_17906 ) ) ( HOIST-AT ?auto_17913 ?auto_17923 ) ( AVAILABLE ?auto_17913 ) ( SURFACE-AT ?auto_17902 ?auto_17923 ) ( ON ?auto_17902 ?auto_17922 ) ( CLEAR ?auto_17902 ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17922 ) ) ( not ( = ?auto_17902 ?auto_17922 ) ) ( not ( = ?auto_17907 ?auto_17913 ) ) ( SURFACE-AT ?auto_17900 ?auto_17906 ) ( CLEAR ?auto_17900 ) ( IS-CRATE ?auto_17901 ) ( AVAILABLE ?auto_17907 ) ( not ( = ?auto_17914 ?auto_17906 ) ) ( HOIST-AT ?auto_17916 ?auto_17914 ) ( AVAILABLE ?auto_17916 ) ( SURFACE-AT ?auto_17901 ?auto_17914 ) ( ON ?auto_17901 ?auto_17917 ) ( CLEAR ?auto_17901 ) ( TRUCK-AT ?auto_17908 ?auto_17906 ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17917 ) ) ( not ( = ?auto_17901 ?auto_17917 ) ) ( not ( = ?auto_17907 ?auto_17916 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17900 ?auto_17922 ) ) ( not ( = ?auto_17902 ?auto_17917 ) ) ( not ( = ?auto_17923 ?auto_17914 ) ) ( not ( = ?auto_17913 ?auto_17916 ) ) ( not ( = ?auto_17922 ?auto_17917 ) ) ( not ( = ?auto_17900 ?auto_17903 ) ) ( not ( = ?auto_17900 ?auto_17918 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17918 ) ) ( not ( = ?auto_17903 ?auto_17922 ) ) ( not ( = ?auto_17903 ?auto_17917 ) ) ( not ( = ?auto_17915 ?auto_17923 ) ) ( not ( = ?auto_17915 ?auto_17914 ) ) ( not ( = ?auto_17912 ?auto_17913 ) ) ( not ( = ?auto_17912 ?auto_17916 ) ) ( not ( = ?auto_17918 ?auto_17922 ) ) ( not ( = ?auto_17918 ?auto_17917 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17920 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17920 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17920 ) ) ( not ( = ?auto_17904 ?auto_17918 ) ) ( not ( = ?auto_17904 ?auto_17922 ) ) ( not ( = ?auto_17904 ?auto_17917 ) ) ( not ( = ?auto_17919 ?auto_17915 ) ) ( not ( = ?auto_17919 ?auto_17923 ) ) ( not ( = ?auto_17919 ?auto_17914 ) ) ( not ( = ?auto_17921 ?auto_17912 ) ) ( not ( = ?auto_17921 ?auto_17913 ) ) ( not ( = ?auto_17921 ?auto_17916 ) ) ( not ( = ?auto_17920 ?auto_17918 ) ) ( not ( = ?auto_17920 ?auto_17922 ) ) ( not ( = ?auto_17920 ?auto_17917 ) ) ( not ( = ?auto_17900 ?auto_17905 ) ) ( not ( = ?auto_17900 ?auto_17911 ) ) ( not ( = ?auto_17901 ?auto_17905 ) ) ( not ( = ?auto_17901 ?auto_17911 ) ) ( not ( = ?auto_17902 ?auto_17905 ) ) ( not ( = ?auto_17902 ?auto_17911 ) ) ( not ( = ?auto_17903 ?auto_17905 ) ) ( not ( = ?auto_17903 ?auto_17911 ) ) ( not ( = ?auto_17905 ?auto_17920 ) ) ( not ( = ?auto_17905 ?auto_17918 ) ) ( not ( = ?auto_17905 ?auto_17922 ) ) ( not ( = ?auto_17905 ?auto_17917 ) ) ( not ( = ?auto_17910 ?auto_17919 ) ) ( not ( = ?auto_17910 ?auto_17915 ) ) ( not ( = ?auto_17910 ?auto_17923 ) ) ( not ( = ?auto_17910 ?auto_17914 ) ) ( not ( = ?auto_17909 ?auto_17921 ) ) ( not ( = ?auto_17909 ?auto_17912 ) ) ( not ( = ?auto_17909 ?auto_17913 ) ) ( not ( = ?auto_17909 ?auto_17916 ) ) ( not ( = ?auto_17911 ?auto_17920 ) ) ( not ( = ?auto_17911 ?auto_17918 ) ) ( not ( = ?auto_17911 ?auto_17922 ) ) ( not ( = ?auto_17911 ?auto_17917 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 )
      ( MAKE-1CRATE ?auto_17904 ?auto_17905 )
      ( MAKE-5CRATE-VERIFY ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 ?auto_17905 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_17941 - SURFACE
      ?auto_17942 - SURFACE
      ?auto_17943 - SURFACE
      ?auto_17944 - SURFACE
      ?auto_17945 - SURFACE
      ?auto_17946 - SURFACE
      ?auto_17947 - SURFACE
    )
    :vars
    (
      ?auto_17948 - HOIST
      ?auto_17950 - PLACE
      ?auto_17952 - PLACE
      ?auto_17951 - HOIST
      ?auto_17949 - SURFACE
      ?auto_17967 - PLACE
      ?auto_17968 - HOIST
      ?auto_17965 - SURFACE
      ?auto_17954 - PLACE
      ?auto_17963 - HOIST
      ?auto_17959 - SURFACE
      ?auto_17955 - PLACE
      ?auto_17958 - HOIST
      ?auto_17962 - SURFACE
      ?auto_17964 - PLACE
      ?auto_17966 - HOIST
      ?auto_17957 - SURFACE
      ?auto_17956 - PLACE
      ?auto_17960 - HOIST
      ?auto_17961 - SURFACE
      ?auto_17953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17948 ?auto_17950 ) ( IS-CRATE ?auto_17947 ) ( not ( = ?auto_17952 ?auto_17950 ) ) ( HOIST-AT ?auto_17951 ?auto_17952 ) ( AVAILABLE ?auto_17951 ) ( SURFACE-AT ?auto_17947 ?auto_17952 ) ( ON ?auto_17947 ?auto_17949 ) ( CLEAR ?auto_17947 ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17949 ) ) ( not ( = ?auto_17947 ?auto_17949 ) ) ( not ( = ?auto_17948 ?auto_17951 ) ) ( IS-CRATE ?auto_17946 ) ( not ( = ?auto_17967 ?auto_17950 ) ) ( HOIST-AT ?auto_17968 ?auto_17967 ) ( AVAILABLE ?auto_17968 ) ( SURFACE-AT ?auto_17946 ?auto_17967 ) ( ON ?auto_17946 ?auto_17965 ) ( CLEAR ?auto_17946 ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17965 ) ) ( not ( = ?auto_17946 ?auto_17965 ) ) ( not ( = ?auto_17948 ?auto_17968 ) ) ( IS-CRATE ?auto_17945 ) ( not ( = ?auto_17954 ?auto_17950 ) ) ( HOIST-AT ?auto_17963 ?auto_17954 ) ( AVAILABLE ?auto_17963 ) ( SURFACE-AT ?auto_17945 ?auto_17954 ) ( ON ?auto_17945 ?auto_17959 ) ( CLEAR ?auto_17945 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17959 ) ) ( not ( = ?auto_17945 ?auto_17959 ) ) ( not ( = ?auto_17948 ?auto_17963 ) ) ( IS-CRATE ?auto_17944 ) ( not ( = ?auto_17955 ?auto_17950 ) ) ( HOIST-AT ?auto_17958 ?auto_17955 ) ( AVAILABLE ?auto_17958 ) ( SURFACE-AT ?auto_17944 ?auto_17955 ) ( ON ?auto_17944 ?auto_17962 ) ( CLEAR ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( not ( = ?auto_17943 ?auto_17962 ) ) ( not ( = ?auto_17944 ?auto_17962 ) ) ( not ( = ?auto_17948 ?auto_17958 ) ) ( IS-CRATE ?auto_17943 ) ( not ( = ?auto_17964 ?auto_17950 ) ) ( HOIST-AT ?auto_17966 ?auto_17964 ) ( AVAILABLE ?auto_17966 ) ( SURFACE-AT ?auto_17943 ?auto_17964 ) ( ON ?auto_17943 ?auto_17957 ) ( CLEAR ?auto_17943 ) ( not ( = ?auto_17942 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17957 ) ) ( not ( = ?auto_17943 ?auto_17957 ) ) ( not ( = ?auto_17948 ?auto_17966 ) ) ( SURFACE-AT ?auto_17941 ?auto_17950 ) ( CLEAR ?auto_17941 ) ( IS-CRATE ?auto_17942 ) ( AVAILABLE ?auto_17948 ) ( not ( = ?auto_17956 ?auto_17950 ) ) ( HOIST-AT ?auto_17960 ?auto_17956 ) ( AVAILABLE ?auto_17960 ) ( SURFACE-AT ?auto_17942 ?auto_17956 ) ( ON ?auto_17942 ?auto_17961 ) ( CLEAR ?auto_17942 ) ( TRUCK-AT ?auto_17953 ?auto_17950 ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17961 ) ) ( not ( = ?auto_17942 ?auto_17961 ) ) ( not ( = ?auto_17948 ?auto_17960 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17957 ) ) ( not ( = ?auto_17943 ?auto_17961 ) ) ( not ( = ?auto_17964 ?auto_17956 ) ) ( not ( = ?auto_17966 ?auto_17960 ) ) ( not ( = ?auto_17957 ?auto_17961 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17941 ?auto_17962 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( not ( = ?auto_17942 ?auto_17962 ) ) ( not ( = ?auto_17944 ?auto_17957 ) ) ( not ( = ?auto_17944 ?auto_17961 ) ) ( not ( = ?auto_17955 ?auto_17964 ) ) ( not ( = ?auto_17955 ?auto_17956 ) ) ( not ( = ?auto_17958 ?auto_17966 ) ) ( not ( = ?auto_17958 ?auto_17960 ) ) ( not ( = ?auto_17962 ?auto_17957 ) ) ( not ( = ?auto_17962 ?auto_17961 ) ) ( not ( = ?auto_17941 ?auto_17945 ) ) ( not ( = ?auto_17941 ?auto_17959 ) ) ( not ( = ?auto_17942 ?auto_17945 ) ) ( not ( = ?auto_17942 ?auto_17959 ) ) ( not ( = ?auto_17943 ?auto_17945 ) ) ( not ( = ?auto_17943 ?auto_17959 ) ) ( not ( = ?auto_17945 ?auto_17962 ) ) ( not ( = ?auto_17945 ?auto_17957 ) ) ( not ( = ?auto_17945 ?auto_17961 ) ) ( not ( = ?auto_17954 ?auto_17955 ) ) ( not ( = ?auto_17954 ?auto_17964 ) ) ( not ( = ?auto_17954 ?auto_17956 ) ) ( not ( = ?auto_17963 ?auto_17958 ) ) ( not ( = ?auto_17963 ?auto_17966 ) ) ( not ( = ?auto_17963 ?auto_17960 ) ) ( not ( = ?auto_17959 ?auto_17962 ) ) ( not ( = ?auto_17959 ?auto_17957 ) ) ( not ( = ?auto_17959 ?auto_17961 ) ) ( not ( = ?auto_17941 ?auto_17946 ) ) ( not ( = ?auto_17941 ?auto_17965 ) ) ( not ( = ?auto_17942 ?auto_17946 ) ) ( not ( = ?auto_17942 ?auto_17965 ) ) ( not ( = ?auto_17943 ?auto_17946 ) ) ( not ( = ?auto_17943 ?auto_17965 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17965 ) ) ( not ( = ?auto_17946 ?auto_17959 ) ) ( not ( = ?auto_17946 ?auto_17962 ) ) ( not ( = ?auto_17946 ?auto_17957 ) ) ( not ( = ?auto_17946 ?auto_17961 ) ) ( not ( = ?auto_17967 ?auto_17954 ) ) ( not ( = ?auto_17967 ?auto_17955 ) ) ( not ( = ?auto_17967 ?auto_17964 ) ) ( not ( = ?auto_17967 ?auto_17956 ) ) ( not ( = ?auto_17968 ?auto_17963 ) ) ( not ( = ?auto_17968 ?auto_17958 ) ) ( not ( = ?auto_17968 ?auto_17966 ) ) ( not ( = ?auto_17968 ?auto_17960 ) ) ( not ( = ?auto_17965 ?auto_17959 ) ) ( not ( = ?auto_17965 ?auto_17962 ) ) ( not ( = ?auto_17965 ?auto_17957 ) ) ( not ( = ?auto_17965 ?auto_17961 ) ) ( not ( = ?auto_17941 ?auto_17947 ) ) ( not ( = ?auto_17941 ?auto_17949 ) ) ( not ( = ?auto_17942 ?auto_17947 ) ) ( not ( = ?auto_17942 ?auto_17949 ) ) ( not ( = ?auto_17943 ?auto_17947 ) ) ( not ( = ?auto_17943 ?auto_17949 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17944 ?auto_17949 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17949 ) ) ( not ( = ?auto_17947 ?auto_17965 ) ) ( not ( = ?auto_17947 ?auto_17959 ) ) ( not ( = ?auto_17947 ?auto_17962 ) ) ( not ( = ?auto_17947 ?auto_17957 ) ) ( not ( = ?auto_17947 ?auto_17961 ) ) ( not ( = ?auto_17952 ?auto_17967 ) ) ( not ( = ?auto_17952 ?auto_17954 ) ) ( not ( = ?auto_17952 ?auto_17955 ) ) ( not ( = ?auto_17952 ?auto_17964 ) ) ( not ( = ?auto_17952 ?auto_17956 ) ) ( not ( = ?auto_17951 ?auto_17968 ) ) ( not ( = ?auto_17951 ?auto_17963 ) ) ( not ( = ?auto_17951 ?auto_17958 ) ) ( not ( = ?auto_17951 ?auto_17966 ) ) ( not ( = ?auto_17951 ?auto_17960 ) ) ( not ( = ?auto_17949 ?auto_17965 ) ) ( not ( = ?auto_17949 ?auto_17959 ) ) ( not ( = ?auto_17949 ?auto_17962 ) ) ( not ( = ?auto_17949 ?auto_17957 ) ) ( not ( = ?auto_17949 ?auto_17961 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ?auto_17945 ?auto_17946 )
      ( MAKE-1CRATE ?auto_17946 ?auto_17947 )
      ( MAKE-6CRATE-VERIFY ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ?auto_17945 ?auto_17946 ?auto_17947 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_17987 - SURFACE
      ?auto_17988 - SURFACE
      ?auto_17989 - SURFACE
      ?auto_17990 - SURFACE
      ?auto_17991 - SURFACE
      ?auto_17992 - SURFACE
      ?auto_17993 - SURFACE
      ?auto_17994 - SURFACE
    )
    :vars
    (
      ?auto_17996 - HOIST
      ?auto_17995 - PLACE
      ?auto_18000 - PLACE
      ?auto_17998 - HOIST
      ?auto_17997 - SURFACE
      ?auto_18017 - PLACE
      ?auto_18018 - HOIST
      ?auto_18016 - SURFACE
      ?auto_18007 - PLACE
      ?auto_18004 - HOIST
      ?auto_18005 - SURFACE
      ?auto_18015 - PLACE
      ?auto_18014 - HOIST
      ?auto_18010 - SURFACE
      ?auto_18002 - PLACE
      ?auto_18011 - HOIST
      ?auto_18012 - SURFACE
      ?auto_18013 - PLACE
      ?auto_18006 - HOIST
      ?auto_18001 - SURFACE
      ?auto_18003 - PLACE
      ?auto_18009 - HOIST
      ?auto_18008 - SURFACE
      ?auto_17999 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17996 ?auto_17995 ) ( IS-CRATE ?auto_17994 ) ( not ( = ?auto_18000 ?auto_17995 ) ) ( HOIST-AT ?auto_17998 ?auto_18000 ) ( AVAILABLE ?auto_17998 ) ( SURFACE-AT ?auto_17994 ?auto_18000 ) ( ON ?auto_17994 ?auto_17997 ) ( CLEAR ?auto_17994 ) ( not ( = ?auto_17993 ?auto_17994 ) ) ( not ( = ?auto_17993 ?auto_17997 ) ) ( not ( = ?auto_17994 ?auto_17997 ) ) ( not ( = ?auto_17996 ?auto_17998 ) ) ( IS-CRATE ?auto_17993 ) ( not ( = ?auto_18017 ?auto_17995 ) ) ( HOIST-AT ?auto_18018 ?auto_18017 ) ( AVAILABLE ?auto_18018 ) ( SURFACE-AT ?auto_17993 ?auto_18017 ) ( ON ?auto_17993 ?auto_18016 ) ( CLEAR ?auto_17993 ) ( not ( = ?auto_17992 ?auto_17993 ) ) ( not ( = ?auto_17992 ?auto_18016 ) ) ( not ( = ?auto_17993 ?auto_18016 ) ) ( not ( = ?auto_17996 ?auto_18018 ) ) ( IS-CRATE ?auto_17992 ) ( not ( = ?auto_18007 ?auto_17995 ) ) ( HOIST-AT ?auto_18004 ?auto_18007 ) ( AVAILABLE ?auto_18004 ) ( SURFACE-AT ?auto_17992 ?auto_18007 ) ( ON ?auto_17992 ?auto_18005 ) ( CLEAR ?auto_17992 ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_18005 ) ) ( not ( = ?auto_17992 ?auto_18005 ) ) ( not ( = ?auto_17996 ?auto_18004 ) ) ( IS-CRATE ?auto_17991 ) ( not ( = ?auto_18015 ?auto_17995 ) ) ( HOIST-AT ?auto_18014 ?auto_18015 ) ( AVAILABLE ?auto_18014 ) ( SURFACE-AT ?auto_17991 ?auto_18015 ) ( ON ?auto_17991 ?auto_18010 ) ( CLEAR ?auto_17991 ) ( not ( = ?auto_17990 ?auto_17991 ) ) ( not ( = ?auto_17990 ?auto_18010 ) ) ( not ( = ?auto_17991 ?auto_18010 ) ) ( not ( = ?auto_17996 ?auto_18014 ) ) ( IS-CRATE ?auto_17990 ) ( not ( = ?auto_18002 ?auto_17995 ) ) ( HOIST-AT ?auto_18011 ?auto_18002 ) ( AVAILABLE ?auto_18011 ) ( SURFACE-AT ?auto_17990 ?auto_18002 ) ( ON ?auto_17990 ?auto_18012 ) ( CLEAR ?auto_17990 ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( not ( = ?auto_17989 ?auto_18012 ) ) ( not ( = ?auto_17990 ?auto_18012 ) ) ( not ( = ?auto_17996 ?auto_18011 ) ) ( IS-CRATE ?auto_17989 ) ( not ( = ?auto_18013 ?auto_17995 ) ) ( HOIST-AT ?auto_18006 ?auto_18013 ) ( AVAILABLE ?auto_18006 ) ( SURFACE-AT ?auto_17989 ?auto_18013 ) ( ON ?auto_17989 ?auto_18001 ) ( CLEAR ?auto_17989 ) ( not ( = ?auto_17988 ?auto_17989 ) ) ( not ( = ?auto_17988 ?auto_18001 ) ) ( not ( = ?auto_17989 ?auto_18001 ) ) ( not ( = ?auto_17996 ?auto_18006 ) ) ( SURFACE-AT ?auto_17987 ?auto_17995 ) ( CLEAR ?auto_17987 ) ( IS-CRATE ?auto_17988 ) ( AVAILABLE ?auto_17996 ) ( not ( = ?auto_18003 ?auto_17995 ) ) ( HOIST-AT ?auto_18009 ?auto_18003 ) ( AVAILABLE ?auto_18009 ) ( SURFACE-AT ?auto_17988 ?auto_18003 ) ( ON ?auto_17988 ?auto_18008 ) ( CLEAR ?auto_17988 ) ( TRUCK-AT ?auto_17999 ?auto_17995 ) ( not ( = ?auto_17987 ?auto_17988 ) ) ( not ( = ?auto_17987 ?auto_18008 ) ) ( not ( = ?auto_17988 ?auto_18008 ) ) ( not ( = ?auto_17996 ?auto_18009 ) ) ( not ( = ?auto_17987 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_18001 ) ) ( not ( = ?auto_17989 ?auto_18008 ) ) ( not ( = ?auto_18013 ?auto_18003 ) ) ( not ( = ?auto_18006 ?auto_18009 ) ) ( not ( = ?auto_18001 ?auto_18008 ) ) ( not ( = ?auto_17987 ?auto_17990 ) ) ( not ( = ?auto_17987 ?auto_18012 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17988 ?auto_18012 ) ) ( not ( = ?auto_17990 ?auto_18001 ) ) ( not ( = ?auto_17990 ?auto_18008 ) ) ( not ( = ?auto_18002 ?auto_18013 ) ) ( not ( = ?auto_18002 ?auto_18003 ) ) ( not ( = ?auto_18011 ?auto_18006 ) ) ( not ( = ?auto_18011 ?auto_18009 ) ) ( not ( = ?auto_18012 ?auto_18001 ) ) ( not ( = ?auto_18012 ?auto_18008 ) ) ( not ( = ?auto_17987 ?auto_17991 ) ) ( not ( = ?auto_17987 ?auto_18010 ) ) ( not ( = ?auto_17988 ?auto_17991 ) ) ( not ( = ?auto_17988 ?auto_18010 ) ) ( not ( = ?auto_17989 ?auto_17991 ) ) ( not ( = ?auto_17989 ?auto_18010 ) ) ( not ( = ?auto_17991 ?auto_18012 ) ) ( not ( = ?auto_17991 ?auto_18001 ) ) ( not ( = ?auto_17991 ?auto_18008 ) ) ( not ( = ?auto_18015 ?auto_18002 ) ) ( not ( = ?auto_18015 ?auto_18013 ) ) ( not ( = ?auto_18015 ?auto_18003 ) ) ( not ( = ?auto_18014 ?auto_18011 ) ) ( not ( = ?auto_18014 ?auto_18006 ) ) ( not ( = ?auto_18014 ?auto_18009 ) ) ( not ( = ?auto_18010 ?auto_18012 ) ) ( not ( = ?auto_18010 ?auto_18001 ) ) ( not ( = ?auto_18010 ?auto_18008 ) ) ( not ( = ?auto_17987 ?auto_17992 ) ) ( not ( = ?auto_17987 ?auto_18005 ) ) ( not ( = ?auto_17988 ?auto_17992 ) ) ( not ( = ?auto_17988 ?auto_18005 ) ) ( not ( = ?auto_17989 ?auto_17992 ) ) ( not ( = ?auto_17989 ?auto_18005 ) ) ( not ( = ?auto_17990 ?auto_17992 ) ) ( not ( = ?auto_17990 ?auto_18005 ) ) ( not ( = ?auto_17992 ?auto_18010 ) ) ( not ( = ?auto_17992 ?auto_18012 ) ) ( not ( = ?auto_17992 ?auto_18001 ) ) ( not ( = ?auto_17992 ?auto_18008 ) ) ( not ( = ?auto_18007 ?auto_18015 ) ) ( not ( = ?auto_18007 ?auto_18002 ) ) ( not ( = ?auto_18007 ?auto_18013 ) ) ( not ( = ?auto_18007 ?auto_18003 ) ) ( not ( = ?auto_18004 ?auto_18014 ) ) ( not ( = ?auto_18004 ?auto_18011 ) ) ( not ( = ?auto_18004 ?auto_18006 ) ) ( not ( = ?auto_18004 ?auto_18009 ) ) ( not ( = ?auto_18005 ?auto_18010 ) ) ( not ( = ?auto_18005 ?auto_18012 ) ) ( not ( = ?auto_18005 ?auto_18001 ) ) ( not ( = ?auto_18005 ?auto_18008 ) ) ( not ( = ?auto_17987 ?auto_17993 ) ) ( not ( = ?auto_17987 ?auto_18016 ) ) ( not ( = ?auto_17988 ?auto_17993 ) ) ( not ( = ?auto_17988 ?auto_18016 ) ) ( not ( = ?auto_17989 ?auto_17993 ) ) ( not ( = ?auto_17989 ?auto_18016 ) ) ( not ( = ?auto_17990 ?auto_17993 ) ) ( not ( = ?auto_17990 ?auto_18016 ) ) ( not ( = ?auto_17991 ?auto_17993 ) ) ( not ( = ?auto_17991 ?auto_18016 ) ) ( not ( = ?auto_17993 ?auto_18005 ) ) ( not ( = ?auto_17993 ?auto_18010 ) ) ( not ( = ?auto_17993 ?auto_18012 ) ) ( not ( = ?auto_17993 ?auto_18001 ) ) ( not ( = ?auto_17993 ?auto_18008 ) ) ( not ( = ?auto_18017 ?auto_18007 ) ) ( not ( = ?auto_18017 ?auto_18015 ) ) ( not ( = ?auto_18017 ?auto_18002 ) ) ( not ( = ?auto_18017 ?auto_18013 ) ) ( not ( = ?auto_18017 ?auto_18003 ) ) ( not ( = ?auto_18018 ?auto_18004 ) ) ( not ( = ?auto_18018 ?auto_18014 ) ) ( not ( = ?auto_18018 ?auto_18011 ) ) ( not ( = ?auto_18018 ?auto_18006 ) ) ( not ( = ?auto_18018 ?auto_18009 ) ) ( not ( = ?auto_18016 ?auto_18005 ) ) ( not ( = ?auto_18016 ?auto_18010 ) ) ( not ( = ?auto_18016 ?auto_18012 ) ) ( not ( = ?auto_18016 ?auto_18001 ) ) ( not ( = ?auto_18016 ?auto_18008 ) ) ( not ( = ?auto_17987 ?auto_17994 ) ) ( not ( = ?auto_17987 ?auto_17997 ) ) ( not ( = ?auto_17988 ?auto_17994 ) ) ( not ( = ?auto_17988 ?auto_17997 ) ) ( not ( = ?auto_17989 ?auto_17994 ) ) ( not ( = ?auto_17989 ?auto_17997 ) ) ( not ( = ?auto_17990 ?auto_17994 ) ) ( not ( = ?auto_17990 ?auto_17997 ) ) ( not ( = ?auto_17991 ?auto_17994 ) ) ( not ( = ?auto_17991 ?auto_17997 ) ) ( not ( = ?auto_17992 ?auto_17994 ) ) ( not ( = ?auto_17992 ?auto_17997 ) ) ( not ( = ?auto_17994 ?auto_18016 ) ) ( not ( = ?auto_17994 ?auto_18005 ) ) ( not ( = ?auto_17994 ?auto_18010 ) ) ( not ( = ?auto_17994 ?auto_18012 ) ) ( not ( = ?auto_17994 ?auto_18001 ) ) ( not ( = ?auto_17994 ?auto_18008 ) ) ( not ( = ?auto_18000 ?auto_18017 ) ) ( not ( = ?auto_18000 ?auto_18007 ) ) ( not ( = ?auto_18000 ?auto_18015 ) ) ( not ( = ?auto_18000 ?auto_18002 ) ) ( not ( = ?auto_18000 ?auto_18013 ) ) ( not ( = ?auto_18000 ?auto_18003 ) ) ( not ( = ?auto_17998 ?auto_18018 ) ) ( not ( = ?auto_17998 ?auto_18004 ) ) ( not ( = ?auto_17998 ?auto_18014 ) ) ( not ( = ?auto_17998 ?auto_18011 ) ) ( not ( = ?auto_17998 ?auto_18006 ) ) ( not ( = ?auto_17998 ?auto_18009 ) ) ( not ( = ?auto_17997 ?auto_18016 ) ) ( not ( = ?auto_17997 ?auto_18005 ) ) ( not ( = ?auto_17997 ?auto_18010 ) ) ( not ( = ?auto_17997 ?auto_18012 ) ) ( not ( = ?auto_17997 ?auto_18001 ) ) ( not ( = ?auto_17997 ?auto_18008 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17987 ?auto_17988 ?auto_17989 ?auto_17990 ?auto_17991 ?auto_17992 ?auto_17993 )
      ( MAKE-1CRATE ?auto_17993 ?auto_17994 )
      ( MAKE-7CRATE-VERIFY ?auto_17987 ?auto_17988 ?auto_17989 ?auto_17990 ?auto_17991 ?auto_17992 ?auto_17993 ?auto_17994 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_18038 - SURFACE
      ?auto_18039 - SURFACE
      ?auto_18040 - SURFACE
      ?auto_18041 - SURFACE
      ?auto_18042 - SURFACE
      ?auto_18043 - SURFACE
      ?auto_18044 - SURFACE
      ?auto_18045 - SURFACE
      ?auto_18046 - SURFACE
    )
    :vars
    (
      ?auto_18049 - HOIST
      ?auto_18052 - PLACE
      ?auto_18048 - PLACE
      ?auto_18047 - HOIST
      ?auto_18051 - SURFACE
      ?auto_18061 - SURFACE
      ?auto_18065 - PLACE
      ?auto_18064 - HOIST
      ?auto_18067 - SURFACE
      ?auto_18060 - PLACE
      ?auto_18056 - HOIST
      ?auto_18063 - SURFACE
      ?auto_18054 - PLACE
      ?auto_18058 - HOIST
      ?auto_18070 - SURFACE
      ?auto_18055 - PLACE
      ?auto_18069 - HOIST
      ?auto_18071 - SURFACE
      ?auto_18057 - PLACE
      ?auto_18062 - HOIST
      ?auto_18066 - SURFACE
      ?auto_18053 - PLACE
      ?auto_18068 - HOIST
      ?auto_18059 - SURFACE
      ?auto_18050 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18049 ?auto_18052 ) ( IS-CRATE ?auto_18046 ) ( not ( = ?auto_18048 ?auto_18052 ) ) ( HOIST-AT ?auto_18047 ?auto_18048 ) ( SURFACE-AT ?auto_18046 ?auto_18048 ) ( ON ?auto_18046 ?auto_18051 ) ( CLEAR ?auto_18046 ) ( not ( = ?auto_18045 ?auto_18046 ) ) ( not ( = ?auto_18045 ?auto_18051 ) ) ( not ( = ?auto_18046 ?auto_18051 ) ) ( not ( = ?auto_18049 ?auto_18047 ) ) ( IS-CRATE ?auto_18045 ) ( AVAILABLE ?auto_18047 ) ( SURFACE-AT ?auto_18045 ?auto_18048 ) ( ON ?auto_18045 ?auto_18061 ) ( CLEAR ?auto_18045 ) ( not ( = ?auto_18044 ?auto_18045 ) ) ( not ( = ?auto_18044 ?auto_18061 ) ) ( not ( = ?auto_18045 ?auto_18061 ) ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18065 ?auto_18052 ) ) ( HOIST-AT ?auto_18064 ?auto_18065 ) ( AVAILABLE ?auto_18064 ) ( SURFACE-AT ?auto_18044 ?auto_18065 ) ( ON ?auto_18044 ?auto_18067 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18067 ) ) ( not ( = ?auto_18044 ?auto_18067 ) ) ( not ( = ?auto_18049 ?auto_18064 ) ) ( IS-CRATE ?auto_18043 ) ( not ( = ?auto_18060 ?auto_18052 ) ) ( HOIST-AT ?auto_18056 ?auto_18060 ) ( AVAILABLE ?auto_18056 ) ( SURFACE-AT ?auto_18043 ?auto_18060 ) ( ON ?auto_18043 ?auto_18063 ) ( CLEAR ?auto_18043 ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18063 ) ) ( not ( = ?auto_18043 ?auto_18063 ) ) ( not ( = ?auto_18049 ?auto_18056 ) ) ( IS-CRATE ?auto_18042 ) ( not ( = ?auto_18054 ?auto_18052 ) ) ( HOIST-AT ?auto_18058 ?auto_18054 ) ( AVAILABLE ?auto_18058 ) ( SURFACE-AT ?auto_18042 ?auto_18054 ) ( ON ?auto_18042 ?auto_18070 ) ( CLEAR ?auto_18042 ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( not ( = ?auto_18041 ?auto_18070 ) ) ( not ( = ?auto_18042 ?auto_18070 ) ) ( not ( = ?auto_18049 ?auto_18058 ) ) ( IS-CRATE ?auto_18041 ) ( not ( = ?auto_18055 ?auto_18052 ) ) ( HOIST-AT ?auto_18069 ?auto_18055 ) ( AVAILABLE ?auto_18069 ) ( SURFACE-AT ?auto_18041 ?auto_18055 ) ( ON ?auto_18041 ?auto_18071 ) ( CLEAR ?auto_18041 ) ( not ( = ?auto_18040 ?auto_18041 ) ) ( not ( = ?auto_18040 ?auto_18071 ) ) ( not ( = ?auto_18041 ?auto_18071 ) ) ( not ( = ?auto_18049 ?auto_18069 ) ) ( IS-CRATE ?auto_18040 ) ( not ( = ?auto_18057 ?auto_18052 ) ) ( HOIST-AT ?auto_18062 ?auto_18057 ) ( AVAILABLE ?auto_18062 ) ( SURFACE-AT ?auto_18040 ?auto_18057 ) ( ON ?auto_18040 ?auto_18066 ) ( CLEAR ?auto_18040 ) ( not ( = ?auto_18039 ?auto_18040 ) ) ( not ( = ?auto_18039 ?auto_18066 ) ) ( not ( = ?auto_18040 ?auto_18066 ) ) ( not ( = ?auto_18049 ?auto_18062 ) ) ( SURFACE-AT ?auto_18038 ?auto_18052 ) ( CLEAR ?auto_18038 ) ( IS-CRATE ?auto_18039 ) ( AVAILABLE ?auto_18049 ) ( not ( = ?auto_18053 ?auto_18052 ) ) ( HOIST-AT ?auto_18068 ?auto_18053 ) ( AVAILABLE ?auto_18068 ) ( SURFACE-AT ?auto_18039 ?auto_18053 ) ( ON ?auto_18039 ?auto_18059 ) ( CLEAR ?auto_18039 ) ( TRUCK-AT ?auto_18050 ?auto_18052 ) ( not ( = ?auto_18038 ?auto_18039 ) ) ( not ( = ?auto_18038 ?auto_18059 ) ) ( not ( = ?auto_18039 ?auto_18059 ) ) ( not ( = ?auto_18049 ?auto_18068 ) ) ( not ( = ?auto_18038 ?auto_18040 ) ) ( not ( = ?auto_18038 ?auto_18066 ) ) ( not ( = ?auto_18040 ?auto_18059 ) ) ( not ( = ?auto_18057 ?auto_18053 ) ) ( not ( = ?auto_18062 ?auto_18068 ) ) ( not ( = ?auto_18066 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18041 ) ) ( not ( = ?auto_18038 ?auto_18071 ) ) ( not ( = ?auto_18039 ?auto_18041 ) ) ( not ( = ?auto_18039 ?auto_18071 ) ) ( not ( = ?auto_18041 ?auto_18066 ) ) ( not ( = ?auto_18041 ?auto_18059 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18055 ?auto_18053 ) ) ( not ( = ?auto_18069 ?auto_18062 ) ) ( not ( = ?auto_18069 ?auto_18068 ) ) ( not ( = ?auto_18071 ?auto_18066 ) ) ( not ( = ?auto_18071 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18042 ) ) ( not ( = ?auto_18038 ?auto_18070 ) ) ( not ( = ?auto_18039 ?auto_18042 ) ) ( not ( = ?auto_18039 ?auto_18070 ) ) ( not ( = ?auto_18040 ?auto_18042 ) ) ( not ( = ?auto_18040 ?auto_18070 ) ) ( not ( = ?auto_18042 ?auto_18071 ) ) ( not ( = ?auto_18042 ?auto_18066 ) ) ( not ( = ?auto_18042 ?auto_18059 ) ) ( not ( = ?auto_18054 ?auto_18055 ) ) ( not ( = ?auto_18054 ?auto_18057 ) ) ( not ( = ?auto_18054 ?auto_18053 ) ) ( not ( = ?auto_18058 ?auto_18069 ) ) ( not ( = ?auto_18058 ?auto_18062 ) ) ( not ( = ?auto_18058 ?auto_18068 ) ) ( not ( = ?auto_18070 ?auto_18071 ) ) ( not ( = ?auto_18070 ?auto_18066 ) ) ( not ( = ?auto_18070 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18043 ) ) ( not ( = ?auto_18038 ?auto_18063 ) ) ( not ( = ?auto_18039 ?auto_18043 ) ) ( not ( = ?auto_18039 ?auto_18063 ) ) ( not ( = ?auto_18040 ?auto_18043 ) ) ( not ( = ?auto_18040 ?auto_18063 ) ) ( not ( = ?auto_18041 ?auto_18043 ) ) ( not ( = ?auto_18041 ?auto_18063 ) ) ( not ( = ?auto_18043 ?auto_18070 ) ) ( not ( = ?auto_18043 ?auto_18071 ) ) ( not ( = ?auto_18043 ?auto_18066 ) ) ( not ( = ?auto_18043 ?auto_18059 ) ) ( not ( = ?auto_18060 ?auto_18054 ) ) ( not ( = ?auto_18060 ?auto_18055 ) ) ( not ( = ?auto_18060 ?auto_18057 ) ) ( not ( = ?auto_18060 ?auto_18053 ) ) ( not ( = ?auto_18056 ?auto_18058 ) ) ( not ( = ?auto_18056 ?auto_18069 ) ) ( not ( = ?auto_18056 ?auto_18062 ) ) ( not ( = ?auto_18056 ?auto_18068 ) ) ( not ( = ?auto_18063 ?auto_18070 ) ) ( not ( = ?auto_18063 ?auto_18071 ) ) ( not ( = ?auto_18063 ?auto_18066 ) ) ( not ( = ?auto_18063 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18044 ) ) ( not ( = ?auto_18038 ?auto_18067 ) ) ( not ( = ?auto_18039 ?auto_18044 ) ) ( not ( = ?auto_18039 ?auto_18067 ) ) ( not ( = ?auto_18040 ?auto_18044 ) ) ( not ( = ?auto_18040 ?auto_18067 ) ) ( not ( = ?auto_18041 ?auto_18044 ) ) ( not ( = ?auto_18041 ?auto_18067 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18067 ) ) ( not ( = ?auto_18044 ?auto_18063 ) ) ( not ( = ?auto_18044 ?auto_18070 ) ) ( not ( = ?auto_18044 ?auto_18071 ) ) ( not ( = ?auto_18044 ?auto_18066 ) ) ( not ( = ?auto_18044 ?auto_18059 ) ) ( not ( = ?auto_18065 ?auto_18060 ) ) ( not ( = ?auto_18065 ?auto_18054 ) ) ( not ( = ?auto_18065 ?auto_18055 ) ) ( not ( = ?auto_18065 ?auto_18057 ) ) ( not ( = ?auto_18065 ?auto_18053 ) ) ( not ( = ?auto_18064 ?auto_18056 ) ) ( not ( = ?auto_18064 ?auto_18058 ) ) ( not ( = ?auto_18064 ?auto_18069 ) ) ( not ( = ?auto_18064 ?auto_18062 ) ) ( not ( = ?auto_18064 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18063 ) ) ( not ( = ?auto_18067 ?auto_18070 ) ) ( not ( = ?auto_18067 ?auto_18071 ) ) ( not ( = ?auto_18067 ?auto_18066 ) ) ( not ( = ?auto_18067 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18045 ) ) ( not ( = ?auto_18038 ?auto_18061 ) ) ( not ( = ?auto_18039 ?auto_18045 ) ) ( not ( = ?auto_18039 ?auto_18061 ) ) ( not ( = ?auto_18040 ?auto_18045 ) ) ( not ( = ?auto_18040 ?auto_18061 ) ) ( not ( = ?auto_18041 ?auto_18045 ) ) ( not ( = ?auto_18041 ?auto_18061 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18061 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18061 ) ) ( not ( = ?auto_18045 ?auto_18067 ) ) ( not ( = ?auto_18045 ?auto_18063 ) ) ( not ( = ?auto_18045 ?auto_18070 ) ) ( not ( = ?auto_18045 ?auto_18071 ) ) ( not ( = ?auto_18045 ?auto_18066 ) ) ( not ( = ?auto_18045 ?auto_18059 ) ) ( not ( = ?auto_18048 ?auto_18065 ) ) ( not ( = ?auto_18048 ?auto_18060 ) ) ( not ( = ?auto_18048 ?auto_18054 ) ) ( not ( = ?auto_18048 ?auto_18055 ) ) ( not ( = ?auto_18048 ?auto_18057 ) ) ( not ( = ?auto_18048 ?auto_18053 ) ) ( not ( = ?auto_18047 ?auto_18064 ) ) ( not ( = ?auto_18047 ?auto_18056 ) ) ( not ( = ?auto_18047 ?auto_18058 ) ) ( not ( = ?auto_18047 ?auto_18069 ) ) ( not ( = ?auto_18047 ?auto_18062 ) ) ( not ( = ?auto_18047 ?auto_18068 ) ) ( not ( = ?auto_18061 ?auto_18067 ) ) ( not ( = ?auto_18061 ?auto_18063 ) ) ( not ( = ?auto_18061 ?auto_18070 ) ) ( not ( = ?auto_18061 ?auto_18071 ) ) ( not ( = ?auto_18061 ?auto_18066 ) ) ( not ( = ?auto_18061 ?auto_18059 ) ) ( not ( = ?auto_18038 ?auto_18046 ) ) ( not ( = ?auto_18038 ?auto_18051 ) ) ( not ( = ?auto_18039 ?auto_18046 ) ) ( not ( = ?auto_18039 ?auto_18051 ) ) ( not ( = ?auto_18040 ?auto_18046 ) ) ( not ( = ?auto_18040 ?auto_18051 ) ) ( not ( = ?auto_18041 ?auto_18046 ) ) ( not ( = ?auto_18041 ?auto_18051 ) ) ( not ( = ?auto_18042 ?auto_18046 ) ) ( not ( = ?auto_18042 ?auto_18051 ) ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18051 ) ) ( not ( = ?auto_18044 ?auto_18046 ) ) ( not ( = ?auto_18044 ?auto_18051 ) ) ( not ( = ?auto_18046 ?auto_18061 ) ) ( not ( = ?auto_18046 ?auto_18067 ) ) ( not ( = ?auto_18046 ?auto_18063 ) ) ( not ( = ?auto_18046 ?auto_18070 ) ) ( not ( = ?auto_18046 ?auto_18071 ) ) ( not ( = ?auto_18046 ?auto_18066 ) ) ( not ( = ?auto_18046 ?auto_18059 ) ) ( not ( = ?auto_18051 ?auto_18061 ) ) ( not ( = ?auto_18051 ?auto_18067 ) ) ( not ( = ?auto_18051 ?auto_18063 ) ) ( not ( = ?auto_18051 ?auto_18070 ) ) ( not ( = ?auto_18051 ?auto_18071 ) ) ( not ( = ?auto_18051 ?auto_18066 ) ) ( not ( = ?auto_18051 ?auto_18059 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18038 ?auto_18039 ?auto_18040 ?auto_18041 ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 )
      ( MAKE-1CRATE ?auto_18045 ?auto_18046 )
      ( MAKE-8CRATE-VERIFY ?auto_18038 ?auto_18039 ?auto_18040 ?auto_18041 ?auto_18042 ?auto_18043 ?auto_18044 ?auto_18045 ?auto_18046 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_18092 - SURFACE
      ?auto_18093 - SURFACE
      ?auto_18094 - SURFACE
      ?auto_18095 - SURFACE
      ?auto_18096 - SURFACE
      ?auto_18097 - SURFACE
      ?auto_18098 - SURFACE
      ?auto_18099 - SURFACE
      ?auto_18100 - SURFACE
      ?auto_18101 - SURFACE
    )
    :vars
    (
      ?auto_18107 - HOIST
      ?auto_18102 - PLACE
      ?auto_18106 - PLACE
      ?auto_18103 - HOIST
      ?auto_18104 - SURFACE
      ?auto_18111 - PLACE
      ?auto_18115 - HOIST
      ?auto_18114 - SURFACE
      ?auto_18117 - SURFACE
      ?auto_18109 - PLACE
      ?auto_18108 - HOIST
      ?auto_18127 - SURFACE
      ?auto_18120 - PLACE
      ?auto_18118 - HOIST
      ?auto_18126 - SURFACE
      ?auto_18112 - PLACE
      ?auto_18122 - HOIST
      ?auto_18128 - SURFACE
      ?auto_18116 - PLACE
      ?auto_18119 - HOIST
      ?auto_18113 - SURFACE
      ?auto_18123 - PLACE
      ?auto_18129 - HOIST
      ?auto_18110 - SURFACE
      ?auto_18124 - PLACE
      ?auto_18125 - HOIST
      ?auto_18121 - SURFACE
      ?auto_18105 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18107 ?auto_18102 ) ( IS-CRATE ?auto_18101 ) ( not ( = ?auto_18106 ?auto_18102 ) ) ( HOIST-AT ?auto_18103 ?auto_18106 ) ( AVAILABLE ?auto_18103 ) ( SURFACE-AT ?auto_18101 ?auto_18106 ) ( ON ?auto_18101 ?auto_18104 ) ( CLEAR ?auto_18101 ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18104 ) ) ( not ( = ?auto_18101 ?auto_18104 ) ) ( not ( = ?auto_18107 ?auto_18103 ) ) ( IS-CRATE ?auto_18100 ) ( not ( = ?auto_18111 ?auto_18102 ) ) ( HOIST-AT ?auto_18115 ?auto_18111 ) ( SURFACE-AT ?auto_18100 ?auto_18111 ) ( ON ?auto_18100 ?auto_18114 ) ( CLEAR ?auto_18100 ) ( not ( = ?auto_18099 ?auto_18100 ) ) ( not ( = ?auto_18099 ?auto_18114 ) ) ( not ( = ?auto_18100 ?auto_18114 ) ) ( not ( = ?auto_18107 ?auto_18115 ) ) ( IS-CRATE ?auto_18099 ) ( AVAILABLE ?auto_18115 ) ( SURFACE-AT ?auto_18099 ?auto_18111 ) ( ON ?auto_18099 ?auto_18117 ) ( CLEAR ?auto_18099 ) ( not ( = ?auto_18098 ?auto_18099 ) ) ( not ( = ?auto_18098 ?auto_18117 ) ) ( not ( = ?auto_18099 ?auto_18117 ) ) ( IS-CRATE ?auto_18098 ) ( not ( = ?auto_18109 ?auto_18102 ) ) ( HOIST-AT ?auto_18108 ?auto_18109 ) ( AVAILABLE ?auto_18108 ) ( SURFACE-AT ?auto_18098 ?auto_18109 ) ( ON ?auto_18098 ?auto_18127 ) ( CLEAR ?auto_18098 ) ( not ( = ?auto_18097 ?auto_18098 ) ) ( not ( = ?auto_18097 ?auto_18127 ) ) ( not ( = ?auto_18098 ?auto_18127 ) ) ( not ( = ?auto_18107 ?auto_18108 ) ) ( IS-CRATE ?auto_18097 ) ( not ( = ?auto_18120 ?auto_18102 ) ) ( HOIST-AT ?auto_18118 ?auto_18120 ) ( AVAILABLE ?auto_18118 ) ( SURFACE-AT ?auto_18097 ?auto_18120 ) ( ON ?auto_18097 ?auto_18126 ) ( CLEAR ?auto_18097 ) ( not ( = ?auto_18096 ?auto_18097 ) ) ( not ( = ?auto_18096 ?auto_18126 ) ) ( not ( = ?auto_18097 ?auto_18126 ) ) ( not ( = ?auto_18107 ?auto_18118 ) ) ( IS-CRATE ?auto_18096 ) ( not ( = ?auto_18112 ?auto_18102 ) ) ( HOIST-AT ?auto_18122 ?auto_18112 ) ( AVAILABLE ?auto_18122 ) ( SURFACE-AT ?auto_18096 ?auto_18112 ) ( ON ?auto_18096 ?auto_18128 ) ( CLEAR ?auto_18096 ) ( not ( = ?auto_18095 ?auto_18096 ) ) ( not ( = ?auto_18095 ?auto_18128 ) ) ( not ( = ?auto_18096 ?auto_18128 ) ) ( not ( = ?auto_18107 ?auto_18122 ) ) ( IS-CRATE ?auto_18095 ) ( not ( = ?auto_18116 ?auto_18102 ) ) ( HOIST-AT ?auto_18119 ?auto_18116 ) ( AVAILABLE ?auto_18119 ) ( SURFACE-AT ?auto_18095 ?auto_18116 ) ( ON ?auto_18095 ?auto_18113 ) ( CLEAR ?auto_18095 ) ( not ( = ?auto_18094 ?auto_18095 ) ) ( not ( = ?auto_18094 ?auto_18113 ) ) ( not ( = ?auto_18095 ?auto_18113 ) ) ( not ( = ?auto_18107 ?auto_18119 ) ) ( IS-CRATE ?auto_18094 ) ( not ( = ?auto_18123 ?auto_18102 ) ) ( HOIST-AT ?auto_18129 ?auto_18123 ) ( AVAILABLE ?auto_18129 ) ( SURFACE-AT ?auto_18094 ?auto_18123 ) ( ON ?auto_18094 ?auto_18110 ) ( CLEAR ?auto_18094 ) ( not ( = ?auto_18093 ?auto_18094 ) ) ( not ( = ?auto_18093 ?auto_18110 ) ) ( not ( = ?auto_18094 ?auto_18110 ) ) ( not ( = ?auto_18107 ?auto_18129 ) ) ( SURFACE-AT ?auto_18092 ?auto_18102 ) ( CLEAR ?auto_18092 ) ( IS-CRATE ?auto_18093 ) ( AVAILABLE ?auto_18107 ) ( not ( = ?auto_18124 ?auto_18102 ) ) ( HOIST-AT ?auto_18125 ?auto_18124 ) ( AVAILABLE ?auto_18125 ) ( SURFACE-AT ?auto_18093 ?auto_18124 ) ( ON ?auto_18093 ?auto_18121 ) ( CLEAR ?auto_18093 ) ( TRUCK-AT ?auto_18105 ?auto_18102 ) ( not ( = ?auto_18092 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18121 ) ) ( not ( = ?auto_18093 ?auto_18121 ) ) ( not ( = ?auto_18107 ?auto_18125 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18110 ) ) ( not ( = ?auto_18094 ?auto_18121 ) ) ( not ( = ?auto_18123 ?auto_18124 ) ) ( not ( = ?auto_18129 ?auto_18125 ) ) ( not ( = ?auto_18110 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18095 ) ) ( not ( = ?auto_18092 ?auto_18113 ) ) ( not ( = ?auto_18093 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18113 ) ) ( not ( = ?auto_18095 ?auto_18110 ) ) ( not ( = ?auto_18095 ?auto_18121 ) ) ( not ( = ?auto_18116 ?auto_18123 ) ) ( not ( = ?auto_18116 ?auto_18124 ) ) ( not ( = ?auto_18119 ?auto_18129 ) ) ( not ( = ?auto_18119 ?auto_18125 ) ) ( not ( = ?auto_18113 ?auto_18110 ) ) ( not ( = ?auto_18113 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18096 ) ) ( not ( = ?auto_18092 ?auto_18128 ) ) ( not ( = ?auto_18093 ?auto_18096 ) ) ( not ( = ?auto_18093 ?auto_18128 ) ) ( not ( = ?auto_18094 ?auto_18096 ) ) ( not ( = ?auto_18094 ?auto_18128 ) ) ( not ( = ?auto_18096 ?auto_18113 ) ) ( not ( = ?auto_18096 ?auto_18110 ) ) ( not ( = ?auto_18096 ?auto_18121 ) ) ( not ( = ?auto_18112 ?auto_18116 ) ) ( not ( = ?auto_18112 ?auto_18123 ) ) ( not ( = ?auto_18112 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18119 ) ) ( not ( = ?auto_18122 ?auto_18129 ) ) ( not ( = ?auto_18122 ?auto_18125 ) ) ( not ( = ?auto_18128 ?auto_18113 ) ) ( not ( = ?auto_18128 ?auto_18110 ) ) ( not ( = ?auto_18128 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18097 ) ) ( not ( = ?auto_18092 ?auto_18126 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) ( not ( = ?auto_18093 ?auto_18126 ) ) ( not ( = ?auto_18094 ?auto_18097 ) ) ( not ( = ?auto_18094 ?auto_18126 ) ) ( not ( = ?auto_18095 ?auto_18097 ) ) ( not ( = ?auto_18095 ?auto_18126 ) ) ( not ( = ?auto_18097 ?auto_18128 ) ) ( not ( = ?auto_18097 ?auto_18113 ) ) ( not ( = ?auto_18097 ?auto_18110 ) ) ( not ( = ?auto_18097 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18112 ) ) ( not ( = ?auto_18120 ?auto_18116 ) ) ( not ( = ?auto_18120 ?auto_18123 ) ) ( not ( = ?auto_18120 ?auto_18124 ) ) ( not ( = ?auto_18118 ?auto_18122 ) ) ( not ( = ?auto_18118 ?auto_18119 ) ) ( not ( = ?auto_18118 ?auto_18129 ) ) ( not ( = ?auto_18118 ?auto_18125 ) ) ( not ( = ?auto_18126 ?auto_18128 ) ) ( not ( = ?auto_18126 ?auto_18113 ) ) ( not ( = ?auto_18126 ?auto_18110 ) ) ( not ( = ?auto_18126 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18098 ) ) ( not ( = ?auto_18092 ?auto_18127 ) ) ( not ( = ?auto_18093 ?auto_18098 ) ) ( not ( = ?auto_18093 ?auto_18127 ) ) ( not ( = ?auto_18094 ?auto_18098 ) ) ( not ( = ?auto_18094 ?auto_18127 ) ) ( not ( = ?auto_18095 ?auto_18098 ) ) ( not ( = ?auto_18095 ?auto_18127 ) ) ( not ( = ?auto_18096 ?auto_18098 ) ) ( not ( = ?auto_18096 ?auto_18127 ) ) ( not ( = ?auto_18098 ?auto_18126 ) ) ( not ( = ?auto_18098 ?auto_18128 ) ) ( not ( = ?auto_18098 ?auto_18113 ) ) ( not ( = ?auto_18098 ?auto_18110 ) ) ( not ( = ?auto_18098 ?auto_18121 ) ) ( not ( = ?auto_18109 ?auto_18120 ) ) ( not ( = ?auto_18109 ?auto_18112 ) ) ( not ( = ?auto_18109 ?auto_18116 ) ) ( not ( = ?auto_18109 ?auto_18123 ) ) ( not ( = ?auto_18109 ?auto_18124 ) ) ( not ( = ?auto_18108 ?auto_18118 ) ) ( not ( = ?auto_18108 ?auto_18122 ) ) ( not ( = ?auto_18108 ?auto_18119 ) ) ( not ( = ?auto_18108 ?auto_18129 ) ) ( not ( = ?auto_18108 ?auto_18125 ) ) ( not ( = ?auto_18127 ?auto_18126 ) ) ( not ( = ?auto_18127 ?auto_18128 ) ) ( not ( = ?auto_18127 ?auto_18113 ) ) ( not ( = ?auto_18127 ?auto_18110 ) ) ( not ( = ?auto_18127 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18099 ) ) ( not ( = ?auto_18092 ?auto_18117 ) ) ( not ( = ?auto_18093 ?auto_18099 ) ) ( not ( = ?auto_18093 ?auto_18117 ) ) ( not ( = ?auto_18094 ?auto_18099 ) ) ( not ( = ?auto_18094 ?auto_18117 ) ) ( not ( = ?auto_18095 ?auto_18099 ) ) ( not ( = ?auto_18095 ?auto_18117 ) ) ( not ( = ?auto_18096 ?auto_18099 ) ) ( not ( = ?auto_18096 ?auto_18117 ) ) ( not ( = ?auto_18097 ?auto_18099 ) ) ( not ( = ?auto_18097 ?auto_18117 ) ) ( not ( = ?auto_18099 ?auto_18127 ) ) ( not ( = ?auto_18099 ?auto_18126 ) ) ( not ( = ?auto_18099 ?auto_18128 ) ) ( not ( = ?auto_18099 ?auto_18113 ) ) ( not ( = ?auto_18099 ?auto_18110 ) ) ( not ( = ?auto_18099 ?auto_18121 ) ) ( not ( = ?auto_18111 ?auto_18109 ) ) ( not ( = ?auto_18111 ?auto_18120 ) ) ( not ( = ?auto_18111 ?auto_18112 ) ) ( not ( = ?auto_18111 ?auto_18116 ) ) ( not ( = ?auto_18111 ?auto_18123 ) ) ( not ( = ?auto_18111 ?auto_18124 ) ) ( not ( = ?auto_18115 ?auto_18108 ) ) ( not ( = ?auto_18115 ?auto_18118 ) ) ( not ( = ?auto_18115 ?auto_18122 ) ) ( not ( = ?auto_18115 ?auto_18119 ) ) ( not ( = ?auto_18115 ?auto_18129 ) ) ( not ( = ?auto_18115 ?auto_18125 ) ) ( not ( = ?auto_18117 ?auto_18127 ) ) ( not ( = ?auto_18117 ?auto_18126 ) ) ( not ( = ?auto_18117 ?auto_18128 ) ) ( not ( = ?auto_18117 ?auto_18113 ) ) ( not ( = ?auto_18117 ?auto_18110 ) ) ( not ( = ?auto_18117 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18100 ) ) ( not ( = ?auto_18092 ?auto_18114 ) ) ( not ( = ?auto_18093 ?auto_18100 ) ) ( not ( = ?auto_18093 ?auto_18114 ) ) ( not ( = ?auto_18094 ?auto_18100 ) ) ( not ( = ?auto_18094 ?auto_18114 ) ) ( not ( = ?auto_18095 ?auto_18100 ) ) ( not ( = ?auto_18095 ?auto_18114 ) ) ( not ( = ?auto_18096 ?auto_18100 ) ) ( not ( = ?auto_18096 ?auto_18114 ) ) ( not ( = ?auto_18097 ?auto_18100 ) ) ( not ( = ?auto_18097 ?auto_18114 ) ) ( not ( = ?auto_18098 ?auto_18100 ) ) ( not ( = ?auto_18098 ?auto_18114 ) ) ( not ( = ?auto_18100 ?auto_18117 ) ) ( not ( = ?auto_18100 ?auto_18127 ) ) ( not ( = ?auto_18100 ?auto_18126 ) ) ( not ( = ?auto_18100 ?auto_18128 ) ) ( not ( = ?auto_18100 ?auto_18113 ) ) ( not ( = ?auto_18100 ?auto_18110 ) ) ( not ( = ?auto_18100 ?auto_18121 ) ) ( not ( = ?auto_18114 ?auto_18117 ) ) ( not ( = ?auto_18114 ?auto_18127 ) ) ( not ( = ?auto_18114 ?auto_18126 ) ) ( not ( = ?auto_18114 ?auto_18128 ) ) ( not ( = ?auto_18114 ?auto_18113 ) ) ( not ( = ?auto_18114 ?auto_18110 ) ) ( not ( = ?auto_18114 ?auto_18121 ) ) ( not ( = ?auto_18092 ?auto_18101 ) ) ( not ( = ?auto_18092 ?auto_18104 ) ) ( not ( = ?auto_18093 ?auto_18101 ) ) ( not ( = ?auto_18093 ?auto_18104 ) ) ( not ( = ?auto_18094 ?auto_18101 ) ) ( not ( = ?auto_18094 ?auto_18104 ) ) ( not ( = ?auto_18095 ?auto_18101 ) ) ( not ( = ?auto_18095 ?auto_18104 ) ) ( not ( = ?auto_18096 ?auto_18101 ) ) ( not ( = ?auto_18096 ?auto_18104 ) ) ( not ( = ?auto_18097 ?auto_18101 ) ) ( not ( = ?auto_18097 ?auto_18104 ) ) ( not ( = ?auto_18098 ?auto_18101 ) ) ( not ( = ?auto_18098 ?auto_18104 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18099 ?auto_18104 ) ) ( not ( = ?auto_18101 ?auto_18114 ) ) ( not ( = ?auto_18101 ?auto_18117 ) ) ( not ( = ?auto_18101 ?auto_18127 ) ) ( not ( = ?auto_18101 ?auto_18126 ) ) ( not ( = ?auto_18101 ?auto_18128 ) ) ( not ( = ?auto_18101 ?auto_18113 ) ) ( not ( = ?auto_18101 ?auto_18110 ) ) ( not ( = ?auto_18101 ?auto_18121 ) ) ( not ( = ?auto_18106 ?auto_18111 ) ) ( not ( = ?auto_18106 ?auto_18109 ) ) ( not ( = ?auto_18106 ?auto_18120 ) ) ( not ( = ?auto_18106 ?auto_18112 ) ) ( not ( = ?auto_18106 ?auto_18116 ) ) ( not ( = ?auto_18106 ?auto_18123 ) ) ( not ( = ?auto_18106 ?auto_18124 ) ) ( not ( = ?auto_18103 ?auto_18115 ) ) ( not ( = ?auto_18103 ?auto_18108 ) ) ( not ( = ?auto_18103 ?auto_18118 ) ) ( not ( = ?auto_18103 ?auto_18122 ) ) ( not ( = ?auto_18103 ?auto_18119 ) ) ( not ( = ?auto_18103 ?auto_18129 ) ) ( not ( = ?auto_18103 ?auto_18125 ) ) ( not ( = ?auto_18104 ?auto_18114 ) ) ( not ( = ?auto_18104 ?auto_18117 ) ) ( not ( = ?auto_18104 ?auto_18127 ) ) ( not ( = ?auto_18104 ?auto_18126 ) ) ( not ( = ?auto_18104 ?auto_18128 ) ) ( not ( = ?auto_18104 ?auto_18113 ) ) ( not ( = ?auto_18104 ?auto_18110 ) ) ( not ( = ?auto_18104 ?auto_18121 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18095 ?auto_18096 ?auto_18097 ?auto_18098 ?auto_18099 ?auto_18100 )
      ( MAKE-1CRATE ?auto_18100 ?auto_18101 )
      ( MAKE-9CRATE-VERIFY ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18095 ?auto_18096 ?auto_18097 ?auto_18098 ?auto_18099 ?auto_18100 ?auto_18101 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_18151 - SURFACE
      ?auto_18152 - SURFACE
      ?auto_18153 - SURFACE
      ?auto_18154 - SURFACE
      ?auto_18155 - SURFACE
      ?auto_18156 - SURFACE
      ?auto_18157 - SURFACE
      ?auto_18158 - SURFACE
      ?auto_18159 - SURFACE
      ?auto_18160 - SURFACE
      ?auto_18161 - SURFACE
    )
    :vars
    (
      ?auto_18166 - HOIST
      ?auto_18167 - PLACE
      ?auto_18164 - PLACE
      ?auto_18165 - HOIST
      ?auto_18163 - SURFACE
      ?auto_18179 - PLACE
      ?auto_18189 - HOIST
      ?auto_18177 - SURFACE
      ?auto_18174 - PLACE
      ?auto_18192 - HOIST
      ?auto_18180 - SURFACE
      ?auto_18188 - SURFACE
      ?auto_18168 - PLACE
      ?auto_18190 - HOIST
      ?auto_18173 - SURFACE
      ?auto_18186 - PLACE
      ?auto_18181 - HOIST
      ?auto_18172 - SURFACE
      ?auto_18171 - PLACE
      ?auto_18191 - HOIST
      ?auto_18176 - SURFACE
      ?auto_18185 - PLACE
      ?auto_18169 - HOIST
      ?auto_18170 - SURFACE
      ?auto_18178 - PLACE
      ?auto_18184 - HOIST
      ?auto_18182 - SURFACE
      ?auto_18183 - PLACE
      ?auto_18175 - HOIST
      ?auto_18187 - SURFACE
      ?auto_18162 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18166 ?auto_18167 ) ( IS-CRATE ?auto_18161 ) ( not ( = ?auto_18164 ?auto_18167 ) ) ( HOIST-AT ?auto_18165 ?auto_18164 ) ( AVAILABLE ?auto_18165 ) ( SURFACE-AT ?auto_18161 ?auto_18164 ) ( ON ?auto_18161 ?auto_18163 ) ( CLEAR ?auto_18161 ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18163 ) ) ( not ( = ?auto_18161 ?auto_18163 ) ) ( not ( = ?auto_18166 ?auto_18165 ) ) ( IS-CRATE ?auto_18160 ) ( not ( = ?auto_18179 ?auto_18167 ) ) ( HOIST-AT ?auto_18189 ?auto_18179 ) ( AVAILABLE ?auto_18189 ) ( SURFACE-AT ?auto_18160 ?auto_18179 ) ( ON ?auto_18160 ?auto_18177 ) ( CLEAR ?auto_18160 ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18177 ) ) ( not ( = ?auto_18160 ?auto_18177 ) ) ( not ( = ?auto_18166 ?auto_18189 ) ) ( IS-CRATE ?auto_18159 ) ( not ( = ?auto_18174 ?auto_18167 ) ) ( HOIST-AT ?auto_18192 ?auto_18174 ) ( SURFACE-AT ?auto_18159 ?auto_18174 ) ( ON ?auto_18159 ?auto_18180 ) ( CLEAR ?auto_18159 ) ( not ( = ?auto_18158 ?auto_18159 ) ) ( not ( = ?auto_18158 ?auto_18180 ) ) ( not ( = ?auto_18159 ?auto_18180 ) ) ( not ( = ?auto_18166 ?auto_18192 ) ) ( IS-CRATE ?auto_18158 ) ( AVAILABLE ?auto_18192 ) ( SURFACE-AT ?auto_18158 ?auto_18174 ) ( ON ?auto_18158 ?auto_18188 ) ( CLEAR ?auto_18158 ) ( not ( = ?auto_18157 ?auto_18158 ) ) ( not ( = ?auto_18157 ?auto_18188 ) ) ( not ( = ?auto_18158 ?auto_18188 ) ) ( IS-CRATE ?auto_18157 ) ( not ( = ?auto_18168 ?auto_18167 ) ) ( HOIST-AT ?auto_18190 ?auto_18168 ) ( AVAILABLE ?auto_18190 ) ( SURFACE-AT ?auto_18157 ?auto_18168 ) ( ON ?auto_18157 ?auto_18173 ) ( CLEAR ?auto_18157 ) ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18173 ) ) ( not ( = ?auto_18157 ?auto_18173 ) ) ( not ( = ?auto_18166 ?auto_18190 ) ) ( IS-CRATE ?auto_18156 ) ( not ( = ?auto_18186 ?auto_18167 ) ) ( HOIST-AT ?auto_18181 ?auto_18186 ) ( AVAILABLE ?auto_18181 ) ( SURFACE-AT ?auto_18156 ?auto_18186 ) ( ON ?auto_18156 ?auto_18172 ) ( CLEAR ?auto_18156 ) ( not ( = ?auto_18155 ?auto_18156 ) ) ( not ( = ?auto_18155 ?auto_18172 ) ) ( not ( = ?auto_18156 ?auto_18172 ) ) ( not ( = ?auto_18166 ?auto_18181 ) ) ( IS-CRATE ?auto_18155 ) ( not ( = ?auto_18171 ?auto_18167 ) ) ( HOIST-AT ?auto_18191 ?auto_18171 ) ( AVAILABLE ?auto_18191 ) ( SURFACE-AT ?auto_18155 ?auto_18171 ) ( ON ?auto_18155 ?auto_18176 ) ( CLEAR ?auto_18155 ) ( not ( = ?auto_18154 ?auto_18155 ) ) ( not ( = ?auto_18154 ?auto_18176 ) ) ( not ( = ?auto_18155 ?auto_18176 ) ) ( not ( = ?auto_18166 ?auto_18191 ) ) ( IS-CRATE ?auto_18154 ) ( not ( = ?auto_18185 ?auto_18167 ) ) ( HOIST-AT ?auto_18169 ?auto_18185 ) ( AVAILABLE ?auto_18169 ) ( SURFACE-AT ?auto_18154 ?auto_18185 ) ( ON ?auto_18154 ?auto_18170 ) ( CLEAR ?auto_18154 ) ( not ( = ?auto_18153 ?auto_18154 ) ) ( not ( = ?auto_18153 ?auto_18170 ) ) ( not ( = ?auto_18154 ?auto_18170 ) ) ( not ( = ?auto_18166 ?auto_18169 ) ) ( IS-CRATE ?auto_18153 ) ( not ( = ?auto_18178 ?auto_18167 ) ) ( HOIST-AT ?auto_18184 ?auto_18178 ) ( AVAILABLE ?auto_18184 ) ( SURFACE-AT ?auto_18153 ?auto_18178 ) ( ON ?auto_18153 ?auto_18182 ) ( CLEAR ?auto_18153 ) ( not ( = ?auto_18152 ?auto_18153 ) ) ( not ( = ?auto_18152 ?auto_18182 ) ) ( not ( = ?auto_18153 ?auto_18182 ) ) ( not ( = ?auto_18166 ?auto_18184 ) ) ( SURFACE-AT ?auto_18151 ?auto_18167 ) ( CLEAR ?auto_18151 ) ( IS-CRATE ?auto_18152 ) ( AVAILABLE ?auto_18166 ) ( not ( = ?auto_18183 ?auto_18167 ) ) ( HOIST-AT ?auto_18175 ?auto_18183 ) ( AVAILABLE ?auto_18175 ) ( SURFACE-AT ?auto_18152 ?auto_18183 ) ( ON ?auto_18152 ?auto_18187 ) ( CLEAR ?auto_18152 ) ( TRUCK-AT ?auto_18162 ?auto_18167 ) ( not ( = ?auto_18151 ?auto_18152 ) ) ( not ( = ?auto_18151 ?auto_18187 ) ) ( not ( = ?auto_18152 ?auto_18187 ) ) ( not ( = ?auto_18166 ?auto_18175 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18182 ) ) ( not ( = ?auto_18153 ?auto_18187 ) ) ( not ( = ?auto_18178 ?auto_18183 ) ) ( not ( = ?auto_18184 ?auto_18175 ) ) ( not ( = ?auto_18182 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( not ( = ?auto_18151 ?auto_18170 ) ) ( not ( = ?auto_18152 ?auto_18154 ) ) ( not ( = ?auto_18152 ?auto_18170 ) ) ( not ( = ?auto_18154 ?auto_18182 ) ) ( not ( = ?auto_18154 ?auto_18187 ) ) ( not ( = ?auto_18185 ?auto_18178 ) ) ( not ( = ?auto_18185 ?auto_18183 ) ) ( not ( = ?auto_18169 ?auto_18184 ) ) ( not ( = ?auto_18169 ?auto_18175 ) ) ( not ( = ?auto_18170 ?auto_18182 ) ) ( not ( = ?auto_18170 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18176 ) ) ( not ( = ?auto_18152 ?auto_18155 ) ) ( not ( = ?auto_18152 ?auto_18176 ) ) ( not ( = ?auto_18153 ?auto_18155 ) ) ( not ( = ?auto_18153 ?auto_18176 ) ) ( not ( = ?auto_18155 ?auto_18170 ) ) ( not ( = ?auto_18155 ?auto_18182 ) ) ( not ( = ?auto_18155 ?auto_18187 ) ) ( not ( = ?auto_18171 ?auto_18185 ) ) ( not ( = ?auto_18171 ?auto_18178 ) ) ( not ( = ?auto_18171 ?auto_18183 ) ) ( not ( = ?auto_18191 ?auto_18169 ) ) ( not ( = ?auto_18191 ?auto_18184 ) ) ( not ( = ?auto_18191 ?auto_18175 ) ) ( not ( = ?auto_18176 ?auto_18170 ) ) ( not ( = ?auto_18176 ?auto_18182 ) ) ( not ( = ?auto_18176 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18156 ) ) ( not ( = ?auto_18151 ?auto_18172 ) ) ( not ( = ?auto_18152 ?auto_18156 ) ) ( not ( = ?auto_18152 ?auto_18172 ) ) ( not ( = ?auto_18153 ?auto_18156 ) ) ( not ( = ?auto_18153 ?auto_18172 ) ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( not ( = ?auto_18154 ?auto_18172 ) ) ( not ( = ?auto_18156 ?auto_18176 ) ) ( not ( = ?auto_18156 ?auto_18170 ) ) ( not ( = ?auto_18156 ?auto_18182 ) ) ( not ( = ?auto_18156 ?auto_18187 ) ) ( not ( = ?auto_18186 ?auto_18171 ) ) ( not ( = ?auto_18186 ?auto_18185 ) ) ( not ( = ?auto_18186 ?auto_18178 ) ) ( not ( = ?auto_18186 ?auto_18183 ) ) ( not ( = ?auto_18181 ?auto_18191 ) ) ( not ( = ?auto_18181 ?auto_18169 ) ) ( not ( = ?auto_18181 ?auto_18184 ) ) ( not ( = ?auto_18181 ?auto_18175 ) ) ( not ( = ?auto_18172 ?auto_18176 ) ) ( not ( = ?auto_18172 ?auto_18170 ) ) ( not ( = ?auto_18172 ?auto_18182 ) ) ( not ( = ?auto_18172 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18157 ) ) ( not ( = ?auto_18151 ?auto_18173 ) ) ( not ( = ?auto_18152 ?auto_18157 ) ) ( not ( = ?auto_18152 ?auto_18173 ) ) ( not ( = ?auto_18153 ?auto_18157 ) ) ( not ( = ?auto_18153 ?auto_18173 ) ) ( not ( = ?auto_18154 ?auto_18157 ) ) ( not ( = ?auto_18154 ?auto_18173 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) ( not ( = ?auto_18155 ?auto_18173 ) ) ( not ( = ?auto_18157 ?auto_18172 ) ) ( not ( = ?auto_18157 ?auto_18176 ) ) ( not ( = ?auto_18157 ?auto_18170 ) ) ( not ( = ?auto_18157 ?auto_18182 ) ) ( not ( = ?auto_18157 ?auto_18187 ) ) ( not ( = ?auto_18168 ?auto_18186 ) ) ( not ( = ?auto_18168 ?auto_18171 ) ) ( not ( = ?auto_18168 ?auto_18185 ) ) ( not ( = ?auto_18168 ?auto_18178 ) ) ( not ( = ?auto_18168 ?auto_18183 ) ) ( not ( = ?auto_18190 ?auto_18181 ) ) ( not ( = ?auto_18190 ?auto_18191 ) ) ( not ( = ?auto_18190 ?auto_18169 ) ) ( not ( = ?auto_18190 ?auto_18184 ) ) ( not ( = ?auto_18190 ?auto_18175 ) ) ( not ( = ?auto_18173 ?auto_18172 ) ) ( not ( = ?auto_18173 ?auto_18176 ) ) ( not ( = ?auto_18173 ?auto_18170 ) ) ( not ( = ?auto_18173 ?auto_18182 ) ) ( not ( = ?auto_18173 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18158 ) ) ( not ( = ?auto_18151 ?auto_18188 ) ) ( not ( = ?auto_18152 ?auto_18158 ) ) ( not ( = ?auto_18152 ?auto_18188 ) ) ( not ( = ?auto_18153 ?auto_18158 ) ) ( not ( = ?auto_18153 ?auto_18188 ) ) ( not ( = ?auto_18154 ?auto_18158 ) ) ( not ( = ?auto_18154 ?auto_18188 ) ) ( not ( = ?auto_18155 ?auto_18158 ) ) ( not ( = ?auto_18155 ?auto_18188 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18188 ) ) ( not ( = ?auto_18158 ?auto_18173 ) ) ( not ( = ?auto_18158 ?auto_18172 ) ) ( not ( = ?auto_18158 ?auto_18176 ) ) ( not ( = ?auto_18158 ?auto_18170 ) ) ( not ( = ?auto_18158 ?auto_18182 ) ) ( not ( = ?auto_18158 ?auto_18187 ) ) ( not ( = ?auto_18174 ?auto_18168 ) ) ( not ( = ?auto_18174 ?auto_18186 ) ) ( not ( = ?auto_18174 ?auto_18171 ) ) ( not ( = ?auto_18174 ?auto_18185 ) ) ( not ( = ?auto_18174 ?auto_18178 ) ) ( not ( = ?auto_18174 ?auto_18183 ) ) ( not ( = ?auto_18192 ?auto_18190 ) ) ( not ( = ?auto_18192 ?auto_18181 ) ) ( not ( = ?auto_18192 ?auto_18191 ) ) ( not ( = ?auto_18192 ?auto_18169 ) ) ( not ( = ?auto_18192 ?auto_18184 ) ) ( not ( = ?auto_18192 ?auto_18175 ) ) ( not ( = ?auto_18188 ?auto_18173 ) ) ( not ( = ?auto_18188 ?auto_18172 ) ) ( not ( = ?auto_18188 ?auto_18176 ) ) ( not ( = ?auto_18188 ?auto_18170 ) ) ( not ( = ?auto_18188 ?auto_18182 ) ) ( not ( = ?auto_18188 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18159 ) ) ( not ( = ?auto_18151 ?auto_18180 ) ) ( not ( = ?auto_18152 ?auto_18159 ) ) ( not ( = ?auto_18152 ?auto_18180 ) ) ( not ( = ?auto_18153 ?auto_18159 ) ) ( not ( = ?auto_18153 ?auto_18180 ) ) ( not ( = ?auto_18154 ?auto_18159 ) ) ( not ( = ?auto_18154 ?auto_18180 ) ) ( not ( = ?auto_18155 ?auto_18159 ) ) ( not ( = ?auto_18155 ?auto_18180 ) ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18180 ) ) ( not ( = ?auto_18157 ?auto_18159 ) ) ( not ( = ?auto_18157 ?auto_18180 ) ) ( not ( = ?auto_18159 ?auto_18188 ) ) ( not ( = ?auto_18159 ?auto_18173 ) ) ( not ( = ?auto_18159 ?auto_18172 ) ) ( not ( = ?auto_18159 ?auto_18176 ) ) ( not ( = ?auto_18159 ?auto_18170 ) ) ( not ( = ?auto_18159 ?auto_18182 ) ) ( not ( = ?auto_18159 ?auto_18187 ) ) ( not ( = ?auto_18180 ?auto_18188 ) ) ( not ( = ?auto_18180 ?auto_18173 ) ) ( not ( = ?auto_18180 ?auto_18172 ) ) ( not ( = ?auto_18180 ?auto_18176 ) ) ( not ( = ?auto_18180 ?auto_18170 ) ) ( not ( = ?auto_18180 ?auto_18182 ) ) ( not ( = ?auto_18180 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18160 ) ) ( not ( = ?auto_18151 ?auto_18177 ) ) ( not ( = ?auto_18152 ?auto_18160 ) ) ( not ( = ?auto_18152 ?auto_18177 ) ) ( not ( = ?auto_18153 ?auto_18160 ) ) ( not ( = ?auto_18153 ?auto_18177 ) ) ( not ( = ?auto_18154 ?auto_18160 ) ) ( not ( = ?auto_18154 ?auto_18177 ) ) ( not ( = ?auto_18155 ?auto_18160 ) ) ( not ( = ?auto_18155 ?auto_18177 ) ) ( not ( = ?auto_18156 ?auto_18160 ) ) ( not ( = ?auto_18156 ?auto_18177 ) ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18177 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18177 ) ) ( not ( = ?auto_18160 ?auto_18180 ) ) ( not ( = ?auto_18160 ?auto_18188 ) ) ( not ( = ?auto_18160 ?auto_18173 ) ) ( not ( = ?auto_18160 ?auto_18172 ) ) ( not ( = ?auto_18160 ?auto_18176 ) ) ( not ( = ?auto_18160 ?auto_18170 ) ) ( not ( = ?auto_18160 ?auto_18182 ) ) ( not ( = ?auto_18160 ?auto_18187 ) ) ( not ( = ?auto_18179 ?auto_18174 ) ) ( not ( = ?auto_18179 ?auto_18168 ) ) ( not ( = ?auto_18179 ?auto_18186 ) ) ( not ( = ?auto_18179 ?auto_18171 ) ) ( not ( = ?auto_18179 ?auto_18185 ) ) ( not ( = ?auto_18179 ?auto_18178 ) ) ( not ( = ?auto_18179 ?auto_18183 ) ) ( not ( = ?auto_18189 ?auto_18192 ) ) ( not ( = ?auto_18189 ?auto_18190 ) ) ( not ( = ?auto_18189 ?auto_18181 ) ) ( not ( = ?auto_18189 ?auto_18191 ) ) ( not ( = ?auto_18189 ?auto_18169 ) ) ( not ( = ?auto_18189 ?auto_18184 ) ) ( not ( = ?auto_18189 ?auto_18175 ) ) ( not ( = ?auto_18177 ?auto_18180 ) ) ( not ( = ?auto_18177 ?auto_18188 ) ) ( not ( = ?auto_18177 ?auto_18173 ) ) ( not ( = ?auto_18177 ?auto_18172 ) ) ( not ( = ?auto_18177 ?auto_18176 ) ) ( not ( = ?auto_18177 ?auto_18170 ) ) ( not ( = ?auto_18177 ?auto_18182 ) ) ( not ( = ?auto_18177 ?auto_18187 ) ) ( not ( = ?auto_18151 ?auto_18161 ) ) ( not ( = ?auto_18151 ?auto_18163 ) ) ( not ( = ?auto_18152 ?auto_18161 ) ) ( not ( = ?auto_18152 ?auto_18163 ) ) ( not ( = ?auto_18153 ?auto_18161 ) ) ( not ( = ?auto_18153 ?auto_18163 ) ) ( not ( = ?auto_18154 ?auto_18161 ) ) ( not ( = ?auto_18154 ?auto_18163 ) ) ( not ( = ?auto_18155 ?auto_18161 ) ) ( not ( = ?auto_18155 ?auto_18163 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) ( not ( = ?auto_18156 ?auto_18163 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18163 ) ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18158 ?auto_18163 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18163 ) ) ( not ( = ?auto_18161 ?auto_18177 ) ) ( not ( = ?auto_18161 ?auto_18180 ) ) ( not ( = ?auto_18161 ?auto_18188 ) ) ( not ( = ?auto_18161 ?auto_18173 ) ) ( not ( = ?auto_18161 ?auto_18172 ) ) ( not ( = ?auto_18161 ?auto_18176 ) ) ( not ( = ?auto_18161 ?auto_18170 ) ) ( not ( = ?auto_18161 ?auto_18182 ) ) ( not ( = ?auto_18161 ?auto_18187 ) ) ( not ( = ?auto_18164 ?auto_18179 ) ) ( not ( = ?auto_18164 ?auto_18174 ) ) ( not ( = ?auto_18164 ?auto_18168 ) ) ( not ( = ?auto_18164 ?auto_18186 ) ) ( not ( = ?auto_18164 ?auto_18171 ) ) ( not ( = ?auto_18164 ?auto_18185 ) ) ( not ( = ?auto_18164 ?auto_18178 ) ) ( not ( = ?auto_18164 ?auto_18183 ) ) ( not ( = ?auto_18165 ?auto_18189 ) ) ( not ( = ?auto_18165 ?auto_18192 ) ) ( not ( = ?auto_18165 ?auto_18190 ) ) ( not ( = ?auto_18165 ?auto_18181 ) ) ( not ( = ?auto_18165 ?auto_18191 ) ) ( not ( = ?auto_18165 ?auto_18169 ) ) ( not ( = ?auto_18165 ?auto_18184 ) ) ( not ( = ?auto_18165 ?auto_18175 ) ) ( not ( = ?auto_18163 ?auto_18177 ) ) ( not ( = ?auto_18163 ?auto_18180 ) ) ( not ( = ?auto_18163 ?auto_18188 ) ) ( not ( = ?auto_18163 ?auto_18173 ) ) ( not ( = ?auto_18163 ?auto_18172 ) ) ( not ( = ?auto_18163 ?auto_18176 ) ) ( not ( = ?auto_18163 ?auto_18170 ) ) ( not ( = ?auto_18163 ?auto_18182 ) ) ( not ( = ?auto_18163 ?auto_18187 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18151 ?auto_18152 ?auto_18153 ?auto_18154 ?auto_18155 ?auto_18156 ?auto_18157 ?auto_18158 ?auto_18159 ?auto_18160 )
      ( MAKE-1CRATE ?auto_18160 ?auto_18161 )
      ( MAKE-10CRATE-VERIFY ?auto_18151 ?auto_18152 ?auto_18153 ?auto_18154 ?auto_18155 ?auto_18156 ?auto_18157 ?auto_18158 ?auto_18159 ?auto_18160 ?auto_18161 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_18215 - SURFACE
      ?auto_18216 - SURFACE
      ?auto_18217 - SURFACE
      ?auto_18218 - SURFACE
      ?auto_18219 - SURFACE
      ?auto_18220 - SURFACE
      ?auto_18221 - SURFACE
      ?auto_18222 - SURFACE
      ?auto_18223 - SURFACE
      ?auto_18224 - SURFACE
      ?auto_18225 - SURFACE
      ?auto_18226 - SURFACE
    )
    :vars
    (
      ?auto_18231 - HOIST
      ?auto_18229 - PLACE
      ?auto_18232 - PLACE
      ?auto_18230 - HOIST
      ?auto_18228 - SURFACE
      ?auto_18240 - PLACE
      ?auto_18241 - HOIST
      ?auto_18251 - SURFACE
      ?auto_18233 - PLACE
      ?auto_18257 - HOIST
      ?auto_18253 - SURFACE
      ?auto_18235 - PLACE
      ?auto_18239 - HOIST
      ?auto_18254 - SURFACE
      ?auto_18246 - SURFACE
      ?auto_18238 - PLACE
      ?auto_18256 - HOIST
      ?auto_18237 - SURFACE
      ?auto_18234 - PLACE
      ?auto_18250 - HOIST
      ?auto_18249 - SURFACE
      ?auto_18243 - PLACE
      ?auto_18255 - HOIST
      ?auto_18248 - SURFACE
      ?auto_18244 - SURFACE
      ?auto_18242 - PLACE
      ?auto_18245 - HOIST
      ?auto_18252 - SURFACE
      ?auto_18236 - PLACE
      ?auto_18258 - HOIST
      ?auto_18247 - SURFACE
      ?auto_18227 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18231 ?auto_18229 ) ( IS-CRATE ?auto_18226 ) ( not ( = ?auto_18232 ?auto_18229 ) ) ( HOIST-AT ?auto_18230 ?auto_18232 ) ( SURFACE-AT ?auto_18226 ?auto_18232 ) ( ON ?auto_18226 ?auto_18228 ) ( CLEAR ?auto_18226 ) ( not ( = ?auto_18225 ?auto_18226 ) ) ( not ( = ?auto_18225 ?auto_18228 ) ) ( not ( = ?auto_18226 ?auto_18228 ) ) ( not ( = ?auto_18231 ?auto_18230 ) ) ( IS-CRATE ?auto_18225 ) ( not ( = ?auto_18240 ?auto_18229 ) ) ( HOIST-AT ?auto_18241 ?auto_18240 ) ( AVAILABLE ?auto_18241 ) ( SURFACE-AT ?auto_18225 ?auto_18240 ) ( ON ?auto_18225 ?auto_18251 ) ( CLEAR ?auto_18225 ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( not ( = ?auto_18224 ?auto_18251 ) ) ( not ( = ?auto_18225 ?auto_18251 ) ) ( not ( = ?auto_18231 ?auto_18241 ) ) ( IS-CRATE ?auto_18224 ) ( not ( = ?auto_18233 ?auto_18229 ) ) ( HOIST-AT ?auto_18257 ?auto_18233 ) ( AVAILABLE ?auto_18257 ) ( SURFACE-AT ?auto_18224 ?auto_18233 ) ( ON ?auto_18224 ?auto_18253 ) ( CLEAR ?auto_18224 ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( not ( = ?auto_18223 ?auto_18253 ) ) ( not ( = ?auto_18224 ?auto_18253 ) ) ( not ( = ?auto_18231 ?auto_18257 ) ) ( IS-CRATE ?auto_18223 ) ( not ( = ?auto_18235 ?auto_18229 ) ) ( HOIST-AT ?auto_18239 ?auto_18235 ) ( SURFACE-AT ?auto_18223 ?auto_18235 ) ( ON ?auto_18223 ?auto_18254 ) ( CLEAR ?auto_18223 ) ( not ( = ?auto_18222 ?auto_18223 ) ) ( not ( = ?auto_18222 ?auto_18254 ) ) ( not ( = ?auto_18223 ?auto_18254 ) ) ( not ( = ?auto_18231 ?auto_18239 ) ) ( IS-CRATE ?auto_18222 ) ( AVAILABLE ?auto_18239 ) ( SURFACE-AT ?auto_18222 ?auto_18235 ) ( ON ?auto_18222 ?auto_18246 ) ( CLEAR ?auto_18222 ) ( not ( = ?auto_18221 ?auto_18222 ) ) ( not ( = ?auto_18221 ?auto_18246 ) ) ( not ( = ?auto_18222 ?auto_18246 ) ) ( IS-CRATE ?auto_18221 ) ( not ( = ?auto_18238 ?auto_18229 ) ) ( HOIST-AT ?auto_18256 ?auto_18238 ) ( AVAILABLE ?auto_18256 ) ( SURFACE-AT ?auto_18221 ?auto_18238 ) ( ON ?auto_18221 ?auto_18237 ) ( CLEAR ?auto_18221 ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18237 ) ) ( not ( = ?auto_18221 ?auto_18237 ) ) ( not ( = ?auto_18231 ?auto_18256 ) ) ( IS-CRATE ?auto_18220 ) ( not ( = ?auto_18234 ?auto_18229 ) ) ( HOIST-AT ?auto_18250 ?auto_18234 ) ( AVAILABLE ?auto_18250 ) ( SURFACE-AT ?auto_18220 ?auto_18234 ) ( ON ?auto_18220 ?auto_18249 ) ( CLEAR ?auto_18220 ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18249 ) ) ( not ( = ?auto_18220 ?auto_18249 ) ) ( not ( = ?auto_18231 ?auto_18250 ) ) ( IS-CRATE ?auto_18219 ) ( not ( = ?auto_18243 ?auto_18229 ) ) ( HOIST-AT ?auto_18255 ?auto_18243 ) ( AVAILABLE ?auto_18255 ) ( SURFACE-AT ?auto_18219 ?auto_18243 ) ( ON ?auto_18219 ?auto_18248 ) ( CLEAR ?auto_18219 ) ( not ( = ?auto_18218 ?auto_18219 ) ) ( not ( = ?auto_18218 ?auto_18248 ) ) ( not ( = ?auto_18219 ?auto_18248 ) ) ( not ( = ?auto_18231 ?auto_18255 ) ) ( IS-CRATE ?auto_18218 ) ( AVAILABLE ?auto_18230 ) ( SURFACE-AT ?auto_18218 ?auto_18232 ) ( ON ?auto_18218 ?auto_18244 ) ( CLEAR ?auto_18218 ) ( not ( = ?auto_18217 ?auto_18218 ) ) ( not ( = ?auto_18217 ?auto_18244 ) ) ( not ( = ?auto_18218 ?auto_18244 ) ) ( IS-CRATE ?auto_18217 ) ( not ( = ?auto_18242 ?auto_18229 ) ) ( HOIST-AT ?auto_18245 ?auto_18242 ) ( AVAILABLE ?auto_18245 ) ( SURFACE-AT ?auto_18217 ?auto_18242 ) ( ON ?auto_18217 ?auto_18252 ) ( CLEAR ?auto_18217 ) ( not ( = ?auto_18216 ?auto_18217 ) ) ( not ( = ?auto_18216 ?auto_18252 ) ) ( not ( = ?auto_18217 ?auto_18252 ) ) ( not ( = ?auto_18231 ?auto_18245 ) ) ( SURFACE-AT ?auto_18215 ?auto_18229 ) ( CLEAR ?auto_18215 ) ( IS-CRATE ?auto_18216 ) ( AVAILABLE ?auto_18231 ) ( not ( = ?auto_18236 ?auto_18229 ) ) ( HOIST-AT ?auto_18258 ?auto_18236 ) ( AVAILABLE ?auto_18258 ) ( SURFACE-AT ?auto_18216 ?auto_18236 ) ( ON ?auto_18216 ?auto_18247 ) ( CLEAR ?auto_18216 ) ( TRUCK-AT ?auto_18227 ?auto_18229 ) ( not ( = ?auto_18215 ?auto_18216 ) ) ( not ( = ?auto_18215 ?auto_18247 ) ) ( not ( = ?auto_18216 ?auto_18247 ) ) ( not ( = ?auto_18231 ?auto_18258 ) ) ( not ( = ?auto_18215 ?auto_18217 ) ) ( not ( = ?auto_18215 ?auto_18252 ) ) ( not ( = ?auto_18217 ?auto_18247 ) ) ( not ( = ?auto_18242 ?auto_18236 ) ) ( not ( = ?auto_18245 ?auto_18258 ) ) ( not ( = ?auto_18252 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18218 ) ) ( not ( = ?auto_18215 ?auto_18244 ) ) ( not ( = ?auto_18216 ?auto_18218 ) ) ( not ( = ?auto_18216 ?auto_18244 ) ) ( not ( = ?auto_18218 ?auto_18252 ) ) ( not ( = ?auto_18218 ?auto_18247 ) ) ( not ( = ?auto_18232 ?auto_18242 ) ) ( not ( = ?auto_18232 ?auto_18236 ) ) ( not ( = ?auto_18230 ?auto_18245 ) ) ( not ( = ?auto_18230 ?auto_18258 ) ) ( not ( = ?auto_18244 ?auto_18252 ) ) ( not ( = ?auto_18244 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18219 ) ) ( not ( = ?auto_18215 ?auto_18248 ) ) ( not ( = ?auto_18216 ?auto_18219 ) ) ( not ( = ?auto_18216 ?auto_18248 ) ) ( not ( = ?auto_18217 ?auto_18219 ) ) ( not ( = ?auto_18217 ?auto_18248 ) ) ( not ( = ?auto_18219 ?auto_18244 ) ) ( not ( = ?auto_18219 ?auto_18252 ) ) ( not ( = ?auto_18219 ?auto_18247 ) ) ( not ( = ?auto_18243 ?auto_18232 ) ) ( not ( = ?auto_18243 ?auto_18242 ) ) ( not ( = ?auto_18243 ?auto_18236 ) ) ( not ( = ?auto_18255 ?auto_18230 ) ) ( not ( = ?auto_18255 ?auto_18245 ) ) ( not ( = ?auto_18255 ?auto_18258 ) ) ( not ( = ?auto_18248 ?auto_18244 ) ) ( not ( = ?auto_18248 ?auto_18252 ) ) ( not ( = ?auto_18248 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18220 ) ) ( not ( = ?auto_18215 ?auto_18249 ) ) ( not ( = ?auto_18216 ?auto_18220 ) ) ( not ( = ?auto_18216 ?auto_18249 ) ) ( not ( = ?auto_18217 ?auto_18220 ) ) ( not ( = ?auto_18217 ?auto_18249 ) ) ( not ( = ?auto_18218 ?auto_18220 ) ) ( not ( = ?auto_18218 ?auto_18249 ) ) ( not ( = ?auto_18220 ?auto_18248 ) ) ( not ( = ?auto_18220 ?auto_18244 ) ) ( not ( = ?auto_18220 ?auto_18252 ) ) ( not ( = ?auto_18220 ?auto_18247 ) ) ( not ( = ?auto_18234 ?auto_18243 ) ) ( not ( = ?auto_18234 ?auto_18232 ) ) ( not ( = ?auto_18234 ?auto_18242 ) ) ( not ( = ?auto_18234 ?auto_18236 ) ) ( not ( = ?auto_18250 ?auto_18255 ) ) ( not ( = ?auto_18250 ?auto_18230 ) ) ( not ( = ?auto_18250 ?auto_18245 ) ) ( not ( = ?auto_18250 ?auto_18258 ) ) ( not ( = ?auto_18249 ?auto_18248 ) ) ( not ( = ?auto_18249 ?auto_18244 ) ) ( not ( = ?auto_18249 ?auto_18252 ) ) ( not ( = ?auto_18249 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18221 ) ) ( not ( = ?auto_18215 ?auto_18237 ) ) ( not ( = ?auto_18216 ?auto_18221 ) ) ( not ( = ?auto_18216 ?auto_18237 ) ) ( not ( = ?auto_18217 ?auto_18221 ) ) ( not ( = ?auto_18217 ?auto_18237 ) ) ( not ( = ?auto_18218 ?auto_18221 ) ) ( not ( = ?auto_18218 ?auto_18237 ) ) ( not ( = ?auto_18219 ?auto_18221 ) ) ( not ( = ?auto_18219 ?auto_18237 ) ) ( not ( = ?auto_18221 ?auto_18249 ) ) ( not ( = ?auto_18221 ?auto_18248 ) ) ( not ( = ?auto_18221 ?auto_18244 ) ) ( not ( = ?auto_18221 ?auto_18252 ) ) ( not ( = ?auto_18221 ?auto_18247 ) ) ( not ( = ?auto_18238 ?auto_18234 ) ) ( not ( = ?auto_18238 ?auto_18243 ) ) ( not ( = ?auto_18238 ?auto_18232 ) ) ( not ( = ?auto_18238 ?auto_18242 ) ) ( not ( = ?auto_18238 ?auto_18236 ) ) ( not ( = ?auto_18256 ?auto_18250 ) ) ( not ( = ?auto_18256 ?auto_18255 ) ) ( not ( = ?auto_18256 ?auto_18230 ) ) ( not ( = ?auto_18256 ?auto_18245 ) ) ( not ( = ?auto_18256 ?auto_18258 ) ) ( not ( = ?auto_18237 ?auto_18249 ) ) ( not ( = ?auto_18237 ?auto_18248 ) ) ( not ( = ?auto_18237 ?auto_18244 ) ) ( not ( = ?auto_18237 ?auto_18252 ) ) ( not ( = ?auto_18237 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18222 ) ) ( not ( = ?auto_18215 ?auto_18246 ) ) ( not ( = ?auto_18216 ?auto_18222 ) ) ( not ( = ?auto_18216 ?auto_18246 ) ) ( not ( = ?auto_18217 ?auto_18222 ) ) ( not ( = ?auto_18217 ?auto_18246 ) ) ( not ( = ?auto_18218 ?auto_18222 ) ) ( not ( = ?auto_18218 ?auto_18246 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18246 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18246 ) ) ( not ( = ?auto_18222 ?auto_18237 ) ) ( not ( = ?auto_18222 ?auto_18249 ) ) ( not ( = ?auto_18222 ?auto_18248 ) ) ( not ( = ?auto_18222 ?auto_18244 ) ) ( not ( = ?auto_18222 ?auto_18252 ) ) ( not ( = ?auto_18222 ?auto_18247 ) ) ( not ( = ?auto_18235 ?auto_18238 ) ) ( not ( = ?auto_18235 ?auto_18234 ) ) ( not ( = ?auto_18235 ?auto_18243 ) ) ( not ( = ?auto_18235 ?auto_18232 ) ) ( not ( = ?auto_18235 ?auto_18242 ) ) ( not ( = ?auto_18235 ?auto_18236 ) ) ( not ( = ?auto_18239 ?auto_18256 ) ) ( not ( = ?auto_18239 ?auto_18250 ) ) ( not ( = ?auto_18239 ?auto_18255 ) ) ( not ( = ?auto_18239 ?auto_18230 ) ) ( not ( = ?auto_18239 ?auto_18245 ) ) ( not ( = ?auto_18239 ?auto_18258 ) ) ( not ( = ?auto_18246 ?auto_18237 ) ) ( not ( = ?auto_18246 ?auto_18249 ) ) ( not ( = ?auto_18246 ?auto_18248 ) ) ( not ( = ?auto_18246 ?auto_18244 ) ) ( not ( = ?auto_18246 ?auto_18252 ) ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18223 ) ) ( not ( = ?auto_18215 ?auto_18254 ) ) ( not ( = ?auto_18216 ?auto_18223 ) ) ( not ( = ?auto_18216 ?auto_18254 ) ) ( not ( = ?auto_18217 ?auto_18223 ) ) ( not ( = ?auto_18217 ?auto_18254 ) ) ( not ( = ?auto_18218 ?auto_18223 ) ) ( not ( = ?auto_18218 ?auto_18254 ) ) ( not ( = ?auto_18219 ?auto_18223 ) ) ( not ( = ?auto_18219 ?auto_18254 ) ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18254 ) ) ( not ( = ?auto_18221 ?auto_18223 ) ) ( not ( = ?auto_18221 ?auto_18254 ) ) ( not ( = ?auto_18223 ?auto_18246 ) ) ( not ( = ?auto_18223 ?auto_18237 ) ) ( not ( = ?auto_18223 ?auto_18249 ) ) ( not ( = ?auto_18223 ?auto_18248 ) ) ( not ( = ?auto_18223 ?auto_18244 ) ) ( not ( = ?auto_18223 ?auto_18252 ) ) ( not ( = ?auto_18223 ?auto_18247 ) ) ( not ( = ?auto_18254 ?auto_18246 ) ) ( not ( = ?auto_18254 ?auto_18237 ) ) ( not ( = ?auto_18254 ?auto_18249 ) ) ( not ( = ?auto_18254 ?auto_18248 ) ) ( not ( = ?auto_18254 ?auto_18244 ) ) ( not ( = ?auto_18254 ?auto_18252 ) ) ( not ( = ?auto_18254 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18224 ) ) ( not ( = ?auto_18215 ?auto_18253 ) ) ( not ( = ?auto_18216 ?auto_18224 ) ) ( not ( = ?auto_18216 ?auto_18253 ) ) ( not ( = ?auto_18217 ?auto_18224 ) ) ( not ( = ?auto_18217 ?auto_18253 ) ) ( not ( = ?auto_18218 ?auto_18224 ) ) ( not ( = ?auto_18218 ?auto_18253 ) ) ( not ( = ?auto_18219 ?auto_18224 ) ) ( not ( = ?auto_18219 ?auto_18253 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18253 ) ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18253 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18253 ) ) ( not ( = ?auto_18224 ?auto_18254 ) ) ( not ( = ?auto_18224 ?auto_18246 ) ) ( not ( = ?auto_18224 ?auto_18237 ) ) ( not ( = ?auto_18224 ?auto_18249 ) ) ( not ( = ?auto_18224 ?auto_18248 ) ) ( not ( = ?auto_18224 ?auto_18244 ) ) ( not ( = ?auto_18224 ?auto_18252 ) ) ( not ( = ?auto_18224 ?auto_18247 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18233 ?auto_18238 ) ) ( not ( = ?auto_18233 ?auto_18234 ) ) ( not ( = ?auto_18233 ?auto_18243 ) ) ( not ( = ?auto_18233 ?auto_18232 ) ) ( not ( = ?auto_18233 ?auto_18242 ) ) ( not ( = ?auto_18233 ?auto_18236 ) ) ( not ( = ?auto_18257 ?auto_18239 ) ) ( not ( = ?auto_18257 ?auto_18256 ) ) ( not ( = ?auto_18257 ?auto_18250 ) ) ( not ( = ?auto_18257 ?auto_18255 ) ) ( not ( = ?auto_18257 ?auto_18230 ) ) ( not ( = ?auto_18257 ?auto_18245 ) ) ( not ( = ?auto_18257 ?auto_18258 ) ) ( not ( = ?auto_18253 ?auto_18254 ) ) ( not ( = ?auto_18253 ?auto_18246 ) ) ( not ( = ?auto_18253 ?auto_18237 ) ) ( not ( = ?auto_18253 ?auto_18249 ) ) ( not ( = ?auto_18253 ?auto_18248 ) ) ( not ( = ?auto_18253 ?auto_18244 ) ) ( not ( = ?auto_18253 ?auto_18252 ) ) ( not ( = ?auto_18253 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18225 ) ) ( not ( = ?auto_18215 ?auto_18251 ) ) ( not ( = ?auto_18216 ?auto_18225 ) ) ( not ( = ?auto_18216 ?auto_18251 ) ) ( not ( = ?auto_18217 ?auto_18225 ) ) ( not ( = ?auto_18217 ?auto_18251 ) ) ( not ( = ?auto_18218 ?auto_18225 ) ) ( not ( = ?auto_18218 ?auto_18251 ) ) ( not ( = ?auto_18219 ?auto_18225 ) ) ( not ( = ?auto_18219 ?auto_18251 ) ) ( not ( = ?auto_18220 ?auto_18225 ) ) ( not ( = ?auto_18220 ?auto_18251 ) ) ( not ( = ?auto_18221 ?auto_18225 ) ) ( not ( = ?auto_18221 ?auto_18251 ) ) ( not ( = ?auto_18222 ?auto_18225 ) ) ( not ( = ?auto_18222 ?auto_18251 ) ) ( not ( = ?auto_18223 ?auto_18225 ) ) ( not ( = ?auto_18223 ?auto_18251 ) ) ( not ( = ?auto_18225 ?auto_18253 ) ) ( not ( = ?auto_18225 ?auto_18254 ) ) ( not ( = ?auto_18225 ?auto_18246 ) ) ( not ( = ?auto_18225 ?auto_18237 ) ) ( not ( = ?auto_18225 ?auto_18249 ) ) ( not ( = ?auto_18225 ?auto_18248 ) ) ( not ( = ?auto_18225 ?auto_18244 ) ) ( not ( = ?auto_18225 ?auto_18252 ) ) ( not ( = ?auto_18225 ?auto_18247 ) ) ( not ( = ?auto_18240 ?auto_18233 ) ) ( not ( = ?auto_18240 ?auto_18235 ) ) ( not ( = ?auto_18240 ?auto_18238 ) ) ( not ( = ?auto_18240 ?auto_18234 ) ) ( not ( = ?auto_18240 ?auto_18243 ) ) ( not ( = ?auto_18240 ?auto_18232 ) ) ( not ( = ?auto_18240 ?auto_18242 ) ) ( not ( = ?auto_18240 ?auto_18236 ) ) ( not ( = ?auto_18241 ?auto_18257 ) ) ( not ( = ?auto_18241 ?auto_18239 ) ) ( not ( = ?auto_18241 ?auto_18256 ) ) ( not ( = ?auto_18241 ?auto_18250 ) ) ( not ( = ?auto_18241 ?auto_18255 ) ) ( not ( = ?auto_18241 ?auto_18230 ) ) ( not ( = ?auto_18241 ?auto_18245 ) ) ( not ( = ?auto_18241 ?auto_18258 ) ) ( not ( = ?auto_18251 ?auto_18253 ) ) ( not ( = ?auto_18251 ?auto_18254 ) ) ( not ( = ?auto_18251 ?auto_18246 ) ) ( not ( = ?auto_18251 ?auto_18237 ) ) ( not ( = ?auto_18251 ?auto_18249 ) ) ( not ( = ?auto_18251 ?auto_18248 ) ) ( not ( = ?auto_18251 ?auto_18244 ) ) ( not ( = ?auto_18251 ?auto_18252 ) ) ( not ( = ?auto_18251 ?auto_18247 ) ) ( not ( = ?auto_18215 ?auto_18226 ) ) ( not ( = ?auto_18215 ?auto_18228 ) ) ( not ( = ?auto_18216 ?auto_18226 ) ) ( not ( = ?auto_18216 ?auto_18228 ) ) ( not ( = ?auto_18217 ?auto_18226 ) ) ( not ( = ?auto_18217 ?auto_18228 ) ) ( not ( = ?auto_18218 ?auto_18226 ) ) ( not ( = ?auto_18218 ?auto_18228 ) ) ( not ( = ?auto_18219 ?auto_18226 ) ) ( not ( = ?auto_18219 ?auto_18228 ) ) ( not ( = ?auto_18220 ?auto_18226 ) ) ( not ( = ?auto_18220 ?auto_18228 ) ) ( not ( = ?auto_18221 ?auto_18226 ) ) ( not ( = ?auto_18221 ?auto_18228 ) ) ( not ( = ?auto_18222 ?auto_18226 ) ) ( not ( = ?auto_18222 ?auto_18228 ) ) ( not ( = ?auto_18223 ?auto_18226 ) ) ( not ( = ?auto_18223 ?auto_18228 ) ) ( not ( = ?auto_18224 ?auto_18226 ) ) ( not ( = ?auto_18224 ?auto_18228 ) ) ( not ( = ?auto_18226 ?auto_18251 ) ) ( not ( = ?auto_18226 ?auto_18253 ) ) ( not ( = ?auto_18226 ?auto_18254 ) ) ( not ( = ?auto_18226 ?auto_18246 ) ) ( not ( = ?auto_18226 ?auto_18237 ) ) ( not ( = ?auto_18226 ?auto_18249 ) ) ( not ( = ?auto_18226 ?auto_18248 ) ) ( not ( = ?auto_18226 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18252 ) ) ( not ( = ?auto_18226 ?auto_18247 ) ) ( not ( = ?auto_18228 ?auto_18251 ) ) ( not ( = ?auto_18228 ?auto_18253 ) ) ( not ( = ?auto_18228 ?auto_18254 ) ) ( not ( = ?auto_18228 ?auto_18246 ) ) ( not ( = ?auto_18228 ?auto_18237 ) ) ( not ( = ?auto_18228 ?auto_18249 ) ) ( not ( = ?auto_18228 ?auto_18248 ) ) ( not ( = ?auto_18228 ?auto_18244 ) ) ( not ( = ?auto_18228 ?auto_18252 ) ) ( not ( = ?auto_18228 ?auto_18247 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18215 ?auto_18216 ?auto_18217 ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ?auto_18224 ?auto_18225 )
      ( MAKE-1CRATE ?auto_18225 ?auto_18226 )
      ( MAKE-11CRATE-VERIFY ?auto_18215 ?auto_18216 ?auto_18217 ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18221 ?auto_18222 ?auto_18223 ?auto_18224 ?auto_18225 ?auto_18226 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_18282 - SURFACE
      ?auto_18283 - SURFACE
      ?auto_18284 - SURFACE
      ?auto_18285 - SURFACE
      ?auto_18286 - SURFACE
      ?auto_18287 - SURFACE
      ?auto_18288 - SURFACE
      ?auto_18289 - SURFACE
      ?auto_18290 - SURFACE
      ?auto_18291 - SURFACE
      ?auto_18292 - SURFACE
      ?auto_18293 - SURFACE
      ?auto_18294 - SURFACE
    )
    :vars
    (
      ?auto_18295 - HOIST
      ?auto_18299 - PLACE
      ?auto_18296 - PLACE
      ?auto_18298 - HOIST
      ?auto_18300 - SURFACE
      ?auto_18302 - PLACE
      ?auto_18307 - HOIST
      ?auto_18304 - SURFACE
      ?auto_18325 - PLACE
      ?auto_18324 - HOIST
      ?auto_18321 - SURFACE
      ?auto_18301 - PLACE
      ?auto_18312 - HOIST
      ?auto_18316 - SURFACE
      ?auto_18313 - PLACE
      ?auto_18319 - HOIST
      ?auto_18308 - SURFACE
      ?auto_18328 - SURFACE
      ?auto_18314 - PLACE
      ?auto_18320 - HOIST
      ?auto_18315 - SURFACE
      ?auto_18329 - PLACE
      ?auto_18318 - HOIST
      ?auto_18317 - SURFACE
      ?auto_18309 - PLACE
      ?auto_18322 - HOIST
      ?auto_18323 - SURFACE
      ?auto_18305 - SURFACE
      ?auto_18310 - PLACE
      ?auto_18327 - HOIST
      ?auto_18306 - SURFACE
      ?auto_18303 - PLACE
      ?auto_18326 - HOIST
      ?auto_18311 - SURFACE
      ?auto_18297 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18295 ?auto_18299 ) ( IS-CRATE ?auto_18294 ) ( not ( = ?auto_18296 ?auto_18299 ) ) ( HOIST-AT ?auto_18298 ?auto_18296 ) ( AVAILABLE ?auto_18298 ) ( SURFACE-AT ?auto_18294 ?auto_18296 ) ( ON ?auto_18294 ?auto_18300 ) ( CLEAR ?auto_18294 ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18300 ) ) ( not ( = ?auto_18295 ?auto_18298 ) ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18302 ?auto_18299 ) ) ( HOIST-AT ?auto_18307 ?auto_18302 ) ( SURFACE-AT ?auto_18293 ?auto_18302 ) ( ON ?auto_18293 ?auto_18304 ) ( CLEAR ?auto_18293 ) ( not ( = ?auto_18292 ?auto_18293 ) ) ( not ( = ?auto_18292 ?auto_18304 ) ) ( not ( = ?auto_18293 ?auto_18304 ) ) ( not ( = ?auto_18295 ?auto_18307 ) ) ( IS-CRATE ?auto_18292 ) ( not ( = ?auto_18325 ?auto_18299 ) ) ( HOIST-AT ?auto_18324 ?auto_18325 ) ( AVAILABLE ?auto_18324 ) ( SURFACE-AT ?auto_18292 ?auto_18325 ) ( ON ?auto_18292 ?auto_18321 ) ( CLEAR ?auto_18292 ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18321 ) ) ( not ( = ?auto_18292 ?auto_18321 ) ) ( not ( = ?auto_18295 ?auto_18324 ) ) ( IS-CRATE ?auto_18291 ) ( not ( = ?auto_18301 ?auto_18299 ) ) ( HOIST-AT ?auto_18312 ?auto_18301 ) ( AVAILABLE ?auto_18312 ) ( SURFACE-AT ?auto_18291 ?auto_18301 ) ( ON ?auto_18291 ?auto_18316 ) ( CLEAR ?auto_18291 ) ( not ( = ?auto_18290 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18316 ) ) ( not ( = ?auto_18291 ?auto_18316 ) ) ( not ( = ?auto_18295 ?auto_18312 ) ) ( IS-CRATE ?auto_18290 ) ( not ( = ?auto_18313 ?auto_18299 ) ) ( HOIST-AT ?auto_18319 ?auto_18313 ) ( SURFACE-AT ?auto_18290 ?auto_18313 ) ( ON ?auto_18290 ?auto_18308 ) ( CLEAR ?auto_18290 ) ( not ( = ?auto_18289 ?auto_18290 ) ) ( not ( = ?auto_18289 ?auto_18308 ) ) ( not ( = ?auto_18290 ?auto_18308 ) ) ( not ( = ?auto_18295 ?auto_18319 ) ) ( IS-CRATE ?auto_18289 ) ( AVAILABLE ?auto_18319 ) ( SURFACE-AT ?auto_18289 ?auto_18313 ) ( ON ?auto_18289 ?auto_18328 ) ( CLEAR ?auto_18289 ) ( not ( = ?auto_18288 ?auto_18289 ) ) ( not ( = ?auto_18288 ?auto_18328 ) ) ( not ( = ?auto_18289 ?auto_18328 ) ) ( IS-CRATE ?auto_18288 ) ( not ( = ?auto_18314 ?auto_18299 ) ) ( HOIST-AT ?auto_18320 ?auto_18314 ) ( AVAILABLE ?auto_18320 ) ( SURFACE-AT ?auto_18288 ?auto_18314 ) ( ON ?auto_18288 ?auto_18315 ) ( CLEAR ?auto_18288 ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18315 ) ) ( not ( = ?auto_18288 ?auto_18315 ) ) ( not ( = ?auto_18295 ?auto_18320 ) ) ( IS-CRATE ?auto_18287 ) ( not ( = ?auto_18329 ?auto_18299 ) ) ( HOIST-AT ?auto_18318 ?auto_18329 ) ( AVAILABLE ?auto_18318 ) ( SURFACE-AT ?auto_18287 ?auto_18329 ) ( ON ?auto_18287 ?auto_18317 ) ( CLEAR ?auto_18287 ) ( not ( = ?auto_18286 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18317 ) ) ( not ( = ?auto_18287 ?auto_18317 ) ) ( not ( = ?auto_18295 ?auto_18318 ) ) ( IS-CRATE ?auto_18286 ) ( not ( = ?auto_18309 ?auto_18299 ) ) ( HOIST-AT ?auto_18322 ?auto_18309 ) ( AVAILABLE ?auto_18322 ) ( SURFACE-AT ?auto_18286 ?auto_18309 ) ( ON ?auto_18286 ?auto_18323 ) ( CLEAR ?auto_18286 ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18323 ) ) ( not ( = ?auto_18286 ?auto_18323 ) ) ( not ( = ?auto_18295 ?auto_18322 ) ) ( IS-CRATE ?auto_18285 ) ( AVAILABLE ?auto_18307 ) ( SURFACE-AT ?auto_18285 ?auto_18302 ) ( ON ?auto_18285 ?auto_18305 ) ( CLEAR ?auto_18285 ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18305 ) ) ( not ( = ?auto_18285 ?auto_18305 ) ) ( IS-CRATE ?auto_18284 ) ( not ( = ?auto_18310 ?auto_18299 ) ) ( HOIST-AT ?auto_18327 ?auto_18310 ) ( AVAILABLE ?auto_18327 ) ( SURFACE-AT ?auto_18284 ?auto_18310 ) ( ON ?auto_18284 ?auto_18306 ) ( CLEAR ?auto_18284 ) ( not ( = ?auto_18283 ?auto_18284 ) ) ( not ( = ?auto_18283 ?auto_18306 ) ) ( not ( = ?auto_18284 ?auto_18306 ) ) ( not ( = ?auto_18295 ?auto_18327 ) ) ( SURFACE-AT ?auto_18282 ?auto_18299 ) ( CLEAR ?auto_18282 ) ( IS-CRATE ?auto_18283 ) ( AVAILABLE ?auto_18295 ) ( not ( = ?auto_18303 ?auto_18299 ) ) ( HOIST-AT ?auto_18326 ?auto_18303 ) ( AVAILABLE ?auto_18326 ) ( SURFACE-AT ?auto_18283 ?auto_18303 ) ( ON ?auto_18283 ?auto_18311 ) ( CLEAR ?auto_18283 ) ( TRUCK-AT ?auto_18297 ?auto_18299 ) ( not ( = ?auto_18282 ?auto_18283 ) ) ( not ( = ?auto_18282 ?auto_18311 ) ) ( not ( = ?auto_18283 ?auto_18311 ) ) ( not ( = ?auto_18295 ?auto_18326 ) ) ( not ( = ?auto_18282 ?auto_18284 ) ) ( not ( = ?auto_18282 ?auto_18306 ) ) ( not ( = ?auto_18284 ?auto_18311 ) ) ( not ( = ?auto_18310 ?auto_18303 ) ) ( not ( = ?auto_18327 ?auto_18326 ) ) ( not ( = ?auto_18306 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( not ( = ?auto_18282 ?auto_18305 ) ) ( not ( = ?auto_18283 ?auto_18285 ) ) ( not ( = ?auto_18283 ?auto_18305 ) ) ( not ( = ?auto_18285 ?auto_18306 ) ) ( not ( = ?auto_18285 ?auto_18311 ) ) ( not ( = ?auto_18302 ?auto_18310 ) ) ( not ( = ?auto_18302 ?auto_18303 ) ) ( not ( = ?auto_18307 ?auto_18327 ) ) ( not ( = ?auto_18307 ?auto_18326 ) ) ( not ( = ?auto_18305 ?auto_18306 ) ) ( not ( = ?auto_18305 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18286 ) ) ( not ( = ?auto_18282 ?auto_18323 ) ) ( not ( = ?auto_18283 ?auto_18286 ) ) ( not ( = ?auto_18283 ?auto_18323 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18323 ) ) ( not ( = ?auto_18286 ?auto_18305 ) ) ( not ( = ?auto_18286 ?auto_18306 ) ) ( not ( = ?auto_18286 ?auto_18311 ) ) ( not ( = ?auto_18309 ?auto_18302 ) ) ( not ( = ?auto_18309 ?auto_18310 ) ) ( not ( = ?auto_18309 ?auto_18303 ) ) ( not ( = ?auto_18322 ?auto_18307 ) ) ( not ( = ?auto_18322 ?auto_18327 ) ) ( not ( = ?auto_18322 ?auto_18326 ) ) ( not ( = ?auto_18323 ?auto_18305 ) ) ( not ( = ?auto_18323 ?auto_18306 ) ) ( not ( = ?auto_18323 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18287 ) ) ( not ( = ?auto_18282 ?auto_18317 ) ) ( not ( = ?auto_18283 ?auto_18287 ) ) ( not ( = ?auto_18283 ?auto_18317 ) ) ( not ( = ?auto_18284 ?auto_18287 ) ) ( not ( = ?auto_18284 ?auto_18317 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18317 ) ) ( not ( = ?auto_18287 ?auto_18323 ) ) ( not ( = ?auto_18287 ?auto_18305 ) ) ( not ( = ?auto_18287 ?auto_18306 ) ) ( not ( = ?auto_18287 ?auto_18311 ) ) ( not ( = ?auto_18329 ?auto_18309 ) ) ( not ( = ?auto_18329 ?auto_18302 ) ) ( not ( = ?auto_18329 ?auto_18310 ) ) ( not ( = ?auto_18329 ?auto_18303 ) ) ( not ( = ?auto_18318 ?auto_18322 ) ) ( not ( = ?auto_18318 ?auto_18307 ) ) ( not ( = ?auto_18318 ?auto_18327 ) ) ( not ( = ?auto_18318 ?auto_18326 ) ) ( not ( = ?auto_18317 ?auto_18323 ) ) ( not ( = ?auto_18317 ?auto_18305 ) ) ( not ( = ?auto_18317 ?auto_18306 ) ) ( not ( = ?auto_18317 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18288 ) ) ( not ( = ?auto_18282 ?auto_18315 ) ) ( not ( = ?auto_18283 ?auto_18288 ) ) ( not ( = ?auto_18283 ?auto_18315 ) ) ( not ( = ?auto_18284 ?auto_18288 ) ) ( not ( = ?auto_18284 ?auto_18315 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18285 ?auto_18315 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18315 ) ) ( not ( = ?auto_18288 ?auto_18317 ) ) ( not ( = ?auto_18288 ?auto_18323 ) ) ( not ( = ?auto_18288 ?auto_18305 ) ) ( not ( = ?auto_18288 ?auto_18306 ) ) ( not ( = ?auto_18288 ?auto_18311 ) ) ( not ( = ?auto_18314 ?auto_18329 ) ) ( not ( = ?auto_18314 ?auto_18309 ) ) ( not ( = ?auto_18314 ?auto_18302 ) ) ( not ( = ?auto_18314 ?auto_18310 ) ) ( not ( = ?auto_18314 ?auto_18303 ) ) ( not ( = ?auto_18320 ?auto_18318 ) ) ( not ( = ?auto_18320 ?auto_18322 ) ) ( not ( = ?auto_18320 ?auto_18307 ) ) ( not ( = ?auto_18320 ?auto_18327 ) ) ( not ( = ?auto_18320 ?auto_18326 ) ) ( not ( = ?auto_18315 ?auto_18317 ) ) ( not ( = ?auto_18315 ?auto_18323 ) ) ( not ( = ?auto_18315 ?auto_18305 ) ) ( not ( = ?auto_18315 ?auto_18306 ) ) ( not ( = ?auto_18315 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18289 ) ) ( not ( = ?auto_18282 ?auto_18328 ) ) ( not ( = ?auto_18283 ?auto_18289 ) ) ( not ( = ?auto_18283 ?auto_18328 ) ) ( not ( = ?auto_18284 ?auto_18289 ) ) ( not ( = ?auto_18284 ?auto_18328 ) ) ( not ( = ?auto_18285 ?auto_18289 ) ) ( not ( = ?auto_18285 ?auto_18328 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( not ( = ?auto_18286 ?auto_18328 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18328 ) ) ( not ( = ?auto_18289 ?auto_18315 ) ) ( not ( = ?auto_18289 ?auto_18317 ) ) ( not ( = ?auto_18289 ?auto_18323 ) ) ( not ( = ?auto_18289 ?auto_18305 ) ) ( not ( = ?auto_18289 ?auto_18306 ) ) ( not ( = ?auto_18289 ?auto_18311 ) ) ( not ( = ?auto_18313 ?auto_18314 ) ) ( not ( = ?auto_18313 ?auto_18329 ) ) ( not ( = ?auto_18313 ?auto_18309 ) ) ( not ( = ?auto_18313 ?auto_18302 ) ) ( not ( = ?auto_18313 ?auto_18310 ) ) ( not ( = ?auto_18313 ?auto_18303 ) ) ( not ( = ?auto_18319 ?auto_18320 ) ) ( not ( = ?auto_18319 ?auto_18318 ) ) ( not ( = ?auto_18319 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18307 ) ) ( not ( = ?auto_18319 ?auto_18327 ) ) ( not ( = ?auto_18319 ?auto_18326 ) ) ( not ( = ?auto_18328 ?auto_18315 ) ) ( not ( = ?auto_18328 ?auto_18317 ) ) ( not ( = ?auto_18328 ?auto_18323 ) ) ( not ( = ?auto_18328 ?auto_18305 ) ) ( not ( = ?auto_18328 ?auto_18306 ) ) ( not ( = ?auto_18328 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18290 ) ) ( not ( = ?auto_18282 ?auto_18308 ) ) ( not ( = ?auto_18283 ?auto_18290 ) ) ( not ( = ?auto_18283 ?auto_18308 ) ) ( not ( = ?auto_18284 ?auto_18290 ) ) ( not ( = ?auto_18284 ?auto_18308 ) ) ( not ( = ?auto_18285 ?auto_18290 ) ) ( not ( = ?auto_18285 ?auto_18308 ) ) ( not ( = ?auto_18286 ?auto_18290 ) ) ( not ( = ?auto_18286 ?auto_18308 ) ) ( not ( = ?auto_18287 ?auto_18290 ) ) ( not ( = ?auto_18287 ?auto_18308 ) ) ( not ( = ?auto_18288 ?auto_18290 ) ) ( not ( = ?auto_18288 ?auto_18308 ) ) ( not ( = ?auto_18290 ?auto_18328 ) ) ( not ( = ?auto_18290 ?auto_18315 ) ) ( not ( = ?auto_18290 ?auto_18317 ) ) ( not ( = ?auto_18290 ?auto_18323 ) ) ( not ( = ?auto_18290 ?auto_18305 ) ) ( not ( = ?auto_18290 ?auto_18306 ) ) ( not ( = ?auto_18290 ?auto_18311 ) ) ( not ( = ?auto_18308 ?auto_18328 ) ) ( not ( = ?auto_18308 ?auto_18315 ) ) ( not ( = ?auto_18308 ?auto_18317 ) ) ( not ( = ?auto_18308 ?auto_18323 ) ) ( not ( = ?auto_18308 ?auto_18305 ) ) ( not ( = ?auto_18308 ?auto_18306 ) ) ( not ( = ?auto_18308 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18291 ) ) ( not ( = ?auto_18282 ?auto_18316 ) ) ( not ( = ?auto_18283 ?auto_18291 ) ) ( not ( = ?auto_18283 ?auto_18316 ) ) ( not ( = ?auto_18284 ?auto_18291 ) ) ( not ( = ?auto_18284 ?auto_18316 ) ) ( not ( = ?auto_18285 ?auto_18291 ) ) ( not ( = ?auto_18285 ?auto_18316 ) ) ( not ( = ?auto_18286 ?auto_18291 ) ) ( not ( = ?auto_18286 ?auto_18316 ) ) ( not ( = ?auto_18287 ?auto_18291 ) ) ( not ( = ?auto_18287 ?auto_18316 ) ) ( not ( = ?auto_18288 ?auto_18291 ) ) ( not ( = ?auto_18288 ?auto_18316 ) ) ( not ( = ?auto_18289 ?auto_18291 ) ) ( not ( = ?auto_18289 ?auto_18316 ) ) ( not ( = ?auto_18291 ?auto_18308 ) ) ( not ( = ?auto_18291 ?auto_18328 ) ) ( not ( = ?auto_18291 ?auto_18315 ) ) ( not ( = ?auto_18291 ?auto_18317 ) ) ( not ( = ?auto_18291 ?auto_18323 ) ) ( not ( = ?auto_18291 ?auto_18305 ) ) ( not ( = ?auto_18291 ?auto_18306 ) ) ( not ( = ?auto_18291 ?auto_18311 ) ) ( not ( = ?auto_18301 ?auto_18313 ) ) ( not ( = ?auto_18301 ?auto_18314 ) ) ( not ( = ?auto_18301 ?auto_18329 ) ) ( not ( = ?auto_18301 ?auto_18309 ) ) ( not ( = ?auto_18301 ?auto_18302 ) ) ( not ( = ?auto_18301 ?auto_18310 ) ) ( not ( = ?auto_18301 ?auto_18303 ) ) ( not ( = ?auto_18312 ?auto_18319 ) ) ( not ( = ?auto_18312 ?auto_18320 ) ) ( not ( = ?auto_18312 ?auto_18318 ) ) ( not ( = ?auto_18312 ?auto_18322 ) ) ( not ( = ?auto_18312 ?auto_18307 ) ) ( not ( = ?auto_18312 ?auto_18327 ) ) ( not ( = ?auto_18312 ?auto_18326 ) ) ( not ( = ?auto_18316 ?auto_18308 ) ) ( not ( = ?auto_18316 ?auto_18328 ) ) ( not ( = ?auto_18316 ?auto_18315 ) ) ( not ( = ?auto_18316 ?auto_18317 ) ) ( not ( = ?auto_18316 ?auto_18323 ) ) ( not ( = ?auto_18316 ?auto_18305 ) ) ( not ( = ?auto_18316 ?auto_18306 ) ) ( not ( = ?auto_18316 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18292 ) ) ( not ( = ?auto_18282 ?auto_18321 ) ) ( not ( = ?auto_18283 ?auto_18292 ) ) ( not ( = ?auto_18283 ?auto_18321 ) ) ( not ( = ?auto_18284 ?auto_18292 ) ) ( not ( = ?auto_18284 ?auto_18321 ) ) ( not ( = ?auto_18285 ?auto_18292 ) ) ( not ( = ?auto_18285 ?auto_18321 ) ) ( not ( = ?auto_18286 ?auto_18292 ) ) ( not ( = ?auto_18286 ?auto_18321 ) ) ( not ( = ?auto_18287 ?auto_18292 ) ) ( not ( = ?auto_18287 ?auto_18321 ) ) ( not ( = ?auto_18288 ?auto_18292 ) ) ( not ( = ?auto_18288 ?auto_18321 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18321 ) ) ( not ( = ?auto_18290 ?auto_18292 ) ) ( not ( = ?auto_18290 ?auto_18321 ) ) ( not ( = ?auto_18292 ?auto_18316 ) ) ( not ( = ?auto_18292 ?auto_18308 ) ) ( not ( = ?auto_18292 ?auto_18328 ) ) ( not ( = ?auto_18292 ?auto_18315 ) ) ( not ( = ?auto_18292 ?auto_18317 ) ) ( not ( = ?auto_18292 ?auto_18323 ) ) ( not ( = ?auto_18292 ?auto_18305 ) ) ( not ( = ?auto_18292 ?auto_18306 ) ) ( not ( = ?auto_18292 ?auto_18311 ) ) ( not ( = ?auto_18325 ?auto_18301 ) ) ( not ( = ?auto_18325 ?auto_18313 ) ) ( not ( = ?auto_18325 ?auto_18314 ) ) ( not ( = ?auto_18325 ?auto_18329 ) ) ( not ( = ?auto_18325 ?auto_18309 ) ) ( not ( = ?auto_18325 ?auto_18302 ) ) ( not ( = ?auto_18325 ?auto_18310 ) ) ( not ( = ?auto_18325 ?auto_18303 ) ) ( not ( = ?auto_18324 ?auto_18312 ) ) ( not ( = ?auto_18324 ?auto_18319 ) ) ( not ( = ?auto_18324 ?auto_18320 ) ) ( not ( = ?auto_18324 ?auto_18318 ) ) ( not ( = ?auto_18324 ?auto_18322 ) ) ( not ( = ?auto_18324 ?auto_18307 ) ) ( not ( = ?auto_18324 ?auto_18327 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18321 ?auto_18316 ) ) ( not ( = ?auto_18321 ?auto_18308 ) ) ( not ( = ?auto_18321 ?auto_18328 ) ) ( not ( = ?auto_18321 ?auto_18315 ) ) ( not ( = ?auto_18321 ?auto_18317 ) ) ( not ( = ?auto_18321 ?auto_18323 ) ) ( not ( = ?auto_18321 ?auto_18305 ) ) ( not ( = ?auto_18321 ?auto_18306 ) ) ( not ( = ?auto_18321 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18293 ) ) ( not ( = ?auto_18282 ?auto_18304 ) ) ( not ( = ?auto_18283 ?auto_18293 ) ) ( not ( = ?auto_18283 ?auto_18304 ) ) ( not ( = ?auto_18284 ?auto_18293 ) ) ( not ( = ?auto_18284 ?auto_18304 ) ) ( not ( = ?auto_18285 ?auto_18293 ) ) ( not ( = ?auto_18285 ?auto_18304 ) ) ( not ( = ?auto_18286 ?auto_18293 ) ) ( not ( = ?auto_18286 ?auto_18304 ) ) ( not ( = ?auto_18287 ?auto_18293 ) ) ( not ( = ?auto_18287 ?auto_18304 ) ) ( not ( = ?auto_18288 ?auto_18293 ) ) ( not ( = ?auto_18288 ?auto_18304 ) ) ( not ( = ?auto_18289 ?auto_18293 ) ) ( not ( = ?auto_18289 ?auto_18304 ) ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18290 ?auto_18304 ) ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18304 ) ) ( not ( = ?auto_18293 ?auto_18321 ) ) ( not ( = ?auto_18293 ?auto_18316 ) ) ( not ( = ?auto_18293 ?auto_18308 ) ) ( not ( = ?auto_18293 ?auto_18328 ) ) ( not ( = ?auto_18293 ?auto_18315 ) ) ( not ( = ?auto_18293 ?auto_18317 ) ) ( not ( = ?auto_18293 ?auto_18323 ) ) ( not ( = ?auto_18293 ?auto_18305 ) ) ( not ( = ?auto_18293 ?auto_18306 ) ) ( not ( = ?auto_18293 ?auto_18311 ) ) ( not ( = ?auto_18304 ?auto_18321 ) ) ( not ( = ?auto_18304 ?auto_18316 ) ) ( not ( = ?auto_18304 ?auto_18308 ) ) ( not ( = ?auto_18304 ?auto_18328 ) ) ( not ( = ?auto_18304 ?auto_18315 ) ) ( not ( = ?auto_18304 ?auto_18317 ) ) ( not ( = ?auto_18304 ?auto_18323 ) ) ( not ( = ?auto_18304 ?auto_18305 ) ) ( not ( = ?auto_18304 ?auto_18306 ) ) ( not ( = ?auto_18304 ?auto_18311 ) ) ( not ( = ?auto_18282 ?auto_18294 ) ) ( not ( = ?auto_18282 ?auto_18300 ) ) ( not ( = ?auto_18283 ?auto_18294 ) ) ( not ( = ?auto_18283 ?auto_18300 ) ) ( not ( = ?auto_18284 ?auto_18294 ) ) ( not ( = ?auto_18284 ?auto_18300 ) ) ( not ( = ?auto_18285 ?auto_18294 ) ) ( not ( = ?auto_18285 ?auto_18300 ) ) ( not ( = ?auto_18286 ?auto_18294 ) ) ( not ( = ?auto_18286 ?auto_18300 ) ) ( not ( = ?auto_18287 ?auto_18294 ) ) ( not ( = ?auto_18287 ?auto_18300 ) ) ( not ( = ?auto_18288 ?auto_18294 ) ) ( not ( = ?auto_18288 ?auto_18300 ) ) ( not ( = ?auto_18289 ?auto_18294 ) ) ( not ( = ?auto_18289 ?auto_18300 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) ( not ( = ?auto_18290 ?auto_18300 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18300 ) ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18292 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18304 ) ) ( not ( = ?auto_18294 ?auto_18321 ) ) ( not ( = ?auto_18294 ?auto_18316 ) ) ( not ( = ?auto_18294 ?auto_18308 ) ) ( not ( = ?auto_18294 ?auto_18328 ) ) ( not ( = ?auto_18294 ?auto_18315 ) ) ( not ( = ?auto_18294 ?auto_18317 ) ) ( not ( = ?auto_18294 ?auto_18323 ) ) ( not ( = ?auto_18294 ?auto_18305 ) ) ( not ( = ?auto_18294 ?auto_18306 ) ) ( not ( = ?auto_18294 ?auto_18311 ) ) ( not ( = ?auto_18296 ?auto_18302 ) ) ( not ( = ?auto_18296 ?auto_18325 ) ) ( not ( = ?auto_18296 ?auto_18301 ) ) ( not ( = ?auto_18296 ?auto_18313 ) ) ( not ( = ?auto_18296 ?auto_18314 ) ) ( not ( = ?auto_18296 ?auto_18329 ) ) ( not ( = ?auto_18296 ?auto_18309 ) ) ( not ( = ?auto_18296 ?auto_18310 ) ) ( not ( = ?auto_18296 ?auto_18303 ) ) ( not ( = ?auto_18298 ?auto_18307 ) ) ( not ( = ?auto_18298 ?auto_18324 ) ) ( not ( = ?auto_18298 ?auto_18312 ) ) ( not ( = ?auto_18298 ?auto_18319 ) ) ( not ( = ?auto_18298 ?auto_18320 ) ) ( not ( = ?auto_18298 ?auto_18318 ) ) ( not ( = ?auto_18298 ?auto_18322 ) ) ( not ( = ?auto_18298 ?auto_18327 ) ) ( not ( = ?auto_18298 ?auto_18326 ) ) ( not ( = ?auto_18300 ?auto_18304 ) ) ( not ( = ?auto_18300 ?auto_18321 ) ) ( not ( = ?auto_18300 ?auto_18316 ) ) ( not ( = ?auto_18300 ?auto_18308 ) ) ( not ( = ?auto_18300 ?auto_18328 ) ) ( not ( = ?auto_18300 ?auto_18315 ) ) ( not ( = ?auto_18300 ?auto_18317 ) ) ( not ( = ?auto_18300 ?auto_18323 ) ) ( not ( = ?auto_18300 ?auto_18305 ) ) ( not ( = ?auto_18300 ?auto_18306 ) ) ( not ( = ?auto_18300 ?auto_18311 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ?auto_18288 ?auto_18289 ?auto_18290 ?auto_18291 ?auto_18292 ?auto_18293 )
      ( MAKE-1CRATE ?auto_18293 ?auto_18294 )
      ( MAKE-12CRATE-VERIFY ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ?auto_18288 ?auto_18289 ?auto_18290 ?auto_18291 ?auto_18292 ?auto_18293 ?auto_18294 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_18354 - SURFACE
      ?auto_18355 - SURFACE
      ?auto_18356 - SURFACE
      ?auto_18357 - SURFACE
      ?auto_18358 - SURFACE
      ?auto_18359 - SURFACE
      ?auto_18360 - SURFACE
      ?auto_18361 - SURFACE
      ?auto_18362 - SURFACE
      ?auto_18363 - SURFACE
      ?auto_18364 - SURFACE
      ?auto_18365 - SURFACE
      ?auto_18366 - SURFACE
      ?auto_18367 - SURFACE
    )
    :vars
    (
      ?auto_18368 - HOIST
      ?auto_18369 - PLACE
      ?auto_18371 - PLACE
      ?auto_18373 - HOIST
      ?auto_18372 - SURFACE
      ?auto_18390 - SURFACE
      ?auto_18374 - PLACE
      ?auto_18375 - HOIST
      ?auto_18398 - SURFACE
      ?auto_18389 - PLACE
      ?auto_18384 - HOIST
      ?auto_18402 - SURFACE
      ?auto_18388 - PLACE
      ?auto_18379 - HOIST
      ?auto_18401 - SURFACE
      ?auto_18403 - PLACE
      ?auto_18380 - HOIST
      ?auto_18395 - SURFACE
      ?auto_18376 - SURFACE
      ?auto_18393 - PLACE
      ?auto_18382 - HOIST
      ?auto_18397 - SURFACE
      ?auto_18378 - PLACE
      ?auto_18396 - HOIST
      ?auto_18394 - SURFACE
      ?auto_18400 - PLACE
      ?auto_18387 - HOIST
      ?auto_18381 - SURFACE
      ?auto_18392 - SURFACE
      ?auto_18386 - PLACE
      ?auto_18383 - HOIST
      ?auto_18385 - SURFACE
      ?auto_18399 - PLACE
      ?auto_18377 - HOIST
      ?auto_18391 - SURFACE
      ?auto_18370 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18368 ?auto_18369 ) ( IS-CRATE ?auto_18367 ) ( not ( = ?auto_18371 ?auto_18369 ) ) ( HOIST-AT ?auto_18373 ?auto_18371 ) ( SURFACE-AT ?auto_18367 ?auto_18371 ) ( ON ?auto_18367 ?auto_18372 ) ( CLEAR ?auto_18367 ) ( not ( = ?auto_18366 ?auto_18367 ) ) ( not ( = ?auto_18366 ?auto_18372 ) ) ( not ( = ?auto_18367 ?auto_18372 ) ) ( not ( = ?auto_18368 ?auto_18373 ) ) ( IS-CRATE ?auto_18366 ) ( AVAILABLE ?auto_18373 ) ( SURFACE-AT ?auto_18366 ?auto_18371 ) ( ON ?auto_18366 ?auto_18390 ) ( CLEAR ?auto_18366 ) ( not ( = ?auto_18365 ?auto_18366 ) ) ( not ( = ?auto_18365 ?auto_18390 ) ) ( not ( = ?auto_18366 ?auto_18390 ) ) ( IS-CRATE ?auto_18365 ) ( not ( = ?auto_18374 ?auto_18369 ) ) ( HOIST-AT ?auto_18375 ?auto_18374 ) ( SURFACE-AT ?auto_18365 ?auto_18374 ) ( ON ?auto_18365 ?auto_18398 ) ( CLEAR ?auto_18365 ) ( not ( = ?auto_18364 ?auto_18365 ) ) ( not ( = ?auto_18364 ?auto_18398 ) ) ( not ( = ?auto_18365 ?auto_18398 ) ) ( not ( = ?auto_18368 ?auto_18375 ) ) ( IS-CRATE ?auto_18364 ) ( not ( = ?auto_18389 ?auto_18369 ) ) ( HOIST-AT ?auto_18384 ?auto_18389 ) ( AVAILABLE ?auto_18384 ) ( SURFACE-AT ?auto_18364 ?auto_18389 ) ( ON ?auto_18364 ?auto_18402 ) ( CLEAR ?auto_18364 ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18402 ) ) ( not ( = ?auto_18364 ?auto_18402 ) ) ( not ( = ?auto_18368 ?auto_18384 ) ) ( IS-CRATE ?auto_18363 ) ( not ( = ?auto_18388 ?auto_18369 ) ) ( HOIST-AT ?auto_18379 ?auto_18388 ) ( AVAILABLE ?auto_18379 ) ( SURFACE-AT ?auto_18363 ?auto_18388 ) ( ON ?auto_18363 ?auto_18401 ) ( CLEAR ?auto_18363 ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18401 ) ) ( not ( = ?auto_18363 ?auto_18401 ) ) ( not ( = ?auto_18368 ?auto_18379 ) ) ( IS-CRATE ?auto_18362 ) ( not ( = ?auto_18403 ?auto_18369 ) ) ( HOIST-AT ?auto_18380 ?auto_18403 ) ( SURFACE-AT ?auto_18362 ?auto_18403 ) ( ON ?auto_18362 ?auto_18395 ) ( CLEAR ?auto_18362 ) ( not ( = ?auto_18361 ?auto_18362 ) ) ( not ( = ?auto_18361 ?auto_18395 ) ) ( not ( = ?auto_18362 ?auto_18395 ) ) ( not ( = ?auto_18368 ?auto_18380 ) ) ( IS-CRATE ?auto_18361 ) ( AVAILABLE ?auto_18380 ) ( SURFACE-AT ?auto_18361 ?auto_18403 ) ( ON ?auto_18361 ?auto_18376 ) ( CLEAR ?auto_18361 ) ( not ( = ?auto_18360 ?auto_18361 ) ) ( not ( = ?auto_18360 ?auto_18376 ) ) ( not ( = ?auto_18361 ?auto_18376 ) ) ( IS-CRATE ?auto_18360 ) ( not ( = ?auto_18393 ?auto_18369 ) ) ( HOIST-AT ?auto_18382 ?auto_18393 ) ( AVAILABLE ?auto_18382 ) ( SURFACE-AT ?auto_18360 ?auto_18393 ) ( ON ?auto_18360 ?auto_18397 ) ( CLEAR ?auto_18360 ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18397 ) ) ( not ( = ?auto_18360 ?auto_18397 ) ) ( not ( = ?auto_18368 ?auto_18382 ) ) ( IS-CRATE ?auto_18359 ) ( not ( = ?auto_18378 ?auto_18369 ) ) ( HOIST-AT ?auto_18396 ?auto_18378 ) ( AVAILABLE ?auto_18396 ) ( SURFACE-AT ?auto_18359 ?auto_18378 ) ( ON ?auto_18359 ?auto_18394 ) ( CLEAR ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18358 ?auto_18394 ) ) ( not ( = ?auto_18359 ?auto_18394 ) ) ( not ( = ?auto_18368 ?auto_18396 ) ) ( IS-CRATE ?auto_18358 ) ( not ( = ?auto_18400 ?auto_18369 ) ) ( HOIST-AT ?auto_18387 ?auto_18400 ) ( AVAILABLE ?auto_18387 ) ( SURFACE-AT ?auto_18358 ?auto_18400 ) ( ON ?auto_18358 ?auto_18381 ) ( CLEAR ?auto_18358 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18381 ) ) ( not ( = ?auto_18358 ?auto_18381 ) ) ( not ( = ?auto_18368 ?auto_18387 ) ) ( IS-CRATE ?auto_18357 ) ( AVAILABLE ?auto_18375 ) ( SURFACE-AT ?auto_18357 ?auto_18374 ) ( ON ?auto_18357 ?auto_18392 ) ( CLEAR ?auto_18357 ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18356 ?auto_18392 ) ) ( not ( = ?auto_18357 ?auto_18392 ) ) ( IS-CRATE ?auto_18356 ) ( not ( = ?auto_18386 ?auto_18369 ) ) ( HOIST-AT ?auto_18383 ?auto_18386 ) ( AVAILABLE ?auto_18383 ) ( SURFACE-AT ?auto_18356 ?auto_18386 ) ( ON ?auto_18356 ?auto_18385 ) ( CLEAR ?auto_18356 ) ( not ( = ?auto_18355 ?auto_18356 ) ) ( not ( = ?auto_18355 ?auto_18385 ) ) ( not ( = ?auto_18356 ?auto_18385 ) ) ( not ( = ?auto_18368 ?auto_18383 ) ) ( SURFACE-AT ?auto_18354 ?auto_18369 ) ( CLEAR ?auto_18354 ) ( IS-CRATE ?auto_18355 ) ( AVAILABLE ?auto_18368 ) ( not ( = ?auto_18399 ?auto_18369 ) ) ( HOIST-AT ?auto_18377 ?auto_18399 ) ( AVAILABLE ?auto_18377 ) ( SURFACE-AT ?auto_18355 ?auto_18399 ) ( ON ?auto_18355 ?auto_18391 ) ( CLEAR ?auto_18355 ) ( TRUCK-AT ?auto_18370 ?auto_18369 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18354 ?auto_18391 ) ) ( not ( = ?auto_18355 ?auto_18391 ) ) ( not ( = ?auto_18368 ?auto_18377 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18354 ?auto_18385 ) ) ( not ( = ?auto_18356 ?auto_18391 ) ) ( not ( = ?auto_18386 ?auto_18399 ) ) ( not ( = ?auto_18383 ?auto_18377 ) ) ( not ( = ?auto_18385 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18354 ?auto_18392 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18392 ) ) ( not ( = ?auto_18357 ?auto_18385 ) ) ( not ( = ?auto_18357 ?auto_18391 ) ) ( not ( = ?auto_18374 ?auto_18386 ) ) ( not ( = ?auto_18374 ?auto_18399 ) ) ( not ( = ?auto_18375 ?auto_18383 ) ) ( not ( = ?auto_18375 ?auto_18377 ) ) ( not ( = ?auto_18392 ?auto_18385 ) ) ( not ( = ?auto_18392 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18358 ) ) ( not ( = ?auto_18354 ?auto_18381 ) ) ( not ( = ?auto_18355 ?auto_18358 ) ) ( not ( = ?auto_18355 ?auto_18381 ) ) ( not ( = ?auto_18356 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18381 ) ) ( not ( = ?auto_18358 ?auto_18392 ) ) ( not ( = ?auto_18358 ?auto_18385 ) ) ( not ( = ?auto_18358 ?auto_18391 ) ) ( not ( = ?auto_18400 ?auto_18374 ) ) ( not ( = ?auto_18400 ?auto_18386 ) ) ( not ( = ?auto_18400 ?auto_18399 ) ) ( not ( = ?auto_18387 ?auto_18375 ) ) ( not ( = ?auto_18387 ?auto_18383 ) ) ( not ( = ?auto_18387 ?auto_18377 ) ) ( not ( = ?auto_18381 ?auto_18392 ) ) ( not ( = ?auto_18381 ?auto_18385 ) ) ( not ( = ?auto_18381 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18354 ?auto_18394 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18394 ) ) ( not ( = ?auto_18356 ?auto_18359 ) ) ( not ( = ?auto_18356 ?auto_18394 ) ) ( not ( = ?auto_18357 ?auto_18359 ) ) ( not ( = ?auto_18357 ?auto_18394 ) ) ( not ( = ?auto_18359 ?auto_18381 ) ) ( not ( = ?auto_18359 ?auto_18392 ) ) ( not ( = ?auto_18359 ?auto_18385 ) ) ( not ( = ?auto_18359 ?auto_18391 ) ) ( not ( = ?auto_18378 ?auto_18400 ) ) ( not ( = ?auto_18378 ?auto_18374 ) ) ( not ( = ?auto_18378 ?auto_18386 ) ) ( not ( = ?auto_18378 ?auto_18399 ) ) ( not ( = ?auto_18396 ?auto_18387 ) ) ( not ( = ?auto_18396 ?auto_18375 ) ) ( not ( = ?auto_18396 ?auto_18383 ) ) ( not ( = ?auto_18396 ?auto_18377 ) ) ( not ( = ?auto_18394 ?auto_18381 ) ) ( not ( = ?auto_18394 ?auto_18392 ) ) ( not ( = ?auto_18394 ?auto_18385 ) ) ( not ( = ?auto_18394 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18360 ) ) ( not ( = ?auto_18354 ?auto_18397 ) ) ( not ( = ?auto_18355 ?auto_18360 ) ) ( not ( = ?auto_18355 ?auto_18397 ) ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18356 ?auto_18397 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( not ( = ?auto_18357 ?auto_18397 ) ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18358 ?auto_18397 ) ) ( not ( = ?auto_18360 ?auto_18394 ) ) ( not ( = ?auto_18360 ?auto_18381 ) ) ( not ( = ?auto_18360 ?auto_18392 ) ) ( not ( = ?auto_18360 ?auto_18385 ) ) ( not ( = ?auto_18360 ?auto_18391 ) ) ( not ( = ?auto_18393 ?auto_18378 ) ) ( not ( = ?auto_18393 ?auto_18400 ) ) ( not ( = ?auto_18393 ?auto_18374 ) ) ( not ( = ?auto_18393 ?auto_18386 ) ) ( not ( = ?auto_18393 ?auto_18399 ) ) ( not ( = ?auto_18382 ?auto_18396 ) ) ( not ( = ?auto_18382 ?auto_18387 ) ) ( not ( = ?auto_18382 ?auto_18375 ) ) ( not ( = ?auto_18382 ?auto_18383 ) ) ( not ( = ?auto_18382 ?auto_18377 ) ) ( not ( = ?auto_18397 ?auto_18394 ) ) ( not ( = ?auto_18397 ?auto_18381 ) ) ( not ( = ?auto_18397 ?auto_18392 ) ) ( not ( = ?auto_18397 ?auto_18385 ) ) ( not ( = ?auto_18397 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18361 ) ) ( not ( = ?auto_18354 ?auto_18376 ) ) ( not ( = ?auto_18355 ?auto_18361 ) ) ( not ( = ?auto_18355 ?auto_18376 ) ) ( not ( = ?auto_18356 ?auto_18361 ) ) ( not ( = ?auto_18356 ?auto_18376 ) ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18357 ?auto_18376 ) ) ( not ( = ?auto_18358 ?auto_18361 ) ) ( not ( = ?auto_18358 ?auto_18376 ) ) ( not ( = ?auto_18359 ?auto_18361 ) ) ( not ( = ?auto_18359 ?auto_18376 ) ) ( not ( = ?auto_18361 ?auto_18397 ) ) ( not ( = ?auto_18361 ?auto_18394 ) ) ( not ( = ?auto_18361 ?auto_18381 ) ) ( not ( = ?auto_18361 ?auto_18392 ) ) ( not ( = ?auto_18361 ?auto_18385 ) ) ( not ( = ?auto_18361 ?auto_18391 ) ) ( not ( = ?auto_18403 ?auto_18393 ) ) ( not ( = ?auto_18403 ?auto_18378 ) ) ( not ( = ?auto_18403 ?auto_18400 ) ) ( not ( = ?auto_18403 ?auto_18374 ) ) ( not ( = ?auto_18403 ?auto_18386 ) ) ( not ( = ?auto_18403 ?auto_18399 ) ) ( not ( = ?auto_18380 ?auto_18382 ) ) ( not ( = ?auto_18380 ?auto_18396 ) ) ( not ( = ?auto_18380 ?auto_18387 ) ) ( not ( = ?auto_18380 ?auto_18375 ) ) ( not ( = ?auto_18380 ?auto_18383 ) ) ( not ( = ?auto_18380 ?auto_18377 ) ) ( not ( = ?auto_18376 ?auto_18397 ) ) ( not ( = ?auto_18376 ?auto_18394 ) ) ( not ( = ?auto_18376 ?auto_18381 ) ) ( not ( = ?auto_18376 ?auto_18392 ) ) ( not ( = ?auto_18376 ?auto_18385 ) ) ( not ( = ?auto_18376 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18395 ) ) ( not ( = ?auto_18355 ?auto_18362 ) ) ( not ( = ?auto_18355 ?auto_18395 ) ) ( not ( = ?auto_18356 ?auto_18362 ) ) ( not ( = ?auto_18356 ?auto_18395 ) ) ( not ( = ?auto_18357 ?auto_18362 ) ) ( not ( = ?auto_18357 ?auto_18395 ) ) ( not ( = ?auto_18358 ?auto_18362 ) ) ( not ( = ?auto_18358 ?auto_18395 ) ) ( not ( = ?auto_18359 ?auto_18362 ) ) ( not ( = ?auto_18359 ?auto_18395 ) ) ( not ( = ?auto_18360 ?auto_18362 ) ) ( not ( = ?auto_18360 ?auto_18395 ) ) ( not ( = ?auto_18362 ?auto_18376 ) ) ( not ( = ?auto_18362 ?auto_18397 ) ) ( not ( = ?auto_18362 ?auto_18394 ) ) ( not ( = ?auto_18362 ?auto_18381 ) ) ( not ( = ?auto_18362 ?auto_18392 ) ) ( not ( = ?auto_18362 ?auto_18385 ) ) ( not ( = ?auto_18362 ?auto_18391 ) ) ( not ( = ?auto_18395 ?auto_18376 ) ) ( not ( = ?auto_18395 ?auto_18397 ) ) ( not ( = ?auto_18395 ?auto_18394 ) ) ( not ( = ?auto_18395 ?auto_18381 ) ) ( not ( = ?auto_18395 ?auto_18392 ) ) ( not ( = ?auto_18395 ?auto_18385 ) ) ( not ( = ?auto_18395 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18363 ) ) ( not ( = ?auto_18354 ?auto_18401 ) ) ( not ( = ?auto_18355 ?auto_18363 ) ) ( not ( = ?auto_18355 ?auto_18401 ) ) ( not ( = ?auto_18356 ?auto_18363 ) ) ( not ( = ?auto_18356 ?auto_18401 ) ) ( not ( = ?auto_18357 ?auto_18363 ) ) ( not ( = ?auto_18357 ?auto_18401 ) ) ( not ( = ?auto_18358 ?auto_18363 ) ) ( not ( = ?auto_18358 ?auto_18401 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18401 ) ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18401 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18401 ) ) ( not ( = ?auto_18363 ?auto_18395 ) ) ( not ( = ?auto_18363 ?auto_18376 ) ) ( not ( = ?auto_18363 ?auto_18397 ) ) ( not ( = ?auto_18363 ?auto_18394 ) ) ( not ( = ?auto_18363 ?auto_18381 ) ) ( not ( = ?auto_18363 ?auto_18392 ) ) ( not ( = ?auto_18363 ?auto_18385 ) ) ( not ( = ?auto_18363 ?auto_18391 ) ) ( not ( = ?auto_18388 ?auto_18403 ) ) ( not ( = ?auto_18388 ?auto_18393 ) ) ( not ( = ?auto_18388 ?auto_18378 ) ) ( not ( = ?auto_18388 ?auto_18400 ) ) ( not ( = ?auto_18388 ?auto_18374 ) ) ( not ( = ?auto_18388 ?auto_18386 ) ) ( not ( = ?auto_18388 ?auto_18399 ) ) ( not ( = ?auto_18379 ?auto_18380 ) ) ( not ( = ?auto_18379 ?auto_18382 ) ) ( not ( = ?auto_18379 ?auto_18396 ) ) ( not ( = ?auto_18379 ?auto_18387 ) ) ( not ( = ?auto_18379 ?auto_18375 ) ) ( not ( = ?auto_18379 ?auto_18383 ) ) ( not ( = ?auto_18379 ?auto_18377 ) ) ( not ( = ?auto_18401 ?auto_18395 ) ) ( not ( = ?auto_18401 ?auto_18376 ) ) ( not ( = ?auto_18401 ?auto_18397 ) ) ( not ( = ?auto_18401 ?auto_18394 ) ) ( not ( = ?auto_18401 ?auto_18381 ) ) ( not ( = ?auto_18401 ?auto_18392 ) ) ( not ( = ?auto_18401 ?auto_18385 ) ) ( not ( = ?auto_18401 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18364 ) ) ( not ( = ?auto_18354 ?auto_18402 ) ) ( not ( = ?auto_18355 ?auto_18364 ) ) ( not ( = ?auto_18355 ?auto_18402 ) ) ( not ( = ?auto_18356 ?auto_18364 ) ) ( not ( = ?auto_18356 ?auto_18402 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18402 ) ) ( not ( = ?auto_18358 ?auto_18364 ) ) ( not ( = ?auto_18358 ?auto_18402 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18402 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18402 ) ) ( not ( = ?auto_18361 ?auto_18364 ) ) ( not ( = ?auto_18361 ?auto_18402 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18402 ) ) ( not ( = ?auto_18364 ?auto_18401 ) ) ( not ( = ?auto_18364 ?auto_18395 ) ) ( not ( = ?auto_18364 ?auto_18376 ) ) ( not ( = ?auto_18364 ?auto_18397 ) ) ( not ( = ?auto_18364 ?auto_18394 ) ) ( not ( = ?auto_18364 ?auto_18381 ) ) ( not ( = ?auto_18364 ?auto_18392 ) ) ( not ( = ?auto_18364 ?auto_18385 ) ) ( not ( = ?auto_18364 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18388 ) ) ( not ( = ?auto_18389 ?auto_18403 ) ) ( not ( = ?auto_18389 ?auto_18393 ) ) ( not ( = ?auto_18389 ?auto_18378 ) ) ( not ( = ?auto_18389 ?auto_18400 ) ) ( not ( = ?auto_18389 ?auto_18374 ) ) ( not ( = ?auto_18389 ?auto_18386 ) ) ( not ( = ?auto_18389 ?auto_18399 ) ) ( not ( = ?auto_18384 ?auto_18379 ) ) ( not ( = ?auto_18384 ?auto_18380 ) ) ( not ( = ?auto_18384 ?auto_18382 ) ) ( not ( = ?auto_18384 ?auto_18396 ) ) ( not ( = ?auto_18384 ?auto_18387 ) ) ( not ( = ?auto_18384 ?auto_18375 ) ) ( not ( = ?auto_18384 ?auto_18383 ) ) ( not ( = ?auto_18384 ?auto_18377 ) ) ( not ( = ?auto_18402 ?auto_18401 ) ) ( not ( = ?auto_18402 ?auto_18395 ) ) ( not ( = ?auto_18402 ?auto_18376 ) ) ( not ( = ?auto_18402 ?auto_18397 ) ) ( not ( = ?auto_18402 ?auto_18394 ) ) ( not ( = ?auto_18402 ?auto_18381 ) ) ( not ( = ?auto_18402 ?auto_18392 ) ) ( not ( = ?auto_18402 ?auto_18385 ) ) ( not ( = ?auto_18402 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18365 ) ) ( not ( = ?auto_18354 ?auto_18398 ) ) ( not ( = ?auto_18355 ?auto_18365 ) ) ( not ( = ?auto_18355 ?auto_18398 ) ) ( not ( = ?auto_18356 ?auto_18365 ) ) ( not ( = ?auto_18356 ?auto_18398 ) ) ( not ( = ?auto_18357 ?auto_18365 ) ) ( not ( = ?auto_18357 ?auto_18398 ) ) ( not ( = ?auto_18358 ?auto_18365 ) ) ( not ( = ?auto_18358 ?auto_18398 ) ) ( not ( = ?auto_18359 ?auto_18365 ) ) ( not ( = ?auto_18359 ?auto_18398 ) ) ( not ( = ?auto_18360 ?auto_18365 ) ) ( not ( = ?auto_18360 ?auto_18398 ) ) ( not ( = ?auto_18361 ?auto_18365 ) ) ( not ( = ?auto_18361 ?auto_18398 ) ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18362 ?auto_18398 ) ) ( not ( = ?auto_18363 ?auto_18365 ) ) ( not ( = ?auto_18363 ?auto_18398 ) ) ( not ( = ?auto_18365 ?auto_18402 ) ) ( not ( = ?auto_18365 ?auto_18401 ) ) ( not ( = ?auto_18365 ?auto_18395 ) ) ( not ( = ?auto_18365 ?auto_18376 ) ) ( not ( = ?auto_18365 ?auto_18397 ) ) ( not ( = ?auto_18365 ?auto_18394 ) ) ( not ( = ?auto_18365 ?auto_18381 ) ) ( not ( = ?auto_18365 ?auto_18392 ) ) ( not ( = ?auto_18365 ?auto_18385 ) ) ( not ( = ?auto_18365 ?auto_18391 ) ) ( not ( = ?auto_18398 ?auto_18402 ) ) ( not ( = ?auto_18398 ?auto_18401 ) ) ( not ( = ?auto_18398 ?auto_18395 ) ) ( not ( = ?auto_18398 ?auto_18376 ) ) ( not ( = ?auto_18398 ?auto_18397 ) ) ( not ( = ?auto_18398 ?auto_18394 ) ) ( not ( = ?auto_18398 ?auto_18381 ) ) ( not ( = ?auto_18398 ?auto_18392 ) ) ( not ( = ?auto_18398 ?auto_18385 ) ) ( not ( = ?auto_18398 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18366 ) ) ( not ( = ?auto_18354 ?auto_18390 ) ) ( not ( = ?auto_18355 ?auto_18366 ) ) ( not ( = ?auto_18355 ?auto_18390 ) ) ( not ( = ?auto_18356 ?auto_18366 ) ) ( not ( = ?auto_18356 ?auto_18390 ) ) ( not ( = ?auto_18357 ?auto_18366 ) ) ( not ( = ?auto_18357 ?auto_18390 ) ) ( not ( = ?auto_18358 ?auto_18366 ) ) ( not ( = ?auto_18358 ?auto_18390 ) ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( not ( = ?auto_18359 ?auto_18390 ) ) ( not ( = ?auto_18360 ?auto_18366 ) ) ( not ( = ?auto_18360 ?auto_18390 ) ) ( not ( = ?auto_18361 ?auto_18366 ) ) ( not ( = ?auto_18361 ?auto_18390 ) ) ( not ( = ?auto_18362 ?auto_18366 ) ) ( not ( = ?auto_18362 ?auto_18390 ) ) ( not ( = ?auto_18363 ?auto_18366 ) ) ( not ( = ?auto_18363 ?auto_18390 ) ) ( not ( = ?auto_18364 ?auto_18366 ) ) ( not ( = ?auto_18364 ?auto_18390 ) ) ( not ( = ?auto_18366 ?auto_18398 ) ) ( not ( = ?auto_18366 ?auto_18402 ) ) ( not ( = ?auto_18366 ?auto_18401 ) ) ( not ( = ?auto_18366 ?auto_18395 ) ) ( not ( = ?auto_18366 ?auto_18376 ) ) ( not ( = ?auto_18366 ?auto_18397 ) ) ( not ( = ?auto_18366 ?auto_18394 ) ) ( not ( = ?auto_18366 ?auto_18381 ) ) ( not ( = ?auto_18366 ?auto_18392 ) ) ( not ( = ?auto_18366 ?auto_18385 ) ) ( not ( = ?auto_18366 ?auto_18391 ) ) ( not ( = ?auto_18371 ?auto_18374 ) ) ( not ( = ?auto_18371 ?auto_18389 ) ) ( not ( = ?auto_18371 ?auto_18388 ) ) ( not ( = ?auto_18371 ?auto_18403 ) ) ( not ( = ?auto_18371 ?auto_18393 ) ) ( not ( = ?auto_18371 ?auto_18378 ) ) ( not ( = ?auto_18371 ?auto_18400 ) ) ( not ( = ?auto_18371 ?auto_18386 ) ) ( not ( = ?auto_18371 ?auto_18399 ) ) ( not ( = ?auto_18373 ?auto_18375 ) ) ( not ( = ?auto_18373 ?auto_18384 ) ) ( not ( = ?auto_18373 ?auto_18379 ) ) ( not ( = ?auto_18373 ?auto_18380 ) ) ( not ( = ?auto_18373 ?auto_18382 ) ) ( not ( = ?auto_18373 ?auto_18396 ) ) ( not ( = ?auto_18373 ?auto_18387 ) ) ( not ( = ?auto_18373 ?auto_18383 ) ) ( not ( = ?auto_18373 ?auto_18377 ) ) ( not ( = ?auto_18390 ?auto_18398 ) ) ( not ( = ?auto_18390 ?auto_18402 ) ) ( not ( = ?auto_18390 ?auto_18401 ) ) ( not ( = ?auto_18390 ?auto_18395 ) ) ( not ( = ?auto_18390 ?auto_18376 ) ) ( not ( = ?auto_18390 ?auto_18397 ) ) ( not ( = ?auto_18390 ?auto_18394 ) ) ( not ( = ?auto_18390 ?auto_18381 ) ) ( not ( = ?auto_18390 ?auto_18392 ) ) ( not ( = ?auto_18390 ?auto_18385 ) ) ( not ( = ?auto_18390 ?auto_18391 ) ) ( not ( = ?auto_18354 ?auto_18367 ) ) ( not ( = ?auto_18354 ?auto_18372 ) ) ( not ( = ?auto_18355 ?auto_18367 ) ) ( not ( = ?auto_18355 ?auto_18372 ) ) ( not ( = ?auto_18356 ?auto_18367 ) ) ( not ( = ?auto_18356 ?auto_18372 ) ) ( not ( = ?auto_18357 ?auto_18367 ) ) ( not ( = ?auto_18357 ?auto_18372 ) ) ( not ( = ?auto_18358 ?auto_18367 ) ) ( not ( = ?auto_18358 ?auto_18372 ) ) ( not ( = ?auto_18359 ?auto_18367 ) ) ( not ( = ?auto_18359 ?auto_18372 ) ) ( not ( = ?auto_18360 ?auto_18367 ) ) ( not ( = ?auto_18360 ?auto_18372 ) ) ( not ( = ?auto_18361 ?auto_18367 ) ) ( not ( = ?auto_18361 ?auto_18372 ) ) ( not ( = ?auto_18362 ?auto_18367 ) ) ( not ( = ?auto_18362 ?auto_18372 ) ) ( not ( = ?auto_18363 ?auto_18367 ) ) ( not ( = ?auto_18363 ?auto_18372 ) ) ( not ( = ?auto_18364 ?auto_18367 ) ) ( not ( = ?auto_18364 ?auto_18372 ) ) ( not ( = ?auto_18365 ?auto_18367 ) ) ( not ( = ?auto_18365 ?auto_18372 ) ) ( not ( = ?auto_18367 ?auto_18390 ) ) ( not ( = ?auto_18367 ?auto_18398 ) ) ( not ( = ?auto_18367 ?auto_18402 ) ) ( not ( = ?auto_18367 ?auto_18401 ) ) ( not ( = ?auto_18367 ?auto_18395 ) ) ( not ( = ?auto_18367 ?auto_18376 ) ) ( not ( = ?auto_18367 ?auto_18397 ) ) ( not ( = ?auto_18367 ?auto_18394 ) ) ( not ( = ?auto_18367 ?auto_18381 ) ) ( not ( = ?auto_18367 ?auto_18392 ) ) ( not ( = ?auto_18367 ?auto_18385 ) ) ( not ( = ?auto_18367 ?auto_18391 ) ) ( not ( = ?auto_18372 ?auto_18390 ) ) ( not ( = ?auto_18372 ?auto_18398 ) ) ( not ( = ?auto_18372 ?auto_18402 ) ) ( not ( = ?auto_18372 ?auto_18401 ) ) ( not ( = ?auto_18372 ?auto_18395 ) ) ( not ( = ?auto_18372 ?auto_18376 ) ) ( not ( = ?auto_18372 ?auto_18397 ) ) ( not ( = ?auto_18372 ?auto_18394 ) ) ( not ( = ?auto_18372 ?auto_18381 ) ) ( not ( = ?auto_18372 ?auto_18392 ) ) ( not ( = ?auto_18372 ?auto_18385 ) ) ( not ( = ?auto_18372 ?auto_18391 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18360 ?auto_18361 ?auto_18362 ?auto_18363 ?auto_18364 ?auto_18365 ?auto_18366 )
      ( MAKE-1CRATE ?auto_18366 ?auto_18367 )
      ( MAKE-13CRATE-VERIFY ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18360 ?auto_18361 ?auto_18362 ?auto_18363 ?auto_18364 ?auto_18365 ?auto_18366 ?auto_18367 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_18429 - SURFACE
      ?auto_18430 - SURFACE
      ?auto_18431 - SURFACE
      ?auto_18432 - SURFACE
      ?auto_18433 - SURFACE
      ?auto_18434 - SURFACE
      ?auto_18435 - SURFACE
      ?auto_18436 - SURFACE
      ?auto_18437 - SURFACE
      ?auto_18438 - SURFACE
      ?auto_18439 - SURFACE
      ?auto_18440 - SURFACE
      ?auto_18441 - SURFACE
      ?auto_18442 - SURFACE
      ?auto_18443 - SURFACE
    )
    :vars
    (
      ?auto_18448 - HOIST
      ?auto_18446 - PLACE
      ?auto_18447 - PLACE
      ?auto_18444 - HOIST
      ?auto_18445 - SURFACE
      ?auto_18452 - PLACE
      ?auto_18470 - HOIST
      ?auto_18476 - SURFACE
      ?auto_18460 - SURFACE
      ?auto_18482 - PLACE
      ?auto_18468 - HOIST
      ?auto_18456 - SURFACE
      ?auto_18462 - PLACE
      ?auto_18471 - HOIST
      ?auto_18479 - SURFACE
      ?auto_18464 - PLACE
      ?auto_18463 - HOIST
      ?auto_18450 - SURFACE
      ?auto_18465 - PLACE
      ?auto_18457 - HOIST
      ?auto_18458 - SURFACE
      ?auto_18466 - SURFACE
      ?auto_18475 - PLACE
      ?auto_18481 - HOIST
      ?auto_18474 - SURFACE
      ?auto_18469 - PLACE
      ?auto_18480 - HOIST
      ?auto_18455 - SURFACE
      ?auto_18478 - PLACE
      ?auto_18453 - HOIST
      ?auto_18454 - SURFACE
      ?auto_18459 - SURFACE
      ?auto_18461 - PLACE
      ?auto_18477 - HOIST
      ?auto_18451 - SURFACE
      ?auto_18472 - PLACE
      ?auto_18467 - HOIST
      ?auto_18473 - SURFACE
      ?auto_18449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18448 ?auto_18446 ) ( IS-CRATE ?auto_18443 ) ( not ( = ?auto_18447 ?auto_18446 ) ) ( HOIST-AT ?auto_18444 ?auto_18447 ) ( AVAILABLE ?auto_18444 ) ( SURFACE-AT ?auto_18443 ?auto_18447 ) ( ON ?auto_18443 ?auto_18445 ) ( CLEAR ?auto_18443 ) ( not ( = ?auto_18442 ?auto_18443 ) ) ( not ( = ?auto_18442 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18445 ) ) ( not ( = ?auto_18448 ?auto_18444 ) ) ( IS-CRATE ?auto_18442 ) ( not ( = ?auto_18452 ?auto_18446 ) ) ( HOIST-AT ?auto_18470 ?auto_18452 ) ( SURFACE-AT ?auto_18442 ?auto_18452 ) ( ON ?auto_18442 ?auto_18476 ) ( CLEAR ?auto_18442 ) ( not ( = ?auto_18441 ?auto_18442 ) ) ( not ( = ?auto_18441 ?auto_18476 ) ) ( not ( = ?auto_18442 ?auto_18476 ) ) ( not ( = ?auto_18448 ?auto_18470 ) ) ( IS-CRATE ?auto_18441 ) ( AVAILABLE ?auto_18470 ) ( SURFACE-AT ?auto_18441 ?auto_18452 ) ( ON ?auto_18441 ?auto_18460 ) ( CLEAR ?auto_18441 ) ( not ( = ?auto_18440 ?auto_18441 ) ) ( not ( = ?auto_18440 ?auto_18460 ) ) ( not ( = ?auto_18441 ?auto_18460 ) ) ( IS-CRATE ?auto_18440 ) ( not ( = ?auto_18482 ?auto_18446 ) ) ( HOIST-AT ?auto_18468 ?auto_18482 ) ( SURFACE-AT ?auto_18440 ?auto_18482 ) ( ON ?auto_18440 ?auto_18456 ) ( CLEAR ?auto_18440 ) ( not ( = ?auto_18439 ?auto_18440 ) ) ( not ( = ?auto_18439 ?auto_18456 ) ) ( not ( = ?auto_18440 ?auto_18456 ) ) ( not ( = ?auto_18448 ?auto_18468 ) ) ( IS-CRATE ?auto_18439 ) ( not ( = ?auto_18462 ?auto_18446 ) ) ( HOIST-AT ?auto_18471 ?auto_18462 ) ( AVAILABLE ?auto_18471 ) ( SURFACE-AT ?auto_18439 ?auto_18462 ) ( ON ?auto_18439 ?auto_18479 ) ( CLEAR ?auto_18439 ) ( not ( = ?auto_18438 ?auto_18439 ) ) ( not ( = ?auto_18438 ?auto_18479 ) ) ( not ( = ?auto_18439 ?auto_18479 ) ) ( not ( = ?auto_18448 ?auto_18471 ) ) ( IS-CRATE ?auto_18438 ) ( not ( = ?auto_18464 ?auto_18446 ) ) ( HOIST-AT ?auto_18463 ?auto_18464 ) ( AVAILABLE ?auto_18463 ) ( SURFACE-AT ?auto_18438 ?auto_18464 ) ( ON ?auto_18438 ?auto_18450 ) ( CLEAR ?auto_18438 ) ( not ( = ?auto_18437 ?auto_18438 ) ) ( not ( = ?auto_18437 ?auto_18450 ) ) ( not ( = ?auto_18438 ?auto_18450 ) ) ( not ( = ?auto_18448 ?auto_18463 ) ) ( IS-CRATE ?auto_18437 ) ( not ( = ?auto_18465 ?auto_18446 ) ) ( HOIST-AT ?auto_18457 ?auto_18465 ) ( SURFACE-AT ?auto_18437 ?auto_18465 ) ( ON ?auto_18437 ?auto_18458 ) ( CLEAR ?auto_18437 ) ( not ( = ?auto_18436 ?auto_18437 ) ) ( not ( = ?auto_18436 ?auto_18458 ) ) ( not ( = ?auto_18437 ?auto_18458 ) ) ( not ( = ?auto_18448 ?auto_18457 ) ) ( IS-CRATE ?auto_18436 ) ( AVAILABLE ?auto_18457 ) ( SURFACE-AT ?auto_18436 ?auto_18465 ) ( ON ?auto_18436 ?auto_18466 ) ( CLEAR ?auto_18436 ) ( not ( = ?auto_18435 ?auto_18436 ) ) ( not ( = ?auto_18435 ?auto_18466 ) ) ( not ( = ?auto_18436 ?auto_18466 ) ) ( IS-CRATE ?auto_18435 ) ( not ( = ?auto_18475 ?auto_18446 ) ) ( HOIST-AT ?auto_18481 ?auto_18475 ) ( AVAILABLE ?auto_18481 ) ( SURFACE-AT ?auto_18435 ?auto_18475 ) ( ON ?auto_18435 ?auto_18474 ) ( CLEAR ?auto_18435 ) ( not ( = ?auto_18434 ?auto_18435 ) ) ( not ( = ?auto_18434 ?auto_18474 ) ) ( not ( = ?auto_18435 ?auto_18474 ) ) ( not ( = ?auto_18448 ?auto_18481 ) ) ( IS-CRATE ?auto_18434 ) ( not ( = ?auto_18469 ?auto_18446 ) ) ( HOIST-AT ?auto_18480 ?auto_18469 ) ( AVAILABLE ?auto_18480 ) ( SURFACE-AT ?auto_18434 ?auto_18469 ) ( ON ?auto_18434 ?auto_18455 ) ( CLEAR ?auto_18434 ) ( not ( = ?auto_18433 ?auto_18434 ) ) ( not ( = ?auto_18433 ?auto_18455 ) ) ( not ( = ?auto_18434 ?auto_18455 ) ) ( not ( = ?auto_18448 ?auto_18480 ) ) ( IS-CRATE ?auto_18433 ) ( not ( = ?auto_18478 ?auto_18446 ) ) ( HOIST-AT ?auto_18453 ?auto_18478 ) ( AVAILABLE ?auto_18453 ) ( SURFACE-AT ?auto_18433 ?auto_18478 ) ( ON ?auto_18433 ?auto_18454 ) ( CLEAR ?auto_18433 ) ( not ( = ?auto_18432 ?auto_18433 ) ) ( not ( = ?auto_18432 ?auto_18454 ) ) ( not ( = ?auto_18433 ?auto_18454 ) ) ( not ( = ?auto_18448 ?auto_18453 ) ) ( IS-CRATE ?auto_18432 ) ( AVAILABLE ?auto_18468 ) ( SURFACE-AT ?auto_18432 ?auto_18482 ) ( ON ?auto_18432 ?auto_18459 ) ( CLEAR ?auto_18432 ) ( not ( = ?auto_18431 ?auto_18432 ) ) ( not ( = ?auto_18431 ?auto_18459 ) ) ( not ( = ?auto_18432 ?auto_18459 ) ) ( IS-CRATE ?auto_18431 ) ( not ( = ?auto_18461 ?auto_18446 ) ) ( HOIST-AT ?auto_18477 ?auto_18461 ) ( AVAILABLE ?auto_18477 ) ( SURFACE-AT ?auto_18431 ?auto_18461 ) ( ON ?auto_18431 ?auto_18451 ) ( CLEAR ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( not ( = ?auto_18430 ?auto_18451 ) ) ( not ( = ?auto_18431 ?auto_18451 ) ) ( not ( = ?auto_18448 ?auto_18477 ) ) ( SURFACE-AT ?auto_18429 ?auto_18446 ) ( CLEAR ?auto_18429 ) ( IS-CRATE ?auto_18430 ) ( AVAILABLE ?auto_18448 ) ( not ( = ?auto_18472 ?auto_18446 ) ) ( HOIST-AT ?auto_18467 ?auto_18472 ) ( AVAILABLE ?auto_18467 ) ( SURFACE-AT ?auto_18430 ?auto_18472 ) ( ON ?auto_18430 ?auto_18473 ) ( CLEAR ?auto_18430 ) ( TRUCK-AT ?auto_18449 ?auto_18446 ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18473 ) ) ( not ( = ?auto_18430 ?auto_18473 ) ) ( not ( = ?auto_18448 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18451 ) ) ( not ( = ?auto_18431 ?auto_18473 ) ) ( not ( = ?auto_18461 ?auto_18472 ) ) ( not ( = ?auto_18477 ?auto_18467 ) ) ( not ( = ?auto_18451 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18459 ) ) ( not ( = ?auto_18430 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18459 ) ) ( not ( = ?auto_18432 ?auto_18451 ) ) ( not ( = ?auto_18432 ?auto_18473 ) ) ( not ( = ?auto_18482 ?auto_18461 ) ) ( not ( = ?auto_18482 ?auto_18472 ) ) ( not ( = ?auto_18468 ?auto_18477 ) ) ( not ( = ?auto_18468 ?auto_18467 ) ) ( not ( = ?auto_18459 ?auto_18451 ) ) ( not ( = ?auto_18459 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18433 ) ) ( not ( = ?auto_18429 ?auto_18454 ) ) ( not ( = ?auto_18430 ?auto_18433 ) ) ( not ( = ?auto_18430 ?auto_18454 ) ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( not ( = ?auto_18431 ?auto_18454 ) ) ( not ( = ?auto_18433 ?auto_18459 ) ) ( not ( = ?auto_18433 ?auto_18451 ) ) ( not ( = ?auto_18433 ?auto_18473 ) ) ( not ( = ?auto_18478 ?auto_18482 ) ) ( not ( = ?auto_18478 ?auto_18461 ) ) ( not ( = ?auto_18478 ?auto_18472 ) ) ( not ( = ?auto_18453 ?auto_18468 ) ) ( not ( = ?auto_18453 ?auto_18477 ) ) ( not ( = ?auto_18453 ?auto_18467 ) ) ( not ( = ?auto_18454 ?auto_18459 ) ) ( not ( = ?auto_18454 ?auto_18451 ) ) ( not ( = ?auto_18454 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18434 ) ) ( not ( = ?auto_18429 ?auto_18455 ) ) ( not ( = ?auto_18430 ?auto_18434 ) ) ( not ( = ?auto_18430 ?auto_18455 ) ) ( not ( = ?auto_18431 ?auto_18434 ) ) ( not ( = ?auto_18431 ?auto_18455 ) ) ( not ( = ?auto_18432 ?auto_18434 ) ) ( not ( = ?auto_18432 ?auto_18455 ) ) ( not ( = ?auto_18434 ?auto_18454 ) ) ( not ( = ?auto_18434 ?auto_18459 ) ) ( not ( = ?auto_18434 ?auto_18451 ) ) ( not ( = ?auto_18434 ?auto_18473 ) ) ( not ( = ?auto_18469 ?auto_18478 ) ) ( not ( = ?auto_18469 ?auto_18482 ) ) ( not ( = ?auto_18469 ?auto_18461 ) ) ( not ( = ?auto_18469 ?auto_18472 ) ) ( not ( = ?auto_18480 ?auto_18453 ) ) ( not ( = ?auto_18480 ?auto_18468 ) ) ( not ( = ?auto_18480 ?auto_18477 ) ) ( not ( = ?auto_18480 ?auto_18467 ) ) ( not ( = ?auto_18455 ?auto_18454 ) ) ( not ( = ?auto_18455 ?auto_18459 ) ) ( not ( = ?auto_18455 ?auto_18451 ) ) ( not ( = ?auto_18455 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18435 ) ) ( not ( = ?auto_18429 ?auto_18474 ) ) ( not ( = ?auto_18430 ?auto_18435 ) ) ( not ( = ?auto_18430 ?auto_18474 ) ) ( not ( = ?auto_18431 ?auto_18435 ) ) ( not ( = ?auto_18431 ?auto_18474 ) ) ( not ( = ?auto_18432 ?auto_18435 ) ) ( not ( = ?auto_18432 ?auto_18474 ) ) ( not ( = ?auto_18433 ?auto_18435 ) ) ( not ( = ?auto_18433 ?auto_18474 ) ) ( not ( = ?auto_18435 ?auto_18455 ) ) ( not ( = ?auto_18435 ?auto_18454 ) ) ( not ( = ?auto_18435 ?auto_18459 ) ) ( not ( = ?auto_18435 ?auto_18451 ) ) ( not ( = ?auto_18435 ?auto_18473 ) ) ( not ( = ?auto_18475 ?auto_18469 ) ) ( not ( = ?auto_18475 ?auto_18478 ) ) ( not ( = ?auto_18475 ?auto_18482 ) ) ( not ( = ?auto_18475 ?auto_18461 ) ) ( not ( = ?auto_18475 ?auto_18472 ) ) ( not ( = ?auto_18481 ?auto_18480 ) ) ( not ( = ?auto_18481 ?auto_18453 ) ) ( not ( = ?auto_18481 ?auto_18468 ) ) ( not ( = ?auto_18481 ?auto_18477 ) ) ( not ( = ?auto_18481 ?auto_18467 ) ) ( not ( = ?auto_18474 ?auto_18455 ) ) ( not ( = ?auto_18474 ?auto_18454 ) ) ( not ( = ?auto_18474 ?auto_18459 ) ) ( not ( = ?auto_18474 ?auto_18451 ) ) ( not ( = ?auto_18474 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18436 ) ) ( not ( = ?auto_18429 ?auto_18466 ) ) ( not ( = ?auto_18430 ?auto_18436 ) ) ( not ( = ?auto_18430 ?auto_18466 ) ) ( not ( = ?auto_18431 ?auto_18436 ) ) ( not ( = ?auto_18431 ?auto_18466 ) ) ( not ( = ?auto_18432 ?auto_18436 ) ) ( not ( = ?auto_18432 ?auto_18466 ) ) ( not ( = ?auto_18433 ?auto_18436 ) ) ( not ( = ?auto_18433 ?auto_18466 ) ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( not ( = ?auto_18434 ?auto_18466 ) ) ( not ( = ?auto_18436 ?auto_18474 ) ) ( not ( = ?auto_18436 ?auto_18455 ) ) ( not ( = ?auto_18436 ?auto_18454 ) ) ( not ( = ?auto_18436 ?auto_18459 ) ) ( not ( = ?auto_18436 ?auto_18451 ) ) ( not ( = ?auto_18436 ?auto_18473 ) ) ( not ( = ?auto_18465 ?auto_18475 ) ) ( not ( = ?auto_18465 ?auto_18469 ) ) ( not ( = ?auto_18465 ?auto_18478 ) ) ( not ( = ?auto_18465 ?auto_18482 ) ) ( not ( = ?auto_18465 ?auto_18461 ) ) ( not ( = ?auto_18465 ?auto_18472 ) ) ( not ( = ?auto_18457 ?auto_18481 ) ) ( not ( = ?auto_18457 ?auto_18480 ) ) ( not ( = ?auto_18457 ?auto_18453 ) ) ( not ( = ?auto_18457 ?auto_18468 ) ) ( not ( = ?auto_18457 ?auto_18477 ) ) ( not ( = ?auto_18457 ?auto_18467 ) ) ( not ( = ?auto_18466 ?auto_18474 ) ) ( not ( = ?auto_18466 ?auto_18455 ) ) ( not ( = ?auto_18466 ?auto_18454 ) ) ( not ( = ?auto_18466 ?auto_18459 ) ) ( not ( = ?auto_18466 ?auto_18451 ) ) ( not ( = ?auto_18466 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18437 ) ) ( not ( = ?auto_18429 ?auto_18458 ) ) ( not ( = ?auto_18430 ?auto_18437 ) ) ( not ( = ?auto_18430 ?auto_18458 ) ) ( not ( = ?auto_18431 ?auto_18437 ) ) ( not ( = ?auto_18431 ?auto_18458 ) ) ( not ( = ?auto_18432 ?auto_18437 ) ) ( not ( = ?auto_18432 ?auto_18458 ) ) ( not ( = ?auto_18433 ?auto_18437 ) ) ( not ( = ?auto_18433 ?auto_18458 ) ) ( not ( = ?auto_18434 ?auto_18437 ) ) ( not ( = ?auto_18434 ?auto_18458 ) ) ( not ( = ?auto_18435 ?auto_18437 ) ) ( not ( = ?auto_18435 ?auto_18458 ) ) ( not ( = ?auto_18437 ?auto_18466 ) ) ( not ( = ?auto_18437 ?auto_18474 ) ) ( not ( = ?auto_18437 ?auto_18455 ) ) ( not ( = ?auto_18437 ?auto_18454 ) ) ( not ( = ?auto_18437 ?auto_18459 ) ) ( not ( = ?auto_18437 ?auto_18451 ) ) ( not ( = ?auto_18437 ?auto_18473 ) ) ( not ( = ?auto_18458 ?auto_18466 ) ) ( not ( = ?auto_18458 ?auto_18474 ) ) ( not ( = ?auto_18458 ?auto_18455 ) ) ( not ( = ?auto_18458 ?auto_18454 ) ) ( not ( = ?auto_18458 ?auto_18459 ) ) ( not ( = ?auto_18458 ?auto_18451 ) ) ( not ( = ?auto_18458 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18438 ) ) ( not ( = ?auto_18429 ?auto_18450 ) ) ( not ( = ?auto_18430 ?auto_18438 ) ) ( not ( = ?auto_18430 ?auto_18450 ) ) ( not ( = ?auto_18431 ?auto_18438 ) ) ( not ( = ?auto_18431 ?auto_18450 ) ) ( not ( = ?auto_18432 ?auto_18438 ) ) ( not ( = ?auto_18432 ?auto_18450 ) ) ( not ( = ?auto_18433 ?auto_18438 ) ) ( not ( = ?auto_18433 ?auto_18450 ) ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18434 ?auto_18450 ) ) ( not ( = ?auto_18435 ?auto_18438 ) ) ( not ( = ?auto_18435 ?auto_18450 ) ) ( not ( = ?auto_18436 ?auto_18438 ) ) ( not ( = ?auto_18436 ?auto_18450 ) ) ( not ( = ?auto_18438 ?auto_18458 ) ) ( not ( = ?auto_18438 ?auto_18466 ) ) ( not ( = ?auto_18438 ?auto_18474 ) ) ( not ( = ?auto_18438 ?auto_18455 ) ) ( not ( = ?auto_18438 ?auto_18454 ) ) ( not ( = ?auto_18438 ?auto_18459 ) ) ( not ( = ?auto_18438 ?auto_18451 ) ) ( not ( = ?auto_18438 ?auto_18473 ) ) ( not ( = ?auto_18464 ?auto_18465 ) ) ( not ( = ?auto_18464 ?auto_18475 ) ) ( not ( = ?auto_18464 ?auto_18469 ) ) ( not ( = ?auto_18464 ?auto_18478 ) ) ( not ( = ?auto_18464 ?auto_18482 ) ) ( not ( = ?auto_18464 ?auto_18461 ) ) ( not ( = ?auto_18464 ?auto_18472 ) ) ( not ( = ?auto_18463 ?auto_18457 ) ) ( not ( = ?auto_18463 ?auto_18481 ) ) ( not ( = ?auto_18463 ?auto_18480 ) ) ( not ( = ?auto_18463 ?auto_18453 ) ) ( not ( = ?auto_18463 ?auto_18468 ) ) ( not ( = ?auto_18463 ?auto_18477 ) ) ( not ( = ?auto_18463 ?auto_18467 ) ) ( not ( = ?auto_18450 ?auto_18458 ) ) ( not ( = ?auto_18450 ?auto_18466 ) ) ( not ( = ?auto_18450 ?auto_18474 ) ) ( not ( = ?auto_18450 ?auto_18455 ) ) ( not ( = ?auto_18450 ?auto_18454 ) ) ( not ( = ?auto_18450 ?auto_18459 ) ) ( not ( = ?auto_18450 ?auto_18451 ) ) ( not ( = ?auto_18450 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18439 ) ) ( not ( = ?auto_18429 ?auto_18479 ) ) ( not ( = ?auto_18430 ?auto_18439 ) ) ( not ( = ?auto_18430 ?auto_18479 ) ) ( not ( = ?auto_18431 ?auto_18439 ) ) ( not ( = ?auto_18431 ?auto_18479 ) ) ( not ( = ?auto_18432 ?auto_18439 ) ) ( not ( = ?auto_18432 ?auto_18479 ) ) ( not ( = ?auto_18433 ?auto_18439 ) ) ( not ( = ?auto_18433 ?auto_18479 ) ) ( not ( = ?auto_18434 ?auto_18439 ) ) ( not ( = ?auto_18434 ?auto_18479 ) ) ( not ( = ?auto_18435 ?auto_18439 ) ) ( not ( = ?auto_18435 ?auto_18479 ) ) ( not ( = ?auto_18436 ?auto_18439 ) ) ( not ( = ?auto_18436 ?auto_18479 ) ) ( not ( = ?auto_18437 ?auto_18439 ) ) ( not ( = ?auto_18437 ?auto_18479 ) ) ( not ( = ?auto_18439 ?auto_18450 ) ) ( not ( = ?auto_18439 ?auto_18458 ) ) ( not ( = ?auto_18439 ?auto_18466 ) ) ( not ( = ?auto_18439 ?auto_18474 ) ) ( not ( = ?auto_18439 ?auto_18455 ) ) ( not ( = ?auto_18439 ?auto_18454 ) ) ( not ( = ?auto_18439 ?auto_18459 ) ) ( not ( = ?auto_18439 ?auto_18451 ) ) ( not ( = ?auto_18439 ?auto_18473 ) ) ( not ( = ?auto_18462 ?auto_18464 ) ) ( not ( = ?auto_18462 ?auto_18465 ) ) ( not ( = ?auto_18462 ?auto_18475 ) ) ( not ( = ?auto_18462 ?auto_18469 ) ) ( not ( = ?auto_18462 ?auto_18478 ) ) ( not ( = ?auto_18462 ?auto_18482 ) ) ( not ( = ?auto_18462 ?auto_18461 ) ) ( not ( = ?auto_18462 ?auto_18472 ) ) ( not ( = ?auto_18471 ?auto_18463 ) ) ( not ( = ?auto_18471 ?auto_18457 ) ) ( not ( = ?auto_18471 ?auto_18481 ) ) ( not ( = ?auto_18471 ?auto_18480 ) ) ( not ( = ?auto_18471 ?auto_18453 ) ) ( not ( = ?auto_18471 ?auto_18468 ) ) ( not ( = ?auto_18471 ?auto_18477 ) ) ( not ( = ?auto_18471 ?auto_18467 ) ) ( not ( = ?auto_18479 ?auto_18450 ) ) ( not ( = ?auto_18479 ?auto_18458 ) ) ( not ( = ?auto_18479 ?auto_18466 ) ) ( not ( = ?auto_18479 ?auto_18474 ) ) ( not ( = ?auto_18479 ?auto_18455 ) ) ( not ( = ?auto_18479 ?auto_18454 ) ) ( not ( = ?auto_18479 ?auto_18459 ) ) ( not ( = ?auto_18479 ?auto_18451 ) ) ( not ( = ?auto_18479 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18440 ) ) ( not ( = ?auto_18429 ?auto_18456 ) ) ( not ( = ?auto_18430 ?auto_18440 ) ) ( not ( = ?auto_18430 ?auto_18456 ) ) ( not ( = ?auto_18431 ?auto_18440 ) ) ( not ( = ?auto_18431 ?auto_18456 ) ) ( not ( = ?auto_18432 ?auto_18440 ) ) ( not ( = ?auto_18432 ?auto_18456 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) ( not ( = ?auto_18433 ?auto_18456 ) ) ( not ( = ?auto_18434 ?auto_18440 ) ) ( not ( = ?auto_18434 ?auto_18456 ) ) ( not ( = ?auto_18435 ?auto_18440 ) ) ( not ( = ?auto_18435 ?auto_18456 ) ) ( not ( = ?auto_18436 ?auto_18440 ) ) ( not ( = ?auto_18436 ?auto_18456 ) ) ( not ( = ?auto_18437 ?auto_18440 ) ) ( not ( = ?auto_18437 ?auto_18456 ) ) ( not ( = ?auto_18438 ?auto_18440 ) ) ( not ( = ?auto_18438 ?auto_18456 ) ) ( not ( = ?auto_18440 ?auto_18479 ) ) ( not ( = ?auto_18440 ?auto_18450 ) ) ( not ( = ?auto_18440 ?auto_18458 ) ) ( not ( = ?auto_18440 ?auto_18466 ) ) ( not ( = ?auto_18440 ?auto_18474 ) ) ( not ( = ?auto_18440 ?auto_18455 ) ) ( not ( = ?auto_18440 ?auto_18454 ) ) ( not ( = ?auto_18440 ?auto_18459 ) ) ( not ( = ?auto_18440 ?auto_18451 ) ) ( not ( = ?auto_18440 ?auto_18473 ) ) ( not ( = ?auto_18456 ?auto_18479 ) ) ( not ( = ?auto_18456 ?auto_18450 ) ) ( not ( = ?auto_18456 ?auto_18458 ) ) ( not ( = ?auto_18456 ?auto_18466 ) ) ( not ( = ?auto_18456 ?auto_18474 ) ) ( not ( = ?auto_18456 ?auto_18455 ) ) ( not ( = ?auto_18456 ?auto_18454 ) ) ( not ( = ?auto_18456 ?auto_18459 ) ) ( not ( = ?auto_18456 ?auto_18451 ) ) ( not ( = ?auto_18456 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18441 ) ) ( not ( = ?auto_18429 ?auto_18460 ) ) ( not ( = ?auto_18430 ?auto_18441 ) ) ( not ( = ?auto_18430 ?auto_18460 ) ) ( not ( = ?auto_18431 ?auto_18441 ) ) ( not ( = ?auto_18431 ?auto_18460 ) ) ( not ( = ?auto_18432 ?auto_18441 ) ) ( not ( = ?auto_18432 ?auto_18460 ) ) ( not ( = ?auto_18433 ?auto_18441 ) ) ( not ( = ?auto_18433 ?auto_18460 ) ) ( not ( = ?auto_18434 ?auto_18441 ) ) ( not ( = ?auto_18434 ?auto_18460 ) ) ( not ( = ?auto_18435 ?auto_18441 ) ) ( not ( = ?auto_18435 ?auto_18460 ) ) ( not ( = ?auto_18436 ?auto_18441 ) ) ( not ( = ?auto_18436 ?auto_18460 ) ) ( not ( = ?auto_18437 ?auto_18441 ) ) ( not ( = ?auto_18437 ?auto_18460 ) ) ( not ( = ?auto_18438 ?auto_18441 ) ) ( not ( = ?auto_18438 ?auto_18460 ) ) ( not ( = ?auto_18439 ?auto_18441 ) ) ( not ( = ?auto_18439 ?auto_18460 ) ) ( not ( = ?auto_18441 ?auto_18456 ) ) ( not ( = ?auto_18441 ?auto_18479 ) ) ( not ( = ?auto_18441 ?auto_18450 ) ) ( not ( = ?auto_18441 ?auto_18458 ) ) ( not ( = ?auto_18441 ?auto_18466 ) ) ( not ( = ?auto_18441 ?auto_18474 ) ) ( not ( = ?auto_18441 ?auto_18455 ) ) ( not ( = ?auto_18441 ?auto_18454 ) ) ( not ( = ?auto_18441 ?auto_18459 ) ) ( not ( = ?auto_18441 ?auto_18451 ) ) ( not ( = ?auto_18441 ?auto_18473 ) ) ( not ( = ?auto_18452 ?auto_18482 ) ) ( not ( = ?auto_18452 ?auto_18462 ) ) ( not ( = ?auto_18452 ?auto_18464 ) ) ( not ( = ?auto_18452 ?auto_18465 ) ) ( not ( = ?auto_18452 ?auto_18475 ) ) ( not ( = ?auto_18452 ?auto_18469 ) ) ( not ( = ?auto_18452 ?auto_18478 ) ) ( not ( = ?auto_18452 ?auto_18461 ) ) ( not ( = ?auto_18452 ?auto_18472 ) ) ( not ( = ?auto_18470 ?auto_18468 ) ) ( not ( = ?auto_18470 ?auto_18471 ) ) ( not ( = ?auto_18470 ?auto_18463 ) ) ( not ( = ?auto_18470 ?auto_18457 ) ) ( not ( = ?auto_18470 ?auto_18481 ) ) ( not ( = ?auto_18470 ?auto_18480 ) ) ( not ( = ?auto_18470 ?auto_18453 ) ) ( not ( = ?auto_18470 ?auto_18477 ) ) ( not ( = ?auto_18470 ?auto_18467 ) ) ( not ( = ?auto_18460 ?auto_18456 ) ) ( not ( = ?auto_18460 ?auto_18479 ) ) ( not ( = ?auto_18460 ?auto_18450 ) ) ( not ( = ?auto_18460 ?auto_18458 ) ) ( not ( = ?auto_18460 ?auto_18466 ) ) ( not ( = ?auto_18460 ?auto_18474 ) ) ( not ( = ?auto_18460 ?auto_18455 ) ) ( not ( = ?auto_18460 ?auto_18454 ) ) ( not ( = ?auto_18460 ?auto_18459 ) ) ( not ( = ?auto_18460 ?auto_18451 ) ) ( not ( = ?auto_18460 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18442 ) ) ( not ( = ?auto_18429 ?auto_18476 ) ) ( not ( = ?auto_18430 ?auto_18442 ) ) ( not ( = ?auto_18430 ?auto_18476 ) ) ( not ( = ?auto_18431 ?auto_18442 ) ) ( not ( = ?auto_18431 ?auto_18476 ) ) ( not ( = ?auto_18432 ?auto_18442 ) ) ( not ( = ?auto_18432 ?auto_18476 ) ) ( not ( = ?auto_18433 ?auto_18442 ) ) ( not ( = ?auto_18433 ?auto_18476 ) ) ( not ( = ?auto_18434 ?auto_18442 ) ) ( not ( = ?auto_18434 ?auto_18476 ) ) ( not ( = ?auto_18435 ?auto_18442 ) ) ( not ( = ?auto_18435 ?auto_18476 ) ) ( not ( = ?auto_18436 ?auto_18442 ) ) ( not ( = ?auto_18436 ?auto_18476 ) ) ( not ( = ?auto_18437 ?auto_18442 ) ) ( not ( = ?auto_18437 ?auto_18476 ) ) ( not ( = ?auto_18438 ?auto_18442 ) ) ( not ( = ?auto_18438 ?auto_18476 ) ) ( not ( = ?auto_18439 ?auto_18442 ) ) ( not ( = ?auto_18439 ?auto_18476 ) ) ( not ( = ?auto_18440 ?auto_18442 ) ) ( not ( = ?auto_18440 ?auto_18476 ) ) ( not ( = ?auto_18442 ?auto_18460 ) ) ( not ( = ?auto_18442 ?auto_18456 ) ) ( not ( = ?auto_18442 ?auto_18479 ) ) ( not ( = ?auto_18442 ?auto_18450 ) ) ( not ( = ?auto_18442 ?auto_18458 ) ) ( not ( = ?auto_18442 ?auto_18466 ) ) ( not ( = ?auto_18442 ?auto_18474 ) ) ( not ( = ?auto_18442 ?auto_18455 ) ) ( not ( = ?auto_18442 ?auto_18454 ) ) ( not ( = ?auto_18442 ?auto_18459 ) ) ( not ( = ?auto_18442 ?auto_18451 ) ) ( not ( = ?auto_18442 ?auto_18473 ) ) ( not ( = ?auto_18476 ?auto_18460 ) ) ( not ( = ?auto_18476 ?auto_18456 ) ) ( not ( = ?auto_18476 ?auto_18479 ) ) ( not ( = ?auto_18476 ?auto_18450 ) ) ( not ( = ?auto_18476 ?auto_18458 ) ) ( not ( = ?auto_18476 ?auto_18466 ) ) ( not ( = ?auto_18476 ?auto_18474 ) ) ( not ( = ?auto_18476 ?auto_18455 ) ) ( not ( = ?auto_18476 ?auto_18454 ) ) ( not ( = ?auto_18476 ?auto_18459 ) ) ( not ( = ?auto_18476 ?auto_18451 ) ) ( not ( = ?auto_18476 ?auto_18473 ) ) ( not ( = ?auto_18429 ?auto_18443 ) ) ( not ( = ?auto_18429 ?auto_18445 ) ) ( not ( = ?auto_18430 ?auto_18443 ) ) ( not ( = ?auto_18430 ?auto_18445 ) ) ( not ( = ?auto_18431 ?auto_18443 ) ) ( not ( = ?auto_18431 ?auto_18445 ) ) ( not ( = ?auto_18432 ?auto_18443 ) ) ( not ( = ?auto_18432 ?auto_18445 ) ) ( not ( = ?auto_18433 ?auto_18443 ) ) ( not ( = ?auto_18433 ?auto_18445 ) ) ( not ( = ?auto_18434 ?auto_18443 ) ) ( not ( = ?auto_18434 ?auto_18445 ) ) ( not ( = ?auto_18435 ?auto_18443 ) ) ( not ( = ?auto_18435 ?auto_18445 ) ) ( not ( = ?auto_18436 ?auto_18443 ) ) ( not ( = ?auto_18436 ?auto_18445 ) ) ( not ( = ?auto_18437 ?auto_18443 ) ) ( not ( = ?auto_18437 ?auto_18445 ) ) ( not ( = ?auto_18438 ?auto_18443 ) ) ( not ( = ?auto_18438 ?auto_18445 ) ) ( not ( = ?auto_18439 ?auto_18443 ) ) ( not ( = ?auto_18439 ?auto_18445 ) ) ( not ( = ?auto_18440 ?auto_18443 ) ) ( not ( = ?auto_18440 ?auto_18445 ) ) ( not ( = ?auto_18441 ?auto_18443 ) ) ( not ( = ?auto_18441 ?auto_18445 ) ) ( not ( = ?auto_18443 ?auto_18476 ) ) ( not ( = ?auto_18443 ?auto_18460 ) ) ( not ( = ?auto_18443 ?auto_18456 ) ) ( not ( = ?auto_18443 ?auto_18479 ) ) ( not ( = ?auto_18443 ?auto_18450 ) ) ( not ( = ?auto_18443 ?auto_18458 ) ) ( not ( = ?auto_18443 ?auto_18466 ) ) ( not ( = ?auto_18443 ?auto_18474 ) ) ( not ( = ?auto_18443 ?auto_18455 ) ) ( not ( = ?auto_18443 ?auto_18454 ) ) ( not ( = ?auto_18443 ?auto_18459 ) ) ( not ( = ?auto_18443 ?auto_18451 ) ) ( not ( = ?auto_18443 ?auto_18473 ) ) ( not ( = ?auto_18447 ?auto_18452 ) ) ( not ( = ?auto_18447 ?auto_18482 ) ) ( not ( = ?auto_18447 ?auto_18462 ) ) ( not ( = ?auto_18447 ?auto_18464 ) ) ( not ( = ?auto_18447 ?auto_18465 ) ) ( not ( = ?auto_18447 ?auto_18475 ) ) ( not ( = ?auto_18447 ?auto_18469 ) ) ( not ( = ?auto_18447 ?auto_18478 ) ) ( not ( = ?auto_18447 ?auto_18461 ) ) ( not ( = ?auto_18447 ?auto_18472 ) ) ( not ( = ?auto_18444 ?auto_18470 ) ) ( not ( = ?auto_18444 ?auto_18468 ) ) ( not ( = ?auto_18444 ?auto_18471 ) ) ( not ( = ?auto_18444 ?auto_18463 ) ) ( not ( = ?auto_18444 ?auto_18457 ) ) ( not ( = ?auto_18444 ?auto_18481 ) ) ( not ( = ?auto_18444 ?auto_18480 ) ) ( not ( = ?auto_18444 ?auto_18453 ) ) ( not ( = ?auto_18444 ?auto_18477 ) ) ( not ( = ?auto_18444 ?auto_18467 ) ) ( not ( = ?auto_18445 ?auto_18476 ) ) ( not ( = ?auto_18445 ?auto_18460 ) ) ( not ( = ?auto_18445 ?auto_18456 ) ) ( not ( = ?auto_18445 ?auto_18479 ) ) ( not ( = ?auto_18445 ?auto_18450 ) ) ( not ( = ?auto_18445 ?auto_18458 ) ) ( not ( = ?auto_18445 ?auto_18466 ) ) ( not ( = ?auto_18445 ?auto_18474 ) ) ( not ( = ?auto_18445 ?auto_18455 ) ) ( not ( = ?auto_18445 ?auto_18454 ) ) ( not ( = ?auto_18445 ?auto_18459 ) ) ( not ( = ?auto_18445 ?auto_18451 ) ) ( not ( = ?auto_18445 ?auto_18473 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18429 ?auto_18430 ?auto_18431 ?auto_18432 ?auto_18433 ?auto_18434 ?auto_18435 ?auto_18436 ?auto_18437 ?auto_18438 ?auto_18439 ?auto_18440 ?auto_18441 ?auto_18442 )
      ( MAKE-1CRATE ?auto_18442 ?auto_18443 )
      ( MAKE-14CRATE-VERIFY ?auto_18429 ?auto_18430 ?auto_18431 ?auto_18432 ?auto_18433 ?auto_18434 ?auto_18435 ?auto_18436 ?auto_18437 ?auto_18438 ?auto_18439 ?auto_18440 ?auto_18441 ?auto_18442 ?auto_18443 ) )
  )

)

