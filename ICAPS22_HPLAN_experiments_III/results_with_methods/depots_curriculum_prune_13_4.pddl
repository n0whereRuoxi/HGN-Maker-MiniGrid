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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15816 - SURFACE
      ?auto_15817 - SURFACE
    )
    :vars
    (
      ?auto_15818 - HOIST
      ?auto_15819 - PLACE
      ?auto_15821 - PLACE
      ?auto_15822 - HOIST
      ?auto_15823 - SURFACE
      ?auto_15820 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15818 ?auto_15819 ) ( SURFACE-AT ?auto_15816 ?auto_15819 ) ( CLEAR ?auto_15816 ) ( IS-CRATE ?auto_15817 ) ( AVAILABLE ?auto_15818 ) ( not ( = ?auto_15821 ?auto_15819 ) ) ( HOIST-AT ?auto_15822 ?auto_15821 ) ( AVAILABLE ?auto_15822 ) ( SURFACE-AT ?auto_15817 ?auto_15821 ) ( ON ?auto_15817 ?auto_15823 ) ( CLEAR ?auto_15817 ) ( TRUCK-AT ?auto_15820 ?auto_15819 ) ( not ( = ?auto_15816 ?auto_15817 ) ) ( not ( = ?auto_15816 ?auto_15823 ) ) ( not ( = ?auto_15817 ?auto_15823 ) ) ( not ( = ?auto_15818 ?auto_15822 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15820 ?auto_15819 ?auto_15821 )
      ( !LIFT ?auto_15822 ?auto_15817 ?auto_15823 ?auto_15821 )
      ( !LOAD ?auto_15822 ?auto_15817 ?auto_15820 ?auto_15821 )
      ( !DRIVE ?auto_15820 ?auto_15821 ?auto_15819 )
      ( !UNLOAD ?auto_15818 ?auto_15817 ?auto_15820 ?auto_15819 )
      ( !DROP ?auto_15818 ?auto_15817 ?auto_15816 ?auto_15819 )
      ( MAKE-1CRATE-VERIFY ?auto_15816 ?auto_15817 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_15837 - SURFACE
      ?auto_15838 - SURFACE
      ?auto_15839 - SURFACE
    )
    :vars
    (
      ?auto_15842 - HOIST
      ?auto_15841 - PLACE
      ?auto_15845 - PLACE
      ?auto_15843 - HOIST
      ?auto_15844 - SURFACE
      ?auto_15848 - PLACE
      ?auto_15846 - HOIST
      ?auto_15847 - SURFACE
      ?auto_15840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15842 ?auto_15841 ) ( IS-CRATE ?auto_15839 ) ( not ( = ?auto_15845 ?auto_15841 ) ) ( HOIST-AT ?auto_15843 ?auto_15845 ) ( AVAILABLE ?auto_15843 ) ( SURFACE-AT ?auto_15839 ?auto_15845 ) ( ON ?auto_15839 ?auto_15844 ) ( CLEAR ?auto_15839 ) ( not ( = ?auto_15838 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15844 ) ) ( not ( = ?auto_15839 ?auto_15844 ) ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( SURFACE-AT ?auto_15837 ?auto_15841 ) ( CLEAR ?auto_15837 ) ( IS-CRATE ?auto_15838 ) ( AVAILABLE ?auto_15842 ) ( not ( = ?auto_15848 ?auto_15841 ) ) ( HOIST-AT ?auto_15846 ?auto_15848 ) ( AVAILABLE ?auto_15846 ) ( SURFACE-AT ?auto_15838 ?auto_15848 ) ( ON ?auto_15838 ?auto_15847 ) ( CLEAR ?auto_15838 ) ( TRUCK-AT ?auto_15840 ?auto_15841 ) ( not ( = ?auto_15837 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15847 ) ) ( not ( = ?auto_15838 ?auto_15847 ) ) ( not ( = ?auto_15842 ?auto_15846 ) ) ( not ( = ?auto_15837 ?auto_15839 ) ) ( not ( = ?auto_15837 ?auto_15844 ) ) ( not ( = ?auto_15839 ?auto_15847 ) ) ( not ( = ?auto_15845 ?auto_15848 ) ) ( not ( = ?auto_15843 ?auto_15846 ) ) ( not ( = ?auto_15844 ?auto_15847 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15837 ?auto_15838 )
      ( MAKE-1CRATE ?auto_15838 ?auto_15839 )
      ( MAKE-2CRATE-VERIFY ?auto_15837 ?auto_15838 ?auto_15839 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_15863 - SURFACE
      ?auto_15864 - SURFACE
      ?auto_15865 - SURFACE
      ?auto_15866 - SURFACE
    )
    :vars
    (
      ?auto_15867 - HOIST
      ?auto_15871 - PLACE
      ?auto_15869 - PLACE
      ?auto_15868 - HOIST
      ?auto_15872 - SURFACE
      ?auto_15875 - PLACE
      ?auto_15877 - HOIST
      ?auto_15873 - SURFACE
      ?auto_15874 - PLACE
      ?auto_15878 - HOIST
      ?auto_15876 - SURFACE
      ?auto_15870 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15867 ?auto_15871 ) ( IS-CRATE ?auto_15866 ) ( not ( = ?auto_15869 ?auto_15871 ) ) ( HOIST-AT ?auto_15868 ?auto_15869 ) ( AVAILABLE ?auto_15868 ) ( SURFACE-AT ?auto_15866 ?auto_15869 ) ( ON ?auto_15866 ?auto_15872 ) ( CLEAR ?auto_15866 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15872 ) ) ( not ( = ?auto_15866 ?auto_15872 ) ) ( not ( = ?auto_15867 ?auto_15868 ) ) ( IS-CRATE ?auto_15865 ) ( not ( = ?auto_15875 ?auto_15871 ) ) ( HOIST-AT ?auto_15877 ?auto_15875 ) ( AVAILABLE ?auto_15877 ) ( SURFACE-AT ?auto_15865 ?auto_15875 ) ( ON ?auto_15865 ?auto_15873 ) ( CLEAR ?auto_15865 ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15873 ) ) ( not ( = ?auto_15865 ?auto_15873 ) ) ( not ( = ?auto_15867 ?auto_15877 ) ) ( SURFACE-AT ?auto_15863 ?auto_15871 ) ( CLEAR ?auto_15863 ) ( IS-CRATE ?auto_15864 ) ( AVAILABLE ?auto_15867 ) ( not ( = ?auto_15874 ?auto_15871 ) ) ( HOIST-AT ?auto_15878 ?auto_15874 ) ( AVAILABLE ?auto_15878 ) ( SURFACE-AT ?auto_15864 ?auto_15874 ) ( ON ?auto_15864 ?auto_15876 ) ( CLEAR ?auto_15864 ) ( TRUCK-AT ?auto_15870 ?auto_15871 ) ( not ( = ?auto_15863 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15876 ) ) ( not ( = ?auto_15864 ?auto_15876 ) ) ( not ( = ?auto_15867 ?auto_15878 ) ) ( not ( = ?auto_15863 ?auto_15865 ) ) ( not ( = ?auto_15863 ?auto_15873 ) ) ( not ( = ?auto_15865 ?auto_15876 ) ) ( not ( = ?auto_15875 ?auto_15874 ) ) ( not ( = ?auto_15877 ?auto_15878 ) ) ( not ( = ?auto_15873 ?auto_15876 ) ) ( not ( = ?auto_15863 ?auto_15866 ) ) ( not ( = ?auto_15863 ?auto_15872 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( not ( = ?auto_15864 ?auto_15872 ) ) ( not ( = ?auto_15866 ?auto_15873 ) ) ( not ( = ?auto_15866 ?auto_15876 ) ) ( not ( = ?auto_15869 ?auto_15875 ) ) ( not ( = ?auto_15869 ?auto_15874 ) ) ( not ( = ?auto_15868 ?auto_15877 ) ) ( not ( = ?auto_15868 ?auto_15878 ) ) ( not ( = ?auto_15872 ?auto_15873 ) ) ( not ( = ?auto_15872 ?auto_15876 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15863 ?auto_15864 ?auto_15865 )
      ( MAKE-1CRATE ?auto_15865 ?auto_15866 )
      ( MAKE-3CRATE-VERIFY ?auto_15863 ?auto_15864 ?auto_15865 ?auto_15866 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_15894 - SURFACE
      ?auto_15895 - SURFACE
      ?auto_15896 - SURFACE
      ?auto_15897 - SURFACE
      ?auto_15898 - SURFACE
    )
    :vars
    (
      ?auto_15904 - HOIST
      ?auto_15899 - PLACE
      ?auto_15903 - PLACE
      ?auto_15900 - HOIST
      ?auto_15902 - SURFACE
      ?auto_15909 - PLACE
      ?auto_15911 - HOIST
      ?auto_15905 - SURFACE
      ?auto_15907 - PLACE
      ?auto_15908 - HOIST
      ?auto_15910 - SURFACE
      ?auto_15906 - SURFACE
      ?auto_15901 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15904 ?auto_15899 ) ( IS-CRATE ?auto_15898 ) ( not ( = ?auto_15903 ?auto_15899 ) ) ( HOIST-AT ?auto_15900 ?auto_15903 ) ( SURFACE-AT ?auto_15898 ?auto_15903 ) ( ON ?auto_15898 ?auto_15902 ) ( CLEAR ?auto_15898 ) ( not ( = ?auto_15897 ?auto_15898 ) ) ( not ( = ?auto_15897 ?auto_15902 ) ) ( not ( = ?auto_15898 ?auto_15902 ) ) ( not ( = ?auto_15904 ?auto_15900 ) ) ( IS-CRATE ?auto_15897 ) ( not ( = ?auto_15909 ?auto_15899 ) ) ( HOIST-AT ?auto_15911 ?auto_15909 ) ( AVAILABLE ?auto_15911 ) ( SURFACE-AT ?auto_15897 ?auto_15909 ) ( ON ?auto_15897 ?auto_15905 ) ( CLEAR ?auto_15897 ) ( not ( = ?auto_15896 ?auto_15897 ) ) ( not ( = ?auto_15896 ?auto_15905 ) ) ( not ( = ?auto_15897 ?auto_15905 ) ) ( not ( = ?auto_15904 ?auto_15911 ) ) ( IS-CRATE ?auto_15896 ) ( not ( = ?auto_15907 ?auto_15899 ) ) ( HOIST-AT ?auto_15908 ?auto_15907 ) ( AVAILABLE ?auto_15908 ) ( SURFACE-AT ?auto_15896 ?auto_15907 ) ( ON ?auto_15896 ?auto_15910 ) ( CLEAR ?auto_15896 ) ( not ( = ?auto_15895 ?auto_15896 ) ) ( not ( = ?auto_15895 ?auto_15910 ) ) ( not ( = ?auto_15896 ?auto_15910 ) ) ( not ( = ?auto_15904 ?auto_15908 ) ) ( SURFACE-AT ?auto_15894 ?auto_15899 ) ( CLEAR ?auto_15894 ) ( IS-CRATE ?auto_15895 ) ( AVAILABLE ?auto_15904 ) ( AVAILABLE ?auto_15900 ) ( SURFACE-AT ?auto_15895 ?auto_15903 ) ( ON ?auto_15895 ?auto_15906 ) ( CLEAR ?auto_15895 ) ( TRUCK-AT ?auto_15901 ?auto_15899 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15906 ) ) ( not ( = ?auto_15895 ?auto_15906 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15894 ?auto_15910 ) ) ( not ( = ?auto_15896 ?auto_15906 ) ) ( not ( = ?auto_15907 ?auto_15903 ) ) ( not ( = ?auto_15908 ?auto_15900 ) ) ( not ( = ?auto_15910 ?auto_15906 ) ) ( not ( = ?auto_15894 ?auto_15897 ) ) ( not ( = ?auto_15894 ?auto_15905 ) ) ( not ( = ?auto_15895 ?auto_15897 ) ) ( not ( = ?auto_15895 ?auto_15905 ) ) ( not ( = ?auto_15897 ?auto_15910 ) ) ( not ( = ?auto_15897 ?auto_15906 ) ) ( not ( = ?auto_15909 ?auto_15907 ) ) ( not ( = ?auto_15909 ?auto_15903 ) ) ( not ( = ?auto_15911 ?auto_15908 ) ) ( not ( = ?auto_15911 ?auto_15900 ) ) ( not ( = ?auto_15905 ?auto_15910 ) ) ( not ( = ?auto_15905 ?auto_15906 ) ) ( not ( = ?auto_15894 ?auto_15898 ) ) ( not ( = ?auto_15894 ?auto_15902 ) ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15895 ?auto_15902 ) ) ( not ( = ?auto_15896 ?auto_15898 ) ) ( not ( = ?auto_15896 ?auto_15902 ) ) ( not ( = ?auto_15898 ?auto_15905 ) ) ( not ( = ?auto_15898 ?auto_15910 ) ) ( not ( = ?auto_15898 ?auto_15906 ) ) ( not ( = ?auto_15902 ?auto_15905 ) ) ( not ( = ?auto_15902 ?auto_15910 ) ) ( not ( = ?auto_15902 ?auto_15906 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15894 ?auto_15895 ?auto_15896 ?auto_15897 )
      ( MAKE-1CRATE ?auto_15897 ?auto_15898 )
      ( MAKE-4CRATE-VERIFY ?auto_15894 ?auto_15895 ?auto_15896 ?auto_15897 ?auto_15898 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_15928 - SURFACE
      ?auto_15929 - SURFACE
      ?auto_15930 - SURFACE
      ?auto_15931 - SURFACE
      ?auto_15932 - SURFACE
      ?auto_15933 - SURFACE
    )
    :vars
    (
      ?auto_15935 - HOIST
      ?auto_15938 - PLACE
      ?auto_15939 - PLACE
      ?auto_15937 - HOIST
      ?auto_15934 - SURFACE
      ?auto_15942 - PLACE
      ?auto_15946 - HOIST
      ?auto_15940 - SURFACE
      ?auto_15943 - SURFACE
      ?auto_15944 - PLACE
      ?auto_15945 - HOIST
      ?auto_15941 - SURFACE
      ?auto_15947 - SURFACE
      ?auto_15936 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15935 ?auto_15938 ) ( IS-CRATE ?auto_15933 ) ( not ( = ?auto_15939 ?auto_15938 ) ) ( HOIST-AT ?auto_15937 ?auto_15939 ) ( SURFACE-AT ?auto_15933 ?auto_15939 ) ( ON ?auto_15933 ?auto_15934 ) ( CLEAR ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15934 ) ) ( not ( = ?auto_15935 ?auto_15937 ) ) ( IS-CRATE ?auto_15932 ) ( not ( = ?auto_15942 ?auto_15938 ) ) ( HOIST-AT ?auto_15946 ?auto_15942 ) ( SURFACE-AT ?auto_15932 ?auto_15942 ) ( ON ?auto_15932 ?auto_15940 ) ( CLEAR ?auto_15932 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15940 ) ) ( not ( = ?auto_15932 ?auto_15940 ) ) ( not ( = ?auto_15935 ?auto_15946 ) ) ( IS-CRATE ?auto_15931 ) ( AVAILABLE ?auto_15937 ) ( SURFACE-AT ?auto_15931 ?auto_15939 ) ( ON ?auto_15931 ?auto_15943 ) ( CLEAR ?auto_15931 ) ( not ( = ?auto_15930 ?auto_15931 ) ) ( not ( = ?auto_15930 ?auto_15943 ) ) ( not ( = ?auto_15931 ?auto_15943 ) ) ( IS-CRATE ?auto_15930 ) ( not ( = ?auto_15944 ?auto_15938 ) ) ( HOIST-AT ?auto_15945 ?auto_15944 ) ( AVAILABLE ?auto_15945 ) ( SURFACE-AT ?auto_15930 ?auto_15944 ) ( ON ?auto_15930 ?auto_15941 ) ( CLEAR ?auto_15930 ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15941 ) ) ( not ( = ?auto_15930 ?auto_15941 ) ) ( not ( = ?auto_15935 ?auto_15945 ) ) ( SURFACE-AT ?auto_15928 ?auto_15938 ) ( CLEAR ?auto_15928 ) ( IS-CRATE ?auto_15929 ) ( AVAILABLE ?auto_15935 ) ( AVAILABLE ?auto_15946 ) ( SURFACE-AT ?auto_15929 ?auto_15942 ) ( ON ?auto_15929 ?auto_15947 ) ( CLEAR ?auto_15929 ) ( TRUCK-AT ?auto_15936 ?auto_15938 ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15947 ) ) ( not ( = ?auto_15929 ?auto_15947 ) ) ( not ( = ?auto_15928 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15941 ) ) ( not ( = ?auto_15930 ?auto_15947 ) ) ( not ( = ?auto_15944 ?auto_15942 ) ) ( not ( = ?auto_15945 ?auto_15946 ) ) ( not ( = ?auto_15941 ?auto_15947 ) ) ( not ( = ?auto_15928 ?auto_15931 ) ) ( not ( = ?auto_15928 ?auto_15943 ) ) ( not ( = ?auto_15929 ?auto_15931 ) ) ( not ( = ?auto_15929 ?auto_15943 ) ) ( not ( = ?auto_15931 ?auto_15941 ) ) ( not ( = ?auto_15931 ?auto_15947 ) ) ( not ( = ?auto_15939 ?auto_15944 ) ) ( not ( = ?auto_15939 ?auto_15942 ) ) ( not ( = ?auto_15937 ?auto_15945 ) ) ( not ( = ?auto_15937 ?auto_15946 ) ) ( not ( = ?auto_15943 ?auto_15941 ) ) ( not ( = ?auto_15943 ?auto_15947 ) ) ( not ( = ?auto_15928 ?auto_15932 ) ) ( not ( = ?auto_15928 ?auto_15940 ) ) ( not ( = ?auto_15929 ?auto_15932 ) ) ( not ( = ?auto_15929 ?auto_15940 ) ) ( not ( = ?auto_15930 ?auto_15932 ) ) ( not ( = ?auto_15930 ?auto_15940 ) ) ( not ( = ?auto_15932 ?auto_15943 ) ) ( not ( = ?auto_15932 ?auto_15941 ) ) ( not ( = ?auto_15932 ?auto_15947 ) ) ( not ( = ?auto_15940 ?auto_15943 ) ) ( not ( = ?auto_15940 ?auto_15941 ) ) ( not ( = ?auto_15940 ?auto_15947 ) ) ( not ( = ?auto_15928 ?auto_15933 ) ) ( not ( = ?auto_15928 ?auto_15934 ) ) ( not ( = ?auto_15929 ?auto_15933 ) ) ( not ( = ?auto_15929 ?auto_15934 ) ) ( not ( = ?auto_15930 ?auto_15933 ) ) ( not ( = ?auto_15930 ?auto_15934 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15934 ) ) ( not ( = ?auto_15933 ?auto_15940 ) ) ( not ( = ?auto_15933 ?auto_15943 ) ) ( not ( = ?auto_15933 ?auto_15941 ) ) ( not ( = ?auto_15933 ?auto_15947 ) ) ( not ( = ?auto_15934 ?auto_15940 ) ) ( not ( = ?auto_15934 ?auto_15943 ) ) ( not ( = ?auto_15934 ?auto_15941 ) ) ( not ( = ?auto_15934 ?auto_15947 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15931 ?auto_15932 )
      ( MAKE-1CRATE ?auto_15932 ?auto_15933 )
      ( MAKE-5CRATE-VERIFY ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15931 ?auto_15932 ?auto_15933 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_15965 - SURFACE
      ?auto_15966 - SURFACE
      ?auto_15967 - SURFACE
      ?auto_15968 - SURFACE
      ?auto_15969 - SURFACE
      ?auto_15970 - SURFACE
      ?auto_15971 - SURFACE
    )
    :vars
    (
      ?auto_15976 - HOIST
      ?auto_15972 - PLACE
      ?auto_15973 - PLACE
      ?auto_15974 - HOIST
      ?auto_15975 - SURFACE
      ?auto_15983 - PLACE
      ?auto_15988 - HOIST
      ?auto_15984 - SURFACE
      ?auto_15980 - PLACE
      ?auto_15978 - HOIST
      ?auto_15979 - SURFACE
      ?auto_15982 - SURFACE
      ?auto_15981 - PLACE
      ?auto_15985 - HOIST
      ?auto_15987 - SURFACE
      ?auto_15986 - SURFACE
      ?auto_15977 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15976 ?auto_15972 ) ( IS-CRATE ?auto_15971 ) ( not ( = ?auto_15973 ?auto_15972 ) ) ( HOIST-AT ?auto_15974 ?auto_15973 ) ( AVAILABLE ?auto_15974 ) ( SURFACE-AT ?auto_15971 ?auto_15973 ) ( ON ?auto_15971 ?auto_15975 ) ( CLEAR ?auto_15971 ) ( not ( = ?auto_15970 ?auto_15971 ) ) ( not ( = ?auto_15970 ?auto_15975 ) ) ( not ( = ?auto_15971 ?auto_15975 ) ) ( not ( = ?auto_15976 ?auto_15974 ) ) ( IS-CRATE ?auto_15970 ) ( not ( = ?auto_15983 ?auto_15972 ) ) ( HOIST-AT ?auto_15988 ?auto_15983 ) ( SURFACE-AT ?auto_15970 ?auto_15983 ) ( ON ?auto_15970 ?auto_15984 ) ( CLEAR ?auto_15970 ) ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15969 ?auto_15984 ) ) ( not ( = ?auto_15970 ?auto_15984 ) ) ( not ( = ?auto_15976 ?auto_15988 ) ) ( IS-CRATE ?auto_15969 ) ( not ( = ?auto_15980 ?auto_15972 ) ) ( HOIST-AT ?auto_15978 ?auto_15980 ) ( SURFACE-AT ?auto_15969 ?auto_15980 ) ( ON ?auto_15969 ?auto_15979 ) ( CLEAR ?auto_15969 ) ( not ( = ?auto_15968 ?auto_15969 ) ) ( not ( = ?auto_15968 ?auto_15979 ) ) ( not ( = ?auto_15969 ?auto_15979 ) ) ( not ( = ?auto_15976 ?auto_15978 ) ) ( IS-CRATE ?auto_15968 ) ( AVAILABLE ?auto_15988 ) ( SURFACE-AT ?auto_15968 ?auto_15983 ) ( ON ?auto_15968 ?auto_15982 ) ( CLEAR ?auto_15968 ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15982 ) ) ( not ( = ?auto_15968 ?auto_15982 ) ) ( IS-CRATE ?auto_15967 ) ( not ( = ?auto_15981 ?auto_15972 ) ) ( HOIST-AT ?auto_15985 ?auto_15981 ) ( AVAILABLE ?auto_15985 ) ( SURFACE-AT ?auto_15967 ?auto_15981 ) ( ON ?auto_15967 ?auto_15987 ) ( CLEAR ?auto_15967 ) ( not ( = ?auto_15966 ?auto_15967 ) ) ( not ( = ?auto_15966 ?auto_15987 ) ) ( not ( = ?auto_15967 ?auto_15987 ) ) ( not ( = ?auto_15976 ?auto_15985 ) ) ( SURFACE-AT ?auto_15965 ?auto_15972 ) ( CLEAR ?auto_15965 ) ( IS-CRATE ?auto_15966 ) ( AVAILABLE ?auto_15976 ) ( AVAILABLE ?auto_15978 ) ( SURFACE-AT ?auto_15966 ?auto_15980 ) ( ON ?auto_15966 ?auto_15986 ) ( CLEAR ?auto_15966 ) ( TRUCK-AT ?auto_15977 ?auto_15972 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15986 ) ) ( not ( = ?auto_15966 ?auto_15986 ) ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( not ( = ?auto_15965 ?auto_15987 ) ) ( not ( = ?auto_15967 ?auto_15986 ) ) ( not ( = ?auto_15981 ?auto_15980 ) ) ( not ( = ?auto_15985 ?auto_15978 ) ) ( not ( = ?auto_15987 ?auto_15986 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( not ( = ?auto_15965 ?auto_15982 ) ) ( not ( = ?auto_15966 ?auto_15968 ) ) ( not ( = ?auto_15966 ?auto_15982 ) ) ( not ( = ?auto_15968 ?auto_15987 ) ) ( not ( = ?auto_15968 ?auto_15986 ) ) ( not ( = ?auto_15983 ?auto_15981 ) ) ( not ( = ?auto_15983 ?auto_15980 ) ) ( not ( = ?auto_15988 ?auto_15985 ) ) ( not ( = ?auto_15988 ?auto_15978 ) ) ( not ( = ?auto_15982 ?auto_15987 ) ) ( not ( = ?auto_15982 ?auto_15986 ) ) ( not ( = ?auto_15965 ?auto_15969 ) ) ( not ( = ?auto_15965 ?auto_15979 ) ) ( not ( = ?auto_15966 ?auto_15969 ) ) ( not ( = ?auto_15966 ?auto_15979 ) ) ( not ( = ?auto_15967 ?auto_15969 ) ) ( not ( = ?auto_15967 ?auto_15979 ) ) ( not ( = ?auto_15969 ?auto_15982 ) ) ( not ( = ?auto_15969 ?auto_15987 ) ) ( not ( = ?auto_15969 ?auto_15986 ) ) ( not ( = ?auto_15979 ?auto_15982 ) ) ( not ( = ?auto_15979 ?auto_15987 ) ) ( not ( = ?auto_15979 ?auto_15986 ) ) ( not ( = ?auto_15965 ?auto_15970 ) ) ( not ( = ?auto_15965 ?auto_15984 ) ) ( not ( = ?auto_15966 ?auto_15970 ) ) ( not ( = ?auto_15966 ?auto_15984 ) ) ( not ( = ?auto_15967 ?auto_15970 ) ) ( not ( = ?auto_15967 ?auto_15984 ) ) ( not ( = ?auto_15968 ?auto_15970 ) ) ( not ( = ?auto_15968 ?auto_15984 ) ) ( not ( = ?auto_15970 ?auto_15979 ) ) ( not ( = ?auto_15970 ?auto_15982 ) ) ( not ( = ?auto_15970 ?auto_15987 ) ) ( not ( = ?auto_15970 ?auto_15986 ) ) ( not ( = ?auto_15984 ?auto_15979 ) ) ( not ( = ?auto_15984 ?auto_15982 ) ) ( not ( = ?auto_15984 ?auto_15987 ) ) ( not ( = ?auto_15984 ?auto_15986 ) ) ( not ( = ?auto_15965 ?auto_15971 ) ) ( not ( = ?auto_15965 ?auto_15975 ) ) ( not ( = ?auto_15966 ?auto_15971 ) ) ( not ( = ?auto_15966 ?auto_15975 ) ) ( not ( = ?auto_15967 ?auto_15971 ) ) ( not ( = ?auto_15967 ?auto_15975 ) ) ( not ( = ?auto_15968 ?auto_15971 ) ) ( not ( = ?auto_15968 ?auto_15975 ) ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15969 ?auto_15975 ) ) ( not ( = ?auto_15971 ?auto_15984 ) ) ( not ( = ?auto_15971 ?auto_15979 ) ) ( not ( = ?auto_15971 ?auto_15982 ) ) ( not ( = ?auto_15971 ?auto_15987 ) ) ( not ( = ?auto_15971 ?auto_15986 ) ) ( not ( = ?auto_15973 ?auto_15983 ) ) ( not ( = ?auto_15973 ?auto_15980 ) ) ( not ( = ?auto_15973 ?auto_15981 ) ) ( not ( = ?auto_15974 ?auto_15988 ) ) ( not ( = ?auto_15974 ?auto_15978 ) ) ( not ( = ?auto_15974 ?auto_15985 ) ) ( not ( = ?auto_15975 ?auto_15984 ) ) ( not ( = ?auto_15975 ?auto_15979 ) ) ( not ( = ?auto_15975 ?auto_15982 ) ) ( not ( = ?auto_15975 ?auto_15987 ) ) ( not ( = ?auto_15975 ?auto_15986 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15965 ?auto_15966 ?auto_15967 ?auto_15968 ?auto_15969 ?auto_15970 )
      ( MAKE-1CRATE ?auto_15970 ?auto_15971 )
      ( MAKE-6CRATE-VERIFY ?auto_15965 ?auto_15966 ?auto_15967 ?auto_15968 ?auto_15969 ?auto_15970 ?auto_15971 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_16007 - SURFACE
      ?auto_16008 - SURFACE
      ?auto_16009 - SURFACE
      ?auto_16010 - SURFACE
      ?auto_16011 - SURFACE
      ?auto_16012 - SURFACE
      ?auto_16013 - SURFACE
      ?auto_16014 - SURFACE
    )
    :vars
    (
      ?auto_16018 - HOIST
      ?auto_16015 - PLACE
      ?auto_16019 - PLACE
      ?auto_16017 - HOIST
      ?auto_16020 - SURFACE
      ?auto_16027 - PLACE
      ?auto_16022 - HOIST
      ?auto_16021 - SURFACE
      ?auto_16028 - PLACE
      ?auto_16031 - HOIST
      ?auto_16034 - SURFACE
      ?auto_16030 - PLACE
      ?auto_16026 - HOIST
      ?auto_16023 - SURFACE
      ?auto_16024 - SURFACE
      ?auto_16033 - PLACE
      ?auto_16025 - HOIST
      ?auto_16032 - SURFACE
      ?auto_16029 - SURFACE
      ?auto_16016 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16018 ?auto_16015 ) ( IS-CRATE ?auto_16014 ) ( not ( = ?auto_16019 ?auto_16015 ) ) ( HOIST-AT ?auto_16017 ?auto_16019 ) ( AVAILABLE ?auto_16017 ) ( SURFACE-AT ?auto_16014 ?auto_16019 ) ( ON ?auto_16014 ?auto_16020 ) ( CLEAR ?auto_16014 ) ( not ( = ?auto_16013 ?auto_16014 ) ) ( not ( = ?auto_16013 ?auto_16020 ) ) ( not ( = ?auto_16014 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16017 ) ) ( IS-CRATE ?auto_16013 ) ( not ( = ?auto_16027 ?auto_16015 ) ) ( HOIST-AT ?auto_16022 ?auto_16027 ) ( AVAILABLE ?auto_16022 ) ( SURFACE-AT ?auto_16013 ?auto_16027 ) ( ON ?auto_16013 ?auto_16021 ) ( CLEAR ?auto_16013 ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16021 ) ) ( not ( = ?auto_16013 ?auto_16021 ) ) ( not ( = ?auto_16018 ?auto_16022 ) ) ( IS-CRATE ?auto_16012 ) ( not ( = ?auto_16028 ?auto_16015 ) ) ( HOIST-AT ?auto_16031 ?auto_16028 ) ( SURFACE-AT ?auto_16012 ?auto_16028 ) ( ON ?auto_16012 ?auto_16034 ) ( CLEAR ?auto_16012 ) ( not ( = ?auto_16011 ?auto_16012 ) ) ( not ( = ?auto_16011 ?auto_16034 ) ) ( not ( = ?auto_16012 ?auto_16034 ) ) ( not ( = ?auto_16018 ?auto_16031 ) ) ( IS-CRATE ?auto_16011 ) ( not ( = ?auto_16030 ?auto_16015 ) ) ( HOIST-AT ?auto_16026 ?auto_16030 ) ( SURFACE-AT ?auto_16011 ?auto_16030 ) ( ON ?auto_16011 ?auto_16023 ) ( CLEAR ?auto_16011 ) ( not ( = ?auto_16010 ?auto_16011 ) ) ( not ( = ?auto_16010 ?auto_16023 ) ) ( not ( = ?auto_16011 ?auto_16023 ) ) ( not ( = ?auto_16018 ?auto_16026 ) ) ( IS-CRATE ?auto_16010 ) ( AVAILABLE ?auto_16031 ) ( SURFACE-AT ?auto_16010 ?auto_16028 ) ( ON ?auto_16010 ?auto_16024 ) ( CLEAR ?auto_16010 ) ( not ( = ?auto_16009 ?auto_16010 ) ) ( not ( = ?auto_16009 ?auto_16024 ) ) ( not ( = ?auto_16010 ?auto_16024 ) ) ( IS-CRATE ?auto_16009 ) ( not ( = ?auto_16033 ?auto_16015 ) ) ( HOIST-AT ?auto_16025 ?auto_16033 ) ( AVAILABLE ?auto_16025 ) ( SURFACE-AT ?auto_16009 ?auto_16033 ) ( ON ?auto_16009 ?auto_16032 ) ( CLEAR ?auto_16009 ) ( not ( = ?auto_16008 ?auto_16009 ) ) ( not ( = ?auto_16008 ?auto_16032 ) ) ( not ( = ?auto_16009 ?auto_16032 ) ) ( not ( = ?auto_16018 ?auto_16025 ) ) ( SURFACE-AT ?auto_16007 ?auto_16015 ) ( CLEAR ?auto_16007 ) ( IS-CRATE ?auto_16008 ) ( AVAILABLE ?auto_16018 ) ( AVAILABLE ?auto_16026 ) ( SURFACE-AT ?auto_16008 ?auto_16030 ) ( ON ?auto_16008 ?auto_16029 ) ( CLEAR ?auto_16008 ) ( TRUCK-AT ?auto_16016 ?auto_16015 ) ( not ( = ?auto_16007 ?auto_16008 ) ) ( not ( = ?auto_16007 ?auto_16029 ) ) ( not ( = ?auto_16008 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16009 ) ) ( not ( = ?auto_16007 ?auto_16032 ) ) ( not ( = ?auto_16009 ?auto_16029 ) ) ( not ( = ?auto_16033 ?auto_16030 ) ) ( not ( = ?auto_16025 ?auto_16026 ) ) ( not ( = ?auto_16032 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16010 ) ) ( not ( = ?auto_16007 ?auto_16024 ) ) ( not ( = ?auto_16008 ?auto_16010 ) ) ( not ( = ?auto_16008 ?auto_16024 ) ) ( not ( = ?auto_16010 ?auto_16032 ) ) ( not ( = ?auto_16010 ?auto_16029 ) ) ( not ( = ?auto_16028 ?auto_16033 ) ) ( not ( = ?auto_16028 ?auto_16030 ) ) ( not ( = ?auto_16031 ?auto_16025 ) ) ( not ( = ?auto_16031 ?auto_16026 ) ) ( not ( = ?auto_16024 ?auto_16032 ) ) ( not ( = ?auto_16024 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16011 ) ) ( not ( = ?auto_16007 ?auto_16023 ) ) ( not ( = ?auto_16008 ?auto_16011 ) ) ( not ( = ?auto_16008 ?auto_16023 ) ) ( not ( = ?auto_16009 ?auto_16011 ) ) ( not ( = ?auto_16009 ?auto_16023 ) ) ( not ( = ?auto_16011 ?auto_16024 ) ) ( not ( = ?auto_16011 ?auto_16032 ) ) ( not ( = ?auto_16011 ?auto_16029 ) ) ( not ( = ?auto_16023 ?auto_16024 ) ) ( not ( = ?auto_16023 ?auto_16032 ) ) ( not ( = ?auto_16023 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16012 ) ) ( not ( = ?auto_16007 ?auto_16034 ) ) ( not ( = ?auto_16008 ?auto_16012 ) ) ( not ( = ?auto_16008 ?auto_16034 ) ) ( not ( = ?auto_16009 ?auto_16012 ) ) ( not ( = ?auto_16009 ?auto_16034 ) ) ( not ( = ?auto_16010 ?auto_16012 ) ) ( not ( = ?auto_16010 ?auto_16034 ) ) ( not ( = ?auto_16012 ?auto_16023 ) ) ( not ( = ?auto_16012 ?auto_16024 ) ) ( not ( = ?auto_16012 ?auto_16032 ) ) ( not ( = ?auto_16012 ?auto_16029 ) ) ( not ( = ?auto_16034 ?auto_16023 ) ) ( not ( = ?auto_16034 ?auto_16024 ) ) ( not ( = ?auto_16034 ?auto_16032 ) ) ( not ( = ?auto_16034 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16013 ) ) ( not ( = ?auto_16007 ?auto_16021 ) ) ( not ( = ?auto_16008 ?auto_16013 ) ) ( not ( = ?auto_16008 ?auto_16021 ) ) ( not ( = ?auto_16009 ?auto_16013 ) ) ( not ( = ?auto_16009 ?auto_16021 ) ) ( not ( = ?auto_16010 ?auto_16013 ) ) ( not ( = ?auto_16010 ?auto_16021 ) ) ( not ( = ?auto_16011 ?auto_16013 ) ) ( not ( = ?auto_16011 ?auto_16021 ) ) ( not ( = ?auto_16013 ?auto_16034 ) ) ( not ( = ?auto_16013 ?auto_16023 ) ) ( not ( = ?auto_16013 ?auto_16024 ) ) ( not ( = ?auto_16013 ?auto_16032 ) ) ( not ( = ?auto_16013 ?auto_16029 ) ) ( not ( = ?auto_16027 ?auto_16028 ) ) ( not ( = ?auto_16027 ?auto_16030 ) ) ( not ( = ?auto_16027 ?auto_16033 ) ) ( not ( = ?auto_16022 ?auto_16031 ) ) ( not ( = ?auto_16022 ?auto_16026 ) ) ( not ( = ?auto_16022 ?auto_16025 ) ) ( not ( = ?auto_16021 ?auto_16034 ) ) ( not ( = ?auto_16021 ?auto_16023 ) ) ( not ( = ?auto_16021 ?auto_16024 ) ) ( not ( = ?auto_16021 ?auto_16032 ) ) ( not ( = ?auto_16021 ?auto_16029 ) ) ( not ( = ?auto_16007 ?auto_16014 ) ) ( not ( = ?auto_16007 ?auto_16020 ) ) ( not ( = ?auto_16008 ?auto_16014 ) ) ( not ( = ?auto_16008 ?auto_16020 ) ) ( not ( = ?auto_16009 ?auto_16014 ) ) ( not ( = ?auto_16009 ?auto_16020 ) ) ( not ( = ?auto_16010 ?auto_16014 ) ) ( not ( = ?auto_16010 ?auto_16020 ) ) ( not ( = ?auto_16011 ?auto_16014 ) ) ( not ( = ?auto_16011 ?auto_16020 ) ) ( not ( = ?auto_16012 ?auto_16014 ) ) ( not ( = ?auto_16012 ?auto_16020 ) ) ( not ( = ?auto_16014 ?auto_16021 ) ) ( not ( = ?auto_16014 ?auto_16034 ) ) ( not ( = ?auto_16014 ?auto_16023 ) ) ( not ( = ?auto_16014 ?auto_16024 ) ) ( not ( = ?auto_16014 ?auto_16032 ) ) ( not ( = ?auto_16014 ?auto_16029 ) ) ( not ( = ?auto_16019 ?auto_16027 ) ) ( not ( = ?auto_16019 ?auto_16028 ) ) ( not ( = ?auto_16019 ?auto_16030 ) ) ( not ( = ?auto_16019 ?auto_16033 ) ) ( not ( = ?auto_16017 ?auto_16022 ) ) ( not ( = ?auto_16017 ?auto_16031 ) ) ( not ( = ?auto_16017 ?auto_16026 ) ) ( not ( = ?auto_16017 ?auto_16025 ) ) ( not ( = ?auto_16020 ?auto_16021 ) ) ( not ( = ?auto_16020 ?auto_16034 ) ) ( not ( = ?auto_16020 ?auto_16023 ) ) ( not ( = ?auto_16020 ?auto_16024 ) ) ( not ( = ?auto_16020 ?auto_16032 ) ) ( not ( = ?auto_16020 ?auto_16029 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16007 ?auto_16008 ?auto_16009 ?auto_16010 ?auto_16011 ?auto_16012 ?auto_16013 )
      ( MAKE-1CRATE ?auto_16013 ?auto_16014 )
      ( MAKE-7CRATE-VERIFY ?auto_16007 ?auto_16008 ?auto_16009 ?auto_16010 ?auto_16011 ?auto_16012 ?auto_16013 ?auto_16014 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_16054 - SURFACE
      ?auto_16055 - SURFACE
      ?auto_16056 - SURFACE
      ?auto_16057 - SURFACE
      ?auto_16058 - SURFACE
      ?auto_16059 - SURFACE
      ?auto_16060 - SURFACE
      ?auto_16061 - SURFACE
      ?auto_16062 - SURFACE
    )
    :vars
    (
      ?auto_16064 - HOIST
      ?auto_16065 - PLACE
      ?auto_16068 - PLACE
      ?auto_16063 - HOIST
      ?auto_16066 - SURFACE
      ?auto_16078 - PLACE
      ?auto_16069 - HOIST
      ?auto_16070 - SURFACE
      ?auto_16080 - PLACE
      ?auto_16081 - HOIST
      ?auto_16076 - SURFACE
      ?auto_16077 - SURFACE
      ?auto_16071 - PLACE
      ?auto_16082 - HOIST
      ?auto_16083 - SURFACE
      ?auto_16072 - SURFACE
      ?auto_16075 - PLACE
      ?auto_16079 - HOIST
      ?auto_16073 - SURFACE
      ?auto_16074 - SURFACE
      ?auto_16067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16064 ?auto_16065 ) ( IS-CRATE ?auto_16062 ) ( not ( = ?auto_16068 ?auto_16065 ) ) ( HOIST-AT ?auto_16063 ?auto_16068 ) ( SURFACE-AT ?auto_16062 ?auto_16068 ) ( ON ?auto_16062 ?auto_16066 ) ( CLEAR ?auto_16062 ) ( not ( = ?auto_16061 ?auto_16062 ) ) ( not ( = ?auto_16061 ?auto_16066 ) ) ( not ( = ?auto_16062 ?auto_16066 ) ) ( not ( = ?auto_16064 ?auto_16063 ) ) ( IS-CRATE ?auto_16061 ) ( not ( = ?auto_16078 ?auto_16065 ) ) ( HOIST-AT ?auto_16069 ?auto_16078 ) ( AVAILABLE ?auto_16069 ) ( SURFACE-AT ?auto_16061 ?auto_16078 ) ( ON ?auto_16061 ?auto_16070 ) ( CLEAR ?auto_16061 ) ( not ( = ?auto_16060 ?auto_16061 ) ) ( not ( = ?auto_16060 ?auto_16070 ) ) ( not ( = ?auto_16061 ?auto_16070 ) ) ( not ( = ?auto_16064 ?auto_16069 ) ) ( IS-CRATE ?auto_16060 ) ( not ( = ?auto_16080 ?auto_16065 ) ) ( HOIST-AT ?auto_16081 ?auto_16080 ) ( AVAILABLE ?auto_16081 ) ( SURFACE-AT ?auto_16060 ?auto_16080 ) ( ON ?auto_16060 ?auto_16076 ) ( CLEAR ?auto_16060 ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( not ( = ?auto_16059 ?auto_16076 ) ) ( not ( = ?auto_16060 ?auto_16076 ) ) ( not ( = ?auto_16064 ?auto_16081 ) ) ( IS-CRATE ?auto_16059 ) ( SURFACE-AT ?auto_16059 ?auto_16068 ) ( ON ?auto_16059 ?auto_16077 ) ( CLEAR ?auto_16059 ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( not ( = ?auto_16058 ?auto_16077 ) ) ( not ( = ?auto_16059 ?auto_16077 ) ) ( IS-CRATE ?auto_16058 ) ( not ( = ?auto_16071 ?auto_16065 ) ) ( HOIST-AT ?auto_16082 ?auto_16071 ) ( SURFACE-AT ?auto_16058 ?auto_16071 ) ( ON ?auto_16058 ?auto_16083 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16083 ) ) ( not ( = ?auto_16058 ?auto_16083 ) ) ( not ( = ?auto_16064 ?auto_16082 ) ) ( IS-CRATE ?auto_16057 ) ( AVAILABLE ?auto_16063 ) ( SURFACE-AT ?auto_16057 ?auto_16068 ) ( ON ?auto_16057 ?auto_16072 ) ( CLEAR ?auto_16057 ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16072 ) ) ( not ( = ?auto_16057 ?auto_16072 ) ) ( IS-CRATE ?auto_16056 ) ( not ( = ?auto_16075 ?auto_16065 ) ) ( HOIST-AT ?auto_16079 ?auto_16075 ) ( AVAILABLE ?auto_16079 ) ( SURFACE-AT ?auto_16056 ?auto_16075 ) ( ON ?auto_16056 ?auto_16073 ) ( CLEAR ?auto_16056 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16073 ) ) ( not ( = ?auto_16056 ?auto_16073 ) ) ( not ( = ?auto_16064 ?auto_16079 ) ) ( SURFACE-AT ?auto_16054 ?auto_16065 ) ( CLEAR ?auto_16054 ) ( IS-CRATE ?auto_16055 ) ( AVAILABLE ?auto_16064 ) ( AVAILABLE ?auto_16082 ) ( SURFACE-AT ?auto_16055 ?auto_16071 ) ( ON ?auto_16055 ?auto_16074 ) ( CLEAR ?auto_16055 ) ( TRUCK-AT ?auto_16067 ?auto_16065 ) ( not ( = ?auto_16054 ?auto_16055 ) ) ( not ( = ?auto_16054 ?auto_16074 ) ) ( not ( = ?auto_16055 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16056 ) ) ( not ( = ?auto_16054 ?auto_16073 ) ) ( not ( = ?auto_16056 ?auto_16074 ) ) ( not ( = ?auto_16075 ?auto_16071 ) ) ( not ( = ?auto_16079 ?auto_16082 ) ) ( not ( = ?auto_16073 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16054 ?auto_16072 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16072 ) ) ( not ( = ?auto_16057 ?auto_16073 ) ) ( not ( = ?auto_16057 ?auto_16074 ) ) ( not ( = ?auto_16068 ?auto_16075 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( not ( = ?auto_16063 ?auto_16079 ) ) ( not ( = ?auto_16063 ?auto_16082 ) ) ( not ( = ?auto_16072 ?auto_16073 ) ) ( not ( = ?auto_16072 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16058 ) ) ( not ( = ?auto_16054 ?auto_16083 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16083 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16083 ) ) ( not ( = ?auto_16058 ?auto_16072 ) ) ( not ( = ?auto_16058 ?auto_16073 ) ) ( not ( = ?auto_16058 ?auto_16074 ) ) ( not ( = ?auto_16083 ?auto_16072 ) ) ( not ( = ?auto_16083 ?auto_16073 ) ) ( not ( = ?auto_16083 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16059 ) ) ( not ( = ?auto_16054 ?auto_16077 ) ) ( not ( = ?auto_16055 ?auto_16059 ) ) ( not ( = ?auto_16055 ?auto_16077 ) ) ( not ( = ?auto_16056 ?auto_16059 ) ) ( not ( = ?auto_16056 ?auto_16077 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16077 ) ) ( not ( = ?auto_16059 ?auto_16083 ) ) ( not ( = ?auto_16059 ?auto_16072 ) ) ( not ( = ?auto_16059 ?auto_16073 ) ) ( not ( = ?auto_16059 ?auto_16074 ) ) ( not ( = ?auto_16077 ?auto_16083 ) ) ( not ( = ?auto_16077 ?auto_16072 ) ) ( not ( = ?auto_16077 ?auto_16073 ) ) ( not ( = ?auto_16077 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16060 ) ) ( not ( = ?auto_16054 ?auto_16076 ) ) ( not ( = ?auto_16055 ?auto_16060 ) ) ( not ( = ?auto_16055 ?auto_16076 ) ) ( not ( = ?auto_16056 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16076 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16076 ) ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16076 ) ) ( not ( = ?auto_16060 ?auto_16077 ) ) ( not ( = ?auto_16060 ?auto_16083 ) ) ( not ( = ?auto_16060 ?auto_16072 ) ) ( not ( = ?auto_16060 ?auto_16073 ) ) ( not ( = ?auto_16060 ?auto_16074 ) ) ( not ( = ?auto_16080 ?auto_16068 ) ) ( not ( = ?auto_16080 ?auto_16071 ) ) ( not ( = ?auto_16080 ?auto_16075 ) ) ( not ( = ?auto_16081 ?auto_16063 ) ) ( not ( = ?auto_16081 ?auto_16082 ) ) ( not ( = ?auto_16081 ?auto_16079 ) ) ( not ( = ?auto_16076 ?auto_16077 ) ) ( not ( = ?auto_16076 ?auto_16083 ) ) ( not ( = ?auto_16076 ?auto_16072 ) ) ( not ( = ?auto_16076 ?auto_16073 ) ) ( not ( = ?auto_16076 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16061 ) ) ( not ( = ?auto_16054 ?auto_16070 ) ) ( not ( = ?auto_16055 ?auto_16061 ) ) ( not ( = ?auto_16055 ?auto_16070 ) ) ( not ( = ?auto_16056 ?auto_16061 ) ) ( not ( = ?auto_16056 ?auto_16070 ) ) ( not ( = ?auto_16057 ?auto_16061 ) ) ( not ( = ?auto_16057 ?auto_16070 ) ) ( not ( = ?auto_16058 ?auto_16061 ) ) ( not ( = ?auto_16058 ?auto_16070 ) ) ( not ( = ?auto_16059 ?auto_16061 ) ) ( not ( = ?auto_16059 ?auto_16070 ) ) ( not ( = ?auto_16061 ?auto_16076 ) ) ( not ( = ?auto_16061 ?auto_16077 ) ) ( not ( = ?auto_16061 ?auto_16083 ) ) ( not ( = ?auto_16061 ?auto_16072 ) ) ( not ( = ?auto_16061 ?auto_16073 ) ) ( not ( = ?auto_16061 ?auto_16074 ) ) ( not ( = ?auto_16078 ?auto_16080 ) ) ( not ( = ?auto_16078 ?auto_16068 ) ) ( not ( = ?auto_16078 ?auto_16071 ) ) ( not ( = ?auto_16078 ?auto_16075 ) ) ( not ( = ?auto_16069 ?auto_16081 ) ) ( not ( = ?auto_16069 ?auto_16063 ) ) ( not ( = ?auto_16069 ?auto_16082 ) ) ( not ( = ?auto_16069 ?auto_16079 ) ) ( not ( = ?auto_16070 ?auto_16076 ) ) ( not ( = ?auto_16070 ?auto_16077 ) ) ( not ( = ?auto_16070 ?auto_16083 ) ) ( not ( = ?auto_16070 ?auto_16072 ) ) ( not ( = ?auto_16070 ?auto_16073 ) ) ( not ( = ?auto_16070 ?auto_16074 ) ) ( not ( = ?auto_16054 ?auto_16062 ) ) ( not ( = ?auto_16054 ?auto_16066 ) ) ( not ( = ?auto_16055 ?auto_16062 ) ) ( not ( = ?auto_16055 ?auto_16066 ) ) ( not ( = ?auto_16056 ?auto_16062 ) ) ( not ( = ?auto_16056 ?auto_16066 ) ) ( not ( = ?auto_16057 ?auto_16062 ) ) ( not ( = ?auto_16057 ?auto_16066 ) ) ( not ( = ?auto_16058 ?auto_16062 ) ) ( not ( = ?auto_16058 ?auto_16066 ) ) ( not ( = ?auto_16059 ?auto_16062 ) ) ( not ( = ?auto_16059 ?auto_16066 ) ) ( not ( = ?auto_16060 ?auto_16062 ) ) ( not ( = ?auto_16060 ?auto_16066 ) ) ( not ( = ?auto_16062 ?auto_16070 ) ) ( not ( = ?auto_16062 ?auto_16076 ) ) ( not ( = ?auto_16062 ?auto_16077 ) ) ( not ( = ?auto_16062 ?auto_16083 ) ) ( not ( = ?auto_16062 ?auto_16072 ) ) ( not ( = ?auto_16062 ?auto_16073 ) ) ( not ( = ?auto_16062 ?auto_16074 ) ) ( not ( = ?auto_16066 ?auto_16070 ) ) ( not ( = ?auto_16066 ?auto_16076 ) ) ( not ( = ?auto_16066 ?auto_16077 ) ) ( not ( = ?auto_16066 ?auto_16083 ) ) ( not ( = ?auto_16066 ?auto_16072 ) ) ( not ( = ?auto_16066 ?auto_16073 ) ) ( not ( = ?auto_16066 ?auto_16074 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ?auto_16060 ?auto_16061 )
      ( MAKE-1CRATE ?auto_16061 ?auto_16062 )
      ( MAKE-8CRATE-VERIFY ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ?auto_16060 ?auto_16061 ?auto_16062 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_16104 - SURFACE
      ?auto_16105 - SURFACE
      ?auto_16106 - SURFACE
      ?auto_16107 - SURFACE
      ?auto_16108 - SURFACE
      ?auto_16109 - SURFACE
      ?auto_16110 - SURFACE
      ?auto_16111 - SURFACE
      ?auto_16112 - SURFACE
      ?auto_16113 - SURFACE
    )
    :vars
    (
      ?auto_16117 - HOIST
      ?auto_16119 - PLACE
      ?auto_16118 - PLACE
      ?auto_16115 - HOIST
      ?auto_16114 - SURFACE
      ?auto_16131 - PLACE
      ?auto_16130 - HOIST
      ?auto_16129 - SURFACE
      ?auto_16133 - PLACE
      ?auto_16121 - HOIST
      ?auto_16132 - SURFACE
      ?auto_16120 - PLACE
      ?auto_16122 - HOIST
      ?auto_16134 - SURFACE
      ?auto_16125 - SURFACE
      ?auto_16126 - SURFACE
      ?auto_16135 - SURFACE
      ?auto_16123 - PLACE
      ?auto_16128 - HOIST
      ?auto_16127 - SURFACE
      ?auto_16124 - SURFACE
      ?auto_16116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16117 ?auto_16119 ) ( IS-CRATE ?auto_16113 ) ( not ( = ?auto_16118 ?auto_16119 ) ) ( HOIST-AT ?auto_16115 ?auto_16118 ) ( SURFACE-AT ?auto_16113 ?auto_16118 ) ( ON ?auto_16113 ?auto_16114 ) ( CLEAR ?auto_16113 ) ( not ( = ?auto_16112 ?auto_16113 ) ) ( not ( = ?auto_16112 ?auto_16114 ) ) ( not ( = ?auto_16113 ?auto_16114 ) ) ( not ( = ?auto_16117 ?auto_16115 ) ) ( IS-CRATE ?auto_16112 ) ( not ( = ?auto_16131 ?auto_16119 ) ) ( HOIST-AT ?auto_16130 ?auto_16131 ) ( SURFACE-AT ?auto_16112 ?auto_16131 ) ( ON ?auto_16112 ?auto_16129 ) ( CLEAR ?auto_16112 ) ( not ( = ?auto_16111 ?auto_16112 ) ) ( not ( = ?auto_16111 ?auto_16129 ) ) ( not ( = ?auto_16112 ?auto_16129 ) ) ( not ( = ?auto_16117 ?auto_16130 ) ) ( IS-CRATE ?auto_16111 ) ( not ( = ?auto_16133 ?auto_16119 ) ) ( HOIST-AT ?auto_16121 ?auto_16133 ) ( AVAILABLE ?auto_16121 ) ( SURFACE-AT ?auto_16111 ?auto_16133 ) ( ON ?auto_16111 ?auto_16132 ) ( CLEAR ?auto_16111 ) ( not ( = ?auto_16110 ?auto_16111 ) ) ( not ( = ?auto_16110 ?auto_16132 ) ) ( not ( = ?auto_16111 ?auto_16132 ) ) ( not ( = ?auto_16117 ?auto_16121 ) ) ( IS-CRATE ?auto_16110 ) ( not ( = ?auto_16120 ?auto_16119 ) ) ( HOIST-AT ?auto_16122 ?auto_16120 ) ( AVAILABLE ?auto_16122 ) ( SURFACE-AT ?auto_16110 ?auto_16120 ) ( ON ?auto_16110 ?auto_16134 ) ( CLEAR ?auto_16110 ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( not ( = ?auto_16109 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16134 ) ) ( not ( = ?auto_16117 ?auto_16122 ) ) ( IS-CRATE ?auto_16109 ) ( SURFACE-AT ?auto_16109 ?auto_16131 ) ( ON ?auto_16109 ?auto_16125 ) ( CLEAR ?auto_16109 ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( not ( = ?auto_16108 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16125 ) ) ( IS-CRATE ?auto_16108 ) ( SURFACE-AT ?auto_16108 ?auto_16118 ) ( ON ?auto_16108 ?auto_16126 ) ( CLEAR ?auto_16108 ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16126 ) ) ( not ( = ?auto_16108 ?auto_16126 ) ) ( IS-CRATE ?auto_16107 ) ( AVAILABLE ?auto_16130 ) ( SURFACE-AT ?auto_16107 ?auto_16131 ) ( ON ?auto_16107 ?auto_16135 ) ( CLEAR ?auto_16107 ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16135 ) ) ( not ( = ?auto_16107 ?auto_16135 ) ) ( IS-CRATE ?auto_16106 ) ( not ( = ?auto_16123 ?auto_16119 ) ) ( HOIST-AT ?auto_16128 ?auto_16123 ) ( AVAILABLE ?auto_16128 ) ( SURFACE-AT ?auto_16106 ?auto_16123 ) ( ON ?auto_16106 ?auto_16127 ) ( CLEAR ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16127 ) ) ( not ( = ?auto_16106 ?auto_16127 ) ) ( not ( = ?auto_16117 ?auto_16128 ) ) ( SURFACE-AT ?auto_16104 ?auto_16119 ) ( CLEAR ?auto_16104 ) ( IS-CRATE ?auto_16105 ) ( AVAILABLE ?auto_16117 ) ( AVAILABLE ?auto_16115 ) ( SURFACE-AT ?auto_16105 ?auto_16118 ) ( ON ?auto_16105 ?auto_16124 ) ( CLEAR ?auto_16105 ) ( TRUCK-AT ?auto_16116 ?auto_16119 ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16124 ) ) ( not ( = ?auto_16105 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16127 ) ) ( not ( = ?auto_16106 ?auto_16124 ) ) ( not ( = ?auto_16123 ?auto_16118 ) ) ( not ( = ?auto_16128 ?auto_16115 ) ) ( not ( = ?auto_16127 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( not ( = ?auto_16104 ?auto_16135 ) ) ( not ( = ?auto_16105 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16135 ) ) ( not ( = ?auto_16107 ?auto_16127 ) ) ( not ( = ?auto_16107 ?auto_16124 ) ) ( not ( = ?auto_16131 ?auto_16123 ) ) ( not ( = ?auto_16131 ?auto_16118 ) ) ( not ( = ?auto_16130 ?auto_16128 ) ) ( not ( = ?auto_16130 ?auto_16115 ) ) ( not ( = ?auto_16135 ?auto_16127 ) ) ( not ( = ?auto_16135 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16126 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16126 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16106 ?auto_16126 ) ) ( not ( = ?auto_16108 ?auto_16135 ) ) ( not ( = ?auto_16108 ?auto_16127 ) ) ( not ( = ?auto_16108 ?auto_16124 ) ) ( not ( = ?auto_16126 ?auto_16135 ) ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16126 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16125 ) ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16105 ?auto_16125 ) ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16125 ) ) ( not ( = ?auto_16107 ?auto_16109 ) ) ( not ( = ?auto_16107 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16126 ) ) ( not ( = ?auto_16109 ?auto_16135 ) ) ( not ( = ?auto_16109 ?auto_16127 ) ) ( not ( = ?auto_16109 ?auto_16124 ) ) ( not ( = ?auto_16125 ?auto_16126 ) ) ( not ( = ?auto_16125 ?auto_16135 ) ) ( not ( = ?auto_16125 ?auto_16127 ) ) ( not ( = ?auto_16125 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16110 ) ) ( not ( = ?auto_16104 ?auto_16134 ) ) ( not ( = ?auto_16105 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16134 ) ) ( not ( = ?auto_16106 ?auto_16110 ) ) ( not ( = ?auto_16106 ?auto_16134 ) ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16107 ?auto_16134 ) ) ( not ( = ?auto_16108 ?auto_16110 ) ) ( not ( = ?auto_16108 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16125 ) ) ( not ( = ?auto_16110 ?auto_16126 ) ) ( not ( = ?auto_16110 ?auto_16135 ) ) ( not ( = ?auto_16110 ?auto_16127 ) ) ( not ( = ?auto_16110 ?auto_16124 ) ) ( not ( = ?auto_16120 ?auto_16131 ) ) ( not ( = ?auto_16120 ?auto_16118 ) ) ( not ( = ?auto_16120 ?auto_16123 ) ) ( not ( = ?auto_16122 ?auto_16130 ) ) ( not ( = ?auto_16122 ?auto_16115 ) ) ( not ( = ?auto_16122 ?auto_16128 ) ) ( not ( = ?auto_16134 ?auto_16125 ) ) ( not ( = ?auto_16134 ?auto_16126 ) ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( not ( = ?auto_16134 ?auto_16127 ) ) ( not ( = ?auto_16134 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16111 ) ) ( not ( = ?auto_16104 ?auto_16132 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16105 ?auto_16132 ) ) ( not ( = ?auto_16106 ?auto_16111 ) ) ( not ( = ?auto_16106 ?auto_16132 ) ) ( not ( = ?auto_16107 ?auto_16111 ) ) ( not ( = ?auto_16107 ?auto_16132 ) ) ( not ( = ?auto_16108 ?auto_16111 ) ) ( not ( = ?auto_16108 ?auto_16132 ) ) ( not ( = ?auto_16109 ?auto_16111 ) ) ( not ( = ?auto_16109 ?auto_16132 ) ) ( not ( = ?auto_16111 ?auto_16134 ) ) ( not ( = ?auto_16111 ?auto_16125 ) ) ( not ( = ?auto_16111 ?auto_16126 ) ) ( not ( = ?auto_16111 ?auto_16135 ) ) ( not ( = ?auto_16111 ?auto_16127 ) ) ( not ( = ?auto_16111 ?auto_16124 ) ) ( not ( = ?auto_16133 ?auto_16120 ) ) ( not ( = ?auto_16133 ?auto_16131 ) ) ( not ( = ?auto_16133 ?auto_16118 ) ) ( not ( = ?auto_16133 ?auto_16123 ) ) ( not ( = ?auto_16121 ?auto_16122 ) ) ( not ( = ?auto_16121 ?auto_16130 ) ) ( not ( = ?auto_16121 ?auto_16115 ) ) ( not ( = ?auto_16121 ?auto_16128 ) ) ( not ( = ?auto_16132 ?auto_16134 ) ) ( not ( = ?auto_16132 ?auto_16125 ) ) ( not ( = ?auto_16132 ?auto_16126 ) ) ( not ( = ?auto_16132 ?auto_16135 ) ) ( not ( = ?auto_16132 ?auto_16127 ) ) ( not ( = ?auto_16132 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16112 ) ) ( not ( = ?auto_16104 ?auto_16129 ) ) ( not ( = ?auto_16105 ?auto_16112 ) ) ( not ( = ?auto_16105 ?auto_16129 ) ) ( not ( = ?auto_16106 ?auto_16112 ) ) ( not ( = ?auto_16106 ?auto_16129 ) ) ( not ( = ?auto_16107 ?auto_16112 ) ) ( not ( = ?auto_16107 ?auto_16129 ) ) ( not ( = ?auto_16108 ?auto_16112 ) ) ( not ( = ?auto_16108 ?auto_16129 ) ) ( not ( = ?auto_16109 ?auto_16112 ) ) ( not ( = ?auto_16109 ?auto_16129 ) ) ( not ( = ?auto_16110 ?auto_16112 ) ) ( not ( = ?auto_16110 ?auto_16129 ) ) ( not ( = ?auto_16112 ?auto_16132 ) ) ( not ( = ?auto_16112 ?auto_16134 ) ) ( not ( = ?auto_16112 ?auto_16125 ) ) ( not ( = ?auto_16112 ?auto_16126 ) ) ( not ( = ?auto_16112 ?auto_16135 ) ) ( not ( = ?auto_16112 ?auto_16127 ) ) ( not ( = ?auto_16112 ?auto_16124 ) ) ( not ( = ?auto_16129 ?auto_16132 ) ) ( not ( = ?auto_16129 ?auto_16134 ) ) ( not ( = ?auto_16129 ?auto_16125 ) ) ( not ( = ?auto_16129 ?auto_16126 ) ) ( not ( = ?auto_16129 ?auto_16135 ) ) ( not ( = ?auto_16129 ?auto_16127 ) ) ( not ( = ?auto_16129 ?auto_16124 ) ) ( not ( = ?auto_16104 ?auto_16113 ) ) ( not ( = ?auto_16104 ?auto_16114 ) ) ( not ( = ?auto_16105 ?auto_16113 ) ) ( not ( = ?auto_16105 ?auto_16114 ) ) ( not ( = ?auto_16106 ?auto_16113 ) ) ( not ( = ?auto_16106 ?auto_16114 ) ) ( not ( = ?auto_16107 ?auto_16113 ) ) ( not ( = ?auto_16107 ?auto_16114 ) ) ( not ( = ?auto_16108 ?auto_16113 ) ) ( not ( = ?auto_16108 ?auto_16114 ) ) ( not ( = ?auto_16109 ?auto_16113 ) ) ( not ( = ?auto_16109 ?auto_16114 ) ) ( not ( = ?auto_16110 ?auto_16113 ) ) ( not ( = ?auto_16110 ?auto_16114 ) ) ( not ( = ?auto_16111 ?auto_16113 ) ) ( not ( = ?auto_16111 ?auto_16114 ) ) ( not ( = ?auto_16113 ?auto_16129 ) ) ( not ( = ?auto_16113 ?auto_16132 ) ) ( not ( = ?auto_16113 ?auto_16134 ) ) ( not ( = ?auto_16113 ?auto_16125 ) ) ( not ( = ?auto_16113 ?auto_16126 ) ) ( not ( = ?auto_16113 ?auto_16135 ) ) ( not ( = ?auto_16113 ?auto_16127 ) ) ( not ( = ?auto_16113 ?auto_16124 ) ) ( not ( = ?auto_16114 ?auto_16129 ) ) ( not ( = ?auto_16114 ?auto_16132 ) ) ( not ( = ?auto_16114 ?auto_16134 ) ) ( not ( = ?auto_16114 ?auto_16125 ) ) ( not ( = ?auto_16114 ?auto_16126 ) ) ( not ( = ?auto_16114 ?auto_16135 ) ) ( not ( = ?auto_16114 ?auto_16127 ) ) ( not ( = ?auto_16114 ?auto_16124 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16110 ?auto_16111 ?auto_16112 )
      ( MAKE-1CRATE ?auto_16112 ?auto_16113 )
      ( MAKE-9CRATE-VERIFY ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16110 ?auto_16111 ?auto_16112 ?auto_16113 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_16157 - SURFACE
      ?auto_16158 - SURFACE
      ?auto_16159 - SURFACE
      ?auto_16160 - SURFACE
      ?auto_16161 - SURFACE
      ?auto_16162 - SURFACE
      ?auto_16163 - SURFACE
      ?auto_16164 - SURFACE
      ?auto_16165 - SURFACE
      ?auto_16166 - SURFACE
      ?auto_16167 - SURFACE
    )
    :vars
    (
      ?auto_16172 - HOIST
      ?auto_16168 - PLACE
      ?auto_16170 - PLACE
      ?auto_16171 - HOIST
      ?auto_16169 - SURFACE
      ?auto_16182 - PLACE
      ?auto_16183 - HOIST
      ?auto_16178 - SURFACE
      ?auto_16181 - PLACE
      ?auto_16190 - HOIST
      ?auto_16176 - SURFACE
      ?auto_16174 - PLACE
      ?auto_16184 - HOIST
      ?auto_16188 - SURFACE
      ?auto_16180 - SURFACE
      ?auto_16189 - SURFACE
      ?auto_16187 - SURFACE
      ?auto_16175 - SURFACE
      ?auto_16186 - PLACE
      ?auto_16185 - HOIST
      ?auto_16179 - SURFACE
      ?auto_16177 - SURFACE
      ?auto_16173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16172 ?auto_16168 ) ( IS-CRATE ?auto_16167 ) ( not ( = ?auto_16170 ?auto_16168 ) ) ( HOIST-AT ?auto_16171 ?auto_16170 ) ( SURFACE-AT ?auto_16167 ?auto_16170 ) ( ON ?auto_16167 ?auto_16169 ) ( CLEAR ?auto_16167 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16169 ) ) ( not ( = ?auto_16172 ?auto_16171 ) ) ( IS-CRATE ?auto_16166 ) ( not ( = ?auto_16182 ?auto_16168 ) ) ( HOIST-AT ?auto_16183 ?auto_16182 ) ( SURFACE-AT ?auto_16166 ?auto_16182 ) ( ON ?auto_16166 ?auto_16178 ) ( CLEAR ?auto_16166 ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( not ( = ?auto_16165 ?auto_16178 ) ) ( not ( = ?auto_16166 ?auto_16178 ) ) ( not ( = ?auto_16172 ?auto_16183 ) ) ( IS-CRATE ?auto_16165 ) ( not ( = ?auto_16181 ?auto_16168 ) ) ( HOIST-AT ?auto_16190 ?auto_16181 ) ( SURFACE-AT ?auto_16165 ?auto_16181 ) ( ON ?auto_16165 ?auto_16176 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16164 ?auto_16165 ) ) ( not ( = ?auto_16164 ?auto_16176 ) ) ( not ( = ?auto_16165 ?auto_16176 ) ) ( not ( = ?auto_16172 ?auto_16190 ) ) ( IS-CRATE ?auto_16164 ) ( not ( = ?auto_16174 ?auto_16168 ) ) ( HOIST-AT ?auto_16184 ?auto_16174 ) ( AVAILABLE ?auto_16184 ) ( SURFACE-AT ?auto_16164 ?auto_16174 ) ( ON ?auto_16164 ?auto_16188 ) ( CLEAR ?auto_16164 ) ( not ( = ?auto_16163 ?auto_16164 ) ) ( not ( = ?auto_16163 ?auto_16188 ) ) ( not ( = ?auto_16164 ?auto_16188 ) ) ( not ( = ?auto_16172 ?auto_16184 ) ) ( IS-CRATE ?auto_16163 ) ( AVAILABLE ?auto_16171 ) ( SURFACE-AT ?auto_16163 ?auto_16170 ) ( ON ?auto_16163 ?auto_16180 ) ( CLEAR ?auto_16163 ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16180 ) ) ( not ( = ?auto_16163 ?auto_16180 ) ) ( IS-CRATE ?auto_16162 ) ( SURFACE-AT ?auto_16162 ?auto_16181 ) ( ON ?auto_16162 ?auto_16189 ) ( CLEAR ?auto_16162 ) ( not ( = ?auto_16161 ?auto_16162 ) ) ( not ( = ?auto_16161 ?auto_16189 ) ) ( not ( = ?auto_16162 ?auto_16189 ) ) ( IS-CRATE ?auto_16161 ) ( SURFACE-AT ?auto_16161 ?auto_16182 ) ( ON ?auto_16161 ?auto_16187 ) ( CLEAR ?auto_16161 ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16187 ) ) ( not ( = ?auto_16161 ?auto_16187 ) ) ( IS-CRATE ?auto_16160 ) ( AVAILABLE ?auto_16190 ) ( SURFACE-AT ?auto_16160 ?auto_16181 ) ( ON ?auto_16160 ?auto_16175 ) ( CLEAR ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16175 ) ) ( not ( = ?auto_16160 ?auto_16175 ) ) ( IS-CRATE ?auto_16159 ) ( not ( = ?auto_16186 ?auto_16168 ) ) ( HOIST-AT ?auto_16185 ?auto_16186 ) ( AVAILABLE ?auto_16185 ) ( SURFACE-AT ?auto_16159 ?auto_16186 ) ( ON ?auto_16159 ?auto_16179 ) ( CLEAR ?auto_16159 ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16179 ) ) ( not ( = ?auto_16159 ?auto_16179 ) ) ( not ( = ?auto_16172 ?auto_16185 ) ) ( SURFACE-AT ?auto_16157 ?auto_16168 ) ( CLEAR ?auto_16157 ) ( IS-CRATE ?auto_16158 ) ( AVAILABLE ?auto_16172 ) ( AVAILABLE ?auto_16183 ) ( SURFACE-AT ?auto_16158 ?auto_16182 ) ( ON ?auto_16158 ?auto_16177 ) ( CLEAR ?auto_16158 ) ( TRUCK-AT ?auto_16173 ?auto_16168 ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16177 ) ) ( not ( = ?auto_16158 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16157 ?auto_16179 ) ) ( not ( = ?auto_16159 ?auto_16177 ) ) ( not ( = ?auto_16186 ?auto_16182 ) ) ( not ( = ?auto_16185 ?auto_16183 ) ) ( not ( = ?auto_16179 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16157 ?auto_16175 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16175 ) ) ( not ( = ?auto_16160 ?auto_16179 ) ) ( not ( = ?auto_16160 ?auto_16177 ) ) ( not ( = ?auto_16181 ?auto_16186 ) ) ( not ( = ?auto_16181 ?auto_16182 ) ) ( not ( = ?auto_16190 ?auto_16185 ) ) ( not ( = ?auto_16190 ?auto_16183 ) ) ( not ( = ?auto_16175 ?auto_16179 ) ) ( not ( = ?auto_16175 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16187 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16158 ?auto_16187 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16187 ) ) ( not ( = ?auto_16161 ?auto_16175 ) ) ( not ( = ?auto_16161 ?auto_16179 ) ) ( not ( = ?auto_16161 ?auto_16177 ) ) ( not ( = ?auto_16187 ?auto_16175 ) ) ( not ( = ?auto_16187 ?auto_16179 ) ) ( not ( = ?auto_16187 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16189 ) ) ( not ( = ?auto_16158 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16189 ) ) ( not ( = ?auto_16159 ?auto_16162 ) ) ( not ( = ?auto_16159 ?auto_16189 ) ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( not ( = ?auto_16160 ?auto_16189 ) ) ( not ( = ?auto_16162 ?auto_16187 ) ) ( not ( = ?auto_16162 ?auto_16175 ) ) ( not ( = ?auto_16162 ?auto_16179 ) ) ( not ( = ?auto_16162 ?auto_16177 ) ) ( not ( = ?auto_16189 ?auto_16187 ) ) ( not ( = ?auto_16189 ?auto_16175 ) ) ( not ( = ?auto_16189 ?auto_16179 ) ) ( not ( = ?auto_16189 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16163 ) ) ( not ( = ?auto_16157 ?auto_16180 ) ) ( not ( = ?auto_16158 ?auto_16163 ) ) ( not ( = ?auto_16158 ?auto_16180 ) ) ( not ( = ?auto_16159 ?auto_16163 ) ) ( not ( = ?auto_16159 ?auto_16180 ) ) ( not ( = ?auto_16160 ?auto_16163 ) ) ( not ( = ?auto_16160 ?auto_16180 ) ) ( not ( = ?auto_16161 ?auto_16163 ) ) ( not ( = ?auto_16161 ?auto_16180 ) ) ( not ( = ?auto_16163 ?auto_16189 ) ) ( not ( = ?auto_16163 ?auto_16187 ) ) ( not ( = ?auto_16163 ?auto_16175 ) ) ( not ( = ?auto_16163 ?auto_16179 ) ) ( not ( = ?auto_16163 ?auto_16177 ) ) ( not ( = ?auto_16170 ?auto_16181 ) ) ( not ( = ?auto_16170 ?auto_16182 ) ) ( not ( = ?auto_16170 ?auto_16186 ) ) ( not ( = ?auto_16171 ?auto_16190 ) ) ( not ( = ?auto_16171 ?auto_16183 ) ) ( not ( = ?auto_16171 ?auto_16185 ) ) ( not ( = ?auto_16180 ?auto_16189 ) ) ( not ( = ?auto_16180 ?auto_16187 ) ) ( not ( = ?auto_16180 ?auto_16175 ) ) ( not ( = ?auto_16180 ?auto_16179 ) ) ( not ( = ?auto_16180 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16188 ) ) ( not ( = ?auto_16158 ?auto_16164 ) ) ( not ( = ?auto_16158 ?auto_16188 ) ) ( not ( = ?auto_16159 ?auto_16164 ) ) ( not ( = ?auto_16159 ?auto_16188 ) ) ( not ( = ?auto_16160 ?auto_16164 ) ) ( not ( = ?auto_16160 ?auto_16188 ) ) ( not ( = ?auto_16161 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16188 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) ( not ( = ?auto_16162 ?auto_16188 ) ) ( not ( = ?auto_16164 ?auto_16180 ) ) ( not ( = ?auto_16164 ?auto_16189 ) ) ( not ( = ?auto_16164 ?auto_16187 ) ) ( not ( = ?auto_16164 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16179 ) ) ( not ( = ?auto_16164 ?auto_16177 ) ) ( not ( = ?auto_16174 ?auto_16170 ) ) ( not ( = ?auto_16174 ?auto_16181 ) ) ( not ( = ?auto_16174 ?auto_16182 ) ) ( not ( = ?auto_16174 ?auto_16186 ) ) ( not ( = ?auto_16184 ?auto_16171 ) ) ( not ( = ?auto_16184 ?auto_16190 ) ) ( not ( = ?auto_16184 ?auto_16183 ) ) ( not ( = ?auto_16184 ?auto_16185 ) ) ( not ( = ?auto_16188 ?auto_16180 ) ) ( not ( = ?auto_16188 ?auto_16189 ) ) ( not ( = ?auto_16188 ?auto_16187 ) ) ( not ( = ?auto_16188 ?auto_16175 ) ) ( not ( = ?auto_16188 ?auto_16179 ) ) ( not ( = ?auto_16188 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16165 ) ) ( not ( = ?auto_16157 ?auto_16176 ) ) ( not ( = ?auto_16158 ?auto_16165 ) ) ( not ( = ?auto_16158 ?auto_16176 ) ) ( not ( = ?auto_16159 ?auto_16165 ) ) ( not ( = ?auto_16159 ?auto_16176 ) ) ( not ( = ?auto_16160 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16176 ) ) ( not ( = ?auto_16161 ?auto_16165 ) ) ( not ( = ?auto_16161 ?auto_16176 ) ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16162 ?auto_16176 ) ) ( not ( = ?auto_16163 ?auto_16165 ) ) ( not ( = ?auto_16163 ?auto_16176 ) ) ( not ( = ?auto_16165 ?auto_16188 ) ) ( not ( = ?auto_16165 ?auto_16180 ) ) ( not ( = ?auto_16165 ?auto_16189 ) ) ( not ( = ?auto_16165 ?auto_16187 ) ) ( not ( = ?auto_16165 ?auto_16175 ) ) ( not ( = ?auto_16165 ?auto_16179 ) ) ( not ( = ?auto_16165 ?auto_16177 ) ) ( not ( = ?auto_16176 ?auto_16188 ) ) ( not ( = ?auto_16176 ?auto_16180 ) ) ( not ( = ?auto_16176 ?auto_16189 ) ) ( not ( = ?auto_16176 ?auto_16187 ) ) ( not ( = ?auto_16176 ?auto_16175 ) ) ( not ( = ?auto_16176 ?auto_16179 ) ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16166 ) ) ( not ( = ?auto_16157 ?auto_16178 ) ) ( not ( = ?auto_16158 ?auto_16166 ) ) ( not ( = ?auto_16158 ?auto_16178 ) ) ( not ( = ?auto_16159 ?auto_16166 ) ) ( not ( = ?auto_16159 ?auto_16178 ) ) ( not ( = ?auto_16160 ?auto_16166 ) ) ( not ( = ?auto_16160 ?auto_16178 ) ) ( not ( = ?auto_16161 ?auto_16166 ) ) ( not ( = ?auto_16161 ?auto_16178 ) ) ( not ( = ?auto_16162 ?auto_16166 ) ) ( not ( = ?auto_16162 ?auto_16178 ) ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16178 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16178 ) ) ( not ( = ?auto_16166 ?auto_16176 ) ) ( not ( = ?auto_16166 ?auto_16188 ) ) ( not ( = ?auto_16166 ?auto_16180 ) ) ( not ( = ?auto_16166 ?auto_16189 ) ) ( not ( = ?auto_16166 ?auto_16187 ) ) ( not ( = ?auto_16166 ?auto_16175 ) ) ( not ( = ?auto_16166 ?auto_16179 ) ) ( not ( = ?auto_16166 ?auto_16177 ) ) ( not ( = ?auto_16178 ?auto_16176 ) ) ( not ( = ?auto_16178 ?auto_16188 ) ) ( not ( = ?auto_16178 ?auto_16180 ) ) ( not ( = ?auto_16178 ?auto_16189 ) ) ( not ( = ?auto_16178 ?auto_16187 ) ) ( not ( = ?auto_16178 ?auto_16175 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16177 ) ) ( not ( = ?auto_16157 ?auto_16167 ) ) ( not ( = ?auto_16157 ?auto_16169 ) ) ( not ( = ?auto_16158 ?auto_16167 ) ) ( not ( = ?auto_16158 ?auto_16169 ) ) ( not ( = ?auto_16159 ?auto_16167 ) ) ( not ( = ?auto_16159 ?auto_16169 ) ) ( not ( = ?auto_16160 ?auto_16167 ) ) ( not ( = ?auto_16160 ?auto_16169 ) ) ( not ( = ?auto_16161 ?auto_16167 ) ) ( not ( = ?auto_16161 ?auto_16169 ) ) ( not ( = ?auto_16162 ?auto_16167 ) ) ( not ( = ?auto_16162 ?auto_16169 ) ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16163 ?auto_16169 ) ) ( not ( = ?auto_16164 ?auto_16167 ) ) ( not ( = ?auto_16164 ?auto_16169 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16169 ) ) ( not ( = ?auto_16167 ?auto_16178 ) ) ( not ( = ?auto_16167 ?auto_16176 ) ) ( not ( = ?auto_16167 ?auto_16188 ) ) ( not ( = ?auto_16167 ?auto_16180 ) ) ( not ( = ?auto_16167 ?auto_16189 ) ) ( not ( = ?auto_16167 ?auto_16187 ) ) ( not ( = ?auto_16167 ?auto_16175 ) ) ( not ( = ?auto_16167 ?auto_16179 ) ) ( not ( = ?auto_16167 ?auto_16177 ) ) ( not ( = ?auto_16169 ?auto_16178 ) ) ( not ( = ?auto_16169 ?auto_16176 ) ) ( not ( = ?auto_16169 ?auto_16188 ) ) ( not ( = ?auto_16169 ?auto_16180 ) ) ( not ( = ?auto_16169 ?auto_16189 ) ) ( not ( = ?auto_16169 ?auto_16187 ) ) ( not ( = ?auto_16169 ?auto_16175 ) ) ( not ( = ?auto_16169 ?auto_16179 ) ) ( not ( = ?auto_16169 ?auto_16177 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16165 ?auto_16166 )
      ( MAKE-1CRATE ?auto_16166 ?auto_16167 )
      ( MAKE-10CRATE-VERIFY ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16163 ?auto_16164 ?auto_16165 ?auto_16166 ?auto_16167 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_16213 - SURFACE
      ?auto_16214 - SURFACE
      ?auto_16215 - SURFACE
      ?auto_16216 - SURFACE
      ?auto_16217 - SURFACE
      ?auto_16218 - SURFACE
      ?auto_16219 - SURFACE
      ?auto_16220 - SURFACE
      ?auto_16221 - SURFACE
      ?auto_16222 - SURFACE
      ?auto_16223 - SURFACE
      ?auto_16224 - SURFACE
    )
    :vars
    (
      ?auto_16230 - HOIST
      ?auto_16227 - PLACE
      ?auto_16226 - PLACE
      ?auto_16225 - HOIST
      ?auto_16229 - SURFACE
      ?auto_16249 - PLACE
      ?auto_16250 - HOIST
      ?auto_16248 - SURFACE
      ?auto_16240 - PLACE
      ?auto_16244 - HOIST
      ?auto_16247 - SURFACE
      ?auto_16246 - PLACE
      ?auto_16234 - HOIST
      ?auto_16239 - SURFACE
      ?auto_16235 - PLACE
      ?auto_16233 - HOIST
      ?auto_16232 - SURFACE
      ?auto_16243 - SURFACE
      ?auto_16241 - SURFACE
      ?auto_16242 - SURFACE
      ?auto_16236 - SURFACE
      ?auto_16238 - PLACE
      ?auto_16231 - HOIST
      ?auto_16245 - SURFACE
      ?auto_16237 - SURFACE
      ?auto_16228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16230 ?auto_16227 ) ( IS-CRATE ?auto_16224 ) ( not ( = ?auto_16226 ?auto_16227 ) ) ( HOIST-AT ?auto_16225 ?auto_16226 ) ( AVAILABLE ?auto_16225 ) ( SURFACE-AT ?auto_16224 ?auto_16226 ) ( ON ?auto_16224 ?auto_16229 ) ( CLEAR ?auto_16224 ) ( not ( = ?auto_16223 ?auto_16224 ) ) ( not ( = ?auto_16223 ?auto_16229 ) ) ( not ( = ?auto_16224 ?auto_16229 ) ) ( not ( = ?auto_16230 ?auto_16225 ) ) ( IS-CRATE ?auto_16223 ) ( not ( = ?auto_16249 ?auto_16227 ) ) ( HOIST-AT ?auto_16250 ?auto_16249 ) ( SURFACE-AT ?auto_16223 ?auto_16249 ) ( ON ?auto_16223 ?auto_16248 ) ( CLEAR ?auto_16223 ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16248 ) ) ( not ( = ?auto_16223 ?auto_16248 ) ) ( not ( = ?auto_16230 ?auto_16250 ) ) ( IS-CRATE ?auto_16222 ) ( not ( = ?auto_16240 ?auto_16227 ) ) ( HOIST-AT ?auto_16244 ?auto_16240 ) ( SURFACE-AT ?auto_16222 ?auto_16240 ) ( ON ?auto_16222 ?auto_16247 ) ( CLEAR ?auto_16222 ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16247 ) ) ( not ( = ?auto_16222 ?auto_16247 ) ) ( not ( = ?auto_16230 ?auto_16244 ) ) ( IS-CRATE ?auto_16221 ) ( not ( = ?auto_16246 ?auto_16227 ) ) ( HOIST-AT ?auto_16234 ?auto_16246 ) ( SURFACE-AT ?auto_16221 ?auto_16246 ) ( ON ?auto_16221 ?auto_16239 ) ( CLEAR ?auto_16221 ) ( not ( = ?auto_16220 ?auto_16221 ) ) ( not ( = ?auto_16220 ?auto_16239 ) ) ( not ( = ?auto_16221 ?auto_16239 ) ) ( not ( = ?auto_16230 ?auto_16234 ) ) ( IS-CRATE ?auto_16220 ) ( not ( = ?auto_16235 ?auto_16227 ) ) ( HOIST-AT ?auto_16233 ?auto_16235 ) ( AVAILABLE ?auto_16233 ) ( SURFACE-AT ?auto_16220 ?auto_16235 ) ( ON ?auto_16220 ?auto_16232 ) ( CLEAR ?auto_16220 ) ( not ( = ?auto_16219 ?auto_16220 ) ) ( not ( = ?auto_16219 ?auto_16232 ) ) ( not ( = ?auto_16220 ?auto_16232 ) ) ( not ( = ?auto_16230 ?auto_16233 ) ) ( IS-CRATE ?auto_16219 ) ( AVAILABLE ?auto_16250 ) ( SURFACE-AT ?auto_16219 ?auto_16249 ) ( ON ?auto_16219 ?auto_16243 ) ( CLEAR ?auto_16219 ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16243 ) ) ( not ( = ?auto_16219 ?auto_16243 ) ) ( IS-CRATE ?auto_16218 ) ( SURFACE-AT ?auto_16218 ?auto_16246 ) ( ON ?auto_16218 ?auto_16241 ) ( CLEAR ?auto_16218 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16241 ) ) ( not ( = ?auto_16218 ?auto_16241 ) ) ( IS-CRATE ?auto_16217 ) ( SURFACE-AT ?auto_16217 ?auto_16240 ) ( ON ?auto_16217 ?auto_16242 ) ( CLEAR ?auto_16217 ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16242 ) ) ( not ( = ?auto_16217 ?auto_16242 ) ) ( IS-CRATE ?auto_16216 ) ( AVAILABLE ?auto_16234 ) ( SURFACE-AT ?auto_16216 ?auto_16246 ) ( ON ?auto_16216 ?auto_16236 ) ( CLEAR ?auto_16216 ) ( not ( = ?auto_16215 ?auto_16216 ) ) ( not ( = ?auto_16215 ?auto_16236 ) ) ( not ( = ?auto_16216 ?auto_16236 ) ) ( IS-CRATE ?auto_16215 ) ( not ( = ?auto_16238 ?auto_16227 ) ) ( HOIST-AT ?auto_16231 ?auto_16238 ) ( AVAILABLE ?auto_16231 ) ( SURFACE-AT ?auto_16215 ?auto_16238 ) ( ON ?auto_16215 ?auto_16245 ) ( CLEAR ?auto_16215 ) ( not ( = ?auto_16214 ?auto_16215 ) ) ( not ( = ?auto_16214 ?auto_16245 ) ) ( not ( = ?auto_16215 ?auto_16245 ) ) ( not ( = ?auto_16230 ?auto_16231 ) ) ( SURFACE-AT ?auto_16213 ?auto_16227 ) ( CLEAR ?auto_16213 ) ( IS-CRATE ?auto_16214 ) ( AVAILABLE ?auto_16230 ) ( AVAILABLE ?auto_16244 ) ( SURFACE-AT ?auto_16214 ?auto_16240 ) ( ON ?auto_16214 ?auto_16237 ) ( CLEAR ?auto_16214 ) ( TRUCK-AT ?auto_16228 ?auto_16227 ) ( not ( = ?auto_16213 ?auto_16214 ) ) ( not ( = ?auto_16213 ?auto_16237 ) ) ( not ( = ?auto_16214 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16215 ) ) ( not ( = ?auto_16213 ?auto_16245 ) ) ( not ( = ?auto_16215 ?auto_16237 ) ) ( not ( = ?auto_16238 ?auto_16240 ) ) ( not ( = ?auto_16231 ?auto_16244 ) ) ( not ( = ?auto_16245 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16216 ) ) ( not ( = ?auto_16213 ?auto_16236 ) ) ( not ( = ?auto_16214 ?auto_16216 ) ) ( not ( = ?auto_16214 ?auto_16236 ) ) ( not ( = ?auto_16216 ?auto_16245 ) ) ( not ( = ?auto_16216 ?auto_16237 ) ) ( not ( = ?auto_16246 ?auto_16238 ) ) ( not ( = ?auto_16246 ?auto_16240 ) ) ( not ( = ?auto_16234 ?auto_16231 ) ) ( not ( = ?auto_16234 ?auto_16244 ) ) ( not ( = ?auto_16236 ?auto_16245 ) ) ( not ( = ?auto_16236 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16217 ) ) ( not ( = ?auto_16213 ?auto_16242 ) ) ( not ( = ?auto_16214 ?auto_16217 ) ) ( not ( = ?auto_16214 ?auto_16242 ) ) ( not ( = ?auto_16215 ?auto_16217 ) ) ( not ( = ?auto_16215 ?auto_16242 ) ) ( not ( = ?auto_16217 ?auto_16236 ) ) ( not ( = ?auto_16217 ?auto_16245 ) ) ( not ( = ?auto_16217 ?auto_16237 ) ) ( not ( = ?auto_16242 ?auto_16236 ) ) ( not ( = ?auto_16242 ?auto_16245 ) ) ( not ( = ?auto_16242 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16218 ) ) ( not ( = ?auto_16213 ?auto_16241 ) ) ( not ( = ?auto_16214 ?auto_16218 ) ) ( not ( = ?auto_16214 ?auto_16241 ) ) ( not ( = ?auto_16215 ?auto_16218 ) ) ( not ( = ?auto_16215 ?auto_16241 ) ) ( not ( = ?auto_16216 ?auto_16218 ) ) ( not ( = ?auto_16216 ?auto_16241 ) ) ( not ( = ?auto_16218 ?auto_16242 ) ) ( not ( = ?auto_16218 ?auto_16236 ) ) ( not ( = ?auto_16218 ?auto_16245 ) ) ( not ( = ?auto_16218 ?auto_16237 ) ) ( not ( = ?auto_16241 ?auto_16242 ) ) ( not ( = ?auto_16241 ?auto_16236 ) ) ( not ( = ?auto_16241 ?auto_16245 ) ) ( not ( = ?auto_16241 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16219 ) ) ( not ( = ?auto_16213 ?auto_16243 ) ) ( not ( = ?auto_16214 ?auto_16219 ) ) ( not ( = ?auto_16214 ?auto_16243 ) ) ( not ( = ?auto_16215 ?auto_16219 ) ) ( not ( = ?auto_16215 ?auto_16243 ) ) ( not ( = ?auto_16216 ?auto_16219 ) ) ( not ( = ?auto_16216 ?auto_16243 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16243 ) ) ( not ( = ?auto_16219 ?auto_16241 ) ) ( not ( = ?auto_16219 ?auto_16242 ) ) ( not ( = ?auto_16219 ?auto_16236 ) ) ( not ( = ?auto_16219 ?auto_16245 ) ) ( not ( = ?auto_16219 ?auto_16237 ) ) ( not ( = ?auto_16249 ?auto_16246 ) ) ( not ( = ?auto_16249 ?auto_16240 ) ) ( not ( = ?auto_16249 ?auto_16238 ) ) ( not ( = ?auto_16250 ?auto_16234 ) ) ( not ( = ?auto_16250 ?auto_16244 ) ) ( not ( = ?auto_16250 ?auto_16231 ) ) ( not ( = ?auto_16243 ?auto_16241 ) ) ( not ( = ?auto_16243 ?auto_16242 ) ) ( not ( = ?auto_16243 ?auto_16236 ) ) ( not ( = ?auto_16243 ?auto_16245 ) ) ( not ( = ?auto_16243 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16220 ) ) ( not ( = ?auto_16213 ?auto_16232 ) ) ( not ( = ?auto_16214 ?auto_16220 ) ) ( not ( = ?auto_16214 ?auto_16232 ) ) ( not ( = ?auto_16215 ?auto_16220 ) ) ( not ( = ?auto_16215 ?auto_16232 ) ) ( not ( = ?auto_16216 ?auto_16220 ) ) ( not ( = ?auto_16216 ?auto_16232 ) ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16232 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16232 ) ) ( not ( = ?auto_16220 ?auto_16243 ) ) ( not ( = ?auto_16220 ?auto_16241 ) ) ( not ( = ?auto_16220 ?auto_16242 ) ) ( not ( = ?auto_16220 ?auto_16236 ) ) ( not ( = ?auto_16220 ?auto_16245 ) ) ( not ( = ?auto_16220 ?auto_16237 ) ) ( not ( = ?auto_16235 ?auto_16249 ) ) ( not ( = ?auto_16235 ?auto_16246 ) ) ( not ( = ?auto_16235 ?auto_16240 ) ) ( not ( = ?auto_16235 ?auto_16238 ) ) ( not ( = ?auto_16233 ?auto_16250 ) ) ( not ( = ?auto_16233 ?auto_16234 ) ) ( not ( = ?auto_16233 ?auto_16244 ) ) ( not ( = ?auto_16233 ?auto_16231 ) ) ( not ( = ?auto_16232 ?auto_16243 ) ) ( not ( = ?auto_16232 ?auto_16241 ) ) ( not ( = ?auto_16232 ?auto_16242 ) ) ( not ( = ?auto_16232 ?auto_16236 ) ) ( not ( = ?auto_16232 ?auto_16245 ) ) ( not ( = ?auto_16232 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16221 ) ) ( not ( = ?auto_16213 ?auto_16239 ) ) ( not ( = ?auto_16214 ?auto_16221 ) ) ( not ( = ?auto_16214 ?auto_16239 ) ) ( not ( = ?auto_16215 ?auto_16221 ) ) ( not ( = ?auto_16215 ?auto_16239 ) ) ( not ( = ?auto_16216 ?auto_16221 ) ) ( not ( = ?auto_16216 ?auto_16239 ) ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16217 ?auto_16239 ) ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16239 ) ) ( not ( = ?auto_16219 ?auto_16221 ) ) ( not ( = ?auto_16219 ?auto_16239 ) ) ( not ( = ?auto_16221 ?auto_16232 ) ) ( not ( = ?auto_16221 ?auto_16243 ) ) ( not ( = ?auto_16221 ?auto_16241 ) ) ( not ( = ?auto_16221 ?auto_16242 ) ) ( not ( = ?auto_16221 ?auto_16236 ) ) ( not ( = ?auto_16221 ?auto_16245 ) ) ( not ( = ?auto_16221 ?auto_16237 ) ) ( not ( = ?auto_16239 ?auto_16232 ) ) ( not ( = ?auto_16239 ?auto_16243 ) ) ( not ( = ?auto_16239 ?auto_16241 ) ) ( not ( = ?auto_16239 ?auto_16242 ) ) ( not ( = ?auto_16239 ?auto_16236 ) ) ( not ( = ?auto_16239 ?auto_16245 ) ) ( not ( = ?auto_16239 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16222 ) ) ( not ( = ?auto_16213 ?auto_16247 ) ) ( not ( = ?auto_16214 ?auto_16222 ) ) ( not ( = ?auto_16214 ?auto_16247 ) ) ( not ( = ?auto_16215 ?auto_16222 ) ) ( not ( = ?auto_16215 ?auto_16247 ) ) ( not ( = ?auto_16216 ?auto_16222 ) ) ( not ( = ?auto_16216 ?auto_16247 ) ) ( not ( = ?auto_16217 ?auto_16222 ) ) ( not ( = ?auto_16217 ?auto_16247 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( not ( = ?auto_16218 ?auto_16247 ) ) ( not ( = ?auto_16219 ?auto_16222 ) ) ( not ( = ?auto_16219 ?auto_16247 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16247 ) ) ( not ( = ?auto_16222 ?auto_16239 ) ) ( not ( = ?auto_16222 ?auto_16232 ) ) ( not ( = ?auto_16222 ?auto_16243 ) ) ( not ( = ?auto_16222 ?auto_16241 ) ) ( not ( = ?auto_16222 ?auto_16242 ) ) ( not ( = ?auto_16222 ?auto_16236 ) ) ( not ( = ?auto_16222 ?auto_16245 ) ) ( not ( = ?auto_16222 ?auto_16237 ) ) ( not ( = ?auto_16247 ?auto_16239 ) ) ( not ( = ?auto_16247 ?auto_16232 ) ) ( not ( = ?auto_16247 ?auto_16243 ) ) ( not ( = ?auto_16247 ?auto_16241 ) ) ( not ( = ?auto_16247 ?auto_16242 ) ) ( not ( = ?auto_16247 ?auto_16236 ) ) ( not ( = ?auto_16247 ?auto_16245 ) ) ( not ( = ?auto_16247 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16223 ) ) ( not ( = ?auto_16213 ?auto_16248 ) ) ( not ( = ?auto_16214 ?auto_16223 ) ) ( not ( = ?auto_16214 ?auto_16248 ) ) ( not ( = ?auto_16215 ?auto_16223 ) ) ( not ( = ?auto_16215 ?auto_16248 ) ) ( not ( = ?auto_16216 ?auto_16223 ) ) ( not ( = ?auto_16216 ?auto_16248 ) ) ( not ( = ?auto_16217 ?auto_16223 ) ) ( not ( = ?auto_16217 ?auto_16248 ) ) ( not ( = ?auto_16218 ?auto_16223 ) ) ( not ( = ?auto_16218 ?auto_16248 ) ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( not ( = ?auto_16219 ?auto_16248 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16220 ?auto_16248 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16248 ) ) ( not ( = ?auto_16223 ?auto_16247 ) ) ( not ( = ?auto_16223 ?auto_16239 ) ) ( not ( = ?auto_16223 ?auto_16232 ) ) ( not ( = ?auto_16223 ?auto_16243 ) ) ( not ( = ?auto_16223 ?auto_16241 ) ) ( not ( = ?auto_16223 ?auto_16242 ) ) ( not ( = ?auto_16223 ?auto_16236 ) ) ( not ( = ?auto_16223 ?auto_16245 ) ) ( not ( = ?auto_16223 ?auto_16237 ) ) ( not ( = ?auto_16248 ?auto_16247 ) ) ( not ( = ?auto_16248 ?auto_16239 ) ) ( not ( = ?auto_16248 ?auto_16232 ) ) ( not ( = ?auto_16248 ?auto_16243 ) ) ( not ( = ?auto_16248 ?auto_16241 ) ) ( not ( = ?auto_16248 ?auto_16242 ) ) ( not ( = ?auto_16248 ?auto_16236 ) ) ( not ( = ?auto_16248 ?auto_16245 ) ) ( not ( = ?auto_16248 ?auto_16237 ) ) ( not ( = ?auto_16213 ?auto_16224 ) ) ( not ( = ?auto_16213 ?auto_16229 ) ) ( not ( = ?auto_16214 ?auto_16224 ) ) ( not ( = ?auto_16214 ?auto_16229 ) ) ( not ( = ?auto_16215 ?auto_16224 ) ) ( not ( = ?auto_16215 ?auto_16229 ) ) ( not ( = ?auto_16216 ?auto_16224 ) ) ( not ( = ?auto_16216 ?auto_16229 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16229 ) ) ( not ( = ?auto_16218 ?auto_16224 ) ) ( not ( = ?auto_16218 ?auto_16229 ) ) ( not ( = ?auto_16219 ?auto_16224 ) ) ( not ( = ?auto_16219 ?auto_16229 ) ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16220 ?auto_16229 ) ) ( not ( = ?auto_16221 ?auto_16224 ) ) ( not ( = ?auto_16221 ?auto_16229 ) ) ( not ( = ?auto_16222 ?auto_16224 ) ) ( not ( = ?auto_16222 ?auto_16229 ) ) ( not ( = ?auto_16224 ?auto_16248 ) ) ( not ( = ?auto_16224 ?auto_16247 ) ) ( not ( = ?auto_16224 ?auto_16239 ) ) ( not ( = ?auto_16224 ?auto_16232 ) ) ( not ( = ?auto_16224 ?auto_16243 ) ) ( not ( = ?auto_16224 ?auto_16241 ) ) ( not ( = ?auto_16224 ?auto_16242 ) ) ( not ( = ?auto_16224 ?auto_16236 ) ) ( not ( = ?auto_16224 ?auto_16245 ) ) ( not ( = ?auto_16224 ?auto_16237 ) ) ( not ( = ?auto_16226 ?auto_16249 ) ) ( not ( = ?auto_16226 ?auto_16240 ) ) ( not ( = ?auto_16226 ?auto_16246 ) ) ( not ( = ?auto_16226 ?auto_16235 ) ) ( not ( = ?auto_16226 ?auto_16238 ) ) ( not ( = ?auto_16225 ?auto_16250 ) ) ( not ( = ?auto_16225 ?auto_16244 ) ) ( not ( = ?auto_16225 ?auto_16234 ) ) ( not ( = ?auto_16225 ?auto_16233 ) ) ( not ( = ?auto_16225 ?auto_16231 ) ) ( not ( = ?auto_16229 ?auto_16248 ) ) ( not ( = ?auto_16229 ?auto_16247 ) ) ( not ( = ?auto_16229 ?auto_16239 ) ) ( not ( = ?auto_16229 ?auto_16232 ) ) ( not ( = ?auto_16229 ?auto_16243 ) ) ( not ( = ?auto_16229 ?auto_16241 ) ) ( not ( = ?auto_16229 ?auto_16242 ) ) ( not ( = ?auto_16229 ?auto_16236 ) ) ( not ( = ?auto_16229 ?auto_16245 ) ) ( not ( = ?auto_16229 ?auto_16237 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16213 ?auto_16214 ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 )
      ( MAKE-1CRATE ?auto_16223 ?auto_16224 )
      ( MAKE-11CRATE-VERIFY ?auto_16213 ?auto_16214 ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ?auto_16219 ?auto_16220 ?auto_16221 ?auto_16222 ?auto_16223 ?auto_16224 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_16274 - SURFACE
      ?auto_16275 - SURFACE
      ?auto_16276 - SURFACE
      ?auto_16277 - SURFACE
      ?auto_16278 - SURFACE
      ?auto_16279 - SURFACE
      ?auto_16280 - SURFACE
      ?auto_16281 - SURFACE
      ?auto_16282 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16286 - SURFACE
    )
    :vars
    (
      ?auto_16289 - HOIST
      ?auto_16288 - PLACE
      ?auto_16291 - PLACE
      ?auto_16287 - HOIST
      ?auto_16292 - SURFACE
      ?auto_16302 - PLACE
      ?auto_16304 - HOIST
      ?auto_16311 - SURFACE
      ?auto_16313 - PLACE
      ?auto_16312 - HOIST
      ?auto_16294 - SURFACE
      ?auto_16298 - SURFACE
      ?auto_16306 - PLACE
      ?auto_16297 - HOIST
      ?auto_16308 - SURFACE
      ?auto_16301 - PLACE
      ?auto_16299 - HOIST
      ?auto_16305 - SURFACE
      ?auto_16310 - SURFACE
      ?auto_16309 - SURFACE
      ?auto_16303 - SURFACE
      ?auto_16295 - SURFACE
      ?auto_16307 - PLACE
      ?auto_16293 - HOIST
      ?auto_16300 - SURFACE
      ?auto_16296 - SURFACE
      ?auto_16290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16289 ?auto_16288 ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16291 ?auto_16288 ) ) ( HOIST-AT ?auto_16287 ?auto_16291 ) ( SURFACE-AT ?auto_16286 ?auto_16291 ) ( ON ?auto_16286 ?auto_16292 ) ( CLEAR ?auto_16286 ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16292 ) ) ( not ( = ?auto_16286 ?auto_16292 ) ) ( not ( = ?auto_16289 ?auto_16287 ) ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16302 ?auto_16288 ) ) ( HOIST-AT ?auto_16304 ?auto_16302 ) ( AVAILABLE ?auto_16304 ) ( SURFACE-AT ?auto_16285 ?auto_16302 ) ( ON ?auto_16285 ?auto_16311 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16284 ?auto_16285 ) ) ( not ( = ?auto_16284 ?auto_16311 ) ) ( not ( = ?auto_16285 ?auto_16311 ) ) ( not ( = ?auto_16289 ?auto_16304 ) ) ( IS-CRATE ?auto_16284 ) ( not ( = ?auto_16313 ?auto_16288 ) ) ( HOIST-AT ?auto_16312 ?auto_16313 ) ( SURFACE-AT ?auto_16284 ?auto_16313 ) ( ON ?auto_16284 ?auto_16294 ) ( CLEAR ?auto_16284 ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16294 ) ) ( not ( = ?auto_16284 ?auto_16294 ) ) ( not ( = ?auto_16289 ?auto_16312 ) ) ( IS-CRATE ?auto_16283 ) ( SURFACE-AT ?auto_16283 ?auto_16291 ) ( ON ?auto_16283 ?auto_16298 ) ( CLEAR ?auto_16283 ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16298 ) ) ( not ( = ?auto_16283 ?auto_16298 ) ) ( IS-CRATE ?auto_16282 ) ( not ( = ?auto_16306 ?auto_16288 ) ) ( HOIST-AT ?auto_16297 ?auto_16306 ) ( SURFACE-AT ?auto_16282 ?auto_16306 ) ( ON ?auto_16282 ?auto_16308 ) ( CLEAR ?auto_16282 ) ( not ( = ?auto_16281 ?auto_16282 ) ) ( not ( = ?auto_16281 ?auto_16308 ) ) ( not ( = ?auto_16282 ?auto_16308 ) ) ( not ( = ?auto_16289 ?auto_16297 ) ) ( IS-CRATE ?auto_16281 ) ( not ( = ?auto_16301 ?auto_16288 ) ) ( HOIST-AT ?auto_16299 ?auto_16301 ) ( AVAILABLE ?auto_16299 ) ( SURFACE-AT ?auto_16281 ?auto_16301 ) ( ON ?auto_16281 ?auto_16305 ) ( CLEAR ?auto_16281 ) ( not ( = ?auto_16280 ?auto_16281 ) ) ( not ( = ?auto_16280 ?auto_16305 ) ) ( not ( = ?auto_16281 ?auto_16305 ) ) ( not ( = ?auto_16289 ?auto_16299 ) ) ( IS-CRATE ?auto_16280 ) ( AVAILABLE ?auto_16312 ) ( SURFACE-AT ?auto_16280 ?auto_16313 ) ( ON ?auto_16280 ?auto_16310 ) ( CLEAR ?auto_16280 ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16279 ?auto_16310 ) ) ( not ( = ?auto_16280 ?auto_16310 ) ) ( IS-CRATE ?auto_16279 ) ( SURFACE-AT ?auto_16279 ?auto_16306 ) ( ON ?auto_16279 ?auto_16309 ) ( CLEAR ?auto_16279 ) ( not ( = ?auto_16278 ?auto_16279 ) ) ( not ( = ?auto_16278 ?auto_16309 ) ) ( not ( = ?auto_16279 ?auto_16309 ) ) ( IS-CRATE ?auto_16278 ) ( SURFACE-AT ?auto_16278 ?auto_16291 ) ( ON ?auto_16278 ?auto_16303 ) ( CLEAR ?auto_16278 ) ( not ( = ?auto_16277 ?auto_16278 ) ) ( not ( = ?auto_16277 ?auto_16303 ) ) ( not ( = ?auto_16278 ?auto_16303 ) ) ( IS-CRATE ?auto_16277 ) ( AVAILABLE ?auto_16297 ) ( SURFACE-AT ?auto_16277 ?auto_16306 ) ( ON ?auto_16277 ?auto_16295 ) ( CLEAR ?auto_16277 ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16295 ) ) ( not ( = ?auto_16277 ?auto_16295 ) ) ( IS-CRATE ?auto_16276 ) ( not ( = ?auto_16307 ?auto_16288 ) ) ( HOIST-AT ?auto_16293 ?auto_16307 ) ( AVAILABLE ?auto_16293 ) ( SURFACE-AT ?auto_16276 ?auto_16307 ) ( ON ?auto_16276 ?auto_16300 ) ( CLEAR ?auto_16276 ) ( not ( = ?auto_16275 ?auto_16276 ) ) ( not ( = ?auto_16275 ?auto_16300 ) ) ( not ( = ?auto_16276 ?auto_16300 ) ) ( not ( = ?auto_16289 ?auto_16293 ) ) ( SURFACE-AT ?auto_16274 ?auto_16288 ) ( CLEAR ?auto_16274 ) ( IS-CRATE ?auto_16275 ) ( AVAILABLE ?auto_16289 ) ( AVAILABLE ?auto_16287 ) ( SURFACE-AT ?auto_16275 ?auto_16291 ) ( ON ?auto_16275 ?auto_16296 ) ( CLEAR ?auto_16275 ) ( TRUCK-AT ?auto_16290 ?auto_16288 ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( not ( = ?auto_16274 ?auto_16296 ) ) ( not ( = ?auto_16275 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16276 ) ) ( not ( = ?auto_16274 ?auto_16300 ) ) ( not ( = ?auto_16276 ?auto_16296 ) ) ( not ( = ?auto_16307 ?auto_16291 ) ) ( not ( = ?auto_16293 ?auto_16287 ) ) ( not ( = ?auto_16300 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16277 ) ) ( not ( = ?auto_16274 ?auto_16295 ) ) ( not ( = ?auto_16275 ?auto_16277 ) ) ( not ( = ?auto_16275 ?auto_16295 ) ) ( not ( = ?auto_16277 ?auto_16300 ) ) ( not ( = ?auto_16277 ?auto_16296 ) ) ( not ( = ?auto_16306 ?auto_16307 ) ) ( not ( = ?auto_16306 ?auto_16291 ) ) ( not ( = ?auto_16297 ?auto_16293 ) ) ( not ( = ?auto_16297 ?auto_16287 ) ) ( not ( = ?auto_16295 ?auto_16300 ) ) ( not ( = ?auto_16295 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16278 ) ) ( not ( = ?auto_16274 ?auto_16303 ) ) ( not ( = ?auto_16275 ?auto_16278 ) ) ( not ( = ?auto_16275 ?auto_16303 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16303 ) ) ( not ( = ?auto_16278 ?auto_16295 ) ) ( not ( = ?auto_16278 ?auto_16300 ) ) ( not ( = ?auto_16278 ?auto_16296 ) ) ( not ( = ?auto_16303 ?auto_16295 ) ) ( not ( = ?auto_16303 ?auto_16300 ) ) ( not ( = ?auto_16303 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16279 ) ) ( not ( = ?auto_16274 ?auto_16309 ) ) ( not ( = ?auto_16275 ?auto_16279 ) ) ( not ( = ?auto_16275 ?auto_16309 ) ) ( not ( = ?auto_16276 ?auto_16279 ) ) ( not ( = ?auto_16276 ?auto_16309 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16309 ) ) ( not ( = ?auto_16279 ?auto_16303 ) ) ( not ( = ?auto_16279 ?auto_16295 ) ) ( not ( = ?auto_16279 ?auto_16300 ) ) ( not ( = ?auto_16279 ?auto_16296 ) ) ( not ( = ?auto_16309 ?auto_16303 ) ) ( not ( = ?auto_16309 ?auto_16295 ) ) ( not ( = ?auto_16309 ?auto_16300 ) ) ( not ( = ?auto_16309 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16280 ) ) ( not ( = ?auto_16274 ?auto_16310 ) ) ( not ( = ?auto_16275 ?auto_16280 ) ) ( not ( = ?auto_16275 ?auto_16310 ) ) ( not ( = ?auto_16276 ?auto_16280 ) ) ( not ( = ?auto_16276 ?auto_16310 ) ) ( not ( = ?auto_16277 ?auto_16280 ) ) ( not ( = ?auto_16277 ?auto_16310 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16278 ?auto_16310 ) ) ( not ( = ?auto_16280 ?auto_16309 ) ) ( not ( = ?auto_16280 ?auto_16303 ) ) ( not ( = ?auto_16280 ?auto_16295 ) ) ( not ( = ?auto_16280 ?auto_16300 ) ) ( not ( = ?auto_16280 ?auto_16296 ) ) ( not ( = ?auto_16313 ?auto_16306 ) ) ( not ( = ?auto_16313 ?auto_16291 ) ) ( not ( = ?auto_16313 ?auto_16307 ) ) ( not ( = ?auto_16312 ?auto_16297 ) ) ( not ( = ?auto_16312 ?auto_16287 ) ) ( not ( = ?auto_16312 ?auto_16293 ) ) ( not ( = ?auto_16310 ?auto_16309 ) ) ( not ( = ?auto_16310 ?auto_16303 ) ) ( not ( = ?auto_16310 ?auto_16295 ) ) ( not ( = ?auto_16310 ?auto_16300 ) ) ( not ( = ?auto_16310 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16281 ) ) ( not ( = ?auto_16274 ?auto_16305 ) ) ( not ( = ?auto_16275 ?auto_16281 ) ) ( not ( = ?auto_16275 ?auto_16305 ) ) ( not ( = ?auto_16276 ?auto_16281 ) ) ( not ( = ?auto_16276 ?auto_16305 ) ) ( not ( = ?auto_16277 ?auto_16281 ) ) ( not ( = ?auto_16277 ?auto_16305 ) ) ( not ( = ?auto_16278 ?auto_16281 ) ) ( not ( = ?auto_16278 ?auto_16305 ) ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16279 ?auto_16305 ) ) ( not ( = ?auto_16281 ?auto_16310 ) ) ( not ( = ?auto_16281 ?auto_16309 ) ) ( not ( = ?auto_16281 ?auto_16303 ) ) ( not ( = ?auto_16281 ?auto_16295 ) ) ( not ( = ?auto_16281 ?auto_16300 ) ) ( not ( = ?auto_16281 ?auto_16296 ) ) ( not ( = ?auto_16301 ?auto_16313 ) ) ( not ( = ?auto_16301 ?auto_16306 ) ) ( not ( = ?auto_16301 ?auto_16291 ) ) ( not ( = ?auto_16301 ?auto_16307 ) ) ( not ( = ?auto_16299 ?auto_16312 ) ) ( not ( = ?auto_16299 ?auto_16297 ) ) ( not ( = ?auto_16299 ?auto_16287 ) ) ( not ( = ?auto_16299 ?auto_16293 ) ) ( not ( = ?auto_16305 ?auto_16310 ) ) ( not ( = ?auto_16305 ?auto_16309 ) ) ( not ( = ?auto_16305 ?auto_16303 ) ) ( not ( = ?auto_16305 ?auto_16295 ) ) ( not ( = ?auto_16305 ?auto_16300 ) ) ( not ( = ?auto_16305 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16282 ) ) ( not ( = ?auto_16274 ?auto_16308 ) ) ( not ( = ?auto_16275 ?auto_16282 ) ) ( not ( = ?auto_16275 ?auto_16308 ) ) ( not ( = ?auto_16276 ?auto_16282 ) ) ( not ( = ?auto_16276 ?auto_16308 ) ) ( not ( = ?auto_16277 ?auto_16282 ) ) ( not ( = ?auto_16277 ?auto_16308 ) ) ( not ( = ?auto_16278 ?auto_16282 ) ) ( not ( = ?auto_16278 ?auto_16308 ) ) ( not ( = ?auto_16279 ?auto_16282 ) ) ( not ( = ?auto_16279 ?auto_16308 ) ) ( not ( = ?auto_16280 ?auto_16282 ) ) ( not ( = ?auto_16280 ?auto_16308 ) ) ( not ( = ?auto_16282 ?auto_16305 ) ) ( not ( = ?auto_16282 ?auto_16310 ) ) ( not ( = ?auto_16282 ?auto_16309 ) ) ( not ( = ?auto_16282 ?auto_16303 ) ) ( not ( = ?auto_16282 ?auto_16295 ) ) ( not ( = ?auto_16282 ?auto_16300 ) ) ( not ( = ?auto_16282 ?auto_16296 ) ) ( not ( = ?auto_16308 ?auto_16305 ) ) ( not ( = ?auto_16308 ?auto_16310 ) ) ( not ( = ?auto_16308 ?auto_16309 ) ) ( not ( = ?auto_16308 ?auto_16303 ) ) ( not ( = ?auto_16308 ?auto_16295 ) ) ( not ( = ?auto_16308 ?auto_16300 ) ) ( not ( = ?auto_16308 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16283 ) ) ( not ( = ?auto_16274 ?auto_16298 ) ) ( not ( = ?auto_16275 ?auto_16283 ) ) ( not ( = ?auto_16275 ?auto_16298 ) ) ( not ( = ?auto_16276 ?auto_16283 ) ) ( not ( = ?auto_16276 ?auto_16298 ) ) ( not ( = ?auto_16277 ?auto_16283 ) ) ( not ( = ?auto_16277 ?auto_16298 ) ) ( not ( = ?auto_16278 ?auto_16283 ) ) ( not ( = ?auto_16278 ?auto_16298 ) ) ( not ( = ?auto_16279 ?auto_16283 ) ) ( not ( = ?auto_16279 ?auto_16298 ) ) ( not ( = ?auto_16280 ?auto_16283 ) ) ( not ( = ?auto_16280 ?auto_16298 ) ) ( not ( = ?auto_16281 ?auto_16283 ) ) ( not ( = ?auto_16281 ?auto_16298 ) ) ( not ( = ?auto_16283 ?auto_16308 ) ) ( not ( = ?auto_16283 ?auto_16305 ) ) ( not ( = ?auto_16283 ?auto_16310 ) ) ( not ( = ?auto_16283 ?auto_16309 ) ) ( not ( = ?auto_16283 ?auto_16303 ) ) ( not ( = ?auto_16283 ?auto_16295 ) ) ( not ( = ?auto_16283 ?auto_16300 ) ) ( not ( = ?auto_16283 ?auto_16296 ) ) ( not ( = ?auto_16298 ?auto_16308 ) ) ( not ( = ?auto_16298 ?auto_16305 ) ) ( not ( = ?auto_16298 ?auto_16310 ) ) ( not ( = ?auto_16298 ?auto_16309 ) ) ( not ( = ?auto_16298 ?auto_16303 ) ) ( not ( = ?auto_16298 ?auto_16295 ) ) ( not ( = ?auto_16298 ?auto_16300 ) ) ( not ( = ?auto_16298 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16284 ) ) ( not ( = ?auto_16274 ?auto_16294 ) ) ( not ( = ?auto_16275 ?auto_16284 ) ) ( not ( = ?auto_16275 ?auto_16294 ) ) ( not ( = ?auto_16276 ?auto_16284 ) ) ( not ( = ?auto_16276 ?auto_16294 ) ) ( not ( = ?auto_16277 ?auto_16284 ) ) ( not ( = ?auto_16277 ?auto_16294 ) ) ( not ( = ?auto_16278 ?auto_16284 ) ) ( not ( = ?auto_16278 ?auto_16294 ) ) ( not ( = ?auto_16279 ?auto_16284 ) ) ( not ( = ?auto_16279 ?auto_16294 ) ) ( not ( = ?auto_16280 ?auto_16284 ) ) ( not ( = ?auto_16280 ?auto_16294 ) ) ( not ( = ?auto_16281 ?auto_16284 ) ) ( not ( = ?auto_16281 ?auto_16294 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16294 ) ) ( not ( = ?auto_16284 ?auto_16298 ) ) ( not ( = ?auto_16284 ?auto_16308 ) ) ( not ( = ?auto_16284 ?auto_16305 ) ) ( not ( = ?auto_16284 ?auto_16310 ) ) ( not ( = ?auto_16284 ?auto_16309 ) ) ( not ( = ?auto_16284 ?auto_16303 ) ) ( not ( = ?auto_16284 ?auto_16295 ) ) ( not ( = ?auto_16284 ?auto_16300 ) ) ( not ( = ?auto_16284 ?auto_16296 ) ) ( not ( = ?auto_16294 ?auto_16298 ) ) ( not ( = ?auto_16294 ?auto_16308 ) ) ( not ( = ?auto_16294 ?auto_16305 ) ) ( not ( = ?auto_16294 ?auto_16310 ) ) ( not ( = ?auto_16294 ?auto_16309 ) ) ( not ( = ?auto_16294 ?auto_16303 ) ) ( not ( = ?auto_16294 ?auto_16295 ) ) ( not ( = ?auto_16294 ?auto_16300 ) ) ( not ( = ?auto_16294 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16285 ) ) ( not ( = ?auto_16274 ?auto_16311 ) ) ( not ( = ?auto_16275 ?auto_16285 ) ) ( not ( = ?auto_16275 ?auto_16311 ) ) ( not ( = ?auto_16276 ?auto_16285 ) ) ( not ( = ?auto_16276 ?auto_16311 ) ) ( not ( = ?auto_16277 ?auto_16285 ) ) ( not ( = ?auto_16277 ?auto_16311 ) ) ( not ( = ?auto_16278 ?auto_16285 ) ) ( not ( = ?auto_16278 ?auto_16311 ) ) ( not ( = ?auto_16279 ?auto_16285 ) ) ( not ( = ?auto_16279 ?auto_16311 ) ) ( not ( = ?auto_16280 ?auto_16285 ) ) ( not ( = ?auto_16280 ?auto_16311 ) ) ( not ( = ?auto_16281 ?auto_16285 ) ) ( not ( = ?auto_16281 ?auto_16311 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16311 ) ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16311 ) ) ( not ( = ?auto_16285 ?auto_16294 ) ) ( not ( = ?auto_16285 ?auto_16298 ) ) ( not ( = ?auto_16285 ?auto_16308 ) ) ( not ( = ?auto_16285 ?auto_16305 ) ) ( not ( = ?auto_16285 ?auto_16310 ) ) ( not ( = ?auto_16285 ?auto_16309 ) ) ( not ( = ?auto_16285 ?auto_16303 ) ) ( not ( = ?auto_16285 ?auto_16295 ) ) ( not ( = ?auto_16285 ?auto_16300 ) ) ( not ( = ?auto_16285 ?auto_16296 ) ) ( not ( = ?auto_16302 ?auto_16313 ) ) ( not ( = ?auto_16302 ?auto_16291 ) ) ( not ( = ?auto_16302 ?auto_16306 ) ) ( not ( = ?auto_16302 ?auto_16301 ) ) ( not ( = ?auto_16302 ?auto_16307 ) ) ( not ( = ?auto_16304 ?auto_16312 ) ) ( not ( = ?auto_16304 ?auto_16287 ) ) ( not ( = ?auto_16304 ?auto_16297 ) ) ( not ( = ?auto_16304 ?auto_16299 ) ) ( not ( = ?auto_16304 ?auto_16293 ) ) ( not ( = ?auto_16311 ?auto_16294 ) ) ( not ( = ?auto_16311 ?auto_16298 ) ) ( not ( = ?auto_16311 ?auto_16308 ) ) ( not ( = ?auto_16311 ?auto_16305 ) ) ( not ( = ?auto_16311 ?auto_16310 ) ) ( not ( = ?auto_16311 ?auto_16309 ) ) ( not ( = ?auto_16311 ?auto_16303 ) ) ( not ( = ?auto_16311 ?auto_16295 ) ) ( not ( = ?auto_16311 ?auto_16300 ) ) ( not ( = ?auto_16311 ?auto_16296 ) ) ( not ( = ?auto_16274 ?auto_16286 ) ) ( not ( = ?auto_16274 ?auto_16292 ) ) ( not ( = ?auto_16275 ?auto_16286 ) ) ( not ( = ?auto_16275 ?auto_16292 ) ) ( not ( = ?auto_16276 ?auto_16286 ) ) ( not ( = ?auto_16276 ?auto_16292 ) ) ( not ( = ?auto_16277 ?auto_16286 ) ) ( not ( = ?auto_16277 ?auto_16292 ) ) ( not ( = ?auto_16278 ?auto_16286 ) ) ( not ( = ?auto_16278 ?auto_16292 ) ) ( not ( = ?auto_16279 ?auto_16286 ) ) ( not ( = ?auto_16279 ?auto_16292 ) ) ( not ( = ?auto_16280 ?auto_16286 ) ) ( not ( = ?auto_16280 ?auto_16292 ) ) ( not ( = ?auto_16281 ?auto_16286 ) ) ( not ( = ?auto_16281 ?auto_16292 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16292 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16283 ?auto_16292 ) ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16292 ) ) ( not ( = ?auto_16286 ?auto_16311 ) ) ( not ( = ?auto_16286 ?auto_16294 ) ) ( not ( = ?auto_16286 ?auto_16298 ) ) ( not ( = ?auto_16286 ?auto_16308 ) ) ( not ( = ?auto_16286 ?auto_16305 ) ) ( not ( = ?auto_16286 ?auto_16310 ) ) ( not ( = ?auto_16286 ?auto_16309 ) ) ( not ( = ?auto_16286 ?auto_16303 ) ) ( not ( = ?auto_16286 ?auto_16295 ) ) ( not ( = ?auto_16286 ?auto_16300 ) ) ( not ( = ?auto_16286 ?auto_16296 ) ) ( not ( = ?auto_16292 ?auto_16311 ) ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( not ( = ?auto_16292 ?auto_16298 ) ) ( not ( = ?auto_16292 ?auto_16308 ) ) ( not ( = ?auto_16292 ?auto_16305 ) ) ( not ( = ?auto_16292 ?auto_16310 ) ) ( not ( = ?auto_16292 ?auto_16309 ) ) ( not ( = ?auto_16292 ?auto_16303 ) ) ( not ( = ?auto_16292 ?auto_16295 ) ) ( not ( = ?auto_16292 ?auto_16300 ) ) ( not ( = ?auto_16292 ?auto_16296 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16274 ?auto_16275 ?auto_16276 ?auto_16277 ?auto_16278 ?auto_16279 ?auto_16280 ?auto_16281 ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 )
      ( MAKE-1CRATE ?auto_16285 ?auto_16286 )
      ( MAKE-12CRATE-VERIFY ?auto_16274 ?auto_16275 ?auto_16276 ?auto_16277 ?auto_16278 ?auto_16279 ?auto_16280 ?auto_16281 ?auto_16282 ?auto_16283 ?auto_16284 ?auto_16285 ?auto_16286 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_16338 - SURFACE
      ?auto_16339 - SURFACE
      ?auto_16340 - SURFACE
      ?auto_16341 - SURFACE
      ?auto_16342 - SURFACE
      ?auto_16343 - SURFACE
      ?auto_16344 - SURFACE
      ?auto_16345 - SURFACE
      ?auto_16346 - SURFACE
      ?auto_16347 - SURFACE
      ?auto_16348 - SURFACE
      ?auto_16349 - SURFACE
      ?auto_16350 - SURFACE
      ?auto_16351 - SURFACE
    )
    :vars
    (
      ?auto_16353 - HOIST
      ?auto_16357 - PLACE
      ?auto_16352 - PLACE
      ?auto_16354 - HOIST
      ?auto_16356 - SURFACE
      ?auto_16377 - PLACE
      ?auto_16374 - HOIST
      ?auto_16369 - SURFACE
      ?auto_16366 - PLACE
      ?auto_16379 - HOIST
      ?auto_16370 - SURFACE
      ?auto_16359 - PLACE
      ?auto_16376 - HOIST
      ?auto_16373 - SURFACE
      ?auto_16364 - SURFACE
      ?auto_16375 - PLACE
      ?auto_16372 - HOIST
      ?auto_16378 - SURFACE
      ?auto_16371 - PLACE
      ?auto_16360 - HOIST
      ?auto_16361 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16363 - SURFACE
      ?auto_16368 - SURFACE
      ?auto_16365 - SURFACE
      ?auto_16362 - SURFACE
      ?auto_16367 - SURFACE
      ?auto_16355 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16353 ?auto_16357 ) ( IS-CRATE ?auto_16351 ) ( not ( = ?auto_16352 ?auto_16357 ) ) ( HOIST-AT ?auto_16354 ?auto_16352 ) ( SURFACE-AT ?auto_16351 ?auto_16352 ) ( ON ?auto_16351 ?auto_16356 ) ( CLEAR ?auto_16351 ) ( not ( = ?auto_16350 ?auto_16351 ) ) ( not ( = ?auto_16350 ?auto_16356 ) ) ( not ( = ?auto_16351 ?auto_16356 ) ) ( not ( = ?auto_16353 ?auto_16354 ) ) ( IS-CRATE ?auto_16350 ) ( not ( = ?auto_16377 ?auto_16357 ) ) ( HOIST-AT ?auto_16374 ?auto_16377 ) ( SURFACE-AT ?auto_16350 ?auto_16377 ) ( ON ?auto_16350 ?auto_16369 ) ( CLEAR ?auto_16350 ) ( not ( = ?auto_16349 ?auto_16350 ) ) ( not ( = ?auto_16349 ?auto_16369 ) ) ( not ( = ?auto_16350 ?auto_16369 ) ) ( not ( = ?auto_16353 ?auto_16374 ) ) ( IS-CRATE ?auto_16349 ) ( not ( = ?auto_16366 ?auto_16357 ) ) ( HOIST-AT ?auto_16379 ?auto_16366 ) ( AVAILABLE ?auto_16379 ) ( SURFACE-AT ?auto_16349 ?auto_16366 ) ( ON ?auto_16349 ?auto_16370 ) ( CLEAR ?auto_16349 ) ( not ( = ?auto_16348 ?auto_16349 ) ) ( not ( = ?auto_16348 ?auto_16370 ) ) ( not ( = ?auto_16349 ?auto_16370 ) ) ( not ( = ?auto_16353 ?auto_16379 ) ) ( IS-CRATE ?auto_16348 ) ( not ( = ?auto_16359 ?auto_16357 ) ) ( HOIST-AT ?auto_16376 ?auto_16359 ) ( SURFACE-AT ?auto_16348 ?auto_16359 ) ( ON ?auto_16348 ?auto_16373 ) ( CLEAR ?auto_16348 ) ( not ( = ?auto_16347 ?auto_16348 ) ) ( not ( = ?auto_16347 ?auto_16373 ) ) ( not ( = ?auto_16348 ?auto_16373 ) ) ( not ( = ?auto_16353 ?auto_16376 ) ) ( IS-CRATE ?auto_16347 ) ( SURFACE-AT ?auto_16347 ?auto_16377 ) ( ON ?auto_16347 ?auto_16364 ) ( CLEAR ?auto_16347 ) ( not ( = ?auto_16346 ?auto_16347 ) ) ( not ( = ?auto_16346 ?auto_16364 ) ) ( not ( = ?auto_16347 ?auto_16364 ) ) ( IS-CRATE ?auto_16346 ) ( not ( = ?auto_16375 ?auto_16357 ) ) ( HOIST-AT ?auto_16372 ?auto_16375 ) ( SURFACE-AT ?auto_16346 ?auto_16375 ) ( ON ?auto_16346 ?auto_16378 ) ( CLEAR ?auto_16346 ) ( not ( = ?auto_16345 ?auto_16346 ) ) ( not ( = ?auto_16345 ?auto_16378 ) ) ( not ( = ?auto_16346 ?auto_16378 ) ) ( not ( = ?auto_16353 ?auto_16372 ) ) ( IS-CRATE ?auto_16345 ) ( not ( = ?auto_16371 ?auto_16357 ) ) ( HOIST-AT ?auto_16360 ?auto_16371 ) ( AVAILABLE ?auto_16360 ) ( SURFACE-AT ?auto_16345 ?auto_16371 ) ( ON ?auto_16345 ?auto_16361 ) ( CLEAR ?auto_16345 ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16361 ) ) ( not ( = ?auto_16345 ?auto_16361 ) ) ( not ( = ?auto_16353 ?auto_16360 ) ) ( IS-CRATE ?auto_16344 ) ( AVAILABLE ?auto_16376 ) ( SURFACE-AT ?auto_16344 ?auto_16359 ) ( ON ?auto_16344 ?auto_16358 ) ( CLEAR ?auto_16344 ) ( not ( = ?auto_16343 ?auto_16344 ) ) ( not ( = ?auto_16343 ?auto_16358 ) ) ( not ( = ?auto_16344 ?auto_16358 ) ) ( IS-CRATE ?auto_16343 ) ( SURFACE-AT ?auto_16343 ?auto_16375 ) ( ON ?auto_16343 ?auto_16363 ) ( CLEAR ?auto_16343 ) ( not ( = ?auto_16342 ?auto_16343 ) ) ( not ( = ?auto_16342 ?auto_16363 ) ) ( not ( = ?auto_16343 ?auto_16363 ) ) ( IS-CRATE ?auto_16342 ) ( SURFACE-AT ?auto_16342 ?auto_16377 ) ( ON ?auto_16342 ?auto_16368 ) ( CLEAR ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16341 ?auto_16368 ) ) ( not ( = ?auto_16342 ?auto_16368 ) ) ( IS-CRATE ?auto_16341 ) ( AVAILABLE ?auto_16372 ) ( SURFACE-AT ?auto_16341 ?auto_16375 ) ( ON ?auto_16341 ?auto_16365 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16365 ) ) ( not ( = ?auto_16341 ?auto_16365 ) ) ( IS-CRATE ?auto_16340 ) ( AVAILABLE ?auto_16354 ) ( SURFACE-AT ?auto_16340 ?auto_16352 ) ( ON ?auto_16340 ?auto_16362 ) ( CLEAR ?auto_16340 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16339 ?auto_16362 ) ) ( not ( = ?auto_16340 ?auto_16362 ) ) ( SURFACE-AT ?auto_16338 ?auto_16357 ) ( CLEAR ?auto_16338 ) ( IS-CRATE ?auto_16339 ) ( AVAILABLE ?auto_16353 ) ( AVAILABLE ?auto_16374 ) ( SURFACE-AT ?auto_16339 ?auto_16377 ) ( ON ?auto_16339 ?auto_16367 ) ( CLEAR ?auto_16339 ) ( TRUCK-AT ?auto_16355 ?auto_16357 ) ( not ( = ?auto_16338 ?auto_16339 ) ) ( not ( = ?auto_16338 ?auto_16367 ) ) ( not ( = ?auto_16339 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16340 ) ) ( not ( = ?auto_16338 ?auto_16362 ) ) ( not ( = ?auto_16340 ?auto_16367 ) ) ( not ( = ?auto_16352 ?auto_16377 ) ) ( not ( = ?auto_16354 ?auto_16374 ) ) ( not ( = ?auto_16362 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16341 ) ) ( not ( = ?auto_16338 ?auto_16365 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( not ( = ?auto_16339 ?auto_16365 ) ) ( not ( = ?auto_16341 ?auto_16362 ) ) ( not ( = ?auto_16341 ?auto_16367 ) ) ( not ( = ?auto_16375 ?auto_16352 ) ) ( not ( = ?auto_16375 ?auto_16377 ) ) ( not ( = ?auto_16372 ?auto_16354 ) ) ( not ( = ?auto_16372 ?auto_16374 ) ) ( not ( = ?auto_16365 ?auto_16362 ) ) ( not ( = ?auto_16365 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16342 ) ) ( not ( = ?auto_16338 ?auto_16368 ) ) ( not ( = ?auto_16339 ?auto_16342 ) ) ( not ( = ?auto_16339 ?auto_16368 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16368 ) ) ( not ( = ?auto_16342 ?auto_16365 ) ) ( not ( = ?auto_16342 ?auto_16362 ) ) ( not ( = ?auto_16342 ?auto_16367 ) ) ( not ( = ?auto_16368 ?auto_16365 ) ) ( not ( = ?auto_16368 ?auto_16362 ) ) ( not ( = ?auto_16368 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16343 ) ) ( not ( = ?auto_16338 ?auto_16363 ) ) ( not ( = ?auto_16339 ?auto_16343 ) ) ( not ( = ?auto_16339 ?auto_16363 ) ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16340 ?auto_16363 ) ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16363 ) ) ( not ( = ?auto_16343 ?auto_16368 ) ) ( not ( = ?auto_16343 ?auto_16365 ) ) ( not ( = ?auto_16343 ?auto_16362 ) ) ( not ( = ?auto_16343 ?auto_16367 ) ) ( not ( = ?auto_16363 ?auto_16368 ) ) ( not ( = ?auto_16363 ?auto_16365 ) ) ( not ( = ?auto_16363 ?auto_16362 ) ) ( not ( = ?auto_16363 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16344 ) ) ( not ( = ?auto_16338 ?auto_16358 ) ) ( not ( = ?auto_16339 ?auto_16344 ) ) ( not ( = ?auto_16339 ?auto_16358 ) ) ( not ( = ?auto_16340 ?auto_16344 ) ) ( not ( = ?auto_16340 ?auto_16358 ) ) ( not ( = ?auto_16341 ?auto_16344 ) ) ( not ( = ?auto_16341 ?auto_16358 ) ) ( not ( = ?auto_16342 ?auto_16344 ) ) ( not ( = ?auto_16342 ?auto_16358 ) ) ( not ( = ?auto_16344 ?auto_16363 ) ) ( not ( = ?auto_16344 ?auto_16368 ) ) ( not ( = ?auto_16344 ?auto_16365 ) ) ( not ( = ?auto_16344 ?auto_16362 ) ) ( not ( = ?auto_16344 ?auto_16367 ) ) ( not ( = ?auto_16359 ?auto_16375 ) ) ( not ( = ?auto_16359 ?auto_16377 ) ) ( not ( = ?auto_16359 ?auto_16352 ) ) ( not ( = ?auto_16376 ?auto_16372 ) ) ( not ( = ?auto_16376 ?auto_16374 ) ) ( not ( = ?auto_16376 ?auto_16354 ) ) ( not ( = ?auto_16358 ?auto_16363 ) ) ( not ( = ?auto_16358 ?auto_16368 ) ) ( not ( = ?auto_16358 ?auto_16365 ) ) ( not ( = ?auto_16358 ?auto_16362 ) ) ( not ( = ?auto_16358 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16345 ) ) ( not ( = ?auto_16338 ?auto_16361 ) ) ( not ( = ?auto_16339 ?auto_16345 ) ) ( not ( = ?auto_16339 ?auto_16361 ) ) ( not ( = ?auto_16340 ?auto_16345 ) ) ( not ( = ?auto_16340 ?auto_16361 ) ) ( not ( = ?auto_16341 ?auto_16345 ) ) ( not ( = ?auto_16341 ?auto_16361 ) ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( not ( = ?auto_16342 ?auto_16361 ) ) ( not ( = ?auto_16343 ?auto_16345 ) ) ( not ( = ?auto_16343 ?auto_16361 ) ) ( not ( = ?auto_16345 ?auto_16358 ) ) ( not ( = ?auto_16345 ?auto_16363 ) ) ( not ( = ?auto_16345 ?auto_16368 ) ) ( not ( = ?auto_16345 ?auto_16365 ) ) ( not ( = ?auto_16345 ?auto_16362 ) ) ( not ( = ?auto_16345 ?auto_16367 ) ) ( not ( = ?auto_16371 ?auto_16359 ) ) ( not ( = ?auto_16371 ?auto_16375 ) ) ( not ( = ?auto_16371 ?auto_16377 ) ) ( not ( = ?auto_16371 ?auto_16352 ) ) ( not ( = ?auto_16360 ?auto_16376 ) ) ( not ( = ?auto_16360 ?auto_16372 ) ) ( not ( = ?auto_16360 ?auto_16374 ) ) ( not ( = ?auto_16360 ?auto_16354 ) ) ( not ( = ?auto_16361 ?auto_16358 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16368 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16346 ) ) ( not ( = ?auto_16338 ?auto_16378 ) ) ( not ( = ?auto_16339 ?auto_16346 ) ) ( not ( = ?auto_16339 ?auto_16378 ) ) ( not ( = ?auto_16340 ?auto_16346 ) ) ( not ( = ?auto_16340 ?auto_16378 ) ) ( not ( = ?auto_16341 ?auto_16346 ) ) ( not ( = ?auto_16341 ?auto_16378 ) ) ( not ( = ?auto_16342 ?auto_16346 ) ) ( not ( = ?auto_16342 ?auto_16378 ) ) ( not ( = ?auto_16343 ?auto_16346 ) ) ( not ( = ?auto_16343 ?auto_16378 ) ) ( not ( = ?auto_16344 ?auto_16346 ) ) ( not ( = ?auto_16344 ?auto_16378 ) ) ( not ( = ?auto_16346 ?auto_16361 ) ) ( not ( = ?auto_16346 ?auto_16358 ) ) ( not ( = ?auto_16346 ?auto_16363 ) ) ( not ( = ?auto_16346 ?auto_16368 ) ) ( not ( = ?auto_16346 ?auto_16365 ) ) ( not ( = ?auto_16346 ?auto_16362 ) ) ( not ( = ?auto_16346 ?auto_16367 ) ) ( not ( = ?auto_16378 ?auto_16361 ) ) ( not ( = ?auto_16378 ?auto_16358 ) ) ( not ( = ?auto_16378 ?auto_16363 ) ) ( not ( = ?auto_16378 ?auto_16368 ) ) ( not ( = ?auto_16378 ?auto_16365 ) ) ( not ( = ?auto_16378 ?auto_16362 ) ) ( not ( = ?auto_16378 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16347 ) ) ( not ( = ?auto_16338 ?auto_16364 ) ) ( not ( = ?auto_16339 ?auto_16347 ) ) ( not ( = ?auto_16339 ?auto_16364 ) ) ( not ( = ?auto_16340 ?auto_16347 ) ) ( not ( = ?auto_16340 ?auto_16364 ) ) ( not ( = ?auto_16341 ?auto_16347 ) ) ( not ( = ?auto_16341 ?auto_16364 ) ) ( not ( = ?auto_16342 ?auto_16347 ) ) ( not ( = ?auto_16342 ?auto_16364 ) ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16343 ?auto_16364 ) ) ( not ( = ?auto_16344 ?auto_16347 ) ) ( not ( = ?auto_16344 ?auto_16364 ) ) ( not ( = ?auto_16345 ?auto_16347 ) ) ( not ( = ?auto_16345 ?auto_16364 ) ) ( not ( = ?auto_16347 ?auto_16378 ) ) ( not ( = ?auto_16347 ?auto_16361 ) ) ( not ( = ?auto_16347 ?auto_16358 ) ) ( not ( = ?auto_16347 ?auto_16363 ) ) ( not ( = ?auto_16347 ?auto_16368 ) ) ( not ( = ?auto_16347 ?auto_16365 ) ) ( not ( = ?auto_16347 ?auto_16362 ) ) ( not ( = ?auto_16347 ?auto_16367 ) ) ( not ( = ?auto_16364 ?auto_16378 ) ) ( not ( = ?auto_16364 ?auto_16361 ) ) ( not ( = ?auto_16364 ?auto_16358 ) ) ( not ( = ?auto_16364 ?auto_16363 ) ) ( not ( = ?auto_16364 ?auto_16368 ) ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16362 ) ) ( not ( = ?auto_16364 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16348 ) ) ( not ( = ?auto_16338 ?auto_16373 ) ) ( not ( = ?auto_16339 ?auto_16348 ) ) ( not ( = ?auto_16339 ?auto_16373 ) ) ( not ( = ?auto_16340 ?auto_16348 ) ) ( not ( = ?auto_16340 ?auto_16373 ) ) ( not ( = ?auto_16341 ?auto_16348 ) ) ( not ( = ?auto_16341 ?auto_16373 ) ) ( not ( = ?auto_16342 ?auto_16348 ) ) ( not ( = ?auto_16342 ?auto_16373 ) ) ( not ( = ?auto_16343 ?auto_16348 ) ) ( not ( = ?auto_16343 ?auto_16373 ) ) ( not ( = ?auto_16344 ?auto_16348 ) ) ( not ( = ?auto_16344 ?auto_16373 ) ) ( not ( = ?auto_16345 ?auto_16348 ) ) ( not ( = ?auto_16345 ?auto_16373 ) ) ( not ( = ?auto_16346 ?auto_16348 ) ) ( not ( = ?auto_16346 ?auto_16373 ) ) ( not ( = ?auto_16348 ?auto_16364 ) ) ( not ( = ?auto_16348 ?auto_16378 ) ) ( not ( = ?auto_16348 ?auto_16361 ) ) ( not ( = ?auto_16348 ?auto_16358 ) ) ( not ( = ?auto_16348 ?auto_16363 ) ) ( not ( = ?auto_16348 ?auto_16368 ) ) ( not ( = ?auto_16348 ?auto_16365 ) ) ( not ( = ?auto_16348 ?auto_16362 ) ) ( not ( = ?auto_16348 ?auto_16367 ) ) ( not ( = ?auto_16373 ?auto_16364 ) ) ( not ( = ?auto_16373 ?auto_16378 ) ) ( not ( = ?auto_16373 ?auto_16361 ) ) ( not ( = ?auto_16373 ?auto_16358 ) ) ( not ( = ?auto_16373 ?auto_16363 ) ) ( not ( = ?auto_16373 ?auto_16368 ) ) ( not ( = ?auto_16373 ?auto_16365 ) ) ( not ( = ?auto_16373 ?auto_16362 ) ) ( not ( = ?auto_16373 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16349 ) ) ( not ( = ?auto_16338 ?auto_16370 ) ) ( not ( = ?auto_16339 ?auto_16349 ) ) ( not ( = ?auto_16339 ?auto_16370 ) ) ( not ( = ?auto_16340 ?auto_16349 ) ) ( not ( = ?auto_16340 ?auto_16370 ) ) ( not ( = ?auto_16341 ?auto_16349 ) ) ( not ( = ?auto_16341 ?auto_16370 ) ) ( not ( = ?auto_16342 ?auto_16349 ) ) ( not ( = ?auto_16342 ?auto_16370 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16370 ) ) ( not ( = ?auto_16344 ?auto_16349 ) ) ( not ( = ?auto_16344 ?auto_16370 ) ) ( not ( = ?auto_16345 ?auto_16349 ) ) ( not ( = ?auto_16345 ?auto_16370 ) ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( not ( = ?auto_16346 ?auto_16370 ) ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( not ( = ?auto_16347 ?auto_16370 ) ) ( not ( = ?auto_16349 ?auto_16373 ) ) ( not ( = ?auto_16349 ?auto_16364 ) ) ( not ( = ?auto_16349 ?auto_16378 ) ) ( not ( = ?auto_16349 ?auto_16361 ) ) ( not ( = ?auto_16349 ?auto_16358 ) ) ( not ( = ?auto_16349 ?auto_16363 ) ) ( not ( = ?auto_16349 ?auto_16368 ) ) ( not ( = ?auto_16349 ?auto_16365 ) ) ( not ( = ?auto_16349 ?auto_16362 ) ) ( not ( = ?auto_16349 ?auto_16367 ) ) ( not ( = ?auto_16366 ?auto_16359 ) ) ( not ( = ?auto_16366 ?auto_16377 ) ) ( not ( = ?auto_16366 ?auto_16375 ) ) ( not ( = ?auto_16366 ?auto_16371 ) ) ( not ( = ?auto_16366 ?auto_16352 ) ) ( not ( = ?auto_16379 ?auto_16376 ) ) ( not ( = ?auto_16379 ?auto_16374 ) ) ( not ( = ?auto_16379 ?auto_16372 ) ) ( not ( = ?auto_16379 ?auto_16360 ) ) ( not ( = ?auto_16379 ?auto_16354 ) ) ( not ( = ?auto_16370 ?auto_16373 ) ) ( not ( = ?auto_16370 ?auto_16364 ) ) ( not ( = ?auto_16370 ?auto_16378 ) ) ( not ( = ?auto_16370 ?auto_16361 ) ) ( not ( = ?auto_16370 ?auto_16358 ) ) ( not ( = ?auto_16370 ?auto_16363 ) ) ( not ( = ?auto_16370 ?auto_16368 ) ) ( not ( = ?auto_16370 ?auto_16365 ) ) ( not ( = ?auto_16370 ?auto_16362 ) ) ( not ( = ?auto_16370 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16350 ) ) ( not ( = ?auto_16338 ?auto_16369 ) ) ( not ( = ?auto_16339 ?auto_16350 ) ) ( not ( = ?auto_16339 ?auto_16369 ) ) ( not ( = ?auto_16340 ?auto_16350 ) ) ( not ( = ?auto_16340 ?auto_16369 ) ) ( not ( = ?auto_16341 ?auto_16350 ) ) ( not ( = ?auto_16341 ?auto_16369 ) ) ( not ( = ?auto_16342 ?auto_16350 ) ) ( not ( = ?auto_16342 ?auto_16369 ) ) ( not ( = ?auto_16343 ?auto_16350 ) ) ( not ( = ?auto_16343 ?auto_16369 ) ) ( not ( = ?auto_16344 ?auto_16350 ) ) ( not ( = ?auto_16344 ?auto_16369 ) ) ( not ( = ?auto_16345 ?auto_16350 ) ) ( not ( = ?auto_16345 ?auto_16369 ) ) ( not ( = ?auto_16346 ?auto_16350 ) ) ( not ( = ?auto_16346 ?auto_16369 ) ) ( not ( = ?auto_16347 ?auto_16350 ) ) ( not ( = ?auto_16347 ?auto_16369 ) ) ( not ( = ?auto_16348 ?auto_16350 ) ) ( not ( = ?auto_16348 ?auto_16369 ) ) ( not ( = ?auto_16350 ?auto_16370 ) ) ( not ( = ?auto_16350 ?auto_16373 ) ) ( not ( = ?auto_16350 ?auto_16364 ) ) ( not ( = ?auto_16350 ?auto_16378 ) ) ( not ( = ?auto_16350 ?auto_16361 ) ) ( not ( = ?auto_16350 ?auto_16358 ) ) ( not ( = ?auto_16350 ?auto_16363 ) ) ( not ( = ?auto_16350 ?auto_16368 ) ) ( not ( = ?auto_16350 ?auto_16365 ) ) ( not ( = ?auto_16350 ?auto_16362 ) ) ( not ( = ?auto_16350 ?auto_16367 ) ) ( not ( = ?auto_16369 ?auto_16370 ) ) ( not ( = ?auto_16369 ?auto_16373 ) ) ( not ( = ?auto_16369 ?auto_16364 ) ) ( not ( = ?auto_16369 ?auto_16378 ) ) ( not ( = ?auto_16369 ?auto_16361 ) ) ( not ( = ?auto_16369 ?auto_16358 ) ) ( not ( = ?auto_16369 ?auto_16363 ) ) ( not ( = ?auto_16369 ?auto_16368 ) ) ( not ( = ?auto_16369 ?auto_16365 ) ) ( not ( = ?auto_16369 ?auto_16362 ) ) ( not ( = ?auto_16369 ?auto_16367 ) ) ( not ( = ?auto_16338 ?auto_16351 ) ) ( not ( = ?auto_16338 ?auto_16356 ) ) ( not ( = ?auto_16339 ?auto_16351 ) ) ( not ( = ?auto_16339 ?auto_16356 ) ) ( not ( = ?auto_16340 ?auto_16351 ) ) ( not ( = ?auto_16340 ?auto_16356 ) ) ( not ( = ?auto_16341 ?auto_16351 ) ) ( not ( = ?auto_16341 ?auto_16356 ) ) ( not ( = ?auto_16342 ?auto_16351 ) ) ( not ( = ?auto_16342 ?auto_16356 ) ) ( not ( = ?auto_16343 ?auto_16351 ) ) ( not ( = ?auto_16343 ?auto_16356 ) ) ( not ( = ?auto_16344 ?auto_16351 ) ) ( not ( = ?auto_16344 ?auto_16356 ) ) ( not ( = ?auto_16345 ?auto_16351 ) ) ( not ( = ?auto_16345 ?auto_16356 ) ) ( not ( = ?auto_16346 ?auto_16351 ) ) ( not ( = ?auto_16346 ?auto_16356 ) ) ( not ( = ?auto_16347 ?auto_16351 ) ) ( not ( = ?auto_16347 ?auto_16356 ) ) ( not ( = ?auto_16348 ?auto_16351 ) ) ( not ( = ?auto_16348 ?auto_16356 ) ) ( not ( = ?auto_16349 ?auto_16351 ) ) ( not ( = ?auto_16349 ?auto_16356 ) ) ( not ( = ?auto_16351 ?auto_16369 ) ) ( not ( = ?auto_16351 ?auto_16370 ) ) ( not ( = ?auto_16351 ?auto_16373 ) ) ( not ( = ?auto_16351 ?auto_16364 ) ) ( not ( = ?auto_16351 ?auto_16378 ) ) ( not ( = ?auto_16351 ?auto_16361 ) ) ( not ( = ?auto_16351 ?auto_16358 ) ) ( not ( = ?auto_16351 ?auto_16363 ) ) ( not ( = ?auto_16351 ?auto_16368 ) ) ( not ( = ?auto_16351 ?auto_16365 ) ) ( not ( = ?auto_16351 ?auto_16362 ) ) ( not ( = ?auto_16351 ?auto_16367 ) ) ( not ( = ?auto_16356 ?auto_16369 ) ) ( not ( = ?auto_16356 ?auto_16370 ) ) ( not ( = ?auto_16356 ?auto_16373 ) ) ( not ( = ?auto_16356 ?auto_16364 ) ) ( not ( = ?auto_16356 ?auto_16378 ) ) ( not ( = ?auto_16356 ?auto_16361 ) ) ( not ( = ?auto_16356 ?auto_16358 ) ) ( not ( = ?auto_16356 ?auto_16363 ) ) ( not ( = ?auto_16356 ?auto_16368 ) ) ( not ( = ?auto_16356 ?auto_16365 ) ) ( not ( = ?auto_16356 ?auto_16362 ) ) ( not ( = ?auto_16356 ?auto_16367 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16338 ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16342 ?auto_16343 ?auto_16344 ?auto_16345 ?auto_16346 ?auto_16347 ?auto_16348 ?auto_16349 ?auto_16350 )
      ( MAKE-1CRATE ?auto_16350 ?auto_16351 )
      ( MAKE-13CRATE-VERIFY ?auto_16338 ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16342 ?auto_16343 ?auto_16344 ?auto_16345 ?auto_16346 ?auto_16347 ?auto_16348 ?auto_16349 ?auto_16350 ?auto_16351 ) )
  )

)

