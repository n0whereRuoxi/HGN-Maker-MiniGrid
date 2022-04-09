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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15826 - SURFACE
      ?auto_15827 - SURFACE
    )
    :vars
    (
      ?auto_15828 - HOIST
      ?auto_15829 - PLACE
      ?auto_15831 - PLACE
      ?auto_15832 - HOIST
      ?auto_15833 - SURFACE
      ?auto_15830 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15828 ?auto_15829 ) ( SURFACE-AT ?auto_15826 ?auto_15829 ) ( CLEAR ?auto_15826 ) ( IS-CRATE ?auto_15827 ) ( AVAILABLE ?auto_15828 ) ( not ( = ?auto_15831 ?auto_15829 ) ) ( HOIST-AT ?auto_15832 ?auto_15831 ) ( AVAILABLE ?auto_15832 ) ( SURFACE-AT ?auto_15827 ?auto_15831 ) ( ON ?auto_15827 ?auto_15833 ) ( CLEAR ?auto_15827 ) ( TRUCK-AT ?auto_15830 ?auto_15829 ) ( not ( = ?auto_15826 ?auto_15827 ) ) ( not ( = ?auto_15826 ?auto_15833 ) ) ( not ( = ?auto_15827 ?auto_15833 ) ) ( not ( = ?auto_15828 ?auto_15832 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15830 ?auto_15829 ?auto_15831 )
      ( !LIFT ?auto_15832 ?auto_15827 ?auto_15833 ?auto_15831 )
      ( !LOAD ?auto_15832 ?auto_15827 ?auto_15830 ?auto_15831 )
      ( !DRIVE ?auto_15830 ?auto_15831 ?auto_15829 )
      ( !UNLOAD ?auto_15828 ?auto_15827 ?auto_15830 ?auto_15829 )
      ( !DROP ?auto_15828 ?auto_15827 ?auto_15826 ?auto_15829 )
      ( MAKE-1CRATE-VERIFY ?auto_15826 ?auto_15827 ) )
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
      ?auto_15844 - PLACE
      ?auto_15841 - PLACE
      ?auto_15843 - HOIST
      ?auto_15845 - SURFACE
      ?auto_15847 - PLACE
      ?auto_15848 - HOIST
      ?auto_15846 - SURFACE
      ?auto_15840 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15842 ?auto_15844 ) ( IS-CRATE ?auto_15839 ) ( not ( = ?auto_15841 ?auto_15844 ) ) ( HOIST-AT ?auto_15843 ?auto_15841 ) ( AVAILABLE ?auto_15843 ) ( SURFACE-AT ?auto_15839 ?auto_15841 ) ( ON ?auto_15839 ?auto_15845 ) ( CLEAR ?auto_15839 ) ( not ( = ?auto_15838 ?auto_15839 ) ) ( not ( = ?auto_15838 ?auto_15845 ) ) ( not ( = ?auto_15839 ?auto_15845 ) ) ( not ( = ?auto_15842 ?auto_15843 ) ) ( SURFACE-AT ?auto_15837 ?auto_15844 ) ( CLEAR ?auto_15837 ) ( IS-CRATE ?auto_15838 ) ( AVAILABLE ?auto_15842 ) ( not ( = ?auto_15847 ?auto_15844 ) ) ( HOIST-AT ?auto_15848 ?auto_15847 ) ( AVAILABLE ?auto_15848 ) ( SURFACE-AT ?auto_15838 ?auto_15847 ) ( ON ?auto_15838 ?auto_15846 ) ( CLEAR ?auto_15838 ) ( TRUCK-AT ?auto_15840 ?auto_15844 ) ( not ( = ?auto_15837 ?auto_15838 ) ) ( not ( = ?auto_15837 ?auto_15846 ) ) ( not ( = ?auto_15838 ?auto_15846 ) ) ( not ( = ?auto_15842 ?auto_15848 ) ) ( not ( = ?auto_15837 ?auto_15839 ) ) ( not ( = ?auto_15837 ?auto_15845 ) ) ( not ( = ?auto_15839 ?auto_15846 ) ) ( not ( = ?auto_15841 ?auto_15847 ) ) ( not ( = ?auto_15843 ?auto_15848 ) ) ( not ( = ?auto_15845 ?auto_15846 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_15837 ?auto_15838 )
      ( MAKE-1CRATE ?auto_15838 ?auto_15839 )
      ( MAKE-2CRATE-VERIFY ?auto_15837 ?auto_15838 ?auto_15839 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15851 - SURFACE
      ?auto_15852 - SURFACE
    )
    :vars
    (
      ?auto_15853 - HOIST
      ?auto_15854 - PLACE
      ?auto_15856 - PLACE
      ?auto_15857 - HOIST
      ?auto_15858 - SURFACE
      ?auto_15855 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15853 ?auto_15854 ) ( SURFACE-AT ?auto_15851 ?auto_15854 ) ( CLEAR ?auto_15851 ) ( IS-CRATE ?auto_15852 ) ( AVAILABLE ?auto_15853 ) ( not ( = ?auto_15856 ?auto_15854 ) ) ( HOIST-AT ?auto_15857 ?auto_15856 ) ( AVAILABLE ?auto_15857 ) ( SURFACE-AT ?auto_15852 ?auto_15856 ) ( ON ?auto_15852 ?auto_15858 ) ( CLEAR ?auto_15852 ) ( TRUCK-AT ?auto_15855 ?auto_15854 ) ( not ( = ?auto_15851 ?auto_15852 ) ) ( not ( = ?auto_15851 ?auto_15858 ) ) ( not ( = ?auto_15852 ?auto_15858 ) ) ( not ( = ?auto_15853 ?auto_15857 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15855 ?auto_15854 ?auto_15856 )
      ( !LIFT ?auto_15857 ?auto_15852 ?auto_15858 ?auto_15856 )
      ( !LOAD ?auto_15857 ?auto_15852 ?auto_15855 ?auto_15856 )
      ( !DRIVE ?auto_15855 ?auto_15856 ?auto_15854 )
      ( !UNLOAD ?auto_15853 ?auto_15852 ?auto_15855 ?auto_15854 )
      ( !DROP ?auto_15853 ?auto_15852 ?auto_15851 ?auto_15854 )
      ( MAKE-1CRATE-VERIFY ?auto_15851 ?auto_15852 ) )
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
      ?auto_15869 - HOIST
      ?auto_15872 - PLACE
      ?auto_15868 - PLACE
      ?auto_15870 - HOIST
      ?auto_15867 - SURFACE
      ?auto_15876 - PLACE
      ?auto_15877 - HOIST
      ?auto_15874 - SURFACE
      ?auto_15875 - PLACE
      ?auto_15878 - HOIST
      ?auto_15873 - SURFACE
      ?auto_15871 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15869 ?auto_15872 ) ( IS-CRATE ?auto_15866 ) ( not ( = ?auto_15868 ?auto_15872 ) ) ( HOIST-AT ?auto_15870 ?auto_15868 ) ( AVAILABLE ?auto_15870 ) ( SURFACE-AT ?auto_15866 ?auto_15868 ) ( ON ?auto_15866 ?auto_15867 ) ( CLEAR ?auto_15866 ) ( not ( = ?auto_15865 ?auto_15866 ) ) ( not ( = ?auto_15865 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15867 ) ) ( not ( = ?auto_15869 ?auto_15870 ) ) ( IS-CRATE ?auto_15865 ) ( not ( = ?auto_15876 ?auto_15872 ) ) ( HOIST-AT ?auto_15877 ?auto_15876 ) ( AVAILABLE ?auto_15877 ) ( SURFACE-AT ?auto_15865 ?auto_15876 ) ( ON ?auto_15865 ?auto_15874 ) ( CLEAR ?auto_15865 ) ( not ( = ?auto_15864 ?auto_15865 ) ) ( not ( = ?auto_15864 ?auto_15874 ) ) ( not ( = ?auto_15865 ?auto_15874 ) ) ( not ( = ?auto_15869 ?auto_15877 ) ) ( SURFACE-AT ?auto_15863 ?auto_15872 ) ( CLEAR ?auto_15863 ) ( IS-CRATE ?auto_15864 ) ( AVAILABLE ?auto_15869 ) ( not ( = ?auto_15875 ?auto_15872 ) ) ( HOIST-AT ?auto_15878 ?auto_15875 ) ( AVAILABLE ?auto_15878 ) ( SURFACE-AT ?auto_15864 ?auto_15875 ) ( ON ?auto_15864 ?auto_15873 ) ( CLEAR ?auto_15864 ) ( TRUCK-AT ?auto_15871 ?auto_15872 ) ( not ( = ?auto_15863 ?auto_15864 ) ) ( not ( = ?auto_15863 ?auto_15873 ) ) ( not ( = ?auto_15864 ?auto_15873 ) ) ( not ( = ?auto_15869 ?auto_15878 ) ) ( not ( = ?auto_15863 ?auto_15865 ) ) ( not ( = ?auto_15863 ?auto_15874 ) ) ( not ( = ?auto_15865 ?auto_15873 ) ) ( not ( = ?auto_15876 ?auto_15875 ) ) ( not ( = ?auto_15877 ?auto_15878 ) ) ( not ( = ?auto_15874 ?auto_15873 ) ) ( not ( = ?auto_15863 ?auto_15866 ) ) ( not ( = ?auto_15863 ?auto_15867 ) ) ( not ( = ?auto_15864 ?auto_15866 ) ) ( not ( = ?auto_15864 ?auto_15867 ) ) ( not ( = ?auto_15866 ?auto_15874 ) ) ( not ( = ?auto_15866 ?auto_15873 ) ) ( not ( = ?auto_15868 ?auto_15876 ) ) ( not ( = ?auto_15868 ?auto_15875 ) ) ( not ( = ?auto_15870 ?auto_15877 ) ) ( not ( = ?auto_15870 ?auto_15878 ) ) ( not ( = ?auto_15867 ?auto_15874 ) ) ( not ( = ?auto_15867 ?auto_15873 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_15863 ?auto_15864 ?auto_15865 )
      ( MAKE-1CRATE ?auto_15865 ?auto_15866 )
      ( MAKE-3CRATE-VERIFY ?auto_15863 ?auto_15864 ?auto_15865 ?auto_15866 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15881 - SURFACE
      ?auto_15882 - SURFACE
    )
    :vars
    (
      ?auto_15883 - HOIST
      ?auto_15884 - PLACE
      ?auto_15886 - PLACE
      ?auto_15887 - HOIST
      ?auto_15888 - SURFACE
      ?auto_15885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15883 ?auto_15884 ) ( SURFACE-AT ?auto_15881 ?auto_15884 ) ( CLEAR ?auto_15881 ) ( IS-CRATE ?auto_15882 ) ( AVAILABLE ?auto_15883 ) ( not ( = ?auto_15886 ?auto_15884 ) ) ( HOIST-AT ?auto_15887 ?auto_15886 ) ( AVAILABLE ?auto_15887 ) ( SURFACE-AT ?auto_15882 ?auto_15886 ) ( ON ?auto_15882 ?auto_15888 ) ( CLEAR ?auto_15882 ) ( TRUCK-AT ?auto_15885 ?auto_15884 ) ( not ( = ?auto_15881 ?auto_15882 ) ) ( not ( = ?auto_15881 ?auto_15888 ) ) ( not ( = ?auto_15882 ?auto_15888 ) ) ( not ( = ?auto_15883 ?auto_15887 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15885 ?auto_15884 ?auto_15886 )
      ( !LIFT ?auto_15887 ?auto_15882 ?auto_15888 ?auto_15886 )
      ( !LOAD ?auto_15887 ?auto_15882 ?auto_15885 ?auto_15886 )
      ( !DRIVE ?auto_15885 ?auto_15886 ?auto_15884 )
      ( !UNLOAD ?auto_15883 ?auto_15882 ?auto_15885 ?auto_15884 )
      ( !DROP ?auto_15883 ?auto_15882 ?auto_15881 ?auto_15884 )
      ( MAKE-1CRATE-VERIFY ?auto_15881 ?auto_15882 ) )
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
      ?auto_15901 - HOIST
      ?auto_15899 - PLACE
      ?auto_15904 - PLACE
      ?auto_15902 - HOIST
      ?auto_15900 - SURFACE
      ?auto_15906 - PLACE
      ?auto_15910 - HOIST
      ?auto_15908 - SURFACE
      ?auto_15909 - PLACE
      ?auto_15907 - HOIST
      ?auto_15911 - SURFACE
      ?auto_15905 - SURFACE
      ?auto_15903 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15901 ?auto_15899 ) ( IS-CRATE ?auto_15898 ) ( not ( = ?auto_15904 ?auto_15899 ) ) ( HOIST-AT ?auto_15902 ?auto_15904 ) ( SURFACE-AT ?auto_15898 ?auto_15904 ) ( ON ?auto_15898 ?auto_15900 ) ( CLEAR ?auto_15898 ) ( not ( = ?auto_15897 ?auto_15898 ) ) ( not ( = ?auto_15897 ?auto_15900 ) ) ( not ( = ?auto_15898 ?auto_15900 ) ) ( not ( = ?auto_15901 ?auto_15902 ) ) ( IS-CRATE ?auto_15897 ) ( not ( = ?auto_15906 ?auto_15899 ) ) ( HOIST-AT ?auto_15910 ?auto_15906 ) ( AVAILABLE ?auto_15910 ) ( SURFACE-AT ?auto_15897 ?auto_15906 ) ( ON ?auto_15897 ?auto_15908 ) ( CLEAR ?auto_15897 ) ( not ( = ?auto_15896 ?auto_15897 ) ) ( not ( = ?auto_15896 ?auto_15908 ) ) ( not ( = ?auto_15897 ?auto_15908 ) ) ( not ( = ?auto_15901 ?auto_15910 ) ) ( IS-CRATE ?auto_15896 ) ( not ( = ?auto_15909 ?auto_15899 ) ) ( HOIST-AT ?auto_15907 ?auto_15909 ) ( AVAILABLE ?auto_15907 ) ( SURFACE-AT ?auto_15896 ?auto_15909 ) ( ON ?auto_15896 ?auto_15911 ) ( CLEAR ?auto_15896 ) ( not ( = ?auto_15895 ?auto_15896 ) ) ( not ( = ?auto_15895 ?auto_15911 ) ) ( not ( = ?auto_15896 ?auto_15911 ) ) ( not ( = ?auto_15901 ?auto_15907 ) ) ( SURFACE-AT ?auto_15894 ?auto_15899 ) ( CLEAR ?auto_15894 ) ( IS-CRATE ?auto_15895 ) ( AVAILABLE ?auto_15901 ) ( AVAILABLE ?auto_15902 ) ( SURFACE-AT ?auto_15895 ?auto_15904 ) ( ON ?auto_15895 ?auto_15905 ) ( CLEAR ?auto_15895 ) ( TRUCK-AT ?auto_15903 ?auto_15899 ) ( not ( = ?auto_15894 ?auto_15895 ) ) ( not ( = ?auto_15894 ?auto_15905 ) ) ( not ( = ?auto_15895 ?auto_15905 ) ) ( not ( = ?auto_15894 ?auto_15896 ) ) ( not ( = ?auto_15894 ?auto_15911 ) ) ( not ( = ?auto_15896 ?auto_15905 ) ) ( not ( = ?auto_15909 ?auto_15904 ) ) ( not ( = ?auto_15907 ?auto_15902 ) ) ( not ( = ?auto_15911 ?auto_15905 ) ) ( not ( = ?auto_15894 ?auto_15897 ) ) ( not ( = ?auto_15894 ?auto_15908 ) ) ( not ( = ?auto_15895 ?auto_15897 ) ) ( not ( = ?auto_15895 ?auto_15908 ) ) ( not ( = ?auto_15897 ?auto_15911 ) ) ( not ( = ?auto_15897 ?auto_15905 ) ) ( not ( = ?auto_15906 ?auto_15909 ) ) ( not ( = ?auto_15906 ?auto_15904 ) ) ( not ( = ?auto_15910 ?auto_15907 ) ) ( not ( = ?auto_15910 ?auto_15902 ) ) ( not ( = ?auto_15908 ?auto_15911 ) ) ( not ( = ?auto_15908 ?auto_15905 ) ) ( not ( = ?auto_15894 ?auto_15898 ) ) ( not ( = ?auto_15894 ?auto_15900 ) ) ( not ( = ?auto_15895 ?auto_15898 ) ) ( not ( = ?auto_15895 ?auto_15900 ) ) ( not ( = ?auto_15896 ?auto_15898 ) ) ( not ( = ?auto_15896 ?auto_15900 ) ) ( not ( = ?auto_15898 ?auto_15908 ) ) ( not ( = ?auto_15898 ?auto_15911 ) ) ( not ( = ?auto_15898 ?auto_15905 ) ) ( not ( = ?auto_15900 ?auto_15908 ) ) ( not ( = ?auto_15900 ?auto_15911 ) ) ( not ( = ?auto_15900 ?auto_15905 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_15894 ?auto_15895 ?auto_15896 ?auto_15897 )
      ( MAKE-1CRATE ?auto_15897 ?auto_15898 )
      ( MAKE-4CRATE-VERIFY ?auto_15894 ?auto_15895 ?auto_15896 ?auto_15897 ?auto_15898 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15914 - SURFACE
      ?auto_15915 - SURFACE
    )
    :vars
    (
      ?auto_15916 - HOIST
      ?auto_15917 - PLACE
      ?auto_15919 - PLACE
      ?auto_15920 - HOIST
      ?auto_15921 - SURFACE
      ?auto_15918 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15916 ?auto_15917 ) ( SURFACE-AT ?auto_15914 ?auto_15917 ) ( CLEAR ?auto_15914 ) ( IS-CRATE ?auto_15915 ) ( AVAILABLE ?auto_15916 ) ( not ( = ?auto_15919 ?auto_15917 ) ) ( HOIST-AT ?auto_15920 ?auto_15919 ) ( AVAILABLE ?auto_15920 ) ( SURFACE-AT ?auto_15915 ?auto_15919 ) ( ON ?auto_15915 ?auto_15921 ) ( CLEAR ?auto_15915 ) ( TRUCK-AT ?auto_15918 ?auto_15917 ) ( not ( = ?auto_15914 ?auto_15915 ) ) ( not ( = ?auto_15914 ?auto_15921 ) ) ( not ( = ?auto_15915 ?auto_15921 ) ) ( not ( = ?auto_15916 ?auto_15920 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15918 ?auto_15917 ?auto_15919 )
      ( !LIFT ?auto_15920 ?auto_15915 ?auto_15921 ?auto_15919 )
      ( !LOAD ?auto_15920 ?auto_15915 ?auto_15918 ?auto_15919 )
      ( !DRIVE ?auto_15918 ?auto_15919 ?auto_15917 )
      ( !UNLOAD ?auto_15916 ?auto_15915 ?auto_15918 ?auto_15917 )
      ( !DROP ?auto_15916 ?auto_15915 ?auto_15914 ?auto_15917 )
      ( MAKE-1CRATE-VERIFY ?auto_15914 ?auto_15915 ) )
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
      ?auto_15938 - HOIST
      ?auto_15937 - PLACE
      ?auto_15934 - PLACE
      ?auto_15935 - HOIST
      ?auto_15936 - SURFACE
      ?auto_15941 - PLACE
      ?auto_15940 - HOIST
      ?auto_15946 - SURFACE
      ?auto_15944 - SURFACE
      ?auto_15945 - PLACE
      ?auto_15942 - HOIST
      ?auto_15947 - SURFACE
      ?auto_15943 - SURFACE
      ?auto_15939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15938 ?auto_15937 ) ( IS-CRATE ?auto_15933 ) ( not ( = ?auto_15934 ?auto_15937 ) ) ( HOIST-AT ?auto_15935 ?auto_15934 ) ( SURFACE-AT ?auto_15933 ?auto_15934 ) ( ON ?auto_15933 ?auto_15936 ) ( CLEAR ?auto_15933 ) ( not ( = ?auto_15932 ?auto_15933 ) ) ( not ( = ?auto_15932 ?auto_15936 ) ) ( not ( = ?auto_15933 ?auto_15936 ) ) ( not ( = ?auto_15938 ?auto_15935 ) ) ( IS-CRATE ?auto_15932 ) ( not ( = ?auto_15941 ?auto_15937 ) ) ( HOIST-AT ?auto_15940 ?auto_15941 ) ( SURFACE-AT ?auto_15932 ?auto_15941 ) ( ON ?auto_15932 ?auto_15946 ) ( CLEAR ?auto_15932 ) ( not ( = ?auto_15931 ?auto_15932 ) ) ( not ( = ?auto_15931 ?auto_15946 ) ) ( not ( = ?auto_15932 ?auto_15946 ) ) ( not ( = ?auto_15938 ?auto_15940 ) ) ( IS-CRATE ?auto_15931 ) ( AVAILABLE ?auto_15935 ) ( SURFACE-AT ?auto_15931 ?auto_15934 ) ( ON ?auto_15931 ?auto_15944 ) ( CLEAR ?auto_15931 ) ( not ( = ?auto_15930 ?auto_15931 ) ) ( not ( = ?auto_15930 ?auto_15944 ) ) ( not ( = ?auto_15931 ?auto_15944 ) ) ( IS-CRATE ?auto_15930 ) ( not ( = ?auto_15945 ?auto_15937 ) ) ( HOIST-AT ?auto_15942 ?auto_15945 ) ( AVAILABLE ?auto_15942 ) ( SURFACE-AT ?auto_15930 ?auto_15945 ) ( ON ?auto_15930 ?auto_15947 ) ( CLEAR ?auto_15930 ) ( not ( = ?auto_15929 ?auto_15930 ) ) ( not ( = ?auto_15929 ?auto_15947 ) ) ( not ( = ?auto_15930 ?auto_15947 ) ) ( not ( = ?auto_15938 ?auto_15942 ) ) ( SURFACE-AT ?auto_15928 ?auto_15937 ) ( CLEAR ?auto_15928 ) ( IS-CRATE ?auto_15929 ) ( AVAILABLE ?auto_15938 ) ( AVAILABLE ?auto_15940 ) ( SURFACE-AT ?auto_15929 ?auto_15941 ) ( ON ?auto_15929 ?auto_15943 ) ( CLEAR ?auto_15929 ) ( TRUCK-AT ?auto_15939 ?auto_15937 ) ( not ( = ?auto_15928 ?auto_15929 ) ) ( not ( = ?auto_15928 ?auto_15943 ) ) ( not ( = ?auto_15929 ?auto_15943 ) ) ( not ( = ?auto_15928 ?auto_15930 ) ) ( not ( = ?auto_15928 ?auto_15947 ) ) ( not ( = ?auto_15930 ?auto_15943 ) ) ( not ( = ?auto_15945 ?auto_15941 ) ) ( not ( = ?auto_15942 ?auto_15940 ) ) ( not ( = ?auto_15947 ?auto_15943 ) ) ( not ( = ?auto_15928 ?auto_15931 ) ) ( not ( = ?auto_15928 ?auto_15944 ) ) ( not ( = ?auto_15929 ?auto_15931 ) ) ( not ( = ?auto_15929 ?auto_15944 ) ) ( not ( = ?auto_15931 ?auto_15947 ) ) ( not ( = ?auto_15931 ?auto_15943 ) ) ( not ( = ?auto_15934 ?auto_15945 ) ) ( not ( = ?auto_15934 ?auto_15941 ) ) ( not ( = ?auto_15935 ?auto_15942 ) ) ( not ( = ?auto_15935 ?auto_15940 ) ) ( not ( = ?auto_15944 ?auto_15947 ) ) ( not ( = ?auto_15944 ?auto_15943 ) ) ( not ( = ?auto_15928 ?auto_15932 ) ) ( not ( = ?auto_15928 ?auto_15946 ) ) ( not ( = ?auto_15929 ?auto_15932 ) ) ( not ( = ?auto_15929 ?auto_15946 ) ) ( not ( = ?auto_15930 ?auto_15932 ) ) ( not ( = ?auto_15930 ?auto_15946 ) ) ( not ( = ?auto_15932 ?auto_15944 ) ) ( not ( = ?auto_15932 ?auto_15947 ) ) ( not ( = ?auto_15932 ?auto_15943 ) ) ( not ( = ?auto_15946 ?auto_15944 ) ) ( not ( = ?auto_15946 ?auto_15947 ) ) ( not ( = ?auto_15946 ?auto_15943 ) ) ( not ( = ?auto_15928 ?auto_15933 ) ) ( not ( = ?auto_15928 ?auto_15936 ) ) ( not ( = ?auto_15929 ?auto_15933 ) ) ( not ( = ?auto_15929 ?auto_15936 ) ) ( not ( = ?auto_15930 ?auto_15933 ) ) ( not ( = ?auto_15930 ?auto_15936 ) ) ( not ( = ?auto_15931 ?auto_15933 ) ) ( not ( = ?auto_15931 ?auto_15936 ) ) ( not ( = ?auto_15933 ?auto_15946 ) ) ( not ( = ?auto_15933 ?auto_15944 ) ) ( not ( = ?auto_15933 ?auto_15947 ) ) ( not ( = ?auto_15933 ?auto_15943 ) ) ( not ( = ?auto_15936 ?auto_15946 ) ) ( not ( = ?auto_15936 ?auto_15944 ) ) ( not ( = ?auto_15936 ?auto_15947 ) ) ( not ( = ?auto_15936 ?auto_15943 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15931 ?auto_15932 )
      ( MAKE-1CRATE ?auto_15932 ?auto_15933 )
      ( MAKE-5CRATE-VERIFY ?auto_15928 ?auto_15929 ?auto_15930 ?auto_15931 ?auto_15932 ?auto_15933 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15950 - SURFACE
      ?auto_15951 - SURFACE
    )
    :vars
    (
      ?auto_15952 - HOIST
      ?auto_15953 - PLACE
      ?auto_15955 - PLACE
      ?auto_15956 - HOIST
      ?auto_15957 - SURFACE
      ?auto_15954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15952 ?auto_15953 ) ( SURFACE-AT ?auto_15950 ?auto_15953 ) ( CLEAR ?auto_15950 ) ( IS-CRATE ?auto_15951 ) ( AVAILABLE ?auto_15952 ) ( not ( = ?auto_15955 ?auto_15953 ) ) ( HOIST-AT ?auto_15956 ?auto_15955 ) ( AVAILABLE ?auto_15956 ) ( SURFACE-AT ?auto_15951 ?auto_15955 ) ( ON ?auto_15951 ?auto_15957 ) ( CLEAR ?auto_15951 ) ( TRUCK-AT ?auto_15954 ?auto_15953 ) ( not ( = ?auto_15950 ?auto_15951 ) ) ( not ( = ?auto_15950 ?auto_15957 ) ) ( not ( = ?auto_15951 ?auto_15957 ) ) ( not ( = ?auto_15952 ?auto_15956 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15954 ?auto_15953 ?auto_15955 )
      ( !LIFT ?auto_15956 ?auto_15951 ?auto_15957 ?auto_15955 )
      ( !LOAD ?auto_15956 ?auto_15951 ?auto_15954 ?auto_15955 )
      ( !DRIVE ?auto_15954 ?auto_15955 ?auto_15953 )
      ( !UNLOAD ?auto_15952 ?auto_15951 ?auto_15954 ?auto_15953 )
      ( !DROP ?auto_15952 ?auto_15951 ?auto_15950 ?auto_15953 )
      ( MAKE-1CRATE-VERIFY ?auto_15950 ?auto_15951 ) )
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
      ?auto_15977 - HOIST
      ?auto_15975 - PLACE
      ?auto_15976 - PLACE
      ?auto_15974 - HOIST
      ?auto_15973 - SURFACE
      ?auto_15978 - PLACE
      ?auto_15985 - HOIST
      ?auto_15988 - SURFACE
      ?auto_15983 - PLACE
      ?auto_15984 - HOIST
      ?auto_15987 - SURFACE
      ?auto_15982 - SURFACE
      ?auto_15986 - PLACE
      ?auto_15981 - HOIST
      ?auto_15979 - SURFACE
      ?auto_15980 - SURFACE
      ?auto_15972 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15977 ?auto_15975 ) ( IS-CRATE ?auto_15971 ) ( not ( = ?auto_15976 ?auto_15975 ) ) ( HOIST-AT ?auto_15974 ?auto_15976 ) ( AVAILABLE ?auto_15974 ) ( SURFACE-AT ?auto_15971 ?auto_15976 ) ( ON ?auto_15971 ?auto_15973 ) ( CLEAR ?auto_15971 ) ( not ( = ?auto_15970 ?auto_15971 ) ) ( not ( = ?auto_15970 ?auto_15973 ) ) ( not ( = ?auto_15971 ?auto_15973 ) ) ( not ( = ?auto_15977 ?auto_15974 ) ) ( IS-CRATE ?auto_15970 ) ( not ( = ?auto_15978 ?auto_15975 ) ) ( HOIST-AT ?auto_15985 ?auto_15978 ) ( SURFACE-AT ?auto_15970 ?auto_15978 ) ( ON ?auto_15970 ?auto_15988 ) ( CLEAR ?auto_15970 ) ( not ( = ?auto_15969 ?auto_15970 ) ) ( not ( = ?auto_15969 ?auto_15988 ) ) ( not ( = ?auto_15970 ?auto_15988 ) ) ( not ( = ?auto_15977 ?auto_15985 ) ) ( IS-CRATE ?auto_15969 ) ( not ( = ?auto_15983 ?auto_15975 ) ) ( HOIST-AT ?auto_15984 ?auto_15983 ) ( SURFACE-AT ?auto_15969 ?auto_15983 ) ( ON ?auto_15969 ?auto_15987 ) ( CLEAR ?auto_15969 ) ( not ( = ?auto_15968 ?auto_15969 ) ) ( not ( = ?auto_15968 ?auto_15987 ) ) ( not ( = ?auto_15969 ?auto_15987 ) ) ( not ( = ?auto_15977 ?auto_15984 ) ) ( IS-CRATE ?auto_15968 ) ( AVAILABLE ?auto_15985 ) ( SURFACE-AT ?auto_15968 ?auto_15978 ) ( ON ?auto_15968 ?auto_15982 ) ( CLEAR ?auto_15968 ) ( not ( = ?auto_15967 ?auto_15968 ) ) ( not ( = ?auto_15967 ?auto_15982 ) ) ( not ( = ?auto_15968 ?auto_15982 ) ) ( IS-CRATE ?auto_15967 ) ( not ( = ?auto_15986 ?auto_15975 ) ) ( HOIST-AT ?auto_15981 ?auto_15986 ) ( AVAILABLE ?auto_15981 ) ( SURFACE-AT ?auto_15967 ?auto_15986 ) ( ON ?auto_15967 ?auto_15979 ) ( CLEAR ?auto_15967 ) ( not ( = ?auto_15966 ?auto_15967 ) ) ( not ( = ?auto_15966 ?auto_15979 ) ) ( not ( = ?auto_15967 ?auto_15979 ) ) ( not ( = ?auto_15977 ?auto_15981 ) ) ( SURFACE-AT ?auto_15965 ?auto_15975 ) ( CLEAR ?auto_15965 ) ( IS-CRATE ?auto_15966 ) ( AVAILABLE ?auto_15977 ) ( AVAILABLE ?auto_15984 ) ( SURFACE-AT ?auto_15966 ?auto_15983 ) ( ON ?auto_15966 ?auto_15980 ) ( CLEAR ?auto_15966 ) ( TRUCK-AT ?auto_15972 ?auto_15975 ) ( not ( = ?auto_15965 ?auto_15966 ) ) ( not ( = ?auto_15965 ?auto_15980 ) ) ( not ( = ?auto_15966 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15967 ) ) ( not ( = ?auto_15965 ?auto_15979 ) ) ( not ( = ?auto_15967 ?auto_15980 ) ) ( not ( = ?auto_15986 ?auto_15983 ) ) ( not ( = ?auto_15981 ?auto_15984 ) ) ( not ( = ?auto_15979 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15968 ) ) ( not ( = ?auto_15965 ?auto_15982 ) ) ( not ( = ?auto_15966 ?auto_15968 ) ) ( not ( = ?auto_15966 ?auto_15982 ) ) ( not ( = ?auto_15968 ?auto_15979 ) ) ( not ( = ?auto_15968 ?auto_15980 ) ) ( not ( = ?auto_15978 ?auto_15986 ) ) ( not ( = ?auto_15978 ?auto_15983 ) ) ( not ( = ?auto_15985 ?auto_15981 ) ) ( not ( = ?auto_15985 ?auto_15984 ) ) ( not ( = ?auto_15982 ?auto_15979 ) ) ( not ( = ?auto_15982 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15969 ) ) ( not ( = ?auto_15965 ?auto_15987 ) ) ( not ( = ?auto_15966 ?auto_15969 ) ) ( not ( = ?auto_15966 ?auto_15987 ) ) ( not ( = ?auto_15967 ?auto_15969 ) ) ( not ( = ?auto_15967 ?auto_15987 ) ) ( not ( = ?auto_15969 ?auto_15982 ) ) ( not ( = ?auto_15969 ?auto_15979 ) ) ( not ( = ?auto_15969 ?auto_15980 ) ) ( not ( = ?auto_15987 ?auto_15982 ) ) ( not ( = ?auto_15987 ?auto_15979 ) ) ( not ( = ?auto_15987 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15970 ) ) ( not ( = ?auto_15965 ?auto_15988 ) ) ( not ( = ?auto_15966 ?auto_15970 ) ) ( not ( = ?auto_15966 ?auto_15988 ) ) ( not ( = ?auto_15967 ?auto_15970 ) ) ( not ( = ?auto_15967 ?auto_15988 ) ) ( not ( = ?auto_15968 ?auto_15970 ) ) ( not ( = ?auto_15968 ?auto_15988 ) ) ( not ( = ?auto_15970 ?auto_15987 ) ) ( not ( = ?auto_15970 ?auto_15982 ) ) ( not ( = ?auto_15970 ?auto_15979 ) ) ( not ( = ?auto_15970 ?auto_15980 ) ) ( not ( = ?auto_15988 ?auto_15987 ) ) ( not ( = ?auto_15988 ?auto_15982 ) ) ( not ( = ?auto_15988 ?auto_15979 ) ) ( not ( = ?auto_15988 ?auto_15980 ) ) ( not ( = ?auto_15965 ?auto_15971 ) ) ( not ( = ?auto_15965 ?auto_15973 ) ) ( not ( = ?auto_15966 ?auto_15971 ) ) ( not ( = ?auto_15966 ?auto_15973 ) ) ( not ( = ?auto_15967 ?auto_15971 ) ) ( not ( = ?auto_15967 ?auto_15973 ) ) ( not ( = ?auto_15968 ?auto_15971 ) ) ( not ( = ?auto_15968 ?auto_15973 ) ) ( not ( = ?auto_15969 ?auto_15971 ) ) ( not ( = ?auto_15969 ?auto_15973 ) ) ( not ( = ?auto_15971 ?auto_15988 ) ) ( not ( = ?auto_15971 ?auto_15987 ) ) ( not ( = ?auto_15971 ?auto_15982 ) ) ( not ( = ?auto_15971 ?auto_15979 ) ) ( not ( = ?auto_15971 ?auto_15980 ) ) ( not ( = ?auto_15976 ?auto_15978 ) ) ( not ( = ?auto_15976 ?auto_15983 ) ) ( not ( = ?auto_15976 ?auto_15986 ) ) ( not ( = ?auto_15974 ?auto_15985 ) ) ( not ( = ?auto_15974 ?auto_15984 ) ) ( not ( = ?auto_15974 ?auto_15981 ) ) ( not ( = ?auto_15973 ?auto_15988 ) ) ( not ( = ?auto_15973 ?auto_15987 ) ) ( not ( = ?auto_15973 ?auto_15982 ) ) ( not ( = ?auto_15973 ?auto_15979 ) ) ( not ( = ?auto_15973 ?auto_15980 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_15965 ?auto_15966 ?auto_15967 ?auto_15968 ?auto_15969 ?auto_15970 )
      ( MAKE-1CRATE ?auto_15970 ?auto_15971 )
      ( MAKE-6CRATE-VERIFY ?auto_15965 ?auto_15966 ?auto_15967 ?auto_15968 ?auto_15969 ?auto_15970 ?auto_15971 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_15991 - SURFACE
      ?auto_15992 - SURFACE
    )
    :vars
    (
      ?auto_15993 - HOIST
      ?auto_15994 - PLACE
      ?auto_15996 - PLACE
      ?auto_15997 - HOIST
      ?auto_15998 - SURFACE
      ?auto_15995 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_15993 ?auto_15994 ) ( SURFACE-AT ?auto_15991 ?auto_15994 ) ( CLEAR ?auto_15991 ) ( IS-CRATE ?auto_15992 ) ( AVAILABLE ?auto_15993 ) ( not ( = ?auto_15996 ?auto_15994 ) ) ( HOIST-AT ?auto_15997 ?auto_15996 ) ( AVAILABLE ?auto_15997 ) ( SURFACE-AT ?auto_15992 ?auto_15996 ) ( ON ?auto_15992 ?auto_15998 ) ( CLEAR ?auto_15992 ) ( TRUCK-AT ?auto_15995 ?auto_15994 ) ( not ( = ?auto_15991 ?auto_15992 ) ) ( not ( = ?auto_15991 ?auto_15998 ) ) ( not ( = ?auto_15992 ?auto_15998 ) ) ( not ( = ?auto_15993 ?auto_15997 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_15995 ?auto_15994 ?auto_15996 )
      ( !LIFT ?auto_15997 ?auto_15992 ?auto_15998 ?auto_15996 )
      ( !LOAD ?auto_15997 ?auto_15992 ?auto_15995 ?auto_15996 )
      ( !DRIVE ?auto_15995 ?auto_15996 ?auto_15994 )
      ( !UNLOAD ?auto_15993 ?auto_15992 ?auto_15995 ?auto_15994 )
      ( !DROP ?auto_15993 ?auto_15992 ?auto_15991 ?auto_15994 )
      ( MAKE-1CRATE-VERIFY ?auto_15991 ?auto_15992 ) )
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
      ?auto_16014 - SURFACE
      ?auto_16013 - SURFACE
    )
    :vars
    (
      ?auto_16018 - HOIST
      ?auto_16019 - PLACE
      ?auto_16017 - PLACE
      ?auto_16016 - HOIST
      ?auto_16020 - SURFACE
      ?auto_16024 - PLACE
      ?auto_16025 - HOIST
      ?auto_16022 - SURFACE
      ?auto_16023 - PLACE
      ?auto_16027 - HOIST
      ?auto_16029 - SURFACE
      ?auto_16032 - PLACE
      ?auto_16034 - HOIST
      ?auto_16028 - SURFACE
      ?auto_16033 - SURFACE
      ?auto_16030 - PLACE
      ?auto_16026 - HOIST
      ?auto_16031 - SURFACE
      ?auto_16021 - SURFACE
      ?auto_16015 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16018 ?auto_16019 ) ( IS-CRATE ?auto_16013 ) ( not ( = ?auto_16017 ?auto_16019 ) ) ( HOIST-AT ?auto_16016 ?auto_16017 ) ( AVAILABLE ?auto_16016 ) ( SURFACE-AT ?auto_16013 ?auto_16017 ) ( ON ?auto_16013 ?auto_16020 ) ( CLEAR ?auto_16013 ) ( not ( = ?auto_16014 ?auto_16013 ) ) ( not ( = ?auto_16014 ?auto_16020 ) ) ( not ( = ?auto_16013 ?auto_16020 ) ) ( not ( = ?auto_16018 ?auto_16016 ) ) ( IS-CRATE ?auto_16014 ) ( not ( = ?auto_16024 ?auto_16019 ) ) ( HOIST-AT ?auto_16025 ?auto_16024 ) ( AVAILABLE ?auto_16025 ) ( SURFACE-AT ?auto_16014 ?auto_16024 ) ( ON ?auto_16014 ?auto_16022 ) ( CLEAR ?auto_16014 ) ( not ( = ?auto_16012 ?auto_16014 ) ) ( not ( = ?auto_16012 ?auto_16022 ) ) ( not ( = ?auto_16014 ?auto_16022 ) ) ( not ( = ?auto_16018 ?auto_16025 ) ) ( IS-CRATE ?auto_16012 ) ( not ( = ?auto_16023 ?auto_16019 ) ) ( HOIST-AT ?auto_16027 ?auto_16023 ) ( SURFACE-AT ?auto_16012 ?auto_16023 ) ( ON ?auto_16012 ?auto_16029 ) ( CLEAR ?auto_16012 ) ( not ( = ?auto_16011 ?auto_16012 ) ) ( not ( = ?auto_16011 ?auto_16029 ) ) ( not ( = ?auto_16012 ?auto_16029 ) ) ( not ( = ?auto_16018 ?auto_16027 ) ) ( IS-CRATE ?auto_16011 ) ( not ( = ?auto_16032 ?auto_16019 ) ) ( HOIST-AT ?auto_16034 ?auto_16032 ) ( SURFACE-AT ?auto_16011 ?auto_16032 ) ( ON ?auto_16011 ?auto_16028 ) ( CLEAR ?auto_16011 ) ( not ( = ?auto_16010 ?auto_16011 ) ) ( not ( = ?auto_16010 ?auto_16028 ) ) ( not ( = ?auto_16011 ?auto_16028 ) ) ( not ( = ?auto_16018 ?auto_16034 ) ) ( IS-CRATE ?auto_16010 ) ( AVAILABLE ?auto_16027 ) ( SURFACE-AT ?auto_16010 ?auto_16023 ) ( ON ?auto_16010 ?auto_16033 ) ( CLEAR ?auto_16010 ) ( not ( = ?auto_16009 ?auto_16010 ) ) ( not ( = ?auto_16009 ?auto_16033 ) ) ( not ( = ?auto_16010 ?auto_16033 ) ) ( IS-CRATE ?auto_16009 ) ( not ( = ?auto_16030 ?auto_16019 ) ) ( HOIST-AT ?auto_16026 ?auto_16030 ) ( AVAILABLE ?auto_16026 ) ( SURFACE-AT ?auto_16009 ?auto_16030 ) ( ON ?auto_16009 ?auto_16031 ) ( CLEAR ?auto_16009 ) ( not ( = ?auto_16008 ?auto_16009 ) ) ( not ( = ?auto_16008 ?auto_16031 ) ) ( not ( = ?auto_16009 ?auto_16031 ) ) ( not ( = ?auto_16018 ?auto_16026 ) ) ( SURFACE-AT ?auto_16007 ?auto_16019 ) ( CLEAR ?auto_16007 ) ( IS-CRATE ?auto_16008 ) ( AVAILABLE ?auto_16018 ) ( AVAILABLE ?auto_16034 ) ( SURFACE-AT ?auto_16008 ?auto_16032 ) ( ON ?auto_16008 ?auto_16021 ) ( CLEAR ?auto_16008 ) ( TRUCK-AT ?auto_16015 ?auto_16019 ) ( not ( = ?auto_16007 ?auto_16008 ) ) ( not ( = ?auto_16007 ?auto_16021 ) ) ( not ( = ?auto_16008 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16009 ) ) ( not ( = ?auto_16007 ?auto_16031 ) ) ( not ( = ?auto_16009 ?auto_16021 ) ) ( not ( = ?auto_16030 ?auto_16032 ) ) ( not ( = ?auto_16026 ?auto_16034 ) ) ( not ( = ?auto_16031 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16010 ) ) ( not ( = ?auto_16007 ?auto_16033 ) ) ( not ( = ?auto_16008 ?auto_16010 ) ) ( not ( = ?auto_16008 ?auto_16033 ) ) ( not ( = ?auto_16010 ?auto_16031 ) ) ( not ( = ?auto_16010 ?auto_16021 ) ) ( not ( = ?auto_16023 ?auto_16030 ) ) ( not ( = ?auto_16023 ?auto_16032 ) ) ( not ( = ?auto_16027 ?auto_16026 ) ) ( not ( = ?auto_16027 ?auto_16034 ) ) ( not ( = ?auto_16033 ?auto_16031 ) ) ( not ( = ?auto_16033 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16011 ) ) ( not ( = ?auto_16007 ?auto_16028 ) ) ( not ( = ?auto_16008 ?auto_16011 ) ) ( not ( = ?auto_16008 ?auto_16028 ) ) ( not ( = ?auto_16009 ?auto_16011 ) ) ( not ( = ?auto_16009 ?auto_16028 ) ) ( not ( = ?auto_16011 ?auto_16033 ) ) ( not ( = ?auto_16011 ?auto_16031 ) ) ( not ( = ?auto_16011 ?auto_16021 ) ) ( not ( = ?auto_16028 ?auto_16033 ) ) ( not ( = ?auto_16028 ?auto_16031 ) ) ( not ( = ?auto_16028 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16012 ) ) ( not ( = ?auto_16007 ?auto_16029 ) ) ( not ( = ?auto_16008 ?auto_16012 ) ) ( not ( = ?auto_16008 ?auto_16029 ) ) ( not ( = ?auto_16009 ?auto_16012 ) ) ( not ( = ?auto_16009 ?auto_16029 ) ) ( not ( = ?auto_16010 ?auto_16012 ) ) ( not ( = ?auto_16010 ?auto_16029 ) ) ( not ( = ?auto_16012 ?auto_16028 ) ) ( not ( = ?auto_16012 ?auto_16033 ) ) ( not ( = ?auto_16012 ?auto_16031 ) ) ( not ( = ?auto_16012 ?auto_16021 ) ) ( not ( = ?auto_16029 ?auto_16028 ) ) ( not ( = ?auto_16029 ?auto_16033 ) ) ( not ( = ?auto_16029 ?auto_16031 ) ) ( not ( = ?auto_16029 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16014 ) ) ( not ( = ?auto_16007 ?auto_16022 ) ) ( not ( = ?auto_16008 ?auto_16014 ) ) ( not ( = ?auto_16008 ?auto_16022 ) ) ( not ( = ?auto_16009 ?auto_16014 ) ) ( not ( = ?auto_16009 ?auto_16022 ) ) ( not ( = ?auto_16010 ?auto_16014 ) ) ( not ( = ?auto_16010 ?auto_16022 ) ) ( not ( = ?auto_16011 ?auto_16014 ) ) ( not ( = ?auto_16011 ?auto_16022 ) ) ( not ( = ?auto_16014 ?auto_16029 ) ) ( not ( = ?auto_16014 ?auto_16028 ) ) ( not ( = ?auto_16014 ?auto_16033 ) ) ( not ( = ?auto_16014 ?auto_16031 ) ) ( not ( = ?auto_16014 ?auto_16021 ) ) ( not ( = ?auto_16024 ?auto_16023 ) ) ( not ( = ?auto_16024 ?auto_16032 ) ) ( not ( = ?auto_16024 ?auto_16030 ) ) ( not ( = ?auto_16025 ?auto_16027 ) ) ( not ( = ?auto_16025 ?auto_16034 ) ) ( not ( = ?auto_16025 ?auto_16026 ) ) ( not ( = ?auto_16022 ?auto_16029 ) ) ( not ( = ?auto_16022 ?auto_16028 ) ) ( not ( = ?auto_16022 ?auto_16033 ) ) ( not ( = ?auto_16022 ?auto_16031 ) ) ( not ( = ?auto_16022 ?auto_16021 ) ) ( not ( = ?auto_16007 ?auto_16013 ) ) ( not ( = ?auto_16007 ?auto_16020 ) ) ( not ( = ?auto_16008 ?auto_16013 ) ) ( not ( = ?auto_16008 ?auto_16020 ) ) ( not ( = ?auto_16009 ?auto_16013 ) ) ( not ( = ?auto_16009 ?auto_16020 ) ) ( not ( = ?auto_16010 ?auto_16013 ) ) ( not ( = ?auto_16010 ?auto_16020 ) ) ( not ( = ?auto_16011 ?auto_16013 ) ) ( not ( = ?auto_16011 ?auto_16020 ) ) ( not ( = ?auto_16012 ?auto_16013 ) ) ( not ( = ?auto_16012 ?auto_16020 ) ) ( not ( = ?auto_16013 ?auto_16022 ) ) ( not ( = ?auto_16013 ?auto_16029 ) ) ( not ( = ?auto_16013 ?auto_16028 ) ) ( not ( = ?auto_16013 ?auto_16033 ) ) ( not ( = ?auto_16013 ?auto_16031 ) ) ( not ( = ?auto_16013 ?auto_16021 ) ) ( not ( = ?auto_16017 ?auto_16024 ) ) ( not ( = ?auto_16017 ?auto_16023 ) ) ( not ( = ?auto_16017 ?auto_16032 ) ) ( not ( = ?auto_16017 ?auto_16030 ) ) ( not ( = ?auto_16016 ?auto_16025 ) ) ( not ( = ?auto_16016 ?auto_16027 ) ) ( not ( = ?auto_16016 ?auto_16034 ) ) ( not ( = ?auto_16016 ?auto_16026 ) ) ( not ( = ?auto_16020 ?auto_16022 ) ) ( not ( = ?auto_16020 ?auto_16029 ) ) ( not ( = ?auto_16020 ?auto_16028 ) ) ( not ( = ?auto_16020 ?auto_16033 ) ) ( not ( = ?auto_16020 ?auto_16031 ) ) ( not ( = ?auto_16020 ?auto_16021 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_16007 ?auto_16008 ?auto_16009 ?auto_16010 ?auto_16011 ?auto_16012 ?auto_16014 )
      ( MAKE-1CRATE ?auto_16014 ?auto_16013 )
      ( MAKE-7CRATE-VERIFY ?auto_16007 ?auto_16008 ?auto_16009 ?auto_16010 ?auto_16011 ?auto_16012 ?auto_16014 ?auto_16013 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16037 - SURFACE
      ?auto_16038 - SURFACE
    )
    :vars
    (
      ?auto_16039 - HOIST
      ?auto_16040 - PLACE
      ?auto_16042 - PLACE
      ?auto_16043 - HOIST
      ?auto_16044 - SURFACE
      ?auto_16041 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16039 ?auto_16040 ) ( SURFACE-AT ?auto_16037 ?auto_16040 ) ( CLEAR ?auto_16037 ) ( IS-CRATE ?auto_16038 ) ( AVAILABLE ?auto_16039 ) ( not ( = ?auto_16042 ?auto_16040 ) ) ( HOIST-AT ?auto_16043 ?auto_16042 ) ( AVAILABLE ?auto_16043 ) ( SURFACE-AT ?auto_16038 ?auto_16042 ) ( ON ?auto_16038 ?auto_16044 ) ( CLEAR ?auto_16038 ) ( TRUCK-AT ?auto_16041 ?auto_16040 ) ( not ( = ?auto_16037 ?auto_16038 ) ) ( not ( = ?auto_16037 ?auto_16044 ) ) ( not ( = ?auto_16038 ?auto_16044 ) ) ( not ( = ?auto_16039 ?auto_16043 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16041 ?auto_16040 ?auto_16042 )
      ( !LIFT ?auto_16043 ?auto_16038 ?auto_16044 ?auto_16042 )
      ( !LOAD ?auto_16043 ?auto_16038 ?auto_16041 ?auto_16042 )
      ( !DRIVE ?auto_16041 ?auto_16042 ?auto_16040 )
      ( !UNLOAD ?auto_16039 ?auto_16038 ?auto_16041 ?auto_16040 )
      ( !DROP ?auto_16039 ?auto_16038 ?auto_16037 ?auto_16040 )
      ( MAKE-1CRATE-VERIFY ?auto_16037 ?auto_16038 ) )
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
      ?auto_16062 - SURFACE
      ?auto_16061 - SURFACE
      ?auto_16060 - SURFACE
    )
    :vars
    (
      ?auto_16066 - HOIST
      ?auto_16065 - PLACE
      ?auto_16063 - PLACE
      ?auto_16064 - HOIST
      ?auto_16068 - SURFACE
      ?auto_16083 - PLACE
      ?auto_16069 - HOIST
      ?auto_16080 - SURFACE
      ?auto_16081 - PLACE
      ?auto_16079 - HOIST
      ?auto_16082 - SURFACE
      ?auto_16071 - SURFACE
      ?auto_16074 - PLACE
      ?auto_16076 - HOIST
      ?auto_16077 - SURFACE
      ?auto_16075 - SURFACE
      ?auto_16073 - PLACE
      ?auto_16078 - HOIST
      ?auto_16072 - SURFACE
      ?auto_16070 - SURFACE
      ?auto_16067 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16066 ?auto_16065 ) ( IS-CRATE ?auto_16060 ) ( not ( = ?auto_16063 ?auto_16065 ) ) ( HOIST-AT ?auto_16064 ?auto_16063 ) ( SURFACE-AT ?auto_16060 ?auto_16063 ) ( ON ?auto_16060 ?auto_16068 ) ( CLEAR ?auto_16060 ) ( not ( = ?auto_16061 ?auto_16060 ) ) ( not ( = ?auto_16061 ?auto_16068 ) ) ( not ( = ?auto_16060 ?auto_16068 ) ) ( not ( = ?auto_16066 ?auto_16064 ) ) ( IS-CRATE ?auto_16061 ) ( not ( = ?auto_16083 ?auto_16065 ) ) ( HOIST-AT ?auto_16069 ?auto_16083 ) ( AVAILABLE ?auto_16069 ) ( SURFACE-AT ?auto_16061 ?auto_16083 ) ( ON ?auto_16061 ?auto_16080 ) ( CLEAR ?auto_16061 ) ( not ( = ?auto_16062 ?auto_16061 ) ) ( not ( = ?auto_16062 ?auto_16080 ) ) ( not ( = ?auto_16061 ?auto_16080 ) ) ( not ( = ?auto_16066 ?auto_16069 ) ) ( IS-CRATE ?auto_16062 ) ( not ( = ?auto_16081 ?auto_16065 ) ) ( HOIST-AT ?auto_16079 ?auto_16081 ) ( AVAILABLE ?auto_16079 ) ( SURFACE-AT ?auto_16062 ?auto_16081 ) ( ON ?auto_16062 ?auto_16082 ) ( CLEAR ?auto_16062 ) ( not ( = ?auto_16059 ?auto_16062 ) ) ( not ( = ?auto_16059 ?auto_16082 ) ) ( not ( = ?auto_16062 ?auto_16082 ) ) ( not ( = ?auto_16066 ?auto_16079 ) ) ( IS-CRATE ?auto_16059 ) ( SURFACE-AT ?auto_16059 ?auto_16063 ) ( ON ?auto_16059 ?auto_16071 ) ( CLEAR ?auto_16059 ) ( not ( = ?auto_16058 ?auto_16059 ) ) ( not ( = ?auto_16058 ?auto_16071 ) ) ( not ( = ?auto_16059 ?auto_16071 ) ) ( IS-CRATE ?auto_16058 ) ( not ( = ?auto_16074 ?auto_16065 ) ) ( HOIST-AT ?auto_16076 ?auto_16074 ) ( SURFACE-AT ?auto_16058 ?auto_16074 ) ( ON ?auto_16058 ?auto_16077 ) ( CLEAR ?auto_16058 ) ( not ( = ?auto_16057 ?auto_16058 ) ) ( not ( = ?auto_16057 ?auto_16077 ) ) ( not ( = ?auto_16058 ?auto_16077 ) ) ( not ( = ?auto_16066 ?auto_16076 ) ) ( IS-CRATE ?auto_16057 ) ( AVAILABLE ?auto_16064 ) ( SURFACE-AT ?auto_16057 ?auto_16063 ) ( ON ?auto_16057 ?auto_16075 ) ( CLEAR ?auto_16057 ) ( not ( = ?auto_16056 ?auto_16057 ) ) ( not ( = ?auto_16056 ?auto_16075 ) ) ( not ( = ?auto_16057 ?auto_16075 ) ) ( IS-CRATE ?auto_16056 ) ( not ( = ?auto_16073 ?auto_16065 ) ) ( HOIST-AT ?auto_16078 ?auto_16073 ) ( AVAILABLE ?auto_16078 ) ( SURFACE-AT ?auto_16056 ?auto_16073 ) ( ON ?auto_16056 ?auto_16072 ) ( CLEAR ?auto_16056 ) ( not ( = ?auto_16055 ?auto_16056 ) ) ( not ( = ?auto_16055 ?auto_16072 ) ) ( not ( = ?auto_16056 ?auto_16072 ) ) ( not ( = ?auto_16066 ?auto_16078 ) ) ( SURFACE-AT ?auto_16054 ?auto_16065 ) ( CLEAR ?auto_16054 ) ( IS-CRATE ?auto_16055 ) ( AVAILABLE ?auto_16066 ) ( AVAILABLE ?auto_16076 ) ( SURFACE-AT ?auto_16055 ?auto_16074 ) ( ON ?auto_16055 ?auto_16070 ) ( CLEAR ?auto_16055 ) ( TRUCK-AT ?auto_16067 ?auto_16065 ) ( not ( = ?auto_16054 ?auto_16055 ) ) ( not ( = ?auto_16054 ?auto_16070 ) ) ( not ( = ?auto_16055 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16056 ) ) ( not ( = ?auto_16054 ?auto_16072 ) ) ( not ( = ?auto_16056 ?auto_16070 ) ) ( not ( = ?auto_16073 ?auto_16074 ) ) ( not ( = ?auto_16078 ?auto_16076 ) ) ( not ( = ?auto_16072 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16057 ) ) ( not ( = ?auto_16054 ?auto_16075 ) ) ( not ( = ?auto_16055 ?auto_16057 ) ) ( not ( = ?auto_16055 ?auto_16075 ) ) ( not ( = ?auto_16057 ?auto_16072 ) ) ( not ( = ?auto_16057 ?auto_16070 ) ) ( not ( = ?auto_16063 ?auto_16073 ) ) ( not ( = ?auto_16063 ?auto_16074 ) ) ( not ( = ?auto_16064 ?auto_16078 ) ) ( not ( = ?auto_16064 ?auto_16076 ) ) ( not ( = ?auto_16075 ?auto_16072 ) ) ( not ( = ?auto_16075 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16058 ) ) ( not ( = ?auto_16054 ?auto_16077 ) ) ( not ( = ?auto_16055 ?auto_16058 ) ) ( not ( = ?auto_16055 ?auto_16077 ) ) ( not ( = ?auto_16056 ?auto_16058 ) ) ( not ( = ?auto_16056 ?auto_16077 ) ) ( not ( = ?auto_16058 ?auto_16075 ) ) ( not ( = ?auto_16058 ?auto_16072 ) ) ( not ( = ?auto_16058 ?auto_16070 ) ) ( not ( = ?auto_16077 ?auto_16075 ) ) ( not ( = ?auto_16077 ?auto_16072 ) ) ( not ( = ?auto_16077 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16059 ) ) ( not ( = ?auto_16054 ?auto_16071 ) ) ( not ( = ?auto_16055 ?auto_16059 ) ) ( not ( = ?auto_16055 ?auto_16071 ) ) ( not ( = ?auto_16056 ?auto_16059 ) ) ( not ( = ?auto_16056 ?auto_16071 ) ) ( not ( = ?auto_16057 ?auto_16059 ) ) ( not ( = ?auto_16057 ?auto_16071 ) ) ( not ( = ?auto_16059 ?auto_16077 ) ) ( not ( = ?auto_16059 ?auto_16075 ) ) ( not ( = ?auto_16059 ?auto_16072 ) ) ( not ( = ?auto_16059 ?auto_16070 ) ) ( not ( = ?auto_16071 ?auto_16077 ) ) ( not ( = ?auto_16071 ?auto_16075 ) ) ( not ( = ?auto_16071 ?auto_16072 ) ) ( not ( = ?auto_16071 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16062 ) ) ( not ( = ?auto_16054 ?auto_16082 ) ) ( not ( = ?auto_16055 ?auto_16062 ) ) ( not ( = ?auto_16055 ?auto_16082 ) ) ( not ( = ?auto_16056 ?auto_16062 ) ) ( not ( = ?auto_16056 ?auto_16082 ) ) ( not ( = ?auto_16057 ?auto_16062 ) ) ( not ( = ?auto_16057 ?auto_16082 ) ) ( not ( = ?auto_16058 ?auto_16062 ) ) ( not ( = ?auto_16058 ?auto_16082 ) ) ( not ( = ?auto_16062 ?auto_16071 ) ) ( not ( = ?auto_16062 ?auto_16077 ) ) ( not ( = ?auto_16062 ?auto_16075 ) ) ( not ( = ?auto_16062 ?auto_16072 ) ) ( not ( = ?auto_16062 ?auto_16070 ) ) ( not ( = ?auto_16081 ?auto_16063 ) ) ( not ( = ?auto_16081 ?auto_16074 ) ) ( not ( = ?auto_16081 ?auto_16073 ) ) ( not ( = ?auto_16079 ?auto_16064 ) ) ( not ( = ?auto_16079 ?auto_16076 ) ) ( not ( = ?auto_16079 ?auto_16078 ) ) ( not ( = ?auto_16082 ?auto_16071 ) ) ( not ( = ?auto_16082 ?auto_16077 ) ) ( not ( = ?auto_16082 ?auto_16075 ) ) ( not ( = ?auto_16082 ?auto_16072 ) ) ( not ( = ?auto_16082 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16061 ) ) ( not ( = ?auto_16054 ?auto_16080 ) ) ( not ( = ?auto_16055 ?auto_16061 ) ) ( not ( = ?auto_16055 ?auto_16080 ) ) ( not ( = ?auto_16056 ?auto_16061 ) ) ( not ( = ?auto_16056 ?auto_16080 ) ) ( not ( = ?auto_16057 ?auto_16061 ) ) ( not ( = ?auto_16057 ?auto_16080 ) ) ( not ( = ?auto_16058 ?auto_16061 ) ) ( not ( = ?auto_16058 ?auto_16080 ) ) ( not ( = ?auto_16059 ?auto_16061 ) ) ( not ( = ?auto_16059 ?auto_16080 ) ) ( not ( = ?auto_16061 ?auto_16082 ) ) ( not ( = ?auto_16061 ?auto_16071 ) ) ( not ( = ?auto_16061 ?auto_16077 ) ) ( not ( = ?auto_16061 ?auto_16075 ) ) ( not ( = ?auto_16061 ?auto_16072 ) ) ( not ( = ?auto_16061 ?auto_16070 ) ) ( not ( = ?auto_16083 ?auto_16081 ) ) ( not ( = ?auto_16083 ?auto_16063 ) ) ( not ( = ?auto_16083 ?auto_16074 ) ) ( not ( = ?auto_16083 ?auto_16073 ) ) ( not ( = ?auto_16069 ?auto_16079 ) ) ( not ( = ?auto_16069 ?auto_16064 ) ) ( not ( = ?auto_16069 ?auto_16076 ) ) ( not ( = ?auto_16069 ?auto_16078 ) ) ( not ( = ?auto_16080 ?auto_16082 ) ) ( not ( = ?auto_16080 ?auto_16071 ) ) ( not ( = ?auto_16080 ?auto_16077 ) ) ( not ( = ?auto_16080 ?auto_16075 ) ) ( not ( = ?auto_16080 ?auto_16072 ) ) ( not ( = ?auto_16080 ?auto_16070 ) ) ( not ( = ?auto_16054 ?auto_16060 ) ) ( not ( = ?auto_16054 ?auto_16068 ) ) ( not ( = ?auto_16055 ?auto_16060 ) ) ( not ( = ?auto_16055 ?auto_16068 ) ) ( not ( = ?auto_16056 ?auto_16060 ) ) ( not ( = ?auto_16056 ?auto_16068 ) ) ( not ( = ?auto_16057 ?auto_16060 ) ) ( not ( = ?auto_16057 ?auto_16068 ) ) ( not ( = ?auto_16058 ?auto_16060 ) ) ( not ( = ?auto_16058 ?auto_16068 ) ) ( not ( = ?auto_16059 ?auto_16060 ) ) ( not ( = ?auto_16059 ?auto_16068 ) ) ( not ( = ?auto_16062 ?auto_16060 ) ) ( not ( = ?auto_16062 ?auto_16068 ) ) ( not ( = ?auto_16060 ?auto_16080 ) ) ( not ( = ?auto_16060 ?auto_16082 ) ) ( not ( = ?auto_16060 ?auto_16071 ) ) ( not ( = ?auto_16060 ?auto_16077 ) ) ( not ( = ?auto_16060 ?auto_16075 ) ) ( not ( = ?auto_16060 ?auto_16072 ) ) ( not ( = ?auto_16060 ?auto_16070 ) ) ( not ( = ?auto_16068 ?auto_16080 ) ) ( not ( = ?auto_16068 ?auto_16082 ) ) ( not ( = ?auto_16068 ?auto_16071 ) ) ( not ( = ?auto_16068 ?auto_16077 ) ) ( not ( = ?auto_16068 ?auto_16075 ) ) ( not ( = ?auto_16068 ?auto_16072 ) ) ( not ( = ?auto_16068 ?auto_16070 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ?auto_16062 ?auto_16061 )
      ( MAKE-1CRATE ?auto_16061 ?auto_16060 )
      ( MAKE-8CRATE-VERIFY ?auto_16054 ?auto_16055 ?auto_16056 ?auto_16057 ?auto_16058 ?auto_16059 ?auto_16062 ?auto_16061 ?auto_16060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16086 - SURFACE
      ?auto_16087 - SURFACE
    )
    :vars
    (
      ?auto_16088 - HOIST
      ?auto_16089 - PLACE
      ?auto_16091 - PLACE
      ?auto_16092 - HOIST
      ?auto_16093 - SURFACE
      ?auto_16090 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16088 ?auto_16089 ) ( SURFACE-AT ?auto_16086 ?auto_16089 ) ( CLEAR ?auto_16086 ) ( IS-CRATE ?auto_16087 ) ( AVAILABLE ?auto_16088 ) ( not ( = ?auto_16091 ?auto_16089 ) ) ( HOIST-AT ?auto_16092 ?auto_16091 ) ( AVAILABLE ?auto_16092 ) ( SURFACE-AT ?auto_16087 ?auto_16091 ) ( ON ?auto_16087 ?auto_16093 ) ( CLEAR ?auto_16087 ) ( TRUCK-AT ?auto_16090 ?auto_16089 ) ( not ( = ?auto_16086 ?auto_16087 ) ) ( not ( = ?auto_16086 ?auto_16093 ) ) ( not ( = ?auto_16087 ?auto_16093 ) ) ( not ( = ?auto_16088 ?auto_16092 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16090 ?auto_16089 ?auto_16091 )
      ( !LIFT ?auto_16092 ?auto_16087 ?auto_16093 ?auto_16091 )
      ( !LOAD ?auto_16092 ?auto_16087 ?auto_16090 ?auto_16091 )
      ( !DRIVE ?auto_16090 ?auto_16091 ?auto_16089 )
      ( !UNLOAD ?auto_16088 ?auto_16087 ?auto_16090 ?auto_16089 )
      ( !DROP ?auto_16088 ?auto_16087 ?auto_16086 ?auto_16089 )
      ( MAKE-1CRATE-VERIFY ?auto_16086 ?auto_16087 ) )
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
      ?auto_16112 - SURFACE
      ?auto_16111 - SURFACE
      ?auto_16110 - SURFACE
      ?auto_16113 - SURFACE
    )
    :vars
    (
      ?auto_16115 - HOIST
      ?auto_16116 - PLACE
      ?auto_16119 - PLACE
      ?auto_16117 - HOIST
      ?auto_16118 - SURFACE
      ?auto_16133 - PLACE
      ?auto_16123 - HOIST
      ?auto_16134 - SURFACE
      ?auto_16122 - PLACE
      ?auto_16124 - HOIST
      ?auto_16128 - SURFACE
      ?auto_16129 - PLACE
      ?auto_16126 - HOIST
      ?auto_16130 - SURFACE
      ?auto_16120 - SURFACE
      ?auto_16125 - SURFACE
      ?auto_16131 - SURFACE
      ?auto_16132 - PLACE
      ?auto_16127 - HOIST
      ?auto_16135 - SURFACE
      ?auto_16121 - SURFACE
      ?auto_16114 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16115 ?auto_16116 ) ( IS-CRATE ?auto_16113 ) ( not ( = ?auto_16119 ?auto_16116 ) ) ( HOIST-AT ?auto_16117 ?auto_16119 ) ( SURFACE-AT ?auto_16113 ?auto_16119 ) ( ON ?auto_16113 ?auto_16118 ) ( CLEAR ?auto_16113 ) ( not ( = ?auto_16110 ?auto_16113 ) ) ( not ( = ?auto_16110 ?auto_16118 ) ) ( not ( = ?auto_16113 ?auto_16118 ) ) ( not ( = ?auto_16115 ?auto_16117 ) ) ( IS-CRATE ?auto_16110 ) ( not ( = ?auto_16133 ?auto_16116 ) ) ( HOIST-AT ?auto_16123 ?auto_16133 ) ( SURFACE-AT ?auto_16110 ?auto_16133 ) ( ON ?auto_16110 ?auto_16134 ) ( CLEAR ?auto_16110 ) ( not ( = ?auto_16111 ?auto_16110 ) ) ( not ( = ?auto_16111 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16134 ) ) ( not ( = ?auto_16115 ?auto_16123 ) ) ( IS-CRATE ?auto_16111 ) ( not ( = ?auto_16122 ?auto_16116 ) ) ( HOIST-AT ?auto_16124 ?auto_16122 ) ( AVAILABLE ?auto_16124 ) ( SURFACE-AT ?auto_16111 ?auto_16122 ) ( ON ?auto_16111 ?auto_16128 ) ( CLEAR ?auto_16111 ) ( not ( = ?auto_16112 ?auto_16111 ) ) ( not ( = ?auto_16112 ?auto_16128 ) ) ( not ( = ?auto_16111 ?auto_16128 ) ) ( not ( = ?auto_16115 ?auto_16124 ) ) ( IS-CRATE ?auto_16112 ) ( not ( = ?auto_16129 ?auto_16116 ) ) ( HOIST-AT ?auto_16126 ?auto_16129 ) ( AVAILABLE ?auto_16126 ) ( SURFACE-AT ?auto_16112 ?auto_16129 ) ( ON ?auto_16112 ?auto_16130 ) ( CLEAR ?auto_16112 ) ( not ( = ?auto_16109 ?auto_16112 ) ) ( not ( = ?auto_16109 ?auto_16130 ) ) ( not ( = ?auto_16112 ?auto_16130 ) ) ( not ( = ?auto_16115 ?auto_16126 ) ) ( IS-CRATE ?auto_16109 ) ( SURFACE-AT ?auto_16109 ?auto_16133 ) ( ON ?auto_16109 ?auto_16120 ) ( CLEAR ?auto_16109 ) ( not ( = ?auto_16108 ?auto_16109 ) ) ( not ( = ?auto_16108 ?auto_16120 ) ) ( not ( = ?auto_16109 ?auto_16120 ) ) ( IS-CRATE ?auto_16108 ) ( SURFACE-AT ?auto_16108 ?auto_16119 ) ( ON ?auto_16108 ?auto_16125 ) ( CLEAR ?auto_16108 ) ( not ( = ?auto_16107 ?auto_16108 ) ) ( not ( = ?auto_16107 ?auto_16125 ) ) ( not ( = ?auto_16108 ?auto_16125 ) ) ( IS-CRATE ?auto_16107 ) ( AVAILABLE ?auto_16123 ) ( SURFACE-AT ?auto_16107 ?auto_16133 ) ( ON ?auto_16107 ?auto_16131 ) ( CLEAR ?auto_16107 ) ( not ( = ?auto_16106 ?auto_16107 ) ) ( not ( = ?auto_16106 ?auto_16131 ) ) ( not ( = ?auto_16107 ?auto_16131 ) ) ( IS-CRATE ?auto_16106 ) ( not ( = ?auto_16132 ?auto_16116 ) ) ( HOIST-AT ?auto_16127 ?auto_16132 ) ( AVAILABLE ?auto_16127 ) ( SURFACE-AT ?auto_16106 ?auto_16132 ) ( ON ?auto_16106 ?auto_16135 ) ( CLEAR ?auto_16106 ) ( not ( = ?auto_16105 ?auto_16106 ) ) ( not ( = ?auto_16105 ?auto_16135 ) ) ( not ( = ?auto_16106 ?auto_16135 ) ) ( not ( = ?auto_16115 ?auto_16127 ) ) ( SURFACE-AT ?auto_16104 ?auto_16116 ) ( CLEAR ?auto_16104 ) ( IS-CRATE ?auto_16105 ) ( AVAILABLE ?auto_16115 ) ( AVAILABLE ?auto_16117 ) ( SURFACE-AT ?auto_16105 ?auto_16119 ) ( ON ?auto_16105 ?auto_16121 ) ( CLEAR ?auto_16105 ) ( TRUCK-AT ?auto_16114 ?auto_16116 ) ( not ( = ?auto_16104 ?auto_16105 ) ) ( not ( = ?auto_16104 ?auto_16121 ) ) ( not ( = ?auto_16105 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16106 ) ) ( not ( = ?auto_16104 ?auto_16135 ) ) ( not ( = ?auto_16106 ?auto_16121 ) ) ( not ( = ?auto_16132 ?auto_16119 ) ) ( not ( = ?auto_16127 ?auto_16117 ) ) ( not ( = ?auto_16135 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16107 ) ) ( not ( = ?auto_16104 ?auto_16131 ) ) ( not ( = ?auto_16105 ?auto_16107 ) ) ( not ( = ?auto_16105 ?auto_16131 ) ) ( not ( = ?auto_16107 ?auto_16135 ) ) ( not ( = ?auto_16107 ?auto_16121 ) ) ( not ( = ?auto_16133 ?auto_16132 ) ) ( not ( = ?auto_16133 ?auto_16119 ) ) ( not ( = ?auto_16123 ?auto_16127 ) ) ( not ( = ?auto_16123 ?auto_16117 ) ) ( not ( = ?auto_16131 ?auto_16135 ) ) ( not ( = ?auto_16131 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16108 ) ) ( not ( = ?auto_16104 ?auto_16125 ) ) ( not ( = ?auto_16105 ?auto_16108 ) ) ( not ( = ?auto_16105 ?auto_16125 ) ) ( not ( = ?auto_16106 ?auto_16108 ) ) ( not ( = ?auto_16106 ?auto_16125 ) ) ( not ( = ?auto_16108 ?auto_16131 ) ) ( not ( = ?auto_16108 ?auto_16135 ) ) ( not ( = ?auto_16108 ?auto_16121 ) ) ( not ( = ?auto_16125 ?auto_16131 ) ) ( not ( = ?auto_16125 ?auto_16135 ) ) ( not ( = ?auto_16125 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16109 ) ) ( not ( = ?auto_16104 ?auto_16120 ) ) ( not ( = ?auto_16105 ?auto_16109 ) ) ( not ( = ?auto_16105 ?auto_16120 ) ) ( not ( = ?auto_16106 ?auto_16109 ) ) ( not ( = ?auto_16106 ?auto_16120 ) ) ( not ( = ?auto_16107 ?auto_16109 ) ) ( not ( = ?auto_16107 ?auto_16120 ) ) ( not ( = ?auto_16109 ?auto_16125 ) ) ( not ( = ?auto_16109 ?auto_16131 ) ) ( not ( = ?auto_16109 ?auto_16135 ) ) ( not ( = ?auto_16109 ?auto_16121 ) ) ( not ( = ?auto_16120 ?auto_16125 ) ) ( not ( = ?auto_16120 ?auto_16131 ) ) ( not ( = ?auto_16120 ?auto_16135 ) ) ( not ( = ?auto_16120 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16112 ) ) ( not ( = ?auto_16104 ?auto_16130 ) ) ( not ( = ?auto_16105 ?auto_16112 ) ) ( not ( = ?auto_16105 ?auto_16130 ) ) ( not ( = ?auto_16106 ?auto_16112 ) ) ( not ( = ?auto_16106 ?auto_16130 ) ) ( not ( = ?auto_16107 ?auto_16112 ) ) ( not ( = ?auto_16107 ?auto_16130 ) ) ( not ( = ?auto_16108 ?auto_16112 ) ) ( not ( = ?auto_16108 ?auto_16130 ) ) ( not ( = ?auto_16112 ?auto_16120 ) ) ( not ( = ?auto_16112 ?auto_16125 ) ) ( not ( = ?auto_16112 ?auto_16131 ) ) ( not ( = ?auto_16112 ?auto_16135 ) ) ( not ( = ?auto_16112 ?auto_16121 ) ) ( not ( = ?auto_16129 ?auto_16133 ) ) ( not ( = ?auto_16129 ?auto_16119 ) ) ( not ( = ?auto_16129 ?auto_16132 ) ) ( not ( = ?auto_16126 ?auto_16123 ) ) ( not ( = ?auto_16126 ?auto_16117 ) ) ( not ( = ?auto_16126 ?auto_16127 ) ) ( not ( = ?auto_16130 ?auto_16120 ) ) ( not ( = ?auto_16130 ?auto_16125 ) ) ( not ( = ?auto_16130 ?auto_16131 ) ) ( not ( = ?auto_16130 ?auto_16135 ) ) ( not ( = ?auto_16130 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16111 ) ) ( not ( = ?auto_16104 ?auto_16128 ) ) ( not ( = ?auto_16105 ?auto_16111 ) ) ( not ( = ?auto_16105 ?auto_16128 ) ) ( not ( = ?auto_16106 ?auto_16111 ) ) ( not ( = ?auto_16106 ?auto_16128 ) ) ( not ( = ?auto_16107 ?auto_16111 ) ) ( not ( = ?auto_16107 ?auto_16128 ) ) ( not ( = ?auto_16108 ?auto_16111 ) ) ( not ( = ?auto_16108 ?auto_16128 ) ) ( not ( = ?auto_16109 ?auto_16111 ) ) ( not ( = ?auto_16109 ?auto_16128 ) ) ( not ( = ?auto_16111 ?auto_16130 ) ) ( not ( = ?auto_16111 ?auto_16120 ) ) ( not ( = ?auto_16111 ?auto_16125 ) ) ( not ( = ?auto_16111 ?auto_16131 ) ) ( not ( = ?auto_16111 ?auto_16135 ) ) ( not ( = ?auto_16111 ?auto_16121 ) ) ( not ( = ?auto_16122 ?auto_16129 ) ) ( not ( = ?auto_16122 ?auto_16133 ) ) ( not ( = ?auto_16122 ?auto_16119 ) ) ( not ( = ?auto_16122 ?auto_16132 ) ) ( not ( = ?auto_16124 ?auto_16126 ) ) ( not ( = ?auto_16124 ?auto_16123 ) ) ( not ( = ?auto_16124 ?auto_16117 ) ) ( not ( = ?auto_16124 ?auto_16127 ) ) ( not ( = ?auto_16128 ?auto_16130 ) ) ( not ( = ?auto_16128 ?auto_16120 ) ) ( not ( = ?auto_16128 ?auto_16125 ) ) ( not ( = ?auto_16128 ?auto_16131 ) ) ( not ( = ?auto_16128 ?auto_16135 ) ) ( not ( = ?auto_16128 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16110 ) ) ( not ( = ?auto_16104 ?auto_16134 ) ) ( not ( = ?auto_16105 ?auto_16110 ) ) ( not ( = ?auto_16105 ?auto_16134 ) ) ( not ( = ?auto_16106 ?auto_16110 ) ) ( not ( = ?auto_16106 ?auto_16134 ) ) ( not ( = ?auto_16107 ?auto_16110 ) ) ( not ( = ?auto_16107 ?auto_16134 ) ) ( not ( = ?auto_16108 ?auto_16110 ) ) ( not ( = ?auto_16108 ?auto_16134 ) ) ( not ( = ?auto_16109 ?auto_16110 ) ) ( not ( = ?auto_16109 ?auto_16134 ) ) ( not ( = ?auto_16112 ?auto_16110 ) ) ( not ( = ?auto_16112 ?auto_16134 ) ) ( not ( = ?auto_16110 ?auto_16128 ) ) ( not ( = ?auto_16110 ?auto_16130 ) ) ( not ( = ?auto_16110 ?auto_16120 ) ) ( not ( = ?auto_16110 ?auto_16125 ) ) ( not ( = ?auto_16110 ?auto_16131 ) ) ( not ( = ?auto_16110 ?auto_16135 ) ) ( not ( = ?auto_16110 ?auto_16121 ) ) ( not ( = ?auto_16134 ?auto_16128 ) ) ( not ( = ?auto_16134 ?auto_16130 ) ) ( not ( = ?auto_16134 ?auto_16120 ) ) ( not ( = ?auto_16134 ?auto_16125 ) ) ( not ( = ?auto_16134 ?auto_16131 ) ) ( not ( = ?auto_16134 ?auto_16135 ) ) ( not ( = ?auto_16134 ?auto_16121 ) ) ( not ( = ?auto_16104 ?auto_16113 ) ) ( not ( = ?auto_16104 ?auto_16118 ) ) ( not ( = ?auto_16105 ?auto_16113 ) ) ( not ( = ?auto_16105 ?auto_16118 ) ) ( not ( = ?auto_16106 ?auto_16113 ) ) ( not ( = ?auto_16106 ?auto_16118 ) ) ( not ( = ?auto_16107 ?auto_16113 ) ) ( not ( = ?auto_16107 ?auto_16118 ) ) ( not ( = ?auto_16108 ?auto_16113 ) ) ( not ( = ?auto_16108 ?auto_16118 ) ) ( not ( = ?auto_16109 ?auto_16113 ) ) ( not ( = ?auto_16109 ?auto_16118 ) ) ( not ( = ?auto_16112 ?auto_16113 ) ) ( not ( = ?auto_16112 ?auto_16118 ) ) ( not ( = ?auto_16111 ?auto_16113 ) ) ( not ( = ?auto_16111 ?auto_16118 ) ) ( not ( = ?auto_16113 ?auto_16134 ) ) ( not ( = ?auto_16113 ?auto_16128 ) ) ( not ( = ?auto_16113 ?auto_16130 ) ) ( not ( = ?auto_16113 ?auto_16120 ) ) ( not ( = ?auto_16113 ?auto_16125 ) ) ( not ( = ?auto_16113 ?auto_16131 ) ) ( not ( = ?auto_16113 ?auto_16135 ) ) ( not ( = ?auto_16113 ?auto_16121 ) ) ( not ( = ?auto_16118 ?auto_16134 ) ) ( not ( = ?auto_16118 ?auto_16128 ) ) ( not ( = ?auto_16118 ?auto_16130 ) ) ( not ( = ?auto_16118 ?auto_16120 ) ) ( not ( = ?auto_16118 ?auto_16125 ) ) ( not ( = ?auto_16118 ?auto_16131 ) ) ( not ( = ?auto_16118 ?auto_16135 ) ) ( not ( = ?auto_16118 ?auto_16121 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16112 ?auto_16111 ?auto_16110 )
      ( MAKE-1CRATE ?auto_16110 ?auto_16113 )
      ( MAKE-9CRATE-VERIFY ?auto_16104 ?auto_16105 ?auto_16106 ?auto_16107 ?auto_16108 ?auto_16109 ?auto_16112 ?auto_16111 ?auto_16110 ?auto_16113 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16138 - SURFACE
      ?auto_16139 - SURFACE
    )
    :vars
    (
      ?auto_16140 - HOIST
      ?auto_16141 - PLACE
      ?auto_16143 - PLACE
      ?auto_16144 - HOIST
      ?auto_16145 - SURFACE
      ?auto_16142 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16140 ?auto_16141 ) ( SURFACE-AT ?auto_16138 ?auto_16141 ) ( CLEAR ?auto_16138 ) ( IS-CRATE ?auto_16139 ) ( AVAILABLE ?auto_16140 ) ( not ( = ?auto_16143 ?auto_16141 ) ) ( HOIST-AT ?auto_16144 ?auto_16143 ) ( AVAILABLE ?auto_16144 ) ( SURFACE-AT ?auto_16139 ?auto_16143 ) ( ON ?auto_16139 ?auto_16145 ) ( CLEAR ?auto_16139 ) ( TRUCK-AT ?auto_16142 ?auto_16141 ) ( not ( = ?auto_16138 ?auto_16139 ) ) ( not ( = ?auto_16138 ?auto_16145 ) ) ( not ( = ?auto_16139 ?auto_16145 ) ) ( not ( = ?auto_16140 ?auto_16144 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16142 ?auto_16141 ?auto_16143 )
      ( !LIFT ?auto_16144 ?auto_16139 ?auto_16145 ?auto_16143 )
      ( !LOAD ?auto_16144 ?auto_16139 ?auto_16142 ?auto_16143 )
      ( !DRIVE ?auto_16142 ?auto_16143 ?auto_16141 )
      ( !UNLOAD ?auto_16140 ?auto_16139 ?auto_16142 ?auto_16141 )
      ( !DROP ?auto_16140 ?auto_16139 ?auto_16138 ?auto_16141 )
      ( MAKE-1CRATE-VERIFY ?auto_16138 ?auto_16139 ) )
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
      ?auto_16165 - SURFACE
      ?auto_16164 - SURFACE
      ?auto_16163 - SURFACE
      ?auto_16166 - SURFACE
      ?auto_16167 - SURFACE
    )
    :vars
    (
      ?auto_16169 - HOIST
      ?auto_16173 - PLACE
      ?auto_16172 - PLACE
      ?auto_16168 - HOIST
      ?auto_16170 - SURFACE
      ?auto_16174 - PLACE
      ?auto_16177 - HOIST
      ?auto_16190 - SURFACE
      ?auto_16181 - PLACE
      ?auto_16187 - HOIST
      ?auto_16188 - SURFACE
      ?auto_16185 - PLACE
      ?auto_16176 - HOIST
      ?auto_16180 - SURFACE
      ?auto_16186 - SURFACE
      ?auto_16178 - SURFACE
      ?auto_16175 - SURFACE
      ?auto_16183 - SURFACE
      ?auto_16189 - PLACE
      ?auto_16182 - HOIST
      ?auto_16184 - SURFACE
      ?auto_16179 - SURFACE
      ?auto_16171 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16169 ?auto_16173 ) ( IS-CRATE ?auto_16167 ) ( not ( = ?auto_16172 ?auto_16173 ) ) ( HOIST-AT ?auto_16168 ?auto_16172 ) ( SURFACE-AT ?auto_16167 ?auto_16172 ) ( ON ?auto_16167 ?auto_16170 ) ( CLEAR ?auto_16167 ) ( not ( = ?auto_16166 ?auto_16167 ) ) ( not ( = ?auto_16166 ?auto_16170 ) ) ( not ( = ?auto_16167 ?auto_16170 ) ) ( not ( = ?auto_16169 ?auto_16168 ) ) ( IS-CRATE ?auto_16166 ) ( not ( = ?auto_16174 ?auto_16173 ) ) ( HOIST-AT ?auto_16177 ?auto_16174 ) ( SURFACE-AT ?auto_16166 ?auto_16174 ) ( ON ?auto_16166 ?auto_16190 ) ( CLEAR ?auto_16166 ) ( not ( = ?auto_16163 ?auto_16166 ) ) ( not ( = ?auto_16163 ?auto_16190 ) ) ( not ( = ?auto_16166 ?auto_16190 ) ) ( not ( = ?auto_16169 ?auto_16177 ) ) ( IS-CRATE ?auto_16163 ) ( not ( = ?auto_16181 ?auto_16173 ) ) ( HOIST-AT ?auto_16187 ?auto_16181 ) ( SURFACE-AT ?auto_16163 ?auto_16181 ) ( ON ?auto_16163 ?auto_16188 ) ( CLEAR ?auto_16163 ) ( not ( = ?auto_16164 ?auto_16163 ) ) ( not ( = ?auto_16164 ?auto_16188 ) ) ( not ( = ?auto_16163 ?auto_16188 ) ) ( not ( = ?auto_16169 ?auto_16187 ) ) ( IS-CRATE ?auto_16164 ) ( not ( = ?auto_16185 ?auto_16173 ) ) ( HOIST-AT ?auto_16176 ?auto_16185 ) ( AVAILABLE ?auto_16176 ) ( SURFACE-AT ?auto_16164 ?auto_16185 ) ( ON ?auto_16164 ?auto_16180 ) ( CLEAR ?auto_16164 ) ( not ( = ?auto_16165 ?auto_16164 ) ) ( not ( = ?auto_16165 ?auto_16180 ) ) ( not ( = ?auto_16164 ?auto_16180 ) ) ( not ( = ?auto_16169 ?auto_16176 ) ) ( IS-CRATE ?auto_16165 ) ( AVAILABLE ?auto_16168 ) ( SURFACE-AT ?auto_16165 ?auto_16172 ) ( ON ?auto_16165 ?auto_16186 ) ( CLEAR ?auto_16165 ) ( not ( = ?auto_16162 ?auto_16165 ) ) ( not ( = ?auto_16162 ?auto_16186 ) ) ( not ( = ?auto_16165 ?auto_16186 ) ) ( IS-CRATE ?auto_16162 ) ( SURFACE-AT ?auto_16162 ?auto_16181 ) ( ON ?auto_16162 ?auto_16178 ) ( CLEAR ?auto_16162 ) ( not ( = ?auto_16161 ?auto_16162 ) ) ( not ( = ?auto_16161 ?auto_16178 ) ) ( not ( = ?auto_16162 ?auto_16178 ) ) ( IS-CRATE ?auto_16161 ) ( SURFACE-AT ?auto_16161 ?auto_16174 ) ( ON ?auto_16161 ?auto_16175 ) ( CLEAR ?auto_16161 ) ( not ( = ?auto_16160 ?auto_16161 ) ) ( not ( = ?auto_16160 ?auto_16175 ) ) ( not ( = ?auto_16161 ?auto_16175 ) ) ( IS-CRATE ?auto_16160 ) ( AVAILABLE ?auto_16187 ) ( SURFACE-AT ?auto_16160 ?auto_16181 ) ( ON ?auto_16160 ?auto_16183 ) ( CLEAR ?auto_16160 ) ( not ( = ?auto_16159 ?auto_16160 ) ) ( not ( = ?auto_16159 ?auto_16183 ) ) ( not ( = ?auto_16160 ?auto_16183 ) ) ( IS-CRATE ?auto_16159 ) ( not ( = ?auto_16189 ?auto_16173 ) ) ( HOIST-AT ?auto_16182 ?auto_16189 ) ( AVAILABLE ?auto_16182 ) ( SURFACE-AT ?auto_16159 ?auto_16189 ) ( ON ?auto_16159 ?auto_16184 ) ( CLEAR ?auto_16159 ) ( not ( = ?auto_16158 ?auto_16159 ) ) ( not ( = ?auto_16158 ?auto_16184 ) ) ( not ( = ?auto_16159 ?auto_16184 ) ) ( not ( = ?auto_16169 ?auto_16182 ) ) ( SURFACE-AT ?auto_16157 ?auto_16173 ) ( CLEAR ?auto_16157 ) ( IS-CRATE ?auto_16158 ) ( AVAILABLE ?auto_16169 ) ( AVAILABLE ?auto_16177 ) ( SURFACE-AT ?auto_16158 ?auto_16174 ) ( ON ?auto_16158 ?auto_16179 ) ( CLEAR ?auto_16158 ) ( TRUCK-AT ?auto_16171 ?auto_16173 ) ( not ( = ?auto_16157 ?auto_16158 ) ) ( not ( = ?auto_16157 ?auto_16179 ) ) ( not ( = ?auto_16158 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16159 ) ) ( not ( = ?auto_16157 ?auto_16184 ) ) ( not ( = ?auto_16159 ?auto_16179 ) ) ( not ( = ?auto_16189 ?auto_16174 ) ) ( not ( = ?auto_16182 ?auto_16177 ) ) ( not ( = ?auto_16184 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16160 ) ) ( not ( = ?auto_16157 ?auto_16183 ) ) ( not ( = ?auto_16158 ?auto_16160 ) ) ( not ( = ?auto_16158 ?auto_16183 ) ) ( not ( = ?auto_16160 ?auto_16184 ) ) ( not ( = ?auto_16160 ?auto_16179 ) ) ( not ( = ?auto_16181 ?auto_16189 ) ) ( not ( = ?auto_16181 ?auto_16174 ) ) ( not ( = ?auto_16187 ?auto_16182 ) ) ( not ( = ?auto_16187 ?auto_16177 ) ) ( not ( = ?auto_16183 ?auto_16184 ) ) ( not ( = ?auto_16183 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16161 ) ) ( not ( = ?auto_16157 ?auto_16175 ) ) ( not ( = ?auto_16158 ?auto_16161 ) ) ( not ( = ?auto_16158 ?auto_16175 ) ) ( not ( = ?auto_16159 ?auto_16161 ) ) ( not ( = ?auto_16159 ?auto_16175 ) ) ( not ( = ?auto_16161 ?auto_16183 ) ) ( not ( = ?auto_16161 ?auto_16184 ) ) ( not ( = ?auto_16161 ?auto_16179 ) ) ( not ( = ?auto_16175 ?auto_16183 ) ) ( not ( = ?auto_16175 ?auto_16184 ) ) ( not ( = ?auto_16175 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16162 ) ) ( not ( = ?auto_16157 ?auto_16178 ) ) ( not ( = ?auto_16158 ?auto_16162 ) ) ( not ( = ?auto_16158 ?auto_16178 ) ) ( not ( = ?auto_16159 ?auto_16162 ) ) ( not ( = ?auto_16159 ?auto_16178 ) ) ( not ( = ?auto_16160 ?auto_16162 ) ) ( not ( = ?auto_16160 ?auto_16178 ) ) ( not ( = ?auto_16162 ?auto_16175 ) ) ( not ( = ?auto_16162 ?auto_16183 ) ) ( not ( = ?auto_16162 ?auto_16184 ) ) ( not ( = ?auto_16162 ?auto_16179 ) ) ( not ( = ?auto_16178 ?auto_16175 ) ) ( not ( = ?auto_16178 ?auto_16183 ) ) ( not ( = ?auto_16178 ?auto_16184 ) ) ( not ( = ?auto_16178 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16165 ) ) ( not ( = ?auto_16157 ?auto_16186 ) ) ( not ( = ?auto_16158 ?auto_16165 ) ) ( not ( = ?auto_16158 ?auto_16186 ) ) ( not ( = ?auto_16159 ?auto_16165 ) ) ( not ( = ?auto_16159 ?auto_16186 ) ) ( not ( = ?auto_16160 ?auto_16165 ) ) ( not ( = ?auto_16160 ?auto_16186 ) ) ( not ( = ?auto_16161 ?auto_16165 ) ) ( not ( = ?auto_16161 ?auto_16186 ) ) ( not ( = ?auto_16165 ?auto_16178 ) ) ( not ( = ?auto_16165 ?auto_16175 ) ) ( not ( = ?auto_16165 ?auto_16183 ) ) ( not ( = ?auto_16165 ?auto_16184 ) ) ( not ( = ?auto_16165 ?auto_16179 ) ) ( not ( = ?auto_16172 ?auto_16181 ) ) ( not ( = ?auto_16172 ?auto_16174 ) ) ( not ( = ?auto_16172 ?auto_16189 ) ) ( not ( = ?auto_16168 ?auto_16187 ) ) ( not ( = ?auto_16168 ?auto_16177 ) ) ( not ( = ?auto_16168 ?auto_16182 ) ) ( not ( = ?auto_16186 ?auto_16178 ) ) ( not ( = ?auto_16186 ?auto_16175 ) ) ( not ( = ?auto_16186 ?auto_16183 ) ) ( not ( = ?auto_16186 ?auto_16184 ) ) ( not ( = ?auto_16186 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16164 ) ) ( not ( = ?auto_16157 ?auto_16180 ) ) ( not ( = ?auto_16158 ?auto_16164 ) ) ( not ( = ?auto_16158 ?auto_16180 ) ) ( not ( = ?auto_16159 ?auto_16164 ) ) ( not ( = ?auto_16159 ?auto_16180 ) ) ( not ( = ?auto_16160 ?auto_16164 ) ) ( not ( = ?auto_16160 ?auto_16180 ) ) ( not ( = ?auto_16161 ?auto_16164 ) ) ( not ( = ?auto_16161 ?auto_16180 ) ) ( not ( = ?auto_16162 ?auto_16164 ) ) ( not ( = ?auto_16162 ?auto_16180 ) ) ( not ( = ?auto_16164 ?auto_16186 ) ) ( not ( = ?auto_16164 ?auto_16178 ) ) ( not ( = ?auto_16164 ?auto_16175 ) ) ( not ( = ?auto_16164 ?auto_16183 ) ) ( not ( = ?auto_16164 ?auto_16184 ) ) ( not ( = ?auto_16164 ?auto_16179 ) ) ( not ( = ?auto_16185 ?auto_16172 ) ) ( not ( = ?auto_16185 ?auto_16181 ) ) ( not ( = ?auto_16185 ?auto_16174 ) ) ( not ( = ?auto_16185 ?auto_16189 ) ) ( not ( = ?auto_16176 ?auto_16168 ) ) ( not ( = ?auto_16176 ?auto_16187 ) ) ( not ( = ?auto_16176 ?auto_16177 ) ) ( not ( = ?auto_16176 ?auto_16182 ) ) ( not ( = ?auto_16180 ?auto_16186 ) ) ( not ( = ?auto_16180 ?auto_16178 ) ) ( not ( = ?auto_16180 ?auto_16175 ) ) ( not ( = ?auto_16180 ?auto_16183 ) ) ( not ( = ?auto_16180 ?auto_16184 ) ) ( not ( = ?auto_16180 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16163 ) ) ( not ( = ?auto_16157 ?auto_16188 ) ) ( not ( = ?auto_16158 ?auto_16163 ) ) ( not ( = ?auto_16158 ?auto_16188 ) ) ( not ( = ?auto_16159 ?auto_16163 ) ) ( not ( = ?auto_16159 ?auto_16188 ) ) ( not ( = ?auto_16160 ?auto_16163 ) ) ( not ( = ?auto_16160 ?auto_16188 ) ) ( not ( = ?auto_16161 ?auto_16163 ) ) ( not ( = ?auto_16161 ?auto_16188 ) ) ( not ( = ?auto_16162 ?auto_16163 ) ) ( not ( = ?auto_16162 ?auto_16188 ) ) ( not ( = ?auto_16165 ?auto_16163 ) ) ( not ( = ?auto_16165 ?auto_16188 ) ) ( not ( = ?auto_16163 ?auto_16180 ) ) ( not ( = ?auto_16163 ?auto_16186 ) ) ( not ( = ?auto_16163 ?auto_16178 ) ) ( not ( = ?auto_16163 ?auto_16175 ) ) ( not ( = ?auto_16163 ?auto_16183 ) ) ( not ( = ?auto_16163 ?auto_16184 ) ) ( not ( = ?auto_16163 ?auto_16179 ) ) ( not ( = ?auto_16188 ?auto_16180 ) ) ( not ( = ?auto_16188 ?auto_16186 ) ) ( not ( = ?auto_16188 ?auto_16178 ) ) ( not ( = ?auto_16188 ?auto_16175 ) ) ( not ( = ?auto_16188 ?auto_16183 ) ) ( not ( = ?auto_16188 ?auto_16184 ) ) ( not ( = ?auto_16188 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16166 ) ) ( not ( = ?auto_16157 ?auto_16190 ) ) ( not ( = ?auto_16158 ?auto_16166 ) ) ( not ( = ?auto_16158 ?auto_16190 ) ) ( not ( = ?auto_16159 ?auto_16166 ) ) ( not ( = ?auto_16159 ?auto_16190 ) ) ( not ( = ?auto_16160 ?auto_16166 ) ) ( not ( = ?auto_16160 ?auto_16190 ) ) ( not ( = ?auto_16161 ?auto_16166 ) ) ( not ( = ?auto_16161 ?auto_16190 ) ) ( not ( = ?auto_16162 ?auto_16166 ) ) ( not ( = ?auto_16162 ?auto_16190 ) ) ( not ( = ?auto_16165 ?auto_16166 ) ) ( not ( = ?auto_16165 ?auto_16190 ) ) ( not ( = ?auto_16164 ?auto_16166 ) ) ( not ( = ?auto_16164 ?auto_16190 ) ) ( not ( = ?auto_16166 ?auto_16188 ) ) ( not ( = ?auto_16166 ?auto_16180 ) ) ( not ( = ?auto_16166 ?auto_16186 ) ) ( not ( = ?auto_16166 ?auto_16178 ) ) ( not ( = ?auto_16166 ?auto_16175 ) ) ( not ( = ?auto_16166 ?auto_16183 ) ) ( not ( = ?auto_16166 ?auto_16184 ) ) ( not ( = ?auto_16166 ?auto_16179 ) ) ( not ( = ?auto_16190 ?auto_16188 ) ) ( not ( = ?auto_16190 ?auto_16180 ) ) ( not ( = ?auto_16190 ?auto_16186 ) ) ( not ( = ?auto_16190 ?auto_16178 ) ) ( not ( = ?auto_16190 ?auto_16175 ) ) ( not ( = ?auto_16190 ?auto_16183 ) ) ( not ( = ?auto_16190 ?auto_16184 ) ) ( not ( = ?auto_16190 ?auto_16179 ) ) ( not ( = ?auto_16157 ?auto_16167 ) ) ( not ( = ?auto_16157 ?auto_16170 ) ) ( not ( = ?auto_16158 ?auto_16167 ) ) ( not ( = ?auto_16158 ?auto_16170 ) ) ( not ( = ?auto_16159 ?auto_16167 ) ) ( not ( = ?auto_16159 ?auto_16170 ) ) ( not ( = ?auto_16160 ?auto_16167 ) ) ( not ( = ?auto_16160 ?auto_16170 ) ) ( not ( = ?auto_16161 ?auto_16167 ) ) ( not ( = ?auto_16161 ?auto_16170 ) ) ( not ( = ?auto_16162 ?auto_16167 ) ) ( not ( = ?auto_16162 ?auto_16170 ) ) ( not ( = ?auto_16165 ?auto_16167 ) ) ( not ( = ?auto_16165 ?auto_16170 ) ) ( not ( = ?auto_16164 ?auto_16167 ) ) ( not ( = ?auto_16164 ?auto_16170 ) ) ( not ( = ?auto_16163 ?auto_16167 ) ) ( not ( = ?auto_16163 ?auto_16170 ) ) ( not ( = ?auto_16167 ?auto_16190 ) ) ( not ( = ?auto_16167 ?auto_16188 ) ) ( not ( = ?auto_16167 ?auto_16180 ) ) ( not ( = ?auto_16167 ?auto_16186 ) ) ( not ( = ?auto_16167 ?auto_16178 ) ) ( not ( = ?auto_16167 ?auto_16175 ) ) ( not ( = ?auto_16167 ?auto_16183 ) ) ( not ( = ?auto_16167 ?auto_16184 ) ) ( not ( = ?auto_16167 ?auto_16179 ) ) ( not ( = ?auto_16170 ?auto_16190 ) ) ( not ( = ?auto_16170 ?auto_16188 ) ) ( not ( = ?auto_16170 ?auto_16180 ) ) ( not ( = ?auto_16170 ?auto_16186 ) ) ( not ( = ?auto_16170 ?auto_16178 ) ) ( not ( = ?auto_16170 ?auto_16175 ) ) ( not ( = ?auto_16170 ?auto_16183 ) ) ( not ( = ?auto_16170 ?auto_16184 ) ) ( not ( = ?auto_16170 ?auto_16179 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16165 ?auto_16164 ?auto_16163 ?auto_16166 )
      ( MAKE-1CRATE ?auto_16166 ?auto_16167 )
      ( MAKE-10CRATE-VERIFY ?auto_16157 ?auto_16158 ?auto_16159 ?auto_16160 ?auto_16161 ?auto_16162 ?auto_16165 ?auto_16164 ?auto_16163 ?auto_16166 ?auto_16167 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16193 - SURFACE
      ?auto_16194 - SURFACE
    )
    :vars
    (
      ?auto_16195 - HOIST
      ?auto_16196 - PLACE
      ?auto_16198 - PLACE
      ?auto_16199 - HOIST
      ?auto_16200 - SURFACE
      ?auto_16197 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16195 ?auto_16196 ) ( SURFACE-AT ?auto_16193 ?auto_16196 ) ( CLEAR ?auto_16193 ) ( IS-CRATE ?auto_16194 ) ( AVAILABLE ?auto_16195 ) ( not ( = ?auto_16198 ?auto_16196 ) ) ( HOIST-AT ?auto_16199 ?auto_16198 ) ( AVAILABLE ?auto_16199 ) ( SURFACE-AT ?auto_16194 ?auto_16198 ) ( ON ?auto_16194 ?auto_16200 ) ( CLEAR ?auto_16194 ) ( TRUCK-AT ?auto_16197 ?auto_16196 ) ( not ( = ?auto_16193 ?auto_16194 ) ) ( not ( = ?auto_16193 ?auto_16200 ) ) ( not ( = ?auto_16194 ?auto_16200 ) ) ( not ( = ?auto_16195 ?auto_16199 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16197 ?auto_16196 ?auto_16198 )
      ( !LIFT ?auto_16199 ?auto_16194 ?auto_16200 ?auto_16198 )
      ( !LOAD ?auto_16199 ?auto_16194 ?auto_16197 ?auto_16198 )
      ( !DRIVE ?auto_16197 ?auto_16198 ?auto_16196 )
      ( !UNLOAD ?auto_16195 ?auto_16194 ?auto_16197 ?auto_16196 )
      ( !DROP ?auto_16195 ?auto_16194 ?auto_16193 ?auto_16196 )
      ( MAKE-1CRATE-VERIFY ?auto_16193 ?auto_16194 ) )
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
      ?auto_16221 - SURFACE
      ?auto_16220 - SURFACE
      ?auto_16219 - SURFACE
      ?auto_16222 - SURFACE
      ?auto_16224 - SURFACE
      ?auto_16223 - SURFACE
    )
    :vars
    (
      ?auto_16230 - HOIST
      ?auto_16225 - PLACE
      ?auto_16227 - PLACE
      ?auto_16228 - HOIST
      ?auto_16226 - SURFACE
      ?auto_16249 - PLACE
      ?auto_16250 - HOIST
      ?auto_16247 - SURFACE
      ?auto_16235 - PLACE
      ?auto_16236 - HOIST
      ?auto_16238 - SURFACE
      ?auto_16232 - PLACE
      ?auto_16245 - HOIST
      ?auto_16231 - SURFACE
      ?auto_16237 - PLACE
      ?auto_16239 - HOIST
      ?auto_16246 - SURFACE
      ?auto_16248 - SURFACE
      ?auto_16240 - SURFACE
      ?auto_16244 - SURFACE
      ?auto_16241 - SURFACE
      ?auto_16243 - PLACE
      ?auto_16233 - HOIST
      ?auto_16242 - SURFACE
      ?auto_16234 - SURFACE
      ?auto_16229 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16230 ?auto_16225 ) ( IS-CRATE ?auto_16223 ) ( not ( = ?auto_16227 ?auto_16225 ) ) ( HOIST-AT ?auto_16228 ?auto_16227 ) ( AVAILABLE ?auto_16228 ) ( SURFACE-AT ?auto_16223 ?auto_16227 ) ( ON ?auto_16223 ?auto_16226 ) ( CLEAR ?auto_16223 ) ( not ( = ?auto_16224 ?auto_16223 ) ) ( not ( = ?auto_16224 ?auto_16226 ) ) ( not ( = ?auto_16223 ?auto_16226 ) ) ( not ( = ?auto_16230 ?auto_16228 ) ) ( IS-CRATE ?auto_16224 ) ( not ( = ?auto_16249 ?auto_16225 ) ) ( HOIST-AT ?auto_16250 ?auto_16249 ) ( SURFACE-AT ?auto_16224 ?auto_16249 ) ( ON ?auto_16224 ?auto_16247 ) ( CLEAR ?auto_16224 ) ( not ( = ?auto_16222 ?auto_16224 ) ) ( not ( = ?auto_16222 ?auto_16247 ) ) ( not ( = ?auto_16224 ?auto_16247 ) ) ( not ( = ?auto_16230 ?auto_16250 ) ) ( IS-CRATE ?auto_16222 ) ( not ( = ?auto_16235 ?auto_16225 ) ) ( HOIST-AT ?auto_16236 ?auto_16235 ) ( SURFACE-AT ?auto_16222 ?auto_16235 ) ( ON ?auto_16222 ?auto_16238 ) ( CLEAR ?auto_16222 ) ( not ( = ?auto_16219 ?auto_16222 ) ) ( not ( = ?auto_16219 ?auto_16238 ) ) ( not ( = ?auto_16222 ?auto_16238 ) ) ( not ( = ?auto_16230 ?auto_16236 ) ) ( IS-CRATE ?auto_16219 ) ( not ( = ?auto_16232 ?auto_16225 ) ) ( HOIST-AT ?auto_16245 ?auto_16232 ) ( SURFACE-AT ?auto_16219 ?auto_16232 ) ( ON ?auto_16219 ?auto_16231 ) ( CLEAR ?auto_16219 ) ( not ( = ?auto_16220 ?auto_16219 ) ) ( not ( = ?auto_16220 ?auto_16231 ) ) ( not ( = ?auto_16219 ?auto_16231 ) ) ( not ( = ?auto_16230 ?auto_16245 ) ) ( IS-CRATE ?auto_16220 ) ( not ( = ?auto_16237 ?auto_16225 ) ) ( HOIST-AT ?auto_16239 ?auto_16237 ) ( AVAILABLE ?auto_16239 ) ( SURFACE-AT ?auto_16220 ?auto_16237 ) ( ON ?auto_16220 ?auto_16246 ) ( CLEAR ?auto_16220 ) ( not ( = ?auto_16221 ?auto_16220 ) ) ( not ( = ?auto_16221 ?auto_16246 ) ) ( not ( = ?auto_16220 ?auto_16246 ) ) ( not ( = ?auto_16230 ?auto_16239 ) ) ( IS-CRATE ?auto_16221 ) ( AVAILABLE ?auto_16250 ) ( SURFACE-AT ?auto_16221 ?auto_16249 ) ( ON ?auto_16221 ?auto_16248 ) ( CLEAR ?auto_16221 ) ( not ( = ?auto_16218 ?auto_16221 ) ) ( not ( = ?auto_16218 ?auto_16248 ) ) ( not ( = ?auto_16221 ?auto_16248 ) ) ( IS-CRATE ?auto_16218 ) ( SURFACE-AT ?auto_16218 ?auto_16232 ) ( ON ?auto_16218 ?auto_16240 ) ( CLEAR ?auto_16218 ) ( not ( = ?auto_16217 ?auto_16218 ) ) ( not ( = ?auto_16217 ?auto_16240 ) ) ( not ( = ?auto_16218 ?auto_16240 ) ) ( IS-CRATE ?auto_16217 ) ( SURFACE-AT ?auto_16217 ?auto_16235 ) ( ON ?auto_16217 ?auto_16244 ) ( CLEAR ?auto_16217 ) ( not ( = ?auto_16216 ?auto_16217 ) ) ( not ( = ?auto_16216 ?auto_16244 ) ) ( not ( = ?auto_16217 ?auto_16244 ) ) ( IS-CRATE ?auto_16216 ) ( AVAILABLE ?auto_16245 ) ( SURFACE-AT ?auto_16216 ?auto_16232 ) ( ON ?auto_16216 ?auto_16241 ) ( CLEAR ?auto_16216 ) ( not ( = ?auto_16215 ?auto_16216 ) ) ( not ( = ?auto_16215 ?auto_16241 ) ) ( not ( = ?auto_16216 ?auto_16241 ) ) ( IS-CRATE ?auto_16215 ) ( not ( = ?auto_16243 ?auto_16225 ) ) ( HOIST-AT ?auto_16233 ?auto_16243 ) ( AVAILABLE ?auto_16233 ) ( SURFACE-AT ?auto_16215 ?auto_16243 ) ( ON ?auto_16215 ?auto_16242 ) ( CLEAR ?auto_16215 ) ( not ( = ?auto_16214 ?auto_16215 ) ) ( not ( = ?auto_16214 ?auto_16242 ) ) ( not ( = ?auto_16215 ?auto_16242 ) ) ( not ( = ?auto_16230 ?auto_16233 ) ) ( SURFACE-AT ?auto_16213 ?auto_16225 ) ( CLEAR ?auto_16213 ) ( IS-CRATE ?auto_16214 ) ( AVAILABLE ?auto_16230 ) ( AVAILABLE ?auto_16236 ) ( SURFACE-AT ?auto_16214 ?auto_16235 ) ( ON ?auto_16214 ?auto_16234 ) ( CLEAR ?auto_16214 ) ( TRUCK-AT ?auto_16229 ?auto_16225 ) ( not ( = ?auto_16213 ?auto_16214 ) ) ( not ( = ?auto_16213 ?auto_16234 ) ) ( not ( = ?auto_16214 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16215 ) ) ( not ( = ?auto_16213 ?auto_16242 ) ) ( not ( = ?auto_16215 ?auto_16234 ) ) ( not ( = ?auto_16243 ?auto_16235 ) ) ( not ( = ?auto_16233 ?auto_16236 ) ) ( not ( = ?auto_16242 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16216 ) ) ( not ( = ?auto_16213 ?auto_16241 ) ) ( not ( = ?auto_16214 ?auto_16216 ) ) ( not ( = ?auto_16214 ?auto_16241 ) ) ( not ( = ?auto_16216 ?auto_16242 ) ) ( not ( = ?auto_16216 ?auto_16234 ) ) ( not ( = ?auto_16232 ?auto_16243 ) ) ( not ( = ?auto_16232 ?auto_16235 ) ) ( not ( = ?auto_16245 ?auto_16233 ) ) ( not ( = ?auto_16245 ?auto_16236 ) ) ( not ( = ?auto_16241 ?auto_16242 ) ) ( not ( = ?auto_16241 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16217 ) ) ( not ( = ?auto_16213 ?auto_16244 ) ) ( not ( = ?auto_16214 ?auto_16217 ) ) ( not ( = ?auto_16214 ?auto_16244 ) ) ( not ( = ?auto_16215 ?auto_16217 ) ) ( not ( = ?auto_16215 ?auto_16244 ) ) ( not ( = ?auto_16217 ?auto_16241 ) ) ( not ( = ?auto_16217 ?auto_16242 ) ) ( not ( = ?auto_16217 ?auto_16234 ) ) ( not ( = ?auto_16244 ?auto_16241 ) ) ( not ( = ?auto_16244 ?auto_16242 ) ) ( not ( = ?auto_16244 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16218 ) ) ( not ( = ?auto_16213 ?auto_16240 ) ) ( not ( = ?auto_16214 ?auto_16218 ) ) ( not ( = ?auto_16214 ?auto_16240 ) ) ( not ( = ?auto_16215 ?auto_16218 ) ) ( not ( = ?auto_16215 ?auto_16240 ) ) ( not ( = ?auto_16216 ?auto_16218 ) ) ( not ( = ?auto_16216 ?auto_16240 ) ) ( not ( = ?auto_16218 ?auto_16244 ) ) ( not ( = ?auto_16218 ?auto_16241 ) ) ( not ( = ?auto_16218 ?auto_16242 ) ) ( not ( = ?auto_16218 ?auto_16234 ) ) ( not ( = ?auto_16240 ?auto_16244 ) ) ( not ( = ?auto_16240 ?auto_16241 ) ) ( not ( = ?auto_16240 ?auto_16242 ) ) ( not ( = ?auto_16240 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16221 ) ) ( not ( = ?auto_16213 ?auto_16248 ) ) ( not ( = ?auto_16214 ?auto_16221 ) ) ( not ( = ?auto_16214 ?auto_16248 ) ) ( not ( = ?auto_16215 ?auto_16221 ) ) ( not ( = ?auto_16215 ?auto_16248 ) ) ( not ( = ?auto_16216 ?auto_16221 ) ) ( not ( = ?auto_16216 ?auto_16248 ) ) ( not ( = ?auto_16217 ?auto_16221 ) ) ( not ( = ?auto_16217 ?auto_16248 ) ) ( not ( = ?auto_16221 ?auto_16240 ) ) ( not ( = ?auto_16221 ?auto_16244 ) ) ( not ( = ?auto_16221 ?auto_16241 ) ) ( not ( = ?auto_16221 ?auto_16242 ) ) ( not ( = ?auto_16221 ?auto_16234 ) ) ( not ( = ?auto_16249 ?auto_16232 ) ) ( not ( = ?auto_16249 ?auto_16235 ) ) ( not ( = ?auto_16249 ?auto_16243 ) ) ( not ( = ?auto_16250 ?auto_16245 ) ) ( not ( = ?auto_16250 ?auto_16236 ) ) ( not ( = ?auto_16250 ?auto_16233 ) ) ( not ( = ?auto_16248 ?auto_16240 ) ) ( not ( = ?auto_16248 ?auto_16244 ) ) ( not ( = ?auto_16248 ?auto_16241 ) ) ( not ( = ?auto_16248 ?auto_16242 ) ) ( not ( = ?auto_16248 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16220 ) ) ( not ( = ?auto_16213 ?auto_16246 ) ) ( not ( = ?auto_16214 ?auto_16220 ) ) ( not ( = ?auto_16214 ?auto_16246 ) ) ( not ( = ?auto_16215 ?auto_16220 ) ) ( not ( = ?auto_16215 ?auto_16246 ) ) ( not ( = ?auto_16216 ?auto_16220 ) ) ( not ( = ?auto_16216 ?auto_16246 ) ) ( not ( = ?auto_16217 ?auto_16220 ) ) ( not ( = ?auto_16217 ?auto_16246 ) ) ( not ( = ?auto_16218 ?auto_16220 ) ) ( not ( = ?auto_16218 ?auto_16246 ) ) ( not ( = ?auto_16220 ?auto_16248 ) ) ( not ( = ?auto_16220 ?auto_16240 ) ) ( not ( = ?auto_16220 ?auto_16244 ) ) ( not ( = ?auto_16220 ?auto_16241 ) ) ( not ( = ?auto_16220 ?auto_16242 ) ) ( not ( = ?auto_16220 ?auto_16234 ) ) ( not ( = ?auto_16237 ?auto_16249 ) ) ( not ( = ?auto_16237 ?auto_16232 ) ) ( not ( = ?auto_16237 ?auto_16235 ) ) ( not ( = ?auto_16237 ?auto_16243 ) ) ( not ( = ?auto_16239 ?auto_16250 ) ) ( not ( = ?auto_16239 ?auto_16245 ) ) ( not ( = ?auto_16239 ?auto_16236 ) ) ( not ( = ?auto_16239 ?auto_16233 ) ) ( not ( = ?auto_16246 ?auto_16248 ) ) ( not ( = ?auto_16246 ?auto_16240 ) ) ( not ( = ?auto_16246 ?auto_16244 ) ) ( not ( = ?auto_16246 ?auto_16241 ) ) ( not ( = ?auto_16246 ?auto_16242 ) ) ( not ( = ?auto_16246 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16219 ) ) ( not ( = ?auto_16213 ?auto_16231 ) ) ( not ( = ?auto_16214 ?auto_16219 ) ) ( not ( = ?auto_16214 ?auto_16231 ) ) ( not ( = ?auto_16215 ?auto_16219 ) ) ( not ( = ?auto_16215 ?auto_16231 ) ) ( not ( = ?auto_16216 ?auto_16219 ) ) ( not ( = ?auto_16216 ?auto_16231 ) ) ( not ( = ?auto_16217 ?auto_16219 ) ) ( not ( = ?auto_16217 ?auto_16231 ) ) ( not ( = ?auto_16218 ?auto_16219 ) ) ( not ( = ?auto_16218 ?auto_16231 ) ) ( not ( = ?auto_16221 ?auto_16219 ) ) ( not ( = ?auto_16221 ?auto_16231 ) ) ( not ( = ?auto_16219 ?auto_16246 ) ) ( not ( = ?auto_16219 ?auto_16248 ) ) ( not ( = ?auto_16219 ?auto_16240 ) ) ( not ( = ?auto_16219 ?auto_16244 ) ) ( not ( = ?auto_16219 ?auto_16241 ) ) ( not ( = ?auto_16219 ?auto_16242 ) ) ( not ( = ?auto_16219 ?auto_16234 ) ) ( not ( = ?auto_16231 ?auto_16246 ) ) ( not ( = ?auto_16231 ?auto_16248 ) ) ( not ( = ?auto_16231 ?auto_16240 ) ) ( not ( = ?auto_16231 ?auto_16244 ) ) ( not ( = ?auto_16231 ?auto_16241 ) ) ( not ( = ?auto_16231 ?auto_16242 ) ) ( not ( = ?auto_16231 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16222 ) ) ( not ( = ?auto_16213 ?auto_16238 ) ) ( not ( = ?auto_16214 ?auto_16222 ) ) ( not ( = ?auto_16214 ?auto_16238 ) ) ( not ( = ?auto_16215 ?auto_16222 ) ) ( not ( = ?auto_16215 ?auto_16238 ) ) ( not ( = ?auto_16216 ?auto_16222 ) ) ( not ( = ?auto_16216 ?auto_16238 ) ) ( not ( = ?auto_16217 ?auto_16222 ) ) ( not ( = ?auto_16217 ?auto_16238 ) ) ( not ( = ?auto_16218 ?auto_16222 ) ) ( not ( = ?auto_16218 ?auto_16238 ) ) ( not ( = ?auto_16221 ?auto_16222 ) ) ( not ( = ?auto_16221 ?auto_16238 ) ) ( not ( = ?auto_16220 ?auto_16222 ) ) ( not ( = ?auto_16220 ?auto_16238 ) ) ( not ( = ?auto_16222 ?auto_16231 ) ) ( not ( = ?auto_16222 ?auto_16246 ) ) ( not ( = ?auto_16222 ?auto_16248 ) ) ( not ( = ?auto_16222 ?auto_16240 ) ) ( not ( = ?auto_16222 ?auto_16244 ) ) ( not ( = ?auto_16222 ?auto_16241 ) ) ( not ( = ?auto_16222 ?auto_16242 ) ) ( not ( = ?auto_16222 ?auto_16234 ) ) ( not ( = ?auto_16238 ?auto_16231 ) ) ( not ( = ?auto_16238 ?auto_16246 ) ) ( not ( = ?auto_16238 ?auto_16248 ) ) ( not ( = ?auto_16238 ?auto_16240 ) ) ( not ( = ?auto_16238 ?auto_16244 ) ) ( not ( = ?auto_16238 ?auto_16241 ) ) ( not ( = ?auto_16238 ?auto_16242 ) ) ( not ( = ?auto_16238 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16224 ) ) ( not ( = ?auto_16213 ?auto_16247 ) ) ( not ( = ?auto_16214 ?auto_16224 ) ) ( not ( = ?auto_16214 ?auto_16247 ) ) ( not ( = ?auto_16215 ?auto_16224 ) ) ( not ( = ?auto_16215 ?auto_16247 ) ) ( not ( = ?auto_16216 ?auto_16224 ) ) ( not ( = ?auto_16216 ?auto_16247 ) ) ( not ( = ?auto_16217 ?auto_16224 ) ) ( not ( = ?auto_16217 ?auto_16247 ) ) ( not ( = ?auto_16218 ?auto_16224 ) ) ( not ( = ?auto_16218 ?auto_16247 ) ) ( not ( = ?auto_16221 ?auto_16224 ) ) ( not ( = ?auto_16221 ?auto_16247 ) ) ( not ( = ?auto_16220 ?auto_16224 ) ) ( not ( = ?auto_16220 ?auto_16247 ) ) ( not ( = ?auto_16219 ?auto_16224 ) ) ( not ( = ?auto_16219 ?auto_16247 ) ) ( not ( = ?auto_16224 ?auto_16238 ) ) ( not ( = ?auto_16224 ?auto_16231 ) ) ( not ( = ?auto_16224 ?auto_16246 ) ) ( not ( = ?auto_16224 ?auto_16248 ) ) ( not ( = ?auto_16224 ?auto_16240 ) ) ( not ( = ?auto_16224 ?auto_16244 ) ) ( not ( = ?auto_16224 ?auto_16241 ) ) ( not ( = ?auto_16224 ?auto_16242 ) ) ( not ( = ?auto_16224 ?auto_16234 ) ) ( not ( = ?auto_16247 ?auto_16238 ) ) ( not ( = ?auto_16247 ?auto_16231 ) ) ( not ( = ?auto_16247 ?auto_16246 ) ) ( not ( = ?auto_16247 ?auto_16248 ) ) ( not ( = ?auto_16247 ?auto_16240 ) ) ( not ( = ?auto_16247 ?auto_16244 ) ) ( not ( = ?auto_16247 ?auto_16241 ) ) ( not ( = ?auto_16247 ?auto_16242 ) ) ( not ( = ?auto_16247 ?auto_16234 ) ) ( not ( = ?auto_16213 ?auto_16223 ) ) ( not ( = ?auto_16213 ?auto_16226 ) ) ( not ( = ?auto_16214 ?auto_16223 ) ) ( not ( = ?auto_16214 ?auto_16226 ) ) ( not ( = ?auto_16215 ?auto_16223 ) ) ( not ( = ?auto_16215 ?auto_16226 ) ) ( not ( = ?auto_16216 ?auto_16223 ) ) ( not ( = ?auto_16216 ?auto_16226 ) ) ( not ( = ?auto_16217 ?auto_16223 ) ) ( not ( = ?auto_16217 ?auto_16226 ) ) ( not ( = ?auto_16218 ?auto_16223 ) ) ( not ( = ?auto_16218 ?auto_16226 ) ) ( not ( = ?auto_16221 ?auto_16223 ) ) ( not ( = ?auto_16221 ?auto_16226 ) ) ( not ( = ?auto_16220 ?auto_16223 ) ) ( not ( = ?auto_16220 ?auto_16226 ) ) ( not ( = ?auto_16219 ?auto_16223 ) ) ( not ( = ?auto_16219 ?auto_16226 ) ) ( not ( = ?auto_16222 ?auto_16223 ) ) ( not ( = ?auto_16222 ?auto_16226 ) ) ( not ( = ?auto_16223 ?auto_16247 ) ) ( not ( = ?auto_16223 ?auto_16238 ) ) ( not ( = ?auto_16223 ?auto_16231 ) ) ( not ( = ?auto_16223 ?auto_16246 ) ) ( not ( = ?auto_16223 ?auto_16248 ) ) ( not ( = ?auto_16223 ?auto_16240 ) ) ( not ( = ?auto_16223 ?auto_16244 ) ) ( not ( = ?auto_16223 ?auto_16241 ) ) ( not ( = ?auto_16223 ?auto_16242 ) ) ( not ( = ?auto_16223 ?auto_16234 ) ) ( not ( = ?auto_16227 ?auto_16249 ) ) ( not ( = ?auto_16227 ?auto_16235 ) ) ( not ( = ?auto_16227 ?auto_16232 ) ) ( not ( = ?auto_16227 ?auto_16237 ) ) ( not ( = ?auto_16227 ?auto_16243 ) ) ( not ( = ?auto_16228 ?auto_16250 ) ) ( not ( = ?auto_16228 ?auto_16236 ) ) ( not ( = ?auto_16228 ?auto_16245 ) ) ( not ( = ?auto_16228 ?auto_16239 ) ) ( not ( = ?auto_16228 ?auto_16233 ) ) ( not ( = ?auto_16226 ?auto_16247 ) ) ( not ( = ?auto_16226 ?auto_16238 ) ) ( not ( = ?auto_16226 ?auto_16231 ) ) ( not ( = ?auto_16226 ?auto_16246 ) ) ( not ( = ?auto_16226 ?auto_16248 ) ) ( not ( = ?auto_16226 ?auto_16240 ) ) ( not ( = ?auto_16226 ?auto_16244 ) ) ( not ( = ?auto_16226 ?auto_16241 ) ) ( not ( = ?auto_16226 ?auto_16242 ) ) ( not ( = ?auto_16226 ?auto_16234 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_16213 ?auto_16214 ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ?auto_16221 ?auto_16220 ?auto_16219 ?auto_16222 ?auto_16224 )
      ( MAKE-1CRATE ?auto_16224 ?auto_16223 )
      ( MAKE-11CRATE-VERIFY ?auto_16213 ?auto_16214 ?auto_16215 ?auto_16216 ?auto_16217 ?auto_16218 ?auto_16221 ?auto_16220 ?auto_16219 ?auto_16222 ?auto_16224 ?auto_16223 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16253 - SURFACE
      ?auto_16254 - SURFACE
    )
    :vars
    (
      ?auto_16255 - HOIST
      ?auto_16256 - PLACE
      ?auto_16258 - PLACE
      ?auto_16259 - HOIST
      ?auto_16260 - SURFACE
      ?auto_16257 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16255 ?auto_16256 ) ( SURFACE-AT ?auto_16253 ?auto_16256 ) ( CLEAR ?auto_16253 ) ( IS-CRATE ?auto_16254 ) ( AVAILABLE ?auto_16255 ) ( not ( = ?auto_16258 ?auto_16256 ) ) ( HOIST-AT ?auto_16259 ?auto_16258 ) ( AVAILABLE ?auto_16259 ) ( SURFACE-AT ?auto_16254 ?auto_16258 ) ( ON ?auto_16254 ?auto_16260 ) ( CLEAR ?auto_16254 ) ( TRUCK-AT ?auto_16257 ?auto_16256 ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16260 ) ) ( not ( = ?auto_16254 ?auto_16260 ) ) ( not ( = ?auto_16255 ?auto_16259 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16257 ?auto_16256 ?auto_16258 )
      ( !LIFT ?auto_16259 ?auto_16254 ?auto_16260 ?auto_16258 )
      ( !LOAD ?auto_16259 ?auto_16254 ?auto_16257 ?auto_16258 )
      ( !DRIVE ?auto_16257 ?auto_16258 ?auto_16256 )
      ( !UNLOAD ?auto_16255 ?auto_16254 ?auto_16257 ?auto_16256 )
      ( !DROP ?auto_16255 ?auto_16254 ?auto_16253 ?auto_16256 )
      ( MAKE-1CRATE-VERIFY ?auto_16253 ?auto_16254 ) )
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
      ?auto_16282 - SURFACE
      ?auto_16281 - SURFACE
      ?auto_16280 - SURFACE
      ?auto_16283 - SURFACE
      ?auto_16285 - SURFACE
      ?auto_16284 - SURFACE
      ?auto_16286 - SURFACE
    )
    :vars
    (
      ?auto_16288 - HOIST
      ?auto_16289 - PLACE
      ?auto_16291 - PLACE
      ?auto_16292 - HOIST
      ?auto_16287 - SURFACE
      ?auto_16305 - PLACE
      ?auto_16297 - HOIST
      ?auto_16313 - SURFACE
      ?auto_16293 - PLACE
      ?auto_16300 - HOIST
      ?auto_16307 - SURFACE
      ?auto_16310 - SURFACE
      ?auto_16295 - PLACE
      ?auto_16299 - HOIST
      ?auto_16301 - SURFACE
      ?auto_16309 - PLACE
      ?auto_16312 - HOIST
      ?auto_16298 - SURFACE
      ?auto_16308 - SURFACE
      ?auto_16303 - SURFACE
      ?auto_16296 - SURFACE
      ?auto_16302 - SURFACE
      ?auto_16311 - PLACE
      ?auto_16306 - HOIST
      ?auto_16304 - SURFACE
      ?auto_16294 - SURFACE
      ?auto_16290 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16288 ?auto_16289 ) ( IS-CRATE ?auto_16286 ) ( not ( = ?auto_16291 ?auto_16289 ) ) ( HOIST-AT ?auto_16292 ?auto_16291 ) ( SURFACE-AT ?auto_16286 ?auto_16291 ) ( ON ?auto_16286 ?auto_16287 ) ( CLEAR ?auto_16286 ) ( not ( = ?auto_16284 ?auto_16286 ) ) ( not ( = ?auto_16284 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16287 ) ) ( not ( = ?auto_16288 ?auto_16292 ) ) ( IS-CRATE ?auto_16284 ) ( not ( = ?auto_16305 ?auto_16289 ) ) ( HOIST-AT ?auto_16297 ?auto_16305 ) ( AVAILABLE ?auto_16297 ) ( SURFACE-AT ?auto_16284 ?auto_16305 ) ( ON ?auto_16284 ?auto_16313 ) ( CLEAR ?auto_16284 ) ( not ( = ?auto_16285 ?auto_16284 ) ) ( not ( = ?auto_16285 ?auto_16313 ) ) ( not ( = ?auto_16284 ?auto_16313 ) ) ( not ( = ?auto_16288 ?auto_16297 ) ) ( IS-CRATE ?auto_16285 ) ( not ( = ?auto_16293 ?auto_16289 ) ) ( HOIST-AT ?auto_16300 ?auto_16293 ) ( SURFACE-AT ?auto_16285 ?auto_16293 ) ( ON ?auto_16285 ?auto_16307 ) ( CLEAR ?auto_16285 ) ( not ( = ?auto_16283 ?auto_16285 ) ) ( not ( = ?auto_16283 ?auto_16307 ) ) ( not ( = ?auto_16285 ?auto_16307 ) ) ( not ( = ?auto_16288 ?auto_16300 ) ) ( IS-CRATE ?auto_16283 ) ( SURFACE-AT ?auto_16283 ?auto_16291 ) ( ON ?auto_16283 ?auto_16310 ) ( CLEAR ?auto_16283 ) ( not ( = ?auto_16280 ?auto_16283 ) ) ( not ( = ?auto_16280 ?auto_16310 ) ) ( not ( = ?auto_16283 ?auto_16310 ) ) ( IS-CRATE ?auto_16280 ) ( not ( = ?auto_16295 ?auto_16289 ) ) ( HOIST-AT ?auto_16299 ?auto_16295 ) ( SURFACE-AT ?auto_16280 ?auto_16295 ) ( ON ?auto_16280 ?auto_16301 ) ( CLEAR ?auto_16280 ) ( not ( = ?auto_16281 ?auto_16280 ) ) ( not ( = ?auto_16281 ?auto_16301 ) ) ( not ( = ?auto_16280 ?auto_16301 ) ) ( not ( = ?auto_16288 ?auto_16299 ) ) ( IS-CRATE ?auto_16281 ) ( not ( = ?auto_16309 ?auto_16289 ) ) ( HOIST-AT ?auto_16312 ?auto_16309 ) ( AVAILABLE ?auto_16312 ) ( SURFACE-AT ?auto_16281 ?auto_16309 ) ( ON ?auto_16281 ?auto_16298 ) ( CLEAR ?auto_16281 ) ( not ( = ?auto_16282 ?auto_16281 ) ) ( not ( = ?auto_16282 ?auto_16298 ) ) ( not ( = ?auto_16281 ?auto_16298 ) ) ( not ( = ?auto_16288 ?auto_16312 ) ) ( IS-CRATE ?auto_16282 ) ( AVAILABLE ?auto_16300 ) ( SURFACE-AT ?auto_16282 ?auto_16293 ) ( ON ?auto_16282 ?auto_16308 ) ( CLEAR ?auto_16282 ) ( not ( = ?auto_16279 ?auto_16282 ) ) ( not ( = ?auto_16279 ?auto_16308 ) ) ( not ( = ?auto_16282 ?auto_16308 ) ) ( IS-CRATE ?auto_16279 ) ( SURFACE-AT ?auto_16279 ?auto_16295 ) ( ON ?auto_16279 ?auto_16303 ) ( CLEAR ?auto_16279 ) ( not ( = ?auto_16278 ?auto_16279 ) ) ( not ( = ?auto_16278 ?auto_16303 ) ) ( not ( = ?auto_16279 ?auto_16303 ) ) ( IS-CRATE ?auto_16278 ) ( SURFACE-AT ?auto_16278 ?auto_16291 ) ( ON ?auto_16278 ?auto_16296 ) ( CLEAR ?auto_16278 ) ( not ( = ?auto_16277 ?auto_16278 ) ) ( not ( = ?auto_16277 ?auto_16296 ) ) ( not ( = ?auto_16278 ?auto_16296 ) ) ( IS-CRATE ?auto_16277 ) ( AVAILABLE ?auto_16299 ) ( SURFACE-AT ?auto_16277 ?auto_16295 ) ( ON ?auto_16277 ?auto_16302 ) ( CLEAR ?auto_16277 ) ( not ( = ?auto_16276 ?auto_16277 ) ) ( not ( = ?auto_16276 ?auto_16302 ) ) ( not ( = ?auto_16277 ?auto_16302 ) ) ( IS-CRATE ?auto_16276 ) ( not ( = ?auto_16311 ?auto_16289 ) ) ( HOIST-AT ?auto_16306 ?auto_16311 ) ( AVAILABLE ?auto_16306 ) ( SURFACE-AT ?auto_16276 ?auto_16311 ) ( ON ?auto_16276 ?auto_16304 ) ( CLEAR ?auto_16276 ) ( not ( = ?auto_16275 ?auto_16276 ) ) ( not ( = ?auto_16275 ?auto_16304 ) ) ( not ( = ?auto_16276 ?auto_16304 ) ) ( not ( = ?auto_16288 ?auto_16306 ) ) ( SURFACE-AT ?auto_16274 ?auto_16289 ) ( CLEAR ?auto_16274 ) ( IS-CRATE ?auto_16275 ) ( AVAILABLE ?auto_16288 ) ( AVAILABLE ?auto_16292 ) ( SURFACE-AT ?auto_16275 ?auto_16291 ) ( ON ?auto_16275 ?auto_16294 ) ( CLEAR ?auto_16275 ) ( TRUCK-AT ?auto_16290 ?auto_16289 ) ( not ( = ?auto_16274 ?auto_16275 ) ) ( not ( = ?auto_16274 ?auto_16294 ) ) ( not ( = ?auto_16275 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16276 ) ) ( not ( = ?auto_16274 ?auto_16304 ) ) ( not ( = ?auto_16276 ?auto_16294 ) ) ( not ( = ?auto_16311 ?auto_16291 ) ) ( not ( = ?auto_16306 ?auto_16292 ) ) ( not ( = ?auto_16304 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16277 ) ) ( not ( = ?auto_16274 ?auto_16302 ) ) ( not ( = ?auto_16275 ?auto_16277 ) ) ( not ( = ?auto_16275 ?auto_16302 ) ) ( not ( = ?auto_16277 ?auto_16304 ) ) ( not ( = ?auto_16277 ?auto_16294 ) ) ( not ( = ?auto_16295 ?auto_16311 ) ) ( not ( = ?auto_16295 ?auto_16291 ) ) ( not ( = ?auto_16299 ?auto_16306 ) ) ( not ( = ?auto_16299 ?auto_16292 ) ) ( not ( = ?auto_16302 ?auto_16304 ) ) ( not ( = ?auto_16302 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16278 ) ) ( not ( = ?auto_16274 ?auto_16296 ) ) ( not ( = ?auto_16275 ?auto_16278 ) ) ( not ( = ?auto_16275 ?auto_16296 ) ) ( not ( = ?auto_16276 ?auto_16278 ) ) ( not ( = ?auto_16276 ?auto_16296 ) ) ( not ( = ?auto_16278 ?auto_16302 ) ) ( not ( = ?auto_16278 ?auto_16304 ) ) ( not ( = ?auto_16278 ?auto_16294 ) ) ( not ( = ?auto_16296 ?auto_16302 ) ) ( not ( = ?auto_16296 ?auto_16304 ) ) ( not ( = ?auto_16296 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16279 ) ) ( not ( = ?auto_16274 ?auto_16303 ) ) ( not ( = ?auto_16275 ?auto_16279 ) ) ( not ( = ?auto_16275 ?auto_16303 ) ) ( not ( = ?auto_16276 ?auto_16279 ) ) ( not ( = ?auto_16276 ?auto_16303 ) ) ( not ( = ?auto_16277 ?auto_16279 ) ) ( not ( = ?auto_16277 ?auto_16303 ) ) ( not ( = ?auto_16279 ?auto_16296 ) ) ( not ( = ?auto_16279 ?auto_16302 ) ) ( not ( = ?auto_16279 ?auto_16304 ) ) ( not ( = ?auto_16279 ?auto_16294 ) ) ( not ( = ?auto_16303 ?auto_16296 ) ) ( not ( = ?auto_16303 ?auto_16302 ) ) ( not ( = ?auto_16303 ?auto_16304 ) ) ( not ( = ?auto_16303 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16282 ) ) ( not ( = ?auto_16274 ?auto_16308 ) ) ( not ( = ?auto_16275 ?auto_16282 ) ) ( not ( = ?auto_16275 ?auto_16308 ) ) ( not ( = ?auto_16276 ?auto_16282 ) ) ( not ( = ?auto_16276 ?auto_16308 ) ) ( not ( = ?auto_16277 ?auto_16282 ) ) ( not ( = ?auto_16277 ?auto_16308 ) ) ( not ( = ?auto_16278 ?auto_16282 ) ) ( not ( = ?auto_16278 ?auto_16308 ) ) ( not ( = ?auto_16282 ?auto_16303 ) ) ( not ( = ?auto_16282 ?auto_16296 ) ) ( not ( = ?auto_16282 ?auto_16302 ) ) ( not ( = ?auto_16282 ?auto_16304 ) ) ( not ( = ?auto_16282 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16295 ) ) ( not ( = ?auto_16293 ?auto_16291 ) ) ( not ( = ?auto_16293 ?auto_16311 ) ) ( not ( = ?auto_16300 ?auto_16299 ) ) ( not ( = ?auto_16300 ?auto_16292 ) ) ( not ( = ?auto_16300 ?auto_16306 ) ) ( not ( = ?auto_16308 ?auto_16303 ) ) ( not ( = ?auto_16308 ?auto_16296 ) ) ( not ( = ?auto_16308 ?auto_16302 ) ) ( not ( = ?auto_16308 ?auto_16304 ) ) ( not ( = ?auto_16308 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16281 ) ) ( not ( = ?auto_16274 ?auto_16298 ) ) ( not ( = ?auto_16275 ?auto_16281 ) ) ( not ( = ?auto_16275 ?auto_16298 ) ) ( not ( = ?auto_16276 ?auto_16281 ) ) ( not ( = ?auto_16276 ?auto_16298 ) ) ( not ( = ?auto_16277 ?auto_16281 ) ) ( not ( = ?auto_16277 ?auto_16298 ) ) ( not ( = ?auto_16278 ?auto_16281 ) ) ( not ( = ?auto_16278 ?auto_16298 ) ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16279 ?auto_16298 ) ) ( not ( = ?auto_16281 ?auto_16308 ) ) ( not ( = ?auto_16281 ?auto_16303 ) ) ( not ( = ?auto_16281 ?auto_16296 ) ) ( not ( = ?auto_16281 ?auto_16302 ) ) ( not ( = ?auto_16281 ?auto_16304 ) ) ( not ( = ?auto_16281 ?auto_16294 ) ) ( not ( = ?auto_16309 ?auto_16293 ) ) ( not ( = ?auto_16309 ?auto_16295 ) ) ( not ( = ?auto_16309 ?auto_16291 ) ) ( not ( = ?auto_16309 ?auto_16311 ) ) ( not ( = ?auto_16312 ?auto_16300 ) ) ( not ( = ?auto_16312 ?auto_16299 ) ) ( not ( = ?auto_16312 ?auto_16292 ) ) ( not ( = ?auto_16312 ?auto_16306 ) ) ( not ( = ?auto_16298 ?auto_16308 ) ) ( not ( = ?auto_16298 ?auto_16303 ) ) ( not ( = ?auto_16298 ?auto_16296 ) ) ( not ( = ?auto_16298 ?auto_16302 ) ) ( not ( = ?auto_16298 ?auto_16304 ) ) ( not ( = ?auto_16298 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16280 ) ) ( not ( = ?auto_16274 ?auto_16301 ) ) ( not ( = ?auto_16275 ?auto_16280 ) ) ( not ( = ?auto_16275 ?auto_16301 ) ) ( not ( = ?auto_16276 ?auto_16280 ) ) ( not ( = ?auto_16276 ?auto_16301 ) ) ( not ( = ?auto_16277 ?auto_16280 ) ) ( not ( = ?auto_16277 ?auto_16301 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16278 ?auto_16301 ) ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16279 ?auto_16301 ) ) ( not ( = ?auto_16282 ?auto_16280 ) ) ( not ( = ?auto_16282 ?auto_16301 ) ) ( not ( = ?auto_16280 ?auto_16298 ) ) ( not ( = ?auto_16280 ?auto_16308 ) ) ( not ( = ?auto_16280 ?auto_16303 ) ) ( not ( = ?auto_16280 ?auto_16296 ) ) ( not ( = ?auto_16280 ?auto_16302 ) ) ( not ( = ?auto_16280 ?auto_16304 ) ) ( not ( = ?auto_16280 ?auto_16294 ) ) ( not ( = ?auto_16301 ?auto_16298 ) ) ( not ( = ?auto_16301 ?auto_16308 ) ) ( not ( = ?auto_16301 ?auto_16303 ) ) ( not ( = ?auto_16301 ?auto_16296 ) ) ( not ( = ?auto_16301 ?auto_16302 ) ) ( not ( = ?auto_16301 ?auto_16304 ) ) ( not ( = ?auto_16301 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16283 ) ) ( not ( = ?auto_16274 ?auto_16310 ) ) ( not ( = ?auto_16275 ?auto_16283 ) ) ( not ( = ?auto_16275 ?auto_16310 ) ) ( not ( = ?auto_16276 ?auto_16283 ) ) ( not ( = ?auto_16276 ?auto_16310 ) ) ( not ( = ?auto_16277 ?auto_16283 ) ) ( not ( = ?auto_16277 ?auto_16310 ) ) ( not ( = ?auto_16278 ?auto_16283 ) ) ( not ( = ?auto_16278 ?auto_16310 ) ) ( not ( = ?auto_16279 ?auto_16283 ) ) ( not ( = ?auto_16279 ?auto_16310 ) ) ( not ( = ?auto_16282 ?auto_16283 ) ) ( not ( = ?auto_16282 ?auto_16310 ) ) ( not ( = ?auto_16281 ?auto_16283 ) ) ( not ( = ?auto_16281 ?auto_16310 ) ) ( not ( = ?auto_16283 ?auto_16301 ) ) ( not ( = ?auto_16283 ?auto_16298 ) ) ( not ( = ?auto_16283 ?auto_16308 ) ) ( not ( = ?auto_16283 ?auto_16303 ) ) ( not ( = ?auto_16283 ?auto_16296 ) ) ( not ( = ?auto_16283 ?auto_16302 ) ) ( not ( = ?auto_16283 ?auto_16304 ) ) ( not ( = ?auto_16283 ?auto_16294 ) ) ( not ( = ?auto_16310 ?auto_16301 ) ) ( not ( = ?auto_16310 ?auto_16298 ) ) ( not ( = ?auto_16310 ?auto_16308 ) ) ( not ( = ?auto_16310 ?auto_16303 ) ) ( not ( = ?auto_16310 ?auto_16296 ) ) ( not ( = ?auto_16310 ?auto_16302 ) ) ( not ( = ?auto_16310 ?auto_16304 ) ) ( not ( = ?auto_16310 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16285 ) ) ( not ( = ?auto_16274 ?auto_16307 ) ) ( not ( = ?auto_16275 ?auto_16285 ) ) ( not ( = ?auto_16275 ?auto_16307 ) ) ( not ( = ?auto_16276 ?auto_16285 ) ) ( not ( = ?auto_16276 ?auto_16307 ) ) ( not ( = ?auto_16277 ?auto_16285 ) ) ( not ( = ?auto_16277 ?auto_16307 ) ) ( not ( = ?auto_16278 ?auto_16285 ) ) ( not ( = ?auto_16278 ?auto_16307 ) ) ( not ( = ?auto_16279 ?auto_16285 ) ) ( not ( = ?auto_16279 ?auto_16307 ) ) ( not ( = ?auto_16282 ?auto_16285 ) ) ( not ( = ?auto_16282 ?auto_16307 ) ) ( not ( = ?auto_16281 ?auto_16285 ) ) ( not ( = ?auto_16281 ?auto_16307 ) ) ( not ( = ?auto_16280 ?auto_16285 ) ) ( not ( = ?auto_16280 ?auto_16307 ) ) ( not ( = ?auto_16285 ?auto_16310 ) ) ( not ( = ?auto_16285 ?auto_16301 ) ) ( not ( = ?auto_16285 ?auto_16298 ) ) ( not ( = ?auto_16285 ?auto_16308 ) ) ( not ( = ?auto_16285 ?auto_16303 ) ) ( not ( = ?auto_16285 ?auto_16296 ) ) ( not ( = ?auto_16285 ?auto_16302 ) ) ( not ( = ?auto_16285 ?auto_16304 ) ) ( not ( = ?auto_16285 ?auto_16294 ) ) ( not ( = ?auto_16307 ?auto_16310 ) ) ( not ( = ?auto_16307 ?auto_16301 ) ) ( not ( = ?auto_16307 ?auto_16298 ) ) ( not ( = ?auto_16307 ?auto_16308 ) ) ( not ( = ?auto_16307 ?auto_16303 ) ) ( not ( = ?auto_16307 ?auto_16296 ) ) ( not ( = ?auto_16307 ?auto_16302 ) ) ( not ( = ?auto_16307 ?auto_16304 ) ) ( not ( = ?auto_16307 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16284 ) ) ( not ( = ?auto_16274 ?auto_16313 ) ) ( not ( = ?auto_16275 ?auto_16284 ) ) ( not ( = ?auto_16275 ?auto_16313 ) ) ( not ( = ?auto_16276 ?auto_16284 ) ) ( not ( = ?auto_16276 ?auto_16313 ) ) ( not ( = ?auto_16277 ?auto_16284 ) ) ( not ( = ?auto_16277 ?auto_16313 ) ) ( not ( = ?auto_16278 ?auto_16284 ) ) ( not ( = ?auto_16278 ?auto_16313 ) ) ( not ( = ?auto_16279 ?auto_16284 ) ) ( not ( = ?auto_16279 ?auto_16313 ) ) ( not ( = ?auto_16282 ?auto_16284 ) ) ( not ( = ?auto_16282 ?auto_16313 ) ) ( not ( = ?auto_16281 ?auto_16284 ) ) ( not ( = ?auto_16281 ?auto_16313 ) ) ( not ( = ?auto_16280 ?auto_16284 ) ) ( not ( = ?auto_16280 ?auto_16313 ) ) ( not ( = ?auto_16283 ?auto_16284 ) ) ( not ( = ?auto_16283 ?auto_16313 ) ) ( not ( = ?auto_16284 ?auto_16307 ) ) ( not ( = ?auto_16284 ?auto_16310 ) ) ( not ( = ?auto_16284 ?auto_16301 ) ) ( not ( = ?auto_16284 ?auto_16298 ) ) ( not ( = ?auto_16284 ?auto_16308 ) ) ( not ( = ?auto_16284 ?auto_16303 ) ) ( not ( = ?auto_16284 ?auto_16296 ) ) ( not ( = ?auto_16284 ?auto_16302 ) ) ( not ( = ?auto_16284 ?auto_16304 ) ) ( not ( = ?auto_16284 ?auto_16294 ) ) ( not ( = ?auto_16305 ?auto_16293 ) ) ( not ( = ?auto_16305 ?auto_16291 ) ) ( not ( = ?auto_16305 ?auto_16295 ) ) ( not ( = ?auto_16305 ?auto_16309 ) ) ( not ( = ?auto_16305 ?auto_16311 ) ) ( not ( = ?auto_16297 ?auto_16300 ) ) ( not ( = ?auto_16297 ?auto_16292 ) ) ( not ( = ?auto_16297 ?auto_16299 ) ) ( not ( = ?auto_16297 ?auto_16312 ) ) ( not ( = ?auto_16297 ?auto_16306 ) ) ( not ( = ?auto_16313 ?auto_16307 ) ) ( not ( = ?auto_16313 ?auto_16310 ) ) ( not ( = ?auto_16313 ?auto_16301 ) ) ( not ( = ?auto_16313 ?auto_16298 ) ) ( not ( = ?auto_16313 ?auto_16308 ) ) ( not ( = ?auto_16313 ?auto_16303 ) ) ( not ( = ?auto_16313 ?auto_16296 ) ) ( not ( = ?auto_16313 ?auto_16302 ) ) ( not ( = ?auto_16313 ?auto_16304 ) ) ( not ( = ?auto_16313 ?auto_16294 ) ) ( not ( = ?auto_16274 ?auto_16286 ) ) ( not ( = ?auto_16274 ?auto_16287 ) ) ( not ( = ?auto_16275 ?auto_16286 ) ) ( not ( = ?auto_16275 ?auto_16287 ) ) ( not ( = ?auto_16276 ?auto_16286 ) ) ( not ( = ?auto_16276 ?auto_16287 ) ) ( not ( = ?auto_16277 ?auto_16286 ) ) ( not ( = ?auto_16277 ?auto_16287 ) ) ( not ( = ?auto_16278 ?auto_16286 ) ) ( not ( = ?auto_16278 ?auto_16287 ) ) ( not ( = ?auto_16279 ?auto_16286 ) ) ( not ( = ?auto_16279 ?auto_16287 ) ) ( not ( = ?auto_16282 ?auto_16286 ) ) ( not ( = ?auto_16282 ?auto_16287 ) ) ( not ( = ?auto_16281 ?auto_16286 ) ) ( not ( = ?auto_16281 ?auto_16287 ) ) ( not ( = ?auto_16280 ?auto_16286 ) ) ( not ( = ?auto_16280 ?auto_16287 ) ) ( not ( = ?auto_16283 ?auto_16286 ) ) ( not ( = ?auto_16283 ?auto_16287 ) ) ( not ( = ?auto_16285 ?auto_16286 ) ) ( not ( = ?auto_16285 ?auto_16287 ) ) ( not ( = ?auto_16286 ?auto_16313 ) ) ( not ( = ?auto_16286 ?auto_16307 ) ) ( not ( = ?auto_16286 ?auto_16310 ) ) ( not ( = ?auto_16286 ?auto_16301 ) ) ( not ( = ?auto_16286 ?auto_16298 ) ) ( not ( = ?auto_16286 ?auto_16308 ) ) ( not ( = ?auto_16286 ?auto_16303 ) ) ( not ( = ?auto_16286 ?auto_16296 ) ) ( not ( = ?auto_16286 ?auto_16302 ) ) ( not ( = ?auto_16286 ?auto_16304 ) ) ( not ( = ?auto_16286 ?auto_16294 ) ) ( not ( = ?auto_16287 ?auto_16313 ) ) ( not ( = ?auto_16287 ?auto_16307 ) ) ( not ( = ?auto_16287 ?auto_16310 ) ) ( not ( = ?auto_16287 ?auto_16301 ) ) ( not ( = ?auto_16287 ?auto_16298 ) ) ( not ( = ?auto_16287 ?auto_16308 ) ) ( not ( = ?auto_16287 ?auto_16303 ) ) ( not ( = ?auto_16287 ?auto_16296 ) ) ( not ( = ?auto_16287 ?auto_16302 ) ) ( not ( = ?auto_16287 ?auto_16304 ) ) ( not ( = ?auto_16287 ?auto_16294 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_16274 ?auto_16275 ?auto_16276 ?auto_16277 ?auto_16278 ?auto_16279 ?auto_16282 ?auto_16281 ?auto_16280 ?auto_16283 ?auto_16285 ?auto_16284 )
      ( MAKE-1CRATE ?auto_16284 ?auto_16286 )
      ( MAKE-12CRATE-VERIFY ?auto_16274 ?auto_16275 ?auto_16276 ?auto_16277 ?auto_16278 ?auto_16279 ?auto_16282 ?auto_16281 ?auto_16280 ?auto_16283 ?auto_16285 ?auto_16284 ?auto_16286 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_16316 - SURFACE
      ?auto_16317 - SURFACE
    )
    :vars
    (
      ?auto_16318 - HOIST
      ?auto_16319 - PLACE
      ?auto_16321 - PLACE
      ?auto_16322 - HOIST
      ?auto_16323 - SURFACE
      ?auto_16320 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16318 ?auto_16319 ) ( SURFACE-AT ?auto_16316 ?auto_16319 ) ( CLEAR ?auto_16316 ) ( IS-CRATE ?auto_16317 ) ( AVAILABLE ?auto_16318 ) ( not ( = ?auto_16321 ?auto_16319 ) ) ( HOIST-AT ?auto_16322 ?auto_16321 ) ( AVAILABLE ?auto_16322 ) ( SURFACE-AT ?auto_16317 ?auto_16321 ) ( ON ?auto_16317 ?auto_16323 ) ( CLEAR ?auto_16317 ) ( TRUCK-AT ?auto_16320 ?auto_16319 ) ( not ( = ?auto_16316 ?auto_16317 ) ) ( not ( = ?auto_16316 ?auto_16323 ) ) ( not ( = ?auto_16317 ?auto_16323 ) ) ( not ( = ?auto_16318 ?auto_16322 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_16320 ?auto_16319 ?auto_16321 )
      ( !LIFT ?auto_16322 ?auto_16317 ?auto_16323 ?auto_16321 )
      ( !LOAD ?auto_16322 ?auto_16317 ?auto_16320 ?auto_16321 )
      ( !DRIVE ?auto_16320 ?auto_16321 ?auto_16319 )
      ( !UNLOAD ?auto_16318 ?auto_16317 ?auto_16320 ?auto_16319 )
      ( !DROP ?auto_16318 ?auto_16317 ?auto_16316 ?auto_16319 )
      ( MAKE-1CRATE-VERIFY ?auto_16316 ?auto_16317 ) )
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
      ?auto_16346 - SURFACE
      ?auto_16345 - SURFACE
      ?auto_16344 - SURFACE
      ?auto_16347 - SURFACE
      ?auto_16349 - SURFACE
      ?auto_16348 - SURFACE
      ?auto_16350 - SURFACE
      ?auto_16351 - SURFACE
    )
    :vars
    (
      ?auto_16354 - HOIST
      ?auto_16355 - PLACE
      ?auto_16356 - PLACE
      ?auto_16357 - HOIST
      ?auto_16352 - SURFACE
      ?auto_16377 - PLACE
      ?auto_16359 - HOIST
      ?auto_16375 - SURFACE
      ?auto_16362 - PLACE
      ?auto_16368 - HOIST
      ?auto_16371 - SURFACE
      ?auto_16367 - PLACE
      ?auto_16378 - HOIST
      ?auto_16379 - SURFACE
      ?auto_16361 - SURFACE
      ?auto_16365 - PLACE
      ?auto_16374 - HOIST
      ?auto_16372 - SURFACE
      ?auto_16360 - PLACE
      ?auto_16376 - HOIST
      ?auto_16364 - SURFACE
      ?auto_16370 - SURFACE
      ?auto_16358 - SURFACE
      ?auto_16363 - SURFACE
      ?auto_16366 - SURFACE
      ?auto_16369 - SURFACE
      ?auto_16373 - SURFACE
      ?auto_16353 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_16354 ?auto_16355 ) ( IS-CRATE ?auto_16351 ) ( not ( = ?auto_16356 ?auto_16355 ) ) ( HOIST-AT ?auto_16357 ?auto_16356 ) ( SURFACE-AT ?auto_16351 ?auto_16356 ) ( ON ?auto_16351 ?auto_16352 ) ( CLEAR ?auto_16351 ) ( not ( = ?auto_16350 ?auto_16351 ) ) ( not ( = ?auto_16350 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16352 ) ) ( not ( = ?auto_16354 ?auto_16357 ) ) ( IS-CRATE ?auto_16350 ) ( not ( = ?auto_16377 ?auto_16355 ) ) ( HOIST-AT ?auto_16359 ?auto_16377 ) ( SURFACE-AT ?auto_16350 ?auto_16377 ) ( ON ?auto_16350 ?auto_16375 ) ( CLEAR ?auto_16350 ) ( not ( = ?auto_16348 ?auto_16350 ) ) ( not ( = ?auto_16348 ?auto_16375 ) ) ( not ( = ?auto_16350 ?auto_16375 ) ) ( not ( = ?auto_16354 ?auto_16359 ) ) ( IS-CRATE ?auto_16348 ) ( not ( = ?auto_16362 ?auto_16355 ) ) ( HOIST-AT ?auto_16368 ?auto_16362 ) ( AVAILABLE ?auto_16368 ) ( SURFACE-AT ?auto_16348 ?auto_16362 ) ( ON ?auto_16348 ?auto_16371 ) ( CLEAR ?auto_16348 ) ( not ( = ?auto_16349 ?auto_16348 ) ) ( not ( = ?auto_16349 ?auto_16371 ) ) ( not ( = ?auto_16348 ?auto_16371 ) ) ( not ( = ?auto_16354 ?auto_16368 ) ) ( IS-CRATE ?auto_16349 ) ( not ( = ?auto_16367 ?auto_16355 ) ) ( HOIST-AT ?auto_16378 ?auto_16367 ) ( SURFACE-AT ?auto_16349 ?auto_16367 ) ( ON ?auto_16349 ?auto_16379 ) ( CLEAR ?auto_16349 ) ( not ( = ?auto_16347 ?auto_16349 ) ) ( not ( = ?auto_16347 ?auto_16379 ) ) ( not ( = ?auto_16349 ?auto_16379 ) ) ( not ( = ?auto_16354 ?auto_16378 ) ) ( IS-CRATE ?auto_16347 ) ( SURFACE-AT ?auto_16347 ?auto_16377 ) ( ON ?auto_16347 ?auto_16361 ) ( CLEAR ?auto_16347 ) ( not ( = ?auto_16344 ?auto_16347 ) ) ( not ( = ?auto_16344 ?auto_16361 ) ) ( not ( = ?auto_16347 ?auto_16361 ) ) ( IS-CRATE ?auto_16344 ) ( not ( = ?auto_16365 ?auto_16355 ) ) ( HOIST-AT ?auto_16374 ?auto_16365 ) ( SURFACE-AT ?auto_16344 ?auto_16365 ) ( ON ?auto_16344 ?auto_16372 ) ( CLEAR ?auto_16344 ) ( not ( = ?auto_16345 ?auto_16344 ) ) ( not ( = ?auto_16345 ?auto_16372 ) ) ( not ( = ?auto_16344 ?auto_16372 ) ) ( not ( = ?auto_16354 ?auto_16374 ) ) ( IS-CRATE ?auto_16345 ) ( not ( = ?auto_16360 ?auto_16355 ) ) ( HOIST-AT ?auto_16376 ?auto_16360 ) ( AVAILABLE ?auto_16376 ) ( SURFACE-AT ?auto_16345 ?auto_16360 ) ( ON ?auto_16345 ?auto_16364 ) ( CLEAR ?auto_16345 ) ( not ( = ?auto_16346 ?auto_16345 ) ) ( not ( = ?auto_16346 ?auto_16364 ) ) ( not ( = ?auto_16345 ?auto_16364 ) ) ( not ( = ?auto_16354 ?auto_16376 ) ) ( IS-CRATE ?auto_16346 ) ( AVAILABLE ?auto_16378 ) ( SURFACE-AT ?auto_16346 ?auto_16367 ) ( ON ?auto_16346 ?auto_16370 ) ( CLEAR ?auto_16346 ) ( not ( = ?auto_16343 ?auto_16346 ) ) ( not ( = ?auto_16343 ?auto_16370 ) ) ( not ( = ?auto_16346 ?auto_16370 ) ) ( IS-CRATE ?auto_16343 ) ( SURFACE-AT ?auto_16343 ?auto_16365 ) ( ON ?auto_16343 ?auto_16358 ) ( CLEAR ?auto_16343 ) ( not ( = ?auto_16342 ?auto_16343 ) ) ( not ( = ?auto_16342 ?auto_16358 ) ) ( not ( = ?auto_16343 ?auto_16358 ) ) ( IS-CRATE ?auto_16342 ) ( SURFACE-AT ?auto_16342 ?auto_16377 ) ( ON ?auto_16342 ?auto_16363 ) ( CLEAR ?auto_16342 ) ( not ( = ?auto_16341 ?auto_16342 ) ) ( not ( = ?auto_16341 ?auto_16363 ) ) ( not ( = ?auto_16342 ?auto_16363 ) ) ( IS-CRATE ?auto_16341 ) ( AVAILABLE ?auto_16374 ) ( SURFACE-AT ?auto_16341 ?auto_16365 ) ( ON ?auto_16341 ?auto_16366 ) ( CLEAR ?auto_16341 ) ( not ( = ?auto_16340 ?auto_16341 ) ) ( not ( = ?auto_16340 ?auto_16366 ) ) ( not ( = ?auto_16341 ?auto_16366 ) ) ( IS-CRATE ?auto_16340 ) ( AVAILABLE ?auto_16357 ) ( SURFACE-AT ?auto_16340 ?auto_16356 ) ( ON ?auto_16340 ?auto_16369 ) ( CLEAR ?auto_16340 ) ( not ( = ?auto_16339 ?auto_16340 ) ) ( not ( = ?auto_16339 ?auto_16369 ) ) ( not ( = ?auto_16340 ?auto_16369 ) ) ( SURFACE-AT ?auto_16338 ?auto_16355 ) ( CLEAR ?auto_16338 ) ( IS-CRATE ?auto_16339 ) ( AVAILABLE ?auto_16354 ) ( AVAILABLE ?auto_16359 ) ( SURFACE-AT ?auto_16339 ?auto_16377 ) ( ON ?auto_16339 ?auto_16373 ) ( CLEAR ?auto_16339 ) ( TRUCK-AT ?auto_16353 ?auto_16355 ) ( not ( = ?auto_16338 ?auto_16339 ) ) ( not ( = ?auto_16338 ?auto_16373 ) ) ( not ( = ?auto_16339 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16340 ) ) ( not ( = ?auto_16338 ?auto_16369 ) ) ( not ( = ?auto_16340 ?auto_16373 ) ) ( not ( = ?auto_16356 ?auto_16377 ) ) ( not ( = ?auto_16357 ?auto_16359 ) ) ( not ( = ?auto_16369 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16341 ) ) ( not ( = ?auto_16338 ?auto_16366 ) ) ( not ( = ?auto_16339 ?auto_16341 ) ) ( not ( = ?auto_16339 ?auto_16366 ) ) ( not ( = ?auto_16341 ?auto_16369 ) ) ( not ( = ?auto_16341 ?auto_16373 ) ) ( not ( = ?auto_16365 ?auto_16356 ) ) ( not ( = ?auto_16365 ?auto_16377 ) ) ( not ( = ?auto_16374 ?auto_16357 ) ) ( not ( = ?auto_16374 ?auto_16359 ) ) ( not ( = ?auto_16366 ?auto_16369 ) ) ( not ( = ?auto_16366 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16342 ) ) ( not ( = ?auto_16338 ?auto_16363 ) ) ( not ( = ?auto_16339 ?auto_16342 ) ) ( not ( = ?auto_16339 ?auto_16363 ) ) ( not ( = ?auto_16340 ?auto_16342 ) ) ( not ( = ?auto_16340 ?auto_16363 ) ) ( not ( = ?auto_16342 ?auto_16366 ) ) ( not ( = ?auto_16342 ?auto_16369 ) ) ( not ( = ?auto_16342 ?auto_16373 ) ) ( not ( = ?auto_16363 ?auto_16366 ) ) ( not ( = ?auto_16363 ?auto_16369 ) ) ( not ( = ?auto_16363 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16343 ) ) ( not ( = ?auto_16338 ?auto_16358 ) ) ( not ( = ?auto_16339 ?auto_16343 ) ) ( not ( = ?auto_16339 ?auto_16358 ) ) ( not ( = ?auto_16340 ?auto_16343 ) ) ( not ( = ?auto_16340 ?auto_16358 ) ) ( not ( = ?auto_16341 ?auto_16343 ) ) ( not ( = ?auto_16341 ?auto_16358 ) ) ( not ( = ?auto_16343 ?auto_16363 ) ) ( not ( = ?auto_16343 ?auto_16366 ) ) ( not ( = ?auto_16343 ?auto_16369 ) ) ( not ( = ?auto_16343 ?auto_16373 ) ) ( not ( = ?auto_16358 ?auto_16363 ) ) ( not ( = ?auto_16358 ?auto_16366 ) ) ( not ( = ?auto_16358 ?auto_16369 ) ) ( not ( = ?auto_16358 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16346 ) ) ( not ( = ?auto_16338 ?auto_16370 ) ) ( not ( = ?auto_16339 ?auto_16346 ) ) ( not ( = ?auto_16339 ?auto_16370 ) ) ( not ( = ?auto_16340 ?auto_16346 ) ) ( not ( = ?auto_16340 ?auto_16370 ) ) ( not ( = ?auto_16341 ?auto_16346 ) ) ( not ( = ?auto_16341 ?auto_16370 ) ) ( not ( = ?auto_16342 ?auto_16346 ) ) ( not ( = ?auto_16342 ?auto_16370 ) ) ( not ( = ?auto_16346 ?auto_16358 ) ) ( not ( = ?auto_16346 ?auto_16363 ) ) ( not ( = ?auto_16346 ?auto_16366 ) ) ( not ( = ?auto_16346 ?auto_16369 ) ) ( not ( = ?auto_16346 ?auto_16373 ) ) ( not ( = ?auto_16367 ?auto_16365 ) ) ( not ( = ?auto_16367 ?auto_16377 ) ) ( not ( = ?auto_16367 ?auto_16356 ) ) ( not ( = ?auto_16378 ?auto_16374 ) ) ( not ( = ?auto_16378 ?auto_16359 ) ) ( not ( = ?auto_16378 ?auto_16357 ) ) ( not ( = ?auto_16370 ?auto_16358 ) ) ( not ( = ?auto_16370 ?auto_16363 ) ) ( not ( = ?auto_16370 ?auto_16366 ) ) ( not ( = ?auto_16370 ?auto_16369 ) ) ( not ( = ?auto_16370 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16345 ) ) ( not ( = ?auto_16338 ?auto_16364 ) ) ( not ( = ?auto_16339 ?auto_16345 ) ) ( not ( = ?auto_16339 ?auto_16364 ) ) ( not ( = ?auto_16340 ?auto_16345 ) ) ( not ( = ?auto_16340 ?auto_16364 ) ) ( not ( = ?auto_16341 ?auto_16345 ) ) ( not ( = ?auto_16341 ?auto_16364 ) ) ( not ( = ?auto_16342 ?auto_16345 ) ) ( not ( = ?auto_16342 ?auto_16364 ) ) ( not ( = ?auto_16343 ?auto_16345 ) ) ( not ( = ?auto_16343 ?auto_16364 ) ) ( not ( = ?auto_16345 ?auto_16370 ) ) ( not ( = ?auto_16345 ?auto_16358 ) ) ( not ( = ?auto_16345 ?auto_16363 ) ) ( not ( = ?auto_16345 ?auto_16366 ) ) ( not ( = ?auto_16345 ?auto_16369 ) ) ( not ( = ?auto_16345 ?auto_16373 ) ) ( not ( = ?auto_16360 ?auto_16367 ) ) ( not ( = ?auto_16360 ?auto_16365 ) ) ( not ( = ?auto_16360 ?auto_16377 ) ) ( not ( = ?auto_16360 ?auto_16356 ) ) ( not ( = ?auto_16376 ?auto_16378 ) ) ( not ( = ?auto_16376 ?auto_16374 ) ) ( not ( = ?auto_16376 ?auto_16359 ) ) ( not ( = ?auto_16376 ?auto_16357 ) ) ( not ( = ?auto_16364 ?auto_16370 ) ) ( not ( = ?auto_16364 ?auto_16358 ) ) ( not ( = ?auto_16364 ?auto_16363 ) ) ( not ( = ?auto_16364 ?auto_16366 ) ) ( not ( = ?auto_16364 ?auto_16369 ) ) ( not ( = ?auto_16364 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16344 ) ) ( not ( = ?auto_16338 ?auto_16372 ) ) ( not ( = ?auto_16339 ?auto_16344 ) ) ( not ( = ?auto_16339 ?auto_16372 ) ) ( not ( = ?auto_16340 ?auto_16344 ) ) ( not ( = ?auto_16340 ?auto_16372 ) ) ( not ( = ?auto_16341 ?auto_16344 ) ) ( not ( = ?auto_16341 ?auto_16372 ) ) ( not ( = ?auto_16342 ?auto_16344 ) ) ( not ( = ?auto_16342 ?auto_16372 ) ) ( not ( = ?auto_16343 ?auto_16344 ) ) ( not ( = ?auto_16343 ?auto_16372 ) ) ( not ( = ?auto_16346 ?auto_16344 ) ) ( not ( = ?auto_16346 ?auto_16372 ) ) ( not ( = ?auto_16344 ?auto_16364 ) ) ( not ( = ?auto_16344 ?auto_16370 ) ) ( not ( = ?auto_16344 ?auto_16358 ) ) ( not ( = ?auto_16344 ?auto_16363 ) ) ( not ( = ?auto_16344 ?auto_16366 ) ) ( not ( = ?auto_16344 ?auto_16369 ) ) ( not ( = ?auto_16344 ?auto_16373 ) ) ( not ( = ?auto_16372 ?auto_16364 ) ) ( not ( = ?auto_16372 ?auto_16370 ) ) ( not ( = ?auto_16372 ?auto_16358 ) ) ( not ( = ?auto_16372 ?auto_16363 ) ) ( not ( = ?auto_16372 ?auto_16366 ) ) ( not ( = ?auto_16372 ?auto_16369 ) ) ( not ( = ?auto_16372 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16347 ) ) ( not ( = ?auto_16338 ?auto_16361 ) ) ( not ( = ?auto_16339 ?auto_16347 ) ) ( not ( = ?auto_16339 ?auto_16361 ) ) ( not ( = ?auto_16340 ?auto_16347 ) ) ( not ( = ?auto_16340 ?auto_16361 ) ) ( not ( = ?auto_16341 ?auto_16347 ) ) ( not ( = ?auto_16341 ?auto_16361 ) ) ( not ( = ?auto_16342 ?auto_16347 ) ) ( not ( = ?auto_16342 ?auto_16361 ) ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16343 ?auto_16361 ) ) ( not ( = ?auto_16346 ?auto_16347 ) ) ( not ( = ?auto_16346 ?auto_16361 ) ) ( not ( = ?auto_16345 ?auto_16347 ) ) ( not ( = ?auto_16345 ?auto_16361 ) ) ( not ( = ?auto_16347 ?auto_16372 ) ) ( not ( = ?auto_16347 ?auto_16364 ) ) ( not ( = ?auto_16347 ?auto_16370 ) ) ( not ( = ?auto_16347 ?auto_16358 ) ) ( not ( = ?auto_16347 ?auto_16363 ) ) ( not ( = ?auto_16347 ?auto_16366 ) ) ( not ( = ?auto_16347 ?auto_16369 ) ) ( not ( = ?auto_16347 ?auto_16373 ) ) ( not ( = ?auto_16361 ?auto_16372 ) ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16361 ?auto_16370 ) ) ( not ( = ?auto_16361 ?auto_16358 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16366 ) ) ( not ( = ?auto_16361 ?auto_16369 ) ) ( not ( = ?auto_16361 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16349 ) ) ( not ( = ?auto_16338 ?auto_16379 ) ) ( not ( = ?auto_16339 ?auto_16349 ) ) ( not ( = ?auto_16339 ?auto_16379 ) ) ( not ( = ?auto_16340 ?auto_16349 ) ) ( not ( = ?auto_16340 ?auto_16379 ) ) ( not ( = ?auto_16341 ?auto_16349 ) ) ( not ( = ?auto_16341 ?auto_16379 ) ) ( not ( = ?auto_16342 ?auto_16349 ) ) ( not ( = ?auto_16342 ?auto_16379 ) ) ( not ( = ?auto_16343 ?auto_16349 ) ) ( not ( = ?auto_16343 ?auto_16379 ) ) ( not ( = ?auto_16346 ?auto_16349 ) ) ( not ( = ?auto_16346 ?auto_16379 ) ) ( not ( = ?auto_16345 ?auto_16349 ) ) ( not ( = ?auto_16345 ?auto_16379 ) ) ( not ( = ?auto_16344 ?auto_16349 ) ) ( not ( = ?auto_16344 ?auto_16379 ) ) ( not ( = ?auto_16349 ?auto_16361 ) ) ( not ( = ?auto_16349 ?auto_16372 ) ) ( not ( = ?auto_16349 ?auto_16364 ) ) ( not ( = ?auto_16349 ?auto_16370 ) ) ( not ( = ?auto_16349 ?auto_16358 ) ) ( not ( = ?auto_16349 ?auto_16363 ) ) ( not ( = ?auto_16349 ?auto_16366 ) ) ( not ( = ?auto_16349 ?auto_16369 ) ) ( not ( = ?auto_16349 ?auto_16373 ) ) ( not ( = ?auto_16379 ?auto_16361 ) ) ( not ( = ?auto_16379 ?auto_16372 ) ) ( not ( = ?auto_16379 ?auto_16364 ) ) ( not ( = ?auto_16379 ?auto_16370 ) ) ( not ( = ?auto_16379 ?auto_16358 ) ) ( not ( = ?auto_16379 ?auto_16363 ) ) ( not ( = ?auto_16379 ?auto_16366 ) ) ( not ( = ?auto_16379 ?auto_16369 ) ) ( not ( = ?auto_16379 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16348 ) ) ( not ( = ?auto_16338 ?auto_16371 ) ) ( not ( = ?auto_16339 ?auto_16348 ) ) ( not ( = ?auto_16339 ?auto_16371 ) ) ( not ( = ?auto_16340 ?auto_16348 ) ) ( not ( = ?auto_16340 ?auto_16371 ) ) ( not ( = ?auto_16341 ?auto_16348 ) ) ( not ( = ?auto_16341 ?auto_16371 ) ) ( not ( = ?auto_16342 ?auto_16348 ) ) ( not ( = ?auto_16342 ?auto_16371 ) ) ( not ( = ?auto_16343 ?auto_16348 ) ) ( not ( = ?auto_16343 ?auto_16371 ) ) ( not ( = ?auto_16346 ?auto_16348 ) ) ( not ( = ?auto_16346 ?auto_16371 ) ) ( not ( = ?auto_16345 ?auto_16348 ) ) ( not ( = ?auto_16345 ?auto_16371 ) ) ( not ( = ?auto_16344 ?auto_16348 ) ) ( not ( = ?auto_16344 ?auto_16371 ) ) ( not ( = ?auto_16347 ?auto_16348 ) ) ( not ( = ?auto_16347 ?auto_16371 ) ) ( not ( = ?auto_16348 ?auto_16379 ) ) ( not ( = ?auto_16348 ?auto_16361 ) ) ( not ( = ?auto_16348 ?auto_16372 ) ) ( not ( = ?auto_16348 ?auto_16364 ) ) ( not ( = ?auto_16348 ?auto_16370 ) ) ( not ( = ?auto_16348 ?auto_16358 ) ) ( not ( = ?auto_16348 ?auto_16363 ) ) ( not ( = ?auto_16348 ?auto_16366 ) ) ( not ( = ?auto_16348 ?auto_16369 ) ) ( not ( = ?auto_16348 ?auto_16373 ) ) ( not ( = ?auto_16362 ?auto_16367 ) ) ( not ( = ?auto_16362 ?auto_16377 ) ) ( not ( = ?auto_16362 ?auto_16365 ) ) ( not ( = ?auto_16362 ?auto_16360 ) ) ( not ( = ?auto_16362 ?auto_16356 ) ) ( not ( = ?auto_16368 ?auto_16378 ) ) ( not ( = ?auto_16368 ?auto_16359 ) ) ( not ( = ?auto_16368 ?auto_16374 ) ) ( not ( = ?auto_16368 ?auto_16376 ) ) ( not ( = ?auto_16368 ?auto_16357 ) ) ( not ( = ?auto_16371 ?auto_16379 ) ) ( not ( = ?auto_16371 ?auto_16361 ) ) ( not ( = ?auto_16371 ?auto_16372 ) ) ( not ( = ?auto_16371 ?auto_16364 ) ) ( not ( = ?auto_16371 ?auto_16370 ) ) ( not ( = ?auto_16371 ?auto_16358 ) ) ( not ( = ?auto_16371 ?auto_16363 ) ) ( not ( = ?auto_16371 ?auto_16366 ) ) ( not ( = ?auto_16371 ?auto_16369 ) ) ( not ( = ?auto_16371 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16350 ) ) ( not ( = ?auto_16338 ?auto_16375 ) ) ( not ( = ?auto_16339 ?auto_16350 ) ) ( not ( = ?auto_16339 ?auto_16375 ) ) ( not ( = ?auto_16340 ?auto_16350 ) ) ( not ( = ?auto_16340 ?auto_16375 ) ) ( not ( = ?auto_16341 ?auto_16350 ) ) ( not ( = ?auto_16341 ?auto_16375 ) ) ( not ( = ?auto_16342 ?auto_16350 ) ) ( not ( = ?auto_16342 ?auto_16375 ) ) ( not ( = ?auto_16343 ?auto_16350 ) ) ( not ( = ?auto_16343 ?auto_16375 ) ) ( not ( = ?auto_16346 ?auto_16350 ) ) ( not ( = ?auto_16346 ?auto_16375 ) ) ( not ( = ?auto_16345 ?auto_16350 ) ) ( not ( = ?auto_16345 ?auto_16375 ) ) ( not ( = ?auto_16344 ?auto_16350 ) ) ( not ( = ?auto_16344 ?auto_16375 ) ) ( not ( = ?auto_16347 ?auto_16350 ) ) ( not ( = ?auto_16347 ?auto_16375 ) ) ( not ( = ?auto_16349 ?auto_16350 ) ) ( not ( = ?auto_16349 ?auto_16375 ) ) ( not ( = ?auto_16350 ?auto_16371 ) ) ( not ( = ?auto_16350 ?auto_16379 ) ) ( not ( = ?auto_16350 ?auto_16361 ) ) ( not ( = ?auto_16350 ?auto_16372 ) ) ( not ( = ?auto_16350 ?auto_16364 ) ) ( not ( = ?auto_16350 ?auto_16370 ) ) ( not ( = ?auto_16350 ?auto_16358 ) ) ( not ( = ?auto_16350 ?auto_16363 ) ) ( not ( = ?auto_16350 ?auto_16366 ) ) ( not ( = ?auto_16350 ?auto_16369 ) ) ( not ( = ?auto_16350 ?auto_16373 ) ) ( not ( = ?auto_16375 ?auto_16371 ) ) ( not ( = ?auto_16375 ?auto_16379 ) ) ( not ( = ?auto_16375 ?auto_16361 ) ) ( not ( = ?auto_16375 ?auto_16372 ) ) ( not ( = ?auto_16375 ?auto_16364 ) ) ( not ( = ?auto_16375 ?auto_16370 ) ) ( not ( = ?auto_16375 ?auto_16358 ) ) ( not ( = ?auto_16375 ?auto_16363 ) ) ( not ( = ?auto_16375 ?auto_16366 ) ) ( not ( = ?auto_16375 ?auto_16369 ) ) ( not ( = ?auto_16375 ?auto_16373 ) ) ( not ( = ?auto_16338 ?auto_16351 ) ) ( not ( = ?auto_16338 ?auto_16352 ) ) ( not ( = ?auto_16339 ?auto_16351 ) ) ( not ( = ?auto_16339 ?auto_16352 ) ) ( not ( = ?auto_16340 ?auto_16351 ) ) ( not ( = ?auto_16340 ?auto_16352 ) ) ( not ( = ?auto_16341 ?auto_16351 ) ) ( not ( = ?auto_16341 ?auto_16352 ) ) ( not ( = ?auto_16342 ?auto_16351 ) ) ( not ( = ?auto_16342 ?auto_16352 ) ) ( not ( = ?auto_16343 ?auto_16351 ) ) ( not ( = ?auto_16343 ?auto_16352 ) ) ( not ( = ?auto_16346 ?auto_16351 ) ) ( not ( = ?auto_16346 ?auto_16352 ) ) ( not ( = ?auto_16345 ?auto_16351 ) ) ( not ( = ?auto_16345 ?auto_16352 ) ) ( not ( = ?auto_16344 ?auto_16351 ) ) ( not ( = ?auto_16344 ?auto_16352 ) ) ( not ( = ?auto_16347 ?auto_16351 ) ) ( not ( = ?auto_16347 ?auto_16352 ) ) ( not ( = ?auto_16349 ?auto_16351 ) ) ( not ( = ?auto_16349 ?auto_16352 ) ) ( not ( = ?auto_16348 ?auto_16351 ) ) ( not ( = ?auto_16348 ?auto_16352 ) ) ( not ( = ?auto_16351 ?auto_16375 ) ) ( not ( = ?auto_16351 ?auto_16371 ) ) ( not ( = ?auto_16351 ?auto_16379 ) ) ( not ( = ?auto_16351 ?auto_16361 ) ) ( not ( = ?auto_16351 ?auto_16372 ) ) ( not ( = ?auto_16351 ?auto_16364 ) ) ( not ( = ?auto_16351 ?auto_16370 ) ) ( not ( = ?auto_16351 ?auto_16358 ) ) ( not ( = ?auto_16351 ?auto_16363 ) ) ( not ( = ?auto_16351 ?auto_16366 ) ) ( not ( = ?auto_16351 ?auto_16369 ) ) ( not ( = ?auto_16351 ?auto_16373 ) ) ( not ( = ?auto_16352 ?auto_16375 ) ) ( not ( = ?auto_16352 ?auto_16371 ) ) ( not ( = ?auto_16352 ?auto_16379 ) ) ( not ( = ?auto_16352 ?auto_16361 ) ) ( not ( = ?auto_16352 ?auto_16372 ) ) ( not ( = ?auto_16352 ?auto_16364 ) ) ( not ( = ?auto_16352 ?auto_16370 ) ) ( not ( = ?auto_16352 ?auto_16358 ) ) ( not ( = ?auto_16352 ?auto_16363 ) ) ( not ( = ?auto_16352 ?auto_16366 ) ) ( not ( = ?auto_16352 ?auto_16369 ) ) ( not ( = ?auto_16352 ?auto_16373 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_16338 ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16342 ?auto_16343 ?auto_16346 ?auto_16345 ?auto_16344 ?auto_16347 ?auto_16349 ?auto_16348 ?auto_16350 )
      ( MAKE-1CRATE ?auto_16350 ?auto_16351 )
      ( MAKE-13CRATE-VERIFY ?auto_16338 ?auto_16339 ?auto_16340 ?auto_16341 ?auto_16342 ?auto_16343 ?auto_16346 ?auto_16345 ?auto_16344 ?auto_16347 ?auto_16349 ?auto_16348 ?auto_16350 ?auto_16351 ) )
  )

)

