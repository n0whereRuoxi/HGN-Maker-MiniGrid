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

  ( :method MAKE-15CRATE-VERIFY
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
      ?c15 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( CLEAR ?c15 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596781 - SURFACE
      ?auto_1596782 - SURFACE
    )
    :vars
    (
      ?auto_1596783 - HOIST
      ?auto_1596784 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596783 ?auto_1596784 ) ( SURFACE-AT ?auto_1596781 ?auto_1596784 ) ( CLEAR ?auto_1596781 ) ( LIFTING ?auto_1596783 ?auto_1596782 ) ( IS-CRATE ?auto_1596782 ) ( not ( = ?auto_1596781 ?auto_1596782 ) ) )
    :subtasks
    ( ( !DROP ?auto_1596783 ?auto_1596782 ?auto_1596781 ?auto_1596784 )
      ( MAKE-1CRATE-VERIFY ?auto_1596781 ?auto_1596782 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596785 - SURFACE
      ?auto_1596786 - SURFACE
    )
    :vars
    (
      ?auto_1596787 - HOIST
      ?auto_1596788 - PLACE
      ?auto_1596789 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596787 ?auto_1596788 ) ( SURFACE-AT ?auto_1596785 ?auto_1596788 ) ( CLEAR ?auto_1596785 ) ( IS-CRATE ?auto_1596786 ) ( not ( = ?auto_1596785 ?auto_1596786 ) ) ( TRUCK-AT ?auto_1596789 ?auto_1596788 ) ( AVAILABLE ?auto_1596787 ) ( IN ?auto_1596786 ?auto_1596789 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1596787 ?auto_1596786 ?auto_1596789 ?auto_1596788 )
      ( MAKE-1CRATE ?auto_1596785 ?auto_1596786 )
      ( MAKE-1CRATE-VERIFY ?auto_1596785 ?auto_1596786 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596790 - SURFACE
      ?auto_1596791 - SURFACE
    )
    :vars
    (
      ?auto_1596794 - HOIST
      ?auto_1596792 - PLACE
      ?auto_1596793 - TRUCK
      ?auto_1596795 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596794 ?auto_1596792 ) ( SURFACE-AT ?auto_1596790 ?auto_1596792 ) ( CLEAR ?auto_1596790 ) ( IS-CRATE ?auto_1596791 ) ( not ( = ?auto_1596790 ?auto_1596791 ) ) ( AVAILABLE ?auto_1596794 ) ( IN ?auto_1596791 ?auto_1596793 ) ( TRUCK-AT ?auto_1596793 ?auto_1596795 ) ( not ( = ?auto_1596795 ?auto_1596792 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596793 ?auto_1596795 ?auto_1596792 )
      ( MAKE-1CRATE ?auto_1596790 ?auto_1596791 )
      ( MAKE-1CRATE-VERIFY ?auto_1596790 ?auto_1596791 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596796 - SURFACE
      ?auto_1596797 - SURFACE
    )
    :vars
    (
      ?auto_1596798 - HOIST
      ?auto_1596799 - PLACE
      ?auto_1596800 - TRUCK
      ?auto_1596801 - PLACE
      ?auto_1596802 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596798 ?auto_1596799 ) ( SURFACE-AT ?auto_1596796 ?auto_1596799 ) ( CLEAR ?auto_1596796 ) ( IS-CRATE ?auto_1596797 ) ( not ( = ?auto_1596796 ?auto_1596797 ) ) ( AVAILABLE ?auto_1596798 ) ( TRUCK-AT ?auto_1596800 ?auto_1596801 ) ( not ( = ?auto_1596801 ?auto_1596799 ) ) ( HOIST-AT ?auto_1596802 ?auto_1596801 ) ( LIFTING ?auto_1596802 ?auto_1596797 ) ( not ( = ?auto_1596798 ?auto_1596802 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596802 ?auto_1596797 ?auto_1596800 ?auto_1596801 )
      ( MAKE-1CRATE ?auto_1596796 ?auto_1596797 )
      ( MAKE-1CRATE-VERIFY ?auto_1596796 ?auto_1596797 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596803 - SURFACE
      ?auto_1596804 - SURFACE
    )
    :vars
    (
      ?auto_1596806 - HOIST
      ?auto_1596808 - PLACE
      ?auto_1596805 - TRUCK
      ?auto_1596809 - PLACE
      ?auto_1596807 - HOIST
      ?auto_1596810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596806 ?auto_1596808 ) ( SURFACE-AT ?auto_1596803 ?auto_1596808 ) ( CLEAR ?auto_1596803 ) ( IS-CRATE ?auto_1596804 ) ( not ( = ?auto_1596803 ?auto_1596804 ) ) ( AVAILABLE ?auto_1596806 ) ( TRUCK-AT ?auto_1596805 ?auto_1596809 ) ( not ( = ?auto_1596809 ?auto_1596808 ) ) ( HOIST-AT ?auto_1596807 ?auto_1596809 ) ( not ( = ?auto_1596806 ?auto_1596807 ) ) ( AVAILABLE ?auto_1596807 ) ( SURFACE-AT ?auto_1596804 ?auto_1596809 ) ( ON ?auto_1596804 ?auto_1596810 ) ( CLEAR ?auto_1596804 ) ( not ( = ?auto_1596803 ?auto_1596810 ) ) ( not ( = ?auto_1596804 ?auto_1596810 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1596807 ?auto_1596804 ?auto_1596810 ?auto_1596809 )
      ( MAKE-1CRATE ?auto_1596803 ?auto_1596804 )
      ( MAKE-1CRATE-VERIFY ?auto_1596803 ?auto_1596804 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596811 - SURFACE
      ?auto_1596812 - SURFACE
    )
    :vars
    (
      ?auto_1596813 - HOIST
      ?auto_1596815 - PLACE
      ?auto_1596816 - PLACE
      ?auto_1596817 - HOIST
      ?auto_1596814 - SURFACE
      ?auto_1596818 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596813 ?auto_1596815 ) ( SURFACE-AT ?auto_1596811 ?auto_1596815 ) ( CLEAR ?auto_1596811 ) ( IS-CRATE ?auto_1596812 ) ( not ( = ?auto_1596811 ?auto_1596812 ) ) ( AVAILABLE ?auto_1596813 ) ( not ( = ?auto_1596816 ?auto_1596815 ) ) ( HOIST-AT ?auto_1596817 ?auto_1596816 ) ( not ( = ?auto_1596813 ?auto_1596817 ) ) ( AVAILABLE ?auto_1596817 ) ( SURFACE-AT ?auto_1596812 ?auto_1596816 ) ( ON ?auto_1596812 ?auto_1596814 ) ( CLEAR ?auto_1596812 ) ( not ( = ?auto_1596811 ?auto_1596814 ) ) ( not ( = ?auto_1596812 ?auto_1596814 ) ) ( TRUCK-AT ?auto_1596818 ?auto_1596815 ) )
    :subtasks
    ( ( !DRIVE ?auto_1596818 ?auto_1596815 ?auto_1596816 )
      ( MAKE-1CRATE ?auto_1596811 ?auto_1596812 )
      ( MAKE-1CRATE-VERIFY ?auto_1596811 ?auto_1596812 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596828 - SURFACE
      ?auto_1596829 - SURFACE
      ?auto_1596830 - SURFACE
    )
    :vars
    (
      ?auto_1596831 - HOIST
      ?auto_1596832 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596831 ?auto_1596832 ) ( SURFACE-AT ?auto_1596829 ?auto_1596832 ) ( CLEAR ?auto_1596829 ) ( LIFTING ?auto_1596831 ?auto_1596830 ) ( IS-CRATE ?auto_1596830 ) ( not ( = ?auto_1596829 ?auto_1596830 ) ) ( ON ?auto_1596829 ?auto_1596828 ) ( not ( = ?auto_1596828 ?auto_1596829 ) ) ( not ( = ?auto_1596828 ?auto_1596830 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596829 ?auto_1596830 )
      ( MAKE-2CRATE-VERIFY ?auto_1596828 ?auto_1596829 ?auto_1596830 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596838 - SURFACE
      ?auto_1596839 - SURFACE
      ?auto_1596840 - SURFACE
    )
    :vars
    (
      ?auto_1596841 - HOIST
      ?auto_1596842 - PLACE
      ?auto_1596843 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596841 ?auto_1596842 ) ( SURFACE-AT ?auto_1596839 ?auto_1596842 ) ( CLEAR ?auto_1596839 ) ( IS-CRATE ?auto_1596840 ) ( not ( = ?auto_1596839 ?auto_1596840 ) ) ( TRUCK-AT ?auto_1596843 ?auto_1596842 ) ( AVAILABLE ?auto_1596841 ) ( IN ?auto_1596840 ?auto_1596843 ) ( ON ?auto_1596839 ?auto_1596838 ) ( not ( = ?auto_1596838 ?auto_1596839 ) ) ( not ( = ?auto_1596838 ?auto_1596840 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596839 ?auto_1596840 )
      ( MAKE-2CRATE-VERIFY ?auto_1596838 ?auto_1596839 ?auto_1596840 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596844 - SURFACE
      ?auto_1596845 - SURFACE
    )
    :vars
    (
      ?auto_1596846 - HOIST
      ?auto_1596847 - PLACE
      ?auto_1596848 - TRUCK
      ?auto_1596849 - SURFACE
      ?auto_1596850 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596846 ?auto_1596847 ) ( SURFACE-AT ?auto_1596844 ?auto_1596847 ) ( CLEAR ?auto_1596844 ) ( IS-CRATE ?auto_1596845 ) ( not ( = ?auto_1596844 ?auto_1596845 ) ) ( AVAILABLE ?auto_1596846 ) ( IN ?auto_1596845 ?auto_1596848 ) ( ON ?auto_1596844 ?auto_1596849 ) ( not ( = ?auto_1596849 ?auto_1596844 ) ) ( not ( = ?auto_1596849 ?auto_1596845 ) ) ( TRUCK-AT ?auto_1596848 ?auto_1596850 ) ( not ( = ?auto_1596850 ?auto_1596847 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596848 ?auto_1596850 ?auto_1596847 )
      ( MAKE-2CRATE ?auto_1596849 ?auto_1596844 ?auto_1596845 )
      ( MAKE-1CRATE-VERIFY ?auto_1596844 ?auto_1596845 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596851 - SURFACE
      ?auto_1596852 - SURFACE
      ?auto_1596853 - SURFACE
    )
    :vars
    (
      ?auto_1596856 - HOIST
      ?auto_1596854 - PLACE
      ?auto_1596855 - TRUCK
      ?auto_1596857 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596856 ?auto_1596854 ) ( SURFACE-AT ?auto_1596852 ?auto_1596854 ) ( CLEAR ?auto_1596852 ) ( IS-CRATE ?auto_1596853 ) ( not ( = ?auto_1596852 ?auto_1596853 ) ) ( AVAILABLE ?auto_1596856 ) ( IN ?auto_1596853 ?auto_1596855 ) ( ON ?auto_1596852 ?auto_1596851 ) ( not ( = ?auto_1596851 ?auto_1596852 ) ) ( not ( = ?auto_1596851 ?auto_1596853 ) ) ( TRUCK-AT ?auto_1596855 ?auto_1596857 ) ( not ( = ?auto_1596857 ?auto_1596854 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596852 ?auto_1596853 )
      ( MAKE-2CRATE-VERIFY ?auto_1596851 ?auto_1596852 ?auto_1596853 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596858 - SURFACE
      ?auto_1596859 - SURFACE
    )
    :vars
    (
      ?auto_1596861 - HOIST
      ?auto_1596862 - PLACE
      ?auto_1596863 - SURFACE
      ?auto_1596860 - TRUCK
      ?auto_1596864 - PLACE
      ?auto_1596865 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596861 ?auto_1596862 ) ( SURFACE-AT ?auto_1596858 ?auto_1596862 ) ( CLEAR ?auto_1596858 ) ( IS-CRATE ?auto_1596859 ) ( not ( = ?auto_1596858 ?auto_1596859 ) ) ( AVAILABLE ?auto_1596861 ) ( ON ?auto_1596858 ?auto_1596863 ) ( not ( = ?auto_1596863 ?auto_1596858 ) ) ( not ( = ?auto_1596863 ?auto_1596859 ) ) ( TRUCK-AT ?auto_1596860 ?auto_1596864 ) ( not ( = ?auto_1596864 ?auto_1596862 ) ) ( HOIST-AT ?auto_1596865 ?auto_1596864 ) ( LIFTING ?auto_1596865 ?auto_1596859 ) ( not ( = ?auto_1596861 ?auto_1596865 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1596865 ?auto_1596859 ?auto_1596860 ?auto_1596864 )
      ( MAKE-2CRATE ?auto_1596863 ?auto_1596858 ?auto_1596859 )
      ( MAKE-1CRATE-VERIFY ?auto_1596858 ?auto_1596859 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596866 - SURFACE
      ?auto_1596867 - SURFACE
      ?auto_1596868 - SURFACE
    )
    :vars
    (
      ?auto_1596869 - HOIST
      ?auto_1596872 - PLACE
      ?auto_1596871 - TRUCK
      ?auto_1596870 - PLACE
      ?auto_1596873 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596869 ?auto_1596872 ) ( SURFACE-AT ?auto_1596867 ?auto_1596872 ) ( CLEAR ?auto_1596867 ) ( IS-CRATE ?auto_1596868 ) ( not ( = ?auto_1596867 ?auto_1596868 ) ) ( AVAILABLE ?auto_1596869 ) ( ON ?auto_1596867 ?auto_1596866 ) ( not ( = ?auto_1596866 ?auto_1596867 ) ) ( not ( = ?auto_1596866 ?auto_1596868 ) ) ( TRUCK-AT ?auto_1596871 ?auto_1596870 ) ( not ( = ?auto_1596870 ?auto_1596872 ) ) ( HOIST-AT ?auto_1596873 ?auto_1596870 ) ( LIFTING ?auto_1596873 ?auto_1596868 ) ( not ( = ?auto_1596869 ?auto_1596873 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596867 ?auto_1596868 )
      ( MAKE-2CRATE-VERIFY ?auto_1596866 ?auto_1596867 ?auto_1596868 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596874 - SURFACE
      ?auto_1596875 - SURFACE
    )
    :vars
    (
      ?auto_1596878 - HOIST
      ?auto_1596877 - PLACE
      ?auto_1596876 - SURFACE
      ?auto_1596881 - TRUCK
      ?auto_1596880 - PLACE
      ?auto_1596879 - HOIST
      ?auto_1596882 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596878 ?auto_1596877 ) ( SURFACE-AT ?auto_1596874 ?auto_1596877 ) ( CLEAR ?auto_1596874 ) ( IS-CRATE ?auto_1596875 ) ( not ( = ?auto_1596874 ?auto_1596875 ) ) ( AVAILABLE ?auto_1596878 ) ( ON ?auto_1596874 ?auto_1596876 ) ( not ( = ?auto_1596876 ?auto_1596874 ) ) ( not ( = ?auto_1596876 ?auto_1596875 ) ) ( TRUCK-AT ?auto_1596881 ?auto_1596880 ) ( not ( = ?auto_1596880 ?auto_1596877 ) ) ( HOIST-AT ?auto_1596879 ?auto_1596880 ) ( not ( = ?auto_1596878 ?auto_1596879 ) ) ( AVAILABLE ?auto_1596879 ) ( SURFACE-AT ?auto_1596875 ?auto_1596880 ) ( ON ?auto_1596875 ?auto_1596882 ) ( CLEAR ?auto_1596875 ) ( not ( = ?auto_1596874 ?auto_1596882 ) ) ( not ( = ?auto_1596875 ?auto_1596882 ) ) ( not ( = ?auto_1596876 ?auto_1596882 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1596879 ?auto_1596875 ?auto_1596882 ?auto_1596880 )
      ( MAKE-2CRATE ?auto_1596876 ?auto_1596874 ?auto_1596875 )
      ( MAKE-1CRATE-VERIFY ?auto_1596874 ?auto_1596875 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596883 - SURFACE
      ?auto_1596884 - SURFACE
      ?auto_1596885 - SURFACE
    )
    :vars
    (
      ?auto_1596890 - HOIST
      ?auto_1596888 - PLACE
      ?auto_1596889 - TRUCK
      ?auto_1596887 - PLACE
      ?auto_1596891 - HOIST
      ?auto_1596886 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596890 ?auto_1596888 ) ( SURFACE-AT ?auto_1596884 ?auto_1596888 ) ( CLEAR ?auto_1596884 ) ( IS-CRATE ?auto_1596885 ) ( not ( = ?auto_1596884 ?auto_1596885 ) ) ( AVAILABLE ?auto_1596890 ) ( ON ?auto_1596884 ?auto_1596883 ) ( not ( = ?auto_1596883 ?auto_1596884 ) ) ( not ( = ?auto_1596883 ?auto_1596885 ) ) ( TRUCK-AT ?auto_1596889 ?auto_1596887 ) ( not ( = ?auto_1596887 ?auto_1596888 ) ) ( HOIST-AT ?auto_1596891 ?auto_1596887 ) ( not ( = ?auto_1596890 ?auto_1596891 ) ) ( AVAILABLE ?auto_1596891 ) ( SURFACE-AT ?auto_1596885 ?auto_1596887 ) ( ON ?auto_1596885 ?auto_1596886 ) ( CLEAR ?auto_1596885 ) ( not ( = ?auto_1596884 ?auto_1596886 ) ) ( not ( = ?auto_1596885 ?auto_1596886 ) ) ( not ( = ?auto_1596883 ?auto_1596886 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596884 ?auto_1596885 )
      ( MAKE-2CRATE-VERIFY ?auto_1596883 ?auto_1596884 ?auto_1596885 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596892 - SURFACE
      ?auto_1596893 - SURFACE
    )
    :vars
    (
      ?auto_1596899 - HOIST
      ?auto_1596895 - PLACE
      ?auto_1596897 - SURFACE
      ?auto_1596898 - PLACE
      ?auto_1596900 - HOIST
      ?auto_1596896 - SURFACE
      ?auto_1596894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596899 ?auto_1596895 ) ( SURFACE-AT ?auto_1596892 ?auto_1596895 ) ( CLEAR ?auto_1596892 ) ( IS-CRATE ?auto_1596893 ) ( not ( = ?auto_1596892 ?auto_1596893 ) ) ( AVAILABLE ?auto_1596899 ) ( ON ?auto_1596892 ?auto_1596897 ) ( not ( = ?auto_1596897 ?auto_1596892 ) ) ( not ( = ?auto_1596897 ?auto_1596893 ) ) ( not ( = ?auto_1596898 ?auto_1596895 ) ) ( HOIST-AT ?auto_1596900 ?auto_1596898 ) ( not ( = ?auto_1596899 ?auto_1596900 ) ) ( AVAILABLE ?auto_1596900 ) ( SURFACE-AT ?auto_1596893 ?auto_1596898 ) ( ON ?auto_1596893 ?auto_1596896 ) ( CLEAR ?auto_1596893 ) ( not ( = ?auto_1596892 ?auto_1596896 ) ) ( not ( = ?auto_1596893 ?auto_1596896 ) ) ( not ( = ?auto_1596897 ?auto_1596896 ) ) ( TRUCK-AT ?auto_1596894 ?auto_1596895 ) )
    :subtasks
    ( ( !DRIVE ?auto_1596894 ?auto_1596895 ?auto_1596898 )
      ( MAKE-2CRATE ?auto_1596897 ?auto_1596892 ?auto_1596893 )
      ( MAKE-1CRATE-VERIFY ?auto_1596892 ?auto_1596893 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596901 - SURFACE
      ?auto_1596902 - SURFACE
      ?auto_1596903 - SURFACE
    )
    :vars
    (
      ?auto_1596906 - HOIST
      ?auto_1596908 - PLACE
      ?auto_1596904 - PLACE
      ?auto_1596909 - HOIST
      ?auto_1596905 - SURFACE
      ?auto_1596907 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596906 ?auto_1596908 ) ( SURFACE-AT ?auto_1596902 ?auto_1596908 ) ( CLEAR ?auto_1596902 ) ( IS-CRATE ?auto_1596903 ) ( not ( = ?auto_1596902 ?auto_1596903 ) ) ( AVAILABLE ?auto_1596906 ) ( ON ?auto_1596902 ?auto_1596901 ) ( not ( = ?auto_1596901 ?auto_1596902 ) ) ( not ( = ?auto_1596901 ?auto_1596903 ) ) ( not ( = ?auto_1596904 ?auto_1596908 ) ) ( HOIST-AT ?auto_1596909 ?auto_1596904 ) ( not ( = ?auto_1596906 ?auto_1596909 ) ) ( AVAILABLE ?auto_1596909 ) ( SURFACE-AT ?auto_1596903 ?auto_1596904 ) ( ON ?auto_1596903 ?auto_1596905 ) ( CLEAR ?auto_1596903 ) ( not ( = ?auto_1596902 ?auto_1596905 ) ) ( not ( = ?auto_1596903 ?auto_1596905 ) ) ( not ( = ?auto_1596901 ?auto_1596905 ) ) ( TRUCK-AT ?auto_1596907 ?auto_1596908 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596902 ?auto_1596903 )
      ( MAKE-2CRATE-VERIFY ?auto_1596901 ?auto_1596902 ?auto_1596903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596910 - SURFACE
      ?auto_1596911 - SURFACE
    )
    :vars
    (
      ?auto_1596916 - HOIST
      ?auto_1596915 - PLACE
      ?auto_1596912 - SURFACE
      ?auto_1596914 - PLACE
      ?auto_1596918 - HOIST
      ?auto_1596917 - SURFACE
      ?auto_1596913 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596916 ?auto_1596915 ) ( IS-CRATE ?auto_1596911 ) ( not ( = ?auto_1596910 ?auto_1596911 ) ) ( not ( = ?auto_1596912 ?auto_1596910 ) ) ( not ( = ?auto_1596912 ?auto_1596911 ) ) ( not ( = ?auto_1596914 ?auto_1596915 ) ) ( HOIST-AT ?auto_1596918 ?auto_1596914 ) ( not ( = ?auto_1596916 ?auto_1596918 ) ) ( AVAILABLE ?auto_1596918 ) ( SURFACE-AT ?auto_1596911 ?auto_1596914 ) ( ON ?auto_1596911 ?auto_1596917 ) ( CLEAR ?auto_1596911 ) ( not ( = ?auto_1596910 ?auto_1596917 ) ) ( not ( = ?auto_1596911 ?auto_1596917 ) ) ( not ( = ?auto_1596912 ?auto_1596917 ) ) ( TRUCK-AT ?auto_1596913 ?auto_1596915 ) ( SURFACE-AT ?auto_1596912 ?auto_1596915 ) ( CLEAR ?auto_1596912 ) ( LIFTING ?auto_1596916 ?auto_1596910 ) ( IS-CRATE ?auto_1596910 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596912 ?auto_1596910 )
      ( MAKE-2CRATE ?auto_1596912 ?auto_1596910 ?auto_1596911 )
      ( MAKE-1CRATE-VERIFY ?auto_1596910 ?auto_1596911 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596919 - SURFACE
      ?auto_1596920 - SURFACE
      ?auto_1596921 - SURFACE
    )
    :vars
    (
      ?auto_1596922 - HOIST
      ?auto_1596925 - PLACE
      ?auto_1596923 - PLACE
      ?auto_1596927 - HOIST
      ?auto_1596924 - SURFACE
      ?auto_1596926 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596922 ?auto_1596925 ) ( IS-CRATE ?auto_1596921 ) ( not ( = ?auto_1596920 ?auto_1596921 ) ) ( not ( = ?auto_1596919 ?auto_1596920 ) ) ( not ( = ?auto_1596919 ?auto_1596921 ) ) ( not ( = ?auto_1596923 ?auto_1596925 ) ) ( HOIST-AT ?auto_1596927 ?auto_1596923 ) ( not ( = ?auto_1596922 ?auto_1596927 ) ) ( AVAILABLE ?auto_1596927 ) ( SURFACE-AT ?auto_1596921 ?auto_1596923 ) ( ON ?auto_1596921 ?auto_1596924 ) ( CLEAR ?auto_1596921 ) ( not ( = ?auto_1596920 ?auto_1596924 ) ) ( not ( = ?auto_1596921 ?auto_1596924 ) ) ( not ( = ?auto_1596919 ?auto_1596924 ) ) ( TRUCK-AT ?auto_1596926 ?auto_1596925 ) ( SURFACE-AT ?auto_1596919 ?auto_1596925 ) ( CLEAR ?auto_1596919 ) ( LIFTING ?auto_1596922 ?auto_1596920 ) ( IS-CRATE ?auto_1596920 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596920 ?auto_1596921 )
      ( MAKE-2CRATE-VERIFY ?auto_1596919 ?auto_1596920 ?auto_1596921 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596928 - SURFACE
      ?auto_1596929 - SURFACE
    )
    :vars
    (
      ?auto_1596930 - HOIST
      ?auto_1596933 - PLACE
      ?auto_1596935 - SURFACE
      ?auto_1596936 - PLACE
      ?auto_1596932 - HOIST
      ?auto_1596931 - SURFACE
      ?auto_1596934 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596930 ?auto_1596933 ) ( IS-CRATE ?auto_1596929 ) ( not ( = ?auto_1596928 ?auto_1596929 ) ) ( not ( = ?auto_1596935 ?auto_1596928 ) ) ( not ( = ?auto_1596935 ?auto_1596929 ) ) ( not ( = ?auto_1596936 ?auto_1596933 ) ) ( HOIST-AT ?auto_1596932 ?auto_1596936 ) ( not ( = ?auto_1596930 ?auto_1596932 ) ) ( AVAILABLE ?auto_1596932 ) ( SURFACE-AT ?auto_1596929 ?auto_1596936 ) ( ON ?auto_1596929 ?auto_1596931 ) ( CLEAR ?auto_1596929 ) ( not ( = ?auto_1596928 ?auto_1596931 ) ) ( not ( = ?auto_1596929 ?auto_1596931 ) ) ( not ( = ?auto_1596935 ?auto_1596931 ) ) ( TRUCK-AT ?auto_1596934 ?auto_1596933 ) ( SURFACE-AT ?auto_1596935 ?auto_1596933 ) ( CLEAR ?auto_1596935 ) ( IS-CRATE ?auto_1596928 ) ( AVAILABLE ?auto_1596930 ) ( IN ?auto_1596928 ?auto_1596934 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1596930 ?auto_1596928 ?auto_1596934 ?auto_1596933 )
      ( MAKE-2CRATE ?auto_1596935 ?auto_1596928 ?auto_1596929 )
      ( MAKE-1CRATE-VERIFY ?auto_1596928 ?auto_1596929 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1596937 - SURFACE
      ?auto_1596938 - SURFACE
      ?auto_1596939 - SURFACE
    )
    :vars
    (
      ?auto_1596942 - HOIST
      ?auto_1596943 - PLACE
      ?auto_1596941 - PLACE
      ?auto_1596940 - HOIST
      ?auto_1596945 - SURFACE
      ?auto_1596944 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596942 ?auto_1596943 ) ( IS-CRATE ?auto_1596939 ) ( not ( = ?auto_1596938 ?auto_1596939 ) ) ( not ( = ?auto_1596937 ?auto_1596938 ) ) ( not ( = ?auto_1596937 ?auto_1596939 ) ) ( not ( = ?auto_1596941 ?auto_1596943 ) ) ( HOIST-AT ?auto_1596940 ?auto_1596941 ) ( not ( = ?auto_1596942 ?auto_1596940 ) ) ( AVAILABLE ?auto_1596940 ) ( SURFACE-AT ?auto_1596939 ?auto_1596941 ) ( ON ?auto_1596939 ?auto_1596945 ) ( CLEAR ?auto_1596939 ) ( not ( = ?auto_1596938 ?auto_1596945 ) ) ( not ( = ?auto_1596939 ?auto_1596945 ) ) ( not ( = ?auto_1596937 ?auto_1596945 ) ) ( TRUCK-AT ?auto_1596944 ?auto_1596943 ) ( SURFACE-AT ?auto_1596937 ?auto_1596943 ) ( CLEAR ?auto_1596937 ) ( IS-CRATE ?auto_1596938 ) ( AVAILABLE ?auto_1596942 ) ( IN ?auto_1596938 ?auto_1596944 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1596938 ?auto_1596939 )
      ( MAKE-2CRATE-VERIFY ?auto_1596937 ?auto_1596938 ?auto_1596939 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1596982 - SURFACE
      ?auto_1596983 - SURFACE
    )
    :vars
    (
      ?auto_1596985 - HOIST
      ?auto_1596984 - PLACE
      ?auto_1596986 - SURFACE
      ?auto_1596988 - PLACE
      ?auto_1596987 - HOIST
      ?auto_1596990 - SURFACE
      ?auto_1596989 - TRUCK
      ?auto_1596991 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1596985 ?auto_1596984 ) ( SURFACE-AT ?auto_1596982 ?auto_1596984 ) ( CLEAR ?auto_1596982 ) ( IS-CRATE ?auto_1596983 ) ( not ( = ?auto_1596982 ?auto_1596983 ) ) ( AVAILABLE ?auto_1596985 ) ( ON ?auto_1596982 ?auto_1596986 ) ( not ( = ?auto_1596986 ?auto_1596982 ) ) ( not ( = ?auto_1596986 ?auto_1596983 ) ) ( not ( = ?auto_1596988 ?auto_1596984 ) ) ( HOIST-AT ?auto_1596987 ?auto_1596988 ) ( not ( = ?auto_1596985 ?auto_1596987 ) ) ( AVAILABLE ?auto_1596987 ) ( SURFACE-AT ?auto_1596983 ?auto_1596988 ) ( ON ?auto_1596983 ?auto_1596990 ) ( CLEAR ?auto_1596983 ) ( not ( = ?auto_1596982 ?auto_1596990 ) ) ( not ( = ?auto_1596983 ?auto_1596990 ) ) ( not ( = ?auto_1596986 ?auto_1596990 ) ) ( TRUCK-AT ?auto_1596989 ?auto_1596991 ) ( not ( = ?auto_1596991 ?auto_1596984 ) ) ( not ( = ?auto_1596988 ?auto_1596991 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596989 ?auto_1596991 ?auto_1596984 )
      ( MAKE-1CRATE ?auto_1596982 ?auto_1596983 )
      ( MAKE-1CRATE-VERIFY ?auto_1596982 ?auto_1596983 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597021 - SURFACE
      ?auto_1597022 - SURFACE
      ?auto_1597023 - SURFACE
      ?auto_1597024 - SURFACE
    )
    :vars
    (
      ?auto_1597025 - HOIST
      ?auto_1597026 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597025 ?auto_1597026 ) ( SURFACE-AT ?auto_1597023 ?auto_1597026 ) ( CLEAR ?auto_1597023 ) ( LIFTING ?auto_1597025 ?auto_1597024 ) ( IS-CRATE ?auto_1597024 ) ( not ( = ?auto_1597023 ?auto_1597024 ) ) ( ON ?auto_1597022 ?auto_1597021 ) ( ON ?auto_1597023 ?auto_1597022 ) ( not ( = ?auto_1597021 ?auto_1597022 ) ) ( not ( = ?auto_1597021 ?auto_1597023 ) ) ( not ( = ?auto_1597021 ?auto_1597024 ) ) ( not ( = ?auto_1597022 ?auto_1597023 ) ) ( not ( = ?auto_1597022 ?auto_1597024 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1597023 ?auto_1597024 )
      ( MAKE-3CRATE-VERIFY ?auto_1597021 ?auto_1597022 ?auto_1597023 ?auto_1597024 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597038 - SURFACE
      ?auto_1597039 - SURFACE
      ?auto_1597040 - SURFACE
      ?auto_1597041 - SURFACE
    )
    :vars
    (
      ?auto_1597043 - HOIST
      ?auto_1597044 - PLACE
      ?auto_1597042 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597043 ?auto_1597044 ) ( SURFACE-AT ?auto_1597040 ?auto_1597044 ) ( CLEAR ?auto_1597040 ) ( IS-CRATE ?auto_1597041 ) ( not ( = ?auto_1597040 ?auto_1597041 ) ) ( TRUCK-AT ?auto_1597042 ?auto_1597044 ) ( AVAILABLE ?auto_1597043 ) ( IN ?auto_1597041 ?auto_1597042 ) ( ON ?auto_1597040 ?auto_1597039 ) ( not ( = ?auto_1597039 ?auto_1597040 ) ) ( not ( = ?auto_1597039 ?auto_1597041 ) ) ( ON ?auto_1597039 ?auto_1597038 ) ( not ( = ?auto_1597038 ?auto_1597039 ) ) ( not ( = ?auto_1597038 ?auto_1597040 ) ) ( not ( = ?auto_1597038 ?auto_1597041 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597039 ?auto_1597040 ?auto_1597041 )
      ( MAKE-3CRATE-VERIFY ?auto_1597038 ?auto_1597039 ?auto_1597040 ?auto_1597041 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597059 - SURFACE
      ?auto_1597060 - SURFACE
      ?auto_1597061 - SURFACE
      ?auto_1597062 - SURFACE
    )
    :vars
    (
      ?auto_1597065 - HOIST
      ?auto_1597066 - PLACE
      ?auto_1597064 - TRUCK
      ?auto_1597063 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597065 ?auto_1597066 ) ( SURFACE-AT ?auto_1597061 ?auto_1597066 ) ( CLEAR ?auto_1597061 ) ( IS-CRATE ?auto_1597062 ) ( not ( = ?auto_1597061 ?auto_1597062 ) ) ( AVAILABLE ?auto_1597065 ) ( IN ?auto_1597062 ?auto_1597064 ) ( ON ?auto_1597061 ?auto_1597060 ) ( not ( = ?auto_1597060 ?auto_1597061 ) ) ( not ( = ?auto_1597060 ?auto_1597062 ) ) ( TRUCK-AT ?auto_1597064 ?auto_1597063 ) ( not ( = ?auto_1597063 ?auto_1597066 ) ) ( ON ?auto_1597060 ?auto_1597059 ) ( not ( = ?auto_1597059 ?auto_1597060 ) ) ( not ( = ?auto_1597059 ?auto_1597061 ) ) ( not ( = ?auto_1597059 ?auto_1597062 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597060 ?auto_1597061 ?auto_1597062 )
      ( MAKE-3CRATE-VERIFY ?auto_1597059 ?auto_1597060 ?auto_1597061 ?auto_1597062 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597083 - SURFACE
      ?auto_1597084 - SURFACE
      ?auto_1597085 - SURFACE
      ?auto_1597086 - SURFACE
    )
    :vars
    (
      ?auto_1597090 - HOIST
      ?auto_1597091 - PLACE
      ?auto_1597088 - TRUCK
      ?auto_1597089 - PLACE
      ?auto_1597087 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597090 ?auto_1597091 ) ( SURFACE-AT ?auto_1597085 ?auto_1597091 ) ( CLEAR ?auto_1597085 ) ( IS-CRATE ?auto_1597086 ) ( not ( = ?auto_1597085 ?auto_1597086 ) ) ( AVAILABLE ?auto_1597090 ) ( ON ?auto_1597085 ?auto_1597084 ) ( not ( = ?auto_1597084 ?auto_1597085 ) ) ( not ( = ?auto_1597084 ?auto_1597086 ) ) ( TRUCK-AT ?auto_1597088 ?auto_1597089 ) ( not ( = ?auto_1597089 ?auto_1597091 ) ) ( HOIST-AT ?auto_1597087 ?auto_1597089 ) ( LIFTING ?auto_1597087 ?auto_1597086 ) ( not ( = ?auto_1597090 ?auto_1597087 ) ) ( ON ?auto_1597084 ?auto_1597083 ) ( not ( = ?auto_1597083 ?auto_1597084 ) ) ( not ( = ?auto_1597083 ?auto_1597085 ) ) ( not ( = ?auto_1597083 ?auto_1597086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597084 ?auto_1597085 ?auto_1597086 )
      ( MAKE-3CRATE-VERIFY ?auto_1597083 ?auto_1597084 ?auto_1597085 ?auto_1597086 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597110 - SURFACE
      ?auto_1597111 - SURFACE
      ?auto_1597112 - SURFACE
      ?auto_1597113 - SURFACE
    )
    :vars
    (
      ?auto_1597116 - HOIST
      ?auto_1597114 - PLACE
      ?auto_1597115 - TRUCK
      ?auto_1597118 - PLACE
      ?auto_1597119 - HOIST
      ?auto_1597117 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597116 ?auto_1597114 ) ( SURFACE-AT ?auto_1597112 ?auto_1597114 ) ( CLEAR ?auto_1597112 ) ( IS-CRATE ?auto_1597113 ) ( not ( = ?auto_1597112 ?auto_1597113 ) ) ( AVAILABLE ?auto_1597116 ) ( ON ?auto_1597112 ?auto_1597111 ) ( not ( = ?auto_1597111 ?auto_1597112 ) ) ( not ( = ?auto_1597111 ?auto_1597113 ) ) ( TRUCK-AT ?auto_1597115 ?auto_1597118 ) ( not ( = ?auto_1597118 ?auto_1597114 ) ) ( HOIST-AT ?auto_1597119 ?auto_1597118 ) ( not ( = ?auto_1597116 ?auto_1597119 ) ) ( AVAILABLE ?auto_1597119 ) ( SURFACE-AT ?auto_1597113 ?auto_1597118 ) ( ON ?auto_1597113 ?auto_1597117 ) ( CLEAR ?auto_1597113 ) ( not ( = ?auto_1597112 ?auto_1597117 ) ) ( not ( = ?auto_1597113 ?auto_1597117 ) ) ( not ( = ?auto_1597111 ?auto_1597117 ) ) ( ON ?auto_1597111 ?auto_1597110 ) ( not ( = ?auto_1597110 ?auto_1597111 ) ) ( not ( = ?auto_1597110 ?auto_1597112 ) ) ( not ( = ?auto_1597110 ?auto_1597113 ) ) ( not ( = ?auto_1597110 ?auto_1597117 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597111 ?auto_1597112 ?auto_1597113 )
      ( MAKE-3CRATE-VERIFY ?auto_1597110 ?auto_1597111 ?auto_1597112 ?auto_1597113 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597138 - SURFACE
      ?auto_1597139 - SURFACE
      ?auto_1597140 - SURFACE
      ?auto_1597141 - SURFACE
    )
    :vars
    (
      ?auto_1597146 - HOIST
      ?auto_1597144 - PLACE
      ?auto_1597145 - PLACE
      ?auto_1597142 - HOIST
      ?auto_1597147 - SURFACE
      ?auto_1597143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597146 ?auto_1597144 ) ( SURFACE-AT ?auto_1597140 ?auto_1597144 ) ( CLEAR ?auto_1597140 ) ( IS-CRATE ?auto_1597141 ) ( not ( = ?auto_1597140 ?auto_1597141 ) ) ( AVAILABLE ?auto_1597146 ) ( ON ?auto_1597140 ?auto_1597139 ) ( not ( = ?auto_1597139 ?auto_1597140 ) ) ( not ( = ?auto_1597139 ?auto_1597141 ) ) ( not ( = ?auto_1597145 ?auto_1597144 ) ) ( HOIST-AT ?auto_1597142 ?auto_1597145 ) ( not ( = ?auto_1597146 ?auto_1597142 ) ) ( AVAILABLE ?auto_1597142 ) ( SURFACE-AT ?auto_1597141 ?auto_1597145 ) ( ON ?auto_1597141 ?auto_1597147 ) ( CLEAR ?auto_1597141 ) ( not ( = ?auto_1597140 ?auto_1597147 ) ) ( not ( = ?auto_1597141 ?auto_1597147 ) ) ( not ( = ?auto_1597139 ?auto_1597147 ) ) ( TRUCK-AT ?auto_1597143 ?auto_1597144 ) ( ON ?auto_1597139 ?auto_1597138 ) ( not ( = ?auto_1597138 ?auto_1597139 ) ) ( not ( = ?auto_1597138 ?auto_1597140 ) ) ( not ( = ?auto_1597138 ?auto_1597141 ) ) ( not ( = ?auto_1597138 ?auto_1597147 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597139 ?auto_1597140 ?auto_1597141 )
      ( MAKE-3CRATE-VERIFY ?auto_1597138 ?auto_1597139 ?auto_1597140 ?auto_1597141 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597166 - SURFACE
      ?auto_1597167 - SURFACE
      ?auto_1597168 - SURFACE
      ?auto_1597169 - SURFACE
    )
    :vars
    (
      ?auto_1597174 - HOIST
      ?auto_1597173 - PLACE
      ?auto_1597172 - PLACE
      ?auto_1597170 - HOIST
      ?auto_1597171 - SURFACE
      ?auto_1597175 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597174 ?auto_1597173 ) ( IS-CRATE ?auto_1597169 ) ( not ( = ?auto_1597168 ?auto_1597169 ) ) ( not ( = ?auto_1597167 ?auto_1597168 ) ) ( not ( = ?auto_1597167 ?auto_1597169 ) ) ( not ( = ?auto_1597172 ?auto_1597173 ) ) ( HOIST-AT ?auto_1597170 ?auto_1597172 ) ( not ( = ?auto_1597174 ?auto_1597170 ) ) ( AVAILABLE ?auto_1597170 ) ( SURFACE-AT ?auto_1597169 ?auto_1597172 ) ( ON ?auto_1597169 ?auto_1597171 ) ( CLEAR ?auto_1597169 ) ( not ( = ?auto_1597168 ?auto_1597171 ) ) ( not ( = ?auto_1597169 ?auto_1597171 ) ) ( not ( = ?auto_1597167 ?auto_1597171 ) ) ( TRUCK-AT ?auto_1597175 ?auto_1597173 ) ( SURFACE-AT ?auto_1597167 ?auto_1597173 ) ( CLEAR ?auto_1597167 ) ( LIFTING ?auto_1597174 ?auto_1597168 ) ( IS-CRATE ?auto_1597168 ) ( ON ?auto_1597167 ?auto_1597166 ) ( not ( = ?auto_1597166 ?auto_1597167 ) ) ( not ( = ?auto_1597166 ?auto_1597168 ) ) ( not ( = ?auto_1597166 ?auto_1597169 ) ) ( not ( = ?auto_1597166 ?auto_1597171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597167 ?auto_1597168 ?auto_1597169 )
      ( MAKE-3CRATE-VERIFY ?auto_1597166 ?auto_1597167 ?auto_1597168 ?auto_1597169 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1597194 - SURFACE
      ?auto_1597195 - SURFACE
      ?auto_1597196 - SURFACE
      ?auto_1597197 - SURFACE
    )
    :vars
    (
      ?auto_1597202 - HOIST
      ?auto_1597199 - PLACE
      ?auto_1597201 - PLACE
      ?auto_1597200 - HOIST
      ?auto_1597203 - SURFACE
      ?auto_1597198 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597202 ?auto_1597199 ) ( IS-CRATE ?auto_1597197 ) ( not ( = ?auto_1597196 ?auto_1597197 ) ) ( not ( = ?auto_1597195 ?auto_1597196 ) ) ( not ( = ?auto_1597195 ?auto_1597197 ) ) ( not ( = ?auto_1597201 ?auto_1597199 ) ) ( HOIST-AT ?auto_1597200 ?auto_1597201 ) ( not ( = ?auto_1597202 ?auto_1597200 ) ) ( AVAILABLE ?auto_1597200 ) ( SURFACE-AT ?auto_1597197 ?auto_1597201 ) ( ON ?auto_1597197 ?auto_1597203 ) ( CLEAR ?auto_1597197 ) ( not ( = ?auto_1597196 ?auto_1597203 ) ) ( not ( = ?auto_1597197 ?auto_1597203 ) ) ( not ( = ?auto_1597195 ?auto_1597203 ) ) ( TRUCK-AT ?auto_1597198 ?auto_1597199 ) ( SURFACE-AT ?auto_1597195 ?auto_1597199 ) ( CLEAR ?auto_1597195 ) ( IS-CRATE ?auto_1597196 ) ( AVAILABLE ?auto_1597202 ) ( IN ?auto_1597196 ?auto_1597198 ) ( ON ?auto_1597195 ?auto_1597194 ) ( not ( = ?auto_1597194 ?auto_1597195 ) ) ( not ( = ?auto_1597194 ?auto_1597196 ) ) ( not ( = ?auto_1597194 ?auto_1597197 ) ) ( not ( = ?auto_1597194 ?auto_1597203 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597195 ?auto_1597196 ?auto_1597197 )
      ( MAKE-3CRATE-VERIFY ?auto_1597194 ?auto_1597195 ?auto_1597196 ?auto_1597197 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597485 - SURFACE
      ?auto_1597486 - SURFACE
      ?auto_1597487 - SURFACE
      ?auto_1597488 - SURFACE
      ?auto_1597489 - SURFACE
    )
    :vars
    (
      ?auto_1597491 - HOIST
      ?auto_1597490 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597491 ?auto_1597490 ) ( SURFACE-AT ?auto_1597488 ?auto_1597490 ) ( CLEAR ?auto_1597488 ) ( LIFTING ?auto_1597491 ?auto_1597489 ) ( IS-CRATE ?auto_1597489 ) ( not ( = ?auto_1597488 ?auto_1597489 ) ) ( ON ?auto_1597486 ?auto_1597485 ) ( ON ?auto_1597487 ?auto_1597486 ) ( ON ?auto_1597488 ?auto_1597487 ) ( not ( = ?auto_1597485 ?auto_1597486 ) ) ( not ( = ?auto_1597485 ?auto_1597487 ) ) ( not ( = ?auto_1597485 ?auto_1597488 ) ) ( not ( = ?auto_1597485 ?auto_1597489 ) ) ( not ( = ?auto_1597486 ?auto_1597487 ) ) ( not ( = ?auto_1597486 ?auto_1597488 ) ) ( not ( = ?auto_1597486 ?auto_1597489 ) ) ( not ( = ?auto_1597487 ?auto_1597488 ) ) ( not ( = ?auto_1597487 ?auto_1597489 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1597488 ?auto_1597489 )
      ( MAKE-4CRATE-VERIFY ?auto_1597485 ?auto_1597486 ?auto_1597487 ?auto_1597488 ?auto_1597489 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597510 - SURFACE
      ?auto_1597511 - SURFACE
      ?auto_1597512 - SURFACE
      ?auto_1597513 - SURFACE
      ?auto_1597514 - SURFACE
    )
    :vars
    (
      ?auto_1597515 - HOIST
      ?auto_1597516 - PLACE
      ?auto_1597517 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597515 ?auto_1597516 ) ( SURFACE-AT ?auto_1597513 ?auto_1597516 ) ( CLEAR ?auto_1597513 ) ( IS-CRATE ?auto_1597514 ) ( not ( = ?auto_1597513 ?auto_1597514 ) ) ( TRUCK-AT ?auto_1597517 ?auto_1597516 ) ( AVAILABLE ?auto_1597515 ) ( IN ?auto_1597514 ?auto_1597517 ) ( ON ?auto_1597513 ?auto_1597512 ) ( not ( = ?auto_1597512 ?auto_1597513 ) ) ( not ( = ?auto_1597512 ?auto_1597514 ) ) ( ON ?auto_1597511 ?auto_1597510 ) ( ON ?auto_1597512 ?auto_1597511 ) ( not ( = ?auto_1597510 ?auto_1597511 ) ) ( not ( = ?auto_1597510 ?auto_1597512 ) ) ( not ( = ?auto_1597510 ?auto_1597513 ) ) ( not ( = ?auto_1597510 ?auto_1597514 ) ) ( not ( = ?auto_1597511 ?auto_1597512 ) ) ( not ( = ?auto_1597511 ?auto_1597513 ) ) ( not ( = ?auto_1597511 ?auto_1597514 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597512 ?auto_1597513 ?auto_1597514 )
      ( MAKE-4CRATE-VERIFY ?auto_1597510 ?auto_1597511 ?auto_1597512 ?auto_1597513 ?auto_1597514 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597540 - SURFACE
      ?auto_1597541 - SURFACE
      ?auto_1597542 - SURFACE
      ?auto_1597543 - SURFACE
      ?auto_1597544 - SURFACE
    )
    :vars
    (
      ?auto_1597546 - HOIST
      ?auto_1597547 - PLACE
      ?auto_1597548 - TRUCK
      ?auto_1597545 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597546 ?auto_1597547 ) ( SURFACE-AT ?auto_1597543 ?auto_1597547 ) ( CLEAR ?auto_1597543 ) ( IS-CRATE ?auto_1597544 ) ( not ( = ?auto_1597543 ?auto_1597544 ) ) ( AVAILABLE ?auto_1597546 ) ( IN ?auto_1597544 ?auto_1597548 ) ( ON ?auto_1597543 ?auto_1597542 ) ( not ( = ?auto_1597542 ?auto_1597543 ) ) ( not ( = ?auto_1597542 ?auto_1597544 ) ) ( TRUCK-AT ?auto_1597548 ?auto_1597545 ) ( not ( = ?auto_1597545 ?auto_1597547 ) ) ( ON ?auto_1597541 ?auto_1597540 ) ( ON ?auto_1597542 ?auto_1597541 ) ( not ( = ?auto_1597540 ?auto_1597541 ) ) ( not ( = ?auto_1597540 ?auto_1597542 ) ) ( not ( = ?auto_1597540 ?auto_1597543 ) ) ( not ( = ?auto_1597540 ?auto_1597544 ) ) ( not ( = ?auto_1597541 ?auto_1597542 ) ) ( not ( = ?auto_1597541 ?auto_1597543 ) ) ( not ( = ?auto_1597541 ?auto_1597544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597542 ?auto_1597543 ?auto_1597544 )
      ( MAKE-4CRATE-VERIFY ?auto_1597540 ?auto_1597541 ?auto_1597542 ?auto_1597543 ?auto_1597544 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597574 - SURFACE
      ?auto_1597575 - SURFACE
      ?auto_1597576 - SURFACE
      ?auto_1597577 - SURFACE
      ?auto_1597578 - SURFACE
    )
    :vars
    (
      ?auto_1597579 - HOIST
      ?auto_1597581 - PLACE
      ?auto_1597583 - TRUCK
      ?auto_1597580 - PLACE
      ?auto_1597582 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597579 ?auto_1597581 ) ( SURFACE-AT ?auto_1597577 ?auto_1597581 ) ( CLEAR ?auto_1597577 ) ( IS-CRATE ?auto_1597578 ) ( not ( = ?auto_1597577 ?auto_1597578 ) ) ( AVAILABLE ?auto_1597579 ) ( ON ?auto_1597577 ?auto_1597576 ) ( not ( = ?auto_1597576 ?auto_1597577 ) ) ( not ( = ?auto_1597576 ?auto_1597578 ) ) ( TRUCK-AT ?auto_1597583 ?auto_1597580 ) ( not ( = ?auto_1597580 ?auto_1597581 ) ) ( HOIST-AT ?auto_1597582 ?auto_1597580 ) ( LIFTING ?auto_1597582 ?auto_1597578 ) ( not ( = ?auto_1597579 ?auto_1597582 ) ) ( ON ?auto_1597575 ?auto_1597574 ) ( ON ?auto_1597576 ?auto_1597575 ) ( not ( = ?auto_1597574 ?auto_1597575 ) ) ( not ( = ?auto_1597574 ?auto_1597576 ) ) ( not ( = ?auto_1597574 ?auto_1597577 ) ) ( not ( = ?auto_1597574 ?auto_1597578 ) ) ( not ( = ?auto_1597575 ?auto_1597576 ) ) ( not ( = ?auto_1597575 ?auto_1597577 ) ) ( not ( = ?auto_1597575 ?auto_1597578 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597576 ?auto_1597577 ?auto_1597578 )
      ( MAKE-4CRATE-VERIFY ?auto_1597574 ?auto_1597575 ?auto_1597576 ?auto_1597577 ?auto_1597578 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597612 - SURFACE
      ?auto_1597613 - SURFACE
      ?auto_1597614 - SURFACE
      ?auto_1597615 - SURFACE
      ?auto_1597616 - SURFACE
    )
    :vars
    (
      ?auto_1597619 - HOIST
      ?auto_1597622 - PLACE
      ?auto_1597621 - TRUCK
      ?auto_1597620 - PLACE
      ?auto_1597617 - HOIST
      ?auto_1597618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597619 ?auto_1597622 ) ( SURFACE-AT ?auto_1597615 ?auto_1597622 ) ( CLEAR ?auto_1597615 ) ( IS-CRATE ?auto_1597616 ) ( not ( = ?auto_1597615 ?auto_1597616 ) ) ( AVAILABLE ?auto_1597619 ) ( ON ?auto_1597615 ?auto_1597614 ) ( not ( = ?auto_1597614 ?auto_1597615 ) ) ( not ( = ?auto_1597614 ?auto_1597616 ) ) ( TRUCK-AT ?auto_1597621 ?auto_1597620 ) ( not ( = ?auto_1597620 ?auto_1597622 ) ) ( HOIST-AT ?auto_1597617 ?auto_1597620 ) ( not ( = ?auto_1597619 ?auto_1597617 ) ) ( AVAILABLE ?auto_1597617 ) ( SURFACE-AT ?auto_1597616 ?auto_1597620 ) ( ON ?auto_1597616 ?auto_1597618 ) ( CLEAR ?auto_1597616 ) ( not ( = ?auto_1597615 ?auto_1597618 ) ) ( not ( = ?auto_1597616 ?auto_1597618 ) ) ( not ( = ?auto_1597614 ?auto_1597618 ) ) ( ON ?auto_1597613 ?auto_1597612 ) ( ON ?auto_1597614 ?auto_1597613 ) ( not ( = ?auto_1597612 ?auto_1597613 ) ) ( not ( = ?auto_1597612 ?auto_1597614 ) ) ( not ( = ?auto_1597612 ?auto_1597615 ) ) ( not ( = ?auto_1597612 ?auto_1597616 ) ) ( not ( = ?auto_1597612 ?auto_1597618 ) ) ( not ( = ?auto_1597613 ?auto_1597614 ) ) ( not ( = ?auto_1597613 ?auto_1597615 ) ) ( not ( = ?auto_1597613 ?auto_1597616 ) ) ( not ( = ?auto_1597613 ?auto_1597618 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597614 ?auto_1597615 ?auto_1597616 )
      ( MAKE-4CRATE-VERIFY ?auto_1597612 ?auto_1597613 ?auto_1597614 ?auto_1597615 ?auto_1597616 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597651 - SURFACE
      ?auto_1597652 - SURFACE
      ?auto_1597653 - SURFACE
      ?auto_1597654 - SURFACE
      ?auto_1597655 - SURFACE
    )
    :vars
    (
      ?auto_1597658 - HOIST
      ?auto_1597661 - PLACE
      ?auto_1597656 - PLACE
      ?auto_1597659 - HOIST
      ?auto_1597660 - SURFACE
      ?auto_1597657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597658 ?auto_1597661 ) ( SURFACE-AT ?auto_1597654 ?auto_1597661 ) ( CLEAR ?auto_1597654 ) ( IS-CRATE ?auto_1597655 ) ( not ( = ?auto_1597654 ?auto_1597655 ) ) ( AVAILABLE ?auto_1597658 ) ( ON ?auto_1597654 ?auto_1597653 ) ( not ( = ?auto_1597653 ?auto_1597654 ) ) ( not ( = ?auto_1597653 ?auto_1597655 ) ) ( not ( = ?auto_1597656 ?auto_1597661 ) ) ( HOIST-AT ?auto_1597659 ?auto_1597656 ) ( not ( = ?auto_1597658 ?auto_1597659 ) ) ( AVAILABLE ?auto_1597659 ) ( SURFACE-AT ?auto_1597655 ?auto_1597656 ) ( ON ?auto_1597655 ?auto_1597660 ) ( CLEAR ?auto_1597655 ) ( not ( = ?auto_1597654 ?auto_1597660 ) ) ( not ( = ?auto_1597655 ?auto_1597660 ) ) ( not ( = ?auto_1597653 ?auto_1597660 ) ) ( TRUCK-AT ?auto_1597657 ?auto_1597661 ) ( ON ?auto_1597652 ?auto_1597651 ) ( ON ?auto_1597653 ?auto_1597652 ) ( not ( = ?auto_1597651 ?auto_1597652 ) ) ( not ( = ?auto_1597651 ?auto_1597653 ) ) ( not ( = ?auto_1597651 ?auto_1597654 ) ) ( not ( = ?auto_1597651 ?auto_1597655 ) ) ( not ( = ?auto_1597651 ?auto_1597660 ) ) ( not ( = ?auto_1597652 ?auto_1597653 ) ) ( not ( = ?auto_1597652 ?auto_1597654 ) ) ( not ( = ?auto_1597652 ?auto_1597655 ) ) ( not ( = ?auto_1597652 ?auto_1597660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597653 ?auto_1597654 ?auto_1597655 )
      ( MAKE-4CRATE-VERIFY ?auto_1597651 ?auto_1597652 ?auto_1597653 ?auto_1597654 ?auto_1597655 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597690 - SURFACE
      ?auto_1597691 - SURFACE
      ?auto_1597692 - SURFACE
      ?auto_1597693 - SURFACE
      ?auto_1597694 - SURFACE
    )
    :vars
    (
      ?auto_1597700 - HOIST
      ?auto_1597697 - PLACE
      ?auto_1597695 - PLACE
      ?auto_1597698 - HOIST
      ?auto_1597696 - SURFACE
      ?auto_1597699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597700 ?auto_1597697 ) ( IS-CRATE ?auto_1597694 ) ( not ( = ?auto_1597693 ?auto_1597694 ) ) ( not ( = ?auto_1597692 ?auto_1597693 ) ) ( not ( = ?auto_1597692 ?auto_1597694 ) ) ( not ( = ?auto_1597695 ?auto_1597697 ) ) ( HOIST-AT ?auto_1597698 ?auto_1597695 ) ( not ( = ?auto_1597700 ?auto_1597698 ) ) ( AVAILABLE ?auto_1597698 ) ( SURFACE-AT ?auto_1597694 ?auto_1597695 ) ( ON ?auto_1597694 ?auto_1597696 ) ( CLEAR ?auto_1597694 ) ( not ( = ?auto_1597693 ?auto_1597696 ) ) ( not ( = ?auto_1597694 ?auto_1597696 ) ) ( not ( = ?auto_1597692 ?auto_1597696 ) ) ( TRUCK-AT ?auto_1597699 ?auto_1597697 ) ( SURFACE-AT ?auto_1597692 ?auto_1597697 ) ( CLEAR ?auto_1597692 ) ( LIFTING ?auto_1597700 ?auto_1597693 ) ( IS-CRATE ?auto_1597693 ) ( ON ?auto_1597691 ?auto_1597690 ) ( ON ?auto_1597692 ?auto_1597691 ) ( not ( = ?auto_1597690 ?auto_1597691 ) ) ( not ( = ?auto_1597690 ?auto_1597692 ) ) ( not ( = ?auto_1597690 ?auto_1597693 ) ) ( not ( = ?auto_1597690 ?auto_1597694 ) ) ( not ( = ?auto_1597690 ?auto_1597696 ) ) ( not ( = ?auto_1597691 ?auto_1597692 ) ) ( not ( = ?auto_1597691 ?auto_1597693 ) ) ( not ( = ?auto_1597691 ?auto_1597694 ) ) ( not ( = ?auto_1597691 ?auto_1597696 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597692 ?auto_1597693 ?auto_1597694 )
      ( MAKE-4CRATE-VERIFY ?auto_1597690 ?auto_1597691 ?auto_1597692 ?auto_1597693 ?auto_1597694 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1597729 - SURFACE
      ?auto_1597730 - SURFACE
      ?auto_1597731 - SURFACE
      ?auto_1597732 - SURFACE
      ?auto_1597733 - SURFACE
    )
    :vars
    (
      ?auto_1597737 - HOIST
      ?auto_1597734 - PLACE
      ?auto_1597735 - PLACE
      ?auto_1597739 - HOIST
      ?auto_1597736 - SURFACE
      ?auto_1597738 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1597737 ?auto_1597734 ) ( IS-CRATE ?auto_1597733 ) ( not ( = ?auto_1597732 ?auto_1597733 ) ) ( not ( = ?auto_1597731 ?auto_1597732 ) ) ( not ( = ?auto_1597731 ?auto_1597733 ) ) ( not ( = ?auto_1597735 ?auto_1597734 ) ) ( HOIST-AT ?auto_1597739 ?auto_1597735 ) ( not ( = ?auto_1597737 ?auto_1597739 ) ) ( AVAILABLE ?auto_1597739 ) ( SURFACE-AT ?auto_1597733 ?auto_1597735 ) ( ON ?auto_1597733 ?auto_1597736 ) ( CLEAR ?auto_1597733 ) ( not ( = ?auto_1597732 ?auto_1597736 ) ) ( not ( = ?auto_1597733 ?auto_1597736 ) ) ( not ( = ?auto_1597731 ?auto_1597736 ) ) ( TRUCK-AT ?auto_1597738 ?auto_1597734 ) ( SURFACE-AT ?auto_1597731 ?auto_1597734 ) ( CLEAR ?auto_1597731 ) ( IS-CRATE ?auto_1597732 ) ( AVAILABLE ?auto_1597737 ) ( IN ?auto_1597732 ?auto_1597738 ) ( ON ?auto_1597730 ?auto_1597729 ) ( ON ?auto_1597731 ?auto_1597730 ) ( not ( = ?auto_1597729 ?auto_1597730 ) ) ( not ( = ?auto_1597729 ?auto_1597731 ) ) ( not ( = ?auto_1597729 ?auto_1597732 ) ) ( not ( = ?auto_1597729 ?auto_1597733 ) ) ( not ( = ?auto_1597729 ?auto_1597736 ) ) ( not ( = ?auto_1597730 ?auto_1597731 ) ) ( not ( = ?auto_1597730 ?auto_1597732 ) ) ( not ( = ?auto_1597730 ?auto_1597733 ) ) ( not ( = ?auto_1597730 ?auto_1597736 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1597731 ?auto_1597732 ?auto_1597733 )
      ( MAKE-4CRATE-VERIFY ?auto_1597729 ?auto_1597730 ?auto_1597731 ?auto_1597732 ?auto_1597733 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598389 - SURFACE
      ?auto_1598390 - SURFACE
      ?auto_1598391 - SURFACE
      ?auto_1598392 - SURFACE
      ?auto_1598393 - SURFACE
      ?auto_1598394 - SURFACE
    )
    :vars
    (
      ?auto_1598396 - HOIST
      ?auto_1598395 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598396 ?auto_1598395 ) ( SURFACE-AT ?auto_1598393 ?auto_1598395 ) ( CLEAR ?auto_1598393 ) ( LIFTING ?auto_1598396 ?auto_1598394 ) ( IS-CRATE ?auto_1598394 ) ( not ( = ?auto_1598393 ?auto_1598394 ) ) ( ON ?auto_1598390 ?auto_1598389 ) ( ON ?auto_1598391 ?auto_1598390 ) ( ON ?auto_1598392 ?auto_1598391 ) ( ON ?auto_1598393 ?auto_1598392 ) ( not ( = ?auto_1598389 ?auto_1598390 ) ) ( not ( = ?auto_1598389 ?auto_1598391 ) ) ( not ( = ?auto_1598389 ?auto_1598392 ) ) ( not ( = ?auto_1598389 ?auto_1598393 ) ) ( not ( = ?auto_1598389 ?auto_1598394 ) ) ( not ( = ?auto_1598390 ?auto_1598391 ) ) ( not ( = ?auto_1598390 ?auto_1598392 ) ) ( not ( = ?auto_1598390 ?auto_1598393 ) ) ( not ( = ?auto_1598390 ?auto_1598394 ) ) ( not ( = ?auto_1598391 ?auto_1598392 ) ) ( not ( = ?auto_1598391 ?auto_1598393 ) ) ( not ( = ?auto_1598391 ?auto_1598394 ) ) ( not ( = ?auto_1598392 ?auto_1598393 ) ) ( not ( = ?auto_1598392 ?auto_1598394 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1598393 ?auto_1598394 )
      ( MAKE-5CRATE-VERIFY ?auto_1598389 ?auto_1598390 ?auto_1598391 ?auto_1598392 ?auto_1598393 ?auto_1598394 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598423 - SURFACE
      ?auto_1598424 - SURFACE
      ?auto_1598425 - SURFACE
      ?auto_1598426 - SURFACE
      ?auto_1598427 - SURFACE
      ?auto_1598428 - SURFACE
    )
    :vars
    (
      ?auto_1598430 - HOIST
      ?auto_1598431 - PLACE
      ?auto_1598429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598430 ?auto_1598431 ) ( SURFACE-AT ?auto_1598427 ?auto_1598431 ) ( CLEAR ?auto_1598427 ) ( IS-CRATE ?auto_1598428 ) ( not ( = ?auto_1598427 ?auto_1598428 ) ) ( TRUCK-AT ?auto_1598429 ?auto_1598431 ) ( AVAILABLE ?auto_1598430 ) ( IN ?auto_1598428 ?auto_1598429 ) ( ON ?auto_1598427 ?auto_1598426 ) ( not ( = ?auto_1598426 ?auto_1598427 ) ) ( not ( = ?auto_1598426 ?auto_1598428 ) ) ( ON ?auto_1598424 ?auto_1598423 ) ( ON ?auto_1598425 ?auto_1598424 ) ( ON ?auto_1598426 ?auto_1598425 ) ( not ( = ?auto_1598423 ?auto_1598424 ) ) ( not ( = ?auto_1598423 ?auto_1598425 ) ) ( not ( = ?auto_1598423 ?auto_1598426 ) ) ( not ( = ?auto_1598423 ?auto_1598427 ) ) ( not ( = ?auto_1598423 ?auto_1598428 ) ) ( not ( = ?auto_1598424 ?auto_1598425 ) ) ( not ( = ?auto_1598424 ?auto_1598426 ) ) ( not ( = ?auto_1598424 ?auto_1598427 ) ) ( not ( = ?auto_1598424 ?auto_1598428 ) ) ( not ( = ?auto_1598425 ?auto_1598426 ) ) ( not ( = ?auto_1598425 ?auto_1598427 ) ) ( not ( = ?auto_1598425 ?auto_1598428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598426 ?auto_1598427 ?auto_1598428 )
      ( MAKE-5CRATE-VERIFY ?auto_1598423 ?auto_1598424 ?auto_1598425 ?auto_1598426 ?auto_1598427 ?auto_1598428 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598463 - SURFACE
      ?auto_1598464 - SURFACE
      ?auto_1598465 - SURFACE
      ?auto_1598466 - SURFACE
      ?auto_1598467 - SURFACE
      ?auto_1598468 - SURFACE
    )
    :vars
    (
      ?auto_1598470 - HOIST
      ?auto_1598471 - PLACE
      ?auto_1598469 - TRUCK
      ?auto_1598472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598470 ?auto_1598471 ) ( SURFACE-AT ?auto_1598467 ?auto_1598471 ) ( CLEAR ?auto_1598467 ) ( IS-CRATE ?auto_1598468 ) ( not ( = ?auto_1598467 ?auto_1598468 ) ) ( AVAILABLE ?auto_1598470 ) ( IN ?auto_1598468 ?auto_1598469 ) ( ON ?auto_1598467 ?auto_1598466 ) ( not ( = ?auto_1598466 ?auto_1598467 ) ) ( not ( = ?auto_1598466 ?auto_1598468 ) ) ( TRUCK-AT ?auto_1598469 ?auto_1598472 ) ( not ( = ?auto_1598472 ?auto_1598471 ) ) ( ON ?auto_1598464 ?auto_1598463 ) ( ON ?auto_1598465 ?auto_1598464 ) ( ON ?auto_1598466 ?auto_1598465 ) ( not ( = ?auto_1598463 ?auto_1598464 ) ) ( not ( = ?auto_1598463 ?auto_1598465 ) ) ( not ( = ?auto_1598463 ?auto_1598466 ) ) ( not ( = ?auto_1598463 ?auto_1598467 ) ) ( not ( = ?auto_1598463 ?auto_1598468 ) ) ( not ( = ?auto_1598464 ?auto_1598465 ) ) ( not ( = ?auto_1598464 ?auto_1598466 ) ) ( not ( = ?auto_1598464 ?auto_1598467 ) ) ( not ( = ?auto_1598464 ?auto_1598468 ) ) ( not ( = ?auto_1598465 ?auto_1598466 ) ) ( not ( = ?auto_1598465 ?auto_1598467 ) ) ( not ( = ?auto_1598465 ?auto_1598468 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598466 ?auto_1598467 ?auto_1598468 )
      ( MAKE-5CRATE-VERIFY ?auto_1598463 ?auto_1598464 ?auto_1598465 ?auto_1598466 ?auto_1598467 ?auto_1598468 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598508 - SURFACE
      ?auto_1598509 - SURFACE
      ?auto_1598510 - SURFACE
      ?auto_1598511 - SURFACE
      ?auto_1598512 - SURFACE
      ?auto_1598513 - SURFACE
    )
    :vars
    (
      ?auto_1598516 - HOIST
      ?auto_1598515 - PLACE
      ?auto_1598517 - TRUCK
      ?auto_1598518 - PLACE
      ?auto_1598514 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598516 ?auto_1598515 ) ( SURFACE-AT ?auto_1598512 ?auto_1598515 ) ( CLEAR ?auto_1598512 ) ( IS-CRATE ?auto_1598513 ) ( not ( = ?auto_1598512 ?auto_1598513 ) ) ( AVAILABLE ?auto_1598516 ) ( ON ?auto_1598512 ?auto_1598511 ) ( not ( = ?auto_1598511 ?auto_1598512 ) ) ( not ( = ?auto_1598511 ?auto_1598513 ) ) ( TRUCK-AT ?auto_1598517 ?auto_1598518 ) ( not ( = ?auto_1598518 ?auto_1598515 ) ) ( HOIST-AT ?auto_1598514 ?auto_1598518 ) ( LIFTING ?auto_1598514 ?auto_1598513 ) ( not ( = ?auto_1598516 ?auto_1598514 ) ) ( ON ?auto_1598509 ?auto_1598508 ) ( ON ?auto_1598510 ?auto_1598509 ) ( ON ?auto_1598511 ?auto_1598510 ) ( not ( = ?auto_1598508 ?auto_1598509 ) ) ( not ( = ?auto_1598508 ?auto_1598510 ) ) ( not ( = ?auto_1598508 ?auto_1598511 ) ) ( not ( = ?auto_1598508 ?auto_1598512 ) ) ( not ( = ?auto_1598508 ?auto_1598513 ) ) ( not ( = ?auto_1598509 ?auto_1598510 ) ) ( not ( = ?auto_1598509 ?auto_1598511 ) ) ( not ( = ?auto_1598509 ?auto_1598512 ) ) ( not ( = ?auto_1598509 ?auto_1598513 ) ) ( not ( = ?auto_1598510 ?auto_1598511 ) ) ( not ( = ?auto_1598510 ?auto_1598512 ) ) ( not ( = ?auto_1598510 ?auto_1598513 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598511 ?auto_1598512 ?auto_1598513 )
      ( MAKE-5CRATE-VERIFY ?auto_1598508 ?auto_1598509 ?auto_1598510 ?auto_1598511 ?auto_1598512 ?auto_1598513 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598558 - SURFACE
      ?auto_1598559 - SURFACE
      ?auto_1598560 - SURFACE
      ?auto_1598561 - SURFACE
      ?auto_1598562 - SURFACE
      ?auto_1598563 - SURFACE
    )
    :vars
    (
      ?auto_1598569 - HOIST
      ?auto_1598565 - PLACE
      ?auto_1598568 - TRUCK
      ?auto_1598564 - PLACE
      ?auto_1598567 - HOIST
      ?auto_1598566 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598569 ?auto_1598565 ) ( SURFACE-AT ?auto_1598562 ?auto_1598565 ) ( CLEAR ?auto_1598562 ) ( IS-CRATE ?auto_1598563 ) ( not ( = ?auto_1598562 ?auto_1598563 ) ) ( AVAILABLE ?auto_1598569 ) ( ON ?auto_1598562 ?auto_1598561 ) ( not ( = ?auto_1598561 ?auto_1598562 ) ) ( not ( = ?auto_1598561 ?auto_1598563 ) ) ( TRUCK-AT ?auto_1598568 ?auto_1598564 ) ( not ( = ?auto_1598564 ?auto_1598565 ) ) ( HOIST-AT ?auto_1598567 ?auto_1598564 ) ( not ( = ?auto_1598569 ?auto_1598567 ) ) ( AVAILABLE ?auto_1598567 ) ( SURFACE-AT ?auto_1598563 ?auto_1598564 ) ( ON ?auto_1598563 ?auto_1598566 ) ( CLEAR ?auto_1598563 ) ( not ( = ?auto_1598562 ?auto_1598566 ) ) ( not ( = ?auto_1598563 ?auto_1598566 ) ) ( not ( = ?auto_1598561 ?auto_1598566 ) ) ( ON ?auto_1598559 ?auto_1598558 ) ( ON ?auto_1598560 ?auto_1598559 ) ( ON ?auto_1598561 ?auto_1598560 ) ( not ( = ?auto_1598558 ?auto_1598559 ) ) ( not ( = ?auto_1598558 ?auto_1598560 ) ) ( not ( = ?auto_1598558 ?auto_1598561 ) ) ( not ( = ?auto_1598558 ?auto_1598562 ) ) ( not ( = ?auto_1598558 ?auto_1598563 ) ) ( not ( = ?auto_1598558 ?auto_1598566 ) ) ( not ( = ?auto_1598559 ?auto_1598560 ) ) ( not ( = ?auto_1598559 ?auto_1598561 ) ) ( not ( = ?auto_1598559 ?auto_1598562 ) ) ( not ( = ?auto_1598559 ?auto_1598563 ) ) ( not ( = ?auto_1598559 ?auto_1598566 ) ) ( not ( = ?auto_1598560 ?auto_1598561 ) ) ( not ( = ?auto_1598560 ?auto_1598562 ) ) ( not ( = ?auto_1598560 ?auto_1598563 ) ) ( not ( = ?auto_1598560 ?auto_1598566 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598561 ?auto_1598562 ?auto_1598563 )
      ( MAKE-5CRATE-VERIFY ?auto_1598558 ?auto_1598559 ?auto_1598560 ?auto_1598561 ?auto_1598562 ?auto_1598563 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598609 - SURFACE
      ?auto_1598610 - SURFACE
      ?auto_1598611 - SURFACE
      ?auto_1598612 - SURFACE
      ?auto_1598613 - SURFACE
      ?auto_1598614 - SURFACE
    )
    :vars
    (
      ?auto_1598618 - HOIST
      ?auto_1598617 - PLACE
      ?auto_1598615 - PLACE
      ?auto_1598620 - HOIST
      ?auto_1598619 - SURFACE
      ?auto_1598616 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598618 ?auto_1598617 ) ( SURFACE-AT ?auto_1598613 ?auto_1598617 ) ( CLEAR ?auto_1598613 ) ( IS-CRATE ?auto_1598614 ) ( not ( = ?auto_1598613 ?auto_1598614 ) ) ( AVAILABLE ?auto_1598618 ) ( ON ?auto_1598613 ?auto_1598612 ) ( not ( = ?auto_1598612 ?auto_1598613 ) ) ( not ( = ?auto_1598612 ?auto_1598614 ) ) ( not ( = ?auto_1598615 ?auto_1598617 ) ) ( HOIST-AT ?auto_1598620 ?auto_1598615 ) ( not ( = ?auto_1598618 ?auto_1598620 ) ) ( AVAILABLE ?auto_1598620 ) ( SURFACE-AT ?auto_1598614 ?auto_1598615 ) ( ON ?auto_1598614 ?auto_1598619 ) ( CLEAR ?auto_1598614 ) ( not ( = ?auto_1598613 ?auto_1598619 ) ) ( not ( = ?auto_1598614 ?auto_1598619 ) ) ( not ( = ?auto_1598612 ?auto_1598619 ) ) ( TRUCK-AT ?auto_1598616 ?auto_1598617 ) ( ON ?auto_1598610 ?auto_1598609 ) ( ON ?auto_1598611 ?auto_1598610 ) ( ON ?auto_1598612 ?auto_1598611 ) ( not ( = ?auto_1598609 ?auto_1598610 ) ) ( not ( = ?auto_1598609 ?auto_1598611 ) ) ( not ( = ?auto_1598609 ?auto_1598612 ) ) ( not ( = ?auto_1598609 ?auto_1598613 ) ) ( not ( = ?auto_1598609 ?auto_1598614 ) ) ( not ( = ?auto_1598609 ?auto_1598619 ) ) ( not ( = ?auto_1598610 ?auto_1598611 ) ) ( not ( = ?auto_1598610 ?auto_1598612 ) ) ( not ( = ?auto_1598610 ?auto_1598613 ) ) ( not ( = ?auto_1598610 ?auto_1598614 ) ) ( not ( = ?auto_1598610 ?auto_1598619 ) ) ( not ( = ?auto_1598611 ?auto_1598612 ) ) ( not ( = ?auto_1598611 ?auto_1598613 ) ) ( not ( = ?auto_1598611 ?auto_1598614 ) ) ( not ( = ?auto_1598611 ?auto_1598619 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598612 ?auto_1598613 ?auto_1598614 )
      ( MAKE-5CRATE-VERIFY ?auto_1598609 ?auto_1598610 ?auto_1598611 ?auto_1598612 ?auto_1598613 ?auto_1598614 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598660 - SURFACE
      ?auto_1598661 - SURFACE
      ?auto_1598662 - SURFACE
      ?auto_1598663 - SURFACE
      ?auto_1598664 - SURFACE
      ?auto_1598665 - SURFACE
    )
    :vars
    (
      ?auto_1598670 - HOIST
      ?auto_1598671 - PLACE
      ?auto_1598668 - PLACE
      ?auto_1598666 - HOIST
      ?auto_1598669 - SURFACE
      ?auto_1598667 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598670 ?auto_1598671 ) ( IS-CRATE ?auto_1598665 ) ( not ( = ?auto_1598664 ?auto_1598665 ) ) ( not ( = ?auto_1598663 ?auto_1598664 ) ) ( not ( = ?auto_1598663 ?auto_1598665 ) ) ( not ( = ?auto_1598668 ?auto_1598671 ) ) ( HOIST-AT ?auto_1598666 ?auto_1598668 ) ( not ( = ?auto_1598670 ?auto_1598666 ) ) ( AVAILABLE ?auto_1598666 ) ( SURFACE-AT ?auto_1598665 ?auto_1598668 ) ( ON ?auto_1598665 ?auto_1598669 ) ( CLEAR ?auto_1598665 ) ( not ( = ?auto_1598664 ?auto_1598669 ) ) ( not ( = ?auto_1598665 ?auto_1598669 ) ) ( not ( = ?auto_1598663 ?auto_1598669 ) ) ( TRUCK-AT ?auto_1598667 ?auto_1598671 ) ( SURFACE-AT ?auto_1598663 ?auto_1598671 ) ( CLEAR ?auto_1598663 ) ( LIFTING ?auto_1598670 ?auto_1598664 ) ( IS-CRATE ?auto_1598664 ) ( ON ?auto_1598661 ?auto_1598660 ) ( ON ?auto_1598662 ?auto_1598661 ) ( ON ?auto_1598663 ?auto_1598662 ) ( not ( = ?auto_1598660 ?auto_1598661 ) ) ( not ( = ?auto_1598660 ?auto_1598662 ) ) ( not ( = ?auto_1598660 ?auto_1598663 ) ) ( not ( = ?auto_1598660 ?auto_1598664 ) ) ( not ( = ?auto_1598660 ?auto_1598665 ) ) ( not ( = ?auto_1598660 ?auto_1598669 ) ) ( not ( = ?auto_1598661 ?auto_1598662 ) ) ( not ( = ?auto_1598661 ?auto_1598663 ) ) ( not ( = ?auto_1598661 ?auto_1598664 ) ) ( not ( = ?auto_1598661 ?auto_1598665 ) ) ( not ( = ?auto_1598661 ?auto_1598669 ) ) ( not ( = ?auto_1598662 ?auto_1598663 ) ) ( not ( = ?auto_1598662 ?auto_1598664 ) ) ( not ( = ?auto_1598662 ?auto_1598665 ) ) ( not ( = ?auto_1598662 ?auto_1598669 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598663 ?auto_1598664 ?auto_1598665 )
      ( MAKE-5CRATE-VERIFY ?auto_1598660 ?auto_1598661 ?auto_1598662 ?auto_1598663 ?auto_1598664 ?auto_1598665 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1598711 - SURFACE
      ?auto_1598712 - SURFACE
      ?auto_1598713 - SURFACE
      ?auto_1598714 - SURFACE
      ?auto_1598715 - SURFACE
      ?auto_1598716 - SURFACE
    )
    :vars
    (
      ?auto_1598719 - HOIST
      ?auto_1598720 - PLACE
      ?auto_1598718 - PLACE
      ?auto_1598721 - HOIST
      ?auto_1598717 - SURFACE
      ?auto_1598722 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1598719 ?auto_1598720 ) ( IS-CRATE ?auto_1598716 ) ( not ( = ?auto_1598715 ?auto_1598716 ) ) ( not ( = ?auto_1598714 ?auto_1598715 ) ) ( not ( = ?auto_1598714 ?auto_1598716 ) ) ( not ( = ?auto_1598718 ?auto_1598720 ) ) ( HOIST-AT ?auto_1598721 ?auto_1598718 ) ( not ( = ?auto_1598719 ?auto_1598721 ) ) ( AVAILABLE ?auto_1598721 ) ( SURFACE-AT ?auto_1598716 ?auto_1598718 ) ( ON ?auto_1598716 ?auto_1598717 ) ( CLEAR ?auto_1598716 ) ( not ( = ?auto_1598715 ?auto_1598717 ) ) ( not ( = ?auto_1598716 ?auto_1598717 ) ) ( not ( = ?auto_1598714 ?auto_1598717 ) ) ( TRUCK-AT ?auto_1598722 ?auto_1598720 ) ( SURFACE-AT ?auto_1598714 ?auto_1598720 ) ( CLEAR ?auto_1598714 ) ( IS-CRATE ?auto_1598715 ) ( AVAILABLE ?auto_1598719 ) ( IN ?auto_1598715 ?auto_1598722 ) ( ON ?auto_1598712 ?auto_1598711 ) ( ON ?auto_1598713 ?auto_1598712 ) ( ON ?auto_1598714 ?auto_1598713 ) ( not ( = ?auto_1598711 ?auto_1598712 ) ) ( not ( = ?auto_1598711 ?auto_1598713 ) ) ( not ( = ?auto_1598711 ?auto_1598714 ) ) ( not ( = ?auto_1598711 ?auto_1598715 ) ) ( not ( = ?auto_1598711 ?auto_1598716 ) ) ( not ( = ?auto_1598711 ?auto_1598717 ) ) ( not ( = ?auto_1598712 ?auto_1598713 ) ) ( not ( = ?auto_1598712 ?auto_1598714 ) ) ( not ( = ?auto_1598712 ?auto_1598715 ) ) ( not ( = ?auto_1598712 ?auto_1598716 ) ) ( not ( = ?auto_1598712 ?auto_1598717 ) ) ( not ( = ?auto_1598713 ?auto_1598714 ) ) ( not ( = ?auto_1598713 ?auto_1598715 ) ) ( not ( = ?auto_1598713 ?auto_1598716 ) ) ( not ( = ?auto_1598713 ?auto_1598717 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1598714 ?auto_1598715 ?auto_1598716 )
      ( MAKE-5CRATE-VERIFY ?auto_1598711 ?auto_1598712 ?auto_1598713 ?auto_1598714 ?auto_1598715 ?auto_1598716 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599920 - SURFACE
      ?auto_1599921 - SURFACE
      ?auto_1599922 - SURFACE
      ?auto_1599923 - SURFACE
      ?auto_1599924 - SURFACE
      ?auto_1599925 - SURFACE
      ?auto_1599926 - SURFACE
    )
    :vars
    (
      ?auto_1599927 - HOIST
      ?auto_1599928 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599927 ?auto_1599928 ) ( SURFACE-AT ?auto_1599925 ?auto_1599928 ) ( CLEAR ?auto_1599925 ) ( LIFTING ?auto_1599927 ?auto_1599926 ) ( IS-CRATE ?auto_1599926 ) ( not ( = ?auto_1599925 ?auto_1599926 ) ) ( ON ?auto_1599921 ?auto_1599920 ) ( ON ?auto_1599922 ?auto_1599921 ) ( ON ?auto_1599923 ?auto_1599922 ) ( ON ?auto_1599924 ?auto_1599923 ) ( ON ?auto_1599925 ?auto_1599924 ) ( not ( = ?auto_1599920 ?auto_1599921 ) ) ( not ( = ?auto_1599920 ?auto_1599922 ) ) ( not ( = ?auto_1599920 ?auto_1599923 ) ) ( not ( = ?auto_1599920 ?auto_1599924 ) ) ( not ( = ?auto_1599920 ?auto_1599925 ) ) ( not ( = ?auto_1599920 ?auto_1599926 ) ) ( not ( = ?auto_1599921 ?auto_1599922 ) ) ( not ( = ?auto_1599921 ?auto_1599923 ) ) ( not ( = ?auto_1599921 ?auto_1599924 ) ) ( not ( = ?auto_1599921 ?auto_1599925 ) ) ( not ( = ?auto_1599921 ?auto_1599926 ) ) ( not ( = ?auto_1599922 ?auto_1599923 ) ) ( not ( = ?auto_1599922 ?auto_1599924 ) ) ( not ( = ?auto_1599922 ?auto_1599925 ) ) ( not ( = ?auto_1599922 ?auto_1599926 ) ) ( not ( = ?auto_1599923 ?auto_1599924 ) ) ( not ( = ?auto_1599923 ?auto_1599925 ) ) ( not ( = ?auto_1599923 ?auto_1599926 ) ) ( not ( = ?auto_1599924 ?auto_1599925 ) ) ( not ( = ?auto_1599924 ?auto_1599926 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1599925 ?auto_1599926 )
      ( MAKE-6CRATE-VERIFY ?auto_1599920 ?auto_1599921 ?auto_1599922 ?auto_1599923 ?auto_1599924 ?auto_1599925 ?auto_1599926 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1599964 - SURFACE
      ?auto_1599965 - SURFACE
      ?auto_1599966 - SURFACE
      ?auto_1599967 - SURFACE
      ?auto_1599968 - SURFACE
      ?auto_1599969 - SURFACE
      ?auto_1599970 - SURFACE
    )
    :vars
    (
      ?auto_1599972 - HOIST
      ?auto_1599971 - PLACE
      ?auto_1599973 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1599972 ?auto_1599971 ) ( SURFACE-AT ?auto_1599969 ?auto_1599971 ) ( CLEAR ?auto_1599969 ) ( IS-CRATE ?auto_1599970 ) ( not ( = ?auto_1599969 ?auto_1599970 ) ) ( TRUCK-AT ?auto_1599973 ?auto_1599971 ) ( AVAILABLE ?auto_1599972 ) ( IN ?auto_1599970 ?auto_1599973 ) ( ON ?auto_1599969 ?auto_1599968 ) ( not ( = ?auto_1599968 ?auto_1599969 ) ) ( not ( = ?auto_1599968 ?auto_1599970 ) ) ( ON ?auto_1599965 ?auto_1599964 ) ( ON ?auto_1599966 ?auto_1599965 ) ( ON ?auto_1599967 ?auto_1599966 ) ( ON ?auto_1599968 ?auto_1599967 ) ( not ( = ?auto_1599964 ?auto_1599965 ) ) ( not ( = ?auto_1599964 ?auto_1599966 ) ) ( not ( = ?auto_1599964 ?auto_1599967 ) ) ( not ( = ?auto_1599964 ?auto_1599968 ) ) ( not ( = ?auto_1599964 ?auto_1599969 ) ) ( not ( = ?auto_1599964 ?auto_1599970 ) ) ( not ( = ?auto_1599965 ?auto_1599966 ) ) ( not ( = ?auto_1599965 ?auto_1599967 ) ) ( not ( = ?auto_1599965 ?auto_1599968 ) ) ( not ( = ?auto_1599965 ?auto_1599969 ) ) ( not ( = ?auto_1599965 ?auto_1599970 ) ) ( not ( = ?auto_1599966 ?auto_1599967 ) ) ( not ( = ?auto_1599966 ?auto_1599968 ) ) ( not ( = ?auto_1599966 ?auto_1599969 ) ) ( not ( = ?auto_1599966 ?auto_1599970 ) ) ( not ( = ?auto_1599967 ?auto_1599968 ) ) ( not ( = ?auto_1599967 ?auto_1599969 ) ) ( not ( = ?auto_1599967 ?auto_1599970 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1599968 ?auto_1599969 ?auto_1599970 )
      ( MAKE-6CRATE-VERIFY ?auto_1599964 ?auto_1599965 ?auto_1599966 ?auto_1599967 ?auto_1599968 ?auto_1599969 ?auto_1599970 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600015 - SURFACE
      ?auto_1600016 - SURFACE
      ?auto_1600017 - SURFACE
      ?auto_1600018 - SURFACE
      ?auto_1600019 - SURFACE
      ?auto_1600020 - SURFACE
      ?auto_1600021 - SURFACE
    )
    :vars
    (
      ?auto_1600025 - HOIST
      ?auto_1600024 - PLACE
      ?auto_1600023 - TRUCK
      ?auto_1600022 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600025 ?auto_1600024 ) ( SURFACE-AT ?auto_1600020 ?auto_1600024 ) ( CLEAR ?auto_1600020 ) ( IS-CRATE ?auto_1600021 ) ( not ( = ?auto_1600020 ?auto_1600021 ) ) ( AVAILABLE ?auto_1600025 ) ( IN ?auto_1600021 ?auto_1600023 ) ( ON ?auto_1600020 ?auto_1600019 ) ( not ( = ?auto_1600019 ?auto_1600020 ) ) ( not ( = ?auto_1600019 ?auto_1600021 ) ) ( TRUCK-AT ?auto_1600023 ?auto_1600022 ) ( not ( = ?auto_1600022 ?auto_1600024 ) ) ( ON ?auto_1600016 ?auto_1600015 ) ( ON ?auto_1600017 ?auto_1600016 ) ( ON ?auto_1600018 ?auto_1600017 ) ( ON ?auto_1600019 ?auto_1600018 ) ( not ( = ?auto_1600015 ?auto_1600016 ) ) ( not ( = ?auto_1600015 ?auto_1600017 ) ) ( not ( = ?auto_1600015 ?auto_1600018 ) ) ( not ( = ?auto_1600015 ?auto_1600019 ) ) ( not ( = ?auto_1600015 ?auto_1600020 ) ) ( not ( = ?auto_1600015 ?auto_1600021 ) ) ( not ( = ?auto_1600016 ?auto_1600017 ) ) ( not ( = ?auto_1600016 ?auto_1600018 ) ) ( not ( = ?auto_1600016 ?auto_1600019 ) ) ( not ( = ?auto_1600016 ?auto_1600020 ) ) ( not ( = ?auto_1600016 ?auto_1600021 ) ) ( not ( = ?auto_1600017 ?auto_1600018 ) ) ( not ( = ?auto_1600017 ?auto_1600019 ) ) ( not ( = ?auto_1600017 ?auto_1600020 ) ) ( not ( = ?auto_1600017 ?auto_1600021 ) ) ( not ( = ?auto_1600018 ?auto_1600019 ) ) ( not ( = ?auto_1600018 ?auto_1600020 ) ) ( not ( = ?auto_1600018 ?auto_1600021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600019 ?auto_1600020 ?auto_1600021 )
      ( MAKE-6CRATE-VERIFY ?auto_1600015 ?auto_1600016 ?auto_1600017 ?auto_1600018 ?auto_1600019 ?auto_1600020 ?auto_1600021 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600072 - SURFACE
      ?auto_1600073 - SURFACE
      ?auto_1600074 - SURFACE
      ?auto_1600075 - SURFACE
      ?auto_1600076 - SURFACE
      ?auto_1600077 - SURFACE
      ?auto_1600078 - SURFACE
    )
    :vars
    (
      ?auto_1600080 - HOIST
      ?auto_1600083 - PLACE
      ?auto_1600079 - TRUCK
      ?auto_1600082 - PLACE
      ?auto_1600081 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600080 ?auto_1600083 ) ( SURFACE-AT ?auto_1600077 ?auto_1600083 ) ( CLEAR ?auto_1600077 ) ( IS-CRATE ?auto_1600078 ) ( not ( = ?auto_1600077 ?auto_1600078 ) ) ( AVAILABLE ?auto_1600080 ) ( ON ?auto_1600077 ?auto_1600076 ) ( not ( = ?auto_1600076 ?auto_1600077 ) ) ( not ( = ?auto_1600076 ?auto_1600078 ) ) ( TRUCK-AT ?auto_1600079 ?auto_1600082 ) ( not ( = ?auto_1600082 ?auto_1600083 ) ) ( HOIST-AT ?auto_1600081 ?auto_1600082 ) ( LIFTING ?auto_1600081 ?auto_1600078 ) ( not ( = ?auto_1600080 ?auto_1600081 ) ) ( ON ?auto_1600073 ?auto_1600072 ) ( ON ?auto_1600074 ?auto_1600073 ) ( ON ?auto_1600075 ?auto_1600074 ) ( ON ?auto_1600076 ?auto_1600075 ) ( not ( = ?auto_1600072 ?auto_1600073 ) ) ( not ( = ?auto_1600072 ?auto_1600074 ) ) ( not ( = ?auto_1600072 ?auto_1600075 ) ) ( not ( = ?auto_1600072 ?auto_1600076 ) ) ( not ( = ?auto_1600072 ?auto_1600077 ) ) ( not ( = ?auto_1600072 ?auto_1600078 ) ) ( not ( = ?auto_1600073 ?auto_1600074 ) ) ( not ( = ?auto_1600073 ?auto_1600075 ) ) ( not ( = ?auto_1600073 ?auto_1600076 ) ) ( not ( = ?auto_1600073 ?auto_1600077 ) ) ( not ( = ?auto_1600073 ?auto_1600078 ) ) ( not ( = ?auto_1600074 ?auto_1600075 ) ) ( not ( = ?auto_1600074 ?auto_1600076 ) ) ( not ( = ?auto_1600074 ?auto_1600077 ) ) ( not ( = ?auto_1600074 ?auto_1600078 ) ) ( not ( = ?auto_1600075 ?auto_1600076 ) ) ( not ( = ?auto_1600075 ?auto_1600077 ) ) ( not ( = ?auto_1600075 ?auto_1600078 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600076 ?auto_1600077 ?auto_1600078 )
      ( MAKE-6CRATE-VERIFY ?auto_1600072 ?auto_1600073 ?auto_1600074 ?auto_1600075 ?auto_1600076 ?auto_1600077 ?auto_1600078 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600135 - SURFACE
      ?auto_1600136 - SURFACE
      ?auto_1600137 - SURFACE
      ?auto_1600138 - SURFACE
      ?auto_1600139 - SURFACE
      ?auto_1600140 - SURFACE
      ?auto_1600141 - SURFACE
    )
    :vars
    (
      ?auto_1600144 - HOIST
      ?auto_1600143 - PLACE
      ?auto_1600145 - TRUCK
      ?auto_1600147 - PLACE
      ?auto_1600146 - HOIST
      ?auto_1600142 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600144 ?auto_1600143 ) ( SURFACE-AT ?auto_1600140 ?auto_1600143 ) ( CLEAR ?auto_1600140 ) ( IS-CRATE ?auto_1600141 ) ( not ( = ?auto_1600140 ?auto_1600141 ) ) ( AVAILABLE ?auto_1600144 ) ( ON ?auto_1600140 ?auto_1600139 ) ( not ( = ?auto_1600139 ?auto_1600140 ) ) ( not ( = ?auto_1600139 ?auto_1600141 ) ) ( TRUCK-AT ?auto_1600145 ?auto_1600147 ) ( not ( = ?auto_1600147 ?auto_1600143 ) ) ( HOIST-AT ?auto_1600146 ?auto_1600147 ) ( not ( = ?auto_1600144 ?auto_1600146 ) ) ( AVAILABLE ?auto_1600146 ) ( SURFACE-AT ?auto_1600141 ?auto_1600147 ) ( ON ?auto_1600141 ?auto_1600142 ) ( CLEAR ?auto_1600141 ) ( not ( = ?auto_1600140 ?auto_1600142 ) ) ( not ( = ?auto_1600141 ?auto_1600142 ) ) ( not ( = ?auto_1600139 ?auto_1600142 ) ) ( ON ?auto_1600136 ?auto_1600135 ) ( ON ?auto_1600137 ?auto_1600136 ) ( ON ?auto_1600138 ?auto_1600137 ) ( ON ?auto_1600139 ?auto_1600138 ) ( not ( = ?auto_1600135 ?auto_1600136 ) ) ( not ( = ?auto_1600135 ?auto_1600137 ) ) ( not ( = ?auto_1600135 ?auto_1600138 ) ) ( not ( = ?auto_1600135 ?auto_1600139 ) ) ( not ( = ?auto_1600135 ?auto_1600140 ) ) ( not ( = ?auto_1600135 ?auto_1600141 ) ) ( not ( = ?auto_1600135 ?auto_1600142 ) ) ( not ( = ?auto_1600136 ?auto_1600137 ) ) ( not ( = ?auto_1600136 ?auto_1600138 ) ) ( not ( = ?auto_1600136 ?auto_1600139 ) ) ( not ( = ?auto_1600136 ?auto_1600140 ) ) ( not ( = ?auto_1600136 ?auto_1600141 ) ) ( not ( = ?auto_1600136 ?auto_1600142 ) ) ( not ( = ?auto_1600137 ?auto_1600138 ) ) ( not ( = ?auto_1600137 ?auto_1600139 ) ) ( not ( = ?auto_1600137 ?auto_1600140 ) ) ( not ( = ?auto_1600137 ?auto_1600141 ) ) ( not ( = ?auto_1600137 ?auto_1600142 ) ) ( not ( = ?auto_1600138 ?auto_1600139 ) ) ( not ( = ?auto_1600138 ?auto_1600140 ) ) ( not ( = ?auto_1600138 ?auto_1600141 ) ) ( not ( = ?auto_1600138 ?auto_1600142 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600139 ?auto_1600140 ?auto_1600141 )
      ( MAKE-6CRATE-VERIFY ?auto_1600135 ?auto_1600136 ?auto_1600137 ?auto_1600138 ?auto_1600139 ?auto_1600140 ?auto_1600141 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600199 - SURFACE
      ?auto_1600200 - SURFACE
      ?auto_1600201 - SURFACE
      ?auto_1600202 - SURFACE
      ?auto_1600203 - SURFACE
      ?auto_1600204 - SURFACE
      ?auto_1600205 - SURFACE
    )
    :vars
    (
      ?auto_1600209 - HOIST
      ?auto_1600211 - PLACE
      ?auto_1600206 - PLACE
      ?auto_1600207 - HOIST
      ?auto_1600208 - SURFACE
      ?auto_1600210 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600209 ?auto_1600211 ) ( SURFACE-AT ?auto_1600204 ?auto_1600211 ) ( CLEAR ?auto_1600204 ) ( IS-CRATE ?auto_1600205 ) ( not ( = ?auto_1600204 ?auto_1600205 ) ) ( AVAILABLE ?auto_1600209 ) ( ON ?auto_1600204 ?auto_1600203 ) ( not ( = ?auto_1600203 ?auto_1600204 ) ) ( not ( = ?auto_1600203 ?auto_1600205 ) ) ( not ( = ?auto_1600206 ?auto_1600211 ) ) ( HOIST-AT ?auto_1600207 ?auto_1600206 ) ( not ( = ?auto_1600209 ?auto_1600207 ) ) ( AVAILABLE ?auto_1600207 ) ( SURFACE-AT ?auto_1600205 ?auto_1600206 ) ( ON ?auto_1600205 ?auto_1600208 ) ( CLEAR ?auto_1600205 ) ( not ( = ?auto_1600204 ?auto_1600208 ) ) ( not ( = ?auto_1600205 ?auto_1600208 ) ) ( not ( = ?auto_1600203 ?auto_1600208 ) ) ( TRUCK-AT ?auto_1600210 ?auto_1600211 ) ( ON ?auto_1600200 ?auto_1600199 ) ( ON ?auto_1600201 ?auto_1600200 ) ( ON ?auto_1600202 ?auto_1600201 ) ( ON ?auto_1600203 ?auto_1600202 ) ( not ( = ?auto_1600199 ?auto_1600200 ) ) ( not ( = ?auto_1600199 ?auto_1600201 ) ) ( not ( = ?auto_1600199 ?auto_1600202 ) ) ( not ( = ?auto_1600199 ?auto_1600203 ) ) ( not ( = ?auto_1600199 ?auto_1600204 ) ) ( not ( = ?auto_1600199 ?auto_1600205 ) ) ( not ( = ?auto_1600199 ?auto_1600208 ) ) ( not ( = ?auto_1600200 ?auto_1600201 ) ) ( not ( = ?auto_1600200 ?auto_1600202 ) ) ( not ( = ?auto_1600200 ?auto_1600203 ) ) ( not ( = ?auto_1600200 ?auto_1600204 ) ) ( not ( = ?auto_1600200 ?auto_1600205 ) ) ( not ( = ?auto_1600200 ?auto_1600208 ) ) ( not ( = ?auto_1600201 ?auto_1600202 ) ) ( not ( = ?auto_1600201 ?auto_1600203 ) ) ( not ( = ?auto_1600201 ?auto_1600204 ) ) ( not ( = ?auto_1600201 ?auto_1600205 ) ) ( not ( = ?auto_1600201 ?auto_1600208 ) ) ( not ( = ?auto_1600202 ?auto_1600203 ) ) ( not ( = ?auto_1600202 ?auto_1600204 ) ) ( not ( = ?auto_1600202 ?auto_1600205 ) ) ( not ( = ?auto_1600202 ?auto_1600208 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600203 ?auto_1600204 ?auto_1600205 )
      ( MAKE-6CRATE-VERIFY ?auto_1600199 ?auto_1600200 ?auto_1600201 ?auto_1600202 ?auto_1600203 ?auto_1600204 ?auto_1600205 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600263 - SURFACE
      ?auto_1600264 - SURFACE
      ?auto_1600265 - SURFACE
      ?auto_1600266 - SURFACE
      ?auto_1600267 - SURFACE
      ?auto_1600268 - SURFACE
      ?auto_1600269 - SURFACE
    )
    :vars
    (
      ?auto_1600272 - HOIST
      ?auto_1600274 - PLACE
      ?auto_1600275 - PLACE
      ?auto_1600273 - HOIST
      ?auto_1600271 - SURFACE
      ?auto_1600270 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600272 ?auto_1600274 ) ( IS-CRATE ?auto_1600269 ) ( not ( = ?auto_1600268 ?auto_1600269 ) ) ( not ( = ?auto_1600267 ?auto_1600268 ) ) ( not ( = ?auto_1600267 ?auto_1600269 ) ) ( not ( = ?auto_1600275 ?auto_1600274 ) ) ( HOIST-AT ?auto_1600273 ?auto_1600275 ) ( not ( = ?auto_1600272 ?auto_1600273 ) ) ( AVAILABLE ?auto_1600273 ) ( SURFACE-AT ?auto_1600269 ?auto_1600275 ) ( ON ?auto_1600269 ?auto_1600271 ) ( CLEAR ?auto_1600269 ) ( not ( = ?auto_1600268 ?auto_1600271 ) ) ( not ( = ?auto_1600269 ?auto_1600271 ) ) ( not ( = ?auto_1600267 ?auto_1600271 ) ) ( TRUCK-AT ?auto_1600270 ?auto_1600274 ) ( SURFACE-AT ?auto_1600267 ?auto_1600274 ) ( CLEAR ?auto_1600267 ) ( LIFTING ?auto_1600272 ?auto_1600268 ) ( IS-CRATE ?auto_1600268 ) ( ON ?auto_1600264 ?auto_1600263 ) ( ON ?auto_1600265 ?auto_1600264 ) ( ON ?auto_1600266 ?auto_1600265 ) ( ON ?auto_1600267 ?auto_1600266 ) ( not ( = ?auto_1600263 ?auto_1600264 ) ) ( not ( = ?auto_1600263 ?auto_1600265 ) ) ( not ( = ?auto_1600263 ?auto_1600266 ) ) ( not ( = ?auto_1600263 ?auto_1600267 ) ) ( not ( = ?auto_1600263 ?auto_1600268 ) ) ( not ( = ?auto_1600263 ?auto_1600269 ) ) ( not ( = ?auto_1600263 ?auto_1600271 ) ) ( not ( = ?auto_1600264 ?auto_1600265 ) ) ( not ( = ?auto_1600264 ?auto_1600266 ) ) ( not ( = ?auto_1600264 ?auto_1600267 ) ) ( not ( = ?auto_1600264 ?auto_1600268 ) ) ( not ( = ?auto_1600264 ?auto_1600269 ) ) ( not ( = ?auto_1600264 ?auto_1600271 ) ) ( not ( = ?auto_1600265 ?auto_1600266 ) ) ( not ( = ?auto_1600265 ?auto_1600267 ) ) ( not ( = ?auto_1600265 ?auto_1600268 ) ) ( not ( = ?auto_1600265 ?auto_1600269 ) ) ( not ( = ?auto_1600265 ?auto_1600271 ) ) ( not ( = ?auto_1600266 ?auto_1600267 ) ) ( not ( = ?auto_1600266 ?auto_1600268 ) ) ( not ( = ?auto_1600266 ?auto_1600269 ) ) ( not ( = ?auto_1600266 ?auto_1600271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600267 ?auto_1600268 ?auto_1600269 )
      ( MAKE-6CRATE-VERIFY ?auto_1600263 ?auto_1600264 ?auto_1600265 ?auto_1600266 ?auto_1600267 ?auto_1600268 ?auto_1600269 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600327 - SURFACE
      ?auto_1600328 - SURFACE
      ?auto_1600329 - SURFACE
      ?auto_1600330 - SURFACE
      ?auto_1600331 - SURFACE
      ?auto_1600332 - SURFACE
      ?auto_1600333 - SURFACE
    )
    :vars
    (
      ?auto_1600336 - HOIST
      ?auto_1600339 - PLACE
      ?auto_1600334 - PLACE
      ?auto_1600338 - HOIST
      ?auto_1600335 - SURFACE
      ?auto_1600337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600336 ?auto_1600339 ) ( IS-CRATE ?auto_1600333 ) ( not ( = ?auto_1600332 ?auto_1600333 ) ) ( not ( = ?auto_1600331 ?auto_1600332 ) ) ( not ( = ?auto_1600331 ?auto_1600333 ) ) ( not ( = ?auto_1600334 ?auto_1600339 ) ) ( HOIST-AT ?auto_1600338 ?auto_1600334 ) ( not ( = ?auto_1600336 ?auto_1600338 ) ) ( AVAILABLE ?auto_1600338 ) ( SURFACE-AT ?auto_1600333 ?auto_1600334 ) ( ON ?auto_1600333 ?auto_1600335 ) ( CLEAR ?auto_1600333 ) ( not ( = ?auto_1600332 ?auto_1600335 ) ) ( not ( = ?auto_1600333 ?auto_1600335 ) ) ( not ( = ?auto_1600331 ?auto_1600335 ) ) ( TRUCK-AT ?auto_1600337 ?auto_1600339 ) ( SURFACE-AT ?auto_1600331 ?auto_1600339 ) ( CLEAR ?auto_1600331 ) ( IS-CRATE ?auto_1600332 ) ( AVAILABLE ?auto_1600336 ) ( IN ?auto_1600332 ?auto_1600337 ) ( ON ?auto_1600328 ?auto_1600327 ) ( ON ?auto_1600329 ?auto_1600328 ) ( ON ?auto_1600330 ?auto_1600329 ) ( ON ?auto_1600331 ?auto_1600330 ) ( not ( = ?auto_1600327 ?auto_1600328 ) ) ( not ( = ?auto_1600327 ?auto_1600329 ) ) ( not ( = ?auto_1600327 ?auto_1600330 ) ) ( not ( = ?auto_1600327 ?auto_1600331 ) ) ( not ( = ?auto_1600327 ?auto_1600332 ) ) ( not ( = ?auto_1600327 ?auto_1600333 ) ) ( not ( = ?auto_1600327 ?auto_1600335 ) ) ( not ( = ?auto_1600328 ?auto_1600329 ) ) ( not ( = ?auto_1600328 ?auto_1600330 ) ) ( not ( = ?auto_1600328 ?auto_1600331 ) ) ( not ( = ?auto_1600328 ?auto_1600332 ) ) ( not ( = ?auto_1600328 ?auto_1600333 ) ) ( not ( = ?auto_1600328 ?auto_1600335 ) ) ( not ( = ?auto_1600329 ?auto_1600330 ) ) ( not ( = ?auto_1600329 ?auto_1600331 ) ) ( not ( = ?auto_1600329 ?auto_1600332 ) ) ( not ( = ?auto_1600329 ?auto_1600333 ) ) ( not ( = ?auto_1600329 ?auto_1600335 ) ) ( not ( = ?auto_1600330 ?auto_1600331 ) ) ( not ( = ?auto_1600330 ?auto_1600332 ) ) ( not ( = ?auto_1600330 ?auto_1600333 ) ) ( not ( = ?auto_1600330 ?auto_1600335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600331 ?auto_1600332 ?auto_1600333 )
      ( MAKE-6CRATE-VERIFY ?auto_1600327 ?auto_1600328 ?auto_1600329 ?auto_1600330 ?auto_1600331 ?auto_1600332 ?auto_1600333 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1600340 - SURFACE
      ?auto_1600341 - SURFACE
    )
    :vars
    (
      ?auto_1600344 - HOIST
      ?auto_1600347 - PLACE
      ?auto_1600348 - SURFACE
      ?auto_1600342 - PLACE
      ?auto_1600346 - HOIST
      ?auto_1600343 - SURFACE
      ?auto_1600345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600344 ?auto_1600347 ) ( IS-CRATE ?auto_1600341 ) ( not ( = ?auto_1600340 ?auto_1600341 ) ) ( not ( = ?auto_1600348 ?auto_1600340 ) ) ( not ( = ?auto_1600348 ?auto_1600341 ) ) ( not ( = ?auto_1600342 ?auto_1600347 ) ) ( HOIST-AT ?auto_1600346 ?auto_1600342 ) ( not ( = ?auto_1600344 ?auto_1600346 ) ) ( AVAILABLE ?auto_1600346 ) ( SURFACE-AT ?auto_1600341 ?auto_1600342 ) ( ON ?auto_1600341 ?auto_1600343 ) ( CLEAR ?auto_1600341 ) ( not ( = ?auto_1600340 ?auto_1600343 ) ) ( not ( = ?auto_1600341 ?auto_1600343 ) ) ( not ( = ?auto_1600348 ?auto_1600343 ) ) ( SURFACE-AT ?auto_1600348 ?auto_1600347 ) ( CLEAR ?auto_1600348 ) ( IS-CRATE ?auto_1600340 ) ( AVAILABLE ?auto_1600344 ) ( IN ?auto_1600340 ?auto_1600345 ) ( TRUCK-AT ?auto_1600345 ?auto_1600342 ) )
    :subtasks
    ( ( !DRIVE ?auto_1600345 ?auto_1600342 ?auto_1600347 )
      ( MAKE-2CRATE ?auto_1600348 ?auto_1600340 ?auto_1600341 )
      ( MAKE-1CRATE-VERIFY ?auto_1600340 ?auto_1600341 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1600349 - SURFACE
      ?auto_1600350 - SURFACE
      ?auto_1600351 - SURFACE
    )
    :vars
    (
      ?auto_1600353 - HOIST
      ?auto_1600356 - PLACE
      ?auto_1600354 - PLACE
      ?auto_1600357 - HOIST
      ?auto_1600352 - SURFACE
      ?auto_1600355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600353 ?auto_1600356 ) ( IS-CRATE ?auto_1600351 ) ( not ( = ?auto_1600350 ?auto_1600351 ) ) ( not ( = ?auto_1600349 ?auto_1600350 ) ) ( not ( = ?auto_1600349 ?auto_1600351 ) ) ( not ( = ?auto_1600354 ?auto_1600356 ) ) ( HOIST-AT ?auto_1600357 ?auto_1600354 ) ( not ( = ?auto_1600353 ?auto_1600357 ) ) ( AVAILABLE ?auto_1600357 ) ( SURFACE-AT ?auto_1600351 ?auto_1600354 ) ( ON ?auto_1600351 ?auto_1600352 ) ( CLEAR ?auto_1600351 ) ( not ( = ?auto_1600350 ?auto_1600352 ) ) ( not ( = ?auto_1600351 ?auto_1600352 ) ) ( not ( = ?auto_1600349 ?auto_1600352 ) ) ( SURFACE-AT ?auto_1600349 ?auto_1600356 ) ( CLEAR ?auto_1600349 ) ( IS-CRATE ?auto_1600350 ) ( AVAILABLE ?auto_1600353 ) ( IN ?auto_1600350 ?auto_1600355 ) ( TRUCK-AT ?auto_1600355 ?auto_1600354 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600350 ?auto_1600351 )
      ( MAKE-2CRATE-VERIFY ?auto_1600349 ?auto_1600350 ?auto_1600351 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1600358 - SURFACE
      ?auto_1600359 - SURFACE
      ?auto_1600360 - SURFACE
      ?auto_1600361 - SURFACE
    )
    :vars
    (
      ?auto_1600366 - HOIST
      ?auto_1600367 - PLACE
      ?auto_1600365 - PLACE
      ?auto_1600362 - HOIST
      ?auto_1600363 - SURFACE
      ?auto_1600364 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600366 ?auto_1600367 ) ( IS-CRATE ?auto_1600361 ) ( not ( = ?auto_1600360 ?auto_1600361 ) ) ( not ( = ?auto_1600359 ?auto_1600360 ) ) ( not ( = ?auto_1600359 ?auto_1600361 ) ) ( not ( = ?auto_1600365 ?auto_1600367 ) ) ( HOIST-AT ?auto_1600362 ?auto_1600365 ) ( not ( = ?auto_1600366 ?auto_1600362 ) ) ( AVAILABLE ?auto_1600362 ) ( SURFACE-AT ?auto_1600361 ?auto_1600365 ) ( ON ?auto_1600361 ?auto_1600363 ) ( CLEAR ?auto_1600361 ) ( not ( = ?auto_1600360 ?auto_1600363 ) ) ( not ( = ?auto_1600361 ?auto_1600363 ) ) ( not ( = ?auto_1600359 ?auto_1600363 ) ) ( SURFACE-AT ?auto_1600359 ?auto_1600367 ) ( CLEAR ?auto_1600359 ) ( IS-CRATE ?auto_1600360 ) ( AVAILABLE ?auto_1600366 ) ( IN ?auto_1600360 ?auto_1600364 ) ( TRUCK-AT ?auto_1600364 ?auto_1600365 ) ( ON ?auto_1600359 ?auto_1600358 ) ( not ( = ?auto_1600358 ?auto_1600359 ) ) ( not ( = ?auto_1600358 ?auto_1600360 ) ) ( not ( = ?auto_1600358 ?auto_1600361 ) ) ( not ( = ?auto_1600358 ?auto_1600363 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600359 ?auto_1600360 ?auto_1600361 )
      ( MAKE-3CRATE-VERIFY ?auto_1600358 ?auto_1600359 ?auto_1600360 ?auto_1600361 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1600368 - SURFACE
      ?auto_1600369 - SURFACE
      ?auto_1600370 - SURFACE
      ?auto_1600371 - SURFACE
      ?auto_1600372 - SURFACE
    )
    :vars
    (
      ?auto_1600377 - HOIST
      ?auto_1600378 - PLACE
      ?auto_1600376 - PLACE
      ?auto_1600373 - HOIST
      ?auto_1600374 - SURFACE
      ?auto_1600375 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600377 ?auto_1600378 ) ( IS-CRATE ?auto_1600372 ) ( not ( = ?auto_1600371 ?auto_1600372 ) ) ( not ( = ?auto_1600370 ?auto_1600371 ) ) ( not ( = ?auto_1600370 ?auto_1600372 ) ) ( not ( = ?auto_1600376 ?auto_1600378 ) ) ( HOIST-AT ?auto_1600373 ?auto_1600376 ) ( not ( = ?auto_1600377 ?auto_1600373 ) ) ( AVAILABLE ?auto_1600373 ) ( SURFACE-AT ?auto_1600372 ?auto_1600376 ) ( ON ?auto_1600372 ?auto_1600374 ) ( CLEAR ?auto_1600372 ) ( not ( = ?auto_1600371 ?auto_1600374 ) ) ( not ( = ?auto_1600372 ?auto_1600374 ) ) ( not ( = ?auto_1600370 ?auto_1600374 ) ) ( SURFACE-AT ?auto_1600370 ?auto_1600378 ) ( CLEAR ?auto_1600370 ) ( IS-CRATE ?auto_1600371 ) ( AVAILABLE ?auto_1600377 ) ( IN ?auto_1600371 ?auto_1600375 ) ( TRUCK-AT ?auto_1600375 ?auto_1600376 ) ( ON ?auto_1600369 ?auto_1600368 ) ( ON ?auto_1600370 ?auto_1600369 ) ( not ( = ?auto_1600368 ?auto_1600369 ) ) ( not ( = ?auto_1600368 ?auto_1600370 ) ) ( not ( = ?auto_1600368 ?auto_1600371 ) ) ( not ( = ?auto_1600368 ?auto_1600372 ) ) ( not ( = ?auto_1600368 ?auto_1600374 ) ) ( not ( = ?auto_1600369 ?auto_1600370 ) ) ( not ( = ?auto_1600369 ?auto_1600371 ) ) ( not ( = ?auto_1600369 ?auto_1600372 ) ) ( not ( = ?auto_1600369 ?auto_1600374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600370 ?auto_1600371 ?auto_1600372 )
      ( MAKE-4CRATE-VERIFY ?auto_1600368 ?auto_1600369 ?auto_1600370 ?auto_1600371 ?auto_1600372 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1600379 - SURFACE
      ?auto_1600380 - SURFACE
      ?auto_1600381 - SURFACE
      ?auto_1600382 - SURFACE
      ?auto_1600383 - SURFACE
      ?auto_1600384 - SURFACE
    )
    :vars
    (
      ?auto_1600389 - HOIST
      ?auto_1600390 - PLACE
      ?auto_1600388 - PLACE
      ?auto_1600385 - HOIST
      ?auto_1600386 - SURFACE
      ?auto_1600387 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600389 ?auto_1600390 ) ( IS-CRATE ?auto_1600384 ) ( not ( = ?auto_1600383 ?auto_1600384 ) ) ( not ( = ?auto_1600382 ?auto_1600383 ) ) ( not ( = ?auto_1600382 ?auto_1600384 ) ) ( not ( = ?auto_1600388 ?auto_1600390 ) ) ( HOIST-AT ?auto_1600385 ?auto_1600388 ) ( not ( = ?auto_1600389 ?auto_1600385 ) ) ( AVAILABLE ?auto_1600385 ) ( SURFACE-AT ?auto_1600384 ?auto_1600388 ) ( ON ?auto_1600384 ?auto_1600386 ) ( CLEAR ?auto_1600384 ) ( not ( = ?auto_1600383 ?auto_1600386 ) ) ( not ( = ?auto_1600384 ?auto_1600386 ) ) ( not ( = ?auto_1600382 ?auto_1600386 ) ) ( SURFACE-AT ?auto_1600382 ?auto_1600390 ) ( CLEAR ?auto_1600382 ) ( IS-CRATE ?auto_1600383 ) ( AVAILABLE ?auto_1600389 ) ( IN ?auto_1600383 ?auto_1600387 ) ( TRUCK-AT ?auto_1600387 ?auto_1600388 ) ( ON ?auto_1600380 ?auto_1600379 ) ( ON ?auto_1600381 ?auto_1600380 ) ( ON ?auto_1600382 ?auto_1600381 ) ( not ( = ?auto_1600379 ?auto_1600380 ) ) ( not ( = ?auto_1600379 ?auto_1600381 ) ) ( not ( = ?auto_1600379 ?auto_1600382 ) ) ( not ( = ?auto_1600379 ?auto_1600383 ) ) ( not ( = ?auto_1600379 ?auto_1600384 ) ) ( not ( = ?auto_1600379 ?auto_1600386 ) ) ( not ( = ?auto_1600380 ?auto_1600381 ) ) ( not ( = ?auto_1600380 ?auto_1600382 ) ) ( not ( = ?auto_1600380 ?auto_1600383 ) ) ( not ( = ?auto_1600380 ?auto_1600384 ) ) ( not ( = ?auto_1600380 ?auto_1600386 ) ) ( not ( = ?auto_1600381 ?auto_1600382 ) ) ( not ( = ?auto_1600381 ?auto_1600383 ) ) ( not ( = ?auto_1600381 ?auto_1600384 ) ) ( not ( = ?auto_1600381 ?auto_1600386 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600382 ?auto_1600383 ?auto_1600384 )
      ( MAKE-5CRATE-VERIFY ?auto_1600379 ?auto_1600380 ?auto_1600381 ?auto_1600382 ?auto_1600383 ?auto_1600384 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600391 - SURFACE
      ?auto_1600392 - SURFACE
      ?auto_1600393 - SURFACE
      ?auto_1600394 - SURFACE
      ?auto_1600395 - SURFACE
      ?auto_1600396 - SURFACE
      ?auto_1600397 - SURFACE
    )
    :vars
    (
      ?auto_1600402 - HOIST
      ?auto_1600403 - PLACE
      ?auto_1600401 - PLACE
      ?auto_1600398 - HOIST
      ?auto_1600399 - SURFACE
      ?auto_1600400 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600402 ?auto_1600403 ) ( IS-CRATE ?auto_1600397 ) ( not ( = ?auto_1600396 ?auto_1600397 ) ) ( not ( = ?auto_1600395 ?auto_1600396 ) ) ( not ( = ?auto_1600395 ?auto_1600397 ) ) ( not ( = ?auto_1600401 ?auto_1600403 ) ) ( HOIST-AT ?auto_1600398 ?auto_1600401 ) ( not ( = ?auto_1600402 ?auto_1600398 ) ) ( AVAILABLE ?auto_1600398 ) ( SURFACE-AT ?auto_1600397 ?auto_1600401 ) ( ON ?auto_1600397 ?auto_1600399 ) ( CLEAR ?auto_1600397 ) ( not ( = ?auto_1600396 ?auto_1600399 ) ) ( not ( = ?auto_1600397 ?auto_1600399 ) ) ( not ( = ?auto_1600395 ?auto_1600399 ) ) ( SURFACE-AT ?auto_1600395 ?auto_1600403 ) ( CLEAR ?auto_1600395 ) ( IS-CRATE ?auto_1600396 ) ( AVAILABLE ?auto_1600402 ) ( IN ?auto_1600396 ?auto_1600400 ) ( TRUCK-AT ?auto_1600400 ?auto_1600401 ) ( ON ?auto_1600392 ?auto_1600391 ) ( ON ?auto_1600393 ?auto_1600392 ) ( ON ?auto_1600394 ?auto_1600393 ) ( ON ?auto_1600395 ?auto_1600394 ) ( not ( = ?auto_1600391 ?auto_1600392 ) ) ( not ( = ?auto_1600391 ?auto_1600393 ) ) ( not ( = ?auto_1600391 ?auto_1600394 ) ) ( not ( = ?auto_1600391 ?auto_1600395 ) ) ( not ( = ?auto_1600391 ?auto_1600396 ) ) ( not ( = ?auto_1600391 ?auto_1600397 ) ) ( not ( = ?auto_1600391 ?auto_1600399 ) ) ( not ( = ?auto_1600392 ?auto_1600393 ) ) ( not ( = ?auto_1600392 ?auto_1600394 ) ) ( not ( = ?auto_1600392 ?auto_1600395 ) ) ( not ( = ?auto_1600392 ?auto_1600396 ) ) ( not ( = ?auto_1600392 ?auto_1600397 ) ) ( not ( = ?auto_1600392 ?auto_1600399 ) ) ( not ( = ?auto_1600393 ?auto_1600394 ) ) ( not ( = ?auto_1600393 ?auto_1600395 ) ) ( not ( = ?auto_1600393 ?auto_1600396 ) ) ( not ( = ?auto_1600393 ?auto_1600397 ) ) ( not ( = ?auto_1600393 ?auto_1600399 ) ) ( not ( = ?auto_1600394 ?auto_1600395 ) ) ( not ( = ?auto_1600394 ?auto_1600396 ) ) ( not ( = ?auto_1600394 ?auto_1600397 ) ) ( not ( = ?auto_1600394 ?auto_1600399 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600395 ?auto_1600396 ?auto_1600397 )
      ( MAKE-6CRATE-VERIFY ?auto_1600391 ?auto_1600392 ?auto_1600393 ?auto_1600394 ?auto_1600395 ?auto_1600396 ?auto_1600397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1600404 - SURFACE
      ?auto_1600405 - SURFACE
    )
    :vars
    (
      ?auto_1600410 - HOIST
      ?auto_1600411 - PLACE
      ?auto_1600412 - SURFACE
      ?auto_1600409 - PLACE
      ?auto_1600406 - HOIST
      ?auto_1600407 - SURFACE
      ?auto_1600408 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600410 ?auto_1600411 ) ( IS-CRATE ?auto_1600405 ) ( not ( = ?auto_1600404 ?auto_1600405 ) ) ( not ( = ?auto_1600412 ?auto_1600404 ) ) ( not ( = ?auto_1600412 ?auto_1600405 ) ) ( not ( = ?auto_1600409 ?auto_1600411 ) ) ( HOIST-AT ?auto_1600406 ?auto_1600409 ) ( not ( = ?auto_1600410 ?auto_1600406 ) ) ( SURFACE-AT ?auto_1600405 ?auto_1600409 ) ( ON ?auto_1600405 ?auto_1600407 ) ( CLEAR ?auto_1600405 ) ( not ( = ?auto_1600404 ?auto_1600407 ) ) ( not ( = ?auto_1600405 ?auto_1600407 ) ) ( not ( = ?auto_1600412 ?auto_1600407 ) ) ( SURFACE-AT ?auto_1600412 ?auto_1600411 ) ( CLEAR ?auto_1600412 ) ( IS-CRATE ?auto_1600404 ) ( AVAILABLE ?auto_1600410 ) ( TRUCK-AT ?auto_1600408 ?auto_1600409 ) ( LIFTING ?auto_1600406 ?auto_1600404 ) )
    :subtasks
    ( ( !LOAD ?auto_1600406 ?auto_1600404 ?auto_1600408 ?auto_1600409 )
      ( MAKE-2CRATE ?auto_1600412 ?auto_1600404 ?auto_1600405 )
      ( MAKE-1CRATE-VERIFY ?auto_1600404 ?auto_1600405 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1600413 - SURFACE
      ?auto_1600414 - SURFACE
      ?auto_1600415 - SURFACE
    )
    :vars
    (
      ?auto_1600418 - HOIST
      ?auto_1600420 - PLACE
      ?auto_1600421 - PLACE
      ?auto_1600419 - HOIST
      ?auto_1600416 - SURFACE
      ?auto_1600417 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600418 ?auto_1600420 ) ( IS-CRATE ?auto_1600415 ) ( not ( = ?auto_1600414 ?auto_1600415 ) ) ( not ( = ?auto_1600413 ?auto_1600414 ) ) ( not ( = ?auto_1600413 ?auto_1600415 ) ) ( not ( = ?auto_1600421 ?auto_1600420 ) ) ( HOIST-AT ?auto_1600419 ?auto_1600421 ) ( not ( = ?auto_1600418 ?auto_1600419 ) ) ( SURFACE-AT ?auto_1600415 ?auto_1600421 ) ( ON ?auto_1600415 ?auto_1600416 ) ( CLEAR ?auto_1600415 ) ( not ( = ?auto_1600414 ?auto_1600416 ) ) ( not ( = ?auto_1600415 ?auto_1600416 ) ) ( not ( = ?auto_1600413 ?auto_1600416 ) ) ( SURFACE-AT ?auto_1600413 ?auto_1600420 ) ( CLEAR ?auto_1600413 ) ( IS-CRATE ?auto_1600414 ) ( AVAILABLE ?auto_1600418 ) ( TRUCK-AT ?auto_1600417 ?auto_1600421 ) ( LIFTING ?auto_1600419 ?auto_1600414 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600414 ?auto_1600415 )
      ( MAKE-2CRATE-VERIFY ?auto_1600413 ?auto_1600414 ?auto_1600415 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1600422 - SURFACE
      ?auto_1600423 - SURFACE
      ?auto_1600424 - SURFACE
      ?auto_1600425 - SURFACE
    )
    :vars
    (
      ?auto_1600430 - HOIST
      ?auto_1600428 - PLACE
      ?auto_1600427 - PLACE
      ?auto_1600431 - HOIST
      ?auto_1600426 - SURFACE
      ?auto_1600429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600430 ?auto_1600428 ) ( IS-CRATE ?auto_1600425 ) ( not ( = ?auto_1600424 ?auto_1600425 ) ) ( not ( = ?auto_1600423 ?auto_1600424 ) ) ( not ( = ?auto_1600423 ?auto_1600425 ) ) ( not ( = ?auto_1600427 ?auto_1600428 ) ) ( HOIST-AT ?auto_1600431 ?auto_1600427 ) ( not ( = ?auto_1600430 ?auto_1600431 ) ) ( SURFACE-AT ?auto_1600425 ?auto_1600427 ) ( ON ?auto_1600425 ?auto_1600426 ) ( CLEAR ?auto_1600425 ) ( not ( = ?auto_1600424 ?auto_1600426 ) ) ( not ( = ?auto_1600425 ?auto_1600426 ) ) ( not ( = ?auto_1600423 ?auto_1600426 ) ) ( SURFACE-AT ?auto_1600423 ?auto_1600428 ) ( CLEAR ?auto_1600423 ) ( IS-CRATE ?auto_1600424 ) ( AVAILABLE ?auto_1600430 ) ( TRUCK-AT ?auto_1600429 ?auto_1600427 ) ( LIFTING ?auto_1600431 ?auto_1600424 ) ( ON ?auto_1600423 ?auto_1600422 ) ( not ( = ?auto_1600422 ?auto_1600423 ) ) ( not ( = ?auto_1600422 ?auto_1600424 ) ) ( not ( = ?auto_1600422 ?auto_1600425 ) ) ( not ( = ?auto_1600422 ?auto_1600426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600423 ?auto_1600424 ?auto_1600425 )
      ( MAKE-3CRATE-VERIFY ?auto_1600422 ?auto_1600423 ?auto_1600424 ?auto_1600425 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1600432 - SURFACE
      ?auto_1600433 - SURFACE
      ?auto_1600434 - SURFACE
      ?auto_1600435 - SURFACE
      ?auto_1600436 - SURFACE
    )
    :vars
    (
      ?auto_1600441 - HOIST
      ?auto_1600439 - PLACE
      ?auto_1600438 - PLACE
      ?auto_1600442 - HOIST
      ?auto_1600437 - SURFACE
      ?auto_1600440 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600441 ?auto_1600439 ) ( IS-CRATE ?auto_1600436 ) ( not ( = ?auto_1600435 ?auto_1600436 ) ) ( not ( = ?auto_1600434 ?auto_1600435 ) ) ( not ( = ?auto_1600434 ?auto_1600436 ) ) ( not ( = ?auto_1600438 ?auto_1600439 ) ) ( HOIST-AT ?auto_1600442 ?auto_1600438 ) ( not ( = ?auto_1600441 ?auto_1600442 ) ) ( SURFACE-AT ?auto_1600436 ?auto_1600438 ) ( ON ?auto_1600436 ?auto_1600437 ) ( CLEAR ?auto_1600436 ) ( not ( = ?auto_1600435 ?auto_1600437 ) ) ( not ( = ?auto_1600436 ?auto_1600437 ) ) ( not ( = ?auto_1600434 ?auto_1600437 ) ) ( SURFACE-AT ?auto_1600434 ?auto_1600439 ) ( CLEAR ?auto_1600434 ) ( IS-CRATE ?auto_1600435 ) ( AVAILABLE ?auto_1600441 ) ( TRUCK-AT ?auto_1600440 ?auto_1600438 ) ( LIFTING ?auto_1600442 ?auto_1600435 ) ( ON ?auto_1600433 ?auto_1600432 ) ( ON ?auto_1600434 ?auto_1600433 ) ( not ( = ?auto_1600432 ?auto_1600433 ) ) ( not ( = ?auto_1600432 ?auto_1600434 ) ) ( not ( = ?auto_1600432 ?auto_1600435 ) ) ( not ( = ?auto_1600432 ?auto_1600436 ) ) ( not ( = ?auto_1600432 ?auto_1600437 ) ) ( not ( = ?auto_1600433 ?auto_1600434 ) ) ( not ( = ?auto_1600433 ?auto_1600435 ) ) ( not ( = ?auto_1600433 ?auto_1600436 ) ) ( not ( = ?auto_1600433 ?auto_1600437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600434 ?auto_1600435 ?auto_1600436 )
      ( MAKE-4CRATE-VERIFY ?auto_1600432 ?auto_1600433 ?auto_1600434 ?auto_1600435 ?auto_1600436 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1600443 - SURFACE
      ?auto_1600444 - SURFACE
      ?auto_1600445 - SURFACE
      ?auto_1600446 - SURFACE
      ?auto_1600447 - SURFACE
      ?auto_1600448 - SURFACE
    )
    :vars
    (
      ?auto_1600453 - HOIST
      ?auto_1600451 - PLACE
      ?auto_1600450 - PLACE
      ?auto_1600454 - HOIST
      ?auto_1600449 - SURFACE
      ?auto_1600452 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600453 ?auto_1600451 ) ( IS-CRATE ?auto_1600448 ) ( not ( = ?auto_1600447 ?auto_1600448 ) ) ( not ( = ?auto_1600446 ?auto_1600447 ) ) ( not ( = ?auto_1600446 ?auto_1600448 ) ) ( not ( = ?auto_1600450 ?auto_1600451 ) ) ( HOIST-AT ?auto_1600454 ?auto_1600450 ) ( not ( = ?auto_1600453 ?auto_1600454 ) ) ( SURFACE-AT ?auto_1600448 ?auto_1600450 ) ( ON ?auto_1600448 ?auto_1600449 ) ( CLEAR ?auto_1600448 ) ( not ( = ?auto_1600447 ?auto_1600449 ) ) ( not ( = ?auto_1600448 ?auto_1600449 ) ) ( not ( = ?auto_1600446 ?auto_1600449 ) ) ( SURFACE-AT ?auto_1600446 ?auto_1600451 ) ( CLEAR ?auto_1600446 ) ( IS-CRATE ?auto_1600447 ) ( AVAILABLE ?auto_1600453 ) ( TRUCK-AT ?auto_1600452 ?auto_1600450 ) ( LIFTING ?auto_1600454 ?auto_1600447 ) ( ON ?auto_1600444 ?auto_1600443 ) ( ON ?auto_1600445 ?auto_1600444 ) ( ON ?auto_1600446 ?auto_1600445 ) ( not ( = ?auto_1600443 ?auto_1600444 ) ) ( not ( = ?auto_1600443 ?auto_1600445 ) ) ( not ( = ?auto_1600443 ?auto_1600446 ) ) ( not ( = ?auto_1600443 ?auto_1600447 ) ) ( not ( = ?auto_1600443 ?auto_1600448 ) ) ( not ( = ?auto_1600443 ?auto_1600449 ) ) ( not ( = ?auto_1600444 ?auto_1600445 ) ) ( not ( = ?auto_1600444 ?auto_1600446 ) ) ( not ( = ?auto_1600444 ?auto_1600447 ) ) ( not ( = ?auto_1600444 ?auto_1600448 ) ) ( not ( = ?auto_1600444 ?auto_1600449 ) ) ( not ( = ?auto_1600445 ?auto_1600446 ) ) ( not ( = ?auto_1600445 ?auto_1600447 ) ) ( not ( = ?auto_1600445 ?auto_1600448 ) ) ( not ( = ?auto_1600445 ?auto_1600449 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600446 ?auto_1600447 ?auto_1600448 )
      ( MAKE-5CRATE-VERIFY ?auto_1600443 ?auto_1600444 ?auto_1600445 ?auto_1600446 ?auto_1600447 ?auto_1600448 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600455 - SURFACE
      ?auto_1600456 - SURFACE
      ?auto_1600457 - SURFACE
      ?auto_1600458 - SURFACE
      ?auto_1600459 - SURFACE
      ?auto_1600460 - SURFACE
      ?auto_1600461 - SURFACE
    )
    :vars
    (
      ?auto_1600466 - HOIST
      ?auto_1600464 - PLACE
      ?auto_1600463 - PLACE
      ?auto_1600467 - HOIST
      ?auto_1600462 - SURFACE
      ?auto_1600465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600466 ?auto_1600464 ) ( IS-CRATE ?auto_1600461 ) ( not ( = ?auto_1600460 ?auto_1600461 ) ) ( not ( = ?auto_1600459 ?auto_1600460 ) ) ( not ( = ?auto_1600459 ?auto_1600461 ) ) ( not ( = ?auto_1600463 ?auto_1600464 ) ) ( HOIST-AT ?auto_1600467 ?auto_1600463 ) ( not ( = ?auto_1600466 ?auto_1600467 ) ) ( SURFACE-AT ?auto_1600461 ?auto_1600463 ) ( ON ?auto_1600461 ?auto_1600462 ) ( CLEAR ?auto_1600461 ) ( not ( = ?auto_1600460 ?auto_1600462 ) ) ( not ( = ?auto_1600461 ?auto_1600462 ) ) ( not ( = ?auto_1600459 ?auto_1600462 ) ) ( SURFACE-AT ?auto_1600459 ?auto_1600464 ) ( CLEAR ?auto_1600459 ) ( IS-CRATE ?auto_1600460 ) ( AVAILABLE ?auto_1600466 ) ( TRUCK-AT ?auto_1600465 ?auto_1600463 ) ( LIFTING ?auto_1600467 ?auto_1600460 ) ( ON ?auto_1600456 ?auto_1600455 ) ( ON ?auto_1600457 ?auto_1600456 ) ( ON ?auto_1600458 ?auto_1600457 ) ( ON ?auto_1600459 ?auto_1600458 ) ( not ( = ?auto_1600455 ?auto_1600456 ) ) ( not ( = ?auto_1600455 ?auto_1600457 ) ) ( not ( = ?auto_1600455 ?auto_1600458 ) ) ( not ( = ?auto_1600455 ?auto_1600459 ) ) ( not ( = ?auto_1600455 ?auto_1600460 ) ) ( not ( = ?auto_1600455 ?auto_1600461 ) ) ( not ( = ?auto_1600455 ?auto_1600462 ) ) ( not ( = ?auto_1600456 ?auto_1600457 ) ) ( not ( = ?auto_1600456 ?auto_1600458 ) ) ( not ( = ?auto_1600456 ?auto_1600459 ) ) ( not ( = ?auto_1600456 ?auto_1600460 ) ) ( not ( = ?auto_1600456 ?auto_1600461 ) ) ( not ( = ?auto_1600456 ?auto_1600462 ) ) ( not ( = ?auto_1600457 ?auto_1600458 ) ) ( not ( = ?auto_1600457 ?auto_1600459 ) ) ( not ( = ?auto_1600457 ?auto_1600460 ) ) ( not ( = ?auto_1600457 ?auto_1600461 ) ) ( not ( = ?auto_1600457 ?auto_1600462 ) ) ( not ( = ?auto_1600458 ?auto_1600459 ) ) ( not ( = ?auto_1600458 ?auto_1600460 ) ) ( not ( = ?auto_1600458 ?auto_1600461 ) ) ( not ( = ?auto_1600458 ?auto_1600462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600459 ?auto_1600460 ?auto_1600461 )
      ( MAKE-6CRATE-VERIFY ?auto_1600455 ?auto_1600456 ?auto_1600457 ?auto_1600458 ?auto_1600459 ?auto_1600460 ?auto_1600461 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1600468 - SURFACE
      ?auto_1600469 - SURFACE
    )
    :vars
    (
      ?auto_1600475 - HOIST
      ?auto_1600472 - PLACE
      ?auto_1600473 - SURFACE
      ?auto_1600471 - PLACE
      ?auto_1600476 - HOIST
      ?auto_1600470 - SURFACE
      ?auto_1600474 - TRUCK
      ?auto_1600477 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600475 ?auto_1600472 ) ( IS-CRATE ?auto_1600469 ) ( not ( = ?auto_1600468 ?auto_1600469 ) ) ( not ( = ?auto_1600473 ?auto_1600468 ) ) ( not ( = ?auto_1600473 ?auto_1600469 ) ) ( not ( = ?auto_1600471 ?auto_1600472 ) ) ( HOIST-AT ?auto_1600476 ?auto_1600471 ) ( not ( = ?auto_1600475 ?auto_1600476 ) ) ( SURFACE-AT ?auto_1600469 ?auto_1600471 ) ( ON ?auto_1600469 ?auto_1600470 ) ( CLEAR ?auto_1600469 ) ( not ( = ?auto_1600468 ?auto_1600470 ) ) ( not ( = ?auto_1600469 ?auto_1600470 ) ) ( not ( = ?auto_1600473 ?auto_1600470 ) ) ( SURFACE-AT ?auto_1600473 ?auto_1600472 ) ( CLEAR ?auto_1600473 ) ( IS-CRATE ?auto_1600468 ) ( AVAILABLE ?auto_1600475 ) ( TRUCK-AT ?auto_1600474 ?auto_1600471 ) ( AVAILABLE ?auto_1600476 ) ( SURFACE-AT ?auto_1600468 ?auto_1600471 ) ( ON ?auto_1600468 ?auto_1600477 ) ( CLEAR ?auto_1600468 ) ( not ( = ?auto_1600468 ?auto_1600477 ) ) ( not ( = ?auto_1600469 ?auto_1600477 ) ) ( not ( = ?auto_1600473 ?auto_1600477 ) ) ( not ( = ?auto_1600470 ?auto_1600477 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1600476 ?auto_1600468 ?auto_1600477 ?auto_1600471 )
      ( MAKE-2CRATE ?auto_1600473 ?auto_1600468 ?auto_1600469 )
      ( MAKE-1CRATE-VERIFY ?auto_1600468 ?auto_1600469 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1600478 - SURFACE
      ?auto_1600479 - SURFACE
      ?auto_1600480 - SURFACE
    )
    :vars
    (
      ?auto_1600483 - HOIST
      ?auto_1600486 - PLACE
      ?auto_1600481 - PLACE
      ?auto_1600482 - HOIST
      ?auto_1600487 - SURFACE
      ?auto_1600485 - TRUCK
      ?auto_1600484 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600483 ?auto_1600486 ) ( IS-CRATE ?auto_1600480 ) ( not ( = ?auto_1600479 ?auto_1600480 ) ) ( not ( = ?auto_1600478 ?auto_1600479 ) ) ( not ( = ?auto_1600478 ?auto_1600480 ) ) ( not ( = ?auto_1600481 ?auto_1600486 ) ) ( HOIST-AT ?auto_1600482 ?auto_1600481 ) ( not ( = ?auto_1600483 ?auto_1600482 ) ) ( SURFACE-AT ?auto_1600480 ?auto_1600481 ) ( ON ?auto_1600480 ?auto_1600487 ) ( CLEAR ?auto_1600480 ) ( not ( = ?auto_1600479 ?auto_1600487 ) ) ( not ( = ?auto_1600480 ?auto_1600487 ) ) ( not ( = ?auto_1600478 ?auto_1600487 ) ) ( SURFACE-AT ?auto_1600478 ?auto_1600486 ) ( CLEAR ?auto_1600478 ) ( IS-CRATE ?auto_1600479 ) ( AVAILABLE ?auto_1600483 ) ( TRUCK-AT ?auto_1600485 ?auto_1600481 ) ( AVAILABLE ?auto_1600482 ) ( SURFACE-AT ?auto_1600479 ?auto_1600481 ) ( ON ?auto_1600479 ?auto_1600484 ) ( CLEAR ?auto_1600479 ) ( not ( = ?auto_1600479 ?auto_1600484 ) ) ( not ( = ?auto_1600480 ?auto_1600484 ) ) ( not ( = ?auto_1600478 ?auto_1600484 ) ) ( not ( = ?auto_1600487 ?auto_1600484 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600479 ?auto_1600480 )
      ( MAKE-2CRATE-VERIFY ?auto_1600478 ?auto_1600479 ?auto_1600480 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1600488 - SURFACE
      ?auto_1600489 - SURFACE
      ?auto_1600490 - SURFACE
      ?auto_1600491 - SURFACE
    )
    :vars
    (
      ?auto_1600493 - HOIST
      ?auto_1600498 - PLACE
      ?auto_1600494 - PLACE
      ?auto_1600496 - HOIST
      ?auto_1600497 - SURFACE
      ?auto_1600492 - TRUCK
      ?auto_1600495 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600493 ?auto_1600498 ) ( IS-CRATE ?auto_1600491 ) ( not ( = ?auto_1600490 ?auto_1600491 ) ) ( not ( = ?auto_1600489 ?auto_1600490 ) ) ( not ( = ?auto_1600489 ?auto_1600491 ) ) ( not ( = ?auto_1600494 ?auto_1600498 ) ) ( HOIST-AT ?auto_1600496 ?auto_1600494 ) ( not ( = ?auto_1600493 ?auto_1600496 ) ) ( SURFACE-AT ?auto_1600491 ?auto_1600494 ) ( ON ?auto_1600491 ?auto_1600497 ) ( CLEAR ?auto_1600491 ) ( not ( = ?auto_1600490 ?auto_1600497 ) ) ( not ( = ?auto_1600491 ?auto_1600497 ) ) ( not ( = ?auto_1600489 ?auto_1600497 ) ) ( SURFACE-AT ?auto_1600489 ?auto_1600498 ) ( CLEAR ?auto_1600489 ) ( IS-CRATE ?auto_1600490 ) ( AVAILABLE ?auto_1600493 ) ( TRUCK-AT ?auto_1600492 ?auto_1600494 ) ( AVAILABLE ?auto_1600496 ) ( SURFACE-AT ?auto_1600490 ?auto_1600494 ) ( ON ?auto_1600490 ?auto_1600495 ) ( CLEAR ?auto_1600490 ) ( not ( = ?auto_1600490 ?auto_1600495 ) ) ( not ( = ?auto_1600491 ?auto_1600495 ) ) ( not ( = ?auto_1600489 ?auto_1600495 ) ) ( not ( = ?auto_1600497 ?auto_1600495 ) ) ( ON ?auto_1600489 ?auto_1600488 ) ( not ( = ?auto_1600488 ?auto_1600489 ) ) ( not ( = ?auto_1600488 ?auto_1600490 ) ) ( not ( = ?auto_1600488 ?auto_1600491 ) ) ( not ( = ?auto_1600488 ?auto_1600497 ) ) ( not ( = ?auto_1600488 ?auto_1600495 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600489 ?auto_1600490 ?auto_1600491 )
      ( MAKE-3CRATE-VERIFY ?auto_1600488 ?auto_1600489 ?auto_1600490 ?auto_1600491 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1600499 - SURFACE
      ?auto_1600500 - SURFACE
      ?auto_1600501 - SURFACE
      ?auto_1600502 - SURFACE
      ?auto_1600503 - SURFACE
    )
    :vars
    (
      ?auto_1600505 - HOIST
      ?auto_1600510 - PLACE
      ?auto_1600506 - PLACE
      ?auto_1600508 - HOIST
      ?auto_1600509 - SURFACE
      ?auto_1600504 - TRUCK
      ?auto_1600507 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600505 ?auto_1600510 ) ( IS-CRATE ?auto_1600503 ) ( not ( = ?auto_1600502 ?auto_1600503 ) ) ( not ( = ?auto_1600501 ?auto_1600502 ) ) ( not ( = ?auto_1600501 ?auto_1600503 ) ) ( not ( = ?auto_1600506 ?auto_1600510 ) ) ( HOIST-AT ?auto_1600508 ?auto_1600506 ) ( not ( = ?auto_1600505 ?auto_1600508 ) ) ( SURFACE-AT ?auto_1600503 ?auto_1600506 ) ( ON ?auto_1600503 ?auto_1600509 ) ( CLEAR ?auto_1600503 ) ( not ( = ?auto_1600502 ?auto_1600509 ) ) ( not ( = ?auto_1600503 ?auto_1600509 ) ) ( not ( = ?auto_1600501 ?auto_1600509 ) ) ( SURFACE-AT ?auto_1600501 ?auto_1600510 ) ( CLEAR ?auto_1600501 ) ( IS-CRATE ?auto_1600502 ) ( AVAILABLE ?auto_1600505 ) ( TRUCK-AT ?auto_1600504 ?auto_1600506 ) ( AVAILABLE ?auto_1600508 ) ( SURFACE-AT ?auto_1600502 ?auto_1600506 ) ( ON ?auto_1600502 ?auto_1600507 ) ( CLEAR ?auto_1600502 ) ( not ( = ?auto_1600502 ?auto_1600507 ) ) ( not ( = ?auto_1600503 ?auto_1600507 ) ) ( not ( = ?auto_1600501 ?auto_1600507 ) ) ( not ( = ?auto_1600509 ?auto_1600507 ) ) ( ON ?auto_1600500 ?auto_1600499 ) ( ON ?auto_1600501 ?auto_1600500 ) ( not ( = ?auto_1600499 ?auto_1600500 ) ) ( not ( = ?auto_1600499 ?auto_1600501 ) ) ( not ( = ?auto_1600499 ?auto_1600502 ) ) ( not ( = ?auto_1600499 ?auto_1600503 ) ) ( not ( = ?auto_1600499 ?auto_1600509 ) ) ( not ( = ?auto_1600499 ?auto_1600507 ) ) ( not ( = ?auto_1600500 ?auto_1600501 ) ) ( not ( = ?auto_1600500 ?auto_1600502 ) ) ( not ( = ?auto_1600500 ?auto_1600503 ) ) ( not ( = ?auto_1600500 ?auto_1600509 ) ) ( not ( = ?auto_1600500 ?auto_1600507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600501 ?auto_1600502 ?auto_1600503 )
      ( MAKE-4CRATE-VERIFY ?auto_1600499 ?auto_1600500 ?auto_1600501 ?auto_1600502 ?auto_1600503 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1600511 - SURFACE
      ?auto_1600512 - SURFACE
      ?auto_1600513 - SURFACE
      ?auto_1600514 - SURFACE
      ?auto_1600515 - SURFACE
      ?auto_1600516 - SURFACE
    )
    :vars
    (
      ?auto_1600518 - HOIST
      ?auto_1600523 - PLACE
      ?auto_1600519 - PLACE
      ?auto_1600521 - HOIST
      ?auto_1600522 - SURFACE
      ?auto_1600517 - TRUCK
      ?auto_1600520 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600518 ?auto_1600523 ) ( IS-CRATE ?auto_1600516 ) ( not ( = ?auto_1600515 ?auto_1600516 ) ) ( not ( = ?auto_1600514 ?auto_1600515 ) ) ( not ( = ?auto_1600514 ?auto_1600516 ) ) ( not ( = ?auto_1600519 ?auto_1600523 ) ) ( HOIST-AT ?auto_1600521 ?auto_1600519 ) ( not ( = ?auto_1600518 ?auto_1600521 ) ) ( SURFACE-AT ?auto_1600516 ?auto_1600519 ) ( ON ?auto_1600516 ?auto_1600522 ) ( CLEAR ?auto_1600516 ) ( not ( = ?auto_1600515 ?auto_1600522 ) ) ( not ( = ?auto_1600516 ?auto_1600522 ) ) ( not ( = ?auto_1600514 ?auto_1600522 ) ) ( SURFACE-AT ?auto_1600514 ?auto_1600523 ) ( CLEAR ?auto_1600514 ) ( IS-CRATE ?auto_1600515 ) ( AVAILABLE ?auto_1600518 ) ( TRUCK-AT ?auto_1600517 ?auto_1600519 ) ( AVAILABLE ?auto_1600521 ) ( SURFACE-AT ?auto_1600515 ?auto_1600519 ) ( ON ?auto_1600515 ?auto_1600520 ) ( CLEAR ?auto_1600515 ) ( not ( = ?auto_1600515 ?auto_1600520 ) ) ( not ( = ?auto_1600516 ?auto_1600520 ) ) ( not ( = ?auto_1600514 ?auto_1600520 ) ) ( not ( = ?auto_1600522 ?auto_1600520 ) ) ( ON ?auto_1600512 ?auto_1600511 ) ( ON ?auto_1600513 ?auto_1600512 ) ( ON ?auto_1600514 ?auto_1600513 ) ( not ( = ?auto_1600511 ?auto_1600512 ) ) ( not ( = ?auto_1600511 ?auto_1600513 ) ) ( not ( = ?auto_1600511 ?auto_1600514 ) ) ( not ( = ?auto_1600511 ?auto_1600515 ) ) ( not ( = ?auto_1600511 ?auto_1600516 ) ) ( not ( = ?auto_1600511 ?auto_1600522 ) ) ( not ( = ?auto_1600511 ?auto_1600520 ) ) ( not ( = ?auto_1600512 ?auto_1600513 ) ) ( not ( = ?auto_1600512 ?auto_1600514 ) ) ( not ( = ?auto_1600512 ?auto_1600515 ) ) ( not ( = ?auto_1600512 ?auto_1600516 ) ) ( not ( = ?auto_1600512 ?auto_1600522 ) ) ( not ( = ?auto_1600512 ?auto_1600520 ) ) ( not ( = ?auto_1600513 ?auto_1600514 ) ) ( not ( = ?auto_1600513 ?auto_1600515 ) ) ( not ( = ?auto_1600513 ?auto_1600516 ) ) ( not ( = ?auto_1600513 ?auto_1600522 ) ) ( not ( = ?auto_1600513 ?auto_1600520 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600514 ?auto_1600515 ?auto_1600516 )
      ( MAKE-5CRATE-VERIFY ?auto_1600511 ?auto_1600512 ?auto_1600513 ?auto_1600514 ?auto_1600515 ?auto_1600516 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600524 - SURFACE
      ?auto_1600525 - SURFACE
      ?auto_1600526 - SURFACE
      ?auto_1600527 - SURFACE
      ?auto_1600528 - SURFACE
      ?auto_1600529 - SURFACE
      ?auto_1600530 - SURFACE
    )
    :vars
    (
      ?auto_1600532 - HOIST
      ?auto_1600537 - PLACE
      ?auto_1600533 - PLACE
      ?auto_1600535 - HOIST
      ?auto_1600536 - SURFACE
      ?auto_1600531 - TRUCK
      ?auto_1600534 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600532 ?auto_1600537 ) ( IS-CRATE ?auto_1600530 ) ( not ( = ?auto_1600529 ?auto_1600530 ) ) ( not ( = ?auto_1600528 ?auto_1600529 ) ) ( not ( = ?auto_1600528 ?auto_1600530 ) ) ( not ( = ?auto_1600533 ?auto_1600537 ) ) ( HOIST-AT ?auto_1600535 ?auto_1600533 ) ( not ( = ?auto_1600532 ?auto_1600535 ) ) ( SURFACE-AT ?auto_1600530 ?auto_1600533 ) ( ON ?auto_1600530 ?auto_1600536 ) ( CLEAR ?auto_1600530 ) ( not ( = ?auto_1600529 ?auto_1600536 ) ) ( not ( = ?auto_1600530 ?auto_1600536 ) ) ( not ( = ?auto_1600528 ?auto_1600536 ) ) ( SURFACE-AT ?auto_1600528 ?auto_1600537 ) ( CLEAR ?auto_1600528 ) ( IS-CRATE ?auto_1600529 ) ( AVAILABLE ?auto_1600532 ) ( TRUCK-AT ?auto_1600531 ?auto_1600533 ) ( AVAILABLE ?auto_1600535 ) ( SURFACE-AT ?auto_1600529 ?auto_1600533 ) ( ON ?auto_1600529 ?auto_1600534 ) ( CLEAR ?auto_1600529 ) ( not ( = ?auto_1600529 ?auto_1600534 ) ) ( not ( = ?auto_1600530 ?auto_1600534 ) ) ( not ( = ?auto_1600528 ?auto_1600534 ) ) ( not ( = ?auto_1600536 ?auto_1600534 ) ) ( ON ?auto_1600525 ?auto_1600524 ) ( ON ?auto_1600526 ?auto_1600525 ) ( ON ?auto_1600527 ?auto_1600526 ) ( ON ?auto_1600528 ?auto_1600527 ) ( not ( = ?auto_1600524 ?auto_1600525 ) ) ( not ( = ?auto_1600524 ?auto_1600526 ) ) ( not ( = ?auto_1600524 ?auto_1600527 ) ) ( not ( = ?auto_1600524 ?auto_1600528 ) ) ( not ( = ?auto_1600524 ?auto_1600529 ) ) ( not ( = ?auto_1600524 ?auto_1600530 ) ) ( not ( = ?auto_1600524 ?auto_1600536 ) ) ( not ( = ?auto_1600524 ?auto_1600534 ) ) ( not ( = ?auto_1600525 ?auto_1600526 ) ) ( not ( = ?auto_1600525 ?auto_1600527 ) ) ( not ( = ?auto_1600525 ?auto_1600528 ) ) ( not ( = ?auto_1600525 ?auto_1600529 ) ) ( not ( = ?auto_1600525 ?auto_1600530 ) ) ( not ( = ?auto_1600525 ?auto_1600536 ) ) ( not ( = ?auto_1600525 ?auto_1600534 ) ) ( not ( = ?auto_1600526 ?auto_1600527 ) ) ( not ( = ?auto_1600526 ?auto_1600528 ) ) ( not ( = ?auto_1600526 ?auto_1600529 ) ) ( not ( = ?auto_1600526 ?auto_1600530 ) ) ( not ( = ?auto_1600526 ?auto_1600536 ) ) ( not ( = ?auto_1600526 ?auto_1600534 ) ) ( not ( = ?auto_1600527 ?auto_1600528 ) ) ( not ( = ?auto_1600527 ?auto_1600529 ) ) ( not ( = ?auto_1600527 ?auto_1600530 ) ) ( not ( = ?auto_1600527 ?auto_1600536 ) ) ( not ( = ?auto_1600527 ?auto_1600534 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600528 ?auto_1600529 ?auto_1600530 )
      ( MAKE-6CRATE-VERIFY ?auto_1600524 ?auto_1600525 ?auto_1600526 ?auto_1600527 ?auto_1600528 ?auto_1600529 ?auto_1600530 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1600538 - SURFACE
      ?auto_1600539 - SURFACE
    )
    :vars
    (
      ?auto_1600541 - HOIST
      ?auto_1600547 - PLACE
      ?auto_1600545 - SURFACE
      ?auto_1600542 - PLACE
      ?auto_1600544 - HOIST
      ?auto_1600546 - SURFACE
      ?auto_1600543 - SURFACE
      ?auto_1600540 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600541 ?auto_1600547 ) ( IS-CRATE ?auto_1600539 ) ( not ( = ?auto_1600538 ?auto_1600539 ) ) ( not ( = ?auto_1600545 ?auto_1600538 ) ) ( not ( = ?auto_1600545 ?auto_1600539 ) ) ( not ( = ?auto_1600542 ?auto_1600547 ) ) ( HOIST-AT ?auto_1600544 ?auto_1600542 ) ( not ( = ?auto_1600541 ?auto_1600544 ) ) ( SURFACE-AT ?auto_1600539 ?auto_1600542 ) ( ON ?auto_1600539 ?auto_1600546 ) ( CLEAR ?auto_1600539 ) ( not ( = ?auto_1600538 ?auto_1600546 ) ) ( not ( = ?auto_1600539 ?auto_1600546 ) ) ( not ( = ?auto_1600545 ?auto_1600546 ) ) ( SURFACE-AT ?auto_1600545 ?auto_1600547 ) ( CLEAR ?auto_1600545 ) ( IS-CRATE ?auto_1600538 ) ( AVAILABLE ?auto_1600541 ) ( AVAILABLE ?auto_1600544 ) ( SURFACE-AT ?auto_1600538 ?auto_1600542 ) ( ON ?auto_1600538 ?auto_1600543 ) ( CLEAR ?auto_1600538 ) ( not ( = ?auto_1600538 ?auto_1600543 ) ) ( not ( = ?auto_1600539 ?auto_1600543 ) ) ( not ( = ?auto_1600545 ?auto_1600543 ) ) ( not ( = ?auto_1600546 ?auto_1600543 ) ) ( TRUCK-AT ?auto_1600540 ?auto_1600547 ) )
    :subtasks
    ( ( !DRIVE ?auto_1600540 ?auto_1600547 ?auto_1600542 )
      ( MAKE-2CRATE ?auto_1600545 ?auto_1600538 ?auto_1600539 )
      ( MAKE-1CRATE-VERIFY ?auto_1600538 ?auto_1600539 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1600548 - SURFACE
      ?auto_1600549 - SURFACE
      ?auto_1600550 - SURFACE
    )
    :vars
    (
      ?auto_1600557 - HOIST
      ?auto_1600553 - PLACE
      ?auto_1600551 - PLACE
      ?auto_1600556 - HOIST
      ?auto_1600554 - SURFACE
      ?auto_1600555 - SURFACE
      ?auto_1600552 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600557 ?auto_1600553 ) ( IS-CRATE ?auto_1600550 ) ( not ( = ?auto_1600549 ?auto_1600550 ) ) ( not ( = ?auto_1600548 ?auto_1600549 ) ) ( not ( = ?auto_1600548 ?auto_1600550 ) ) ( not ( = ?auto_1600551 ?auto_1600553 ) ) ( HOIST-AT ?auto_1600556 ?auto_1600551 ) ( not ( = ?auto_1600557 ?auto_1600556 ) ) ( SURFACE-AT ?auto_1600550 ?auto_1600551 ) ( ON ?auto_1600550 ?auto_1600554 ) ( CLEAR ?auto_1600550 ) ( not ( = ?auto_1600549 ?auto_1600554 ) ) ( not ( = ?auto_1600550 ?auto_1600554 ) ) ( not ( = ?auto_1600548 ?auto_1600554 ) ) ( SURFACE-AT ?auto_1600548 ?auto_1600553 ) ( CLEAR ?auto_1600548 ) ( IS-CRATE ?auto_1600549 ) ( AVAILABLE ?auto_1600557 ) ( AVAILABLE ?auto_1600556 ) ( SURFACE-AT ?auto_1600549 ?auto_1600551 ) ( ON ?auto_1600549 ?auto_1600555 ) ( CLEAR ?auto_1600549 ) ( not ( = ?auto_1600549 ?auto_1600555 ) ) ( not ( = ?auto_1600550 ?auto_1600555 ) ) ( not ( = ?auto_1600548 ?auto_1600555 ) ) ( not ( = ?auto_1600554 ?auto_1600555 ) ) ( TRUCK-AT ?auto_1600552 ?auto_1600553 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600549 ?auto_1600550 )
      ( MAKE-2CRATE-VERIFY ?auto_1600548 ?auto_1600549 ?auto_1600550 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1600558 - SURFACE
      ?auto_1600559 - SURFACE
      ?auto_1600560 - SURFACE
      ?auto_1600561 - SURFACE
    )
    :vars
    (
      ?auto_1600567 - HOIST
      ?auto_1600568 - PLACE
      ?auto_1600562 - PLACE
      ?auto_1600566 - HOIST
      ?auto_1600565 - SURFACE
      ?auto_1600563 - SURFACE
      ?auto_1600564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600567 ?auto_1600568 ) ( IS-CRATE ?auto_1600561 ) ( not ( = ?auto_1600560 ?auto_1600561 ) ) ( not ( = ?auto_1600559 ?auto_1600560 ) ) ( not ( = ?auto_1600559 ?auto_1600561 ) ) ( not ( = ?auto_1600562 ?auto_1600568 ) ) ( HOIST-AT ?auto_1600566 ?auto_1600562 ) ( not ( = ?auto_1600567 ?auto_1600566 ) ) ( SURFACE-AT ?auto_1600561 ?auto_1600562 ) ( ON ?auto_1600561 ?auto_1600565 ) ( CLEAR ?auto_1600561 ) ( not ( = ?auto_1600560 ?auto_1600565 ) ) ( not ( = ?auto_1600561 ?auto_1600565 ) ) ( not ( = ?auto_1600559 ?auto_1600565 ) ) ( SURFACE-AT ?auto_1600559 ?auto_1600568 ) ( CLEAR ?auto_1600559 ) ( IS-CRATE ?auto_1600560 ) ( AVAILABLE ?auto_1600567 ) ( AVAILABLE ?auto_1600566 ) ( SURFACE-AT ?auto_1600560 ?auto_1600562 ) ( ON ?auto_1600560 ?auto_1600563 ) ( CLEAR ?auto_1600560 ) ( not ( = ?auto_1600560 ?auto_1600563 ) ) ( not ( = ?auto_1600561 ?auto_1600563 ) ) ( not ( = ?auto_1600559 ?auto_1600563 ) ) ( not ( = ?auto_1600565 ?auto_1600563 ) ) ( TRUCK-AT ?auto_1600564 ?auto_1600568 ) ( ON ?auto_1600559 ?auto_1600558 ) ( not ( = ?auto_1600558 ?auto_1600559 ) ) ( not ( = ?auto_1600558 ?auto_1600560 ) ) ( not ( = ?auto_1600558 ?auto_1600561 ) ) ( not ( = ?auto_1600558 ?auto_1600565 ) ) ( not ( = ?auto_1600558 ?auto_1600563 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600559 ?auto_1600560 ?auto_1600561 )
      ( MAKE-3CRATE-VERIFY ?auto_1600558 ?auto_1600559 ?auto_1600560 ?auto_1600561 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1600569 - SURFACE
      ?auto_1600570 - SURFACE
      ?auto_1600571 - SURFACE
      ?auto_1600572 - SURFACE
      ?auto_1600573 - SURFACE
    )
    :vars
    (
      ?auto_1600579 - HOIST
      ?auto_1600580 - PLACE
      ?auto_1600574 - PLACE
      ?auto_1600578 - HOIST
      ?auto_1600577 - SURFACE
      ?auto_1600575 - SURFACE
      ?auto_1600576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600579 ?auto_1600580 ) ( IS-CRATE ?auto_1600573 ) ( not ( = ?auto_1600572 ?auto_1600573 ) ) ( not ( = ?auto_1600571 ?auto_1600572 ) ) ( not ( = ?auto_1600571 ?auto_1600573 ) ) ( not ( = ?auto_1600574 ?auto_1600580 ) ) ( HOIST-AT ?auto_1600578 ?auto_1600574 ) ( not ( = ?auto_1600579 ?auto_1600578 ) ) ( SURFACE-AT ?auto_1600573 ?auto_1600574 ) ( ON ?auto_1600573 ?auto_1600577 ) ( CLEAR ?auto_1600573 ) ( not ( = ?auto_1600572 ?auto_1600577 ) ) ( not ( = ?auto_1600573 ?auto_1600577 ) ) ( not ( = ?auto_1600571 ?auto_1600577 ) ) ( SURFACE-AT ?auto_1600571 ?auto_1600580 ) ( CLEAR ?auto_1600571 ) ( IS-CRATE ?auto_1600572 ) ( AVAILABLE ?auto_1600579 ) ( AVAILABLE ?auto_1600578 ) ( SURFACE-AT ?auto_1600572 ?auto_1600574 ) ( ON ?auto_1600572 ?auto_1600575 ) ( CLEAR ?auto_1600572 ) ( not ( = ?auto_1600572 ?auto_1600575 ) ) ( not ( = ?auto_1600573 ?auto_1600575 ) ) ( not ( = ?auto_1600571 ?auto_1600575 ) ) ( not ( = ?auto_1600577 ?auto_1600575 ) ) ( TRUCK-AT ?auto_1600576 ?auto_1600580 ) ( ON ?auto_1600570 ?auto_1600569 ) ( ON ?auto_1600571 ?auto_1600570 ) ( not ( = ?auto_1600569 ?auto_1600570 ) ) ( not ( = ?auto_1600569 ?auto_1600571 ) ) ( not ( = ?auto_1600569 ?auto_1600572 ) ) ( not ( = ?auto_1600569 ?auto_1600573 ) ) ( not ( = ?auto_1600569 ?auto_1600577 ) ) ( not ( = ?auto_1600569 ?auto_1600575 ) ) ( not ( = ?auto_1600570 ?auto_1600571 ) ) ( not ( = ?auto_1600570 ?auto_1600572 ) ) ( not ( = ?auto_1600570 ?auto_1600573 ) ) ( not ( = ?auto_1600570 ?auto_1600577 ) ) ( not ( = ?auto_1600570 ?auto_1600575 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600571 ?auto_1600572 ?auto_1600573 )
      ( MAKE-4CRATE-VERIFY ?auto_1600569 ?auto_1600570 ?auto_1600571 ?auto_1600572 ?auto_1600573 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1600581 - SURFACE
      ?auto_1600582 - SURFACE
      ?auto_1600583 - SURFACE
      ?auto_1600584 - SURFACE
      ?auto_1600585 - SURFACE
      ?auto_1600586 - SURFACE
    )
    :vars
    (
      ?auto_1600592 - HOIST
      ?auto_1600593 - PLACE
      ?auto_1600587 - PLACE
      ?auto_1600591 - HOIST
      ?auto_1600590 - SURFACE
      ?auto_1600588 - SURFACE
      ?auto_1600589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600592 ?auto_1600593 ) ( IS-CRATE ?auto_1600586 ) ( not ( = ?auto_1600585 ?auto_1600586 ) ) ( not ( = ?auto_1600584 ?auto_1600585 ) ) ( not ( = ?auto_1600584 ?auto_1600586 ) ) ( not ( = ?auto_1600587 ?auto_1600593 ) ) ( HOIST-AT ?auto_1600591 ?auto_1600587 ) ( not ( = ?auto_1600592 ?auto_1600591 ) ) ( SURFACE-AT ?auto_1600586 ?auto_1600587 ) ( ON ?auto_1600586 ?auto_1600590 ) ( CLEAR ?auto_1600586 ) ( not ( = ?auto_1600585 ?auto_1600590 ) ) ( not ( = ?auto_1600586 ?auto_1600590 ) ) ( not ( = ?auto_1600584 ?auto_1600590 ) ) ( SURFACE-AT ?auto_1600584 ?auto_1600593 ) ( CLEAR ?auto_1600584 ) ( IS-CRATE ?auto_1600585 ) ( AVAILABLE ?auto_1600592 ) ( AVAILABLE ?auto_1600591 ) ( SURFACE-AT ?auto_1600585 ?auto_1600587 ) ( ON ?auto_1600585 ?auto_1600588 ) ( CLEAR ?auto_1600585 ) ( not ( = ?auto_1600585 ?auto_1600588 ) ) ( not ( = ?auto_1600586 ?auto_1600588 ) ) ( not ( = ?auto_1600584 ?auto_1600588 ) ) ( not ( = ?auto_1600590 ?auto_1600588 ) ) ( TRUCK-AT ?auto_1600589 ?auto_1600593 ) ( ON ?auto_1600582 ?auto_1600581 ) ( ON ?auto_1600583 ?auto_1600582 ) ( ON ?auto_1600584 ?auto_1600583 ) ( not ( = ?auto_1600581 ?auto_1600582 ) ) ( not ( = ?auto_1600581 ?auto_1600583 ) ) ( not ( = ?auto_1600581 ?auto_1600584 ) ) ( not ( = ?auto_1600581 ?auto_1600585 ) ) ( not ( = ?auto_1600581 ?auto_1600586 ) ) ( not ( = ?auto_1600581 ?auto_1600590 ) ) ( not ( = ?auto_1600581 ?auto_1600588 ) ) ( not ( = ?auto_1600582 ?auto_1600583 ) ) ( not ( = ?auto_1600582 ?auto_1600584 ) ) ( not ( = ?auto_1600582 ?auto_1600585 ) ) ( not ( = ?auto_1600582 ?auto_1600586 ) ) ( not ( = ?auto_1600582 ?auto_1600590 ) ) ( not ( = ?auto_1600582 ?auto_1600588 ) ) ( not ( = ?auto_1600583 ?auto_1600584 ) ) ( not ( = ?auto_1600583 ?auto_1600585 ) ) ( not ( = ?auto_1600583 ?auto_1600586 ) ) ( not ( = ?auto_1600583 ?auto_1600590 ) ) ( not ( = ?auto_1600583 ?auto_1600588 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600584 ?auto_1600585 ?auto_1600586 )
      ( MAKE-5CRATE-VERIFY ?auto_1600581 ?auto_1600582 ?auto_1600583 ?auto_1600584 ?auto_1600585 ?auto_1600586 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600594 - SURFACE
      ?auto_1600595 - SURFACE
      ?auto_1600596 - SURFACE
      ?auto_1600597 - SURFACE
      ?auto_1600598 - SURFACE
      ?auto_1600599 - SURFACE
      ?auto_1600600 - SURFACE
    )
    :vars
    (
      ?auto_1600606 - HOIST
      ?auto_1600607 - PLACE
      ?auto_1600601 - PLACE
      ?auto_1600605 - HOIST
      ?auto_1600604 - SURFACE
      ?auto_1600602 - SURFACE
      ?auto_1600603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600606 ?auto_1600607 ) ( IS-CRATE ?auto_1600600 ) ( not ( = ?auto_1600599 ?auto_1600600 ) ) ( not ( = ?auto_1600598 ?auto_1600599 ) ) ( not ( = ?auto_1600598 ?auto_1600600 ) ) ( not ( = ?auto_1600601 ?auto_1600607 ) ) ( HOIST-AT ?auto_1600605 ?auto_1600601 ) ( not ( = ?auto_1600606 ?auto_1600605 ) ) ( SURFACE-AT ?auto_1600600 ?auto_1600601 ) ( ON ?auto_1600600 ?auto_1600604 ) ( CLEAR ?auto_1600600 ) ( not ( = ?auto_1600599 ?auto_1600604 ) ) ( not ( = ?auto_1600600 ?auto_1600604 ) ) ( not ( = ?auto_1600598 ?auto_1600604 ) ) ( SURFACE-AT ?auto_1600598 ?auto_1600607 ) ( CLEAR ?auto_1600598 ) ( IS-CRATE ?auto_1600599 ) ( AVAILABLE ?auto_1600606 ) ( AVAILABLE ?auto_1600605 ) ( SURFACE-AT ?auto_1600599 ?auto_1600601 ) ( ON ?auto_1600599 ?auto_1600602 ) ( CLEAR ?auto_1600599 ) ( not ( = ?auto_1600599 ?auto_1600602 ) ) ( not ( = ?auto_1600600 ?auto_1600602 ) ) ( not ( = ?auto_1600598 ?auto_1600602 ) ) ( not ( = ?auto_1600604 ?auto_1600602 ) ) ( TRUCK-AT ?auto_1600603 ?auto_1600607 ) ( ON ?auto_1600595 ?auto_1600594 ) ( ON ?auto_1600596 ?auto_1600595 ) ( ON ?auto_1600597 ?auto_1600596 ) ( ON ?auto_1600598 ?auto_1600597 ) ( not ( = ?auto_1600594 ?auto_1600595 ) ) ( not ( = ?auto_1600594 ?auto_1600596 ) ) ( not ( = ?auto_1600594 ?auto_1600597 ) ) ( not ( = ?auto_1600594 ?auto_1600598 ) ) ( not ( = ?auto_1600594 ?auto_1600599 ) ) ( not ( = ?auto_1600594 ?auto_1600600 ) ) ( not ( = ?auto_1600594 ?auto_1600604 ) ) ( not ( = ?auto_1600594 ?auto_1600602 ) ) ( not ( = ?auto_1600595 ?auto_1600596 ) ) ( not ( = ?auto_1600595 ?auto_1600597 ) ) ( not ( = ?auto_1600595 ?auto_1600598 ) ) ( not ( = ?auto_1600595 ?auto_1600599 ) ) ( not ( = ?auto_1600595 ?auto_1600600 ) ) ( not ( = ?auto_1600595 ?auto_1600604 ) ) ( not ( = ?auto_1600595 ?auto_1600602 ) ) ( not ( = ?auto_1600596 ?auto_1600597 ) ) ( not ( = ?auto_1600596 ?auto_1600598 ) ) ( not ( = ?auto_1600596 ?auto_1600599 ) ) ( not ( = ?auto_1600596 ?auto_1600600 ) ) ( not ( = ?auto_1600596 ?auto_1600604 ) ) ( not ( = ?auto_1600596 ?auto_1600602 ) ) ( not ( = ?auto_1600597 ?auto_1600598 ) ) ( not ( = ?auto_1600597 ?auto_1600599 ) ) ( not ( = ?auto_1600597 ?auto_1600600 ) ) ( not ( = ?auto_1600597 ?auto_1600604 ) ) ( not ( = ?auto_1600597 ?auto_1600602 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600598 ?auto_1600599 ?auto_1600600 )
      ( MAKE-6CRATE-VERIFY ?auto_1600594 ?auto_1600595 ?auto_1600596 ?auto_1600597 ?auto_1600598 ?auto_1600599 ?auto_1600600 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1600608 - SURFACE
      ?auto_1600609 - SURFACE
    )
    :vars
    (
      ?auto_1600616 - HOIST
      ?auto_1600617 - PLACE
      ?auto_1600615 - SURFACE
      ?auto_1600610 - PLACE
      ?auto_1600614 - HOIST
      ?auto_1600613 - SURFACE
      ?auto_1600611 - SURFACE
      ?auto_1600612 - TRUCK
      ?auto_1600618 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600616 ?auto_1600617 ) ( IS-CRATE ?auto_1600609 ) ( not ( = ?auto_1600608 ?auto_1600609 ) ) ( not ( = ?auto_1600615 ?auto_1600608 ) ) ( not ( = ?auto_1600615 ?auto_1600609 ) ) ( not ( = ?auto_1600610 ?auto_1600617 ) ) ( HOIST-AT ?auto_1600614 ?auto_1600610 ) ( not ( = ?auto_1600616 ?auto_1600614 ) ) ( SURFACE-AT ?auto_1600609 ?auto_1600610 ) ( ON ?auto_1600609 ?auto_1600613 ) ( CLEAR ?auto_1600609 ) ( not ( = ?auto_1600608 ?auto_1600613 ) ) ( not ( = ?auto_1600609 ?auto_1600613 ) ) ( not ( = ?auto_1600615 ?auto_1600613 ) ) ( IS-CRATE ?auto_1600608 ) ( AVAILABLE ?auto_1600614 ) ( SURFACE-AT ?auto_1600608 ?auto_1600610 ) ( ON ?auto_1600608 ?auto_1600611 ) ( CLEAR ?auto_1600608 ) ( not ( = ?auto_1600608 ?auto_1600611 ) ) ( not ( = ?auto_1600609 ?auto_1600611 ) ) ( not ( = ?auto_1600615 ?auto_1600611 ) ) ( not ( = ?auto_1600613 ?auto_1600611 ) ) ( TRUCK-AT ?auto_1600612 ?auto_1600617 ) ( SURFACE-AT ?auto_1600618 ?auto_1600617 ) ( CLEAR ?auto_1600618 ) ( LIFTING ?auto_1600616 ?auto_1600615 ) ( IS-CRATE ?auto_1600615 ) ( not ( = ?auto_1600618 ?auto_1600615 ) ) ( not ( = ?auto_1600608 ?auto_1600618 ) ) ( not ( = ?auto_1600609 ?auto_1600618 ) ) ( not ( = ?auto_1600613 ?auto_1600618 ) ) ( not ( = ?auto_1600611 ?auto_1600618 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600618 ?auto_1600615 )
      ( MAKE-2CRATE ?auto_1600615 ?auto_1600608 ?auto_1600609 )
      ( MAKE-1CRATE-VERIFY ?auto_1600608 ?auto_1600609 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1600619 - SURFACE
      ?auto_1600620 - SURFACE
      ?auto_1600621 - SURFACE
    )
    :vars
    (
      ?auto_1600629 - HOIST
      ?auto_1600624 - PLACE
      ?auto_1600628 - PLACE
      ?auto_1600623 - HOIST
      ?auto_1600627 - SURFACE
      ?auto_1600626 - SURFACE
      ?auto_1600625 - TRUCK
      ?auto_1600622 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600629 ?auto_1600624 ) ( IS-CRATE ?auto_1600621 ) ( not ( = ?auto_1600620 ?auto_1600621 ) ) ( not ( = ?auto_1600619 ?auto_1600620 ) ) ( not ( = ?auto_1600619 ?auto_1600621 ) ) ( not ( = ?auto_1600628 ?auto_1600624 ) ) ( HOIST-AT ?auto_1600623 ?auto_1600628 ) ( not ( = ?auto_1600629 ?auto_1600623 ) ) ( SURFACE-AT ?auto_1600621 ?auto_1600628 ) ( ON ?auto_1600621 ?auto_1600627 ) ( CLEAR ?auto_1600621 ) ( not ( = ?auto_1600620 ?auto_1600627 ) ) ( not ( = ?auto_1600621 ?auto_1600627 ) ) ( not ( = ?auto_1600619 ?auto_1600627 ) ) ( IS-CRATE ?auto_1600620 ) ( AVAILABLE ?auto_1600623 ) ( SURFACE-AT ?auto_1600620 ?auto_1600628 ) ( ON ?auto_1600620 ?auto_1600626 ) ( CLEAR ?auto_1600620 ) ( not ( = ?auto_1600620 ?auto_1600626 ) ) ( not ( = ?auto_1600621 ?auto_1600626 ) ) ( not ( = ?auto_1600619 ?auto_1600626 ) ) ( not ( = ?auto_1600627 ?auto_1600626 ) ) ( TRUCK-AT ?auto_1600625 ?auto_1600624 ) ( SURFACE-AT ?auto_1600622 ?auto_1600624 ) ( CLEAR ?auto_1600622 ) ( LIFTING ?auto_1600629 ?auto_1600619 ) ( IS-CRATE ?auto_1600619 ) ( not ( = ?auto_1600622 ?auto_1600619 ) ) ( not ( = ?auto_1600620 ?auto_1600622 ) ) ( not ( = ?auto_1600621 ?auto_1600622 ) ) ( not ( = ?auto_1600627 ?auto_1600622 ) ) ( not ( = ?auto_1600626 ?auto_1600622 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1600620 ?auto_1600621 )
      ( MAKE-2CRATE-VERIFY ?auto_1600619 ?auto_1600620 ?auto_1600621 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1600630 - SURFACE
      ?auto_1600631 - SURFACE
      ?auto_1600632 - SURFACE
      ?auto_1600633 - SURFACE
    )
    :vars
    (
      ?auto_1600634 - HOIST
      ?auto_1600639 - PLACE
      ?auto_1600640 - PLACE
      ?auto_1600635 - HOIST
      ?auto_1600638 - SURFACE
      ?auto_1600636 - SURFACE
      ?auto_1600637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600634 ?auto_1600639 ) ( IS-CRATE ?auto_1600633 ) ( not ( = ?auto_1600632 ?auto_1600633 ) ) ( not ( = ?auto_1600631 ?auto_1600632 ) ) ( not ( = ?auto_1600631 ?auto_1600633 ) ) ( not ( = ?auto_1600640 ?auto_1600639 ) ) ( HOIST-AT ?auto_1600635 ?auto_1600640 ) ( not ( = ?auto_1600634 ?auto_1600635 ) ) ( SURFACE-AT ?auto_1600633 ?auto_1600640 ) ( ON ?auto_1600633 ?auto_1600638 ) ( CLEAR ?auto_1600633 ) ( not ( = ?auto_1600632 ?auto_1600638 ) ) ( not ( = ?auto_1600633 ?auto_1600638 ) ) ( not ( = ?auto_1600631 ?auto_1600638 ) ) ( IS-CRATE ?auto_1600632 ) ( AVAILABLE ?auto_1600635 ) ( SURFACE-AT ?auto_1600632 ?auto_1600640 ) ( ON ?auto_1600632 ?auto_1600636 ) ( CLEAR ?auto_1600632 ) ( not ( = ?auto_1600632 ?auto_1600636 ) ) ( not ( = ?auto_1600633 ?auto_1600636 ) ) ( not ( = ?auto_1600631 ?auto_1600636 ) ) ( not ( = ?auto_1600638 ?auto_1600636 ) ) ( TRUCK-AT ?auto_1600637 ?auto_1600639 ) ( SURFACE-AT ?auto_1600630 ?auto_1600639 ) ( CLEAR ?auto_1600630 ) ( LIFTING ?auto_1600634 ?auto_1600631 ) ( IS-CRATE ?auto_1600631 ) ( not ( = ?auto_1600630 ?auto_1600631 ) ) ( not ( = ?auto_1600632 ?auto_1600630 ) ) ( not ( = ?auto_1600633 ?auto_1600630 ) ) ( not ( = ?auto_1600638 ?auto_1600630 ) ) ( not ( = ?auto_1600636 ?auto_1600630 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600631 ?auto_1600632 ?auto_1600633 )
      ( MAKE-3CRATE-VERIFY ?auto_1600630 ?auto_1600631 ?auto_1600632 ?auto_1600633 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1600641 - SURFACE
      ?auto_1600642 - SURFACE
      ?auto_1600643 - SURFACE
      ?auto_1600644 - SURFACE
      ?auto_1600645 - SURFACE
    )
    :vars
    (
      ?auto_1600646 - HOIST
      ?auto_1600651 - PLACE
      ?auto_1600652 - PLACE
      ?auto_1600647 - HOIST
      ?auto_1600650 - SURFACE
      ?auto_1600648 - SURFACE
      ?auto_1600649 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600646 ?auto_1600651 ) ( IS-CRATE ?auto_1600645 ) ( not ( = ?auto_1600644 ?auto_1600645 ) ) ( not ( = ?auto_1600643 ?auto_1600644 ) ) ( not ( = ?auto_1600643 ?auto_1600645 ) ) ( not ( = ?auto_1600652 ?auto_1600651 ) ) ( HOIST-AT ?auto_1600647 ?auto_1600652 ) ( not ( = ?auto_1600646 ?auto_1600647 ) ) ( SURFACE-AT ?auto_1600645 ?auto_1600652 ) ( ON ?auto_1600645 ?auto_1600650 ) ( CLEAR ?auto_1600645 ) ( not ( = ?auto_1600644 ?auto_1600650 ) ) ( not ( = ?auto_1600645 ?auto_1600650 ) ) ( not ( = ?auto_1600643 ?auto_1600650 ) ) ( IS-CRATE ?auto_1600644 ) ( AVAILABLE ?auto_1600647 ) ( SURFACE-AT ?auto_1600644 ?auto_1600652 ) ( ON ?auto_1600644 ?auto_1600648 ) ( CLEAR ?auto_1600644 ) ( not ( = ?auto_1600644 ?auto_1600648 ) ) ( not ( = ?auto_1600645 ?auto_1600648 ) ) ( not ( = ?auto_1600643 ?auto_1600648 ) ) ( not ( = ?auto_1600650 ?auto_1600648 ) ) ( TRUCK-AT ?auto_1600649 ?auto_1600651 ) ( SURFACE-AT ?auto_1600642 ?auto_1600651 ) ( CLEAR ?auto_1600642 ) ( LIFTING ?auto_1600646 ?auto_1600643 ) ( IS-CRATE ?auto_1600643 ) ( not ( = ?auto_1600642 ?auto_1600643 ) ) ( not ( = ?auto_1600644 ?auto_1600642 ) ) ( not ( = ?auto_1600645 ?auto_1600642 ) ) ( not ( = ?auto_1600650 ?auto_1600642 ) ) ( not ( = ?auto_1600648 ?auto_1600642 ) ) ( ON ?auto_1600642 ?auto_1600641 ) ( not ( = ?auto_1600641 ?auto_1600642 ) ) ( not ( = ?auto_1600641 ?auto_1600643 ) ) ( not ( = ?auto_1600641 ?auto_1600644 ) ) ( not ( = ?auto_1600641 ?auto_1600645 ) ) ( not ( = ?auto_1600641 ?auto_1600650 ) ) ( not ( = ?auto_1600641 ?auto_1600648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600643 ?auto_1600644 ?auto_1600645 )
      ( MAKE-4CRATE-VERIFY ?auto_1600641 ?auto_1600642 ?auto_1600643 ?auto_1600644 ?auto_1600645 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1600653 - SURFACE
      ?auto_1600654 - SURFACE
      ?auto_1600655 - SURFACE
      ?auto_1600656 - SURFACE
      ?auto_1600657 - SURFACE
      ?auto_1600658 - SURFACE
    )
    :vars
    (
      ?auto_1600659 - HOIST
      ?auto_1600664 - PLACE
      ?auto_1600665 - PLACE
      ?auto_1600660 - HOIST
      ?auto_1600663 - SURFACE
      ?auto_1600661 - SURFACE
      ?auto_1600662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600659 ?auto_1600664 ) ( IS-CRATE ?auto_1600658 ) ( not ( = ?auto_1600657 ?auto_1600658 ) ) ( not ( = ?auto_1600656 ?auto_1600657 ) ) ( not ( = ?auto_1600656 ?auto_1600658 ) ) ( not ( = ?auto_1600665 ?auto_1600664 ) ) ( HOIST-AT ?auto_1600660 ?auto_1600665 ) ( not ( = ?auto_1600659 ?auto_1600660 ) ) ( SURFACE-AT ?auto_1600658 ?auto_1600665 ) ( ON ?auto_1600658 ?auto_1600663 ) ( CLEAR ?auto_1600658 ) ( not ( = ?auto_1600657 ?auto_1600663 ) ) ( not ( = ?auto_1600658 ?auto_1600663 ) ) ( not ( = ?auto_1600656 ?auto_1600663 ) ) ( IS-CRATE ?auto_1600657 ) ( AVAILABLE ?auto_1600660 ) ( SURFACE-AT ?auto_1600657 ?auto_1600665 ) ( ON ?auto_1600657 ?auto_1600661 ) ( CLEAR ?auto_1600657 ) ( not ( = ?auto_1600657 ?auto_1600661 ) ) ( not ( = ?auto_1600658 ?auto_1600661 ) ) ( not ( = ?auto_1600656 ?auto_1600661 ) ) ( not ( = ?auto_1600663 ?auto_1600661 ) ) ( TRUCK-AT ?auto_1600662 ?auto_1600664 ) ( SURFACE-AT ?auto_1600655 ?auto_1600664 ) ( CLEAR ?auto_1600655 ) ( LIFTING ?auto_1600659 ?auto_1600656 ) ( IS-CRATE ?auto_1600656 ) ( not ( = ?auto_1600655 ?auto_1600656 ) ) ( not ( = ?auto_1600657 ?auto_1600655 ) ) ( not ( = ?auto_1600658 ?auto_1600655 ) ) ( not ( = ?auto_1600663 ?auto_1600655 ) ) ( not ( = ?auto_1600661 ?auto_1600655 ) ) ( ON ?auto_1600654 ?auto_1600653 ) ( ON ?auto_1600655 ?auto_1600654 ) ( not ( = ?auto_1600653 ?auto_1600654 ) ) ( not ( = ?auto_1600653 ?auto_1600655 ) ) ( not ( = ?auto_1600653 ?auto_1600656 ) ) ( not ( = ?auto_1600653 ?auto_1600657 ) ) ( not ( = ?auto_1600653 ?auto_1600658 ) ) ( not ( = ?auto_1600653 ?auto_1600663 ) ) ( not ( = ?auto_1600653 ?auto_1600661 ) ) ( not ( = ?auto_1600654 ?auto_1600655 ) ) ( not ( = ?auto_1600654 ?auto_1600656 ) ) ( not ( = ?auto_1600654 ?auto_1600657 ) ) ( not ( = ?auto_1600654 ?auto_1600658 ) ) ( not ( = ?auto_1600654 ?auto_1600663 ) ) ( not ( = ?auto_1600654 ?auto_1600661 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600656 ?auto_1600657 ?auto_1600658 )
      ( MAKE-5CRATE-VERIFY ?auto_1600653 ?auto_1600654 ?auto_1600655 ?auto_1600656 ?auto_1600657 ?auto_1600658 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1600666 - SURFACE
      ?auto_1600667 - SURFACE
      ?auto_1600668 - SURFACE
      ?auto_1600669 - SURFACE
      ?auto_1600670 - SURFACE
      ?auto_1600671 - SURFACE
      ?auto_1600672 - SURFACE
    )
    :vars
    (
      ?auto_1600673 - HOIST
      ?auto_1600678 - PLACE
      ?auto_1600679 - PLACE
      ?auto_1600674 - HOIST
      ?auto_1600677 - SURFACE
      ?auto_1600675 - SURFACE
      ?auto_1600676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1600673 ?auto_1600678 ) ( IS-CRATE ?auto_1600672 ) ( not ( = ?auto_1600671 ?auto_1600672 ) ) ( not ( = ?auto_1600670 ?auto_1600671 ) ) ( not ( = ?auto_1600670 ?auto_1600672 ) ) ( not ( = ?auto_1600679 ?auto_1600678 ) ) ( HOIST-AT ?auto_1600674 ?auto_1600679 ) ( not ( = ?auto_1600673 ?auto_1600674 ) ) ( SURFACE-AT ?auto_1600672 ?auto_1600679 ) ( ON ?auto_1600672 ?auto_1600677 ) ( CLEAR ?auto_1600672 ) ( not ( = ?auto_1600671 ?auto_1600677 ) ) ( not ( = ?auto_1600672 ?auto_1600677 ) ) ( not ( = ?auto_1600670 ?auto_1600677 ) ) ( IS-CRATE ?auto_1600671 ) ( AVAILABLE ?auto_1600674 ) ( SURFACE-AT ?auto_1600671 ?auto_1600679 ) ( ON ?auto_1600671 ?auto_1600675 ) ( CLEAR ?auto_1600671 ) ( not ( = ?auto_1600671 ?auto_1600675 ) ) ( not ( = ?auto_1600672 ?auto_1600675 ) ) ( not ( = ?auto_1600670 ?auto_1600675 ) ) ( not ( = ?auto_1600677 ?auto_1600675 ) ) ( TRUCK-AT ?auto_1600676 ?auto_1600678 ) ( SURFACE-AT ?auto_1600669 ?auto_1600678 ) ( CLEAR ?auto_1600669 ) ( LIFTING ?auto_1600673 ?auto_1600670 ) ( IS-CRATE ?auto_1600670 ) ( not ( = ?auto_1600669 ?auto_1600670 ) ) ( not ( = ?auto_1600671 ?auto_1600669 ) ) ( not ( = ?auto_1600672 ?auto_1600669 ) ) ( not ( = ?auto_1600677 ?auto_1600669 ) ) ( not ( = ?auto_1600675 ?auto_1600669 ) ) ( ON ?auto_1600667 ?auto_1600666 ) ( ON ?auto_1600668 ?auto_1600667 ) ( ON ?auto_1600669 ?auto_1600668 ) ( not ( = ?auto_1600666 ?auto_1600667 ) ) ( not ( = ?auto_1600666 ?auto_1600668 ) ) ( not ( = ?auto_1600666 ?auto_1600669 ) ) ( not ( = ?auto_1600666 ?auto_1600670 ) ) ( not ( = ?auto_1600666 ?auto_1600671 ) ) ( not ( = ?auto_1600666 ?auto_1600672 ) ) ( not ( = ?auto_1600666 ?auto_1600677 ) ) ( not ( = ?auto_1600666 ?auto_1600675 ) ) ( not ( = ?auto_1600667 ?auto_1600668 ) ) ( not ( = ?auto_1600667 ?auto_1600669 ) ) ( not ( = ?auto_1600667 ?auto_1600670 ) ) ( not ( = ?auto_1600667 ?auto_1600671 ) ) ( not ( = ?auto_1600667 ?auto_1600672 ) ) ( not ( = ?auto_1600667 ?auto_1600677 ) ) ( not ( = ?auto_1600667 ?auto_1600675 ) ) ( not ( = ?auto_1600668 ?auto_1600669 ) ) ( not ( = ?auto_1600668 ?auto_1600670 ) ) ( not ( = ?auto_1600668 ?auto_1600671 ) ) ( not ( = ?auto_1600668 ?auto_1600672 ) ) ( not ( = ?auto_1600668 ?auto_1600677 ) ) ( not ( = ?auto_1600668 ?auto_1600675 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1600670 ?auto_1600671 ?auto_1600672 )
      ( MAKE-6CRATE-VERIFY ?auto_1600666 ?auto_1600667 ?auto_1600668 ?auto_1600669 ?auto_1600670 ?auto_1600671 ?auto_1600672 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602252 - SURFACE
      ?auto_1602253 - SURFACE
      ?auto_1602254 - SURFACE
      ?auto_1602255 - SURFACE
      ?auto_1602256 - SURFACE
      ?auto_1602257 - SURFACE
      ?auto_1602258 - SURFACE
      ?auto_1602259 - SURFACE
    )
    :vars
    (
      ?auto_1602261 - HOIST
      ?auto_1602260 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602261 ?auto_1602260 ) ( SURFACE-AT ?auto_1602258 ?auto_1602260 ) ( CLEAR ?auto_1602258 ) ( LIFTING ?auto_1602261 ?auto_1602259 ) ( IS-CRATE ?auto_1602259 ) ( not ( = ?auto_1602258 ?auto_1602259 ) ) ( ON ?auto_1602253 ?auto_1602252 ) ( ON ?auto_1602254 ?auto_1602253 ) ( ON ?auto_1602255 ?auto_1602254 ) ( ON ?auto_1602256 ?auto_1602255 ) ( ON ?auto_1602257 ?auto_1602256 ) ( ON ?auto_1602258 ?auto_1602257 ) ( not ( = ?auto_1602252 ?auto_1602253 ) ) ( not ( = ?auto_1602252 ?auto_1602254 ) ) ( not ( = ?auto_1602252 ?auto_1602255 ) ) ( not ( = ?auto_1602252 ?auto_1602256 ) ) ( not ( = ?auto_1602252 ?auto_1602257 ) ) ( not ( = ?auto_1602252 ?auto_1602258 ) ) ( not ( = ?auto_1602252 ?auto_1602259 ) ) ( not ( = ?auto_1602253 ?auto_1602254 ) ) ( not ( = ?auto_1602253 ?auto_1602255 ) ) ( not ( = ?auto_1602253 ?auto_1602256 ) ) ( not ( = ?auto_1602253 ?auto_1602257 ) ) ( not ( = ?auto_1602253 ?auto_1602258 ) ) ( not ( = ?auto_1602253 ?auto_1602259 ) ) ( not ( = ?auto_1602254 ?auto_1602255 ) ) ( not ( = ?auto_1602254 ?auto_1602256 ) ) ( not ( = ?auto_1602254 ?auto_1602257 ) ) ( not ( = ?auto_1602254 ?auto_1602258 ) ) ( not ( = ?auto_1602254 ?auto_1602259 ) ) ( not ( = ?auto_1602255 ?auto_1602256 ) ) ( not ( = ?auto_1602255 ?auto_1602257 ) ) ( not ( = ?auto_1602255 ?auto_1602258 ) ) ( not ( = ?auto_1602255 ?auto_1602259 ) ) ( not ( = ?auto_1602256 ?auto_1602257 ) ) ( not ( = ?auto_1602256 ?auto_1602258 ) ) ( not ( = ?auto_1602256 ?auto_1602259 ) ) ( not ( = ?auto_1602257 ?auto_1602258 ) ) ( not ( = ?auto_1602257 ?auto_1602259 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1602258 ?auto_1602259 )
      ( MAKE-7CRATE-VERIFY ?auto_1602252 ?auto_1602253 ?auto_1602254 ?auto_1602255 ?auto_1602256 ?auto_1602257 ?auto_1602258 ?auto_1602259 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602307 - SURFACE
      ?auto_1602308 - SURFACE
      ?auto_1602309 - SURFACE
      ?auto_1602310 - SURFACE
      ?auto_1602311 - SURFACE
      ?auto_1602312 - SURFACE
      ?auto_1602313 - SURFACE
      ?auto_1602314 - SURFACE
    )
    :vars
    (
      ?auto_1602317 - HOIST
      ?auto_1602316 - PLACE
      ?auto_1602315 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602317 ?auto_1602316 ) ( SURFACE-AT ?auto_1602313 ?auto_1602316 ) ( CLEAR ?auto_1602313 ) ( IS-CRATE ?auto_1602314 ) ( not ( = ?auto_1602313 ?auto_1602314 ) ) ( TRUCK-AT ?auto_1602315 ?auto_1602316 ) ( AVAILABLE ?auto_1602317 ) ( IN ?auto_1602314 ?auto_1602315 ) ( ON ?auto_1602313 ?auto_1602312 ) ( not ( = ?auto_1602312 ?auto_1602313 ) ) ( not ( = ?auto_1602312 ?auto_1602314 ) ) ( ON ?auto_1602308 ?auto_1602307 ) ( ON ?auto_1602309 ?auto_1602308 ) ( ON ?auto_1602310 ?auto_1602309 ) ( ON ?auto_1602311 ?auto_1602310 ) ( ON ?auto_1602312 ?auto_1602311 ) ( not ( = ?auto_1602307 ?auto_1602308 ) ) ( not ( = ?auto_1602307 ?auto_1602309 ) ) ( not ( = ?auto_1602307 ?auto_1602310 ) ) ( not ( = ?auto_1602307 ?auto_1602311 ) ) ( not ( = ?auto_1602307 ?auto_1602312 ) ) ( not ( = ?auto_1602307 ?auto_1602313 ) ) ( not ( = ?auto_1602307 ?auto_1602314 ) ) ( not ( = ?auto_1602308 ?auto_1602309 ) ) ( not ( = ?auto_1602308 ?auto_1602310 ) ) ( not ( = ?auto_1602308 ?auto_1602311 ) ) ( not ( = ?auto_1602308 ?auto_1602312 ) ) ( not ( = ?auto_1602308 ?auto_1602313 ) ) ( not ( = ?auto_1602308 ?auto_1602314 ) ) ( not ( = ?auto_1602309 ?auto_1602310 ) ) ( not ( = ?auto_1602309 ?auto_1602311 ) ) ( not ( = ?auto_1602309 ?auto_1602312 ) ) ( not ( = ?auto_1602309 ?auto_1602313 ) ) ( not ( = ?auto_1602309 ?auto_1602314 ) ) ( not ( = ?auto_1602310 ?auto_1602311 ) ) ( not ( = ?auto_1602310 ?auto_1602312 ) ) ( not ( = ?auto_1602310 ?auto_1602313 ) ) ( not ( = ?auto_1602310 ?auto_1602314 ) ) ( not ( = ?auto_1602311 ?auto_1602312 ) ) ( not ( = ?auto_1602311 ?auto_1602313 ) ) ( not ( = ?auto_1602311 ?auto_1602314 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602312 ?auto_1602313 ?auto_1602314 )
      ( MAKE-7CRATE-VERIFY ?auto_1602307 ?auto_1602308 ?auto_1602309 ?auto_1602310 ?auto_1602311 ?auto_1602312 ?auto_1602313 ?auto_1602314 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602370 - SURFACE
      ?auto_1602371 - SURFACE
      ?auto_1602372 - SURFACE
      ?auto_1602373 - SURFACE
      ?auto_1602374 - SURFACE
      ?auto_1602375 - SURFACE
      ?auto_1602376 - SURFACE
      ?auto_1602377 - SURFACE
    )
    :vars
    (
      ?auto_1602381 - HOIST
      ?auto_1602378 - PLACE
      ?auto_1602379 - TRUCK
      ?auto_1602380 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602381 ?auto_1602378 ) ( SURFACE-AT ?auto_1602376 ?auto_1602378 ) ( CLEAR ?auto_1602376 ) ( IS-CRATE ?auto_1602377 ) ( not ( = ?auto_1602376 ?auto_1602377 ) ) ( AVAILABLE ?auto_1602381 ) ( IN ?auto_1602377 ?auto_1602379 ) ( ON ?auto_1602376 ?auto_1602375 ) ( not ( = ?auto_1602375 ?auto_1602376 ) ) ( not ( = ?auto_1602375 ?auto_1602377 ) ) ( TRUCK-AT ?auto_1602379 ?auto_1602380 ) ( not ( = ?auto_1602380 ?auto_1602378 ) ) ( ON ?auto_1602371 ?auto_1602370 ) ( ON ?auto_1602372 ?auto_1602371 ) ( ON ?auto_1602373 ?auto_1602372 ) ( ON ?auto_1602374 ?auto_1602373 ) ( ON ?auto_1602375 ?auto_1602374 ) ( not ( = ?auto_1602370 ?auto_1602371 ) ) ( not ( = ?auto_1602370 ?auto_1602372 ) ) ( not ( = ?auto_1602370 ?auto_1602373 ) ) ( not ( = ?auto_1602370 ?auto_1602374 ) ) ( not ( = ?auto_1602370 ?auto_1602375 ) ) ( not ( = ?auto_1602370 ?auto_1602376 ) ) ( not ( = ?auto_1602370 ?auto_1602377 ) ) ( not ( = ?auto_1602371 ?auto_1602372 ) ) ( not ( = ?auto_1602371 ?auto_1602373 ) ) ( not ( = ?auto_1602371 ?auto_1602374 ) ) ( not ( = ?auto_1602371 ?auto_1602375 ) ) ( not ( = ?auto_1602371 ?auto_1602376 ) ) ( not ( = ?auto_1602371 ?auto_1602377 ) ) ( not ( = ?auto_1602372 ?auto_1602373 ) ) ( not ( = ?auto_1602372 ?auto_1602374 ) ) ( not ( = ?auto_1602372 ?auto_1602375 ) ) ( not ( = ?auto_1602372 ?auto_1602376 ) ) ( not ( = ?auto_1602372 ?auto_1602377 ) ) ( not ( = ?auto_1602373 ?auto_1602374 ) ) ( not ( = ?auto_1602373 ?auto_1602375 ) ) ( not ( = ?auto_1602373 ?auto_1602376 ) ) ( not ( = ?auto_1602373 ?auto_1602377 ) ) ( not ( = ?auto_1602374 ?auto_1602375 ) ) ( not ( = ?auto_1602374 ?auto_1602376 ) ) ( not ( = ?auto_1602374 ?auto_1602377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602375 ?auto_1602376 ?auto_1602377 )
      ( MAKE-7CRATE-VERIFY ?auto_1602370 ?auto_1602371 ?auto_1602372 ?auto_1602373 ?auto_1602374 ?auto_1602375 ?auto_1602376 ?auto_1602377 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602440 - SURFACE
      ?auto_1602441 - SURFACE
      ?auto_1602442 - SURFACE
      ?auto_1602443 - SURFACE
      ?auto_1602444 - SURFACE
      ?auto_1602445 - SURFACE
      ?auto_1602446 - SURFACE
      ?auto_1602447 - SURFACE
    )
    :vars
    (
      ?auto_1602448 - HOIST
      ?auto_1602452 - PLACE
      ?auto_1602449 - TRUCK
      ?auto_1602451 - PLACE
      ?auto_1602450 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602448 ?auto_1602452 ) ( SURFACE-AT ?auto_1602446 ?auto_1602452 ) ( CLEAR ?auto_1602446 ) ( IS-CRATE ?auto_1602447 ) ( not ( = ?auto_1602446 ?auto_1602447 ) ) ( AVAILABLE ?auto_1602448 ) ( ON ?auto_1602446 ?auto_1602445 ) ( not ( = ?auto_1602445 ?auto_1602446 ) ) ( not ( = ?auto_1602445 ?auto_1602447 ) ) ( TRUCK-AT ?auto_1602449 ?auto_1602451 ) ( not ( = ?auto_1602451 ?auto_1602452 ) ) ( HOIST-AT ?auto_1602450 ?auto_1602451 ) ( LIFTING ?auto_1602450 ?auto_1602447 ) ( not ( = ?auto_1602448 ?auto_1602450 ) ) ( ON ?auto_1602441 ?auto_1602440 ) ( ON ?auto_1602442 ?auto_1602441 ) ( ON ?auto_1602443 ?auto_1602442 ) ( ON ?auto_1602444 ?auto_1602443 ) ( ON ?auto_1602445 ?auto_1602444 ) ( not ( = ?auto_1602440 ?auto_1602441 ) ) ( not ( = ?auto_1602440 ?auto_1602442 ) ) ( not ( = ?auto_1602440 ?auto_1602443 ) ) ( not ( = ?auto_1602440 ?auto_1602444 ) ) ( not ( = ?auto_1602440 ?auto_1602445 ) ) ( not ( = ?auto_1602440 ?auto_1602446 ) ) ( not ( = ?auto_1602440 ?auto_1602447 ) ) ( not ( = ?auto_1602441 ?auto_1602442 ) ) ( not ( = ?auto_1602441 ?auto_1602443 ) ) ( not ( = ?auto_1602441 ?auto_1602444 ) ) ( not ( = ?auto_1602441 ?auto_1602445 ) ) ( not ( = ?auto_1602441 ?auto_1602446 ) ) ( not ( = ?auto_1602441 ?auto_1602447 ) ) ( not ( = ?auto_1602442 ?auto_1602443 ) ) ( not ( = ?auto_1602442 ?auto_1602444 ) ) ( not ( = ?auto_1602442 ?auto_1602445 ) ) ( not ( = ?auto_1602442 ?auto_1602446 ) ) ( not ( = ?auto_1602442 ?auto_1602447 ) ) ( not ( = ?auto_1602443 ?auto_1602444 ) ) ( not ( = ?auto_1602443 ?auto_1602445 ) ) ( not ( = ?auto_1602443 ?auto_1602446 ) ) ( not ( = ?auto_1602443 ?auto_1602447 ) ) ( not ( = ?auto_1602444 ?auto_1602445 ) ) ( not ( = ?auto_1602444 ?auto_1602446 ) ) ( not ( = ?auto_1602444 ?auto_1602447 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602445 ?auto_1602446 ?auto_1602447 )
      ( MAKE-7CRATE-VERIFY ?auto_1602440 ?auto_1602441 ?auto_1602442 ?auto_1602443 ?auto_1602444 ?auto_1602445 ?auto_1602446 ?auto_1602447 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602517 - SURFACE
      ?auto_1602518 - SURFACE
      ?auto_1602519 - SURFACE
      ?auto_1602520 - SURFACE
      ?auto_1602521 - SURFACE
      ?auto_1602522 - SURFACE
      ?auto_1602523 - SURFACE
      ?auto_1602524 - SURFACE
    )
    :vars
    (
      ?auto_1602528 - HOIST
      ?auto_1602527 - PLACE
      ?auto_1602526 - TRUCK
      ?auto_1602525 - PLACE
      ?auto_1602530 - HOIST
      ?auto_1602529 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602528 ?auto_1602527 ) ( SURFACE-AT ?auto_1602523 ?auto_1602527 ) ( CLEAR ?auto_1602523 ) ( IS-CRATE ?auto_1602524 ) ( not ( = ?auto_1602523 ?auto_1602524 ) ) ( AVAILABLE ?auto_1602528 ) ( ON ?auto_1602523 ?auto_1602522 ) ( not ( = ?auto_1602522 ?auto_1602523 ) ) ( not ( = ?auto_1602522 ?auto_1602524 ) ) ( TRUCK-AT ?auto_1602526 ?auto_1602525 ) ( not ( = ?auto_1602525 ?auto_1602527 ) ) ( HOIST-AT ?auto_1602530 ?auto_1602525 ) ( not ( = ?auto_1602528 ?auto_1602530 ) ) ( AVAILABLE ?auto_1602530 ) ( SURFACE-AT ?auto_1602524 ?auto_1602525 ) ( ON ?auto_1602524 ?auto_1602529 ) ( CLEAR ?auto_1602524 ) ( not ( = ?auto_1602523 ?auto_1602529 ) ) ( not ( = ?auto_1602524 ?auto_1602529 ) ) ( not ( = ?auto_1602522 ?auto_1602529 ) ) ( ON ?auto_1602518 ?auto_1602517 ) ( ON ?auto_1602519 ?auto_1602518 ) ( ON ?auto_1602520 ?auto_1602519 ) ( ON ?auto_1602521 ?auto_1602520 ) ( ON ?auto_1602522 ?auto_1602521 ) ( not ( = ?auto_1602517 ?auto_1602518 ) ) ( not ( = ?auto_1602517 ?auto_1602519 ) ) ( not ( = ?auto_1602517 ?auto_1602520 ) ) ( not ( = ?auto_1602517 ?auto_1602521 ) ) ( not ( = ?auto_1602517 ?auto_1602522 ) ) ( not ( = ?auto_1602517 ?auto_1602523 ) ) ( not ( = ?auto_1602517 ?auto_1602524 ) ) ( not ( = ?auto_1602517 ?auto_1602529 ) ) ( not ( = ?auto_1602518 ?auto_1602519 ) ) ( not ( = ?auto_1602518 ?auto_1602520 ) ) ( not ( = ?auto_1602518 ?auto_1602521 ) ) ( not ( = ?auto_1602518 ?auto_1602522 ) ) ( not ( = ?auto_1602518 ?auto_1602523 ) ) ( not ( = ?auto_1602518 ?auto_1602524 ) ) ( not ( = ?auto_1602518 ?auto_1602529 ) ) ( not ( = ?auto_1602519 ?auto_1602520 ) ) ( not ( = ?auto_1602519 ?auto_1602521 ) ) ( not ( = ?auto_1602519 ?auto_1602522 ) ) ( not ( = ?auto_1602519 ?auto_1602523 ) ) ( not ( = ?auto_1602519 ?auto_1602524 ) ) ( not ( = ?auto_1602519 ?auto_1602529 ) ) ( not ( = ?auto_1602520 ?auto_1602521 ) ) ( not ( = ?auto_1602520 ?auto_1602522 ) ) ( not ( = ?auto_1602520 ?auto_1602523 ) ) ( not ( = ?auto_1602520 ?auto_1602524 ) ) ( not ( = ?auto_1602520 ?auto_1602529 ) ) ( not ( = ?auto_1602521 ?auto_1602522 ) ) ( not ( = ?auto_1602521 ?auto_1602523 ) ) ( not ( = ?auto_1602521 ?auto_1602524 ) ) ( not ( = ?auto_1602521 ?auto_1602529 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602522 ?auto_1602523 ?auto_1602524 )
      ( MAKE-7CRATE-VERIFY ?auto_1602517 ?auto_1602518 ?auto_1602519 ?auto_1602520 ?auto_1602521 ?auto_1602522 ?auto_1602523 ?auto_1602524 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602595 - SURFACE
      ?auto_1602596 - SURFACE
      ?auto_1602597 - SURFACE
      ?auto_1602598 - SURFACE
      ?auto_1602599 - SURFACE
      ?auto_1602600 - SURFACE
      ?auto_1602601 - SURFACE
      ?auto_1602602 - SURFACE
    )
    :vars
    (
      ?auto_1602608 - HOIST
      ?auto_1602607 - PLACE
      ?auto_1602605 - PLACE
      ?auto_1602606 - HOIST
      ?auto_1602603 - SURFACE
      ?auto_1602604 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602608 ?auto_1602607 ) ( SURFACE-AT ?auto_1602601 ?auto_1602607 ) ( CLEAR ?auto_1602601 ) ( IS-CRATE ?auto_1602602 ) ( not ( = ?auto_1602601 ?auto_1602602 ) ) ( AVAILABLE ?auto_1602608 ) ( ON ?auto_1602601 ?auto_1602600 ) ( not ( = ?auto_1602600 ?auto_1602601 ) ) ( not ( = ?auto_1602600 ?auto_1602602 ) ) ( not ( = ?auto_1602605 ?auto_1602607 ) ) ( HOIST-AT ?auto_1602606 ?auto_1602605 ) ( not ( = ?auto_1602608 ?auto_1602606 ) ) ( AVAILABLE ?auto_1602606 ) ( SURFACE-AT ?auto_1602602 ?auto_1602605 ) ( ON ?auto_1602602 ?auto_1602603 ) ( CLEAR ?auto_1602602 ) ( not ( = ?auto_1602601 ?auto_1602603 ) ) ( not ( = ?auto_1602602 ?auto_1602603 ) ) ( not ( = ?auto_1602600 ?auto_1602603 ) ) ( TRUCK-AT ?auto_1602604 ?auto_1602607 ) ( ON ?auto_1602596 ?auto_1602595 ) ( ON ?auto_1602597 ?auto_1602596 ) ( ON ?auto_1602598 ?auto_1602597 ) ( ON ?auto_1602599 ?auto_1602598 ) ( ON ?auto_1602600 ?auto_1602599 ) ( not ( = ?auto_1602595 ?auto_1602596 ) ) ( not ( = ?auto_1602595 ?auto_1602597 ) ) ( not ( = ?auto_1602595 ?auto_1602598 ) ) ( not ( = ?auto_1602595 ?auto_1602599 ) ) ( not ( = ?auto_1602595 ?auto_1602600 ) ) ( not ( = ?auto_1602595 ?auto_1602601 ) ) ( not ( = ?auto_1602595 ?auto_1602602 ) ) ( not ( = ?auto_1602595 ?auto_1602603 ) ) ( not ( = ?auto_1602596 ?auto_1602597 ) ) ( not ( = ?auto_1602596 ?auto_1602598 ) ) ( not ( = ?auto_1602596 ?auto_1602599 ) ) ( not ( = ?auto_1602596 ?auto_1602600 ) ) ( not ( = ?auto_1602596 ?auto_1602601 ) ) ( not ( = ?auto_1602596 ?auto_1602602 ) ) ( not ( = ?auto_1602596 ?auto_1602603 ) ) ( not ( = ?auto_1602597 ?auto_1602598 ) ) ( not ( = ?auto_1602597 ?auto_1602599 ) ) ( not ( = ?auto_1602597 ?auto_1602600 ) ) ( not ( = ?auto_1602597 ?auto_1602601 ) ) ( not ( = ?auto_1602597 ?auto_1602602 ) ) ( not ( = ?auto_1602597 ?auto_1602603 ) ) ( not ( = ?auto_1602598 ?auto_1602599 ) ) ( not ( = ?auto_1602598 ?auto_1602600 ) ) ( not ( = ?auto_1602598 ?auto_1602601 ) ) ( not ( = ?auto_1602598 ?auto_1602602 ) ) ( not ( = ?auto_1602598 ?auto_1602603 ) ) ( not ( = ?auto_1602599 ?auto_1602600 ) ) ( not ( = ?auto_1602599 ?auto_1602601 ) ) ( not ( = ?auto_1602599 ?auto_1602602 ) ) ( not ( = ?auto_1602599 ?auto_1602603 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602600 ?auto_1602601 ?auto_1602602 )
      ( MAKE-7CRATE-VERIFY ?auto_1602595 ?auto_1602596 ?auto_1602597 ?auto_1602598 ?auto_1602599 ?auto_1602600 ?auto_1602601 ?auto_1602602 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602673 - SURFACE
      ?auto_1602674 - SURFACE
      ?auto_1602675 - SURFACE
      ?auto_1602676 - SURFACE
      ?auto_1602677 - SURFACE
      ?auto_1602678 - SURFACE
      ?auto_1602679 - SURFACE
      ?auto_1602680 - SURFACE
    )
    :vars
    (
      ?auto_1602681 - HOIST
      ?auto_1602685 - PLACE
      ?auto_1602683 - PLACE
      ?auto_1602686 - HOIST
      ?auto_1602682 - SURFACE
      ?auto_1602684 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602681 ?auto_1602685 ) ( IS-CRATE ?auto_1602680 ) ( not ( = ?auto_1602679 ?auto_1602680 ) ) ( not ( = ?auto_1602678 ?auto_1602679 ) ) ( not ( = ?auto_1602678 ?auto_1602680 ) ) ( not ( = ?auto_1602683 ?auto_1602685 ) ) ( HOIST-AT ?auto_1602686 ?auto_1602683 ) ( not ( = ?auto_1602681 ?auto_1602686 ) ) ( AVAILABLE ?auto_1602686 ) ( SURFACE-AT ?auto_1602680 ?auto_1602683 ) ( ON ?auto_1602680 ?auto_1602682 ) ( CLEAR ?auto_1602680 ) ( not ( = ?auto_1602679 ?auto_1602682 ) ) ( not ( = ?auto_1602680 ?auto_1602682 ) ) ( not ( = ?auto_1602678 ?auto_1602682 ) ) ( TRUCK-AT ?auto_1602684 ?auto_1602685 ) ( SURFACE-AT ?auto_1602678 ?auto_1602685 ) ( CLEAR ?auto_1602678 ) ( LIFTING ?auto_1602681 ?auto_1602679 ) ( IS-CRATE ?auto_1602679 ) ( ON ?auto_1602674 ?auto_1602673 ) ( ON ?auto_1602675 ?auto_1602674 ) ( ON ?auto_1602676 ?auto_1602675 ) ( ON ?auto_1602677 ?auto_1602676 ) ( ON ?auto_1602678 ?auto_1602677 ) ( not ( = ?auto_1602673 ?auto_1602674 ) ) ( not ( = ?auto_1602673 ?auto_1602675 ) ) ( not ( = ?auto_1602673 ?auto_1602676 ) ) ( not ( = ?auto_1602673 ?auto_1602677 ) ) ( not ( = ?auto_1602673 ?auto_1602678 ) ) ( not ( = ?auto_1602673 ?auto_1602679 ) ) ( not ( = ?auto_1602673 ?auto_1602680 ) ) ( not ( = ?auto_1602673 ?auto_1602682 ) ) ( not ( = ?auto_1602674 ?auto_1602675 ) ) ( not ( = ?auto_1602674 ?auto_1602676 ) ) ( not ( = ?auto_1602674 ?auto_1602677 ) ) ( not ( = ?auto_1602674 ?auto_1602678 ) ) ( not ( = ?auto_1602674 ?auto_1602679 ) ) ( not ( = ?auto_1602674 ?auto_1602680 ) ) ( not ( = ?auto_1602674 ?auto_1602682 ) ) ( not ( = ?auto_1602675 ?auto_1602676 ) ) ( not ( = ?auto_1602675 ?auto_1602677 ) ) ( not ( = ?auto_1602675 ?auto_1602678 ) ) ( not ( = ?auto_1602675 ?auto_1602679 ) ) ( not ( = ?auto_1602675 ?auto_1602680 ) ) ( not ( = ?auto_1602675 ?auto_1602682 ) ) ( not ( = ?auto_1602676 ?auto_1602677 ) ) ( not ( = ?auto_1602676 ?auto_1602678 ) ) ( not ( = ?auto_1602676 ?auto_1602679 ) ) ( not ( = ?auto_1602676 ?auto_1602680 ) ) ( not ( = ?auto_1602676 ?auto_1602682 ) ) ( not ( = ?auto_1602677 ?auto_1602678 ) ) ( not ( = ?auto_1602677 ?auto_1602679 ) ) ( not ( = ?auto_1602677 ?auto_1602680 ) ) ( not ( = ?auto_1602677 ?auto_1602682 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602678 ?auto_1602679 ?auto_1602680 )
      ( MAKE-7CRATE-VERIFY ?auto_1602673 ?auto_1602674 ?auto_1602675 ?auto_1602676 ?auto_1602677 ?auto_1602678 ?auto_1602679 ?auto_1602680 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1602751 - SURFACE
      ?auto_1602752 - SURFACE
      ?auto_1602753 - SURFACE
      ?auto_1602754 - SURFACE
      ?auto_1602755 - SURFACE
      ?auto_1602756 - SURFACE
      ?auto_1602757 - SURFACE
      ?auto_1602758 - SURFACE
    )
    :vars
    (
      ?auto_1602764 - HOIST
      ?auto_1602763 - PLACE
      ?auto_1602760 - PLACE
      ?auto_1602759 - HOIST
      ?auto_1602762 - SURFACE
      ?auto_1602761 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1602764 ?auto_1602763 ) ( IS-CRATE ?auto_1602758 ) ( not ( = ?auto_1602757 ?auto_1602758 ) ) ( not ( = ?auto_1602756 ?auto_1602757 ) ) ( not ( = ?auto_1602756 ?auto_1602758 ) ) ( not ( = ?auto_1602760 ?auto_1602763 ) ) ( HOIST-AT ?auto_1602759 ?auto_1602760 ) ( not ( = ?auto_1602764 ?auto_1602759 ) ) ( AVAILABLE ?auto_1602759 ) ( SURFACE-AT ?auto_1602758 ?auto_1602760 ) ( ON ?auto_1602758 ?auto_1602762 ) ( CLEAR ?auto_1602758 ) ( not ( = ?auto_1602757 ?auto_1602762 ) ) ( not ( = ?auto_1602758 ?auto_1602762 ) ) ( not ( = ?auto_1602756 ?auto_1602762 ) ) ( TRUCK-AT ?auto_1602761 ?auto_1602763 ) ( SURFACE-AT ?auto_1602756 ?auto_1602763 ) ( CLEAR ?auto_1602756 ) ( IS-CRATE ?auto_1602757 ) ( AVAILABLE ?auto_1602764 ) ( IN ?auto_1602757 ?auto_1602761 ) ( ON ?auto_1602752 ?auto_1602751 ) ( ON ?auto_1602753 ?auto_1602752 ) ( ON ?auto_1602754 ?auto_1602753 ) ( ON ?auto_1602755 ?auto_1602754 ) ( ON ?auto_1602756 ?auto_1602755 ) ( not ( = ?auto_1602751 ?auto_1602752 ) ) ( not ( = ?auto_1602751 ?auto_1602753 ) ) ( not ( = ?auto_1602751 ?auto_1602754 ) ) ( not ( = ?auto_1602751 ?auto_1602755 ) ) ( not ( = ?auto_1602751 ?auto_1602756 ) ) ( not ( = ?auto_1602751 ?auto_1602757 ) ) ( not ( = ?auto_1602751 ?auto_1602758 ) ) ( not ( = ?auto_1602751 ?auto_1602762 ) ) ( not ( = ?auto_1602752 ?auto_1602753 ) ) ( not ( = ?auto_1602752 ?auto_1602754 ) ) ( not ( = ?auto_1602752 ?auto_1602755 ) ) ( not ( = ?auto_1602752 ?auto_1602756 ) ) ( not ( = ?auto_1602752 ?auto_1602757 ) ) ( not ( = ?auto_1602752 ?auto_1602758 ) ) ( not ( = ?auto_1602752 ?auto_1602762 ) ) ( not ( = ?auto_1602753 ?auto_1602754 ) ) ( not ( = ?auto_1602753 ?auto_1602755 ) ) ( not ( = ?auto_1602753 ?auto_1602756 ) ) ( not ( = ?auto_1602753 ?auto_1602757 ) ) ( not ( = ?auto_1602753 ?auto_1602758 ) ) ( not ( = ?auto_1602753 ?auto_1602762 ) ) ( not ( = ?auto_1602754 ?auto_1602755 ) ) ( not ( = ?auto_1602754 ?auto_1602756 ) ) ( not ( = ?auto_1602754 ?auto_1602757 ) ) ( not ( = ?auto_1602754 ?auto_1602758 ) ) ( not ( = ?auto_1602754 ?auto_1602762 ) ) ( not ( = ?auto_1602755 ?auto_1602756 ) ) ( not ( = ?auto_1602755 ?auto_1602757 ) ) ( not ( = ?auto_1602755 ?auto_1602758 ) ) ( not ( = ?auto_1602755 ?auto_1602762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1602756 ?auto_1602757 ?auto_1602758 )
      ( MAKE-7CRATE-VERIFY ?auto_1602751 ?auto_1602752 ?auto_1602753 ?auto_1602754 ?auto_1602755 ?auto_1602756 ?auto_1602757 ?auto_1602758 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1603330 - SURFACE
      ?auto_1603331 - SURFACE
    )
    :vars
    (
      ?auto_1603337 - HOIST
      ?auto_1603332 - PLACE
      ?auto_1603333 - SURFACE
      ?auto_1603336 - PLACE
      ?auto_1603334 - HOIST
      ?auto_1603335 - SURFACE
      ?auto_1603338 - TRUCK
      ?auto_1603339 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1603337 ?auto_1603332 ) ( SURFACE-AT ?auto_1603330 ?auto_1603332 ) ( CLEAR ?auto_1603330 ) ( IS-CRATE ?auto_1603331 ) ( not ( = ?auto_1603330 ?auto_1603331 ) ) ( ON ?auto_1603330 ?auto_1603333 ) ( not ( = ?auto_1603333 ?auto_1603330 ) ) ( not ( = ?auto_1603333 ?auto_1603331 ) ) ( not ( = ?auto_1603336 ?auto_1603332 ) ) ( HOIST-AT ?auto_1603334 ?auto_1603336 ) ( not ( = ?auto_1603337 ?auto_1603334 ) ) ( AVAILABLE ?auto_1603334 ) ( SURFACE-AT ?auto_1603331 ?auto_1603336 ) ( ON ?auto_1603331 ?auto_1603335 ) ( CLEAR ?auto_1603331 ) ( not ( = ?auto_1603330 ?auto_1603335 ) ) ( not ( = ?auto_1603331 ?auto_1603335 ) ) ( not ( = ?auto_1603333 ?auto_1603335 ) ) ( TRUCK-AT ?auto_1603338 ?auto_1603332 ) ( LIFTING ?auto_1603337 ?auto_1603339 ) ( IS-CRATE ?auto_1603339 ) ( not ( = ?auto_1603330 ?auto_1603339 ) ) ( not ( = ?auto_1603331 ?auto_1603339 ) ) ( not ( = ?auto_1603333 ?auto_1603339 ) ) ( not ( = ?auto_1603335 ?auto_1603339 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1603337 ?auto_1603339 ?auto_1603338 ?auto_1603332 )
      ( MAKE-1CRATE ?auto_1603330 ?auto_1603331 )
      ( MAKE-1CRATE-VERIFY ?auto_1603330 ?auto_1603331 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1604814 - SURFACE
      ?auto_1604815 - SURFACE
    )
    :vars
    (
      ?auto_1604821 - HOIST
      ?auto_1604818 - PLACE
      ?auto_1604819 - SURFACE
      ?auto_1604820 - TRUCK
      ?auto_1604822 - PLACE
      ?auto_1604816 - HOIST
      ?auto_1604817 - SURFACE
      ?auto_1604823 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604821 ?auto_1604818 ) ( SURFACE-AT ?auto_1604814 ?auto_1604818 ) ( CLEAR ?auto_1604814 ) ( IS-CRATE ?auto_1604815 ) ( not ( = ?auto_1604814 ?auto_1604815 ) ) ( AVAILABLE ?auto_1604821 ) ( ON ?auto_1604814 ?auto_1604819 ) ( not ( = ?auto_1604819 ?auto_1604814 ) ) ( not ( = ?auto_1604819 ?auto_1604815 ) ) ( TRUCK-AT ?auto_1604820 ?auto_1604822 ) ( not ( = ?auto_1604822 ?auto_1604818 ) ) ( HOIST-AT ?auto_1604816 ?auto_1604822 ) ( not ( = ?auto_1604821 ?auto_1604816 ) ) ( SURFACE-AT ?auto_1604815 ?auto_1604822 ) ( ON ?auto_1604815 ?auto_1604817 ) ( CLEAR ?auto_1604815 ) ( not ( = ?auto_1604814 ?auto_1604817 ) ) ( not ( = ?auto_1604815 ?auto_1604817 ) ) ( not ( = ?auto_1604819 ?auto_1604817 ) ) ( LIFTING ?auto_1604816 ?auto_1604823 ) ( IS-CRATE ?auto_1604823 ) ( not ( = ?auto_1604814 ?auto_1604823 ) ) ( not ( = ?auto_1604815 ?auto_1604823 ) ) ( not ( = ?auto_1604819 ?auto_1604823 ) ) ( not ( = ?auto_1604817 ?auto_1604823 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1604816 ?auto_1604823 ?auto_1604820 ?auto_1604822 )
      ( MAKE-1CRATE ?auto_1604814 ?auto_1604815 )
      ( MAKE-1CRATE-VERIFY ?auto_1604814 ?auto_1604815 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605653 - SURFACE
      ?auto_1605654 - SURFACE
      ?auto_1605655 - SURFACE
      ?auto_1605656 - SURFACE
      ?auto_1605657 - SURFACE
      ?auto_1605658 - SURFACE
      ?auto_1605659 - SURFACE
      ?auto_1605660 - SURFACE
      ?auto_1605661 - SURFACE
    )
    :vars
    (
      ?auto_1605662 - HOIST
      ?auto_1605663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605662 ?auto_1605663 ) ( SURFACE-AT ?auto_1605660 ?auto_1605663 ) ( CLEAR ?auto_1605660 ) ( LIFTING ?auto_1605662 ?auto_1605661 ) ( IS-CRATE ?auto_1605661 ) ( not ( = ?auto_1605660 ?auto_1605661 ) ) ( ON ?auto_1605654 ?auto_1605653 ) ( ON ?auto_1605655 ?auto_1605654 ) ( ON ?auto_1605656 ?auto_1605655 ) ( ON ?auto_1605657 ?auto_1605656 ) ( ON ?auto_1605658 ?auto_1605657 ) ( ON ?auto_1605659 ?auto_1605658 ) ( ON ?auto_1605660 ?auto_1605659 ) ( not ( = ?auto_1605653 ?auto_1605654 ) ) ( not ( = ?auto_1605653 ?auto_1605655 ) ) ( not ( = ?auto_1605653 ?auto_1605656 ) ) ( not ( = ?auto_1605653 ?auto_1605657 ) ) ( not ( = ?auto_1605653 ?auto_1605658 ) ) ( not ( = ?auto_1605653 ?auto_1605659 ) ) ( not ( = ?auto_1605653 ?auto_1605660 ) ) ( not ( = ?auto_1605653 ?auto_1605661 ) ) ( not ( = ?auto_1605654 ?auto_1605655 ) ) ( not ( = ?auto_1605654 ?auto_1605656 ) ) ( not ( = ?auto_1605654 ?auto_1605657 ) ) ( not ( = ?auto_1605654 ?auto_1605658 ) ) ( not ( = ?auto_1605654 ?auto_1605659 ) ) ( not ( = ?auto_1605654 ?auto_1605660 ) ) ( not ( = ?auto_1605654 ?auto_1605661 ) ) ( not ( = ?auto_1605655 ?auto_1605656 ) ) ( not ( = ?auto_1605655 ?auto_1605657 ) ) ( not ( = ?auto_1605655 ?auto_1605658 ) ) ( not ( = ?auto_1605655 ?auto_1605659 ) ) ( not ( = ?auto_1605655 ?auto_1605660 ) ) ( not ( = ?auto_1605655 ?auto_1605661 ) ) ( not ( = ?auto_1605656 ?auto_1605657 ) ) ( not ( = ?auto_1605656 ?auto_1605658 ) ) ( not ( = ?auto_1605656 ?auto_1605659 ) ) ( not ( = ?auto_1605656 ?auto_1605660 ) ) ( not ( = ?auto_1605656 ?auto_1605661 ) ) ( not ( = ?auto_1605657 ?auto_1605658 ) ) ( not ( = ?auto_1605657 ?auto_1605659 ) ) ( not ( = ?auto_1605657 ?auto_1605660 ) ) ( not ( = ?auto_1605657 ?auto_1605661 ) ) ( not ( = ?auto_1605658 ?auto_1605659 ) ) ( not ( = ?auto_1605658 ?auto_1605660 ) ) ( not ( = ?auto_1605658 ?auto_1605661 ) ) ( not ( = ?auto_1605659 ?auto_1605660 ) ) ( not ( = ?auto_1605659 ?auto_1605661 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1605660 ?auto_1605661 )
      ( MAKE-8CRATE-VERIFY ?auto_1605653 ?auto_1605654 ?auto_1605655 ?auto_1605656 ?auto_1605657 ?auto_1605658 ?auto_1605659 ?auto_1605660 ?auto_1605661 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605720 - SURFACE
      ?auto_1605721 - SURFACE
      ?auto_1605722 - SURFACE
      ?auto_1605723 - SURFACE
      ?auto_1605724 - SURFACE
      ?auto_1605725 - SURFACE
      ?auto_1605726 - SURFACE
      ?auto_1605727 - SURFACE
      ?auto_1605728 - SURFACE
    )
    :vars
    (
      ?auto_1605730 - HOIST
      ?auto_1605729 - PLACE
      ?auto_1605731 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605730 ?auto_1605729 ) ( SURFACE-AT ?auto_1605727 ?auto_1605729 ) ( CLEAR ?auto_1605727 ) ( IS-CRATE ?auto_1605728 ) ( not ( = ?auto_1605727 ?auto_1605728 ) ) ( TRUCK-AT ?auto_1605731 ?auto_1605729 ) ( AVAILABLE ?auto_1605730 ) ( IN ?auto_1605728 ?auto_1605731 ) ( ON ?auto_1605727 ?auto_1605726 ) ( not ( = ?auto_1605726 ?auto_1605727 ) ) ( not ( = ?auto_1605726 ?auto_1605728 ) ) ( ON ?auto_1605721 ?auto_1605720 ) ( ON ?auto_1605722 ?auto_1605721 ) ( ON ?auto_1605723 ?auto_1605722 ) ( ON ?auto_1605724 ?auto_1605723 ) ( ON ?auto_1605725 ?auto_1605724 ) ( ON ?auto_1605726 ?auto_1605725 ) ( not ( = ?auto_1605720 ?auto_1605721 ) ) ( not ( = ?auto_1605720 ?auto_1605722 ) ) ( not ( = ?auto_1605720 ?auto_1605723 ) ) ( not ( = ?auto_1605720 ?auto_1605724 ) ) ( not ( = ?auto_1605720 ?auto_1605725 ) ) ( not ( = ?auto_1605720 ?auto_1605726 ) ) ( not ( = ?auto_1605720 ?auto_1605727 ) ) ( not ( = ?auto_1605720 ?auto_1605728 ) ) ( not ( = ?auto_1605721 ?auto_1605722 ) ) ( not ( = ?auto_1605721 ?auto_1605723 ) ) ( not ( = ?auto_1605721 ?auto_1605724 ) ) ( not ( = ?auto_1605721 ?auto_1605725 ) ) ( not ( = ?auto_1605721 ?auto_1605726 ) ) ( not ( = ?auto_1605721 ?auto_1605727 ) ) ( not ( = ?auto_1605721 ?auto_1605728 ) ) ( not ( = ?auto_1605722 ?auto_1605723 ) ) ( not ( = ?auto_1605722 ?auto_1605724 ) ) ( not ( = ?auto_1605722 ?auto_1605725 ) ) ( not ( = ?auto_1605722 ?auto_1605726 ) ) ( not ( = ?auto_1605722 ?auto_1605727 ) ) ( not ( = ?auto_1605722 ?auto_1605728 ) ) ( not ( = ?auto_1605723 ?auto_1605724 ) ) ( not ( = ?auto_1605723 ?auto_1605725 ) ) ( not ( = ?auto_1605723 ?auto_1605726 ) ) ( not ( = ?auto_1605723 ?auto_1605727 ) ) ( not ( = ?auto_1605723 ?auto_1605728 ) ) ( not ( = ?auto_1605724 ?auto_1605725 ) ) ( not ( = ?auto_1605724 ?auto_1605726 ) ) ( not ( = ?auto_1605724 ?auto_1605727 ) ) ( not ( = ?auto_1605724 ?auto_1605728 ) ) ( not ( = ?auto_1605725 ?auto_1605726 ) ) ( not ( = ?auto_1605725 ?auto_1605727 ) ) ( not ( = ?auto_1605725 ?auto_1605728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605726 ?auto_1605727 ?auto_1605728 )
      ( MAKE-8CRATE-VERIFY ?auto_1605720 ?auto_1605721 ?auto_1605722 ?auto_1605723 ?auto_1605724 ?auto_1605725 ?auto_1605726 ?auto_1605727 ?auto_1605728 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605796 - SURFACE
      ?auto_1605797 - SURFACE
      ?auto_1605798 - SURFACE
      ?auto_1605799 - SURFACE
      ?auto_1605800 - SURFACE
      ?auto_1605801 - SURFACE
      ?auto_1605802 - SURFACE
      ?auto_1605803 - SURFACE
      ?auto_1605804 - SURFACE
    )
    :vars
    (
      ?auto_1605808 - HOIST
      ?auto_1605807 - PLACE
      ?auto_1605806 - TRUCK
      ?auto_1605805 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605808 ?auto_1605807 ) ( SURFACE-AT ?auto_1605803 ?auto_1605807 ) ( CLEAR ?auto_1605803 ) ( IS-CRATE ?auto_1605804 ) ( not ( = ?auto_1605803 ?auto_1605804 ) ) ( AVAILABLE ?auto_1605808 ) ( IN ?auto_1605804 ?auto_1605806 ) ( ON ?auto_1605803 ?auto_1605802 ) ( not ( = ?auto_1605802 ?auto_1605803 ) ) ( not ( = ?auto_1605802 ?auto_1605804 ) ) ( TRUCK-AT ?auto_1605806 ?auto_1605805 ) ( not ( = ?auto_1605805 ?auto_1605807 ) ) ( ON ?auto_1605797 ?auto_1605796 ) ( ON ?auto_1605798 ?auto_1605797 ) ( ON ?auto_1605799 ?auto_1605798 ) ( ON ?auto_1605800 ?auto_1605799 ) ( ON ?auto_1605801 ?auto_1605800 ) ( ON ?auto_1605802 ?auto_1605801 ) ( not ( = ?auto_1605796 ?auto_1605797 ) ) ( not ( = ?auto_1605796 ?auto_1605798 ) ) ( not ( = ?auto_1605796 ?auto_1605799 ) ) ( not ( = ?auto_1605796 ?auto_1605800 ) ) ( not ( = ?auto_1605796 ?auto_1605801 ) ) ( not ( = ?auto_1605796 ?auto_1605802 ) ) ( not ( = ?auto_1605796 ?auto_1605803 ) ) ( not ( = ?auto_1605796 ?auto_1605804 ) ) ( not ( = ?auto_1605797 ?auto_1605798 ) ) ( not ( = ?auto_1605797 ?auto_1605799 ) ) ( not ( = ?auto_1605797 ?auto_1605800 ) ) ( not ( = ?auto_1605797 ?auto_1605801 ) ) ( not ( = ?auto_1605797 ?auto_1605802 ) ) ( not ( = ?auto_1605797 ?auto_1605803 ) ) ( not ( = ?auto_1605797 ?auto_1605804 ) ) ( not ( = ?auto_1605798 ?auto_1605799 ) ) ( not ( = ?auto_1605798 ?auto_1605800 ) ) ( not ( = ?auto_1605798 ?auto_1605801 ) ) ( not ( = ?auto_1605798 ?auto_1605802 ) ) ( not ( = ?auto_1605798 ?auto_1605803 ) ) ( not ( = ?auto_1605798 ?auto_1605804 ) ) ( not ( = ?auto_1605799 ?auto_1605800 ) ) ( not ( = ?auto_1605799 ?auto_1605801 ) ) ( not ( = ?auto_1605799 ?auto_1605802 ) ) ( not ( = ?auto_1605799 ?auto_1605803 ) ) ( not ( = ?auto_1605799 ?auto_1605804 ) ) ( not ( = ?auto_1605800 ?auto_1605801 ) ) ( not ( = ?auto_1605800 ?auto_1605802 ) ) ( not ( = ?auto_1605800 ?auto_1605803 ) ) ( not ( = ?auto_1605800 ?auto_1605804 ) ) ( not ( = ?auto_1605801 ?auto_1605802 ) ) ( not ( = ?auto_1605801 ?auto_1605803 ) ) ( not ( = ?auto_1605801 ?auto_1605804 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605802 ?auto_1605803 ?auto_1605804 )
      ( MAKE-8CRATE-VERIFY ?auto_1605796 ?auto_1605797 ?auto_1605798 ?auto_1605799 ?auto_1605800 ?auto_1605801 ?auto_1605802 ?auto_1605803 ?auto_1605804 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605880 - SURFACE
      ?auto_1605881 - SURFACE
      ?auto_1605882 - SURFACE
      ?auto_1605883 - SURFACE
      ?auto_1605884 - SURFACE
      ?auto_1605885 - SURFACE
      ?auto_1605886 - SURFACE
      ?auto_1605887 - SURFACE
      ?auto_1605888 - SURFACE
    )
    :vars
    (
      ?auto_1605889 - HOIST
      ?auto_1605891 - PLACE
      ?auto_1605892 - TRUCK
      ?auto_1605890 - PLACE
      ?auto_1605893 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605889 ?auto_1605891 ) ( SURFACE-AT ?auto_1605887 ?auto_1605891 ) ( CLEAR ?auto_1605887 ) ( IS-CRATE ?auto_1605888 ) ( not ( = ?auto_1605887 ?auto_1605888 ) ) ( AVAILABLE ?auto_1605889 ) ( ON ?auto_1605887 ?auto_1605886 ) ( not ( = ?auto_1605886 ?auto_1605887 ) ) ( not ( = ?auto_1605886 ?auto_1605888 ) ) ( TRUCK-AT ?auto_1605892 ?auto_1605890 ) ( not ( = ?auto_1605890 ?auto_1605891 ) ) ( HOIST-AT ?auto_1605893 ?auto_1605890 ) ( LIFTING ?auto_1605893 ?auto_1605888 ) ( not ( = ?auto_1605889 ?auto_1605893 ) ) ( ON ?auto_1605881 ?auto_1605880 ) ( ON ?auto_1605882 ?auto_1605881 ) ( ON ?auto_1605883 ?auto_1605882 ) ( ON ?auto_1605884 ?auto_1605883 ) ( ON ?auto_1605885 ?auto_1605884 ) ( ON ?auto_1605886 ?auto_1605885 ) ( not ( = ?auto_1605880 ?auto_1605881 ) ) ( not ( = ?auto_1605880 ?auto_1605882 ) ) ( not ( = ?auto_1605880 ?auto_1605883 ) ) ( not ( = ?auto_1605880 ?auto_1605884 ) ) ( not ( = ?auto_1605880 ?auto_1605885 ) ) ( not ( = ?auto_1605880 ?auto_1605886 ) ) ( not ( = ?auto_1605880 ?auto_1605887 ) ) ( not ( = ?auto_1605880 ?auto_1605888 ) ) ( not ( = ?auto_1605881 ?auto_1605882 ) ) ( not ( = ?auto_1605881 ?auto_1605883 ) ) ( not ( = ?auto_1605881 ?auto_1605884 ) ) ( not ( = ?auto_1605881 ?auto_1605885 ) ) ( not ( = ?auto_1605881 ?auto_1605886 ) ) ( not ( = ?auto_1605881 ?auto_1605887 ) ) ( not ( = ?auto_1605881 ?auto_1605888 ) ) ( not ( = ?auto_1605882 ?auto_1605883 ) ) ( not ( = ?auto_1605882 ?auto_1605884 ) ) ( not ( = ?auto_1605882 ?auto_1605885 ) ) ( not ( = ?auto_1605882 ?auto_1605886 ) ) ( not ( = ?auto_1605882 ?auto_1605887 ) ) ( not ( = ?auto_1605882 ?auto_1605888 ) ) ( not ( = ?auto_1605883 ?auto_1605884 ) ) ( not ( = ?auto_1605883 ?auto_1605885 ) ) ( not ( = ?auto_1605883 ?auto_1605886 ) ) ( not ( = ?auto_1605883 ?auto_1605887 ) ) ( not ( = ?auto_1605883 ?auto_1605888 ) ) ( not ( = ?auto_1605884 ?auto_1605885 ) ) ( not ( = ?auto_1605884 ?auto_1605886 ) ) ( not ( = ?auto_1605884 ?auto_1605887 ) ) ( not ( = ?auto_1605884 ?auto_1605888 ) ) ( not ( = ?auto_1605885 ?auto_1605886 ) ) ( not ( = ?auto_1605885 ?auto_1605887 ) ) ( not ( = ?auto_1605885 ?auto_1605888 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605886 ?auto_1605887 ?auto_1605888 )
      ( MAKE-8CRATE-VERIFY ?auto_1605880 ?auto_1605881 ?auto_1605882 ?auto_1605883 ?auto_1605884 ?auto_1605885 ?auto_1605886 ?auto_1605887 ?auto_1605888 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1605972 - SURFACE
      ?auto_1605973 - SURFACE
      ?auto_1605974 - SURFACE
      ?auto_1605975 - SURFACE
      ?auto_1605976 - SURFACE
      ?auto_1605977 - SURFACE
      ?auto_1605978 - SURFACE
      ?auto_1605979 - SURFACE
      ?auto_1605980 - SURFACE
    )
    :vars
    (
      ?auto_1605984 - HOIST
      ?auto_1605981 - PLACE
      ?auto_1605986 - TRUCK
      ?auto_1605983 - PLACE
      ?auto_1605982 - HOIST
      ?auto_1605985 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1605984 ?auto_1605981 ) ( SURFACE-AT ?auto_1605979 ?auto_1605981 ) ( CLEAR ?auto_1605979 ) ( IS-CRATE ?auto_1605980 ) ( not ( = ?auto_1605979 ?auto_1605980 ) ) ( AVAILABLE ?auto_1605984 ) ( ON ?auto_1605979 ?auto_1605978 ) ( not ( = ?auto_1605978 ?auto_1605979 ) ) ( not ( = ?auto_1605978 ?auto_1605980 ) ) ( TRUCK-AT ?auto_1605986 ?auto_1605983 ) ( not ( = ?auto_1605983 ?auto_1605981 ) ) ( HOIST-AT ?auto_1605982 ?auto_1605983 ) ( not ( = ?auto_1605984 ?auto_1605982 ) ) ( AVAILABLE ?auto_1605982 ) ( SURFACE-AT ?auto_1605980 ?auto_1605983 ) ( ON ?auto_1605980 ?auto_1605985 ) ( CLEAR ?auto_1605980 ) ( not ( = ?auto_1605979 ?auto_1605985 ) ) ( not ( = ?auto_1605980 ?auto_1605985 ) ) ( not ( = ?auto_1605978 ?auto_1605985 ) ) ( ON ?auto_1605973 ?auto_1605972 ) ( ON ?auto_1605974 ?auto_1605973 ) ( ON ?auto_1605975 ?auto_1605974 ) ( ON ?auto_1605976 ?auto_1605975 ) ( ON ?auto_1605977 ?auto_1605976 ) ( ON ?auto_1605978 ?auto_1605977 ) ( not ( = ?auto_1605972 ?auto_1605973 ) ) ( not ( = ?auto_1605972 ?auto_1605974 ) ) ( not ( = ?auto_1605972 ?auto_1605975 ) ) ( not ( = ?auto_1605972 ?auto_1605976 ) ) ( not ( = ?auto_1605972 ?auto_1605977 ) ) ( not ( = ?auto_1605972 ?auto_1605978 ) ) ( not ( = ?auto_1605972 ?auto_1605979 ) ) ( not ( = ?auto_1605972 ?auto_1605980 ) ) ( not ( = ?auto_1605972 ?auto_1605985 ) ) ( not ( = ?auto_1605973 ?auto_1605974 ) ) ( not ( = ?auto_1605973 ?auto_1605975 ) ) ( not ( = ?auto_1605973 ?auto_1605976 ) ) ( not ( = ?auto_1605973 ?auto_1605977 ) ) ( not ( = ?auto_1605973 ?auto_1605978 ) ) ( not ( = ?auto_1605973 ?auto_1605979 ) ) ( not ( = ?auto_1605973 ?auto_1605980 ) ) ( not ( = ?auto_1605973 ?auto_1605985 ) ) ( not ( = ?auto_1605974 ?auto_1605975 ) ) ( not ( = ?auto_1605974 ?auto_1605976 ) ) ( not ( = ?auto_1605974 ?auto_1605977 ) ) ( not ( = ?auto_1605974 ?auto_1605978 ) ) ( not ( = ?auto_1605974 ?auto_1605979 ) ) ( not ( = ?auto_1605974 ?auto_1605980 ) ) ( not ( = ?auto_1605974 ?auto_1605985 ) ) ( not ( = ?auto_1605975 ?auto_1605976 ) ) ( not ( = ?auto_1605975 ?auto_1605977 ) ) ( not ( = ?auto_1605975 ?auto_1605978 ) ) ( not ( = ?auto_1605975 ?auto_1605979 ) ) ( not ( = ?auto_1605975 ?auto_1605980 ) ) ( not ( = ?auto_1605975 ?auto_1605985 ) ) ( not ( = ?auto_1605976 ?auto_1605977 ) ) ( not ( = ?auto_1605976 ?auto_1605978 ) ) ( not ( = ?auto_1605976 ?auto_1605979 ) ) ( not ( = ?auto_1605976 ?auto_1605980 ) ) ( not ( = ?auto_1605976 ?auto_1605985 ) ) ( not ( = ?auto_1605977 ?auto_1605978 ) ) ( not ( = ?auto_1605977 ?auto_1605979 ) ) ( not ( = ?auto_1605977 ?auto_1605980 ) ) ( not ( = ?auto_1605977 ?auto_1605985 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1605978 ?auto_1605979 ?auto_1605980 )
      ( MAKE-8CRATE-VERIFY ?auto_1605972 ?auto_1605973 ?auto_1605974 ?auto_1605975 ?auto_1605976 ?auto_1605977 ?auto_1605978 ?auto_1605979 ?auto_1605980 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606065 - SURFACE
      ?auto_1606066 - SURFACE
      ?auto_1606067 - SURFACE
      ?auto_1606068 - SURFACE
      ?auto_1606069 - SURFACE
      ?auto_1606070 - SURFACE
      ?auto_1606071 - SURFACE
      ?auto_1606072 - SURFACE
      ?auto_1606073 - SURFACE
    )
    :vars
    (
      ?auto_1606077 - HOIST
      ?auto_1606078 - PLACE
      ?auto_1606079 - PLACE
      ?auto_1606076 - HOIST
      ?auto_1606075 - SURFACE
      ?auto_1606074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606077 ?auto_1606078 ) ( SURFACE-AT ?auto_1606072 ?auto_1606078 ) ( CLEAR ?auto_1606072 ) ( IS-CRATE ?auto_1606073 ) ( not ( = ?auto_1606072 ?auto_1606073 ) ) ( AVAILABLE ?auto_1606077 ) ( ON ?auto_1606072 ?auto_1606071 ) ( not ( = ?auto_1606071 ?auto_1606072 ) ) ( not ( = ?auto_1606071 ?auto_1606073 ) ) ( not ( = ?auto_1606079 ?auto_1606078 ) ) ( HOIST-AT ?auto_1606076 ?auto_1606079 ) ( not ( = ?auto_1606077 ?auto_1606076 ) ) ( AVAILABLE ?auto_1606076 ) ( SURFACE-AT ?auto_1606073 ?auto_1606079 ) ( ON ?auto_1606073 ?auto_1606075 ) ( CLEAR ?auto_1606073 ) ( not ( = ?auto_1606072 ?auto_1606075 ) ) ( not ( = ?auto_1606073 ?auto_1606075 ) ) ( not ( = ?auto_1606071 ?auto_1606075 ) ) ( TRUCK-AT ?auto_1606074 ?auto_1606078 ) ( ON ?auto_1606066 ?auto_1606065 ) ( ON ?auto_1606067 ?auto_1606066 ) ( ON ?auto_1606068 ?auto_1606067 ) ( ON ?auto_1606069 ?auto_1606068 ) ( ON ?auto_1606070 ?auto_1606069 ) ( ON ?auto_1606071 ?auto_1606070 ) ( not ( = ?auto_1606065 ?auto_1606066 ) ) ( not ( = ?auto_1606065 ?auto_1606067 ) ) ( not ( = ?auto_1606065 ?auto_1606068 ) ) ( not ( = ?auto_1606065 ?auto_1606069 ) ) ( not ( = ?auto_1606065 ?auto_1606070 ) ) ( not ( = ?auto_1606065 ?auto_1606071 ) ) ( not ( = ?auto_1606065 ?auto_1606072 ) ) ( not ( = ?auto_1606065 ?auto_1606073 ) ) ( not ( = ?auto_1606065 ?auto_1606075 ) ) ( not ( = ?auto_1606066 ?auto_1606067 ) ) ( not ( = ?auto_1606066 ?auto_1606068 ) ) ( not ( = ?auto_1606066 ?auto_1606069 ) ) ( not ( = ?auto_1606066 ?auto_1606070 ) ) ( not ( = ?auto_1606066 ?auto_1606071 ) ) ( not ( = ?auto_1606066 ?auto_1606072 ) ) ( not ( = ?auto_1606066 ?auto_1606073 ) ) ( not ( = ?auto_1606066 ?auto_1606075 ) ) ( not ( = ?auto_1606067 ?auto_1606068 ) ) ( not ( = ?auto_1606067 ?auto_1606069 ) ) ( not ( = ?auto_1606067 ?auto_1606070 ) ) ( not ( = ?auto_1606067 ?auto_1606071 ) ) ( not ( = ?auto_1606067 ?auto_1606072 ) ) ( not ( = ?auto_1606067 ?auto_1606073 ) ) ( not ( = ?auto_1606067 ?auto_1606075 ) ) ( not ( = ?auto_1606068 ?auto_1606069 ) ) ( not ( = ?auto_1606068 ?auto_1606070 ) ) ( not ( = ?auto_1606068 ?auto_1606071 ) ) ( not ( = ?auto_1606068 ?auto_1606072 ) ) ( not ( = ?auto_1606068 ?auto_1606073 ) ) ( not ( = ?auto_1606068 ?auto_1606075 ) ) ( not ( = ?auto_1606069 ?auto_1606070 ) ) ( not ( = ?auto_1606069 ?auto_1606071 ) ) ( not ( = ?auto_1606069 ?auto_1606072 ) ) ( not ( = ?auto_1606069 ?auto_1606073 ) ) ( not ( = ?auto_1606069 ?auto_1606075 ) ) ( not ( = ?auto_1606070 ?auto_1606071 ) ) ( not ( = ?auto_1606070 ?auto_1606072 ) ) ( not ( = ?auto_1606070 ?auto_1606073 ) ) ( not ( = ?auto_1606070 ?auto_1606075 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606071 ?auto_1606072 ?auto_1606073 )
      ( MAKE-8CRATE-VERIFY ?auto_1606065 ?auto_1606066 ?auto_1606067 ?auto_1606068 ?auto_1606069 ?auto_1606070 ?auto_1606071 ?auto_1606072 ?auto_1606073 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606158 - SURFACE
      ?auto_1606159 - SURFACE
      ?auto_1606160 - SURFACE
      ?auto_1606161 - SURFACE
      ?auto_1606162 - SURFACE
      ?auto_1606163 - SURFACE
      ?auto_1606164 - SURFACE
      ?auto_1606165 - SURFACE
      ?auto_1606166 - SURFACE
    )
    :vars
    (
      ?auto_1606169 - HOIST
      ?auto_1606171 - PLACE
      ?auto_1606170 - PLACE
      ?auto_1606172 - HOIST
      ?auto_1606168 - SURFACE
      ?auto_1606167 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606169 ?auto_1606171 ) ( IS-CRATE ?auto_1606166 ) ( not ( = ?auto_1606165 ?auto_1606166 ) ) ( not ( = ?auto_1606164 ?auto_1606165 ) ) ( not ( = ?auto_1606164 ?auto_1606166 ) ) ( not ( = ?auto_1606170 ?auto_1606171 ) ) ( HOIST-AT ?auto_1606172 ?auto_1606170 ) ( not ( = ?auto_1606169 ?auto_1606172 ) ) ( AVAILABLE ?auto_1606172 ) ( SURFACE-AT ?auto_1606166 ?auto_1606170 ) ( ON ?auto_1606166 ?auto_1606168 ) ( CLEAR ?auto_1606166 ) ( not ( = ?auto_1606165 ?auto_1606168 ) ) ( not ( = ?auto_1606166 ?auto_1606168 ) ) ( not ( = ?auto_1606164 ?auto_1606168 ) ) ( TRUCK-AT ?auto_1606167 ?auto_1606171 ) ( SURFACE-AT ?auto_1606164 ?auto_1606171 ) ( CLEAR ?auto_1606164 ) ( LIFTING ?auto_1606169 ?auto_1606165 ) ( IS-CRATE ?auto_1606165 ) ( ON ?auto_1606159 ?auto_1606158 ) ( ON ?auto_1606160 ?auto_1606159 ) ( ON ?auto_1606161 ?auto_1606160 ) ( ON ?auto_1606162 ?auto_1606161 ) ( ON ?auto_1606163 ?auto_1606162 ) ( ON ?auto_1606164 ?auto_1606163 ) ( not ( = ?auto_1606158 ?auto_1606159 ) ) ( not ( = ?auto_1606158 ?auto_1606160 ) ) ( not ( = ?auto_1606158 ?auto_1606161 ) ) ( not ( = ?auto_1606158 ?auto_1606162 ) ) ( not ( = ?auto_1606158 ?auto_1606163 ) ) ( not ( = ?auto_1606158 ?auto_1606164 ) ) ( not ( = ?auto_1606158 ?auto_1606165 ) ) ( not ( = ?auto_1606158 ?auto_1606166 ) ) ( not ( = ?auto_1606158 ?auto_1606168 ) ) ( not ( = ?auto_1606159 ?auto_1606160 ) ) ( not ( = ?auto_1606159 ?auto_1606161 ) ) ( not ( = ?auto_1606159 ?auto_1606162 ) ) ( not ( = ?auto_1606159 ?auto_1606163 ) ) ( not ( = ?auto_1606159 ?auto_1606164 ) ) ( not ( = ?auto_1606159 ?auto_1606165 ) ) ( not ( = ?auto_1606159 ?auto_1606166 ) ) ( not ( = ?auto_1606159 ?auto_1606168 ) ) ( not ( = ?auto_1606160 ?auto_1606161 ) ) ( not ( = ?auto_1606160 ?auto_1606162 ) ) ( not ( = ?auto_1606160 ?auto_1606163 ) ) ( not ( = ?auto_1606160 ?auto_1606164 ) ) ( not ( = ?auto_1606160 ?auto_1606165 ) ) ( not ( = ?auto_1606160 ?auto_1606166 ) ) ( not ( = ?auto_1606160 ?auto_1606168 ) ) ( not ( = ?auto_1606161 ?auto_1606162 ) ) ( not ( = ?auto_1606161 ?auto_1606163 ) ) ( not ( = ?auto_1606161 ?auto_1606164 ) ) ( not ( = ?auto_1606161 ?auto_1606165 ) ) ( not ( = ?auto_1606161 ?auto_1606166 ) ) ( not ( = ?auto_1606161 ?auto_1606168 ) ) ( not ( = ?auto_1606162 ?auto_1606163 ) ) ( not ( = ?auto_1606162 ?auto_1606164 ) ) ( not ( = ?auto_1606162 ?auto_1606165 ) ) ( not ( = ?auto_1606162 ?auto_1606166 ) ) ( not ( = ?auto_1606162 ?auto_1606168 ) ) ( not ( = ?auto_1606163 ?auto_1606164 ) ) ( not ( = ?auto_1606163 ?auto_1606165 ) ) ( not ( = ?auto_1606163 ?auto_1606166 ) ) ( not ( = ?auto_1606163 ?auto_1606168 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606164 ?auto_1606165 ?auto_1606166 )
      ( MAKE-8CRATE-VERIFY ?auto_1606158 ?auto_1606159 ?auto_1606160 ?auto_1606161 ?auto_1606162 ?auto_1606163 ?auto_1606164 ?auto_1606165 ?auto_1606166 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606251 - SURFACE
      ?auto_1606252 - SURFACE
      ?auto_1606253 - SURFACE
      ?auto_1606254 - SURFACE
      ?auto_1606255 - SURFACE
      ?auto_1606256 - SURFACE
      ?auto_1606257 - SURFACE
      ?auto_1606258 - SURFACE
      ?auto_1606259 - SURFACE
    )
    :vars
    (
      ?auto_1606263 - HOIST
      ?auto_1606262 - PLACE
      ?auto_1606261 - PLACE
      ?auto_1606260 - HOIST
      ?auto_1606265 - SURFACE
      ?auto_1606264 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606263 ?auto_1606262 ) ( IS-CRATE ?auto_1606259 ) ( not ( = ?auto_1606258 ?auto_1606259 ) ) ( not ( = ?auto_1606257 ?auto_1606258 ) ) ( not ( = ?auto_1606257 ?auto_1606259 ) ) ( not ( = ?auto_1606261 ?auto_1606262 ) ) ( HOIST-AT ?auto_1606260 ?auto_1606261 ) ( not ( = ?auto_1606263 ?auto_1606260 ) ) ( AVAILABLE ?auto_1606260 ) ( SURFACE-AT ?auto_1606259 ?auto_1606261 ) ( ON ?auto_1606259 ?auto_1606265 ) ( CLEAR ?auto_1606259 ) ( not ( = ?auto_1606258 ?auto_1606265 ) ) ( not ( = ?auto_1606259 ?auto_1606265 ) ) ( not ( = ?auto_1606257 ?auto_1606265 ) ) ( TRUCK-AT ?auto_1606264 ?auto_1606262 ) ( SURFACE-AT ?auto_1606257 ?auto_1606262 ) ( CLEAR ?auto_1606257 ) ( IS-CRATE ?auto_1606258 ) ( AVAILABLE ?auto_1606263 ) ( IN ?auto_1606258 ?auto_1606264 ) ( ON ?auto_1606252 ?auto_1606251 ) ( ON ?auto_1606253 ?auto_1606252 ) ( ON ?auto_1606254 ?auto_1606253 ) ( ON ?auto_1606255 ?auto_1606254 ) ( ON ?auto_1606256 ?auto_1606255 ) ( ON ?auto_1606257 ?auto_1606256 ) ( not ( = ?auto_1606251 ?auto_1606252 ) ) ( not ( = ?auto_1606251 ?auto_1606253 ) ) ( not ( = ?auto_1606251 ?auto_1606254 ) ) ( not ( = ?auto_1606251 ?auto_1606255 ) ) ( not ( = ?auto_1606251 ?auto_1606256 ) ) ( not ( = ?auto_1606251 ?auto_1606257 ) ) ( not ( = ?auto_1606251 ?auto_1606258 ) ) ( not ( = ?auto_1606251 ?auto_1606259 ) ) ( not ( = ?auto_1606251 ?auto_1606265 ) ) ( not ( = ?auto_1606252 ?auto_1606253 ) ) ( not ( = ?auto_1606252 ?auto_1606254 ) ) ( not ( = ?auto_1606252 ?auto_1606255 ) ) ( not ( = ?auto_1606252 ?auto_1606256 ) ) ( not ( = ?auto_1606252 ?auto_1606257 ) ) ( not ( = ?auto_1606252 ?auto_1606258 ) ) ( not ( = ?auto_1606252 ?auto_1606259 ) ) ( not ( = ?auto_1606252 ?auto_1606265 ) ) ( not ( = ?auto_1606253 ?auto_1606254 ) ) ( not ( = ?auto_1606253 ?auto_1606255 ) ) ( not ( = ?auto_1606253 ?auto_1606256 ) ) ( not ( = ?auto_1606253 ?auto_1606257 ) ) ( not ( = ?auto_1606253 ?auto_1606258 ) ) ( not ( = ?auto_1606253 ?auto_1606259 ) ) ( not ( = ?auto_1606253 ?auto_1606265 ) ) ( not ( = ?auto_1606254 ?auto_1606255 ) ) ( not ( = ?auto_1606254 ?auto_1606256 ) ) ( not ( = ?auto_1606254 ?auto_1606257 ) ) ( not ( = ?auto_1606254 ?auto_1606258 ) ) ( not ( = ?auto_1606254 ?auto_1606259 ) ) ( not ( = ?auto_1606254 ?auto_1606265 ) ) ( not ( = ?auto_1606255 ?auto_1606256 ) ) ( not ( = ?auto_1606255 ?auto_1606257 ) ) ( not ( = ?auto_1606255 ?auto_1606258 ) ) ( not ( = ?auto_1606255 ?auto_1606259 ) ) ( not ( = ?auto_1606255 ?auto_1606265 ) ) ( not ( = ?auto_1606256 ?auto_1606257 ) ) ( not ( = ?auto_1606256 ?auto_1606258 ) ) ( not ( = ?auto_1606256 ?auto_1606259 ) ) ( not ( = ?auto_1606256 ?auto_1606265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606257 ?auto_1606258 ?auto_1606259 )
      ( MAKE-8CRATE-VERIFY ?auto_1606251 ?auto_1606252 ?auto_1606253 ?auto_1606254 ?auto_1606255 ?auto_1606256 ?auto_1606257 ?auto_1606258 ?auto_1606259 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1606330 - SURFACE
      ?auto_1606331 - SURFACE
      ?auto_1606332 - SURFACE
      ?auto_1606333 - SURFACE
      ?auto_1606334 - SURFACE
      ?auto_1606335 - SURFACE
      ?auto_1606336 - SURFACE
      ?auto_1606337 - SURFACE
    )
    :vars
    (
      ?auto_1606343 - HOIST
      ?auto_1606339 - PLACE
      ?auto_1606340 - PLACE
      ?auto_1606342 - HOIST
      ?auto_1606341 - SURFACE
      ?auto_1606338 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606343 ?auto_1606339 ) ( IS-CRATE ?auto_1606337 ) ( not ( = ?auto_1606336 ?auto_1606337 ) ) ( not ( = ?auto_1606335 ?auto_1606336 ) ) ( not ( = ?auto_1606335 ?auto_1606337 ) ) ( not ( = ?auto_1606340 ?auto_1606339 ) ) ( HOIST-AT ?auto_1606342 ?auto_1606340 ) ( not ( = ?auto_1606343 ?auto_1606342 ) ) ( AVAILABLE ?auto_1606342 ) ( SURFACE-AT ?auto_1606337 ?auto_1606340 ) ( ON ?auto_1606337 ?auto_1606341 ) ( CLEAR ?auto_1606337 ) ( not ( = ?auto_1606336 ?auto_1606341 ) ) ( not ( = ?auto_1606337 ?auto_1606341 ) ) ( not ( = ?auto_1606335 ?auto_1606341 ) ) ( SURFACE-AT ?auto_1606335 ?auto_1606339 ) ( CLEAR ?auto_1606335 ) ( IS-CRATE ?auto_1606336 ) ( AVAILABLE ?auto_1606343 ) ( IN ?auto_1606336 ?auto_1606338 ) ( TRUCK-AT ?auto_1606338 ?auto_1606340 ) ( ON ?auto_1606331 ?auto_1606330 ) ( ON ?auto_1606332 ?auto_1606331 ) ( ON ?auto_1606333 ?auto_1606332 ) ( ON ?auto_1606334 ?auto_1606333 ) ( ON ?auto_1606335 ?auto_1606334 ) ( not ( = ?auto_1606330 ?auto_1606331 ) ) ( not ( = ?auto_1606330 ?auto_1606332 ) ) ( not ( = ?auto_1606330 ?auto_1606333 ) ) ( not ( = ?auto_1606330 ?auto_1606334 ) ) ( not ( = ?auto_1606330 ?auto_1606335 ) ) ( not ( = ?auto_1606330 ?auto_1606336 ) ) ( not ( = ?auto_1606330 ?auto_1606337 ) ) ( not ( = ?auto_1606330 ?auto_1606341 ) ) ( not ( = ?auto_1606331 ?auto_1606332 ) ) ( not ( = ?auto_1606331 ?auto_1606333 ) ) ( not ( = ?auto_1606331 ?auto_1606334 ) ) ( not ( = ?auto_1606331 ?auto_1606335 ) ) ( not ( = ?auto_1606331 ?auto_1606336 ) ) ( not ( = ?auto_1606331 ?auto_1606337 ) ) ( not ( = ?auto_1606331 ?auto_1606341 ) ) ( not ( = ?auto_1606332 ?auto_1606333 ) ) ( not ( = ?auto_1606332 ?auto_1606334 ) ) ( not ( = ?auto_1606332 ?auto_1606335 ) ) ( not ( = ?auto_1606332 ?auto_1606336 ) ) ( not ( = ?auto_1606332 ?auto_1606337 ) ) ( not ( = ?auto_1606332 ?auto_1606341 ) ) ( not ( = ?auto_1606333 ?auto_1606334 ) ) ( not ( = ?auto_1606333 ?auto_1606335 ) ) ( not ( = ?auto_1606333 ?auto_1606336 ) ) ( not ( = ?auto_1606333 ?auto_1606337 ) ) ( not ( = ?auto_1606333 ?auto_1606341 ) ) ( not ( = ?auto_1606334 ?auto_1606335 ) ) ( not ( = ?auto_1606334 ?auto_1606336 ) ) ( not ( = ?auto_1606334 ?auto_1606337 ) ) ( not ( = ?auto_1606334 ?auto_1606341 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606335 ?auto_1606336 ?auto_1606337 )
      ( MAKE-7CRATE-VERIFY ?auto_1606330 ?auto_1606331 ?auto_1606332 ?auto_1606333 ?auto_1606334 ?auto_1606335 ?auto_1606336 ?auto_1606337 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606344 - SURFACE
      ?auto_1606345 - SURFACE
      ?auto_1606346 - SURFACE
      ?auto_1606347 - SURFACE
      ?auto_1606348 - SURFACE
      ?auto_1606349 - SURFACE
      ?auto_1606350 - SURFACE
      ?auto_1606351 - SURFACE
      ?auto_1606352 - SURFACE
    )
    :vars
    (
      ?auto_1606358 - HOIST
      ?auto_1606354 - PLACE
      ?auto_1606355 - PLACE
      ?auto_1606357 - HOIST
      ?auto_1606356 - SURFACE
      ?auto_1606353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606358 ?auto_1606354 ) ( IS-CRATE ?auto_1606352 ) ( not ( = ?auto_1606351 ?auto_1606352 ) ) ( not ( = ?auto_1606350 ?auto_1606351 ) ) ( not ( = ?auto_1606350 ?auto_1606352 ) ) ( not ( = ?auto_1606355 ?auto_1606354 ) ) ( HOIST-AT ?auto_1606357 ?auto_1606355 ) ( not ( = ?auto_1606358 ?auto_1606357 ) ) ( AVAILABLE ?auto_1606357 ) ( SURFACE-AT ?auto_1606352 ?auto_1606355 ) ( ON ?auto_1606352 ?auto_1606356 ) ( CLEAR ?auto_1606352 ) ( not ( = ?auto_1606351 ?auto_1606356 ) ) ( not ( = ?auto_1606352 ?auto_1606356 ) ) ( not ( = ?auto_1606350 ?auto_1606356 ) ) ( SURFACE-AT ?auto_1606350 ?auto_1606354 ) ( CLEAR ?auto_1606350 ) ( IS-CRATE ?auto_1606351 ) ( AVAILABLE ?auto_1606358 ) ( IN ?auto_1606351 ?auto_1606353 ) ( TRUCK-AT ?auto_1606353 ?auto_1606355 ) ( ON ?auto_1606345 ?auto_1606344 ) ( ON ?auto_1606346 ?auto_1606345 ) ( ON ?auto_1606347 ?auto_1606346 ) ( ON ?auto_1606348 ?auto_1606347 ) ( ON ?auto_1606349 ?auto_1606348 ) ( ON ?auto_1606350 ?auto_1606349 ) ( not ( = ?auto_1606344 ?auto_1606345 ) ) ( not ( = ?auto_1606344 ?auto_1606346 ) ) ( not ( = ?auto_1606344 ?auto_1606347 ) ) ( not ( = ?auto_1606344 ?auto_1606348 ) ) ( not ( = ?auto_1606344 ?auto_1606349 ) ) ( not ( = ?auto_1606344 ?auto_1606350 ) ) ( not ( = ?auto_1606344 ?auto_1606351 ) ) ( not ( = ?auto_1606344 ?auto_1606352 ) ) ( not ( = ?auto_1606344 ?auto_1606356 ) ) ( not ( = ?auto_1606345 ?auto_1606346 ) ) ( not ( = ?auto_1606345 ?auto_1606347 ) ) ( not ( = ?auto_1606345 ?auto_1606348 ) ) ( not ( = ?auto_1606345 ?auto_1606349 ) ) ( not ( = ?auto_1606345 ?auto_1606350 ) ) ( not ( = ?auto_1606345 ?auto_1606351 ) ) ( not ( = ?auto_1606345 ?auto_1606352 ) ) ( not ( = ?auto_1606345 ?auto_1606356 ) ) ( not ( = ?auto_1606346 ?auto_1606347 ) ) ( not ( = ?auto_1606346 ?auto_1606348 ) ) ( not ( = ?auto_1606346 ?auto_1606349 ) ) ( not ( = ?auto_1606346 ?auto_1606350 ) ) ( not ( = ?auto_1606346 ?auto_1606351 ) ) ( not ( = ?auto_1606346 ?auto_1606352 ) ) ( not ( = ?auto_1606346 ?auto_1606356 ) ) ( not ( = ?auto_1606347 ?auto_1606348 ) ) ( not ( = ?auto_1606347 ?auto_1606349 ) ) ( not ( = ?auto_1606347 ?auto_1606350 ) ) ( not ( = ?auto_1606347 ?auto_1606351 ) ) ( not ( = ?auto_1606347 ?auto_1606352 ) ) ( not ( = ?auto_1606347 ?auto_1606356 ) ) ( not ( = ?auto_1606348 ?auto_1606349 ) ) ( not ( = ?auto_1606348 ?auto_1606350 ) ) ( not ( = ?auto_1606348 ?auto_1606351 ) ) ( not ( = ?auto_1606348 ?auto_1606352 ) ) ( not ( = ?auto_1606348 ?auto_1606356 ) ) ( not ( = ?auto_1606349 ?auto_1606350 ) ) ( not ( = ?auto_1606349 ?auto_1606351 ) ) ( not ( = ?auto_1606349 ?auto_1606352 ) ) ( not ( = ?auto_1606349 ?auto_1606356 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606350 ?auto_1606351 ?auto_1606352 )
      ( MAKE-8CRATE-VERIFY ?auto_1606344 ?auto_1606345 ?auto_1606346 ?auto_1606347 ?auto_1606348 ?auto_1606349 ?auto_1606350 ?auto_1606351 ?auto_1606352 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1606423 - SURFACE
      ?auto_1606424 - SURFACE
      ?auto_1606425 - SURFACE
      ?auto_1606426 - SURFACE
      ?auto_1606427 - SURFACE
      ?auto_1606428 - SURFACE
      ?auto_1606429 - SURFACE
      ?auto_1606430 - SURFACE
    )
    :vars
    (
      ?auto_1606431 - HOIST
      ?auto_1606434 - PLACE
      ?auto_1606432 - PLACE
      ?auto_1606435 - HOIST
      ?auto_1606433 - SURFACE
      ?auto_1606436 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606431 ?auto_1606434 ) ( IS-CRATE ?auto_1606430 ) ( not ( = ?auto_1606429 ?auto_1606430 ) ) ( not ( = ?auto_1606428 ?auto_1606429 ) ) ( not ( = ?auto_1606428 ?auto_1606430 ) ) ( not ( = ?auto_1606432 ?auto_1606434 ) ) ( HOIST-AT ?auto_1606435 ?auto_1606432 ) ( not ( = ?auto_1606431 ?auto_1606435 ) ) ( SURFACE-AT ?auto_1606430 ?auto_1606432 ) ( ON ?auto_1606430 ?auto_1606433 ) ( CLEAR ?auto_1606430 ) ( not ( = ?auto_1606429 ?auto_1606433 ) ) ( not ( = ?auto_1606430 ?auto_1606433 ) ) ( not ( = ?auto_1606428 ?auto_1606433 ) ) ( SURFACE-AT ?auto_1606428 ?auto_1606434 ) ( CLEAR ?auto_1606428 ) ( IS-CRATE ?auto_1606429 ) ( AVAILABLE ?auto_1606431 ) ( TRUCK-AT ?auto_1606436 ?auto_1606432 ) ( LIFTING ?auto_1606435 ?auto_1606429 ) ( ON ?auto_1606424 ?auto_1606423 ) ( ON ?auto_1606425 ?auto_1606424 ) ( ON ?auto_1606426 ?auto_1606425 ) ( ON ?auto_1606427 ?auto_1606426 ) ( ON ?auto_1606428 ?auto_1606427 ) ( not ( = ?auto_1606423 ?auto_1606424 ) ) ( not ( = ?auto_1606423 ?auto_1606425 ) ) ( not ( = ?auto_1606423 ?auto_1606426 ) ) ( not ( = ?auto_1606423 ?auto_1606427 ) ) ( not ( = ?auto_1606423 ?auto_1606428 ) ) ( not ( = ?auto_1606423 ?auto_1606429 ) ) ( not ( = ?auto_1606423 ?auto_1606430 ) ) ( not ( = ?auto_1606423 ?auto_1606433 ) ) ( not ( = ?auto_1606424 ?auto_1606425 ) ) ( not ( = ?auto_1606424 ?auto_1606426 ) ) ( not ( = ?auto_1606424 ?auto_1606427 ) ) ( not ( = ?auto_1606424 ?auto_1606428 ) ) ( not ( = ?auto_1606424 ?auto_1606429 ) ) ( not ( = ?auto_1606424 ?auto_1606430 ) ) ( not ( = ?auto_1606424 ?auto_1606433 ) ) ( not ( = ?auto_1606425 ?auto_1606426 ) ) ( not ( = ?auto_1606425 ?auto_1606427 ) ) ( not ( = ?auto_1606425 ?auto_1606428 ) ) ( not ( = ?auto_1606425 ?auto_1606429 ) ) ( not ( = ?auto_1606425 ?auto_1606430 ) ) ( not ( = ?auto_1606425 ?auto_1606433 ) ) ( not ( = ?auto_1606426 ?auto_1606427 ) ) ( not ( = ?auto_1606426 ?auto_1606428 ) ) ( not ( = ?auto_1606426 ?auto_1606429 ) ) ( not ( = ?auto_1606426 ?auto_1606430 ) ) ( not ( = ?auto_1606426 ?auto_1606433 ) ) ( not ( = ?auto_1606427 ?auto_1606428 ) ) ( not ( = ?auto_1606427 ?auto_1606429 ) ) ( not ( = ?auto_1606427 ?auto_1606430 ) ) ( not ( = ?auto_1606427 ?auto_1606433 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606428 ?auto_1606429 ?auto_1606430 )
      ( MAKE-7CRATE-VERIFY ?auto_1606423 ?auto_1606424 ?auto_1606425 ?auto_1606426 ?auto_1606427 ?auto_1606428 ?auto_1606429 ?auto_1606430 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606437 - SURFACE
      ?auto_1606438 - SURFACE
      ?auto_1606439 - SURFACE
      ?auto_1606440 - SURFACE
      ?auto_1606441 - SURFACE
      ?auto_1606442 - SURFACE
      ?auto_1606443 - SURFACE
      ?auto_1606444 - SURFACE
      ?auto_1606445 - SURFACE
    )
    :vars
    (
      ?auto_1606446 - HOIST
      ?auto_1606449 - PLACE
      ?auto_1606447 - PLACE
      ?auto_1606450 - HOIST
      ?auto_1606448 - SURFACE
      ?auto_1606451 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606446 ?auto_1606449 ) ( IS-CRATE ?auto_1606445 ) ( not ( = ?auto_1606444 ?auto_1606445 ) ) ( not ( = ?auto_1606443 ?auto_1606444 ) ) ( not ( = ?auto_1606443 ?auto_1606445 ) ) ( not ( = ?auto_1606447 ?auto_1606449 ) ) ( HOIST-AT ?auto_1606450 ?auto_1606447 ) ( not ( = ?auto_1606446 ?auto_1606450 ) ) ( SURFACE-AT ?auto_1606445 ?auto_1606447 ) ( ON ?auto_1606445 ?auto_1606448 ) ( CLEAR ?auto_1606445 ) ( not ( = ?auto_1606444 ?auto_1606448 ) ) ( not ( = ?auto_1606445 ?auto_1606448 ) ) ( not ( = ?auto_1606443 ?auto_1606448 ) ) ( SURFACE-AT ?auto_1606443 ?auto_1606449 ) ( CLEAR ?auto_1606443 ) ( IS-CRATE ?auto_1606444 ) ( AVAILABLE ?auto_1606446 ) ( TRUCK-AT ?auto_1606451 ?auto_1606447 ) ( LIFTING ?auto_1606450 ?auto_1606444 ) ( ON ?auto_1606438 ?auto_1606437 ) ( ON ?auto_1606439 ?auto_1606438 ) ( ON ?auto_1606440 ?auto_1606439 ) ( ON ?auto_1606441 ?auto_1606440 ) ( ON ?auto_1606442 ?auto_1606441 ) ( ON ?auto_1606443 ?auto_1606442 ) ( not ( = ?auto_1606437 ?auto_1606438 ) ) ( not ( = ?auto_1606437 ?auto_1606439 ) ) ( not ( = ?auto_1606437 ?auto_1606440 ) ) ( not ( = ?auto_1606437 ?auto_1606441 ) ) ( not ( = ?auto_1606437 ?auto_1606442 ) ) ( not ( = ?auto_1606437 ?auto_1606443 ) ) ( not ( = ?auto_1606437 ?auto_1606444 ) ) ( not ( = ?auto_1606437 ?auto_1606445 ) ) ( not ( = ?auto_1606437 ?auto_1606448 ) ) ( not ( = ?auto_1606438 ?auto_1606439 ) ) ( not ( = ?auto_1606438 ?auto_1606440 ) ) ( not ( = ?auto_1606438 ?auto_1606441 ) ) ( not ( = ?auto_1606438 ?auto_1606442 ) ) ( not ( = ?auto_1606438 ?auto_1606443 ) ) ( not ( = ?auto_1606438 ?auto_1606444 ) ) ( not ( = ?auto_1606438 ?auto_1606445 ) ) ( not ( = ?auto_1606438 ?auto_1606448 ) ) ( not ( = ?auto_1606439 ?auto_1606440 ) ) ( not ( = ?auto_1606439 ?auto_1606441 ) ) ( not ( = ?auto_1606439 ?auto_1606442 ) ) ( not ( = ?auto_1606439 ?auto_1606443 ) ) ( not ( = ?auto_1606439 ?auto_1606444 ) ) ( not ( = ?auto_1606439 ?auto_1606445 ) ) ( not ( = ?auto_1606439 ?auto_1606448 ) ) ( not ( = ?auto_1606440 ?auto_1606441 ) ) ( not ( = ?auto_1606440 ?auto_1606442 ) ) ( not ( = ?auto_1606440 ?auto_1606443 ) ) ( not ( = ?auto_1606440 ?auto_1606444 ) ) ( not ( = ?auto_1606440 ?auto_1606445 ) ) ( not ( = ?auto_1606440 ?auto_1606448 ) ) ( not ( = ?auto_1606441 ?auto_1606442 ) ) ( not ( = ?auto_1606441 ?auto_1606443 ) ) ( not ( = ?auto_1606441 ?auto_1606444 ) ) ( not ( = ?auto_1606441 ?auto_1606445 ) ) ( not ( = ?auto_1606441 ?auto_1606448 ) ) ( not ( = ?auto_1606442 ?auto_1606443 ) ) ( not ( = ?auto_1606442 ?auto_1606444 ) ) ( not ( = ?auto_1606442 ?auto_1606445 ) ) ( not ( = ?auto_1606442 ?auto_1606448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606443 ?auto_1606444 ?auto_1606445 )
      ( MAKE-8CRATE-VERIFY ?auto_1606437 ?auto_1606438 ?auto_1606439 ?auto_1606440 ?auto_1606441 ?auto_1606442 ?auto_1606443 ?auto_1606444 ?auto_1606445 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1606522 - SURFACE
      ?auto_1606523 - SURFACE
      ?auto_1606524 - SURFACE
      ?auto_1606525 - SURFACE
      ?auto_1606526 - SURFACE
      ?auto_1606527 - SURFACE
      ?auto_1606528 - SURFACE
      ?auto_1606529 - SURFACE
    )
    :vars
    (
      ?auto_1606533 - HOIST
      ?auto_1606535 - PLACE
      ?auto_1606534 - PLACE
      ?auto_1606532 - HOIST
      ?auto_1606530 - SURFACE
      ?auto_1606536 - TRUCK
      ?auto_1606531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606533 ?auto_1606535 ) ( IS-CRATE ?auto_1606529 ) ( not ( = ?auto_1606528 ?auto_1606529 ) ) ( not ( = ?auto_1606527 ?auto_1606528 ) ) ( not ( = ?auto_1606527 ?auto_1606529 ) ) ( not ( = ?auto_1606534 ?auto_1606535 ) ) ( HOIST-AT ?auto_1606532 ?auto_1606534 ) ( not ( = ?auto_1606533 ?auto_1606532 ) ) ( SURFACE-AT ?auto_1606529 ?auto_1606534 ) ( ON ?auto_1606529 ?auto_1606530 ) ( CLEAR ?auto_1606529 ) ( not ( = ?auto_1606528 ?auto_1606530 ) ) ( not ( = ?auto_1606529 ?auto_1606530 ) ) ( not ( = ?auto_1606527 ?auto_1606530 ) ) ( SURFACE-AT ?auto_1606527 ?auto_1606535 ) ( CLEAR ?auto_1606527 ) ( IS-CRATE ?auto_1606528 ) ( AVAILABLE ?auto_1606533 ) ( TRUCK-AT ?auto_1606536 ?auto_1606534 ) ( AVAILABLE ?auto_1606532 ) ( SURFACE-AT ?auto_1606528 ?auto_1606534 ) ( ON ?auto_1606528 ?auto_1606531 ) ( CLEAR ?auto_1606528 ) ( not ( = ?auto_1606528 ?auto_1606531 ) ) ( not ( = ?auto_1606529 ?auto_1606531 ) ) ( not ( = ?auto_1606527 ?auto_1606531 ) ) ( not ( = ?auto_1606530 ?auto_1606531 ) ) ( ON ?auto_1606523 ?auto_1606522 ) ( ON ?auto_1606524 ?auto_1606523 ) ( ON ?auto_1606525 ?auto_1606524 ) ( ON ?auto_1606526 ?auto_1606525 ) ( ON ?auto_1606527 ?auto_1606526 ) ( not ( = ?auto_1606522 ?auto_1606523 ) ) ( not ( = ?auto_1606522 ?auto_1606524 ) ) ( not ( = ?auto_1606522 ?auto_1606525 ) ) ( not ( = ?auto_1606522 ?auto_1606526 ) ) ( not ( = ?auto_1606522 ?auto_1606527 ) ) ( not ( = ?auto_1606522 ?auto_1606528 ) ) ( not ( = ?auto_1606522 ?auto_1606529 ) ) ( not ( = ?auto_1606522 ?auto_1606530 ) ) ( not ( = ?auto_1606522 ?auto_1606531 ) ) ( not ( = ?auto_1606523 ?auto_1606524 ) ) ( not ( = ?auto_1606523 ?auto_1606525 ) ) ( not ( = ?auto_1606523 ?auto_1606526 ) ) ( not ( = ?auto_1606523 ?auto_1606527 ) ) ( not ( = ?auto_1606523 ?auto_1606528 ) ) ( not ( = ?auto_1606523 ?auto_1606529 ) ) ( not ( = ?auto_1606523 ?auto_1606530 ) ) ( not ( = ?auto_1606523 ?auto_1606531 ) ) ( not ( = ?auto_1606524 ?auto_1606525 ) ) ( not ( = ?auto_1606524 ?auto_1606526 ) ) ( not ( = ?auto_1606524 ?auto_1606527 ) ) ( not ( = ?auto_1606524 ?auto_1606528 ) ) ( not ( = ?auto_1606524 ?auto_1606529 ) ) ( not ( = ?auto_1606524 ?auto_1606530 ) ) ( not ( = ?auto_1606524 ?auto_1606531 ) ) ( not ( = ?auto_1606525 ?auto_1606526 ) ) ( not ( = ?auto_1606525 ?auto_1606527 ) ) ( not ( = ?auto_1606525 ?auto_1606528 ) ) ( not ( = ?auto_1606525 ?auto_1606529 ) ) ( not ( = ?auto_1606525 ?auto_1606530 ) ) ( not ( = ?auto_1606525 ?auto_1606531 ) ) ( not ( = ?auto_1606526 ?auto_1606527 ) ) ( not ( = ?auto_1606526 ?auto_1606528 ) ) ( not ( = ?auto_1606526 ?auto_1606529 ) ) ( not ( = ?auto_1606526 ?auto_1606530 ) ) ( not ( = ?auto_1606526 ?auto_1606531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606527 ?auto_1606528 ?auto_1606529 )
      ( MAKE-7CRATE-VERIFY ?auto_1606522 ?auto_1606523 ?auto_1606524 ?auto_1606525 ?auto_1606526 ?auto_1606527 ?auto_1606528 ?auto_1606529 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606537 - SURFACE
      ?auto_1606538 - SURFACE
      ?auto_1606539 - SURFACE
      ?auto_1606540 - SURFACE
      ?auto_1606541 - SURFACE
      ?auto_1606542 - SURFACE
      ?auto_1606543 - SURFACE
      ?auto_1606544 - SURFACE
      ?auto_1606545 - SURFACE
    )
    :vars
    (
      ?auto_1606549 - HOIST
      ?auto_1606551 - PLACE
      ?auto_1606550 - PLACE
      ?auto_1606548 - HOIST
      ?auto_1606546 - SURFACE
      ?auto_1606552 - TRUCK
      ?auto_1606547 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606549 ?auto_1606551 ) ( IS-CRATE ?auto_1606545 ) ( not ( = ?auto_1606544 ?auto_1606545 ) ) ( not ( = ?auto_1606543 ?auto_1606544 ) ) ( not ( = ?auto_1606543 ?auto_1606545 ) ) ( not ( = ?auto_1606550 ?auto_1606551 ) ) ( HOIST-AT ?auto_1606548 ?auto_1606550 ) ( not ( = ?auto_1606549 ?auto_1606548 ) ) ( SURFACE-AT ?auto_1606545 ?auto_1606550 ) ( ON ?auto_1606545 ?auto_1606546 ) ( CLEAR ?auto_1606545 ) ( not ( = ?auto_1606544 ?auto_1606546 ) ) ( not ( = ?auto_1606545 ?auto_1606546 ) ) ( not ( = ?auto_1606543 ?auto_1606546 ) ) ( SURFACE-AT ?auto_1606543 ?auto_1606551 ) ( CLEAR ?auto_1606543 ) ( IS-CRATE ?auto_1606544 ) ( AVAILABLE ?auto_1606549 ) ( TRUCK-AT ?auto_1606552 ?auto_1606550 ) ( AVAILABLE ?auto_1606548 ) ( SURFACE-AT ?auto_1606544 ?auto_1606550 ) ( ON ?auto_1606544 ?auto_1606547 ) ( CLEAR ?auto_1606544 ) ( not ( = ?auto_1606544 ?auto_1606547 ) ) ( not ( = ?auto_1606545 ?auto_1606547 ) ) ( not ( = ?auto_1606543 ?auto_1606547 ) ) ( not ( = ?auto_1606546 ?auto_1606547 ) ) ( ON ?auto_1606538 ?auto_1606537 ) ( ON ?auto_1606539 ?auto_1606538 ) ( ON ?auto_1606540 ?auto_1606539 ) ( ON ?auto_1606541 ?auto_1606540 ) ( ON ?auto_1606542 ?auto_1606541 ) ( ON ?auto_1606543 ?auto_1606542 ) ( not ( = ?auto_1606537 ?auto_1606538 ) ) ( not ( = ?auto_1606537 ?auto_1606539 ) ) ( not ( = ?auto_1606537 ?auto_1606540 ) ) ( not ( = ?auto_1606537 ?auto_1606541 ) ) ( not ( = ?auto_1606537 ?auto_1606542 ) ) ( not ( = ?auto_1606537 ?auto_1606543 ) ) ( not ( = ?auto_1606537 ?auto_1606544 ) ) ( not ( = ?auto_1606537 ?auto_1606545 ) ) ( not ( = ?auto_1606537 ?auto_1606546 ) ) ( not ( = ?auto_1606537 ?auto_1606547 ) ) ( not ( = ?auto_1606538 ?auto_1606539 ) ) ( not ( = ?auto_1606538 ?auto_1606540 ) ) ( not ( = ?auto_1606538 ?auto_1606541 ) ) ( not ( = ?auto_1606538 ?auto_1606542 ) ) ( not ( = ?auto_1606538 ?auto_1606543 ) ) ( not ( = ?auto_1606538 ?auto_1606544 ) ) ( not ( = ?auto_1606538 ?auto_1606545 ) ) ( not ( = ?auto_1606538 ?auto_1606546 ) ) ( not ( = ?auto_1606538 ?auto_1606547 ) ) ( not ( = ?auto_1606539 ?auto_1606540 ) ) ( not ( = ?auto_1606539 ?auto_1606541 ) ) ( not ( = ?auto_1606539 ?auto_1606542 ) ) ( not ( = ?auto_1606539 ?auto_1606543 ) ) ( not ( = ?auto_1606539 ?auto_1606544 ) ) ( not ( = ?auto_1606539 ?auto_1606545 ) ) ( not ( = ?auto_1606539 ?auto_1606546 ) ) ( not ( = ?auto_1606539 ?auto_1606547 ) ) ( not ( = ?auto_1606540 ?auto_1606541 ) ) ( not ( = ?auto_1606540 ?auto_1606542 ) ) ( not ( = ?auto_1606540 ?auto_1606543 ) ) ( not ( = ?auto_1606540 ?auto_1606544 ) ) ( not ( = ?auto_1606540 ?auto_1606545 ) ) ( not ( = ?auto_1606540 ?auto_1606546 ) ) ( not ( = ?auto_1606540 ?auto_1606547 ) ) ( not ( = ?auto_1606541 ?auto_1606542 ) ) ( not ( = ?auto_1606541 ?auto_1606543 ) ) ( not ( = ?auto_1606541 ?auto_1606544 ) ) ( not ( = ?auto_1606541 ?auto_1606545 ) ) ( not ( = ?auto_1606541 ?auto_1606546 ) ) ( not ( = ?auto_1606541 ?auto_1606547 ) ) ( not ( = ?auto_1606542 ?auto_1606543 ) ) ( not ( = ?auto_1606542 ?auto_1606544 ) ) ( not ( = ?auto_1606542 ?auto_1606545 ) ) ( not ( = ?auto_1606542 ?auto_1606546 ) ) ( not ( = ?auto_1606542 ?auto_1606547 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606543 ?auto_1606544 ?auto_1606545 )
      ( MAKE-8CRATE-VERIFY ?auto_1606537 ?auto_1606538 ?auto_1606539 ?auto_1606540 ?auto_1606541 ?auto_1606542 ?auto_1606543 ?auto_1606544 ?auto_1606545 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1606623 - SURFACE
      ?auto_1606624 - SURFACE
      ?auto_1606625 - SURFACE
      ?auto_1606626 - SURFACE
      ?auto_1606627 - SURFACE
      ?auto_1606628 - SURFACE
      ?auto_1606629 - SURFACE
      ?auto_1606630 - SURFACE
    )
    :vars
    (
      ?auto_1606631 - HOIST
      ?auto_1606637 - PLACE
      ?auto_1606635 - PLACE
      ?auto_1606633 - HOIST
      ?auto_1606634 - SURFACE
      ?auto_1606632 - SURFACE
      ?auto_1606636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606631 ?auto_1606637 ) ( IS-CRATE ?auto_1606630 ) ( not ( = ?auto_1606629 ?auto_1606630 ) ) ( not ( = ?auto_1606628 ?auto_1606629 ) ) ( not ( = ?auto_1606628 ?auto_1606630 ) ) ( not ( = ?auto_1606635 ?auto_1606637 ) ) ( HOIST-AT ?auto_1606633 ?auto_1606635 ) ( not ( = ?auto_1606631 ?auto_1606633 ) ) ( SURFACE-AT ?auto_1606630 ?auto_1606635 ) ( ON ?auto_1606630 ?auto_1606634 ) ( CLEAR ?auto_1606630 ) ( not ( = ?auto_1606629 ?auto_1606634 ) ) ( not ( = ?auto_1606630 ?auto_1606634 ) ) ( not ( = ?auto_1606628 ?auto_1606634 ) ) ( SURFACE-AT ?auto_1606628 ?auto_1606637 ) ( CLEAR ?auto_1606628 ) ( IS-CRATE ?auto_1606629 ) ( AVAILABLE ?auto_1606631 ) ( AVAILABLE ?auto_1606633 ) ( SURFACE-AT ?auto_1606629 ?auto_1606635 ) ( ON ?auto_1606629 ?auto_1606632 ) ( CLEAR ?auto_1606629 ) ( not ( = ?auto_1606629 ?auto_1606632 ) ) ( not ( = ?auto_1606630 ?auto_1606632 ) ) ( not ( = ?auto_1606628 ?auto_1606632 ) ) ( not ( = ?auto_1606634 ?auto_1606632 ) ) ( TRUCK-AT ?auto_1606636 ?auto_1606637 ) ( ON ?auto_1606624 ?auto_1606623 ) ( ON ?auto_1606625 ?auto_1606624 ) ( ON ?auto_1606626 ?auto_1606625 ) ( ON ?auto_1606627 ?auto_1606626 ) ( ON ?auto_1606628 ?auto_1606627 ) ( not ( = ?auto_1606623 ?auto_1606624 ) ) ( not ( = ?auto_1606623 ?auto_1606625 ) ) ( not ( = ?auto_1606623 ?auto_1606626 ) ) ( not ( = ?auto_1606623 ?auto_1606627 ) ) ( not ( = ?auto_1606623 ?auto_1606628 ) ) ( not ( = ?auto_1606623 ?auto_1606629 ) ) ( not ( = ?auto_1606623 ?auto_1606630 ) ) ( not ( = ?auto_1606623 ?auto_1606634 ) ) ( not ( = ?auto_1606623 ?auto_1606632 ) ) ( not ( = ?auto_1606624 ?auto_1606625 ) ) ( not ( = ?auto_1606624 ?auto_1606626 ) ) ( not ( = ?auto_1606624 ?auto_1606627 ) ) ( not ( = ?auto_1606624 ?auto_1606628 ) ) ( not ( = ?auto_1606624 ?auto_1606629 ) ) ( not ( = ?auto_1606624 ?auto_1606630 ) ) ( not ( = ?auto_1606624 ?auto_1606634 ) ) ( not ( = ?auto_1606624 ?auto_1606632 ) ) ( not ( = ?auto_1606625 ?auto_1606626 ) ) ( not ( = ?auto_1606625 ?auto_1606627 ) ) ( not ( = ?auto_1606625 ?auto_1606628 ) ) ( not ( = ?auto_1606625 ?auto_1606629 ) ) ( not ( = ?auto_1606625 ?auto_1606630 ) ) ( not ( = ?auto_1606625 ?auto_1606634 ) ) ( not ( = ?auto_1606625 ?auto_1606632 ) ) ( not ( = ?auto_1606626 ?auto_1606627 ) ) ( not ( = ?auto_1606626 ?auto_1606628 ) ) ( not ( = ?auto_1606626 ?auto_1606629 ) ) ( not ( = ?auto_1606626 ?auto_1606630 ) ) ( not ( = ?auto_1606626 ?auto_1606634 ) ) ( not ( = ?auto_1606626 ?auto_1606632 ) ) ( not ( = ?auto_1606627 ?auto_1606628 ) ) ( not ( = ?auto_1606627 ?auto_1606629 ) ) ( not ( = ?auto_1606627 ?auto_1606630 ) ) ( not ( = ?auto_1606627 ?auto_1606634 ) ) ( not ( = ?auto_1606627 ?auto_1606632 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606628 ?auto_1606629 ?auto_1606630 )
      ( MAKE-7CRATE-VERIFY ?auto_1606623 ?auto_1606624 ?auto_1606625 ?auto_1606626 ?auto_1606627 ?auto_1606628 ?auto_1606629 ?auto_1606630 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606638 - SURFACE
      ?auto_1606639 - SURFACE
      ?auto_1606640 - SURFACE
      ?auto_1606641 - SURFACE
      ?auto_1606642 - SURFACE
      ?auto_1606643 - SURFACE
      ?auto_1606644 - SURFACE
      ?auto_1606645 - SURFACE
      ?auto_1606646 - SURFACE
    )
    :vars
    (
      ?auto_1606647 - HOIST
      ?auto_1606653 - PLACE
      ?auto_1606651 - PLACE
      ?auto_1606649 - HOIST
      ?auto_1606650 - SURFACE
      ?auto_1606648 - SURFACE
      ?auto_1606652 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606647 ?auto_1606653 ) ( IS-CRATE ?auto_1606646 ) ( not ( = ?auto_1606645 ?auto_1606646 ) ) ( not ( = ?auto_1606644 ?auto_1606645 ) ) ( not ( = ?auto_1606644 ?auto_1606646 ) ) ( not ( = ?auto_1606651 ?auto_1606653 ) ) ( HOIST-AT ?auto_1606649 ?auto_1606651 ) ( not ( = ?auto_1606647 ?auto_1606649 ) ) ( SURFACE-AT ?auto_1606646 ?auto_1606651 ) ( ON ?auto_1606646 ?auto_1606650 ) ( CLEAR ?auto_1606646 ) ( not ( = ?auto_1606645 ?auto_1606650 ) ) ( not ( = ?auto_1606646 ?auto_1606650 ) ) ( not ( = ?auto_1606644 ?auto_1606650 ) ) ( SURFACE-AT ?auto_1606644 ?auto_1606653 ) ( CLEAR ?auto_1606644 ) ( IS-CRATE ?auto_1606645 ) ( AVAILABLE ?auto_1606647 ) ( AVAILABLE ?auto_1606649 ) ( SURFACE-AT ?auto_1606645 ?auto_1606651 ) ( ON ?auto_1606645 ?auto_1606648 ) ( CLEAR ?auto_1606645 ) ( not ( = ?auto_1606645 ?auto_1606648 ) ) ( not ( = ?auto_1606646 ?auto_1606648 ) ) ( not ( = ?auto_1606644 ?auto_1606648 ) ) ( not ( = ?auto_1606650 ?auto_1606648 ) ) ( TRUCK-AT ?auto_1606652 ?auto_1606653 ) ( ON ?auto_1606639 ?auto_1606638 ) ( ON ?auto_1606640 ?auto_1606639 ) ( ON ?auto_1606641 ?auto_1606640 ) ( ON ?auto_1606642 ?auto_1606641 ) ( ON ?auto_1606643 ?auto_1606642 ) ( ON ?auto_1606644 ?auto_1606643 ) ( not ( = ?auto_1606638 ?auto_1606639 ) ) ( not ( = ?auto_1606638 ?auto_1606640 ) ) ( not ( = ?auto_1606638 ?auto_1606641 ) ) ( not ( = ?auto_1606638 ?auto_1606642 ) ) ( not ( = ?auto_1606638 ?auto_1606643 ) ) ( not ( = ?auto_1606638 ?auto_1606644 ) ) ( not ( = ?auto_1606638 ?auto_1606645 ) ) ( not ( = ?auto_1606638 ?auto_1606646 ) ) ( not ( = ?auto_1606638 ?auto_1606650 ) ) ( not ( = ?auto_1606638 ?auto_1606648 ) ) ( not ( = ?auto_1606639 ?auto_1606640 ) ) ( not ( = ?auto_1606639 ?auto_1606641 ) ) ( not ( = ?auto_1606639 ?auto_1606642 ) ) ( not ( = ?auto_1606639 ?auto_1606643 ) ) ( not ( = ?auto_1606639 ?auto_1606644 ) ) ( not ( = ?auto_1606639 ?auto_1606645 ) ) ( not ( = ?auto_1606639 ?auto_1606646 ) ) ( not ( = ?auto_1606639 ?auto_1606650 ) ) ( not ( = ?auto_1606639 ?auto_1606648 ) ) ( not ( = ?auto_1606640 ?auto_1606641 ) ) ( not ( = ?auto_1606640 ?auto_1606642 ) ) ( not ( = ?auto_1606640 ?auto_1606643 ) ) ( not ( = ?auto_1606640 ?auto_1606644 ) ) ( not ( = ?auto_1606640 ?auto_1606645 ) ) ( not ( = ?auto_1606640 ?auto_1606646 ) ) ( not ( = ?auto_1606640 ?auto_1606650 ) ) ( not ( = ?auto_1606640 ?auto_1606648 ) ) ( not ( = ?auto_1606641 ?auto_1606642 ) ) ( not ( = ?auto_1606641 ?auto_1606643 ) ) ( not ( = ?auto_1606641 ?auto_1606644 ) ) ( not ( = ?auto_1606641 ?auto_1606645 ) ) ( not ( = ?auto_1606641 ?auto_1606646 ) ) ( not ( = ?auto_1606641 ?auto_1606650 ) ) ( not ( = ?auto_1606641 ?auto_1606648 ) ) ( not ( = ?auto_1606642 ?auto_1606643 ) ) ( not ( = ?auto_1606642 ?auto_1606644 ) ) ( not ( = ?auto_1606642 ?auto_1606645 ) ) ( not ( = ?auto_1606642 ?auto_1606646 ) ) ( not ( = ?auto_1606642 ?auto_1606650 ) ) ( not ( = ?auto_1606642 ?auto_1606648 ) ) ( not ( = ?auto_1606643 ?auto_1606644 ) ) ( not ( = ?auto_1606643 ?auto_1606645 ) ) ( not ( = ?auto_1606643 ?auto_1606646 ) ) ( not ( = ?auto_1606643 ?auto_1606650 ) ) ( not ( = ?auto_1606643 ?auto_1606648 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606644 ?auto_1606645 ?auto_1606646 )
      ( MAKE-8CRATE-VERIFY ?auto_1606638 ?auto_1606639 ?auto_1606640 ?auto_1606641 ?auto_1606642 ?auto_1606643 ?auto_1606644 ?auto_1606645 ?auto_1606646 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1606726 - SURFACE
      ?auto_1606727 - SURFACE
      ?auto_1606728 - SURFACE
      ?auto_1606729 - SURFACE
      ?auto_1606730 - SURFACE
      ?auto_1606731 - SURFACE
      ?auto_1606732 - SURFACE
      ?auto_1606733 - SURFACE
    )
    :vars
    (
      ?auto_1606740 - HOIST
      ?auto_1606738 - PLACE
      ?auto_1606737 - PLACE
      ?auto_1606736 - HOIST
      ?auto_1606735 - SURFACE
      ?auto_1606739 - SURFACE
      ?auto_1606734 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606740 ?auto_1606738 ) ( IS-CRATE ?auto_1606733 ) ( not ( = ?auto_1606732 ?auto_1606733 ) ) ( not ( = ?auto_1606731 ?auto_1606732 ) ) ( not ( = ?auto_1606731 ?auto_1606733 ) ) ( not ( = ?auto_1606737 ?auto_1606738 ) ) ( HOIST-AT ?auto_1606736 ?auto_1606737 ) ( not ( = ?auto_1606740 ?auto_1606736 ) ) ( SURFACE-AT ?auto_1606733 ?auto_1606737 ) ( ON ?auto_1606733 ?auto_1606735 ) ( CLEAR ?auto_1606733 ) ( not ( = ?auto_1606732 ?auto_1606735 ) ) ( not ( = ?auto_1606733 ?auto_1606735 ) ) ( not ( = ?auto_1606731 ?auto_1606735 ) ) ( IS-CRATE ?auto_1606732 ) ( AVAILABLE ?auto_1606736 ) ( SURFACE-AT ?auto_1606732 ?auto_1606737 ) ( ON ?auto_1606732 ?auto_1606739 ) ( CLEAR ?auto_1606732 ) ( not ( = ?auto_1606732 ?auto_1606739 ) ) ( not ( = ?auto_1606733 ?auto_1606739 ) ) ( not ( = ?auto_1606731 ?auto_1606739 ) ) ( not ( = ?auto_1606735 ?auto_1606739 ) ) ( TRUCK-AT ?auto_1606734 ?auto_1606738 ) ( SURFACE-AT ?auto_1606730 ?auto_1606738 ) ( CLEAR ?auto_1606730 ) ( LIFTING ?auto_1606740 ?auto_1606731 ) ( IS-CRATE ?auto_1606731 ) ( not ( = ?auto_1606730 ?auto_1606731 ) ) ( not ( = ?auto_1606732 ?auto_1606730 ) ) ( not ( = ?auto_1606733 ?auto_1606730 ) ) ( not ( = ?auto_1606735 ?auto_1606730 ) ) ( not ( = ?auto_1606739 ?auto_1606730 ) ) ( ON ?auto_1606727 ?auto_1606726 ) ( ON ?auto_1606728 ?auto_1606727 ) ( ON ?auto_1606729 ?auto_1606728 ) ( ON ?auto_1606730 ?auto_1606729 ) ( not ( = ?auto_1606726 ?auto_1606727 ) ) ( not ( = ?auto_1606726 ?auto_1606728 ) ) ( not ( = ?auto_1606726 ?auto_1606729 ) ) ( not ( = ?auto_1606726 ?auto_1606730 ) ) ( not ( = ?auto_1606726 ?auto_1606731 ) ) ( not ( = ?auto_1606726 ?auto_1606732 ) ) ( not ( = ?auto_1606726 ?auto_1606733 ) ) ( not ( = ?auto_1606726 ?auto_1606735 ) ) ( not ( = ?auto_1606726 ?auto_1606739 ) ) ( not ( = ?auto_1606727 ?auto_1606728 ) ) ( not ( = ?auto_1606727 ?auto_1606729 ) ) ( not ( = ?auto_1606727 ?auto_1606730 ) ) ( not ( = ?auto_1606727 ?auto_1606731 ) ) ( not ( = ?auto_1606727 ?auto_1606732 ) ) ( not ( = ?auto_1606727 ?auto_1606733 ) ) ( not ( = ?auto_1606727 ?auto_1606735 ) ) ( not ( = ?auto_1606727 ?auto_1606739 ) ) ( not ( = ?auto_1606728 ?auto_1606729 ) ) ( not ( = ?auto_1606728 ?auto_1606730 ) ) ( not ( = ?auto_1606728 ?auto_1606731 ) ) ( not ( = ?auto_1606728 ?auto_1606732 ) ) ( not ( = ?auto_1606728 ?auto_1606733 ) ) ( not ( = ?auto_1606728 ?auto_1606735 ) ) ( not ( = ?auto_1606728 ?auto_1606739 ) ) ( not ( = ?auto_1606729 ?auto_1606730 ) ) ( not ( = ?auto_1606729 ?auto_1606731 ) ) ( not ( = ?auto_1606729 ?auto_1606732 ) ) ( not ( = ?auto_1606729 ?auto_1606733 ) ) ( not ( = ?auto_1606729 ?auto_1606735 ) ) ( not ( = ?auto_1606729 ?auto_1606739 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606731 ?auto_1606732 ?auto_1606733 )
      ( MAKE-7CRATE-VERIFY ?auto_1606726 ?auto_1606727 ?auto_1606728 ?auto_1606729 ?auto_1606730 ?auto_1606731 ?auto_1606732 ?auto_1606733 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1606741 - SURFACE
      ?auto_1606742 - SURFACE
      ?auto_1606743 - SURFACE
      ?auto_1606744 - SURFACE
      ?auto_1606745 - SURFACE
      ?auto_1606746 - SURFACE
      ?auto_1606747 - SURFACE
      ?auto_1606748 - SURFACE
      ?auto_1606749 - SURFACE
    )
    :vars
    (
      ?auto_1606756 - HOIST
      ?auto_1606754 - PLACE
      ?auto_1606753 - PLACE
      ?auto_1606752 - HOIST
      ?auto_1606751 - SURFACE
      ?auto_1606755 - SURFACE
      ?auto_1606750 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1606756 ?auto_1606754 ) ( IS-CRATE ?auto_1606749 ) ( not ( = ?auto_1606748 ?auto_1606749 ) ) ( not ( = ?auto_1606747 ?auto_1606748 ) ) ( not ( = ?auto_1606747 ?auto_1606749 ) ) ( not ( = ?auto_1606753 ?auto_1606754 ) ) ( HOIST-AT ?auto_1606752 ?auto_1606753 ) ( not ( = ?auto_1606756 ?auto_1606752 ) ) ( SURFACE-AT ?auto_1606749 ?auto_1606753 ) ( ON ?auto_1606749 ?auto_1606751 ) ( CLEAR ?auto_1606749 ) ( not ( = ?auto_1606748 ?auto_1606751 ) ) ( not ( = ?auto_1606749 ?auto_1606751 ) ) ( not ( = ?auto_1606747 ?auto_1606751 ) ) ( IS-CRATE ?auto_1606748 ) ( AVAILABLE ?auto_1606752 ) ( SURFACE-AT ?auto_1606748 ?auto_1606753 ) ( ON ?auto_1606748 ?auto_1606755 ) ( CLEAR ?auto_1606748 ) ( not ( = ?auto_1606748 ?auto_1606755 ) ) ( not ( = ?auto_1606749 ?auto_1606755 ) ) ( not ( = ?auto_1606747 ?auto_1606755 ) ) ( not ( = ?auto_1606751 ?auto_1606755 ) ) ( TRUCK-AT ?auto_1606750 ?auto_1606754 ) ( SURFACE-AT ?auto_1606746 ?auto_1606754 ) ( CLEAR ?auto_1606746 ) ( LIFTING ?auto_1606756 ?auto_1606747 ) ( IS-CRATE ?auto_1606747 ) ( not ( = ?auto_1606746 ?auto_1606747 ) ) ( not ( = ?auto_1606748 ?auto_1606746 ) ) ( not ( = ?auto_1606749 ?auto_1606746 ) ) ( not ( = ?auto_1606751 ?auto_1606746 ) ) ( not ( = ?auto_1606755 ?auto_1606746 ) ) ( ON ?auto_1606742 ?auto_1606741 ) ( ON ?auto_1606743 ?auto_1606742 ) ( ON ?auto_1606744 ?auto_1606743 ) ( ON ?auto_1606745 ?auto_1606744 ) ( ON ?auto_1606746 ?auto_1606745 ) ( not ( = ?auto_1606741 ?auto_1606742 ) ) ( not ( = ?auto_1606741 ?auto_1606743 ) ) ( not ( = ?auto_1606741 ?auto_1606744 ) ) ( not ( = ?auto_1606741 ?auto_1606745 ) ) ( not ( = ?auto_1606741 ?auto_1606746 ) ) ( not ( = ?auto_1606741 ?auto_1606747 ) ) ( not ( = ?auto_1606741 ?auto_1606748 ) ) ( not ( = ?auto_1606741 ?auto_1606749 ) ) ( not ( = ?auto_1606741 ?auto_1606751 ) ) ( not ( = ?auto_1606741 ?auto_1606755 ) ) ( not ( = ?auto_1606742 ?auto_1606743 ) ) ( not ( = ?auto_1606742 ?auto_1606744 ) ) ( not ( = ?auto_1606742 ?auto_1606745 ) ) ( not ( = ?auto_1606742 ?auto_1606746 ) ) ( not ( = ?auto_1606742 ?auto_1606747 ) ) ( not ( = ?auto_1606742 ?auto_1606748 ) ) ( not ( = ?auto_1606742 ?auto_1606749 ) ) ( not ( = ?auto_1606742 ?auto_1606751 ) ) ( not ( = ?auto_1606742 ?auto_1606755 ) ) ( not ( = ?auto_1606743 ?auto_1606744 ) ) ( not ( = ?auto_1606743 ?auto_1606745 ) ) ( not ( = ?auto_1606743 ?auto_1606746 ) ) ( not ( = ?auto_1606743 ?auto_1606747 ) ) ( not ( = ?auto_1606743 ?auto_1606748 ) ) ( not ( = ?auto_1606743 ?auto_1606749 ) ) ( not ( = ?auto_1606743 ?auto_1606751 ) ) ( not ( = ?auto_1606743 ?auto_1606755 ) ) ( not ( = ?auto_1606744 ?auto_1606745 ) ) ( not ( = ?auto_1606744 ?auto_1606746 ) ) ( not ( = ?auto_1606744 ?auto_1606747 ) ) ( not ( = ?auto_1606744 ?auto_1606748 ) ) ( not ( = ?auto_1606744 ?auto_1606749 ) ) ( not ( = ?auto_1606744 ?auto_1606751 ) ) ( not ( = ?auto_1606744 ?auto_1606755 ) ) ( not ( = ?auto_1606745 ?auto_1606746 ) ) ( not ( = ?auto_1606745 ?auto_1606747 ) ) ( not ( = ?auto_1606745 ?auto_1606748 ) ) ( not ( = ?auto_1606745 ?auto_1606749 ) ) ( not ( = ?auto_1606745 ?auto_1606751 ) ) ( not ( = ?auto_1606745 ?auto_1606755 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1606747 ?auto_1606748 ?auto_1606749 )
      ( MAKE-8CRATE-VERIFY ?auto_1606741 ?auto_1606742 ?auto_1606743 ?auto_1606744 ?auto_1606745 ?auto_1606746 ?auto_1606747 ?auto_1606748 ?auto_1606749 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1609248 - SURFACE
      ?auto_1609249 - SURFACE
    )
    :vars
    (
      ?auto_1609257 - HOIST
      ?auto_1609251 - PLACE
      ?auto_1609254 - SURFACE
      ?auto_1609250 - PLACE
      ?auto_1609253 - HOIST
      ?auto_1609256 - SURFACE
      ?auto_1609252 - TRUCK
      ?auto_1609255 - SURFACE
      ?auto_1609258 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609257 ?auto_1609251 ) ( IS-CRATE ?auto_1609249 ) ( not ( = ?auto_1609248 ?auto_1609249 ) ) ( not ( = ?auto_1609254 ?auto_1609248 ) ) ( not ( = ?auto_1609254 ?auto_1609249 ) ) ( not ( = ?auto_1609250 ?auto_1609251 ) ) ( HOIST-AT ?auto_1609253 ?auto_1609250 ) ( not ( = ?auto_1609257 ?auto_1609253 ) ) ( SURFACE-AT ?auto_1609249 ?auto_1609250 ) ( ON ?auto_1609249 ?auto_1609256 ) ( CLEAR ?auto_1609249 ) ( not ( = ?auto_1609248 ?auto_1609256 ) ) ( not ( = ?auto_1609249 ?auto_1609256 ) ) ( not ( = ?auto_1609254 ?auto_1609256 ) ) ( SURFACE-AT ?auto_1609254 ?auto_1609251 ) ( CLEAR ?auto_1609254 ) ( IS-CRATE ?auto_1609248 ) ( AVAILABLE ?auto_1609257 ) ( TRUCK-AT ?auto_1609252 ?auto_1609250 ) ( SURFACE-AT ?auto_1609248 ?auto_1609250 ) ( ON ?auto_1609248 ?auto_1609255 ) ( CLEAR ?auto_1609248 ) ( not ( = ?auto_1609248 ?auto_1609255 ) ) ( not ( = ?auto_1609249 ?auto_1609255 ) ) ( not ( = ?auto_1609254 ?auto_1609255 ) ) ( not ( = ?auto_1609256 ?auto_1609255 ) ) ( LIFTING ?auto_1609253 ?auto_1609258 ) ( IS-CRATE ?auto_1609258 ) ( not ( = ?auto_1609248 ?auto_1609258 ) ) ( not ( = ?auto_1609249 ?auto_1609258 ) ) ( not ( = ?auto_1609254 ?auto_1609258 ) ) ( not ( = ?auto_1609256 ?auto_1609258 ) ) ( not ( = ?auto_1609255 ?auto_1609258 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1609253 ?auto_1609258 ?auto_1609252 ?auto_1609250 )
      ( MAKE-2CRATE ?auto_1609254 ?auto_1609248 ?auto_1609249 )
      ( MAKE-1CRATE-VERIFY ?auto_1609248 ?auto_1609249 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1609259 - SURFACE
      ?auto_1609260 - SURFACE
      ?auto_1609261 - SURFACE
    )
    :vars
    (
      ?auto_1609264 - HOIST
      ?auto_1609267 - PLACE
      ?auto_1609266 - PLACE
      ?auto_1609263 - HOIST
      ?auto_1609262 - SURFACE
      ?auto_1609265 - TRUCK
      ?auto_1609269 - SURFACE
      ?auto_1609268 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1609264 ?auto_1609267 ) ( IS-CRATE ?auto_1609261 ) ( not ( = ?auto_1609260 ?auto_1609261 ) ) ( not ( = ?auto_1609259 ?auto_1609260 ) ) ( not ( = ?auto_1609259 ?auto_1609261 ) ) ( not ( = ?auto_1609266 ?auto_1609267 ) ) ( HOIST-AT ?auto_1609263 ?auto_1609266 ) ( not ( = ?auto_1609264 ?auto_1609263 ) ) ( SURFACE-AT ?auto_1609261 ?auto_1609266 ) ( ON ?auto_1609261 ?auto_1609262 ) ( CLEAR ?auto_1609261 ) ( not ( = ?auto_1609260 ?auto_1609262 ) ) ( not ( = ?auto_1609261 ?auto_1609262 ) ) ( not ( = ?auto_1609259 ?auto_1609262 ) ) ( SURFACE-AT ?auto_1609259 ?auto_1609267 ) ( CLEAR ?auto_1609259 ) ( IS-CRATE ?auto_1609260 ) ( AVAILABLE ?auto_1609264 ) ( TRUCK-AT ?auto_1609265 ?auto_1609266 ) ( SURFACE-AT ?auto_1609260 ?auto_1609266 ) ( ON ?auto_1609260 ?auto_1609269 ) ( CLEAR ?auto_1609260 ) ( not ( = ?auto_1609260 ?auto_1609269 ) ) ( not ( = ?auto_1609261 ?auto_1609269 ) ) ( not ( = ?auto_1609259 ?auto_1609269 ) ) ( not ( = ?auto_1609262 ?auto_1609269 ) ) ( LIFTING ?auto_1609263 ?auto_1609268 ) ( IS-CRATE ?auto_1609268 ) ( not ( = ?auto_1609260 ?auto_1609268 ) ) ( not ( = ?auto_1609261 ?auto_1609268 ) ) ( not ( = ?auto_1609259 ?auto_1609268 ) ) ( not ( = ?auto_1609262 ?auto_1609268 ) ) ( not ( = ?auto_1609269 ?auto_1609268 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1609260 ?auto_1609261 )
      ( MAKE-2CRATE-VERIFY ?auto_1609259 ?auto_1609260 ?auto_1609261 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610257 - SURFACE
      ?auto_1610258 - SURFACE
      ?auto_1610259 - SURFACE
      ?auto_1610260 - SURFACE
      ?auto_1610261 - SURFACE
      ?auto_1610262 - SURFACE
      ?auto_1610263 - SURFACE
      ?auto_1610264 - SURFACE
      ?auto_1610265 - SURFACE
      ?auto_1610266 - SURFACE
    )
    :vars
    (
      ?auto_1610268 - HOIST
      ?auto_1610267 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610268 ?auto_1610267 ) ( SURFACE-AT ?auto_1610265 ?auto_1610267 ) ( CLEAR ?auto_1610265 ) ( LIFTING ?auto_1610268 ?auto_1610266 ) ( IS-CRATE ?auto_1610266 ) ( not ( = ?auto_1610265 ?auto_1610266 ) ) ( ON ?auto_1610258 ?auto_1610257 ) ( ON ?auto_1610259 ?auto_1610258 ) ( ON ?auto_1610260 ?auto_1610259 ) ( ON ?auto_1610261 ?auto_1610260 ) ( ON ?auto_1610262 ?auto_1610261 ) ( ON ?auto_1610263 ?auto_1610262 ) ( ON ?auto_1610264 ?auto_1610263 ) ( ON ?auto_1610265 ?auto_1610264 ) ( not ( = ?auto_1610257 ?auto_1610258 ) ) ( not ( = ?auto_1610257 ?auto_1610259 ) ) ( not ( = ?auto_1610257 ?auto_1610260 ) ) ( not ( = ?auto_1610257 ?auto_1610261 ) ) ( not ( = ?auto_1610257 ?auto_1610262 ) ) ( not ( = ?auto_1610257 ?auto_1610263 ) ) ( not ( = ?auto_1610257 ?auto_1610264 ) ) ( not ( = ?auto_1610257 ?auto_1610265 ) ) ( not ( = ?auto_1610257 ?auto_1610266 ) ) ( not ( = ?auto_1610258 ?auto_1610259 ) ) ( not ( = ?auto_1610258 ?auto_1610260 ) ) ( not ( = ?auto_1610258 ?auto_1610261 ) ) ( not ( = ?auto_1610258 ?auto_1610262 ) ) ( not ( = ?auto_1610258 ?auto_1610263 ) ) ( not ( = ?auto_1610258 ?auto_1610264 ) ) ( not ( = ?auto_1610258 ?auto_1610265 ) ) ( not ( = ?auto_1610258 ?auto_1610266 ) ) ( not ( = ?auto_1610259 ?auto_1610260 ) ) ( not ( = ?auto_1610259 ?auto_1610261 ) ) ( not ( = ?auto_1610259 ?auto_1610262 ) ) ( not ( = ?auto_1610259 ?auto_1610263 ) ) ( not ( = ?auto_1610259 ?auto_1610264 ) ) ( not ( = ?auto_1610259 ?auto_1610265 ) ) ( not ( = ?auto_1610259 ?auto_1610266 ) ) ( not ( = ?auto_1610260 ?auto_1610261 ) ) ( not ( = ?auto_1610260 ?auto_1610262 ) ) ( not ( = ?auto_1610260 ?auto_1610263 ) ) ( not ( = ?auto_1610260 ?auto_1610264 ) ) ( not ( = ?auto_1610260 ?auto_1610265 ) ) ( not ( = ?auto_1610260 ?auto_1610266 ) ) ( not ( = ?auto_1610261 ?auto_1610262 ) ) ( not ( = ?auto_1610261 ?auto_1610263 ) ) ( not ( = ?auto_1610261 ?auto_1610264 ) ) ( not ( = ?auto_1610261 ?auto_1610265 ) ) ( not ( = ?auto_1610261 ?auto_1610266 ) ) ( not ( = ?auto_1610262 ?auto_1610263 ) ) ( not ( = ?auto_1610262 ?auto_1610264 ) ) ( not ( = ?auto_1610262 ?auto_1610265 ) ) ( not ( = ?auto_1610262 ?auto_1610266 ) ) ( not ( = ?auto_1610263 ?auto_1610264 ) ) ( not ( = ?auto_1610263 ?auto_1610265 ) ) ( not ( = ?auto_1610263 ?auto_1610266 ) ) ( not ( = ?auto_1610264 ?auto_1610265 ) ) ( not ( = ?auto_1610264 ?auto_1610266 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1610265 ?auto_1610266 )
      ( MAKE-9CRATE-VERIFY ?auto_1610257 ?auto_1610258 ?auto_1610259 ?auto_1610260 ?auto_1610261 ?auto_1610262 ?auto_1610263 ?auto_1610264 ?auto_1610265 ?auto_1610266 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610337 - SURFACE
      ?auto_1610338 - SURFACE
      ?auto_1610339 - SURFACE
      ?auto_1610340 - SURFACE
      ?auto_1610341 - SURFACE
      ?auto_1610342 - SURFACE
      ?auto_1610343 - SURFACE
      ?auto_1610344 - SURFACE
      ?auto_1610345 - SURFACE
      ?auto_1610346 - SURFACE
    )
    :vars
    (
      ?auto_1610349 - HOIST
      ?auto_1610348 - PLACE
      ?auto_1610347 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610349 ?auto_1610348 ) ( SURFACE-AT ?auto_1610345 ?auto_1610348 ) ( CLEAR ?auto_1610345 ) ( IS-CRATE ?auto_1610346 ) ( not ( = ?auto_1610345 ?auto_1610346 ) ) ( TRUCK-AT ?auto_1610347 ?auto_1610348 ) ( AVAILABLE ?auto_1610349 ) ( IN ?auto_1610346 ?auto_1610347 ) ( ON ?auto_1610345 ?auto_1610344 ) ( not ( = ?auto_1610344 ?auto_1610345 ) ) ( not ( = ?auto_1610344 ?auto_1610346 ) ) ( ON ?auto_1610338 ?auto_1610337 ) ( ON ?auto_1610339 ?auto_1610338 ) ( ON ?auto_1610340 ?auto_1610339 ) ( ON ?auto_1610341 ?auto_1610340 ) ( ON ?auto_1610342 ?auto_1610341 ) ( ON ?auto_1610343 ?auto_1610342 ) ( ON ?auto_1610344 ?auto_1610343 ) ( not ( = ?auto_1610337 ?auto_1610338 ) ) ( not ( = ?auto_1610337 ?auto_1610339 ) ) ( not ( = ?auto_1610337 ?auto_1610340 ) ) ( not ( = ?auto_1610337 ?auto_1610341 ) ) ( not ( = ?auto_1610337 ?auto_1610342 ) ) ( not ( = ?auto_1610337 ?auto_1610343 ) ) ( not ( = ?auto_1610337 ?auto_1610344 ) ) ( not ( = ?auto_1610337 ?auto_1610345 ) ) ( not ( = ?auto_1610337 ?auto_1610346 ) ) ( not ( = ?auto_1610338 ?auto_1610339 ) ) ( not ( = ?auto_1610338 ?auto_1610340 ) ) ( not ( = ?auto_1610338 ?auto_1610341 ) ) ( not ( = ?auto_1610338 ?auto_1610342 ) ) ( not ( = ?auto_1610338 ?auto_1610343 ) ) ( not ( = ?auto_1610338 ?auto_1610344 ) ) ( not ( = ?auto_1610338 ?auto_1610345 ) ) ( not ( = ?auto_1610338 ?auto_1610346 ) ) ( not ( = ?auto_1610339 ?auto_1610340 ) ) ( not ( = ?auto_1610339 ?auto_1610341 ) ) ( not ( = ?auto_1610339 ?auto_1610342 ) ) ( not ( = ?auto_1610339 ?auto_1610343 ) ) ( not ( = ?auto_1610339 ?auto_1610344 ) ) ( not ( = ?auto_1610339 ?auto_1610345 ) ) ( not ( = ?auto_1610339 ?auto_1610346 ) ) ( not ( = ?auto_1610340 ?auto_1610341 ) ) ( not ( = ?auto_1610340 ?auto_1610342 ) ) ( not ( = ?auto_1610340 ?auto_1610343 ) ) ( not ( = ?auto_1610340 ?auto_1610344 ) ) ( not ( = ?auto_1610340 ?auto_1610345 ) ) ( not ( = ?auto_1610340 ?auto_1610346 ) ) ( not ( = ?auto_1610341 ?auto_1610342 ) ) ( not ( = ?auto_1610341 ?auto_1610343 ) ) ( not ( = ?auto_1610341 ?auto_1610344 ) ) ( not ( = ?auto_1610341 ?auto_1610345 ) ) ( not ( = ?auto_1610341 ?auto_1610346 ) ) ( not ( = ?auto_1610342 ?auto_1610343 ) ) ( not ( = ?auto_1610342 ?auto_1610344 ) ) ( not ( = ?auto_1610342 ?auto_1610345 ) ) ( not ( = ?auto_1610342 ?auto_1610346 ) ) ( not ( = ?auto_1610343 ?auto_1610344 ) ) ( not ( = ?auto_1610343 ?auto_1610345 ) ) ( not ( = ?auto_1610343 ?auto_1610346 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610344 ?auto_1610345 ?auto_1610346 )
      ( MAKE-9CRATE-VERIFY ?auto_1610337 ?auto_1610338 ?auto_1610339 ?auto_1610340 ?auto_1610341 ?auto_1610342 ?auto_1610343 ?auto_1610344 ?auto_1610345 ?auto_1610346 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610427 - SURFACE
      ?auto_1610428 - SURFACE
      ?auto_1610429 - SURFACE
      ?auto_1610430 - SURFACE
      ?auto_1610431 - SURFACE
      ?auto_1610432 - SURFACE
      ?auto_1610433 - SURFACE
      ?auto_1610434 - SURFACE
      ?auto_1610435 - SURFACE
      ?auto_1610436 - SURFACE
    )
    :vars
    (
      ?auto_1610437 - HOIST
      ?auto_1610440 - PLACE
      ?auto_1610439 - TRUCK
      ?auto_1610438 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610437 ?auto_1610440 ) ( SURFACE-AT ?auto_1610435 ?auto_1610440 ) ( CLEAR ?auto_1610435 ) ( IS-CRATE ?auto_1610436 ) ( not ( = ?auto_1610435 ?auto_1610436 ) ) ( AVAILABLE ?auto_1610437 ) ( IN ?auto_1610436 ?auto_1610439 ) ( ON ?auto_1610435 ?auto_1610434 ) ( not ( = ?auto_1610434 ?auto_1610435 ) ) ( not ( = ?auto_1610434 ?auto_1610436 ) ) ( TRUCK-AT ?auto_1610439 ?auto_1610438 ) ( not ( = ?auto_1610438 ?auto_1610440 ) ) ( ON ?auto_1610428 ?auto_1610427 ) ( ON ?auto_1610429 ?auto_1610428 ) ( ON ?auto_1610430 ?auto_1610429 ) ( ON ?auto_1610431 ?auto_1610430 ) ( ON ?auto_1610432 ?auto_1610431 ) ( ON ?auto_1610433 ?auto_1610432 ) ( ON ?auto_1610434 ?auto_1610433 ) ( not ( = ?auto_1610427 ?auto_1610428 ) ) ( not ( = ?auto_1610427 ?auto_1610429 ) ) ( not ( = ?auto_1610427 ?auto_1610430 ) ) ( not ( = ?auto_1610427 ?auto_1610431 ) ) ( not ( = ?auto_1610427 ?auto_1610432 ) ) ( not ( = ?auto_1610427 ?auto_1610433 ) ) ( not ( = ?auto_1610427 ?auto_1610434 ) ) ( not ( = ?auto_1610427 ?auto_1610435 ) ) ( not ( = ?auto_1610427 ?auto_1610436 ) ) ( not ( = ?auto_1610428 ?auto_1610429 ) ) ( not ( = ?auto_1610428 ?auto_1610430 ) ) ( not ( = ?auto_1610428 ?auto_1610431 ) ) ( not ( = ?auto_1610428 ?auto_1610432 ) ) ( not ( = ?auto_1610428 ?auto_1610433 ) ) ( not ( = ?auto_1610428 ?auto_1610434 ) ) ( not ( = ?auto_1610428 ?auto_1610435 ) ) ( not ( = ?auto_1610428 ?auto_1610436 ) ) ( not ( = ?auto_1610429 ?auto_1610430 ) ) ( not ( = ?auto_1610429 ?auto_1610431 ) ) ( not ( = ?auto_1610429 ?auto_1610432 ) ) ( not ( = ?auto_1610429 ?auto_1610433 ) ) ( not ( = ?auto_1610429 ?auto_1610434 ) ) ( not ( = ?auto_1610429 ?auto_1610435 ) ) ( not ( = ?auto_1610429 ?auto_1610436 ) ) ( not ( = ?auto_1610430 ?auto_1610431 ) ) ( not ( = ?auto_1610430 ?auto_1610432 ) ) ( not ( = ?auto_1610430 ?auto_1610433 ) ) ( not ( = ?auto_1610430 ?auto_1610434 ) ) ( not ( = ?auto_1610430 ?auto_1610435 ) ) ( not ( = ?auto_1610430 ?auto_1610436 ) ) ( not ( = ?auto_1610431 ?auto_1610432 ) ) ( not ( = ?auto_1610431 ?auto_1610433 ) ) ( not ( = ?auto_1610431 ?auto_1610434 ) ) ( not ( = ?auto_1610431 ?auto_1610435 ) ) ( not ( = ?auto_1610431 ?auto_1610436 ) ) ( not ( = ?auto_1610432 ?auto_1610433 ) ) ( not ( = ?auto_1610432 ?auto_1610434 ) ) ( not ( = ?auto_1610432 ?auto_1610435 ) ) ( not ( = ?auto_1610432 ?auto_1610436 ) ) ( not ( = ?auto_1610433 ?auto_1610434 ) ) ( not ( = ?auto_1610433 ?auto_1610435 ) ) ( not ( = ?auto_1610433 ?auto_1610436 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610434 ?auto_1610435 ?auto_1610436 )
      ( MAKE-9CRATE-VERIFY ?auto_1610427 ?auto_1610428 ?auto_1610429 ?auto_1610430 ?auto_1610431 ?auto_1610432 ?auto_1610433 ?auto_1610434 ?auto_1610435 ?auto_1610436 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610526 - SURFACE
      ?auto_1610527 - SURFACE
      ?auto_1610528 - SURFACE
      ?auto_1610529 - SURFACE
      ?auto_1610530 - SURFACE
      ?auto_1610531 - SURFACE
      ?auto_1610532 - SURFACE
      ?auto_1610533 - SURFACE
      ?auto_1610534 - SURFACE
      ?auto_1610535 - SURFACE
    )
    :vars
    (
      ?auto_1610540 - HOIST
      ?auto_1610539 - PLACE
      ?auto_1610538 - TRUCK
      ?auto_1610536 - PLACE
      ?auto_1610537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610540 ?auto_1610539 ) ( SURFACE-AT ?auto_1610534 ?auto_1610539 ) ( CLEAR ?auto_1610534 ) ( IS-CRATE ?auto_1610535 ) ( not ( = ?auto_1610534 ?auto_1610535 ) ) ( AVAILABLE ?auto_1610540 ) ( ON ?auto_1610534 ?auto_1610533 ) ( not ( = ?auto_1610533 ?auto_1610534 ) ) ( not ( = ?auto_1610533 ?auto_1610535 ) ) ( TRUCK-AT ?auto_1610538 ?auto_1610536 ) ( not ( = ?auto_1610536 ?auto_1610539 ) ) ( HOIST-AT ?auto_1610537 ?auto_1610536 ) ( LIFTING ?auto_1610537 ?auto_1610535 ) ( not ( = ?auto_1610540 ?auto_1610537 ) ) ( ON ?auto_1610527 ?auto_1610526 ) ( ON ?auto_1610528 ?auto_1610527 ) ( ON ?auto_1610529 ?auto_1610528 ) ( ON ?auto_1610530 ?auto_1610529 ) ( ON ?auto_1610531 ?auto_1610530 ) ( ON ?auto_1610532 ?auto_1610531 ) ( ON ?auto_1610533 ?auto_1610532 ) ( not ( = ?auto_1610526 ?auto_1610527 ) ) ( not ( = ?auto_1610526 ?auto_1610528 ) ) ( not ( = ?auto_1610526 ?auto_1610529 ) ) ( not ( = ?auto_1610526 ?auto_1610530 ) ) ( not ( = ?auto_1610526 ?auto_1610531 ) ) ( not ( = ?auto_1610526 ?auto_1610532 ) ) ( not ( = ?auto_1610526 ?auto_1610533 ) ) ( not ( = ?auto_1610526 ?auto_1610534 ) ) ( not ( = ?auto_1610526 ?auto_1610535 ) ) ( not ( = ?auto_1610527 ?auto_1610528 ) ) ( not ( = ?auto_1610527 ?auto_1610529 ) ) ( not ( = ?auto_1610527 ?auto_1610530 ) ) ( not ( = ?auto_1610527 ?auto_1610531 ) ) ( not ( = ?auto_1610527 ?auto_1610532 ) ) ( not ( = ?auto_1610527 ?auto_1610533 ) ) ( not ( = ?auto_1610527 ?auto_1610534 ) ) ( not ( = ?auto_1610527 ?auto_1610535 ) ) ( not ( = ?auto_1610528 ?auto_1610529 ) ) ( not ( = ?auto_1610528 ?auto_1610530 ) ) ( not ( = ?auto_1610528 ?auto_1610531 ) ) ( not ( = ?auto_1610528 ?auto_1610532 ) ) ( not ( = ?auto_1610528 ?auto_1610533 ) ) ( not ( = ?auto_1610528 ?auto_1610534 ) ) ( not ( = ?auto_1610528 ?auto_1610535 ) ) ( not ( = ?auto_1610529 ?auto_1610530 ) ) ( not ( = ?auto_1610529 ?auto_1610531 ) ) ( not ( = ?auto_1610529 ?auto_1610532 ) ) ( not ( = ?auto_1610529 ?auto_1610533 ) ) ( not ( = ?auto_1610529 ?auto_1610534 ) ) ( not ( = ?auto_1610529 ?auto_1610535 ) ) ( not ( = ?auto_1610530 ?auto_1610531 ) ) ( not ( = ?auto_1610530 ?auto_1610532 ) ) ( not ( = ?auto_1610530 ?auto_1610533 ) ) ( not ( = ?auto_1610530 ?auto_1610534 ) ) ( not ( = ?auto_1610530 ?auto_1610535 ) ) ( not ( = ?auto_1610531 ?auto_1610532 ) ) ( not ( = ?auto_1610531 ?auto_1610533 ) ) ( not ( = ?auto_1610531 ?auto_1610534 ) ) ( not ( = ?auto_1610531 ?auto_1610535 ) ) ( not ( = ?auto_1610532 ?auto_1610533 ) ) ( not ( = ?auto_1610532 ?auto_1610534 ) ) ( not ( = ?auto_1610532 ?auto_1610535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610533 ?auto_1610534 ?auto_1610535 )
      ( MAKE-9CRATE-VERIFY ?auto_1610526 ?auto_1610527 ?auto_1610528 ?auto_1610529 ?auto_1610530 ?auto_1610531 ?auto_1610532 ?auto_1610533 ?auto_1610534 ?auto_1610535 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610634 - SURFACE
      ?auto_1610635 - SURFACE
      ?auto_1610636 - SURFACE
      ?auto_1610637 - SURFACE
      ?auto_1610638 - SURFACE
      ?auto_1610639 - SURFACE
      ?auto_1610640 - SURFACE
      ?auto_1610641 - SURFACE
      ?auto_1610642 - SURFACE
      ?auto_1610643 - SURFACE
    )
    :vars
    (
      ?auto_1610647 - HOIST
      ?auto_1610648 - PLACE
      ?auto_1610645 - TRUCK
      ?auto_1610646 - PLACE
      ?auto_1610649 - HOIST
      ?auto_1610644 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610647 ?auto_1610648 ) ( SURFACE-AT ?auto_1610642 ?auto_1610648 ) ( CLEAR ?auto_1610642 ) ( IS-CRATE ?auto_1610643 ) ( not ( = ?auto_1610642 ?auto_1610643 ) ) ( AVAILABLE ?auto_1610647 ) ( ON ?auto_1610642 ?auto_1610641 ) ( not ( = ?auto_1610641 ?auto_1610642 ) ) ( not ( = ?auto_1610641 ?auto_1610643 ) ) ( TRUCK-AT ?auto_1610645 ?auto_1610646 ) ( not ( = ?auto_1610646 ?auto_1610648 ) ) ( HOIST-AT ?auto_1610649 ?auto_1610646 ) ( not ( = ?auto_1610647 ?auto_1610649 ) ) ( AVAILABLE ?auto_1610649 ) ( SURFACE-AT ?auto_1610643 ?auto_1610646 ) ( ON ?auto_1610643 ?auto_1610644 ) ( CLEAR ?auto_1610643 ) ( not ( = ?auto_1610642 ?auto_1610644 ) ) ( not ( = ?auto_1610643 ?auto_1610644 ) ) ( not ( = ?auto_1610641 ?auto_1610644 ) ) ( ON ?auto_1610635 ?auto_1610634 ) ( ON ?auto_1610636 ?auto_1610635 ) ( ON ?auto_1610637 ?auto_1610636 ) ( ON ?auto_1610638 ?auto_1610637 ) ( ON ?auto_1610639 ?auto_1610638 ) ( ON ?auto_1610640 ?auto_1610639 ) ( ON ?auto_1610641 ?auto_1610640 ) ( not ( = ?auto_1610634 ?auto_1610635 ) ) ( not ( = ?auto_1610634 ?auto_1610636 ) ) ( not ( = ?auto_1610634 ?auto_1610637 ) ) ( not ( = ?auto_1610634 ?auto_1610638 ) ) ( not ( = ?auto_1610634 ?auto_1610639 ) ) ( not ( = ?auto_1610634 ?auto_1610640 ) ) ( not ( = ?auto_1610634 ?auto_1610641 ) ) ( not ( = ?auto_1610634 ?auto_1610642 ) ) ( not ( = ?auto_1610634 ?auto_1610643 ) ) ( not ( = ?auto_1610634 ?auto_1610644 ) ) ( not ( = ?auto_1610635 ?auto_1610636 ) ) ( not ( = ?auto_1610635 ?auto_1610637 ) ) ( not ( = ?auto_1610635 ?auto_1610638 ) ) ( not ( = ?auto_1610635 ?auto_1610639 ) ) ( not ( = ?auto_1610635 ?auto_1610640 ) ) ( not ( = ?auto_1610635 ?auto_1610641 ) ) ( not ( = ?auto_1610635 ?auto_1610642 ) ) ( not ( = ?auto_1610635 ?auto_1610643 ) ) ( not ( = ?auto_1610635 ?auto_1610644 ) ) ( not ( = ?auto_1610636 ?auto_1610637 ) ) ( not ( = ?auto_1610636 ?auto_1610638 ) ) ( not ( = ?auto_1610636 ?auto_1610639 ) ) ( not ( = ?auto_1610636 ?auto_1610640 ) ) ( not ( = ?auto_1610636 ?auto_1610641 ) ) ( not ( = ?auto_1610636 ?auto_1610642 ) ) ( not ( = ?auto_1610636 ?auto_1610643 ) ) ( not ( = ?auto_1610636 ?auto_1610644 ) ) ( not ( = ?auto_1610637 ?auto_1610638 ) ) ( not ( = ?auto_1610637 ?auto_1610639 ) ) ( not ( = ?auto_1610637 ?auto_1610640 ) ) ( not ( = ?auto_1610637 ?auto_1610641 ) ) ( not ( = ?auto_1610637 ?auto_1610642 ) ) ( not ( = ?auto_1610637 ?auto_1610643 ) ) ( not ( = ?auto_1610637 ?auto_1610644 ) ) ( not ( = ?auto_1610638 ?auto_1610639 ) ) ( not ( = ?auto_1610638 ?auto_1610640 ) ) ( not ( = ?auto_1610638 ?auto_1610641 ) ) ( not ( = ?auto_1610638 ?auto_1610642 ) ) ( not ( = ?auto_1610638 ?auto_1610643 ) ) ( not ( = ?auto_1610638 ?auto_1610644 ) ) ( not ( = ?auto_1610639 ?auto_1610640 ) ) ( not ( = ?auto_1610639 ?auto_1610641 ) ) ( not ( = ?auto_1610639 ?auto_1610642 ) ) ( not ( = ?auto_1610639 ?auto_1610643 ) ) ( not ( = ?auto_1610639 ?auto_1610644 ) ) ( not ( = ?auto_1610640 ?auto_1610641 ) ) ( not ( = ?auto_1610640 ?auto_1610642 ) ) ( not ( = ?auto_1610640 ?auto_1610643 ) ) ( not ( = ?auto_1610640 ?auto_1610644 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610641 ?auto_1610642 ?auto_1610643 )
      ( MAKE-9CRATE-VERIFY ?auto_1610634 ?auto_1610635 ?auto_1610636 ?auto_1610637 ?auto_1610638 ?auto_1610639 ?auto_1610640 ?auto_1610641 ?auto_1610642 ?auto_1610643 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610743 - SURFACE
      ?auto_1610744 - SURFACE
      ?auto_1610745 - SURFACE
      ?auto_1610746 - SURFACE
      ?auto_1610747 - SURFACE
      ?auto_1610748 - SURFACE
      ?auto_1610749 - SURFACE
      ?auto_1610750 - SURFACE
      ?auto_1610751 - SURFACE
      ?auto_1610752 - SURFACE
    )
    :vars
    (
      ?auto_1610756 - HOIST
      ?auto_1610753 - PLACE
      ?auto_1610757 - PLACE
      ?auto_1610755 - HOIST
      ?auto_1610754 - SURFACE
      ?auto_1610758 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610756 ?auto_1610753 ) ( SURFACE-AT ?auto_1610751 ?auto_1610753 ) ( CLEAR ?auto_1610751 ) ( IS-CRATE ?auto_1610752 ) ( not ( = ?auto_1610751 ?auto_1610752 ) ) ( AVAILABLE ?auto_1610756 ) ( ON ?auto_1610751 ?auto_1610750 ) ( not ( = ?auto_1610750 ?auto_1610751 ) ) ( not ( = ?auto_1610750 ?auto_1610752 ) ) ( not ( = ?auto_1610757 ?auto_1610753 ) ) ( HOIST-AT ?auto_1610755 ?auto_1610757 ) ( not ( = ?auto_1610756 ?auto_1610755 ) ) ( AVAILABLE ?auto_1610755 ) ( SURFACE-AT ?auto_1610752 ?auto_1610757 ) ( ON ?auto_1610752 ?auto_1610754 ) ( CLEAR ?auto_1610752 ) ( not ( = ?auto_1610751 ?auto_1610754 ) ) ( not ( = ?auto_1610752 ?auto_1610754 ) ) ( not ( = ?auto_1610750 ?auto_1610754 ) ) ( TRUCK-AT ?auto_1610758 ?auto_1610753 ) ( ON ?auto_1610744 ?auto_1610743 ) ( ON ?auto_1610745 ?auto_1610744 ) ( ON ?auto_1610746 ?auto_1610745 ) ( ON ?auto_1610747 ?auto_1610746 ) ( ON ?auto_1610748 ?auto_1610747 ) ( ON ?auto_1610749 ?auto_1610748 ) ( ON ?auto_1610750 ?auto_1610749 ) ( not ( = ?auto_1610743 ?auto_1610744 ) ) ( not ( = ?auto_1610743 ?auto_1610745 ) ) ( not ( = ?auto_1610743 ?auto_1610746 ) ) ( not ( = ?auto_1610743 ?auto_1610747 ) ) ( not ( = ?auto_1610743 ?auto_1610748 ) ) ( not ( = ?auto_1610743 ?auto_1610749 ) ) ( not ( = ?auto_1610743 ?auto_1610750 ) ) ( not ( = ?auto_1610743 ?auto_1610751 ) ) ( not ( = ?auto_1610743 ?auto_1610752 ) ) ( not ( = ?auto_1610743 ?auto_1610754 ) ) ( not ( = ?auto_1610744 ?auto_1610745 ) ) ( not ( = ?auto_1610744 ?auto_1610746 ) ) ( not ( = ?auto_1610744 ?auto_1610747 ) ) ( not ( = ?auto_1610744 ?auto_1610748 ) ) ( not ( = ?auto_1610744 ?auto_1610749 ) ) ( not ( = ?auto_1610744 ?auto_1610750 ) ) ( not ( = ?auto_1610744 ?auto_1610751 ) ) ( not ( = ?auto_1610744 ?auto_1610752 ) ) ( not ( = ?auto_1610744 ?auto_1610754 ) ) ( not ( = ?auto_1610745 ?auto_1610746 ) ) ( not ( = ?auto_1610745 ?auto_1610747 ) ) ( not ( = ?auto_1610745 ?auto_1610748 ) ) ( not ( = ?auto_1610745 ?auto_1610749 ) ) ( not ( = ?auto_1610745 ?auto_1610750 ) ) ( not ( = ?auto_1610745 ?auto_1610751 ) ) ( not ( = ?auto_1610745 ?auto_1610752 ) ) ( not ( = ?auto_1610745 ?auto_1610754 ) ) ( not ( = ?auto_1610746 ?auto_1610747 ) ) ( not ( = ?auto_1610746 ?auto_1610748 ) ) ( not ( = ?auto_1610746 ?auto_1610749 ) ) ( not ( = ?auto_1610746 ?auto_1610750 ) ) ( not ( = ?auto_1610746 ?auto_1610751 ) ) ( not ( = ?auto_1610746 ?auto_1610752 ) ) ( not ( = ?auto_1610746 ?auto_1610754 ) ) ( not ( = ?auto_1610747 ?auto_1610748 ) ) ( not ( = ?auto_1610747 ?auto_1610749 ) ) ( not ( = ?auto_1610747 ?auto_1610750 ) ) ( not ( = ?auto_1610747 ?auto_1610751 ) ) ( not ( = ?auto_1610747 ?auto_1610752 ) ) ( not ( = ?auto_1610747 ?auto_1610754 ) ) ( not ( = ?auto_1610748 ?auto_1610749 ) ) ( not ( = ?auto_1610748 ?auto_1610750 ) ) ( not ( = ?auto_1610748 ?auto_1610751 ) ) ( not ( = ?auto_1610748 ?auto_1610752 ) ) ( not ( = ?auto_1610748 ?auto_1610754 ) ) ( not ( = ?auto_1610749 ?auto_1610750 ) ) ( not ( = ?auto_1610749 ?auto_1610751 ) ) ( not ( = ?auto_1610749 ?auto_1610752 ) ) ( not ( = ?auto_1610749 ?auto_1610754 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610750 ?auto_1610751 ?auto_1610752 )
      ( MAKE-9CRATE-VERIFY ?auto_1610743 ?auto_1610744 ?auto_1610745 ?auto_1610746 ?auto_1610747 ?auto_1610748 ?auto_1610749 ?auto_1610750 ?auto_1610751 ?auto_1610752 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610852 - SURFACE
      ?auto_1610853 - SURFACE
      ?auto_1610854 - SURFACE
      ?auto_1610855 - SURFACE
      ?auto_1610856 - SURFACE
      ?auto_1610857 - SURFACE
      ?auto_1610858 - SURFACE
      ?auto_1610859 - SURFACE
      ?auto_1610860 - SURFACE
      ?auto_1610861 - SURFACE
    )
    :vars
    (
      ?auto_1610867 - HOIST
      ?auto_1610862 - PLACE
      ?auto_1610863 - PLACE
      ?auto_1610864 - HOIST
      ?auto_1610866 - SURFACE
      ?auto_1610865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610867 ?auto_1610862 ) ( IS-CRATE ?auto_1610861 ) ( not ( = ?auto_1610860 ?auto_1610861 ) ) ( not ( = ?auto_1610859 ?auto_1610860 ) ) ( not ( = ?auto_1610859 ?auto_1610861 ) ) ( not ( = ?auto_1610863 ?auto_1610862 ) ) ( HOIST-AT ?auto_1610864 ?auto_1610863 ) ( not ( = ?auto_1610867 ?auto_1610864 ) ) ( AVAILABLE ?auto_1610864 ) ( SURFACE-AT ?auto_1610861 ?auto_1610863 ) ( ON ?auto_1610861 ?auto_1610866 ) ( CLEAR ?auto_1610861 ) ( not ( = ?auto_1610860 ?auto_1610866 ) ) ( not ( = ?auto_1610861 ?auto_1610866 ) ) ( not ( = ?auto_1610859 ?auto_1610866 ) ) ( TRUCK-AT ?auto_1610865 ?auto_1610862 ) ( SURFACE-AT ?auto_1610859 ?auto_1610862 ) ( CLEAR ?auto_1610859 ) ( LIFTING ?auto_1610867 ?auto_1610860 ) ( IS-CRATE ?auto_1610860 ) ( ON ?auto_1610853 ?auto_1610852 ) ( ON ?auto_1610854 ?auto_1610853 ) ( ON ?auto_1610855 ?auto_1610854 ) ( ON ?auto_1610856 ?auto_1610855 ) ( ON ?auto_1610857 ?auto_1610856 ) ( ON ?auto_1610858 ?auto_1610857 ) ( ON ?auto_1610859 ?auto_1610858 ) ( not ( = ?auto_1610852 ?auto_1610853 ) ) ( not ( = ?auto_1610852 ?auto_1610854 ) ) ( not ( = ?auto_1610852 ?auto_1610855 ) ) ( not ( = ?auto_1610852 ?auto_1610856 ) ) ( not ( = ?auto_1610852 ?auto_1610857 ) ) ( not ( = ?auto_1610852 ?auto_1610858 ) ) ( not ( = ?auto_1610852 ?auto_1610859 ) ) ( not ( = ?auto_1610852 ?auto_1610860 ) ) ( not ( = ?auto_1610852 ?auto_1610861 ) ) ( not ( = ?auto_1610852 ?auto_1610866 ) ) ( not ( = ?auto_1610853 ?auto_1610854 ) ) ( not ( = ?auto_1610853 ?auto_1610855 ) ) ( not ( = ?auto_1610853 ?auto_1610856 ) ) ( not ( = ?auto_1610853 ?auto_1610857 ) ) ( not ( = ?auto_1610853 ?auto_1610858 ) ) ( not ( = ?auto_1610853 ?auto_1610859 ) ) ( not ( = ?auto_1610853 ?auto_1610860 ) ) ( not ( = ?auto_1610853 ?auto_1610861 ) ) ( not ( = ?auto_1610853 ?auto_1610866 ) ) ( not ( = ?auto_1610854 ?auto_1610855 ) ) ( not ( = ?auto_1610854 ?auto_1610856 ) ) ( not ( = ?auto_1610854 ?auto_1610857 ) ) ( not ( = ?auto_1610854 ?auto_1610858 ) ) ( not ( = ?auto_1610854 ?auto_1610859 ) ) ( not ( = ?auto_1610854 ?auto_1610860 ) ) ( not ( = ?auto_1610854 ?auto_1610861 ) ) ( not ( = ?auto_1610854 ?auto_1610866 ) ) ( not ( = ?auto_1610855 ?auto_1610856 ) ) ( not ( = ?auto_1610855 ?auto_1610857 ) ) ( not ( = ?auto_1610855 ?auto_1610858 ) ) ( not ( = ?auto_1610855 ?auto_1610859 ) ) ( not ( = ?auto_1610855 ?auto_1610860 ) ) ( not ( = ?auto_1610855 ?auto_1610861 ) ) ( not ( = ?auto_1610855 ?auto_1610866 ) ) ( not ( = ?auto_1610856 ?auto_1610857 ) ) ( not ( = ?auto_1610856 ?auto_1610858 ) ) ( not ( = ?auto_1610856 ?auto_1610859 ) ) ( not ( = ?auto_1610856 ?auto_1610860 ) ) ( not ( = ?auto_1610856 ?auto_1610861 ) ) ( not ( = ?auto_1610856 ?auto_1610866 ) ) ( not ( = ?auto_1610857 ?auto_1610858 ) ) ( not ( = ?auto_1610857 ?auto_1610859 ) ) ( not ( = ?auto_1610857 ?auto_1610860 ) ) ( not ( = ?auto_1610857 ?auto_1610861 ) ) ( not ( = ?auto_1610857 ?auto_1610866 ) ) ( not ( = ?auto_1610858 ?auto_1610859 ) ) ( not ( = ?auto_1610858 ?auto_1610860 ) ) ( not ( = ?auto_1610858 ?auto_1610861 ) ) ( not ( = ?auto_1610858 ?auto_1610866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610859 ?auto_1610860 ?auto_1610861 )
      ( MAKE-9CRATE-VERIFY ?auto_1610852 ?auto_1610853 ?auto_1610854 ?auto_1610855 ?auto_1610856 ?auto_1610857 ?auto_1610858 ?auto_1610859 ?auto_1610860 ?auto_1610861 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1610961 - SURFACE
      ?auto_1610962 - SURFACE
      ?auto_1610963 - SURFACE
      ?auto_1610964 - SURFACE
      ?auto_1610965 - SURFACE
      ?auto_1610966 - SURFACE
      ?auto_1610967 - SURFACE
      ?auto_1610968 - SURFACE
      ?auto_1610969 - SURFACE
      ?auto_1610970 - SURFACE
    )
    :vars
    (
      ?auto_1610975 - HOIST
      ?auto_1610972 - PLACE
      ?auto_1610971 - PLACE
      ?auto_1610973 - HOIST
      ?auto_1610976 - SURFACE
      ?auto_1610974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1610975 ?auto_1610972 ) ( IS-CRATE ?auto_1610970 ) ( not ( = ?auto_1610969 ?auto_1610970 ) ) ( not ( = ?auto_1610968 ?auto_1610969 ) ) ( not ( = ?auto_1610968 ?auto_1610970 ) ) ( not ( = ?auto_1610971 ?auto_1610972 ) ) ( HOIST-AT ?auto_1610973 ?auto_1610971 ) ( not ( = ?auto_1610975 ?auto_1610973 ) ) ( AVAILABLE ?auto_1610973 ) ( SURFACE-AT ?auto_1610970 ?auto_1610971 ) ( ON ?auto_1610970 ?auto_1610976 ) ( CLEAR ?auto_1610970 ) ( not ( = ?auto_1610969 ?auto_1610976 ) ) ( not ( = ?auto_1610970 ?auto_1610976 ) ) ( not ( = ?auto_1610968 ?auto_1610976 ) ) ( TRUCK-AT ?auto_1610974 ?auto_1610972 ) ( SURFACE-AT ?auto_1610968 ?auto_1610972 ) ( CLEAR ?auto_1610968 ) ( IS-CRATE ?auto_1610969 ) ( AVAILABLE ?auto_1610975 ) ( IN ?auto_1610969 ?auto_1610974 ) ( ON ?auto_1610962 ?auto_1610961 ) ( ON ?auto_1610963 ?auto_1610962 ) ( ON ?auto_1610964 ?auto_1610963 ) ( ON ?auto_1610965 ?auto_1610964 ) ( ON ?auto_1610966 ?auto_1610965 ) ( ON ?auto_1610967 ?auto_1610966 ) ( ON ?auto_1610968 ?auto_1610967 ) ( not ( = ?auto_1610961 ?auto_1610962 ) ) ( not ( = ?auto_1610961 ?auto_1610963 ) ) ( not ( = ?auto_1610961 ?auto_1610964 ) ) ( not ( = ?auto_1610961 ?auto_1610965 ) ) ( not ( = ?auto_1610961 ?auto_1610966 ) ) ( not ( = ?auto_1610961 ?auto_1610967 ) ) ( not ( = ?auto_1610961 ?auto_1610968 ) ) ( not ( = ?auto_1610961 ?auto_1610969 ) ) ( not ( = ?auto_1610961 ?auto_1610970 ) ) ( not ( = ?auto_1610961 ?auto_1610976 ) ) ( not ( = ?auto_1610962 ?auto_1610963 ) ) ( not ( = ?auto_1610962 ?auto_1610964 ) ) ( not ( = ?auto_1610962 ?auto_1610965 ) ) ( not ( = ?auto_1610962 ?auto_1610966 ) ) ( not ( = ?auto_1610962 ?auto_1610967 ) ) ( not ( = ?auto_1610962 ?auto_1610968 ) ) ( not ( = ?auto_1610962 ?auto_1610969 ) ) ( not ( = ?auto_1610962 ?auto_1610970 ) ) ( not ( = ?auto_1610962 ?auto_1610976 ) ) ( not ( = ?auto_1610963 ?auto_1610964 ) ) ( not ( = ?auto_1610963 ?auto_1610965 ) ) ( not ( = ?auto_1610963 ?auto_1610966 ) ) ( not ( = ?auto_1610963 ?auto_1610967 ) ) ( not ( = ?auto_1610963 ?auto_1610968 ) ) ( not ( = ?auto_1610963 ?auto_1610969 ) ) ( not ( = ?auto_1610963 ?auto_1610970 ) ) ( not ( = ?auto_1610963 ?auto_1610976 ) ) ( not ( = ?auto_1610964 ?auto_1610965 ) ) ( not ( = ?auto_1610964 ?auto_1610966 ) ) ( not ( = ?auto_1610964 ?auto_1610967 ) ) ( not ( = ?auto_1610964 ?auto_1610968 ) ) ( not ( = ?auto_1610964 ?auto_1610969 ) ) ( not ( = ?auto_1610964 ?auto_1610970 ) ) ( not ( = ?auto_1610964 ?auto_1610976 ) ) ( not ( = ?auto_1610965 ?auto_1610966 ) ) ( not ( = ?auto_1610965 ?auto_1610967 ) ) ( not ( = ?auto_1610965 ?auto_1610968 ) ) ( not ( = ?auto_1610965 ?auto_1610969 ) ) ( not ( = ?auto_1610965 ?auto_1610970 ) ) ( not ( = ?auto_1610965 ?auto_1610976 ) ) ( not ( = ?auto_1610966 ?auto_1610967 ) ) ( not ( = ?auto_1610966 ?auto_1610968 ) ) ( not ( = ?auto_1610966 ?auto_1610969 ) ) ( not ( = ?auto_1610966 ?auto_1610970 ) ) ( not ( = ?auto_1610966 ?auto_1610976 ) ) ( not ( = ?auto_1610967 ?auto_1610968 ) ) ( not ( = ?auto_1610967 ?auto_1610969 ) ) ( not ( = ?auto_1610967 ?auto_1610970 ) ) ( not ( = ?auto_1610967 ?auto_1610976 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1610968 ?auto_1610969 ?auto_1610970 )
      ( MAKE-9CRATE-VERIFY ?auto_1610961 ?auto_1610962 ?auto_1610963 ?auto_1610964 ?auto_1610965 ?auto_1610966 ?auto_1610967 ?auto_1610968 ?auto_1610969 ?auto_1610970 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616491 - SURFACE
      ?auto_1616492 - SURFACE
      ?auto_1616493 - SURFACE
      ?auto_1616494 - SURFACE
      ?auto_1616495 - SURFACE
      ?auto_1616496 - SURFACE
      ?auto_1616497 - SURFACE
      ?auto_1616498 - SURFACE
      ?auto_1616499 - SURFACE
      ?auto_1616500 - SURFACE
      ?auto_1616501 - SURFACE
    )
    :vars
    (
      ?auto_1616502 - HOIST
      ?auto_1616503 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616502 ?auto_1616503 ) ( SURFACE-AT ?auto_1616500 ?auto_1616503 ) ( CLEAR ?auto_1616500 ) ( LIFTING ?auto_1616502 ?auto_1616501 ) ( IS-CRATE ?auto_1616501 ) ( not ( = ?auto_1616500 ?auto_1616501 ) ) ( ON ?auto_1616492 ?auto_1616491 ) ( ON ?auto_1616493 ?auto_1616492 ) ( ON ?auto_1616494 ?auto_1616493 ) ( ON ?auto_1616495 ?auto_1616494 ) ( ON ?auto_1616496 ?auto_1616495 ) ( ON ?auto_1616497 ?auto_1616496 ) ( ON ?auto_1616498 ?auto_1616497 ) ( ON ?auto_1616499 ?auto_1616498 ) ( ON ?auto_1616500 ?auto_1616499 ) ( not ( = ?auto_1616491 ?auto_1616492 ) ) ( not ( = ?auto_1616491 ?auto_1616493 ) ) ( not ( = ?auto_1616491 ?auto_1616494 ) ) ( not ( = ?auto_1616491 ?auto_1616495 ) ) ( not ( = ?auto_1616491 ?auto_1616496 ) ) ( not ( = ?auto_1616491 ?auto_1616497 ) ) ( not ( = ?auto_1616491 ?auto_1616498 ) ) ( not ( = ?auto_1616491 ?auto_1616499 ) ) ( not ( = ?auto_1616491 ?auto_1616500 ) ) ( not ( = ?auto_1616491 ?auto_1616501 ) ) ( not ( = ?auto_1616492 ?auto_1616493 ) ) ( not ( = ?auto_1616492 ?auto_1616494 ) ) ( not ( = ?auto_1616492 ?auto_1616495 ) ) ( not ( = ?auto_1616492 ?auto_1616496 ) ) ( not ( = ?auto_1616492 ?auto_1616497 ) ) ( not ( = ?auto_1616492 ?auto_1616498 ) ) ( not ( = ?auto_1616492 ?auto_1616499 ) ) ( not ( = ?auto_1616492 ?auto_1616500 ) ) ( not ( = ?auto_1616492 ?auto_1616501 ) ) ( not ( = ?auto_1616493 ?auto_1616494 ) ) ( not ( = ?auto_1616493 ?auto_1616495 ) ) ( not ( = ?auto_1616493 ?auto_1616496 ) ) ( not ( = ?auto_1616493 ?auto_1616497 ) ) ( not ( = ?auto_1616493 ?auto_1616498 ) ) ( not ( = ?auto_1616493 ?auto_1616499 ) ) ( not ( = ?auto_1616493 ?auto_1616500 ) ) ( not ( = ?auto_1616493 ?auto_1616501 ) ) ( not ( = ?auto_1616494 ?auto_1616495 ) ) ( not ( = ?auto_1616494 ?auto_1616496 ) ) ( not ( = ?auto_1616494 ?auto_1616497 ) ) ( not ( = ?auto_1616494 ?auto_1616498 ) ) ( not ( = ?auto_1616494 ?auto_1616499 ) ) ( not ( = ?auto_1616494 ?auto_1616500 ) ) ( not ( = ?auto_1616494 ?auto_1616501 ) ) ( not ( = ?auto_1616495 ?auto_1616496 ) ) ( not ( = ?auto_1616495 ?auto_1616497 ) ) ( not ( = ?auto_1616495 ?auto_1616498 ) ) ( not ( = ?auto_1616495 ?auto_1616499 ) ) ( not ( = ?auto_1616495 ?auto_1616500 ) ) ( not ( = ?auto_1616495 ?auto_1616501 ) ) ( not ( = ?auto_1616496 ?auto_1616497 ) ) ( not ( = ?auto_1616496 ?auto_1616498 ) ) ( not ( = ?auto_1616496 ?auto_1616499 ) ) ( not ( = ?auto_1616496 ?auto_1616500 ) ) ( not ( = ?auto_1616496 ?auto_1616501 ) ) ( not ( = ?auto_1616497 ?auto_1616498 ) ) ( not ( = ?auto_1616497 ?auto_1616499 ) ) ( not ( = ?auto_1616497 ?auto_1616500 ) ) ( not ( = ?auto_1616497 ?auto_1616501 ) ) ( not ( = ?auto_1616498 ?auto_1616499 ) ) ( not ( = ?auto_1616498 ?auto_1616500 ) ) ( not ( = ?auto_1616498 ?auto_1616501 ) ) ( not ( = ?auto_1616499 ?auto_1616500 ) ) ( not ( = ?auto_1616499 ?auto_1616501 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1616500 ?auto_1616501 )
      ( MAKE-10CRATE-VERIFY ?auto_1616491 ?auto_1616492 ?auto_1616493 ?auto_1616494 ?auto_1616495 ?auto_1616496 ?auto_1616497 ?auto_1616498 ?auto_1616499 ?auto_1616500 ?auto_1616501 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616585 - SURFACE
      ?auto_1616586 - SURFACE
      ?auto_1616587 - SURFACE
      ?auto_1616588 - SURFACE
      ?auto_1616589 - SURFACE
      ?auto_1616590 - SURFACE
      ?auto_1616591 - SURFACE
      ?auto_1616592 - SURFACE
      ?auto_1616593 - SURFACE
      ?auto_1616594 - SURFACE
      ?auto_1616595 - SURFACE
    )
    :vars
    (
      ?auto_1616597 - HOIST
      ?auto_1616596 - PLACE
      ?auto_1616598 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616597 ?auto_1616596 ) ( SURFACE-AT ?auto_1616594 ?auto_1616596 ) ( CLEAR ?auto_1616594 ) ( IS-CRATE ?auto_1616595 ) ( not ( = ?auto_1616594 ?auto_1616595 ) ) ( TRUCK-AT ?auto_1616598 ?auto_1616596 ) ( AVAILABLE ?auto_1616597 ) ( IN ?auto_1616595 ?auto_1616598 ) ( ON ?auto_1616594 ?auto_1616593 ) ( not ( = ?auto_1616593 ?auto_1616594 ) ) ( not ( = ?auto_1616593 ?auto_1616595 ) ) ( ON ?auto_1616586 ?auto_1616585 ) ( ON ?auto_1616587 ?auto_1616586 ) ( ON ?auto_1616588 ?auto_1616587 ) ( ON ?auto_1616589 ?auto_1616588 ) ( ON ?auto_1616590 ?auto_1616589 ) ( ON ?auto_1616591 ?auto_1616590 ) ( ON ?auto_1616592 ?auto_1616591 ) ( ON ?auto_1616593 ?auto_1616592 ) ( not ( = ?auto_1616585 ?auto_1616586 ) ) ( not ( = ?auto_1616585 ?auto_1616587 ) ) ( not ( = ?auto_1616585 ?auto_1616588 ) ) ( not ( = ?auto_1616585 ?auto_1616589 ) ) ( not ( = ?auto_1616585 ?auto_1616590 ) ) ( not ( = ?auto_1616585 ?auto_1616591 ) ) ( not ( = ?auto_1616585 ?auto_1616592 ) ) ( not ( = ?auto_1616585 ?auto_1616593 ) ) ( not ( = ?auto_1616585 ?auto_1616594 ) ) ( not ( = ?auto_1616585 ?auto_1616595 ) ) ( not ( = ?auto_1616586 ?auto_1616587 ) ) ( not ( = ?auto_1616586 ?auto_1616588 ) ) ( not ( = ?auto_1616586 ?auto_1616589 ) ) ( not ( = ?auto_1616586 ?auto_1616590 ) ) ( not ( = ?auto_1616586 ?auto_1616591 ) ) ( not ( = ?auto_1616586 ?auto_1616592 ) ) ( not ( = ?auto_1616586 ?auto_1616593 ) ) ( not ( = ?auto_1616586 ?auto_1616594 ) ) ( not ( = ?auto_1616586 ?auto_1616595 ) ) ( not ( = ?auto_1616587 ?auto_1616588 ) ) ( not ( = ?auto_1616587 ?auto_1616589 ) ) ( not ( = ?auto_1616587 ?auto_1616590 ) ) ( not ( = ?auto_1616587 ?auto_1616591 ) ) ( not ( = ?auto_1616587 ?auto_1616592 ) ) ( not ( = ?auto_1616587 ?auto_1616593 ) ) ( not ( = ?auto_1616587 ?auto_1616594 ) ) ( not ( = ?auto_1616587 ?auto_1616595 ) ) ( not ( = ?auto_1616588 ?auto_1616589 ) ) ( not ( = ?auto_1616588 ?auto_1616590 ) ) ( not ( = ?auto_1616588 ?auto_1616591 ) ) ( not ( = ?auto_1616588 ?auto_1616592 ) ) ( not ( = ?auto_1616588 ?auto_1616593 ) ) ( not ( = ?auto_1616588 ?auto_1616594 ) ) ( not ( = ?auto_1616588 ?auto_1616595 ) ) ( not ( = ?auto_1616589 ?auto_1616590 ) ) ( not ( = ?auto_1616589 ?auto_1616591 ) ) ( not ( = ?auto_1616589 ?auto_1616592 ) ) ( not ( = ?auto_1616589 ?auto_1616593 ) ) ( not ( = ?auto_1616589 ?auto_1616594 ) ) ( not ( = ?auto_1616589 ?auto_1616595 ) ) ( not ( = ?auto_1616590 ?auto_1616591 ) ) ( not ( = ?auto_1616590 ?auto_1616592 ) ) ( not ( = ?auto_1616590 ?auto_1616593 ) ) ( not ( = ?auto_1616590 ?auto_1616594 ) ) ( not ( = ?auto_1616590 ?auto_1616595 ) ) ( not ( = ?auto_1616591 ?auto_1616592 ) ) ( not ( = ?auto_1616591 ?auto_1616593 ) ) ( not ( = ?auto_1616591 ?auto_1616594 ) ) ( not ( = ?auto_1616591 ?auto_1616595 ) ) ( not ( = ?auto_1616592 ?auto_1616593 ) ) ( not ( = ?auto_1616592 ?auto_1616594 ) ) ( not ( = ?auto_1616592 ?auto_1616595 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616593 ?auto_1616594 ?auto_1616595 )
      ( MAKE-10CRATE-VERIFY ?auto_1616585 ?auto_1616586 ?auto_1616587 ?auto_1616588 ?auto_1616589 ?auto_1616590 ?auto_1616591 ?auto_1616592 ?auto_1616593 ?auto_1616594 ?auto_1616595 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616690 - SURFACE
      ?auto_1616691 - SURFACE
      ?auto_1616692 - SURFACE
      ?auto_1616693 - SURFACE
      ?auto_1616694 - SURFACE
      ?auto_1616695 - SURFACE
      ?auto_1616696 - SURFACE
      ?auto_1616697 - SURFACE
      ?auto_1616698 - SURFACE
      ?auto_1616699 - SURFACE
      ?auto_1616700 - SURFACE
    )
    :vars
    (
      ?auto_1616703 - HOIST
      ?auto_1616702 - PLACE
      ?auto_1616701 - TRUCK
      ?auto_1616704 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616703 ?auto_1616702 ) ( SURFACE-AT ?auto_1616699 ?auto_1616702 ) ( CLEAR ?auto_1616699 ) ( IS-CRATE ?auto_1616700 ) ( not ( = ?auto_1616699 ?auto_1616700 ) ) ( AVAILABLE ?auto_1616703 ) ( IN ?auto_1616700 ?auto_1616701 ) ( ON ?auto_1616699 ?auto_1616698 ) ( not ( = ?auto_1616698 ?auto_1616699 ) ) ( not ( = ?auto_1616698 ?auto_1616700 ) ) ( TRUCK-AT ?auto_1616701 ?auto_1616704 ) ( not ( = ?auto_1616704 ?auto_1616702 ) ) ( ON ?auto_1616691 ?auto_1616690 ) ( ON ?auto_1616692 ?auto_1616691 ) ( ON ?auto_1616693 ?auto_1616692 ) ( ON ?auto_1616694 ?auto_1616693 ) ( ON ?auto_1616695 ?auto_1616694 ) ( ON ?auto_1616696 ?auto_1616695 ) ( ON ?auto_1616697 ?auto_1616696 ) ( ON ?auto_1616698 ?auto_1616697 ) ( not ( = ?auto_1616690 ?auto_1616691 ) ) ( not ( = ?auto_1616690 ?auto_1616692 ) ) ( not ( = ?auto_1616690 ?auto_1616693 ) ) ( not ( = ?auto_1616690 ?auto_1616694 ) ) ( not ( = ?auto_1616690 ?auto_1616695 ) ) ( not ( = ?auto_1616690 ?auto_1616696 ) ) ( not ( = ?auto_1616690 ?auto_1616697 ) ) ( not ( = ?auto_1616690 ?auto_1616698 ) ) ( not ( = ?auto_1616690 ?auto_1616699 ) ) ( not ( = ?auto_1616690 ?auto_1616700 ) ) ( not ( = ?auto_1616691 ?auto_1616692 ) ) ( not ( = ?auto_1616691 ?auto_1616693 ) ) ( not ( = ?auto_1616691 ?auto_1616694 ) ) ( not ( = ?auto_1616691 ?auto_1616695 ) ) ( not ( = ?auto_1616691 ?auto_1616696 ) ) ( not ( = ?auto_1616691 ?auto_1616697 ) ) ( not ( = ?auto_1616691 ?auto_1616698 ) ) ( not ( = ?auto_1616691 ?auto_1616699 ) ) ( not ( = ?auto_1616691 ?auto_1616700 ) ) ( not ( = ?auto_1616692 ?auto_1616693 ) ) ( not ( = ?auto_1616692 ?auto_1616694 ) ) ( not ( = ?auto_1616692 ?auto_1616695 ) ) ( not ( = ?auto_1616692 ?auto_1616696 ) ) ( not ( = ?auto_1616692 ?auto_1616697 ) ) ( not ( = ?auto_1616692 ?auto_1616698 ) ) ( not ( = ?auto_1616692 ?auto_1616699 ) ) ( not ( = ?auto_1616692 ?auto_1616700 ) ) ( not ( = ?auto_1616693 ?auto_1616694 ) ) ( not ( = ?auto_1616693 ?auto_1616695 ) ) ( not ( = ?auto_1616693 ?auto_1616696 ) ) ( not ( = ?auto_1616693 ?auto_1616697 ) ) ( not ( = ?auto_1616693 ?auto_1616698 ) ) ( not ( = ?auto_1616693 ?auto_1616699 ) ) ( not ( = ?auto_1616693 ?auto_1616700 ) ) ( not ( = ?auto_1616694 ?auto_1616695 ) ) ( not ( = ?auto_1616694 ?auto_1616696 ) ) ( not ( = ?auto_1616694 ?auto_1616697 ) ) ( not ( = ?auto_1616694 ?auto_1616698 ) ) ( not ( = ?auto_1616694 ?auto_1616699 ) ) ( not ( = ?auto_1616694 ?auto_1616700 ) ) ( not ( = ?auto_1616695 ?auto_1616696 ) ) ( not ( = ?auto_1616695 ?auto_1616697 ) ) ( not ( = ?auto_1616695 ?auto_1616698 ) ) ( not ( = ?auto_1616695 ?auto_1616699 ) ) ( not ( = ?auto_1616695 ?auto_1616700 ) ) ( not ( = ?auto_1616696 ?auto_1616697 ) ) ( not ( = ?auto_1616696 ?auto_1616698 ) ) ( not ( = ?auto_1616696 ?auto_1616699 ) ) ( not ( = ?auto_1616696 ?auto_1616700 ) ) ( not ( = ?auto_1616697 ?auto_1616698 ) ) ( not ( = ?auto_1616697 ?auto_1616699 ) ) ( not ( = ?auto_1616697 ?auto_1616700 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616698 ?auto_1616699 ?auto_1616700 )
      ( MAKE-10CRATE-VERIFY ?auto_1616690 ?auto_1616691 ?auto_1616692 ?auto_1616693 ?auto_1616694 ?auto_1616695 ?auto_1616696 ?auto_1616697 ?auto_1616698 ?auto_1616699 ?auto_1616700 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616805 - SURFACE
      ?auto_1616806 - SURFACE
      ?auto_1616807 - SURFACE
      ?auto_1616808 - SURFACE
      ?auto_1616809 - SURFACE
      ?auto_1616810 - SURFACE
      ?auto_1616811 - SURFACE
      ?auto_1616812 - SURFACE
      ?auto_1616813 - SURFACE
      ?auto_1616814 - SURFACE
      ?auto_1616815 - SURFACE
    )
    :vars
    (
      ?auto_1616817 - HOIST
      ?auto_1616818 - PLACE
      ?auto_1616816 - TRUCK
      ?auto_1616819 - PLACE
      ?auto_1616820 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616817 ?auto_1616818 ) ( SURFACE-AT ?auto_1616814 ?auto_1616818 ) ( CLEAR ?auto_1616814 ) ( IS-CRATE ?auto_1616815 ) ( not ( = ?auto_1616814 ?auto_1616815 ) ) ( AVAILABLE ?auto_1616817 ) ( ON ?auto_1616814 ?auto_1616813 ) ( not ( = ?auto_1616813 ?auto_1616814 ) ) ( not ( = ?auto_1616813 ?auto_1616815 ) ) ( TRUCK-AT ?auto_1616816 ?auto_1616819 ) ( not ( = ?auto_1616819 ?auto_1616818 ) ) ( HOIST-AT ?auto_1616820 ?auto_1616819 ) ( LIFTING ?auto_1616820 ?auto_1616815 ) ( not ( = ?auto_1616817 ?auto_1616820 ) ) ( ON ?auto_1616806 ?auto_1616805 ) ( ON ?auto_1616807 ?auto_1616806 ) ( ON ?auto_1616808 ?auto_1616807 ) ( ON ?auto_1616809 ?auto_1616808 ) ( ON ?auto_1616810 ?auto_1616809 ) ( ON ?auto_1616811 ?auto_1616810 ) ( ON ?auto_1616812 ?auto_1616811 ) ( ON ?auto_1616813 ?auto_1616812 ) ( not ( = ?auto_1616805 ?auto_1616806 ) ) ( not ( = ?auto_1616805 ?auto_1616807 ) ) ( not ( = ?auto_1616805 ?auto_1616808 ) ) ( not ( = ?auto_1616805 ?auto_1616809 ) ) ( not ( = ?auto_1616805 ?auto_1616810 ) ) ( not ( = ?auto_1616805 ?auto_1616811 ) ) ( not ( = ?auto_1616805 ?auto_1616812 ) ) ( not ( = ?auto_1616805 ?auto_1616813 ) ) ( not ( = ?auto_1616805 ?auto_1616814 ) ) ( not ( = ?auto_1616805 ?auto_1616815 ) ) ( not ( = ?auto_1616806 ?auto_1616807 ) ) ( not ( = ?auto_1616806 ?auto_1616808 ) ) ( not ( = ?auto_1616806 ?auto_1616809 ) ) ( not ( = ?auto_1616806 ?auto_1616810 ) ) ( not ( = ?auto_1616806 ?auto_1616811 ) ) ( not ( = ?auto_1616806 ?auto_1616812 ) ) ( not ( = ?auto_1616806 ?auto_1616813 ) ) ( not ( = ?auto_1616806 ?auto_1616814 ) ) ( not ( = ?auto_1616806 ?auto_1616815 ) ) ( not ( = ?auto_1616807 ?auto_1616808 ) ) ( not ( = ?auto_1616807 ?auto_1616809 ) ) ( not ( = ?auto_1616807 ?auto_1616810 ) ) ( not ( = ?auto_1616807 ?auto_1616811 ) ) ( not ( = ?auto_1616807 ?auto_1616812 ) ) ( not ( = ?auto_1616807 ?auto_1616813 ) ) ( not ( = ?auto_1616807 ?auto_1616814 ) ) ( not ( = ?auto_1616807 ?auto_1616815 ) ) ( not ( = ?auto_1616808 ?auto_1616809 ) ) ( not ( = ?auto_1616808 ?auto_1616810 ) ) ( not ( = ?auto_1616808 ?auto_1616811 ) ) ( not ( = ?auto_1616808 ?auto_1616812 ) ) ( not ( = ?auto_1616808 ?auto_1616813 ) ) ( not ( = ?auto_1616808 ?auto_1616814 ) ) ( not ( = ?auto_1616808 ?auto_1616815 ) ) ( not ( = ?auto_1616809 ?auto_1616810 ) ) ( not ( = ?auto_1616809 ?auto_1616811 ) ) ( not ( = ?auto_1616809 ?auto_1616812 ) ) ( not ( = ?auto_1616809 ?auto_1616813 ) ) ( not ( = ?auto_1616809 ?auto_1616814 ) ) ( not ( = ?auto_1616809 ?auto_1616815 ) ) ( not ( = ?auto_1616810 ?auto_1616811 ) ) ( not ( = ?auto_1616810 ?auto_1616812 ) ) ( not ( = ?auto_1616810 ?auto_1616813 ) ) ( not ( = ?auto_1616810 ?auto_1616814 ) ) ( not ( = ?auto_1616810 ?auto_1616815 ) ) ( not ( = ?auto_1616811 ?auto_1616812 ) ) ( not ( = ?auto_1616811 ?auto_1616813 ) ) ( not ( = ?auto_1616811 ?auto_1616814 ) ) ( not ( = ?auto_1616811 ?auto_1616815 ) ) ( not ( = ?auto_1616812 ?auto_1616813 ) ) ( not ( = ?auto_1616812 ?auto_1616814 ) ) ( not ( = ?auto_1616812 ?auto_1616815 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616813 ?auto_1616814 ?auto_1616815 )
      ( MAKE-10CRATE-VERIFY ?auto_1616805 ?auto_1616806 ?auto_1616807 ?auto_1616808 ?auto_1616809 ?auto_1616810 ?auto_1616811 ?auto_1616812 ?auto_1616813 ?auto_1616814 ?auto_1616815 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1616930 - SURFACE
      ?auto_1616931 - SURFACE
      ?auto_1616932 - SURFACE
      ?auto_1616933 - SURFACE
      ?auto_1616934 - SURFACE
      ?auto_1616935 - SURFACE
      ?auto_1616936 - SURFACE
      ?auto_1616937 - SURFACE
      ?auto_1616938 - SURFACE
      ?auto_1616939 - SURFACE
      ?auto_1616940 - SURFACE
    )
    :vars
    (
      ?auto_1616941 - HOIST
      ?auto_1616944 - PLACE
      ?auto_1616946 - TRUCK
      ?auto_1616945 - PLACE
      ?auto_1616943 - HOIST
      ?auto_1616942 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1616941 ?auto_1616944 ) ( SURFACE-AT ?auto_1616939 ?auto_1616944 ) ( CLEAR ?auto_1616939 ) ( IS-CRATE ?auto_1616940 ) ( not ( = ?auto_1616939 ?auto_1616940 ) ) ( AVAILABLE ?auto_1616941 ) ( ON ?auto_1616939 ?auto_1616938 ) ( not ( = ?auto_1616938 ?auto_1616939 ) ) ( not ( = ?auto_1616938 ?auto_1616940 ) ) ( TRUCK-AT ?auto_1616946 ?auto_1616945 ) ( not ( = ?auto_1616945 ?auto_1616944 ) ) ( HOIST-AT ?auto_1616943 ?auto_1616945 ) ( not ( = ?auto_1616941 ?auto_1616943 ) ) ( AVAILABLE ?auto_1616943 ) ( SURFACE-AT ?auto_1616940 ?auto_1616945 ) ( ON ?auto_1616940 ?auto_1616942 ) ( CLEAR ?auto_1616940 ) ( not ( = ?auto_1616939 ?auto_1616942 ) ) ( not ( = ?auto_1616940 ?auto_1616942 ) ) ( not ( = ?auto_1616938 ?auto_1616942 ) ) ( ON ?auto_1616931 ?auto_1616930 ) ( ON ?auto_1616932 ?auto_1616931 ) ( ON ?auto_1616933 ?auto_1616932 ) ( ON ?auto_1616934 ?auto_1616933 ) ( ON ?auto_1616935 ?auto_1616934 ) ( ON ?auto_1616936 ?auto_1616935 ) ( ON ?auto_1616937 ?auto_1616936 ) ( ON ?auto_1616938 ?auto_1616937 ) ( not ( = ?auto_1616930 ?auto_1616931 ) ) ( not ( = ?auto_1616930 ?auto_1616932 ) ) ( not ( = ?auto_1616930 ?auto_1616933 ) ) ( not ( = ?auto_1616930 ?auto_1616934 ) ) ( not ( = ?auto_1616930 ?auto_1616935 ) ) ( not ( = ?auto_1616930 ?auto_1616936 ) ) ( not ( = ?auto_1616930 ?auto_1616937 ) ) ( not ( = ?auto_1616930 ?auto_1616938 ) ) ( not ( = ?auto_1616930 ?auto_1616939 ) ) ( not ( = ?auto_1616930 ?auto_1616940 ) ) ( not ( = ?auto_1616930 ?auto_1616942 ) ) ( not ( = ?auto_1616931 ?auto_1616932 ) ) ( not ( = ?auto_1616931 ?auto_1616933 ) ) ( not ( = ?auto_1616931 ?auto_1616934 ) ) ( not ( = ?auto_1616931 ?auto_1616935 ) ) ( not ( = ?auto_1616931 ?auto_1616936 ) ) ( not ( = ?auto_1616931 ?auto_1616937 ) ) ( not ( = ?auto_1616931 ?auto_1616938 ) ) ( not ( = ?auto_1616931 ?auto_1616939 ) ) ( not ( = ?auto_1616931 ?auto_1616940 ) ) ( not ( = ?auto_1616931 ?auto_1616942 ) ) ( not ( = ?auto_1616932 ?auto_1616933 ) ) ( not ( = ?auto_1616932 ?auto_1616934 ) ) ( not ( = ?auto_1616932 ?auto_1616935 ) ) ( not ( = ?auto_1616932 ?auto_1616936 ) ) ( not ( = ?auto_1616932 ?auto_1616937 ) ) ( not ( = ?auto_1616932 ?auto_1616938 ) ) ( not ( = ?auto_1616932 ?auto_1616939 ) ) ( not ( = ?auto_1616932 ?auto_1616940 ) ) ( not ( = ?auto_1616932 ?auto_1616942 ) ) ( not ( = ?auto_1616933 ?auto_1616934 ) ) ( not ( = ?auto_1616933 ?auto_1616935 ) ) ( not ( = ?auto_1616933 ?auto_1616936 ) ) ( not ( = ?auto_1616933 ?auto_1616937 ) ) ( not ( = ?auto_1616933 ?auto_1616938 ) ) ( not ( = ?auto_1616933 ?auto_1616939 ) ) ( not ( = ?auto_1616933 ?auto_1616940 ) ) ( not ( = ?auto_1616933 ?auto_1616942 ) ) ( not ( = ?auto_1616934 ?auto_1616935 ) ) ( not ( = ?auto_1616934 ?auto_1616936 ) ) ( not ( = ?auto_1616934 ?auto_1616937 ) ) ( not ( = ?auto_1616934 ?auto_1616938 ) ) ( not ( = ?auto_1616934 ?auto_1616939 ) ) ( not ( = ?auto_1616934 ?auto_1616940 ) ) ( not ( = ?auto_1616934 ?auto_1616942 ) ) ( not ( = ?auto_1616935 ?auto_1616936 ) ) ( not ( = ?auto_1616935 ?auto_1616937 ) ) ( not ( = ?auto_1616935 ?auto_1616938 ) ) ( not ( = ?auto_1616935 ?auto_1616939 ) ) ( not ( = ?auto_1616935 ?auto_1616940 ) ) ( not ( = ?auto_1616935 ?auto_1616942 ) ) ( not ( = ?auto_1616936 ?auto_1616937 ) ) ( not ( = ?auto_1616936 ?auto_1616938 ) ) ( not ( = ?auto_1616936 ?auto_1616939 ) ) ( not ( = ?auto_1616936 ?auto_1616940 ) ) ( not ( = ?auto_1616936 ?auto_1616942 ) ) ( not ( = ?auto_1616937 ?auto_1616938 ) ) ( not ( = ?auto_1616937 ?auto_1616939 ) ) ( not ( = ?auto_1616937 ?auto_1616940 ) ) ( not ( = ?auto_1616937 ?auto_1616942 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1616938 ?auto_1616939 ?auto_1616940 )
      ( MAKE-10CRATE-VERIFY ?auto_1616930 ?auto_1616931 ?auto_1616932 ?auto_1616933 ?auto_1616934 ?auto_1616935 ?auto_1616936 ?auto_1616937 ?auto_1616938 ?auto_1616939 ?auto_1616940 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1617056 - SURFACE
      ?auto_1617057 - SURFACE
      ?auto_1617058 - SURFACE
      ?auto_1617059 - SURFACE
      ?auto_1617060 - SURFACE
      ?auto_1617061 - SURFACE
      ?auto_1617062 - SURFACE
      ?auto_1617063 - SURFACE
      ?auto_1617064 - SURFACE
      ?auto_1617065 - SURFACE
      ?auto_1617066 - SURFACE
    )
    :vars
    (
      ?auto_1617071 - HOIST
      ?auto_1617067 - PLACE
      ?auto_1617069 - PLACE
      ?auto_1617072 - HOIST
      ?auto_1617070 - SURFACE
      ?auto_1617068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1617071 ?auto_1617067 ) ( SURFACE-AT ?auto_1617065 ?auto_1617067 ) ( CLEAR ?auto_1617065 ) ( IS-CRATE ?auto_1617066 ) ( not ( = ?auto_1617065 ?auto_1617066 ) ) ( AVAILABLE ?auto_1617071 ) ( ON ?auto_1617065 ?auto_1617064 ) ( not ( = ?auto_1617064 ?auto_1617065 ) ) ( not ( = ?auto_1617064 ?auto_1617066 ) ) ( not ( = ?auto_1617069 ?auto_1617067 ) ) ( HOIST-AT ?auto_1617072 ?auto_1617069 ) ( not ( = ?auto_1617071 ?auto_1617072 ) ) ( AVAILABLE ?auto_1617072 ) ( SURFACE-AT ?auto_1617066 ?auto_1617069 ) ( ON ?auto_1617066 ?auto_1617070 ) ( CLEAR ?auto_1617066 ) ( not ( = ?auto_1617065 ?auto_1617070 ) ) ( not ( = ?auto_1617066 ?auto_1617070 ) ) ( not ( = ?auto_1617064 ?auto_1617070 ) ) ( TRUCK-AT ?auto_1617068 ?auto_1617067 ) ( ON ?auto_1617057 ?auto_1617056 ) ( ON ?auto_1617058 ?auto_1617057 ) ( ON ?auto_1617059 ?auto_1617058 ) ( ON ?auto_1617060 ?auto_1617059 ) ( ON ?auto_1617061 ?auto_1617060 ) ( ON ?auto_1617062 ?auto_1617061 ) ( ON ?auto_1617063 ?auto_1617062 ) ( ON ?auto_1617064 ?auto_1617063 ) ( not ( = ?auto_1617056 ?auto_1617057 ) ) ( not ( = ?auto_1617056 ?auto_1617058 ) ) ( not ( = ?auto_1617056 ?auto_1617059 ) ) ( not ( = ?auto_1617056 ?auto_1617060 ) ) ( not ( = ?auto_1617056 ?auto_1617061 ) ) ( not ( = ?auto_1617056 ?auto_1617062 ) ) ( not ( = ?auto_1617056 ?auto_1617063 ) ) ( not ( = ?auto_1617056 ?auto_1617064 ) ) ( not ( = ?auto_1617056 ?auto_1617065 ) ) ( not ( = ?auto_1617056 ?auto_1617066 ) ) ( not ( = ?auto_1617056 ?auto_1617070 ) ) ( not ( = ?auto_1617057 ?auto_1617058 ) ) ( not ( = ?auto_1617057 ?auto_1617059 ) ) ( not ( = ?auto_1617057 ?auto_1617060 ) ) ( not ( = ?auto_1617057 ?auto_1617061 ) ) ( not ( = ?auto_1617057 ?auto_1617062 ) ) ( not ( = ?auto_1617057 ?auto_1617063 ) ) ( not ( = ?auto_1617057 ?auto_1617064 ) ) ( not ( = ?auto_1617057 ?auto_1617065 ) ) ( not ( = ?auto_1617057 ?auto_1617066 ) ) ( not ( = ?auto_1617057 ?auto_1617070 ) ) ( not ( = ?auto_1617058 ?auto_1617059 ) ) ( not ( = ?auto_1617058 ?auto_1617060 ) ) ( not ( = ?auto_1617058 ?auto_1617061 ) ) ( not ( = ?auto_1617058 ?auto_1617062 ) ) ( not ( = ?auto_1617058 ?auto_1617063 ) ) ( not ( = ?auto_1617058 ?auto_1617064 ) ) ( not ( = ?auto_1617058 ?auto_1617065 ) ) ( not ( = ?auto_1617058 ?auto_1617066 ) ) ( not ( = ?auto_1617058 ?auto_1617070 ) ) ( not ( = ?auto_1617059 ?auto_1617060 ) ) ( not ( = ?auto_1617059 ?auto_1617061 ) ) ( not ( = ?auto_1617059 ?auto_1617062 ) ) ( not ( = ?auto_1617059 ?auto_1617063 ) ) ( not ( = ?auto_1617059 ?auto_1617064 ) ) ( not ( = ?auto_1617059 ?auto_1617065 ) ) ( not ( = ?auto_1617059 ?auto_1617066 ) ) ( not ( = ?auto_1617059 ?auto_1617070 ) ) ( not ( = ?auto_1617060 ?auto_1617061 ) ) ( not ( = ?auto_1617060 ?auto_1617062 ) ) ( not ( = ?auto_1617060 ?auto_1617063 ) ) ( not ( = ?auto_1617060 ?auto_1617064 ) ) ( not ( = ?auto_1617060 ?auto_1617065 ) ) ( not ( = ?auto_1617060 ?auto_1617066 ) ) ( not ( = ?auto_1617060 ?auto_1617070 ) ) ( not ( = ?auto_1617061 ?auto_1617062 ) ) ( not ( = ?auto_1617061 ?auto_1617063 ) ) ( not ( = ?auto_1617061 ?auto_1617064 ) ) ( not ( = ?auto_1617061 ?auto_1617065 ) ) ( not ( = ?auto_1617061 ?auto_1617066 ) ) ( not ( = ?auto_1617061 ?auto_1617070 ) ) ( not ( = ?auto_1617062 ?auto_1617063 ) ) ( not ( = ?auto_1617062 ?auto_1617064 ) ) ( not ( = ?auto_1617062 ?auto_1617065 ) ) ( not ( = ?auto_1617062 ?auto_1617066 ) ) ( not ( = ?auto_1617062 ?auto_1617070 ) ) ( not ( = ?auto_1617063 ?auto_1617064 ) ) ( not ( = ?auto_1617063 ?auto_1617065 ) ) ( not ( = ?auto_1617063 ?auto_1617066 ) ) ( not ( = ?auto_1617063 ?auto_1617070 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1617064 ?auto_1617065 ?auto_1617066 )
      ( MAKE-10CRATE-VERIFY ?auto_1617056 ?auto_1617057 ?auto_1617058 ?auto_1617059 ?auto_1617060 ?auto_1617061 ?auto_1617062 ?auto_1617063 ?auto_1617064 ?auto_1617065 ?auto_1617066 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1617182 - SURFACE
      ?auto_1617183 - SURFACE
      ?auto_1617184 - SURFACE
      ?auto_1617185 - SURFACE
      ?auto_1617186 - SURFACE
      ?auto_1617187 - SURFACE
      ?auto_1617188 - SURFACE
      ?auto_1617189 - SURFACE
      ?auto_1617190 - SURFACE
      ?auto_1617191 - SURFACE
      ?auto_1617192 - SURFACE
    )
    :vars
    (
      ?auto_1617194 - HOIST
      ?auto_1617197 - PLACE
      ?auto_1617196 - PLACE
      ?auto_1617198 - HOIST
      ?auto_1617193 - SURFACE
      ?auto_1617195 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1617194 ?auto_1617197 ) ( IS-CRATE ?auto_1617192 ) ( not ( = ?auto_1617191 ?auto_1617192 ) ) ( not ( = ?auto_1617190 ?auto_1617191 ) ) ( not ( = ?auto_1617190 ?auto_1617192 ) ) ( not ( = ?auto_1617196 ?auto_1617197 ) ) ( HOIST-AT ?auto_1617198 ?auto_1617196 ) ( not ( = ?auto_1617194 ?auto_1617198 ) ) ( AVAILABLE ?auto_1617198 ) ( SURFACE-AT ?auto_1617192 ?auto_1617196 ) ( ON ?auto_1617192 ?auto_1617193 ) ( CLEAR ?auto_1617192 ) ( not ( = ?auto_1617191 ?auto_1617193 ) ) ( not ( = ?auto_1617192 ?auto_1617193 ) ) ( not ( = ?auto_1617190 ?auto_1617193 ) ) ( TRUCK-AT ?auto_1617195 ?auto_1617197 ) ( SURFACE-AT ?auto_1617190 ?auto_1617197 ) ( CLEAR ?auto_1617190 ) ( LIFTING ?auto_1617194 ?auto_1617191 ) ( IS-CRATE ?auto_1617191 ) ( ON ?auto_1617183 ?auto_1617182 ) ( ON ?auto_1617184 ?auto_1617183 ) ( ON ?auto_1617185 ?auto_1617184 ) ( ON ?auto_1617186 ?auto_1617185 ) ( ON ?auto_1617187 ?auto_1617186 ) ( ON ?auto_1617188 ?auto_1617187 ) ( ON ?auto_1617189 ?auto_1617188 ) ( ON ?auto_1617190 ?auto_1617189 ) ( not ( = ?auto_1617182 ?auto_1617183 ) ) ( not ( = ?auto_1617182 ?auto_1617184 ) ) ( not ( = ?auto_1617182 ?auto_1617185 ) ) ( not ( = ?auto_1617182 ?auto_1617186 ) ) ( not ( = ?auto_1617182 ?auto_1617187 ) ) ( not ( = ?auto_1617182 ?auto_1617188 ) ) ( not ( = ?auto_1617182 ?auto_1617189 ) ) ( not ( = ?auto_1617182 ?auto_1617190 ) ) ( not ( = ?auto_1617182 ?auto_1617191 ) ) ( not ( = ?auto_1617182 ?auto_1617192 ) ) ( not ( = ?auto_1617182 ?auto_1617193 ) ) ( not ( = ?auto_1617183 ?auto_1617184 ) ) ( not ( = ?auto_1617183 ?auto_1617185 ) ) ( not ( = ?auto_1617183 ?auto_1617186 ) ) ( not ( = ?auto_1617183 ?auto_1617187 ) ) ( not ( = ?auto_1617183 ?auto_1617188 ) ) ( not ( = ?auto_1617183 ?auto_1617189 ) ) ( not ( = ?auto_1617183 ?auto_1617190 ) ) ( not ( = ?auto_1617183 ?auto_1617191 ) ) ( not ( = ?auto_1617183 ?auto_1617192 ) ) ( not ( = ?auto_1617183 ?auto_1617193 ) ) ( not ( = ?auto_1617184 ?auto_1617185 ) ) ( not ( = ?auto_1617184 ?auto_1617186 ) ) ( not ( = ?auto_1617184 ?auto_1617187 ) ) ( not ( = ?auto_1617184 ?auto_1617188 ) ) ( not ( = ?auto_1617184 ?auto_1617189 ) ) ( not ( = ?auto_1617184 ?auto_1617190 ) ) ( not ( = ?auto_1617184 ?auto_1617191 ) ) ( not ( = ?auto_1617184 ?auto_1617192 ) ) ( not ( = ?auto_1617184 ?auto_1617193 ) ) ( not ( = ?auto_1617185 ?auto_1617186 ) ) ( not ( = ?auto_1617185 ?auto_1617187 ) ) ( not ( = ?auto_1617185 ?auto_1617188 ) ) ( not ( = ?auto_1617185 ?auto_1617189 ) ) ( not ( = ?auto_1617185 ?auto_1617190 ) ) ( not ( = ?auto_1617185 ?auto_1617191 ) ) ( not ( = ?auto_1617185 ?auto_1617192 ) ) ( not ( = ?auto_1617185 ?auto_1617193 ) ) ( not ( = ?auto_1617186 ?auto_1617187 ) ) ( not ( = ?auto_1617186 ?auto_1617188 ) ) ( not ( = ?auto_1617186 ?auto_1617189 ) ) ( not ( = ?auto_1617186 ?auto_1617190 ) ) ( not ( = ?auto_1617186 ?auto_1617191 ) ) ( not ( = ?auto_1617186 ?auto_1617192 ) ) ( not ( = ?auto_1617186 ?auto_1617193 ) ) ( not ( = ?auto_1617187 ?auto_1617188 ) ) ( not ( = ?auto_1617187 ?auto_1617189 ) ) ( not ( = ?auto_1617187 ?auto_1617190 ) ) ( not ( = ?auto_1617187 ?auto_1617191 ) ) ( not ( = ?auto_1617187 ?auto_1617192 ) ) ( not ( = ?auto_1617187 ?auto_1617193 ) ) ( not ( = ?auto_1617188 ?auto_1617189 ) ) ( not ( = ?auto_1617188 ?auto_1617190 ) ) ( not ( = ?auto_1617188 ?auto_1617191 ) ) ( not ( = ?auto_1617188 ?auto_1617192 ) ) ( not ( = ?auto_1617188 ?auto_1617193 ) ) ( not ( = ?auto_1617189 ?auto_1617190 ) ) ( not ( = ?auto_1617189 ?auto_1617191 ) ) ( not ( = ?auto_1617189 ?auto_1617192 ) ) ( not ( = ?auto_1617189 ?auto_1617193 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1617190 ?auto_1617191 ?auto_1617192 )
      ( MAKE-10CRATE-VERIFY ?auto_1617182 ?auto_1617183 ?auto_1617184 ?auto_1617185 ?auto_1617186 ?auto_1617187 ?auto_1617188 ?auto_1617189 ?auto_1617190 ?auto_1617191 ?auto_1617192 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1617308 - SURFACE
      ?auto_1617309 - SURFACE
      ?auto_1617310 - SURFACE
      ?auto_1617311 - SURFACE
      ?auto_1617312 - SURFACE
      ?auto_1617313 - SURFACE
      ?auto_1617314 - SURFACE
      ?auto_1617315 - SURFACE
      ?auto_1617316 - SURFACE
      ?auto_1617317 - SURFACE
      ?auto_1617318 - SURFACE
    )
    :vars
    (
      ?auto_1617322 - HOIST
      ?auto_1617319 - PLACE
      ?auto_1617320 - PLACE
      ?auto_1617324 - HOIST
      ?auto_1617321 - SURFACE
      ?auto_1617323 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1617322 ?auto_1617319 ) ( IS-CRATE ?auto_1617318 ) ( not ( = ?auto_1617317 ?auto_1617318 ) ) ( not ( = ?auto_1617316 ?auto_1617317 ) ) ( not ( = ?auto_1617316 ?auto_1617318 ) ) ( not ( = ?auto_1617320 ?auto_1617319 ) ) ( HOIST-AT ?auto_1617324 ?auto_1617320 ) ( not ( = ?auto_1617322 ?auto_1617324 ) ) ( AVAILABLE ?auto_1617324 ) ( SURFACE-AT ?auto_1617318 ?auto_1617320 ) ( ON ?auto_1617318 ?auto_1617321 ) ( CLEAR ?auto_1617318 ) ( not ( = ?auto_1617317 ?auto_1617321 ) ) ( not ( = ?auto_1617318 ?auto_1617321 ) ) ( not ( = ?auto_1617316 ?auto_1617321 ) ) ( TRUCK-AT ?auto_1617323 ?auto_1617319 ) ( SURFACE-AT ?auto_1617316 ?auto_1617319 ) ( CLEAR ?auto_1617316 ) ( IS-CRATE ?auto_1617317 ) ( AVAILABLE ?auto_1617322 ) ( IN ?auto_1617317 ?auto_1617323 ) ( ON ?auto_1617309 ?auto_1617308 ) ( ON ?auto_1617310 ?auto_1617309 ) ( ON ?auto_1617311 ?auto_1617310 ) ( ON ?auto_1617312 ?auto_1617311 ) ( ON ?auto_1617313 ?auto_1617312 ) ( ON ?auto_1617314 ?auto_1617313 ) ( ON ?auto_1617315 ?auto_1617314 ) ( ON ?auto_1617316 ?auto_1617315 ) ( not ( = ?auto_1617308 ?auto_1617309 ) ) ( not ( = ?auto_1617308 ?auto_1617310 ) ) ( not ( = ?auto_1617308 ?auto_1617311 ) ) ( not ( = ?auto_1617308 ?auto_1617312 ) ) ( not ( = ?auto_1617308 ?auto_1617313 ) ) ( not ( = ?auto_1617308 ?auto_1617314 ) ) ( not ( = ?auto_1617308 ?auto_1617315 ) ) ( not ( = ?auto_1617308 ?auto_1617316 ) ) ( not ( = ?auto_1617308 ?auto_1617317 ) ) ( not ( = ?auto_1617308 ?auto_1617318 ) ) ( not ( = ?auto_1617308 ?auto_1617321 ) ) ( not ( = ?auto_1617309 ?auto_1617310 ) ) ( not ( = ?auto_1617309 ?auto_1617311 ) ) ( not ( = ?auto_1617309 ?auto_1617312 ) ) ( not ( = ?auto_1617309 ?auto_1617313 ) ) ( not ( = ?auto_1617309 ?auto_1617314 ) ) ( not ( = ?auto_1617309 ?auto_1617315 ) ) ( not ( = ?auto_1617309 ?auto_1617316 ) ) ( not ( = ?auto_1617309 ?auto_1617317 ) ) ( not ( = ?auto_1617309 ?auto_1617318 ) ) ( not ( = ?auto_1617309 ?auto_1617321 ) ) ( not ( = ?auto_1617310 ?auto_1617311 ) ) ( not ( = ?auto_1617310 ?auto_1617312 ) ) ( not ( = ?auto_1617310 ?auto_1617313 ) ) ( not ( = ?auto_1617310 ?auto_1617314 ) ) ( not ( = ?auto_1617310 ?auto_1617315 ) ) ( not ( = ?auto_1617310 ?auto_1617316 ) ) ( not ( = ?auto_1617310 ?auto_1617317 ) ) ( not ( = ?auto_1617310 ?auto_1617318 ) ) ( not ( = ?auto_1617310 ?auto_1617321 ) ) ( not ( = ?auto_1617311 ?auto_1617312 ) ) ( not ( = ?auto_1617311 ?auto_1617313 ) ) ( not ( = ?auto_1617311 ?auto_1617314 ) ) ( not ( = ?auto_1617311 ?auto_1617315 ) ) ( not ( = ?auto_1617311 ?auto_1617316 ) ) ( not ( = ?auto_1617311 ?auto_1617317 ) ) ( not ( = ?auto_1617311 ?auto_1617318 ) ) ( not ( = ?auto_1617311 ?auto_1617321 ) ) ( not ( = ?auto_1617312 ?auto_1617313 ) ) ( not ( = ?auto_1617312 ?auto_1617314 ) ) ( not ( = ?auto_1617312 ?auto_1617315 ) ) ( not ( = ?auto_1617312 ?auto_1617316 ) ) ( not ( = ?auto_1617312 ?auto_1617317 ) ) ( not ( = ?auto_1617312 ?auto_1617318 ) ) ( not ( = ?auto_1617312 ?auto_1617321 ) ) ( not ( = ?auto_1617313 ?auto_1617314 ) ) ( not ( = ?auto_1617313 ?auto_1617315 ) ) ( not ( = ?auto_1617313 ?auto_1617316 ) ) ( not ( = ?auto_1617313 ?auto_1617317 ) ) ( not ( = ?auto_1617313 ?auto_1617318 ) ) ( not ( = ?auto_1617313 ?auto_1617321 ) ) ( not ( = ?auto_1617314 ?auto_1617315 ) ) ( not ( = ?auto_1617314 ?auto_1617316 ) ) ( not ( = ?auto_1617314 ?auto_1617317 ) ) ( not ( = ?auto_1617314 ?auto_1617318 ) ) ( not ( = ?auto_1617314 ?auto_1617321 ) ) ( not ( = ?auto_1617315 ?auto_1617316 ) ) ( not ( = ?auto_1617315 ?auto_1617317 ) ) ( not ( = ?auto_1617315 ?auto_1617318 ) ) ( not ( = ?auto_1617315 ?auto_1617321 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1617316 ?auto_1617317 ?auto_1617318 )
      ( MAKE-10CRATE-VERIFY ?auto_1617308 ?auto_1617309 ?auto_1617310 ?auto_1617311 ?auto_1617312 ?auto_1617313 ?auto_1617314 ?auto_1617315 ?auto_1617316 ?auto_1617317 ?auto_1617318 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624592 - SURFACE
      ?auto_1624593 - SURFACE
      ?auto_1624594 - SURFACE
      ?auto_1624595 - SURFACE
      ?auto_1624596 - SURFACE
      ?auto_1624597 - SURFACE
      ?auto_1624598 - SURFACE
      ?auto_1624599 - SURFACE
      ?auto_1624600 - SURFACE
      ?auto_1624601 - SURFACE
      ?auto_1624602 - SURFACE
      ?auto_1624603 - SURFACE
    )
    :vars
    (
      ?auto_1624604 - HOIST
      ?auto_1624605 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624604 ?auto_1624605 ) ( SURFACE-AT ?auto_1624602 ?auto_1624605 ) ( CLEAR ?auto_1624602 ) ( LIFTING ?auto_1624604 ?auto_1624603 ) ( IS-CRATE ?auto_1624603 ) ( not ( = ?auto_1624602 ?auto_1624603 ) ) ( ON ?auto_1624593 ?auto_1624592 ) ( ON ?auto_1624594 ?auto_1624593 ) ( ON ?auto_1624595 ?auto_1624594 ) ( ON ?auto_1624596 ?auto_1624595 ) ( ON ?auto_1624597 ?auto_1624596 ) ( ON ?auto_1624598 ?auto_1624597 ) ( ON ?auto_1624599 ?auto_1624598 ) ( ON ?auto_1624600 ?auto_1624599 ) ( ON ?auto_1624601 ?auto_1624600 ) ( ON ?auto_1624602 ?auto_1624601 ) ( not ( = ?auto_1624592 ?auto_1624593 ) ) ( not ( = ?auto_1624592 ?auto_1624594 ) ) ( not ( = ?auto_1624592 ?auto_1624595 ) ) ( not ( = ?auto_1624592 ?auto_1624596 ) ) ( not ( = ?auto_1624592 ?auto_1624597 ) ) ( not ( = ?auto_1624592 ?auto_1624598 ) ) ( not ( = ?auto_1624592 ?auto_1624599 ) ) ( not ( = ?auto_1624592 ?auto_1624600 ) ) ( not ( = ?auto_1624592 ?auto_1624601 ) ) ( not ( = ?auto_1624592 ?auto_1624602 ) ) ( not ( = ?auto_1624592 ?auto_1624603 ) ) ( not ( = ?auto_1624593 ?auto_1624594 ) ) ( not ( = ?auto_1624593 ?auto_1624595 ) ) ( not ( = ?auto_1624593 ?auto_1624596 ) ) ( not ( = ?auto_1624593 ?auto_1624597 ) ) ( not ( = ?auto_1624593 ?auto_1624598 ) ) ( not ( = ?auto_1624593 ?auto_1624599 ) ) ( not ( = ?auto_1624593 ?auto_1624600 ) ) ( not ( = ?auto_1624593 ?auto_1624601 ) ) ( not ( = ?auto_1624593 ?auto_1624602 ) ) ( not ( = ?auto_1624593 ?auto_1624603 ) ) ( not ( = ?auto_1624594 ?auto_1624595 ) ) ( not ( = ?auto_1624594 ?auto_1624596 ) ) ( not ( = ?auto_1624594 ?auto_1624597 ) ) ( not ( = ?auto_1624594 ?auto_1624598 ) ) ( not ( = ?auto_1624594 ?auto_1624599 ) ) ( not ( = ?auto_1624594 ?auto_1624600 ) ) ( not ( = ?auto_1624594 ?auto_1624601 ) ) ( not ( = ?auto_1624594 ?auto_1624602 ) ) ( not ( = ?auto_1624594 ?auto_1624603 ) ) ( not ( = ?auto_1624595 ?auto_1624596 ) ) ( not ( = ?auto_1624595 ?auto_1624597 ) ) ( not ( = ?auto_1624595 ?auto_1624598 ) ) ( not ( = ?auto_1624595 ?auto_1624599 ) ) ( not ( = ?auto_1624595 ?auto_1624600 ) ) ( not ( = ?auto_1624595 ?auto_1624601 ) ) ( not ( = ?auto_1624595 ?auto_1624602 ) ) ( not ( = ?auto_1624595 ?auto_1624603 ) ) ( not ( = ?auto_1624596 ?auto_1624597 ) ) ( not ( = ?auto_1624596 ?auto_1624598 ) ) ( not ( = ?auto_1624596 ?auto_1624599 ) ) ( not ( = ?auto_1624596 ?auto_1624600 ) ) ( not ( = ?auto_1624596 ?auto_1624601 ) ) ( not ( = ?auto_1624596 ?auto_1624602 ) ) ( not ( = ?auto_1624596 ?auto_1624603 ) ) ( not ( = ?auto_1624597 ?auto_1624598 ) ) ( not ( = ?auto_1624597 ?auto_1624599 ) ) ( not ( = ?auto_1624597 ?auto_1624600 ) ) ( not ( = ?auto_1624597 ?auto_1624601 ) ) ( not ( = ?auto_1624597 ?auto_1624602 ) ) ( not ( = ?auto_1624597 ?auto_1624603 ) ) ( not ( = ?auto_1624598 ?auto_1624599 ) ) ( not ( = ?auto_1624598 ?auto_1624600 ) ) ( not ( = ?auto_1624598 ?auto_1624601 ) ) ( not ( = ?auto_1624598 ?auto_1624602 ) ) ( not ( = ?auto_1624598 ?auto_1624603 ) ) ( not ( = ?auto_1624599 ?auto_1624600 ) ) ( not ( = ?auto_1624599 ?auto_1624601 ) ) ( not ( = ?auto_1624599 ?auto_1624602 ) ) ( not ( = ?auto_1624599 ?auto_1624603 ) ) ( not ( = ?auto_1624600 ?auto_1624601 ) ) ( not ( = ?auto_1624600 ?auto_1624602 ) ) ( not ( = ?auto_1624600 ?auto_1624603 ) ) ( not ( = ?auto_1624601 ?auto_1624602 ) ) ( not ( = ?auto_1624601 ?auto_1624603 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1624602 ?auto_1624603 )
      ( MAKE-11CRATE-VERIFY ?auto_1624592 ?auto_1624593 ?auto_1624594 ?auto_1624595 ?auto_1624596 ?auto_1624597 ?auto_1624598 ?auto_1624599 ?auto_1624600 ?auto_1624601 ?auto_1624602 ?auto_1624603 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624701 - SURFACE
      ?auto_1624702 - SURFACE
      ?auto_1624703 - SURFACE
      ?auto_1624704 - SURFACE
      ?auto_1624705 - SURFACE
      ?auto_1624706 - SURFACE
      ?auto_1624707 - SURFACE
      ?auto_1624708 - SURFACE
      ?auto_1624709 - SURFACE
      ?auto_1624710 - SURFACE
      ?auto_1624711 - SURFACE
      ?auto_1624712 - SURFACE
    )
    :vars
    (
      ?auto_1624714 - HOIST
      ?auto_1624713 - PLACE
      ?auto_1624715 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624714 ?auto_1624713 ) ( SURFACE-AT ?auto_1624711 ?auto_1624713 ) ( CLEAR ?auto_1624711 ) ( IS-CRATE ?auto_1624712 ) ( not ( = ?auto_1624711 ?auto_1624712 ) ) ( TRUCK-AT ?auto_1624715 ?auto_1624713 ) ( AVAILABLE ?auto_1624714 ) ( IN ?auto_1624712 ?auto_1624715 ) ( ON ?auto_1624711 ?auto_1624710 ) ( not ( = ?auto_1624710 ?auto_1624711 ) ) ( not ( = ?auto_1624710 ?auto_1624712 ) ) ( ON ?auto_1624702 ?auto_1624701 ) ( ON ?auto_1624703 ?auto_1624702 ) ( ON ?auto_1624704 ?auto_1624703 ) ( ON ?auto_1624705 ?auto_1624704 ) ( ON ?auto_1624706 ?auto_1624705 ) ( ON ?auto_1624707 ?auto_1624706 ) ( ON ?auto_1624708 ?auto_1624707 ) ( ON ?auto_1624709 ?auto_1624708 ) ( ON ?auto_1624710 ?auto_1624709 ) ( not ( = ?auto_1624701 ?auto_1624702 ) ) ( not ( = ?auto_1624701 ?auto_1624703 ) ) ( not ( = ?auto_1624701 ?auto_1624704 ) ) ( not ( = ?auto_1624701 ?auto_1624705 ) ) ( not ( = ?auto_1624701 ?auto_1624706 ) ) ( not ( = ?auto_1624701 ?auto_1624707 ) ) ( not ( = ?auto_1624701 ?auto_1624708 ) ) ( not ( = ?auto_1624701 ?auto_1624709 ) ) ( not ( = ?auto_1624701 ?auto_1624710 ) ) ( not ( = ?auto_1624701 ?auto_1624711 ) ) ( not ( = ?auto_1624701 ?auto_1624712 ) ) ( not ( = ?auto_1624702 ?auto_1624703 ) ) ( not ( = ?auto_1624702 ?auto_1624704 ) ) ( not ( = ?auto_1624702 ?auto_1624705 ) ) ( not ( = ?auto_1624702 ?auto_1624706 ) ) ( not ( = ?auto_1624702 ?auto_1624707 ) ) ( not ( = ?auto_1624702 ?auto_1624708 ) ) ( not ( = ?auto_1624702 ?auto_1624709 ) ) ( not ( = ?auto_1624702 ?auto_1624710 ) ) ( not ( = ?auto_1624702 ?auto_1624711 ) ) ( not ( = ?auto_1624702 ?auto_1624712 ) ) ( not ( = ?auto_1624703 ?auto_1624704 ) ) ( not ( = ?auto_1624703 ?auto_1624705 ) ) ( not ( = ?auto_1624703 ?auto_1624706 ) ) ( not ( = ?auto_1624703 ?auto_1624707 ) ) ( not ( = ?auto_1624703 ?auto_1624708 ) ) ( not ( = ?auto_1624703 ?auto_1624709 ) ) ( not ( = ?auto_1624703 ?auto_1624710 ) ) ( not ( = ?auto_1624703 ?auto_1624711 ) ) ( not ( = ?auto_1624703 ?auto_1624712 ) ) ( not ( = ?auto_1624704 ?auto_1624705 ) ) ( not ( = ?auto_1624704 ?auto_1624706 ) ) ( not ( = ?auto_1624704 ?auto_1624707 ) ) ( not ( = ?auto_1624704 ?auto_1624708 ) ) ( not ( = ?auto_1624704 ?auto_1624709 ) ) ( not ( = ?auto_1624704 ?auto_1624710 ) ) ( not ( = ?auto_1624704 ?auto_1624711 ) ) ( not ( = ?auto_1624704 ?auto_1624712 ) ) ( not ( = ?auto_1624705 ?auto_1624706 ) ) ( not ( = ?auto_1624705 ?auto_1624707 ) ) ( not ( = ?auto_1624705 ?auto_1624708 ) ) ( not ( = ?auto_1624705 ?auto_1624709 ) ) ( not ( = ?auto_1624705 ?auto_1624710 ) ) ( not ( = ?auto_1624705 ?auto_1624711 ) ) ( not ( = ?auto_1624705 ?auto_1624712 ) ) ( not ( = ?auto_1624706 ?auto_1624707 ) ) ( not ( = ?auto_1624706 ?auto_1624708 ) ) ( not ( = ?auto_1624706 ?auto_1624709 ) ) ( not ( = ?auto_1624706 ?auto_1624710 ) ) ( not ( = ?auto_1624706 ?auto_1624711 ) ) ( not ( = ?auto_1624706 ?auto_1624712 ) ) ( not ( = ?auto_1624707 ?auto_1624708 ) ) ( not ( = ?auto_1624707 ?auto_1624709 ) ) ( not ( = ?auto_1624707 ?auto_1624710 ) ) ( not ( = ?auto_1624707 ?auto_1624711 ) ) ( not ( = ?auto_1624707 ?auto_1624712 ) ) ( not ( = ?auto_1624708 ?auto_1624709 ) ) ( not ( = ?auto_1624708 ?auto_1624710 ) ) ( not ( = ?auto_1624708 ?auto_1624711 ) ) ( not ( = ?auto_1624708 ?auto_1624712 ) ) ( not ( = ?auto_1624709 ?auto_1624710 ) ) ( not ( = ?auto_1624709 ?auto_1624711 ) ) ( not ( = ?auto_1624709 ?auto_1624712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624710 ?auto_1624711 ?auto_1624712 )
      ( MAKE-11CRATE-VERIFY ?auto_1624701 ?auto_1624702 ?auto_1624703 ?auto_1624704 ?auto_1624705 ?auto_1624706 ?auto_1624707 ?auto_1624708 ?auto_1624709 ?auto_1624710 ?auto_1624711 ?auto_1624712 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624822 - SURFACE
      ?auto_1624823 - SURFACE
      ?auto_1624824 - SURFACE
      ?auto_1624825 - SURFACE
      ?auto_1624826 - SURFACE
      ?auto_1624827 - SURFACE
      ?auto_1624828 - SURFACE
      ?auto_1624829 - SURFACE
      ?auto_1624830 - SURFACE
      ?auto_1624831 - SURFACE
      ?auto_1624832 - SURFACE
      ?auto_1624833 - SURFACE
    )
    :vars
    (
      ?auto_1624835 - HOIST
      ?auto_1624837 - PLACE
      ?auto_1624834 - TRUCK
      ?auto_1624836 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624835 ?auto_1624837 ) ( SURFACE-AT ?auto_1624832 ?auto_1624837 ) ( CLEAR ?auto_1624832 ) ( IS-CRATE ?auto_1624833 ) ( not ( = ?auto_1624832 ?auto_1624833 ) ) ( AVAILABLE ?auto_1624835 ) ( IN ?auto_1624833 ?auto_1624834 ) ( ON ?auto_1624832 ?auto_1624831 ) ( not ( = ?auto_1624831 ?auto_1624832 ) ) ( not ( = ?auto_1624831 ?auto_1624833 ) ) ( TRUCK-AT ?auto_1624834 ?auto_1624836 ) ( not ( = ?auto_1624836 ?auto_1624837 ) ) ( ON ?auto_1624823 ?auto_1624822 ) ( ON ?auto_1624824 ?auto_1624823 ) ( ON ?auto_1624825 ?auto_1624824 ) ( ON ?auto_1624826 ?auto_1624825 ) ( ON ?auto_1624827 ?auto_1624826 ) ( ON ?auto_1624828 ?auto_1624827 ) ( ON ?auto_1624829 ?auto_1624828 ) ( ON ?auto_1624830 ?auto_1624829 ) ( ON ?auto_1624831 ?auto_1624830 ) ( not ( = ?auto_1624822 ?auto_1624823 ) ) ( not ( = ?auto_1624822 ?auto_1624824 ) ) ( not ( = ?auto_1624822 ?auto_1624825 ) ) ( not ( = ?auto_1624822 ?auto_1624826 ) ) ( not ( = ?auto_1624822 ?auto_1624827 ) ) ( not ( = ?auto_1624822 ?auto_1624828 ) ) ( not ( = ?auto_1624822 ?auto_1624829 ) ) ( not ( = ?auto_1624822 ?auto_1624830 ) ) ( not ( = ?auto_1624822 ?auto_1624831 ) ) ( not ( = ?auto_1624822 ?auto_1624832 ) ) ( not ( = ?auto_1624822 ?auto_1624833 ) ) ( not ( = ?auto_1624823 ?auto_1624824 ) ) ( not ( = ?auto_1624823 ?auto_1624825 ) ) ( not ( = ?auto_1624823 ?auto_1624826 ) ) ( not ( = ?auto_1624823 ?auto_1624827 ) ) ( not ( = ?auto_1624823 ?auto_1624828 ) ) ( not ( = ?auto_1624823 ?auto_1624829 ) ) ( not ( = ?auto_1624823 ?auto_1624830 ) ) ( not ( = ?auto_1624823 ?auto_1624831 ) ) ( not ( = ?auto_1624823 ?auto_1624832 ) ) ( not ( = ?auto_1624823 ?auto_1624833 ) ) ( not ( = ?auto_1624824 ?auto_1624825 ) ) ( not ( = ?auto_1624824 ?auto_1624826 ) ) ( not ( = ?auto_1624824 ?auto_1624827 ) ) ( not ( = ?auto_1624824 ?auto_1624828 ) ) ( not ( = ?auto_1624824 ?auto_1624829 ) ) ( not ( = ?auto_1624824 ?auto_1624830 ) ) ( not ( = ?auto_1624824 ?auto_1624831 ) ) ( not ( = ?auto_1624824 ?auto_1624832 ) ) ( not ( = ?auto_1624824 ?auto_1624833 ) ) ( not ( = ?auto_1624825 ?auto_1624826 ) ) ( not ( = ?auto_1624825 ?auto_1624827 ) ) ( not ( = ?auto_1624825 ?auto_1624828 ) ) ( not ( = ?auto_1624825 ?auto_1624829 ) ) ( not ( = ?auto_1624825 ?auto_1624830 ) ) ( not ( = ?auto_1624825 ?auto_1624831 ) ) ( not ( = ?auto_1624825 ?auto_1624832 ) ) ( not ( = ?auto_1624825 ?auto_1624833 ) ) ( not ( = ?auto_1624826 ?auto_1624827 ) ) ( not ( = ?auto_1624826 ?auto_1624828 ) ) ( not ( = ?auto_1624826 ?auto_1624829 ) ) ( not ( = ?auto_1624826 ?auto_1624830 ) ) ( not ( = ?auto_1624826 ?auto_1624831 ) ) ( not ( = ?auto_1624826 ?auto_1624832 ) ) ( not ( = ?auto_1624826 ?auto_1624833 ) ) ( not ( = ?auto_1624827 ?auto_1624828 ) ) ( not ( = ?auto_1624827 ?auto_1624829 ) ) ( not ( = ?auto_1624827 ?auto_1624830 ) ) ( not ( = ?auto_1624827 ?auto_1624831 ) ) ( not ( = ?auto_1624827 ?auto_1624832 ) ) ( not ( = ?auto_1624827 ?auto_1624833 ) ) ( not ( = ?auto_1624828 ?auto_1624829 ) ) ( not ( = ?auto_1624828 ?auto_1624830 ) ) ( not ( = ?auto_1624828 ?auto_1624831 ) ) ( not ( = ?auto_1624828 ?auto_1624832 ) ) ( not ( = ?auto_1624828 ?auto_1624833 ) ) ( not ( = ?auto_1624829 ?auto_1624830 ) ) ( not ( = ?auto_1624829 ?auto_1624831 ) ) ( not ( = ?auto_1624829 ?auto_1624832 ) ) ( not ( = ?auto_1624829 ?auto_1624833 ) ) ( not ( = ?auto_1624830 ?auto_1624831 ) ) ( not ( = ?auto_1624830 ?auto_1624832 ) ) ( not ( = ?auto_1624830 ?auto_1624833 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624831 ?auto_1624832 ?auto_1624833 )
      ( MAKE-11CRATE-VERIFY ?auto_1624822 ?auto_1624823 ?auto_1624824 ?auto_1624825 ?auto_1624826 ?auto_1624827 ?auto_1624828 ?auto_1624829 ?auto_1624830 ?auto_1624831 ?auto_1624832 ?auto_1624833 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1624954 - SURFACE
      ?auto_1624955 - SURFACE
      ?auto_1624956 - SURFACE
      ?auto_1624957 - SURFACE
      ?auto_1624958 - SURFACE
      ?auto_1624959 - SURFACE
      ?auto_1624960 - SURFACE
      ?auto_1624961 - SURFACE
      ?auto_1624962 - SURFACE
      ?auto_1624963 - SURFACE
      ?auto_1624964 - SURFACE
      ?auto_1624965 - SURFACE
    )
    :vars
    (
      ?auto_1624970 - HOIST
      ?auto_1624966 - PLACE
      ?auto_1624968 - TRUCK
      ?auto_1624967 - PLACE
      ?auto_1624969 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1624970 ?auto_1624966 ) ( SURFACE-AT ?auto_1624964 ?auto_1624966 ) ( CLEAR ?auto_1624964 ) ( IS-CRATE ?auto_1624965 ) ( not ( = ?auto_1624964 ?auto_1624965 ) ) ( AVAILABLE ?auto_1624970 ) ( ON ?auto_1624964 ?auto_1624963 ) ( not ( = ?auto_1624963 ?auto_1624964 ) ) ( not ( = ?auto_1624963 ?auto_1624965 ) ) ( TRUCK-AT ?auto_1624968 ?auto_1624967 ) ( not ( = ?auto_1624967 ?auto_1624966 ) ) ( HOIST-AT ?auto_1624969 ?auto_1624967 ) ( LIFTING ?auto_1624969 ?auto_1624965 ) ( not ( = ?auto_1624970 ?auto_1624969 ) ) ( ON ?auto_1624955 ?auto_1624954 ) ( ON ?auto_1624956 ?auto_1624955 ) ( ON ?auto_1624957 ?auto_1624956 ) ( ON ?auto_1624958 ?auto_1624957 ) ( ON ?auto_1624959 ?auto_1624958 ) ( ON ?auto_1624960 ?auto_1624959 ) ( ON ?auto_1624961 ?auto_1624960 ) ( ON ?auto_1624962 ?auto_1624961 ) ( ON ?auto_1624963 ?auto_1624962 ) ( not ( = ?auto_1624954 ?auto_1624955 ) ) ( not ( = ?auto_1624954 ?auto_1624956 ) ) ( not ( = ?auto_1624954 ?auto_1624957 ) ) ( not ( = ?auto_1624954 ?auto_1624958 ) ) ( not ( = ?auto_1624954 ?auto_1624959 ) ) ( not ( = ?auto_1624954 ?auto_1624960 ) ) ( not ( = ?auto_1624954 ?auto_1624961 ) ) ( not ( = ?auto_1624954 ?auto_1624962 ) ) ( not ( = ?auto_1624954 ?auto_1624963 ) ) ( not ( = ?auto_1624954 ?auto_1624964 ) ) ( not ( = ?auto_1624954 ?auto_1624965 ) ) ( not ( = ?auto_1624955 ?auto_1624956 ) ) ( not ( = ?auto_1624955 ?auto_1624957 ) ) ( not ( = ?auto_1624955 ?auto_1624958 ) ) ( not ( = ?auto_1624955 ?auto_1624959 ) ) ( not ( = ?auto_1624955 ?auto_1624960 ) ) ( not ( = ?auto_1624955 ?auto_1624961 ) ) ( not ( = ?auto_1624955 ?auto_1624962 ) ) ( not ( = ?auto_1624955 ?auto_1624963 ) ) ( not ( = ?auto_1624955 ?auto_1624964 ) ) ( not ( = ?auto_1624955 ?auto_1624965 ) ) ( not ( = ?auto_1624956 ?auto_1624957 ) ) ( not ( = ?auto_1624956 ?auto_1624958 ) ) ( not ( = ?auto_1624956 ?auto_1624959 ) ) ( not ( = ?auto_1624956 ?auto_1624960 ) ) ( not ( = ?auto_1624956 ?auto_1624961 ) ) ( not ( = ?auto_1624956 ?auto_1624962 ) ) ( not ( = ?auto_1624956 ?auto_1624963 ) ) ( not ( = ?auto_1624956 ?auto_1624964 ) ) ( not ( = ?auto_1624956 ?auto_1624965 ) ) ( not ( = ?auto_1624957 ?auto_1624958 ) ) ( not ( = ?auto_1624957 ?auto_1624959 ) ) ( not ( = ?auto_1624957 ?auto_1624960 ) ) ( not ( = ?auto_1624957 ?auto_1624961 ) ) ( not ( = ?auto_1624957 ?auto_1624962 ) ) ( not ( = ?auto_1624957 ?auto_1624963 ) ) ( not ( = ?auto_1624957 ?auto_1624964 ) ) ( not ( = ?auto_1624957 ?auto_1624965 ) ) ( not ( = ?auto_1624958 ?auto_1624959 ) ) ( not ( = ?auto_1624958 ?auto_1624960 ) ) ( not ( = ?auto_1624958 ?auto_1624961 ) ) ( not ( = ?auto_1624958 ?auto_1624962 ) ) ( not ( = ?auto_1624958 ?auto_1624963 ) ) ( not ( = ?auto_1624958 ?auto_1624964 ) ) ( not ( = ?auto_1624958 ?auto_1624965 ) ) ( not ( = ?auto_1624959 ?auto_1624960 ) ) ( not ( = ?auto_1624959 ?auto_1624961 ) ) ( not ( = ?auto_1624959 ?auto_1624962 ) ) ( not ( = ?auto_1624959 ?auto_1624963 ) ) ( not ( = ?auto_1624959 ?auto_1624964 ) ) ( not ( = ?auto_1624959 ?auto_1624965 ) ) ( not ( = ?auto_1624960 ?auto_1624961 ) ) ( not ( = ?auto_1624960 ?auto_1624962 ) ) ( not ( = ?auto_1624960 ?auto_1624963 ) ) ( not ( = ?auto_1624960 ?auto_1624964 ) ) ( not ( = ?auto_1624960 ?auto_1624965 ) ) ( not ( = ?auto_1624961 ?auto_1624962 ) ) ( not ( = ?auto_1624961 ?auto_1624963 ) ) ( not ( = ?auto_1624961 ?auto_1624964 ) ) ( not ( = ?auto_1624961 ?auto_1624965 ) ) ( not ( = ?auto_1624962 ?auto_1624963 ) ) ( not ( = ?auto_1624962 ?auto_1624964 ) ) ( not ( = ?auto_1624962 ?auto_1624965 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1624963 ?auto_1624964 ?auto_1624965 )
      ( MAKE-11CRATE-VERIFY ?auto_1624954 ?auto_1624955 ?auto_1624956 ?auto_1624957 ?auto_1624958 ?auto_1624959 ?auto_1624960 ?auto_1624961 ?auto_1624962 ?auto_1624963 ?auto_1624964 ?auto_1624965 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625097 - SURFACE
      ?auto_1625098 - SURFACE
      ?auto_1625099 - SURFACE
      ?auto_1625100 - SURFACE
      ?auto_1625101 - SURFACE
      ?auto_1625102 - SURFACE
      ?auto_1625103 - SURFACE
      ?auto_1625104 - SURFACE
      ?auto_1625105 - SURFACE
      ?auto_1625106 - SURFACE
      ?auto_1625107 - SURFACE
      ?auto_1625108 - SURFACE
    )
    :vars
    (
      ?auto_1625112 - HOIST
      ?auto_1625111 - PLACE
      ?auto_1625110 - TRUCK
      ?auto_1625114 - PLACE
      ?auto_1625113 - HOIST
      ?auto_1625109 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625112 ?auto_1625111 ) ( SURFACE-AT ?auto_1625107 ?auto_1625111 ) ( CLEAR ?auto_1625107 ) ( IS-CRATE ?auto_1625108 ) ( not ( = ?auto_1625107 ?auto_1625108 ) ) ( AVAILABLE ?auto_1625112 ) ( ON ?auto_1625107 ?auto_1625106 ) ( not ( = ?auto_1625106 ?auto_1625107 ) ) ( not ( = ?auto_1625106 ?auto_1625108 ) ) ( TRUCK-AT ?auto_1625110 ?auto_1625114 ) ( not ( = ?auto_1625114 ?auto_1625111 ) ) ( HOIST-AT ?auto_1625113 ?auto_1625114 ) ( not ( = ?auto_1625112 ?auto_1625113 ) ) ( AVAILABLE ?auto_1625113 ) ( SURFACE-AT ?auto_1625108 ?auto_1625114 ) ( ON ?auto_1625108 ?auto_1625109 ) ( CLEAR ?auto_1625108 ) ( not ( = ?auto_1625107 ?auto_1625109 ) ) ( not ( = ?auto_1625108 ?auto_1625109 ) ) ( not ( = ?auto_1625106 ?auto_1625109 ) ) ( ON ?auto_1625098 ?auto_1625097 ) ( ON ?auto_1625099 ?auto_1625098 ) ( ON ?auto_1625100 ?auto_1625099 ) ( ON ?auto_1625101 ?auto_1625100 ) ( ON ?auto_1625102 ?auto_1625101 ) ( ON ?auto_1625103 ?auto_1625102 ) ( ON ?auto_1625104 ?auto_1625103 ) ( ON ?auto_1625105 ?auto_1625104 ) ( ON ?auto_1625106 ?auto_1625105 ) ( not ( = ?auto_1625097 ?auto_1625098 ) ) ( not ( = ?auto_1625097 ?auto_1625099 ) ) ( not ( = ?auto_1625097 ?auto_1625100 ) ) ( not ( = ?auto_1625097 ?auto_1625101 ) ) ( not ( = ?auto_1625097 ?auto_1625102 ) ) ( not ( = ?auto_1625097 ?auto_1625103 ) ) ( not ( = ?auto_1625097 ?auto_1625104 ) ) ( not ( = ?auto_1625097 ?auto_1625105 ) ) ( not ( = ?auto_1625097 ?auto_1625106 ) ) ( not ( = ?auto_1625097 ?auto_1625107 ) ) ( not ( = ?auto_1625097 ?auto_1625108 ) ) ( not ( = ?auto_1625097 ?auto_1625109 ) ) ( not ( = ?auto_1625098 ?auto_1625099 ) ) ( not ( = ?auto_1625098 ?auto_1625100 ) ) ( not ( = ?auto_1625098 ?auto_1625101 ) ) ( not ( = ?auto_1625098 ?auto_1625102 ) ) ( not ( = ?auto_1625098 ?auto_1625103 ) ) ( not ( = ?auto_1625098 ?auto_1625104 ) ) ( not ( = ?auto_1625098 ?auto_1625105 ) ) ( not ( = ?auto_1625098 ?auto_1625106 ) ) ( not ( = ?auto_1625098 ?auto_1625107 ) ) ( not ( = ?auto_1625098 ?auto_1625108 ) ) ( not ( = ?auto_1625098 ?auto_1625109 ) ) ( not ( = ?auto_1625099 ?auto_1625100 ) ) ( not ( = ?auto_1625099 ?auto_1625101 ) ) ( not ( = ?auto_1625099 ?auto_1625102 ) ) ( not ( = ?auto_1625099 ?auto_1625103 ) ) ( not ( = ?auto_1625099 ?auto_1625104 ) ) ( not ( = ?auto_1625099 ?auto_1625105 ) ) ( not ( = ?auto_1625099 ?auto_1625106 ) ) ( not ( = ?auto_1625099 ?auto_1625107 ) ) ( not ( = ?auto_1625099 ?auto_1625108 ) ) ( not ( = ?auto_1625099 ?auto_1625109 ) ) ( not ( = ?auto_1625100 ?auto_1625101 ) ) ( not ( = ?auto_1625100 ?auto_1625102 ) ) ( not ( = ?auto_1625100 ?auto_1625103 ) ) ( not ( = ?auto_1625100 ?auto_1625104 ) ) ( not ( = ?auto_1625100 ?auto_1625105 ) ) ( not ( = ?auto_1625100 ?auto_1625106 ) ) ( not ( = ?auto_1625100 ?auto_1625107 ) ) ( not ( = ?auto_1625100 ?auto_1625108 ) ) ( not ( = ?auto_1625100 ?auto_1625109 ) ) ( not ( = ?auto_1625101 ?auto_1625102 ) ) ( not ( = ?auto_1625101 ?auto_1625103 ) ) ( not ( = ?auto_1625101 ?auto_1625104 ) ) ( not ( = ?auto_1625101 ?auto_1625105 ) ) ( not ( = ?auto_1625101 ?auto_1625106 ) ) ( not ( = ?auto_1625101 ?auto_1625107 ) ) ( not ( = ?auto_1625101 ?auto_1625108 ) ) ( not ( = ?auto_1625101 ?auto_1625109 ) ) ( not ( = ?auto_1625102 ?auto_1625103 ) ) ( not ( = ?auto_1625102 ?auto_1625104 ) ) ( not ( = ?auto_1625102 ?auto_1625105 ) ) ( not ( = ?auto_1625102 ?auto_1625106 ) ) ( not ( = ?auto_1625102 ?auto_1625107 ) ) ( not ( = ?auto_1625102 ?auto_1625108 ) ) ( not ( = ?auto_1625102 ?auto_1625109 ) ) ( not ( = ?auto_1625103 ?auto_1625104 ) ) ( not ( = ?auto_1625103 ?auto_1625105 ) ) ( not ( = ?auto_1625103 ?auto_1625106 ) ) ( not ( = ?auto_1625103 ?auto_1625107 ) ) ( not ( = ?auto_1625103 ?auto_1625108 ) ) ( not ( = ?auto_1625103 ?auto_1625109 ) ) ( not ( = ?auto_1625104 ?auto_1625105 ) ) ( not ( = ?auto_1625104 ?auto_1625106 ) ) ( not ( = ?auto_1625104 ?auto_1625107 ) ) ( not ( = ?auto_1625104 ?auto_1625108 ) ) ( not ( = ?auto_1625104 ?auto_1625109 ) ) ( not ( = ?auto_1625105 ?auto_1625106 ) ) ( not ( = ?auto_1625105 ?auto_1625107 ) ) ( not ( = ?auto_1625105 ?auto_1625108 ) ) ( not ( = ?auto_1625105 ?auto_1625109 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625106 ?auto_1625107 ?auto_1625108 )
      ( MAKE-11CRATE-VERIFY ?auto_1625097 ?auto_1625098 ?auto_1625099 ?auto_1625100 ?auto_1625101 ?auto_1625102 ?auto_1625103 ?auto_1625104 ?auto_1625105 ?auto_1625106 ?auto_1625107 ?auto_1625108 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625241 - SURFACE
      ?auto_1625242 - SURFACE
      ?auto_1625243 - SURFACE
      ?auto_1625244 - SURFACE
      ?auto_1625245 - SURFACE
      ?auto_1625246 - SURFACE
      ?auto_1625247 - SURFACE
      ?auto_1625248 - SURFACE
      ?auto_1625249 - SURFACE
      ?auto_1625250 - SURFACE
      ?auto_1625251 - SURFACE
      ?auto_1625252 - SURFACE
    )
    :vars
    (
      ?auto_1625253 - HOIST
      ?auto_1625258 - PLACE
      ?auto_1625254 - PLACE
      ?auto_1625255 - HOIST
      ?auto_1625256 - SURFACE
      ?auto_1625257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625253 ?auto_1625258 ) ( SURFACE-AT ?auto_1625251 ?auto_1625258 ) ( CLEAR ?auto_1625251 ) ( IS-CRATE ?auto_1625252 ) ( not ( = ?auto_1625251 ?auto_1625252 ) ) ( AVAILABLE ?auto_1625253 ) ( ON ?auto_1625251 ?auto_1625250 ) ( not ( = ?auto_1625250 ?auto_1625251 ) ) ( not ( = ?auto_1625250 ?auto_1625252 ) ) ( not ( = ?auto_1625254 ?auto_1625258 ) ) ( HOIST-AT ?auto_1625255 ?auto_1625254 ) ( not ( = ?auto_1625253 ?auto_1625255 ) ) ( AVAILABLE ?auto_1625255 ) ( SURFACE-AT ?auto_1625252 ?auto_1625254 ) ( ON ?auto_1625252 ?auto_1625256 ) ( CLEAR ?auto_1625252 ) ( not ( = ?auto_1625251 ?auto_1625256 ) ) ( not ( = ?auto_1625252 ?auto_1625256 ) ) ( not ( = ?auto_1625250 ?auto_1625256 ) ) ( TRUCK-AT ?auto_1625257 ?auto_1625258 ) ( ON ?auto_1625242 ?auto_1625241 ) ( ON ?auto_1625243 ?auto_1625242 ) ( ON ?auto_1625244 ?auto_1625243 ) ( ON ?auto_1625245 ?auto_1625244 ) ( ON ?auto_1625246 ?auto_1625245 ) ( ON ?auto_1625247 ?auto_1625246 ) ( ON ?auto_1625248 ?auto_1625247 ) ( ON ?auto_1625249 ?auto_1625248 ) ( ON ?auto_1625250 ?auto_1625249 ) ( not ( = ?auto_1625241 ?auto_1625242 ) ) ( not ( = ?auto_1625241 ?auto_1625243 ) ) ( not ( = ?auto_1625241 ?auto_1625244 ) ) ( not ( = ?auto_1625241 ?auto_1625245 ) ) ( not ( = ?auto_1625241 ?auto_1625246 ) ) ( not ( = ?auto_1625241 ?auto_1625247 ) ) ( not ( = ?auto_1625241 ?auto_1625248 ) ) ( not ( = ?auto_1625241 ?auto_1625249 ) ) ( not ( = ?auto_1625241 ?auto_1625250 ) ) ( not ( = ?auto_1625241 ?auto_1625251 ) ) ( not ( = ?auto_1625241 ?auto_1625252 ) ) ( not ( = ?auto_1625241 ?auto_1625256 ) ) ( not ( = ?auto_1625242 ?auto_1625243 ) ) ( not ( = ?auto_1625242 ?auto_1625244 ) ) ( not ( = ?auto_1625242 ?auto_1625245 ) ) ( not ( = ?auto_1625242 ?auto_1625246 ) ) ( not ( = ?auto_1625242 ?auto_1625247 ) ) ( not ( = ?auto_1625242 ?auto_1625248 ) ) ( not ( = ?auto_1625242 ?auto_1625249 ) ) ( not ( = ?auto_1625242 ?auto_1625250 ) ) ( not ( = ?auto_1625242 ?auto_1625251 ) ) ( not ( = ?auto_1625242 ?auto_1625252 ) ) ( not ( = ?auto_1625242 ?auto_1625256 ) ) ( not ( = ?auto_1625243 ?auto_1625244 ) ) ( not ( = ?auto_1625243 ?auto_1625245 ) ) ( not ( = ?auto_1625243 ?auto_1625246 ) ) ( not ( = ?auto_1625243 ?auto_1625247 ) ) ( not ( = ?auto_1625243 ?auto_1625248 ) ) ( not ( = ?auto_1625243 ?auto_1625249 ) ) ( not ( = ?auto_1625243 ?auto_1625250 ) ) ( not ( = ?auto_1625243 ?auto_1625251 ) ) ( not ( = ?auto_1625243 ?auto_1625252 ) ) ( not ( = ?auto_1625243 ?auto_1625256 ) ) ( not ( = ?auto_1625244 ?auto_1625245 ) ) ( not ( = ?auto_1625244 ?auto_1625246 ) ) ( not ( = ?auto_1625244 ?auto_1625247 ) ) ( not ( = ?auto_1625244 ?auto_1625248 ) ) ( not ( = ?auto_1625244 ?auto_1625249 ) ) ( not ( = ?auto_1625244 ?auto_1625250 ) ) ( not ( = ?auto_1625244 ?auto_1625251 ) ) ( not ( = ?auto_1625244 ?auto_1625252 ) ) ( not ( = ?auto_1625244 ?auto_1625256 ) ) ( not ( = ?auto_1625245 ?auto_1625246 ) ) ( not ( = ?auto_1625245 ?auto_1625247 ) ) ( not ( = ?auto_1625245 ?auto_1625248 ) ) ( not ( = ?auto_1625245 ?auto_1625249 ) ) ( not ( = ?auto_1625245 ?auto_1625250 ) ) ( not ( = ?auto_1625245 ?auto_1625251 ) ) ( not ( = ?auto_1625245 ?auto_1625252 ) ) ( not ( = ?auto_1625245 ?auto_1625256 ) ) ( not ( = ?auto_1625246 ?auto_1625247 ) ) ( not ( = ?auto_1625246 ?auto_1625248 ) ) ( not ( = ?auto_1625246 ?auto_1625249 ) ) ( not ( = ?auto_1625246 ?auto_1625250 ) ) ( not ( = ?auto_1625246 ?auto_1625251 ) ) ( not ( = ?auto_1625246 ?auto_1625252 ) ) ( not ( = ?auto_1625246 ?auto_1625256 ) ) ( not ( = ?auto_1625247 ?auto_1625248 ) ) ( not ( = ?auto_1625247 ?auto_1625249 ) ) ( not ( = ?auto_1625247 ?auto_1625250 ) ) ( not ( = ?auto_1625247 ?auto_1625251 ) ) ( not ( = ?auto_1625247 ?auto_1625252 ) ) ( not ( = ?auto_1625247 ?auto_1625256 ) ) ( not ( = ?auto_1625248 ?auto_1625249 ) ) ( not ( = ?auto_1625248 ?auto_1625250 ) ) ( not ( = ?auto_1625248 ?auto_1625251 ) ) ( not ( = ?auto_1625248 ?auto_1625252 ) ) ( not ( = ?auto_1625248 ?auto_1625256 ) ) ( not ( = ?auto_1625249 ?auto_1625250 ) ) ( not ( = ?auto_1625249 ?auto_1625251 ) ) ( not ( = ?auto_1625249 ?auto_1625252 ) ) ( not ( = ?auto_1625249 ?auto_1625256 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625250 ?auto_1625251 ?auto_1625252 )
      ( MAKE-11CRATE-VERIFY ?auto_1625241 ?auto_1625242 ?auto_1625243 ?auto_1625244 ?auto_1625245 ?auto_1625246 ?auto_1625247 ?auto_1625248 ?auto_1625249 ?auto_1625250 ?auto_1625251 ?auto_1625252 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625385 - SURFACE
      ?auto_1625386 - SURFACE
      ?auto_1625387 - SURFACE
      ?auto_1625388 - SURFACE
      ?auto_1625389 - SURFACE
      ?auto_1625390 - SURFACE
      ?auto_1625391 - SURFACE
      ?auto_1625392 - SURFACE
      ?auto_1625393 - SURFACE
      ?auto_1625394 - SURFACE
      ?auto_1625395 - SURFACE
      ?auto_1625396 - SURFACE
    )
    :vars
    (
      ?auto_1625400 - HOIST
      ?auto_1625397 - PLACE
      ?auto_1625399 - PLACE
      ?auto_1625401 - HOIST
      ?auto_1625398 - SURFACE
      ?auto_1625402 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625400 ?auto_1625397 ) ( IS-CRATE ?auto_1625396 ) ( not ( = ?auto_1625395 ?auto_1625396 ) ) ( not ( = ?auto_1625394 ?auto_1625395 ) ) ( not ( = ?auto_1625394 ?auto_1625396 ) ) ( not ( = ?auto_1625399 ?auto_1625397 ) ) ( HOIST-AT ?auto_1625401 ?auto_1625399 ) ( not ( = ?auto_1625400 ?auto_1625401 ) ) ( AVAILABLE ?auto_1625401 ) ( SURFACE-AT ?auto_1625396 ?auto_1625399 ) ( ON ?auto_1625396 ?auto_1625398 ) ( CLEAR ?auto_1625396 ) ( not ( = ?auto_1625395 ?auto_1625398 ) ) ( not ( = ?auto_1625396 ?auto_1625398 ) ) ( not ( = ?auto_1625394 ?auto_1625398 ) ) ( TRUCK-AT ?auto_1625402 ?auto_1625397 ) ( SURFACE-AT ?auto_1625394 ?auto_1625397 ) ( CLEAR ?auto_1625394 ) ( LIFTING ?auto_1625400 ?auto_1625395 ) ( IS-CRATE ?auto_1625395 ) ( ON ?auto_1625386 ?auto_1625385 ) ( ON ?auto_1625387 ?auto_1625386 ) ( ON ?auto_1625388 ?auto_1625387 ) ( ON ?auto_1625389 ?auto_1625388 ) ( ON ?auto_1625390 ?auto_1625389 ) ( ON ?auto_1625391 ?auto_1625390 ) ( ON ?auto_1625392 ?auto_1625391 ) ( ON ?auto_1625393 ?auto_1625392 ) ( ON ?auto_1625394 ?auto_1625393 ) ( not ( = ?auto_1625385 ?auto_1625386 ) ) ( not ( = ?auto_1625385 ?auto_1625387 ) ) ( not ( = ?auto_1625385 ?auto_1625388 ) ) ( not ( = ?auto_1625385 ?auto_1625389 ) ) ( not ( = ?auto_1625385 ?auto_1625390 ) ) ( not ( = ?auto_1625385 ?auto_1625391 ) ) ( not ( = ?auto_1625385 ?auto_1625392 ) ) ( not ( = ?auto_1625385 ?auto_1625393 ) ) ( not ( = ?auto_1625385 ?auto_1625394 ) ) ( not ( = ?auto_1625385 ?auto_1625395 ) ) ( not ( = ?auto_1625385 ?auto_1625396 ) ) ( not ( = ?auto_1625385 ?auto_1625398 ) ) ( not ( = ?auto_1625386 ?auto_1625387 ) ) ( not ( = ?auto_1625386 ?auto_1625388 ) ) ( not ( = ?auto_1625386 ?auto_1625389 ) ) ( not ( = ?auto_1625386 ?auto_1625390 ) ) ( not ( = ?auto_1625386 ?auto_1625391 ) ) ( not ( = ?auto_1625386 ?auto_1625392 ) ) ( not ( = ?auto_1625386 ?auto_1625393 ) ) ( not ( = ?auto_1625386 ?auto_1625394 ) ) ( not ( = ?auto_1625386 ?auto_1625395 ) ) ( not ( = ?auto_1625386 ?auto_1625396 ) ) ( not ( = ?auto_1625386 ?auto_1625398 ) ) ( not ( = ?auto_1625387 ?auto_1625388 ) ) ( not ( = ?auto_1625387 ?auto_1625389 ) ) ( not ( = ?auto_1625387 ?auto_1625390 ) ) ( not ( = ?auto_1625387 ?auto_1625391 ) ) ( not ( = ?auto_1625387 ?auto_1625392 ) ) ( not ( = ?auto_1625387 ?auto_1625393 ) ) ( not ( = ?auto_1625387 ?auto_1625394 ) ) ( not ( = ?auto_1625387 ?auto_1625395 ) ) ( not ( = ?auto_1625387 ?auto_1625396 ) ) ( not ( = ?auto_1625387 ?auto_1625398 ) ) ( not ( = ?auto_1625388 ?auto_1625389 ) ) ( not ( = ?auto_1625388 ?auto_1625390 ) ) ( not ( = ?auto_1625388 ?auto_1625391 ) ) ( not ( = ?auto_1625388 ?auto_1625392 ) ) ( not ( = ?auto_1625388 ?auto_1625393 ) ) ( not ( = ?auto_1625388 ?auto_1625394 ) ) ( not ( = ?auto_1625388 ?auto_1625395 ) ) ( not ( = ?auto_1625388 ?auto_1625396 ) ) ( not ( = ?auto_1625388 ?auto_1625398 ) ) ( not ( = ?auto_1625389 ?auto_1625390 ) ) ( not ( = ?auto_1625389 ?auto_1625391 ) ) ( not ( = ?auto_1625389 ?auto_1625392 ) ) ( not ( = ?auto_1625389 ?auto_1625393 ) ) ( not ( = ?auto_1625389 ?auto_1625394 ) ) ( not ( = ?auto_1625389 ?auto_1625395 ) ) ( not ( = ?auto_1625389 ?auto_1625396 ) ) ( not ( = ?auto_1625389 ?auto_1625398 ) ) ( not ( = ?auto_1625390 ?auto_1625391 ) ) ( not ( = ?auto_1625390 ?auto_1625392 ) ) ( not ( = ?auto_1625390 ?auto_1625393 ) ) ( not ( = ?auto_1625390 ?auto_1625394 ) ) ( not ( = ?auto_1625390 ?auto_1625395 ) ) ( not ( = ?auto_1625390 ?auto_1625396 ) ) ( not ( = ?auto_1625390 ?auto_1625398 ) ) ( not ( = ?auto_1625391 ?auto_1625392 ) ) ( not ( = ?auto_1625391 ?auto_1625393 ) ) ( not ( = ?auto_1625391 ?auto_1625394 ) ) ( not ( = ?auto_1625391 ?auto_1625395 ) ) ( not ( = ?auto_1625391 ?auto_1625396 ) ) ( not ( = ?auto_1625391 ?auto_1625398 ) ) ( not ( = ?auto_1625392 ?auto_1625393 ) ) ( not ( = ?auto_1625392 ?auto_1625394 ) ) ( not ( = ?auto_1625392 ?auto_1625395 ) ) ( not ( = ?auto_1625392 ?auto_1625396 ) ) ( not ( = ?auto_1625392 ?auto_1625398 ) ) ( not ( = ?auto_1625393 ?auto_1625394 ) ) ( not ( = ?auto_1625393 ?auto_1625395 ) ) ( not ( = ?auto_1625393 ?auto_1625396 ) ) ( not ( = ?auto_1625393 ?auto_1625398 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625394 ?auto_1625395 ?auto_1625396 )
      ( MAKE-11CRATE-VERIFY ?auto_1625385 ?auto_1625386 ?auto_1625387 ?auto_1625388 ?auto_1625389 ?auto_1625390 ?auto_1625391 ?auto_1625392 ?auto_1625393 ?auto_1625394 ?auto_1625395 ?auto_1625396 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1625529 - SURFACE
      ?auto_1625530 - SURFACE
      ?auto_1625531 - SURFACE
      ?auto_1625532 - SURFACE
      ?auto_1625533 - SURFACE
      ?auto_1625534 - SURFACE
      ?auto_1625535 - SURFACE
      ?auto_1625536 - SURFACE
      ?auto_1625537 - SURFACE
      ?auto_1625538 - SURFACE
      ?auto_1625539 - SURFACE
      ?auto_1625540 - SURFACE
    )
    :vars
    (
      ?auto_1625544 - HOIST
      ?auto_1625546 - PLACE
      ?auto_1625542 - PLACE
      ?auto_1625543 - HOIST
      ?auto_1625545 - SURFACE
      ?auto_1625541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625544 ?auto_1625546 ) ( IS-CRATE ?auto_1625540 ) ( not ( = ?auto_1625539 ?auto_1625540 ) ) ( not ( = ?auto_1625538 ?auto_1625539 ) ) ( not ( = ?auto_1625538 ?auto_1625540 ) ) ( not ( = ?auto_1625542 ?auto_1625546 ) ) ( HOIST-AT ?auto_1625543 ?auto_1625542 ) ( not ( = ?auto_1625544 ?auto_1625543 ) ) ( AVAILABLE ?auto_1625543 ) ( SURFACE-AT ?auto_1625540 ?auto_1625542 ) ( ON ?auto_1625540 ?auto_1625545 ) ( CLEAR ?auto_1625540 ) ( not ( = ?auto_1625539 ?auto_1625545 ) ) ( not ( = ?auto_1625540 ?auto_1625545 ) ) ( not ( = ?auto_1625538 ?auto_1625545 ) ) ( TRUCK-AT ?auto_1625541 ?auto_1625546 ) ( SURFACE-AT ?auto_1625538 ?auto_1625546 ) ( CLEAR ?auto_1625538 ) ( IS-CRATE ?auto_1625539 ) ( AVAILABLE ?auto_1625544 ) ( IN ?auto_1625539 ?auto_1625541 ) ( ON ?auto_1625530 ?auto_1625529 ) ( ON ?auto_1625531 ?auto_1625530 ) ( ON ?auto_1625532 ?auto_1625531 ) ( ON ?auto_1625533 ?auto_1625532 ) ( ON ?auto_1625534 ?auto_1625533 ) ( ON ?auto_1625535 ?auto_1625534 ) ( ON ?auto_1625536 ?auto_1625535 ) ( ON ?auto_1625537 ?auto_1625536 ) ( ON ?auto_1625538 ?auto_1625537 ) ( not ( = ?auto_1625529 ?auto_1625530 ) ) ( not ( = ?auto_1625529 ?auto_1625531 ) ) ( not ( = ?auto_1625529 ?auto_1625532 ) ) ( not ( = ?auto_1625529 ?auto_1625533 ) ) ( not ( = ?auto_1625529 ?auto_1625534 ) ) ( not ( = ?auto_1625529 ?auto_1625535 ) ) ( not ( = ?auto_1625529 ?auto_1625536 ) ) ( not ( = ?auto_1625529 ?auto_1625537 ) ) ( not ( = ?auto_1625529 ?auto_1625538 ) ) ( not ( = ?auto_1625529 ?auto_1625539 ) ) ( not ( = ?auto_1625529 ?auto_1625540 ) ) ( not ( = ?auto_1625529 ?auto_1625545 ) ) ( not ( = ?auto_1625530 ?auto_1625531 ) ) ( not ( = ?auto_1625530 ?auto_1625532 ) ) ( not ( = ?auto_1625530 ?auto_1625533 ) ) ( not ( = ?auto_1625530 ?auto_1625534 ) ) ( not ( = ?auto_1625530 ?auto_1625535 ) ) ( not ( = ?auto_1625530 ?auto_1625536 ) ) ( not ( = ?auto_1625530 ?auto_1625537 ) ) ( not ( = ?auto_1625530 ?auto_1625538 ) ) ( not ( = ?auto_1625530 ?auto_1625539 ) ) ( not ( = ?auto_1625530 ?auto_1625540 ) ) ( not ( = ?auto_1625530 ?auto_1625545 ) ) ( not ( = ?auto_1625531 ?auto_1625532 ) ) ( not ( = ?auto_1625531 ?auto_1625533 ) ) ( not ( = ?auto_1625531 ?auto_1625534 ) ) ( not ( = ?auto_1625531 ?auto_1625535 ) ) ( not ( = ?auto_1625531 ?auto_1625536 ) ) ( not ( = ?auto_1625531 ?auto_1625537 ) ) ( not ( = ?auto_1625531 ?auto_1625538 ) ) ( not ( = ?auto_1625531 ?auto_1625539 ) ) ( not ( = ?auto_1625531 ?auto_1625540 ) ) ( not ( = ?auto_1625531 ?auto_1625545 ) ) ( not ( = ?auto_1625532 ?auto_1625533 ) ) ( not ( = ?auto_1625532 ?auto_1625534 ) ) ( not ( = ?auto_1625532 ?auto_1625535 ) ) ( not ( = ?auto_1625532 ?auto_1625536 ) ) ( not ( = ?auto_1625532 ?auto_1625537 ) ) ( not ( = ?auto_1625532 ?auto_1625538 ) ) ( not ( = ?auto_1625532 ?auto_1625539 ) ) ( not ( = ?auto_1625532 ?auto_1625540 ) ) ( not ( = ?auto_1625532 ?auto_1625545 ) ) ( not ( = ?auto_1625533 ?auto_1625534 ) ) ( not ( = ?auto_1625533 ?auto_1625535 ) ) ( not ( = ?auto_1625533 ?auto_1625536 ) ) ( not ( = ?auto_1625533 ?auto_1625537 ) ) ( not ( = ?auto_1625533 ?auto_1625538 ) ) ( not ( = ?auto_1625533 ?auto_1625539 ) ) ( not ( = ?auto_1625533 ?auto_1625540 ) ) ( not ( = ?auto_1625533 ?auto_1625545 ) ) ( not ( = ?auto_1625534 ?auto_1625535 ) ) ( not ( = ?auto_1625534 ?auto_1625536 ) ) ( not ( = ?auto_1625534 ?auto_1625537 ) ) ( not ( = ?auto_1625534 ?auto_1625538 ) ) ( not ( = ?auto_1625534 ?auto_1625539 ) ) ( not ( = ?auto_1625534 ?auto_1625540 ) ) ( not ( = ?auto_1625534 ?auto_1625545 ) ) ( not ( = ?auto_1625535 ?auto_1625536 ) ) ( not ( = ?auto_1625535 ?auto_1625537 ) ) ( not ( = ?auto_1625535 ?auto_1625538 ) ) ( not ( = ?auto_1625535 ?auto_1625539 ) ) ( not ( = ?auto_1625535 ?auto_1625540 ) ) ( not ( = ?auto_1625535 ?auto_1625545 ) ) ( not ( = ?auto_1625536 ?auto_1625537 ) ) ( not ( = ?auto_1625536 ?auto_1625538 ) ) ( not ( = ?auto_1625536 ?auto_1625539 ) ) ( not ( = ?auto_1625536 ?auto_1625540 ) ) ( not ( = ?auto_1625536 ?auto_1625545 ) ) ( not ( = ?auto_1625537 ?auto_1625538 ) ) ( not ( = ?auto_1625537 ?auto_1625539 ) ) ( not ( = ?auto_1625537 ?auto_1625540 ) ) ( not ( = ?auto_1625537 ?auto_1625545 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1625538 ?auto_1625539 ?auto_1625540 )
      ( MAKE-11CRATE-VERIFY ?auto_1625529 ?auto_1625530 ?auto_1625531 ?auto_1625532 ?auto_1625533 ?auto_1625534 ?auto_1625535 ?auto_1625536 ?auto_1625537 ?auto_1625538 ?auto_1625539 ?auto_1625540 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634798 - SURFACE
      ?auto_1634799 - SURFACE
      ?auto_1634800 - SURFACE
      ?auto_1634801 - SURFACE
      ?auto_1634802 - SURFACE
      ?auto_1634803 - SURFACE
      ?auto_1634804 - SURFACE
      ?auto_1634805 - SURFACE
      ?auto_1634806 - SURFACE
      ?auto_1634807 - SURFACE
      ?auto_1634808 - SURFACE
      ?auto_1634809 - SURFACE
      ?auto_1634810 - SURFACE
    )
    :vars
    (
      ?auto_1634811 - HOIST
      ?auto_1634812 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634811 ?auto_1634812 ) ( SURFACE-AT ?auto_1634809 ?auto_1634812 ) ( CLEAR ?auto_1634809 ) ( LIFTING ?auto_1634811 ?auto_1634810 ) ( IS-CRATE ?auto_1634810 ) ( not ( = ?auto_1634809 ?auto_1634810 ) ) ( ON ?auto_1634799 ?auto_1634798 ) ( ON ?auto_1634800 ?auto_1634799 ) ( ON ?auto_1634801 ?auto_1634800 ) ( ON ?auto_1634802 ?auto_1634801 ) ( ON ?auto_1634803 ?auto_1634802 ) ( ON ?auto_1634804 ?auto_1634803 ) ( ON ?auto_1634805 ?auto_1634804 ) ( ON ?auto_1634806 ?auto_1634805 ) ( ON ?auto_1634807 ?auto_1634806 ) ( ON ?auto_1634808 ?auto_1634807 ) ( ON ?auto_1634809 ?auto_1634808 ) ( not ( = ?auto_1634798 ?auto_1634799 ) ) ( not ( = ?auto_1634798 ?auto_1634800 ) ) ( not ( = ?auto_1634798 ?auto_1634801 ) ) ( not ( = ?auto_1634798 ?auto_1634802 ) ) ( not ( = ?auto_1634798 ?auto_1634803 ) ) ( not ( = ?auto_1634798 ?auto_1634804 ) ) ( not ( = ?auto_1634798 ?auto_1634805 ) ) ( not ( = ?auto_1634798 ?auto_1634806 ) ) ( not ( = ?auto_1634798 ?auto_1634807 ) ) ( not ( = ?auto_1634798 ?auto_1634808 ) ) ( not ( = ?auto_1634798 ?auto_1634809 ) ) ( not ( = ?auto_1634798 ?auto_1634810 ) ) ( not ( = ?auto_1634799 ?auto_1634800 ) ) ( not ( = ?auto_1634799 ?auto_1634801 ) ) ( not ( = ?auto_1634799 ?auto_1634802 ) ) ( not ( = ?auto_1634799 ?auto_1634803 ) ) ( not ( = ?auto_1634799 ?auto_1634804 ) ) ( not ( = ?auto_1634799 ?auto_1634805 ) ) ( not ( = ?auto_1634799 ?auto_1634806 ) ) ( not ( = ?auto_1634799 ?auto_1634807 ) ) ( not ( = ?auto_1634799 ?auto_1634808 ) ) ( not ( = ?auto_1634799 ?auto_1634809 ) ) ( not ( = ?auto_1634799 ?auto_1634810 ) ) ( not ( = ?auto_1634800 ?auto_1634801 ) ) ( not ( = ?auto_1634800 ?auto_1634802 ) ) ( not ( = ?auto_1634800 ?auto_1634803 ) ) ( not ( = ?auto_1634800 ?auto_1634804 ) ) ( not ( = ?auto_1634800 ?auto_1634805 ) ) ( not ( = ?auto_1634800 ?auto_1634806 ) ) ( not ( = ?auto_1634800 ?auto_1634807 ) ) ( not ( = ?auto_1634800 ?auto_1634808 ) ) ( not ( = ?auto_1634800 ?auto_1634809 ) ) ( not ( = ?auto_1634800 ?auto_1634810 ) ) ( not ( = ?auto_1634801 ?auto_1634802 ) ) ( not ( = ?auto_1634801 ?auto_1634803 ) ) ( not ( = ?auto_1634801 ?auto_1634804 ) ) ( not ( = ?auto_1634801 ?auto_1634805 ) ) ( not ( = ?auto_1634801 ?auto_1634806 ) ) ( not ( = ?auto_1634801 ?auto_1634807 ) ) ( not ( = ?auto_1634801 ?auto_1634808 ) ) ( not ( = ?auto_1634801 ?auto_1634809 ) ) ( not ( = ?auto_1634801 ?auto_1634810 ) ) ( not ( = ?auto_1634802 ?auto_1634803 ) ) ( not ( = ?auto_1634802 ?auto_1634804 ) ) ( not ( = ?auto_1634802 ?auto_1634805 ) ) ( not ( = ?auto_1634802 ?auto_1634806 ) ) ( not ( = ?auto_1634802 ?auto_1634807 ) ) ( not ( = ?auto_1634802 ?auto_1634808 ) ) ( not ( = ?auto_1634802 ?auto_1634809 ) ) ( not ( = ?auto_1634802 ?auto_1634810 ) ) ( not ( = ?auto_1634803 ?auto_1634804 ) ) ( not ( = ?auto_1634803 ?auto_1634805 ) ) ( not ( = ?auto_1634803 ?auto_1634806 ) ) ( not ( = ?auto_1634803 ?auto_1634807 ) ) ( not ( = ?auto_1634803 ?auto_1634808 ) ) ( not ( = ?auto_1634803 ?auto_1634809 ) ) ( not ( = ?auto_1634803 ?auto_1634810 ) ) ( not ( = ?auto_1634804 ?auto_1634805 ) ) ( not ( = ?auto_1634804 ?auto_1634806 ) ) ( not ( = ?auto_1634804 ?auto_1634807 ) ) ( not ( = ?auto_1634804 ?auto_1634808 ) ) ( not ( = ?auto_1634804 ?auto_1634809 ) ) ( not ( = ?auto_1634804 ?auto_1634810 ) ) ( not ( = ?auto_1634805 ?auto_1634806 ) ) ( not ( = ?auto_1634805 ?auto_1634807 ) ) ( not ( = ?auto_1634805 ?auto_1634808 ) ) ( not ( = ?auto_1634805 ?auto_1634809 ) ) ( not ( = ?auto_1634805 ?auto_1634810 ) ) ( not ( = ?auto_1634806 ?auto_1634807 ) ) ( not ( = ?auto_1634806 ?auto_1634808 ) ) ( not ( = ?auto_1634806 ?auto_1634809 ) ) ( not ( = ?auto_1634806 ?auto_1634810 ) ) ( not ( = ?auto_1634807 ?auto_1634808 ) ) ( not ( = ?auto_1634807 ?auto_1634809 ) ) ( not ( = ?auto_1634807 ?auto_1634810 ) ) ( not ( = ?auto_1634808 ?auto_1634809 ) ) ( not ( = ?auto_1634808 ?auto_1634810 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1634809 ?auto_1634810 )
      ( MAKE-12CRATE-VERIFY ?auto_1634798 ?auto_1634799 ?auto_1634800 ?auto_1634801 ?auto_1634802 ?auto_1634803 ?auto_1634804 ?auto_1634805 ?auto_1634806 ?auto_1634807 ?auto_1634808 ?auto_1634809 ?auto_1634810 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1634923 - SURFACE
      ?auto_1634924 - SURFACE
      ?auto_1634925 - SURFACE
      ?auto_1634926 - SURFACE
      ?auto_1634927 - SURFACE
      ?auto_1634928 - SURFACE
      ?auto_1634929 - SURFACE
      ?auto_1634930 - SURFACE
      ?auto_1634931 - SURFACE
      ?auto_1634932 - SURFACE
      ?auto_1634933 - SURFACE
      ?auto_1634934 - SURFACE
      ?auto_1634935 - SURFACE
    )
    :vars
    (
      ?auto_1634937 - HOIST
      ?auto_1634938 - PLACE
      ?auto_1634936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1634937 ?auto_1634938 ) ( SURFACE-AT ?auto_1634934 ?auto_1634938 ) ( CLEAR ?auto_1634934 ) ( IS-CRATE ?auto_1634935 ) ( not ( = ?auto_1634934 ?auto_1634935 ) ) ( TRUCK-AT ?auto_1634936 ?auto_1634938 ) ( AVAILABLE ?auto_1634937 ) ( IN ?auto_1634935 ?auto_1634936 ) ( ON ?auto_1634934 ?auto_1634933 ) ( not ( = ?auto_1634933 ?auto_1634934 ) ) ( not ( = ?auto_1634933 ?auto_1634935 ) ) ( ON ?auto_1634924 ?auto_1634923 ) ( ON ?auto_1634925 ?auto_1634924 ) ( ON ?auto_1634926 ?auto_1634925 ) ( ON ?auto_1634927 ?auto_1634926 ) ( ON ?auto_1634928 ?auto_1634927 ) ( ON ?auto_1634929 ?auto_1634928 ) ( ON ?auto_1634930 ?auto_1634929 ) ( ON ?auto_1634931 ?auto_1634930 ) ( ON ?auto_1634932 ?auto_1634931 ) ( ON ?auto_1634933 ?auto_1634932 ) ( not ( = ?auto_1634923 ?auto_1634924 ) ) ( not ( = ?auto_1634923 ?auto_1634925 ) ) ( not ( = ?auto_1634923 ?auto_1634926 ) ) ( not ( = ?auto_1634923 ?auto_1634927 ) ) ( not ( = ?auto_1634923 ?auto_1634928 ) ) ( not ( = ?auto_1634923 ?auto_1634929 ) ) ( not ( = ?auto_1634923 ?auto_1634930 ) ) ( not ( = ?auto_1634923 ?auto_1634931 ) ) ( not ( = ?auto_1634923 ?auto_1634932 ) ) ( not ( = ?auto_1634923 ?auto_1634933 ) ) ( not ( = ?auto_1634923 ?auto_1634934 ) ) ( not ( = ?auto_1634923 ?auto_1634935 ) ) ( not ( = ?auto_1634924 ?auto_1634925 ) ) ( not ( = ?auto_1634924 ?auto_1634926 ) ) ( not ( = ?auto_1634924 ?auto_1634927 ) ) ( not ( = ?auto_1634924 ?auto_1634928 ) ) ( not ( = ?auto_1634924 ?auto_1634929 ) ) ( not ( = ?auto_1634924 ?auto_1634930 ) ) ( not ( = ?auto_1634924 ?auto_1634931 ) ) ( not ( = ?auto_1634924 ?auto_1634932 ) ) ( not ( = ?auto_1634924 ?auto_1634933 ) ) ( not ( = ?auto_1634924 ?auto_1634934 ) ) ( not ( = ?auto_1634924 ?auto_1634935 ) ) ( not ( = ?auto_1634925 ?auto_1634926 ) ) ( not ( = ?auto_1634925 ?auto_1634927 ) ) ( not ( = ?auto_1634925 ?auto_1634928 ) ) ( not ( = ?auto_1634925 ?auto_1634929 ) ) ( not ( = ?auto_1634925 ?auto_1634930 ) ) ( not ( = ?auto_1634925 ?auto_1634931 ) ) ( not ( = ?auto_1634925 ?auto_1634932 ) ) ( not ( = ?auto_1634925 ?auto_1634933 ) ) ( not ( = ?auto_1634925 ?auto_1634934 ) ) ( not ( = ?auto_1634925 ?auto_1634935 ) ) ( not ( = ?auto_1634926 ?auto_1634927 ) ) ( not ( = ?auto_1634926 ?auto_1634928 ) ) ( not ( = ?auto_1634926 ?auto_1634929 ) ) ( not ( = ?auto_1634926 ?auto_1634930 ) ) ( not ( = ?auto_1634926 ?auto_1634931 ) ) ( not ( = ?auto_1634926 ?auto_1634932 ) ) ( not ( = ?auto_1634926 ?auto_1634933 ) ) ( not ( = ?auto_1634926 ?auto_1634934 ) ) ( not ( = ?auto_1634926 ?auto_1634935 ) ) ( not ( = ?auto_1634927 ?auto_1634928 ) ) ( not ( = ?auto_1634927 ?auto_1634929 ) ) ( not ( = ?auto_1634927 ?auto_1634930 ) ) ( not ( = ?auto_1634927 ?auto_1634931 ) ) ( not ( = ?auto_1634927 ?auto_1634932 ) ) ( not ( = ?auto_1634927 ?auto_1634933 ) ) ( not ( = ?auto_1634927 ?auto_1634934 ) ) ( not ( = ?auto_1634927 ?auto_1634935 ) ) ( not ( = ?auto_1634928 ?auto_1634929 ) ) ( not ( = ?auto_1634928 ?auto_1634930 ) ) ( not ( = ?auto_1634928 ?auto_1634931 ) ) ( not ( = ?auto_1634928 ?auto_1634932 ) ) ( not ( = ?auto_1634928 ?auto_1634933 ) ) ( not ( = ?auto_1634928 ?auto_1634934 ) ) ( not ( = ?auto_1634928 ?auto_1634935 ) ) ( not ( = ?auto_1634929 ?auto_1634930 ) ) ( not ( = ?auto_1634929 ?auto_1634931 ) ) ( not ( = ?auto_1634929 ?auto_1634932 ) ) ( not ( = ?auto_1634929 ?auto_1634933 ) ) ( not ( = ?auto_1634929 ?auto_1634934 ) ) ( not ( = ?auto_1634929 ?auto_1634935 ) ) ( not ( = ?auto_1634930 ?auto_1634931 ) ) ( not ( = ?auto_1634930 ?auto_1634932 ) ) ( not ( = ?auto_1634930 ?auto_1634933 ) ) ( not ( = ?auto_1634930 ?auto_1634934 ) ) ( not ( = ?auto_1634930 ?auto_1634935 ) ) ( not ( = ?auto_1634931 ?auto_1634932 ) ) ( not ( = ?auto_1634931 ?auto_1634933 ) ) ( not ( = ?auto_1634931 ?auto_1634934 ) ) ( not ( = ?auto_1634931 ?auto_1634935 ) ) ( not ( = ?auto_1634932 ?auto_1634933 ) ) ( not ( = ?auto_1634932 ?auto_1634934 ) ) ( not ( = ?auto_1634932 ?auto_1634935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1634933 ?auto_1634934 ?auto_1634935 )
      ( MAKE-12CRATE-VERIFY ?auto_1634923 ?auto_1634924 ?auto_1634925 ?auto_1634926 ?auto_1634927 ?auto_1634928 ?auto_1634929 ?auto_1634930 ?auto_1634931 ?auto_1634932 ?auto_1634933 ?auto_1634934 ?auto_1634935 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635061 - SURFACE
      ?auto_1635062 - SURFACE
      ?auto_1635063 - SURFACE
      ?auto_1635064 - SURFACE
      ?auto_1635065 - SURFACE
      ?auto_1635066 - SURFACE
      ?auto_1635067 - SURFACE
      ?auto_1635068 - SURFACE
      ?auto_1635069 - SURFACE
      ?auto_1635070 - SURFACE
      ?auto_1635071 - SURFACE
      ?auto_1635072 - SURFACE
      ?auto_1635073 - SURFACE
    )
    :vars
    (
      ?auto_1635075 - HOIST
      ?auto_1635076 - PLACE
      ?auto_1635074 - TRUCK
      ?auto_1635077 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635075 ?auto_1635076 ) ( SURFACE-AT ?auto_1635072 ?auto_1635076 ) ( CLEAR ?auto_1635072 ) ( IS-CRATE ?auto_1635073 ) ( not ( = ?auto_1635072 ?auto_1635073 ) ) ( AVAILABLE ?auto_1635075 ) ( IN ?auto_1635073 ?auto_1635074 ) ( ON ?auto_1635072 ?auto_1635071 ) ( not ( = ?auto_1635071 ?auto_1635072 ) ) ( not ( = ?auto_1635071 ?auto_1635073 ) ) ( TRUCK-AT ?auto_1635074 ?auto_1635077 ) ( not ( = ?auto_1635077 ?auto_1635076 ) ) ( ON ?auto_1635062 ?auto_1635061 ) ( ON ?auto_1635063 ?auto_1635062 ) ( ON ?auto_1635064 ?auto_1635063 ) ( ON ?auto_1635065 ?auto_1635064 ) ( ON ?auto_1635066 ?auto_1635065 ) ( ON ?auto_1635067 ?auto_1635066 ) ( ON ?auto_1635068 ?auto_1635067 ) ( ON ?auto_1635069 ?auto_1635068 ) ( ON ?auto_1635070 ?auto_1635069 ) ( ON ?auto_1635071 ?auto_1635070 ) ( not ( = ?auto_1635061 ?auto_1635062 ) ) ( not ( = ?auto_1635061 ?auto_1635063 ) ) ( not ( = ?auto_1635061 ?auto_1635064 ) ) ( not ( = ?auto_1635061 ?auto_1635065 ) ) ( not ( = ?auto_1635061 ?auto_1635066 ) ) ( not ( = ?auto_1635061 ?auto_1635067 ) ) ( not ( = ?auto_1635061 ?auto_1635068 ) ) ( not ( = ?auto_1635061 ?auto_1635069 ) ) ( not ( = ?auto_1635061 ?auto_1635070 ) ) ( not ( = ?auto_1635061 ?auto_1635071 ) ) ( not ( = ?auto_1635061 ?auto_1635072 ) ) ( not ( = ?auto_1635061 ?auto_1635073 ) ) ( not ( = ?auto_1635062 ?auto_1635063 ) ) ( not ( = ?auto_1635062 ?auto_1635064 ) ) ( not ( = ?auto_1635062 ?auto_1635065 ) ) ( not ( = ?auto_1635062 ?auto_1635066 ) ) ( not ( = ?auto_1635062 ?auto_1635067 ) ) ( not ( = ?auto_1635062 ?auto_1635068 ) ) ( not ( = ?auto_1635062 ?auto_1635069 ) ) ( not ( = ?auto_1635062 ?auto_1635070 ) ) ( not ( = ?auto_1635062 ?auto_1635071 ) ) ( not ( = ?auto_1635062 ?auto_1635072 ) ) ( not ( = ?auto_1635062 ?auto_1635073 ) ) ( not ( = ?auto_1635063 ?auto_1635064 ) ) ( not ( = ?auto_1635063 ?auto_1635065 ) ) ( not ( = ?auto_1635063 ?auto_1635066 ) ) ( not ( = ?auto_1635063 ?auto_1635067 ) ) ( not ( = ?auto_1635063 ?auto_1635068 ) ) ( not ( = ?auto_1635063 ?auto_1635069 ) ) ( not ( = ?auto_1635063 ?auto_1635070 ) ) ( not ( = ?auto_1635063 ?auto_1635071 ) ) ( not ( = ?auto_1635063 ?auto_1635072 ) ) ( not ( = ?auto_1635063 ?auto_1635073 ) ) ( not ( = ?auto_1635064 ?auto_1635065 ) ) ( not ( = ?auto_1635064 ?auto_1635066 ) ) ( not ( = ?auto_1635064 ?auto_1635067 ) ) ( not ( = ?auto_1635064 ?auto_1635068 ) ) ( not ( = ?auto_1635064 ?auto_1635069 ) ) ( not ( = ?auto_1635064 ?auto_1635070 ) ) ( not ( = ?auto_1635064 ?auto_1635071 ) ) ( not ( = ?auto_1635064 ?auto_1635072 ) ) ( not ( = ?auto_1635064 ?auto_1635073 ) ) ( not ( = ?auto_1635065 ?auto_1635066 ) ) ( not ( = ?auto_1635065 ?auto_1635067 ) ) ( not ( = ?auto_1635065 ?auto_1635068 ) ) ( not ( = ?auto_1635065 ?auto_1635069 ) ) ( not ( = ?auto_1635065 ?auto_1635070 ) ) ( not ( = ?auto_1635065 ?auto_1635071 ) ) ( not ( = ?auto_1635065 ?auto_1635072 ) ) ( not ( = ?auto_1635065 ?auto_1635073 ) ) ( not ( = ?auto_1635066 ?auto_1635067 ) ) ( not ( = ?auto_1635066 ?auto_1635068 ) ) ( not ( = ?auto_1635066 ?auto_1635069 ) ) ( not ( = ?auto_1635066 ?auto_1635070 ) ) ( not ( = ?auto_1635066 ?auto_1635071 ) ) ( not ( = ?auto_1635066 ?auto_1635072 ) ) ( not ( = ?auto_1635066 ?auto_1635073 ) ) ( not ( = ?auto_1635067 ?auto_1635068 ) ) ( not ( = ?auto_1635067 ?auto_1635069 ) ) ( not ( = ?auto_1635067 ?auto_1635070 ) ) ( not ( = ?auto_1635067 ?auto_1635071 ) ) ( not ( = ?auto_1635067 ?auto_1635072 ) ) ( not ( = ?auto_1635067 ?auto_1635073 ) ) ( not ( = ?auto_1635068 ?auto_1635069 ) ) ( not ( = ?auto_1635068 ?auto_1635070 ) ) ( not ( = ?auto_1635068 ?auto_1635071 ) ) ( not ( = ?auto_1635068 ?auto_1635072 ) ) ( not ( = ?auto_1635068 ?auto_1635073 ) ) ( not ( = ?auto_1635069 ?auto_1635070 ) ) ( not ( = ?auto_1635069 ?auto_1635071 ) ) ( not ( = ?auto_1635069 ?auto_1635072 ) ) ( not ( = ?auto_1635069 ?auto_1635073 ) ) ( not ( = ?auto_1635070 ?auto_1635071 ) ) ( not ( = ?auto_1635070 ?auto_1635072 ) ) ( not ( = ?auto_1635070 ?auto_1635073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635071 ?auto_1635072 ?auto_1635073 )
      ( MAKE-12CRATE-VERIFY ?auto_1635061 ?auto_1635062 ?auto_1635063 ?auto_1635064 ?auto_1635065 ?auto_1635066 ?auto_1635067 ?auto_1635068 ?auto_1635069 ?auto_1635070 ?auto_1635071 ?auto_1635072 ?auto_1635073 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635211 - SURFACE
      ?auto_1635212 - SURFACE
      ?auto_1635213 - SURFACE
      ?auto_1635214 - SURFACE
      ?auto_1635215 - SURFACE
      ?auto_1635216 - SURFACE
      ?auto_1635217 - SURFACE
      ?auto_1635218 - SURFACE
      ?auto_1635219 - SURFACE
      ?auto_1635220 - SURFACE
      ?auto_1635221 - SURFACE
      ?auto_1635222 - SURFACE
      ?auto_1635223 - SURFACE
    )
    :vars
    (
      ?auto_1635226 - HOIST
      ?auto_1635224 - PLACE
      ?auto_1635225 - TRUCK
      ?auto_1635228 - PLACE
      ?auto_1635227 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635226 ?auto_1635224 ) ( SURFACE-AT ?auto_1635222 ?auto_1635224 ) ( CLEAR ?auto_1635222 ) ( IS-CRATE ?auto_1635223 ) ( not ( = ?auto_1635222 ?auto_1635223 ) ) ( AVAILABLE ?auto_1635226 ) ( ON ?auto_1635222 ?auto_1635221 ) ( not ( = ?auto_1635221 ?auto_1635222 ) ) ( not ( = ?auto_1635221 ?auto_1635223 ) ) ( TRUCK-AT ?auto_1635225 ?auto_1635228 ) ( not ( = ?auto_1635228 ?auto_1635224 ) ) ( HOIST-AT ?auto_1635227 ?auto_1635228 ) ( LIFTING ?auto_1635227 ?auto_1635223 ) ( not ( = ?auto_1635226 ?auto_1635227 ) ) ( ON ?auto_1635212 ?auto_1635211 ) ( ON ?auto_1635213 ?auto_1635212 ) ( ON ?auto_1635214 ?auto_1635213 ) ( ON ?auto_1635215 ?auto_1635214 ) ( ON ?auto_1635216 ?auto_1635215 ) ( ON ?auto_1635217 ?auto_1635216 ) ( ON ?auto_1635218 ?auto_1635217 ) ( ON ?auto_1635219 ?auto_1635218 ) ( ON ?auto_1635220 ?auto_1635219 ) ( ON ?auto_1635221 ?auto_1635220 ) ( not ( = ?auto_1635211 ?auto_1635212 ) ) ( not ( = ?auto_1635211 ?auto_1635213 ) ) ( not ( = ?auto_1635211 ?auto_1635214 ) ) ( not ( = ?auto_1635211 ?auto_1635215 ) ) ( not ( = ?auto_1635211 ?auto_1635216 ) ) ( not ( = ?auto_1635211 ?auto_1635217 ) ) ( not ( = ?auto_1635211 ?auto_1635218 ) ) ( not ( = ?auto_1635211 ?auto_1635219 ) ) ( not ( = ?auto_1635211 ?auto_1635220 ) ) ( not ( = ?auto_1635211 ?auto_1635221 ) ) ( not ( = ?auto_1635211 ?auto_1635222 ) ) ( not ( = ?auto_1635211 ?auto_1635223 ) ) ( not ( = ?auto_1635212 ?auto_1635213 ) ) ( not ( = ?auto_1635212 ?auto_1635214 ) ) ( not ( = ?auto_1635212 ?auto_1635215 ) ) ( not ( = ?auto_1635212 ?auto_1635216 ) ) ( not ( = ?auto_1635212 ?auto_1635217 ) ) ( not ( = ?auto_1635212 ?auto_1635218 ) ) ( not ( = ?auto_1635212 ?auto_1635219 ) ) ( not ( = ?auto_1635212 ?auto_1635220 ) ) ( not ( = ?auto_1635212 ?auto_1635221 ) ) ( not ( = ?auto_1635212 ?auto_1635222 ) ) ( not ( = ?auto_1635212 ?auto_1635223 ) ) ( not ( = ?auto_1635213 ?auto_1635214 ) ) ( not ( = ?auto_1635213 ?auto_1635215 ) ) ( not ( = ?auto_1635213 ?auto_1635216 ) ) ( not ( = ?auto_1635213 ?auto_1635217 ) ) ( not ( = ?auto_1635213 ?auto_1635218 ) ) ( not ( = ?auto_1635213 ?auto_1635219 ) ) ( not ( = ?auto_1635213 ?auto_1635220 ) ) ( not ( = ?auto_1635213 ?auto_1635221 ) ) ( not ( = ?auto_1635213 ?auto_1635222 ) ) ( not ( = ?auto_1635213 ?auto_1635223 ) ) ( not ( = ?auto_1635214 ?auto_1635215 ) ) ( not ( = ?auto_1635214 ?auto_1635216 ) ) ( not ( = ?auto_1635214 ?auto_1635217 ) ) ( not ( = ?auto_1635214 ?auto_1635218 ) ) ( not ( = ?auto_1635214 ?auto_1635219 ) ) ( not ( = ?auto_1635214 ?auto_1635220 ) ) ( not ( = ?auto_1635214 ?auto_1635221 ) ) ( not ( = ?auto_1635214 ?auto_1635222 ) ) ( not ( = ?auto_1635214 ?auto_1635223 ) ) ( not ( = ?auto_1635215 ?auto_1635216 ) ) ( not ( = ?auto_1635215 ?auto_1635217 ) ) ( not ( = ?auto_1635215 ?auto_1635218 ) ) ( not ( = ?auto_1635215 ?auto_1635219 ) ) ( not ( = ?auto_1635215 ?auto_1635220 ) ) ( not ( = ?auto_1635215 ?auto_1635221 ) ) ( not ( = ?auto_1635215 ?auto_1635222 ) ) ( not ( = ?auto_1635215 ?auto_1635223 ) ) ( not ( = ?auto_1635216 ?auto_1635217 ) ) ( not ( = ?auto_1635216 ?auto_1635218 ) ) ( not ( = ?auto_1635216 ?auto_1635219 ) ) ( not ( = ?auto_1635216 ?auto_1635220 ) ) ( not ( = ?auto_1635216 ?auto_1635221 ) ) ( not ( = ?auto_1635216 ?auto_1635222 ) ) ( not ( = ?auto_1635216 ?auto_1635223 ) ) ( not ( = ?auto_1635217 ?auto_1635218 ) ) ( not ( = ?auto_1635217 ?auto_1635219 ) ) ( not ( = ?auto_1635217 ?auto_1635220 ) ) ( not ( = ?auto_1635217 ?auto_1635221 ) ) ( not ( = ?auto_1635217 ?auto_1635222 ) ) ( not ( = ?auto_1635217 ?auto_1635223 ) ) ( not ( = ?auto_1635218 ?auto_1635219 ) ) ( not ( = ?auto_1635218 ?auto_1635220 ) ) ( not ( = ?auto_1635218 ?auto_1635221 ) ) ( not ( = ?auto_1635218 ?auto_1635222 ) ) ( not ( = ?auto_1635218 ?auto_1635223 ) ) ( not ( = ?auto_1635219 ?auto_1635220 ) ) ( not ( = ?auto_1635219 ?auto_1635221 ) ) ( not ( = ?auto_1635219 ?auto_1635222 ) ) ( not ( = ?auto_1635219 ?auto_1635223 ) ) ( not ( = ?auto_1635220 ?auto_1635221 ) ) ( not ( = ?auto_1635220 ?auto_1635222 ) ) ( not ( = ?auto_1635220 ?auto_1635223 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635221 ?auto_1635222 ?auto_1635223 )
      ( MAKE-12CRATE-VERIFY ?auto_1635211 ?auto_1635212 ?auto_1635213 ?auto_1635214 ?auto_1635215 ?auto_1635216 ?auto_1635217 ?auto_1635218 ?auto_1635219 ?auto_1635220 ?auto_1635221 ?auto_1635222 ?auto_1635223 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635373 - SURFACE
      ?auto_1635374 - SURFACE
      ?auto_1635375 - SURFACE
      ?auto_1635376 - SURFACE
      ?auto_1635377 - SURFACE
      ?auto_1635378 - SURFACE
      ?auto_1635379 - SURFACE
      ?auto_1635380 - SURFACE
      ?auto_1635381 - SURFACE
      ?auto_1635382 - SURFACE
      ?auto_1635383 - SURFACE
      ?auto_1635384 - SURFACE
      ?auto_1635385 - SURFACE
    )
    :vars
    (
      ?auto_1635386 - HOIST
      ?auto_1635390 - PLACE
      ?auto_1635387 - TRUCK
      ?auto_1635388 - PLACE
      ?auto_1635391 - HOIST
      ?auto_1635389 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635386 ?auto_1635390 ) ( SURFACE-AT ?auto_1635384 ?auto_1635390 ) ( CLEAR ?auto_1635384 ) ( IS-CRATE ?auto_1635385 ) ( not ( = ?auto_1635384 ?auto_1635385 ) ) ( AVAILABLE ?auto_1635386 ) ( ON ?auto_1635384 ?auto_1635383 ) ( not ( = ?auto_1635383 ?auto_1635384 ) ) ( not ( = ?auto_1635383 ?auto_1635385 ) ) ( TRUCK-AT ?auto_1635387 ?auto_1635388 ) ( not ( = ?auto_1635388 ?auto_1635390 ) ) ( HOIST-AT ?auto_1635391 ?auto_1635388 ) ( not ( = ?auto_1635386 ?auto_1635391 ) ) ( AVAILABLE ?auto_1635391 ) ( SURFACE-AT ?auto_1635385 ?auto_1635388 ) ( ON ?auto_1635385 ?auto_1635389 ) ( CLEAR ?auto_1635385 ) ( not ( = ?auto_1635384 ?auto_1635389 ) ) ( not ( = ?auto_1635385 ?auto_1635389 ) ) ( not ( = ?auto_1635383 ?auto_1635389 ) ) ( ON ?auto_1635374 ?auto_1635373 ) ( ON ?auto_1635375 ?auto_1635374 ) ( ON ?auto_1635376 ?auto_1635375 ) ( ON ?auto_1635377 ?auto_1635376 ) ( ON ?auto_1635378 ?auto_1635377 ) ( ON ?auto_1635379 ?auto_1635378 ) ( ON ?auto_1635380 ?auto_1635379 ) ( ON ?auto_1635381 ?auto_1635380 ) ( ON ?auto_1635382 ?auto_1635381 ) ( ON ?auto_1635383 ?auto_1635382 ) ( not ( = ?auto_1635373 ?auto_1635374 ) ) ( not ( = ?auto_1635373 ?auto_1635375 ) ) ( not ( = ?auto_1635373 ?auto_1635376 ) ) ( not ( = ?auto_1635373 ?auto_1635377 ) ) ( not ( = ?auto_1635373 ?auto_1635378 ) ) ( not ( = ?auto_1635373 ?auto_1635379 ) ) ( not ( = ?auto_1635373 ?auto_1635380 ) ) ( not ( = ?auto_1635373 ?auto_1635381 ) ) ( not ( = ?auto_1635373 ?auto_1635382 ) ) ( not ( = ?auto_1635373 ?auto_1635383 ) ) ( not ( = ?auto_1635373 ?auto_1635384 ) ) ( not ( = ?auto_1635373 ?auto_1635385 ) ) ( not ( = ?auto_1635373 ?auto_1635389 ) ) ( not ( = ?auto_1635374 ?auto_1635375 ) ) ( not ( = ?auto_1635374 ?auto_1635376 ) ) ( not ( = ?auto_1635374 ?auto_1635377 ) ) ( not ( = ?auto_1635374 ?auto_1635378 ) ) ( not ( = ?auto_1635374 ?auto_1635379 ) ) ( not ( = ?auto_1635374 ?auto_1635380 ) ) ( not ( = ?auto_1635374 ?auto_1635381 ) ) ( not ( = ?auto_1635374 ?auto_1635382 ) ) ( not ( = ?auto_1635374 ?auto_1635383 ) ) ( not ( = ?auto_1635374 ?auto_1635384 ) ) ( not ( = ?auto_1635374 ?auto_1635385 ) ) ( not ( = ?auto_1635374 ?auto_1635389 ) ) ( not ( = ?auto_1635375 ?auto_1635376 ) ) ( not ( = ?auto_1635375 ?auto_1635377 ) ) ( not ( = ?auto_1635375 ?auto_1635378 ) ) ( not ( = ?auto_1635375 ?auto_1635379 ) ) ( not ( = ?auto_1635375 ?auto_1635380 ) ) ( not ( = ?auto_1635375 ?auto_1635381 ) ) ( not ( = ?auto_1635375 ?auto_1635382 ) ) ( not ( = ?auto_1635375 ?auto_1635383 ) ) ( not ( = ?auto_1635375 ?auto_1635384 ) ) ( not ( = ?auto_1635375 ?auto_1635385 ) ) ( not ( = ?auto_1635375 ?auto_1635389 ) ) ( not ( = ?auto_1635376 ?auto_1635377 ) ) ( not ( = ?auto_1635376 ?auto_1635378 ) ) ( not ( = ?auto_1635376 ?auto_1635379 ) ) ( not ( = ?auto_1635376 ?auto_1635380 ) ) ( not ( = ?auto_1635376 ?auto_1635381 ) ) ( not ( = ?auto_1635376 ?auto_1635382 ) ) ( not ( = ?auto_1635376 ?auto_1635383 ) ) ( not ( = ?auto_1635376 ?auto_1635384 ) ) ( not ( = ?auto_1635376 ?auto_1635385 ) ) ( not ( = ?auto_1635376 ?auto_1635389 ) ) ( not ( = ?auto_1635377 ?auto_1635378 ) ) ( not ( = ?auto_1635377 ?auto_1635379 ) ) ( not ( = ?auto_1635377 ?auto_1635380 ) ) ( not ( = ?auto_1635377 ?auto_1635381 ) ) ( not ( = ?auto_1635377 ?auto_1635382 ) ) ( not ( = ?auto_1635377 ?auto_1635383 ) ) ( not ( = ?auto_1635377 ?auto_1635384 ) ) ( not ( = ?auto_1635377 ?auto_1635385 ) ) ( not ( = ?auto_1635377 ?auto_1635389 ) ) ( not ( = ?auto_1635378 ?auto_1635379 ) ) ( not ( = ?auto_1635378 ?auto_1635380 ) ) ( not ( = ?auto_1635378 ?auto_1635381 ) ) ( not ( = ?auto_1635378 ?auto_1635382 ) ) ( not ( = ?auto_1635378 ?auto_1635383 ) ) ( not ( = ?auto_1635378 ?auto_1635384 ) ) ( not ( = ?auto_1635378 ?auto_1635385 ) ) ( not ( = ?auto_1635378 ?auto_1635389 ) ) ( not ( = ?auto_1635379 ?auto_1635380 ) ) ( not ( = ?auto_1635379 ?auto_1635381 ) ) ( not ( = ?auto_1635379 ?auto_1635382 ) ) ( not ( = ?auto_1635379 ?auto_1635383 ) ) ( not ( = ?auto_1635379 ?auto_1635384 ) ) ( not ( = ?auto_1635379 ?auto_1635385 ) ) ( not ( = ?auto_1635379 ?auto_1635389 ) ) ( not ( = ?auto_1635380 ?auto_1635381 ) ) ( not ( = ?auto_1635380 ?auto_1635382 ) ) ( not ( = ?auto_1635380 ?auto_1635383 ) ) ( not ( = ?auto_1635380 ?auto_1635384 ) ) ( not ( = ?auto_1635380 ?auto_1635385 ) ) ( not ( = ?auto_1635380 ?auto_1635389 ) ) ( not ( = ?auto_1635381 ?auto_1635382 ) ) ( not ( = ?auto_1635381 ?auto_1635383 ) ) ( not ( = ?auto_1635381 ?auto_1635384 ) ) ( not ( = ?auto_1635381 ?auto_1635385 ) ) ( not ( = ?auto_1635381 ?auto_1635389 ) ) ( not ( = ?auto_1635382 ?auto_1635383 ) ) ( not ( = ?auto_1635382 ?auto_1635384 ) ) ( not ( = ?auto_1635382 ?auto_1635385 ) ) ( not ( = ?auto_1635382 ?auto_1635389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635383 ?auto_1635384 ?auto_1635385 )
      ( MAKE-12CRATE-VERIFY ?auto_1635373 ?auto_1635374 ?auto_1635375 ?auto_1635376 ?auto_1635377 ?auto_1635378 ?auto_1635379 ?auto_1635380 ?auto_1635381 ?auto_1635382 ?auto_1635383 ?auto_1635384 ?auto_1635385 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635536 - SURFACE
      ?auto_1635537 - SURFACE
      ?auto_1635538 - SURFACE
      ?auto_1635539 - SURFACE
      ?auto_1635540 - SURFACE
      ?auto_1635541 - SURFACE
      ?auto_1635542 - SURFACE
      ?auto_1635543 - SURFACE
      ?auto_1635544 - SURFACE
      ?auto_1635545 - SURFACE
      ?auto_1635546 - SURFACE
      ?auto_1635547 - SURFACE
      ?auto_1635548 - SURFACE
    )
    :vars
    (
      ?auto_1635549 - HOIST
      ?auto_1635553 - PLACE
      ?auto_1635551 - PLACE
      ?auto_1635552 - HOIST
      ?auto_1635550 - SURFACE
      ?auto_1635554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635549 ?auto_1635553 ) ( SURFACE-AT ?auto_1635547 ?auto_1635553 ) ( CLEAR ?auto_1635547 ) ( IS-CRATE ?auto_1635548 ) ( not ( = ?auto_1635547 ?auto_1635548 ) ) ( AVAILABLE ?auto_1635549 ) ( ON ?auto_1635547 ?auto_1635546 ) ( not ( = ?auto_1635546 ?auto_1635547 ) ) ( not ( = ?auto_1635546 ?auto_1635548 ) ) ( not ( = ?auto_1635551 ?auto_1635553 ) ) ( HOIST-AT ?auto_1635552 ?auto_1635551 ) ( not ( = ?auto_1635549 ?auto_1635552 ) ) ( AVAILABLE ?auto_1635552 ) ( SURFACE-AT ?auto_1635548 ?auto_1635551 ) ( ON ?auto_1635548 ?auto_1635550 ) ( CLEAR ?auto_1635548 ) ( not ( = ?auto_1635547 ?auto_1635550 ) ) ( not ( = ?auto_1635548 ?auto_1635550 ) ) ( not ( = ?auto_1635546 ?auto_1635550 ) ) ( TRUCK-AT ?auto_1635554 ?auto_1635553 ) ( ON ?auto_1635537 ?auto_1635536 ) ( ON ?auto_1635538 ?auto_1635537 ) ( ON ?auto_1635539 ?auto_1635538 ) ( ON ?auto_1635540 ?auto_1635539 ) ( ON ?auto_1635541 ?auto_1635540 ) ( ON ?auto_1635542 ?auto_1635541 ) ( ON ?auto_1635543 ?auto_1635542 ) ( ON ?auto_1635544 ?auto_1635543 ) ( ON ?auto_1635545 ?auto_1635544 ) ( ON ?auto_1635546 ?auto_1635545 ) ( not ( = ?auto_1635536 ?auto_1635537 ) ) ( not ( = ?auto_1635536 ?auto_1635538 ) ) ( not ( = ?auto_1635536 ?auto_1635539 ) ) ( not ( = ?auto_1635536 ?auto_1635540 ) ) ( not ( = ?auto_1635536 ?auto_1635541 ) ) ( not ( = ?auto_1635536 ?auto_1635542 ) ) ( not ( = ?auto_1635536 ?auto_1635543 ) ) ( not ( = ?auto_1635536 ?auto_1635544 ) ) ( not ( = ?auto_1635536 ?auto_1635545 ) ) ( not ( = ?auto_1635536 ?auto_1635546 ) ) ( not ( = ?auto_1635536 ?auto_1635547 ) ) ( not ( = ?auto_1635536 ?auto_1635548 ) ) ( not ( = ?auto_1635536 ?auto_1635550 ) ) ( not ( = ?auto_1635537 ?auto_1635538 ) ) ( not ( = ?auto_1635537 ?auto_1635539 ) ) ( not ( = ?auto_1635537 ?auto_1635540 ) ) ( not ( = ?auto_1635537 ?auto_1635541 ) ) ( not ( = ?auto_1635537 ?auto_1635542 ) ) ( not ( = ?auto_1635537 ?auto_1635543 ) ) ( not ( = ?auto_1635537 ?auto_1635544 ) ) ( not ( = ?auto_1635537 ?auto_1635545 ) ) ( not ( = ?auto_1635537 ?auto_1635546 ) ) ( not ( = ?auto_1635537 ?auto_1635547 ) ) ( not ( = ?auto_1635537 ?auto_1635548 ) ) ( not ( = ?auto_1635537 ?auto_1635550 ) ) ( not ( = ?auto_1635538 ?auto_1635539 ) ) ( not ( = ?auto_1635538 ?auto_1635540 ) ) ( not ( = ?auto_1635538 ?auto_1635541 ) ) ( not ( = ?auto_1635538 ?auto_1635542 ) ) ( not ( = ?auto_1635538 ?auto_1635543 ) ) ( not ( = ?auto_1635538 ?auto_1635544 ) ) ( not ( = ?auto_1635538 ?auto_1635545 ) ) ( not ( = ?auto_1635538 ?auto_1635546 ) ) ( not ( = ?auto_1635538 ?auto_1635547 ) ) ( not ( = ?auto_1635538 ?auto_1635548 ) ) ( not ( = ?auto_1635538 ?auto_1635550 ) ) ( not ( = ?auto_1635539 ?auto_1635540 ) ) ( not ( = ?auto_1635539 ?auto_1635541 ) ) ( not ( = ?auto_1635539 ?auto_1635542 ) ) ( not ( = ?auto_1635539 ?auto_1635543 ) ) ( not ( = ?auto_1635539 ?auto_1635544 ) ) ( not ( = ?auto_1635539 ?auto_1635545 ) ) ( not ( = ?auto_1635539 ?auto_1635546 ) ) ( not ( = ?auto_1635539 ?auto_1635547 ) ) ( not ( = ?auto_1635539 ?auto_1635548 ) ) ( not ( = ?auto_1635539 ?auto_1635550 ) ) ( not ( = ?auto_1635540 ?auto_1635541 ) ) ( not ( = ?auto_1635540 ?auto_1635542 ) ) ( not ( = ?auto_1635540 ?auto_1635543 ) ) ( not ( = ?auto_1635540 ?auto_1635544 ) ) ( not ( = ?auto_1635540 ?auto_1635545 ) ) ( not ( = ?auto_1635540 ?auto_1635546 ) ) ( not ( = ?auto_1635540 ?auto_1635547 ) ) ( not ( = ?auto_1635540 ?auto_1635548 ) ) ( not ( = ?auto_1635540 ?auto_1635550 ) ) ( not ( = ?auto_1635541 ?auto_1635542 ) ) ( not ( = ?auto_1635541 ?auto_1635543 ) ) ( not ( = ?auto_1635541 ?auto_1635544 ) ) ( not ( = ?auto_1635541 ?auto_1635545 ) ) ( not ( = ?auto_1635541 ?auto_1635546 ) ) ( not ( = ?auto_1635541 ?auto_1635547 ) ) ( not ( = ?auto_1635541 ?auto_1635548 ) ) ( not ( = ?auto_1635541 ?auto_1635550 ) ) ( not ( = ?auto_1635542 ?auto_1635543 ) ) ( not ( = ?auto_1635542 ?auto_1635544 ) ) ( not ( = ?auto_1635542 ?auto_1635545 ) ) ( not ( = ?auto_1635542 ?auto_1635546 ) ) ( not ( = ?auto_1635542 ?auto_1635547 ) ) ( not ( = ?auto_1635542 ?auto_1635548 ) ) ( not ( = ?auto_1635542 ?auto_1635550 ) ) ( not ( = ?auto_1635543 ?auto_1635544 ) ) ( not ( = ?auto_1635543 ?auto_1635545 ) ) ( not ( = ?auto_1635543 ?auto_1635546 ) ) ( not ( = ?auto_1635543 ?auto_1635547 ) ) ( not ( = ?auto_1635543 ?auto_1635548 ) ) ( not ( = ?auto_1635543 ?auto_1635550 ) ) ( not ( = ?auto_1635544 ?auto_1635545 ) ) ( not ( = ?auto_1635544 ?auto_1635546 ) ) ( not ( = ?auto_1635544 ?auto_1635547 ) ) ( not ( = ?auto_1635544 ?auto_1635548 ) ) ( not ( = ?auto_1635544 ?auto_1635550 ) ) ( not ( = ?auto_1635545 ?auto_1635546 ) ) ( not ( = ?auto_1635545 ?auto_1635547 ) ) ( not ( = ?auto_1635545 ?auto_1635548 ) ) ( not ( = ?auto_1635545 ?auto_1635550 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635546 ?auto_1635547 ?auto_1635548 )
      ( MAKE-12CRATE-VERIFY ?auto_1635536 ?auto_1635537 ?auto_1635538 ?auto_1635539 ?auto_1635540 ?auto_1635541 ?auto_1635542 ?auto_1635543 ?auto_1635544 ?auto_1635545 ?auto_1635546 ?auto_1635547 ?auto_1635548 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635699 - SURFACE
      ?auto_1635700 - SURFACE
      ?auto_1635701 - SURFACE
      ?auto_1635702 - SURFACE
      ?auto_1635703 - SURFACE
      ?auto_1635704 - SURFACE
      ?auto_1635705 - SURFACE
      ?auto_1635706 - SURFACE
      ?auto_1635707 - SURFACE
      ?auto_1635708 - SURFACE
      ?auto_1635709 - SURFACE
      ?auto_1635710 - SURFACE
      ?auto_1635711 - SURFACE
    )
    :vars
    (
      ?auto_1635712 - HOIST
      ?auto_1635715 - PLACE
      ?auto_1635717 - PLACE
      ?auto_1635716 - HOIST
      ?auto_1635714 - SURFACE
      ?auto_1635713 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635712 ?auto_1635715 ) ( IS-CRATE ?auto_1635711 ) ( not ( = ?auto_1635710 ?auto_1635711 ) ) ( not ( = ?auto_1635709 ?auto_1635710 ) ) ( not ( = ?auto_1635709 ?auto_1635711 ) ) ( not ( = ?auto_1635717 ?auto_1635715 ) ) ( HOIST-AT ?auto_1635716 ?auto_1635717 ) ( not ( = ?auto_1635712 ?auto_1635716 ) ) ( AVAILABLE ?auto_1635716 ) ( SURFACE-AT ?auto_1635711 ?auto_1635717 ) ( ON ?auto_1635711 ?auto_1635714 ) ( CLEAR ?auto_1635711 ) ( not ( = ?auto_1635710 ?auto_1635714 ) ) ( not ( = ?auto_1635711 ?auto_1635714 ) ) ( not ( = ?auto_1635709 ?auto_1635714 ) ) ( TRUCK-AT ?auto_1635713 ?auto_1635715 ) ( SURFACE-AT ?auto_1635709 ?auto_1635715 ) ( CLEAR ?auto_1635709 ) ( LIFTING ?auto_1635712 ?auto_1635710 ) ( IS-CRATE ?auto_1635710 ) ( ON ?auto_1635700 ?auto_1635699 ) ( ON ?auto_1635701 ?auto_1635700 ) ( ON ?auto_1635702 ?auto_1635701 ) ( ON ?auto_1635703 ?auto_1635702 ) ( ON ?auto_1635704 ?auto_1635703 ) ( ON ?auto_1635705 ?auto_1635704 ) ( ON ?auto_1635706 ?auto_1635705 ) ( ON ?auto_1635707 ?auto_1635706 ) ( ON ?auto_1635708 ?auto_1635707 ) ( ON ?auto_1635709 ?auto_1635708 ) ( not ( = ?auto_1635699 ?auto_1635700 ) ) ( not ( = ?auto_1635699 ?auto_1635701 ) ) ( not ( = ?auto_1635699 ?auto_1635702 ) ) ( not ( = ?auto_1635699 ?auto_1635703 ) ) ( not ( = ?auto_1635699 ?auto_1635704 ) ) ( not ( = ?auto_1635699 ?auto_1635705 ) ) ( not ( = ?auto_1635699 ?auto_1635706 ) ) ( not ( = ?auto_1635699 ?auto_1635707 ) ) ( not ( = ?auto_1635699 ?auto_1635708 ) ) ( not ( = ?auto_1635699 ?auto_1635709 ) ) ( not ( = ?auto_1635699 ?auto_1635710 ) ) ( not ( = ?auto_1635699 ?auto_1635711 ) ) ( not ( = ?auto_1635699 ?auto_1635714 ) ) ( not ( = ?auto_1635700 ?auto_1635701 ) ) ( not ( = ?auto_1635700 ?auto_1635702 ) ) ( not ( = ?auto_1635700 ?auto_1635703 ) ) ( not ( = ?auto_1635700 ?auto_1635704 ) ) ( not ( = ?auto_1635700 ?auto_1635705 ) ) ( not ( = ?auto_1635700 ?auto_1635706 ) ) ( not ( = ?auto_1635700 ?auto_1635707 ) ) ( not ( = ?auto_1635700 ?auto_1635708 ) ) ( not ( = ?auto_1635700 ?auto_1635709 ) ) ( not ( = ?auto_1635700 ?auto_1635710 ) ) ( not ( = ?auto_1635700 ?auto_1635711 ) ) ( not ( = ?auto_1635700 ?auto_1635714 ) ) ( not ( = ?auto_1635701 ?auto_1635702 ) ) ( not ( = ?auto_1635701 ?auto_1635703 ) ) ( not ( = ?auto_1635701 ?auto_1635704 ) ) ( not ( = ?auto_1635701 ?auto_1635705 ) ) ( not ( = ?auto_1635701 ?auto_1635706 ) ) ( not ( = ?auto_1635701 ?auto_1635707 ) ) ( not ( = ?auto_1635701 ?auto_1635708 ) ) ( not ( = ?auto_1635701 ?auto_1635709 ) ) ( not ( = ?auto_1635701 ?auto_1635710 ) ) ( not ( = ?auto_1635701 ?auto_1635711 ) ) ( not ( = ?auto_1635701 ?auto_1635714 ) ) ( not ( = ?auto_1635702 ?auto_1635703 ) ) ( not ( = ?auto_1635702 ?auto_1635704 ) ) ( not ( = ?auto_1635702 ?auto_1635705 ) ) ( not ( = ?auto_1635702 ?auto_1635706 ) ) ( not ( = ?auto_1635702 ?auto_1635707 ) ) ( not ( = ?auto_1635702 ?auto_1635708 ) ) ( not ( = ?auto_1635702 ?auto_1635709 ) ) ( not ( = ?auto_1635702 ?auto_1635710 ) ) ( not ( = ?auto_1635702 ?auto_1635711 ) ) ( not ( = ?auto_1635702 ?auto_1635714 ) ) ( not ( = ?auto_1635703 ?auto_1635704 ) ) ( not ( = ?auto_1635703 ?auto_1635705 ) ) ( not ( = ?auto_1635703 ?auto_1635706 ) ) ( not ( = ?auto_1635703 ?auto_1635707 ) ) ( not ( = ?auto_1635703 ?auto_1635708 ) ) ( not ( = ?auto_1635703 ?auto_1635709 ) ) ( not ( = ?auto_1635703 ?auto_1635710 ) ) ( not ( = ?auto_1635703 ?auto_1635711 ) ) ( not ( = ?auto_1635703 ?auto_1635714 ) ) ( not ( = ?auto_1635704 ?auto_1635705 ) ) ( not ( = ?auto_1635704 ?auto_1635706 ) ) ( not ( = ?auto_1635704 ?auto_1635707 ) ) ( not ( = ?auto_1635704 ?auto_1635708 ) ) ( not ( = ?auto_1635704 ?auto_1635709 ) ) ( not ( = ?auto_1635704 ?auto_1635710 ) ) ( not ( = ?auto_1635704 ?auto_1635711 ) ) ( not ( = ?auto_1635704 ?auto_1635714 ) ) ( not ( = ?auto_1635705 ?auto_1635706 ) ) ( not ( = ?auto_1635705 ?auto_1635707 ) ) ( not ( = ?auto_1635705 ?auto_1635708 ) ) ( not ( = ?auto_1635705 ?auto_1635709 ) ) ( not ( = ?auto_1635705 ?auto_1635710 ) ) ( not ( = ?auto_1635705 ?auto_1635711 ) ) ( not ( = ?auto_1635705 ?auto_1635714 ) ) ( not ( = ?auto_1635706 ?auto_1635707 ) ) ( not ( = ?auto_1635706 ?auto_1635708 ) ) ( not ( = ?auto_1635706 ?auto_1635709 ) ) ( not ( = ?auto_1635706 ?auto_1635710 ) ) ( not ( = ?auto_1635706 ?auto_1635711 ) ) ( not ( = ?auto_1635706 ?auto_1635714 ) ) ( not ( = ?auto_1635707 ?auto_1635708 ) ) ( not ( = ?auto_1635707 ?auto_1635709 ) ) ( not ( = ?auto_1635707 ?auto_1635710 ) ) ( not ( = ?auto_1635707 ?auto_1635711 ) ) ( not ( = ?auto_1635707 ?auto_1635714 ) ) ( not ( = ?auto_1635708 ?auto_1635709 ) ) ( not ( = ?auto_1635708 ?auto_1635710 ) ) ( not ( = ?auto_1635708 ?auto_1635711 ) ) ( not ( = ?auto_1635708 ?auto_1635714 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635709 ?auto_1635710 ?auto_1635711 )
      ( MAKE-12CRATE-VERIFY ?auto_1635699 ?auto_1635700 ?auto_1635701 ?auto_1635702 ?auto_1635703 ?auto_1635704 ?auto_1635705 ?auto_1635706 ?auto_1635707 ?auto_1635708 ?auto_1635709 ?auto_1635710 ?auto_1635711 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1635862 - SURFACE
      ?auto_1635863 - SURFACE
      ?auto_1635864 - SURFACE
      ?auto_1635865 - SURFACE
      ?auto_1635866 - SURFACE
      ?auto_1635867 - SURFACE
      ?auto_1635868 - SURFACE
      ?auto_1635869 - SURFACE
      ?auto_1635870 - SURFACE
      ?auto_1635871 - SURFACE
      ?auto_1635872 - SURFACE
      ?auto_1635873 - SURFACE
      ?auto_1635874 - SURFACE
    )
    :vars
    (
      ?auto_1635878 - HOIST
      ?auto_1635875 - PLACE
      ?auto_1635876 - PLACE
      ?auto_1635877 - HOIST
      ?auto_1635879 - SURFACE
      ?auto_1635880 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1635878 ?auto_1635875 ) ( IS-CRATE ?auto_1635874 ) ( not ( = ?auto_1635873 ?auto_1635874 ) ) ( not ( = ?auto_1635872 ?auto_1635873 ) ) ( not ( = ?auto_1635872 ?auto_1635874 ) ) ( not ( = ?auto_1635876 ?auto_1635875 ) ) ( HOIST-AT ?auto_1635877 ?auto_1635876 ) ( not ( = ?auto_1635878 ?auto_1635877 ) ) ( AVAILABLE ?auto_1635877 ) ( SURFACE-AT ?auto_1635874 ?auto_1635876 ) ( ON ?auto_1635874 ?auto_1635879 ) ( CLEAR ?auto_1635874 ) ( not ( = ?auto_1635873 ?auto_1635879 ) ) ( not ( = ?auto_1635874 ?auto_1635879 ) ) ( not ( = ?auto_1635872 ?auto_1635879 ) ) ( TRUCK-AT ?auto_1635880 ?auto_1635875 ) ( SURFACE-AT ?auto_1635872 ?auto_1635875 ) ( CLEAR ?auto_1635872 ) ( IS-CRATE ?auto_1635873 ) ( AVAILABLE ?auto_1635878 ) ( IN ?auto_1635873 ?auto_1635880 ) ( ON ?auto_1635863 ?auto_1635862 ) ( ON ?auto_1635864 ?auto_1635863 ) ( ON ?auto_1635865 ?auto_1635864 ) ( ON ?auto_1635866 ?auto_1635865 ) ( ON ?auto_1635867 ?auto_1635866 ) ( ON ?auto_1635868 ?auto_1635867 ) ( ON ?auto_1635869 ?auto_1635868 ) ( ON ?auto_1635870 ?auto_1635869 ) ( ON ?auto_1635871 ?auto_1635870 ) ( ON ?auto_1635872 ?auto_1635871 ) ( not ( = ?auto_1635862 ?auto_1635863 ) ) ( not ( = ?auto_1635862 ?auto_1635864 ) ) ( not ( = ?auto_1635862 ?auto_1635865 ) ) ( not ( = ?auto_1635862 ?auto_1635866 ) ) ( not ( = ?auto_1635862 ?auto_1635867 ) ) ( not ( = ?auto_1635862 ?auto_1635868 ) ) ( not ( = ?auto_1635862 ?auto_1635869 ) ) ( not ( = ?auto_1635862 ?auto_1635870 ) ) ( not ( = ?auto_1635862 ?auto_1635871 ) ) ( not ( = ?auto_1635862 ?auto_1635872 ) ) ( not ( = ?auto_1635862 ?auto_1635873 ) ) ( not ( = ?auto_1635862 ?auto_1635874 ) ) ( not ( = ?auto_1635862 ?auto_1635879 ) ) ( not ( = ?auto_1635863 ?auto_1635864 ) ) ( not ( = ?auto_1635863 ?auto_1635865 ) ) ( not ( = ?auto_1635863 ?auto_1635866 ) ) ( not ( = ?auto_1635863 ?auto_1635867 ) ) ( not ( = ?auto_1635863 ?auto_1635868 ) ) ( not ( = ?auto_1635863 ?auto_1635869 ) ) ( not ( = ?auto_1635863 ?auto_1635870 ) ) ( not ( = ?auto_1635863 ?auto_1635871 ) ) ( not ( = ?auto_1635863 ?auto_1635872 ) ) ( not ( = ?auto_1635863 ?auto_1635873 ) ) ( not ( = ?auto_1635863 ?auto_1635874 ) ) ( not ( = ?auto_1635863 ?auto_1635879 ) ) ( not ( = ?auto_1635864 ?auto_1635865 ) ) ( not ( = ?auto_1635864 ?auto_1635866 ) ) ( not ( = ?auto_1635864 ?auto_1635867 ) ) ( not ( = ?auto_1635864 ?auto_1635868 ) ) ( not ( = ?auto_1635864 ?auto_1635869 ) ) ( not ( = ?auto_1635864 ?auto_1635870 ) ) ( not ( = ?auto_1635864 ?auto_1635871 ) ) ( not ( = ?auto_1635864 ?auto_1635872 ) ) ( not ( = ?auto_1635864 ?auto_1635873 ) ) ( not ( = ?auto_1635864 ?auto_1635874 ) ) ( not ( = ?auto_1635864 ?auto_1635879 ) ) ( not ( = ?auto_1635865 ?auto_1635866 ) ) ( not ( = ?auto_1635865 ?auto_1635867 ) ) ( not ( = ?auto_1635865 ?auto_1635868 ) ) ( not ( = ?auto_1635865 ?auto_1635869 ) ) ( not ( = ?auto_1635865 ?auto_1635870 ) ) ( not ( = ?auto_1635865 ?auto_1635871 ) ) ( not ( = ?auto_1635865 ?auto_1635872 ) ) ( not ( = ?auto_1635865 ?auto_1635873 ) ) ( not ( = ?auto_1635865 ?auto_1635874 ) ) ( not ( = ?auto_1635865 ?auto_1635879 ) ) ( not ( = ?auto_1635866 ?auto_1635867 ) ) ( not ( = ?auto_1635866 ?auto_1635868 ) ) ( not ( = ?auto_1635866 ?auto_1635869 ) ) ( not ( = ?auto_1635866 ?auto_1635870 ) ) ( not ( = ?auto_1635866 ?auto_1635871 ) ) ( not ( = ?auto_1635866 ?auto_1635872 ) ) ( not ( = ?auto_1635866 ?auto_1635873 ) ) ( not ( = ?auto_1635866 ?auto_1635874 ) ) ( not ( = ?auto_1635866 ?auto_1635879 ) ) ( not ( = ?auto_1635867 ?auto_1635868 ) ) ( not ( = ?auto_1635867 ?auto_1635869 ) ) ( not ( = ?auto_1635867 ?auto_1635870 ) ) ( not ( = ?auto_1635867 ?auto_1635871 ) ) ( not ( = ?auto_1635867 ?auto_1635872 ) ) ( not ( = ?auto_1635867 ?auto_1635873 ) ) ( not ( = ?auto_1635867 ?auto_1635874 ) ) ( not ( = ?auto_1635867 ?auto_1635879 ) ) ( not ( = ?auto_1635868 ?auto_1635869 ) ) ( not ( = ?auto_1635868 ?auto_1635870 ) ) ( not ( = ?auto_1635868 ?auto_1635871 ) ) ( not ( = ?auto_1635868 ?auto_1635872 ) ) ( not ( = ?auto_1635868 ?auto_1635873 ) ) ( not ( = ?auto_1635868 ?auto_1635874 ) ) ( not ( = ?auto_1635868 ?auto_1635879 ) ) ( not ( = ?auto_1635869 ?auto_1635870 ) ) ( not ( = ?auto_1635869 ?auto_1635871 ) ) ( not ( = ?auto_1635869 ?auto_1635872 ) ) ( not ( = ?auto_1635869 ?auto_1635873 ) ) ( not ( = ?auto_1635869 ?auto_1635874 ) ) ( not ( = ?auto_1635869 ?auto_1635879 ) ) ( not ( = ?auto_1635870 ?auto_1635871 ) ) ( not ( = ?auto_1635870 ?auto_1635872 ) ) ( not ( = ?auto_1635870 ?auto_1635873 ) ) ( not ( = ?auto_1635870 ?auto_1635874 ) ) ( not ( = ?auto_1635870 ?auto_1635879 ) ) ( not ( = ?auto_1635871 ?auto_1635872 ) ) ( not ( = ?auto_1635871 ?auto_1635873 ) ) ( not ( = ?auto_1635871 ?auto_1635874 ) ) ( not ( = ?auto_1635871 ?auto_1635879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1635872 ?auto_1635873 ?auto_1635874 )
      ( MAKE-12CRATE-VERIFY ?auto_1635862 ?auto_1635863 ?auto_1635864 ?auto_1635865 ?auto_1635866 ?auto_1635867 ?auto_1635868 ?auto_1635869 ?auto_1635870 ?auto_1635871 ?auto_1635872 ?auto_1635873 ?auto_1635874 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647417 - SURFACE
      ?auto_1647418 - SURFACE
      ?auto_1647419 - SURFACE
      ?auto_1647420 - SURFACE
      ?auto_1647421 - SURFACE
      ?auto_1647422 - SURFACE
      ?auto_1647423 - SURFACE
      ?auto_1647424 - SURFACE
      ?auto_1647425 - SURFACE
      ?auto_1647426 - SURFACE
      ?auto_1647427 - SURFACE
      ?auto_1647428 - SURFACE
      ?auto_1647429 - SURFACE
      ?auto_1647430 - SURFACE
    )
    :vars
    (
      ?auto_1647431 - HOIST
      ?auto_1647432 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647431 ?auto_1647432 ) ( SURFACE-AT ?auto_1647429 ?auto_1647432 ) ( CLEAR ?auto_1647429 ) ( LIFTING ?auto_1647431 ?auto_1647430 ) ( IS-CRATE ?auto_1647430 ) ( not ( = ?auto_1647429 ?auto_1647430 ) ) ( ON ?auto_1647418 ?auto_1647417 ) ( ON ?auto_1647419 ?auto_1647418 ) ( ON ?auto_1647420 ?auto_1647419 ) ( ON ?auto_1647421 ?auto_1647420 ) ( ON ?auto_1647422 ?auto_1647421 ) ( ON ?auto_1647423 ?auto_1647422 ) ( ON ?auto_1647424 ?auto_1647423 ) ( ON ?auto_1647425 ?auto_1647424 ) ( ON ?auto_1647426 ?auto_1647425 ) ( ON ?auto_1647427 ?auto_1647426 ) ( ON ?auto_1647428 ?auto_1647427 ) ( ON ?auto_1647429 ?auto_1647428 ) ( not ( = ?auto_1647417 ?auto_1647418 ) ) ( not ( = ?auto_1647417 ?auto_1647419 ) ) ( not ( = ?auto_1647417 ?auto_1647420 ) ) ( not ( = ?auto_1647417 ?auto_1647421 ) ) ( not ( = ?auto_1647417 ?auto_1647422 ) ) ( not ( = ?auto_1647417 ?auto_1647423 ) ) ( not ( = ?auto_1647417 ?auto_1647424 ) ) ( not ( = ?auto_1647417 ?auto_1647425 ) ) ( not ( = ?auto_1647417 ?auto_1647426 ) ) ( not ( = ?auto_1647417 ?auto_1647427 ) ) ( not ( = ?auto_1647417 ?auto_1647428 ) ) ( not ( = ?auto_1647417 ?auto_1647429 ) ) ( not ( = ?auto_1647417 ?auto_1647430 ) ) ( not ( = ?auto_1647418 ?auto_1647419 ) ) ( not ( = ?auto_1647418 ?auto_1647420 ) ) ( not ( = ?auto_1647418 ?auto_1647421 ) ) ( not ( = ?auto_1647418 ?auto_1647422 ) ) ( not ( = ?auto_1647418 ?auto_1647423 ) ) ( not ( = ?auto_1647418 ?auto_1647424 ) ) ( not ( = ?auto_1647418 ?auto_1647425 ) ) ( not ( = ?auto_1647418 ?auto_1647426 ) ) ( not ( = ?auto_1647418 ?auto_1647427 ) ) ( not ( = ?auto_1647418 ?auto_1647428 ) ) ( not ( = ?auto_1647418 ?auto_1647429 ) ) ( not ( = ?auto_1647418 ?auto_1647430 ) ) ( not ( = ?auto_1647419 ?auto_1647420 ) ) ( not ( = ?auto_1647419 ?auto_1647421 ) ) ( not ( = ?auto_1647419 ?auto_1647422 ) ) ( not ( = ?auto_1647419 ?auto_1647423 ) ) ( not ( = ?auto_1647419 ?auto_1647424 ) ) ( not ( = ?auto_1647419 ?auto_1647425 ) ) ( not ( = ?auto_1647419 ?auto_1647426 ) ) ( not ( = ?auto_1647419 ?auto_1647427 ) ) ( not ( = ?auto_1647419 ?auto_1647428 ) ) ( not ( = ?auto_1647419 ?auto_1647429 ) ) ( not ( = ?auto_1647419 ?auto_1647430 ) ) ( not ( = ?auto_1647420 ?auto_1647421 ) ) ( not ( = ?auto_1647420 ?auto_1647422 ) ) ( not ( = ?auto_1647420 ?auto_1647423 ) ) ( not ( = ?auto_1647420 ?auto_1647424 ) ) ( not ( = ?auto_1647420 ?auto_1647425 ) ) ( not ( = ?auto_1647420 ?auto_1647426 ) ) ( not ( = ?auto_1647420 ?auto_1647427 ) ) ( not ( = ?auto_1647420 ?auto_1647428 ) ) ( not ( = ?auto_1647420 ?auto_1647429 ) ) ( not ( = ?auto_1647420 ?auto_1647430 ) ) ( not ( = ?auto_1647421 ?auto_1647422 ) ) ( not ( = ?auto_1647421 ?auto_1647423 ) ) ( not ( = ?auto_1647421 ?auto_1647424 ) ) ( not ( = ?auto_1647421 ?auto_1647425 ) ) ( not ( = ?auto_1647421 ?auto_1647426 ) ) ( not ( = ?auto_1647421 ?auto_1647427 ) ) ( not ( = ?auto_1647421 ?auto_1647428 ) ) ( not ( = ?auto_1647421 ?auto_1647429 ) ) ( not ( = ?auto_1647421 ?auto_1647430 ) ) ( not ( = ?auto_1647422 ?auto_1647423 ) ) ( not ( = ?auto_1647422 ?auto_1647424 ) ) ( not ( = ?auto_1647422 ?auto_1647425 ) ) ( not ( = ?auto_1647422 ?auto_1647426 ) ) ( not ( = ?auto_1647422 ?auto_1647427 ) ) ( not ( = ?auto_1647422 ?auto_1647428 ) ) ( not ( = ?auto_1647422 ?auto_1647429 ) ) ( not ( = ?auto_1647422 ?auto_1647430 ) ) ( not ( = ?auto_1647423 ?auto_1647424 ) ) ( not ( = ?auto_1647423 ?auto_1647425 ) ) ( not ( = ?auto_1647423 ?auto_1647426 ) ) ( not ( = ?auto_1647423 ?auto_1647427 ) ) ( not ( = ?auto_1647423 ?auto_1647428 ) ) ( not ( = ?auto_1647423 ?auto_1647429 ) ) ( not ( = ?auto_1647423 ?auto_1647430 ) ) ( not ( = ?auto_1647424 ?auto_1647425 ) ) ( not ( = ?auto_1647424 ?auto_1647426 ) ) ( not ( = ?auto_1647424 ?auto_1647427 ) ) ( not ( = ?auto_1647424 ?auto_1647428 ) ) ( not ( = ?auto_1647424 ?auto_1647429 ) ) ( not ( = ?auto_1647424 ?auto_1647430 ) ) ( not ( = ?auto_1647425 ?auto_1647426 ) ) ( not ( = ?auto_1647425 ?auto_1647427 ) ) ( not ( = ?auto_1647425 ?auto_1647428 ) ) ( not ( = ?auto_1647425 ?auto_1647429 ) ) ( not ( = ?auto_1647425 ?auto_1647430 ) ) ( not ( = ?auto_1647426 ?auto_1647427 ) ) ( not ( = ?auto_1647426 ?auto_1647428 ) ) ( not ( = ?auto_1647426 ?auto_1647429 ) ) ( not ( = ?auto_1647426 ?auto_1647430 ) ) ( not ( = ?auto_1647427 ?auto_1647428 ) ) ( not ( = ?auto_1647427 ?auto_1647429 ) ) ( not ( = ?auto_1647427 ?auto_1647430 ) ) ( not ( = ?auto_1647428 ?auto_1647429 ) ) ( not ( = ?auto_1647428 ?auto_1647430 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1647429 ?auto_1647430 )
      ( MAKE-13CRATE-VERIFY ?auto_1647417 ?auto_1647418 ?auto_1647419 ?auto_1647420 ?auto_1647421 ?auto_1647422 ?auto_1647423 ?auto_1647424 ?auto_1647425 ?auto_1647426 ?auto_1647427 ?auto_1647428 ?auto_1647429 ?auto_1647430 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647559 - SURFACE
      ?auto_1647560 - SURFACE
      ?auto_1647561 - SURFACE
      ?auto_1647562 - SURFACE
      ?auto_1647563 - SURFACE
      ?auto_1647564 - SURFACE
      ?auto_1647565 - SURFACE
      ?auto_1647566 - SURFACE
      ?auto_1647567 - SURFACE
      ?auto_1647568 - SURFACE
      ?auto_1647569 - SURFACE
      ?auto_1647570 - SURFACE
      ?auto_1647571 - SURFACE
      ?auto_1647572 - SURFACE
    )
    :vars
    (
      ?auto_1647574 - HOIST
      ?auto_1647573 - PLACE
      ?auto_1647575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647574 ?auto_1647573 ) ( SURFACE-AT ?auto_1647571 ?auto_1647573 ) ( CLEAR ?auto_1647571 ) ( IS-CRATE ?auto_1647572 ) ( not ( = ?auto_1647571 ?auto_1647572 ) ) ( TRUCK-AT ?auto_1647575 ?auto_1647573 ) ( AVAILABLE ?auto_1647574 ) ( IN ?auto_1647572 ?auto_1647575 ) ( ON ?auto_1647571 ?auto_1647570 ) ( not ( = ?auto_1647570 ?auto_1647571 ) ) ( not ( = ?auto_1647570 ?auto_1647572 ) ) ( ON ?auto_1647560 ?auto_1647559 ) ( ON ?auto_1647561 ?auto_1647560 ) ( ON ?auto_1647562 ?auto_1647561 ) ( ON ?auto_1647563 ?auto_1647562 ) ( ON ?auto_1647564 ?auto_1647563 ) ( ON ?auto_1647565 ?auto_1647564 ) ( ON ?auto_1647566 ?auto_1647565 ) ( ON ?auto_1647567 ?auto_1647566 ) ( ON ?auto_1647568 ?auto_1647567 ) ( ON ?auto_1647569 ?auto_1647568 ) ( ON ?auto_1647570 ?auto_1647569 ) ( not ( = ?auto_1647559 ?auto_1647560 ) ) ( not ( = ?auto_1647559 ?auto_1647561 ) ) ( not ( = ?auto_1647559 ?auto_1647562 ) ) ( not ( = ?auto_1647559 ?auto_1647563 ) ) ( not ( = ?auto_1647559 ?auto_1647564 ) ) ( not ( = ?auto_1647559 ?auto_1647565 ) ) ( not ( = ?auto_1647559 ?auto_1647566 ) ) ( not ( = ?auto_1647559 ?auto_1647567 ) ) ( not ( = ?auto_1647559 ?auto_1647568 ) ) ( not ( = ?auto_1647559 ?auto_1647569 ) ) ( not ( = ?auto_1647559 ?auto_1647570 ) ) ( not ( = ?auto_1647559 ?auto_1647571 ) ) ( not ( = ?auto_1647559 ?auto_1647572 ) ) ( not ( = ?auto_1647560 ?auto_1647561 ) ) ( not ( = ?auto_1647560 ?auto_1647562 ) ) ( not ( = ?auto_1647560 ?auto_1647563 ) ) ( not ( = ?auto_1647560 ?auto_1647564 ) ) ( not ( = ?auto_1647560 ?auto_1647565 ) ) ( not ( = ?auto_1647560 ?auto_1647566 ) ) ( not ( = ?auto_1647560 ?auto_1647567 ) ) ( not ( = ?auto_1647560 ?auto_1647568 ) ) ( not ( = ?auto_1647560 ?auto_1647569 ) ) ( not ( = ?auto_1647560 ?auto_1647570 ) ) ( not ( = ?auto_1647560 ?auto_1647571 ) ) ( not ( = ?auto_1647560 ?auto_1647572 ) ) ( not ( = ?auto_1647561 ?auto_1647562 ) ) ( not ( = ?auto_1647561 ?auto_1647563 ) ) ( not ( = ?auto_1647561 ?auto_1647564 ) ) ( not ( = ?auto_1647561 ?auto_1647565 ) ) ( not ( = ?auto_1647561 ?auto_1647566 ) ) ( not ( = ?auto_1647561 ?auto_1647567 ) ) ( not ( = ?auto_1647561 ?auto_1647568 ) ) ( not ( = ?auto_1647561 ?auto_1647569 ) ) ( not ( = ?auto_1647561 ?auto_1647570 ) ) ( not ( = ?auto_1647561 ?auto_1647571 ) ) ( not ( = ?auto_1647561 ?auto_1647572 ) ) ( not ( = ?auto_1647562 ?auto_1647563 ) ) ( not ( = ?auto_1647562 ?auto_1647564 ) ) ( not ( = ?auto_1647562 ?auto_1647565 ) ) ( not ( = ?auto_1647562 ?auto_1647566 ) ) ( not ( = ?auto_1647562 ?auto_1647567 ) ) ( not ( = ?auto_1647562 ?auto_1647568 ) ) ( not ( = ?auto_1647562 ?auto_1647569 ) ) ( not ( = ?auto_1647562 ?auto_1647570 ) ) ( not ( = ?auto_1647562 ?auto_1647571 ) ) ( not ( = ?auto_1647562 ?auto_1647572 ) ) ( not ( = ?auto_1647563 ?auto_1647564 ) ) ( not ( = ?auto_1647563 ?auto_1647565 ) ) ( not ( = ?auto_1647563 ?auto_1647566 ) ) ( not ( = ?auto_1647563 ?auto_1647567 ) ) ( not ( = ?auto_1647563 ?auto_1647568 ) ) ( not ( = ?auto_1647563 ?auto_1647569 ) ) ( not ( = ?auto_1647563 ?auto_1647570 ) ) ( not ( = ?auto_1647563 ?auto_1647571 ) ) ( not ( = ?auto_1647563 ?auto_1647572 ) ) ( not ( = ?auto_1647564 ?auto_1647565 ) ) ( not ( = ?auto_1647564 ?auto_1647566 ) ) ( not ( = ?auto_1647564 ?auto_1647567 ) ) ( not ( = ?auto_1647564 ?auto_1647568 ) ) ( not ( = ?auto_1647564 ?auto_1647569 ) ) ( not ( = ?auto_1647564 ?auto_1647570 ) ) ( not ( = ?auto_1647564 ?auto_1647571 ) ) ( not ( = ?auto_1647564 ?auto_1647572 ) ) ( not ( = ?auto_1647565 ?auto_1647566 ) ) ( not ( = ?auto_1647565 ?auto_1647567 ) ) ( not ( = ?auto_1647565 ?auto_1647568 ) ) ( not ( = ?auto_1647565 ?auto_1647569 ) ) ( not ( = ?auto_1647565 ?auto_1647570 ) ) ( not ( = ?auto_1647565 ?auto_1647571 ) ) ( not ( = ?auto_1647565 ?auto_1647572 ) ) ( not ( = ?auto_1647566 ?auto_1647567 ) ) ( not ( = ?auto_1647566 ?auto_1647568 ) ) ( not ( = ?auto_1647566 ?auto_1647569 ) ) ( not ( = ?auto_1647566 ?auto_1647570 ) ) ( not ( = ?auto_1647566 ?auto_1647571 ) ) ( not ( = ?auto_1647566 ?auto_1647572 ) ) ( not ( = ?auto_1647567 ?auto_1647568 ) ) ( not ( = ?auto_1647567 ?auto_1647569 ) ) ( not ( = ?auto_1647567 ?auto_1647570 ) ) ( not ( = ?auto_1647567 ?auto_1647571 ) ) ( not ( = ?auto_1647567 ?auto_1647572 ) ) ( not ( = ?auto_1647568 ?auto_1647569 ) ) ( not ( = ?auto_1647568 ?auto_1647570 ) ) ( not ( = ?auto_1647568 ?auto_1647571 ) ) ( not ( = ?auto_1647568 ?auto_1647572 ) ) ( not ( = ?auto_1647569 ?auto_1647570 ) ) ( not ( = ?auto_1647569 ?auto_1647571 ) ) ( not ( = ?auto_1647569 ?auto_1647572 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647570 ?auto_1647571 ?auto_1647572 )
      ( MAKE-13CRATE-VERIFY ?auto_1647559 ?auto_1647560 ?auto_1647561 ?auto_1647562 ?auto_1647563 ?auto_1647564 ?auto_1647565 ?auto_1647566 ?auto_1647567 ?auto_1647568 ?auto_1647569 ?auto_1647570 ?auto_1647571 ?auto_1647572 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647715 - SURFACE
      ?auto_1647716 - SURFACE
      ?auto_1647717 - SURFACE
      ?auto_1647718 - SURFACE
      ?auto_1647719 - SURFACE
      ?auto_1647720 - SURFACE
      ?auto_1647721 - SURFACE
      ?auto_1647722 - SURFACE
      ?auto_1647723 - SURFACE
      ?auto_1647724 - SURFACE
      ?auto_1647725 - SURFACE
      ?auto_1647726 - SURFACE
      ?auto_1647727 - SURFACE
      ?auto_1647728 - SURFACE
    )
    :vars
    (
      ?auto_1647729 - HOIST
      ?auto_1647730 - PLACE
      ?auto_1647731 - TRUCK
      ?auto_1647732 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647729 ?auto_1647730 ) ( SURFACE-AT ?auto_1647727 ?auto_1647730 ) ( CLEAR ?auto_1647727 ) ( IS-CRATE ?auto_1647728 ) ( not ( = ?auto_1647727 ?auto_1647728 ) ) ( AVAILABLE ?auto_1647729 ) ( IN ?auto_1647728 ?auto_1647731 ) ( ON ?auto_1647727 ?auto_1647726 ) ( not ( = ?auto_1647726 ?auto_1647727 ) ) ( not ( = ?auto_1647726 ?auto_1647728 ) ) ( TRUCK-AT ?auto_1647731 ?auto_1647732 ) ( not ( = ?auto_1647732 ?auto_1647730 ) ) ( ON ?auto_1647716 ?auto_1647715 ) ( ON ?auto_1647717 ?auto_1647716 ) ( ON ?auto_1647718 ?auto_1647717 ) ( ON ?auto_1647719 ?auto_1647718 ) ( ON ?auto_1647720 ?auto_1647719 ) ( ON ?auto_1647721 ?auto_1647720 ) ( ON ?auto_1647722 ?auto_1647721 ) ( ON ?auto_1647723 ?auto_1647722 ) ( ON ?auto_1647724 ?auto_1647723 ) ( ON ?auto_1647725 ?auto_1647724 ) ( ON ?auto_1647726 ?auto_1647725 ) ( not ( = ?auto_1647715 ?auto_1647716 ) ) ( not ( = ?auto_1647715 ?auto_1647717 ) ) ( not ( = ?auto_1647715 ?auto_1647718 ) ) ( not ( = ?auto_1647715 ?auto_1647719 ) ) ( not ( = ?auto_1647715 ?auto_1647720 ) ) ( not ( = ?auto_1647715 ?auto_1647721 ) ) ( not ( = ?auto_1647715 ?auto_1647722 ) ) ( not ( = ?auto_1647715 ?auto_1647723 ) ) ( not ( = ?auto_1647715 ?auto_1647724 ) ) ( not ( = ?auto_1647715 ?auto_1647725 ) ) ( not ( = ?auto_1647715 ?auto_1647726 ) ) ( not ( = ?auto_1647715 ?auto_1647727 ) ) ( not ( = ?auto_1647715 ?auto_1647728 ) ) ( not ( = ?auto_1647716 ?auto_1647717 ) ) ( not ( = ?auto_1647716 ?auto_1647718 ) ) ( not ( = ?auto_1647716 ?auto_1647719 ) ) ( not ( = ?auto_1647716 ?auto_1647720 ) ) ( not ( = ?auto_1647716 ?auto_1647721 ) ) ( not ( = ?auto_1647716 ?auto_1647722 ) ) ( not ( = ?auto_1647716 ?auto_1647723 ) ) ( not ( = ?auto_1647716 ?auto_1647724 ) ) ( not ( = ?auto_1647716 ?auto_1647725 ) ) ( not ( = ?auto_1647716 ?auto_1647726 ) ) ( not ( = ?auto_1647716 ?auto_1647727 ) ) ( not ( = ?auto_1647716 ?auto_1647728 ) ) ( not ( = ?auto_1647717 ?auto_1647718 ) ) ( not ( = ?auto_1647717 ?auto_1647719 ) ) ( not ( = ?auto_1647717 ?auto_1647720 ) ) ( not ( = ?auto_1647717 ?auto_1647721 ) ) ( not ( = ?auto_1647717 ?auto_1647722 ) ) ( not ( = ?auto_1647717 ?auto_1647723 ) ) ( not ( = ?auto_1647717 ?auto_1647724 ) ) ( not ( = ?auto_1647717 ?auto_1647725 ) ) ( not ( = ?auto_1647717 ?auto_1647726 ) ) ( not ( = ?auto_1647717 ?auto_1647727 ) ) ( not ( = ?auto_1647717 ?auto_1647728 ) ) ( not ( = ?auto_1647718 ?auto_1647719 ) ) ( not ( = ?auto_1647718 ?auto_1647720 ) ) ( not ( = ?auto_1647718 ?auto_1647721 ) ) ( not ( = ?auto_1647718 ?auto_1647722 ) ) ( not ( = ?auto_1647718 ?auto_1647723 ) ) ( not ( = ?auto_1647718 ?auto_1647724 ) ) ( not ( = ?auto_1647718 ?auto_1647725 ) ) ( not ( = ?auto_1647718 ?auto_1647726 ) ) ( not ( = ?auto_1647718 ?auto_1647727 ) ) ( not ( = ?auto_1647718 ?auto_1647728 ) ) ( not ( = ?auto_1647719 ?auto_1647720 ) ) ( not ( = ?auto_1647719 ?auto_1647721 ) ) ( not ( = ?auto_1647719 ?auto_1647722 ) ) ( not ( = ?auto_1647719 ?auto_1647723 ) ) ( not ( = ?auto_1647719 ?auto_1647724 ) ) ( not ( = ?auto_1647719 ?auto_1647725 ) ) ( not ( = ?auto_1647719 ?auto_1647726 ) ) ( not ( = ?auto_1647719 ?auto_1647727 ) ) ( not ( = ?auto_1647719 ?auto_1647728 ) ) ( not ( = ?auto_1647720 ?auto_1647721 ) ) ( not ( = ?auto_1647720 ?auto_1647722 ) ) ( not ( = ?auto_1647720 ?auto_1647723 ) ) ( not ( = ?auto_1647720 ?auto_1647724 ) ) ( not ( = ?auto_1647720 ?auto_1647725 ) ) ( not ( = ?auto_1647720 ?auto_1647726 ) ) ( not ( = ?auto_1647720 ?auto_1647727 ) ) ( not ( = ?auto_1647720 ?auto_1647728 ) ) ( not ( = ?auto_1647721 ?auto_1647722 ) ) ( not ( = ?auto_1647721 ?auto_1647723 ) ) ( not ( = ?auto_1647721 ?auto_1647724 ) ) ( not ( = ?auto_1647721 ?auto_1647725 ) ) ( not ( = ?auto_1647721 ?auto_1647726 ) ) ( not ( = ?auto_1647721 ?auto_1647727 ) ) ( not ( = ?auto_1647721 ?auto_1647728 ) ) ( not ( = ?auto_1647722 ?auto_1647723 ) ) ( not ( = ?auto_1647722 ?auto_1647724 ) ) ( not ( = ?auto_1647722 ?auto_1647725 ) ) ( not ( = ?auto_1647722 ?auto_1647726 ) ) ( not ( = ?auto_1647722 ?auto_1647727 ) ) ( not ( = ?auto_1647722 ?auto_1647728 ) ) ( not ( = ?auto_1647723 ?auto_1647724 ) ) ( not ( = ?auto_1647723 ?auto_1647725 ) ) ( not ( = ?auto_1647723 ?auto_1647726 ) ) ( not ( = ?auto_1647723 ?auto_1647727 ) ) ( not ( = ?auto_1647723 ?auto_1647728 ) ) ( not ( = ?auto_1647724 ?auto_1647725 ) ) ( not ( = ?auto_1647724 ?auto_1647726 ) ) ( not ( = ?auto_1647724 ?auto_1647727 ) ) ( not ( = ?auto_1647724 ?auto_1647728 ) ) ( not ( = ?auto_1647725 ?auto_1647726 ) ) ( not ( = ?auto_1647725 ?auto_1647727 ) ) ( not ( = ?auto_1647725 ?auto_1647728 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647726 ?auto_1647727 ?auto_1647728 )
      ( MAKE-13CRATE-VERIFY ?auto_1647715 ?auto_1647716 ?auto_1647717 ?auto_1647718 ?auto_1647719 ?auto_1647720 ?auto_1647721 ?auto_1647722 ?auto_1647723 ?auto_1647724 ?auto_1647725 ?auto_1647726 ?auto_1647727 ?auto_1647728 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1647884 - SURFACE
      ?auto_1647885 - SURFACE
      ?auto_1647886 - SURFACE
      ?auto_1647887 - SURFACE
      ?auto_1647888 - SURFACE
      ?auto_1647889 - SURFACE
      ?auto_1647890 - SURFACE
      ?auto_1647891 - SURFACE
      ?auto_1647892 - SURFACE
      ?auto_1647893 - SURFACE
      ?auto_1647894 - SURFACE
      ?auto_1647895 - SURFACE
      ?auto_1647896 - SURFACE
      ?auto_1647897 - SURFACE
    )
    :vars
    (
      ?auto_1647902 - HOIST
      ?auto_1647898 - PLACE
      ?auto_1647899 - TRUCK
      ?auto_1647900 - PLACE
      ?auto_1647901 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1647902 ?auto_1647898 ) ( SURFACE-AT ?auto_1647896 ?auto_1647898 ) ( CLEAR ?auto_1647896 ) ( IS-CRATE ?auto_1647897 ) ( not ( = ?auto_1647896 ?auto_1647897 ) ) ( AVAILABLE ?auto_1647902 ) ( ON ?auto_1647896 ?auto_1647895 ) ( not ( = ?auto_1647895 ?auto_1647896 ) ) ( not ( = ?auto_1647895 ?auto_1647897 ) ) ( TRUCK-AT ?auto_1647899 ?auto_1647900 ) ( not ( = ?auto_1647900 ?auto_1647898 ) ) ( HOIST-AT ?auto_1647901 ?auto_1647900 ) ( LIFTING ?auto_1647901 ?auto_1647897 ) ( not ( = ?auto_1647902 ?auto_1647901 ) ) ( ON ?auto_1647885 ?auto_1647884 ) ( ON ?auto_1647886 ?auto_1647885 ) ( ON ?auto_1647887 ?auto_1647886 ) ( ON ?auto_1647888 ?auto_1647887 ) ( ON ?auto_1647889 ?auto_1647888 ) ( ON ?auto_1647890 ?auto_1647889 ) ( ON ?auto_1647891 ?auto_1647890 ) ( ON ?auto_1647892 ?auto_1647891 ) ( ON ?auto_1647893 ?auto_1647892 ) ( ON ?auto_1647894 ?auto_1647893 ) ( ON ?auto_1647895 ?auto_1647894 ) ( not ( = ?auto_1647884 ?auto_1647885 ) ) ( not ( = ?auto_1647884 ?auto_1647886 ) ) ( not ( = ?auto_1647884 ?auto_1647887 ) ) ( not ( = ?auto_1647884 ?auto_1647888 ) ) ( not ( = ?auto_1647884 ?auto_1647889 ) ) ( not ( = ?auto_1647884 ?auto_1647890 ) ) ( not ( = ?auto_1647884 ?auto_1647891 ) ) ( not ( = ?auto_1647884 ?auto_1647892 ) ) ( not ( = ?auto_1647884 ?auto_1647893 ) ) ( not ( = ?auto_1647884 ?auto_1647894 ) ) ( not ( = ?auto_1647884 ?auto_1647895 ) ) ( not ( = ?auto_1647884 ?auto_1647896 ) ) ( not ( = ?auto_1647884 ?auto_1647897 ) ) ( not ( = ?auto_1647885 ?auto_1647886 ) ) ( not ( = ?auto_1647885 ?auto_1647887 ) ) ( not ( = ?auto_1647885 ?auto_1647888 ) ) ( not ( = ?auto_1647885 ?auto_1647889 ) ) ( not ( = ?auto_1647885 ?auto_1647890 ) ) ( not ( = ?auto_1647885 ?auto_1647891 ) ) ( not ( = ?auto_1647885 ?auto_1647892 ) ) ( not ( = ?auto_1647885 ?auto_1647893 ) ) ( not ( = ?auto_1647885 ?auto_1647894 ) ) ( not ( = ?auto_1647885 ?auto_1647895 ) ) ( not ( = ?auto_1647885 ?auto_1647896 ) ) ( not ( = ?auto_1647885 ?auto_1647897 ) ) ( not ( = ?auto_1647886 ?auto_1647887 ) ) ( not ( = ?auto_1647886 ?auto_1647888 ) ) ( not ( = ?auto_1647886 ?auto_1647889 ) ) ( not ( = ?auto_1647886 ?auto_1647890 ) ) ( not ( = ?auto_1647886 ?auto_1647891 ) ) ( not ( = ?auto_1647886 ?auto_1647892 ) ) ( not ( = ?auto_1647886 ?auto_1647893 ) ) ( not ( = ?auto_1647886 ?auto_1647894 ) ) ( not ( = ?auto_1647886 ?auto_1647895 ) ) ( not ( = ?auto_1647886 ?auto_1647896 ) ) ( not ( = ?auto_1647886 ?auto_1647897 ) ) ( not ( = ?auto_1647887 ?auto_1647888 ) ) ( not ( = ?auto_1647887 ?auto_1647889 ) ) ( not ( = ?auto_1647887 ?auto_1647890 ) ) ( not ( = ?auto_1647887 ?auto_1647891 ) ) ( not ( = ?auto_1647887 ?auto_1647892 ) ) ( not ( = ?auto_1647887 ?auto_1647893 ) ) ( not ( = ?auto_1647887 ?auto_1647894 ) ) ( not ( = ?auto_1647887 ?auto_1647895 ) ) ( not ( = ?auto_1647887 ?auto_1647896 ) ) ( not ( = ?auto_1647887 ?auto_1647897 ) ) ( not ( = ?auto_1647888 ?auto_1647889 ) ) ( not ( = ?auto_1647888 ?auto_1647890 ) ) ( not ( = ?auto_1647888 ?auto_1647891 ) ) ( not ( = ?auto_1647888 ?auto_1647892 ) ) ( not ( = ?auto_1647888 ?auto_1647893 ) ) ( not ( = ?auto_1647888 ?auto_1647894 ) ) ( not ( = ?auto_1647888 ?auto_1647895 ) ) ( not ( = ?auto_1647888 ?auto_1647896 ) ) ( not ( = ?auto_1647888 ?auto_1647897 ) ) ( not ( = ?auto_1647889 ?auto_1647890 ) ) ( not ( = ?auto_1647889 ?auto_1647891 ) ) ( not ( = ?auto_1647889 ?auto_1647892 ) ) ( not ( = ?auto_1647889 ?auto_1647893 ) ) ( not ( = ?auto_1647889 ?auto_1647894 ) ) ( not ( = ?auto_1647889 ?auto_1647895 ) ) ( not ( = ?auto_1647889 ?auto_1647896 ) ) ( not ( = ?auto_1647889 ?auto_1647897 ) ) ( not ( = ?auto_1647890 ?auto_1647891 ) ) ( not ( = ?auto_1647890 ?auto_1647892 ) ) ( not ( = ?auto_1647890 ?auto_1647893 ) ) ( not ( = ?auto_1647890 ?auto_1647894 ) ) ( not ( = ?auto_1647890 ?auto_1647895 ) ) ( not ( = ?auto_1647890 ?auto_1647896 ) ) ( not ( = ?auto_1647890 ?auto_1647897 ) ) ( not ( = ?auto_1647891 ?auto_1647892 ) ) ( not ( = ?auto_1647891 ?auto_1647893 ) ) ( not ( = ?auto_1647891 ?auto_1647894 ) ) ( not ( = ?auto_1647891 ?auto_1647895 ) ) ( not ( = ?auto_1647891 ?auto_1647896 ) ) ( not ( = ?auto_1647891 ?auto_1647897 ) ) ( not ( = ?auto_1647892 ?auto_1647893 ) ) ( not ( = ?auto_1647892 ?auto_1647894 ) ) ( not ( = ?auto_1647892 ?auto_1647895 ) ) ( not ( = ?auto_1647892 ?auto_1647896 ) ) ( not ( = ?auto_1647892 ?auto_1647897 ) ) ( not ( = ?auto_1647893 ?auto_1647894 ) ) ( not ( = ?auto_1647893 ?auto_1647895 ) ) ( not ( = ?auto_1647893 ?auto_1647896 ) ) ( not ( = ?auto_1647893 ?auto_1647897 ) ) ( not ( = ?auto_1647894 ?auto_1647895 ) ) ( not ( = ?auto_1647894 ?auto_1647896 ) ) ( not ( = ?auto_1647894 ?auto_1647897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1647895 ?auto_1647896 ?auto_1647897 )
      ( MAKE-13CRATE-VERIFY ?auto_1647884 ?auto_1647885 ?auto_1647886 ?auto_1647887 ?auto_1647888 ?auto_1647889 ?auto_1647890 ?auto_1647891 ?auto_1647892 ?auto_1647893 ?auto_1647894 ?auto_1647895 ?auto_1647896 ?auto_1647897 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648066 - SURFACE
      ?auto_1648067 - SURFACE
      ?auto_1648068 - SURFACE
      ?auto_1648069 - SURFACE
      ?auto_1648070 - SURFACE
      ?auto_1648071 - SURFACE
      ?auto_1648072 - SURFACE
      ?auto_1648073 - SURFACE
      ?auto_1648074 - SURFACE
      ?auto_1648075 - SURFACE
      ?auto_1648076 - SURFACE
      ?auto_1648077 - SURFACE
      ?auto_1648078 - SURFACE
      ?auto_1648079 - SURFACE
    )
    :vars
    (
      ?auto_1648084 - HOIST
      ?auto_1648082 - PLACE
      ?auto_1648080 - TRUCK
      ?auto_1648085 - PLACE
      ?auto_1648083 - HOIST
      ?auto_1648081 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648084 ?auto_1648082 ) ( SURFACE-AT ?auto_1648078 ?auto_1648082 ) ( CLEAR ?auto_1648078 ) ( IS-CRATE ?auto_1648079 ) ( not ( = ?auto_1648078 ?auto_1648079 ) ) ( AVAILABLE ?auto_1648084 ) ( ON ?auto_1648078 ?auto_1648077 ) ( not ( = ?auto_1648077 ?auto_1648078 ) ) ( not ( = ?auto_1648077 ?auto_1648079 ) ) ( TRUCK-AT ?auto_1648080 ?auto_1648085 ) ( not ( = ?auto_1648085 ?auto_1648082 ) ) ( HOIST-AT ?auto_1648083 ?auto_1648085 ) ( not ( = ?auto_1648084 ?auto_1648083 ) ) ( AVAILABLE ?auto_1648083 ) ( SURFACE-AT ?auto_1648079 ?auto_1648085 ) ( ON ?auto_1648079 ?auto_1648081 ) ( CLEAR ?auto_1648079 ) ( not ( = ?auto_1648078 ?auto_1648081 ) ) ( not ( = ?auto_1648079 ?auto_1648081 ) ) ( not ( = ?auto_1648077 ?auto_1648081 ) ) ( ON ?auto_1648067 ?auto_1648066 ) ( ON ?auto_1648068 ?auto_1648067 ) ( ON ?auto_1648069 ?auto_1648068 ) ( ON ?auto_1648070 ?auto_1648069 ) ( ON ?auto_1648071 ?auto_1648070 ) ( ON ?auto_1648072 ?auto_1648071 ) ( ON ?auto_1648073 ?auto_1648072 ) ( ON ?auto_1648074 ?auto_1648073 ) ( ON ?auto_1648075 ?auto_1648074 ) ( ON ?auto_1648076 ?auto_1648075 ) ( ON ?auto_1648077 ?auto_1648076 ) ( not ( = ?auto_1648066 ?auto_1648067 ) ) ( not ( = ?auto_1648066 ?auto_1648068 ) ) ( not ( = ?auto_1648066 ?auto_1648069 ) ) ( not ( = ?auto_1648066 ?auto_1648070 ) ) ( not ( = ?auto_1648066 ?auto_1648071 ) ) ( not ( = ?auto_1648066 ?auto_1648072 ) ) ( not ( = ?auto_1648066 ?auto_1648073 ) ) ( not ( = ?auto_1648066 ?auto_1648074 ) ) ( not ( = ?auto_1648066 ?auto_1648075 ) ) ( not ( = ?auto_1648066 ?auto_1648076 ) ) ( not ( = ?auto_1648066 ?auto_1648077 ) ) ( not ( = ?auto_1648066 ?auto_1648078 ) ) ( not ( = ?auto_1648066 ?auto_1648079 ) ) ( not ( = ?auto_1648066 ?auto_1648081 ) ) ( not ( = ?auto_1648067 ?auto_1648068 ) ) ( not ( = ?auto_1648067 ?auto_1648069 ) ) ( not ( = ?auto_1648067 ?auto_1648070 ) ) ( not ( = ?auto_1648067 ?auto_1648071 ) ) ( not ( = ?auto_1648067 ?auto_1648072 ) ) ( not ( = ?auto_1648067 ?auto_1648073 ) ) ( not ( = ?auto_1648067 ?auto_1648074 ) ) ( not ( = ?auto_1648067 ?auto_1648075 ) ) ( not ( = ?auto_1648067 ?auto_1648076 ) ) ( not ( = ?auto_1648067 ?auto_1648077 ) ) ( not ( = ?auto_1648067 ?auto_1648078 ) ) ( not ( = ?auto_1648067 ?auto_1648079 ) ) ( not ( = ?auto_1648067 ?auto_1648081 ) ) ( not ( = ?auto_1648068 ?auto_1648069 ) ) ( not ( = ?auto_1648068 ?auto_1648070 ) ) ( not ( = ?auto_1648068 ?auto_1648071 ) ) ( not ( = ?auto_1648068 ?auto_1648072 ) ) ( not ( = ?auto_1648068 ?auto_1648073 ) ) ( not ( = ?auto_1648068 ?auto_1648074 ) ) ( not ( = ?auto_1648068 ?auto_1648075 ) ) ( not ( = ?auto_1648068 ?auto_1648076 ) ) ( not ( = ?auto_1648068 ?auto_1648077 ) ) ( not ( = ?auto_1648068 ?auto_1648078 ) ) ( not ( = ?auto_1648068 ?auto_1648079 ) ) ( not ( = ?auto_1648068 ?auto_1648081 ) ) ( not ( = ?auto_1648069 ?auto_1648070 ) ) ( not ( = ?auto_1648069 ?auto_1648071 ) ) ( not ( = ?auto_1648069 ?auto_1648072 ) ) ( not ( = ?auto_1648069 ?auto_1648073 ) ) ( not ( = ?auto_1648069 ?auto_1648074 ) ) ( not ( = ?auto_1648069 ?auto_1648075 ) ) ( not ( = ?auto_1648069 ?auto_1648076 ) ) ( not ( = ?auto_1648069 ?auto_1648077 ) ) ( not ( = ?auto_1648069 ?auto_1648078 ) ) ( not ( = ?auto_1648069 ?auto_1648079 ) ) ( not ( = ?auto_1648069 ?auto_1648081 ) ) ( not ( = ?auto_1648070 ?auto_1648071 ) ) ( not ( = ?auto_1648070 ?auto_1648072 ) ) ( not ( = ?auto_1648070 ?auto_1648073 ) ) ( not ( = ?auto_1648070 ?auto_1648074 ) ) ( not ( = ?auto_1648070 ?auto_1648075 ) ) ( not ( = ?auto_1648070 ?auto_1648076 ) ) ( not ( = ?auto_1648070 ?auto_1648077 ) ) ( not ( = ?auto_1648070 ?auto_1648078 ) ) ( not ( = ?auto_1648070 ?auto_1648079 ) ) ( not ( = ?auto_1648070 ?auto_1648081 ) ) ( not ( = ?auto_1648071 ?auto_1648072 ) ) ( not ( = ?auto_1648071 ?auto_1648073 ) ) ( not ( = ?auto_1648071 ?auto_1648074 ) ) ( not ( = ?auto_1648071 ?auto_1648075 ) ) ( not ( = ?auto_1648071 ?auto_1648076 ) ) ( not ( = ?auto_1648071 ?auto_1648077 ) ) ( not ( = ?auto_1648071 ?auto_1648078 ) ) ( not ( = ?auto_1648071 ?auto_1648079 ) ) ( not ( = ?auto_1648071 ?auto_1648081 ) ) ( not ( = ?auto_1648072 ?auto_1648073 ) ) ( not ( = ?auto_1648072 ?auto_1648074 ) ) ( not ( = ?auto_1648072 ?auto_1648075 ) ) ( not ( = ?auto_1648072 ?auto_1648076 ) ) ( not ( = ?auto_1648072 ?auto_1648077 ) ) ( not ( = ?auto_1648072 ?auto_1648078 ) ) ( not ( = ?auto_1648072 ?auto_1648079 ) ) ( not ( = ?auto_1648072 ?auto_1648081 ) ) ( not ( = ?auto_1648073 ?auto_1648074 ) ) ( not ( = ?auto_1648073 ?auto_1648075 ) ) ( not ( = ?auto_1648073 ?auto_1648076 ) ) ( not ( = ?auto_1648073 ?auto_1648077 ) ) ( not ( = ?auto_1648073 ?auto_1648078 ) ) ( not ( = ?auto_1648073 ?auto_1648079 ) ) ( not ( = ?auto_1648073 ?auto_1648081 ) ) ( not ( = ?auto_1648074 ?auto_1648075 ) ) ( not ( = ?auto_1648074 ?auto_1648076 ) ) ( not ( = ?auto_1648074 ?auto_1648077 ) ) ( not ( = ?auto_1648074 ?auto_1648078 ) ) ( not ( = ?auto_1648074 ?auto_1648079 ) ) ( not ( = ?auto_1648074 ?auto_1648081 ) ) ( not ( = ?auto_1648075 ?auto_1648076 ) ) ( not ( = ?auto_1648075 ?auto_1648077 ) ) ( not ( = ?auto_1648075 ?auto_1648078 ) ) ( not ( = ?auto_1648075 ?auto_1648079 ) ) ( not ( = ?auto_1648075 ?auto_1648081 ) ) ( not ( = ?auto_1648076 ?auto_1648077 ) ) ( not ( = ?auto_1648076 ?auto_1648078 ) ) ( not ( = ?auto_1648076 ?auto_1648079 ) ) ( not ( = ?auto_1648076 ?auto_1648081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648077 ?auto_1648078 ?auto_1648079 )
      ( MAKE-13CRATE-VERIFY ?auto_1648066 ?auto_1648067 ?auto_1648068 ?auto_1648069 ?auto_1648070 ?auto_1648071 ?auto_1648072 ?auto_1648073 ?auto_1648074 ?auto_1648075 ?auto_1648076 ?auto_1648077 ?auto_1648078 ?auto_1648079 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648249 - SURFACE
      ?auto_1648250 - SURFACE
      ?auto_1648251 - SURFACE
      ?auto_1648252 - SURFACE
      ?auto_1648253 - SURFACE
      ?auto_1648254 - SURFACE
      ?auto_1648255 - SURFACE
      ?auto_1648256 - SURFACE
      ?auto_1648257 - SURFACE
      ?auto_1648258 - SURFACE
      ?auto_1648259 - SURFACE
      ?auto_1648260 - SURFACE
      ?auto_1648261 - SURFACE
      ?auto_1648262 - SURFACE
    )
    :vars
    (
      ?auto_1648264 - HOIST
      ?auto_1648265 - PLACE
      ?auto_1648267 - PLACE
      ?auto_1648268 - HOIST
      ?auto_1648263 - SURFACE
      ?auto_1648266 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648264 ?auto_1648265 ) ( SURFACE-AT ?auto_1648261 ?auto_1648265 ) ( CLEAR ?auto_1648261 ) ( IS-CRATE ?auto_1648262 ) ( not ( = ?auto_1648261 ?auto_1648262 ) ) ( AVAILABLE ?auto_1648264 ) ( ON ?auto_1648261 ?auto_1648260 ) ( not ( = ?auto_1648260 ?auto_1648261 ) ) ( not ( = ?auto_1648260 ?auto_1648262 ) ) ( not ( = ?auto_1648267 ?auto_1648265 ) ) ( HOIST-AT ?auto_1648268 ?auto_1648267 ) ( not ( = ?auto_1648264 ?auto_1648268 ) ) ( AVAILABLE ?auto_1648268 ) ( SURFACE-AT ?auto_1648262 ?auto_1648267 ) ( ON ?auto_1648262 ?auto_1648263 ) ( CLEAR ?auto_1648262 ) ( not ( = ?auto_1648261 ?auto_1648263 ) ) ( not ( = ?auto_1648262 ?auto_1648263 ) ) ( not ( = ?auto_1648260 ?auto_1648263 ) ) ( TRUCK-AT ?auto_1648266 ?auto_1648265 ) ( ON ?auto_1648250 ?auto_1648249 ) ( ON ?auto_1648251 ?auto_1648250 ) ( ON ?auto_1648252 ?auto_1648251 ) ( ON ?auto_1648253 ?auto_1648252 ) ( ON ?auto_1648254 ?auto_1648253 ) ( ON ?auto_1648255 ?auto_1648254 ) ( ON ?auto_1648256 ?auto_1648255 ) ( ON ?auto_1648257 ?auto_1648256 ) ( ON ?auto_1648258 ?auto_1648257 ) ( ON ?auto_1648259 ?auto_1648258 ) ( ON ?auto_1648260 ?auto_1648259 ) ( not ( = ?auto_1648249 ?auto_1648250 ) ) ( not ( = ?auto_1648249 ?auto_1648251 ) ) ( not ( = ?auto_1648249 ?auto_1648252 ) ) ( not ( = ?auto_1648249 ?auto_1648253 ) ) ( not ( = ?auto_1648249 ?auto_1648254 ) ) ( not ( = ?auto_1648249 ?auto_1648255 ) ) ( not ( = ?auto_1648249 ?auto_1648256 ) ) ( not ( = ?auto_1648249 ?auto_1648257 ) ) ( not ( = ?auto_1648249 ?auto_1648258 ) ) ( not ( = ?auto_1648249 ?auto_1648259 ) ) ( not ( = ?auto_1648249 ?auto_1648260 ) ) ( not ( = ?auto_1648249 ?auto_1648261 ) ) ( not ( = ?auto_1648249 ?auto_1648262 ) ) ( not ( = ?auto_1648249 ?auto_1648263 ) ) ( not ( = ?auto_1648250 ?auto_1648251 ) ) ( not ( = ?auto_1648250 ?auto_1648252 ) ) ( not ( = ?auto_1648250 ?auto_1648253 ) ) ( not ( = ?auto_1648250 ?auto_1648254 ) ) ( not ( = ?auto_1648250 ?auto_1648255 ) ) ( not ( = ?auto_1648250 ?auto_1648256 ) ) ( not ( = ?auto_1648250 ?auto_1648257 ) ) ( not ( = ?auto_1648250 ?auto_1648258 ) ) ( not ( = ?auto_1648250 ?auto_1648259 ) ) ( not ( = ?auto_1648250 ?auto_1648260 ) ) ( not ( = ?auto_1648250 ?auto_1648261 ) ) ( not ( = ?auto_1648250 ?auto_1648262 ) ) ( not ( = ?auto_1648250 ?auto_1648263 ) ) ( not ( = ?auto_1648251 ?auto_1648252 ) ) ( not ( = ?auto_1648251 ?auto_1648253 ) ) ( not ( = ?auto_1648251 ?auto_1648254 ) ) ( not ( = ?auto_1648251 ?auto_1648255 ) ) ( not ( = ?auto_1648251 ?auto_1648256 ) ) ( not ( = ?auto_1648251 ?auto_1648257 ) ) ( not ( = ?auto_1648251 ?auto_1648258 ) ) ( not ( = ?auto_1648251 ?auto_1648259 ) ) ( not ( = ?auto_1648251 ?auto_1648260 ) ) ( not ( = ?auto_1648251 ?auto_1648261 ) ) ( not ( = ?auto_1648251 ?auto_1648262 ) ) ( not ( = ?auto_1648251 ?auto_1648263 ) ) ( not ( = ?auto_1648252 ?auto_1648253 ) ) ( not ( = ?auto_1648252 ?auto_1648254 ) ) ( not ( = ?auto_1648252 ?auto_1648255 ) ) ( not ( = ?auto_1648252 ?auto_1648256 ) ) ( not ( = ?auto_1648252 ?auto_1648257 ) ) ( not ( = ?auto_1648252 ?auto_1648258 ) ) ( not ( = ?auto_1648252 ?auto_1648259 ) ) ( not ( = ?auto_1648252 ?auto_1648260 ) ) ( not ( = ?auto_1648252 ?auto_1648261 ) ) ( not ( = ?auto_1648252 ?auto_1648262 ) ) ( not ( = ?auto_1648252 ?auto_1648263 ) ) ( not ( = ?auto_1648253 ?auto_1648254 ) ) ( not ( = ?auto_1648253 ?auto_1648255 ) ) ( not ( = ?auto_1648253 ?auto_1648256 ) ) ( not ( = ?auto_1648253 ?auto_1648257 ) ) ( not ( = ?auto_1648253 ?auto_1648258 ) ) ( not ( = ?auto_1648253 ?auto_1648259 ) ) ( not ( = ?auto_1648253 ?auto_1648260 ) ) ( not ( = ?auto_1648253 ?auto_1648261 ) ) ( not ( = ?auto_1648253 ?auto_1648262 ) ) ( not ( = ?auto_1648253 ?auto_1648263 ) ) ( not ( = ?auto_1648254 ?auto_1648255 ) ) ( not ( = ?auto_1648254 ?auto_1648256 ) ) ( not ( = ?auto_1648254 ?auto_1648257 ) ) ( not ( = ?auto_1648254 ?auto_1648258 ) ) ( not ( = ?auto_1648254 ?auto_1648259 ) ) ( not ( = ?auto_1648254 ?auto_1648260 ) ) ( not ( = ?auto_1648254 ?auto_1648261 ) ) ( not ( = ?auto_1648254 ?auto_1648262 ) ) ( not ( = ?auto_1648254 ?auto_1648263 ) ) ( not ( = ?auto_1648255 ?auto_1648256 ) ) ( not ( = ?auto_1648255 ?auto_1648257 ) ) ( not ( = ?auto_1648255 ?auto_1648258 ) ) ( not ( = ?auto_1648255 ?auto_1648259 ) ) ( not ( = ?auto_1648255 ?auto_1648260 ) ) ( not ( = ?auto_1648255 ?auto_1648261 ) ) ( not ( = ?auto_1648255 ?auto_1648262 ) ) ( not ( = ?auto_1648255 ?auto_1648263 ) ) ( not ( = ?auto_1648256 ?auto_1648257 ) ) ( not ( = ?auto_1648256 ?auto_1648258 ) ) ( not ( = ?auto_1648256 ?auto_1648259 ) ) ( not ( = ?auto_1648256 ?auto_1648260 ) ) ( not ( = ?auto_1648256 ?auto_1648261 ) ) ( not ( = ?auto_1648256 ?auto_1648262 ) ) ( not ( = ?auto_1648256 ?auto_1648263 ) ) ( not ( = ?auto_1648257 ?auto_1648258 ) ) ( not ( = ?auto_1648257 ?auto_1648259 ) ) ( not ( = ?auto_1648257 ?auto_1648260 ) ) ( not ( = ?auto_1648257 ?auto_1648261 ) ) ( not ( = ?auto_1648257 ?auto_1648262 ) ) ( not ( = ?auto_1648257 ?auto_1648263 ) ) ( not ( = ?auto_1648258 ?auto_1648259 ) ) ( not ( = ?auto_1648258 ?auto_1648260 ) ) ( not ( = ?auto_1648258 ?auto_1648261 ) ) ( not ( = ?auto_1648258 ?auto_1648262 ) ) ( not ( = ?auto_1648258 ?auto_1648263 ) ) ( not ( = ?auto_1648259 ?auto_1648260 ) ) ( not ( = ?auto_1648259 ?auto_1648261 ) ) ( not ( = ?auto_1648259 ?auto_1648262 ) ) ( not ( = ?auto_1648259 ?auto_1648263 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648260 ?auto_1648261 ?auto_1648262 )
      ( MAKE-13CRATE-VERIFY ?auto_1648249 ?auto_1648250 ?auto_1648251 ?auto_1648252 ?auto_1648253 ?auto_1648254 ?auto_1648255 ?auto_1648256 ?auto_1648257 ?auto_1648258 ?auto_1648259 ?auto_1648260 ?auto_1648261 ?auto_1648262 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648432 - SURFACE
      ?auto_1648433 - SURFACE
      ?auto_1648434 - SURFACE
      ?auto_1648435 - SURFACE
      ?auto_1648436 - SURFACE
      ?auto_1648437 - SURFACE
      ?auto_1648438 - SURFACE
      ?auto_1648439 - SURFACE
      ?auto_1648440 - SURFACE
      ?auto_1648441 - SURFACE
      ?auto_1648442 - SURFACE
      ?auto_1648443 - SURFACE
      ?auto_1648444 - SURFACE
      ?auto_1648445 - SURFACE
    )
    :vars
    (
      ?auto_1648451 - HOIST
      ?auto_1648450 - PLACE
      ?auto_1648446 - PLACE
      ?auto_1648447 - HOIST
      ?auto_1648448 - SURFACE
      ?auto_1648449 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648451 ?auto_1648450 ) ( IS-CRATE ?auto_1648445 ) ( not ( = ?auto_1648444 ?auto_1648445 ) ) ( not ( = ?auto_1648443 ?auto_1648444 ) ) ( not ( = ?auto_1648443 ?auto_1648445 ) ) ( not ( = ?auto_1648446 ?auto_1648450 ) ) ( HOIST-AT ?auto_1648447 ?auto_1648446 ) ( not ( = ?auto_1648451 ?auto_1648447 ) ) ( AVAILABLE ?auto_1648447 ) ( SURFACE-AT ?auto_1648445 ?auto_1648446 ) ( ON ?auto_1648445 ?auto_1648448 ) ( CLEAR ?auto_1648445 ) ( not ( = ?auto_1648444 ?auto_1648448 ) ) ( not ( = ?auto_1648445 ?auto_1648448 ) ) ( not ( = ?auto_1648443 ?auto_1648448 ) ) ( TRUCK-AT ?auto_1648449 ?auto_1648450 ) ( SURFACE-AT ?auto_1648443 ?auto_1648450 ) ( CLEAR ?auto_1648443 ) ( LIFTING ?auto_1648451 ?auto_1648444 ) ( IS-CRATE ?auto_1648444 ) ( ON ?auto_1648433 ?auto_1648432 ) ( ON ?auto_1648434 ?auto_1648433 ) ( ON ?auto_1648435 ?auto_1648434 ) ( ON ?auto_1648436 ?auto_1648435 ) ( ON ?auto_1648437 ?auto_1648436 ) ( ON ?auto_1648438 ?auto_1648437 ) ( ON ?auto_1648439 ?auto_1648438 ) ( ON ?auto_1648440 ?auto_1648439 ) ( ON ?auto_1648441 ?auto_1648440 ) ( ON ?auto_1648442 ?auto_1648441 ) ( ON ?auto_1648443 ?auto_1648442 ) ( not ( = ?auto_1648432 ?auto_1648433 ) ) ( not ( = ?auto_1648432 ?auto_1648434 ) ) ( not ( = ?auto_1648432 ?auto_1648435 ) ) ( not ( = ?auto_1648432 ?auto_1648436 ) ) ( not ( = ?auto_1648432 ?auto_1648437 ) ) ( not ( = ?auto_1648432 ?auto_1648438 ) ) ( not ( = ?auto_1648432 ?auto_1648439 ) ) ( not ( = ?auto_1648432 ?auto_1648440 ) ) ( not ( = ?auto_1648432 ?auto_1648441 ) ) ( not ( = ?auto_1648432 ?auto_1648442 ) ) ( not ( = ?auto_1648432 ?auto_1648443 ) ) ( not ( = ?auto_1648432 ?auto_1648444 ) ) ( not ( = ?auto_1648432 ?auto_1648445 ) ) ( not ( = ?auto_1648432 ?auto_1648448 ) ) ( not ( = ?auto_1648433 ?auto_1648434 ) ) ( not ( = ?auto_1648433 ?auto_1648435 ) ) ( not ( = ?auto_1648433 ?auto_1648436 ) ) ( not ( = ?auto_1648433 ?auto_1648437 ) ) ( not ( = ?auto_1648433 ?auto_1648438 ) ) ( not ( = ?auto_1648433 ?auto_1648439 ) ) ( not ( = ?auto_1648433 ?auto_1648440 ) ) ( not ( = ?auto_1648433 ?auto_1648441 ) ) ( not ( = ?auto_1648433 ?auto_1648442 ) ) ( not ( = ?auto_1648433 ?auto_1648443 ) ) ( not ( = ?auto_1648433 ?auto_1648444 ) ) ( not ( = ?auto_1648433 ?auto_1648445 ) ) ( not ( = ?auto_1648433 ?auto_1648448 ) ) ( not ( = ?auto_1648434 ?auto_1648435 ) ) ( not ( = ?auto_1648434 ?auto_1648436 ) ) ( not ( = ?auto_1648434 ?auto_1648437 ) ) ( not ( = ?auto_1648434 ?auto_1648438 ) ) ( not ( = ?auto_1648434 ?auto_1648439 ) ) ( not ( = ?auto_1648434 ?auto_1648440 ) ) ( not ( = ?auto_1648434 ?auto_1648441 ) ) ( not ( = ?auto_1648434 ?auto_1648442 ) ) ( not ( = ?auto_1648434 ?auto_1648443 ) ) ( not ( = ?auto_1648434 ?auto_1648444 ) ) ( not ( = ?auto_1648434 ?auto_1648445 ) ) ( not ( = ?auto_1648434 ?auto_1648448 ) ) ( not ( = ?auto_1648435 ?auto_1648436 ) ) ( not ( = ?auto_1648435 ?auto_1648437 ) ) ( not ( = ?auto_1648435 ?auto_1648438 ) ) ( not ( = ?auto_1648435 ?auto_1648439 ) ) ( not ( = ?auto_1648435 ?auto_1648440 ) ) ( not ( = ?auto_1648435 ?auto_1648441 ) ) ( not ( = ?auto_1648435 ?auto_1648442 ) ) ( not ( = ?auto_1648435 ?auto_1648443 ) ) ( not ( = ?auto_1648435 ?auto_1648444 ) ) ( not ( = ?auto_1648435 ?auto_1648445 ) ) ( not ( = ?auto_1648435 ?auto_1648448 ) ) ( not ( = ?auto_1648436 ?auto_1648437 ) ) ( not ( = ?auto_1648436 ?auto_1648438 ) ) ( not ( = ?auto_1648436 ?auto_1648439 ) ) ( not ( = ?auto_1648436 ?auto_1648440 ) ) ( not ( = ?auto_1648436 ?auto_1648441 ) ) ( not ( = ?auto_1648436 ?auto_1648442 ) ) ( not ( = ?auto_1648436 ?auto_1648443 ) ) ( not ( = ?auto_1648436 ?auto_1648444 ) ) ( not ( = ?auto_1648436 ?auto_1648445 ) ) ( not ( = ?auto_1648436 ?auto_1648448 ) ) ( not ( = ?auto_1648437 ?auto_1648438 ) ) ( not ( = ?auto_1648437 ?auto_1648439 ) ) ( not ( = ?auto_1648437 ?auto_1648440 ) ) ( not ( = ?auto_1648437 ?auto_1648441 ) ) ( not ( = ?auto_1648437 ?auto_1648442 ) ) ( not ( = ?auto_1648437 ?auto_1648443 ) ) ( not ( = ?auto_1648437 ?auto_1648444 ) ) ( not ( = ?auto_1648437 ?auto_1648445 ) ) ( not ( = ?auto_1648437 ?auto_1648448 ) ) ( not ( = ?auto_1648438 ?auto_1648439 ) ) ( not ( = ?auto_1648438 ?auto_1648440 ) ) ( not ( = ?auto_1648438 ?auto_1648441 ) ) ( not ( = ?auto_1648438 ?auto_1648442 ) ) ( not ( = ?auto_1648438 ?auto_1648443 ) ) ( not ( = ?auto_1648438 ?auto_1648444 ) ) ( not ( = ?auto_1648438 ?auto_1648445 ) ) ( not ( = ?auto_1648438 ?auto_1648448 ) ) ( not ( = ?auto_1648439 ?auto_1648440 ) ) ( not ( = ?auto_1648439 ?auto_1648441 ) ) ( not ( = ?auto_1648439 ?auto_1648442 ) ) ( not ( = ?auto_1648439 ?auto_1648443 ) ) ( not ( = ?auto_1648439 ?auto_1648444 ) ) ( not ( = ?auto_1648439 ?auto_1648445 ) ) ( not ( = ?auto_1648439 ?auto_1648448 ) ) ( not ( = ?auto_1648440 ?auto_1648441 ) ) ( not ( = ?auto_1648440 ?auto_1648442 ) ) ( not ( = ?auto_1648440 ?auto_1648443 ) ) ( not ( = ?auto_1648440 ?auto_1648444 ) ) ( not ( = ?auto_1648440 ?auto_1648445 ) ) ( not ( = ?auto_1648440 ?auto_1648448 ) ) ( not ( = ?auto_1648441 ?auto_1648442 ) ) ( not ( = ?auto_1648441 ?auto_1648443 ) ) ( not ( = ?auto_1648441 ?auto_1648444 ) ) ( not ( = ?auto_1648441 ?auto_1648445 ) ) ( not ( = ?auto_1648441 ?auto_1648448 ) ) ( not ( = ?auto_1648442 ?auto_1648443 ) ) ( not ( = ?auto_1648442 ?auto_1648444 ) ) ( not ( = ?auto_1648442 ?auto_1648445 ) ) ( not ( = ?auto_1648442 ?auto_1648448 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648443 ?auto_1648444 ?auto_1648445 )
      ( MAKE-13CRATE-VERIFY ?auto_1648432 ?auto_1648433 ?auto_1648434 ?auto_1648435 ?auto_1648436 ?auto_1648437 ?auto_1648438 ?auto_1648439 ?auto_1648440 ?auto_1648441 ?auto_1648442 ?auto_1648443 ?auto_1648444 ?auto_1648445 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1648615 - SURFACE
      ?auto_1648616 - SURFACE
      ?auto_1648617 - SURFACE
      ?auto_1648618 - SURFACE
      ?auto_1648619 - SURFACE
      ?auto_1648620 - SURFACE
      ?auto_1648621 - SURFACE
      ?auto_1648622 - SURFACE
      ?auto_1648623 - SURFACE
      ?auto_1648624 - SURFACE
      ?auto_1648625 - SURFACE
      ?auto_1648626 - SURFACE
      ?auto_1648627 - SURFACE
      ?auto_1648628 - SURFACE
    )
    :vars
    (
      ?auto_1648630 - HOIST
      ?auto_1648634 - PLACE
      ?auto_1648631 - PLACE
      ?auto_1648629 - HOIST
      ?auto_1648633 - SURFACE
      ?auto_1648632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1648630 ?auto_1648634 ) ( IS-CRATE ?auto_1648628 ) ( not ( = ?auto_1648627 ?auto_1648628 ) ) ( not ( = ?auto_1648626 ?auto_1648627 ) ) ( not ( = ?auto_1648626 ?auto_1648628 ) ) ( not ( = ?auto_1648631 ?auto_1648634 ) ) ( HOIST-AT ?auto_1648629 ?auto_1648631 ) ( not ( = ?auto_1648630 ?auto_1648629 ) ) ( AVAILABLE ?auto_1648629 ) ( SURFACE-AT ?auto_1648628 ?auto_1648631 ) ( ON ?auto_1648628 ?auto_1648633 ) ( CLEAR ?auto_1648628 ) ( not ( = ?auto_1648627 ?auto_1648633 ) ) ( not ( = ?auto_1648628 ?auto_1648633 ) ) ( not ( = ?auto_1648626 ?auto_1648633 ) ) ( TRUCK-AT ?auto_1648632 ?auto_1648634 ) ( SURFACE-AT ?auto_1648626 ?auto_1648634 ) ( CLEAR ?auto_1648626 ) ( IS-CRATE ?auto_1648627 ) ( AVAILABLE ?auto_1648630 ) ( IN ?auto_1648627 ?auto_1648632 ) ( ON ?auto_1648616 ?auto_1648615 ) ( ON ?auto_1648617 ?auto_1648616 ) ( ON ?auto_1648618 ?auto_1648617 ) ( ON ?auto_1648619 ?auto_1648618 ) ( ON ?auto_1648620 ?auto_1648619 ) ( ON ?auto_1648621 ?auto_1648620 ) ( ON ?auto_1648622 ?auto_1648621 ) ( ON ?auto_1648623 ?auto_1648622 ) ( ON ?auto_1648624 ?auto_1648623 ) ( ON ?auto_1648625 ?auto_1648624 ) ( ON ?auto_1648626 ?auto_1648625 ) ( not ( = ?auto_1648615 ?auto_1648616 ) ) ( not ( = ?auto_1648615 ?auto_1648617 ) ) ( not ( = ?auto_1648615 ?auto_1648618 ) ) ( not ( = ?auto_1648615 ?auto_1648619 ) ) ( not ( = ?auto_1648615 ?auto_1648620 ) ) ( not ( = ?auto_1648615 ?auto_1648621 ) ) ( not ( = ?auto_1648615 ?auto_1648622 ) ) ( not ( = ?auto_1648615 ?auto_1648623 ) ) ( not ( = ?auto_1648615 ?auto_1648624 ) ) ( not ( = ?auto_1648615 ?auto_1648625 ) ) ( not ( = ?auto_1648615 ?auto_1648626 ) ) ( not ( = ?auto_1648615 ?auto_1648627 ) ) ( not ( = ?auto_1648615 ?auto_1648628 ) ) ( not ( = ?auto_1648615 ?auto_1648633 ) ) ( not ( = ?auto_1648616 ?auto_1648617 ) ) ( not ( = ?auto_1648616 ?auto_1648618 ) ) ( not ( = ?auto_1648616 ?auto_1648619 ) ) ( not ( = ?auto_1648616 ?auto_1648620 ) ) ( not ( = ?auto_1648616 ?auto_1648621 ) ) ( not ( = ?auto_1648616 ?auto_1648622 ) ) ( not ( = ?auto_1648616 ?auto_1648623 ) ) ( not ( = ?auto_1648616 ?auto_1648624 ) ) ( not ( = ?auto_1648616 ?auto_1648625 ) ) ( not ( = ?auto_1648616 ?auto_1648626 ) ) ( not ( = ?auto_1648616 ?auto_1648627 ) ) ( not ( = ?auto_1648616 ?auto_1648628 ) ) ( not ( = ?auto_1648616 ?auto_1648633 ) ) ( not ( = ?auto_1648617 ?auto_1648618 ) ) ( not ( = ?auto_1648617 ?auto_1648619 ) ) ( not ( = ?auto_1648617 ?auto_1648620 ) ) ( not ( = ?auto_1648617 ?auto_1648621 ) ) ( not ( = ?auto_1648617 ?auto_1648622 ) ) ( not ( = ?auto_1648617 ?auto_1648623 ) ) ( not ( = ?auto_1648617 ?auto_1648624 ) ) ( not ( = ?auto_1648617 ?auto_1648625 ) ) ( not ( = ?auto_1648617 ?auto_1648626 ) ) ( not ( = ?auto_1648617 ?auto_1648627 ) ) ( not ( = ?auto_1648617 ?auto_1648628 ) ) ( not ( = ?auto_1648617 ?auto_1648633 ) ) ( not ( = ?auto_1648618 ?auto_1648619 ) ) ( not ( = ?auto_1648618 ?auto_1648620 ) ) ( not ( = ?auto_1648618 ?auto_1648621 ) ) ( not ( = ?auto_1648618 ?auto_1648622 ) ) ( not ( = ?auto_1648618 ?auto_1648623 ) ) ( not ( = ?auto_1648618 ?auto_1648624 ) ) ( not ( = ?auto_1648618 ?auto_1648625 ) ) ( not ( = ?auto_1648618 ?auto_1648626 ) ) ( not ( = ?auto_1648618 ?auto_1648627 ) ) ( not ( = ?auto_1648618 ?auto_1648628 ) ) ( not ( = ?auto_1648618 ?auto_1648633 ) ) ( not ( = ?auto_1648619 ?auto_1648620 ) ) ( not ( = ?auto_1648619 ?auto_1648621 ) ) ( not ( = ?auto_1648619 ?auto_1648622 ) ) ( not ( = ?auto_1648619 ?auto_1648623 ) ) ( not ( = ?auto_1648619 ?auto_1648624 ) ) ( not ( = ?auto_1648619 ?auto_1648625 ) ) ( not ( = ?auto_1648619 ?auto_1648626 ) ) ( not ( = ?auto_1648619 ?auto_1648627 ) ) ( not ( = ?auto_1648619 ?auto_1648628 ) ) ( not ( = ?auto_1648619 ?auto_1648633 ) ) ( not ( = ?auto_1648620 ?auto_1648621 ) ) ( not ( = ?auto_1648620 ?auto_1648622 ) ) ( not ( = ?auto_1648620 ?auto_1648623 ) ) ( not ( = ?auto_1648620 ?auto_1648624 ) ) ( not ( = ?auto_1648620 ?auto_1648625 ) ) ( not ( = ?auto_1648620 ?auto_1648626 ) ) ( not ( = ?auto_1648620 ?auto_1648627 ) ) ( not ( = ?auto_1648620 ?auto_1648628 ) ) ( not ( = ?auto_1648620 ?auto_1648633 ) ) ( not ( = ?auto_1648621 ?auto_1648622 ) ) ( not ( = ?auto_1648621 ?auto_1648623 ) ) ( not ( = ?auto_1648621 ?auto_1648624 ) ) ( not ( = ?auto_1648621 ?auto_1648625 ) ) ( not ( = ?auto_1648621 ?auto_1648626 ) ) ( not ( = ?auto_1648621 ?auto_1648627 ) ) ( not ( = ?auto_1648621 ?auto_1648628 ) ) ( not ( = ?auto_1648621 ?auto_1648633 ) ) ( not ( = ?auto_1648622 ?auto_1648623 ) ) ( not ( = ?auto_1648622 ?auto_1648624 ) ) ( not ( = ?auto_1648622 ?auto_1648625 ) ) ( not ( = ?auto_1648622 ?auto_1648626 ) ) ( not ( = ?auto_1648622 ?auto_1648627 ) ) ( not ( = ?auto_1648622 ?auto_1648628 ) ) ( not ( = ?auto_1648622 ?auto_1648633 ) ) ( not ( = ?auto_1648623 ?auto_1648624 ) ) ( not ( = ?auto_1648623 ?auto_1648625 ) ) ( not ( = ?auto_1648623 ?auto_1648626 ) ) ( not ( = ?auto_1648623 ?auto_1648627 ) ) ( not ( = ?auto_1648623 ?auto_1648628 ) ) ( not ( = ?auto_1648623 ?auto_1648633 ) ) ( not ( = ?auto_1648624 ?auto_1648625 ) ) ( not ( = ?auto_1648624 ?auto_1648626 ) ) ( not ( = ?auto_1648624 ?auto_1648627 ) ) ( not ( = ?auto_1648624 ?auto_1648628 ) ) ( not ( = ?auto_1648624 ?auto_1648633 ) ) ( not ( = ?auto_1648625 ?auto_1648626 ) ) ( not ( = ?auto_1648625 ?auto_1648627 ) ) ( not ( = ?auto_1648625 ?auto_1648628 ) ) ( not ( = ?auto_1648625 ?auto_1648633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1648626 ?auto_1648627 ?auto_1648628 )
      ( MAKE-13CRATE-VERIFY ?auto_1648615 ?auto_1648616 ?auto_1648617 ?auto_1648618 ?auto_1648619 ?auto_1648620 ?auto_1648621 ?auto_1648622 ?auto_1648623 ?auto_1648624 ?auto_1648625 ?auto_1648626 ?auto_1648627 ?auto_1648628 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662800 - SURFACE
      ?auto_1662801 - SURFACE
      ?auto_1662802 - SURFACE
      ?auto_1662803 - SURFACE
      ?auto_1662804 - SURFACE
      ?auto_1662805 - SURFACE
      ?auto_1662806 - SURFACE
      ?auto_1662807 - SURFACE
      ?auto_1662808 - SURFACE
      ?auto_1662809 - SURFACE
      ?auto_1662810 - SURFACE
      ?auto_1662811 - SURFACE
      ?auto_1662812 - SURFACE
      ?auto_1662813 - SURFACE
      ?auto_1662814 - SURFACE
    )
    :vars
    (
      ?auto_1662816 - HOIST
      ?auto_1662815 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662816 ?auto_1662815 ) ( SURFACE-AT ?auto_1662813 ?auto_1662815 ) ( CLEAR ?auto_1662813 ) ( LIFTING ?auto_1662816 ?auto_1662814 ) ( IS-CRATE ?auto_1662814 ) ( not ( = ?auto_1662813 ?auto_1662814 ) ) ( ON ?auto_1662801 ?auto_1662800 ) ( ON ?auto_1662802 ?auto_1662801 ) ( ON ?auto_1662803 ?auto_1662802 ) ( ON ?auto_1662804 ?auto_1662803 ) ( ON ?auto_1662805 ?auto_1662804 ) ( ON ?auto_1662806 ?auto_1662805 ) ( ON ?auto_1662807 ?auto_1662806 ) ( ON ?auto_1662808 ?auto_1662807 ) ( ON ?auto_1662809 ?auto_1662808 ) ( ON ?auto_1662810 ?auto_1662809 ) ( ON ?auto_1662811 ?auto_1662810 ) ( ON ?auto_1662812 ?auto_1662811 ) ( ON ?auto_1662813 ?auto_1662812 ) ( not ( = ?auto_1662800 ?auto_1662801 ) ) ( not ( = ?auto_1662800 ?auto_1662802 ) ) ( not ( = ?auto_1662800 ?auto_1662803 ) ) ( not ( = ?auto_1662800 ?auto_1662804 ) ) ( not ( = ?auto_1662800 ?auto_1662805 ) ) ( not ( = ?auto_1662800 ?auto_1662806 ) ) ( not ( = ?auto_1662800 ?auto_1662807 ) ) ( not ( = ?auto_1662800 ?auto_1662808 ) ) ( not ( = ?auto_1662800 ?auto_1662809 ) ) ( not ( = ?auto_1662800 ?auto_1662810 ) ) ( not ( = ?auto_1662800 ?auto_1662811 ) ) ( not ( = ?auto_1662800 ?auto_1662812 ) ) ( not ( = ?auto_1662800 ?auto_1662813 ) ) ( not ( = ?auto_1662800 ?auto_1662814 ) ) ( not ( = ?auto_1662801 ?auto_1662802 ) ) ( not ( = ?auto_1662801 ?auto_1662803 ) ) ( not ( = ?auto_1662801 ?auto_1662804 ) ) ( not ( = ?auto_1662801 ?auto_1662805 ) ) ( not ( = ?auto_1662801 ?auto_1662806 ) ) ( not ( = ?auto_1662801 ?auto_1662807 ) ) ( not ( = ?auto_1662801 ?auto_1662808 ) ) ( not ( = ?auto_1662801 ?auto_1662809 ) ) ( not ( = ?auto_1662801 ?auto_1662810 ) ) ( not ( = ?auto_1662801 ?auto_1662811 ) ) ( not ( = ?auto_1662801 ?auto_1662812 ) ) ( not ( = ?auto_1662801 ?auto_1662813 ) ) ( not ( = ?auto_1662801 ?auto_1662814 ) ) ( not ( = ?auto_1662802 ?auto_1662803 ) ) ( not ( = ?auto_1662802 ?auto_1662804 ) ) ( not ( = ?auto_1662802 ?auto_1662805 ) ) ( not ( = ?auto_1662802 ?auto_1662806 ) ) ( not ( = ?auto_1662802 ?auto_1662807 ) ) ( not ( = ?auto_1662802 ?auto_1662808 ) ) ( not ( = ?auto_1662802 ?auto_1662809 ) ) ( not ( = ?auto_1662802 ?auto_1662810 ) ) ( not ( = ?auto_1662802 ?auto_1662811 ) ) ( not ( = ?auto_1662802 ?auto_1662812 ) ) ( not ( = ?auto_1662802 ?auto_1662813 ) ) ( not ( = ?auto_1662802 ?auto_1662814 ) ) ( not ( = ?auto_1662803 ?auto_1662804 ) ) ( not ( = ?auto_1662803 ?auto_1662805 ) ) ( not ( = ?auto_1662803 ?auto_1662806 ) ) ( not ( = ?auto_1662803 ?auto_1662807 ) ) ( not ( = ?auto_1662803 ?auto_1662808 ) ) ( not ( = ?auto_1662803 ?auto_1662809 ) ) ( not ( = ?auto_1662803 ?auto_1662810 ) ) ( not ( = ?auto_1662803 ?auto_1662811 ) ) ( not ( = ?auto_1662803 ?auto_1662812 ) ) ( not ( = ?auto_1662803 ?auto_1662813 ) ) ( not ( = ?auto_1662803 ?auto_1662814 ) ) ( not ( = ?auto_1662804 ?auto_1662805 ) ) ( not ( = ?auto_1662804 ?auto_1662806 ) ) ( not ( = ?auto_1662804 ?auto_1662807 ) ) ( not ( = ?auto_1662804 ?auto_1662808 ) ) ( not ( = ?auto_1662804 ?auto_1662809 ) ) ( not ( = ?auto_1662804 ?auto_1662810 ) ) ( not ( = ?auto_1662804 ?auto_1662811 ) ) ( not ( = ?auto_1662804 ?auto_1662812 ) ) ( not ( = ?auto_1662804 ?auto_1662813 ) ) ( not ( = ?auto_1662804 ?auto_1662814 ) ) ( not ( = ?auto_1662805 ?auto_1662806 ) ) ( not ( = ?auto_1662805 ?auto_1662807 ) ) ( not ( = ?auto_1662805 ?auto_1662808 ) ) ( not ( = ?auto_1662805 ?auto_1662809 ) ) ( not ( = ?auto_1662805 ?auto_1662810 ) ) ( not ( = ?auto_1662805 ?auto_1662811 ) ) ( not ( = ?auto_1662805 ?auto_1662812 ) ) ( not ( = ?auto_1662805 ?auto_1662813 ) ) ( not ( = ?auto_1662805 ?auto_1662814 ) ) ( not ( = ?auto_1662806 ?auto_1662807 ) ) ( not ( = ?auto_1662806 ?auto_1662808 ) ) ( not ( = ?auto_1662806 ?auto_1662809 ) ) ( not ( = ?auto_1662806 ?auto_1662810 ) ) ( not ( = ?auto_1662806 ?auto_1662811 ) ) ( not ( = ?auto_1662806 ?auto_1662812 ) ) ( not ( = ?auto_1662806 ?auto_1662813 ) ) ( not ( = ?auto_1662806 ?auto_1662814 ) ) ( not ( = ?auto_1662807 ?auto_1662808 ) ) ( not ( = ?auto_1662807 ?auto_1662809 ) ) ( not ( = ?auto_1662807 ?auto_1662810 ) ) ( not ( = ?auto_1662807 ?auto_1662811 ) ) ( not ( = ?auto_1662807 ?auto_1662812 ) ) ( not ( = ?auto_1662807 ?auto_1662813 ) ) ( not ( = ?auto_1662807 ?auto_1662814 ) ) ( not ( = ?auto_1662808 ?auto_1662809 ) ) ( not ( = ?auto_1662808 ?auto_1662810 ) ) ( not ( = ?auto_1662808 ?auto_1662811 ) ) ( not ( = ?auto_1662808 ?auto_1662812 ) ) ( not ( = ?auto_1662808 ?auto_1662813 ) ) ( not ( = ?auto_1662808 ?auto_1662814 ) ) ( not ( = ?auto_1662809 ?auto_1662810 ) ) ( not ( = ?auto_1662809 ?auto_1662811 ) ) ( not ( = ?auto_1662809 ?auto_1662812 ) ) ( not ( = ?auto_1662809 ?auto_1662813 ) ) ( not ( = ?auto_1662809 ?auto_1662814 ) ) ( not ( = ?auto_1662810 ?auto_1662811 ) ) ( not ( = ?auto_1662810 ?auto_1662812 ) ) ( not ( = ?auto_1662810 ?auto_1662813 ) ) ( not ( = ?auto_1662810 ?auto_1662814 ) ) ( not ( = ?auto_1662811 ?auto_1662812 ) ) ( not ( = ?auto_1662811 ?auto_1662813 ) ) ( not ( = ?auto_1662811 ?auto_1662814 ) ) ( not ( = ?auto_1662812 ?auto_1662813 ) ) ( not ( = ?auto_1662812 ?auto_1662814 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1662813 ?auto_1662814 )
      ( MAKE-14CRATE-VERIFY ?auto_1662800 ?auto_1662801 ?auto_1662802 ?auto_1662803 ?auto_1662804 ?auto_1662805 ?auto_1662806 ?auto_1662807 ?auto_1662808 ?auto_1662809 ?auto_1662810 ?auto_1662811 ?auto_1662812 ?auto_1662813 ?auto_1662814 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1662960 - SURFACE
      ?auto_1662961 - SURFACE
      ?auto_1662962 - SURFACE
      ?auto_1662963 - SURFACE
      ?auto_1662964 - SURFACE
      ?auto_1662965 - SURFACE
      ?auto_1662966 - SURFACE
      ?auto_1662967 - SURFACE
      ?auto_1662968 - SURFACE
      ?auto_1662969 - SURFACE
      ?auto_1662970 - SURFACE
      ?auto_1662971 - SURFACE
      ?auto_1662972 - SURFACE
      ?auto_1662973 - SURFACE
      ?auto_1662974 - SURFACE
    )
    :vars
    (
      ?auto_1662977 - HOIST
      ?auto_1662975 - PLACE
      ?auto_1662976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1662977 ?auto_1662975 ) ( SURFACE-AT ?auto_1662973 ?auto_1662975 ) ( CLEAR ?auto_1662973 ) ( IS-CRATE ?auto_1662974 ) ( not ( = ?auto_1662973 ?auto_1662974 ) ) ( TRUCK-AT ?auto_1662976 ?auto_1662975 ) ( AVAILABLE ?auto_1662977 ) ( IN ?auto_1662974 ?auto_1662976 ) ( ON ?auto_1662973 ?auto_1662972 ) ( not ( = ?auto_1662972 ?auto_1662973 ) ) ( not ( = ?auto_1662972 ?auto_1662974 ) ) ( ON ?auto_1662961 ?auto_1662960 ) ( ON ?auto_1662962 ?auto_1662961 ) ( ON ?auto_1662963 ?auto_1662962 ) ( ON ?auto_1662964 ?auto_1662963 ) ( ON ?auto_1662965 ?auto_1662964 ) ( ON ?auto_1662966 ?auto_1662965 ) ( ON ?auto_1662967 ?auto_1662966 ) ( ON ?auto_1662968 ?auto_1662967 ) ( ON ?auto_1662969 ?auto_1662968 ) ( ON ?auto_1662970 ?auto_1662969 ) ( ON ?auto_1662971 ?auto_1662970 ) ( ON ?auto_1662972 ?auto_1662971 ) ( not ( = ?auto_1662960 ?auto_1662961 ) ) ( not ( = ?auto_1662960 ?auto_1662962 ) ) ( not ( = ?auto_1662960 ?auto_1662963 ) ) ( not ( = ?auto_1662960 ?auto_1662964 ) ) ( not ( = ?auto_1662960 ?auto_1662965 ) ) ( not ( = ?auto_1662960 ?auto_1662966 ) ) ( not ( = ?auto_1662960 ?auto_1662967 ) ) ( not ( = ?auto_1662960 ?auto_1662968 ) ) ( not ( = ?auto_1662960 ?auto_1662969 ) ) ( not ( = ?auto_1662960 ?auto_1662970 ) ) ( not ( = ?auto_1662960 ?auto_1662971 ) ) ( not ( = ?auto_1662960 ?auto_1662972 ) ) ( not ( = ?auto_1662960 ?auto_1662973 ) ) ( not ( = ?auto_1662960 ?auto_1662974 ) ) ( not ( = ?auto_1662961 ?auto_1662962 ) ) ( not ( = ?auto_1662961 ?auto_1662963 ) ) ( not ( = ?auto_1662961 ?auto_1662964 ) ) ( not ( = ?auto_1662961 ?auto_1662965 ) ) ( not ( = ?auto_1662961 ?auto_1662966 ) ) ( not ( = ?auto_1662961 ?auto_1662967 ) ) ( not ( = ?auto_1662961 ?auto_1662968 ) ) ( not ( = ?auto_1662961 ?auto_1662969 ) ) ( not ( = ?auto_1662961 ?auto_1662970 ) ) ( not ( = ?auto_1662961 ?auto_1662971 ) ) ( not ( = ?auto_1662961 ?auto_1662972 ) ) ( not ( = ?auto_1662961 ?auto_1662973 ) ) ( not ( = ?auto_1662961 ?auto_1662974 ) ) ( not ( = ?auto_1662962 ?auto_1662963 ) ) ( not ( = ?auto_1662962 ?auto_1662964 ) ) ( not ( = ?auto_1662962 ?auto_1662965 ) ) ( not ( = ?auto_1662962 ?auto_1662966 ) ) ( not ( = ?auto_1662962 ?auto_1662967 ) ) ( not ( = ?auto_1662962 ?auto_1662968 ) ) ( not ( = ?auto_1662962 ?auto_1662969 ) ) ( not ( = ?auto_1662962 ?auto_1662970 ) ) ( not ( = ?auto_1662962 ?auto_1662971 ) ) ( not ( = ?auto_1662962 ?auto_1662972 ) ) ( not ( = ?auto_1662962 ?auto_1662973 ) ) ( not ( = ?auto_1662962 ?auto_1662974 ) ) ( not ( = ?auto_1662963 ?auto_1662964 ) ) ( not ( = ?auto_1662963 ?auto_1662965 ) ) ( not ( = ?auto_1662963 ?auto_1662966 ) ) ( not ( = ?auto_1662963 ?auto_1662967 ) ) ( not ( = ?auto_1662963 ?auto_1662968 ) ) ( not ( = ?auto_1662963 ?auto_1662969 ) ) ( not ( = ?auto_1662963 ?auto_1662970 ) ) ( not ( = ?auto_1662963 ?auto_1662971 ) ) ( not ( = ?auto_1662963 ?auto_1662972 ) ) ( not ( = ?auto_1662963 ?auto_1662973 ) ) ( not ( = ?auto_1662963 ?auto_1662974 ) ) ( not ( = ?auto_1662964 ?auto_1662965 ) ) ( not ( = ?auto_1662964 ?auto_1662966 ) ) ( not ( = ?auto_1662964 ?auto_1662967 ) ) ( not ( = ?auto_1662964 ?auto_1662968 ) ) ( not ( = ?auto_1662964 ?auto_1662969 ) ) ( not ( = ?auto_1662964 ?auto_1662970 ) ) ( not ( = ?auto_1662964 ?auto_1662971 ) ) ( not ( = ?auto_1662964 ?auto_1662972 ) ) ( not ( = ?auto_1662964 ?auto_1662973 ) ) ( not ( = ?auto_1662964 ?auto_1662974 ) ) ( not ( = ?auto_1662965 ?auto_1662966 ) ) ( not ( = ?auto_1662965 ?auto_1662967 ) ) ( not ( = ?auto_1662965 ?auto_1662968 ) ) ( not ( = ?auto_1662965 ?auto_1662969 ) ) ( not ( = ?auto_1662965 ?auto_1662970 ) ) ( not ( = ?auto_1662965 ?auto_1662971 ) ) ( not ( = ?auto_1662965 ?auto_1662972 ) ) ( not ( = ?auto_1662965 ?auto_1662973 ) ) ( not ( = ?auto_1662965 ?auto_1662974 ) ) ( not ( = ?auto_1662966 ?auto_1662967 ) ) ( not ( = ?auto_1662966 ?auto_1662968 ) ) ( not ( = ?auto_1662966 ?auto_1662969 ) ) ( not ( = ?auto_1662966 ?auto_1662970 ) ) ( not ( = ?auto_1662966 ?auto_1662971 ) ) ( not ( = ?auto_1662966 ?auto_1662972 ) ) ( not ( = ?auto_1662966 ?auto_1662973 ) ) ( not ( = ?auto_1662966 ?auto_1662974 ) ) ( not ( = ?auto_1662967 ?auto_1662968 ) ) ( not ( = ?auto_1662967 ?auto_1662969 ) ) ( not ( = ?auto_1662967 ?auto_1662970 ) ) ( not ( = ?auto_1662967 ?auto_1662971 ) ) ( not ( = ?auto_1662967 ?auto_1662972 ) ) ( not ( = ?auto_1662967 ?auto_1662973 ) ) ( not ( = ?auto_1662967 ?auto_1662974 ) ) ( not ( = ?auto_1662968 ?auto_1662969 ) ) ( not ( = ?auto_1662968 ?auto_1662970 ) ) ( not ( = ?auto_1662968 ?auto_1662971 ) ) ( not ( = ?auto_1662968 ?auto_1662972 ) ) ( not ( = ?auto_1662968 ?auto_1662973 ) ) ( not ( = ?auto_1662968 ?auto_1662974 ) ) ( not ( = ?auto_1662969 ?auto_1662970 ) ) ( not ( = ?auto_1662969 ?auto_1662971 ) ) ( not ( = ?auto_1662969 ?auto_1662972 ) ) ( not ( = ?auto_1662969 ?auto_1662973 ) ) ( not ( = ?auto_1662969 ?auto_1662974 ) ) ( not ( = ?auto_1662970 ?auto_1662971 ) ) ( not ( = ?auto_1662970 ?auto_1662972 ) ) ( not ( = ?auto_1662970 ?auto_1662973 ) ) ( not ( = ?auto_1662970 ?auto_1662974 ) ) ( not ( = ?auto_1662971 ?auto_1662972 ) ) ( not ( = ?auto_1662971 ?auto_1662973 ) ) ( not ( = ?auto_1662971 ?auto_1662974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1662972 ?auto_1662973 ?auto_1662974 )
      ( MAKE-14CRATE-VERIFY ?auto_1662960 ?auto_1662961 ?auto_1662962 ?auto_1662963 ?auto_1662964 ?auto_1662965 ?auto_1662966 ?auto_1662967 ?auto_1662968 ?auto_1662969 ?auto_1662970 ?auto_1662971 ?auto_1662972 ?auto_1662973 ?auto_1662974 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663135 - SURFACE
      ?auto_1663136 - SURFACE
      ?auto_1663137 - SURFACE
      ?auto_1663138 - SURFACE
      ?auto_1663139 - SURFACE
      ?auto_1663140 - SURFACE
      ?auto_1663141 - SURFACE
      ?auto_1663142 - SURFACE
      ?auto_1663143 - SURFACE
      ?auto_1663144 - SURFACE
      ?auto_1663145 - SURFACE
      ?auto_1663146 - SURFACE
      ?auto_1663147 - SURFACE
      ?auto_1663148 - SURFACE
      ?auto_1663149 - SURFACE
    )
    :vars
    (
      ?auto_1663151 - HOIST
      ?auto_1663152 - PLACE
      ?auto_1663150 - TRUCK
      ?auto_1663153 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663151 ?auto_1663152 ) ( SURFACE-AT ?auto_1663148 ?auto_1663152 ) ( CLEAR ?auto_1663148 ) ( IS-CRATE ?auto_1663149 ) ( not ( = ?auto_1663148 ?auto_1663149 ) ) ( AVAILABLE ?auto_1663151 ) ( IN ?auto_1663149 ?auto_1663150 ) ( ON ?auto_1663148 ?auto_1663147 ) ( not ( = ?auto_1663147 ?auto_1663148 ) ) ( not ( = ?auto_1663147 ?auto_1663149 ) ) ( TRUCK-AT ?auto_1663150 ?auto_1663153 ) ( not ( = ?auto_1663153 ?auto_1663152 ) ) ( ON ?auto_1663136 ?auto_1663135 ) ( ON ?auto_1663137 ?auto_1663136 ) ( ON ?auto_1663138 ?auto_1663137 ) ( ON ?auto_1663139 ?auto_1663138 ) ( ON ?auto_1663140 ?auto_1663139 ) ( ON ?auto_1663141 ?auto_1663140 ) ( ON ?auto_1663142 ?auto_1663141 ) ( ON ?auto_1663143 ?auto_1663142 ) ( ON ?auto_1663144 ?auto_1663143 ) ( ON ?auto_1663145 ?auto_1663144 ) ( ON ?auto_1663146 ?auto_1663145 ) ( ON ?auto_1663147 ?auto_1663146 ) ( not ( = ?auto_1663135 ?auto_1663136 ) ) ( not ( = ?auto_1663135 ?auto_1663137 ) ) ( not ( = ?auto_1663135 ?auto_1663138 ) ) ( not ( = ?auto_1663135 ?auto_1663139 ) ) ( not ( = ?auto_1663135 ?auto_1663140 ) ) ( not ( = ?auto_1663135 ?auto_1663141 ) ) ( not ( = ?auto_1663135 ?auto_1663142 ) ) ( not ( = ?auto_1663135 ?auto_1663143 ) ) ( not ( = ?auto_1663135 ?auto_1663144 ) ) ( not ( = ?auto_1663135 ?auto_1663145 ) ) ( not ( = ?auto_1663135 ?auto_1663146 ) ) ( not ( = ?auto_1663135 ?auto_1663147 ) ) ( not ( = ?auto_1663135 ?auto_1663148 ) ) ( not ( = ?auto_1663135 ?auto_1663149 ) ) ( not ( = ?auto_1663136 ?auto_1663137 ) ) ( not ( = ?auto_1663136 ?auto_1663138 ) ) ( not ( = ?auto_1663136 ?auto_1663139 ) ) ( not ( = ?auto_1663136 ?auto_1663140 ) ) ( not ( = ?auto_1663136 ?auto_1663141 ) ) ( not ( = ?auto_1663136 ?auto_1663142 ) ) ( not ( = ?auto_1663136 ?auto_1663143 ) ) ( not ( = ?auto_1663136 ?auto_1663144 ) ) ( not ( = ?auto_1663136 ?auto_1663145 ) ) ( not ( = ?auto_1663136 ?auto_1663146 ) ) ( not ( = ?auto_1663136 ?auto_1663147 ) ) ( not ( = ?auto_1663136 ?auto_1663148 ) ) ( not ( = ?auto_1663136 ?auto_1663149 ) ) ( not ( = ?auto_1663137 ?auto_1663138 ) ) ( not ( = ?auto_1663137 ?auto_1663139 ) ) ( not ( = ?auto_1663137 ?auto_1663140 ) ) ( not ( = ?auto_1663137 ?auto_1663141 ) ) ( not ( = ?auto_1663137 ?auto_1663142 ) ) ( not ( = ?auto_1663137 ?auto_1663143 ) ) ( not ( = ?auto_1663137 ?auto_1663144 ) ) ( not ( = ?auto_1663137 ?auto_1663145 ) ) ( not ( = ?auto_1663137 ?auto_1663146 ) ) ( not ( = ?auto_1663137 ?auto_1663147 ) ) ( not ( = ?auto_1663137 ?auto_1663148 ) ) ( not ( = ?auto_1663137 ?auto_1663149 ) ) ( not ( = ?auto_1663138 ?auto_1663139 ) ) ( not ( = ?auto_1663138 ?auto_1663140 ) ) ( not ( = ?auto_1663138 ?auto_1663141 ) ) ( not ( = ?auto_1663138 ?auto_1663142 ) ) ( not ( = ?auto_1663138 ?auto_1663143 ) ) ( not ( = ?auto_1663138 ?auto_1663144 ) ) ( not ( = ?auto_1663138 ?auto_1663145 ) ) ( not ( = ?auto_1663138 ?auto_1663146 ) ) ( not ( = ?auto_1663138 ?auto_1663147 ) ) ( not ( = ?auto_1663138 ?auto_1663148 ) ) ( not ( = ?auto_1663138 ?auto_1663149 ) ) ( not ( = ?auto_1663139 ?auto_1663140 ) ) ( not ( = ?auto_1663139 ?auto_1663141 ) ) ( not ( = ?auto_1663139 ?auto_1663142 ) ) ( not ( = ?auto_1663139 ?auto_1663143 ) ) ( not ( = ?auto_1663139 ?auto_1663144 ) ) ( not ( = ?auto_1663139 ?auto_1663145 ) ) ( not ( = ?auto_1663139 ?auto_1663146 ) ) ( not ( = ?auto_1663139 ?auto_1663147 ) ) ( not ( = ?auto_1663139 ?auto_1663148 ) ) ( not ( = ?auto_1663139 ?auto_1663149 ) ) ( not ( = ?auto_1663140 ?auto_1663141 ) ) ( not ( = ?auto_1663140 ?auto_1663142 ) ) ( not ( = ?auto_1663140 ?auto_1663143 ) ) ( not ( = ?auto_1663140 ?auto_1663144 ) ) ( not ( = ?auto_1663140 ?auto_1663145 ) ) ( not ( = ?auto_1663140 ?auto_1663146 ) ) ( not ( = ?auto_1663140 ?auto_1663147 ) ) ( not ( = ?auto_1663140 ?auto_1663148 ) ) ( not ( = ?auto_1663140 ?auto_1663149 ) ) ( not ( = ?auto_1663141 ?auto_1663142 ) ) ( not ( = ?auto_1663141 ?auto_1663143 ) ) ( not ( = ?auto_1663141 ?auto_1663144 ) ) ( not ( = ?auto_1663141 ?auto_1663145 ) ) ( not ( = ?auto_1663141 ?auto_1663146 ) ) ( not ( = ?auto_1663141 ?auto_1663147 ) ) ( not ( = ?auto_1663141 ?auto_1663148 ) ) ( not ( = ?auto_1663141 ?auto_1663149 ) ) ( not ( = ?auto_1663142 ?auto_1663143 ) ) ( not ( = ?auto_1663142 ?auto_1663144 ) ) ( not ( = ?auto_1663142 ?auto_1663145 ) ) ( not ( = ?auto_1663142 ?auto_1663146 ) ) ( not ( = ?auto_1663142 ?auto_1663147 ) ) ( not ( = ?auto_1663142 ?auto_1663148 ) ) ( not ( = ?auto_1663142 ?auto_1663149 ) ) ( not ( = ?auto_1663143 ?auto_1663144 ) ) ( not ( = ?auto_1663143 ?auto_1663145 ) ) ( not ( = ?auto_1663143 ?auto_1663146 ) ) ( not ( = ?auto_1663143 ?auto_1663147 ) ) ( not ( = ?auto_1663143 ?auto_1663148 ) ) ( not ( = ?auto_1663143 ?auto_1663149 ) ) ( not ( = ?auto_1663144 ?auto_1663145 ) ) ( not ( = ?auto_1663144 ?auto_1663146 ) ) ( not ( = ?auto_1663144 ?auto_1663147 ) ) ( not ( = ?auto_1663144 ?auto_1663148 ) ) ( not ( = ?auto_1663144 ?auto_1663149 ) ) ( not ( = ?auto_1663145 ?auto_1663146 ) ) ( not ( = ?auto_1663145 ?auto_1663147 ) ) ( not ( = ?auto_1663145 ?auto_1663148 ) ) ( not ( = ?auto_1663145 ?auto_1663149 ) ) ( not ( = ?auto_1663146 ?auto_1663147 ) ) ( not ( = ?auto_1663146 ?auto_1663148 ) ) ( not ( = ?auto_1663146 ?auto_1663149 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663147 ?auto_1663148 ?auto_1663149 )
      ( MAKE-14CRATE-VERIFY ?auto_1663135 ?auto_1663136 ?auto_1663137 ?auto_1663138 ?auto_1663139 ?auto_1663140 ?auto_1663141 ?auto_1663142 ?auto_1663143 ?auto_1663144 ?auto_1663145 ?auto_1663146 ?auto_1663147 ?auto_1663148 ?auto_1663149 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663324 - SURFACE
      ?auto_1663325 - SURFACE
      ?auto_1663326 - SURFACE
      ?auto_1663327 - SURFACE
      ?auto_1663328 - SURFACE
      ?auto_1663329 - SURFACE
      ?auto_1663330 - SURFACE
      ?auto_1663331 - SURFACE
      ?auto_1663332 - SURFACE
      ?auto_1663333 - SURFACE
      ?auto_1663334 - SURFACE
      ?auto_1663335 - SURFACE
      ?auto_1663336 - SURFACE
      ?auto_1663337 - SURFACE
      ?auto_1663338 - SURFACE
    )
    :vars
    (
      ?auto_1663341 - HOIST
      ?auto_1663340 - PLACE
      ?auto_1663343 - TRUCK
      ?auto_1663339 - PLACE
      ?auto_1663342 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663341 ?auto_1663340 ) ( SURFACE-AT ?auto_1663337 ?auto_1663340 ) ( CLEAR ?auto_1663337 ) ( IS-CRATE ?auto_1663338 ) ( not ( = ?auto_1663337 ?auto_1663338 ) ) ( AVAILABLE ?auto_1663341 ) ( ON ?auto_1663337 ?auto_1663336 ) ( not ( = ?auto_1663336 ?auto_1663337 ) ) ( not ( = ?auto_1663336 ?auto_1663338 ) ) ( TRUCK-AT ?auto_1663343 ?auto_1663339 ) ( not ( = ?auto_1663339 ?auto_1663340 ) ) ( HOIST-AT ?auto_1663342 ?auto_1663339 ) ( LIFTING ?auto_1663342 ?auto_1663338 ) ( not ( = ?auto_1663341 ?auto_1663342 ) ) ( ON ?auto_1663325 ?auto_1663324 ) ( ON ?auto_1663326 ?auto_1663325 ) ( ON ?auto_1663327 ?auto_1663326 ) ( ON ?auto_1663328 ?auto_1663327 ) ( ON ?auto_1663329 ?auto_1663328 ) ( ON ?auto_1663330 ?auto_1663329 ) ( ON ?auto_1663331 ?auto_1663330 ) ( ON ?auto_1663332 ?auto_1663331 ) ( ON ?auto_1663333 ?auto_1663332 ) ( ON ?auto_1663334 ?auto_1663333 ) ( ON ?auto_1663335 ?auto_1663334 ) ( ON ?auto_1663336 ?auto_1663335 ) ( not ( = ?auto_1663324 ?auto_1663325 ) ) ( not ( = ?auto_1663324 ?auto_1663326 ) ) ( not ( = ?auto_1663324 ?auto_1663327 ) ) ( not ( = ?auto_1663324 ?auto_1663328 ) ) ( not ( = ?auto_1663324 ?auto_1663329 ) ) ( not ( = ?auto_1663324 ?auto_1663330 ) ) ( not ( = ?auto_1663324 ?auto_1663331 ) ) ( not ( = ?auto_1663324 ?auto_1663332 ) ) ( not ( = ?auto_1663324 ?auto_1663333 ) ) ( not ( = ?auto_1663324 ?auto_1663334 ) ) ( not ( = ?auto_1663324 ?auto_1663335 ) ) ( not ( = ?auto_1663324 ?auto_1663336 ) ) ( not ( = ?auto_1663324 ?auto_1663337 ) ) ( not ( = ?auto_1663324 ?auto_1663338 ) ) ( not ( = ?auto_1663325 ?auto_1663326 ) ) ( not ( = ?auto_1663325 ?auto_1663327 ) ) ( not ( = ?auto_1663325 ?auto_1663328 ) ) ( not ( = ?auto_1663325 ?auto_1663329 ) ) ( not ( = ?auto_1663325 ?auto_1663330 ) ) ( not ( = ?auto_1663325 ?auto_1663331 ) ) ( not ( = ?auto_1663325 ?auto_1663332 ) ) ( not ( = ?auto_1663325 ?auto_1663333 ) ) ( not ( = ?auto_1663325 ?auto_1663334 ) ) ( not ( = ?auto_1663325 ?auto_1663335 ) ) ( not ( = ?auto_1663325 ?auto_1663336 ) ) ( not ( = ?auto_1663325 ?auto_1663337 ) ) ( not ( = ?auto_1663325 ?auto_1663338 ) ) ( not ( = ?auto_1663326 ?auto_1663327 ) ) ( not ( = ?auto_1663326 ?auto_1663328 ) ) ( not ( = ?auto_1663326 ?auto_1663329 ) ) ( not ( = ?auto_1663326 ?auto_1663330 ) ) ( not ( = ?auto_1663326 ?auto_1663331 ) ) ( not ( = ?auto_1663326 ?auto_1663332 ) ) ( not ( = ?auto_1663326 ?auto_1663333 ) ) ( not ( = ?auto_1663326 ?auto_1663334 ) ) ( not ( = ?auto_1663326 ?auto_1663335 ) ) ( not ( = ?auto_1663326 ?auto_1663336 ) ) ( not ( = ?auto_1663326 ?auto_1663337 ) ) ( not ( = ?auto_1663326 ?auto_1663338 ) ) ( not ( = ?auto_1663327 ?auto_1663328 ) ) ( not ( = ?auto_1663327 ?auto_1663329 ) ) ( not ( = ?auto_1663327 ?auto_1663330 ) ) ( not ( = ?auto_1663327 ?auto_1663331 ) ) ( not ( = ?auto_1663327 ?auto_1663332 ) ) ( not ( = ?auto_1663327 ?auto_1663333 ) ) ( not ( = ?auto_1663327 ?auto_1663334 ) ) ( not ( = ?auto_1663327 ?auto_1663335 ) ) ( not ( = ?auto_1663327 ?auto_1663336 ) ) ( not ( = ?auto_1663327 ?auto_1663337 ) ) ( not ( = ?auto_1663327 ?auto_1663338 ) ) ( not ( = ?auto_1663328 ?auto_1663329 ) ) ( not ( = ?auto_1663328 ?auto_1663330 ) ) ( not ( = ?auto_1663328 ?auto_1663331 ) ) ( not ( = ?auto_1663328 ?auto_1663332 ) ) ( not ( = ?auto_1663328 ?auto_1663333 ) ) ( not ( = ?auto_1663328 ?auto_1663334 ) ) ( not ( = ?auto_1663328 ?auto_1663335 ) ) ( not ( = ?auto_1663328 ?auto_1663336 ) ) ( not ( = ?auto_1663328 ?auto_1663337 ) ) ( not ( = ?auto_1663328 ?auto_1663338 ) ) ( not ( = ?auto_1663329 ?auto_1663330 ) ) ( not ( = ?auto_1663329 ?auto_1663331 ) ) ( not ( = ?auto_1663329 ?auto_1663332 ) ) ( not ( = ?auto_1663329 ?auto_1663333 ) ) ( not ( = ?auto_1663329 ?auto_1663334 ) ) ( not ( = ?auto_1663329 ?auto_1663335 ) ) ( not ( = ?auto_1663329 ?auto_1663336 ) ) ( not ( = ?auto_1663329 ?auto_1663337 ) ) ( not ( = ?auto_1663329 ?auto_1663338 ) ) ( not ( = ?auto_1663330 ?auto_1663331 ) ) ( not ( = ?auto_1663330 ?auto_1663332 ) ) ( not ( = ?auto_1663330 ?auto_1663333 ) ) ( not ( = ?auto_1663330 ?auto_1663334 ) ) ( not ( = ?auto_1663330 ?auto_1663335 ) ) ( not ( = ?auto_1663330 ?auto_1663336 ) ) ( not ( = ?auto_1663330 ?auto_1663337 ) ) ( not ( = ?auto_1663330 ?auto_1663338 ) ) ( not ( = ?auto_1663331 ?auto_1663332 ) ) ( not ( = ?auto_1663331 ?auto_1663333 ) ) ( not ( = ?auto_1663331 ?auto_1663334 ) ) ( not ( = ?auto_1663331 ?auto_1663335 ) ) ( not ( = ?auto_1663331 ?auto_1663336 ) ) ( not ( = ?auto_1663331 ?auto_1663337 ) ) ( not ( = ?auto_1663331 ?auto_1663338 ) ) ( not ( = ?auto_1663332 ?auto_1663333 ) ) ( not ( = ?auto_1663332 ?auto_1663334 ) ) ( not ( = ?auto_1663332 ?auto_1663335 ) ) ( not ( = ?auto_1663332 ?auto_1663336 ) ) ( not ( = ?auto_1663332 ?auto_1663337 ) ) ( not ( = ?auto_1663332 ?auto_1663338 ) ) ( not ( = ?auto_1663333 ?auto_1663334 ) ) ( not ( = ?auto_1663333 ?auto_1663335 ) ) ( not ( = ?auto_1663333 ?auto_1663336 ) ) ( not ( = ?auto_1663333 ?auto_1663337 ) ) ( not ( = ?auto_1663333 ?auto_1663338 ) ) ( not ( = ?auto_1663334 ?auto_1663335 ) ) ( not ( = ?auto_1663334 ?auto_1663336 ) ) ( not ( = ?auto_1663334 ?auto_1663337 ) ) ( not ( = ?auto_1663334 ?auto_1663338 ) ) ( not ( = ?auto_1663335 ?auto_1663336 ) ) ( not ( = ?auto_1663335 ?auto_1663337 ) ) ( not ( = ?auto_1663335 ?auto_1663338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663336 ?auto_1663337 ?auto_1663338 )
      ( MAKE-14CRATE-VERIFY ?auto_1663324 ?auto_1663325 ?auto_1663326 ?auto_1663327 ?auto_1663328 ?auto_1663329 ?auto_1663330 ?auto_1663331 ?auto_1663332 ?auto_1663333 ?auto_1663334 ?auto_1663335 ?auto_1663336 ?auto_1663337 ?auto_1663338 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663527 - SURFACE
      ?auto_1663528 - SURFACE
      ?auto_1663529 - SURFACE
      ?auto_1663530 - SURFACE
      ?auto_1663531 - SURFACE
      ?auto_1663532 - SURFACE
      ?auto_1663533 - SURFACE
      ?auto_1663534 - SURFACE
      ?auto_1663535 - SURFACE
      ?auto_1663536 - SURFACE
      ?auto_1663537 - SURFACE
      ?auto_1663538 - SURFACE
      ?auto_1663539 - SURFACE
      ?auto_1663540 - SURFACE
      ?auto_1663541 - SURFACE
    )
    :vars
    (
      ?auto_1663544 - HOIST
      ?auto_1663546 - PLACE
      ?auto_1663545 - TRUCK
      ?auto_1663547 - PLACE
      ?auto_1663542 - HOIST
      ?auto_1663543 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663544 ?auto_1663546 ) ( SURFACE-AT ?auto_1663540 ?auto_1663546 ) ( CLEAR ?auto_1663540 ) ( IS-CRATE ?auto_1663541 ) ( not ( = ?auto_1663540 ?auto_1663541 ) ) ( AVAILABLE ?auto_1663544 ) ( ON ?auto_1663540 ?auto_1663539 ) ( not ( = ?auto_1663539 ?auto_1663540 ) ) ( not ( = ?auto_1663539 ?auto_1663541 ) ) ( TRUCK-AT ?auto_1663545 ?auto_1663547 ) ( not ( = ?auto_1663547 ?auto_1663546 ) ) ( HOIST-AT ?auto_1663542 ?auto_1663547 ) ( not ( = ?auto_1663544 ?auto_1663542 ) ) ( AVAILABLE ?auto_1663542 ) ( SURFACE-AT ?auto_1663541 ?auto_1663547 ) ( ON ?auto_1663541 ?auto_1663543 ) ( CLEAR ?auto_1663541 ) ( not ( = ?auto_1663540 ?auto_1663543 ) ) ( not ( = ?auto_1663541 ?auto_1663543 ) ) ( not ( = ?auto_1663539 ?auto_1663543 ) ) ( ON ?auto_1663528 ?auto_1663527 ) ( ON ?auto_1663529 ?auto_1663528 ) ( ON ?auto_1663530 ?auto_1663529 ) ( ON ?auto_1663531 ?auto_1663530 ) ( ON ?auto_1663532 ?auto_1663531 ) ( ON ?auto_1663533 ?auto_1663532 ) ( ON ?auto_1663534 ?auto_1663533 ) ( ON ?auto_1663535 ?auto_1663534 ) ( ON ?auto_1663536 ?auto_1663535 ) ( ON ?auto_1663537 ?auto_1663536 ) ( ON ?auto_1663538 ?auto_1663537 ) ( ON ?auto_1663539 ?auto_1663538 ) ( not ( = ?auto_1663527 ?auto_1663528 ) ) ( not ( = ?auto_1663527 ?auto_1663529 ) ) ( not ( = ?auto_1663527 ?auto_1663530 ) ) ( not ( = ?auto_1663527 ?auto_1663531 ) ) ( not ( = ?auto_1663527 ?auto_1663532 ) ) ( not ( = ?auto_1663527 ?auto_1663533 ) ) ( not ( = ?auto_1663527 ?auto_1663534 ) ) ( not ( = ?auto_1663527 ?auto_1663535 ) ) ( not ( = ?auto_1663527 ?auto_1663536 ) ) ( not ( = ?auto_1663527 ?auto_1663537 ) ) ( not ( = ?auto_1663527 ?auto_1663538 ) ) ( not ( = ?auto_1663527 ?auto_1663539 ) ) ( not ( = ?auto_1663527 ?auto_1663540 ) ) ( not ( = ?auto_1663527 ?auto_1663541 ) ) ( not ( = ?auto_1663527 ?auto_1663543 ) ) ( not ( = ?auto_1663528 ?auto_1663529 ) ) ( not ( = ?auto_1663528 ?auto_1663530 ) ) ( not ( = ?auto_1663528 ?auto_1663531 ) ) ( not ( = ?auto_1663528 ?auto_1663532 ) ) ( not ( = ?auto_1663528 ?auto_1663533 ) ) ( not ( = ?auto_1663528 ?auto_1663534 ) ) ( not ( = ?auto_1663528 ?auto_1663535 ) ) ( not ( = ?auto_1663528 ?auto_1663536 ) ) ( not ( = ?auto_1663528 ?auto_1663537 ) ) ( not ( = ?auto_1663528 ?auto_1663538 ) ) ( not ( = ?auto_1663528 ?auto_1663539 ) ) ( not ( = ?auto_1663528 ?auto_1663540 ) ) ( not ( = ?auto_1663528 ?auto_1663541 ) ) ( not ( = ?auto_1663528 ?auto_1663543 ) ) ( not ( = ?auto_1663529 ?auto_1663530 ) ) ( not ( = ?auto_1663529 ?auto_1663531 ) ) ( not ( = ?auto_1663529 ?auto_1663532 ) ) ( not ( = ?auto_1663529 ?auto_1663533 ) ) ( not ( = ?auto_1663529 ?auto_1663534 ) ) ( not ( = ?auto_1663529 ?auto_1663535 ) ) ( not ( = ?auto_1663529 ?auto_1663536 ) ) ( not ( = ?auto_1663529 ?auto_1663537 ) ) ( not ( = ?auto_1663529 ?auto_1663538 ) ) ( not ( = ?auto_1663529 ?auto_1663539 ) ) ( not ( = ?auto_1663529 ?auto_1663540 ) ) ( not ( = ?auto_1663529 ?auto_1663541 ) ) ( not ( = ?auto_1663529 ?auto_1663543 ) ) ( not ( = ?auto_1663530 ?auto_1663531 ) ) ( not ( = ?auto_1663530 ?auto_1663532 ) ) ( not ( = ?auto_1663530 ?auto_1663533 ) ) ( not ( = ?auto_1663530 ?auto_1663534 ) ) ( not ( = ?auto_1663530 ?auto_1663535 ) ) ( not ( = ?auto_1663530 ?auto_1663536 ) ) ( not ( = ?auto_1663530 ?auto_1663537 ) ) ( not ( = ?auto_1663530 ?auto_1663538 ) ) ( not ( = ?auto_1663530 ?auto_1663539 ) ) ( not ( = ?auto_1663530 ?auto_1663540 ) ) ( not ( = ?auto_1663530 ?auto_1663541 ) ) ( not ( = ?auto_1663530 ?auto_1663543 ) ) ( not ( = ?auto_1663531 ?auto_1663532 ) ) ( not ( = ?auto_1663531 ?auto_1663533 ) ) ( not ( = ?auto_1663531 ?auto_1663534 ) ) ( not ( = ?auto_1663531 ?auto_1663535 ) ) ( not ( = ?auto_1663531 ?auto_1663536 ) ) ( not ( = ?auto_1663531 ?auto_1663537 ) ) ( not ( = ?auto_1663531 ?auto_1663538 ) ) ( not ( = ?auto_1663531 ?auto_1663539 ) ) ( not ( = ?auto_1663531 ?auto_1663540 ) ) ( not ( = ?auto_1663531 ?auto_1663541 ) ) ( not ( = ?auto_1663531 ?auto_1663543 ) ) ( not ( = ?auto_1663532 ?auto_1663533 ) ) ( not ( = ?auto_1663532 ?auto_1663534 ) ) ( not ( = ?auto_1663532 ?auto_1663535 ) ) ( not ( = ?auto_1663532 ?auto_1663536 ) ) ( not ( = ?auto_1663532 ?auto_1663537 ) ) ( not ( = ?auto_1663532 ?auto_1663538 ) ) ( not ( = ?auto_1663532 ?auto_1663539 ) ) ( not ( = ?auto_1663532 ?auto_1663540 ) ) ( not ( = ?auto_1663532 ?auto_1663541 ) ) ( not ( = ?auto_1663532 ?auto_1663543 ) ) ( not ( = ?auto_1663533 ?auto_1663534 ) ) ( not ( = ?auto_1663533 ?auto_1663535 ) ) ( not ( = ?auto_1663533 ?auto_1663536 ) ) ( not ( = ?auto_1663533 ?auto_1663537 ) ) ( not ( = ?auto_1663533 ?auto_1663538 ) ) ( not ( = ?auto_1663533 ?auto_1663539 ) ) ( not ( = ?auto_1663533 ?auto_1663540 ) ) ( not ( = ?auto_1663533 ?auto_1663541 ) ) ( not ( = ?auto_1663533 ?auto_1663543 ) ) ( not ( = ?auto_1663534 ?auto_1663535 ) ) ( not ( = ?auto_1663534 ?auto_1663536 ) ) ( not ( = ?auto_1663534 ?auto_1663537 ) ) ( not ( = ?auto_1663534 ?auto_1663538 ) ) ( not ( = ?auto_1663534 ?auto_1663539 ) ) ( not ( = ?auto_1663534 ?auto_1663540 ) ) ( not ( = ?auto_1663534 ?auto_1663541 ) ) ( not ( = ?auto_1663534 ?auto_1663543 ) ) ( not ( = ?auto_1663535 ?auto_1663536 ) ) ( not ( = ?auto_1663535 ?auto_1663537 ) ) ( not ( = ?auto_1663535 ?auto_1663538 ) ) ( not ( = ?auto_1663535 ?auto_1663539 ) ) ( not ( = ?auto_1663535 ?auto_1663540 ) ) ( not ( = ?auto_1663535 ?auto_1663541 ) ) ( not ( = ?auto_1663535 ?auto_1663543 ) ) ( not ( = ?auto_1663536 ?auto_1663537 ) ) ( not ( = ?auto_1663536 ?auto_1663538 ) ) ( not ( = ?auto_1663536 ?auto_1663539 ) ) ( not ( = ?auto_1663536 ?auto_1663540 ) ) ( not ( = ?auto_1663536 ?auto_1663541 ) ) ( not ( = ?auto_1663536 ?auto_1663543 ) ) ( not ( = ?auto_1663537 ?auto_1663538 ) ) ( not ( = ?auto_1663537 ?auto_1663539 ) ) ( not ( = ?auto_1663537 ?auto_1663540 ) ) ( not ( = ?auto_1663537 ?auto_1663541 ) ) ( not ( = ?auto_1663537 ?auto_1663543 ) ) ( not ( = ?auto_1663538 ?auto_1663539 ) ) ( not ( = ?auto_1663538 ?auto_1663540 ) ) ( not ( = ?auto_1663538 ?auto_1663541 ) ) ( not ( = ?auto_1663538 ?auto_1663543 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663539 ?auto_1663540 ?auto_1663541 )
      ( MAKE-14CRATE-VERIFY ?auto_1663527 ?auto_1663528 ?auto_1663529 ?auto_1663530 ?auto_1663531 ?auto_1663532 ?auto_1663533 ?auto_1663534 ?auto_1663535 ?auto_1663536 ?auto_1663537 ?auto_1663538 ?auto_1663539 ?auto_1663540 ?auto_1663541 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663731 - SURFACE
      ?auto_1663732 - SURFACE
      ?auto_1663733 - SURFACE
      ?auto_1663734 - SURFACE
      ?auto_1663735 - SURFACE
      ?auto_1663736 - SURFACE
      ?auto_1663737 - SURFACE
      ?auto_1663738 - SURFACE
      ?auto_1663739 - SURFACE
      ?auto_1663740 - SURFACE
      ?auto_1663741 - SURFACE
      ?auto_1663742 - SURFACE
      ?auto_1663743 - SURFACE
      ?auto_1663744 - SURFACE
      ?auto_1663745 - SURFACE
    )
    :vars
    (
      ?auto_1663749 - HOIST
      ?auto_1663748 - PLACE
      ?auto_1663751 - PLACE
      ?auto_1663750 - HOIST
      ?auto_1663746 - SURFACE
      ?auto_1663747 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663749 ?auto_1663748 ) ( SURFACE-AT ?auto_1663744 ?auto_1663748 ) ( CLEAR ?auto_1663744 ) ( IS-CRATE ?auto_1663745 ) ( not ( = ?auto_1663744 ?auto_1663745 ) ) ( AVAILABLE ?auto_1663749 ) ( ON ?auto_1663744 ?auto_1663743 ) ( not ( = ?auto_1663743 ?auto_1663744 ) ) ( not ( = ?auto_1663743 ?auto_1663745 ) ) ( not ( = ?auto_1663751 ?auto_1663748 ) ) ( HOIST-AT ?auto_1663750 ?auto_1663751 ) ( not ( = ?auto_1663749 ?auto_1663750 ) ) ( AVAILABLE ?auto_1663750 ) ( SURFACE-AT ?auto_1663745 ?auto_1663751 ) ( ON ?auto_1663745 ?auto_1663746 ) ( CLEAR ?auto_1663745 ) ( not ( = ?auto_1663744 ?auto_1663746 ) ) ( not ( = ?auto_1663745 ?auto_1663746 ) ) ( not ( = ?auto_1663743 ?auto_1663746 ) ) ( TRUCK-AT ?auto_1663747 ?auto_1663748 ) ( ON ?auto_1663732 ?auto_1663731 ) ( ON ?auto_1663733 ?auto_1663732 ) ( ON ?auto_1663734 ?auto_1663733 ) ( ON ?auto_1663735 ?auto_1663734 ) ( ON ?auto_1663736 ?auto_1663735 ) ( ON ?auto_1663737 ?auto_1663736 ) ( ON ?auto_1663738 ?auto_1663737 ) ( ON ?auto_1663739 ?auto_1663738 ) ( ON ?auto_1663740 ?auto_1663739 ) ( ON ?auto_1663741 ?auto_1663740 ) ( ON ?auto_1663742 ?auto_1663741 ) ( ON ?auto_1663743 ?auto_1663742 ) ( not ( = ?auto_1663731 ?auto_1663732 ) ) ( not ( = ?auto_1663731 ?auto_1663733 ) ) ( not ( = ?auto_1663731 ?auto_1663734 ) ) ( not ( = ?auto_1663731 ?auto_1663735 ) ) ( not ( = ?auto_1663731 ?auto_1663736 ) ) ( not ( = ?auto_1663731 ?auto_1663737 ) ) ( not ( = ?auto_1663731 ?auto_1663738 ) ) ( not ( = ?auto_1663731 ?auto_1663739 ) ) ( not ( = ?auto_1663731 ?auto_1663740 ) ) ( not ( = ?auto_1663731 ?auto_1663741 ) ) ( not ( = ?auto_1663731 ?auto_1663742 ) ) ( not ( = ?auto_1663731 ?auto_1663743 ) ) ( not ( = ?auto_1663731 ?auto_1663744 ) ) ( not ( = ?auto_1663731 ?auto_1663745 ) ) ( not ( = ?auto_1663731 ?auto_1663746 ) ) ( not ( = ?auto_1663732 ?auto_1663733 ) ) ( not ( = ?auto_1663732 ?auto_1663734 ) ) ( not ( = ?auto_1663732 ?auto_1663735 ) ) ( not ( = ?auto_1663732 ?auto_1663736 ) ) ( not ( = ?auto_1663732 ?auto_1663737 ) ) ( not ( = ?auto_1663732 ?auto_1663738 ) ) ( not ( = ?auto_1663732 ?auto_1663739 ) ) ( not ( = ?auto_1663732 ?auto_1663740 ) ) ( not ( = ?auto_1663732 ?auto_1663741 ) ) ( not ( = ?auto_1663732 ?auto_1663742 ) ) ( not ( = ?auto_1663732 ?auto_1663743 ) ) ( not ( = ?auto_1663732 ?auto_1663744 ) ) ( not ( = ?auto_1663732 ?auto_1663745 ) ) ( not ( = ?auto_1663732 ?auto_1663746 ) ) ( not ( = ?auto_1663733 ?auto_1663734 ) ) ( not ( = ?auto_1663733 ?auto_1663735 ) ) ( not ( = ?auto_1663733 ?auto_1663736 ) ) ( not ( = ?auto_1663733 ?auto_1663737 ) ) ( not ( = ?auto_1663733 ?auto_1663738 ) ) ( not ( = ?auto_1663733 ?auto_1663739 ) ) ( not ( = ?auto_1663733 ?auto_1663740 ) ) ( not ( = ?auto_1663733 ?auto_1663741 ) ) ( not ( = ?auto_1663733 ?auto_1663742 ) ) ( not ( = ?auto_1663733 ?auto_1663743 ) ) ( not ( = ?auto_1663733 ?auto_1663744 ) ) ( not ( = ?auto_1663733 ?auto_1663745 ) ) ( not ( = ?auto_1663733 ?auto_1663746 ) ) ( not ( = ?auto_1663734 ?auto_1663735 ) ) ( not ( = ?auto_1663734 ?auto_1663736 ) ) ( not ( = ?auto_1663734 ?auto_1663737 ) ) ( not ( = ?auto_1663734 ?auto_1663738 ) ) ( not ( = ?auto_1663734 ?auto_1663739 ) ) ( not ( = ?auto_1663734 ?auto_1663740 ) ) ( not ( = ?auto_1663734 ?auto_1663741 ) ) ( not ( = ?auto_1663734 ?auto_1663742 ) ) ( not ( = ?auto_1663734 ?auto_1663743 ) ) ( not ( = ?auto_1663734 ?auto_1663744 ) ) ( not ( = ?auto_1663734 ?auto_1663745 ) ) ( not ( = ?auto_1663734 ?auto_1663746 ) ) ( not ( = ?auto_1663735 ?auto_1663736 ) ) ( not ( = ?auto_1663735 ?auto_1663737 ) ) ( not ( = ?auto_1663735 ?auto_1663738 ) ) ( not ( = ?auto_1663735 ?auto_1663739 ) ) ( not ( = ?auto_1663735 ?auto_1663740 ) ) ( not ( = ?auto_1663735 ?auto_1663741 ) ) ( not ( = ?auto_1663735 ?auto_1663742 ) ) ( not ( = ?auto_1663735 ?auto_1663743 ) ) ( not ( = ?auto_1663735 ?auto_1663744 ) ) ( not ( = ?auto_1663735 ?auto_1663745 ) ) ( not ( = ?auto_1663735 ?auto_1663746 ) ) ( not ( = ?auto_1663736 ?auto_1663737 ) ) ( not ( = ?auto_1663736 ?auto_1663738 ) ) ( not ( = ?auto_1663736 ?auto_1663739 ) ) ( not ( = ?auto_1663736 ?auto_1663740 ) ) ( not ( = ?auto_1663736 ?auto_1663741 ) ) ( not ( = ?auto_1663736 ?auto_1663742 ) ) ( not ( = ?auto_1663736 ?auto_1663743 ) ) ( not ( = ?auto_1663736 ?auto_1663744 ) ) ( not ( = ?auto_1663736 ?auto_1663745 ) ) ( not ( = ?auto_1663736 ?auto_1663746 ) ) ( not ( = ?auto_1663737 ?auto_1663738 ) ) ( not ( = ?auto_1663737 ?auto_1663739 ) ) ( not ( = ?auto_1663737 ?auto_1663740 ) ) ( not ( = ?auto_1663737 ?auto_1663741 ) ) ( not ( = ?auto_1663737 ?auto_1663742 ) ) ( not ( = ?auto_1663737 ?auto_1663743 ) ) ( not ( = ?auto_1663737 ?auto_1663744 ) ) ( not ( = ?auto_1663737 ?auto_1663745 ) ) ( not ( = ?auto_1663737 ?auto_1663746 ) ) ( not ( = ?auto_1663738 ?auto_1663739 ) ) ( not ( = ?auto_1663738 ?auto_1663740 ) ) ( not ( = ?auto_1663738 ?auto_1663741 ) ) ( not ( = ?auto_1663738 ?auto_1663742 ) ) ( not ( = ?auto_1663738 ?auto_1663743 ) ) ( not ( = ?auto_1663738 ?auto_1663744 ) ) ( not ( = ?auto_1663738 ?auto_1663745 ) ) ( not ( = ?auto_1663738 ?auto_1663746 ) ) ( not ( = ?auto_1663739 ?auto_1663740 ) ) ( not ( = ?auto_1663739 ?auto_1663741 ) ) ( not ( = ?auto_1663739 ?auto_1663742 ) ) ( not ( = ?auto_1663739 ?auto_1663743 ) ) ( not ( = ?auto_1663739 ?auto_1663744 ) ) ( not ( = ?auto_1663739 ?auto_1663745 ) ) ( not ( = ?auto_1663739 ?auto_1663746 ) ) ( not ( = ?auto_1663740 ?auto_1663741 ) ) ( not ( = ?auto_1663740 ?auto_1663742 ) ) ( not ( = ?auto_1663740 ?auto_1663743 ) ) ( not ( = ?auto_1663740 ?auto_1663744 ) ) ( not ( = ?auto_1663740 ?auto_1663745 ) ) ( not ( = ?auto_1663740 ?auto_1663746 ) ) ( not ( = ?auto_1663741 ?auto_1663742 ) ) ( not ( = ?auto_1663741 ?auto_1663743 ) ) ( not ( = ?auto_1663741 ?auto_1663744 ) ) ( not ( = ?auto_1663741 ?auto_1663745 ) ) ( not ( = ?auto_1663741 ?auto_1663746 ) ) ( not ( = ?auto_1663742 ?auto_1663743 ) ) ( not ( = ?auto_1663742 ?auto_1663744 ) ) ( not ( = ?auto_1663742 ?auto_1663745 ) ) ( not ( = ?auto_1663742 ?auto_1663746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663743 ?auto_1663744 ?auto_1663745 )
      ( MAKE-14CRATE-VERIFY ?auto_1663731 ?auto_1663732 ?auto_1663733 ?auto_1663734 ?auto_1663735 ?auto_1663736 ?auto_1663737 ?auto_1663738 ?auto_1663739 ?auto_1663740 ?auto_1663741 ?auto_1663742 ?auto_1663743 ?auto_1663744 ?auto_1663745 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1663935 - SURFACE
      ?auto_1663936 - SURFACE
      ?auto_1663937 - SURFACE
      ?auto_1663938 - SURFACE
      ?auto_1663939 - SURFACE
      ?auto_1663940 - SURFACE
      ?auto_1663941 - SURFACE
      ?auto_1663942 - SURFACE
      ?auto_1663943 - SURFACE
      ?auto_1663944 - SURFACE
      ?auto_1663945 - SURFACE
      ?auto_1663946 - SURFACE
      ?auto_1663947 - SURFACE
      ?auto_1663948 - SURFACE
      ?auto_1663949 - SURFACE
    )
    :vars
    (
      ?auto_1663950 - HOIST
      ?auto_1663951 - PLACE
      ?auto_1663954 - PLACE
      ?auto_1663952 - HOIST
      ?auto_1663955 - SURFACE
      ?auto_1663953 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663950 ?auto_1663951 ) ( IS-CRATE ?auto_1663949 ) ( not ( = ?auto_1663948 ?auto_1663949 ) ) ( not ( = ?auto_1663947 ?auto_1663948 ) ) ( not ( = ?auto_1663947 ?auto_1663949 ) ) ( not ( = ?auto_1663954 ?auto_1663951 ) ) ( HOIST-AT ?auto_1663952 ?auto_1663954 ) ( not ( = ?auto_1663950 ?auto_1663952 ) ) ( AVAILABLE ?auto_1663952 ) ( SURFACE-AT ?auto_1663949 ?auto_1663954 ) ( ON ?auto_1663949 ?auto_1663955 ) ( CLEAR ?auto_1663949 ) ( not ( = ?auto_1663948 ?auto_1663955 ) ) ( not ( = ?auto_1663949 ?auto_1663955 ) ) ( not ( = ?auto_1663947 ?auto_1663955 ) ) ( TRUCK-AT ?auto_1663953 ?auto_1663951 ) ( SURFACE-AT ?auto_1663947 ?auto_1663951 ) ( CLEAR ?auto_1663947 ) ( LIFTING ?auto_1663950 ?auto_1663948 ) ( IS-CRATE ?auto_1663948 ) ( ON ?auto_1663936 ?auto_1663935 ) ( ON ?auto_1663937 ?auto_1663936 ) ( ON ?auto_1663938 ?auto_1663937 ) ( ON ?auto_1663939 ?auto_1663938 ) ( ON ?auto_1663940 ?auto_1663939 ) ( ON ?auto_1663941 ?auto_1663940 ) ( ON ?auto_1663942 ?auto_1663941 ) ( ON ?auto_1663943 ?auto_1663942 ) ( ON ?auto_1663944 ?auto_1663943 ) ( ON ?auto_1663945 ?auto_1663944 ) ( ON ?auto_1663946 ?auto_1663945 ) ( ON ?auto_1663947 ?auto_1663946 ) ( not ( = ?auto_1663935 ?auto_1663936 ) ) ( not ( = ?auto_1663935 ?auto_1663937 ) ) ( not ( = ?auto_1663935 ?auto_1663938 ) ) ( not ( = ?auto_1663935 ?auto_1663939 ) ) ( not ( = ?auto_1663935 ?auto_1663940 ) ) ( not ( = ?auto_1663935 ?auto_1663941 ) ) ( not ( = ?auto_1663935 ?auto_1663942 ) ) ( not ( = ?auto_1663935 ?auto_1663943 ) ) ( not ( = ?auto_1663935 ?auto_1663944 ) ) ( not ( = ?auto_1663935 ?auto_1663945 ) ) ( not ( = ?auto_1663935 ?auto_1663946 ) ) ( not ( = ?auto_1663935 ?auto_1663947 ) ) ( not ( = ?auto_1663935 ?auto_1663948 ) ) ( not ( = ?auto_1663935 ?auto_1663949 ) ) ( not ( = ?auto_1663935 ?auto_1663955 ) ) ( not ( = ?auto_1663936 ?auto_1663937 ) ) ( not ( = ?auto_1663936 ?auto_1663938 ) ) ( not ( = ?auto_1663936 ?auto_1663939 ) ) ( not ( = ?auto_1663936 ?auto_1663940 ) ) ( not ( = ?auto_1663936 ?auto_1663941 ) ) ( not ( = ?auto_1663936 ?auto_1663942 ) ) ( not ( = ?auto_1663936 ?auto_1663943 ) ) ( not ( = ?auto_1663936 ?auto_1663944 ) ) ( not ( = ?auto_1663936 ?auto_1663945 ) ) ( not ( = ?auto_1663936 ?auto_1663946 ) ) ( not ( = ?auto_1663936 ?auto_1663947 ) ) ( not ( = ?auto_1663936 ?auto_1663948 ) ) ( not ( = ?auto_1663936 ?auto_1663949 ) ) ( not ( = ?auto_1663936 ?auto_1663955 ) ) ( not ( = ?auto_1663937 ?auto_1663938 ) ) ( not ( = ?auto_1663937 ?auto_1663939 ) ) ( not ( = ?auto_1663937 ?auto_1663940 ) ) ( not ( = ?auto_1663937 ?auto_1663941 ) ) ( not ( = ?auto_1663937 ?auto_1663942 ) ) ( not ( = ?auto_1663937 ?auto_1663943 ) ) ( not ( = ?auto_1663937 ?auto_1663944 ) ) ( not ( = ?auto_1663937 ?auto_1663945 ) ) ( not ( = ?auto_1663937 ?auto_1663946 ) ) ( not ( = ?auto_1663937 ?auto_1663947 ) ) ( not ( = ?auto_1663937 ?auto_1663948 ) ) ( not ( = ?auto_1663937 ?auto_1663949 ) ) ( not ( = ?auto_1663937 ?auto_1663955 ) ) ( not ( = ?auto_1663938 ?auto_1663939 ) ) ( not ( = ?auto_1663938 ?auto_1663940 ) ) ( not ( = ?auto_1663938 ?auto_1663941 ) ) ( not ( = ?auto_1663938 ?auto_1663942 ) ) ( not ( = ?auto_1663938 ?auto_1663943 ) ) ( not ( = ?auto_1663938 ?auto_1663944 ) ) ( not ( = ?auto_1663938 ?auto_1663945 ) ) ( not ( = ?auto_1663938 ?auto_1663946 ) ) ( not ( = ?auto_1663938 ?auto_1663947 ) ) ( not ( = ?auto_1663938 ?auto_1663948 ) ) ( not ( = ?auto_1663938 ?auto_1663949 ) ) ( not ( = ?auto_1663938 ?auto_1663955 ) ) ( not ( = ?auto_1663939 ?auto_1663940 ) ) ( not ( = ?auto_1663939 ?auto_1663941 ) ) ( not ( = ?auto_1663939 ?auto_1663942 ) ) ( not ( = ?auto_1663939 ?auto_1663943 ) ) ( not ( = ?auto_1663939 ?auto_1663944 ) ) ( not ( = ?auto_1663939 ?auto_1663945 ) ) ( not ( = ?auto_1663939 ?auto_1663946 ) ) ( not ( = ?auto_1663939 ?auto_1663947 ) ) ( not ( = ?auto_1663939 ?auto_1663948 ) ) ( not ( = ?auto_1663939 ?auto_1663949 ) ) ( not ( = ?auto_1663939 ?auto_1663955 ) ) ( not ( = ?auto_1663940 ?auto_1663941 ) ) ( not ( = ?auto_1663940 ?auto_1663942 ) ) ( not ( = ?auto_1663940 ?auto_1663943 ) ) ( not ( = ?auto_1663940 ?auto_1663944 ) ) ( not ( = ?auto_1663940 ?auto_1663945 ) ) ( not ( = ?auto_1663940 ?auto_1663946 ) ) ( not ( = ?auto_1663940 ?auto_1663947 ) ) ( not ( = ?auto_1663940 ?auto_1663948 ) ) ( not ( = ?auto_1663940 ?auto_1663949 ) ) ( not ( = ?auto_1663940 ?auto_1663955 ) ) ( not ( = ?auto_1663941 ?auto_1663942 ) ) ( not ( = ?auto_1663941 ?auto_1663943 ) ) ( not ( = ?auto_1663941 ?auto_1663944 ) ) ( not ( = ?auto_1663941 ?auto_1663945 ) ) ( not ( = ?auto_1663941 ?auto_1663946 ) ) ( not ( = ?auto_1663941 ?auto_1663947 ) ) ( not ( = ?auto_1663941 ?auto_1663948 ) ) ( not ( = ?auto_1663941 ?auto_1663949 ) ) ( not ( = ?auto_1663941 ?auto_1663955 ) ) ( not ( = ?auto_1663942 ?auto_1663943 ) ) ( not ( = ?auto_1663942 ?auto_1663944 ) ) ( not ( = ?auto_1663942 ?auto_1663945 ) ) ( not ( = ?auto_1663942 ?auto_1663946 ) ) ( not ( = ?auto_1663942 ?auto_1663947 ) ) ( not ( = ?auto_1663942 ?auto_1663948 ) ) ( not ( = ?auto_1663942 ?auto_1663949 ) ) ( not ( = ?auto_1663942 ?auto_1663955 ) ) ( not ( = ?auto_1663943 ?auto_1663944 ) ) ( not ( = ?auto_1663943 ?auto_1663945 ) ) ( not ( = ?auto_1663943 ?auto_1663946 ) ) ( not ( = ?auto_1663943 ?auto_1663947 ) ) ( not ( = ?auto_1663943 ?auto_1663948 ) ) ( not ( = ?auto_1663943 ?auto_1663949 ) ) ( not ( = ?auto_1663943 ?auto_1663955 ) ) ( not ( = ?auto_1663944 ?auto_1663945 ) ) ( not ( = ?auto_1663944 ?auto_1663946 ) ) ( not ( = ?auto_1663944 ?auto_1663947 ) ) ( not ( = ?auto_1663944 ?auto_1663948 ) ) ( not ( = ?auto_1663944 ?auto_1663949 ) ) ( not ( = ?auto_1663944 ?auto_1663955 ) ) ( not ( = ?auto_1663945 ?auto_1663946 ) ) ( not ( = ?auto_1663945 ?auto_1663947 ) ) ( not ( = ?auto_1663945 ?auto_1663948 ) ) ( not ( = ?auto_1663945 ?auto_1663949 ) ) ( not ( = ?auto_1663945 ?auto_1663955 ) ) ( not ( = ?auto_1663946 ?auto_1663947 ) ) ( not ( = ?auto_1663946 ?auto_1663948 ) ) ( not ( = ?auto_1663946 ?auto_1663949 ) ) ( not ( = ?auto_1663946 ?auto_1663955 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1663947 ?auto_1663948 ?auto_1663949 )
      ( MAKE-14CRATE-VERIFY ?auto_1663935 ?auto_1663936 ?auto_1663937 ?auto_1663938 ?auto_1663939 ?auto_1663940 ?auto_1663941 ?auto_1663942 ?auto_1663943 ?auto_1663944 ?auto_1663945 ?auto_1663946 ?auto_1663947 ?auto_1663948 ?auto_1663949 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1664139 - SURFACE
      ?auto_1664140 - SURFACE
      ?auto_1664141 - SURFACE
      ?auto_1664142 - SURFACE
      ?auto_1664143 - SURFACE
      ?auto_1664144 - SURFACE
      ?auto_1664145 - SURFACE
      ?auto_1664146 - SURFACE
      ?auto_1664147 - SURFACE
      ?auto_1664148 - SURFACE
      ?auto_1664149 - SURFACE
      ?auto_1664150 - SURFACE
      ?auto_1664151 - SURFACE
      ?auto_1664152 - SURFACE
      ?auto_1664153 - SURFACE
    )
    :vars
    (
      ?auto_1664156 - HOIST
      ?auto_1664159 - PLACE
      ?auto_1664158 - PLACE
      ?auto_1664155 - HOIST
      ?auto_1664157 - SURFACE
      ?auto_1664154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1664156 ?auto_1664159 ) ( IS-CRATE ?auto_1664153 ) ( not ( = ?auto_1664152 ?auto_1664153 ) ) ( not ( = ?auto_1664151 ?auto_1664152 ) ) ( not ( = ?auto_1664151 ?auto_1664153 ) ) ( not ( = ?auto_1664158 ?auto_1664159 ) ) ( HOIST-AT ?auto_1664155 ?auto_1664158 ) ( not ( = ?auto_1664156 ?auto_1664155 ) ) ( AVAILABLE ?auto_1664155 ) ( SURFACE-AT ?auto_1664153 ?auto_1664158 ) ( ON ?auto_1664153 ?auto_1664157 ) ( CLEAR ?auto_1664153 ) ( not ( = ?auto_1664152 ?auto_1664157 ) ) ( not ( = ?auto_1664153 ?auto_1664157 ) ) ( not ( = ?auto_1664151 ?auto_1664157 ) ) ( TRUCK-AT ?auto_1664154 ?auto_1664159 ) ( SURFACE-AT ?auto_1664151 ?auto_1664159 ) ( CLEAR ?auto_1664151 ) ( IS-CRATE ?auto_1664152 ) ( AVAILABLE ?auto_1664156 ) ( IN ?auto_1664152 ?auto_1664154 ) ( ON ?auto_1664140 ?auto_1664139 ) ( ON ?auto_1664141 ?auto_1664140 ) ( ON ?auto_1664142 ?auto_1664141 ) ( ON ?auto_1664143 ?auto_1664142 ) ( ON ?auto_1664144 ?auto_1664143 ) ( ON ?auto_1664145 ?auto_1664144 ) ( ON ?auto_1664146 ?auto_1664145 ) ( ON ?auto_1664147 ?auto_1664146 ) ( ON ?auto_1664148 ?auto_1664147 ) ( ON ?auto_1664149 ?auto_1664148 ) ( ON ?auto_1664150 ?auto_1664149 ) ( ON ?auto_1664151 ?auto_1664150 ) ( not ( = ?auto_1664139 ?auto_1664140 ) ) ( not ( = ?auto_1664139 ?auto_1664141 ) ) ( not ( = ?auto_1664139 ?auto_1664142 ) ) ( not ( = ?auto_1664139 ?auto_1664143 ) ) ( not ( = ?auto_1664139 ?auto_1664144 ) ) ( not ( = ?auto_1664139 ?auto_1664145 ) ) ( not ( = ?auto_1664139 ?auto_1664146 ) ) ( not ( = ?auto_1664139 ?auto_1664147 ) ) ( not ( = ?auto_1664139 ?auto_1664148 ) ) ( not ( = ?auto_1664139 ?auto_1664149 ) ) ( not ( = ?auto_1664139 ?auto_1664150 ) ) ( not ( = ?auto_1664139 ?auto_1664151 ) ) ( not ( = ?auto_1664139 ?auto_1664152 ) ) ( not ( = ?auto_1664139 ?auto_1664153 ) ) ( not ( = ?auto_1664139 ?auto_1664157 ) ) ( not ( = ?auto_1664140 ?auto_1664141 ) ) ( not ( = ?auto_1664140 ?auto_1664142 ) ) ( not ( = ?auto_1664140 ?auto_1664143 ) ) ( not ( = ?auto_1664140 ?auto_1664144 ) ) ( not ( = ?auto_1664140 ?auto_1664145 ) ) ( not ( = ?auto_1664140 ?auto_1664146 ) ) ( not ( = ?auto_1664140 ?auto_1664147 ) ) ( not ( = ?auto_1664140 ?auto_1664148 ) ) ( not ( = ?auto_1664140 ?auto_1664149 ) ) ( not ( = ?auto_1664140 ?auto_1664150 ) ) ( not ( = ?auto_1664140 ?auto_1664151 ) ) ( not ( = ?auto_1664140 ?auto_1664152 ) ) ( not ( = ?auto_1664140 ?auto_1664153 ) ) ( not ( = ?auto_1664140 ?auto_1664157 ) ) ( not ( = ?auto_1664141 ?auto_1664142 ) ) ( not ( = ?auto_1664141 ?auto_1664143 ) ) ( not ( = ?auto_1664141 ?auto_1664144 ) ) ( not ( = ?auto_1664141 ?auto_1664145 ) ) ( not ( = ?auto_1664141 ?auto_1664146 ) ) ( not ( = ?auto_1664141 ?auto_1664147 ) ) ( not ( = ?auto_1664141 ?auto_1664148 ) ) ( not ( = ?auto_1664141 ?auto_1664149 ) ) ( not ( = ?auto_1664141 ?auto_1664150 ) ) ( not ( = ?auto_1664141 ?auto_1664151 ) ) ( not ( = ?auto_1664141 ?auto_1664152 ) ) ( not ( = ?auto_1664141 ?auto_1664153 ) ) ( not ( = ?auto_1664141 ?auto_1664157 ) ) ( not ( = ?auto_1664142 ?auto_1664143 ) ) ( not ( = ?auto_1664142 ?auto_1664144 ) ) ( not ( = ?auto_1664142 ?auto_1664145 ) ) ( not ( = ?auto_1664142 ?auto_1664146 ) ) ( not ( = ?auto_1664142 ?auto_1664147 ) ) ( not ( = ?auto_1664142 ?auto_1664148 ) ) ( not ( = ?auto_1664142 ?auto_1664149 ) ) ( not ( = ?auto_1664142 ?auto_1664150 ) ) ( not ( = ?auto_1664142 ?auto_1664151 ) ) ( not ( = ?auto_1664142 ?auto_1664152 ) ) ( not ( = ?auto_1664142 ?auto_1664153 ) ) ( not ( = ?auto_1664142 ?auto_1664157 ) ) ( not ( = ?auto_1664143 ?auto_1664144 ) ) ( not ( = ?auto_1664143 ?auto_1664145 ) ) ( not ( = ?auto_1664143 ?auto_1664146 ) ) ( not ( = ?auto_1664143 ?auto_1664147 ) ) ( not ( = ?auto_1664143 ?auto_1664148 ) ) ( not ( = ?auto_1664143 ?auto_1664149 ) ) ( not ( = ?auto_1664143 ?auto_1664150 ) ) ( not ( = ?auto_1664143 ?auto_1664151 ) ) ( not ( = ?auto_1664143 ?auto_1664152 ) ) ( not ( = ?auto_1664143 ?auto_1664153 ) ) ( not ( = ?auto_1664143 ?auto_1664157 ) ) ( not ( = ?auto_1664144 ?auto_1664145 ) ) ( not ( = ?auto_1664144 ?auto_1664146 ) ) ( not ( = ?auto_1664144 ?auto_1664147 ) ) ( not ( = ?auto_1664144 ?auto_1664148 ) ) ( not ( = ?auto_1664144 ?auto_1664149 ) ) ( not ( = ?auto_1664144 ?auto_1664150 ) ) ( not ( = ?auto_1664144 ?auto_1664151 ) ) ( not ( = ?auto_1664144 ?auto_1664152 ) ) ( not ( = ?auto_1664144 ?auto_1664153 ) ) ( not ( = ?auto_1664144 ?auto_1664157 ) ) ( not ( = ?auto_1664145 ?auto_1664146 ) ) ( not ( = ?auto_1664145 ?auto_1664147 ) ) ( not ( = ?auto_1664145 ?auto_1664148 ) ) ( not ( = ?auto_1664145 ?auto_1664149 ) ) ( not ( = ?auto_1664145 ?auto_1664150 ) ) ( not ( = ?auto_1664145 ?auto_1664151 ) ) ( not ( = ?auto_1664145 ?auto_1664152 ) ) ( not ( = ?auto_1664145 ?auto_1664153 ) ) ( not ( = ?auto_1664145 ?auto_1664157 ) ) ( not ( = ?auto_1664146 ?auto_1664147 ) ) ( not ( = ?auto_1664146 ?auto_1664148 ) ) ( not ( = ?auto_1664146 ?auto_1664149 ) ) ( not ( = ?auto_1664146 ?auto_1664150 ) ) ( not ( = ?auto_1664146 ?auto_1664151 ) ) ( not ( = ?auto_1664146 ?auto_1664152 ) ) ( not ( = ?auto_1664146 ?auto_1664153 ) ) ( not ( = ?auto_1664146 ?auto_1664157 ) ) ( not ( = ?auto_1664147 ?auto_1664148 ) ) ( not ( = ?auto_1664147 ?auto_1664149 ) ) ( not ( = ?auto_1664147 ?auto_1664150 ) ) ( not ( = ?auto_1664147 ?auto_1664151 ) ) ( not ( = ?auto_1664147 ?auto_1664152 ) ) ( not ( = ?auto_1664147 ?auto_1664153 ) ) ( not ( = ?auto_1664147 ?auto_1664157 ) ) ( not ( = ?auto_1664148 ?auto_1664149 ) ) ( not ( = ?auto_1664148 ?auto_1664150 ) ) ( not ( = ?auto_1664148 ?auto_1664151 ) ) ( not ( = ?auto_1664148 ?auto_1664152 ) ) ( not ( = ?auto_1664148 ?auto_1664153 ) ) ( not ( = ?auto_1664148 ?auto_1664157 ) ) ( not ( = ?auto_1664149 ?auto_1664150 ) ) ( not ( = ?auto_1664149 ?auto_1664151 ) ) ( not ( = ?auto_1664149 ?auto_1664152 ) ) ( not ( = ?auto_1664149 ?auto_1664153 ) ) ( not ( = ?auto_1664149 ?auto_1664157 ) ) ( not ( = ?auto_1664150 ?auto_1664151 ) ) ( not ( = ?auto_1664150 ?auto_1664152 ) ) ( not ( = ?auto_1664150 ?auto_1664153 ) ) ( not ( = ?auto_1664150 ?auto_1664157 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1664151 ?auto_1664152 ?auto_1664153 )
      ( MAKE-14CRATE-VERIFY ?auto_1664139 ?auto_1664140 ?auto_1664141 ?auto_1664142 ?auto_1664143 ?auto_1664144 ?auto_1664145 ?auto_1664146 ?auto_1664147 ?auto_1664148 ?auto_1664149 ?auto_1664150 ?auto_1664151 ?auto_1664152 ?auto_1664153 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681298 - SURFACE
      ?auto_1681299 - SURFACE
      ?auto_1681300 - SURFACE
      ?auto_1681301 - SURFACE
      ?auto_1681302 - SURFACE
      ?auto_1681303 - SURFACE
      ?auto_1681304 - SURFACE
      ?auto_1681305 - SURFACE
      ?auto_1681306 - SURFACE
      ?auto_1681307 - SURFACE
      ?auto_1681308 - SURFACE
      ?auto_1681309 - SURFACE
      ?auto_1681310 - SURFACE
      ?auto_1681311 - SURFACE
      ?auto_1681312 - SURFACE
      ?auto_1681313 - SURFACE
    )
    :vars
    (
      ?auto_1681315 - HOIST
      ?auto_1681314 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681315 ?auto_1681314 ) ( SURFACE-AT ?auto_1681312 ?auto_1681314 ) ( CLEAR ?auto_1681312 ) ( LIFTING ?auto_1681315 ?auto_1681313 ) ( IS-CRATE ?auto_1681313 ) ( not ( = ?auto_1681312 ?auto_1681313 ) ) ( ON ?auto_1681299 ?auto_1681298 ) ( ON ?auto_1681300 ?auto_1681299 ) ( ON ?auto_1681301 ?auto_1681300 ) ( ON ?auto_1681302 ?auto_1681301 ) ( ON ?auto_1681303 ?auto_1681302 ) ( ON ?auto_1681304 ?auto_1681303 ) ( ON ?auto_1681305 ?auto_1681304 ) ( ON ?auto_1681306 ?auto_1681305 ) ( ON ?auto_1681307 ?auto_1681306 ) ( ON ?auto_1681308 ?auto_1681307 ) ( ON ?auto_1681309 ?auto_1681308 ) ( ON ?auto_1681310 ?auto_1681309 ) ( ON ?auto_1681311 ?auto_1681310 ) ( ON ?auto_1681312 ?auto_1681311 ) ( not ( = ?auto_1681298 ?auto_1681299 ) ) ( not ( = ?auto_1681298 ?auto_1681300 ) ) ( not ( = ?auto_1681298 ?auto_1681301 ) ) ( not ( = ?auto_1681298 ?auto_1681302 ) ) ( not ( = ?auto_1681298 ?auto_1681303 ) ) ( not ( = ?auto_1681298 ?auto_1681304 ) ) ( not ( = ?auto_1681298 ?auto_1681305 ) ) ( not ( = ?auto_1681298 ?auto_1681306 ) ) ( not ( = ?auto_1681298 ?auto_1681307 ) ) ( not ( = ?auto_1681298 ?auto_1681308 ) ) ( not ( = ?auto_1681298 ?auto_1681309 ) ) ( not ( = ?auto_1681298 ?auto_1681310 ) ) ( not ( = ?auto_1681298 ?auto_1681311 ) ) ( not ( = ?auto_1681298 ?auto_1681312 ) ) ( not ( = ?auto_1681298 ?auto_1681313 ) ) ( not ( = ?auto_1681299 ?auto_1681300 ) ) ( not ( = ?auto_1681299 ?auto_1681301 ) ) ( not ( = ?auto_1681299 ?auto_1681302 ) ) ( not ( = ?auto_1681299 ?auto_1681303 ) ) ( not ( = ?auto_1681299 ?auto_1681304 ) ) ( not ( = ?auto_1681299 ?auto_1681305 ) ) ( not ( = ?auto_1681299 ?auto_1681306 ) ) ( not ( = ?auto_1681299 ?auto_1681307 ) ) ( not ( = ?auto_1681299 ?auto_1681308 ) ) ( not ( = ?auto_1681299 ?auto_1681309 ) ) ( not ( = ?auto_1681299 ?auto_1681310 ) ) ( not ( = ?auto_1681299 ?auto_1681311 ) ) ( not ( = ?auto_1681299 ?auto_1681312 ) ) ( not ( = ?auto_1681299 ?auto_1681313 ) ) ( not ( = ?auto_1681300 ?auto_1681301 ) ) ( not ( = ?auto_1681300 ?auto_1681302 ) ) ( not ( = ?auto_1681300 ?auto_1681303 ) ) ( not ( = ?auto_1681300 ?auto_1681304 ) ) ( not ( = ?auto_1681300 ?auto_1681305 ) ) ( not ( = ?auto_1681300 ?auto_1681306 ) ) ( not ( = ?auto_1681300 ?auto_1681307 ) ) ( not ( = ?auto_1681300 ?auto_1681308 ) ) ( not ( = ?auto_1681300 ?auto_1681309 ) ) ( not ( = ?auto_1681300 ?auto_1681310 ) ) ( not ( = ?auto_1681300 ?auto_1681311 ) ) ( not ( = ?auto_1681300 ?auto_1681312 ) ) ( not ( = ?auto_1681300 ?auto_1681313 ) ) ( not ( = ?auto_1681301 ?auto_1681302 ) ) ( not ( = ?auto_1681301 ?auto_1681303 ) ) ( not ( = ?auto_1681301 ?auto_1681304 ) ) ( not ( = ?auto_1681301 ?auto_1681305 ) ) ( not ( = ?auto_1681301 ?auto_1681306 ) ) ( not ( = ?auto_1681301 ?auto_1681307 ) ) ( not ( = ?auto_1681301 ?auto_1681308 ) ) ( not ( = ?auto_1681301 ?auto_1681309 ) ) ( not ( = ?auto_1681301 ?auto_1681310 ) ) ( not ( = ?auto_1681301 ?auto_1681311 ) ) ( not ( = ?auto_1681301 ?auto_1681312 ) ) ( not ( = ?auto_1681301 ?auto_1681313 ) ) ( not ( = ?auto_1681302 ?auto_1681303 ) ) ( not ( = ?auto_1681302 ?auto_1681304 ) ) ( not ( = ?auto_1681302 ?auto_1681305 ) ) ( not ( = ?auto_1681302 ?auto_1681306 ) ) ( not ( = ?auto_1681302 ?auto_1681307 ) ) ( not ( = ?auto_1681302 ?auto_1681308 ) ) ( not ( = ?auto_1681302 ?auto_1681309 ) ) ( not ( = ?auto_1681302 ?auto_1681310 ) ) ( not ( = ?auto_1681302 ?auto_1681311 ) ) ( not ( = ?auto_1681302 ?auto_1681312 ) ) ( not ( = ?auto_1681302 ?auto_1681313 ) ) ( not ( = ?auto_1681303 ?auto_1681304 ) ) ( not ( = ?auto_1681303 ?auto_1681305 ) ) ( not ( = ?auto_1681303 ?auto_1681306 ) ) ( not ( = ?auto_1681303 ?auto_1681307 ) ) ( not ( = ?auto_1681303 ?auto_1681308 ) ) ( not ( = ?auto_1681303 ?auto_1681309 ) ) ( not ( = ?auto_1681303 ?auto_1681310 ) ) ( not ( = ?auto_1681303 ?auto_1681311 ) ) ( not ( = ?auto_1681303 ?auto_1681312 ) ) ( not ( = ?auto_1681303 ?auto_1681313 ) ) ( not ( = ?auto_1681304 ?auto_1681305 ) ) ( not ( = ?auto_1681304 ?auto_1681306 ) ) ( not ( = ?auto_1681304 ?auto_1681307 ) ) ( not ( = ?auto_1681304 ?auto_1681308 ) ) ( not ( = ?auto_1681304 ?auto_1681309 ) ) ( not ( = ?auto_1681304 ?auto_1681310 ) ) ( not ( = ?auto_1681304 ?auto_1681311 ) ) ( not ( = ?auto_1681304 ?auto_1681312 ) ) ( not ( = ?auto_1681304 ?auto_1681313 ) ) ( not ( = ?auto_1681305 ?auto_1681306 ) ) ( not ( = ?auto_1681305 ?auto_1681307 ) ) ( not ( = ?auto_1681305 ?auto_1681308 ) ) ( not ( = ?auto_1681305 ?auto_1681309 ) ) ( not ( = ?auto_1681305 ?auto_1681310 ) ) ( not ( = ?auto_1681305 ?auto_1681311 ) ) ( not ( = ?auto_1681305 ?auto_1681312 ) ) ( not ( = ?auto_1681305 ?auto_1681313 ) ) ( not ( = ?auto_1681306 ?auto_1681307 ) ) ( not ( = ?auto_1681306 ?auto_1681308 ) ) ( not ( = ?auto_1681306 ?auto_1681309 ) ) ( not ( = ?auto_1681306 ?auto_1681310 ) ) ( not ( = ?auto_1681306 ?auto_1681311 ) ) ( not ( = ?auto_1681306 ?auto_1681312 ) ) ( not ( = ?auto_1681306 ?auto_1681313 ) ) ( not ( = ?auto_1681307 ?auto_1681308 ) ) ( not ( = ?auto_1681307 ?auto_1681309 ) ) ( not ( = ?auto_1681307 ?auto_1681310 ) ) ( not ( = ?auto_1681307 ?auto_1681311 ) ) ( not ( = ?auto_1681307 ?auto_1681312 ) ) ( not ( = ?auto_1681307 ?auto_1681313 ) ) ( not ( = ?auto_1681308 ?auto_1681309 ) ) ( not ( = ?auto_1681308 ?auto_1681310 ) ) ( not ( = ?auto_1681308 ?auto_1681311 ) ) ( not ( = ?auto_1681308 ?auto_1681312 ) ) ( not ( = ?auto_1681308 ?auto_1681313 ) ) ( not ( = ?auto_1681309 ?auto_1681310 ) ) ( not ( = ?auto_1681309 ?auto_1681311 ) ) ( not ( = ?auto_1681309 ?auto_1681312 ) ) ( not ( = ?auto_1681309 ?auto_1681313 ) ) ( not ( = ?auto_1681310 ?auto_1681311 ) ) ( not ( = ?auto_1681310 ?auto_1681312 ) ) ( not ( = ?auto_1681310 ?auto_1681313 ) ) ( not ( = ?auto_1681311 ?auto_1681312 ) ) ( not ( = ?auto_1681311 ?auto_1681313 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1681312 ?auto_1681313 )
      ( MAKE-15CRATE-VERIFY ?auto_1681298 ?auto_1681299 ?auto_1681300 ?auto_1681301 ?auto_1681302 ?auto_1681303 ?auto_1681304 ?auto_1681305 ?auto_1681306 ?auto_1681307 ?auto_1681308 ?auto_1681309 ?auto_1681310 ?auto_1681311 ?auto_1681312 ?auto_1681313 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681477 - SURFACE
      ?auto_1681478 - SURFACE
      ?auto_1681479 - SURFACE
      ?auto_1681480 - SURFACE
      ?auto_1681481 - SURFACE
      ?auto_1681482 - SURFACE
      ?auto_1681483 - SURFACE
      ?auto_1681484 - SURFACE
      ?auto_1681485 - SURFACE
      ?auto_1681486 - SURFACE
      ?auto_1681487 - SURFACE
      ?auto_1681488 - SURFACE
      ?auto_1681489 - SURFACE
      ?auto_1681490 - SURFACE
      ?auto_1681491 - SURFACE
      ?auto_1681492 - SURFACE
    )
    :vars
    (
      ?auto_1681495 - HOIST
      ?auto_1681494 - PLACE
      ?auto_1681493 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681495 ?auto_1681494 ) ( SURFACE-AT ?auto_1681491 ?auto_1681494 ) ( CLEAR ?auto_1681491 ) ( IS-CRATE ?auto_1681492 ) ( not ( = ?auto_1681491 ?auto_1681492 ) ) ( TRUCK-AT ?auto_1681493 ?auto_1681494 ) ( AVAILABLE ?auto_1681495 ) ( IN ?auto_1681492 ?auto_1681493 ) ( ON ?auto_1681491 ?auto_1681490 ) ( not ( = ?auto_1681490 ?auto_1681491 ) ) ( not ( = ?auto_1681490 ?auto_1681492 ) ) ( ON ?auto_1681478 ?auto_1681477 ) ( ON ?auto_1681479 ?auto_1681478 ) ( ON ?auto_1681480 ?auto_1681479 ) ( ON ?auto_1681481 ?auto_1681480 ) ( ON ?auto_1681482 ?auto_1681481 ) ( ON ?auto_1681483 ?auto_1681482 ) ( ON ?auto_1681484 ?auto_1681483 ) ( ON ?auto_1681485 ?auto_1681484 ) ( ON ?auto_1681486 ?auto_1681485 ) ( ON ?auto_1681487 ?auto_1681486 ) ( ON ?auto_1681488 ?auto_1681487 ) ( ON ?auto_1681489 ?auto_1681488 ) ( ON ?auto_1681490 ?auto_1681489 ) ( not ( = ?auto_1681477 ?auto_1681478 ) ) ( not ( = ?auto_1681477 ?auto_1681479 ) ) ( not ( = ?auto_1681477 ?auto_1681480 ) ) ( not ( = ?auto_1681477 ?auto_1681481 ) ) ( not ( = ?auto_1681477 ?auto_1681482 ) ) ( not ( = ?auto_1681477 ?auto_1681483 ) ) ( not ( = ?auto_1681477 ?auto_1681484 ) ) ( not ( = ?auto_1681477 ?auto_1681485 ) ) ( not ( = ?auto_1681477 ?auto_1681486 ) ) ( not ( = ?auto_1681477 ?auto_1681487 ) ) ( not ( = ?auto_1681477 ?auto_1681488 ) ) ( not ( = ?auto_1681477 ?auto_1681489 ) ) ( not ( = ?auto_1681477 ?auto_1681490 ) ) ( not ( = ?auto_1681477 ?auto_1681491 ) ) ( not ( = ?auto_1681477 ?auto_1681492 ) ) ( not ( = ?auto_1681478 ?auto_1681479 ) ) ( not ( = ?auto_1681478 ?auto_1681480 ) ) ( not ( = ?auto_1681478 ?auto_1681481 ) ) ( not ( = ?auto_1681478 ?auto_1681482 ) ) ( not ( = ?auto_1681478 ?auto_1681483 ) ) ( not ( = ?auto_1681478 ?auto_1681484 ) ) ( not ( = ?auto_1681478 ?auto_1681485 ) ) ( not ( = ?auto_1681478 ?auto_1681486 ) ) ( not ( = ?auto_1681478 ?auto_1681487 ) ) ( not ( = ?auto_1681478 ?auto_1681488 ) ) ( not ( = ?auto_1681478 ?auto_1681489 ) ) ( not ( = ?auto_1681478 ?auto_1681490 ) ) ( not ( = ?auto_1681478 ?auto_1681491 ) ) ( not ( = ?auto_1681478 ?auto_1681492 ) ) ( not ( = ?auto_1681479 ?auto_1681480 ) ) ( not ( = ?auto_1681479 ?auto_1681481 ) ) ( not ( = ?auto_1681479 ?auto_1681482 ) ) ( not ( = ?auto_1681479 ?auto_1681483 ) ) ( not ( = ?auto_1681479 ?auto_1681484 ) ) ( not ( = ?auto_1681479 ?auto_1681485 ) ) ( not ( = ?auto_1681479 ?auto_1681486 ) ) ( not ( = ?auto_1681479 ?auto_1681487 ) ) ( not ( = ?auto_1681479 ?auto_1681488 ) ) ( not ( = ?auto_1681479 ?auto_1681489 ) ) ( not ( = ?auto_1681479 ?auto_1681490 ) ) ( not ( = ?auto_1681479 ?auto_1681491 ) ) ( not ( = ?auto_1681479 ?auto_1681492 ) ) ( not ( = ?auto_1681480 ?auto_1681481 ) ) ( not ( = ?auto_1681480 ?auto_1681482 ) ) ( not ( = ?auto_1681480 ?auto_1681483 ) ) ( not ( = ?auto_1681480 ?auto_1681484 ) ) ( not ( = ?auto_1681480 ?auto_1681485 ) ) ( not ( = ?auto_1681480 ?auto_1681486 ) ) ( not ( = ?auto_1681480 ?auto_1681487 ) ) ( not ( = ?auto_1681480 ?auto_1681488 ) ) ( not ( = ?auto_1681480 ?auto_1681489 ) ) ( not ( = ?auto_1681480 ?auto_1681490 ) ) ( not ( = ?auto_1681480 ?auto_1681491 ) ) ( not ( = ?auto_1681480 ?auto_1681492 ) ) ( not ( = ?auto_1681481 ?auto_1681482 ) ) ( not ( = ?auto_1681481 ?auto_1681483 ) ) ( not ( = ?auto_1681481 ?auto_1681484 ) ) ( not ( = ?auto_1681481 ?auto_1681485 ) ) ( not ( = ?auto_1681481 ?auto_1681486 ) ) ( not ( = ?auto_1681481 ?auto_1681487 ) ) ( not ( = ?auto_1681481 ?auto_1681488 ) ) ( not ( = ?auto_1681481 ?auto_1681489 ) ) ( not ( = ?auto_1681481 ?auto_1681490 ) ) ( not ( = ?auto_1681481 ?auto_1681491 ) ) ( not ( = ?auto_1681481 ?auto_1681492 ) ) ( not ( = ?auto_1681482 ?auto_1681483 ) ) ( not ( = ?auto_1681482 ?auto_1681484 ) ) ( not ( = ?auto_1681482 ?auto_1681485 ) ) ( not ( = ?auto_1681482 ?auto_1681486 ) ) ( not ( = ?auto_1681482 ?auto_1681487 ) ) ( not ( = ?auto_1681482 ?auto_1681488 ) ) ( not ( = ?auto_1681482 ?auto_1681489 ) ) ( not ( = ?auto_1681482 ?auto_1681490 ) ) ( not ( = ?auto_1681482 ?auto_1681491 ) ) ( not ( = ?auto_1681482 ?auto_1681492 ) ) ( not ( = ?auto_1681483 ?auto_1681484 ) ) ( not ( = ?auto_1681483 ?auto_1681485 ) ) ( not ( = ?auto_1681483 ?auto_1681486 ) ) ( not ( = ?auto_1681483 ?auto_1681487 ) ) ( not ( = ?auto_1681483 ?auto_1681488 ) ) ( not ( = ?auto_1681483 ?auto_1681489 ) ) ( not ( = ?auto_1681483 ?auto_1681490 ) ) ( not ( = ?auto_1681483 ?auto_1681491 ) ) ( not ( = ?auto_1681483 ?auto_1681492 ) ) ( not ( = ?auto_1681484 ?auto_1681485 ) ) ( not ( = ?auto_1681484 ?auto_1681486 ) ) ( not ( = ?auto_1681484 ?auto_1681487 ) ) ( not ( = ?auto_1681484 ?auto_1681488 ) ) ( not ( = ?auto_1681484 ?auto_1681489 ) ) ( not ( = ?auto_1681484 ?auto_1681490 ) ) ( not ( = ?auto_1681484 ?auto_1681491 ) ) ( not ( = ?auto_1681484 ?auto_1681492 ) ) ( not ( = ?auto_1681485 ?auto_1681486 ) ) ( not ( = ?auto_1681485 ?auto_1681487 ) ) ( not ( = ?auto_1681485 ?auto_1681488 ) ) ( not ( = ?auto_1681485 ?auto_1681489 ) ) ( not ( = ?auto_1681485 ?auto_1681490 ) ) ( not ( = ?auto_1681485 ?auto_1681491 ) ) ( not ( = ?auto_1681485 ?auto_1681492 ) ) ( not ( = ?auto_1681486 ?auto_1681487 ) ) ( not ( = ?auto_1681486 ?auto_1681488 ) ) ( not ( = ?auto_1681486 ?auto_1681489 ) ) ( not ( = ?auto_1681486 ?auto_1681490 ) ) ( not ( = ?auto_1681486 ?auto_1681491 ) ) ( not ( = ?auto_1681486 ?auto_1681492 ) ) ( not ( = ?auto_1681487 ?auto_1681488 ) ) ( not ( = ?auto_1681487 ?auto_1681489 ) ) ( not ( = ?auto_1681487 ?auto_1681490 ) ) ( not ( = ?auto_1681487 ?auto_1681491 ) ) ( not ( = ?auto_1681487 ?auto_1681492 ) ) ( not ( = ?auto_1681488 ?auto_1681489 ) ) ( not ( = ?auto_1681488 ?auto_1681490 ) ) ( not ( = ?auto_1681488 ?auto_1681491 ) ) ( not ( = ?auto_1681488 ?auto_1681492 ) ) ( not ( = ?auto_1681489 ?auto_1681490 ) ) ( not ( = ?auto_1681489 ?auto_1681491 ) ) ( not ( = ?auto_1681489 ?auto_1681492 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681490 ?auto_1681491 ?auto_1681492 )
      ( MAKE-15CRATE-VERIFY ?auto_1681477 ?auto_1681478 ?auto_1681479 ?auto_1681480 ?auto_1681481 ?auto_1681482 ?auto_1681483 ?auto_1681484 ?auto_1681485 ?auto_1681486 ?auto_1681487 ?auto_1681488 ?auto_1681489 ?auto_1681490 ?auto_1681491 ?auto_1681492 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681672 - SURFACE
      ?auto_1681673 - SURFACE
      ?auto_1681674 - SURFACE
      ?auto_1681675 - SURFACE
      ?auto_1681676 - SURFACE
      ?auto_1681677 - SURFACE
      ?auto_1681678 - SURFACE
      ?auto_1681679 - SURFACE
      ?auto_1681680 - SURFACE
      ?auto_1681681 - SURFACE
      ?auto_1681682 - SURFACE
      ?auto_1681683 - SURFACE
      ?auto_1681684 - SURFACE
      ?auto_1681685 - SURFACE
      ?auto_1681686 - SURFACE
      ?auto_1681687 - SURFACE
    )
    :vars
    (
      ?auto_1681691 - HOIST
      ?auto_1681688 - PLACE
      ?auto_1681689 - TRUCK
      ?auto_1681690 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681691 ?auto_1681688 ) ( SURFACE-AT ?auto_1681686 ?auto_1681688 ) ( CLEAR ?auto_1681686 ) ( IS-CRATE ?auto_1681687 ) ( not ( = ?auto_1681686 ?auto_1681687 ) ) ( AVAILABLE ?auto_1681691 ) ( IN ?auto_1681687 ?auto_1681689 ) ( ON ?auto_1681686 ?auto_1681685 ) ( not ( = ?auto_1681685 ?auto_1681686 ) ) ( not ( = ?auto_1681685 ?auto_1681687 ) ) ( TRUCK-AT ?auto_1681689 ?auto_1681690 ) ( not ( = ?auto_1681690 ?auto_1681688 ) ) ( ON ?auto_1681673 ?auto_1681672 ) ( ON ?auto_1681674 ?auto_1681673 ) ( ON ?auto_1681675 ?auto_1681674 ) ( ON ?auto_1681676 ?auto_1681675 ) ( ON ?auto_1681677 ?auto_1681676 ) ( ON ?auto_1681678 ?auto_1681677 ) ( ON ?auto_1681679 ?auto_1681678 ) ( ON ?auto_1681680 ?auto_1681679 ) ( ON ?auto_1681681 ?auto_1681680 ) ( ON ?auto_1681682 ?auto_1681681 ) ( ON ?auto_1681683 ?auto_1681682 ) ( ON ?auto_1681684 ?auto_1681683 ) ( ON ?auto_1681685 ?auto_1681684 ) ( not ( = ?auto_1681672 ?auto_1681673 ) ) ( not ( = ?auto_1681672 ?auto_1681674 ) ) ( not ( = ?auto_1681672 ?auto_1681675 ) ) ( not ( = ?auto_1681672 ?auto_1681676 ) ) ( not ( = ?auto_1681672 ?auto_1681677 ) ) ( not ( = ?auto_1681672 ?auto_1681678 ) ) ( not ( = ?auto_1681672 ?auto_1681679 ) ) ( not ( = ?auto_1681672 ?auto_1681680 ) ) ( not ( = ?auto_1681672 ?auto_1681681 ) ) ( not ( = ?auto_1681672 ?auto_1681682 ) ) ( not ( = ?auto_1681672 ?auto_1681683 ) ) ( not ( = ?auto_1681672 ?auto_1681684 ) ) ( not ( = ?auto_1681672 ?auto_1681685 ) ) ( not ( = ?auto_1681672 ?auto_1681686 ) ) ( not ( = ?auto_1681672 ?auto_1681687 ) ) ( not ( = ?auto_1681673 ?auto_1681674 ) ) ( not ( = ?auto_1681673 ?auto_1681675 ) ) ( not ( = ?auto_1681673 ?auto_1681676 ) ) ( not ( = ?auto_1681673 ?auto_1681677 ) ) ( not ( = ?auto_1681673 ?auto_1681678 ) ) ( not ( = ?auto_1681673 ?auto_1681679 ) ) ( not ( = ?auto_1681673 ?auto_1681680 ) ) ( not ( = ?auto_1681673 ?auto_1681681 ) ) ( not ( = ?auto_1681673 ?auto_1681682 ) ) ( not ( = ?auto_1681673 ?auto_1681683 ) ) ( not ( = ?auto_1681673 ?auto_1681684 ) ) ( not ( = ?auto_1681673 ?auto_1681685 ) ) ( not ( = ?auto_1681673 ?auto_1681686 ) ) ( not ( = ?auto_1681673 ?auto_1681687 ) ) ( not ( = ?auto_1681674 ?auto_1681675 ) ) ( not ( = ?auto_1681674 ?auto_1681676 ) ) ( not ( = ?auto_1681674 ?auto_1681677 ) ) ( not ( = ?auto_1681674 ?auto_1681678 ) ) ( not ( = ?auto_1681674 ?auto_1681679 ) ) ( not ( = ?auto_1681674 ?auto_1681680 ) ) ( not ( = ?auto_1681674 ?auto_1681681 ) ) ( not ( = ?auto_1681674 ?auto_1681682 ) ) ( not ( = ?auto_1681674 ?auto_1681683 ) ) ( not ( = ?auto_1681674 ?auto_1681684 ) ) ( not ( = ?auto_1681674 ?auto_1681685 ) ) ( not ( = ?auto_1681674 ?auto_1681686 ) ) ( not ( = ?auto_1681674 ?auto_1681687 ) ) ( not ( = ?auto_1681675 ?auto_1681676 ) ) ( not ( = ?auto_1681675 ?auto_1681677 ) ) ( not ( = ?auto_1681675 ?auto_1681678 ) ) ( not ( = ?auto_1681675 ?auto_1681679 ) ) ( not ( = ?auto_1681675 ?auto_1681680 ) ) ( not ( = ?auto_1681675 ?auto_1681681 ) ) ( not ( = ?auto_1681675 ?auto_1681682 ) ) ( not ( = ?auto_1681675 ?auto_1681683 ) ) ( not ( = ?auto_1681675 ?auto_1681684 ) ) ( not ( = ?auto_1681675 ?auto_1681685 ) ) ( not ( = ?auto_1681675 ?auto_1681686 ) ) ( not ( = ?auto_1681675 ?auto_1681687 ) ) ( not ( = ?auto_1681676 ?auto_1681677 ) ) ( not ( = ?auto_1681676 ?auto_1681678 ) ) ( not ( = ?auto_1681676 ?auto_1681679 ) ) ( not ( = ?auto_1681676 ?auto_1681680 ) ) ( not ( = ?auto_1681676 ?auto_1681681 ) ) ( not ( = ?auto_1681676 ?auto_1681682 ) ) ( not ( = ?auto_1681676 ?auto_1681683 ) ) ( not ( = ?auto_1681676 ?auto_1681684 ) ) ( not ( = ?auto_1681676 ?auto_1681685 ) ) ( not ( = ?auto_1681676 ?auto_1681686 ) ) ( not ( = ?auto_1681676 ?auto_1681687 ) ) ( not ( = ?auto_1681677 ?auto_1681678 ) ) ( not ( = ?auto_1681677 ?auto_1681679 ) ) ( not ( = ?auto_1681677 ?auto_1681680 ) ) ( not ( = ?auto_1681677 ?auto_1681681 ) ) ( not ( = ?auto_1681677 ?auto_1681682 ) ) ( not ( = ?auto_1681677 ?auto_1681683 ) ) ( not ( = ?auto_1681677 ?auto_1681684 ) ) ( not ( = ?auto_1681677 ?auto_1681685 ) ) ( not ( = ?auto_1681677 ?auto_1681686 ) ) ( not ( = ?auto_1681677 ?auto_1681687 ) ) ( not ( = ?auto_1681678 ?auto_1681679 ) ) ( not ( = ?auto_1681678 ?auto_1681680 ) ) ( not ( = ?auto_1681678 ?auto_1681681 ) ) ( not ( = ?auto_1681678 ?auto_1681682 ) ) ( not ( = ?auto_1681678 ?auto_1681683 ) ) ( not ( = ?auto_1681678 ?auto_1681684 ) ) ( not ( = ?auto_1681678 ?auto_1681685 ) ) ( not ( = ?auto_1681678 ?auto_1681686 ) ) ( not ( = ?auto_1681678 ?auto_1681687 ) ) ( not ( = ?auto_1681679 ?auto_1681680 ) ) ( not ( = ?auto_1681679 ?auto_1681681 ) ) ( not ( = ?auto_1681679 ?auto_1681682 ) ) ( not ( = ?auto_1681679 ?auto_1681683 ) ) ( not ( = ?auto_1681679 ?auto_1681684 ) ) ( not ( = ?auto_1681679 ?auto_1681685 ) ) ( not ( = ?auto_1681679 ?auto_1681686 ) ) ( not ( = ?auto_1681679 ?auto_1681687 ) ) ( not ( = ?auto_1681680 ?auto_1681681 ) ) ( not ( = ?auto_1681680 ?auto_1681682 ) ) ( not ( = ?auto_1681680 ?auto_1681683 ) ) ( not ( = ?auto_1681680 ?auto_1681684 ) ) ( not ( = ?auto_1681680 ?auto_1681685 ) ) ( not ( = ?auto_1681680 ?auto_1681686 ) ) ( not ( = ?auto_1681680 ?auto_1681687 ) ) ( not ( = ?auto_1681681 ?auto_1681682 ) ) ( not ( = ?auto_1681681 ?auto_1681683 ) ) ( not ( = ?auto_1681681 ?auto_1681684 ) ) ( not ( = ?auto_1681681 ?auto_1681685 ) ) ( not ( = ?auto_1681681 ?auto_1681686 ) ) ( not ( = ?auto_1681681 ?auto_1681687 ) ) ( not ( = ?auto_1681682 ?auto_1681683 ) ) ( not ( = ?auto_1681682 ?auto_1681684 ) ) ( not ( = ?auto_1681682 ?auto_1681685 ) ) ( not ( = ?auto_1681682 ?auto_1681686 ) ) ( not ( = ?auto_1681682 ?auto_1681687 ) ) ( not ( = ?auto_1681683 ?auto_1681684 ) ) ( not ( = ?auto_1681683 ?auto_1681685 ) ) ( not ( = ?auto_1681683 ?auto_1681686 ) ) ( not ( = ?auto_1681683 ?auto_1681687 ) ) ( not ( = ?auto_1681684 ?auto_1681685 ) ) ( not ( = ?auto_1681684 ?auto_1681686 ) ) ( not ( = ?auto_1681684 ?auto_1681687 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681685 ?auto_1681686 ?auto_1681687 )
      ( MAKE-15CRATE-VERIFY ?auto_1681672 ?auto_1681673 ?auto_1681674 ?auto_1681675 ?auto_1681676 ?auto_1681677 ?auto_1681678 ?auto_1681679 ?auto_1681680 ?auto_1681681 ?auto_1681682 ?auto_1681683 ?auto_1681684 ?auto_1681685 ?auto_1681686 ?auto_1681687 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1681882 - SURFACE
      ?auto_1681883 - SURFACE
      ?auto_1681884 - SURFACE
      ?auto_1681885 - SURFACE
      ?auto_1681886 - SURFACE
      ?auto_1681887 - SURFACE
      ?auto_1681888 - SURFACE
      ?auto_1681889 - SURFACE
      ?auto_1681890 - SURFACE
      ?auto_1681891 - SURFACE
      ?auto_1681892 - SURFACE
      ?auto_1681893 - SURFACE
      ?auto_1681894 - SURFACE
      ?auto_1681895 - SURFACE
      ?auto_1681896 - SURFACE
      ?auto_1681897 - SURFACE
    )
    :vars
    (
      ?auto_1681901 - HOIST
      ?auto_1681900 - PLACE
      ?auto_1681902 - TRUCK
      ?auto_1681899 - PLACE
      ?auto_1681898 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1681901 ?auto_1681900 ) ( SURFACE-AT ?auto_1681896 ?auto_1681900 ) ( CLEAR ?auto_1681896 ) ( IS-CRATE ?auto_1681897 ) ( not ( = ?auto_1681896 ?auto_1681897 ) ) ( AVAILABLE ?auto_1681901 ) ( ON ?auto_1681896 ?auto_1681895 ) ( not ( = ?auto_1681895 ?auto_1681896 ) ) ( not ( = ?auto_1681895 ?auto_1681897 ) ) ( TRUCK-AT ?auto_1681902 ?auto_1681899 ) ( not ( = ?auto_1681899 ?auto_1681900 ) ) ( HOIST-AT ?auto_1681898 ?auto_1681899 ) ( LIFTING ?auto_1681898 ?auto_1681897 ) ( not ( = ?auto_1681901 ?auto_1681898 ) ) ( ON ?auto_1681883 ?auto_1681882 ) ( ON ?auto_1681884 ?auto_1681883 ) ( ON ?auto_1681885 ?auto_1681884 ) ( ON ?auto_1681886 ?auto_1681885 ) ( ON ?auto_1681887 ?auto_1681886 ) ( ON ?auto_1681888 ?auto_1681887 ) ( ON ?auto_1681889 ?auto_1681888 ) ( ON ?auto_1681890 ?auto_1681889 ) ( ON ?auto_1681891 ?auto_1681890 ) ( ON ?auto_1681892 ?auto_1681891 ) ( ON ?auto_1681893 ?auto_1681892 ) ( ON ?auto_1681894 ?auto_1681893 ) ( ON ?auto_1681895 ?auto_1681894 ) ( not ( = ?auto_1681882 ?auto_1681883 ) ) ( not ( = ?auto_1681882 ?auto_1681884 ) ) ( not ( = ?auto_1681882 ?auto_1681885 ) ) ( not ( = ?auto_1681882 ?auto_1681886 ) ) ( not ( = ?auto_1681882 ?auto_1681887 ) ) ( not ( = ?auto_1681882 ?auto_1681888 ) ) ( not ( = ?auto_1681882 ?auto_1681889 ) ) ( not ( = ?auto_1681882 ?auto_1681890 ) ) ( not ( = ?auto_1681882 ?auto_1681891 ) ) ( not ( = ?auto_1681882 ?auto_1681892 ) ) ( not ( = ?auto_1681882 ?auto_1681893 ) ) ( not ( = ?auto_1681882 ?auto_1681894 ) ) ( not ( = ?auto_1681882 ?auto_1681895 ) ) ( not ( = ?auto_1681882 ?auto_1681896 ) ) ( not ( = ?auto_1681882 ?auto_1681897 ) ) ( not ( = ?auto_1681883 ?auto_1681884 ) ) ( not ( = ?auto_1681883 ?auto_1681885 ) ) ( not ( = ?auto_1681883 ?auto_1681886 ) ) ( not ( = ?auto_1681883 ?auto_1681887 ) ) ( not ( = ?auto_1681883 ?auto_1681888 ) ) ( not ( = ?auto_1681883 ?auto_1681889 ) ) ( not ( = ?auto_1681883 ?auto_1681890 ) ) ( not ( = ?auto_1681883 ?auto_1681891 ) ) ( not ( = ?auto_1681883 ?auto_1681892 ) ) ( not ( = ?auto_1681883 ?auto_1681893 ) ) ( not ( = ?auto_1681883 ?auto_1681894 ) ) ( not ( = ?auto_1681883 ?auto_1681895 ) ) ( not ( = ?auto_1681883 ?auto_1681896 ) ) ( not ( = ?auto_1681883 ?auto_1681897 ) ) ( not ( = ?auto_1681884 ?auto_1681885 ) ) ( not ( = ?auto_1681884 ?auto_1681886 ) ) ( not ( = ?auto_1681884 ?auto_1681887 ) ) ( not ( = ?auto_1681884 ?auto_1681888 ) ) ( not ( = ?auto_1681884 ?auto_1681889 ) ) ( not ( = ?auto_1681884 ?auto_1681890 ) ) ( not ( = ?auto_1681884 ?auto_1681891 ) ) ( not ( = ?auto_1681884 ?auto_1681892 ) ) ( not ( = ?auto_1681884 ?auto_1681893 ) ) ( not ( = ?auto_1681884 ?auto_1681894 ) ) ( not ( = ?auto_1681884 ?auto_1681895 ) ) ( not ( = ?auto_1681884 ?auto_1681896 ) ) ( not ( = ?auto_1681884 ?auto_1681897 ) ) ( not ( = ?auto_1681885 ?auto_1681886 ) ) ( not ( = ?auto_1681885 ?auto_1681887 ) ) ( not ( = ?auto_1681885 ?auto_1681888 ) ) ( not ( = ?auto_1681885 ?auto_1681889 ) ) ( not ( = ?auto_1681885 ?auto_1681890 ) ) ( not ( = ?auto_1681885 ?auto_1681891 ) ) ( not ( = ?auto_1681885 ?auto_1681892 ) ) ( not ( = ?auto_1681885 ?auto_1681893 ) ) ( not ( = ?auto_1681885 ?auto_1681894 ) ) ( not ( = ?auto_1681885 ?auto_1681895 ) ) ( not ( = ?auto_1681885 ?auto_1681896 ) ) ( not ( = ?auto_1681885 ?auto_1681897 ) ) ( not ( = ?auto_1681886 ?auto_1681887 ) ) ( not ( = ?auto_1681886 ?auto_1681888 ) ) ( not ( = ?auto_1681886 ?auto_1681889 ) ) ( not ( = ?auto_1681886 ?auto_1681890 ) ) ( not ( = ?auto_1681886 ?auto_1681891 ) ) ( not ( = ?auto_1681886 ?auto_1681892 ) ) ( not ( = ?auto_1681886 ?auto_1681893 ) ) ( not ( = ?auto_1681886 ?auto_1681894 ) ) ( not ( = ?auto_1681886 ?auto_1681895 ) ) ( not ( = ?auto_1681886 ?auto_1681896 ) ) ( not ( = ?auto_1681886 ?auto_1681897 ) ) ( not ( = ?auto_1681887 ?auto_1681888 ) ) ( not ( = ?auto_1681887 ?auto_1681889 ) ) ( not ( = ?auto_1681887 ?auto_1681890 ) ) ( not ( = ?auto_1681887 ?auto_1681891 ) ) ( not ( = ?auto_1681887 ?auto_1681892 ) ) ( not ( = ?auto_1681887 ?auto_1681893 ) ) ( not ( = ?auto_1681887 ?auto_1681894 ) ) ( not ( = ?auto_1681887 ?auto_1681895 ) ) ( not ( = ?auto_1681887 ?auto_1681896 ) ) ( not ( = ?auto_1681887 ?auto_1681897 ) ) ( not ( = ?auto_1681888 ?auto_1681889 ) ) ( not ( = ?auto_1681888 ?auto_1681890 ) ) ( not ( = ?auto_1681888 ?auto_1681891 ) ) ( not ( = ?auto_1681888 ?auto_1681892 ) ) ( not ( = ?auto_1681888 ?auto_1681893 ) ) ( not ( = ?auto_1681888 ?auto_1681894 ) ) ( not ( = ?auto_1681888 ?auto_1681895 ) ) ( not ( = ?auto_1681888 ?auto_1681896 ) ) ( not ( = ?auto_1681888 ?auto_1681897 ) ) ( not ( = ?auto_1681889 ?auto_1681890 ) ) ( not ( = ?auto_1681889 ?auto_1681891 ) ) ( not ( = ?auto_1681889 ?auto_1681892 ) ) ( not ( = ?auto_1681889 ?auto_1681893 ) ) ( not ( = ?auto_1681889 ?auto_1681894 ) ) ( not ( = ?auto_1681889 ?auto_1681895 ) ) ( not ( = ?auto_1681889 ?auto_1681896 ) ) ( not ( = ?auto_1681889 ?auto_1681897 ) ) ( not ( = ?auto_1681890 ?auto_1681891 ) ) ( not ( = ?auto_1681890 ?auto_1681892 ) ) ( not ( = ?auto_1681890 ?auto_1681893 ) ) ( not ( = ?auto_1681890 ?auto_1681894 ) ) ( not ( = ?auto_1681890 ?auto_1681895 ) ) ( not ( = ?auto_1681890 ?auto_1681896 ) ) ( not ( = ?auto_1681890 ?auto_1681897 ) ) ( not ( = ?auto_1681891 ?auto_1681892 ) ) ( not ( = ?auto_1681891 ?auto_1681893 ) ) ( not ( = ?auto_1681891 ?auto_1681894 ) ) ( not ( = ?auto_1681891 ?auto_1681895 ) ) ( not ( = ?auto_1681891 ?auto_1681896 ) ) ( not ( = ?auto_1681891 ?auto_1681897 ) ) ( not ( = ?auto_1681892 ?auto_1681893 ) ) ( not ( = ?auto_1681892 ?auto_1681894 ) ) ( not ( = ?auto_1681892 ?auto_1681895 ) ) ( not ( = ?auto_1681892 ?auto_1681896 ) ) ( not ( = ?auto_1681892 ?auto_1681897 ) ) ( not ( = ?auto_1681893 ?auto_1681894 ) ) ( not ( = ?auto_1681893 ?auto_1681895 ) ) ( not ( = ?auto_1681893 ?auto_1681896 ) ) ( not ( = ?auto_1681893 ?auto_1681897 ) ) ( not ( = ?auto_1681894 ?auto_1681895 ) ) ( not ( = ?auto_1681894 ?auto_1681896 ) ) ( not ( = ?auto_1681894 ?auto_1681897 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1681895 ?auto_1681896 ?auto_1681897 )
      ( MAKE-15CRATE-VERIFY ?auto_1681882 ?auto_1681883 ?auto_1681884 ?auto_1681885 ?auto_1681886 ?auto_1681887 ?auto_1681888 ?auto_1681889 ?auto_1681890 ?auto_1681891 ?auto_1681892 ?auto_1681893 ?auto_1681894 ?auto_1681895 ?auto_1681896 ?auto_1681897 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682107 - SURFACE
      ?auto_1682108 - SURFACE
      ?auto_1682109 - SURFACE
      ?auto_1682110 - SURFACE
      ?auto_1682111 - SURFACE
      ?auto_1682112 - SURFACE
      ?auto_1682113 - SURFACE
      ?auto_1682114 - SURFACE
      ?auto_1682115 - SURFACE
      ?auto_1682116 - SURFACE
      ?auto_1682117 - SURFACE
      ?auto_1682118 - SURFACE
      ?auto_1682119 - SURFACE
      ?auto_1682120 - SURFACE
      ?auto_1682121 - SURFACE
      ?auto_1682122 - SURFACE
    )
    :vars
    (
      ?auto_1682128 - HOIST
      ?auto_1682123 - PLACE
      ?auto_1682126 - TRUCK
      ?auto_1682127 - PLACE
      ?auto_1682124 - HOIST
      ?auto_1682125 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682128 ?auto_1682123 ) ( SURFACE-AT ?auto_1682121 ?auto_1682123 ) ( CLEAR ?auto_1682121 ) ( IS-CRATE ?auto_1682122 ) ( not ( = ?auto_1682121 ?auto_1682122 ) ) ( AVAILABLE ?auto_1682128 ) ( ON ?auto_1682121 ?auto_1682120 ) ( not ( = ?auto_1682120 ?auto_1682121 ) ) ( not ( = ?auto_1682120 ?auto_1682122 ) ) ( TRUCK-AT ?auto_1682126 ?auto_1682127 ) ( not ( = ?auto_1682127 ?auto_1682123 ) ) ( HOIST-AT ?auto_1682124 ?auto_1682127 ) ( not ( = ?auto_1682128 ?auto_1682124 ) ) ( AVAILABLE ?auto_1682124 ) ( SURFACE-AT ?auto_1682122 ?auto_1682127 ) ( ON ?auto_1682122 ?auto_1682125 ) ( CLEAR ?auto_1682122 ) ( not ( = ?auto_1682121 ?auto_1682125 ) ) ( not ( = ?auto_1682122 ?auto_1682125 ) ) ( not ( = ?auto_1682120 ?auto_1682125 ) ) ( ON ?auto_1682108 ?auto_1682107 ) ( ON ?auto_1682109 ?auto_1682108 ) ( ON ?auto_1682110 ?auto_1682109 ) ( ON ?auto_1682111 ?auto_1682110 ) ( ON ?auto_1682112 ?auto_1682111 ) ( ON ?auto_1682113 ?auto_1682112 ) ( ON ?auto_1682114 ?auto_1682113 ) ( ON ?auto_1682115 ?auto_1682114 ) ( ON ?auto_1682116 ?auto_1682115 ) ( ON ?auto_1682117 ?auto_1682116 ) ( ON ?auto_1682118 ?auto_1682117 ) ( ON ?auto_1682119 ?auto_1682118 ) ( ON ?auto_1682120 ?auto_1682119 ) ( not ( = ?auto_1682107 ?auto_1682108 ) ) ( not ( = ?auto_1682107 ?auto_1682109 ) ) ( not ( = ?auto_1682107 ?auto_1682110 ) ) ( not ( = ?auto_1682107 ?auto_1682111 ) ) ( not ( = ?auto_1682107 ?auto_1682112 ) ) ( not ( = ?auto_1682107 ?auto_1682113 ) ) ( not ( = ?auto_1682107 ?auto_1682114 ) ) ( not ( = ?auto_1682107 ?auto_1682115 ) ) ( not ( = ?auto_1682107 ?auto_1682116 ) ) ( not ( = ?auto_1682107 ?auto_1682117 ) ) ( not ( = ?auto_1682107 ?auto_1682118 ) ) ( not ( = ?auto_1682107 ?auto_1682119 ) ) ( not ( = ?auto_1682107 ?auto_1682120 ) ) ( not ( = ?auto_1682107 ?auto_1682121 ) ) ( not ( = ?auto_1682107 ?auto_1682122 ) ) ( not ( = ?auto_1682107 ?auto_1682125 ) ) ( not ( = ?auto_1682108 ?auto_1682109 ) ) ( not ( = ?auto_1682108 ?auto_1682110 ) ) ( not ( = ?auto_1682108 ?auto_1682111 ) ) ( not ( = ?auto_1682108 ?auto_1682112 ) ) ( not ( = ?auto_1682108 ?auto_1682113 ) ) ( not ( = ?auto_1682108 ?auto_1682114 ) ) ( not ( = ?auto_1682108 ?auto_1682115 ) ) ( not ( = ?auto_1682108 ?auto_1682116 ) ) ( not ( = ?auto_1682108 ?auto_1682117 ) ) ( not ( = ?auto_1682108 ?auto_1682118 ) ) ( not ( = ?auto_1682108 ?auto_1682119 ) ) ( not ( = ?auto_1682108 ?auto_1682120 ) ) ( not ( = ?auto_1682108 ?auto_1682121 ) ) ( not ( = ?auto_1682108 ?auto_1682122 ) ) ( not ( = ?auto_1682108 ?auto_1682125 ) ) ( not ( = ?auto_1682109 ?auto_1682110 ) ) ( not ( = ?auto_1682109 ?auto_1682111 ) ) ( not ( = ?auto_1682109 ?auto_1682112 ) ) ( not ( = ?auto_1682109 ?auto_1682113 ) ) ( not ( = ?auto_1682109 ?auto_1682114 ) ) ( not ( = ?auto_1682109 ?auto_1682115 ) ) ( not ( = ?auto_1682109 ?auto_1682116 ) ) ( not ( = ?auto_1682109 ?auto_1682117 ) ) ( not ( = ?auto_1682109 ?auto_1682118 ) ) ( not ( = ?auto_1682109 ?auto_1682119 ) ) ( not ( = ?auto_1682109 ?auto_1682120 ) ) ( not ( = ?auto_1682109 ?auto_1682121 ) ) ( not ( = ?auto_1682109 ?auto_1682122 ) ) ( not ( = ?auto_1682109 ?auto_1682125 ) ) ( not ( = ?auto_1682110 ?auto_1682111 ) ) ( not ( = ?auto_1682110 ?auto_1682112 ) ) ( not ( = ?auto_1682110 ?auto_1682113 ) ) ( not ( = ?auto_1682110 ?auto_1682114 ) ) ( not ( = ?auto_1682110 ?auto_1682115 ) ) ( not ( = ?auto_1682110 ?auto_1682116 ) ) ( not ( = ?auto_1682110 ?auto_1682117 ) ) ( not ( = ?auto_1682110 ?auto_1682118 ) ) ( not ( = ?auto_1682110 ?auto_1682119 ) ) ( not ( = ?auto_1682110 ?auto_1682120 ) ) ( not ( = ?auto_1682110 ?auto_1682121 ) ) ( not ( = ?auto_1682110 ?auto_1682122 ) ) ( not ( = ?auto_1682110 ?auto_1682125 ) ) ( not ( = ?auto_1682111 ?auto_1682112 ) ) ( not ( = ?auto_1682111 ?auto_1682113 ) ) ( not ( = ?auto_1682111 ?auto_1682114 ) ) ( not ( = ?auto_1682111 ?auto_1682115 ) ) ( not ( = ?auto_1682111 ?auto_1682116 ) ) ( not ( = ?auto_1682111 ?auto_1682117 ) ) ( not ( = ?auto_1682111 ?auto_1682118 ) ) ( not ( = ?auto_1682111 ?auto_1682119 ) ) ( not ( = ?auto_1682111 ?auto_1682120 ) ) ( not ( = ?auto_1682111 ?auto_1682121 ) ) ( not ( = ?auto_1682111 ?auto_1682122 ) ) ( not ( = ?auto_1682111 ?auto_1682125 ) ) ( not ( = ?auto_1682112 ?auto_1682113 ) ) ( not ( = ?auto_1682112 ?auto_1682114 ) ) ( not ( = ?auto_1682112 ?auto_1682115 ) ) ( not ( = ?auto_1682112 ?auto_1682116 ) ) ( not ( = ?auto_1682112 ?auto_1682117 ) ) ( not ( = ?auto_1682112 ?auto_1682118 ) ) ( not ( = ?auto_1682112 ?auto_1682119 ) ) ( not ( = ?auto_1682112 ?auto_1682120 ) ) ( not ( = ?auto_1682112 ?auto_1682121 ) ) ( not ( = ?auto_1682112 ?auto_1682122 ) ) ( not ( = ?auto_1682112 ?auto_1682125 ) ) ( not ( = ?auto_1682113 ?auto_1682114 ) ) ( not ( = ?auto_1682113 ?auto_1682115 ) ) ( not ( = ?auto_1682113 ?auto_1682116 ) ) ( not ( = ?auto_1682113 ?auto_1682117 ) ) ( not ( = ?auto_1682113 ?auto_1682118 ) ) ( not ( = ?auto_1682113 ?auto_1682119 ) ) ( not ( = ?auto_1682113 ?auto_1682120 ) ) ( not ( = ?auto_1682113 ?auto_1682121 ) ) ( not ( = ?auto_1682113 ?auto_1682122 ) ) ( not ( = ?auto_1682113 ?auto_1682125 ) ) ( not ( = ?auto_1682114 ?auto_1682115 ) ) ( not ( = ?auto_1682114 ?auto_1682116 ) ) ( not ( = ?auto_1682114 ?auto_1682117 ) ) ( not ( = ?auto_1682114 ?auto_1682118 ) ) ( not ( = ?auto_1682114 ?auto_1682119 ) ) ( not ( = ?auto_1682114 ?auto_1682120 ) ) ( not ( = ?auto_1682114 ?auto_1682121 ) ) ( not ( = ?auto_1682114 ?auto_1682122 ) ) ( not ( = ?auto_1682114 ?auto_1682125 ) ) ( not ( = ?auto_1682115 ?auto_1682116 ) ) ( not ( = ?auto_1682115 ?auto_1682117 ) ) ( not ( = ?auto_1682115 ?auto_1682118 ) ) ( not ( = ?auto_1682115 ?auto_1682119 ) ) ( not ( = ?auto_1682115 ?auto_1682120 ) ) ( not ( = ?auto_1682115 ?auto_1682121 ) ) ( not ( = ?auto_1682115 ?auto_1682122 ) ) ( not ( = ?auto_1682115 ?auto_1682125 ) ) ( not ( = ?auto_1682116 ?auto_1682117 ) ) ( not ( = ?auto_1682116 ?auto_1682118 ) ) ( not ( = ?auto_1682116 ?auto_1682119 ) ) ( not ( = ?auto_1682116 ?auto_1682120 ) ) ( not ( = ?auto_1682116 ?auto_1682121 ) ) ( not ( = ?auto_1682116 ?auto_1682122 ) ) ( not ( = ?auto_1682116 ?auto_1682125 ) ) ( not ( = ?auto_1682117 ?auto_1682118 ) ) ( not ( = ?auto_1682117 ?auto_1682119 ) ) ( not ( = ?auto_1682117 ?auto_1682120 ) ) ( not ( = ?auto_1682117 ?auto_1682121 ) ) ( not ( = ?auto_1682117 ?auto_1682122 ) ) ( not ( = ?auto_1682117 ?auto_1682125 ) ) ( not ( = ?auto_1682118 ?auto_1682119 ) ) ( not ( = ?auto_1682118 ?auto_1682120 ) ) ( not ( = ?auto_1682118 ?auto_1682121 ) ) ( not ( = ?auto_1682118 ?auto_1682122 ) ) ( not ( = ?auto_1682118 ?auto_1682125 ) ) ( not ( = ?auto_1682119 ?auto_1682120 ) ) ( not ( = ?auto_1682119 ?auto_1682121 ) ) ( not ( = ?auto_1682119 ?auto_1682122 ) ) ( not ( = ?auto_1682119 ?auto_1682125 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682120 ?auto_1682121 ?auto_1682122 )
      ( MAKE-15CRATE-VERIFY ?auto_1682107 ?auto_1682108 ?auto_1682109 ?auto_1682110 ?auto_1682111 ?auto_1682112 ?auto_1682113 ?auto_1682114 ?auto_1682115 ?auto_1682116 ?auto_1682117 ?auto_1682118 ?auto_1682119 ?auto_1682120 ?auto_1682121 ?auto_1682122 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682333 - SURFACE
      ?auto_1682334 - SURFACE
      ?auto_1682335 - SURFACE
      ?auto_1682336 - SURFACE
      ?auto_1682337 - SURFACE
      ?auto_1682338 - SURFACE
      ?auto_1682339 - SURFACE
      ?auto_1682340 - SURFACE
      ?auto_1682341 - SURFACE
      ?auto_1682342 - SURFACE
      ?auto_1682343 - SURFACE
      ?auto_1682344 - SURFACE
      ?auto_1682345 - SURFACE
      ?auto_1682346 - SURFACE
      ?auto_1682347 - SURFACE
      ?auto_1682348 - SURFACE
    )
    :vars
    (
      ?auto_1682352 - HOIST
      ?auto_1682350 - PLACE
      ?auto_1682354 - PLACE
      ?auto_1682349 - HOIST
      ?auto_1682351 - SURFACE
      ?auto_1682353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682352 ?auto_1682350 ) ( SURFACE-AT ?auto_1682347 ?auto_1682350 ) ( CLEAR ?auto_1682347 ) ( IS-CRATE ?auto_1682348 ) ( not ( = ?auto_1682347 ?auto_1682348 ) ) ( AVAILABLE ?auto_1682352 ) ( ON ?auto_1682347 ?auto_1682346 ) ( not ( = ?auto_1682346 ?auto_1682347 ) ) ( not ( = ?auto_1682346 ?auto_1682348 ) ) ( not ( = ?auto_1682354 ?auto_1682350 ) ) ( HOIST-AT ?auto_1682349 ?auto_1682354 ) ( not ( = ?auto_1682352 ?auto_1682349 ) ) ( AVAILABLE ?auto_1682349 ) ( SURFACE-AT ?auto_1682348 ?auto_1682354 ) ( ON ?auto_1682348 ?auto_1682351 ) ( CLEAR ?auto_1682348 ) ( not ( = ?auto_1682347 ?auto_1682351 ) ) ( not ( = ?auto_1682348 ?auto_1682351 ) ) ( not ( = ?auto_1682346 ?auto_1682351 ) ) ( TRUCK-AT ?auto_1682353 ?auto_1682350 ) ( ON ?auto_1682334 ?auto_1682333 ) ( ON ?auto_1682335 ?auto_1682334 ) ( ON ?auto_1682336 ?auto_1682335 ) ( ON ?auto_1682337 ?auto_1682336 ) ( ON ?auto_1682338 ?auto_1682337 ) ( ON ?auto_1682339 ?auto_1682338 ) ( ON ?auto_1682340 ?auto_1682339 ) ( ON ?auto_1682341 ?auto_1682340 ) ( ON ?auto_1682342 ?auto_1682341 ) ( ON ?auto_1682343 ?auto_1682342 ) ( ON ?auto_1682344 ?auto_1682343 ) ( ON ?auto_1682345 ?auto_1682344 ) ( ON ?auto_1682346 ?auto_1682345 ) ( not ( = ?auto_1682333 ?auto_1682334 ) ) ( not ( = ?auto_1682333 ?auto_1682335 ) ) ( not ( = ?auto_1682333 ?auto_1682336 ) ) ( not ( = ?auto_1682333 ?auto_1682337 ) ) ( not ( = ?auto_1682333 ?auto_1682338 ) ) ( not ( = ?auto_1682333 ?auto_1682339 ) ) ( not ( = ?auto_1682333 ?auto_1682340 ) ) ( not ( = ?auto_1682333 ?auto_1682341 ) ) ( not ( = ?auto_1682333 ?auto_1682342 ) ) ( not ( = ?auto_1682333 ?auto_1682343 ) ) ( not ( = ?auto_1682333 ?auto_1682344 ) ) ( not ( = ?auto_1682333 ?auto_1682345 ) ) ( not ( = ?auto_1682333 ?auto_1682346 ) ) ( not ( = ?auto_1682333 ?auto_1682347 ) ) ( not ( = ?auto_1682333 ?auto_1682348 ) ) ( not ( = ?auto_1682333 ?auto_1682351 ) ) ( not ( = ?auto_1682334 ?auto_1682335 ) ) ( not ( = ?auto_1682334 ?auto_1682336 ) ) ( not ( = ?auto_1682334 ?auto_1682337 ) ) ( not ( = ?auto_1682334 ?auto_1682338 ) ) ( not ( = ?auto_1682334 ?auto_1682339 ) ) ( not ( = ?auto_1682334 ?auto_1682340 ) ) ( not ( = ?auto_1682334 ?auto_1682341 ) ) ( not ( = ?auto_1682334 ?auto_1682342 ) ) ( not ( = ?auto_1682334 ?auto_1682343 ) ) ( not ( = ?auto_1682334 ?auto_1682344 ) ) ( not ( = ?auto_1682334 ?auto_1682345 ) ) ( not ( = ?auto_1682334 ?auto_1682346 ) ) ( not ( = ?auto_1682334 ?auto_1682347 ) ) ( not ( = ?auto_1682334 ?auto_1682348 ) ) ( not ( = ?auto_1682334 ?auto_1682351 ) ) ( not ( = ?auto_1682335 ?auto_1682336 ) ) ( not ( = ?auto_1682335 ?auto_1682337 ) ) ( not ( = ?auto_1682335 ?auto_1682338 ) ) ( not ( = ?auto_1682335 ?auto_1682339 ) ) ( not ( = ?auto_1682335 ?auto_1682340 ) ) ( not ( = ?auto_1682335 ?auto_1682341 ) ) ( not ( = ?auto_1682335 ?auto_1682342 ) ) ( not ( = ?auto_1682335 ?auto_1682343 ) ) ( not ( = ?auto_1682335 ?auto_1682344 ) ) ( not ( = ?auto_1682335 ?auto_1682345 ) ) ( not ( = ?auto_1682335 ?auto_1682346 ) ) ( not ( = ?auto_1682335 ?auto_1682347 ) ) ( not ( = ?auto_1682335 ?auto_1682348 ) ) ( not ( = ?auto_1682335 ?auto_1682351 ) ) ( not ( = ?auto_1682336 ?auto_1682337 ) ) ( not ( = ?auto_1682336 ?auto_1682338 ) ) ( not ( = ?auto_1682336 ?auto_1682339 ) ) ( not ( = ?auto_1682336 ?auto_1682340 ) ) ( not ( = ?auto_1682336 ?auto_1682341 ) ) ( not ( = ?auto_1682336 ?auto_1682342 ) ) ( not ( = ?auto_1682336 ?auto_1682343 ) ) ( not ( = ?auto_1682336 ?auto_1682344 ) ) ( not ( = ?auto_1682336 ?auto_1682345 ) ) ( not ( = ?auto_1682336 ?auto_1682346 ) ) ( not ( = ?auto_1682336 ?auto_1682347 ) ) ( not ( = ?auto_1682336 ?auto_1682348 ) ) ( not ( = ?auto_1682336 ?auto_1682351 ) ) ( not ( = ?auto_1682337 ?auto_1682338 ) ) ( not ( = ?auto_1682337 ?auto_1682339 ) ) ( not ( = ?auto_1682337 ?auto_1682340 ) ) ( not ( = ?auto_1682337 ?auto_1682341 ) ) ( not ( = ?auto_1682337 ?auto_1682342 ) ) ( not ( = ?auto_1682337 ?auto_1682343 ) ) ( not ( = ?auto_1682337 ?auto_1682344 ) ) ( not ( = ?auto_1682337 ?auto_1682345 ) ) ( not ( = ?auto_1682337 ?auto_1682346 ) ) ( not ( = ?auto_1682337 ?auto_1682347 ) ) ( not ( = ?auto_1682337 ?auto_1682348 ) ) ( not ( = ?auto_1682337 ?auto_1682351 ) ) ( not ( = ?auto_1682338 ?auto_1682339 ) ) ( not ( = ?auto_1682338 ?auto_1682340 ) ) ( not ( = ?auto_1682338 ?auto_1682341 ) ) ( not ( = ?auto_1682338 ?auto_1682342 ) ) ( not ( = ?auto_1682338 ?auto_1682343 ) ) ( not ( = ?auto_1682338 ?auto_1682344 ) ) ( not ( = ?auto_1682338 ?auto_1682345 ) ) ( not ( = ?auto_1682338 ?auto_1682346 ) ) ( not ( = ?auto_1682338 ?auto_1682347 ) ) ( not ( = ?auto_1682338 ?auto_1682348 ) ) ( not ( = ?auto_1682338 ?auto_1682351 ) ) ( not ( = ?auto_1682339 ?auto_1682340 ) ) ( not ( = ?auto_1682339 ?auto_1682341 ) ) ( not ( = ?auto_1682339 ?auto_1682342 ) ) ( not ( = ?auto_1682339 ?auto_1682343 ) ) ( not ( = ?auto_1682339 ?auto_1682344 ) ) ( not ( = ?auto_1682339 ?auto_1682345 ) ) ( not ( = ?auto_1682339 ?auto_1682346 ) ) ( not ( = ?auto_1682339 ?auto_1682347 ) ) ( not ( = ?auto_1682339 ?auto_1682348 ) ) ( not ( = ?auto_1682339 ?auto_1682351 ) ) ( not ( = ?auto_1682340 ?auto_1682341 ) ) ( not ( = ?auto_1682340 ?auto_1682342 ) ) ( not ( = ?auto_1682340 ?auto_1682343 ) ) ( not ( = ?auto_1682340 ?auto_1682344 ) ) ( not ( = ?auto_1682340 ?auto_1682345 ) ) ( not ( = ?auto_1682340 ?auto_1682346 ) ) ( not ( = ?auto_1682340 ?auto_1682347 ) ) ( not ( = ?auto_1682340 ?auto_1682348 ) ) ( not ( = ?auto_1682340 ?auto_1682351 ) ) ( not ( = ?auto_1682341 ?auto_1682342 ) ) ( not ( = ?auto_1682341 ?auto_1682343 ) ) ( not ( = ?auto_1682341 ?auto_1682344 ) ) ( not ( = ?auto_1682341 ?auto_1682345 ) ) ( not ( = ?auto_1682341 ?auto_1682346 ) ) ( not ( = ?auto_1682341 ?auto_1682347 ) ) ( not ( = ?auto_1682341 ?auto_1682348 ) ) ( not ( = ?auto_1682341 ?auto_1682351 ) ) ( not ( = ?auto_1682342 ?auto_1682343 ) ) ( not ( = ?auto_1682342 ?auto_1682344 ) ) ( not ( = ?auto_1682342 ?auto_1682345 ) ) ( not ( = ?auto_1682342 ?auto_1682346 ) ) ( not ( = ?auto_1682342 ?auto_1682347 ) ) ( not ( = ?auto_1682342 ?auto_1682348 ) ) ( not ( = ?auto_1682342 ?auto_1682351 ) ) ( not ( = ?auto_1682343 ?auto_1682344 ) ) ( not ( = ?auto_1682343 ?auto_1682345 ) ) ( not ( = ?auto_1682343 ?auto_1682346 ) ) ( not ( = ?auto_1682343 ?auto_1682347 ) ) ( not ( = ?auto_1682343 ?auto_1682348 ) ) ( not ( = ?auto_1682343 ?auto_1682351 ) ) ( not ( = ?auto_1682344 ?auto_1682345 ) ) ( not ( = ?auto_1682344 ?auto_1682346 ) ) ( not ( = ?auto_1682344 ?auto_1682347 ) ) ( not ( = ?auto_1682344 ?auto_1682348 ) ) ( not ( = ?auto_1682344 ?auto_1682351 ) ) ( not ( = ?auto_1682345 ?auto_1682346 ) ) ( not ( = ?auto_1682345 ?auto_1682347 ) ) ( not ( = ?auto_1682345 ?auto_1682348 ) ) ( not ( = ?auto_1682345 ?auto_1682351 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682346 ?auto_1682347 ?auto_1682348 )
      ( MAKE-15CRATE-VERIFY ?auto_1682333 ?auto_1682334 ?auto_1682335 ?auto_1682336 ?auto_1682337 ?auto_1682338 ?auto_1682339 ?auto_1682340 ?auto_1682341 ?auto_1682342 ?auto_1682343 ?auto_1682344 ?auto_1682345 ?auto_1682346 ?auto_1682347 ?auto_1682348 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682559 - SURFACE
      ?auto_1682560 - SURFACE
      ?auto_1682561 - SURFACE
      ?auto_1682562 - SURFACE
      ?auto_1682563 - SURFACE
      ?auto_1682564 - SURFACE
      ?auto_1682565 - SURFACE
      ?auto_1682566 - SURFACE
      ?auto_1682567 - SURFACE
      ?auto_1682568 - SURFACE
      ?auto_1682569 - SURFACE
      ?auto_1682570 - SURFACE
      ?auto_1682571 - SURFACE
      ?auto_1682572 - SURFACE
      ?auto_1682573 - SURFACE
      ?auto_1682574 - SURFACE
    )
    :vars
    (
      ?auto_1682576 - HOIST
      ?auto_1682575 - PLACE
      ?auto_1682579 - PLACE
      ?auto_1682578 - HOIST
      ?auto_1682577 - SURFACE
      ?auto_1682580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682576 ?auto_1682575 ) ( IS-CRATE ?auto_1682574 ) ( not ( = ?auto_1682573 ?auto_1682574 ) ) ( not ( = ?auto_1682572 ?auto_1682573 ) ) ( not ( = ?auto_1682572 ?auto_1682574 ) ) ( not ( = ?auto_1682579 ?auto_1682575 ) ) ( HOIST-AT ?auto_1682578 ?auto_1682579 ) ( not ( = ?auto_1682576 ?auto_1682578 ) ) ( AVAILABLE ?auto_1682578 ) ( SURFACE-AT ?auto_1682574 ?auto_1682579 ) ( ON ?auto_1682574 ?auto_1682577 ) ( CLEAR ?auto_1682574 ) ( not ( = ?auto_1682573 ?auto_1682577 ) ) ( not ( = ?auto_1682574 ?auto_1682577 ) ) ( not ( = ?auto_1682572 ?auto_1682577 ) ) ( TRUCK-AT ?auto_1682580 ?auto_1682575 ) ( SURFACE-AT ?auto_1682572 ?auto_1682575 ) ( CLEAR ?auto_1682572 ) ( LIFTING ?auto_1682576 ?auto_1682573 ) ( IS-CRATE ?auto_1682573 ) ( ON ?auto_1682560 ?auto_1682559 ) ( ON ?auto_1682561 ?auto_1682560 ) ( ON ?auto_1682562 ?auto_1682561 ) ( ON ?auto_1682563 ?auto_1682562 ) ( ON ?auto_1682564 ?auto_1682563 ) ( ON ?auto_1682565 ?auto_1682564 ) ( ON ?auto_1682566 ?auto_1682565 ) ( ON ?auto_1682567 ?auto_1682566 ) ( ON ?auto_1682568 ?auto_1682567 ) ( ON ?auto_1682569 ?auto_1682568 ) ( ON ?auto_1682570 ?auto_1682569 ) ( ON ?auto_1682571 ?auto_1682570 ) ( ON ?auto_1682572 ?auto_1682571 ) ( not ( = ?auto_1682559 ?auto_1682560 ) ) ( not ( = ?auto_1682559 ?auto_1682561 ) ) ( not ( = ?auto_1682559 ?auto_1682562 ) ) ( not ( = ?auto_1682559 ?auto_1682563 ) ) ( not ( = ?auto_1682559 ?auto_1682564 ) ) ( not ( = ?auto_1682559 ?auto_1682565 ) ) ( not ( = ?auto_1682559 ?auto_1682566 ) ) ( not ( = ?auto_1682559 ?auto_1682567 ) ) ( not ( = ?auto_1682559 ?auto_1682568 ) ) ( not ( = ?auto_1682559 ?auto_1682569 ) ) ( not ( = ?auto_1682559 ?auto_1682570 ) ) ( not ( = ?auto_1682559 ?auto_1682571 ) ) ( not ( = ?auto_1682559 ?auto_1682572 ) ) ( not ( = ?auto_1682559 ?auto_1682573 ) ) ( not ( = ?auto_1682559 ?auto_1682574 ) ) ( not ( = ?auto_1682559 ?auto_1682577 ) ) ( not ( = ?auto_1682560 ?auto_1682561 ) ) ( not ( = ?auto_1682560 ?auto_1682562 ) ) ( not ( = ?auto_1682560 ?auto_1682563 ) ) ( not ( = ?auto_1682560 ?auto_1682564 ) ) ( not ( = ?auto_1682560 ?auto_1682565 ) ) ( not ( = ?auto_1682560 ?auto_1682566 ) ) ( not ( = ?auto_1682560 ?auto_1682567 ) ) ( not ( = ?auto_1682560 ?auto_1682568 ) ) ( not ( = ?auto_1682560 ?auto_1682569 ) ) ( not ( = ?auto_1682560 ?auto_1682570 ) ) ( not ( = ?auto_1682560 ?auto_1682571 ) ) ( not ( = ?auto_1682560 ?auto_1682572 ) ) ( not ( = ?auto_1682560 ?auto_1682573 ) ) ( not ( = ?auto_1682560 ?auto_1682574 ) ) ( not ( = ?auto_1682560 ?auto_1682577 ) ) ( not ( = ?auto_1682561 ?auto_1682562 ) ) ( not ( = ?auto_1682561 ?auto_1682563 ) ) ( not ( = ?auto_1682561 ?auto_1682564 ) ) ( not ( = ?auto_1682561 ?auto_1682565 ) ) ( not ( = ?auto_1682561 ?auto_1682566 ) ) ( not ( = ?auto_1682561 ?auto_1682567 ) ) ( not ( = ?auto_1682561 ?auto_1682568 ) ) ( not ( = ?auto_1682561 ?auto_1682569 ) ) ( not ( = ?auto_1682561 ?auto_1682570 ) ) ( not ( = ?auto_1682561 ?auto_1682571 ) ) ( not ( = ?auto_1682561 ?auto_1682572 ) ) ( not ( = ?auto_1682561 ?auto_1682573 ) ) ( not ( = ?auto_1682561 ?auto_1682574 ) ) ( not ( = ?auto_1682561 ?auto_1682577 ) ) ( not ( = ?auto_1682562 ?auto_1682563 ) ) ( not ( = ?auto_1682562 ?auto_1682564 ) ) ( not ( = ?auto_1682562 ?auto_1682565 ) ) ( not ( = ?auto_1682562 ?auto_1682566 ) ) ( not ( = ?auto_1682562 ?auto_1682567 ) ) ( not ( = ?auto_1682562 ?auto_1682568 ) ) ( not ( = ?auto_1682562 ?auto_1682569 ) ) ( not ( = ?auto_1682562 ?auto_1682570 ) ) ( not ( = ?auto_1682562 ?auto_1682571 ) ) ( not ( = ?auto_1682562 ?auto_1682572 ) ) ( not ( = ?auto_1682562 ?auto_1682573 ) ) ( not ( = ?auto_1682562 ?auto_1682574 ) ) ( not ( = ?auto_1682562 ?auto_1682577 ) ) ( not ( = ?auto_1682563 ?auto_1682564 ) ) ( not ( = ?auto_1682563 ?auto_1682565 ) ) ( not ( = ?auto_1682563 ?auto_1682566 ) ) ( not ( = ?auto_1682563 ?auto_1682567 ) ) ( not ( = ?auto_1682563 ?auto_1682568 ) ) ( not ( = ?auto_1682563 ?auto_1682569 ) ) ( not ( = ?auto_1682563 ?auto_1682570 ) ) ( not ( = ?auto_1682563 ?auto_1682571 ) ) ( not ( = ?auto_1682563 ?auto_1682572 ) ) ( not ( = ?auto_1682563 ?auto_1682573 ) ) ( not ( = ?auto_1682563 ?auto_1682574 ) ) ( not ( = ?auto_1682563 ?auto_1682577 ) ) ( not ( = ?auto_1682564 ?auto_1682565 ) ) ( not ( = ?auto_1682564 ?auto_1682566 ) ) ( not ( = ?auto_1682564 ?auto_1682567 ) ) ( not ( = ?auto_1682564 ?auto_1682568 ) ) ( not ( = ?auto_1682564 ?auto_1682569 ) ) ( not ( = ?auto_1682564 ?auto_1682570 ) ) ( not ( = ?auto_1682564 ?auto_1682571 ) ) ( not ( = ?auto_1682564 ?auto_1682572 ) ) ( not ( = ?auto_1682564 ?auto_1682573 ) ) ( not ( = ?auto_1682564 ?auto_1682574 ) ) ( not ( = ?auto_1682564 ?auto_1682577 ) ) ( not ( = ?auto_1682565 ?auto_1682566 ) ) ( not ( = ?auto_1682565 ?auto_1682567 ) ) ( not ( = ?auto_1682565 ?auto_1682568 ) ) ( not ( = ?auto_1682565 ?auto_1682569 ) ) ( not ( = ?auto_1682565 ?auto_1682570 ) ) ( not ( = ?auto_1682565 ?auto_1682571 ) ) ( not ( = ?auto_1682565 ?auto_1682572 ) ) ( not ( = ?auto_1682565 ?auto_1682573 ) ) ( not ( = ?auto_1682565 ?auto_1682574 ) ) ( not ( = ?auto_1682565 ?auto_1682577 ) ) ( not ( = ?auto_1682566 ?auto_1682567 ) ) ( not ( = ?auto_1682566 ?auto_1682568 ) ) ( not ( = ?auto_1682566 ?auto_1682569 ) ) ( not ( = ?auto_1682566 ?auto_1682570 ) ) ( not ( = ?auto_1682566 ?auto_1682571 ) ) ( not ( = ?auto_1682566 ?auto_1682572 ) ) ( not ( = ?auto_1682566 ?auto_1682573 ) ) ( not ( = ?auto_1682566 ?auto_1682574 ) ) ( not ( = ?auto_1682566 ?auto_1682577 ) ) ( not ( = ?auto_1682567 ?auto_1682568 ) ) ( not ( = ?auto_1682567 ?auto_1682569 ) ) ( not ( = ?auto_1682567 ?auto_1682570 ) ) ( not ( = ?auto_1682567 ?auto_1682571 ) ) ( not ( = ?auto_1682567 ?auto_1682572 ) ) ( not ( = ?auto_1682567 ?auto_1682573 ) ) ( not ( = ?auto_1682567 ?auto_1682574 ) ) ( not ( = ?auto_1682567 ?auto_1682577 ) ) ( not ( = ?auto_1682568 ?auto_1682569 ) ) ( not ( = ?auto_1682568 ?auto_1682570 ) ) ( not ( = ?auto_1682568 ?auto_1682571 ) ) ( not ( = ?auto_1682568 ?auto_1682572 ) ) ( not ( = ?auto_1682568 ?auto_1682573 ) ) ( not ( = ?auto_1682568 ?auto_1682574 ) ) ( not ( = ?auto_1682568 ?auto_1682577 ) ) ( not ( = ?auto_1682569 ?auto_1682570 ) ) ( not ( = ?auto_1682569 ?auto_1682571 ) ) ( not ( = ?auto_1682569 ?auto_1682572 ) ) ( not ( = ?auto_1682569 ?auto_1682573 ) ) ( not ( = ?auto_1682569 ?auto_1682574 ) ) ( not ( = ?auto_1682569 ?auto_1682577 ) ) ( not ( = ?auto_1682570 ?auto_1682571 ) ) ( not ( = ?auto_1682570 ?auto_1682572 ) ) ( not ( = ?auto_1682570 ?auto_1682573 ) ) ( not ( = ?auto_1682570 ?auto_1682574 ) ) ( not ( = ?auto_1682570 ?auto_1682577 ) ) ( not ( = ?auto_1682571 ?auto_1682572 ) ) ( not ( = ?auto_1682571 ?auto_1682573 ) ) ( not ( = ?auto_1682571 ?auto_1682574 ) ) ( not ( = ?auto_1682571 ?auto_1682577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682572 ?auto_1682573 ?auto_1682574 )
      ( MAKE-15CRATE-VERIFY ?auto_1682559 ?auto_1682560 ?auto_1682561 ?auto_1682562 ?auto_1682563 ?auto_1682564 ?auto_1682565 ?auto_1682566 ?auto_1682567 ?auto_1682568 ?auto_1682569 ?auto_1682570 ?auto_1682571 ?auto_1682572 ?auto_1682573 ?auto_1682574 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_1682785 - SURFACE
      ?auto_1682786 - SURFACE
      ?auto_1682787 - SURFACE
      ?auto_1682788 - SURFACE
      ?auto_1682789 - SURFACE
      ?auto_1682790 - SURFACE
      ?auto_1682791 - SURFACE
      ?auto_1682792 - SURFACE
      ?auto_1682793 - SURFACE
      ?auto_1682794 - SURFACE
      ?auto_1682795 - SURFACE
      ?auto_1682796 - SURFACE
      ?auto_1682797 - SURFACE
      ?auto_1682798 - SURFACE
      ?auto_1682799 - SURFACE
      ?auto_1682800 - SURFACE
    )
    :vars
    (
      ?auto_1682801 - HOIST
      ?auto_1682804 - PLACE
      ?auto_1682806 - PLACE
      ?auto_1682803 - HOIST
      ?auto_1682805 - SURFACE
      ?auto_1682802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682801 ?auto_1682804 ) ( IS-CRATE ?auto_1682800 ) ( not ( = ?auto_1682799 ?auto_1682800 ) ) ( not ( = ?auto_1682798 ?auto_1682799 ) ) ( not ( = ?auto_1682798 ?auto_1682800 ) ) ( not ( = ?auto_1682806 ?auto_1682804 ) ) ( HOIST-AT ?auto_1682803 ?auto_1682806 ) ( not ( = ?auto_1682801 ?auto_1682803 ) ) ( AVAILABLE ?auto_1682803 ) ( SURFACE-AT ?auto_1682800 ?auto_1682806 ) ( ON ?auto_1682800 ?auto_1682805 ) ( CLEAR ?auto_1682800 ) ( not ( = ?auto_1682799 ?auto_1682805 ) ) ( not ( = ?auto_1682800 ?auto_1682805 ) ) ( not ( = ?auto_1682798 ?auto_1682805 ) ) ( TRUCK-AT ?auto_1682802 ?auto_1682804 ) ( SURFACE-AT ?auto_1682798 ?auto_1682804 ) ( CLEAR ?auto_1682798 ) ( IS-CRATE ?auto_1682799 ) ( AVAILABLE ?auto_1682801 ) ( IN ?auto_1682799 ?auto_1682802 ) ( ON ?auto_1682786 ?auto_1682785 ) ( ON ?auto_1682787 ?auto_1682786 ) ( ON ?auto_1682788 ?auto_1682787 ) ( ON ?auto_1682789 ?auto_1682788 ) ( ON ?auto_1682790 ?auto_1682789 ) ( ON ?auto_1682791 ?auto_1682790 ) ( ON ?auto_1682792 ?auto_1682791 ) ( ON ?auto_1682793 ?auto_1682792 ) ( ON ?auto_1682794 ?auto_1682793 ) ( ON ?auto_1682795 ?auto_1682794 ) ( ON ?auto_1682796 ?auto_1682795 ) ( ON ?auto_1682797 ?auto_1682796 ) ( ON ?auto_1682798 ?auto_1682797 ) ( not ( = ?auto_1682785 ?auto_1682786 ) ) ( not ( = ?auto_1682785 ?auto_1682787 ) ) ( not ( = ?auto_1682785 ?auto_1682788 ) ) ( not ( = ?auto_1682785 ?auto_1682789 ) ) ( not ( = ?auto_1682785 ?auto_1682790 ) ) ( not ( = ?auto_1682785 ?auto_1682791 ) ) ( not ( = ?auto_1682785 ?auto_1682792 ) ) ( not ( = ?auto_1682785 ?auto_1682793 ) ) ( not ( = ?auto_1682785 ?auto_1682794 ) ) ( not ( = ?auto_1682785 ?auto_1682795 ) ) ( not ( = ?auto_1682785 ?auto_1682796 ) ) ( not ( = ?auto_1682785 ?auto_1682797 ) ) ( not ( = ?auto_1682785 ?auto_1682798 ) ) ( not ( = ?auto_1682785 ?auto_1682799 ) ) ( not ( = ?auto_1682785 ?auto_1682800 ) ) ( not ( = ?auto_1682785 ?auto_1682805 ) ) ( not ( = ?auto_1682786 ?auto_1682787 ) ) ( not ( = ?auto_1682786 ?auto_1682788 ) ) ( not ( = ?auto_1682786 ?auto_1682789 ) ) ( not ( = ?auto_1682786 ?auto_1682790 ) ) ( not ( = ?auto_1682786 ?auto_1682791 ) ) ( not ( = ?auto_1682786 ?auto_1682792 ) ) ( not ( = ?auto_1682786 ?auto_1682793 ) ) ( not ( = ?auto_1682786 ?auto_1682794 ) ) ( not ( = ?auto_1682786 ?auto_1682795 ) ) ( not ( = ?auto_1682786 ?auto_1682796 ) ) ( not ( = ?auto_1682786 ?auto_1682797 ) ) ( not ( = ?auto_1682786 ?auto_1682798 ) ) ( not ( = ?auto_1682786 ?auto_1682799 ) ) ( not ( = ?auto_1682786 ?auto_1682800 ) ) ( not ( = ?auto_1682786 ?auto_1682805 ) ) ( not ( = ?auto_1682787 ?auto_1682788 ) ) ( not ( = ?auto_1682787 ?auto_1682789 ) ) ( not ( = ?auto_1682787 ?auto_1682790 ) ) ( not ( = ?auto_1682787 ?auto_1682791 ) ) ( not ( = ?auto_1682787 ?auto_1682792 ) ) ( not ( = ?auto_1682787 ?auto_1682793 ) ) ( not ( = ?auto_1682787 ?auto_1682794 ) ) ( not ( = ?auto_1682787 ?auto_1682795 ) ) ( not ( = ?auto_1682787 ?auto_1682796 ) ) ( not ( = ?auto_1682787 ?auto_1682797 ) ) ( not ( = ?auto_1682787 ?auto_1682798 ) ) ( not ( = ?auto_1682787 ?auto_1682799 ) ) ( not ( = ?auto_1682787 ?auto_1682800 ) ) ( not ( = ?auto_1682787 ?auto_1682805 ) ) ( not ( = ?auto_1682788 ?auto_1682789 ) ) ( not ( = ?auto_1682788 ?auto_1682790 ) ) ( not ( = ?auto_1682788 ?auto_1682791 ) ) ( not ( = ?auto_1682788 ?auto_1682792 ) ) ( not ( = ?auto_1682788 ?auto_1682793 ) ) ( not ( = ?auto_1682788 ?auto_1682794 ) ) ( not ( = ?auto_1682788 ?auto_1682795 ) ) ( not ( = ?auto_1682788 ?auto_1682796 ) ) ( not ( = ?auto_1682788 ?auto_1682797 ) ) ( not ( = ?auto_1682788 ?auto_1682798 ) ) ( not ( = ?auto_1682788 ?auto_1682799 ) ) ( not ( = ?auto_1682788 ?auto_1682800 ) ) ( not ( = ?auto_1682788 ?auto_1682805 ) ) ( not ( = ?auto_1682789 ?auto_1682790 ) ) ( not ( = ?auto_1682789 ?auto_1682791 ) ) ( not ( = ?auto_1682789 ?auto_1682792 ) ) ( not ( = ?auto_1682789 ?auto_1682793 ) ) ( not ( = ?auto_1682789 ?auto_1682794 ) ) ( not ( = ?auto_1682789 ?auto_1682795 ) ) ( not ( = ?auto_1682789 ?auto_1682796 ) ) ( not ( = ?auto_1682789 ?auto_1682797 ) ) ( not ( = ?auto_1682789 ?auto_1682798 ) ) ( not ( = ?auto_1682789 ?auto_1682799 ) ) ( not ( = ?auto_1682789 ?auto_1682800 ) ) ( not ( = ?auto_1682789 ?auto_1682805 ) ) ( not ( = ?auto_1682790 ?auto_1682791 ) ) ( not ( = ?auto_1682790 ?auto_1682792 ) ) ( not ( = ?auto_1682790 ?auto_1682793 ) ) ( not ( = ?auto_1682790 ?auto_1682794 ) ) ( not ( = ?auto_1682790 ?auto_1682795 ) ) ( not ( = ?auto_1682790 ?auto_1682796 ) ) ( not ( = ?auto_1682790 ?auto_1682797 ) ) ( not ( = ?auto_1682790 ?auto_1682798 ) ) ( not ( = ?auto_1682790 ?auto_1682799 ) ) ( not ( = ?auto_1682790 ?auto_1682800 ) ) ( not ( = ?auto_1682790 ?auto_1682805 ) ) ( not ( = ?auto_1682791 ?auto_1682792 ) ) ( not ( = ?auto_1682791 ?auto_1682793 ) ) ( not ( = ?auto_1682791 ?auto_1682794 ) ) ( not ( = ?auto_1682791 ?auto_1682795 ) ) ( not ( = ?auto_1682791 ?auto_1682796 ) ) ( not ( = ?auto_1682791 ?auto_1682797 ) ) ( not ( = ?auto_1682791 ?auto_1682798 ) ) ( not ( = ?auto_1682791 ?auto_1682799 ) ) ( not ( = ?auto_1682791 ?auto_1682800 ) ) ( not ( = ?auto_1682791 ?auto_1682805 ) ) ( not ( = ?auto_1682792 ?auto_1682793 ) ) ( not ( = ?auto_1682792 ?auto_1682794 ) ) ( not ( = ?auto_1682792 ?auto_1682795 ) ) ( not ( = ?auto_1682792 ?auto_1682796 ) ) ( not ( = ?auto_1682792 ?auto_1682797 ) ) ( not ( = ?auto_1682792 ?auto_1682798 ) ) ( not ( = ?auto_1682792 ?auto_1682799 ) ) ( not ( = ?auto_1682792 ?auto_1682800 ) ) ( not ( = ?auto_1682792 ?auto_1682805 ) ) ( not ( = ?auto_1682793 ?auto_1682794 ) ) ( not ( = ?auto_1682793 ?auto_1682795 ) ) ( not ( = ?auto_1682793 ?auto_1682796 ) ) ( not ( = ?auto_1682793 ?auto_1682797 ) ) ( not ( = ?auto_1682793 ?auto_1682798 ) ) ( not ( = ?auto_1682793 ?auto_1682799 ) ) ( not ( = ?auto_1682793 ?auto_1682800 ) ) ( not ( = ?auto_1682793 ?auto_1682805 ) ) ( not ( = ?auto_1682794 ?auto_1682795 ) ) ( not ( = ?auto_1682794 ?auto_1682796 ) ) ( not ( = ?auto_1682794 ?auto_1682797 ) ) ( not ( = ?auto_1682794 ?auto_1682798 ) ) ( not ( = ?auto_1682794 ?auto_1682799 ) ) ( not ( = ?auto_1682794 ?auto_1682800 ) ) ( not ( = ?auto_1682794 ?auto_1682805 ) ) ( not ( = ?auto_1682795 ?auto_1682796 ) ) ( not ( = ?auto_1682795 ?auto_1682797 ) ) ( not ( = ?auto_1682795 ?auto_1682798 ) ) ( not ( = ?auto_1682795 ?auto_1682799 ) ) ( not ( = ?auto_1682795 ?auto_1682800 ) ) ( not ( = ?auto_1682795 ?auto_1682805 ) ) ( not ( = ?auto_1682796 ?auto_1682797 ) ) ( not ( = ?auto_1682796 ?auto_1682798 ) ) ( not ( = ?auto_1682796 ?auto_1682799 ) ) ( not ( = ?auto_1682796 ?auto_1682800 ) ) ( not ( = ?auto_1682796 ?auto_1682805 ) ) ( not ( = ?auto_1682797 ?auto_1682798 ) ) ( not ( = ?auto_1682797 ?auto_1682799 ) ) ( not ( = ?auto_1682797 ?auto_1682800 ) ) ( not ( = ?auto_1682797 ?auto_1682805 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1682798 ?auto_1682799 ?auto_1682800 )
      ( MAKE-15CRATE-VERIFY ?auto_1682785 ?auto_1682786 ?auto_1682787 ?auto_1682788 ?auto_1682789 ?auto_1682790 ?auto_1682791 ?auto_1682792 ?auto_1682793 ?auto_1682794 ?auto_1682795 ?auto_1682796 ?auto_1682797 ?auto_1682798 ?auto_1682799 ?auto_1682800 ) )
  )

)

