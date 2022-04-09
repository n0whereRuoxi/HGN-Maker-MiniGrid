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
      ?auto_19831 - SURFACE
      ?auto_19832 - SURFACE
    )
    :vars
    (
      ?auto_19833 - HOIST
      ?auto_19834 - PLACE
      ?auto_19836 - PLACE
      ?auto_19837 - HOIST
      ?auto_19838 - SURFACE
      ?auto_19835 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19833 ?auto_19834 ) ( SURFACE-AT ?auto_19831 ?auto_19834 ) ( CLEAR ?auto_19831 ) ( IS-CRATE ?auto_19832 ) ( AVAILABLE ?auto_19833 ) ( not ( = ?auto_19836 ?auto_19834 ) ) ( HOIST-AT ?auto_19837 ?auto_19836 ) ( AVAILABLE ?auto_19837 ) ( SURFACE-AT ?auto_19832 ?auto_19836 ) ( ON ?auto_19832 ?auto_19838 ) ( CLEAR ?auto_19832 ) ( TRUCK-AT ?auto_19835 ?auto_19834 ) ( not ( = ?auto_19831 ?auto_19832 ) ) ( not ( = ?auto_19831 ?auto_19838 ) ) ( not ( = ?auto_19832 ?auto_19838 ) ) ( not ( = ?auto_19833 ?auto_19837 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19835 ?auto_19834 ?auto_19836 )
      ( !LIFT ?auto_19837 ?auto_19832 ?auto_19838 ?auto_19836 )
      ( !LOAD ?auto_19837 ?auto_19832 ?auto_19835 ?auto_19836 )
      ( !DRIVE ?auto_19835 ?auto_19836 ?auto_19834 )
      ( !UNLOAD ?auto_19833 ?auto_19832 ?auto_19835 ?auto_19834 )
      ( !DROP ?auto_19833 ?auto_19832 ?auto_19831 ?auto_19834 )
      ( MAKE-1CRATE-VERIFY ?auto_19831 ?auto_19832 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19841 - SURFACE
      ?auto_19842 - SURFACE
    )
    :vars
    (
      ?auto_19843 - HOIST
      ?auto_19844 - PLACE
      ?auto_19846 - PLACE
      ?auto_19847 - HOIST
      ?auto_19848 - SURFACE
      ?auto_19845 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19843 ?auto_19844 ) ( SURFACE-AT ?auto_19841 ?auto_19844 ) ( CLEAR ?auto_19841 ) ( IS-CRATE ?auto_19842 ) ( AVAILABLE ?auto_19843 ) ( not ( = ?auto_19846 ?auto_19844 ) ) ( HOIST-AT ?auto_19847 ?auto_19846 ) ( AVAILABLE ?auto_19847 ) ( SURFACE-AT ?auto_19842 ?auto_19846 ) ( ON ?auto_19842 ?auto_19848 ) ( CLEAR ?auto_19842 ) ( TRUCK-AT ?auto_19845 ?auto_19844 ) ( not ( = ?auto_19841 ?auto_19842 ) ) ( not ( = ?auto_19841 ?auto_19848 ) ) ( not ( = ?auto_19842 ?auto_19848 ) ) ( not ( = ?auto_19843 ?auto_19847 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19845 ?auto_19844 ?auto_19846 )
      ( !LIFT ?auto_19847 ?auto_19842 ?auto_19848 ?auto_19846 )
      ( !LOAD ?auto_19847 ?auto_19842 ?auto_19845 ?auto_19846 )
      ( !DRIVE ?auto_19845 ?auto_19846 ?auto_19844 )
      ( !UNLOAD ?auto_19843 ?auto_19842 ?auto_19845 ?auto_19844 )
      ( !DROP ?auto_19843 ?auto_19842 ?auto_19841 ?auto_19844 )
      ( MAKE-1CRATE-VERIFY ?auto_19841 ?auto_19842 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19852 - SURFACE
      ?auto_19853 - SURFACE
      ?auto_19854 - SURFACE
    )
    :vars
    (
      ?auto_19857 - HOIST
      ?auto_19859 - PLACE
      ?auto_19855 - PLACE
      ?auto_19860 - HOIST
      ?auto_19858 - SURFACE
      ?auto_19861 - SURFACE
      ?auto_19856 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19857 ?auto_19859 ) ( IS-CRATE ?auto_19854 ) ( not ( = ?auto_19855 ?auto_19859 ) ) ( HOIST-AT ?auto_19860 ?auto_19855 ) ( SURFACE-AT ?auto_19854 ?auto_19855 ) ( ON ?auto_19854 ?auto_19858 ) ( CLEAR ?auto_19854 ) ( not ( = ?auto_19853 ?auto_19854 ) ) ( not ( = ?auto_19853 ?auto_19858 ) ) ( not ( = ?auto_19854 ?auto_19858 ) ) ( not ( = ?auto_19857 ?auto_19860 ) ) ( SURFACE-AT ?auto_19852 ?auto_19859 ) ( CLEAR ?auto_19852 ) ( IS-CRATE ?auto_19853 ) ( AVAILABLE ?auto_19857 ) ( AVAILABLE ?auto_19860 ) ( SURFACE-AT ?auto_19853 ?auto_19855 ) ( ON ?auto_19853 ?auto_19861 ) ( CLEAR ?auto_19853 ) ( TRUCK-AT ?auto_19856 ?auto_19859 ) ( not ( = ?auto_19852 ?auto_19853 ) ) ( not ( = ?auto_19852 ?auto_19861 ) ) ( not ( = ?auto_19853 ?auto_19861 ) ) ( not ( = ?auto_19852 ?auto_19854 ) ) ( not ( = ?auto_19852 ?auto_19858 ) ) ( not ( = ?auto_19854 ?auto_19861 ) ) ( not ( = ?auto_19858 ?auto_19861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19852 ?auto_19853 )
      ( MAKE-1CRATE ?auto_19853 ?auto_19854 )
      ( MAKE-2CRATE-VERIFY ?auto_19852 ?auto_19853 ?auto_19854 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19864 - SURFACE
      ?auto_19865 - SURFACE
    )
    :vars
    (
      ?auto_19866 - HOIST
      ?auto_19867 - PLACE
      ?auto_19869 - PLACE
      ?auto_19870 - HOIST
      ?auto_19871 - SURFACE
      ?auto_19868 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19866 ?auto_19867 ) ( SURFACE-AT ?auto_19864 ?auto_19867 ) ( CLEAR ?auto_19864 ) ( IS-CRATE ?auto_19865 ) ( AVAILABLE ?auto_19866 ) ( not ( = ?auto_19869 ?auto_19867 ) ) ( HOIST-AT ?auto_19870 ?auto_19869 ) ( AVAILABLE ?auto_19870 ) ( SURFACE-AT ?auto_19865 ?auto_19869 ) ( ON ?auto_19865 ?auto_19871 ) ( CLEAR ?auto_19865 ) ( TRUCK-AT ?auto_19868 ?auto_19867 ) ( not ( = ?auto_19864 ?auto_19865 ) ) ( not ( = ?auto_19864 ?auto_19871 ) ) ( not ( = ?auto_19865 ?auto_19871 ) ) ( not ( = ?auto_19866 ?auto_19870 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19868 ?auto_19867 ?auto_19869 )
      ( !LIFT ?auto_19870 ?auto_19865 ?auto_19871 ?auto_19869 )
      ( !LOAD ?auto_19870 ?auto_19865 ?auto_19868 ?auto_19869 )
      ( !DRIVE ?auto_19868 ?auto_19869 ?auto_19867 )
      ( !UNLOAD ?auto_19866 ?auto_19865 ?auto_19868 ?auto_19867 )
      ( !DROP ?auto_19866 ?auto_19865 ?auto_19864 ?auto_19867 )
      ( MAKE-1CRATE-VERIFY ?auto_19864 ?auto_19865 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19876 - SURFACE
      ?auto_19877 - SURFACE
      ?auto_19878 - SURFACE
      ?auto_19879 - SURFACE
    )
    :vars
    (
      ?auto_19883 - HOIST
      ?auto_19880 - PLACE
      ?auto_19881 - PLACE
      ?auto_19885 - HOIST
      ?auto_19884 - SURFACE
      ?auto_19887 - SURFACE
      ?auto_19886 - SURFACE
      ?auto_19882 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19883 ?auto_19880 ) ( IS-CRATE ?auto_19879 ) ( not ( = ?auto_19881 ?auto_19880 ) ) ( HOIST-AT ?auto_19885 ?auto_19881 ) ( SURFACE-AT ?auto_19879 ?auto_19881 ) ( ON ?auto_19879 ?auto_19884 ) ( CLEAR ?auto_19879 ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( not ( = ?auto_19878 ?auto_19884 ) ) ( not ( = ?auto_19879 ?auto_19884 ) ) ( not ( = ?auto_19883 ?auto_19885 ) ) ( IS-CRATE ?auto_19878 ) ( SURFACE-AT ?auto_19878 ?auto_19881 ) ( ON ?auto_19878 ?auto_19887 ) ( CLEAR ?auto_19878 ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19887 ) ) ( not ( = ?auto_19878 ?auto_19887 ) ) ( SURFACE-AT ?auto_19876 ?auto_19880 ) ( CLEAR ?auto_19876 ) ( IS-CRATE ?auto_19877 ) ( AVAILABLE ?auto_19883 ) ( AVAILABLE ?auto_19885 ) ( SURFACE-AT ?auto_19877 ?auto_19881 ) ( ON ?auto_19877 ?auto_19886 ) ( CLEAR ?auto_19877 ) ( TRUCK-AT ?auto_19882 ?auto_19880 ) ( not ( = ?auto_19876 ?auto_19877 ) ) ( not ( = ?auto_19876 ?auto_19886 ) ) ( not ( = ?auto_19877 ?auto_19886 ) ) ( not ( = ?auto_19876 ?auto_19878 ) ) ( not ( = ?auto_19876 ?auto_19887 ) ) ( not ( = ?auto_19878 ?auto_19886 ) ) ( not ( = ?auto_19887 ?auto_19886 ) ) ( not ( = ?auto_19876 ?auto_19879 ) ) ( not ( = ?auto_19876 ?auto_19884 ) ) ( not ( = ?auto_19877 ?auto_19879 ) ) ( not ( = ?auto_19877 ?auto_19884 ) ) ( not ( = ?auto_19879 ?auto_19887 ) ) ( not ( = ?auto_19879 ?auto_19886 ) ) ( not ( = ?auto_19884 ?auto_19887 ) ) ( not ( = ?auto_19884 ?auto_19886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19876 ?auto_19877 ?auto_19878 )
      ( MAKE-1CRATE ?auto_19878 ?auto_19879 )
      ( MAKE-3CRATE-VERIFY ?auto_19876 ?auto_19877 ?auto_19878 ?auto_19879 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19890 - SURFACE
      ?auto_19891 - SURFACE
    )
    :vars
    (
      ?auto_19892 - HOIST
      ?auto_19893 - PLACE
      ?auto_19895 - PLACE
      ?auto_19896 - HOIST
      ?auto_19897 - SURFACE
      ?auto_19894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19892 ?auto_19893 ) ( SURFACE-AT ?auto_19890 ?auto_19893 ) ( CLEAR ?auto_19890 ) ( IS-CRATE ?auto_19891 ) ( AVAILABLE ?auto_19892 ) ( not ( = ?auto_19895 ?auto_19893 ) ) ( HOIST-AT ?auto_19896 ?auto_19895 ) ( AVAILABLE ?auto_19896 ) ( SURFACE-AT ?auto_19891 ?auto_19895 ) ( ON ?auto_19891 ?auto_19897 ) ( CLEAR ?auto_19891 ) ( TRUCK-AT ?auto_19894 ?auto_19893 ) ( not ( = ?auto_19890 ?auto_19891 ) ) ( not ( = ?auto_19890 ?auto_19897 ) ) ( not ( = ?auto_19891 ?auto_19897 ) ) ( not ( = ?auto_19892 ?auto_19896 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19894 ?auto_19893 ?auto_19895 )
      ( !LIFT ?auto_19896 ?auto_19891 ?auto_19897 ?auto_19895 )
      ( !LOAD ?auto_19896 ?auto_19891 ?auto_19894 ?auto_19895 )
      ( !DRIVE ?auto_19894 ?auto_19895 ?auto_19893 )
      ( !UNLOAD ?auto_19892 ?auto_19891 ?auto_19894 ?auto_19893 )
      ( !DROP ?auto_19892 ?auto_19891 ?auto_19890 ?auto_19893 )
      ( MAKE-1CRATE-VERIFY ?auto_19890 ?auto_19891 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_19903 - SURFACE
      ?auto_19904 - SURFACE
      ?auto_19905 - SURFACE
      ?auto_19906 - SURFACE
      ?auto_19907 - SURFACE
    )
    :vars
    (
      ?auto_19908 - HOIST
      ?auto_19911 - PLACE
      ?auto_19909 - PLACE
      ?auto_19913 - HOIST
      ?auto_19910 - SURFACE
      ?auto_19917 - PLACE
      ?auto_19916 - HOIST
      ?auto_19915 - SURFACE
      ?auto_19918 - SURFACE
      ?auto_19914 - SURFACE
      ?auto_19912 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19908 ?auto_19911 ) ( IS-CRATE ?auto_19907 ) ( not ( = ?auto_19909 ?auto_19911 ) ) ( HOIST-AT ?auto_19913 ?auto_19909 ) ( AVAILABLE ?auto_19913 ) ( SURFACE-AT ?auto_19907 ?auto_19909 ) ( ON ?auto_19907 ?auto_19910 ) ( CLEAR ?auto_19907 ) ( not ( = ?auto_19906 ?auto_19907 ) ) ( not ( = ?auto_19906 ?auto_19910 ) ) ( not ( = ?auto_19907 ?auto_19910 ) ) ( not ( = ?auto_19908 ?auto_19913 ) ) ( IS-CRATE ?auto_19906 ) ( not ( = ?auto_19917 ?auto_19911 ) ) ( HOIST-AT ?auto_19916 ?auto_19917 ) ( SURFACE-AT ?auto_19906 ?auto_19917 ) ( ON ?auto_19906 ?auto_19915 ) ( CLEAR ?auto_19906 ) ( not ( = ?auto_19905 ?auto_19906 ) ) ( not ( = ?auto_19905 ?auto_19915 ) ) ( not ( = ?auto_19906 ?auto_19915 ) ) ( not ( = ?auto_19908 ?auto_19916 ) ) ( IS-CRATE ?auto_19905 ) ( SURFACE-AT ?auto_19905 ?auto_19917 ) ( ON ?auto_19905 ?auto_19918 ) ( CLEAR ?auto_19905 ) ( not ( = ?auto_19904 ?auto_19905 ) ) ( not ( = ?auto_19904 ?auto_19918 ) ) ( not ( = ?auto_19905 ?auto_19918 ) ) ( SURFACE-AT ?auto_19903 ?auto_19911 ) ( CLEAR ?auto_19903 ) ( IS-CRATE ?auto_19904 ) ( AVAILABLE ?auto_19908 ) ( AVAILABLE ?auto_19916 ) ( SURFACE-AT ?auto_19904 ?auto_19917 ) ( ON ?auto_19904 ?auto_19914 ) ( CLEAR ?auto_19904 ) ( TRUCK-AT ?auto_19912 ?auto_19911 ) ( not ( = ?auto_19903 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19914 ) ) ( not ( = ?auto_19904 ?auto_19914 ) ) ( not ( = ?auto_19903 ?auto_19905 ) ) ( not ( = ?auto_19903 ?auto_19918 ) ) ( not ( = ?auto_19905 ?auto_19914 ) ) ( not ( = ?auto_19918 ?auto_19914 ) ) ( not ( = ?auto_19903 ?auto_19906 ) ) ( not ( = ?auto_19903 ?auto_19915 ) ) ( not ( = ?auto_19904 ?auto_19906 ) ) ( not ( = ?auto_19904 ?auto_19915 ) ) ( not ( = ?auto_19906 ?auto_19918 ) ) ( not ( = ?auto_19906 ?auto_19914 ) ) ( not ( = ?auto_19915 ?auto_19918 ) ) ( not ( = ?auto_19915 ?auto_19914 ) ) ( not ( = ?auto_19903 ?auto_19907 ) ) ( not ( = ?auto_19903 ?auto_19910 ) ) ( not ( = ?auto_19904 ?auto_19907 ) ) ( not ( = ?auto_19904 ?auto_19910 ) ) ( not ( = ?auto_19905 ?auto_19907 ) ) ( not ( = ?auto_19905 ?auto_19910 ) ) ( not ( = ?auto_19907 ?auto_19915 ) ) ( not ( = ?auto_19907 ?auto_19918 ) ) ( not ( = ?auto_19907 ?auto_19914 ) ) ( not ( = ?auto_19909 ?auto_19917 ) ) ( not ( = ?auto_19913 ?auto_19916 ) ) ( not ( = ?auto_19910 ?auto_19915 ) ) ( not ( = ?auto_19910 ?auto_19918 ) ) ( not ( = ?auto_19910 ?auto_19914 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19903 ?auto_19904 ?auto_19905 ?auto_19906 )
      ( MAKE-1CRATE ?auto_19906 ?auto_19907 )
      ( MAKE-4CRATE-VERIFY ?auto_19903 ?auto_19904 ?auto_19905 ?auto_19906 ?auto_19907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19921 - SURFACE
      ?auto_19922 - SURFACE
    )
    :vars
    (
      ?auto_19923 - HOIST
      ?auto_19924 - PLACE
      ?auto_19926 - PLACE
      ?auto_19927 - HOIST
      ?auto_19928 - SURFACE
      ?auto_19925 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19923 ?auto_19924 ) ( SURFACE-AT ?auto_19921 ?auto_19924 ) ( CLEAR ?auto_19921 ) ( IS-CRATE ?auto_19922 ) ( AVAILABLE ?auto_19923 ) ( not ( = ?auto_19926 ?auto_19924 ) ) ( HOIST-AT ?auto_19927 ?auto_19926 ) ( AVAILABLE ?auto_19927 ) ( SURFACE-AT ?auto_19922 ?auto_19926 ) ( ON ?auto_19922 ?auto_19928 ) ( CLEAR ?auto_19922 ) ( TRUCK-AT ?auto_19925 ?auto_19924 ) ( not ( = ?auto_19921 ?auto_19922 ) ) ( not ( = ?auto_19921 ?auto_19928 ) ) ( not ( = ?auto_19922 ?auto_19928 ) ) ( not ( = ?auto_19923 ?auto_19927 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19925 ?auto_19924 ?auto_19926 )
      ( !LIFT ?auto_19927 ?auto_19922 ?auto_19928 ?auto_19926 )
      ( !LOAD ?auto_19927 ?auto_19922 ?auto_19925 ?auto_19926 )
      ( !DRIVE ?auto_19925 ?auto_19926 ?auto_19924 )
      ( !UNLOAD ?auto_19923 ?auto_19922 ?auto_19925 ?auto_19924 )
      ( !DROP ?auto_19923 ?auto_19922 ?auto_19921 ?auto_19924 )
      ( MAKE-1CRATE-VERIFY ?auto_19921 ?auto_19922 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_19935 - SURFACE
      ?auto_19936 - SURFACE
      ?auto_19937 - SURFACE
      ?auto_19938 - SURFACE
      ?auto_19939 - SURFACE
      ?auto_19940 - SURFACE
    )
    :vars
    (
      ?auto_19944 - HOIST
      ?auto_19946 - PLACE
      ?auto_19945 - PLACE
      ?auto_19943 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19951 - PLACE
      ?auto_19950 - HOIST
      ?auto_19948 - SURFACE
      ?auto_19947 - PLACE
      ?auto_19954 - HOIST
      ?auto_19952 - SURFACE
      ?auto_19953 - SURFACE
      ?auto_19949 - SURFACE
      ?auto_19941 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19944 ?auto_19946 ) ( IS-CRATE ?auto_19940 ) ( not ( = ?auto_19945 ?auto_19946 ) ) ( HOIST-AT ?auto_19943 ?auto_19945 ) ( AVAILABLE ?auto_19943 ) ( SURFACE-AT ?auto_19940 ?auto_19945 ) ( ON ?auto_19940 ?auto_19942 ) ( CLEAR ?auto_19940 ) ( not ( = ?auto_19939 ?auto_19940 ) ) ( not ( = ?auto_19939 ?auto_19942 ) ) ( not ( = ?auto_19940 ?auto_19942 ) ) ( not ( = ?auto_19944 ?auto_19943 ) ) ( IS-CRATE ?auto_19939 ) ( not ( = ?auto_19951 ?auto_19946 ) ) ( HOIST-AT ?auto_19950 ?auto_19951 ) ( AVAILABLE ?auto_19950 ) ( SURFACE-AT ?auto_19939 ?auto_19951 ) ( ON ?auto_19939 ?auto_19948 ) ( CLEAR ?auto_19939 ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19948 ) ) ( not ( = ?auto_19939 ?auto_19948 ) ) ( not ( = ?auto_19944 ?auto_19950 ) ) ( IS-CRATE ?auto_19938 ) ( not ( = ?auto_19947 ?auto_19946 ) ) ( HOIST-AT ?auto_19954 ?auto_19947 ) ( SURFACE-AT ?auto_19938 ?auto_19947 ) ( ON ?auto_19938 ?auto_19952 ) ( CLEAR ?auto_19938 ) ( not ( = ?auto_19937 ?auto_19938 ) ) ( not ( = ?auto_19937 ?auto_19952 ) ) ( not ( = ?auto_19938 ?auto_19952 ) ) ( not ( = ?auto_19944 ?auto_19954 ) ) ( IS-CRATE ?auto_19937 ) ( SURFACE-AT ?auto_19937 ?auto_19947 ) ( ON ?auto_19937 ?auto_19953 ) ( CLEAR ?auto_19937 ) ( not ( = ?auto_19936 ?auto_19937 ) ) ( not ( = ?auto_19936 ?auto_19953 ) ) ( not ( = ?auto_19937 ?auto_19953 ) ) ( SURFACE-AT ?auto_19935 ?auto_19946 ) ( CLEAR ?auto_19935 ) ( IS-CRATE ?auto_19936 ) ( AVAILABLE ?auto_19944 ) ( AVAILABLE ?auto_19954 ) ( SURFACE-AT ?auto_19936 ?auto_19947 ) ( ON ?auto_19936 ?auto_19949 ) ( CLEAR ?auto_19936 ) ( TRUCK-AT ?auto_19941 ?auto_19946 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19949 ) ) ( not ( = ?auto_19936 ?auto_19949 ) ) ( not ( = ?auto_19935 ?auto_19937 ) ) ( not ( = ?auto_19935 ?auto_19953 ) ) ( not ( = ?auto_19937 ?auto_19949 ) ) ( not ( = ?auto_19953 ?auto_19949 ) ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19935 ?auto_19952 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19952 ) ) ( not ( = ?auto_19938 ?auto_19953 ) ) ( not ( = ?auto_19938 ?auto_19949 ) ) ( not ( = ?auto_19952 ?auto_19953 ) ) ( not ( = ?auto_19952 ?auto_19949 ) ) ( not ( = ?auto_19935 ?auto_19939 ) ) ( not ( = ?auto_19935 ?auto_19948 ) ) ( not ( = ?auto_19936 ?auto_19939 ) ) ( not ( = ?auto_19936 ?auto_19948 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19948 ) ) ( not ( = ?auto_19939 ?auto_19952 ) ) ( not ( = ?auto_19939 ?auto_19953 ) ) ( not ( = ?auto_19939 ?auto_19949 ) ) ( not ( = ?auto_19951 ?auto_19947 ) ) ( not ( = ?auto_19950 ?auto_19954 ) ) ( not ( = ?auto_19948 ?auto_19952 ) ) ( not ( = ?auto_19948 ?auto_19953 ) ) ( not ( = ?auto_19948 ?auto_19949 ) ) ( not ( = ?auto_19935 ?auto_19940 ) ) ( not ( = ?auto_19935 ?auto_19942 ) ) ( not ( = ?auto_19936 ?auto_19940 ) ) ( not ( = ?auto_19936 ?auto_19942 ) ) ( not ( = ?auto_19937 ?auto_19940 ) ) ( not ( = ?auto_19937 ?auto_19942 ) ) ( not ( = ?auto_19938 ?auto_19940 ) ) ( not ( = ?auto_19938 ?auto_19942 ) ) ( not ( = ?auto_19940 ?auto_19948 ) ) ( not ( = ?auto_19940 ?auto_19952 ) ) ( not ( = ?auto_19940 ?auto_19953 ) ) ( not ( = ?auto_19940 ?auto_19949 ) ) ( not ( = ?auto_19945 ?auto_19951 ) ) ( not ( = ?auto_19945 ?auto_19947 ) ) ( not ( = ?auto_19943 ?auto_19950 ) ) ( not ( = ?auto_19943 ?auto_19954 ) ) ( not ( = ?auto_19942 ?auto_19948 ) ) ( not ( = ?auto_19942 ?auto_19952 ) ) ( not ( = ?auto_19942 ?auto_19953 ) ) ( not ( = ?auto_19942 ?auto_19949 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 ?auto_19939 )
      ( MAKE-1CRATE ?auto_19939 ?auto_19940 )
      ( MAKE-5CRATE-VERIFY ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 ?auto_19939 ?auto_19940 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19957 - SURFACE
      ?auto_19958 - SURFACE
    )
    :vars
    (
      ?auto_19959 - HOIST
      ?auto_19960 - PLACE
      ?auto_19962 - PLACE
      ?auto_19963 - HOIST
      ?auto_19964 - SURFACE
      ?auto_19961 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19959 ?auto_19960 ) ( SURFACE-AT ?auto_19957 ?auto_19960 ) ( CLEAR ?auto_19957 ) ( IS-CRATE ?auto_19958 ) ( AVAILABLE ?auto_19959 ) ( not ( = ?auto_19962 ?auto_19960 ) ) ( HOIST-AT ?auto_19963 ?auto_19962 ) ( AVAILABLE ?auto_19963 ) ( SURFACE-AT ?auto_19958 ?auto_19962 ) ( ON ?auto_19958 ?auto_19964 ) ( CLEAR ?auto_19958 ) ( TRUCK-AT ?auto_19961 ?auto_19960 ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( not ( = ?auto_19957 ?auto_19964 ) ) ( not ( = ?auto_19958 ?auto_19964 ) ) ( not ( = ?auto_19959 ?auto_19963 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19961 ?auto_19960 ?auto_19962 )
      ( !LIFT ?auto_19963 ?auto_19958 ?auto_19964 ?auto_19962 )
      ( !LOAD ?auto_19963 ?auto_19958 ?auto_19961 ?auto_19962 )
      ( !DRIVE ?auto_19961 ?auto_19962 ?auto_19960 )
      ( !UNLOAD ?auto_19959 ?auto_19958 ?auto_19961 ?auto_19960 )
      ( !DROP ?auto_19959 ?auto_19958 ?auto_19957 ?auto_19960 )
      ( MAKE-1CRATE-VERIFY ?auto_19957 ?auto_19958 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_19972 - SURFACE
      ?auto_19973 - SURFACE
      ?auto_19974 - SURFACE
      ?auto_19975 - SURFACE
      ?auto_19976 - SURFACE
      ?auto_19977 - SURFACE
      ?auto_19978 - SURFACE
    )
    :vars
    (
      ?auto_19980 - HOIST
      ?auto_19984 - PLACE
      ?auto_19981 - PLACE
      ?auto_19979 - HOIST
      ?auto_19983 - SURFACE
      ?auto_19994 - PLACE
      ?auto_19986 - HOIST
      ?auto_19995 - SURFACE
      ?auto_19988 - PLACE
      ?auto_19992 - HOIST
      ?auto_19993 - SURFACE
      ?auto_19985 - PLACE
      ?auto_19989 - HOIST
      ?auto_19987 - SURFACE
      ?auto_19990 - SURFACE
      ?auto_19991 - SURFACE
      ?auto_19982 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19980 ?auto_19984 ) ( IS-CRATE ?auto_19978 ) ( not ( = ?auto_19981 ?auto_19984 ) ) ( HOIST-AT ?auto_19979 ?auto_19981 ) ( AVAILABLE ?auto_19979 ) ( SURFACE-AT ?auto_19978 ?auto_19981 ) ( ON ?auto_19978 ?auto_19983 ) ( CLEAR ?auto_19978 ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19983 ) ) ( not ( = ?auto_19978 ?auto_19983 ) ) ( not ( = ?auto_19980 ?auto_19979 ) ) ( IS-CRATE ?auto_19977 ) ( not ( = ?auto_19994 ?auto_19984 ) ) ( HOIST-AT ?auto_19986 ?auto_19994 ) ( AVAILABLE ?auto_19986 ) ( SURFACE-AT ?auto_19977 ?auto_19994 ) ( ON ?auto_19977 ?auto_19995 ) ( CLEAR ?auto_19977 ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( not ( = ?auto_19976 ?auto_19995 ) ) ( not ( = ?auto_19977 ?auto_19995 ) ) ( not ( = ?auto_19980 ?auto_19986 ) ) ( IS-CRATE ?auto_19976 ) ( not ( = ?auto_19988 ?auto_19984 ) ) ( HOIST-AT ?auto_19992 ?auto_19988 ) ( AVAILABLE ?auto_19992 ) ( SURFACE-AT ?auto_19976 ?auto_19988 ) ( ON ?auto_19976 ?auto_19993 ) ( CLEAR ?auto_19976 ) ( not ( = ?auto_19975 ?auto_19976 ) ) ( not ( = ?auto_19975 ?auto_19993 ) ) ( not ( = ?auto_19976 ?auto_19993 ) ) ( not ( = ?auto_19980 ?auto_19992 ) ) ( IS-CRATE ?auto_19975 ) ( not ( = ?auto_19985 ?auto_19984 ) ) ( HOIST-AT ?auto_19989 ?auto_19985 ) ( SURFACE-AT ?auto_19975 ?auto_19985 ) ( ON ?auto_19975 ?auto_19987 ) ( CLEAR ?auto_19975 ) ( not ( = ?auto_19974 ?auto_19975 ) ) ( not ( = ?auto_19974 ?auto_19987 ) ) ( not ( = ?auto_19975 ?auto_19987 ) ) ( not ( = ?auto_19980 ?auto_19989 ) ) ( IS-CRATE ?auto_19974 ) ( SURFACE-AT ?auto_19974 ?auto_19985 ) ( ON ?auto_19974 ?auto_19990 ) ( CLEAR ?auto_19974 ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19990 ) ) ( not ( = ?auto_19974 ?auto_19990 ) ) ( SURFACE-AT ?auto_19972 ?auto_19984 ) ( CLEAR ?auto_19972 ) ( IS-CRATE ?auto_19973 ) ( AVAILABLE ?auto_19980 ) ( AVAILABLE ?auto_19989 ) ( SURFACE-AT ?auto_19973 ?auto_19985 ) ( ON ?auto_19973 ?auto_19991 ) ( CLEAR ?auto_19973 ) ( TRUCK-AT ?auto_19982 ?auto_19984 ) ( not ( = ?auto_19972 ?auto_19973 ) ) ( not ( = ?auto_19972 ?auto_19991 ) ) ( not ( = ?auto_19973 ?auto_19991 ) ) ( not ( = ?auto_19972 ?auto_19974 ) ) ( not ( = ?auto_19972 ?auto_19990 ) ) ( not ( = ?auto_19974 ?auto_19991 ) ) ( not ( = ?auto_19990 ?auto_19991 ) ) ( not ( = ?auto_19972 ?auto_19975 ) ) ( not ( = ?auto_19972 ?auto_19987 ) ) ( not ( = ?auto_19973 ?auto_19975 ) ) ( not ( = ?auto_19973 ?auto_19987 ) ) ( not ( = ?auto_19975 ?auto_19990 ) ) ( not ( = ?auto_19975 ?auto_19991 ) ) ( not ( = ?auto_19987 ?auto_19990 ) ) ( not ( = ?auto_19987 ?auto_19991 ) ) ( not ( = ?auto_19972 ?auto_19976 ) ) ( not ( = ?auto_19972 ?auto_19993 ) ) ( not ( = ?auto_19973 ?auto_19976 ) ) ( not ( = ?auto_19973 ?auto_19993 ) ) ( not ( = ?auto_19974 ?auto_19976 ) ) ( not ( = ?auto_19974 ?auto_19993 ) ) ( not ( = ?auto_19976 ?auto_19987 ) ) ( not ( = ?auto_19976 ?auto_19990 ) ) ( not ( = ?auto_19976 ?auto_19991 ) ) ( not ( = ?auto_19988 ?auto_19985 ) ) ( not ( = ?auto_19992 ?auto_19989 ) ) ( not ( = ?auto_19993 ?auto_19987 ) ) ( not ( = ?auto_19993 ?auto_19990 ) ) ( not ( = ?auto_19993 ?auto_19991 ) ) ( not ( = ?auto_19972 ?auto_19977 ) ) ( not ( = ?auto_19972 ?auto_19995 ) ) ( not ( = ?auto_19973 ?auto_19977 ) ) ( not ( = ?auto_19973 ?auto_19995 ) ) ( not ( = ?auto_19974 ?auto_19977 ) ) ( not ( = ?auto_19974 ?auto_19995 ) ) ( not ( = ?auto_19975 ?auto_19977 ) ) ( not ( = ?auto_19975 ?auto_19995 ) ) ( not ( = ?auto_19977 ?auto_19993 ) ) ( not ( = ?auto_19977 ?auto_19987 ) ) ( not ( = ?auto_19977 ?auto_19990 ) ) ( not ( = ?auto_19977 ?auto_19991 ) ) ( not ( = ?auto_19994 ?auto_19988 ) ) ( not ( = ?auto_19994 ?auto_19985 ) ) ( not ( = ?auto_19986 ?auto_19992 ) ) ( not ( = ?auto_19986 ?auto_19989 ) ) ( not ( = ?auto_19995 ?auto_19993 ) ) ( not ( = ?auto_19995 ?auto_19987 ) ) ( not ( = ?auto_19995 ?auto_19990 ) ) ( not ( = ?auto_19995 ?auto_19991 ) ) ( not ( = ?auto_19972 ?auto_19978 ) ) ( not ( = ?auto_19972 ?auto_19983 ) ) ( not ( = ?auto_19973 ?auto_19978 ) ) ( not ( = ?auto_19973 ?auto_19983 ) ) ( not ( = ?auto_19974 ?auto_19978 ) ) ( not ( = ?auto_19974 ?auto_19983 ) ) ( not ( = ?auto_19975 ?auto_19978 ) ) ( not ( = ?auto_19975 ?auto_19983 ) ) ( not ( = ?auto_19976 ?auto_19978 ) ) ( not ( = ?auto_19976 ?auto_19983 ) ) ( not ( = ?auto_19978 ?auto_19995 ) ) ( not ( = ?auto_19978 ?auto_19993 ) ) ( not ( = ?auto_19978 ?auto_19987 ) ) ( not ( = ?auto_19978 ?auto_19990 ) ) ( not ( = ?auto_19978 ?auto_19991 ) ) ( not ( = ?auto_19981 ?auto_19994 ) ) ( not ( = ?auto_19981 ?auto_19988 ) ) ( not ( = ?auto_19981 ?auto_19985 ) ) ( not ( = ?auto_19979 ?auto_19986 ) ) ( not ( = ?auto_19979 ?auto_19992 ) ) ( not ( = ?auto_19979 ?auto_19989 ) ) ( not ( = ?auto_19983 ?auto_19995 ) ) ( not ( = ?auto_19983 ?auto_19993 ) ) ( not ( = ?auto_19983 ?auto_19987 ) ) ( not ( = ?auto_19983 ?auto_19990 ) ) ( not ( = ?auto_19983 ?auto_19991 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19975 ?auto_19976 ?auto_19977 )
      ( MAKE-1CRATE ?auto_19977 ?auto_19978 )
      ( MAKE-6CRATE-VERIFY ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19975 ?auto_19976 ?auto_19977 ?auto_19978 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19998 - SURFACE
      ?auto_19999 - SURFACE
    )
    :vars
    (
      ?auto_20000 - HOIST
      ?auto_20001 - PLACE
      ?auto_20003 - PLACE
      ?auto_20004 - HOIST
      ?auto_20005 - SURFACE
      ?auto_20002 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20000 ?auto_20001 ) ( SURFACE-AT ?auto_19998 ?auto_20001 ) ( CLEAR ?auto_19998 ) ( IS-CRATE ?auto_19999 ) ( AVAILABLE ?auto_20000 ) ( not ( = ?auto_20003 ?auto_20001 ) ) ( HOIST-AT ?auto_20004 ?auto_20003 ) ( AVAILABLE ?auto_20004 ) ( SURFACE-AT ?auto_19999 ?auto_20003 ) ( ON ?auto_19999 ?auto_20005 ) ( CLEAR ?auto_19999 ) ( TRUCK-AT ?auto_20002 ?auto_20001 ) ( not ( = ?auto_19998 ?auto_19999 ) ) ( not ( = ?auto_19998 ?auto_20005 ) ) ( not ( = ?auto_19999 ?auto_20005 ) ) ( not ( = ?auto_20000 ?auto_20004 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20002 ?auto_20001 ?auto_20003 )
      ( !LIFT ?auto_20004 ?auto_19999 ?auto_20005 ?auto_20003 )
      ( !LOAD ?auto_20004 ?auto_19999 ?auto_20002 ?auto_20003 )
      ( !DRIVE ?auto_20002 ?auto_20003 ?auto_20001 )
      ( !UNLOAD ?auto_20000 ?auto_19999 ?auto_20002 ?auto_20001 )
      ( !DROP ?auto_20000 ?auto_19999 ?auto_19998 ?auto_20001 )
      ( MAKE-1CRATE-VERIFY ?auto_19998 ?auto_19999 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20014 - SURFACE
      ?auto_20015 - SURFACE
      ?auto_20016 - SURFACE
      ?auto_20017 - SURFACE
      ?auto_20018 - SURFACE
      ?auto_20019 - SURFACE
      ?auto_20021 - SURFACE
      ?auto_20020 - SURFACE
    )
    :vars
    (
      ?auto_20027 - HOIST
      ?auto_20026 - PLACE
      ?auto_20024 - PLACE
      ?auto_20022 - HOIST
      ?auto_20023 - SURFACE
      ?auto_20034 - PLACE
      ?auto_20029 - HOIST
      ?auto_20041 - SURFACE
      ?auto_20031 - PLACE
      ?auto_20036 - HOIST
      ?auto_20032 - SURFACE
      ?auto_20035 - PLACE
      ?auto_20030 - HOIST
      ?auto_20039 - SURFACE
      ?auto_20040 - PLACE
      ?auto_20033 - HOIST
      ?auto_20037 - SURFACE
      ?auto_20038 - SURFACE
      ?auto_20028 - SURFACE
      ?auto_20025 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20027 ?auto_20026 ) ( IS-CRATE ?auto_20020 ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( HOIST-AT ?auto_20022 ?auto_20024 ) ( AVAILABLE ?auto_20022 ) ( SURFACE-AT ?auto_20020 ?auto_20024 ) ( ON ?auto_20020 ?auto_20023 ) ( CLEAR ?auto_20020 ) ( not ( = ?auto_20021 ?auto_20020 ) ) ( not ( = ?auto_20021 ?auto_20023 ) ) ( not ( = ?auto_20020 ?auto_20023 ) ) ( not ( = ?auto_20027 ?auto_20022 ) ) ( IS-CRATE ?auto_20021 ) ( not ( = ?auto_20034 ?auto_20026 ) ) ( HOIST-AT ?auto_20029 ?auto_20034 ) ( AVAILABLE ?auto_20029 ) ( SURFACE-AT ?auto_20021 ?auto_20034 ) ( ON ?auto_20021 ?auto_20041 ) ( CLEAR ?auto_20021 ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20041 ) ) ( not ( = ?auto_20021 ?auto_20041 ) ) ( not ( = ?auto_20027 ?auto_20029 ) ) ( IS-CRATE ?auto_20019 ) ( not ( = ?auto_20031 ?auto_20026 ) ) ( HOIST-AT ?auto_20036 ?auto_20031 ) ( AVAILABLE ?auto_20036 ) ( SURFACE-AT ?auto_20019 ?auto_20031 ) ( ON ?auto_20019 ?auto_20032 ) ( CLEAR ?auto_20019 ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20032 ) ) ( not ( = ?auto_20019 ?auto_20032 ) ) ( not ( = ?auto_20027 ?auto_20036 ) ) ( IS-CRATE ?auto_20018 ) ( not ( = ?auto_20035 ?auto_20026 ) ) ( HOIST-AT ?auto_20030 ?auto_20035 ) ( AVAILABLE ?auto_20030 ) ( SURFACE-AT ?auto_20018 ?auto_20035 ) ( ON ?auto_20018 ?auto_20039 ) ( CLEAR ?auto_20018 ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( not ( = ?auto_20017 ?auto_20039 ) ) ( not ( = ?auto_20018 ?auto_20039 ) ) ( not ( = ?auto_20027 ?auto_20030 ) ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20040 ?auto_20026 ) ) ( HOIST-AT ?auto_20033 ?auto_20040 ) ( SURFACE-AT ?auto_20017 ?auto_20040 ) ( ON ?auto_20017 ?auto_20037 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20037 ) ) ( not ( = ?auto_20017 ?auto_20037 ) ) ( not ( = ?auto_20027 ?auto_20033 ) ) ( IS-CRATE ?auto_20016 ) ( SURFACE-AT ?auto_20016 ?auto_20040 ) ( ON ?auto_20016 ?auto_20038 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20015 ?auto_20016 ) ) ( not ( = ?auto_20015 ?auto_20038 ) ) ( not ( = ?auto_20016 ?auto_20038 ) ) ( SURFACE-AT ?auto_20014 ?auto_20026 ) ( CLEAR ?auto_20014 ) ( IS-CRATE ?auto_20015 ) ( AVAILABLE ?auto_20027 ) ( AVAILABLE ?auto_20033 ) ( SURFACE-AT ?auto_20015 ?auto_20040 ) ( ON ?auto_20015 ?auto_20028 ) ( CLEAR ?auto_20015 ) ( TRUCK-AT ?auto_20025 ?auto_20026 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20028 ) ) ( not ( = ?auto_20015 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20038 ) ) ( not ( = ?auto_20016 ?auto_20028 ) ) ( not ( = ?auto_20038 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20037 ) ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20037 ) ) ( not ( = ?auto_20017 ?auto_20038 ) ) ( not ( = ?auto_20017 ?auto_20028 ) ) ( not ( = ?auto_20037 ?auto_20038 ) ) ( not ( = ?auto_20037 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20018 ) ) ( not ( = ?auto_20014 ?auto_20039 ) ) ( not ( = ?auto_20015 ?auto_20018 ) ) ( not ( = ?auto_20015 ?auto_20039 ) ) ( not ( = ?auto_20016 ?auto_20018 ) ) ( not ( = ?auto_20016 ?auto_20039 ) ) ( not ( = ?auto_20018 ?auto_20037 ) ) ( not ( = ?auto_20018 ?auto_20038 ) ) ( not ( = ?auto_20018 ?auto_20028 ) ) ( not ( = ?auto_20035 ?auto_20040 ) ) ( not ( = ?auto_20030 ?auto_20033 ) ) ( not ( = ?auto_20039 ?auto_20037 ) ) ( not ( = ?auto_20039 ?auto_20038 ) ) ( not ( = ?auto_20039 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20019 ) ) ( not ( = ?auto_20014 ?auto_20032 ) ) ( not ( = ?auto_20015 ?auto_20019 ) ) ( not ( = ?auto_20015 ?auto_20032 ) ) ( not ( = ?auto_20016 ?auto_20019 ) ) ( not ( = ?auto_20016 ?auto_20032 ) ) ( not ( = ?auto_20017 ?auto_20019 ) ) ( not ( = ?auto_20017 ?auto_20032 ) ) ( not ( = ?auto_20019 ?auto_20039 ) ) ( not ( = ?auto_20019 ?auto_20037 ) ) ( not ( = ?auto_20019 ?auto_20038 ) ) ( not ( = ?auto_20019 ?auto_20028 ) ) ( not ( = ?auto_20031 ?auto_20035 ) ) ( not ( = ?auto_20031 ?auto_20040 ) ) ( not ( = ?auto_20036 ?auto_20030 ) ) ( not ( = ?auto_20036 ?auto_20033 ) ) ( not ( = ?auto_20032 ?auto_20039 ) ) ( not ( = ?auto_20032 ?auto_20037 ) ) ( not ( = ?auto_20032 ?auto_20038 ) ) ( not ( = ?auto_20032 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20021 ) ) ( not ( = ?auto_20014 ?auto_20041 ) ) ( not ( = ?auto_20015 ?auto_20021 ) ) ( not ( = ?auto_20015 ?auto_20041 ) ) ( not ( = ?auto_20016 ?auto_20021 ) ) ( not ( = ?auto_20016 ?auto_20041 ) ) ( not ( = ?auto_20017 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20041 ) ) ( not ( = ?auto_20018 ?auto_20021 ) ) ( not ( = ?auto_20018 ?auto_20041 ) ) ( not ( = ?auto_20021 ?auto_20032 ) ) ( not ( = ?auto_20021 ?auto_20039 ) ) ( not ( = ?auto_20021 ?auto_20037 ) ) ( not ( = ?auto_20021 ?auto_20038 ) ) ( not ( = ?auto_20021 ?auto_20028 ) ) ( not ( = ?auto_20034 ?auto_20031 ) ) ( not ( = ?auto_20034 ?auto_20035 ) ) ( not ( = ?auto_20034 ?auto_20040 ) ) ( not ( = ?auto_20029 ?auto_20036 ) ) ( not ( = ?auto_20029 ?auto_20030 ) ) ( not ( = ?auto_20029 ?auto_20033 ) ) ( not ( = ?auto_20041 ?auto_20032 ) ) ( not ( = ?auto_20041 ?auto_20039 ) ) ( not ( = ?auto_20041 ?auto_20037 ) ) ( not ( = ?auto_20041 ?auto_20038 ) ) ( not ( = ?auto_20041 ?auto_20028 ) ) ( not ( = ?auto_20014 ?auto_20020 ) ) ( not ( = ?auto_20014 ?auto_20023 ) ) ( not ( = ?auto_20015 ?auto_20020 ) ) ( not ( = ?auto_20015 ?auto_20023 ) ) ( not ( = ?auto_20016 ?auto_20020 ) ) ( not ( = ?auto_20016 ?auto_20023 ) ) ( not ( = ?auto_20017 ?auto_20020 ) ) ( not ( = ?auto_20017 ?auto_20023 ) ) ( not ( = ?auto_20018 ?auto_20020 ) ) ( not ( = ?auto_20018 ?auto_20023 ) ) ( not ( = ?auto_20019 ?auto_20020 ) ) ( not ( = ?auto_20019 ?auto_20023 ) ) ( not ( = ?auto_20020 ?auto_20041 ) ) ( not ( = ?auto_20020 ?auto_20032 ) ) ( not ( = ?auto_20020 ?auto_20039 ) ) ( not ( = ?auto_20020 ?auto_20037 ) ) ( not ( = ?auto_20020 ?auto_20038 ) ) ( not ( = ?auto_20020 ?auto_20028 ) ) ( not ( = ?auto_20024 ?auto_20034 ) ) ( not ( = ?auto_20024 ?auto_20031 ) ) ( not ( = ?auto_20024 ?auto_20035 ) ) ( not ( = ?auto_20024 ?auto_20040 ) ) ( not ( = ?auto_20022 ?auto_20029 ) ) ( not ( = ?auto_20022 ?auto_20036 ) ) ( not ( = ?auto_20022 ?auto_20030 ) ) ( not ( = ?auto_20022 ?auto_20033 ) ) ( not ( = ?auto_20023 ?auto_20041 ) ) ( not ( = ?auto_20023 ?auto_20032 ) ) ( not ( = ?auto_20023 ?auto_20039 ) ) ( not ( = ?auto_20023 ?auto_20037 ) ) ( not ( = ?auto_20023 ?auto_20038 ) ) ( not ( = ?auto_20023 ?auto_20028 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20021 )
      ( MAKE-1CRATE ?auto_20021 ?auto_20020 )
      ( MAKE-7CRATE-VERIFY ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20021 ?auto_20020 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20044 - SURFACE
      ?auto_20045 - SURFACE
    )
    :vars
    (
      ?auto_20046 - HOIST
      ?auto_20047 - PLACE
      ?auto_20049 - PLACE
      ?auto_20050 - HOIST
      ?auto_20051 - SURFACE
      ?auto_20048 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20046 ?auto_20047 ) ( SURFACE-AT ?auto_20044 ?auto_20047 ) ( CLEAR ?auto_20044 ) ( IS-CRATE ?auto_20045 ) ( AVAILABLE ?auto_20046 ) ( not ( = ?auto_20049 ?auto_20047 ) ) ( HOIST-AT ?auto_20050 ?auto_20049 ) ( AVAILABLE ?auto_20050 ) ( SURFACE-AT ?auto_20045 ?auto_20049 ) ( ON ?auto_20045 ?auto_20051 ) ( CLEAR ?auto_20045 ) ( TRUCK-AT ?auto_20048 ?auto_20047 ) ( not ( = ?auto_20044 ?auto_20045 ) ) ( not ( = ?auto_20044 ?auto_20051 ) ) ( not ( = ?auto_20045 ?auto_20051 ) ) ( not ( = ?auto_20046 ?auto_20050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20048 ?auto_20047 ?auto_20049 )
      ( !LIFT ?auto_20050 ?auto_20045 ?auto_20051 ?auto_20049 )
      ( !LOAD ?auto_20050 ?auto_20045 ?auto_20048 ?auto_20049 )
      ( !DRIVE ?auto_20048 ?auto_20049 ?auto_20047 )
      ( !UNLOAD ?auto_20046 ?auto_20045 ?auto_20048 ?auto_20047 )
      ( !DROP ?auto_20046 ?auto_20045 ?auto_20044 ?auto_20047 )
      ( MAKE-1CRATE-VERIFY ?auto_20044 ?auto_20045 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20061 - SURFACE
      ?auto_20062 - SURFACE
      ?auto_20063 - SURFACE
      ?auto_20064 - SURFACE
      ?auto_20065 - SURFACE
      ?auto_20066 - SURFACE
      ?auto_20069 - SURFACE
      ?auto_20068 - SURFACE
      ?auto_20067 - SURFACE
    )
    :vars
    (
      ?auto_20071 - HOIST
      ?auto_20073 - PLACE
      ?auto_20072 - PLACE
      ?auto_20074 - HOIST
      ?auto_20070 - SURFACE
      ?auto_20077 - PLACE
      ?auto_20076 - HOIST
      ?auto_20092 - SURFACE
      ?auto_20089 - PLACE
      ?auto_20079 - HOIST
      ?auto_20087 - SURFACE
      ?auto_20078 - PLACE
      ?auto_20082 - HOIST
      ?auto_20091 - SURFACE
      ?auto_20088 - PLACE
      ?auto_20080 - HOIST
      ?auto_20085 - SURFACE
      ?auto_20086 - PLACE
      ?auto_20090 - HOIST
      ?auto_20084 - SURFACE
      ?auto_20083 - SURFACE
      ?auto_20081 - SURFACE
      ?auto_20075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20071 ?auto_20073 ) ( IS-CRATE ?auto_20067 ) ( not ( = ?auto_20072 ?auto_20073 ) ) ( HOIST-AT ?auto_20074 ?auto_20072 ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20067 ?auto_20072 ) ( ON ?auto_20067 ?auto_20070 ) ( CLEAR ?auto_20067 ) ( not ( = ?auto_20068 ?auto_20067 ) ) ( not ( = ?auto_20068 ?auto_20070 ) ) ( not ( = ?auto_20067 ?auto_20070 ) ) ( not ( = ?auto_20071 ?auto_20074 ) ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20077 ?auto_20073 ) ) ( HOIST-AT ?auto_20076 ?auto_20077 ) ( AVAILABLE ?auto_20076 ) ( SURFACE-AT ?auto_20068 ?auto_20077 ) ( ON ?auto_20068 ?auto_20092 ) ( CLEAR ?auto_20068 ) ( not ( = ?auto_20069 ?auto_20068 ) ) ( not ( = ?auto_20069 ?auto_20092 ) ) ( not ( = ?auto_20068 ?auto_20092 ) ) ( not ( = ?auto_20071 ?auto_20076 ) ) ( IS-CRATE ?auto_20069 ) ( not ( = ?auto_20089 ?auto_20073 ) ) ( HOIST-AT ?auto_20079 ?auto_20089 ) ( AVAILABLE ?auto_20079 ) ( SURFACE-AT ?auto_20069 ?auto_20089 ) ( ON ?auto_20069 ?auto_20087 ) ( CLEAR ?auto_20069 ) ( not ( = ?auto_20066 ?auto_20069 ) ) ( not ( = ?auto_20066 ?auto_20087 ) ) ( not ( = ?auto_20069 ?auto_20087 ) ) ( not ( = ?auto_20071 ?auto_20079 ) ) ( IS-CRATE ?auto_20066 ) ( not ( = ?auto_20078 ?auto_20073 ) ) ( HOIST-AT ?auto_20082 ?auto_20078 ) ( AVAILABLE ?auto_20082 ) ( SURFACE-AT ?auto_20066 ?auto_20078 ) ( ON ?auto_20066 ?auto_20091 ) ( CLEAR ?auto_20066 ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20091 ) ) ( not ( = ?auto_20066 ?auto_20091 ) ) ( not ( = ?auto_20071 ?auto_20082 ) ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20088 ?auto_20073 ) ) ( HOIST-AT ?auto_20080 ?auto_20088 ) ( AVAILABLE ?auto_20080 ) ( SURFACE-AT ?auto_20065 ?auto_20088 ) ( ON ?auto_20065 ?auto_20085 ) ( CLEAR ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20085 ) ) ( not ( = ?auto_20065 ?auto_20085 ) ) ( not ( = ?auto_20071 ?auto_20080 ) ) ( IS-CRATE ?auto_20064 ) ( not ( = ?auto_20086 ?auto_20073 ) ) ( HOIST-AT ?auto_20090 ?auto_20086 ) ( SURFACE-AT ?auto_20064 ?auto_20086 ) ( ON ?auto_20064 ?auto_20084 ) ( CLEAR ?auto_20064 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20084 ) ) ( not ( = ?auto_20064 ?auto_20084 ) ) ( not ( = ?auto_20071 ?auto_20090 ) ) ( IS-CRATE ?auto_20063 ) ( SURFACE-AT ?auto_20063 ?auto_20086 ) ( ON ?auto_20063 ?auto_20083 ) ( CLEAR ?auto_20063 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20083 ) ) ( not ( = ?auto_20063 ?auto_20083 ) ) ( SURFACE-AT ?auto_20061 ?auto_20073 ) ( CLEAR ?auto_20061 ) ( IS-CRATE ?auto_20062 ) ( AVAILABLE ?auto_20071 ) ( AVAILABLE ?auto_20090 ) ( SURFACE-AT ?auto_20062 ?auto_20086 ) ( ON ?auto_20062 ?auto_20081 ) ( CLEAR ?auto_20062 ) ( TRUCK-AT ?auto_20075 ?auto_20073 ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20081 ) ) ( not ( = ?auto_20062 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20083 ) ) ( not ( = ?auto_20063 ?auto_20081 ) ) ( not ( = ?auto_20083 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20064 ) ) ( not ( = ?auto_20061 ?auto_20084 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20062 ?auto_20084 ) ) ( not ( = ?auto_20064 ?auto_20083 ) ) ( not ( = ?auto_20064 ?auto_20081 ) ) ( not ( = ?auto_20084 ?auto_20083 ) ) ( not ( = ?auto_20084 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20065 ) ) ( not ( = ?auto_20061 ?auto_20085 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20085 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20085 ) ) ( not ( = ?auto_20065 ?auto_20084 ) ) ( not ( = ?auto_20065 ?auto_20083 ) ) ( not ( = ?auto_20065 ?auto_20081 ) ) ( not ( = ?auto_20088 ?auto_20086 ) ) ( not ( = ?auto_20080 ?auto_20090 ) ) ( not ( = ?auto_20085 ?auto_20084 ) ) ( not ( = ?auto_20085 ?auto_20083 ) ) ( not ( = ?auto_20085 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20066 ) ) ( not ( = ?auto_20061 ?auto_20091 ) ) ( not ( = ?auto_20062 ?auto_20066 ) ) ( not ( = ?auto_20062 ?auto_20091 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20091 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20091 ) ) ( not ( = ?auto_20066 ?auto_20085 ) ) ( not ( = ?auto_20066 ?auto_20084 ) ) ( not ( = ?auto_20066 ?auto_20083 ) ) ( not ( = ?auto_20066 ?auto_20081 ) ) ( not ( = ?auto_20078 ?auto_20088 ) ) ( not ( = ?auto_20078 ?auto_20086 ) ) ( not ( = ?auto_20082 ?auto_20080 ) ) ( not ( = ?auto_20082 ?auto_20090 ) ) ( not ( = ?auto_20091 ?auto_20085 ) ) ( not ( = ?auto_20091 ?auto_20084 ) ) ( not ( = ?auto_20091 ?auto_20083 ) ) ( not ( = ?auto_20091 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20069 ) ) ( not ( = ?auto_20061 ?auto_20087 ) ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20062 ?auto_20087 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20087 ) ) ( not ( = ?auto_20064 ?auto_20069 ) ) ( not ( = ?auto_20064 ?auto_20087 ) ) ( not ( = ?auto_20065 ?auto_20069 ) ) ( not ( = ?auto_20065 ?auto_20087 ) ) ( not ( = ?auto_20069 ?auto_20091 ) ) ( not ( = ?auto_20069 ?auto_20085 ) ) ( not ( = ?auto_20069 ?auto_20084 ) ) ( not ( = ?auto_20069 ?auto_20083 ) ) ( not ( = ?auto_20069 ?auto_20081 ) ) ( not ( = ?auto_20089 ?auto_20078 ) ) ( not ( = ?auto_20089 ?auto_20088 ) ) ( not ( = ?auto_20089 ?auto_20086 ) ) ( not ( = ?auto_20079 ?auto_20082 ) ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( not ( = ?auto_20079 ?auto_20090 ) ) ( not ( = ?auto_20087 ?auto_20091 ) ) ( not ( = ?auto_20087 ?auto_20085 ) ) ( not ( = ?auto_20087 ?auto_20084 ) ) ( not ( = ?auto_20087 ?auto_20083 ) ) ( not ( = ?auto_20087 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20068 ) ) ( not ( = ?auto_20061 ?auto_20092 ) ) ( not ( = ?auto_20062 ?auto_20068 ) ) ( not ( = ?auto_20062 ?auto_20092 ) ) ( not ( = ?auto_20063 ?auto_20068 ) ) ( not ( = ?auto_20063 ?auto_20092 ) ) ( not ( = ?auto_20064 ?auto_20068 ) ) ( not ( = ?auto_20064 ?auto_20092 ) ) ( not ( = ?auto_20065 ?auto_20068 ) ) ( not ( = ?auto_20065 ?auto_20092 ) ) ( not ( = ?auto_20066 ?auto_20068 ) ) ( not ( = ?auto_20066 ?auto_20092 ) ) ( not ( = ?auto_20068 ?auto_20087 ) ) ( not ( = ?auto_20068 ?auto_20091 ) ) ( not ( = ?auto_20068 ?auto_20085 ) ) ( not ( = ?auto_20068 ?auto_20084 ) ) ( not ( = ?auto_20068 ?auto_20083 ) ) ( not ( = ?auto_20068 ?auto_20081 ) ) ( not ( = ?auto_20077 ?auto_20089 ) ) ( not ( = ?auto_20077 ?auto_20078 ) ) ( not ( = ?auto_20077 ?auto_20088 ) ) ( not ( = ?auto_20077 ?auto_20086 ) ) ( not ( = ?auto_20076 ?auto_20079 ) ) ( not ( = ?auto_20076 ?auto_20082 ) ) ( not ( = ?auto_20076 ?auto_20080 ) ) ( not ( = ?auto_20076 ?auto_20090 ) ) ( not ( = ?auto_20092 ?auto_20087 ) ) ( not ( = ?auto_20092 ?auto_20091 ) ) ( not ( = ?auto_20092 ?auto_20085 ) ) ( not ( = ?auto_20092 ?auto_20084 ) ) ( not ( = ?auto_20092 ?auto_20083 ) ) ( not ( = ?auto_20092 ?auto_20081 ) ) ( not ( = ?auto_20061 ?auto_20067 ) ) ( not ( = ?auto_20061 ?auto_20070 ) ) ( not ( = ?auto_20062 ?auto_20067 ) ) ( not ( = ?auto_20062 ?auto_20070 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20070 ) ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20064 ?auto_20070 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20070 ) ) ( not ( = ?auto_20066 ?auto_20067 ) ) ( not ( = ?auto_20066 ?auto_20070 ) ) ( not ( = ?auto_20069 ?auto_20067 ) ) ( not ( = ?auto_20069 ?auto_20070 ) ) ( not ( = ?auto_20067 ?auto_20092 ) ) ( not ( = ?auto_20067 ?auto_20087 ) ) ( not ( = ?auto_20067 ?auto_20091 ) ) ( not ( = ?auto_20067 ?auto_20085 ) ) ( not ( = ?auto_20067 ?auto_20084 ) ) ( not ( = ?auto_20067 ?auto_20083 ) ) ( not ( = ?auto_20067 ?auto_20081 ) ) ( not ( = ?auto_20072 ?auto_20077 ) ) ( not ( = ?auto_20072 ?auto_20089 ) ) ( not ( = ?auto_20072 ?auto_20078 ) ) ( not ( = ?auto_20072 ?auto_20088 ) ) ( not ( = ?auto_20072 ?auto_20086 ) ) ( not ( = ?auto_20074 ?auto_20076 ) ) ( not ( = ?auto_20074 ?auto_20079 ) ) ( not ( = ?auto_20074 ?auto_20082 ) ) ( not ( = ?auto_20074 ?auto_20080 ) ) ( not ( = ?auto_20074 ?auto_20090 ) ) ( not ( = ?auto_20070 ?auto_20092 ) ) ( not ( = ?auto_20070 ?auto_20087 ) ) ( not ( = ?auto_20070 ?auto_20091 ) ) ( not ( = ?auto_20070 ?auto_20085 ) ) ( not ( = ?auto_20070 ?auto_20084 ) ) ( not ( = ?auto_20070 ?auto_20083 ) ) ( not ( = ?auto_20070 ?auto_20081 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20069 ?auto_20068 )
      ( MAKE-1CRATE ?auto_20068 ?auto_20067 )
      ( MAKE-8CRATE-VERIFY ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20069 ?auto_20068 ?auto_20067 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20095 - SURFACE
      ?auto_20096 - SURFACE
    )
    :vars
    (
      ?auto_20097 - HOIST
      ?auto_20098 - PLACE
      ?auto_20100 - PLACE
      ?auto_20101 - HOIST
      ?auto_20102 - SURFACE
      ?auto_20099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20097 ?auto_20098 ) ( SURFACE-AT ?auto_20095 ?auto_20098 ) ( CLEAR ?auto_20095 ) ( IS-CRATE ?auto_20096 ) ( AVAILABLE ?auto_20097 ) ( not ( = ?auto_20100 ?auto_20098 ) ) ( HOIST-AT ?auto_20101 ?auto_20100 ) ( AVAILABLE ?auto_20101 ) ( SURFACE-AT ?auto_20096 ?auto_20100 ) ( ON ?auto_20096 ?auto_20102 ) ( CLEAR ?auto_20096 ) ( TRUCK-AT ?auto_20099 ?auto_20098 ) ( not ( = ?auto_20095 ?auto_20096 ) ) ( not ( = ?auto_20095 ?auto_20102 ) ) ( not ( = ?auto_20096 ?auto_20102 ) ) ( not ( = ?auto_20097 ?auto_20101 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20099 ?auto_20098 ?auto_20100 )
      ( !LIFT ?auto_20101 ?auto_20096 ?auto_20102 ?auto_20100 )
      ( !LOAD ?auto_20101 ?auto_20096 ?auto_20099 ?auto_20100 )
      ( !DRIVE ?auto_20099 ?auto_20100 ?auto_20098 )
      ( !UNLOAD ?auto_20097 ?auto_20096 ?auto_20099 ?auto_20098 )
      ( !DROP ?auto_20097 ?auto_20096 ?auto_20095 ?auto_20098 )
      ( MAKE-1CRATE-VERIFY ?auto_20095 ?auto_20096 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20113 - SURFACE
      ?auto_20114 - SURFACE
      ?auto_20115 - SURFACE
      ?auto_20116 - SURFACE
      ?auto_20117 - SURFACE
      ?auto_20118 - SURFACE
      ?auto_20121 - SURFACE
      ?auto_20120 - SURFACE
      ?auto_20119 - SURFACE
      ?auto_20122 - SURFACE
    )
    :vars
    (
      ?auto_20128 - HOIST
      ?auto_20127 - PLACE
      ?auto_20126 - PLACE
      ?auto_20124 - HOIST
      ?auto_20123 - SURFACE
      ?auto_20129 - PLACE
      ?auto_20146 - HOIST
      ?auto_20145 - SURFACE
      ?auto_20132 - PLACE
      ?auto_20133 - HOIST
      ?auto_20134 - SURFACE
      ?auto_20141 - PLACE
      ?auto_20130 - HOIST
      ?auto_20139 - SURFACE
      ?auto_20135 - SURFACE
      ?auto_20140 - PLACE
      ?auto_20144 - HOIST
      ?auto_20138 - SURFACE
      ?auto_20137 - PLACE
      ?auto_20131 - HOIST
      ?auto_20136 - SURFACE
      ?auto_20142 - SURFACE
      ?auto_20143 - SURFACE
      ?auto_20125 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20128 ?auto_20127 ) ( IS-CRATE ?auto_20122 ) ( not ( = ?auto_20126 ?auto_20127 ) ) ( HOIST-AT ?auto_20124 ?auto_20126 ) ( SURFACE-AT ?auto_20122 ?auto_20126 ) ( ON ?auto_20122 ?auto_20123 ) ( CLEAR ?auto_20122 ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( not ( = ?auto_20119 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20123 ) ) ( not ( = ?auto_20128 ?auto_20124 ) ) ( IS-CRATE ?auto_20119 ) ( not ( = ?auto_20129 ?auto_20127 ) ) ( HOIST-AT ?auto_20146 ?auto_20129 ) ( AVAILABLE ?auto_20146 ) ( SURFACE-AT ?auto_20119 ?auto_20129 ) ( ON ?auto_20119 ?auto_20145 ) ( CLEAR ?auto_20119 ) ( not ( = ?auto_20120 ?auto_20119 ) ) ( not ( = ?auto_20120 ?auto_20145 ) ) ( not ( = ?auto_20119 ?auto_20145 ) ) ( not ( = ?auto_20128 ?auto_20146 ) ) ( IS-CRATE ?auto_20120 ) ( not ( = ?auto_20132 ?auto_20127 ) ) ( HOIST-AT ?auto_20133 ?auto_20132 ) ( AVAILABLE ?auto_20133 ) ( SURFACE-AT ?auto_20120 ?auto_20132 ) ( ON ?auto_20120 ?auto_20134 ) ( CLEAR ?auto_20120 ) ( not ( = ?auto_20121 ?auto_20120 ) ) ( not ( = ?auto_20121 ?auto_20134 ) ) ( not ( = ?auto_20120 ?auto_20134 ) ) ( not ( = ?auto_20128 ?auto_20133 ) ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20141 ?auto_20127 ) ) ( HOIST-AT ?auto_20130 ?auto_20141 ) ( AVAILABLE ?auto_20130 ) ( SURFACE-AT ?auto_20121 ?auto_20141 ) ( ON ?auto_20121 ?auto_20139 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20118 ?auto_20121 ) ) ( not ( = ?auto_20118 ?auto_20139 ) ) ( not ( = ?auto_20121 ?auto_20139 ) ) ( not ( = ?auto_20128 ?auto_20130 ) ) ( IS-CRATE ?auto_20118 ) ( AVAILABLE ?auto_20124 ) ( SURFACE-AT ?auto_20118 ?auto_20126 ) ( ON ?auto_20118 ?auto_20135 ) ( CLEAR ?auto_20118 ) ( not ( = ?auto_20117 ?auto_20118 ) ) ( not ( = ?auto_20117 ?auto_20135 ) ) ( not ( = ?auto_20118 ?auto_20135 ) ) ( IS-CRATE ?auto_20117 ) ( not ( = ?auto_20140 ?auto_20127 ) ) ( HOIST-AT ?auto_20144 ?auto_20140 ) ( AVAILABLE ?auto_20144 ) ( SURFACE-AT ?auto_20117 ?auto_20140 ) ( ON ?auto_20117 ?auto_20138 ) ( CLEAR ?auto_20117 ) ( not ( = ?auto_20116 ?auto_20117 ) ) ( not ( = ?auto_20116 ?auto_20138 ) ) ( not ( = ?auto_20117 ?auto_20138 ) ) ( not ( = ?auto_20128 ?auto_20144 ) ) ( IS-CRATE ?auto_20116 ) ( not ( = ?auto_20137 ?auto_20127 ) ) ( HOIST-AT ?auto_20131 ?auto_20137 ) ( SURFACE-AT ?auto_20116 ?auto_20137 ) ( ON ?auto_20116 ?auto_20136 ) ( CLEAR ?auto_20116 ) ( not ( = ?auto_20115 ?auto_20116 ) ) ( not ( = ?auto_20115 ?auto_20136 ) ) ( not ( = ?auto_20116 ?auto_20136 ) ) ( not ( = ?auto_20128 ?auto_20131 ) ) ( IS-CRATE ?auto_20115 ) ( SURFACE-AT ?auto_20115 ?auto_20137 ) ( ON ?auto_20115 ?auto_20142 ) ( CLEAR ?auto_20115 ) ( not ( = ?auto_20114 ?auto_20115 ) ) ( not ( = ?auto_20114 ?auto_20142 ) ) ( not ( = ?auto_20115 ?auto_20142 ) ) ( SURFACE-AT ?auto_20113 ?auto_20127 ) ( CLEAR ?auto_20113 ) ( IS-CRATE ?auto_20114 ) ( AVAILABLE ?auto_20128 ) ( AVAILABLE ?auto_20131 ) ( SURFACE-AT ?auto_20114 ?auto_20137 ) ( ON ?auto_20114 ?auto_20143 ) ( CLEAR ?auto_20114 ) ( TRUCK-AT ?auto_20125 ?auto_20127 ) ( not ( = ?auto_20113 ?auto_20114 ) ) ( not ( = ?auto_20113 ?auto_20143 ) ) ( not ( = ?auto_20114 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20115 ) ) ( not ( = ?auto_20113 ?auto_20142 ) ) ( not ( = ?auto_20115 ?auto_20143 ) ) ( not ( = ?auto_20142 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20116 ) ) ( not ( = ?auto_20113 ?auto_20136 ) ) ( not ( = ?auto_20114 ?auto_20116 ) ) ( not ( = ?auto_20114 ?auto_20136 ) ) ( not ( = ?auto_20116 ?auto_20142 ) ) ( not ( = ?auto_20116 ?auto_20143 ) ) ( not ( = ?auto_20136 ?auto_20142 ) ) ( not ( = ?auto_20136 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20117 ) ) ( not ( = ?auto_20113 ?auto_20138 ) ) ( not ( = ?auto_20114 ?auto_20117 ) ) ( not ( = ?auto_20114 ?auto_20138 ) ) ( not ( = ?auto_20115 ?auto_20117 ) ) ( not ( = ?auto_20115 ?auto_20138 ) ) ( not ( = ?auto_20117 ?auto_20136 ) ) ( not ( = ?auto_20117 ?auto_20142 ) ) ( not ( = ?auto_20117 ?auto_20143 ) ) ( not ( = ?auto_20140 ?auto_20137 ) ) ( not ( = ?auto_20144 ?auto_20131 ) ) ( not ( = ?auto_20138 ?auto_20136 ) ) ( not ( = ?auto_20138 ?auto_20142 ) ) ( not ( = ?auto_20138 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20118 ) ) ( not ( = ?auto_20113 ?auto_20135 ) ) ( not ( = ?auto_20114 ?auto_20118 ) ) ( not ( = ?auto_20114 ?auto_20135 ) ) ( not ( = ?auto_20115 ?auto_20118 ) ) ( not ( = ?auto_20115 ?auto_20135 ) ) ( not ( = ?auto_20116 ?auto_20118 ) ) ( not ( = ?auto_20116 ?auto_20135 ) ) ( not ( = ?auto_20118 ?auto_20138 ) ) ( not ( = ?auto_20118 ?auto_20136 ) ) ( not ( = ?auto_20118 ?auto_20142 ) ) ( not ( = ?auto_20118 ?auto_20143 ) ) ( not ( = ?auto_20126 ?auto_20140 ) ) ( not ( = ?auto_20126 ?auto_20137 ) ) ( not ( = ?auto_20124 ?auto_20144 ) ) ( not ( = ?auto_20124 ?auto_20131 ) ) ( not ( = ?auto_20135 ?auto_20138 ) ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20142 ) ) ( not ( = ?auto_20135 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20121 ) ) ( not ( = ?auto_20113 ?auto_20139 ) ) ( not ( = ?auto_20114 ?auto_20121 ) ) ( not ( = ?auto_20114 ?auto_20139 ) ) ( not ( = ?auto_20115 ?auto_20121 ) ) ( not ( = ?auto_20115 ?auto_20139 ) ) ( not ( = ?auto_20116 ?auto_20121 ) ) ( not ( = ?auto_20116 ?auto_20139 ) ) ( not ( = ?auto_20117 ?auto_20121 ) ) ( not ( = ?auto_20117 ?auto_20139 ) ) ( not ( = ?auto_20121 ?auto_20135 ) ) ( not ( = ?auto_20121 ?auto_20138 ) ) ( not ( = ?auto_20121 ?auto_20136 ) ) ( not ( = ?auto_20121 ?auto_20142 ) ) ( not ( = ?auto_20121 ?auto_20143 ) ) ( not ( = ?auto_20141 ?auto_20126 ) ) ( not ( = ?auto_20141 ?auto_20140 ) ) ( not ( = ?auto_20141 ?auto_20137 ) ) ( not ( = ?auto_20130 ?auto_20124 ) ) ( not ( = ?auto_20130 ?auto_20144 ) ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( not ( = ?auto_20139 ?auto_20135 ) ) ( not ( = ?auto_20139 ?auto_20138 ) ) ( not ( = ?auto_20139 ?auto_20136 ) ) ( not ( = ?auto_20139 ?auto_20142 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20120 ) ) ( not ( = ?auto_20113 ?auto_20134 ) ) ( not ( = ?auto_20114 ?auto_20120 ) ) ( not ( = ?auto_20114 ?auto_20134 ) ) ( not ( = ?auto_20115 ?auto_20120 ) ) ( not ( = ?auto_20115 ?auto_20134 ) ) ( not ( = ?auto_20116 ?auto_20120 ) ) ( not ( = ?auto_20116 ?auto_20134 ) ) ( not ( = ?auto_20117 ?auto_20120 ) ) ( not ( = ?auto_20117 ?auto_20134 ) ) ( not ( = ?auto_20118 ?auto_20120 ) ) ( not ( = ?auto_20118 ?auto_20134 ) ) ( not ( = ?auto_20120 ?auto_20139 ) ) ( not ( = ?auto_20120 ?auto_20135 ) ) ( not ( = ?auto_20120 ?auto_20138 ) ) ( not ( = ?auto_20120 ?auto_20136 ) ) ( not ( = ?auto_20120 ?auto_20142 ) ) ( not ( = ?auto_20120 ?auto_20143 ) ) ( not ( = ?auto_20132 ?auto_20141 ) ) ( not ( = ?auto_20132 ?auto_20126 ) ) ( not ( = ?auto_20132 ?auto_20140 ) ) ( not ( = ?auto_20132 ?auto_20137 ) ) ( not ( = ?auto_20133 ?auto_20130 ) ) ( not ( = ?auto_20133 ?auto_20124 ) ) ( not ( = ?auto_20133 ?auto_20144 ) ) ( not ( = ?auto_20133 ?auto_20131 ) ) ( not ( = ?auto_20134 ?auto_20139 ) ) ( not ( = ?auto_20134 ?auto_20135 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20134 ?auto_20142 ) ) ( not ( = ?auto_20134 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20119 ) ) ( not ( = ?auto_20113 ?auto_20145 ) ) ( not ( = ?auto_20114 ?auto_20119 ) ) ( not ( = ?auto_20114 ?auto_20145 ) ) ( not ( = ?auto_20115 ?auto_20119 ) ) ( not ( = ?auto_20115 ?auto_20145 ) ) ( not ( = ?auto_20116 ?auto_20119 ) ) ( not ( = ?auto_20116 ?auto_20145 ) ) ( not ( = ?auto_20117 ?auto_20119 ) ) ( not ( = ?auto_20117 ?auto_20145 ) ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20145 ) ) ( not ( = ?auto_20121 ?auto_20119 ) ) ( not ( = ?auto_20121 ?auto_20145 ) ) ( not ( = ?auto_20119 ?auto_20134 ) ) ( not ( = ?auto_20119 ?auto_20139 ) ) ( not ( = ?auto_20119 ?auto_20135 ) ) ( not ( = ?auto_20119 ?auto_20138 ) ) ( not ( = ?auto_20119 ?auto_20136 ) ) ( not ( = ?auto_20119 ?auto_20142 ) ) ( not ( = ?auto_20119 ?auto_20143 ) ) ( not ( = ?auto_20129 ?auto_20132 ) ) ( not ( = ?auto_20129 ?auto_20141 ) ) ( not ( = ?auto_20129 ?auto_20126 ) ) ( not ( = ?auto_20129 ?auto_20140 ) ) ( not ( = ?auto_20129 ?auto_20137 ) ) ( not ( = ?auto_20146 ?auto_20133 ) ) ( not ( = ?auto_20146 ?auto_20130 ) ) ( not ( = ?auto_20146 ?auto_20124 ) ) ( not ( = ?auto_20146 ?auto_20144 ) ) ( not ( = ?auto_20146 ?auto_20131 ) ) ( not ( = ?auto_20145 ?auto_20134 ) ) ( not ( = ?auto_20145 ?auto_20139 ) ) ( not ( = ?auto_20145 ?auto_20135 ) ) ( not ( = ?auto_20145 ?auto_20138 ) ) ( not ( = ?auto_20145 ?auto_20136 ) ) ( not ( = ?auto_20145 ?auto_20142 ) ) ( not ( = ?auto_20145 ?auto_20143 ) ) ( not ( = ?auto_20113 ?auto_20122 ) ) ( not ( = ?auto_20113 ?auto_20123 ) ) ( not ( = ?auto_20114 ?auto_20122 ) ) ( not ( = ?auto_20114 ?auto_20123 ) ) ( not ( = ?auto_20115 ?auto_20122 ) ) ( not ( = ?auto_20115 ?auto_20123 ) ) ( not ( = ?auto_20116 ?auto_20122 ) ) ( not ( = ?auto_20116 ?auto_20123 ) ) ( not ( = ?auto_20117 ?auto_20122 ) ) ( not ( = ?auto_20117 ?auto_20123 ) ) ( not ( = ?auto_20118 ?auto_20122 ) ) ( not ( = ?auto_20118 ?auto_20123 ) ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20123 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20123 ) ) ( not ( = ?auto_20122 ?auto_20145 ) ) ( not ( = ?auto_20122 ?auto_20134 ) ) ( not ( = ?auto_20122 ?auto_20139 ) ) ( not ( = ?auto_20122 ?auto_20135 ) ) ( not ( = ?auto_20122 ?auto_20138 ) ) ( not ( = ?auto_20122 ?auto_20136 ) ) ( not ( = ?auto_20122 ?auto_20142 ) ) ( not ( = ?auto_20122 ?auto_20143 ) ) ( not ( = ?auto_20123 ?auto_20145 ) ) ( not ( = ?auto_20123 ?auto_20134 ) ) ( not ( = ?auto_20123 ?auto_20139 ) ) ( not ( = ?auto_20123 ?auto_20135 ) ) ( not ( = ?auto_20123 ?auto_20138 ) ) ( not ( = ?auto_20123 ?auto_20136 ) ) ( not ( = ?auto_20123 ?auto_20142 ) ) ( not ( = ?auto_20123 ?auto_20143 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20113 ?auto_20114 ?auto_20115 ?auto_20116 ?auto_20117 ?auto_20118 ?auto_20121 ?auto_20120 ?auto_20119 )
      ( MAKE-1CRATE ?auto_20119 ?auto_20122 )
      ( MAKE-9CRATE-VERIFY ?auto_20113 ?auto_20114 ?auto_20115 ?auto_20116 ?auto_20117 ?auto_20118 ?auto_20121 ?auto_20120 ?auto_20119 ?auto_20122 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20149 - SURFACE
      ?auto_20150 - SURFACE
    )
    :vars
    (
      ?auto_20151 - HOIST
      ?auto_20152 - PLACE
      ?auto_20154 - PLACE
      ?auto_20155 - HOIST
      ?auto_20156 - SURFACE
      ?auto_20153 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20151 ?auto_20152 ) ( SURFACE-AT ?auto_20149 ?auto_20152 ) ( CLEAR ?auto_20149 ) ( IS-CRATE ?auto_20150 ) ( AVAILABLE ?auto_20151 ) ( not ( = ?auto_20154 ?auto_20152 ) ) ( HOIST-AT ?auto_20155 ?auto_20154 ) ( AVAILABLE ?auto_20155 ) ( SURFACE-AT ?auto_20150 ?auto_20154 ) ( ON ?auto_20150 ?auto_20156 ) ( CLEAR ?auto_20150 ) ( TRUCK-AT ?auto_20153 ?auto_20152 ) ( not ( = ?auto_20149 ?auto_20150 ) ) ( not ( = ?auto_20149 ?auto_20156 ) ) ( not ( = ?auto_20150 ?auto_20156 ) ) ( not ( = ?auto_20151 ?auto_20155 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20153 ?auto_20152 ?auto_20154 )
      ( !LIFT ?auto_20155 ?auto_20150 ?auto_20156 ?auto_20154 )
      ( !LOAD ?auto_20155 ?auto_20150 ?auto_20153 ?auto_20154 )
      ( !DRIVE ?auto_20153 ?auto_20154 ?auto_20152 )
      ( !UNLOAD ?auto_20151 ?auto_20150 ?auto_20153 ?auto_20152 )
      ( !DROP ?auto_20151 ?auto_20150 ?auto_20149 ?auto_20152 )
      ( MAKE-1CRATE-VERIFY ?auto_20149 ?auto_20150 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20168 - SURFACE
      ?auto_20169 - SURFACE
      ?auto_20170 - SURFACE
      ?auto_20171 - SURFACE
      ?auto_20172 - SURFACE
      ?auto_20173 - SURFACE
      ?auto_20176 - SURFACE
      ?auto_20175 - SURFACE
      ?auto_20174 - SURFACE
      ?auto_20177 - SURFACE
      ?auto_20178 - SURFACE
    )
    :vars
    (
      ?auto_20180 - HOIST
      ?auto_20184 - PLACE
      ?auto_20183 - PLACE
      ?auto_20179 - HOIST
      ?auto_20182 - SURFACE
      ?auto_20188 - PLACE
      ?auto_20200 - HOIST
      ?auto_20205 - SURFACE
      ?auto_20189 - PLACE
      ?auto_20190 - HOIST
      ?auto_20197 - SURFACE
      ?auto_20187 - PLACE
      ?auto_20194 - HOIST
      ?auto_20193 - SURFACE
      ?auto_20185 - PLACE
      ?auto_20198 - HOIST
      ?auto_20196 - SURFACE
      ?auto_20192 - SURFACE
      ?auto_20202 - PLACE
      ?auto_20199 - HOIST
      ?auto_20201 - SURFACE
      ?auto_20186 - PLACE
      ?auto_20204 - HOIST
      ?auto_20191 - SURFACE
      ?auto_20195 - SURFACE
      ?auto_20203 - SURFACE
      ?auto_20181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20180 ?auto_20184 ) ( IS-CRATE ?auto_20178 ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( HOIST-AT ?auto_20179 ?auto_20183 ) ( AVAILABLE ?auto_20179 ) ( SURFACE-AT ?auto_20178 ?auto_20183 ) ( ON ?auto_20178 ?auto_20182 ) ( CLEAR ?auto_20178 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20182 ) ) ( not ( = ?auto_20178 ?auto_20182 ) ) ( not ( = ?auto_20180 ?auto_20179 ) ) ( IS-CRATE ?auto_20177 ) ( not ( = ?auto_20188 ?auto_20184 ) ) ( HOIST-AT ?auto_20200 ?auto_20188 ) ( SURFACE-AT ?auto_20177 ?auto_20188 ) ( ON ?auto_20177 ?auto_20205 ) ( CLEAR ?auto_20177 ) ( not ( = ?auto_20174 ?auto_20177 ) ) ( not ( = ?auto_20174 ?auto_20205 ) ) ( not ( = ?auto_20177 ?auto_20205 ) ) ( not ( = ?auto_20180 ?auto_20200 ) ) ( IS-CRATE ?auto_20174 ) ( not ( = ?auto_20189 ?auto_20184 ) ) ( HOIST-AT ?auto_20190 ?auto_20189 ) ( AVAILABLE ?auto_20190 ) ( SURFACE-AT ?auto_20174 ?auto_20189 ) ( ON ?auto_20174 ?auto_20197 ) ( CLEAR ?auto_20174 ) ( not ( = ?auto_20175 ?auto_20174 ) ) ( not ( = ?auto_20175 ?auto_20197 ) ) ( not ( = ?auto_20174 ?auto_20197 ) ) ( not ( = ?auto_20180 ?auto_20190 ) ) ( IS-CRATE ?auto_20175 ) ( not ( = ?auto_20187 ?auto_20184 ) ) ( HOIST-AT ?auto_20194 ?auto_20187 ) ( AVAILABLE ?auto_20194 ) ( SURFACE-AT ?auto_20175 ?auto_20187 ) ( ON ?auto_20175 ?auto_20193 ) ( CLEAR ?auto_20175 ) ( not ( = ?auto_20176 ?auto_20175 ) ) ( not ( = ?auto_20176 ?auto_20193 ) ) ( not ( = ?auto_20175 ?auto_20193 ) ) ( not ( = ?auto_20180 ?auto_20194 ) ) ( IS-CRATE ?auto_20176 ) ( not ( = ?auto_20185 ?auto_20184 ) ) ( HOIST-AT ?auto_20198 ?auto_20185 ) ( AVAILABLE ?auto_20198 ) ( SURFACE-AT ?auto_20176 ?auto_20185 ) ( ON ?auto_20176 ?auto_20196 ) ( CLEAR ?auto_20176 ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20173 ?auto_20196 ) ) ( not ( = ?auto_20176 ?auto_20196 ) ) ( not ( = ?auto_20180 ?auto_20198 ) ) ( IS-CRATE ?auto_20173 ) ( AVAILABLE ?auto_20200 ) ( SURFACE-AT ?auto_20173 ?auto_20188 ) ( ON ?auto_20173 ?auto_20192 ) ( CLEAR ?auto_20173 ) ( not ( = ?auto_20172 ?auto_20173 ) ) ( not ( = ?auto_20172 ?auto_20192 ) ) ( not ( = ?auto_20173 ?auto_20192 ) ) ( IS-CRATE ?auto_20172 ) ( not ( = ?auto_20202 ?auto_20184 ) ) ( HOIST-AT ?auto_20199 ?auto_20202 ) ( AVAILABLE ?auto_20199 ) ( SURFACE-AT ?auto_20172 ?auto_20202 ) ( ON ?auto_20172 ?auto_20201 ) ( CLEAR ?auto_20172 ) ( not ( = ?auto_20171 ?auto_20172 ) ) ( not ( = ?auto_20171 ?auto_20201 ) ) ( not ( = ?auto_20172 ?auto_20201 ) ) ( not ( = ?auto_20180 ?auto_20199 ) ) ( IS-CRATE ?auto_20171 ) ( not ( = ?auto_20186 ?auto_20184 ) ) ( HOIST-AT ?auto_20204 ?auto_20186 ) ( SURFACE-AT ?auto_20171 ?auto_20186 ) ( ON ?auto_20171 ?auto_20191 ) ( CLEAR ?auto_20171 ) ( not ( = ?auto_20170 ?auto_20171 ) ) ( not ( = ?auto_20170 ?auto_20191 ) ) ( not ( = ?auto_20171 ?auto_20191 ) ) ( not ( = ?auto_20180 ?auto_20204 ) ) ( IS-CRATE ?auto_20170 ) ( SURFACE-AT ?auto_20170 ?auto_20186 ) ( ON ?auto_20170 ?auto_20195 ) ( CLEAR ?auto_20170 ) ( not ( = ?auto_20169 ?auto_20170 ) ) ( not ( = ?auto_20169 ?auto_20195 ) ) ( not ( = ?auto_20170 ?auto_20195 ) ) ( SURFACE-AT ?auto_20168 ?auto_20184 ) ( CLEAR ?auto_20168 ) ( IS-CRATE ?auto_20169 ) ( AVAILABLE ?auto_20180 ) ( AVAILABLE ?auto_20204 ) ( SURFACE-AT ?auto_20169 ?auto_20186 ) ( ON ?auto_20169 ?auto_20203 ) ( CLEAR ?auto_20169 ) ( TRUCK-AT ?auto_20181 ?auto_20184 ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( not ( = ?auto_20168 ?auto_20203 ) ) ( not ( = ?auto_20169 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20170 ) ) ( not ( = ?auto_20168 ?auto_20195 ) ) ( not ( = ?auto_20170 ?auto_20203 ) ) ( not ( = ?auto_20195 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20171 ) ) ( not ( = ?auto_20168 ?auto_20191 ) ) ( not ( = ?auto_20169 ?auto_20171 ) ) ( not ( = ?auto_20169 ?auto_20191 ) ) ( not ( = ?auto_20171 ?auto_20195 ) ) ( not ( = ?auto_20171 ?auto_20203 ) ) ( not ( = ?auto_20191 ?auto_20195 ) ) ( not ( = ?auto_20191 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20172 ) ) ( not ( = ?auto_20168 ?auto_20201 ) ) ( not ( = ?auto_20169 ?auto_20172 ) ) ( not ( = ?auto_20169 ?auto_20201 ) ) ( not ( = ?auto_20170 ?auto_20172 ) ) ( not ( = ?auto_20170 ?auto_20201 ) ) ( not ( = ?auto_20172 ?auto_20191 ) ) ( not ( = ?auto_20172 ?auto_20195 ) ) ( not ( = ?auto_20172 ?auto_20203 ) ) ( not ( = ?auto_20202 ?auto_20186 ) ) ( not ( = ?auto_20199 ?auto_20204 ) ) ( not ( = ?auto_20201 ?auto_20191 ) ) ( not ( = ?auto_20201 ?auto_20195 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20173 ) ) ( not ( = ?auto_20168 ?auto_20192 ) ) ( not ( = ?auto_20169 ?auto_20173 ) ) ( not ( = ?auto_20169 ?auto_20192 ) ) ( not ( = ?auto_20170 ?auto_20173 ) ) ( not ( = ?auto_20170 ?auto_20192 ) ) ( not ( = ?auto_20171 ?auto_20173 ) ) ( not ( = ?auto_20171 ?auto_20192 ) ) ( not ( = ?auto_20173 ?auto_20201 ) ) ( not ( = ?auto_20173 ?auto_20191 ) ) ( not ( = ?auto_20173 ?auto_20195 ) ) ( not ( = ?auto_20173 ?auto_20203 ) ) ( not ( = ?auto_20188 ?auto_20202 ) ) ( not ( = ?auto_20188 ?auto_20186 ) ) ( not ( = ?auto_20200 ?auto_20199 ) ) ( not ( = ?auto_20200 ?auto_20204 ) ) ( not ( = ?auto_20192 ?auto_20201 ) ) ( not ( = ?auto_20192 ?auto_20191 ) ) ( not ( = ?auto_20192 ?auto_20195 ) ) ( not ( = ?auto_20192 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20176 ) ) ( not ( = ?auto_20168 ?auto_20196 ) ) ( not ( = ?auto_20169 ?auto_20176 ) ) ( not ( = ?auto_20169 ?auto_20196 ) ) ( not ( = ?auto_20170 ?auto_20176 ) ) ( not ( = ?auto_20170 ?auto_20196 ) ) ( not ( = ?auto_20171 ?auto_20176 ) ) ( not ( = ?auto_20171 ?auto_20196 ) ) ( not ( = ?auto_20172 ?auto_20176 ) ) ( not ( = ?auto_20172 ?auto_20196 ) ) ( not ( = ?auto_20176 ?auto_20192 ) ) ( not ( = ?auto_20176 ?auto_20201 ) ) ( not ( = ?auto_20176 ?auto_20191 ) ) ( not ( = ?auto_20176 ?auto_20195 ) ) ( not ( = ?auto_20176 ?auto_20203 ) ) ( not ( = ?auto_20185 ?auto_20188 ) ) ( not ( = ?auto_20185 ?auto_20202 ) ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20198 ?auto_20200 ) ) ( not ( = ?auto_20198 ?auto_20199 ) ) ( not ( = ?auto_20198 ?auto_20204 ) ) ( not ( = ?auto_20196 ?auto_20192 ) ) ( not ( = ?auto_20196 ?auto_20201 ) ) ( not ( = ?auto_20196 ?auto_20191 ) ) ( not ( = ?auto_20196 ?auto_20195 ) ) ( not ( = ?auto_20196 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20175 ) ) ( not ( = ?auto_20168 ?auto_20193 ) ) ( not ( = ?auto_20169 ?auto_20175 ) ) ( not ( = ?auto_20169 ?auto_20193 ) ) ( not ( = ?auto_20170 ?auto_20175 ) ) ( not ( = ?auto_20170 ?auto_20193 ) ) ( not ( = ?auto_20171 ?auto_20175 ) ) ( not ( = ?auto_20171 ?auto_20193 ) ) ( not ( = ?auto_20172 ?auto_20175 ) ) ( not ( = ?auto_20172 ?auto_20193 ) ) ( not ( = ?auto_20173 ?auto_20175 ) ) ( not ( = ?auto_20173 ?auto_20193 ) ) ( not ( = ?auto_20175 ?auto_20196 ) ) ( not ( = ?auto_20175 ?auto_20192 ) ) ( not ( = ?auto_20175 ?auto_20201 ) ) ( not ( = ?auto_20175 ?auto_20191 ) ) ( not ( = ?auto_20175 ?auto_20195 ) ) ( not ( = ?auto_20175 ?auto_20203 ) ) ( not ( = ?auto_20187 ?auto_20185 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20202 ) ) ( not ( = ?auto_20187 ?auto_20186 ) ) ( not ( = ?auto_20194 ?auto_20198 ) ) ( not ( = ?auto_20194 ?auto_20200 ) ) ( not ( = ?auto_20194 ?auto_20199 ) ) ( not ( = ?auto_20194 ?auto_20204 ) ) ( not ( = ?auto_20193 ?auto_20196 ) ) ( not ( = ?auto_20193 ?auto_20192 ) ) ( not ( = ?auto_20193 ?auto_20201 ) ) ( not ( = ?auto_20193 ?auto_20191 ) ) ( not ( = ?auto_20193 ?auto_20195 ) ) ( not ( = ?auto_20193 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20174 ) ) ( not ( = ?auto_20168 ?auto_20197 ) ) ( not ( = ?auto_20169 ?auto_20174 ) ) ( not ( = ?auto_20169 ?auto_20197 ) ) ( not ( = ?auto_20170 ?auto_20174 ) ) ( not ( = ?auto_20170 ?auto_20197 ) ) ( not ( = ?auto_20171 ?auto_20174 ) ) ( not ( = ?auto_20171 ?auto_20197 ) ) ( not ( = ?auto_20172 ?auto_20174 ) ) ( not ( = ?auto_20172 ?auto_20197 ) ) ( not ( = ?auto_20173 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20197 ) ) ( not ( = ?auto_20176 ?auto_20174 ) ) ( not ( = ?auto_20176 ?auto_20197 ) ) ( not ( = ?auto_20174 ?auto_20193 ) ) ( not ( = ?auto_20174 ?auto_20196 ) ) ( not ( = ?auto_20174 ?auto_20192 ) ) ( not ( = ?auto_20174 ?auto_20201 ) ) ( not ( = ?auto_20174 ?auto_20191 ) ) ( not ( = ?auto_20174 ?auto_20195 ) ) ( not ( = ?auto_20174 ?auto_20203 ) ) ( not ( = ?auto_20189 ?auto_20187 ) ) ( not ( = ?auto_20189 ?auto_20185 ) ) ( not ( = ?auto_20189 ?auto_20188 ) ) ( not ( = ?auto_20189 ?auto_20202 ) ) ( not ( = ?auto_20189 ?auto_20186 ) ) ( not ( = ?auto_20190 ?auto_20194 ) ) ( not ( = ?auto_20190 ?auto_20198 ) ) ( not ( = ?auto_20190 ?auto_20200 ) ) ( not ( = ?auto_20190 ?auto_20199 ) ) ( not ( = ?auto_20190 ?auto_20204 ) ) ( not ( = ?auto_20197 ?auto_20193 ) ) ( not ( = ?auto_20197 ?auto_20196 ) ) ( not ( = ?auto_20197 ?auto_20192 ) ) ( not ( = ?auto_20197 ?auto_20201 ) ) ( not ( = ?auto_20197 ?auto_20191 ) ) ( not ( = ?auto_20197 ?auto_20195 ) ) ( not ( = ?auto_20197 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20177 ) ) ( not ( = ?auto_20168 ?auto_20205 ) ) ( not ( = ?auto_20169 ?auto_20177 ) ) ( not ( = ?auto_20169 ?auto_20205 ) ) ( not ( = ?auto_20170 ?auto_20177 ) ) ( not ( = ?auto_20170 ?auto_20205 ) ) ( not ( = ?auto_20171 ?auto_20177 ) ) ( not ( = ?auto_20171 ?auto_20205 ) ) ( not ( = ?auto_20172 ?auto_20177 ) ) ( not ( = ?auto_20172 ?auto_20205 ) ) ( not ( = ?auto_20173 ?auto_20177 ) ) ( not ( = ?auto_20173 ?auto_20205 ) ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20176 ?auto_20205 ) ) ( not ( = ?auto_20175 ?auto_20177 ) ) ( not ( = ?auto_20175 ?auto_20205 ) ) ( not ( = ?auto_20177 ?auto_20197 ) ) ( not ( = ?auto_20177 ?auto_20193 ) ) ( not ( = ?auto_20177 ?auto_20196 ) ) ( not ( = ?auto_20177 ?auto_20192 ) ) ( not ( = ?auto_20177 ?auto_20201 ) ) ( not ( = ?auto_20177 ?auto_20191 ) ) ( not ( = ?auto_20177 ?auto_20195 ) ) ( not ( = ?auto_20177 ?auto_20203 ) ) ( not ( = ?auto_20205 ?auto_20197 ) ) ( not ( = ?auto_20205 ?auto_20193 ) ) ( not ( = ?auto_20205 ?auto_20196 ) ) ( not ( = ?auto_20205 ?auto_20192 ) ) ( not ( = ?auto_20205 ?auto_20201 ) ) ( not ( = ?auto_20205 ?auto_20191 ) ) ( not ( = ?auto_20205 ?auto_20195 ) ) ( not ( = ?auto_20205 ?auto_20203 ) ) ( not ( = ?auto_20168 ?auto_20178 ) ) ( not ( = ?auto_20168 ?auto_20182 ) ) ( not ( = ?auto_20169 ?auto_20178 ) ) ( not ( = ?auto_20169 ?auto_20182 ) ) ( not ( = ?auto_20170 ?auto_20178 ) ) ( not ( = ?auto_20170 ?auto_20182 ) ) ( not ( = ?auto_20171 ?auto_20178 ) ) ( not ( = ?auto_20171 ?auto_20182 ) ) ( not ( = ?auto_20172 ?auto_20178 ) ) ( not ( = ?auto_20172 ?auto_20182 ) ) ( not ( = ?auto_20173 ?auto_20178 ) ) ( not ( = ?auto_20173 ?auto_20182 ) ) ( not ( = ?auto_20176 ?auto_20178 ) ) ( not ( = ?auto_20176 ?auto_20182 ) ) ( not ( = ?auto_20175 ?auto_20178 ) ) ( not ( = ?auto_20175 ?auto_20182 ) ) ( not ( = ?auto_20174 ?auto_20178 ) ) ( not ( = ?auto_20174 ?auto_20182 ) ) ( not ( = ?auto_20178 ?auto_20205 ) ) ( not ( = ?auto_20178 ?auto_20197 ) ) ( not ( = ?auto_20178 ?auto_20193 ) ) ( not ( = ?auto_20178 ?auto_20196 ) ) ( not ( = ?auto_20178 ?auto_20192 ) ) ( not ( = ?auto_20178 ?auto_20201 ) ) ( not ( = ?auto_20178 ?auto_20191 ) ) ( not ( = ?auto_20178 ?auto_20195 ) ) ( not ( = ?auto_20178 ?auto_20203 ) ) ( not ( = ?auto_20183 ?auto_20188 ) ) ( not ( = ?auto_20183 ?auto_20189 ) ) ( not ( = ?auto_20183 ?auto_20187 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20202 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20179 ?auto_20200 ) ) ( not ( = ?auto_20179 ?auto_20190 ) ) ( not ( = ?auto_20179 ?auto_20194 ) ) ( not ( = ?auto_20179 ?auto_20198 ) ) ( not ( = ?auto_20179 ?auto_20199 ) ) ( not ( = ?auto_20179 ?auto_20204 ) ) ( not ( = ?auto_20182 ?auto_20205 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20193 ) ) ( not ( = ?auto_20182 ?auto_20196 ) ) ( not ( = ?auto_20182 ?auto_20192 ) ) ( not ( = ?auto_20182 ?auto_20201 ) ) ( not ( = ?auto_20182 ?auto_20191 ) ) ( not ( = ?auto_20182 ?auto_20195 ) ) ( not ( = ?auto_20182 ?auto_20203 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20168 ?auto_20169 ?auto_20170 ?auto_20171 ?auto_20172 ?auto_20173 ?auto_20176 ?auto_20175 ?auto_20174 ?auto_20177 )
      ( MAKE-1CRATE ?auto_20177 ?auto_20178 )
      ( MAKE-10CRATE-VERIFY ?auto_20168 ?auto_20169 ?auto_20170 ?auto_20171 ?auto_20172 ?auto_20173 ?auto_20176 ?auto_20175 ?auto_20174 ?auto_20177 ?auto_20178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20208 - SURFACE
      ?auto_20209 - SURFACE
    )
    :vars
    (
      ?auto_20210 - HOIST
      ?auto_20211 - PLACE
      ?auto_20213 - PLACE
      ?auto_20214 - HOIST
      ?auto_20215 - SURFACE
      ?auto_20212 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20210 ?auto_20211 ) ( SURFACE-AT ?auto_20208 ?auto_20211 ) ( CLEAR ?auto_20208 ) ( IS-CRATE ?auto_20209 ) ( AVAILABLE ?auto_20210 ) ( not ( = ?auto_20213 ?auto_20211 ) ) ( HOIST-AT ?auto_20214 ?auto_20213 ) ( AVAILABLE ?auto_20214 ) ( SURFACE-AT ?auto_20209 ?auto_20213 ) ( ON ?auto_20209 ?auto_20215 ) ( CLEAR ?auto_20209 ) ( TRUCK-AT ?auto_20212 ?auto_20211 ) ( not ( = ?auto_20208 ?auto_20209 ) ) ( not ( = ?auto_20208 ?auto_20215 ) ) ( not ( = ?auto_20209 ?auto_20215 ) ) ( not ( = ?auto_20210 ?auto_20214 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20212 ?auto_20211 ?auto_20213 )
      ( !LIFT ?auto_20214 ?auto_20209 ?auto_20215 ?auto_20213 )
      ( !LOAD ?auto_20214 ?auto_20209 ?auto_20212 ?auto_20213 )
      ( !DRIVE ?auto_20212 ?auto_20213 ?auto_20211 )
      ( !UNLOAD ?auto_20210 ?auto_20209 ?auto_20212 ?auto_20211 )
      ( !DROP ?auto_20210 ?auto_20209 ?auto_20208 ?auto_20211 )
      ( MAKE-1CRATE-VERIFY ?auto_20208 ?auto_20209 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_20228 - SURFACE
      ?auto_20229 - SURFACE
      ?auto_20230 - SURFACE
      ?auto_20231 - SURFACE
      ?auto_20232 - SURFACE
      ?auto_20233 - SURFACE
      ?auto_20236 - SURFACE
      ?auto_20235 - SURFACE
      ?auto_20234 - SURFACE
      ?auto_20237 - SURFACE
      ?auto_20239 - SURFACE
      ?auto_20238 - SURFACE
    )
    :vars
    (
      ?auto_20245 - HOIST
      ?auto_20242 - PLACE
      ?auto_20241 - PLACE
      ?auto_20243 - HOIST
      ?auto_20240 - SURFACE
      ?auto_20267 - PLACE
      ?auto_20265 - HOIST
      ?auto_20263 - SURFACE
      ?auto_20254 - PLACE
      ?auto_20264 - HOIST
      ?auto_20258 - SURFACE
      ?auto_20248 - SURFACE
      ?auto_20251 - PLACE
      ?auto_20247 - HOIST
      ?auto_20260 - SURFACE
      ?auto_20253 - PLACE
      ?auto_20266 - HOIST
      ?auto_20252 - SURFACE
      ?auto_20257 - SURFACE
      ?auto_20261 - PLACE
      ?auto_20249 - HOIST
      ?auto_20255 - SURFACE
      ?auto_20262 - PLACE
      ?auto_20259 - HOIST
      ?auto_20256 - SURFACE
      ?auto_20246 - SURFACE
      ?auto_20250 - SURFACE
      ?auto_20244 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20245 ?auto_20242 ) ( IS-CRATE ?auto_20238 ) ( not ( = ?auto_20241 ?auto_20242 ) ) ( HOIST-AT ?auto_20243 ?auto_20241 ) ( SURFACE-AT ?auto_20238 ?auto_20241 ) ( ON ?auto_20238 ?auto_20240 ) ( CLEAR ?auto_20238 ) ( not ( = ?auto_20239 ?auto_20238 ) ) ( not ( = ?auto_20239 ?auto_20240 ) ) ( not ( = ?auto_20238 ?auto_20240 ) ) ( not ( = ?auto_20245 ?auto_20243 ) ) ( IS-CRATE ?auto_20239 ) ( not ( = ?auto_20267 ?auto_20242 ) ) ( HOIST-AT ?auto_20265 ?auto_20267 ) ( AVAILABLE ?auto_20265 ) ( SURFACE-AT ?auto_20239 ?auto_20267 ) ( ON ?auto_20239 ?auto_20263 ) ( CLEAR ?auto_20239 ) ( not ( = ?auto_20237 ?auto_20239 ) ) ( not ( = ?auto_20237 ?auto_20263 ) ) ( not ( = ?auto_20239 ?auto_20263 ) ) ( not ( = ?auto_20245 ?auto_20265 ) ) ( IS-CRATE ?auto_20237 ) ( not ( = ?auto_20254 ?auto_20242 ) ) ( HOIST-AT ?auto_20264 ?auto_20254 ) ( SURFACE-AT ?auto_20237 ?auto_20254 ) ( ON ?auto_20237 ?auto_20258 ) ( CLEAR ?auto_20237 ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20234 ?auto_20258 ) ) ( not ( = ?auto_20237 ?auto_20258 ) ) ( not ( = ?auto_20245 ?auto_20264 ) ) ( IS-CRATE ?auto_20234 ) ( AVAILABLE ?auto_20243 ) ( SURFACE-AT ?auto_20234 ?auto_20241 ) ( ON ?auto_20234 ?auto_20248 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20235 ?auto_20234 ) ) ( not ( = ?auto_20235 ?auto_20248 ) ) ( not ( = ?auto_20234 ?auto_20248 ) ) ( IS-CRATE ?auto_20235 ) ( not ( = ?auto_20251 ?auto_20242 ) ) ( HOIST-AT ?auto_20247 ?auto_20251 ) ( AVAILABLE ?auto_20247 ) ( SURFACE-AT ?auto_20235 ?auto_20251 ) ( ON ?auto_20235 ?auto_20260 ) ( CLEAR ?auto_20235 ) ( not ( = ?auto_20236 ?auto_20235 ) ) ( not ( = ?auto_20236 ?auto_20260 ) ) ( not ( = ?auto_20235 ?auto_20260 ) ) ( not ( = ?auto_20245 ?auto_20247 ) ) ( IS-CRATE ?auto_20236 ) ( not ( = ?auto_20253 ?auto_20242 ) ) ( HOIST-AT ?auto_20266 ?auto_20253 ) ( AVAILABLE ?auto_20266 ) ( SURFACE-AT ?auto_20236 ?auto_20253 ) ( ON ?auto_20236 ?auto_20252 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20233 ?auto_20236 ) ) ( not ( = ?auto_20233 ?auto_20252 ) ) ( not ( = ?auto_20236 ?auto_20252 ) ) ( not ( = ?auto_20245 ?auto_20266 ) ) ( IS-CRATE ?auto_20233 ) ( AVAILABLE ?auto_20264 ) ( SURFACE-AT ?auto_20233 ?auto_20254 ) ( ON ?auto_20233 ?auto_20257 ) ( CLEAR ?auto_20233 ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20257 ) ) ( not ( = ?auto_20233 ?auto_20257 ) ) ( IS-CRATE ?auto_20232 ) ( not ( = ?auto_20261 ?auto_20242 ) ) ( HOIST-AT ?auto_20249 ?auto_20261 ) ( AVAILABLE ?auto_20249 ) ( SURFACE-AT ?auto_20232 ?auto_20261 ) ( ON ?auto_20232 ?auto_20255 ) ( CLEAR ?auto_20232 ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20255 ) ) ( not ( = ?auto_20232 ?auto_20255 ) ) ( not ( = ?auto_20245 ?auto_20249 ) ) ( IS-CRATE ?auto_20231 ) ( not ( = ?auto_20262 ?auto_20242 ) ) ( HOIST-AT ?auto_20259 ?auto_20262 ) ( SURFACE-AT ?auto_20231 ?auto_20262 ) ( ON ?auto_20231 ?auto_20256 ) ( CLEAR ?auto_20231 ) ( not ( = ?auto_20230 ?auto_20231 ) ) ( not ( = ?auto_20230 ?auto_20256 ) ) ( not ( = ?auto_20231 ?auto_20256 ) ) ( not ( = ?auto_20245 ?auto_20259 ) ) ( IS-CRATE ?auto_20230 ) ( SURFACE-AT ?auto_20230 ?auto_20262 ) ( ON ?auto_20230 ?auto_20246 ) ( CLEAR ?auto_20230 ) ( not ( = ?auto_20229 ?auto_20230 ) ) ( not ( = ?auto_20229 ?auto_20246 ) ) ( not ( = ?auto_20230 ?auto_20246 ) ) ( SURFACE-AT ?auto_20228 ?auto_20242 ) ( CLEAR ?auto_20228 ) ( IS-CRATE ?auto_20229 ) ( AVAILABLE ?auto_20245 ) ( AVAILABLE ?auto_20259 ) ( SURFACE-AT ?auto_20229 ?auto_20262 ) ( ON ?auto_20229 ?auto_20250 ) ( CLEAR ?auto_20229 ) ( TRUCK-AT ?auto_20244 ?auto_20242 ) ( not ( = ?auto_20228 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20250 ) ) ( not ( = ?auto_20229 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( not ( = ?auto_20228 ?auto_20246 ) ) ( not ( = ?auto_20230 ?auto_20250 ) ) ( not ( = ?auto_20246 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20231 ) ) ( not ( = ?auto_20228 ?auto_20256 ) ) ( not ( = ?auto_20229 ?auto_20231 ) ) ( not ( = ?auto_20229 ?auto_20256 ) ) ( not ( = ?auto_20231 ?auto_20246 ) ) ( not ( = ?auto_20231 ?auto_20250 ) ) ( not ( = ?auto_20256 ?auto_20246 ) ) ( not ( = ?auto_20256 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( not ( = ?auto_20228 ?auto_20255 ) ) ( not ( = ?auto_20229 ?auto_20232 ) ) ( not ( = ?auto_20229 ?auto_20255 ) ) ( not ( = ?auto_20230 ?auto_20232 ) ) ( not ( = ?auto_20230 ?auto_20255 ) ) ( not ( = ?auto_20232 ?auto_20256 ) ) ( not ( = ?auto_20232 ?auto_20246 ) ) ( not ( = ?auto_20232 ?auto_20250 ) ) ( not ( = ?auto_20261 ?auto_20262 ) ) ( not ( = ?auto_20249 ?auto_20259 ) ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( not ( = ?auto_20255 ?auto_20246 ) ) ( not ( = ?auto_20255 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20233 ) ) ( not ( = ?auto_20228 ?auto_20257 ) ) ( not ( = ?auto_20229 ?auto_20233 ) ) ( not ( = ?auto_20229 ?auto_20257 ) ) ( not ( = ?auto_20230 ?auto_20233 ) ) ( not ( = ?auto_20230 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20257 ) ) ( not ( = ?auto_20233 ?auto_20255 ) ) ( not ( = ?auto_20233 ?auto_20256 ) ) ( not ( = ?auto_20233 ?auto_20246 ) ) ( not ( = ?auto_20233 ?auto_20250 ) ) ( not ( = ?auto_20254 ?auto_20261 ) ) ( not ( = ?auto_20254 ?auto_20262 ) ) ( not ( = ?auto_20264 ?auto_20249 ) ) ( not ( = ?auto_20264 ?auto_20259 ) ) ( not ( = ?auto_20257 ?auto_20255 ) ) ( not ( = ?auto_20257 ?auto_20256 ) ) ( not ( = ?auto_20257 ?auto_20246 ) ) ( not ( = ?auto_20257 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20236 ) ) ( not ( = ?auto_20228 ?auto_20252 ) ) ( not ( = ?auto_20229 ?auto_20236 ) ) ( not ( = ?auto_20229 ?auto_20252 ) ) ( not ( = ?auto_20230 ?auto_20236 ) ) ( not ( = ?auto_20230 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20236 ) ) ( not ( = ?auto_20231 ?auto_20252 ) ) ( not ( = ?auto_20232 ?auto_20236 ) ) ( not ( = ?auto_20232 ?auto_20252 ) ) ( not ( = ?auto_20236 ?auto_20257 ) ) ( not ( = ?auto_20236 ?auto_20255 ) ) ( not ( = ?auto_20236 ?auto_20256 ) ) ( not ( = ?auto_20236 ?auto_20246 ) ) ( not ( = ?auto_20236 ?auto_20250 ) ) ( not ( = ?auto_20253 ?auto_20254 ) ) ( not ( = ?auto_20253 ?auto_20261 ) ) ( not ( = ?auto_20253 ?auto_20262 ) ) ( not ( = ?auto_20266 ?auto_20264 ) ) ( not ( = ?auto_20266 ?auto_20249 ) ) ( not ( = ?auto_20266 ?auto_20259 ) ) ( not ( = ?auto_20252 ?auto_20257 ) ) ( not ( = ?auto_20252 ?auto_20255 ) ) ( not ( = ?auto_20252 ?auto_20256 ) ) ( not ( = ?auto_20252 ?auto_20246 ) ) ( not ( = ?auto_20252 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20235 ) ) ( not ( = ?auto_20228 ?auto_20260 ) ) ( not ( = ?auto_20229 ?auto_20235 ) ) ( not ( = ?auto_20229 ?auto_20260 ) ) ( not ( = ?auto_20230 ?auto_20235 ) ) ( not ( = ?auto_20230 ?auto_20260 ) ) ( not ( = ?auto_20231 ?auto_20235 ) ) ( not ( = ?auto_20231 ?auto_20260 ) ) ( not ( = ?auto_20232 ?auto_20235 ) ) ( not ( = ?auto_20232 ?auto_20260 ) ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20233 ?auto_20260 ) ) ( not ( = ?auto_20235 ?auto_20252 ) ) ( not ( = ?auto_20235 ?auto_20257 ) ) ( not ( = ?auto_20235 ?auto_20255 ) ) ( not ( = ?auto_20235 ?auto_20256 ) ) ( not ( = ?auto_20235 ?auto_20246 ) ) ( not ( = ?auto_20235 ?auto_20250 ) ) ( not ( = ?auto_20251 ?auto_20253 ) ) ( not ( = ?auto_20251 ?auto_20254 ) ) ( not ( = ?auto_20251 ?auto_20261 ) ) ( not ( = ?auto_20251 ?auto_20262 ) ) ( not ( = ?auto_20247 ?auto_20266 ) ) ( not ( = ?auto_20247 ?auto_20264 ) ) ( not ( = ?auto_20247 ?auto_20249 ) ) ( not ( = ?auto_20247 ?auto_20259 ) ) ( not ( = ?auto_20260 ?auto_20252 ) ) ( not ( = ?auto_20260 ?auto_20257 ) ) ( not ( = ?auto_20260 ?auto_20255 ) ) ( not ( = ?auto_20260 ?auto_20256 ) ) ( not ( = ?auto_20260 ?auto_20246 ) ) ( not ( = ?auto_20260 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20234 ) ) ( not ( = ?auto_20228 ?auto_20248 ) ) ( not ( = ?auto_20229 ?auto_20234 ) ) ( not ( = ?auto_20229 ?auto_20248 ) ) ( not ( = ?auto_20230 ?auto_20234 ) ) ( not ( = ?auto_20230 ?auto_20248 ) ) ( not ( = ?auto_20231 ?auto_20234 ) ) ( not ( = ?auto_20231 ?auto_20248 ) ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( not ( = ?auto_20232 ?auto_20248 ) ) ( not ( = ?auto_20233 ?auto_20234 ) ) ( not ( = ?auto_20233 ?auto_20248 ) ) ( not ( = ?auto_20236 ?auto_20234 ) ) ( not ( = ?auto_20236 ?auto_20248 ) ) ( not ( = ?auto_20234 ?auto_20260 ) ) ( not ( = ?auto_20234 ?auto_20252 ) ) ( not ( = ?auto_20234 ?auto_20257 ) ) ( not ( = ?auto_20234 ?auto_20255 ) ) ( not ( = ?auto_20234 ?auto_20256 ) ) ( not ( = ?auto_20234 ?auto_20246 ) ) ( not ( = ?auto_20234 ?auto_20250 ) ) ( not ( = ?auto_20241 ?auto_20251 ) ) ( not ( = ?auto_20241 ?auto_20253 ) ) ( not ( = ?auto_20241 ?auto_20254 ) ) ( not ( = ?auto_20241 ?auto_20261 ) ) ( not ( = ?auto_20241 ?auto_20262 ) ) ( not ( = ?auto_20243 ?auto_20247 ) ) ( not ( = ?auto_20243 ?auto_20266 ) ) ( not ( = ?auto_20243 ?auto_20264 ) ) ( not ( = ?auto_20243 ?auto_20249 ) ) ( not ( = ?auto_20243 ?auto_20259 ) ) ( not ( = ?auto_20248 ?auto_20260 ) ) ( not ( = ?auto_20248 ?auto_20252 ) ) ( not ( = ?auto_20248 ?auto_20257 ) ) ( not ( = ?auto_20248 ?auto_20255 ) ) ( not ( = ?auto_20248 ?auto_20256 ) ) ( not ( = ?auto_20248 ?auto_20246 ) ) ( not ( = ?auto_20248 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20237 ) ) ( not ( = ?auto_20228 ?auto_20258 ) ) ( not ( = ?auto_20229 ?auto_20237 ) ) ( not ( = ?auto_20229 ?auto_20258 ) ) ( not ( = ?auto_20230 ?auto_20237 ) ) ( not ( = ?auto_20230 ?auto_20258 ) ) ( not ( = ?auto_20231 ?auto_20237 ) ) ( not ( = ?auto_20231 ?auto_20258 ) ) ( not ( = ?auto_20232 ?auto_20237 ) ) ( not ( = ?auto_20232 ?auto_20258 ) ) ( not ( = ?auto_20233 ?auto_20237 ) ) ( not ( = ?auto_20233 ?auto_20258 ) ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20258 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20258 ) ) ( not ( = ?auto_20237 ?auto_20248 ) ) ( not ( = ?auto_20237 ?auto_20260 ) ) ( not ( = ?auto_20237 ?auto_20252 ) ) ( not ( = ?auto_20237 ?auto_20257 ) ) ( not ( = ?auto_20237 ?auto_20255 ) ) ( not ( = ?auto_20237 ?auto_20256 ) ) ( not ( = ?auto_20237 ?auto_20246 ) ) ( not ( = ?auto_20237 ?auto_20250 ) ) ( not ( = ?auto_20258 ?auto_20248 ) ) ( not ( = ?auto_20258 ?auto_20260 ) ) ( not ( = ?auto_20258 ?auto_20252 ) ) ( not ( = ?auto_20258 ?auto_20257 ) ) ( not ( = ?auto_20258 ?auto_20255 ) ) ( not ( = ?auto_20258 ?auto_20256 ) ) ( not ( = ?auto_20258 ?auto_20246 ) ) ( not ( = ?auto_20258 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20239 ) ) ( not ( = ?auto_20228 ?auto_20263 ) ) ( not ( = ?auto_20229 ?auto_20239 ) ) ( not ( = ?auto_20229 ?auto_20263 ) ) ( not ( = ?auto_20230 ?auto_20239 ) ) ( not ( = ?auto_20230 ?auto_20263 ) ) ( not ( = ?auto_20231 ?auto_20239 ) ) ( not ( = ?auto_20231 ?auto_20263 ) ) ( not ( = ?auto_20232 ?auto_20239 ) ) ( not ( = ?auto_20232 ?auto_20263 ) ) ( not ( = ?auto_20233 ?auto_20239 ) ) ( not ( = ?auto_20233 ?auto_20263 ) ) ( not ( = ?auto_20236 ?auto_20239 ) ) ( not ( = ?auto_20236 ?auto_20263 ) ) ( not ( = ?auto_20235 ?auto_20239 ) ) ( not ( = ?auto_20235 ?auto_20263 ) ) ( not ( = ?auto_20234 ?auto_20239 ) ) ( not ( = ?auto_20234 ?auto_20263 ) ) ( not ( = ?auto_20239 ?auto_20258 ) ) ( not ( = ?auto_20239 ?auto_20248 ) ) ( not ( = ?auto_20239 ?auto_20260 ) ) ( not ( = ?auto_20239 ?auto_20252 ) ) ( not ( = ?auto_20239 ?auto_20257 ) ) ( not ( = ?auto_20239 ?auto_20255 ) ) ( not ( = ?auto_20239 ?auto_20256 ) ) ( not ( = ?auto_20239 ?auto_20246 ) ) ( not ( = ?auto_20239 ?auto_20250 ) ) ( not ( = ?auto_20267 ?auto_20254 ) ) ( not ( = ?auto_20267 ?auto_20241 ) ) ( not ( = ?auto_20267 ?auto_20251 ) ) ( not ( = ?auto_20267 ?auto_20253 ) ) ( not ( = ?auto_20267 ?auto_20261 ) ) ( not ( = ?auto_20267 ?auto_20262 ) ) ( not ( = ?auto_20265 ?auto_20264 ) ) ( not ( = ?auto_20265 ?auto_20243 ) ) ( not ( = ?auto_20265 ?auto_20247 ) ) ( not ( = ?auto_20265 ?auto_20266 ) ) ( not ( = ?auto_20265 ?auto_20249 ) ) ( not ( = ?auto_20265 ?auto_20259 ) ) ( not ( = ?auto_20263 ?auto_20258 ) ) ( not ( = ?auto_20263 ?auto_20248 ) ) ( not ( = ?auto_20263 ?auto_20260 ) ) ( not ( = ?auto_20263 ?auto_20252 ) ) ( not ( = ?auto_20263 ?auto_20257 ) ) ( not ( = ?auto_20263 ?auto_20255 ) ) ( not ( = ?auto_20263 ?auto_20256 ) ) ( not ( = ?auto_20263 ?auto_20246 ) ) ( not ( = ?auto_20263 ?auto_20250 ) ) ( not ( = ?auto_20228 ?auto_20238 ) ) ( not ( = ?auto_20228 ?auto_20240 ) ) ( not ( = ?auto_20229 ?auto_20238 ) ) ( not ( = ?auto_20229 ?auto_20240 ) ) ( not ( = ?auto_20230 ?auto_20238 ) ) ( not ( = ?auto_20230 ?auto_20240 ) ) ( not ( = ?auto_20231 ?auto_20238 ) ) ( not ( = ?auto_20231 ?auto_20240 ) ) ( not ( = ?auto_20232 ?auto_20238 ) ) ( not ( = ?auto_20232 ?auto_20240 ) ) ( not ( = ?auto_20233 ?auto_20238 ) ) ( not ( = ?auto_20233 ?auto_20240 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20235 ?auto_20238 ) ) ( not ( = ?auto_20235 ?auto_20240 ) ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20234 ?auto_20240 ) ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20240 ) ) ( not ( = ?auto_20238 ?auto_20263 ) ) ( not ( = ?auto_20238 ?auto_20258 ) ) ( not ( = ?auto_20238 ?auto_20248 ) ) ( not ( = ?auto_20238 ?auto_20260 ) ) ( not ( = ?auto_20238 ?auto_20252 ) ) ( not ( = ?auto_20238 ?auto_20257 ) ) ( not ( = ?auto_20238 ?auto_20255 ) ) ( not ( = ?auto_20238 ?auto_20256 ) ) ( not ( = ?auto_20238 ?auto_20246 ) ) ( not ( = ?auto_20238 ?auto_20250 ) ) ( not ( = ?auto_20240 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20258 ) ) ( not ( = ?auto_20240 ?auto_20248 ) ) ( not ( = ?auto_20240 ?auto_20260 ) ) ( not ( = ?auto_20240 ?auto_20252 ) ) ( not ( = ?auto_20240 ?auto_20257 ) ) ( not ( = ?auto_20240 ?auto_20255 ) ) ( not ( = ?auto_20240 ?auto_20256 ) ) ( not ( = ?auto_20240 ?auto_20246 ) ) ( not ( = ?auto_20240 ?auto_20250 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20228 ?auto_20229 ?auto_20230 ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20236 ?auto_20235 ?auto_20234 ?auto_20237 ?auto_20239 )
      ( MAKE-1CRATE ?auto_20239 ?auto_20238 )
      ( MAKE-11CRATE-VERIFY ?auto_20228 ?auto_20229 ?auto_20230 ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20236 ?auto_20235 ?auto_20234 ?auto_20237 ?auto_20239 ?auto_20238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20270 - SURFACE
      ?auto_20271 - SURFACE
    )
    :vars
    (
      ?auto_20272 - HOIST
      ?auto_20273 - PLACE
      ?auto_20275 - PLACE
      ?auto_20276 - HOIST
      ?auto_20277 - SURFACE
      ?auto_20274 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20272 ?auto_20273 ) ( SURFACE-AT ?auto_20270 ?auto_20273 ) ( CLEAR ?auto_20270 ) ( IS-CRATE ?auto_20271 ) ( AVAILABLE ?auto_20272 ) ( not ( = ?auto_20275 ?auto_20273 ) ) ( HOIST-AT ?auto_20276 ?auto_20275 ) ( AVAILABLE ?auto_20276 ) ( SURFACE-AT ?auto_20271 ?auto_20275 ) ( ON ?auto_20271 ?auto_20277 ) ( CLEAR ?auto_20271 ) ( TRUCK-AT ?auto_20274 ?auto_20273 ) ( not ( = ?auto_20270 ?auto_20271 ) ) ( not ( = ?auto_20270 ?auto_20277 ) ) ( not ( = ?auto_20271 ?auto_20277 ) ) ( not ( = ?auto_20272 ?auto_20276 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20274 ?auto_20273 ?auto_20275 )
      ( !LIFT ?auto_20276 ?auto_20271 ?auto_20277 ?auto_20275 )
      ( !LOAD ?auto_20276 ?auto_20271 ?auto_20274 ?auto_20275 )
      ( !DRIVE ?auto_20274 ?auto_20275 ?auto_20273 )
      ( !UNLOAD ?auto_20272 ?auto_20271 ?auto_20274 ?auto_20273 )
      ( !DROP ?auto_20272 ?auto_20271 ?auto_20270 ?auto_20273 )
      ( MAKE-1CRATE-VERIFY ?auto_20270 ?auto_20271 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_20291 - SURFACE
      ?auto_20292 - SURFACE
      ?auto_20293 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20295 - SURFACE
      ?auto_20296 - SURFACE
      ?auto_20299 - SURFACE
      ?auto_20298 - SURFACE
      ?auto_20297 - SURFACE
      ?auto_20300 - SURFACE
      ?auto_20302 - SURFACE
      ?auto_20301 - SURFACE
      ?auto_20303 - SURFACE
    )
    :vars
    (
      ?auto_20308 - HOIST
      ?auto_20306 - PLACE
      ?auto_20305 - PLACE
      ?auto_20309 - HOIST
      ?auto_20307 - SURFACE
      ?auto_20316 - PLACE
      ?auto_20312 - HOIST
      ?auto_20315 - SURFACE
      ?auto_20311 - PLACE
      ?auto_20326 - HOIST
      ?auto_20319 - SURFACE
      ?auto_20322 - PLACE
      ?auto_20321 - HOIST
      ?auto_20328 - SURFACE
      ?auto_20317 - SURFACE
      ?auto_20310 - PLACE
      ?auto_20314 - HOIST
      ?auto_20329 - SURFACE
      ?auto_20327 - PLACE
      ?auto_20331 - HOIST
      ?auto_20330 - SURFACE
      ?auto_20313 - SURFACE
      ?auto_20325 - PLACE
      ?auto_20333 - HOIST
      ?auto_20324 - SURFACE
      ?auto_20318 - PLACE
      ?auto_20332 - HOIST
      ?auto_20323 - SURFACE
      ?auto_20334 - SURFACE
      ?auto_20320 - SURFACE
      ?auto_20304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20308 ?auto_20306 ) ( IS-CRATE ?auto_20303 ) ( not ( = ?auto_20305 ?auto_20306 ) ) ( HOIST-AT ?auto_20309 ?auto_20305 ) ( AVAILABLE ?auto_20309 ) ( SURFACE-AT ?auto_20303 ?auto_20305 ) ( ON ?auto_20303 ?auto_20307 ) ( CLEAR ?auto_20303 ) ( not ( = ?auto_20301 ?auto_20303 ) ) ( not ( = ?auto_20301 ?auto_20307 ) ) ( not ( = ?auto_20303 ?auto_20307 ) ) ( not ( = ?auto_20308 ?auto_20309 ) ) ( IS-CRATE ?auto_20301 ) ( not ( = ?auto_20316 ?auto_20306 ) ) ( HOIST-AT ?auto_20312 ?auto_20316 ) ( SURFACE-AT ?auto_20301 ?auto_20316 ) ( ON ?auto_20301 ?auto_20315 ) ( CLEAR ?auto_20301 ) ( not ( = ?auto_20302 ?auto_20301 ) ) ( not ( = ?auto_20302 ?auto_20315 ) ) ( not ( = ?auto_20301 ?auto_20315 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( IS-CRATE ?auto_20302 ) ( not ( = ?auto_20311 ?auto_20306 ) ) ( HOIST-AT ?auto_20326 ?auto_20311 ) ( AVAILABLE ?auto_20326 ) ( SURFACE-AT ?auto_20302 ?auto_20311 ) ( ON ?auto_20302 ?auto_20319 ) ( CLEAR ?auto_20302 ) ( not ( = ?auto_20300 ?auto_20302 ) ) ( not ( = ?auto_20300 ?auto_20319 ) ) ( not ( = ?auto_20302 ?auto_20319 ) ) ( not ( = ?auto_20308 ?auto_20326 ) ) ( IS-CRATE ?auto_20300 ) ( not ( = ?auto_20322 ?auto_20306 ) ) ( HOIST-AT ?auto_20321 ?auto_20322 ) ( SURFACE-AT ?auto_20300 ?auto_20322 ) ( ON ?auto_20300 ?auto_20328 ) ( CLEAR ?auto_20300 ) ( not ( = ?auto_20297 ?auto_20300 ) ) ( not ( = ?auto_20297 ?auto_20328 ) ) ( not ( = ?auto_20300 ?auto_20328 ) ) ( not ( = ?auto_20308 ?auto_20321 ) ) ( IS-CRATE ?auto_20297 ) ( AVAILABLE ?auto_20312 ) ( SURFACE-AT ?auto_20297 ?auto_20316 ) ( ON ?auto_20297 ?auto_20317 ) ( CLEAR ?auto_20297 ) ( not ( = ?auto_20298 ?auto_20297 ) ) ( not ( = ?auto_20298 ?auto_20317 ) ) ( not ( = ?auto_20297 ?auto_20317 ) ) ( IS-CRATE ?auto_20298 ) ( not ( = ?auto_20310 ?auto_20306 ) ) ( HOIST-AT ?auto_20314 ?auto_20310 ) ( AVAILABLE ?auto_20314 ) ( SURFACE-AT ?auto_20298 ?auto_20310 ) ( ON ?auto_20298 ?auto_20329 ) ( CLEAR ?auto_20298 ) ( not ( = ?auto_20299 ?auto_20298 ) ) ( not ( = ?auto_20299 ?auto_20329 ) ) ( not ( = ?auto_20298 ?auto_20329 ) ) ( not ( = ?auto_20308 ?auto_20314 ) ) ( IS-CRATE ?auto_20299 ) ( not ( = ?auto_20327 ?auto_20306 ) ) ( HOIST-AT ?auto_20331 ?auto_20327 ) ( AVAILABLE ?auto_20331 ) ( SURFACE-AT ?auto_20299 ?auto_20327 ) ( ON ?auto_20299 ?auto_20330 ) ( CLEAR ?auto_20299 ) ( not ( = ?auto_20296 ?auto_20299 ) ) ( not ( = ?auto_20296 ?auto_20330 ) ) ( not ( = ?auto_20299 ?auto_20330 ) ) ( not ( = ?auto_20308 ?auto_20331 ) ) ( IS-CRATE ?auto_20296 ) ( AVAILABLE ?auto_20321 ) ( SURFACE-AT ?auto_20296 ?auto_20322 ) ( ON ?auto_20296 ?auto_20313 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20313 ) ) ( not ( = ?auto_20296 ?auto_20313 ) ) ( IS-CRATE ?auto_20295 ) ( not ( = ?auto_20325 ?auto_20306 ) ) ( HOIST-AT ?auto_20333 ?auto_20325 ) ( AVAILABLE ?auto_20333 ) ( SURFACE-AT ?auto_20295 ?auto_20325 ) ( ON ?auto_20295 ?auto_20324 ) ( CLEAR ?auto_20295 ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( not ( = ?auto_20294 ?auto_20324 ) ) ( not ( = ?auto_20295 ?auto_20324 ) ) ( not ( = ?auto_20308 ?auto_20333 ) ) ( IS-CRATE ?auto_20294 ) ( not ( = ?auto_20318 ?auto_20306 ) ) ( HOIST-AT ?auto_20332 ?auto_20318 ) ( SURFACE-AT ?auto_20294 ?auto_20318 ) ( ON ?auto_20294 ?auto_20323 ) ( CLEAR ?auto_20294 ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20323 ) ) ( not ( = ?auto_20294 ?auto_20323 ) ) ( not ( = ?auto_20308 ?auto_20332 ) ) ( IS-CRATE ?auto_20293 ) ( SURFACE-AT ?auto_20293 ?auto_20318 ) ( ON ?auto_20293 ?auto_20334 ) ( CLEAR ?auto_20293 ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20334 ) ) ( not ( = ?auto_20293 ?auto_20334 ) ) ( SURFACE-AT ?auto_20291 ?auto_20306 ) ( CLEAR ?auto_20291 ) ( IS-CRATE ?auto_20292 ) ( AVAILABLE ?auto_20308 ) ( AVAILABLE ?auto_20332 ) ( SURFACE-AT ?auto_20292 ?auto_20318 ) ( ON ?auto_20292 ?auto_20320 ) ( CLEAR ?auto_20292 ) ( TRUCK-AT ?auto_20304 ?auto_20306 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20320 ) ) ( not ( = ?auto_20292 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20334 ) ) ( not ( = ?auto_20293 ?auto_20320 ) ) ( not ( = ?auto_20334 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20323 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20323 ) ) ( not ( = ?auto_20294 ?auto_20334 ) ) ( not ( = ?auto_20294 ?auto_20320 ) ) ( not ( = ?auto_20323 ?auto_20334 ) ) ( not ( = ?auto_20323 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20295 ) ) ( not ( = ?auto_20291 ?auto_20324 ) ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20292 ?auto_20324 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20324 ) ) ( not ( = ?auto_20295 ?auto_20323 ) ) ( not ( = ?auto_20295 ?auto_20334 ) ) ( not ( = ?auto_20295 ?auto_20320 ) ) ( not ( = ?auto_20325 ?auto_20318 ) ) ( not ( = ?auto_20333 ?auto_20332 ) ) ( not ( = ?auto_20324 ?auto_20323 ) ) ( not ( = ?auto_20324 ?auto_20334 ) ) ( not ( = ?auto_20324 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20296 ) ) ( not ( = ?auto_20291 ?auto_20313 ) ) ( not ( = ?auto_20292 ?auto_20296 ) ) ( not ( = ?auto_20292 ?auto_20313 ) ) ( not ( = ?auto_20293 ?auto_20296 ) ) ( not ( = ?auto_20293 ?auto_20313 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20313 ) ) ( not ( = ?auto_20296 ?auto_20324 ) ) ( not ( = ?auto_20296 ?auto_20323 ) ) ( not ( = ?auto_20296 ?auto_20334 ) ) ( not ( = ?auto_20296 ?auto_20320 ) ) ( not ( = ?auto_20322 ?auto_20325 ) ) ( not ( = ?auto_20322 ?auto_20318 ) ) ( not ( = ?auto_20321 ?auto_20333 ) ) ( not ( = ?auto_20321 ?auto_20332 ) ) ( not ( = ?auto_20313 ?auto_20324 ) ) ( not ( = ?auto_20313 ?auto_20323 ) ) ( not ( = ?auto_20313 ?auto_20334 ) ) ( not ( = ?auto_20313 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20299 ) ) ( not ( = ?auto_20291 ?auto_20330 ) ) ( not ( = ?auto_20292 ?auto_20299 ) ) ( not ( = ?auto_20292 ?auto_20330 ) ) ( not ( = ?auto_20293 ?auto_20299 ) ) ( not ( = ?auto_20293 ?auto_20330 ) ) ( not ( = ?auto_20294 ?auto_20299 ) ) ( not ( = ?auto_20294 ?auto_20330 ) ) ( not ( = ?auto_20295 ?auto_20299 ) ) ( not ( = ?auto_20295 ?auto_20330 ) ) ( not ( = ?auto_20299 ?auto_20313 ) ) ( not ( = ?auto_20299 ?auto_20324 ) ) ( not ( = ?auto_20299 ?auto_20323 ) ) ( not ( = ?auto_20299 ?auto_20334 ) ) ( not ( = ?auto_20299 ?auto_20320 ) ) ( not ( = ?auto_20327 ?auto_20322 ) ) ( not ( = ?auto_20327 ?auto_20325 ) ) ( not ( = ?auto_20327 ?auto_20318 ) ) ( not ( = ?auto_20331 ?auto_20321 ) ) ( not ( = ?auto_20331 ?auto_20333 ) ) ( not ( = ?auto_20331 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20313 ) ) ( not ( = ?auto_20330 ?auto_20324 ) ) ( not ( = ?auto_20330 ?auto_20323 ) ) ( not ( = ?auto_20330 ?auto_20334 ) ) ( not ( = ?auto_20330 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20298 ) ) ( not ( = ?auto_20291 ?auto_20329 ) ) ( not ( = ?auto_20292 ?auto_20298 ) ) ( not ( = ?auto_20292 ?auto_20329 ) ) ( not ( = ?auto_20293 ?auto_20298 ) ) ( not ( = ?auto_20293 ?auto_20329 ) ) ( not ( = ?auto_20294 ?auto_20298 ) ) ( not ( = ?auto_20294 ?auto_20329 ) ) ( not ( = ?auto_20295 ?auto_20298 ) ) ( not ( = ?auto_20295 ?auto_20329 ) ) ( not ( = ?auto_20296 ?auto_20298 ) ) ( not ( = ?auto_20296 ?auto_20329 ) ) ( not ( = ?auto_20298 ?auto_20330 ) ) ( not ( = ?auto_20298 ?auto_20313 ) ) ( not ( = ?auto_20298 ?auto_20324 ) ) ( not ( = ?auto_20298 ?auto_20323 ) ) ( not ( = ?auto_20298 ?auto_20334 ) ) ( not ( = ?auto_20298 ?auto_20320 ) ) ( not ( = ?auto_20310 ?auto_20327 ) ) ( not ( = ?auto_20310 ?auto_20322 ) ) ( not ( = ?auto_20310 ?auto_20325 ) ) ( not ( = ?auto_20310 ?auto_20318 ) ) ( not ( = ?auto_20314 ?auto_20331 ) ) ( not ( = ?auto_20314 ?auto_20321 ) ) ( not ( = ?auto_20314 ?auto_20333 ) ) ( not ( = ?auto_20314 ?auto_20332 ) ) ( not ( = ?auto_20329 ?auto_20330 ) ) ( not ( = ?auto_20329 ?auto_20313 ) ) ( not ( = ?auto_20329 ?auto_20324 ) ) ( not ( = ?auto_20329 ?auto_20323 ) ) ( not ( = ?auto_20329 ?auto_20334 ) ) ( not ( = ?auto_20329 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20297 ) ) ( not ( = ?auto_20291 ?auto_20317 ) ) ( not ( = ?auto_20292 ?auto_20297 ) ) ( not ( = ?auto_20292 ?auto_20317 ) ) ( not ( = ?auto_20293 ?auto_20297 ) ) ( not ( = ?auto_20293 ?auto_20317 ) ) ( not ( = ?auto_20294 ?auto_20297 ) ) ( not ( = ?auto_20294 ?auto_20317 ) ) ( not ( = ?auto_20295 ?auto_20297 ) ) ( not ( = ?auto_20295 ?auto_20317 ) ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( not ( = ?auto_20296 ?auto_20317 ) ) ( not ( = ?auto_20299 ?auto_20297 ) ) ( not ( = ?auto_20299 ?auto_20317 ) ) ( not ( = ?auto_20297 ?auto_20329 ) ) ( not ( = ?auto_20297 ?auto_20330 ) ) ( not ( = ?auto_20297 ?auto_20313 ) ) ( not ( = ?auto_20297 ?auto_20324 ) ) ( not ( = ?auto_20297 ?auto_20323 ) ) ( not ( = ?auto_20297 ?auto_20334 ) ) ( not ( = ?auto_20297 ?auto_20320 ) ) ( not ( = ?auto_20316 ?auto_20310 ) ) ( not ( = ?auto_20316 ?auto_20327 ) ) ( not ( = ?auto_20316 ?auto_20322 ) ) ( not ( = ?auto_20316 ?auto_20325 ) ) ( not ( = ?auto_20316 ?auto_20318 ) ) ( not ( = ?auto_20312 ?auto_20314 ) ) ( not ( = ?auto_20312 ?auto_20331 ) ) ( not ( = ?auto_20312 ?auto_20321 ) ) ( not ( = ?auto_20312 ?auto_20333 ) ) ( not ( = ?auto_20312 ?auto_20332 ) ) ( not ( = ?auto_20317 ?auto_20329 ) ) ( not ( = ?auto_20317 ?auto_20330 ) ) ( not ( = ?auto_20317 ?auto_20313 ) ) ( not ( = ?auto_20317 ?auto_20324 ) ) ( not ( = ?auto_20317 ?auto_20323 ) ) ( not ( = ?auto_20317 ?auto_20334 ) ) ( not ( = ?auto_20317 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20300 ) ) ( not ( = ?auto_20291 ?auto_20328 ) ) ( not ( = ?auto_20292 ?auto_20300 ) ) ( not ( = ?auto_20292 ?auto_20328 ) ) ( not ( = ?auto_20293 ?auto_20300 ) ) ( not ( = ?auto_20293 ?auto_20328 ) ) ( not ( = ?auto_20294 ?auto_20300 ) ) ( not ( = ?auto_20294 ?auto_20328 ) ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20295 ?auto_20328 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20328 ) ) ( not ( = ?auto_20299 ?auto_20300 ) ) ( not ( = ?auto_20299 ?auto_20328 ) ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( not ( = ?auto_20298 ?auto_20328 ) ) ( not ( = ?auto_20300 ?auto_20317 ) ) ( not ( = ?auto_20300 ?auto_20329 ) ) ( not ( = ?auto_20300 ?auto_20330 ) ) ( not ( = ?auto_20300 ?auto_20313 ) ) ( not ( = ?auto_20300 ?auto_20324 ) ) ( not ( = ?auto_20300 ?auto_20323 ) ) ( not ( = ?auto_20300 ?auto_20334 ) ) ( not ( = ?auto_20300 ?auto_20320 ) ) ( not ( = ?auto_20328 ?auto_20317 ) ) ( not ( = ?auto_20328 ?auto_20329 ) ) ( not ( = ?auto_20328 ?auto_20330 ) ) ( not ( = ?auto_20328 ?auto_20313 ) ) ( not ( = ?auto_20328 ?auto_20324 ) ) ( not ( = ?auto_20328 ?auto_20323 ) ) ( not ( = ?auto_20328 ?auto_20334 ) ) ( not ( = ?auto_20328 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20302 ) ) ( not ( = ?auto_20291 ?auto_20319 ) ) ( not ( = ?auto_20292 ?auto_20302 ) ) ( not ( = ?auto_20292 ?auto_20319 ) ) ( not ( = ?auto_20293 ?auto_20302 ) ) ( not ( = ?auto_20293 ?auto_20319 ) ) ( not ( = ?auto_20294 ?auto_20302 ) ) ( not ( = ?auto_20294 ?auto_20319 ) ) ( not ( = ?auto_20295 ?auto_20302 ) ) ( not ( = ?auto_20295 ?auto_20319 ) ) ( not ( = ?auto_20296 ?auto_20302 ) ) ( not ( = ?auto_20296 ?auto_20319 ) ) ( not ( = ?auto_20299 ?auto_20302 ) ) ( not ( = ?auto_20299 ?auto_20319 ) ) ( not ( = ?auto_20298 ?auto_20302 ) ) ( not ( = ?auto_20298 ?auto_20319 ) ) ( not ( = ?auto_20297 ?auto_20302 ) ) ( not ( = ?auto_20297 ?auto_20319 ) ) ( not ( = ?auto_20302 ?auto_20328 ) ) ( not ( = ?auto_20302 ?auto_20317 ) ) ( not ( = ?auto_20302 ?auto_20329 ) ) ( not ( = ?auto_20302 ?auto_20330 ) ) ( not ( = ?auto_20302 ?auto_20313 ) ) ( not ( = ?auto_20302 ?auto_20324 ) ) ( not ( = ?auto_20302 ?auto_20323 ) ) ( not ( = ?auto_20302 ?auto_20334 ) ) ( not ( = ?auto_20302 ?auto_20320 ) ) ( not ( = ?auto_20311 ?auto_20322 ) ) ( not ( = ?auto_20311 ?auto_20316 ) ) ( not ( = ?auto_20311 ?auto_20310 ) ) ( not ( = ?auto_20311 ?auto_20327 ) ) ( not ( = ?auto_20311 ?auto_20325 ) ) ( not ( = ?auto_20311 ?auto_20318 ) ) ( not ( = ?auto_20326 ?auto_20321 ) ) ( not ( = ?auto_20326 ?auto_20312 ) ) ( not ( = ?auto_20326 ?auto_20314 ) ) ( not ( = ?auto_20326 ?auto_20331 ) ) ( not ( = ?auto_20326 ?auto_20333 ) ) ( not ( = ?auto_20326 ?auto_20332 ) ) ( not ( = ?auto_20319 ?auto_20328 ) ) ( not ( = ?auto_20319 ?auto_20317 ) ) ( not ( = ?auto_20319 ?auto_20329 ) ) ( not ( = ?auto_20319 ?auto_20330 ) ) ( not ( = ?auto_20319 ?auto_20313 ) ) ( not ( = ?auto_20319 ?auto_20324 ) ) ( not ( = ?auto_20319 ?auto_20323 ) ) ( not ( = ?auto_20319 ?auto_20334 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20301 ) ) ( not ( = ?auto_20291 ?auto_20315 ) ) ( not ( = ?auto_20292 ?auto_20301 ) ) ( not ( = ?auto_20292 ?auto_20315 ) ) ( not ( = ?auto_20293 ?auto_20301 ) ) ( not ( = ?auto_20293 ?auto_20315 ) ) ( not ( = ?auto_20294 ?auto_20301 ) ) ( not ( = ?auto_20294 ?auto_20315 ) ) ( not ( = ?auto_20295 ?auto_20301 ) ) ( not ( = ?auto_20295 ?auto_20315 ) ) ( not ( = ?auto_20296 ?auto_20301 ) ) ( not ( = ?auto_20296 ?auto_20315 ) ) ( not ( = ?auto_20299 ?auto_20301 ) ) ( not ( = ?auto_20299 ?auto_20315 ) ) ( not ( = ?auto_20298 ?auto_20301 ) ) ( not ( = ?auto_20298 ?auto_20315 ) ) ( not ( = ?auto_20297 ?auto_20301 ) ) ( not ( = ?auto_20297 ?auto_20315 ) ) ( not ( = ?auto_20300 ?auto_20301 ) ) ( not ( = ?auto_20300 ?auto_20315 ) ) ( not ( = ?auto_20301 ?auto_20319 ) ) ( not ( = ?auto_20301 ?auto_20328 ) ) ( not ( = ?auto_20301 ?auto_20317 ) ) ( not ( = ?auto_20301 ?auto_20329 ) ) ( not ( = ?auto_20301 ?auto_20330 ) ) ( not ( = ?auto_20301 ?auto_20313 ) ) ( not ( = ?auto_20301 ?auto_20324 ) ) ( not ( = ?auto_20301 ?auto_20323 ) ) ( not ( = ?auto_20301 ?auto_20334 ) ) ( not ( = ?auto_20301 ?auto_20320 ) ) ( not ( = ?auto_20315 ?auto_20319 ) ) ( not ( = ?auto_20315 ?auto_20328 ) ) ( not ( = ?auto_20315 ?auto_20317 ) ) ( not ( = ?auto_20315 ?auto_20329 ) ) ( not ( = ?auto_20315 ?auto_20330 ) ) ( not ( = ?auto_20315 ?auto_20313 ) ) ( not ( = ?auto_20315 ?auto_20324 ) ) ( not ( = ?auto_20315 ?auto_20323 ) ) ( not ( = ?auto_20315 ?auto_20334 ) ) ( not ( = ?auto_20315 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20303 ) ) ( not ( = ?auto_20291 ?auto_20307 ) ) ( not ( = ?auto_20292 ?auto_20303 ) ) ( not ( = ?auto_20292 ?auto_20307 ) ) ( not ( = ?auto_20293 ?auto_20303 ) ) ( not ( = ?auto_20293 ?auto_20307 ) ) ( not ( = ?auto_20294 ?auto_20303 ) ) ( not ( = ?auto_20294 ?auto_20307 ) ) ( not ( = ?auto_20295 ?auto_20303 ) ) ( not ( = ?auto_20295 ?auto_20307 ) ) ( not ( = ?auto_20296 ?auto_20303 ) ) ( not ( = ?auto_20296 ?auto_20307 ) ) ( not ( = ?auto_20299 ?auto_20303 ) ) ( not ( = ?auto_20299 ?auto_20307 ) ) ( not ( = ?auto_20298 ?auto_20303 ) ) ( not ( = ?auto_20298 ?auto_20307 ) ) ( not ( = ?auto_20297 ?auto_20303 ) ) ( not ( = ?auto_20297 ?auto_20307 ) ) ( not ( = ?auto_20300 ?auto_20303 ) ) ( not ( = ?auto_20300 ?auto_20307 ) ) ( not ( = ?auto_20302 ?auto_20303 ) ) ( not ( = ?auto_20302 ?auto_20307 ) ) ( not ( = ?auto_20303 ?auto_20315 ) ) ( not ( = ?auto_20303 ?auto_20319 ) ) ( not ( = ?auto_20303 ?auto_20328 ) ) ( not ( = ?auto_20303 ?auto_20317 ) ) ( not ( = ?auto_20303 ?auto_20329 ) ) ( not ( = ?auto_20303 ?auto_20330 ) ) ( not ( = ?auto_20303 ?auto_20313 ) ) ( not ( = ?auto_20303 ?auto_20324 ) ) ( not ( = ?auto_20303 ?auto_20323 ) ) ( not ( = ?auto_20303 ?auto_20334 ) ) ( not ( = ?auto_20303 ?auto_20320 ) ) ( not ( = ?auto_20305 ?auto_20316 ) ) ( not ( = ?auto_20305 ?auto_20311 ) ) ( not ( = ?auto_20305 ?auto_20322 ) ) ( not ( = ?auto_20305 ?auto_20310 ) ) ( not ( = ?auto_20305 ?auto_20327 ) ) ( not ( = ?auto_20305 ?auto_20325 ) ) ( not ( = ?auto_20305 ?auto_20318 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20326 ) ) ( not ( = ?auto_20309 ?auto_20321 ) ) ( not ( = ?auto_20309 ?auto_20314 ) ) ( not ( = ?auto_20309 ?auto_20331 ) ) ( not ( = ?auto_20309 ?auto_20333 ) ) ( not ( = ?auto_20309 ?auto_20332 ) ) ( not ( = ?auto_20307 ?auto_20315 ) ) ( not ( = ?auto_20307 ?auto_20319 ) ) ( not ( = ?auto_20307 ?auto_20328 ) ) ( not ( = ?auto_20307 ?auto_20317 ) ) ( not ( = ?auto_20307 ?auto_20329 ) ) ( not ( = ?auto_20307 ?auto_20330 ) ) ( not ( = ?auto_20307 ?auto_20313 ) ) ( not ( = ?auto_20307 ?auto_20324 ) ) ( not ( = ?auto_20307 ?auto_20323 ) ) ( not ( = ?auto_20307 ?auto_20334 ) ) ( not ( = ?auto_20307 ?auto_20320 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ?auto_20299 ?auto_20298 ?auto_20297 ?auto_20300 ?auto_20302 ?auto_20301 )
      ( MAKE-1CRATE ?auto_20301 ?auto_20303 )
      ( MAKE-12CRATE-VERIFY ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ?auto_20299 ?auto_20298 ?auto_20297 ?auto_20300 ?auto_20302 ?auto_20301 ?auto_20303 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20337 - SURFACE
      ?auto_20338 - SURFACE
    )
    :vars
    (
      ?auto_20339 - HOIST
      ?auto_20340 - PLACE
      ?auto_20342 - PLACE
      ?auto_20343 - HOIST
      ?auto_20344 - SURFACE
      ?auto_20341 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20339 ?auto_20340 ) ( SURFACE-AT ?auto_20337 ?auto_20340 ) ( CLEAR ?auto_20337 ) ( IS-CRATE ?auto_20338 ) ( AVAILABLE ?auto_20339 ) ( not ( = ?auto_20342 ?auto_20340 ) ) ( HOIST-AT ?auto_20343 ?auto_20342 ) ( AVAILABLE ?auto_20343 ) ( SURFACE-AT ?auto_20338 ?auto_20342 ) ( ON ?auto_20338 ?auto_20344 ) ( CLEAR ?auto_20338 ) ( TRUCK-AT ?auto_20341 ?auto_20340 ) ( not ( = ?auto_20337 ?auto_20338 ) ) ( not ( = ?auto_20337 ?auto_20344 ) ) ( not ( = ?auto_20338 ?auto_20344 ) ) ( not ( = ?auto_20339 ?auto_20343 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20341 ?auto_20340 ?auto_20342 )
      ( !LIFT ?auto_20343 ?auto_20338 ?auto_20344 ?auto_20342 )
      ( !LOAD ?auto_20343 ?auto_20338 ?auto_20341 ?auto_20342 )
      ( !DRIVE ?auto_20341 ?auto_20342 ?auto_20340 )
      ( !UNLOAD ?auto_20339 ?auto_20338 ?auto_20341 ?auto_20340 )
      ( !DROP ?auto_20339 ?auto_20338 ?auto_20337 ?auto_20340 )
      ( MAKE-1CRATE-VERIFY ?auto_20337 ?auto_20338 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_20359 - SURFACE
      ?auto_20360 - SURFACE
      ?auto_20361 - SURFACE
      ?auto_20362 - SURFACE
      ?auto_20363 - SURFACE
      ?auto_20364 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20366 - SURFACE
      ?auto_20365 - SURFACE
      ?auto_20368 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20369 - SURFACE
      ?auto_20371 - SURFACE
      ?auto_20372 - SURFACE
    )
    :vars
    (
      ?auto_20378 - HOIST
      ?auto_20375 - PLACE
      ?auto_20376 - PLACE
      ?auto_20373 - HOIST
      ?auto_20377 - SURFACE
      ?auto_20383 - PLACE
      ?auto_20399 - HOIST
      ?auto_20397 - SURFACE
      ?auto_20388 - PLACE
      ?auto_20392 - HOIST
      ?auto_20384 - SURFACE
      ?auto_20387 - PLACE
      ?auto_20396 - HOIST
      ?auto_20385 - SURFACE
      ?auto_20393 - SURFACE
      ?auto_20395 - SURFACE
      ?auto_20398 - PLACE
      ?auto_20390 - HOIST
      ?auto_20379 - SURFACE
      ?auto_20401 - PLACE
      ?auto_20386 - HOIST
      ?auto_20403 - SURFACE
      ?auto_20391 - SURFACE
      ?auto_20402 - PLACE
      ?auto_20394 - HOIST
      ?auto_20381 - SURFACE
      ?auto_20404 - PLACE
      ?auto_20382 - HOIST
      ?auto_20380 - SURFACE
      ?auto_20389 - SURFACE
      ?auto_20400 - SURFACE
      ?auto_20374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20378 ?auto_20375 ) ( IS-CRATE ?auto_20372 ) ( not ( = ?auto_20376 ?auto_20375 ) ) ( HOIST-AT ?auto_20373 ?auto_20376 ) ( SURFACE-AT ?auto_20372 ?auto_20376 ) ( ON ?auto_20372 ?auto_20377 ) ( CLEAR ?auto_20372 ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20377 ) ) ( not ( = ?auto_20378 ?auto_20373 ) ) ( IS-CRATE ?auto_20371 ) ( not ( = ?auto_20383 ?auto_20375 ) ) ( HOIST-AT ?auto_20399 ?auto_20383 ) ( AVAILABLE ?auto_20399 ) ( SURFACE-AT ?auto_20371 ?auto_20383 ) ( ON ?auto_20371 ?auto_20397 ) ( CLEAR ?auto_20371 ) ( not ( = ?auto_20369 ?auto_20371 ) ) ( not ( = ?auto_20369 ?auto_20397 ) ) ( not ( = ?auto_20371 ?auto_20397 ) ) ( not ( = ?auto_20378 ?auto_20399 ) ) ( IS-CRATE ?auto_20369 ) ( not ( = ?auto_20388 ?auto_20375 ) ) ( HOIST-AT ?auto_20392 ?auto_20388 ) ( SURFACE-AT ?auto_20369 ?auto_20388 ) ( ON ?auto_20369 ?auto_20384 ) ( CLEAR ?auto_20369 ) ( not ( = ?auto_20370 ?auto_20369 ) ) ( not ( = ?auto_20370 ?auto_20384 ) ) ( not ( = ?auto_20369 ?auto_20384 ) ) ( not ( = ?auto_20378 ?auto_20392 ) ) ( IS-CRATE ?auto_20370 ) ( not ( = ?auto_20387 ?auto_20375 ) ) ( HOIST-AT ?auto_20396 ?auto_20387 ) ( AVAILABLE ?auto_20396 ) ( SURFACE-AT ?auto_20370 ?auto_20387 ) ( ON ?auto_20370 ?auto_20385 ) ( CLEAR ?auto_20370 ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20385 ) ) ( not ( = ?auto_20370 ?auto_20385 ) ) ( not ( = ?auto_20378 ?auto_20396 ) ) ( IS-CRATE ?auto_20368 ) ( SURFACE-AT ?auto_20368 ?auto_20376 ) ( ON ?auto_20368 ?auto_20393 ) ( CLEAR ?auto_20368 ) ( not ( = ?auto_20365 ?auto_20368 ) ) ( not ( = ?auto_20365 ?auto_20393 ) ) ( not ( = ?auto_20368 ?auto_20393 ) ) ( IS-CRATE ?auto_20365 ) ( AVAILABLE ?auto_20392 ) ( SURFACE-AT ?auto_20365 ?auto_20388 ) ( ON ?auto_20365 ?auto_20395 ) ( CLEAR ?auto_20365 ) ( not ( = ?auto_20366 ?auto_20365 ) ) ( not ( = ?auto_20366 ?auto_20395 ) ) ( not ( = ?auto_20365 ?auto_20395 ) ) ( IS-CRATE ?auto_20366 ) ( not ( = ?auto_20398 ?auto_20375 ) ) ( HOIST-AT ?auto_20390 ?auto_20398 ) ( AVAILABLE ?auto_20390 ) ( SURFACE-AT ?auto_20366 ?auto_20398 ) ( ON ?auto_20366 ?auto_20379 ) ( CLEAR ?auto_20366 ) ( not ( = ?auto_20367 ?auto_20366 ) ) ( not ( = ?auto_20367 ?auto_20379 ) ) ( not ( = ?auto_20366 ?auto_20379 ) ) ( not ( = ?auto_20378 ?auto_20390 ) ) ( IS-CRATE ?auto_20367 ) ( not ( = ?auto_20401 ?auto_20375 ) ) ( HOIST-AT ?auto_20386 ?auto_20401 ) ( AVAILABLE ?auto_20386 ) ( SURFACE-AT ?auto_20367 ?auto_20401 ) ( ON ?auto_20367 ?auto_20403 ) ( CLEAR ?auto_20367 ) ( not ( = ?auto_20364 ?auto_20367 ) ) ( not ( = ?auto_20364 ?auto_20403 ) ) ( not ( = ?auto_20367 ?auto_20403 ) ) ( not ( = ?auto_20378 ?auto_20386 ) ) ( IS-CRATE ?auto_20364 ) ( AVAILABLE ?auto_20373 ) ( SURFACE-AT ?auto_20364 ?auto_20376 ) ( ON ?auto_20364 ?auto_20391 ) ( CLEAR ?auto_20364 ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( not ( = ?auto_20363 ?auto_20391 ) ) ( not ( = ?auto_20364 ?auto_20391 ) ) ( IS-CRATE ?auto_20363 ) ( not ( = ?auto_20402 ?auto_20375 ) ) ( HOIST-AT ?auto_20394 ?auto_20402 ) ( AVAILABLE ?auto_20394 ) ( SURFACE-AT ?auto_20363 ?auto_20402 ) ( ON ?auto_20363 ?auto_20381 ) ( CLEAR ?auto_20363 ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( not ( = ?auto_20362 ?auto_20381 ) ) ( not ( = ?auto_20363 ?auto_20381 ) ) ( not ( = ?auto_20378 ?auto_20394 ) ) ( IS-CRATE ?auto_20362 ) ( not ( = ?auto_20404 ?auto_20375 ) ) ( HOIST-AT ?auto_20382 ?auto_20404 ) ( SURFACE-AT ?auto_20362 ?auto_20404 ) ( ON ?auto_20362 ?auto_20380 ) ( CLEAR ?auto_20362 ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( not ( = ?auto_20361 ?auto_20380 ) ) ( not ( = ?auto_20362 ?auto_20380 ) ) ( not ( = ?auto_20378 ?auto_20382 ) ) ( IS-CRATE ?auto_20361 ) ( SURFACE-AT ?auto_20361 ?auto_20404 ) ( ON ?auto_20361 ?auto_20389 ) ( CLEAR ?auto_20361 ) ( not ( = ?auto_20360 ?auto_20361 ) ) ( not ( = ?auto_20360 ?auto_20389 ) ) ( not ( = ?auto_20361 ?auto_20389 ) ) ( SURFACE-AT ?auto_20359 ?auto_20375 ) ( CLEAR ?auto_20359 ) ( IS-CRATE ?auto_20360 ) ( AVAILABLE ?auto_20378 ) ( AVAILABLE ?auto_20382 ) ( SURFACE-AT ?auto_20360 ?auto_20404 ) ( ON ?auto_20360 ?auto_20400 ) ( CLEAR ?auto_20360 ) ( TRUCK-AT ?auto_20374 ?auto_20375 ) ( not ( = ?auto_20359 ?auto_20360 ) ) ( not ( = ?auto_20359 ?auto_20400 ) ) ( not ( = ?auto_20360 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20361 ) ) ( not ( = ?auto_20359 ?auto_20389 ) ) ( not ( = ?auto_20361 ?auto_20400 ) ) ( not ( = ?auto_20389 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20362 ) ) ( not ( = ?auto_20359 ?auto_20380 ) ) ( not ( = ?auto_20360 ?auto_20362 ) ) ( not ( = ?auto_20360 ?auto_20380 ) ) ( not ( = ?auto_20362 ?auto_20389 ) ) ( not ( = ?auto_20362 ?auto_20400 ) ) ( not ( = ?auto_20380 ?auto_20389 ) ) ( not ( = ?auto_20380 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20363 ) ) ( not ( = ?auto_20359 ?auto_20381 ) ) ( not ( = ?auto_20360 ?auto_20363 ) ) ( not ( = ?auto_20360 ?auto_20381 ) ) ( not ( = ?auto_20361 ?auto_20363 ) ) ( not ( = ?auto_20361 ?auto_20381 ) ) ( not ( = ?auto_20363 ?auto_20380 ) ) ( not ( = ?auto_20363 ?auto_20389 ) ) ( not ( = ?auto_20363 ?auto_20400 ) ) ( not ( = ?auto_20402 ?auto_20404 ) ) ( not ( = ?auto_20394 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20380 ) ) ( not ( = ?auto_20381 ?auto_20389 ) ) ( not ( = ?auto_20381 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20364 ) ) ( not ( = ?auto_20359 ?auto_20391 ) ) ( not ( = ?auto_20360 ?auto_20364 ) ) ( not ( = ?auto_20360 ?auto_20391 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20391 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20362 ?auto_20391 ) ) ( not ( = ?auto_20364 ?auto_20381 ) ) ( not ( = ?auto_20364 ?auto_20380 ) ) ( not ( = ?auto_20364 ?auto_20389 ) ) ( not ( = ?auto_20364 ?auto_20400 ) ) ( not ( = ?auto_20376 ?auto_20402 ) ) ( not ( = ?auto_20376 ?auto_20404 ) ) ( not ( = ?auto_20373 ?auto_20394 ) ) ( not ( = ?auto_20373 ?auto_20382 ) ) ( not ( = ?auto_20391 ?auto_20381 ) ) ( not ( = ?auto_20391 ?auto_20380 ) ) ( not ( = ?auto_20391 ?auto_20389 ) ) ( not ( = ?auto_20391 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20367 ) ) ( not ( = ?auto_20359 ?auto_20403 ) ) ( not ( = ?auto_20360 ?auto_20367 ) ) ( not ( = ?auto_20360 ?auto_20403 ) ) ( not ( = ?auto_20361 ?auto_20367 ) ) ( not ( = ?auto_20361 ?auto_20403 ) ) ( not ( = ?auto_20362 ?auto_20367 ) ) ( not ( = ?auto_20362 ?auto_20403 ) ) ( not ( = ?auto_20363 ?auto_20367 ) ) ( not ( = ?auto_20363 ?auto_20403 ) ) ( not ( = ?auto_20367 ?auto_20391 ) ) ( not ( = ?auto_20367 ?auto_20381 ) ) ( not ( = ?auto_20367 ?auto_20380 ) ) ( not ( = ?auto_20367 ?auto_20389 ) ) ( not ( = ?auto_20367 ?auto_20400 ) ) ( not ( = ?auto_20401 ?auto_20376 ) ) ( not ( = ?auto_20401 ?auto_20402 ) ) ( not ( = ?auto_20401 ?auto_20404 ) ) ( not ( = ?auto_20386 ?auto_20373 ) ) ( not ( = ?auto_20386 ?auto_20394 ) ) ( not ( = ?auto_20386 ?auto_20382 ) ) ( not ( = ?auto_20403 ?auto_20391 ) ) ( not ( = ?auto_20403 ?auto_20381 ) ) ( not ( = ?auto_20403 ?auto_20380 ) ) ( not ( = ?auto_20403 ?auto_20389 ) ) ( not ( = ?auto_20403 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20366 ) ) ( not ( = ?auto_20359 ?auto_20379 ) ) ( not ( = ?auto_20360 ?auto_20366 ) ) ( not ( = ?auto_20360 ?auto_20379 ) ) ( not ( = ?auto_20361 ?auto_20366 ) ) ( not ( = ?auto_20361 ?auto_20379 ) ) ( not ( = ?auto_20362 ?auto_20366 ) ) ( not ( = ?auto_20362 ?auto_20379 ) ) ( not ( = ?auto_20363 ?auto_20366 ) ) ( not ( = ?auto_20363 ?auto_20379 ) ) ( not ( = ?auto_20364 ?auto_20366 ) ) ( not ( = ?auto_20364 ?auto_20379 ) ) ( not ( = ?auto_20366 ?auto_20403 ) ) ( not ( = ?auto_20366 ?auto_20391 ) ) ( not ( = ?auto_20366 ?auto_20381 ) ) ( not ( = ?auto_20366 ?auto_20380 ) ) ( not ( = ?auto_20366 ?auto_20389 ) ) ( not ( = ?auto_20366 ?auto_20400 ) ) ( not ( = ?auto_20398 ?auto_20401 ) ) ( not ( = ?auto_20398 ?auto_20376 ) ) ( not ( = ?auto_20398 ?auto_20402 ) ) ( not ( = ?auto_20398 ?auto_20404 ) ) ( not ( = ?auto_20390 ?auto_20386 ) ) ( not ( = ?auto_20390 ?auto_20373 ) ) ( not ( = ?auto_20390 ?auto_20394 ) ) ( not ( = ?auto_20390 ?auto_20382 ) ) ( not ( = ?auto_20379 ?auto_20403 ) ) ( not ( = ?auto_20379 ?auto_20391 ) ) ( not ( = ?auto_20379 ?auto_20381 ) ) ( not ( = ?auto_20379 ?auto_20380 ) ) ( not ( = ?auto_20379 ?auto_20389 ) ) ( not ( = ?auto_20379 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20365 ) ) ( not ( = ?auto_20359 ?auto_20395 ) ) ( not ( = ?auto_20360 ?auto_20365 ) ) ( not ( = ?auto_20360 ?auto_20395 ) ) ( not ( = ?auto_20361 ?auto_20365 ) ) ( not ( = ?auto_20361 ?auto_20395 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20395 ) ) ( not ( = ?auto_20363 ?auto_20365 ) ) ( not ( = ?auto_20363 ?auto_20395 ) ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20395 ) ) ( not ( = ?auto_20367 ?auto_20365 ) ) ( not ( = ?auto_20367 ?auto_20395 ) ) ( not ( = ?auto_20365 ?auto_20379 ) ) ( not ( = ?auto_20365 ?auto_20403 ) ) ( not ( = ?auto_20365 ?auto_20391 ) ) ( not ( = ?auto_20365 ?auto_20381 ) ) ( not ( = ?auto_20365 ?auto_20380 ) ) ( not ( = ?auto_20365 ?auto_20389 ) ) ( not ( = ?auto_20365 ?auto_20400 ) ) ( not ( = ?auto_20388 ?auto_20398 ) ) ( not ( = ?auto_20388 ?auto_20401 ) ) ( not ( = ?auto_20388 ?auto_20376 ) ) ( not ( = ?auto_20388 ?auto_20402 ) ) ( not ( = ?auto_20388 ?auto_20404 ) ) ( not ( = ?auto_20392 ?auto_20390 ) ) ( not ( = ?auto_20392 ?auto_20386 ) ) ( not ( = ?auto_20392 ?auto_20373 ) ) ( not ( = ?auto_20392 ?auto_20394 ) ) ( not ( = ?auto_20392 ?auto_20382 ) ) ( not ( = ?auto_20395 ?auto_20379 ) ) ( not ( = ?auto_20395 ?auto_20403 ) ) ( not ( = ?auto_20395 ?auto_20391 ) ) ( not ( = ?auto_20395 ?auto_20381 ) ) ( not ( = ?auto_20395 ?auto_20380 ) ) ( not ( = ?auto_20395 ?auto_20389 ) ) ( not ( = ?auto_20395 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20368 ) ) ( not ( = ?auto_20359 ?auto_20393 ) ) ( not ( = ?auto_20360 ?auto_20368 ) ) ( not ( = ?auto_20360 ?auto_20393 ) ) ( not ( = ?auto_20361 ?auto_20368 ) ) ( not ( = ?auto_20361 ?auto_20393 ) ) ( not ( = ?auto_20362 ?auto_20368 ) ) ( not ( = ?auto_20362 ?auto_20393 ) ) ( not ( = ?auto_20363 ?auto_20368 ) ) ( not ( = ?auto_20363 ?auto_20393 ) ) ( not ( = ?auto_20364 ?auto_20368 ) ) ( not ( = ?auto_20364 ?auto_20393 ) ) ( not ( = ?auto_20367 ?auto_20368 ) ) ( not ( = ?auto_20367 ?auto_20393 ) ) ( not ( = ?auto_20366 ?auto_20368 ) ) ( not ( = ?auto_20366 ?auto_20393 ) ) ( not ( = ?auto_20368 ?auto_20395 ) ) ( not ( = ?auto_20368 ?auto_20379 ) ) ( not ( = ?auto_20368 ?auto_20403 ) ) ( not ( = ?auto_20368 ?auto_20391 ) ) ( not ( = ?auto_20368 ?auto_20381 ) ) ( not ( = ?auto_20368 ?auto_20380 ) ) ( not ( = ?auto_20368 ?auto_20389 ) ) ( not ( = ?auto_20368 ?auto_20400 ) ) ( not ( = ?auto_20393 ?auto_20395 ) ) ( not ( = ?auto_20393 ?auto_20379 ) ) ( not ( = ?auto_20393 ?auto_20403 ) ) ( not ( = ?auto_20393 ?auto_20391 ) ) ( not ( = ?auto_20393 ?auto_20381 ) ) ( not ( = ?auto_20393 ?auto_20380 ) ) ( not ( = ?auto_20393 ?auto_20389 ) ) ( not ( = ?auto_20393 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20370 ) ) ( not ( = ?auto_20359 ?auto_20385 ) ) ( not ( = ?auto_20360 ?auto_20370 ) ) ( not ( = ?auto_20360 ?auto_20385 ) ) ( not ( = ?auto_20361 ?auto_20370 ) ) ( not ( = ?auto_20361 ?auto_20385 ) ) ( not ( = ?auto_20362 ?auto_20370 ) ) ( not ( = ?auto_20362 ?auto_20385 ) ) ( not ( = ?auto_20363 ?auto_20370 ) ) ( not ( = ?auto_20363 ?auto_20385 ) ) ( not ( = ?auto_20364 ?auto_20370 ) ) ( not ( = ?auto_20364 ?auto_20385 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20385 ) ) ( not ( = ?auto_20366 ?auto_20370 ) ) ( not ( = ?auto_20366 ?auto_20385 ) ) ( not ( = ?auto_20365 ?auto_20370 ) ) ( not ( = ?auto_20365 ?auto_20385 ) ) ( not ( = ?auto_20370 ?auto_20393 ) ) ( not ( = ?auto_20370 ?auto_20395 ) ) ( not ( = ?auto_20370 ?auto_20379 ) ) ( not ( = ?auto_20370 ?auto_20403 ) ) ( not ( = ?auto_20370 ?auto_20391 ) ) ( not ( = ?auto_20370 ?auto_20381 ) ) ( not ( = ?auto_20370 ?auto_20380 ) ) ( not ( = ?auto_20370 ?auto_20389 ) ) ( not ( = ?auto_20370 ?auto_20400 ) ) ( not ( = ?auto_20387 ?auto_20376 ) ) ( not ( = ?auto_20387 ?auto_20388 ) ) ( not ( = ?auto_20387 ?auto_20398 ) ) ( not ( = ?auto_20387 ?auto_20401 ) ) ( not ( = ?auto_20387 ?auto_20402 ) ) ( not ( = ?auto_20387 ?auto_20404 ) ) ( not ( = ?auto_20396 ?auto_20373 ) ) ( not ( = ?auto_20396 ?auto_20392 ) ) ( not ( = ?auto_20396 ?auto_20390 ) ) ( not ( = ?auto_20396 ?auto_20386 ) ) ( not ( = ?auto_20396 ?auto_20394 ) ) ( not ( = ?auto_20396 ?auto_20382 ) ) ( not ( = ?auto_20385 ?auto_20393 ) ) ( not ( = ?auto_20385 ?auto_20395 ) ) ( not ( = ?auto_20385 ?auto_20379 ) ) ( not ( = ?auto_20385 ?auto_20403 ) ) ( not ( = ?auto_20385 ?auto_20391 ) ) ( not ( = ?auto_20385 ?auto_20381 ) ) ( not ( = ?auto_20385 ?auto_20380 ) ) ( not ( = ?auto_20385 ?auto_20389 ) ) ( not ( = ?auto_20385 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20369 ) ) ( not ( = ?auto_20359 ?auto_20384 ) ) ( not ( = ?auto_20360 ?auto_20369 ) ) ( not ( = ?auto_20360 ?auto_20384 ) ) ( not ( = ?auto_20361 ?auto_20369 ) ) ( not ( = ?auto_20361 ?auto_20384 ) ) ( not ( = ?auto_20362 ?auto_20369 ) ) ( not ( = ?auto_20362 ?auto_20384 ) ) ( not ( = ?auto_20363 ?auto_20369 ) ) ( not ( = ?auto_20363 ?auto_20384 ) ) ( not ( = ?auto_20364 ?auto_20369 ) ) ( not ( = ?auto_20364 ?auto_20384 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20384 ) ) ( not ( = ?auto_20366 ?auto_20369 ) ) ( not ( = ?auto_20366 ?auto_20384 ) ) ( not ( = ?auto_20365 ?auto_20369 ) ) ( not ( = ?auto_20365 ?auto_20384 ) ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20384 ) ) ( not ( = ?auto_20369 ?auto_20385 ) ) ( not ( = ?auto_20369 ?auto_20393 ) ) ( not ( = ?auto_20369 ?auto_20395 ) ) ( not ( = ?auto_20369 ?auto_20379 ) ) ( not ( = ?auto_20369 ?auto_20403 ) ) ( not ( = ?auto_20369 ?auto_20391 ) ) ( not ( = ?auto_20369 ?auto_20381 ) ) ( not ( = ?auto_20369 ?auto_20380 ) ) ( not ( = ?auto_20369 ?auto_20389 ) ) ( not ( = ?auto_20369 ?auto_20400 ) ) ( not ( = ?auto_20384 ?auto_20385 ) ) ( not ( = ?auto_20384 ?auto_20393 ) ) ( not ( = ?auto_20384 ?auto_20395 ) ) ( not ( = ?auto_20384 ?auto_20379 ) ) ( not ( = ?auto_20384 ?auto_20403 ) ) ( not ( = ?auto_20384 ?auto_20391 ) ) ( not ( = ?auto_20384 ?auto_20381 ) ) ( not ( = ?auto_20384 ?auto_20380 ) ) ( not ( = ?auto_20384 ?auto_20389 ) ) ( not ( = ?auto_20384 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20371 ) ) ( not ( = ?auto_20359 ?auto_20397 ) ) ( not ( = ?auto_20360 ?auto_20371 ) ) ( not ( = ?auto_20360 ?auto_20397 ) ) ( not ( = ?auto_20361 ?auto_20371 ) ) ( not ( = ?auto_20361 ?auto_20397 ) ) ( not ( = ?auto_20362 ?auto_20371 ) ) ( not ( = ?auto_20362 ?auto_20397 ) ) ( not ( = ?auto_20363 ?auto_20371 ) ) ( not ( = ?auto_20363 ?auto_20397 ) ) ( not ( = ?auto_20364 ?auto_20371 ) ) ( not ( = ?auto_20364 ?auto_20397 ) ) ( not ( = ?auto_20367 ?auto_20371 ) ) ( not ( = ?auto_20367 ?auto_20397 ) ) ( not ( = ?auto_20366 ?auto_20371 ) ) ( not ( = ?auto_20366 ?auto_20397 ) ) ( not ( = ?auto_20365 ?auto_20371 ) ) ( not ( = ?auto_20365 ?auto_20397 ) ) ( not ( = ?auto_20368 ?auto_20371 ) ) ( not ( = ?auto_20368 ?auto_20397 ) ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20397 ) ) ( not ( = ?auto_20371 ?auto_20384 ) ) ( not ( = ?auto_20371 ?auto_20385 ) ) ( not ( = ?auto_20371 ?auto_20393 ) ) ( not ( = ?auto_20371 ?auto_20395 ) ) ( not ( = ?auto_20371 ?auto_20379 ) ) ( not ( = ?auto_20371 ?auto_20403 ) ) ( not ( = ?auto_20371 ?auto_20391 ) ) ( not ( = ?auto_20371 ?auto_20381 ) ) ( not ( = ?auto_20371 ?auto_20380 ) ) ( not ( = ?auto_20371 ?auto_20389 ) ) ( not ( = ?auto_20371 ?auto_20400 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20376 ) ) ( not ( = ?auto_20383 ?auto_20398 ) ) ( not ( = ?auto_20383 ?auto_20401 ) ) ( not ( = ?auto_20383 ?auto_20402 ) ) ( not ( = ?auto_20383 ?auto_20404 ) ) ( not ( = ?auto_20399 ?auto_20392 ) ) ( not ( = ?auto_20399 ?auto_20396 ) ) ( not ( = ?auto_20399 ?auto_20373 ) ) ( not ( = ?auto_20399 ?auto_20390 ) ) ( not ( = ?auto_20399 ?auto_20386 ) ) ( not ( = ?auto_20399 ?auto_20394 ) ) ( not ( = ?auto_20399 ?auto_20382 ) ) ( not ( = ?auto_20397 ?auto_20384 ) ) ( not ( = ?auto_20397 ?auto_20385 ) ) ( not ( = ?auto_20397 ?auto_20393 ) ) ( not ( = ?auto_20397 ?auto_20395 ) ) ( not ( = ?auto_20397 ?auto_20379 ) ) ( not ( = ?auto_20397 ?auto_20403 ) ) ( not ( = ?auto_20397 ?auto_20391 ) ) ( not ( = ?auto_20397 ?auto_20381 ) ) ( not ( = ?auto_20397 ?auto_20380 ) ) ( not ( = ?auto_20397 ?auto_20389 ) ) ( not ( = ?auto_20397 ?auto_20400 ) ) ( not ( = ?auto_20359 ?auto_20372 ) ) ( not ( = ?auto_20359 ?auto_20377 ) ) ( not ( = ?auto_20360 ?auto_20372 ) ) ( not ( = ?auto_20360 ?auto_20377 ) ) ( not ( = ?auto_20361 ?auto_20372 ) ) ( not ( = ?auto_20361 ?auto_20377 ) ) ( not ( = ?auto_20362 ?auto_20372 ) ) ( not ( = ?auto_20362 ?auto_20377 ) ) ( not ( = ?auto_20363 ?auto_20372 ) ) ( not ( = ?auto_20363 ?auto_20377 ) ) ( not ( = ?auto_20364 ?auto_20372 ) ) ( not ( = ?auto_20364 ?auto_20377 ) ) ( not ( = ?auto_20367 ?auto_20372 ) ) ( not ( = ?auto_20367 ?auto_20377 ) ) ( not ( = ?auto_20366 ?auto_20372 ) ) ( not ( = ?auto_20366 ?auto_20377 ) ) ( not ( = ?auto_20365 ?auto_20372 ) ) ( not ( = ?auto_20365 ?auto_20377 ) ) ( not ( = ?auto_20368 ?auto_20372 ) ) ( not ( = ?auto_20368 ?auto_20377 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20370 ?auto_20377 ) ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( not ( = ?auto_20369 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20397 ) ) ( not ( = ?auto_20372 ?auto_20384 ) ) ( not ( = ?auto_20372 ?auto_20385 ) ) ( not ( = ?auto_20372 ?auto_20393 ) ) ( not ( = ?auto_20372 ?auto_20395 ) ) ( not ( = ?auto_20372 ?auto_20379 ) ) ( not ( = ?auto_20372 ?auto_20403 ) ) ( not ( = ?auto_20372 ?auto_20391 ) ) ( not ( = ?auto_20372 ?auto_20381 ) ) ( not ( = ?auto_20372 ?auto_20380 ) ) ( not ( = ?auto_20372 ?auto_20389 ) ) ( not ( = ?auto_20372 ?auto_20400 ) ) ( not ( = ?auto_20377 ?auto_20397 ) ) ( not ( = ?auto_20377 ?auto_20384 ) ) ( not ( = ?auto_20377 ?auto_20385 ) ) ( not ( = ?auto_20377 ?auto_20393 ) ) ( not ( = ?auto_20377 ?auto_20395 ) ) ( not ( = ?auto_20377 ?auto_20379 ) ) ( not ( = ?auto_20377 ?auto_20403 ) ) ( not ( = ?auto_20377 ?auto_20391 ) ) ( not ( = ?auto_20377 ?auto_20381 ) ) ( not ( = ?auto_20377 ?auto_20380 ) ) ( not ( = ?auto_20377 ?auto_20389 ) ) ( not ( = ?auto_20377 ?auto_20400 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20359 ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20367 ?auto_20366 ?auto_20365 ?auto_20368 ?auto_20370 ?auto_20369 ?auto_20371 )
      ( MAKE-1CRATE ?auto_20371 ?auto_20372 )
      ( MAKE-13CRATE-VERIFY ?auto_20359 ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20367 ?auto_20366 ?auto_20365 ?auto_20368 ?auto_20370 ?auto_20369 ?auto_20371 ?auto_20372 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20407 - SURFACE
      ?auto_20408 - SURFACE
    )
    :vars
    (
      ?auto_20409 - HOIST
      ?auto_20410 - PLACE
      ?auto_20412 - PLACE
      ?auto_20413 - HOIST
      ?auto_20414 - SURFACE
      ?auto_20411 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20409 ?auto_20410 ) ( SURFACE-AT ?auto_20407 ?auto_20410 ) ( CLEAR ?auto_20407 ) ( IS-CRATE ?auto_20408 ) ( AVAILABLE ?auto_20409 ) ( not ( = ?auto_20412 ?auto_20410 ) ) ( HOIST-AT ?auto_20413 ?auto_20412 ) ( AVAILABLE ?auto_20413 ) ( SURFACE-AT ?auto_20408 ?auto_20412 ) ( ON ?auto_20408 ?auto_20414 ) ( CLEAR ?auto_20408 ) ( TRUCK-AT ?auto_20411 ?auto_20410 ) ( not ( = ?auto_20407 ?auto_20408 ) ) ( not ( = ?auto_20407 ?auto_20414 ) ) ( not ( = ?auto_20408 ?auto_20414 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20411 ?auto_20410 ?auto_20412 )
      ( !LIFT ?auto_20413 ?auto_20408 ?auto_20414 ?auto_20412 )
      ( !LOAD ?auto_20413 ?auto_20408 ?auto_20411 ?auto_20412 )
      ( !DRIVE ?auto_20411 ?auto_20412 ?auto_20410 )
      ( !UNLOAD ?auto_20409 ?auto_20408 ?auto_20411 ?auto_20410 )
      ( !DROP ?auto_20409 ?auto_20408 ?auto_20407 ?auto_20410 )
      ( MAKE-1CRATE-VERIFY ?auto_20407 ?auto_20408 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_20430 - SURFACE
      ?auto_20431 - SURFACE
      ?auto_20432 - SURFACE
      ?auto_20433 - SURFACE
      ?auto_20434 - SURFACE
      ?auto_20435 - SURFACE
      ?auto_20438 - SURFACE
      ?auto_20437 - SURFACE
      ?auto_20436 - SURFACE
      ?auto_20439 - SURFACE
      ?auto_20441 - SURFACE
      ?auto_20440 - SURFACE
      ?auto_20442 - SURFACE
      ?auto_20444 - SURFACE
      ?auto_20443 - SURFACE
    )
    :vars
    (
      ?auto_20450 - HOIST
      ?auto_20449 - PLACE
      ?auto_20445 - PLACE
      ?auto_20446 - HOIST
      ?auto_20448 - SURFACE
      ?auto_20467 - PLACE
      ?auto_20471 - HOIST
      ?auto_20474 - SURFACE
      ?auto_20479 - PLACE
      ?auto_20470 - HOIST
      ?auto_20456 - SURFACE
      ?auto_20475 - PLACE
      ?auto_20462 - HOIST
      ?auto_20473 - SURFACE
      ?auto_20468 - PLACE
      ?auto_20454 - HOIST
      ?auto_20465 - SURFACE
      ?auto_20458 - SURFACE
      ?auto_20459 - SURFACE
      ?auto_20455 - PLACE
      ?auto_20463 - HOIST
      ?auto_20453 - SURFACE
      ?auto_20472 - PLACE
      ?auto_20451 - HOIST
      ?auto_20469 - SURFACE
      ?auto_20461 - SURFACE
      ?auto_20476 - PLACE
      ?auto_20460 - HOIST
      ?auto_20452 - SURFACE
      ?auto_20466 - PLACE
      ?auto_20477 - HOIST
      ?auto_20478 - SURFACE
      ?auto_20457 - SURFACE
      ?auto_20464 - SURFACE
      ?auto_20447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20450 ?auto_20449 ) ( IS-CRATE ?auto_20443 ) ( not ( = ?auto_20445 ?auto_20449 ) ) ( HOIST-AT ?auto_20446 ?auto_20445 ) ( AVAILABLE ?auto_20446 ) ( SURFACE-AT ?auto_20443 ?auto_20445 ) ( ON ?auto_20443 ?auto_20448 ) ( CLEAR ?auto_20443 ) ( not ( = ?auto_20444 ?auto_20443 ) ) ( not ( = ?auto_20444 ?auto_20448 ) ) ( not ( = ?auto_20443 ?auto_20448 ) ) ( not ( = ?auto_20450 ?auto_20446 ) ) ( IS-CRATE ?auto_20444 ) ( not ( = ?auto_20467 ?auto_20449 ) ) ( HOIST-AT ?auto_20471 ?auto_20467 ) ( SURFACE-AT ?auto_20444 ?auto_20467 ) ( ON ?auto_20444 ?auto_20474 ) ( CLEAR ?auto_20444 ) ( not ( = ?auto_20442 ?auto_20444 ) ) ( not ( = ?auto_20442 ?auto_20474 ) ) ( not ( = ?auto_20444 ?auto_20474 ) ) ( not ( = ?auto_20450 ?auto_20471 ) ) ( IS-CRATE ?auto_20442 ) ( not ( = ?auto_20479 ?auto_20449 ) ) ( HOIST-AT ?auto_20470 ?auto_20479 ) ( AVAILABLE ?auto_20470 ) ( SURFACE-AT ?auto_20442 ?auto_20479 ) ( ON ?auto_20442 ?auto_20456 ) ( CLEAR ?auto_20442 ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20456 ) ) ( not ( = ?auto_20442 ?auto_20456 ) ) ( not ( = ?auto_20450 ?auto_20470 ) ) ( IS-CRATE ?auto_20440 ) ( not ( = ?auto_20475 ?auto_20449 ) ) ( HOIST-AT ?auto_20462 ?auto_20475 ) ( SURFACE-AT ?auto_20440 ?auto_20475 ) ( ON ?auto_20440 ?auto_20473 ) ( CLEAR ?auto_20440 ) ( not ( = ?auto_20441 ?auto_20440 ) ) ( not ( = ?auto_20441 ?auto_20473 ) ) ( not ( = ?auto_20440 ?auto_20473 ) ) ( not ( = ?auto_20450 ?auto_20462 ) ) ( IS-CRATE ?auto_20441 ) ( not ( = ?auto_20468 ?auto_20449 ) ) ( HOIST-AT ?auto_20454 ?auto_20468 ) ( AVAILABLE ?auto_20454 ) ( SURFACE-AT ?auto_20441 ?auto_20468 ) ( ON ?auto_20441 ?auto_20465 ) ( CLEAR ?auto_20441 ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20465 ) ) ( not ( = ?auto_20441 ?auto_20465 ) ) ( not ( = ?auto_20450 ?auto_20454 ) ) ( IS-CRATE ?auto_20439 ) ( SURFACE-AT ?auto_20439 ?auto_20467 ) ( ON ?auto_20439 ?auto_20458 ) ( CLEAR ?auto_20439 ) ( not ( = ?auto_20436 ?auto_20439 ) ) ( not ( = ?auto_20436 ?auto_20458 ) ) ( not ( = ?auto_20439 ?auto_20458 ) ) ( IS-CRATE ?auto_20436 ) ( AVAILABLE ?auto_20462 ) ( SURFACE-AT ?auto_20436 ?auto_20475 ) ( ON ?auto_20436 ?auto_20459 ) ( CLEAR ?auto_20436 ) ( not ( = ?auto_20437 ?auto_20436 ) ) ( not ( = ?auto_20437 ?auto_20459 ) ) ( not ( = ?auto_20436 ?auto_20459 ) ) ( IS-CRATE ?auto_20437 ) ( not ( = ?auto_20455 ?auto_20449 ) ) ( HOIST-AT ?auto_20463 ?auto_20455 ) ( AVAILABLE ?auto_20463 ) ( SURFACE-AT ?auto_20437 ?auto_20455 ) ( ON ?auto_20437 ?auto_20453 ) ( CLEAR ?auto_20437 ) ( not ( = ?auto_20438 ?auto_20437 ) ) ( not ( = ?auto_20438 ?auto_20453 ) ) ( not ( = ?auto_20437 ?auto_20453 ) ) ( not ( = ?auto_20450 ?auto_20463 ) ) ( IS-CRATE ?auto_20438 ) ( not ( = ?auto_20472 ?auto_20449 ) ) ( HOIST-AT ?auto_20451 ?auto_20472 ) ( AVAILABLE ?auto_20451 ) ( SURFACE-AT ?auto_20438 ?auto_20472 ) ( ON ?auto_20438 ?auto_20469 ) ( CLEAR ?auto_20438 ) ( not ( = ?auto_20435 ?auto_20438 ) ) ( not ( = ?auto_20435 ?auto_20469 ) ) ( not ( = ?auto_20438 ?auto_20469 ) ) ( not ( = ?auto_20450 ?auto_20451 ) ) ( IS-CRATE ?auto_20435 ) ( AVAILABLE ?auto_20471 ) ( SURFACE-AT ?auto_20435 ?auto_20467 ) ( ON ?auto_20435 ?auto_20461 ) ( CLEAR ?auto_20435 ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20461 ) ) ( not ( = ?auto_20435 ?auto_20461 ) ) ( IS-CRATE ?auto_20434 ) ( not ( = ?auto_20476 ?auto_20449 ) ) ( HOIST-AT ?auto_20460 ?auto_20476 ) ( AVAILABLE ?auto_20460 ) ( SURFACE-AT ?auto_20434 ?auto_20476 ) ( ON ?auto_20434 ?auto_20452 ) ( CLEAR ?auto_20434 ) ( not ( = ?auto_20433 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20452 ) ) ( not ( = ?auto_20434 ?auto_20452 ) ) ( not ( = ?auto_20450 ?auto_20460 ) ) ( IS-CRATE ?auto_20433 ) ( not ( = ?auto_20466 ?auto_20449 ) ) ( HOIST-AT ?auto_20477 ?auto_20466 ) ( SURFACE-AT ?auto_20433 ?auto_20466 ) ( ON ?auto_20433 ?auto_20478 ) ( CLEAR ?auto_20433 ) ( not ( = ?auto_20432 ?auto_20433 ) ) ( not ( = ?auto_20432 ?auto_20478 ) ) ( not ( = ?auto_20433 ?auto_20478 ) ) ( not ( = ?auto_20450 ?auto_20477 ) ) ( IS-CRATE ?auto_20432 ) ( SURFACE-AT ?auto_20432 ?auto_20466 ) ( ON ?auto_20432 ?auto_20457 ) ( CLEAR ?auto_20432 ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20457 ) ) ( not ( = ?auto_20432 ?auto_20457 ) ) ( SURFACE-AT ?auto_20430 ?auto_20449 ) ( CLEAR ?auto_20430 ) ( IS-CRATE ?auto_20431 ) ( AVAILABLE ?auto_20450 ) ( AVAILABLE ?auto_20477 ) ( SURFACE-AT ?auto_20431 ?auto_20466 ) ( ON ?auto_20431 ?auto_20464 ) ( CLEAR ?auto_20431 ) ( TRUCK-AT ?auto_20447 ?auto_20449 ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20464 ) ) ( not ( = ?auto_20431 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20457 ) ) ( not ( = ?auto_20432 ?auto_20464 ) ) ( not ( = ?auto_20457 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20433 ) ) ( not ( = ?auto_20430 ?auto_20478 ) ) ( not ( = ?auto_20431 ?auto_20433 ) ) ( not ( = ?auto_20431 ?auto_20478 ) ) ( not ( = ?auto_20433 ?auto_20457 ) ) ( not ( = ?auto_20433 ?auto_20464 ) ) ( not ( = ?auto_20478 ?auto_20457 ) ) ( not ( = ?auto_20478 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20434 ) ) ( not ( = ?auto_20430 ?auto_20452 ) ) ( not ( = ?auto_20431 ?auto_20434 ) ) ( not ( = ?auto_20431 ?auto_20452 ) ) ( not ( = ?auto_20432 ?auto_20434 ) ) ( not ( = ?auto_20432 ?auto_20452 ) ) ( not ( = ?auto_20434 ?auto_20478 ) ) ( not ( = ?auto_20434 ?auto_20457 ) ) ( not ( = ?auto_20434 ?auto_20464 ) ) ( not ( = ?auto_20476 ?auto_20466 ) ) ( not ( = ?auto_20460 ?auto_20477 ) ) ( not ( = ?auto_20452 ?auto_20478 ) ) ( not ( = ?auto_20452 ?auto_20457 ) ) ( not ( = ?auto_20452 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20435 ) ) ( not ( = ?auto_20430 ?auto_20461 ) ) ( not ( = ?auto_20431 ?auto_20435 ) ) ( not ( = ?auto_20431 ?auto_20461 ) ) ( not ( = ?auto_20432 ?auto_20435 ) ) ( not ( = ?auto_20432 ?auto_20461 ) ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( not ( = ?auto_20433 ?auto_20461 ) ) ( not ( = ?auto_20435 ?auto_20452 ) ) ( not ( = ?auto_20435 ?auto_20478 ) ) ( not ( = ?auto_20435 ?auto_20457 ) ) ( not ( = ?auto_20435 ?auto_20464 ) ) ( not ( = ?auto_20467 ?auto_20476 ) ) ( not ( = ?auto_20467 ?auto_20466 ) ) ( not ( = ?auto_20471 ?auto_20460 ) ) ( not ( = ?auto_20471 ?auto_20477 ) ) ( not ( = ?auto_20461 ?auto_20452 ) ) ( not ( = ?auto_20461 ?auto_20478 ) ) ( not ( = ?auto_20461 ?auto_20457 ) ) ( not ( = ?auto_20461 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20438 ) ) ( not ( = ?auto_20430 ?auto_20469 ) ) ( not ( = ?auto_20431 ?auto_20438 ) ) ( not ( = ?auto_20431 ?auto_20469 ) ) ( not ( = ?auto_20432 ?auto_20438 ) ) ( not ( = ?auto_20432 ?auto_20469 ) ) ( not ( = ?auto_20433 ?auto_20438 ) ) ( not ( = ?auto_20433 ?auto_20469 ) ) ( not ( = ?auto_20434 ?auto_20438 ) ) ( not ( = ?auto_20434 ?auto_20469 ) ) ( not ( = ?auto_20438 ?auto_20461 ) ) ( not ( = ?auto_20438 ?auto_20452 ) ) ( not ( = ?auto_20438 ?auto_20478 ) ) ( not ( = ?auto_20438 ?auto_20457 ) ) ( not ( = ?auto_20438 ?auto_20464 ) ) ( not ( = ?auto_20472 ?auto_20467 ) ) ( not ( = ?auto_20472 ?auto_20476 ) ) ( not ( = ?auto_20472 ?auto_20466 ) ) ( not ( = ?auto_20451 ?auto_20471 ) ) ( not ( = ?auto_20451 ?auto_20460 ) ) ( not ( = ?auto_20451 ?auto_20477 ) ) ( not ( = ?auto_20469 ?auto_20461 ) ) ( not ( = ?auto_20469 ?auto_20452 ) ) ( not ( = ?auto_20469 ?auto_20478 ) ) ( not ( = ?auto_20469 ?auto_20457 ) ) ( not ( = ?auto_20469 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20437 ) ) ( not ( = ?auto_20430 ?auto_20453 ) ) ( not ( = ?auto_20431 ?auto_20437 ) ) ( not ( = ?auto_20431 ?auto_20453 ) ) ( not ( = ?auto_20432 ?auto_20437 ) ) ( not ( = ?auto_20432 ?auto_20453 ) ) ( not ( = ?auto_20433 ?auto_20437 ) ) ( not ( = ?auto_20433 ?auto_20453 ) ) ( not ( = ?auto_20434 ?auto_20437 ) ) ( not ( = ?auto_20434 ?auto_20453 ) ) ( not ( = ?auto_20435 ?auto_20437 ) ) ( not ( = ?auto_20435 ?auto_20453 ) ) ( not ( = ?auto_20437 ?auto_20469 ) ) ( not ( = ?auto_20437 ?auto_20461 ) ) ( not ( = ?auto_20437 ?auto_20452 ) ) ( not ( = ?auto_20437 ?auto_20478 ) ) ( not ( = ?auto_20437 ?auto_20457 ) ) ( not ( = ?auto_20437 ?auto_20464 ) ) ( not ( = ?auto_20455 ?auto_20472 ) ) ( not ( = ?auto_20455 ?auto_20467 ) ) ( not ( = ?auto_20455 ?auto_20476 ) ) ( not ( = ?auto_20455 ?auto_20466 ) ) ( not ( = ?auto_20463 ?auto_20451 ) ) ( not ( = ?auto_20463 ?auto_20471 ) ) ( not ( = ?auto_20463 ?auto_20460 ) ) ( not ( = ?auto_20463 ?auto_20477 ) ) ( not ( = ?auto_20453 ?auto_20469 ) ) ( not ( = ?auto_20453 ?auto_20461 ) ) ( not ( = ?auto_20453 ?auto_20452 ) ) ( not ( = ?auto_20453 ?auto_20478 ) ) ( not ( = ?auto_20453 ?auto_20457 ) ) ( not ( = ?auto_20453 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20436 ) ) ( not ( = ?auto_20430 ?auto_20459 ) ) ( not ( = ?auto_20431 ?auto_20436 ) ) ( not ( = ?auto_20431 ?auto_20459 ) ) ( not ( = ?auto_20432 ?auto_20436 ) ) ( not ( = ?auto_20432 ?auto_20459 ) ) ( not ( = ?auto_20433 ?auto_20436 ) ) ( not ( = ?auto_20433 ?auto_20459 ) ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20434 ?auto_20459 ) ) ( not ( = ?auto_20435 ?auto_20436 ) ) ( not ( = ?auto_20435 ?auto_20459 ) ) ( not ( = ?auto_20438 ?auto_20436 ) ) ( not ( = ?auto_20438 ?auto_20459 ) ) ( not ( = ?auto_20436 ?auto_20453 ) ) ( not ( = ?auto_20436 ?auto_20469 ) ) ( not ( = ?auto_20436 ?auto_20461 ) ) ( not ( = ?auto_20436 ?auto_20452 ) ) ( not ( = ?auto_20436 ?auto_20478 ) ) ( not ( = ?auto_20436 ?auto_20457 ) ) ( not ( = ?auto_20436 ?auto_20464 ) ) ( not ( = ?auto_20475 ?auto_20455 ) ) ( not ( = ?auto_20475 ?auto_20472 ) ) ( not ( = ?auto_20475 ?auto_20467 ) ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20466 ) ) ( not ( = ?auto_20462 ?auto_20463 ) ) ( not ( = ?auto_20462 ?auto_20451 ) ) ( not ( = ?auto_20462 ?auto_20471 ) ) ( not ( = ?auto_20462 ?auto_20460 ) ) ( not ( = ?auto_20462 ?auto_20477 ) ) ( not ( = ?auto_20459 ?auto_20453 ) ) ( not ( = ?auto_20459 ?auto_20469 ) ) ( not ( = ?auto_20459 ?auto_20461 ) ) ( not ( = ?auto_20459 ?auto_20452 ) ) ( not ( = ?auto_20459 ?auto_20478 ) ) ( not ( = ?auto_20459 ?auto_20457 ) ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20439 ) ) ( not ( = ?auto_20430 ?auto_20458 ) ) ( not ( = ?auto_20431 ?auto_20439 ) ) ( not ( = ?auto_20431 ?auto_20458 ) ) ( not ( = ?auto_20432 ?auto_20439 ) ) ( not ( = ?auto_20432 ?auto_20458 ) ) ( not ( = ?auto_20433 ?auto_20439 ) ) ( not ( = ?auto_20433 ?auto_20458 ) ) ( not ( = ?auto_20434 ?auto_20439 ) ) ( not ( = ?auto_20434 ?auto_20458 ) ) ( not ( = ?auto_20435 ?auto_20439 ) ) ( not ( = ?auto_20435 ?auto_20458 ) ) ( not ( = ?auto_20438 ?auto_20439 ) ) ( not ( = ?auto_20438 ?auto_20458 ) ) ( not ( = ?auto_20437 ?auto_20439 ) ) ( not ( = ?auto_20437 ?auto_20458 ) ) ( not ( = ?auto_20439 ?auto_20459 ) ) ( not ( = ?auto_20439 ?auto_20453 ) ) ( not ( = ?auto_20439 ?auto_20469 ) ) ( not ( = ?auto_20439 ?auto_20461 ) ) ( not ( = ?auto_20439 ?auto_20452 ) ) ( not ( = ?auto_20439 ?auto_20478 ) ) ( not ( = ?auto_20439 ?auto_20457 ) ) ( not ( = ?auto_20439 ?auto_20464 ) ) ( not ( = ?auto_20458 ?auto_20459 ) ) ( not ( = ?auto_20458 ?auto_20453 ) ) ( not ( = ?auto_20458 ?auto_20469 ) ) ( not ( = ?auto_20458 ?auto_20461 ) ) ( not ( = ?auto_20458 ?auto_20452 ) ) ( not ( = ?auto_20458 ?auto_20478 ) ) ( not ( = ?auto_20458 ?auto_20457 ) ) ( not ( = ?auto_20458 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20441 ) ) ( not ( = ?auto_20430 ?auto_20465 ) ) ( not ( = ?auto_20431 ?auto_20441 ) ) ( not ( = ?auto_20431 ?auto_20465 ) ) ( not ( = ?auto_20432 ?auto_20441 ) ) ( not ( = ?auto_20432 ?auto_20465 ) ) ( not ( = ?auto_20433 ?auto_20441 ) ) ( not ( = ?auto_20433 ?auto_20465 ) ) ( not ( = ?auto_20434 ?auto_20441 ) ) ( not ( = ?auto_20434 ?auto_20465 ) ) ( not ( = ?auto_20435 ?auto_20441 ) ) ( not ( = ?auto_20435 ?auto_20465 ) ) ( not ( = ?auto_20438 ?auto_20441 ) ) ( not ( = ?auto_20438 ?auto_20465 ) ) ( not ( = ?auto_20437 ?auto_20441 ) ) ( not ( = ?auto_20437 ?auto_20465 ) ) ( not ( = ?auto_20436 ?auto_20441 ) ) ( not ( = ?auto_20436 ?auto_20465 ) ) ( not ( = ?auto_20441 ?auto_20458 ) ) ( not ( = ?auto_20441 ?auto_20459 ) ) ( not ( = ?auto_20441 ?auto_20453 ) ) ( not ( = ?auto_20441 ?auto_20469 ) ) ( not ( = ?auto_20441 ?auto_20461 ) ) ( not ( = ?auto_20441 ?auto_20452 ) ) ( not ( = ?auto_20441 ?auto_20478 ) ) ( not ( = ?auto_20441 ?auto_20457 ) ) ( not ( = ?auto_20441 ?auto_20464 ) ) ( not ( = ?auto_20468 ?auto_20467 ) ) ( not ( = ?auto_20468 ?auto_20475 ) ) ( not ( = ?auto_20468 ?auto_20455 ) ) ( not ( = ?auto_20468 ?auto_20472 ) ) ( not ( = ?auto_20468 ?auto_20476 ) ) ( not ( = ?auto_20468 ?auto_20466 ) ) ( not ( = ?auto_20454 ?auto_20471 ) ) ( not ( = ?auto_20454 ?auto_20462 ) ) ( not ( = ?auto_20454 ?auto_20463 ) ) ( not ( = ?auto_20454 ?auto_20451 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20454 ?auto_20477 ) ) ( not ( = ?auto_20465 ?auto_20458 ) ) ( not ( = ?auto_20465 ?auto_20459 ) ) ( not ( = ?auto_20465 ?auto_20453 ) ) ( not ( = ?auto_20465 ?auto_20469 ) ) ( not ( = ?auto_20465 ?auto_20461 ) ) ( not ( = ?auto_20465 ?auto_20452 ) ) ( not ( = ?auto_20465 ?auto_20478 ) ) ( not ( = ?auto_20465 ?auto_20457 ) ) ( not ( = ?auto_20465 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20440 ) ) ( not ( = ?auto_20430 ?auto_20473 ) ) ( not ( = ?auto_20431 ?auto_20440 ) ) ( not ( = ?auto_20431 ?auto_20473 ) ) ( not ( = ?auto_20432 ?auto_20440 ) ) ( not ( = ?auto_20432 ?auto_20473 ) ) ( not ( = ?auto_20433 ?auto_20440 ) ) ( not ( = ?auto_20433 ?auto_20473 ) ) ( not ( = ?auto_20434 ?auto_20440 ) ) ( not ( = ?auto_20434 ?auto_20473 ) ) ( not ( = ?auto_20435 ?auto_20440 ) ) ( not ( = ?auto_20435 ?auto_20473 ) ) ( not ( = ?auto_20438 ?auto_20440 ) ) ( not ( = ?auto_20438 ?auto_20473 ) ) ( not ( = ?auto_20437 ?auto_20440 ) ) ( not ( = ?auto_20437 ?auto_20473 ) ) ( not ( = ?auto_20436 ?auto_20440 ) ) ( not ( = ?auto_20436 ?auto_20473 ) ) ( not ( = ?auto_20439 ?auto_20440 ) ) ( not ( = ?auto_20439 ?auto_20473 ) ) ( not ( = ?auto_20440 ?auto_20465 ) ) ( not ( = ?auto_20440 ?auto_20458 ) ) ( not ( = ?auto_20440 ?auto_20459 ) ) ( not ( = ?auto_20440 ?auto_20453 ) ) ( not ( = ?auto_20440 ?auto_20469 ) ) ( not ( = ?auto_20440 ?auto_20461 ) ) ( not ( = ?auto_20440 ?auto_20452 ) ) ( not ( = ?auto_20440 ?auto_20478 ) ) ( not ( = ?auto_20440 ?auto_20457 ) ) ( not ( = ?auto_20440 ?auto_20464 ) ) ( not ( = ?auto_20473 ?auto_20465 ) ) ( not ( = ?auto_20473 ?auto_20458 ) ) ( not ( = ?auto_20473 ?auto_20459 ) ) ( not ( = ?auto_20473 ?auto_20453 ) ) ( not ( = ?auto_20473 ?auto_20469 ) ) ( not ( = ?auto_20473 ?auto_20461 ) ) ( not ( = ?auto_20473 ?auto_20452 ) ) ( not ( = ?auto_20473 ?auto_20478 ) ) ( not ( = ?auto_20473 ?auto_20457 ) ) ( not ( = ?auto_20473 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20442 ) ) ( not ( = ?auto_20430 ?auto_20456 ) ) ( not ( = ?auto_20431 ?auto_20442 ) ) ( not ( = ?auto_20431 ?auto_20456 ) ) ( not ( = ?auto_20432 ?auto_20442 ) ) ( not ( = ?auto_20432 ?auto_20456 ) ) ( not ( = ?auto_20433 ?auto_20442 ) ) ( not ( = ?auto_20433 ?auto_20456 ) ) ( not ( = ?auto_20434 ?auto_20442 ) ) ( not ( = ?auto_20434 ?auto_20456 ) ) ( not ( = ?auto_20435 ?auto_20442 ) ) ( not ( = ?auto_20435 ?auto_20456 ) ) ( not ( = ?auto_20438 ?auto_20442 ) ) ( not ( = ?auto_20438 ?auto_20456 ) ) ( not ( = ?auto_20437 ?auto_20442 ) ) ( not ( = ?auto_20437 ?auto_20456 ) ) ( not ( = ?auto_20436 ?auto_20442 ) ) ( not ( = ?auto_20436 ?auto_20456 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20456 ) ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20441 ?auto_20456 ) ) ( not ( = ?auto_20442 ?auto_20473 ) ) ( not ( = ?auto_20442 ?auto_20465 ) ) ( not ( = ?auto_20442 ?auto_20458 ) ) ( not ( = ?auto_20442 ?auto_20459 ) ) ( not ( = ?auto_20442 ?auto_20453 ) ) ( not ( = ?auto_20442 ?auto_20469 ) ) ( not ( = ?auto_20442 ?auto_20461 ) ) ( not ( = ?auto_20442 ?auto_20452 ) ) ( not ( = ?auto_20442 ?auto_20478 ) ) ( not ( = ?auto_20442 ?auto_20457 ) ) ( not ( = ?auto_20442 ?auto_20464 ) ) ( not ( = ?auto_20479 ?auto_20475 ) ) ( not ( = ?auto_20479 ?auto_20468 ) ) ( not ( = ?auto_20479 ?auto_20467 ) ) ( not ( = ?auto_20479 ?auto_20455 ) ) ( not ( = ?auto_20479 ?auto_20472 ) ) ( not ( = ?auto_20479 ?auto_20476 ) ) ( not ( = ?auto_20479 ?auto_20466 ) ) ( not ( = ?auto_20470 ?auto_20462 ) ) ( not ( = ?auto_20470 ?auto_20454 ) ) ( not ( = ?auto_20470 ?auto_20471 ) ) ( not ( = ?auto_20470 ?auto_20463 ) ) ( not ( = ?auto_20470 ?auto_20451 ) ) ( not ( = ?auto_20470 ?auto_20460 ) ) ( not ( = ?auto_20470 ?auto_20477 ) ) ( not ( = ?auto_20456 ?auto_20473 ) ) ( not ( = ?auto_20456 ?auto_20465 ) ) ( not ( = ?auto_20456 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20459 ) ) ( not ( = ?auto_20456 ?auto_20453 ) ) ( not ( = ?auto_20456 ?auto_20469 ) ) ( not ( = ?auto_20456 ?auto_20461 ) ) ( not ( = ?auto_20456 ?auto_20452 ) ) ( not ( = ?auto_20456 ?auto_20478 ) ) ( not ( = ?auto_20456 ?auto_20457 ) ) ( not ( = ?auto_20456 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20444 ) ) ( not ( = ?auto_20430 ?auto_20474 ) ) ( not ( = ?auto_20431 ?auto_20444 ) ) ( not ( = ?auto_20431 ?auto_20474 ) ) ( not ( = ?auto_20432 ?auto_20444 ) ) ( not ( = ?auto_20432 ?auto_20474 ) ) ( not ( = ?auto_20433 ?auto_20444 ) ) ( not ( = ?auto_20433 ?auto_20474 ) ) ( not ( = ?auto_20434 ?auto_20444 ) ) ( not ( = ?auto_20434 ?auto_20474 ) ) ( not ( = ?auto_20435 ?auto_20444 ) ) ( not ( = ?auto_20435 ?auto_20474 ) ) ( not ( = ?auto_20438 ?auto_20444 ) ) ( not ( = ?auto_20438 ?auto_20474 ) ) ( not ( = ?auto_20437 ?auto_20444 ) ) ( not ( = ?auto_20437 ?auto_20474 ) ) ( not ( = ?auto_20436 ?auto_20444 ) ) ( not ( = ?auto_20436 ?auto_20474 ) ) ( not ( = ?auto_20439 ?auto_20444 ) ) ( not ( = ?auto_20439 ?auto_20474 ) ) ( not ( = ?auto_20441 ?auto_20444 ) ) ( not ( = ?auto_20441 ?auto_20474 ) ) ( not ( = ?auto_20440 ?auto_20444 ) ) ( not ( = ?auto_20440 ?auto_20474 ) ) ( not ( = ?auto_20444 ?auto_20456 ) ) ( not ( = ?auto_20444 ?auto_20473 ) ) ( not ( = ?auto_20444 ?auto_20465 ) ) ( not ( = ?auto_20444 ?auto_20458 ) ) ( not ( = ?auto_20444 ?auto_20459 ) ) ( not ( = ?auto_20444 ?auto_20453 ) ) ( not ( = ?auto_20444 ?auto_20469 ) ) ( not ( = ?auto_20444 ?auto_20461 ) ) ( not ( = ?auto_20444 ?auto_20452 ) ) ( not ( = ?auto_20444 ?auto_20478 ) ) ( not ( = ?auto_20444 ?auto_20457 ) ) ( not ( = ?auto_20444 ?auto_20464 ) ) ( not ( = ?auto_20474 ?auto_20456 ) ) ( not ( = ?auto_20474 ?auto_20473 ) ) ( not ( = ?auto_20474 ?auto_20465 ) ) ( not ( = ?auto_20474 ?auto_20458 ) ) ( not ( = ?auto_20474 ?auto_20459 ) ) ( not ( = ?auto_20474 ?auto_20453 ) ) ( not ( = ?auto_20474 ?auto_20469 ) ) ( not ( = ?auto_20474 ?auto_20461 ) ) ( not ( = ?auto_20474 ?auto_20452 ) ) ( not ( = ?auto_20474 ?auto_20478 ) ) ( not ( = ?auto_20474 ?auto_20457 ) ) ( not ( = ?auto_20474 ?auto_20464 ) ) ( not ( = ?auto_20430 ?auto_20443 ) ) ( not ( = ?auto_20430 ?auto_20448 ) ) ( not ( = ?auto_20431 ?auto_20443 ) ) ( not ( = ?auto_20431 ?auto_20448 ) ) ( not ( = ?auto_20432 ?auto_20443 ) ) ( not ( = ?auto_20432 ?auto_20448 ) ) ( not ( = ?auto_20433 ?auto_20443 ) ) ( not ( = ?auto_20433 ?auto_20448 ) ) ( not ( = ?auto_20434 ?auto_20443 ) ) ( not ( = ?auto_20434 ?auto_20448 ) ) ( not ( = ?auto_20435 ?auto_20443 ) ) ( not ( = ?auto_20435 ?auto_20448 ) ) ( not ( = ?auto_20438 ?auto_20443 ) ) ( not ( = ?auto_20438 ?auto_20448 ) ) ( not ( = ?auto_20437 ?auto_20443 ) ) ( not ( = ?auto_20437 ?auto_20448 ) ) ( not ( = ?auto_20436 ?auto_20443 ) ) ( not ( = ?auto_20436 ?auto_20448 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20439 ?auto_20448 ) ) ( not ( = ?auto_20441 ?auto_20443 ) ) ( not ( = ?auto_20441 ?auto_20448 ) ) ( not ( = ?auto_20440 ?auto_20443 ) ) ( not ( = ?auto_20440 ?auto_20448 ) ) ( not ( = ?auto_20442 ?auto_20443 ) ) ( not ( = ?auto_20442 ?auto_20448 ) ) ( not ( = ?auto_20443 ?auto_20474 ) ) ( not ( = ?auto_20443 ?auto_20456 ) ) ( not ( = ?auto_20443 ?auto_20473 ) ) ( not ( = ?auto_20443 ?auto_20465 ) ) ( not ( = ?auto_20443 ?auto_20458 ) ) ( not ( = ?auto_20443 ?auto_20459 ) ) ( not ( = ?auto_20443 ?auto_20453 ) ) ( not ( = ?auto_20443 ?auto_20469 ) ) ( not ( = ?auto_20443 ?auto_20461 ) ) ( not ( = ?auto_20443 ?auto_20452 ) ) ( not ( = ?auto_20443 ?auto_20478 ) ) ( not ( = ?auto_20443 ?auto_20457 ) ) ( not ( = ?auto_20443 ?auto_20464 ) ) ( not ( = ?auto_20445 ?auto_20467 ) ) ( not ( = ?auto_20445 ?auto_20479 ) ) ( not ( = ?auto_20445 ?auto_20475 ) ) ( not ( = ?auto_20445 ?auto_20468 ) ) ( not ( = ?auto_20445 ?auto_20455 ) ) ( not ( = ?auto_20445 ?auto_20472 ) ) ( not ( = ?auto_20445 ?auto_20476 ) ) ( not ( = ?auto_20445 ?auto_20466 ) ) ( not ( = ?auto_20446 ?auto_20471 ) ) ( not ( = ?auto_20446 ?auto_20470 ) ) ( not ( = ?auto_20446 ?auto_20462 ) ) ( not ( = ?auto_20446 ?auto_20454 ) ) ( not ( = ?auto_20446 ?auto_20463 ) ) ( not ( = ?auto_20446 ?auto_20451 ) ) ( not ( = ?auto_20446 ?auto_20460 ) ) ( not ( = ?auto_20446 ?auto_20477 ) ) ( not ( = ?auto_20448 ?auto_20474 ) ) ( not ( = ?auto_20448 ?auto_20456 ) ) ( not ( = ?auto_20448 ?auto_20473 ) ) ( not ( = ?auto_20448 ?auto_20465 ) ) ( not ( = ?auto_20448 ?auto_20458 ) ) ( not ( = ?auto_20448 ?auto_20459 ) ) ( not ( = ?auto_20448 ?auto_20453 ) ) ( not ( = ?auto_20448 ?auto_20469 ) ) ( not ( = ?auto_20448 ?auto_20461 ) ) ( not ( = ?auto_20448 ?auto_20452 ) ) ( not ( = ?auto_20448 ?auto_20478 ) ) ( not ( = ?auto_20448 ?auto_20457 ) ) ( not ( = ?auto_20448 ?auto_20464 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20430 ?auto_20431 ?auto_20432 ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20438 ?auto_20437 ?auto_20436 ?auto_20439 ?auto_20441 ?auto_20440 ?auto_20442 ?auto_20444 )
      ( MAKE-1CRATE ?auto_20444 ?auto_20443 )
      ( MAKE-14CRATE-VERIFY ?auto_20430 ?auto_20431 ?auto_20432 ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20438 ?auto_20437 ?auto_20436 ?auto_20439 ?auto_20441 ?auto_20440 ?auto_20442 ?auto_20444 ?auto_20443 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20482 - SURFACE
      ?auto_20483 - SURFACE
    )
    :vars
    (
      ?auto_20484 - HOIST
      ?auto_20485 - PLACE
      ?auto_20487 - PLACE
      ?auto_20488 - HOIST
      ?auto_20489 - SURFACE
      ?auto_20486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20484 ?auto_20485 ) ( SURFACE-AT ?auto_20482 ?auto_20485 ) ( CLEAR ?auto_20482 ) ( IS-CRATE ?auto_20483 ) ( AVAILABLE ?auto_20484 ) ( not ( = ?auto_20487 ?auto_20485 ) ) ( HOIST-AT ?auto_20488 ?auto_20487 ) ( AVAILABLE ?auto_20488 ) ( SURFACE-AT ?auto_20483 ?auto_20487 ) ( ON ?auto_20483 ?auto_20489 ) ( CLEAR ?auto_20483 ) ( TRUCK-AT ?auto_20486 ?auto_20485 ) ( not ( = ?auto_20482 ?auto_20483 ) ) ( not ( = ?auto_20482 ?auto_20489 ) ) ( not ( = ?auto_20483 ?auto_20489 ) ) ( not ( = ?auto_20484 ?auto_20488 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20486 ?auto_20485 ?auto_20487 )
      ( !LIFT ?auto_20488 ?auto_20483 ?auto_20489 ?auto_20487 )
      ( !LOAD ?auto_20488 ?auto_20483 ?auto_20486 ?auto_20487 )
      ( !DRIVE ?auto_20486 ?auto_20487 ?auto_20485 )
      ( !UNLOAD ?auto_20484 ?auto_20483 ?auto_20486 ?auto_20485 )
      ( !DROP ?auto_20484 ?auto_20483 ?auto_20482 ?auto_20485 )
      ( MAKE-1CRATE-VERIFY ?auto_20482 ?auto_20483 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_20506 - SURFACE
      ?auto_20507 - SURFACE
      ?auto_20508 - SURFACE
      ?auto_20509 - SURFACE
      ?auto_20510 - SURFACE
      ?auto_20511 - SURFACE
      ?auto_20514 - SURFACE
      ?auto_20513 - SURFACE
      ?auto_20512 - SURFACE
      ?auto_20515 - SURFACE
      ?auto_20517 - SURFACE
      ?auto_20516 - SURFACE
      ?auto_20518 - SURFACE
      ?auto_20520 - SURFACE
      ?auto_20519 - SURFACE
      ?auto_20521 - SURFACE
    )
    :vars
    (
      ?auto_20526 - HOIST
      ?auto_20527 - PLACE
      ?auto_20523 - PLACE
      ?auto_20524 - HOIST
      ?auto_20522 - SURFACE
      ?auto_20544 - PLACE
      ?auto_20534 - HOIST
      ?auto_20550 - SURFACE
      ?auto_20547 - PLACE
      ?auto_20529 - HOIST
      ?auto_20539 - SURFACE
      ?auto_20541 - PLACE
      ?auto_20559 - HOIST
      ?auto_20546 - SURFACE
      ?auto_20556 - PLACE
      ?auto_20542 - HOIST
      ?auto_20543 - SURFACE
      ?auto_20549 - PLACE
      ?auto_20536 - HOIST
      ?auto_20537 - SURFACE
      ?auto_20531 - SURFACE
      ?auto_20558 - SURFACE
      ?auto_20552 - PLACE
      ?auto_20530 - HOIST
      ?auto_20553 - SURFACE
      ?auto_20538 - PLACE
      ?auto_20551 - HOIST
      ?auto_20548 - SURFACE
      ?auto_20557 - SURFACE
      ?auto_20528 - PLACE
      ?auto_20554 - HOIST
      ?auto_20545 - SURFACE
      ?auto_20532 - PLACE
      ?auto_20533 - HOIST
      ?auto_20535 - SURFACE
      ?auto_20555 - SURFACE
      ?auto_20540 - SURFACE
      ?auto_20525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20526 ?auto_20527 ) ( IS-CRATE ?auto_20521 ) ( not ( = ?auto_20523 ?auto_20527 ) ) ( HOIST-AT ?auto_20524 ?auto_20523 ) ( AVAILABLE ?auto_20524 ) ( SURFACE-AT ?auto_20521 ?auto_20523 ) ( ON ?auto_20521 ?auto_20522 ) ( CLEAR ?auto_20521 ) ( not ( = ?auto_20519 ?auto_20521 ) ) ( not ( = ?auto_20519 ?auto_20522 ) ) ( not ( = ?auto_20521 ?auto_20522 ) ) ( not ( = ?auto_20526 ?auto_20524 ) ) ( IS-CRATE ?auto_20519 ) ( not ( = ?auto_20544 ?auto_20527 ) ) ( HOIST-AT ?auto_20534 ?auto_20544 ) ( AVAILABLE ?auto_20534 ) ( SURFACE-AT ?auto_20519 ?auto_20544 ) ( ON ?auto_20519 ?auto_20550 ) ( CLEAR ?auto_20519 ) ( not ( = ?auto_20520 ?auto_20519 ) ) ( not ( = ?auto_20520 ?auto_20550 ) ) ( not ( = ?auto_20519 ?auto_20550 ) ) ( not ( = ?auto_20526 ?auto_20534 ) ) ( IS-CRATE ?auto_20520 ) ( not ( = ?auto_20547 ?auto_20527 ) ) ( HOIST-AT ?auto_20529 ?auto_20547 ) ( SURFACE-AT ?auto_20520 ?auto_20547 ) ( ON ?auto_20520 ?auto_20539 ) ( CLEAR ?auto_20520 ) ( not ( = ?auto_20518 ?auto_20520 ) ) ( not ( = ?auto_20518 ?auto_20539 ) ) ( not ( = ?auto_20520 ?auto_20539 ) ) ( not ( = ?auto_20526 ?auto_20529 ) ) ( IS-CRATE ?auto_20518 ) ( not ( = ?auto_20541 ?auto_20527 ) ) ( HOIST-AT ?auto_20559 ?auto_20541 ) ( AVAILABLE ?auto_20559 ) ( SURFACE-AT ?auto_20518 ?auto_20541 ) ( ON ?auto_20518 ?auto_20546 ) ( CLEAR ?auto_20518 ) ( not ( = ?auto_20516 ?auto_20518 ) ) ( not ( = ?auto_20516 ?auto_20546 ) ) ( not ( = ?auto_20518 ?auto_20546 ) ) ( not ( = ?auto_20526 ?auto_20559 ) ) ( IS-CRATE ?auto_20516 ) ( not ( = ?auto_20556 ?auto_20527 ) ) ( HOIST-AT ?auto_20542 ?auto_20556 ) ( SURFACE-AT ?auto_20516 ?auto_20556 ) ( ON ?auto_20516 ?auto_20543 ) ( CLEAR ?auto_20516 ) ( not ( = ?auto_20517 ?auto_20516 ) ) ( not ( = ?auto_20517 ?auto_20543 ) ) ( not ( = ?auto_20516 ?auto_20543 ) ) ( not ( = ?auto_20526 ?auto_20542 ) ) ( IS-CRATE ?auto_20517 ) ( not ( = ?auto_20549 ?auto_20527 ) ) ( HOIST-AT ?auto_20536 ?auto_20549 ) ( AVAILABLE ?auto_20536 ) ( SURFACE-AT ?auto_20517 ?auto_20549 ) ( ON ?auto_20517 ?auto_20537 ) ( CLEAR ?auto_20517 ) ( not ( = ?auto_20515 ?auto_20517 ) ) ( not ( = ?auto_20515 ?auto_20537 ) ) ( not ( = ?auto_20517 ?auto_20537 ) ) ( not ( = ?auto_20526 ?auto_20536 ) ) ( IS-CRATE ?auto_20515 ) ( SURFACE-AT ?auto_20515 ?auto_20547 ) ( ON ?auto_20515 ?auto_20531 ) ( CLEAR ?auto_20515 ) ( not ( = ?auto_20512 ?auto_20515 ) ) ( not ( = ?auto_20512 ?auto_20531 ) ) ( not ( = ?auto_20515 ?auto_20531 ) ) ( IS-CRATE ?auto_20512 ) ( AVAILABLE ?auto_20542 ) ( SURFACE-AT ?auto_20512 ?auto_20556 ) ( ON ?auto_20512 ?auto_20558 ) ( CLEAR ?auto_20512 ) ( not ( = ?auto_20513 ?auto_20512 ) ) ( not ( = ?auto_20513 ?auto_20558 ) ) ( not ( = ?auto_20512 ?auto_20558 ) ) ( IS-CRATE ?auto_20513 ) ( not ( = ?auto_20552 ?auto_20527 ) ) ( HOIST-AT ?auto_20530 ?auto_20552 ) ( AVAILABLE ?auto_20530 ) ( SURFACE-AT ?auto_20513 ?auto_20552 ) ( ON ?auto_20513 ?auto_20553 ) ( CLEAR ?auto_20513 ) ( not ( = ?auto_20514 ?auto_20513 ) ) ( not ( = ?auto_20514 ?auto_20553 ) ) ( not ( = ?auto_20513 ?auto_20553 ) ) ( not ( = ?auto_20526 ?auto_20530 ) ) ( IS-CRATE ?auto_20514 ) ( not ( = ?auto_20538 ?auto_20527 ) ) ( HOIST-AT ?auto_20551 ?auto_20538 ) ( AVAILABLE ?auto_20551 ) ( SURFACE-AT ?auto_20514 ?auto_20538 ) ( ON ?auto_20514 ?auto_20548 ) ( CLEAR ?auto_20514 ) ( not ( = ?auto_20511 ?auto_20514 ) ) ( not ( = ?auto_20511 ?auto_20548 ) ) ( not ( = ?auto_20514 ?auto_20548 ) ) ( not ( = ?auto_20526 ?auto_20551 ) ) ( IS-CRATE ?auto_20511 ) ( AVAILABLE ?auto_20529 ) ( SURFACE-AT ?auto_20511 ?auto_20547 ) ( ON ?auto_20511 ?auto_20557 ) ( CLEAR ?auto_20511 ) ( not ( = ?auto_20510 ?auto_20511 ) ) ( not ( = ?auto_20510 ?auto_20557 ) ) ( not ( = ?auto_20511 ?auto_20557 ) ) ( IS-CRATE ?auto_20510 ) ( not ( = ?auto_20528 ?auto_20527 ) ) ( HOIST-AT ?auto_20554 ?auto_20528 ) ( AVAILABLE ?auto_20554 ) ( SURFACE-AT ?auto_20510 ?auto_20528 ) ( ON ?auto_20510 ?auto_20545 ) ( CLEAR ?auto_20510 ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( not ( = ?auto_20509 ?auto_20545 ) ) ( not ( = ?auto_20510 ?auto_20545 ) ) ( not ( = ?auto_20526 ?auto_20554 ) ) ( IS-CRATE ?auto_20509 ) ( not ( = ?auto_20532 ?auto_20527 ) ) ( HOIST-AT ?auto_20533 ?auto_20532 ) ( SURFACE-AT ?auto_20509 ?auto_20532 ) ( ON ?auto_20509 ?auto_20535 ) ( CLEAR ?auto_20509 ) ( not ( = ?auto_20508 ?auto_20509 ) ) ( not ( = ?auto_20508 ?auto_20535 ) ) ( not ( = ?auto_20509 ?auto_20535 ) ) ( not ( = ?auto_20526 ?auto_20533 ) ) ( IS-CRATE ?auto_20508 ) ( SURFACE-AT ?auto_20508 ?auto_20532 ) ( ON ?auto_20508 ?auto_20555 ) ( CLEAR ?auto_20508 ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20555 ) ) ( not ( = ?auto_20508 ?auto_20555 ) ) ( SURFACE-AT ?auto_20506 ?auto_20527 ) ( CLEAR ?auto_20506 ) ( IS-CRATE ?auto_20507 ) ( AVAILABLE ?auto_20526 ) ( AVAILABLE ?auto_20533 ) ( SURFACE-AT ?auto_20507 ?auto_20532 ) ( ON ?auto_20507 ?auto_20540 ) ( CLEAR ?auto_20507 ) ( TRUCK-AT ?auto_20525 ?auto_20527 ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20540 ) ) ( not ( = ?auto_20507 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20555 ) ) ( not ( = ?auto_20508 ?auto_20540 ) ) ( not ( = ?auto_20555 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20509 ) ) ( not ( = ?auto_20506 ?auto_20535 ) ) ( not ( = ?auto_20507 ?auto_20509 ) ) ( not ( = ?auto_20507 ?auto_20535 ) ) ( not ( = ?auto_20509 ?auto_20555 ) ) ( not ( = ?auto_20509 ?auto_20540 ) ) ( not ( = ?auto_20535 ?auto_20555 ) ) ( not ( = ?auto_20535 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20510 ) ) ( not ( = ?auto_20506 ?auto_20545 ) ) ( not ( = ?auto_20507 ?auto_20510 ) ) ( not ( = ?auto_20507 ?auto_20545 ) ) ( not ( = ?auto_20508 ?auto_20510 ) ) ( not ( = ?auto_20508 ?auto_20545 ) ) ( not ( = ?auto_20510 ?auto_20535 ) ) ( not ( = ?auto_20510 ?auto_20555 ) ) ( not ( = ?auto_20510 ?auto_20540 ) ) ( not ( = ?auto_20528 ?auto_20532 ) ) ( not ( = ?auto_20554 ?auto_20533 ) ) ( not ( = ?auto_20545 ?auto_20535 ) ) ( not ( = ?auto_20545 ?auto_20555 ) ) ( not ( = ?auto_20545 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20511 ) ) ( not ( = ?auto_20506 ?auto_20557 ) ) ( not ( = ?auto_20507 ?auto_20511 ) ) ( not ( = ?auto_20507 ?auto_20557 ) ) ( not ( = ?auto_20508 ?auto_20511 ) ) ( not ( = ?auto_20508 ?auto_20557 ) ) ( not ( = ?auto_20509 ?auto_20511 ) ) ( not ( = ?auto_20509 ?auto_20557 ) ) ( not ( = ?auto_20511 ?auto_20545 ) ) ( not ( = ?auto_20511 ?auto_20535 ) ) ( not ( = ?auto_20511 ?auto_20555 ) ) ( not ( = ?auto_20511 ?auto_20540 ) ) ( not ( = ?auto_20547 ?auto_20528 ) ) ( not ( = ?auto_20547 ?auto_20532 ) ) ( not ( = ?auto_20529 ?auto_20554 ) ) ( not ( = ?auto_20529 ?auto_20533 ) ) ( not ( = ?auto_20557 ?auto_20545 ) ) ( not ( = ?auto_20557 ?auto_20535 ) ) ( not ( = ?auto_20557 ?auto_20555 ) ) ( not ( = ?auto_20557 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20514 ) ) ( not ( = ?auto_20506 ?auto_20548 ) ) ( not ( = ?auto_20507 ?auto_20514 ) ) ( not ( = ?auto_20507 ?auto_20548 ) ) ( not ( = ?auto_20508 ?auto_20514 ) ) ( not ( = ?auto_20508 ?auto_20548 ) ) ( not ( = ?auto_20509 ?auto_20514 ) ) ( not ( = ?auto_20509 ?auto_20548 ) ) ( not ( = ?auto_20510 ?auto_20514 ) ) ( not ( = ?auto_20510 ?auto_20548 ) ) ( not ( = ?auto_20514 ?auto_20557 ) ) ( not ( = ?auto_20514 ?auto_20545 ) ) ( not ( = ?auto_20514 ?auto_20535 ) ) ( not ( = ?auto_20514 ?auto_20555 ) ) ( not ( = ?auto_20514 ?auto_20540 ) ) ( not ( = ?auto_20538 ?auto_20547 ) ) ( not ( = ?auto_20538 ?auto_20528 ) ) ( not ( = ?auto_20538 ?auto_20532 ) ) ( not ( = ?auto_20551 ?auto_20529 ) ) ( not ( = ?auto_20551 ?auto_20554 ) ) ( not ( = ?auto_20551 ?auto_20533 ) ) ( not ( = ?auto_20548 ?auto_20557 ) ) ( not ( = ?auto_20548 ?auto_20545 ) ) ( not ( = ?auto_20548 ?auto_20535 ) ) ( not ( = ?auto_20548 ?auto_20555 ) ) ( not ( = ?auto_20548 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20513 ) ) ( not ( = ?auto_20506 ?auto_20553 ) ) ( not ( = ?auto_20507 ?auto_20513 ) ) ( not ( = ?auto_20507 ?auto_20553 ) ) ( not ( = ?auto_20508 ?auto_20513 ) ) ( not ( = ?auto_20508 ?auto_20553 ) ) ( not ( = ?auto_20509 ?auto_20513 ) ) ( not ( = ?auto_20509 ?auto_20553 ) ) ( not ( = ?auto_20510 ?auto_20513 ) ) ( not ( = ?auto_20510 ?auto_20553 ) ) ( not ( = ?auto_20511 ?auto_20513 ) ) ( not ( = ?auto_20511 ?auto_20553 ) ) ( not ( = ?auto_20513 ?auto_20548 ) ) ( not ( = ?auto_20513 ?auto_20557 ) ) ( not ( = ?auto_20513 ?auto_20545 ) ) ( not ( = ?auto_20513 ?auto_20535 ) ) ( not ( = ?auto_20513 ?auto_20555 ) ) ( not ( = ?auto_20513 ?auto_20540 ) ) ( not ( = ?auto_20552 ?auto_20538 ) ) ( not ( = ?auto_20552 ?auto_20547 ) ) ( not ( = ?auto_20552 ?auto_20528 ) ) ( not ( = ?auto_20552 ?auto_20532 ) ) ( not ( = ?auto_20530 ?auto_20551 ) ) ( not ( = ?auto_20530 ?auto_20529 ) ) ( not ( = ?auto_20530 ?auto_20554 ) ) ( not ( = ?auto_20530 ?auto_20533 ) ) ( not ( = ?auto_20553 ?auto_20548 ) ) ( not ( = ?auto_20553 ?auto_20557 ) ) ( not ( = ?auto_20553 ?auto_20545 ) ) ( not ( = ?auto_20553 ?auto_20535 ) ) ( not ( = ?auto_20553 ?auto_20555 ) ) ( not ( = ?auto_20553 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20512 ) ) ( not ( = ?auto_20506 ?auto_20558 ) ) ( not ( = ?auto_20507 ?auto_20512 ) ) ( not ( = ?auto_20507 ?auto_20558 ) ) ( not ( = ?auto_20508 ?auto_20512 ) ) ( not ( = ?auto_20508 ?auto_20558 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20558 ) ) ( not ( = ?auto_20510 ?auto_20512 ) ) ( not ( = ?auto_20510 ?auto_20558 ) ) ( not ( = ?auto_20511 ?auto_20512 ) ) ( not ( = ?auto_20511 ?auto_20558 ) ) ( not ( = ?auto_20514 ?auto_20512 ) ) ( not ( = ?auto_20514 ?auto_20558 ) ) ( not ( = ?auto_20512 ?auto_20553 ) ) ( not ( = ?auto_20512 ?auto_20548 ) ) ( not ( = ?auto_20512 ?auto_20557 ) ) ( not ( = ?auto_20512 ?auto_20545 ) ) ( not ( = ?auto_20512 ?auto_20535 ) ) ( not ( = ?auto_20512 ?auto_20555 ) ) ( not ( = ?auto_20512 ?auto_20540 ) ) ( not ( = ?auto_20556 ?auto_20552 ) ) ( not ( = ?auto_20556 ?auto_20538 ) ) ( not ( = ?auto_20556 ?auto_20547 ) ) ( not ( = ?auto_20556 ?auto_20528 ) ) ( not ( = ?auto_20556 ?auto_20532 ) ) ( not ( = ?auto_20542 ?auto_20530 ) ) ( not ( = ?auto_20542 ?auto_20551 ) ) ( not ( = ?auto_20542 ?auto_20529 ) ) ( not ( = ?auto_20542 ?auto_20554 ) ) ( not ( = ?auto_20542 ?auto_20533 ) ) ( not ( = ?auto_20558 ?auto_20553 ) ) ( not ( = ?auto_20558 ?auto_20548 ) ) ( not ( = ?auto_20558 ?auto_20557 ) ) ( not ( = ?auto_20558 ?auto_20545 ) ) ( not ( = ?auto_20558 ?auto_20535 ) ) ( not ( = ?auto_20558 ?auto_20555 ) ) ( not ( = ?auto_20558 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20515 ) ) ( not ( = ?auto_20506 ?auto_20531 ) ) ( not ( = ?auto_20507 ?auto_20515 ) ) ( not ( = ?auto_20507 ?auto_20531 ) ) ( not ( = ?auto_20508 ?auto_20515 ) ) ( not ( = ?auto_20508 ?auto_20531 ) ) ( not ( = ?auto_20509 ?auto_20515 ) ) ( not ( = ?auto_20509 ?auto_20531 ) ) ( not ( = ?auto_20510 ?auto_20515 ) ) ( not ( = ?auto_20510 ?auto_20531 ) ) ( not ( = ?auto_20511 ?auto_20515 ) ) ( not ( = ?auto_20511 ?auto_20531 ) ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( not ( = ?auto_20514 ?auto_20531 ) ) ( not ( = ?auto_20513 ?auto_20515 ) ) ( not ( = ?auto_20513 ?auto_20531 ) ) ( not ( = ?auto_20515 ?auto_20558 ) ) ( not ( = ?auto_20515 ?auto_20553 ) ) ( not ( = ?auto_20515 ?auto_20548 ) ) ( not ( = ?auto_20515 ?auto_20557 ) ) ( not ( = ?auto_20515 ?auto_20545 ) ) ( not ( = ?auto_20515 ?auto_20535 ) ) ( not ( = ?auto_20515 ?auto_20555 ) ) ( not ( = ?auto_20515 ?auto_20540 ) ) ( not ( = ?auto_20531 ?auto_20558 ) ) ( not ( = ?auto_20531 ?auto_20553 ) ) ( not ( = ?auto_20531 ?auto_20548 ) ) ( not ( = ?auto_20531 ?auto_20557 ) ) ( not ( = ?auto_20531 ?auto_20545 ) ) ( not ( = ?auto_20531 ?auto_20535 ) ) ( not ( = ?auto_20531 ?auto_20555 ) ) ( not ( = ?auto_20531 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20517 ) ) ( not ( = ?auto_20506 ?auto_20537 ) ) ( not ( = ?auto_20507 ?auto_20517 ) ) ( not ( = ?auto_20507 ?auto_20537 ) ) ( not ( = ?auto_20508 ?auto_20517 ) ) ( not ( = ?auto_20508 ?auto_20537 ) ) ( not ( = ?auto_20509 ?auto_20517 ) ) ( not ( = ?auto_20509 ?auto_20537 ) ) ( not ( = ?auto_20510 ?auto_20517 ) ) ( not ( = ?auto_20510 ?auto_20537 ) ) ( not ( = ?auto_20511 ?auto_20517 ) ) ( not ( = ?auto_20511 ?auto_20537 ) ) ( not ( = ?auto_20514 ?auto_20517 ) ) ( not ( = ?auto_20514 ?auto_20537 ) ) ( not ( = ?auto_20513 ?auto_20517 ) ) ( not ( = ?auto_20513 ?auto_20537 ) ) ( not ( = ?auto_20512 ?auto_20517 ) ) ( not ( = ?auto_20512 ?auto_20537 ) ) ( not ( = ?auto_20517 ?auto_20531 ) ) ( not ( = ?auto_20517 ?auto_20558 ) ) ( not ( = ?auto_20517 ?auto_20553 ) ) ( not ( = ?auto_20517 ?auto_20548 ) ) ( not ( = ?auto_20517 ?auto_20557 ) ) ( not ( = ?auto_20517 ?auto_20545 ) ) ( not ( = ?auto_20517 ?auto_20535 ) ) ( not ( = ?auto_20517 ?auto_20555 ) ) ( not ( = ?auto_20517 ?auto_20540 ) ) ( not ( = ?auto_20549 ?auto_20547 ) ) ( not ( = ?auto_20549 ?auto_20556 ) ) ( not ( = ?auto_20549 ?auto_20552 ) ) ( not ( = ?auto_20549 ?auto_20538 ) ) ( not ( = ?auto_20549 ?auto_20528 ) ) ( not ( = ?auto_20549 ?auto_20532 ) ) ( not ( = ?auto_20536 ?auto_20529 ) ) ( not ( = ?auto_20536 ?auto_20542 ) ) ( not ( = ?auto_20536 ?auto_20530 ) ) ( not ( = ?auto_20536 ?auto_20551 ) ) ( not ( = ?auto_20536 ?auto_20554 ) ) ( not ( = ?auto_20536 ?auto_20533 ) ) ( not ( = ?auto_20537 ?auto_20531 ) ) ( not ( = ?auto_20537 ?auto_20558 ) ) ( not ( = ?auto_20537 ?auto_20553 ) ) ( not ( = ?auto_20537 ?auto_20548 ) ) ( not ( = ?auto_20537 ?auto_20557 ) ) ( not ( = ?auto_20537 ?auto_20545 ) ) ( not ( = ?auto_20537 ?auto_20535 ) ) ( not ( = ?auto_20537 ?auto_20555 ) ) ( not ( = ?auto_20537 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20516 ) ) ( not ( = ?auto_20506 ?auto_20543 ) ) ( not ( = ?auto_20507 ?auto_20516 ) ) ( not ( = ?auto_20507 ?auto_20543 ) ) ( not ( = ?auto_20508 ?auto_20516 ) ) ( not ( = ?auto_20508 ?auto_20543 ) ) ( not ( = ?auto_20509 ?auto_20516 ) ) ( not ( = ?auto_20509 ?auto_20543 ) ) ( not ( = ?auto_20510 ?auto_20516 ) ) ( not ( = ?auto_20510 ?auto_20543 ) ) ( not ( = ?auto_20511 ?auto_20516 ) ) ( not ( = ?auto_20511 ?auto_20543 ) ) ( not ( = ?auto_20514 ?auto_20516 ) ) ( not ( = ?auto_20514 ?auto_20543 ) ) ( not ( = ?auto_20513 ?auto_20516 ) ) ( not ( = ?auto_20513 ?auto_20543 ) ) ( not ( = ?auto_20512 ?auto_20516 ) ) ( not ( = ?auto_20512 ?auto_20543 ) ) ( not ( = ?auto_20515 ?auto_20516 ) ) ( not ( = ?auto_20515 ?auto_20543 ) ) ( not ( = ?auto_20516 ?auto_20537 ) ) ( not ( = ?auto_20516 ?auto_20531 ) ) ( not ( = ?auto_20516 ?auto_20558 ) ) ( not ( = ?auto_20516 ?auto_20553 ) ) ( not ( = ?auto_20516 ?auto_20548 ) ) ( not ( = ?auto_20516 ?auto_20557 ) ) ( not ( = ?auto_20516 ?auto_20545 ) ) ( not ( = ?auto_20516 ?auto_20535 ) ) ( not ( = ?auto_20516 ?auto_20555 ) ) ( not ( = ?auto_20516 ?auto_20540 ) ) ( not ( = ?auto_20543 ?auto_20537 ) ) ( not ( = ?auto_20543 ?auto_20531 ) ) ( not ( = ?auto_20543 ?auto_20558 ) ) ( not ( = ?auto_20543 ?auto_20553 ) ) ( not ( = ?auto_20543 ?auto_20548 ) ) ( not ( = ?auto_20543 ?auto_20557 ) ) ( not ( = ?auto_20543 ?auto_20545 ) ) ( not ( = ?auto_20543 ?auto_20535 ) ) ( not ( = ?auto_20543 ?auto_20555 ) ) ( not ( = ?auto_20543 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20518 ) ) ( not ( = ?auto_20506 ?auto_20546 ) ) ( not ( = ?auto_20507 ?auto_20518 ) ) ( not ( = ?auto_20507 ?auto_20546 ) ) ( not ( = ?auto_20508 ?auto_20518 ) ) ( not ( = ?auto_20508 ?auto_20546 ) ) ( not ( = ?auto_20509 ?auto_20518 ) ) ( not ( = ?auto_20509 ?auto_20546 ) ) ( not ( = ?auto_20510 ?auto_20518 ) ) ( not ( = ?auto_20510 ?auto_20546 ) ) ( not ( = ?auto_20511 ?auto_20518 ) ) ( not ( = ?auto_20511 ?auto_20546 ) ) ( not ( = ?auto_20514 ?auto_20518 ) ) ( not ( = ?auto_20514 ?auto_20546 ) ) ( not ( = ?auto_20513 ?auto_20518 ) ) ( not ( = ?auto_20513 ?auto_20546 ) ) ( not ( = ?auto_20512 ?auto_20518 ) ) ( not ( = ?auto_20512 ?auto_20546 ) ) ( not ( = ?auto_20515 ?auto_20518 ) ) ( not ( = ?auto_20515 ?auto_20546 ) ) ( not ( = ?auto_20517 ?auto_20518 ) ) ( not ( = ?auto_20517 ?auto_20546 ) ) ( not ( = ?auto_20518 ?auto_20543 ) ) ( not ( = ?auto_20518 ?auto_20537 ) ) ( not ( = ?auto_20518 ?auto_20531 ) ) ( not ( = ?auto_20518 ?auto_20558 ) ) ( not ( = ?auto_20518 ?auto_20553 ) ) ( not ( = ?auto_20518 ?auto_20548 ) ) ( not ( = ?auto_20518 ?auto_20557 ) ) ( not ( = ?auto_20518 ?auto_20545 ) ) ( not ( = ?auto_20518 ?auto_20535 ) ) ( not ( = ?auto_20518 ?auto_20555 ) ) ( not ( = ?auto_20518 ?auto_20540 ) ) ( not ( = ?auto_20541 ?auto_20556 ) ) ( not ( = ?auto_20541 ?auto_20549 ) ) ( not ( = ?auto_20541 ?auto_20547 ) ) ( not ( = ?auto_20541 ?auto_20552 ) ) ( not ( = ?auto_20541 ?auto_20538 ) ) ( not ( = ?auto_20541 ?auto_20528 ) ) ( not ( = ?auto_20541 ?auto_20532 ) ) ( not ( = ?auto_20559 ?auto_20542 ) ) ( not ( = ?auto_20559 ?auto_20536 ) ) ( not ( = ?auto_20559 ?auto_20529 ) ) ( not ( = ?auto_20559 ?auto_20530 ) ) ( not ( = ?auto_20559 ?auto_20551 ) ) ( not ( = ?auto_20559 ?auto_20554 ) ) ( not ( = ?auto_20559 ?auto_20533 ) ) ( not ( = ?auto_20546 ?auto_20543 ) ) ( not ( = ?auto_20546 ?auto_20537 ) ) ( not ( = ?auto_20546 ?auto_20531 ) ) ( not ( = ?auto_20546 ?auto_20558 ) ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20557 ) ) ( not ( = ?auto_20546 ?auto_20545 ) ) ( not ( = ?auto_20546 ?auto_20535 ) ) ( not ( = ?auto_20546 ?auto_20555 ) ) ( not ( = ?auto_20546 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20520 ) ) ( not ( = ?auto_20506 ?auto_20539 ) ) ( not ( = ?auto_20507 ?auto_20520 ) ) ( not ( = ?auto_20507 ?auto_20539 ) ) ( not ( = ?auto_20508 ?auto_20520 ) ) ( not ( = ?auto_20508 ?auto_20539 ) ) ( not ( = ?auto_20509 ?auto_20520 ) ) ( not ( = ?auto_20509 ?auto_20539 ) ) ( not ( = ?auto_20510 ?auto_20520 ) ) ( not ( = ?auto_20510 ?auto_20539 ) ) ( not ( = ?auto_20511 ?auto_20520 ) ) ( not ( = ?auto_20511 ?auto_20539 ) ) ( not ( = ?auto_20514 ?auto_20520 ) ) ( not ( = ?auto_20514 ?auto_20539 ) ) ( not ( = ?auto_20513 ?auto_20520 ) ) ( not ( = ?auto_20513 ?auto_20539 ) ) ( not ( = ?auto_20512 ?auto_20520 ) ) ( not ( = ?auto_20512 ?auto_20539 ) ) ( not ( = ?auto_20515 ?auto_20520 ) ) ( not ( = ?auto_20515 ?auto_20539 ) ) ( not ( = ?auto_20517 ?auto_20520 ) ) ( not ( = ?auto_20517 ?auto_20539 ) ) ( not ( = ?auto_20516 ?auto_20520 ) ) ( not ( = ?auto_20516 ?auto_20539 ) ) ( not ( = ?auto_20520 ?auto_20546 ) ) ( not ( = ?auto_20520 ?auto_20543 ) ) ( not ( = ?auto_20520 ?auto_20537 ) ) ( not ( = ?auto_20520 ?auto_20531 ) ) ( not ( = ?auto_20520 ?auto_20558 ) ) ( not ( = ?auto_20520 ?auto_20553 ) ) ( not ( = ?auto_20520 ?auto_20548 ) ) ( not ( = ?auto_20520 ?auto_20557 ) ) ( not ( = ?auto_20520 ?auto_20545 ) ) ( not ( = ?auto_20520 ?auto_20535 ) ) ( not ( = ?auto_20520 ?auto_20555 ) ) ( not ( = ?auto_20520 ?auto_20540 ) ) ( not ( = ?auto_20539 ?auto_20546 ) ) ( not ( = ?auto_20539 ?auto_20543 ) ) ( not ( = ?auto_20539 ?auto_20537 ) ) ( not ( = ?auto_20539 ?auto_20531 ) ) ( not ( = ?auto_20539 ?auto_20558 ) ) ( not ( = ?auto_20539 ?auto_20553 ) ) ( not ( = ?auto_20539 ?auto_20548 ) ) ( not ( = ?auto_20539 ?auto_20557 ) ) ( not ( = ?auto_20539 ?auto_20545 ) ) ( not ( = ?auto_20539 ?auto_20535 ) ) ( not ( = ?auto_20539 ?auto_20555 ) ) ( not ( = ?auto_20539 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20519 ) ) ( not ( = ?auto_20506 ?auto_20550 ) ) ( not ( = ?auto_20507 ?auto_20519 ) ) ( not ( = ?auto_20507 ?auto_20550 ) ) ( not ( = ?auto_20508 ?auto_20519 ) ) ( not ( = ?auto_20508 ?auto_20550 ) ) ( not ( = ?auto_20509 ?auto_20519 ) ) ( not ( = ?auto_20509 ?auto_20550 ) ) ( not ( = ?auto_20510 ?auto_20519 ) ) ( not ( = ?auto_20510 ?auto_20550 ) ) ( not ( = ?auto_20511 ?auto_20519 ) ) ( not ( = ?auto_20511 ?auto_20550 ) ) ( not ( = ?auto_20514 ?auto_20519 ) ) ( not ( = ?auto_20514 ?auto_20550 ) ) ( not ( = ?auto_20513 ?auto_20519 ) ) ( not ( = ?auto_20513 ?auto_20550 ) ) ( not ( = ?auto_20512 ?auto_20519 ) ) ( not ( = ?auto_20512 ?auto_20550 ) ) ( not ( = ?auto_20515 ?auto_20519 ) ) ( not ( = ?auto_20515 ?auto_20550 ) ) ( not ( = ?auto_20517 ?auto_20519 ) ) ( not ( = ?auto_20517 ?auto_20550 ) ) ( not ( = ?auto_20516 ?auto_20519 ) ) ( not ( = ?auto_20516 ?auto_20550 ) ) ( not ( = ?auto_20518 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20550 ) ) ( not ( = ?auto_20519 ?auto_20539 ) ) ( not ( = ?auto_20519 ?auto_20546 ) ) ( not ( = ?auto_20519 ?auto_20543 ) ) ( not ( = ?auto_20519 ?auto_20537 ) ) ( not ( = ?auto_20519 ?auto_20531 ) ) ( not ( = ?auto_20519 ?auto_20558 ) ) ( not ( = ?auto_20519 ?auto_20553 ) ) ( not ( = ?auto_20519 ?auto_20548 ) ) ( not ( = ?auto_20519 ?auto_20557 ) ) ( not ( = ?auto_20519 ?auto_20545 ) ) ( not ( = ?auto_20519 ?auto_20535 ) ) ( not ( = ?auto_20519 ?auto_20555 ) ) ( not ( = ?auto_20519 ?auto_20540 ) ) ( not ( = ?auto_20544 ?auto_20547 ) ) ( not ( = ?auto_20544 ?auto_20541 ) ) ( not ( = ?auto_20544 ?auto_20556 ) ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20544 ?auto_20552 ) ) ( not ( = ?auto_20544 ?auto_20538 ) ) ( not ( = ?auto_20544 ?auto_20528 ) ) ( not ( = ?auto_20544 ?auto_20532 ) ) ( not ( = ?auto_20534 ?auto_20529 ) ) ( not ( = ?auto_20534 ?auto_20559 ) ) ( not ( = ?auto_20534 ?auto_20542 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20534 ?auto_20530 ) ) ( not ( = ?auto_20534 ?auto_20551 ) ) ( not ( = ?auto_20534 ?auto_20554 ) ) ( not ( = ?auto_20534 ?auto_20533 ) ) ( not ( = ?auto_20550 ?auto_20539 ) ) ( not ( = ?auto_20550 ?auto_20546 ) ) ( not ( = ?auto_20550 ?auto_20543 ) ) ( not ( = ?auto_20550 ?auto_20537 ) ) ( not ( = ?auto_20550 ?auto_20531 ) ) ( not ( = ?auto_20550 ?auto_20558 ) ) ( not ( = ?auto_20550 ?auto_20553 ) ) ( not ( = ?auto_20550 ?auto_20548 ) ) ( not ( = ?auto_20550 ?auto_20557 ) ) ( not ( = ?auto_20550 ?auto_20545 ) ) ( not ( = ?auto_20550 ?auto_20535 ) ) ( not ( = ?auto_20550 ?auto_20555 ) ) ( not ( = ?auto_20550 ?auto_20540 ) ) ( not ( = ?auto_20506 ?auto_20521 ) ) ( not ( = ?auto_20506 ?auto_20522 ) ) ( not ( = ?auto_20507 ?auto_20521 ) ) ( not ( = ?auto_20507 ?auto_20522 ) ) ( not ( = ?auto_20508 ?auto_20521 ) ) ( not ( = ?auto_20508 ?auto_20522 ) ) ( not ( = ?auto_20509 ?auto_20521 ) ) ( not ( = ?auto_20509 ?auto_20522 ) ) ( not ( = ?auto_20510 ?auto_20521 ) ) ( not ( = ?auto_20510 ?auto_20522 ) ) ( not ( = ?auto_20511 ?auto_20521 ) ) ( not ( = ?auto_20511 ?auto_20522 ) ) ( not ( = ?auto_20514 ?auto_20521 ) ) ( not ( = ?auto_20514 ?auto_20522 ) ) ( not ( = ?auto_20513 ?auto_20521 ) ) ( not ( = ?auto_20513 ?auto_20522 ) ) ( not ( = ?auto_20512 ?auto_20521 ) ) ( not ( = ?auto_20512 ?auto_20522 ) ) ( not ( = ?auto_20515 ?auto_20521 ) ) ( not ( = ?auto_20515 ?auto_20522 ) ) ( not ( = ?auto_20517 ?auto_20521 ) ) ( not ( = ?auto_20517 ?auto_20522 ) ) ( not ( = ?auto_20516 ?auto_20521 ) ) ( not ( = ?auto_20516 ?auto_20522 ) ) ( not ( = ?auto_20518 ?auto_20521 ) ) ( not ( = ?auto_20518 ?auto_20522 ) ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( not ( = ?auto_20520 ?auto_20522 ) ) ( not ( = ?auto_20521 ?auto_20550 ) ) ( not ( = ?auto_20521 ?auto_20539 ) ) ( not ( = ?auto_20521 ?auto_20546 ) ) ( not ( = ?auto_20521 ?auto_20543 ) ) ( not ( = ?auto_20521 ?auto_20537 ) ) ( not ( = ?auto_20521 ?auto_20531 ) ) ( not ( = ?auto_20521 ?auto_20558 ) ) ( not ( = ?auto_20521 ?auto_20553 ) ) ( not ( = ?auto_20521 ?auto_20548 ) ) ( not ( = ?auto_20521 ?auto_20557 ) ) ( not ( = ?auto_20521 ?auto_20545 ) ) ( not ( = ?auto_20521 ?auto_20535 ) ) ( not ( = ?auto_20521 ?auto_20555 ) ) ( not ( = ?auto_20521 ?auto_20540 ) ) ( not ( = ?auto_20523 ?auto_20544 ) ) ( not ( = ?auto_20523 ?auto_20547 ) ) ( not ( = ?auto_20523 ?auto_20541 ) ) ( not ( = ?auto_20523 ?auto_20556 ) ) ( not ( = ?auto_20523 ?auto_20549 ) ) ( not ( = ?auto_20523 ?auto_20552 ) ) ( not ( = ?auto_20523 ?auto_20538 ) ) ( not ( = ?auto_20523 ?auto_20528 ) ) ( not ( = ?auto_20523 ?auto_20532 ) ) ( not ( = ?auto_20524 ?auto_20534 ) ) ( not ( = ?auto_20524 ?auto_20529 ) ) ( not ( = ?auto_20524 ?auto_20559 ) ) ( not ( = ?auto_20524 ?auto_20542 ) ) ( not ( = ?auto_20524 ?auto_20536 ) ) ( not ( = ?auto_20524 ?auto_20530 ) ) ( not ( = ?auto_20524 ?auto_20551 ) ) ( not ( = ?auto_20524 ?auto_20554 ) ) ( not ( = ?auto_20524 ?auto_20533 ) ) ( not ( = ?auto_20522 ?auto_20550 ) ) ( not ( = ?auto_20522 ?auto_20539 ) ) ( not ( = ?auto_20522 ?auto_20546 ) ) ( not ( = ?auto_20522 ?auto_20543 ) ) ( not ( = ?auto_20522 ?auto_20537 ) ) ( not ( = ?auto_20522 ?auto_20531 ) ) ( not ( = ?auto_20522 ?auto_20558 ) ) ( not ( = ?auto_20522 ?auto_20553 ) ) ( not ( = ?auto_20522 ?auto_20548 ) ) ( not ( = ?auto_20522 ?auto_20557 ) ) ( not ( = ?auto_20522 ?auto_20545 ) ) ( not ( = ?auto_20522 ?auto_20535 ) ) ( not ( = ?auto_20522 ?auto_20555 ) ) ( not ( = ?auto_20522 ?auto_20540 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20509 ?auto_20510 ?auto_20511 ?auto_20514 ?auto_20513 ?auto_20512 ?auto_20515 ?auto_20517 ?auto_20516 ?auto_20518 ?auto_20520 ?auto_20519 )
      ( MAKE-1CRATE ?auto_20519 ?auto_20521 )
      ( MAKE-15CRATE-VERIFY ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20509 ?auto_20510 ?auto_20511 ?auto_20514 ?auto_20513 ?auto_20512 ?auto_20515 ?auto_20517 ?auto_20516 ?auto_20518 ?auto_20520 ?auto_20519 ?auto_20521 ) )
  )

)

