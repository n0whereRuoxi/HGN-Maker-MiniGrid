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
      ?auto_1426902 - SURFACE
      ?auto_1426903 - SURFACE
    )
    :vars
    (
      ?auto_1426904 - HOIST
      ?auto_1426905 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426904 ?auto_1426905 ) ( SURFACE-AT ?auto_1426902 ?auto_1426905 ) ( CLEAR ?auto_1426902 ) ( LIFTING ?auto_1426904 ?auto_1426903 ) ( IS-CRATE ?auto_1426903 ) ( not ( = ?auto_1426902 ?auto_1426903 ) ) )
    :subtasks
    ( ( !DROP ?auto_1426904 ?auto_1426903 ?auto_1426902 ?auto_1426905 )
      ( MAKE-1CRATE-VERIFY ?auto_1426902 ?auto_1426903 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426906 - SURFACE
      ?auto_1426907 - SURFACE
    )
    :vars
    (
      ?auto_1426908 - HOIST
      ?auto_1426909 - PLACE
      ?auto_1426910 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426908 ?auto_1426909 ) ( SURFACE-AT ?auto_1426906 ?auto_1426909 ) ( CLEAR ?auto_1426906 ) ( IS-CRATE ?auto_1426907 ) ( not ( = ?auto_1426906 ?auto_1426907 ) ) ( TRUCK-AT ?auto_1426910 ?auto_1426909 ) ( AVAILABLE ?auto_1426908 ) ( IN ?auto_1426907 ?auto_1426910 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1426908 ?auto_1426907 ?auto_1426910 ?auto_1426909 )
      ( MAKE-1CRATE ?auto_1426906 ?auto_1426907 )
      ( MAKE-1CRATE-VERIFY ?auto_1426906 ?auto_1426907 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426911 - SURFACE
      ?auto_1426912 - SURFACE
    )
    :vars
    (
      ?auto_1426915 - HOIST
      ?auto_1426913 - PLACE
      ?auto_1426914 - TRUCK
      ?auto_1426916 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426915 ?auto_1426913 ) ( SURFACE-AT ?auto_1426911 ?auto_1426913 ) ( CLEAR ?auto_1426911 ) ( IS-CRATE ?auto_1426912 ) ( not ( = ?auto_1426911 ?auto_1426912 ) ) ( AVAILABLE ?auto_1426915 ) ( IN ?auto_1426912 ?auto_1426914 ) ( TRUCK-AT ?auto_1426914 ?auto_1426916 ) ( not ( = ?auto_1426916 ?auto_1426913 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1426914 ?auto_1426916 ?auto_1426913 )
      ( MAKE-1CRATE ?auto_1426911 ?auto_1426912 )
      ( MAKE-1CRATE-VERIFY ?auto_1426911 ?auto_1426912 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426917 - SURFACE
      ?auto_1426918 - SURFACE
    )
    :vars
    (
      ?auto_1426922 - HOIST
      ?auto_1426920 - PLACE
      ?auto_1426919 - TRUCK
      ?auto_1426921 - PLACE
      ?auto_1426923 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426922 ?auto_1426920 ) ( SURFACE-AT ?auto_1426917 ?auto_1426920 ) ( CLEAR ?auto_1426917 ) ( IS-CRATE ?auto_1426918 ) ( not ( = ?auto_1426917 ?auto_1426918 ) ) ( AVAILABLE ?auto_1426922 ) ( TRUCK-AT ?auto_1426919 ?auto_1426921 ) ( not ( = ?auto_1426921 ?auto_1426920 ) ) ( HOIST-AT ?auto_1426923 ?auto_1426921 ) ( LIFTING ?auto_1426923 ?auto_1426918 ) ( not ( = ?auto_1426922 ?auto_1426923 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1426923 ?auto_1426918 ?auto_1426919 ?auto_1426921 )
      ( MAKE-1CRATE ?auto_1426917 ?auto_1426918 )
      ( MAKE-1CRATE-VERIFY ?auto_1426917 ?auto_1426918 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426924 - SURFACE
      ?auto_1426925 - SURFACE
    )
    :vars
    (
      ?auto_1426926 - HOIST
      ?auto_1426928 - PLACE
      ?auto_1426927 - TRUCK
      ?auto_1426929 - PLACE
      ?auto_1426930 - HOIST
      ?auto_1426931 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426926 ?auto_1426928 ) ( SURFACE-AT ?auto_1426924 ?auto_1426928 ) ( CLEAR ?auto_1426924 ) ( IS-CRATE ?auto_1426925 ) ( not ( = ?auto_1426924 ?auto_1426925 ) ) ( AVAILABLE ?auto_1426926 ) ( TRUCK-AT ?auto_1426927 ?auto_1426929 ) ( not ( = ?auto_1426929 ?auto_1426928 ) ) ( HOIST-AT ?auto_1426930 ?auto_1426929 ) ( not ( = ?auto_1426926 ?auto_1426930 ) ) ( AVAILABLE ?auto_1426930 ) ( SURFACE-AT ?auto_1426925 ?auto_1426929 ) ( ON ?auto_1426925 ?auto_1426931 ) ( CLEAR ?auto_1426925 ) ( not ( = ?auto_1426924 ?auto_1426931 ) ) ( not ( = ?auto_1426925 ?auto_1426931 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1426930 ?auto_1426925 ?auto_1426931 ?auto_1426929 )
      ( MAKE-1CRATE ?auto_1426924 ?auto_1426925 )
      ( MAKE-1CRATE-VERIFY ?auto_1426924 ?auto_1426925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426932 - SURFACE
      ?auto_1426933 - SURFACE
    )
    :vars
    (
      ?auto_1426936 - HOIST
      ?auto_1426935 - PLACE
      ?auto_1426937 - PLACE
      ?auto_1426938 - HOIST
      ?auto_1426934 - SURFACE
      ?auto_1426939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426936 ?auto_1426935 ) ( SURFACE-AT ?auto_1426932 ?auto_1426935 ) ( CLEAR ?auto_1426932 ) ( IS-CRATE ?auto_1426933 ) ( not ( = ?auto_1426932 ?auto_1426933 ) ) ( AVAILABLE ?auto_1426936 ) ( not ( = ?auto_1426937 ?auto_1426935 ) ) ( HOIST-AT ?auto_1426938 ?auto_1426937 ) ( not ( = ?auto_1426936 ?auto_1426938 ) ) ( AVAILABLE ?auto_1426938 ) ( SURFACE-AT ?auto_1426933 ?auto_1426937 ) ( ON ?auto_1426933 ?auto_1426934 ) ( CLEAR ?auto_1426933 ) ( not ( = ?auto_1426932 ?auto_1426934 ) ) ( not ( = ?auto_1426933 ?auto_1426934 ) ) ( TRUCK-AT ?auto_1426939 ?auto_1426935 ) )
    :subtasks
    ( ( !DRIVE ?auto_1426939 ?auto_1426935 ?auto_1426937 )
      ( MAKE-1CRATE ?auto_1426932 ?auto_1426933 )
      ( MAKE-1CRATE-VERIFY ?auto_1426932 ?auto_1426933 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1426949 - SURFACE
      ?auto_1426950 - SURFACE
      ?auto_1426951 - SURFACE
    )
    :vars
    (
      ?auto_1426952 - HOIST
      ?auto_1426953 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426952 ?auto_1426953 ) ( SURFACE-AT ?auto_1426950 ?auto_1426953 ) ( CLEAR ?auto_1426950 ) ( LIFTING ?auto_1426952 ?auto_1426951 ) ( IS-CRATE ?auto_1426951 ) ( not ( = ?auto_1426950 ?auto_1426951 ) ) ( ON ?auto_1426950 ?auto_1426949 ) ( not ( = ?auto_1426949 ?auto_1426950 ) ) ( not ( = ?auto_1426949 ?auto_1426951 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1426950 ?auto_1426951 )
      ( MAKE-2CRATE-VERIFY ?auto_1426949 ?auto_1426950 ?auto_1426951 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1426959 - SURFACE
      ?auto_1426960 - SURFACE
      ?auto_1426961 - SURFACE
    )
    :vars
    (
      ?auto_1426963 - HOIST
      ?auto_1426964 - PLACE
      ?auto_1426962 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426963 ?auto_1426964 ) ( SURFACE-AT ?auto_1426960 ?auto_1426964 ) ( CLEAR ?auto_1426960 ) ( IS-CRATE ?auto_1426961 ) ( not ( = ?auto_1426960 ?auto_1426961 ) ) ( TRUCK-AT ?auto_1426962 ?auto_1426964 ) ( AVAILABLE ?auto_1426963 ) ( IN ?auto_1426961 ?auto_1426962 ) ( ON ?auto_1426960 ?auto_1426959 ) ( not ( = ?auto_1426959 ?auto_1426960 ) ) ( not ( = ?auto_1426959 ?auto_1426961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1426960 ?auto_1426961 )
      ( MAKE-2CRATE-VERIFY ?auto_1426959 ?auto_1426960 ?auto_1426961 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426965 - SURFACE
      ?auto_1426966 - SURFACE
    )
    :vars
    (
      ?auto_1426970 - HOIST
      ?auto_1426967 - PLACE
      ?auto_1426968 - TRUCK
      ?auto_1426969 - SURFACE
      ?auto_1426971 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426970 ?auto_1426967 ) ( SURFACE-AT ?auto_1426965 ?auto_1426967 ) ( CLEAR ?auto_1426965 ) ( IS-CRATE ?auto_1426966 ) ( not ( = ?auto_1426965 ?auto_1426966 ) ) ( AVAILABLE ?auto_1426970 ) ( IN ?auto_1426966 ?auto_1426968 ) ( ON ?auto_1426965 ?auto_1426969 ) ( not ( = ?auto_1426969 ?auto_1426965 ) ) ( not ( = ?auto_1426969 ?auto_1426966 ) ) ( TRUCK-AT ?auto_1426968 ?auto_1426971 ) ( not ( = ?auto_1426971 ?auto_1426967 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1426968 ?auto_1426971 ?auto_1426967 )
      ( MAKE-2CRATE ?auto_1426969 ?auto_1426965 ?auto_1426966 )
      ( MAKE-1CRATE-VERIFY ?auto_1426965 ?auto_1426966 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1426972 - SURFACE
      ?auto_1426973 - SURFACE
      ?auto_1426974 - SURFACE
    )
    :vars
    (
      ?auto_1426976 - HOIST
      ?auto_1426978 - PLACE
      ?auto_1426975 - TRUCK
      ?auto_1426977 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426976 ?auto_1426978 ) ( SURFACE-AT ?auto_1426973 ?auto_1426978 ) ( CLEAR ?auto_1426973 ) ( IS-CRATE ?auto_1426974 ) ( not ( = ?auto_1426973 ?auto_1426974 ) ) ( AVAILABLE ?auto_1426976 ) ( IN ?auto_1426974 ?auto_1426975 ) ( ON ?auto_1426973 ?auto_1426972 ) ( not ( = ?auto_1426972 ?auto_1426973 ) ) ( not ( = ?auto_1426972 ?auto_1426974 ) ) ( TRUCK-AT ?auto_1426975 ?auto_1426977 ) ( not ( = ?auto_1426977 ?auto_1426978 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1426973 ?auto_1426974 )
      ( MAKE-2CRATE-VERIFY ?auto_1426972 ?auto_1426973 ?auto_1426974 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426979 - SURFACE
      ?auto_1426980 - SURFACE
    )
    :vars
    (
      ?auto_1426983 - HOIST
      ?auto_1426982 - PLACE
      ?auto_1426981 - SURFACE
      ?auto_1426984 - TRUCK
      ?auto_1426985 - PLACE
      ?auto_1426986 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426983 ?auto_1426982 ) ( SURFACE-AT ?auto_1426979 ?auto_1426982 ) ( CLEAR ?auto_1426979 ) ( IS-CRATE ?auto_1426980 ) ( not ( = ?auto_1426979 ?auto_1426980 ) ) ( AVAILABLE ?auto_1426983 ) ( ON ?auto_1426979 ?auto_1426981 ) ( not ( = ?auto_1426981 ?auto_1426979 ) ) ( not ( = ?auto_1426981 ?auto_1426980 ) ) ( TRUCK-AT ?auto_1426984 ?auto_1426985 ) ( not ( = ?auto_1426985 ?auto_1426982 ) ) ( HOIST-AT ?auto_1426986 ?auto_1426985 ) ( LIFTING ?auto_1426986 ?auto_1426980 ) ( not ( = ?auto_1426983 ?auto_1426986 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1426986 ?auto_1426980 ?auto_1426984 ?auto_1426985 )
      ( MAKE-2CRATE ?auto_1426981 ?auto_1426979 ?auto_1426980 )
      ( MAKE-1CRATE-VERIFY ?auto_1426979 ?auto_1426980 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1426987 - SURFACE
      ?auto_1426988 - SURFACE
      ?auto_1426989 - SURFACE
    )
    :vars
    (
      ?auto_1426993 - HOIST
      ?auto_1426992 - PLACE
      ?auto_1426990 - TRUCK
      ?auto_1426991 - PLACE
      ?auto_1426994 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1426993 ?auto_1426992 ) ( SURFACE-AT ?auto_1426988 ?auto_1426992 ) ( CLEAR ?auto_1426988 ) ( IS-CRATE ?auto_1426989 ) ( not ( = ?auto_1426988 ?auto_1426989 ) ) ( AVAILABLE ?auto_1426993 ) ( ON ?auto_1426988 ?auto_1426987 ) ( not ( = ?auto_1426987 ?auto_1426988 ) ) ( not ( = ?auto_1426987 ?auto_1426989 ) ) ( TRUCK-AT ?auto_1426990 ?auto_1426991 ) ( not ( = ?auto_1426991 ?auto_1426992 ) ) ( HOIST-AT ?auto_1426994 ?auto_1426991 ) ( LIFTING ?auto_1426994 ?auto_1426989 ) ( not ( = ?auto_1426993 ?auto_1426994 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1426988 ?auto_1426989 )
      ( MAKE-2CRATE-VERIFY ?auto_1426987 ?auto_1426988 ?auto_1426989 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1426995 - SURFACE
      ?auto_1426996 - SURFACE
    )
    :vars
    (
      ?auto_1427002 - HOIST
      ?auto_1427000 - PLACE
      ?auto_1426998 - SURFACE
      ?auto_1426999 - TRUCK
      ?auto_1426997 - PLACE
      ?auto_1427001 - HOIST
      ?auto_1427003 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427002 ?auto_1427000 ) ( SURFACE-AT ?auto_1426995 ?auto_1427000 ) ( CLEAR ?auto_1426995 ) ( IS-CRATE ?auto_1426996 ) ( not ( = ?auto_1426995 ?auto_1426996 ) ) ( AVAILABLE ?auto_1427002 ) ( ON ?auto_1426995 ?auto_1426998 ) ( not ( = ?auto_1426998 ?auto_1426995 ) ) ( not ( = ?auto_1426998 ?auto_1426996 ) ) ( TRUCK-AT ?auto_1426999 ?auto_1426997 ) ( not ( = ?auto_1426997 ?auto_1427000 ) ) ( HOIST-AT ?auto_1427001 ?auto_1426997 ) ( not ( = ?auto_1427002 ?auto_1427001 ) ) ( AVAILABLE ?auto_1427001 ) ( SURFACE-AT ?auto_1426996 ?auto_1426997 ) ( ON ?auto_1426996 ?auto_1427003 ) ( CLEAR ?auto_1426996 ) ( not ( = ?auto_1426995 ?auto_1427003 ) ) ( not ( = ?auto_1426996 ?auto_1427003 ) ) ( not ( = ?auto_1426998 ?auto_1427003 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1427001 ?auto_1426996 ?auto_1427003 ?auto_1426997 )
      ( MAKE-2CRATE ?auto_1426998 ?auto_1426995 ?auto_1426996 )
      ( MAKE-1CRATE-VERIFY ?auto_1426995 ?auto_1426996 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427004 - SURFACE
      ?auto_1427005 - SURFACE
      ?auto_1427006 - SURFACE
    )
    :vars
    (
      ?auto_1427009 - HOIST
      ?auto_1427008 - PLACE
      ?auto_1427012 - TRUCK
      ?auto_1427007 - PLACE
      ?auto_1427010 - HOIST
      ?auto_1427011 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427009 ?auto_1427008 ) ( SURFACE-AT ?auto_1427005 ?auto_1427008 ) ( CLEAR ?auto_1427005 ) ( IS-CRATE ?auto_1427006 ) ( not ( = ?auto_1427005 ?auto_1427006 ) ) ( AVAILABLE ?auto_1427009 ) ( ON ?auto_1427005 ?auto_1427004 ) ( not ( = ?auto_1427004 ?auto_1427005 ) ) ( not ( = ?auto_1427004 ?auto_1427006 ) ) ( TRUCK-AT ?auto_1427012 ?auto_1427007 ) ( not ( = ?auto_1427007 ?auto_1427008 ) ) ( HOIST-AT ?auto_1427010 ?auto_1427007 ) ( not ( = ?auto_1427009 ?auto_1427010 ) ) ( AVAILABLE ?auto_1427010 ) ( SURFACE-AT ?auto_1427006 ?auto_1427007 ) ( ON ?auto_1427006 ?auto_1427011 ) ( CLEAR ?auto_1427006 ) ( not ( = ?auto_1427005 ?auto_1427011 ) ) ( not ( = ?auto_1427006 ?auto_1427011 ) ) ( not ( = ?auto_1427004 ?auto_1427011 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427005 ?auto_1427006 )
      ( MAKE-2CRATE-VERIFY ?auto_1427004 ?auto_1427005 ?auto_1427006 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427013 - SURFACE
      ?auto_1427014 - SURFACE
    )
    :vars
    (
      ?auto_1427017 - HOIST
      ?auto_1427019 - PLACE
      ?auto_1427015 - SURFACE
      ?auto_1427016 - PLACE
      ?auto_1427021 - HOIST
      ?auto_1427018 - SURFACE
      ?auto_1427020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427017 ?auto_1427019 ) ( SURFACE-AT ?auto_1427013 ?auto_1427019 ) ( CLEAR ?auto_1427013 ) ( IS-CRATE ?auto_1427014 ) ( not ( = ?auto_1427013 ?auto_1427014 ) ) ( AVAILABLE ?auto_1427017 ) ( ON ?auto_1427013 ?auto_1427015 ) ( not ( = ?auto_1427015 ?auto_1427013 ) ) ( not ( = ?auto_1427015 ?auto_1427014 ) ) ( not ( = ?auto_1427016 ?auto_1427019 ) ) ( HOIST-AT ?auto_1427021 ?auto_1427016 ) ( not ( = ?auto_1427017 ?auto_1427021 ) ) ( AVAILABLE ?auto_1427021 ) ( SURFACE-AT ?auto_1427014 ?auto_1427016 ) ( ON ?auto_1427014 ?auto_1427018 ) ( CLEAR ?auto_1427014 ) ( not ( = ?auto_1427013 ?auto_1427018 ) ) ( not ( = ?auto_1427014 ?auto_1427018 ) ) ( not ( = ?auto_1427015 ?auto_1427018 ) ) ( TRUCK-AT ?auto_1427020 ?auto_1427019 ) )
    :subtasks
    ( ( !DRIVE ?auto_1427020 ?auto_1427019 ?auto_1427016 )
      ( MAKE-2CRATE ?auto_1427015 ?auto_1427013 ?auto_1427014 )
      ( MAKE-1CRATE-VERIFY ?auto_1427013 ?auto_1427014 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427022 - SURFACE
      ?auto_1427023 - SURFACE
      ?auto_1427024 - SURFACE
    )
    :vars
    (
      ?auto_1427025 - HOIST
      ?auto_1427026 - PLACE
      ?auto_1427029 - PLACE
      ?auto_1427030 - HOIST
      ?auto_1427028 - SURFACE
      ?auto_1427027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427025 ?auto_1427026 ) ( SURFACE-AT ?auto_1427023 ?auto_1427026 ) ( CLEAR ?auto_1427023 ) ( IS-CRATE ?auto_1427024 ) ( not ( = ?auto_1427023 ?auto_1427024 ) ) ( AVAILABLE ?auto_1427025 ) ( ON ?auto_1427023 ?auto_1427022 ) ( not ( = ?auto_1427022 ?auto_1427023 ) ) ( not ( = ?auto_1427022 ?auto_1427024 ) ) ( not ( = ?auto_1427029 ?auto_1427026 ) ) ( HOIST-AT ?auto_1427030 ?auto_1427029 ) ( not ( = ?auto_1427025 ?auto_1427030 ) ) ( AVAILABLE ?auto_1427030 ) ( SURFACE-AT ?auto_1427024 ?auto_1427029 ) ( ON ?auto_1427024 ?auto_1427028 ) ( CLEAR ?auto_1427024 ) ( not ( = ?auto_1427023 ?auto_1427028 ) ) ( not ( = ?auto_1427024 ?auto_1427028 ) ) ( not ( = ?auto_1427022 ?auto_1427028 ) ) ( TRUCK-AT ?auto_1427027 ?auto_1427026 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427023 ?auto_1427024 )
      ( MAKE-2CRATE-VERIFY ?auto_1427022 ?auto_1427023 ?auto_1427024 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427031 - SURFACE
      ?auto_1427032 - SURFACE
    )
    :vars
    (
      ?auto_1427039 - HOIST
      ?auto_1427036 - PLACE
      ?auto_1427033 - SURFACE
      ?auto_1427037 - PLACE
      ?auto_1427035 - HOIST
      ?auto_1427034 - SURFACE
      ?auto_1427038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427039 ?auto_1427036 ) ( IS-CRATE ?auto_1427032 ) ( not ( = ?auto_1427031 ?auto_1427032 ) ) ( not ( = ?auto_1427033 ?auto_1427031 ) ) ( not ( = ?auto_1427033 ?auto_1427032 ) ) ( not ( = ?auto_1427037 ?auto_1427036 ) ) ( HOIST-AT ?auto_1427035 ?auto_1427037 ) ( not ( = ?auto_1427039 ?auto_1427035 ) ) ( AVAILABLE ?auto_1427035 ) ( SURFACE-AT ?auto_1427032 ?auto_1427037 ) ( ON ?auto_1427032 ?auto_1427034 ) ( CLEAR ?auto_1427032 ) ( not ( = ?auto_1427031 ?auto_1427034 ) ) ( not ( = ?auto_1427032 ?auto_1427034 ) ) ( not ( = ?auto_1427033 ?auto_1427034 ) ) ( TRUCK-AT ?auto_1427038 ?auto_1427036 ) ( SURFACE-AT ?auto_1427033 ?auto_1427036 ) ( CLEAR ?auto_1427033 ) ( LIFTING ?auto_1427039 ?auto_1427031 ) ( IS-CRATE ?auto_1427031 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427033 ?auto_1427031 )
      ( MAKE-2CRATE ?auto_1427033 ?auto_1427031 ?auto_1427032 )
      ( MAKE-1CRATE-VERIFY ?auto_1427031 ?auto_1427032 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427040 - SURFACE
      ?auto_1427041 - SURFACE
      ?auto_1427042 - SURFACE
    )
    :vars
    (
      ?auto_1427044 - HOIST
      ?auto_1427047 - PLACE
      ?auto_1427046 - PLACE
      ?auto_1427045 - HOIST
      ?auto_1427048 - SURFACE
      ?auto_1427043 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427044 ?auto_1427047 ) ( IS-CRATE ?auto_1427042 ) ( not ( = ?auto_1427041 ?auto_1427042 ) ) ( not ( = ?auto_1427040 ?auto_1427041 ) ) ( not ( = ?auto_1427040 ?auto_1427042 ) ) ( not ( = ?auto_1427046 ?auto_1427047 ) ) ( HOIST-AT ?auto_1427045 ?auto_1427046 ) ( not ( = ?auto_1427044 ?auto_1427045 ) ) ( AVAILABLE ?auto_1427045 ) ( SURFACE-AT ?auto_1427042 ?auto_1427046 ) ( ON ?auto_1427042 ?auto_1427048 ) ( CLEAR ?auto_1427042 ) ( not ( = ?auto_1427041 ?auto_1427048 ) ) ( not ( = ?auto_1427042 ?auto_1427048 ) ) ( not ( = ?auto_1427040 ?auto_1427048 ) ) ( TRUCK-AT ?auto_1427043 ?auto_1427047 ) ( SURFACE-AT ?auto_1427040 ?auto_1427047 ) ( CLEAR ?auto_1427040 ) ( LIFTING ?auto_1427044 ?auto_1427041 ) ( IS-CRATE ?auto_1427041 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427041 ?auto_1427042 )
      ( MAKE-2CRATE-VERIFY ?auto_1427040 ?auto_1427041 ?auto_1427042 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427049 - SURFACE
      ?auto_1427050 - SURFACE
    )
    :vars
    (
      ?auto_1427051 - HOIST
      ?auto_1427055 - PLACE
      ?auto_1427052 - SURFACE
      ?auto_1427056 - PLACE
      ?auto_1427057 - HOIST
      ?auto_1427053 - SURFACE
      ?auto_1427054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427051 ?auto_1427055 ) ( IS-CRATE ?auto_1427050 ) ( not ( = ?auto_1427049 ?auto_1427050 ) ) ( not ( = ?auto_1427052 ?auto_1427049 ) ) ( not ( = ?auto_1427052 ?auto_1427050 ) ) ( not ( = ?auto_1427056 ?auto_1427055 ) ) ( HOIST-AT ?auto_1427057 ?auto_1427056 ) ( not ( = ?auto_1427051 ?auto_1427057 ) ) ( AVAILABLE ?auto_1427057 ) ( SURFACE-AT ?auto_1427050 ?auto_1427056 ) ( ON ?auto_1427050 ?auto_1427053 ) ( CLEAR ?auto_1427050 ) ( not ( = ?auto_1427049 ?auto_1427053 ) ) ( not ( = ?auto_1427050 ?auto_1427053 ) ) ( not ( = ?auto_1427052 ?auto_1427053 ) ) ( TRUCK-AT ?auto_1427054 ?auto_1427055 ) ( SURFACE-AT ?auto_1427052 ?auto_1427055 ) ( CLEAR ?auto_1427052 ) ( IS-CRATE ?auto_1427049 ) ( AVAILABLE ?auto_1427051 ) ( IN ?auto_1427049 ?auto_1427054 ) )
    :subtasks
    ( ( !UNLOAD ?auto_1427051 ?auto_1427049 ?auto_1427054 ?auto_1427055 )
      ( MAKE-2CRATE ?auto_1427052 ?auto_1427049 ?auto_1427050 )
      ( MAKE-1CRATE-VERIFY ?auto_1427049 ?auto_1427050 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427058 - SURFACE
      ?auto_1427059 - SURFACE
      ?auto_1427060 - SURFACE
    )
    :vars
    (
      ?auto_1427066 - HOIST
      ?auto_1427064 - PLACE
      ?auto_1427062 - PLACE
      ?auto_1427065 - HOIST
      ?auto_1427063 - SURFACE
      ?auto_1427061 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427066 ?auto_1427064 ) ( IS-CRATE ?auto_1427060 ) ( not ( = ?auto_1427059 ?auto_1427060 ) ) ( not ( = ?auto_1427058 ?auto_1427059 ) ) ( not ( = ?auto_1427058 ?auto_1427060 ) ) ( not ( = ?auto_1427062 ?auto_1427064 ) ) ( HOIST-AT ?auto_1427065 ?auto_1427062 ) ( not ( = ?auto_1427066 ?auto_1427065 ) ) ( AVAILABLE ?auto_1427065 ) ( SURFACE-AT ?auto_1427060 ?auto_1427062 ) ( ON ?auto_1427060 ?auto_1427063 ) ( CLEAR ?auto_1427060 ) ( not ( = ?auto_1427059 ?auto_1427063 ) ) ( not ( = ?auto_1427060 ?auto_1427063 ) ) ( not ( = ?auto_1427058 ?auto_1427063 ) ) ( TRUCK-AT ?auto_1427061 ?auto_1427064 ) ( SURFACE-AT ?auto_1427058 ?auto_1427064 ) ( CLEAR ?auto_1427058 ) ( IS-CRATE ?auto_1427059 ) ( AVAILABLE ?auto_1427066 ) ( IN ?auto_1427059 ?auto_1427061 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427059 ?auto_1427060 )
      ( MAKE-2CRATE-VERIFY ?auto_1427058 ?auto_1427059 ?auto_1427060 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427103 - SURFACE
      ?auto_1427104 - SURFACE
    )
    :vars
    (
      ?auto_1427109 - HOIST
      ?auto_1427108 - PLACE
      ?auto_1427106 - SURFACE
      ?auto_1427110 - PLACE
      ?auto_1427105 - HOIST
      ?auto_1427111 - SURFACE
      ?auto_1427107 - TRUCK
      ?auto_1427112 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427109 ?auto_1427108 ) ( SURFACE-AT ?auto_1427103 ?auto_1427108 ) ( CLEAR ?auto_1427103 ) ( IS-CRATE ?auto_1427104 ) ( not ( = ?auto_1427103 ?auto_1427104 ) ) ( AVAILABLE ?auto_1427109 ) ( ON ?auto_1427103 ?auto_1427106 ) ( not ( = ?auto_1427106 ?auto_1427103 ) ) ( not ( = ?auto_1427106 ?auto_1427104 ) ) ( not ( = ?auto_1427110 ?auto_1427108 ) ) ( HOIST-AT ?auto_1427105 ?auto_1427110 ) ( not ( = ?auto_1427109 ?auto_1427105 ) ) ( AVAILABLE ?auto_1427105 ) ( SURFACE-AT ?auto_1427104 ?auto_1427110 ) ( ON ?auto_1427104 ?auto_1427111 ) ( CLEAR ?auto_1427104 ) ( not ( = ?auto_1427103 ?auto_1427111 ) ) ( not ( = ?auto_1427104 ?auto_1427111 ) ) ( not ( = ?auto_1427106 ?auto_1427111 ) ) ( TRUCK-AT ?auto_1427107 ?auto_1427112 ) ( not ( = ?auto_1427112 ?auto_1427108 ) ) ( not ( = ?auto_1427110 ?auto_1427112 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1427107 ?auto_1427112 ?auto_1427108 )
      ( MAKE-1CRATE ?auto_1427103 ?auto_1427104 )
      ( MAKE-1CRATE-VERIFY ?auto_1427103 ?auto_1427104 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427142 - SURFACE
      ?auto_1427143 - SURFACE
      ?auto_1427144 - SURFACE
      ?auto_1427145 - SURFACE
    )
    :vars
    (
      ?auto_1427147 - HOIST
      ?auto_1427146 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427147 ?auto_1427146 ) ( SURFACE-AT ?auto_1427144 ?auto_1427146 ) ( CLEAR ?auto_1427144 ) ( LIFTING ?auto_1427147 ?auto_1427145 ) ( IS-CRATE ?auto_1427145 ) ( not ( = ?auto_1427144 ?auto_1427145 ) ) ( ON ?auto_1427143 ?auto_1427142 ) ( ON ?auto_1427144 ?auto_1427143 ) ( not ( = ?auto_1427142 ?auto_1427143 ) ) ( not ( = ?auto_1427142 ?auto_1427144 ) ) ( not ( = ?auto_1427142 ?auto_1427145 ) ) ( not ( = ?auto_1427143 ?auto_1427144 ) ) ( not ( = ?auto_1427143 ?auto_1427145 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427144 ?auto_1427145 )
      ( MAKE-3CRATE-VERIFY ?auto_1427142 ?auto_1427143 ?auto_1427144 ?auto_1427145 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427159 - SURFACE
      ?auto_1427160 - SURFACE
      ?auto_1427161 - SURFACE
      ?auto_1427162 - SURFACE
    )
    :vars
    (
      ?auto_1427163 - HOIST
      ?auto_1427164 - PLACE
      ?auto_1427165 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427163 ?auto_1427164 ) ( SURFACE-AT ?auto_1427161 ?auto_1427164 ) ( CLEAR ?auto_1427161 ) ( IS-CRATE ?auto_1427162 ) ( not ( = ?auto_1427161 ?auto_1427162 ) ) ( TRUCK-AT ?auto_1427165 ?auto_1427164 ) ( AVAILABLE ?auto_1427163 ) ( IN ?auto_1427162 ?auto_1427165 ) ( ON ?auto_1427161 ?auto_1427160 ) ( not ( = ?auto_1427160 ?auto_1427161 ) ) ( not ( = ?auto_1427160 ?auto_1427162 ) ) ( ON ?auto_1427160 ?auto_1427159 ) ( not ( = ?auto_1427159 ?auto_1427160 ) ) ( not ( = ?auto_1427159 ?auto_1427161 ) ) ( not ( = ?auto_1427159 ?auto_1427162 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427160 ?auto_1427161 ?auto_1427162 )
      ( MAKE-3CRATE-VERIFY ?auto_1427159 ?auto_1427160 ?auto_1427161 ?auto_1427162 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427180 - SURFACE
      ?auto_1427181 - SURFACE
      ?auto_1427182 - SURFACE
      ?auto_1427183 - SURFACE
    )
    :vars
    (
      ?auto_1427184 - HOIST
      ?auto_1427186 - PLACE
      ?auto_1427187 - TRUCK
      ?auto_1427185 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427184 ?auto_1427186 ) ( SURFACE-AT ?auto_1427182 ?auto_1427186 ) ( CLEAR ?auto_1427182 ) ( IS-CRATE ?auto_1427183 ) ( not ( = ?auto_1427182 ?auto_1427183 ) ) ( AVAILABLE ?auto_1427184 ) ( IN ?auto_1427183 ?auto_1427187 ) ( ON ?auto_1427182 ?auto_1427181 ) ( not ( = ?auto_1427181 ?auto_1427182 ) ) ( not ( = ?auto_1427181 ?auto_1427183 ) ) ( TRUCK-AT ?auto_1427187 ?auto_1427185 ) ( not ( = ?auto_1427185 ?auto_1427186 ) ) ( ON ?auto_1427181 ?auto_1427180 ) ( not ( = ?auto_1427180 ?auto_1427181 ) ) ( not ( = ?auto_1427180 ?auto_1427182 ) ) ( not ( = ?auto_1427180 ?auto_1427183 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427181 ?auto_1427182 ?auto_1427183 )
      ( MAKE-3CRATE-VERIFY ?auto_1427180 ?auto_1427181 ?auto_1427182 ?auto_1427183 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427204 - SURFACE
      ?auto_1427205 - SURFACE
      ?auto_1427206 - SURFACE
      ?auto_1427207 - SURFACE
    )
    :vars
    (
      ?auto_1427208 - HOIST
      ?auto_1427211 - PLACE
      ?auto_1427210 - TRUCK
      ?auto_1427212 - PLACE
      ?auto_1427209 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427208 ?auto_1427211 ) ( SURFACE-AT ?auto_1427206 ?auto_1427211 ) ( CLEAR ?auto_1427206 ) ( IS-CRATE ?auto_1427207 ) ( not ( = ?auto_1427206 ?auto_1427207 ) ) ( AVAILABLE ?auto_1427208 ) ( ON ?auto_1427206 ?auto_1427205 ) ( not ( = ?auto_1427205 ?auto_1427206 ) ) ( not ( = ?auto_1427205 ?auto_1427207 ) ) ( TRUCK-AT ?auto_1427210 ?auto_1427212 ) ( not ( = ?auto_1427212 ?auto_1427211 ) ) ( HOIST-AT ?auto_1427209 ?auto_1427212 ) ( LIFTING ?auto_1427209 ?auto_1427207 ) ( not ( = ?auto_1427208 ?auto_1427209 ) ) ( ON ?auto_1427205 ?auto_1427204 ) ( not ( = ?auto_1427204 ?auto_1427205 ) ) ( not ( = ?auto_1427204 ?auto_1427206 ) ) ( not ( = ?auto_1427204 ?auto_1427207 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427205 ?auto_1427206 ?auto_1427207 )
      ( MAKE-3CRATE-VERIFY ?auto_1427204 ?auto_1427205 ?auto_1427206 ?auto_1427207 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427231 - SURFACE
      ?auto_1427232 - SURFACE
      ?auto_1427233 - SURFACE
      ?auto_1427234 - SURFACE
    )
    :vars
    (
      ?auto_1427237 - HOIST
      ?auto_1427239 - PLACE
      ?auto_1427236 - TRUCK
      ?auto_1427238 - PLACE
      ?auto_1427235 - HOIST
      ?auto_1427240 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427237 ?auto_1427239 ) ( SURFACE-AT ?auto_1427233 ?auto_1427239 ) ( CLEAR ?auto_1427233 ) ( IS-CRATE ?auto_1427234 ) ( not ( = ?auto_1427233 ?auto_1427234 ) ) ( AVAILABLE ?auto_1427237 ) ( ON ?auto_1427233 ?auto_1427232 ) ( not ( = ?auto_1427232 ?auto_1427233 ) ) ( not ( = ?auto_1427232 ?auto_1427234 ) ) ( TRUCK-AT ?auto_1427236 ?auto_1427238 ) ( not ( = ?auto_1427238 ?auto_1427239 ) ) ( HOIST-AT ?auto_1427235 ?auto_1427238 ) ( not ( = ?auto_1427237 ?auto_1427235 ) ) ( AVAILABLE ?auto_1427235 ) ( SURFACE-AT ?auto_1427234 ?auto_1427238 ) ( ON ?auto_1427234 ?auto_1427240 ) ( CLEAR ?auto_1427234 ) ( not ( = ?auto_1427233 ?auto_1427240 ) ) ( not ( = ?auto_1427234 ?auto_1427240 ) ) ( not ( = ?auto_1427232 ?auto_1427240 ) ) ( ON ?auto_1427232 ?auto_1427231 ) ( not ( = ?auto_1427231 ?auto_1427232 ) ) ( not ( = ?auto_1427231 ?auto_1427233 ) ) ( not ( = ?auto_1427231 ?auto_1427234 ) ) ( not ( = ?auto_1427231 ?auto_1427240 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427232 ?auto_1427233 ?auto_1427234 )
      ( MAKE-3CRATE-VERIFY ?auto_1427231 ?auto_1427232 ?auto_1427233 ?auto_1427234 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427259 - SURFACE
      ?auto_1427260 - SURFACE
      ?auto_1427261 - SURFACE
      ?auto_1427262 - SURFACE
    )
    :vars
    (
      ?auto_1427265 - HOIST
      ?auto_1427264 - PLACE
      ?auto_1427267 - PLACE
      ?auto_1427263 - HOIST
      ?auto_1427266 - SURFACE
      ?auto_1427268 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427265 ?auto_1427264 ) ( SURFACE-AT ?auto_1427261 ?auto_1427264 ) ( CLEAR ?auto_1427261 ) ( IS-CRATE ?auto_1427262 ) ( not ( = ?auto_1427261 ?auto_1427262 ) ) ( AVAILABLE ?auto_1427265 ) ( ON ?auto_1427261 ?auto_1427260 ) ( not ( = ?auto_1427260 ?auto_1427261 ) ) ( not ( = ?auto_1427260 ?auto_1427262 ) ) ( not ( = ?auto_1427267 ?auto_1427264 ) ) ( HOIST-AT ?auto_1427263 ?auto_1427267 ) ( not ( = ?auto_1427265 ?auto_1427263 ) ) ( AVAILABLE ?auto_1427263 ) ( SURFACE-AT ?auto_1427262 ?auto_1427267 ) ( ON ?auto_1427262 ?auto_1427266 ) ( CLEAR ?auto_1427262 ) ( not ( = ?auto_1427261 ?auto_1427266 ) ) ( not ( = ?auto_1427262 ?auto_1427266 ) ) ( not ( = ?auto_1427260 ?auto_1427266 ) ) ( TRUCK-AT ?auto_1427268 ?auto_1427264 ) ( ON ?auto_1427260 ?auto_1427259 ) ( not ( = ?auto_1427259 ?auto_1427260 ) ) ( not ( = ?auto_1427259 ?auto_1427261 ) ) ( not ( = ?auto_1427259 ?auto_1427262 ) ) ( not ( = ?auto_1427259 ?auto_1427266 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427260 ?auto_1427261 ?auto_1427262 )
      ( MAKE-3CRATE-VERIFY ?auto_1427259 ?auto_1427260 ?auto_1427261 ?auto_1427262 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427287 - SURFACE
      ?auto_1427288 - SURFACE
      ?auto_1427289 - SURFACE
      ?auto_1427290 - SURFACE
    )
    :vars
    (
      ?auto_1427292 - HOIST
      ?auto_1427295 - PLACE
      ?auto_1427293 - PLACE
      ?auto_1427296 - HOIST
      ?auto_1427294 - SURFACE
      ?auto_1427291 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427292 ?auto_1427295 ) ( IS-CRATE ?auto_1427290 ) ( not ( = ?auto_1427289 ?auto_1427290 ) ) ( not ( = ?auto_1427288 ?auto_1427289 ) ) ( not ( = ?auto_1427288 ?auto_1427290 ) ) ( not ( = ?auto_1427293 ?auto_1427295 ) ) ( HOIST-AT ?auto_1427296 ?auto_1427293 ) ( not ( = ?auto_1427292 ?auto_1427296 ) ) ( AVAILABLE ?auto_1427296 ) ( SURFACE-AT ?auto_1427290 ?auto_1427293 ) ( ON ?auto_1427290 ?auto_1427294 ) ( CLEAR ?auto_1427290 ) ( not ( = ?auto_1427289 ?auto_1427294 ) ) ( not ( = ?auto_1427290 ?auto_1427294 ) ) ( not ( = ?auto_1427288 ?auto_1427294 ) ) ( TRUCK-AT ?auto_1427291 ?auto_1427295 ) ( SURFACE-AT ?auto_1427288 ?auto_1427295 ) ( CLEAR ?auto_1427288 ) ( LIFTING ?auto_1427292 ?auto_1427289 ) ( IS-CRATE ?auto_1427289 ) ( ON ?auto_1427288 ?auto_1427287 ) ( not ( = ?auto_1427287 ?auto_1427288 ) ) ( not ( = ?auto_1427287 ?auto_1427289 ) ) ( not ( = ?auto_1427287 ?auto_1427290 ) ) ( not ( = ?auto_1427287 ?auto_1427294 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427288 ?auto_1427289 ?auto_1427290 )
      ( MAKE-3CRATE-VERIFY ?auto_1427287 ?auto_1427288 ?auto_1427289 ?auto_1427290 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427315 - SURFACE
      ?auto_1427316 - SURFACE
      ?auto_1427317 - SURFACE
      ?auto_1427318 - SURFACE
    )
    :vars
    (
      ?auto_1427322 - HOIST
      ?auto_1427319 - PLACE
      ?auto_1427320 - PLACE
      ?auto_1427324 - HOIST
      ?auto_1427323 - SURFACE
      ?auto_1427321 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427322 ?auto_1427319 ) ( IS-CRATE ?auto_1427318 ) ( not ( = ?auto_1427317 ?auto_1427318 ) ) ( not ( = ?auto_1427316 ?auto_1427317 ) ) ( not ( = ?auto_1427316 ?auto_1427318 ) ) ( not ( = ?auto_1427320 ?auto_1427319 ) ) ( HOIST-AT ?auto_1427324 ?auto_1427320 ) ( not ( = ?auto_1427322 ?auto_1427324 ) ) ( AVAILABLE ?auto_1427324 ) ( SURFACE-AT ?auto_1427318 ?auto_1427320 ) ( ON ?auto_1427318 ?auto_1427323 ) ( CLEAR ?auto_1427318 ) ( not ( = ?auto_1427317 ?auto_1427323 ) ) ( not ( = ?auto_1427318 ?auto_1427323 ) ) ( not ( = ?auto_1427316 ?auto_1427323 ) ) ( TRUCK-AT ?auto_1427321 ?auto_1427319 ) ( SURFACE-AT ?auto_1427316 ?auto_1427319 ) ( CLEAR ?auto_1427316 ) ( IS-CRATE ?auto_1427317 ) ( AVAILABLE ?auto_1427322 ) ( IN ?auto_1427317 ?auto_1427321 ) ( ON ?auto_1427316 ?auto_1427315 ) ( not ( = ?auto_1427315 ?auto_1427316 ) ) ( not ( = ?auto_1427315 ?auto_1427317 ) ) ( not ( = ?auto_1427315 ?auto_1427318 ) ) ( not ( = ?auto_1427315 ?auto_1427323 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427316 ?auto_1427317 ?auto_1427318 )
      ( MAKE-3CRATE-VERIFY ?auto_1427315 ?auto_1427316 ?auto_1427317 ?auto_1427318 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427606 - SURFACE
      ?auto_1427607 - SURFACE
      ?auto_1427608 - SURFACE
      ?auto_1427610 - SURFACE
      ?auto_1427609 - SURFACE
    )
    :vars
    (
      ?auto_1427612 - HOIST
      ?auto_1427611 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427612 ?auto_1427611 ) ( SURFACE-AT ?auto_1427610 ?auto_1427611 ) ( CLEAR ?auto_1427610 ) ( LIFTING ?auto_1427612 ?auto_1427609 ) ( IS-CRATE ?auto_1427609 ) ( not ( = ?auto_1427610 ?auto_1427609 ) ) ( ON ?auto_1427607 ?auto_1427606 ) ( ON ?auto_1427608 ?auto_1427607 ) ( ON ?auto_1427610 ?auto_1427608 ) ( not ( = ?auto_1427606 ?auto_1427607 ) ) ( not ( = ?auto_1427606 ?auto_1427608 ) ) ( not ( = ?auto_1427606 ?auto_1427610 ) ) ( not ( = ?auto_1427606 ?auto_1427609 ) ) ( not ( = ?auto_1427607 ?auto_1427608 ) ) ( not ( = ?auto_1427607 ?auto_1427610 ) ) ( not ( = ?auto_1427607 ?auto_1427609 ) ) ( not ( = ?auto_1427608 ?auto_1427610 ) ) ( not ( = ?auto_1427608 ?auto_1427609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427610 ?auto_1427609 )
      ( MAKE-4CRATE-VERIFY ?auto_1427606 ?auto_1427607 ?auto_1427608 ?auto_1427610 ?auto_1427609 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427631 - SURFACE
      ?auto_1427632 - SURFACE
      ?auto_1427633 - SURFACE
      ?auto_1427635 - SURFACE
      ?auto_1427634 - SURFACE
    )
    :vars
    (
      ?auto_1427638 - HOIST
      ?auto_1427636 - PLACE
      ?auto_1427637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427638 ?auto_1427636 ) ( SURFACE-AT ?auto_1427635 ?auto_1427636 ) ( CLEAR ?auto_1427635 ) ( IS-CRATE ?auto_1427634 ) ( not ( = ?auto_1427635 ?auto_1427634 ) ) ( TRUCK-AT ?auto_1427637 ?auto_1427636 ) ( AVAILABLE ?auto_1427638 ) ( IN ?auto_1427634 ?auto_1427637 ) ( ON ?auto_1427635 ?auto_1427633 ) ( not ( = ?auto_1427633 ?auto_1427635 ) ) ( not ( = ?auto_1427633 ?auto_1427634 ) ) ( ON ?auto_1427632 ?auto_1427631 ) ( ON ?auto_1427633 ?auto_1427632 ) ( not ( = ?auto_1427631 ?auto_1427632 ) ) ( not ( = ?auto_1427631 ?auto_1427633 ) ) ( not ( = ?auto_1427631 ?auto_1427635 ) ) ( not ( = ?auto_1427631 ?auto_1427634 ) ) ( not ( = ?auto_1427632 ?auto_1427633 ) ) ( not ( = ?auto_1427632 ?auto_1427635 ) ) ( not ( = ?auto_1427632 ?auto_1427634 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427633 ?auto_1427635 ?auto_1427634 )
      ( MAKE-4CRATE-VERIFY ?auto_1427631 ?auto_1427632 ?auto_1427633 ?auto_1427635 ?auto_1427634 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427661 - SURFACE
      ?auto_1427662 - SURFACE
      ?auto_1427663 - SURFACE
      ?auto_1427665 - SURFACE
      ?auto_1427664 - SURFACE
    )
    :vars
    (
      ?auto_1427669 - HOIST
      ?auto_1427666 - PLACE
      ?auto_1427667 - TRUCK
      ?auto_1427668 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427669 ?auto_1427666 ) ( SURFACE-AT ?auto_1427665 ?auto_1427666 ) ( CLEAR ?auto_1427665 ) ( IS-CRATE ?auto_1427664 ) ( not ( = ?auto_1427665 ?auto_1427664 ) ) ( AVAILABLE ?auto_1427669 ) ( IN ?auto_1427664 ?auto_1427667 ) ( ON ?auto_1427665 ?auto_1427663 ) ( not ( = ?auto_1427663 ?auto_1427665 ) ) ( not ( = ?auto_1427663 ?auto_1427664 ) ) ( TRUCK-AT ?auto_1427667 ?auto_1427668 ) ( not ( = ?auto_1427668 ?auto_1427666 ) ) ( ON ?auto_1427662 ?auto_1427661 ) ( ON ?auto_1427663 ?auto_1427662 ) ( not ( = ?auto_1427661 ?auto_1427662 ) ) ( not ( = ?auto_1427661 ?auto_1427663 ) ) ( not ( = ?auto_1427661 ?auto_1427665 ) ) ( not ( = ?auto_1427661 ?auto_1427664 ) ) ( not ( = ?auto_1427662 ?auto_1427663 ) ) ( not ( = ?auto_1427662 ?auto_1427665 ) ) ( not ( = ?auto_1427662 ?auto_1427664 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427663 ?auto_1427665 ?auto_1427664 )
      ( MAKE-4CRATE-VERIFY ?auto_1427661 ?auto_1427662 ?auto_1427663 ?auto_1427665 ?auto_1427664 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427695 - SURFACE
      ?auto_1427696 - SURFACE
      ?auto_1427697 - SURFACE
      ?auto_1427699 - SURFACE
      ?auto_1427698 - SURFACE
    )
    :vars
    (
      ?auto_1427700 - HOIST
      ?auto_1427702 - PLACE
      ?auto_1427703 - TRUCK
      ?auto_1427704 - PLACE
      ?auto_1427701 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427700 ?auto_1427702 ) ( SURFACE-AT ?auto_1427699 ?auto_1427702 ) ( CLEAR ?auto_1427699 ) ( IS-CRATE ?auto_1427698 ) ( not ( = ?auto_1427699 ?auto_1427698 ) ) ( AVAILABLE ?auto_1427700 ) ( ON ?auto_1427699 ?auto_1427697 ) ( not ( = ?auto_1427697 ?auto_1427699 ) ) ( not ( = ?auto_1427697 ?auto_1427698 ) ) ( TRUCK-AT ?auto_1427703 ?auto_1427704 ) ( not ( = ?auto_1427704 ?auto_1427702 ) ) ( HOIST-AT ?auto_1427701 ?auto_1427704 ) ( LIFTING ?auto_1427701 ?auto_1427698 ) ( not ( = ?auto_1427700 ?auto_1427701 ) ) ( ON ?auto_1427696 ?auto_1427695 ) ( ON ?auto_1427697 ?auto_1427696 ) ( not ( = ?auto_1427695 ?auto_1427696 ) ) ( not ( = ?auto_1427695 ?auto_1427697 ) ) ( not ( = ?auto_1427695 ?auto_1427699 ) ) ( not ( = ?auto_1427695 ?auto_1427698 ) ) ( not ( = ?auto_1427696 ?auto_1427697 ) ) ( not ( = ?auto_1427696 ?auto_1427699 ) ) ( not ( = ?auto_1427696 ?auto_1427698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427697 ?auto_1427699 ?auto_1427698 )
      ( MAKE-4CRATE-VERIFY ?auto_1427695 ?auto_1427696 ?auto_1427697 ?auto_1427699 ?auto_1427698 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427733 - SURFACE
      ?auto_1427734 - SURFACE
      ?auto_1427735 - SURFACE
      ?auto_1427737 - SURFACE
      ?auto_1427736 - SURFACE
    )
    :vars
    (
      ?auto_1427742 - HOIST
      ?auto_1427741 - PLACE
      ?auto_1427739 - TRUCK
      ?auto_1427738 - PLACE
      ?auto_1427740 - HOIST
      ?auto_1427743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427742 ?auto_1427741 ) ( SURFACE-AT ?auto_1427737 ?auto_1427741 ) ( CLEAR ?auto_1427737 ) ( IS-CRATE ?auto_1427736 ) ( not ( = ?auto_1427737 ?auto_1427736 ) ) ( AVAILABLE ?auto_1427742 ) ( ON ?auto_1427737 ?auto_1427735 ) ( not ( = ?auto_1427735 ?auto_1427737 ) ) ( not ( = ?auto_1427735 ?auto_1427736 ) ) ( TRUCK-AT ?auto_1427739 ?auto_1427738 ) ( not ( = ?auto_1427738 ?auto_1427741 ) ) ( HOIST-AT ?auto_1427740 ?auto_1427738 ) ( not ( = ?auto_1427742 ?auto_1427740 ) ) ( AVAILABLE ?auto_1427740 ) ( SURFACE-AT ?auto_1427736 ?auto_1427738 ) ( ON ?auto_1427736 ?auto_1427743 ) ( CLEAR ?auto_1427736 ) ( not ( = ?auto_1427737 ?auto_1427743 ) ) ( not ( = ?auto_1427736 ?auto_1427743 ) ) ( not ( = ?auto_1427735 ?auto_1427743 ) ) ( ON ?auto_1427734 ?auto_1427733 ) ( ON ?auto_1427735 ?auto_1427734 ) ( not ( = ?auto_1427733 ?auto_1427734 ) ) ( not ( = ?auto_1427733 ?auto_1427735 ) ) ( not ( = ?auto_1427733 ?auto_1427737 ) ) ( not ( = ?auto_1427733 ?auto_1427736 ) ) ( not ( = ?auto_1427733 ?auto_1427743 ) ) ( not ( = ?auto_1427734 ?auto_1427735 ) ) ( not ( = ?auto_1427734 ?auto_1427737 ) ) ( not ( = ?auto_1427734 ?auto_1427736 ) ) ( not ( = ?auto_1427734 ?auto_1427743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427735 ?auto_1427737 ?auto_1427736 )
      ( MAKE-4CRATE-VERIFY ?auto_1427733 ?auto_1427734 ?auto_1427735 ?auto_1427737 ?auto_1427736 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427772 - SURFACE
      ?auto_1427773 - SURFACE
      ?auto_1427774 - SURFACE
      ?auto_1427776 - SURFACE
      ?auto_1427775 - SURFACE
    )
    :vars
    (
      ?auto_1427779 - HOIST
      ?auto_1427781 - PLACE
      ?auto_1427777 - PLACE
      ?auto_1427780 - HOIST
      ?auto_1427782 - SURFACE
      ?auto_1427778 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427779 ?auto_1427781 ) ( SURFACE-AT ?auto_1427776 ?auto_1427781 ) ( CLEAR ?auto_1427776 ) ( IS-CRATE ?auto_1427775 ) ( not ( = ?auto_1427776 ?auto_1427775 ) ) ( AVAILABLE ?auto_1427779 ) ( ON ?auto_1427776 ?auto_1427774 ) ( not ( = ?auto_1427774 ?auto_1427776 ) ) ( not ( = ?auto_1427774 ?auto_1427775 ) ) ( not ( = ?auto_1427777 ?auto_1427781 ) ) ( HOIST-AT ?auto_1427780 ?auto_1427777 ) ( not ( = ?auto_1427779 ?auto_1427780 ) ) ( AVAILABLE ?auto_1427780 ) ( SURFACE-AT ?auto_1427775 ?auto_1427777 ) ( ON ?auto_1427775 ?auto_1427782 ) ( CLEAR ?auto_1427775 ) ( not ( = ?auto_1427776 ?auto_1427782 ) ) ( not ( = ?auto_1427775 ?auto_1427782 ) ) ( not ( = ?auto_1427774 ?auto_1427782 ) ) ( TRUCK-AT ?auto_1427778 ?auto_1427781 ) ( ON ?auto_1427773 ?auto_1427772 ) ( ON ?auto_1427774 ?auto_1427773 ) ( not ( = ?auto_1427772 ?auto_1427773 ) ) ( not ( = ?auto_1427772 ?auto_1427774 ) ) ( not ( = ?auto_1427772 ?auto_1427776 ) ) ( not ( = ?auto_1427772 ?auto_1427775 ) ) ( not ( = ?auto_1427772 ?auto_1427782 ) ) ( not ( = ?auto_1427773 ?auto_1427774 ) ) ( not ( = ?auto_1427773 ?auto_1427776 ) ) ( not ( = ?auto_1427773 ?auto_1427775 ) ) ( not ( = ?auto_1427773 ?auto_1427782 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427774 ?auto_1427776 ?auto_1427775 )
      ( MAKE-4CRATE-VERIFY ?auto_1427772 ?auto_1427773 ?auto_1427774 ?auto_1427776 ?auto_1427775 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427811 - SURFACE
      ?auto_1427812 - SURFACE
      ?auto_1427813 - SURFACE
      ?auto_1427815 - SURFACE
      ?auto_1427814 - SURFACE
    )
    :vars
    (
      ?auto_1427821 - HOIST
      ?auto_1427816 - PLACE
      ?auto_1427820 - PLACE
      ?auto_1427818 - HOIST
      ?auto_1427817 - SURFACE
      ?auto_1427819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427821 ?auto_1427816 ) ( IS-CRATE ?auto_1427814 ) ( not ( = ?auto_1427815 ?auto_1427814 ) ) ( not ( = ?auto_1427813 ?auto_1427815 ) ) ( not ( = ?auto_1427813 ?auto_1427814 ) ) ( not ( = ?auto_1427820 ?auto_1427816 ) ) ( HOIST-AT ?auto_1427818 ?auto_1427820 ) ( not ( = ?auto_1427821 ?auto_1427818 ) ) ( AVAILABLE ?auto_1427818 ) ( SURFACE-AT ?auto_1427814 ?auto_1427820 ) ( ON ?auto_1427814 ?auto_1427817 ) ( CLEAR ?auto_1427814 ) ( not ( = ?auto_1427815 ?auto_1427817 ) ) ( not ( = ?auto_1427814 ?auto_1427817 ) ) ( not ( = ?auto_1427813 ?auto_1427817 ) ) ( TRUCK-AT ?auto_1427819 ?auto_1427816 ) ( SURFACE-AT ?auto_1427813 ?auto_1427816 ) ( CLEAR ?auto_1427813 ) ( LIFTING ?auto_1427821 ?auto_1427815 ) ( IS-CRATE ?auto_1427815 ) ( ON ?auto_1427812 ?auto_1427811 ) ( ON ?auto_1427813 ?auto_1427812 ) ( not ( = ?auto_1427811 ?auto_1427812 ) ) ( not ( = ?auto_1427811 ?auto_1427813 ) ) ( not ( = ?auto_1427811 ?auto_1427815 ) ) ( not ( = ?auto_1427811 ?auto_1427814 ) ) ( not ( = ?auto_1427811 ?auto_1427817 ) ) ( not ( = ?auto_1427812 ?auto_1427813 ) ) ( not ( = ?auto_1427812 ?auto_1427815 ) ) ( not ( = ?auto_1427812 ?auto_1427814 ) ) ( not ( = ?auto_1427812 ?auto_1427817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427813 ?auto_1427815 ?auto_1427814 )
      ( MAKE-4CRATE-VERIFY ?auto_1427811 ?auto_1427812 ?auto_1427813 ?auto_1427815 ?auto_1427814 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427850 - SURFACE
      ?auto_1427851 - SURFACE
      ?auto_1427852 - SURFACE
      ?auto_1427854 - SURFACE
      ?auto_1427853 - SURFACE
    )
    :vars
    (
      ?auto_1427860 - HOIST
      ?auto_1427857 - PLACE
      ?auto_1427855 - PLACE
      ?auto_1427856 - HOIST
      ?auto_1427858 - SURFACE
      ?auto_1427859 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427860 ?auto_1427857 ) ( IS-CRATE ?auto_1427853 ) ( not ( = ?auto_1427854 ?auto_1427853 ) ) ( not ( = ?auto_1427852 ?auto_1427854 ) ) ( not ( = ?auto_1427852 ?auto_1427853 ) ) ( not ( = ?auto_1427855 ?auto_1427857 ) ) ( HOIST-AT ?auto_1427856 ?auto_1427855 ) ( not ( = ?auto_1427860 ?auto_1427856 ) ) ( AVAILABLE ?auto_1427856 ) ( SURFACE-AT ?auto_1427853 ?auto_1427855 ) ( ON ?auto_1427853 ?auto_1427858 ) ( CLEAR ?auto_1427853 ) ( not ( = ?auto_1427854 ?auto_1427858 ) ) ( not ( = ?auto_1427853 ?auto_1427858 ) ) ( not ( = ?auto_1427852 ?auto_1427858 ) ) ( TRUCK-AT ?auto_1427859 ?auto_1427857 ) ( SURFACE-AT ?auto_1427852 ?auto_1427857 ) ( CLEAR ?auto_1427852 ) ( IS-CRATE ?auto_1427854 ) ( AVAILABLE ?auto_1427860 ) ( IN ?auto_1427854 ?auto_1427859 ) ( ON ?auto_1427851 ?auto_1427850 ) ( ON ?auto_1427852 ?auto_1427851 ) ( not ( = ?auto_1427850 ?auto_1427851 ) ) ( not ( = ?auto_1427850 ?auto_1427852 ) ) ( not ( = ?auto_1427850 ?auto_1427854 ) ) ( not ( = ?auto_1427850 ?auto_1427853 ) ) ( not ( = ?auto_1427850 ?auto_1427858 ) ) ( not ( = ?auto_1427851 ?auto_1427852 ) ) ( not ( = ?auto_1427851 ?auto_1427854 ) ) ( not ( = ?auto_1427851 ?auto_1427853 ) ) ( not ( = ?auto_1427851 ?auto_1427858 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427852 ?auto_1427854 ?auto_1427853 )
      ( MAKE-4CRATE-VERIFY ?auto_1427850 ?auto_1427851 ?auto_1427852 ?auto_1427854 ?auto_1427853 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427861 - SURFACE
      ?auto_1427862 - SURFACE
    )
    :vars
    (
      ?auto_1427869 - HOIST
      ?auto_1427865 - PLACE
      ?auto_1427868 - SURFACE
      ?auto_1427863 - PLACE
      ?auto_1427864 - HOIST
      ?auto_1427866 - SURFACE
      ?auto_1427867 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427869 ?auto_1427865 ) ( IS-CRATE ?auto_1427862 ) ( not ( = ?auto_1427861 ?auto_1427862 ) ) ( not ( = ?auto_1427868 ?auto_1427861 ) ) ( not ( = ?auto_1427868 ?auto_1427862 ) ) ( not ( = ?auto_1427863 ?auto_1427865 ) ) ( HOIST-AT ?auto_1427864 ?auto_1427863 ) ( not ( = ?auto_1427869 ?auto_1427864 ) ) ( AVAILABLE ?auto_1427864 ) ( SURFACE-AT ?auto_1427862 ?auto_1427863 ) ( ON ?auto_1427862 ?auto_1427866 ) ( CLEAR ?auto_1427862 ) ( not ( = ?auto_1427861 ?auto_1427866 ) ) ( not ( = ?auto_1427862 ?auto_1427866 ) ) ( not ( = ?auto_1427868 ?auto_1427866 ) ) ( SURFACE-AT ?auto_1427868 ?auto_1427865 ) ( CLEAR ?auto_1427868 ) ( IS-CRATE ?auto_1427861 ) ( AVAILABLE ?auto_1427869 ) ( IN ?auto_1427861 ?auto_1427867 ) ( TRUCK-AT ?auto_1427867 ?auto_1427863 ) )
    :subtasks
    ( ( !DRIVE ?auto_1427867 ?auto_1427863 ?auto_1427865 )
      ( MAKE-2CRATE ?auto_1427868 ?auto_1427861 ?auto_1427862 )
      ( MAKE-1CRATE-VERIFY ?auto_1427861 ?auto_1427862 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427870 - SURFACE
      ?auto_1427871 - SURFACE
      ?auto_1427872 - SURFACE
    )
    :vars
    (
      ?auto_1427876 - HOIST
      ?auto_1427877 - PLACE
      ?auto_1427875 - PLACE
      ?auto_1427873 - HOIST
      ?auto_1427878 - SURFACE
      ?auto_1427874 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427876 ?auto_1427877 ) ( IS-CRATE ?auto_1427872 ) ( not ( = ?auto_1427871 ?auto_1427872 ) ) ( not ( = ?auto_1427870 ?auto_1427871 ) ) ( not ( = ?auto_1427870 ?auto_1427872 ) ) ( not ( = ?auto_1427875 ?auto_1427877 ) ) ( HOIST-AT ?auto_1427873 ?auto_1427875 ) ( not ( = ?auto_1427876 ?auto_1427873 ) ) ( AVAILABLE ?auto_1427873 ) ( SURFACE-AT ?auto_1427872 ?auto_1427875 ) ( ON ?auto_1427872 ?auto_1427878 ) ( CLEAR ?auto_1427872 ) ( not ( = ?auto_1427871 ?auto_1427878 ) ) ( not ( = ?auto_1427872 ?auto_1427878 ) ) ( not ( = ?auto_1427870 ?auto_1427878 ) ) ( SURFACE-AT ?auto_1427870 ?auto_1427877 ) ( CLEAR ?auto_1427870 ) ( IS-CRATE ?auto_1427871 ) ( AVAILABLE ?auto_1427876 ) ( IN ?auto_1427871 ?auto_1427874 ) ( TRUCK-AT ?auto_1427874 ?auto_1427875 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427871 ?auto_1427872 )
      ( MAKE-2CRATE-VERIFY ?auto_1427870 ?auto_1427871 ?auto_1427872 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427879 - SURFACE
      ?auto_1427880 - SURFACE
      ?auto_1427881 - SURFACE
      ?auto_1427882 - SURFACE
    )
    :vars
    (
      ?auto_1427886 - HOIST
      ?auto_1427884 - PLACE
      ?auto_1427887 - PLACE
      ?auto_1427888 - HOIST
      ?auto_1427883 - SURFACE
      ?auto_1427885 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427886 ?auto_1427884 ) ( IS-CRATE ?auto_1427882 ) ( not ( = ?auto_1427881 ?auto_1427882 ) ) ( not ( = ?auto_1427880 ?auto_1427881 ) ) ( not ( = ?auto_1427880 ?auto_1427882 ) ) ( not ( = ?auto_1427887 ?auto_1427884 ) ) ( HOIST-AT ?auto_1427888 ?auto_1427887 ) ( not ( = ?auto_1427886 ?auto_1427888 ) ) ( AVAILABLE ?auto_1427888 ) ( SURFACE-AT ?auto_1427882 ?auto_1427887 ) ( ON ?auto_1427882 ?auto_1427883 ) ( CLEAR ?auto_1427882 ) ( not ( = ?auto_1427881 ?auto_1427883 ) ) ( not ( = ?auto_1427882 ?auto_1427883 ) ) ( not ( = ?auto_1427880 ?auto_1427883 ) ) ( SURFACE-AT ?auto_1427880 ?auto_1427884 ) ( CLEAR ?auto_1427880 ) ( IS-CRATE ?auto_1427881 ) ( AVAILABLE ?auto_1427886 ) ( IN ?auto_1427881 ?auto_1427885 ) ( TRUCK-AT ?auto_1427885 ?auto_1427887 ) ( ON ?auto_1427880 ?auto_1427879 ) ( not ( = ?auto_1427879 ?auto_1427880 ) ) ( not ( = ?auto_1427879 ?auto_1427881 ) ) ( not ( = ?auto_1427879 ?auto_1427882 ) ) ( not ( = ?auto_1427879 ?auto_1427883 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427880 ?auto_1427881 ?auto_1427882 )
      ( MAKE-3CRATE-VERIFY ?auto_1427879 ?auto_1427880 ?auto_1427881 ?auto_1427882 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427889 - SURFACE
      ?auto_1427890 - SURFACE
      ?auto_1427891 - SURFACE
      ?auto_1427893 - SURFACE
      ?auto_1427892 - SURFACE
    )
    :vars
    (
      ?auto_1427897 - HOIST
      ?auto_1427895 - PLACE
      ?auto_1427898 - PLACE
      ?auto_1427899 - HOIST
      ?auto_1427894 - SURFACE
      ?auto_1427896 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427897 ?auto_1427895 ) ( IS-CRATE ?auto_1427892 ) ( not ( = ?auto_1427893 ?auto_1427892 ) ) ( not ( = ?auto_1427891 ?auto_1427893 ) ) ( not ( = ?auto_1427891 ?auto_1427892 ) ) ( not ( = ?auto_1427898 ?auto_1427895 ) ) ( HOIST-AT ?auto_1427899 ?auto_1427898 ) ( not ( = ?auto_1427897 ?auto_1427899 ) ) ( AVAILABLE ?auto_1427899 ) ( SURFACE-AT ?auto_1427892 ?auto_1427898 ) ( ON ?auto_1427892 ?auto_1427894 ) ( CLEAR ?auto_1427892 ) ( not ( = ?auto_1427893 ?auto_1427894 ) ) ( not ( = ?auto_1427892 ?auto_1427894 ) ) ( not ( = ?auto_1427891 ?auto_1427894 ) ) ( SURFACE-AT ?auto_1427891 ?auto_1427895 ) ( CLEAR ?auto_1427891 ) ( IS-CRATE ?auto_1427893 ) ( AVAILABLE ?auto_1427897 ) ( IN ?auto_1427893 ?auto_1427896 ) ( TRUCK-AT ?auto_1427896 ?auto_1427898 ) ( ON ?auto_1427890 ?auto_1427889 ) ( ON ?auto_1427891 ?auto_1427890 ) ( not ( = ?auto_1427889 ?auto_1427890 ) ) ( not ( = ?auto_1427889 ?auto_1427891 ) ) ( not ( = ?auto_1427889 ?auto_1427893 ) ) ( not ( = ?auto_1427889 ?auto_1427892 ) ) ( not ( = ?auto_1427889 ?auto_1427894 ) ) ( not ( = ?auto_1427890 ?auto_1427891 ) ) ( not ( = ?auto_1427890 ?auto_1427893 ) ) ( not ( = ?auto_1427890 ?auto_1427892 ) ) ( not ( = ?auto_1427890 ?auto_1427894 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427891 ?auto_1427893 ?auto_1427892 )
      ( MAKE-4CRATE-VERIFY ?auto_1427889 ?auto_1427890 ?auto_1427891 ?auto_1427893 ?auto_1427892 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427900 - SURFACE
      ?auto_1427901 - SURFACE
    )
    :vars
    (
      ?auto_1427905 - HOIST
      ?auto_1427903 - PLACE
      ?auto_1427908 - SURFACE
      ?auto_1427906 - PLACE
      ?auto_1427907 - HOIST
      ?auto_1427902 - SURFACE
      ?auto_1427904 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427905 ?auto_1427903 ) ( IS-CRATE ?auto_1427901 ) ( not ( = ?auto_1427900 ?auto_1427901 ) ) ( not ( = ?auto_1427908 ?auto_1427900 ) ) ( not ( = ?auto_1427908 ?auto_1427901 ) ) ( not ( = ?auto_1427906 ?auto_1427903 ) ) ( HOIST-AT ?auto_1427907 ?auto_1427906 ) ( not ( = ?auto_1427905 ?auto_1427907 ) ) ( SURFACE-AT ?auto_1427901 ?auto_1427906 ) ( ON ?auto_1427901 ?auto_1427902 ) ( CLEAR ?auto_1427901 ) ( not ( = ?auto_1427900 ?auto_1427902 ) ) ( not ( = ?auto_1427901 ?auto_1427902 ) ) ( not ( = ?auto_1427908 ?auto_1427902 ) ) ( SURFACE-AT ?auto_1427908 ?auto_1427903 ) ( CLEAR ?auto_1427908 ) ( IS-CRATE ?auto_1427900 ) ( AVAILABLE ?auto_1427905 ) ( TRUCK-AT ?auto_1427904 ?auto_1427906 ) ( LIFTING ?auto_1427907 ?auto_1427900 ) )
    :subtasks
    ( ( !LOAD ?auto_1427907 ?auto_1427900 ?auto_1427904 ?auto_1427906 )
      ( MAKE-2CRATE ?auto_1427908 ?auto_1427900 ?auto_1427901 )
      ( MAKE-1CRATE-VERIFY ?auto_1427900 ?auto_1427901 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427909 - SURFACE
      ?auto_1427910 - SURFACE
      ?auto_1427911 - SURFACE
    )
    :vars
    (
      ?auto_1427914 - HOIST
      ?auto_1427912 - PLACE
      ?auto_1427915 - PLACE
      ?auto_1427917 - HOIST
      ?auto_1427913 - SURFACE
      ?auto_1427916 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427914 ?auto_1427912 ) ( IS-CRATE ?auto_1427911 ) ( not ( = ?auto_1427910 ?auto_1427911 ) ) ( not ( = ?auto_1427909 ?auto_1427910 ) ) ( not ( = ?auto_1427909 ?auto_1427911 ) ) ( not ( = ?auto_1427915 ?auto_1427912 ) ) ( HOIST-AT ?auto_1427917 ?auto_1427915 ) ( not ( = ?auto_1427914 ?auto_1427917 ) ) ( SURFACE-AT ?auto_1427911 ?auto_1427915 ) ( ON ?auto_1427911 ?auto_1427913 ) ( CLEAR ?auto_1427911 ) ( not ( = ?auto_1427910 ?auto_1427913 ) ) ( not ( = ?auto_1427911 ?auto_1427913 ) ) ( not ( = ?auto_1427909 ?auto_1427913 ) ) ( SURFACE-AT ?auto_1427909 ?auto_1427912 ) ( CLEAR ?auto_1427909 ) ( IS-CRATE ?auto_1427910 ) ( AVAILABLE ?auto_1427914 ) ( TRUCK-AT ?auto_1427916 ?auto_1427915 ) ( LIFTING ?auto_1427917 ?auto_1427910 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427910 ?auto_1427911 )
      ( MAKE-2CRATE-VERIFY ?auto_1427909 ?auto_1427910 ?auto_1427911 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427918 - SURFACE
      ?auto_1427919 - SURFACE
      ?auto_1427920 - SURFACE
      ?auto_1427921 - SURFACE
    )
    :vars
    (
      ?auto_1427926 - HOIST
      ?auto_1427923 - PLACE
      ?auto_1427925 - PLACE
      ?auto_1427922 - HOIST
      ?auto_1427924 - SURFACE
      ?auto_1427927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427926 ?auto_1427923 ) ( IS-CRATE ?auto_1427921 ) ( not ( = ?auto_1427920 ?auto_1427921 ) ) ( not ( = ?auto_1427919 ?auto_1427920 ) ) ( not ( = ?auto_1427919 ?auto_1427921 ) ) ( not ( = ?auto_1427925 ?auto_1427923 ) ) ( HOIST-AT ?auto_1427922 ?auto_1427925 ) ( not ( = ?auto_1427926 ?auto_1427922 ) ) ( SURFACE-AT ?auto_1427921 ?auto_1427925 ) ( ON ?auto_1427921 ?auto_1427924 ) ( CLEAR ?auto_1427921 ) ( not ( = ?auto_1427920 ?auto_1427924 ) ) ( not ( = ?auto_1427921 ?auto_1427924 ) ) ( not ( = ?auto_1427919 ?auto_1427924 ) ) ( SURFACE-AT ?auto_1427919 ?auto_1427923 ) ( CLEAR ?auto_1427919 ) ( IS-CRATE ?auto_1427920 ) ( AVAILABLE ?auto_1427926 ) ( TRUCK-AT ?auto_1427927 ?auto_1427925 ) ( LIFTING ?auto_1427922 ?auto_1427920 ) ( ON ?auto_1427919 ?auto_1427918 ) ( not ( = ?auto_1427918 ?auto_1427919 ) ) ( not ( = ?auto_1427918 ?auto_1427920 ) ) ( not ( = ?auto_1427918 ?auto_1427921 ) ) ( not ( = ?auto_1427918 ?auto_1427924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427919 ?auto_1427920 ?auto_1427921 )
      ( MAKE-3CRATE-VERIFY ?auto_1427918 ?auto_1427919 ?auto_1427920 ?auto_1427921 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427928 - SURFACE
      ?auto_1427929 - SURFACE
      ?auto_1427930 - SURFACE
      ?auto_1427932 - SURFACE
      ?auto_1427931 - SURFACE
    )
    :vars
    (
      ?auto_1427937 - HOIST
      ?auto_1427934 - PLACE
      ?auto_1427936 - PLACE
      ?auto_1427933 - HOIST
      ?auto_1427935 - SURFACE
      ?auto_1427938 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427937 ?auto_1427934 ) ( IS-CRATE ?auto_1427931 ) ( not ( = ?auto_1427932 ?auto_1427931 ) ) ( not ( = ?auto_1427930 ?auto_1427932 ) ) ( not ( = ?auto_1427930 ?auto_1427931 ) ) ( not ( = ?auto_1427936 ?auto_1427934 ) ) ( HOIST-AT ?auto_1427933 ?auto_1427936 ) ( not ( = ?auto_1427937 ?auto_1427933 ) ) ( SURFACE-AT ?auto_1427931 ?auto_1427936 ) ( ON ?auto_1427931 ?auto_1427935 ) ( CLEAR ?auto_1427931 ) ( not ( = ?auto_1427932 ?auto_1427935 ) ) ( not ( = ?auto_1427931 ?auto_1427935 ) ) ( not ( = ?auto_1427930 ?auto_1427935 ) ) ( SURFACE-AT ?auto_1427930 ?auto_1427934 ) ( CLEAR ?auto_1427930 ) ( IS-CRATE ?auto_1427932 ) ( AVAILABLE ?auto_1427937 ) ( TRUCK-AT ?auto_1427938 ?auto_1427936 ) ( LIFTING ?auto_1427933 ?auto_1427932 ) ( ON ?auto_1427929 ?auto_1427928 ) ( ON ?auto_1427930 ?auto_1427929 ) ( not ( = ?auto_1427928 ?auto_1427929 ) ) ( not ( = ?auto_1427928 ?auto_1427930 ) ) ( not ( = ?auto_1427928 ?auto_1427932 ) ) ( not ( = ?auto_1427928 ?auto_1427931 ) ) ( not ( = ?auto_1427928 ?auto_1427935 ) ) ( not ( = ?auto_1427929 ?auto_1427930 ) ) ( not ( = ?auto_1427929 ?auto_1427932 ) ) ( not ( = ?auto_1427929 ?auto_1427931 ) ) ( not ( = ?auto_1427929 ?auto_1427935 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427930 ?auto_1427932 ?auto_1427931 )
      ( MAKE-4CRATE-VERIFY ?auto_1427928 ?auto_1427929 ?auto_1427930 ?auto_1427932 ?auto_1427931 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427939 - SURFACE
      ?auto_1427940 - SURFACE
    )
    :vars
    (
      ?auto_1427946 - HOIST
      ?auto_1427942 - PLACE
      ?auto_1427944 - SURFACE
      ?auto_1427945 - PLACE
      ?auto_1427941 - HOIST
      ?auto_1427943 - SURFACE
      ?auto_1427947 - TRUCK
      ?auto_1427948 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427946 ?auto_1427942 ) ( IS-CRATE ?auto_1427940 ) ( not ( = ?auto_1427939 ?auto_1427940 ) ) ( not ( = ?auto_1427944 ?auto_1427939 ) ) ( not ( = ?auto_1427944 ?auto_1427940 ) ) ( not ( = ?auto_1427945 ?auto_1427942 ) ) ( HOIST-AT ?auto_1427941 ?auto_1427945 ) ( not ( = ?auto_1427946 ?auto_1427941 ) ) ( SURFACE-AT ?auto_1427940 ?auto_1427945 ) ( ON ?auto_1427940 ?auto_1427943 ) ( CLEAR ?auto_1427940 ) ( not ( = ?auto_1427939 ?auto_1427943 ) ) ( not ( = ?auto_1427940 ?auto_1427943 ) ) ( not ( = ?auto_1427944 ?auto_1427943 ) ) ( SURFACE-AT ?auto_1427944 ?auto_1427942 ) ( CLEAR ?auto_1427944 ) ( IS-CRATE ?auto_1427939 ) ( AVAILABLE ?auto_1427946 ) ( TRUCK-AT ?auto_1427947 ?auto_1427945 ) ( AVAILABLE ?auto_1427941 ) ( SURFACE-AT ?auto_1427939 ?auto_1427945 ) ( ON ?auto_1427939 ?auto_1427948 ) ( CLEAR ?auto_1427939 ) ( not ( = ?auto_1427939 ?auto_1427948 ) ) ( not ( = ?auto_1427940 ?auto_1427948 ) ) ( not ( = ?auto_1427944 ?auto_1427948 ) ) ( not ( = ?auto_1427943 ?auto_1427948 ) ) )
    :subtasks
    ( ( !LIFT ?auto_1427941 ?auto_1427939 ?auto_1427948 ?auto_1427945 )
      ( MAKE-2CRATE ?auto_1427944 ?auto_1427939 ?auto_1427940 )
      ( MAKE-1CRATE-VERIFY ?auto_1427939 ?auto_1427940 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427949 - SURFACE
      ?auto_1427950 - SURFACE
      ?auto_1427951 - SURFACE
    )
    :vars
    (
      ?auto_1427953 - HOIST
      ?auto_1427956 - PLACE
      ?auto_1427955 - PLACE
      ?auto_1427954 - HOIST
      ?auto_1427958 - SURFACE
      ?auto_1427957 - TRUCK
      ?auto_1427952 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427953 ?auto_1427956 ) ( IS-CRATE ?auto_1427951 ) ( not ( = ?auto_1427950 ?auto_1427951 ) ) ( not ( = ?auto_1427949 ?auto_1427950 ) ) ( not ( = ?auto_1427949 ?auto_1427951 ) ) ( not ( = ?auto_1427955 ?auto_1427956 ) ) ( HOIST-AT ?auto_1427954 ?auto_1427955 ) ( not ( = ?auto_1427953 ?auto_1427954 ) ) ( SURFACE-AT ?auto_1427951 ?auto_1427955 ) ( ON ?auto_1427951 ?auto_1427958 ) ( CLEAR ?auto_1427951 ) ( not ( = ?auto_1427950 ?auto_1427958 ) ) ( not ( = ?auto_1427951 ?auto_1427958 ) ) ( not ( = ?auto_1427949 ?auto_1427958 ) ) ( SURFACE-AT ?auto_1427949 ?auto_1427956 ) ( CLEAR ?auto_1427949 ) ( IS-CRATE ?auto_1427950 ) ( AVAILABLE ?auto_1427953 ) ( TRUCK-AT ?auto_1427957 ?auto_1427955 ) ( AVAILABLE ?auto_1427954 ) ( SURFACE-AT ?auto_1427950 ?auto_1427955 ) ( ON ?auto_1427950 ?auto_1427952 ) ( CLEAR ?auto_1427950 ) ( not ( = ?auto_1427950 ?auto_1427952 ) ) ( not ( = ?auto_1427951 ?auto_1427952 ) ) ( not ( = ?auto_1427949 ?auto_1427952 ) ) ( not ( = ?auto_1427958 ?auto_1427952 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427950 ?auto_1427951 )
      ( MAKE-2CRATE-VERIFY ?auto_1427949 ?auto_1427950 ?auto_1427951 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1427959 - SURFACE
      ?auto_1427960 - SURFACE
      ?auto_1427961 - SURFACE
      ?auto_1427962 - SURFACE
    )
    :vars
    (
      ?auto_1427968 - HOIST
      ?auto_1427966 - PLACE
      ?auto_1427965 - PLACE
      ?auto_1427967 - HOIST
      ?auto_1427969 - SURFACE
      ?auto_1427964 - TRUCK
      ?auto_1427963 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427968 ?auto_1427966 ) ( IS-CRATE ?auto_1427962 ) ( not ( = ?auto_1427961 ?auto_1427962 ) ) ( not ( = ?auto_1427960 ?auto_1427961 ) ) ( not ( = ?auto_1427960 ?auto_1427962 ) ) ( not ( = ?auto_1427965 ?auto_1427966 ) ) ( HOIST-AT ?auto_1427967 ?auto_1427965 ) ( not ( = ?auto_1427968 ?auto_1427967 ) ) ( SURFACE-AT ?auto_1427962 ?auto_1427965 ) ( ON ?auto_1427962 ?auto_1427969 ) ( CLEAR ?auto_1427962 ) ( not ( = ?auto_1427961 ?auto_1427969 ) ) ( not ( = ?auto_1427962 ?auto_1427969 ) ) ( not ( = ?auto_1427960 ?auto_1427969 ) ) ( SURFACE-AT ?auto_1427960 ?auto_1427966 ) ( CLEAR ?auto_1427960 ) ( IS-CRATE ?auto_1427961 ) ( AVAILABLE ?auto_1427968 ) ( TRUCK-AT ?auto_1427964 ?auto_1427965 ) ( AVAILABLE ?auto_1427967 ) ( SURFACE-AT ?auto_1427961 ?auto_1427965 ) ( ON ?auto_1427961 ?auto_1427963 ) ( CLEAR ?auto_1427961 ) ( not ( = ?auto_1427961 ?auto_1427963 ) ) ( not ( = ?auto_1427962 ?auto_1427963 ) ) ( not ( = ?auto_1427960 ?auto_1427963 ) ) ( not ( = ?auto_1427969 ?auto_1427963 ) ) ( ON ?auto_1427960 ?auto_1427959 ) ( not ( = ?auto_1427959 ?auto_1427960 ) ) ( not ( = ?auto_1427959 ?auto_1427961 ) ) ( not ( = ?auto_1427959 ?auto_1427962 ) ) ( not ( = ?auto_1427959 ?auto_1427969 ) ) ( not ( = ?auto_1427959 ?auto_1427963 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427960 ?auto_1427961 ?auto_1427962 )
      ( MAKE-3CRATE-VERIFY ?auto_1427959 ?auto_1427960 ?auto_1427961 ?auto_1427962 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1427970 - SURFACE
      ?auto_1427971 - SURFACE
      ?auto_1427972 - SURFACE
      ?auto_1427974 - SURFACE
      ?auto_1427973 - SURFACE
    )
    :vars
    (
      ?auto_1427980 - HOIST
      ?auto_1427978 - PLACE
      ?auto_1427977 - PLACE
      ?auto_1427979 - HOIST
      ?auto_1427981 - SURFACE
      ?auto_1427976 - TRUCK
      ?auto_1427975 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427980 ?auto_1427978 ) ( IS-CRATE ?auto_1427973 ) ( not ( = ?auto_1427974 ?auto_1427973 ) ) ( not ( = ?auto_1427972 ?auto_1427974 ) ) ( not ( = ?auto_1427972 ?auto_1427973 ) ) ( not ( = ?auto_1427977 ?auto_1427978 ) ) ( HOIST-AT ?auto_1427979 ?auto_1427977 ) ( not ( = ?auto_1427980 ?auto_1427979 ) ) ( SURFACE-AT ?auto_1427973 ?auto_1427977 ) ( ON ?auto_1427973 ?auto_1427981 ) ( CLEAR ?auto_1427973 ) ( not ( = ?auto_1427974 ?auto_1427981 ) ) ( not ( = ?auto_1427973 ?auto_1427981 ) ) ( not ( = ?auto_1427972 ?auto_1427981 ) ) ( SURFACE-AT ?auto_1427972 ?auto_1427978 ) ( CLEAR ?auto_1427972 ) ( IS-CRATE ?auto_1427974 ) ( AVAILABLE ?auto_1427980 ) ( TRUCK-AT ?auto_1427976 ?auto_1427977 ) ( AVAILABLE ?auto_1427979 ) ( SURFACE-AT ?auto_1427974 ?auto_1427977 ) ( ON ?auto_1427974 ?auto_1427975 ) ( CLEAR ?auto_1427974 ) ( not ( = ?auto_1427974 ?auto_1427975 ) ) ( not ( = ?auto_1427973 ?auto_1427975 ) ) ( not ( = ?auto_1427972 ?auto_1427975 ) ) ( not ( = ?auto_1427981 ?auto_1427975 ) ) ( ON ?auto_1427971 ?auto_1427970 ) ( ON ?auto_1427972 ?auto_1427971 ) ( not ( = ?auto_1427970 ?auto_1427971 ) ) ( not ( = ?auto_1427970 ?auto_1427972 ) ) ( not ( = ?auto_1427970 ?auto_1427974 ) ) ( not ( = ?auto_1427970 ?auto_1427973 ) ) ( not ( = ?auto_1427970 ?auto_1427981 ) ) ( not ( = ?auto_1427970 ?auto_1427975 ) ) ( not ( = ?auto_1427971 ?auto_1427972 ) ) ( not ( = ?auto_1427971 ?auto_1427974 ) ) ( not ( = ?auto_1427971 ?auto_1427973 ) ) ( not ( = ?auto_1427971 ?auto_1427981 ) ) ( not ( = ?auto_1427971 ?auto_1427975 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1427972 ?auto_1427974 ?auto_1427973 )
      ( MAKE-4CRATE-VERIFY ?auto_1427970 ?auto_1427971 ?auto_1427972 ?auto_1427974 ?auto_1427973 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1427982 - SURFACE
      ?auto_1427983 - SURFACE
    )
    :vars
    (
      ?auto_1427990 - HOIST
      ?auto_1427988 - PLACE
      ?auto_1427986 - SURFACE
      ?auto_1427987 - PLACE
      ?auto_1427989 - HOIST
      ?auto_1427991 - SURFACE
      ?auto_1427984 - SURFACE
      ?auto_1427985 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427990 ?auto_1427988 ) ( IS-CRATE ?auto_1427983 ) ( not ( = ?auto_1427982 ?auto_1427983 ) ) ( not ( = ?auto_1427986 ?auto_1427982 ) ) ( not ( = ?auto_1427986 ?auto_1427983 ) ) ( not ( = ?auto_1427987 ?auto_1427988 ) ) ( HOIST-AT ?auto_1427989 ?auto_1427987 ) ( not ( = ?auto_1427990 ?auto_1427989 ) ) ( SURFACE-AT ?auto_1427983 ?auto_1427987 ) ( ON ?auto_1427983 ?auto_1427991 ) ( CLEAR ?auto_1427983 ) ( not ( = ?auto_1427982 ?auto_1427991 ) ) ( not ( = ?auto_1427983 ?auto_1427991 ) ) ( not ( = ?auto_1427986 ?auto_1427991 ) ) ( SURFACE-AT ?auto_1427986 ?auto_1427988 ) ( CLEAR ?auto_1427986 ) ( IS-CRATE ?auto_1427982 ) ( AVAILABLE ?auto_1427990 ) ( AVAILABLE ?auto_1427989 ) ( SURFACE-AT ?auto_1427982 ?auto_1427987 ) ( ON ?auto_1427982 ?auto_1427984 ) ( CLEAR ?auto_1427982 ) ( not ( = ?auto_1427982 ?auto_1427984 ) ) ( not ( = ?auto_1427983 ?auto_1427984 ) ) ( not ( = ?auto_1427986 ?auto_1427984 ) ) ( not ( = ?auto_1427991 ?auto_1427984 ) ) ( TRUCK-AT ?auto_1427985 ?auto_1427988 ) )
    :subtasks
    ( ( !DRIVE ?auto_1427985 ?auto_1427988 ?auto_1427987 )
      ( MAKE-2CRATE ?auto_1427986 ?auto_1427982 ?auto_1427983 )
      ( MAKE-1CRATE-VERIFY ?auto_1427982 ?auto_1427983 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1427992 - SURFACE
      ?auto_1427993 - SURFACE
      ?auto_1427994 - SURFACE
    )
    :vars
    (
      ?auto_1427995 - HOIST
      ?auto_1427998 - PLACE
      ?auto_1428000 - PLACE
      ?auto_1428001 - HOIST
      ?auto_1427999 - SURFACE
      ?auto_1427997 - SURFACE
      ?auto_1427996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1427995 ?auto_1427998 ) ( IS-CRATE ?auto_1427994 ) ( not ( = ?auto_1427993 ?auto_1427994 ) ) ( not ( = ?auto_1427992 ?auto_1427993 ) ) ( not ( = ?auto_1427992 ?auto_1427994 ) ) ( not ( = ?auto_1428000 ?auto_1427998 ) ) ( HOIST-AT ?auto_1428001 ?auto_1428000 ) ( not ( = ?auto_1427995 ?auto_1428001 ) ) ( SURFACE-AT ?auto_1427994 ?auto_1428000 ) ( ON ?auto_1427994 ?auto_1427999 ) ( CLEAR ?auto_1427994 ) ( not ( = ?auto_1427993 ?auto_1427999 ) ) ( not ( = ?auto_1427994 ?auto_1427999 ) ) ( not ( = ?auto_1427992 ?auto_1427999 ) ) ( SURFACE-AT ?auto_1427992 ?auto_1427998 ) ( CLEAR ?auto_1427992 ) ( IS-CRATE ?auto_1427993 ) ( AVAILABLE ?auto_1427995 ) ( AVAILABLE ?auto_1428001 ) ( SURFACE-AT ?auto_1427993 ?auto_1428000 ) ( ON ?auto_1427993 ?auto_1427997 ) ( CLEAR ?auto_1427993 ) ( not ( = ?auto_1427993 ?auto_1427997 ) ) ( not ( = ?auto_1427994 ?auto_1427997 ) ) ( not ( = ?auto_1427992 ?auto_1427997 ) ) ( not ( = ?auto_1427999 ?auto_1427997 ) ) ( TRUCK-AT ?auto_1427996 ?auto_1427998 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1427993 ?auto_1427994 )
      ( MAKE-2CRATE-VERIFY ?auto_1427992 ?auto_1427993 ?auto_1427994 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428002 - SURFACE
      ?auto_1428003 - SURFACE
      ?auto_1428004 - SURFACE
      ?auto_1428005 - SURFACE
    )
    :vars
    (
      ?auto_1428009 - HOIST
      ?auto_1428011 - PLACE
      ?auto_1428006 - PLACE
      ?auto_1428007 - HOIST
      ?auto_1428012 - SURFACE
      ?auto_1428010 - SURFACE
      ?auto_1428008 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428009 ?auto_1428011 ) ( IS-CRATE ?auto_1428005 ) ( not ( = ?auto_1428004 ?auto_1428005 ) ) ( not ( = ?auto_1428003 ?auto_1428004 ) ) ( not ( = ?auto_1428003 ?auto_1428005 ) ) ( not ( = ?auto_1428006 ?auto_1428011 ) ) ( HOIST-AT ?auto_1428007 ?auto_1428006 ) ( not ( = ?auto_1428009 ?auto_1428007 ) ) ( SURFACE-AT ?auto_1428005 ?auto_1428006 ) ( ON ?auto_1428005 ?auto_1428012 ) ( CLEAR ?auto_1428005 ) ( not ( = ?auto_1428004 ?auto_1428012 ) ) ( not ( = ?auto_1428005 ?auto_1428012 ) ) ( not ( = ?auto_1428003 ?auto_1428012 ) ) ( SURFACE-AT ?auto_1428003 ?auto_1428011 ) ( CLEAR ?auto_1428003 ) ( IS-CRATE ?auto_1428004 ) ( AVAILABLE ?auto_1428009 ) ( AVAILABLE ?auto_1428007 ) ( SURFACE-AT ?auto_1428004 ?auto_1428006 ) ( ON ?auto_1428004 ?auto_1428010 ) ( CLEAR ?auto_1428004 ) ( not ( = ?auto_1428004 ?auto_1428010 ) ) ( not ( = ?auto_1428005 ?auto_1428010 ) ) ( not ( = ?auto_1428003 ?auto_1428010 ) ) ( not ( = ?auto_1428012 ?auto_1428010 ) ) ( TRUCK-AT ?auto_1428008 ?auto_1428011 ) ( ON ?auto_1428003 ?auto_1428002 ) ( not ( = ?auto_1428002 ?auto_1428003 ) ) ( not ( = ?auto_1428002 ?auto_1428004 ) ) ( not ( = ?auto_1428002 ?auto_1428005 ) ) ( not ( = ?auto_1428002 ?auto_1428012 ) ) ( not ( = ?auto_1428002 ?auto_1428010 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428003 ?auto_1428004 ?auto_1428005 )
      ( MAKE-3CRATE-VERIFY ?auto_1428002 ?auto_1428003 ?auto_1428004 ?auto_1428005 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428013 - SURFACE
      ?auto_1428014 - SURFACE
      ?auto_1428015 - SURFACE
      ?auto_1428017 - SURFACE
      ?auto_1428016 - SURFACE
    )
    :vars
    (
      ?auto_1428021 - HOIST
      ?auto_1428023 - PLACE
      ?auto_1428018 - PLACE
      ?auto_1428019 - HOIST
      ?auto_1428024 - SURFACE
      ?auto_1428022 - SURFACE
      ?auto_1428020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428021 ?auto_1428023 ) ( IS-CRATE ?auto_1428016 ) ( not ( = ?auto_1428017 ?auto_1428016 ) ) ( not ( = ?auto_1428015 ?auto_1428017 ) ) ( not ( = ?auto_1428015 ?auto_1428016 ) ) ( not ( = ?auto_1428018 ?auto_1428023 ) ) ( HOIST-AT ?auto_1428019 ?auto_1428018 ) ( not ( = ?auto_1428021 ?auto_1428019 ) ) ( SURFACE-AT ?auto_1428016 ?auto_1428018 ) ( ON ?auto_1428016 ?auto_1428024 ) ( CLEAR ?auto_1428016 ) ( not ( = ?auto_1428017 ?auto_1428024 ) ) ( not ( = ?auto_1428016 ?auto_1428024 ) ) ( not ( = ?auto_1428015 ?auto_1428024 ) ) ( SURFACE-AT ?auto_1428015 ?auto_1428023 ) ( CLEAR ?auto_1428015 ) ( IS-CRATE ?auto_1428017 ) ( AVAILABLE ?auto_1428021 ) ( AVAILABLE ?auto_1428019 ) ( SURFACE-AT ?auto_1428017 ?auto_1428018 ) ( ON ?auto_1428017 ?auto_1428022 ) ( CLEAR ?auto_1428017 ) ( not ( = ?auto_1428017 ?auto_1428022 ) ) ( not ( = ?auto_1428016 ?auto_1428022 ) ) ( not ( = ?auto_1428015 ?auto_1428022 ) ) ( not ( = ?auto_1428024 ?auto_1428022 ) ) ( TRUCK-AT ?auto_1428020 ?auto_1428023 ) ( ON ?auto_1428014 ?auto_1428013 ) ( ON ?auto_1428015 ?auto_1428014 ) ( not ( = ?auto_1428013 ?auto_1428014 ) ) ( not ( = ?auto_1428013 ?auto_1428015 ) ) ( not ( = ?auto_1428013 ?auto_1428017 ) ) ( not ( = ?auto_1428013 ?auto_1428016 ) ) ( not ( = ?auto_1428013 ?auto_1428024 ) ) ( not ( = ?auto_1428013 ?auto_1428022 ) ) ( not ( = ?auto_1428014 ?auto_1428015 ) ) ( not ( = ?auto_1428014 ?auto_1428017 ) ) ( not ( = ?auto_1428014 ?auto_1428016 ) ) ( not ( = ?auto_1428014 ?auto_1428024 ) ) ( not ( = ?auto_1428014 ?auto_1428022 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428015 ?auto_1428017 ?auto_1428016 )
      ( MAKE-4CRATE-VERIFY ?auto_1428013 ?auto_1428014 ?auto_1428015 ?auto_1428017 ?auto_1428016 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1428025 - SURFACE
      ?auto_1428026 - SURFACE
    )
    :vars
    (
      ?auto_1428031 - HOIST
      ?auto_1428033 - PLACE
      ?auto_1428028 - SURFACE
      ?auto_1428027 - PLACE
      ?auto_1428029 - HOIST
      ?auto_1428034 - SURFACE
      ?auto_1428032 - SURFACE
      ?auto_1428030 - TRUCK
      ?auto_1428035 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428031 ?auto_1428033 ) ( IS-CRATE ?auto_1428026 ) ( not ( = ?auto_1428025 ?auto_1428026 ) ) ( not ( = ?auto_1428028 ?auto_1428025 ) ) ( not ( = ?auto_1428028 ?auto_1428026 ) ) ( not ( = ?auto_1428027 ?auto_1428033 ) ) ( HOIST-AT ?auto_1428029 ?auto_1428027 ) ( not ( = ?auto_1428031 ?auto_1428029 ) ) ( SURFACE-AT ?auto_1428026 ?auto_1428027 ) ( ON ?auto_1428026 ?auto_1428034 ) ( CLEAR ?auto_1428026 ) ( not ( = ?auto_1428025 ?auto_1428034 ) ) ( not ( = ?auto_1428026 ?auto_1428034 ) ) ( not ( = ?auto_1428028 ?auto_1428034 ) ) ( IS-CRATE ?auto_1428025 ) ( AVAILABLE ?auto_1428029 ) ( SURFACE-AT ?auto_1428025 ?auto_1428027 ) ( ON ?auto_1428025 ?auto_1428032 ) ( CLEAR ?auto_1428025 ) ( not ( = ?auto_1428025 ?auto_1428032 ) ) ( not ( = ?auto_1428026 ?auto_1428032 ) ) ( not ( = ?auto_1428028 ?auto_1428032 ) ) ( not ( = ?auto_1428034 ?auto_1428032 ) ) ( TRUCK-AT ?auto_1428030 ?auto_1428033 ) ( SURFACE-AT ?auto_1428035 ?auto_1428033 ) ( CLEAR ?auto_1428035 ) ( LIFTING ?auto_1428031 ?auto_1428028 ) ( IS-CRATE ?auto_1428028 ) ( not ( = ?auto_1428035 ?auto_1428028 ) ) ( not ( = ?auto_1428025 ?auto_1428035 ) ) ( not ( = ?auto_1428026 ?auto_1428035 ) ) ( not ( = ?auto_1428034 ?auto_1428035 ) ) ( not ( = ?auto_1428032 ?auto_1428035 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428035 ?auto_1428028 )
      ( MAKE-2CRATE ?auto_1428028 ?auto_1428025 ?auto_1428026 )
      ( MAKE-1CRATE-VERIFY ?auto_1428025 ?auto_1428026 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1428036 - SURFACE
      ?auto_1428037 - SURFACE
      ?auto_1428038 - SURFACE
    )
    :vars
    (
      ?auto_1428041 - HOIST
      ?auto_1428042 - PLACE
      ?auto_1428043 - PLACE
      ?auto_1428044 - HOIST
      ?auto_1428040 - SURFACE
      ?auto_1428045 - SURFACE
      ?auto_1428046 - TRUCK
      ?auto_1428039 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428041 ?auto_1428042 ) ( IS-CRATE ?auto_1428038 ) ( not ( = ?auto_1428037 ?auto_1428038 ) ) ( not ( = ?auto_1428036 ?auto_1428037 ) ) ( not ( = ?auto_1428036 ?auto_1428038 ) ) ( not ( = ?auto_1428043 ?auto_1428042 ) ) ( HOIST-AT ?auto_1428044 ?auto_1428043 ) ( not ( = ?auto_1428041 ?auto_1428044 ) ) ( SURFACE-AT ?auto_1428038 ?auto_1428043 ) ( ON ?auto_1428038 ?auto_1428040 ) ( CLEAR ?auto_1428038 ) ( not ( = ?auto_1428037 ?auto_1428040 ) ) ( not ( = ?auto_1428038 ?auto_1428040 ) ) ( not ( = ?auto_1428036 ?auto_1428040 ) ) ( IS-CRATE ?auto_1428037 ) ( AVAILABLE ?auto_1428044 ) ( SURFACE-AT ?auto_1428037 ?auto_1428043 ) ( ON ?auto_1428037 ?auto_1428045 ) ( CLEAR ?auto_1428037 ) ( not ( = ?auto_1428037 ?auto_1428045 ) ) ( not ( = ?auto_1428038 ?auto_1428045 ) ) ( not ( = ?auto_1428036 ?auto_1428045 ) ) ( not ( = ?auto_1428040 ?auto_1428045 ) ) ( TRUCK-AT ?auto_1428046 ?auto_1428042 ) ( SURFACE-AT ?auto_1428039 ?auto_1428042 ) ( CLEAR ?auto_1428039 ) ( LIFTING ?auto_1428041 ?auto_1428036 ) ( IS-CRATE ?auto_1428036 ) ( not ( = ?auto_1428039 ?auto_1428036 ) ) ( not ( = ?auto_1428037 ?auto_1428039 ) ) ( not ( = ?auto_1428038 ?auto_1428039 ) ) ( not ( = ?auto_1428040 ?auto_1428039 ) ) ( not ( = ?auto_1428045 ?auto_1428039 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428037 ?auto_1428038 )
      ( MAKE-2CRATE-VERIFY ?auto_1428036 ?auto_1428037 ?auto_1428038 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1428047 - SURFACE
      ?auto_1428048 - SURFACE
      ?auto_1428049 - SURFACE
      ?auto_1428050 - SURFACE
    )
    :vars
    (
      ?auto_1428053 - HOIST
      ?auto_1428054 - PLACE
      ?auto_1428051 - PLACE
      ?auto_1428052 - HOIST
      ?auto_1428057 - SURFACE
      ?auto_1428055 - SURFACE
      ?auto_1428056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428053 ?auto_1428054 ) ( IS-CRATE ?auto_1428050 ) ( not ( = ?auto_1428049 ?auto_1428050 ) ) ( not ( = ?auto_1428048 ?auto_1428049 ) ) ( not ( = ?auto_1428048 ?auto_1428050 ) ) ( not ( = ?auto_1428051 ?auto_1428054 ) ) ( HOIST-AT ?auto_1428052 ?auto_1428051 ) ( not ( = ?auto_1428053 ?auto_1428052 ) ) ( SURFACE-AT ?auto_1428050 ?auto_1428051 ) ( ON ?auto_1428050 ?auto_1428057 ) ( CLEAR ?auto_1428050 ) ( not ( = ?auto_1428049 ?auto_1428057 ) ) ( not ( = ?auto_1428050 ?auto_1428057 ) ) ( not ( = ?auto_1428048 ?auto_1428057 ) ) ( IS-CRATE ?auto_1428049 ) ( AVAILABLE ?auto_1428052 ) ( SURFACE-AT ?auto_1428049 ?auto_1428051 ) ( ON ?auto_1428049 ?auto_1428055 ) ( CLEAR ?auto_1428049 ) ( not ( = ?auto_1428049 ?auto_1428055 ) ) ( not ( = ?auto_1428050 ?auto_1428055 ) ) ( not ( = ?auto_1428048 ?auto_1428055 ) ) ( not ( = ?auto_1428057 ?auto_1428055 ) ) ( TRUCK-AT ?auto_1428056 ?auto_1428054 ) ( SURFACE-AT ?auto_1428047 ?auto_1428054 ) ( CLEAR ?auto_1428047 ) ( LIFTING ?auto_1428053 ?auto_1428048 ) ( IS-CRATE ?auto_1428048 ) ( not ( = ?auto_1428047 ?auto_1428048 ) ) ( not ( = ?auto_1428049 ?auto_1428047 ) ) ( not ( = ?auto_1428050 ?auto_1428047 ) ) ( not ( = ?auto_1428057 ?auto_1428047 ) ) ( not ( = ?auto_1428055 ?auto_1428047 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428048 ?auto_1428049 ?auto_1428050 )
      ( MAKE-3CRATE-VERIFY ?auto_1428047 ?auto_1428048 ?auto_1428049 ?auto_1428050 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1428058 - SURFACE
      ?auto_1428059 - SURFACE
      ?auto_1428060 - SURFACE
      ?auto_1428062 - SURFACE
      ?auto_1428061 - SURFACE
    )
    :vars
    (
      ?auto_1428065 - HOIST
      ?auto_1428066 - PLACE
      ?auto_1428063 - PLACE
      ?auto_1428064 - HOIST
      ?auto_1428069 - SURFACE
      ?auto_1428067 - SURFACE
      ?auto_1428068 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428065 ?auto_1428066 ) ( IS-CRATE ?auto_1428061 ) ( not ( = ?auto_1428062 ?auto_1428061 ) ) ( not ( = ?auto_1428060 ?auto_1428062 ) ) ( not ( = ?auto_1428060 ?auto_1428061 ) ) ( not ( = ?auto_1428063 ?auto_1428066 ) ) ( HOIST-AT ?auto_1428064 ?auto_1428063 ) ( not ( = ?auto_1428065 ?auto_1428064 ) ) ( SURFACE-AT ?auto_1428061 ?auto_1428063 ) ( ON ?auto_1428061 ?auto_1428069 ) ( CLEAR ?auto_1428061 ) ( not ( = ?auto_1428062 ?auto_1428069 ) ) ( not ( = ?auto_1428061 ?auto_1428069 ) ) ( not ( = ?auto_1428060 ?auto_1428069 ) ) ( IS-CRATE ?auto_1428062 ) ( AVAILABLE ?auto_1428064 ) ( SURFACE-AT ?auto_1428062 ?auto_1428063 ) ( ON ?auto_1428062 ?auto_1428067 ) ( CLEAR ?auto_1428062 ) ( not ( = ?auto_1428062 ?auto_1428067 ) ) ( not ( = ?auto_1428061 ?auto_1428067 ) ) ( not ( = ?auto_1428060 ?auto_1428067 ) ) ( not ( = ?auto_1428069 ?auto_1428067 ) ) ( TRUCK-AT ?auto_1428068 ?auto_1428066 ) ( SURFACE-AT ?auto_1428059 ?auto_1428066 ) ( CLEAR ?auto_1428059 ) ( LIFTING ?auto_1428065 ?auto_1428060 ) ( IS-CRATE ?auto_1428060 ) ( not ( = ?auto_1428059 ?auto_1428060 ) ) ( not ( = ?auto_1428062 ?auto_1428059 ) ) ( not ( = ?auto_1428061 ?auto_1428059 ) ) ( not ( = ?auto_1428069 ?auto_1428059 ) ) ( not ( = ?auto_1428067 ?auto_1428059 ) ) ( ON ?auto_1428059 ?auto_1428058 ) ( not ( = ?auto_1428058 ?auto_1428059 ) ) ( not ( = ?auto_1428058 ?auto_1428060 ) ) ( not ( = ?auto_1428058 ?auto_1428062 ) ) ( not ( = ?auto_1428058 ?auto_1428061 ) ) ( not ( = ?auto_1428058 ?auto_1428069 ) ) ( not ( = ?auto_1428058 ?auto_1428067 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428060 ?auto_1428062 ?auto_1428061 )
      ( MAKE-4CRATE-VERIFY ?auto_1428058 ?auto_1428059 ?auto_1428060 ?auto_1428062 ?auto_1428061 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428505 - SURFACE
      ?auto_1428506 - SURFACE
      ?auto_1428507 - SURFACE
      ?auto_1428509 - SURFACE
      ?auto_1428508 - SURFACE
      ?auto_1428510 - SURFACE
    )
    :vars
    (
      ?auto_1428511 - HOIST
      ?auto_1428512 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428511 ?auto_1428512 ) ( SURFACE-AT ?auto_1428508 ?auto_1428512 ) ( CLEAR ?auto_1428508 ) ( LIFTING ?auto_1428511 ?auto_1428510 ) ( IS-CRATE ?auto_1428510 ) ( not ( = ?auto_1428508 ?auto_1428510 ) ) ( ON ?auto_1428506 ?auto_1428505 ) ( ON ?auto_1428507 ?auto_1428506 ) ( ON ?auto_1428509 ?auto_1428507 ) ( ON ?auto_1428508 ?auto_1428509 ) ( not ( = ?auto_1428505 ?auto_1428506 ) ) ( not ( = ?auto_1428505 ?auto_1428507 ) ) ( not ( = ?auto_1428505 ?auto_1428509 ) ) ( not ( = ?auto_1428505 ?auto_1428508 ) ) ( not ( = ?auto_1428505 ?auto_1428510 ) ) ( not ( = ?auto_1428506 ?auto_1428507 ) ) ( not ( = ?auto_1428506 ?auto_1428509 ) ) ( not ( = ?auto_1428506 ?auto_1428508 ) ) ( not ( = ?auto_1428506 ?auto_1428510 ) ) ( not ( = ?auto_1428507 ?auto_1428509 ) ) ( not ( = ?auto_1428507 ?auto_1428508 ) ) ( not ( = ?auto_1428507 ?auto_1428510 ) ) ( not ( = ?auto_1428509 ?auto_1428508 ) ) ( not ( = ?auto_1428509 ?auto_1428510 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1428508 ?auto_1428510 )
      ( MAKE-5CRATE-VERIFY ?auto_1428505 ?auto_1428506 ?auto_1428507 ?auto_1428509 ?auto_1428508 ?auto_1428510 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428539 - SURFACE
      ?auto_1428540 - SURFACE
      ?auto_1428541 - SURFACE
      ?auto_1428543 - SURFACE
      ?auto_1428542 - SURFACE
      ?auto_1428544 - SURFACE
    )
    :vars
    (
      ?auto_1428546 - HOIST
      ?auto_1428547 - PLACE
      ?auto_1428545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428546 ?auto_1428547 ) ( SURFACE-AT ?auto_1428542 ?auto_1428547 ) ( CLEAR ?auto_1428542 ) ( IS-CRATE ?auto_1428544 ) ( not ( = ?auto_1428542 ?auto_1428544 ) ) ( TRUCK-AT ?auto_1428545 ?auto_1428547 ) ( AVAILABLE ?auto_1428546 ) ( IN ?auto_1428544 ?auto_1428545 ) ( ON ?auto_1428542 ?auto_1428543 ) ( not ( = ?auto_1428543 ?auto_1428542 ) ) ( not ( = ?auto_1428543 ?auto_1428544 ) ) ( ON ?auto_1428540 ?auto_1428539 ) ( ON ?auto_1428541 ?auto_1428540 ) ( ON ?auto_1428543 ?auto_1428541 ) ( not ( = ?auto_1428539 ?auto_1428540 ) ) ( not ( = ?auto_1428539 ?auto_1428541 ) ) ( not ( = ?auto_1428539 ?auto_1428543 ) ) ( not ( = ?auto_1428539 ?auto_1428542 ) ) ( not ( = ?auto_1428539 ?auto_1428544 ) ) ( not ( = ?auto_1428540 ?auto_1428541 ) ) ( not ( = ?auto_1428540 ?auto_1428543 ) ) ( not ( = ?auto_1428540 ?auto_1428542 ) ) ( not ( = ?auto_1428540 ?auto_1428544 ) ) ( not ( = ?auto_1428541 ?auto_1428543 ) ) ( not ( = ?auto_1428541 ?auto_1428542 ) ) ( not ( = ?auto_1428541 ?auto_1428544 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428543 ?auto_1428542 ?auto_1428544 )
      ( MAKE-5CRATE-VERIFY ?auto_1428539 ?auto_1428540 ?auto_1428541 ?auto_1428543 ?auto_1428542 ?auto_1428544 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428579 - SURFACE
      ?auto_1428580 - SURFACE
      ?auto_1428581 - SURFACE
      ?auto_1428583 - SURFACE
      ?auto_1428582 - SURFACE
      ?auto_1428584 - SURFACE
    )
    :vars
    (
      ?auto_1428587 - HOIST
      ?auto_1428588 - PLACE
      ?auto_1428586 - TRUCK
      ?auto_1428585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428587 ?auto_1428588 ) ( SURFACE-AT ?auto_1428582 ?auto_1428588 ) ( CLEAR ?auto_1428582 ) ( IS-CRATE ?auto_1428584 ) ( not ( = ?auto_1428582 ?auto_1428584 ) ) ( AVAILABLE ?auto_1428587 ) ( IN ?auto_1428584 ?auto_1428586 ) ( ON ?auto_1428582 ?auto_1428583 ) ( not ( = ?auto_1428583 ?auto_1428582 ) ) ( not ( = ?auto_1428583 ?auto_1428584 ) ) ( TRUCK-AT ?auto_1428586 ?auto_1428585 ) ( not ( = ?auto_1428585 ?auto_1428588 ) ) ( ON ?auto_1428580 ?auto_1428579 ) ( ON ?auto_1428581 ?auto_1428580 ) ( ON ?auto_1428583 ?auto_1428581 ) ( not ( = ?auto_1428579 ?auto_1428580 ) ) ( not ( = ?auto_1428579 ?auto_1428581 ) ) ( not ( = ?auto_1428579 ?auto_1428583 ) ) ( not ( = ?auto_1428579 ?auto_1428582 ) ) ( not ( = ?auto_1428579 ?auto_1428584 ) ) ( not ( = ?auto_1428580 ?auto_1428581 ) ) ( not ( = ?auto_1428580 ?auto_1428583 ) ) ( not ( = ?auto_1428580 ?auto_1428582 ) ) ( not ( = ?auto_1428580 ?auto_1428584 ) ) ( not ( = ?auto_1428581 ?auto_1428583 ) ) ( not ( = ?auto_1428581 ?auto_1428582 ) ) ( not ( = ?auto_1428581 ?auto_1428584 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428583 ?auto_1428582 ?auto_1428584 )
      ( MAKE-5CRATE-VERIFY ?auto_1428579 ?auto_1428580 ?auto_1428581 ?auto_1428583 ?auto_1428582 ?auto_1428584 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428624 - SURFACE
      ?auto_1428625 - SURFACE
      ?auto_1428626 - SURFACE
      ?auto_1428628 - SURFACE
      ?auto_1428627 - SURFACE
      ?auto_1428629 - SURFACE
    )
    :vars
    (
      ?auto_1428634 - HOIST
      ?auto_1428633 - PLACE
      ?auto_1428630 - TRUCK
      ?auto_1428632 - PLACE
      ?auto_1428631 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428634 ?auto_1428633 ) ( SURFACE-AT ?auto_1428627 ?auto_1428633 ) ( CLEAR ?auto_1428627 ) ( IS-CRATE ?auto_1428629 ) ( not ( = ?auto_1428627 ?auto_1428629 ) ) ( AVAILABLE ?auto_1428634 ) ( ON ?auto_1428627 ?auto_1428628 ) ( not ( = ?auto_1428628 ?auto_1428627 ) ) ( not ( = ?auto_1428628 ?auto_1428629 ) ) ( TRUCK-AT ?auto_1428630 ?auto_1428632 ) ( not ( = ?auto_1428632 ?auto_1428633 ) ) ( HOIST-AT ?auto_1428631 ?auto_1428632 ) ( LIFTING ?auto_1428631 ?auto_1428629 ) ( not ( = ?auto_1428634 ?auto_1428631 ) ) ( ON ?auto_1428625 ?auto_1428624 ) ( ON ?auto_1428626 ?auto_1428625 ) ( ON ?auto_1428628 ?auto_1428626 ) ( not ( = ?auto_1428624 ?auto_1428625 ) ) ( not ( = ?auto_1428624 ?auto_1428626 ) ) ( not ( = ?auto_1428624 ?auto_1428628 ) ) ( not ( = ?auto_1428624 ?auto_1428627 ) ) ( not ( = ?auto_1428624 ?auto_1428629 ) ) ( not ( = ?auto_1428625 ?auto_1428626 ) ) ( not ( = ?auto_1428625 ?auto_1428628 ) ) ( not ( = ?auto_1428625 ?auto_1428627 ) ) ( not ( = ?auto_1428625 ?auto_1428629 ) ) ( not ( = ?auto_1428626 ?auto_1428628 ) ) ( not ( = ?auto_1428626 ?auto_1428627 ) ) ( not ( = ?auto_1428626 ?auto_1428629 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428628 ?auto_1428627 ?auto_1428629 )
      ( MAKE-5CRATE-VERIFY ?auto_1428624 ?auto_1428625 ?auto_1428626 ?auto_1428628 ?auto_1428627 ?auto_1428629 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428674 - SURFACE
      ?auto_1428675 - SURFACE
      ?auto_1428676 - SURFACE
      ?auto_1428678 - SURFACE
      ?auto_1428677 - SURFACE
      ?auto_1428679 - SURFACE
    )
    :vars
    (
      ?auto_1428682 - HOIST
      ?auto_1428684 - PLACE
      ?auto_1428680 - TRUCK
      ?auto_1428685 - PLACE
      ?auto_1428683 - HOIST
      ?auto_1428681 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428682 ?auto_1428684 ) ( SURFACE-AT ?auto_1428677 ?auto_1428684 ) ( CLEAR ?auto_1428677 ) ( IS-CRATE ?auto_1428679 ) ( not ( = ?auto_1428677 ?auto_1428679 ) ) ( AVAILABLE ?auto_1428682 ) ( ON ?auto_1428677 ?auto_1428678 ) ( not ( = ?auto_1428678 ?auto_1428677 ) ) ( not ( = ?auto_1428678 ?auto_1428679 ) ) ( TRUCK-AT ?auto_1428680 ?auto_1428685 ) ( not ( = ?auto_1428685 ?auto_1428684 ) ) ( HOIST-AT ?auto_1428683 ?auto_1428685 ) ( not ( = ?auto_1428682 ?auto_1428683 ) ) ( AVAILABLE ?auto_1428683 ) ( SURFACE-AT ?auto_1428679 ?auto_1428685 ) ( ON ?auto_1428679 ?auto_1428681 ) ( CLEAR ?auto_1428679 ) ( not ( = ?auto_1428677 ?auto_1428681 ) ) ( not ( = ?auto_1428679 ?auto_1428681 ) ) ( not ( = ?auto_1428678 ?auto_1428681 ) ) ( ON ?auto_1428675 ?auto_1428674 ) ( ON ?auto_1428676 ?auto_1428675 ) ( ON ?auto_1428678 ?auto_1428676 ) ( not ( = ?auto_1428674 ?auto_1428675 ) ) ( not ( = ?auto_1428674 ?auto_1428676 ) ) ( not ( = ?auto_1428674 ?auto_1428678 ) ) ( not ( = ?auto_1428674 ?auto_1428677 ) ) ( not ( = ?auto_1428674 ?auto_1428679 ) ) ( not ( = ?auto_1428674 ?auto_1428681 ) ) ( not ( = ?auto_1428675 ?auto_1428676 ) ) ( not ( = ?auto_1428675 ?auto_1428678 ) ) ( not ( = ?auto_1428675 ?auto_1428677 ) ) ( not ( = ?auto_1428675 ?auto_1428679 ) ) ( not ( = ?auto_1428675 ?auto_1428681 ) ) ( not ( = ?auto_1428676 ?auto_1428678 ) ) ( not ( = ?auto_1428676 ?auto_1428677 ) ) ( not ( = ?auto_1428676 ?auto_1428679 ) ) ( not ( = ?auto_1428676 ?auto_1428681 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428678 ?auto_1428677 ?auto_1428679 )
      ( MAKE-5CRATE-VERIFY ?auto_1428674 ?auto_1428675 ?auto_1428676 ?auto_1428678 ?auto_1428677 ?auto_1428679 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428725 - SURFACE
      ?auto_1428726 - SURFACE
      ?auto_1428727 - SURFACE
      ?auto_1428729 - SURFACE
      ?auto_1428728 - SURFACE
      ?auto_1428730 - SURFACE
    )
    :vars
    (
      ?auto_1428731 - HOIST
      ?auto_1428734 - PLACE
      ?auto_1428732 - PLACE
      ?auto_1428733 - HOIST
      ?auto_1428735 - SURFACE
      ?auto_1428736 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428731 ?auto_1428734 ) ( SURFACE-AT ?auto_1428728 ?auto_1428734 ) ( CLEAR ?auto_1428728 ) ( IS-CRATE ?auto_1428730 ) ( not ( = ?auto_1428728 ?auto_1428730 ) ) ( AVAILABLE ?auto_1428731 ) ( ON ?auto_1428728 ?auto_1428729 ) ( not ( = ?auto_1428729 ?auto_1428728 ) ) ( not ( = ?auto_1428729 ?auto_1428730 ) ) ( not ( = ?auto_1428732 ?auto_1428734 ) ) ( HOIST-AT ?auto_1428733 ?auto_1428732 ) ( not ( = ?auto_1428731 ?auto_1428733 ) ) ( AVAILABLE ?auto_1428733 ) ( SURFACE-AT ?auto_1428730 ?auto_1428732 ) ( ON ?auto_1428730 ?auto_1428735 ) ( CLEAR ?auto_1428730 ) ( not ( = ?auto_1428728 ?auto_1428735 ) ) ( not ( = ?auto_1428730 ?auto_1428735 ) ) ( not ( = ?auto_1428729 ?auto_1428735 ) ) ( TRUCK-AT ?auto_1428736 ?auto_1428734 ) ( ON ?auto_1428726 ?auto_1428725 ) ( ON ?auto_1428727 ?auto_1428726 ) ( ON ?auto_1428729 ?auto_1428727 ) ( not ( = ?auto_1428725 ?auto_1428726 ) ) ( not ( = ?auto_1428725 ?auto_1428727 ) ) ( not ( = ?auto_1428725 ?auto_1428729 ) ) ( not ( = ?auto_1428725 ?auto_1428728 ) ) ( not ( = ?auto_1428725 ?auto_1428730 ) ) ( not ( = ?auto_1428725 ?auto_1428735 ) ) ( not ( = ?auto_1428726 ?auto_1428727 ) ) ( not ( = ?auto_1428726 ?auto_1428729 ) ) ( not ( = ?auto_1428726 ?auto_1428728 ) ) ( not ( = ?auto_1428726 ?auto_1428730 ) ) ( not ( = ?auto_1428726 ?auto_1428735 ) ) ( not ( = ?auto_1428727 ?auto_1428729 ) ) ( not ( = ?auto_1428727 ?auto_1428728 ) ) ( not ( = ?auto_1428727 ?auto_1428730 ) ) ( not ( = ?auto_1428727 ?auto_1428735 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428729 ?auto_1428728 ?auto_1428730 )
      ( MAKE-5CRATE-VERIFY ?auto_1428725 ?auto_1428726 ?auto_1428727 ?auto_1428729 ?auto_1428728 ?auto_1428730 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428776 - SURFACE
      ?auto_1428777 - SURFACE
      ?auto_1428778 - SURFACE
      ?auto_1428780 - SURFACE
      ?auto_1428779 - SURFACE
      ?auto_1428781 - SURFACE
    )
    :vars
    (
      ?auto_1428782 - HOIST
      ?auto_1428787 - PLACE
      ?auto_1428785 - PLACE
      ?auto_1428786 - HOIST
      ?auto_1428784 - SURFACE
      ?auto_1428783 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428782 ?auto_1428787 ) ( IS-CRATE ?auto_1428781 ) ( not ( = ?auto_1428779 ?auto_1428781 ) ) ( not ( = ?auto_1428780 ?auto_1428779 ) ) ( not ( = ?auto_1428780 ?auto_1428781 ) ) ( not ( = ?auto_1428785 ?auto_1428787 ) ) ( HOIST-AT ?auto_1428786 ?auto_1428785 ) ( not ( = ?auto_1428782 ?auto_1428786 ) ) ( AVAILABLE ?auto_1428786 ) ( SURFACE-AT ?auto_1428781 ?auto_1428785 ) ( ON ?auto_1428781 ?auto_1428784 ) ( CLEAR ?auto_1428781 ) ( not ( = ?auto_1428779 ?auto_1428784 ) ) ( not ( = ?auto_1428781 ?auto_1428784 ) ) ( not ( = ?auto_1428780 ?auto_1428784 ) ) ( TRUCK-AT ?auto_1428783 ?auto_1428787 ) ( SURFACE-AT ?auto_1428780 ?auto_1428787 ) ( CLEAR ?auto_1428780 ) ( LIFTING ?auto_1428782 ?auto_1428779 ) ( IS-CRATE ?auto_1428779 ) ( ON ?auto_1428777 ?auto_1428776 ) ( ON ?auto_1428778 ?auto_1428777 ) ( ON ?auto_1428780 ?auto_1428778 ) ( not ( = ?auto_1428776 ?auto_1428777 ) ) ( not ( = ?auto_1428776 ?auto_1428778 ) ) ( not ( = ?auto_1428776 ?auto_1428780 ) ) ( not ( = ?auto_1428776 ?auto_1428779 ) ) ( not ( = ?auto_1428776 ?auto_1428781 ) ) ( not ( = ?auto_1428776 ?auto_1428784 ) ) ( not ( = ?auto_1428777 ?auto_1428778 ) ) ( not ( = ?auto_1428777 ?auto_1428780 ) ) ( not ( = ?auto_1428777 ?auto_1428779 ) ) ( not ( = ?auto_1428777 ?auto_1428781 ) ) ( not ( = ?auto_1428777 ?auto_1428784 ) ) ( not ( = ?auto_1428778 ?auto_1428780 ) ) ( not ( = ?auto_1428778 ?auto_1428779 ) ) ( not ( = ?auto_1428778 ?auto_1428781 ) ) ( not ( = ?auto_1428778 ?auto_1428784 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428780 ?auto_1428779 ?auto_1428781 )
      ( MAKE-5CRATE-VERIFY ?auto_1428776 ?auto_1428777 ?auto_1428778 ?auto_1428780 ?auto_1428779 ?auto_1428781 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428827 - SURFACE
      ?auto_1428828 - SURFACE
      ?auto_1428829 - SURFACE
      ?auto_1428831 - SURFACE
      ?auto_1428830 - SURFACE
      ?auto_1428832 - SURFACE
    )
    :vars
    (
      ?auto_1428833 - HOIST
      ?auto_1428835 - PLACE
      ?auto_1428837 - PLACE
      ?auto_1428834 - HOIST
      ?auto_1428836 - SURFACE
      ?auto_1428838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428833 ?auto_1428835 ) ( IS-CRATE ?auto_1428832 ) ( not ( = ?auto_1428830 ?auto_1428832 ) ) ( not ( = ?auto_1428831 ?auto_1428830 ) ) ( not ( = ?auto_1428831 ?auto_1428832 ) ) ( not ( = ?auto_1428837 ?auto_1428835 ) ) ( HOIST-AT ?auto_1428834 ?auto_1428837 ) ( not ( = ?auto_1428833 ?auto_1428834 ) ) ( AVAILABLE ?auto_1428834 ) ( SURFACE-AT ?auto_1428832 ?auto_1428837 ) ( ON ?auto_1428832 ?auto_1428836 ) ( CLEAR ?auto_1428832 ) ( not ( = ?auto_1428830 ?auto_1428836 ) ) ( not ( = ?auto_1428832 ?auto_1428836 ) ) ( not ( = ?auto_1428831 ?auto_1428836 ) ) ( TRUCK-AT ?auto_1428838 ?auto_1428835 ) ( SURFACE-AT ?auto_1428831 ?auto_1428835 ) ( CLEAR ?auto_1428831 ) ( IS-CRATE ?auto_1428830 ) ( AVAILABLE ?auto_1428833 ) ( IN ?auto_1428830 ?auto_1428838 ) ( ON ?auto_1428828 ?auto_1428827 ) ( ON ?auto_1428829 ?auto_1428828 ) ( ON ?auto_1428831 ?auto_1428829 ) ( not ( = ?auto_1428827 ?auto_1428828 ) ) ( not ( = ?auto_1428827 ?auto_1428829 ) ) ( not ( = ?auto_1428827 ?auto_1428831 ) ) ( not ( = ?auto_1428827 ?auto_1428830 ) ) ( not ( = ?auto_1428827 ?auto_1428832 ) ) ( not ( = ?auto_1428827 ?auto_1428836 ) ) ( not ( = ?auto_1428828 ?auto_1428829 ) ) ( not ( = ?auto_1428828 ?auto_1428831 ) ) ( not ( = ?auto_1428828 ?auto_1428830 ) ) ( not ( = ?auto_1428828 ?auto_1428832 ) ) ( not ( = ?auto_1428828 ?auto_1428836 ) ) ( not ( = ?auto_1428829 ?auto_1428831 ) ) ( not ( = ?auto_1428829 ?auto_1428830 ) ) ( not ( = ?auto_1428829 ?auto_1428832 ) ) ( not ( = ?auto_1428829 ?auto_1428836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428831 ?auto_1428830 ?auto_1428832 )
      ( MAKE-5CRATE-VERIFY ?auto_1428827 ?auto_1428828 ?auto_1428829 ?auto_1428831 ?auto_1428830 ?auto_1428832 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428878 - SURFACE
      ?auto_1428879 - SURFACE
      ?auto_1428880 - SURFACE
      ?auto_1428882 - SURFACE
      ?auto_1428881 - SURFACE
      ?auto_1428883 - SURFACE
    )
    :vars
    (
      ?auto_1428886 - HOIST
      ?auto_1428885 - PLACE
      ?auto_1428887 - PLACE
      ?auto_1428888 - HOIST
      ?auto_1428889 - SURFACE
      ?auto_1428884 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428886 ?auto_1428885 ) ( IS-CRATE ?auto_1428883 ) ( not ( = ?auto_1428881 ?auto_1428883 ) ) ( not ( = ?auto_1428882 ?auto_1428881 ) ) ( not ( = ?auto_1428882 ?auto_1428883 ) ) ( not ( = ?auto_1428887 ?auto_1428885 ) ) ( HOIST-AT ?auto_1428888 ?auto_1428887 ) ( not ( = ?auto_1428886 ?auto_1428888 ) ) ( AVAILABLE ?auto_1428888 ) ( SURFACE-AT ?auto_1428883 ?auto_1428887 ) ( ON ?auto_1428883 ?auto_1428889 ) ( CLEAR ?auto_1428883 ) ( not ( = ?auto_1428881 ?auto_1428889 ) ) ( not ( = ?auto_1428883 ?auto_1428889 ) ) ( not ( = ?auto_1428882 ?auto_1428889 ) ) ( SURFACE-AT ?auto_1428882 ?auto_1428885 ) ( CLEAR ?auto_1428882 ) ( IS-CRATE ?auto_1428881 ) ( AVAILABLE ?auto_1428886 ) ( IN ?auto_1428881 ?auto_1428884 ) ( TRUCK-AT ?auto_1428884 ?auto_1428887 ) ( ON ?auto_1428879 ?auto_1428878 ) ( ON ?auto_1428880 ?auto_1428879 ) ( ON ?auto_1428882 ?auto_1428880 ) ( not ( = ?auto_1428878 ?auto_1428879 ) ) ( not ( = ?auto_1428878 ?auto_1428880 ) ) ( not ( = ?auto_1428878 ?auto_1428882 ) ) ( not ( = ?auto_1428878 ?auto_1428881 ) ) ( not ( = ?auto_1428878 ?auto_1428883 ) ) ( not ( = ?auto_1428878 ?auto_1428889 ) ) ( not ( = ?auto_1428879 ?auto_1428880 ) ) ( not ( = ?auto_1428879 ?auto_1428882 ) ) ( not ( = ?auto_1428879 ?auto_1428881 ) ) ( not ( = ?auto_1428879 ?auto_1428883 ) ) ( not ( = ?auto_1428879 ?auto_1428889 ) ) ( not ( = ?auto_1428880 ?auto_1428882 ) ) ( not ( = ?auto_1428880 ?auto_1428881 ) ) ( not ( = ?auto_1428880 ?auto_1428883 ) ) ( not ( = ?auto_1428880 ?auto_1428889 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428882 ?auto_1428881 ?auto_1428883 )
      ( MAKE-5CRATE-VERIFY ?auto_1428878 ?auto_1428879 ?auto_1428880 ?auto_1428882 ?auto_1428881 ?auto_1428883 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428929 - SURFACE
      ?auto_1428930 - SURFACE
      ?auto_1428931 - SURFACE
      ?auto_1428933 - SURFACE
      ?auto_1428932 - SURFACE
      ?auto_1428934 - SURFACE
    )
    :vars
    (
      ?auto_1428936 - HOIST
      ?auto_1428935 - PLACE
      ?auto_1428937 - PLACE
      ?auto_1428938 - HOIST
      ?auto_1428940 - SURFACE
      ?auto_1428939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428936 ?auto_1428935 ) ( IS-CRATE ?auto_1428934 ) ( not ( = ?auto_1428932 ?auto_1428934 ) ) ( not ( = ?auto_1428933 ?auto_1428932 ) ) ( not ( = ?auto_1428933 ?auto_1428934 ) ) ( not ( = ?auto_1428937 ?auto_1428935 ) ) ( HOIST-AT ?auto_1428938 ?auto_1428937 ) ( not ( = ?auto_1428936 ?auto_1428938 ) ) ( SURFACE-AT ?auto_1428934 ?auto_1428937 ) ( ON ?auto_1428934 ?auto_1428940 ) ( CLEAR ?auto_1428934 ) ( not ( = ?auto_1428932 ?auto_1428940 ) ) ( not ( = ?auto_1428934 ?auto_1428940 ) ) ( not ( = ?auto_1428933 ?auto_1428940 ) ) ( SURFACE-AT ?auto_1428933 ?auto_1428935 ) ( CLEAR ?auto_1428933 ) ( IS-CRATE ?auto_1428932 ) ( AVAILABLE ?auto_1428936 ) ( TRUCK-AT ?auto_1428939 ?auto_1428937 ) ( LIFTING ?auto_1428938 ?auto_1428932 ) ( ON ?auto_1428930 ?auto_1428929 ) ( ON ?auto_1428931 ?auto_1428930 ) ( ON ?auto_1428933 ?auto_1428931 ) ( not ( = ?auto_1428929 ?auto_1428930 ) ) ( not ( = ?auto_1428929 ?auto_1428931 ) ) ( not ( = ?auto_1428929 ?auto_1428933 ) ) ( not ( = ?auto_1428929 ?auto_1428932 ) ) ( not ( = ?auto_1428929 ?auto_1428934 ) ) ( not ( = ?auto_1428929 ?auto_1428940 ) ) ( not ( = ?auto_1428930 ?auto_1428931 ) ) ( not ( = ?auto_1428930 ?auto_1428933 ) ) ( not ( = ?auto_1428930 ?auto_1428932 ) ) ( not ( = ?auto_1428930 ?auto_1428934 ) ) ( not ( = ?auto_1428930 ?auto_1428940 ) ) ( not ( = ?auto_1428931 ?auto_1428933 ) ) ( not ( = ?auto_1428931 ?auto_1428932 ) ) ( not ( = ?auto_1428931 ?auto_1428934 ) ) ( not ( = ?auto_1428931 ?auto_1428940 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428933 ?auto_1428932 ?auto_1428934 )
      ( MAKE-5CRATE-VERIFY ?auto_1428929 ?auto_1428930 ?auto_1428931 ?auto_1428933 ?auto_1428932 ?auto_1428934 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1428984 - SURFACE
      ?auto_1428985 - SURFACE
      ?auto_1428986 - SURFACE
      ?auto_1428988 - SURFACE
      ?auto_1428987 - SURFACE
      ?auto_1428989 - SURFACE
    )
    :vars
    (
      ?auto_1428992 - HOIST
      ?auto_1428991 - PLACE
      ?auto_1428990 - PLACE
      ?auto_1428995 - HOIST
      ?auto_1428993 - SURFACE
      ?auto_1428994 - TRUCK
      ?auto_1428996 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1428992 ?auto_1428991 ) ( IS-CRATE ?auto_1428989 ) ( not ( = ?auto_1428987 ?auto_1428989 ) ) ( not ( = ?auto_1428988 ?auto_1428987 ) ) ( not ( = ?auto_1428988 ?auto_1428989 ) ) ( not ( = ?auto_1428990 ?auto_1428991 ) ) ( HOIST-AT ?auto_1428995 ?auto_1428990 ) ( not ( = ?auto_1428992 ?auto_1428995 ) ) ( SURFACE-AT ?auto_1428989 ?auto_1428990 ) ( ON ?auto_1428989 ?auto_1428993 ) ( CLEAR ?auto_1428989 ) ( not ( = ?auto_1428987 ?auto_1428993 ) ) ( not ( = ?auto_1428989 ?auto_1428993 ) ) ( not ( = ?auto_1428988 ?auto_1428993 ) ) ( SURFACE-AT ?auto_1428988 ?auto_1428991 ) ( CLEAR ?auto_1428988 ) ( IS-CRATE ?auto_1428987 ) ( AVAILABLE ?auto_1428992 ) ( TRUCK-AT ?auto_1428994 ?auto_1428990 ) ( AVAILABLE ?auto_1428995 ) ( SURFACE-AT ?auto_1428987 ?auto_1428990 ) ( ON ?auto_1428987 ?auto_1428996 ) ( CLEAR ?auto_1428987 ) ( not ( = ?auto_1428987 ?auto_1428996 ) ) ( not ( = ?auto_1428989 ?auto_1428996 ) ) ( not ( = ?auto_1428988 ?auto_1428996 ) ) ( not ( = ?auto_1428993 ?auto_1428996 ) ) ( ON ?auto_1428985 ?auto_1428984 ) ( ON ?auto_1428986 ?auto_1428985 ) ( ON ?auto_1428988 ?auto_1428986 ) ( not ( = ?auto_1428984 ?auto_1428985 ) ) ( not ( = ?auto_1428984 ?auto_1428986 ) ) ( not ( = ?auto_1428984 ?auto_1428988 ) ) ( not ( = ?auto_1428984 ?auto_1428987 ) ) ( not ( = ?auto_1428984 ?auto_1428989 ) ) ( not ( = ?auto_1428984 ?auto_1428993 ) ) ( not ( = ?auto_1428984 ?auto_1428996 ) ) ( not ( = ?auto_1428985 ?auto_1428986 ) ) ( not ( = ?auto_1428985 ?auto_1428988 ) ) ( not ( = ?auto_1428985 ?auto_1428987 ) ) ( not ( = ?auto_1428985 ?auto_1428989 ) ) ( not ( = ?auto_1428985 ?auto_1428993 ) ) ( not ( = ?auto_1428985 ?auto_1428996 ) ) ( not ( = ?auto_1428986 ?auto_1428988 ) ) ( not ( = ?auto_1428986 ?auto_1428987 ) ) ( not ( = ?auto_1428986 ?auto_1428989 ) ) ( not ( = ?auto_1428986 ?auto_1428993 ) ) ( not ( = ?auto_1428986 ?auto_1428996 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1428988 ?auto_1428987 ?auto_1428989 )
      ( MAKE-5CRATE-VERIFY ?auto_1428984 ?auto_1428985 ?auto_1428986 ?auto_1428988 ?auto_1428987 ?auto_1428989 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429040 - SURFACE
      ?auto_1429041 - SURFACE
      ?auto_1429042 - SURFACE
      ?auto_1429044 - SURFACE
      ?auto_1429043 - SURFACE
      ?auto_1429045 - SURFACE
    )
    :vars
    (
      ?auto_1429047 - HOIST
      ?auto_1429049 - PLACE
      ?auto_1429051 - PLACE
      ?auto_1429048 - HOIST
      ?auto_1429050 - SURFACE
      ?auto_1429046 - SURFACE
      ?auto_1429052 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429047 ?auto_1429049 ) ( IS-CRATE ?auto_1429045 ) ( not ( = ?auto_1429043 ?auto_1429045 ) ) ( not ( = ?auto_1429044 ?auto_1429043 ) ) ( not ( = ?auto_1429044 ?auto_1429045 ) ) ( not ( = ?auto_1429051 ?auto_1429049 ) ) ( HOIST-AT ?auto_1429048 ?auto_1429051 ) ( not ( = ?auto_1429047 ?auto_1429048 ) ) ( SURFACE-AT ?auto_1429045 ?auto_1429051 ) ( ON ?auto_1429045 ?auto_1429050 ) ( CLEAR ?auto_1429045 ) ( not ( = ?auto_1429043 ?auto_1429050 ) ) ( not ( = ?auto_1429045 ?auto_1429050 ) ) ( not ( = ?auto_1429044 ?auto_1429050 ) ) ( SURFACE-AT ?auto_1429044 ?auto_1429049 ) ( CLEAR ?auto_1429044 ) ( IS-CRATE ?auto_1429043 ) ( AVAILABLE ?auto_1429047 ) ( AVAILABLE ?auto_1429048 ) ( SURFACE-AT ?auto_1429043 ?auto_1429051 ) ( ON ?auto_1429043 ?auto_1429046 ) ( CLEAR ?auto_1429043 ) ( not ( = ?auto_1429043 ?auto_1429046 ) ) ( not ( = ?auto_1429045 ?auto_1429046 ) ) ( not ( = ?auto_1429044 ?auto_1429046 ) ) ( not ( = ?auto_1429050 ?auto_1429046 ) ) ( TRUCK-AT ?auto_1429052 ?auto_1429049 ) ( ON ?auto_1429041 ?auto_1429040 ) ( ON ?auto_1429042 ?auto_1429041 ) ( ON ?auto_1429044 ?auto_1429042 ) ( not ( = ?auto_1429040 ?auto_1429041 ) ) ( not ( = ?auto_1429040 ?auto_1429042 ) ) ( not ( = ?auto_1429040 ?auto_1429044 ) ) ( not ( = ?auto_1429040 ?auto_1429043 ) ) ( not ( = ?auto_1429040 ?auto_1429045 ) ) ( not ( = ?auto_1429040 ?auto_1429050 ) ) ( not ( = ?auto_1429040 ?auto_1429046 ) ) ( not ( = ?auto_1429041 ?auto_1429042 ) ) ( not ( = ?auto_1429041 ?auto_1429044 ) ) ( not ( = ?auto_1429041 ?auto_1429043 ) ) ( not ( = ?auto_1429041 ?auto_1429045 ) ) ( not ( = ?auto_1429041 ?auto_1429050 ) ) ( not ( = ?auto_1429041 ?auto_1429046 ) ) ( not ( = ?auto_1429042 ?auto_1429044 ) ) ( not ( = ?auto_1429042 ?auto_1429043 ) ) ( not ( = ?auto_1429042 ?auto_1429045 ) ) ( not ( = ?auto_1429042 ?auto_1429050 ) ) ( not ( = ?auto_1429042 ?auto_1429046 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429044 ?auto_1429043 ?auto_1429045 )
      ( MAKE-5CRATE-VERIFY ?auto_1429040 ?auto_1429041 ?auto_1429042 ?auto_1429044 ?auto_1429043 ?auto_1429045 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1429098 - SURFACE
      ?auto_1429099 - SURFACE
      ?auto_1429100 - SURFACE
      ?auto_1429102 - SURFACE
      ?auto_1429101 - SURFACE
      ?auto_1429103 - SURFACE
    )
    :vars
    (
      ?auto_1429105 - HOIST
      ?auto_1429106 - PLACE
      ?auto_1429107 - PLACE
      ?auto_1429110 - HOIST
      ?auto_1429109 - SURFACE
      ?auto_1429108 - SURFACE
      ?auto_1429104 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429105 ?auto_1429106 ) ( IS-CRATE ?auto_1429103 ) ( not ( = ?auto_1429101 ?auto_1429103 ) ) ( not ( = ?auto_1429102 ?auto_1429101 ) ) ( not ( = ?auto_1429102 ?auto_1429103 ) ) ( not ( = ?auto_1429107 ?auto_1429106 ) ) ( HOIST-AT ?auto_1429110 ?auto_1429107 ) ( not ( = ?auto_1429105 ?auto_1429110 ) ) ( SURFACE-AT ?auto_1429103 ?auto_1429107 ) ( ON ?auto_1429103 ?auto_1429109 ) ( CLEAR ?auto_1429103 ) ( not ( = ?auto_1429101 ?auto_1429109 ) ) ( not ( = ?auto_1429103 ?auto_1429109 ) ) ( not ( = ?auto_1429102 ?auto_1429109 ) ) ( IS-CRATE ?auto_1429101 ) ( AVAILABLE ?auto_1429110 ) ( SURFACE-AT ?auto_1429101 ?auto_1429107 ) ( ON ?auto_1429101 ?auto_1429108 ) ( CLEAR ?auto_1429101 ) ( not ( = ?auto_1429101 ?auto_1429108 ) ) ( not ( = ?auto_1429103 ?auto_1429108 ) ) ( not ( = ?auto_1429102 ?auto_1429108 ) ) ( not ( = ?auto_1429109 ?auto_1429108 ) ) ( TRUCK-AT ?auto_1429104 ?auto_1429106 ) ( SURFACE-AT ?auto_1429100 ?auto_1429106 ) ( CLEAR ?auto_1429100 ) ( LIFTING ?auto_1429105 ?auto_1429102 ) ( IS-CRATE ?auto_1429102 ) ( not ( = ?auto_1429100 ?auto_1429102 ) ) ( not ( = ?auto_1429101 ?auto_1429100 ) ) ( not ( = ?auto_1429103 ?auto_1429100 ) ) ( not ( = ?auto_1429109 ?auto_1429100 ) ) ( not ( = ?auto_1429108 ?auto_1429100 ) ) ( ON ?auto_1429099 ?auto_1429098 ) ( ON ?auto_1429100 ?auto_1429099 ) ( not ( = ?auto_1429098 ?auto_1429099 ) ) ( not ( = ?auto_1429098 ?auto_1429100 ) ) ( not ( = ?auto_1429098 ?auto_1429102 ) ) ( not ( = ?auto_1429098 ?auto_1429101 ) ) ( not ( = ?auto_1429098 ?auto_1429103 ) ) ( not ( = ?auto_1429098 ?auto_1429109 ) ) ( not ( = ?auto_1429098 ?auto_1429108 ) ) ( not ( = ?auto_1429099 ?auto_1429100 ) ) ( not ( = ?auto_1429099 ?auto_1429102 ) ) ( not ( = ?auto_1429099 ?auto_1429101 ) ) ( not ( = ?auto_1429099 ?auto_1429103 ) ) ( not ( = ?auto_1429099 ?auto_1429109 ) ) ( not ( = ?auto_1429099 ?auto_1429108 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1429102 ?auto_1429101 ?auto_1429103 )
      ( MAKE-5CRATE-VERIFY ?auto_1429098 ?auto_1429099 ?auto_1429100 ?auto_1429102 ?auto_1429101 ?auto_1429103 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1429212 - SURFACE
      ?auto_1429213 - SURFACE
    )
    :vars
    (
      ?auto_1429220 - HOIST
      ?auto_1429218 - PLACE
      ?auto_1429221 - SURFACE
      ?auto_1429216 - PLACE
      ?auto_1429219 - HOIST
      ?auto_1429215 - SURFACE
      ?auto_1429217 - TRUCK
      ?auto_1429214 - SURFACE
      ?auto_1429222 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1429220 ?auto_1429218 ) ( IS-CRATE ?auto_1429213 ) ( not ( = ?auto_1429212 ?auto_1429213 ) ) ( not ( = ?auto_1429221 ?auto_1429212 ) ) ( not ( = ?auto_1429221 ?auto_1429213 ) ) ( not ( = ?auto_1429216 ?auto_1429218 ) ) ( HOIST-AT ?auto_1429219 ?auto_1429216 ) ( not ( = ?auto_1429220 ?auto_1429219 ) ) ( SURFACE-AT ?auto_1429213 ?auto_1429216 ) ( ON ?auto_1429213 ?auto_1429215 ) ( CLEAR ?auto_1429213 ) ( not ( = ?auto_1429212 ?auto_1429215 ) ) ( not ( = ?auto_1429213 ?auto_1429215 ) ) ( not ( = ?auto_1429221 ?auto_1429215 ) ) ( SURFACE-AT ?auto_1429221 ?auto_1429218 ) ( CLEAR ?auto_1429221 ) ( IS-CRATE ?auto_1429212 ) ( AVAILABLE ?auto_1429220 ) ( TRUCK-AT ?auto_1429217 ?auto_1429216 ) ( SURFACE-AT ?auto_1429212 ?auto_1429216 ) ( ON ?auto_1429212 ?auto_1429214 ) ( CLEAR ?auto_1429212 ) ( not ( = ?auto_1429212 ?auto_1429214 ) ) ( not ( = ?auto_1429213 ?auto_1429214 ) ) ( not ( = ?auto_1429221 ?auto_1429214 ) ) ( not ( = ?auto_1429215 ?auto_1429214 ) ) ( LIFTING ?auto_1429219 ?auto_1429222 ) ( IS-CRATE ?auto_1429222 ) ( not ( = ?auto_1429212 ?auto_1429222 ) ) ( not ( = ?auto_1429213 ?auto_1429222 ) ) ( not ( = ?auto_1429221 ?auto_1429222 ) ) ( not ( = ?auto_1429215 ?auto_1429222 ) ) ( not ( = ?auto_1429214 ?auto_1429222 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1429219 ?auto_1429222 ?auto_1429217 ?auto_1429216 )
      ( MAKE-1CRATE ?auto_1429212 ?auto_1429213 )
      ( MAKE-1CRATE-VERIFY ?auto_1429212 ?auto_1429213 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430047 - SURFACE
      ?auto_1430048 - SURFACE
      ?auto_1430049 - SURFACE
      ?auto_1430051 - SURFACE
      ?auto_1430050 - SURFACE
      ?auto_1430052 - SURFACE
      ?auto_1430053 - SURFACE
    )
    :vars
    (
      ?auto_1430054 - HOIST
      ?auto_1430055 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430054 ?auto_1430055 ) ( SURFACE-AT ?auto_1430052 ?auto_1430055 ) ( CLEAR ?auto_1430052 ) ( LIFTING ?auto_1430054 ?auto_1430053 ) ( IS-CRATE ?auto_1430053 ) ( not ( = ?auto_1430052 ?auto_1430053 ) ) ( ON ?auto_1430048 ?auto_1430047 ) ( ON ?auto_1430049 ?auto_1430048 ) ( ON ?auto_1430051 ?auto_1430049 ) ( ON ?auto_1430050 ?auto_1430051 ) ( ON ?auto_1430052 ?auto_1430050 ) ( not ( = ?auto_1430047 ?auto_1430048 ) ) ( not ( = ?auto_1430047 ?auto_1430049 ) ) ( not ( = ?auto_1430047 ?auto_1430051 ) ) ( not ( = ?auto_1430047 ?auto_1430050 ) ) ( not ( = ?auto_1430047 ?auto_1430052 ) ) ( not ( = ?auto_1430047 ?auto_1430053 ) ) ( not ( = ?auto_1430048 ?auto_1430049 ) ) ( not ( = ?auto_1430048 ?auto_1430051 ) ) ( not ( = ?auto_1430048 ?auto_1430050 ) ) ( not ( = ?auto_1430048 ?auto_1430052 ) ) ( not ( = ?auto_1430048 ?auto_1430053 ) ) ( not ( = ?auto_1430049 ?auto_1430051 ) ) ( not ( = ?auto_1430049 ?auto_1430050 ) ) ( not ( = ?auto_1430049 ?auto_1430052 ) ) ( not ( = ?auto_1430049 ?auto_1430053 ) ) ( not ( = ?auto_1430051 ?auto_1430050 ) ) ( not ( = ?auto_1430051 ?auto_1430052 ) ) ( not ( = ?auto_1430051 ?auto_1430053 ) ) ( not ( = ?auto_1430050 ?auto_1430052 ) ) ( not ( = ?auto_1430050 ?auto_1430053 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1430052 ?auto_1430053 )
      ( MAKE-6CRATE-VERIFY ?auto_1430047 ?auto_1430048 ?auto_1430049 ?auto_1430051 ?auto_1430050 ?auto_1430052 ?auto_1430053 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430091 - SURFACE
      ?auto_1430092 - SURFACE
      ?auto_1430093 - SURFACE
      ?auto_1430095 - SURFACE
      ?auto_1430094 - SURFACE
      ?auto_1430096 - SURFACE
      ?auto_1430097 - SURFACE
    )
    :vars
    (
      ?auto_1430098 - HOIST
      ?auto_1430100 - PLACE
      ?auto_1430099 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430098 ?auto_1430100 ) ( SURFACE-AT ?auto_1430096 ?auto_1430100 ) ( CLEAR ?auto_1430096 ) ( IS-CRATE ?auto_1430097 ) ( not ( = ?auto_1430096 ?auto_1430097 ) ) ( TRUCK-AT ?auto_1430099 ?auto_1430100 ) ( AVAILABLE ?auto_1430098 ) ( IN ?auto_1430097 ?auto_1430099 ) ( ON ?auto_1430096 ?auto_1430094 ) ( not ( = ?auto_1430094 ?auto_1430096 ) ) ( not ( = ?auto_1430094 ?auto_1430097 ) ) ( ON ?auto_1430092 ?auto_1430091 ) ( ON ?auto_1430093 ?auto_1430092 ) ( ON ?auto_1430095 ?auto_1430093 ) ( ON ?auto_1430094 ?auto_1430095 ) ( not ( = ?auto_1430091 ?auto_1430092 ) ) ( not ( = ?auto_1430091 ?auto_1430093 ) ) ( not ( = ?auto_1430091 ?auto_1430095 ) ) ( not ( = ?auto_1430091 ?auto_1430094 ) ) ( not ( = ?auto_1430091 ?auto_1430096 ) ) ( not ( = ?auto_1430091 ?auto_1430097 ) ) ( not ( = ?auto_1430092 ?auto_1430093 ) ) ( not ( = ?auto_1430092 ?auto_1430095 ) ) ( not ( = ?auto_1430092 ?auto_1430094 ) ) ( not ( = ?auto_1430092 ?auto_1430096 ) ) ( not ( = ?auto_1430092 ?auto_1430097 ) ) ( not ( = ?auto_1430093 ?auto_1430095 ) ) ( not ( = ?auto_1430093 ?auto_1430094 ) ) ( not ( = ?auto_1430093 ?auto_1430096 ) ) ( not ( = ?auto_1430093 ?auto_1430097 ) ) ( not ( = ?auto_1430095 ?auto_1430094 ) ) ( not ( = ?auto_1430095 ?auto_1430096 ) ) ( not ( = ?auto_1430095 ?auto_1430097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430094 ?auto_1430096 ?auto_1430097 )
      ( MAKE-6CRATE-VERIFY ?auto_1430091 ?auto_1430092 ?auto_1430093 ?auto_1430095 ?auto_1430094 ?auto_1430096 ?auto_1430097 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430142 - SURFACE
      ?auto_1430143 - SURFACE
      ?auto_1430144 - SURFACE
      ?auto_1430146 - SURFACE
      ?auto_1430145 - SURFACE
      ?auto_1430147 - SURFACE
      ?auto_1430148 - SURFACE
    )
    :vars
    (
      ?auto_1430152 - HOIST
      ?auto_1430150 - PLACE
      ?auto_1430149 - TRUCK
      ?auto_1430151 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430152 ?auto_1430150 ) ( SURFACE-AT ?auto_1430147 ?auto_1430150 ) ( CLEAR ?auto_1430147 ) ( IS-CRATE ?auto_1430148 ) ( not ( = ?auto_1430147 ?auto_1430148 ) ) ( AVAILABLE ?auto_1430152 ) ( IN ?auto_1430148 ?auto_1430149 ) ( ON ?auto_1430147 ?auto_1430145 ) ( not ( = ?auto_1430145 ?auto_1430147 ) ) ( not ( = ?auto_1430145 ?auto_1430148 ) ) ( TRUCK-AT ?auto_1430149 ?auto_1430151 ) ( not ( = ?auto_1430151 ?auto_1430150 ) ) ( ON ?auto_1430143 ?auto_1430142 ) ( ON ?auto_1430144 ?auto_1430143 ) ( ON ?auto_1430146 ?auto_1430144 ) ( ON ?auto_1430145 ?auto_1430146 ) ( not ( = ?auto_1430142 ?auto_1430143 ) ) ( not ( = ?auto_1430142 ?auto_1430144 ) ) ( not ( = ?auto_1430142 ?auto_1430146 ) ) ( not ( = ?auto_1430142 ?auto_1430145 ) ) ( not ( = ?auto_1430142 ?auto_1430147 ) ) ( not ( = ?auto_1430142 ?auto_1430148 ) ) ( not ( = ?auto_1430143 ?auto_1430144 ) ) ( not ( = ?auto_1430143 ?auto_1430146 ) ) ( not ( = ?auto_1430143 ?auto_1430145 ) ) ( not ( = ?auto_1430143 ?auto_1430147 ) ) ( not ( = ?auto_1430143 ?auto_1430148 ) ) ( not ( = ?auto_1430144 ?auto_1430146 ) ) ( not ( = ?auto_1430144 ?auto_1430145 ) ) ( not ( = ?auto_1430144 ?auto_1430147 ) ) ( not ( = ?auto_1430144 ?auto_1430148 ) ) ( not ( = ?auto_1430146 ?auto_1430145 ) ) ( not ( = ?auto_1430146 ?auto_1430147 ) ) ( not ( = ?auto_1430146 ?auto_1430148 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430145 ?auto_1430147 ?auto_1430148 )
      ( MAKE-6CRATE-VERIFY ?auto_1430142 ?auto_1430143 ?auto_1430144 ?auto_1430146 ?auto_1430145 ?auto_1430147 ?auto_1430148 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430199 - SURFACE
      ?auto_1430200 - SURFACE
      ?auto_1430201 - SURFACE
      ?auto_1430203 - SURFACE
      ?auto_1430202 - SURFACE
      ?auto_1430204 - SURFACE
      ?auto_1430205 - SURFACE
    )
    :vars
    (
      ?auto_1430210 - HOIST
      ?auto_1430208 - PLACE
      ?auto_1430207 - TRUCK
      ?auto_1430209 - PLACE
      ?auto_1430206 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430210 ?auto_1430208 ) ( SURFACE-AT ?auto_1430204 ?auto_1430208 ) ( CLEAR ?auto_1430204 ) ( IS-CRATE ?auto_1430205 ) ( not ( = ?auto_1430204 ?auto_1430205 ) ) ( AVAILABLE ?auto_1430210 ) ( ON ?auto_1430204 ?auto_1430202 ) ( not ( = ?auto_1430202 ?auto_1430204 ) ) ( not ( = ?auto_1430202 ?auto_1430205 ) ) ( TRUCK-AT ?auto_1430207 ?auto_1430209 ) ( not ( = ?auto_1430209 ?auto_1430208 ) ) ( HOIST-AT ?auto_1430206 ?auto_1430209 ) ( LIFTING ?auto_1430206 ?auto_1430205 ) ( not ( = ?auto_1430210 ?auto_1430206 ) ) ( ON ?auto_1430200 ?auto_1430199 ) ( ON ?auto_1430201 ?auto_1430200 ) ( ON ?auto_1430203 ?auto_1430201 ) ( ON ?auto_1430202 ?auto_1430203 ) ( not ( = ?auto_1430199 ?auto_1430200 ) ) ( not ( = ?auto_1430199 ?auto_1430201 ) ) ( not ( = ?auto_1430199 ?auto_1430203 ) ) ( not ( = ?auto_1430199 ?auto_1430202 ) ) ( not ( = ?auto_1430199 ?auto_1430204 ) ) ( not ( = ?auto_1430199 ?auto_1430205 ) ) ( not ( = ?auto_1430200 ?auto_1430201 ) ) ( not ( = ?auto_1430200 ?auto_1430203 ) ) ( not ( = ?auto_1430200 ?auto_1430202 ) ) ( not ( = ?auto_1430200 ?auto_1430204 ) ) ( not ( = ?auto_1430200 ?auto_1430205 ) ) ( not ( = ?auto_1430201 ?auto_1430203 ) ) ( not ( = ?auto_1430201 ?auto_1430202 ) ) ( not ( = ?auto_1430201 ?auto_1430204 ) ) ( not ( = ?auto_1430201 ?auto_1430205 ) ) ( not ( = ?auto_1430203 ?auto_1430202 ) ) ( not ( = ?auto_1430203 ?auto_1430204 ) ) ( not ( = ?auto_1430203 ?auto_1430205 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430202 ?auto_1430204 ?auto_1430205 )
      ( MAKE-6CRATE-VERIFY ?auto_1430199 ?auto_1430200 ?auto_1430201 ?auto_1430203 ?auto_1430202 ?auto_1430204 ?auto_1430205 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430262 - SURFACE
      ?auto_1430263 - SURFACE
      ?auto_1430264 - SURFACE
      ?auto_1430266 - SURFACE
      ?auto_1430265 - SURFACE
      ?auto_1430267 - SURFACE
      ?auto_1430268 - SURFACE
    )
    :vars
    (
      ?auto_1430271 - HOIST
      ?auto_1430273 - PLACE
      ?auto_1430269 - TRUCK
      ?auto_1430274 - PLACE
      ?auto_1430272 - HOIST
      ?auto_1430270 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430271 ?auto_1430273 ) ( SURFACE-AT ?auto_1430267 ?auto_1430273 ) ( CLEAR ?auto_1430267 ) ( IS-CRATE ?auto_1430268 ) ( not ( = ?auto_1430267 ?auto_1430268 ) ) ( AVAILABLE ?auto_1430271 ) ( ON ?auto_1430267 ?auto_1430265 ) ( not ( = ?auto_1430265 ?auto_1430267 ) ) ( not ( = ?auto_1430265 ?auto_1430268 ) ) ( TRUCK-AT ?auto_1430269 ?auto_1430274 ) ( not ( = ?auto_1430274 ?auto_1430273 ) ) ( HOIST-AT ?auto_1430272 ?auto_1430274 ) ( not ( = ?auto_1430271 ?auto_1430272 ) ) ( AVAILABLE ?auto_1430272 ) ( SURFACE-AT ?auto_1430268 ?auto_1430274 ) ( ON ?auto_1430268 ?auto_1430270 ) ( CLEAR ?auto_1430268 ) ( not ( = ?auto_1430267 ?auto_1430270 ) ) ( not ( = ?auto_1430268 ?auto_1430270 ) ) ( not ( = ?auto_1430265 ?auto_1430270 ) ) ( ON ?auto_1430263 ?auto_1430262 ) ( ON ?auto_1430264 ?auto_1430263 ) ( ON ?auto_1430266 ?auto_1430264 ) ( ON ?auto_1430265 ?auto_1430266 ) ( not ( = ?auto_1430262 ?auto_1430263 ) ) ( not ( = ?auto_1430262 ?auto_1430264 ) ) ( not ( = ?auto_1430262 ?auto_1430266 ) ) ( not ( = ?auto_1430262 ?auto_1430265 ) ) ( not ( = ?auto_1430262 ?auto_1430267 ) ) ( not ( = ?auto_1430262 ?auto_1430268 ) ) ( not ( = ?auto_1430262 ?auto_1430270 ) ) ( not ( = ?auto_1430263 ?auto_1430264 ) ) ( not ( = ?auto_1430263 ?auto_1430266 ) ) ( not ( = ?auto_1430263 ?auto_1430265 ) ) ( not ( = ?auto_1430263 ?auto_1430267 ) ) ( not ( = ?auto_1430263 ?auto_1430268 ) ) ( not ( = ?auto_1430263 ?auto_1430270 ) ) ( not ( = ?auto_1430264 ?auto_1430266 ) ) ( not ( = ?auto_1430264 ?auto_1430265 ) ) ( not ( = ?auto_1430264 ?auto_1430267 ) ) ( not ( = ?auto_1430264 ?auto_1430268 ) ) ( not ( = ?auto_1430264 ?auto_1430270 ) ) ( not ( = ?auto_1430266 ?auto_1430265 ) ) ( not ( = ?auto_1430266 ?auto_1430267 ) ) ( not ( = ?auto_1430266 ?auto_1430268 ) ) ( not ( = ?auto_1430266 ?auto_1430270 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430265 ?auto_1430267 ?auto_1430268 )
      ( MAKE-6CRATE-VERIFY ?auto_1430262 ?auto_1430263 ?auto_1430264 ?auto_1430266 ?auto_1430265 ?auto_1430267 ?auto_1430268 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430326 - SURFACE
      ?auto_1430327 - SURFACE
      ?auto_1430328 - SURFACE
      ?auto_1430330 - SURFACE
      ?auto_1430329 - SURFACE
      ?auto_1430331 - SURFACE
      ?auto_1430332 - SURFACE
    )
    :vars
    (
      ?auto_1430333 - HOIST
      ?auto_1430335 - PLACE
      ?auto_1430334 - PLACE
      ?auto_1430336 - HOIST
      ?auto_1430338 - SURFACE
      ?auto_1430337 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430333 ?auto_1430335 ) ( SURFACE-AT ?auto_1430331 ?auto_1430335 ) ( CLEAR ?auto_1430331 ) ( IS-CRATE ?auto_1430332 ) ( not ( = ?auto_1430331 ?auto_1430332 ) ) ( AVAILABLE ?auto_1430333 ) ( ON ?auto_1430331 ?auto_1430329 ) ( not ( = ?auto_1430329 ?auto_1430331 ) ) ( not ( = ?auto_1430329 ?auto_1430332 ) ) ( not ( = ?auto_1430334 ?auto_1430335 ) ) ( HOIST-AT ?auto_1430336 ?auto_1430334 ) ( not ( = ?auto_1430333 ?auto_1430336 ) ) ( AVAILABLE ?auto_1430336 ) ( SURFACE-AT ?auto_1430332 ?auto_1430334 ) ( ON ?auto_1430332 ?auto_1430338 ) ( CLEAR ?auto_1430332 ) ( not ( = ?auto_1430331 ?auto_1430338 ) ) ( not ( = ?auto_1430332 ?auto_1430338 ) ) ( not ( = ?auto_1430329 ?auto_1430338 ) ) ( TRUCK-AT ?auto_1430337 ?auto_1430335 ) ( ON ?auto_1430327 ?auto_1430326 ) ( ON ?auto_1430328 ?auto_1430327 ) ( ON ?auto_1430330 ?auto_1430328 ) ( ON ?auto_1430329 ?auto_1430330 ) ( not ( = ?auto_1430326 ?auto_1430327 ) ) ( not ( = ?auto_1430326 ?auto_1430328 ) ) ( not ( = ?auto_1430326 ?auto_1430330 ) ) ( not ( = ?auto_1430326 ?auto_1430329 ) ) ( not ( = ?auto_1430326 ?auto_1430331 ) ) ( not ( = ?auto_1430326 ?auto_1430332 ) ) ( not ( = ?auto_1430326 ?auto_1430338 ) ) ( not ( = ?auto_1430327 ?auto_1430328 ) ) ( not ( = ?auto_1430327 ?auto_1430330 ) ) ( not ( = ?auto_1430327 ?auto_1430329 ) ) ( not ( = ?auto_1430327 ?auto_1430331 ) ) ( not ( = ?auto_1430327 ?auto_1430332 ) ) ( not ( = ?auto_1430327 ?auto_1430338 ) ) ( not ( = ?auto_1430328 ?auto_1430330 ) ) ( not ( = ?auto_1430328 ?auto_1430329 ) ) ( not ( = ?auto_1430328 ?auto_1430331 ) ) ( not ( = ?auto_1430328 ?auto_1430332 ) ) ( not ( = ?auto_1430328 ?auto_1430338 ) ) ( not ( = ?auto_1430330 ?auto_1430329 ) ) ( not ( = ?auto_1430330 ?auto_1430331 ) ) ( not ( = ?auto_1430330 ?auto_1430332 ) ) ( not ( = ?auto_1430330 ?auto_1430338 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430329 ?auto_1430331 ?auto_1430332 )
      ( MAKE-6CRATE-VERIFY ?auto_1430326 ?auto_1430327 ?auto_1430328 ?auto_1430330 ?auto_1430329 ?auto_1430331 ?auto_1430332 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430390 - SURFACE
      ?auto_1430391 - SURFACE
      ?auto_1430392 - SURFACE
      ?auto_1430394 - SURFACE
      ?auto_1430393 - SURFACE
      ?auto_1430395 - SURFACE
      ?auto_1430396 - SURFACE
    )
    :vars
    (
      ?auto_1430399 - HOIST
      ?auto_1430400 - PLACE
      ?auto_1430398 - PLACE
      ?auto_1430401 - HOIST
      ?auto_1430402 - SURFACE
      ?auto_1430397 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430399 ?auto_1430400 ) ( IS-CRATE ?auto_1430396 ) ( not ( = ?auto_1430395 ?auto_1430396 ) ) ( not ( = ?auto_1430393 ?auto_1430395 ) ) ( not ( = ?auto_1430393 ?auto_1430396 ) ) ( not ( = ?auto_1430398 ?auto_1430400 ) ) ( HOIST-AT ?auto_1430401 ?auto_1430398 ) ( not ( = ?auto_1430399 ?auto_1430401 ) ) ( AVAILABLE ?auto_1430401 ) ( SURFACE-AT ?auto_1430396 ?auto_1430398 ) ( ON ?auto_1430396 ?auto_1430402 ) ( CLEAR ?auto_1430396 ) ( not ( = ?auto_1430395 ?auto_1430402 ) ) ( not ( = ?auto_1430396 ?auto_1430402 ) ) ( not ( = ?auto_1430393 ?auto_1430402 ) ) ( TRUCK-AT ?auto_1430397 ?auto_1430400 ) ( SURFACE-AT ?auto_1430393 ?auto_1430400 ) ( CLEAR ?auto_1430393 ) ( LIFTING ?auto_1430399 ?auto_1430395 ) ( IS-CRATE ?auto_1430395 ) ( ON ?auto_1430391 ?auto_1430390 ) ( ON ?auto_1430392 ?auto_1430391 ) ( ON ?auto_1430394 ?auto_1430392 ) ( ON ?auto_1430393 ?auto_1430394 ) ( not ( = ?auto_1430390 ?auto_1430391 ) ) ( not ( = ?auto_1430390 ?auto_1430392 ) ) ( not ( = ?auto_1430390 ?auto_1430394 ) ) ( not ( = ?auto_1430390 ?auto_1430393 ) ) ( not ( = ?auto_1430390 ?auto_1430395 ) ) ( not ( = ?auto_1430390 ?auto_1430396 ) ) ( not ( = ?auto_1430390 ?auto_1430402 ) ) ( not ( = ?auto_1430391 ?auto_1430392 ) ) ( not ( = ?auto_1430391 ?auto_1430394 ) ) ( not ( = ?auto_1430391 ?auto_1430393 ) ) ( not ( = ?auto_1430391 ?auto_1430395 ) ) ( not ( = ?auto_1430391 ?auto_1430396 ) ) ( not ( = ?auto_1430391 ?auto_1430402 ) ) ( not ( = ?auto_1430392 ?auto_1430394 ) ) ( not ( = ?auto_1430392 ?auto_1430393 ) ) ( not ( = ?auto_1430392 ?auto_1430395 ) ) ( not ( = ?auto_1430392 ?auto_1430396 ) ) ( not ( = ?auto_1430392 ?auto_1430402 ) ) ( not ( = ?auto_1430394 ?auto_1430393 ) ) ( not ( = ?auto_1430394 ?auto_1430395 ) ) ( not ( = ?auto_1430394 ?auto_1430396 ) ) ( not ( = ?auto_1430394 ?auto_1430402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430393 ?auto_1430395 ?auto_1430396 )
      ( MAKE-6CRATE-VERIFY ?auto_1430390 ?auto_1430391 ?auto_1430392 ?auto_1430394 ?auto_1430393 ?auto_1430395 ?auto_1430396 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1430454 - SURFACE
      ?auto_1430455 - SURFACE
      ?auto_1430456 - SURFACE
      ?auto_1430458 - SURFACE
      ?auto_1430457 - SURFACE
      ?auto_1430459 - SURFACE
      ?auto_1430460 - SURFACE
    )
    :vars
    (
      ?auto_1430463 - HOIST
      ?auto_1430462 - PLACE
      ?auto_1430466 - PLACE
      ?auto_1430461 - HOIST
      ?auto_1430465 - SURFACE
      ?auto_1430464 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430463 ?auto_1430462 ) ( IS-CRATE ?auto_1430460 ) ( not ( = ?auto_1430459 ?auto_1430460 ) ) ( not ( = ?auto_1430457 ?auto_1430459 ) ) ( not ( = ?auto_1430457 ?auto_1430460 ) ) ( not ( = ?auto_1430466 ?auto_1430462 ) ) ( HOIST-AT ?auto_1430461 ?auto_1430466 ) ( not ( = ?auto_1430463 ?auto_1430461 ) ) ( AVAILABLE ?auto_1430461 ) ( SURFACE-AT ?auto_1430460 ?auto_1430466 ) ( ON ?auto_1430460 ?auto_1430465 ) ( CLEAR ?auto_1430460 ) ( not ( = ?auto_1430459 ?auto_1430465 ) ) ( not ( = ?auto_1430460 ?auto_1430465 ) ) ( not ( = ?auto_1430457 ?auto_1430465 ) ) ( TRUCK-AT ?auto_1430464 ?auto_1430462 ) ( SURFACE-AT ?auto_1430457 ?auto_1430462 ) ( CLEAR ?auto_1430457 ) ( IS-CRATE ?auto_1430459 ) ( AVAILABLE ?auto_1430463 ) ( IN ?auto_1430459 ?auto_1430464 ) ( ON ?auto_1430455 ?auto_1430454 ) ( ON ?auto_1430456 ?auto_1430455 ) ( ON ?auto_1430458 ?auto_1430456 ) ( ON ?auto_1430457 ?auto_1430458 ) ( not ( = ?auto_1430454 ?auto_1430455 ) ) ( not ( = ?auto_1430454 ?auto_1430456 ) ) ( not ( = ?auto_1430454 ?auto_1430458 ) ) ( not ( = ?auto_1430454 ?auto_1430457 ) ) ( not ( = ?auto_1430454 ?auto_1430459 ) ) ( not ( = ?auto_1430454 ?auto_1430460 ) ) ( not ( = ?auto_1430454 ?auto_1430465 ) ) ( not ( = ?auto_1430455 ?auto_1430456 ) ) ( not ( = ?auto_1430455 ?auto_1430458 ) ) ( not ( = ?auto_1430455 ?auto_1430457 ) ) ( not ( = ?auto_1430455 ?auto_1430459 ) ) ( not ( = ?auto_1430455 ?auto_1430460 ) ) ( not ( = ?auto_1430455 ?auto_1430465 ) ) ( not ( = ?auto_1430456 ?auto_1430458 ) ) ( not ( = ?auto_1430456 ?auto_1430457 ) ) ( not ( = ?auto_1430456 ?auto_1430459 ) ) ( not ( = ?auto_1430456 ?auto_1430460 ) ) ( not ( = ?auto_1430456 ?auto_1430465 ) ) ( not ( = ?auto_1430458 ?auto_1430457 ) ) ( not ( = ?auto_1430458 ?auto_1430459 ) ) ( not ( = ?auto_1430458 ?auto_1430460 ) ) ( not ( = ?auto_1430458 ?auto_1430465 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1430457 ?auto_1430459 ?auto_1430460 )
      ( MAKE-6CRATE-VERIFY ?auto_1430454 ?auto_1430455 ?auto_1430456 ?auto_1430458 ?auto_1430457 ?auto_1430459 ?auto_1430460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1430924 - SURFACE
      ?auto_1430925 - SURFACE
    )
    :vars
    (
      ?auto_1430932 - HOIST
      ?auto_1430931 - PLACE
      ?auto_1430926 - SURFACE
      ?auto_1430928 - PLACE
      ?auto_1430930 - HOIST
      ?auto_1430929 - SURFACE
      ?auto_1430927 - TRUCK
      ?auto_1430933 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430932 ?auto_1430931 ) ( SURFACE-AT ?auto_1430924 ?auto_1430931 ) ( CLEAR ?auto_1430924 ) ( IS-CRATE ?auto_1430925 ) ( not ( = ?auto_1430924 ?auto_1430925 ) ) ( ON ?auto_1430924 ?auto_1430926 ) ( not ( = ?auto_1430926 ?auto_1430924 ) ) ( not ( = ?auto_1430926 ?auto_1430925 ) ) ( not ( = ?auto_1430928 ?auto_1430931 ) ) ( HOIST-AT ?auto_1430930 ?auto_1430928 ) ( not ( = ?auto_1430932 ?auto_1430930 ) ) ( AVAILABLE ?auto_1430930 ) ( SURFACE-AT ?auto_1430925 ?auto_1430928 ) ( ON ?auto_1430925 ?auto_1430929 ) ( CLEAR ?auto_1430925 ) ( not ( = ?auto_1430924 ?auto_1430929 ) ) ( not ( = ?auto_1430925 ?auto_1430929 ) ) ( not ( = ?auto_1430926 ?auto_1430929 ) ) ( TRUCK-AT ?auto_1430927 ?auto_1430931 ) ( LIFTING ?auto_1430932 ?auto_1430933 ) ( IS-CRATE ?auto_1430933 ) ( not ( = ?auto_1430924 ?auto_1430933 ) ) ( not ( = ?auto_1430925 ?auto_1430933 ) ) ( not ( = ?auto_1430926 ?auto_1430933 ) ) ( not ( = ?auto_1430929 ?auto_1430933 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1430932 ?auto_1430933 ?auto_1430927 ?auto_1430931 )
      ( MAKE-1CRATE ?auto_1430924 ?auto_1430925 )
      ( MAKE-1CRATE-VERIFY ?auto_1430924 ?auto_1430925 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1431707 - SURFACE
      ?auto_1431708 - SURFACE
    )
    :vars
    (
      ?auto_1431709 - HOIST
      ?auto_1431710 - PLACE
      ?auto_1431711 - SURFACE
      ?auto_1431712 - TRUCK
      ?auto_1431715 - PLACE
      ?auto_1431713 - HOIST
      ?auto_1431714 - SURFACE
      ?auto_1431716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431709 ?auto_1431710 ) ( SURFACE-AT ?auto_1431707 ?auto_1431710 ) ( CLEAR ?auto_1431707 ) ( IS-CRATE ?auto_1431708 ) ( not ( = ?auto_1431707 ?auto_1431708 ) ) ( AVAILABLE ?auto_1431709 ) ( ON ?auto_1431707 ?auto_1431711 ) ( not ( = ?auto_1431711 ?auto_1431707 ) ) ( not ( = ?auto_1431711 ?auto_1431708 ) ) ( TRUCK-AT ?auto_1431712 ?auto_1431715 ) ( not ( = ?auto_1431715 ?auto_1431710 ) ) ( HOIST-AT ?auto_1431713 ?auto_1431715 ) ( not ( = ?auto_1431709 ?auto_1431713 ) ) ( SURFACE-AT ?auto_1431708 ?auto_1431715 ) ( ON ?auto_1431708 ?auto_1431714 ) ( CLEAR ?auto_1431708 ) ( not ( = ?auto_1431707 ?auto_1431714 ) ) ( not ( = ?auto_1431708 ?auto_1431714 ) ) ( not ( = ?auto_1431711 ?auto_1431714 ) ) ( LIFTING ?auto_1431713 ?auto_1431716 ) ( IS-CRATE ?auto_1431716 ) ( not ( = ?auto_1431707 ?auto_1431716 ) ) ( not ( = ?auto_1431708 ?auto_1431716 ) ) ( not ( = ?auto_1431711 ?auto_1431716 ) ) ( not ( = ?auto_1431714 ?auto_1431716 ) ) )
    :subtasks
    ( ( !LOAD ?auto_1431713 ?auto_1431716 ?auto_1431712 ?auto_1431715 )
      ( MAKE-1CRATE ?auto_1431707 ?auto_1431708 )
      ( MAKE-1CRATE-VERIFY ?auto_1431707 ?auto_1431708 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432384 - SURFACE
      ?auto_1432385 - SURFACE
      ?auto_1432386 - SURFACE
      ?auto_1432388 - SURFACE
      ?auto_1432387 - SURFACE
      ?auto_1432389 - SURFACE
      ?auto_1432390 - SURFACE
      ?auto_1432391 - SURFACE
    )
    :vars
    (
      ?auto_1432393 - HOIST
      ?auto_1432392 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432393 ?auto_1432392 ) ( SURFACE-AT ?auto_1432390 ?auto_1432392 ) ( CLEAR ?auto_1432390 ) ( LIFTING ?auto_1432393 ?auto_1432391 ) ( IS-CRATE ?auto_1432391 ) ( not ( = ?auto_1432390 ?auto_1432391 ) ) ( ON ?auto_1432385 ?auto_1432384 ) ( ON ?auto_1432386 ?auto_1432385 ) ( ON ?auto_1432388 ?auto_1432386 ) ( ON ?auto_1432387 ?auto_1432388 ) ( ON ?auto_1432389 ?auto_1432387 ) ( ON ?auto_1432390 ?auto_1432389 ) ( not ( = ?auto_1432384 ?auto_1432385 ) ) ( not ( = ?auto_1432384 ?auto_1432386 ) ) ( not ( = ?auto_1432384 ?auto_1432388 ) ) ( not ( = ?auto_1432384 ?auto_1432387 ) ) ( not ( = ?auto_1432384 ?auto_1432389 ) ) ( not ( = ?auto_1432384 ?auto_1432390 ) ) ( not ( = ?auto_1432384 ?auto_1432391 ) ) ( not ( = ?auto_1432385 ?auto_1432386 ) ) ( not ( = ?auto_1432385 ?auto_1432388 ) ) ( not ( = ?auto_1432385 ?auto_1432387 ) ) ( not ( = ?auto_1432385 ?auto_1432389 ) ) ( not ( = ?auto_1432385 ?auto_1432390 ) ) ( not ( = ?auto_1432385 ?auto_1432391 ) ) ( not ( = ?auto_1432386 ?auto_1432388 ) ) ( not ( = ?auto_1432386 ?auto_1432387 ) ) ( not ( = ?auto_1432386 ?auto_1432389 ) ) ( not ( = ?auto_1432386 ?auto_1432390 ) ) ( not ( = ?auto_1432386 ?auto_1432391 ) ) ( not ( = ?auto_1432388 ?auto_1432387 ) ) ( not ( = ?auto_1432388 ?auto_1432389 ) ) ( not ( = ?auto_1432388 ?auto_1432390 ) ) ( not ( = ?auto_1432388 ?auto_1432391 ) ) ( not ( = ?auto_1432387 ?auto_1432389 ) ) ( not ( = ?auto_1432387 ?auto_1432390 ) ) ( not ( = ?auto_1432387 ?auto_1432391 ) ) ( not ( = ?auto_1432389 ?auto_1432390 ) ) ( not ( = ?auto_1432389 ?auto_1432391 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1432390 ?auto_1432391 )
      ( MAKE-7CRATE-VERIFY ?auto_1432384 ?auto_1432385 ?auto_1432386 ?auto_1432388 ?auto_1432387 ?auto_1432389 ?auto_1432390 ?auto_1432391 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432439 - SURFACE
      ?auto_1432440 - SURFACE
      ?auto_1432441 - SURFACE
      ?auto_1432443 - SURFACE
      ?auto_1432442 - SURFACE
      ?auto_1432444 - SURFACE
      ?auto_1432445 - SURFACE
      ?auto_1432446 - SURFACE
    )
    :vars
    (
      ?auto_1432447 - HOIST
      ?auto_1432449 - PLACE
      ?auto_1432448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432447 ?auto_1432449 ) ( SURFACE-AT ?auto_1432445 ?auto_1432449 ) ( CLEAR ?auto_1432445 ) ( IS-CRATE ?auto_1432446 ) ( not ( = ?auto_1432445 ?auto_1432446 ) ) ( TRUCK-AT ?auto_1432448 ?auto_1432449 ) ( AVAILABLE ?auto_1432447 ) ( IN ?auto_1432446 ?auto_1432448 ) ( ON ?auto_1432445 ?auto_1432444 ) ( not ( = ?auto_1432444 ?auto_1432445 ) ) ( not ( = ?auto_1432444 ?auto_1432446 ) ) ( ON ?auto_1432440 ?auto_1432439 ) ( ON ?auto_1432441 ?auto_1432440 ) ( ON ?auto_1432443 ?auto_1432441 ) ( ON ?auto_1432442 ?auto_1432443 ) ( ON ?auto_1432444 ?auto_1432442 ) ( not ( = ?auto_1432439 ?auto_1432440 ) ) ( not ( = ?auto_1432439 ?auto_1432441 ) ) ( not ( = ?auto_1432439 ?auto_1432443 ) ) ( not ( = ?auto_1432439 ?auto_1432442 ) ) ( not ( = ?auto_1432439 ?auto_1432444 ) ) ( not ( = ?auto_1432439 ?auto_1432445 ) ) ( not ( = ?auto_1432439 ?auto_1432446 ) ) ( not ( = ?auto_1432440 ?auto_1432441 ) ) ( not ( = ?auto_1432440 ?auto_1432443 ) ) ( not ( = ?auto_1432440 ?auto_1432442 ) ) ( not ( = ?auto_1432440 ?auto_1432444 ) ) ( not ( = ?auto_1432440 ?auto_1432445 ) ) ( not ( = ?auto_1432440 ?auto_1432446 ) ) ( not ( = ?auto_1432441 ?auto_1432443 ) ) ( not ( = ?auto_1432441 ?auto_1432442 ) ) ( not ( = ?auto_1432441 ?auto_1432444 ) ) ( not ( = ?auto_1432441 ?auto_1432445 ) ) ( not ( = ?auto_1432441 ?auto_1432446 ) ) ( not ( = ?auto_1432443 ?auto_1432442 ) ) ( not ( = ?auto_1432443 ?auto_1432444 ) ) ( not ( = ?auto_1432443 ?auto_1432445 ) ) ( not ( = ?auto_1432443 ?auto_1432446 ) ) ( not ( = ?auto_1432442 ?auto_1432444 ) ) ( not ( = ?auto_1432442 ?auto_1432445 ) ) ( not ( = ?auto_1432442 ?auto_1432446 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432444 ?auto_1432445 ?auto_1432446 )
      ( MAKE-7CRATE-VERIFY ?auto_1432439 ?auto_1432440 ?auto_1432441 ?auto_1432443 ?auto_1432442 ?auto_1432444 ?auto_1432445 ?auto_1432446 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432502 - SURFACE
      ?auto_1432503 - SURFACE
      ?auto_1432504 - SURFACE
      ?auto_1432506 - SURFACE
      ?auto_1432505 - SURFACE
      ?auto_1432507 - SURFACE
      ?auto_1432508 - SURFACE
      ?auto_1432509 - SURFACE
    )
    :vars
    (
      ?auto_1432511 - HOIST
      ?auto_1432510 - PLACE
      ?auto_1432512 - TRUCK
      ?auto_1432513 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432511 ?auto_1432510 ) ( SURFACE-AT ?auto_1432508 ?auto_1432510 ) ( CLEAR ?auto_1432508 ) ( IS-CRATE ?auto_1432509 ) ( not ( = ?auto_1432508 ?auto_1432509 ) ) ( AVAILABLE ?auto_1432511 ) ( IN ?auto_1432509 ?auto_1432512 ) ( ON ?auto_1432508 ?auto_1432507 ) ( not ( = ?auto_1432507 ?auto_1432508 ) ) ( not ( = ?auto_1432507 ?auto_1432509 ) ) ( TRUCK-AT ?auto_1432512 ?auto_1432513 ) ( not ( = ?auto_1432513 ?auto_1432510 ) ) ( ON ?auto_1432503 ?auto_1432502 ) ( ON ?auto_1432504 ?auto_1432503 ) ( ON ?auto_1432506 ?auto_1432504 ) ( ON ?auto_1432505 ?auto_1432506 ) ( ON ?auto_1432507 ?auto_1432505 ) ( not ( = ?auto_1432502 ?auto_1432503 ) ) ( not ( = ?auto_1432502 ?auto_1432504 ) ) ( not ( = ?auto_1432502 ?auto_1432506 ) ) ( not ( = ?auto_1432502 ?auto_1432505 ) ) ( not ( = ?auto_1432502 ?auto_1432507 ) ) ( not ( = ?auto_1432502 ?auto_1432508 ) ) ( not ( = ?auto_1432502 ?auto_1432509 ) ) ( not ( = ?auto_1432503 ?auto_1432504 ) ) ( not ( = ?auto_1432503 ?auto_1432506 ) ) ( not ( = ?auto_1432503 ?auto_1432505 ) ) ( not ( = ?auto_1432503 ?auto_1432507 ) ) ( not ( = ?auto_1432503 ?auto_1432508 ) ) ( not ( = ?auto_1432503 ?auto_1432509 ) ) ( not ( = ?auto_1432504 ?auto_1432506 ) ) ( not ( = ?auto_1432504 ?auto_1432505 ) ) ( not ( = ?auto_1432504 ?auto_1432507 ) ) ( not ( = ?auto_1432504 ?auto_1432508 ) ) ( not ( = ?auto_1432504 ?auto_1432509 ) ) ( not ( = ?auto_1432506 ?auto_1432505 ) ) ( not ( = ?auto_1432506 ?auto_1432507 ) ) ( not ( = ?auto_1432506 ?auto_1432508 ) ) ( not ( = ?auto_1432506 ?auto_1432509 ) ) ( not ( = ?auto_1432505 ?auto_1432507 ) ) ( not ( = ?auto_1432505 ?auto_1432508 ) ) ( not ( = ?auto_1432505 ?auto_1432509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432507 ?auto_1432508 ?auto_1432509 )
      ( MAKE-7CRATE-VERIFY ?auto_1432502 ?auto_1432503 ?auto_1432504 ?auto_1432506 ?auto_1432505 ?auto_1432507 ?auto_1432508 ?auto_1432509 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432572 - SURFACE
      ?auto_1432573 - SURFACE
      ?auto_1432574 - SURFACE
      ?auto_1432576 - SURFACE
      ?auto_1432575 - SURFACE
      ?auto_1432577 - SURFACE
      ?auto_1432578 - SURFACE
      ?auto_1432579 - SURFACE
    )
    :vars
    (
      ?auto_1432584 - HOIST
      ?auto_1432582 - PLACE
      ?auto_1432583 - TRUCK
      ?auto_1432580 - PLACE
      ?auto_1432581 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432584 ?auto_1432582 ) ( SURFACE-AT ?auto_1432578 ?auto_1432582 ) ( CLEAR ?auto_1432578 ) ( IS-CRATE ?auto_1432579 ) ( not ( = ?auto_1432578 ?auto_1432579 ) ) ( AVAILABLE ?auto_1432584 ) ( ON ?auto_1432578 ?auto_1432577 ) ( not ( = ?auto_1432577 ?auto_1432578 ) ) ( not ( = ?auto_1432577 ?auto_1432579 ) ) ( TRUCK-AT ?auto_1432583 ?auto_1432580 ) ( not ( = ?auto_1432580 ?auto_1432582 ) ) ( HOIST-AT ?auto_1432581 ?auto_1432580 ) ( LIFTING ?auto_1432581 ?auto_1432579 ) ( not ( = ?auto_1432584 ?auto_1432581 ) ) ( ON ?auto_1432573 ?auto_1432572 ) ( ON ?auto_1432574 ?auto_1432573 ) ( ON ?auto_1432576 ?auto_1432574 ) ( ON ?auto_1432575 ?auto_1432576 ) ( ON ?auto_1432577 ?auto_1432575 ) ( not ( = ?auto_1432572 ?auto_1432573 ) ) ( not ( = ?auto_1432572 ?auto_1432574 ) ) ( not ( = ?auto_1432572 ?auto_1432576 ) ) ( not ( = ?auto_1432572 ?auto_1432575 ) ) ( not ( = ?auto_1432572 ?auto_1432577 ) ) ( not ( = ?auto_1432572 ?auto_1432578 ) ) ( not ( = ?auto_1432572 ?auto_1432579 ) ) ( not ( = ?auto_1432573 ?auto_1432574 ) ) ( not ( = ?auto_1432573 ?auto_1432576 ) ) ( not ( = ?auto_1432573 ?auto_1432575 ) ) ( not ( = ?auto_1432573 ?auto_1432577 ) ) ( not ( = ?auto_1432573 ?auto_1432578 ) ) ( not ( = ?auto_1432573 ?auto_1432579 ) ) ( not ( = ?auto_1432574 ?auto_1432576 ) ) ( not ( = ?auto_1432574 ?auto_1432575 ) ) ( not ( = ?auto_1432574 ?auto_1432577 ) ) ( not ( = ?auto_1432574 ?auto_1432578 ) ) ( not ( = ?auto_1432574 ?auto_1432579 ) ) ( not ( = ?auto_1432576 ?auto_1432575 ) ) ( not ( = ?auto_1432576 ?auto_1432577 ) ) ( not ( = ?auto_1432576 ?auto_1432578 ) ) ( not ( = ?auto_1432576 ?auto_1432579 ) ) ( not ( = ?auto_1432575 ?auto_1432577 ) ) ( not ( = ?auto_1432575 ?auto_1432578 ) ) ( not ( = ?auto_1432575 ?auto_1432579 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432577 ?auto_1432578 ?auto_1432579 )
      ( MAKE-7CRATE-VERIFY ?auto_1432572 ?auto_1432573 ?auto_1432574 ?auto_1432576 ?auto_1432575 ?auto_1432577 ?auto_1432578 ?auto_1432579 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432649 - SURFACE
      ?auto_1432650 - SURFACE
      ?auto_1432651 - SURFACE
      ?auto_1432653 - SURFACE
      ?auto_1432652 - SURFACE
      ?auto_1432654 - SURFACE
      ?auto_1432655 - SURFACE
      ?auto_1432656 - SURFACE
    )
    :vars
    (
      ?auto_1432660 - HOIST
      ?auto_1432657 - PLACE
      ?auto_1432658 - TRUCK
      ?auto_1432659 - PLACE
      ?auto_1432661 - HOIST
      ?auto_1432662 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432660 ?auto_1432657 ) ( SURFACE-AT ?auto_1432655 ?auto_1432657 ) ( CLEAR ?auto_1432655 ) ( IS-CRATE ?auto_1432656 ) ( not ( = ?auto_1432655 ?auto_1432656 ) ) ( AVAILABLE ?auto_1432660 ) ( ON ?auto_1432655 ?auto_1432654 ) ( not ( = ?auto_1432654 ?auto_1432655 ) ) ( not ( = ?auto_1432654 ?auto_1432656 ) ) ( TRUCK-AT ?auto_1432658 ?auto_1432659 ) ( not ( = ?auto_1432659 ?auto_1432657 ) ) ( HOIST-AT ?auto_1432661 ?auto_1432659 ) ( not ( = ?auto_1432660 ?auto_1432661 ) ) ( AVAILABLE ?auto_1432661 ) ( SURFACE-AT ?auto_1432656 ?auto_1432659 ) ( ON ?auto_1432656 ?auto_1432662 ) ( CLEAR ?auto_1432656 ) ( not ( = ?auto_1432655 ?auto_1432662 ) ) ( not ( = ?auto_1432656 ?auto_1432662 ) ) ( not ( = ?auto_1432654 ?auto_1432662 ) ) ( ON ?auto_1432650 ?auto_1432649 ) ( ON ?auto_1432651 ?auto_1432650 ) ( ON ?auto_1432653 ?auto_1432651 ) ( ON ?auto_1432652 ?auto_1432653 ) ( ON ?auto_1432654 ?auto_1432652 ) ( not ( = ?auto_1432649 ?auto_1432650 ) ) ( not ( = ?auto_1432649 ?auto_1432651 ) ) ( not ( = ?auto_1432649 ?auto_1432653 ) ) ( not ( = ?auto_1432649 ?auto_1432652 ) ) ( not ( = ?auto_1432649 ?auto_1432654 ) ) ( not ( = ?auto_1432649 ?auto_1432655 ) ) ( not ( = ?auto_1432649 ?auto_1432656 ) ) ( not ( = ?auto_1432649 ?auto_1432662 ) ) ( not ( = ?auto_1432650 ?auto_1432651 ) ) ( not ( = ?auto_1432650 ?auto_1432653 ) ) ( not ( = ?auto_1432650 ?auto_1432652 ) ) ( not ( = ?auto_1432650 ?auto_1432654 ) ) ( not ( = ?auto_1432650 ?auto_1432655 ) ) ( not ( = ?auto_1432650 ?auto_1432656 ) ) ( not ( = ?auto_1432650 ?auto_1432662 ) ) ( not ( = ?auto_1432651 ?auto_1432653 ) ) ( not ( = ?auto_1432651 ?auto_1432652 ) ) ( not ( = ?auto_1432651 ?auto_1432654 ) ) ( not ( = ?auto_1432651 ?auto_1432655 ) ) ( not ( = ?auto_1432651 ?auto_1432656 ) ) ( not ( = ?auto_1432651 ?auto_1432662 ) ) ( not ( = ?auto_1432653 ?auto_1432652 ) ) ( not ( = ?auto_1432653 ?auto_1432654 ) ) ( not ( = ?auto_1432653 ?auto_1432655 ) ) ( not ( = ?auto_1432653 ?auto_1432656 ) ) ( not ( = ?auto_1432653 ?auto_1432662 ) ) ( not ( = ?auto_1432652 ?auto_1432654 ) ) ( not ( = ?auto_1432652 ?auto_1432655 ) ) ( not ( = ?auto_1432652 ?auto_1432656 ) ) ( not ( = ?auto_1432652 ?auto_1432662 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432654 ?auto_1432655 ?auto_1432656 )
      ( MAKE-7CRATE-VERIFY ?auto_1432649 ?auto_1432650 ?auto_1432651 ?auto_1432653 ?auto_1432652 ?auto_1432654 ?auto_1432655 ?auto_1432656 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432727 - SURFACE
      ?auto_1432728 - SURFACE
      ?auto_1432729 - SURFACE
      ?auto_1432731 - SURFACE
      ?auto_1432730 - SURFACE
      ?auto_1432732 - SURFACE
      ?auto_1432733 - SURFACE
      ?auto_1432734 - SURFACE
    )
    :vars
    (
      ?auto_1432740 - HOIST
      ?auto_1432735 - PLACE
      ?auto_1432737 - PLACE
      ?auto_1432736 - HOIST
      ?auto_1432738 - SURFACE
      ?auto_1432739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432740 ?auto_1432735 ) ( SURFACE-AT ?auto_1432733 ?auto_1432735 ) ( CLEAR ?auto_1432733 ) ( IS-CRATE ?auto_1432734 ) ( not ( = ?auto_1432733 ?auto_1432734 ) ) ( AVAILABLE ?auto_1432740 ) ( ON ?auto_1432733 ?auto_1432732 ) ( not ( = ?auto_1432732 ?auto_1432733 ) ) ( not ( = ?auto_1432732 ?auto_1432734 ) ) ( not ( = ?auto_1432737 ?auto_1432735 ) ) ( HOIST-AT ?auto_1432736 ?auto_1432737 ) ( not ( = ?auto_1432740 ?auto_1432736 ) ) ( AVAILABLE ?auto_1432736 ) ( SURFACE-AT ?auto_1432734 ?auto_1432737 ) ( ON ?auto_1432734 ?auto_1432738 ) ( CLEAR ?auto_1432734 ) ( not ( = ?auto_1432733 ?auto_1432738 ) ) ( not ( = ?auto_1432734 ?auto_1432738 ) ) ( not ( = ?auto_1432732 ?auto_1432738 ) ) ( TRUCK-AT ?auto_1432739 ?auto_1432735 ) ( ON ?auto_1432728 ?auto_1432727 ) ( ON ?auto_1432729 ?auto_1432728 ) ( ON ?auto_1432731 ?auto_1432729 ) ( ON ?auto_1432730 ?auto_1432731 ) ( ON ?auto_1432732 ?auto_1432730 ) ( not ( = ?auto_1432727 ?auto_1432728 ) ) ( not ( = ?auto_1432727 ?auto_1432729 ) ) ( not ( = ?auto_1432727 ?auto_1432731 ) ) ( not ( = ?auto_1432727 ?auto_1432730 ) ) ( not ( = ?auto_1432727 ?auto_1432732 ) ) ( not ( = ?auto_1432727 ?auto_1432733 ) ) ( not ( = ?auto_1432727 ?auto_1432734 ) ) ( not ( = ?auto_1432727 ?auto_1432738 ) ) ( not ( = ?auto_1432728 ?auto_1432729 ) ) ( not ( = ?auto_1432728 ?auto_1432731 ) ) ( not ( = ?auto_1432728 ?auto_1432730 ) ) ( not ( = ?auto_1432728 ?auto_1432732 ) ) ( not ( = ?auto_1432728 ?auto_1432733 ) ) ( not ( = ?auto_1432728 ?auto_1432734 ) ) ( not ( = ?auto_1432728 ?auto_1432738 ) ) ( not ( = ?auto_1432729 ?auto_1432731 ) ) ( not ( = ?auto_1432729 ?auto_1432730 ) ) ( not ( = ?auto_1432729 ?auto_1432732 ) ) ( not ( = ?auto_1432729 ?auto_1432733 ) ) ( not ( = ?auto_1432729 ?auto_1432734 ) ) ( not ( = ?auto_1432729 ?auto_1432738 ) ) ( not ( = ?auto_1432731 ?auto_1432730 ) ) ( not ( = ?auto_1432731 ?auto_1432732 ) ) ( not ( = ?auto_1432731 ?auto_1432733 ) ) ( not ( = ?auto_1432731 ?auto_1432734 ) ) ( not ( = ?auto_1432731 ?auto_1432738 ) ) ( not ( = ?auto_1432730 ?auto_1432732 ) ) ( not ( = ?auto_1432730 ?auto_1432733 ) ) ( not ( = ?auto_1432730 ?auto_1432734 ) ) ( not ( = ?auto_1432730 ?auto_1432738 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432732 ?auto_1432733 ?auto_1432734 )
      ( MAKE-7CRATE-VERIFY ?auto_1432727 ?auto_1432728 ?auto_1432729 ?auto_1432731 ?auto_1432730 ?auto_1432732 ?auto_1432733 ?auto_1432734 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432805 - SURFACE
      ?auto_1432806 - SURFACE
      ?auto_1432807 - SURFACE
      ?auto_1432809 - SURFACE
      ?auto_1432808 - SURFACE
      ?auto_1432810 - SURFACE
      ?auto_1432811 - SURFACE
      ?auto_1432812 - SURFACE
    )
    :vars
    (
      ?auto_1432815 - HOIST
      ?auto_1432813 - PLACE
      ?auto_1432818 - PLACE
      ?auto_1432814 - HOIST
      ?auto_1432817 - SURFACE
      ?auto_1432816 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432815 ?auto_1432813 ) ( IS-CRATE ?auto_1432812 ) ( not ( = ?auto_1432811 ?auto_1432812 ) ) ( not ( = ?auto_1432810 ?auto_1432811 ) ) ( not ( = ?auto_1432810 ?auto_1432812 ) ) ( not ( = ?auto_1432818 ?auto_1432813 ) ) ( HOIST-AT ?auto_1432814 ?auto_1432818 ) ( not ( = ?auto_1432815 ?auto_1432814 ) ) ( AVAILABLE ?auto_1432814 ) ( SURFACE-AT ?auto_1432812 ?auto_1432818 ) ( ON ?auto_1432812 ?auto_1432817 ) ( CLEAR ?auto_1432812 ) ( not ( = ?auto_1432811 ?auto_1432817 ) ) ( not ( = ?auto_1432812 ?auto_1432817 ) ) ( not ( = ?auto_1432810 ?auto_1432817 ) ) ( TRUCK-AT ?auto_1432816 ?auto_1432813 ) ( SURFACE-AT ?auto_1432810 ?auto_1432813 ) ( CLEAR ?auto_1432810 ) ( LIFTING ?auto_1432815 ?auto_1432811 ) ( IS-CRATE ?auto_1432811 ) ( ON ?auto_1432806 ?auto_1432805 ) ( ON ?auto_1432807 ?auto_1432806 ) ( ON ?auto_1432809 ?auto_1432807 ) ( ON ?auto_1432808 ?auto_1432809 ) ( ON ?auto_1432810 ?auto_1432808 ) ( not ( = ?auto_1432805 ?auto_1432806 ) ) ( not ( = ?auto_1432805 ?auto_1432807 ) ) ( not ( = ?auto_1432805 ?auto_1432809 ) ) ( not ( = ?auto_1432805 ?auto_1432808 ) ) ( not ( = ?auto_1432805 ?auto_1432810 ) ) ( not ( = ?auto_1432805 ?auto_1432811 ) ) ( not ( = ?auto_1432805 ?auto_1432812 ) ) ( not ( = ?auto_1432805 ?auto_1432817 ) ) ( not ( = ?auto_1432806 ?auto_1432807 ) ) ( not ( = ?auto_1432806 ?auto_1432809 ) ) ( not ( = ?auto_1432806 ?auto_1432808 ) ) ( not ( = ?auto_1432806 ?auto_1432810 ) ) ( not ( = ?auto_1432806 ?auto_1432811 ) ) ( not ( = ?auto_1432806 ?auto_1432812 ) ) ( not ( = ?auto_1432806 ?auto_1432817 ) ) ( not ( = ?auto_1432807 ?auto_1432809 ) ) ( not ( = ?auto_1432807 ?auto_1432808 ) ) ( not ( = ?auto_1432807 ?auto_1432810 ) ) ( not ( = ?auto_1432807 ?auto_1432811 ) ) ( not ( = ?auto_1432807 ?auto_1432812 ) ) ( not ( = ?auto_1432807 ?auto_1432817 ) ) ( not ( = ?auto_1432809 ?auto_1432808 ) ) ( not ( = ?auto_1432809 ?auto_1432810 ) ) ( not ( = ?auto_1432809 ?auto_1432811 ) ) ( not ( = ?auto_1432809 ?auto_1432812 ) ) ( not ( = ?auto_1432809 ?auto_1432817 ) ) ( not ( = ?auto_1432808 ?auto_1432810 ) ) ( not ( = ?auto_1432808 ?auto_1432811 ) ) ( not ( = ?auto_1432808 ?auto_1432812 ) ) ( not ( = ?auto_1432808 ?auto_1432817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432810 ?auto_1432811 ?auto_1432812 )
      ( MAKE-7CRATE-VERIFY ?auto_1432805 ?auto_1432806 ?auto_1432807 ?auto_1432809 ?auto_1432808 ?auto_1432810 ?auto_1432811 ?auto_1432812 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432883 - SURFACE
      ?auto_1432884 - SURFACE
      ?auto_1432885 - SURFACE
      ?auto_1432887 - SURFACE
      ?auto_1432886 - SURFACE
      ?auto_1432888 - SURFACE
      ?auto_1432889 - SURFACE
      ?auto_1432890 - SURFACE
    )
    :vars
    (
      ?auto_1432895 - HOIST
      ?auto_1432896 - PLACE
      ?auto_1432891 - PLACE
      ?auto_1432893 - HOIST
      ?auto_1432892 - SURFACE
      ?auto_1432894 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432895 ?auto_1432896 ) ( IS-CRATE ?auto_1432890 ) ( not ( = ?auto_1432889 ?auto_1432890 ) ) ( not ( = ?auto_1432888 ?auto_1432889 ) ) ( not ( = ?auto_1432888 ?auto_1432890 ) ) ( not ( = ?auto_1432891 ?auto_1432896 ) ) ( HOIST-AT ?auto_1432893 ?auto_1432891 ) ( not ( = ?auto_1432895 ?auto_1432893 ) ) ( AVAILABLE ?auto_1432893 ) ( SURFACE-AT ?auto_1432890 ?auto_1432891 ) ( ON ?auto_1432890 ?auto_1432892 ) ( CLEAR ?auto_1432890 ) ( not ( = ?auto_1432889 ?auto_1432892 ) ) ( not ( = ?auto_1432890 ?auto_1432892 ) ) ( not ( = ?auto_1432888 ?auto_1432892 ) ) ( TRUCK-AT ?auto_1432894 ?auto_1432896 ) ( SURFACE-AT ?auto_1432888 ?auto_1432896 ) ( CLEAR ?auto_1432888 ) ( IS-CRATE ?auto_1432889 ) ( AVAILABLE ?auto_1432895 ) ( IN ?auto_1432889 ?auto_1432894 ) ( ON ?auto_1432884 ?auto_1432883 ) ( ON ?auto_1432885 ?auto_1432884 ) ( ON ?auto_1432887 ?auto_1432885 ) ( ON ?auto_1432886 ?auto_1432887 ) ( ON ?auto_1432888 ?auto_1432886 ) ( not ( = ?auto_1432883 ?auto_1432884 ) ) ( not ( = ?auto_1432883 ?auto_1432885 ) ) ( not ( = ?auto_1432883 ?auto_1432887 ) ) ( not ( = ?auto_1432883 ?auto_1432886 ) ) ( not ( = ?auto_1432883 ?auto_1432888 ) ) ( not ( = ?auto_1432883 ?auto_1432889 ) ) ( not ( = ?auto_1432883 ?auto_1432890 ) ) ( not ( = ?auto_1432883 ?auto_1432892 ) ) ( not ( = ?auto_1432884 ?auto_1432885 ) ) ( not ( = ?auto_1432884 ?auto_1432887 ) ) ( not ( = ?auto_1432884 ?auto_1432886 ) ) ( not ( = ?auto_1432884 ?auto_1432888 ) ) ( not ( = ?auto_1432884 ?auto_1432889 ) ) ( not ( = ?auto_1432884 ?auto_1432890 ) ) ( not ( = ?auto_1432884 ?auto_1432892 ) ) ( not ( = ?auto_1432885 ?auto_1432887 ) ) ( not ( = ?auto_1432885 ?auto_1432886 ) ) ( not ( = ?auto_1432885 ?auto_1432888 ) ) ( not ( = ?auto_1432885 ?auto_1432889 ) ) ( not ( = ?auto_1432885 ?auto_1432890 ) ) ( not ( = ?auto_1432885 ?auto_1432892 ) ) ( not ( = ?auto_1432887 ?auto_1432886 ) ) ( not ( = ?auto_1432887 ?auto_1432888 ) ) ( not ( = ?auto_1432887 ?auto_1432889 ) ) ( not ( = ?auto_1432887 ?auto_1432890 ) ) ( not ( = ?auto_1432887 ?auto_1432892 ) ) ( not ( = ?auto_1432886 ?auto_1432888 ) ) ( not ( = ?auto_1432886 ?auto_1432889 ) ) ( not ( = ?auto_1432886 ?auto_1432890 ) ) ( not ( = ?auto_1432886 ?auto_1432892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432888 ?auto_1432889 ?auto_1432890 )
      ( MAKE-7CRATE-VERIFY ?auto_1432883 ?auto_1432884 ?auto_1432885 ?auto_1432887 ?auto_1432886 ?auto_1432888 ?auto_1432889 ?auto_1432890 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1432948 - SURFACE
      ?auto_1432949 - SURFACE
      ?auto_1432950 - SURFACE
      ?auto_1432952 - SURFACE
      ?auto_1432951 - SURFACE
      ?auto_1432953 - SURFACE
      ?auto_1432954 - SURFACE
    )
    :vars
    (
      ?auto_1432959 - HOIST
      ?auto_1432956 - PLACE
      ?auto_1432957 - PLACE
      ?auto_1432958 - HOIST
      ?auto_1432960 - SURFACE
      ?auto_1432955 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432959 ?auto_1432956 ) ( IS-CRATE ?auto_1432954 ) ( not ( = ?auto_1432953 ?auto_1432954 ) ) ( not ( = ?auto_1432951 ?auto_1432953 ) ) ( not ( = ?auto_1432951 ?auto_1432954 ) ) ( not ( = ?auto_1432957 ?auto_1432956 ) ) ( HOIST-AT ?auto_1432958 ?auto_1432957 ) ( not ( = ?auto_1432959 ?auto_1432958 ) ) ( AVAILABLE ?auto_1432958 ) ( SURFACE-AT ?auto_1432954 ?auto_1432957 ) ( ON ?auto_1432954 ?auto_1432960 ) ( CLEAR ?auto_1432954 ) ( not ( = ?auto_1432953 ?auto_1432960 ) ) ( not ( = ?auto_1432954 ?auto_1432960 ) ) ( not ( = ?auto_1432951 ?auto_1432960 ) ) ( SURFACE-AT ?auto_1432951 ?auto_1432956 ) ( CLEAR ?auto_1432951 ) ( IS-CRATE ?auto_1432953 ) ( AVAILABLE ?auto_1432959 ) ( IN ?auto_1432953 ?auto_1432955 ) ( TRUCK-AT ?auto_1432955 ?auto_1432957 ) ( ON ?auto_1432949 ?auto_1432948 ) ( ON ?auto_1432950 ?auto_1432949 ) ( ON ?auto_1432952 ?auto_1432950 ) ( ON ?auto_1432951 ?auto_1432952 ) ( not ( = ?auto_1432948 ?auto_1432949 ) ) ( not ( = ?auto_1432948 ?auto_1432950 ) ) ( not ( = ?auto_1432948 ?auto_1432952 ) ) ( not ( = ?auto_1432948 ?auto_1432951 ) ) ( not ( = ?auto_1432948 ?auto_1432953 ) ) ( not ( = ?auto_1432948 ?auto_1432954 ) ) ( not ( = ?auto_1432948 ?auto_1432960 ) ) ( not ( = ?auto_1432949 ?auto_1432950 ) ) ( not ( = ?auto_1432949 ?auto_1432952 ) ) ( not ( = ?auto_1432949 ?auto_1432951 ) ) ( not ( = ?auto_1432949 ?auto_1432953 ) ) ( not ( = ?auto_1432949 ?auto_1432954 ) ) ( not ( = ?auto_1432949 ?auto_1432960 ) ) ( not ( = ?auto_1432950 ?auto_1432952 ) ) ( not ( = ?auto_1432950 ?auto_1432951 ) ) ( not ( = ?auto_1432950 ?auto_1432953 ) ) ( not ( = ?auto_1432950 ?auto_1432954 ) ) ( not ( = ?auto_1432950 ?auto_1432960 ) ) ( not ( = ?auto_1432952 ?auto_1432951 ) ) ( not ( = ?auto_1432952 ?auto_1432953 ) ) ( not ( = ?auto_1432952 ?auto_1432954 ) ) ( not ( = ?auto_1432952 ?auto_1432960 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432951 ?auto_1432953 ?auto_1432954 )
      ( MAKE-6CRATE-VERIFY ?auto_1432948 ?auto_1432949 ?auto_1432950 ?auto_1432952 ?auto_1432951 ?auto_1432953 ?auto_1432954 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1432961 - SURFACE
      ?auto_1432962 - SURFACE
      ?auto_1432963 - SURFACE
      ?auto_1432965 - SURFACE
      ?auto_1432964 - SURFACE
      ?auto_1432966 - SURFACE
      ?auto_1432967 - SURFACE
      ?auto_1432968 - SURFACE
    )
    :vars
    (
      ?auto_1432973 - HOIST
      ?auto_1432970 - PLACE
      ?auto_1432971 - PLACE
      ?auto_1432972 - HOIST
      ?auto_1432974 - SURFACE
      ?auto_1432969 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1432973 ?auto_1432970 ) ( IS-CRATE ?auto_1432968 ) ( not ( = ?auto_1432967 ?auto_1432968 ) ) ( not ( = ?auto_1432966 ?auto_1432967 ) ) ( not ( = ?auto_1432966 ?auto_1432968 ) ) ( not ( = ?auto_1432971 ?auto_1432970 ) ) ( HOIST-AT ?auto_1432972 ?auto_1432971 ) ( not ( = ?auto_1432973 ?auto_1432972 ) ) ( AVAILABLE ?auto_1432972 ) ( SURFACE-AT ?auto_1432968 ?auto_1432971 ) ( ON ?auto_1432968 ?auto_1432974 ) ( CLEAR ?auto_1432968 ) ( not ( = ?auto_1432967 ?auto_1432974 ) ) ( not ( = ?auto_1432968 ?auto_1432974 ) ) ( not ( = ?auto_1432966 ?auto_1432974 ) ) ( SURFACE-AT ?auto_1432966 ?auto_1432970 ) ( CLEAR ?auto_1432966 ) ( IS-CRATE ?auto_1432967 ) ( AVAILABLE ?auto_1432973 ) ( IN ?auto_1432967 ?auto_1432969 ) ( TRUCK-AT ?auto_1432969 ?auto_1432971 ) ( ON ?auto_1432962 ?auto_1432961 ) ( ON ?auto_1432963 ?auto_1432962 ) ( ON ?auto_1432965 ?auto_1432963 ) ( ON ?auto_1432964 ?auto_1432965 ) ( ON ?auto_1432966 ?auto_1432964 ) ( not ( = ?auto_1432961 ?auto_1432962 ) ) ( not ( = ?auto_1432961 ?auto_1432963 ) ) ( not ( = ?auto_1432961 ?auto_1432965 ) ) ( not ( = ?auto_1432961 ?auto_1432964 ) ) ( not ( = ?auto_1432961 ?auto_1432966 ) ) ( not ( = ?auto_1432961 ?auto_1432967 ) ) ( not ( = ?auto_1432961 ?auto_1432968 ) ) ( not ( = ?auto_1432961 ?auto_1432974 ) ) ( not ( = ?auto_1432962 ?auto_1432963 ) ) ( not ( = ?auto_1432962 ?auto_1432965 ) ) ( not ( = ?auto_1432962 ?auto_1432964 ) ) ( not ( = ?auto_1432962 ?auto_1432966 ) ) ( not ( = ?auto_1432962 ?auto_1432967 ) ) ( not ( = ?auto_1432962 ?auto_1432968 ) ) ( not ( = ?auto_1432962 ?auto_1432974 ) ) ( not ( = ?auto_1432963 ?auto_1432965 ) ) ( not ( = ?auto_1432963 ?auto_1432964 ) ) ( not ( = ?auto_1432963 ?auto_1432966 ) ) ( not ( = ?auto_1432963 ?auto_1432967 ) ) ( not ( = ?auto_1432963 ?auto_1432968 ) ) ( not ( = ?auto_1432963 ?auto_1432974 ) ) ( not ( = ?auto_1432965 ?auto_1432964 ) ) ( not ( = ?auto_1432965 ?auto_1432966 ) ) ( not ( = ?auto_1432965 ?auto_1432967 ) ) ( not ( = ?auto_1432965 ?auto_1432968 ) ) ( not ( = ?auto_1432965 ?auto_1432974 ) ) ( not ( = ?auto_1432964 ?auto_1432966 ) ) ( not ( = ?auto_1432964 ?auto_1432967 ) ) ( not ( = ?auto_1432964 ?auto_1432968 ) ) ( not ( = ?auto_1432964 ?auto_1432974 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1432966 ?auto_1432967 ?auto_1432968 )
      ( MAKE-7CRATE-VERIFY ?auto_1432961 ?auto_1432962 ?auto_1432963 ?auto_1432965 ?auto_1432964 ?auto_1432966 ?auto_1432967 ?auto_1432968 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1433026 - SURFACE
      ?auto_1433027 - SURFACE
      ?auto_1433028 - SURFACE
      ?auto_1433030 - SURFACE
      ?auto_1433029 - SURFACE
      ?auto_1433031 - SURFACE
      ?auto_1433032 - SURFACE
    )
    :vars
    (
      ?auto_1433033 - HOIST
      ?auto_1433035 - PLACE
      ?auto_1433036 - PLACE
      ?auto_1433034 - HOIST
      ?auto_1433038 - SURFACE
      ?auto_1433037 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433033 ?auto_1433035 ) ( IS-CRATE ?auto_1433032 ) ( not ( = ?auto_1433031 ?auto_1433032 ) ) ( not ( = ?auto_1433029 ?auto_1433031 ) ) ( not ( = ?auto_1433029 ?auto_1433032 ) ) ( not ( = ?auto_1433036 ?auto_1433035 ) ) ( HOIST-AT ?auto_1433034 ?auto_1433036 ) ( not ( = ?auto_1433033 ?auto_1433034 ) ) ( SURFACE-AT ?auto_1433032 ?auto_1433036 ) ( ON ?auto_1433032 ?auto_1433038 ) ( CLEAR ?auto_1433032 ) ( not ( = ?auto_1433031 ?auto_1433038 ) ) ( not ( = ?auto_1433032 ?auto_1433038 ) ) ( not ( = ?auto_1433029 ?auto_1433038 ) ) ( SURFACE-AT ?auto_1433029 ?auto_1433035 ) ( CLEAR ?auto_1433029 ) ( IS-CRATE ?auto_1433031 ) ( AVAILABLE ?auto_1433033 ) ( TRUCK-AT ?auto_1433037 ?auto_1433036 ) ( LIFTING ?auto_1433034 ?auto_1433031 ) ( ON ?auto_1433027 ?auto_1433026 ) ( ON ?auto_1433028 ?auto_1433027 ) ( ON ?auto_1433030 ?auto_1433028 ) ( ON ?auto_1433029 ?auto_1433030 ) ( not ( = ?auto_1433026 ?auto_1433027 ) ) ( not ( = ?auto_1433026 ?auto_1433028 ) ) ( not ( = ?auto_1433026 ?auto_1433030 ) ) ( not ( = ?auto_1433026 ?auto_1433029 ) ) ( not ( = ?auto_1433026 ?auto_1433031 ) ) ( not ( = ?auto_1433026 ?auto_1433032 ) ) ( not ( = ?auto_1433026 ?auto_1433038 ) ) ( not ( = ?auto_1433027 ?auto_1433028 ) ) ( not ( = ?auto_1433027 ?auto_1433030 ) ) ( not ( = ?auto_1433027 ?auto_1433029 ) ) ( not ( = ?auto_1433027 ?auto_1433031 ) ) ( not ( = ?auto_1433027 ?auto_1433032 ) ) ( not ( = ?auto_1433027 ?auto_1433038 ) ) ( not ( = ?auto_1433028 ?auto_1433030 ) ) ( not ( = ?auto_1433028 ?auto_1433029 ) ) ( not ( = ?auto_1433028 ?auto_1433031 ) ) ( not ( = ?auto_1433028 ?auto_1433032 ) ) ( not ( = ?auto_1433028 ?auto_1433038 ) ) ( not ( = ?auto_1433030 ?auto_1433029 ) ) ( not ( = ?auto_1433030 ?auto_1433031 ) ) ( not ( = ?auto_1433030 ?auto_1433032 ) ) ( not ( = ?auto_1433030 ?auto_1433038 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433029 ?auto_1433031 ?auto_1433032 )
      ( MAKE-6CRATE-VERIFY ?auto_1433026 ?auto_1433027 ?auto_1433028 ?auto_1433030 ?auto_1433029 ?auto_1433031 ?auto_1433032 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433039 - SURFACE
      ?auto_1433040 - SURFACE
      ?auto_1433041 - SURFACE
      ?auto_1433043 - SURFACE
      ?auto_1433042 - SURFACE
      ?auto_1433044 - SURFACE
      ?auto_1433045 - SURFACE
      ?auto_1433046 - SURFACE
    )
    :vars
    (
      ?auto_1433047 - HOIST
      ?auto_1433049 - PLACE
      ?auto_1433050 - PLACE
      ?auto_1433048 - HOIST
      ?auto_1433052 - SURFACE
      ?auto_1433051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433047 ?auto_1433049 ) ( IS-CRATE ?auto_1433046 ) ( not ( = ?auto_1433045 ?auto_1433046 ) ) ( not ( = ?auto_1433044 ?auto_1433045 ) ) ( not ( = ?auto_1433044 ?auto_1433046 ) ) ( not ( = ?auto_1433050 ?auto_1433049 ) ) ( HOIST-AT ?auto_1433048 ?auto_1433050 ) ( not ( = ?auto_1433047 ?auto_1433048 ) ) ( SURFACE-AT ?auto_1433046 ?auto_1433050 ) ( ON ?auto_1433046 ?auto_1433052 ) ( CLEAR ?auto_1433046 ) ( not ( = ?auto_1433045 ?auto_1433052 ) ) ( not ( = ?auto_1433046 ?auto_1433052 ) ) ( not ( = ?auto_1433044 ?auto_1433052 ) ) ( SURFACE-AT ?auto_1433044 ?auto_1433049 ) ( CLEAR ?auto_1433044 ) ( IS-CRATE ?auto_1433045 ) ( AVAILABLE ?auto_1433047 ) ( TRUCK-AT ?auto_1433051 ?auto_1433050 ) ( LIFTING ?auto_1433048 ?auto_1433045 ) ( ON ?auto_1433040 ?auto_1433039 ) ( ON ?auto_1433041 ?auto_1433040 ) ( ON ?auto_1433043 ?auto_1433041 ) ( ON ?auto_1433042 ?auto_1433043 ) ( ON ?auto_1433044 ?auto_1433042 ) ( not ( = ?auto_1433039 ?auto_1433040 ) ) ( not ( = ?auto_1433039 ?auto_1433041 ) ) ( not ( = ?auto_1433039 ?auto_1433043 ) ) ( not ( = ?auto_1433039 ?auto_1433042 ) ) ( not ( = ?auto_1433039 ?auto_1433044 ) ) ( not ( = ?auto_1433039 ?auto_1433045 ) ) ( not ( = ?auto_1433039 ?auto_1433046 ) ) ( not ( = ?auto_1433039 ?auto_1433052 ) ) ( not ( = ?auto_1433040 ?auto_1433041 ) ) ( not ( = ?auto_1433040 ?auto_1433043 ) ) ( not ( = ?auto_1433040 ?auto_1433042 ) ) ( not ( = ?auto_1433040 ?auto_1433044 ) ) ( not ( = ?auto_1433040 ?auto_1433045 ) ) ( not ( = ?auto_1433040 ?auto_1433046 ) ) ( not ( = ?auto_1433040 ?auto_1433052 ) ) ( not ( = ?auto_1433041 ?auto_1433043 ) ) ( not ( = ?auto_1433041 ?auto_1433042 ) ) ( not ( = ?auto_1433041 ?auto_1433044 ) ) ( not ( = ?auto_1433041 ?auto_1433045 ) ) ( not ( = ?auto_1433041 ?auto_1433046 ) ) ( not ( = ?auto_1433041 ?auto_1433052 ) ) ( not ( = ?auto_1433043 ?auto_1433042 ) ) ( not ( = ?auto_1433043 ?auto_1433044 ) ) ( not ( = ?auto_1433043 ?auto_1433045 ) ) ( not ( = ?auto_1433043 ?auto_1433046 ) ) ( not ( = ?auto_1433043 ?auto_1433052 ) ) ( not ( = ?auto_1433042 ?auto_1433044 ) ) ( not ( = ?auto_1433042 ?auto_1433045 ) ) ( not ( = ?auto_1433042 ?auto_1433046 ) ) ( not ( = ?auto_1433042 ?auto_1433052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433044 ?auto_1433045 ?auto_1433046 )
      ( MAKE-7CRATE-VERIFY ?auto_1433039 ?auto_1433040 ?auto_1433041 ?auto_1433043 ?auto_1433042 ?auto_1433044 ?auto_1433045 ?auto_1433046 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1433109 - SURFACE
      ?auto_1433110 - SURFACE
      ?auto_1433111 - SURFACE
      ?auto_1433113 - SURFACE
      ?auto_1433112 - SURFACE
      ?auto_1433114 - SURFACE
      ?auto_1433115 - SURFACE
    )
    :vars
    (
      ?auto_1433117 - HOIST
      ?auto_1433118 - PLACE
      ?auto_1433119 - PLACE
      ?auto_1433121 - HOIST
      ?auto_1433120 - SURFACE
      ?auto_1433116 - TRUCK
      ?auto_1433122 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433117 ?auto_1433118 ) ( IS-CRATE ?auto_1433115 ) ( not ( = ?auto_1433114 ?auto_1433115 ) ) ( not ( = ?auto_1433112 ?auto_1433114 ) ) ( not ( = ?auto_1433112 ?auto_1433115 ) ) ( not ( = ?auto_1433119 ?auto_1433118 ) ) ( HOIST-AT ?auto_1433121 ?auto_1433119 ) ( not ( = ?auto_1433117 ?auto_1433121 ) ) ( SURFACE-AT ?auto_1433115 ?auto_1433119 ) ( ON ?auto_1433115 ?auto_1433120 ) ( CLEAR ?auto_1433115 ) ( not ( = ?auto_1433114 ?auto_1433120 ) ) ( not ( = ?auto_1433115 ?auto_1433120 ) ) ( not ( = ?auto_1433112 ?auto_1433120 ) ) ( SURFACE-AT ?auto_1433112 ?auto_1433118 ) ( CLEAR ?auto_1433112 ) ( IS-CRATE ?auto_1433114 ) ( AVAILABLE ?auto_1433117 ) ( TRUCK-AT ?auto_1433116 ?auto_1433119 ) ( AVAILABLE ?auto_1433121 ) ( SURFACE-AT ?auto_1433114 ?auto_1433119 ) ( ON ?auto_1433114 ?auto_1433122 ) ( CLEAR ?auto_1433114 ) ( not ( = ?auto_1433114 ?auto_1433122 ) ) ( not ( = ?auto_1433115 ?auto_1433122 ) ) ( not ( = ?auto_1433112 ?auto_1433122 ) ) ( not ( = ?auto_1433120 ?auto_1433122 ) ) ( ON ?auto_1433110 ?auto_1433109 ) ( ON ?auto_1433111 ?auto_1433110 ) ( ON ?auto_1433113 ?auto_1433111 ) ( ON ?auto_1433112 ?auto_1433113 ) ( not ( = ?auto_1433109 ?auto_1433110 ) ) ( not ( = ?auto_1433109 ?auto_1433111 ) ) ( not ( = ?auto_1433109 ?auto_1433113 ) ) ( not ( = ?auto_1433109 ?auto_1433112 ) ) ( not ( = ?auto_1433109 ?auto_1433114 ) ) ( not ( = ?auto_1433109 ?auto_1433115 ) ) ( not ( = ?auto_1433109 ?auto_1433120 ) ) ( not ( = ?auto_1433109 ?auto_1433122 ) ) ( not ( = ?auto_1433110 ?auto_1433111 ) ) ( not ( = ?auto_1433110 ?auto_1433113 ) ) ( not ( = ?auto_1433110 ?auto_1433112 ) ) ( not ( = ?auto_1433110 ?auto_1433114 ) ) ( not ( = ?auto_1433110 ?auto_1433115 ) ) ( not ( = ?auto_1433110 ?auto_1433120 ) ) ( not ( = ?auto_1433110 ?auto_1433122 ) ) ( not ( = ?auto_1433111 ?auto_1433113 ) ) ( not ( = ?auto_1433111 ?auto_1433112 ) ) ( not ( = ?auto_1433111 ?auto_1433114 ) ) ( not ( = ?auto_1433111 ?auto_1433115 ) ) ( not ( = ?auto_1433111 ?auto_1433120 ) ) ( not ( = ?auto_1433111 ?auto_1433122 ) ) ( not ( = ?auto_1433113 ?auto_1433112 ) ) ( not ( = ?auto_1433113 ?auto_1433114 ) ) ( not ( = ?auto_1433113 ?auto_1433115 ) ) ( not ( = ?auto_1433113 ?auto_1433120 ) ) ( not ( = ?auto_1433113 ?auto_1433122 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433112 ?auto_1433114 ?auto_1433115 )
      ( MAKE-6CRATE-VERIFY ?auto_1433109 ?auto_1433110 ?auto_1433111 ?auto_1433113 ?auto_1433112 ?auto_1433114 ?auto_1433115 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433123 - SURFACE
      ?auto_1433124 - SURFACE
      ?auto_1433125 - SURFACE
      ?auto_1433127 - SURFACE
      ?auto_1433126 - SURFACE
      ?auto_1433128 - SURFACE
      ?auto_1433129 - SURFACE
      ?auto_1433130 - SURFACE
    )
    :vars
    (
      ?auto_1433132 - HOIST
      ?auto_1433133 - PLACE
      ?auto_1433134 - PLACE
      ?auto_1433136 - HOIST
      ?auto_1433135 - SURFACE
      ?auto_1433131 - TRUCK
      ?auto_1433137 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433132 ?auto_1433133 ) ( IS-CRATE ?auto_1433130 ) ( not ( = ?auto_1433129 ?auto_1433130 ) ) ( not ( = ?auto_1433128 ?auto_1433129 ) ) ( not ( = ?auto_1433128 ?auto_1433130 ) ) ( not ( = ?auto_1433134 ?auto_1433133 ) ) ( HOIST-AT ?auto_1433136 ?auto_1433134 ) ( not ( = ?auto_1433132 ?auto_1433136 ) ) ( SURFACE-AT ?auto_1433130 ?auto_1433134 ) ( ON ?auto_1433130 ?auto_1433135 ) ( CLEAR ?auto_1433130 ) ( not ( = ?auto_1433129 ?auto_1433135 ) ) ( not ( = ?auto_1433130 ?auto_1433135 ) ) ( not ( = ?auto_1433128 ?auto_1433135 ) ) ( SURFACE-AT ?auto_1433128 ?auto_1433133 ) ( CLEAR ?auto_1433128 ) ( IS-CRATE ?auto_1433129 ) ( AVAILABLE ?auto_1433132 ) ( TRUCK-AT ?auto_1433131 ?auto_1433134 ) ( AVAILABLE ?auto_1433136 ) ( SURFACE-AT ?auto_1433129 ?auto_1433134 ) ( ON ?auto_1433129 ?auto_1433137 ) ( CLEAR ?auto_1433129 ) ( not ( = ?auto_1433129 ?auto_1433137 ) ) ( not ( = ?auto_1433130 ?auto_1433137 ) ) ( not ( = ?auto_1433128 ?auto_1433137 ) ) ( not ( = ?auto_1433135 ?auto_1433137 ) ) ( ON ?auto_1433124 ?auto_1433123 ) ( ON ?auto_1433125 ?auto_1433124 ) ( ON ?auto_1433127 ?auto_1433125 ) ( ON ?auto_1433126 ?auto_1433127 ) ( ON ?auto_1433128 ?auto_1433126 ) ( not ( = ?auto_1433123 ?auto_1433124 ) ) ( not ( = ?auto_1433123 ?auto_1433125 ) ) ( not ( = ?auto_1433123 ?auto_1433127 ) ) ( not ( = ?auto_1433123 ?auto_1433126 ) ) ( not ( = ?auto_1433123 ?auto_1433128 ) ) ( not ( = ?auto_1433123 ?auto_1433129 ) ) ( not ( = ?auto_1433123 ?auto_1433130 ) ) ( not ( = ?auto_1433123 ?auto_1433135 ) ) ( not ( = ?auto_1433123 ?auto_1433137 ) ) ( not ( = ?auto_1433124 ?auto_1433125 ) ) ( not ( = ?auto_1433124 ?auto_1433127 ) ) ( not ( = ?auto_1433124 ?auto_1433126 ) ) ( not ( = ?auto_1433124 ?auto_1433128 ) ) ( not ( = ?auto_1433124 ?auto_1433129 ) ) ( not ( = ?auto_1433124 ?auto_1433130 ) ) ( not ( = ?auto_1433124 ?auto_1433135 ) ) ( not ( = ?auto_1433124 ?auto_1433137 ) ) ( not ( = ?auto_1433125 ?auto_1433127 ) ) ( not ( = ?auto_1433125 ?auto_1433126 ) ) ( not ( = ?auto_1433125 ?auto_1433128 ) ) ( not ( = ?auto_1433125 ?auto_1433129 ) ) ( not ( = ?auto_1433125 ?auto_1433130 ) ) ( not ( = ?auto_1433125 ?auto_1433135 ) ) ( not ( = ?auto_1433125 ?auto_1433137 ) ) ( not ( = ?auto_1433127 ?auto_1433126 ) ) ( not ( = ?auto_1433127 ?auto_1433128 ) ) ( not ( = ?auto_1433127 ?auto_1433129 ) ) ( not ( = ?auto_1433127 ?auto_1433130 ) ) ( not ( = ?auto_1433127 ?auto_1433135 ) ) ( not ( = ?auto_1433127 ?auto_1433137 ) ) ( not ( = ?auto_1433126 ?auto_1433128 ) ) ( not ( = ?auto_1433126 ?auto_1433129 ) ) ( not ( = ?auto_1433126 ?auto_1433130 ) ) ( not ( = ?auto_1433126 ?auto_1433135 ) ) ( not ( = ?auto_1433126 ?auto_1433137 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433128 ?auto_1433129 ?auto_1433130 )
      ( MAKE-7CRATE-VERIFY ?auto_1433123 ?auto_1433124 ?auto_1433125 ?auto_1433127 ?auto_1433126 ?auto_1433128 ?auto_1433129 ?auto_1433130 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1433194 - SURFACE
      ?auto_1433195 - SURFACE
      ?auto_1433196 - SURFACE
      ?auto_1433198 - SURFACE
      ?auto_1433197 - SURFACE
      ?auto_1433199 - SURFACE
      ?auto_1433200 - SURFACE
    )
    :vars
    (
      ?auto_1433203 - HOIST
      ?auto_1433202 - PLACE
      ?auto_1433205 - PLACE
      ?auto_1433204 - HOIST
      ?auto_1433201 - SURFACE
      ?auto_1433206 - SURFACE
      ?auto_1433207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433203 ?auto_1433202 ) ( IS-CRATE ?auto_1433200 ) ( not ( = ?auto_1433199 ?auto_1433200 ) ) ( not ( = ?auto_1433197 ?auto_1433199 ) ) ( not ( = ?auto_1433197 ?auto_1433200 ) ) ( not ( = ?auto_1433205 ?auto_1433202 ) ) ( HOIST-AT ?auto_1433204 ?auto_1433205 ) ( not ( = ?auto_1433203 ?auto_1433204 ) ) ( SURFACE-AT ?auto_1433200 ?auto_1433205 ) ( ON ?auto_1433200 ?auto_1433201 ) ( CLEAR ?auto_1433200 ) ( not ( = ?auto_1433199 ?auto_1433201 ) ) ( not ( = ?auto_1433200 ?auto_1433201 ) ) ( not ( = ?auto_1433197 ?auto_1433201 ) ) ( SURFACE-AT ?auto_1433197 ?auto_1433202 ) ( CLEAR ?auto_1433197 ) ( IS-CRATE ?auto_1433199 ) ( AVAILABLE ?auto_1433203 ) ( AVAILABLE ?auto_1433204 ) ( SURFACE-AT ?auto_1433199 ?auto_1433205 ) ( ON ?auto_1433199 ?auto_1433206 ) ( CLEAR ?auto_1433199 ) ( not ( = ?auto_1433199 ?auto_1433206 ) ) ( not ( = ?auto_1433200 ?auto_1433206 ) ) ( not ( = ?auto_1433197 ?auto_1433206 ) ) ( not ( = ?auto_1433201 ?auto_1433206 ) ) ( TRUCK-AT ?auto_1433207 ?auto_1433202 ) ( ON ?auto_1433195 ?auto_1433194 ) ( ON ?auto_1433196 ?auto_1433195 ) ( ON ?auto_1433198 ?auto_1433196 ) ( ON ?auto_1433197 ?auto_1433198 ) ( not ( = ?auto_1433194 ?auto_1433195 ) ) ( not ( = ?auto_1433194 ?auto_1433196 ) ) ( not ( = ?auto_1433194 ?auto_1433198 ) ) ( not ( = ?auto_1433194 ?auto_1433197 ) ) ( not ( = ?auto_1433194 ?auto_1433199 ) ) ( not ( = ?auto_1433194 ?auto_1433200 ) ) ( not ( = ?auto_1433194 ?auto_1433201 ) ) ( not ( = ?auto_1433194 ?auto_1433206 ) ) ( not ( = ?auto_1433195 ?auto_1433196 ) ) ( not ( = ?auto_1433195 ?auto_1433198 ) ) ( not ( = ?auto_1433195 ?auto_1433197 ) ) ( not ( = ?auto_1433195 ?auto_1433199 ) ) ( not ( = ?auto_1433195 ?auto_1433200 ) ) ( not ( = ?auto_1433195 ?auto_1433201 ) ) ( not ( = ?auto_1433195 ?auto_1433206 ) ) ( not ( = ?auto_1433196 ?auto_1433198 ) ) ( not ( = ?auto_1433196 ?auto_1433197 ) ) ( not ( = ?auto_1433196 ?auto_1433199 ) ) ( not ( = ?auto_1433196 ?auto_1433200 ) ) ( not ( = ?auto_1433196 ?auto_1433201 ) ) ( not ( = ?auto_1433196 ?auto_1433206 ) ) ( not ( = ?auto_1433198 ?auto_1433197 ) ) ( not ( = ?auto_1433198 ?auto_1433199 ) ) ( not ( = ?auto_1433198 ?auto_1433200 ) ) ( not ( = ?auto_1433198 ?auto_1433201 ) ) ( not ( = ?auto_1433198 ?auto_1433206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433197 ?auto_1433199 ?auto_1433200 )
      ( MAKE-6CRATE-VERIFY ?auto_1433194 ?auto_1433195 ?auto_1433196 ?auto_1433198 ?auto_1433197 ?auto_1433199 ?auto_1433200 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433208 - SURFACE
      ?auto_1433209 - SURFACE
      ?auto_1433210 - SURFACE
      ?auto_1433212 - SURFACE
      ?auto_1433211 - SURFACE
      ?auto_1433213 - SURFACE
      ?auto_1433214 - SURFACE
      ?auto_1433215 - SURFACE
    )
    :vars
    (
      ?auto_1433218 - HOIST
      ?auto_1433217 - PLACE
      ?auto_1433220 - PLACE
      ?auto_1433219 - HOIST
      ?auto_1433216 - SURFACE
      ?auto_1433221 - SURFACE
      ?auto_1433222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433218 ?auto_1433217 ) ( IS-CRATE ?auto_1433215 ) ( not ( = ?auto_1433214 ?auto_1433215 ) ) ( not ( = ?auto_1433213 ?auto_1433214 ) ) ( not ( = ?auto_1433213 ?auto_1433215 ) ) ( not ( = ?auto_1433220 ?auto_1433217 ) ) ( HOIST-AT ?auto_1433219 ?auto_1433220 ) ( not ( = ?auto_1433218 ?auto_1433219 ) ) ( SURFACE-AT ?auto_1433215 ?auto_1433220 ) ( ON ?auto_1433215 ?auto_1433216 ) ( CLEAR ?auto_1433215 ) ( not ( = ?auto_1433214 ?auto_1433216 ) ) ( not ( = ?auto_1433215 ?auto_1433216 ) ) ( not ( = ?auto_1433213 ?auto_1433216 ) ) ( SURFACE-AT ?auto_1433213 ?auto_1433217 ) ( CLEAR ?auto_1433213 ) ( IS-CRATE ?auto_1433214 ) ( AVAILABLE ?auto_1433218 ) ( AVAILABLE ?auto_1433219 ) ( SURFACE-AT ?auto_1433214 ?auto_1433220 ) ( ON ?auto_1433214 ?auto_1433221 ) ( CLEAR ?auto_1433214 ) ( not ( = ?auto_1433214 ?auto_1433221 ) ) ( not ( = ?auto_1433215 ?auto_1433221 ) ) ( not ( = ?auto_1433213 ?auto_1433221 ) ) ( not ( = ?auto_1433216 ?auto_1433221 ) ) ( TRUCK-AT ?auto_1433222 ?auto_1433217 ) ( ON ?auto_1433209 ?auto_1433208 ) ( ON ?auto_1433210 ?auto_1433209 ) ( ON ?auto_1433212 ?auto_1433210 ) ( ON ?auto_1433211 ?auto_1433212 ) ( ON ?auto_1433213 ?auto_1433211 ) ( not ( = ?auto_1433208 ?auto_1433209 ) ) ( not ( = ?auto_1433208 ?auto_1433210 ) ) ( not ( = ?auto_1433208 ?auto_1433212 ) ) ( not ( = ?auto_1433208 ?auto_1433211 ) ) ( not ( = ?auto_1433208 ?auto_1433213 ) ) ( not ( = ?auto_1433208 ?auto_1433214 ) ) ( not ( = ?auto_1433208 ?auto_1433215 ) ) ( not ( = ?auto_1433208 ?auto_1433216 ) ) ( not ( = ?auto_1433208 ?auto_1433221 ) ) ( not ( = ?auto_1433209 ?auto_1433210 ) ) ( not ( = ?auto_1433209 ?auto_1433212 ) ) ( not ( = ?auto_1433209 ?auto_1433211 ) ) ( not ( = ?auto_1433209 ?auto_1433213 ) ) ( not ( = ?auto_1433209 ?auto_1433214 ) ) ( not ( = ?auto_1433209 ?auto_1433215 ) ) ( not ( = ?auto_1433209 ?auto_1433216 ) ) ( not ( = ?auto_1433209 ?auto_1433221 ) ) ( not ( = ?auto_1433210 ?auto_1433212 ) ) ( not ( = ?auto_1433210 ?auto_1433211 ) ) ( not ( = ?auto_1433210 ?auto_1433213 ) ) ( not ( = ?auto_1433210 ?auto_1433214 ) ) ( not ( = ?auto_1433210 ?auto_1433215 ) ) ( not ( = ?auto_1433210 ?auto_1433216 ) ) ( not ( = ?auto_1433210 ?auto_1433221 ) ) ( not ( = ?auto_1433212 ?auto_1433211 ) ) ( not ( = ?auto_1433212 ?auto_1433213 ) ) ( not ( = ?auto_1433212 ?auto_1433214 ) ) ( not ( = ?auto_1433212 ?auto_1433215 ) ) ( not ( = ?auto_1433212 ?auto_1433216 ) ) ( not ( = ?auto_1433212 ?auto_1433221 ) ) ( not ( = ?auto_1433211 ?auto_1433213 ) ) ( not ( = ?auto_1433211 ?auto_1433214 ) ) ( not ( = ?auto_1433211 ?auto_1433215 ) ) ( not ( = ?auto_1433211 ?auto_1433216 ) ) ( not ( = ?auto_1433211 ?auto_1433221 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433213 ?auto_1433214 ?auto_1433215 )
      ( MAKE-7CRATE-VERIFY ?auto_1433208 ?auto_1433209 ?auto_1433210 ?auto_1433212 ?auto_1433211 ?auto_1433213 ?auto_1433214 ?auto_1433215 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1433281 - SURFACE
      ?auto_1433282 - SURFACE
      ?auto_1433283 - SURFACE
      ?auto_1433285 - SURFACE
      ?auto_1433284 - SURFACE
      ?auto_1433286 - SURFACE
      ?auto_1433287 - SURFACE
    )
    :vars
    (
      ?auto_1433289 - HOIST
      ?auto_1433288 - PLACE
      ?auto_1433291 - PLACE
      ?auto_1433292 - HOIST
      ?auto_1433293 - SURFACE
      ?auto_1433290 - SURFACE
      ?auto_1433294 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433289 ?auto_1433288 ) ( IS-CRATE ?auto_1433287 ) ( not ( = ?auto_1433286 ?auto_1433287 ) ) ( not ( = ?auto_1433284 ?auto_1433286 ) ) ( not ( = ?auto_1433284 ?auto_1433287 ) ) ( not ( = ?auto_1433291 ?auto_1433288 ) ) ( HOIST-AT ?auto_1433292 ?auto_1433291 ) ( not ( = ?auto_1433289 ?auto_1433292 ) ) ( SURFACE-AT ?auto_1433287 ?auto_1433291 ) ( ON ?auto_1433287 ?auto_1433293 ) ( CLEAR ?auto_1433287 ) ( not ( = ?auto_1433286 ?auto_1433293 ) ) ( not ( = ?auto_1433287 ?auto_1433293 ) ) ( not ( = ?auto_1433284 ?auto_1433293 ) ) ( IS-CRATE ?auto_1433286 ) ( AVAILABLE ?auto_1433292 ) ( SURFACE-AT ?auto_1433286 ?auto_1433291 ) ( ON ?auto_1433286 ?auto_1433290 ) ( CLEAR ?auto_1433286 ) ( not ( = ?auto_1433286 ?auto_1433290 ) ) ( not ( = ?auto_1433287 ?auto_1433290 ) ) ( not ( = ?auto_1433284 ?auto_1433290 ) ) ( not ( = ?auto_1433293 ?auto_1433290 ) ) ( TRUCK-AT ?auto_1433294 ?auto_1433288 ) ( SURFACE-AT ?auto_1433285 ?auto_1433288 ) ( CLEAR ?auto_1433285 ) ( LIFTING ?auto_1433289 ?auto_1433284 ) ( IS-CRATE ?auto_1433284 ) ( not ( = ?auto_1433285 ?auto_1433284 ) ) ( not ( = ?auto_1433286 ?auto_1433285 ) ) ( not ( = ?auto_1433287 ?auto_1433285 ) ) ( not ( = ?auto_1433293 ?auto_1433285 ) ) ( not ( = ?auto_1433290 ?auto_1433285 ) ) ( ON ?auto_1433282 ?auto_1433281 ) ( ON ?auto_1433283 ?auto_1433282 ) ( ON ?auto_1433285 ?auto_1433283 ) ( not ( = ?auto_1433281 ?auto_1433282 ) ) ( not ( = ?auto_1433281 ?auto_1433283 ) ) ( not ( = ?auto_1433281 ?auto_1433285 ) ) ( not ( = ?auto_1433281 ?auto_1433284 ) ) ( not ( = ?auto_1433281 ?auto_1433286 ) ) ( not ( = ?auto_1433281 ?auto_1433287 ) ) ( not ( = ?auto_1433281 ?auto_1433293 ) ) ( not ( = ?auto_1433281 ?auto_1433290 ) ) ( not ( = ?auto_1433282 ?auto_1433283 ) ) ( not ( = ?auto_1433282 ?auto_1433285 ) ) ( not ( = ?auto_1433282 ?auto_1433284 ) ) ( not ( = ?auto_1433282 ?auto_1433286 ) ) ( not ( = ?auto_1433282 ?auto_1433287 ) ) ( not ( = ?auto_1433282 ?auto_1433293 ) ) ( not ( = ?auto_1433282 ?auto_1433290 ) ) ( not ( = ?auto_1433283 ?auto_1433285 ) ) ( not ( = ?auto_1433283 ?auto_1433284 ) ) ( not ( = ?auto_1433283 ?auto_1433286 ) ) ( not ( = ?auto_1433283 ?auto_1433287 ) ) ( not ( = ?auto_1433283 ?auto_1433293 ) ) ( not ( = ?auto_1433283 ?auto_1433290 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433284 ?auto_1433286 ?auto_1433287 )
      ( MAKE-6CRATE-VERIFY ?auto_1433281 ?auto_1433282 ?auto_1433283 ?auto_1433285 ?auto_1433284 ?auto_1433286 ?auto_1433287 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_1433295 - SURFACE
      ?auto_1433296 - SURFACE
      ?auto_1433297 - SURFACE
      ?auto_1433299 - SURFACE
      ?auto_1433298 - SURFACE
      ?auto_1433300 - SURFACE
      ?auto_1433301 - SURFACE
      ?auto_1433302 - SURFACE
    )
    :vars
    (
      ?auto_1433304 - HOIST
      ?auto_1433303 - PLACE
      ?auto_1433306 - PLACE
      ?auto_1433307 - HOIST
      ?auto_1433308 - SURFACE
      ?auto_1433305 - SURFACE
      ?auto_1433309 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1433304 ?auto_1433303 ) ( IS-CRATE ?auto_1433302 ) ( not ( = ?auto_1433301 ?auto_1433302 ) ) ( not ( = ?auto_1433300 ?auto_1433301 ) ) ( not ( = ?auto_1433300 ?auto_1433302 ) ) ( not ( = ?auto_1433306 ?auto_1433303 ) ) ( HOIST-AT ?auto_1433307 ?auto_1433306 ) ( not ( = ?auto_1433304 ?auto_1433307 ) ) ( SURFACE-AT ?auto_1433302 ?auto_1433306 ) ( ON ?auto_1433302 ?auto_1433308 ) ( CLEAR ?auto_1433302 ) ( not ( = ?auto_1433301 ?auto_1433308 ) ) ( not ( = ?auto_1433302 ?auto_1433308 ) ) ( not ( = ?auto_1433300 ?auto_1433308 ) ) ( IS-CRATE ?auto_1433301 ) ( AVAILABLE ?auto_1433307 ) ( SURFACE-AT ?auto_1433301 ?auto_1433306 ) ( ON ?auto_1433301 ?auto_1433305 ) ( CLEAR ?auto_1433301 ) ( not ( = ?auto_1433301 ?auto_1433305 ) ) ( not ( = ?auto_1433302 ?auto_1433305 ) ) ( not ( = ?auto_1433300 ?auto_1433305 ) ) ( not ( = ?auto_1433308 ?auto_1433305 ) ) ( TRUCK-AT ?auto_1433309 ?auto_1433303 ) ( SURFACE-AT ?auto_1433298 ?auto_1433303 ) ( CLEAR ?auto_1433298 ) ( LIFTING ?auto_1433304 ?auto_1433300 ) ( IS-CRATE ?auto_1433300 ) ( not ( = ?auto_1433298 ?auto_1433300 ) ) ( not ( = ?auto_1433301 ?auto_1433298 ) ) ( not ( = ?auto_1433302 ?auto_1433298 ) ) ( not ( = ?auto_1433308 ?auto_1433298 ) ) ( not ( = ?auto_1433305 ?auto_1433298 ) ) ( ON ?auto_1433296 ?auto_1433295 ) ( ON ?auto_1433297 ?auto_1433296 ) ( ON ?auto_1433299 ?auto_1433297 ) ( ON ?auto_1433298 ?auto_1433299 ) ( not ( = ?auto_1433295 ?auto_1433296 ) ) ( not ( = ?auto_1433295 ?auto_1433297 ) ) ( not ( = ?auto_1433295 ?auto_1433299 ) ) ( not ( = ?auto_1433295 ?auto_1433298 ) ) ( not ( = ?auto_1433295 ?auto_1433300 ) ) ( not ( = ?auto_1433295 ?auto_1433301 ) ) ( not ( = ?auto_1433295 ?auto_1433302 ) ) ( not ( = ?auto_1433295 ?auto_1433308 ) ) ( not ( = ?auto_1433295 ?auto_1433305 ) ) ( not ( = ?auto_1433296 ?auto_1433297 ) ) ( not ( = ?auto_1433296 ?auto_1433299 ) ) ( not ( = ?auto_1433296 ?auto_1433298 ) ) ( not ( = ?auto_1433296 ?auto_1433300 ) ) ( not ( = ?auto_1433296 ?auto_1433301 ) ) ( not ( = ?auto_1433296 ?auto_1433302 ) ) ( not ( = ?auto_1433296 ?auto_1433308 ) ) ( not ( = ?auto_1433296 ?auto_1433305 ) ) ( not ( = ?auto_1433297 ?auto_1433299 ) ) ( not ( = ?auto_1433297 ?auto_1433298 ) ) ( not ( = ?auto_1433297 ?auto_1433300 ) ) ( not ( = ?auto_1433297 ?auto_1433301 ) ) ( not ( = ?auto_1433297 ?auto_1433302 ) ) ( not ( = ?auto_1433297 ?auto_1433308 ) ) ( not ( = ?auto_1433297 ?auto_1433305 ) ) ( not ( = ?auto_1433299 ?auto_1433298 ) ) ( not ( = ?auto_1433299 ?auto_1433300 ) ) ( not ( = ?auto_1433299 ?auto_1433301 ) ) ( not ( = ?auto_1433299 ?auto_1433302 ) ) ( not ( = ?auto_1433299 ?auto_1433308 ) ) ( not ( = ?auto_1433299 ?auto_1433305 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1433300 ?auto_1433301 ?auto_1433302 )
      ( MAKE-7CRATE-VERIFY ?auto_1433295 ?auto_1433296 ?auto_1433297 ?auto_1433299 ?auto_1433298 ?auto_1433300 ?auto_1433301 ?auto_1433302 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1435689 - SURFACE
      ?auto_1435690 - SURFACE
      ?auto_1435691 - SURFACE
      ?auto_1435693 - SURFACE
      ?auto_1435692 - SURFACE
      ?auto_1435694 - SURFACE
      ?auto_1435695 - SURFACE
      ?auto_1435696 - SURFACE
      ?auto_1435697 - SURFACE
    )
    :vars
    (
      ?auto_1435699 - HOIST
      ?auto_1435698 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1435699 ?auto_1435698 ) ( SURFACE-AT ?auto_1435696 ?auto_1435698 ) ( CLEAR ?auto_1435696 ) ( LIFTING ?auto_1435699 ?auto_1435697 ) ( IS-CRATE ?auto_1435697 ) ( not ( = ?auto_1435696 ?auto_1435697 ) ) ( ON ?auto_1435690 ?auto_1435689 ) ( ON ?auto_1435691 ?auto_1435690 ) ( ON ?auto_1435693 ?auto_1435691 ) ( ON ?auto_1435692 ?auto_1435693 ) ( ON ?auto_1435694 ?auto_1435692 ) ( ON ?auto_1435695 ?auto_1435694 ) ( ON ?auto_1435696 ?auto_1435695 ) ( not ( = ?auto_1435689 ?auto_1435690 ) ) ( not ( = ?auto_1435689 ?auto_1435691 ) ) ( not ( = ?auto_1435689 ?auto_1435693 ) ) ( not ( = ?auto_1435689 ?auto_1435692 ) ) ( not ( = ?auto_1435689 ?auto_1435694 ) ) ( not ( = ?auto_1435689 ?auto_1435695 ) ) ( not ( = ?auto_1435689 ?auto_1435696 ) ) ( not ( = ?auto_1435689 ?auto_1435697 ) ) ( not ( = ?auto_1435690 ?auto_1435691 ) ) ( not ( = ?auto_1435690 ?auto_1435693 ) ) ( not ( = ?auto_1435690 ?auto_1435692 ) ) ( not ( = ?auto_1435690 ?auto_1435694 ) ) ( not ( = ?auto_1435690 ?auto_1435695 ) ) ( not ( = ?auto_1435690 ?auto_1435696 ) ) ( not ( = ?auto_1435690 ?auto_1435697 ) ) ( not ( = ?auto_1435691 ?auto_1435693 ) ) ( not ( = ?auto_1435691 ?auto_1435692 ) ) ( not ( = ?auto_1435691 ?auto_1435694 ) ) ( not ( = ?auto_1435691 ?auto_1435695 ) ) ( not ( = ?auto_1435691 ?auto_1435696 ) ) ( not ( = ?auto_1435691 ?auto_1435697 ) ) ( not ( = ?auto_1435693 ?auto_1435692 ) ) ( not ( = ?auto_1435693 ?auto_1435694 ) ) ( not ( = ?auto_1435693 ?auto_1435695 ) ) ( not ( = ?auto_1435693 ?auto_1435696 ) ) ( not ( = ?auto_1435693 ?auto_1435697 ) ) ( not ( = ?auto_1435692 ?auto_1435694 ) ) ( not ( = ?auto_1435692 ?auto_1435695 ) ) ( not ( = ?auto_1435692 ?auto_1435696 ) ) ( not ( = ?auto_1435692 ?auto_1435697 ) ) ( not ( = ?auto_1435694 ?auto_1435695 ) ) ( not ( = ?auto_1435694 ?auto_1435696 ) ) ( not ( = ?auto_1435694 ?auto_1435697 ) ) ( not ( = ?auto_1435695 ?auto_1435696 ) ) ( not ( = ?auto_1435695 ?auto_1435697 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1435696 ?auto_1435697 )
      ( MAKE-8CRATE-VERIFY ?auto_1435689 ?auto_1435690 ?auto_1435691 ?auto_1435693 ?auto_1435692 ?auto_1435694 ?auto_1435695 ?auto_1435696 ?auto_1435697 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1435756 - SURFACE
      ?auto_1435757 - SURFACE
      ?auto_1435758 - SURFACE
      ?auto_1435760 - SURFACE
      ?auto_1435759 - SURFACE
      ?auto_1435761 - SURFACE
      ?auto_1435762 - SURFACE
      ?auto_1435763 - SURFACE
      ?auto_1435764 - SURFACE
    )
    :vars
    (
      ?auto_1435765 - HOIST
      ?auto_1435766 - PLACE
      ?auto_1435767 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1435765 ?auto_1435766 ) ( SURFACE-AT ?auto_1435763 ?auto_1435766 ) ( CLEAR ?auto_1435763 ) ( IS-CRATE ?auto_1435764 ) ( not ( = ?auto_1435763 ?auto_1435764 ) ) ( TRUCK-AT ?auto_1435767 ?auto_1435766 ) ( AVAILABLE ?auto_1435765 ) ( IN ?auto_1435764 ?auto_1435767 ) ( ON ?auto_1435763 ?auto_1435762 ) ( not ( = ?auto_1435762 ?auto_1435763 ) ) ( not ( = ?auto_1435762 ?auto_1435764 ) ) ( ON ?auto_1435757 ?auto_1435756 ) ( ON ?auto_1435758 ?auto_1435757 ) ( ON ?auto_1435760 ?auto_1435758 ) ( ON ?auto_1435759 ?auto_1435760 ) ( ON ?auto_1435761 ?auto_1435759 ) ( ON ?auto_1435762 ?auto_1435761 ) ( not ( = ?auto_1435756 ?auto_1435757 ) ) ( not ( = ?auto_1435756 ?auto_1435758 ) ) ( not ( = ?auto_1435756 ?auto_1435760 ) ) ( not ( = ?auto_1435756 ?auto_1435759 ) ) ( not ( = ?auto_1435756 ?auto_1435761 ) ) ( not ( = ?auto_1435756 ?auto_1435762 ) ) ( not ( = ?auto_1435756 ?auto_1435763 ) ) ( not ( = ?auto_1435756 ?auto_1435764 ) ) ( not ( = ?auto_1435757 ?auto_1435758 ) ) ( not ( = ?auto_1435757 ?auto_1435760 ) ) ( not ( = ?auto_1435757 ?auto_1435759 ) ) ( not ( = ?auto_1435757 ?auto_1435761 ) ) ( not ( = ?auto_1435757 ?auto_1435762 ) ) ( not ( = ?auto_1435757 ?auto_1435763 ) ) ( not ( = ?auto_1435757 ?auto_1435764 ) ) ( not ( = ?auto_1435758 ?auto_1435760 ) ) ( not ( = ?auto_1435758 ?auto_1435759 ) ) ( not ( = ?auto_1435758 ?auto_1435761 ) ) ( not ( = ?auto_1435758 ?auto_1435762 ) ) ( not ( = ?auto_1435758 ?auto_1435763 ) ) ( not ( = ?auto_1435758 ?auto_1435764 ) ) ( not ( = ?auto_1435760 ?auto_1435759 ) ) ( not ( = ?auto_1435760 ?auto_1435761 ) ) ( not ( = ?auto_1435760 ?auto_1435762 ) ) ( not ( = ?auto_1435760 ?auto_1435763 ) ) ( not ( = ?auto_1435760 ?auto_1435764 ) ) ( not ( = ?auto_1435759 ?auto_1435761 ) ) ( not ( = ?auto_1435759 ?auto_1435762 ) ) ( not ( = ?auto_1435759 ?auto_1435763 ) ) ( not ( = ?auto_1435759 ?auto_1435764 ) ) ( not ( = ?auto_1435761 ?auto_1435762 ) ) ( not ( = ?auto_1435761 ?auto_1435763 ) ) ( not ( = ?auto_1435761 ?auto_1435764 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1435762 ?auto_1435763 ?auto_1435764 )
      ( MAKE-8CRATE-VERIFY ?auto_1435756 ?auto_1435757 ?auto_1435758 ?auto_1435760 ?auto_1435759 ?auto_1435761 ?auto_1435762 ?auto_1435763 ?auto_1435764 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1435832 - SURFACE
      ?auto_1435833 - SURFACE
      ?auto_1435834 - SURFACE
      ?auto_1435836 - SURFACE
      ?auto_1435835 - SURFACE
      ?auto_1435837 - SURFACE
      ?auto_1435838 - SURFACE
      ?auto_1435839 - SURFACE
      ?auto_1435840 - SURFACE
    )
    :vars
    (
      ?auto_1435841 - HOIST
      ?auto_1435842 - PLACE
      ?auto_1435843 - TRUCK
      ?auto_1435844 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1435841 ?auto_1435842 ) ( SURFACE-AT ?auto_1435839 ?auto_1435842 ) ( CLEAR ?auto_1435839 ) ( IS-CRATE ?auto_1435840 ) ( not ( = ?auto_1435839 ?auto_1435840 ) ) ( AVAILABLE ?auto_1435841 ) ( IN ?auto_1435840 ?auto_1435843 ) ( ON ?auto_1435839 ?auto_1435838 ) ( not ( = ?auto_1435838 ?auto_1435839 ) ) ( not ( = ?auto_1435838 ?auto_1435840 ) ) ( TRUCK-AT ?auto_1435843 ?auto_1435844 ) ( not ( = ?auto_1435844 ?auto_1435842 ) ) ( ON ?auto_1435833 ?auto_1435832 ) ( ON ?auto_1435834 ?auto_1435833 ) ( ON ?auto_1435836 ?auto_1435834 ) ( ON ?auto_1435835 ?auto_1435836 ) ( ON ?auto_1435837 ?auto_1435835 ) ( ON ?auto_1435838 ?auto_1435837 ) ( not ( = ?auto_1435832 ?auto_1435833 ) ) ( not ( = ?auto_1435832 ?auto_1435834 ) ) ( not ( = ?auto_1435832 ?auto_1435836 ) ) ( not ( = ?auto_1435832 ?auto_1435835 ) ) ( not ( = ?auto_1435832 ?auto_1435837 ) ) ( not ( = ?auto_1435832 ?auto_1435838 ) ) ( not ( = ?auto_1435832 ?auto_1435839 ) ) ( not ( = ?auto_1435832 ?auto_1435840 ) ) ( not ( = ?auto_1435833 ?auto_1435834 ) ) ( not ( = ?auto_1435833 ?auto_1435836 ) ) ( not ( = ?auto_1435833 ?auto_1435835 ) ) ( not ( = ?auto_1435833 ?auto_1435837 ) ) ( not ( = ?auto_1435833 ?auto_1435838 ) ) ( not ( = ?auto_1435833 ?auto_1435839 ) ) ( not ( = ?auto_1435833 ?auto_1435840 ) ) ( not ( = ?auto_1435834 ?auto_1435836 ) ) ( not ( = ?auto_1435834 ?auto_1435835 ) ) ( not ( = ?auto_1435834 ?auto_1435837 ) ) ( not ( = ?auto_1435834 ?auto_1435838 ) ) ( not ( = ?auto_1435834 ?auto_1435839 ) ) ( not ( = ?auto_1435834 ?auto_1435840 ) ) ( not ( = ?auto_1435836 ?auto_1435835 ) ) ( not ( = ?auto_1435836 ?auto_1435837 ) ) ( not ( = ?auto_1435836 ?auto_1435838 ) ) ( not ( = ?auto_1435836 ?auto_1435839 ) ) ( not ( = ?auto_1435836 ?auto_1435840 ) ) ( not ( = ?auto_1435835 ?auto_1435837 ) ) ( not ( = ?auto_1435835 ?auto_1435838 ) ) ( not ( = ?auto_1435835 ?auto_1435839 ) ) ( not ( = ?auto_1435835 ?auto_1435840 ) ) ( not ( = ?auto_1435837 ?auto_1435838 ) ) ( not ( = ?auto_1435837 ?auto_1435839 ) ) ( not ( = ?auto_1435837 ?auto_1435840 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1435838 ?auto_1435839 ?auto_1435840 )
      ( MAKE-8CRATE-VERIFY ?auto_1435832 ?auto_1435833 ?auto_1435834 ?auto_1435836 ?auto_1435835 ?auto_1435837 ?auto_1435838 ?auto_1435839 ?auto_1435840 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1435916 - SURFACE
      ?auto_1435917 - SURFACE
      ?auto_1435918 - SURFACE
      ?auto_1435920 - SURFACE
      ?auto_1435919 - SURFACE
      ?auto_1435921 - SURFACE
      ?auto_1435922 - SURFACE
      ?auto_1435923 - SURFACE
      ?auto_1435924 - SURFACE
    )
    :vars
    (
      ?auto_1435927 - HOIST
      ?auto_1435925 - PLACE
      ?auto_1435926 - TRUCK
      ?auto_1435928 - PLACE
      ?auto_1435929 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1435927 ?auto_1435925 ) ( SURFACE-AT ?auto_1435923 ?auto_1435925 ) ( CLEAR ?auto_1435923 ) ( IS-CRATE ?auto_1435924 ) ( not ( = ?auto_1435923 ?auto_1435924 ) ) ( AVAILABLE ?auto_1435927 ) ( ON ?auto_1435923 ?auto_1435922 ) ( not ( = ?auto_1435922 ?auto_1435923 ) ) ( not ( = ?auto_1435922 ?auto_1435924 ) ) ( TRUCK-AT ?auto_1435926 ?auto_1435928 ) ( not ( = ?auto_1435928 ?auto_1435925 ) ) ( HOIST-AT ?auto_1435929 ?auto_1435928 ) ( LIFTING ?auto_1435929 ?auto_1435924 ) ( not ( = ?auto_1435927 ?auto_1435929 ) ) ( ON ?auto_1435917 ?auto_1435916 ) ( ON ?auto_1435918 ?auto_1435917 ) ( ON ?auto_1435920 ?auto_1435918 ) ( ON ?auto_1435919 ?auto_1435920 ) ( ON ?auto_1435921 ?auto_1435919 ) ( ON ?auto_1435922 ?auto_1435921 ) ( not ( = ?auto_1435916 ?auto_1435917 ) ) ( not ( = ?auto_1435916 ?auto_1435918 ) ) ( not ( = ?auto_1435916 ?auto_1435920 ) ) ( not ( = ?auto_1435916 ?auto_1435919 ) ) ( not ( = ?auto_1435916 ?auto_1435921 ) ) ( not ( = ?auto_1435916 ?auto_1435922 ) ) ( not ( = ?auto_1435916 ?auto_1435923 ) ) ( not ( = ?auto_1435916 ?auto_1435924 ) ) ( not ( = ?auto_1435917 ?auto_1435918 ) ) ( not ( = ?auto_1435917 ?auto_1435920 ) ) ( not ( = ?auto_1435917 ?auto_1435919 ) ) ( not ( = ?auto_1435917 ?auto_1435921 ) ) ( not ( = ?auto_1435917 ?auto_1435922 ) ) ( not ( = ?auto_1435917 ?auto_1435923 ) ) ( not ( = ?auto_1435917 ?auto_1435924 ) ) ( not ( = ?auto_1435918 ?auto_1435920 ) ) ( not ( = ?auto_1435918 ?auto_1435919 ) ) ( not ( = ?auto_1435918 ?auto_1435921 ) ) ( not ( = ?auto_1435918 ?auto_1435922 ) ) ( not ( = ?auto_1435918 ?auto_1435923 ) ) ( not ( = ?auto_1435918 ?auto_1435924 ) ) ( not ( = ?auto_1435920 ?auto_1435919 ) ) ( not ( = ?auto_1435920 ?auto_1435921 ) ) ( not ( = ?auto_1435920 ?auto_1435922 ) ) ( not ( = ?auto_1435920 ?auto_1435923 ) ) ( not ( = ?auto_1435920 ?auto_1435924 ) ) ( not ( = ?auto_1435919 ?auto_1435921 ) ) ( not ( = ?auto_1435919 ?auto_1435922 ) ) ( not ( = ?auto_1435919 ?auto_1435923 ) ) ( not ( = ?auto_1435919 ?auto_1435924 ) ) ( not ( = ?auto_1435921 ?auto_1435922 ) ) ( not ( = ?auto_1435921 ?auto_1435923 ) ) ( not ( = ?auto_1435921 ?auto_1435924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1435922 ?auto_1435923 ?auto_1435924 )
      ( MAKE-8CRATE-VERIFY ?auto_1435916 ?auto_1435917 ?auto_1435918 ?auto_1435920 ?auto_1435919 ?auto_1435921 ?auto_1435922 ?auto_1435923 ?auto_1435924 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436008 - SURFACE
      ?auto_1436009 - SURFACE
      ?auto_1436010 - SURFACE
      ?auto_1436012 - SURFACE
      ?auto_1436011 - SURFACE
      ?auto_1436013 - SURFACE
      ?auto_1436014 - SURFACE
      ?auto_1436015 - SURFACE
      ?auto_1436016 - SURFACE
    )
    :vars
    (
      ?auto_1436017 - HOIST
      ?auto_1436021 - PLACE
      ?auto_1436018 - TRUCK
      ?auto_1436022 - PLACE
      ?auto_1436019 - HOIST
      ?auto_1436020 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436017 ?auto_1436021 ) ( SURFACE-AT ?auto_1436015 ?auto_1436021 ) ( CLEAR ?auto_1436015 ) ( IS-CRATE ?auto_1436016 ) ( not ( = ?auto_1436015 ?auto_1436016 ) ) ( AVAILABLE ?auto_1436017 ) ( ON ?auto_1436015 ?auto_1436014 ) ( not ( = ?auto_1436014 ?auto_1436015 ) ) ( not ( = ?auto_1436014 ?auto_1436016 ) ) ( TRUCK-AT ?auto_1436018 ?auto_1436022 ) ( not ( = ?auto_1436022 ?auto_1436021 ) ) ( HOIST-AT ?auto_1436019 ?auto_1436022 ) ( not ( = ?auto_1436017 ?auto_1436019 ) ) ( AVAILABLE ?auto_1436019 ) ( SURFACE-AT ?auto_1436016 ?auto_1436022 ) ( ON ?auto_1436016 ?auto_1436020 ) ( CLEAR ?auto_1436016 ) ( not ( = ?auto_1436015 ?auto_1436020 ) ) ( not ( = ?auto_1436016 ?auto_1436020 ) ) ( not ( = ?auto_1436014 ?auto_1436020 ) ) ( ON ?auto_1436009 ?auto_1436008 ) ( ON ?auto_1436010 ?auto_1436009 ) ( ON ?auto_1436012 ?auto_1436010 ) ( ON ?auto_1436011 ?auto_1436012 ) ( ON ?auto_1436013 ?auto_1436011 ) ( ON ?auto_1436014 ?auto_1436013 ) ( not ( = ?auto_1436008 ?auto_1436009 ) ) ( not ( = ?auto_1436008 ?auto_1436010 ) ) ( not ( = ?auto_1436008 ?auto_1436012 ) ) ( not ( = ?auto_1436008 ?auto_1436011 ) ) ( not ( = ?auto_1436008 ?auto_1436013 ) ) ( not ( = ?auto_1436008 ?auto_1436014 ) ) ( not ( = ?auto_1436008 ?auto_1436015 ) ) ( not ( = ?auto_1436008 ?auto_1436016 ) ) ( not ( = ?auto_1436008 ?auto_1436020 ) ) ( not ( = ?auto_1436009 ?auto_1436010 ) ) ( not ( = ?auto_1436009 ?auto_1436012 ) ) ( not ( = ?auto_1436009 ?auto_1436011 ) ) ( not ( = ?auto_1436009 ?auto_1436013 ) ) ( not ( = ?auto_1436009 ?auto_1436014 ) ) ( not ( = ?auto_1436009 ?auto_1436015 ) ) ( not ( = ?auto_1436009 ?auto_1436016 ) ) ( not ( = ?auto_1436009 ?auto_1436020 ) ) ( not ( = ?auto_1436010 ?auto_1436012 ) ) ( not ( = ?auto_1436010 ?auto_1436011 ) ) ( not ( = ?auto_1436010 ?auto_1436013 ) ) ( not ( = ?auto_1436010 ?auto_1436014 ) ) ( not ( = ?auto_1436010 ?auto_1436015 ) ) ( not ( = ?auto_1436010 ?auto_1436016 ) ) ( not ( = ?auto_1436010 ?auto_1436020 ) ) ( not ( = ?auto_1436012 ?auto_1436011 ) ) ( not ( = ?auto_1436012 ?auto_1436013 ) ) ( not ( = ?auto_1436012 ?auto_1436014 ) ) ( not ( = ?auto_1436012 ?auto_1436015 ) ) ( not ( = ?auto_1436012 ?auto_1436016 ) ) ( not ( = ?auto_1436012 ?auto_1436020 ) ) ( not ( = ?auto_1436011 ?auto_1436013 ) ) ( not ( = ?auto_1436011 ?auto_1436014 ) ) ( not ( = ?auto_1436011 ?auto_1436015 ) ) ( not ( = ?auto_1436011 ?auto_1436016 ) ) ( not ( = ?auto_1436011 ?auto_1436020 ) ) ( not ( = ?auto_1436013 ?auto_1436014 ) ) ( not ( = ?auto_1436013 ?auto_1436015 ) ) ( not ( = ?auto_1436013 ?auto_1436016 ) ) ( not ( = ?auto_1436013 ?auto_1436020 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436014 ?auto_1436015 ?auto_1436016 )
      ( MAKE-8CRATE-VERIFY ?auto_1436008 ?auto_1436009 ?auto_1436010 ?auto_1436012 ?auto_1436011 ?auto_1436013 ?auto_1436014 ?auto_1436015 ?auto_1436016 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436101 - SURFACE
      ?auto_1436102 - SURFACE
      ?auto_1436103 - SURFACE
      ?auto_1436105 - SURFACE
      ?auto_1436104 - SURFACE
      ?auto_1436106 - SURFACE
      ?auto_1436107 - SURFACE
      ?auto_1436108 - SURFACE
      ?auto_1436109 - SURFACE
    )
    :vars
    (
      ?auto_1436113 - HOIST
      ?auto_1436115 - PLACE
      ?auto_1436110 - PLACE
      ?auto_1436112 - HOIST
      ?auto_1436114 - SURFACE
      ?auto_1436111 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436113 ?auto_1436115 ) ( SURFACE-AT ?auto_1436108 ?auto_1436115 ) ( CLEAR ?auto_1436108 ) ( IS-CRATE ?auto_1436109 ) ( not ( = ?auto_1436108 ?auto_1436109 ) ) ( AVAILABLE ?auto_1436113 ) ( ON ?auto_1436108 ?auto_1436107 ) ( not ( = ?auto_1436107 ?auto_1436108 ) ) ( not ( = ?auto_1436107 ?auto_1436109 ) ) ( not ( = ?auto_1436110 ?auto_1436115 ) ) ( HOIST-AT ?auto_1436112 ?auto_1436110 ) ( not ( = ?auto_1436113 ?auto_1436112 ) ) ( AVAILABLE ?auto_1436112 ) ( SURFACE-AT ?auto_1436109 ?auto_1436110 ) ( ON ?auto_1436109 ?auto_1436114 ) ( CLEAR ?auto_1436109 ) ( not ( = ?auto_1436108 ?auto_1436114 ) ) ( not ( = ?auto_1436109 ?auto_1436114 ) ) ( not ( = ?auto_1436107 ?auto_1436114 ) ) ( TRUCK-AT ?auto_1436111 ?auto_1436115 ) ( ON ?auto_1436102 ?auto_1436101 ) ( ON ?auto_1436103 ?auto_1436102 ) ( ON ?auto_1436105 ?auto_1436103 ) ( ON ?auto_1436104 ?auto_1436105 ) ( ON ?auto_1436106 ?auto_1436104 ) ( ON ?auto_1436107 ?auto_1436106 ) ( not ( = ?auto_1436101 ?auto_1436102 ) ) ( not ( = ?auto_1436101 ?auto_1436103 ) ) ( not ( = ?auto_1436101 ?auto_1436105 ) ) ( not ( = ?auto_1436101 ?auto_1436104 ) ) ( not ( = ?auto_1436101 ?auto_1436106 ) ) ( not ( = ?auto_1436101 ?auto_1436107 ) ) ( not ( = ?auto_1436101 ?auto_1436108 ) ) ( not ( = ?auto_1436101 ?auto_1436109 ) ) ( not ( = ?auto_1436101 ?auto_1436114 ) ) ( not ( = ?auto_1436102 ?auto_1436103 ) ) ( not ( = ?auto_1436102 ?auto_1436105 ) ) ( not ( = ?auto_1436102 ?auto_1436104 ) ) ( not ( = ?auto_1436102 ?auto_1436106 ) ) ( not ( = ?auto_1436102 ?auto_1436107 ) ) ( not ( = ?auto_1436102 ?auto_1436108 ) ) ( not ( = ?auto_1436102 ?auto_1436109 ) ) ( not ( = ?auto_1436102 ?auto_1436114 ) ) ( not ( = ?auto_1436103 ?auto_1436105 ) ) ( not ( = ?auto_1436103 ?auto_1436104 ) ) ( not ( = ?auto_1436103 ?auto_1436106 ) ) ( not ( = ?auto_1436103 ?auto_1436107 ) ) ( not ( = ?auto_1436103 ?auto_1436108 ) ) ( not ( = ?auto_1436103 ?auto_1436109 ) ) ( not ( = ?auto_1436103 ?auto_1436114 ) ) ( not ( = ?auto_1436105 ?auto_1436104 ) ) ( not ( = ?auto_1436105 ?auto_1436106 ) ) ( not ( = ?auto_1436105 ?auto_1436107 ) ) ( not ( = ?auto_1436105 ?auto_1436108 ) ) ( not ( = ?auto_1436105 ?auto_1436109 ) ) ( not ( = ?auto_1436105 ?auto_1436114 ) ) ( not ( = ?auto_1436104 ?auto_1436106 ) ) ( not ( = ?auto_1436104 ?auto_1436107 ) ) ( not ( = ?auto_1436104 ?auto_1436108 ) ) ( not ( = ?auto_1436104 ?auto_1436109 ) ) ( not ( = ?auto_1436104 ?auto_1436114 ) ) ( not ( = ?auto_1436106 ?auto_1436107 ) ) ( not ( = ?auto_1436106 ?auto_1436108 ) ) ( not ( = ?auto_1436106 ?auto_1436109 ) ) ( not ( = ?auto_1436106 ?auto_1436114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436107 ?auto_1436108 ?auto_1436109 )
      ( MAKE-8CRATE-VERIFY ?auto_1436101 ?auto_1436102 ?auto_1436103 ?auto_1436105 ?auto_1436104 ?auto_1436106 ?auto_1436107 ?auto_1436108 ?auto_1436109 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436194 - SURFACE
      ?auto_1436195 - SURFACE
      ?auto_1436196 - SURFACE
      ?auto_1436198 - SURFACE
      ?auto_1436197 - SURFACE
      ?auto_1436199 - SURFACE
      ?auto_1436200 - SURFACE
      ?auto_1436201 - SURFACE
      ?auto_1436202 - SURFACE
    )
    :vars
    (
      ?auto_1436207 - HOIST
      ?auto_1436203 - PLACE
      ?auto_1436208 - PLACE
      ?auto_1436204 - HOIST
      ?auto_1436206 - SURFACE
      ?auto_1436205 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436207 ?auto_1436203 ) ( IS-CRATE ?auto_1436202 ) ( not ( = ?auto_1436201 ?auto_1436202 ) ) ( not ( = ?auto_1436200 ?auto_1436201 ) ) ( not ( = ?auto_1436200 ?auto_1436202 ) ) ( not ( = ?auto_1436208 ?auto_1436203 ) ) ( HOIST-AT ?auto_1436204 ?auto_1436208 ) ( not ( = ?auto_1436207 ?auto_1436204 ) ) ( AVAILABLE ?auto_1436204 ) ( SURFACE-AT ?auto_1436202 ?auto_1436208 ) ( ON ?auto_1436202 ?auto_1436206 ) ( CLEAR ?auto_1436202 ) ( not ( = ?auto_1436201 ?auto_1436206 ) ) ( not ( = ?auto_1436202 ?auto_1436206 ) ) ( not ( = ?auto_1436200 ?auto_1436206 ) ) ( TRUCK-AT ?auto_1436205 ?auto_1436203 ) ( SURFACE-AT ?auto_1436200 ?auto_1436203 ) ( CLEAR ?auto_1436200 ) ( LIFTING ?auto_1436207 ?auto_1436201 ) ( IS-CRATE ?auto_1436201 ) ( ON ?auto_1436195 ?auto_1436194 ) ( ON ?auto_1436196 ?auto_1436195 ) ( ON ?auto_1436198 ?auto_1436196 ) ( ON ?auto_1436197 ?auto_1436198 ) ( ON ?auto_1436199 ?auto_1436197 ) ( ON ?auto_1436200 ?auto_1436199 ) ( not ( = ?auto_1436194 ?auto_1436195 ) ) ( not ( = ?auto_1436194 ?auto_1436196 ) ) ( not ( = ?auto_1436194 ?auto_1436198 ) ) ( not ( = ?auto_1436194 ?auto_1436197 ) ) ( not ( = ?auto_1436194 ?auto_1436199 ) ) ( not ( = ?auto_1436194 ?auto_1436200 ) ) ( not ( = ?auto_1436194 ?auto_1436201 ) ) ( not ( = ?auto_1436194 ?auto_1436202 ) ) ( not ( = ?auto_1436194 ?auto_1436206 ) ) ( not ( = ?auto_1436195 ?auto_1436196 ) ) ( not ( = ?auto_1436195 ?auto_1436198 ) ) ( not ( = ?auto_1436195 ?auto_1436197 ) ) ( not ( = ?auto_1436195 ?auto_1436199 ) ) ( not ( = ?auto_1436195 ?auto_1436200 ) ) ( not ( = ?auto_1436195 ?auto_1436201 ) ) ( not ( = ?auto_1436195 ?auto_1436202 ) ) ( not ( = ?auto_1436195 ?auto_1436206 ) ) ( not ( = ?auto_1436196 ?auto_1436198 ) ) ( not ( = ?auto_1436196 ?auto_1436197 ) ) ( not ( = ?auto_1436196 ?auto_1436199 ) ) ( not ( = ?auto_1436196 ?auto_1436200 ) ) ( not ( = ?auto_1436196 ?auto_1436201 ) ) ( not ( = ?auto_1436196 ?auto_1436202 ) ) ( not ( = ?auto_1436196 ?auto_1436206 ) ) ( not ( = ?auto_1436198 ?auto_1436197 ) ) ( not ( = ?auto_1436198 ?auto_1436199 ) ) ( not ( = ?auto_1436198 ?auto_1436200 ) ) ( not ( = ?auto_1436198 ?auto_1436201 ) ) ( not ( = ?auto_1436198 ?auto_1436202 ) ) ( not ( = ?auto_1436198 ?auto_1436206 ) ) ( not ( = ?auto_1436197 ?auto_1436199 ) ) ( not ( = ?auto_1436197 ?auto_1436200 ) ) ( not ( = ?auto_1436197 ?auto_1436201 ) ) ( not ( = ?auto_1436197 ?auto_1436202 ) ) ( not ( = ?auto_1436197 ?auto_1436206 ) ) ( not ( = ?auto_1436199 ?auto_1436200 ) ) ( not ( = ?auto_1436199 ?auto_1436201 ) ) ( not ( = ?auto_1436199 ?auto_1436202 ) ) ( not ( = ?auto_1436199 ?auto_1436206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436200 ?auto_1436201 ?auto_1436202 )
      ( MAKE-8CRATE-VERIFY ?auto_1436194 ?auto_1436195 ?auto_1436196 ?auto_1436198 ?auto_1436197 ?auto_1436199 ?auto_1436200 ?auto_1436201 ?auto_1436202 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_1436287 - SURFACE
      ?auto_1436288 - SURFACE
      ?auto_1436289 - SURFACE
      ?auto_1436291 - SURFACE
      ?auto_1436290 - SURFACE
      ?auto_1436292 - SURFACE
      ?auto_1436293 - SURFACE
      ?auto_1436294 - SURFACE
      ?auto_1436295 - SURFACE
    )
    :vars
    (
      ?auto_1436300 - HOIST
      ?auto_1436301 - PLACE
      ?auto_1436296 - PLACE
      ?auto_1436297 - HOIST
      ?auto_1436298 - SURFACE
      ?auto_1436299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1436300 ?auto_1436301 ) ( IS-CRATE ?auto_1436295 ) ( not ( = ?auto_1436294 ?auto_1436295 ) ) ( not ( = ?auto_1436293 ?auto_1436294 ) ) ( not ( = ?auto_1436293 ?auto_1436295 ) ) ( not ( = ?auto_1436296 ?auto_1436301 ) ) ( HOIST-AT ?auto_1436297 ?auto_1436296 ) ( not ( = ?auto_1436300 ?auto_1436297 ) ) ( AVAILABLE ?auto_1436297 ) ( SURFACE-AT ?auto_1436295 ?auto_1436296 ) ( ON ?auto_1436295 ?auto_1436298 ) ( CLEAR ?auto_1436295 ) ( not ( = ?auto_1436294 ?auto_1436298 ) ) ( not ( = ?auto_1436295 ?auto_1436298 ) ) ( not ( = ?auto_1436293 ?auto_1436298 ) ) ( TRUCK-AT ?auto_1436299 ?auto_1436301 ) ( SURFACE-AT ?auto_1436293 ?auto_1436301 ) ( CLEAR ?auto_1436293 ) ( IS-CRATE ?auto_1436294 ) ( AVAILABLE ?auto_1436300 ) ( IN ?auto_1436294 ?auto_1436299 ) ( ON ?auto_1436288 ?auto_1436287 ) ( ON ?auto_1436289 ?auto_1436288 ) ( ON ?auto_1436291 ?auto_1436289 ) ( ON ?auto_1436290 ?auto_1436291 ) ( ON ?auto_1436292 ?auto_1436290 ) ( ON ?auto_1436293 ?auto_1436292 ) ( not ( = ?auto_1436287 ?auto_1436288 ) ) ( not ( = ?auto_1436287 ?auto_1436289 ) ) ( not ( = ?auto_1436287 ?auto_1436291 ) ) ( not ( = ?auto_1436287 ?auto_1436290 ) ) ( not ( = ?auto_1436287 ?auto_1436292 ) ) ( not ( = ?auto_1436287 ?auto_1436293 ) ) ( not ( = ?auto_1436287 ?auto_1436294 ) ) ( not ( = ?auto_1436287 ?auto_1436295 ) ) ( not ( = ?auto_1436287 ?auto_1436298 ) ) ( not ( = ?auto_1436288 ?auto_1436289 ) ) ( not ( = ?auto_1436288 ?auto_1436291 ) ) ( not ( = ?auto_1436288 ?auto_1436290 ) ) ( not ( = ?auto_1436288 ?auto_1436292 ) ) ( not ( = ?auto_1436288 ?auto_1436293 ) ) ( not ( = ?auto_1436288 ?auto_1436294 ) ) ( not ( = ?auto_1436288 ?auto_1436295 ) ) ( not ( = ?auto_1436288 ?auto_1436298 ) ) ( not ( = ?auto_1436289 ?auto_1436291 ) ) ( not ( = ?auto_1436289 ?auto_1436290 ) ) ( not ( = ?auto_1436289 ?auto_1436292 ) ) ( not ( = ?auto_1436289 ?auto_1436293 ) ) ( not ( = ?auto_1436289 ?auto_1436294 ) ) ( not ( = ?auto_1436289 ?auto_1436295 ) ) ( not ( = ?auto_1436289 ?auto_1436298 ) ) ( not ( = ?auto_1436291 ?auto_1436290 ) ) ( not ( = ?auto_1436291 ?auto_1436292 ) ) ( not ( = ?auto_1436291 ?auto_1436293 ) ) ( not ( = ?auto_1436291 ?auto_1436294 ) ) ( not ( = ?auto_1436291 ?auto_1436295 ) ) ( not ( = ?auto_1436291 ?auto_1436298 ) ) ( not ( = ?auto_1436290 ?auto_1436292 ) ) ( not ( = ?auto_1436290 ?auto_1436293 ) ) ( not ( = ?auto_1436290 ?auto_1436294 ) ) ( not ( = ?auto_1436290 ?auto_1436295 ) ) ( not ( = ?auto_1436290 ?auto_1436298 ) ) ( not ( = ?auto_1436292 ?auto_1436293 ) ) ( not ( = ?auto_1436292 ?auto_1436294 ) ) ( not ( = ?auto_1436292 ?auto_1436295 ) ) ( not ( = ?auto_1436292 ?auto_1436298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1436293 ?auto_1436294 ?auto_1436295 )
      ( MAKE-8CRATE-VERIFY ?auto_1436287 ?auto_1436288 ?auto_1436289 ?auto_1436291 ?auto_1436290 ?auto_1436292 ?auto_1436293 ?auto_1436294 ?auto_1436295 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440373 - SURFACE
      ?auto_1440374 - SURFACE
      ?auto_1440375 - SURFACE
      ?auto_1440377 - SURFACE
      ?auto_1440376 - SURFACE
      ?auto_1440378 - SURFACE
      ?auto_1440379 - SURFACE
      ?auto_1440380 - SURFACE
      ?auto_1440381 - SURFACE
      ?auto_1440382 - SURFACE
    )
    :vars
    (
      ?auto_1440384 - HOIST
      ?auto_1440383 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440384 ?auto_1440383 ) ( SURFACE-AT ?auto_1440381 ?auto_1440383 ) ( CLEAR ?auto_1440381 ) ( LIFTING ?auto_1440384 ?auto_1440382 ) ( IS-CRATE ?auto_1440382 ) ( not ( = ?auto_1440381 ?auto_1440382 ) ) ( ON ?auto_1440374 ?auto_1440373 ) ( ON ?auto_1440375 ?auto_1440374 ) ( ON ?auto_1440377 ?auto_1440375 ) ( ON ?auto_1440376 ?auto_1440377 ) ( ON ?auto_1440378 ?auto_1440376 ) ( ON ?auto_1440379 ?auto_1440378 ) ( ON ?auto_1440380 ?auto_1440379 ) ( ON ?auto_1440381 ?auto_1440380 ) ( not ( = ?auto_1440373 ?auto_1440374 ) ) ( not ( = ?auto_1440373 ?auto_1440375 ) ) ( not ( = ?auto_1440373 ?auto_1440377 ) ) ( not ( = ?auto_1440373 ?auto_1440376 ) ) ( not ( = ?auto_1440373 ?auto_1440378 ) ) ( not ( = ?auto_1440373 ?auto_1440379 ) ) ( not ( = ?auto_1440373 ?auto_1440380 ) ) ( not ( = ?auto_1440373 ?auto_1440381 ) ) ( not ( = ?auto_1440373 ?auto_1440382 ) ) ( not ( = ?auto_1440374 ?auto_1440375 ) ) ( not ( = ?auto_1440374 ?auto_1440377 ) ) ( not ( = ?auto_1440374 ?auto_1440376 ) ) ( not ( = ?auto_1440374 ?auto_1440378 ) ) ( not ( = ?auto_1440374 ?auto_1440379 ) ) ( not ( = ?auto_1440374 ?auto_1440380 ) ) ( not ( = ?auto_1440374 ?auto_1440381 ) ) ( not ( = ?auto_1440374 ?auto_1440382 ) ) ( not ( = ?auto_1440375 ?auto_1440377 ) ) ( not ( = ?auto_1440375 ?auto_1440376 ) ) ( not ( = ?auto_1440375 ?auto_1440378 ) ) ( not ( = ?auto_1440375 ?auto_1440379 ) ) ( not ( = ?auto_1440375 ?auto_1440380 ) ) ( not ( = ?auto_1440375 ?auto_1440381 ) ) ( not ( = ?auto_1440375 ?auto_1440382 ) ) ( not ( = ?auto_1440377 ?auto_1440376 ) ) ( not ( = ?auto_1440377 ?auto_1440378 ) ) ( not ( = ?auto_1440377 ?auto_1440379 ) ) ( not ( = ?auto_1440377 ?auto_1440380 ) ) ( not ( = ?auto_1440377 ?auto_1440381 ) ) ( not ( = ?auto_1440377 ?auto_1440382 ) ) ( not ( = ?auto_1440376 ?auto_1440378 ) ) ( not ( = ?auto_1440376 ?auto_1440379 ) ) ( not ( = ?auto_1440376 ?auto_1440380 ) ) ( not ( = ?auto_1440376 ?auto_1440381 ) ) ( not ( = ?auto_1440376 ?auto_1440382 ) ) ( not ( = ?auto_1440378 ?auto_1440379 ) ) ( not ( = ?auto_1440378 ?auto_1440380 ) ) ( not ( = ?auto_1440378 ?auto_1440381 ) ) ( not ( = ?auto_1440378 ?auto_1440382 ) ) ( not ( = ?auto_1440379 ?auto_1440380 ) ) ( not ( = ?auto_1440379 ?auto_1440381 ) ) ( not ( = ?auto_1440379 ?auto_1440382 ) ) ( not ( = ?auto_1440380 ?auto_1440381 ) ) ( not ( = ?auto_1440380 ?auto_1440382 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1440381 ?auto_1440382 )
      ( MAKE-9CRATE-VERIFY ?auto_1440373 ?auto_1440374 ?auto_1440375 ?auto_1440377 ?auto_1440376 ?auto_1440378 ?auto_1440379 ?auto_1440380 ?auto_1440381 ?auto_1440382 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440453 - SURFACE
      ?auto_1440454 - SURFACE
      ?auto_1440455 - SURFACE
      ?auto_1440457 - SURFACE
      ?auto_1440456 - SURFACE
      ?auto_1440458 - SURFACE
      ?auto_1440459 - SURFACE
      ?auto_1440460 - SURFACE
      ?auto_1440461 - SURFACE
      ?auto_1440462 - SURFACE
    )
    :vars
    (
      ?auto_1440463 - HOIST
      ?auto_1440464 - PLACE
      ?auto_1440465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440463 ?auto_1440464 ) ( SURFACE-AT ?auto_1440461 ?auto_1440464 ) ( CLEAR ?auto_1440461 ) ( IS-CRATE ?auto_1440462 ) ( not ( = ?auto_1440461 ?auto_1440462 ) ) ( TRUCK-AT ?auto_1440465 ?auto_1440464 ) ( AVAILABLE ?auto_1440463 ) ( IN ?auto_1440462 ?auto_1440465 ) ( ON ?auto_1440461 ?auto_1440460 ) ( not ( = ?auto_1440460 ?auto_1440461 ) ) ( not ( = ?auto_1440460 ?auto_1440462 ) ) ( ON ?auto_1440454 ?auto_1440453 ) ( ON ?auto_1440455 ?auto_1440454 ) ( ON ?auto_1440457 ?auto_1440455 ) ( ON ?auto_1440456 ?auto_1440457 ) ( ON ?auto_1440458 ?auto_1440456 ) ( ON ?auto_1440459 ?auto_1440458 ) ( ON ?auto_1440460 ?auto_1440459 ) ( not ( = ?auto_1440453 ?auto_1440454 ) ) ( not ( = ?auto_1440453 ?auto_1440455 ) ) ( not ( = ?auto_1440453 ?auto_1440457 ) ) ( not ( = ?auto_1440453 ?auto_1440456 ) ) ( not ( = ?auto_1440453 ?auto_1440458 ) ) ( not ( = ?auto_1440453 ?auto_1440459 ) ) ( not ( = ?auto_1440453 ?auto_1440460 ) ) ( not ( = ?auto_1440453 ?auto_1440461 ) ) ( not ( = ?auto_1440453 ?auto_1440462 ) ) ( not ( = ?auto_1440454 ?auto_1440455 ) ) ( not ( = ?auto_1440454 ?auto_1440457 ) ) ( not ( = ?auto_1440454 ?auto_1440456 ) ) ( not ( = ?auto_1440454 ?auto_1440458 ) ) ( not ( = ?auto_1440454 ?auto_1440459 ) ) ( not ( = ?auto_1440454 ?auto_1440460 ) ) ( not ( = ?auto_1440454 ?auto_1440461 ) ) ( not ( = ?auto_1440454 ?auto_1440462 ) ) ( not ( = ?auto_1440455 ?auto_1440457 ) ) ( not ( = ?auto_1440455 ?auto_1440456 ) ) ( not ( = ?auto_1440455 ?auto_1440458 ) ) ( not ( = ?auto_1440455 ?auto_1440459 ) ) ( not ( = ?auto_1440455 ?auto_1440460 ) ) ( not ( = ?auto_1440455 ?auto_1440461 ) ) ( not ( = ?auto_1440455 ?auto_1440462 ) ) ( not ( = ?auto_1440457 ?auto_1440456 ) ) ( not ( = ?auto_1440457 ?auto_1440458 ) ) ( not ( = ?auto_1440457 ?auto_1440459 ) ) ( not ( = ?auto_1440457 ?auto_1440460 ) ) ( not ( = ?auto_1440457 ?auto_1440461 ) ) ( not ( = ?auto_1440457 ?auto_1440462 ) ) ( not ( = ?auto_1440456 ?auto_1440458 ) ) ( not ( = ?auto_1440456 ?auto_1440459 ) ) ( not ( = ?auto_1440456 ?auto_1440460 ) ) ( not ( = ?auto_1440456 ?auto_1440461 ) ) ( not ( = ?auto_1440456 ?auto_1440462 ) ) ( not ( = ?auto_1440458 ?auto_1440459 ) ) ( not ( = ?auto_1440458 ?auto_1440460 ) ) ( not ( = ?auto_1440458 ?auto_1440461 ) ) ( not ( = ?auto_1440458 ?auto_1440462 ) ) ( not ( = ?auto_1440459 ?auto_1440460 ) ) ( not ( = ?auto_1440459 ?auto_1440461 ) ) ( not ( = ?auto_1440459 ?auto_1440462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440460 ?auto_1440461 ?auto_1440462 )
      ( MAKE-9CRATE-VERIFY ?auto_1440453 ?auto_1440454 ?auto_1440455 ?auto_1440457 ?auto_1440456 ?auto_1440458 ?auto_1440459 ?auto_1440460 ?auto_1440461 ?auto_1440462 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440543 - SURFACE
      ?auto_1440544 - SURFACE
      ?auto_1440545 - SURFACE
      ?auto_1440547 - SURFACE
      ?auto_1440546 - SURFACE
      ?auto_1440548 - SURFACE
      ?auto_1440549 - SURFACE
      ?auto_1440550 - SURFACE
      ?auto_1440551 - SURFACE
      ?auto_1440552 - SURFACE
    )
    :vars
    (
      ?auto_1440556 - HOIST
      ?auto_1440555 - PLACE
      ?auto_1440554 - TRUCK
      ?auto_1440553 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440556 ?auto_1440555 ) ( SURFACE-AT ?auto_1440551 ?auto_1440555 ) ( CLEAR ?auto_1440551 ) ( IS-CRATE ?auto_1440552 ) ( not ( = ?auto_1440551 ?auto_1440552 ) ) ( AVAILABLE ?auto_1440556 ) ( IN ?auto_1440552 ?auto_1440554 ) ( ON ?auto_1440551 ?auto_1440550 ) ( not ( = ?auto_1440550 ?auto_1440551 ) ) ( not ( = ?auto_1440550 ?auto_1440552 ) ) ( TRUCK-AT ?auto_1440554 ?auto_1440553 ) ( not ( = ?auto_1440553 ?auto_1440555 ) ) ( ON ?auto_1440544 ?auto_1440543 ) ( ON ?auto_1440545 ?auto_1440544 ) ( ON ?auto_1440547 ?auto_1440545 ) ( ON ?auto_1440546 ?auto_1440547 ) ( ON ?auto_1440548 ?auto_1440546 ) ( ON ?auto_1440549 ?auto_1440548 ) ( ON ?auto_1440550 ?auto_1440549 ) ( not ( = ?auto_1440543 ?auto_1440544 ) ) ( not ( = ?auto_1440543 ?auto_1440545 ) ) ( not ( = ?auto_1440543 ?auto_1440547 ) ) ( not ( = ?auto_1440543 ?auto_1440546 ) ) ( not ( = ?auto_1440543 ?auto_1440548 ) ) ( not ( = ?auto_1440543 ?auto_1440549 ) ) ( not ( = ?auto_1440543 ?auto_1440550 ) ) ( not ( = ?auto_1440543 ?auto_1440551 ) ) ( not ( = ?auto_1440543 ?auto_1440552 ) ) ( not ( = ?auto_1440544 ?auto_1440545 ) ) ( not ( = ?auto_1440544 ?auto_1440547 ) ) ( not ( = ?auto_1440544 ?auto_1440546 ) ) ( not ( = ?auto_1440544 ?auto_1440548 ) ) ( not ( = ?auto_1440544 ?auto_1440549 ) ) ( not ( = ?auto_1440544 ?auto_1440550 ) ) ( not ( = ?auto_1440544 ?auto_1440551 ) ) ( not ( = ?auto_1440544 ?auto_1440552 ) ) ( not ( = ?auto_1440545 ?auto_1440547 ) ) ( not ( = ?auto_1440545 ?auto_1440546 ) ) ( not ( = ?auto_1440545 ?auto_1440548 ) ) ( not ( = ?auto_1440545 ?auto_1440549 ) ) ( not ( = ?auto_1440545 ?auto_1440550 ) ) ( not ( = ?auto_1440545 ?auto_1440551 ) ) ( not ( = ?auto_1440545 ?auto_1440552 ) ) ( not ( = ?auto_1440547 ?auto_1440546 ) ) ( not ( = ?auto_1440547 ?auto_1440548 ) ) ( not ( = ?auto_1440547 ?auto_1440549 ) ) ( not ( = ?auto_1440547 ?auto_1440550 ) ) ( not ( = ?auto_1440547 ?auto_1440551 ) ) ( not ( = ?auto_1440547 ?auto_1440552 ) ) ( not ( = ?auto_1440546 ?auto_1440548 ) ) ( not ( = ?auto_1440546 ?auto_1440549 ) ) ( not ( = ?auto_1440546 ?auto_1440550 ) ) ( not ( = ?auto_1440546 ?auto_1440551 ) ) ( not ( = ?auto_1440546 ?auto_1440552 ) ) ( not ( = ?auto_1440548 ?auto_1440549 ) ) ( not ( = ?auto_1440548 ?auto_1440550 ) ) ( not ( = ?auto_1440548 ?auto_1440551 ) ) ( not ( = ?auto_1440548 ?auto_1440552 ) ) ( not ( = ?auto_1440549 ?auto_1440550 ) ) ( not ( = ?auto_1440549 ?auto_1440551 ) ) ( not ( = ?auto_1440549 ?auto_1440552 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440550 ?auto_1440551 ?auto_1440552 )
      ( MAKE-9CRATE-VERIFY ?auto_1440543 ?auto_1440544 ?auto_1440545 ?auto_1440547 ?auto_1440546 ?auto_1440548 ?auto_1440549 ?auto_1440550 ?auto_1440551 ?auto_1440552 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440642 - SURFACE
      ?auto_1440643 - SURFACE
      ?auto_1440644 - SURFACE
      ?auto_1440646 - SURFACE
      ?auto_1440645 - SURFACE
      ?auto_1440647 - SURFACE
      ?auto_1440648 - SURFACE
      ?auto_1440649 - SURFACE
      ?auto_1440650 - SURFACE
      ?auto_1440651 - SURFACE
    )
    :vars
    (
      ?auto_1440654 - HOIST
      ?auto_1440653 - PLACE
      ?auto_1440656 - TRUCK
      ?auto_1440652 - PLACE
      ?auto_1440655 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440654 ?auto_1440653 ) ( SURFACE-AT ?auto_1440650 ?auto_1440653 ) ( CLEAR ?auto_1440650 ) ( IS-CRATE ?auto_1440651 ) ( not ( = ?auto_1440650 ?auto_1440651 ) ) ( AVAILABLE ?auto_1440654 ) ( ON ?auto_1440650 ?auto_1440649 ) ( not ( = ?auto_1440649 ?auto_1440650 ) ) ( not ( = ?auto_1440649 ?auto_1440651 ) ) ( TRUCK-AT ?auto_1440656 ?auto_1440652 ) ( not ( = ?auto_1440652 ?auto_1440653 ) ) ( HOIST-AT ?auto_1440655 ?auto_1440652 ) ( LIFTING ?auto_1440655 ?auto_1440651 ) ( not ( = ?auto_1440654 ?auto_1440655 ) ) ( ON ?auto_1440643 ?auto_1440642 ) ( ON ?auto_1440644 ?auto_1440643 ) ( ON ?auto_1440646 ?auto_1440644 ) ( ON ?auto_1440645 ?auto_1440646 ) ( ON ?auto_1440647 ?auto_1440645 ) ( ON ?auto_1440648 ?auto_1440647 ) ( ON ?auto_1440649 ?auto_1440648 ) ( not ( = ?auto_1440642 ?auto_1440643 ) ) ( not ( = ?auto_1440642 ?auto_1440644 ) ) ( not ( = ?auto_1440642 ?auto_1440646 ) ) ( not ( = ?auto_1440642 ?auto_1440645 ) ) ( not ( = ?auto_1440642 ?auto_1440647 ) ) ( not ( = ?auto_1440642 ?auto_1440648 ) ) ( not ( = ?auto_1440642 ?auto_1440649 ) ) ( not ( = ?auto_1440642 ?auto_1440650 ) ) ( not ( = ?auto_1440642 ?auto_1440651 ) ) ( not ( = ?auto_1440643 ?auto_1440644 ) ) ( not ( = ?auto_1440643 ?auto_1440646 ) ) ( not ( = ?auto_1440643 ?auto_1440645 ) ) ( not ( = ?auto_1440643 ?auto_1440647 ) ) ( not ( = ?auto_1440643 ?auto_1440648 ) ) ( not ( = ?auto_1440643 ?auto_1440649 ) ) ( not ( = ?auto_1440643 ?auto_1440650 ) ) ( not ( = ?auto_1440643 ?auto_1440651 ) ) ( not ( = ?auto_1440644 ?auto_1440646 ) ) ( not ( = ?auto_1440644 ?auto_1440645 ) ) ( not ( = ?auto_1440644 ?auto_1440647 ) ) ( not ( = ?auto_1440644 ?auto_1440648 ) ) ( not ( = ?auto_1440644 ?auto_1440649 ) ) ( not ( = ?auto_1440644 ?auto_1440650 ) ) ( not ( = ?auto_1440644 ?auto_1440651 ) ) ( not ( = ?auto_1440646 ?auto_1440645 ) ) ( not ( = ?auto_1440646 ?auto_1440647 ) ) ( not ( = ?auto_1440646 ?auto_1440648 ) ) ( not ( = ?auto_1440646 ?auto_1440649 ) ) ( not ( = ?auto_1440646 ?auto_1440650 ) ) ( not ( = ?auto_1440646 ?auto_1440651 ) ) ( not ( = ?auto_1440645 ?auto_1440647 ) ) ( not ( = ?auto_1440645 ?auto_1440648 ) ) ( not ( = ?auto_1440645 ?auto_1440649 ) ) ( not ( = ?auto_1440645 ?auto_1440650 ) ) ( not ( = ?auto_1440645 ?auto_1440651 ) ) ( not ( = ?auto_1440647 ?auto_1440648 ) ) ( not ( = ?auto_1440647 ?auto_1440649 ) ) ( not ( = ?auto_1440647 ?auto_1440650 ) ) ( not ( = ?auto_1440647 ?auto_1440651 ) ) ( not ( = ?auto_1440648 ?auto_1440649 ) ) ( not ( = ?auto_1440648 ?auto_1440650 ) ) ( not ( = ?auto_1440648 ?auto_1440651 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440649 ?auto_1440650 ?auto_1440651 )
      ( MAKE-9CRATE-VERIFY ?auto_1440642 ?auto_1440643 ?auto_1440644 ?auto_1440646 ?auto_1440645 ?auto_1440647 ?auto_1440648 ?auto_1440649 ?auto_1440650 ?auto_1440651 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440750 - SURFACE
      ?auto_1440751 - SURFACE
      ?auto_1440752 - SURFACE
      ?auto_1440754 - SURFACE
      ?auto_1440753 - SURFACE
      ?auto_1440755 - SURFACE
      ?auto_1440756 - SURFACE
      ?auto_1440757 - SURFACE
      ?auto_1440758 - SURFACE
      ?auto_1440759 - SURFACE
    )
    :vars
    (
      ?auto_1440765 - HOIST
      ?auto_1440761 - PLACE
      ?auto_1440763 - TRUCK
      ?auto_1440764 - PLACE
      ?auto_1440760 - HOIST
      ?auto_1440762 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440765 ?auto_1440761 ) ( SURFACE-AT ?auto_1440758 ?auto_1440761 ) ( CLEAR ?auto_1440758 ) ( IS-CRATE ?auto_1440759 ) ( not ( = ?auto_1440758 ?auto_1440759 ) ) ( AVAILABLE ?auto_1440765 ) ( ON ?auto_1440758 ?auto_1440757 ) ( not ( = ?auto_1440757 ?auto_1440758 ) ) ( not ( = ?auto_1440757 ?auto_1440759 ) ) ( TRUCK-AT ?auto_1440763 ?auto_1440764 ) ( not ( = ?auto_1440764 ?auto_1440761 ) ) ( HOIST-AT ?auto_1440760 ?auto_1440764 ) ( not ( = ?auto_1440765 ?auto_1440760 ) ) ( AVAILABLE ?auto_1440760 ) ( SURFACE-AT ?auto_1440759 ?auto_1440764 ) ( ON ?auto_1440759 ?auto_1440762 ) ( CLEAR ?auto_1440759 ) ( not ( = ?auto_1440758 ?auto_1440762 ) ) ( not ( = ?auto_1440759 ?auto_1440762 ) ) ( not ( = ?auto_1440757 ?auto_1440762 ) ) ( ON ?auto_1440751 ?auto_1440750 ) ( ON ?auto_1440752 ?auto_1440751 ) ( ON ?auto_1440754 ?auto_1440752 ) ( ON ?auto_1440753 ?auto_1440754 ) ( ON ?auto_1440755 ?auto_1440753 ) ( ON ?auto_1440756 ?auto_1440755 ) ( ON ?auto_1440757 ?auto_1440756 ) ( not ( = ?auto_1440750 ?auto_1440751 ) ) ( not ( = ?auto_1440750 ?auto_1440752 ) ) ( not ( = ?auto_1440750 ?auto_1440754 ) ) ( not ( = ?auto_1440750 ?auto_1440753 ) ) ( not ( = ?auto_1440750 ?auto_1440755 ) ) ( not ( = ?auto_1440750 ?auto_1440756 ) ) ( not ( = ?auto_1440750 ?auto_1440757 ) ) ( not ( = ?auto_1440750 ?auto_1440758 ) ) ( not ( = ?auto_1440750 ?auto_1440759 ) ) ( not ( = ?auto_1440750 ?auto_1440762 ) ) ( not ( = ?auto_1440751 ?auto_1440752 ) ) ( not ( = ?auto_1440751 ?auto_1440754 ) ) ( not ( = ?auto_1440751 ?auto_1440753 ) ) ( not ( = ?auto_1440751 ?auto_1440755 ) ) ( not ( = ?auto_1440751 ?auto_1440756 ) ) ( not ( = ?auto_1440751 ?auto_1440757 ) ) ( not ( = ?auto_1440751 ?auto_1440758 ) ) ( not ( = ?auto_1440751 ?auto_1440759 ) ) ( not ( = ?auto_1440751 ?auto_1440762 ) ) ( not ( = ?auto_1440752 ?auto_1440754 ) ) ( not ( = ?auto_1440752 ?auto_1440753 ) ) ( not ( = ?auto_1440752 ?auto_1440755 ) ) ( not ( = ?auto_1440752 ?auto_1440756 ) ) ( not ( = ?auto_1440752 ?auto_1440757 ) ) ( not ( = ?auto_1440752 ?auto_1440758 ) ) ( not ( = ?auto_1440752 ?auto_1440759 ) ) ( not ( = ?auto_1440752 ?auto_1440762 ) ) ( not ( = ?auto_1440754 ?auto_1440753 ) ) ( not ( = ?auto_1440754 ?auto_1440755 ) ) ( not ( = ?auto_1440754 ?auto_1440756 ) ) ( not ( = ?auto_1440754 ?auto_1440757 ) ) ( not ( = ?auto_1440754 ?auto_1440758 ) ) ( not ( = ?auto_1440754 ?auto_1440759 ) ) ( not ( = ?auto_1440754 ?auto_1440762 ) ) ( not ( = ?auto_1440753 ?auto_1440755 ) ) ( not ( = ?auto_1440753 ?auto_1440756 ) ) ( not ( = ?auto_1440753 ?auto_1440757 ) ) ( not ( = ?auto_1440753 ?auto_1440758 ) ) ( not ( = ?auto_1440753 ?auto_1440759 ) ) ( not ( = ?auto_1440753 ?auto_1440762 ) ) ( not ( = ?auto_1440755 ?auto_1440756 ) ) ( not ( = ?auto_1440755 ?auto_1440757 ) ) ( not ( = ?auto_1440755 ?auto_1440758 ) ) ( not ( = ?auto_1440755 ?auto_1440759 ) ) ( not ( = ?auto_1440755 ?auto_1440762 ) ) ( not ( = ?auto_1440756 ?auto_1440757 ) ) ( not ( = ?auto_1440756 ?auto_1440758 ) ) ( not ( = ?auto_1440756 ?auto_1440759 ) ) ( not ( = ?auto_1440756 ?auto_1440762 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440757 ?auto_1440758 ?auto_1440759 )
      ( MAKE-9CRATE-VERIFY ?auto_1440750 ?auto_1440751 ?auto_1440752 ?auto_1440754 ?auto_1440753 ?auto_1440755 ?auto_1440756 ?auto_1440757 ?auto_1440758 ?auto_1440759 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440859 - SURFACE
      ?auto_1440860 - SURFACE
      ?auto_1440861 - SURFACE
      ?auto_1440863 - SURFACE
      ?auto_1440862 - SURFACE
      ?auto_1440864 - SURFACE
      ?auto_1440865 - SURFACE
      ?auto_1440866 - SURFACE
      ?auto_1440867 - SURFACE
      ?auto_1440868 - SURFACE
    )
    :vars
    (
      ?auto_1440872 - HOIST
      ?auto_1440874 - PLACE
      ?auto_1440871 - PLACE
      ?auto_1440870 - HOIST
      ?auto_1440869 - SURFACE
      ?auto_1440873 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440872 ?auto_1440874 ) ( SURFACE-AT ?auto_1440867 ?auto_1440874 ) ( CLEAR ?auto_1440867 ) ( IS-CRATE ?auto_1440868 ) ( not ( = ?auto_1440867 ?auto_1440868 ) ) ( AVAILABLE ?auto_1440872 ) ( ON ?auto_1440867 ?auto_1440866 ) ( not ( = ?auto_1440866 ?auto_1440867 ) ) ( not ( = ?auto_1440866 ?auto_1440868 ) ) ( not ( = ?auto_1440871 ?auto_1440874 ) ) ( HOIST-AT ?auto_1440870 ?auto_1440871 ) ( not ( = ?auto_1440872 ?auto_1440870 ) ) ( AVAILABLE ?auto_1440870 ) ( SURFACE-AT ?auto_1440868 ?auto_1440871 ) ( ON ?auto_1440868 ?auto_1440869 ) ( CLEAR ?auto_1440868 ) ( not ( = ?auto_1440867 ?auto_1440869 ) ) ( not ( = ?auto_1440868 ?auto_1440869 ) ) ( not ( = ?auto_1440866 ?auto_1440869 ) ) ( TRUCK-AT ?auto_1440873 ?auto_1440874 ) ( ON ?auto_1440860 ?auto_1440859 ) ( ON ?auto_1440861 ?auto_1440860 ) ( ON ?auto_1440863 ?auto_1440861 ) ( ON ?auto_1440862 ?auto_1440863 ) ( ON ?auto_1440864 ?auto_1440862 ) ( ON ?auto_1440865 ?auto_1440864 ) ( ON ?auto_1440866 ?auto_1440865 ) ( not ( = ?auto_1440859 ?auto_1440860 ) ) ( not ( = ?auto_1440859 ?auto_1440861 ) ) ( not ( = ?auto_1440859 ?auto_1440863 ) ) ( not ( = ?auto_1440859 ?auto_1440862 ) ) ( not ( = ?auto_1440859 ?auto_1440864 ) ) ( not ( = ?auto_1440859 ?auto_1440865 ) ) ( not ( = ?auto_1440859 ?auto_1440866 ) ) ( not ( = ?auto_1440859 ?auto_1440867 ) ) ( not ( = ?auto_1440859 ?auto_1440868 ) ) ( not ( = ?auto_1440859 ?auto_1440869 ) ) ( not ( = ?auto_1440860 ?auto_1440861 ) ) ( not ( = ?auto_1440860 ?auto_1440863 ) ) ( not ( = ?auto_1440860 ?auto_1440862 ) ) ( not ( = ?auto_1440860 ?auto_1440864 ) ) ( not ( = ?auto_1440860 ?auto_1440865 ) ) ( not ( = ?auto_1440860 ?auto_1440866 ) ) ( not ( = ?auto_1440860 ?auto_1440867 ) ) ( not ( = ?auto_1440860 ?auto_1440868 ) ) ( not ( = ?auto_1440860 ?auto_1440869 ) ) ( not ( = ?auto_1440861 ?auto_1440863 ) ) ( not ( = ?auto_1440861 ?auto_1440862 ) ) ( not ( = ?auto_1440861 ?auto_1440864 ) ) ( not ( = ?auto_1440861 ?auto_1440865 ) ) ( not ( = ?auto_1440861 ?auto_1440866 ) ) ( not ( = ?auto_1440861 ?auto_1440867 ) ) ( not ( = ?auto_1440861 ?auto_1440868 ) ) ( not ( = ?auto_1440861 ?auto_1440869 ) ) ( not ( = ?auto_1440863 ?auto_1440862 ) ) ( not ( = ?auto_1440863 ?auto_1440864 ) ) ( not ( = ?auto_1440863 ?auto_1440865 ) ) ( not ( = ?auto_1440863 ?auto_1440866 ) ) ( not ( = ?auto_1440863 ?auto_1440867 ) ) ( not ( = ?auto_1440863 ?auto_1440868 ) ) ( not ( = ?auto_1440863 ?auto_1440869 ) ) ( not ( = ?auto_1440862 ?auto_1440864 ) ) ( not ( = ?auto_1440862 ?auto_1440865 ) ) ( not ( = ?auto_1440862 ?auto_1440866 ) ) ( not ( = ?auto_1440862 ?auto_1440867 ) ) ( not ( = ?auto_1440862 ?auto_1440868 ) ) ( not ( = ?auto_1440862 ?auto_1440869 ) ) ( not ( = ?auto_1440864 ?auto_1440865 ) ) ( not ( = ?auto_1440864 ?auto_1440866 ) ) ( not ( = ?auto_1440864 ?auto_1440867 ) ) ( not ( = ?auto_1440864 ?auto_1440868 ) ) ( not ( = ?auto_1440864 ?auto_1440869 ) ) ( not ( = ?auto_1440865 ?auto_1440866 ) ) ( not ( = ?auto_1440865 ?auto_1440867 ) ) ( not ( = ?auto_1440865 ?auto_1440868 ) ) ( not ( = ?auto_1440865 ?auto_1440869 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440866 ?auto_1440867 ?auto_1440868 )
      ( MAKE-9CRATE-VERIFY ?auto_1440859 ?auto_1440860 ?auto_1440861 ?auto_1440863 ?auto_1440862 ?auto_1440864 ?auto_1440865 ?auto_1440866 ?auto_1440867 ?auto_1440868 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1440968 - SURFACE
      ?auto_1440969 - SURFACE
      ?auto_1440970 - SURFACE
      ?auto_1440972 - SURFACE
      ?auto_1440971 - SURFACE
      ?auto_1440973 - SURFACE
      ?auto_1440974 - SURFACE
      ?auto_1440975 - SURFACE
      ?auto_1440976 - SURFACE
      ?auto_1440977 - SURFACE
    )
    :vars
    (
      ?auto_1440982 - HOIST
      ?auto_1440981 - PLACE
      ?auto_1440983 - PLACE
      ?auto_1440978 - HOIST
      ?auto_1440980 - SURFACE
      ?auto_1440979 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1440982 ?auto_1440981 ) ( IS-CRATE ?auto_1440977 ) ( not ( = ?auto_1440976 ?auto_1440977 ) ) ( not ( = ?auto_1440975 ?auto_1440976 ) ) ( not ( = ?auto_1440975 ?auto_1440977 ) ) ( not ( = ?auto_1440983 ?auto_1440981 ) ) ( HOIST-AT ?auto_1440978 ?auto_1440983 ) ( not ( = ?auto_1440982 ?auto_1440978 ) ) ( AVAILABLE ?auto_1440978 ) ( SURFACE-AT ?auto_1440977 ?auto_1440983 ) ( ON ?auto_1440977 ?auto_1440980 ) ( CLEAR ?auto_1440977 ) ( not ( = ?auto_1440976 ?auto_1440980 ) ) ( not ( = ?auto_1440977 ?auto_1440980 ) ) ( not ( = ?auto_1440975 ?auto_1440980 ) ) ( TRUCK-AT ?auto_1440979 ?auto_1440981 ) ( SURFACE-AT ?auto_1440975 ?auto_1440981 ) ( CLEAR ?auto_1440975 ) ( LIFTING ?auto_1440982 ?auto_1440976 ) ( IS-CRATE ?auto_1440976 ) ( ON ?auto_1440969 ?auto_1440968 ) ( ON ?auto_1440970 ?auto_1440969 ) ( ON ?auto_1440972 ?auto_1440970 ) ( ON ?auto_1440971 ?auto_1440972 ) ( ON ?auto_1440973 ?auto_1440971 ) ( ON ?auto_1440974 ?auto_1440973 ) ( ON ?auto_1440975 ?auto_1440974 ) ( not ( = ?auto_1440968 ?auto_1440969 ) ) ( not ( = ?auto_1440968 ?auto_1440970 ) ) ( not ( = ?auto_1440968 ?auto_1440972 ) ) ( not ( = ?auto_1440968 ?auto_1440971 ) ) ( not ( = ?auto_1440968 ?auto_1440973 ) ) ( not ( = ?auto_1440968 ?auto_1440974 ) ) ( not ( = ?auto_1440968 ?auto_1440975 ) ) ( not ( = ?auto_1440968 ?auto_1440976 ) ) ( not ( = ?auto_1440968 ?auto_1440977 ) ) ( not ( = ?auto_1440968 ?auto_1440980 ) ) ( not ( = ?auto_1440969 ?auto_1440970 ) ) ( not ( = ?auto_1440969 ?auto_1440972 ) ) ( not ( = ?auto_1440969 ?auto_1440971 ) ) ( not ( = ?auto_1440969 ?auto_1440973 ) ) ( not ( = ?auto_1440969 ?auto_1440974 ) ) ( not ( = ?auto_1440969 ?auto_1440975 ) ) ( not ( = ?auto_1440969 ?auto_1440976 ) ) ( not ( = ?auto_1440969 ?auto_1440977 ) ) ( not ( = ?auto_1440969 ?auto_1440980 ) ) ( not ( = ?auto_1440970 ?auto_1440972 ) ) ( not ( = ?auto_1440970 ?auto_1440971 ) ) ( not ( = ?auto_1440970 ?auto_1440973 ) ) ( not ( = ?auto_1440970 ?auto_1440974 ) ) ( not ( = ?auto_1440970 ?auto_1440975 ) ) ( not ( = ?auto_1440970 ?auto_1440976 ) ) ( not ( = ?auto_1440970 ?auto_1440977 ) ) ( not ( = ?auto_1440970 ?auto_1440980 ) ) ( not ( = ?auto_1440972 ?auto_1440971 ) ) ( not ( = ?auto_1440972 ?auto_1440973 ) ) ( not ( = ?auto_1440972 ?auto_1440974 ) ) ( not ( = ?auto_1440972 ?auto_1440975 ) ) ( not ( = ?auto_1440972 ?auto_1440976 ) ) ( not ( = ?auto_1440972 ?auto_1440977 ) ) ( not ( = ?auto_1440972 ?auto_1440980 ) ) ( not ( = ?auto_1440971 ?auto_1440973 ) ) ( not ( = ?auto_1440971 ?auto_1440974 ) ) ( not ( = ?auto_1440971 ?auto_1440975 ) ) ( not ( = ?auto_1440971 ?auto_1440976 ) ) ( not ( = ?auto_1440971 ?auto_1440977 ) ) ( not ( = ?auto_1440971 ?auto_1440980 ) ) ( not ( = ?auto_1440973 ?auto_1440974 ) ) ( not ( = ?auto_1440973 ?auto_1440975 ) ) ( not ( = ?auto_1440973 ?auto_1440976 ) ) ( not ( = ?auto_1440973 ?auto_1440977 ) ) ( not ( = ?auto_1440973 ?auto_1440980 ) ) ( not ( = ?auto_1440974 ?auto_1440975 ) ) ( not ( = ?auto_1440974 ?auto_1440976 ) ) ( not ( = ?auto_1440974 ?auto_1440977 ) ) ( not ( = ?auto_1440974 ?auto_1440980 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1440975 ?auto_1440976 ?auto_1440977 )
      ( MAKE-9CRATE-VERIFY ?auto_1440968 ?auto_1440969 ?auto_1440970 ?auto_1440972 ?auto_1440971 ?auto_1440973 ?auto_1440974 ?auto_1440975 ?auto_1440976 ?auto_1440977 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_1441077 - SURFACE
      ?auto_1441078 - SURFACE
      ?auto_1441079 - SURFACE
      ?auto_1441081 - SURFACE
      ?auto_1441080 - SURFACE
      ?auto_1441082 - SURFACE
      ?auto_1441083 - SURFACE
      ?auto_1441084 - SURFACE
      ?auto_1441085 - SURFACE
      ?auto_1441086 - SURFACE
    )
    :vars
    (
      ?auto_1441091 - HOIST
      ?auto_1441088 - PLACE
      ?auto_1441089 - PLACE
      ?auto_1441092 - HOIST
      ?auto_1441090 - SURFACE
      ?auto_1441087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1441091 ?auto_1441088 ) ( IS-CRATE ?auto_1441086 ) ( not ( = ?auto_1441085 ?auto_1441086 ) ) ( not ( = ?auto_1441084 ?auto_1441085 ) ) ( not ( = ?auto_1441084 ?auto_1441086 ) ) ( not ( = ?auto_1441089 ?auto_1441088 ) ) ( HOIST-AT ?auto_1441092 ?auto_1441089 ) ( not ( = ?auto_1441091 ?auto_1441092 ) ) ( AVAILABLE ?auto_1441092 ) ( SURFACE-AT ?auto_1441086 ?auto_1441089 ) ( ON ?auto_1441086 ?auto_1441090 ) ( CLEAR ?auto_1441086 ) ( not ( = ?auto_1441085 ?auto_1441090 ) ) ( not ( = ?auto_1441086 ?auto_1441090 ) ) ( not ( = ?auto_1441084 ?auto_1441090 ) ) ( TRUCK-AT ?auto_1441087 ?auto_1441088 ) ( SURFACE-AT ?auto_1441084 ?auto_1441088 ) ( CLEAR ?auto_1441084 ) ( IS-CRATE ?auto_1441085 ) ( AVAILABLE ?auto_1441091 ) ( IN ?auto_1441085 ?auto_1441087 ) ( ON ?auto_1441078 ?auto_1441077 ) ( ON ?auto_1441079 ?auto_1441078 ) ( ON ?auto_1441081 ?auto_1441079 ) ( ON ?auto_1441080 ?auto_1441081 ) ( ON ?auto_1441082 ?auto_1441080 ) ( ON ?auto_1441083 ?auto_1441082 ) ( ON ?auto_1441084 ?auto_1441083 ) ( not ( = ?auto_1441077 ?auto_1441078 ) ) ( not ( = ?auto_1441077 ?auto_1441079 ) ) ( not ( = ?auto_1441077 ?auto_1441081 ) ) ( not ( = ?auto_1441077 ?auto_1441080 ) ) ( not ( = ?auto_1441077 ?auto_1441082 ) ) ( not ( = ?auto_1441077 ?auto_1441083 ) ) ( not ( = ?auto_1441077 ?auto_1441084 ) ) ( not ( = ?auto_1441077 ?auto_1441085 ) ) ( not ( = ?auto_1441077 ?auto_1441086 ) ) ( not ( = ?auto_1441077 ?auto_1441090 ) ) ( not ( = ?auto_1441078 ?auto_1441079 ) ) ( not ( = ?auto_1441078 ?auto_1441081 ) ) ( not ( = ?auto_1441078 ?auto_1441080 ) ) ( not ( = ?auto_1441078 ?auto_1441082 ) ) ( not ( = ?auto_1441078 ?auto_1441083 ) ) ( not ( = ?auto_1441078 ?auto_1441084 ) ) ( not ( = ?auto_1441078 ?auto_1441085 ) ) ( not ( = ?auto_1441078 ?auto_1441086 ) ) ( not ( = ?auto_1441078 ?auto_1441090 ) ) ( not ( = ?auto_1441079 ?auto_1441081 ) ) ( not ( = ?auto_1441079 ?auto_1441080 ) ) ( not ( = ?auto_1441079 ?auto_1441082 ) ) ( not ( = ?auto_1441079 ?auto_1441083 ) ) ( not ( = ?auto_1441079 ?auto_1441084 ) ) ( not ( = ?auto_1441079 ?auto_1441085 ) ) ( not ( = ?auto_1441079 ?auto_1441086 ) ) ( not ( = ?auto_1441079 ?auto_1441090 ) ) ( not ( = ?auto_1441081 ?auto_1441080 ) ) ( not ( = ?auto_1441081 ?auto_1441082 ) ) ( not ( = ?auto_1441081 ?auto_1441083 ) ) ( not ( = ?auto_1441081 ?auto_1441084 ) ) ( not ( = ?auto_1441081 ?auto_1441085 ) ) ( not ( = ?auto_1441081 ?auto_1441086 ) ) ( not ( = ?auto_1441081 ?auto_1441090 ) ) ( not ( = ?auto_1441080 ?auto_1441082 ) ) ( not ( = ?auto_1441080 ?auto_1441083 ) ) ( not ( = ?auto_1441080 ?auto_1441084 ) ) ( not ( = ?auto_1441080 ?auto_1441085 ) ) ( not ( = ?auto_1441080 ?auto_1441086 ) ) ( not ( = ?auto_1441080 ?auto_1441090 ) ) ( not ( = ?auto_1441082 ?auto_1441083 ) ) ( not ( = ?auto_1441082 ?auto_1441084 ) ) ( not ( = ?auto_1441082 ?auto_1441085 ) ) ( not ( = ?auto_1441082 ?auto_1441086 ) ) ( not ( = ?auto_1441082 ?auto_1441090 ) ) ( not ( = ?auto_1441083 ?auto_1441084 ) ) ( not ( = ?auto_1441083 ?auto_1441085 ) ) ( not ( = ?auto_1441083 ?auto_1441086 ) ) ( not ( = ?auto_1441083 ?auto_1441090 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1441084 ?auto_1441085 ?auto_1441086 )
      ( MAKE-9CRATE-VERIFY ?auto_1441077 ?auto_1441078 ?auto_1441079 ?auto_1441081 ?auto_1441080 ?auto_1441082 ?auto_1441083 ?auto_1441084 ?auto_1441085 ?auto_1441086 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1446642 - SURFACE
      ?auto_1446643 - SURFACE
      ?auto_1446644 - SURFACE
      ?auto_1446646 - SURFACE
      ?auto_1446645 - SURFACE
      ?auto_1446647 - SURFACE
      ?auto_1446648 - SURFACE
      ?auto_1446649 - SURFACE
      ?auto_1446650 - SURFACE
      ?auto_1446651 - SURFACE
      ?auto_1446652 - SURFACE
    )
    :vars
    (
      ?auto_1446653 - HOIST
      ?auto_1446654 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1446653 ?auto_1446654 ) ( SURFACE-AT ?auto_1446651 ?auto_1446654 ) ( CLEAR ?auto_1446651 ) ( LIFTING ?auto_1446653 ?auto_1446652 ) ( IS-CRATE ?auto_1446652 ) ( not ( = ?auto_1446651 ?auto_1446652 ) ) ( ON ?auto_1446643 ?auto_1446642 ) ( ON ?auto_1446644 ?auto_1446643 ) ( ON ?auto_1446646 ?auto_1446644 ) ( ON ?auto_1446645 ?auto_1446646 ) ( ON ?auto_1446647 ?auto_1446645 ) ( ON ?auto_1446648 ?auto_1446647 ) ( ON ?auto_1446649 ?auto_1446648 ) ( ON ?auto_1446650 ?auto_1446649 ) ( ON ?auto_1446651 ?auto_1446650 ) ( not ( = ?auto_1446642 ?auto_1446643 ) ) ( not ( = ?auto_1446642 ?auto_1446644 ) ) ( not ( = ?auto_1446642 ?auto_1446646 ) ) ( not ( = ?auto_1446642 ?auto_1446645 ) ) ( not ( = ?auto_1446642 ?auto_1446647 ) ) ( not ( = ?auto_1446642 ?auto_1446648 ) ) ( not ( = ?auto_1446642 ?auto_1446649 ) ) ( not ( = ?auto_1446642 ?auto_1446650 ) ) ( not ( = ?auto_1446642 ?auto_1446651 ) ) ( not ( = ?auto_1446642 ?auto_1446652 ) ) ( not ( = ?auto_1446643 ?auto_1446644 ) ) ( not ( = ?auto_1446643 ?auto_1446646 ) ) ( not ( = ?auto_1446643 ?auto_1446645 ) ) ( not ( = ?auto_1446643 ?auto_1446647 ) ) ( not ( = ?auto_1446643 ?auto_1446648 ) ) ( not ( = ?auto_1446643 ?auto_1446649 ) ) ( not ( = ?auto_1446643 ?auto_1446650 ) ) ( not ( = ?auto_1446643 ?auto_1446651 ) ) ( not ( = ?auto_1446643 ?auto_1446652 ) ) ( not ( = ?auto_1446644 ?auto_1446646 ) ) ( not ( = ?auto_1446644 ?auto_1446645 ) ) ( not ( = ?auto_1446644 ?auto_1446647 ) ) ( not ( = ?auto_1446644 ?auto_1446648 ) ) ( not ( = ?auto_1446644 ?auto_1446649 ) ) ( not ( = ?auto_1446644 ?auto_1446650 ) ) ( not ( = ?auto_1446644 ?auto_1446651 ) ) ( not ( = ?auto_1446644 ?auto_1446652 ) ) ( not ( = ?auto_1446646 ?auto_1446645 ) ) ( not ( = ?auto_1446646 ?auto_1446647 ) ) ( not ( = ?auto_1446646 ?auto_1446648 ) ) ( not ( = ?auto_1446646 ?auto_1446649 ) ) ( not ( = ?auto_1446646 ?auto_1446650 ) ) ( not ( = ?auto_1446646 ?auto_1446651 ) ) ( not ( = ?auto_1446646 ?auto_1446652 ) ) ( not ( = ?auto_1446645 ?auto_1446647 ) ) ( not ( = ?auto_1446645 ?auto_1446648 ) ) ( not ( = ?auto_1446645 ?auto_1446649 ) ) ( not ( = ?auto_1446645 ?auto_1446650 ) ) ( not ( = ?auto_1446645 ?auto_1446651 ) ) ( not ( = ?auto_1446645 ?auto_1446652 ) ) ( not ( = ?auto_1446647 ?auto_1446648 ) ) ( not ( = ?auto_1446647 ?auto_1446649 ) ) ( not ( = ?auto_1446647 ?auto_1446650 ) ) ( not ( = ?auto_1446647 ?auto_1446651 ) ) ( not ( = ?auto_1446647 ?auto_1446652 ) ) ( not ( = ?auto_1446648 ?auto_1446649 ) ) ( not ( = ?auto_1446648 ?auto_1446650 ) ) ( not ( = ?auto_1446648 ?auto_1446651 ) ) ( not ( = ?auto_1446648 ?auto_1446652 ) ) ( not ( = ?auto_1446649 ?auto_1446650 ) ) ( not ( = ?auto_1446649 ?auto_1446651 ) ) ( not ( = ?auto_1446649 ?auto_1446652 ) ) ( not ( = ?auto_1446650 ?auto_1446651 ) ) ( not ( = ?auto_1446650 ?auto_1446652 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1446651 ?auto_1446652 )
      ( MAKE-10CRATE-VERIFY ?auto_1446642 ?auto_1446643 ?auto_1446644 ?auto_1446646 ?auto_1446645 ?auto_1446647 ?auto_1446648 ?auto_1446649 ?auto_1446650 ?auto_1446651 ?auto_1446652 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1446736 - SURFACE
      ?auto_1446737 - SURFACE
      ?auto_1446738 - SURFACE
      ?auto_1446740 - SURFACE
      ?auto_1446739 - SURFACE
      ?auto_1446741 - SURFACE
      ?auto_1446742 - SURFACE
      ?auto_1446743 - SURFACE
      ?auto_1446744 - SURFACE
      ?auto_1446745 - SURFACE
      ?auto_1446746 - SURFACE
    )
    :vars
    (
      ?auto_1446748 - HOIST
      ?auto_1446747 - PLACE
      ?auto_1446749 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1446748 ?auto_1446747 ) ( SURFACE-AT ?auto_1446745 ?auto_1446747 ) ( CLEAR ?auto_1446745 ) ( IS-CRATE ?auto_1446746 ) ( not ( = ?auto_1446745 ?auto_1446746 ) ) ( TRUCK-AT ?auto_1446749 ?auto_1446747 ) ( AVAILABLE ?auto_1446748 ) ( IN ?auto_1446746 ?auto_1446749 ) ( ON ?auto_1446745 ?auto_1446744 ) ( not ( = ?auto_1446744 ?auto_1446745 ) ) ( not ( = ?auto_1446744 ?auto_1446746 ) ) ( ON ?auto_1446737 ?auto_1446736 ) ( ON ?auto_1446738 ?auto_1446737 ) ( ON ?auto_1446740 ?auto_1446738 ) ( ON ?auto_1446739 ?auto_1446740 ) ( ON ?auto_1446741 ?auto_1446739 ) ( ON ?auto_1446742 ?auto_1446741 ) ( ON ?auto_1446743 ?auto_1446742 ) ( ON ?auto_1446744 ?auto_1446743 ) ( not ( = ?auto_1446736 ?auto_1446737 ) ) ( not ( = ?auto_1446736 ?auto_1446738 ) ) ( not ( = ?auto_1446736 ?auto_1446740 ) ) ( not ( = ?auto_1446736 ?auto_1446739 ) ) ( not ( = ?auto_1446736 ?auto_1446741 ) ) ( not ( = ?auto_1446736 ?auto_1446742 ) ) ( not ( = ?auto_1446736 ?auto_1446743 ) ) ( not ( = ?auto_1446736 ?auto_1446744 ) ) ( not ( = ?auto_1446736 ?auto_1446745 ) ) ( not ( = ?auto_1446736 ?auto_1446746 ) ) ( not ( = ?auto_1446737 ?auto_1446738 ) ) ( not ( = ?auto_1446737 ?auto_1446740 ) ) ( not ( = ?auto_1446737 ?auto_1446739 ) ) ( not ( = ?auto_1446737 ?auto_1446741 ) ) ( not ( = ?auto_1446737 ?auto_1446742 ) ) ( not ( = ?auto_1446737 ?auto_1446743 ) ) ( not ( = ?auto_1446737 ?auto_1446744 ) ) ( not ( = ?auto_1446737 ?auto_1446745 ) ) ( not ( = ?auto_1446737 ?auto_1446746 ) ) ( not ( = ?auto_1446738 ?auto_1446740 ) ) ( not ( = ?auto_1446738 ?auto_1446739 ) ) ( not ( = ?auto_1446738 ?auto_1446741 ) ) ( not ( = ?auto_1446738 ?auto_1446742 ) ) ( not ( = ?auto_1446738 ?auto_1446743 ) ) ( not ( = ?auto_1446738 ?auto_1446744 ) ) ( not ( = ?auto_1446738 ?auto_1446745 ) ) ( not ( = ?auto_1446738 ?auto_1446746 ) ) ( not ( = ?auto_1446740 ?auto_1446739 ) ) ( not ( = ?auto_1446740 ?auto_1446741 ) ) ( not ( = ?auto_1446740 ?auto_1446742 ) ) ( not ( = ?auto_1446740 ?auto_1446743 ) ) ( not ( = ?auto_1446740 ?auto_1446744 ) ) ( not ( = ?auto_1446740 ?auto_1446745 ) ) ( not ( = ?auto_1446740 ?auto_1446746 ) ) ( not ( = ?auto_1446739 ?auto_1446741 ) ) ( not ( = ?auto_1446739 ?auto_1446742 ) ) ( not ( = ?auto_1446739 ?auto_1446743 ) ) ( not ( = ?auto_1446739 ?auto_1446744 ) ) ( not ( = ?auto_1446739 ?auto_1446745 ) ) ( not ( = ?auto_1446739 ?auto_1446746 ) ) ( not ( = ?auto_1446741 ?auto_1446742 ) ) ( not ( = ?auto_1446741 ?auto_1446743 ) ) ( not ( = ?auto_1446741 ?auto_1446744 ) ) ( not ( = ?auto_1446741 ?auto_1446745 ) ) ( not ( = ?auto_1446741 ?auto_1446746 ) ) ( not ( = ?auto_1446742 ?auto_1446743 ) ) ( not ( = ?auto_1446742 ?auto_1446744 ) ) ( not ( = ?auto_1446742 ?auto_1446745 ) ) ( not ( = ?auto_1446742 ?auto_1446746 ) ) ( not ( = ?auto_1446743 ?auto_1446744 ) ) ( not ( = ?auto_1446743 ?auto_1446745 ) ) ( not ( = ?auto_1446743 ?auto_1446746 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1446744 ?auto_1446745 ?auto_1446746 )
      ( MAKE-10CRATE-VERIFY ?auto_1446736 ?auto_1446737 ?auto_1446738 ?auto_1446740 ?auto_1446739 ?auto_1446741 ?auto_1446742 ?auto_1446743 ?auto_1446744 ?auto_1446745 ?auto_1446746 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1446841 - SURFACE
      ?auto_1446842 - SURFACE
      ?auto_1446843 - SURFACE
      ?auto_1446845 - SURFACE
      ?auto_1446844 - SURFACE
      ?auto_1446846 - SURFACE
      ?auto_1446847 - SURFACE
      ?auto_1446848 - SURFACE
      ?auto_1446849 - SURFACE
      ?auto_1446850 - SURFACE
      ?auto_1446851 - SURFACE
    )
    :vars
    (
      ?auto_1446852 - HOIST
      ?auto_1446855 - PLACE
      ?auto_1446853 - TRUCK
      ?auto_1446854 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1446852 ?auto_1446855 ) ( SURFACE-AT ?auto_1446850 ?auto_1446855 ) ( CLEAR ?auto_1446850 ) ( IS-CRATE ?auto_1446851 ) ( not ( = ?auto_1446850 ?auto_1446851 ) ) ( AVAILABLE ?auto_1446852 ) ( IN ?auto_1446851 ?auto_1446853 ) ( ON ?auto_1446850 ?auto_1446849 ) ( not ( = ?auto_1446849 ?auto_1446850 ) ) ( not ( = ?auto_1446849 ?auto_1446851 ) ) ( TRUCK-AT ?auto_1446853 ?auto_1446854 ) ( not ( = ?auto_1446854 ?auto_1446855 ) ) ( ON ?auto_1446842 ?auto_1446841 ) ( ON ?auto_1446843 ?auto_1446842 ) ( ON ?auto_1446845 ?auto_1446843 ) ( ON ?auto_1446844 ?auto_1446845 ) ( ON ?auto_1446846 ?auto_1446844 ) ( ON ?auto_1446847 ?auto_1446846 ) ( ON ?auto_1446848 ?auto_1446847 ) ( ON ?auto_1446849 ?auto_1446848 ) ( not ( = ?auto_1446841 ?auto_1446842 ) ) ( not ( = ?auto_1446841 ?auto_1446843 ) ) ( not ( = ?auto_1446841 ?auto_1446845 ) ) ( not ( = ?auto_1446841 ?auto_1446844 ) ) ( not ( = ?auto_1446841 ?auto_1446846 ) ) ( not ( = ?auto_1446841 ?auto_1446847 ) ) ( not ( = ?auto_1446841 ?auto_1446848 ) ) ( not ( = ?auto_1446841 ?auto_1446849 ) ) ( not ( = ?auto_1446841 ?auto_1446850 ) ) ( not ( = ?auto_1446841 ?auto_1446851 ) ) ( not ( = ?auto_1446842 ?auto_1446843 ) ) ( not ( = ?auto_1446842 ?auto_1446845 ) ) ( not ( = ?auto_1446842 ?auto_1446844 ) ) ( not ( = ?auto_1446842 ?auto_1446846 ) ) ( not ( = ?auto_1446842 ?auto_1446847 ) ) ( not ( = ?auto_1446842 ?auto_1446848 ) ) ( not ( = ?auto_1446842 ?auto_1446849 ) ) ( not ( = ?auto_1446842 ?auto_1446850 ) ) ( not ( = ?auto_1446842 ?auto_1446851 ) ) ( not ( = ?auto_1446843 ?auto_1446845 ) ) ( not ( = ?auto_1446843 ?auto_1446844 ) ) ( not ( = ?auto_1446843 ?auto_1446846 ) ) ( not ( = ?auto_1446843 ?auto_1446847 ) ) ( not ( = ?auto_1446843 ?auto_1446848 ) ) ( not ( = ?auto_1446843 ?auto_1446849 ) ) ( not ( = ?auto_1446843 ?auto_1446850 ) ) ( not ( = ?auto_1446843 ?auto_1446851 ) ) ( not ( = ?auto_1446845 ?auto_1446844 ) ) ( not ( = ?auto_1446845 ?auto_1446846 ) ) ( not ( = ?auto_1446845 ?auto_1446847 ) ) ( not ( = ?auto_1446845 ?auto_1446848 ) ) ( not ( = ?auto_1446845 ?auto_1446849 ) ) ( not ( = ?auto_1446845 ?auto_1446850 ) ) ( not ( = ?auto_1446845 ?auto_1446851 ) ) ( not ( = ?auto_1446844 ?auto_1446846 ) ) ( not ( = ?auto_1446844 ?auto_1446847 ) ) ( not ( = ?auto_1446844 ?auto_1446848 ) ) ( not ( = ?auto_1446844 ?auto_1446849 ) ) ( not ( = ?auto_1446844 ?auto_1446850 ) ) ( not ( = ?auto_1446844 ?auto_1446851 ) ) ( not ( = ?auto_1446846 ?auto_1446847 ) ) ( not ( = ?auto_1446846 ?auto_1446848 ) ) ( not ( = ?auto_1446846 ?auto_1446849 ) ) ( not ( = ?auto_1446846 ?auto_1446850 ) ) ( not ( = ?auto_1446846 ?auto_1446851 ) ) ( not ( = ?auto_1446847 ?auto_1446848 ) ) ( not ( = ?auto_1446847 ?auto_1446849 ) ) ( not ( = ?auto_1446847 ?auto_1446850 ) ) ( not ( = ?auto_1446847 ?auto_1446851 ) ) ( not ( = ?auto_1446848 ?auto_1446849 ) ) ( not ( = ?auto_1446848 ?auto_1446850 ) ) ( not ( = ?auto_1446848 ?auto_1446851 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1446849 ?auto_1446850 ?auto_1446851 )
      ( MAKE-10CRATE-VERIFY ?auto_1446841 ?auto_1446842 ?auto_1446843 ?auto_1446845 ?auto_1446844 ?auto_1446846 ?auto_1446847 ?auto_1446848 ?auto_1446849 ?auto_1446850 ?auto_1446851 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1446956 - SURFACE
      ?auto_1446957 - SURFACE
      ?auto_1446958 - SURFACE
      ?auto_1446960 - SURFACE
      ?auto_1446959 - SURFACE
      ?auto_1446961 - SURFACE
      ?auto_1446962 - SURFACE
      ?auto_1446963 - SURFACE
      ?auto_1446964 - SURFACE
      ?auto_1446965 - SURFACE
      ?auto_1446966 - SURFACE
    )
    :vars
    (
      ?auto_1446970 - HOIST
      ?auto_1446968 - PLACE
      ?auto_1446971 - TRUCK
      ?auto_1446969 - PLACE
      ?auto_1446967 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1446970 ?auto_1446968 ) ( SURFACE-AT ?auto_1446965 ?auto_1446968 ) ( CLEAR ?auto_1446965 ) ( IS-CRATE ?auto_1446966 ) ( not ( = ?auto_1446965 ?auto_1446966 ) ) ( AVAILABLE ?auto_1446970 ) ( ON ?auto_1446965 ?auto_1446964 ) ( not ( = ?auto_1446964 ?auto_1446965 ) ) ( not ( = ?auto_1446964 ?auto_1446966 ) ) ( TRUCK-AT ?auto_1446971 ?auto_1446969 ) ( not ( = ?auto_1446969 ?auto_1446968 ) ) ( HOIST-AT ?auto_1446967 ?auto_1446969 ) ( LIFTING ?auto_1446967 ?auto_1446966 ) ( not ( = ?auto_1446970 ?auto_1446967 ) ) ( ON ?auto_1446957 ?auto_1446956 ) ( ON ?auto_1446958 ?auto_1446957 ) ( ON ?auto_1446960 ?auto_1446958 ) ( ON ?auto_1446959 ?auto_1446960 ) ( ON ?auto_1446961 ?auto_1446959 ) ( ON ?auto_1446962 ?auto_1446961 ) ( ON ?auto_1446963 ?auto_1446962 ) ( ON ?auto_1446964 ?auto_1446963 ) ( not ( = ?auto_1446956 ?auto_1446957 ) ) ( not ( = ?auto_1446956 ?auto_1446958 ) ) ( not ( = ?auto_1446956 ?auto_1446960 ) ) ( not ( = ?auto_1446956 ?auto_1446959 ) ) ( not ( = ?auto_1446956 ?auto_1446961 ) ) ( not ( = ?auto_1446956 ?auto_1446962 ) ) ( not ( = ?auto_1446956 ?auto_1446963 ) ) ( not ( = ?auto_1446956 ?auto_1446964 ) ) ( not ( = ?auto_1446956 ?auto_1446965 ) ) ( not ( = ?auto_1446956 ?auto_1446966 ) ) ( not ( = ?auto_1446957 ?auto_1446958 ) ) ( not ( = ?auto_1446957 ?auto_1446960 ) ) ( not ( = ?auto_1446957 ?auto_1446959 ) ) ( not ( = ?auto_1446957 ?auto_1446961 ) ) ( not ( = ?auto_1446957 ?auto_1446962 ) ) ( not ( = ?auto_1446957 ?auto_1446963 ) ) ( not ( = ?auto_1446957 ?auto_1446964 ) ) ( not ( = ?auto_1446957 ?auto_1446965 ) ) ( not ( = ?auto_1446957 ?auto_1446966 ) ) ( not ( = ?auto_1446958 ?auto_1446960 ) ) ( not ( = ?auto_1446958 ?auto_1446959 ) ) ( not ( = ?auto_1446958 ?auto_1446961 ) ) ( not ( = ?auto_1446958 ?auto_1446962 ) ) ( not ( = ?auto_1446958 ?auto_1446963 ) ) ( not ( = ?auto_1446958 ?auto_1446964 ) ) ( not ( = ?auto_1446958 ?auto_1446965 ) ) ( not ( = ?auto_1446958 ?auto_1446966 ) ) ( not ( = ?auto_1446960 ?auto_1446959 ) ) ( not ( = ?auto_1446960 ?auto_1446961 ) ) ( not ( = ?auto_1446960 ?auto_1446962 ) ) ( not ( = ?auto_1446960 ?auto_1446963 ) ) ( not ( = ?auto_1446960 ?auto_1446964 ) ) ( not ( = ?auto_1446960 ?auto_1446965 ) ) ( not ( = ?auto_1446960 ?auto_1446966 ) ) ( not ( = ?auto_1446959 ?auto_1446961 ) ) ( not ( = ?auto_1446959 ?auto_1446962 ) ) ( not ( = ?auto_1446959 ?auto_1446963 ) ) ( not ( = ?auto_1446959 ?auto_1446964 ) ) ( not ( = ?auto_1446959 ?auto_1446965 ) ) ( not ( = ?auto_1446959 ?auto_1446966 ) ) ( not ( = ?auto_1446961 ?auto_1446962 ) ) ( not ( = ?auto_1446961 ?auto_1446963 ) ) ( not ( = ?auto_1446961 ?auto_1446964 ) ) ( not ( = ?auto_1446961 ?auto_1446965 ) ) ( not ( = ?auto_1446961 ?auto_1446966 ) ) ( not ( = ?auto_1446962 ?auto_1446963 ) ) ( not ( = ?auto_1446962 ?auto_1446964 ) ) ( not ( = ?auto_1446962 ?auto_1446965 ) ) ( not ( = ?auto_1446962 ?auto_1446966 ) ) ( not ( = ?auto_1446963 ?auto_1446964 ) ) ( not ( = ?auto_1446963 ?auto_1446965 ) ) ( not ( = ?auto_1446963 ?auto_1446966 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1446964 ?auto_1446965 ?auto_1446966 )
      ( MAKE-10CRATE-VERIFY ?auto_1446956 ?auto_1446957 ?auto_1446958 ?auto_1446960 ?auto_1446959 ?auto_1446961 ?auto_1446962 ?auto_1446963 ?auto_1446964 ?auto_1446965 ?auto_1446966 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447081 - SURFACE
      ?auto_1447082 - SURFACE
      ?auto_1447083 - SURFACE
      ?auto_1447085 - SURFACE
      ?auto_1447084 - SURFACE
      ?auto_1447086 - SURFACE
      ?auto_1447087 - SURFACE
      ?auto_1447088 - SURFACE
      ?auto_1447089 - SURFACE
      ?auto_1447090 - SURFACE
      ?auto_1447091 - SURFACE
    )
    :vars
    (
      ?auto_1447096 - HOIST
      ?auto_1447094 - PLACE
      ?auto_1447093 - TRUCK
      ?auto_1447097 - PLACE
      ?auto_1447095 - HOIST
      ?auto_1447092 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447096 ?auto_1447094 ) ( SURFACE-AT ?auto_1447090 ?auto_1447094 ) ( CLEAR ?auto_1447090 ) ( IS-CRATE ?auto_1447091 ) ( not ( = ?auto_1447090 ?auto_1447091 ) ) ( AVAILABLE ?auto_1447096 ) ( ON ?auto_1447090 ?auto_1447089 ) ( not ( = ?auto_1447089 ?auto_1447090 ) ) ( not ( = ?auto_1447089 ?auto_1447091 ) ) ( TRUCK-AT ?auto_1447093 ?auto_1447097 ) ( not ( = ?auto_1447097 ?auto_1447094 ) ) ( HOIST-AT ?auto_1447095 ?auto_1447097 ) ( not ( = ?auto_1447096 ?auto_1447095 ) ) ( AVAILABLE ?auto_1447095 ) ( SURFACE-AT ?auto_1447091 ?auto_1447097 ) ( ON ?auto_1447091 ?auto_1447092 ) ( CLEAR ?auto_1447091 ) ( not ( = ?auto_1447090 ?auto_1447092 ) ) ( not ( = ?auto_1447091 ?auto_1447092 ) ) ( not ( = ?auto_1447089 ?auto_1447092 ) ) ( ON ?auto_1447082 ?auto_1447081 ) ( ON ?auto_1447083 ?auto_1447082 ) ( ON ?auto_1447085 ?auto_1447083 ) ( ON ?auto_1447084 ?auto_1447085 ) ( ON ?auto_1447086 ?auto_1447084 ) ( ON ?auto_1447087 ?auto_1447086 ) ( ON ?auto_1447088 ?auto_1447087 ) ( ON ?auto_1447089 ?auto_1447088 ) ( not ( = ?auto_1447081 ?auto_1447082 ) ) ( not ( = ?auto_1447081 ?auto_1447083 ) ) ( not ( = ?auto_1447081 ?auto_1447085 ) ) ( not ( = ?auto_1447081 ?auto_1447084 ) ) ( not ( = ?auto_1447081 ?auto_1447086 ) ) ( not ( = ?auto_1447081 ?auto_1447087 ) ) ( not ( = ?auto_1447081 ?auto_1447088 ) ) ( not ( = ?auto_1447081 ?auto_1447089 ) ) ( not ( = ?auto_1447081 ?auto_1447090 ) ) ( not ( = ?auto_1447081 ?auto_1447091 ) ) ( not ( = ?auto_1447081 ?auto_1447092 ) ) ( not ( = ?auto_1447082 ?auto_1447083 ) ) ( not ( = ?auto_1447082 ?auto_1447085 ) ) ( not ( = ?auto_1447082 ?auto_1447084 ) ) ( not ( = ?auto_1447082 ?auto_1447086 ) ) ( not ( = ?auto_1447082 ?auto_1447087 ) ) ( not ( = ?auto_1447082 ?auto_1447088 ) ) ( not ( = ?auto_1447082 ?auto_1447089 ) ) ( not ( = ?auto_1447082 ?auto_1447090 ) ) ( not ( = ?auto_1447082 ?auto_1447091 ) ) ( not ( = ?auto_1447082 ?auto_1447092 ) ) ( not ( = ?auto_1447083 ?auto_1447085 ) ) ( not ( = ?auto_1447083 ?auto_1447084 ) ) ( not ( = ?auto_1447083 ?auto_1447086 ) ) ( not ( = ?auto_1447083 ?auto_1447087 ) ) ( not ( = ?auto_1447083 ?auto_1447088 ) ) ( not ( = ?auto_1447083 ?auto_1447089 ) ) ( not ( = ?auto_1447083 ?auto_1447090 ) ) ( not ( = ?auto_1447083 ?auto_1447091 ) ) ( not ( = ?auto_1447083 ?auto_1447092 ) ) ( not ( = ?auto_1447085 ?auto_1447084 ) ) ( not ( = ?auto_1447085 ?auto_1447086 ) ) ( not ( = ?auto_1447085 ?auto_1447087 ) ) ( not ( = ?auto_1447085 ?auto_1447088 ) ) ( not ( = ?auto_1447085 ?auto_1447089 ) ) ( not ( = ?auto_1447085 ?auto_1447090 ) ) ( not ( = ?auto_1447085 ?auto_1447091 ) ) ( not ( = ?auto_1447085 ?auto_1447092 ) ) ( not ( = ?auto_1447084 ?auto_1447086 ) ) ( not ( = ?auto_1447084 ?auto_1447087 ) ) ( not ( = ?auto_1447084 ?auto_1447088 ) ) ( not ( = ?auto_1447084 ?auto_1447089 ) ) ( not ( = ?auto_1447084 ?auto_1447090 ) ) ( not ( = ?auto_1447084 ?auto_1447091 ) ) ( not ( = ?auto_1447084 ?auto_1447092 ) ) ( not ( = ?auto_1447086 ?auto_1447087 ) ) ( not ( = ?auto_1447086 ?auto_1447088 ) ) ( not ( = ?auto_1447086 ?auto_1447089 ) ) ( not ( = ?auto_1447086 ?auto_1447090 ) ) ( not ( = ?auto_1447086 ?auto_1447091 ) ) ( not ( = ?auto_1447086 ?auto_1447092 ) ) ( not ( = ?auto_1447087 ?auto_1447088 ) ) ( not ( = ?auto_1447087 ?auto_1447089 ) ) ( not ( = ?auto_1447087 ?auto_1447090 ) ) ( not ( = ?auto_1447087 ?auto_1447091 ) ) ( not ( = ?auto_1447087 ?auto_1447092 ) ) ( not ( = ?auto_1447088 ?auto_1447089 ) ) ( not ( = ?auto_1447088 ?auto_1447090 ) ) ( not ( = ?auto_1447088 ?auto_1447091 ) ) ( not ( = ?auto_1447088 ?auto_1447092 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447089 ?auto_1447090 ?auto_1447091 )
      ( MAKE-10CRATE-VERIFY ?auto_1447081 ?auto_1447082 ?auto_1447083 ?auto_1447085 ?auto_1447084 ?auto_1447086 ?auto_1447087 ?auto_1447088 ?auto_1447089 ?auto_1447090 ?auto_1447091 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447207 - SURFACE
      ?auto_1447208 - SURFACE
      ?auto_1447209 - SURFACE
      ?auto_1447211 - SURFACE
      ?auto_1447210 - SURFACE
      ?auto_1447212 - SURFACE
      ?auto_1447213 - SURFACE
      ?auto_1447214 - SURFACE
      ?auto_1447215 - SURFACE
      ?auto_1447216 - SURFACE
      ?auto_1447217 - SURFACE
    )
    :vars
    (
      ?auto_1447218 - HOIST
      ?auto_1447221 - PLACE
      ?auto_1447223 - PLACE
      ?auto_1447220 - HOIST
      ?auto_1447219 - SURFACE
      ?auto_1447222 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447218 ?auto_1447221 ) ( SURFACE-AT ?auto_1447216 ?auto_1447221 ) ( CLEAR ?auto_1447216 ) ( IS-CRATE ?auto_1447217 ) ( not ( = ?auto_1447216 ?auto_1447217 ) ) ( AVAILABLE ?auto_1447218 ) ( ON ?auto_1447216 ?auto_1447215 ) ( not ( = ?auto_1447215 ?auto_1447216 ) ) ( not ( = ?auto_1447215 ?auto_1447217 ) ) ( not ( = ?auto_1447223 ?auto_1447221 ) ) ( HOIST-AT ?auto_1447220 ?auto_1447223 ) ( not ( = ?auto_1447218 ?auto_1447220 ) ) ( AVAILABLE ?auto_1447220 ) ( SURFACE-AT ?auto_1447217 ?auto_1447223 ) ( ON ?auto_1447217 ?auto_1447219 ) ( CLEAR ?auto_1447217 ) ( not ( = ?auto_1447216 ?auto_1447219 ) ) ( not ( = ?auto_1447217 ?auto_1447219 ) ) ( not ( = ?auto_1447215 ?auto_1447219 ) ) ( TRUCK-AT ?auto_1447222 ?auto_1447221 ) ( ON ?auto_1447208 ?auto_1447207 ) ( ON ?auto_1447209 ?auto_1447208 ) ( ON ?auto_1447211 ?auto_1447209 ) ( ON ?auto_1447210 ?auto_1447211 ) ( ON ?auto_1447212 ?auto_1447210 ) ( ON ?auto_1447213 ?auto_1447212 ) ( ON ?auto_1447214 ?auto_1447213 ) ( ON ?auto_1447215 ?auto_1447214 ) ( not ( = ?auto_1447207 ?auto_1447208 ) ) ( not ( = ?auto_1447207 ?auto_1447209 ) ) ( not ( = ?auto_1447207 ?auto_1447211 ) ) ( not ( = ?auto_1447207 ?auto_1447210 ) ) ( not ( = ?auto_1447207 ?auto_1447212 ) ) ( not ( = ?auto_1447207 ?auto_1447213 ) ) ( not ( = ?auto_1447207 ?auto_1447214 ) ) ( not ( = ?auto_1447207 ?auto_1447215 ) ) ( not ( = ?auto_1447207 ?auto_1447216 ) ) ( not ( = ?auto_1447207 ?auto_1447217 ) ) ( not ( = ?auto_1447207 ?auto_1447219 ) ) ( not ( = ?auto_1447208 ?auto_1447209 ) ) ( not ( = ?auto_1447208 ?auto_1447211 ) ) ( not ( = ?auto_1447208 ?auto_1447210 ) ) ( not ( = ?auto_1447208 ?auto_1447212 ) ) ( not ( = ?auto_1447208 ?auto_1447213 ) ) ( not ( = ?auto_1447208 ?auto_1447214 ) ) ( not ( = ?auto_1447208 ?auto_1447215 ) ) ( not ( = ?auto_1447208 ?auto_1447216 ) ) ( not ( = ?auto_1447208 ?auto_1447217 ) ) ( not ( = ?auto_1447208 ?auto_1447219 ) ) ( not ( = ?auto_1447209 ?auto_1447211 ) ) ( not ( = ?auto_1447209 ?auto_1447210 ) ) ( not ( = ?auto_1447209 ?auto_1447212 ) ) ( not ( = ?auto_1447209 ?auto_1447213 ) ) ( not ( = ?auto_1447209 ?auto_1447214 ) ) ( not ( = ?auto_1447209 ?auto_1447215 ) ) ( not ( = ?auto_1447209 ?auto_1447216 ) ) ( not ( = ?auto_1447209 ?auto_1447217 ) ) ( not ( = ?auto_1447209 ?auto_1447219 ) ) ( not ( = ?auto_1447211 ?auto_1447210 ) ) ( not ( = ?auto_1447211 ?auto_1447212 ) ) ( not ( = ?auto_1447211 ?auto_1447213 ) ) ( not ( = ?auto_1447211 ?auto_1447214 ) ) ( not ( = ?auto_1447211 ?auto_1447215 ) ) ( not ( = ?auto_1447211 ?auto_1447216 ) ) ( not ( = ?auto_1447211 ?auto_1447217 ) ) ( not ( = ?auto_1447211 ?auto_1447219 ) ) ( not ( = ?auto_1447210 ?auto_1447212 ) ) ( not ( = ?auto_1447210 ?auto_1447213 ) ) ( not ( = ?auto_1447210 ?auto_1447214 ) ) ( not ( = ?auto_1447210 ?auto_1447215 ) ) ( not ( = ?auto_1447210 ?auto_1447216 ) ) ( not ( = ?auto_1447210 ?auto_1447217 ) ) ( not ( = ?auto_1447210 ?auto_1447219 ) ) ( not ( = ?auto_1447212 ?auto_1447213 ) ) ( not ( = ?auto_1447212 ?auto_1447214 ) ) ( not ( = ?auto_1447212 ?auto_1447215 ) ) ( not ( = ?auto_1447212 ?auto_1447216 ) ) ( not ( = ?auto_1447212 ?auto_1447217 ) ) ( not ( = ?auto_1447212 ?auto_1447219 ) ) ( not ( = ?auto_1447213 ?auto_1447214 ) ) ( not ( = ?auto_1447213 ?auto_1447215 ) ) ( not ( = ?auto_1447213 ?auto_1447216 ) ) ( not ( = ?auto_1447213 ?auto_1447217 ) ) ( not ( = ?auto_1447213 ?auto_1447219 ) ) ( not ( = ?auto_1447214 ?auto_1447215 ) ) ( not ( = ?auto_1447214 ?auto_1447216 ) ) ( not ( = ?auto_1447214 ?auto_1447217 ) ) ( not ( = ?auto_1447214 ?auto_1447219 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447215 ?auto_1447216 ?auto_1447217 )
      ( MAKE-10CRATE-VERIFY ?auto_1447207 ?auto_1447208 ?auto_1447209 ?auto_1447211 ?auto_1447210 ?auto_1447212 ?auto_1447213 ?auto_1447214 ?auto_1447215 ?auto_1447216 ?auto_1447217 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447333 - SURFACE
      ?auto_1447334 - SURFACE
      ?auto_1447335 - SURFACE
      ?auto_1447337 - SURFACE
      ?auto_1447336 - SURFACE
      ?auto_1447338 - SURFACE
      ?auto_1447339 - SURFACE
      ?auto_1447340 - SURFACE
      ?auto_1447341 - SURFACE
      ?auto_1447342 - SURFACE
      ?auto_1447343 - SURFACE
    )
    :vars
    (
      ?auto_1447349 - HOIST
      ?auto_1447346 - PLACE
      ?auto_1447348 - PLACE
      ?auto_1447344 - HOIST
      ?auto_1447347 - SURFACE
      ?auto_1447345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447349 ?auto_1447346 ) ( IS-CRATE ?auto_1447343 ) ( not ( = ?auto_1447342 ?auto_1447343 ) ) ( not ( = ?auto_1447341 ?auto_1447342 ) ) ( not ( = ?auto_1447341 ?auto_1447343 ) ) ( not ( = ?auto_1447348 ?auto_1447346 ) ) ( HOIST-AT ?auto_1447344 ?auto_1447348 ) ( not ( = ?auto_1447349 ?auto_1447344 ) ) ( AVAILABLE ?auto_1447344 ) ( SURFACE-AT ?auto_1447343 ?auto_1447348 ) ( ON ?auto_1447343 ?auto_1447347 ) ( CLEAR ?auto_1447343 ) ( not ( = ?auto_1447342 ?auto_1447347 ) ) ( not ( = ?auto_1447343 ?auto_1447347 ) ) ( not ( = ?auto_1447341 ?auto_1447347 ) ) ( TRUCK-AT ?auto_1447345 ?auto_1447346 ) ( SURFACE-AT ?auto_1447341 ?auto_1447346 ) ( CLEAR ?auto_1447341 ) ( LIFTING ?auto_1447349 ?auto_1447342 ) ( IS-CRATE ?auto_1447342 ) ( ON ?auto_1447334 ?auto_1447333 ) ( ON ?auto_1447335 ?auto_1447334 ) ( ON ?auto_1447337 ?auto_1447335 ) ( ON ?auto_1447336 ?auto_1447337 ) ( ON ?auto_1447338 ?auto_1447336 ) ( ON ?auto_1447339 ?auto_1447338 ) ( ON ?auto_1447340 ?auto_1447339 ) ( ON ?auto_1447341 ?auto_1447340 ) ( not ( = ?auto_1447333 ?auto_1447334 ) ) ( not ( = ?auto_1447333 ?auto_1447335 ) ) ( not ( = ?auto_1447333 ?auto_1447337 ) ) ( not ( = ?auto_1447333 ?auto_1447336 ) ) ( not ( = ?auto_1447333 ?auto_1447338 ) ) ( not ( = ?auto_1447333 ?auto_1447339 ) ) ( not ( = ?auto_1447333 ?auto_1447340 ) ) ( not ( = ?auto_1447333 ?auto_1447341 ) ) ( not ( = ?auto_1447333 ?auto_1447342 ) ) ( not ( = ?auto_1447333 ?auto_1447343 ) ) ( not ( = ?auto_1447333 ?auto_1447347 ) ) ( not ( = ?auto_1447334 ?auto_1447335 ) ) ( not ( = ?auto_1447334 ?auto_1447337 ) ) ( not ( = ?auto_1447334 ?auto_1447336 ) ) ( not ( = ?auto_1447334 ?auto_1447338 ) ) ( not ( = ?auto_1447334 ?auto_1447339 ) ) ( not ( = ?auto_1447334 ?auto_1447340 ) ) ( not ( = ?auto_1447334 ?auto_1447341 ) ) ( not ( = ?auto_1447334 ?auto_1447342 ) ) ( not ( = ?auto_1447334 ?auto_1447343 ) ) ( not ( = ?auto_1447334 ?auto_1447347 ) ) ( not ( = ?auto_1447335 ?auto_1447337 ) ) ( not ( = ?auto_1447335 ?auto_1447336 ) ) ( not ( = ?auto_1447335 ?auto_1447338 ) ) ( not ( = ?auto_1447335 ?auto_1447339 ) ) ( not ( = ?auto_1447335 ?auto_1447340 ) ) ( not ( = ?auto_1447335 ?auto_1447341 ) ) ( not ( = ?auto_1447335 ?auto_1447342 ) ) ( not ( = ?auto_1447335 ?auto_1447343 ) ) ( not ( = ?auto_1447335 ?auto_1447347 ) ) ( not ( = ?auto_1447337 ?auto_1447336 ) ) ( not ( = ?auto_1447337 ?auto_1447338 ) ) ( not ( = ?auto_1447337 ?auto_1447339 ) ) ( not ( = ?auto_1447337 ?auto_1447340 ) ) ( not ( = ?auto_1447337 ?auto_1447341 ) ) ( not ( = ?auto_1447337 ?auto_1447342 ) ) ( not ( = ?auto_1447337 ?auto_1447343 ) ) ( not ( = ?auto_1447337 ?auto_1447347 ) ) ( not ( = ?auto_1447336 ?auto_1447338 ) ) ( not ( = ?auto_1447336 ?auto_1447339 ) ) ( not ( = ?auto_1447336 ?auto_1447340 ) ) ( not ( = ?auto_1447336 ?auto_1447341 ) ) ( not ( = ?auto_1447336 ?auto_1447342 ) ) ( not ( = ?auto_1447336 ?auto_1447343 ) ) ( not ( = ?auto_1447336 ?auto_1447347 ) ) ( not ( = ?auto_1447338 ?auto_1447339 ) ) ( not ( = ?auto_1447338 ?auto_1447340 ) ) ( not ( = ?auto_1447338 ?auto_1447341 ) ) ( not ( = ?auto_1447338 ?auto_1447342 ) ) ( not ( = ?auto_1447338 ?auto_1447343 ) ) ( not ( = ?auto_1447338 ?auto_1447347 ) ) ( not ( = ?auto_1447339 ?auto_1447340 ) ) ( not ( = ?auto_1447339 ?auto_1447341 ) ) ( not ( = ?auto_1447339 ?auto_1447342 ) ) ( not ( = ?auto_1447339 ?auto_1447343 ) ) ( not ( = ?auto_1447339 ?auto_1447347 ) ) ( not ( = ?auto_1447340 ?auto_1447341 ) ) ( not ( = ?auto_1447340 ?auto_1447342 ) ) ( not ( = ?auto_1447340 ?auto_1447343 ) ) ( not ( = ?auto_1447340 ?auto_1447347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447341 ?auto_1447342 ?auto_1447343 )
      ( MAKE-10CRATE-VERIFY ?auto_1447333 ?auto_1447334 ?auto_1447335 ?auto_1447337 ?auto_1447336 ?auto_1447338 ?auto_1447339 ?auto_1447340 ?auto_1447341 ?auto_1447342 ?auto_1447343 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_1447459 - SURFACE
      ?auto_1447460 - SURFACE
      ?auto_1447461 - SURFACE
      ?auto_1447463 - SURFACE
      ?auto_1447462 - SURFACE
      ?auto_1447464 - SURFACE
      ?auto_1447465 - SURFACE
      ?auto_1447466 - SURFACE
      ?auto_1447467 - SURFACE
      ?auto_1447468 - SURFACE
      ?auto_1447469 - SURFACE
    )
    :vars
    (
      ?auto_1447470 - HOIST
      ?auto_1447471 - PLACE
      ?auto_1447472 - PLACE
      ?auto_1447474 - HOIST
      ?auto_1447475 - SURFACE
      ?auto_1447473 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447470 ?auto_1447471 ) ( IS-CRATE ?auto_1447469 ) ( not ( = ?auto_1447468 ?auto_1447469 ) ) ( not ( = ?auto_1447467 ?auto_1447468 ) ) ( not ( = ?auto_1447467 ?auto_1447469 ) ) ( not ( = ?auto_1447472 ?auto_1447471 ) ) ( HOIST-AT ?auto_1447474 ?auto_1447472 ) ( not ( = ?auto_1447470 ?auto_1447474 ) ) ( AVAILABLE ?auto_1447474 ) ( SURFACE-AT ?auto_1447469 ?auto_1447472 ) ( ON ?auto_1447469 ?auto_1447475 ) ( CLEAR ?auto_1447469 ) ( not ( = ?auto_1447468 ?auto_1447475 ) ) ( not ( = ?auto_1447469 ?auto_1447475 ) ) ( not ( = ?auto_1447467 ?auto_1447475 ) ) ( TRUCK-AT ?auto_1447473 ?auto_1447471 ) ( SURFACE-AT ?auto_1447467 ?auto_1447471 ) ( CLEAR ?auto_1447467 ) ( IS-CRATE ?auto_1447468 ) ( AVAILABLE ?auto_1447470 ) ( IN ?auto_1447468 ?auto_1447473 ) ( ON ?auto_1447460 ?auto_1447459 ) ( ON ?auto_1447461 ?auto_1447460 ) ( ON ?auto_1447463 ?auto_1447461 ) ( ON ?auto_1447462 ?auto_1447463 ) ( ON ?auto_1447464 ?auto_1447462 ) ( ON ?auto_1447465 ?auto_1447464 ) ( ON ?auto_1447466 ?auto_1447465 ) ( ON ?auto_1447467 ?auto_1447466 ) ( not ( = ?auto_1447459 ?auto_1447460 ) ) ( not ( = ?auto_1447459 ?auto_1447461 ) ) ( not ( = ?auto_1447459 ?auto_1447463 ) ) ( not ( = ?auto_1447459 ?auto_1447462 ) ) ( not ( = ?auto_1447459 ?auto_1447464 ) ) ( not ( = ?auto_1447459 ?auto_1447465 ) ) ( not ( = ?auto_1447459 ?auto_1447466 ) ) ( not ( = ?auto_1447459 ?auto_1447467 ) ) ( not ( = ?auto_1447459 ?auto_1447468 ) ) ( not ( = ?auto_1447459 ?auto_1447469 ) ) ( not ( = ?auto_1447459 ?auto_1447475 ) ) ( not ( = ?auto_1447460 ?auto_1447461 ) ) ( not ( = ?auto_1447460 ?auto_1447463 ) ) ( not ( = ?auto_1447460 ?auto_1447462 ) ) ( not ( = ?auto_1447460 ?auto_1447464 ) ) ( not ( = ?auto_1447460 ?auto_1447465 ) ) ( not ( = ?auto_1447460 ?auto_1447466 ) ) ( not ( = ?auto_1447460 ?auto_1447467 ) ) ( not ( = ?auto_1447460 ?auto_1447468 ) ) ( not ( = ?auto_1447460 ?auto_1447469 ) ) ( not ( = ?auto_1447460 ?auto_1447475 ) ) ( not ( = ?auto_1447461 ?auto_1447463 ) ) ( not ( = ?auto_1447461 ?auto_1447462 ) ) ( not ( = ?auto_1447461 ?auto_1447464 ) ) ( not ( = ?auto_1447461 ?auto_1447465 ) ) ( not ( = ?auto_1447461 ?auto_1447466 ) ) ( not ( = ?auto_1447461 ?auto_1447467 ) ) ( not ( = ?auto_1447461 ?auto_1447468 ) ) ( not ( = ?auto_1447461 ?auto_1447469 ) ) ( not ( = ?auto_1447461 ?auto_1447475 ) ) ( not ( = ?auto_1447463 ?auto_1447462 ) ) ( not ( = ?auto_1447463 ?auto_1447464 ) ) ( not ( = ?auto_1447463 ?auto_1447465 ) ) ( not ( = ?auto_1447463 ?auto_1447466 ) ) ( not ( = ?auto_1447463 ?auto_1447467 ) ) ( not ( = ?auto_1447463 ?auto_1447468 ) ) ( not ( = ?auto_1447463 ?auto_1447469 ) ) ( not ( = ?auto_1447463 ?auto_1447475 ) ) ( not ( = ?auto_1447462 ?auto_1447464 ) ) ( not ( = ?auto_1447462 ?auto_1447465 ) ) ( not ( = ?auto_1447462 ?auto_1447466 ) ) ( not ( = ?auto_1447462 ?auto_1447467 ) ) ( not ( = ?auto_1447462 ?auto_1447468 ) ) ( not ( = ?auto_1447462 ?auto_1447469 ) ) ( not ( = ?auto_1447462 ?auto_1447475 ) ) ( not ( = ?auto_1447464 ?auto_1447465 ) ) ( not ( = ?auto_1447464 ?auto_1447466 ) ) ( not ( = ?auto_1447464 ?auto_1447467 ) ) ( not ( = ?auto_1447464 ?auto_1447468 ) ) ( not ( = ?auto_1447464 ?auto_1447469 ) ) ( not ( = ?auto_1447464 ?auto_1447475 ) ) ( not ( = ?auto_1447465 ?auto_1447466 ) ) ( not ( = ?auto_1447465 ?auto_1447467 ) ) ( not ( = ?auto_1447465 ?auto_1447468 ) ) ( not ( = ?auto_1447465 ?auto_1447469 ) ) ( not ( = ?auto_1447465 ?auto_1447475 ) ) ( not ( = ?auto_1447466 ?auto_1447467 ) ) ( not ( = ?auto_1447466 ?auto_1447468 ) ) ( not ( = ?auto_1447466 ?auto_1447469 ) ) ( not ( = ?auto_1447466 ?auto_1447475 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1447467 ?auto_1447468 ?auto_1447469 )
      ( MAKE-10CRATE-VERIFY ?auto_1447459 ?auto_1447460 ?auto_1447461 ?auto_1447463 ?auto_1447462 ?auto_1447464 ?auto_1447465 ?auto_1447466 ?auto_1447467 ?auto_1447468 ?auto_1447469 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1454743 - SURFACE
      ?auto_1454744 - SURFACE
      ?auto_1454745 - SURFACE
      ?auto_1454747 - SURFACE
      ?auto_1454746 - SURFACE
      ?auto_1454748 - SURFACE
      ?auto_1454749 - SURFACE
      ?auto_1454750 - SURFACE
      ?auto_1454751 - SURFACE
      ?auto_1454752 - SURFACE
      ?auto_1454753 - SURFACE
      ?auto_1454754 - SURFACE
    )
    :vars
    (
      ?auto_1454756 - HOIST
      ?auto_1454755 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1454756 ?auto_1454755 ) ( SURFACE-AT ?auto_1454753 ?auto_1454755 ) ( CLEAR ?auto_1454753 ) ( LIFTING ?auto_1454756 ?auto_1454754 ) ( IS-CRATE ?auto_1454754 ) ( not ( = ?auto_1454753 ?auto_1454754 ) ) ( ON ?auto_1454744 ?auto_1454743 ) ( ON ?auto_1454745 ?auto_1454744 ) ( ON ?auto_1454747 ?auto_1454745 ) ( ON ?auto_1454746 ?auto_1454747 ) ( ON ?auto_1454748 ?auto_1454746 ) ( ON ?auto_1454749 ?auto_1454748 ) ( ON ?auto_1454750 ?auto_1454749 ) ( ON ?auto_1454751 ?auto_1454750 ) ( ON ?auto_1454752 ?auto_1454751 ) ( ON ?auto_1454753 ?auto_1454752 ) ( not ( = ?auto_1454743 ?auto_1454744 ) ) ( not ( = ?auto_1454743 ?auto_1454745 ) ) ( not ( = ?auto_1454743 ?auto_1454747 ) ) ( not ( = ?auto_1454743 ?auto_1454746 ) ) ( not ( = ?auto_1454743 ?auto_1454748 ) ) ( not ( = ?auto_1454743 ?auto_1454749 ) ) ( not ( = ?auto_1454743 ?auto_1454750 ) ) ( not ( = ?auto_1454743 ?auto_1454751 ) ) ( not ( = ?auto_1454743 ?auto_1454752 ) ) ( not ( = ?auto_1454743 ?auto_1454753 ) ) ( not ( = ?auto_1454743 ?auto_1454754 ) ) ( not ( = ?auto_1454744 ?auto_1454745 ) ) ( not ( = ?auto_1454744 ?auto_1454747 ) ) ( not ( = ?auto_1454744 ?auto_1454746 ) ) ( not ( = ?auto_1454744 ?auto_1454748 ) ) ( not ( = ?auto_1454744 ?auto_1454749 ) ) ( not ( = ?auto_1454744 ?auto_1454750 ) ) ( not ( = ?auto_1454744 ?auto_1454751 ) ) ( not ( = ?auto_1454744 ?auto_1454752 ) ) ( not ( = ?auto_1454744 ?auto_1454753 ) ) ( not ( = ?auto_1454744 ?auto_1454754 ) ) ( not ( = ?auto_1454745 ?auto_1454747 ) ) ( not ( = ?auto_1454745 ?auto_1454746 ) ) ( not ( = ?auto_1454745 ?auto_1454748 ) ) ( not ( = ?auto_1454745 ?auto_1454749 ) ) ( not ( = ?auto_1454745 ?auto_1454750 ) ) ( not ( = ?auto_1454745 ?auto_1454751 ) ) ( not ( = ?auto_1454745 ?auto_1454752 ) ) ( not ( = ?auto_1454745 ?auto_1454753 ) ) ( not ( = ?auto_1454745 ?auto_1454754 ) ) ( not ( = ?auto_1454747 ?auto_1454746 ) ) ( not ( = ?auto_1454747 ?auto_1454748 ) ) ( not ( = ?auto_1454747 ?auto_1454749 ) ) ( not ( = ?auto_1454747 ?auto_1454750 ) ) ( not ( = ?auto_1454747 ?auto_1454751 ) ) ( not ( = ?auto_1454747 ?auto_1454752 ) ) ( not ( = ?auto_1454747 ?auto_1454753 ) ) ( not ( = ?auto_1454747 ?auto_1454754 ) ) ( not ( = ?auto_1454746 ?auto_1454748 ) ) ( not ( = ?auto_1454746 ?auto_1454749 ) ) ( not ( = ?auto_1454746 ?auto_1454750 ) ) ( not ( = ?auto_1454746 ?auto_1454751 ) ) ( not ( = ?auto_1454746 ?auto_1454752 ) ) ( not ( = ?auto_1454746 ?auto_1454753 ) ) ( not ( = ?auto_1454746 ?auto_1454754 ) ) ( not ( = ?auto_1454748 ?auto_1454749 ) ) ( not ( = ?auto_1454748 ?auto_1454750 ) ) ( not ( = ?auto_1454748 ?auto_1454751 ) ) ( not ( = ?auto_1454748 ?auto_1454752 ) ) ( not ( = ?auto_1454748 ?auto_1454753 ) ) ( not ( = ?auto_1454748 ?auto_1454754 ) ) ( not ( = ?auto_1454749 ?auto_1454750 ) ) ( not ( = ?auto_1454749 ?auto_1454751 ) ) ( not ( = ?auto_1454749 ?auto_1454752 ) ) ( not ( = ?auto_1454749 ?auto_1454753 ) ) ( not ( = ?auto_1454749 ?auto_1454754 ) ) ( not ( = ?auto_1454750 ?auto_1454751 ) ) ( not ( = ?auto_1454750 ?auto_1454752 ) ) ( not ( = ?auto_1454750 ?auto_1454753 ) ) ( not ( = ?auto_1454750 ?auto_1454754 ) ) ( not ( = ?auto_1454751 ?auto_1454752 ) ) ( not ( = ?auto_1454751 ?auto_1454753 ) ) ( not ( = ?auto_1454751 ?auto_1454754 ) ) ( not ( = ?auto_1454752 ?auto_1454753 ) ) ( not ( = ?auto_1454752 ?auto_1454754 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1454753 ?auto_1454754 )
      ( MAKE-11CRATE-VERIFY ?auto_1454743 ?auto_1454744 ?auto_1454745 ?auto_1454747 ?auto_1454746 ?auto_1454748 ?auto_1454749 ?auto_1454750 ?auto_1454751 ?auto_1454752 ?auto_1454753 ?auto_1454754 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1454852 - SURFACE
      ?auto_1454853 - SURFACE
      ?auto_1454854 - SURFACE
      ?auto_1454856 - SURFACE
      ?auto_1454855 - SURFACE
      ?auto_1454857 - SURFACE
      ?auto_1454858 - SURFACE
      ?auto_1454859 - SURFACE
      ?auto_1454860 - SURFACE
      ?auto_1454861 - SURFACE
      ?auto_1454862 - SURFACE
      ?auto_1454863 - SURFACE
    )
    :vars
    (
      ?auto_1454864 - HOIST
      ?auto_1454866 - PLACE
      ?auto_1454865 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1454864 ?auto_1454866 ) ( SURFACE-AT ?auto_1454862 ?auto_1454866 ) ( CLEAR ?auto_1454862 ) ( IS-CRATE ?auto_1454863 ) ( not ( = ?auto_1454862 ?auto_1454863 ) ) ( TRUCK-AT ?auto_1454865 ?auto_1454866 ) ( AVAILABLE ?auto_1454864 ) ( IN ?auto_1454863 ?auto_1454865 ) ( ON ?auto_1454862 ?auto_1454861 ) ( not ( = ?auto_1454861 ?auto_1454862 ) ) ( not ( = ?auto_1454861 ?auto_1454863 ) ) ( ON ?auto_1454853 ?auto_1454852 ) ( ON ?auto_1454854 ?auto_1454853 ) ( ON ?auto_1454856 ?auto_1454854 ) ( ON ?auto_1454855 ?auto_1454856 ) ( ON ?auto_1454857 ?auto_1454855 ) ( ON ?auto_1454858 ?auto_1454857 ) ( ON ?auto_1454859 ?auto_1454858 ) ( ON ?auto_1454860 ?auto_1454859 ) ( ON ?auto_1454861 ?auto_1454860 ) ( not ( = ?auto_1454852 ?auto_1454853 ) ) ( not ( = ?auto_1454852 ?auto_1454854 ) ) ( not ( = ?auto_1454852 ?auto_1454856 ) ) ( not ( = ?auto_1454852 ?auto_1454855 ) ) ( not ( = ?auto_1454852 ?auto_1454857 ) ) ( not ( = ?auto_1454852 ?auto_1454858 ) ) ( not ( = ?auto_1454852 ?auto_1454859 ) ) ( not ( = ?auto_1454852 ?auto_1454860 ) ) ( not ( = ?auto_1454852 ?auto_1454861 ) ) ( not ( = ?auto_1454852 ?auto_1454862 ) ) ( not ( = ?auto_1454852 ?auto_1454863 ) ) ( not ( = ?auto_1454853 ?auto_1454854 ) ) ( not ( = ?auto_1454853 ?auto_1454856 ) ) ( not ( = ?auto_1454853 ?auto_1454855 ) ) ( not ( = ?auto_1454853 ?auto_1454857 ) ) ( not ( = ?auto_1454853 ?auto_1454858 ) ) ( not ( = ?auto_1454853 ?auto_1454859 ) ) ( not ( = ?auto_1454853 ?auto_1454860 ) ) ( not ( = ?auto_1454853 ?auto_1454861 ) ) ( not ( = ?auto_1454853 ?auto_1454862 ) ) ( not ( = ?auto_1454853 ?auto_1454863 ) ) ( not ( = ?auto_1454854 ?auto_1454856 ) ) ( not ( = ?auto_1454854 ?auto_1454855 ) ) ( not ( = ?auto_1454854 ?auto_1454857 ) ) ( not ( = ?auto_1454854 ?auto_1454858 ) ) ( not ( = ?auto_1454854 ?auto_1454859 ) ) ( not ( = ?auto_1454854 ?auto_1454860 ) ) ( not ( = ?auto_1454854 ?auto_1454861 ) ) ( not ( = ?auto_1454854 ?auto_1454862 ) ) ( not ( = ?auto_1454854 ?auto_1454863 ) ) ( not ( = ?auto_1454856 ?auto_1454855 ) ) ( not ( = ?auto_1454856 ?auto_1454857 ) ) ( not ( = ?auto_1454856 ?auto_1454858 ) ) ( not ( = ?auto_1454856 ?auto_1454859 ) ) ( not ( = ?auto_1454856 ?auto_1454860 ) ) ( not ( = ?auto_1454856 ?auto_1454861 ) ) ( not ( = ?auto_1454856 ?auto_1454862 ) ) ( not ( = ?auto_1454856 ?auto_1454863 ) ) ( not ( = ?auto_1454855 ?auto_1454857 ) ) ( not ( = ?auto_1454855 ?auto_1454858 ) ) ( not ( = ?auto_1454855 ?auto_1454859 ) ) ( not ( = ?auto_1454855 ?auto_1454860 ) ) ( not ( = ?auto_1454855 ?auto_1454861 ) ) ( not ( = ?auto_1454855 ?auto_1454862 ) ) ( not ( = ?auto_1454855 ?auto_1454863 ) ) ( not ( = ?auto_1454857 ?auto_1454858 ) ) ( not ( = ?auto_1454857 ?auto_1454859 ) ) ( not ( = ?auto_1454857 ?auto_1454860 ) ) ( not ( = ?auto_1454857 ?auto_1454861 ) ) ( not ( = ?auto_1454857 ?auto_1454862 ) ) ( not ( = ?auto_1454857 ?auto_1454863 ) ) ( not ( = ?auto_1454858 ?auto_1454859 ) ) ( not ( = ?auto_1454858 ?auto_1454860 ) ) ( not ( = ?auto_1454858 ?auto_1454861 ) ) ( not ( = ?auto_1454858 ?auto_1454862 ) ) ( not ( = ?auto_1454858 ?auto_1454863 ) ) ( not ( = ?auto_1454859 ?auto_1454860 ) ) ( not ( = ?auto_1454859 ?auto_1454861 ) ) ( not ( = ?auto_1454859 ?auto_1454862 ) ) ( not ( = ?auto_1454859 ?auto_1454863 ) ) ( not ( = ?auto_1454860 ?auto_1454861 ) ) ( not ( = ?auto_1454860 ?auto_1454862 ) ) ( not ( = ?auto_1454860 ?auto_1454863 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1454861 ?auto_1454862 ?auto_1454863 )
      ( MAKE-11CRATE-VERIFY ?auto_1454852 ?auto_1454853 ?auto_1454854 ?auto_1454856 ?auto_1454855 ?auto_1454857 ?auto_1454858 ?auto_1454859 ?auto_1454860 ?auto_1454861 ?auto_1454862 ?auto_1454863 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1454973 - SURFACE
      ?auto_1454974 - SURFACE
      ?auto_1454975 - SURFACE
      ?auto_1454977 - SURFACE
      ?auto_1454976 - SURFACE
      ?auto_1454978 - SURFACE
      ?auto_1454979 - SURFACE
      ?auto_1454980 - SURFACE
      ?auto_1454981 - SURFACE
      ?auto_1454982 - SURFACE
      ?auto_1454983 - SURFACE
      ?auto_1454984 - SURFACE
    )
    :vars
    (
      ?auto_1454986 - HOIST
      ?auto_1454988 - PLACE
      ?auto_1454987 - TRUCK
      ?auto_1454985 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1454986 ?auto_1454988 ) ( SURFACE-AT ?auto_1454983 ?auto_1454988 ) ( CLEAR ?auto_1454983 ) ( IS-CRATE ?auto_1454984 ) ( not ( = ?auto_1454983 ?auto_1454984 ) ) ( AVAILABLE ?auto_1454986 ) ( IN ?auto_1454984 ?auto_1454987 ) ( ON ?auto_1454983 ?auto_1454982 ) ( not ( = ?auto_1454982 ?auto_1454983 ) ) ( not ( = ?auto_1454982 ?auto_1454984 ) ) ( TRUCK-AT ?auto_1454987 ?auto_1454985 ) ( not ( = ?auto_1454985 ?auto_1454988 ) ) ( ON ?auto_1454974 ?auto_1454973 ) ( ON ?auto_1454975 ?auto_1454974 ) ( ON ?auto_1454977 ?auto_1454975 ) ( ON ?auto_1454976 ?auto_1454977 ) ( ON ?auto_1454978 ?auto_1454976 ) ( ON ?auto_1454979 ?auto_1454978 ) ( ON ?auto_1454980 ?auto_1454979 ) ( ON ?auto_1454981 ?auto_1454980 ) ( ON ?auto_1454982 ?auto_1454981 ) ( not ( = ?auto_1454973 ?auto_1454974 ) ) ( not ( = ?auto_1454973 ?auto_1454975 ) ) ( not ( = ?auto_1454973 ?auto_1454977 ) ) ( not ( = ?auto_1454973 ?auto_1454976 ) ) ( not ( = ?auto_1454973 ?auto_1454978 ) ) ( not ( = ?auto_1454973 ?auto_1454979 ) ) ( not ( = ?auto_1454973 ?auto_1454980 ) ) ( not ( = ?auto_1454973 ?auto_1454981 ) ) ( not ( = ?auto_1454973 ?auto_1454982 ) ) ( not ( = ?auto_1454973 ?auto_1454983 ) ) ( not ( = ?auto_1454973 ?auto_1454984 ) ) ( not ( = ?auto_1454974 ?auto_1454975 ) ) ( not ( = ?auto_1454974 ?auto_1454977 ) ) ( not ( = ?auto_1454974 ?auto_1454976 ) ) ( not ( = ?auto_1454974 ?auto_1454978 ) ) ( not ( = ?auto_1454974 ?auto_1454979 ) ) ( not ( = ?auto_1454974 ?auto_1454980 ) ) ( not ( = ?auto_1454974 ?auto_1454981 ) ) ( not ( = ?auto_1454974 ?auto_1454982 ) ) ( not ( = ?auto_1454974 ?auto_1454983 ) ) ( not ( = ?auto_1454974 ?auto_1454984 ) ) ( not ( = ?auto_1454975 ?auto_1454977 ) ) ( not ( = ?auto_1454975 ?auto_1454976 ) ) ( not ( = ?auto_1454975 ?auto_1454978 ) ) ( not ( = ?auto_1454975 ?auto_1454979 ) ) ( not ( = ?auto_1454975 ?auto_1454980 ) ) ( not ( = ?auto_1454975 ?auto_1454981 ) ) ( not ( = ?auto_1454975 ?auto_1454982 ) ) ( not ( = ?auto_1454975 ?auto_1454983 ) ) ( not ( = ?auto_1454975 ?auto_1454984 ) ) ( not ( = ?auto_1454977 ?auto_1454976 ) ) ( not ( = ?auto_1454977 ?auto_1454978 ) ) ( not ( = ?auto_1454977 ?auto_1454979 ) ) ( not ( = ?auto_1454977 ?auto_1454980 ) ) ( not ( = ?auto_1454977 ?auto_1454981 ) ) ( not ( = ?auto_1454977 ?auto_1454982 ) ) ( not ( = ?auto_1454977 ?auto_1454983 ) ) ( not ( = ?auto_1454977 ?auto_1454984 ) ) ( not ( = ?auto_1454976 ?auto_1454978 ) ) ( not ( = ?auto_1454976 ?auto_1454979 ) ) ( not ( = ?auto_1454976 ?auto_1454980 ) ) ( not ( = ?auto_1454976 ?auto_1454981 ) ) ( not ( = ?auto_1454976 ?auto_1454982 ) ) ( not ( = ?auto_1454976 ?auto_1454983 ) ) ( not ( = ?auto_1454976 ?auto_1454984 ) ) ( not ( = ?auto_1454978 ?auto_1454979 ) ) ( not ( = ?auto_1454978 ?auto_1454980 ) ) ( not ( = ?auto_1454978 ?auto_1454981 ) ) ( not ( = ?auto_1454978 ?auto_1454982 ) ) ( not ( = ?auto_1454978 ?auto_1454983 ) ) ( not ( = ?auto_1454978 ?auto_1454984 ) ) ( not ( = ?auto_1454979 ?auto_1454980 ) ) ( not ( = ?auto_1454979 ?auto_1454981 ) ) ( not ( = ?auto_1454979 ?auto_1454982 ) ) ( not ( = ?auto_1454979 ?auto_1454983 ) ) ( not ( = ?auto_1454979 ?auto_1454984 ) ) ( not ( = ?auto_1454980 ?auto_1454981 ) ) ( not ( = ?auto_1454980 ?auto_1454982 ) ) ( not ( = ?auto_1454980 ?auto_1454983 ) ) ( not ( = ?auto_1454980 ?auto_1454984 ) ) ( not ( = ?auto_1454981 ?auto_1454982 ) ) ( not ( = ?auto_1454981 ?auto_1454983 ) ) ( not ( = ?auto_1454981 ?auto_1454984 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1454982 ?auto_1454983 ?auto_1454984 )
      ( MAKE-11CRATE-VERIFY ?auto_1454973 ?auto_1454974 ?auto_1454975 ?auto_1454977 ?auto_1454976 ?auto_1454978 ?auto_1454979 ?auto_1454980 ?auto_1454981 ?auto_1454982 ?auto_1454983 ?auto_1454984 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455105 - SURFACE
      ?auto_1455106 - SURFACE
      ?auto_1455107 - SURFACE
      ?auto_1455109 - SURFACE
      ?auto_1455108 - SURFACE
      ?auto_1455110 - SURFACE
      ?auto_1455111 - SURFACE
      ?auto_1455112 - SURFACE
      ?auto_1455113 - SURFACE
      ?auto_1455114 - SURFACE
      ?auto_1455115 - SURFACE
      ?auto_1455116 - SURFACE
    )
    :vars
    (
      ?auto_1455119 - HOIST
      ?auto_1455117 - PLACE
      ?auto_1455120 - TRUCK
      ?auto_1455118 - PLACE
      ?auto_1455121 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455119 ?auto_1455117 ) ( SURFACE-AT ?auto_1455115 ?auto_1455117 ) ( CLEAR ?auto_1455115 ) ( IS-CRATE ?auto_1455116 ) ( not ( = ?auto_1455115 ?auto_1455116 ) ) ( AVAILABLE ?auto_1455119 ) ( ON ?auto_1455115 ?auto_1455114 ) ( not ( = ?auto_1455114 ?auto_1455115 ) ) ( not ( = ?auto_1455114 ?auto_1455116 ) ) ( TRUCK-AT ?auto_1455120 ?auto_1455118 ) ( not ( = ?auto_1455118 ?auto_1455117 ) ) ( HOIST-AT ?auto_1455121 ?auto_1455118 ) ( LIFTING ?auto_1455121 ?auto_1455116 ) ( not ( = ?auto_1455119 ?auto_1455121 ) ) ( ON ?auto_1455106 ?auto_1455105 ) ( ON ?auto_1455107 ?auto_1455106 ) ( ON ?auto_1455109 ?auto_1455107 ) ( ON ?auto_1455108 ?auto_1455109 ) ( ON ?auto_1455110 ?auto_1455108 ) ( ON ?auto_1455111 ?auto_1455110 ) ( ON ?auto_1455112 ?auto_1455111 ) ( ON ?auto_1455113 ?auto_1455112 ) ( ON ?auto_1455114 ?auto_1455113 ) ( not ( = ?auto_1455105 ?auto_1455106 ) ) ( not ( = ?auto_1455105 ?auto_1455107 ) ) ( not ( = ?auto_1455105 ?auto_1455109 ) ) ( not ( = ?auto_1455105 ?auto_1455108 ) ) ( not ( = ?auto_1455105 ?auto_1455110 ) ) ( not ( = ?auto_1455105 ?auto_1455111 ) ) ( not ( = ?auto_1455105 ?auto_1455112 ) ) ( not ( = ?auto_1455105 ?auto_1455113 ) ) ( not ( = ?auto_1455105 ?auto_1455114 ) ) ( not ( = ?auto_1455105 ?auto_1455115 ) ) ( not ( = ?auto_1455105 ?auto_1455116 ) ) ( not ( = ?auto_1455106 ?auto_1455107 ) ) ( not ( = ?auto_1455106 ?auto_1455109 ) ) ( not ( = ?auto_1455106 ?auto_1455108 ) ) ( not ( = ?auto_1455106 ?auto_1455110 ) ) ( not ( = ?auto_1455106 ?auto_1455111 ) ) ( not ( = ?auto_1455106 ?auto_1455112 ) ) ( not ( = ?auto_1455106 ?auto_1455113 ) ) ( not ( = ?auto_1455106 ?auto_1455114 ) ) ( not ( = ?auto_1455106 ?auto_1455115 ) ) ( not ( = ?auto_1455106 ?auto_1455116 ) ) ( not ( = ?auto_1455107 ?auto_1455109 ) ) ( not ( = ?auto_1455107 ?auto_1455108 ) ) ( not ( = ?auto_1455107 ?auto_1455110 ) ) ( not ( = ?auto_1455107 ?auto_1455111 ) ) ( not ( = ?auto_1455107 ?auto_1455112 ) ) ( not ( = ?auto_1455107 ?auto_1455113 ) ) ( not ( = ?auto_1455107 ?auto_1455114 ) ) ( not ( = ?auto_1455107 ?auto_1455115 ) ) ( not ( = ?auto_1455107 ?auto_1455116 ) ) ( not ( = ?auto_1455109 ?auto_1455108 ) ) ( not ( = ?auto_1455109 ?auto_1455110 ) ) ( not ( = ?auto_1455109 ?auto_1455111 ) ) ( not ( = ?auto_1455109 ?auto_1455112 ) ) ( not ( = ?auto_1455109 ?auto_1455113 ) ) ( not ( = ?auto_1455109 ?auto_1455114 ) ) ( not ( = ?auto_1455109 ?auto_1455115 ) ) ( not ( = ?auto_1455109 ?auto_1455116 ) ) ( not ( = ?auto_1455108 ?auto_1455110 ) ) ( not ( = ?auto_1455108 ?auto_1455111 ) ) ( not ( = ?auto_1455108 ?auto_1455112 ) ) ( not ( = ?auto_1455108 ?auto_1455113 ) ) ( not ( = ?auto_1455108 ?auto_1455114 ) ) ( not ( = ?auto_1455108 ?auto_1455115 ) ) ( not ( = ?auto_1455108 ?auto_1455116 ) ) ( not ( = ?auto_1455110 ?auto_1455111 ) ) ( not ( = ?auto_1455110 ?auto_1455112 ) ) ( not ( = ?auto_1455110 ?auto_1455113 ) ) ( not ( = ?auto_1455110 ?auto_1455114 ) ) ( not ( = ?auto_1455110 ?auto_1455115 ) ) ( not ( = ?auto_1455110 ?auto_1455116 ) ) ( not ( = ?auto_1455111 ?auto_1455112 ) ) ( not ( = ?auto_1455111 ?auto_1455113 ) ) ( not ( = ?auto_1455111 ?auto_1455114 ) ) ( not ( = ?auto_1455111 ?auto_1455115 ) ) ( not ( = ?auto_1455111 ?auto_1455116 ) ) ( not ( = ?auto_1455112 ?auto_1455113 ) ) ( not ( = ?auto_1455112 ?auto_1455114 ) ) ( not ( = ?auto_1455112 ?auto_1455115 ) ) ( not ( = ?auto_1455112 ?auto_1455116 ) ) ( not ( = ?auto_1455113 ?auto_1455114 ) ) ( not ( = ?auto_1455113 ?auto_1455115 ) ) ( not ( = ?auto_1455113 ?auto_1455116 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455114 ?auto_1455115 ?auto_1455116 )
      ( MAKE-11CRATE-VERIFY ?auto_1455105 ?auto_1455106 ?auto_1455107 ?auto_1455109 ?auto_1455108 ?auto_1455110 ?auto_1455111 ?auto_1455112 ?auto_1455113 ?auto_1455114 ?auto_1455115 ?auto_1455116 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455248 - SURFACE
      ?auto_1455249 - SURFACE
      ?auto_1455250 - SURFACE
      ?auto_1455252 - SURFACE
      ?auto_1455251 - SURFACE
      ?auto_1455253 - SURFACE
      ?auto_1455254 - SURFACE
      ?auto_1455255 - SURFACE
      ?auto_1455256 - SURFACE
      ?auto_1455257 - SURFACE
      ?auto_1455258 - SURFACE
      ?auto_1455259 - SURFACE
    )
    :vars
    (
      ?auto_1455263 - HOIST
      ?auto_1455262 - PLACE
      ?auto_1455264 - TRUCK
      ?auto_1455260 - PLACE
      ?auto_1455261 - HOIST
      ?auto_1455265 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455263 ?auto_1455262 ) ( SURFACE-AT ?auto_1455258 ?auto_1455262 ) ( CLEAR ?auto_1455258 ) ( IS-CRATE ?auto_1455259 ) ( not ( = ?auto_1455258 ?auto_1455259 ) ) ( AVAILABLE ?auto_1455263 ) ( ON ?auto_1455258 ?auto_1455257 ) ( not ( = ?auto_1455257 ?auto_1455258 ) ) ( not ( = ?auto_1455257 ?auto_1455259 ) ) ( TRUCK-AT ?auto_1455264 ?auto_1455260 ) ( not ( = ?auto_1455260 ?auto_1455262 ) ) ( HOIST-AT ?auto_1455261 ?auto_1455260 ) ( not ( = ?auto_1455263 ?auto_1455261 ) ) ( AVAILABLE ?auto_1455261 ) ( SURFACE-AT ?auto_1455259 ?auto_1455260 ) ( ON ?auto_1455259 ?auto_1455265 ) ( CLEAR ?auto_1455259 ) ( not ( = ?auto_1455258 ?auto_1455265 ) ) ( not ( = ?auto_1455259 ?auto_1455265 ) ) ( not ( = ?auto_1455257 ?auto_1455265 ) ) ( ON ?auto_1455249 ?auto_1455248 ) ( ON ?auto_1455250 ?auto_1455249 ) ( ON ?auto_1455252 ?auto_1455250 ) ( ON ?auto_1455251 ?auto_1455252 ) ( ON ?auto_1455253 ?auto_1455251 ) ( ON ?auto_1455254 ?auto_1455253 ) ( ON ?auto_1455255 ?auto_1455254 ) ( ON ?auto_1455256 ?auto_1455255 ) ( ON ?auto_1455257 ?auto_1455256 ) ( not ( = ?auto_1455248 ?auto_1455249 ) ) ( not ( = ?auto_1455248 ?auto_1455250 ) ) ( not ( = ?auto_1455248 ?auto_1455252 ) ) ( not ( = ?auto_1455248 ?auto_1455251 ) ) ( not ( = ?auto_1455248 ?auto_1455253 ) ) ( not ( = ?auto_1455248 ?auto_1455254 ) ) ( not ( = ?auto_1455248 ?auto_1455255 ) ) ( not ( = ?auto_1455248 ?auto_1455256 ) ) ( not ( = ?auto_1455248 ?auto_1455257 ) ) ( not ( = ?auto_1455248 ?auto_1455258 ) ) ( not ( = ?auto_1455248 ?auto_1455259 ) ) ( not ( = ?auto_1455248 ?auto_1455265 ) ) ( not ( = ?auto_1455249 ?auto_1455250 ) ) ( not ( = ?auto_1455249 ?auto_1455252 ) ) ( not ( = ?auto_1455249 ?auto_1455251 ) ) ( not ( = ?auto_1455249 ?auto_1455253 ) ) ( not ( = ?auto_1455249 ?auto_1455254 ) ) ( not ( = ?auto_1455249 ?auto_1455255 ) ) ( not ( = ?auto_1455249 ?auto_1455256 ) ) ( not ( = ?auto_1455249 ?auto_1455257 ) ) ( not ( = ?auto_1455249 ?auto_1455258 ) ) ( not ( = ?auto_1455249 ?auto_1455259 ) ) ( not ( = ?auto_1455249 ?auto_1455265 ) ) ( not ( = ?auto_1455250 ?auto_1455252 ) ) ( not ( = ?auto_1455250 ?auto_1455251 ) ) ( not ( = ?auto_1455250 ?auto_1455253 ) ) ( not ( = ?auto_1455250 ?auto_1455254 ) ) ( not ( = ?auto_1455250 ?auto_1455255 ) ) ( not ( = ?auto_1455250 ?auto_1455256 ) ) ( not ( = ?auto_1455250 ?auto_1455257 ) ) ( not ( = ?auto_1455250 ?auto_1455258 ) ) ( not ( = ?auto_1455250 ?auto_1455259 ) ) ( not ( = ?auto_1455250 ?auto_1455265 ) ) ( not ( = ?auto_1455252 ?auto_1455251 ) ) ( not ( = ?auto_1455252 ?auto_1455253 ) ) ( not ( = ?auto_1455252 ?auto_1455254 ) ) ( not ( = ?auto_1455252 ?auto_1455255 ) ) ( not ( = ?auto_1455252 ?auto_1455256 ) ) ( not ( = ?auto_1455252 ?auto_1455257 ) ) ( not ( = ?auto_1455252 ?auto_1455258 ) ) ( not ( = ?auto_1455252 ?auto_1455259 ) ) ( not ( = ?auto_1455252 ?auto_1455265 ) ) ( not ( = ?auto_1455251 ?auto_1455253 ) ) ( not ( = ?auto_1455251 ?auto_1455254 ) ) ( not ( = ?auto_1455251 ?auto_1455255 ) ) ( not ( = ?auto_1455251 ?auto_1455256 ) ) ( not ( = ?auto_1455251 ?auto_1455257 ) ) ( not ( = ?auto_1455251 ?auto_1455258 ) ) ( not ( = ?auto_1455251 ?auto_1455259 ) ) ( not ( = ?auto_1455251 ?auto_1455265 ) ) ( not ( = ?auto_1455253 ?auto_1455254 ) ) ( not ( = ?auto_1455253 ?auto_1455255 ) ) ( not ( = ?auto_1455253 ?auto_1455256 ) ) ( not ( = ?auto_1455253 ?auto_1455257 ) ) ( not ( = ?auto_1455253 ?auto_1455258 ) ) ( not ( = ?auto_1455253 ?auto_1455259 ) ) ( not ( = ?auto_1455253 ?auto_1455265 ) ) ( not ( = ?auto_1455254 ?auto_1455255 ) ) ( not ( = ?auto_1455254 ?auto_1455256 ) ) ( not ( = ?auto_1455254 ?auto_1455257 ) ) ( not ( = ?auto_1455254 ?auto_1455258 ) ) ( not ( = ?auto_1455254 ?auto_1455259 ) ) ( not ( = ?auto_1455254 ?auto_1455265 ) ) ( not ( = ?auto_1455255 ?auto_1455256 ) ) ( not ( = ?auto_1455255 ?auto_1455257 ) ) ( not ( = ?auto_1455255 ?auto_1455258 ) ) ( not ( = ?auto_1455255 ?auto_1455259 ) ) ( not ( = ?auto_1455255 ?auto_1455265 ) ) ( not ( = ?auto_1455256 ?auto_1455257 ) ) ( not ( = ?auto_1455256 ?auto_1455258 ) ) ( not ( = ?auto_1455256 ?auto_1455259 ) ) ( not ( = ?auto_1455256 ?auto_1455265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455257 ?auto_1455258 ?auto_1455259 )
      ( MAKE-11CRATE-VERIFY ?auto_1455248 ?auto_1455249 ?auto_1455250 ?auto_1455252 ?auto_1455251 ?auto_1455253 ?auto_1455254 ?auto_1455255 ?auto_1455256 ?auto_1455257 ?auto_1455258 ?auto_1455259 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455392 - SURFACE
      ?auto_1455393 - SURFACE
      ?auto_1455394 - SURFACE
      ?auto_1455396 - SURFACE
      ?auto_1455395 - SURFACE
      ?auto_1455397 - SURFACE
      ?auto_1455398 - SURFACE
      ?auto_1455399 - SURFACE
      ?auto_1455400 - SURFACE
      ?auto_1455401 - SURFACE
      ?auto_1455402 - SURFACE
      ?auto_1455403 - SURFACE
    )
    :vars
    (
      ?auto_1455406 - HOIST
      ?auto_1455409 - PLACE
      ?auto_1455405 - PLACE
      ?auto_1455408 - HOIST
      ?auto_1455404 - SURFACE
      ?auto_1455407 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455406 ?auto_1455409 ) ( SURFACE-AT ?auto_1455402 ?auto_1455409 ) ( CLEAR ?auto_1455402 ) ( IS-CRATE ?auto_1455403 ) ( not ( = ?auto_1455402 ?auto_1455403 ) ) ( AVAILABLE ?auto_1455406 ) ( ON ?auto_1455402 ?auto_1455401 ) ( not ( = ?auto_1455401 ?auto_1455402 ) ) ( not ( = ?auto_1455401 ?auto_1455403 ) ) ( not ( = ?auto_1455405 ?auto_1455409 ) ) ( HOIST-AT ?auto_1455408 ?auto_1455405 ) ( not ( = ?auto_1455406 ?auto_1455408 ) ) ( AVAILABLE ?auto_1455408 ) ( SURFACE-AT ?auto_1455403 ?auto_1455405 ) ( ON ?auto_1455403 ?auto_1455404 ) ( CLEAR ?auto_1455403 ) ( not ( = ?auto_1455402 ?auto_1455404 ) ) ( not ( = ?auto_1455403 ?auto_1455404 ) ) ( not ( = ?auto_1455401 ?auto_1455404 ) ) ( TRUCK-AT ?auto_1455407 ?auto_1455409 ) ( ON ?auto_1455393 ?auto_1455392 ) ( ON ?auto_1455394 ?auto_1455393 ) ( ON ?auto_1455396 ?auto_1455394 ) ( ON ?auto_1455395 ?auto_1455396 ) ( ON ?auto_1455397 ?auto_1455395 ) ( ON ?auto_1455398 ?auto_1455397 ) ( ON ?auto_1455399 ?auto_1455398 ) ( ON ?auto_1455400 ?auto_1455399 ) ( ON ?auto_1455401 ?auto_1455400 ) ( not ( = ?auto_1455392 ?auto_1455393 ) ) ( not ( = ?auto_1455392 ?auto_1455394 ) ) ( not ( = ?auto_1455392 ?auto_1455396 ) ) ( not ( = ?auto_1455392 ?auto_1455395 ) ) ( not ( = ?auto_1455392 ?auto_1455397 ) ) ( not ( = ?auto_1455392 ?auto_1455398 ) ) ( not ( = ?auto_1455392 ?auto_1455399 ) ) ( not ( = ?auto_1455392 ?auto_1455400 ) ) ( not ( = ?auto_1455392 ?auto_1455401 ) ) ( not ( = ?auto_1455392 ?auto_1455402 ) ) ( not ( = ?auto_1455392 ?auto_1455403 ) ) ( not ( = ?auto_1455392 ?auto_1455404 ) ) ( not ( = ?auto_1455393 ?auto_1455394 ) ) ( not ( = ?auto_1455393 ?auto_1455396 ) ) ( not ( = ?auto_1455393 ?auto_1455395 ) ) ( not ( = ?auto_1455393 ?auto_1455397 ) ) ( not ( = ?auto_1455393 ?auto_1455398 ) ) ( not ( = ?auto_1455393 ?auto_1455399 ) ) ( not ( = ?auto_1455393 ?auto_1455400 ) ) ( not ( = ?auto_1455393 ?auto_1455401 ) ) ( not ( = ?auto_1455393 ?auto_1455402 ) ) ( not ( = ?auto_1455393 ?auto_1455403 ) ) ( not ( = ?auto_1455393 ?auto_1455404 ) ) ( not ( = ?auto_1455394 ?auto_1455396 ) ) ( not ( = ?auto_1455394 ?auto_1455395 ) ) ( not ( = ?auto_1455394 ?auto_1455397 ) ) ( not ( = ?auto_1455394 ?auto_1455398 ) ) ( not ( = ?auto_1455394 ?auto_1455399 ) ) ( not ( = ?auto_1455394 ?auto_1455400 ) ) ( not ( = ?auto_1455394 ?auto_1455401 ) ) ( not ( = ?auto_1455394 ?auto_1455402 ) ) ( not ( = ?auto_1455394 ?auto_1455403 ) ) ( not ( = ?auto_1455394 ?auto_1455404 ) ) ( not ( = ?auto_1455396 ?auto_1455395 ) ) ( not ( = ?auto_1455396 ?auto_1455397 ) ) ( not ( = ?auto_1455396 ?auto_1455398 ) ) ( not ( = ?auto_1455396 ?auto_1455399 ) ) ( not ( = ?auto_1455396 ?auto_1455400 ) ) ( not ( = ?auto_1455396 ?auto_1455401 ) ) ( not ( = ?auto_1455396 ?auto_1455402 ) ) ( not ( = ?auto_1455396 ?auto_1455403 ) ) ( not ( = ?auto_1455396 ?auto_1455404 ) ) ( not ( = ?auto_1455395 ?auto_1455397 ) ) ( not ( = ?auto_1455395 ?auto_1455398 ) ) ( not ( = ?auto_1455395 ?auto_1455399 ) ) ( not ( = ?auto_1455395 ?auto_1455400 ) ) ( not ( = ?auto_1455395 ?auto_1455401 ) ) ( not ( = ?auto_1455395 ?auto_1455402 ) ) ( not ( = ?auto_1455395 ?auto_1455403 ) ) ( not ( = ?auto_1455395 ?auto_1455404 ) ) ( not ( = ?auto_1455397 ?auto_1455398 ) ) ( not ( = ?auto_1455397 ?auto_1455399 ) ) ( not ( = ?auto_1455397 ?auto_1455400 ) ) ( not ( = ?auto_1455397 ?auto_1455401 ) ) ( not ( = ?auto_1455397 ?auto_1455402 ) ) ( not ( = ?auto_1455397 ?auto_1455403 ) ) ( not ( = ?auto_1455397 ?auto_1455404 ) ) ( not ( = ?auto_1455398 ?auto_1455399 ) ) ( not ( = ?auto_1455398 ?auto_1455400 ) ) ( not ( = ?auto_1455398 ?auto_1455401 ) ) ( not ( = ?auto_1455398 ?auto_1455402 ) ) ( not ( = ?auto_1455398 ?auto_1455403 ) ) ( not ( = ?auto_1455398 ?auto_1455404 ) ) ( not ( = ?auto_1455399 ?auto_1455400 ) ) ( not ( = ?auto_1455399 ?auto_1455401 ) ) ( not ( = ?auto_1455399 ?auto_1455402 ) ) ( not ( = ?auto_1455399 ?auto_1455403 ) ) ( not ( = ?auto_1455399 ?auto_1455404 ) ) ( not ( = ?auto_1455400 ?auto_1455401 ) ) ( not ( = ?auto_1455400 ?auto_1455402 ) ) ( not ( = ?auto_1455400 ?auto_1455403 ) ) ( not ( = ?auto_1455400 ?auto_1455404 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455401 ?auto_1455402 ?auto_1455403 )
      ( MAKE-11CRATE-VERIFY ?auto_1455392 ?auto_1455393 ?auto_1455394 ?auto_1455396 ?auto_1455395 ?auto_1455397 ?auto_1455398 ?auto_1455399 ?auto_1455400 ?auto_1455401 ?auto_1455402 ?auto_1455403 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455536 - SURFACE
      ?auto_1455537 - SURFACE
      ?auto_1455538 - SURFACE
      ?auto_1455540 - SURFACE
      ?auto_1455539 - SURFACE
      ?auto_1455541 - SURFACE
      ?auto_1455542 - SURFACE
      ?auto_1455543 - SURFACE
      ?auto_1455544 - SURFACE
      ?auto_1455545 - SURFACE
      ?auto_1455546 - SURFACE
      ?auto_1455547 - SURFACE
    )
    :vars
    (
      ?auto_1455551 - HOIST
      ?auto_1455549 - PLACE
      ?auto_1455552 - PLACE
      ?auto_1455548 - HOIST
      ?auto_1455553 - SURFACE
      ?auto_1455550 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455551 ?auto_1455549 ) ( IS-CRATE ?auto_1455547 ) ( not ( = ?auto_1455546 ?auto_1455547 ) ) ( not ( = ?auto_1455545 ?auto_1455546 ) ) ( not ( = ?auto_1455545 ?auto_1455547 ) ) ( not ( = ?auto_1455552 ?auto_1455549 ) ) ( HOIST-AT ?auto_1455548 ?auto_1455552 ) ( not ( = ?auto_1455551 ?auto_1455548 ) ) ( AVAILABLE ?auto_1455548 ) ( SURFACE-AT ?auto_1455547 ?auto_1455552 ) ( ON ?auto_1455547 ?auto_1455553 ) ( CLEAR ?auto_1455547 ) ( not ( = ?auto_1455546 ?auto_1455553 ) ) ( not ( = ?auto_1455547 ?auto_1455553 ) ) ( not ( = ?auto_1455545 ?auto_1455553 ) ) ( TRUCK-AT ?auto_1455550 ?auto_1455549 ) ( SURFACE-AT ?auto_1455545 ?auto_1455549 ) ( CLEAR ?auto_1455545 ) ( LIFTING ?auto_1455551 ?auto_1455546 ) ( IS-CRATE ?auto_1455546 ) ( ON ?auto_1455537 ?auto_1455536 ) ( ON ?auto_1455538 ?auto_1455537 ) ( ON ?auto_1455540 ?auto_1455538 ) ( ON ?auto_1455539 ?auto_1455540 ) ( ON ?auto_1455541 ?auto_1455539 ) ( ON ?auto_1455542 ?auto_1455541 ) ( ON ?auto_1455543 ?auto_1455542 ) ( ON ?auto_1455544 ?auto_1455543 ) ( ON ?auto_1455545 ?auto_1455544 ) ( not ( = ?auto_1455536 ?auto_1455537 ) ) ( not ( = ?auto_1455536 ?auto_1455538 ) ) ( not ( = ?auto_1455536 ?auto_1455540 ) ) ( not ( = ?auto_1455536 ?auto_1455539 ) ) ( not ( = ?auto_1455536 ?auto_1455541 ) ) ( not ( = ?auto_1455536 ?auto_1455542 ) ) ( not ( = ?auto_1455536 ?auto_1455543 ) ) ( not ( = ?auto_1455536 ?auto_1455544 ) ) ( not ( = ?auto_1455536 ?auto_1455545 ) ) ( not ( = ?auto_1455536 ?auto_1455546 ) ) ( not ( = ?auto_1455536 ?auto_1455547 ) ) ( not ( = ?auto_1455536 ?auto_1455553 ) ) ( not ( = ?auto_1455537 ?auto_1455538 ) ) ( not ( = ?auto_1455537 ?auto_1455540 ) ) ( not ( = ?auto_1455537 ?auto_1455539 ) ) ( not ( = ?auto_1455537 ?auto_1455541 ) ) ( not ( = ?auto_1455537 ?auto_1455542 ) ) ( not ( = ?auto_1455537 ?auto_1455543 ) ) ( not ( = ?auto_1455537 ?auto_1455544 ) ) ( not ( = ?auto_1455537 ?auto_1455545 ) ) ( not ( = ?auto_1455537 ?auto_1455546 ) ) ( not ( = ?auto_1455537 ?auto_1455547 ) ) ( not ( = ?auto_1455537 ?auto_1455553 ) ) ( not ( = ?auto_1455538 ?auto_1455540 ) ) ( not ( = ?auto_1455538 ?auto_1455539 ) ) ( not ( = ?auto_1455538 ?auto_1455541 ) ) ( not ( = ?auto_1455538 ?auto_1455542 ) ) ( not ( = ?auto_1455538 ?auto_1455543 ) ) ( not ( = ?auto_1455538 ?auto_1455544 ) ) ( not ( = ?auto_1455538 ?auto_1455545 ) ) ( not ( = ?auto_1455538 ?auto_1455546 ) ) ( not ( = ?auto_1455538 ?auto_1455547 ) ) ( not ( = ?auto_1455538 ?auto_1455553 ) ) ( not ( = ?auto_1455540 ?auto_1455539 ) ) ( not ( = ?auto_1455540 ?auto_1455541 ) ) ( not ( = ?auto_1455540 ?auto_1455542 ) ) ( not ( = ?auto_1455540 ?auto_1455543 ) ) ( not ( = ?auto_1455540 ?auto_1455544 ) ) ( not ( = ?auto_1455540 ?auto_1455545 ) ) ( not ( = ?auto_1455540 ?auto_1455546 ) ) ( not ( = ?auto_1455540 ?auto_1455547 ) ) ( not ( = ?auto_1455540 ?auto_1455553 ) ) ( not ( = ?auto_1455539 ?auto_1455541 ) ) ( not ( = ?auto_1455539 ?auto_1455542 ) ) ( not ( = ?auto_1455539 ?auto_1455543 ) ) ( not ( = ?auto_1455539 ?auto_1455544 ) ) ( not ( = ?auto_1455539 ?auto_1455545 ) ) ( not ( = ?auto_1455539 ?auto_1455546 ) ) ( not ( = ?auto_1455539 ?auto_1455547 ) ) ( not ( = ?auto_1455539 ?auto_1455553 ) ) ( not ( = ?auto_1455541 ?auto_1455542 ) ) ( not ( = ?auto_1455541 ?auto_1455543 ) ) ( not ( = ?auto_1455541 ?auto_1455544 ) ) ( not ( = ?auto_1455541 ?auto_1455545 ) ) ( not ( = ?auto_1455541 ?auto_1455546 ) ) ( not ( = ?auto_1455541 ?auto_1455547 ) ) ( not ( = ?auto_1455541 ?auto_1455553 ) ) ( not ( = ?auto_1455542 ?auto_1455543 ) ) ( not ( = ?auto_1455542 ?auto_1455544 ) ) ( not ( = ?auto_1455542 ?auto_1455545 ) ) ( not ( = ?auto_1455542 ?auto_1455546 ) ) ( not ( = ?auto_1455542 ?auto_1455547 ) ) ( not ( = ?auto_1455542 ?auto_1455553 ) ) ( not ( = ?auto_1455543 ?auto_1455544 ) ) ( not ( = ?auto_1455543 ?auto_1455545 ) ) ( not ( = ?auto_1455543 ?auto_1455546 ) ) ( not ( = ?auto_1455543 ?auto_1455547 ) ) ( not ( = ?auto_1455543 ?auto_1455553 ) ) ( not ( = ?auto_1455544 ?auto_1455545 ) ) ( not ( = ?auto_1455544 ?auto_1455546 ) ) ( not ( = ?auto_1455544 ?auto_1455547 ) ) ( not ( = ?auto_1455544 ?auto_1455553 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455545 ?auto_1455546 ?auto_1455547 )
      ( MAKE-11CRATE-VERIFY ?auto_1455536 ?auto_1455537 ?auto_1455538 ?auto_1455540 ?auto_1455539 ?auto_1455541 ?auto_1455542 ?auto_1455543 ?auto_1455544 ?auto_1455545 ?auto_1455546 ?auto_1455547 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_1455680 - SURFACE
      ?auto_1455681 - SURFACE
      ?auto_1455682 - SURFACE
      ?auto_1455684 - SURFACE
      ?auto_1455683 - SURFACE
      ?auto_1455685 - SURFACE
      ?auto_1455686 - SURFACE
      ?auto_1455687 - SURFACE
      ?auto_1455688 - SURFACE
      ?auto_1455689 - SURFACE
      ?auto_1455690 - SURFACE
      ?auto_1455691 - SURFACE
    )
    :vars
    (
      ?auto_1455694 - HOIST
      ?auto_1455692 - PLACE
      ?auto_1455693 - PLACE
      ?auto_1455697 - HOIST
      ?auto_1455695 - SURFACE
      ?auto_1455696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1455694 ?auto_1455692 ) ( IS-CRATE ?auto_1455691 ) ( not ( = ?auto_1455690 ?auto_1455691 ) ) ( not ( = ?auto_1455689 ?auto_1455690 ) ) ( not ( = ?auto_1455689 ?auto_1455691 ) ) ( not ( = ?auto_1455693 ?auto_1455692 ) ) ( HOIST-AT ?auto_1455697 ?auto_1455693 ) ( not ( = ?auto_1455694 ?auto_1455697 ) ) ( AVAILABLE ?auto_1455697 ) ( SURFACE-AT ?auto_1455691 ?auto_1455693 ) ( ON ?auto_1455691 ?auto_1455695 ) ( CLEAR ?auto_1455691 ) ( not ( = ?auto_1455690 ?auto_1455695 ) ) ( not ( = ?auto_1455691 ?auto_1455695 ) ) ( not ( = ?auto_1455689 ?auto_1455695 ) ) ( TRUCK-AT ?auto_1455696 ?auto_1455692 ) ( SURFACE-AT ?auto_1455689 ?auto_1455692 ) ( CLEAR ?auto_1455689 ) ( IS-CRATE ?auto_1455690 ) ( AVAILABLE ?auto_1455694 ) ( IN ?auto_1455690 ?auto_1455696 ) ( ON ?auto_1455681 ?auto_1455680 ) ( ON ?auto_1455682 ?auto_1455681 ) ( ON ?auto_1455684 ?auto_1455682 ) ( ON ?auto_1455683 ?auto_1455684 ) ( ON ?auto_1455685 ?auto_1455683 ) ( ON ?auto_1455686 ?auto_1455685 ) ( ON ?auto_1455687 ?auto_1455686 ) ( ON ?auto_1455688 ?auto_1455687 ) ( ON ?auto_1455689 ?auto_1455688 ) ( not ( = ?auto_1455680 ?auto_1455681 ) ) ( not ( = ?auto_1455680 ?auto_1455682 ) ) ( not ( = ?auto_1455680 ?auto_1455684 ) ) ( not ( = ?auto_1455680 ?auto_1455683 ) ) ( not ( = ?auto_1455680 ?auto_1455685 ) ) ( not ( = ?auto_1455680 ?auto_1455686 ) ) ( not ( = ?auto_1455680 ?auto_1455687 ) ) ( not ( = ?auto_1455680 ?auto_1455688 ) ) ( not ( = ?auto_1455680 ?auto_1455689 ) ) ( not ( = ?auto_1455680 ?auto_1455690 ) ) ( not ( = ?auto_1455680 ?auto_1455691 ) ) ( not ( = ?auto_1455680 ?auto_1455695 ) ) ( not ( = ?auto_1455681 ?auto_1455682 ) ) ( not ( = ?auto_1455681 ?auto_1455684 ) ) ( not ( = ?auto_1455681 ?auto_1455683 ) ) ( not ( = ?auto_1455681 ?auto_1455685 ) ) ( not ( = ?auto_1455681 ?auto_1455686 ) ) ( not ( = ?auto_1455681 ?auto_1455687 ) ) ( not ( = ?auto_1455681 ?auto_1455688 ) ) ( not ( = ?auto_1455681 ?auto_1455689 ) ) ( not ( = ?auto_1455681 ?auto_1455690 ) ) ( not ( = ?auto_1455681 ?auto_1455691 ) ) ( not ( = ?auto_1455681 ?auto_1455695 ) ) ( not ( = ?auto_1455682 ?auto_1455684 ) ) ( not ( = ?auto_1455682 ?auto_1455683 ) ) ( not ( = ?auto_1455682 ?auto_1455685 ) ) ( not ( = ?auto_1455682 ?auto_1455686 ) ) ( not ( = ?auto_1455682 ?auto_1455687 ) ) ( not ( = ?auto_1455682 ?auto_1455688 ) ) ( not ( = ?auto_1455682 ?auto_1455689 ) ) ( not ( = ?auto_1455682 ?auto_1455690 ) ) ( not ( = ?auto_1455682 ?auto_1455691 ) ) ( not ( = ?auto_1455682 ?auto_1455695 ) ) ( not ( = ?auto_1455684 ?auto_1455683 ) ) ( not ( = ?auto_1455684 ?auto_1455685 ) ) ( not ( = ?auto_1455684 ?auto_1455686 ) ) ( not ( = ?auto_1455684 ?auto_1455687 ) ) ( not ( = ?auto_1455684 ?auto_1455688 ) ) ( not ( = ?auto_1455684 ?auto_1455689 ) ) ( not ( = ?auto_1455684 ?auto_1455690 ) ) ( not ( = ?auto_1455684 ?auto_1455691 ) ) ( not ( = ?auto_1455684 ?auto_1455695 ) ) ( not ( = ?auto_1455683 ?auto_1455685 ) ) ( not ( = ?auto_1455683 ?auto_1455686 ) ) ( not ( = ?auto_1455683 ?auto_1455687 ) ) ( not ( = ?auto_1455683 ?auto_1455688 ) ) ( not ( = ?auto_1455683 ?auto_1455689 ) ) ( not ( = ?auto_1455683 ?auto_1455690 ) ) ( not ( = ?auto_1455683 ?auto_1455691 ) ) ( not ( = ?auto_1455683 ?auto_1455695 ) ) ( not ( = ?auto_1455685 ?auto_1455686 ) ) ( not ( = ?auto_1455685 ?auto_1455687 ) ) ( not ( = ?auto_1455685 ?auto_1455688 ) ) ( not ( = ?auto_1455685 ?auto_1455689 ) ) ( not ( = ?auto_1455685 ?auto_1455690 ) ) ( not ( = ?auto_1455685 ?auto_1455691 ) ) ( not ( = ?auto_1455685 ?auto_1455695 ) ) ( not ( = ?auto_1455686 ?auto_1455687 ) ) ( not ( = ?auto_1455686 ?auto_1455688 ) ) ( not ( = ?auto_1455686 ?auto_1455689 ) ) ( not ( = ?auto_1455686 ?auto_1455690 ) ) ( not ( = ?auto_1455686 ?auto_1455691 ) ) ( not ( = ?auto_1455686 ?auto_1455695 ) ) ( not ( = ?auto_1455687 ?auto_1455688 ) ) ( not ( = ?auto_1455687 ?auto_1455689 ) ) ( not ( = ?auto_1455687 ?auto_1455690 ) ) ( not ( = ?auto_1455687 ?auto_1455691 ) ) ( not ( = ?auto_1455687 ?auto_1455695 ) ) ( not ( = ?auto_1455688 ?auto_1455689 ) ) ( not ( = ?auto_1455688 ?auto_1455690 ) ) ( not ( = ?auto_1455688 ?auto_1455691 ) ) ( not ( = ?auto_1455688 ?auto_1455695 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1455689 ?auto_1455690 ?auto_1455691 )
      ( MAKE-11CRATE-VERIFY ?auto_1455680 ?auto_1455681 ?auto_1455682 ?auto_1455684 ?auto_1455683 ?auto_1455685 ?auto_1455686 ?auto_1455687 ?auto_1455688 ?auto_1455689 ?auto_1455690 ?auto_1455691 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1464949 - SURFACE
      ?auto_1464950 - SURFACE
      ?auto_1464951 - SURFACE
      ?auto_1464953 - SURFACE
      ?auto_1464952 - SURFACE
      ?auto_1464954 - SURFACE
      ?auto_1464955 - SURFACE
      ?auto_1464956 - SURFACE
      ?auto_1464957 - SURFACE
      ?auto_1464958 - SURFACE
      ?auto_1464959 - SURFACE
      ?auto_1464960 - SURFACE
      ?auto_1464961 - SURFACE
    )
    :vars
    (
      ?auto_1464962 - HOIST
      ?auto_1464963 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1464962 ?auto_1464963 ) ( SURFACE-AT ?auto_1464960 ?auto_1464963 ) ( CLEAR ?auto_1464960 ) ( LIFTING ?auto_1464962 ?auto_1464961 ) ( IS-CRATE ?auto_1464961 ) ( not ( = ?auto_1464960 ?auto_1464961 ) ) ( ON ?auto_1464950 ?auto_1464949 ) ( ON ?auto_1464951 ?auto_1464950 ) ( ON ?auto_1464953 ?auto_1464951 ) ( ON ?auto_1464952 ?auto_1464953 ) ( ON ?auto_1464954 ?auto_1464952 ) ( ON ?auto_1464955 ?auto_1464954 ) ( ON ?auto_1464956 ?auto_1464955 ) ( ON ?auto_1464957 ?auto_1464956 ) ( ON ?auto_1464958 ?auto_1464957 ) ( ON ?auto_1464959 ?auto_1464958 ) ( ON ?auto_1464960 ?auto_1464959 ) ( not ( = ?auto_1464949 ?auto_1464950 ) ) ( not ( = ?auto_1464949 ?auto_1464951 ) ) ( not ( = ?auto_1464949 ?auto_1464953 ) ) ( not ( = ?auto_1464949 ?auto_1464952 ) ) ( not ( = ?auto_1464949 ?auto_1464954 ) ) ( not ( = ?auto_1464949 ?auto_1464955 ) ) ( not ( = ?auto_1464949 ?auto_1464956 ) ) ( not ( = ?auto_1464949 ?auto_1464957 ) ) ( not ( = ?auto_1464949 ?auto_1464958 ) ) ( not ( = ?auto_1464949 ?auto_1464959 ) ) ( not ( = ?auto_1464949 ?auto_1464960 ) ) ( not ( = ?auto_1464949 ?auto_1464961 ) ) ( not ( = ?auto_1464950 ?auto_1464951 ) ) ( not ( = ?auto_1464950 ?auto_1464953 ) ) ( not ( = ?auto_1464950 ?auto_1464952 ) ) ( not ( = ?auto_1464950 ?auto_1464954 ) ) ( not ( = ?auto_1464950 ?auto_1464955 ) ) ( not ( = ?auto_1464950 ?auto_1464956 ) ) ( not ( = ?auto_1464950 ?auto_1464957 ) ) ( not ( = ?auto_1464950 ?auto_1464958 ) ) ( not ( = ?auto_1464950 ?auto_1464959 ) ) ( not ( = ?auto_1464950 ?auto_1464960 ) ) ( not ( = ?auto_1464950 ?auto_1464961 ) ) ( not ( = ?auto_1464951 ?auto_1464953 ) ) ( not ( = ?auto_1464951 ?auto_1464952 ) ) ( not ( = ?auto_1464951 ?auto_1464954 ) ) ( not ( = ?auto_1464951 ?auto_1464955 ) ) ( not ( = ?auto_1464951 ?auto_1464956 ) ) ( not ( = ?auto_1464951 ?auto_1464957 ) ) ( not ( = ?auto_1464951 ?auto_1464958 ) ) ( not ( = ?auto_1464951 ?auto_1464959 ) ) ( not ( = ?auto_1464951 ?auto_1464960 ) ) ( not ( = ?auto_1464951 ?auto_1464961 ) ) ( not ( = ?auto_1464953 ?auto_1464952 ) ) ( not ( = ?auto_1464953 ?auto_1464954 ) ) ( not ( = ?auto_1464953 ?auto_1464955 ) ) ( not ( = ?auto_1464953 ?auto_1464956 ) ) ( not ( = ?auto_1464953 ?auto_1464957 ) ) ( not ( = ?auto_1464953 ?auto_1464958 ) ) ( not ( = ?auto_1464953 ?auto_1464959 ) ) ( not ( = ?auto_1464953 ?auto_1464960 ) ) ( not ( = ?auto_1464953 ?auto_1464961 ) ) ( not ( = ?auto_1464952 ?auto_1464954 ) ) ( not ( = ?auto_1464952 ?auto_1464955 ) ) ( not ( = ?auto_1464952 ?auto_1464956 ) ) ( not ( = ?auto_1464952 ?auto_1464957 ) ) ( not ( = ?auto_1464952 ?auto_1464958 ) ) ( not ( = ?auto_1464952 ?auto_1464959 ) ) ( not ( = ?auto_1464952 ?auto_1464960 ) ) ( not ( = ?auto_1464952 ?auto_1464961 ) ) ( not ( = ?auto_1464954 ?auto_1464955 ) ) ( not ( = ?auto_1464954 ?auto_1464956 ) ) ( not ( = ?auto_1464954 ?auto_1464957 ) ) ( not ( = ?auto_1464954 ?auto_1464958 ) ) ( not ( = ?auto_1464954 ?auto_1464959 ) ) ( not ( = ?auto_1464954 ?auto_1464960 ) ) ( not ( = ?auto_1464954 ?auto_1464961 ) ) ( not ( = ?auto_1464955 ?auto_1464956 ) ) ( not ( = ?auto_1464955 ?auto_1464957 ) ) ( not ( = ?auto_1464955 ?auto_1464958 ) ) ( not ( = ?auto_1464955 ?auto_1464959 ) ) ( not ( = ?auto_1464955 ?auto_1464960 ) ) ( not ( = ?auto_1464955 ?auto_1464961 ) ) ( not ( = ?auto_1464956 ?auto_1464957 ) ) ( not ( = ?auto_1464956 ?auto_1464958 ) ) ( not ( = ?auto_1464956 ?auto_1464959 ) ) ( not ( = ?auto_1464956 ?auto_1464960 ) ) ( not ( = ?auto_1464956 ?auto_1464961 ) ) ( not ( = ?auto_1464957 ?auto_1464958 ) ) ( not ( = ?auto_1464957 ?auto_1464959 ) ) ( not ( = ?auto_1464957 ?auto_1464960 ) ) ( not ( = ?auto_1464957 ?auto_1464961 ) ) ( not ( = ?auto_1464958 ?auto_1464959 ) ) ( not ( = ?auto_1464958 ?auto_1464960 ) ) ( not ( = ?auto_1464958 ?auto_1464961 ) ) ( not ( = ?auto_1464959 ?auto_1464960 ) ) ( not ( = ?auto_1464959 ?auto_1464961 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1464960 ?auto_1464961 )
      ( MAKE-12CRATE-VERIFY ?auto_1464949 ?auto_1464950 ?auto_1464951 ?auto_1464953 ?auto_1464952 ?auto_1464954 ?auto_1464955 ?auto_1464956 ?auto_1464957 ?auto_1464958 ?auto_1464959 ?auto_1464960 ?auto_1464961 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465074 - SURFACE
      ?auto_1465075 - SURFACE
      ?auto_1465076 - SURFACE
      ?auto_1465078 - SURFACE
      ?auto_1465077 - SURFACE
      ?auto_1465079 - SURFACE
      ?auto_1465080 - SURFACE
      ?auto_1465081 - SURFACE
      ?auto_1465082 - SURFACE
      ?auto_1465083 - SURFACE
      ?auto_1465084 - SURFACE
      ?auto_1465085 - SURFACE
      ?auto_1465086 - SURFACE
    )
    :vars
    (
      ?auto_1465089 - HOIST
      ?auto_1465088 - PLACE
      ?auto_1465087 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465089 ?auto_1465088 ) ( SURFACE-AT ?auto_1465085 ?auto_1465088 ) ( CLEAR ?auto_1465085 ) ( IS-CRATE ?auto_1465086 ) ( not ( = ?auto_1465085 ?auto_1465086 ) ) ( TRUCK-AT ?auto_1465087 ?auto_1465088 ) ( AVAILABLE ?auto_1465089 ) ( IN ?auto_1465086 ?auto_1465087 ) ( ON ?auto_1465085 ?auto_1465084 ) ( not ( = ?auto_1465084 ?auto_1465085 ) ) ( not ( = ?auto_1465084 ?auto_1465086 ) ) ( ON ?auto_1465075 ?auto_1465074 ) ( ON ?auto_1465076 ?auto_1465075 ) ( ON ?auto_1465078 ?auto_1465076 ) ( ON ?auto_1465077 ?auto_1465078 ) ( ON ?auto_1465079 ?auto_1465077 ) ( ON ?auto_1465080 ?auto_1465079 ) ( ON ?auto_1465081 ?auto_1465080 ) ( ON ?auto_1465082 ?auto_1465081 ) ( ON ?auto_1465083 ?auto_1465082 ) ( ON ?auto_1465084 ?auto_1465083 ) ( not ( = ?auto_1465074 ?auto_1465075 ) ) ( not ( = ?auto_1465074 ?auto_1465076 ) ) ( not ( = ?auto_1465074 ?auto_1465078 ) ) ( not ( = ?auto_1465074 ?auto_1465077 ) ) ( not ( = ?auto_1465074 ?auto_1465079 ) ) ( not ( = ?auto_1465074 ?auto_1465080 ) ) ( not ( = ?auto_1465074 ?auto_1465081 ) ) ( not ( = ?auto_1465074 ?auto_1465082 ) ) ( not ( = ?auto_1465074 ?auto_1465083 ) ) ( not ( = ?auto_1465074 ?auto_1465084 ) ) ( not ( = ?auto_1465074 ?auto_1465085 ) ) ( not ( = ?auto_1465074 ?auto_1465086 ) ) ( not ( = ?auto_1465075 ?auto_1465076 ) ) ( not ( = ?auto_1465075 ?auto_1465078 ) ) ( not ( = ?auto_1465075 ?auto_1465077 ) ) ( not ( = ?auto_1465075 ?auto_1465079 ) ) ( not ( = ?auto_1465075 ?auto_1465080 ) ) ( not ( = ?auto_1465075 ?auto_1465081 ) ) ( not ( = ?auto_1465075 ?auto_1465082 ) ) ( not ( = ?auto_1465075 ?auto_1465083 ) ) ( not ( = ?auto_1465075 ?auto_1465084 ) ) ( not ( = ?auto_1465075 ?auto_1465085 ) ) ( not ( = ?auto_1465075 ?auto_1465086 ) ) ( not ( = ?auto_1465076 ?auto_1465078 ) ) ( not ( = ?auto_1465076 ?auto_1465077 ) ) ( not ( = ?auto_1465076 ?auto_1465079 ) ) ( not ( = ?auto_1465076 ?auto_1465080 ) ) ( not ( = ?auto_1465076 ?auto_1465081 ) ) ( not ( = ?auto_1465076 ?auto_1465082 ) ) ( not ( = ?auto_1465076 ?auto_1465083 ) ) ( not ( = ?auto_1465076 ?auto_1465084 ) ) ( not ( = ?auto_1465076 ?auto_1465085 ) ) ( not ( = ?auto_1465076 ?auto_1465086 ) ) ( not ( = ?auto_1465078 ?auto_1465077 ) ) ( not ( = ?auto_1465078 ?auto_1465079 ) ) ( not ( = ?auto_1465078 ?auto_1465080 ) ) ( not ( = ?auto_1465078 ?auto_1465081 ) ) ( not ( = ?auto_1465078 ?auto_1465082 ) ) ( not ( = ?auto_1465078 ?auto_1465083 ) ) ( not ( = ?auto_1465078 ?auto_1465084 ) ) ( not ( = ?auto_1465078 ?auto_1465085 ) ) ( not ( = ?auto_1465078 ?auto_1465086 ) ) ( not ( = ?auto_1465077 ?auto_1465079 ) ) ( not ( = ?auto_1465077 ?auto_1465080 ) ) ( not ( = ?auto_1465077 ?auto_1465081 ) ) ( not ( = ?auto_1465077 ?auto_1465082 ) ) ( not ( = ?auto_1465077 ?auto_1465083 ) ) ( not ( = ?auto_1465077 ?auto_1465084 ) ) ( not ( = ?auto_1465077 ?auto_1465085 ) ) ( not ( = ?auto_1465077 ?auto_1465086 ) ) ( not ( = ?auto_1465079 ?auto_1465080 ) ) ( not ( = ?auto_1465079 ?auto_1465081 ) ) ( not ( = ?auto_1465079 ?auto_1465082 ) ) ( not ( = ?auto_1465079 ?auto_1465083 ) ) ( not ( = ?auto_1465079 ?auto_1465084 ) ) ( not ( = ?auto_1465079 ?auto_1465085 ) ) ( not ( = ?auto_1465079 ?auto_1465086 ) ) ( not ( = ?auto_1465080 ?auto_1465081 ) ) ( not ( = ?auto_1465080 ?auto_1465082 ) ) ( not ( = ?auto_1465080 ?auto_1465083 ) ) ( not ( = ?auto_1465080 ?auto_1465084 ) ) ( not ( = ?auto_1465080 ?auto_1465085 ) ) ( not ( = ?auto_1465080 ?auto_1465086 ) ) ( not ( = ?auto_1465081 ?auto_1465082 ) ) ( not ( = ?auto_1465081 ?auto_1465083 ) ) ( not ( = ?auto_1465081 ?auto_1465084 ) ) ( not ( = ?auto_1465081 ?auto_1465085 ) ) ( not ( = ?auto_1465081 ?auto_1465086 ) ) ( not ( = ?auto_1465082 ?auto_1465083 ) ) ( not ( = ?auto_1465082 ?auto_1465084 ) ) ( not ( = ?auto_1465082 ?auto_1465085 ) ) ( not ( = ?auto_1465082 ?auto_1465086 ) ) ( not ( = ?auto_1465083 ?auto_1465084 ) ) ( not ( = ?auto_1465083 ?auto_1465085 ) ) ( not ( = ?auto_1465083 ?auto_1465086 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465084 ?auto_1465085 ?auto_1465086 )
      ( MAKE-12CRATE-VERIFY ?auto_1465074 ?auto_1465075 ?auto_1465076 ?auto_1465078 ?auto_1465077 ?auto_1465079 ?auto_1465080 ?auto_1465081 ?auto_1465082 ?auto_1465083 ?auto_1465084 ?auto_1465085 ?auto_1465086 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465212 - SURFACE
      ?auto_1465213 - SURFACE
      ?auto_1465214 - SURFACE
      ?auto_1465216 - SURFACE
      ?auto_1465215 - SURFACE
      ?auto_1465217 - SURFACE
      ?auto_1465218 - SURFACE
      ?auto_1465219 - SURFACE
      ?auto_1465220 - SURFACE
      ?auto_1465221 - SURFACE
      ?auto_1465222 - SURFACE
      ?auto_1465223 - SURFACE
      ?auto_1465224 - SURFACE
    )
    :vars
    (
      ?auto_1465227 - HOIST
      ?auto_1465225 - PLACE
      ?auto_1465228 - TRUCK
      ?auto_1465226 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465227 ?auto_1465225 ) ( SURFACE-AT ?auto_1465223 ?auto_1465225 ) ( CLEAR ?auto_1465223 ) ( IS-CRATE ?auto_1465224 ) ( not ( = ?auto_1465223 ?auto_1465224 ) ) ( AVAILABLE ?auto_1465227 ) ( IN ?auto_1465224 ?auto_1465228 ) ( ON ?auto_1465223 ?auto_1465222 ) ( not ( = ?auto_1465222 ?auto_1465223 ) ) ( not ( = ?auto_1465222 ?auto_1465224 ) ) ( TRUCK-AT ?auto_1465228 ?auto_1465226 ) ( not ( = ?auto_1465226 ?auto_1465225 ) ) ( ON ?auto_1465213 ?auto_1465212 ) ( ON ?auto_1465214 ?auto_1465213 ) ( ON ?auto_1465216 ?auto_1465214 ) ( ON ?auto_1465215 ?auto_1465216 ) ( ON ?auto_1465217 ?auto_1465215 ) ( ON ?auto_1465218 ?auto_1465217 ) ( ON ?auto_1465219 ?auto_1465218 ) ( ON ?auto_1465220 ?auto_1465219 ) ( ON ?auto_1465221 ?auto_1465220 ) ( ON ?auto_1465222 ?auto_1465221 ) ( not ( = ?auto_1465212 ?auto_1465213 ) ) ( not ( = ?auto_1465212 ?auto_1465214 ) ) ( not ( = ?auto_1465212 ?auto_1465216 ) ) ( not ( = ?auto_1465212 ?auto_1465215 ) ) ( not ( = ?auto_1465212 ?auto_1465217 ) ) ( not ( = ?auto_1465212 ?auto_1465218 ) ) ( not ( = ?auto_1465212 ?auto_1465219 ) ) ( not ( = ?auto_1465212 ?auto_1465220 ) ) ( not ( = ?auto_1465212 ?auto_1465221 ) ) ( not ( = ?auto_1465212 ?auto_1465222 ) ) ( not ( = ?auto_1465212 ?auto_1465223 ) ) ( not ( = ?auto_1465212 ?auto_1465224 ) ) ( not ( = ?auto_1465213 ?auto_1465214 ) ) ( not ( = ?auto_1465213 ?auto_1465216 ) ) ( not ( = ?auto_1465213 ?auto_1465215 ) ) ( not ( = ?auto_1465213 ?auto_1465217 ) ) ( not ( = ?auto_1465213 ?auto_1465218 ) ) ( not ( = ?auto_1465213 ?auto_1465219 ) ) ( not ( = ?auto_1465213 ?auto_1465220 ) ) ( not ( = ?auto_1465213 ?auto_1465221 ) ) ( not ( = ?auto_1465213 ?auto_1465222 ) ) ( not ( = ?auto_1465213 ?auto_1465223 ) ) ( not ( = ?auto_1465213 ?auto_1465224 ) ) ( not ( = ?auto_1465214 ?auto_1465216 ) ) ( not ( = ?auto_1465214 ?auto_1465215 ) ) ( not ( = ?auto_1465214 ?auto_1465217 ) ) ( not ( = ?auto_1465214 ?auto_1465218 ) ) ( not ( = ?auto_1465214 ?auto_1465219 ) ) ( not ( = ?auto_1465214 ?auto_1465220 ) ) ( not ( = ?auto_1465214 ?auto_1465221 ) ) ( not ( = ?auto_1465214 ?auto_1465222 ) ) ( not ( = ?auto_1465214 ?auto_1465223 ) ) ( not ( = ?auto_1465214 ?auto_1465224 ) ) ( not ( = ?auto_1465216 ?auto_1465215 ) ) ( not ( = ?auto_1465216 ?auto_1465217 ) ) ( not ( = ?auto_1465216 ?auto_1465218 ) ) ( not ( = ?auto_1465216 ?auto_1465219 ) ) ( not ( = ?auto_1465216 ?auto_1465220 ) ) ( not ( = ?auto_1465216 ?auto_1465221 ) ) ( not ( = ?auto_1465216 ?auto_1465222 ) ) ( not ( = ?auto_1465216 ?auto_1465223 ) ) ( not ( = ?auto_1465216 ?auto_1465224 ) ) ( not ( = ?auto_1465215 ?auto_1465217 ) ) ( not ( = ?auto_1465215 ?auto_1465218 ) ) ( not ( = ?auto_1465215 ?auto_1465219 ) ) ( not ( = ?auto_1465215 ?auto_1465220 ) ) ( not ( = ?auto_1465215 ?auto_1465221 ) ) ( not ( = ?auto_1465215 ?auto_1465222 ) ) ( not ( = ?auto_1465215 ?auto_1465223 ) ) ( not ( = ?auto_1465215 ?auto_1465224 ) ) ( not ( = ?auto_1465217 ?auto_1465218 ) ) ( not ( = ?auto_1465217 ?auto_1465219 ) ) ( not ( = ?auto_1465217 ?auto_1465220 ) ) ( not ( = ?auto_1465217 ?auto_1465221 ) ) ( not ( = ?auto_1465217 ?auto_1465222 ) ) ( not ( = ?auto_1465217 ?auto_1465223 ) ) ( not ( = ?auto_1465217 ?auto_1465224 ) ) ( not ( = ?auto_1465218 ?auto_1465219 ) ) ( not ( = ?auto_1465218 ?auto_1465220 ) ) ( not ( = ?auto_1465218 ?auto_1465221 ) ) ( not ( = ?auto_1465218 ?auto_1465222 ) ) ( not ( = ?auto_1465218 ?auto_1465223 ) ) ( not ( = ?auto_1465218 ?auto_1465224 ) ) ( not ( = ?auto_1465219 ?auto_1465220 ) ) ( not ( = ?auto_1465219 ?auto_1465221 ) ) ( not ( = ?auto_1465219 ?auto_1465222 ) ) ( not ( = ?auto_1465219 ?auto_1465223 ) ) ( not ( = ?auto_1465219 ?auto_1465224 ) ) ( not ( = ?auto_1465220 ?auto_1465221 ) ) ( not ( = ?auto_1465220 ?auto_1465222 ) ) ( not ( = ?auto_1465220 ?auto_1465223 ) ) ( not ( = ?auto_1465220 ?auto_1465224 ) ) ( not ( = ?auto_1465221 ?auto_1465222 ) ) ( not ( = ?auto_1465221 ?auto_1465223 ) ) ( not ( = ?auto_1465221 ?auto_1465224 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465222 ?auto_1465223 ?auto_1465224 )
      ( MAKE-12CRATE-VERIFY ?auto_1465212 ?auto_1465213 ?auto_1465214 ?auto_1465216 ?auto_1465215 ?auto_1465217 ?auto_1465218 ?auto_1465219 ?auto_1465220 ?auto_1465221 ?auto_1465222 ?auto_1465223 ?auto_1465224 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465362 - SURFACE
      ?auto_1465363 - SURFACE
      ?auto_1465364 - SURFACE
      ?auto_1465366 - SURFACE
      ?auto_1465365 - SURFACE
      ?auto_1465367 - SURFACE
      ?auto_1465368 - SURFACE
      ?auto_1465369 - SURFACE
      ?auto_1465370 - SURFACE
      ?auto_1465371 - SURFACE
      ?auto_1465372 - SURFACE
      ?auto_1465373 - SURFACE
      ?auto_1465374 - SURFACE
    )
    :vars
    (
      ?auto_1465377 - HOIST
      ?auto_1465378 - PLACE
      ?auto_1465379 - TRUCK
      ?auto_1465375 - PLACE
      ?auto_1465376 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465377 ?auto_1465378 ) ( SURFACE-AT ?auto_1465373 ?auto_1465378 ) ( CLEAR ?auto_1465373 ) ( IS-CRATE ?auto_1465374 ) ( not ( = ?auto_1465373 ?auto_1465374 ) ) ( AVAILABLE ?auto_1465377 ) ( ON ?auto_1465373 ?auto_1465372 ) ( not ( = ?auto_1465372 ?auto_1465373 ) ) ( not ( = ?auto_1465372 ?auto_1465374 ) ) ( TRUCK-AT ?auto_1465379 ?auto_1465375 ) ( not ( = ?auto_1465375 ?auto_1465378 ) ) ( HOIST-AT ?auto_1465376 ?auto_1465375 ) ( LIFTING ?auto_1465376 ?auto_1465374 ) ( not ( = ?auto_1465377 ?auto_1465376 ) ) ( ON ?auto_1465363 ?auto_1465362 ) ( ON ?auto_1465364 ?auto_1465363 ) ( ON ?auto_1465366 ?auto_1465364 ) ( ON ?auto_1465365 ?auto_1465366 ) ( ON ?auto_1465367 ?auto_1465365 ) ( ON ?auto_1465368 ?auto_1465367 ) ( ON ?auto_1465369 ?auto_1465368 ) ( ON ?auto_1465370 ?auto_1465369 ) ( ON ?auto_1465371 ?auto_1465370 ) ( ON ?auto_1465372 ?auto_1465371 ) ( not ( = ?auto_1465362 ?auto_1465363 ) ) ( not ( = ?auto_1465362 ?auto_1465364 ) ) ( not ( = ?auto_1465362 ?auto_1465366 ) ) ( not ( = ?auto_1465362 ?auto_1465365 ) ) ( not ( = ?auto_1465362 ?auto_1465367 ) ) ( not ( = ?auto_1465362 ?auto_1465368 ) ) ( not ( = ?auto_1465362 ?auto_1465369 ) ) ( not ( = ?auto_1465362 ?auto_1465370 ) ) ( not ( = ?auto_1465362 ?auto_1465371 ) ) ( not ( = ?auto_1465362 ?auto_1465372 ) ) ( not ( = ?auto_1465362 ?auto_1465373 ) ) ( not ( = ?auto_1465362 ?auto_1465374 ) ) ( not ( = ?auto_1465363 ?auto_1465364 ) ) ( not ( = ?auto_1465363 ?auto_1465366 ) ) ( not ( = ?auto_1465363 ?auto_1465365 ) ) ( not ( = ?auto_1465363 ?auto_1465367 ) ) ( not ( = ?auto_1465363 ?auto_1465368 ) ) ( not ( = ?auto_1465363 ?auto_1465369 ) ) ( not ( = ?auto_1465363 ?auto_1465370 ) ) ( not ( = ?auto_1465363 ?auto_1465371 ) ) ( not ( = ?auto_1465363 ?auto_1465372 ) ) ( not ( = ?auto_1465363 ?auto_1465373 ) ) ( not ( = ?auto_1465363 ?auto_1465374 ) ) ( not ( = ?auto_1465364 ?auto_1465366 ) ) ( not ( = ?auto_1465364 ?auto_1465365 ) ) ( not ( = ?auto_1465364 ?auto_1465367 ) ) ( not ( = ?auto_1465364 ?auto_1465368 ) ) ( not ( = ?auto_1465364 ?auto_1465369 ) ) ( not ( = ?auto_1465364 ?auto_1465370 ) ) ( not ( = ?auto_1465364 ?auto_1465371 ) ) ( not ( = ?auto_1465364 ?auto_1465372 ) ) ( not ( = ?auto_1465364 ?auto_1465373 ) ) ( not ( = ?auto_1465364 ?auto_1465374 ) ) ( not ( = ?auto_1465366 ?auto_1465365 ) ) ( not ( = ?auto_1465366 ?auto_1465367 ) ) ( not ( = ?auto_1465366 ?auto_1465368 ) ) ( not ( = ?auto_1465366 ?auto_1465369 ) ) ( not ( = ?auto_1465366 ?auto_1465370 ) ) ( not ( = ?auto_1465366 ?auto_1465371 ) ) ( not ( = ?auto_1465366 ?auto_1465372 ) ) ( not ( = ?auto_1465366 ?auto_1465373 ) ) ( not ( = ?auto_1465366 ?auto_1465374 ) ) ( not ( = ?auto_1465365 ?auto_1465367 ) ) ( not ( = ?auto_1465365 ?auto_1465368 ) ) ( not ( = ?auto_1465365 ?auto_1465369 ) ) ( not ( = ?auto_1465365 ?auto_1465370 ) ) ( not ( = ?auto_1465365 ?auto_1465371 ) ) ( not ( = ?auto_1465365 ?auto_1465372 ) ) ( not ( = ?auto_1465365 ?auto_1465373 ) ) ( not ( = ?auto_1465365 ?auto_1465374 ) ) ( not ( = ?auto_1465367 ?auto_1465368 ) ) ( not ( = ?auto_1465367 ?auto_1465369 ) ) ( not ( = ?auto_1465367 ?auto_1465370 ) ) ( not ( = ?auto_1465367 ?auto_1465371 ) ) ( not ( = ?auto_1465367 ?auto_1465372 ) ) ( not ( = ?auto_1465367 ?auto_1465373 ) ) ( not ( = ?auto_1465367 ?auto_1465374 ) ) ( not ( = ?auto_1465368 ?auto_1465369 ) ) ( not ( = ?auto_1465368 ?auto_1465370 ) ) ( not ( = ?auto_1465368 ?auto_1465371 ) ) ( not ( = ?auto_1465368 ?auto_1465372 ) ) ( not ( = ?auto_1465368 ?auto_1465373 ) ) ( not ( = ?auto_1465368 ?auto_1465374 ) ) ( not ( = ?auto_1465369 ?auto_1465370 ) ) ( not ( = ?auto_1465369 ?auto_1465371 ) ) ( not ( = ?auto_1465369 ?auto_1465372 ) ) ( not ( = ?auto_1465369 ?auto_1465373 ) ) ( not ( = ?auto_1465369 ?auto_1465374 ) ) ( not ( = ?auto_1465370 ?auto_1465371 ) ) ( not ( = ?auto_1465370 ?auto_1465372 ) ) ( not ( = ?auto_1465370 ?auto_1465373 ) ) ( not ( = ?auto_1465370 ?auto_1465374 ) ) ( not ( = ?auto_1465371 ?auto_1465372 ) ) ( not ( = ?auto_1465371 ?auto_1465373 ) ) ( not ( = ?auto_1465371 ?auto_1465374 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465372 ?auto_1465373 ?auto_1465374 )
      ( MAKE-12CRATE-VERIFY ?auto_1465362 ?auto_1465363 ?auto_1465364 ?auto_1465366 ?auto_1465365 ?auto_1465367 ?auto_1465368 ?auto_1465369 ?auto_1465370 ?auto_1465371 ?auto_1465372 ?auto_1465373 ?auto_1465374 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465524 - SURFACE
      ?auto_1465525 - SURFACE
      ?auto_1465526 - SURFACE
      ?auto_1465528 - SURFACE
      ?auto_1465527 - SURFACE
      ?auto_1465529 - SURFACE
      ?auto_1465530 - SURFACE
      ?auto_1465531 - SURFACE
      ?auto_1465532 - SURFACE
      ?auto_1465533 - SURFACE
      ?auto_1465534 - SURFACE
      ?auto_1465535 - SURFACE
      ?auto_1465536 - SURFACE
    )
    :vars
    (
      ?auto_1465539 - HOIST
      ?auto_1465540 - PLACE
      ?auto_1465541 - TRUCK
      ?auto_1465537 - PLACE
      ?auto_1465538 - HOIST
      ?auto_1465542 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465539 ?auto_1465540 ) ( SURFACE-AT ?auto_1465535 ?auto_1465540 ) ( CLEAR ?auto_1465535 ) ( IS-CRATE ?auto_1465536 ) ( not ( = ?auto_1465535 ?auto_1465536 ) ) ( AVAILABLE ?auto_1465539 ) ( ON ?auto_1465535 ?auto_1465534 ) ( not ( = ?auto_1465534 ?auto_1465535 ) ) ( not ( = ?auto_1465534 ?auto_1465536 ) ) ( TRUCK-AT ?auto_1465541 ?auto_1465537 ) ( not ( = ?auto_1465537 ?auto_1465540 ) ) ( HOIST-AT ?auto_1465538 ?auto_1465537 ) ( not ( = ?auto_1465539 ?auto_1465538 ) ) ( AVAILABLE ?auto_1465538 ) ( SURFACE-AT ?auto_1465536 ?auto_1465537 ) ( ON ?auto_1465536 ?auto_1465542 ) ( CLEAR ?auto_1465536 ) ( not ( = ?auto_1465535 ?auto_1465542 ) ) ( not ( = ?auto_1465536 ?auto_1465542 ) ) ( not ( = ?auto_1465534 ?auto_1465542 ) ) ( ON ?auto_1465525 ?auto_1465524 ) ( ON ?auto_1465526 ?auto_1465525 ) ( ON ?auto_1465528 ?auto_1465526 ) ( ON ?auto_1465527 ?auto_1465528 ) ( ON ?auto_1465529 ?auto_1465527 ) ( ON ?auto_1465530 ?auto_1465529 ) ( ON ?auto_1465531 ?auto_1465530 ) ( ON ?auto_1465532 ?auto_1465531 ) ( ON ?auto_1465533 ?auto_1465532 ) ( ON ?auto_1465534 ?auto_1465533 ) ( not ( = ?auto_1465524 ?auto_1465525 ) ) ( not ( = ?auto_1465524 ?auto_1465526 ) ) ( not ( = ?auto_1465524 ?auto_1465528 ) ) ( not ( = ?auto_1465524 ?auto_1465527 ) ) ( not ( = ?auto_1465524 ?auto_1465529 ) ) ( not ( = ?auto_1465524 ?auto_1465530 ) ) ( not ( = ?auto_1465524 ?auto_1465531 ) ) ( not ( = ?auto_1465524 ?auto_1465532 ) ) ( not ( = ?auto_1465524 ?auto_1465533 ) ) ( not ( = ?auto_1465524 ?auto_1465534 ) ) ( not ( = ?auto_1465524 ?auto_1465535 ) ) ( not ( = ?auto_1465524 ?auto_1465536 ) ) ( not ( = ?auto_1465524 ?auto_1465542 ) ) ( not ( = ?auto_1465525 ?auto_1465526 ) ) ( not ( = ?auto_1465525 ?auto_1465528 ) ) ( not ( = ?auto_1465525 ?auto_1465527 ) ) ( not ( = ?auto_1465525 ?auto_1465529 ) ) ( not ( = ?auto_1465525 ?auto_1465530 ) ) ( not ( = ?auto_1465525 ?auto_1465531 ) ) ( not ( = ?auto_1465525 ?auto_1465532 ) ) ( not ( = ?auto_1465525 ?auto_1465533 ) ) ( not ( = ?auto_1465525 ?auto_1465534 ) ) ( not ( = ?auto_1465525 ?auto_1465535 ) ) ( not ( = ?auto_1465525 ?auto_1465536 ) ) ( not ( = ?auto_1465525 ?auto_1465542 ) ) ( not ( = ?auto_1465526 ?auto_1465528 ) ) ( not ( = ?auto_1465526 ?auto_1465527 ) ) ( not ( = ?auto_1465526 ?auto_1465529 ) ) ( not ( = ?auto_1465526 ?auto_1465530 ) ) ( not ( = ?auto_1465526 ?auto_1465531 ) ) ( not ( = ?auto_1465526 ?auto_1465532 ) ) ( not ( = ?auto_1465526 ?auto_1465533 ) ) ( not ( = ?auto_1465526 ?auto_1465534 ) ) ( not ( = ?auto_1465526 ?auto_1465535 ) ) ( not ( = ?auto_1465526 ?auto_1465536 ) ) ( not ( = ?auto_1465526 ?auto_1465542 ) ) ( not ( = ?auto_1465528 ?auto_1465527 ) ) ( not ( = ?auto_1465528 ?auto_1465529 ) ) ( not ( = ?auto_1465528 ?auto_1465530 ) ) ( not ( = ?auto_1465528 ?auto_1465531 ) ) ( not ( = ?auto_1465528 ?auto_1465532 ) ) ( not ( = ?auto_1465528 ?auto_1465533 ) ) ( not ( = ?auto_1465528 ?auto_1465534 ) ) ( not ( = ?auto_1465528 ?auto_1465535 ) ) ( not ( = ?auto_1465528 ?auto_1465536 ) ) ( not ( = ?auto_1465528 ?auto_1465542 ) ) ( not ( = ?auto_1465527 ?auto_1465529 ) ) ( not ( = ?auto_1465527 ?auto_1465530 ) ) ( not ( = ?auto_1465527 ?auto_1465531 ) ) ( not ( = ?auto_1465527 ?auto_1465532 ) ) ( not ( = ?auto_1465527 ?auto_1465533 ) ) ( not ( = ?auto_1465527 ?auto_1465534 ) ) ( not ( = ?auto_1465527 ?auto_1465535 ) ) ( not ( = ?auto_1465527 ?auto_1465536 ) ) ( not ( = ?auto_1465527 ?auto_1465542 ) ) ( not ( = ?auto_1465529 ?auto_1465530 ) ) ( not ( = ?auto_1465529 ?auto_1465531 ) ) ( not ( = ?auto_1465529 ?auto_1465532 ) ) ( not ( = ?auto_1465529 ?auto_1465533 ) ) ( not ( = ?auto_1465529 ?auto_1465534 ) ) ( not ( = ?auto_1465529 ?auto_1465535 ) ) ( not ( = ?auto_1465529 ?auto_1465536 ) ) ( not ( = ?auto_1465529 ?auto_1465542 ) ) ( not ( = ?auto_1465530 ?auto_1465531 ) ) ( not ( = ?auto_1465530 ?auto_1465532 ) ) ( not ( = ?auto_1465530 ?auto_1465533 ) ) ( not ( = ?auto_1465530 ?auto_1465534 ) ) ( not ( = ?auto_1465530 ?auto_1465535 ) ) ( not ( = ?auto_1465530 ?auto_1465536 ) ) ( not ( = ?auto_1465530 ?auto_1465542 ) ) ( not ( = ?auto_1465531 ?auto_1465532 ) ) ( not ( = ?auto_1465531 ?auto_1465533 ) ) ( not ( = ?auto_1465531 ?auto_1465534 ) ) ( not ( = ?auto_1465531 ?auto_1465535 ) ) ( not ( = ?auto_1465531 ?auto_1465536 ) ) ( not ( = ?auto_1465531 ?auto_1465542 ) ) ( not ( = ?auto_1465532 ?auto_1465533 ) ) ( not ( = ?auto_1465532 ?auto_1465534 ) ) ( not ( = ?auto_1465532 ?auto_1465535 ) ) ( not ( = ?auto_1465532 ?auto_1465536 ) ) ( not ( = ?auto_1465532 ?auto_1465542 ) ) ( not ( = ?auto_1465533 ?auto_1465534 ) ) ( not ( = ?auto_1465533 ?auto_1465535 ) ) ( not ( = ?auto_1465533 ?auto_1465536 ) ) ( not ( = ?auto_1465533 ?auto_1465542 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465534 ?auto_1465535 ?auto_1465536 )
      ( MAKE-12CRATE-VERIFY ?auto_1465524 ?auto_1465525 ?auto_1465526 ?auto_1465528 ?auto_1465527 ?auto_1465529 ?auto_1465530 ?auto_1465531 ?auto_1465532 ?auto_1465533 ?auto_1465534 ?auto_1465535 ?auto_1465536 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465687 - SURFACE
      ?auto_1465688 - SURFACE
      ?auto_1465689 - SURFACE
      ?auto_1465691 - SURFACE
      ?auto_1465690 - SURFACE
      ?auto_1465692 - SURFACE
      ?auto_1465693 - SURFACE
      ?auto_1465694 - SURFACE
      ?auto_1465695 - SURFACE
      ?auto_1465696 - SURFACE
      ?auto_1465697 - SURFACE
      ?auto_1465698 - SURFACE
      ?auto_1465699 - SURFACE
    )
    :vars
    (
      ?auto_1465702 - HOIST
      ?auto_1465701 - PLACE
      ?auto_1465705 - PLACE
      ?auto_1465703 - HOIST
      ?auto_1465704 - SURFACE
      ?auto_1465700 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465702 ?auto_1465701 ) ( SURFACE-AT ?auto_1465698 ?auto_1465701 ) ( CLEAR ?auto_1465698 ) ( IS-CRATE ?auto_1465699 ) ( not ( = ?auto_1465698 ?auto_1465699 ) ) ( AVAILABLE ?auto_1465702 ) ( ON ?auto_1465698 ?auto_1465697 ) ( not ( = ?auto_1465697 ?auto_1465698 ) ) ( not ( = ?auto_1465697 ?auto_1465699 ) ) ( not ( = ?auto_1465705 ?auto_1465701 ) ) ( HOIST-AT ?auto_1465703 ?auto_1465705 ) ( not ( = ?auto_1465702 ?auto_1465703 ) ) ( AVAILABLE ?auto_1465703 ) ( SURFACE-AT ?auto_1465699 ?auto_1465705 ) ( ON ?auto_1465699 ?auto_1465704 ) ( CLEAR ?auto_1465699 ) ( not ( = ?auto_1465698 ?auto_1465704 ) ) ( not ( = ?auto_1465699 ?auto_1465704 ) ) ( not ( = ?auto_1465697 ?auto_1465704 ) ) ( TRUCK-AT ?auto_1465700 ?auto_1465701 ) ( ON ?auto_1465688 ?auto_1465687 ) ( ON ?auto_1465689 ?auto_1465688 ) ( ON ?auto_1465691 ?auto_1465689 ) ( ON ?auto_1465690 ?auto_1465691 ) ( ON ?auto_1465692 ?auto_1465690 ) ( ON ?auto_1465693 ?auto_1465692 ) ( ON ?auto_1465694 ?auto_1465693 ) ( ON ?auto_1465695 ?auto_1465694 ) ( ON ?auto_1465696 ?auto_1465695 ) ( ON ?auto_1465697 ?auto_1465696 ) ( not ( = ?auto_1465687 ?auto_1465688 ) ) ( not ( = ?auto_1465687 ?auto_1465689 ) ) ( not ( = ?auto_1465687 ?auto_1465691 ) ) ( not ( = ?auto_1465687 ?auto_1465690 ) ) ( not ( = ?auto_1465687 ?auto_1465692 ) ) ( not ( = ?auto_1465687 ?auto_1465693 ) ) ( not ( = ?auto_1465687 ?auto_1465694 ) ) ( not ( = ?auto_1465687 ?auto_1465695 ) ) ( not ( = ?auto_1465687 ?auto_1465696 ) ) ( not ( = ?auto_1465687 ?auto_1465697 ) ) ( not ( = ?auto_1465687 ?auto_1465698 ) ) ( not ( = ?auto_1465687 ?auto_1465699 ) ) ( not ( = ?auto_1465687 ?auto_1465704 ) ) ( not ( = ?auto_1465688 ?auto_1465689 ) ) ( not ( = ?auto_1465688 ?auto_1465691 ) ) ( not ( = ?auto_1465688 ?auto_1465690 ) ) ( not ( = ?auto_1465688 ?auto_1465692 ) ) ( not ( = ?auto_1465688 ?auto_1465693 ) ) ( not ( = ?auto_1465688 ?auto_1465694 ) ) ( not ( = ?auto_1465688 ?auto_1465695 ) ) ( not ( = ?auto_1465688 ?auto_1465696 ) ) ( not ( = ?auto_1465688 ?auto_1465697 ) ) ( not ( = ?auto_1465688 ?auto_1465698 ) ) ( not ( = ?auto_1465688 ?auto_1465699 ) ) ( not ( = ?auto_1465688 ?auto_1465704 ) ) ( not ( = ?auto_1465689 ?auto_1465691 ) ) ( not ( = ?auto_1465689 ?auto_1465690 ) ) ( not ( = ?auto_1465689 ?auto_1465692 ) ) ( not ( = ?auto_1465689 ?auto_1465693 ) ) ( not ( = ?auto_1465689 ?auto_1465694 ) ) ( not ( = ?auto_1465689 ?auto_1465695 ) ) ( not ( = ?auto_1465689 ?auto_1465696 ) ) ( not ( = ?auto_1465689 ?auto_1465697 ) ) ( not ( = ?auto_1465689 ?auto_1465698 ) ) ( not ( = ?auto_1465689 ?auto_1465699 ) ) ( not ( = ?auto_1465689 ?auto_1465704 ) ) ( not ( = ?auto_1465691 ?auto_1465690 ) ) ( not ( = ?auto_1465691 ?auto_1465692 ) ) ( not ( = ?auto_1465691 ?auto_1465693 ) ) ( not ( = ?auto_1465691 ?auto_1465694 ) ) ( not ( = ?auto_1465691 ?auto_1465695 ) ) ( not ( = ?auto_1465691 ?auto_1465696 ) ) ( not ( = ?auto_1465691 ?auto_1465697 ) ) ( not ( = ?auto_1465691 ?auto_1465698 ) ) ( not ( = ?auto_1465691 ?auto_1465699 ) ) ( not ( = ?auto_1465691 ?auto_1465704 ) ) ( not ( = ?auto_1465690 ?auto_1465692 ) ) ( not ( = ?auto_1465690 ?auto_1465693 ) ) ( not ( = ?auto_1465690 ?auto_1465694 ) ) ( not ( = ?auto_1465690 ?auto_1465695 ) ) ( not ( = ?auto_1465690 ?auto_1465696 ) ) ( not ( = ?auto_1465690 ?auto_1465697 ) ) ( not ( = ?auto_1465690 ?auto_1465698 ) ) ( not ( = ?auto_1465690 ?auto_1465699 ) ) ( not ( = ?auto_1465690 ?auto_1465704 ) ) ( not ( = ?auto_1465692 ?auto_1465693 ) ) ( not ( = ?auto_1465692 ?auto_1465694 ) ) ( not ( = ?auto_1465692 ?auto_1465695 ) ) ( not ( = ?auto_1465692 ?auto_1465696 ) ) ( not ( = ?auto_1465692 ?auto_1465697 ) ) ( not ( = ?auto_1465692 ?auto_1465698 ) ) ( not ( = ?auto_1465692 ?auto_1465699 ) ) ( not ( = ?auto_1465692 ?auto_1465704 ) ) ( not ( = ?auto_1465693 ?auto_1465694 ) ) ( not ( = ?auto_1465693 ?auto_1465695 ) ) ( not ( = ?auto_1465693 ?auto_1465696 ) ) ( not ( = ?auto_1465693 ?auto_1465697 ) ) ( not ( = ?auto_1465693 ?auto_1465698 ) ) ( not ( = ?auto_1465693 ?auto_1465699 ) ) ( not ( = ?auto_1465693 ?auto_1465704 ) ) ( not ( = ?auto_1465694 ?auto_1465695 ) ) ( not ( = ?auto_1465694 ?auto_1465696 ) ) ( not ( = ?auto_1465694 ?auto_1465697 ) ) ( not ( = ?auto_1465694 ?auto_1465698 ) ) ( not ( = ?auto_1465694 ?auto_1465699 ) ) ( not ( = ?auto_1465694 ?auto_1465704 ) ) ( not ( = ?auto_1465695 ?auto_1465696 ) ) ( not ( = ?auto_1465695 ?auto_1465697 ) ) ( not ( = ?auto_1465695 ?auto_1465698 ) ) ( not ( = ?auto_1465695 ?auto_1465699 ) ) ( not ( = ?auto_1465695 ?auto_1465704 ) ) ( not ( = ?auto_1465696 ?auto_1465697 ) ) ( not ( = ?auto_1465696 ?auto_1465698 ) ) ( not ( = ?auto_1465696 ?auto_1465699 ) ) ( not ( = ?auto_1465696 ?auto_1465704 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465697 ?auto_1465698 ?auto_1465699 )
      ( MAKE-12CRATE-VERIFY ?auto_1465687 ?auto_1465688 ?auto_1465689 ?auto_1465691 ?auto_1465690 ?auto_1465692 ?auto_1465693 ?auto_1465694 ?auto_1465695 ?auto_1465696 ?auto_1465697 ?auto_1465698 ?auto_1465699 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1465850 - SURFACE
      ?auto_1465851 - SURFACE
      ?auto_1465852 - SURFACE
      ?auto_1465854 - SURFACE
      ?auto_1465853 - SURFACE
      ?auto_1465855 - SURFACE
      ?auto_1465856 - SURFACE
      ?auto_1465857 - SURFACE
      ?auto_1465858 - SURFACE
      ?auto_1465859 - SURFACE
      ?auto_1465860 - SURFACE
      ?auto_1465861 - SURFACE
      ?auto_1465862 - SURFACE
    )
    :vars
    (
      ?auto_1465868 - HOIST
      ?auto_1465865 - PLACE
      ?auto_1465864 - PLACE
      ?auto_1465867 - HOIST
      ?auto_1465866 - SURFACE
      ?auto_1465863 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1465868 ?auto_1465865 ) ( IS-CRATE ?auto_1465862 ) ( not ( = ?auto_1465861 ?auto_1465862 ) ) ( not ( = ?auto_1465860 ?auto_1465861 ) ) ( not ( = ?auto_1465860 ?auto_1465862 ) ) ( not ( = ?auto_1465864 ?auto_1465865 ) ) ( HOIST-AT ?auto_1465867 ?auto_1465864 ) ( not ( = ?auto_1465868 ?auto_1465867 ) ) ( AVAILABLE ?auto_1465867 ) ( SURFACE-AT ?auto_1465862 ?auto_1465864 ) ( ON ?auto_1465862 ?auto_1465866 ) ( CLEAR ?auto_1465862 ) ( not ( = ?auto_1465861 ?auto_1465866 ) ) ( not ( = ?auto_1465862 ?auto_1465866 ) ) ( not ( = ?auto_1465860 ?auto_1465866 ) ) ( TRUCK-AT ?auto_1465863 ?auto_1465865 ) ( SURFACE-AT ?auto_1465860 ?auto_1465865 ) ( CLEAR ?auto_1465860 ) ( LIFTING ?auto_1465868 ?auto_1465861 ) ( IS-CRATE ?auto_1465861 ) ( ON ?auto_1465851 ?auto_1465850 ) ( ON ?auto_1465852 ?auto_1465851 ) ( ON ?auto_1465854 ?auto_1465852 ) ( ON ?auto_1465853 ?auto_1465854 ) ( ON ?auto_1465855 ?auto_1465853 ) ( ON ?auto_1465856 ?auto_1465855 ) ( ON ?auto_1465857 ?auto_1465856 ) ( ON ?auto_1465858 ?auto_1465857 ) ( ON ?auto_1465859 ?auto_1465858 ) ( ON ?auto_1465860 ?auto_1465859 ) ( not ( = ?auto_1465850 ?auto_1465851 ) ) ( not ( = ?auto_1465850 ?auto_1465852 ) ) ( not ( = ?auto_1465850 ?auto_1465854 ) ) ( not ( = ?auto_1465850 ?auto_1465853 ) ) ( not ( = ?auto_1465850 ?auto_1465855 ) ) ( not ( = ?auto_1465850 ?auto_1465856 ) ) ( not ( = ?auto_1465850 ?auto_1465857 ) ) ( not ( = ?auto_1465850 ?auto_1465858 ) ) ( not ( = ?auto_1465850 ?auto_1465859 ) ) ( not ( = ?auto_1465850 ?auto_1465860 ) ) ( not ( = ?auto_1465850 ?auto_1465861 ) ) ( not ( = ?auto_1465850 ?auto_1465862 ) ) ( not ( = ?auto_1465850 ?auto_1465866 ) ) ( not ( = ?auto_1465851 ?auto_1465852 ) ) ( not ( = ?auto_1465851 ?auto_1465854 ) ) ( not ( = ?auto_1465851 ?auto_1465853 ) ) ( not ( = ?auto_1465851 ?auto_1465855 ) ) ( not ( = ?auto_1465851 ?auto_1465856 ) ) ( not ( = ?auto_1465851 ?auto_1465857 ) ) ( not ( = ?auto_1465851 ?auto_1465858 ) ) ( not ( = ?auto_1465851 ?auto_1465859 ) ) ( not ( = ?auto_1465851 ?auto_1465860 ) ) ( not ( = ?auto_1465851 ?auto_1465861 ) ) ( not ( = ?auto_1465851 ?auto_1465862 ) ) ( not ( = ?auto_1465851 ?auto_1465866 ) ) ( not ( = ?auto_1465852 ?auto_1465854 ) ) ( not ( = ?auto_1465852 ?auto_1465853 ) ) ( not ( = ?auto_1465852 ?auto_1465855 ) ) ( not ( = ?auto_1465852 ?auto_1465856 ) ) ( not ( = ?auto_1465852 ?auto_1465857 ) ) ( not ( = ?auto_1465852 ?auto_1465858 ) ) ( not ( = ?auto_1465852 ?auto_1465859 ) ) ( not ( = ?auto_1465852 ?auto_1465860 ) ) ( not ( = ?auto_1465852 ?auto_1465861 ) ) ( not ( = ?auto_1465852 ?auto_1465862 ) ) ( not ( = ?auto_1465852 ?auto_1465866 ) ) ( not ( = ?auto_1465854 ?auto_1465853 ) ) ( not ( = ?auto_1465854 ?auto_1465855 ) ) ( not ( = ?auto_1465854 ?auto_1465856 ) ) ( not ( = ?auto_1465854 ?auto_1465857 ) ) ( not ( = ?auto_1465854 ?auto_1465858 ) ) ( not ( = ?auto_1465854 ?auto_1465859 ) ) ( not ( = ?auto_1465854 ?auto_1465860 ) ) ( not ( = ?auto_1465854 ?auto_1465861 ) ) ( not ( = ?auto_1465854 ?auto_1465862 ) ) ( not ( = ?auto_1465854 ?auto_1465866 ) ) ( not ( = ?auto_1465853 ?auto_1465855 ) ) ( not ( = ?auto_1465853 ?auto_1465856 ) ) ( not ( = ?auto_1465853 ?auto_1465857 ) ) ( not ( = ?auto_1465853 ?auto_1465858 ) ) ( not ( = ?auto_1465853 ?auto_1465859 ) ) ( not ( = ?auto_1465853 ?auto_1465860 ) ) ( not ( = ?auto_1465853 ?auto_1465861 ) ) ( not ( = ?auto_1465853 ?auto_1465862 ) ) ( not ( = ?auto_1465853 ?auto_1465866 ) ) ( not ( = ?auto_1465855 ?auto_1465856 ) ) ( not ( = ?auto_1465855 ?auto_1465857 ) ) ( not ( = ?auto_1465855 ?auto_1465858 ) ) ( not ( = ?auto_1465855 ?auto_1465859 ) ) ( not ( = ?auto_1465855 ?auto_1465860 ) ) ( not ( = ?auto_1465855 ?auto_1465861 ) ) ( not ( = ?auto_1465855 ?auto_1465862 ) ) ( not ( = ?auto_1465855 ?auto_1465866 ) ) ( not ( = ?auto_1465856 ?auto_1465857 ) ) ( not ( = ?auto_1465856 ?auto_1465858 ) ) ( not ( = ?auto_1465856 ?auto_1465859 ) ) ( not ( = ?auto_1465856 ?auto_1465860 ) ) ( not ( = ?auto_1465856 ?auto_1465861 ) ) ( not ( = ?auto_1465856 ?auto_1465862 ) ) ( not ( = ?auto_1465856 ?auto_1465866 ) ) ( not ( = ?auto_1465857 ?auto_1465858 ) ) ( not ( = ?auto_1465857 ?auto_1465859 ) ) ( not ( = ?auto_1465857 ?auto_1465860 ) ) ( not ( = ?auto_1465857 ?auto_1465861 ) ) ( not ( = ?auto_1465857 ?auto_1465862 ) ) ( not ( = ?auto_1465857 ?auto_1465866 ) ) ( not ( = ?auto_1465858 ?auto_1465859 ) ) ( not ( = ?auto_1465858 ?auto_1465860 ) ) ( not ( = ?auto_1465858 ?auto_1465861 ) ) ( not ( = ?auto_1465858 ?auto_1465862 ) ) ( not ( = ?auto_1465858 ?auto_1465866 ) ) ( not ( = ?auto_1465859 ?auto_1465860 ) ) ( not ( = ?auto_1465859 ?auto_1465861 ) ) ( not ( = ?auto_1465859 ?auto_1465862 ) ) ( not ( = ?auto_1465859 ?auto_1465866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1465860 ?auto_1465861 ?auto_1465862 )
      ( MAKE-12CRATE-VERIFY ?auto_1465850 ?auto_1465851 ?auto_1465852 ?auto_1465854 ?auto_1465853 ?auto_1465855 ?auto_1465856 ?auto_1465857 ?auto_1465858 ?auto_1465859 ?auto_1465860 ?auto_1465861 ?auto_1465862 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_1466013 - SURFACE
      ?auto_1466014 - SURFACE
      ?auto_1466015 - SURFACE
      ?auto_1466017 - SURFACE
      ?auto_1466016 - SURFACE
      ?auto_1466018 - SURFACE
      ?auto_1466019 - SURFACE
      ?auto_1466020 - SURFACE
      ?auto_1466021 - SURFACE
      ?auto_1466022 - SURFACE
      ?auto_1466023 - SURFACE
      ?auto_1466024 - SURFACE
      ?auto_1466025 - SURFACE
    )
    :vars
    (
      ?auto_1466029 - HOIST
      ?auto_1466031 - PLACE
      ?auto_1466028 - PLACE
      ?auto_1466026 - HOIST
      ?auto_1466030 - SURFACE
      ?auto_1466027 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466029 ?auto_1466031 ) ( IS-CRATE ?auto_1466025 ) ( not ( = ?auto_1466024 ?auto_1466025 ) ) ( not ( = ?auto_1466023 ?auto_1466024 ) ) ( not ( = ?auto_1466023 ?auto_1466025 ) ) ( not ( = ?auto_1466028 ?auto_1466031 ) ) ( HOIST-AT ?auto_1466026 ?auto_1466028 ) ( not ( = ?auto_1466029 ?auto_1466026 ) ) ( AVAILABLE ?auto_1466026 ) ( SURFACE-AT ?auto_1466025 ?auto_1466028 ) ( ON ?auto_1466025 ?auto_1466030 ) ( CLEAR ?auto_1466025 ) ( not ( = ?auto_1466024 ?auto_1466030 ) ) ( not ( = ?auto_1466025 ?auto_1466030 ) ) ( not ( = ?auto_1466023 ?auto_1466030 ) ) ( TRUCK-AT ?auto_1466027 ?auto_1466031 ) ( SURFACE-AT ?auto_1466023 ?auto_1466031 ) ( CLEAR ?auto_1466023 ) ( IS-CRATE ?auto_1466024 ) ( AVAILABLE ?auto_1466029 ) ( IN ?auto_1466024 ?auto_1466027 ) ( ON ?auto_1466014 ?auto_1466013 ) ( ON ?auto_1466015 ?auto_1466014 ) ( ON ?auto_1466017 ?auto_1466015 ) ( ON ?auto_1466016 ?auto_1466017 ) ( ON ?auto_1466018 ?auto_1466016 ) ( ON ?auto_1466019 ?auto_1466018 ) ( ON ?auto_1466020 ?auto_1466019 ) ( ON ?auto_1466021 ?auto_1466020 ) ( ON ?auto_1466022 ?auto_1466021 ) ( ON ?auto_1466023 ?auto_1466022 ) ( not ( = ?auto_1466013 ?auto_1466014 ) ) ( not ( = ?auto_1466013 ?auto_1466015 ) ) ( not ( = ?auto_1466013 ?auto_1466017 ) ) ( not ( = ?auto_1466013 ?auto_1466016 ) ) ( not ( = ?auto_1466013 ?auto_1466018 ) ) ( not ( = ?auto_1466013 ?auto_1466019 ) ) ( not ( = ?auto_1466013 ?auto_1466020 ) ) ( not ( = ?auto_1466013 ?auto_1466021 ) ) ( not ( = ?auto_1466013 ?auto_1466022 ) ) ( not ( = ?auto_1466013 ?auto_1466023 ) ) ( not ( = ?auto_1466013 ?auto_1466024 ) ) ( not ( = ?auto_1466013 ?auto_1466025 ) ) ( not ( = ?auto_1466013 ?auto_1466030 ) ) ( not ( = ?auto_1466014 ?auto_1466015 ) ) ( not ( = ?auto_1466014 ?auto_1466017 ) ) ( not ( = ?auto_1466014 ?auto_1466016 ) ) ( not ( = ?auto_1466014 ?auto_1466018 ) ) ( not ( = ?auto_1466014 ?auto_1466019 ) ) ( not ( = ?auto_1466014 ?auto_1466020 ) ) ( not ( = ?auto_1466014 ?auto_1466021 ) ) ( not ( = ?auto_1466014 ?auto_1466022 ) ) ( not ( = ?auto_1466014 ?auto_1466023 ) ) ( not ( = ?auto_1466014 ?auto_1466024 ) ) ( not ( = ?auto_1466014 ?auto_1466025 ) ) ( not ( = ?auto_1466014 ?auto_1466030 ) ) ( not ( = ?auto_1466015 ?auto_1466017 ) ) ( not ( = ?auto_1466015 ?auto_1466016 ) ) ( not ( = ?auto_1466015 ?auto_1466018 ) ) ( not ( = ?auto_1466015 ?auto_1466019 ) ) ( not ( = ?auto_1466015 ?auto_1466020 ) ) ( not ( = ?auto_1466015 ?auto_1466021 ) ) ( not ( = ?auto_1466015 ?auto_1466022 ) ) ( not ( = ?auto_1466015 ?auto_1466023 ) ) ( not ( = ?auto_1466015 ?auto_1466024 ) ) ( not ( = ?auto_1466015 ?auto_1466025 ) ) ( not ( = ?auto_1466015 ?auto_1466030 ) ) ( not ( = ?auto_1466017 ?auto_1466016 ) ) ( not ( = ?auto_1466017 ?auto_1466018 ) ) ( not ( = ?auto_1466017 ?auto_1466019 ) ) ( not ( = ?auto_1466017 ?auto_1466020 ) ) ( not ( = ?auto_1466017 ?auto_1466021 ) ) ( not ( = ?auto_1466017 ?auto_1466022 ) ) ( not ( = ?auto_1466017 ?auto_1466023 ) ) ( not ( = ?auto_1466017 ?auto_1466024 ) ) ( not ( = ?auto_1466017 ?auto_1466025 ) ) ( not ( = ?auto_1466017 ?auto_1466030 ) ) ( not ( = ?auto_1466016 ?auto_1466018 ) ) ( not ( = ?auto_1466016 ?auto_1466019 ) ) ( not ( = ?auto_1466016 ?auto_1466020 ) ) ( not ( = ?auto_1466016 ?auto_1466021 ) ) ( not ( = ?auto_1466016 ?auto_1466022 ) ) ( not ( = ?auto_1466016 ?auto_1466023 ) ) ( not ( = ?auto_1466016 ?auto_1466024 ) ) ( not ( = ?auto_1466016 ?auto_1466025 ) ) ( not ( = ?auto_1466016 ?auto_1466030 ) ) ( not ( = ?auto_1466018 ?auto_1466019 ) ) ( not ( = ?auto_1466018 ?auto_1466020 ) ) ( not ( = ?auto_1466018 ?auto_1466021 ) ) ( not ( = ?auto_1466018 ?auto_1466022 ) ) ( not ( = ?auto_1466018 ?auto_1466023 ) ) ( not ( = ?auto_1466018 ?auto_1466024 ) ) ( not ( = ?auto_1466018 ?auto_1466025 ) ) ( not ( = ?auto_1466018 ?auto_1466030 ) ) ( not ( = ?auto_1466019 ?auto_1466020 ) ) ( not ( = ?auto_1466019 ?auto_1466021 ) ) ( not ( = ?auto_1466019 ?auto_1466022 ) ) ( not ( = ?auto_1466019 ?auto_1466023 ) ) ( not ( = ?auto_1466019 ?auto_1466024 ) ) ( not ( = ?auto_1466019 ?auto_1466025 ) ) ( not ( = ?auto_1466019 ?auto_1466030 ) ) ( not ( = ?auto_1466020 ?auto_1466021 ) ) ( not ( = ?auto_1466020 ?auto_1466022 ) ) ( not ( = ?auto_1466020 ?auto_1466023 ) ) ( not ( = ?auto_1466020 ?auto_1466024 ) ) ( not ( = ?auto_1466020 ?auto_1466025 ) ) ( not ( = ?auto_1466020 ?auto_1466030 ) ) ( not ( = ?auto_1466021 ?auto_1466022 ) ) ( not ( = ?auto_1466021 ?auto_1466023 ) ) ( not ( = ?auto_1466021 ?auto_1466024 ) ) ( not ( = ?auto_1466021 ?auto_1466025 ) ) ( not ( = ?auto_1466021 ?auto_1466030 ) ) ( not ( = ?auto_1466022 ?auto_1466023 ) ) ( not ( = ?auto_1466022 ?auto_1466024 ) ) ( not ( = ?auto_1466022 ?auto_1466025 ) ) ( not ( = ?auto_1466022 ?auto_1466030 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1466023 ?auto_1466024 ?auto_1466025 )
      ( MAKE-12CRATE-VERIFY ?auto_1466013 ?auto_1466014 ?auto_1466015 ?auto_1466017 ?auto_1466016 ?auto_1466018 ?auto_1466019 ?auto_1466020 ?auto_1466021 ?auto_1466022 ?auto_1466023 ?auto_1466024 ?auto_1466025 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1477593 - SURFACE
      ?auto_1477594 - SURFACE
      ?auto_1477595 - SURFACE
      ?auto_1477597 - SURFACE
      ?auto_1477596 - SURFACE
      ?auto_1477598 - SURFACE
      ?auto_1477599 - SURFACE
      ?auto_1477600 - SURFACE
      ?auto_1477601 - SURFACE
      ?auto_1477602 - SURFACE
      ?auto_1477603 - SURFACE
      ?auto_1477604 - SURFACE
      ?auto_1477605 - SURFACE
      ?auto_1477606 - SURFACE
    )
    :vars
    (
      ?auto_1477608 - HOIST
      ?auto_1477607 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1477608 ?auto_1477607 ) ( SURFACE-AT ?auto_1477605 ?auto_1477607 ) ( CLEAR ?auto_1477605 ) ( LIFTING ?auto_1477608 ?auto_1477606 ) ( IS-CRATE ?auto_1477606 ) ( not ( = ?auto_1477605 ?auto_1477606 ) ) ( ON ?auto_1477594 ?auto_1477593 ) ( ON ?auto_1477595 ?auto_1477594 ) ( ON ?auto_1477597 ?auto_1477595 ) ( ON ?auto_1477596 ?auto_1477597 ) ( ON ?auto_1477598 ?auto_1477596 ) ( ON ?auto_1477599 ?auto_1477598 ) ( ON ?auto_1477600 ?auto_1477599 ) ( ON ?auto_1477601 ?auto_1477600 ) ( ON ?auto_1477602 ?auto_1477601 ) ( ON ?auto_1477603 ?auto_1477602 ) ( ON ?auto_1477604 ?auto_1477603 ) ( ON ?auto_1477605 ?auto_1477604 ) ( not ( = ?auto_1477593 ?auto_1477594 ) ) ( not ( = ?auto_1477593 ?auto_1477595 ) ) ( not ( = ?auto_1477593 ?auto_1477597 ) ) ( not ( = ?auto_1477593 ?auto_1477596 ) ) ( not ( = ?auto_1477593 ?auto_1477598 ) ) ( not ( = ?auto_1477593 ?auto_1477599 ) ) ( not ( = ?auto_1477593 ?auto_1477600 ) ) ( not ( = ?auto_1477593 ?auto_1477601 ) ) ( not ( = ?auto_1477593 ?auto_1477602 ) ) ( not ( = ?auto_1477593 ?auto_1477603 ) ) ( not ( = ?auto_1477593 ?auto_1477604 ) ) ( not ( = ?auto_1477593 ?auto_1477605 ) ) ( not ( = ?auto_1477593 ?auto_1477606 ) ) ( not ( = ?auto_1477594 ?auto_1477595 ) ) ( not ( = ?auto_1477594 ?auto_1477597 ) ) ( not ( = ?auto_1477594 ?auto_1477596 ) ) ( not ( = ?auto_1477594 ?auto_1477598 ) ) ( not ( = ?auto_1477594 ?auto_1477599 ) ) ( not ( = ?auto_1477594 ?auto_1477600 ) ) ( not ( = ?auto_1477594 ?auto_1477601 ) ) ( not ( = ?auto_1477594 ?auto_1477602 ) ) ( not ( = ?auto_1477594 ?auto_1477603 ) ) ( not ( = ?auto_1477594 ?auto_1477604 ) ) ( not ( = ?auto_1477594 ?auto_1477605 ) ) ( not ( = ?auto_1477594 ?auto_1477606 ) ) ( not ( = ?auto_1477595 ?auto_1477597 ) ) ( not ( = ?auto_1477595 ?auto_1477596 ) ) ( not ( = ?auto_1477595 ?auto_1477598 ) ) ( not ( = ?auto_1477595 ?auto_1477599 ) ) ( not ( = ?auto_1477595 ?auto_1477600 ) ) ( not ( = ?auto_1477595 ?auto_1477601 ) ) ( not ( = ?auto_1477595 ?auto_1477602 ) ) ( not ( = ?auto_1477595 ?auto_1477603 ) ) ( not ( = ?auto_1477595 ?auto_1477604 ) ) ( not ( = ?auto_1477595 ?auto_1477605 ) ) ( not ( = ?auto_1477595 ?auto_1477606 ) ) ( not ( = ?auto_1477597 ?auto_1477596 ) ) ( not ( = ?auto_1477597 ?auto_1477598 ) ) ( not ( = ?auto_1477597 ?auto_1477599 ) ) ( not ( = ?auto_1477597 ?auto_1477600 ) ) ( not ( = ?auto_1477597 ?auto_1477601 ) ) ( not ( = ?auto_1477597 ?auto_1477602 ) ) ( not ( = ?auto_1477597 ?auto_1477603 ) ) ( not ( = ?auto_1477597 ?auto_1477604 ) ) ( not ( = ?auto_1477597 ?auto_1477605 ) ) ( not ( = ?auto_1477597 ?auto_1477606 ) ) ( not ( = ?auto_1477596 ?auto_1477598 ) ) ( not ( = ?auto_1477596 ?auto_1477599 ) ) ( not ( = ?auto_1477596 ?auto_1477600 ) ) ( not ( = ?auto_1477596 ?auto_1477601 ) ) ( not ( = ?auto_1477596 ?auto_1477602 ) ) ( not ( = ?auto_1477596 ?auto_1477603 ) ) ( not ( = ?auto_1477596 ?auto_1477604 ) ) ( not ( = ?auto_1477596 ?auto_1477605 ) ) ( not ( = ?auto_1477596 ?auto_1477606 ) ) ( not ( = ?auto_1477598 ?auto_1477599 ) ) ( not ( = ?auto_1477598 ?auto_1477600 ) ) ( not ( = ?auto_1477598 ?auto_1477601 ) ) ( not ( = ?auto_1477598 ?auto_1477602 ) ) ( not ( = ?auto_1477598 ?auto_1477603 ) ) ( not ( = ?auto_1477598 ?auto_1477604 ) ) ( not ( = ?auto_1477598 ?auto_1477605 ) ) ( not ( = ?auto_1477598 ?auto_1477606 ) ) ( not ( = ?auto_1477599 ?auto_1477600 ) ) ( not ( = ?auto_1477599 ?auto_1477601 ) ) ( not ( = ?auto_1477599 ?auto_1477602 ) ) ( not ( = ?auto_1477599 ?auto_1477603 ) ) ( not ( = ?auto_1477599 ?auto_1477604 ) ) ( not ( = ?auto_1477599 ?auto_1477605 ) ) ( not ( = ?auto_1477599 ?auto_1477606 ) ) ( not ( = ?auto_1477600 ?auto_1477601 ) ) ( not ( = ?auto_1477600 ?auto_1477602 ) ) ( not ( = ?auto_1477600 ?auto_1477603 ) ) ( not ( = ?auto_1477600 ?auto_1477604 ) ) ( not ( = ?auto_1477600 ?auto_1477605 ) ) ( not ( = ?auto_1477600 ?auto_1477606 ) ) ( not ( = ?auto_1477601 ?auto_1477602 ) ) ( not ( = ?auto_1477601 ?auto_1477603 ) ) ( not ( = ?auto_1477601 ?auto_1477604 ) ) ( not ( = ?auto_1477601 ?auto_1477605 ) ) ( not ( = ?auto_1477601 ?auto_1477606 ) ) ( not ( = ?auto_1477602 ?auto_1477603 ) ) ( not ( = ?auto_1477602 ?auto_1477604 ) ) ( not ( = ?auto_1477602 ?auto_1477605 ) ) ( not ( = ?auto_1477602 ?auto_1477606 ) ) ( not ( = ?auto_1477603 ?auto_1477604 ) ) ( not ( = ?auto_1477603 ?auto_1477605 ) ) ( not ( = ?auto_1477603 ?auto_1477606 ) ) ( not ( = ?auto_1477604 ?auto_1477605 ) ) ( not ( = ?auto_1477604 ?auto_1477606 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1477605 ?auto_1477606 )
      ( MAKE-13CRATE-VERIFY ?auto_1477593 ?auto_1477594 ?auto_1477595 ?auto_1477597 ?auto_1477596 ?auto_1477598 ?auto_1477599 ?auto_1477600 ?auto_1477601 ?auto_1477602 ?auto_1477603 ?auto_1477604 ?auto_1477605 ?auto_1477606 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1477735 - SURFACE
      ?auto_1477736 - SURFACE
      ?auto_1477737 - SURFACE
      ?auto_1477739 - SURFACE
      ?auto_1477738 - SURFACE
      ?auto_1477740 - SURFACE
      ?auto_1477741 - SURFACE
      ?auto_1477742 - SURFACE
      ?auto_1477743 - SURFACE
      ?auto_1477744 - SURFACE
      ?auto_1477745 - SURFACE
      ?auto_1477746 - SURFACE
      ?auto_1477747 - SURFACE
      ?auto_1477748 - SURFACE
    )
    :vars
    (
      ?auto_1477750 - HOIST
      ?auto_1477749 - PLACE
      ?auto_1477751 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1477750 ?auto_1477749 ) ( SURFACE-AT ?auto_1477747 ?auto_1477749 ) ( CLEAR ?auto_1477747 ) ( IS-CRATE ?auto_1477748 ) ( not ( = ?auto_1477747 ?auto_1477748 ) ) ( TRUCK-AT ?auto_1477751 ?auto_1477749 ) ( AVAILABLE ?auto_1477750 ) ( IN ?auto_1477748 ?auto_1477751 ) ( ON ?auto_1477747 ?auto_1477746 ) ( not ( = ?auto_1477746 ?auto_1477747 ) ) ( not ( = ?auto_1477746 ?auto_1477748 ) ) ( ON ?auto_1477736 ?auto_1477735 ) ( ON ?auto_1477737 ?auto_1477736 ) ( ON ?auto_1477739 ?auto_1477737 ) ( ON ?auto_1477738 ?auto_1477739 ) ( ON ?auto_1477740 ?auto_1477738 ) ( ON ?auto_1477741 ?auto_1477740 ) ( ON ?auto_1477742 ?auto_1477741 ) ( ON ?auto_1477743 ?auto_1477742 ) ( ON ?auto_1477744 ?auto_1477743 ) ( ON ?auto_1477745 ?auto_1477744 ) ( ON ?auto_1477746 ?auto_1477745 ) ( not ( = ?auto_1477735 ?auto_1477736 ) ) ( not ( = ?auto_1477735 ?auto_1477737 ) ) ( not ( = ?auto_1477735 ?auto_1477739 ) ) ( not ( = ?auto_1477735 ?auto_1477738 ) ) ( not ( = ?auto_1477735 ?auto_1477740 ) ) ( not ( = ?auto_1477735 ?auto_1477741 ) ) ( not ( = ?auto_1477735 ?auto_1477742 ) ) ( not ( = ?auto_1477735 ?auto_1477743 ) ) ( not ( = ?auto_1477735 ?auto_1477744 ) ) ( not ( = ?auto_1477735 ?auto_1477745 ) ) ( not ( = ?auto_1477735 ?auto_1477746 ) ) ( not ( = ?auto_1477735 ?auto_1477747 ) ) ( not ( = ?auto_1477735 ?auto_1477748 ) ) ( not ( = ?auto_1477736 ?auto_1477737 ) ) ( not ( = ?auto_1477736 ?auto_1477739 ) ) ( not ( = ?auto_1477736 ?auto_1477738 ) ) ( not ( = ?auto_1477736 ?auto_1477740 ) ) ( not ( = ?auto_1477736 ?auto_1477741 ) ) ( not ( = ?auto_1477736 ?auto_1477742 ) ) ( not ( = ?auto_1477736 ?auto_1477743 ) ) ( not ( = ?auto_1477736 ?auto_1477744 ) ) ( not ( = ?auto_1477736 ?auto_1477745 ) ) ( not ( = ?auto_1477736 ?auto_1477746 ) ) ( not ( = ?auto_1477736 ?auto_1477747 ) ) ( not ( = ?auto_1477736 ?auto_1477748 ) ) ( not ( = ?auto_1477737 ?auto_1477739 ) ) ( not ( = ?auto_1477737 ?auto_1477738 ) ) ( not ( = ?auto_1477737 ?auto_1477740 ) ) ( not ( = ?auto_1477737 ?auto_1477741 ) ) ( not ( = ?auto_1477737 ?auto_1477742 ) ) ( not ( = ?auto_1477737 ?auto_1477743 ) ) ( not ( = ?auto_1477737 ?auto_1477744 ) ) ( not ( = ?auto_1477737 ?auto_1477745 ) ) ( not ( = ?auto_1477737 ?auto_1477746 ) ) ( not ( = ?auto_1477737 ?auto_1477747 ) ) ( not ( = ?auto_1477737 ?auto_1477748 ) ) ( not ( = ?auto_1477739 ?auto_1477738 ) ) ( not ( = ?auto_1477739 ?auto_1477740 ) ) ( not ( = ?auto_1477739 ?auto_1477741 ) ) ( not ( = ?auto_1477739 ?auto_1477742 ) ) ( not ( = ?auto_1477739 ?auto_1477743 ) ) ( not ( = ?auto_1477739 ?auto_1477744 ) ) ( not ( = ?auto_1477739 ?auto_1477745 ) ) ( not ( = ?auto_1477739 ?auto_1477746 ) ) ( not ( = ?auto_1477739 ?auto_1477747 ) ) ( not ( = ?auto_1477739 ?auto_1477748 ) ) ( not ( = ?auto_1477738 ?auto_1477740 ) ) ( not ( = ?auto_1477738 ?auto_1477741 ) ) ( not ( = ?auto_1477738 ?auto_1477742 ) ) ( not ( = ?auto_1477738 ?auto_1477743 ) ) ( not ( = ?auto_1477738 ?auto_1477744 ) ) ( not ( = ?auto_1477738 ?auto_1477745 ) ) ( not ( = ?auto_1477738 ?auto_1477746 ) ) ( not ( = ?auto_1477738 ?auto_1477747 ) ) ( not ( = ?auto_1477738 ?auto_1477748 ) ) ( not ( = ?auto_1477740 ?auto_1477741 ) ) ( not ( = ?auto_1477740 ?auto_1477742 ) ) ( not ( = ?auto_1477740 ?auto_1477743 ) ) ( not ( = ?auto_1477740 ?auto_1477744 ) ) ( not ( = ?auto_1477740 ?auto_1477745 ) ) ( not ( = ?auto_1477740 ?auto_1477746 ) ) ( not ( = ?auto_1477740 ?auto_1477747 ) ) ( not ( = ?auto_1477740 ?auto_1477748 ) ) ( not ( = ?auto_1477741 ?auto_1477742 ) ) ( not ( = ?auto_1477741 ?auto_1477743 ) ) ( not ( = ?auto_1477741 ?auto_1477744 ) ) ( not ( = ?auto_1477741 ?auto_1477745 ) ) ( not ( = ?auto_1477741 ?auto_1477746 ) ) ( not ( = ?auto_1477741 ?auto_1477747 ) ) ( not ( = ?auto_1477741 ?auto_1477748 ) ) ( not ( = ?auto_1477742 ?auto_1477743 ) ) ( not ( = ?auto_1477742 ?auto_1477744 ) ) ( not ( = ?auto_1477742 ?auto_1477745 ) ) ( not ( = ?auto_1477742 ?auto_1477746 ) ) ( not ( = ?auto_1477742 ?auto_1477747 ) ) ( not ( = ?auto_1477742 ?auto_1477748 ) ) ( not ( = ?auto_1477743 ?auto_1477744 ) ) ( not ( = ?auto_1477743 ?auto_1477745 ) ) ( not ( = ?auto_1477743 ?auto_1477746 ) ) ( not ( = ?auto_1477743 ?auto_1477747 ) ) ( not ( = ?auto_1477743 ?auto_1477748 ) ) ( not ( = ?auto_1477744 ?auto_1477745 ) ) ( not ( = ?auto_1477744 ?auto_1477746 ) ) ( not ( = ?auto_1477744 ?auto_1477747 ) ) ( not ( = ?auto_1477744 ?auto_1477748 ) ) ( not ( = ?auto_1477745 ?auto_1477746 ) ) ( not ( = ?auto_1477745 ?auto_1477747 ) ) ( not ( = ?auto_1477745 ?auto_1477748 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1477746 ?auto_1477747 ?auto_1477748 )
      ( MAKE-13CRATE-VERIFY ?auto_1477735 ?auto_1477736 ?auto_1477737 ?auto_1477739 ?auto_1477738 ?auto_1477740 ?auto_1477741 ?auto_1477742 ?auto_1477743 ?auto_1477744 ?auto_1477745 ?auto_1477746 ?auto_1477747 ?auto_1477748 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1477891 - SURFACE
      ?auto_1477892 - SURFACE
      ?auto_1477893 - SURFACE
      ?auto_1477895 - SURFACE
      ?auto_1477894 - SURFACE
      ?auto_1477896 - SURFACE
      ?auto_1477897 - SURFACE
      ?auto_1477898 - SURFACE
      ?auto_1477899 - SURFACE
      ?auto_1477900 - SURFACE
      ?auto_1477901 - SURFACE
      ?auto_1477902 - SURFACE
      ?auto_1477903 - SURFACE
      ?auto_1477904 - SURFACE
    )
    :vars
    (
      ?auto_1477905 - HOIST
      ?auto_1477907 - PLACE
      ?auto_1477906 - TRUCK
      ?auto_1477908 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1477905 ?auto_1477907 ) ( SURFACE-AT ?auto_1477903 ?auto_1477907 ) ( CLEAR ?auto_1477903 ) ( IS-CRATE ?auto_1477904 ) ( not ( = ?auto_1477903 ?auto_1477904 ) ) ( AVAILABLE ?auto_1477905 ) ( IN ?auto_1477904 ?auto_1477906 ) ( ON ?auto_1477903 ?auto_1477902 ) ( not ( = ?auto_1477902 ?auto_1477903 ) ) ( not ( = ?auto_1477902 ?auto_1477904 ) ) ( TRUCK-AT ?auto_1477906 ?auto_1477908 ) ( not ( = ?auto_1477908 ?auto_1477907 ) ) ( ON ?auto_1477892 ?auto_1477891 ) ( ON ?auto_1477893 ?auto_1477892 ) ( ON ?auto_1477895 ?auto_1477893 ) ( ON ?auto_1477894 ?auto_1477895 ) ( ON ?auto_1477896 ?auto_1477894 ) ( ON ?auto_1477897 ?auto_1477896 ) ( ON ?auto_1477898 ?auto_1477897 ) ( ON ?auto_1477899 ?auto_1477898 ) ( ON ?auto_1477900 ?auto_1477899 ) ( ON ?auto_1477901 ?auto_1477900 ) ( ON ?auto_1477902 ?auto_1477901 ) ( not ( = ?auto_1477891 ?auto_1477892 ) ) ( not ( = ?auto_1477891 ?auto_1477893 ) ) ( not ( = ?auto_1477891 ?auto_1477895 ) ) ( not ( = ?auto_1477891 ?auto_1477894 ) ) ( not ( = ?auto_1477891 ?auto_1477896 ) ) ( not ( = ?auto_1477891 ?auto_1477897 ) ) ( not ( = ?auto_1477891 ?auto_1477898 ) ) ( not ( = ?auto_1477891 ?auto_1477899 ) ) ( not ( = ?auto_1477891 ?auto_1477900 ) ) ( not ( = ?auto_1477891 ?auto_1477901 ) ) ( not ( = ?auto_1477891 ?auto_1477902 ) ) ( not ( = ?auto_1477891 ?auto_1477903 ) ) ( not ( = ?auto_1477891 ?auto_1477904 ) ) ( not ( = ?auto_1477892 ?auto_1477893 ) ) ( not ( = ?auto_1477892 ?auto_1477895 ) ) ( not ( = ?auto_1477892 ?auto_1477894 ) ) ( not ( = ?auto_1477892 ?auto_1477896 ) ) ( not ( = ?auto_1477892 ?auto_1477897 ) ) ( not ( = ?auto_1477892 ?auto_1477898 ) ) ( not ( = ?auto_1477892 ?auto_1477899 ) ) ( not ( = ?auto_1477892 ?auto_1477900 ) ) ( not ( = ?auto_1477892 ?auto_1477901 ) ) ( not ( = ?auto_1477892 ?auto_1477902 ) ) ( not ( = ?auto_1477892 ?auto_1477903 ) ) ( not ( = ?auto_1477892 ?auto_1477904 ) ) ( not ( = ?auto_1477893 ?auto_1477895 ) ) ( not ( = ?auto_1477893 ?auto_1477894 ) ) ( not ( = ?auto_1477893 ?auto_1477896 ) ) ( not ( = ?auto_1477893 ?auto_1477897 ) ) ( not ( = ?auto_1477893 ?auto_1477898 ) ) ( not ( = ?auto_1477893 ?auto_1477899 ) ) ( not ( = ?auto_1477893 ?auto_1477900 ) ) ( not ( = ?auto_1477893 ?auto_1477901 ) ) ( not ( = ?auto_1477893 ?auto_1477902 ) ) ( not ( = ?auto_1477893 ?auto_1477903 ) ) ( not ( = ?auto_1477893 ?auto_1477904 ) ) ( not ( = ?auto_1477895 ?auto_1477894 ) ) ( not ( = ?auto_1477895 ?auto_1477896 ) ) ( not ( = ?auto_1477895 ?auto_1477897 ) ) ( not ( = ?auto_1477895 ?auto_1477898 ) ) ( not ( = ?auto_1477895 ?auto_1477899 ) ) ( not ( = ?auto_1477895 ?auto_1477900 ) ) ( not ( = ?auto_1477895 ?auto_1477901 ) ) ( not ( = ?auto_1477895 ?auto_1477902 ) ) ( not ( = ?auto_1477895 ?auto_1477903 ) ) ( not ( = ?auto_1477895 ?auto_1477904 ) ) ( not ( = ?auto_1477894 ?auto_1477896 ) ) ( not ( = ?auto_1477894 ?auto_1477897 ) ) ( not ( = ?auto_1477894 ?auto_1477898 ) ) ( not ( = ?auto_1477894 ?auto_1477899 ) ) ( not ( = ?auto_1477894 ?auto_1477900 ) ) ( not ( = ?auto_1477894 ?auto_1477901 ) ) ( not ( = ?auto_1477894 ?auto_1477902 ) ) ( not ( = ?auto_1477894 ?auto_1477903 ) ) ( not ( = ?auto_1477894 ?auto_1477904 ) ) ( not ( = ?auto_1477896 ?auto_1477897 ) ) ( not ( = ?auto_1477896 ?auto_1477898 ) ) ( not ( = ?auto_1477896 ?auto_1477899 ) ) ( not ( = ?auto_1477896 ?auto_1477900 ) ) ( not ( = ?auto_1477896 ?auto_1477901 ) ) ( not ( = ?auto_1477896 ?auto_1477902 ) ) ( not ( = ?auto_1477896 ?auto_1477903 ) ) ( not ( = ?auto_1477896 ?auto_1477904 ) ) ( not ( = ?auto_1477897 ?auto_1477898 ) ) ( not ( = ?auto_1477897 ?auto_1477899 ) ) ( not ( = ?auto_1477897 ?auto_1477900 ) ) ( not ( = ?auto_1477897 ?auto_1477901 ) ) ( not ( = ?auto_1477897 ?auto_1477902 ) ) ( not ( = ?auto_1477897 ?auto_1477903 ) ) ( not ( = ?auto_1477897 ?auto_1477904 ) ) ( not ( = ?auto_1477898 ?auto_1477899 ) ) ( not ( = ?auto_1477898 ?auto_1477900 ) ) ( not ( = ?auto_1477898 ?auto_1477901 ) ) ( not ( = ?auto_1477898 ?auto_1477902 ) ) ( not ( = ?auto_1477898 ?auto_1477903 ) ) ( not ( = ?auto_1477898 ?auto_1477904 ) ) ( not ( = ?auto_1477899 ?auto_1477900 ) ) ( not ( = ?auto_1477899 ?auto_1477901 ) ) ( not ( = ?auto_1477899 ?auto_1477902 ) ) ( not ( = ?auto_1477899 ?auto_1477903 ) ) ( not ( = ?auto_1477899 ?auto_1477904 ) ) ( not ( = ?auto_1477900 ?auto_1477901 ) ) ( not ( = ?auto_1477900 ?auto_1477902 ) ) ( not ( = ?auto_1477900 ?auto_1477903 ) ) ( not ( = ?auto_1477900 ?auto_1477904 ) ) ( not ( = ?auto_1477901 ?auto_1477902 ) ) ( not ( = ?auto_1477901 ?auto_1477903 ) ) ( not ( = ?auto_1477901 ?auto_1477904 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1477902 ?auto_1477903 ?auto_1477904 )
      ( MAKE-13CRATE-VERIFY ?auto_1477891 ?auto_1477892 ?auto_1477893 ?auto_1477895 ?auto_1477894 ?auto_1477896 ?auto_1477897 ?auto_1477898 ?auto_1477899 ?auto_1477900 ?auto_1477901 ?auto_1477902 ?auto_1477903 ?auto_1477904 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478060 - SURFACE
      ?auto_1478061 - SURFACE
      ?auto_1478062 - SURFACE
      ?auto_1478064 - SURFACE
      ?auto_1478063 - SURFACE
      ?auto_1478065 - SURFACE
      ?auto_1478066 - SURFACE
      ?auto_1478067 - SURFACE
      ?auto_1478068 - SURFACE
      ?auto_1478069 - SURFACE
      ?auto_1478070 - SURFACE
      ?auto_1478071 - SURFACE
      ?auto_1478072 - SURFACE
      ?auto_1478073 - SURFACE
    )
    :vars
    (
      ?auto_1478077 - HOIST
      ?auto_1478076 - PLACE
      ?auto_1478078 - TRUCK
      ?auto_1478074 - PLACE
      ?auto_1478075 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478077 ?auto_1478076 ) ( SURFACE-AT ?auto_1478072 ?auto_1478076 ) ( CLEAR ?auto_1478072 ) ( IS-CRATE ?auto_1478073 ) ( not ( = ?auto_1478072 ?auto_1478073 ) ) ( AVAILABLE ?auto_1478077 ) ( ON ?auto_1478072 ?auto_1478071 ) ( not ( = ?auto_1478071 ?auto_1478072 ) ) ( not ( = ?auto_1478071 ?auto_1478073 ) ) ( TRUCK-AT ?auto_1478078 ?auto_1478074 ) ( not ( = ?auto_1478074 ?auto_1478076 ) ) ( HOIST-AT ?auto_1478075 ?auto_1478074 ) ( LIFTING ?auto_1478075 ?auto_1478073 ) ( not ( = ?auto_1478077 ?auto_1478075 ) ) ( ON ?auto_1478061 ?auto_1478060 ) ( ON ?auto_1478062 ?auto_1478061 ) ( ON ?auto_1478064 ?auto_1478062 ) ( ON ?auto_1478063 ?auto_1478064 ) ( ON ?auto_1478065 ?auto_1478063 ) ( ON ?auto_1478066 ?auto_1478065 ) ( ON ?auto_1478067 ?auto_1478066 ) ( ON ?auto_1478068 ?auto_1478067 ) ( ON ?auto_1478069 ?auto_1478068 ) ( ON ?auto_1478070 ?auto_1478069 ) ( ON ?auto_1478071 ?auto_1478070 ) ( not ( = ?auto_1478060 ?auto_1478061 ) ) ( not ( = ?auto_1478060 ?auto_1478062 ) ) ( not ( = ?auto_1478060 ?auto_1478064 ) ) ( not ( = ?auto_1478060 ?auto_1478063 ) ) ( not ( = ?auto_1478060 ?auto_1478065 ) ) ( not ( = ?auto_1478060 ?auto_1478066 ) ) ( not ( = ?auto_1478060 ?auto_1478067 ) ) ( not ( = ?auto_1478060 ?auto_1478068 ) ) ( not ( = ?auto_1478060 ?auto_1478069 ) ) ( not ( = ?auto_1478060 ?auto_1478070 ) ) ( not ( = ?auto_1478060 ?auto_1478071 ) ) ( not ( = ?auto_1478060 ?auto_1478072 ) ) ( not ( = ?auto_1478060 ?auto_1478073 ) ) ( not ( = ?auto_1478061 ?auto_1478062 ) ) ( not ( = ?auto_1478061 ?auto_1478064 ) ) ( not ( = ?auto_1478061 ?auto_1478063 ) ) ( not ( = ?auto_1478061 ?auto_1478065 ) ) ( not ( = ?auto_1478061 ?auto_1478066 ) ) ( not ( = ?auto_1478061 ?auto_1478067 ) ) ( not ( = ?auto_1478061 ?auto_1478068 ) ) ( not ( = ?auto_1478061 ?auto_1478069 ) ) ( not ( = ?auto_1478061 ?auto_1478070 ) ) ( not ( = ?auto_1478061 ?auto_1478071 ) ) ( not ( = ?auto_1478061 ?auto_1478072 ) ) ( not ( = ?auto_1478061 ?auto_1478073 ) ) ( not ( = ?auto_1478062 ?auto_1478064 ) ) ( not ( = ?auto_1478062 ?auto_1478063 ) ) ( not ( = ?auto_1478062 ?auto_1478065 ) ) ( not ( = ?auto_1478062 ?auto_1478066 ) ) ( not ( = ?auto_1478062 ?auto_1478067 ) ) ( not ( = ?auto_1478062 ?auto_1478068 ) ) ( not ( = ?auto_1478062 ?auto_1478069 ) ) ( not ( = ?auto_1478062 ?auto_1478070 ) ) ( not ( = ?auto_1478062 ?auto_1478071 ) ) ( not ( = ?auto_1478062 ?auto_1478072 ) ) ( not ( = ?auto_1478062 ?auto_1478073 ) ) ( not ( = ?auto_1478064 ?auto_1478063 ) ) ( not ( = ?auto_1478064 ?auto_1478065 ) ) ( not ( = ?auto_1478064 ?auto_1478066 ) ) ( not ( = ?auto_1478064 ?auto_1478067 ) ) ( not ( = ?auto_1478064 ?auto_1478068 ) ) ( not ( = ?auto_1478064 ?auto_1478069 ) ) ( not ( = ?auto_1478064 ?auto_1478070 ) ) ( not ( = ?auto_1478064 ?auto_1478071 ) ) ( not ( = ?auto_1478064 ?auto_1478072 ) ) ( not ( = ?auto_1478064 ?auto_1478073 ) ) ( not ( = ?auto_1478063 ?auto_1478065 ) ) ( not ( = ?auto_1478063 ?auto_1478066 ) ) ( not ( = ?auto_1478063 ?auto_1478067 ) ) ( not ( = ?auto_1478063 ?auto_1478068 ) ) ( not ( = ?auto_1478063 ?auto_1478069 ) ) ( not ( = ?auto_1478063 ?auto_1478070 ) ) ( not ( = ?auto_1478063 ?auto_1478071 ) ) ( not ( = ?auto_1478063 ?auto_1478072 ) ) ( not ( = ?auto_1478063 ?auto_1478073 ) ) ( not ( = ?auto_1478065 ?auto_1478066 ) ) ( not ( = ?auto_1478065 ?auto_1478067 ) ) ( not ( = ?auto_1478065 ?auto_1478068 ) ) ( not ( = ?auto_1478065 ?auto_1478069 ) ) ( not ( = ?auto_1478065 ?auto_1478070 ) ) ( not ( = ?auto_1478065 ?auto_1478071 ) ) ( not ( = ?auto_1478065 ?auto_1478072 ) ) ( not ( = ?auto_1478065 ?auto_1478073 ) ) ( not ( = ?auto_1478066 ?auto_1478067 ) ) ( not ( = ?auto_1478066 ?auto_1478068 ) ) ( not ( = ?auto_1478066 ?auto_1478069 ) ) ( not ( = ?auto_1478066 ?auto_1478070 ) ) ( not ( = ?auto_1478066 ?auto_1478071 ) ) ( not ( = ?auto_1478066 ?auto_1478072 ) ) ( not ( = ?auto_1478066 ?auto_1478073 ) ) ( not ( = ?auto_1478067 ?auto_1478068 ) ) ( not ( = ?auto_1478067 ?auto_1478069 ) ) ( not ( = ?auto_1478067 ?auto_1478070 ) ) ( not ( = ?auto_1478067 ?auto_1478071 ) ) ( not ( = ?auto_1478067 ?auto_1478072 ) ) ( not ( = ?auto_1478067 ?auto_1478073 ) ) ( not ( = ?auto_1478068 ?auto_1478069 ) ) ( not ( = ?auto_1478068 ?auto_1478070 ) ) ( not ( = ?auto_1478068 ?auto_1478071 ) ) ( not ( = ?auto_1478068 ?auto_1478072 ) ) ( not ( = ?auto_1478068 ?auto_1478073 ) ) ( not ( = ?auto_1478069 ?auto_1478070 ) ) ( not ( = ?auto_1478069 ?auto_1478071 ) ) ( not ( = ?auto_1478069 ?auto_1478072 ) ) ( not ( = ?auto_1478069 ?auto_1478073 ) ) ( not ( = ?auto_1478070 ?auto_1478071 ) ) ( not ( = ?auto_1478070 ?auto_1478072 ) ) ( not ( = ?auto_1478070 ?auto_1478073 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478071 ?auto_1478072 ?auto_1478073 )
      ( MAKE-13CRATE-VERIFY ?auto_1478060 ?auto_1478061 ?auto_1478062 ?auto_1478064 ?auto_1478063 ?auto_1478065 ?auto_1478066 ?auto_1478067 ?auto_1478068 ?auto_1478069 ?auto_1478070 ?auto_1478071 ?auto_1478072 ?auto_1478073 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478242 - SURFACE
      ?auto_1478243 - SURFACE
      ?auto_1478244 - SURFACE
      ?auto_1478246 - SURFACE
      ?auto_1478245 - SURFACE
      ?auto_1478247 - SURFACE
      ?auto_1478248 - SURFACE
      ?auto_1478249 - SURFACE
      ?auto_1478250 - SURFACE
      ?auto_1478251 - SURFACE
      ?auto_1478252 - SURFACE
      ?auto_1478253 - SURFACE
      ?auto_1478254 - SURFACE
      ?auto_1478255 - SURFACE
    )
    :vars
    (
      ?auto_1478259 - HOIST
      ?auto_1478257 - PLACE
      ?auto_1478261 - TRUCK
      ?auto_1478256 - PLACE
      ?auto_1478258 - HOIST
      ?auto_1478260 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478259 ?auto_1478257 ) ( SURFACE-AT ?auto_1478254 ?auto_1478257 ) ( CLEAR ?auto_1478254 ) ( IS-CRATE ?auto_1478255 ) ( not ( = ?auto_1478254 ?auto_1478255 ) ) ( AVAILABLE ?auto_1478259 ) ( ON ?auto_1478254 ?auto_1478253 ) ( not ( = ?auto_1478253 ?auto_1478254 ) ) ( not ( = ?auto_1478253 ?auto_1478255 ) ) ( TRUCK-AT ?auto_1478261 ?auto_1478256 ) ( not ( = ?auto_1478256 ?auto_1478257 ) ) ( HOIST-AT ?auto_1478258 ?auto_1478256 ) ( not ( = ?auto_1478259 ?auto_1478258 ) ) ( AVAILABLE ?auto_1478258 ) ( SURFACE-AT ?auto_1478255 ?auto_1478256 ) ( ON ?auto_1478255 ?auto_1478260 ) ( CLEAR ?auto_1478255 ) ( not ( = ?auto_1478254 ?auto_1478260 ) ) ( not ( = ?auto_1478255 ?auto_1478260 ) ) ( not ( = ?auto_1478253 ?auto_1478260 ) ) ( ON ?auto_1478243 ?auto_1478242 ) ( ON ?auto_1478244 ?auto_1478243 ) ( ON ?auto_1478246 ?auto_1478244 ) ( ON ?auto_1478245 ?auto_1478246 ) ( ON ?auto_1478247 ?auto_1478245 ) ( ON ?auto_1478248 ?auto_1478247 ) ( ON ?auto_1478249 ?auto_1478248 ) ( ON ?auto_1478250 ?auto_1478249 ) ( ON ?auto_1478251 ?auto_1478250 ) ( ON ?auto_1478252 ?auto_1478251 ) ( ON ?auto_1478253 ?auto_1478252 ) ( not ( = ?auto_1478242 ?auto_1478243 ) ) ( not ( = ?auto_1478242 ?auto_1478244 ) ) ( not ( = ?auto_1478242 ?auto_1478246 ) ) ( not ( = ?auto_1478242 ?auto_1478245 ) ) ( not ( = ?auto_1478242 ?auto_1478247 ) ) ( not ( = ?auto_1478242 ?auto_1478248 ) ) ( not ( = ?auto_1478242 ?auto_1478249 ) ) ( not ( = ?auto_1478242 ?auto_1478250 ) ) ( not ( = ?auto_1478242 ?auto_1478251 ) ) ( not ( = ?auto_1478242 ?auto_1478252 ) ) ( not ( = ?auto_1478242 ?auto_1478253 ) ) ( not ( = ?auto_1478242 ?auto_1478254 ) ) ( not ( = ?auto_1478242 ?auto_1478255 ) ) ( not ( = ?auto_1478242 ?auto_1478260 ) ) ( not ( = ?auto_1478243 ?auto_1478244 ) ) ( not ( = ?auto_1478243 ?auto_1478246 ) ) ( not ( = ?auto_1478243 ?auto_1478245 ) ) ( not ( = ?auto_1478243 ?auto_1478247 ) ) ( not ( = ?auto_1478243 ?auto_1478248 ) ) ( not ( = ?auto_1478243 ?auto_1478249 ) ) ( not ( = ?auto_1478243 ?auto_1478250 ) ) ( not ( = ?auto_1478243 ?auto_1478251 ) ) ( not ( = ?auto_1478243 ?auto_1478252 ) ) ( not ( = ?auto_1478243 ?auto_1478253 ) ) ( not ( = ?auto_1478243 ?auto_1478254 ) ) ( not ( = ?auto_1478243 ?auto_1478255 ) ) ( not ( = ?auto_1478243 ?auto_1478260 ) ) ( not ( = ?auto_1478244 ?auto_1478246 ) ) ( not ( = ?auto_1478244 ?auto_1478245 ) ) ( not ( = ?auto_1478244 ?auto_1478247 ) ) ( not ( = ?auto_1478244 ?auto_1478248 ) ) ( not ( = ?auto_1478244 ?auto_1478249 ) ) ( not ( = ?auto_1478244 ?auto_1478250 ) ) ( not ( = ?auto_1478244 ?auto_1478251 ) ) ( not ( = ?auto_1478244 ?auto_1478252 ) ) ( not ( = ?auto_1478244 ?auto_1478253 ) ) ( not ( = ?auto_1478244 ?auto_1478254 ) ) ( not ( = ?auto_1478244 ?auto_1478255 ) ) ( not ( = ?auto_1478244 ?auto_1478260 ) ) ( not ( = ?auto_1478246 ?auto_1478245 ) ) ( not ( = ?auto_1478246 ?auto_1478247 ) ) ( not ( = ?auto_1478246 ?auto_1478248 ) ) ( not ( = ?auto_1478246 ?auto_1478249 ) ) ( not ( = ?auto_1478246 ?auto_1478250 ) ) ( not ( = ?auto_1478246 ?auto_1478251 ) ) ( not ( = ?auto_1478246 ?auto_1478252 ) ) ( not ( = ?auto_1478246 ?auto_1478253 ) ) ( not ( = ?auto_1478246 ?auto_1478254 ) ) ( not ( = ?auto_1478246 ?auto_1478255 ) ) ( not ( = ?auto_1478246 ?auto_1478260 ) ) ( not ( = ?auto_1478245 ?auto_1478247 ) ) ( not ( = ?auto_1478245 ?auto_1478248 ) ) ( not ( = ?auto_1478245 ?auto_1478249 ) ) ( not ( = ?auto_1478245 ?auto_1478250 ) ) ( not ( = ?auto_1478245 ?auto_1478251 ) ) ( not ( = ?auto_1478245 ?auto_1478252 ) ) ( not ( = ?auto_1478245 ?auto_1478253 ) ) ( not ( = ?auto_1478245 ?auto_1478254 ) ) ( not ( = ?auto_1478245 ?auto_1478255 ) ) ( not ( = ?auto_1478245 ?auto_1478260 ) ) ( not ( = ?auto_1478247 ?auto_1478248 ) ) ( not ( = ?auto_1478247 ?auto_1478249 ) ) ( not ( = ?auto_1478247 ?auto_1478250 ) ) ( not ( = ?auto_1478247 ?auto_1478251 ) ) ( not ( = ?auto_1478247 ?auto_1478252 ) ) ( not ( = ?auto_1478247 ?auto_1478253 ) ) ( not ( = ?auto_1478247 ?auto_1478254 ) ) ( not ( = ?auto_1478247 ?auto_1478255 ) ) ( not ( = ?auto_1478247 ?auto_1478260 ) ) ( not ( = ?auto_1478248 ?auto_1478249 ) ) ( not ( = ?auto_1478248 ?auto_1478250 ) ) ( not ( = ?auto_1478248 ?auto_1478251 ) ) ( not ( = ?auto_1478248 ?auto_1478252 ) ) ( not ( = ?auto_1478248 ?auto_1478253 ) ) ( not ( = ?auto_1478248 ?auto_1478254 ) ) ( not ( = ?auto_1478248 ?auto_1478255 ) ) ( not ( = ?auto_1478248 ?auto_1478260 ) ) ( not ( = ?auto_1478249 ?auto_1478250 ) ) ( not ( = ?auto_1478249 ?auto_1478251 ) ) ( not ( = ?auto_1478249 ?auto_1478252 ) ) ( not ( = ?auto_1478249 ?auto_1478253 ) ) ( not ( = ?auto_1478249 ?auto_1478254 ) ) ( not ( = ?auto_1478249 ?auto_1478255 ) ) ( not ( = ?auto_1478249 ?auto_1478260 ) ) ( not ( = ?auto_1478250 ?auto_1478251 ) ) ( not ( = ?auto_1478250 ?auto_1478252 ) ) ( not ( = ?auto_1478250 ?auto_1478253 ) ) ( not ( = ?auto_1478250 ?auto_1478254 ) ) ( not ( = ?auto_1478250 ?auto_1478255 ) ) ( not ( = ?auto_1478250 ?auto_1478260 ) ) ( not ( = ?auto_1478251 ?auto_1478252 ) ) ( not ( = ?auto_1478251 ?auto_1478253 ) ) ( not ( = ?auto_1478251 ?auto_1478254 ) ) ( not ( = ?auto_1478251 ?auto_1478255 ) ) ( not ( = ?auto_1478251 ?auto_1478260 ) ) ( not ( = ?auto_1478252 ?auto_1478253 ) ) ( not ( = ?auto_1478252 ?auto_1478254 ) ) ( not ( = ?auto_1478252 ?auto_1478255 ) ) ( not ( = ?auto_1478252 ?auto_1478260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478253 ?auto_1478254 ?auto_1478255 )
      ( MAKE-13CRATE-VERIFY ?auto_1478242 ?auto_1478243 ?auto_1478244 ?auto_1478246 ?auto_1478245 ?auto_1478247 ?auto_1478248 ?auto_1478249 ?auto_1478250 ?auto_1478251 ?auto_1478252 ?auto_1478253 ?auto_1478254 ?auto_1478255 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478425 - SURFACE
      ?auto_1478426 - SURFACE
      ?auto_1478427 - SURFACE
      ?auto_1478429 - SURFACE
      ?auto_1478428 - SURFACE
      ?auto_1478430 - SURFACE
      ?auto_1478431 - SURFACE
      ?auto_1478432 - SURFACE
      ?auto_1478433 - SURFACE
      ?auto_1478434 - SURFACE
      ?auto_1478435 - SURFACE
      ?auto_1478436 - SURFACE
      ?auto_1478437 - SURFACE
      ?auto_1478438 - SURFACE
    )
    :vars
    (
      ?auto_1478444 - HOIST
      ?auto_1478440 - PLACE
      ?auto_1478443 - PLACE
      ?auto_1478441 - HOIST
      ?auto_1478439 - SURFACE
      ?auto_1478442 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478444 ?auto_1478440 ) ( SURFACE-AT ?auto_1478437 ?auto_1478440 ) ( CLEAR ?auto_1478437 ) ( IS-CRATE ?auto_1478438 ) ( not ( = ?auto_1478437 ?auto_1478438 ) ) ( AVAILABLE ?auto_1478444 ) ( ON ?auto_1478437 ?auto_1478436 ) ( not ( = ?auto_1478436 ?auto_1478437 ) ) ( not ( = ?auto_1478436 ?auto_1478438 ) ) ( not ( = ?auto_1478443 ?auto_1478440 ) ) ( HOIST-AT ?auto_1478441 ?auto_1478443 ) ( not ( = ?auto_1478444 ?auto_1478441 ) ) ( AVAILABLE ?auto_1478441 ) ( SURFACE-AT ?auto_1478438 ?auto_1478443 ) ( ON ?auto_1478438 ?auto_1478439 ) ( CLEAR ?auto_1478438 ) ( not ( = ?auto_1478437 ?auto_1478439 ) ) ( not ( = ?auto_1478438 ?auto_1478439 ) ) ( not ( = ?auto_1478436 ?auto_1478439 ) ) ( TRUCK-AT ?auto_1478442 ?auto_1478440 ) ( ON ?auto_1478426 ?auto_1478425 ) ( ON ?auto_1478427 ?auto_1478426 ) ( ON ?auto_1478429 ?auto_1478427 ) ( ON ?auto_1478428 ?auto_1478429 ) ( ON ?auto_1478430 ?auto_1478428 ) ( ON ?auto_1478431 ?auto_1478430 ) ( ON ?auto_1478432 ?auto_1478431 ) ( ON ?auto_1478433 ?auto_1478432 ) ( ON ?auto_1478434 ?auto_1478433 ) ( ON ?auto_1478435 ?auto_1478434 ) ( ON ?auto_1478436 ?auto_1478435 ) ( not ( = ?auto_1478425 ?auto_1478426 ) ) ( not ( = ?auto_1478425 ?auto_1478427 ) ) ( not ( = ?auto_1478425 ?auto_1478429 ) ) ( not ( = ?auto_1478425 ?auto_1478428 ) ) ( not ( = ?auto_1478425 ?auto_1478430 ) ) ( not ( = ?auto_1478425 ?auto_1478431 ) ) ( not ( = ?auto_1478425 ?auto_1478432 ) ) ( not ( = ?auto_1478425 ?auto_1478433 ) ) ( not ( = ?auto_1478425 ?auto_1478434 ) ) ( not ( = ?auto_1478425 ?auto_1478435 ) ) ( not ( = ?auto_1478425 ?auto_1478436 ) ) ( not ( = ?auto_1478425 ?auto_1478437 ) ) ( not ( = ?auto_1478425 ?auto_1478438 ) ) ( not ( = ?auto_1478425 ?auto_1478439 ) ) ( not ( = ?auto_1478426 ?auto_1478427 ) ) ( not ( = ?auto_1478426 ?auto_1478429 ) ) ( not ( = ?auto_1478426 ?auto_1478428 ) ) ( not ( = ?auto_1478426 ?auto_1478430 ) ) ( not ( = ?auto_1478426 ?auto_1478431 ) ) ( not ( = ?auto_1478426 ?auto_1478432 ) ) ( not ( = ?auto_1478426 ?auto_1478433 ) ) ( not ( = ?auto_1478426 ?auto_1478434 ) ) ( not ( = ?auto_1478426 ?auto_1478435 ) ) ( not ( = ?auto_1478426 ?auto_1478436 ) ) ( not ( = ?auto_1478426 ?auto_1478437 ) ) ( not ( = ?auto_1478426 ?auto_1478438 ) ) ( not ( = ?auto_1478426 ?auto_1478439 ) ) ( not ( = ?auto_1478427 ?auto_1478429 ) ) ( not ( = ?auto_1478427 ?auto_1478428 ) ) ( not ( = ?auto_1478427 ?auto_1478430 ) ) ( not ( = ?auto_1478427 ?auto_1478431 ) ) ( not ( = ?auto_1478427 ?auto_1478432 ) ) ( not ( = ?auto_1478427 ?auto_1478433 ) ) ( not ( = ?auto_1478427 ?auto_1478434 ) ) ( not ( = ?auto_1478427 ?auto_1478435 ) ) ( not ( = ?auto_1478427 ?auto_1478436 ) ) ( not ( = ?auto_1478427 ?auto_1478437 ) ) ( not ( = ?auto_1478427 ?auto_1478438 ) ) ( not ( = ?auto_1478427 ?auto_1478439 ) ) ( not ( = ?auto_1478429 ?auto_1478428 ) ) ( not ( = ?auto_1478429 ?auto_1478430 ) ) ( not ( = ?auto_1478429 ?auto_1478431 ) ) ( not ( = ?auto_1478429 ?auto_1478432 ) ) ( not ( = ?auto_1478429 ?auto_1478433 ) ) ( not ( = ?auto_1478429 ?auto_1478434 ) ) ( not ( = ?auto_1478429 ?auto_1478435 ) ) ( not ( = ?auto_1478429 ?auto_1478436 ) ) ( not ( = ?auto_1478429 ?auto_1478437 ) ) ( not ( = ?auto_1478429 ?auto_1478438 ) ) ( not ( = ?auto_1478429 ?auto_1478439 ) ) ( not ( = ?auto_1478428 ?auto_1478430 ) ) ( not ( = ?auto_1478428 ?auto_1478431 ) ) ( not ( = ?auto_1478428 ?auto_1478432 ) ) ( not ( = ?auto_1478428 ?auto_1478433 ) ) ( not ( = ?auto_1478428 ?auto_1478434 ) ) ( not ( = ?auto_1478428 ?auto_1478435 ) ) ( not ( = ?auto_1478428 ?auto_1478436 ) ) ( not ( = ?auto_1478428 ?auto_1478437 ) ) ( not ( = ?auto_1478428 ?auto_1478438 ) ) ( not ( = ?auto_1478428 ?auto_1478439 ) ) ( not ( = ?auto_1478430 ?auto_1478431 ) ) ( not ( = ?auto_1478430 ?auto_1478432 ) ) ( not ( = ?auto_1478430 ?auto_1478433 ) ) ( not ( = ?auto_1478430 ?auto_1478434 ) ) ( not ( = ?auto_1478430 ?auto_1478435 ) ) ( not ( = ?auto_1478430 ?auto_1478436 ) ) ( not ( = ?auto_1478430 ?auto_1478437 ) ) ( not ( = ?auto_1478430 ?auto_1478438 ) ) ( not ( = ?auto_1478430 ?auto_1478439 ) ) ( not ( = ?auto_1478431 ?auto_1478432 ) ) ( not ( = ?auto_1478431 ?auto_1478433 ) ) ( not ( = ?auto_1478431 ?auto_1478434 ) ) ( not ( = ?auto_1478431 ?auto_1478435 ) ) ( not ( = ?auto_1478431 ?auto_1478436 ) ) ( not ( = ?auto_1478431 ?auto_1478437 ) ) ( not ( = ?auto_1478431 ?auto_1478438 ) ) ( not ( = ?auto_1478431 ?auto_1478439 ) ) ( not ( = ?auto_1478432 ?auto_1478433 ) ) ( not ( = ?auto_1478432 ?auto_1478434 ) ) ( not ( = ?auto_1478432 ?auto_1478435 ) ) ( not ( = ?auto_1478432 ?auto_1478436 ) ) ( not ( = ?auto_1478432 ?auto_1478437 ) ) ( not ( = ?auto_1478432 ?auto_1478438 ) ) ( not ( = ?auto_1478432 ?auto_1478439 ) ) ( not ( = ?auto_1478433 ?auto_1478434 ) ) ( not ( = ?auto_1478433 ?auto_1478435 ) ) ( not ( = ?auto_1478433 ?auto_1478436 ) ) ( not ( = ?auto_1478433 ?auto_1478437 ) ) ( not ( = ?auto_1478433 ?auto_1478438 ) ) ( not ( = ?auto_1478433 ?auto_1478439 ) ) ( not ( = ?auto_1478434 ?auto_1478435 ) ) ( not ( = ?auto_1478434 ?auto_1478436 ) ) ( not ( = ?auto_1478434 ?auto_1478437 ) ) ( not ( = ?auto_1478434 ?auto_1478438 ) ) ( not ( = ?auto_1478434 ?auto_1478439 ) ) ( not ( = ?auto_1478435 ?auto_1478436 ) ) ( not ( = ?auto_1478435 ?auto_1478437 ) ) ( not ( = ?auto_1478435 ?auto_1478438 ) ) ( not ( = ?auto_1478435 ?auto_1478439 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478436 ?auto_1478437 ?auto_1478438 )
      ( MAKE-13CRATE-VERIFY ?auto_1478425 ?auto_1478426 ?auto_1478427 ?auto_1478429 ?auto_1478428 ?auto_1478430 ?auto_1478431 ?auto_1478432 ?auto_1478433 ?auto_1478434 ?auto_1478435 ?auto_1478436 ?auto_1478437 ?auto_1478438 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478608 - SURFACE
      ?auto_1478609 - SURFACE
      ?auto_1478610 - SURFACE
      ?auto_1478612 - SURFACE
      ?auto_1478611 - SURFACE
      ?auto_1478613 - SURFACE
      ?auto_1478614 - SURFACE
      ?auto_1478615 - SURFACE
      ?auto_1478616 - SURFACE
      ?auto_1478617 - SURFACE
      ?auto_1478618 - SURFACE
      ?auto_1478619 - SURFACE
      ?auto_1478620 - SURFACE
      ?auto_1478621 - SURFACE
    )
    :vars
    (
      ?auto_1478625 - HOIST
      ?auto_1478623 - PLACE
      ?auto_1478624 - PLACE
      ?auto_1478627 - HOIST
      ?auto_1478622 - SURFACE
      ?auto_1478626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478625 ?auto_1478623 ) ( IS-CRATE ?auto_1478621 ) ( not ( = ?auto_1478620 ?auto_1478621 ) ) ( not ( = ?auto_1478619 ?auto_1478620 ) ) ( not ( = ?auto_1478619 ?auto_1478621 ) ) ( not ( = ?auto_1478624 ?auto_1478623 ) ) ( HOIST-AT ?auto_1478627 ?auto_1478624 ) ( not ( = ?auto_1478625 ?auto_1478627 ) ) ( AVAILABLE ?auto_1478627 ) ( SURFACE-AT ?auto_1478621 ?auto_1478624 ) ( ON ?auto_1478621 ?auto_1478622 ) ( CLEAR ?auto_1478621 ) ( not ( = ?auto_1478620 ?auto_1478622 ) ) ( not ( = ?auto_1478621 ?auto_1478622 ) ) ( not ( = ?auto_1478619 ?auto_1478622 ) ) ( TRUCK-AT ?auto_1478626 ?auto_1478623 ) ( SURFACE-AT ?auto_1478619 ?auto_1478623 ) ( CLEAR ?auto_1478619 ) ( LIFTING ?auto_1478625 ?auto_1478620 ) ( IS-CRATE ?auto_1478620 ) ( ON ?auto_1478609 ?auto_1478608 ) ( ON ?auto_1478610 ?auto_1478609 ) ( ON ?auto_1478612 ?auto_1478610 ) ( ON ?auto_1478611 ?auto_1478612 ) ( ON ?auto_1478613 ?auto_1478611 ) ( ON ?auto_1478614 ?auto_1478613 ) ( ON ?auto_1478615 ?auto_1478614 ) ( ON ?auto_1478616 ?auto_1478615 ) ( ON ?auto_1478617 ?auto_1478616 ) ( ON ?auto_1478618 ?auto_1478617 ) ( ON ?auto_1478619 ?auto_1478618 ) ( not ( = ?auto_1478608 ?auto_1478609 ) ) ( not ( = ?auto_1478608 ?auto_1478610 ) ) ( not ( = ?auto_1478608 ?auto_1478612 ) ) ( not ( = ?auto_1478608 ?auto_1478611 ) ) ( not ( = ?auto_1478608 ?auto_1478613 ) ) ( not ( = ?auto_1478608 ?auto_1478614 ) ) ( not ( = ?auto_1478608 ?auto_1478615 ) ) ( not ( = ?auto_1478608 ?auto_1478616 ) ) ( not ( = ?auto_1478608 ?auto_1478617 ) ) ( not ( = ?auto_1478608 ?auto_1478618 ) ) ( not ( = ?auto_1478608 ?auto_1478619 ) ) ( not ( = ?auto_1478608 ?auto_1478620 ) ) ( not ( = ?auto_1478608 ?auto_1478621 ) ) ( not ( = ?auto_1478608 ?auto_1478622 ) ) ( not ( = ?auto_1478609 ?auto_1478610 ) ) ( not ( = ?auto_1478609 ?auto_1478612 ) ) ( not ( = ?auto_1478609 ?auto_1478611 ) ) ( not ( = ?auto_1478609 ?auto_1478613 ) ) ( not ( = ?auto_1478609 ?auto_1478614 ) ) ( not ( = ?auto_1478609 ?auto_1478615 ) ) ( not ( = ?auto_1478609 ?auto_1478616 ) ) ( not ( = ?auto_1478609 ?auto_1478617 ) ) ( not ( = ?auto_1478609 ?auto_1478618 ) ) ( not ( = ?auto_1478609 ?auto_1478619 ) ) ( not ( = ?auto_1478609 ?auto_1478620 ) ) ( not ( = ?auto_1478609 ?auto_1478621 ) ) ( not ( = ?auto_1478609 ?auto_1478622 ) ) ( not ( = ?auto_1478610 ?auto_1478612 ) ) ( not ( = ?auto_1478610 ?auto_1478611 ) ) ( not ( = ?auto_1478610 ?auto_1478613 ) ) ( not ( = ?auto_1478610 ?auto_1478614 ) ) ( not ( = ?auto_1478610 ?auto_1478615 ) ) ( not ( = ?auto_1478610 ?auto_1478616 ) ) ( not ( = ?auto_1478610 ?auto_1478617 ) ) ( not ( = ?auto_1478610 ?auto_1478618 ) ) ( not ( = ?auto_1478610 ?auto_1478619 ) ) ( not ( = ?auto_1478610 ?auto_1478620 ) ) ( not ( = ?auto_1478610 ?auto_1478621 ) ) ( not ( = ?auto_1478610 ?auto_1478622 ) ) ( not ( = ?auto_1478612 ?auto_1478611 ) ) ( not ( = ?auto_1478612 ?auto_1478613 ) ) ( not ( = ?auto_1478612 ?auto_1478614 ) ) ( not ( = ?auto_1478612 ?auto_1478615 ) ) ( not ( = ?auto_1478612 ?auto_1478616 ) ) ( not ( = ?auto_1478612 ?auto_1478617 ) ) ( not ( = ?auto_1478612 ?auto_1478618 ) ) ( not ( = ?auto_1478612 ?auto_1478619 ) ) ( not ( = ?auto_1478612 ?auto_1478620 ) ) ( not ( = ?auto_1478612 ?auto_1478621 ) ) ( not ( = ?auto_1478612 ?auto_1478622 ) ) ( not ( = ?auto_1478611 ?auto_1478613 ) ) ( not ( = ?auto_1478611 ?auto_1478614 ) ) ( not ( = ?auto_1478611 ?auto_1478615 ) ) ( not ( = ?auto_1478611 ?auto_1478616 ) ) ( not ( = ?auto_1478611 ?auto_1478617 ) ) ( not ( = ?auto_1478611 ?auto_1478618 ) ) ( not ( = ?auto_1478611 ?auto_1478619 ) ) ( not ( = ?auto_1478611 ?auto_1478620 ) ) ( not ( = ?auto_1478611 ?auto_1478621 ) ) ( not ( = ?auto_1478611 ?auto_1478622 ) ) ( not ( = ?auto_1478613 ?auto_1478614 ) ) ( not ( = ?auto_1478613 ?auto_1478615 ) ) ( not ( = ?auto_1478613 ?auto_1478616 ) ) ( not ( = ?auto_1478613 ?auto_1478617 ) ) ( not ( = ?auto_1478613 ?auto_1478618 ) ) ( not ( = ?auto_1478613 ?auto_1478619 ) ) ( not ( = ?auto_1478613 ?auto_1478620 ) ) ( not ( = ?auto_1478613 ?auto_1478621 ) ) ( not ( = ?auto_1478613 ?auto_1478622 ) ) ( not ( = ?auto_1478614 ?auto_1478615 ) ) ( not ( = ?auto_1478614 ?auto_1478616 ) ) ( not ( = ?auto_1478614 ?auto_1478617 ) ) ( not ( = ?auto_1478614 ?auto_1478618 ) ) ( not ( = ?auto_1478614 ?auto_1478619 ) ) ( not ( = ?auto_1478614 ?auto_1478620 ) ) ( not ( = ?auto_1478614 ?auto_1478621 ) ) ( not ( = ?auto_1478614 ?auto_1478622 ) ) ( not ( = ?auto_1478615 ?auto_1478616 ) ) ( not ( = ?auto_1478615 ?auto_1478617 ) ) ( not ( = ?auto_1478615 ?auto_1478618 ) ) ( not ( = ?auto_1478615 ?auto_1478619 ) ) ( not ( = ?auto_1478615 ?auto_1478620 ) ) ( not ( = ?auto_1478615 ?auto_1478621 ) ) ( not ( = ?auto_1478615 ?auto_1478622 ) ) ( not ( = ?auto_1478616 ?auto_1478617 ) ) ( not ( = ?auto_1478616 ?auto_1478618 ) ) ( not ( = ?auto_1478616 ?auto_1478619 ) ) ( not ( = ?auto_1478616 ?auto_1478620 ) ) ( not ( = ?auto_1478616 ?auto_1478621 ) ) ( not ( = ?auto_1478616 ?auto_1478622 ) ) ( not ( = ?auto_1478617 ?auto_1478618 ) ) ( not ( = ?auto_1478617 ?auto_1478619 ) ) ( not ( = ?auto_1478617 ?auto_1478620 ) ) ( not ( = ?auto_1478617 ?auto_1478621 ) ) ( not ( = ?auto_1478617 ?auto_1478622 ) ) ( not ( = ?auto_1478618 ?auto_1478619 ) ) ( not ( = ?auto_1478618 ?auto_1478620 ) ) ( not ( = ?auto_1478618 ?auto_1478621 ) ) ( not ( = ?auto_1478618 ?auto_1478622 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478619 ?auto_1478620 ?auto_1478621 )
      ( MAKE-13CRATE-VERIFY ?auto_1478608 ?auto_1478609 ?auto_1478610 ?auto_1478612 ?auto_1478611 ?auto_1478613 ?auto_1478614 ?auto_1478615 ?auto_1478616 ?auto_1478617 ?auto_1478618 ?auto_1478619 ?auto_1478620 ?auto_1478621 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_1478791 - SURFACE
      ?auto_1478792 - SURFACE
      ?auto_1478793 - SURFACE
      ?auto_1478795 - SURFACE
      ?auto_1478794 - SURFACE
      ?auto_1478796 - SURFACE
      ?auto_1478797 - SURFACE
      ?auto_1478798 - SURFACE
      ?auto_1478799 - SURFACE
      ?auto_1478800 - SURFACE
      ?auto_1478801 - SURFACE
      ?auto_1478802 - SURFACE
      ?auto_1478803 - SURFACE
      ?auto_1478804 - SURFACE
    )
    :vars
    (
      ?auto_1478805 - HOIST
      ?auto_1478807 - PLACE
      ?auto_1478809 - PLACE
      ?auto_1478806 - HOIST
      ?auto_1478810 - SURFACE
      ?auto_1478808 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1478805 ?auto_1478807 ) ( IS-CRATE ?auto_1478804 ) ( not ( = ?auto_1478803 ?auto_1478804 ) ) ( not ( = ?auto_1478802 ?auto_1478803 ) ) ( not ( = ?auto_1478802 ?auto_1478804 ) ) ( not ( = ?auto_1478809 ?auto_1478807 ) ) ( HOIST-AT ?auto_1478806 ?auto_1478809 ) ( not ( = ?auto_1478805 ?auto_1478806 ) ) ( AVAILABLE ?auto_1478806 ) ( SURFACE-AT ?auto_1478804 ?auto_1478809 ) ( ON ?auto_1478804 ?auto_1478810 ) ( CLEAR ?auto_1478804 ) ( not ( = ?auto_1478803 ?auto_1478810 ) ) ( not ( = ?auto_1478804 ?auto_1478810 ) ) ( not ( = ?auto_1478802 ?auto_1478810 ) ) ( TRUCK-AT ?auto_1478808 ?auto_1478807 ) ( SURFACE-AT ?auto_1478802 ?auto_1478807 ) ( CLEAR ?auto_1478802 ) ( IS-CRATE ?auto_1478803 ) ( AVAILABLE ?auto_1478805 ) ( IN ?auto_1478803 ?auto_1478808 ) ( ON ?auto_1478792 ?auto_1478791 ) ( ON ?auto_1478793 ?auto_1478792 ) ( ON ?auto_1478795 ?auto_1478793 ) ( ON ?auto_1478794 ?auto_1478795 ) ( ON ?auto_1478796 ?auto_1478794 ) ( ON ?auto_1478797 ?auto_1478796 ) ( ON ?auto_1478798 ?auto_1478797 ) ( ON ?auto_1478799 ?auto_1478798 ) ( ON ?auto_1478800 ?auto_1478799 ) ( ON ?auto_1478801 ?auto_1478800 ) ( ON ?auto_1478802 ?auto_1478801 ) ( not ( = ?auto_1478791 ?auto_1478792 ) ) ( not ( = ?auto_1478791 ?auto_1478793 ) ) ( not ( = ?auto_1478791 ?auto_1478795 ) ) ( not ( = ?auto_1478791 ?auto_1478794 ) ) ( not ( = ?auto_1478791 ?auto_1478796 ) ) ( not ( = ?auto_1478791 ?auto_1478797 ) ) ( not ( = ?auto_1478791 ?auto_1478798 ) ) ( not ( = ?auto_1478791 ?auto_1478799 ) ) ( not ( = ?auto_1478791 ?auto_1478800 ) ) ( not ( = ?auto_1478791 ?auto_1478801 ) ) ( not ( = ?auto_1478791 ?auto_1478802 ) ) ( not ( = ?auto_1478791 ?auto_1478803 ) ) ( not ( = ?auto_1478791 ?auto_1478804 ) ) ( not ( = ?auto_1478791 ?auto_1478810 ) ) ( not ( = ?auto_1478792 ?auto_1478793 ) ) ( not ( = ?auto_1478792 ?auto_1478795 ) ) ( not ( = ?auto_1478792 ?auto_1478794 ) ) ( not ( = ?auto_1478792 ?auto_1478796 ) ) ( not ( = ?auto_1478792 ?auto_1478797 ) ) ( not ( = ?auto_1478792 ?auto_1478798 ) ) ( not ( = ?auto_1478792 ?auto_1478799 ) ) ( not ( = ?auto_1478792 ?auto_1478800 ) ) ( not ( = ?auto_1478792 ?auto_1478801 ) ) ( not ( = ?auto_1478792 ?auto_1478802 ) ) ( not ( = ?auto_1478792 ?auto_1478803 ) ) ( not ( = ?auto_1478792 ?auto_1478804 ) ) ( not ( = ?auto_1478792 ?auto_1478810 ) ) ( not ( = ?auto_1478793 ?auto_1478795 ) ) ( not ( = ?auto_1478793 ?auto_1478794 ) ) ( not ( = ?auto_1478793 ?auto_1478796 ) ) ( not ( = ?auto_1478793 ?auto_1478797 ) ) ( not ( = ?auto_1478793 ?auto_1478798 ) ) ( not ( = ?auto_1478793 ?auto_1478799 ) ) ( not ( = ?auto_1478793 ?auto_1478800 ) ) ( not ( = ?auto_1478793 ?auto_1478801 ) ) ( not ( = ?auto_1478793 ?auto_1478802 ) ) ( not ( = ?auto_1478793 ?auto_1478803 ) ) ( not ( = ?auto_1478793 ?auto_1478804 ) ) ( not ( = ?auto_1478793 ?auto_1478810 ) ) ( not ( = ?auto_1478795 ?auto_1478794 ) ) ( not ( = ?auto_1478795 ?auto_1478796 ) ) ( not ( = ?auto_1478795 ?auto_1478797 ) ) ( not ( = ?auto_1478795 ?auto_1478798 ) ) ( not ( = ?auto_1478795 ?auto_1478799 ) ) ( not ( = ?auto_1478795 ?auto_1478800 ) ) ( not ( = ?auto_1478795 ?auto_1478801 ) ) ( not ( = ?auto_1478795 ?auto_1478802 ) ) ( not ( = ?auto_1478795 ?auto_1478803 ) ) ( not ( = ?auto_1478795 ?auto_1478804 ) ) ( not ( = ?auto_1478795 ?auto_1478810 ) ) ( not ( = ?auto_1478794 ?auto_1478796 ) ) ( not ( = ?auto_1478794 ?auto_1478797 ) ) ( not ( = ?auto_1478794 ?auto_1478798 ) ) ( not ( = ?auto_1478794 ?auto_1478799 ) ) ( not ( = ?auto_1478794 ?auto_1478800 ) ) ( not ( = ?auto_1478794 ?auto_1478801 ) ) ( not ( = ?auto_1478794 ?auto_1478802 ) ) ( not ( = ?auto_1478794 ?auto_1478803 ) ) ( not ( = ?auto_1478794 ?auto_1478804 ) ) ( not ( = ?auto_1478794 ?auto_1478810 ) ) ( not ( = ?auto_1478796 ?auto_1478797 ) ) ( not ( = ?auto_1478796 ?auto_1478798 ) ) ( not ( = ?auto_1478796 ?auto_1478799 ) ) ( not ( = ?auto_1478796 ?auto_1478800 ) ) ( not ( = ?auto_1478796 ?auto_1478801 ) ) ( not ( = ?auto_1478796 ?auto_1478802 ) ) ( not ( = ?auto_1478796 ?auto_1478803 ) ) ( not ( = ?auto_1478796 ?auto_1478804 ) ) ( not ( = ?auto_1478796 ?auto_1478810 ) ) ( not ( = ?auto_1478797 ?auto_1478798 ) ) ( not ( = ?auto_1478797 ?auto_1478799 ) ) ( not ( = ?auto_1478797 ?auto_1478800 ) ) ( not ( = ?auto_1478797 ?auto_1478801 ) ) ( not ( = ?auto_1478797 ?auto_1478802 ) ) ( not ( = ?auto_1478797 ?auto_1478803 ) ) ( not ( = ?auto_1478797 ?auto_1478804 ) ) ( not ( = ?auto_1478797 ?auto_1478810 ) ) ( not ( = ?auto_1478798 ?auto_1478799 ) ) ( not ( = ?auto_1478798 ?auto_1478800 ) ) ( not ( = ?auto_1478798 ?auto_1478801 ) ) ( not ( = ?auto_1478798 ?auto_1478802 ) ) ( not ( = ?auto_1478798 ?auto_1478803 ) ) ( not ( = ?auto_1478798 ?auto_1478804 ) ) ( not ( = ?auto_1478798 ?auto_1478810 ) ) ( not ( = ?auto_1478799 ?auto_1478800 ) ) ( not ( = ?auto_1478799 ?auto_1478801 ) ) ( not ( = ?auto_1478799 ?auto_1478802 ) ) ( not ( = ?auto_1478799 ?auto_1478803 ) ) ( not ( = ?auto_1478799 ?auto_1478804 ) ) ( not ( = ?auto_1478799 ?auto_1478810 ) ) ( not ( = ?auto_1478800 ?auto_1478801 ) ) ( not ( = ?auto_1478800 ?auto_1478802 ) ) ( not ( = ?auto_1478800 ?auto_1478803 ) ) ( not ( = ?auto_1478800 ?auto_1478804 ) ) ( not ( = ?auto_1478800 ?auto_1478810 ) ) ( not ( = ?auto_1478801 ?auto_1478802 ) ) ( not ( = ?auto_1478801 ?auto_1478803 ) ) ( not ( = ?auto_1478801 ?auto_1478804 ) ) ( not ( = ?auto_1478801 ?auto_1478810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1478802 ?auto_1478803 ?auto_1478804 )
      ( MAKE-13CRATE-VERIFY ?auto_1478791 ?auto_1478792 ?auto_1478793 ?auto_1478795 ?auto_1478794 ?auto_1478796 ?auto_1478797 ?auto_1478798 ?auto_1478799 ?auto_1478800 ?auto_1478801 ?auto_1478802 ?auto_1478803 ?auto_1478804 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493032 - SURFACE
      ?auto_1493033 - SURFACE
      ?auto_1493034 - SURFACE
      ?auto_1493036 - SURFACE
      ?auto_1493035 - SURFACE
      ?auto_1493037 - SURFACE
      ?auto_1493038 - SURFACE
      ?auto_1493039 - SURFACE
      ?auto_1493040 - SURFACE
      ?auto_1493041 - SURFACE
      ?auto_1493042 - SURFACE
      ?auto_1493043 - SURFACE
      ?auto_1493044 - SURFACE
      ?auto_1493045 - SURFACE
      ?auto_1493046 - SURFACE
    )
    :vars
    (
      ?auto_1493047 - HOIST
      ?auto_1493048 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493047 ?auto_1493048 ) ( SURFACE-AT ?auto_1493045 ?auto_1493048 ) ( CLEAR ?auto_1493045 ) ( LIFTING ?auto_1493047 ?auto_1493046 ) ( IS-CRATE ?auto_1493046 ) ( not ( = ?auto_1493045 ?auto_1493046 ) ) ( ON ?auto_1493033 ?auto_1493032 ) ( ON ?auto_1493034 ?auto_1493033 ) ( ON ?auto_1493036 ?auto_1493034 ) ( ON ?auto_1493035 ?auto_1493036 ) ( ON ?auto_1493037 ?auto_1493035 ) ( ON ?auto_1493038 ?auto_1493037 ) ( ON ?auto_1493039 ?auto_1493038 ) ( ON ?auto_1493040 ?auto_1493039 ) ( ON ?auto_1493041 ?auto_1493040 ) ( ON ?auto_1493042 ?auto_1493041 ) ( ON ?auto_1493043 ?auto_1493042 ) ( ON ?auto_1493044 ?auto_1493043 ) ( ON ?auto_1493045 ?auto_1493044 ) ( not ( = ?auto_1493032 ?auto_1493033 ) ) ( not ( = ?auto_1493032 ?auto_1493034 ) ) ( not ( = ?auto_1493032 ?auto_1493036 ) ) ( not ( = ?auto_1493032 ?auto_1493035 ) ) ( not ( = ?auto_1493032 ?auto_1493037 ) ) ( not ( = ?auto_1493032 ?auto_1493038 ) ) ( not ( = ?auto_1493032 ?auto_1493039 ) ) ( not ( = ?auto_1493032 ?auto_1493040 ) ) ( not ( = ?auto_1493032 ?auto_1493041 ) ) ( not ( = ?auto_1493032 ?auto_1493042 ) ) ( not ( = ?auto_1493032 ?auto_1493043 ) ) ( not ( = ?auto_1493032 ?auto_1493044 ) ) ( not ( = ?auto_1493032 ?auto_1493045 ) ) ( not ( = ?auto_1493032 ?auto_1493046 ) ) ( not ( = ?auto_1493033 ?auto_1493034 ) ) ( not ( = ?auto_1493033 ?auto_1493036 ) ) ( not ( = ?auto_1493033 ?auto_1493035 ) ) ( not ( = ?auto_1493033 ?auto_1493037 ) ) ( not ( = ?auto_1493033 ?auto_1493038 ) ) ( not ( = ?auto_1493033 ?auto_1493039 ) ) ( not ( = ?auto_1493033 ?auto_1493040 ) ) ( not ( = ?auto_1493033 ?auto_1493041 ) ) ( not ( = ?auto_1493033 ?auto_1493042 ) ) ( not ( = ?auto_1493033 ?auto_1493043 ) ) ( not ( = ?auto_1493033 ?auto_1493044 ) ) ( not ( = ?auto_1493033 ?auto_1493045 ) ) ( not ( = ?auto_1493033 ?auto_1493046 ) ) ( not ( = ?auto_1493034 ?auto_1493036 ) ) ( not ( = ?auto_1493034 ?auto_1493035 ) ) ( not ( = ?auto_1493034 ?auto_1493037 ) ) ( not ( = ?auto_1493034 ?auto_1493038 ) ) ( not ( = ?auto_1493034 ?auto_1493039 ) ) ( not ( = ?auto_1493034 ?auto_1493040 ) ) ( not ( = ?auto_1493034 ?auto_1493041 ) ) ( not ( = ?auto_1493034 ?auto_1493042 ) ) ( not ( = ?auto_1493034 ?auto_1493043 ) ) ( not ( = ?auto_1493034 ?auto_1493044 ) ) ( not ( = ?auto_1493034 ?auto_1493045 ) ) ( not ( = ?auto_1493034 ?auto_1493046 ) ) ( not ( = ?auto_1493036 ?auto_1493035 ) ) ( not ( = ?auto_1493036 ?auto_1493037 ) ) ( not ( = ?auto_1493036 ?auto_1493038 ) ) ( not ( = ?auto_1493036 ?auto_1493039 ) ) ( not ( = ?auto_1493036 ?auto_1493040 ) ) ( not ( = ?auto_1493036 ?auto_1493041 ) ) ( not ( = ?auto_1493036 ?auto_1493042 ) ) ( not ( = ?auto_1493036 ?auto_1493043 ) ) ( not ( = ?auto_1493036 ?auto_1493044 ) ) ( not ( = ?auto_1493036 ?auto_1493045 ) ) ( not ( = ?auto_1493036 ?auto_1493046 ) ) ( not ( = ?auto_1493035 ?auto_1493037 ) ) ( not ( = ?auto_1493035 ?auto_1493038 ) ) ( not ( = ?auto_1493035 ?auto_1493039 ) ) ( not ( = ?auto_1493035 ?auto_1493040 ) ) ( not ( = ?auto_1493035 ?auto_1493041 ) ) ( not ( = ?auto_1493035 ?auto_1493042 ) ) ( not ( = ?auto_1493035 ?auto_1493043 ) ) ( not ( = ?auto_1493035 ?auto_1493044 ) ) ( not ( = ?auto_1493035 ?auto_1493045 ) ) ( not ( = ?auto_1493035 ?auto_1493046 ) ) ( not ( = ?auto_1493037 ?auto_1493038 ) ) ( not ( = ?auto_1493037 ?auto_1493039 ) ) ( not ( = ?auto_1493037 ?auto_1493040 ) ) ( not ( = ?auto_1493037 ?auto_1493041 ) ) ( not ( = ?auto_1493037 ?auto_1493042 ) ) ( not ( = ?auto_1493037 ?auto_1493043 ) ) ( not ( = ?auto_1493037 ?auto_1493044 ) ) ( not ( = ?auto_1493037 ?auto_1493045 ) ) ( not ( = ?auto_1493037 ?auto_1493046 ) ) ( not ( = ?auto_1493038 ?auto_1493039 ) ) ( not ( = ?auto_1493038 ?auto_1493040 ) ) ( not ( = ?auto_1493038 ?auto_1493041 ) ) ( not ( = ?auto_1493038 ?auto_1493042 ) ) ( not ( = ?auto_1493038 ?auto_1493043 ) ) ( not ( = ?auto_1493038 ?auto_1493044 ) ) ( not ( = ?auto_1493038 ?auto_1493045 ) ) ( not ( = ?auto_1493038 ?auto_1493046 ) ) ( not ( = ?auto_1493039 ?auto_1493040 ) ) ( not ( = ?auto_1493039 ?auto_1493041 ) ) ( not ( = ?auto_1493039 ?auto_1493042 ) ) ( not ( = ?auto_1493039 ?auto_1493043 ) ) ( not ( = ?auto_1493039 ?auto_1493044 ) ) ( not ( = ?auto_1493039 ?auto_1493045 ) ) ( not ( = ?auto_1493039 ?auto_1493046 ) ) ( not ( = ?auto_1493040 ?auto_1493041 ) ) ( not ( = ?auto_1493040 ?auto_1493042 ) ) ( not ( = ?auto_1493040 ?auto_1493043 ) ) ( not ( = ?auto_1493040 ?auto_1493044 ) ) ( not ( = ?auto_1493040 ?auto_1493045 ) ) ( not ( = ?auto_1493040 ?auto_1493046 ) ) ( not ( = ?auto_1493041 ?auto_1493042 ) ) ( not ( = ?auto_1493041 ?auto_1493043 ) ) ( not ( = ?auto_1493041 ?auto_1493044 ) ) ( not ( = ?auto_1493041 ?auto_1493045 ) ) ( not ( = ?auto_1493041 ?auto_1493046 ) ) ( not ( = ?auto_1493042 ?auto_1493043 ) ) ( not ( = ?auto_1493042 ?auto_1493044 ) ) ( not ( = ?auto_1493042 ?auto_1493045 ) ) ( not ( = ?auto_1493042 ?auto_1493046 ) ) ( not ( = ?auto_1493043 ?auto_1493044 ) ) ( not ( = ?auto_1493043 ?auto_1493045 ) ) ( not ( = ?auto_1493043 ?auto_1493046 ) ) ( not ( = ?auto_1493044 ?auto_1493045 ) ) ( not ( = ?auto_1493044 ?auto_1493046 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1493045 ?auto_1493046 )
      ( MAKE-14CRATE-VERIFY ?auto_1493032 ?auto_1493033 ?auto_1493034 ?auto_1493036 ?auto_1493035 ?auto_1493037 ?auto_1493038 ?auto_1493039 ?auto_1493040 ?auto_1493041 ?auto_1493042 ?auto_1493043 ?auto_1493044 ?auto_1493045 ?auto_1493046 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493192 - SURFACE
      ?auto_1493193 - SURFACE
      ?auto_1493194 - SURFACE
      ?auto_1493196 - SURFACE
      ?auto_1493195 - SURFACE
      ?auto_1493197 - SURFACE
      ?auto_1493198 - SURFACE
      ?auto_1493199 - SURFACE
      ?auto_1493200 - SURFACE
      ?auto_1493201 - SURFACE
      ?auto_1493202 - SURFACE
      ?auto_1493203 - SURFACE
      ?auto_1493204 - SURFACE
      ?auto_1493205 - SURFACE
      ?auto_1493206 - SURFACE
    )
    :vars
    (
      ?auto_1493208 - HOIST
      ?auto_1493209 - PLACE
      ?auto_1493207 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493208 ?auto_1493209 ) ( SURFACE-AT ?auto_1493205 ?auto_1493209 ) ( CLEAR ?auto_1493205 ) ( IS-CRATE ?auto_1493206 ) ( not ( = ?auto_1493205 ?auto_1493206 ) ) ( TRUCK-AT ?auto_1493207 ?auto_1493209 ) ( AVAILABLE ?auto_1493208 ) ( IN ?auto_1493206 ?auto_1493207 ) ( ON ?auto_1493205 ?auto_1493204 ) ( not ( = ?auto_1493204 ?auto_1493205 ) ) ( not ( = ?auto_1493204 ?auto_1493206 ) ) ( ON ?auto_1493193 ?auto_1493192 ) ( ON ?auto_1493194 ?auto_1493193 ) ( ON ?auto_1493196 ?auto_1493194 ) ( ON ?auto_1493195 ?auto_1493196 ) ( ON ?auto_1493197 ?auto_1493195 ) ( ON ?auto_1493198 ?auto_1493197 ) ( ON ?auto_1493199 ?auto_1493198 ) ( ON ?auto_1493200 ?auto_1493199 ) ( ON ?auto_1493201 ?auto_1493200 ) ( ON ?auto_1493202 ?auto_1493201 ) ( ON ?auto_1493203 ?auto_1493202 ) ( ON ?auto_1493204 ?auto_1493203 ) ( not ( = ?auto_1493192 ?auto_1493193 ) ) ( not ( = ?auto_1493192 ?auto_1493194 ) ) ( not ( = ?auto_1493192 ?auto_1493196 ) ) ( not ( = ?auto_1493192 ?auto_1493195 ) ) ( not ( = ?auto_1493192 ?auto_1493197 ) ) ( not ( = ?auto_1493192 ?auto_1493198 ) ) ( not ( = ?auto_1493192 ?auto_1493199 ) ) ( not ( = ?auto_1493192 ?auto_1493200 ) ) ( not ( = ?auto_1493192 ?auto_1493201 ) ) ( not ( = ?auto_1493192 ?auto_1493202 ) ) ( not ( = ?auto_1493192 ?auto_1493203 ) ) ( not ( = ?auto_1493192 ?auto_1493204 ) ) ( not ( = ?auto_1493192 ?auto_1493205 ) ) ( not ( = ?auto_1493192 ?auto_1493206 ) ) ( not ( = ?auto_1493193 ?auto_1493194 ) ) ( not ( = ?auto_1493193 ?auto_1493196 ) ) ( not ( = ?auto_1493193 ?auto_1493195 ) ) ( not ( = ?auto_1493193 ?auto_1493197 ) ) ( not ( = ?auto_1493193 ?auto_1493198 ) ) ( not ( = ?auto_1493193 ?auto_1493199 ) ) ( not ( = ?auto_1493193 ?auto_1493200 ) ) ( not ( = ?auto_1493193 ?auto_1493201 ) ) ( not ( = ?auto_1493193 ?auto_1493202 ) ) ( not ( = ?auto_1493193 ?auto_1493203 ) ) ( not ( = ?auto_1493193 ?auto_1493204 ) ) ( not ( = ?auto_1493193 ?auto_1493205 ) ) ( not ( = ?auto_1493193 ?auto_1493206 ) ) ( not ( = ?auto_1493194 ?auto_1493196 ) ) ( not ( = ?auto_1493194 ?auto_1493195 ) ) ( not ( = ?auto_1493194 ?auto_1493197 ) ) ( not ( = ?auto_1493194 ?auto_1493198 ) ) ( not ( = ?auto_1493194 ?auto_1493199 ) ) ( not ( = ?auto_1493194 ?auto_1493200 ) ) ( not ( = ?auto_1493194 ?auto_1493201 ) ) ( not ( = ?auto_1493194 ?auto_1493202 ) ) ( not ( = ?auto_1493194 ?auto_1493203 ) ) ( not ( = ?auto_1493194 ?auto_1493204 ) ) ( not ( = ?auto_1493194 ?auto_1493205 ) ) ( not ( = ?auto_1493194 ?auto_1493206 ) ) ( not ( = ?auto_1493196 ?auto_1493195 ) ) ( not ( = ?auto_1493196 ?auto_1493197 ) ) ( not ( = ?auto_1493196 ?auto_1493198 ) ) ( not ( = ?auto_1493196 ?auto_1493199 ) ) ( not ( = ?auto_1493196 ?auto_1493200 ) ) ( not ( = ?auto_1493196 ?auto_1493201 ) ) ( not ( = ?auto_1493196 ?auto_1493202 ) ) ( not ( = ?auto_1493196 ?auto_1493203 ) ) ( not ( = ?auto_1493196 ?auto_1493204 ) ) ( not ( = ?auto_1493196 ?auto_1493205 ) ) ( not ( = ?auto_1493196 ?auto_1493206 ) ) ( not ( = ?auto_1493195 ?auto_1493197 ) ) ( not ( = ?auto_1493195 ?auto_1493198 ) ) ( not ( = ?auto_1493195 ?auto_1493199 ) ) ( not ( = ?auto_1493195 ?auto_1493200 ) ) ( not ( = ?auto_1493195 ?auto_1493201 ) ) ( not ( = ?auto_1493195 ?auto_1493202 ) ) ( not ( = ?auto_1493195 ?auto_1493203 ) ) ( not ( = ?auto_1493195 ?auto_1493204 ) ) ( not ( = ?auto_1493195 ?auto_1493205 ) ) ( not ( = ?auto_1493195 ?auto_1493206 ) ) ( not ( = ?auto_1493197 ?auto_1493198 ) ) ( not ( = ?auto_1493197 ?auto_1493199 ) ) ( not ( = ?auto_1493197 ?auto_1493200 ) ) ( not ( = ?auto_1493197 ?auto_1493201 ) ) ( not ( = ?auto_1493197 ?auto_1493202 ) ) ( not ( = ?auto_1493197 ?auto_1493203 ) ) ( not ( = ?auto_1493197 ?auto_1493204 ) ) ( not ( = ?auto_1493197 ?auto_1493205 ) ) ( not ( = ?auto_1493197 ?auto_1493206 ) ) ( not ( = ?auto_1493198 ?auto_1493199 ) ) ( not ( = ?auto_1493198 ?auto_1493200 ) ) ( not ( = ?auto_1493198 ?auto_1493201 ) ) ( not ( = ?auto_1493198 ?auto_1493202 ) ) ( not ( = ?auto_1493198 ?auto_1493203 ) ) ( not ( = ?auto_1493198 ?auto_1493204 ) ) ( not ( = ?auto_1493198 ?auto_1493205 ) ) ( not ( = ?auto_1493198 ?auto_1493206 ) ) ( not ( = ?auto_1493199 ?auto_1493200 ) ) ( not ( = ?auto_1493199 ?auto_1493201 ) ) ( not ( = ?auto_1493199 ?auto_1493202 ) ) ( not ( = ?auto_1493199 ?auto_1493203 ) ) ( not ( = ?auto_1493199 ?auto_1493204 ) ) ( not ( = ?auto_1493199 ?auto_1493205 ) ) ( not ( = ?auto_1493199 ?auto_1493206 ) ) ( not ( = ?auto_1493200 ?auto_1493201 ) ) ( not ( = ?auto_1493200 ?auto_1493202 ) ) ( not ( = ?auto_1493200 ?auto_1493203 ) ) ( not ( = ?auto_1493200 ?auto_1493204 ) ) ( not ( = ?auto_1493200 ?auto_1493205 ) ) ( not ( = ?auto_1493200 ?auto_1493206 ) ) ( not ( = ?auto_1493201 ?auto_1493202 ) ) ( not ( = ?auto_1493201 ?auto_1493203 ) ) ( not ( = ?auto_1493201 ?auto_1493204 ) ) ( not ( = ?auto_1493201 ?auto_1493205 ) ) ( not ( = ?auto_1493201 ?auto_1493206 ) ) ( not ( = ?auto_1493202 ?auto_1493203 ) ) ( not ( = ?auto_1493202 ?auto_1493204 ) ) ( not ( = ?auto_1493202 ?auto_1493205 ) ) ( not ( = ?auto_1493202 ?auto_1493206 ) ) ( not ( = ?auto_1493203 ?auto_1493204 ) ) ( not ( = ?auto_1493203 ?auto_1493205 ) ) ( not ( = ?auto_1493203 ?auto_1493206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493204 ?auto_1493205 ?auto_1493206 )
      ( MAKE-14CRATE-VERIFY ?auto_1493192 ?auto_1493193 ?auto_1493194 ?auto_1493196 ?auto_1493195 ?auto_1493197 ?auto_1493198 ?auto_1493199 ?auto_1493200 ?auto_1493201 ?auto_1493202 ?auto_1493203 ?auto_1493204 ?auto_1493205 ?auto_1493206 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493367 - SURFACE
      ?auto_1493368 - SURFACE
      ?auto_1493369 - SURFACE
      ?auto_1493371 - SURFACE
      ?auto_1493370 - SURFACE
      ?auto_1493372 - SURFACE
      ?auto_1493373 - SURFACE
      ?auto_1493374 - SURFACE
      ?auto_1493375 - SURFACE
      ?auto_1493376 - SURFACE
      ?auto_1493377 - SURFACE
      ?auto_1493378 - SURFACE
      ?auto_1493379 - SURFACE
      ?auto_1493380 - SURFACE
      ?auto_1493381 - SURFACE
    )
    :vars
    (
      ?auto_1493384 - HOIST
      ?auto_1493382 - PLACE
      ?auto_1493383 - TRUCK
      ?auto_1493385 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493384 ?auto_1493382 ) ( SURFACE-AT ?auto_1493380 ?auto_1493382 ) ( CLEAR ?auto_1493380 ) ( IS-CRATE ?auto_1493381 ) ( not ( = ?auto_1493380 ?auto_1493381 ) ) ( AVAILABLE ?auto_1493384 ) ( IN ?auto_1493381 ?auto_1493383 ) ( ON ?auto_1493380 ?auto_1493379 ) ( not ( = ?auto_1493379 ?auto_1493380 ) ) ( not ( = ?auto_1493379 ?auto_1493381 ) ) ( TRUCK-AT ?auto_1493383 ?auto_1493385 ) ( not ( = ?auto_1493385 ?auto_1493382 ) ) ( ON ?auto_1493368 ?auto_1493367 ) ( ON ?auto_1493369 ?auto_1493368 ) ( ON ?auto_1493371 ?auto_1493369 ) ( ON ?auto_1493370 ?auto_1493371 ) ( ON ?auto_1493372 ?auto_1493370 ) ( ON ?auto_1493373 ?auto_1493372 ) ( ON ?auto_1493374 ?auto_1493373 ) ( ON ?auto_1493375 ?auto_1493374 ) ( ON ?auto_1493376 ?auto_1493375 ) ( ON ?auto_1493377 ?auto_1493376 ) ( ON ?auto_1493378 ?auto_1493377 ) ( ON ?auto_1493379 ?auto_1493378 ) ( not ( = ?auto_1493367 ?auto_1493368 ) ) ( not ( = ?auto_1493367 ?auto_1493369 ) ) ( not ( = ?auto_1493367 ?auto_1493371 ) ) ( not ( = ?auto_1493367 ?auto_1493370 ) ) ( not ( = ?auto_1493367 ?auto_1493372 ) ) ( not ( = ?auto_1493367 ?auto_1493373 ) ) ( not ( = ?auto_1493367 ?auto_1493374 ) ) ( not ( = ?auto_1493367 ?auto_1493375 ) ) ( not ( = ?auto_1493367 ?auto_1493376 ) ) ( not ( = ?auto_1493367 ?auto_1493377 ) ) ( not ( = ?auto_1493367 ?auto_1493378 ) ) ( not ( = ?auto_1493367 ?auto_1493379 ) ) ( not ( = ?auto_1493367 ?auto_1493380 ) ) ( not ( = ?auto_1493367 ?auto_1493381 ) ) ( not ( = ?auto_1493368 ?auto_1493369 ) ) ( not ( = ?auto_1493368 ?auto_1493371 ) ) ( not ( = ?auto_1493368 ?auto_1493370 ) ) ( not ( = ?auto_1493368 ?auto_1493372 ) ) ( not ( = ?auto_1493368 ?auto_1493373 ) ) ( not ( = ?auto_1493368 ?auto_1493374 ) ) ( not ( = ?auto_1493368 ?auto_1493375 ) ) ( not ( = ?auto_1493368 ?auto_1493376 ) ) ( not ( = ?auto_1493368 ?auto_1493377 ) ) ( not ( = ?auto_1493368 ?auto_1493378 ) ) ( not ( = ?auto_1493368 ?auto_1493379 ) ) ( not ( = ?auto_1493368 ?auto_1493380 ) ) ( not ( = ?auto_1493368 ?auto_1493381 ) ) ( not ( = ?auto_1493369 ?auto_1493371 ) ) ( not ( = ?auto_1493369 ?auto_1493370 ) ) ( not ( = ?auto_1493369 ?auto_1493372 ) ) ( not ( = ?auto_1493369 ?auto_1493373 ) ) ( not ( = ?auto_1493369 ?auto_1493374 ) ) ( not ( = ?auto_1493369 ?auto_1493375 ) ) ( not ( = ?auto_1493369 ?auto_1493376 ) ) ( not ( = ?auto_1493369 ?auto_1493377 ) ) ( not ( = ?auto_1493369 ?auto_1493378 ) ) ( not ( = ?auto_1493369 ?auto_1493379 ) ) ( not ( = ?auto_1493369 ?auto_1493380 ) ) ( not ( = ?auto_1493369 ?auto_1493381 ) ) ( not ( = ?auto_1493371 ?auto_1493370 ) ) ( not ( = ?auto_1493371 ?auto_1493372 ) ) ( not ( = ?auto_1493371 ?auto_1493373 ) ) ( not ( = ?auto_1493371 ?auto_1493374 ) ) ( not ( = ?auto_1493371 ?auto_1493375 ) ) ( not ( = ?auto_1493371 ?auto_1493376 ) ) ( not ( = ?auto_1493371 ?auto_1493377 ) ) ( not ( = ?auto_1493371 ?auto_1493378 ) ) ( not ( = ?auto_1493371 ?auto_1493379 ) ) ( not ( = ?auto_1493371 ?auto_1493380 ) ) ( not ( = ?auto_1493371 ?auto_1493381 ) ) ( not ( = ?auto_1493370 ?auto_1493372 ) ) ( not ( = ?auto_1493370 ?auto_1493373 ) ) ( not ( = ?auto_1493370 ?auto_1493374 ) ) ( not ( = ?auto_1493370 ?auto_1493375 ) ) ( not ( = ?auto_1493370 ?auto_1493376 ) ) ( not ( = ?auto_1493370 ?auto_1493377 ) ) ( not ( = ?auto_1493370 ?auto_1493378 ) ) ( not ( = ?auto_1493370 ?auto_1493379 ) ) ( not ( = ?auto_1493370 ?auto_1493380 ) ) ( not ( = ?auto_1493370 ?auto_1493381 ) ) ( not ( = ?auto_1493372 ?auto_1493373 ) ) ( not ( = ?auto_1493372 ?auto_1493374 ) ) ( not ( = ?auto_1493372 ?auto_1493375 ) ) ( not ( = ?auto_1493372 ?auto_1493376 ) ) ( not ( = ?auto_1493372 ?auto_1493377 ) ) ( not ( = ?auto_1493372 ?auto_1493378 ) ) ( not ( = ?auto_1493372 ?auto_1493379 ) ) ( not ( = ?auto_1493372 ?auto_1493380 ) ) ( not ( = ?auto_1493372 ?auto_1493381 ) ) ( not ( = ?auto_1493373 ?auto_1493374 ) ) ( not ( = ?auto_1493373 ?auto_1493375 ) ) ( not ( = ?auto_1493373 ?auto_1493376 ) ) ( not ( = ?auto_1493373 ?auto_1493377 ) ) ( not ( = ?auto_1493373 ?auto_1493378 ) ) ( not ( = ?auto_1493373 ?auto_1493379 ) ) ( not ( = ?auto_1493373 ?auto_1493380 ) ) ( not ( = ?auto_1493373 ?auto_1493381 ) ) ( not ( = ?auto_1493374 ?auto_1493375 ) ) ( not ( = ?auto_1493374 ?auto_1493376 ) ) ( not ( = ?auto_1493374 ?auto_1493377 ) ) ( not ( = ?auto_1493374 ?auto_1493378 ) ) ( not ( = ?auto_1493374 ?auto_1493379 ) ) ( not ( = ?auto_1493374 ?auto_1493380 ) ) ( not ( = ?auto_1493374 ?auto_1493381 ) ) ( not ( = ?auto_1493375 ?auto_1493376 ) ) ( not ( = ?auto_1493375 ?auto_1493377 ) ) ( not ( = ?auto_1493375 ?auto_1493378 ) ) ( not ( = ?auto_1493375 ?auto_1493379 ) ) ( not ( = ?auto_1493375 ?auto_1493380 ) ) ( not ( = ?auto_1493375 ?auto_1493381 ) ) ( not ( = ?auto_1493376 ?auto_1493377 ) ) ( not ( = ?auto_1493376 ?auto_1493378 ) ) ( not ( = ?auto_1493376 ?auto_1493379 ) ) ( not ( = ?auto_1493376 ?auto_1493380 ) ) ( not ( = ?auto_1493376 ?auto_1493381 ) ) ( not ( = ?auto_1493377 ?auto_1493378 ) ) ( not ( = ?auto_1493377 ?auto_1493379 ) ) ( not ( = ?auto_1493377 ?auto_1493380 ) ) ( not ( = ?auto_1493377 ?auto_1493381 ) ) ( not ( = ?auto_1493378 ?auto_1493379 ) ) ( not ( = ?auto_1493378 ?auto_1493380 ) ) ( not ( = ?auto_1493378 ?auto_1493381 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493379 ?auto_1493380 ?auto_1493381 )
      ( MAKE-14CRATE-VERIFY ?auto_1493367 ?auto_1493368 ?auto_1493369 ?auto_1493371 ?auto_1493370 ?auto_1493372 ?auto_1493373 ?auto_1493374 ?auto_1493375 ?auto_1493376 ?auto_1493377 ?auto_1493378 ?auto_1493379 ?auto_1493380 ?auto_1493381 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493556 - SURFACE
      ?auto_1493557 - SURFACE
      ?auto_1493558 - SURFACE
      ?auto_1493560 - SURFACE
      ?auto_1493559 - SURFACE
      ?auto_1493561 - SURFACE
      ?auto_1493562 - SURFACE
      ?auto_1493563 - SURFACE
      ?auto_1493564 - SURFACE
      ?auto_1493565 - SURFACE
      ?auto_1493566 - SURFACE
      ?auto_1493567 - SURFACE
      ?auto_1493568 - SURFACE
      ?auto_1493569 - SURFACE
      ?auto_1493570 - SURFACE
    )
    :vars
    (
      ?auto_1493574 - HOIST
      ?auto_1493572 - PLACE
      ?auto_1493571 - TRUCK
      ?auto_1493575 - PLACE
      ?auto_1493573 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493574 ?auto_1493572 ) ( SURFACE-AT ?auto_1493569 ?auto_1493572 ) ( CLEAR ?auto_1493569 ) ( IS-CRATE ?auto_1493570 ) ( not ( = ?auto_1493569 ?auto_1493570 ) ) ( AVAILABLE ?auto_1493574 ) ( ON ?auto_1493569 ?auto_1493568 ) ( not ( = ?auto_1493568 ?auto_1493569 ) ) ( not ( = ?auto_1493568 ?auto_1493570 ) ) ( TRUCK-AT ?auto_1493571 ?auto_1493575 ) ( not ( = ?auto_1493575 ?auto_1493572 ) ) ( HOIST-AT ?auto_1493573 ?auto_1493575 ) ( LIFTING ?auto_1493573 ?auto_1493570 ) ( not ( = ?auto_1493574 ?auto_1493573 ) ) ( ON ?auto_1493557 ?auto_1493556 ) ( ON ?auto_1493558 ?auto_1493557 ) ( ON ?auto_1493560 ?auto_1493558 ) ( ON ?auto_1493559 ?auto_1493560 ) ( ON ?auto_1493561 ?auto_1493559 ) ( ON ?auto_1493562 ?auto_1493561 ) ( ON ?auto_1493563 ?auto_1493562 ) ( ON ?auto_1493564 ?auto_1493563 ) ( ON ?auto_1493565 ?auto_1493564 ) ( ON ?auto_1493566 ?auto_1493565 ) ( ON ?auto_1493567 ?auto_1493566 ) ( ON ?auto_1493568 ?auto_1493567 ) ( not ( = ?auto_1493556 ?auto_1493557 ) ) ( not ( = ?auto_1493556 ?auto_1493558 ) ) ( not ( = ?auto_1493556 ?auto_1493560 ) ) ( not ( = ?auto_1493556 ?auto_1493559 ) ) ( not ( = ?auto_1493556 ?auto_1493561 ) ) ( not ( = ?auto_1493556 ?auto_1493562 ) ) ( not ( = ?auto_1493556 ?auto_1493563 ) ) ( not ( = ?auto_1493556 ?auto_1493564 ) ) ( not ( = ?auto_1493556 ?auto_1493565 ) ) ( not ( = ?auto_1493556 ?auto_1493566 ) ) ( not ( = ?auto_1493556 ?auto_1493567 ) ) ( not ( = ?auto_1493556 ?auto_1493568 ) ) ( not ( = ?auto_1493556 ?auto_1493569 ) ) ( not ( = ?auto_1493556 ?auto_1493570 ) ) ( not ( = ?auto_1493557 ?auto_1493558 ) ) ( not ( = ?auto_1493557 ?auto_1493560 ) ) ( not ( = ?auto_1493557 ?auto_1493559 ) ) ( not ( = ?auto_1493557 ?auto_1493561 ) ) ( not ( = ?auto_1493557 ?auto_1493562 ) ) ( not ( = ?auto_1493557 ?auto_1493563 ) ) ( not ( = ?auto_1493557 ?auto_1493564 ) ) ( not ( = ?auto_1493557 ?auto_1493565 ) ) ( not ( = ?auto_1493557 ?auto_1493566 ) ) ( not ( = ?auto_1493557 ?auto_1493567 ) ) ( not ( = ?auto_1493557 ?auto_1493568 ) ) ( not ( = ?auto_1493557 ?auto_1493569 ) ) ( not ( = ?auto_1493557 ?auto_1493570 ) ) ( not ( = ?auto_1493558 ?auto_1493560 ) ) ( not ( = ?auto_1493558 ?auto_1493559 ) ) ( not ( = ?auto_1493558 ?auto_1493561 ) ) ( not ( = ?auto_1493558 ?auto_1493562 ) ) ( not ( = ?auto_1493558 ?auto_1493563 ) ) ( not ( = ?auto_1493558 ?auto_1493564 ) ) ( not ( = ?auto_1493558 ?auto_1493565 ) ) ( not ( = ?auto_1493558 ?auto_1493566 ) ) ( not ( = ?auto_1493558 ?auto_1493567 ) ) ( not ( = ?auto_1493558 ?auto_1493568 ) ) ( not ( = ?auto_1493558 ?auto_1493569 ) ) ( not ( = ?auto_1493558 ?auto_1493570 ) ) ( not ( = ?auto_1493560 ?auto_1493559 ) ) ( not ( = ?auto_1493560 ?auto_1493561 ) ) ( not ( = ?auto_1493560 ?auto_1493562 ) ) ( not ( = ?auto_1493560 ?auto_1493563 ) ) ( not ( = ?auto_1493560 ?auto_1493564 ) ) ( not ( = ?auto_1493560 ?auto_1493565 ) ) ( not ( = ?auto_1493560 ?auto_1493566 ) ) ( not ( = ?auto_1493560 ?auto_1493567 ) ) ( not ( = ?auto_1493560 ?auto_1493568 ) ) ( not ( = ?auto_1493560 ?auto_1493569 ) ) ( not ( = ?auto_1493560 ?auto_1493570 ) ) ( not ( = ?auto_1493559 ?auto_1493561 ) ) ( not ( = ?auto_1493559 ?auto_1493562 ) ) ( not ( = ?auto_1493559 ?auto_1493563 ) ) ( not ( = ?auto_1493559 ?auto_1493564 ) ) ( not ( = ?auto_1493559 ?auto_1493565 ) ) ( not ( = ?auto_1493559 ?auto_1493566 ) ) ( not ( = ?auto_1493559 ?auto_1493567 ) ) ( not ( = ?auto_1493559 ?auto_1493568 ) ) ( not ( = ?auto_1493559 ?auto_1493569 ) ) ( not ( = ?auto_1493559 ?auto_1493570 ) ) ( not ( = ?auto_1493561 ?auto_1493562 ) ) ( not ( = ?auto_1493561 ?auto_1493563 ) ) ( not ( = ?auto_1493561 ?auto_1493564 ) ) ( not ( = ?auto_1493561 ?auto_1493565 ) ) ( not ( = ?auto_1493561 ?auto_1493566 ) ) ( not ( = ?auto_1493561 ?auto_1493567 ) ) ( not ( = ?auto_1493561 ?auto_1493568 ) ) ( not ( = ?auto_1493561 ?auto_1493569 ) ) ( not ( = ?auto_1493561 ?auto_1493570 ) ) ( not ( = ?auto_1493562 ?auto_1493563 ) ) ( not ( = ?auto_1493562 ?auto_1493564 ) ) ( not ( = ?auto_1493562 ?auto_1493565 ) ) ( not ( = ?auto_1493562 ?auto_1493566 ) ) ( not ( = ?auto_1493562 ?auto_1493567 ) ) ( not ( = ?auto_1493562 ?auto_1493568 ) ) ( not ( = ?auto_1493562 ?auto_1493569 ) ) ( not ( = ?auto_1493562 ?auto_1493570 ) ) ( not ( = ?auto_1493563 ?auto_1493564 ) ) ( not ( = ?auto_1493563 ?auto_1493565 ) ) ( not ( = ?auto_1493563 ?auto_1493566 ) ) ( not ( = ?auto_1493563 ?auto_1493567 ) ) ( not ( = ?auto_1493563 ?auto_1493568 ) ) ( not ( = ?auto_1493563 ?auto_1493569 ) ) ( not ( = ?auto_1493563 ?auto_1493570 ) ) ( not ( = ?auto_1493564 ?auto_1493565 ) ) ( not ( = ?auto_1493564 ?auto_1493566 ) ) ( not ( = ?auto_1493564 ?auto_1493567 ) ) ( not ( = ?auto_1493564 ?auto_1493568 ) ) ( not ( = ?auto_1493564 ?auto_1493569 ) ) ( not ( = ?auto_1493564 ?auto_1493570 ) ) ( not ( = ?auto_1493565 ?auto_1493566 ) ) ( not ( = ?auto_1493565 ?auto_1493567 ) ) ( not ( = ?auto_1493565 ?auto_1493568 ) ) ( not ( = ?auto_1493565 ?auto_1493569 ) ) ( not ( = ?auto_1493565 ?auto_1493570 ) ) ( not ( = ?auto_1493566 ?auto_1493567 ) ) ( not ( = ?auto_1493566 ?auto_1493568 ) ) ( not ( = ?auto_1493566 ?auto_1493569 ) ) ( not ( = ?auto_1493566 ?auto_1493570 ) ) ( not ( = ?auto_1493567 ?auto_1493568 ) ) ( not ( = ?auto_1493567 ?auto_1493569 ) ) ( not ( = ?auto_1493567 ?auto_1493570 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493568 ?auto_1493569 ?auto_1493570 )
      ( MAKE-14CRATE-VERIFY ?auto_1493556 ?auto_1493557 ?auto_1493558 ?auto_1493560 ?auto_1493559 ?auto_1493561 ?auto_1493562 ?auto_1493563 ?auto_1493564 ?auto_1493565 ?auto_1493566 ?auto_1493567 ?auto_1493568 ?auto_1493569 ?auto_1493570 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493759 - SURFACE
      ?auto_1493760 - SURFACE
      ?auto_1493761 - SURFACE
      ?auto_1493763 - SURFACE
      ?auto_1493762 - SURFACE
      ?auto_1493764 - SURFACE
      ?auto_1493765 - SURFACE
      ?auto_1493766 - SURFACE
      ?auto_1493767 - SURFACE
      ?auto_1493768 - SURFACE
      ?auto_1493769 - SURFACE
      ?auto_1493770 - SURFACE
      ?auto_1493771 - SURFACE
      ?auto_1493772 - SURFACE
      ?auto_1493773 - SURFACE
    )
    :vars
    (
      ?auto_1493777 - HOIST
      ?auto_1493775 - PLACE
      ?auto_1493776 - TRUCK
      ?auto_1493778 - PLACE
      ?auto_1493774 - HOIST
      ?auto_1493779 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493777 ?auto_1493775 ) ( SURFACE-AT ?auto_1493772 ?auto_1493775 ) ( CLEAR ?auto_1493772 ) ( IS-CRATE ?auto_1493773 ) ( not ( = ?auto_1493772 ?auto_1493773 ) ) ( AVAILABLE ?auto_1493777 ) ( ON ?auto_1493772 ?auto_1493771 ) ( not ( = ?auto_1493771 ?auto_1493772 ) ) ( not ( = ?auto_1493771 ?auto_1493773 ) ) ( TRUCK-AT ?auto_1493776 ?auto_1493778 ) ( not ( = ?auto_1493778 ?auto_1493775 ) ) ( HOIST-AT ?auto_1493774 ?auto_1493778 ) ( not ( = ?auto_1493777 ?auto_1493774 ) ) ( AVAILABLE ?auto_1493774 ) ( SURFACE-AT ?auto_1493773 ?auto_1493778 ) ( ON ?auto_1493773 ?auto_1493779 ) ( CLEAR ?auto_1493773 ) ( not ( = ?auto_1493772 ?auto_1493779 ) ) ( not ( = ?auto_1493773 ?auto_1493779 ) ) ( not ( = ?auto_1493771 ?auto_1493779 ) ) ( ON ?auto_1493760 ?auto_1493759 ) ( ON ?auto_1493761 ?auto_1493760 ) ( ON ?auto_1493763 ?auto_1493761 ) ( ON ?auto_1493762 ?auto_1493763 ) ( ON ?auto_1493764 ?auto_1493762 ) ( ON ?auto_1493765 ?auto_1493764 ) ( ON ?auto_1493766 ?auto_1493765 ) ( ON ?auto_1493767 ?auto_1493766 ) ( ON ?auto_1493768 ?auto_1493767 ) ( ON ?auto_1493769 ?auto_1493768 ) ( ON ?auto_1493770 ?auto_1493769 ) ( ON ?auto_1493771 ?auto_1493770 ) ( not ( = ?auto_1493759 ?auto_1493760 ) ) ( not ( = ?auto_1493759 ?auto_1493761 ) ) ( not ( = ?auto_1493759 ?auto_1493763 ) ) ( not ( = ?auto_1493759 ?auto_1493762 ) ) ( not ( = ?auto_1493759 ?auto_1493764 ) ) ( not ( = ?auto_1493759 ?auto_1493765 ) ) ( not ( = ?auto_1493759 ?auto_1493766 ) ) ( not ( = ?auto_1493759 ?auto_1493767 ) ) ( not ( = ?auto_1493759 ?auto_1493768 ) ) ( not ( = ?auto_1493759 ?auto_1493769 ) ) ( not ( = ?auto_1493759 ?auto_1493770 ) ) ( not ( = ?auto_1493759 ?auto_1493771 ) ) ( not ( = ?auto_1493759 ?auto_1493772 ) ) ( not ( = ?auto_1493759 ?auto_1493773 ) ) ( not ( = ?auto_1493759 ?auto_1493779 ) ) ( not ( = ?auto_1493760 ?auto_1493761 ) ) ( not ( = ?auto_1493760 ?auto_1493763 ) ) ( not ( = ?auto_1493760 ?auto_1493762 ) ) ( not ( = ?auto_1493760 ?auto_1493764 ) ) ( not ( = ?auto_1493760 ?auto_1493765 ) ) ( not ( = ?auto_1493760 ?auto_1493766 ) ) ( not ( = ?auto_1493760 ?auto_1493767 ) ) ( not ( = ?auto_1493760 ?auto_1493768 ) ) ( not ( = ?auto_1493760 ?auto_1493769 ) ) ( not ( = ?auto_1493760 ?auto_1493770 ) ) ( not ( = ?auto_1493760 ?auto_1493771 ) ) ( not ( = ?auto_1493760 ?auto_1493772 ) ) ( not ( = ?auto_1493760 ?auto_1493773 ) ) ( not ( = ?auto_1493760 ?auto_1493779 ) ) ( not ( = ?auto_1493761 ?auto_1493763 ) ) ( not ( = ?auto_1493761 ?auto_1493762 ) ) ( not ( = ?auto_1493761 ?auto_1493764 ) ) ( not ( = ?auto_1493761 ?auto_1493765 ) ) ( not ( = ?auto_1493761 ?auto_1493766 ) ) ( not ( = ?auto_1493761 ?auto_1493767 ) ) ( not ( = ?auto_1493761 ?auto_1493768 ) ) ( not ( = ?auto_1493761 ?auto_1493769 ) ) ( not ( = ?auto_1493761 ?auto_1493770 ) ) ( not ( = ?auto_1493761 ?auto_1493771 ) ) ( not ( = ?auto_1493761 ?auto_1493772 ) ) ( not ( = ?auto_1493761 ?auto_1493773 ) ) ( not ( = ?auto_1493761 ?auto_1493779 ) ) ( not ( = ?auto_1493763 ?auto_1493762 ) ) ( not ( = ?auto_1493763 ?auto_1493764 ) ) ( not ( = ?auto_1493763 ?auto_1493765 ) ) ( not ( = ?auto_1493763 ?auto_1493766 ) ) ( not ( = ?auto_1493763 ?auto_1493767 ) ) ( not ( = ?auto_1493763 ?auto_1493768 ) ) ( not ( = ?auto_1493763 ?auto_1493769 ) ) ( not ( = ?auto_1493763 ?auto_1493770 ) ) ( not ( = ?auto_1493763 ?auto_1493771 ) ) ( not ( = ?auto_1493763 ?auto_1493772 ) ) ( not ( = ?auto_1493763 ?auto_1493773 ) ) ( not ( = ?auto_1493763 ?auto_1493779 ) ) ( not ( = ?auto_1493762 ?auto_1493764 ) ) ( not ( = ?auto_1493762 ?auto_1493765 ) ) ( not ( = ?auto_1493762 ?auto_1493766 ) ) ( not ( = ?auto_1493762 ?auto_1493767 ) ) ( not ( = ?auto_1493762 ?auto_1493768 ) ) ( not ( = ?auto_1493762 ?auto_1493769 ) ) ( not ( = ?auto_1493762 ?auto_1493770 ) ) ( not ( = ?auto_1493762 ?auto_1493771 ) ) ( not ( = ?auto_1493762 ?auto_1493772 ) ) ( not ( = ?auto_1493762 ?auto_1493773 ) ) ( not ( = ?auto_1493762 ?auto_1493779 ) ) ( not ( = ?auto_1493764 ?auto_1493765 ) ) ( not ( = ?auto_1493764 ?auto_1493766 ) ) ( not ( = ?auto_1493764 ?auto_1493767 ) ) ( not ( = ?auto_1493764 ?auto_1493768 ) ) ( not ( = ?auto_1493764 ?auto_1493769 ) ) ( not ( = ?auto_1493764 ?auto_1493770 ) ) ( not ( = ?auto_1493764 ?auto_1493771 ) ) ( not ( = ?auto_1493764 ?auto_1493772 ) ) ( not ( = ?auto_1493764 ?auto_1493773 ) ) ( not ( = ?auto_1493764 ?auto_1493779 ) ) ( not ( = ?auto_1493765 ?auto_1493766 ) ) ( not ( = ?auto_1493765 ?auto_1493767 ) ) ( not ( = ?auto_1493765 ?auto_1493768 ) ) ( not ( = ?auto_1493765 ?auto_1493769 ) ) ( not ( = ?auto_1493765 ?auto_1493770 ) ) ( not ( = ?auto_1493765 ?auto_1493771 ) ) ( not ( = ?auto_1493765 ?auto_1493772 ) ) ( not ( = ?auto_1493765 ?auto_1493773 ) ) ( not ( = ?auto_1493765 ?auto_1493779 ) ) ( not ( = ?auto_1493766 ?auto_1493767 ) ) ( not ( = ?auto_1493766 ?auto_1493768 ) ) ( not ( = ?auto_1493766 ?auto_1493769 ) ) ( not ( = ?auto_1493766 ?auto_1493770 ) ) ( not ( = ?auto_1493766 ?auto_1493771 ) ) ( not ( = ?auto_1493766 ?auto_1493772 ) ) ( not ( = ?auto_1493766 ?auto_1493773 ) ) ( not ( = ?auto_1493766 ?auto_1493779 ) ) ( not ( = ?auto_1493767 ?auto_1493768 ) ) ( not ( = ?auto_1493767 ?auto_1493769 ) ) ( not ( = ?auto_1493767 ?auto_1493770 ) ) ( not ( = ?auto_1493767 ?auto_1493771 ) ) ( not ( = ?auto_1493767 ?auto_1493772 ) ) ( not ( = ?auto_1493767 ?auto_1493773 ) ) ( not ( = ?auto_1493767 ?auto_1493779 ) ) ( not ( = ?auto_1493768 ?auto_1493769 ) ) ( not ( = ?auto_1493768 ?auto_1493770 ) ) ( not ( = ?auto_1493768 ?auto_1493771 ) ) ( not ( = ?auto_1493768 ?auto_1493772 ) ) ( not ( = ?auto_1493768 ?auto_1493773 ) ) ( not ( = ?auto_1493768 ?auto_1493779 ) ) ( not ( = ?auto_1493769 ?auto_1493770 ) ) ( not ( = ?auto_1493769 ?auto_1493771 ) ) ( not ( = ?auto_1493769 ?auto_1493772 ) ) ( not ( = ?auto_1493769 ?auto_1493773 ) ) ( not ( = ?auto_1493769 ?auto_1493779 ) ) ( not ( = ?auto_1493770 ?auto_1493771 ) ) ( not ( = ?auto_1493770 ?auto_1493772 ) ) ( not ( = ?auto_1493770 ?auto_1493773 ) ) ( not ( = ?auto_1493770 ?auto_1493779 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493771 ?auto_1493772 ?auto_1493773 )
      ( MAKE-14CRATE-VERIFY ?auto_1493759 ?auto_1493760 ?auto_1493761 ?auto_1493763 ?auto_1493762 ?auto_1493764 ?auto_1493765 ?auto_1493766 ?auto_1493767 ?auto_1493768 ?auto_1493769 ?auto_1493770 ?auto_1493771 ?auto_1493772 ?auto_1493773 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1493963 - SURFACE
      ?auto_1493964 - SURFACE
      ?auto_1493965 - SURFACE
      ?auto_1493967 - SURFACE
      ?auto_1493966 - SURFACE
      ?auto_1493968 - SURFACE
      ?auto_1493969 - SURFACE
      ?auto_1493970 - SURFACE
      ?auto_1493971 - SURFACE
      ?auto_1493972 - SURFACE
      ?auto_1493973 - SURFACE
      ?auto_1493974 - SURFACE
      ?auto_1493975 - SURFACE
      ?auto_1493976 - SURFACE
      ?auto_1493977 - SURFACE
    )
    :vars
    (
      ?auto_1493983 - HOIST
      ?auto_1493980 - PLACE
      ?auto_1493982 - PLACE
      ?auto_1493981 - HOIST
      ?auto_1493979 - SURFACE
      ?auto_1493978 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1493983 ?auto_1493980 ) ( SURFACE-AT ?auto_1493976 ?auto_1493980 ) ( CLEAR ?auto_1493976 ) ( IS-CRATE ?auto_1493977 ) ( not ( = ?auto_1493976 ?auto_1493977 ) ) ( AVAILABLE ?auto_1493983 ) ( ON ?auto_1493976 ?auto_1493975 ) ( not ( = ?auto_1493975 ?auto_1493976 ) ) ( not ( = ?auto_1493975 ?auto_1493977 ) ) ( not ( = ?auto_1493982 ?auto_1493980 ) ) ( HOIST-AT ?auto_1493981 ?auto_1493982 ) ( not ( = ?auto_1493983 ?auto_1493981 ) ) ( AVAILABLE ?auto_1493981 ) ( SURFACE-AT ?auto_1493977 ?auto_1493982 ) ( ON ?auto_1493977 ?auto_1493979 ) ( CLEAR ?auto_1493977 ) ( not ( = ?auto_1493976 ?auto_1493979 ) ) ( not ( = ?auto_1493977 ?auto_1493979 ) ) ( not ( = ?auto_1493975 ?auto_1493979 ) ) ( TRUCK-AT ?auto_1493978 ?auto_1493980 ) ( ON ?auto_1493964 ?auto_1493963 ) ( ON ?auto_1493965 ?auto_1493964 ) ( ON ?auto_1493967 ?auto_1493965 ) ( ON ?auto_1493966 ?auto_1493967 ) ( ON ?auto_1493968 ?auto_1493966 ) ( ON ?auto_1493969 ?auto_1493968 ) ( ON ?auto_1493970 ?auto_1493969 ) ( ON ?auto_1493971 ?auto_1493970 ) ( ON ?auto_1493972 ?auto_1493971 ) ( ON ?auto_1493973 ?auto_1493972 ) ( ON ?auto_1493974 ?auto_1493973 ) ( ON ?auto_1493975 ?auto_1493974 ) ( not ( = ?auto_1493963 ?auto_1493964 ) ) ( not ( = ?auto_1493963 ?auto_1493965 ) ) ( not ( = ?auto_1493963 ?auto_1493967 ) ) ( not ( = ?auto_1493963 ?auto_1493966 ) ) ( not ( = ?auto_1493963 ?auto_1493968 ) ) ( not ( = ?auto_1493963 ?auto_1493969 ) ) ( not ( = ?auto_1493963 ?auto_1493970 ) ) ( not ( = ?auto_1493963 ?auto_1493971 ) ) ( not ( = ?auto_1493963 ?auto_1493972 ) ) ( not ( = ?auto_1493963 ?auto_1493973 ) ) ( not ( = ?auto_1493963 ?auto_1493974 ) ) ( not ( = ?auto_1493963 ?auto_1493975 ) ) ( not ( = ?auto_1493963 ?auto_1493976 ) ) ( not ( = ?auto_1493963 ?auto_1493977 ) ) ( not ( = ?auto_1493963 ?auto_1493979 ) ) ( not ( = ?auto_1493964 ?auto_1493965 ) ) ( not ( = ?auto_1493964 ?auto_1493967 ) ) ( not ( = ?auto_1493964 ?auto_1493966 ) ) ( not ( = ?auto_1493964 ?auto_1493968 ) ) ( not ( = ?auto_1493964 ?auto_1493969 ) ) ( not ( = ?auto_1493964 ?auto_1493970 ) ) ( not ( = ?auto_1493964 ?auto_1493971 ) ) ( not ( = ?auto_1493964 ?auto_1493972 ) ) ( not ( = ?auto_1493964 ?auto_1493973 ) ) ( not ( = ?auto_1493964 ?auto_1493974 ) ) ( not ( = ?auto_1493964 ?auto_1493975 ) ) ( not ( = ?auto_1493964 ?auto_1493976 ) ) ( not ( = ?auto_1493964 ?auto_1493977 ) ) ( not ( = ?auto_1493964 ?auto_1493979 ) ) ( not ( = ?auto_1493965 ?auto_1493967 ) ) ( not ( = ?auto_1493965 ?auto_1493966 ) ) ( not ( = ?auto_1493965 ?auto_1493968 ) ) ( not ( = ?auto_1493965 ?auto_1493969 ) ) ( not ( = ?auto_1493965 ?auto_1493970 ) ) ( not ( = ?auto_1493965 ?auto_1493971 ) ) ( not ( = ?auto_1493965 ?auto_1493972 ) ) ( not ( = ?auto_1493965 ?auto_1493973 ) ) ( not ( = ?auto_1493965 ?auto_1493974 ) ) ( not ( = ?auto_1493965 ?auto_1493975 ) ) ( not ( = ?auto_1493965 ?auto_1493976 ) ) ( not ( = ?auto_1493965 ?auto_1493977 ) ) ( not ( = ?auto_1493965 ?auto_1493979 ) ) ( not ( = ?auto_1493967 ?auto_1493966 ) ) ( not ( = ?auto_1493967 ?auto_1493968 ) ) ( not ( = ?auto_1493967 ?auto_1493969 ) ) ( not ( = ?auto_1493967 ?auto_1493970 ) ) ( not ( = ?auto_1493967 ?auto_1493971 ) ) ( not ( = ?auto_1493967 ?auto_1493972 ) ) ( not ( = ?auto_1493967 ?auto_1493973 ) ) ( not ( = ?auto_1493967 ?auto_1493974 ) ) ( not ( = ?auto_1493967 ?auto_1493975 ) ) ( not ( = ?auto_1493967 ?auto_1493976 ) ) ( not ( = ?auto_1493967 ?auto_1493977 ) ) ( not ( = ?auto_1493967 ?auto_1493979 ) ) ( not ( = ?auto_1493966 ?auto_1493968 ) ) ( not ( = ?auto_1493966 ?auto_1493969 ) ) ( not ( = ?auto_1493966 ?auto_1493970 ) ) ( not ( = ?auto_1493966 ?auto_1493971 ) ) ( not ( = ?auto_1493966 ?auto_1493972 ) ) ( not ( = ?auto_1493966 ?auto_1493973 ) ) ( not ( = ?auto_1493966 ?auto_1493974 ) ) ( not ( = ?auto_1493966 ?auto_1493975 ) ) ( not ( = ?auto_1493966 ?auto_1493976 ) ) ( not ( = ?auto_1493966 ?auto_1493977 ) ) ( not ( = ?auto_1493966 ?auto_1493979 ) ) ( not ( = ?auto_1493968 ?auto_1493969 ) ) ( not ( = ?auto_1493968 ?auto_1493970 ) ) ( not ( = ?auto_1493968 ?auto_1493971 ) ) ( not ( = ?auto_1493968 ?auto_1493972 ) ) ( not ( = ?auto_1493968 ?auto_1493973 ) ) ( not ( = ?auto_1493968 ?auto_1493974 ) ) ( not ( = ?auto_1493968 ?auto_1493975 ) ) ( not ( = ?auto_1493968 ?auto_1493976 ) ) ( not ( = ?auto_1493968 ?auto_1493977 ) ) ( not ( = ?auto_1493968 ?auto_1493979 ) ) ( not ( = ?auto_1493969 ?auto_1493970 ) ) ( not ( = ?auto_1493969 ?auto_1493971 ) ) ( not ( = ?auto_1493969 ?auto_1493972 ) ) ( not ( = ?auto_1493969 ?auto_1493973 ) ) ( not ( = ?auto_1493969 ?auto_1493974 ) ) ( not ( = ?auto_1493969 ?auto_1493975 ) ) ( not ( = ?auto_1493969 ?auto_1493976 ) ) ( not ( = ?auto_1493969 ?auto_1493977 ) ) ( not ( = ?auto_1493969 ?auto_1493979 ) ) ( not ( = ?auto_1493970 ?auto_1493971 ) ) ( not ( = ?auto_1493970 ?auto_1493972 ) ) ( not ( = ?auto_1493970 ?auto_1493973 ) ) ( not ( = ?auto_1493970 ?auto_1493974 ) ) ( not ( = ?auto_1493970 ?auto_1493975 ) ) ( not ( = ?auto_1493970 ?auto_1493976 ) ) ( not ( = ?auto_1493970 ?auto_1493977 ) ) ( not ( = ?auto_1493970 ?auto_1493979 ) ) ( not ( = ?auto_1493971 ?auto_1493972 ) ) ( not ( = ?auto_1493971 ?auto_1493973 ) ) ( not ( = ?auto_1493971 ?auto_1493974 ) ) ( not ( = ?auto_1493971 ?auto_1493975 ) ) ( not ( = ?auto_1493971 ?auto_1493976 ) ) ( not ( = ?auto_1493971 ?auto_1493977 ) ) ( not ( = ?auto_1493971 ?auto_1493979 ) ) ( not ( = ?auto_1493972 ?auto_1493973 ) ) ( not ( = ?auto_1493972 ?auto_1493974 ) ) ( not ( = ?auto_1493972 ?auto_1493975 ) ) ( not ( = ?auto_1493972 ?auto_1493976 ) ) ( not ( = ?auto_1493972 ?auto_1493977 ) ) ( not ( = ?auto_1493972 ?auto_1493979 ) ) ( not ( = ?auto_1493973 ?auto_1493974 ) ) ( not ( = ?auto_1493973 ?auto_1493975 ) ) ( not ( = ?auto_1493973 ?auto_1493976 ) ) ( not ( = ?auto_1493973 ?auto_1493977 ) ) ( not ( = ?auto_1493973 ?auto_1493979 ) ) ( not ( = ?auto_1493974 ?auto_1493975 ) ) ( not ( = ?auto_1493974 ?auto_1493976 ) ) ( not ( = ?auto_1493974 ?auto_1493977 ) ) ( not ( = ?auto_1493974 ?auto_1493979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1493975 ?auto_1493976 ?auto_1493977 )
      ( MAKE-14CRATE-VERIFY ?auto_1493963 ?auto_1493964 ?auto_1493965 ?auto_1493967 ?auto_1493966 ?auto_1493968 ?auto_1493969 ?auto_1493970 ?auto_1493971 ?auto_1493972 ?auto_1493973 ?auto_1493974 ?auto_1493975 ?auto_1493976 ?auto_1493977 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494167 - SURFACE
      ?auto_1494168 - SURFACE
      ?auto_1494169 - SURFACE
      ?auto_1494171 - SURFACE
      ?auto_1494170 - SURFACE
      ?auto_1494172 - SURFACE
      ?auto_1494173 - SURFACE
      ?auto_1494174 - SURFACE
      ?auto_1494175 - SURFACE
      ?auto_1494176 - SURFACE
      ?auto_1494177 - SURFACE
      ?auto_1494178 - SURFACE
      ?auto_1494179 - SURFACE
      ?auto_1494180 - SURFACE
      ?auto_1494181 - SURFACE
    )
    :vars
    (
      ?auto_1494183 - HOIST
      ?auto_1494184 - PLACE
      ?auto_1494186 - PLACE
      ?auto_1494182 - HOIST
      ?auto_1494187 - SURFACE
      ?auto_1494185 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494183 ?auto_1494184 ) ( IS-CRATE ?auto_1494181 ) ( not ( = ?auto_1494180 ?auto_1494181 ) ) ( not ( = ?auto_1494179 ?auto_1494180 ) ) ( not ( = ?auto_1494179 ?auto_1494181 ) ) ( not ( = ?auto_1494186 ?auto_1494184 ) ) ( HOIST-AT ?auto_1494182 ?auto_1494186 ) ( not ( = ?auto_1494183 ?auto_1494182 ) ) ( AVAILABLE ?auto_1494182 ) ( SURFACE-AT ?auto_1494181 ?auto_1494186 ) ( ON ?auto_1494181 ?auto_1494187 ) ( CLEAR ?auto_1494181 ) ( not ( = ?auto_1494180 ?auto_1494187 ) ) ( not ( = ?auto_1494181 ?auto_1494187 ) ) ( not ( = ?auto_1494179 ?auto_1494187 ) ) ( TRUCK-AT ?auto_1494185 ?auto_1494184 ) ( SURFACE-AT ?auto_1494179 ?auto_1494184 ) ( CLEAR ?auto_1494179 ) ( LIFTING ?auto_1494183 ?auto_1494180 ) ( IS-CRATE ?auto_1494180 ) ( ON ?auto_1494168 ?auto_1494167 ) ( ON ?auto_1494169 ?auto_1494168 ) ( ON ?auto_1494171 ?auto_1494169 ) ( ON ?auto_1494170 ?auto_1494171 ) ( ON ?auto_1494172 ?auto_1494170 ) ( ON ?auto_1494173 ?auto_1494172 ) ( ON ?auto_1494174 ?auto_1494173 ) ( ON ?auto_1494175 ?auto_1494174 ) ( ON ?auto_1494176 ?auto_1494175 ) ( ON ?auto_1494177 ?auto_1494176 ) ( ON ?auto_1494178 ?auto_1494177 ) ( ON ?auto_1494179 ?auto_1494178 ) ( not ( = ?auto_1494167 ?auto_1494168 ) ) ( not ( = ?auto_1494167 ?auto_1494169 ) ) ( not ( = ?auto_1494167 ?auto_1494171 ) ) ( not ( = ?auto_1494167 ?auto_1494170 ) ) ( not ( = ?auto_1494167 ?auto_1494172 ) ) ( not ( = ?auto_1494167 ?auto_1494173 ) ) ( not ( = ?auto_1494167 ?auto_1494174 ) ) ( not ( = ?auto_1494167 ?auto_1494175 ) ) ( not ( = ?auto_1494167 ?auto_1494176 ) ) ( not ( = ?auto_1494167 ?auto_1494177 ) ) ( not ( = ?auto_1494167 ?auto_1494178 ) ) ( not ( = ?auto_1494167 ?auto_1494179 ) ) ( not ( = ?auto_1494167 ?auto_1494180 ) ) ( not ( = ?auto_1494167 ?auto_1494181 ) ) ( not ( = ?auto_1494167 ?auto_1494187 ) ) ( not ( = ?auto_1494168 ?auto_1494169 ) ) ( not ( = ?auto_1494168 ?auto_1494171 ) ) ( not ( = ?auto_1494168 ?auto_1494170 ) ) ( not ( = ?auto_1494168 ?auto_1494172 ) ) ( not ( = ?auto_1494168 ?auto_1494173 ) ) ( not ( = ?auto_1494168 ?auto_1494174 ) ) ( not ( = ?auto_1494168 ?auto_1494175 ) ) ( not ( = ?auto_1494168 ?auto_1494176 ) ) ( not ( = ?auto_1494168 ?auto_1494177 ) ) ( not ( = ?auto_1494168 ?auto_1494178 ) ) ( not ( = ?auto_1494168 ?auto_1494179 ) ) ( not ( = ?auto_1494168 ?auto_1494180 ) ) ( not ( = ?auto_1494168 ?auto_1494181 ) ) ( not ( = ?auto_1494168 ?auto_1494187 ) ) ( not ( = ?auto_1494169 ?auto_1494171 ) ) ( not ( = ?auto_1494169 ?auto_1494170 ) ) ( not ( = ?auto_1494169 ?auto_1494172 ) ) ( not ( = ?auto_1494169 ?auto_1494173 ) ) ( not ( = ?auto_1494169 ?auto_1494174 ) ) ( not ( = ?auto_1494169 ?auto_1494175 ) ) ( not ( = ?auto_1494169 ?auto_1494176 ) ) ( not ( = ?auto_1494169 ?auto_1494177 ) ) ( not ( = ?auto_1494169 ?auto_1494178 ) ) ( not ( = ?auto_1494169 ?auto_1494179 ) ) ( not ( = ?auto_1494169 ?auto_1494180 ) ) ( not ( = ?auto_1494169 ?auto_1494181 ) ) ( not ( = ?auto_1494169 ?auto_1494187 ) ) ( not ( = ?auto_1494171 ?auto_1494170 ) ) ( not ( = ?auto_1494171 ?auto_1494172 ) ) ( not ( = ?auto_1494171 ?auto_1494173 ) ) ( not ( = ?auto_1494171 ?auto_1494174 ) ) ( not ( = ?auto_1494171 ?auto_1494175 ) ) ( not ( = ?auto_1494171 ?auto_1494176 ) ) ( not ( = ?auto_1494171 ?auto_1494177 ) ) ( not ( = ?auto_1494171 ?auto_1494178 ) ) ( not ( = ?auto_1494171 ?auto_1494179 ) ) ( not ( = ?auto_1494171 ?auto_1494180 ) ) ( not ( = ?auto_1494171 ?auto_1494181 ) ) ( not ( = ?auto_1494171 ?auto_1494187 ) ) ( not ( = ?auto_1494170 ?auto_1494172 ) ) ( not ( = ?auto_1494170 ?auto_1494173 ) ) ( not ( = ?auto_1494170 ?auto_1494174 ) ) ( not ( = ?auto_1494170 ?auto_1494175 ) ) ( not ( = ?auto_1494170 ?auto_1494176 ) ) ( not ( = ?auto_1494170 ?auto_1494177 ) ) ( not ( = ?auto_1494170 ?auto_1494178 ) ) ( not ( = ?auto_1494170 ?auto_1494179 ) ) ( not ( = ?auto_1494170 ?auto_1494180 ) ) ( not ( = ?auto_1494170 ?auto_1494181 ) ) ( not ( = ?auto_1494170 ?auto_1494187 ) ) ( not ( = ?auto_1494172 ?auto_1494173 ) ) ( not ( = ?auto_1494172 ?auto_1494174 ) ) ( not ( = ?auto_1494172 ?auto_1494175 ) ) ( not ( = ?auto_1494172 ?auto_1494176 ) ) ( not ( = ?auto_1494172 ?auto_1494177 ) ) ( not ( = ?auto_1494172 ?auto_1494178 ) ) ( not ( = ?auto_1494172 ?auto_1494179 ) ) ( not ( = ?auto_1494172 ?auto_1494180 ) ) ( not ( = ?auto_1494172 ?auto_1494181 ) ) ( not ( = ?auto_1494172 ?auto_1494187 ) ) ( not ( = ?auto_1494173 ?auto_1494174 ) ) ( not ( = ?auto_1494173 ?auto_1494175 ) ) ( not ( = ?auto_1494173 ?auto_1494176 ) ) ( not ( = ?auto_1494173 ?auto_1494177 ) ) ( not ( = ?auto_1494173 ?auto_1494178 ) ) ( not ( = ?auto_1494173 ?auto_1494179 ) ) ( not ( = ?auto_1494173 ?auto_1494180 ) ) ( not ( = ?auto_1494173 ?auto_1494181 ) ) ( not ( = ?auto_1494173 ?auto_1494187 ) ) ( not ( = ?auto_1494174 ?auto_1494175 ) ) ( not ( = ?auto_1494174 ?auto_1494176 ) ) ( not ( = ?auto_1494174 ?auto_1494177 ) ) ( not ( = ?auto_1494174 ?auto_1494178 ) ) ( not ( = ?auto_1494174 ?auto_1494179 ) ) ( not ( = ?auto_1494174 ?auto_1494180 ) ) ( not ( = ?auto_1494174 ?auto_1494181 ) ) ( not ( = ?auto_1494174 ?auto_1494187 ) ) ( not ( = ?auto_1494175 ?auto_1494176 ) ) ( not ( = ?auto_1494175 ?auto_1494177 ) ) ( not ( = ?auto_1494175 ?auto_1494178 ) ) ( not ( = ?auto_1494175 ?auto_1494179 ) ) ( not ( = ?auto_1494175 ?auto_1494180 ) ) ( not ( = ?auto_1494175 ?auto_1494181 ) ) ( not ( = ?auto_1494175 ?auto_1494187 ) ) ( not ( = ?auto_1494176 ?auto_1494177 ) ) ( not ( = ?auto_1494176 ?auto_1494178 ) ) ( not ( = ?auto_1494176 ?auto_1494179 ) ) ( not ( = ?auto_1494176 ?auto_1494180 ) ) ( not ( = ?auto_1494176 ?auto_1494181 ) ) ( not ( = ?auto_1494176 ?auto_1494187 ) ) ( not ( = ?auto_1494177 ?auto_1494178 ) ) ( not ( = ?auto_1494177 ?auto_1494179 ) ) ( not ( = ?auto_1494177 ?auto_1494180 ) ) ( not ( = ?auto_1494177 ?auto_1494181 ) ) ( not ( = ?auto_1494177 ?auto_1494187 ) ) ( not ( = ?auto_1494178 ?auto_1494179 ) ) ( not ( = ?auto_1494178 ?auto_1494180 ) ) ( not ( = ?auto_1494178 ?auto_1494181 ) ) ( not ( = ?auto_1494178 ?auto_1494187 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494179 ?auto_1494180 ?auto_1494181 )
      ( MAKE-14CRATE-VERIFY ?auto_1494167 ?auto_1494168 ?auto_1494169 ?auto_1494171 ?auto_1494170 ?auto_1494172 ?auto_1494173 ?auto_1494174 ?auto_1494175 ?auto_1494176 ?auto_1494177 ?auto_1494178 ?auto_1494179 ?auto_1494180 ?auto_1494181 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_1494371 - SURFACE
      ?auto_1494372 - SURFACE
      ?auto_1494373 - SURFACE
      ?auto_1494375 - SURFACE
      ?auto_1494374 - SURFACE
      ?auto_1494376 - SURFACE
      ?auto_1494377 - SURFACE
      ?auto_1494378 - SURFACE
      ?auto_1494379 - SURFACE
      ?auto_1494380 - SURFACE
      ?auto_1494381 - SURFACE
      ?auto_1494382 - SURFACE
      ?auto_1494383 - SURFACE
      ?auto_1494384 - SURFACE
      ?auto_1494385 - SURFACE
    )
    :vars
    (
      ?auto_1494386 - HOIST
      ?auto_1494387 - PLACE
      ?auto_1494391 - PLACE
      ?auto_1494390 - HOIST
      ?auto_1494389 - SURFACE
      ?auto_1494388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1494386 ?auto_1494387 ) ( IS-CRATE ?auto_1494385 ) ( not ( = ?auto_1494384 ?auto_1494385 ) ) ( not ( = ?auto_1494383 ?auto_1494384 ) ) ( not ( = ?auto_1494383 ?auto_1494385 ) ) ( not ( = ?auto_1494391 ?auto_1494387 ) ) ( HOIST-AT ?auto_1494390 ?auto_1494391 ) ( not ( = ?auto_1494386 ?auto_1494390 ) ) ( AVAILABLE ?auto_1494390 ) ( SURFACE-AT ?auto_1494385 ?auto_1494391 ) ( ON ?auto_1494385 ?auto_1494389 ) ( CLEAR ?auto_1494385 ) ( not ( = ?auto_1494384 ?auto_1494389 ) ) ( not ( = ?auto_1494385 ?auto_1494389 ) ) ( not ( = ?auto_1494383 ?auto_1494389 ) ) ( TRUCK-AT ?auto_1494388 ?auto_1494387 ) ( SURFACE-AT ?auto_1494383 ?auto_1494387 ) ( CLEAR ?auto_1494383 ) ( IS-CRATE ?auto_1494384 ) ( AVAILABLE ?auto_1494386 ) ( IN ?auto_1494384 ?auto_1494388 ) ( ON ?auto_1494372 ?auto_1494371 ) ( ON ?auto_1494373 ?auto_1494372 ) ( ON ?auto_1494375 ?auto_1494373 ) ( ON ?auto_1494374 ?auto_1494375 ) ( ON ?auto_1494376 ?auto_1494374 ) ( ON ?auto_1494377 ?auto_1494376 ) ( ON ?auto_1494378 ?auto_1494377 ) ( ON ?auto_1494379 ?auto_1494378 ) ( ON ?auto_1494380 ?auto_1494379 ) ( ON ?auto_1494381 ?auto_1494380 ) ( ON ?auto_1494382 ?auto_1494381 ) ( ON ?auto_1494383 ?auto_1494382 ) ( not ( = ?auto_1494371 ?auto_1494372 ) ) ( not ( = ?auto_1494371 ?auto_1494373 ) ) ( not ( = ?auto_1494371 ?auto_1494375 ) ) ( not ( = ?auto_1494371 ?auto_1494374 ) ) ( not ( = ?auto_1494371 ?auto_1494376 ) ) ( not ( = ?auto_1494371 ?auto_1494377 ) ) ( not ( = ?auto_1494371 ?auto_1494378 ) ) ( not ( = ?auto_1494371 ?auto_1494379 ) ) ( not ( = ?auto_1494371 ?auto_1494380 ) ) ( not ( = ?auto_1494371 ?auto_1494381 ) ) ( not ( = ?auto_1494371 ?auto_1494382 ) ) ( not ( = ?auto_1494371 ?auto_1494383 ) ) ( not ( = ?auto_1494371 ?auto_1494384 ) ) ( not ( = ?auto_1494371 ?auto_1494385 ) ) ( not ( = ?auto_1494371 ?auto_1494389 ) ) ( not ( = ?auto_1494372 ?auto_1494373 ) ) ( not ( = ?auto_1494372 ?auto_1494375 ) ) ( not ( = ?auto_1494372 ?auto_1494374 ) ) ( not ( = ?auto_1494372 ?auto_1494376 ) ) ( not ( = ?auto_1494372 ?auto_1494377 ) ) ( not ( = ?auto_1494372 ?auto_1494378 ) ) ( not ( = ?auto_1494372 ?auto_1494379 ) ) ( not ( = ?auto_1494372 ?auto_1494380 ) ) ( not ( = ?auto_1494372 ?auto_1494381 ) ) ( not ( = ?auto_1494372 ?auto_1494382 ) ) ( not ( = ?auto_1494372 ?auto_1494383 ) ) ( not ( = ?auto_1494372 ?auto_1494384 ) ) ( not ( = ?auto_1494372 ?auto_1494385 ) ) ( not ( = ?auto_1494372 ?auto_1494389 ) ) ( not ( = ?auto_1494373 ?auto_1494375 ) ) ( not ( = ?auto_1494373 ?auto_1494374 ) ) ( not ( = ?auto_1494373 ?auto_1494376 ) ) ( not ( = ?auto_1494373 ?auto_1494377 ) ) ( not ( = ?auto_1494373 ?auto_1494378 ) ) ( not ( = ?auto_1494373 ?auto_1494379 ) ) ( not ( = ?auto_1494373 ?auto_1494380 ) ) ( not ( = ?auto_1494373 ?auto_1494381 ) ) ( not ( = ?auto_1494373 ?auto_1494382 ) ) ( not ( = ?auto_1494373 ?auto_1494383 ) ) ( not ( = ?auto_1494373 ?auto_1494384 ) ) ( not ( = ?auto_1494373 ?auto_1494385 ) ) ( not ( = ?auto_1494373 ?auto_1494389 ) ) ( not ( = ?auto_1494375 ?auto_1494374 ) ) ( not ( = ?auto_1494375 ?auto_1494376 ) ) ( not ( = ?auto_1494375 ?auto_1494377 ) ) ( not ( = ?auto_1494375 ?auto_1494378 ) ) ( not ( = ?auto_1494375 ?auto_1494379 ) ) ( not ( = ?auto_1494375 ?auto_1494380 ) ) ( not ( = ?auto_1494375 ?auto_1494381 ) ) ( not ( = ?auto_1494375 ?auto_1494382 ) ) ( not ( = ?auto_1494375 ?auto_1494383 ) ) ( not ( = ?auto_1494375 ?auto_1494384 ) ) ( not ( = ?auto_1494375 ?auto_1494385 ) ) ( not ( = ?auto_1494375 ?auto_1494389 ) ) ( not ( = ?auto_1494374 ?auto_1494376 ) ) ( not ( = ?auto_1494374 ?auto_1494377 ) ) ( not ( = ?auto_1494374 ?auto_1494378 ) ) ( not ( = ?auto_1494374 ?auto_1494379 ) ) ( not ( = ?auto_1494374 ?auto_1494380 ) ) ( not ( = ?auto_1494374 ?auto_1494381 ) ) ( not ( = ?auto_1494374 ?auto_1494382 ) ) ( not ( = ?auto_1494374 ?auto_1494383 ) ) ( not ( = ?auto_1494374 ?auto_1494384 ) ) ( not ( = ?auto_1494374 ?auto_1494385 ) ) ( not ( = ?auto_1494374 ?auto_1494389 ) ) ( not ( = ?auto_1494376 ?auto_1494377 ) ) ( not ( = ?auto_1494376 ?auto_1494378 ) ) ( not ( = ?auto_1494376 ?auto_1494379 ) ) ( not ( = ?auto_1494376 ?auto_1494380 ) ) ( not ( = ?auto_1494376 ?auto_1494381 ) ) ( not ( = ?auto_1494376 ?auto_1494382 ) ) ( not ( = ?auto_1494376 ?auto_1494383 ) ) ( not ( = ?auto_1494376 ?auto_1494384 ) ) ( not ( = ?auto_1494376 ?auto_1494385 ) ) ( not ( = ?auto_1494376 ?auto_1494389 ) ) ( not ( = ?auto_1494377 ?auto_1494378 ) ) ( not ( = ?auto_1494377 ?auto_1494379 ) ) ( not ( = ?auto_1494377 ?auto_1494380 ) ) ( not ( = ?auto_1494377 ?auto_1494381 ) ) ( not ( = ?auto_1494377 ?auto_1494382 ) ) ( not ( = ?auto_1494377 ?auto_1494383 ) ) ( not ( = ?auto_1494377 ?auto_1494384 ) ) ( not ( = ?auto_1494377 ?auto_1494385 ) ) ( not ( = ?auto_1494377 ?auto_1494389 ) ) ( not ( = ?auto_1494378 ?auto_1494379 ) ) ( not ( = ?auto_1494378 ?auto_1494380 ) ) ( not ( = ?auto_1494378 ?auto_1494381 ) ) ( not ( = ?auto_1494378 ?auto_1494382 ) ) ( not ( = ?auto_1494378 ?auto_1494383 ) ) ( not ( = ?auto_1494378 ?auto_1494384 ) ) ( not ( = ?auto_1494378 ?auto_1494385 ) ) ( not ( = ?auto_1494378 ?auto_1494389 ) ) ( not ( = ?auto_1494379 ?auto_1494380 ) ) ( not ( = ?auto_1494379 ?auto_1494381 ) ) ( not ( = ?auto_1494379 ?auto_1494382 ) ) ( not ( = ?auto_1494379 ?auto_1494383 ) ) ( not ( = ?auto_1494379 ?auto_1494384 ) ) ( not ( = ?auto_1494379 ?auto_1494385 ) ) ( not ( = ?auto_1494379 ?auto_1494389 ) ) ( not ( = ?auto_1494380 ?auto_1494381 ) ) ( not ( = ?auto_1494380 ?auto_1494382 ) ) ( not ( = ?auto_1494380 ?auto_1494383 ) ) ( not ( = ?auto_1494380 ?auto_1494384 ) ) ( not ( = ?auto_1494380 ?auto_1494385 ) ) ( not ( = ?auto_1494380 ?auto_1494389 ) ) ( not ( = ?auto_1494381 ?auto_1494382 ) ) ( not ( = ?auto_1494381 ?auto_1494383 ) ) ( not ( = ?auto_1494381 ?auto_1494384 ) ) ( not ( = ?auto_1494381 ?auto_1494385 ) ) ( not ( = ?auto_1494381 ?auto_1494389 ) ) ( not ( = ?auto_1494382 ?auto_1494383 ) ) ( not ( = ?auto_1494382 ?auto_1494384 ) ) ( not ( = ?auto_1494382 ?auto_1494385 ) ) ( not ( = ?auto_1494382 ?auto_1494389 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1494383 ?auto_1494384 ?auto_1494385 )
      ( MAKE-14CRATE-VERIFY ?auto_1494371 ?auto_1494372 ?auto_1494373 ?auto_1494375 ?auto_1494374 ?auto_1494376 ?auto_1494377 ?auto_1494378 ?auto_1494379 ?auto_1494380 ?auto_1494381 ?auto_1494382 ?auto_1494383 ?auto_1494384 ?auto_1494385 ) )
  )

)

