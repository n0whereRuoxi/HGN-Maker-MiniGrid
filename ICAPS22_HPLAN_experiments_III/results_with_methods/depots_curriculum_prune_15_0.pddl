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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19852 - SURFACE
      ?auto_19853 - SURFACE
      ?auto_19854 - SURFACE
    )
    :vars
    (
      ?auto_19855 - HOIST
      ?auto_19857 - PLACE
      ?auto_19859 - PLACE
      ?auto_19860 - HOIST
      ?auto_19856 - SURFACE
      ?auto_19861 - SURFACE
      ?auto_19858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19855 ?auto_19857 ) ( IS-CRATE ?auto_19854 ) ( not ( = ?auto_19859 ?auto_19857 ) ) ( HOIST-AT ?auto_19860 ?auto_19859 ) ( SURFACE-AT ?auto_19854 ?auto_19859 ) ( ON ?auto_19854 ?auto_19856 ) ( CLEAR ?auto_19854 ) ( not ( = ?auto_19853 ?auto_19854 ) ) ( not ( = ?auto_19853 ?auto_19856 ) ) ( not ( = ?auto_19854 ?auto_19856 ) ) ( not ( = ?auto_19855 ?auto_19860 ) ) ( SURFACE-AT ?auto_19852 ?auto_19857 ) ( CLEAR ?auto_19852 ) ( IS-CRATE ?auto_19853 ) ( AVAILABLE ?auto_19855 ) ( AVAILABLE ?auto_19860 ) ( SURFACE-AT ?auto_19853 ?auto_19859 ) ( ON ?auto_19853 ?auto_19861 ) ( CLEAR ?auto_19853 ) ( TRUCK-AT ?auto_19858 ?auto_19857 ) ( not ( = ?auto_19852 ?auto_19853 ) ) ( not ( = ?auto_19852 ?auto_19861 ) ) ( not ( = ?auto_19853 ?auto_19861 ) ) ( not ( = ?auto_19852 ?auto_19854 ) ) ( not ( = ?auto_19852 ?auto_19856 ) ) ( not ( = ?auto_19854 ?auto_19861 ) ) ( not ( = ?auto_19856 ?auto_19861 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19852 ?auto_19853 )
      ( MAKE-1CRATE ?auto_19853 ?auto_19854 )
      ( MAKE-2CRATE-VERIFY ?auto_19852 ?auto_19853 ?auto_19854 ) )
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
      ?auto_19882 - PLACE
      ?auto_19880 - PLACE
      ?auto_19884 - HOIST
      ?auto_19885 - SURFACE
      ?auto_19887 - SURFACE
      ?auto_19886 - SURFACE
      ?auto_19881 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19883 ?auto_19882 ) ( IS-CRATE ?auto_19879 ) ( not ( = ?auto_19880 ?auto_19882 ) ) ( HOIST-AT ?auto_19884 ?auto_19880 ) ( SURFACE-AT ?auto_19879 ?auto_19880 ) ( ON ?auto_19879 ?auto_19885 ) ( CLEAR ?auto_19879 ) ( not ( = ?auto_19878 ?auto_19879 ) ) ( not ( = ?auto_19878 ?auto_19885 ) ) ( not ( = ?auto_19879 ?auto_19885 ) ) ( not ( = ?auto_19883 ?auto_19884 ) ) ( IS-CRATE ?auto_19878 ) ( SURFACE-AT ?auto_19878 ?auto_19880 ) ( ON ?auto_19878 ?auto_19887 ) ( CLEAR ?auto_19878 ) ( not ( = ?auto_19877 ?auto_19878 ) ) ( not ( = ?auto_19877 ?auto_19887 ) ) ( not ( = ?auto_19878 ?auto_19887 ) ) ( SURFACE-AT ?auto_19876 ?auto_19882 ) ( CLEAR ?auto_19876 ) ( IS-CRATE ?auto_19877 ) ( AVAILABLE ?auto_19883 ) ( AVAILABLE ?auto_19884 ) ( SURFACE-AT ?auto_19877 ?auto_19880 ) ( ON ?auto_19877 ?auto_19886 ) ( CLEAR ?auto_19877 ) ( TRUCK-AT ?auto_19881 ?auto_19882 ) ( not ( = ?auto_19876 ?auto_19877 ) ) ( not ( = ?auto_19876 ?auto_19886 ) ) ( not ( = ?auto_19877 ?auto_19886 ) ) ( not ( = ?auto_19876 ?auto_19878 ) ) ( not ( = ?auto_19876 ?auto_19887 ) ) ( not ( = ?auto_19878 ?auto_19886 ) ) ( not ( = ?auto_19887 ?auto_19886 ) ) ( not ( = ?auto_19876 ?auto_19879 ) ) ( not ( = ?auto_19876 ?auto_19885 ) ) ( not ( = ?auto_19877 ?auto_19879 ) ) ( not ( = ?auto_19877 ?auto_19885 ) ) ( not ( = ?auto_19879 ?auto_19887 ) ) ( not ( = ?auto_19879 ?auto_19886 ) ) ( not ( = ?auto_19885 ?auto_19887 ) ) ( not ( = ?auto_19885 ?auto_19886 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19876 ?auto_19877 ?auto_19878 )
      ( MAKE-1CRATE ?auto_19878 ?auto_19879 )
      ( MAKE-3CRATE-VERIFY ?auto_19876 ?auto_19877 ?auto_19878 ?auto_19879 ) )
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
      ?auto_19910 - HOIST
      ?auto_19913 - PLACE
      ?auto_19912 - PLACE
      ?auto_19911 - HOIST
      ?auto_19909 - SURFACE
      ?auto_19914 - PLACE
      ?auto_19915 - HOIST
      ?auto_19917 - SURFACE
      ?auto_19918 - SURFACE
      ?auto_19916 - SURFACE
      ?auto_19908 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19910 ?auto_19913 ) ( IS-CRATE ?auto_19907 ) ( not ( = ?auto_19912 ?auto_19913 ) ) ( HOIST-AT ?auto_19911 ?auto_19912 ) ( AVAILABLE ?auto_19911 ) ( SURFACE-AT ?auto_19907 ?auto_19912 ) ( ON ?auto_19907 ?auto_19909 ) ( CLEAR ?auto_19907 ) ( not ( = ?auto_19906 ?auto_19907 ) ) ( not ( = ?auto_19906 ?auto_19909 ) ) ( not ( = ?auto_19907 ?auto_19909 ) ) ( not ( = ?auto_19910 ?auto_19911 ) ) ( IS-CRATE ?auto_19906 ) ( not ( = ?auto_19914 ?auto_19913 ) ) ( HOIST-AT ?auto_19915 ?auto_19914 ) ( SURFACE-AT ?auto_19906 ?auto_19914 ) ( ON ?auto_19906 ?auto_19917 ) ( CLEAR ?auto_19906 ) ( not ( = ?auto_19905 ?auto_19906 ) ) ( not ( = ?auto_19905 ?auto_19917 ) ) ( not ( = ?auto_19906 ?auto_19917 ) ) ( not ( = ?auto_19910 ?auto_19915 ) ) ( IS-CRATE ?auto_19905 ) ( SURFACE-AT ?auto_19905 ?auto_19914 ) ( ON ?auto_19905 ?auto_19918 ) ( CLEAR ?auto_19905 ) ( not ( = ?auto_19904 ?auto_19905 ) ) ( not ( = ?auto_19904 ?auto_19918 ) ) ( not ( = ?auto_19905 ?auto_19918 ) ) ( SURFACE-AT ?auto_19903 ?auto_19913 ) ( CLEAR ?auto_19903 ) ( IS-CRATE ?auto_19904 ) ( AVAILABLE ?auto_19910 ) ( AVAILABLE ?auto_19915 ) ( SURFACE-AT ?auto_19904 ?auto_19914 ) ( ON ?auto_19904 ?auto_19916 ) ( CLEAR ?auto_19904 ) ( TRUCK-AT ?auto_19908 ?auto_19913 ) ( not ( = ?auto_19903 ?auto_19904 ) ) ( not ( = ?auto_19903 ?auto_19916 ) ) ( not ( = ?auto_19904 ?auto_19916 ) ) ( not ( = ?auto_19903 ?auto_19905 ) ) ( not ( = ?auto_19903 ?auto_19918 ) ) ( not ( = ?auto_19905 ?auto_19916 ) ) ( not ( = ?auto_19918 ?auto_19916 ) ) ( not ( = ?auto_19903 ?auto_19906 ) ) ( not ( = ?auto_19903 ?auto_19917 ) ) ( not ( = ?auto_19904 ?auto_19906 ) ) ( not ( = ?auto_19904 ?auto_19917 ) ) ( not ( = ?auto_19906 ?auto_19918 ) ) ( not ( = ?auto_19906 ?auto_19916 ) ) ( not ( = ?auto_19917 ?auto_19918 ) ) ( not ( = ?auto_19917 ?auto_19916 ) ) ( not ( = ?auto_19903 ?auto_19907 ) ) ( not ( = ?auto_19903 ?auto_19909 ) ) ( not ( = ?auto_19904 ?auto_19907 ) ) ( not ( = ?auto_19904 ?auto_19909 ) ) ( not ( = ?auto_19905 ?auto_19907 ) ) ( not ( = ?auto_19905 ?auto_19909 ) ) ( not ( = ?auto_19907 ?auto_19917 ) ) ( not ( = ?auto_19907 ?auto_19918 ) ) ( not ( = ?auto_19907 ?auto_19916 ) ) ( not ( = ?auto_19912 ?auto_19914 ) ) ( not ( = ?auto_19911 ?auto_19915 ) ) ( not ( = ?auto_19909 ?auto_19917 ) ) ( not ( = ?auto_19909 ?auto_19918 ) ) ( not ( = ?auto_19909 ?auto_19916 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_19903 ?auto_19904 ?auto_19905 ?auto_19906 )
      ( MAKE-1CRATE ?auto_19906 ?auto_19907 )
      ( MAKE-4CRATE-VERIFY ?auto_19903 ?auto_19904 ?auto_19905 ?auto_19906 ?auto_19907 ) )
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
      ?auto_19941 - HOIST
      ?auto_19943 - PLACE
      ?auto_19942 - PLACE
      ?auto_19944 - HOIST
      ?auto_19946 - SURFACE
      ?auto_19952 - PLACE
      ?auto_19951 - HOIST
      ?auto_19949 - SURFACE
      ?auto_19953 - PLACE
      ?auto_19950 - HOIST
      ?auto_19947 - SURFACE
      ?auto_19954 - SURFACE
      ?auto_19948 - SURFACE
      ?auto_19945 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19941 ?auto_19943 ) ( IS-CRATE ?auto_19940 ) ( not ( = ?auto_19942 ?auto_19943 ) ) ( HOIST-AT ?auto_19944 ?auto_19942 ) ( AVAILABLE ?auto_19944 ) ( SURFACE-AT ?auto_19940 ?auto_19942 ) ( ON ?auto_19940 ?auto_19946 ) ( CLEAR ?auto_19940 ) ( not ( = ?auto_19939 ?auto_19940 ) ) ( not ( = ?auto_19939 ?auto_19946 ) ) ( not ( = ?auto_19940 ?auto_19946 ) ) ( not ( = ?auto_19941 ?auto_19944 ) ) ( IS-CRATE ?auto_19939 ) ( not ( = ?auto_19952 ?auto_19943 ) ) ( HOIST-AT ?auto_19951 ?auto_19952 ) ( AVAILABLE ?auto_19951 ) ( SURFACE-AT ?auto_19939 ?auto_19952 ) ( ON ?auto_19939 ?auto_19949 ) ( CLEAR ?auto_19939 ) ( not ( = ?auto_19938 ?auto_19939 ) ) ( not ( = ?auto_19938 ?auto_19949 ) ) ( not ( = ?auto_19939 ?auto_19949 ) ) ( not ( = ?auto_19941 ?auto_19951 ) ) ( IS-CRATE ?auto_19938 ) ( not ( = ?auto_19953 ?auto_19943 ) ) ( HOIST-AT ?auto_19950 ?auto_19953 ) ( SURFACE-AT ?auto_19938 ?auto_19953 ) ( ON ?auto_19938 ?auto_19947 ) ( CLEAR ?auto_19938 ) ( not ( = ?auto_19937 ?auto_19938 ) ) ( not ( = ?auto_19937 ?auto_19947 ) ) ( not ( = ?auto_19938 ?auto_19947 ) ) ( not ( = ?auto_19941 ?auto_19950 ) ) ( IS-CRATE ?auto_19937 ) ( SURFACE-AT ?auto_19937 ?auto_19953 ) ( ON ?auto_19937 ?auto_19954 ) ( CLEAR ?auto_19937 ) ( not ( = ?auto_19936 ?auto_19937 ) ) ( not ( = ?auto_19936 ?auto_19954 ) ) ( not ( = ?auto_19937 ?auto_19954 ) ) ( SURFACE-AT ?auto_19935 ?auto_19943 ) ( CLEAR ?auto_19935 ) ( IS-CRATE ?auto_19936 ) ( AVAILABLE ?auto_19941 ) ( AVAILABLE ?auto_19950 ) ( SURFACE-AT ?auto_19936 ?auto_19953 ) ( ON ?auto_19936 ?auto_19948 ) ( CLEAR ?auto_19936 ) ( TRUCK-AT ?auto_19945 ?auto_19943 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19948 ) ) ( not ( = ?auto_19936 ?auto_19948 ) ) ( not ( = ?auto_19935 ?auto_19937 ) ) ( not ( = ?auto_19935 ?auto_19954 ) ) ( not ( = ?auto_19937 ?auto_19948 ) ) ( not ( = ?auto_19954 ?auto_19948 ) ) ( not ( = ?auto_19935 ?auto_19938 ) ) ( not ( = ?auto_19935 ?auto_19947 ) ) ( not ( = ?auto_19936 ?auto_19938 ) ) ( not ( = ?auto_19936 ?auto_19947 ) ) ( not ( = ?auto_19938 ?auto_19954 ) ) ( not ( = ?auto_19938 ?auto_19948 ) ) ( not ( = ?auto_19947 ?auto_19954 ) ) ( not ( = ?auto_19947 ?auto_19948 ) ) ( not ( = ?auto_19935 ?auto_19939 ) ) ( not ( = ?auto_19935 ?auto_19949 ) ) ( not ( = ?auto_19936 ?auto_19939 ) ) ( not ( = ?auto_19936 ?auto_19949 ) ) ( not ( = ?auto_19937 ?auto_19939 ) ) ( not ( = ?auto_19937 ?auto_19949 ) ) ( not ( = ?auto_19939 ?auto_19947 ) ) ( not ( = ?auto_19939 ?auto_19954 ) ) ( not ( = ?auto_19939 ?auto_19948 ) ) ( not ( = ?auto_19952 ?auto_19953 ) ) ( not ( = ?auto_19951 ?auto_19950 ) ) ( not ( = ?auto_19949 ?auto_19947 ) ) ( not ( = ?auto_19949 ?auto_19954 ) ) ( not ( = ?auto_19949 ?auto_19948 ) ) ( not ( = ?auto_19935 ?auto_19940 ) ) ( not ( = ?auto_19935 ?auto_19946 ) ) ( not ( = ?auto_19936 ?auto_19940 ) ) ( not ( = ?auto_19936 ?auto_19946 ) ) ( not ( = ?auto_19937 ?auto_19940 ) ) ( not ( = ?auto_19937 ?auto_19946 ) ) ( not ( = ?auto_19938 ?auto_19940 ) ) ( not ( = ?auto_19938 ?auto_19946 ) ) ( not ( = ?auto_19940 ?auto_19949 ) ) ( not ( = ?auto_19940 ?auto_19947 ) ) ( not ( = ?auto_19940 ?auto_19954 ) ) ( not ( = ?auto_19940 ?auto_19948 ) ) ( not ( = ?auto_19942 ?auto_19952 ) ) ( not ( = ?auto_19942 ?auto_19953 ) ) ( not ( = ?auto_19944 ?auto_19951 ) ) ( not ( = ?auto_19944 ?auto_19950 ) ) ( not ( = ?auto_19946 ?auto_19949 ) ) ( not ( = ?auto_19946 ?auto_19947 ) ) ( not ( = ?auto_19946 ?auto_19954 ) ) ( not ( = ?auto_19946 ?auto_19948 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 ?auto_19939 )
      ( MAKE-1CRATE ?auto_19939 ?auto_19940 )
      ( MAKE-5CRATE-VERIFY ?auto_19935 ?auto_19936 ?auto_19937 ?auto_19938 ?auto_19939 ?auto_19940 ) )
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
      ?auto_19983 - HOIST
      ?auto_19982 - PLACE
      ?auto_19981 - PLACE
      ?auto_19980 - HOIST
      ?auto_19984 - SURFACE
      ?auto_19993 - PLACE
      ?auto_19995 - HOIST
      ?auto_19985 - SURFACE
      ?auto_19991 - PLACE
      ?auto_19994 - HOIST
      ?auto_19988 - SURFACE
      ?auto_19990 - PLACE
      ?auto_19987 - HOIST
      ?auto_19992 - SURFACE
      ?auto_19989 - SURFACE
      ?auto_19986 - SURFACE
      ?auto_19979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19983 ?auto_19982 ) ( IS-CRATE ?auto_19978 ) ( not ( = ?auto_19981 ?auto_19982 ) ) ( HOIST-AT ?auto_19980 ?auto_19981 ) ( AVAILABLE ?auto_19980 ) ( SURFACE-AT ?auto_19978 ?auto_19981 ) ( ON ?auto_19978 ?auto_19984 ) ( CLEAR ?auto_19978 ) ( not ( = ?auto_19977 ?auto_19978 ) ) ( not ( = ?auto_19977 ?auto_19984 ) ) ( not ( = ?auto_19978 ?auto_19984 ) ) ( not ( = ?auto_19983 ?auto_19980 ) ) ( IS-CRATE ?auto_19977 ) ( not ( = ?auto_19993 ?auto_19982 ) ) ( HOIST-AT ?auto_19995 ?auto_19993 ) ( AVAILABLE ?auto_19995 ) ( SURFACE-AT ?auto_19977 ?auto_19993 ) ( ON ?auto_19977 ?auto_19985 ) ( CLEAR ?auto_19977 ) ( not ( = ?auto_19976 ?auto_19977 ) ) ( not ( = ?auto_19976 ?auto_19985 ) ) ( not ( = ?auto_19977 ?auto_19985 ) ) ( not ( = ?auto_19983 ?auto_19995 ) ) ( IS-CRATE ?auto_19976 ) ( not ( = ?auto_19991 ?auto_19982 ) ) ( HOIST-AT ?auto_19994 ?auto_19991 ) ( AVAILABLE ?auto_19994 ) ( SURFACE-AT ?auto_19976 ?auto_19991 ) ( ON ?auto_19976 ?auto_19988 ) ( CLEAR ?auto_19976 ) ( not ( = ?auto_19975 ?auto_19976 ) ) ( not ( = ?auto_19975 ?auto_19988 ) ) ( not ( = ?auto_19976 ?auto_19988 ) ) ( not ( = ?auto_19983 ?auto_19994 ) ) ( IS-CRATE ?auto_19975 ) ( not ( = ?auto_19990 ?auto_19982 ) ) ( HOIST-AT ?auto_19987 ?auto_19990 ) ( SURFACE-AT ?auto_19975 ?auto_19990 ) ( ON ?auto_19975 ?auto_19992 ) ( CLEAR ?auto_19975 ) ( not ( = ?auto_19974 ?auto_19975 ) ) ( not ( = ?auto_19974 ?auto_19992 ) ) ( not ( = ?auto_19975 ?auto_19992 ) ) ( not ( = ?auto_19983 ?auto_19987 ) ) ( IS-CRATE ?auto_19974 ) ( SURFACE-AT ?auto_19974 ?auto_19990 ) ( ON ?auto_19974 ?auto_19989 ) ( CLEAR ?auto_19974 ) ( not ( = ?auto_19973 ?auto_19974 ) ) ( not ( = ?auto_19973 ?auto_19989 ) ) ( not ( = ?auto_19974 ?auto_19989 ) ) ( SURFACE-AT ?auto_19972 ?auto_19982 ) ( CLEAR ?auto_19972 ) ( IS-CRATE ?auto_19973 ) ( AVAILABLE ?auto_19983 ) ( AVAILABLE ?auto_19987 ) ( SURFACE-AT ?auto_19973 ?auto_19990 ) ( ON ?auto_19973 ?auto_19986 ) ( CLEAR ?auto_19973 ) ( TRUCK-AT ?auto_19979 ?auto_19982 ) ( not ( = ?auto_19972 ?auto_19973 ) ) ( not ( = ?auto_19972 ?auto_19986 ) ) ( not ( = ?auto_19973 ?auto_19986 ) ) ( not ( = ?auto_19972 ?auto_19974 ) ) ( not ( = ?auto_19972 ?auto_19989 ) ) ( not ( = ?auto_19974 ?auto_19986 ) ) ( not ( = ?auto_19989 ?auto_19986 ) ) ( not ( = ?auto_19972 ?auto_19975 ) ) ( not ( = ?auto_19972 ?auto_19992 ) ) ( not ( = ?auto_19973 ?auto_19975 ) ) ( not ( = ?auto_19973 ?auto_19992 ) ) ( not ( = ?auto_19975 ?auto_19989 ) ) ( not ( = ?auto_19975 ?auto_19986 ) ) ( not ( = ?auto_19992 ?auto_19989 ) ) ( not ( = ?auto_19992 ?auto_19986 ) ) ( not ( = ?auto_19972 ?auto_19976 ) ) ( not ( = ?auto_19972 ?auto_19988 ) ) ( not ( = ?auto_19973 ?auto_19976 ) ) ( not ( = ?auto_19973 ?auto_19988 ) ) ( not ( = ?auto_19974 ?auto_19976 ) ) ( not ( = ?auto_19974 ?auto_19988 ) ) ( not ( = ?auto_19976 ?auto_19992 ) ) ( not ( = ?auto_19976 ?auto_19989 ) ) ( not ( = ?auto_19976 ?auto_19986 ) ) ( not ( = ?auto_19991 ?auto_19990 ) ) ( not ( = ?auto_19994 ?auto_19987 ) ) ( not ( = ?auto_19988 ?auto_19992 ) ) ( not ( = ?auto_19988 ?auto_19989 ) ) ( not ( = ?auto_19988 ?auto_19986 ) ) ( not ( = ?auto_19972 ?auto_19977 ) ) ( not ( = ?auto_19972 ?auto_19985 ) ) ( not ( = ?auto_19973 ?auto_19977 ) ) ( not ( = ?auto_19973 ?auto_19985 ) ) ( not ( = ?auto_19974 ?auto_19977 ) ) ( not ( = ?auto_19974 ?auto_19985 ) ) ( not ( = ?auto_19975 ?auto_19977 ) ) ( not ( = ?auto_19975 ?auto_19985 ) ) ( not ( = ?auto_19977 ?auto_19988 ) ) ( not ( = ?auto_19977 ?auto_19992 ) ) ( not ( = ?auto_19977 ?auto_19989 ) ) ( not ( = ?auto_19977 ?auto_19986 ) ) ( not ( = ?auto_19993 ?auto_19991 ) ) ( not ( = ?auto_19993 ?auto_19990 ) ) ( not ( = ?auto_19995 ?auto_19994 ) ) ( not ( = ?auto_19995 ?auto_19987 ) ) ( not ( = ?auto_19985 ?auto_19988 ) ) ( not ( = ?auto_19985 ?auto_19992 ) ) ( not ( = ?auto_19985 ?auto_19989 ) ) ( not ( = ?auto_19985 ?auto_19986 ) ) ( not ( = ?auto_19972 ?auto_19978 ) ) ( not ( = ?auto_19972 ?auto_19984 ) ) ( not ( = ?auto_19973 ?auto_19978 ) ) ( not ( = ?auto_19973 ?auto_19984 ) ) ( not ( = ?auto_19974 ?auto_19978 ) ) ( not ( = ?auto_19974 ?auto_19984 ) ) ( not ( = ?auto_19975 ?auto_19978 ) ) ( not ( = ?auto_19975 ?auto_19984 ) ) ( not ( = ?auto_19976 ?auto_19978 ) ) ( not ( = ?auto_19976 ?auto_19984 ) ) ( not ( = ?auto_19978 ?auto_19985 ) ) ( not ( = ?auto_19978 ?auto_19988 ) ) ( not ( = ?auto_19978 ?auto_19992 ) ) ( not ( = ?auto_19978 ?auto_19989 ) ) ( not ( = ?auto_19978 ?auto_19986 ) ) ( not ( = ?auto_19981 ?auto_19993 ) ) ( not ( = ?auto_19981 ?auto_19991 ) ) ( not ( = ?auto_19981 ?auto_19990 ) ) ( not ( = ?auto_19980 ?auto_19995 ) ) ( not ( = ?auto_19980 ?auto_19994 ) ) ( not ( = ?auto_19980 ?auto_19987 ) ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( not ( = ?auto_19984 ?auto_19988 ) ) ( not ( = ?auto_19984 ?auto_19992 ) ) ( not ( = ?auto_19984 ?auto_19989 ) ) ( not ( = ?auto_19984 ?auto_19986 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19975 ?auto_19976 ?auto_19977 )
      ( MAKE-1CRATE ?auto_19977 ?auto_19978 )
      ( MAKE-6CRATE-VERIFY ?auto_19972 ?auto_19973 ?auto_19974 ?auto_19975 ?auto_19976 ?auto_19977 ?auto_19978 ) )
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
      ?auto_20020 - SURFACE
      ?auto_20021 - SURFACE
    )
    :vars
    (
      ?auto_20027 - HOIST
      ?auto_20026 - PLACE
      ?auto_20024 - PLACE
      ?auto_20022 - HOIST
      ?auto_20025 - SURFACE
      ?auto_20039 - PLACE
      ?auto_20031 - HOIST
      ?auto_20041 - SURFACE
      ?auto_20037 - PLACE
      ?auto_20038 - HOIST
      ?auto_20036 - SURFACE
      ?auto_20033 - PLACE
      ?auto_20040 - HOIST
      ?auto_20028 - SURFACE
      ?auto_20034 - PLACE
      ?auto_20030 - HOIST
      ?auto_20032 - SURFACE
      ?auto_20035 - SURFACE
      ?auto_20029 - SURFACE
      ?auto_20023 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20027 ?auto_20026 ) ( IS-CRATE ?auto_20021 ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( HOIST-AT ?auto_20022 ?auto_20024 ) ( AVAILABLE ?auto_20022 ) ( SURFACE-AT ?auto_20021 ?auto_20024 ) ( ON ?auto_20021 ?auto_20025 ) ( CLEAR ?auto_20021 ) ( not ( = ?auto_20020 ?auto_20021 ) ) ( not ( = ?auto_20020 ?auto_20025 ) ) ( not ( = ?auto_20021 ?auto_20025 ) ) ( not ( = ?auto_20027 ?auto_20022 ) ) ( IS-CRATE ?auto_20020 ) ( not ( = ?auto_20039 ?auto_20026 ) ) ( HOIST-AT ?auto_20031 ?auto_20039 ) ( AVAILABLE ?auto_20031 ) ( SURFACE-AT ?auto_20020 ?auto_20039 ) ( ON ?auto_20020 ?auto_20041 ) ( CLEAR ?auto_20020 ) ( not ( = ?auto_20019 ?auto_20020 ) ) ( not ( = ?auto_20019 ?auto_20041 ) ) ( not ( = ?auto_20020 ?auto_20041 ) ) ( not ( = ?auto_20027 ?auto_20031 ) ) ( IS-CRATE ?auto_20019 ) ( not ( = ?auto_20037 ?auto_20026 ) ) ( HOIST-AT ?auto_20038 ?auto_20037 ) ( AVAILABLE ?auto_20038 ) ( SURFACE-AT ?auto_20019 ?auto_20037 ) ( ON ?auto_20019 ?auto_20036 ) ( CLEAR ?auto_20019 ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( not ( = ?auto_20018 ?auto_20036 ) ) ( not ( = ?auto_20019 ?auto_20036 ) ) ( not ( = ?auto_20027 ?auto_20038 ) ) ( IS-CRATE ?auto_20018 ) ( not ( = ?auto_20033 ?auto_20026 ) ) ( HOIST-AT ?auto_20040 ?auto_20033 ) ( AVAILABLE ?auto_20040 ) ( SURFACE-AT ?auto_20018 ?auto_20033 ) ( ON ?auto_20018 ?auto_20028 ) ( CLEAR ?auto_20018 ) ( not ( = ?auto_20017 ?auto_20018 ) ) ( not ( = ?auto_20017 ?auto_20028 ) ) ( not ( = ?auto_20018 ?auto_20028 ) ) ( not ( = ?auto_20027 ?auto_20040 ) ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20034 ?auto_20026 ) ) ( HOIST-AT ?auto_20030 ?auto_20034 ) ( SURFACE-AT ?auto_20017 ?auto_20034 ) ( ON ?auto_20017 ?auto_20032 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20032 ) ) ( not ( = ?auto_20017 ?auto_20032 ) ) ( not ( = ?auto_20027 ?auto_20030 ) ) ( IS-CRATE ?auto_20016 ) ( SURFACE-AT ?auto_20016 ?auto_20034 ) ( ON ?auto_20016 ?auto_20035 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20015 ?auto_20016 ) ) ( not ( = ?auto_20015 ?auto_20035 ) ) ( not ( = ?auto_20016 ?auto_20035 ) ) ( SURFACE-AT ?auto_20014 ?auto_20026 ) ( CLEAR ?auto_20014 ) ( IS-CRATE ?auto_20015 ) ( AVAILABLE ?auto_20027 ) ( AVAILABLE ?auto_20030 ) ( SURFACE-AT ?auto_20015 ?auto_20034 ) ( ON ?auto_20015 ?auto_20029 ) ( CLEAR ?auto_20015 ) ( TRUCK-AT ?auto_20023 ?auto_20026 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20029 ) ) ( not ( = ?auto_20015 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20035 ) ) ( not ( = ?auto_20016 ?auto_20029 ) ) ( not ( = ?auto_20035 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20032 ) ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20032 ) ) ( not ( = ?auto_20017 ?auto_20035 ) ) ( not ( = ?auto_20017 ?auto_20029 ) ) ( not ( = ?auto_20032 ?auto_20035 ) ) ( not ( = ?auto_20032 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20018 ) ) ( not ( = ?auto_20014 ?auto_20028 ) ) ( not ( = ?auto_20015 ?auto_20018 ) ) ( not ( = ?auto_20015 ?auto_20028 ) ) ( not ( = ?auto_20016 ?auto_20018 ) ) ( not ( = ?auto_20016 ?auto_20028 ) ) ( not ( = ?auto_20018 ?auto_20032 ) ) ( not ( = ?auto_20018 ?auto_20035 ) ) ( not ( = ?auto_20018 ?auto_20029 ) ) ( not ( = ?auto_20033 ?auto_20034 ) ) ( not ( = ?auto_20040 ?auto_20030 ) ) ( not ( = ?auto_20028 ?auto_20032 ) ) ( not ( = ?auto_20028 ?auto_20035 ) ) ( not ( = ?auto_20028 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20019 ) ) ( not ( = ?auto_20014 ?auto_20036 ) ) ( not ( = ?auto_20015 ?auto_20019 ) ) ( not ( = ?auto_20015 ?auto_20036 ) ) ( not ( = ?auto_20016 ?auto_20019 ) ) ( not ( = ?auto_20016 ?auto_20036 ) ) ( not ( = ?auto_20017 ?auto_20019 ) ) ( not ( = ?auto_20017 ?auto_20036 ) ) ( not ( = ?auto_20019 ?auto_20028 ) ) ( not ( = ?auto_20019 ?auto_20032 ) ) ( not ( = ?auto_20019 ?auto_20035 ) ) ( not ( = ?auto_20019 ?auto_20029 ) ) ( not ( = ?auto_20037 ?auto_20033 ) ) ( not ( = ?auto_20037 ?auto_20034 ) ) ( not ( = ?auto_20038 ?auto_20040 ) ) ( not ( = ?auto_20038 ?auto_20030 ) ) ( not ( = ?auto_20036 ?auto_20028 ) ) ( not ( = ?auto_20036 ?auto_20032 ) ) ( not ( = ?auto_20036 ?auto_20035 ) ) ( not ( = ?auto_20036 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20020 ) ) ( not ( = ?auto_20014 ?auto_20041 ) ) ( not ( = ?auto_20015 ?auto_20020 ) ) ( not ( = ?auto_20015 ?auto_20041 ) ) ( not ( = ?auto_20016 ?auto_20020 ) ) ( not ( = ?auto_20016 ?auto_20041 ) ) ( not ( = ?auto_20017 ?auto_20020 ) ) ( not ( = ?auto_20017 ?auto_20041 ) ) ( not ( = ?auto_20018 ?auto_20020 ) ) ( not ( = ?auto_20018 ?auto_20041 ) ) ( not ( = ?auto_20020 ?auto_20036 ) ) ( not ( = ?auto_20020 ?auto_20028 ) ) ( not ( = ?auto_20020 ?auto_20032 ) ) ( not ( = ?auto_20020 ?auto_20035 ) ) ( not ( = ?auto_20020 ?auto_20029 ) ) ( not ( = ?auto_20039 ?auto_20037 ) ) ( not ( = ?auto_20039 ?auto_20033 ) ) ( not ( = ?auto_20039 ?auto_20034 ) ) ( not ( = ?auto_20031 ?auto_20038 ) ) ( not ( = ?auto_20031 ?auto_20040 ) ) ( not ( = ?auto_20031 ?auto_20030 ) ) ( not ( = ?auto_20041 ?auto_20036 ) ) ( not ( = ?auto_20041 ?auto_20028 ) ) ( not ( = ?auto_20041 ?auto_20032 ) ) ( not ( = ?auto_20041 ?auto_20035 ) ) ( not ( = ?auto_20041 ?auto_20029 ) ) ( not ( = ?auto_20014 ?auto_20021 ) ) ( not ( = ?auto_20014 ?auto_20025 ) ) ( not ( = ?auto_20015 ?auto_20021 ) ) ( not ( = ?auto_20015 ?auto_20025 ) ) ( not ( = ?auto_20016 ?auto_20021 ) ) ( not ( = ?auto_20016 ?auto_20025 ) ) ( not ( = ?auto_20017 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20025 ) ) ( not ( = ?auto_20018 ?auto_20021 ) ) ( not ( = ?auto_20018 ?auto_20025 ) ) ( not ( = ?auto_20019 ?auto_20021 ) ) ( not ( = ?auto_20019 ?auto_20025 ) ) ( not ( = ?auto_20021 ?auto_20041 ) ) ( not ( = ?auto_20021 ?auto_20036 ) ) ( not ( = ?auto_20021 ?auto_20028 ) ) ( not ( = ?auto_20021 ?auto_20032 ) ) ( not ( = ?auto_20021 ?auto_20035 ) ) ( not ( = ?auto_20021 ?auto_20029 ) ) ( not ( = ?auto_20024 ?auto_20039 ) ) ( not ( = ?auto_20024 ?auto_20037 ) ) ( not ( = ?auto_20024 ?auto_20033 ) ) ( not ( = ?auto_20024 ?auto_20034 ) ) ( not ( = ?auto_20022 ?auto_20031 ) ) ( not ( = ?auto_20022 ?auto_20038 ) ) ( not ( = ?auto_20022 ?auto_20040 ) ) ( not ( = ?auto_20022 ?auto_20030 ) ) ( not ( = ?auto_20025 ?auto_20041 ) ) ( not ( = ?auto_20025 ?auto_20036 ) ) ( not ( = ?auto_20025 ?auto_20028 ) ) ( not ( = ?auto_20025 ?auto_20032 ) ) ( not ( = ?auto_20025 ?auto_20035 ) ) ( not ( = ?auto_20025 ?auto_20029 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20020 )
      ( MAKE-1CRATE ?auto_20020 ?auto_20021 )
      ( MAKE-7CRATE-VERIFY ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ?auto_20018 ?auto_20019 ?auto_20020 ?auto_20021 ) )
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
      ?auto_20067 - SURFACE
      ?auto_20068 - SURFACE
      ?auto_20069 - SURFACE
    )
    :vars
    (
      ?auto_20070 - HOIST
      ?auto_20072 - PLACE
      ?auto_20075 - PLACE
      ?auto_20074 - HOIST
      ?auto_20073 - SURFACE
      ?auto_20092 - PLACE
      ?auto_20086 - HOIST
      ?auto_20091 - SURFACE
      ?auto_20077 - PLACE
      ?auto_20085 - HOIST
      ?auto_20079 - SURFACE
      ?auto_20088 - PLACE
      ?auto_20076 - HOIST
      ?auto_20089 - SURFACE
      ?auto_20082 - PLACE
      ?auto_20078 - HOIST
      ?auto_20087 - SURFACE
      ?auto_20081 - PLACE
      ?auto_20090 - HOIST
      ?auto_20083 - SURFACE
      ?auto_20080 - SURFACE
      ?auto_20084 - SURFACE
      ?auto_20071 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20070 ?auto_20072 ) ( IS-CRATE ?auto_20069 ) ( not ( = ?auto_20075 ?auto_20072 ) ) ( HOIST-AT ?auto_20074 ?auto_20075 ) ( AVAILABLE ?auto_20074 ) ( SURFACE-AT ?auto_20069 ?auto_20075 ) ( ON ?auto_20069 ?auto_20073 ) ( CLEAR ?auto_20069 ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( not ( = ?auto_20068 ?auto_20073 ) ) ( not ( = ?auto_20069 ?auto_20073 ) ) ( not ( = ?auto_20070 ?auto_20074 ) ) ( IS-CRATE ?auto_20068 ) ( not ( = ?auto_20092 ?auto_20072 ) ) ( HOIST-AT ?auto_20086 ?auto_20092 ) ( AVAILABLE ?auto_20086 ) ( SURFACE-AT ?auto_20068 ?auto_20092 ) ( ON ?auto_20068 ?auto_20091 ) ( CLEAR ?auto_20068 ) ( not ( = ?auto_20067 ?auto_20068 ) ) ( not ( = ?auto_20067 ?auto_20091 ) ) ( not ( = ?auto_20068 ?auto_20091 ) ) ( not ( = ?auto_20070 ?auto_20086 ) ) ( IS-CRATE ?auto_20067 ) ( not ( = ?auto_20077 ?auto_20072 ) ) ( HOIST-AT ?auto_20085 ?auto_20077 ) ( AVAILABLE ?auto_20085 ) ( SURFACE-AT ?auto_20067 ?auto_20077 ) ( ON ?auto_20067 ?auto_20079 ) ( CLEAR ?auto_20067 ) ( not ( = ?auto_20066 ?auto_20067 ) ) ( not ( = ?auto_20066 ?auto_20079 ) ) ( not ( = ?auto_20067 ?auto_20079 ) ) ( not ( = ?auto_20070 ?auto_20085 ) ) ( IS-CRATE ?auto_20066 ) ( not ( = ?auto_20088 ?auto_20072 ) ) ( HOIST-AT ?auto_20076 ?auto_20088 ) ( AVAILABLE ?auto_20076 ) ( SURFACE-AT ?auto_20066 ?auto_20088 ) ( ON ?auto_20066 ?auto_20089 ) ( CLEAR ?auto_20066 ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20089 ) ) ( not ( = ?auto_20066 ?auto_20089 ) ) ( not ( = ?auto_20070 ?auto_20076 ) ) ( IS-CRATE ?auto_20065 ) ( not ( = ?auto_20082 ?auto_20072 ) ) ( HOIST-AT ?auto_20078 ?auto_20082 ) ( AVAILABLE ?auto_20078 ) ( SURFACE-AT ?auto_20065 ?auto_20082 ) ( ON ?auto_20065 ?auto_20087 ) ( CLEAR ?auto_20065 ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20087 ) ) ( not ( = ?auto_20065 ?auto_20087 ) ) ( not ( = ?auto_20070 ?auto_20078 ) ) ( IS-CRATE ?auto_20064 ) ( not ( = ?auto_20081 ?auto_20072 ) ) ( HOIST-AT ?auto_20090 ?auto_20081 ) ( SURFACE-AT ?auto_20064 ?auto_20081 ) ( ON ?auto_20064 ?auto_20083 ) ( CLEAR ?auto_20064 ) ( not ( = ?auto_20063 ?auto_20064 ) ) ( not ( = ?auto_20063 ?auto_20083 ) ) ( not ( = ?auto_20064 ?auto_20083 ) ) ( not ( = ?auto_20070 ?auto_20090 ) ) ( IS-CRATE ?auto_20063 ) ( SURFACE-AT ?auto_20063 ?auto_20081 ) ( ON ?auto_20063 ?auto_20080 ) ( CLEAR ?auto_20063 ) ( not ( = ?auto_20062 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20080 ) ) ( not ( = ?auto_20063 ?auto_20080 ) ) ( SURFACE-AT ?auto_20061 ?auto_20072 ) ( CLEAR ?auto_20061 ) ( IS-CRATE ?auto_20062 ) ( AVAILABLE ?auto_20070 ) ( AVAILABLE ?auto_20090 ) ( SURFACE-AT ?auto_20062 ?auto_20081 ) ( ON ?auto_20062 ?auto_20084 ) ( CLEAR ?auto_20062 ) ( TRUCK-AT ?auto_20071 ?auto_20072 ) ( not ( = ?auto_20061 ?auto_20062 ) ) ( not ( = ?auto_20061 ?auto_20084 ) ) ( not ( = ?auto_20062 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20080 ) ) ( not ( = ?auto_20063 ?auto_20084 ) ) ( not ( = ?auto_20080 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20064 ) ) ( not ( = ?auto_20061 ?auto_20083 ) ) ( not ( = ?auto_20062 ?auto_20064 ) ) ( not ( = ?auto_20062 ?auto_20083 ) ) ( not ( = ?auto_20064 ?auto_20080 ) ) ( not ( = ?auto_20064 ?auto_20084 ) ) ( not ( = ?auto_20083 ?auto_20080 ) ) ( not ( = ?auto_20083 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20065 ) ) ( not ( = ?auto_20061 ?auto_20087 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20087 ) ) ( not ( = ?auto_20063 ?auto_20065 ) ) ( not ( = ?auto_20063 ?auto_20087 ) ) ( not ( = ?auto_20065 ?auto_20083 ) ) ( not ( = ?auto_20065 ?auto_20080 ) ) ( not ( = ?auto_20065 ?auto_20084 ) ) ( not ( = ?auto_20082 ?auto_20081 ) ) ( not ( = ?auto_20078 ?auto_20090 ) ) ( not ( = ?auto_20087 ?auto_20083 ) ) ( not ( = ?auto_20087 ?auto_20080 ) ) ( not ( = ?auto_20087 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20066 ) ) ( not ( = ?auto_20061 ?auto_20089 ) ) ( not ( = ?auto_20062 ?auto_20066 ) ) ( not ( = ?auto_20062 ?auto_20089 ) ) ( not ( = ?auto_20063 ?auto_20066 ) ) ( not ( = ?auto_20063 ?auto_20089 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20089 ) ) ( not ( = ?auto_20066 ?auto_20087 ) ) ( not ( = ?auto_20066 ?auto_20083 ) ) ( not ( = ?auto_20066 ?auto_20080 ) ) ( not ( = ?auto_20066 ?auto_20084 ) ) ( not ( = ?auto_20088 ?auto_20082 ) ) ( not ( = ?auto_20088 ?auto_20081 ) ) ( not ( = ?auto_20076 ?auto_20078 ) ) ( not ( = ?auto_20076 ?auto_20090 ) ) ( not ( = ?auto_20089 ?auto_20087 ) ) ( not ( = ?auto_20089 ?auto_20083 ) ) ( not ( = ?auto_20089 ?auto_20080 ) ) ( not ( = ?auto_20089 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20067 ) ) ( not ( = ?auto_20061 ?auto_20079 ) ) ( not ( = ?auto_20062 ?auto_20067 ) ) ( not ( = ?auto_20062 ?auto_20079 ) ) ( not ( = ?auto_20063 ?auto_20067 ) ) ( not ( = ?auto_20063 ?auto_20079 ) ) ( not ( = ?auto_20064 ?auto_20067 ) ) ( not ( = ?auto_20064 ?auto_20079 ) ) ( not ( = ?auto_20065 ?auto_20067 ) ) ( not ( = ?auto_20065 ?auto_20079 ) ) ( not ( = ?auto_20067 ?auto_20089 ) ) ( not ( = ?auto_20067 ?auto_20087 ) ) ( not ( = ?auto_20067 ?auto_20083 ) ) ( not ( = ?auto_20067 ?auto_20080 ) ) ( not ( = ?auto_20067 ?auto_20084 ) ) ( not ( = ?auto_20077 ?auto_20088 ) ) ( not ( = ?auto_20077 ?auto_20082 ) ) ( not ( = ?auto_20077 ?auto_20081 ) ) ( not ( = ?auto_20085 ?auto_20076 ) ) ( not ( = ?auto_20085 ?auto_20078 ) ) ( not ( = ?auto_20085 ?auto_20090 ) ) ( not ( = ?auto_20079 ?auto_20089 ) ) ( not ( = ?auto_20079 ?auto_20087 ) ) ( not ( = ?auto_20079 ?auto_20083 ) ) ( not ( = ?auto_20079 ?auto_20080 ) ) ( not ( = ?auto_20079 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20068 ) ) ( not ( = ?auto_20061 ?auto_20091 ) ) ( not ( = ?auto_20062 ?auto_20068 ) ) ( not ( = ?auto_20062 ?auto_20091 ) ) ( not ( = ?auto_20063 ?auto_20068 ) ) ( not ( = ?auto_20063 ?auto_20091 ) ) ( not ( = ?auto_20064 ?auto_20068 ) ) ( not ( = ?auto_20064 ?auto_20091 ) ) ( not ( = ?auto_20065 ?auto_20068 ) ) ( not ( = ?auto_20065 ?auto_20091 ) ) ( not ( = ?auto_20066 ?auto_20068 ) ) ( not ( = ?auto_20066 ?auto_20091 ) ) ( not ( = ?auto_20068 ?auto_20079 ) ) ( not ( = ?auto_20068 ?auto_20089 ) ) ( not ( = ?auto_20068 ?auto_20087 ) ) ( not ( = ?auto_20068 ?auto_20083 ) ) ( not ( = ?auto_20068 ?auto_20080 ) ) ( not ( = ?auto_20068 ?auto_20084 ) ) ( not ( = ?auto_20092 ?auto_20077 ) ) ( not ( = ?auto_20092 ?auto_20088 ) ) ( not ( = ?auto_20092 ?auto_20082 ) ) ( not ( = ?auto_20092 ?auto_20081 ) ) ( not ( = ?auto_20086 ?auto_20085 ) ) ( not ( = ?auto_20086 ?auto_20076 ) ) ( not ( = ?auto_20086 ?auto_20078 ) ) ( not ( = ?auto_20086 ?auto_20090 ) ) ( not ( = ?auto_20091 ?auto_20079 ) ) ( not ( = ?auto_20091 ?auto_20089 ) ) ( not ( = ?auto_20091 ?auto_20087 ) ) ( not ( = ?auto_20091 ?auto_20083 ) ) ( not ( = ?auto_20091 ?auto_20080 ) ) ( not ( = ?auto_20091 ?auto_20084 ) ) ( not ( = ?auto_20061 ?auto_20069 ) ) ( not ( = ?auto_20061 ?auto_20073 ) ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20062 ?auto_20073 ) ) ( not ( = ?auto_20063 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20073 ) ) ( not ( = ?auto_20064 ?auto_20069 ) ) ( not ( = ?auto_20064 ?auto_20073 ) ) ( not ( = ?auto_20065 ?auto_20069 ) ) ( not ( = ?auto_20065 ?auto_20073 ) ) ( not ( = ?auto_20066 ?auto_20069 ) ) ( not ( = ?auto_20066 ?auto_20073 ) ) ( not ( = ?auto_20067 ?auto_20069 ) ) ( not ( = ?auto_20067 ?auto_20073 ) ) ( not ( = ?auto_20069 ?auto_20091 ) ) ( not ( = ?auto_20069 ?auto_20079 ) ) ( not ( = ?auto_20069 ?auto_20089 ) ) ( not ( = ?auto_20069 ?auto_20087 ) ) ( not ( = ?auto_20069 ?auto_20083 ) ) ( not ( = ?auto_20069 ?auto_20080 ) ) ( not ( = ?auto_20069 ?auto_20084 ) ) ( not ( = ?auto_20075 ?auto_20092 ) ) ( not ( = ?auto_20075 ?auto_20077 ) ) ( not ( = ?auto_20075 ?auto_20088 ) ) ( not ( = ?auto_20075 ?auto_20082 ) ) ( not ( = ?auto_20075 ?auto_20081 ) ) ( not ( = ?auto_20074 ?auto_20086 ) ) ( not ( = ?auto_20074 ?auto_20085 ) ) ( not ( = ?auto_20074 ?auto_20076 ) ) ( not ( = ?auto_20074 ?auto_20078 ) ) ( not ( = ?auto_20074 ?auto_20090 ) ) ( not ( = ?auto_20073 ?auto_20091 ) ) ( not ( = ?auto_20073 ?auto_20079 ) ) ( not ( = ?auto_20073 ?auto_20089 ) ) ( not ( = ?auto_20073 ?auto_20087 ) ) ( not ( = ?auto_20073 ?auto_20083 ) ) ( not ( = ?auto_20073 ?auto_20080 ) ) ( not ( = ?auto_20073 ?auto_20084 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20067 ?auto_20068 )
      ( MAKE-1CRATE ?auto_20068 ?auto_20069 )
      ( MAKE-8CRATE-VERIFY ?auto_20061 ?auto_20062 ?auto_20063 ?auto_20064 ?auto_20065 ?auto_20066 ?auto_20067 ?auto_20068 ?auto_20069 ) )
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
      ?auto_20119 - SURFACE
      ?auto_20120 - SURFACE
      ?auto_20121 - SURFACE
      ?auto_20122 - SURFACE
    )
    :vars
    (
      ?auto_20128 - HOIST
      ?auto_20125 - PLACE
      ?auto_20127 - PLACE
      ?auto_20123 - HOIST
      ?auto_20124 - SURFACE
      ?auto_20137 - PLACE
      ?auto_20146 - HOIST
      ?auto_20133 - SURFACE
      ?auto_20136 - PLACE
      ?auto_20141 - HOIST
      ?auto_20139 - SURFACE
      ?auto_20138 - PLACE
      ?auto_20142 - HOIST
      ?auto_20135 - SURFACE
      ?auto_20130 - SURFACE
      ?auto_20132 - PLACE
      ?auto_20134 - HOIST
      ?auto_20143 - SURFACE
      ?auto_20145 - PLACE
      ?auto_20144 - HOIST
      ?auto_20131 - SURFACE
      ?auto_20129 - SURFACE
      ?auto_20140 - SURFACE
      ?auto_20126 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20128 ?auto_20125 ) ( IS-CRATE ?auto_20122 ) ( not ( = ?auto_20127 ?auto_20125 ) ) ( HOIST-AT ?auto_20123 ?auto_20127 ) ( SURFACE-AT ?auto_20122 ?auto_20127 ) ( ON ?auto_20122 ?auto_20124 ) ( CLEAR ?auto_20122 ) ( not ( = ?auto_20121 ?auto_20122 ) ) ( not ( = ?auto_20121 ?auto_20124 ) ) ( not ( = ?auto_20122 ?auto_20124 ) ) ( not ( = ?auto_20128 ?auto_20123 ) ) ( IS-CRATE ?auto_20121 ) ( not ( = ?auto_20137 ?auto_20125 ) ) ( HOIST-AT ?auto_20146 ?auto_20137 ) ( AVAILABLE ?auto_20146 ) ( SURFACE-AT ?auto_20121 ?auto_20137 ) ( ON ?auto_20121 ?auto_20133 ) ( CLEAR ?auto_20121 ) ( not ( = ?auto_20120 ?auto_20121 ) ) ( not ( = ?auto_20120 ?auto_20133 ) ) ( not ( = ?auto_20121 ?auto_20133 ) ) ( not ( = ?auto_20128 ?auto_20146 ) ) ( IS-CRATE ?auto_20120 ) ( not ( = ?auto_20136 ?auto_20125 ) ) ( HOIST-AT ?auto_20141 ?auto_20136 ) ( AVAILABLE ?auto_20141 ) ( SURFACE-AT ?auto_20120 ?auto_20136 ) ( ON ?auto_20120 ?auto_20139 ) ( CLEAR ?auto_20120 ) ( not ( = ?auto_20119 ?auto_20120 ) ) ( not ( = ?auto_20119 ?auto_20139 ) ) ( not ( = ?auto_20120 ?auto_20139 ) ) ( not ( = ?auto_20128 ?auto_20141 ) ) ( IS-CRATE ?auto_20119 ) ( not ( = ?auto_20138 ?auto_20125 ) ) ( HOIST-AT ?auto_20142 ?auto_20138 ) ( AVAILABLE ?auto_20142 ) ( SURFACE-AT ?auto_20119 ?auto_20138 ) ( ON ?auto_20119 ?auto_20135 ) ( CLEAR ?auto_20119 ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20135 ) ) ( not ( = ?auto_20119 ?auto_20135 ) ) ( not ( = ?auto_20128 ?auto_20142 ) ) ( IS-CRATE ?auto_20118 ) ( AVAILABLE ?auto_20123 ) ( SURFACE-AT ?auto_20118 ?auto_20127 ) ( ON ?auto_20118 ?auto_20130 ) ( CLEAR ?auto_20118 ) ( not ( = ?auto_20117 ?auto_20118 ) ) ( not ( = ?auto_20117 ?auto_20130 ) ) ( not ( = ?auto_20118 ?auto_20130 ) ) ( IS-CRATE ?auto_20117 ) ( not ( = ?auto_20132 ?auto_20125 ) ) ( HOIST-AT ?auto_20134 ?auto_20132 ) ( AVAILABLE ?auto_20134 ) ( SURFACE-AT ?auto_20117 ?auto_20132 ) ( ON ?auto_20117 ?auto_20143 ) ( CLEAR ?auto_20117 ) ( not ( = ?auto_20116 ?auto_20117 ) ) ( not ( = ?auto_20116 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20143 ) ) ( not ( = ?auto_20128 ?auto_20134 ) ) ( IS-CRATE ?auto_20116 ) ( not ( = ?auto_20145 ?auto_20125 ) ) ( HOIST-AT ?auto_20144 ?auto_20145 ) ( SURFACE-AT ?auto_20116 ?auto_20145 ) ( ON ?auto_20116 ?auto_20131 ) ( CLEAR ?auto_20116 ) ( not ( = ?auto_20115 ?auto_20116 ) ) ( not ( = ?auto_20115 ?auto_20131 ) ) ( not ( = ?auto_20116 ?auto_20131 ) ) ( not ( = ?auto_20128 ?auto_20144 ) ) ( IS-CRATE ?auto_20115 ) ( SURFACE-AT ?auto_20115 ?auto_20145 ) ( ON ?auto_20115 ?auto_20129 ) ( CLEAR ?auto_20115 ) ( not ( = ?auto_20114 ?auto_20115 ) ) ( not ( = ?auto_20114 ?auto_20129 ) ) ( not ( = ?auto_20115 ?auto_20129 ) ) ( SURFACE-AT ?auto_20113 ?auto_20125 ) ( CLEAR ?auto_20113 ) ( IS-CRATE ?auto_20114 ) ( AVAILABLE ?auto_20128 ) ( AVAILABLE ?auto_20144 ) ( SURFACE-AT ?auto_20114 ?auto_20145 ) ( ON ?auto_20114 ?auto_20140 ) ( CLEAR ?auto_20114 ) ( TRUCK-AT ?auto_20126 ?auto_20125 ) ( not ( = ?auto_20113 ?auto_20114 ) ) ( not ( = ?auto_20113 ?auto_20140 ) ) ( not ( = ?auto_20114 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20115 ) ) ( not ( = ?auto_20113 ?auto_20129 ) ) ( not ( = ?auto_20115 ?auto_20140 ) ) ( not ( = ?auto_20129 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20116 ) ) ( not ( = ?auto_20113 ?auto_20131 ) ) ( not ( = ?auto_20114 ?auto_20116 ) ) ( not ( = ?auto_20114 ?auto_20131 ) ) ( not ( = ?auto_20116 ?auto_20129 ) ) ( not ( = ?auto_20116 ?auto_20140 ) ) ( not ( = ?auto_20131 ?auto_20129 ) ) ( not ( = ?auto_20131 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20117 ) ) ( not ( = ?auto_20113 ?auto_20143 ) ) ( not ( = ?auto_20114 ?auto_20117 ) ) ( not ( = ?auto_20114 ?auto_20143 ) ) ( not ( = ?auto_20115 ?auto_20117 ) ) ( not ( = ?auto_20115 ?auto_20143 ) ) ( not ( = ?auto_20117 ?auto_20131 ) ) ( not ( = ?auto_20117 ?auto_20129 ) ) ( not ( = ?auto_20117 ?auto_20140 ) ) ( not ( = ?auto_20132 ?auto_20145 ) ) ( not ( = ?auto_20134 ?auto_20144 ) ) ( not ( = ?auto_20143 ?auto_20131 ) ) ( not ( = ?auto_20143 ?auto_20129 ) ) ( not ( = ?auto_20143 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20118 ) ) ( not ( = ?auto_20113 ?auto_20130 ) ) ( not ( = ?auto_20114 ?auto_20118 ) ) ( not ( = ?auto_20114 ?auto_20130 ) ) ( not ( = ?auto_20115 ?auto_20118 ) ) ( not ( = ?auto_20115 ?auto_20130 ) ) ( not ( = ?auto_20116 ?auto_20118 ) ) ( not ( = ?auto_20116 ?auto_20130 ) ) ( not ( = ?auto_20118 ?auto_20143 ) ) ( not ( = ?auto_20118 ?auto_20131 ) ) ( not ( = ?auto_20118 ?auto_20129 ) ) ( not ( = ?auto_20118 ?auto_20140 ) ) ( not ( = ?auto_20127 ?auto_20132 ) ) ( not ( = ?auto_20127 ?auto_20145 ) ) ( not ( = ?auto_20123 ?auto_20134 ) ) ( not ( = ?auto_20123 ?auto_20144 ) ) ( not ( = ?auto_20130 ?auto_20143 ) ) ( not ( = ?auto_20130 ?auto_20131 ) ) ( not ( = ?auto_20130 ?auto_20129 ) ) ( not ( = ?auto_20130 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20119 ) ) ( not ( = ?auto_20113 ?auto_20135 ) ) ( not ( = ?auto_20114 ?auto_20119 ) ) ( not ( = ?auto_20114 ?auto_20135 ) ) ( not ( = ?auto_20115 ?auto_20119 ) ) ( not ( = ?auto_20115 ?auto_20135 ) ) ( not ( = ?auto_20116 ?auto_20119 ) ) ( not ( = ?auto_20116 ?auto_20135 ) ) ( not ( = ?auto_20117 ?auto_20119 ) ) ( not ( = ?auto_20117 ?auto_20135 ) ) ( not ( = ?auto_20119 ?auto_20130 ) ) ( not ( = ?auto_20119 ?auto_20143 ) ) ( not ( = ?auto_20119 ?auto_20131 ) ) ( not ( = ?auto_20119 ?auto_20129 ) ) ( not ( = ?auto_20119 ?auto_20140 ) ) ( not ( = ?auto_20138 ?auto_20127 ) ) ( not ( = ?auto_20138 ?auto_20132 ) ) ( not ( = ?auto_20138 ?auto_20145 ) ) ( not ( = ?auto_20142 ?auto_20123 ) ) ( not ( = ?auto_20142 ?auto_20134 ) ) ( not ( = ?auto_20142 ?auto_20144 ) ) ( not ( = ?auto_20135 ?auto_20130 ) ) ( not ( = ?auto_20135 ?auto_20143 ) ) ( not ( = ?auto_20135 ?auto_20131 ) ) ( not ( = ?auto_20135 ?auto_20129 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20120 ) ) ( not ( = ?auto_20113 ?auto_20139 ) ) ( not ( = ?auto_20114 ?auto_20120 ) ) ( not ( = ?auto_20114 ?auto_20139 ) ) ( not ( = ?auto_20115 ?auto_20120 ) ) ( not ( = ?auto_20115 ?auto_20139 ) ) ( not ( = ?auto_20116 ?auto_20120 ) ) ( not ( = ?auto_20116 ?auto_20139 ) ) ( not ( = ?auto_20117 ?auto_20120 ) ) ( not ( = ?auto_20117 ?auto_20139 ) ) ( not ( = ?auto_20118 ?auto_20120 ) ) ( not ( = ?auto_20118 ?auto_20139 ) ) ( not ( = ?auto_20120 ?auto_20135 ) ) ( not ( = ?auto_20120 ?auto_20130 ) ) ( not ( = ?auto_20120 ?auto_20143 ) ) ( not ( = ?auto_20120 ?auto_20131 ) ) ( not ( = ?auto_20120 ?auto_20129 ) ) ( not ( = ?auto_20120 ?auto_20140 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20127 ) ) ( not ( = ?auto_20136 ?auto_20132 ) ) ( not ( = ?auto_20136 ?auto_20145 ) ) ( not ( = ?auto_20141 ?auto_20142 ) ) ( not ( = ?auto_20141 ?auto_20123 ) ) ( not ( = ?auto_20141 ?auto_20134 ) ) ( not ( = ?auto_20141 ?auto_20144 ) ) ( not ( = ?auto_20139 ?auto_20135 ) ) ( not ( = ?auto_20139 ?auto_20130 ) ) ( not ( = ?auto_20139 ?auto_20143 ) ) ( not ( = ?auto_20139 ?auto_20131 ) ) ( not ( = ?auto_20139 ?auto_20129 ) ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20121 ) ) ( not ( = ?auto_20113 ?auto_20133 ) ) ( not ( = ?auto_20114 ?auto_20121 ) ) ( not ( = ?auto_20114 ?auto_20133 ) ) ( not ( = ?auto_20115 ?auto_20121 ) ) ( not ( = ?auto_20115 ?auto_20133 ) ) ( not ( = ?auto_20116 ?auto_20121 ) ) ( not ( = ?auto_20116 ?auto_20133 ) ) ( not ( = ?auto_20117 ?auto_20121 ) ) ( not ( = ?auto_20117 ?auto_20133 ) ) ( not ( = ?auto_20118 ?auto_20121 ) ) ( not ( = ?auto_20118 ?auto_20133 ) ) ( not ( = ?auto_20119 ?auto_20121 ) ) ( not ( = ?auto_20119 ?auto_20133 ) ) ( not ( = ?auto_20121 ?auto_20139 ) ) ( not ( = ?auto_20121 ?auto_20135 ) ) ( not ( = ?auto_20121 ?auto_20130 ) ) ( not ( = ?auto_20121 ?auto_20143 ) ) ( not ( = ?auto_20121 ?auto_20131 ) ) ( not ( = ?auto_20121 ?auto_20129 ) ) ( not ( = ?auto_20121 ?auto_20140 ) ) ( not ( = ?auto_20137 ?auto_20136 ) ) ( not ( = ?auto_20137 ?auto_20138 ) ) ( not ( = ?auto_20137 ?auto_20127 ) ) ( not ( = ?auto_20137 ?auto_20132 ) ) ( not ( = ?auto_20137 ?auto_20145 ) ) ( not ( = ?auto_20146 ?auto_20141 ) ) ( not ( = ?auto_20146 ?auto_20142 ) ) ( not ( = ?auto_20146 ?auto_20123 ) ) ( not ( = ?auto_20146 ?auto_20134 ) ) ( not ( = ?auto_20146 ?auto_20144 ) ) ( not ( = ?auto_20133 ?auto_20139 ) ) ( not ( = ?auto_20133 ?auto_20135 ) ) ( not ( = ?auto_20133 ?auto_20130 ) ) ( not ( = ?auto_20133 ?auto_20143 ) ) ( not ( = ?auto_20133 ?auto_20131 ) ) ( not ( = ?auto_20133 ?auto_20129 ) ) ( not ( = ?auto_20133 ?auto_20140 ) ) ( not ( = ?auto_20113 ?auto_20122 ) ) ( not ( = ?auto_20113 ?auto_20124 ) ) ( not ( = ?auto_20114 ?auto_20122 ) ) ( not ( = ?auto_20114 ?auto_20124 ) ) ( not ( = ?auto_20115 ?auto_20122 ) ) ( not ( = ?auto_20115 ?auto_20124 ) ) ( not ( = ?auto_20116 ?auto_20122 ) ) ( not ( = ?auto_20116 ?auto_20124 ) ) ( not ( = ?auto_20117 ?auto_20122 ) ) ( not ( = ?auto_20117 ?auto_20124 ) ) ( not ( = ?auto_20118 ?auto_20122 ) ) ( not ( = ?auto_20118 ?auto_20124 ) ) ( not ( = ?auto_20119 ?auto_20122 ) ) ( not ( = ?auto_20119 ?auto_20124 ) ) ( not ( = ?auto_20120 ?auto_20122 ) ) ( not ( = ?auto_20120 ?auto_20124 ) ) ( not ( = ?auto_20122 ?auto_20133 ) ) ( not ( = ?auto_20122 ?auto_20139 ) ) ( not ( = ?auto_20122 ?auto_20135 ) ) ( not ( = ?auto_20122 ?auto_20130 ) ) ( not ( = ?auto_20122 ?auto_20143 ) ) ( not ( = ?auto_20122 ?auto_20131 ) ) ( not ( = ?auto_20122 ?auto_20129 ) ) ( not ( = ?auto_20122 ?auto_20140 ) ) ( not ( = ?auto_20124 ?auto_20133 ) ) ( not ( = ?auto_20124 ?auto_20139 ) ) ( not ( = ?auto_20124 ?auto_20135 ) ) ( not ( = ?auto_20124 ?auto_20130 ) ) ( not ( = ?auto_20124 ?auto_20143 ) ) ( not ( = ?auto_20124 ?auto_20131 ) ) ( not ( = ?auto_20124 ?auto_20129 ) ) ( not ( = ?auto_20124 ?auto_20140 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20113 ?auto_20114 ?auto_20115 ?auto_20116 ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 )
      ( MAKE-1CRATE ?auto_20121 ?auto_20122 )
      ( MAKE-9CRATE-VERIFY ?auto_20113 ?auto_20114 ?auto_20115 ?auto_20116 ?auto_20117 ?auto_20118 ?auto_20119 ?auto_20120 ?auto_20121 ?auto_20122 ) )
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
      ?auto_20174 - SURFACE
      ?auto_20175 - SURFACE
      ?auto_20176 - SURFACE
      ?auto_20177 - SURFACE
      ?auto_20178 - SURFACE
    )
    :vars
    (
      ?auto_20183 - HOIST
      ?auto_20179 - PLACE
      ?auto_20182 - PLACE
      ?auto_20180 - HOIST
      ?auto_20181 - SURFACE
      ?auto_20200 - PLACE
      ?auto_20186 - HOIST
      ?auto_20198 - SURFACE
      ?auto_20201 - PLACE
      ?auto_20202 - HOIST
      ?auto_20194 - SURFACE
      ?auto_20191 - PLACE
      ?auto_20205 - HOIST
      ?auto_20187 - SURFACE
      ?auto_20203 - PLACE
      ?auto_20190 - HOIST
      ?auto_20192 - SURFACE
      ?auto_20196 - SURFACE
      ?auto_20197 - PLACE
      ?auto_20193 - HOIST
      ?auto_20195 - SURFACE
      ?auto_20189 - PLACE
      ?auto_20199 - HOIST
      ?auto_20188 - SURFACE
      ?auto_20185 - SURFACE
      ?auto_20204 - SURFACE
      ?auto_20184 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20183 ?auto_20179 ) ( IS-CRATE ?auto_20178 ) ( not ( = ?auto_20182 ?auto_20179 ) ) ( HOIST-AT ?auto_20180 ?auto_20182 ) ( AVAILABLE ?auto_20180 ) ( SURFACE-AT ?auto_20178 ?auto_20182 ) ( ON ?auto_20178 ?auto_20181 ) ( CLEAR ?auto_20178 ) ( not ( = ?auto_20177 ?auto_20178 ) ) ( not ( = ?auto_20177 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20181 ) ) ( not ( = ?auto_20183 ?auto_20180 ) ) ( IS-CRATE ?auto_20177 ) ( not ( = ?auto_20200 ?auto_20179 ) ) ( HOIST-AT ?auto_20186 ?auto_20200 ) ( SURFACE-AT ?auto_20177 ?auto_20200 ) ( ON ?auto_20177 ?auto_20198 ) ( CLEAR ?auto_20177 ) ( not ( = ?auto_20176 ?auto_20177 ) ) ( not ( = ?auto_20176 ?auto_20198 ) ) ( not ( = ?auto_20177 ?auto_20198 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( IS-CRATE ?auto_20176 ) ( not ( = ?auto_20201 ?auto_20179 ) ) ( HOIST-AT ?auto_20202 ?auto_20201 ) ( AVAILABLE ?auto_20202 ) ( SURFACE-AT ?auto_20176 ?auto_20201 ) ( ON ?auto_20176 ?auto_20194 ) ( CLEAR ?auto_20176 ) ( not ( = ?auto_20175 ?auto_20176 ) ) ( not ( = ?auto_20175 ?auto_20194 ) ) ( not ( = ?auto_20176 ?auto_20194 ) ) ( not ( = ?auto_20183 ?auto_20202 ) ) ( IS-CRATE ?auto_20175 ) ( not ( = ?auto_20191 ?auto_20179 ) ) ( HOIST-AT ?auto_20205 ?auto_20191 ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20175 ?auto_20191 ) ( ON ?auto_20175 ?auto_20187 ) ( CLEAR ?auto_20175 ) ( not ( = ?auto_20174 ?auto_20175 ) ) ( not ( = ?auto_20174 ?auto_20187 ) ) ( not ( = ?auto_20175 ?auto_20187 ) ) ( not ( = ?auto_20183 ?auto_20205 ) ) ( IS-CRATE ?auto_20174 ) ( not ( = ?auto_20203 ?auto_20179 ) ) ( HOIST-AT ?auto_20190 ?auto_20203 ) ( AVAILABLE ?auto_20190 ) ( SURFACE-AT ?auto_20174 ?auto_20203 ) ( ON ?auto_20174 ?auto_20192 ) ( CLEAR ?auto_20174 ) ( not ( = ?auto_20173 ?auto_20174 ) ) ( not ( = ?auto_20173 ?auto_20192 ) ) ( not ( = ?auto_20174 ?auto_20192 ) ) ( not ( = ?auto_20183 ?auto_20190 ) ) ( IS-CRATE ?auto_20173 ) ( AVAILABLE ?auto_20186 ) ( SURFACE-AT ?auto_20173 ?auto_20200 ) ( ON ?auto_20173 ?auto_20196 ) ( CLEAR ?auto_20173 ) ( not ( = ?auto_20172 ?auto_20173 ) ) ( not ( = ?auto_20172 ?auto_20196 ) ) ( not ( = ?auto_20173 ?auto_20196 ) ) ( IS-CRATE ?auto_20172 ) ( not ( = ?auto_20197 ?auto_20179 ) ) ( HOIST-AT ?auto_20193 ?auto_20197 ) ( AVAILABLE ?auto_20193 ) ( SURFACE-AT ?auto_20172 ?auto_20197 ) ( ON ?auto_20172 ?auto_20195 ) ( CLEAR ?auto_20172 ) ( not ( = ?auto_20171 ?auto_20172 ) ) ( not ( = ?auto_20171 ?auto_20195 ) ) ( not ( = ?auto_20172 ?auto_20195 ) ) ( not ( = ?auto_20183 ?auto_20193 ) ) ( IS-CRATE ?auto_20171 ) ( not ( = ?auto_20189 ?auto_20179 ) ) ( HOIST-AT ?auto_20199 ?auto_20189 ) ( SURFACE-AT ?auto_20171 ?auto_20189 ) ( ON ?auto_20171 ?auto_20188 ) ( CLEAR ?auto_20171 ) ( not ( = ?auto_20170 ?auto_20171 ) ) ( not ( = ?auto_20170 ?auto_20188 ) ) ( not ( = ?auto_20171 ?auto_20188 ) ) ( not ( = ?auto_20183 ?auto_20199 ) ) ( IS-CRATE ?auto_20170 ) ( SURFACE-AT ?auto_20170 ?auto_20189 ) ( ON ?auto_20170 ?auto_20185 ) ( CLEAR ?auto_20170 ) ( not ( = ?auto_20169 ?auto_20170 ) ) ( not ( = ?auto_20169 ?auto_20185 ) ) ( not ( = ?auto_20170 ?auto_20185 ) ) ( SURFACE-AT ?auto_20168 ?auto_20179 ) ( CLEAR ?auto_20168 ) ( IS-CRATE ?auto_20169 ) ( AVAILABLE ?auto_20183 ) ( AVAILABLE ?auto_20199 ) ( SURFACE-AT ?auto_20169 ?auto_20189 ) ( ON ?auto_20169 ?auto_20204 ) ( CLEAR ?auto_20169 ) ( TRUCK-AT ?auto_20184 ?auto_20179 ) ( not ( = ?auto_20168 ?auto_20169 ) ) ( not ( = ?auto_20168 ?auto_20204 ) ) ( not ( = ?auto_20169 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20170 ) ) ( not ( = ?auto_20168 ?auto_20185 ) ) ( not ( = ?auto_20170 ?auto_20204 ) ) ( not ( = ?auto_20185 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20171 ) ) ( not ( = ?auto_20168 ?auto_20188 ) ) ( not ( = ?auto_20169 ?auto_20171 ) ) ( not ( = ?auto_20169 ?auto_20188 ) ) ( not ( = ?auto_20171 ?auto_20185 ) ) ( not ( = ?auto_20171 ?auto_20204 ) ) ( not ( = ?auto_20188 ?auto_20185 ) ) ( not ( = ?auto_20188 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20172 ) ) ( not ( = ?auto_20168 ?auto_20195 ) ) ( not ( = ?auto_20169 ?auto_20172 ) ) ( not ( = ?auto_20169 ?auto_20195 ) ) ( not ( = ?auto_20170 ?auto_20172 ) ) ( not ( = ?auto_20170 ?auto_20195 ) ) ( not ( = ?auto_20172 ?auto_20188 ) ) ( not ( = ?auto_20172 ?auto_20185 ) ) ( not ( = ?auto_20172 ?auto_20204 ) ) ( not ( = ?auto_20197 ?auto_20189 ) ) ( not ( = ?auto_20193 ?auto_20199 ) ) ( not ( = ?auto_20195 ?auto_20188 ) ) ( not ( = ?auto_20195 ?auto_20185 ) ) ( not ( = ?auto_20195 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20173 ) ) ( not ( = ?auto_20168 ?auto_20196 ) ) ( not ( = ?auto_20169 ?auto_20173 ) ) ( not ( = ?auto_20169 ?auto_20196 ) ) ( not ( = ?auto_20170 ?auto_20173 ) ) ( not ( = ?auto_20170 ?auto_20196 ) ) ( not ( = ?auto_20171 ?auto_20173 ) ) ( not ( = ?auto_20171 ?auto_20196 ) ) ( not ( = ?auto_20173 ?auto_20195 ) ) ( not ( = ?auto_20173 ?auto_20188 ) ) ( not ( = ?auto_20173 ?auto_20185 ) ) ( not ( = ?auto_20173 ?auto_20204 ) ) ( not ( = ?auto_20200 ?auto_20197 ) ) ( not ( = ?auto_20200 ?auto_20189 ) ) ( not ( = ?auto_20186 ?auto_20193 ) ) ( not ( = ?auto_20186 ?auto_20199 ) ) ( not ( = ?auto_20196 ?auto_20195 ) ) ( not ( = ?auto_20196 ?auto_20188 ) ) ( not ( = ?auto_20196 ?auto_20185 ) ) ( not ( = ?auto_20196 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20174 ) ) ( not ( = ?auto_20168 ?auto_20192 ) ) ( not ( = ?auto_20169 ?auto_20174 ) ) ( not ( = ?auto_20169 ?auto_20192 ) ) ( not ( = ?auto_20170 ?auto_20174 ) ) ( not ( = ?auto_20170 ?auto_20192 ) ) ( not ( = ?auto_20171 ?auto_20174 ) ) ( not ( = ?auto_20171 ?auto_20192 ) ) ( not ( = ?auto_20172 ?auto_20174 ) ) ( not ( = ?auto_20172 ?auto_20192 ) ) ( not ( = ?auto_20174 ?auto_20196 ) ) ( not ( = ?auto_20174 ?auto_20195 ) ) ( not ( = ?auto_20174 ?auto_20188 ) ) ( not ( = ?auto_20174 ?auto_20185 ) ) ( not ( = ?auto_20174 ?auto_20204 ) ) ( not ( = ?auto_20203 ?auto_20200 ) ) ( not ( = ?auto_20203 ?auto_20197 ) ) ( not ( = ?auto_20203 ?auto_20189 ) ) ( not ( = ?auto_20190 ?auto_20186 ) ) ( not ( = ?auto_20190 ?auto_20193 ) ) ( not ( = ?auto_20190 ?auto_20199 ) ) ( not ( = ?auto_20192 ?auto_20196 ) ) ( not ( = ?auto_20192 ?auto_20195 ) ) ( not ( = ?auto_20192 ?auto_20188 ) ) ( not ( = ?auto_20192 ?auto_20185 ) ) ( not ( = ?auto_20192 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20175 ) ) ( not ( = ?auto_20168 ?auto_20187 ) ) ( not ( = ?auto_20169 ?auto_20175 ) ) ( not ( = ?auto_20169 ?auto_20187 ) ) ( not ( = ?auto_20170 ?auto_20175 ) ) ( not ( = ?auto_20170 ?auto_20187 ) ) ( not ( = ?auto_20171 ?auto_20175 ) ) ( not ( = ?auto_20171 ?auto_20187 ) ) ( not ( = ?auto_20172 ?auto_20175 ) ) ( not ( = ?auto_20172 ?auto_20187 ) ) ( not ( = ?auto_20173 ?auto_20175 ) ) ( not ( = ?auto_20173 ?auto_20187 ) ) ( not ( = ?auto_20175 ?auto_20192 ) ) ( not ( = ?auto_20175 ?auto_20196 ) ) ( not ( = ?auto_20175 ?auto_20195 ) ) ( not ( = ?auto_20175 ?auto_20188 ) ) ( not ( = ?auto_20175 ?auto_20185 ) ) ( not ( = ?auto_20175 ?auto_20204 ) ) ( not ( = ?auto_20191 ?auto_20203 ) ) ( not ( = ?auto_20191 ?auto_20200 ) ) ( not ( = ?auto_20191 ?auto_20197 ) ) ( not ( = ?auto_20191 ?auto_20189 ) ) ( not ( = ?auto_20205 ?auto_20190 ) ) ( not ( = ?auto_20205 ?auto_20186 ) ) ( not ( = ?auto_20205 ?auto_20193 ) ) ( not ( = ?auto_20205 ?auto_20199 ) ) ( not ( = ?auto_20187 ?auto_20192 ) ) ( not ( = ?auto_20187 ?auto_20196 ) ) ( not ( = ?auto_20187 ?auto_20195 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20185 ) ) ( not ( = ?auto_20187 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20176 ) ) ( not ( = ?auto_20168 ?auto_20194 ) ) ( not ( = ?auto_20169 ?auto_20176 ) ) ( not ( = ?auto_20169 ?auto_20194 ) ) ( not ( = ?auto_20170 ?auto_20176 ) ) ( not ( = ?auto_20170 ?auto_20194 ) ) ( not ( = ?auto_20171 ?auto_20176 ) ) ( not ( = ?auto_20171 ?auto_20194 ) ) ( not ( = ?auto_20172 ?auto_20176 ) ) ( not ( = ?auto_20172 ?auto_20194 ) ) ( not ( = ?auto_20173 ?auto_20176 ) ) ( not ( = ?auto_20173 ?auto_20194 ) ) ( not ( = ?auto_20174 ?auto_20176 ) ) ( not ( = ?auto_20174 ?auto_20194 ) ) ( not ( = ?auto_20176 ?auto_20187 ) ) ( not ( = ?auto_20176 ?auto_20192 ) ) ( not ( = ?auto_20176 ?auto_20196 ) ) ( not ( = ?auto_20176 ?auto_20195 ) ) ( not ( = ?auto_20176 ?auto_20188 ) ) ( not ( = ?auto_20176 ?auto_20185 ) ) ( not ( = ?auto_20176 ?auto_20204 ) ) ( not ( = ?auto_20201 ?auto_20191 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20201 ?auto_20200 ) ) ( not ( = ?auto_20201 ?auto_20197 ) ) ( not ( = ?auto_20201 ?auto_20189 ) ) ( not ( = ?auto_20202 ?auto_20205 ) ) ( not ( = ?auto_20202 ?auto_20190 ) ) ( not ( = ?auto_20202 ?auto_20186 ) ) ( not ( = ?auto_20202 ?auto_20193 ) ) ( not ( = ?auto_20202 ?auto_20199 ) ) ( not ( = ?auto_20194 ?auto_20187 ) ) ( not ( = ?auto_20194 ?auto_20192 ) ) ( not ( = ?auto_20194 ?auto_20196 ) ) ( not ( = ?auto_20194 ?auto_20195 ) ) ( not ( = ?auto_20194 ?auto_20188 ) ) ( not ( = ?auto_20194 ?auto_20185 ) ) ( not ( = ?auto_20194 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20177 ) ) ( not ( = ?auto_20168 ?auto_20198 ) ) ( not ( = ?auto_20169 ?auto_20177 ) ) ( not ( = ?auto_20169 ?auto_20198 ) ) ( not ( = ?auto_20170 ?auto_20177 ) ) ( not ( = ?auto_20170 ?auto_20198 ) ) ( not ( = ?auto_20171 ?auto_20177 ) ) ( not ( = ?auto_20171 ?auto_20198 ) ) ( not ( = ?auto_20172 ?auto_20177 ) ) ( not ( = ?auto_20172 ?auto_20198 ) ) ( not ( = ?auto_20173 ?auto_20177 ) ) ( not ( = ?auto_20173 ?auto_20198 ) ) ( not ( = ?auto_20174 ?auto_20177 ) ) ( not ( = ?auto_20174 ?auto_20198 ) ) ( not ( = ?auto_20175 ?auto_20177 ) ) ( not ( = ?auto_20175 ?auto_20198 ) ) ( not ( = ?auto_20177 ?auto_20194 ) ) ( not ( = ?auto_20177 ?auto_20187 ) ) ( not ( = ?auto_20177 ?auto_20192 ) ) ( not ( = ?auto_20177 ?auto_20196 ) ) ( not ( = ?auto_20177 ?auto_20195 ) ) ( not ( = ?auto_20177 ?auto_20188 ) ) ( not ( = ?auto_20177 ?auto_20185 ) ) ( not ( = ?auto_20177 ?auto_20204 ) ) ( not ( = ?auto_20198 ?auto_20194 ) ) ( not ( = ?auto_20198 ?auto_20187 ) ) ( not ( = ?auto_20198 ?auto_20192 ) ) ( not ( = ?auto_20198 ?auto_20196 ) ) ( not ( = ?auto_20198 ?auto_20195 ) ) ( not ( = ?auto_20198 ?auto_20188 ) ) ( not ( = ?auto_20198 ?auto_20185 ) ) ( not ( = ?auto_20198 ?auto_20204 ) ) ( not ( = ?auto_20168 ?auto_20178 ) ) ( not ( = ?auto_20168 ?auto_20181 ) ) ( not ( = ?auto_20169 ?auto_20178 ) ) ( not ( = ?auto_20169 ?auto_20181 ) ) ( not ( = ?auto_20170 ?auto_20178 ) ) ( not ( = ?auto_20170 ?auto_20181 ) ) ( not ( = ?auto_20171 ?auto_20178 ) ) ( not ( = ?auto_20171 ?auto_20181 ) ) ( not ( = ?auto_20172 ?auto_20178 ) ) ( not ( = ?auto_20172 ?auto_20181 ) ) ( not ( = ?auto_20173 ?auto_20178 ) ) ( not ( = ?auto_20173 ?auto_20181 ) ) ( not ( = ?auto_20174 ?auto_20178 ) ) ( not ( = ?auto_20174 ?auto_20181 ) ) ( not ( = ?auto_20175 ?auto_20178 ) ) ( not ( = ?auto_20175 ?auto_20181 ) ) ( not ( = ?auto_20176 ?auto_20178 ) ) ( not ( = ?auto_20176 ?auto_20181 ) ) ( not ( = ?auto_20178 ?auto_20198 ) ) ( not ( = ?auto_20178 ?auto_20194 ) ) ( not ( = ?auto_20178 ?auto_20187 ) ) ( not ( = ?auto_20178 ?auto_20192 ) ) ( not ( = ?auto_20178 ?auto_20196 ) ) ( not ( = ?auto_20178 ?auto_20195 ) ) ( not ( = ?auto_20178 ?auto_20188 ) ) ( not ( = ?auto_20178 ?auto_20185 ) ) ( not ( = ?auto_20178 ?auto_20204 ) ) ( not ( = ?auto_20182 ?auto_20200 ) ) ( not ( = ?auto_20182 ?auto_20201 ) ) ( not ( = ?auto_20182 ?auto_20191 ) ) ( not ( = ?auto_20182 ?auto_20203 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20189 ) ) ( not ( = ?auto_20180 ?auto_20186 ) ) ( not ( = ?auto_20180 ?auto_20202 ) ) ( not ( = ?auto_20180 ?auto_20205 ) ) ( not ( = ?auto_20180 ?auto_20190 ) ) ( not ( = ?auto_20180 ?auto_20193 ) ) ( not ( = ?auto_20180 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20198 ) ) ( not ( = ?auto_20181 ?auto_20194 ) ) ( not ( = ?auto_20181 ?auto_20187 ) ) ( not ( = ?auto_20181 ?auto_20192 ) ) ( not ( = ?auto_20181 ?auto_20196 ) ) ( not ( = ?auto_20181 ?auto_20195 ) ) ( not ( = ?auto_20181 ?auto_20188 ) ) ( not ( = ?auto_20181 ?auto_20185 ) ) ( not ( = ?auto_20181 ?auto_20204 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20168 ?auto_20169 ?auto_20170 ?auto_20171 ?auto_20172 ?auto_20173 ?auto_20174 ?auto_20175 ?auto_20176 ?auto_20177 )
      ( MAKE-1CRATE ?auto_20177 ?auto_20178 )
      ( MAKE-10CRATE-VERIFY ?auto_20168 ?auto_20169 ?auto_20170 ?auto_20171 ?auto_20172 ?auto_20173 ?auto_20174 ?auto_20175 ?auto_20176 ?auto_20177 ?auto_20178 ) )
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
      ?auto_20234 - SURFACE
      ?auto_20235 - SURFACE
      ?auto_20236 - SURFACE
      ?auto_20237 - SURFACE
      ?auto_20238 - SURFACE
      ?auto_20239 - SURFACE
    )
    :vars
    (
      ?auto_20243 - HOIST
      ?auto_20240 - PLACE
      ?auto_20244 - PLACE
      ?auto_20241 - HOIST
      ?auto_20242 - SURFACE
      ?auto_20266 - PLACE
      ?auto_20254 - HOIST
      ?auto_20267 - SURFACE
      ?auto_20248 - PLACE
      ?auto_20247 - HOIST
      ?auto_20256 - SURFACE
      ?auto_20252 - SURFACE
      ?auto_20249 - PLACE
      ?auto_20264 - HOIST
      ?auto_20258 - SURFACE
      ?auto_20257 - PLACE
      ?auto_20261 - HOIST
      ?auto_20263 - SURFACE
      ?auto_20259 - SURFACE
      ?auto_20251 - PLACE
      ?auto_20260 - HOIST
      ?auto_20250 - SURFACE
      ?auto_20255 - PLACE
      ?auto_20246 - HOIST
      ?auto_20253 - SURFACE
      ?auto_20262 - SURFACE
      ?auto_20265 - SURFACE
      ?auto_20245 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20243 ?auto_20240 ) ( IS-CRATE ?auto_20239 ) ( not ( = ?auto_20244 ?auto_20240 ) ) ( HOIST-AT ?auto_20241 ?auto_20244 ) ( SURFACE-AT ?auto_20239 ?auto_20244 ) ( ON ?auto_20239 ?auto_20242 ) ( CLEAR ?auto_20239 ) ( not ( = ?auto_20238 ?auto_20239 ) ) ( not ( = ?auto_20238 ?auto_20242 ) ) ( not ( = ?auto_20239 ?auto_20242 ) ) ( not ( = ?auto_20243 ?auto_20241 ) ) ( IS-CRATE ?auto_20238 ) ( not ( = ?auto_20266 ?auto_20240 ) ) ( HOIST-AT ?auto_20254 ?auto_20266 ) ( AVAILABLE ?auto_20254 ) ( SURFACE-AT ?auto_20238 ?auto_20266 ) ( ON ?auto_20238 ?auto_20267 ) ( CLEAR ?auto_20238 ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20267 ) ) ( not ( = ?auto_20238 ?auto_20267 ) ) ( not ( = ?auto_20243 ?auto_20254 ) ) ( IS-CRATE ?auto_20237 ) ( not ( = ?auto_20248 ?auto_20240 ) ) ( HOIST-AT ?auto_20247 ?auto_20248 ) ( SURFACE-AT ?auto_20237 ?auto_20248 ) ( ON ?auto_20237 ?auto_20256 ) ( CLEAR ?auto_20237 ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20256 ) ) ( not ( = ?auto_20237 ?auto_20256 ) ) ( not ( = ?auto_20243 ?auto_20247 ) ) ( IS-CRATE ?auto_20236 ) ( AVAILABLE ?auto_20241 ) ( SURFACE-AT ?auto_20236 ?auto_20244 ) ( ON ?auto_20236 ?auto_20252 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20235 ?auto_20236 ) ) ( not ( = ?auto_20235 ?auto_20252 ) ) ( not ( = ?auto_20236 ?auto_20252 ) ) ( IS-CRATE ?auto_20235 ) ( not ( = ?auto_20249 ?auto_20240 ) ) ( HOIST-AT ?auto_20264 ?auto_20249 ) ( AVAILABLE ?auto_20264 ) ( SURFACE-AT ?auto_20235 ?auto_20249 ) ( ON ?auto_20235 ?auto_20258 ) ( CLEAR ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( not ( = ?auto_20234 ?auto_20258 ) ) ( not ( = ?auto_20235 ?auto_20258 ) ) ( not ( = ?auto_20243 ?auto_20264 ) ) ( IS-CRATE ?auto_20234 ) ( not ( = ?auto_20257 ?auto_20240 ) ) ( HOIST-AT ?auto_20261 ?auto_20257 ) ( AVAILABLE ?auto_20261 ) ( SURFACE-AT ?auto_20234 ?auto_20257 ) ( ON ?auto_20234 ?auto_20263 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20233 ?auto_20234 ) ) ( not ( = ?auto_20233 ?auto_20263 ) ) ( not ( = ?auto_20234 ?auto_20263 ) ) ( not ( = ?auto_20243 ?auto_20261 ) ) ( IS-CRATE ?auto_20233 ) ( AVAILABLE ?auto_20247 ) ( SURFACE-AT ?auto_20233 ?auto_20248 ) ( ON ?auto_20233 ?auto_20259 ) ( CLEAR ?auto_20233 ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20259 ) ) ( not ( = ?auto_20233 ?auto_20259 ) ) ( IS-CRATE ?auto_20232 ) ( not ( = ?auto_20251 ?auto_20240 ) ) ( HOIST-AT ?auto_20260 ?auto_20251 ) ( AVAILABLE ?auto_20260 ) ( SURFACE-AT ?auto_20232 ?auto_20251 ) ( ON ?auto_20232 ?auto_20250 ) ( CLEAR ?auto_20232 ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20250 ) ) ( not ( = ?auto_20232 ?auto_20250 ) ) ( not ( = ?auto_20243 ?auto_20260 ) ) ( IS-CRATE ?auto_20231 ) ( not ( = ?auto_20255 ?auto_20240 ) ) ( HOIST-AT ?auto_20246 ?auto_20255 ) ( SURFACE-AT ?auto_20231 ?auto_20255 ) ( ON ?auto_20231 ?auto_20253 ) ( CLEAR ?auto_20231 ) ( not ( = ?auto_20230 ?auto_20231 ) ) ( not ( = ?auto_20230 ?auto_20253 ) ) ( not ( = ?auto_20231 ?auto_20253 ) ) ( not ( = ?auto_20243 ?auto_20246 ) ) ( IS-CRATE ?auto_20230 ) ( SURFACE-AT ?auto_20230 ?auto_20255 ) ( ON ?auto_20230 ?auto_20262 ) ( CLEAR ?auto_20230 ) ( not ( = ?auto_20229 ?auto_20230 ) ) ( not ( = ?auto_20229 ?auto_20262 ) ) ( not ( = ?auto_20230 ?auto_20262 ) ) ( SURFACE-AT ?auto_20228 ?auto_20240 ) ( CLEAR ?auto_20228 ) ( IS-CRATE ?auto_20229 ) ( AVAILABLE ?auto_20243 ) ( AVAILABLE ?auto_20246 ) ( SURFACE-AT ?auto_20229 ?auto_20255 ) ( ON ?auto_20229 ?auto_20265 ) ( CLEAR ?auto_20229 ) ( TRUCK-AT ?auto_20245 ?auto_20240 ) ( not ( = ?auto_20228 ?auto_20229 ) ) ( not ( = ?auto_20228 ?auto_20265 ) ) ( not ( = ?auto_20229 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20230 ) ) ( not ( = ?auto_20228 ?auto_20262 ) ) ( not ( = ?auto_20230 ?auto_20265 ) ) ( not ( = ?auto_20262 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20231 ) ) ( not ( = ?auto_20228 ?auto_20253 ) ) ( not ( = ?auto_20229 ?auto_20231 ) ) ( not ( = ?auto_20229 ?auto_20253 ) ) ( not ( = ?auto_20231 ?auto_20262 ) ) ( not ( = ?auto_20231 ?auto_20265 ) ) ( not ( = ?auto_20253 ?auto_20262 ) ) ( not ( = ?auto_20253 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20232 ) ) ( not ( = ?auto_20228 ?auto_20250 ) ) ( not ( = ?auto_20229 ?auto_20232 ) ) ( not ( = ?auto_20229 ?auto_20250 ) ) ( not ( = ?auto_20230 ?auto_20232 ) ) ( not ( = ?auto_20230 ?auto_20250 ) ) ( not ( = ?auto_20232 ?auto_20253 ) ) ( not ( = ?auto_20232 ?auto_20262 ) ) ( not ( = ?auto_20232 ?auto_20265 ) ) ( not ( = ?auto_20251 ?auto_20255 ) ) ( not ( = ?auto_20260 ?auto_20246 ) ) ( not ( = ?auto_20250 ?auto_20253 ) ) ( not ( = ?auto_20250 ?auto_20262 ) ) ( not ( = ?auto_20250 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20233 ) ) ( not ( = ?auto_20228 ?auto_20259 ) ) ( not ( = ?auto_20229 ?auto_20233 ) ) ( not ( = ?auto_20229 ?auto_20259 ) ) ( not ( = ?auto_20230 ?auto_20233 ) ) ( not ( = ?auto_20230 ?auto_20259 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20259 ) ) ( not ( = ?auto_20233 ?auto_20250 ) ) ( not ( = ?auto_20233 ?auto_20253 ) ) ( not ( = ?auto_20233 ?auto_20262 ) ) ( not ( = ?auto_20233 ?auto_20265 ) ) ( not ( = ?auto_20248 ?auto_20251 ) ) ( not ( = ?auto_20248 ?auto_20255 ) ) ( not ( = ?auto_20247 ?auto_20260 ) ) ( not ( = ?auto_20247 ?auto_20246 ) ) ( not ( = ?auto_20259 ?auto_20250 ) ) ( not ( = ?auto_20259 ?auto_20253 ) ) ( not ( = ?auto_20259 ?auto_20262 ) ) ( not ( = ?auto_20259 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20234 ) ) ( not ( = ?auto_20228 ?auto_20263 ) ) ( not ( = ?auto_20229 ?auto_20234 ) ) ( not ( = ?auto_20229 ?auto_20263 ) ) ( not ( = ?auto_20230 ?auto_20234 ) ) ( not ( = ?auto_20230 ?auto_20263 ) ) ( not ( = ?auto_20231 ?auto_20234 ) ) ( not ( = ?auto_20231 ?auto_20263 ) ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( not ( = ?auto_20232 ?auto_20263 ) ) ( not ( = ?auto_20234 ?auto_20259 ) ) ( not ( = ?auto_20234 ?auto_20250 ) ) ( not ( = ?auto_20234 ?auto_20253 ) ) ( not ( = ?auto_20234 ?auto_20262 ) ) ( not ( = ?auto_20234 ?auto_20265 ) ) ( not ( = ?auto_20257 ?auto_20248 ) ) ( not ( = ?auto_20257 ?auto_20251 ) ) ( not ( = ?auto_20257 ?auto_20255 ) ) ( not ( = ?auto_20261 ?auto_20247 ) ) ( not ( = ?auto_20261 ?auto_20260 ) ) ( not ( = ?auto_20261 ?auto_20246 ) ) ( not ( = ?auto_20263 ?auto_20259 ) ) ( not ( = ?auto_20263 ?auto_20250 ) ) ( not ( = ?auto_20263 ?auto_20253 ) ) ( not ( = ?auto_20263 ?auto_20262 ) ) ( not ( = ?auto_20263 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20235 ) ) ( not ( = ?auto_20228 ?auto_20258 ) ) ( not ( = ?auto_20229 ?auto_20235 ) ) ( not ( = ?auto_20229 ?auto_20258 ) ) ( not ( = ?auto_20230 ?auto_20235 ) ) ( not ( = ?auto_20230 ?auto_20258 ) ) ( not ( = ?auto_20231 ?auto_20235 ) ) ( not ( = ?auto_20231 ?auto_20258 ) ) ( not ( = ?auto_20232 ?auto_20235 ) ) ( not ( = ?auto_20232 ?auto_20258 ) ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20233 ?auto_20258 ) ) ( not ( = ?auto_20235 ?auto_20263 ) ) ( not ( = ?auto_20235 ?auto_20259 ) ) ( not ( = ?auto_20235 ?auto_20250 ) ) ( not ( = ?auto_20235 ?auto_20253 ) ) ( not ( = ?auto_20235 ?auto_20262 ) ) ( not ( = ?auto_20235 ?auto_20265 ) ) ( not ( = ?auto_20249 ?auto_20257 ) ) ( not ( = ?auto_20249 ?auto_20248 ) ) ( not ( = ?auto_20249 ?auto_20251 ) ) ( not ( = ?auto_20249 ?auto_20255 ) ) ( not ( = ?auto_20264 ?auto_20261 ) ) ( not ( = ?auto_20264 ?auto_20247 ) ) ( not ( = ?auto_20264 ?auto_20260 ) ) ( not ( = ?auto_20264 ?auto_20246 ) ) ( not ( = ?auto_20258 ?auto_20263 ) ) ( not ( = ?auto_20258 ?auto_20259 ) ) ( not ( = ?auto_20258 ?auto_20250 ) ) ( not ( = ?auto_20258 ?auto_20253 ) ) ( not ( = ?auto_20258 ?auto_20262 ) ) ( not ( = ?auto_20258 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20236 ) ) ( not ( = ?auto_20228 ?auto_20252 ) ) ( not ( = ?auto_20229 ?auto_20236 ) ) ( not ( = ?auto_20229 ?auto_20252 ) ) ( not ( = ?auto_20230 ?auto_20236 ) ) ( not ( = ?auto_20230 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20236 ) ) ( not ( = ?auto_20231 ?auto_20252 ) ) ( not ( = ?auto_20232 ?auto_20236 ) ) ( not ( = ?auto_20232 ?auto_20252 ) ) ( not ( = ?auto_20233 ?auto_20236 ) ) ( not ( = ?auto_20233 ?auto_20252 ) ) ( not ( = ?auto_20234 ?auto_20236 ) ) ( not ( = ?auto_20234 ?auto_20252 ) ) ( not ( = ?auto_20236 ?auto_20258 ) ) ( not ( = ?auto_20236 ?auto_20263 ) ) ( not ( = ?auto_20236 ?auto_20259 ) ) ( not ( = ?auto_20236 ?auto_20250 ) ) ( not ( = ?auto_20236 ?auto_20253 ) ) ( not ( = ?auto_20236 ?auto_20262 ) ) ( not ( = ?auto_20236 ?auto_20265 ) ) ( not ( = ?auto_20244 ?auto_20249 ) ) ( not ( = ?auto_20244 ?auto_20257 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20244 ?auto_20251 ) ) ( not ( = ?auto_20244 ?auto_20255 ) ) ( not ( = ?auto_20241 ?auto_20264 ) ) ( not ( = ?auto_20241 ?auto_20261 ) ) ( not ( = ?auto_20241 ?auto_20247 ) ) ( not ( = ?auto_20241 ?auto_20260 ) ) ( not ( = ?auto_20241 ?auto_20246 ) ) ( not ( = ?auto_20252 ?auto_20258 ) ) ( not ( = ?auto_20252 ?auto_20263 ) ) ( not ( = ?auto_20252 ?auto_20259 ) ) ( not ( = ?auto_20252 ?auto_20250 ) ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20252 ?auto_20262 ) ) ( not ( = ?auto_20252 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20237 ) ) ( not ( = ?auto_20228 ?auto_20256 ) ) ( not ( = ?auto_20229 ?auto_20237 ) ) ( not ( = ?auto_20229 ?auto_20256 ) ) ( not ( = ?auto_20230 ?auto_20237 ) ) ( not ( = ?auto_20230 ?auto_20256 ) ) ( not ( = ?auto_20231 ?auto_20237 ) ) ( not ( = ?auto_20231 ?auto_20256 ) ) ( not ( = ?auto_20232 ?auto_20237 ) ) ( not ( = ?auto_20232 ?auto_20256 ) ) ( not ( = ?auto_20233 ?auto_20237 ) ) ( not ( = ?auto_20233 ?auto_20256 ) ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20234 ?auto_20256 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20256 ) ) ( not ( = ?auto_20237 ?auto_20252 ) ) ( not ( = ?auto_20237 ?auto_20258 ) ) ( not ( = ?auto_20237 ?auto_20263 ) ) ( not ( = ?auto_20237 ?auto_20259 ) ) ( not ( = ?auto_20237 ?auto_20250 ) ) ( not ( = ?auto_20237 ?auto_20253 ) ) ( not ( = ?auto_20237 ?auto_20262 ) ) ( not ( = ?auto_20237 ?auto_20265 ) ) ( not ( = ?auto_20256 ?auto_20252 ) ) ( not ( = ?auto_20256 ?auto_20258 ) ) ( not ( = ?auto_20256 ?auto_20263 ) ) ( not ( = ?auto_20256 ?auto_20259 ) ) ( not ( = ?auto_20256 ?auto_20250 ) ) ( not ( = ?auto_20256 ?auto_20253 ) ) ( not ( = ?auto_20256 ?auto_20262 ) ) ( not ( = ?auto_20256 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20238 ) ) ( not ( = ?auto_20228 ?auto_20267 ) ) ( not ( = ?auto_20229 ?auto_20238 ) ) ( not ( = ?auto_20229 ?auto_20267 ) ) ( not ( = ?auto_20230 ?auto_20238 ) ) ( not ( = ?auto_20230 ?auto_20267 ) ) ( not ( = ?auto_20231 ?auto_20238 ) ) ( not ( = ?auto_20231 ?auto_20267 ) ) ( not ( = ?auto_20232 ?auto_20238 ) ) ( not ( = ?auto_20232 ?auto_20267 ) ) ( not ( = ?auto_20233 ?auto_20238 ) ) ( not ( = ?auto_20233 ?auto_20267 ) ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20234 ?auto_20267 ) ) ( not ( = ?auto_20235 ?auto_20238 ) ) ( not ( = ?auto_20235 ?auto_20267 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20267 ) ) ( not ( = ?auto_20238 ?auto_20256 ) ) ( not ( = ?auto_20238 ?auto_20252 ) ) ( not ( = ?auto_20238 ?auto_20258 ) ) ( not ( = ?auto_20238 ?auto_20263 ) ) ( not ( = ?auto_20238 ?auto_20259 ) ) ( not ( = ?auto_20238 ?auto_20250 ) ) ( not ( = ?auto_20238 ?auto_20253 ) ) ( not ( = ?auto_20238 ?auto_20262 ) ) ( not ( = ?auto_20238 ?auto_20265 ) ) ( not ( = ?auto_20266 ?auto_20248 ) ) ( not ( = ?auto_20266 ?auto_20244 ) ) ( not ( = ?auto_20266 ?auto_20249 ) ) ( not ( = ?auto_20266 ?auto_20257 ) ) ( not ( = ?auto_20266 ?auto_20251 ) ) ( not ( = ?auto_20266 ?auto_20255 ) ) ( not ( = ?auto_20254 ?auto_20247 ) ) ( not ( = ?auto_20254 ?auto_20241 ) ) ( not ( = ?auto_20254 ?auto_20264 ) ) ( not ( = ?auto_20254 ?auto_20261 ) ) ( not ( = ?auto_20254 ?auto_20260 ) ) ( not ( = ?auto_20254 ?auto_20246 ) ) ( not ( = ?auto_20267 ?auto_20256 ) ) ( not ( = ?auto_20267 ?auto_20252 ) ) ( not ( = ?auto_20267 ?auto_20258 ) ) ( not ( = ?auto_20267 ?auto_20263 ) ) ( not ( = ?auto_20267 ?auto_20259 ) ) ( not ( = ?auto_20267 ?auto_20250 ) ) ( not ( = ?auto_20267 ?auto_20253 ) ) ( not ( = ?auto_20267 ?auto_20262 ) ) ( not ( = ?auto_20267 ?auto_20265 ) ) ( not ( = ?auto_20228 ?auto_20239 ) ) ( not ( = ?auto_20228 ?auto_20242 ) ) ( not ( = ?auto_20229 ?auto_20239 ) ) ( not ( = ?auto_20229 ?auto_20242 ) ) ( not ( = ?auto_20230 ?auto_20239 ) ) ( not ( = ?auto_20230 ?auto_20242 ) ) ( not ( = ?auto_20231 ?auto_20239 ) ) ( not ( = ?auto_20231 ?auto_20242 ) ) ( not ( = ?auto_20232 ?auto_20239 ) ) ( not ( = ?auto_20232 ?auto_20242 ) ) ( not ( = ?auto_20233 ?auto_20239 ) ) ( not ( = ?auto_20233 ?auto_20242 ) ) ( not ( = ?auto_20234 ?auto_20239 ) ) ( not ( = ?auto_20234 ?auto_20242 ) ) ( not ( = ?auto_20235 ?auto_20239 ) ) ( not ( = ?auto_20235 ?auto_20242 ) ) ( not ( = ?auto_20236 ?auto_20239 ) ) ( not ( = ?auto_20236 ?auto_20242 ) ) ( not ( = ?auto_20237 ?auto_20239 ) ) ( not ( = ?auto_20237 ?auto_20242 ) ) ( not ( = ?auto_20239 ?auto_20267 ) ) ( not ( = ?auto_20239 ?auto_20256 ) ) ( not ( = ?auto_20239 ?auto_20252 ) ) ( not ( = ?auto_20239 ?auto_20258 ) ) ( not ( = ?auto_20239 ?auto_20263 ) ) ( not ( = ?auto_20239 ?auto_20259 ) ) ( not ( = ?auto_20239 ?auto_20250 ) ) ( not ( = ?auto_20239 ?auto_20253 ) ) ( not ( = ?auto_20239 ?auto_20262 ) ) ( not ( = ?auto_20239 ?auto_20265 ) ) ( not ( = ?auto_20242 ?auto_20267 ) ) ( not ( = ?auto_20242 ?auto_20256 ) ) ( not ( = ?auto_20242 ?auto_20252 ) ) ( not ( = ?auto_20242 ?auto_20258 ) ) ( not ( = ?auto_20242 ?auto_20263 ) ) ( not ( = ?auto_20242 ?auto_20259 ) ) ( not ( = ?auto_20242 ?auto_20250 ) ) ( not ( = ?auto_20242 ?auto_20253 ) ) ( not ( = ?auto_20242 ?auto_20262 ) ) ( not ( = ?auto_20242 ?auto_20265 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20228 ?auto_20229 ?auto_20230 ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20238 )
      ( MAKE-1CRATE ?auto_20238 ?auto_20239 )
      ( MAKE-11CRATE-VERIFY ?auto_20228 ?auto_20229 ?auto_20230 ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20238 ?auto_20239 ) )
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
      ?auto_20297 - SURFACE
      ?auto_20298 - SURFACE
      ?auto_20299 - SURFACE
      ?auto_20300 - SURFACE
      ?auto_20301 - SURFACE
      ?auto_20302 - SURFACE
      ?auto_20303 - SURFACE
    )
    :vars
    (
      ?auto_20307 - HOIST
      ?auto_20305 - PLACE
      ?auto_20308 - PLACE
      ?auto_20306 - HOIST
      ?auto_20309 - SURFACE
      ?auto_20321 - PLACE
      ?auto_20310 - HOIST
      ?auto_20314 - SURFACE
      ?auto_20331 - PLACE
      ?auto_20319 - HOIST
      ?auto_20333 - SURFACE
      ?auto_20315 - PLACE
      ?auto_20334 - HOIST
      ?auto_20324 - SURFACE
      ?auto_20326 - SURFACE
      ?auto_20322 - PLACE
      ?auto_20317 - HOIST
      ?auto_20329 - SURFACE
      ?auto_20325 - PLACE
      ?auto_20320 - HOIST
      ?auto_20327 - SURFACE
      ?auto_20313 - SURFACE
      ?auto_20318 - PLACE
      ?auto_20330 - HOIST
      ?auto_20311 - SURFACE
      ?auto_20332 - PLACE
      ?auto_20323 - HOIST
      ?auto_20328 - SURFACE
      ?auto_20316 - SURFACE
      ?auto_20312 - SURFACE
      ?auto_20304 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20307 ?auto_20305 ) ( IS-CRATE ?auto_20303 ) ( not ( = ?auto_20308 ?auto_20305 ) ) ( HOIST-AT ?auto_20306 ?auto_20308 ) ( AVAILABLE ?auto_20306 ) ( SURFACE-AT ?auto_20303 ?auto_20308 ) ( ON ?auto_20303 ?auto_20309 ) ( CLEAR ?auto_20303 ) ( not ( = ?auto_20302 ?auto_20303 ) ) ( not ( = ?auto_20302 ?auto_20309 ) ) ( not ( = ?auto_20303 ?auto_20309 ) ) ( not ( = ?auto_20307 ?auto_20306 ) ) ( IS-CRATE ?auto_20302 ) ( not ( = ?auto_20321 ?auto_20305 ) ) ( HOIST-AT ?auto_20310 ?auto_20321 ) ( SURFACE-AT ?auto_20302 ?auto_20321 ) ( ON ?auto_20302 ?auto_20314 ) ( CLEAR ?auto_20302 ) ( not ( = ?auto_20301 ?auto_20302 ) ) ( not ( = ?auto_20301 ?auto_20314 ) ) ( not ( = ?auto_20302 ?auto_20314 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( IS-CRATE ?auto_20301 ) ( not ( = ?auto_20331 ?auto_20305 ) ) ( HOIST-AT ?auto_20319 ?auto_20331 ) ( AVAILABLE ?auto_20319 ) ( SURFACE-AT ?auto_20301 ?auto_20331 ) ( ON ?auto_20301 ?auto_20333 ) ( CLEAR ?auto_20301 ) ( not ( = ?auto_20300 ?auto_20301 ) ) ( not ( = ?auto_20300 ?auto_20333 ) ) ( not ( = ?auto_20301 ?auto_20333 ) ) ( not ( = ?auto_20307 ?auto_20319 ) ) ( IS-CRATE ?auto_20300 ) ( not ( = ?auto_20315 ?auto_20305 ) ) ( HOIST-AT ?auto_20334 ?auto_20315 ) ( SURFACE-AT ?auto_20300 ?auto_20315 ) ( ON ?auto_20300 ?auto_20324 ) ( CLEAR ?auto_20300 ) ( not ( = ?auto_20299 ?auto_20300 ) ) ( not ( = ?auto_20299 ?auto_20324 ) ) ( not ( = ?auto_20300 ?auto_20324 ) ) ( not ( = ?auto_20307 ?auto_20334 ) ) ( IS-CRATE ?auto_20299 ) ( AVAILABLE ?auto_20310 ) ( SURFACE-AT ?auto_20299 ?auto_20321 ) ( ON ?auto_20299 ?auto_20326 ) ( CLEAR ?auto_20299 ) ( not ( = ?auto_20298 ?auto_20299 ) ) ( not ( = ?auto_20298 ?auto_20326 ) ) ( not ( = ?auto_20299 ?auto_20326 ) ) ( IS-CRATE ?auto_20298 ) ( not ( = ?auto_20322 ?auto_20305 ) ) ( HOIST-AT ?auto_20317 ?auto_20322 ) ( AVAILABLE ?auto_20317 ) ( SURFACE-AT ?auto_20298 ?auto_20322 ) ( ON ?auto_20298 ?auto_20329 ) ( CLEAR ?auto_20298 ) ( not ( = ?auto_20297 ?auto_20298 ) ) ( not ( = ?auto_20297 ?auto_20329 ) ) ( not ( = ?auto_20298 ?auto_20329 ) ) ( not ( = ?auto_20307 ?auto_20317 ) ) ( IS-CRATE ?auto_20297 ) ( not ( = ?auto_20325 ?auto_20305 ) ) ( HOIST-AT ?auto_20320 ?auto_20325 ) ( AVAILABLE ?auto_20320 ) ( SURFACE-AT ?auto_20297 ?auto_20325 ) ( ON ?auto_20297 ?auto_20327 ) ( CLEAR ?auto_20297 ) ( not ( = ?auto_20296 ?auto_20297 ) ) ( not ( = ?auto_20296 ?auto_20327 ) ) ( not ( = ?auto_20297 ?auto_20327 ) ) ( not ( = ?auto_20307 ?auto_20320 ) ) ( IS-CRATE ?auto_20296 ) ( AVAILABLE ?auto_20334 ) ( SURFACE-AT ?auto_20296 ?auto_20315 ) ( ON ?auto_20296 ?auto_20313 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20313 ) ) ( not ( = ?auto_20296 ?auto_20313 ) ) ( IS-CRATE ?auto_20295 ) ( not ( = ?auto_20318 ?auto_20305 ) ) ( HOIST-AT ?auto_20330 ?auto_20318 ) ( AVAILABLE ?auto_20330 ) ( SURFACE-AT ?auto_20295 ?auto_20318 ) ( ON ?auto_20295 ?auto_20311 ) ( CLEAR ?auto_20295 ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( not ( = ?auto_20294 ?auto_20311 ) ) ( not ( = ?auto_20295 ?auto_20311 ) ) ( not ( = ?auto_20307 ?auto_20330 ) ) ( IS-CRATE ?auto_20294 ) ( not ( = ?auto_20332 ?auto_20305 ) ) ( HOIST-AT ?auto_20323 ?auto_20332 ) ( SURFACE-AT ?auto_20294 ?auto_20332 ) ( ON ?auto_20294 ?auto_20328 ) ( CLEAR ?auto_20294 ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20328 ) ) ( not ( = ?auto_20294 ?auto_20328 ) ) ( not ( = ?auto_20307 ?auto_20323 ) ) ( IS-CRATE ?auto_20293 ) ( SURFACE-AT ?auto_20293 ?auto_20332 ) ( ON ?auto_20293 ?auto_20316 ) ( CLEAR ?auto_20293 ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20316 ) ) ( not ( = ?auto_20293 ?auto_20316 ) ) ( SURFACE-AT ?auto_20291 ?auto_20305 ) ( CLEAR ?auto_20291 ) ( IS-CRATE ?auto_20292 ) ( AVAILABLE ?auto_20307 ) ( AVAILABLE ?auto_20323 ) ( SURFACE-AT ?auto_20292 ?auto_20332 ) ( ON ?auto_20292 ?auto_20312 ) ( CLEAR ?auto_20292 ) ( TRUCK-AT ?auto_20304 ?auto_20305 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20312 ) ) ( not ( = ?auto_20292 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20316 ) ) ( not ( = ?auto_20293 ?auto_20312 ) ) ( not ( = ?auto_20316 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20328 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20328 ) ) ( not ( = ?auto_20294 ?auto_20316 ) ) ( not ( = ?auto_20294 ?auto_20312 ) ) ( not ( = ?auto_20328 ?auto_20316 ) ) ( not ( = ?auto_20328 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20295 ) ) ( not ( = ?auto_20291 ?auto_20311 ) ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20292 ?auto_20311 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20311 ) ) ( not ( = ?auto_20295 ?auto_20328 ) ) ( not ( = ?auto_20295 ?auto_20316 ) ) ( not ( = ?auto_20295 ?auto_20312 ) ) ( not ( = ?auto_20318 ?auto_20332 ) ) ( not ( = ?auto_20330 ?auto_20323 ) ) ( not ( = ?auto_20311 ?auto_20328 ) ) ( not ( = ?auto_20311 ?auto_20316 ) ) ( not ( = ?auto_20311 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20296 ) ) ( not ( = ?auto_20291 ?auto_20313 ) ) ( not ( = ?auto_20292 ?auto_20296 ) ) ( not ( = ?auto_20292 ?auto_20313 ) ) ( not ( = ?auto_20293 ?auto_20296 ) ) ( not ( = ?auto_20293 ?auto_20313 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20313 ) ) ( not ( = ?auto_20296 ?auto_20311 ) ) ( not ( = ?auto_20296 ?auto_20328 ) ) ( not ( = ?auto_20296 ?auto_20316 ) ) ( not ( = ?auto_20296 ?auto_20312 ) ) ( not ( = ?auto_20315 ?auto_20318 ) ) ( not ( = ?auto_20315 ?auto_20332 ) ) ( not ( = ?auto_20334 ?auto_20330 ) ) ( not ( = ?auto_20334 ?auto_20323 ) ) ( not ( = ?auto_20313 ?auto_20311 ) ) ( not ( = ?auto_20313 ?auto_20328 ) ) ( not ( = ?auto_20313 ?auto_20316 ) ) ( not ( = ?auto_20313 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20297 ) ) ( not ( = ?auto_20291 ?auto_20327 ) ) ( not ( = ?auto_20292 ?auto_20297 ) ) ( not ( = ?auto_20292 ?auto_20327 ) ) ( not ( = ?auto_20293 ?auto_20297 ) ) ( not ( = ?auto_20293 ?auto_20327 ) ) ( not ( = ?auto_20294 ?auto_20297 ) ) ( not ( = ?auto_20294 ?auto_20327 ) ) ( not ( = ?auto_20295 ?auto_20297 ) ) ( not ( = ?auto_20295 ?auto_20327 ) ) ( not ( = ?auto_20297 ?auto_20313 ) ) ( not ( = ?auto_20297 ?auto_20311 ) ) ( not ( = ?auto_20297 ?auto_20328 ) ) ( not ( = ?auto_20297 ?auto_20316 ) ) ( not ( = ?auto_20297 ?auto_20312 ) ) ( not ( = ?auto_20325 ?auto_20315 ) ) ( not ( = ?auto_20325 ?auto_20318 ) ) ( not ( = ?auto_20325 ?auto_20332 ) ) ( not ( = ?auto_20320 ?auto_20334 ) ) ( not ( = ?auto_20320 ?auto_20330 ) ) ( not ( = ?auto_20320 ?auto_20323 ) ) ( not ( = ?auto_20327 ?auto_20313 ) ) ( not ( = ?auto_20327 ?auto_20311 ) ) ( not ( = ?auto_20327 ?auto_20328 ) ) ( not ( = ?auto_20327 ?auto_20316 ) ) ( not ( = ?auto_20327 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20298 ) ) ( not ( = ?auto_20291 ?auto_20329 ) ) ( not ( = ?auto_20292 ?auto_20298 ) ) ( not ( = ?auto_20292 ?auto_20329 ) ) ( not ( = ?auto_20293 ?auto_20298 ) ) ( not ( = ?auto_20293 ?auto_20329 ) ) ( not ( = ?auto_20294 ?auto_20298 ) ) ( not ( = ?auto_20294 ?auto_20329 ) ) ( not ( = ?auto_20295 ?auto_20298 ) ) ( not ( = ?auto_20295 ?auto_20329 ) ) ( not ( = ?auto_20296 ?auto_20298 ) ) ( not ( = ?auto_20296 ?auto_20329 ) ) ( not ( = ?auto_20298 ?auto_20327 ) ) ( not ( = ?auto_20298 ?auto_20313 ) ) ( not ( = ?auto_20298 ?auto_20311 ) ) ( not ( = ?auto_20298 ?auto_20328 ) ) ( not ( = ?auto_20298 ?auto_20316 ) ) ( not ( = ?auto_20298 ?auto_20312 ) ) ( not ( = ?auto_20322 ?auto_20325 ) ) ( not ( = ?auto_20322 ?auto_20315 ) ) ( not ( = ?auto_20322 ?auto_20318 ) ) ( not ( = ?auto_20322 ?auto_20332 ) ) ( not ( = ?auto_20317 ?auto_20320 ) ) ( not ( = ?auto_20317 ?auto_20334 ) ) ( not ( = ?auto_20317 ?auto_20330 ) ) ( not ( = ?auto_20317 ?auto_20323 ) ) ( not ( = ?auto_20329 ?auto_20327 ) ) ( not ( = ?auto_20329 ?auto_20313 ) ) ( not ( = ?auto_20329 ?auto_20311 ) ) ( not ( = ?auto_20329 ?auto_20328 ) ) ( not ( = ?auto_20329 ?auto_20316 ) ) ( not ( = ?auto_20329 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20299 ) ) ( not ( = ?auto_20291 ?auto_20326 ) ) ( not ( = ?auto_20292 ?auto_20299 ) ) ( not ( = ?auto_20292 ?auto_20326 ) ) ( not ( = ?auto_20293 ?auto_20299 ) ) ( not ( = ?auto_20293 ?auto_20326 ) ) ( not ( = ?auto_20294 ?auto_20299 ) ) ( not ( = ?auto_20294 ?auto_20326 ) ) ( not ( = ?auto_20295 ?auto_20299 ) ) ( not ( = ?auto_20295 ?auto_20326 ) ) ( not ( = ?auto_20296 ?auto_20299 ) ) ( not ( = ?auto_20296 ?auto_20326 ) ) ( not ( = ?auto_20297 ?auto_20299 ) ) ( not ( = ?auto_20297 ?auto_20326 ) ) ( not ( = ?auto_20299 ?auto_20329 ) ) ( not ( = ?auto_20299 ?auto_20327 ) ) ( not ( = ?auto_20299 ?auto_20313 ) ) ( not ( = ?auto_20299 ?auto_20311 ) ) ( not ( = ?auto_20299 ?auto_20328 ) ) ( not ( = ?auto_20299 ?auto_20316 ) ) ( not ( = ?auto_20299 ?auto_20312 ) ) ( not ( = ?auto_20321 ?auto_20322 ) ) ( not ( = ?auto_20321 ?auto_20325 ) ) ( not ( = ?auto_20321 ?auto_20315 ) ) ( not ( = ?auto_20321 ?auto_20318 ) ) ( not ( = ?auto_20321 ?auto_20332 ) ) ( not ( = ?auto_20310 ?auto_20317 ) ) ( not ( = ?auto_20310 ?auto_20320 ) ) ( not ( = ?auto_20310 ?auto_20334 ) ) ( not ( = ?auto_20310 ?auto_20330 ) ) ( not ( = ?auto_20310 ?auto_20323 ) ) ( not ( = ?auto_20326 ?auto_20329 ) ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20313 ) ) ( not ( = ?auto_20326 ?auto_20311 ) ) ( not ( = ?auto_20326 ?auto_20328 ) ) ( not ( = ?auto_20326 ?auto_20316 ) ) ( not ( = ?auto_20326 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20300 ) ) ( not ( = ?auto_20291 ?auto_20324 ) ) ( not ( = ?auto_20292 ?auto_20300 ) ) ( not ( = ?auto_20292 ?auto_20324 ) ) ( not ( = ?auto_20293 ?auto_20300 ) ) ( not ( = ?auto_20293 ?auto_20324 ) ) ( not ( = ?auto_20294 ?auto_20300 ) ) ( not ( = ?auto_20294 ?auto_20324 ) ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20295 ?auto_20324 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20324 ) ) ( not ( = ?auto_20297 ?auto_20300 ) ) ( not ( = ?auto_20297 ?auto_20324 ) ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( not ( = ?auto_20298 ?auto_20324 ) ) ( not ( = ?auto_20300 ?auto_20326 ) ) ( not ( = ?auto_20300 ?auto_20329 ) ) ( not ( = ?auto_20300 ?auto_20327 ) ) ( not ( = ?auto_20300 ?auto_20313 ) ) ( not ( = ?auto_20300 ?auto_20311 ) ) ( not ( = ?auto_20300 ?auto_20328 ) ) ( not ( = ?auto_20300 ?auto_20316 ) ) ( not ( = ?auto_20300 ?auto_20312 ) ) ( not ( = ?auto_20324 ?auto_20326 ) ) ( not ( = ?auto_20324 ?auto_20329 ) ) ( not ( = ?auto_20324 ?auto_20327 ) ) ( not ( = ?auto_20324 ?auto_20313 ) ) ( not ( = ?auto_20324 ?auto_20311 ) ) ( not ( = ?auto_20324 ?auto_20328 ) ) ( not ( = ?auto_20324 ?auto_20316 ) ) ( not ( = ?auto_20324 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20301 ) ) ( not ( = ?auto_20291 ?auto_20333 ) ) ( not ( = ?auto_20292 ?auto_20301 ) ) ( not ( = ?auto_20292 ?auto_20333 ) ) ( not ( = ?auto_20293 ?auto_20301 ) ) ( not ( = ?auto_20293 ?auto_20333 ) ) ( not ( = ?auto_20294 ?auto_20301 ) ) ( not ( = ?auto_20294 ?auto_20333 ) ) ( not ( = ?auto_20295 ?auto_20301 ) ) ( not ( = ?auto_20295 ?auto_20333 ) ) ( not ( = ?auto_20296 ?auto_20301 ) ) ( not ( = ?auto_20296 ?auto_20333 ) ) ( not ( = ?auto_20297 ?auto_20301 ) ) ( not ( = ?auto_20297 ?auto_20333 ) ) ( not ( = ?auto_20298 ?auto_20301 ) ) ( not ( = ?auto_20298 ?auto_20333 ) ) ( not ( = ?auto_20299 ?auto_20301 ) ) ( not ( = ?auto_20299 ?auto_20333 ) ) ( not ( = ?auto_20301 ?auto_20324 ) ) ( not ( = ?auto_20301 ?auto_20326 ) ) ( not ( = ?auto_20301 ?auto_20329 ) ) ( not ( = ?auto_20301 ?auto_20327 ) ) ( not ( = ?auto_20301 ?auto_20313 ) ) ( not ( = ?auto_20301 ?auto_20311 ) ) ( not ( = ?auto_20301 ?auto_20328 ) ) ( not ( = ?auto_20301 ?auto_20316 ) ) ( not ( = ?auto_20301 ?auto_20312 ) ) ( not ( = ?auto_20331 ?auto_20315 ) ) ( not ( = ?auto_20331 ?auto_20321 ) ) ( not ( = ?auto_20331 ?auto_20322 ) ) ( not ( = ?auto_20331 ?auto_20325 ) ) ( not ( = ?auto_20331 ?auto_20318 ) ) ( not ( = ?auto_20331 ?auto_20332 ) ) ( not ( = ?auto_20319 ?auto_20334 ) ) ( not ( = ?auto_20319 ?auto_20310 ) ) ( not ( = ?auto_20319 ?auto_20317 ) ) ( not ( = ?auto_20319 ?auto_20320 ) ) ( not ( = ?auto_20319 ?auto_20330 ) ) ( not ( = ?auto_20319 ?auto_20323 ) ) ( not ( = ?auto_20333 ?auto_20324 ) ) ( not ( = ?auto_20333 ?auto_20326 ) ) ( not ( = ?auto_20333 ?auto_20329 ) ) ( not ( = ?auto_20333 ?auto_20327 ) ) ( not ( = ?auto_20333 ?auto_20313 ) ) ( not ( = ?auto_20333 ?auto_20311 ) ) ( not ( = ?auto_20333 ?auto_20328 ) ) ( not ( = ?auto_20333 ?auto_20316 ) ) ( not ( = ?auto_20333 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20302 ) ) ( not ( = ?auto_20291 ?auto_20314 ) ) ( not ( = ?auto_20292 ?auto_20302 ) ) ( not ( = ?auto_20292 ?auto_20314 ) ) ( not ( = ?auto_20293 ?auto_20302 ) ) ( not ( = ?auto_20293 ?auto_20314 ) ) ( not ( = ?auto_20294 ?auto_20302 ) ) ( not ( = ?auto_20294 ?auto_20314 ) ) ( not ( = ?auto_20295 ?auto_20302 ) ) ( not ( = ?auto_20295 ?auto_20314 ) ) ( not ( = ?auto_20296 ?auto_20302 ) ) ( not ( = ?auto_20296 ?auto_20314 ) ) ( not ( = ?auto_20297 ?auto_20302 ) ) ( not ( = ?auto_20297 ?auto_20314 ) ) ( not ( = ?auto_20298 ?auto_20302 ) ) ( not ( = ?auto_20298 ?auto_20314 ) ) ( not ( = ?auto_20299 ?auto_20302 ) ) ( not ( = ?auto_20299 ?auto_20314 ) ) ( not ( = ?auto_20300 ?auto_20302 ) ) ( not ( = ?auto_20300 ?auto_20314 ) ) ( not ( = ?auto_20302 ?auto_20333 ) ) ( not ( = ?auto_20302 ?auto_20324 ) ) ( not ( = ?auto_20302 ?auto_20326 ) ) ( not ( = ?auto_20302 ?auto_20329 ) ) ( not ( = ?auto_20302 ?auto_20327 ) ) ( not ( = ?auto_20302 ?auto_20313 ) ) ( not ( = ?auto_20302 ?auto_20311 ) ) ( not ( = ?auto_20302 ?auto_20328 ) ) ( not ( = ?auto_20302 ?auto_20316 ) ) ( not ( = ?auto_20302 ?auto_20312 ) ) ( not ( = ?auto_20314 ?auto_20333 ) ) ( not ( = ?auto_20314 ?auto_20324 ) ) ( not ( = ?auto_20314 ?auto_20326 ) ) ( not ( = ?auto_20314 ?auto_20329 ) ) ( not ( = ?auto_20314 ?auto_20327 ) ) ( not ( = ?auto_20314 ?auto_20313 ) ) ( not ( = ?auto_20314 ?auto_20311 ) ) ( not ( = ?auto_20314 ?auto_20328 ) ) ( not ( = ?auto_20314 ?auto_20316 ) ) ( not ( = ?auto_20314 ?auto_20312 ) ) ( not ( = ?auto_20291 ?auto_20303 ) ) ( not ( = ?auto_20291 ?auto_20309 ) ) ( not ( = ?auto_20292 ?auto_20303 ) ) ( not ( = ?auto_20292 ?auto_20309 ) ) ( not ( = ?auto_20293 ?auto_20303 ) ) ( not ( = ?auto_20293 ?auto_20309 ) ) ( not ( = ?auto_20294 ?auto_20303 ) ) ( not ( = ?auto_20294 ?auto_20309 ) ) ( not ( = ?auto_20295 ?auto_20303 ) ) ( not ( = ?auto_20295 ?auto_20309 ) ) ( not ( = ?auto_20296 ?auto_20303 ) ) ( not ( = ?auto_20296 ?auto_20309 ) ) ( not ( = ?auto_20297 ?auto_20303 ) ) ( not ( = ?auto_20297 ?auto_20309 ) ) ( not ( = ?auto_20298 ?auto_20303 ) ) ( not ( = ?auto_20298 ?auto_20309 ) ) ( not ( = ?auto_20299 ?auto_20303 ) ) ( not ( = ?auto_20299 ?auto_20309 ) ) ( not ( = ?auto_20300 ?auto_20303 ) ) ( not ( = ?auto_20300 ?auto_20309 ) ) ( not ( = ?auto_20301 ?auto_20303 ) ) ( not ( = ?auto_20301 ?auto_20309 ) ) ( not ( = ?auto_20303 ?auto_20314 ) ) ( not ( = ?auto_20303 ?auto_20333 ) ) ( not ( = ?auto_20303 ?auto_20324 ) ) ( not ( = ?auto_20303 ?auto_20326 ) ) ( not ( = ?auto_20303 ?auto_20329 ) ) ( not ( = ?auto_20303 ?auto_20327 ) ) ( not ( = ?auto_20303 ?auto_20313 ) ) ( not ( = ?auto_20303 ?auto_20311 ) ) ( not ( = ?auto_20303 ?auto_20328 ) ) ( not ( = ?auto_20303 ?auto_20316 ) ) ( not ( = ?auto_20303 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20321 ) ) ( not ( = ?auto_20308 ?auto_20331 ) ) ( not ( = ?auto_20308 ?auto_20315 ) ) ( not ( = ?auto_20308 ?auto_20322 ) ) ( not ( = ?auto_20308 ?auto_20325 ) ) ( not ( = ?auto_20308 ?auto_20318 ) ) ( not ( = ?auto_20308 ?auto_20332 ) ) ( not ( = ?auto_20306 ?auto_20310 ) ) ( not ( = ?auto_20306 ?auto_20319 ) ) ( not ( = ?auto_20306 ?auto_20334 ) ) ( not ( = ?auto_20306 ?auto_20317 ) ) ( not ( = ?auto_20306 ?auto_20320 ) ) ( not ( = ?auto_20306 ?auto_20330 ) ) ( not ( = ?auto_20306 ?auto_20323 ) ) ( not ( = ?auto_20309 ?auto_20314 ) ) ( not ( = ?auto_20309 ?auto_20333 ) ) ( not ( = ?auto_20309 ?auto_20324 ) ) ( not ( = ?auto_20309 ?auto_20326 ) ) ( not ( = ?auto_20309 ?auto_20329 ) ) ( not ( = ?auto_20309 ?auto_20327 ) ) ( not ( = ?auto_20309 ?auto_20313 ) ) ( not ( = ?auto_20309 ?auto_20311 ) ) ( not ( = ?auto_20309 ?auto_20328 ) ) ( not ( = ?auto_20309 ?auto_20316 ) ) ( not ( = ?auto_20309 ?auto_20312 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ?auto_20297 ?auto_20298 ?auto_20299 ?auto_20300 ?auto_20301 ?auto_20302 )
      ( MAKE-1CRATE ?auto_20302 ?auto_20303 )
      ( MAKE-12CRATE-VERIFY ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ?auto_20297 ?auto_20298 ?auto_20299 ?auto_20300 ?auto_20301 ?auto_20302 ?auto_20303 ) )
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
      ?auto_20365 - SURFACE
      ?auto_20366 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20368 - SURFACE
      ?auto_20369 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20371 - SURFACE
      ?auto_20372 - SURFACE
    )
    :vars
    (
      ?auto_20376 - HOIST
      ?auto_20374 - PLACE
      ?auto_20373 - PLACE
      ?auto_20375 - HOIST
      ?auto_20377 - SURFACE
      ?auto_20380 - PLACE
      ?auto_20389 - HOIST
      ?auto_20393 - SURFACE
      ?auto_20400 - PLACE
      ?auto_20391 - HOIST
      ?auto_20397 - SURFACE
      ?auto_20392 - PLACE
      ?auto_20404 - HOIST
      ?auto_20390 - SURFACE
      ?auto_20383 - SURFACE
      ?auto_20386 - SURFACE
      ?auto_20395 - PLACE
      ?auto_20396 - HOIST
      ?auto_20398 - SURFACE
      ?auto_20401 - PLACE
      ?auto_20394 - HOIST
      ?auto_20387 - SURFACE
      ?auto_20385 - SURFACE
      ?auto_20379 - PLACE
      ?auto_20402 - HOIST
      ?auto_20381 - SURFACE
      ?auto_20384 - PLACE
      ?auto_20399 - HOIST
      ?auto_20388 - SURFACE
      ?auto_20382 - SURFACE
      ?auto_20403 - SURFACE
      ?auto_20378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20376 ?auto_20374 ) ( IS-CRATE ?auto_20372 ) ( not ( = ?auto_20373 ?auto_20374 ) ) ( HOIST-AT ?auto_20375 ?auto_20373 ) ( SURFACE-AT ?auto_20372 ?auto_20373 ) ( ON ?auto_20372 ?auto_20377 ) ( CLEAR ?auto_20372 ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20377 ) ) ( not ( = ?auto_20376 ?auto_20375 ) ) ( IS-CRATE ?auto_20371 ) ( not ( = ?auto_20380 ?auto_20374 ) ) ( HOIST-AT ?auto_20389 ?auto_20380 ) ( AVAILABLE ?auto_20389 ) ( SURFACE-AT ?auto_20371 ?auto_20380 ) ( ON ?auto_20371 ?auto_20393 ) ( CLEAR ?auto_20371 ) ( not ( = ?auto_20370 ?auto_20371 ) ) ( not ( = ?auto_20370 ?auto_20393 ) ) ( not ( = ?auto_20371 ?auto_20393 ) ) ( not ( = ?auto_20376 ?auto_20389 ) ) ( IS-CRATE ?auto_20370 ) ( not ( = ?auto_20400 ?auto_20374 ) ) ( HOIST-AT ?auto_20391 ?auto_20400 ) ( SURFACE-AT ?auto_20370 ?auto_20400 ) ( ON ?auto_20370 ?auto_20397 ) ( CLEAR ?auto_20370 ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20397 ) ) ( not ( = ?auto_20370 ?auto_20397 ) ) ( not ( = ?auto_20376 ?auto_20391 ) ) ( IS-CRATE ?auto_20369 ) ( not ( = ?auto_20392 ?auto_20374 ) ) ( HOIST-AT ?auto_20404 ?auto_20392 ) ( AVAILABLE ?auto_20404 ) ( SURFACE-AT ?auto_20369 ?auto_20392 ) ( ON ?auto_20369 ?auto_20390 ) ( CLEAR ?auto_20369 ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20390 ) ) ( not ( = ?auto_20369 ?auto_20390 ) ) ( not ( = ?auto_20376 ?auto_20404 ) ) ( IS-CRATE ?auto_20368 ) ( SURFACE-AT ?auto_20368 ?auto_20373 ) ( ON ?auto_20368 ?auto_20383 ) ( CLEAR ?auto_20368 ) ( not ( = ?auto_20367 ?auto_20368 ) ) ( not ( = ?auto_20367 ?auto_20383 ) ) ( not ( = ?auto_20368 ?auto_20383 ) ) ( IS-CRATE ?auto_20367 ) ( AVAILABLE ?auto_20391 ) ( SURFACE-AT ?auto_20367 ?auto_20400 ) ( ON ?auto_20367 ?auto_20386 ) ( CLEAR ?auto_20367 ) ( not ( = ?auto_20366 ?auto_20367 ) ) ( not ( = ?auto_20366 ?auto_20386 ) ) ( not ( = ?auto_20367 ?auto_20386 ) ) ( IS-CRATE ?auto_20366 ) ( not ( = ?auto_20395 ?auto_20374 ) ) ( HOIST-AT ?auto_20396 ?auto_20395 ) ( AVAILABLE ?auto_20396 ) ( SURFACE-AT ?auto_20366 ?auto_20395 ) ( ON ?auto_20366 ?auto_20398 ) ( CLEAR ?auto_20366 ) ( not ( = ?auto_20365 ?auto_20366 ) ) ( not ( = ?auto_20365 ?auto_20398 ) ) ( not ( = ?auto_20366 ?auto_20398 ) ) ( not ( = ?auto_20376 ?auto_20396 ) ) ( IS-CRATE ?auto_20365 ) ( not ( = ?auto_20401 ?auto_20374 ) ) ( HOIST-AT ?auto_20394 ?auto_20401 ) ( AVAILABLE ?auto_20394 ) ( SURFACE-AT ?auto_20365 ?auto_20401 ) ( ON ?auto_20365 ?auto_20387 ) ( CLEAR ?auto_20365 ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20387 ) ) ( not ( = ?auto_20365 ?auto_20387 ) ) ( not ( = ?auto_20376 ?auto_20394 ) ) ( IS-CRATE ?auto_20364 ) ( AVAILABLE ?auto_20375 ) ( SURFACE-AT ?auto_20364 ?auto_20373 ) ( ON ?auto_20364 ?auto_20385 ) ( CLEAR ?auto_20364 ) ( not ( = ?auto_20363 ?auto_20364 ) ) ( not ( = ?auto_20363 ?auto_20385 ) ) ( not ( = ?auto_20364 ?auto_20385 ) ) ( IS-CRATE ?auto_20363 ) ( not ( = ?auto_20379 ?auto_20374 ) ) ( HOIST-AT ?auto_20402 ?auto_20379 ) ( AVAILABLE ?auto_20402 ) ( SURFACE-AT ?auto_20363 ?auto_20379 ) ( ON ?auto_20363 ?auto_20381 ) ( CLEAR ?auto_20363 ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( not ( = ?auto_20362 ?auto_20381 ) ) ( not ( = ?auto_20363 ?auto_20381 ) ) ( not ( = ?auto_20376 ?auto_20402 ) ) ( IS-CRATE ?auto_20362 ) ( not ( = ?auto_20384 ?auto_20374 ) ) ( HOIST-AT ?auto_20399 ?auto_20384 ) ( SURFACE-AT ?auto_20362 ?auto_20384 ) ( ON ?auto_20362 ?auto_20388 ) ( CLEAR ?auto_20362 ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( not ( = ?auto_20361 ?auto_20388 ) ) ( not ( = ?auto_20362 ?auto_20388 ) ) ( not ( = ?auto_20376 ?auto_20399 ) ) ( IS-CRATE ?auto_20361 ) ( SURFACE-AT ?auto_20361 ?auto_20384 ) ( ON ?auto_20361 ?auto_20382 ) ( CLEAR ?auto_20361 ) ( not ( = ?auto_20360 ?auto_20361 ) ) ( not ( = ?auto_20360 ?auto_20382 ) ) ( not ( = ?auto_20361 ?auto_20382 ) ) ( SURFACE-AT ?auto_20359 ?auto_20374 ) ( CLEAR ?auto_20359 ) ( IS-CRATE ?auto_20360 ) ( AVAILABLE ?auto_20376 ) ( AVAILABLE ?auto_20399 ) ( SURFACE-AT ?auto_20360 ?auto_20384 ) ( ON ?auto_20360 ?auto_20403 ) ( CLEAR ?auto_20360 ) ( TRUCK-AT ?auto_20378 ?auto_20374 ) ( not ( = ?auto_20359 ?auto_20360 ) ) ( not ( = ?auto_20359 ?auto_20403 ) ) ( not ( = ?auto_20360 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20361 ) ) ( not ( = ?auto_20359 ?auto_20382 ) ) ( not ( = ?auto_20361 ?auto_20403 ) ) ( not ( = ?auto_20382 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20362 ) ) ( not ( = ?auto_20359 ?auto_20388 ) ) ( not ( = ?auto_20360 ?auto_20362 ) ) ( not ( = ?auto_20360 ?auto_20388 ) ) ( not ( = ?auto_20362 ?auto_20382 ) ) ( not ( = ?auto_20362 ?auto_20403 ) ) ( not ( = ?auto_20388 ?auto_20382 ) ) ( not ( = ?auto_20388 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20363 ) ) ( not ( = ?auto_20359 ?auto_20381 ) ) ( not ( = ?auto_20360 ?auto_20363 ) ) ( not ( = ?auto_20360 ?auto_20381 ) ) ( not ( = ?auto_20361 ?auto_20363 ) ) ( not ( = ?auto_20361 ?auto_20381 ) ) ( not ( = ?auto_20363 ?auto_20388 ) ) ( not ( = ?auto_20363 ?auto_20382 ) ) ( not ( = ?auto_20363 ?auto_20403 ) ) ( not ( = ?auto_20379 ?auto_20384 ) ) ( not ( = ?auto_20402 ?auto_20399 ) ) ( not ( = ?auto_20381 ?auto_20388 ) ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20364 ) ) ( not ( = ?auto_20359 ?auto_20385 ) ) ( not ( = ?auto_20360 ?auto_20364 ) ) ( not ( = ?auto_20360 ?auto_20385 ) ) ( not ( = ?auto_20361 ?auto_20364 ) ) ( not ( = ?auto_20361 ?auto_20385 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( not ( = ?auto_20362 ?auto_20385 ) ) ( not ( = ?auto_20364 ?auto_20381 ) ) ( not ( = ?auto_20364 ?auto_20388 ) ) ( not ( = ?auto_20364 ?auto_20382 ) ) ( not ( = ?auto_20364 ?auto_20403 ) ) ( not ( = ?auto_20373 ?auto_20379 ) ) ( not ( = ?auto_20373 ?auto_20384 ) ) ( not ( = ?auto_20375 ?auto_20402 ) ) ( not ( = ?auto_20375 ?auto_20399 ) ) ( not ( = ?auto_20385 ?auto_20381 ) ) ( not ( = ?auto_20385 ?auto_20388 ) ) ( not ( = ?auto_20385 ?auto_20382 ) ) ( not ( = ?auto_20385 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20365 ) ) ( not ( = ?auto_20359 ?auto_20387 ) ) ( not ( = ?auto_20360 ?auto_20365 ) ) ( not ( = ?auto_20360 ?auto_20387 ) ) ( not ( = ?auto_20361 ?auto_20365 ) ) ( not ( = ?auto_20361 ?auto_20387 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( not ( = ?auto_20362 ?auto_20387 ) ) ( not ( = ?auto_20363 ?auto_20365 ) ) ( not ( = ?auto_20363 ?auto_20387 ) ) ( not ( = ?auto_20365 ?auto_20385 ) ) ( not ( = ?auto_20365 ?auto_20381 ) ) ( not ( = ?auto_20365 ?auto_20388 ) ) ( not ( = ?auto_20365 ?auto_20382 ) ) ( not ( = ?auto_20365 ?auto_20403 ) ) ( not ( = ?auto_20401 ?auto_20373 ) ) ( not ( = ?auto_20401 ?auto_20379 ) ) ( not ( = ?auto_20401 ?auto_20384 ) ) ( not ( = ?auto_20394 ?auto_20375 ) ) ( not ( = ?auto_20394 ?auto_20402 ) ) ( not ( = ?auto_20394 ?auto_20399 ) ) ( not ( = ?auto_20387 ?auto_20385 ) ) ( not ( = ?auto_20387 ?auto_20381 ) ) ( not ( = ?auto_20387 ?auto_20388 ) ) ( not ( = ?auto_20387 ?auto_20382 ) ) ( not ( = ?auto_20387 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20366 ) ) ( not ( = ?auto_20359 ?auto_20398 ) ) ( not ( = ?auto_20360 ?auto_20366 ) ) ( not ( = ?auto_20360 ?auto_20398 ) ) ( not ( = ?auto_20361 ?auto_20366 ) ) ( not ( = ?auto_20361 ?auto_20398 ) ) ( not ( = ?auto_20362 ?auto_20366 ) ) ( not ( = ?auto_20362 ?auto_20398 ) ) ( not ( = ?auto_20363 ?auto_20366 ) ) ( not ( = ?auto_20363 ?auto_20398 ) ) ( not ( = ?auto_20364 ?auto_20366 ) ) ( not ( = ?auto_20364 ?auto_20398 ) ) ( not ( = ?auto_20366 ?auto_20387 ) ) ( not ( = ?auto_20366 ?auto_20385 ) ) ( not ( = ?auto_20366 ?auto_20381 ) ) ( not ( = ?auto_20366 ?auto_20388 ) ) ( not ( = ?auto_20366 ?auto_20382 ) ) ( not ( = ?auto_20366 ?auto_20403 ) ) ( not ( = ?auto_20395 ?auto_20401 ) ) ( not ( = ?auto_20395 ?auto_20373 ) ) ( not ( = ?auto_20395 ?auto_20379 ) ) ( not ( = ?auto_20395 ?auto_20384 ) ) ( not ( = ?auto_20396 ?auto_20394 ) ) ( not ( = ?auto_20396 ?auto_20375 ) ) ( not ( = ?auto_20396 ?auto_20402 ) ) ( not ( = ?auto_20396 ?auto_20399 ) ) ( not ( = ?auto_20398 ?auto_20387 ) ) ( not ( = ?auto_20398 ?auto_20385 ) ) ( not ( = ?auto_20398 ?auto_20381 ) ) ( not ( = ?auto_20398 ?auto_20388 ) ) ( not ( = ?auto_20398 ?auto_20382 ) ) ( not ( = ?auto_20398 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20367 ) ) ( not ( = ?auto_20359 ?auto_20386 ) ) ( not ( = ?auto_20360 ?auto_20367 ) ) ( not ( = ?auto_20360 ?auto_20386 ) ) ( not ( = ?auto_20361 ?auto_20367 ) ) ( not ( = ?auto_20361 ?auto_20386 ) ) ( not ( = ?auto_20362 ?auto_20367 ) ) ( not ( = ?auto_20362 ?auto_20386 ) ) ( not ( = ?auto_20363 ?auto_20367 ) ) ( not ( = ?auto_20363 ?auto_20386 ) ) ( not ( = ?auto_20364 ?auto_20367 ) ) ( not ( = ?auto_20364 ?auto_20386 ) ) ( not ( = ?auto_20365 ?auto_20367 ) ) ( not ( = ?auto_20365 ?auto_20386 ) ) ( not ( = ?auto_20367 ?auto_20398 ) ) ( not ( = ?auto_20367 ?auto_20387 ) ) ( not ( = ?auto_20367 ?auto_20385 ) ) ( not ( = ?auto_20367 ?auto_20381 ) ) ( not ( = ?auto_20367 ?auto_20388 ) ) ( not ( = ?auto_20367 ?auto_20382 ) ) ( not ( = ?auto_20367 ?auto_20403 ) ) ( not ( = ?auto_20400 ?auto_20395 ) ) ( not ( = ?auto_20400 ?auto_20401 ) ) ( not ( = ?auto_20400 ?auto_20373 ) ) ( not ( = ?auto_20400 ?auto_20379 ) ) ( not ( = ?auto_20400 ?auto_20384 ) ) ( not ( = ?auto_20391 ?auto_20396 ) ) ( not ( = ?auto_20391 ?auto_20394 ) ) ( not ( = ?auto_20391 ?auto_20375 ) ) ( not ( = ?auto_20391 ?auto_20402 ) ) ( not ( = ?auto_20391 ?auto_20399 ) ) ( not ( = ?auto_20386 ?auto_20398 ) ) ( not ( = ?auto_20386 ?auto_20387 ) ) ( not ( = ?auto_20386 ?auto_20385 ) ) ( not ( = ?auto_20386 ?auto_20381 ) ) ( not ( = ?auto_20386 ?auto_20388 ) ) ( not ( = ?auto_20386 ?auto_20382 ) ) ( not ( = ?auto_20386 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20368 ) ) ( not ( = ?auto_20359 ?auto_20383 ) ) ( not ( = ?auto_20360 ?auto_20368 ) ) ( not ( = ?auto_20360 ?auto_20383 ) ) ( not ( = ?auto_20361 ?auto_20368 ) ) ( not ( = ?auto_20361 ?auto_20383 ) ) ( not ( = ?auto_20362 ?auto_20368 ) ) ( not ( = ?auto_20362 ?auto_20383 ) ) ( not ( = ?auto_20363 ?auto_20368 ) ) ( not ( = ?auto_20363 ?auto_20383 ) ) ( not ( = ?auto_20364 ?auto_20368 ) ) ( not ( = ?auto_20364 ?auto_20383 ) ) ( not ( = ?auto_20365 ?auto_20368 ) ) ( not ( = ?auto_20365 ?auto_20383 ) ) ( not ( = ?auto_20366 ?auto_20368 ) ) ( not ( = ?auto_20366 ?auto_20383 ) ) ( not ( = ?auto_20368 ?auto_20386 ) ) ( not ( = ?auto_20368 ?auto_20398 ) ) ( not ( = ?auto_20368 ?auto_20387 ) ) ( not ( = ?auto_20368 ?auto_20385 ) ) ( not ( = ?auto_20368 ?auto_20381 ) ) ( not ( = ?auto_20368 ?auto_20388 ) ) ( not ( = ?auto_20368 ?auto_20382 ) ) ( not ( = ?auto_20368 ?auto_20403 ) ) ( not ( = ?auto_20383 ?auto_20386 ) ) ( not ( = ?auto_20383 ?auto_20398 ) ) ( not ( = ?auto_20383 ?auto_20387 ) ) ( not ( = ?auto_20383 ?auto_20385 ) ) ( not ( = ?auto_20383 ?auto_20381 ) ) ( not ( = ?auto_20383 ?auto_20388 ) ) ( not ( = ?auto_20383 ?auto_20382 ) ) ( not ( = ?auto_20383 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20369 ) ) ( not ( = ?auto_20359 ?auto_20390 ) ) ( not ( = ?auto_20360 ?auto_20369 ) ) ( not ( = ?auto_20360 ?auto_20390 ) ) ( not ( = ?auto_20361 ?auto_20369 ) ) ( not ( = ?auto_20361 ?auto_20390 ) ) ( not ( = ?auto_20362 ?auto_20369 ) ) ( not ( = ?auto_20362 ?auto_20390 ) ) ( not ( = ?auto_20363 ?auto_20369 ) ) ( not ( = ?auto_20363 ?auto_20390 ) ) ( not ( = ?auto_20364 ?auto_20369 ) ) ( not ( = ?auto_20364 ?auto_20390 ) ) ( not ( = ?auto_20365 ?auto_20369 ) ) ( not ( = ?auto_20365 ?auto_20390 ) ) ( not ( = ?auto_20366 ?auto_20369 ) ) ( not ( = ?auto_20366 ?auto_20390 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20390 ) ) ( not ( = ?auto_20369 ?auto_20383 ) ) ( not ( = ?auto_20369 ?auto_20386 ) ) ( not ( = ?auto_20369 ?auto_20398 ) ) ( not ( = ?auto_20369 ?auto_20387 ) ) ( not ( = ?auto_20369 ?auto_20385 ) ) ( not ( = ?auto_20369 ?auto_20381 ) ) ( not ( = ?auto_20369 ?auto_20388 ) ) ( not ( = ?auto_20369 ?auto_20382 ) ) ( not ( = ?auto_20369 ?auto_20403 ) ) ( not ( = ?auto_20392 ?auto_20373 ) ) ( not ( = ?auto_20392 ?auto_20400 ) ) ( not ( = ?auto_20392 ?auto_20395 ) ) ( not ( = ?auto_20392 ?auto_20401 ) ) ( not ( = ?auto_20392 ?auto_20379 ) ) ( not ( = ?auto_20392 ?auto_20384 ) ) ( not ( = ?auto_20404 ?auto_20375 ) ) ( not ( = ?auto_20404 ?auto_20391 ) ) ( not ( = ?auto_20404 ?auto_20396 ) ) ( not ( = ?auto_20404 ?auto_20394 ) ) ( not ( = ?auto_20404 ?auto_20402 ) ) ( not ( = ?auto_20404 ?auto_20399 ) ) ( not ( = ?auto_20390 ?auto_20383 ) ) ( not ( = ?auto_20390 ?auto_20386 ) ) ( not ( = ?auto_20390 ?auto_20398 ) ) ( not ( = ?auto_20390 ?auto_20387 ) ) ( not ( = ?auto_20390 ?auto_20385 ) ) ( not ( = ?auto_20390 ?auto_20381 ) ) ( not ( = ?auto_20390 ?auto_20388 ) ) ( not ( = ?auto_20390 ?auto_20382 ) ) ( not ( = ?auto_20390 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20370 ) ) ( not ( = ?auto_20359 ?auto_20397 ) ) ( not ( = ?auto_20360 ?auto_20370 ) ) ( not ( = ?auto_20360 ?auto_20397 ) ) ( not ( = ?auto_20361 ?auto_20370 ) ) ( not ( = ?auto_20361 ?auto_20397 ) ) ( not ( = ?auto_20362 ?auto_20370 ) ) ( not ( = ?auto_20362 ?auto_20397 ) ) ( not ( = ?auto_20363 ?auto_20370 ) ) ( not ( = ?auto_20363 ?auto_20397 ) ) ( not ( = ?auto_20364 ?auto_20370 ) ) ( not ( = ?auto_20364 ?auto_20397 ) ) ( not ( = ?auto_20365 ?auto_20370 ) ) ( not ( = ?auto_20365 ?auto_20397 ) ) ( not ( = ?auto_20366 ?auto_20370 ) ) ( not ( = ?auto_20366 ?auto_20397 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20397 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20397 ) ) ( not ( = ?auto_20370 ?auto_20390 ) ) ( not ( = ?auto_20370 ?auto_20383 ) ) ( not ( = ?auto_20370 ?auto_20386 ) ) ( not ( = ?auto_20370 ?auto_20398 ) ) ( not ( = ?auto_20370 ?auto_20387 ) ) ( not ( = ?auto_20370 ?auto_20385 ) ) ( not ( = ?auto_20370 ?auto_20381 ) ) ( not ( = ?auto_20370 ?auto_20388 ) ) ( not ( = ?auto_20370 ?auto_20382 ) ) ( not ( = ?auto_20370 ?auto_20403 ) ) ( not ( = ?auto_20397 ?auto_20390 ) ) ( not ( = ?auto_20397 ?auto_20383 ) ) ( not ( = ?auto_20397 ?auto_20386 ) ) ( not ( = ?auto_20397 ?auto_20398 ) ) ( not ( = ?auto_20397 ?auto_20387 ) ) ( not ( = ?auto_20397 ?auto_20385 ) ) ( not ( = ?auto_20397 ?auto_20381 ) ) ( not ( = ?auto_20397 ?auto_20388 ) ) ( not ( = ?auto_20397 ?auto_20382 ) ) ( not ( = ?auto_20397 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20371 ) ) ( not ( = ?auto_20359 ?auto_20393 ) ) ( not ( = ?auto_20360 ?auto_20371 ) ) ( not ( = ?auto_20360 ?auto_20393 ) ) ( not ( = ?auto_20361 ?auto_20371 ) ) ( not ( = ?auto_20361 ?auto_20393 ) ) ( not ( = ?auto_20362 ?auto_20371 ) ) ( not ( = ?auto_20362 ?auto_20393 ) ) ( not ( = ?auto_20363 ?auto_20371 ) ) ( not ( = ?auto_20363 ?auto_20393 ) ) ( not ( = ?auto_20364 ?auto_20371 ) ) ( not ( = ?auto_20364 ?auto_20393 ) ) ( not ( = ?auto_20365 ?auto_20371 ) ) ( not ( = ?auto_20365 ?auto_20393 ) ) ( not ( = ?auto_20366 ?auto_20371 ) ) ( not ( = ?auto_20366 ?auto_20393 ) ) ( not ( = ?auto_20367 ?auto_20371 ) ) ( not ( = ?auto_20367 ?auto_20393 ) ) ( not ( = ?auto_20368 ?auto_20371 ) ) ( not ( = ?auto_20368 ?auto_20393 ) ) ( not ( = ?auto_20369 ?auto_20371 ) ) ( not ( = ?auto_20369 ?auto_20393 ) ) ( not ( = ?auto_20371 ?auto_20397 ) ) ( not ( = ?auto_20371 ?auto_20390 ) ) ( not ( = ?auto_20371 ?auto_20383 ) ) ( not ( = ?auto_20371 ?auto_20386 ) ) ( not ( = ?auto_20371 ?auto_20398 ) ) ( not ( = ?auto_20371 ?auto_20387 ) ) ( not ( = ?auto_20371 ?auto_20385 ) ) ( not ( = ?auto_20371 ?auto_20381 ) ) ( not ( = ?auto_20371 ?auto_20388 ) ) ( not ( = ?auto_20371 ?auto_20382 ) ) ( not ( = ?auto_20371 ?auto_20403 ) ) ( not ( = ?auto_20380 ?auto_20400 ) ) ( not ( = ?auto_20380 ?auto_20392 ) ) ( not ( = ?auto_20380 ?auto_20373 ) ) ( not ( = ?auto_20380 ?auto_20395 ) ) ( not ( = ?auto_20380 ?auto_20401 ) ) ( not ( = ?auto_20380 ?auto_20379 ) ) ( not ( = ?auto_20380 ?auto_20384 ) ) ( not ( = ?auto_20389 ?auto_20391 ) ) ( not ( = ?auto_20389 ?auto_20404 ) ) ( not ( = ?auto_20389 ?auto_20375 ) ) ( not ( = ?auto_20389 ?auto_20396 ) ) ( not ( = ?auto_20389 ?auto_20394 ) ) ( not ( = ?auto_20389 ?auto_20402 ) ) ( not ( = ?auto_20389 ?auto_20399 ) ) ( not ( = ?auto_20393 ?auto_20397 ) ) ( not ( = ?auto_20393 ?auto_20390 ) ) ( not ( = ?auto_20393 ?auto_20383 ) ) ( not ( = ?auto_20393 ?auto_20386 ) ) ( not ( = ?auto_20393 ?auto_20398 ) ) ( not ( = ?auto_20393 ?auto_20387 ) ) ( not ( = ?auto_20393 ?auto_20385 ) ) ( not ( = ?auto_20393 ?auto_20381 ) ) ( not ( = ?auto_20393 ?auto_20388 ) ) ( not ( = ?auto_20393 ?auto_20382 ) ) ( not ( = ?auto_20393 ?auto_20403 ) ) ( not ( = ?auto_20359 ?auto_20372 ) ) ( not ( = ?auto_20359 ?auto_20377 ) ) ( not ( = ?auto_20360 ?auto_20372 ) ) ( not ( = ?auto_20360 ?auto_20377 ) ) ( not ( = ?auto_20361 ?auto_20372 ) ) ( not ( = ?auto_20361 ?auto_20377 ) ) ( not ( = ?auto_20362 ?auto_20372 ) ) ( not ( = ?auto_20362 ?auto_20377 ) ) ( not ( = ?auto_20363 ?auto_20372 ) ) ( not ( = ?auto_20363 ?auto_20377 ) ) ( not ( = ?auto_20364 ?auto_20372 ) ) ( not ( = ?auto_20364 ?auto_20377 ) ) ( not ( = ?auto_20365 ?auto_20372 ) ) ( not ( = ?auto_20365 ?auto_20377 ) ) ( not ( = ?auto_20366 ?auto_20372 ) ) ( not ( = ?auto_20366 ?auto_20377 ) ) ( not ( = ?auto_20367 ?auto_20372 ) ) ( not ( = ?auto_20367 ?auto_20377 ) ) ( not ( = ?auto_20368 ?auto_20372 ) ) ( not ( = ?auto_20368 ?auto_20377 ) ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( not ( = ?auto_20369 ?auto_20377 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20370 ?auto_20377 ) ) ( not ( = ?auto_20372 ?auto_20393 ) ) ( not ( = ?auto_20372 ?auto_20397 ) ) ( not ( = ?auto_20372 ?auto_20390 ) ) ( not ( = ?auto_20372 ?auto_20383 ) ) ( not ( = ?auto_20372 ?auto_20386 ) ) ( not ( = ?auto_20372 ?auto_20398 ) ) ( not ( = ?auto_20372 ?auto_20387 ) ) ( not ( = ?auto_20372 ?auto_20385 ) ) ( not ( = ?auto_20372 ?auto_20381 ) ) ( not ( = ?auto_20372 ?auto_20388 ) ) ( not ( = ?auto_20372 ?auto_20382 ) ) ( not ( = ?auto_20372 ?auto_20403 ) ) ( not ( = ?auto_20377 ?auto_20393 ) ) ( not ( = ?auto_20377 ?auto_20397 ) ) ( not ( = ?auto_20377 ?auto_20390 ) ) ( not ( = ?auto_20377 ?auto_20383 ) ) ( not ( = ?auto_20377 ?auto_20386 ) ) ( not ( = ?auto_20377 ?auto_20398 ) ) ( not ( = ?auto_20377 ?auto_20387 ) ) ( not ( = ?auto_20377 ?auto_20385 ) ) ( not ( = ?auto_20377 ?auto_20381 ) ) ( not ( = ?auto_20377 ?auto_20388 ) ) ( not ( = ?auto_20377 ?auto_20382 ) ) ( not ( = ?auto_20377 ?auto_20403 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20359 ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20365 ?auto_20366 ?auto_20367 ?auto_20368 ?auto_20369 ?auto_20370 ?auto_20371 )
      ( MAKE-1CRATE ?auto_20371 ?auto_20372 )
      ( MAKE-13CRATE-VERIFY ?auto_20359 ?auto_20360 ?auto_20361 ?auto_20362 ?auto_20363 ?auto_20364 ?auto_20365 ?auto_20366 ?auto_20367 ?auto_20368 ?auto_20369 ?auto_20370 ?auto_20371 ?auto_20372 ) )
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
      ?auto_20436 - SURFACE
      ?auto_20437 - SURFACE
      ?auto_20438 - SURFACE
      ?auto_20439 - SURFACE
      ?auto_20440 - SURFACE
      ?auto_20441 - SURFACE
      ?auto_20442 - SURFACE
      ?auto_20443 - SURFACE
      ?auto_20444 - SURFACE
    )
    :vars
    (
      ?auto_20447 - HOIST
      ?auto_20448 - PLACE
      ?auto_20446 - PLACE
      ?auto_20445 - HOIST
      ?auto_20449 - SURFACE
      ?auto_20473 - PLACE
      ?auto_20459 - HOIST
      ?auto_20453 - SURFACE
      ?auto_20467 - PLACE
      ?auto_20478 - HOIST
      ?auto_20454 - SURFACE
      ?auto_20451 - PLACE
      ?auto_20479 - HOIST
      ?auto_20463 - SURFACE
      ?auto_20456 - PLACE
      ?auto_20455 - HOIST
      ?auto_20471 - SURFACE
      ?auto_20466 - SURFACE
      ?auto_20460 - SURFACE
      ?auto_20476 - PLACE
      ?auto_20474 - HOIST
      ?auto_20475 - SURFACE
      ?auto_20470 - PLACE
      ?auto_20477 - HOIST
      ?auto_20461 - SURFACE
      ?auto_20452 - SURFACE
      ?auto_20472 - PLACE
      ?auto_20468 - HOIST
      ?auto_20457 - SURFACE
      ?auto_20469 - PLACE
      ?auto_20464 - HOIST
      ?auto_20462 - SURFACE
      ?auto_20465 - SURFACE
      ?auto_20458 - SURFACE
      ?auto_20450 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20447 ?auto_20448 ) ( IS-CRATE ?auto_20444 ) ( not ( = ?auto_20446 ?auto_20448 ) ) ( HOIST-AT ?auto_20445 ?auto_20446 ) ( AVAILABLE ?auto_20445 ) ( SURFACE-AT ?auto_20444 ?auto_20446 ) ( ON ?auto_20444 ?auto_20449 ) ( CLEAR ?auto_20444 ) ( not ( = ?auto_20443 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20449 ) ) ( not ( = ?auto_20444 ?auto_20449 ) ) ( not ( = ?auto_20447 ?auto_20445 ) ) ( IS-CRATE ?auto_20443 ) ( not ( = ?auto_20473 ?auto_20448 ) ) ( HOIST-AT ?auto_20459 ?auto_20473 ) ( SURFACE-AT ?auto_20443 ?auto_20473 ) ( ON ?auto_20443 ?auto_20453 ) ( CLEAR ?auto_20443 ) ( not ( = ?auto_20442 ?auto_20443 ) ) ( not ( = ?auto_20442 ?auto_20453 ) ) ( not ( = ?auto_20443 ?auto_20453 ) ) ( not ( = ?auto_20447 ?auto_20459 ) ) ( IS-CRATE ?auto_20442 ) ( not ( = ?auto_20467 ?auto_20448 ) ) ( HOIST-AT ?auto_20478 ?auto_20467 ) ( AVAILABLE ?auto_20478 ) ( SURFACE-AT ?auto_20442 ?auto_20467 ) ( ON ?auto_20442 ?auto_20454 ) ( CLEAR ?auto_20442 ) ( not ( = ?auto_20441 ?auto_20442 ) ) ( not ( = ?auto_20441 ?auto_20454 ) ) ( not ( = ?auto_20442 ?auto_20454 ) ) ( not ( = ?auto_20447 ?auto_20478 ) ) ( IS-CRATE ?auto_20441 ) ( not ( = ?auto_20451 ?auto_20448 ) ) ( HOIST-AT ?auto_20479 ?auto_20451 ) ( SURFACE-AT ?auto_20441 ?auto_20451 ) ( ON ?auto_20441 ?auto_20463 ) ( CLEAR ?auto_20441 ) ( not ( = ?auto_20440 ?auto_20441 ) ) ( not ( = ?auto_20440 ?auto_20463 ) ) ( not ( = ?auto_20441 ?auto_20463 ) ) ( not ( = ?auto_20447 ?auto_20479 ) ) ( IS-CRATE ?auto_20440 ) ( not ( = ?auto_20456 ?auto_20448 ) ) ( HOIST-AT ?auto_20455 ?auto_20456 ) ( AVAILABLE ?auto_20455 ) ( SURFACE-AT ?auto_20440 ?auto_20456 ) ( ON ?auto_20440 ?auto_20471 ) ( CLEAR ?auto_20440 ) ( not ( = ?auto_20439 ?auto_20440 ) ) ( not ( = ?auto_20439 ?auto_20471 ) ) ( not ( = ?auto_20440 ?auto_20471 ) ) ( not ( = ?auto_20447 ?auto_20455 ) ) ( IS-CRATE ?auto_20439 ) ( SURFACE-AT ?auto_20439 ?auto_20473 ) ( ON ?auto_20439 ?auto_20466 ) ( CLEAR ?auto_20439 ) ( not ( = ?auto_20438 ?auto_20439 ) ) ( not ( = ?auto_20438 ?auto_20466 ) ) ( not ( = ?auto_20439 ?auto_20466 ) ) ( IS-CRATE ?auto_20438 ) ( AVAILABLE ?auto_20479 ) ( SURFACE-AT ?auto_20438 ?auto_20451 ) ( ON ?auto_20438 ?auto_20460 ) ( CLEAR ?auto_20438 ) ( not ( = ?auto_20437 ?auto_20438 ) ) ( not ( = ?auto_20437 ?auto_20460 ) ) ( not ( = ?auto_20438 ?auto_20460 ) ) ( IS-CRATE ?auto_20437 ) ( not ( = ?auto_20476 ?auto_20448 ) ) ( HOIST-AT ?auto_20474 ?auto_20476 ) ( AVAILABLE ?auto_20474 ) ( SURFACE-AT ?auto_20437 ?auto_20476 ) ( ON ?auto_20437 ?auto_20475 ) ( CLEAR ?auto_20437 ) ( not ( = ?auto_20436 ?auto_20437 ) ) ( not ( = ?auto_20436 ?auto_20475 ) ) ( not ( = ?auto_20437 ?auto_20475 ) ) ( not ( = ?auto_20447 ?auto_20474 ) ) ( IS-CRATE ?auto_20436 ) ( not ( = ?auto_20470 ?auto_20448 ) ) ( HOIST-AT ?auto_20477 ?auto_20470 ) ( AVAILABLE ?auto_20477 ) ( SURFACE-AT ?auto_20436 ?auto_20470 ) ( ON ?auto_20436 ?auto_20461 ) ( CLEAR ?auto_20436 ) ( not ( = ?auto_20435 ?auto_20436 ) ) ( not ( = ?auto_20435 ?auto_20461 ) ) ( not ( = ?auto_20436 ?auto_20461 ) ) ( not ( = ?auto_20447 ?auto_20477 ) ) ( IS-CRATE ?auto_20435 ) ( AVAILABLE ?auto_20459 ) ( SURFACE-AT ?auto_20435 ?auto_20473 ) ( ON ?auto_20435 ?auto_20452 ) ( CLEAR ?auto_20435 ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20452 ) ) ( not ( = ?auto_20435 ?auto_20452 ) ) ( IS-CRATE ?auto_20434 ) ( not ( = ?auto_20472 ?auto_20448 ) ) ( HOIST-AT ?auto_20468 ?auto_20472 ) ( AVAILABLE ?auto_20468 ) ( SURFACE-AT ?auto_20434 ?auto_20472 ) ( ON ?auto_20434 ?auto_20457 ) ( CLEAR ?auto_20434 ) ( not ( = ?auto_20433 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20457 ) ) ( not ( = ?auto_20434 ?auto_20457 ) ) ( not ( = ?auto_20447 ?auto_20468 ) ) ( IS-CRATE ?auto_20433 ) ( not ( = ?auto_20469 ?auto_20448 ) ) ( HOIST-AT ?auto_20464 ?auto_20469 ) ( SURFACE-AT ?auto_20433 ?auto_20469 ) ( ON ?auto_20433 ?auto_20462 ) ( CLEAR ?auto_20433 ) ( not ( = ?auto_20432 ?auto_20433 ) ) ( not ( = ?auto_20432 ?auto_20462 ) ) ( not ( = ?auto_20433 ?auto_20462 ) ) ( not ( = ?auto_20447 ?auto_20464 ) ) ( IS-CRATE ?auto_20432 ) ( SURFACE-AT ?auto_20432 ?auto_20469 ) ( ON ?auto_20432 ?auto_20465 ) ( CLEAR ?auto_20432 ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20431 ?auto_20465 ) ) ( not ( = ?auto_20432 ?auto_20465 ) ) ( SURFACE-AT ?auto_20430 ?auto_20448 ) ( CLEAR ?auto_20430 ) ( IS-CRATE ?auto_20431 ) ( AVAILABLE ?auto_20447 ) ( AVAILABLE ?auto_20464 ) ( SURFACE-AT ?auto_20431 ?auto_20469 ) ( ON ?auto_20431 ?auto_20458 ) ( CLEAR ?auto_20431 ) ( TRUCK-AT ?auto_20450 ?auto_20448 ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20458 ) ) ( not ( = ?auto_20431 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20430 ?auto_20465 ) ) ( not ( = ?auto_20432 ?auto_20458 ) ) ( not ( = ?auto_20465 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20433 ) ) ( not ( = ?auto_20430 ?auto_20462 ) ) ( not ( = ?auto_20431 ?auto_20433 ) ) ( not ( = ?auto_20431 ?auto_20462 ) ) ( not ( = ?auto_20433 ?auto_20465 ) ) ( not ( = ?auto_20433 ?auto_20458 ) ) ( not ( = ?auto_20462 ?auto_20465 ) ) ( not ( = ?auto_20462 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20434 ) ) ( not ( = ?auto_20430 ?auto_20457 ) ) ( not ( = ?auto_20431 ?auto_20434 ) ) ( not ( = ?auto_20431 ?auto_20457 ) ) ( not ( = ?auto_20432 ?auto_20434 ) ) ( not ( = ?auto_20432 ?auto_20457 ) ) ( not ( = ?auto_20434 ?auto_20462 ) ) ( not ( = ?auto_20434 ?auto_20465 ) ) ( not ( = ?auto_20434 ?auto_20458 ) ) ( not ( = ?auto_20472 ?auto_20469 ) ) ( not ( = ?auto_20468 ?auto_20464 ) ) ( not ( = ?auto_20457 ?auto_20462 ) ) ( not ( = ?auto_20457 ?auto_20465 ) ) ( not ( = ?auto_20457 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20435 ) ) ( not ( = ?auto_20430 ?auto_20452 ) ) ( not ( = ?auto_20431 ?auto_20435 ) ) ( not ( = ?auto_20431 ?auto_20452 ) ) ( not ( = ?auto_20432 ?auto_20435 ) ) ( not ( = ?auto_20432 ?auto_20452 ) ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( not ( = ?auto_20433 ?auto_20452 ) ) ( not ( = ?auto_20435 ?auto_20457 ) ) ( not ( = ?auto_20435 ?auto_20462 ) ) ( not ( = ?auto_20435 ?auto_20465 ) ) ( not ( = ?auto_20435 ?auto_20458 ) ) ( not ( = ?auto_20473 ?auto_20472 ) ) ( not ( = ?auto_20473 ?auto_20469 ) ) ( not ( = ?auto_20459 ?auto_20468 ) ) ( not ( = ?auto_20459 ?auto_20464 ) ) ( not ( = ?auto_20452 ?auto_20457 ) ) ( not ( = ?auto_20452 ?auto_20462 ) ) ( not ( = ?auto_20452 ?auto_20465 ) ) ( not ( = ?auto_20452 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20436 ) ) ( not ( = ?auto_20430 ?auto_20461 ) ) ( not ( = ?auto_20431 ?auto_20436 ) ) ( not ( = ?auto_20431 ?auto_20461 ) ) ( not ( = ?auto_20432 ?auto_20436 ) ) ( not ( = ?auto_20432 ?auto_20461 ) ) ( not ( = ?auto_20433 ?auto_20436 ) ) ( not ( = ?auto_20433 ?auto_20461 ) ) ( not ( = ?auto_20434 ?auto_20436 ) ) ( not ( = ?auto_20434 ?auto_20461 ) ) ( not ( = ?auto_20436 ?auto_20452 ) ) ( not ( = ?auto_20436 ?auto_20457 ) ) ( not ( = ?auto_20436 ?auto_20462 ) ) ( not ( = ?auto_20436 ?auto_20465 ) ) ( not ( = ?auto_20436 ?auto_20458 ) ) ( not ( = ?auto_20470 ?auto_20473 ) ) ( not ( = ?auto_20470 ?auto_20472 ) ) ( not ( = ?auto_20470 ?auto_20469 ) ) ( not ( = ?auto_20477 ?auto_20459 ) ) ( not ( = ?auto_20477 ?auto_20468 ) ) ( not ( = ?auto_20477 ?auto_20464 ) ) ( not ( = ?auto_20461 ?auto_20452 ) ) ( not ( = ?auto_20461 ?auto_20457 ) ) ( not ( = ?auto_20461 ?auto_20462 ) ) ( not ( = ?auto_20461 ?auto_20465 ) ) ( not ( = ?auto_20461 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20437 ) ) ( not ( = ?auto_20430 ?auto_20475 ) ) ( not ( = ?auto_20431 ?auto_20437 ) ) ( not ( = ?auto_20431 ?auto_20475 ) ) ( not ( = ?auto_20432 ?auto_20437 ) ) ( not ( = ?auto_20432 ?auto_20475 ) ) ( not ( = ?auto_20433 ?auto_20437 ) ) ( not ( = ?auto_20433 ?auto_20475 ) ) ( not ( = ?auto_20434 ?auto_20437 ) ) ( not ( = ?auto_20434 ?auto_20475 ) ) ( not ( = ?auto_20435 ?auto_20437 ) ) ( not ( = ?auto_20435 ?auto_20475 ) ) ( not ( = ?auto_20437 ?auto_20461 ) ) ( not ( = ?auto_20437 ?auto_20452 ) ) ( not ( = ?auto_20437 ?auto_20457 ) ) ( not ( = ?auto_20437 ?auto_20462 ) ) ( not ( = ?auto_20437 ?auto_20465 ) ) ( not ( = ?auto_20437 ?auto_20458 ) ) ( not ( = ?auto_20476 ?auto_20470 ) ) ( not ( = ?auto_20476 ?auto_20473 ) ) ( not ( = ?auto_20476 ?auto_20472 ) ) ( not ( = ?auto_20476 ?auto_20469 ) ) ( not ( = ?auto_20474 ?auto_20477 ) ) ( not ( = ?auto_20474 ?auto_20459 ) ) ( not ( = ?auto_20474 ?auto_20468 ) ) ( not ( = ?auto_20474 ?auto_20464 ) ) ( not ( = ?auto_20475 ?auto_20461 ) ) ( not ( = ?auto_20475 ?auto_20452 ) ) ( not ( = ?auto_20475 ?auto_20457 ) ) ( not ( = ?auto_20475 ?auto_20462 ) ) ( not ( = ?auto_20475 ?auto_20465 ) ) ( not ( = ?auto_20475 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20438 ) ) ( not ( = ?auto_20430 ?auto_20460 ) ) ( not ( = ?auto_20431 ?auto_20438 ) ) ( not ( = ?auto_20431 ?auto_20460 ) ) ( not ( = ?auto_20432 ?auto_20438 ) ) ( not ( = ?auto_20432 ?auto_20460 ) ) ( not ( = ?auto_20433 ?auto_20438 ) ) ( not ( = ?auto_20433 ?auto_20460 ) ) ( not ( = ?auto_20434 ?auto_20438 ) ) ( not ( = ?auto_20434 ?auto_20460 ) ) ( not ( = ?auto_20435 ?auto_20438 ) ) ( not ( = ?auto_20435 ?auto_20460 ) ) ( not ( = ?auto_20436 ?auto_20438 ) ) ( not ( = ?auto_20436 ?auto_20460 ) ) ( not ( = ?auto_20438 ?auto_20475 ) ) ( not ( = ?auto_20438 ?auto_20461 ) ) ( not ( = ?auto_20438 ?auto_20452 ) ) ( not ( = ?auto_20438 ?auto_20457 ) ) ( not ( = ?auto_20438 ?auto_20462 ) ) ( not ( = ?auto_20438 ?auto_20465 ) ) ( not ( = ?auto_20438 ?auto_20458 ) ) ( not ( = ?auto_20451 ?auto_20476 ) ) ( not ( = ?auto_20451 ?auto_20470 ) ) ( not ( = ?auto_20451 ?auto_20473 ) ) ( not ( = ?auto_20451 ?auto_20472 ) ) ( not ( = ?auto_20451 ?auto_20469 ) ) ( not ( = ?auto_20479 ?auto_20474 ) ) ( not ( = ?auto_20479 ?auto_20477 ) ) ( not ( = ?auto_20479 ?auto_20459 ) ) ( not ( = ?auto_20479 ?auto_20468 ) ) ( not ( = ?auto_20479 ?auto_20464 ) ) ( not ( = ?auto_20460 ?auto_20475 ) ) ( not ( = ?auto_20460 ?auto_20461 ) ) ( not ( = ?auto_20460 ?auto_20452 ) ) ( not ( = ?auto_20460 ?auto_20457 ) ) ( not ( = ?auto_20460 ?auto_20462 ) ) ( not ( = ?auto_20460 ?auto_20465 ) ) ( not ( = ?auto_20460 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20439 ) ) ( not ( = ?auto_20430 ?auto_20466 ) ) ( not ( = ?auto_20431 ?auto_20439 ) ) ( not ( = ?auto_20431 ?auto_20466 ) ) ( not ( = ?auto_20432 ?auto_20439 ) ) ( not ( = ?auto_20432 ?auto_20466 ) ) ( not ( = ?auto_20433 ?auto_20439 ) ) ( not ( = ?auto_20433 ?auto_20466 ) ) ( not ( = ?auto_20434 ?auto_20439 ) ) ( not ( = ?auto_20434 ?auto_20466 ) ) ( not ( = ?auto_20435 ?auto_20439 ) ) ( not ( = ?auto_20435 ?auto_20466 ) ) ( not ( = ?auto_20436 ?auto_20439 ) ) ( not ( = ?auto_20436 ?auto_20466 ) ) ( not ( = ?auto_20437 ?auto_20439 ) ) ( not ( = ?auto_20437 ?auto_20466 ) ) ( not ( = ?auto_20439 ?auto_20460 ) ) ( not ( = ?auto_20439 ?auto_20475 ) ) ( not ( = ?auto_20439 ?auto_20461 ) ) ( not ( = ?auto_20439 ?auto_20452 ) ) ( not ( = ?auto_20439 ?auto_20457 ) ) ( not ( = ?auto_20439 ?auto_20462 ) ) ( not ( = ?auto_20439 ?auto_20465 ) ) ( not ( = ?auto_20439 ?auto_20458 ) ) ( not ( = ?auto_20466 ?auto_20460 ) ) ( not ( = ?auto_20466 ?auto_20475 ) ) ( not ( = ?auto_20466 ?auto_20461 ) ) ( not ( = ?auto_20466 ?auto_20452 ) ) ( not ( = ?auto_20466 ?auto_20457 ) ) ( not ( = ?auto_20466 ?auto_20462 ) ) ( not ( = ?auto_20466 ?auto_20465 ) ) ( not ( = ?auto_20466 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20440 ) ) ( not ( = ?auto_20430 ?auto_20471 ) ) ( not ( = ?auto_20431 ?auto_20440 ) ) ( not ( = ?auto_20431 ?auto_20471 ) ) ( not ( = ?auto_20432 ?auto_20440 ) ) ( not ( = ?auto_20432 ?auto_20471 ) ) ( not ( = ?auto_20433 ?auto_20440 ) ) ( not ( = ?auto_20433 ?auto_20471 ) ) ( not ( = ?auto_20434 ?auto_20440 ) ) ( not ( = ?auto_20434 ?auto_20471 ) ) ( not ( = ?auto_20435 ?auto_20440 ) ) ( not ( = ?auto_20435 ?auto_20471 ) ) ( not ( = ?auto_20436 ?auto_20440 ) ) ( not ( = ?auto_20436 ?auto_20471 ) ) ( not ( = ?auto_20437 ?auto_20440 ) ) ( not ( = ?auto_20437 ?auto_20471 ) ) ( not ( = ?auto_20438 ?auto_20440 ) ) ( not ( = ?auto_20438 ?auto_20471 ) ) ( not ( = ?auto_20440 ?auto_20466 ) ) ( not ( = ?auto_20440 ?auto_20460 ) ) ( not ( = ?auto_20440 ?auto_20475 ) ) ( not ( = ?auto_20440 ?auto_20461 ) ) ( not ( = ?auto_20440 ?auto_20452 ) ) ( not ( = ?auto_20440 ?auto_20457 ) ) ( not ( = ?auto_20440 ?auto_20462 ) ) ( not ( = ?auto_20440 ?auto_20465 ) ) ( not ( = ?auto_20440 ?auto_20458 ) ) ( not ( = ?auto_20456 ?auto_20473 ) ) ( not ( = ?auto_20456 ?auto_20451 ) ) ( not ( = ?auto_20456 ?auto_20476 ) ) ( not ( = ?auto_20456 ?auto_20470 ) ) ( not ( = ?auto_20456 ?auto_20472 ) ) ( not ( = ?auto_20456 ?auto_20469 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) ( not ( = ?auto_20455 ?auto_20479 ) ) ( not ( = ?auto_20455 ?auto_20474 ) ) ( not ( = ?auto_20455 ?auto_20477 ) ) ( not ( = ?auto_20455 ?auto_20468 ) ) ( not ( = ?auto_20455 ?auto_20464 ) ) ( not ( = ?auto_20471 ?auto_20466 ) ) ( not ( = ?auto_20471 ?auto_20460 ) ) ( not ( = ?auto_20471 ?auto_20475 ) ) ( not ( = ?auto_20471 ?auto_20461 ) ) ( not ( = ?auto_20471 ?auto_20452 ) ) ( not ( = ?auto_20471 ?auto_20457 ) ) ( not ( = ?auto_20471 ?auto_20462 ) ) ( not ( = ?auto_20471 ?auto_20465 ) ) ( not ( = ?auto_20471 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20441 ) ) ( not ( = ?auto_20430 ?auto_20463 ) ) ( not ( = ?auto_20431 ?auto_20441 ) ) ( not ( = ?auto_20431 ?auto_20463 ) ) ( not ( = ?auto_20432 ?auto_20441 ) ) ( not ( = ?auto_20432 ?auto_20463 ) ) ( not ( = ?auto_20433 ?auto_20441 ) ) ( not ( = ?auto_20433 ?auto_20463 ) ) ( not ( = ?auto_20434 ?auto_20441 ) ) ( not ( = ?auto_20434 ?auto_20463 ) ) ( not ( = ?auto_20435 ?auto_20441 ) ) ( not ( = ?auto_20435 ?auto_20463 ) ) ( not ( = ?auto_20436 ?auto_20441 ) ) ( not ( = ?auto_20436 ?auto_20463 ) ) ( not ( = ?auto_20437 ?auto_20441 ) ) ( not ( = ?auto_20437 ?auto_20463 ) ) ( not ( = ?auto_20438 ?auto_20441 ) ) ( not ( = ?auto_20438 ?auto_20463 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20463 ) ) ( not ( = ?auto_20441 ?auto_20471 ) ) ( not ( = ?auto_20441 ?auto_20466 ) ) ( not ( = ?auto_20441 ?auto_20460 ) ) ( not ( = ?auto_20441 ?auto_20475 ) ) ( not ( = ?auto_20441 ?auto_20461 ) ) ( not ( = ?auto_20441 ?auto_20452 ) ) ( not ( = ?auto_20441 ?auto_20457 ) ) ( not ( = ?auto_20441 ?auto_20462 ) ) ( not ( = ?auto_20441 ?auto_20465 ) ) ( not ( = ?auto_20441 ?auto_20458 ) ) ( not ( = ?auto_20463 ?auto_20471 ) ) ( not ( = ?auto_20463 ?auto_20466 ) ) ( not ( = ?auto_20463 ?auto_20460 ) ) ( not ( = ?auto_20463 ?auto_20475 ) ) ( not ( = ?auto_20463 ?auto_20461 ) ) ( not ( = ?auto_20463 ?auto_20452 ) ) ( not ( = ?auto_20463 ?auto_20457 ) ) ( not ( = ?auto_20463 ?auto_20462 ) ) ( not ( = ?auto_20463 ?auto_20465 ) ) ( not ( = ?auto_20463 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20442 ) ) ( not ( = ?auto_20430 ?auto_20454 ) ) ( not ( = ?auto_20431 ?auto_20442 ) ) ( not ( = ?auto_20431 ?auto_20454 ) ) ( not ( = ?auto_20432 ?auto_20442 ) ) ( not ( = ?auto_20432 ?auto_20454 ) ) ( not ( = ?auto_20433 ?auto_20442 ) ) ( not ( = ?auto_20433 ?auto_20454 ) ) ( not ( = ?auto_20434 ?auto_20442 ) ) ( not ( = ?auto_20434 ?auto_20454 ) ) ( not ( = ?auto_20435 ?auto_20442 ) ) ( not ( = ?auto_20435 ?auto_20454 ) ) ( not ( = ?auto_20436 ?auto_20442 ) ) ( not ( = ?auto_20436 ?auto_20454 ) ) ( not ( = ?auto_20437 ?auto_20442 ) ) ( not ( = ?auto_20437 ?auto_20454 ) ) ( not ( = ?auto_20438 ?auto_20442 ) ) ( not ( = ?auto_20438 ?auto_20454 ) ) ( not ( = ?auto_20439 ?auto_20442 ) ) ( not ( = ?auto_20439 ?auto_20454 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20454 ) ) ( not ( = ?auto_20442 ?auto_20463 ) ) ( not ( = ?auto_20442 ?auto_20471 ) ) ( not ( = ?auto_20442 ?auto_20466 ) ) ( not ( = ?auto_20442 ?auto_20460 ) ) ( not ( = ?auto_20442 ?auto_20475 ) ) ( not ( = ?auto_20442 ?auto_20461 ) ) ( not ( = ?auto_20442 ?auto_20452 ) ) ( not ( = ?auto_20442 ?auto_20457 ) ) ( not ( = ?auto_20442 ?auto_20462 ) ) ( not ( = ?auto_20442 ?auto_20465 ) ) ( not ( = ?auto_20442 ?auto_20458 ) ) ( not ( = ?auto_20467 ?auto_20451 ) ) ( not ( = ?auto_20467 ?auto_20456 ) ) ( not ( = ?auto_20467 ?auto_20473 ) ) ( not ( = ?auto_20467 ?auto_20476 ) ) ( not ( = ?auto_20467 ?auto_20470 ) ) ( not ( = ?auto_20467 ?auto_20472 ) ) ( not ( = ?auto_20467 ?auto_20469 ) ) ( not ( = ?auto_20478 ?auto_20479 ) ) ( not ( = ?auto_20478 ?auto_20455 ) ) ( not ( = ?auto_20478 ?auto_20459 ) ) ( not ( = ?auto_20478 ?auto_20474 ) ) ( not ( = ?auto_20478 ?auto_20477 ) ) ( not ( = ?auto_20478 ?auto_20468 ) ) ( not ( = ?auto_20478 ?auto_20464 ) ) ( not ( = ?auto_20454 ?auto_20463 ) ) ( not ( = ?auto_20454 ?auto_20471 ) ) ( not ( = ?auto_20454 ?auto_20466 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20454 ?auto_20475 ) ) ( not ( = ?auto_20454 ?auto_20461 ) ) ( not ( = ?auto_20454 ?auto_20452 ) ) ( not ( = ?auto_20454 ?auto_20457 ) ) ( not ( = ?auto_20454 ?auto_20462 ) ) ( not ( = ?auto_20454 ?auto_20465 ) ) ( not ( = ?auto_20454 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20443 ) ) ( not ( = ?auto_20430 ?auto_20453 ) ) ( not ( = ?auto_20431 ?auto_20443 ) ) ( not ( = ?auto_20431 ?auto_20453 ) ) ( not ( = ?auto_20432 ?auto_20443 ) ) ( not ( = ?auto_20432 ?auto_20453 ) ) ( not ( = ?auto_20433 ?auto_20443 ) ) ( not ( = ?auto_20433 ?auto_20453 ) ) ( not ( = ?auto_20434 ?auto_20443 ) ) ( not ( = ?auto_20434 ?auto_20453 ) ) ( not ( = ?auto_20435 ?auto_20443 ) ) ( not ( = ?auto_20435 ?auto_20453 ) ) ( not ( = ?auto_20436 ?auto_20443 ) ) ( not ( = ?auto_20436 ?auto_20453 ) ) ( not ( = ?auto_20437 ?auto_20443 ) ) ( not ( = ?auto_20437 ?auto_20453 ) ) ( not ( = ?auto_20438 ?auto_20443 ) ) ( not ( = ?auto_20438 ?auto_20453 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20439 ?auto_20453 ) ) ( not ( = ?auto_20440 ?auto_20443 ) ) ( not ( = ?auto_20440 ?auto_20453 ) ) ( not ( = ?auto_20441 ?auto_20443 ) ) ( not ( = ?auto_20441 ?auto_20453 ) ) ( not ( = ?auto_20443 ?auto_20454 ) ) ( not ( = ?auto_20443 ?auto_20463 ) ) ( not ( = ?auto_20443 ?auto_20471 ) ) ( not ( = ?auto_20443 ?auto_20466 ) ) ( not ( = ?auto_20443 ?auto_20460 ) ) ( not ( = ?auto_20443 ?auto_20475 ) ) ( not ( = ?auto_20443 ?auto_20461 ) ) ( not ( = ?auto_20443 ?auto_20452 ) ) ( not ( = ?auto_20443 ?auto_20457 ) ) ( not ( = ?auto_20443 ?auto_20462 ) ) ( not ( = ?auto_20443 ?auto_20465 ) ) ( not ( = ?auto_20443 ?auto_20458 ) ) ( not ( = ?auto_20453 ?auto_20454 ) ) ( not ( = ?auto_20453 ?auto_20463 ) ) ( not ( = ?auto_20453 ?auto_20471 ) ) ( not ( = ?auto_20453 ?auto_20466 ) ) ( not ( = ?auto_20453 ?auto_20460 ) ) ( not ( = ?auto_20453 ?auto_20475 ) ) ( not ( = ?auto_20453 ?auto_20461 ) ) ( not ( = ?auto_20453 ?auto_20452 ) ) ( not ( = ?auto_20453 ?auto_20457 ) ) ( not ( = ?auto_20453 ?auto_20462 ) ) ( not ( = ?auto_20453 ?auto_20465 ) ) ( not ( = ?auto_20453 ?auto_20458 ) ) ( not ( = ?auto_20430 ?auto_20444 ) ) ( not ( = ?auto_20430 ?auto_20449 ) ) ( not ( = ?auto_20431 ?auto_20444 ) ) ( not ( = ?auto_20431 ?auto_20449 ) ) ( not ( = ?auto_20432 ?auto_20444 ) ) ( not ( = ?auto_20432 ?auto_20449 ) ) ( not ( = ?auto_20433 ?auto_20444 ) ) ( not ( = ?auto_20433 ?auto_20449 ) ) ( not ( = ?auto_20434 ?auto_20444 ) ) ( not ( = ?auto_20434 ?auto_20449 ) ) ( not ( = ?auto_20435 ?auto_20444 ) ) ( not ( = ?auto_20435 ?auto_20449 ) ) ( not ( = ?auto_20436 ?auto_20444 ) ) ( not ( = ?auto_20436 ?auto_20449 ) ) ( not ( = ?auto_20437 ?auto_20444 ) ) ( not ( = ?auto_20437 ?auto_20449 ) ) ( not ( = ?auto_20438 ?auto_20444 ) ) ( not ( = ?auto_20438 ?auto_20449 ) ) ( not ( = ?auto_20439 ?auto_20444 ) ) ( not ( = ?auto_20439 ?auto_20449 ) ) ( not ( = ?auto_20440 ?auto_20444 ) ) ( not ( = ?auto_20440 ?auto_20449 ) ) ( not ( = ?auto_20441 ?auto_20444 ) ) ( not ( = ?auto_20441 ?auto_20449 ) ) ( not ( = ?auto_20442 ?auto_20444 ) ) ( not ( = ?auto_20442 ?auto_20449 ) ) ( not ( = ?auto_20444 ?auto_20453 ) ) ( not ( = ?auto_20444 ?auto_20454 ) ) ( not ( = ?auto_20444 ?auto_20463 ) ) ( not ( = ?auto_20444 ?auto_20471 ) ) ( not ( = ?auto_20444 ?auto_20466 ) ) ( not ( = ?auto_20444 ?auto_20460 ) ) ( not ( = ?auto_20444 ?auto_20475 ) ) ( not ( = ?auto_20444 ?auto_20461 ) ) ( not ( = ?auto_20444 ?auto_20452 ) ) ( not ( = ?auto_20444 ?auto_20457 ) ) ( not ( = ?auto_20444 ?auto_20462 ) ) ( not ( = ?auto_20444 ?auto_20465 ) ) ( not ( = ?auto_20444 ?auto_20458 ) ) ( not ( = ?auto_20446 ?auto_20473 ) ) ( not ( = ?auto_20446 ?auto_20467 ) ) ( not ( = ?auto_20446 ?auto_20451 ) ) ( not ( = ?auto_20446 ?auto_20456 ) ) ( not ( = ?auto_20446 ?auto_20476 ) ) ( not ( = ?auto_20446 ?auto_20470 ) ) ( not ( = ?auto_20446 ?auto_20472 ) ) ( not ( = ?auto_20446 ?auto_20469 ) ) ( not ( = ?auto_20445 ?auto_20459 ) ) ( not ( = ?auto_20445 ?auto_20478 ) ) ( not ( = ?auto_20445 ?auto_20479 ) ) ( not ( = ?auto_20445 ?auto_20455 ) ) ( not ( = ?auto_20445 ?auto_20474 ) ) ( not ( = ?auto_20445 ?auto_20477 ) ) ( not ( = ?auto_20445 ?auto_20468 ) ) ( not ( = ?auto_20445 ?auto_20464 ) ) ( not ( = ?auto_20449 ?auto_20453 ) ) ( not ( = ?auto_20449 ?auto_20454 ) ) ( not ( = ?auto_20449 ?auto_20463 ) ) ( not ( = ?auto_20449 ?auto_20471 ) ) ( not ( = ?auto_20449 ?auto_20466 ) ) ( not ( = ?auto_20449 ?auto_20460 ) ) ( not ( = ?auto_20449 ?auto_20475 ) ) ( not ( = ?auto_20449 ?auto_20461 ) ) ( not ( = ?auto_20449 ?auto_20452 ) ) ( not ( = ?auto_20449 ?auto_20457 ) ) ( not ( = ?auto_20449 ?auto_20462 ) ) ( not ( = ?auto_20449 ?auto_20465 ) ) ( not ( = ?auto_20449 ?auto_20458 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20430 ?auto_20431 ?auto_20432 ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20436 ?auto_20437 ?auto_20438 ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 ?auto_20443 )
      ( MAKE-1CRATE ?auto_20443 ?auto_20444 )
      ( MAKE-14CRATE-VERIFY ?auto_20430 ?auto_20431 ?auto_20432 ?auto_20433 ?auto_20434 ?auto_20435 ?auto_20436 ?auto_20437 ?auto_20438 ?auto_20439 ?auto_20440 ?auto_20441 ?auto_20442 ?auto_20443 ?auto_20444 ) )
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
      ?auto_20512 - SURFACE
      ?auto_20513 - SURFACE
      ?auto_20514 - SURFACE
      ?auto_20515 - SURFACE
      ?auto_20516 - SURFACE
      ?auto_20517 - SURFACE
      ?auto_20518 - SURFACE
      ?auto_20519 - SURFACE
      ?auto_20520 - SURFACE
      ?auto_20521 - SURFACE
    )
    :vars
    (
      ?auto_20526 - HOIST
      ?auto_20523 - PLACE
      ?auto_20525 - PLACE
      ?auto_20522 - HOIST
      ?auto_20527 - SURFACE
      ?auto_20547 - PLACE
      ?auto_20554 - HOIST
      ?auto_20533 - SURFACE
      ?auto_20556 - PLACE
      ?auto_20538 - HOIST
      ?auto_20546 - SURFACE
      ?auto_20532 - PLACE
      ?auto_20529 - HOIST
      ?auto_20544 - SURFACE
      ?auto_20535 - PLACE
      ?auto_20555 - HOIST
      ?auto_20541 - SURFACE
      ?auto_20552 - PLACE
      ?auto_20550 - HOIST
      ?auto_20540 - SURFACE
      ?auto_20542 - SURFACE
      ?auto_20534 - SURFACE
      ?auto_20551 - PLACE
      ?auto_20557 - HOIST
      ?auto_20553 - SURFACE
      ?auto_20537 - PLACE
      ?auto_20543 - HOIST
      ?auto_20548 - SURFACE
      ?auto_20558 - SURFACE
      ?auto_20549 - PLACE
      ?auto_20530 - HOIST
      ?auto_20539 - SURFACE
      ?auto_20528 - PLACE
      ?auto_20531 - HOIST
      ?auto_20559 - SURFACE
      ?auto_20545 - SURFACE
      ?auto_20536 - SURFACE
      ?auto_20524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20526 ?auto_20523 ) ( IS-CRATE ?auto_20521 ) ( not ( = ?auto_20525 ?auto_20523 ) ) ( HOIST-AT ?auto_20522 ?auto_20525 ) ( AVAILABLE ?auto_20522 ) ( SURFACE-AT ?auto_20521 ?auto_20525 ) ( ON ?auto_20521 ?auto_20527 ) ( CLEAR ?auto_20521 ) ( not ( = ?auto_20520 ?auto_20521 ) ) ( not ( = ?auto_20520 ?auto_20527 ) ) ( not ( = ?auto_20521 ?auto_20527 ) ) ( not ( = ?auto_20526 ?auto_20522 ) ) ( IS-CRATE ?auto_20520 ) ( not ( = ?auto_20547 ?auto_20523 ) ) ( HOIST-AT ?auto_20554 ?auto_20547 ) ( AVAILABLE ?auto_20554 ) ( SURFACE-AT ?auto_20520 ?auto_20547 ) ( ON ?auto_20520 ?auto_20533 ) ( CLEAR ?auto_20520 ) ( not ( = ?auto_20519 ?auto_20520 ) ) ( not ( = ?auto_20519 ?auto_20533 ) ) ( not ( = ?auto_20520 ?auto_20533 ) ) ( not ( = ?auto_20526 ?auto_20554 ) ) ( IS-CRATE ?auto_20519 ) ( not ( = ?auto_20556 ?auto_20523 ) ) ( HOIST-AT ?auto_20538 ?auto_20556 ) ( SURFACE-AT ?auto_20519 ?auto_20556 ) ( ON ?auto_20519 ?auto_20546 ) ( CLEAR ?auto_20519 ) ( not ( = ?auto_20518 ?auto_20519 ) ) ( not ( = ?auto_20518 ?auto_20546 ) ) ( not ( = ?auto_20519 ?auto_20546 ) ) ( not ( = ?auto_20526 ?auto_20538 ) ) ( IS-CRATE ?auto_20518 ) ( not ( = ?auto_20532 ?auto_20523 ) ) ( HOIST-AT ?auto_20529 ?auto_20532 ) ( AVAILABLE ?auto_20529 ) ( SURFACE-AT ?auto_20518 ?auto_20532 ) ( ON ?auto_20518 ?auto_20544 ) ( CLEAR ?auto_20518 ) ( not ( = ?auto_20517 ?auto_20518 ) ) ( not ( = ?auto_20517 ?auto_20544 ) ) ( not ( = ?auto_20518 ?auto_20544 ) ) ( not ( = ?auto_20526 ?auto_20529 ) ) ( IS-CRATE ?auto_20517 ) ( not ( = ?auto_20535 ?auto_20523 ) ) ( HOIST-AT ?auto_20555 ?auto_20535 ) ( SURFACE-AT ?auto_20517 ?auto_20535 ) ( ON ?auto_20517 ?auto_20541 ) ( CLEAR ?auto_20517 ) ( not ( = ?auto_20516 ?auto_20517 ) ) ( not ( = ?auto_20516 ?auto_20541 ) ) ( not ( = ?auto_20517 ?auto_20541 ) ) ( not ( = ?auto_20526 ?auto_20555 ) ) ( IS-CRATE ?auto_20516 ) ( not ( = ?auto_20552 ?auto_20523 ) ) ( HOIST-AT ?auto_20550 ?auto_20552 ) ( AVAILABLE ?auto_20550 ) ( SURFACE-AT ?auto_20516 ?auto_20552 ) ( ON ?auto_20516 ?auto_20540 ) ( CLEAR ?auto_20516 ) ( not ( = ?auto_20515 ?auto_20516 ) ) ( not ( = ?auto_20515 ?auto_20540 ) ) ( not ( = ?auto_20516 ?auto_20540 ) ) ( not ( = ?auto_20526 ?auto_20550 ) ) ( IS-CRATE ?auto_20515 ) ( SURFACE-AT ?auto_20515 ?auto_20556 ) ( ON ?auto_20515 ?auto_20542 ) ( CLEAR ?auto_20515 ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( not ( = ?auto_20514 ?auto_20542 ) ) ( not ( = ?auto_20515 ?auto_20542 ) ) ( IS-CRATE ?auto_20514 ) ( AVAILABLE ?auto_20555 ) ( SURFACE-AT ?auto_20514 ?auto_20535 ) ( ON ?auto_20514 ?auto_20534 ) ( CLEAR ?auto_20514 ) ( not ( = ?auto_20513 ?auto_20514 ) ) ( not ( = ?auto_20513 ?auto_20534 ) ) ( not ( = ?auto_20514 ?auto_20534 ) ) ( IS-CRATE ?auto_20513 ) ( not ( = ?auto_20551 ?auto_20523 ) ) ( HOIST-AT ?auto_20557 ?auto_20551 ) ( AVAILABLE ?auto_20557 ) ( SURFACE-AT ?auto_20513 ?auto_20551 ) ( ON ?auto_20513 ?auto_20553 ) ( CLEAR ?auto_20513 ) ( not ( = ?auto_20512 ?auto_20513 ) ) ( not ( = ?auto_20512 ?auto_20553 ) ) ( not ( = ?auto_20513 ?auto_20553 ) ) ( not ( = ?auto_20526 ?auto_20557 ) ) ( IS-CRATE ?auto_20512 ) ( not ( = ?auto_20537 ?auto_20523 ) ) ( HOIST-AT ?auto_20543 ?auto_20537 ) ( AVAILABLE ?auto_20543 ) ( SURFACE-AT ?auto_20512 ?auto_20537 ) ( ON ?auto_20512 ?auto_20548 ) ( CLEAR ?auto_20512 ) ( not ( = ?auto_20511 ?auto_20512 ) ) ( not ( = ?auto_20511 ?auto_20548 ) ) ( not ( = ?auto_20512 ?auto_20548 ) ) ( not ( = ?auto_20526 ?auto_20543 ) ) ( IS-CRATE ?auto_20511 ) ( AVAILABLE ?auto_20538 ) ( SURFACE-AT ?auto_20511 ?auto_20556 ) ( ON ?auto_20511 ?auto_20558 ) ( CLEAR ?auto_20511 ) ( not ( = ?auto_20510 ?auto_20511 ) ) ( not ( = ?auto_20510 ?auto_20558 ) ) ( not ( = ?auto_20511 ?auto_20558 ) ) ( IS-CRATE ?auto_20510 ) ( not ( = ?auto_20549 ?auto_20523 ) ) ( HOIST-AT ?auto_20530 ?auto_20549 ) ( AVAILABLE ?auto_20530 ) ( SURFACE-AT ?auto_20510 ?auto_20549 ) ( ON ?auto_20510 ?auto_20539 ) ( CLEAR ?auto_20510 ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( not ( = ?auto_20509 ?auto_20539 ) ) ( not ( = ?auto_20510 ?auto_20539 ) ) ( not ( = ?auto_20526 ?auto_20530 ) ) ( IS-CRATE ?auto_20509 ) ( not ( = ?auto_20528 ?auto_20523 ) ) ( HOIST-AT ?auto_20531 ?auto_20528 ) ( SURFACE-AT ?auto_20509 ?auto_20528 ) ( ON ?auto_20509 ?auto_20559 ) ( CLEAR ?auto_20509 ) ( not ( = ?auto_20508 ?auto_20509 ) ) ( not ( = ?auto_20508 ?auto_20559 ) ) ( not ( = ?auto_20509 ?auto_20559 ) ) ( not ( = ?auto_20526 ?auto_20531 ) ) ( IS-CRATE ?auto_20508 ) ( SURFACE-AT ?auto_20508 ?auto_20528 ) ( ON ?auto_20508 ?auto_20545 ) ( CLEAR ?auto_20508 ) ( not ( = ?auto_20507 ?auto_20508 ) ) ( not ( = ?auto_20507 ?auto_20545 ) ) ( not ( = ?auto_20508 ?auto_20545 ) ) ( SURFACE-AT ?auto_20506 ?auto_20523 ) ( CLEAR ?auto_20506 ) ( IS-CRATE ?auto_20507 ) ( AVAILABLE ?auto_20526 ) ( AVAILABLE ?auto_20531 ) ( SURFACE-AT ?auto_20507 ?auto_20528 ) ( ON ?auto_20507 ?auto_20536 ) ( CLEAR ?auto_20507 ) ( TRUCK-AT ?auto_20524 ?auto_20523 ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20536 ) ) ( not ( = ?auto_20507 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20508 ) ) ( not ( = ?auto_20506 ?auto_20545 ) ) ( not ( = ?auto_20508 ?auto_20536 ) ) ( not ( = ?auto_20545 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20509 ) ) ( not ( = ?auto_20506 ?auto_20559 ) ) ( not ( = ?auto_20507 ?auto_20509 ) ) ( not ( = ?auto_20507 ?auto_20559 ) ) ( not ( = ?auto_20509 ?auto_20545 ) ) ( not ( = ?auto_20509 ?auto_20536 ) ) ( not ( = ?auto_20559 ?auto_20545 ) ) ( not ( = ?auto_20559 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20510 ) ) ( not ( = ?auto_20506 ?auto_20539 ) ) ( not ( = ?auto_20507 ?auto_20510 ) ) ( not ( = ?auto_20507 ?auto_20539 ) ) ( not ( = ?auto_20508 ?auto_20510 ) ) ( not ( = ?auto_20508 ?auto_20539 ) ) ( not ( = ?auto_20510 ?auto_20559 ) ) ( not ( = ?auto_20510 ?auto_20545 ) ) ( not ( = ?auto_20510 ?auto_20536 ) ) ( not ( = ?auto_20549 ?auto_20528 ) ) ( not ( = ?auto_20530 ?auto_20531 ) ) ( not ( = ?auto_20539 ?auto_20559 ) ) ( not ( = ?auto_20539 ?auto_20545 ) ) ( not ( = ?auto_20539 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20511 ) ) ( not ( = ?auto_20506 ?auto_20558 ) ) ( not ( = ?auto_20507 ?auto_20511 ) ) ( not ( = ?auto_20507 ?auto_20558 ) ) ( not ( = ?auto_20508 ?auto_20511 ) ) ( not ( = ?auto_20508 ?auto_20558 ) ) ( not ( = ?auto_20509 ?auto_20511 ) ) ( not ( = ?auto_20509 ?auto_20558 ) ) ( not ( = ?auto_20511 ?auto_20539 ) ) ( not ( = ?auto_20511 ?auto_20559 ) ) ( not ( = ?auto_20511 ?auto_20545 ) ) ( not ( = ?auto_20511 ?auto_20536 ) ) ( not ( = ?auto_20556 ?auto_20549 ) ) ( not ( = ?auto_20556 ?auto_20528 ) ) ( not ( = ?auto_20538 ?auto_20530 ) ) ( not ( = ?auto_20538 ?auto_20531 ) ) ( not ( = ?auto_20558 ?auto_20539 ) ) ( not ( = ?auto_20558 ?auto_20559 ) ) ( not ( = ?auto_20558 ?auto_20545 ) ) ( not ( = ?auto_20558 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20512 ) ) ( not ( = ?auto_20506 ?auto_20548 ) ) ( not ( = ?auto_20507 ?auto_20512 ) ) ( not ( = ?auto_20507 ?auto_20548 ) ) ( not ( = ?auto_20508 ?auto_20512 ) ) ( not ( = ?auto_20508 ?auto_20548 ) ) ( not ( = ?auto_20509 ?auto_20512 ) ) ( not ( = ?auto_20509 ?auto_20548 ) ) ( not ( = ?auto_20510 ?auto_20512 ) ) ( not ( = ?auto_20510 ?auto_20548 ) ) ( not ( = ?auto_20512 ?auto_20558 ) ) ( not ( = ?auto_20512 ?auto_20539 ) ) ( not ( = ?auto_20512 ?auto_20559 ) ) ( not ( = ?auto_20512 ?auto_20545 ) ) ( not ( = ?auto_20512 ?auto_20536 ) ) ( not ( = ?auto_20537 ?auto_20556 ) ) ( not ( = ?auto_20537 ?auto_20549 ) ) ( not ( = ?auto_20537 ?auto_20528 ) ) ( not ( = ?auto_20543 ?auto_20538 ) ) ( not ( = ?auto_20543 ?auto_20530 ) ) ( not ( = ?auto_20543 ?auto_20531 ) ) ( not ( = ?auto_20548 ?auto_20558 ) ) ( not ( = ?auto_20548 ?auto_20539 ) ) ( not ( = ?auto_20548 ?auto_20559 ) ) ( not ( = ?auto_20548 ?auto_20545 ) ) ( not ( = ?auto_20548 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20513 ) ) ( not ( = ?auto_20506 ?auto_20553 ) ) ( not ( = ?auto_20507 ?auto_20513 ) ) ( not ( = ?auto_20507 ?auto_20553 ) ) ( not ( = ?auto_20508 ?auto_20513 ) ) ( not ( = ?auto_20508 ?auto_20553 ) ) ( not ( = ?auto_20509 ?auto_20513 ) ) ( not ( = ?auto_20509 ?auto_20553 ) ) ( not ( = ?auto_20510 ?auto_20513 ) ) ( not ( = ?auto_20510 ?auto_20553 ) ) ( not ( = ?auto_20511 ?auto_20513 ) ) ( not ( = ?auto_20511 ?auto_20553 ) ) ( not ( = ?auto_20513 ?auto_20548 ) ) ( not ( = ?auto_20513 ?auto_20558 ) ) ( not ( = ?auto_20513 ?auto_20539 ) ) ( not ( = ?auto_20513 ?auto_20559 ) ) ( not ( = ?auto_20513 ?auto_20545 ) ) ( not ( = ?auto_20513 ?auto_20536 ) ) ( not ( = ?auto_20551 ?auto_20537 ) ) ( not ( = ?auto_20551 ?auto_20556 ) ) ( not ( = ?auto_20551 ?auto_20549 ) ) ( not ( = ?auto_20551 ?auto_20528 ) ) ( not ( = ?auto_20557 ?auto_20543 ) ) ( not ( = ?auto_20557 ?auto_20538 ) ) ( not ( = ?auto_20557 ?auto_20530 ) ) ( not ( = ?auto_20557 ?auto_20531 ) ) ( not ( = ?auto_20553 ?auto_20548 ) ) ( not ( = ?auto_20553 ?auto_20558 ) ) ( not ( = ?auto_20553 ?auto_20539 ) ) ( not ( = ?auto_20553 ?auto_20559 ) ) ( not ( = ?auto_20553 ?auto_20545 ) ) ( not ( = ?auto_20553 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20514 ) ) ( not ( = ?auto_20506 ?auto_20534 ) ) ( not ( = ?auto_20507 ?auto_20514 ) ) ( not ( = ?auto_20507 ?auto_20534 ) ) ( not ( = ?auto_20508 ?auto_20514 ) ) ( not ( = ?auto_20508 ?auto_20534 ) ) ( not ( = ?auto_20509 ?auto_20514 ) ) ( not ( = ?auto_20509 ?auto_20534 ) ) ( not ( = ?auto_20510 ?auto_20514 ) ) ( not ( = ?auto_20510 ?auto_20534 ) ) ( not ( = ?auto_20511 ?auto_20514 ) ) ( not ( = ?auto_20511 ?auto_20534 ) ) ( not ( = ?auto_20512 ?auto_20514 ) ) ( not ( = ?auto_20512 ?auto_20534 ) ) ( not ( = ?auto_20514 ?auto_20553 ) ) ( not ( = ?auto_20514 ?auto_20548 ) ) ( not ( = ?auto_20514 ?auto_20558 ) ) ( not ( = ?auto_20514 ?auto_20539 ) ) ( not ( = ?auto_20514 ?auto_20559 ) ) ( not ( = ?auto_20514 ?auto_20545 ) ) ( not ( = ?auto_20514 ?auto_20536 ) ) ( not ( = ?auto_20535 ?auto_20551 ) ) ( not ( = ?auto_20535 ?auto_20537 ) ) ( not ( = ?auto_20535 ?auto_20556 ) ) ( not ( = ?auto_20535 ?auto_20549 ) ) ( not ( = ?auto_20535 ?auto_20528 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20543 ) ) ( not ( = ?auto_20555 ?auto_20538 ) ) ( not ( = ?auto_20555 ?auto_20530 ) ) ( not ( = ?auto_20555 ?auto_20531 ) ) ( not ( = ?auto_20534 ?auto_20553 ) ) ( not ( = ?auto_20534 ?auto_20548 ) ) ( not ( = ?auto_20534 ?auto_20558 ) ) ( not ( = ?auto_20534 ?auto_20539 ) ) ( not ( = ?auto_20534 ?auto_20559 ) ) ( not ( = ?auto_20534 ?auto_20545 ) ) ( not ( = ?auto_20534 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20515 ) ) ( not ( = ?auto_20506 ?auto_20542 ) ) ( not ( = ?auto_20507 ?auto_20515 ) ) ( not ( = ?auto_20507 ?auto_20542 ) ) ( not ( = ?auto_20508 ?auto_20515 ) ) ( not ( = ?auto_20508 ?auto_20542 ) ) ( not ( = ?auto_20509 ?auto_20515 ) ) ( not ( = ?auto_20509 ?auto_20542 ) ) ( not ( = ?auto_20510 ?auto_20515 ) ) ( not ( = ?auto_20510 ?auto_20542 ) ) ( not ( = ?auto_20511 ?auto_20515 ) ) ( not ( = ?auto_20511 ?auto_20542 ) ) ( not ( = ?auto_20512 ?auto_20515 ) ) ( not ( = ?auto_20512 ?auto_20542 ) ) ( not ( = ?auto_20513 ?auto_20515 ) ) ( not ( = ?auto_20513 ?auto_20542 ) ) ( not ( = ?auto_20515 ?auto_20534 ) ) ( not ( = ?auto_20515 ?auto_20553 ) ) ( not ( = ?auto_20515 ?auto_20548 ) ) ( not ( = ?auto_20515 ?auto_20558 ) ) ( not ( = ?auto_20515 ?auto_20539 ) ) ( not ( = ?auto_20515 ?auto_20559 ) ) ( not ( = ?auto_20515 ?auto_20545 ) ) ( not ( = ?auto_20515 ?auto_20536 ) ) ( not ( = ?auto_20542 ?auto_20534 ) ) ( not ( = ?auto_20542 ?auto_20553 ) ) ( not ( = ?auto_20542 ?auto_20548 ) ) ( not ( = ?auto_20542 ?auto_20558 ) ) ( not ( = ?auto_20542 ?auto_20539 ) ) ( not ( = ?auto_20542 ?auto_20559 ) ) ( not ( = ?auto_20542 ?auto_20545 ) ) ( not ( = ?auto_20542 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20516 ) ) ( not ( = ?auto_20506 ?auto_20540 ) ) ( not ( = ?auto_20507 ?auto_20516 ) ) ( not ( = ?auto_20507 ?auto_20540 ) ) ( not ( = ?auto_20508 ?auto_20516 ) ) ( not ( = ?auto_20508 ?auto_20540 ) ) ( not ( = ?auto_20509 ?auto_20516 ) ) ( not ( = ?auto_20509 ?auto_20540 ) ) ( not ( = ?auto_20510 ?auto_20516 ) ) ( not ( = ?auto_20510 ?auto_20540 ) ) ( not ( = ?auto_20511 ?auto_20516 ) ) ( not ( = ?auto_20511 ?auto_20540 ) ) ( not ( = ?auto_20512 ?auto_20516 ) ) ( not ( = ?auto_20512 ?auto_20540 ) ) ( not ( = ?auto_20513 ?auto_20516 ) ) ( not ( = ?auto_20513 ?auto_20540 ) ) ( not ( = ?auto_20514 ?auto_20516 ) ) ( not ( = ?auto_20514 ?auto_20540 ) ) ( not ( = ?auto_20516 ?auto_20542 ) ) ( not ( = ?auto_20516 ?auto_20534 ) ) ( not ( = ?auto_20516 ?auto_20553 ) ) ( not ( = ?auto_20516 ?auto_20548 ) ) ( not ( = ?auto_20516 ?auto_20558 ) ) ( not ( = ?auto_20516 ?auto_20539 ) ) ( not ( = ?auto_20516 ?auto_20559 ) ) ( not ( = ?auto_20516 ?auto_20545 ) ) ( not ( = ?auto_20516 ?auto_20536 ) ) ( not ( = ?auto_20552 ?auto_20556 ) ) ( not ( = ?auto_20552 ?auto_20535 ) ) ( not ( = ?auto_20552 ?auto_20551 ) ) ( not ( = ?auto_20552 ?auto_20537 ) ) ( not ( = ?auto_20552 ?auto_20549 ) ) ( not ( = ?auto_20552 ?auto_20528 ) ) ( not ( = ?auto_20550 ?auto_20538 ) ) ( not ( = ?auto_20550 ?auto_20555 ) ) ( not ( = ?auto_20550 ?auto_20557 ) ) ( not ( = ?auto_20550 ?auto_20543 ) ) ( not ( = ?auto_20550 ?auto_20530 ) ) ( not ( = ?auto_20550 ?auto_20531 ) ) ( not ( = ?auto_20540 ?auto_20542 ) ) ( not ( = ?auto_20540 ?auto_20534 ) ) ( not ( = ?auto_20540 ?auto_20553 ) ) ( not ( = ?auto_20540 ?auto_20548 ) ) ( not ( = ?auto_20540 ?auto_20558 ) ) ( not ( = ?auto_20540 ?auto_20539 ) ) ( not ( = ?auto_20540 ?auto_20559 ) ) ( not ( = ?auto_20540 ?auto_20545 ) ) ( not ( = ?auto_20540 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20517 ) ) ( not ( = ?auto_20506 ?auto_20541 ) ) ( not ( = ?auto_20507 ?auto_20517 ) ) ( not ( = ?auto_20507 ?auto_20541 ) ) ( not ( = ?auto_20508 ?auto_20517 ) ) ( not ( = ?auto_20508 ?auto_20541 ) ) ( not ( = ?auto_20509 ?auto_20517 ) ) ( not ( = ?auto_20509 ?auto_20541 ) ) ( not ( = ?auto_20510 ?auto_20517 ) ) ( not ( = ?auto_20510 ?auto_20541 ) ) ( not ( = ?auto_20511 ?auto_20517 ) ) ( not ( = ?auto_20511 ?auto_20541 ) ) ( not ( = ?auto_20512 ?auto_20517 ) ) ( not ( = ?auto_20512 ?auto_20541 ) ) ( not ( = ?auto_20513 ?auto_20517 ) ) ( not ( = ?auto_20513 ?auto_20541 ) ) ( not ( = ?auto_20514 ?auto_20517 ) ) ( not ( = ?auto_20514 ?auto_20541 ) ) ( not ( = ?auto_20515 ?auto_20517 ) ) ( not ( = ?auto_20515 ?auto_20541 ) ) ( not ( = ?auto_20517 ?auto_20540 ) ) ( not ( = ?auto_20517 ?auto_20542 ) ) ( not ( = ?auto_20517 ?auto_20534 ) ) ( not ( = ?auto_20517 ?auto_20553 ) ) ( not ( = ?auto_20517 ?auto_20548 ) ) ( not ( = ?auto_20517 ?auto_20558 ) ) ( not ( = ?auto_20517 ?auto_20539 ) ) ( not ( = ?auto_20517 ?auto_20559 ) ) ( not ( = ?auto_20517 ?auto_20545 ) ) ( not ( = ?auto_20517 ?auto_20536 ) ) ( not ( = ?auto_20541 ?auto_20540 ) ) ( not ( = ?auto_20541 ?auto_20542 ) ) ( not ( = ?auto_20541 ?auto_20534 ) ) ( not ( = ?auto_20541 ?auto_20553 ) ) ( not ( = ?auto_20541 ?auto_20548 ) ) ( not ( = ?auto_20541 ?auto_20558 ) ) ( not ( = ?auto_20541 ?auto_20539 ) ) ( not ( = ?auto_20541 ?auto_20559 ) ) ( not ( = ?auto_20541 ?auto_20545 ) ) ( not ( = ?auto_20541 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20518 ) ) ( not ( = ?auto_20506 ?auto_20544 ) ) ( not ( = ?auto_20507 ?auto_20518 ) ) ( not ( = ?auto_20507 ?auto_20544 ) ) ( not ( = ?auto_20508 ?auto_20518 ) ) ( not ( = ?auto_20508 ?auto_20544 ) ) ( not ( = ?auto_20509 ?auto_20518 ) ) ( not ( = ?auto_20509 ?auto_20544 ) ) ( not ( = ?auto_20510 ?auto_20518 ) ) ( not ( = ?auto_20510 ?auto_20544 ) ) ( not ( = ?auto_20511 ?auto_20518 ) ) ( not ( = ?auto_20511 ?auto_20544 ) ) ( not ( = ?auto_20512 ?auto_20518 ) ) ( not ( = ?auto_20512 ?auto_20544 ) ) ( not ( = ?auto_20513 ?auto_20518 ) ) ( not ( = ?auto_20513 ?auto_20544 ) ) ( not ( = ?auto_20514 ?auto_20518 ) ) ( not ( = ?auto_20514 ?auto_20544 ) ) ( not ( = ?auto_20515 ?auto_20518 ) ) ( not ( = ?auto_20515 ?auto_20544 ) ) ( not ( = ?auto_20516 ?auto_20518 ) ) ( not ( = ?auto_20516 ?auto_20544 ) ) ( not ( = ?auto_20518 ?auto_20541 ) ) ( not ( = ?auto_20518 ?auto_20540 ) ) ( not ( = ?auto_20518 ?auto_20542 ) ) ( not ( = ?auto_20518 ?auto_20534 ) ) ( not ( = ?auto_20518 ?auto_20553 ) ) ( not ( = ?auto_20518 ?auto_20548 ) ) ( not ( = ?auto_20518 ?auto_20558 ) ) ( not ( = ?auto_20518 ?auto_20539 ) ) ( not ( = ?auto_20518 ?auto_20559 ) ) ( not ( = ?auto_20518 ?auto_20545 ) ) ( not ( = ?auto_20518 ?auto_20536 ) ) ( not ( = ?auto_20532 ?auto_20535 ) ) ( not ( = ?auto_20532 ?auto_20552 ) ) ( not ( = ?auto_20532 ?auto_20556 ) ) ( not ( = ?auto_20532 ?auto_20551 ) ) ( not ( = ?auto_20532 ?auto_20537 ) ) ( not ( = ?auto_20532 ?auto_20549 ) ) ( not ( = ?auto_20532 ?auto_20528 ) ) ( not ( = ?auto_20529 ?auto_20555 ) ) ( not ( = ?auto_20529 ?auto_20550 ) ) ( not ( = ?auto_20529 ?auto_20538 ) ) ( not ( = ?auto_20529 ?auto_20557 ) ) ( not ( = ?auto_20529 ?auto_20543 ) ) ( not ( = ?auto_20529 ?auto_20530 ) ) ( not ( = ?auto_20529 ?auto_20531 ) ) ( not ( = ?auto_20544 ?auto_20541 ) ) ( not ( = ?auto_20544 ?auto_20540 ) ) ( not ( = ?auto_20544 ?auto_20542 ) ) ( not ( = ?auto_20544 ?auto_20534 ) ) ( not ( = ?auto_20544 ?auto_20553 ) ) ( not ( = ?auto_20544 ?auto_20548 ) ) ( not ( = ?auto_20544 ?auto_20558 ) ) ( not ( = ?auto_20544 ?auto_20539 ) ) ( not ( = ?auto_20544 ?auto_20559 ) ) ( not ( = ?auto_20544 ?auto_20545 ) ) ( not ( = ?auto_20544 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20519 ) ) ( not ( = ?auto_20506 ?auto_20546 ) ) ( not ( = ?auto_20507 ?auto_20519 ) ) ( not ( = ?auto_20507 ?auto_20546 ) ) ( not ( = ?auto_20508 ?auto_20519 ) ) ( not ( = ?auto_20508 ?auto_20546 ) ) ( not ( = ?auto_20509 ?auto_20519 ) ) ( not ( = ?auto_20509 ?auto_20546 ) ) ( not ( = ?auto_20510 ?auto_20519 ) ) ( not ( = ?auto_20510 ?auto_20546 ) ) ( not ( = ?auto_20511 ?auto_20519 ) ) ( not ( = ?auto_20511 ?auto_20546 ) ) ( not ( = ?auto_20512 ?auto_20519 ) ) ( not ( = ?auto_20512 ?auto_20546 ) ) ( not ( = ?auto_20513 ?auto_20519 ) ) ( not ( = ?auto_20513 ?auto_20546 ) ) ( not ( = ?auto_20514 ?auto_20519 ) ) ( not ( = ?auto_20514 ?auto_20546 ) ) ( not ( = ?auto_20515 ?auto_20519 ) ) ( not ( = ?auto_20515 ?auto_20546 ) ) ( not ( = ?auto_20516 ?auto_20519 ) ) ( not ( = ?auto_20516 ?auto_20546 ) ) ( not ( = ?auto_20517 ?auto_20519 ) ) ( not ( = ?auto_20517 ?auto_20546 ) ) ( not ( = ?auto_20519 ?auto_20544 ) ) ( not ( = ?auto_20519 ?auto_20541 ) ) ( not ( = ?auto_20519 ?auto_20540 ) ) ( not ( = ?auto_20519 ?auto_20542 ) ) ( not ( = ?auto_20519 ?auto_20534 ) ) ( not ( = ?auto_20519 ?auto_20553 ) ) ( not ( = ?auto_20519 ?auto_20548 ) ) ( not ( = ?auto_20519 ?auto_20558 ) ) ( not ( = ?auto_20519 ?auto_20539 ) ) ( not ( = ?auto_20519 ?auto_20559 ) ) ( not ( = ?auto_20519 ?auto_20545 ) ) ( not ( = ?auto_20519 ?auto_20536 ) ) ( not ( = ?auto_20546 ?auto_20544 ) ) ( not ( = ?auto_20546 ?auto_20541 ) ) ( not ( = ?auto_20546 ?auto_20540 ) ) ( not ( = ?auto_20546 ?auto_20542 ) ) ( not ( = ?auto_20546 ?auto_20534 ) ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20558 ) ) ( not ( = ?auto_20546 ?auto_20539 ) ) ( not ( = ?auto_20546 ?auto_20559 ) ) ( not ( = ?auto_20546 ?auto_20545 ) ) ( not ( = ?auto_20546 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20520 ) ) ( not ( = ?auto_20506 ?auto_20533 ) ) ( not ( = ?auto_20507 ?auto_20520 ) ) ( not ( = ?auto_20507 ?auto_20533 ) ) ( not ( = ?auto_20508 ?auto_20520 ) ) ( not ( = ?auto_20508 ?auto_20533 ) ) ( not ( = ?auto_20509 ?auto_20520 ) ) ( not ( = ?auto_20509 ?auto_20533 ) ) ( not ( = ?auto_20510 ?auto_20520 ) ) ( not ( = ?auto_20510 ?auto_20533 ) ) ( not ( = ?auto_20511 ?auto_20520 ) ) ( not ( = ?auto_20511 ?auto_20533 ) ) ( not ( = ?auto_20512 ?auto_20520 ) ) ( not ( = ?auto_20512 ?auto_20533 ) ) ( not ( = ?auto_20513 ?auto_20520 ) ) ( not ( = ?auto_20513 ?auto_20533 ) ) ( not ( = ?auto_20514 ?auto_20520 ) ) ( not ( = ?auto_20514 ?auto_20533 ) ) ( not ( = ?auto_20515 ?auto_20520 ) ) ( not ( = ?auto_20515 ?auto_20533 ) ) ( not ( = ?auto_20516 ?auto_20520 ) ) ( not ( = ?auto_20516 ?auto_20533 ) ) ( not ( = ?auto_20517 ?auto_20520 ) ) ( not ( = ?auto_20517 ?auto_20533 ) ) ( not ( = ?auto_20518 ?auto_20520 ) ) ( not ( = ?auto_20518 ?auto_20533 ) ) ( not ( = ?auto_20520 ?auto_20546 ) ) ( not ( = ?auto_20520 ?auto_20544 ) ) ( not ( = ?auto_20520 ?auto_20541 ) ) ( not ( = ?auto_20520 ?auto_20540 ) ) ( not ( = ?auto_20520 ?auto_20542 ) ) ( not ( = ?auto_20520 ?auto_20534 ) ) ( not ( = ?auto_20520 ?auto_20553 ) ) ( not ( = ?auto_20520 ?auto_20548 ) ) ( not ( = ?auto_20520 ?auto_20558 ) ) ( not ( = ?auto_20520 ?auto_20539 ) ) ( not ( = ?auto_20520 ?auto_20559 ) ) ( not ( = ?auto_20520 ?auto_20545 ) ) ( not ( = ?auto_20520 ?auto_20536 ) ) ( not ( = ?auto_20547 ?auto_20556 ) ) ( not ( = ?auto_20547 ?auto_20532 ) ) ( not ( = ?auto_20547 ?auto_20535 ) ) ( not ( = ?auto_20547 ?auto_20552 ) ) ( not ( = ?auto_20547 ?auto_20551 ) ) ( not ( = ?auto_20547 ?auto_20537 ) ) ( not ( = ?auto_20547 ?auto_20549 ) ) ( not ( = ?auto_20547 ?auto_20528 ) ) ( not ( = ?auto_20554 ?auto_20538 ) ) ( not ( = ?auto_20554 ?auto_20529 ) ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20550 ) ) ( not ( = ?auto_20554 ?auto_20557 ) ) ( not ( = ?auto_20554 ?auto_20543 ) ) ( not ( = ?auto_20554 ?auto_20530 ) ) ( not ( = ?auto_20554 ?auto_20531 ) ) ( not ( = ?auto_20533 ?auto_20546 ) ) ( not ( = ?auto_20533 ?auto_20544 ) ) ( not ( = ?auto_20533 ?auto_20541 ) ) ( not ( = ?auto_20533 ?auto_20540 ) ) ( not ( = ?auto_20533 ?auto_20542 ) ) ( not ( = ?auto_20533 ?auto_20534 ) ) ( not ( = ?auto_20533 ?auto_20553 ) ) ( not ( = ?auto_20533 ?auto_20548 ) ) ( not ( = ?auto_20533 ?auto_20558 ) ) ( not ( = ?auto_20533 ?auto_20539 ) ) ( not ( = ?auto_20533 ?auto_20559 ) ) ( not ( = ?auto_20533 ?auto_20545 ) ) ( not ( = ?auto_20533 ?auto_20536 ) ) ( not ( = ?auto_20506 ?auto_20521 ) ) ( not ( = ?auto_20506 ?auto_20527 ) ) ( not ( = ?auto_20507 ?auto_20521 ) ) ( not ( = ?auto_20507 ?auto_20527 ) ) ( not ( = ?auto_20508 ?auto_20521 ) ) ( not ( = ?auto_20508 ?auto_20527 ) ) ( not ( = ?auto_20509 ?auto_20521 ) ) ( not ( = ?auto_20509 ?auto_20527 ) ) ( not ( = ?auto_20510 ?auto_20521 ) ) ( not ( = ?auto_20510 ?auto_20527 ) ) ( not ( = ?auto_20511 ?auto_20521 ) ) ( not ( = ?auto_20511 ?auto_20527 ) ) ( not ( = ?auto_20512 ?auto_20521 ) ) ( not ( = ?auto_20512 ?auto_20527 ) ) ( not ( = ?auto_20513 ?auto_20521 ) ) ( not ( = ?auto_20513 ?auto_20527 ) ) ( not ( = ?auto_20514 ?auto_20521 ) ) ( not ( = ?auto_20514 ?auto_20527 ) ) ( not ( = ?auto_20515 ?auto_20521 ) ) ( not ( = ?auto_20515 ?auto_20527 ) ) ( not ( = ?auto_20516 ?auto_20521 ) ) ( not ( = ?auto_20516 ?auto_20527 ) ) ( not ( = ?auto_20517 ?auto_20521 ) ) ( not ( = ?auto_20517 ?auto_20527 ) ) ( not ( = ?auto_20518 ?auto_20521 ) ) ( not ( = ?auto_20518 ?auto_20527 ) ) ( not ( = ?auto_20519 ?auto_20521 ) ) ( not ( = ?auto_20519 ?auto_20527 ) ) ( not ( = ?auto_20521 ?auto_20533 ) ) ( not ( = ?auto_20521 ?auto_20546 ) ) ( not ( = ?auto_20521 ?auto_20544 ) ) ( not ( = ?auto_20521 ?auto_20541 ) ) ( not ( = ?auto_20521 ?auto_20540 ) ) ( not ( = ?auto_20521 ?auto_20542 ) ) ( not ( = ?auto_20521 ?auto_20534 ) ) ( not ( = ?auto_20521 ?auto_20553 ) ) ( not ( = ?auto_20521 ?auto_20548 ) ) ( not ( = ?auto_20521 ?auto_20558 ) ) ( not ( = ?auto_20521 ?auto_20539 ) ) ( not ( = ?auto_20521 ?auto_20559 ) ) ( not ( = ?auto_20521 ?auto_20545 ) ) ( not ( = ?auto_20521 ?auto_20536 ) ) ( not ( = ?auto_20525 ?auto_20547 ) ) ( not ( = ?auto_20525 ?auto_20556 ) ) ( not ( = ?auto_20525 ?auto_20532 ) ) ( not ( = ?auto_20525 ?auto_20535 ) ) ( not ( = ?auto_20525 ?auto_20552 ) ) ( not ( = ?auto_20525 ?auto_20551 ) ) ( not ( = ?auto_20525 ?auto_20537 ) ) ( not ( = ?auto_20525 ?auto_20549 ) ) ( not ( = ?auto_20525 ?auto_20528 ) ) ( not ( = ?auto_20522 ?auto_20554 ) ) ( not ( = ?auto_20522 ?auto_20538 ) ) ( not ( = ?auto_20522 ?auto_20529 ) ) ( not ( = ?auto_20522 ?auto_20555 ) ) ( not ( = ?auto_20522 ?auto_20550 ) ) ( not ( = ?auto_20522 ?auto_20557 ) ) ( not ( = ?auto_20522 ?auto_20543 ) ) ( not ( = ?auto_20522 ?auto_20530 ) ) ( not ( = ?auto_20522 ?auto_20531 ) ) ( not ( = ?auto_20527 ?auto_20533 ) ) ( not ( = ?auto_20527 ?auto_20546 ) ) ( not ( = ?auto_20527 ?auto_20544 ) ) ( not ( = ?auto_20527 ?auto_20541 ) ) ( not ( = ?auto_20527 ?auto_20540 ) ) ( not ( = ?auto_20527 ?auto_20542 ) ) ( not ( = ?auto_20527 ?auto_20534 ) ) ( not ( = ?auto_20527 ?auto_20553 ) ) ( not ( = ?auto_20527 ?auto_20548 ) ) ( not ( = ?auto_20527 ?auto_20558 ) ) ( not ( = ?auto_20527 ?auto_20539 ) ) ( not ( = ?auto_20527 ?auto_20559 ) ) ( not ( = ?auto_20527 ?auto_20545 ) ) ( not ( = ?auto_20527 ?auto_20536 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20509 ?auto_20510 ?auto_20511 ?auto_20512 ?auto_20513 ?auto_20514 ?auto_20515 ?auto_20516 ?auto_20517 ?auto_20518 ?auto_20519 ?auto_20520 )
      ( MAKE-1CRATE ?auto_20520 ?auto_20521 )
      ( MAKE-15CRATE-VERIFY ?auto_20506 ?auto_20507 ?auto_20508 ?auto_20509 ?auto_20510 ?auto_20511 ?auto_20512 ?auto_20513 ?auto_20514 ?auto_20515 ?auto_20516 ?auto_20517 ?auto_20518 ?auto_20519 ?auto_20520 ?auto_20521 ) )
  )

)

