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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17796 - SURFACE
      ?auto_17797 - SURFACE
    )
    :vars
    (
      ?auto_17798 - HOIST
      ?auto_17799 - PLACE
      ?auto_17801 - PLACE
      ?auto_17802 - HOIST
      ?auto_17803 - SURFACE
      ?auto_17800 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17798 ?auto_17799 ) ( SURFACE-AT ?auto_17796 ?auto_17799 ) ( CLEAR ?auto_17796 ) ( IS-CRATE ?auto_17797 ) ( AVAILABLE ?auto_17798 ) ( not ( = ?auto_17801 ?auto_17799 ) ) ( HOIST-AT ?auto_17802 ?auto_17801 ) ( AVAILABLE ?auto_17802 ) ( SURFACE-AT ?auto_17797 ?auto_17801 ) ( ON ?auto_17797 ?auto_17803 ) ( CLEAR ?auto_17797 ) ( TRUCK-AT ?auto_17800 ?auto_17799 ) ( not ( = ?auto_17796 ?auto_17797 ) ) ( not ( = ?auto_17796 ?auto_17803 ) ) ( not ( = ?auto_17797 ?auto_17803 ) ) ( not ( = ?auto_17798 ?auto_17802 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17800 ?auto_17799 ?auto_17801 )
      ( !LIFT ?auto_17802 ?auto_17797 ?auto_17803 ?auto_17801 )
      ( !LOAD ?auto_17802 ?auto_17797 ?auto_17800 ?auto_17801 )
      ( !DRIVE ?auto_17800 ?auto_17801 ?auto_17799 )
      ( !UNLOAD ?auto_17798 ?auto_17797 ?auto_17800 ?auto_17799 )
      ( !DROP ?auto_17798 ?auto_17797 ?auto_17796 ?auto_17799 )
      ( MAKE-1CRATE-VERIFY ?auto_17796 ?auto_17797 ) )
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
      ?auto_17812 - HOIST
      ?auto_17814 - PLACE
      ?auto_17815 - PLACE
      ?auto_17810 - HOIST
      ?auto_17811 - SURFACE
      ?auto_17816 - PLACE
      ?auto_17817 - HOIST
      ?auto_17818 - SURFACE
      ?auto_17813 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17812 ?auto_17814 ) ( IS-CRATE ?auto_17809 ) ( not ( = ?auto_17815 ?auto_17814 ) ) ( HOIST-AT ?auto_17810 ?auto_17815 ) ( AVAILABLE ?auto_17810 ) ( SURFACE-AT ?auto_17809 ?auto_17815 ) ( ON ?auto_17809 ?auto_17811 ) ( CLEAR ?auto_17809 ) ( not ( = ?auto_17808 ?auto_17809 ) ) ( not ( = ?auto_17808 ?auto_17811 ) ) ( not ( = ?auto_17809 ?auto_17811 ) ) ( not ( = ?auto_17812 ?auto_17810 ) ) ( SURFACE-AT ?auto_17807 ?auto_17814 ) ( CLEAR ?auto_17807 ) ( IS-CRATE ?auto_17808 ) ( AVAILABLE ?auto_17812 ) ( not ( = ?auto_17816 ?auto_17814 ) ) ( HOIST-AT ?auto_17817 ?auto_17816 ) ( AVAILABLE ?auto_17817 ) ( SURFACE-AT ?auto_17808 ?auto_17816 ) ( ON ?auto_17808 ?auto_17818 ) ( CLEAR ?auto_17808 ) ( TRUCK-AT ?auto_17813 ?auto_17814 ) ( not ( = ?auto_17807 ?auto_17808 ) ) ( not ( = ?auto_17807 ?auto_17818 ) ) ( not ( = ?auto_17808 ?auto_17818 ) ) ( not ( = ?auto_17812 ?auto_17817 ) ) ( not ( = ?auto_17807 ?auto_17809 ) ) ( not ( = ?auto_17807 ?auto_17811 ) ) ( not ( = ?auto_17809 ?auto_17818 ) ) ( not ( = ?auto_17815 ?auto_17816 ) ) ( not ( = ?auto_17810 ?auto_17817 ) ) ( not ( = ?auto_17811 ?auto_17818 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_17807 ?auto_17808 )
      ( MAKE-1CRATE ?auto_17808 ?auto_17809 )
      ( MAKE-2CRATE-VERIFY ?auto_17807 ?auto_17808 ?auto_17809 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17821 - SURFACE
      ?auto_17822 - SURFACE
    )
    :vars
    (
      ?auto_17823 - HOIST
      ?auto_17824 - PLACE
      ?auto_17826 - PLACE
      ?auto_17827 - HOIST
      ?auto_17828 - SURFACE
      ?auto_17825 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17823 ?auto_17824 ) ( SURFACE-AT ?auto_17821 ?auto_17824 ) ( CLEAR ?auto_17821 ) ( IS-CRATE ?auto_17822 ) ( AVAILABLE ?auto_17823 ) ( not ( = ?auto_17826 ?auto_17824 ) ) ( HOIST-AT ?auto_17827 ?auto_17826 ) ( AVAILABLE ?auto_17827 ) ( SURFACE-AT ?auto_17822 ?auto_17826 ) ( ON ?auto_17822 ?auto_17828 ) ( CLEAR ?auto_17822 ) ( TRUCK-AT ?auto_17825 ?auto_17824 ) ( not ( = ?auto_17821 ?auto_17822 ) ) ( not ( = ?auto_17821 ?auto_17828 ) ) ( not ( = ?auto_17822 ?auto_17828 ) ) ( not ( = ?auto_17823 ?auto_17827 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17825 ?auto_17824 ?auto_17826 )
      ( !LIFT ?auto_17827 ?auto_17822 ?auto_17828 ?auto_17826 )
      ( !LOAD ?auto_17827 ?auto_17822 ?auto_17825 ?auto_17826 )
      ( !DRIVE ?auto_17825 ?auto_17826 ?auto_17824 )
      ( !UNLOAD ?auto_17823 ?auto_17822 ?auto_17825 ?auto_17824 )
      ( !DROP ?auto_17823 ?auto_17822 ?auto_17821 ?auto_17824 )
      ( MAKE-1CRATE-VERIFY ?auto_17821 ?auto_17822 ) )
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
      ?auto_17838 - HOIST
      ?auto_17842 - PLACE
      ?auto_17841 - PLACE
      ?auto_17839 - HOIST
      ?auto_17840 - SURFACE
      ?auto_17845 - PLACE
      ?auto_17844 - HOIST
      ?auto_17843 - SURFACE
      ?auto_17847 - PLACE
      ?auto_17848 - HOIST
      ?auto_17846 - SURFACE
      ?auto_17837 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17838 ?auto_17842 ) ( IS-CRATE ?auto_17836 ) ( not ( = ?auto_17841 ?auto_17842 ) ) ( HOIST-AT ?auto_17839 ?auto_17841 ) ( AVAILABLE ?auto_17839 ) ( SURFACE-AT ?auto_17836 ?auto_17841 ) ( ON ?auto_17836 ?auto_17840 ) ( CLEAR ?auto_17836 ) ( not ( = ?auto_17835 ?auto_17836 ) ) ( not ( = ?auto_17835 ?auto_17840 ) ) ( not ( = ?auto_17836 ?auto_17840 ) ) ( not ( = ?auto_17838 ?auto_17839 ) ) ( IS-CRATE ?auto_17835 ) ( not ( = ?auto_17845 ?auto_17842 ) ) ( HOIST-AT ?auto_17844 ?auto_17845 ) ( AVAILABLE ?auto_17844 ) ( SURFACE-AT ?auto_17835 ?auto_17845 ) ( ON ?auto_17835 ?auto_17843 ) ( CLEAR ?auto_17835 ) ( not ( = ?auto_17834 ?auto_17835 ) ) ( not ( = ?auto_17834 ?auto_17843 ) ) ( not ( = ?auto_17835 ?auto_17843 ) ) ( not ( = ?auto_17838 ?auto_17844 ) ) ( SURFACE-AT ?auto_17833 ?auto_17842 ) ( CLEAR ?auto_17833 ) ( IS-CRATE ?auto_17834 ) ( AVAILABLE ?auto_17838 ) ( not ( = ?auto_17847 ?auto_17842 ) ) ( HOIST-AT ?auto_17848 ?auto_17847 ) ( AVAILABLE ?auto_17848 ) ( SURFACE-AT ?auto_17834 ?auto_17847 ) ( ON ?auto_17834 ?auto_17846 ) ( CLEAR ?auto_17834 ) ( TRUCK-AT ?auto_17837 ?auto_17842 ) ( not ( = ?auto_17833 ?auto_17834 ) ) ( not ( = ?auto_17833 ?auto_17846 ) ) ( not ( = ?auto_17834 ?auto_17846 ) ) ( not ( = ?auto_17838 ?auto_17848 ) ) ( not ( = ?auto_17833 ?auto_17835 ) ) ( not ( = ?auto_17833 ?auto_17843 ) ) ( not ( = ?auto_17835 ?auto_17846 ) ) ( not ( = ?auto_17845 ?auto_17847 ) ) ( not ( = ?auto_17844 ?auto_17848 ) ) ( not ( = ?auto_17843 ?auto_17846 ) ) ( not ( = ?auto_17833 ?auto_17836 ) ) ( not ( = ?auto_17833 ?auto_17840 ) ) ( not ( = ?auto_17834 ?auto_17836 ) ) ( not ( = ?auto_17834 ?auto_17840 ) ) ( not ( = ?auto_17836 ?auto_17843 ) ) ( not ( = ?auto_17836 ?auto_17846 ) ) ( not ( = ?auto_17841 ?auto_17845 ) ) ( not ( = ?auto_17841 ?auto_17847 ) ) ( not ( = ?auto_17839 ?auto_17844 ) ) ( not ( = ?auto_17839 ?auto_17848 ) ) ( not ( = ?auto_17840 ?auto_17843 ) ) ( not ( = ?auto_17840 ?auto_17846 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_17833 ?auto_17834 ?auto_17835 )
      ( MAKE-1CRATE ?auto_17835 ?auto_17836 )
      ( MAKE-3CRATE-VERIFY ?auto_17833 ?auto_17834 ?auto_17835 ?auto_17836 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17851 - SURFACE
      ?auto_17852 - SURFACE
    )
    :vars
    (
      ?auto_17853 - HOIST
      ?auto_17854 - PLACE
      ?auto_17856 - PLACE
      ?auto_17857 - HOIST
      ?auto_17858 - SURFACE
      ?auto_17855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17853 ?auto_17854 ) ( SURFACE-AT ?auto_17851 ?auto_17854 ) ( CLEAR ?auto_17851 ) ( IS-CRATE ?auto_17852 ) ( AVAILABLE ?auto_17853 ) ( not ( = ?auto_17856 ?auto_17854 ) ) ( HOIST-AT ?auto_17857 ?auto_17856 ) ( AVAILABLE ?auto_17857 ) ( SURFACE-AT ?auto_17852 ?auto_17856 ) ( ON ?auto_17852 ?auto_17858 ) ( CLEAR ?auto_17852 ) ( TRUCK-AT ?auto_17855 ?auto_17854 ) ( not ( = ?auto_17851 ?auto_17852 ) ) ( not ( = ?auto_17851 ?auto_17858 ) ) ( not ( = ?auto_17852 ?auto_17858 ) ) ( not ( = ?auto_17853 ?auto_17857 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17855 ?auto_17854 ?auto_17856 )
      ( !LIFT ?auto_17857 ?auto_17852 ?auto_17858 ?auto_17856 )
      ( !LOAD ?auto_17857 ?auto_17852 ?auto_17855 ?auto_17856 )
      ( !DRIVE ?auto_17855 ?auto_17856 ?auto_17854 )
      ( !UNLOAD ?auto_17853 ?auto_17852 ?auto_17855 ?auto_17854 )
      ( !DROP ?auto_17853 ?auto_17852 ?auto_17851 ?auto_17854 )
      ( MAKE-1CRATE-VERIFY ?auto_17851 ?auto_17852 ) )
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
      ?auto_17870 - HOIST
      ?auto_17874 - PLACE
      ?auto_17871 - PLACE
      ?auto_17872 - HOIST
      ?auto_17873 - SURFACE
      ?auto_17881 - PLACE
      ?auto_17878 - HOIST
      ?auto_17880 - SURFACE
      ?auto_17879 - PLACE
      ?auto_17882 - HOIST
      ?auto_17883 - SURFACE
      ?auto_17875 - PLACE
      ?auto_17877 - HOIST
      ?auto_17876 - SURFACE
      ?auto_17869 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17870 ?auto_17874 ) ( IS-CRATE ?auto_17868 ) ( not ( = ?auto_17871 ?auto_17874 ) ) ( HOIST-AT ?auto_17872 ?auto_17871 ) ( AVAILABLE ?auto_17872 ) ( SURFACE-AT ?auto_17868 ?auto_17871 ) ( ON ?auto_17868 ?auto_17873 ) ( CLEAR ?auto_17868 ) ( not ( = ?auto_17867 ?auto_17868 ) ) ( not ( = ?auto_17867 ?auto_17873 ) ) ( not ( = ?auto_17868 ?auto_17873 ) ) ( not ( = ?auto_17870 ?auto_17872 ) ) ( IS-CRATE ?auto_17867 ) ( not ( = ?auto_17881 ?auto_17874 ) ) ( HOIST-AT ?auto_17878 ?auto_17881 ) ( AVAILABLE ?auto_17878 ) ( SURFACE-AT ?auto_17867 ?auto_17881 ) ( ON ?auto_17867 ?auto_17880 ) ( CLEAR ?auto_17867 ) ( not ( = ?auto_17866 ?auto_17867 ) ) ( not ( = ?auto_17866 ?auto_17880 ) ) ( not ( = ?auto_17867 ?auto_17880 ) ) ( not ( = ?auto_17870 ?auto_17878 ) ) ( IS-CRATE ?auto_17866 ) ( not ( = ?auto_17879 ?auto_17874 ) ) ( HOIST-AT ?auto_17882 ?auto_17879 ) ( AVAILABLE ?auto_17882 ) ( SURFACE-AT ?auto_17866 ?auto_17879 ) ( ON ?auto_17866 ?auto_17883 ) ( CLEAR ?auto_17866 ) ( not ( = ?auto_17865 ?auto_17866 ) ) ( not ( = ?auto_17865 ?auto_17883 ) ) ( not ( = ?auto_17866 ?auto_17883 ) ) ( not ( = ?auto_17870 ?auto_17882 ) ) ( SURFACE-AT ?auto_17864 ?auto_17874 ) ( CLEAR ?auto_17864 ) ( IS-CRATE ?auto_17865 ) ( AVAILABLE ?auto_17870 ) ( not ( = ?auto_17875 ?auto_17874 ) ) ( HOIST-AT ?auto_17877 ?auto_17875 ) ( AVAILABLE ?auto_17877 ) ( SURFACE-AT ?auto_17865 ?auto_17875 ) ( ON ?auto_17865 ?auto_17876 ) ( CLEAR ?auto_17865 ) ( TRUCK-AT ?auto_17869 ?auto_17874 ) ( not ( = ?auto_17864 ?auto_17865 ) ) ( not ( = ?auto_17864 ?auto_17876 ) ) ( not ( = ?auto_17865 ?auto_17876 ) ) ( not ( = ?auto_17870 ?auto_17877 ) ) ( not ( = ?auto_17864 ?auto_17866 ) ) ( not ( = ?auto_17864 ?auto_17883 ) ) ( not ( = ?auto_17866 ?auto_17876 ) ) ( not ( = ?auto_17879 ?auto_17875 ) ) ( not ( = ?auto_17882 ?auto_17877 ) ) ( not ( = ?auto_17883 ?auto_17876 ) ) ( not ( = ?auto_17864 ?auto_17867 ) ) ( not ( = ?auto_17864 ?auto_17880 ) ) ( not ( = ?auto_17865 ?auto_17867 ) ) ( not ( = ?auto_17865 ?auto_17880 ) ) ( not ( = ?auto_17867 ?auto_17883 ) ) ( not ( = ?auto_17867 ?auto_17876 ) ) ( not ( = ?auto_17881 ?auto_17879 ) ) ( not ( = ?auto_17881 ?auto_17875 ) ) ( not ( = ?auto_17878 ?auto_17882 ) ) ( not ( = ?auto_17878 ?auto_17877 ) ) ( not ( = ?auto_17880 ?auto_17883 ) ) ( not ( = ?auto_17880 ?auto_17876 ) ) ( not ( = ?auto_17864 ?auto_17868 ) ) ( not ( = ?auto_17864 ?auto_17873 ) ) ( not ( = ?auto_17865 ?auto_17868 ) ) ( not ( = ?auto_17865 ?auto_17873 ) ) ( not ( = ?auto_17866 ?auto_17868 ) ) ( not ( = ?auto_17866 ?auto_17873 ) ) ( not ( = ?auto_17868 ?auto_17880 ) ) ( not ( = ?auto_17868 ?auto_17883 ) ) ( not ( = ?auto_17868 ?auto_17876 ) ) ( not ( = ?auto_17871 ?auto_17881 ) ) ( not ( = ?auto_17871 ?auto_17879 ) ) ( not ( = ?auto_17871 ?auto_17875 ) ) ( not ( = ?auto_17872 ?auto_17878 ) ) ( not ( = ?auto_17872 ?auto_17882 ) ) ( not ( = ?auto_17872 ?auto_17877 ) ) ( not ( = ?auto_17873 ?auto_17880 ) ) ( not ( = ?auto_17873 ?auto_17883 ) ) ( not ( = ?auto_17873 ?auto_17876 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_17864 ?auto_17865 ?auto_17866 ?auto_17867 )
      ( MAKE-1CRATE ?auto_17867 ?auto_17868 )
      ( MAKE-4CRATE-VERIFY ?auto_17864 ?auto_17865 ?auto_17866 ?auto_17867 ?auto_17868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17886 - SURFACE
      ?auto_17887 - SURFACE
    )
    :vars
    (
      ?auto_17888 - HOIST
      ?auto_17889 - PLACE
      ?auto_17891 - PLACE
      ?auto_17892 - HOIST
      ?auto_17893 - SURFACE
      ?auto_17890 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17888 ?auto_17889 ) ( SURFACE-AT ?auto_17886 ?auto_17889 ) ( CLEAR ?auto_17886 ) ( IS-CRATE ?auto_17887 ) ( AVAILABLE ?auto_17888 ) ( not ( = ?auto_17891 ?auto_17889 ) ) ( HOIST-AT ?auto_17892 ?auto_17891 ) ( AVAILABLE ?auto_17892 ) ( SURFACE-AT ?auto_17887 ?auto_17891 ) ( ON ?auto_17887 ?auto_17893 ) ( CLEAR ?auto_17887 ) ( TRUCK-AT ?auto_17890 ?auto_17889 ) ( not ( = ?auto_17886 ?auto_17887 ) ) ( not ( = ?auto_17886 ?auto_17893 ) ) ( not ( = ?auto_17887 ?auto_17893 ) ) ( not ( = ?auto_17888 ?auto_17892 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17890 ?auto_17889 ?auto_17891 )
      ( !LIFT ?auto_17892 ?auto_17887 ?auto_17893 ?auto_17891 )
      ( !LOAD ?auto_17892 ?auto_17887 ?auto_17890 ?auto_17891 )
      ( !DRIVE ?auto_17890 ?auto_17891 ?auto_17889 )
      ( !UNLOAD ?auto_17888 ?auto_17887 ?auto_17890 ?auto_17889 )
      ( !DROP ?auto_17888 ?auto_17887 ?auto_17886 ?auto_17889 )
      ( MAKE-1CRATE-VERIFY ?auto_17886 ?auto_17887 ) )
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
      ?auto_17911 - HOIST
      ?auto_17906 - PLACE
      ?auto_17909 - PLACE
      ?auto_17908 - HOIST
      ?auto_17907 - SURFACE
      ?auto_17917 - PLACE
      ?auto_17919 - HOIST
      ?auto_17912 - SURFACE
      ?auto_17913 - PLACE
      ?auto_17918 - HOIST
      ?auto_17916 - SURFACE
      ?auto_17915 - PLACE
      ?auto_17920 - HOIST
      ?auto_17923 - SURFACE
      ?auto_17914 - PLACE
      ?auto_17922 - HOIST
      ?auto_17921 - SURFACE
      ?auto_17910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17911 ?auto_17906 ) ( IS-CRATE ?auto_17905 ) ( not ( = ?auto_17909 ?auto_17906 ) ) ( HOIST-AT ?auto_17908 ?auto_17909 ) ( AVAILABLE ?auto_17908 ) ( SURFACE-AT ?auto_17905 ?auto_17909 ) ( ON ?auto_17905 ?auto_17907 ) ( CLEAR ?auto_17905 ) ( not ( = ?auto_17904 ?auto_17905 ) ) ( not ( = ?auto_17904 ?auto_17907 ) ) ( not ( = ?auto_17905 ?auto_17907 ) ) ( not ( = ?auto_17911 ?auto_17908 ) ) ( IS-CRATE ?auto_17904 ) ( not ( = ?auto_17917 ?auto_17906 ) ) ( HOIST-AT ?auto_17919 ?auto_17917 ) ( AVAILABLE ?auto_17919 ) ( SURFACE-AT ?auto_17904 ?auto_17917 ) ( ON ?auto_17904 ?auto_17912 ) ( CLEAR ?auto_17904 ) ( not ( = ?auto_17903 ?auto_17904 ) ) ( not ( = ?auto_17903 ?auto_17912 ) ) ( not ( = ?auto_17904 ?auto_17912 ) ) ( not ( = ?auto_17911 ?auto_17919 ) ) ( IS-CRATE ?auto_17903 ) ( not ( = ?auto_17913 ?auto_17906 ) ) ( HOIST-AT ?auto_17918 ?auto_17913 ) ( AVAILABLE ?auto_17918 ) ( SURFACE-AT ?auto_17903 ?auto_17913 ) ( ON ?auto_17903 ?auto_17916 ) ( CLEAR ?auto_17903 ) ( not ( = ?auto_17902 ?auto_17903 ) ) ( not ( = ?auto_17902 ?auto_17916 ) ) ( not ( = ?auto_17903 ?auto_17916 ) ) ( not ( = ?auto_17911 ?auto_17918 ) ) ( IS-CRATE ?auto_17902 ) ( not ( = ?auto_17915 ?auto_17906 ) ) ( HOIST-AT ?auto_17920 ?auto_17915 ) ( AVAILABLE ?auto_17920 ) ( SURFACE-AT ?auto_17902 ?auto_17915 ) ( ON ?auto_17902 ?auto_17923 ) ( CLEAR ?auto_17902 ) ( not ( = ?auto_17901 ?auto_17902 ) ) ( not ( = ?auto_17901 ?auto_17923 ) ) ( not ( = ?auto_17902 ?auto_17923 ) ) ( not ( = ?auto_17911 ?auto_17920 ) ) ( SURFACE-AT ?auto_17900 ?auto_17906 ) ( CLEAR ?auto_17900 ) ( IS-CRATE ?auto_17901 ) ( AVAILABLE ?auto_17911 ) ( not ( = ?auto_17914 ?auto_17906 ) ) ( HOIST-AT ?auto_17922 ?auto_17914 ) ( AVAILABLE ?auto_17922 ) ( SURFACE-AT ?auto_17901 ?auto_17914 ) ( ON ?auto_17901 ?auto_17921 ) ( CLEAR ?auto_17901 ) ( TRUCK-AT ?auto_17910 ?auto_17906 ) ( not ( = ?auto_17900 ?auto_17901 ) ) ( not ( = ?auto_17900 ?auto_17921 ) ) ( not ( = ?auto_17901 ?auto_17921 ) ) ( not ( = ?auto_17911 ?auto_17922 ) ) ( not ( = ?auto_17900 ?auto_17902 ) ) ( not ( = ?auto_17900 ?auto_17923 ) ) ( not ( = ?auto_17902 ?auto_17921 ) ) ( not ( = ?auto_17915 ?auto_17914 ) ) ( not ( = ?auto_17920 ?auto_17922 ) ) ( not ( = ?auto_17923 ?auto_17921 ) ) ( not ( = ?auto_17900 ?auto_17903 ) ) ( not ( = ?auto_17900 ?auto_17916 ) ) ( not ( = ?auto_17901 ?auto_17903 ) ) ( not ( = ?auto_17901 ?auto_17916 ) ) ( not ( = ?auto_17903 ?auto_17923 ) ) ( not ( = ?auto_17903 ?auto_17921 ) ) ( not ( = ?auto_17913 ?auto_17915 ) ) ( not ( = ?auto_17913 ?auto_17914 ) ) ( not ( = ?auto_17918 ?auto_17920 ) ) ( not ( = ?auto_17918 ?auto_17922 ) ) ( not ( = ?auto_17916 ?auto_17923 ) ) ( not ( = ?auto_17916 ?auto_17921 ) ) ( not ( = ?auto_17900 ?auto_17904 ) ) ( not ( = ?auto_17900 ?auto_17912 ) ) ( not ( = ?auto_17901 ?auto_17904 ) ) ( not ( = ?auto_17901 ?auto_17912 ) ) ( not ( = ?auto_17902 ?auto_17904 ) ) ( not ( = ?auto_17902 ?auto_17912 ) ) ( not ( = ?auto_17904 ?auto_17916 ) ) ( not ( = ?auto_17904 ?auto_17923 ) ) ( not ( = ?auto_17904 ?auto_17921 ) ) ( not ( = ?auto_17917 ?auto_17913 ) ) ( not ( = ?auto_17917 ?auto_17915 ) ) ( not ( = ?auto_17917 ?auto_17914 ) ) ( not ( = ?auto_17919 ?auto_17918 ) ) ( not ( = ?auto_17919 ?auto_17920 ) ) ( not ( = ?auto_17919 ?auto_17922 ) ) ( not ( = ?auto_17912 ?auto_17916 ) ) ( not ( = ?auto_17912 ?auto_17923 ) ) ( not ( = ?auto_17912 ?auto_17921 ) ) ( not ( = ?auto_17900 ?auto_17905 ) ) ( not ( = ?auto_17900 ?auto_17907 ) ) ( not ( = ?auto_17901 ?auto_17905 ) ) ( not ( = ?auto_17901 ?auto_17907 ) ) ( not ( = ?auto_17902 ?auto_17905 ) ) ( not ( = ?auto_17902 ?auto_17907 ) ) ( not ( = ?auto_17903 ?auto_17905 ) ) ( not ( = ?auto_17903 ?auto_17907 ) ) ( not ( = ?auto_17905 ?auto_17912 ) ) ( not ( = ?auto_17905 ?auto_17916 ) ) ( not ( = ?auto_17905 ?auto_17923 ) ) ( not ( = ?auto_17905 ?auto_17921 ) ) ( not ( = ?auto_17909 ?auto_17917 ) ) ( not ( = ?auto_17909 ?auto_17913 ) ) ( not ( = ?auto_17909 ?auto_17915 ) ) ( not ( = ?auto_17909 ?auto_17914 ) ) ( not ( = ?auto_17908 ?auto_17919 ) ) ( not ( = ?auto_17908 ?auto_17918 ) ) ( not ( = ?auto_17908 ?auto_17920 ) ) ( not ( = ?auto_17908 ?auto_17922 ) ) ( not ( = ?auto_17907 ?auto_17912 ) ) ( not ( = ?auto_17907 ?auto_17916 ) ) ( not ( = ?auto_17907 ?auto_17923 ) ) ( not ( = ?auto_17907 ?auto_17921 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 )
      ( MAKE-1CRATE ?auto_17904 ?auto_17905 )
      ( MAKE-5CRATE-VERIFY ?auto_17900 ?auto_17901 ?auto_17902 ?auto_17903 ?auto_17904 ?auto_17905 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17926 - SURFACE
      ?auto_17927 - SURFACE
    )
    :vars
    (
      ?auto_17928 - HOIST
      ?auto_17929 - PLACE
      ?auto_17931 - PLACE
      ?auto_17932 - HOIST
      ?auto_17933 - SURFACE
      ?auto_17930 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17928 ?auto_17929 ) ( SURFACE-AT ?auto_17926 ?auto_17929 ) ( CLEAR ?auto_17926 ) ( IS-CRATE ?auto_17927 ) ( AVAILABLE ?auto_17928 ) ( not ( = ?auto_17931 ?auto_17929 ) ) ( HOIST-AT ?auto_17932 ?auto_17931 ) ( AVAILABLE ?auto_17932 ) ( SURFACE-AT ?auto_17927 ?auto_17931 ) ( ON ?auto_17927 ?auto_17933 ) ( CLEAR ?auto_17927 ) ( TRUCK-AT ?auto_17930 ?auto_17929 ) ( not ( = ?auto_17926 ?auto_17927 ) ) ( not ( = ?auto_17926 ?auto_17933 ) ) ( not ( = ?auto_17927 ?auto_17933 ) ) ( not ( = ?auto_17928 ?auto_17932 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17930 ?auto_17929 ?auto_17931 )
      ( !LIFT ?auto_17932 ?auto_17927 ?auto_17933 ?auto_17931 )
      ( !LOAD ?auto_17932 ?auto_17927 ?auto_17930 ?auto_17931 )
      ( !DRIVE ?auto_17930 ?auto_17931 ?auto_17929 )
      ( !UNLOAD ?auto_17928 ?auto_17927 ?auto_17930 ?auto_17929 )
      ( !DROP ?auto_17928 ?auto_17927 ?auto_17926 ?auto_17929 )
      ( MAKE-1CRATE-VERIFY ?auto_17926 ?auto_17927 ) )
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
      ?auto_17953 - HOIST
      ?auto_17950 - PLACE
      ?auto_17949 - PLACE
      ?auto_17948 - HOIST
      ?auto_17951 - SURFACE
      ?auto_17957 - PLACE
      ?auto_17958 - HOIST
      ?auto_17956 - SURFACE
      ?auto_17964 - PLACE
      ?auto_17960 - HOIST
      ?auto_17961 - SURFACE
      ?auto_17966 - PLACE
      ?auto_17962 - HOIST
      ?auto_17963 - SURFACE
      ?auto_17965 - PLACE
      ?auto_17959 - HOIST
      ?auto_17967 - SURFACE
      ?auto_17954 - PLACE
      ?auto_17955 - HOIST
      ?auto_17968 - SURFACE
      ?auto_17952 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17953 ?auto_17950 ) ( IS-CRATE ?auto_17947 ) ( not ( = ?auto_17949 ?auto_17950 ) ) ( HOIST-AT ?auto_17948 ?auto_17949 ) ( AVAILABLE ?auto_17948 ) ( SURFACE-AT ?auto_17947 ?auto_17949 ) ( ON ?auto_17947 ?auto_17951 ) ( CLEAR ?auto_17947 ) ( not ( = ?auto_17946 ?auto_17947 ) ) ( not ( = ?auto_17946 ?auto_17951 ) ) ( not ( = ?auto_17947 ?auto_17951 ) ) ( not ( = ?auto_17953 ?auto_17948 ) ) ( IS-CRATE ?auto_17946 ) ( not ( = ?auto_17957 ?auto_17950 ) ) ( HOIST-AT ?auto_17958 ?auto_17957 ) ( AVAILABLE ?auto_17958 ) ( SURFACE-AT ?auto_17946 ?auto_17957 ) ( ON ?auto_17946 ?auto_17956 ) ( CLEAR ?auto_17946 ) ( not ( = ?auto_17945 ?auto_17946 ) ) ( not ( = ?auto_17945 ?auto_17956 ) ) ( not ( = ?auto_17946 ?auto_17956 ) ) ( not ( = ?auto_17953 ?auto_17958 ) ) ( IS-CRATE ?auto_17945 ) ( not ( = ?auto_17964 ?auto_17950 ) ) ( HOIST-AT ?auto_17960 ?auto_17964 ) ( AVAILABLE ?auto_17960 ) ( SURFACE-AT ?auto_17945 ?auto_17964 ) ( ON ?auto_17945 ?auto_17961 ) ( CLEAR ?auto_17945 ) ( not ( = ?auto_17944 ?auto_17945 ) ) ( not ( = ?auto_17944 ?auto_17961 ) ) ( not ( = ?auto_17945 ?auto_17961 ) ) ( not ( = ?auto_17953 ?auto_17960 ) ) ( IS-CRATE ?auto_17944 ) ( not ( = ?auto_17966 ?auto_17950 ) ) ( HOIST-AT ?auto_17962 ?auto_17966 ) ( AVAILABLE ?auto_17962 ) ( SURFACE-AT ?auto_17944 ?auto_17966 ) ( ON ?auto_17944 ?auto_17963 ) ( CLEAR ?auto_17944 ) ( not ( = ?auto_17943 ?auto_17944 ) ) ( not ( = ?auto_17943 ?auto_17963 ) ) ( not ( = ?auto_17944 ?auto_17963 ) ) ( not ( = ?auto_17953 ?auto_17962 ) ) ( IS-CRATE ?auto_17943 ) ( not ( = ?auto_17965 ?auto_17950 ) ) ( HOIST-AT ?auto_17959 ?auto_17965 ) ( AVAILABLE ?auto_17959 ) ( SURFACE-AT ?auto_17943 ?auto_17965 ) ( ON ?auto_17943 ?auto_17967 ) ( CLEAR ?auto_17943 ) ( not ( = ?auto_17942 ?auto_17943 ) ) ( not ( = ?auto_17942 ?auto_17967 ) ) ( not ( = ?auto_17943 ?auto_17967 ) ) ( not ( = ?auto_17953 ?auto_17959 ) ) ( SURFACE-AT ?auto_17941 ?auto_17950 ) ( CLEAR ?auto_17941 ) ( IS-CRATE ?auto_17942 ) ( AVAILABLE ?auto_17953 ) ( not ( = ?auto_17954 ?auto_17950 ) ) ( HOIST-AT ?auto_17955 ?auto_17954 ) ( AVAILABLE ?auto_17955 ) ( SURFACE-AT ?auto_17942 ?auto_17954 ) ( ON ?auto_17942 ?auto_17968 ) ( CLEAR ?auto_17942 ) ( TRUCK-AT ?auto_17952 ?auto_17950 ) ( not ( = ?auto_17941 ?auto_17942 ) ) ( not ( = ?auto_17941 ?auto_17968 ) ) ( not ( = ?auto_17942 ?auto_17968 ) ) ( not ( = ?auto_17953 ?auto_17955 ) ) ( not ( = ?auto_17941 ?auto_17943 ) ) ( not ( = ?auto_17941 ?auto_17967 ) ) ( not ( = ?auto_17943 ?auto_17968 ) ) ( not ( = ?auto_17965 ?auto_17954 ) ) ( not ( = ?auto_17959 ?auto_17955 ) ) ( not ( = ?auto_17967 ?auto_17968 ) ) ( not ( = ?auto_17941 ?auto_17944 ) ) ( not ( = ?auto_17941 ?auto_17963 ) ) ( not ( = ?auto_17942 ?auto_17944 ) ) ( not ( = ?auto_17942 ?auto_17963 ) ) ( not ( = ?auto_17944 ?auto_17967 ) ) ( not ( = ?auto_17944 ?auto_17968 ) ) ( not ( = ?auto_17966 ?auto_17965 ) ) ( not ( = ?auto_17966 ?auto_17954 ) ) ( not ( = ?auto_17962 ?auto_17959 ) ) ( not ( = ?auto_17962 ?auto_17955 ) ) ( not ( = ?auto_17963 ?auto_17967 ) ) ( not ( = ?auto_17963 ?auto_17968 ) ) ( not ( = ?auto_17941 ?auto_17945 ) ) ( not ( = ?auto_17941 ?auto_17961 ) ) ( not ( = ?auto_17942 ?auto_17945 ) ) ( not ( = ?auto_17942 ?auto_17961 ) ) ( not ( = ?auto_17943 ?auto_17945 ) ) ( not ( = ?auto_17943 ?auto_17961 ) ) ( not ( = ?auto_17945 ?auto_17963 ) ) ( not ( = ?auto_17945 ?auto_17967 ) ) ( not ( = ?auto_17945 ?auto_17968 ) ) ( not ( = ?auto_17964 ?auto_17966 ) ) ( not ( = ?auto_17964 ?auto_17965 ) ) ( not ( = ?auto_17964 ?auto_17954 ) ) ( not ( = ?auto_17960 ?auto_17962 ) ) ( not ( = ?auto_17960 ?auto_17959 ) ) ( not ( = ?auto_17960 ?auto_17955 ) ) ( not ( = ?auto_17961 ?auto_17963 ) ) ( not ( = ?auto_17961 ?auto_17967 ) ) ( not ( = ?auto_17961 ?auto_17968 ) ) ( not ( = ?auto_17941 ?auto_17946 ) ) ( not ( = ?auto_17941 ?auto_17956 ) ) ( not ( = ?auto_17942 ?auto_17946 ) ) ( not ( = ?auto_17942 ?auto_17956 ) ) ( not ( = ?auto_17943 ?auto_17946 ) ) ( not ( = ?auto_17943 ?auto_17956 ) ) ( not ( = ?auto_17944 ?auto_17946 ) ) ( not ( = ?auto_17944 ?auto_17956 ) ) ( not ( = ?auto_17946 ?auto_17961 ) ) ( not ( = ?auto_17946 ?auto_17963 ) ) ( not ( = ?auto_17946 ?auto_17967 ) ) ( not ( = ?auto_17946 ?auto_17968 ) ) ( not ( = ?auto_17957 ?auto_17964 ) ) ( not ( = ?auto_17957 ?auto_17966 ) ) ( not ( = ?auto_17957 ?auto_17965 ) ) ( not ( = ?auto_17957 ?auto_17954 ) ) ( not ( = ?auto_17958 ?auto_17960 ) ) ( not ( = ?auto_17958 ?auto_17962 ) ) ( not ( = ?auto_17958 ?auto_17959 ) ) ( not ( = ?auto_17958 ?auto_17955 ) ) ( not ( = ?auto_17956 ?auto_17961 ) ) ( not ( = ?auto_17956 ?auto_17963 ) ) ( not ( = ?auto_17956 ?auto_17967 ) ) ( not ( = ?auto_17956 ?auto_17968 ) ) ( not ( = ?auto_17941 ?auto_17947 ) ) ( not ( = ?auto_17941 ?auto_17951 ) ) ( not ( = ?auto_17942 ?auto_17947 ) ) ( not ( = ?auto_17942 ?auto_17951 ) ) ( not ( = ?auto_17943 ?auto_17947 ) ) ( not ( = ?auto_17943 ?auto_17951 ) ) ( not ( = ?auto_17944 ?auto_17947 ) ) ( not ( = ?auto_17944 ?auto_17951 ) ) ( not ( = ?auto_17945 ?auto_17947 ) ) ( not ( = ?auto_17945 ?auto_17951 ) ) ( not ( = ?auto_17947 ?auto_17956 ) ) ( not ( = ?auto_17947 ?auto_17961 ) ) ( not ( = ?auto_17947 ?auto_17963 ) ) ( not ( = ?auto_17947 ?auto_17967 ) ) ( not ( = ?auto_17947 ?auto_17968 ) ) ( not ( = ?auto_17949 ?auto_17957 ) ) ( not ( = ?auto_17949 ?auto_17964 ) ) ( not ( = ?auto_17949 ?auto_17966 ) ) ( not ( = ?auto_17949 ?auto_17965 ) ) ( not ( = ?auto_17949 ?auto_17954 ) ) ( not ( = ?auto_17948 ?auto_17958 ) ) ( not ( = ?auto_17948 ?auto_17960 ) ) ( not ( = ?auto_17948 ?auto_17962 ) ) ( not ( = ?auto_17948 ?auto_17959 ) ) ( not ( = ?auto_17948 ?auto_17955 ) ) ( not ( = ?auto_17951 ?auto_17956 ) ) ( not ( = ?auto_17951 ?auto_17961 ) ) ( not ( = ?auto_17951 ?auto_17963 ) ) ( not ( = ?auto_17951 ?auto_17967 ) ) ( not ( = ?auto_17951 ?auto_17968 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ?auto_17945 ?auto_17946 )
      ( MAKE-1CRATE ?auto_17946 ?auto_17947 )
      ( MAKE-6CRATE-VERIFY ?auto_17941 ?auto_17942 ?auto_17943 ?auto_17944 ?auto_17945 ?auto_17946 ?auto_17947 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_17971 - SURFACE
      ?auto_17972 - SURFACE
    )
    :vars
    (
      ?auto_17973 - HOIST
      ?auto_17974 - PLACE
      ?auto_17976 - PLACE
      ?auto_17977 - HOIST
      ?auto_17978 - SURFACE
      ?auto_17975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_17973 ?auto_17974 ) ( SURFACE-AT ?auto_17971 ?auto_17974 ) ( CLEAR ?auto_17971 ) ( IS-CRATE ?auto_17972 ) ( AVAILABLE ?auto_17973 ) ( not ( = ?auto_17976 ?auto_17974 ) ) ( HOIST-AT ?auto_17977 ?auto_17976 ) ( AVAILABLE ?auto_17977 ) ( SURFACE-AT ?auto_17972 ?auto_17976 ) ( ON ?auto_17972 ?auto_17978 ) ( CLEAR ?auto_17972 ) ( TRUCK-AT ?auto_17975 ?auto_17974 ) ( not ( = ?auto_17971 ?auto_17972 ) ) ( not ( = ?auto_17971 ?auto_17978 ) ) ( not ( = ?auto_17972 ?auto_17978 ) ) ( not ( = ?auto_17973 ?auto_17977 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_17975 ?auto_17974 ?auto_17976 )
      ( !LIFT ?auto_17977 ?auto_17972 ?auto_17978 ?auto_17976 )
      ( !LOAD ?auto_17977 ?auto_17972 ?auto_17975 ?auto_17976 )
      ( !DRIVE ?auto_17975 ?auto_17976 ?auto_17974 )
      ( !UNLOAD ?auto_17973 ?auto_17972 ?auto_17975 ?auto_17974 )
      ( !DROP ?auto_17973 ?auto_17972 ?auto_17971 ?auto_17974 )
      ( MAKE-1CRATE-VERIFY ?auto_17971 ?auto_17972 ) )
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
      ?auto_17994 - SURFACE
      ?auto_17993 - SURFACE
    )
    :vars
    (
      ?auto_18000 - HOIST
      ?auto_17998 - PLACE
      ?auto_17999 - PLACE
      ?auto_17995 - HOIST
      ?auto_17997 - SURFACE
      ?auto_18002 - PLACE
      ?auto_18001 - HOIST
      ?auto_18003 - SURFACE
      ?auto_18013 - PLACE
      ?auto_18007 - HOIST
      ?auto_18015 - SURFACE
      ?auto_18008 - PLACE
      ?auto_18005 - HOIST
      ?auto_18004 - SURFACE
      ?auto_18011 - PLACE
      ?auto_18014 - HOIST
      ?auto_18009 - SURFACE
      ?auto_18010 - PLACE
      ?auto_18006 - HOIST
      ?auto_18012 - SURFACE
      ?auto_18017 - PLACE
      ?auto_18016 - HOIST
      ?auto_18018 - SURFACE
      ?auto_17996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18000 ?auto_17998 ) ( IS-CRATE ?auto_17993 ) ( not ( = ?auto_17999 ?auto_17998 ) ) ( HOIST-AT ?auto_17995 ?auto_17999 ) ( AVAILABLE ?auto_17995 ) ( SURFACE-AT ?auto_17993 ?auto_17999 ) ( ON ?auto_17993 ?auto_17997 ) ( CLEAR ?auto_17993 ) ( not ( = ?auto_17994 ?auto_17993 ) ) ( not ( = ?auto_17994 ?auto_17997 ) ) ( not ( = ?auto_17993 ?auto_17997 ) ) ( not ( = ?auto_18000 ?auto_17995 ) ) ( IS-CRATE ?auto_17994 ) ( not ( = ?auto_18002 ?auto_17998 ) ) ( HOIST-AT ?auto_18001 ?auto_18002 ) ( AVAILABLE ?auto_18001 ) ( SURFACE-AT ?auto_17994 ?auto_18002 ) ( ON ?auto_17994 ?auto_18003 ) ( CLEAR ?auto_17994 ) ( not ( = ?auto_17992 ?auto_17994 ) ) ( not ( = ?auto_17992 ?auto_18003 ) ) ( not ( = ?auto_17994 ?auto_18003 ) ) ( not ( = ?auto_18000 ?auto_18001 ) ) ( IS-CRATE ?auto_17992 ) ( not ( = ?auto_18013 ?auto_17998 ) ) ( HOIST-AT ?auto_18007 ?auto_18013 ) ( AVAILABLE ?auto_18007 ) ( SURFACE-AT ?auto_17992 ?auto_18013 ) ( ON ?auto_17992 ?auto_18015 ) ( CLEAR ?auto_17992 ) ( not ( = ?auto_17991 ?auto_17992 ) ) ( not ( = ?auto_17991 ?auto_18015 ) ) ( not ( = ?auto_17992 ?auto_18015 ) ) ( not ( = ?auto_18000 ?auto_18007 ) ) ( IS-CRATE ?auto_17991 ) ( not ( = ?auto_18008 ?auto_17998 ) ) ( HOIST-AT ?auto_18005 ?auto_18008 ) ( AVAILABLE ?auto_18005 ) ( SURFACE-AT ?auto_17991 ?auto_18008 ) ( ON ?auto_17991 ?auto_18004 ) ( CLEAR ?auto_17991 ) ( not ( = ?auto_17990 ?auto_17991 ) ) ( not ( = ?auto_17990 ?auto_18004 ) ) ( not ( = ?auto_17991 ?auto_18004 ) ) ( not ( = ?auto_18000 ?auto_18005 ) ) ( IS-CRATE ?auto_17990 ) ( not ( = ?auto_18011 ?auto_17998 ) ) ( HOIST-AT ?auto_18014 ?auto_18011 ) ( AVAILABLE ?auto_18014 ) ( SURFACE-AT ?auto_17990 ?auto_18011 ) ( ON ?auto_17990 ?auto_18009 ) ( CLEAR ?auto_17990 ) ( not ( = ?auto_17989 ?auto_17990 ) ) ( not ( = ?auto_17989 ?auto_18009 ) ) ( not ( = ?auto_17990 ?auto_18009 ) ) ( not ( = ?auto_18000 ?auto_18014 ) ) ( IS-CRATE ?auto_17989 ) ( not ( = ?auto_18010 ?auto_17998 ) ) ( HOIST-AT ?auto_18006 ?auto_18010 ) ( AVAILABLE ?auto_18006 ) ( SURFACE-AT ?auto_17989 ?auto_18010 ) ( ON ?auto_17989 ?auto_18012 ) ( CLEAR ?auto_17989 ) ( not ( = ?auto_17988 ?auto_17989 ) ) ( not ( = ?auto_17988 ?auto_18012 ) ) ( not ( = ?auto_17989 ?auto_18012 ) ) ( not ( = ?auto_18000 ?auto_18006 ) ) ( SURFACE-AT ?auto_17987 ?auto_17998 ) ( CLEAR ?auto_17987 ) ( IS-CRATE ?auto_17988 ) ( AVAILABLE ?auto_18000 ) ( not ( = ?auto_18017 ?auto_17998 ) ) ( HOIST-AT ?auto_18016 ?auto_18017 ) ( AVAILABLE ?auto_18016 ) ( SURFACE-AT ?auto_17988 ?auto_18017 ) ( ON ?auto_17988 ?auto_18018 ) ( CLEAR ?auto_17988 ) ( TRUCK-AT ?auto_17996 ?auto_17998 ) ( not ( = ?auto_17987 ?auto_17988 ) ) ( not ( = ?auto_17987 ?auto_18018 ) ) ( not ( = ?auto_17988 ?auto_18018 ) ) ( not ( = ?auto_18000 ?auto_18016 ) ) ( not ( = ?auto_17987 ?auto_17989 ) ) ( not ( = ?auto_17987 ?auto_18012 ) ) ( not ( = ?auto_17989 ?auto_18018 ) ) ( not ( = ?auto_18010 ?auto_18017 ) ) ( not ( = ?auto_18006 ?auto_18016 ) ) ( not ( = ?auto_18012 ?auto_18018 ) ) ( not ( = ?auto_17987 ?auto_17990 ) ) ( not ( = ?auto_17987 ?auto_18009 ) ) ( not ( = ?auto_17988 ?auto_17990 ) ) ( not ( = ?auto_17988 ?auto_18009 ) ) ( not ( = ?auto_17990 ?auto_18012 ) ) ( not ( = ?auto_17990 ?auto_18018 ) ) ( not ( = ?auto_18011 ?auto_18010 ) ) ( not ( = ?auto_18011 ?auto_18017 ) ) ( not ( = ?auto_18014 ?auto_18006 ) ) ( not ( = ?auto_18014 ?auto_18016 ) ) ( not ( = ?auto_18009 ?auto_18012 ) ) ( not ( = ?auto_18009 ?auto_18018 ) ) ( not ( = ?auto_17987 ?auto_17991 ) ) ( not ( = ?auto_17987 ?auto_18004 ) ) ( not ( = ?auto_17988 ?auto_17991 ) ) ( not ( = ?auto_17988 ?auto_18004 ) ) ( not ( = ?auto_17989 ?auto_17991 ) ) ( not ( = ?auto_17989 ?auto_18004 ) ) ( not ( = ?auto_17991 ?auto_18009 ) ) ( not ( = ?auto_17991 ?auto_18012 ) ) ( not ( = ?auto_17991 ?auto_18018 ) ) ( not ( = ?auto_18008 ?auto_18011 ) ) ( not ( = ?auto_18008 ?auto_18010 ) ) ( not ( = ?auto_18008 ?auto_18017 ) ) ( not ( = ?auto_18005 ?auto_18014 ) ) ( not ( = ?auto_18005 ?auto_18006 ) ) ( not ( = ?auto_18005 ?auto_18016 ) ) ( not ( = ?auto_18004 ?auto_18009 ) ) ( not ( = ?auto_18004 ?auto_18012 ) ) ( not ( = ?auto_18004 ?auto_18018 ) ) ( not ( = ?auto_17987 ?auto_17992 ) ) ( not ( = ?auto_17987 ?auto_18015 ) ) ( not ( = ?auto_17988 ?auto_17992 ) ) ( not ( = ?auto_17988 ?auto_18015 ) ) ( not ( = ?auto_17989 ?auto_17992 ) ) ( not ( = ?auto_17989 ?auto_18015 ) ) ( not ( = ?auto_17990 ?auto_17992 ) ) ( not ( = ?auto_17990 ?auto_18015 ) ) ( not ( = ?auto_17992 ?auto_18004 ) ) ( not ( = ?auto_17992 ?auto_18009 ) ) ( not ( = ?auto_17992 ?auto_18012 ) ) ( not ( = ?auto_17992 ?auto_18018 ) ) ( not ( = ?auto_18013 ?auto_18008 ) ) ( not ( = ?auto_18013 ?auto_18011 ) ) ( not ( = ?auto_18013 ?auto_18010 ) ) ( not ( = ?auto_18013 ?auto_18017 ) ) ( not ( = ?auto_18007 ?auto_18005 ) ) ( not ( = ?auto_18007 ?auto_18014 ) ) ( not ( = ?auto_18007 ?auto_18006 ) ) ( not ( = ?auto_18007 ?auto_18016 ) ) ( not ( = ?auto_18015 ?auto_18004 ) ) ( not ( = ?auto_18015 ?auto_18009 ) ) ( not ( = ?auto_18015 ?auto_18012 ) ) ( not ( = ?auto_18015 ?auto_18018 ) ) ( not ( = ?auto_17987 ?auto_17994 ) ) ( not ( = ?auto_17987 ?auto_18003 ) ) ( not ( = ?auto_17988 ?auto_17994 ) ) ( not ( = ?auto_17988 ?auto_18003 ) ) ( not ( = ?auto_17989 ?auto_17994 ) ) ( not ( = ?auto_17989 ?auto_18003 ) ) ( not ( = ?auto_17990 ?auto_17994 ) ) ( not ( = ?auto_17990 ?auto_18003 ) ) ( not ( = ?auto_17991 ?auto_17994 ) ) ( not ( = ?auto_17991 ?auto_18003 ) ) ( not ( = ?auto_17994 ?auto_18015 ) ) ( not ( = ?auto_17994 ?auto_18004 ) ) ( not ( = ?auto_17994 ?auto_18009 ) ) ( not ( = ?auto_17994 ?auto_18012 ) ) ( not ( = ?auto_17994 ?auto_18018 ) ) ( not ( = ?auto_18002 ?auto_18013 ) ) ( not ( = ?auto_18002 ?auto_18008 ) ) ( not ( = ?auto_18002 ?auto_18011 ) ) ( not ( = ?auto_18002 ?auto_18010 ) ) ( not ( = ?auto_18002 ?auto_18017 ) ) ( not ( = ?auto_18001 ?auto_18007 ) ) ( not ( = ?auto_18001 ?auto_18005 ) ) ( not ( = ?auto_18001 ?auto_18014 ) ) ( not ( = ?auto_18001 ?auto_18006 ) ) ( not ( = ?auto_18001 ?auto_18016 ) ) ( not ( = ?auto_18003 ?auto_18015 ) ) ( not ( = ?auto_18003 ?auto_18004 ) ) ( not ( = ?auto_18003 ?auto_18009 ) ) ( not ( = ?auto_18003 ?auto_18012 ) ) ( not ( = ?auto_18003 ?auto_18018 ) ) ( not ( = ?auto_17987 ?auto_17993 ) ) ( not ( = ?auto_17987 ?auto_17997 ) ) ( not ( = ?auto_17988 ?auto_17993 ) ) ( not ( = ?auto_17988 ?auto_17997 ) ) ( not ( = ?auto_17989 ?auto_17993 ) ) ( not ( = ?auto_17989 ?auto_17997 ) ) ( not ( = ?auto_17990 ?auto_17993 ) ) ( not ( = ?auto_17990 ?auto_17997 ) ) ( not ( = ?auto_17991 ?auto_17993 ) ) ( not ( = ?auto_17991 ?auto_17997 ) ) ( not ( = ?auto_17992 ?auto_17993 ) ) ( not ( = ?auto_17992 ?auto_17997 ) ) ( not ( = ?auto_17993 ?auto_18003 ) ) ( not ( = ?auto_17993 ?auto_18015 ) ) ( not ( = ?auto_17993 ?auto_18004 ) ) ( not ( = ?auto_17993 ?auto_18009 ) ) ( not ( = ?auto_17993 ?auto_18012 ) ) ( not ( = ?auto_17993 ?auto_18018 ) ) ( not ( = ?auto_17999 ?auto_18002 ) ) ( not ( = ?auto_17999 ?auto_18013 ) ) ( not ( = ?auto_17999 ?auto_18008 ) ) ( not ( = ?auto_17999 ?auto_18011 ) ) ( not ( = ?auto_17999 ?auto_18010 ) ) ( not ( = ?auto_17999 ?auto_18017 ) ) ( not ( = ?auto_17995 ?auto_18001 ) ) ( not ( = ?auto_17995 ?auto_18007 ) ) ( not ( = ?auto_17995 ?auto_18005 ) ) ( not ( = ?auto_17995 ?auto_18014 ) ) ( not ( = ?auto_17995 ?auto_18006 ) ) ( not ( = ?auto_17995 ?auto_18016 ) ) ( not ( = ?auto_17997 ?auto_18003 ) ) ( not ( = ?auto_17997 ?auto_18015 ) ) ( not ( = ?auto_17997 ?auto_18004 ) ) ( not ( = ?auto_17997 ?auto_18009 ) ) ( not ( = ?auto_17997 ?auto_18012 ) ) ( not ( = ?auto_17997 ?auto_18018 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_17987 ?auto_17988 ?auto_17989 ?auto_17990 ?auto_17991 ?auto_17992 ?auto_17994 )
      ( MAKE-1CRATE ?auto_17994 ?auto_17993 )
      ( MAKE-7CRATE-VERIFY ?auto_17987 ?auto_17988 ?auto_17989 ?auto_17990 ?auto_17991 ?auto_17992 ?auto_17994 ?auto_17993 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18021 - SURFACE
      ?auto_18022 - SURFACE
    )
    :vars
    (
      ?auto_18023 - HOIST
      ?auto_18024 - PLACE
      ?auto_18026 - PLACE
      ?auto_18027 - HOIST
      ?auto_18028 - SURFACE
      ?auto_18025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18023 ?auto_18024 ) ( SURFACE-AT ?auto_18021 ?auto_18024 ) ( CLEAR ?auto_18021 ) ( IS-CRATE ?auto_18022 ) ( AVAILABLE ?auto_18023 ) ( not ( = ?auto_18026 ?auto_18024 ) ) ( HOIST-AT ?auto_18027 ?auto_18026 ) ( AVAILABLE ?auto_18027 ) ( SURFACE-AT ?auto_18022 ?auto_18026 ) ( ON ?auto_18022 ?auto_18028 ) ( CLEAR ?auto_18022 ) ( TRUCK-AT ?auto_18025 ?auto_18024 ) ( not ( = ?auto_18021 ?auto_18022 ) ) ( not ( = ?auto_18021 ?auto_18028 ) ) ( not ( = ?auto_18022 ?auto_18028 ) ) ( not ( = ?auto_18023 ?auto_18027 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18025 ?auto_18024 ?auto_18026 )
      ( !LIFT ?auto_18027 ?auto_18022 ?auto_18028 ?auto_18026 )
      ( !LOAD ?auto_18027 ?auto_18022 ?auto_18025 ?auto_18026 )
      ( !DRIVE ?auto_18025 ?auto_18026 ?auto_18024 )
      ( !UNLOAD ?auto_18023 ?auto_18022 ?auto_18025 ?auto_18024 )
      ( !DROP ?auto_18023 ?auto_18022 ?auto_18021 ?auto_18024 )
      ( MAKE-1CRATE-VERIFY ?auto_18021 ?auto_18022 ) )
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
      ?auto_18046 - SURFACE
      ?auto_18045 - SURFACE
      ?auto_18044 - SURFACE
    )
    :vars
    (
      ?auto_18051 - HOIST
      ?auto_18052 - PLACE
      ?auto_18050 - PLACE
      ?auto_18047 - HOIST
      ?auto_18048 - SURFACE
      ?auto_18065 - SURFACE
      ?auto_18070 - PLACE
      ?auto_18055 - HOIST
      ?auto_18071 - SURFACE
      ?auto_18061 - PLACE
      ?auto_18067 - HOIST
      ?auto_18053 - SURFACE
      ?auto_18066 - PLACE
      ?auto_18064 - HOIST
      ?auto_18069 - SURFACE
      ?auto_18060 - PLACE
      ?auto_18063 - HOIST
      ?auto_18059 - SURFACE
      ?auto_18058 - PLACE
      ?auto_18068 - HOIST
      ?auto_18062 - SURFACE
      ?auto_18056 - PLACE
      ?auto_18057 - HOIST
      ?auto_18054 - SURFACE
      ?auto_18049 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18051 ?auto_18052 ) ( IS-CRATE ?auto_18044 ) ( not ( = ?auto_18050 ?auto_18052 ) ) ( HOIST-AT ?auto_18047 ?auto_18050 ) ( SURFACE-AT ?auto_18044 ?auto_18050 ) ( ON ?auto_18044 ?auto_18048 ) ( CLEAR ?auto_18044 ) ( not ( = ?auto_18045 ?auto_18044 ) ) ( not ( = ?auto_18045 ?auto_18048 ) ) ( not ( = ?auto_18044 ?auto_18048 ) ) ( not ( = ?auto_18051 ?auto_18047 ) ) ( IS-CRATE ?auto_18045 ) ( AVAILABLE ?auto_18047 ) ( SURFACE-AT ?auto_18045 ?auto_18050 ) ( ON ?auto_18045 ?auto_18065 ) ( CLEAR ?auto_18045 ) ( not ( = ?auto_18046 ?auto_18045 ) ) ( not ( = ?auto_18046 ?auto_18065 ) ) ( not ( = ?auto_18045 ?auto_18065 ) ) ( IS-CRATE ?auto_18046 ) ( not ( = ?auto_18070 ?auto_18052 ) ) ( HOIST-AT ?auto_18055 ?auto_18070 ) ( AVAILABLE ?auto_18055 ) ( SURFACE-AT ?auto_18046 ?auto_18070 ) ( ON ?auto_18046 ?auto_18071 ) ( CLEAR ?auto_18046 ) ( not ( = ?auto_18043 ?auto_18046 ) ) ( not ( = ?auto_18043 ?auto_18071 ) ) ( not ( = ?auto_18046 ?auto_18071 ) ) ( not ( = ?auto_18051 ?auto_18055 ) ) ( IS-CRATE ?auto_18043 ) ( not ( = ?auto_18061 ?auto_18052 ) ) ( HOIST-AT ?auto_18067 ?auto_18061 ) ( AVAILABLE ?auto_18067 ) ( SURFACE-AT ?auto_18043 ?auto_18061 ) ( ON ?auto_18043 ?auto_18053 ) ( CLEAR ?auto_18043 ) ( not ( = ?auto_18042 ?auto_18043 ) ) ( not ( = ?auto_18042 ?auto_18053 ) ) ( not ( = ?auto_18043 ?auto_18053 ) ) ( not ( = ?auto_18051 ?auto_18067 ) ) ( IS-CRATE ?auto_18042 ) ( not ( = ?auto_18066 ?auto_18052 ) ) ( HOIST-AT ?auto_18064 ?auto_18066 ) ( AVAILABLE ?auto_18064 ) ( SURFACE-AT ?auto_18042 ?auto_18066 ) ( ON ?auto_18042 ?auto_18069 ) ( CLEAR ?auto_18042 ) ( not ( = ?auto_18041 ?auto_18042 ) ) ( not ( = ?auto_18041 ?auto_18069 ) ) ( not ( = ?auto_18042 ?auto_18069 ) ) ( not ( = ?auto_18051 ?auto_18064 ) ) ( IS-CRATE ?auto_18041 ) ( not ( = ?auto_18060 ?auto_18052 ) ) ( HOIST-AT ?auto_18063 ?auto_18060 ) ( AVAILABLE ?auto_18063 ) ( SURFACE-AT ?auto_18041 ?auto_18060 ) ( ON ?auto_18041 ?auto_18059 ) ( CLEAR ?auto_18041 ) ( not ( = ?auto_18040 ?auto_18041 ) ) ( not ( = ?auto_18040 ?auto_18059 ) ) ( not ( = ?auto_18041 ?auto_18059 ) ) ( not ( = ?auto_18051 ?auto_18063 ) ) ( IS-CRATE ?auto_18040 ) ( not ( = ?auto_18058 ?auto_18052 ) ) ( HOIST-AT ?auto_18068 ?auto_18058 ) ( AVAILABLE ?auto_18068 ) ( SURFACE-AT ?auto_18040 ?auto_18058 ) ( ON ?auto_18040 ?auto_18062 ) ( CLEAR ?auto_18040 ) ( not ( = ?auto_18039 ?auto_18040 ) ) ( not ( = ?auto_18039 ?auto_18062 ) ) ( not ( = ?auto_18040 ?auto_18062 ) ) ( not ( = ?auto_18051 ?auto_18068 ) ) ( SURFACE-AT ?auto_18038 ?auto_18052 ) ( CLEAR ?auto_18038 ) ( IS-CRATE ?auto_18039 ) ( AVAILABLE ?auto_18051 ) ( not ( = ?auto_18056 ?auto_18052 ) ) ( HOIST-AT ?auto_18057 ?auto_18056 ) ( AVAILABLE ?auto_18057 ) ( SURFACE-AT ?auto_18039 ?auto_18056 ) ( ON ?auto_18039 ?auto_18054 ) ( CLEAR ?auto_18039 ) ( TRUCK-AT ?auto_18049 ?auto_18052 ) ( not ( = ?auto_18038 ?auto_18039 ) ) ( not ( = ?auto_18038 ?auto_18054 ) ) ( not ( = ?auto_18039 ?auto_18054 ) ) ( not ( = ?auto_18051 ?auto_18057 ) ) ( not ( = ?auto_18038 ?auto_18040 ) ) ( not ( = ?auto_18038 ?auto_18062 ) ) ( not ( = ?auto_18040 ?auto_18054 ) ) ( not ( = ?auto_18058 ?auto_18056 ) ) ( not ( = ?auto_18068 ?auto_18057 ) ) ( not ( = ?auto_18062 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18041 ) ) ( not ( = ?auto_18038 ?auto_18059 ) ) ( not ( = ?auto_18039 ?auto_18041 ) ) ( not ( = ?auto_18039 ?auto_18059 ) ) ( not ( = ?auto_18041 ?auto_18062 ) ) ( not ( = ?auto_18041 ?auto_18054 ) ) ( not ( = ?auto_18060 ?auto_18058 ) ) ( not ( = ?auto_18060 ?auto_18056 ) ) ( not ( = ?auto_18063 ?auto_18068 ) ) ( not ( = ?auto_18063 ?auto_18057 ) ) ( not ( = ?auto_18059 ?auto_18062 ) ) ( not ( = ?auto_18059 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18042 ) ) ( not ( = ?auto_18038 ?auto_18069 ) ) ( not ( = ?auto_18039 ?auto_18042 ) ) ( not ( = ?auto_18039 ?auto_18069 ) ) ( not ( = ?auto_18040 ?auto_18042 ) ) ( not ( = ?auto_18040 ?auto_18069 ) ) ( not ( = ?auto_18042 ?auto_18059 ) ) ( not ( = ?auto_18042 ?auto_18062 ) ) ( not ( = ?auto_18042 ?auto_18054 ) ) ( not ( = ?auto_18066 ?auto_18060 ) ) ( not ( = ?auto_18066 ?auto_18058 ) ) ( not ( = ?auto_18066 ?auto_18056 ) ) ( not ( = ?auto_18064 ?auto_18063 ) ) ( not ( = ?auto_18064 ?auto_18068 ) ) ( not ( = ?auto_18064 ?auto_18057 ) ) ( not ( = ?auto_18069 ?auto_18059 ) ) ( not ( = ?auto_18069 ?auto_18062 ) ) ( not ( = ?auto_18069 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18043 ) ) ( not ( = ?auto_18038 ?auto_18053 ) ) ( not ( = ?auto_18039 ?auto_18043 ) ) ( not ( = ?auto_18039 ?auto_18053 ) ) ( not ( = ?auto_18040 ?auto_18043 ) ) ( not ( = ?auto_18040 ?auto_18053 ) ) ( not ( = ?auto_18041 ?auto_18043 ) ) ( not ( = ?auto_18041 ?auto_18053 ) ) ( not ( = ?auto_18043 ?auto_18069 ) ) ( not ( = ?auto_18043 ?auto_18059 ) ) ( not ( = ?auto_18043 ?auto_18062 ) ) ( not ( = ?auto_18043 ?auto_18054 ) ) ( not ( = ?auto_18061 ?auto_18066 ) ) ( not ( = ?auto_18061 ?auto_18060 ) ) ( not ( = ?auto_18061 ?auto_18058 ) ) ( not ( = ?auto_18061 ?auto_18056 ) ) ( not ( = ?auto_18067 ?auto_18064 ) ) ( not ( = ?auto_18067 ?auto_18063 ) ) ( not ( = ?auto_18067 ?auto_18068 ) ) ( not ( = ?auto_18067 ?auto_18057 ) ) ( not ( = ?auto_18053 ?auto_18069 ) ) ( not ( = ?auto_18053 ?auto_18059 ) ) ( not ( = ?auto_18053 ?auto_18062 ) ) ( not ( = ?auto_18053 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18046 ) ) ( not ( = ?auto_18038 ?auto_18071 ) ) ( not ( = ?auto_18039 ?auto_18046 ) ) ( not ( = ?auto_18039 ?auto_18071 ) ) ( not ( = ?auto_18040 ?auto_18046 ) ) ( not ( = ?auto_18040 ?auto_18071 ) ) ( not ( = ?auto_18041 ?auto_18046 ) ) ( not ( = ?auto_18041 ?auto_18071 ) ) ( not ( = ?auto_18042 ?auto_18046 ) ) ( not ( = ?auto_18042 ?auto_18071 ) ) ( not ( = ?auto_18046 ?auto_18053 ) ) ( not ( = ?auto_18046 ?auto_18069 ) ) ( not ( = ?auto_18046 ?auto_18059 ) ) ( not ( = ?auto_18046 ?auto_18062 ) ) ( not ( = ?auto_18046 ?auto_18054 ) ) ( not ( = ?auto_18070 ?auto_18061 ) ) ( not ( = ?auto_18070 ?auto_18066 ) ) ( not ( = ?auto_18070 ?auto_18060 ) ) ( not ( = ?auto_18070 ?auto_18058 ) ) ( not ( = ?auto_18070 ?auto_18056 ) ) ( not ( = ?auto_18055 ?auto_18067 ) ) ( not ( = ?auto_18055 ?auto_18064 ) ) ( not ( = ?auto_18055 ?auto_18063 ) ) ( not ( = ?auto_18055 ?auto_18068 ) ) ( not ( = ?auto_18055 ?auto_18057 ) ) ( not ( = ?auto_18071 ?auto_18053 ) ) ( not ( = ?auto_18071 ?auto_18069 ) ) ( not ( = ?auto_18071 ?auto_18059 ) ) ( not ( = ?auto_18071 ?auto_18062 ) ) ( not ( = ?auto_18071 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18045 ) ) ( not ( = ?auto_18038 ?auto_18065 ) ) ( not ( = ?auto_18039 ?auto_18045 ) ) ( not ( = ?auto_18039 ?auto_18065 ) ) ( not ( = ?auto_18040 ?auto_18045 ) ) ( not ( = ?auto_18040 ?auto_18065 ) ) ( not ( = ?auto_18041 ?auto_18045 ) ) ( not ( = ?auto_18041 ?auto_18065 ) ) ( not ( = ?auto_18042 ?auto_18045 ) ) ( not ( = ?auto_18042 ?auto_18065 ) ) ( not ( = ?auto_18043 ?auto_18045 ) ) ( not ( = ?auto_18043 ?auto_18065 ) ) ( not ( = ?auto_18045 ?auto_18071 ) ) ( not ( = ?auto_18045 ?auto_18053 ) ) ( not ( = ?auto_18045 ?auto_18069 ) ) ( not ( = ?auto_18045 ?auto_18059 ) ) ( not ( = ?auto_18045 ?auto_18062 ) ) ( not ( = ?auto_18045 ?auto_18054 ) ) ( not ( = ?auto_18050 ?auto_18070 ) ) ( not ( = ?auto_18050 ?auto_18061 ) ) ( not ( = ?auto_18050 ?auto_18066 ) ) ( not ( = ?auto_18050 ?auto_18060 ) ) ( not ( = ?auto_18050 ?auto_18058 ) ) ( not ( = ?auto_18050 ?auto_18056 ) ) ( not ( = ?auto_18047 ?auto_18055 ) ) ( not ( = ?auto_18047 ?auto_18067 ) ) ( not ( = ?auto_18047 ?auto_18064 ) ) ( not ( = ?auto_18047 ?auto_18063 ) ) ( not ( = ?auto_18047 ?auto_18068 ) ) ( not ( = ?auto_18047 ?auto_18057 ) ) ( not ( = ?auto_18065 ?auto_18071 ) ) ( not ( = ?auto_18065 ?auto_18053 ) ) ( not ( = ?auto_18065 ?auto_18069 ) ) ( not ( = ?auto_18065 ?auto_18059 ) ) ( not ( = ?auto_18065 ?auto_18062 ) ) ( not ( = ?auto_18065 ?auto_18054 ) ) ( not ( = ?auto_18038 ?auto_18044 ) ) ( not ( = ?auto_18038 ?auto_18048 ) ) ( not ( = ?auto_18039 ?auto_18044 ) ) ( not ( = ?auto_18039 ?auto_18048 ) ) ( not ( = ?auto_18040 ?auto_18044 ) ) ( not ( = ?auto_18040 ?auto_18048 ) ) ( not ( = ?auto_18041 ?auto_18044 ) ) ( not ( = ?auto_18041 ?auto_18048 ) ) ( not ( = ?auto_18042 ?auto_18044 ) ) ( not ( = ?auto_18042 ?auto_18048 ) ) ( not ( = ?auto_18043 ?auto_18044 ) ) ( not ( = ?auto_18043 ?auto_18048 ) ) ( not ( = ?auto_18046 ?auto_18044 ) ) ( not ( = ?auto_18046 ?auto_18048 ) ) ( not ( = ?auto_18044 ?auto_18065 ) ) ( not ( = ?auto_18044 ?auto_18071 ) ) ( not ( = ?auto_18044 ?auto_18053 ) ) ( not ( = ?auto_18044 ?auto_18069 ) ) ( not ( = ?auto_18044 ?auto_18059 ) ) ( not ( = ?auto_18044 ?auto_18062 ) ) ( not ( = ?auto_18044 ?auto_18054 ) ) ( not ( = ?auto_18048 ?auto_18065 ) ) ( not ( = ?auto_18048 ?auto_18071 ) ) ( not ( = ?auto_18048 ?auto_18053 ) ) ( not ( = ?auto_18048 ?auto_18069 ) ) ( not ( = ?auto_18048 ?auto_18059 ) ) ( not ( = ?auto_18048 ?auto_18062 ) ) ( not ( = ?auto_18048 ?auto_18054 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_18038 ?auto_18039 ?auto_18040 ?auto_18041 ?auto_18042 ?auto_18043 ?auto_18046 ?auto_18045 )
      ( MAKE-1CRATE ?auto_18045 ?auto_18044 )
      ( MAKE-8CRATE-VERIFY ?auto_18038 ?auto_18039 ?auto_18040 ?auto_18041 ?auto_18042 ?auto_18043 ?auto_18046 ?auto_18045 ?auto_18044 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18074 - SURFACE
      ?auto_18075 - SURFACE
    )
    :vars
    (
      ?auto_18076 - HOIST
      ?auto_18077 - PLACE
      ?auto_18079 - PLACE
      ?auto_18080 - HOIST
      ?auto_18081 - SURFACE
      ?auto_18078 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18076 ?auto_18077 ) ( SURFACE-AT ?auto_18074 ?auto_18077 ) ( CLEAR ?auto_18074 ) ( IS-CRATE ?auto_18075 ) ( AVAILABLE ?auto_18076 ) ( not ( = ?auto_18079 ?auto_18077 ) ) ( HOIST-AT ?auto_18080 ?auto_18079 ) ( AVAILABLE ?auto_18080 ) ( SURFACE-AT ?auto_18075 ?auto_18079 ) ( ON ?auto_18075 ?auto_18081 ) ( CLEAR ?auto_18075 ) ( TRUCK-AT ?auto_18078 ?auto_18077 ) ( not ( = ?auto_18074 ?auto_18075 ) ) ( not ( = ?auto_18074 ?auto_18081 ) ) ( not ( = ?auto_18075 ?auto_18081 ) ) ( not ( = ?auto_18076 ?auto_18080 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18078 ?auto_18077 ?auto_18079 )
      ( !LIFT ?auto_18080 ?auto_18075 ?auto_18081 ?auto_18079 )
      ( !LOAD ?auto_18080 ?auto_18075 ?auto_18078 ?auto_18079 )
      ( !DRIVE ?auto_18078 ?auto_18079 ?auto_18077 )
      ( !UNLOAD ?auto_18076 ?auto_18075 ?auto_18078 ?auto_18077 )
      ( !DROP ?auto_18076 ?auto_18075 ?auto_18074 ?auto_18077 )
      ( MAKE-1CRATE-VERIFY ?auto_18074 ?auto_18075 ) )
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
      ?auto_18100 - SURFACE
      ?auto_18099 - SURFACE
      ?auto_18098 - SURFACE
      ?auto_18101 - SURFACE
    )
    :vars
    (
      ?auto_18102 - HOIST
      ?auto_18103 - PLACE
      ?auto_18105 - PLACE
      ?auto_18104 - HOIST
      ?auto_18106 - SURFACE
      ?auto_18114 - PLACE
      ?auto_18125 - HOIST
      ?auto_18108 - SURFACE
      ?auto_18119 - SURFACE
      ?auto_18109 - PLACE
      ?auto_18128 - HOIST
      ?auto_18112 - SURFACE
      ?auto_18115 - PLACE
      ?auto_18129 - HOIST
      ?auto_18110 - SURFACE
      ?auto_18120 - PLACE
      ?auto_18118 - HOIST
      ?auto_18111 - SURFACE
      ?auto_18121 - PLACE
      ?auto_18116 - HOIST
      ?auto_18122 - SURFACE
      ?auto_18123 - PLACE
      ?auto_18113 - HOIST
      ?auto_18117 - SURFACE
      ?auto_18127 - PLACE
      ?auto_18124 - HOIST
      ?auto_18126 - SURFACE
      ?auto_18107 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18102 ?auto_18103 ) ( IS-CRATE ?auto_18101 ) ( not ( = ?auto_18105 ?auto_18103 ) ) ( HOIST-AT ?auto_18104 ?auto_18105 ) ( AVAILABLE ?auto_18104 ) ( SURFACE-AT ?auto_18101 ?auto_18105 ) ( ON ?auto_18101 ?auto_18106 ) ( CLEAR ?auto_18101 ) ( not ( = ?auto_18098 ?auto_18101 ) ) ( not ( = ?auto_18098 ?auto_18106 ) ) ( not ( = ?auto_18101 ?auto_18106 ) ) ( not ( = ?auto_18102 ?auto_18104 ) ) ( IS-CRATE ?auto_18098 ) ( not ( = ?auto_18114 ?auto_18103 ) ) ( HOIST-AT ?auto_18125 ?auto_18114 ) ( SURFACE-AT ?auto_18098 ?auto_18114 ) ( ON ?auto_18098 ?auto_18108 ) ( CLEAR ?auto_18098 ) ( not ( = ?auto_18099 ?auto_18098 ) ) ( not ( = ?auto_18099 ?auto_18108 ) ) ( not ( = ?auto_18098 ?auto_18108 ) ) ( not ( = ?auto_18102 ?auto_18125 ) ) ( IS-CRATE ?auto_18099 ) ( AVAILABLE ?auto_18125 ) ( SURFACE-AT ?auto_18099 ?auto_18114 ) ( ON ?auto_18099 ?auto_18119 ) ( CLEAR ?auto_18099 ) ( not ( = ?auto_18100 ?auto_18099 ) ) ( not ( = ?auto_18100 ?auto_18119 ) ) ( not ( = ?auto_18099 ?auto_18119 ) ) ( IS-CRATE ?auto_18100 ) ( not ( = ?auto_18109 ?auto_18103 ) ) ( HOIST-AT ?auto_18128 ?auto_18109 ) ( AVAILABLE ?auto_18128 ) ( SURFACE-AT ?auto_18100 ?auto_18109 ) ( ON ?auto_18100 ?auto_18112 ) ( CLEAR ?auto_18100 ) ( not ( = ?auto_18097 ?auto_18100 ) ) ( not ( = ?auto_18097 ?auto_18112 ) ) ( not ( = ?auto_18100 ?auto_18112 ) ) ( not ( = ?auto_18102 ?auto_18128 ) ) ( IS-CRATE ?auto_18097 ) ( not ( = ?auto_18115 ?auto_18103 ) ) ( HOIST-AT ?auto_18129 ?auto_18115 ) ( AVAILABLE ?auto_18129 ) ( SURFACE-AT ?auto_18097 ?auto_18115 ) ( ON ?auto_18097 ?auto_18110 ) ( CLEAR ?auto_18097 ) ( not ( = ?auto_18096 ?auto_18097 ) ) ( not ( = ?auto_18096 ?auto_18110 ) ) ( not ( = ?auto_18097 ?auto_18110 ) ) ( not ( = ?auto_18102 ?auto_18129 ) ) ( IS-CRATE ?auto_18096 ) ( not ( = ?auto_18120 ?auto_18103 ) ) ( HOIST-AT ?auto_18118 ?auto_18120 ) ( AVAILABLE ?auto_18118 ) ( SURFACE-AT ?auto_18096 ?auto_18120 ) ( ON ?auto_18096 ?auto_18111 ) ( CLEAR ?auto_18096 ) ( not ( = ?auto_18095 ?auto_18096 ) ) ( not ( = ?auto_18095 ?auto_18111 ) ) ( not ( = ?auto_18096 ?auto_18111 ) ) ( not ( = ?auto_18102 ?auto_18118 ) ) ( IS-CRATE ?auto_18095 ) ( not ( = ?auto_18121 ?auto_18103 ) ) ( HOIST-AT ?auto_18116 ?auto_18121 ) ( AVAILABLE ?auto_18116 ) ( SURFACE-AT ?auto_18095 ?auto_18121 ) ( ON ?auto_18095 ?auto_18122 ) ( CLEAR ?auto_18095 ) ( not ( = ?auto_18094 ?auto_18095 ) ) ( not ( = ?auto_18094 ?auto_18122 ) ) ( not ( = ?auto_18095 ?auto_18122 ) ) ( not ( = ?auto_18102 ?auto_18116 ) ) ( IS-CRATE ?auto_18094 ) ( not ( = ?auto_18123 ?auto_18103 ) ) ( HOIST-AT ?auto_18113 ?auto_18123 ) ( AVAILABLE ?auto_18113 ) ( SURFACE-AT ?auto_18094 ?auto_18123 ) ( ON ?auto_18094 ?auto_18117 ) ( CLEAR ?auto_18094 ) ( not ( = ?auto_18093 ?auto_18094 ) ) ( not ( = ?auto_18093 ?auto_18117 ) ) ( not ( = ?auto_18094 ?auto_18117 ) ) ( not ( = ?auto_18102 ?auto_18113 ) ) ( SURFACE-AT ?auto_18092 ?auto_18103 ) ( CLEAR ?auto_18092 ) ( IS-CRATE ?auto_18093 ) ( AVAILABLE ?auto_18102 ) ( not ( = ?auto_18127 ?auto_18103 ) ) ( HOIST-AT ?auto_18124 ?auto_18127 ) ( AVAILABLE ?auto_18124 ) ( SURFACE-AT ?auto_18093 ?auto_18127 ) ( ON ?auto_18093 ?auto_18126 ) ( CLEAR ?auto_18093 ) ( TRUCK-AT ?auto_18107 ?auto_18103 ) ( not ( = ?auto_18092 ?auto_18093 ) ) ( not ( = ?auto_18092 ?auto_18126 ) ) ( not ( = ?auto_18093 ?auto_18126 ) ) ( not ( = ?auto_18102 ?auto_18124 ) ) ( not ( = ?auto_18092 ?auto_18094 ) ) ( not ( = ?auto_18092 ?auto_18117 ) ) ( not ( = ?auto_18094 ?auto_18126 ) ) ( not ( = ?auto_18123 ?auto_18127 ) ) ( not ( = ?auto_18113 ?auto_18124 ) ) ( not ( = ?auto_18117 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18095 ) ) ( not ( = ?auto_18092 ?auto_18122 ) ) ( not ( = ?auto_18093 ?auto_18095 ) ) ( not ( = ?auto_18093 ?auto_18122 ) ) ( not ( = ?auto_18095 ?auto_18117 ) ) ( not ( = ?auto_18095 ?auto_18126 ) ) ( not ( = ?auto_18121 ?auto_18123 ) ) ( not ( = ?auto_18121 ?auto_18127 ) ) ( not ( = ?auto_18116 ?auto_18113 ) ) ( not ( = ?auto_18116 ?auto_18124 ) ) ( not ( = ?auto_18122 ?auto_18117 ) ) ( not ( = ?auto_18122 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18096 ) ) ( not ( = ?auto_18092 ?auto_18111 ) ) ( not ( = ?auto_18093 ?auto_18096 ) ) ( not ( = ?auto_18093 ?auto_18111 ) ) ( not ( = ?auto_18094 ?auto_18096 ) ) ( not ( = ?auto_18094 ?auto_18111 ) ) ( not ( = ?auto_18096 ?auto_18122 ) ) ( not ( = ?auto_18096 ?auto_18117 ) ) ( not ( = ?auto_18096 ?auto_18126 ) ) ( not ( = ?auto_18120 ?auto_18121 ) ) ( not ( = ?auto_18120 ?auto_18123 ) ) ( not ( = ?auto_18120 ?auto_18127 ) ) ( not ( = ?auto_18118 ?auto_18116 ) ) ( not ( = ?auto_18118 ?auto_18113 ) ) ( not ( = ?auto_18118 ?auto_18124 ) ) ( not ( = ?auto_18111 ?auto_18122 ) ) ( not ( = ?auto_18111 ?auto_18117 ) ) ( not ( = ?auto_18111 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18097 ) ) ( not ( = ?auto_18092 ?auto_18110 ) ) ( not ( = ?auto_18093 ?auto_18097 ) ) ( not ( = ?auto_18093 ?auto_18110 ) ) ( not ( = ?auto_18094 ?auto_18097 ) ) ( not ( = ?auto_18094 ?auto_18110 ) ) ( not ( = ?auto_18095 ?auto_18097 ) ) ( not ( = ?auto_18095 ?auto_18110 ) ) ( not ( = ?auto_18097 ?auto_18111 ) ) ( not ( = ?auto_18097 ?auto_18122 ) ) ( not ( = ?auto_18097 ?auto_18117 ) ) ( not ( = ?auto_18097 ?auto_18126 ) ) ( not ( = ?auto_18115 ?auto_18120 ) ) ( not ( = ?auto_18115 ?auto_18121 ) ) ( not ( = ?auto_18115 ?auto_18123 ) ) ( not ( = ?auto_18115 ?auto_18127 ) ) ( not ( = ?auto_18129 ?auto_18118 ) ) ( not ( = ?auto_18129 ?auto_18116 ) ) ( not ( = ?auto_18129 ?auto_18113 ) ) ( not ( = ?auto_18129 ?auto_18124 ) ) ( not ( = ?auto_18110 ?auto_18111 ) ) ( not ( = ?auto_18110 ?auto_18122 ) ) ( not ( = ?auto_18110 ?auto_18117 ) ) ( not ( = ?auto_18110 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18100 ) ) ( not ( = ?auto_18092 ?auto_18112 ) ) ( not ( = ?auto_18093 ?auto_18100 ) ) ( not ( = ?auto_18093 ?auto_18112 ) ) ( not ( = ?auto_18094 ?auto_18100 ) ) ( not ( = ?auto_18094 ?auto_18112 ) ) ( not ( = ?auto_18095 ?auto_18100 ) ) ( not ( = ?auto_18095 ?auto_18112 ) ) ( not ( = ?auto_18096 ?auto_18100 ) ) ( not ( = ?auto_18096 ?auto_18112 ) ) ( not ( = ?auto_18100 ?auto_18110 ) ) ( not ( = ?auto_18100 ?auto_18111 ) ) ( not ( = ?auto_18100 ?auto_18122 ) ) ( not ( = ?auto_18100 ?auto_18117 ) ) ( not ( = ?auto_18100 ?auto_18126 ) ) ( not ( = ?auto_18109 ?auto_18115 ) ) ( not ( = ?auto_18109 ?auto_18120 ) ) ( not ( = ?auto_18109 ?auto_18121 ) ) ( not ( = ?auto_18109 ?auto_18123 ) ) ( not ( = ?auto_18109 ?auto_18127 ) ) ( not ( = ?auto_18128 ?auto_18129 ) ) ( not ( = ?auto_18128 ?auto_18118 ) ) ( not ( = ?auto_18128 ?auto_18116 ) ) ( not ( = ?auto_18128 ?auto_18113 ) ) ( not ( = ?auto_18128 ?auto_18124 ) ) ( not ( = ?auto_18112 ?auto_18110 ) ) ( not ( = ?auto_18112 ?auto_18111 ) ) ( not ( = ?auto_18112 ?auto_18122 ) ) ( not ( = ?auto_18112 ?auto_18117 ) ) ( not ( = ?auto_18112 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18099 ) ) ( not ( = ?auto_18092 ?auto_18119 ) ) ( not ( = ?auto_18093 ?auto_18099 ) ) ( not ( = ?auto_18093 ?auto_18119 ) ) ( not ( = ?auto_18094 ?auto_18099 ) ) ( not ( = ?auto_18094 ?auto_18119 ) ) ( not ( = ?auto_18095 ?auto_18099 ) ) ( not ( = ?auto_18095 ?auto_18119 ) ) ( not ( = ?auto_18096 ?auto_18099 ) ) ( not ( = ?auto_18096 ?auto_18119 ) ) ( not ( = ?auto_18097 ?auto_18099 ) ) ( not ( = ?auto_18097 ?auto_18119 ) ) ( not ( = ?auto_18099 ?auto_18112 ) ) ( not ( = ?auto_18099 ?auto_18110 ) ) ( not ( = ?auto_18099 ?auto_18111 ) ) ( not ( = ?auto_18099 ?auto_18122 ) ) ( not ( = ?auto_18099 ?auto_18117 ) ) ( not ( = ?auto_18099 ?auto_18126 ) ) ( not ( = ?auto_18114 ?auto_18109 ) ) ( not ( = ?auto_18114 ?auto_18115 ) ) ( not ( = ?auto_18114 ?auto_18120 ) ) ( not ( = ?auto_18114 ?auto_18121 ) ) ( not ( = ?auto_18114 ?auto_18123 ) ) ( not ( = ?auto_18114 ?auto_18127 ) ) ( not ( = ?auto_18125 ?auto_18128 ) ) ( not ( = ?auto_18125 ?auto_18129 ) ) ( not ( = ?auto_18125 ?auto_18118 ) ) ( not ( = ?auto_18125 ?auto_18116 ) ) ( not ( = ?auto_18125 ?auto_18113 ) ) ( not ( = ?auto_18125 ?auto_18124 ) ) ( not ( = ?auto_18119 ?auto_18112 ) ) ( not ( = ?auto_18119 ?auto_18110 ) ) ( not ( = ?auto_18119 ?auto_18111 ) ) ( not ( = ?auto_18119 ?auto_18122 ) ) ( not ( = ?auto_18119 ?auto_18117 ) ) ( not ( = ?auto_18119 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18098 ) ) ( not ( = ?auto_18092 ?auto_18108 ) ) ( not ( = ?auto_18093 ?auto_18098 ) ) ( not ( = ?auto_18093 ?auto_18108 ) ) ( not ( = ?auto_18094 ?auto_18098 ) ) ( not ( = ?auto_18094 ?auto_18108 ) ) ( not ( = ?auto_18095 ?auto_18098 ) ) ( not ( = ?auto_18095 ?auto_18108 ) ) ( not ( = ?auto_18096 ?auto_18098 ) ) ( not ( = ?auto_18096 ?auto_18108 ) ) ( not ( = ?auto_18097 ?auto_18098 ) ) ( not ( = ?auto_18097 ?auto_18108 ) ) ( not ( = ?auto_18100 ?auto_18098 ) ) ( not ( = ?auto_18100 ?auto_18108 ) ) ( not ( = ?auto_18098 ?auto_18119 ) ) ( not ( = ?auto_18098 ?auto_18112 ) ) ( not ( = ?auto_18098 ?auto_18110 ) ) ( not ( = ?auto_18098 ?auto_18111 ) ) ( not ( = ?auto_18098 ?auto_18122 ) ) ( not ( = ?auto_18098 ?auto_18117 ) ) ( not ( = ?auto_18098 ?auto_18126 ) ) ( not ( = ?auto_18108 ?auto_18119 ) ) ( not ( = ?auto_18108 ?auto_18112 ) ) ( not ( = ?auto_18108 ?auto_18110 ) ) ( not ( = ?auto_18108 ?auto_18111 ) ) ( not ( = ?auto_18108 ?auto_18122 ) ) ( not ( = ?auto_18108 ?auto_18117 ) ) ( not ( = ?auto_18108 ?auto_18126 ) ) ( not ( = ?auto_18092 ?auto_18101 ) ) ( not ( = ?auto_18092 ?auto_18106 ) ) ( not ( = ?auto_18093 ?auto_18101 ) ) ( not ( = ?auto_18093 ?auto_18106 ) ) ( not ( = ?auto_18094 ?auto_18101 ) ) ( not ( = ?auto_18094 ?auto_18106 ) ) ( not ( = ?auto_18095 ?auto_18101 ) ) ( not ( = ?auto_18095 ?auto_18106 ) ) ( not ( = ?auto_18096 ?auto_18101 ) ) ( not ( = ?auto_18096 ?auto_18106 ) ) ( not ( = ?auto_18097 ?auto_18101 ) ) ( not ( = ?auto_18097 ?auto_18106 ) ) ( not ( = ?auto_18100 ?auto_18101 ) ) ( not ( = ?auto_18100 ?auto_18106 ) ) ( not ( = ?auto_18099 ?auto_18101 ) ) ( not ( = ?auto_18099 ?auto_18106 ) ) ( not ( = ?auto_18101 ?auto_18108 ) ) ( not ( = ?auto_18101 ?auto_18119 ) ) ( not ( = ?auto_18101 ?auto_18112 ) ) ( not ( = ?auto_18101 ?auto_18110 ) ) ( not ( = ?auto_18101 ?auto_18111 ) ) ( not ( = ?auto_18101 ?auto_18122 ) ) ( not ( = ?auto_18101 ?auto_18117 ) ) ( not ( = ?auto_18101 ?auto_18126 ) ) ( not ( = ?auto_18105 ?auto_18114 ) ) ( not ( = ?auto_18105 ?auto_18109 ) ) ( not ( = ?auto_18105 ?auto_18115 ) ) ( not ( = ?auto_18105 ?auto_18120 ) ) ( not ( = ?auto_18105 ?auto_18121 ) ) ( not ( = ?auto_18105 ?auto_18123 ) ) ( not ( = ?auto_18105 ?auto_18127 ) ) ( not ( = ?auto_18104 ?auto_18125 ) ) ( not ( = ?auto_18104 ?auto_18128 ) ) ( not ( = ?auto_18104 ?auto_18129 ) ) ( not ( = ?auto_18104 ?auto_18118 ) ) ( not ( = ?auto_18104 ?auto_18116 ) ) ( not ( = ?auto_18104 ?auto_18113 ) ) ( not ( = ?auto_18104 ?auto_18124 ) ) ( not ( = ?auto_18106 ?auto_18108 ) ) ( not ( = ?auto_18106 ?auto_18119 ) ) ( not ( = ?auto_18106 ?auto_18112 ) ) ( not ( = ?auto_18106 ?auto_18110 ) ) ( not ( = ?auto_18106 ?auto_18111 ) ) ( not ( = ?auto_18106 ?auto_18122 ) ) ( not ( = ?auto_18106 ?auto_18117 ) ) ( not ( = ?auto_18106 ?auto_18126 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18095 ?auto_18096 ?auto_18097 ?auto_18100 ?auto_18099 ?auto_18098 )
      ( MAKE-1CRATE ?auto_18098 ?auto_18101 )
      ( MAKE-9CRATE-VERIFY ?auto_18092 ?auto_18093 ?auto_18094 ?auto_18095 ?auto_18096 ?auto_18097 ?auto_18100 ?auto_18099 ?auto_18098 ?auto_18101 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18132 - SURFACE
      ?auto_18133 - SURFACE
    )
    :vars
    (
      ?auto_18134 - HOIST
      ?auto_18135 - PLACE
      ?auto_18137 - PLACE
      ?auto_18138 - HOIST
      ?auto_18139 - SURFACE
      ?auto_18136 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18134 ?auto_18135 ) ( SURFACE-AT ?auto_18132 ?auto_18135 ) ( CLEAR ?auto_18132 ) ( IS-CRATE ?auto_18133 ) ( AVAILABLE ?auto_18134 ) ( not ( = ?auto_18137 ?auto_18135 ) ) ( HOIST-AT ?auto_18138 ?auto_18137 ) ( AVAILABLE ?auto_18138 ) ( SURFACE-AT ?auto_18133 ?auto_18137 ) ( ON ?auto_18133 ?auto_18139 ) ( CLEAR ?auto_18133 ) ( TRUCK-AT ?auto_18136 ?auto_18135 ) ( not ( = ?auto_18132 ?auto_18133 ) ) ( not ( = ?auto_18132 ?auto_18139 ) ) ( not ( = ?auto_18133 ?auto_18139 ) ) ( not ( = ?auto_18134 ?auto_18138 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18136 ?auto_18135 ?auto_18137 )
      ( !LIFT ?auto_18138 ?auto_18133 ?auto_18139 ?auto_18137 )
      ( !LOAD ?auto_18138 ?auto_18133 ?auto_18136 ?auto_18137 )
      ( !DRIVE ?auto_18136 ?auto_18137 ?auto_18135 )
      ( !UNLOAD ?auto_18134 ?auto_18133 ?auto_18136 ?auto_18135 )
      ( !DROP ?auto_18134 ?auto_18133 ?auto_18132 ?auto_18135 )
      ( MAKE-1CRATE-VERIFY ?auto_18132 ?auto_18133 ) )
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
      ?auto_18159 - SURFACE
      ?auto_18158 - SURFACE
      ?auto_18157 - SURFACE
      ?auto_18160 - SURFACE
      ?auto_18161 - SURFACE
    )
    :vars
    (
      ?auto_18166 - HOIST
      ?auto_18163 - PLACE
      ?auto_18162 - PLACE
      ?auto_18167 - HOIST
      ?auto_18165 - SURFACE
      ?auto_18179 - PLACE
      ?auto_18184 - HOIST
      ?auto_18180 - SURFACE
      ?auto_18181 - PLACE
      ?auto_18187 - HOIST
      ?auto_18169 - SURFACE
      ?auto_18188 - SURFACE
      ?auto_18177 - PLACE
      ?auto_18172 - HOIST
      ?auto_18183 - SURFACE
      ?auto_18174 - PLACE
      ?auto_18176 - HOIST
      ?auto_18173 - SURFACE
      ?auto_18191 - PLACE
      ?auto_18168 - HOIST
      ?auto_18186 - SURFACE
      ?auto_18192 - PLACE
      ?auto_18189 - HOIST
      ?auto_18185 - SURFACE
      ?auto_18175 - PLACE
      ?auto_18182 - HOIST
      ?auto_18190 - SURFACE
      ?auto_18171 - PLACE
      ?auto_18170 - HOIST
      ?auto_18178 - SURFACE
      ?auto_18164 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18166 ?auto_18163 ) ( IS-CRATE ?auto_18161 ) ( not ( = ?auto_18162 ?auto_18163 ) ) ( HOIST-AT ?auto_18167 ?auto_18162 ) ( AVAILABLE ?auto_18167 ) ( SURFACE-AT ?auto_18161 ?auto_18162 ) ( ON ?auto_18161 ?auto_18165 ) ( CLEAR ?auto_18161 ) ( not ( = ?auto_18160 ?auto_18161 ) ) ( not ( = ?auto_18160 ?auto_18165 ) ) ( not ( = ?auto_18161 ?auto_18165 ) ) ( not ( = ?auto_18166 ?auto_18167 ) ) ( IS-CRATE ?auto_18160 ) ( not ( = ?auto_18179 ?auto_18163 ) ) ( HOIST-AT ?auto_18184 ?auto_18179 ) ( AVAILABLE ?auto_18184 ) ( SURFACE-AT ?auto_18160 ?auto_18179 ) ( ON ?auto_18160 ?auto_18180 ) ( CLEAR ?auto_18160 ) ( not ( = ?auto_18157 ?auto_18160 ) ) ( not ( = ?auto_18157 ?auto_18180 ) ) ( not ( = ?auto_18160 ?auto_18180 ) ) ( not ( = ?auto_18166 ?auto_18184 ) ) ( IS-CRATE ?auto_18157 ) ( not ( = ?auto_18181 ?auto_18163 ) ) ( HOIST-AT ?auto_18187 ?auto_18181 ) ( SURFACE-AT ?auto_18157 ?auto_18181 ) ( ON ?auto_18157 ?auto_18169 ) ( CLEAR ?auto_18157 ) ( not ( = ?auto_18158 ?auto_18157 ) ) ( not ( = ?auto_18158 ?auto_18169 ) ) ( not ( = ?auto_18157 ?auto_18169 ) ) ( not ( = ?auto_18166 ?auto_18187 ) ) ( IS-CRATE ?auto_18158 ) ( AVAILABLE ?auto_18187 ) ( SURFACE-AT ?auto_18158 ?auto_18181 ) ( ON ?auto_18158 ?auto_18188 ) ( CLEAR ?auto_18158 ) ( not ( = ?auto_18159 ?auto_18158 ) ) ( not ( = ?auto_18159 ?auto_18188 ) ) ( not ( = ?auto_18158 ?auto_18188 ) ) ( IS-CRATE ?auto_18159 ) ( not ( = ?auto_18177 ?auto_18163 ) ) ( HOIST-AT ?auto_18172 ?auto_18177 ) ( AVAILABLE ?auto_18172 ) ( SURFACE-AT ?auto_18159 ?auto_18177 ) ( ON ?auto_18159 ?auto_18183 ) ( CLEAR ?auto_18159 ) ( not ( = ?auto_18156 ?auto_18159 ) ) ( not ( = ?auto_18156 ?auto_18183 ) ) ( not ( = ?auto_18159 ?auto_18183 ) ) ( not ( = ?auto_18166 ?auto_18172 ) ) ( IS-CRATE ?auto_18156 ) ( not ( = ?auto_18174 ?auto_18163 ) ) ( HOIST-AT ?auto_18176 ?auto_18174 ) ( AVAILABLE ?auto_18176 ) ( SURFACE-AT ?auto_18156 ?auto_18174 ) ( ON ?auto_18156 ?auto_18173 ) ( CLEAR ?auto_18156 ) ( not ( = ?auto_18155 ?auto_18156 ) ) ( not ( = ?auto_18155 ?auto_18173 ) ) ( not ( = ?auto_18156 ?auto_18173 ) ) ( not ( = ?auto_18166 ?auto_18176 ) ) ( IS-CRATE ?auto_18155 ) ( not ( = ?auto_18191 ?auto_18163 ) ) ( HOIST-AT ?auto_18168 ?auto_18191 ) ( AVAILABLE ?auto_18168 ) ( SURFACE-AT ?auto_18155 ?auto_18191 ) ( ON ?auto_18155 ?auto_18186 ) ( CLEAR ?auto_18155 ) ( not ( = ?auto_18154 ?auto_18155 ) ) ( not ( = ?auto_18154 ?auto_18186 ) ) ( not ( = ?auto_18155 ?auto_18186 ) ) ( not ( = ?auto_18166 ?auto_18168 ) ) ( IS-CRATE ?auto_18154 ) ( not ( = ?auto_18192 ?auto_18163 ) ) ( HOIST-AT ?auto_18189 ?auto_18192 ) ( AVAILABLE ?auto_18189 ) ( SURFACE-AT ?auto_18154 ?auto_18192 ) ( ON ?auto_18154 ?auto_18185 ) ( CLEAR ?auto_18154 ) ( not ( = ?auto_18153 ?auto_18154 ) ) ( not ( = ?auto_18153 ?auto_18185 ) ) ( not ( = ?auto_18154 ?auto_18185 ) ) ( not ( = ?auto_18166 ?auto_18189 ) ) ( IS-CRATE ?auto_18153 ) ( not ( = ?auto_18175 ?auto_18163 ) ) ( HOIST-AT ?auto_18182 ?auto_18175 ) ( AVAILABLE ?auto_18182 ) ( SURFACE-AT ?auto_18153 ?auto_18175 ) ( ON ?auto_18153 ?auto_18190 ) ( CLEAR ?auto_18153 ) ( not ( = ?auto_18152 ?auto_18153 ) ) ( not ( = ?auto_18152 ?auto_18190 ) ) ( not ( = ?auto_18153 ?auto_18190 ) ) ( not ( = ?auto_18166 ?auto_18182 ) ) ( SURFACE-AT ?auto_18151 ?auto_18163 ) ( CLEAR ?auto_18151 ) ( IS-CRATE ?auto_18152 ) ( AVAILABLE ?auto_18166 ) ( not ( = ?auto_18171 ?auto_18163 ) ) ( HOIST-AT ?auto_18170 ?auto_18171 ) ( AVAILABLE ?auto_18170 ) ( SURFACE-AT ?auto_18152 ?auto_18171 ) ( ON ?auto_18152 ?auto_18178 ) ( CLEAR ?auto_18152 ) ( TRUCK-AT ?auto_18164 ?auto_18163 ) ( not ( = ?auto_18151 ?auto_18152 ) ) ( not ( = ?auto_18151 ?auto_18178 ) ) ( not ( = ?auto_18152 ?auto_18178 ) ) ( not ( = ?auto_18166 ?auto_18170 ) ) ( not ( = ?auto_18151 ?auto_18153 ) ) ( not ( = ?auto_18151 ?auto_18190 ) ) ( not ( = ?auto_18153 ?auto_18178 ) ) ( not ( = ?auto_18175 ?auto_18171 ) ) ( not ( = ?auto_18182 ?auto_18170 ) ) ( not ( = ?auto_18190 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18154 ) ) ( not ( = ?auto_18151 ?auto_18185 ) ) ( not ( = ?auto_18152 ?auto_18154 ) ) ( not ( = ?auto_18152 ?auto_18185 ) ) ( not ( = ?auto_18154 ?auto_18190 ) ) ( not ( = ?auto_18154 ?auto_18178 ) ) ( not ( = ?auto_18192 ?auto_18175 ) ) ( not ( = ?auto_18192 ?auto_18171 ) ) ( not ( = ?auto_18189 ?auto_18182 ) ) ( not ( = ?auto_18189 ?auto_18170 ) ) ( not ( = ?auto_18185 ?auto_18190 ) ) ( not ( = ?auto_18185 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18155 ) ) ( not ( = ?auto_18151 ?auto_18186 ) ) ( not ( = ?auto_18152 ?auto_18155 ) ) ( not ( = ?auto_18152 ?auto_18186 ) ) ( not ( = ?auto_18153 ?auto_18155 ) ) ( not ( = ?auto_18153 ?auto_18186 ) ) ( not ( = ?auto_18155 ?auto_18185 ) ) ( not ( = ?auto_18155 ?auto_18190 ) ) ( not ( = ?auto_18155 ?auto_18178 ) ) ( not ( = ?auto_18191 ?auto_18192 ) ) ( not ( = ?auto_18191 ?auto_18175 ) ) ( not ( = ?auto_18191 ?auto_18171 ) ) ( not ( = ?auto_18168 ?auto_18189 ) ) ( not ( = ?auto_18168 ?auto_18182 ) ) ( not ( = ?auto_18168 ?auto_18170 ) ) ( not ( = ?auto_18186 ?auto_18185 ) ) ( not ( = ?auto_18186 ?auto_18190 ) ) ( not ( = ?auto_18186 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18156 ) ) ( not ( = ?auto_18151 ?auto_18173 ) ) ( not ( = ?auto_18152 ?auto_18156 ) ) ( not ( = ?auto_18152 ?auto_18173 ) ) ( not ( = ?auto_18153 ?auto_18156 ) ) ( not ( = ?auto_18153 ?auto_18173 ) ) ( not ( = ?auto_18154 ?auto_18156 ) ) ( not ( = ?auto_18154 ?auto_18173 ) ) ( not ( = ?auto_18156 ?auto_18186 ) ) ( not ( = ?auto_18156 ?auto_18185 ) ) ( not ( = ?auto_18156 ?auto_18190 ) ) ( not ( = ?auto_18156 ?auto_18178 ) ) ( not ( = ?auto_18174 ?auto_18191 ) ) ( not ( = ?auto_18174 ?auto_18192 ) ) ( not ( = ?auto_18174 ?auto_18175 ) ) ( not ( = ?auto_18174 ?auto_18171 ) ) ( not ( = ?auto_18176 ?auto_18168 ) ) ( not ( = ?auto_18176 ?auto_18189 ) ) ( not ( = ?auto_18176 ?auto_18182 ) ) ( not ( = ?auto_18176 ?auto_18170 ) ) ( not ( = ?auto_18173 ?auto_18186 ) ) ( not ( = ?auto_18173 ?auto_18185 ) ) ( not ( = ?auto_18173 ?auto_18190 ) ) ( not ( = ?auto_18173 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18159 ) ) ( not ( = ?auto_18151 ?auto_18183 ) ) ( not ( = ?auto_18152 ?auto_18159 ) ) ( not ( = ?auto_18152 ?auto_18183 ) ) ( not ( = ?auto_18153 ?auto_18159 ) ) ( not ( = ?auto_18153 ?auto_18183 ) ) ( not ( = ?auto_18154 ?auto_18159 ) ) ( not ( = ?auto_18154 ?auto_18183 ) ) ( not ( = ?auto_18155 ?auto_18159 ) ) ( not ( = ?auto_18155 ?auto_18183 ) ) ( not ( = ?auto_18159 ?auto_18173 ) ) ( not ( = ?auto_18159 ?auto_18186 ) ) ( not ( = ?auto_18159 ?auto_18185 ) ) ( not ( = ?auto_18159 ?auto_18190 ) ) ( not ( = ?auto_18159 ?auto_18178 ) ) ( not ( = ?auto_18177 ?auto_18174 ) ) ( not ( = ?auto_18177 ?auto_18191 ) ) ( not ( = ?auto_18177 ?auto_18192 ) ) ( not ( = ?auto_18177 ?auto_18175 ) ) ( not ( = ?auto_18177 ?auto_18171 ) ) ( not ( = ?auto_18172 ?auto_18176 ) ) ( not ( = ?auto_18172 ?auto_18168 ) ) ( not ( = ?auto_18172 ?auto_18189 ) ) ( not ( = ?auto_18172 ?auto_18182 ) ) ( not ( = ?auto_18172 ?auto_18170 ) ) ( not ( = ?auto_18183 ?auto_18173 ) ) ( not ( = ?auto_18183 ?auto_18186 ) ) ( not ( = ?auto_18183 ?auto_18185 ) ) ( not ( = ?auto_18183 ?auto_18190 ) ) ( not ( = ?auto_18183 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18158 ) ) ( not ( = ?auto_18151 ?auto_18188 ) ) ( not ( = ?auto_18152 ?auto_18158 ) ) ( not ( = ?auto_18152 ?auto_18188 ) ) ( not ( = ?auto_18153 ?auto_18158 ) ) ( not ( = ?auto_18153 ?auto_18188 ) ) ( not ( = ?auto_18154 ?auto_18158 ) ) ( not ( = ?auto_18154 ?auto_18188 ) ) ( not ( = ?auto_18155 ?auto_18158 ) ) ( not ( = ?auto_18155 ?auto_18188 ) ) ( not ( = ?auto_18156 ?auto_18158 ) ) ( not ( = ?auto_18156 ?auto_18188 ) ) ( not ( = ?auto_18158 ?auto_18183 ) ) ( not ( = ?auto_18158 ?auto_18173 ) ) ( not ( = ?auto_18158 ?auto_18186 ) ) ( not ( = ?auto_18158 ?auto_18185 ) ) ( not ( = ?auto_18158 ?auto_18190 ) ) ( not ( = ?auto_18158 ?auto_18178 ) ) ( not ( = ?auto_18181 ?auto_18177 ) ) ( not ( = ?auto_18181 ?auto_18174 ) ) ( not ( = ?auto_18181 ?auto_18191 ) ) ( not ( = ?auto_18181 ?auto_18192 ) ) ( not ( = ?auto_18181 ?auto_18175 ) ) ( not ( = ?auto_18181 ?auto_18171 ) ) ( not ( = ?auto_18187 ?auto_18172 ) ) ( not ( = ?auto_18187 ?auto_18176 ) ) ( not ( = ?auto_18187 ?auto_18168 ) ) ( not ( = ?auto_18187 ?auto_18189 ) ) ( not ( = ?auto_18187 ?auto_18182 ) ) ( not ( = ?auto_18187 ?auto_18170 ) ) ( not ( = ?auto_18188 ?auto_18183 ) ) ( not ( = ?auto_18188 ?auto_18173 ) ) ( not ( = ?auto_18188 ?auto_18186 ) ) ( not ( = ?auto_18188 ?auto_18185 ) ) ( not ( = ?auto_18188 ?auto_18190 ) ) ( not ( = ?auto_18188 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18157 ) ) ( not ( = ?auto_18151 ?auto_18169 ) ) ( not ( = ?auto_18152 ?auto_18157 ) ) ( not ( = ?auto_18152 ?auto_18169 ) ) ( not ( = ?auto_18153 ?auto_18157 ) ) ( not ( = ?auto_18153 ?auto_18169 ) ) ( not ( = ?auto_18154 ?auto_18157 ) ) ( not ( = ?auto_18154 ?auto_18169 ) ) ( not ( = ?auto_18155 ?auto_18157 ) ) ( not ( = ?auto_18155 ?auto_18169 ) ) ( not ( = ?auto_18156 ?auto_18157 ) ) ( not ( = ?auto_18156 ?auto_18169 ) ) ( not ( = ?auto_18159 ?auto_18157 ) ) ( not ( = ?auto_18159 ?auto_18169 ) ) ( not ( = ?auto_18157 ?auto_18188 ) ) ( not ( = ?auto_18157 ?auto_18183 ) ) ( not ( = ?auto_18157 ?auto_18173 ) ) ( not ( = ?auto_18157 ?auto_18186 ) ) ( not ( = ?auto_18157 ?auto_18185 ) ) ( not ( = ?auto_18157 ?auto_18190 ) ) ( not ( = ?auto_18157 ?auto_18178 ) ) ( not ( = ?auto_18169 ?auto_18188 ) ) ( not ( = ?auto_18169 ?auto_18183 ) ) ( not ( = ?auto_18169 ?auto_18173 ) ) ( not ( = ?auto_18169 ?auto_18186 ) ) ( not ( = ?auto_18169 ?auto_18185 ) ) ( not ( = ?auto_18169 ?auto_18190 ) ) ( not ( = ?auto_18169 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18160 ) ) ( not ( = ?auto_18151 ?auto_18180 ) ) ( not ( = ?auto_18152 ?auto_18160 ) ) ( not ( = ?auto_18152 ?auto_18180 ) ) ( not ( = ?auto_18153 ?auto_18160 ) ) ( not ( = ?auto_18153 ?auto_18180 ) ) ( not ( = ?auto_18154 ?auto_18160 ) ) ( not ( = ?auto_18154 ?auto_18180 ) ) ( not ( = ?auto_18155 ?auto_18160 ) ) ( not ( = ?auto_18155 ?auto_18180 ) ) ( not ( = ?auto_18156 ?auto_18160 ) ) ( not ( = ?auto_18156 ?auto_18180 ) ) ( not ( = ?auto_18159 ?auto_18160 ) ) ( not ( = ?auto_18159 ?auto_18180 ) ) ( not ( = ?auto_18158 ?auto_18160 ) ) ( not ( = ?auto_18158 ?auto_18180 ) ) ( not ( = ?auto_18160 ?auto_18169 ) ) ( not ( = ?auto_18160 ?auto_18188 ) ) ( not ( = ?auto_18160 ?auto_18183 ) ) ( not ( = ?auto_18160 ?auto_18173 ) ) ( not ( = ?auto_18160 ?auto_18186 ) ) ( not ( = ?auto_18160 ?auto_18185 ) ) ( not ( = ?auto_18160 ?auto_18190 ) ) ( not ( = ?auto_18160 ?auto_18178 ) ) ( not ( = ?auto_18179 ?auto_18181 ) ) ( not ( = ?auto_18179 ?auto_18177 ) ) ( not ( = ?auto_18179 ?auto_18174 ) ) ( not ( = ?auto_18179 ?auto_18191 ) ) ( not ( = ?auto_18179 ?auto_18192 ) ) ( not ( = ?auto_18179 ?auto_18175 ) ) ( not ( = ?auto_18179 ?auto_18171 ) ) ( not ( = ?auto_18184 ?auto_18187 ) ) ( not ( = ?auto_18184 ?auto_18172 ) ) ( not ( = ?auto_18184 ?auto_18176 ) ) ( not ( = ?auto_18184 ?auto_18168 ) ) ( not ( = ?auto_18184 ?auto_18189 ) ) ( not ( = ?auto_18184 ?auto_18182 ) ) ( not ( = ?auto_18184 ?auto_18170 ) ) ( not ( = ?auto_18180 ?auto_18169 ) ) ( not ( = ?auto_18180 ?auto_18188 ) ) ( not ( = ?auto_18180 ?auto_18183 ) ) ( not ( = ?auto_18180 ?auto_18173 ) ) ( not ( = ?auto_18180 ?auto_18186 ) ) ( not ( = ?auto_18180 ?auto_18185 ) ) ( not ( = ?auto_18180 ?auto_18190 ) ) ( not ( = ?auto_18180 ?auto_18178 ) ) ( not ( = ?auto_18151 ?auto_18161 ) ) ( not ( = ?auto_18151 ?auto_18165 ) ) ( not ( = ?auto_18152 ?auto_18161 ) ) ( not ( = ?auto_18152 ?auto_18165 ) ) ( not ( = ?auto_18153 ?auto_18161 ) ) ( not ( = ?auto_18153 ?auto_18165 ) ) ( not ( = ?auto_18154 ?auto_18161 ) ) ( not ( = ?auto_18154 ?auto_18165 ) ) ( not ( = ?auto_18155 ?auto_18161 ) ) ( not ( = ?auto_18155 ?auto_18165 ) ) ( not ( = ?auto_18156 ?auto_18161 ) ) ( not ( = ?auto_18156 ?auto_18165 ) ) ( not ( = ?auto_18159 ?auto_18161 ) ) ( not ( = ?auto_18159 ?auto_18165 ) ) ( not ( = ?auto_18158 ?auto_18161 ) ) ( not ( = ?auto_18158 ?auto_18165 ) ) ( not ( = ?auto_18157 ?auto_18161 ) ) ( not ( = ?auto_18157 ?auto_18165 ) ) ( not ( = ?auto_18161 ?auto_18180 ) ) ( not ( = ?auto_18161 ?auto_18169 ) ) ( not ( = ?auto_18161 ?auto_18188 ) ) ( not ( = ?auto_18161 ?auto_18183 ) ) ( not ( = ?auto_18161 ?auto_18173 ) ) ( not ( = ?auto_18161 ?auto_18186 ) ) ( not ( = ?auto_18161 ?auto_18185 ) ) ( not ( = ?auto_18161 ?auto_18190 ) ) ( not ( = ?auto_18161 ?auto_18178 ) ) ( not ( = ?auto_18162 ?auto_18179 ) ) ( not ( = ?auto_18162 ?auto_18181 ) ) ( not ( = ?auto_18162 ?auto_18177 ) ) ( not ( = ?auto_18162 ?auto_18174 ) ) ( not ( = ?auto_18162 ?auto_18191 ) ) ( not ( = ?auto_18162 ?auto_18192 ) ) ( not ( = ?auto_18162 ?auto_18175 ) ) ( not ( = ?auto_18162 ?auto_18171 ) ) ( not ( = ?auto_18167 ?auto_18184 ) ) ( not ( = ?auto_18167 ?auto_18187 ) ) ( not ( = ?auto_18167 ?auto_18172 ) ) ( not ( = ?auto_18167 ?auto_18176 ) ) ( not ( = ?auto_18167 ?auto_18168 ) ) ( not ( = ?auto_18167 ?auto_18189 ) ) ( not ( = ?auto_18167 ?auto_18182 ) ) ( not ( = ?auto_18167 ?auto_18170 ) ) ( not ( = ?auto_18165 ?auto_18180 ) ) ( not ( = ?auto_18165 ?auto_18169 ) ) ( not ( = ?auto_18165 ?auto_18188 ) ) ( not ( = ?auto_18165 ?auto_18183 ) ) ( not ( = ?auto_18165 ?auto_18173 ) ) ( not ( = ?auto_18165 ?auto_18186 ) ) ( not ( = ?auto_18165 ?auto_18185 ) ) ( not ( = ?auto_18165 ?auto_18190 ) ) ( not ( = ?auto_18165 ?auto_18178 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_18151 ?auto_18152 ?auto_18153 ?auto_18154 ?auto_18155 ?auto_18156 ?auto_18159 ?auto_18158 ?auto_18157 ?auto_18160 )
      ( MAKE-1CRATE ?auto_18160 ?auto_18161 )
      ( MAKE-10CRATE-VERIFY ?auto_18151 ?auto_18152 ?auto_18153 ?auto_18154 ?auto_18155 ?auto_18156 ?auto_18159 ?auto_18158 ?auto_18157 ?auto_18160 ?auto_18161 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18195 - SURFACE
      ?auto_18196 - SURFACE
    )
    :vars
    (
      ?auto_18197 - HOIST
      ?auto_18198 - PLACE
      ?auto_18200 - PLACE
      ?auto_18201 - HOIST
      ?auto_18202 - SURFACE
      ?auto_18199 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18197 ?auto_18198 ) ( SURFACE-AT ?auto_18195 ?auto_18198 ) ( CLEAR ?auto_18195 ) ( IS-CRATE ?auto_18196 ) ( AVAILABLE ?auto_18197 ) ( not ( = ?auto_18200 ?auto_18198 ) ) ( HOIST-AT ?auto_18201 ?auto_18200 ) ( AVAILABLE ?auto_18201 ) ( SURFACE-AT ?auto_18196 ?auto_18200 ) ( ON ?auto_18196 ?auto_18202 ) ( CLEAR ?auto_18196 ) ( TRUCK-AT ?auto_18199 ?auto_18198 ) ( not ( = ?auto_18195 ?auto_18196 ) ) ( not ( = ?auto_18195 ?auto_18202 ) ) ( not ( = ?auto_18196 ?auto_18202 ) ) ( not ( = ?auto_18197 ?auto_18201 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18199 ?auto_18198 ?auto_18200 )
      ( !LIFT ?auto_18201 ?auto_18196 ?auto_18202 ?auto_18200 )
      ( !LOAD ?auto_18201 ?auto_18196 ?auto_18199 ?auto_18200 )
      ( !DRIVE ?auto_18199 ?auto_18200 ?auto_18198 )
      ( !UNLOAD ?auto_18197 ?auto_18196 ?auto_18199 ?auto_18198 )
      ( !DROP ?auto_18197 ?auto_18196 ?auto_18195 ?auto_18198 )
      ( MAKE-1CRATE-VERIFY ?auto_18195 ?auto_18196 ) )
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
      ?auto_18223 - SURFACE
      ?auto_18222 - SURFACE
      ?auto_18221 - SURFACE
      ?auto_18224 - SURFACE
      ?auto_18226 - SURFACE
      ?auto_18225 - SURFACE
    )
    :vars
    (
      ?auto_18227 - HOIST
      ?auto_18228 - PLACE
      ?auto_18229 - PLACE
      ?auto_18231 - HOIST
      ?auto_18232 - SURFACE
      ?auto_18245 - PLACE
      ?auto_18256 - HOIST
      ?auto_18244 - SURFACE
      ?auto_18236 - PLACE
      ?auto_18234 - HOIST
      ?auto_18241 - SURFACE
      ?auto_18242 - PLACE
      ?auto_18249 - HOIST
      ?auto_18258 - SURFACE
      ?auto_18246 - SURFACE
      ?auto_18240 - PLACE
      ?auto_18238 - HOIST
      ?auto_18255 - SURFACE
      ?auto_18257 - PLACE
      ?auto_18254 - HOIST
      ?auto_18250 - SURFACE
      ?auto_18243 - PLACE
      ?auto_18251 - HOIST
      ?auto_18253 - SURFACE
      ?auto_18237 - SURFACE
      ?auto_18248 - PLACE
      ?auto_18233 - HOIST
      ?auto_18247 - SURFACE
      ?auto_18252 - PLACE
      ?auto_18235 - HOIST
      ?auto_18239 - SURFACE
      ?auto_18230 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18227 ?auto_18228 ) ( IS-CRATE ?auto_18225 ) ( not ( = ?auto_18229 ?auto_18228 ) ) ( HOIST-AT ?auto_18231 ?auto_18229 ) ( SURFACE-AT ?auto_18225 ?auto_18229 ) ( ON ?auto_18225 ?auto_18232 ) ( CLEAR ?auto_18225 ) ( not ( = ?auto_18226 ?auto_18225 ) ) ( not ( = ?auto_18226 ?auto_18232 ) ) ( not ( = ?auto_18225 ?auto_18232 ) ) ( not ( = ?auto_18227 ?auto_18231 ) ) ( IS-CRATE ?auto_18226 ) ( not ( = ?auto_18245 ?auto_18228 ) ) ( HOIST-AT ?auto_18256 ?auto_18245 ) ( AVAILABLE ?auto_18256 ) ( SURFACE-AT ?auto_18226 ?auto_18245 ) ( ON ?auto_18226 ?auto_18244 ) ( CLEAR ?auto_18226 ) ( not ( = ?auto_18224 ?auto_18226 ) ) ( not ( = ?auto_18224 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18244 ) ) ( not ( = ?auto_18227 ?auto_18256 ) ) ( IS-CRATE ?auto_18224 ) ( not ( = ?auto_18236 ?auto_18228 ) ) ( HOIST-AT ?auto_18234 ?auto_18236 ) ( AVAILABLE ?auto_18234 ) ( SURFACE-AT ?auto_18224 ?auto_18236 ) ( ON ?auto_18224 ?auto_18241 ) ( CLEAR ?auto_18224 ) ( not ( = ?auto_18221 ?auto_18224 ) ) ( not ( = ?auto_18221 ?auto_18241 ) ) ( not ( = ?auto_18224 ?auto_18241 ) ) ( not ( = ?auto_18227 ?auto_18234 ) ) ( IS-CRATE ?auto_18221 ) ( not ( = ?auto_18242 ?auto_18228 ) ) ( HOIST-AT ?auto_18249 ?auto_18242 ) ( SURFACE-AT ?auto_18221 ?auto_18242 ) ( ON ?auto_18221 ?auto_18258 ) ( CLEAR ?auto_18221 ) ( not ( = ?auto_18222 ?auto_18221 ) ) ( not ( = ?auto_18222 ?auto_18258 ) ) ( not ( = ?auto_18221 ?auto_18258 ) ) ( not ( = ?auto_18227 ?auto_18249 ) ) ( IS-CRATE ?auto_18222 ) ( AVAILABLE ?auto_18249 ) ( SURFACE-AT ?auto_18222 ?auto_18242 ) ( ON ?auto_18222 ?auto_18246 ) ( CLEAR ?auto_18222 ) ( not ( = ?auto_18223 ?auto_18222 ) ) ( not ( = ?auto_18223 ?auto_18246 ) ) ( not ( = ?auto_18222 ?auto_18246 ) ) ( IS-CRATE ?auto_18223 ) ( not ( = ?auto_18240 ?auto_18228 ) ) ( HOIST-AT ?auto_18238 ?auto_18240 ) ( AVAILABLE ?auto_18238 ) ( SURFACE-AT ?auto_18223 ?auto_18240 ) ( ON ?auto_18223 ?auto_18255 ) ( CLEAR ?auto_18223 ) ( not ( = ?auto_18220 ?auto_18223 ) ) ( not ( = ?auto_18220 ?auto_18255 ) ) ( not ( = ?auto_18223 ?auto_18255 ) ) ( not ( = ?auto_18227 ?auto_18238 ) ) ( IS-CRATE ?auto_18220 ) ( not ( = ?auto_18257 ?auto_18228 ) ) ( HOIST-AT ?auto_18254 ?auto_18257 ) ( AVAILABLE ?auto_18254 ) ( SURFACE-AT ?auto_18220 ?auto_18257 ) ( ON ?auto_18220 ?auto_18250 ) ( CLEAR ?auto_18220 ) ( not ( = ?auto_18219 ?auto_18220 ) ) ( not ( = ?auto_18219 ?auto_18250 ) ) ( not ( = ?auto_18220 ?auto_18250 ) ) ( not ( = ?auto_18227 ?auto_18254 ) ) ( IS-CRATE ?auto_18219 ) ( not ( = ?auto_18243 ?auto_18228 ) ) ( HOIST-AT ?auto_18251 ?auto_18243 ) ( AVAILABLE ?auto_18251 ) ( SURFACE-AT ?auto_18219 ?auto_18243 ) ( ON ?auto_18219 ?auto_18253 ) ( CLEAR ?auto_18219 ) ( not ( = ?auto_18218 ?auto_18219 ) ) ( not ( = ?auto_18218 ?auto_18253 ) ) ( not ( = ?auto_18219 ?auto_18253 ) ) ( not ( = ?auto_18227 ?auto_18251 ) ) ( IS-CRATE ?auto_18218 ) ( AVAILABLE ?auto_18231 ) ( SURFACE-AT ?auto_18218 ?auto_18229 ) ( ON ?auto_18218 ?auto_18237 ) ( CLEAR ?auto_18218 ) ( not ( = ?auto_18217 ?auto_18218 ) ) ( not ( = ?auto_18217 ?auto_18237 ) ) ( not ( = ?auto_18218 ?auto_18237 ) ) ( IS-CRATE ?auto_18217 ) ( not ( = ?auto_18248 ?auto_18228 ) ) ( HOIST-AT ?auto_18233 ?auto_18248 ) ( AVAILABLE ?auto_18233 ) ( SURFACE-AT ?auto_18217 ?auto_18248 ) ( ON ?auto_18217 ?auto_18247 ) ( CLEAR ?auto_18217 ) ( not ( = ?auto_18216 ?auto_18217 ) ) ( not ( = ?auto_18216 ?auto_18247 ) ) ( not ( = ?auto_18217 ?auto_18247 ) ) ( not ( = ?auto_18227 ?auto_18233 ) ) ( SURFACE-AT ?auto_18215 ?auto_18228 ) ( CLEAR ?auto_18215 ) ( IS-CRATE ?auto_18216 ) ( AVAILABLE ?auto_18227 ) ( not ( = ?auto_18252 ?auto_18228 ) ) ( HOIST-AT ?auto_18235 ?auto_18252 ) ( AVAILABLE ?auto_18235 ) ( SURFACE-AT ?auto_18216 ?auto_18252 ) ( ON ?auto_18216 ?auto_18239 ) ( CLEAR ?auto_18216 ) ( TRUCK-AT ?auto_18230 ?auto_18228 ) ( not ( = ?auto_18215 ?auto_18216 ) ) ( not ( = ?auto_18215 ?auto_18239 ) ) ( not ( = ?auto_18216 ?auto_18239 ) ) ( not ( = ?auto_18227 ?auto_18235 ) ) ( not ( = ?auto_18215 ?auto_18217 ) ) ( not ( = ?auto_18215 ?auto_18247 ) ) ( not ( = ?auto_18217 ?auto_18239 ) ) ( not ( = ?auto_18248 ?auto_18252 ) ) ( not ( = ?auto_18233 ?auto_18235 ) ) ( not ( = ?auto_18247 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18218 ) ) ( not ( = ?auto_18215 ?auto_18237 ) ) ( not ( = ?auto_18216 ?auto_18218 ) ) ( not ( = ?auto_18216 ?auto_18237 ) ) ( not ( = ?auto_18218 ?auto_18247 ) ) ( not ( = ?auto_18218 ?auto_18239 ) ) ( not ( = ?auto_18229 ?auto_18248 ) ) ( not ( = ?auto_18229 ?auto_18252 ) ) ( not ( = ?auto_18231 ?auto_18233 ) ) ( not ( = ?auto_18231 ?auto_18235 ) ) ( not ( = ?auto_18237 ?auto_18247 ) ) ( not ( = ?auto_18237 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18219 ) ) ( not ( = ?auto_18215 ?auto_18253 ) ) ( not ( = ?auto_18216 ?auto_18219 ) ) ( not ( = ?auto_18216 ?auto_18253 ) ) ( not ( = ?auto_18217 ?auto_18219 ) ) ( not ( = ?auto_18217 ?auto_18253 ) ) ( not ( = ?auto_18219 ?auto_18237 ) ) ( not ( = ?auto_18219 ?auto_18247 ) ) ( not ( = ?auto_18219 ?auto_18239 ) ) ( not ( = ?auto_18243 ?auto_18229 ) ) ( not ( = ?auto_18243 ?auto_18248 ) ) ( not ( = ?auto_18243 ?auto_18252 ) ) ( not ( = ?auto_18251 ?auto_18231 ) ) ( not ( = ?auto_18251 ?auto_18233 ) ) ( not ( = ?auto_18251 ?auto_18235 ) ) ( not ( = ?auto_18253 ?auto_18237 ) ) ( not ( = ?auto_18253 ?auto_18247 ) ) ( not ( = ?auto_18253 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18220 ) ) ( not ( = ?auto_18215 ?auto_18250 ) ) ( not ( = ?auto_18216 ?auto_18220 ) ) ( not ( = ?auto_18216 ?auto_18250 ) ) ( not ( = ?auto_18217 ?auto_18220 ) ) ( not ( = ?auto_18217 ?auto_18250 ) ) ( not ( = ?auto_18218 ?auto_18220 ) ) ( not ( = ?auto_18218 ?auto_18250 ) ) ( not ( = ?auto_18220 ?auto_18253 ) ) ( not ( = ?auto_18220 ?auto_18237 ) ) ( not ( = ?auto_18220 ?auto_18247 ) ) ( not ( = ?auto_18220 ?auto_18239 ) ) ( not ( = ?auto_18257 ?auto_18243 ) ) ( not ( = ?auto_18257 ?auto_18229 ) ) ( not ( = ?auto_18257 ?auto_18248 ) ) ( not ( = ?auto_18257 ?auto_18252 ) ) ( not ( = ?auto_18254 ?auto_18251 ) ) ( not ( = ?auto_18254 ?auto_18231 ) ) ( not ( = ?auto_18254 ?auto_18233 ) ) ( not ( = ?auto_18254 ?auto_18235 ) ) ( not ( = ?auto_18250 ?auto_18253 ) ) ( not ( = ?auto_18250 ?auto_18237 ) ) ( not ( = ?auto_18250 ?auto_18247 ) ) ( not ( = ?auto_18250 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18223 ) ) ( not ( = ?auto_18215 ?auto_18255 ) ) ( not ( = ?auto_18216 ?auto_18223 ) ) ( not ( = ?auto_18216 ?auto_18255 ) ) ( not ( = ?auto_18217 ?auto_18223 ) ) ( not ( = ?auto_18217 ?auto_18255 ) ) ( not ( = ?auto_18218 ?auto_18223 ) ) ( not ( = ?auto_18218 ?auto_18255 ) ) ( not ( = ?auto_18219 ?auto_18223 ) ) ( not ( = ?auto_18219 ?auto_18255 ) ) ( not ( = ?auto_18223 ?auto_18250 ) ) ( not ( = ?auto_18223 ?auto_18253 ) ) ( not ( = ?auto_18223 ?auto_18237 ) ) ( not ( = ?auto_18223 ?auto_18247 ) ) ( not ( = ?auto_18223 ?auto_18239 ) ) ( not ( = ?auto_18240 ?auto_18257 ) ) ( not ( = ?auto_18240 ?auto_18243 ) ) ( not ( = ?auto_18240 ?auto_18229 ) ) ( not ( = ?auto_18240 ?auto_18248 ) ) ( not ( = ?auto_18240 ?auto_18252 ) ) ( not ( = ?auto_18238 ?auto_18254 ) ) ( not ( = ?auto_18238 ?auto_18251 ) ) ( not ( = ?auto_18238 ?auto_18231 ) ) ( not ( = ?auto_18238 ?auto_18233 ) ) ( not ( = ?auto_18238 ?auto_18235 ) ) ( not ( = ?auto_18255 ?auto_18250 ) ) ( not ( = ?auto_18255 ?auto_18253 ) ) ( not ( = ?auto_18255 ?auto_18237 ) ) ( not ( = ?auto_18255 ?auto_18247 ) ) ( not ( = ?auto_18255 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18222 ) ) ( not ( = ?auto_18215 ?auto_18246 ) ) ( not ( = ?auto_18216 ?auto_18222 ) ) ( not ( = ?auto_18216 ?auto_18246 ) ) ( not ( = ?auto_18217 ?auto_18222 ) ) ( not ( = ?auto_18217 ?auto_18246 ) ) ( not ( = ?auto_18218 ?auto_18222 ) ) ( not ( = ?auto_18218 ?auto_18246 ) ) ( not ( = ?auto_18219 ?auto_18222 ) ) ( not ( = ?auto_18219 ?auto_18246 ) ) ( not ( = ?auto_18220 ?auto_18222 ) ) ( not ( = ?auto_18220 ?auto_18246 ) ) ( not ( = ?auto_18222 ?auto_18255 ) ) ( not ( = ?auto_18222 ?auto_18250 ) ) ( not ( = ?auto_18222 ?auto_18253 ) ) ( not ( = ?auto_18222 ?auto_18237 ) ) ( not ( = ?auto_18222 ?auto_18247 ) ) ( not ( = ?auto_18222 ?auto_18239 ) ) ( not ( = ?auto_18242 ?auto_18240 ) ) ( not ( = ?auto_18242 ?auto_18257 ) ) ( not ( = ?auto_18242 ?auto_18243 ) ) ( not ( = ?auto_18242 ?auto_18229 ) ) ( not ( = ?auto_18242 ?auto_18248 ) ) ( not ( = ?auto_18242 ?auto_18252 ) ) ( not ( = ?auto_18249 ?auto_18238 ) ) ( not ( = ?auto_18249 ?auto_18254 ) ) ( not ( = ?auto_18249 ?auto_18251 ) ) ( not ( = ?auto_18249 ?auto_18231 ) ) ( not ( = ?auto_18249 ?auto_18233 ) ) ( not ( = ?auto_18249 ?auto_18235 ) ) ( not ( = ?auto_18246 ?auto_18255 ) ) ( not ( = ?auto_18246 ?auto_18250 ) ) ( not ( = ?auto_18246 ?auto_18253 ) ) ( not ( = ?auto_18246 ?auto_18237 ) ) ( not ( = ?auto_18246 ?auto_18247 ) ) ( not ( = ?auto_18246 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18221 ) ) ( not ( = ?auto_18215 ?auto_18258 ) ) ( not ( = ?auto_18216 ?auto_18221 ) ) ( not ( = ?auto_18216 ?auto_18258 ) ) ( not ( = ?auto_18217 ?auto_18221 ) ) ( not ( = ?auto_18217 ?auto_18258 ) ) ( not ( = ?auto_18218 ?auto_18221 ) ) ( not ( = ?auto_18218 ?auto_18258 ) ) ( not ( = ?auto_18219 ?auto_18221 ) ) ( not ( = ?auto_18219 ?auto_18258 ) ) ( not ( = ?auto_18220 ?auto_18221 ) ) ( not ( = ?auto_18220 ?auto_18258 ) ) ( not ( = ?auto_18223 ?auto_18221 ) ) ( not ( = ?auto_18223 ?auto_18258 ) ) ( not ( = ?auto_18221 ?auto_18246 ) ) ( not ( = ?auto_18221 ?auto_18255 ) ) ( not ( = ?auto_18221 ?auto_18250 ) ) ( not ( = ?auto_18221 ?auto_18253 ) ) ( not ( = ?auto_18221 ?auto_18237 ) ) ( not ( = ?auto_18221 ?auto_18247 ) ) ( not ( = ?auto_18221 ?auto_18239 ) ) ( not ( = ?auto_18258 ?auto_18246 ) ) ( not ( = ?auto_18258 ?auto_18255 ) ) ( not ( = ?auto_18258 ?auto_18250 ) ) ( not ( = ?auto_18258 ?auto_18253 ) ) ( not ( = ?auto_18258 ?auto_18237 ) ) ( not ( = ?auto_18258 ?auto_18247 ) ) ( not ( = ?auto_18258 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18224 ) ) ( not ( = ?auto_18215 ?auto_18241 ) ) ( not ( = ?auto_18216 ?auto_18224 ) ) ( not ( = ?auto_18216 ?auto_18241 ) ) ( not ( = ?auto_18217 ?auto_18224 ) ) ( not ( = ?auto_18217 ?auto_18241 ) ) ( not ( = ?auto_18218 ?auto_18224 ) ) ( not ( = ?auto_18218 ?auto_18241 ) ) ( not ( = ?auto_18219 ?auto_18224 ) ) ( not ( = ?auto_18219 ?auto_18241 ) ) ( not ( = ?auto_18220 ?auto_18224 ) ) ( not ( = ?auto_18220 ?auto_18241 ) ) ( not ( = ?auto_18223 ?auto_18224 ) ) ( not ( = ?auto_18223 ?auto_18241 ) ) ( not ( = ?auto_18222 ?auto_18224 ) ) ( not ( = ?auto_18222 ?auto_18241 ) ) ( not ( = ?auto_18224 ?auto_18258 ) ) ( not ( = ?auto_18224 ?auto_18246 ) ) ( not ( = ?auto_18224 ?auto_18255 ) ) ( not ( = ?auto_18224 ?auto_18250 ) ) ( not ( = ?auto_18224 ?auto_18253 ) ) ( not ( = ?auto_18224 ?auto_18237 ) ) ( not ( = ?auto_18224 ?auto_18247 ) ) ( not ( = ?auto_18224 ?auto_18239 ) ) ( not ( = ?auto_18236 ?auto_18242 ) ) ( not ( = ?auto_18236 ?auto_18240 ) ) ( not ( = ?auto_18236 ?auto_18257 ) ) ( not ( = ?auto_18236 ?auto_18243 ) ) ( not ( = ?auto_18236 ?auto_18229 ) ) ( not ( = ?auto_18236 ?auto_18248 ) ) ( not ( = ?auto_18236 ?auto_18252 ) ) ( not ( = ?auto_18234 ?auto_18249 ) ) ( not ( = ?auto_18234 ?auto_18238 ) ) ( not ( = ?auto_18234 ?auto_18254 ) ) ( not ( = ?auto_18234 ?auto_18251 ) ) ( not ( = ?auto_18234 ?auto_18231 ) ) ( not ( = ?auto_18234 ?auto_18233 ) ) ( not ( = ?auto_18234 ?auto_18235 ) ) ( not ( = ?auto_18241 ?auto_18258 ) ) ( not ( = ?auto_18241 ?auto_18246 ) ) ( not ( = ?auto_18241 ?auto_18255 ) ) ( not ( = ?auto_18241 ?auto_18250 ) ) ( not ( = ?auto_18241 ?auto_18253 ) ) ( not ( = ?auto_18241 ?auto_18237 ) ) ( not ( = ?auto_18241 ?auto_18247 ) ) ( not ( = ?auto_18241 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18226 ) ) ( not ( = ?auto_18215 ?auto_18244 ) ) ( not ( = ?auto_18216 ?auto_18226 ) ) ( not ( = ?auto_18216 ?auto_18244 ) ) ( not ( = ?auto_18217 ?auto_18226 ) ) ( not ( = ?auto_18217 ?auto_18244 ) ) ( not ( = ?auto_18218 ?auto_18226 ) ) ( not ( = ?auto_18218 ?auto_18244 ) ) ( not ( = ?auto_18219 ?auto_18226 ) ) ( not ( = ?auto_18219 ?auto_18244 ) ) ( not ( = ?auto_18220 ?auto_18226 ) ) ( not ( = ?auto_18220 ?auto_18244 ) ) ( not ( = ?auto_18223 ?auto_18226 ) ) ( not ( = ?auto_18223 ?auto_18244 ) ) ( not ( = ?auto_18222 ?auto_18226 ) ) ( not ( = ?auto_18222 ?auto_18244 ) ) ( not ( = ?auto_18221 ?auto_18226 ) ) ( not ( = ?auto_18221 ?auto_18244 ) ) ( not ( = ?auto_18226 ?auto_18241 ) ) ( not ( = ?auto_18226 ?auto_18258 ) ) ( not ( = ?auto_18226 ?auto_18246 ) ) ( not ( = ?auto_18226 ?auto_18255 ) ) ( not ( = ?auto_18226 ?auto_18250 ) ) ( not ( = ?auto_18226 ?auto_18253 ) ) ( not ( = ?auto_18226 ?auto_18237 ) ) ( not ( = ?auto_18226 ?auto_18247 ) ) ( not ( = ?auto_18226 ?auto_18239 ) ) ( not ( = ?auto_18245 ?auto_18236 ) ) ( not ( = ?auto_18245 ?auto_18242 ) ) ( not ( = ?auto_18245 ?auto_18240 ) ) ( not ( = ?auto_18245 ?auto_18257 ) ) ( not ( = ?auto_18245 ?auto_18243 ) ) ( not ( = ?auto_18245 ?auto_18229 ) ) ( not ( = ?auto_18245 ?auto_18248 ) ) ( not ( = ?auto_18245 ?auto_18252 ) ) ( not ( = ?auto_18256 ?auto_18234 ) ) ( not ( = ?auto_18256 ?auto_18249 ) ) ( not ( = ?auto_18256 ?auto_18238 ) ) ( not ( = ?auto_18256 ?auto_18254 ) ) ( not ( = ?auto_18256 ?auto_18251 ) ) ( not ( = ?auto_18256 ?auto_18231 ) ) ( not ( = ?auto_18256 ?auto_18233 ) ) ( not ( = ?auto_18256 ?auto_18235 ) ) ( not ( = ?auto_18244 ?auto_18241 ) ) ( not ( = ?auto_18244 ?auto_18258 ) ) ( not ( = ?auto_18244 ?auto_18246 ) ) ( not ( = ?auto_18244 ?auto_18255 ) ) ( not ( = ?auto_18244 ?auto_18250 ) ) ( not ( = ?auto_18244 ?auto_18253 ) ) ( not ( = ?auto_18244 ?auto_18237 ) ) ( not ( = ?auto_18244 ?auto_18247 ) ) ( not ( = ?auto_18244 ?auto_18239 ) ) ( not ( = ?auto_18215 ?auto_18225 ) ) ( not ( = ?auto_18215 ?auto_18232 ) ) ( not ( = ?auto_18216 ?auto_18225 ) ) ( not ( = ?auto_18216 ?auto_18232 ) ) ( not ( = ?auto_18217 ?auto_18225 ) ) ( not ( = ?auto_18217 ?auto_18232 ) ) ( not ( = ?auto_18218 ?auto_18225 ) ) ( not ( = ?auto_18218 ?auto_18232 ) ) ( not ( = ?auto_18219 ?auto_18225 ) ) ( not ( = ?auto_18219 ?auto_18232 ) ) ( not ( = ?auto_18220 ?auto_18225 ) ) ( not ( = ?auto_18220 ?auto_18232 ) ) ( not ( = ?auto_18223 ?auto_18225 ) ) ( not ( = ?auto_18223 ?auto_18232 ) ) ( not ( = ?auto_18222 ?auto_18225 ) ) ( not ( = ?auto_18222 ?auto_18232 ) ) ( not ( = ?auto_18221 ?auto_18225 ) ) ( not ( = ?auto_18221 ?auto_18232 ) ) ( not ( = ?auto_18224 ?auto_18225 ) ) ( not ( = ?auto_18224 ?auto_18232 ) ) ( not ( = ?auto_18225 ?auto_18244 ) ) ( not ( = ?auto_18225 ?auto_18241 ) ) ( not ( = ?auto_18225 ?auto_18258 ) ) ( not ( = ?auto_18225 ?auto_18246 ) ) ( not ( = ?auto_18225 ?auto_18255 ) ) ( not ( = ?auto_18225 ?auto_18250 ) ) ( not ( = ?auto_18225 ?auto_18253 ) ) ( not ( = ?auto_18225 ?auto_18237 ) ) ( not ( = ?auto_18225 ?auto_18247 ) ) ( not ( = ?auto_18225 ?auto_18239 ) ) ( not ( = ?auto_18232 ?auto_18244 ) ) ( not ( = ?auto_18232 ?auto_18241 ) ) ( not ( = ?auto_18232 ?auto_18258 ) ) ( not ( = ?auto_18232 ?auto_18246 ) ) ( not ( = ?auto_18232 ?auto_18255 ) ) ( not ( = ?auto_18232 ?auto_18250 ) ) ( not ( = ?auto_18232 ?auto_18253 ) ) ( not ( = ?auto_18232 ?auto_18237 ) ) ( not ( = ?auto_18232 ?auto_18247 ) ) ( not ( = ?auto_18232 ?auto_18239 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_18215 ?auto_18216 ?auto_18217 ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18223 ?auto_18222 ?auto_18221 ?auto_18224 ?auto_18226 )
      ( MAKE-1CRATE ?auto_18226 ?auto_18225 )
      ( MAKE-11CRATE-VERIFY ?auto_18215 ?auto_18216 ?auto_18217 ?auto_18218 ?auto_18219 ?auto_18220 ?auto_18223 ?auto_18222 ?auto_18221 ?auto_18224 ?auto_18226 ?auto_18225 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18261 - SURFACE
      ?auto_18262 - SURFACE
    )
    :vars
    (
      ?auto_18263 - HOIST
      ?auto_18264 - PLACE
      ?auto_18266 - PLACE
      ?auto_18267 - HOIST
      ?auto_18268 - SURFACE
      ?auto_18265 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18263 ?auto_18264 ) ( SURFACE-AT ?auto_18261 ?auto_18264 ) ( CLEAR ?auto_18261 ) ( IS-CRATE ?auto_18262 ) ( AVAILABLE ?auto_18263 ) ( not ( = ?auto_18266 ?auto_18264 ) ) ( HOIST-AT ?auto_18267 ?auto_18266 ) ( AVAILABLE ?auto_18267 ) ( SURFACE-AT ?auto_18262 ?auto_18266 ) ( ON ?auto_18262 ?auto_18268 ) ( CLEAR ?auto_18262 ) ( TRUCK-AT ?auto_18265 ?auto_18264 ) ( not ( = ?auto_18261 ?auto_18262 ) ) ( not ( = ?auto_18261 ?auto_18268 ) ) ( not ( = ?auto_18262 ?auto_18268 ) ) ( not ( = ?auto_18263 ?auto_18267 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18265 ?auto_18264 ?auto_18266 )
      ( !LIFT ?auto_18267 ?auto_18262 ?auto_18268 ?auto_18266 )
      ( !LOAD ?auto_18267 ?auto_18262 ?auto_18265 ?auto_18266 )
      ( !DRIVE ?auto_18265 ?auto_18266 ?auto_18264 )
      ( !UNLOAD ?auto_18263 ?auto_18262 ?auto_18265 ?auto_18264 )
      ( !DROP ?auto_18263 ?auto_18262 ?auto_18261 ?auto_18264 )
      ( MAKE-1CRATE-VERIFY ?auto_18261 ?auto_18262 ) )
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
      ?auto_18290 - SURFACE
      ?auto_18289 - SURFACE
      ?auto_18288 - SURFACE
      ?auto_18291 - SURFACE
      ?auto_18293 - SURFACE
      ?auto_18292 - SURFACE
      ?auto_18294 - SURFACE
    )
    :vars
    (
      ?auto_18295 - HOIST
      ?auto_18296 - PLACE
      ?auto_18298 - PLACE
      ?auto_18297 - HOIST
      ?auto_18300 - SURFACE
      ?auto_18305 - PLACE
      ?auto_18318 - HOIST
      ?auto_18320 - SURFACE
      ?auto_18314 - PLACE
      ?auto_18315 - HOIST
      ?auto_18321 - SURFACE
      ?auto_18309 - PLACE
      ?auto_18319 - HOIST
      ?auto_18307 - SURFACE
      ?auto_18328 - PLACE
      ?auto_18304 - HOIST
      ?auto_18312 - SURFACE
      ?auto_18324 - SURFACE
      ?auto_18313 - PLACE
      ?auto_18322 - HOIST
      ?auto_18325 - SURFACE
      ?auto_18302 - PLACE
      ?auto_18316 - HOIST
      ?auto_18311 - SURFACE
      ?auto_18327 - PLACE
      ?auto_18317 - HOIST
      ?auto_18308 - SURFACE
      ?auto_18323 - SURFACE
      ?auto_18306 - PLACE
      ?auto_18310 - HOIST
      ?auto_18326 - SURFACE
      ?auto_18301 - PLACE
      ?auto_18329 - HOIST
      ?auto_18303 - SURFACE
      ?auto_18299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18295 ?auto_18296 ) ( IS-CRATE ?auto_18294 ) ( not ( = ?auto_18298 ?auto_18296 ) ) ( HOIST-AT ?auto_18297 ?auto_18298 ) ( AVAILABLE ?auto_18297 ) ( SURFACE-AT ?auto_18294 ?auto_18298 ) ( ON ?auto_18294 ?auto_18300 ) ( CLEAR ?auto_18294 ) ( not ( = ?auto_18292 ?auto_18294 ) ) ( not ( = ?auto_18292 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18300 ) ) ( not ( = ?auto_18295 ?auto_18297 ) ) ( IS-CRATE ?auto_18292 ) ( not ( = ?auto_18305 ?auto_18296 ) ) ( HOIST-AT ?auto_18318 ?auto_18305 ) ( SURFACE-AT ?auto_18292 ?auto_18305 ) ( ON ?auto_18292 ?auto_18320 ) ( CLEAR ?auto_18292 ) ( not ( = ?auto_18293 ?auto_18292 ) ) ( not ( = ?auto_18293 ?auto_18320 ) ) ( not ( = ?auto_18292 ?auto_18320 ) ) ( not ( = ?auto_18295 ?auto_18318 ) ) ( IS-CRATE ?auto_18293 ) ( not ( = ?auto_18314 ?auto_18296 ) ) ( HOIST-AT ?auto_18315 ?auto_18314 ) ( AVAILABLE ?auto_18315 ) ( SURFACE-AT ?auto_18293 ?auto_18314 ) ( ON ?auto_18293 ?auto_18321 ) ( CLEAR ?auto_18293 ) ( not ( = ?auto_18291 ?auto_18293 ) ) ( not ( = ?auto_18291 ?auto_18321 ) ) ( not ( = ?auto_18293 ?auto_18321 ) ) ( not ( = ?auto_18295 ?auto_18315 ) ) ( IS-CRATE ?auto_18291 ) ( not ( = ?auto_18309 ?auto_18296 ) ) ( HOIST-AT ?auto_18319 ?auto_18309 ) ( AVAILABLE ?auto_18319 ) ( SURFACE-AT ?auto_18291 ?auto_18309 ) ( ON ?auto_18291 ?auto_18307 ) ( CLEAR ?auto_18291 ) ( not ( = ?auto_18288 ?auto_18291 ) ) ( not ( = ?auto_18288 ?auto_18307 ) ) ( not ( = ?auto_18291 ?auto_18307 ) ) ( not ( = ?auto_18295 ?auto_18319 ) ) ( IS-CRATE ?auto_18288 ) ( not ( = ?auto_18328 ?auto_18296 ) ) ( HOIST-AT ?auto_18304 ?auto_18328 ) ( SURFACE-AT ?auto_18288 ?auto_18328 ) ( ON ?auto_18288 ?auto_18312 ) ( CLEAR ?auto_18288 ) ( not ( = ?auto_18289 ?auto_18288 ) ) ( not ( = ?auto_18289 ?auto_18312 ) ) ( not ( = ?auto_18288 ?auto_18312 ) ) ( not ( = ?auto_18295 ?auto_18304 ) ) ( IS-CRATE ?auto_18289 ) ( AVAILABLE ?auto_18304 ) ( SURFACE-AT ?auto_18289 ?auto_18328 ) ( ON ?auto_18289 ?auto_18324 ) ( CLEAR ?auto_18289 ) ( not ( = ?auto_18290 ?auto_18289 ) ) ( not ( = ?auto_18290 ?auto_18324 ) ) ( not ( = ?auto_18289 ?auto_18324 ) ) ( IS-CRATE ?auto_18290 ) ( not ( = ?auto_18313 ?auto_18296 ) ) ( HOIST-AT ?auto_18322 ?auto_18313 ) ( AVAILABLE ?auto_18322 ) ( SURFACE-AT ?auto_18290 ?auto_18313 ) ( ON ?auto_18290 ?auto_18325 ) ( CLEAR ?auto_18290 ) ( not ( = ?auto_18287 ?auto_18290 ) ) ( not ( = ?auto_18287 ?auto_18325 ) ) ( not ( = ?auto_18290 ?auto_18325 ) ) ( not ( = ?auto_18295 ?auto_18322 ) ) ( IS-CRATE ?auto_18287 ) ( not ( = ?auto_18302 ?auto_18296 ) ) ( HOIST-AT ?auto_18316 ?auto_18302 ) ( AVAILABLE ?auto_18316 ) ( SURFACE-AT ?auto_18287 ?auto_18302 ) ( ON ?auto_18287 ?auto_18311 ) ( CLEAR ?auto_18287 ) ( not ( = ?auto_18286 ?auto_18287 ) ) ( not ( = ?auto_18286 ?auto_18311 ) ) ( not ( = ?auto_18287 ?auto_18311 ) ) ( not ( = ?auto_18295 ?auto_18316 ) ) ( IS-CRATE ?auto_18286 ) ( not ( = ?auto_18327 ?auto_18296 ) ) ( HOIST-AT ?auto_18317 ?auto_18327 ) ( AVAILABLE ?auto_18317 ) ( SURFACE-AT ?auto_18286 ?auto_18327 ) ( ON ?auto_18286 ?auto_18308 ) ( CLEAR ?auto_18286 ) ( not ( = ?auto_18285 ?auto_18286 ) ) ( not ( = ?auto_18285 ?auto_18308 ) ) ( not ( = ?auto_18286 ?auto_18308 ) ) ( not ( = ?auto_18295 ?auto_18317 ) ) ( IS-CRATE ?auto_18285 ) ( AVAILABLE ?auto_18318 ) ( SURFACE-AT ?auto_18285 ?auto_18305 ) ( ON ?auto_18285 ?auto_18323 ) ( CLEAR ?auto_18285 ) ( not ( = ?auto_18284 ?auto_18285 ) ) ( not ( = ?auto_18284 ?auto_18323 ) ) ( not ( = ?auto_18285 ?auto_18323 ) ) ( IS-CRATE ?auto_18284 ) ( not ( = ?auto_18306 ?auto_18296 ) ) ( HOIST-AT ?auto_18310 ?auto_18306 ) ( AVAILABLE ?auto_18310 ) ( SURFACE-AT ?auto_18284 ?auto_18306 ) ( ON ?auto_18284 ?auto_18326 ) ( CLEAR ?auto_18284 ) ( not ( = ?auto_18283 ?auto_18284 ) ) ( not ( = ?auto_18283 ?auto_18326 ) ) ( not ( = ?auto_18284 ?auto_18326 ) ) ( not ( = ?auto_18295 ?auto_18310 ) ) ( SURFACE-AT ?auto_18282 ?auto_18296 ) ( CLEAR ?auto_18282 ) ( IS-CRATE ?auto_18283 ) ( AVAILABLE ?auto_18295 ) ( not ( = ?auto_18301 ?auto_18296 ) ) ( HOIST-AT ?auto_18329 ?auto_18301 ) ( AVAILABLE ?auto_18329 ) ( SURFACE-AT ?auto_18283 ?auto_18301 ) ( ON ?auto_18283 ?auto_18303 ) ( CLEAR ?auto_18283 ) ( TRUCK-AT ?auto_18299 ?auto_18296 ) ( not ( = ?auto_18282 ?auto_18283 ) ) ( not ( = ?auto_18282 ?auto_18303 ) ) ( not ( = ?auto_18283 ?auto_18303 ) ) ( not ( = ?auto_18295 ?auto_18329 ) ) ( not ( = ?auto_18282 ?auto_18284 ) ) ( not ( = ?auto_18282 ?auto_18326 ) ) ( not ( = ?auto_18284 ?auto_18303 ) ) ( not ( = ?auto_18306 ?auto_18301 ) ) ( not ( = ?auto_18310 ?auto_18329 ) ) ( not ( = ?auto_18326 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18285 ) ) ( not ( = ?auto_18282 ?auto_18323 ) ) ( not ( = ?auto_18283 ?auto_18285 ) ) ( not ( = ?auto_18283 ?auto_18323 ) ) ( not ( = ?auto_18285 ?auto_18326 ) ) ( not ( = ?auto_18285 ?auto_18303 ) ) ( not ( = ?auto_18305 ?auto_18306 ) ) ( not ( = ?auto_18305 ?auto_18301 ) ) ( not ( = ?auto_18318 ?auto_18310 ) ) ( not ( = ?auto_18318 ?auto_18329 ) ) ( not ( = ?auto_18323 ?auto_18326 ) ) ( not ( = ?auto_18323 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18286 ) ) ( not ( = ?auto_18282 ?auto_18308 ) ) ( not ( = ?auto_18283 ?auto_18286 ) ) ( not ( = ?auto_18283 ?auto_18308 ) ) ( not ( = ?auto_18284 ?auto_18286 ) ) ( not ( = ?auto_18284 ?auto_18308 ) ) ( not ( = ?auto_18286 ?auto_18323 ) ) ( not ( = ?auto_18286 ?auto_18326 ) ) ( not ( = ?auto_18286 ?auto_18303 ) ) ( not ( = ?auto_18327 ?auto_18305 ) ) ( not ( = ?auto_18327 ?auto_18306 ) ) ( not ( = ?auto_18327 ?auto_18301 ) ) ( not ( = ?auto_18317 ?auto_18318 ) ) ( not ( = ?auto_18317 ?auto_18310 ) ) ( not ( = ?auto_18317 ?auto_18329 ) ) ( not ( = ?auto_18308 ?auto_18323 ) ) ( not ( = ?auto_18308 ?auto_18326 ) ) ( not ( = ?auto_18308 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18287 ) ) ( not ( = ?auto_18282 ?auto_18311 ) ) ( not ( = ?auto_18283 ?auto_18287 ) ) ( not ( = ?auto_18283 ?auto_18311 ) ) ( not ( = ?auto_18284 ?auto_18287 ) ) ( not ( = ?auto_18284 ?auto_18311 ) ) ( not ( = ?auto_18285 ?auto_18287 ) ) ( not ( = ?auto_18285 ?auto_18311 ) ) ( not ( = ?auto_18287 ?auto_18308 ) ) ( not ( = ?auto_18287 ?auto_18323 ) ) ( not ( = ?auto_18287 ?auto_18326 ) ) ( not ( = ?auto_18287 ?auto_18303 ) ) ( not ( = ?auto_18302 ?auto_18327 ) ) ( not ( = ?auto_18302 ?auto_18305 ) ) ( not ( = ?auto_18302 ?auto_18306 ) ) ( not ( = ?auto_18302 ?auto_18301 ) ) ( not ( = ?auto_18316 ?auto_18317 ) ) ( not ( = ?auto_18316 ?auto_18318 ) ) ( not ( = ?auto_18316 ?auto_18310 ) ) ( not ( = ?auto_18316 ?auto_18329 ) ) ( not ( = ?auto_18311 ?auto_18308 ) ) ( not ( = ?auto_18311 ?auto_18323 ) ) ( not ( = ?auto_18311 ?auto_18326 ) ) ( not ( = ?auto_18311 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18290 ) ) ( not ( = ?auto_18282 ?auto_18325 ) ) ( not ( = ?auto_18283 ?auto_18290 ) ) ( not ( = ?auto_18283 ?auto_18325 ) ) ( not ( = ?auto_18284 ?auto_18290 ) ) ( not ( = ?auto_18284 ?auto_18325 ) ) ( not ( = ?auto_18285 ?auto_18290 ) ) ( not ( = ?auto_18285 ?auto_18325 ) ) ( not ( = ?auto_18286 ?auto_18290 ) ) ( not ( = ?auto_18286 ?auto_18325 ) ) ( not ( = ?auto_18290 ?auto_18311 ) ) ( not ( = ?auto_18290 ?auto_18308 ) ) ( not ( = ?auto_18290 ?auto_18323 ) ) ( not ( = ?auto_18290 ?auto_18326 ) ) ( not ( = ?auto_18290 ?auto_18303 ) ) ( not ( = ?auto_18313 ?auto_18302 ) ) ( not ( = ?auto_18313 ?auto_18327 ) ) ( not ( = ?auto_18313 ?auto_18305 ) ) ( not ( = ?auto_18313 ?auto_18306 ) ) ( not ( = ?auto_18313 ?auto_18301 ) ) ( not ( = ?auto_18322 ?auto_18316 ) ) ( not ( = ?auto_18322 ?auto_18317 ) ) ( not ( = ?auto_18322 ?auto_18318 ) ) ( not ( = ?auto_18322 ?auto_18310 ) ) ( not ( = ?auto_18322 ?auto_18329 ) ) ( not ( = ?auto_18325 ?auto_18311 ) ) ( not ( = ?auto_18325 ?auto_18308 ) ) ( not ( = ?auto_18325 ?auto_18323 ) ) ( not ( = ?auto_18325 ?auto_18326 ) ) ( not ( = ?auto_18325 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18289 ) ) ( not ( = ?auto_18282 ?auto_18324 ) ) ( not ( = ?auto_18283 ?auto_18289 ) ) ( not ( = ?auto_18283 ?auto_18324 ) ) ( not ( = ?auto_18284 ?auto_18289 ) ) ( not ( = ?auto_18284 ?auto_18324 ) ) ( not ( = ?auto_18285 ?auto_18289 ) ) ( not ( = ?auto_18285 ?auto_18324 ) ) ( not ( = ?auto_18286 ?auto_18289 ) ) ( not ( = ?auto_18286 ?auto_18324 ) ) ( not ( = ?auto_18287 ?auto_18289 ) ) ( not ( = ?auto_18287 ?auto_18324 ) ) ( not ( = ?auto_18289 ?auto_18325 ) ) ( not ( = ?auto_18289 ?auto_18311 ) ) ( not ( = ?auto_18289 ?auto_18308 ) ) ( not ( = ?auto_18289 ?auto_18323 ) ) ( not ( = ?auto_18289 ?auto_18326 ) ) ( not ( = ?auto_18289 ?auto_18303 ) ) ( not ( = ?auto_18328 ?auto_18313 ) ) ( not ( = ?auto_18328 ?auto_18302 ) ) ( not ( = ?auto_18328 ?auto_18327 ) ) ( not ( = ?auto_18328 ?auto_18305 ) ) ( not ( = ?auto_18328 ?auto_18306 ) ) ( not ( = ?auto_18328 ?auto_18301 ) ) ( not ( = ?auto_18304 ?auto_18322 ) ) ( not ( = ?auto_18304 ?auto_18316 ) ) ( not ( = ?auto_18304 ?auto_18317 ) ) ( not ( = ?auto_18304 ?auto_18318 ) ) ( not ( = ?auto_18304 ?auto_18310 ) ) ( not ( = ?auto_18304 ?auto_18329 ) ) ( not ( = ?auto_18324 ?auto_18325 ) ) ( not ( = ?auto_18324 ?auto_18311 ) ) ( not ( = ?auto_18324 ?auto_18308 ) ) ( not ( = ?auto_18324 ?auto_18323 ) ) ( not ( = ?auto_18324 ?auto_18326 ) ) ( not ( = ?auto_18324 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18288 ) ) ( not ( = ?auto_18282 ?auto_18312 ) ) ( not ( = ?auto_18283 ?auto_18288 ) ) ( not ( = ?auto_18283 ?auto_18312 ) ) ( not ( = ?auto_18284 ?auto_18288 ) ) ( not ( = ?auto_18284 ?auto_18312 ) ) ( not ( = ?auto_18285 ?auto_18288 ) ) ( not ( = ?auto_18285 ?auto_18312 ) ) ( not ( = ?auto_18286 ?auto_18288 ) ) ( not ( = ?auto_18286 ?auto_18312 ) ) ( not ( = ?auto_18287 ?auto_18288 ) ) ( not ( = ?auto_18287 ?auto_18312 ) ) ( not ( = ?auto_18290 ?auto_18288 ) ) ( not ( = ?auto_18290 ?auto_18312 ) ) ( not ( = ?auto_18288 ?auto_18324 ) ) ( not ( = ?auto_18288 ?auto_18325 ) ) ( not ( = ?auto_18288 ?auto_18311 ) ) ( not ( = ?auto_18288 ?auto_18308 ) ) ( not ( = ?auto_18288 ?auto_18323 ) ) ( not ( = ?auto_18288 ?auto_18326 ) ) ( not ( = ?auto_18288 ?auto_18303 ) ) ( not ( = ?auto_18312 ?auto_18324 ) ) ( not ( = ?auto_18312 ?auto_18325 ) ) ( not ( = ?auto_18312 ?auto_18311 ) ) ( not ( = ?auto_18312 ?auto_18308 ) ) ( not ( = ?auto_18312 ?auto_18323 ) ) ( not ( = ?auto_18312 ?auto_18326 ) ) ( not ( = ?auto_18312 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18291 ) ) ( not ( = ?auto_18282 ?auto_18307 ) ) ( not ( = ?auto_18283 ?auto_18291 ) ) ( not ( = ?auto_18283 ?auto_18307 ) ) ( not ( = ?auto_18284 ?auto_18291 ) ) ( not ( = ?auto_18284 ?auto_18307 ) ) ( not ( = ?auto_18285 ?auto_18291 ) ) ( not ( = ?auto_18285 ?auto_18307 ) ) ( not ( = ?auto_18286 ?auto_18291 ) ) ( not ( = ?auto_18286 ?auto_18307 ) ) ( not ( = ?auto_18287 ?auto_18291 ) ) ( not ( = ?auto_18287 ?auto_18307 ) ) ( not ( = ?auto_18290 ?auto_18291 ) ) ( not ( = ?auto_18290 ?auto_18307 ) ) ( not ( = ?auto_18289 ?auto_18291 ) ) ( not ( = ?auto_18289 ?auto_18307 ) ) ( not ( = ?auto_18291 ?auto_18312 ) ) ( not ( = ?auto_18291 ?auto_18324 ) ) ( not ( = ?auto_18291 ?auto_18325 ) ) ( not ( = ?auto_18291 ?auto_18311 ) ) ( not ( = ?auto_18291 ?auto_18308 ) ) ( not ( = ?auto_18291 ?auto_18323 ) ) ( not ( = ?auto_18291 ?auto_18326 ) ) ( not ( = ?auto_18291 ?auto_18303 ) ) ( not ( = ?auto_18309 ?auto_18328 ) ) ( not ( = ?auto_18309 ?auto_18313 ) ) ( not ( = ?auto_18309 ?auto_18302 ) ) ( not ( = ?auto_18309 ?auto_18327 ) ) ( not ( = ?auto_18309 ?auto_18305 ) ) ( not ( = ?auto_18309 ?auto_18306 ) ) ( not ( = ?auto_18309 ?auto_18301 ) ) ( not ( = ?auto_18319 ?auto_18304 ) ) ( not ( = ?auto_18319 ?auto_18322 ) ) ( not ( = ?auto_18319 ?auto_18316 ) ) ( not ( = ?auto_18319 ?auto_18317 ) ) ( not ( = ?auto_18319 ?auto_18318 ) ) ( not ( = ?auto_18319 ?auto_18310 ) ) ( not ( = ?auto_18319 ?auto_18329 ) ) ( not ( = ?auto_18307 ?auto_18312 ) ) ( not ( = ?auto_18307 ?auto_18324 ) ) ( not ( = ?auto_18307 ?auto_18325 ) ) ( not ( = ?auto_18307 ?auto_18311 ) ) ( not ( = ?auto_18307 ?auto_18308 ) ) ( not ( = ?auto_18307 ?auto_18323 ) ) ( not ( = ?auto_18307 ?auto_18326 ) ) ( not ( = ?auto_18307 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18293 ) ) ( not ( = ?auto_18282 ?auto_18321 ) ) ( not ( = ?auto_18283 ?auto_18293 ) ) ( not ( = ?auto_18283 ?auto_18321 ) ) ( not ( = ?auto_18284 ?auto_18293 ) ) ( not ( = ?auto_18284 ?auto_18321 ) ) ( not ( = ?auto_18285 ?auto_18293 ) ) ( not ( = ?auto_18285 ?auto_18321 ) ) ( not ( = ?auto_18286 ?auto_18293 ) ) ( not ( = ?auto_18286 ?auto_18321 ) ) ( not ( = ?auto_18287 ?auto_18293 ) ) ( not ( = ?auto_18287 ?auto_18321 ) ) ( not ( = ?auto_18290 ?auto_18293 ) ) ( not ( = ?auto_18290 ?auto_18321 ) ) ( not ( = ?auto_18289 ?auto_18293 ) ) ( not ( = ?auto_18289 ?auto_18321 ) ) ( not ( = ?auto_18288 ?auto_18293 ) ) ( not ( = ?auto_18288 ?auto_18321 ) ) ( not ( = ?auto_18293 ?auto_18307 ) ) ( not ( = ?auto_18293 ?auto_18312 ) ) ( not ( = ?auto_18293 ?auto_18324 ) ) ( not ( = ?auto_18293 ?auto_18325 ) ) ( not ( = ?auto_18293 ?auto_18311 ) ) ( not ( = ?auto_18293 ?auto_18308 ) ) ( not ( = ?auto_18293 ?auto_18323 ) ) ( not ( = ?auto_18293 ?auto_18326 ) ) ( not ( = ?auto_18293 ?auto_18303 ) ) ( not ( = ?auto_18314 ?auto_18309 ) ) ( not ( = ?auto_18314 ?auto_18328 ) ) ( not ( = ?auto_18314 ?auto_18313 ) ) ( not ( = ?auto_18314 ?auto_18302 ) ) ( not ( = ?auto_18314 ?auto_18327 ) ) ( not ( = ?auto_18314 ?auto_18305 ) ) ( not ( = ?auto_18314 ?auto_18306 ) ) ( not ( = ?auto_18314 ?auto_18301 ) ) ( not ( = ?auto_18315 ?auto_18319 ) ) ( not ( = ?auto_18315 ?auto_18304 ) ) ( not ( = ?auto_18315 ?auto_18322 ) ) ( not ( = ?auto_18315 ?auto_18316 ) ) ( not ( = ?auto_18315 ?auto_18317 ) ) ( not ( = ?auto_18315 ?auto_18318 ) ) ( not ( = ?auto_18315 ?auto_18310 ) ) ( not ( = ?auto_18315 ?auto_18329 ) ) ( not ( = ?auto_18321 ?auto_18307 ) ) ( not ( = ?auto_18321 ?auto_18312 ) ) ( not ( = ?auto_18321 ?auto_18324 ) ) ( not ( = ?auto_18321 ?auto_18325 ) ) ( not ( = ?auto_18321 ?auto_18311 ) ) ( not ( = ?auto_18321 ?auto_18308 ) ) ( not ( = ?auto_18321 ?auto_18323 ) ) ( not ( = ?auto_18321 ?auto_18326 ) ) ( not ( = ?auto_18321 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18292 ) ) ( not ( = ?auto_18282 ?auto_18320 ) ) ( not ( = ?auto_18283 ?auto_18292 ) ) ( not ( = ?auto_18283 ?auto_18320 ) ) ( not ( = ?auto_18284 ?auto_18292 ) ) ( not ( = ?auto_18284 ?auto_18320 ) ) ( not ( = ?auto_18285 ?auto_18292 ) ) ( not ( = ?auto_18285 ?auto_18320 ) ) ( not ( = ?auto_18286 ?auto_18292 ) ) ( not ( = ?auto_18286 ?auto_18320 ) ) ( not ( = ?auto_18287 ?auto_18292 ) ) ( not ( = ?auto_18287 ?auto_18320 ) ) ( not ( = ?auto_18290 ?auto_18292 ) ) ( not ( = ?auto_18290 ?auto_18320 ) ) ( not ( = ?auto_18289 ?auto_18292 ) ) ( not ( = ?auto_18289 ?auto_18320 ) ) ( not ( = ?auto_18288 ?auto_18292 ) ) ( not ( = ?auto_18288 ?auto_18320 ) ) ( not ( = ?auto_18291 ?auto_18292 ) ) ( not ( = ?auto_18291 ?auto_18320 ) ) ( not ( = ?auto_18292 ?auto_18321 ) ) ( not ( = ?auto_18292 ?auto_18307 ) ) ( not ( = ?auto_18292 ?auto_18312 ) ) ( not ( = ?auto_18292 ?auto_18324 ) ) ( not ( = ?auto_18292 ?auto_18325 ) ) ( not ( = ?auto_18292 ?auto_18311 ) ) ( not ( = ?auto_18292 ?auto_18308 ) ) ( not ( = ?auto_18292 ?auto_18323 ) ) ( not ( = ?auto_18292 ?auto_18326 ) ) ( not ( = ?auto_18292 ?auto_18303 ) ) ( not ( = ?auto_18320 ?auto_18321 ) ) ( not ( = ?auto_18320 ?auto_18307 ) ) ( not ( = ?auto_18320 ?auto_18312 ) ) ( not ( = ?auto_18320 ?auto_18324 ) ) ( not ( = ?auto_18320 ?auto_18325 ) ) ( not ( = ?auto_18320 ?auto_18311 ) ) ( not ( = ?auto_18320 ?auto_18308 ) ) ( not ( = ?auto_18320 ?auto_18323 ) ) ( not ( = ?auto_18320 ?auto_18326 ) ) ( not ( = ?auto_18320 ?auto_18303 ) ) ( not ( = ?auto_18282 ?auto_18294 ) ) ( not ( = ?auto_18282 ?auto_18300 ) ) ( not ( = ?auto_18283 ?auto_18294 ) ) ( not ( = ?auto_18283 ?auto_18300 ) ) ( not ( = ?auto_18284 ?auto_18294 ) ) ( not ( = ?auto_18284 ?auto_18300 ) ) ( not ( = ?auto_18285 ?auto_18294 ) ) ( not ( = ?auto_18285 ?auto_18300 ) ) ( not ( = ?auto_18286 ?auto_18294 ) ) ( not ( = ?auto_18286 ?auto_18300 ) ) ( not ( = ?auto_18287 ?auto_18294 ) ) ( not ( = ?auto_18287 ?auto_18300 ) ) ( not ( = ?auto_18290 ?auto_18294 ) ) ( not ( = ?auto_18290 ?auto_18300 ) ) ( not ( = ?auto_18289 ?auto_18294 ) ) ( not ( = ?auto_18289 ?auto_18300 ) ) ( not ( = ?auto_18288 ?auto_18294 ) ) ( not ( = ?auto_18288 ?auto_18300 ) ) ( not ( = ?auto_18291 ?auto_18294 ) ) ( not ( = ?auto_18291 ?auto_18300 ) ) ( not ( = ?auto_18293 ?auto_18294 ) ) ( not ( = ?auto_18293 ?auto_18300 ) ) ( not ( = ?auto_18294 ?auto_18320 ) ) ( not ( = ?auto_18294 ?auto_18321 ) ) ( not ( = ?auto_18294 ?auto_18307 ) ) ( not ( = ?auto_18294 ?auto_18312 ) ) ( not ( = ?auto_18294 ?auto_18324 ) ) ( not ( = ?auto_18294 ?auto_18325 ) ) ( not ( = ?auto_18294 ?auto_18311 ) ) ( not ( = ?auto_18294 ?auto_18308 ) ) ( not ( = ?auto_18294 ?auto_18323 ) ) ( not ( = ?auto_18294 ?auto_18326 ) ) ( not ( = ?auto_18294 ?auto_18303 ) ) ( not ( = ?auto_18298 ?auto_18305 ) ) ( not ( = ?auto_18298 ?auto_18314 ) ) ( not ( = ?auto_18298 ?auto_18309 ) ) ( not ( = ?auto_18298 ?auto_18328 ) ) ( not ( = ?auto_18298 ?auto_18313 ) ) ( not ( = ?auto_18298 ?auto_18302 ) ) ( not ( = ?auto_18298 ?auto_18327 ) ) ( not ( = ?auto_18298 ?auto_18306 ) ) ( not ( = ?auto_18298 ?auto_18301 ) ) ( not ( = ?auto_18297 ?auto_18318 ) ) ( not ( = ?auto_18297 ?auto_18315 ) ) ( not ( = ?auto_18297 ?auto_18319 ) ) ( not ( = ?auto_18297 ?auto_18304 ) ) ( not ( = ?auto_18297 ?auto_18322 ) ) ( not ( = ?auto_18297 ?auto_18316 ) ) ( not ( = ?auto_18297 ?auto_18317 ) ) ( not ( = ?auto_18297 ?auto_18310 ) ) ( not ( = ?auto_18297 ?auto_18329 ) ) ( not ( = ?auto_18300 ?auto_18320 ) ) ( not ( = ?auto_18300 ?auto_18321 ) ) ( not ( = ?auto_18300 ?auto_18307 ) ) ( not ( = ?auto_18300 ?auto_18312 ) ) ( not ( = ?auto_18300 ?auto_18324 ) ) ( not ( = ?auto_18300 ?auto_18325 ) ) ( not ( = ?auto_18300 ?auto_18311 ) ) ( not ( = ?auto_18300 ?auto_18308 ) ) ( not ( = ?auto_18300 ?auto_18323 ) ) ( not ( = ?auto_18300 ?auto_18326 ) ) ( not ( = ?auto_18300 ?auto_18303 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ?auto_18290 ?auto_18289 ?auto_18288 ?auto_18291 ?auto_18293 ?auto_18292 )
      ( MAKE-1CRATE ?auto_18292 ?auto_18294 )
      ( MAKE-12CRATE-VERIFY ?auto_18282 ?auto_18283 ?auto_18284 ?auto_18285 ?auto_18286 ?auto_18287 ?auto_18290 ?auto_18289 ?auto_18288 ?auto_18291 ?auto_18293 ?auto_18292 ?auto_18294 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18332 - SURFACE
      ?auto_18333 - SURFACE
    )
    :vars
    (
      ?auto_18334 - HOIST
      ?auto_18335 - PLACE
      ?auto_18337 - PLACE
      ?auto_18338 - HOIST
      ?auto_18339 - SURFACE
      ?auto_18336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18334 ?auto_18335 ) ( SURFACE-AT ?auto_18332 ?auto_18335 ) ( CLEAR ?auto_18332 ) ( IS-CRATE ?auto_18333 ) ( AVAILABLE ?auto_18334 ) ( not ( = ?auto_18337 ?auto_18335 ) ) ( HOIST-AT ?auto_18338 ?auto_18337 ) ( AVAILABLE ?auto_18338 ) ( SURFACE-AT ?auto_18333 ?auto_18337 ) ( ON ?auto_18333 ?auto_18339 ) ( CLEAR ?auto_18333 ) ( TRUCK-AT ?auto_18336 ?auto_18335 ) ( not ( = ?auto_18332 ?auto_18333 ) ) ( not ( = ?auto_18332 ?auto_18339 ) ) ( not ( = ?auto_18333 ?auto_18339 ) ) ( not ( = ?auto_18334 ?auto_18338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18336 ?auto_18335 ?auto_18337 )
      ( !LIFT ?auto_18338 ?auto_18333 ?auto_18339 ?auto_18337 )
      ( !LOAD ?auto_18338 ?auto_18333 ?auto_18336 ?auto_18337 )
      ( !DRIVE ?auto_18336 ?auto_18337 ?auto_18335 )
      ( !UNLOAD ?auto_18334 ?auto_18333 ?auto_18336 ?auto_18335 )
      ( !DROP ?auto_18334 ?auto_18333 ?auto_18332 ?auto_18335 )
      ( MAKE-1CRATE-VERIFY ?auto_18332 ?auto_18333 ) )
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
      ?auto_18362 - SURFACE
      ?auto_18361 - SURFACE
      ?auto_18360 - SURFACE
      ?auto_18363 - SURFACE
      ?auto_18365 - SURFACE
      ?auto_18364 - SURFACE
      ?auto_18366 - SURFACE
      ?auto_18367 - SURFACE
    )
    :vars
    (
      ?auto_18368 - HOIST
      ?auto_18371 - PLACE
      ?auto_18370 - PLACE
      ?auto_18373 - HOIST
      ?auto_18372 - SURFACE
      ?auto_18395 - SURFACE
      ?auto_18403 - PLACE
      ?auto_18388 - HOIST
      ?auto_18394 - SURFACE
      ?auto_18390 - PLACE
      ?auto_18393 - HOIST
      ?auto_18382 - SURFACE
      ?auto_18386 - PLACE
      ?auto_18381 - HOIST
      ?auto_18378 - SURFACE
      ?auto_18377 - PLACE
      ?auto_18397 - HOIST
      ?auto_18383 - SURFACE
      ?auto_18389 - SURFACE
      ?auto_18379 - PLACE
      ?auto_18401 - HOIST
      ?auto_18380 - SURFACE
      ?auto_18385 - PLACE
      ?auto_18384 - HOIST
      ?auto_18396 - SURFACE
      ?auto_18374 - PLACE
      ?auto_18402 - HOIST
      ?auto_18375 - SURFACE
      ?auto_18392 - SURFACE
      ?auto_18398 - PLACE
      ?auto_18400 - HOIST
      ?auto_18391 - SURFACE
      ?auto_18376 - PLACE
      ?auto_18387 - HOIST
      ?auto_18399 - SURFACE
      ?auto_18369 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18368 ?auto_18371 ) ( IS-CRATE ?auto_18367 ) ( not ( = ?auto_18370 ?auto_18371 ) ) ( HOIST-AT ?auto_18373 ?auto_18370 ) ( SURFACE-AT ?auto_18367 ?auto_18370 ) ( ON ?auto_18367 ?auto_18372 ) ( CLEAR ?auto_18367 ) ( not ( = ?auto_18366 ?auto_18367 ) ) ( not ( = ?auto_18366 ?auto_18372 ) ) ( not ( = ?auto_18367 ?auto_18372 ) ) ( not ( = ?auto_18368 ?auto_18373 ) ) ( IS-CRATE ?auto_18366 ) ( AVAILABLE ?auto_18373 ) ( SURFACE-AT ?auto_18366 ?auto_18370 ) ( ON ?auto_18366 ?auto_18395 ) ( CLEAR ?auto_18366 ) ( not ( = ?auto_18364 ?auto_18366 ) ) ( not ( = ?auto_18364 ?auto_18395 ) ) ( not ( = ?auto_18366 ?auto_18395 ) ) ( IS-CRATE ?auto_18364 ) ( not ( = ?auto_18403 ?auto_18371 ) ) ( HOIST-AT ?auto_18388 ?auto_18403 ) ( SURFACE-AT ?auto_18364 ?auto_18403 ) ( ON ?auto_18364 ?auto_18394 ) ( CLEAR ?auto_18364 ) ( not ( = ?auto_18365 ?auto_18364 ) ) ( not ( = ?auto_18365 ?auto_18394 ) ) ( not ( = ?auto_18364 ?auto_18394 ) ) ( not ( = ?auto_18368 ?auto_18388 ) ) ( IS-CRATE ?auto_18365 ) ( not ( = ?auto_18390 ?auto_18371 ) ) ( HOIST-AT ?auto_18393 ?auto_18390 ) ( AVAILABLE ?auto_18393 ) ( SURFACE-AT ?auto_18365 ?auto_18390 ) ( ON ?auto_18365 ?auto_18382 ) ( CLEAR ?auto_18365 ) ( not ( = ?auto_18363 ?auto_18365 ) ) ( not ( = ?auto_18363 ?auto_18382 ) ) ( not ( = ?auto_18365 ?auto_18382 ) ) ( not ( = ?auto_18368 ?auto_18393 ) ) ( IS-CRATE ?auto_18363 ) ( not ( = ?auto_18386 ?auto_18371 ) ) ( HOIST-AT ?auto_18381 ?auto_18386 ) ( AVAILABLE ?auto_18381 ) ( SURFACE-AT ?auto_18363 ?auto_18386 ) ( ON ?auto_18363 ?auto_18378 ) ( CLEAR ?auto_18363 ) ( not ( = ?auto_18360 ?auto_18363 ) ) ( not ( = ?auto_18360 ?auto_18378 ) ) ( not ( = ?auto_18363 ?auto_18378 ) ) ( not ( = ?auto_18368 ?auto_18381 ) ) ( IS-CRATE ?auto_18360 ) ( not ( = ?auto_18377 ?auto_18371 ) ) ( HOIST-AT ?auto_18397 ?auto_18377 ) ( SURFACE-AT ?auto_18360 ?auto_18377 ) ( ON ?auto_18360 ?auto_18383 ) ( CLEAR ?auto_18360 ) ( not ( = ?auto_18361 ?auto_18360 ) ) ( not ( = ?auto_18361 ?auto_18383 ) ) ( not ( = ?auto_18360 ?auto_18383 ) ) ( not ( = ?auto_18368 ?auto_18397 ) ) ( IS-CRATE ?auto_18361 ) ( AVAILABLE ?auto_18397 ) ( SURFACE-AT ?auto_18361 ?auto_18377 ) ( ON ?auto_18361 ?auto_18389 ) ( CLEAR ?auto_18361 ) ( not ( = ?auto_18362 ?auto_18361 ) ) ( not ( = ?auto_18362 ?auto_18389 ) ) ( not ( = ?auto_18361 ?auto_18389 ) ) ( IS-CRATE ?auto_18362 ) ( not ( = ?auto_18379 ?auto_18371 ) ) ( HOIST-AT ?auto_18401 ?auto_18379 ) ( AVAILABLE ?auto_18401 ) ( SURFACE-AT ?auto_18362 ?auto_18379 ) ( ON ?auto_18362 ?auto_18380 ) ( CLEAR ?auto_18362 ) ( not ( = ?auto_18359 ?auto_18362 ) ) ( not ( = ?auto_18359 ?auto_18380 ) ) ( not ( = ?auto_18362 ?auto_18380 ) ) ( not ( = ?auto_18368 ?auto_18401 ) ) ( IS-CRATE ?auto_18359 ) ( not ( = ?auto_18385 ?auto_18371 ) ) ( HOIST-AT ?auto_18384 ?auto_18385 ) ( AVAILABLE ?auto_18384 ) ( SURFACE-AT ?auto_18359 ?auto_18385 ) ( ON ?auto_18359 ?auto_18396 ) ( CLEAR ?auto_18359 ) ( not ( = ?auto_18358 ?auto_18359 ) ) ( not ( = ?auto_18358 ?auto_18396 ) ) ( not ( = ?auto_18359 ?auto_18396 ) ) ( not ( = ?auto_18368 ?auto_18384 ) ) ( IS-CRATE ?auto_18358 ) ( not ( = ?auto_18374 ?auto_18371 ) ) ( HOIST-AT ?auto_18402 ?auto_18374 ) ( AVAILABLE ?auto_18402 ) ( SURFACE-AT ?auto_18358 ?auto_18374 ) ( ON ?auto_18358 ?auto_18375 ) ( CLEAR ?auto_18358 ) ( not ( = ?auto_18357 ?auto_18358 ) ) ( not ( = ?auto_18357 ?auto_18375 ) ) ( not ( = ?auto_18358 ?auto_18375 ) ) ( not ( = ?auto_18368 ?auto_18402 ) ) ( IS-CRATE ?auto_18357 ) ( AVAILABLE ?auto_18388 ) ( SURFACE-AT ?auto_18357 ?auto_18403 ) ( ON ?auto_18357 ?auto_18392 ) ( CLEAR ?auto_18357 ) ( not ( = ?auto_18356 ?auto_18357 ) ) ( not ( = ?auto_18356 ?auto_18392 ) ) ( not ( = ?auto_18357 ?auto_18392 ) ) ( IS-CRATE ?auto_18356 ) ( not ( = ?auto_18398 ?auto_18371 ) ) ( HOIST-AT ?auto_18400 ?auto_18398 ) ( AVAILABLE ?auto_18400 ) ( SURFACE-AT ?auto_18356 ?auto_18398 ) ( ON ?auto_18356 ?auto_18391 ) ( CLEAR ?auto_18356 ) ( not ( = ?auto_18355 ?auto_18356 ) ) ( not ( = ?auto_18355 ?auto_18391 ) ) ( not ( = ?auto_18356 ?auto_18391 ) ) ( not ( = ?auto_18368 ?auto_18400 ) ) ( SURFACE-AT ?auto_18354 ?auto_18371 ) ( CLEAR ?auto_18354 ) ( IS-CRATE ?auto_18355 ) ( AVAILABLE ?auto_18368 ) ( not ( = ?auto_18376 ?auto_18371 ) ) ( HOIST-AT ?auto_18387 ?auto_18376 ) ( AVAILABLE ?auto_18387 ) ( SURFACE-AT ?auto_18355 ?auto_18376 ) ( ON ?auto_18355 ?auto_18399 ) ( CLEAR ?auto_18355 ) ( TRUCK-AT ?auto_18369 ?auto_18371 ) ( not ( = ?auto_18354 ?auto_18355 ) ) ( not ( = ?auto_18354 ?auto_18399 ) ) ( not ( = ?auto_18355 ?auto_18399 ) ) ( not ( = ?auto_18368 ?auto_18387 ) ) ( not ( = ?auto_18354 ?auto_18356 ) ) ( not ( = ?auto_18354 ?auto_18391 ) ) ( not ( = ?auto_18356 ?auto_18399 ) ) ( not ( = ?auto_18398 ?auto_18376 ) ) ( not ( = ?auto_18400 ?auto_18387 ) ) ( not ( = ?auto_18391 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18357 ) ) ( not ( = ?auto_18354 ?auto_18392 ) ) ( not ( = ?auto_18355 ?auto_18357 ) ) ( not ( = ?auto_18355 ?auto_18392 ) ) ( not ( = ?auto_18357 ?auto_18391 ) ) ( not ( = ?auto_18357 ?auto_18399 ) ) ( not ( = ?auto_18403 ?auto_18398 ) ) ( not ( = ?auto_18403 ?auto_18376 ) ) ( not ( = ?auto_18388 ?auto_18400 ) ) ( not ( = ?auto_18388 ?auto_18387 ) ) ( not ( = ?auto_18392 ?auto_18391 ) ) ( not ( = ?auto_18392 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18358 ) ) ( not ( = ?auto_18354 ?auto_18375 ) ) ( not ( = ?auto_18355 ?auto_18358 ) ) ( not ( = ?auto_18355 ?auto_18375 ) ) ( not ( = ?auto_18356 ?auto_18358 ) ) ( not ( = ?auto_18356 ?auto_18375 ) ) ( not ( = ?auto_18358 ?auto_18392 ) ) ( not ( = ?auto_18358 ?auto_18391 ) ) ( not ( = ?auto_18358 ?auto_18399 ) ) ( not ( = ?auto_18374 ?auto_18403 ) ) ( not ( = ?auto_18374 ?auto_18398 ) ) ( not ( = ?auto_18374 ?auto_18376 ) ) ( not ( = ?auto_18402 ?auto_18388 ) ) ( not ( = ?auto_18402 ?auto_18400 ) ) ( not ( = ?auto_18402 ?auto_18387 ) ) ( not ( = ?auto_18375 ?auto_18392 ) ) ( not ( = ?auto_18375 ?auto_18391 ) ) ( not ( = ?auto_18375 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18359 ) ) ( not ( = ?auto_18354 ?auto_18396 ) ) ( not ( = ?auto_18355 ?auto_18359 ) ) ( not ( = ?auto_18355 ?auto_18396 ) ) ( not ( = ?auto_18356 ?auto_18359 ) ) ( not ( = ?auto_18356 ?auto_18396 ) ) ( not ( = ?auto_18357 ?auto_18359 ) ) ( not ( = ?auto_18357 ?auto_18396 ) ) ( not ( = ?auto_18359 ?auto_18375 ) ) ( not ( = ?auto_18359 ?auto_18392 ) ) ( not ( = ?auto_18359 ?auto_18391 ) ) ( not ( = ?auto_18359 ?auto_18399 ) ) ( not ( = ?auto_18385 ?auto_18374 ) ) ( not ( = ?auto_18385 ?auto_18403 ) ) ( not ( = ?auto_18385 ?auto_18398 ) ) ( not ( = ?auto_18385 ?auto_18376 ) ) ( not ( = ?auto_18384 ?auto_18402 ) ) ( not ( = ?auto_18384 ?auto_18388 ) ) ( not ( = ?auto_18384 ?auto_18400 ) ) ( not ( = ?auto_18384 ?auto_18387 ) ) ( not ( = ?auto_18396 ?auto_18375 ) ) ( not ( = ?auto_18396 ?auto_18392 ) ) ( not ( = ?auto_18396 ?auto_18391 ) ) ( not ( = ?auto_18396 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18362 ) ) ( not ( = ?auto_18354 ?auto_18380 ) ) ( not ( = ?auto_18355 ?auto_18362 ) ) ( not ( = ?auto_18355 ?auto_18380 ) ) ( not ( = ?auto_18356 ?auto_18362 ) ) ( not ( = ?auto_18356 ?auto_18380 ) ) ( not ( = ?auto_18357 ?auto_18362 ) ) ( not ( = ?auto_18357 ?auto_18380 ) ) ( not ( = ?auto_18358 ?auto_18362 ) ) ( not ( = ?auto_18358 ?auto_18380 ) ) ( not ( = ?auto_18362 ?auto_18396 ) ) ( not ( = ?auto_18362 ?auto_18375 ) ) ( not ( = ?auto_18362 ?auto_18392 ) ) ( not ( = ?auto_18362 ?auto_18391 ) ) ( not ( = ?auto_18362 ?auto_18399 ) ) ( not ( = ?auto_18379 ?auto_18385 ) ) ( not ( = ?auto_18379 ?auto_18374 ) ) ( not ( = ?auto_18379 ?auto_18403 ) ) ( not ( = ?auto_18379 ?auto_18398 ) ) ( not ( = ?auto_18379 ?auto_18376 ) ) ( not ( = ?auto_18401 ?auto_18384 ) ) ( not ( = ?auto_18401 ?auto_18402 ) ) ( not ( = ?auto_18401 ?auto_18388 ) ) ( not ( = ?auto_18401 ?auto_18400 ) ) ( not ( = ?auto_18401 ?auto_18387 ) ) ( not ( = ?auto_18380 ?auto_18396 ) ) ( not ( = ?auto_18380 ?auto_18375 ) ) ( not ( = ?auto_18380 ?auto_18392 ) ) ( not ( = ?auto_18380 ?auto_18391 ) ) ( not ( = ?auto_18380 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18361 ) ) ( not ( = ?auto_18354 ?auto_18389 ) ) ( not ( = ?auto_18355 ?auto_18361 ) ) ( not ( = ?auto_18355 ?auto_18389 ) ) ( not ( = ?auto_18356 ?auto_18361 ) ) ( not ( = ?auto_18356 ?auto_18389 ) ) ( not ( = ?auto_18357 ?auto_18361 ) ) ( not ( = ?auto_18357 ?auto_18389 ) ) ( not ( = ?auto_18358 ?auto_18361 ) ) ( not ( = ?auto_18358 ?auto_18389 ) ) ( not ( = ?auto_18359 ?auto_18361 ) ) ( not ( = ?auto_18359 ?auto_18389 ) ) ( not ( = ?auto_18361 ?auto_18380 ) ) ( not ( = ?auto_18361 ?auto_18396 ) ) ( not ( = ?auto_18361 ?auto_18375 ) ) ( not ( = ?auto_18361 ?auto_18392 ) ) ( not ( = ?auto_18361 ?auto_18391 ) ) ( not ( = ?auto_18361 ?auto_18399 ) ) ( not ( = ?auto_18377 ?auto_18379 ) ) ( not ( = ?auto_18377 ?auto_18385 ) ) ( not ( = ?auto_18377 ?auto_18374 ) ) ( not ( = ?auto_18377 ?auto_18403 ) ) ( not ( = ?auto_18377 ?auto_18398 ) ) ( not ( = ?auto_18377 ?auto_18376 ) ) ( not ( = ?auto_18397 ?auto_18401 ) ) ( not ( = ?auto_18397 ?auto_18384 ) ) ( not ( = ?auto_18397 ?auto_18402 ) ) ( not ( = ?auto_18397 ?auto_18388 ) ) ( not ( = ?auto_18397 ?auto_18400 ) ) ( not ( = ?auto_18397 ?auto_18387 ) ) ( not ( = ?auto_18389 ?auto_18380 ) ) ( not ( = ?auto_18389 ?auto_18396 ) ) ( not ( = ?auto_18389 ?auto_18375 ) ) ( not ( = ?auto_18389 ?auto_18392 ) ) ( not ( = ?auto_18389 ?auto_18391 ) ) ( not ( = ?auto_18389 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18360 ) ) ( not ( = ?auto_18354 ?auto_18383 ) ) ( not ( = ?auto_18355 ?auto_18360 ) ) ( not ( = ?auto_18355 ?auto_18383 ) ) ( not ( = ?auto_18356 ?auto_18360 ) ) ( not ( = ?auto_18356 ?auto_18383 ) ) ( not ( = ?auto_18357 ?auto_18360 ) ) ( not ( = ?auto_18357 ?auto_18383 ) ) ( not ( = ?auto_18358 ?auto_18360 ) ) ( not ( = ?auto_18358 ?auto_18383 ) ) ( not ( = ?auto_18359 ?auto_18360 ) ) ( not ( = ?auto_18359 ?auto_18383 ) ) ( not ( = ?auto_18362 ?auto_18360 ) ) ( not ( = ?auto_18362 ?auto_18383 ) ) ( not ( = ?auto_18360 ?auto_18389 ) ) ( not ( = ?auto_18360 ?auto_18380 ) ) ( not ( = ?auto_18360 ?auto_18396 ) ) ( not ( = ?auto_18360 ?auto_18375 ) ) ( not ( = ?auto_18360 ?auto_18392 ) ) ( not ( = ?auto_18360 ?auto_18391 ) ) ( not ( = ?auto_18360 ?auto_18399 ) ) ( not ( = ?auto_18383 ?auto_18389 ) ) ( not ( = ?auto_18383 ?auto_18380 ) ) ( not ( = ?auto_18383 ?auto_18396 ) ) ( not ( = ?auto_18383 ?auto_18375 ) ) ( not ( = ?auto_18383 ?auto_18392 ) ) ( not ( = ?auto_18383 ?auto_18391 ) ) ( not ( = ?auto_18383 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18363 ) ) ( not ( = ?auto_18354 ?auto_18378 ) ) ( not ( = ?auto_18355 ?auto_18363 ) ) ( not ( = ?auto_18355 ?auto_18378 ) ) ( not ( = ?auto_18356 ?auto_18363 ) ) ( not ( = ?auto_18356 ?auto_18378 ) ) ( not ( = ?auto_18357 ?auto_18363 ) ) ( not ( = ?auto_18357 ?auto_18378 ) ) ( not ( = ?auto_18358 ?auto_18363 ) ) ( not ( = ?auto_18358 ?auto_18378 ) ) ( not ( = ?auto_18359 ?auto_18363 ) ) ( not ( = ?auto_18359 ?auto_18378 ) ) ( not ( = ?auto_18362 ?auto_18363 ) ) ( not ( = ?auto_18362 ?auto_18378 ) ) ( not ( = ?auto_18361 ?auto_18363 ) ) ( not ( = ?auto_18361 ?auto_18378 ) ) ( not ( = ?auto_18363 ?auto_18383 ) ) ( not ( = ?auto_18363 ?auto_18389 ) ) ( not ( = ?auto_18363 ?auto_18380 ) ) ( not ( = ?auto_18363 ?auto_18396 ) ) ( not ( = ?auto_18363 ?auto_18375 ) ) ( not ( = ?auto_18363 ?auto_18392 ) ) ( not ( = ?auto_18363 ?auto_18391 ) ) ( not ( = ?auto_18363 ?auto_18399 ) ) ( not ( = ?auto_18386 ?auto_18377 ) ) ( not ( = ?auto_18386 ?auto_18379 ) ) ( not ( = ?auto_18386 ?auto_18385 ) ) ( not ( = ?auto_18386 ?auto_18374 ) ) ( not ( = ?auto_18386 ?auto_18403 ) ) ( not ( = ?auto_18386 ?auto_18398 ) ) ( not ( = ?auto_18386 ?auto_18376 ) ) ( not ( = ?auto_18381 ?auto_18397 ) ) ( not ( = ?auto_18381 ?auto_18401 ) ) ( not ( = ?auto_18381 ?auto_18384 ) ) ( not ( = ?auto_18381 ?auto_18402 ) ) ( not ( = ?auto_18381 ?auto_18388 ) ) ( not ( = ?auto_18381 ?auto_18400 ) ) ( not ( = ?auto_18381 ?auto_18387 ) ) ( not ( = ?auto_18378 ?auto_18383 ) ) ( not ( = ?auto_18378 ?auto_18389 ) ) ( not ( = ?auto_18378 ?auto_18380 ) ) ( not ( = ?auto_18378 ?auto_18396 ) ) ( not ( = ?auto_18378 ?auto_18375 ) ) ( not ( = ?auto_18378 ?auto_18392 ) ) ( not ( = ?auto_18378 ?auto_18391 ) ) ( not ( = ?auto_18378 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18365 ) ) ( not ( = ?auto_18354 ?auto_18382 ) ) ( not ( = ?auto_18355 ?auto_18365 ) ) ( not ( = ?auto_18355 ?auto_18382 ) ) ( not ( = ?auto_18356 ?auto_18365 ) ) ( not ( = ?auto_18356 ?auto_18382 ) ) ( not ( = ?auto_18357 ?auto_18365 ) ) ( not ( = ?auto_18357 ?auto_18382 ) ) ( not ( = ?auto_18358 ?auto_18365 ) ) ( not ( = ?auto_18358 ?auto_18382 ) ) ( not ( = ?auto_18359 ?auto_18365 ) ) ( not ( = ?auto_18359 ?auto_18382 ) ) ( not ( = ?auto_18362 ?auto_18365 ) ) ( not ( = ?auto_18362 ?auto_18382 ) ) ( not ( = ?auto_18361 ?auto_18365 ) ) ( not ( = ?auto_18361 ?auto_18382 ) ) ( not ( = ?auto_18360 ?auto_18365 ) ) ( not ( = ?auto_18360 ?auto_18382 ) ) ( not ( = ?auto_18365 ?auto_18378 ) ) ( not ( = ?auto_18365 ?auto_18383 ) ) ( not ( = ?auto_18365 ?auto_18389 ) ) ( not ( = ?auto_18365 ?auto_18380 ) ) ( not ( = ?auto_18365 ?auto_18396 ) ) ( not ( = ?auto_18365 ?auto_18375 ) ) ( not ( = ?auto_18365 ?auto_18392 ) ) ( not ( = ?auto_18365 ?auto_18391 ) ) ( not ( = ?auto_18365 ?auto_18399 ) ) ( not ( = ?auto_18390 ?auto_18386 ) ) ( not ( = ?auto_18390 ?auto_18377 ) ) ( not ( = ?auto_18390 ?auto_18379 ) ) ( not ( = ?auto_18390 ?auto_18385 ) ) ( not ( = ?auto_18390 ?auto_18374 ) ) ( not ( = ?auto_18390 ?auto_18403 ) ) ( not ( = ?auto_18390 ?auto_18398 ) ) ( not ( = ?auto_18390 ?auto_18376 ) ) ( not ( = ?auto_18393 ?auto_18381 ) ) ( not ( = ?auto_18393 ?auto_18397 ) ) ( not ( = ?auto_18393 ?auto_18401 ) ) ( not ( = ?auto_18393 ?auto_18384 ) ) ( not ( = ?auto_18393 ?auto_18402 ) ) ( not ( = ?auto_18393 ?auto_18388 ) ) ( not ( = ?auto_18393 ?auto_18400 ) ) ( not ( = ?auto_18393 ?auto_18387 ) ) ( not ( = ?auto_18382 ?auto_18378 ) ) ( not ( = ?auto_18382 ?auto_18383 ) ) ( not ( = ?auto_18382 ?auto_18389 ) ) ( not ( = ?auto_18382 ?auto_18380 ) ) ( not ( = ?auto_18382 ?auto_18396 ) ) ( not ( = ?auto_18382 ?auto_18375 ) ) ( not ( = ?auto_18382 ?auto_18392 ) ) ( not ( = ?auto_18382 ?auto_18391 ) ) ( not ( = ?auto_18382 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18364 ) ) ( not ( = ?auto_18354 ?auto_18394 ) ) ( not ( = ?auto_18355 ?auto_18364 ) ) ( not ( = ?auto_18355 ?auto_18394 ) ) ( not ( = ?auto_18356 ?auto_18364 ) ) ( not ( = ?auto_18356 ?auto_18394 ) ) ( not ( = ?auto_18357 ?auto_18364 ) ) ( not ( = ?auto_18357 ?auto_18394 ) ) ( not ( = ?auto_18358 ?auto_18364 ) ) ( not ( = ?auto_18358 ?auto_18394 ) ) ( not ( = ?auto_18359 ?auto_18364 ) ) ( not ( = ?auto_18359 ?auto_18394 ) ) ( not ( = ?auto_18362 ?auto_18364 ) ) ( not ( = ?auto_18362 ?auto_18394 ) ) ( not ( = ?auto_18361 ?auto_18364 ) ) ( not ( = ?auto_18361 ?auto_18394 ) ) ( not ( = ?auto_18360 ?auto_18364 ) ) ( not ( = ?auto_18360 ?auto_18394 ) ) ( not ( = ?auto_18363 ?auto_18364 ) ) ( not ( = ?auto_18363 ?auto_18394 ) ) ( not ( = ?auto_18364 ?auto_18382 ) ) ( not ( = ?auto_18364 ?auto_18378 ) ) ( not ( = ?auto_18364 ?auto_18383 ) ) ( not ( = ?auto_18364 ?auto_18389 ) ) ( not ( = ?auto_18364 ?auto_18380 ) ) ( not ( = ?auto_18364 ?auto_18396 ) ) ( not ( = ?auto_18364 ?auto_18375 ) ) ( not ( = ?auto_18364 ?auto_18392 ) ) ( not ( = ?auto_18364 ?auto_18391 ) ) ( not ( = ?auto_18364 ?auto_18399 ) ) ( not ( = ?auto_18394 ?auto_18382 ) ) ( not ( = ?auto_18394 ?auto_18378 ) ) ( not ( = ?auto_18394 ?auto_18383 ) ) ( not ( = ?auto_18394 ?auto_18389 ) ) ( not ( = ?auto_18394 ?auto_18380 ) ) ( not ( = ?auto_18394 ?auto_18396 ) ) ( not ( = ?auto_18394 ?auto_18375 ) ) ( not ( = ?auto_18394 ?auto_18392 ) ) ( not ( = ?auto_18394 ?auto_18391 ) ) ( not ( = ?auto_18394 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18366 ) ) ( not ( = ?auto_18354 ?auto_18395 ) ) ( not ( = ?auto_18355 ?auto_18366 ) ) ( not ( = ?auto_18355 ?auto_18395 ) ) ( not ( = ?auto_18356 ?auto_18366 ) ) ( not ( = ?auto_18356 ?auto_18395 ) ) ( not ( = ?auto_18357 ?auto_18366 ) ) ( not ( = ?auto_18357 ?auto_18395 ) ) ( not ( = ?auto_18358 ?auto_18366 ) ) ( not ( = ?auto_18358 ?auto_18395 ) ) ( not ( = ?auto_18359 ?auto_18366 ) ) ( not ( = ?auto_18359 ?auto_18395 ) ) ( not ( = ?auto_18362 ?auto_18366 ) ) ( not ( = ?auto_18362 ?auto_18395 ) ) ( not ( = ?auto_18361 ?auto_18366 ) ) ( not ( = ?auto_18361 ?auto_18395 ) ) ( not ( = ?auto_18360 ?auto_18366 ) ) ( not ( = ?auto_18360 ?auto_18395 ) ) ( not ( = ?auto_18363 ?auto_18366 ) ) ( not ( = ?auto_18363 ?auto_18395 ) ) ( not ( = ?auto_18365 ?auto_18366 ) ) ( not ( = ?auto_18365 ?auto_18395 ) ) ( not ( = ?auto_18366 ?auto_18394 ) ) ( not ( = ?auto_18366 ?auto_18382 ) ) ( not ( = ?auto_18366 ?auto_18378 ) ) ( not ( = ?auto_18366 ?auto_18383 ) ) ( not ( = ?auto_18366 ?auto_18389 ) ) ( not ( = ?auto_18366 ?auto_18380 ) ) ( not ( = ?auto_18366 ?auto_18396 ) ) ( not ( = ?auto_18366 ?auto_18375 ) ) ( not ( = ?auto_18366 ?auto_18392 ) ) ( not ( = ?auto_18366 ?auto_18391 ) ) ( not ( = ?auto_18366 ?auto_18399 ) ) ( not ( = ?auto_18370 ?auto_18403 ) ) ( not ( = ?auto_18370 ?auto_18390 ) ) ( not ( = ?auto_18370 ?auto_18386 ) ) ( not ( = ?auto_18370 ?auto_18377 ) ) ( not ( = ?auto_18370 ?auto_18379 ) ) ( not ( = ?auto_18370 ?auto_18385 ) ) ( not ( = ?auto_18370 ?auto_18374 ) ) ( not ( = ?auto_18370 ?auto_18398 ) ) ( not ( = ?auto_18370 ?auto_18376 ) ) ( not ( = ?auto_18373 ?auto_18388 ) ) ( not ( = ?auto_18373 ?auto_18393 ) ) ( not ( = ?auto_18373 ?auto_18381 ) ) ( not ( = ?auto_18373 ?auto_18397 ) ) ( not ( = ?auto_18373 ?auto_18401 ) ) ( not ( = ?auto_18373 ?auto_18384 ) ) ( not ( = ?auto_18373 ?auto_18402 ) ) ( not ( = ?auto_18373 ?auto_18400 ) ) ( not ( = ?auto_18373 ?auto_18387 ) ) ( not ( = ?auto_18395 ?auto_18394 ) ) ( not ( = ?auto_18395 ?auto_18382 ) ) ( not ( = ?auto_18395 ?auto_18378 ) ) ( not ( = ?auto_18395 ?auto_18383 ) ) ( not ( = ?auto_18395 ?auto_18389 ) ) ( not ( = ?auto_18395 ?auto_18380 ) ) ( not ( = ?auto_18395 ?auto_18396 ) ) ( not ( = ?auto_18395 ?auto_18375 ) ) ( not ( = ?auto_18395 ?auto_18392 ) ) ( not ( = ?auto_18395 ?auto_18391 ) ) ( not ( = ?auto_18395 ?auto_18399 ) ) ( not ( = ?auto_18354 ?auto_18367 ) ) ( not ( = ?auto_18354 ?auto_18372 ) ) ( not ( = ?auto_18355 ?auto_18367 ) ) ( not ( = ?auto_18355 ?auto_18372 ) ) ( not ( = ?auto_18356 ?auto_18367 ) ) ( not ( = ?auto_18356 ?auto_18372 ) ) ( not ( = ?auto_18357 ?auto_18367 ) ) ( not ( = ?auto_18357 ?auto_18372 ) ) ( not ( = ?auto_18358 ?auto_18367 ) ) ( not ( = ?auto_18358 ?auto_18372 ) ) ( not ( = ?auto_18359 ?auto_18367 ) ) ( not ( = ?auto_18359 ?auto_18372 ) ) ( not ( = ?auto_18362 ?auto_18367 ) ) ( not ( = ?auto_18362 ?auto_18372 ) ) ( not ( = ?auto_18361 ?auto_18367 ) ) ( not ( = ?auto_18361 ?auto_18372 ) ) ( not ( = ?auto_18360 ?auto_18367 ) ) ( not ( = ?auto_18360 ?auto_18372 ) ) ( not ( = ?auto_18363 ?auto_18367 ) ) ( not ( = ?auto_18363 ?auto_18372 ) ) ( not ( = ?auto_18365 ?auto_18367 ) ) ( not ( = ?auto_18365 ?auto_18372 ) ) ( not ( = ?auto_18364 ?auto_18367 ) ) ( not ( = ?auto_18364 ?auto_18372 ) ) ( not ( = ?auto_18367 ?auto_18395 ) ) ( not ( = ?auto_18367 ?auto_18394 ) ) ( not ( = ?auto_18367 ?auto_18382 ) ) ( not ( = ?auto_18367 ?auto_18378 ) ) ( not ( = ?auto_18367 ?auto_18383 ) ) ( not ( = ?auto_18367 ?auto_18389 ) ) ( not ( = ?auto_18367 ?auto_18380 ) ) ( not ( = ?auto_18367 ?auto_18396 ) ) ( not ( = ?auto_18367 ?auto_18375 ) ) ( not ( = ?auto_18367 ?auto_18392 ) ) ( not ( = ?auto_18367 ?auto_18391 ) ) ( not ( = ?auto_18367 ?auto_18399 ) ) ( not ( = ?auto_18372 ?auto_18395 ) ) ( not ( = ?auto_18372 ?auto_18394 ) ) ( not ( = ?auto_18372 ?auto_18382 ) ) ( not ( = ?auto_18372 ?auto_18378 ) ) ( not ( = ?auto_18372 ?auto_18383 ) ) ( not ( = ?auto_18372 ?auto_18389 ) ) ( not ( = ?auto_18372 ?auto_18380 ) ) ( not ( = ?auto_18372 ?auto_18396 ) ) ( not ( = ?auto_18372 ?auto_18375 ) ) ( not ( = ?auto_18372 ?auto_18392 ) ) ( not ( = ?auto_18372 ?auto_18391 ) ) ( not ( = ?auto_18372 ?auto_18399 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18362 ?auto_18361 ?auto_18360 ?auto_18363 ?auto_18365 ?auto_18364 ?auto_18366 )
      ( MAKE-1CRATE ?auto_18366 ?auto_18367 )
      ( MAKE-13CRATE-VERIFY ?auto_18354 ?auto_18355 ?auto_18356 ?auto_18357 ?auto_18358 ?auto_18359 ?auto_18362 ?auto_18361 ?auto_18360 ?auto_18363 ?auto_18365 ?auto_18364 ?auto_18366 ?auto_18367 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_18406 - SURFACE
      ?auto_18407 - SURFACE
    )
    :vars
    (
      ?auto_18408 - HOIST
      ?auto_18409 - PLACE
      ?auto_18411 - PLACE
      ?auto_18412 - HOIST
      ?auto_18413 - SURFACE
      ?auto_18410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18408 ?auto_18409 ) ( SURFACE-AT ?auto_18406 ?auto_18409 ) ( CLEAR ?auto_18406 ) ( IS-CRATE ?auto_18407 ) ( AVAILABLE ?auto_18408 ) ( not ( = ?auto_18411 ?auto_18409 ) ) ( HOIST-AT ?auto_18412 ?auto_18411 ) ( AVAILABLE ?auto_18412 ) ( SURFACE-AT ?auto_18407 ?auto_18411 ) ( ON ?auto_18407 ?auto_18413 ) ( CLEAR ?auto_18407 ) ( TRUCK-AT ?auto_18410 ?auto_18409 ) ( not ( = ?auto_18406 ?auto_18407 ) ) ( not ( = ?auto_18406 ?auto_18413 ) ) ( not ( = ?auto_18407 ?auto_18413 ) ) ( not ( = ?auto_18408 ?auto_18412 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_18410 ?auto_18409 ?auto_18411 )
      ( !LIFT ?auto_18412 ?auto_18407 ?auto_18413 ?auto_18411 )
      ( !LOAD ?auto_18412 ?auto_18407 ?auto_18410 ?auto_18411 )
      ( !DRIVE ?auto_18410 ?auto_18411 ?auto_18409 )
      ( !UNLOAD ?auto_18408 ?auto_18407 ?auto_18410 ?auto_18409 )
      ( !DROP ?auto_18408 ?auto_18407 ?auto_18406 ?auto_18409 )
      ( MAKE-1CRATE-VERIFY ?auto_18406 ?auto_18407 ) )
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
      ?auto_18437 - SURFACE
      ?auto_18436 - SURFACE
      ?auto_18435 - SURFACE
      ?auto_18438 - SURFACE
      ?auto_18440 - SURFACE
      ?auto_18439 - SURFACE
      ?auto_18441 - SURFACE
      ?auto_18443 - SURFACE
      ?auto_18442 - SURFACE
    )
    :vars
    (
      ?auto_18448 - HOIST
      ?auto_18447 - PLACE
      ?auto_18444 - PLACE
      ?auto_18449 - HOIST
      ?auto_18446 - SURFACE
      ?auto_18464 - PLACE
      ?auto_18466 - HOIST
      ?auto_18482 - SURFACE
      ?auto_18471 - SURFACE
      ?auto_18463 - PLACE
      ?auto_18461 - HOIST
      ?auto_18479 - SURFACE
      ?auto_18472 - PLACE
      ?auto_18478 - HOIST
      ?auto_18459 - SURFACE
      ?auto_18469 - PLACE
      ?auto_18458 - HOIST
      ?auto_18481 - SURFACE
      ?auto_18457 - PLACE
      ?auto_18476 - HOIST
      ?auto_18450 - SURFACE
      ?auto_18473 - SURFACE
      ?auto_18475 - PLACE
      ?auto_18452 - HOIST
      ?auto_18474 - SURFACE
      ?auto_18451 - PLACE
      ?auto_18470 - HOIST
      ?auto_18453 - SURFACE
      ?auto_18465 - PLACE
      ?auto_18455 - HOIST
      ?auto_18456 - SURFACE
      ?auto_18480 - SURFACE
      ?auto_18468 - PLACE
      ?auto_18454 - HOIST
      ?auto_18477 - SURFACE
      ?auto_18462 - PLACE
      ?auto_18460 - HOIST
      ?auto_18467 - SURFACE
      ?auto_18445 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_18448 ?auto_18447 ) ( IS-CRATE ?auto_18442 ) ( not ( = ?auto_18444 ?auto_18447 ) ) ( HOIST-AT ?auto_18449 ?auto_18444 ) ( AVAILABLE ?auto_18449 ) ( SURFACE-AT ?auto_18442 ?auto_18444 ) ( ON ?auto_18442 ?auto_18446 ) ( CLEAR ?auto_18442 ) ( not ( = ?auto_18443 ?auto_18442 ) ) ( not ( = ?auto_18443 ?auto_18446 ) ) ( not ( = ?auto_18442 ?auto_18446 ) ) ( not ( = ?auto_18448 ?auto_18449 ) ) ( IS-CRATE ?auto_18443 ) ( not ( = ?auto_18464 ?auto_18447 ) ) ( HOIST-AT ?auto_18466 ?auto_18464 ) ( SURFACE-AT ?auto_18443 ?auto_18464 ) ( ON ?auto_18443 ?auto_18482 ) ( CLEAR ?auto_18443 ) ( not ( = ?auto_18441 ?auto_18443 ) ) ( not ( = ?auto_18441 ?auto_18482 ) ) ( not ( = ?auto_18443 ?auto_18482 ) ) ( not ( = ?auto_18448 ?auto_18466 ) ) ( IS-CRATE ?auto_18441 ) ( AVAILABLE ?auto_18466 ) ( SURFACE-AT ?auto_18441 ?auto_18464 ) ( ON ?auto_18441 ?auto_18471 ) ( CLEAR ?auto_18441 ) ( not ( = ?auto_18439 ?auto_18441 ) ) ( not ( = ?auto_18439 ?auto_18471 ) ) ( not ( = ?auto_18441 ?auto_18471 ) ) ( IS-CRATE ?auto_18439 ) ( not ( = ?auto_18463 ?auto_18447 ) ) ( HOIST-AT ?auto_18461 ?auto_18463 ) ( SURFACE-AT ?auto_18439 ?auto_18463 ) ( ON ?auto_18439 ?auto_18479 ) ( CLEAR ?auto_18439 ) ( not ( = ?auto_18440 ?auto_18439 ) ) ( not ( = ?auto_18440 ?auto_18479 ) ) ( not ( = ?auto_18439 ?auto_18479 ) ) ( not ( = ?auto_18448 ?auto_18461 ) ) ( IS-CRATE ?auto_18440 ) ( not ( = ?auto_18472 ?auto_18447 ) ) ( HOIST-AT ?auto_18478 ?auto_18472 ) ( AVAILABLE ?auto_18478 ) ( SURFACE-AT ?auto_18440 ?auto_18472 ) ( ON ?auto_18440 ?auto_18459 ) ( CLEAR ?auto_18440 ) ( not ( = ?auto_18438 ?auto_18440 ) ) ( not ( = ?auto_18438 ?auto_18459 ) ) ( not ( = ?auto_18440 ?auto_18459 ) ) ( not ( = ?auto_18448 ?auto_18478 ) ) ( IS-CRATE ?auto_18438 ) ( not ( = ?auto_18469 ?auto_18447 ) ) ( HOIST-AT ?auto_18458 ?auto_18469 ) ( AVAILABLE ?auto_18458 ) ( SURFACE-AT ?auto_18438 ?auto_18469 ) ( ON ?auto_18438 ?auto_18481 ) ( CLEAR ?auto_18438 ) ( not ( = ?auto_18435 ?auto_18438 ) ) ( not ( = ?auto_18435 ?auto_18481 ) ) ( not ( = ?auto_18438 ?auto_18481 ) ) ( not ( = ?auto_18448 ?auto_18458 ) ) ( IS-CRATE ?auto_18435 ) ( not ( = ?auto_18457 ?auto_18447 ) ) ( HOIST-AT ?auto_18476 ?auto_18457 ) ( SURFACE-AT ?auto_18435 ?auto_18457 ) ( ON ?auto_18435 ?auto_18450 ) ( CLEAR ?auto_18435 ) ( not ( = ?auto_18436 ?auto_18435 ) ) ( not ( = ?auto_18436 ?auto_18450 ) ) ( not ( = ?auto_18435 ?auto_18450 ) ) ( not ( = ?auto_18448 ?auto_18476 ) ) ( IS-CRATE ?auto_18436 ) ( AVAILABLE ?auto_18476 ) ( SURFACE-AT ?auto_18436 ?auto_18457 ) ( ON ?auto_18436 ?auto_18473 ) ( CLEAR ?auto_18436 ) ( not ( = ?auto_18437 ?auto_18436 ) ) ( not ( = ?auto_18437 ?auto_18473 ) ) ( not ( = ?auto_18436 ?auto_18473 ) ) ( IS-CRATE ?auto_18437 ) ( not ( = ?auto_18475 ?auto_18447 ) ) ( HOIST-AT ?auto_18452 ?auto_18475 ) ( AVAILABLE ?auto_18452 ) ( SURFACE-AT ?auto_18437 ?auto_18475 ) ( ON ?auto_18437 ?auto_18474 ) ( CLEAR ?auto_18437 ) ( not ( = ?auto_18434 ?auto_18437 ) ) ( not ( = ?auto_18434 ?auto_18474 ) ) ( not ( = ?auto_18437 ?auto_18474 ) ) ( not ( = ?auto_18448 ?auto_18452 ) ) ( IS-CRATE ?auto_18434 ) ( not ( = ?auto_18451 ?auto_18447 ) ) ( HOIST-AT ?auto_18470 ?auto_18451 ) ( AVAILABLE ?auto_18470 ) ( SURFACE-AT ?auto_18434 ?auto_18451 ) ( ON ?auto_18434 ?auto_18453 ) ( CLEAR ?auto_18434 ) ( not ( = ?auto_18433 ?auto_18434 ) ) ( not ( = ?auto_18433 ?auto_18453 ) ) ( not ( = ?auto_18434 ?auto_18453 ) ) ( not ( = ?auto_18448 ?auto_18470 ) ) ( IS-CRATE ?auto_18433 ) ( not ( = ?auto_18465 ?auto_18447 ) ) ( HOIST-AT ?auto_18455 ?auto_18465 ) ( AVAILABLE ?auto_18455 ) ( SURFACE-AT ?auto_18433 ?auto_18465 ) ( ON ?auto_18433 ?auto_18456 ) ( CLEAR ?auto_18433 ) ( not ( = ?auto_18432 ?auto_18433 ) ) ( not ( = ?auto_18432 ?auto_18456 ) ) ( not ( = ?auto_18433 ?auto_18456 ) ) ( not ( = ?auto_18448 ?auto_18455 ) ) ( IS-CRATE ?auto_18432 ) ( AVAILABLE ?auto_18461 ) ( SURFACE-AT ?auto_18432 ?auto_18463 ) ( ON ?auto_18432 ?auto_18480 ) ( CLEAR ?auto_18432 ) ( not ( = ?auto_18431 ?auto_18432 ) ) ( not ( = ?auto_18431 ?auto_18480 ) ) ( not ( = ?auto_18432 ?auto_18480 ) ) ( IS-CRATE ?auto_18431 ) ( not ( = ?auto_18468 ?auto_18447 ) ) ( HOIST-AT ?auto_18454 ?auto_18468 ) ( AVAILABLE ?auto_18454 ) ( SURFACE-AT ?auto_18431 ?auto_18468 ) ( ON ?auto_18431 ?auto_18477 ) ( CLEAR ?auto_18431 ) ( not ( = ?auto_18430 ?auto_18431 ) ) ( not ( = ?auto_18430 ?auto_18477 ) ) ( not ( = ?auto_18431 ?auto_18477 ) ) ( not ( = ?auto_18448 ?auto_18454 ) ) ( SURFACE-AT ?auto_18429 ?auto_18447 ) ( CLEAR ?auto_18429 ) ( IS-CRATE ?auto_18430 ) ( AVAILABLE ?auto_18448 ) ( not ( = ?auto_18462 ?auto_18447 ) ) ( HOIST-AT ?auto_18460 ?auto_18462 ) ( AVAILABLE ?auto_18460 ) ( SURFACE-AT ?auto_18430 ?auto_18462 ) ( ON ?auto_18430 ?auto_18467 ) ( CLEAR ?auto_18430 ) ( TRUCK-AT ?auto_18445 ?auto_18447 ) ( not ( = ?auto_18429 ?auto_18430 ) ) ( not ( = ?auto_18429 ?auto_18467 ) ) ( not ( = ?auto_18430 ?auto_18467 ) ) ( not ( = ?auto_18448 ?auto_18460 ) ) ( not ( = ?auto_18429 ?auto_18431 ) ) ( not ( = ?auto_18429 ?auto_18477 ) ) ( not ( = ?auto_18431 ?auto_18467 ) ) ( not ( = ?auto_18468 ?auto_18462 ) ) ( not ( = ?auto_18454 ?auto_18460 ) ) ( not ( = ?auto_18477 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18432 ) ) ( not ( = ?auto_18429 ?auto_18480 ) ) ( not ( = ?auto_18430 ?auto_18432 ) ) ( not ( = ?auto_18430 ?auto_18480 ) ) ( not ( = ?auto_18432 ?auto_18477 ) ) ( not ( = ?auto_18432 ?auto_18467 ) ) ( not ( = ?auto_18463 ?auto_18468 ) ) ( not ( = ?auto_18463 ?auto_18462 ) ) ( not ( = ?auto_18461 ?auto_18454 ) ) ( not ( = ?auto_18461 ?auto_18460 ) ) ( not ( = ?auto_18480 ?auto_18477 ) ) ( not ( = ?auto_18480 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18433 ) ) ( not ( = ?auto_18429 ?auto_18456 ) ) ( not ( = ?auto_18430 ?auto_18433 ) ) ( not ( = ?auto_18430 ?auto_18456 ) ) ( not ( = ?auto_18431 ?auto_18433 ) ) ( not ( = ?auto_18431 ?auto_18456 ) ) ( not ( = ?auto_18433 ?auto_18480 ) ) ( not ( = ?auto_18433 ?auto_18477 ) ) ( not ( = ?auto_18433 ?auto_18467 ) ) ( not ( = ?auto_18465 ?auto_18463 ) ) ( not ( = ?auto_18465 ?auto_18468 ) ) ( not ( = ?auto_18465 ?auto_18462 ) ) ( not ( = ?auto_18455 ?auto_18461 ) ) ( not ( = ?auto_18455 ?auto_18454 ) ) ( not ( = ?auto_18455 ?auto_18460 ) ) ( not ( = ?auto_18456 ?auto_18480 ) ) ( not ( = ?auto_18456 ?auto_18477 ) ) ( not ( = ?auto_18456 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18434 ) ) ( not ( = ?auto_18429 ?auto_18453 ) ) ( not ( = ?auto_18430 ?auto_18434 ) ) ( not ( = ?auto_18430 ?auto_18453 ) ) ( not ( = ?auto_18431 ?auto_18434 ) ) ( not ( = ?auto_18431 ?auto_18453 ) ) ( not ( = ?auto_18432 ?auto_18434 ) ) ( not ( = ?auto_18432 ?auto_18453 ) ) ( not ( = ?auto_18434 ?auto_18456 ) ) ( not ( = ?auto_18434 ?auto_18480 ) ) ( not ( = ?auto_18434 ?auto_18477 ) ) ( not ( = ?auto_18434 ?auto_18467 ) ) ( not ( = ?auto_18451 ?auto_18465 ) ) ( not ( = ?auto_18451 ?auto_18463 ) ) ( not ( = ?auto_18451 ?auto_18468 ) ) ( not ( = ?auto_18451 ?auto_18462 ) ) ( not ( = ?auto_18470 ?auto_18455 ) ) ( not ( = ?auto_18470 ?auto_18461 ) ) ( not ( = ?auto_18470 ?auto_18454 ) ) ( not ( = ?auto_18470 ?auto_18460 ) ) ( not ( = ?auto_18453 ?auto_18456 ) ) ( not ( = ?auto_18453 ?auto_18480 ) ) ( not ( = ?auto_18453 ?auto_18477 ) ) ( not ( = ?auto_18453 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18437 ) ) ( not ( = ?auto_18429 ?auto_18474 ) ) ( not ( = ?auto_18430 ?auto_18437 ) ) ( not ( = ?auto_18430 ?auto_18474 ) ) ( not ( = ?auto_18431 ?auto_18437 ) ) ( not ( = ?auto_18431 ?auto_18474 ) ) ( not ( = ?auto_18432 ?auto_18437 ) ) ( not ( = ?auto_18432 ?auto_18474 ) ) ( not ( = ?auto_18433 ?auto_18437 ) ) ( not ( = ?auto_18433 ?auto_18474 ) ) ( not ( = ?auto_18437 ?auto_18453 ) ) ( not ( = ?auto_18437 ?auto_18456 ) ) ( not ( = ?auto_18437 ?auto_18480 ) ) ( not ( = ?auto_18437 ?auto_18477 ) ) ( not ( = ?auto_18437 ?auto_18467 ) ) ( not ( = ?auto_18475 ?auto_18451 ) ) ( not ( = ?auto_18475 ?auto_18465 ) ) ( not ( = ?auto_18475 ?auto_18463 ) ) ( not ( = ?auto_18475 ?auto_18468 ) ) ( not ( = ?auto_18475 ?auto_18462 ) ) ( not ( = ?auto_18452 ?auto_18470 ) ) ( not ( = ?auto_18452 ?auto_18455 ) ) ( not ( = ?auto_18452 ?auto_18461 ) ) ( not ( = ?auto_18452 ?auto_18454 ) ) ( not ( = ?auto_18452 ?auto_18460 ) ) ( not ( = ?auto_18474 ?auto_18453 ) ) ( not ( = ?auto_18474 ?auto_18456 ) ) ( not ( = ?auto_18474 ?auto_18480 ) ) ( not ( = ?auto_18474 ?auto_18477 ) ) ( not ( = ?auto_18474 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18436 ) ) ( not ( = ?auto_18429 ?auto_18473 ) ) ( not ( = ?auto_18430 ?auto_18436 ) ) ( not ( = ?auto_18430 ?auto_18473 ) ) ( not ( = ?auto_18431 ?auto_18436 ) ) ( not ( = ?auto_18431 ?auto_18473 ) ) ( not ( = ?auto_18432 ?auto_18436 ) ) ( not ( = ?auto_18432 ?auto_18473 ) ) ( not ( = ?auto_18433 ?auto_18436 ) ) ( not ( = ?auto_18433 ?auto_18473 ) ) ( not ( = ?auto_18434 ?auto_18436 ) ) ( not ( = ?auto_18434 ?auto_18473 ) ) ( not ( = ?auto_18436 ?auto_18474 ) ) ( not ( = ?auto_18436 ?auto_18453 ) ) ( not ( = ?auto_18436 ?auto_18456 ) ) ( not ( = ?auto_18436 ?auto_18480 ) ) ( not ( = ?auto_18436 ?auto_18477 ) ) ( not ( = ?auto_18436 ?auto_18467 ) ) ( not ( = ?auto_18457 ?auto_18475 ) ) ( not ( = ?auto_18457 ?auto_18451 ) ) ( not ( = ?auto_18457 ?auto_18465 ) ) ( not ( = ?auto_18457 ?auto_18463 ) ) ( not ( = ?auto_18457 ?auto_18468 ) ) ( not ( = ?auto_18457 ?auto_18462 ) ) ( not ( = ?auto_18476 ?auto_18452 ) ) ( not ( = ?auto_18476 ?auto_18470 ) ) ( not ( = ?auto_18476 ?auto_18455 ) ) ( not ( = ?auto_18476 ?auto_18461 ) ) ( not ( = ?auto_18476 ?auto_18454 ) ) ( not ( = ?auto_18476 ?auto_18460 ) ) ( not ( = ?auto_18473 ?auto_18474 ) ) ( not ( = ?auto_18473 ?auto_18453 ) ) ( not ( = ?auto_18473 ?auto_18456 ) ) ( not ( = ?auto_18473 ?auto_18480 ) ) ( not ( = ?auto_18473 ?auto_18477 ) ) ( not ( = ?auto_18473 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18435 ) ) ( not ( = ?auto_18429 ?auto_18450 ) ) ( not ( = ?auto_18430 ?auto_18435 ) ) ( not ( = ?auto_18430 ?auto_18450 ) ) ( not ( = ?auto_18431 ?auto_18435 ) ) ( not ( = ?auto_18431 ?auto_18450 ) ) ( not ( = ?auto_18432 ?auto_18435 ) ) ( not ( = ?auto_18432 ?auto_18450 ) ) ( not ( = ?auto_18433 ?auto_18435 ) ) ( not ( = ?auto_18433 ?auto_18450 ) ) ( not ( = ?auto_18434 ?auto_18435 ) ) ( not ( = ?auto_18434 ?auto_18450 ) ) ( not ( = ?auto_18437 ?auto_18435 ) ) ( not ( = ?auto_18437 ?auto_18450 ) ) ( not ( = ?auto_18435 ?auto_18473 ) ) ( not ( = ?auto_18435 ?auto_18474 ) ) ( not ( = ?auto_18435 ?auto_18453 ) ) ( not ( = ?auto_18435 ?auto_18456 ) ) ( not ( = ?auto_18435 ?auto_18480 ) ) ( not ( = ?auto_18435 ?auto_18477 ) ) ( not ( = ?auto_18435 ?auto_18467 ) ) ( not ( = ?auto_18450 ?auto_18473 ) ) ( not ( = ?auto_18450 ?auto_18474 ) ) ( not ( = ?auto_18450 ?auto_18453 ) ) ( not ( = ?auto_18450 ?auto_18456 ) ) ( not ( = ?auto_18450 ?auto_18480 ) ) ( not ( = ?auto_18450 ?auto_18477 ) ) ( not ( = ?auto_18450 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18438 ) ) ( not ( = ?auto_18429 ?auto_18481 ) ) ( not ( = ?auto_18430 ?auto_18438 ) ) ( not ( = ?auto_18430 ?auto_18481 ) ) ( not ( = ?auto_18431 ?auto_18438 ) ) ( not ( = ?auto_18431 ?auto_18481 ) ) ( not ( = ?auto_18432 ?auto_18438 ) ) ( not ( = ?auto_18432 ?auto_18481 ) ) ( not ( = ?auto_18433 ?auto_18438 ) ) ( not ( = ?auto_18433 ?auto_18481 ) ) ( not ( = ?auto_18434 ?auto_18438 ) ) ( not ( = ?auto_18434 ?auto_18481 ) ) ( not ( = ?auto_18437 ?auto_18438 ) ) ( not ( = ?auto_18437 ?auto_18481 ) ) ( not ( = ?auto_18436 ?auto_18438 ) ) ( not ( = ?auto_18436 ?auto_18481 ) ) ( not ( = ?auto_18438 ?auto_18450 ) ) ( not ( = ?auto_18438 ?auto_18473 ) ) ( not ( = ?auto_18438 ?auto_18474 ) ) ( not ( = ?auto_18438 ?auto_18453 ) ) ( not ( = ?auto_18438 ?auto_18456 ) ) ( not ( = ?auto_18438 ?auto_18480 ) ) ( not ( = ?auto_18438 ?auto_18477 ) ) ( not ( = ?auto_18438 ?auto_18467 ) ) ( not ( = ?auto_18469 ?auto_18457 ) ) ( not ( = ?auto_18469 ?auto_18475 ) ) ( not ( = ?auto_18469 ?auto_18451 ) ) ( not ( = ?auto_18469 ?auto_18465 ) ) ( not ( = ?auto_18469 ?auto_18463 ) ) ( not ( = ?auto_18469 ?auto_18468 ) ) ( not ( = ?auto_18469 ?auto_18462 ) ) ( not ( = ?auto_18458 ?auto_18476 ) ) ( not ( = ?auto_18458 ?auto_18452 ) ) ( not ( = ?auto_18458 ?auto_18470 ) ) ( not ( = ?auto_18458 ?auto_18455 ) ) ( not ( = ?auto_18458 ?auto_18461 ) ) ( not ( = ?auto_18458 ?auto_18454 ) ) ( not ( = ?auto_18458 ?auto_18460 ) ) ( not ( = ?auto_18481 ?auto_18450 ) ) ( not ( = ?auto_18481 ?auto_18473 ) ) ( not ( = ?auto_18481 ?auto_18474 ) ) ( not ( = ?auto_18481 ?auto_18453 ) ) ( not ( = ?auto_18481 ?auto_18456 ) ) ( not ( = ?auto_18481 ?auto_18480 ) ) ( not ( = ?auto_18481 ?auto_18477 ) ) ( not ( = ?auto_18481 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18440 ) ) ( not ( = ?auto_18429 ?auto_18459 ) ) ( not ( = ?auto_18430 ?auto_18440 ) ) ( not ( = ?auto_18430 ?auto_18459 ) ) ( not ( = ?auto_18431 ?auto_18440 ) ) ( not ( = ?auto_18431 ?auto_18459 ) ) ( not ( = ?auto_18432 ?auto_18440 ) ) ( not ( = ?auto_18432 ?auto_18459 ) ) ( not ( = ?auto_18433 ?auto_18440 ) ) ( not ( = ?auto_18433 ?auto_18459 ) ) ( not ( = ?auto_18434 ?auto_18440 ) ) ( not ( = ?auto_18434 ?auto_18459 ) ) ( not ( = ?auto_18437 ?auto_18440 ) ) ( not ( = ?auto_18437 ?auto_18459 ) ) ( not ( = ?auto_18436 ?auto_18440 ) ) ( not ( = ?auto_18436 ?auto_18459 ) ) ( not ( = ?auto_18435 ?auto_18440 ) ) ( not ( = ?auto_18435 ?auto_18459 ) ) ( not ( = ?auto_18440 ?auto_18481 ) ) ( not ( = ?auto_18440 ?auto_18450 ) ) ( not ( = ?auto_18440 ?auto_18473 ) ) ( not ( = ?auto_18440 ?auto_18474 ) ) ( not ( = ?auto_18440 ?auto_18453 ) ) ( not ( = ?auto_18440 ?auto_18456 ) ) ( not ( = ?auto_18440 ?auto_18480 ) ) ( not ( = ?auto_18440 ?auto_18477 ) ) ( not ( = ?auto_18440 ?auto_18467 ) ) ( not ( = ?auto_18472 ?auto_18469 ) ) ( not ( = ?auto_18472 ?auto_18457 ) ) ( not ( = ?auto_18472 ?auto_18475 ) ) ( not ( = ?auto_18472 ?auto_18451 ) ) ( not ( = ?auto_18472 ?auto_18465 ) ) ( not ( = ?auto_18472 ?auto_18463 ) ) ( not ( = ?auto_18472 ?auto_18468 ) ) ( not ( = ?auto_18472 ?auto_18462 ) ) ( not ( = ?auto_18478 ?auto_18458 ) ) ( not ( = ?auto_18478 ?auto_18476 ) ) ( not ( = ?auto_18478 ?auto_18452 ) ) ( not ( = ?auto_18478 ?auto_18470 ) ) ( not ( = ?auto_18478 ?auto_18455 ) ) ( not ( = ?auto_18478 ?auto_18461 ) ) ( not ( = ?auto_18478 ?auto_18454 ) ) ( not ( = ?auto_18478 ?auto_18460 ) ) ( not ( = ?auto_18459 ?auto_18481 ) ) ( not ( = ?auto_18459 ?auto_18450 ) ) ( not ( = ?auto_18459 ?auto_18473 ) ) ( not ( = ?auto_18459 ?auto_18474 ) ) ( not ( = ?auto_18459 ?auto_18453 ) ) ( not ( = ?auto_18459 ?auto_18456 ) ) ( not ( = ?auto_18459 ?auto_18480 ) ) ( not ( = ?auto_18459 ?auto_18477 ) ) ( not ( = ?auto_18459 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18439 ) ) ( not ( = ?auto_18429 ?auto_18479 ) ) ( not ( = ?auto_18430 ?auto_18439 ) ) ( not ( = ?auto_18430 ?auto_18479 ) ) ( not ( = ?auto_18431 ?auto_18439 ) ) ( not ( = ?auto_18431 ?auto_18479 ) ) ( not ( = ?auto_18432 ?auto_18439 ) ) ( not ( = ?auto_18432 ?auto_18479 ) ) ( not ( = ?auto_18433 ?auto_18439 ) ) ( not ( = ?auto_18433 ?auto_18479 ) ) ( not ( = ?auto_18434 ?auto_18439 ) ) ( not ( = ?auto_18434 ?auto_18479 ) ) ( not ( = ?auto_18437 ?auto_18439 ) ) ( not ( = ?auto_18437 ?auto_18479 ) ) ( not ( = ?auto_18436 ?auto_18439 ) ) ( not ( = ?auto_18436 ?auto_18479 ) ) ( not ( = ?auto_18435 ?auto_18439 ) ) ( not ( = ?auto_18435 ?auto_18479 ) ) ( not ( = ?auto_18438 ?auto_18439 ) ) ( not ( = ?auto_18438 ?auto_18479 ) ) ( not ( = ?auto_18439 ?auto_18459 ) ) ( not ( = ?auto_18439 ?auto_18481 ) ) ( not ( = ?auto_18439 ?auto_18450 ) ) ( not ( = ?auto_18439 ?auto_18473 ) ) ( not ( = ?auto_18439 ?auto_18474 ) ) ( not ( = ?auto_18439 ?auto_18453 ) ) ( not ( = ?auto_18439 ?auto_18456 ) ) ( not ( = ?auto_18439 ?auto_18480 ) ) ( not ( = ?auto_18439 ?auto_18477 ) ) ( not ( = ?auto_18439 ?auto_18467 ) ) ( not ( = ?auto_18479 ?auto_18459 ) ) ( not ( = ?auto_18479 ?auto_18481 ) ) ( not ( = ?auto_18479 ?auto_18450 ) ) ( not ( = ?auto_18479 ?auto_18473 ) ) ( not ( = ?auto_18479 ?auto_18474 ) ) ( not ( = ?auto_18479 ?auto_18453 ) ) ( not ( = ?auto_18479 ?auto_18456 ) ) ( not ( = ?auto_18479 ?auto_18480 ) ) ( not ( = ?auto_18479 ?auto_18477 ) ) ( not ( = ?auto_18479 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18441 ) ) ( not ( = ?auto_18429 ?auto_18471 ) ) ( not ( = ?auto_18430 ?auto_18441 ) ) ( not ( = ?auto_18430 ?auto_18471 ) ) ( not ( = ?auto_18431 ?auto_18441 ) ) ( not ( = ?auto_18431 ?auto_18471 ) ) ( not ( = ?auto_18432 ?auto_18441 ) ) ( not ( = ?auto_18432 ?auto_18471 ) ) ( not ( = ?auto_18433 ?auto_18441 ) ) ( not ( = ?auto_18433 ?auto_18471 ) ) ( not ( = ?auto_18434 ?auto_18441 ) ) ( not ( = ?auto_18434 ?auto_18471 ) ) ( not ( = ?auto_18437 ?auto_18441 ) ) ( not ( = ?auto_18437 ?auto_18471 ) ) ( not ( = ?auto_18436 ?auto_18441 ) ) ( not ( = ?auto_18436 ?auto_18471 ) ) ( not ( = ?auto_18435 ?auto_18441 ) ) ( not ( = ?auto_18435 ?auto_18471 ) ) ( not ( = ?auto_18438 ?auto_18441 ) ) ( not ( = ?auto_18438 ?auto_18471 ) ) ( not ( = ?auto_18440 ?auto_18441 ) ) ( not ( = ?auto_18440 ?auto_18471 ) ) ( not ( = ?auto_18441 ?auto_18479 ) ) ( not ( = ?auto_18441 ?auto_18459 ) ) ( not ( = ?auto_18441 ?auto_18481 ) ) ( not ( = ?auto_18441 ?auto_18450 ) ) ( not ( = ?auto_18441 ?auto_18473 ) ) ( not ( = ?auto_18441 ?auto_18474 ) ) ( not ( = ?auto_18441 ?auto_18453 ) ) ( not ( = ?auto_18441 ?auto_18456 ) ) ( not ( = ?auto_18441 ?auto_18480 ) ) ( not ( = ?auto_18441 ?auto_18477 ) ) ( not ( = ?auto_18441 ?auto_18467 ) ) ( not ( = ?auto_18464 ?auto_18463 ) ) ( not ( = ?auto_18464 ?auto_18472 ) ) ( not ( = ?auto_18464 ?auto_18469 ) ) ( not ( = ?auto_18464 ?auto_18457 ) ) ( not ( = ?auto_18464 ?auto_18475 ) ) ( not ( = ?auto_18464 ?auto_18451 ) ) ( not ( = ?auto_18464 ?auto_18465 ) ) ( not ( = ?auto_18464 ?auto_18468 ) ) ( not ( = ?auto_18464 ?auto_18462 ) ) ( not ( = ?auto_18466 ?auto_18461 ) ) ( not ( = ?auto_18466 ?auto_18478 ) ) ( not ( = ?auto_18466 ?auto_18458 ) ) ( not ( = ?auto_18466 ?auto_18476 ) ) ( not ( = ?auto_18466 ?auto_18452 ) ) ( not ( = ?auto_18466 ?auto_18470 ) ) ( not ( = ?auto_18466 ?auto_18455 ) ) ( not ( = ?auto_18466 ?auto_18454 ) ) ( not ( = ?auto_18466 ?auto_18460 ) ) ( not ( = ?auto_18471 ?auto_18479 ) ) ( not ( = ?auto_18471 ?auto_18459 ) ) ( not ( = ?auto_18471 ?auto_18481 ) ) ( not ( = ?auto_18471 ?auto_18450 ) ) ( not ( = ?auto_18471 ?auto_18473 ) ) ( not ( = ?auto_18471 ?auto_18474 ) ) ( not ( = ?auto_18471 ?auto_18453 ) ) ( not ( = ?auto_18471 ?auto_18456 ) ) ( not ( = ?auto_18471 ?auto_18480 ) ) ( not ( = ?auto_18471 ?auto_18477 ) ) ( not ( = ?auto_18471 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18443 ) ) ( not ( = ?auto_18429 ?auto_18482 ) ) ( not ( = ?auto_18430 ?auto_18443 ) ) ( not ( = ?auto_18430 ?auto_18482 ) ) ( not ( = ?auto_18431 ?auto_18443 ) ) ( not ( = ?auto_18431 ?auto_18482 ) ) ( not ( = ?auto_18432 ?auto_18443 ) ) ( not ( = ?auto_18432 ?auto_18482 ) ) ( not ( = ?auto_18433 ?auto_18443 ) ) ( not ( = ?auto_18433 ?auto_18482 ) ) ( not ( = ?auto_18434 ?auto_18443 ) ) ( not ( = ?auto_18434 ?auto_18482 ) ) ( not ( = ?auto_18437 ?auto_18443 ) ) ( not ( = ?auto_18437 ?auto_18482 ) ) ( not ( = ?auto_18436 ?auto_18443 ) ) ( not ( = ?auto_18436 ?auto_18482 ) ) ( not ( = ?auto_18435 ?auto_18443 ) ) ( not ( = ?auto_18435 ?auto_18482 ) ) ( not ( = ?auto_18438 ?auto_18443 ) ) ( not ( = ?auto_18438 ?auto_18482 ) ) ( not ( = ?auto_18440 ?auto_18443 ) ) ( not ( = ?auto_18440 ?auto_18482 ) ) ( not ( = ?auto_18439 ?auto_18443 ) ) ( not ( = ?auto_18439 ?auto_18482 ) ) ( not ( = ?auto_18443 ?auto_18471 ) ) ( not ( = ?auto_18443 ?auto_18479 ) ) ( not ( = ?auto_18443 ?auto_18459 ) ) ( not ( = ?auto_18443 ?auto_18481 ) ) ( not ( = ?auto_18443 ?auto_18450 ) ) ( not ( = ?auto_18443 ?auto_18473 ) ) ( not ( = ?auto_18443 ?auto_18474 ) ) ( not ( = ?auto_18443 ?auto_18453 ) ) ( not ( = ?auto_18443 ?auto_18456 ) ) ( not ( = ?auto_18443 ?auto_18480 ) ) ( not ( = ?auto_18443 ?auto_18477 ) ) ( not ( = ?auto_18443 ?auto_18467 ) ) ( not ( = ?auto_18482 ?auto_18471 ) ) ( not ( = ?auto_18482 ?auto_18479 ) ) ( not ( = ?auto_18482 ?auto_18459 ) ) ( not ( = ?auto_18482 ?auto_18481 ) ) ( not ( = ?auto_18482 ?auto_18450 ) ) ( not ( = ?auto_18482 ?auto_18473 ) ) ( not ( = ?auto_18482 ?auto_18474 ) ) ( not ( = ?auto_18482 ?auto_18453 ) ) ( not ( = ?auto_18482 ?auto_18456 ) ) ( not ( = ?auto_18482 ?auto_18480 ) ) ( not ( = ?auto_18482 ?auto_18477 ) ) ( not ( = ?auto_18482 ?auto_18467 ) ) ( not ( = ?auto_18429 ?auto_18442 ) ) ( not ( = ?auto_18429 ?auto_18446 ) ) ( not ( = ?auto_18430 ?auto_18442 ) ) ( not ( = ?auto_18430 ?auto_18446 ) ) ( not ( = ?auto_18431 ?auto_18442 ) ) ( not ( = ?auto_18431 ?auto_18446 ) ) ( not ( = ?auto_18432 ?auto_18442 ) ) ( not ( = ?auto_18432 ?auto_18446 ) ) ( not ( = ?auto_18433 ?auto_18442 ) ) ( not ( = ?auto_18433 ?auto_18446 ) ) ( not ( = ?auto_18434 ?auto_18442 ) ) ( not ( = ?auto_18434 ?auto_18446 ) ) ( not ( = ?auto_18437 ?auto_18442 ) ) ( not ( = ?auto_18437 ?auto_18446 ) ) ( not ( = ?auto_18436 ?auto_18442 ) ) ( not ( = ?auto_18436 ?auto_18446 ) ) ( not ( = ?auto_18435 ?auto_18442 ) ) ( not ( = ?auto_18435 ?auto_18446 ) ) ( not ( = ?auto_18438 ?auto_18442 ) ) ( not ( = ?auto_18438 ?auto_18446 ) ) ( not ( = ?auto_18440 ?auto_18442 ) ) ( not ( = ?auto_18440 ?auto_18446 ) ) ( not ( = ?auto_18439 ?auto_18442 ) ) ( not ( = ?auto_18439 ?auto_18446 ) ) ( not ( = ?auto_18441 ?auto_18442 ) ) ( not ( = ?auto_18441 ?auto_18446 ) ) ( not ( = ?auto_18442 ?auto_18482 ) ) ( not ( = ?auto_18442 ?auto_18471 ) ) ( not ( = ?auto_18442 ?auto_18479 ) ) ( not ( = ?auto_18442 ?auto_18459 ) ) ( not ( = ?auto_18442 ?auto_18481 ) ) ( not ( = ?auto_18442 ?auto_18450 ) ) ( not ( = ?auto_18442 ?auto_18473 ) ) ( not ( = ?auto_18442 ?auto_18474 ) ) ( not ( = ?auto_18442 ?auto_18453 ) ) ( not ( = ?auto_18442 ?auto_18456 ) ) ( not ( = ?auto_18442 ?auto_18480 ) ) ( not ( = ?auto_18442 ?auto_18477 ) ) ( not ( = ?auto_18442 ?auto_18467 ) ) ( not ( = ?auto_18444 ?auto_18464 ) ) ( not ( = ?auto_18444 ?auto_18463 ) ) ( not ( = ?auto_18444 ?auto_18472 ) ) ( not ( = ?auto_18444 ?auto_18469 ) ) ( not ( = ?auto_18444 ?auto_18457 ) ) ( not ( = ?auto_18444 ?auto_18475 ) ) ( not ( = ?auto_18444 ?auto_18451 ) ) ( not ( = ?auto_18444 ?auto_18465 ) ) ( not ( = ?auto_18444 ?auto_18468 ) ) ( not ( = ?auto_18444 ?auto_18462 ) ) ( not ( = ?auto_18449 ?auto_18466 ) ) ( not ( = ?auto_18449 ?auto_18461 ) ) ( not ( = ?auto_18449 ?auto_18478 ) ) ( not ( = ?auto_18449 ?auto_18458 ) ) ( not ( = ?auto_18449 ?auto_18476 ) ) ( not ( = ?auto_18449 ?auto_18452 ) ) ( not ( = ?auto_18449 ?auto_18470 ) ) ( not ( = ?auto_18449 ?auto_18455 ) ) ( not ( = ?auto_18449 ?auto_18454 ) ) ( not ( = ?auto_18449 ?auto_18460 ) ) ( not ( = ?auto_18446 ?auto_18482 ) ) ( not ( = ?auto_18446 ?auto_18471 ) ) ( not ( = ?auto_18446 ?auto_18479 ) ) ( not ( = ?auto_18446 ?auto_18459 ) ) ( not ( = ?auto_18446 ?auto_18481 ) ) ( not ( = ?auto_18446 ?auto_18450 ) ) ( not ( = ?auto_18446 ?auto_18473 ) ) ( not ( = ?auto_18446 ?auto_18474 ) ) ( not ( = ?auto_18446 ?auto_18453 ) ) ( not ( = ?auto_18446 ?auto_18456 ) ) ( not ( = ?auto_18446 ?auto_18480 ) ) ( not ( = ?auto_18446 ?auto_18477 ) ) ( not ( = ?auto_18446 ?auto_18467 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_18429 ?auto_18430 ?auto_18431 ?auto_18432 ?auto_18433 ?auto_18434 ?auto_18437 ?auto_18436 ?auto_18435 ?auto_18438 ?auto_18440 ?auto_18439 ?auto_18441 ?auto_18443 )
      ( MAKE-1CRATE ?auto_18443 ?auto_18442 )
      ( MAKE-14CRATE-VERIFY ?auto_18429 ?auto_18430 ?auto_18431 ?auto_18432 ?auto_18433 ?auto_18434 ?auto_18437 ?auto_18436 ?auto_18435 ?auto_18438 ?auto_18440 ?auto_18439 ?auto_18441 ?auto_18443 ?auto_18442 ) )
  )

)

