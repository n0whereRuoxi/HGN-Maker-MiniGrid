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
      ?auto_19935 - SURFACE
      ?auto_19936 - SURFACE
    )
    :vars
    (
      ?auto_19937 - HOIST
      ?auto_19938 - PLACE
      ?auto_19940 - PLACE
      ?auto_19941 - HOIST
      ?auto_19942 - SURFACE
      ?auto_19939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19937 ?auto_19938 ) ( SURFACE-AT ?auto_19935 ?auto_19938 ) ( CLEAR ?auto_19935 ) ( IS-CRATE ?auto_19936 ) ( AVAILABLE ?auto_19937 ) ( not ( = ?auto_19940 ?auto_19938 ) ) ( HOIST-AT ?auto_19941 ?auto_19940 ) ( AVAILABLE ?auto_19941 ) ( SURFACE-AT ?auto_19936 ?auto_19940 ) ( ON ?auto_19936 ?auto_19942 ) ( CLEAR ?auto_19936 ) ( TRUCK-AT ?auto_19939 ?auto_19938 ) ( not ( = ?auto_19935 ?auto_19936 ) ) ( not ( = ?auto_19935 ?auto_19942 ) ) ( not ( = ?auto_19936 ?auto_19942 ) ) ( not ( = ?auto_19937 ?auto_19941 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19939 ?auto_19938 ?auto_19940 )
      ( !LIFT ?auto_19941 ?auto_19936 ?auto_19942 ?auto_19940 )
      ( !LOAD ?auto_19941 ?auto_19936 ?auto_19939 ?auto_19940 )
      ( !DRIVE ?auto_19939 ?auto_19940 ?auto_19938 )
      ( !UNLOAD ?auto_19937 ?auto_19936 ?auto_19939 ?auto_19938 )
      ( !DROP ?auto_19937 ?auto_19936 ?auto_19935 ?auto_19938 )
      ( MAKE-1CRATE-VERIFY ?auto_19935 ?auto_19936 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19945 - SURFACE
      ?auto_19946 - SURFACE
    )
    :vars
    (
      ?auto_19947 - HOIST
      ?auto_19948 - PLACE
      ?auto_19950 - PLACE
      ?auto_19951 - HOIST
      ?auto_19952 - SURFACE
      ?auto_19949 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19947 ?auto_19948 ) ( SURFACE-AT ?auto_19945 ?auto_19948 ) ( CLEAR ?auto_19945 ) ( IS-CRATE ?auto_19946 ) ( AVAILABLE ?auto_19947 ) ( not ( = ?auto_19950 ?auto_19948 ) ) ( HOIST-AT ?auto_19951 ?auto_19950 ) ( AVAILABLE ?auto_19951 ) ( SURFACE-AT ?auto_19946 ?auto_19950 ) ( ON ?auto_19946 ?auto_19952 ) ( CLEAR ?auto_19946 ) ( TRUCK-AT ?auto_19949 ?auto_19948 ) ( not ( = ?auto_19945 ?auto_19946 ) ) ( not ( = ?auto_19945 ?auto_19952 ) ) ( not ( = ?auto_19946 ?auto_19952 ) ) ( not ( = ?auto_19947 ?auto_19951 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19949 ?auto_19948 ?auto_19950 )
      ( !LIFT ?auto_19951 ?auto_19946 ?auto_19952 ?auto_19950 )
      ( !LOAD ?auto_19951 ?auto_19946 ?auto_19949 ?auto_19950 )
      ( !DRIVE ?auto_19949 ?auto_19950 ?auto_19948 )
      ( !UNLOAD ?auto_19947 ?auto_19946 ?auto_19949 ?auto_19948 )
      ( !DROP ?auto_19947 ?auto_19946 ?auto_19945 ?auto_19948 )
      ( MAKE-1CRATE-VERIFY ?auto_19945 ?auto_19946 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19956 - SURFACE
      ?auto_19957 - SURFACE
      ?auto_19958 - SURFACE
    )
    :vars
    (
      ?auto_19964 - HOIST
      ?auto_19962 - PLACE
      ?auto_19960 - PLACE
      ?auto_19961 - HOIST
      ?auto_19959 - SURFACE
      ?auto_19967 - PLACE
      ?auto_19966 - HOIST
      ?auto_19965 - SURFACE
      ?auto_19963 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19964 ?auto_19962 ) ( IS-CRATE ?auto_19958 ) ( not ( = ?auto_19960 ?auto_19962 ) ) ( HOIST-AT ?auto_19961 ?auto_19960 ) ( AVAILABLE ?auto_19961 ) ( SURFACE-AT ?auto_19958 ?auto_19960 ) ( ON ?auto_19958 ?auto_19959 ) ( CLEAR ?auto_19958 ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( not ( = ?auto_19957 ?auto_19959 ) ) ( not ( = ?auto_19958 ?auto_19959 ) ) ( not ( = ?auto_19964 ?auto_19961 ) ) ( SURFACE-AT ?auto_19956 ?auto_19962 ) ( CLEAR ?auto_19956 ) ( IS-CRATE ?auto_19957 ) ( AVAILABLE ?auto_19964 ) ( not ( = ?auto_19967 ?auto_19962 ) ) ( HOIST-AT ?auto_19966 ?auto_19967 ) ( AVAILABLE ?auto_19966 ) ( SURFACE-AT ?auto_19957 ?auto_19967 ) ( ON ?auto_19957 ?auto_19965 ) ( CLEAR ?auto_19957 ) ( TRUCK-AT ?auto_19963 ?auto_19962 ) ( not ( = ?auto_19956 ?auto_19957 ) ) ( not ( = ?auto_19956 ?auto_19965 ) ) ( not ( = ?auto_19957 ?auto_19965 ) ) ( not ( = ?auto_19964 ?auto_19966 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19959 ) ) ( not ( = ?auto_19958 ?auto_19965 ) ) ( not ( = ?auto_19960 ?auto_19967 ) ) ( not ( = ?auto_19961 ?auto_19966 ) ) ( not ( = ?auto_19959 ?auto_19965 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19956 ?auto_19957 )
      ( MAKE-1CRATE ?auto_19957 ?auto_19958 )
      ( MAKE-2CRATE-VERIFY ?auto_19956 ?auto_19957 ?auto_19958 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_19970 - SURFACE
      ?auto_19971 - SURFACE
    )
    :vars
    (
      ?auto_19972 - HOIST
      ?auto_19973 - PLACE
      ?auto_19975 - PLACE
      ?auto_19976 - HOIST
      ?auto_19977 - SURFACE
      ?auto_19974 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19972 ?auto_19973 ) ( SURFACE-AT ?auto_19970 ?auto_19973 ) ( CLEAR ?auto_19970 ) ( IS-CRATE ?auto_19971 ) ( AVAILABLE ?auto_19972 ) ( not ( = ?auto_19975 ?auto_19973 ) ) ( HOIST-AT ?auto_19976 ?auto_19975 ) ( AVAILABLE ?auto_19976 ) ( SURFACE-AT ?auto_19971 ?auto_19975 ) ( ON ?auto_19971 ?auto_19977 ) ( CLEAR ?auto_19971 ) ( TRUCK-AT ?auto_19974 ?auto_19973 ) ( not ( = ?auto_19970 ?auto_19971 ) ) ( not ( = ?auto_19970 ?auto_19977 ) ) ( not ( = ?auto_19971 ?auto_19977 ) ) ( not ( = ?auto_19972 ?auto_19976 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_19974 ?auto_19973 ?auto_19975 )
      ( !LIFT ?auto_19976 ?auto_19971 ?auto_19977 ?auto_19975 )
      ( !LOAD ?auto_19976 ?auto_19971 ?auto_19974 ?auto_19975 )
      ( !DRIVE ?auto_19974 ?auto_19975 ?auto_19973 )
      ( !UNLOAD ?auto_19972 ?auto_19971 ?auto_19974 ?auto_19973 )
      ( !DROP ?auto_19972 ?auto_19971 ?auto_19970 ?auto_19973 )
      ( MAKE-1CRATE-VERIFY ?auto_19970 ?auto_19971 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_19982 - SURFACE
      ?auto_19983 - SURFACE
      ?auto_19984 - SURFACE
      ?auto_19985 - SURFACE
    )
    :vars
    (
      ?auto_19988 - HOIST
      ?auto_19986 - PLACE
      ?auto_19990 - PLACE
      ?auto_19991 - HOIST
      ?auto_19987 - SURFACE
      ?auto_19992 - PLACE
      ?auto_19996 - HOIST
      ?auto_19997 - SURFACE
      ?auto_19994 - PLACE
      ?auto_19995 - HOIST
      ?auto_19993 - SURFACE
      ?auto_19989 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19988 ?auto_19986 ) ( IS-CRATE ?auto_19985 ) ( not ( = ?auto_19990 ?auto_19986 ) ) ( HOIST-AT ?auto_19991 ?auto_19990 ) ( AVAILABLE ?auto_19991 ) ( SURFACE-AT ?auto_19985 ?auto_19990 ) ( ON ?auto_19985 ?auto_19987 ) ( CLEAR ?auto_19985 ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( not ( = ?auto_19984 ?auto_19987 ) ) ( not ( = ?auto_19985 ?auto_19987 ) ) ( not ( = ?auto_19988 ?auto_19991 ) ) ( IS-CRATE ?auto_19984 ) ( not ( = ?auto_19992 ?auto_19986 ) ) ( HOIST-AT ?auto_19996 ?auto_19992 ) ( AVAILABLE ?auto_19996 ) ( SURFACE-AT ?auto_19984 ?auto_19992 ) ( ON ?auto_19984 ?auto_19997 ) ( CLEAR ?auto_19984 ) ( not ( = ?auto_19983 ?auto_19984 ) ) ( not ( = ?auto_19983 ?auto_19997 ) ) ( not ( = ?auto_19984 ?auto_19997 ) ) ( not ( = ?auto_19988 ?auto_19996 ) ) ( SURFACE-AT ?auto_19982 ?auto_19986 ) ( CLEAR ?auto_19982 ) ( IS-CRATE ?auto_19983 ) ( AVAILABLE ?auto_19988 ) ( not ( = ?auto_19994 ?auto_19986 ) ) ( HOIST-AT ?auto_19995 ?auto_19994 ) ( AVAILABLE ?auto_19995 ) ( SURFACE-AT ?auto_19983 ?auto_19994 ) ( ON ?auto_19983 ?auto_19993 ) ( CLEAR ?auto_19983 ) ( TRUCK-AT ?auto_19989 ?auto_19986 ) ( not ( = ?auto_19982 ?auto_19983 ) ) ( not ( = ?auto_19982 ?auto_19993 ) ) ( not ( = ?auto_19983 ?auto_19993 ) ) ( not ( = ?auto_19988 ?auto_19995 ) ) ( not ( = ?auto_19982 ?auto_19984 ) ) ( not ( = ?auto_19982 ?auto_19997 ) ) ( not ( = ?auto_19984 ?auto_19993 ) ) ( not ( = ?auto_19992 ?auto_19994 ) ) ( not ( = ?auto_19996 ?auto_19995 ) ) ( not ( = ?auto_19997 ?auto_19993 ) ) ( not ( = ?auto_19982 ?auto_19985 ) ) ( not ( = ?auto_19982 ?auto_19987 ) ) ( not ( = ?auto_19983 ?auto_19985 ) ) ( not ( = ?auto_19983 ?auto_19987 ) ) ( not ( = ?auto_19985 ?auto_19997 ) ) ( not ( = ?auto_19985 ?auto_19993 ) ) ( not ( = ?auto_19990 ?auto_19992 ) ) ( not ( = ?auto_19990 ?auto_19994 ) ) ( not ( = ?auto_19991 ?auto_19996 ) ) ( not ( = ?auto_19991 ?auto_19995 ) ) ( not ( = ?auto_19987 ?auto_19997 ) ) ( not ( = ?auto_19987 ?auto_19993 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19982 ?auto_19983 ?auto_19984 )
      ( MAKE-1CRATE ?auto_19984 ?auto_19985 )
      ( MAKE-3CRATE-VERIFY ?auto_19982 ?auto_19983 ?auto_19984 ?auto_19985 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20000 - SURFACE
      ?auto_20001 - SURFACE
    )
    :vars
    (
      ?auto_20002 - HOIST
      ?auto_20003 - PLACE
      ?auto_20005 - PLACE
      ?auto_20006 - HOIST
      ?auto_20007 - SURFACE
      ?auto_20004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20002 ?auto_20003 ) ( SURFACE-AT ?auto_20000 ?auto_20003 ) ( CLEAR ?auto_20000 ) ( IS-CRATE ?auto_20001 ) ( AVAILABLE ?auto_20002 ) ( not ( = ?auto_20005 ?auto_20003 ) ) ( HOIST-AT ?auto_20006 ?auto_20005 ) ( AVAILABLE ?auto_20006 ) ( SURFACE-AT ?auto_20001 ?auto_20005 ) ( ON ?auto_20001 ?auto_20007 ) ( CLEAR ?auto_20001 ) ( TRUCK-AT ?auto_20004 ?auto_20003 ) ( not ( = ?auto_20000 ?auto_20001 ) ) ( not ( = ?auto_20000 ?auto_20007 ) ) ( not ( = ?auto_20001 ?auto_20007 ) ) ( not ( = ?auto_20002 ?auto_20006 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20004 ?auto_20003 ?auto_20005 )
      ( !LIFT ?auto_20006 ?auto_20001 ?auto_20007 ?auto_20005 )
      ( !LOAD ?auto_20006 ?auto_20001 ?auto_20004 ?auto_20005 )
      ( !DRIVE ?auto_20004 ?auto_20005 ?auto_20003 )
      ( !UNLOAD ?auto_20002 ?auto_20001 ?auto_20004 ?auto_20003 )
      ( !DROP ?auto_20002 ?auto_20001 ?auto_20000 ?auto_20003 )
      ( MAKE-1CRATE-VERIFY ?auto_20000 ?auto_20001 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_20013 - SURFACE
      ?auto_20014 - SURFACE
      ?auto_20015 - SURFACE
      ?auto_20016 - SURFACE
      ?auto_20017 - SURFACE
    )
    :vars
    (
      ?auto_20020 - HOIST
      ?auto_20019 - PLACE
      ?auto_20023 - PLACE
      ?auto_20021 - HOIST
      ?auto_20022 - SURFACE
      ?auto_20030 - PLACE
      ?auto_20024 - HOIST
      ?auto_20025 - SURFACE
      ?auto_20028 - PLACE
      ?auto_20032 - HOIST
      ?auto_20029 - SURFACE
      ?auto_20031 - PLACE
      ?auto_20026 - HOIST
      ?auto_20027 - SURFACE
      ?auto_20018 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20020 ?auto_20019 ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20023 ?auto_20019 ) ) ( HOIST-AT ?auto_20021 ?auto_20023 ) ( AVAILABLE ?auto_20021 ) ( SURFACE-AT ?auto_20017 ?auto_20023 ) ( ON ?auto_20017 ?auto_20022 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20022 ) ) ( not ( = ?auto_20017 ?auto_20022 ) ) ( not ( = ?auto_20020 ?auto_20021 ) ) ( IS-CRATE ?auto_20016 ) ( not ( = ?auto_20030 ?auto_20019 ) ) ( HOIST-AT ?auto_20024 ?auto_20030 ) ( AVAILABLE ?auto_20024 ) ( SURFACE-AT ?auto_20016 ?auto_20030 ) ( ON ?auto_20016 ?auto_20025 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20015 ?auto_20016 ) ) ( not ( = ?auto_20015 ?auto_20025 ) ) ( not ( = ?auto_20016 ?auto_20025 ) ) ( not ( = ?auto_20020 ?auto_20024 ) ) ( IS-CRATE ?auto_20015 ) ( not ( = ?auto_20028 ?auto_20019 ) ) ( HOIST-AT ?auto_20032 ?auto_20028 ) ( AVAILABLE ?auto_20032 ) ( SURFACE-AT ?auto_20015 ?auto_20028 ) ( ON ?auto_20015 ?auto_20029 ) ( CLEAR ?auto_20015 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20029 ) ) ( not ( = ?auto_20015 ?auto_20029 ) ) ( not ( = ?auto_20020 ?auto_20032 ) ) ( SURFACE-AT ?auto_20013 ?auto_20019 ) ( CLEAR ?auto_20013 ) ( IS-CRATE ?auto_20014 ) ( AVAILABLE ?auto_20020 ) ( not ( = ?auto_20031 ?auto_20019 ) ) ( HOIST-AT ?auto_20026 ?auto_20031 ) ( AVAILABLE ?auto_20026 ) ( SURFACE-AT ?auto_20014 ?auto_20031 ) ( ON ?auto_20014 ?auto_20027 ) ( CLEAR ?auto_20014 ) ( TRUCK-AT ?auto_20018 ?auto_20019 ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20027 ) ) ( not ( = ?auto_20014 ?auto_20027 ) ) ( not ( = ?auto_20020 ?auto_20026 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20029 ) ) ( not ( = ?auto_20015 ?auto_20027 ) ) ( not ( = ?auto_20028 ?auto_20031 ) ) ( not ( = ?auto_20032 ?auto_20026 ) ) ( not ( = ?auto_20029 ?auto_20027 ) ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( not ( = ?auto_20013 ?auto_20025 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20025 ) ) ( not ( = ?auto_20016 ?auto_20029 ) ) ( not ( = ?auto_20016 ?auto_20027 ) ) ( not ( = ?auto_20030 ?auto_20028 ) ) ( not ( = ?auto_20030 ?auto_20031 ) ) ( not ( = ?auto_20024 ?auto_20032 ) ) ( not ( = ?auto_20024 ?auto_20026 ) ) ( not ( = ?auto_20025 ?auto_20029 ) ) ( not ( = ?auto_20025 ?auto_20027 ) ) ( not ( = ?auto_20013 ?auto_20017 ) ) ( not ( = ?auto_20013 ?auto_20022 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20022 ) ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20022 ) ) ( not ( = ?auto_20017 ?auto_20025 ) ) ( not ( = ?auto_20017 ?auto_20029 ) ) ( not ( = ?auto_20017 ?auto_20027 ) ) ( not ( = ?auto_20023 ?auto_20030 ) ) ( not ( = ?auto_20023 ?auto_20028 ) ) ( not ( = ?auto_20023 ?auto_20031 ) ) ( not ( = ?auto_20021 ?auto_20024 ) ) ( not ( = ?auto_20021 ?auto_20032 ) ) ( not ( = ?auto_20021 ?auto_20026 ) ) ( not ( = ?auto_20022 ?auto_20025 ) ) ( not ( = ?auto_20022 ?auto_20029 ) ) ( not ( = ?auto_20022 ?auto_20027 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 )
      ( MAKE-1CRATE ?auto_20016 ?auto_20017 )
      ( MAKE-4CRATE-VERIFY ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20035 - SURFACE
      ?auto_20036 - SURFACE
    )
    :vars
    (
      ?auto_20037 - HOIST
      ?auto_20038 - PLACE
      ?auto_20040 - PLACE
      ?auto_20041 - HOIST
      ?auto_20042 - SURFACE
      ?auto_20039 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20037 ?auto_20038 ) ( SURFACE-AT ?auto_20035 ?auto_20038 ) ( CLEAR ?auto_20035 ) ( IS-CRATE ?auto_20036 ) ( AVAILABLE ?auto_20037 ) ( not ( = ?auto_20040 ?auto_20038 ) ) ( HOIST-AT ?auto_20041 ?auto_20040 ) ( AVAILABLE ?auto_20041 ) ( SURFACE-AT ?auto_20036 ?auto_20040 ) ( ON ?auto_20036 ?auto_20042 ) ( CLEAR ?auto_20036 ) ( TRUCK-AT ?auto_20039 ?auto_20038 ) ( not ( = ?auto_20035 ?auto_20036 ) ) ( not ( = ?auto_20035 ?auto_20042 ) ) ( not ( = ?auto_20036 ?auto_20042 ) ) ( not ( = ?auto_20037 ?auto_20041 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20039 ?auto_20038 ?auto_20040 )
      ( !LIFT ?auto_20041 ?auto_20036 ?auto_20042 ?auto_20040 )
      ( !LOAD ?auto_20041 ?auto_20036 ?auto_20039 ?auto_20040 )
      ( !DRIVE ?auto_20039 ?auto_20040 ?auto_20038 )
      ( !UNLOAD ?auto_20037 ?auto_20036 ?auto_20039 ?auto_20038 )
      ( !DROP ?auto_20037 ?auto_20036 ?auto_20035 ?auto_20038 )
      ( MAKE-1CRATE-VERIFY ?auto_20035 ?auto_20036 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_20049 - SURFACE
      ?auto_20050 - SURFACE
      ?auto_20051 - SURFACE
      ?auto_20052 - SURFACE
      ?auto_20053 - SURFACE
      ?auto_20054 - SURFACE
    )
    :vars
    (
      ?auto_20058 - HOIST
      ?auto_20060 - PLACE
      ?auto_20057 - PLACE
      ?auto_20059 - HOIST
      ?auto_20055 - SURFACE
      ?auto_20068 - PLACE
      ?auto_20061 - HOIST
      ?auto_20072 - SURFACE
      ?auto_20062 - PLACE
      ?auto_20066 - HOIST
      ?auto_20069 - SURFACE
      ?auto_20065 - PLACE
      ?auto_20067 - HOIST
      ?auto_20064 - SURFACE
      ?auto_20071 - PLACE
      ?auto_20070 - HOIST
      ?auto_20063 - SURFACE
      ?auto_20056 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20058 ?auto_20060 ) ( IS-CRATE ?auto_20054 ) ( not ( = ?auto_20057 ?auto_20060 ) ) ( HOIST-AT ?auto_20059 ?auto_20057 ) ( AVAILABLE ?auto_20059 ) ( SURFACE-AT ?auto_20054 ?auto_20057 ) ( ON ?auto_20054 ?auto_20055 ) ( CLEAR ?auto_20054 ) ( not ( = ?auto_20053 ?auto_20054 ) ) ( not ( = ?auto_20053 ?auto_20055 ) ) ( not ( = ?auto_20054 ?auto_20055 ) ) ( not ( = ?auto_20058 ?auto_20059 ) ) ( IS-CRATE ?auto_20053 ) ( not ( = ?auto_20068 ?auto_20060 ) ) ( HOIST-AT ?auto_20061 ?auto_20068 ) ( AVAILABLE ?auto_20061 ) ( SURFACE-AT ?auto_20053 ?auto_20068 ) ( ON ?auto_20053 ?auto_20072 ) ( CLEAR ?auto_20053 ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20072 ) ) ( not ( = ?auto_20053 ?auto_20072 ) ) ( not ( = ?auto_20058 ?auto_20061 ) ) ( IS-CRATE ?auto_20052 ) ( not ( = ?auto_20062 ?auto_20060 ) ) ( HOIST-AT ?auto_20066 ?auto_20062 ) ( AVAILABLE ?auto_20066 ) ( SURFACE-AT ?auto_20052 ?auto_20062 ) ( ON ?auto_20052 ?auto_20069 ) ( CLEAR ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20052 ) ) ( not ( = ?auto_20051 ?auto_20069 ) ) ( not ( = ?auto_20052 ?auto_20069 ) ) ( not ( = ?auto_20058 ?auto_20066 ) ) ( IS-CRATE ?auto_20051 ) ( not ( = ?auto_20065 ?auto_20060 ) ) ( HOIST-AT ?auto_20067 ?auto_20065 ) ( AVAILABLE ?auto_20067 ) ( SURFACE-AT ?auto_20051 ?auto_20065 ) ( ON ?auto_20051 ?auto_20064 ) ( CLEAR ?auto_20051 ) ( not ( = ?auto_20050 ?auto_20051 ) ) ( not ( = ?auto_20050 ?auto_20064 ) ) ( not ( = ?auto_20051 ?auto_20064 ) ) ( not ( = ?auto_20058 ?auto_20067 ) ) ( SURFACE-AT ?auto_20049 ?auto_20060 ) ( CLEAR ?auto_20049 ) ( IS-CRATE ?auto_20050 ) ( AVAILABLE ?auto_20058 ) ( not ( = ?auto_20071 ?auto_20060 ) ) ( HOIST-AT ?auto_20070 ?auto_20071 ) ( AVAILABLE ?auto_20070 ) ( SURFACE-AT ?auto_20050 ?auto_20071 ) ( ON ?auto_20050 ?auto_20063 ) ( CLEAR ?auto_20050 ) ( TRUCK-AT ?auto_20056 ?auto_20060 ) ( not ( = ?auto_20049 ?auto_20050 ) ) ( not ( = ?auto_20049 ?auto_20063 ) ) ( not ( = ?auto_20050 ?auto_20063 ) ) ( not ( = ?auto_20058 ?auto_20070 ) ) ( not ( = ?auto_20049 ?auto_20051 ) ) ( not ( = ?auto_20049 ?auto_20064 ) ) ( not ( = ?auto_20051 ?auto_20063 ) ) ( not ( = ?auto_20065 ?auto_20071 ) ) ( not ( = ?auto_20067 ?auto_20070 ) ) ( not ( = ?auto_20064 ?auto_20063 ) ) ( not ( = ?auto_20049 ?auto_20052 ) ) ( not ( = ?auto_20049 ?auto_20069 ) ) ( not ( = ?auto_20050 ?auto_20052 ) ) ( not ( = ?auto_20050 ?auto_20069 ) ) ( not ( = ?auto_20052 ?auto_20064 ) ) ( not ( = ?auto_20052 ?auto_20063 ) ) ( not ( = ?auto_20062 ?auto_20065 ) ) ( not ( = ?auto_20062 ?auto_20071 ) ) ( not ( = ?auto_20066 ?auto_20067 ) ) ( not ( = ?auto_20066 ?auto_20070 ) ) ( not ( = ?auto_20069 ?auto_20064 ) ) ( not ( = ?auto_20069 ?auto_20063 ) ) ( not ( = ?auto_20049 ?auto_20053 ) ) ( not ( = ?auto_20049 ?auto_20072 ) ) ( not ( = ?auto_20050 ?auto_20053 ) ) ( not ( = ?auto_20050 ?auto_20072 ) ) ( not ( = ?auto_20051 ?auto_20053 ) ) ( not ( = ?auto_20051 ?auto_20072 ) ) ( not ( = ?auto_20053 ?auto_20069 ) ) ( not ( = ?auto_20053 ?auto_20064 ) ) ( not ( = ?auto_20053 ?auto_20063 ) ) ( not ( = ?auto_20068 ?auto_20062 ) ) ( not ( = ?auto_20068 ?auto_20065 ) ) ( not ( = ?auto_20068 ?auto_20071 ) ) ( not ( = ?auto_20061 ?auto_20066 ) ) ( not ( = ?auto_20061 ?auto_20067 ) ) ( not ( = ?auto_20061 ?auto_20070 ) ) ( not ( = ?auto_20072 ?auto_20069 ) ) ( not ( = ?auto_20072 ?auto_20064 ) ) ( not ( = ?auto_20072 ?auto_20063 ) ) ( not ( = ?auto_20049 ?auto_20054 ) ) ( not ( = ?auto_20049 ?auto_20055 ) ) ( not ( = ?auto_20050 ?auto_20054 ) ) ( not ( = ?auto_20050 ?auto_20055 ) ) ( not ( = ?auto_20051 ?auto_20054 ) ) ( not ( = ?auto_20051 ?auto_20055 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( not ( = ?auto_20052 ?auto_20055 ) ) ( not ( = ?auto_20054 ?auto_20072 ) ) ( not ( = ?auto_20054 ?auto_20069 ) ) ( not ( = ?auto_20054 ?auto_20064 ) ) ( not ( = ?auto_20054 ?auto_20063 ) ) ( not ( = ?auto_20057 ?auto_20068 ) ) ( not ( = ?auto_20057 ?auto_20062 ) ) ( not ( = ?auto_20057 ?auto_20065 ) ) ( not ( = ?auto_20057 ?auto_20071 ) ) ( not ( = ?auto_20059 ?auto_20061 ) ) ( not ( = ?auto_20059 ?auto_20066 ) ) ( not ( = ?auto_20059 ?auto_20067 ) ) ( not ( = ?auto_20059 ?auto_20070 ) ) ( not ( = ?auto_20055 ?auto_20072 ) ) ( not ( = ?auto_20055 ?auto_20069 ) ) ( not ( = ?auto_20055 ?auto_20064 ) ) ( not ( = ?auto_20055 ?auto_20063 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20049 ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20053 )
      ( MAKE-1CRATE ?auto_20053 ?auto_20054 )
      ( MAKE-5CRATE-VERIFY ?auto_20049 ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20053 ?auto_20054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20075 - SURFACE
      ?auto_20076 - SURFACE
    )
    :vars
    (
      ?auto_20077 - HOIST
      ?auto_20078 - PLACE
      ?auto_20080 - PLACE
      ?auto_20081 - HOIST
      ?auto_20082 - SURFACE
      ?auto_20079 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20077 ?auto_20078 ) ( SURFACE-AT ?auto_20075 ?auto_20078 ) ( CLEAR ?auto_20075 ) ( IS-CRATE ?auto_20076 ) ( AVAILABLE ?auto_20077 ) ( not ( = ?auto_20080 ?auto_20078 ) ) ( HOIST-AT ?auto_20081 ?auto_20080 ) ( AVAILABLE ?auto_20081 ) ( SURFACE-AT ?auto_20076 ?auto_20080 ) ( ON ?auto_20076 ?auto_20082 ) ( CLEAR ?auto_20076 ) ( TRUCK-AT ?auto_20079 ?auto_20078 ) ( not ( = ?auto_20075 ?auto_20076 ) ) ( not ( = ?auto_20075 ?auto_20082 ) ) ( not ( = ?auto_20076 ?auto_20082 ) ) ( not ( = ?auto_20077 ?auto_20081 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20079 ?auto_20078 ?auto_20080 )
      ( !LIFT ?auto_20081 ?auto_20076 ?auto_20082 ?auto_20080 )
      ( !LOAD ?auto_20081 ?auto_20076 ?auto_20079 ?auto_20080 )
      ( !DRIVE ?auto_20079 ?auto_20080 ?auto_20078 )
      ( !UNLOAD ?auto_20077 ?auto_20076 ?auto_20079 ?auto_20078 )
      ( !DROP ?auto_20077 ?auto_20076 ?auto_20075 ?auto_20078 )
      ( MAKE-1CRATE-VERIFY ?auto_20075 ?auto_20076 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_20090 - SURFACE
      ?auto_20091 - SURFACE
      ?auto_20092 - SURFACE
      ?auto_20093 - SURFACE
      ?auto_20094 - SURFACE
      ?auto_20095 - SURFACE
      ?auto_20096 - SURFACE
    )
    :vars
    (
      ?auto_20101 - HOIST
      ?auto_20102 - PLACE
      ?auto_20098 - PLACE
      ?auto_20099 - HOIST
      ?auto_20097 - SURFACE
      ?auto_20107 - SURFACE
      ?auto_20110 - PLACE
      ?auto_20108 - HOIST
      ?auto_20109 - SURFACE
      ?auto_20115 - PLACE
      ?auto_20112 - HOIST
      ?auto_20104 - SURFACE
      ?auto_20113 - PLACE
      ?auto_20111 - HOIST
      ?auto_20114 - SURFACE
      ?auto_20105 - PLACE
      ?auto_20106 - HOIST
      ?auto_20103 - SURFACE
      ?auto_20100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20101 ?auto_20102 ) ( IS-CRATE ?auto_20096 ) ( not ( = ?auto_20098 ?auto_20102 ) ) ( HOIST-AT ?auto_20099 ?auto_20098 ) ( SURFACE-AT ?auto_20096 ?auto_20098 ) ( ON ?auto_20096 ?auto_20097 ) ( CLEAR ?auto_20096 ) ( not ( = ?auto_20095 ?auto_20096 ) ) ( not ( = ?auto_20095 ?auto_20097 ) ) ( not ( = ?auto_20096 ?auto_20097 ) ) ( not ( = ?auto_20101 ?auto_20099 ) ) ( IS-CRATE ?auto_20095 ) ( AVAILABLE ?auto_20099 ) ( SURFACE-AT ?auto_20095 ?auto_20098 ) ( ON ?auto_20095 ?auto_20107 ) ( CLEAR ?auto_20095 ) ( not ( = ?auto_20094 ?auto_20095 ) ) ( not ( = ?auto_20094 ?auto_20107 ) ) ( not ( = ?auto_20095 ?auto_20107 ) ) ( IS-CRATE ?auto_20094 ) ( not ( = ?auto_20110 ?auto_20102 ) ) ( HOIST-AT ?auto_20108 ?auto_20110 ) ( AVAILABLE ?auto_20108 ) ( SURFACE-AT ?auto_20094 ?auto_20110 ) ( ON ?auto_20094 ?auto_20109 ) ( CLEAR ?auto_20094 ) ( not ( = ?auto_20093 ?auto_20094 ) ) ( not ( = ?auto_20093 ?auto_20109 ) ) ( not ( = ?auto_20094 ?auto_20109 ) ) ( not ( = ?auto_20101 ?auto_20108 ) ) ( IS-CRATE ?auto_20093 ) ( not ( = ?auto_20115 ?auto_20102 ) ) ( HOIST-AT ?auto_20112 ?auto_20115 ) ( AVAILABLE ?auto_20112 ) ( SURFACE-AT ?auto_20093 ?auto_20115 ) ( ON ?auto_20093 ?auto_20104 ) ( CLEAR ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( not ( = ?auto_20092 ?auto_20104 ) ) ( not ( = ?auto_20093 ?auto_20104 ) ) ( not ( = ?auto_20101 ?auto_20112 ) ) ( IS-CRATE ?auto_20092 ) ( not ( = ?auto_20113 ?auto_20102 ) ) ( HOIST-AT ?auto_20111 ?auto_20113 ) ( AVAILABLE ?auto_20111 ) ( SURFACE-AT ?auto_20092 ?auto_20113 ) ( ON ?auto_20092 ?auto_20114 ) ( CLEAR ?auto_20092 ) ( not ( = ?auto_20091 ?auto_20092 ) ) ( not ( = ?auto_20091 ?auto_20114 ) ) ( not ( = ?auto_20092 ?auto_20114 ) ) ( not ( = ?auto_20101 ?auto_20111 ) ) ( SURFACE-AT ?auto_20090 ?auto_20102 ) ( CLEAR ?auto_20090 ) ( IS-CRATE ?auto_20091 ) ( AVAILABLE ?auto_20101 ) ( not ( = ?auto_20105 ?auto_20102 ) ) ( HOIST-AT ?auto_20106 ?auto_20105 ) ( AVAILABLE ?auto_20106 ) ( SURFACE-AT ?auto_20091 ?auto_20105 ) ( ON ?auto_20091 ?auto_20103 ) ( CLEAR ?auto_20091 ) ( TRUCK-AT ?auto_20100 ?auto_20102 ) ( not ( = ?auto_20090 ?auto_20091 ) ) ( not ( = ?auto_20090 ?auto_20103 ) ) ( not ( = ?auto_20091 ?auto_20103 ) ) ( not ( = ?auto_20101 ?auto_20106 ) ) ( not ( = ?auto_20090 ?auto_20092 ) ) ( not ( = ?auto_20090 ?auto_20114 ) ) ( not ( = ?auto_20092 ?auto_20103 ) ) ( not ( = ?auto_20113 ?auto_20105 ) ) ( not ( = ?auto_20111 ?auto_20106 ) ) ( not ( = ?auto_20114 ?auto_20103 ) ) ( not ( = ?auto_20090 ?auto_20093 ) ) ( not ( = ?auto_20090 ?auto_20104 ) ) ( not ( = ?auto_20091 ?auto_20093 ) ) ( not ( = ?auto_20091 ?auto_20104 ) ) ( not ( = ?auto_20093 ?auto_20114 ) ) ( not ( = ?auto_20093 ?auto_20103 ) ) ( not ( = ?auto_20115 ?auto_20113 ) ) ( not ( = ?auto_20115 ?auto_20105 ) ) ( not ( = ?auto_20112 ?auto_20111 ) ) ( not ( = ?auto_20112 ?auto_20106 ) ) ( not ( = ?auto_20104 ?auto_20114 ) ) ( not ( = ?auto_20104 ?auto_20103 ) ) ( not ( = ?auto_20090 ?auto_20094 ) ) ( not ( = ?auto_20090 ?auto_20109 ) ) ( not ( = ?auto_20091 ?auto_20094 ) ) ( not ( = ?auto_20091 ?auto_20109 ) ) ( not ( = ?auto_20092 ?auto_20094 ) ) ( not ( = ?auto_20092 ?auto_20109 ) ) ( not ( = ?auto_20094 ?auto_20104 ) ) ( not ( = ?auto_20094 ?auto_20114 ) ) ( not ( = ?auto_20094 ?auto_20103 ) ) ( not ( = ?auto_20110 ?auto_20115 ) ) ( not ( = ?auto_20110 ?auto_20113 ) ) ( not ( = ?auto_20110 ?auto_20105 ) ) ( not ( = ?auto_20108 ?auto_20112 ) ) ( not ( = ?auto_20108 ?auto_20111 ) ) ( not ( = ?auto_20108 ?auto_20106 ) ) ( not ( = ?auto_20109 ?auto_20104 ) ) ( not ( = ?auto_20109 ?auto_20114 ) ) ( not ( = ?auto_20109 ?auto_20103 ) ) ( not ( = ?auto_20090 ?auto_20095 ) ) ( not ( = ?auto_20090 ?auto_20107 ) ) ( not ( = ?auto_20091 ?auto_20095 ) ) ( not ( = ?auto_20091 ?auto_20107 ) ) ( not ( = ?auto_20092 ?auto_20095 ) ) ( not ( = ?auto_20092 ?auto_20107 ) ) ( not ( = ?auto_20093 ?auto_20095 ) ) ( not ( = ?auto_20093 ?auto_20107 ) ) ( not ( = ?auto_20095 ?auto_20109 ) ) ( not ( = ?auto_20095 ?auto_20104 ) ) ( not ( = ?auto_20095 ?auto_20114 ) ) ( not ( = ?auto_20095 ?auto_20103 ) ) ( not ( = ?auto_20098 ?auto_20110 ) ) ( not ( = ?auto_20098 ?auto_20115 ) ) ( not ( = ?auto_20098 ?auto_20113 ) ) ( not ( = ?auto_20098 ?auto_20105 ) ) ( not ( = ?auto_20099 ?auto_20108 ) ) ( not ( = ?auto_20099 ?auto_20112 ) ) ( not ( = ?auto_20099 ?auto_20111 ) ) ( not ( = ?auto_20099 ?auto_20106 ) ) ( not ( = ?auto_20107 ?auto_20109 ) ) ( not ( = ?auto_20107 ?auto_20104 ) ) ( not ( = ?auto_20107 ?auto_20114 ) ) ( not ( = ?auto_20107 ?auto_20103 ) ) ( not ( = ?auto_20090 ?auto_20096 ) ) ( not ( = ?auto_20090 ?auto_20097 ) ) ( not ( = ?auto_20091 ?auto_20096 ) ) ( not ( = ?auto_20091 ?auto_20097 ) ) ( not ( = ?auto_20092 ?auto_20096 ) ) ( not ( = ?auto_20092 ?auto_20097 ) ) ( not ( = ?auto_20093 ?auto_20096 ) ) ( not ( = ?auto_20093 ?auto_20097 ) ) ( not ( = ?auto_20094 ?auto_20096 ) ) ( not ( = ?auto_20094 ?auto_20097 ) ) ( not ( = ?auto_20096 ?auto_20107 ) ) ( not ( = ?auto_20096 ?auto_20109 ) ) ( not ( = ?auto_20096 ?auto_20104 ) ) ( not ( = ?auto_20096 ?auto_20114 ) ) ( not ( = ?auto_20096 ?auto_20103 ) ) ( not ( = ?auto_20097 ?auto_20107 ) ) ( not ( = ?auto_20097 ?auto_20109 ) ) ( not ( = ?auto_20097 ?auto_20104 ) ) ( not ( = ?auto_20097 ?auto_20114 ) ) ( not ( = ?auto_20097 ?auto_20103 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20090 ?auto_20091 ?auto_20092 ?auto_20093 ?auto_20094 ?auto_20095 )
      ( MAKE-1CRATE ?auto_20095 ?auto_20096 )
      ( MAKE-6CRATE-VERIFY ?auto_20090 ?auto_20091 ?auto_20092 ?auto_20093 ?auto_20094 ?auto_20095 ?auto_20096 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20118 - SURFACE
      ?auto_20119 - SURFACE
    )
    :vars
    (
      ?auto_20120 - HOIST
      ?auto_20121 - PLACE
      ?auto_20123 - PLACE
      ?auto_20124 - HOIST
      ?auto_20125 - SURFACE
      ?auto_20122 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20120 ?auto_20121 ) ( SURFACE-AT ?auto_20118 ?auto_20121 ) ( CLEAR ?auto_20118 ) ( IS-CRATE ?auto_20119 ) ( AVAILABLE ?auto_20120 ) ( not ( = ?auto_20123 ?auto_20121 ) ) ( HOIST-AT ?auto_20124 ?auto_20123 ) ( AVAILABLE ?auto_20124 ) ( SURFACE-AT ?auto_20119 ?auto_20123 ) ( ON ?auto_20119 ?auto_20125 ) ( CLEAR ?auto_20119 ) ( TRUCK-AT ?auto_20122 ?auto_20121 ) ( not ( = ?auto_20118 ?auto_20119 ) ) ( not ( = ?auto_20118 ?auto_20125 ) ) ( not ( = ?auto_20119 ?auto_20125 ) ) ( not ( = ?auto_20120 ?auto_20124 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20122 ?auto_20121 ?auto_20123 )
      ( !LIFT ?auto_20124 ?auto_20119 ?auto_20125 ?auto_20123 )
      ( !LOAD ?auto_20124 ?auto_20119 ?auto_20122 ?auto_20123 )
      ( !DRIVE ?auto_20122 ?auto_20123 ?auto_20121 )
      ( !UNLOAD ?auto_20120 ?auto_20119 ?auto_20122 ?auto_20121 )
      ( !DROP ?auto_20120 ?auto_20119 ?auto_20118 ?auto_20121 )
      ( MAKE-1CRATE-VERIFY ?auto_20118 ?auto_20119 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_20134 - SURFACE
      ?auto_20135 - SURFACE
      ?auto_20136 - SURFACE
      ?auto_20137 - SURFACE
      ?auto_20138 - SURFACE
      ?auto_20139 - SURFACE
      ?auto_20140 - SURFACE
      ?auto_20141 - SURFACE
    )
    :vars
    (
      ?auto_20145 - HOIST
      ?auto_20146 - PLACE
      ?auto_20143 - PLACE
      ?auto_20142 - HOIST
      ?auto_20144 - SURFACE
      ?auto_20159 - PLACE
      ?auto_20160 - HOIST
      ?auto_20153 - SURFACE
      ?auto_20150 - SURFACE
      ?auto_20157 - PLACE
      ?auto_20149 - HOIST
      ?auto_20148 - SURFACE
      ?auto_20156 - PLACE
      ?auto_20154 - HOIST
      ?auto_20151 - SURFACE
      ?auto_20155 - SURFACE
      ?auto_20152 - PLACE
      ?auto_20161 - HOIST
      ?auto_20158 - SURFACE
      ?auto_20147 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20145 ?auto_20146 ) ( IS-CRATE ?auto_20141 ) ( not ( = ?auto_20143 ?auto_20146 ) ) ( HOIST-AT ?auto_20142 ?auto_20143 ) ( SURFACE-AT ?auto_20141 ?auto_20143 ) ( ON ?auto_20141 ?auto_20144 ) ( CLEAR ?auto_20141 ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20144 ) ) ( not ( = ?auto_20141 ?auto_20144 ) ) ( not ( = ?auto_20145 ?auto_20142 ) ) ( IS-CRATE ?auto_20140 ) ( not ( = ?auto_20159 ?auto_20146 ) ) ( HOIST-AT ?auto_20160 ?auto_20159 ) ( SURFACE-AT ?auto_20140 ?auto_20159 ) ( ON ?auto_20140 ?auto_20153 ) ( CLEAR ?auto_20140 ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( not ( = ?auto_20139 ?auto_20153 ) ) ( not ( = ?auto_20140 ?auto_20153 ) ) ( not ( = ?auto_20145 ?auto_20160 ) ) ( IS-CRATE ?auto_20139 ) ( AVAILABLE ?auto_20160 ) ( SURFACE-AT ?auto_20139 ?auto_20159 ) ( ON ?auto_20139 ?auto_20150 ) ( CLEAR ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20150 ) ) ( not ( = ?auto_20139 ?auto_20150 ) ) ( IS-CRATE ?auto_20138 ) ( not ( = ?auto_20157 ?auto_20146 ) ) ( HOIST-AT ?auto_20149 ?auto_20157 ) ( AVAILABLE ?auto_20149 ) ( SURFACE-AT ?auto_20138 ?auto_20157 ) ( ON ?auto_20138 ?auto_20148 ) ( CLEAR ?auto_20138 ) ( not ( = ?auto_20137 ?auto_20138 ) ) ( not ( = ?auto_20137 ?auto_20148 ) ) ( not ( = ?auto_20138 ?auto_20148 ) ) ( not ( = ?auto_20145 ?auto_20149 ) ) ( IS-CRATE ?auto_20137 ) ( not ( = ?auto_20156 ?auto_20146 ) ) ( HOIST-AT ?auto_20154 ?auto_20156 ) ( AVAILABLE ?auto_20154 ) ( SURFACE-AT ?auto_20137 ?auto_20156 ) ( ON ?auto_20137 ?auto_20151 ) ( CLEAR ?auto_20137 ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20151 ) ) ( not ( = ?auto_20137 ?auto_20151 ) ) ( not ( = ?auto_20145 ?auto_20154 ) ) ( IS-CRATE ?auto_20136 ) ( AVAILABLE ?auto_20142 ) ( SURFACE-AT ?auto_20136 ?auto_20143 ) ( ON ?auto_20136 ?auto_20155 ) ( CLEAR ?auto_20136 ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20155 ) ) ( not ( = ?auto_20136 ?auto_20155 ) ) ( SURFACE-AT ?auto_20134 ?auto_20146 ) ( CLEAR ?auto_20134 ) ( IS-CRATE ?auto_20135 ) ( AVAILABLE ?auto_20145 ) ( not ( = ?auto_20152 ?auto_20146 ) ) ( HOIST-AT ?auto_20161 ?auto_20152 ) ( AVAILABLE ?auto_20161 ) ( SURFACE-AT ?auto_20135 ?auto_20152 ) ( ON ?auto_20135 ?auto_20158 ) ( CLEAR ?auto_20135 ) ( TRUCK-AT ?auto_20147 ?auto_20146 ) ( not ( = ?auto_20134 ?auto_20135 ) ) ( not ( = ?auto_20134 ?auto_20158 ) ) ( not ( = ?auto_20135 ?auto_20158 ) ) ( not ( = ?auto_20145 ?auto_20161 ) ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20134 ?auto_20155 ) ) ( not ( = ?auto_20136 ?auto_20158 ) ) ( not ( = ?auto_20143 ?auto_20152 ) ) ( not ( = ?auto_20142 ?auto_20161 ) ) ( not ( = ?auto_20155 ?auto_20158 ) ) ( not ( = ?auto_20134 ?auto_20137 ) ) ( not ( = ?auto_20134 ?auto_20151 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20151 ) ) ( not ( = ?auto_20137 ?auto_20155 ) ) ( not ( = ?auto_20137 ?auto_20158 ) ) ( not ( = ?auto_20156 ?auto_20143 ) ) ( not ( = ?auto_20156 ?auto_20152 ) ) ( not ( = ?auto_20154 ?auto_20142 ) ) ( not ( = ?auto_20154 ?auto_20161 ) ) ( not ( = ?auto_20151 ?auto_20155 ) ) ( not ( = ?auto_20151 ?auto_20158 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20134 ?auto_20148 ) ) ( not ( = ?auto_20135 ?auto_20138 ) ) ( not ( = ?auto_20135 ?auto_20148 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20148 ) ) ( not ( = ?auto_20138 ?auto_20151 ) ) ( not ( = ?auto_20138 ?auto_20155 ) ) ( not ( = ?auto_20138 ?auto_20158 ) ) ( not ( = ?auto_20157 ?auto_20156 ) ) ( not ( = ?auto_20157 ?auto_20143 ) ) ( not ( = ?auto_20157 ?auto_20152 ) ) ( not ( = ?auto_20149 ?auto_20154 ) ) ( not ( = ?auto_20149 ?auto_20142 ) ) ( not ( = ?auto_20149 ?auto_20161 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20155 ) ) ( not ( = ?auto_20148 ?auto_20158 ) ) ( not ( = ?auto_20134 ?auto_20139 ) ) ( not ( = ?auto_20134 ?auto_20150 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( not ( = ?auto_20135 ?auto_20150 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20150 ) ) ( not ( = ?auto_20137 ?auto_20139 ) ) ( not ( = ?auto_20137 ?auto_20150 ) ) ( not ( = ?auto_20139 ?auto_20148 ) ) ( not ( = ?auto_20139 ?auto_20151 ) ) ( not ( = ?auto_20139 ?auto_20155 ) ) ( not ( = ?auto_20139 ?auto_20158 ) ) ( not ( = ?auto_20159 ?auto_20157 ) ) ( not ( = ?auto_20159 ?auto_20156 ) ) ( not ( = ?auto_20159 ?auto_20143 ) ) ( not ( = ?auto_20159 ?auto_20152 ) ) ( not ( = ?auto_20160 ?auto_20149 ) ) ( not ( = ?auto_20160 ?auto_20154 ) ) ( not ( = ?auto_20160 ?auto_20142 ) ) ( not ( = ?auto_20160 ?auto_20161 ) ) ( not ( = ?auto_20150 ?auto_20148 ) ) ( not ( = ?auto_20150 ?auto_20151 ) ) ( not ( = ?auto_20150 ?auto_20155 ) ) ( not ( = ?auto_20150 ?auto_20158 ) ) ( not ( = ?auto_20134 ?auto_20140 ) ) ( not ( = ?auto_20134 ?auto_20153 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20153 ) ) ( not ( = ?auto_20136 ?auto_20140 ) ) ( not ( = ?auto_20136 ?auto_20153 ) ) ( not ( = ?auto_20137 ?auto_20140 ) ) ( not ( = ?auto_20137 ?auto_20153 ) ) ( not ( = ?auto_20138 ?auto_20140 ) ) ( not ( = ?auto_20138 ?auto_20153 ) ) ( not ( = ?auto_20140 ?auto_20150 ) ) ( not ( = ?auto_20140 ?auto_20148 ) ) ( not ( = ?auto_20140 ?auto_20151 ) ) ( not ( = ?auto_20140 ?auto_20155 ) ) ( not ( = ?auto_20140 ?auto_20158 ) ) ( not ( = ?auto_20153 ?auto_20150 ) ) ( not ( = ?auto_20153 ?auto_20148 ) ) ( not ( = ?auto_20153 ?auto_20151 ) ) ( not ( = ?auto_20153 ?auto_20155 ) ) ( not ( = ?auto_20153 ?auto_20158 ) ) ( not ( = ?auto_20134 ?auto_20141 ) ) ( not ( = ?auto_20134 ?auto_20144 ) ) ( not ( = ?auto_20135 ?auto_20141 ) ) ( not ( = ?auto_20135 ?auto_20144 ) ) ( not ( = ?auto_20136 ?auto_20141 ) ) ( not ( = ?auto_20136 ?auto_20144 ) ) ( not ( = ?auto_20137 ?auto_20141 ) ) ( not ( = ?auto_20137 ?auto_20144 ) ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20138 ?auto_20144 ) ) ( not ( = ?auto_20139 ?auto_20141 ) ) ( not ( = ?auto_20139 ?auto_20144 ) ) ( not ( = ?auto_20141 ?auto_20153 ) ) ( not ( = ?auto_20141 ?auto_20150 ) ) ( not ( = ?auto_20141 ?auto_20148 ) ) ( not ( = ?auto_20141 ?auto_20151 ) ) ( not ( = ?auto_20141 ?auto_20155 ) ) ( not ( = ?auto_20141 ?auto_20158 ) ) ( not ( = ?auto_20144 ?auto_20153 ) ) ( not ( = ?auto_20144 ?auto_20150 ) ) ( not ( = ?auto_20144 ?auto_20148 ) ) ( not ( = ?auto_20144 ?auto_20151 ) ) ( not ( = ?auto_20144 ?auto_20155 ) ) ( not ( = ?auto_20144 ?auto_20158 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20134 ?auto_20135 ?auto_20136 ?auto_20137 ?auto_20138 ?auto_20139 ?auto_20140 )
      ( MAKE-1CRATE ?auto_20140 ?auto_20141 )
      ( MAKE-7CRATE-VERIFY ?auto_20134 ?auto_20135 ?auto_20136 ?auto_20137 ?auto_20138 ?auto_20139 ?auto_20140 ?auto_20141 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20164 - SURFACE
      ?auto_20165 - SURFACE
    )
    :vars
    (
      ?auto_20166 - HOIST
      ?auto_20167 - PLACE
      ?auto_20169 - PLACE
      ?auto_20170 - HOIST
      ?auto_20171 - SURFACE
      ?auto_20168 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20166 ?auto_20167 ) ( SURFACE-AT ?auto_20164 ?auto_20167 ) ( CLEAR ?auto_20164 ) ( IS-CRATE ?auto_20165 ) ( AVAILABLE ?auto_20166 ) ( not ( = ?auto_20169 ?auto_20167 ) ) ( HOIST-AT ?auto_20170 ?auto_20169 ) ( AVAILABLE ?auto_20170 ) ( SURFACE-AT ?auto_20165 ?auto_20169 ) ( ON ?auto_20165 ?auto_20171 ) ( CLEAR ?auto_20165 ) ( TRUCK-AT ?auto_20168 ?auto_20167 ) ( not ( = ?auto_20164 ?auto_20165 ) ) ( not ( = ?auto_20164 ?auto_20171 ) ) ( not ( = ?auto_20165 ?auto_20171 ) ) ( not ( = ?auto_20166 ?auto_20170 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20168 ?auto_20167 ?auto_20169 )
      ( !LIFT ?auto_20170 ?auto_20165 ?auto_20171 ?auto_20169 )
      ( !LOAD ?auto_20170 ?auto_20165 ?auto_20168 ?auto_20169 )
      ( !DRIVE ?auto_20168 ?auto_20169 ?auto_20167 )
      ( !UNLOAD ?auto_20166 ?auto_20165 ?auto_20168 ?auto_20167 )
      ( !DROP ?auto_20166 ?auto_20165 ?auto_20164 ?auto_20167 )
      ( MAKE-1CRATE-VERIFY ?auto_20164 ?auto_20165 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_20181 - SURFACE
      ?auto_20182 - SURFACE
      ?auto_20183 - SURFACE
      ?auto_20184 - SURFACE
      ?auto_20185 - SURFACE
      ?auto_20186 - SURFACE
      ?auto_20187 - SURFACE
      ?auto_20189 - SURFACE
      ?auto_20188 - SURFACE
    )
    :vars
    (
      ?auto_20192 - HOIST
      ?auto_20194 - PLACE
      ?auto_20195 - PLACE
      ?auto_20191 - HOIST
      ?auto_20190 - SURFACE
      ?auto_20210 - SURFACE
      ?auto_20201 - PLACE
      ?auto_20202 - HOIST
      ?auto_20206 - SURFACE
      ?auto_20196 - SURFACE
      ?auto_20200 - PLACE
      ?auto_20208 - HOIST
      ?auto_20197 - SURFACE
      ?auto_20198 - PLACE
      ?auto_20205 - HOIST
      ?auto_20209 - SURFACE
      ?auto_20204 - SURFACE
      ?auto_20207 - PLACE
      ?auto_20203 - HOIST
      ?auto_20199 - SURFACE
      ?auto_20193 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20192 ?auto_20194 ) ( IS-CRATE ?auto_20188 ) ( not ( = ?auto_20195 ?auto_20194 ) ) ( HOIST-AT ?auto_20191 ?auto_20195 ) ( SURFACE-AT ?auto_20188 ?auto_20195 ) ( ON ?auto_20188 ?auto_20190 ) ( CLEAR ?auto_20188 ) ( not ( = ?auto_20189 ?auto_20188 ) ) ( not ( = ?auto_20189 ?auto_20190 ) ) ( not ( = ?auto_20188 ?auto_20190 ) ) ( not ( = ?auto_20192 ?auto_20191 ) ) ( IS-CRATE ?auto_20189 ) ( SURFACE-AT ?auto_20189 ?auto_20195 ) ( ON ?auto_20189 ?auto_20210 ) ( CLEAR ?auto_20189 ) ( not ( = ?auto_20187 ?auto_20189 ) ) ( not ( = ?auto_20187 ?auto_20210 ) ) ( not ( = ?auto_20189 ?auto_20210 ) ) ( IS-CRATE ?auto_20187 ) ( not ( = ?auto_20201 ?auto_20194 ) ) ( HOIST-AT ?auto_20202 ?auto_20201 ) ( SURFACE-AT ?auto_20187 ?auto_20201 ) ( ON ?auto_20187 ?auto_20206 ) ( CLEAR ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( not ( = ?auto_20186 ?auto_20206 ) ) ( not ( = ?auto_20187 ?auto_20206 ) ) ( not ( = ?auto_20192 ?auto_20202 ) ) ( IS-CRATE ?auto_20186 ) ( AVAILABLE ?auto_20202 ) ( SURFACE-AT ?auto_20186 ?auto_20201 ) ( ON ?auto_20186 ?auto_20196 ) ( CLEAR ?auto_20186 ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20196 ) ) ( not ( = ?auto_20186 ?auto_20196 ) ) ( IS-CRATE ?auto_20185 ) ( not ( = ?auto_20200 ?auto_20194 ) ) ( HOIST-AT ?auto_20208 ?auto_20200 ) ( AVAILABLE ?auto_20208 ) ( SURFACE-AT ?auto_20185 ?auto_20200 ) ( ON ?auto_20185 ?auto_20197 ) ( CLEAR ?auto_20185 ) ( not ( = ?auto_20184 ?auto_20185 ) ) ( not ( = ?auto_20184 ?auto_20197 ) ) ( not ( = ?auto_20185 ?auto_20197 ) ) ( not ( = ?auto_20192 ?auto_20208 ) ) ( IS-CRATE ?auto_20184 ) ( not ( = ?auto_20198 ?auto_20194 ) ) ( HOIST-AT ?auto_20205 ?auto_20198 ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20184 ?auto_20198 ) ( ON ?auto_20184 ?auto_20209 ) ( CLEAR ?auto_20184 ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20209 ) ) ( not ( = ?auto_20184 ?auto_20209 ) ) ( not ( = ?auto_20192 ?auto_20205 ) ) ( IS-CRATE ?auto_20183 ) ( AVAILABLE ?auto_20191 ) ( SURFACE-AT ?auto_20183 ?auto_20195 ) ( ON ?auto_20183 ?auto_20204 ) ( CLEAR ?auto_20183 ) ( not ( = ?auto_20182 ?auto_20183 ) ) ( not ( = ?auto_20182 ?auto_20204 ) ) ( not ( = ?auto_20183 ?auto_20204 ) ) ( SURFACE-AT ?auto_20181 ?auto_20194 ) ( CLEAR ?auto_20181 ) ( IS-CRATE ?auto_20182 ) ( AVAILABLE ?auto_20192 ) ( not ( = ?auto_20207 ?auto_20194 ) ) ( HOIST-AT ?auto_20203 ?auto_20207 ) ( AVAILABLE ?auto_20203 ) ( SURFACE-AT ?auto_20182 ?auto_20207 ) ( ON ?auto_20182 ?auto_20199 ) ( CLEAR ?auto_20182 ) ( TRUCK-AT ?auto_20193 ?auto_20194 ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20199 ) ) ( not ( = ?auto_20182 ?auto_20199 ) ) ( not ( = ?auto_20192 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20183 ) ) ( not ( = ?auto_20181 ?auto_20204 ) ) ( not ( = ?auto_20183 ?auto_20199 ) ) ( not ( = ?auto_20195 ?auto_20207 ) ) ( not ( = ?auto_20191 ?auto_20203 ) ) ( not ( = ?auto_20204 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20184 ) ) ( not ( = ?auto_20181 ?auto_20209 ) ) ( not ( = ?auto_20182 ?auto_20184 ) ) ( not ( = ?auto_20182 ?auto_20209 ) ) ( not ( = ?auto_20184 ?auto_20204 ) ) ( not ( = ?auto_20184 ?auto_20199 ) ) ( not ( = ?auto_20198 ?auto_20195 ) ) ( not ( = ?auto_20198 ?auto_20207 ) ) ( not ( = ?auto_20205 ?auto_20191 ) ) ( not ( = ?auto_20205 ?auto_20203 ) ) ( not ( = ?auto_20209 ?auto_20204 ) ) ( not ( = ?auto_20209 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20185 ) ) ( not ( = ?auto_20181 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20197 ) ) ( not ( = ?auto_20185 ?auto_20209 ) ) ( not ( = ?auto_20185 ?auto_20204 ) ) ( not ( = ?auto_20185 ?auto_20199 ) ) ( not ( = ?auto_20200 ?auto_20198 ) ) ( not ( = ?auto_20200 ?auto_20195 ) ) ( not ( = ?auto_20200 ?auto_20207 ) ) ( not ( = ?auto_20208 ?auto_20205 ) ) ( not ( = ?auto_20208 ?auto_20191 ) ) ( not ( = ?auto_20208 ?auto_20203 ) ) ( not ( = ?auto_20197 ?auto_20209 ) ) ( not ( = ?auto_20197 ?auto_20204 ) ) ( not ( = ?auto_20197 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20186 ) ) ( not ( = ?auto_20181 ?auto_20196 ) ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20196 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20183 ?auto_20196 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20196 ) ) ( not ( = ?auto_20186 ?auto_20197 ) ) ( not ( = ?auto_20186 ?auto_20209 ) ) ( not ( = ?auto_20186 ?auto_20204 ) ) ( not ( = ?auto_20186 ?auto_20199 ) ) ( not ( = ?auto_20201 ?auto_20200 ) ) ( not ( = ?auto_20201 ?auto_20198 ) ) ( not ( = ?auto_20201 ?auto_20195 ) ) ( not ( = ?auto_20201 ?auto_20207 ) ) ( not ( = ?auto_20202 ?auto_20208 ) ) ( not ( = ?auto_20202 ?auto_20205 ) ) ( not ( = ?auto_20202 ?auto_20191 ) ) ( not ( = ?auto_20202 ?auto_20203 ) ) ( not ( = ?auto_20196 ?auto_20197 ) ) ( not ( = ?auto_20196 ?auto_20209 ) ) ( not ( = ?auto_20196 ?auto_20204 ) ) ( not ( = ?auto_20196 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20187 ) ) ( not ( = ?auto_20181 ?auto_20206 ) ) ( not ( = ?auto_20182 ?auto_20187 ) ) ( not ( = ?auto_20182 ?auto_20206 ) ) ( not ( = ?auto_20183 ?auto_20187 ) ) ( not ( = ?auto_20183 ?auto_20206 ) ) ( not ( = ?auto_20184 ?auto_20187 ) ) ( not ( = ?auto_20184 ?auto_20206 ) ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( not ( = ?auto_20185 ?auto_20206 ) ) ( not ( = ?auto_20187 ?auto_20196 ) ) ( not ( = ?auto_20187 ?auto_20197 ) ) ( not ( = ?auto_20187 ?auto_20209 ) ) ( not ( = ?auto_20187 ?auto_20204 ) ) ( not ( = ?auto_20187 ?auto_20199 ) ) ( not ( = ?auto_20206 ?auto_20196 ) ) ( not ( = ?auto_20206 ?auto_20197 ) ) ( not ( = ?auto_20206 ?auto_20209 ) ) ( not ( = ?auto_20206 ?auto_20204 ) ) ( not ( = ?auto_20206 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20189 ) ) ( not ( = ?auto_20181 ?auto_20210 ) ) ( not ( = ?auto_20182 ?auto_20189 ) ) ( not ( = ?auto_20182 ?auto_20210 ) ) ( not ( = ?auto_20183 ?auto_20189 ) ) ( not ( = ?auto_20183 ?auto_20210 ) ) ( not ( = ?auto_20184 ?auto_20189 ) ) ( not ( = ?auto_20184 ?auto_20210 ) ) ( not ( = ?auto_20185 ?auto_20189 ) ) ( not ( = ?auto_20185 ?auto_20210 ) ) ( not ( = ?auto_20186 ?auto_20189 ) ) ( not ( = ?auto_20186 ?auto_20210 ) ) ( not ( = ?auto_20189 ?auto_20206 ) ) ( not ( = ?auto_20189 ?auto_20196 ) ) ( not ( = ?auto_20189 ?auto_20197 ) ) ( not ( = ?auto_20189 ?auto_20209 ) ) ( not ( = ?auto_20189 ?auto_20204 ) ) ( not ( = ?auto_20189 ?auto_20199 ) ) ( not ( = ?auto_20210 ?auto_20206 ) ) ( not ( = ?auto_20210 ?auto_20196 ) ) ( not ( = ?auto_20210 ?auto_20197 ) ) ( not ( = ?auto_20210 ?auto_20209 ) ) ( not ( = ?auto_20210 ?auto_20204 ) ) ( not ( = ?auto_20210 ?auto_20199 ) ) ( not ( = ?auto_20181 ?auto_20188 ) ) ( not ( = ?auto_20181 ?auto_20190 ) ) ( not ( = ?auto_20182 ?auto_20188 ) ) ( not ( = ?auto_20182 ?auto_20190 ) ) ( not ( = ?auto_20183 ?auto_20188 ) ) ( not ( = ?auto_20183 ?auto_20190 ) ) ( not ( = ?auto_20184 ?auto_20188 ) ) ( not ( = ?auto_20184 ?auto_20190 ) ) ( not ( = ?auto_20185 ?auto_20188 ) ) ( not ( = ?auto_20185 ?auto_20190 ) ) ( not ( = ?auto_20186 ?auto_20188 ) ) ( not ( = ?auto_20186 ?auto_20190 ) ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20190 ) ) ( not ( = ?auto_20188 ?auto_20210 ) ) ( not ( = ?auto_20188 ?auto_20206 ) ) ( not ( = ?auto_20188 ?auto_20196 ) ) ( not ( = ?auto_20188 ?auto_20197 ) ) ( not ( = ?auto_20188 ?auto_20209 ) ) ( not ( = ?auto_20188 ?auto_20204 ) ) ( not ( = ?auto_20188 ?auto_20199 ) ) ( not ( = ?auto_20190 ?auto_20210 ) ) ( not ( = ?auto_20190 ?auto_20206 ) ) ( not ( = ?auto_20190 ?auto_20196 ) ) ( not ( = ?auto_20190 ?auto_20197 ) ) ( not ( = ?auto_20190 ?auto_20209 ) ) ( not ( = ?auto_20190 ?auto_20204 ) ) ( not ( = ?auto_20190 ?auto_20199 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 ?auto_20186 ?auto_20187 ?auto_20189 )
      ( MAKE-1CRATE ?auto_20189 ?auto_20188 )
      ( MAKE-8CRATE-VERIFY ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 ?auto_20186 ?auto_20187 ?auto_20189 ?auto_20188 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20213 - SURFACE
      ?auto_20214 - SURFACE
    )
    :vars
    (
      ?auto_20215 - HOIST
      ?auto_20216 - PLACE
      ?auto_20218 - PLACE
      ?auto_20219 - HOIST
      ?auto_20220 - SURFACE
      ?auto_20217 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20215 ?auto_20216 ) ( SURFACE-AT ?auto_20213 ?auto_20216 ) ( CLEAR ?auto_20213 ) ( IS-CRATE ?auto_20214 ) ( AVAILABLE ?auto_20215 ) ( not ( = ?auto_20218 ?auto_20216 ) ) ( HOIST-AT ?auto_20219 ?auto_20218 ) ( AVAILABLE ?auto_20219 ) ( SURFACE-AT ?auto_20214 ?auto_20218 ) ( ON ?auto_20214 ?auto_20220 ) ( CLEAR ?auto_20214 ) ( TRUCK-AT ?auto_20217 ?auto_20216 ) ( not ( = ?auto_20213 ?auto_20214 ) ) ( not ( = ?auto_20213 ?auto_20220 ) ) ( not ( = ?auto_20214 ?auto_20220 ) ) ( not ( = ?auto_20215 ?auto_20219 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20217 ?auto_20216 ?auto_20218 )
      ( !LIFT ?auto_20219 ?auto_20214 ?auto_20220 ?auto_20218 )
      ( !LOAD ?auto_20219 ?auto_20214 ?auto_20217 ?auto_20218 )
      ( !DRIVE ?auto_20217 ?auto_20218 ?auto_20216 )
      ( !UNLOAD ?auto_20215 ?auto_20214 ?auto_20217 ?auto_20216 )
      ( !DROP ?auto_20215 ?auto_20214 ?auto_20213 ?auto_20216 )
      ( MAKE-1CRATE-VERIFY ?auto_20213 ?auto_20214 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_20231 - SURFACE
      ?auto_20232 - SURFACE
      ?auto_20233 - SURFACE
      ?auto_20234 - SURFACE
      ?auto_20235 - SURFACE
      ?auto_20236 - SURFACE
      ?auto_20237 - SURFACE
      ?auto_20240 - SURFACE
      ?auto_20239 - SURFACE
      ?auto_20238 - SURFACE
    )
    :vars
    (
      ?auto_20241 - HOIST
      ?auto_20245 - PLACE
      ?auto_20243 - PLACE
      ?auto_20244 - HOIST
      ?auto_20242 - SURFACE
      ?auto_20258 - PLACE
      ?auto_20253 - HOIST
      ?auto_20251 - SURFACE
      ?auto_20250 - SURFACE
      ?auto_20257 - PLACE
      ?auto_20249 - HOIST
      ?auto_20260 - SURFACE
      ?auto_20264 - SURFACE
      ?auto_20255 - PLACE
      ?auto_20263 - HOIST
      ?auto_20254 - SURFACE
      ?auto_20256 - PLACE
      ?auto_20261 - HOIST
      ?auto_20247 - SURFACE
      ?auto_20259 - SURFACE
      ?auto_20262 - PLACE
      ?auto_20248 - HOIST
      ?auto_20252 - SURFACE
      ?auto_20246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20241 ?auto_20245 ) ( IS-CRATE ?auto_20238 ) ( not ( = ?auto_20243 ?auto_20245 ) ) ( HOIST-AT ?auto_20244 ?auto_20243 ) ( AVAILABLE ?auto_20244 ) ( SURFACE-AT ?auto_20238 ?auto_20243 ) ( ON ?auto_20238 ?auto_20242 ) ( CLEAR ?auto_20238 ) ( not ( = ?auto_20239 ?auto_20238 ) ) ( not ( = ?auto_20239 ?auto_20242 ) ) ( not ( = ?auto_20238 ?auto_20242 ) ) ( not ( = ?auto_20241 ?auto_20244 ) ) ( IS-CRATE ?auto_20239 ) ( not ( = ?auto_20258 ?auto_20245 ) ) ( HOIST-AT ?auto_20253 ?auto_20258 ) ( SURFACE-AT ?auto_20239 ?auto_20258 ) ( ON ?auto_20239 ?auto_20251 ) ( CLEAR ?auto_20239 ) ( not ( = ?auto_20240 ?auto_20239 ) ) ( not ( = ?auto_20240 ?auto_20251 ) ) ( not ( = ?auto_20239 ?auto_20251 ) ) ( not ( = ?auto_20241 ?auto_20253 ) ) ( IS-CRATE ?auto_20240 ) ( SURFACE-AT ?auto_20240 ?auto_20258 ) ( ON ?auto_20240 ?auto_20250 ) ( CLEAR ?auto_20240 ) ( not ( = ?auto_20237 ?auto_20240 ) ) ( not ( = ?auto_20237 ?auto_20250 ) ) ( not ( = ?auto_20240 ?auto_20250 ) ) ( IS-CRATE ?auto_20237 ) ( not ( = ?auto_20257 ?auto_20245 ) ) ( HOIST-AT ?auto_20249 ?auto_20257 ) ( SURFACE-AT ?auto_20237 ?auto_20257 ) ( ON ?auto_20237 ?auto_20260 ) ( CLEAR ?auto_20237 ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20260 ) ) ( not ( = ?auto_20237 ?auto_20260 ) ) ( not ( = ?auto_20241 ?auto_20249 ) ) ( IS-CRATE ?auto_20236 ) ( AVAILABLE ?auto_20249 ) ( SURFACE-AT ?auto_20236 ?auto_20257 ) ( ON ?auto_20236 ?auto_20264 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20235 ?auto_20236 ) ) ( not ( = ?auto_20235 ?auto_20264 ) ) ( not ( = ?auto_20236 ?auto_20264 ) ) ( IS-CRATE ?auto_20235 ) ( not ( = ?auto_20255 ?auto_20245 ) ) ( HOIST-AT ?auto_20263 ?auto_20255 ) ( AVAILABLE ?auto_20263 ) ( SURFACE-AT ?auto_20235 ?auto_20255 ) ( ON ?auto_20235 ?auto_20254 ) ( CLEAR ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( not ( = ?auto_20234 ?auto_20254 ) ) ( not ( = ?auto_20235 ?auto_20254 ) ) ( not ( = ?auto_20241 ?auto_20263 ) ) ( IS-CRATE ?auto_20234 ) ( not ( = ?auto_20256 ?auto_20245 ) ) ( HOIST-AT ?auto_20261 ?auto_20256 ) ( AVAILABLE ?auto_20261 ) ( SURFACE-AT ?auto_20234 ?auto_20256 ) ( ON ?auto_20234 ?auto_20247 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20233 ?auto_20234 ) ) ( not ( = ?auto_20233 ?auto_20247 ) ) ( not ( = ?auto_20234 ?auto_20247 ) ) ( not ( = ?auto_20241 ?auto_20261 ) ) ( IS-CRATE ?auto_20233 ) ( AVAILABLE ?auto_20253 ) ( SURFACE-AT ?auto_20233 ?auto_20258 ) ( ON ?auto_20233 ?auto_20259 ) ( CLEAR ?auto_20233 ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20259 ) ) ( not ( = ?auto_20233 ?auto_20259 ) ) ( SURFACE-AT ?auto_20231 ?auto_20245 ) ( CLEAR ?auto_20231 ) ( IS-CRATE ?auto_20232 ) ( AVAILABLE ?auto_20241 ) ( not ( = ?auto_20262 ?auto_20245 ) ) ( HOIST-AT ?auto_20248 ?auto_20262 ) ( AVAILABLE ?auto_20248 ) ( SURFACE-AT ?auto_20232 ?auto_20262 ) ( ON ?auto_20232 ?auto_20252 ) ( CLEAR ?auto_20232 ) ( TRUCK-AT ?auto_20246 ?auto_20245 ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20252 ) ) ( not ( = ?auto_20232 ?auto_20252 ) ) ( not ( = ?auto_20241 ?auto_20248 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20259 ) ) ( not ( = ?auto_20233 ?auto_20252 ) ) ( not ( = ?auto_20258 ?auto_20262 ) ) ( not ( = ?auto_20253 ?auto_20248 ) ) ( not ( = ?auto_20259 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20234 ) ) ( not ( = ?auto_20231 ?auto_20247 ) ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( not ( = ?auto_20232 ?auto_20247 ) ) ( not ( = ?auto_20234 ?auto_20259 ) ) ( not ( = ?auto_20234 ?auto_20252 ) ) ( not ( = ?auto_20256 ?auto_20258 ) ) ( not ( = ?auto_20256 ?auto_20262 ) ) ( not ( = ?auto_20261 ?auto_20253 ) ) ( not ( = ?auto_20261 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20259 ) ) ( not ( = ?auto_20247 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20235 ) ) ( not ( = ?auto_20231 ?auto_20254 ) ) ( not ( = ?auto_20232 ?auto_20235 ) ) ( not ( = ?auto_20232 ?auto_20254 ) ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20233 ?auto_20254 ) ) ( not ( = ?auto_20235 ?auto_20247 ) ) ( not ( = ?auto_20235 ?auto_20259 ) ) ( not ( = ?auto_20235 ?auto_20252 ) ) ( not ( = ?auto_20255 ?auto_20256 ) ) ( not ( = ?auto_20255 ?auto_20258 ) ) ( not ( = ?auto_20255 ?auto_20262 ) ) ( not ( = ?auto_20263 ?auto_20261 ) ) ( not ( = ?auto_20263 ?auto_20253 ) ) ( not ( = ?auto_20263 ?auto_20248 ) ) ( not ( = ?auto_20254 ?auto_20247 ) ) ( not ( = ?auto_20254 ?auto_20259 ) ) ( not ( = ?auto_20254 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20236 ) ) ( not ( = ?auto_20231 ?auto_20264 ) ) ( not ( = ?auto_20232 ?auto_20236 ) ) ( not ( = ?auto_20232 ?auto_20264 ) ) ( not ( = ?auto_20233 ?auto_20236 ) ) ( not ( = ?auto_20233 ?auto_20264 ) ) ( not ( = ?auto_20234 ?auto_20236 ) ) ( not ( = ?auto_20234 ?auto_20264 ) ) ( not ( = ?auto_20236 ?auto_20254 ) ) ( not ( = ?auto_20236 ?auto_20247 ) ) ( not ( = ?auto_20236 ?auto_20259 ) ) ( not ( = ?auto_20236 ?auto_20252 ) ) ( not ( = ?auto_20257 ?auto_20255 ) ) ( not ( = ?auto_20257 ?auto_20256 ) ) ( not ( = ?auto_20257 ?auto_20258 ) ) ( not ( = ?auto_20257 ?auto_20262 ) ) ( not ( = ?auto_20249 ?auto_20263 ) ) ( not ( = ?auto_20249 ?auto_20261 ) ) ( not ( = ?auto_20249 ?auto_20253 ) ) ( not ( = ?auto_20249 ?auto_20248 ) ) ( not ( = ?auto_20264 ?auto_20254 ) ) ( not ( = ?auto_20264 ?auto_20247 ) ) ( not ( = ?auto_20264 ?auto_20259 ) ) ( not ( = ?auto_20264 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20237 ) ) ( not ( = ?auto_20231 ?auto_20260 ) ) ( not ( = ?auto_20232 ?auto_20237 ) ) ( not ( = ?auto_20232 ?auto_20260 ) ) ( not ( = ?auto_20233 ?auto_20237 ) ) ( not ( = ?auto_20233 ?auto_20260 ) ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20234 ?auto_20260 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20260 ) ) ( not ( = ?auto_20237 ?auto_20264 ) ) ( not ( = ?auto_20237 ?auto_20254 ) ) ( not ( = ?auto_20237 ?auto_20247 ) ) ( not ( = ?auto_20237 ?auto_20259 ) ) ( not ( = ?auto_20237 ?auto_20252 ) ) ( not ( = ?auto_20260 ?auto_20264 ) ) ( not ( = ?auto_20260 ?auto_20254 ) ) ( not ( = ?auto_20260 ?auto_20247 ) ) ( not ( = ?auto_20260 ?auto_20259 ) ) ( not ( = ?auto_20260 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20240 ) ) ( not ( = ?auto_20231 ?auto_20250 ) ) ( not ( = ?auto_20232 ?auto_20240 ) ) ( not ( = ?auto_20232 ?auto_20250 ) ) ( not ( = ?auto_20233 ?auto_20240 ) ) ( not ( = ?auto_20233 ?auto_20250 ) ) ( not ( = ?auto_20234 ?auto_20240 ) ) ( not ( = ?auto_20234 ?auto_20250 ) ) ( not ( = ?auto_20235 ?auto_20240 ) ) ( not ( = ?auto_20235 ?auto_20250 ) ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20236 ?auto_20250 ) ) ( not ( = ?auto_20240 ?auto_20260 ) ) ( not ( = ?auto_20240 ?auto_20264 ) ) ( not ( = ?auto_20240 ?auto_20254 ) ) ( not ( = ?auto_20240 ?auto_20247 ) ) ( not ( = ?auto_20240 ?auto_20259 ) ) ( not ( = ?auto_20240 ?auto_20252 ) ) ( not ( = ?auto_20250 ?auto_20260 ) ) ( not ( = ?auto_20250 ?auto_20264 ) ) ( not ( = ?auto_20250 ?auto_20254 ) ) ( not ( = ?auto_20250 ?auto_20247 ) ) ( not ( = ?auto_20250 ?auto_20259 ) ) ( not ( = ?auto_20250 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20239 ) ) ( not ( = ?auto_20231 ?auto_20251 ) ) ( not ( = ?auto_20232 ?auto_20239 ) ) ( not ( = ?auto_20232 ?auto_20251 ) ) ( not ( = ?auto_20233 ?auto_20239 ) ) ( not ( = ?auto_20233 ?auto_20251 ) ) ( not ( = ?auto_20234 ?auto_20239 ) ) ( not ( = ?auto_20234 ?auto_20251 ) ) ( not ( = ?auto_20235 ?auto_20239 ) ) ( not ( = ?auto_20235 ?auto_20251 ) ) ( not ( = ?auto_20236 ?auto_20239 ) ) ( not ( = ?auto_20236 ?auto_20251 ) ) ( not ( = ?auto_20237 ?auto_20239 ) ) ( not ( = ?auto_20237 ?auto_20251 ) ) ( not ( = ?auto_20239 ?auto_20250 ) ) ( not ( = ?auto_20239 ?auto_20260 ) ) ( not ( = ?auto_20239 ?auto_20264 ) ) ( not ( = ?auto_20239 ?auto_20254 ) ) ( not ( = ?auto_20239 ?auto_20247 ) ) ( not ( = ?auto_20239 ?auto_20259 ) ) ( not ( = ?auto_20239 ?auto_20252 ) ) ( not ( = ?auto_20251 ?auto_20250 ) ) ( not ( = ?auto_20251 ?auto_20260 ) ) ( not ( = ?auto_20251 ?auto_20264 ) ) ( not ( = ?auto_20251 ?auto_20254 ) ) ( not ( = ?auto_20251 ?auto_20247 ) ) ( not ( = ?auto_20251 ?auto_20259 ) ) ( not ( = ?auto_20251 ?auto_20252 ) ) ( not ( = ?auto_20231 ?auto_20238 ) ) ( not ( = ?auto_20231 ?auto_20242 ) ) ( not ( = ?auto_20232 ?auto_20238 ) ) ( not ( = ?auto_20232 ?auto_20242 ) ) ( not ( = ?auto_20233 ?auto_20238 ) ) ( not ( = ?auto_20233 ?auto_20242 ) ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20234 ?auto_20242 ) ) ( not ( = ?auto_20235 ?auto_20238 ) ) ( not ( = ?auto_20235 ?auto_20242 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20242 ) ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20242 ) ) ( not ( = ?auto_20240 ?auto_20238 ) ) ( not ( = ?auto_20240 ?auto_20242 ) ) ( not ( = ?auto_20238 ?auto_20251 ) ) ( not ( = ?auto_20238 ?auto_20250 ) ) ( not ( = ?auto_20238 ?auto_20260 ) ) ( not ( = ?auto_20238 ?auto_20264 ) ) ( not ( = ?auto_20238 ?auto_20254 ) ) ( not ( = ?auto_20238 ?auto_20247 ) ) ( not ( = ?auto_20238 ?auto_20259 ) ) ( not ( = ?auto_20238 ?auto_20252 ) ) ( not ( = ?auto_20243 ?auto_20258 ) ) ( not ( = ?auto_20243 ?auto_20257 ) ) ( not ( = ?auto_20243 ?auto_20255 ) ) ( not ( = ?auto_20243 ?auto_20256 ) ) ( not ( = ?auto_20243 ?auto_20262 ) ) ( not ( = ?auto_20244 ?auto_20253 ) ) ( not ( = ?auto_20244 ?auto_20249 ) ) ( not ( = ?auto_20244 ?auto_20263 ) ) ( not ( = ?auto_20244 ?auto_20261 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20242 ?auto_20251 ) ) ( not ( = ?auto_20242 ?auto_20250 ) ) ( not ( = ?auto_20242 ?auto_20260 ) ) ( not ( = ?auto_20242 ?auto_20264 ) ) ( not ( = ?auto_20242 ?auto_20254 ) ) ( not ( = ?auto_20242 ?auto_20247 ) ) ( not ( = ?auto_20242 ?auto_20259 ) ) ( not ( = ?auto_20242 ?auto_20252 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20240 ?auto_20239 )
      ( MAKE-1CRATE ?auto_20239 ?auto_20238 )
      ( MAKE-9CRATE-VERIFY ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20240 ?auto_20239 ?auto_20238 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20267 - SURFACE
      ?auto_20268 - SURFACE
    )
    :vars
    (
      ?auto_20269 - HOIST
      ?auto_20270 - PLACE
      ?auto_20272 - PLACE
      ?auto_20273 - HOIST
      ?auto_20274 - SURFACE
      ?auto_20271 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20269 ?auto_20270 ) ( SURFACE-AT ?auto_20267 ?auto_20270 ) ( CLEAR ?auto_20267 ) ( IS-CRATE ?auto_20268 ) ( AVAILABLE ?auto_20269 ) ( not ( = ?auto_20272 ?auto_20270 ) ) ( HOIST-AT ?auto_20273 ?auto_20272 ) ( AVAILABLE ?auto_20273 ) ( SURFACE-AT ?auto_20268 ?auto_20272 ) ( ON ?auto_20268 ?auto_20274 ) ( CLEAR ?auto_20268 ) ( TRUCK-AT ?auto_20271 ?auto_20270 ) ( not ( = ?auto_20267 ?auto_20268 ) ) ( not ( = ?auto_20267 ?auto_20274 ) ) ( not ( = ?auto_20268 ?auto_20274 ) ) ( not ( = ?auto_20269 ?auto_20273 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20271 ?auto_20270 ?auto_20272 )
      ( !LIFT ?auto_20273 ?auto_20268 ?auto_20274 ?auto_20272 )
      ( !LOAD ?auto_20273 ?auto_20268 ?auto_20271 ?auto_20272 )
      ( !DRIVE ?auto_20271 ?auto_20272 ?auto_20270 )
      ( !UNLOAD ?auto_20269 ?auto_20268 ?auto_20271 ?auto_20270 )
      ( !DROP ?auto_20269 ?auto_20268 ?auto_20267 ?auto_20270 )
      ( MAKE-1CRATE-VERIFY ?auto_20267 ?auto_20268 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_20286 - SURFACE
      ?auto_20287 - SURFACE
      ?auto_20288 - SURFACE
      ?auto_20289 - SURFACE
      ?auto_20290 - SURFACE
      ?auto_20291 - SURFACE
      ?auto_20292 - SURFACE
      ?auto_20295 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20293 - SURFACE
      ?auto_20296 - SURFACE
    )
    :vars
    (
      ?auto_20297 - HOIST
      ?auto_20299 - PLACE
      ?auto_20301 - PLACE
      ?auto_20302 - HOIST
      ?auto_20300 - SURFACE
      ?auto_20308 - PLACE
      ?auto_20313 - HOIST
      ?auto_20309 - SURFACE
      ?auto_20312 - PLACE
      ?auto_20305 - HOIST
      ?auto_20307 - SURFACE
      ?auto_20304 - SURFACE
      ?auto_20316 - PLACE
      ?auto_20315 - HOIST
      ?auto_20310 - SURFACE
      ?auto_20320 - SURFACE
      ?auto_20317 - PLACE
      ?auto_20314 - HOIST
      ?auto_20323 - SURFACE
      ?auto_20319 - PLACE
      ?auto_20322 - HOIST
      ?auto_20303 - SURFACE
      ?auto_20318 - SURFACE
      ?auto_20311 - PLACE
      ?auto_20321 - HOIST
      ?auto_20306 - SURFACE
      ?auto_20298 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20297 ?auto_20299 ) ( IS-CRATE ?auto_20296 ) ( not ( = ?auto_20301 ?auto_20299 ) ) ( HOIST-AT ?auto_20302 ?auto_20301 ) ( AVAILABLE ?auto_20302 ) ( SURFACE-AT ?auto_20296 ?auto_20301 ) ( ON ?auto_20296 ?auto_20300 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20293 ?auto_20296 ) ) ( not ( = ?auto_20293 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20300 ) ) ( not ( = ?auto_20297 ?auto_20302 ) ) ( IS-CRATE ?auto_20293 ) ( not ( = ?auto_20308 ?auto_20299 ) ) ( HOIST-AT ?auto_20313 ?auto_20308 ) ( AVAILABLE ?auto_20313 ) ( SURFACE-AT ?auto_20293 ?auto_20308 ) ( ON ?auto_20293 ?auto_20309 ) ( CLEAR ?auto_20293 ) ( not ( = ?auto_20294 ?auto_20293 ) ) ( not ( = ?auto_20294 ?auto_20309 ) ) ( not ( = ?auto_20293 ?auto_20309 ) ) ( not ( = ?auto_20297 ?auto_20313 ) ) ( IS-CRATE ?auto_20294 ) ( not ( = ?auto_20312 ?auto_20299 ) ) ( HOIST-AT ?auto_20305 ?auto_20312 ) ( SURFACE-AT ?auto_20294 ?auto_20312 ) ( ON ?auto_20294 ?auto_20307 ) ( CLEAR ?auto_20294 ) ( not ( = ?auto_20295 ?auto_20294 ) ) ( not ( = ?auto_20295 ?auto_20307 ) ) ( not ( = ?auto_20294 ?auto_20307 ) ) ( not ( = ?auto_20297 ?auto_20305 ) ) ( IS-CRATE ?auto_20295 ) ( SURFACE-AT ?auto_20295 ?auto_20312 ) ( ON ?auto_20295 ?auto_20304 ) ( CLEAR ?auto_20295 ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20292 ?auto_20304 ) ) ( not ( = ?auto_20295 ?auto_20304 ) ) ( IS-CRATE ?auto_20292 ) ( not ( = ?auto_20316 ?auto_20299 ) ) ( HOIST-AT ?auto_20315 ?auto_20316 ) ( SURFACE-AT ?auto_20292 ?auto_20316 ) ( ON ?auto_20292 ?auto_20310 ) ( CLEAR ?auto_20292 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20310 ) ) ( not ( = ?auto_20292 ?auto_20310 ) ) ( not ( = ?auto_20297 ?auto_20315 ) ) ( IS-CRATE ?auto_20291 ) ( AVAILABLE ?auto_20315 ) ( SURFACE-AT ?auto_20291 ?auto_20316 ) ( ON ?auto_20291 ?auto_20320 ) ( CLEAR ?auto_20291 ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20320 ) ) ( IS-CRATE ?auto_20290 ) ( not ( = ?auto_20317 ?auto_20299 ) ) ( HOIST-AT ?auto_20314 ?auto_20317 ) ( AVAILABLE ?auto_20314 ) ( SURFACE-AT ?auto_20290 ?auto_20317 ) ( ON ?auto_20290 ?auto_20323 ) ( CLEAR ?auto_20290 ) ( not ( = ?auto_20289 ?auto_20290 ) ) ( not ( = ?auto_20289 ?auto_20323 ) ) ( not ( = ?auto_20290 ?auto_20323 ) ) ( not ( = ?auto_20297 ?auto_20314 ) ) ( IS-CRATE ?auto_20289 ) ( not ( = ?auto_20319 ?auto_20299 ) ) ( HOIST-AT ?auto_20322 ?auto_20319 ) ( AVAILABLE ?auto_20322 ) ( SURFACE-AT ?auto_20289 ?auto_20319 ) ( ON ?auto_20289 ?auto_20303 ) ( CLEAR ?auto_20289 ) ( not ( = ?auto_20288 ?auto_20289 ) ) ( not ( = ?auto_20288 ?auto_20303 ) ) ( not ( = ?auto_20289 ?auto_20303 ) ) ( not ( = ?auto_20297 ?auto_20322 ) ) ( IS-CRATE ?auto_20288 ) ( AVAILABLE ?auto_20305 ) ( SURFACE-AT ?auto_20288 ?auto_20312 ) ( ON ?auto_20288 ?auto_20318 ) ( CLEAR ?auto_20288 ) ( not ( = ?auto_20287 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20318 ) ) ( not ( = ?auto_20288 ?auto_20318 ) ) ( SURFACE-AT ?auto_20286 ?auto_20299 ) ( CLEAR ?auto_20286 ) ( IS-CRATE ?auto_20287 ) ( AVAILABLE ?auto_20297 ) ( not ( = ?auto_20311 ?auto_20299 ) ) ( HOIST-AT ?auto_20321 ?auto_20311 ) ( AVAILABLE ?auto_20321 ) ( SURFACE-AT ?auto_20287 ?auto_20311 ) ( ON ?auto_20287 ?auto_20306 ) ( CLEAR ?auto_20287 ) ( TRUCK-AT ?auto_20298 ?auto_20299 ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20306 ) ) ( not ( = ?auto_20287 ?auto_20306 ) ) ( not ( = ?auto_20297 ?auto_20321 ) ) ( not ( = ?auto_20286 ?auto_20288 ) ) ( not ( = ?auto_20286 ?auto_20318 ) ) ( not ( = ?auto_20288 ?auto_20306 ) ) ( not ( = ?auto_20312 ?auto_20311 ) ) ( not ( = ?auto_20305 ?auto_20321 ) ) ( not ( = ?auto_20318 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20289 ) ) ( not ( = ?auto_20286 ?auto_20303 ) ) ( not ( = ?auto_20287 ?auto_20289 ) ) ( not ( = ?auto_20287 ?auto_20303 ) ) ( not ( = ?auto_20289 ?auto_20318 ) ) ( not ( = ?auto_20289 ?auto_20306 ) ) ( not ( = ?auto_20319 ?auto_20312 ) ) ( not ( = ?auto_20319 ?auto_20311 ) ) ( not ( = ?auto_20322 ?auto_20305 ) ) ( not ( = ?auto_20322 ?auto_20321 ) ) ( not ( = ?auto_20303 ?auto_20318 ) ) ( not ( = ?auto_20303 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20290 ) ) ( not ( = ?auto_20286 ?auto_20323 ) ) ( not ( = ?auto_20287 ?auto_20290 ) ) ( not ( = ?auto_20287 ?auto_20323 ) ) ( not ( = ?auto_20288 ?auto_20290 ) ) ( not ( = ?auto_20288 ?auto_20323 ) ) ( not ( = ?auto_20290 ?auto_20303 ) ) ( not ( = ?auto_20290 ?auto_20318 ) ) ( not ( = ?auto_20290 ?auto_20306 ) ) ( not ( = ?auto_20317 ?auto_20319 ) ) ( not ( = ?auto_20317 ?auto_20312 ) ) ( not ( = ?auto_20317 ?auto_20311 ) ) ( not ( = ?auto_20314 ?auto_20322 ) ) ( not ( = ?auto_20314 ?auto_20305 ) ) ( not ( = ?auto_20314 ?auto_20321 ) ) ( not ( = ?auto_20323 ?auto_20303 ) ) ( not ( = ?auto_20323 ?auto_20318 ) ) ( not ( = ?auto_20323 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20291 ) ) ( not ( = ?auto_20286 ?auto_20320 ) ) ( not ( = ?auto_20287 ?auto_20291 ) ) ( not ( = ?auto_20287 ?auto_20320 ) ) ( not ( = ?auto_20288 ?auto_20291 ) ) ( not ( = ?auto_20288 ?auto_20320 ) ) ( not ( = ?auto_20289 ?auto_20291 ) ) ( not ( = ?auto_20289 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20323 ) ) ( not ( = ?auto_20291 ?auto_20303 ) ) ( not ( = ?auto_20291 ?auto_20318 ) ) ( not ( = ?auto_20291 ?auto_20306 ) ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( not ( = ?auto_20316 ?auto_20319 ) ) ( not ( = ?auto_20316 ?auto_20312 ) ) ( not ( = ?auto_20316 ?auto_20311 ) ) ( not ( = ?auto_20315 ?auto_20314 ) ) ( not ( = ?auto_20315 ?auto_20322 ) ) ( not ( = ?auto_20315 ?auto_20305 ) ) ( not ( = ?auto_20315 ?auto_20321 ) ) ( not ( = ?auto_20320 ?auto_20323 ) ) ( not ( = ?auto_20320 ?auto_20303 ) ) ( not ( = ?auto_20320 ?auto_20318 ) ) ( not ( = ?auto_20320 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20292 ) ) ( not ( = ?auto_20286 ?auto_20310 ) ) ( not ( = ?auto_20287 ?auto_20292 ) ) ( not ( = ?auto_20287 ?auto_20310 ) ) ( not ( = ?auto_20288 ?auto_20292 ) ) ( not ( = ?auto_20288 ?auto_20310 ) ) ( not ( = ?auto_20289 ?auto_20292 ) ) ( not ( = ?auto_20289 ?auto_20310 ) ) ( not ( = ?auto_20290 ?auto_20292 ) ) ( not ( = ?auto_20290 ?auto_20310 ) ) ( not ( = ?auto_20292 ?auto_20320 ) ) ( not ( = ?auto_20292 ?auto_20323 ) ) ( not ( = ?auto_20292 ?auto_20303 ) ) ( not ( = ?auto_20292 ?auto_20318 ) ) ( not ( = ?auto_20292 ?auto_20306 ) ) ( not ( = ?auto_20310 ?auto_20320 ) ) ( not ( = ?auto_20310 ?auto_20323 ) ) ( not ( = ?auto_20310 ?auto_20303 ) ) ( not ( = ?auto_20310 ?auto_20318 ) ) ( not ( = ?auto_20310 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20295 ) ) ( not ( = ?auto_20286 ?auto_20304 ) ) ( not ( = ?auto_20287 ?auto_20295 ) ) ( not ( = ?auto_20287 ?auto_20304 ) ) ( not ( = ?auto_20288 ?auto_20295 ) ) ( not ( = ?auto_20288 ?auto_20304 ) ) ( not ( = ?auto_20289 ?auto_20295 ) ) ( not ( = ?auto_20289 ?auto_20304 ) ) ( not ( = ?auto_20290 ?auto_20295 ) ) ( not ( = ?auto_20290 ?auto_20304 ) ) ( not ( = ?auto_20291 ?auto_20295 ) ) ( not ( = ?auto_20291 ?auto_20304 ) ) ( not ( = ?auto_20295 ?auto_20310 ) ) ( not ( = ?auto_20295 ?auto_20320 ) ) ( not ( = ?auto_20295 ?auto_20323 ) ) ( not ( = ?auto_20295 ?auto_20303 ) ) ( not ( = ?auto_20295 ?auto_20318 ) ) ( not ( = ?auto_20295 ?auto_20306 ) ) ( not ( = ?auto_20304 ?auto_20310 ) ) ( not ( = ?auto_20304 ?auto_20320 ) ) ( not ( = ?auto_20304 ?auto_20323 ) ) ( not ( = ?auto_20304 ?auto_20303 ) ) ( not ( = ?auto_20304 ?auto_20318 ) ) ( not ( = ?auto_20304 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20294 ) ) ( not ( = ?auto_20286 ?auto_20307 ) ) ( not ( = ?auto_20287 ?auto_20294 ) ) ( not ( = ?auto_20287 ?auto_20307 ) ) ( not ( = ?auto_20288 ?auto_20294 ) ) ( not ( = ?auto_20288 ?auto_20307 ) ) ( not ( = ?auto_20289 ?auto_20294 ) ) ( not ( = ?auto_20289 ?auto_20307 ) ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20307 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20307 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20307 ) ) ( not ( = ?auto_20294 ?auto_20304 ) ) ( not ( = ?auto_20294 ?auto_20310 ) ) ( not ( = ?auto_20294 ?auto_20320 ) ) ( not ( = ?auto_20294 ?auto_20323 ) ) ( not ( = ?auto_20294 ?auto_20303 ) ) ( not ( = ?auto_20294 ?auto_20318 ) ) ( not ( = ?auto_20294 ?auto_20306 ) ) ( not ( = ?auto_20307 ?auto_20304 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20307 ?auto_20320 ) ) ( not ( = ?auto_20307 ?auto_20323 ) ) ( not ( = ?auto_20307 ?auto_20303 ) ) ( not ( = ?auto_20307 ?auto_20318 ) ) ( not ( = ?auto_20307 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20293 ) ) ( not ( = ?auto_20286 ?auto_20309 ) ) ( not ( = ?auto_20287 ?auto_20293 ) ) ( not ( = ?auto_20287 ?auto_20309 ) ) ( not ( = ?auto_20288 ?auto_20293 ) ) ( not ( = ?auto_20288 ?auto_20309 ) ) ( not ( = ?auto_20289 ?auto_20293 ) ) ( not ( = ?auto_20289 ?auto_20309 ) ) ( not ( = ?auto_20290 ?auto_20293 ) ) ( not ( = ?auto_20290 ?auto_20309 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20309 ) ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20309 ) ) ( not ( = ?auto_20295 ?auto_20293 ) ) ( not ( = ?auto_20295 ?auto_20309 ) ) ( not ( = ?auto_20293 ?auto_20307 ) ) ( not ( = ?auto_20293 ?auto_20304 ) ) ( not ( = ?auto_20293 ?auto_20310 ) ) ( not ( = ?auto_20293 ?auto_20320 ) ) ( not ( = ?auto_20293 ?auto_20323 ) ) ( not ( = ?auto_20293 ?auto_20303 ) ) ( not ( = ?auto_20293 ?auto_20318 ) ) ( not ( = ?auto_20293 ?auto_20306 ) ) ( not ( = ?auto_20308 ?auto_20312 ) ) ( not ( = ?auto_20308 ?auto_20316 ) ) ( not ( = ?auto_20308 ?auto_20317 ) ) ( not ( = ?auto_20308 ?auto_20319 ) ) ( not ( = ?auto_20308 ?auto_20311 ) ) ( not ( = ?auto_20313 ?auto_20305 ) ) ( not ( = ?auto_20313 ?auto_20315 ) ) ( not ( = ?auto_20313 ?auto_20314 ) ) ( not ( = ?auto_20313 ?auto_20322 ) ) ( not ( = ?auto_20313 ?auto_20321 ) ) ( not ( = ?auto_20309 ?auto_20307 ) ) ( not ( = ?auto_20309 ?auto_20304 ) ) ( not ( = ?auto_20309 ?auto_20310 ) ) ( not ( = ?auto_20309 ?auto_20320 ) ) ( not ( = ?auto_20309 ?auto_20323 ) ) ( not ( = ?auto_20309 ?auto_20303 ) ) ( not ( = ?auto_20309 ?auto_20318 ) ) ( not ( = ?auto_20309 ?auto_20306 ) ) ( not ( = ?auto_20286 ?auto_20296 ) ) ( not ( = ?auto_20286 ?auto_20300 ) ) ( not ( = ?auto_20287 ?auto_20296 ) ) ( not ( = ?auto_20287 ?auto_20300 ) ) ( not ( = ?auto_20288 ?auto_20296 ) ) ( not ( = ?auto_20288 ?auto_20300 ) ) ( not ( = ?auto_20289 ?auto_20296 ) ) ( not ( = ?auto_20289 ?auto_20300 ) ) ( not ( = ?auto_20290 ?auto_20296 ) ) ( not ( = ?auto_20290 ?auto_20300 ) ) ( not ( = ?auto_20291 ?auto_20296 ) ) ( not ( = ?auto_20291 ?auto_20300 ) ) ( not ( = ?auto_20292 ?auto_20296 ) ) ( not ( = ?auto_20292 ?auto_20300 ) ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20300 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20300 ) ) ( not ( = ?auto_20296 ?auto_20309 ) ) ( not ( = ?auto_20296 ?auto_20307 ) ) ( not ( = ?auto_20296 ?auto_20304 ) ) ( not ( = ?auto_20296 ?auto_20310 ) ) ( not ( = ?auto_20296 ?auto_20320 ) ) ( not ( = ?auto_20296 ?auto_20323 ) ) ( not ( = ?auto_20296 ?auto_20303 ) ) ( not ( = ?auto_20296 ?auto_20318 ) ) ( not ( = ?auto_20296 ?auto_20306 ) ) ( not ( = ?auto_20301 ?auto_20308 ) ) ( not ( = ?auto_20301 ?auto_20312 ) ) ( not ( = ?auto_20301 ?auto_20316 ) ) ( not ( = ?auto_20301 ?auto_20317 ) ) ( not ( = ?auto_20301 ?auto_20319 ) ) ( not ( = ?auto_20301 ?auto_20311 ) ) ( not ( = ?auto_20302 ?auto_20313 ) ) ( not ( = ?auto_20302 ?auto_20305 ) ) ( not ( = ?auto_20302 ?auto_20315 ) ) ( not ( = ?auto_20302 ?auto_20314 ) ) ( not ( = ?auto_20302 ?auto_20322 ) ) ( not ( = ?auto_20302 ?auto_20321 ) ) ( not ( = ?auto_20300 ?auto_20309 ) ) ( not ( = ?auto_20300 ?auto_20307 ) ) ( not ( = ?auto_20300 ?auto_20304 ) ) ( not ( = ?auto_20300 ?auto_20310 ) ) ( not ( = ?auto_20300 ?auto_20320 ) ) ( not ( = ?auto_20300 ?auto_20323 ) ) ( not ( = ?auto_20300 ?auto_20303 ) ) ( not ( = ?auto_20300 ?auto_20318 ) ) ( not ( = ?auto_20300 ?auto_20306 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20286 ?auto_20287 ?auto_20288 ?auto_20289 ?auto_20290 ?auto_20291 ?auto_20292 ?auto_20295 ?auto_20294 ?auto_20293 )
      ( MAKE-1CRATE ?auto_20293 ?auto_20296 )
      ( MAKE-10CRATE-VERIFY ?auto_20286 ?auto_20287 ?auto_20288 ?auto_20289 ?auto_20290 ?auto_20291 ?auto_20292 ?auto_20295 ?auto_20294 ?auto_20293 ?auto_20296 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20326 - SURFACE
      ?auto_20327 - SURFACE
    )
    :vars
    (
      ?auto_20328 - HOIST
      ?auto_20329 - PLACE
      ?auto_20331 - PLACE
      ?auto_20332 - HOIST
      ?auto_20333 - SURFACE
      ?auto_20330 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20328 ?auto_20329 ) ( SURFACE-AT ?auto_20326 ?auto_20329 ) ( CLEAR ?auto_20326 ) ( IS-CRATE ?auto_20327 ) ( AVAILABLE ?auto_20328 ) ( not ( = ?auto_20331 ?auto_20329 ) ) ( HOIST-AT ?auto_20332 ?auto_20331 ) ( AVAILABLE ?auto_20332 ) ( SURFACE-AT ?auto_20327 ?auto_20331 ) ( ON ?auto_20327 ?auto_20333 ) ( CLEAR ?auto_20327 ) ( TRUCK-AT ?auto_20330 ?auto_20329 ) ( not ( = ?auto_20326 ?auto_20327 ) ) ( not ( = ?auto_20326 ?auto_20333 ) ) ( not ( = ?auto_20327 ?auto_20333 ) ) ( not ( = ?auto_20328 ?auto_20332 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20330 ?auto_20329 ?auto_20331 )
      ( !LIFT ?auto_20332 ?auto_20327 ?auto_20333 ?auto_20331 )
      ( !LOAD ?auto_20332 ?auto_20327 ?auto_20330 ?auto_20331 )
      ( !DRIVE ?auto_20330 ?auto_20331 ?auto_20329 )
      ( !UNLOAD ?auto_20328 ?auto_20327 ?auto_20330 ?auto_20329 )
      ( !DROP ?auto_20328 ?auto_20327 ?auto_20326 ?auto_20329 )
      ( MAKE-1CRATE-VERIFY ?auto_20326 ?auto_20327 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_20346 - SURFACE
      ?auto_20347 - SURFACE
      ?auto_20348 - SURFACE
      ?auto_20349 - SURFACE
      ?auto_20350 - SURFACE
      ?auto_20351 - SURFACE
      ?auto_20352 - SURFACE
      ?auto_20355 - SURFACE
      ?auto_20354 - SURFACE
      ?auto_20353 - SURFACE
      ?auto_20356 - SURFACE
      ?auto_20357 - SURFACE
    )
    :vars
    (
      ?auto_20361 - HOIST
      ?auto_20359 - PLACE
      ?auto_20360 - PLACE
      ?auto_20362 - HOIST
      ?auto_20358 - SURFACE
      ?auto_20381 - PLACE
      ?auto_20384 - HOIST
      ?auto_20385 - SURFACE
      ?auto_20383 - PLACE
      ?auto_20380 - HOIST
      ?auto_20368 - SURFACE
      ?auto_20366 - PLACE
      ?auto_20370 - HOIST
      ?auto_20376 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20382 - PLACE
      ?auto_20369 - HOIST
      ?auto_20377 - SURFACE
      ?auto_20375 - SURFACE
      ?auto_20364 - PLACE
      ?auto_20371 - HOIST
      ?auto_20378 - SURFACE
      ?auto_20372 - PLACE
      ?auto_20379 - HOIST
      ?auto_20374 - SURFACE
      ?auto_20365 - SURFACE
      ?auto_20373 - SURFACE
      ?auto_20363 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20361 ?auto_20359 ) ( IS-CRATE ?auto_20357 ) ( not ( = ?auto_20360 ?auto_20359 ) ) ( HOIST-AT ?auto_20362 ?auto_20360 ) ( SURFACE-AT ?auto_20357 ?auto_20360 ) ( ON ?auto_20357 ?auto_20358 ) ( CLEAR ?auto_20357 ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20358 ) ) ( not ( = ?auto_20361 ?auto_20362 ) ) ( IS-CRATE ?auto_20356 ) ( not ( = ?auto_20381 ?auto_20359 ) ) ( HOIST-AT ?auto_20384 ?auto_20381 ) ( AVAILABLE ?auto_20384 ) ( SURFACE-AT ?auto_20356 ?auto_20381 ) ( ON ?auto_20356 ?auto_20385 ) ( CLEAR ?auto_20356 ) ( not ( = ?auto_20353 ?auto_20356 ) ) ( not ( = ?auto_20353 ?auto_20385 ) ) ( not ( = ?auto_20356 ?auto_20385 ) ) ( not ( = ?auto_20361 ?auto_20384 ) ) ( IS-CRATE ?auto_20353 ) ( not ( = ?auto_20383 ?auto_20359 ) ) ( HOIST-AT ?auto_20380 ?auto_20383 ) ( AVAILABLE ?auto_20380 ) ( SURFACE-AT ?auto_20353 ?auto_20383 ) ( ON ?auto_20353 ?auto_20368 ) ( CLEAR ?auto_20353 ) ( not ( = ?auto_20354 ?auto_20353 ) ) ( not ( = ?auto_20354 ?auto_20368 ) ) ( not ( = ?auto_20353 ?auto_20368 ) ) ( not ( = ?auto_20361 ?auto_20380 ) ) ( IS-CRATE ?auto_20354 ) ( not ( = ?auto_20366 ?auto_20359 ) ) ( HOIST-AT ?auto_20370 ?auto_20366 ) ( SURFACE-AT ?auto_20354 ?auto_20366 ) ( ON ?auto_20354 ?auto_20376 ) ( CLEAR ?auto_20354 ) ( not ( = ?auto_20355 ?auto_20354 ) ) ( not ( = ?auto_20355 ?auto_20376 ) ) ( not ( = ?auto_20354 ?auto_20376 ) ) ( not ( = ?auto_20361 ?auto_20370 ) ) ( IS-CRATE ?auto_20355 ) ( SURFACE-AT ?auto_20355 ?auto_20366 ) ( ON ?auto_20355 ?auto_20367 ) ( CLEAR ?auto_20355 ) ( not ( = ?auto_20352 ?auto_20355 ) ) ( not ( = ?auto_20352 ?auto_20367 ) ) ( not ( = ?auto_20355 ?auto_20367 ) ) ( IS-CRATE ?auto_20352 ) ( not ( = ?auto_20382 ?auto_20359 ) ) ( HOIST-AT ?auto_20369 ?auto_20382 ) ( SURFACE-AT ?auto_20352 ?auto_20382 ) ( ON ?auto_20352 ?auto_20377 ) ( CLEAR ?auto_20352 ) ( not ( = ?auto_20351 ?auto_20352 ) ) ( not ( = ?auto_20351 ?auto_20377 ) ) ( not ( = ?auto_20352 ?auto_20377 ) ) ( not ( = ?auto_20361 ?auto_20369 ) ) ( IS-CRATE ?auto_20351 ) ( AVAILABLE ?auto_20369 ) ( SURFACE-AT ?auto_20351 ?auto_20382 ) ( ON ?auto_20351 ?auto_20375 ) ( CLEAR ?auto_20351 ) ( not ( = ?auto_20350 ?auto_20351 ) ) ( not ( = ?auto_20350 ?auto_20375 ) ) ( not ( = ?auto_20351 ?auto_20375 ) ) ( IS-CRATE ?auto_20350 ) ( not ( = ?auto_20364 ?auto_20359 ) ) ( HOIST-AT ?auto_20371 ?auto_20364 ) ( AVAILABLE ?auto_20371 ) ( SURFACE-AT ?auto_20350 ?auto_20364 ) ( ON ?auto_20350 ?auto_20378 ) ( CLEAR ?auto_20350 ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( not ( = ?auto_20349 ?auto_20378 ) ) ( not ( = ?auto_20350 ?auto_20378 ) ) ( not ( = ?auto_20361 ?auto_20371 ) ) ( IS-CRATE ?auto_20349 ) ( not ( = ?auto_20372 ?auto_20359 ) ) ( HOIST-AT ?auto_20379 ?auto_20372 ) ( AVAILABLE ?auto_20379 ) ( SURFACE-AT ?auto_20349 ?auto_20372 ) ( ON ?auto_20349 ?auto_20374 ) ( CLEAR ?auto_20349 ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20348 ?auto_20374 ) ) ( not ( = ?auto_20349 ?auto_20374 ) ) ( not ( = ?auto_20361 ?auto_20379 ) ) ( IS-CRATE ?auto_20348 ) ( AVAILABLE ?auto_20370 ) ( SURFACE-AT ?auto_20348 ?auto_20366 ) ( ON ?auto_20348 ?auto_20365 ) ( CLEAR ?auto_20348 ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20365 ) ) ( not ( = ?auto_20348 ?auto_20365 ) ) ( SURFACE-AT ?auto_20346 ?auto_20359 ) ( CLEAR ?auto_20346 ) ( IS-CRATE ?auto_20347 ) ( AVAILABLE ?auto_20361 ) ( AVAILABLE ?auto_20362 ) ( SURFACE-AT ?auto_20347 ?auto_20360 ) ( ON ?auto_20347 ?auto_20373 ) ( CLEAR ?auto_20347 ) ( TRUCK-AT ?auto_20363 ?auto_20359 ) ( not ( = ?auto_20346 ?auto_20347 ) ) ( not ( = ?auto_20346 ?auto_20373 ) ) ( not ( = ?auto_20347 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20348 ) ) ( not ( = ?auto_20346 ?auto_20365 ) ) ( not ( = ?auto_20348 ?auto_20373 ) ) ( not ( = ?auto_20366 ?auto_20360 ) ) ( not ( = ?auto_20370 ?auto_20362 ) ) ( not ( = ?auto_20365 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20349 ) ) ( not ( = ?auto_20346 ?auto_20374 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20374 ) ) ( not ( = ?auto_20349 ?auto_20365 ) ) ( not ( = ?auto_20349 ?auto_20373 ) ) ( not ( = ?auto_20372 ?auto_20366 ) ) ( not ( = ?auto_20372 ?auto_20360 ) ) ( not ( = ?auto_20379 ?auto_20370 ) ) ( not ( = ?auto_20379 ?auto_20362 ) ) ( not ( = ?auto_20374 ?auto_20365 ) ) ( not ( = ?auto_20374 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( not ( = ?auto_20346 ?auto_20378 ) ) ( not ( = ?auto_20347 ?auto_20350 ) ) ( not ( = ?auto_20347 ?auto_20378 ) ) ( not ( = ?auto_20348 ?auto_20350 ) ) ( not ( = ?auto_20348 ?auto_20378 ) ) ( not ( = ?auto_20350 ?auto_20374 ) ) ( not ( = ?auto_20350 ?auto_20365 ) ) ( not ( = ?auto_20350 ?auto_20373 ) ) ( not ( = ?auto_20364 ?auto_20372 ) ) ( not ( = ?auto_20364 ?auto_20366 ) ) ( not ( = ?auto_20364 ?auto_20360 ) ) ( not ( = ?auto_20371 ?auto_20379 ) ) ( not ( = ?auto_20371 ?auto_20370 ) ) ( not ( = ?auto_20371 ?auto_20362 ) ) ( not ( = ?auto_20378 ?auto_20374 ) ) ( not ( = ?auto_20378 ?auto_20365 ) ) ( not ( = ?auto_20378 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20351 ) ) ( not ( = ?auto_20346 ?auto_20375 ) ) ( not ( = ?auto_20347 ?auto_20351 ) ) ( not ( = ?auto_20347 ?auto_20375 ) ) ( not ( = ?auto_20348 ?auto_20351 ) ) ( not ( = ?auto_20348 ?auto_20375 ) ) ( not ( = ?auto_20349 ?auto_20351 ) ) ( not ( = ?auto_20349 ?auto_20375 ) ) ( not ( = ?auto_20351 ?auto_20378 ) ) ( not ( = ?auto_20351 ?auto_20374 ) ) ( not ( = ?auto_20351 ?auto_20365 ) ) ( not ( = ?auto_20351 ?auto_20373 ) ) ( not ( = ?auto_20382 ?auto_20364 ) ) ( not ( = ?auto_20382 ?auto_20372 ) ) ( not ( = ?auto_20382 ?auto_20366 ) ) ( not ( = ?auto_20382 ?auto_20360 ) ) ( not ( = ?auto_20369 ?auto_20371 ) ) ( not ( = ?auto_20369 ?auto_20379 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20362 ) ) ( not ( = ?auto_20375 ?auto_20378 ) ) ( not ( = ?auto_20375 ?auto_20374 ) ) ( not ( = ?auto_20375 ?auto_20365 ) ) ( not ( = ?auto_20375 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20352 ) ) ( not ( = ?auto_20346 ?auto_20377 ) ) ( not ( = ?auto_20347 ?auto_20352 ) ) ( not ( = ?auto_20347 ?auto_20377 ) ) ( not ( = ?auto_20348 ?auto_20352 ) ) ( not ( = ?auto_20348 ?auto_20377 ) ) ( not ( = ?auto_20349 ?auto_20352 ) ) ( not ( = ?auto_20349 ?auto_20377 ) ) ( not ( = ?auto_20350 ?auto_20352 ) ) ( not ( = ?auto_20350 ?auto_20377 ) ) ( not ( = ?auto_20352 ?auto_20375 ) ) ( not ( = ?auto_20352 ?auto_20378 ) ) ( not ( = ?auto_20352 ?auto_20374 ) ) ( not ( = ?auto_20352 ?auto_20365 ) ) ( not ( = ?auto_20352 ?auto_20373 ) ) ( not ( = ?auto_20377 ?auto_20375 ) ) ( not ( = ?auto_20377 ?auto_20378 ) ) ( not ( = ?auto_20377 ?auto_20374 ) ) ( not ( = ?auto_20377 ?auto_20365 ) ) ( not ( = ?auto_20377 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20355 ) ) ( not ( = ?auto_20346 ?auto_20367 ) ) ( not ( = ?auto_20347 ?auto_20355 ) ) ( not ( = ?auto_20347 ?auto_20367 ) ) ( not ( = ?auto_20348 ?auto_20355 ) ) ( not ( = ?auto_20348 ?auto_20367 ) ) ( not ( = ?auto_20349 ?auto_20355 ) ) ( not ( = ?auto_20349 ?auto_20367 ) ) ( not ( = ?auto_20350 ?auto_20355 ) ) ( not ( = ?auto_20350 ?auto_20367 ) ) ( not ( = ?auto_20351 ?auto_20355 ) ) ( not ( = ?auto_20351 ?auto_20367 ) ) ( not ( = ?auto_20355 ?auto_20377 ) ) ( not ( = ?auto_20355 ?auto_20375 ) ) ( not ( = ?auto_20355 ?auto_20378 ) ) ( not ( = ?auto_20355 ?auto_20374 ) ) ( not ( = ?auto_20355 ?auto_20365 ) ) ( not ( = ?auto_20355 ?auto_20373 ) ) ( not ( = ?auto_20367 ?auto_20377 ) ) ( not ( = ?auto_20367 ?auto_20375 ) ) ( not ( = ?auto_20367 ?auto_20378 ) ) ( not ( = ?auto_20367 ?auto_20374 ) ) ( not ( = ?auto_20367 ?auto_20365 ) ) ( not ( = ?auto_20367 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20354 ) ) ( not ( = ?auto_20346 ?auto_20376 ) ) ( not ( = ?auto_20347 ?auto_20354 ) ) ( not ( = ?auto_20347 ?auto_20376 ) ) ( not ( = ?auto_20348 ?auto_20354 ) ) ( not ( = ?auto_20348 ?auto_20376 ) ) ( not ( = ?auto_20349 ?auto_20354 ) ) ( not ( = ?auto_20349 ?auto_20376 ) ) ( not ( = ?auto_20350 ?auto_20354 ) ) ( not ( = ?auto_20350 ?auto_20376 ) ) ( not ( = ?auto_20351 ?auto_20354 ) ) ( not ( = ?auto_20351 ?auto_20376 ) ) ( not ( = ?auto_20352 ?auto_20354 ) ) ( not ( = ?auto_20352 ?auto_20376 ) ) ( not ( = ?auto_20354 ?auto_20367 ) ) ( not ( = ?auto_20354 ?auto_20377 ) ) ( not ( = ?auto_20354 ?auto_20375 ) ) ( not ( = ?auto_20354 ?auto_20378 ) ) ( not ( = ?auto_20354 ?auto_20374 ) ) ( not ( = ?auto_20354 ?auto_20365 ) ) ( not ( = ?auto_20354 ?auto_20373 ) ) ( not ( = ?auto_20376 ?auto_20367 ) ) ( not ( = ?auto_20376 ?auto_20377 ) ) ( not ( = ?auto_20376 ?auto_20375 ) ) ( not ( = ?auto_20376 ?auto_20378 ) ) ( not ( = ?auto_20376 ?auto_20374 ) ) ( not ( = ?auto_20376 ?auto_20365 ) ) ( not ( = ?auto_20376 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20353 ) ) ( not ( = ?auto_20346 ?auto_20368 ) ) ( not ( = ?auto_20347 ?auto_20353 ) ) ( not ( = ?auto_20347 ?auto_20368 ) ) ( not ( = ?auto_20348 ?auto_20353 ) ) ( not ( = ?auto_20348 ?auto_20368 ) ) ( not ( = ?auto_20349 ?auto_20353 ) ) ( not ( = ?auto_20349 ?auto_20368 ) ) ( not ( = ?auto_20350 ?auto_20353 ) ) ( not ( = ?auto_20350 ?auto_20368 ) ) ( not ( = ?auto_20351 ?auto_20353 ) ) ( not ( = ?auto_20351 ?auto_20368 ) ) ( not ( = ?auto_20352 ?auto_20353 ) ) ( not ( = ?auto_20352 ?auto_20368 ) ) ( not ( = ?auto_20355 ?auto_20353 ) ) ( not ( = ?auto_20355 ?auto_20368 ) ) ( not ( = ?auto_20353 ?auto_20376 ) ) ( not ( = ?auto_20353 ?auto_20367 ) ) ( not ( = ?auto_20353 ?auto_20377 ) ) ( not ( = ?auto_20353 ?auto_20375 ) ) ( not ( = ?auto_20353 ?auto_20378 ) ) ( not ( = ?auto_20353 ?auto_20374 ) ) ( not ( = ?auto_20353 ?auto_20365 ) ) ( not ( = ?auto_20353 ?auto_20373 ) ) ( not ( = ?auto_20383 ?auto_20366 ) ) ( not ( = ?auto_20383 ?auto_20382 ) ) ( not ( = ?auto_20383 ?auto_20364 ) ) ( not ( = ?auto_20383 ?auto_20372 ) ) ( not ( = ?auto_20383 ?auto_20360 ) ) ( not ( = ?auto_20380 ?auto_20370 ) ) ( not ( = ?auto_20380 ?auto_20369 ) ) ( not ( = ?auto_20380 ?auto_20371 ) ) ( not ( = ?auto_20380 ?auto_20379 ) ) ( not ( = ?auto_20380 ?auto_20362 ) ) ( not ( = ?auto_20368 ?auto_20376 ) ) ( not ( = ?auto_20368 ?auto_20367 ) ) ( not ( = ?auto_20368 ?auto_20377 ) ) ( not ( = ?auto_20368 ?auto_20375 ) ) ( not ( = ?auto_20368 ?auto_20378 ) ) ( not ( = ?auto_20368 ?auto_20374 ) ) ( not ( = ?auto_20368 ?auto_20365 ) ) ( not ( = ?auto_20368 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20356 ) ) ( not ( = ?auto_20346 ?auto_20385 ) ) ( not ( = ?auto_20347 ?auto_20356 ) ) ( not ( = ?auto_20347 ?auto_20385 ) ) ( not ( = ?auto_20348 ?auto_20356 ) ) ( not ( = ?auto_20348 ?auto_20385 ) ) ( not ( = ?auto_20349 ?auto_20356 ) ) ( not ( = ?auto_20349 ?auto_20385 ) ) ( not ( = ?auto_20350 ?auto_20356 ) ) ( not ( = ?auto_20350 ?auto_20385 ) ) ( not ( = ?auto_20351 ?auto_20356 ) ) ( not ( = ?auto_20351 ?auto_20385 ) ) ( not ( = ?auto_20352 ?auto_20356 ) ) ( not ( = ?auto_20352 ?auto_20385 ) ) ( not ( = ?auto_20355 ?auto_20356 ) ) ( not ( = ?auto_20355 ?auto_20385 ) ) ( not ( = ?auto_20354 ?auto_20356 ) ) ( not ( = ?auto_20354 ?auto_20385 ) ) ( not ( = ?auto_20356 ?auto_20368 ) ) ( not ( = ?auto_20356 ?auto_20376 ) ) ( not ( = ?auto_20356 ?auto_20367 ) ) ( not ( = ?auto_20356 ?auto_20377 ) ) ( not ( = ?auto_20356 ?auto_20375 ) ) ( not ( = ?auto_20356 ?auto_20378 ) ) ( not ( = ?auto_20356 ?auto_20374 ) ) ( not ( = ?auto_20356 ?auto_20365 ) ) ( not ( = ?auto_20356 ?auto_20373 ) ) ( not ( = ?auto_20381 ?auto_20383 ) ) ( not ( = ?auto_20381 ?auto_20366 ) ) ( not ( = ?auto_20381 ?auto_20382 ) ) ( not ( = ?auto_20381 ?auto_20364 ) ) ( not ( = ?auto_20381 ?auto_20372 ) ) ( not ( = ?auto_20381 ?auto_20360 ) ) ( not ( = ?auto_20384 ?auto_20380 ) ) ( not ( = ?auto_20384 ?auto_20370 ) ) ( not ( = ?auto_20384 ?auto_20369 ) ) ( not ( = ?auto_20384 ?auto_20371 ) ) ( not ( = ?auto_20384 ?auto_20379 ) ) ( not ( = ?auto_20384 ?auto_20362 ) ) ( not ( = ?auto_20385 ?auto_20368 ) ) ( not ( = ?auto_20385 ?auto_20376 ) ) ( not ( = ?auto_20385 ?auto_20367 ) ) ( not ( = ?auto_20385 ?auto_20377 ) ) ( not ( = ?auto_20385 ?auto_20375 ) ) ( not ( = ?auto_20385 ?auto_20378 ) ) ( not ( = ?auto_20385 ?auto_20374 ) ) ( not ( = ?auto_20385 ?auto_20365 ) ) ( not ( = ?auto_20385 ?auto_20373 ) ) ( not ( = ?auto_20346 ?auto_20357 ) ) ( not ( = ?auto_20346 ?auto_20358 ) ) ( not ( = ?auto_20347 ?auto_20357 ) ) ( not ( = ?auto_20347 ?auto_20358 ) ) ( not ( = ?auto_20348 ?auto_20357 ) ) ( not ( = ?auto_20348 ?auto_20358 ) ) ( not ( = ?auto_20349 ?auto_20357 ) ) ( not ( = ?auto_20349 ?auto_20358 ) ) ( not ( = ?auto_20350 ?auto_20357 ) ) ( not ( = ?auto_20350 ?auto_20358 ) ) ( not ( = ?auto_20351 ?auto_20357 ) ) ( not ( = ?auto_20351 ?auto_20358 ) ) ( not ( = ?auto_20352 ?auto_20357 ) ) ( not ( = ?auto_20352 ?auto_20358 ) ) ( not ( = ?auto_20355 ?auto_20357 ) ) ( not ( = ?auto_20355 ?auto_20358 ) ) ( not ( = ?auto_20354 ?auto_20357 ) ) ( not ( = ?auto_20354 ?auto_20358 ) ) ( not ( = ?auto_20353 ?auto_20357 ) ) ( not ( = ?auto_20353 ?auto_20358 ) ) ( not ( = ?auto_20357 ?auto_20385 ) ) ( not ( = ?auto_20357 ?auto_20368 ) ) ( not ( = ?auto_20357 ?auto_20376 ) ) ( not ( = ?auto_20357 ?auto_20367 ) ) ( not ( = ?auto_20357 ?auto_20377 ) ) ( not ( = ?auto_20357 ?auto_20375 ) ) ( not ( = ?auto_20357 ?auto_20378 ) ) ( not ( = ?auto_20357 ?auto_20374 ) ) ( not ( = ?auto_20357 ?auto_20365 ) ) ( not ( = ?auto_20357 ?auto_20373 ) ) ( not ( = ?auto_20358 ?auto_20385 ) ) ( not ( = ?auto_20358 ?auto_20368 ) ) ( not ( = ?auto_20358 ?auto_20376 ) ) ( not ( = ?auto_20358 ?auto_20367 ) ) ( not ( = ?auto_20358 ?auto_20377 ) ) ( not ( = ?auto_20358 ?auto_20375 ) ) ( not ( = ?auto_20358 ?auto_20378 ) ) ( not ( = ?auto_20358 ?auto_20374 ) ) ( not ( = ?auto_20358 ?auto_20365 ) ) ( not ( = ?auto_20358 ?auto_20373 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ?auto_20351 ?auto_20352 ?auto_20355 ?auto_20354 ?auto_20353 ?auto_20356 )
      ( MAKE-1CRATE ?auto_20356 ?auto_20357 )
      ( MAKE-11CRATE-VERIFY ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ?auto_20351 ?auto_20352 ?auto_20355 ?auto_20354 ?auto_20353 ?auto_20356 ?auto_20357 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20388 - SURFACE
      ?auto_20389 - SURFACE
    )
    :vars
    (
      ?auto_20390 - HOIST
      ?auto_20391 - PLACE
      ?auto_20393 - PLACE
      ?auto_20394 - HOIST
      ?auto_20395 - SURFACE
      ?auto_20392 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20390 ?auto_20391 ) ( SURFACE-AT ?auto_20388 ?auto_20391 ) ( CLEAR ?auto_20388 ) ( IS-CRATE ?auto_20389 ) ( AVAILABLE ?auto_20390 ) ( not ( = ?auto_20393 ?auto_20391 ) ) ( HOIST-AT ?auto_20394 ?auto_20393 ) ( AVAILABLE ?auto_20394 ) ( SURFACE-AT ?auto_20389 ?auto_20393 ) ( ON ?auto_20389 ?auto_20395 ) ( CLEAR ?auto_20389 ) ( TRUCK-AT ?auto_20392 ?auto_20391 ) ( not ( = ?auto_20388 ?auto_20389 ) ) ( not ( = ?auto_20388 ?auto_20395 ) ) ( not ( = ?auto_20389 ?auto_20395 ) ) ( not ( = ?auto_20390 ?auto_20394 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20392 ?auto_20391 ?auto_20393 )
      ( !LIFT ?auto_20394 ?auto_20389 ?auto_20395 ?auto_20393 )
      ( !LOAD ?auto_20394 ?auto_20389 ?auto_20392 ?auto_20393 )
      ( !DRIVE ?auto_20392 ?auto_20393 ?auto_20391 )
      ( !UNLOAD ?auto_20390 ?auto_20389 ?auto_20392 ?auto_20391 )
      ( !DROP ?auto_20390 ?auto_20389 ?auto_20388 ?auto_20391 )
      ( MAKE-1CRATE-VERIFY ?auto_20388 ?auto_20389 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_20409 - SURFACE
      ?auto_20410 - SURFACE
      ?auto_20411 - SURFACE
      ?auto_20412 - SURFACE
      ?auto_20413 - SURFACE
      ?auto_20414 - SURFACE
      ?auto_20415 - SURFACE
      ?auto_20418 - SURFACE
      ?auto_20417 - SURFACE
      ?auto_20416 - SURFACE
      ?auto_20419 - SURFACE
      ?auto_20420 - SURFACE
      ?auto_20421 - SURFACE
    )
    :vars
    (
      ?auto_20422 - HOIST
      ?auto_20424 - PLACE
      ?auto_20427 - PLACE
      ?auto_20423 - HOIST
      ?auto_20426 - SURFACE
      ?auto_20433 - PLACE
      ?auto_20444 - HOIST
      ?auto_20429 - SURFACE
      ?auto_20450 - SURFACE
      ?auto_20438 - PLACE
      ?auto_20448 - HOIST
      ?auto_20437 - SURFACE
      ?auto_20449 - PLACE
      ?auto_20446 - HOIST
      ?auto_20428 - SURFACE
      ?auto_20441 - SURFACE
      ?auto_20440 - PLACE
      ?auto_20434 - HOIST
      ?auto_20445 - SURFACE
      ?auto_20432 - SURFACE
      ?auto_20442 - PLACE
      ?auto_20447 - HOIST
      ?auto_20439 - SURFACE
      ?auto_20436 - PLACE
      ?auto_20435 - HOIST
      ?auto_20430 - SURFACE
      ?auto_20443 - SURFACE
      ?auto_20431 - SURFACE
      ?auto_20425 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20422 ?auto_20424 ) ( IS-CRATE ?auto_20421 ) ( not ( = ?auto_20427 ?auto_20424 ) ) ( HOIST-AT ?auto_20423 ?auto_20427 ) ( SURFACE-AT ?auto_20421 ?auto_20427 ) ( ON ?auto_20421 ?auto_20426 ) ( CLEAR ?auto_20421 ) ( not ( = ?auto_20420 ?auto_20421 ) ) ( not ( = ?auto_20420 ?auto_20426 ) ) ( not ( = ?auto_20421 ?auto_20426 ) ) ( not ( = ?auto_20422 ?auto_20423 ) ) ( IS-CRATE ?auto_20420 ) ( not ( = ?auto_20433 ?auto_20424 ) ) ( HOIST-AT ?auto_20444 ?auto_20433 ) ( SURFACE-AT ?auto_20420 ?auto_20433 ) ( ON ?auto_20420 ?auto_20429 ) ( CLEAR ?auto_20420 ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20429 ) ) ( not ( = ?auto_20420 ?auto_20429 ) ) ( not ( = ?auto_20422 ?auto_20444 ) ) ( IS-CRATE ?auto_20419 ) ( AVAILABLE ?auto_20423 ) ( SURFACE-AT ?auto_20419 ?auto_20427 ) ( ON ?auto_20419 ?auto_20450 ) ( CLEAR ?auto_20419 ) ( not ( = ?auto_20416 ?auto_20419 ) ) ( not ( = ?auto_20416 ?auto_20450 ) ) ( not ( = ?auto_20419 ?auto_20450 ) ) ( IS-CRATE ?auto_20416 ) ( not ( = ?auto_20438 ?auto_20424 ) ) ( HOIST-AT ?auto_20448 ?auto_20438 ) ( AVAILABLE ?auto_20448 ) ( SURFACE-AT ?auto_20416 ?auto_20438 ) ( ON ?auto_20416 ?auto_20437 ) ( CLEAR ?auto_20416 ) ( not ( = ?auto_20417 ?auto_20416 ) ) ( not ( = ?auto_20417 ?auto_20437 ) ) ( not ( = ?auto_20416 ?auto_20437 ) ) ( not ( = ?auto_20422 ?auto_20448 ) ) ( IS-CRATE ?auto_20417 ) ( not ( = ?auto_20449 ?auto_20424 ) ) ( HOIST-AT ?auto_20446 ?auto_20449 ) ( SURFACE-AT ?auto_20417 ?auto_20449 ) ( ON ?auto_20417 ?auto_20428 ) ( CLEAR ?auto_20417 ) ( not ( = ?auto_20418 ?auto_20417 ) ) ( not ( = ?auto_20418 ?auto_20428 ) ) ( not ( = ?auto_20417 ?auto_20428 ) ) ( not ( = ?auto_20422 ?auto_20446 ) ) ( IS-CRATE ?auto_20418 ) ( SURFACE-AT ?auto_20418 ?auto_20449 ) ( ON ?auto_20418 ?auto_20441 ) ( CLEAR ?auto_20418 ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20441 ) ) ( not ( = ?auto_20418 ?auto_20441 ) ) ( IS-CRATE ?auto_20415 ) ( not ( = ?auto_20440 ?auto_20424 ) ) ( HOIST-AT ?auto_20434 ?auto_20440 ) ( SURFACE-AT ?auto_20415 ?auto_20440 ) ( ON ?auto_20415 ?auto_20445 ) ( CLEAR ?auto_20415 ) ( not ( = ?auto_20414 ?auto_20415 ) ) ( not ( = ?auto_20414 ?auto_20445 ) ) ( not ( = ?auto_20415 ?auto_20445 ) ) ( not ( = ?auto_20422 ?auto_20434 ) ) ( IS-CRATE ?auto_20414 ) ( AVAILABLE ?auto_20434 ) ( SURFACE-AT ?auto_20414 ?auto_20440 ) ( ON ?auto_20414 ?auto_20432 ) ( CLEAR ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( not ( = ?auto_20413 ?auto_20432 ) ) ( not ( = ?auto_20414 ?auto_20432 ) ) ( IS-CRATE ?auto_20413 ) ( not ( = ?auto_20442 ?auto_20424 ) ) ( HOIST-AT ?auto_20447 ?auto_20442 ) ( AVAILABLE ?auto_20447 ) ( SURFACE-AT ?auto_20413 ?auto_20442 ) ( ON ?auto_20413 ?auto_20439 ) ( CLEAR ?auto_20413 ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20439 ) ) ( not ( = ?auto_20413 ?auto_20439 ) ) ( not ( = ?auto_20422 ?auto_20447 ) ) ( IS-CRATE ?auto_20412 ) ( not ( = ?auto_20436 ?auto_20424 ) ) ( HOIST-AT ?auto_20435 ?auto_20436 ) ( AVAILABLE ?auto_20435 ) ( SURFACE-AT ?auto_20412 ?auto_20436 ) ( ON ?auto_20412 ?auto_20430 ) ( CLEAR ?auto_20412 ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20430 ) ) ( not ( = ?auto_20412 ?auto_20430 ) ) ( not ( = ?auto_20422 ?auto_20435 ) ) ( IS-CRATE ?auto_20411 ) ( AVAILABLE ?auto_20446 ) ( SURFACE-AT ?auto_20411 ?auto_20449 ) ( ON ?auto_20411 ?auto_20443 ) ( CLEAR ?auto_20411 ) ( not ( = ?auto_20410 ?auto_20411 ) ) ( not ( = ?auto_20410 ?auto_20443 ) ) ( not ( = ?auto_20411 ?auto_20443 ) ) ( SURFACE-AT ?auto_20409 ?auto_20424 ) ( CLEAR ?auto_20409 ) ( IS-CRATE ?auto_20410 ) ( AVAILABLE ?auto_20422 ) ( AVAILABLE ?auto_20444 ) ( SURFACE-AT ?auto_20410 ?auto_20433 ) ( ON ?auto_20410 ?auto_20431 ) ( CLEAR ?auto_20410 ) ( TRUCK-AT ?auto_20425 ?auto_20424 ) ( not ( = ?auto_20409 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20431 ) ) ( not ( = ?auto_20410 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( not ( = ?auto_20409 ?auto_20443 ) ) ( not ( = ?auto_20411 ?auto_20431 ) ) ( not ( = ?auto_20449 ?auto_20433 ) ) ( not ( = ?auto_20446 ?auto_20444 ) ) ( not ( = ?auto_20443 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20412 ) ) ( not ( = ?auto_20409 ?auto_20430 ) ) ( not ( = ?auto_20410 ?auto_20412 ) ) ( not ( = ?auto_20410 ?auto_20430 ) ) ( not ( = ?auto_20412 ?auto_20443 ) ) ( not ( = ?auto_20412 ?auto_20431 ) ) ( not ( = ?auto_20436 ?auto_20449 ) ) ( not ( = ?auto_20436 ?auto_20433 ) ) ( not ( = ?auto_20435 ?auto_20446 ) ) ( not ( = ?auto_20435 ?auto_20444 ) ) ( not ( = ?auto_20430 ?auto_20443 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20409 ?auto_20439 ) ) ( not ( = ?auto_20410 ?auto_20413 ) ) ( not ( = ?auto_20410 ?auto_20439 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20439 ) ) ( not ( = ?auto_20413 ?auto_20430 ) ) ( not ( = ?auto_20413 ?auto_20443 ) ) ( not ( = ?auto_20413 ?auto_20431 ) ) ( not ( = ?auto_20442 ?auto_20436 ) ) ( not ( = ?auto_20442 ?auto_20449 ) ) ( not ( = ?auto_20442 ?auto_20433 ) ) ( not ( = ?auto_20447 ?auto_20435 ) ) ( not ( = ?auto_20447 ?auto_20446 ) ) ( not ( = ?auto_20447 ?auto_20444 ) ) ( not ( = ?auto_20439 ?auto_20430 ) ) ( not ( = ?auto_20439 ?auto_20443 ) ) ( not ( = ?auto_20439 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20414 ) ) ( not ( = ?auto_20409 ?auto_20432 ) ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20410 ?auto_20432 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20432 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( not ( = ?auto_20412 ?auto_20432 ) ) ( not ( = ?auto_20414 ?auto_20439 ) ) ( not ( = ?auto_20414 ?auto_20430 ) ) ( not ( = ?auto_20414 ?auto_20443 ) ) ( not ( = ?auto_20414 ?auto_20431 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20436 ) ) ( not ( = ?auto_20440 ?auto_20449 ) ) ( not ( = ?auto_20440 ?auto_20433 ) ) ( not ( = ?auto_20434 ?auto_20447 ) ) ( not ( = ?auto_20434 ?auto_20435 ) ) ( not ( = ?auto_20434 ?auto_20446 ) ) ( not ( = ?auto_20434 ?auto_20444 ) ) ( not ( = ?auto_20432 ?auto_20439 ) ) ( not ( = ?auto_20432 ?auto_20430 ) ) ( not ( = ?auto_20432 ?auto_20443 ) ) ( not ( = ?auto_20432 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20415 ) ) ( not ( = ?auto_20409 ?auto_20445 ) ) ( not ( = ?auto_20410 ?auto_20415 ) ) ( not ( = ?auto_20410 ?auto_20445 ) ) ( not ( = ?auto_20411 ?auto_20415 ) ) ( not ( = ?auto_20411 ?auto_20445 ) ) ( not ( = ?auto_20412 ?auto_20415 ) ) ( not ( = ?auto_20412 ?auto_20445 ) ) ( not ( = ?auto_20413 ?auto_20415 ) ) ( not ( = ?auto_20413 ?auto_20445 ) ) ( not ( = ?auto_20415 ?auto_20432 ) ) ( not ( = ?auto_20415 ?auto_20439 ) ) ( not ( = ?auto_20415 ?auto_20430 ) ) ( not ( = ?auto_20415 ?auto_20443 ) ) ( not ( = ?auto_20415 ?auto_20431 ) ) ( not ( = ?auto_20445 ?auto_20432 ) ) ( not ( = ?auto_20445 ?auto_20439 ) ) ( not ( = ?auto_20445 ?auto_20430 ) ) ( not ( = ?auto_20445 ?auto_20443 ) ) ( not ( = ?auto_20445 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20418 ) ) ( not ( = ?auto_20409 ?auto_20441 ) ) ( not ( = ?auto_20410 ?auto_20418 ) ) ( not ( = ?auto_20410 ?auto_20441 ) ) ( not ( = ?auto_20411 ?auto_20418 ) ) ( not ( = ?auto_20411 ?auto_20441 ) ) ( not ( = ?auto_20412 ?auto_20418 ) ) ( not ( = ?auto_20412 ?auto_20441 ) ) ( not ( = ?auto_20413 ?auto_20418 ) ) ( not ( = ?auto_20413 ?auto_20441 ) ) ( not ( = ?auto_20414 ?auto_20418 ) ) ( not ( = ?auto_20414 ?auto_20441 ) ) ( not ( = ?auto_20418 ?auto_20445 ) ) ( not ( = ?auto_20418 ?auto_20432 ) ) ( not ( = ?auto_20418 ?auto_20439 ) ) ( not ( = ?auto_20418 ?auto_20430 ) ) ( not ( = ?auto_20418 ?auto_20443 ) ) ( not ( = ?auto_20418 ?auto_20431 ) ) ( not ( = ?auto_20441 ?auto_20445 ) ) ( not ( = ?auto_20441 ?auto_20432 ) ) ( not ( = ?auto_20441 ?auto_20439 ) ) ( not ( = ?auto_20441 ?auto_20430 ) ) ( not ( = ?auto_20441 ?auto_20443 ) ) ( not ( = ?auto_20441 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20417 ) ) ( not ( = ?auto_20409 ?auto_20428 ) ) ( not ( = ?auto_20410 ?auto_20417 ) ) ( not ( = ?auto_20410 ?auto_20428 ) ) ( not ( = ?auto_20411 ?auto_20417 ) ) ( not ( = ?auto_20411 ?auto_20428 ) ) ( not ( = ?auto_20412 ?auto_20417 ) ) ( not ( = ?auto_20412 ?auto_20428 ) ) ( not ( = ?auto_20413 ?auto_20417 ) ) ( not ( = ?auto_20413 ?auto_20428 ) ) ( not ( = ?auto_20414 ?auto_20417 ) ) ( not ( = ?auto_20414 ?auto_20428 ) ) ( not ( = ?auto_20415 ?auto_20417 ) ) ( not ( = ?auto_20415 ?auto_20428 ) ) ( not ( = ?auto_20417 ?auto_20441 ) ) ( not ( = ?auto_20417 ?auto_20445 ) ) ( not ( = ?auto_20417 ?auto_20432 ) ) ( not ( = ?auto_20417 ?auto_20439 ) ) ( not ( = ?auto_20417 ?auto_20430 ) ) ( not ( = ?auto_20417 ?auto_20443 ) ) ( not ( = ?auto_20417 ?auto_20431 ) ) ( not ( = ?auto_20428 ?auto_20441 ) ) ( not ( = ?auto_20428 ?auto_20445 ) ) ( not ( = ?auto_20428 ?auto_20432 ) ) ( not ( = ?auto_20428 ?auto_20439 ) ) ( not ( = ?auto_20428 ?auto_20430 ) ) ( not ( = ?auto_20428 ?auto_20443 ) ) ( not ( = ?auto_20428 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20416 ) ) ( not ( = ?auto_20409 ?auto_20437 ) ) ( not ( = ?auto_20410 ?auto_20416 ) ) ( not ( = ?auto_20410 ?auto_20437 ) ) ( not ( = ?auto_20411 ?auto_20416 ) ) ( not ( = ?auto_20411 ?auto_20437 ) ) ( not ( = ?auto_20412 ?auto_20416 ) ) ( not ( = ?auto_20412 ?auto_20437 ) ) ( not ( = ?auto_20413 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20437 ) ) ( not ( = ?auto_20414 ?auto_20416 ) ) ( not ( = ?auto_20414 ?auto_20437 ) ) ( not ( = ?auto_20415 ?auto_20416 ) ) ( not ( = ?auto_20415 ?auto_20437 ) ) ( not ( = ?auto_20418 ?auto_20416 ) ) ( not ( = ?auto_20418 ?auto_20437 ) ) ( not ( = ?auto_20416 ?auto_20428 ) ) ( not ( = ?auto_20416 ?auto_20441 ) ) ( not ( = ?auto_20416 ?auto_20445 ) ) ( not ( = ?auto_20416 ?auto_20432 ) ) ( not ( = ?auto_20416 ?auto_20439 ) ) ( not ( = ?auto_20416 ?auto_20430 ) ) ( not ( = ?auto_20416 ?auto_20443 ) ) ( not ( = ?auto_20416 ?auto_20431 ) ) ( not ( = ?auto_20438 ?auto_20449 ) ) ( not ( = ?auto_20438 ?auto_20440 ) ) ( not ( = ?auto_20438 ?auto_20442 ) ) ( not ( = ?auto_20438 ?auto_20436 ) ) ( not ( = ?auto_20438 ?auto_20433 ) ) ( not ( = ?auto_20448 ?auto_20446 ) ) ( not ( = ?auto_20448 ?auto_20434 ) ) ( not ( = ?auto_20448 ?auto_20447 ) ) ( not ( = ?auto_20448 ?auto_20435 ) ) ( not ( = ?auto_20448 ?auto_20444 ) ) ( not ( = ?auto_20437 ?auto_20428 ) ) ( not ( = ?auto_20437 ?auto_20441 ) ) ( not ( = ?auto_20437 ?auto_20445 ) ) ( not ( = ?auto_20437 ?auto_20432 ) ) ( not ( = ?auto_20437 ?auto_20439 ) ) ( not ( = ?auto_20437 ?auto_20430 ) ) ( not ( = ?auto_20437 ?auto_20443 ) ) ( not ( = ?auto_20437 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20419 ) ) ( not ( = ?auto_20409 ?auto_20450 ) ) ( not ( = ?auto_20410 ?auto_20419 ) ) ( not ( = ?auto_20410 ?auto_20450 ) ) ( not ( = ?auto_20411 ?auto_20419 ) ) ( not ( = ?auto_20411 ?auto_20450 ) ) ( not ( = ?auto_20412 ?auto_20419 ) ) ( not ( = ?auto_20412 ?auto_20450 ) ) ( not ( = ?auto_20413 ?auto_20419 ) ) ( not ( = ?auto_20413 ?auto_20450 ) ) ( not ( = ?auto_20414 ?auto_20419 ) ) ( not ( = ?auto_20414 ?auto_20450 ) ) ( not ( = ?auto_20415 ?auto_20419 ) ) ( not ( = ?auto_20415 ?auto_20450 ) ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20450 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20450 ) ) ( not ( = ?auto_20419 ?auto_20437 ) ) ( not ( = ?auto_20419 ?auto_20428 ) ) ( not ( = ?auto_20419 ?auto_20441 ) ) ( not ( = ?auto_20419 ?auto_20445 ) ) ( not ( = ?auto_20419 ?auto_20432 ) ) ( not ( = ?auto_20419 ?auto_20439 ) ) ( not ( = ?auto_20419 ?auto_20430 ) ) ( not ( = ?auto_20419 ?auto_20443 ) ) ( not ( = ?auto_20419 ?auto_20431 ) ) ( not ( = ?auto_20427 ?auto_20438 ) ) ( not ( = ?auto_20427 ?auto_20449 ) ) ( not ( = ?auto_20427 ?auto_20440 ) ) ( not ( = ?auto_20427 ?auto_20442 ) ) ( not ( = ?auto_20427 ?auto_20436 ) ) ( not ( = ?auto_20427 ?auto_20433 ) ) ( not ( = ?auto_20423 ?auto_20448 ) ) ( not ( = ?auto_20423 ?auto_20446 ) ) ( not ( = ?auto_20423 ?auto_20434 ) ) ( not ( = ?auto_20423 ?auto_20447 ) ) ( not ( = ?auto_20423 ?auto_20435 ) ) ( not ( = ?auto_20423 ?auto_20444 ) ) ( not ( = ?auto_20450 ?auto_20437 ) ) ( not ( = ?auto_20450 ?auto_20428 ) ) ( not ( = ?auto_20450 ?auto_20441 ) ) ( not ( = ?auto_20450 ?auto_20445 ) ) ( not ( = ?auto_20450 ?auto_20432 ) ) ( not ( = ?auto_20450 ?auto_20439 ) ) ( not ( = ?auto_20450 ?auto_20430 ) ) ( not ( = ?auto_20450 ?auto_20443 ) ) ( not ( = ?auto_20450 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20420 ) ) ( not ( = ?auto_20409 ?auto_20429 ) ) ( not ( = ?auto_20410 ?auto_20420 ) ) ( not ( = ?auto_20410 ?auto_20429 ) ) ( not ( = ?auto_20411 ?auto_20420 ) ) ( not ( = ?auto_20411 ?auto_20429 ) ) ( not ( = ?auto_20412 ?auto_20420 ) ) ( not ( = ?auto_20412 ?auto_20429 ) ) ( not ( = ?auto_20413 ?auto_20420 ) ) ( not ( = ?auto_20413 ?auto_20429 ) ) ( not ( = ?auto_20414 ?auto_20420 ) ) ( not ( = ?auto_20414 ?auto_20429 ) ) ( not ( = ?auto_20415 ?auto_20420 ) ) ( not ( = ?auto_20415 ?auto_20429 ) ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( not ( = ?auto_20418 ?auto_20429 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20429 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20429 ) ) ( not ( = ?auto_20420 ?auto_20450 ) ) ( not ( = ?auto_20420 ?auto_20437 ) ) ( not ( = ?auto_20420 ?auto_20428 ) ) ( not ( = ?auto_20420 ?auto_20441 ) ) ( not ( = ?auto_20420 ?auto_20445 ) ) ( not ( = ?auto_20420 ?auto_20432 ) ) ( not ( = ?auto_20420 ?auto_20439 ) ) ( not ( = ?auto_20420 ?auto_20430 ) ) ( not ( = ?auto_20420 ?auto_20443 ) ) ( not ( = ?auto_20420 ?auto_20431 ) ) ( not ( = ?auto_20429 ?auto_20450 ) ) ( not ( = ?auto_20429 ?auto_20437 ) ) ( not ( = ?auto_20429 ?auto_20428 ) ) ( not ( = ?auto_20429 ?auto_20441 ) ) ( not ( = ?auto_20429 ?auto_20445 ) ) ( not ( = ?auto_20429 ?auto_20432 ) ) ( not ( = ?auto_20429 ?auto_20439 ) ) ( not ( = ?auto_20429 ?auto_20430 ) ) ( not ( = ?auto_20429 ?auto_20443 ) ) ( not ( = ?auto_20429 ?auto_20431 ) ) ( not ( = ?auto_20409 ?auto_20421 ) ) ( not ( = ?auto_20409 ?auto_20426 ) ) ( not ( = ?auto_20410 ?auto_20421 ) ) ( not ( = ?auto_20410 ?auto_20426 ) ) ( not ( = ?auto_20411 ?auto_20421 ) ) ( not ( = ?auto_20411 ?auto_20426 ) ) ( not ( = ?auto_20412 ?auto_20421 ) ) ( not ( = ?auto_20412 ?auto_20426 ) ) ( not ( = ?auto_20413 ?auto_20421 ) ) ( not ( = ?auto_20413 ?auto_20426 ) ) ( not ( = ?auto_20414 ?auto_20421 ) ) ( not ( = ?auto_20414 ?auto_20426 ) ) ( not ( = ?auto_20415 ?auto_20421 ) ) ( not ( = ?auto_20415 ?auto_20426 ) ) ( not ( = ?auto_20418 ?auto_20421 ) ) ( not ( = ?auto_20418 ?auto_20426 ) ) ( not ( = ?auto_20417 ?auto_20421 ) ) ( not ( = ?auto_20417 ?auto_20426 ) ) ( not ( = ?auto_20416 ?auto_20421 ) ) ( not ( = ?auto_20416 ?auto_20426 ) ) ( not ( = ?auto_20419 ?auto_20421 ) ) ( not ( = ?auto_20419 ?auto_20426 ) ) ( not ( = ?auto_20421 ?auto_20429 ) ) ( not ( = ?auto_20421 ?auto_20450 ) ) ( not ( = ?auto_20421 ?auto_20437 ) ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20421 ?auto_20441 ) ) ( not ( = ?auto_20421 ?auto_20445 ) ) ( not ( = ?auto_20421 ?auto_20432 ) ) ( not ( = ?auto_20421 ?auto_20439 ) ) ( not ( = ?auto_20421 ?auto_20430 ) ) ( not ( = ?auto_20421 ?auto_20443 ) ) ( not ( = ?auto_20421 ?auto_20431 ) ) ( not ( = ?auto_20426 ?auto_20429 ) ) ( not ( = ?auto_20426 ?auto_20450 ) ) ( not ( = ?auto_20426 ?auto_20437 ) ) ( not ( = ?auto_20426 ?auto_20428 ) ) ( not ( = ?auto_20426 ?auto_20441 ) ) ( not ( = ?auto_20426 ?auto_20445 ) ) ( not ( = ?auto_20426 ?auto_20432 ) ) ( not ( = ?auto_20426 ?auto_20439 ) ) ( not ( = ?auto_20426 ?auto_20430 ) ) ( not ( = ?auto_20426 ?auto_20443 ) ) ( not ( = ?auto_20426 ?auto_20431 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20414 ?auto_20415 ?auto_20418 ?auto_20417 ?auto_20416 ?auto_20419 ?auto_20420 )
      ( MAKE-1CRATE ?auto_20420 ?auto_20421 )
      ( MAKE-12CRATE-VERIFY ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20414 ?auto_20415 ?auto_20418 ?auto_20417 ?auto_20416 ?auto_20419 ?auto_20420 ?auto_20421 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20453 - SURFACE
      ?auto_20454 - SURFACE
    )
    :vars
    (
      ?auto_20455 - HOIST
      ?auto_20456 - PLACE
      ?auto_20458 - PLACE
      ?auto_20459 - HOIST
      ?auto_20460 - SURFACE
      ?auto_20457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20455 ?auto_20456 ) ( SURFACE-AT ?auto_20453 ?auto_20456 ) ( CLEAR ?auto_20453 ) ( IS-CRATE ?auto_20454 ) ( AVAILABLE ?auto_20455 ) ( not ( = ?auto_20458 ?auto_20456 ) ) ( HOIST-AT ?auto_20459 ?auto_20458 ) ( AVAILABLE ?auto_20459 ) ( SURFACE-AT ?auto_20454 ?auto_20458 ) ( ON ?auto_20454 ?auto_20460 ) ( CLEAR ?auto_20454 ) ( TRUCK-AT ?auto_20457 ?auto_20456 ) ( not ( = ?auto_20453 ?auto_20454 ) ) ( not ( = ?auto_20453 ?auto_20460 ) ) ( not ( = ?auto_20454 ?auto_20460 ) ) ( not ( = ?auto_20455 ?auto_20459 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20457 ?auto_20456 ?auto_20458 )
      ( !LIFT ?auto_20459 ?auto_20454 ?auto_20460 ?auto_20458 )
      ( !LOAD ?auto_20459 ?auto_20454 ?auto_20457 ?auto_20458 )
      ( !DRIVE ?auto_20457 ?auto_20458 ?auto_20456 )
      ( !UNLOAD ?auto_20455 ?auto_20454 ?auto_20457 ?auto_20456 )
      ( !DROP ?auto_20455 ?auto_20454 ?auto_20453 ?auto_20456 )
      ( MAKE-1CRATE-VERIFY ?auto_20453 ?auto_20454 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_20475 - SURFACE
      ?auto_20476 - SURFACE
      ?auto_20477 - SURFACE
      ?auto_20478 - SURFACE
      ?auto_20479 - SURFACE
      ?auto_20480 - SURFACE
      ?auto_20481 - SURFACE
      ?auto_20484 - SURFACE
      ?auto_20483 - SURFACE
      ?auto_20482 - SURFACE
      ?auto_20485 - SURFACE
      ?auto_20486 - SURFACE
      ?auto_20487 - SURFACE
      ?auto_20488 - SURFACE
    )
    :vars
    (
      ?auto_20492 - HOIST
      ?auto_20489 - PLACE
      ?auto_20491 - PLACE
      ?auto_20493 - HOIST
      ?auto_20490 - SURFACE
      ?auto_20496 - PLACE
      ?auto_20510 - HOIST
      ?auto_20514 - SURFACE
      ?auto_20507 - PLACE
      ?auto_20495 - HOIST
      ?auto_20504 - SURFACE
      ?auto_20518 - SURFACE
      ?auto_20497 - PLACE
      ?auto_20501 - HOIST
      ?auto_20513 - SURFACE
      ?auto_20498 - PLACE
      ?auto_20515 - HOIST
      ?auto_20516 - SURFACE
      ?auto_20512 - SURFACE
      ?auto_20506 - PLACE
      ?auto_20505 - HOIST
      ?auto_20517 - SURFACE
      ?auto_20499 - SURFACE
      ?auto_20500 - SURFACE
      ?auto_20502 - PLACE
      ?auto_20511 - HOIST
      ?auto_20508 - SURFACE
      ?auto_20503 - SURFACE
      ?auto_20509 - SURFACE
      ?auto_20494 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20492 ?auto_20489 ) ( IS-CRATE ?auto_20488 ) ( not ( = ?auto_20491 ?auto_20489 ) ) ( HOIST-AT ?auto_20493 ?auto_20491 ) ( SURFACE-AT ?auto_20488 ?auto_20491 ) ( ON ?auto_20488 ?auto_20490 ) ( CLEAR ?auto_20488 ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20490 ) ) ( not ( = ?auto_20488 ?auto_20490 ) ) ( not ( = ?auto_20492 ?auto_20493 ) ) ( IS-CRATE ?auto_20487 ) ( not ( = ?auto_20496 ?auto_20489 ) ) ( HOIST-AT ?auto_20510 ?auto_20496 ) ( SURFACE-AT ?auto_20487 ?auto_20496 ) ( ON ?auto_20487 ?auto_20514 ) ( CLEAR ?auto_20487 ) ( not ( = ?auto_20486 ?auto_20487 ) ) ( not ( = ?auto_20486 ?auto_20514 ) ) ( not ( = ?auto_20487 ?auto_20514 ) ) ( not ( = ?auto_20492 ?auto_20510 ) ) ( IS-CRATE ?auto_20486 ) ( not ( = ?auto_20507 ?auto_20489 ) ) ( HOIST-AT ?auto_20495 ?auto_20507 ) ( SURFACE-AT ?auto_20486 ?auto_20507 ) ( ON ?auto_20486 ?auto_20504 ) ( CLEAR ?auto_20486 ) ( not ( = ?auto_20485 ?auto_20486 ) ) ( not ( = ?auto_20485 ?auto_20504 ) ) ( not ( = ?auto_20486 ?auto_20504 ) ) ( not ( = ?auto_20492 ?auto_20495 ) ) ( IS-CRATE ?auto_20485 ) ( AVAILABLE ?auto_20510 ) ( SURFACE-AT ?auto_20485 ?auto_20496 ) ( ON ?auto_20485 ?auto_20518 ) ( CLEAR ?auto_20485 ) ( not ( = ?auto_20482 ?auto_20485 ) ) ( not ( = ?auto_20482 ?auto_20518 ) ) ( not ( = ?auto_20485 ?auto_20518 ) ) ( IS-CRATE ?auto_20482 ) ( not ( = ?auto_20497 ?auto_20489 ) ) ( HOIST-AT ?auto_20501 ?auto_20497 ) ( AVAILABLE ?auto_20501 ) ( SURFACE-AT ?auto_20482 ?auto_20497 ) ( ON ?auto_20482 ?auto_20513 ) ( CLEAR ?auto_20482 ) ( not ( = ?auto_20483 ?auto_20482 ) ) ( not ( = ?auto_20483 ?auto_20513 ) ) ( not ( = ?auto_20482 ?auto_20513 ) ) ( not ( = ?auto_20492 ?auto_20501 ) ) ( IS-CRATE ?auto_20483 ) ( not ( = ?auto_20498 ?auto_20489 ) ) ( HOIST-AT ?auto_20515 ?auto_20498 ) ( SURFACE-AT ?auto_20483 ?auto_20498 ) ( ON ?auto_20483 ?auto_20516 ) ( CLEAR ?auto_20483 ) ( not ( = ?auto_20484 ?auto_20483 ) ) ( not ( = ?auto_20484 ?auto_20516 ) ) ( not ( = ?auto_20483 ?auto_20516 ) ) ( not ( = ?auto_20492 ?auto_20515 ) ) ( IS-CRATE ?auto_20484 ) ( SURFACE-AT ?auto_20484 ?auto_20498 ) ( ON ?auto_20484 ?auto_20512 ) ( CLEAR ?auto_20484 ) ( not ( = ?auto_20481 ?auto_20484 ) ) ( not ( = ?auto_20481 ?auto_20512 ) ) ( not ( = ?auto_20484 ?auto_20512 ) ) ( IS-CRATE ?auto_20481 ) ( not ( = ?auto_20506 ?auto_20489 ) ) ( HOIST-AT ?auto_20505 ?auto_20506 ) ( SURFACE-AT ?auto_20481 ?auto_20506 ) ( ON ?auto_20481 ?auto_20517 ) ( CLEAR ?auto_20481 ) ( not ( = ?auto_20480 ?auto_20481 ) ) ( not ( = ?auto_20480 ?auto_20517 ) ) ( not ( = ?auto_20481 ?auto_20517 ) ) ( not ( = ?auto_20492 ?auto_20505 ) ) ( IS-CRATE ?auto_20480 ) ( AVAILABLE ?auto_20505 ) ( SURFACE-AT ?auto_20480 ?auto_20506 ) ( ON ?auto_20480 ?auto_20499 ) ( CLEAR ?auto_20480 ) ( not ( = ?auto_20479 ?auto_20480 ) ) ( not ( = ?auto_20479 ?auto_20499 ) ) ( not ( = ?auto_20480 ?auto_20499 ) ) ( IS-CRATE ?auto_20479 ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20479 ?auto_20491 ) ( ON ?auto_20479 ?auto_20500 ) ( CLEAR ?auto_20479 ) ( not ( = ?auto_20478 ?auto_20479 ) ) ( not ( = ?auto_20478 ?auto_20500 ) ) ( not ( = ?auto_20479 ?auto_20500 ) ) ( IS-CRATE ?auto_20478 ) ( not ( = ?auto_20502 ?auto_20489 ) ) ( HOIST-AT ?auto_20511 ?auto_20502 ) ( AVAILABLE ?auto_20511 ) ( SURFACE-AT ?auto_20478 ?auto_20502 ) ( ON ?auto_20478 ?auto_20508 ) ( CLEAR ?auto_20478 ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( not ( = ?auto_20477 ?auto_20508 ) ) ( not ( = ?auto_20478 ?auto_20508 ) ) ( not ( = ?auto_20492 ?auto_20511 ) ) ( IS-CRATE ?auto_20477 ) ( AVAILABLE ?auto_20515 ) ( SURFACE-AT ?auto_20477 ?auto_20498 ) ( ON ?auto_20477 ?auto_20503 ) ( CLEAR ?auto_20477 ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( not ( = ?auto_20476 ?auto_20503 ) ) ( not ( = ?auto_20477 ?auto_20503 ) ) ( SURFACE-AT ?auto_20475 ?auto_20489 ) ( CLEAR ?auto_20475 ) ( IS-CRATE ?auto_20476 ) ( AVAILABLE ?auto_20492 ) ( AVAILABLE ?auto_20495 ) ( SURFACE-AT ?auto_20476 ?auto_20507 ) ( ON ?auto_20476 ?auto_20509 ) ( CLEAR ?auto_20476 ) ( TRUCK-AT ?auto_20494 ?auto_20489 ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20509 ) ) ( not ( = ?auto_20476 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20503 ) ) ( not ( = ?auto_20477 ?auto_20509 ) ) ( not ( = ?auto_20498 ?auto_20507 ) ) ( not ( = ?auto_20515 ?auto_20495 ) ) ( not ( = ?auto_20503 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20478 ) ) ( not ( = ?auto_20475 ?auto_20508 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( not ( = ?auto_20476 ?auto_20508 ) ) ( not ( = ?auto_20478 ?auto_20503 ) ) ( not ( = ?auto_20478 ?auto_20509 ) ) ( not ( = ?auto_20502 ?auto_20498 ) ) ( not ( = ?auto_20502 ?auto_20507 ) ) ( not ( = ?auto_20511 ?auto_20515 ) ) ( not ( = ?auto_20511 ?auto_20495 ) ) ( not ( = ?auto_20508 ?auto_20503 ) ) ( not ( = ?auto_20508 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20479 ) ) ( not ( = ?auto_20475 ?auto_20500 ) ) ( not ( = ?auto_20476 ?auto_20479 ) ) ( not ( = ?auto_20476 ?auto_20500 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20500 ) ) ( not ( = ?auto_20479 ?auto_20508 ) ) ( not ( = ?auto_20479 ?auto_20503 ) ) ( not ( = ?auto_20479 ?auto_20509 ) ) ( not ( = ?auto_20491 ?auto_20502 ) ) ( not ( = ?auto_20491 ?auto_20498 ) ) ( not ( = ?auto_20491 ?auto_20507 ) ) ( not ( = ?auto_20493 ?auto_20511 ) ) ( not ( = ?auto_20493 ?auto_20515 ) ) ( not ( = ?auto_20493 ?auto_20495 ) ) ( not ( = ?auto_20500 ?auto_20508 ) ) ( not ( = ?auto_20500 ?auto_20503 ) ) ( not ( = ?auto_20500 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( not ( = ?auto_20475 ?auto_20499 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20499 ) ) ( not ( = ?auto_20477 ?auto_20480 ) ) ( not ( = ?auto_20477 ?auto_20499 ) ) ( not ( = ?auto_20478 ?auto_20480 ) ) ( not ( = ?auto_20478 ?auto_20499 ) ) ( not ( = ?auto_20480 ?auto_20500 ) ) ( not ( = ?auto_20480 ?auto_20508 ) ) ( not ( = ?auto_20480 ?auto_20503 ) ) ( not ( = ?auto_20480 ?auto_20509 ) ) ( not ( = ?auto_20506 ?auto_20491 ) ) ( not ( = ?auto_20506 ?auto_20502 ) ) ( not ( = ?auto_20506 ?auto_20498 ) ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20505 ?auto_20493 ) ) ( not ( = ?auto_20505 ?auto_20511 ) ) ( not ( = ?auto_20505 ?auto_20515 ) ) ( not ( = ?auto_20505 ?auto_20495 ) ) ( not ( = ?auto_20499 ?auto_20500 ) ) ( not ( = ?auto_20499 ?auto_20508 ) ) ( not ( = ?auto_20499 ?auto_20503 ) ) ( not ( = ?auto_20499 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20481 ) ) ( not ( = ?auto_20475 ?auto_20517 ) ) ( not ( = ?auto_20476 ?auto_20481 ) ) ( not ( = ?auto_20476 ?auto_20517 ) ) ( not ( = ?auto_20477 ?auto_20481 ) ) ( not ( = ?auto_20477 ?auto_20517 ) ) ( not ( = ?auto_20478 ?auto_20481 ) ) ( not ( = ?auto_20478 ?auto_20517 ) ) ( not ( = ?auto_20479 ?auto_20481 ) ) ( not ( = ?auto_20479 ?auto_20517 ) ) ( not ( = ?auto_20481 ?auto_20499 ) ) ( not ( = ?auto_20481 ?auto_20500 ) ) ( not ( = ?auto_20481 ?auto_20508 ) ) ( not ( = ?auto_20481 ?auto_20503 ) ) ( not ( = ?auto_20481 ?auto_20509 ) ) ( not ( = ?auto_20517 ?auto_20499 ) ) ( not ( = ?auto_20517 ?auto_20500 ) ) ( not ( = ?auto_20517 ?auto_20508 ) ) ( not ( = ?auto_20517 ?auto_20503 ) ) ( not ( = ?auto_20517 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20484 ) ) ( not ( = ?auto_20475 ?auto_20512 ) ) ( not ( = ?auto_20476 ?auto_20484 ) ) ( not ( = ?auto_20476 ?auto_20512 ) ) ( not ( = ?auto_20477 ?auto_20484 ) ) ( not ( = ?auto_20477 ?auto_20512 ) ) ( not ( = ?auto_20478 ?auto_20484 ) ) ( not ( = ?auto_20478 ?auto_20512 ) ) ( not ( = ?auto_20479 ?auto_20484 ) ) ( not ( = ?auto_20479 ?auto_20512 ) ) ( not ( = ?auto_20480 ?auto_20484 ) ) ( not ( = ?auto_20480 ?auto_20512 ) ) ( not ( = ?auto_20484 ?auto_20517 ) ) ( not ( = ?auto_20484 ?auto_20499 ) ) ( not ( = ?auto_20484 ?auto_20500 ) ) ( not ( = ?auto_20484 ?auto_20508 ) ) ( not ( = ?auto_20484 ?auto_20503 ) ) ( not ( = ?auto_20484 ?auto_20509 ) ) ( not ( = ?auto_20512 ?auto_20517 ) ) ( not ( = ?auto_20512 ?auto_20499 ) ) ( not ( = ?auto_20512 ?auto_20500 ) ) ( not ( = ?auto_20512 ?auto_20508 ) ) ( not ( = ?auto_20512 ?auto_20503 ) ) ( not ( = ?auto_20512 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20483 ) ) ( not ( = ?auto_20475 ?auto_20516 ) ) ( not ( = ?auto_20476 ?auto_20483 ) ) ( not ( = ?auto_20476 ?auto_20516 ) ) ( not ( = ?auto_20477 ?auto_20483 ) ) ( not ( = ?auto_20477 ?auto_20516 ) ) ( not ( = ?auto_20478 ?auto_20483 ) ) ( not ( = ?auto_20478 ?auto_20516 ) ) ( not ( = ?auto_20479 ?auto_20483 ) ) ( not ( = ?auto_20479 ?auto_20516 ) ) ( not ( = ?auto_20480 ?auto_20483 ) ) ( not ( = ?auto_20480 ?auto_20516 ) ) ( not ( = ?auto_20481 ?auto_20483 ) ) ( not ( = ?auto_20481 ?auto_20516 ) ) ( not ( = ?auto_20483 ?auto_20512 ) ) ( not ( = ?auto_20483 ?auto_20517 ) ) ( not ( = ?auto_20483 ?auto_20499 ) ) ( not ( = ?auto_20483 ?auto_20500 ) ) ( not ( = ?auto_20483 ?auto_20508 ) ) ( not ( = ?auto_20483 ?auto_20503 ) ) ( not ( = ?auto_20483 ?auto_20509 ) ) ( not ( = ?auto_20516 ?auto_20512 ) ) ( not ( = ?auto_20516 ?auto_20517 ) ) ( not ( = ?auto_20516 ?auto_20499 ) ) ( not ( = ?auto_20516 ?auto_20500 ) ) ( not ( = ?auto_20516 ?auto_20508 ) ) ( not ( = ?auto_20516 ?auto_20503 ) ) ( not ( = ?auto_20516 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20482 ) ) ( not ( = ?auto_20475 ?auto_20513 ) ) ( not ( = ?auto_20476 ?auto_20482 ) ) ( not ( = ?auto_20476 ?auto_20513 ) ) ( not ( = ?auto_20477 ?auto_20482 ) ) ( not ( = ?auto_20477 ?auto_20513 ) ) ( not ( = ?auto_20478 ?auto_20482 ) ) ( not ( = ?auto_20478 ?auto_20513 ) ) ( not ( = ?auto_20479 ?auto_20482 ) ) ( not ( = ?auto_20479 ?auto_20513 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20513 ) ) ( not ( = ?auto_20481 ?auto_20482 ) ) ( not ( = ?auto_20481 ?auto_20513 ) ) ( not ( = ?auto_20484 ?auto_20482 ) ) ( not ( = ?auto_20484 ?auto_20513 ) ) ( not ( = ?auto_20482 ?auto_20516 ) ) ( not ( = ?auto_20482 ?auto_20512 ) ) ( not ( = ?auto_20482 ?auto_20517 ) ) ( not ( = ?auto_20482 ?auto_20499 ) ) ( not ( = ?auto_20482 ?auto_20500 ) ) ( not ( = ?auto_20482 ?auto_20508 ) ) ( not ( = ?auto_20482 ?auto_20503 ) ) ( not ( = ?auto_20482 ?auto_20509 ) ) ( not ( = ?auto_20497 ?auto_20498 ) ) ( not ( = ?auto_20497 ?auto_20506 ) ) ( not ( = ?auto_20497 ?auto_20491 ) ) ( not ( = ?auto_20497 ?auto_20502 ) ) ( not ( = ?auto_20497 ?auto_20507 ) ) ( not ( = ?auto_20501 ?auto_20515 ) ) ( not ( = ?auto_20501 ?auto_20505 ) ) ( not ( = ?auto_20501 ?auto_20493 ) ) ( not ( = ?auto_20501 ?auto_20511 ) ) ( not ( = ?auto_20501 ?auto_20495 ) ) ( not ( = ?auto_20513 ?auto_20516 ) ) ( not ( = ?auto_20513 ?auto_20512 ) ) ( not ( = ?auto_20513 ?auto_20517 ) ) ( not ( = ?auto_20513 ?auto_20499 ) ) ( not ( = ?auto_20513 ?auto_20500 ) ) ( not ( = ?auto_20513 ?auto_20508 ) ) ( not ( = ?auto_20513 ?auto_20503 ) ) ( not ( = ?auto_20513 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20485 ) ) ( not ( = ?auto_20475 ?auto_20518 ) ) ( not ( = ?auto_20476 ?auto_20485 ) ) ( not ( = ?auto_20476 ?auto_20518 ) ) ( not ( = ?auto_20477 ?auto_20485 ) ) ( not ( = ?auto_20477 ?auto_20518 ) ) ( not ( = ?auto_20478 ?auto_20485 ) ) ( not ( = ?auto_20478 ?auto_20518 ) ) ( not ( = ?auto_20479 ?auto_20485 ) ) ( not ( = ?auto_20479 ?auto_20518 ) ) ( not ( = ?auto_20480 ?auto_20485 ) ) ( not ( = ?auto_20480 ?auto_20518 ) ) ( not ( = ?auto_20481 ?auto_20485 ) ) ( not ( = ?auto_20481 ?auto_20518 ) ) ( not ( = ?auto_20484 ?auto_20485 ) ) ( not ( = ?auto_20484 ?auto_20518 ) ) ( not ( = ?auto_20483 ?auto_20485 ) ) ( not ( = ?auto_20483 ?auto_20518 ) ) ( not ( = ?auto_20485 ?auto_20513 ) ) ( not ( = ?auto_20485 ?auto_20516 ) ) ( not ( = ?auto_20485 ?auto_20512 ) ) ( not ( = ?auto_20485 ?auto_20517 ) ) ( not ( = ?auto_20485 ?auto_20499 ) ) ( not ( = ?auto_20485 ?auto_20500 ) ) ( not ( = ?auto_20485 ?auto_20508 ) ) ( not ( = ?auto_20485 ?auto_20503 ) ) ( not ( = ?auto_20485 ?auto_20509 ) ) ( not ( = ?auto_20496 ?auto_20497 ) ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20506 ) ) ( not ( = ?auto_20496 ?auto_20491 ) ) ( not ( = ?auto_20496 ?auto_20502 ) ) ( not ( = ?auto_20496 ?auto_20507 ) ) ( not ( = ?auto_20510 ?auto_20501 ) ) ( not ( = ?auto_20510 ?auto_20515 ) ) ( not ( = ?auto_20510 ?auto_20505 ) ) ( not ( = ?auto_20510 ?auto_20493 ) ) ( not ( = ?auto_20510 ?auto_20511 ) ) ( not ( = ?auto_20510 ?auto_20495 ) ) ( not ( = ?auto_20518 ?auto_20513 ) ) ( not ( = ?auto_20518 ?auto_20516 ) ) ( not ( = ?auto_20518 ?auto_20512 ) ) ( not ( = ?auto_20518 ?auto_20517 ) ) ( not ( = ?auto_20518 ?auto_20499 ) ) ( not ( = ?auto_20518 ?auto_20500 ) ) ( not ( = ?auto_20518 ?auto_20508 ) ) ( not ( = ?auto_20518 ?auto_20503 ) ) ( not ( = ?auto_20518 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20486 ) ) ( not ( = ?auto_20475 ?auto_20504 ) ) ( not ( = ?auto_20476 ?auto_20486 ) ) ( not ( = ?auto_20476 ?auto_20504 ) ) ( not ( = ?auto_20477 ?auto_20486 ) ) ( not ( = ?auto_20477 ?auto_20504 ) ) ( not ( = ?auto_20478 ?auto_20486 ) ) ( not ( = ?auto_20478 ?auto_20504 ) ) ( not ( = ?auto_20479 ?auto_20486 ) ) ( not ( = ?auto_20479 ?auto_20504 ) ) ( not ( = ?auto_20480 ?auto_20486 ) ) ( not ( = ?auto_20480 ?auto_20504 ) ) ( not ( = ?auto_20481 ?auto_20486 ) ) ( not ( = ?auto_20481 ?auto_20504 ) ) ( not ( = ?auto_20484 ?auto_20486 ) ) ( not ( = ?auto_20484 ?auto_20504 ) ) ( not ( = ?auto_20483 ?auto_20486 ) ) ( not ( = ?auto_20483 ?auto_20504 ) ) ( not ( = ?auto_20482 ?auto_20486 ) ) ( not ( = ?auto_20482 ?auto_20504 ) ) ( not ( = ?auto_20486 ?auto_20518 ) ) ( not ( = ?auto_20486 ?auto_20513 ) ) ( not ( = ?auto_20486 ?auto_20516 ) ) ( not ( = ?auto_20486 ?auto_20512 ) ) ( not ( = ?auto_20486 ?auto_20517 ) ) ( not ( = ?auto_20486 ?auto_20499 ) ) ( not ( = ?auto_20486 ?auto_20500 ) ) ( not ( = ?auto_20486 ?auto_20508 ) ) ( not ( = ?auto_20486 ?auto_20503 ) ) ( not ( = ?auto_20486 ?auto_20509 ) ) ( not ( = ?auto_20504 ?auto_20518 ) ) ( not ( = ?auto_20504 ?auto_20513 ) ) ( not ( = ?auto_20504 ?auto_20516 ) ) ( not ( = ?auto_20504 ?auto_20512 ) ) ( not ( = ?auto_20504 ?auto_20517 ) ) ( not ( = ?auto_20504 ?auto_20499 ) ) ( not ( = ?auto_20504 ?auto_20500 ) ) ( not ( = ?auto_20504 ?auto_20508 ) ) ( not ( = ?auto_20504 ?auto_20503 ) ) ( not ( = ?auto_20504 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20487 ) ) ( not ( = ?auto_20475 ?auto_20514 ) ) ( not ( = ?auto_20476 ?auto_20487 ) ) ( not ( = ?auto_20476 ?auto_20514 ) ) ( not ( = ?auto_20477 ?auto_20487 ) ) ( not ( = ?auto_20477 ?auto_20514 ) ) ( not ( = ?auto_20478 ?auto_20487 ) ) ( not ( = ?auto_20478 ?auto_20514 ) ) ( not ( = ?auto_20479 ?auto_20487 ) ) ( not ( = ?auto_20479 ?auto_20514 ) ) ( not ( = ?auto_20480 ?auto_20487 ) ) ( not ( = ?auto_20480 ?auto_20514 ) ) ( not ( = ?auto_20481 ?auto_20487 ) ) ( not ( = ?auto_20481 ?auto_20514 ) ) ( not ( = ?auto_20484 ?auto_20487 ) ) ( not ( = ?auto_20484 ?auto_20514 ) ) ( not ( = ?auto_20483 ?auto_20487 ) ) ( not ( = ?auto_20483 ?auto_20514 ) ) ( not ( = ?auto_20482 ?auto_20487 ) ) ( not ( = ?auto_20482 ?auto_20514 ) ) ( not ( = ?auto_20485 ?auto_20487 ) ) ( not ( = ?auto_20485 ?auto_20514 ) ) ( not ( = ?auto_20487 ?auto_20504 ) ) ( not ( = ?auto_20487 ?auto_20518 ) ) ( not ( = ?auto_20487 ?auto_20513 ) ) ( not ( = ?auto_20487 ?auto_20516 ) ) ( not ( = ?auto_20487 ?auto_20512 ) ) ( not ( = ?auto_20487 ?auto_20517 ) ) ( not ( = ?auto_20487 ?auto_20499 ) ) ( not ( = ?auto_20487 ?auto_20500 ) ) ( not ( = ?auto_20487 ?auto_20508 ) ) ( not ( = ?auto_20487 ?auto_20503 ) ) ( not ( = ?auto_20487 ?auto_20509 ) ) ( not ( = ?auto_20514 ?auto_20504 ) ) ( not ( = ?auto_20514 ?auto_20518 ) ) ( not ( = ?auto_20514 ?auto_20513 ) ) ( not ( = ?auto_20514 ?auto_20516 ) ) ( not ( = ?auto_20514 ?auto_20512 ) ) ( not ( = ?auto_20514 ?auto_20517 ) ) ( not ( = ?auto_20514 ?auto_20499 ) ) ( not ( = ?auto_20514 ?auto_20500 ) ) ( not ( = ?auto_20514 ?auto_20508 ) ) ( not ( = ?auto_20514 ?auto_20503 ) ) ( not ( = ?auto_20514 ?auto_20509 ) ) ( not ( = ?auto_20475 ?auto_20488 ) ) ( not ( = ?auto_20475 ?auto_20490 ) ) ( not ( = ?auto_20476 ?auto_20488 ) ) ( not ( = ?auto_20476 ?auto_20490 ) ) ( not ( = ?auto_20477 ?auto_20488 ) ) ( not ( = ?auto_20477 ?auto_20490 ) ) ( not ( = ?auto_20478 ?auto_20488 ) ) ( not ( = ?auto_20478 ?auto_20490 ) ) ( not ( = ?auto_20479 ?auto_20488 ) ) ( not ( = ?auto_20479 ?auto_20490 ) ) ( not ( = ?auto_20480 ?auto_20488 ) ) ( not ( = ?auto_20480 ?auto_20490 ) ) ( not ( = ?auto_20481 ?auto_20488 ) ) ( not ( = ?auto_20481 ?auto_20490 ) ) ( not ( = ?auto_20484 ?auto_20488 ) ) ( not ( = ?auto_20484 ?auto_20490 ) ) ( not ( = ?auto_20483 ?auto_20488 ) ) ( not ( = ?auto_20483 ?auto_20490 ) ) ( not ( = ?auto_20482 ?auto_20488 ) ) ( not ( = ?auto_20482 ?auto_20490 ) ) ( not ( = ?auto_20485 ?auto_20488 ) ) ( not ( = ?auto_20485 ?auto_20490 ) ) ( not ( = ?auto_20486 ?auto_20488 ) ) ( not ( = ?auto_20486 ?auto_20490 ) ) ( not ( = ?auto_20488 ?auto_20514 ) ) ( not ( = ?auto_20488 ?auto_20504 ) ) ( not ( = ?auto_20488 ?auto_20518 ) ) ( not ( = ?auto_20488 ?auto_20513 ) ) ( not ( = ?auto_20488 ?auto_20516 ) ) ( not ( = ?auto_20488 ?auto_20512 ) ) ( not ( = ?auto_20488 ?auto_20517 ) ) ( not ( = ?auto_20488 ?auto_20499 ) ) ( not ( = ?auto_20488 ?auto_20500 ) ) ( not ( = ?auto_20488 ?auto_20508 ) ) ( not ( = ?auto_20488 ?auto_20503 ) ) ( not ( = ?auto_20488 ?auto_20509 ) ) ( not ( = ?auto_20490 ?auto_20514 ) ) ( not ( = ?auto_20490 ?auto_20504 ) ) ( not ( = ?auto_20490 ?auto_20518 ) ) ( not ( = ?auto_20490 ?auto_20513 ) ) ( not ( = ?auto_20490 ?auto_20516 ) ) ( not ( = ?auto_20490 ?auto_20512 ) ) ( not ( = ?auto_20490 ?auto_20517 ) ) ( not ( = ?auto_20490 ?auto_20499 ) ) ( not ( = ?auto_20490 ?auto_20500 ) ) ( not ( = ?auto_20490 ?auto_20508 ) ) ( not ( = ?auto_20490 ?auto_20503 ) ) ( not ( = ?auto_20490 ?auto_20509 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ?auto_20479 ?auto_20480 ?auto_20481 ?auto_20484 ?auto_20483 ?auto_20482 ?auto_20485 ?auto_20486 ?auto_20487 )
      ( MAKE-1CRATE ?auto_20487 ?auto_20488 )
      ( MAKE-13CRATE-VERIFY ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ?auto_20479 ?auto_20480 ?auto_20481 ?auto_20484 ?auto_20483 ?auto_20482 ?auto_20485 ?auto_20486 ?auto_20487 ?auto_20488 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20521 - SURFACE
      ?auto_20522 - SURFACE
    )
    :vars
    (
      ?auto_20523 - HOIST
      ?auto_20524 - PLACE
      ?auto_20526 - PLACE
      ?auto_20527 - HOIST
      ?auto_20528 - SURFACE
      ?auto_20525 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20523 ?auto_20524 ) ( SURFACE-AT ?auto_20521 ?auto_20524 ) ( CLEAR ?auto_20521 ) ( IS-CRATE ?auto_20522 ) ( AVAILABLE ?auto_20523 ) ( not ( = ?auto_20526 ?auto_20524 ) ) ( HOIST-AT ?auto_20527 ?auto_20526 ) ( AVAILABLE ?auto_20527 ) ( SURFACE-AT ?auto_20522 ?auto_20526 ) ( ON ?auto_20522 ?auto_20528 ) ( CLEAR ?auto_20522 ) ( TRUCK-AT ?auto_20525 ?auto_20524 ) ( not ( = ?auto_20521 ?auto_20522 ) ) ( not ( = ?auto_20521 ?auto_20528 ) ) ( not ( = ?auto_20522 ?auto_20528 ) ) ( not ( = ?auto_20523 ?auto_20527 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20525 ?auto_20524 ?auto_20526 )
      ( !LIFT ?auto_20527 ?auto_20522 ?auto_20528 ?auto_20526 )
      ( !LOAD ?auto_20527 ?auto_20522 ?auto_20525 ?auto_20526 )
      ( !DRIVE ?auto_20525 ?auto_20526 ?auto_20524 )
      ( !UNLOAD ?auto_20523 ?auto_20522 ?auto_20525 ?auto_20524 )
      ( !DROP ?auto_20523 ?auto_20522 ?auto_20521 ?auto_20524 )
      ( MAKE-1CRATE-VERIFY ?auto_20521 ?auto_20522 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_20544 - SURFACE
      ?auto_20545 - SURFACE
      ?auto_20546 - SURFACE
      ?auto_20547 - SURFACE
      ?auto_20548 - SURFACE
      ?auto_20549 - SURFACE
      ?auto_20550 - SURFACE
      ?auto_20553 - SURFACE
      ?auto_20552 - SURFACE
      ?auto_20551 - SURFACE
      ?auto_20554 - SURFACE
      ?auto_20555 - SURFACE
      ?auto_20556 - SURFACE
      ?auto_20557 - SURFACE
      ?auto_20558 - SURFACE
    )
    :vars
    (
      ?auto_20564 - HOIST
      ?auto_20559 - PLACE
      ?auto_20563 - PLACE
      ?auto_20560 - HOIST
      ?auto_20562 - SURFACE
      ?auto_20566 - PLACE
      ?auto_20581 - HOIST
      ?auto_20575 - SURFACE
      ?auto_20588 - PLACE
      ?auto_20571 - HOIST
      ?auto_20585 - SURFACE
      ?auto_20572 - PLACE
      ?auto_20574 - HOIST
      ?auto_20582 - SURFACE
      ?auto_20584 - SURFACE
      ?auto_20565 - PLACE
      ?auto_20569 - HOIST
      ?auto_20568 - SURFACE
      ?auto_20586 - PLACE
      ?auto_20567 - HOIST
      ?auto_20570 - SURFACE
      ?auto_20583 - SURFACE
      ?auto_20578 - PLACE
      ?auto_20573 - HOIST
      ?auto_20580 - SURFACE
      ?auto_20587 - SURFACE
      ?auto_20579 - SURFACE
      ?auto_20577 - SURFACE
      ?auto_20576 - SURFACE
      ?auto_20589 - SURFACE
      ?auto_20561 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20564 ?auto_20559 ) ( IS-CRATE ?auto_20558 ) ( not ( = ?auto_20563 ?auto_20559 ) ) ( HOIST-AT ?auto_20560 ?auto_20563 ) ( SURFACE-AT ?auto_20558 ?auto_20563 ) ( ON ?auto_20558 ?auto_20562 ) ( CLEAR ?auto_20558 ) ( not ( = ?auto_20557 ?auto_20558 ) ) ( not ( = ?auto_20557 ?auto_20562 ) ) ( not ( = ?auto_20558 ?auto_20562 ) ) ( not ( = ?auto_20564 ?auto_20560 ) ) ( IS-CRATE ?auto_20557 ) ( not ( = ?auto_20566 ?auto_20559 ) ) ( HOIST-AT ?auto_20581 ?auto_20566 ) ( SURFACE-AT ?auto_20557 ?auto_20566 ) ( ON ?auto_20557 ?auto_20575 ) ( CLEAR ?auto_20557 ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20575 ) ) ( not ( = ?auto_20557 ?auto_20575 ) ) ( not ( = ?auto_20564 ?auto_20581 ) ) ( IS-CRATE ?auto_20556 ) ( not ( = ?auto_20588 ?auto_20559 ) ) ( HOIST-AT ?auto_20571 ?auto_20588 ) ( SURFACE-AT ?auto_20556 ?auto_20588 ) ( ON ?auto_20556 ?auto_20585 ) ( CLEAR ?auto_20556 ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20585 ) ) ( not ( = ?auto_20556 ?auto_20585 ) ) ( not ( = ?auto_20564 ?auto_20571 ) ) ( IS-CRATE ?auto_20555 ) ( not ( = ?auto_20572 ?auto_20559 ) ) ( HOIST-AT ?auto_20574 ?auto_20572 ) ( SURFACE-AT ?auto_20555 ?auto_20572 ) ( ON ?auto_20555 ?auto_20582 ) ( CLEAR ?auto_20555 ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20582 ) ) ( not ( = ?auto_20555 ?auto_20582 ) ) ( not ( = ?auto_20564 ?auto_20574 ) ) ( IS-CRATE ?auto_20554 ) ( AVAILABLE ?auto_20571 ) ( SURFACE-AT ?auto_20554 ?auto_20588 ) ( ON ?auto_20554 ?auto_20584 ) ( CLEAR ?auto_20554 ) ( not ( = ?auto_20551 ?auto_20554 ) ) ( not ( = ?auto_20551 ?auto_20584 ) ) ( not ( = ?auto_20554 ?auto_20584 ) ) ( IS-CRATE ?auto_20551 ) ( not ( = ?auto_20565 ?auto_20559 ) ) ( HOIST-AT ?auto_20569 ?auto_20565 ) ( AVAILABLE ?auto_20569 ) ( SURFACE-AT ?auto_20551 ?auto_20565 ) ( ON ?auto_20551 ?auto_20568 ) ( CLEAR ?auto_20551 ) ( not ( = ?auto_20552 ?auto_20551 ) ) ( not ( = ?auto_20552 ?auto_20568 ) ) ( not ( = ?auto_20551 ?auto_20568 ) ) ( not ( = ?auto_20564 ?auto_20569 ) ) ( IS-CRATE ?auto_20552 ) ( not ( = ?auto_20586 ?auto_20559 ) ) ( HOIST-AT ?auto_20567 ?auto_20586 ) ( SURFACE-AT ?auto_20552 ?auto_20586 ) ( ON ?auto_20552 ?auto_20570 ) ( CLEAR ?auto_20552 ) ( not ( = ?auto_20553 ?auto_20552 ) ) ( not ( = ?auto_20553 ?auto_20570 ) ) ( not ( = ?auto_20552 ?auto_20570 ) ) ( not ( = ?auto_20564 ?auto_20567 ) ) ( IS-CRATE ?auto_20553 ) ( SURFACE-AT ?auto_20553 ?auto_20586 ) ( ON ?auto_20553 ?auto_20583 ) ( CLEAR ?auto_20553 ) ( not ( = ?auto_20550 ?auto_20553 ) ) ( not ( = ?auto_20550 ?auto_20583 ) ) ( not ( = ?auto_20553 ?auto_20583 ) ) ( IS-CRATE ?auto_20550 ) ( not ( = ?auto_20578 ?auto_20559 ) ) ( HOIST-AT ?auto_20573 ?auto_20578 ) ( SURFACE-AT ?auto_20550 ?auto_20578 ) ( ON ?auto_20550 ?auto_20580 ) ( CLEAR ?auto_20550 ) ( not ( = ?auto_20549 ?auto_20550 ) ) ( not ( = ?auto_20549 ?auto_20580 ) ) ( not ( = ?auto_20550 ?auto_20580 ) ) ( not ( = ?auto_20564 ?auto_20573 ) ) ( IS-CRATE ?auto_20549 ) ( AVAILABLE ?auto_20573 ) ( SURFACE-AT ?auto_20549 ?auto_20578 ) ( ON ?auto_20549 ?auto_20587 ) ( CLEAR ?auto_20549 ) ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20587 ) ) ( not ( = ?auto_20549 ?auto_20587 ) ) ( IS-CRATE ?auto_20548 ) ( AVAILABLE ?auto_20581 ) ( SURFACE-AT ?auto_20548 ?auto_20566 ) ( ON ?auto_20548 ?auto_20579 ) ( CLEAR ?auto_20548 ) ( not ( = ?auto_20547 ?auto_20548 ) ) ( not ( = ?auto_20547 ?auto_20579 ) ) ( not ( = ?auto_20548 ?auto_20579 ) ) ( IS-CRATE ?auto_20547 ) ( AVAILABLE ?auto_20560 ) ( SURFACE-AT ?auto_20547 ?auto_20563 ) ( ON ?auto_20547 ?auto_20577 ) ( CLEAR ?auto_20547 ) ( not ( = ?auto_20546 ?auto_20547 ) ) ( not ( = ?auto_20546 ?auto_20577 ) ) ( not ( = ?auto_20547 ?auto_20577 ) ) ( IS-CRATE ?auto_20546 ) ( AVAILABLE ?auto_20567 ) ( SURFACE-AT ?auto_20546 ?auto_20586 ) ( ON ?auto_20546 ?auto_20576 ) ( CLEAR ?auto_20546 ) ( not ( = ?auto_20545 ?auto_20546 ) ) ( not ( = ?auto_20545 ?auto_20576 ) ) ( not ( = ?auto_20546 ?auto_20576 ) ) ( SURFACE-AT ?auto_20544 ?auto_20559 ) ( CLEAR ?auto_20544 ) ( IS-CRATE ?auto_20545 ) ( AVAILABLE ?auto_20564 ) ( AVAILABLE ?auto_20574 ) ( SURFACE-AT ?auto_20545 ?auto_20572 ) ( ON ?auto_20545 ?auto_20589 ) ( CLEAR ?auto_20545 ) ( TRUCK-AT ?auto_20561 ?auto_20559 ) ( not ( = ?auto_20544 ?auto_20545 ) ) ( not ( = ?auto_20544 ?auto_20589 ) ) ( not ( = ?auto_20545 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20546 ) ) ( not ( = ?auto_20544 ?auto_20576 ) ) ( not ( = ?auto_20546 ?auto_20589 ) ) ( not ( = ?auto_20586 ?auto_20572 ) ) ( not ( = ?auto_20567 ?auto_20574 ) ) ( not ( = ?auto_20576 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20547 ) ) ( not ( = ?auto_20544 ?auto_20577 ) ) ( not ( = ?auto_20545 ?auto_20547 ) ) ( not ( = ?auto_20545 ?auto_20577 ) ) ( not ( = ?auto_20547 ?auto_20576 ) ) ( not ( = ?auto_20547 ?auto_20589 ) ) ( not ( = ?auto_20563 ?auto_20586 ) ) ( not ( = ?auto_20563 ?auto_20572 ) ) ( not ( = ?auto_20560 ?auto_20567 ) ) ( not ( = ?auto_20560 ?auto_20574 ) ) ( not ( = ?auto_20577 ?auto_20576 ) ) ( not ( = ?auto_20577 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20548 ) ) ( not ( = ?auto_20544 ?auto_20579 ) ) ( not ( = ?auto_20545 ?auto_20548 ) ) ( not ( = ?auto_20545 ?auto_20579 ) ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20579 ) ) ( not ( = ?auto_20548 ?auto_20577 ) ) ( not ( = ?auto_20548 ?auto_20576 ) ) ( not ( = ?auto_20548 ?auto_20589 ) ) ( not ( = ?auto_20566 ?auto_20563 ) ) ( not ( = ?auto_20566 ?auto_20586 ) ) ( not ( = ?auto_20566 ?auto_20572 ) ) ( not ( = ?auto_20581 ?auto_20560 ) ) ( not ( = ?auto_20581 ?auto_20567 ) ) ( not ( = ?auto_20581 ?auto_20574 ) ) ( not ( = ?auto_20579 ?auto_20577 ) ) ( not ( = ?auto_20579 ?auto_20576 ) ) ( not ( = ?auto_20579 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20544 ?auto_20587 ) ) ( not ( = ?auto_20545 ?auto_20549 ) ) ( not ( = ?auto_20545 ?auto_20587 ) ) ( not ( = ?auto_20546 ?auto_20549 ) ) ( not ( = ?auto_20546 ?auto_20587 ) ) ( not ( = ?auto_20547 ?auto_20549 ) ) ( not ( = ?auto_20547 ?auto_20587 ) ) ( not ( = ?auto_20549 ?auto_20579 ) ) ( not ( = ?auto_20549 ?auto_20577 ) ) ( not ( = ?auto_20549 ?auto_20576 ) ) ( not ( = ?auto_20549 ?auto_20589 ) ) ( not ( = ?auto_20578 ?auto_20566 ) ) ( not ( = ?auto_20578 ?auto_20563 ) ) ( not ( = ?auto_20578 ?auto_20586 ) ) ( not ( = ?auto_20578 ?auto_20572 ) ) ( not ( = ?auto_20573 ?auto_20581 ) ) ( not ( = ?auto_20573 ?auto_20560 ) ) ( not ( = ?auto_20573 ?auto_20567 ) ) ( not ( = ?auto_20573 ?auto_20574 ) ) ( not ( = ?auto_20587 ?auto_20579 ) ) ( not ( = ?auto_20587 ?auto_20577 ) ) ( not ( = ?auto_20587 ?auto_20576 ) ) ( not ( = ?auto_20587 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20550 ) ) ( not ( = ?auto_20544 ?auto_20580 ) ) ( not ( = ?auto_20545 ?auto_20550 ) ) ( not ( = ?auto_20545 ?auto_20580 ) ) ( not ( = ?auto_20546 ?auto_20550 ) ) ( not ( = ?auto_20546 ?auto_20580 ) ) ( not ( = ?auto_20547 ?auto_20550 ) ) ( not ( = ?auto_20547 ?auto_20580 ) ) ( not ( = ?auto_20548 ?auto_20550 ) ) ( not ( = ?auto_20548 ?auto_20580 ) ) ( not ( = ?auto_20550 ?auto_20587 ) ) ( not ( = ?auto_20550 ?auto_20579 ) ) ( not ( = ?auto_20550 ?auto_20577 ) ) ( not ( = ?auto_20550 ?auto_20576 ) ) ( not ( = ?auto_20550 ?auto_20589 ) ) ( not ( = ?auto_20580 ?auto_20587 ) ) ( not ( = ?auto_20580 ?auto_20579 ) ) ( not ( = ?auto_20580 ?auto_20577 ) ) ( not ( = ?auto_20580 ?auto_20576 ) ) ( not ( = ?auto_20580 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20553 ) ) ( not ( = ?auto_20544 ?auto_20583 ) ) ( not ( = ?auto_20545 ?auto_20553 ) ) ( not ( = ?auto_20545 ?auto_20583 ) ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20546 ?auto_20583 ) ) ( not ( = ?auto_20547 ?auto_20553 ) ) ( not ( = ?auto_20547 ?auto_20583 ) ) ( not ( = ?auto_20548 ?auto_20553 ) ) ( not ( = ?auto_20548 ?auto_20583 ) ) ( not ( = ?auto_20549 ?auto_20553 ) ) ( not ( = ?auto_20549 ?auto_20583 ) ) ( not ( = ?auto_20553 ?auto_20580 ) ) ( not ( = ?auto_20553 ?auto_20587 ) ) ( not ( = ?auto_20553 ?auto_20579 ) ) ( not ( = ?auto_20553 ?auto_20577 ) ) ( not ( = ?auto_20553 ?auto_20576 ) ) ( not ( = ?auto_20553 ?auto_20589 ) ) ( not ( = ?auto_20583 ?auto_20580 ) ) ( not ( = ?auto_20583 ?auto_20587 ) ) ( not ( = ?auto_20583 ?auto_20579 ) ) ( not ( = ?auto_20583 ?auto_20577 ) ) ( not ( = ?auto_20583 ?auto_20576 ) ) ( not ( = ?auto_20583 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20552 ) ) ( not ( = ?auto_20544 ?auto_20570 ) ) ( not ( = ?auto_20545 ?auto_20552 ) ) ( not ( = ?auto_20545 ?auto_20570 ) ) ( not ( = ?auto_20546 ?auto_20552 ) ) ( not ( = ?auto_20546 ?auto_20570 ) ) ( not ( = ?auto_20547 ?auto_20552 ) ) ( not ( = ?auto_20547 ?auto_20570 ) ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( not ( = ?auto_20548 ?auto_20570 ) ) ( not ( = ?auto_20549 ?auto_20552 ) ) ( not ( = ?auto_20549 ?auto_20570 ) ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( not ( = ?auto_20550 ?auto_20570 ) ) ( not ( = ?auto_20552 ?auto_20583 ) ) ( not ( = ?auto_20552 ?auto_20580 ) ) ( not ( = ?auto_20552 ?auto_20587 ) ) ( not ( = ?auto_20552 ?auto_20579 ) ) ( not ( = ?auto_20552 ?auto_20577 ) ) ( not ( = ?auto_20552 ?auto_20576 ) ) ( not ( = ?auto_20552 ?auto_20589 ) ) ( not ( = ?auto_20570 ?auto_20583 ) ) ( not ( = ?auto_20570 ?auto_20580 ) ) ( not ( = ?auto_20570 ?auto_20587 ) ) ( not ( = ?auto_20570 ?auto_20579 ) ) ( not ( = ?auto_20570 ?auto_20577 ) ) ( not ( = ?auto_20570 ?auto_20576 ) ) ( not ( = ?auto_20570 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20551 ) ) ( not ( = ?auto_20544 ?auto_20568 ) ) ( not ( = ?auto_20545 ?auto_20551 ) ) ( not ( = ?auto_20545 ?auto_20568 ) ) ( not ( = ?auto_20546 ?auto_20551 ) ) ( not ( = ?auto_20546 ?auto_20568 ) ) ( not ( = ?auto_20547 ?auto_20551 ) ) ( not ( = ?auto_20547 ?auto_20568 ) ) ( not ( = ?auto_20548 ?auto_20551 ) ) ( not ( = ?auto_20548 ?auto_20568 ) ) ( not ( = ?auto_20549 ?auto_20551 ) ) ( not ( = ?auto_20549 ?auto_20568 ) ) ( not ( = ?auto_20550 ?auto_20551 ) ) ( not ( = ?auto_20550 ?auto_20568 ) ) ( not ( = ?auto_20553 ?auto_20551 ) ) ( not ( = ?auto_20553 ?auto_20568 ) ) ( not ( = ?auto_20551 ?auto_20570 ) ) ( not ( = ?auto_20551 ?auto_20583 ) ) ( not ( = ?auto_20551 ?auto_20580 ) ) ( not ( = ?auto_20551 ?auto_20587 ) ) ( not ( = ?auto_20551 ?auto_20579 ) ) ( not ( = ?auto_20551 ?auto_20577 ) ) ( not ( = ?auto_20551 ?auto_20576 ) ) ( not ( = ?auto_20551 ?auto_20589 ) ) ( not ( = ?auto_20565 ?auto_20586 ) ) ( not ( = ?auto_20565 ?auto_20578 ) ) ( not ( = ?auto_20565 ?auto_20566 ) ) ( not ( = ?auto_20565 ?auto_20563 ) ) ( not ( = ?auto_20565 ?auto_20572 ) ) ( not ( = ?auto_20569 ?auto_20567 ) ) ( not ( = ?auto_20569 ?auto_20573 ) ) ( not ( = ?auto_20569 ?auto_20581 ) ) ( not ( = ?auto_20569 ?auto_20560 ) ) ( not ( = ?auto_20569 ?auto_20574 ) ) ( not ( = ?auto_20568 ?auto_20570 ) ) ( not ( = ?auto_20568 ?auto_20583 ) ) ( not ( = ?auto_20568 ?auto_20580 ) ) ( not ( = ?auto_20568 ?auto_20587 ) ) ( not ( = ?auto_20568 ?auto_20579 ) ) ( not ( = ?auto_20568 ?auto_20577 ) ) ( not ( = ?auto_20568 ?auto_20576 ) ) ( not ( = ?auto_20568 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20554 ) ) ( not ( = ?auto_20544 ?auto_20584 ) ) ( not ( = ?auto_20545 ?auto_20554 ) ) ( not ( = ?auto_20545 ?auto_20584 ) ) ( not ( = ?auto_20546 ?auto_20554 ) ) ( not ( = ?auto_20546 ?auto_20584 ) ) ( not ( = ?auto_20547 ?auto_20554 ) ) ( not ( = ?auto_20547 ?auto_20584 ) ) ( not ( = ?auto_20548 ?auto_20554 ) ) ( not ( = ?auto_20548 ?auto_20584 ) ) ( not ( = ?auto_20549 ?auto_20554 ) ) ( not ( = ?auto_20549 ?auto_20584 ) ) ( not ( = ?auto_20550 ?auto_20554 ) ) ( not ( = ?auto_20550 ?auto_20584 ) ) ( not ( = ?auto_20553 ?auto_20554 ) ) ( not ( = ?auto_20553 ?auto_20584 ) ) ( not ( = ?auto_20552 ?auto_20554 ) ) ( not ( = ?auto_20552 ?auto_20584 ) ) ( not ( = ?auto_20554 ?auto_20568 ) ) ( not ( = ?auto_20554 ?auto_20570 ) ) ( not ( = ?auto_20554 ?auto_20583 ) ) ( not ( = ?auto_20554 ?auto_20580 ) ) ( not ( = ?auto_20554 ?auto_20587 ) ) ( not ( = ?auto_20554 ?auto_20579 ) ) ( not ( = ?auto_20554 ?auto_20577 ) ) ( not ( = ?auto_20554 ?auto_20576 ) ) ( not ( = ?auto_20554 ?auto_20589 ) ) ( not ( = ?auto_20588 ?auto_20565 ) ) ( not ( = ?auto_20588 ?auto_20586 ) ) ( not ( = ?auto_20588 ?auto_20578 ) ) ( not ( = ?auto_20588 ?auto_20566 ) ) ( not ( = ?auto_20588 ?auto_20563 ) ) ( not ( = ?auto_20588 ?auto_20572 ) ) ( not ( = ?auto_20571 ?auto_20569 ) ) ( not ( = ?auto_20571 ?auto_20567 ) ) ( not ( = ?auto_20571 ?auto_20573 ) ) ( not ( = ?auto_20571 ?auto_20581 ) ) ( not ( = ?auto_20571 ?auto_20560 ) ) ( not ( = ?auto_20571 ?auto_20574 ) ) ( not ( = ?auto_20584 ?auto_20568 ) ) ( not ( = ?auto_20584 ?auto_20570 ) ) ( not ( = ?auto_20584 ?auto_20583 ) ) ( not ( = ?auto_20584 ?auto_20580 ) ) ( not ( = ?auto_20584 ?auto_20587 ) ) ( not ( = ?auto_20584 ?auto_20579 ) ) ( not ( = ?auto_20584 ?auto_20577 ) ) ( not ( = ?auto_20584 ?auto_20576 ) ) ( not ( = ?auto_20584 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20555 ) ) ( not ( = ?auto_20544 ?auto_20582 ) ) ( not ( = ?auto_20545 ?auto_20555 ) ) ( not ( = ?auto_20545 ?auto_20582 ) ) ( not ( = ?auto_20546 ?auto_20555 ) ) ( not ( = ?auto_20546 ?auto_20582 ) ) ( not ( = ?auto_20547 ?auto_20555 ) ) ( not ( = ?auto_20547 ?auto_20582 ) ) ( not ( = ?auto_20548 ?auto_20555 ) ) ( not ( = ?auto_20548 ?auto_20582 ) ) ( not ( = ?auto_20549 ?auto_20555 ) ) ( not ( = ?auto_20549 ?auto_20582 ) ) ( not ( = ?auto_20550 ?auto_20555 ) ) ( not ( = ?auto_20550 ?auto_20582 ) ) ( not ( = ?auto_20553 ?auto_20555 ) ) ( not ( = ?auto_20553 ?auto_20582 ) ) ( not ( = ?auto_20552 ?auto_20555 ) ) ( not ( = ?auto_20552 ?auto_20582 ) ) ( not ( = ?auto_20551 ?auto_20555 ) ) ( not ( = ?auto_20551 ?auto_20582 ) ) ( not ( = ?auto_20555 ?auto_20584 ) ) ( not ( = ?auto_20555 ?auto_20568 ) ) ( not ( = ?auto_20555 ?auto_20570 ) ) ( not ( = ?auto_20555 ?auto_20583 ) ) ( not ( = ?auto_20555 ?auto_20580 ) ) ( not ( = ?auto_20555 ?auto_20587 ) ) ( not ( = ?auto_20555 ?auto_20579 ) ) ( not ( = ?auto_20555 ?auto_20577 ) ) ( not ( = ?auto_20555 ?auto_20576 ) ) ( not ( = ?auto_20555 ?auto_20589 ) ) ( not ( = ?auto_20582 ?auto_20584 ) ) ( not ( = ?auto_20582 ?auto_20568 ) ) ( not ( = ?auto_20582 ?auto_20570 ) ) ( not ( = ?auto_20582 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20580 ) ) ( not ( = ?auto_20582 ?auto_20587 ) ) ( not ( = ?auto_20582 ?auto_20579 ) ) ( not ( = ?auto_20582 ?auto_20577 ) ) ( not ( = ?auto_20582 ?auto_20576 ) ) ( not ( = ?auto_20582 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20556 ) ) ( not ( = ?auto_20544 ?auto_20585 ) ) ( not ( = ?auto_20545 ?auto_20556 ) ) ( not ( = ?auto_20545 ?auto_20585 ) ) ( not ( = ?auto_20546 ?auto_20556 ) ) ( not ( = ?auto_20546 ?auto_20585 ) ) ( not ( = ?auto_20547 ?auto_20556 ) ) ( not ( = ?auto_20547 ?auto_20585 ) ) ( not ( = ?auto_20548 ?auto_20556 ) ) ( not ( = ?auto_20548 ?auto_20585 ) ) ( not ( = ?auto_20549 ?auto_20556 ) ) ( not ( = ?auto_20549 ?auto_20585 ) ) ( not ( = ?auto_20550 ?auto_20556 ) ) ( not ( = ?auto_20550 ?auto_20585 ) ) ( not ( = ?auto_20553 ?auto_20556 ) ) ( not ( = ?auto_20553 ?auto_20585 ) ) ( not ( = ?auto_20552 ?auto_20556 ) ) ( not ( = ?auto_20552 ?auto_20585 ) ) ( not ( = ?auto_20551 ?auto_20556 ) ) ( not ( = ?auto_20551 ?auto_20585 ) ) ( not ( = ?auto_20554 ?auto_20556 ) ) ( not ( = ?auto_20554 ?auto_20585 ) ) ( not ( = ?auto_20556 ?auto_20582 ) ) ( not ( = ?auto_20556 ?auto_20584 ) ) ( not ( = ?auto_20556 ?auto_20568 ) ) ( not ( = ?auto_20556 ?auto_20570 ) ) ( not ( = ?auto_20556 ?auto_20583 ) ) ( not ( = ?auto_20556 ?auto_20580 ) ) ( not ( = ?auto_20556 ?auto_20587 ) ) ( not ( = ?auto_20556 ?auto_20579 ) ) ( not ( = ?auto_20556 ?auto_20577 ) ) ( not ( = ?auto_20556 ?auto_20576 ) ) ( not ( = ?auto_20556 ?auto_20589 ) ) ( not ( = ?auto_20585 ?auto_20582 ) ) ( not ( = ?auto_20585 ?auto_20584 ) ) ( not ( = ?auto_20585 ?auto_20568 ) ) ( not ( = ?auto_20585 ?auto_20570 ) ) ( not ( = ?auto_20585 ?auto_20583 ) ) ( not ( = ?auto_20585 ?auto_20580 ) ) ( not ( = ?auto_20585 ?auto_20587 ) ) ( not ( = ?auto_20585 ?auto_20579 ) ) ( not ( = ?auto_20585 ?auto_20577 ) ) ( not ( = ?auto_20585 ?auto_20576 ) ) ( not ( = ?auto_20585 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20557 ) ) ( not ( = ?auto_20544 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20557 ) ) ( not ( = ?auto_20545 ?auto_20575 ) ) ( not ( = ?auto_20546 ?auto_20557 ) ) ( not ( = ?auto_20546 ?auto_20575 ) ) ( not ( = ?auto_20547 ?auto_20557 ) ) ( not ( = ?auto_20547 ?auto_20575 ) ) ( not ( = ?auto_20548 ?auto_20557 ) ) ( not ( = ?auto_20548 ?auto_20575 ) ) ( not ( = ?auto_20549 ?auto_20557 ) ) ( not ( = ?auto_20549 ?auto_20575 ) ) ( not ( = ?auto_20550 ?auto_20557 ) ) ( not ( = ?auto_20550 ?auto_20575 ) ) ( not ( = ?auto_20553 ?auto_20557 ) ) ( not ( = ?auto_20553 ?auto_20575 ) ) ( not ( = ?auto_20552 ?auto_20557 ) ) ( not ( = ?auto_20552 ?auto_20575 ) ) ( not ( = ?auto_20551 ?auto_20557 ) ) ( not ( = ?auto_20551 ?auto_20575 ) ) ( not ( = ?auto_20554 ?auto_20557 ) ) ( not ( = ?auto_20554 ?auto_20575 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20575 ) ) ( not ( = ?auto_20557 ?auto_20585 ) ) ( not ( = ?auto_20557 ?auto_20582 ) ) ( not ( = ?auto_20557 ?auto_20584 ) ) ( not ( = ?auto_20557 ?auto_20568 ) ) ( not ( = ?auto_20557 ?auto_20570 ) ) ( not ( = ?auto_20557 ?auto_20583 ) ) ( not ( = ?auto_20557 ?auto_20580 ) ) ( not ( = ?auto_20557 ?auto_20587 ) ) ( not ( = ?auto_20557 ?auto_20579 ) ) ( not ( = ?auto_20557 ?auto_20577 ) ) ( not ( = ?auto_20557 ?auto_20576 ) ) ( not ( = ?auto_20557 ?auto_20589 ) ) ( not ( = ?auto_20575 ?auto_20585 ) ) ( not ( = ?auto_20575 ?auto_20582 ) ) ( not ( = ?auto_20575 ?auto_20584 ) ) ( not ( = ?auto_20575 ?auto_20568 ) ) ( not ( = ?auto_20575 ?auto_20570 ) ) ( not ( = ?auto_20575 ?auto_20583 ) ) ( not ( = ?auto_20575 ?auto_20580 ) ) ( not ( = ?auto_20575 ?auto_20587 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20577 ) ) ( not ( = ?auto_20575 ?auto_20576 ) ) ( not ( = ?auto_20575 ?auto_20589 ) ) ( not ( = ?auto_20544 ?auto_20558 ) ) ( not ( = ?auto_20544 ?auto_20562 ) ) ( not ( = ?auto_20545 ?auto_20558 ) ) ( not ( = ?auto_20545 ?auto_20562 ) ) ( not ( = ?auto_20546 ?auto_20558 ) ) ( not ( = ?auto_20546 ?auto_20562 ) ) ( not ( = ?auto_20547 ?auto_20558 ) ) ( not ( = ?auto_20547 ?auto_20562 ) ) ( not ( = ?auto_20548 ?auto_20558 ) ) ( not ( = ?auto_20548 ?auto_20562 ) ) ( not ( = ?auto_20549 ?auto_20558 ) ) ( not ( = ?auto_20549 ?auto_20562 ) ) ( not ( = ?auto_20550 ?auto_20558 ) ) ( not ( = ?auto_20550 ?auto_20562 ) ) ( not ( = ?auto_20553 ?auto_20558 ) ) ( not ( = ?auto_20553 ?auto_20562 ) ) ( not ( = ?auto_20552 ?auto_20558 ) ) ( not ( = ?auto_20552 ?auto_20562 ) ) ( not ( = ?auto_20551 ?auto_20558 ) ) ( not ( = ?auto_20551 ?auto_20562 ) ) ( not ( = ?auto_20554 ?auto_20558 ) ) ( not ( = ?auto_20554 ?auto_20562 ) ) ( not ( = ?auto_20555 ?auto_20558 ) ) ( not ( = ?auto_20555 ?auto_20562 ) ) ( not ( = ?auto_20556 ?auto_20558 ) ) ( not ( = ?auto_20556 ?auto_20562 ) ) ( not ( = ?auto_20558 ?auto_20575 ) ) ( not ( = ?auto_20558 ?auto_20585 ) ) ( not ( = ?auto_20558 ?auto_20582 ) ) ( not ( = ?auto_20558 ?auto_20584 ) ) ( not ( = ?auto_20558 ?auto_20568 ) ) ( not ( = ?auto_20558 ?auto_20570 ) ) ( not ( = ?auto_20558 ?auto_20583 ) ) ( not ( = ?auto_20558 ?auto_20580 ) ) ( not ( = ?auto_20558 ?auto_20587 ) ) ( not ( = ?auto_20558 ?auto_20579 ) ) ( not ( = ?auto_20558 ?auto_20577 ) ) ( not ( = ?auto_20558 ?auto_20576 ) ) ( not ( = ?auto_20558 ?auto_20589 ) ) ( not ( = ?auto_20562 ?auto_20575 ) ) ( not ( = ?auto_20562 ?auto_20585 ) ) ( not ( = ?auto_20562 ?auto_20582 ) ) ( not ( = ?auto_20562 ?auto_20584 ) ) ( not ( = ?auto_20562 ?auto_20568 ) ) ( not ( = ?auto_20562 ?auto_20570 ) ) ( not ( = ?auto_20562 ?auto_20583 ) ) ( not ( = ?auto_20562 ?auto_20580 ) ) ( not ( = ?auto_20562 ?auto_20587 ) ) ( not ( = ?auto_20562 ?auto_20579 ) ) ( not ( = ?auto_20562 ?auto_20577 ) ) ( not ( = ?auto_20562 ?auto_20576 ) ) ( not ( = ?auto_20562 ?auto_20589 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 ?auto_20549 ?auto_20550 ?auto_20553 ?auto_20552 ?auto_20551 ?auto_20554 ?auto_20555 ?auto_20556 ?auto_20557 )
      ( MAKE-1CRATE ?auto_20557 ?auto_20558 )
      ( MAKE-14CRATE-VERIFY ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 ?auto_20549 ?auto_20550 ?auto_20553 ?auto_20552 ?auto_20551 ?auto_20554 ?auto_20555 ?auto_20556 ?auto_20557 ?auto_20558 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_20592 - SURFACE
      ?auto_20593 - SURFACE
    )
    :vars
    (
      ?auto_20594 - HOIST
      ?auto_20595 - PLACE
      ?auto_20597 - PLACE
      ?auto_20598 - HOIST
      ?auto_20599 - SURFACE
      ?auto_20596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20594 ?auto_20595 ) ( SURFACE-AT ?auto_20592 ?auto_20595 ) ( CLEAR ?auto_20592 ) ( IS-CRATE ?auto_20593 ) ( AVAILABLE ?auto_20594 ) ( not ( = ?auto_20597 ?auto_20595 ) ) ( HOIST-AT ?auto_20598 ?auto_20597 ) ( AVAILABLE ?auto_20598 ) ( SURFACE-AT ?auto_20593 ?auto_20597 ) ( ON ?auto_20593 ?auto_20599 ) ( CLEAR ?auto_20593 ) ( TRUCK-AT ?auto_20596 ?auto_20595 ) ( not ( = ?auto_20592 ?auto_20593 ) ) ( not ( = ?auto_20592 ?auto_20599 ) ) ( not ( = ?auto_20593 ?auto_20599 ) ) ( not ( = ?auto_20594 ?auto_20598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_20596 ?auto_20595 ?auto_20597 )
      ( !LIFT ?auto_20598 ?auto_20593 ?auto_20599 ?auto_20597 )
      ( !LOAD ?auto_20598 ?auto_20593 ?auto_20596 ?auto_20597 )
      ( !DRIVE ?auto_20596 ?auto_20597 ?auto_20595 )
      ( !UNLOAD ?auto_20594 ?auto_20593 ?auto_20596 ?auto_20595 )
      ( !DROP ?auto_20594 ?auto_20593 ?auto_20592 ?auto_20595 )
      ( MAKE-1CRATE-VERIFY ?auto_20592 ?auto_20593 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_20616 - SURFACE
      ?auto_20617 - SURFACE
      ?auto_20618 - SURFACE
      ?auto_20619 - SURFACE
      ?auto_20620 - SURFACE
      ?auto_20621 - SURFACE
      ?auto_20622 - SURFACE
      ?auto_20625 - SURFACE
      ?auto_20624 - SURFACE
      ?auto_20623 - SURFACE
      ?auto_20626 - SURFACE
      ?auto_20627 - SURFACE
      ?auto_20628 - SURFACE
      ?auto_20629 - SURFACE
      ?auto_20631 - SURFACE
      ?auto_20630 - SURFACE
    )
    :vars
    (
      ?auto_20636 - HOIST
      ?auto_20635 - PLACE
      ?auto_20637 - PLACE
      ?auto_20633 - HOIST
      ?auto_20634 - SURFACE
      ?auto_20661 - PLACE
      ?auto_20658 - HOIST
      ?auto_20647 - SURFACE
      ?auto_20651 - PLACE
      ?auto_20645 - HOIST
      ?auto_20640 - SURFACE
      ?auto_20639 - PLACE
      ?auto_20664 - HOIST
      ?auto_20643 - SURFACE
      ?auto_20659 - PLACE
      ?auto_20663 - HOIST
      ?auto_20646 - SURFACE
      ?auto_20660 - SURFACE
      ?auto_20648 - PLACE
      ?auto_20656 - HOIST
      ?auto_20653 - SURFACE
      ?auto_20655 - PLACE
      ?auto_20662 - HOIST
      ?auto_20657 - SURFACE
      ?auto_20650 - SURFACE
      ?auto_20644 - PLACE
      ?auto_20665 - HOIST
      ?auto_20642 - SURFACE
      ?auto_20638 - SURFACE
      ?auto_20654 - SURFACE
      ?auto_20649 - SURFACE
      ?auto_20641 - SURFACE
      ?auto_20652 - SURFACE
      ?auto_20632 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20636 ?auto_20635 ) ( IS-CRATE ?auto_20630 ) ( not ( = ?auto_20637 ?auto_20635 ) ) ( HOIST-AT ?auto_20633 ?auto_20637 ) ( AVAILABLE ?auto_20633 ) ( SURFACE-AT ?auto_20630 ?auto_20637 ) ( ON ?auto_20630 ?auto_20634 ) ( CLEAR ?auto_20630 ) ( not ( = ?auto_20631 ?auto_20630 ) ) ( not ( = ?auto_20631 ?auto_20634 ) ) ( not ( = ?auto_20630 ?auto_20634 ) ) ( not ( = ?auto_20636 ?auto_20633 ) ) ( IS-CRATE ?auto_20631 ) ( not ( = ?auto_20661 ?auto_20635 ) ) ( HOIST-AT ?auto_20658 ?auto_20661 ) ( SURFACE-AT ?auto_20631 ?auto_20661 ) ( ON ?auto_20631 ?auto_20647 ) ( CLEAR ?auto_20631 ) ( not ( = ?auto_20629 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20647 ) ) ( not ( = ?auto_20631 ?auto_20647 ) ) ( not ( = ?auto_20636 ?auto_20658 ) ) ( IS-CRATE ?auto_20629 ) ( not ( = ?auto_20651 ?auto_20635 ) ) ( HOIST-AT ?auto_20645 ?auto_20651 ) ( SURFACE-AT ?auto_20629 ?auto_20651 ) ( ON ?auto_20629 ?auto_20640 ) ( CLEAR ?auto_20629 ) ( not ( = ?auto_20628 ?auto_20629 ) ) ( not ( = ?auto_20628 ?auto_20640 ) ) ( not ( = ?auto_20629 ?auto_20640 ) ) ( not ( = ?auto_20636 ?auto_20645 ) ) ( IS-CRATE ?auto_20628 ) ( not ( = ?auto_20639 ?auto_20635 ) ) ( HOIST-AT ?auto_20664 ?auto_20639 ) ( SURFACE-AT ?auto_20628 ?auto_20639 ) ( ON ?auto_20628 ?auto_20643 ) ( CLEAR ?auto_20628 ) ( not ( = ?auto_20627 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20643 ) ) ( not ( = ?auto_20628 ?auto_20643 ) ) ( not ( = ?auto_20636 ?auto_20664 ) ) ( IS-CRATE ?auto_20627 ) ( not ( = ?auto_20659 ?auto_20635 ) ) ( HOIST-AT ?auto_20663 ?auto_20659 ) ( SURFACE-AT ?auto_20627 ?auto_20659 ) ( ON ?auto_20627 ?auto_20646 ) ( CLEAR ?auto_20627 ) ( not ( = ?auto_20626 ?auto_20627 ) ) ( not ( = ?auto_20626 ?auto_20646 ) ) ( not ( = ?auto_20627 ?auto_20646 ) ) ( not ( = ?auto_20636 ?auto_20663 ) ) ( IS-CRATE ?auto_20626 ) ( AVAILABLE ?auto_20664 ) ( SURFACE-AT ?auto_20626 ?auto_20639 ) ( ON ?auto_20626 ?auto_20660 ) ( CLEAR ?auto_20626 ) ( not ( = ?auto_20623 ?auto_20626 ) ) ( not ( = ?auto_20623 ?auto_20660 ) ) ( not ( = ?auto_20626 ?auto_20660 ) ) ( IS-CRATE ?auto_20623 ) ( not ( = ?auto_20648 ?auto_20635 ) ) ( HOIST-AT ?auto_20656 ?auto_20648 ) ( AVAILABLE ?auto_20656 ) ( SURFACE-AT ?auto_20623 ?auto_20648 ) ( ON ?auto_20623 ?auto_20653 ) ( CLEAR ?auto_20623 ) ( not ( = ?auto_20624 ?auto_20623 ) ) ( not ( = ?auto_20624 ?auto_20653 ) ) ( not ( = ?auto_20623 ?auto_20653 ) ) ( not ( = ?auto_20636 ?auto_20656 ) ) ( IS-CRATE ?auto_20624 ) ( not ( = ?auto_20655 ?auto_20635 ) ) ( HOIST-AT ?auto_20662 ?auto_20655 ) ( SURFACE-AT ?auto_20624 ?auto_20655 ) ( ON ?auto_20624 ?auto_20657 ) ( CLEAR ?auto_20624 ) ( not ( = ?auto_20625 ?auto_20624 ) ) ( not ( = ?auto_20625 ?auto_20657 ) ) ( not ( = ?auto_20624 ?auto_20657 ) ) ( not ( = ?auto_20636 ?auto_20662 ) ) ( IS-CRATE ?auto_20625 ) ( SURFACE-AT ?auto_20625 ?auto_20655 ) ( ON ?auto_20625 ?auto_20650 ) ( CLEAR ?auto_20625 ) ( not ( = ?auto_20622 ?auto_20625 ) ) ( not ( = ?auto_20622 ?auto_20650 ) ) ( not ( = ?auto_20625 ?auto_20650 ) ) ( IS-CRATE ?auto_20622 ) ( not ( = ?auto_20644 ?auto_20635 ) ) ( HOIST-AT ?auto_20665 ?auto_20644 ) ( SURFACE-AT ?auto_20622 ?auto_20644 ) ( ON ?auto_20622 ?auto_20642 ) ( CLEAR ?auto_20622 ) ( not ( = ?auto_20621 ?auto_20622 ) ) ( not ( = ?auto_20621 ?auto_20642 ) ) ( not ( = ?auto_20622 ?auto_20642 ) ) ( not ( = ?auto_20636 ?auto_20665 ) ) ( IS-CRATE ?auto_20621 ) ( AVAILABLE ?auto_20665 ) ( SURFACE-AT ?auto_20621 ?auto_20644 ) ( ON ?auto_20621 ?auto_20638 ) ( CLEAR ?auto_20621 ) ( not ( = ?auto_20620 ?auto_20621 ) ) ( not ( = ?auto_20620 ?auto_20638 ) ) ( not ( = ?auto_20621 ?auto_20638 ) ) ( IS-CRATE ?auto_20620 ) ( AVAILABLE ?auto_20645 ) ( SURFACE-AT ?auto_20620 ?auto_20651 ) ( ON ?auto_20620 ?auto_20654 ) ( CLEAR ?auto_20620 ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( not ( = ?auto_20619 ?auto_20654 ) ) ( not ( = ?auto_20620 ?auto_20654 ) ) ( IS-CRATE ?auto_20619 ) ( AVAILABLE ?auto_20658 ) ( SURFACE-AT ?auto_20619 ?auto_20661 ) ( ON ?auto_20619 ?auto_20649 ) ( CLEAR ?auto_20619 ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20618 ?auto_20649 ) ) ( not ( = ?auto_20619 ?auto_20649 ) ) ( IS-CRATE ?auto_20618 ) ( AVAILABLE ?auto_20662 ) ( SURFACE-AT ?auto_20618 ?auto_20655 ) ( ON ?auto_20618 ?auto_20641 ) ( CLEAR ?auto_20618 ) ( not ( = ?auto_20617 ?auto_20618 ) ) ( not ( = ?auto_20617 ?auto_20641 ) ) ( not ( = ?auto_20618 ?auto_20641 ) ) ( SURFACE-AT ?auto_20616 ?auto_20635 ) ( CLEAR ?auto_20616 ) ( IS-CRATE ?auto_20617 ) ( AVAILABLE ?auto_20636 ) ( AVAILABLE ?auto_20663 ) ( SURFACE-AT ?auto_20617 ?auto_20659 ) ( ON ?auto_20617 ?auto_20652 ) ( CLEAR ?auto_20617 ) ( TRUCK-AT ?auto_20632 ?auto_20635 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20616 ?auto_20652 ) ) ( not ( = ?auto_20617 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20618 ) ) ( not ( = ?auto_20616 ?auto_20641 ) ) ( not ( = ?auto_20618 ?auto_20652 ) ) ( not ( = ?auto_20655 ?auto_20659 ) ) ( not ( = ?auto_20662 ?auto_20663 ) ) ( not ( = ?auto_20641 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20619 ) ) ( not ( = ?auto_20616 ?auto_20649 ) ) ( not ( = ?auto_20617 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20649 ) ) ( not ( = ?auto_20619 ?auto_20641 ) ) ( not ( = ?auto_20619 ?auto_20652 ) ) ( not ( = ?auto_20661 ?auto_20655 ) ) ( not ( = ?auto_20661 ?auto_20659 ) ) ( not ( = ?auto_20658 ?auto_20662 ) ) ( not ( = ?auto_20658 ?auto_20663 ) ) ( not ( = ?auto_20649 ?auto_20641 ) ) ( not ( = ?auto_20649 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20620 ) ) ( not ( = ?auto_20616 ?auto_20654 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) ( not ( = ?auto_20617 ?auto_20654 ) ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( not ( = ?auto_20618 ?auto_20654 ) ) ( not ( = ?auto_20620 ?auto_20649 ) ) ( not ( = ?auto_20620 ?auto_20641 ) ) ( not ( = ?auto_20620 ?auto_20652 ) ) ( not ( = ?auto_20651 ?auto_20661 ) ) ( not ( = ?auto_20651 ?auto_20655 ) ) ( not ( = ?auto_20651 ?auto_20659 ) ) ( not ( = ?auto_20645 ?auto_20658 ) ) ( not ( = ?auto_20645 ?auto_20662 ) ) ( not ( = ?auto_20645 ?auto_20663 ) ) ( not ( = ?auto_20654 ?auto_20649 ) ) ( not ( = ?auto_20654 ?auto_20641 ) ) ( not ( = ?auto_20654 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20638 ) ) ( not ( = ?auto_20617 ?auto_20621 ) ) ( not ( = ?auto_20617 ?auto_20638 ) ) ( not ( = ?auto_20618 ?auto_20621 ) ) ( not ( = ?auto_20618 ?auto_20638 ) ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( not ( = ?auto_20619 ?auto_20638 ) ) ( not ( = ?auto_20621 ?auto_20654 ) ) ( not ( = ?auto_20621 ?auto_20649 ) ) ( not ( = ?auto_20621 ?auto_20641 ) ) ( not ( = ?auto_20621 ?auto_20652 ) ) ( not ( = ?auto_20644 ?auto_20651 ) ) ( not ( = ?auto_20644 ?auto_20661 ) ) ( not ( = ?auto_20644 ?auto_20655 ) ) ( not ( = ?auto_20644 ?auto_20659 ) ) ( not ( = ?auto_20665 ?auto_20645 ) ) ( not ( = ?auto_20665 ?auto_20658 ) ) ( not ( = ?auto_20665 ?auto_20662 ) ) ( not ( = ?auto_20665 ?auto_20663 ) ) ( not ( = ?auto_20638 ?auto_20654 ) ) ( not ( = ?auto_20638 ?auto_20649 ) ) ( not ( = ?auto_20638 ?auto_20641 ) ) ( not ( = ?auto_20638 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20622 ) ) ( not ( = ?auto_20616 ?auto_20642 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20642 ) ) ( not ( = ?auto_20618 ?auto_20622 ) ) ( not ( = ?auto_20618 ?auto_20642 ) ) ( not ( = ?auto_20619 ?auto_20622 ) ) ( not ( = ?auto_20619 ?auto_20642 ) ) ( not ( = ?auto_20620 ?auto_20622 ) ) ( not ( = ?auto_20620 ?auto_20642 ) ) ( not ( = ?auto_20622 ?auto_20638 ) ) ( not ( = ?auto_20622 ?auto_20654 ) ) ( not ( = ?auto_20622 ?auto_20649 ) ) ( not ( = ?auto_20622 ?auto_20641 ) ) ( not ( = ?auto_20622 ?auto_20652 ) ) ( not ( = ?auto_20642 ?auto_20638 ) ) ( not ( = ?auto_20642 ?auto_20654 ) ) ( not ( = ?auto_20642 ?auto_20649 ) ) ( not ( = ?auto_20642 ?auto_20641 ) ) ( not ( = ?auto_20642 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20625 ) ) ( not ( = ?auto_20616 ?auto_20650 ) ) ( not ( = ?auto_20617 ?auto_20625 ) ) ( not ( = ?auto_20617 ?auto_20650 ) ) ( not ( = ?auto_20618 ?auto_20625 ) ) ( not ( = ?auto_20618 ?auto_20650 ) ) ( not ( = ?auto_20619 ?auto_20625 ) ) ( not ( = ?auto_20619 ?auto_20650 ) ) ( not ( = ?auto_20620 ?auto_20625 ) ) ( not ( = ?auto_20620 ?auto_20650 ) ) ( not ( = ?auto_20621 ?auto_20625 ) ) ( not ( = ?auto_20621 ?auto_20650 ) ) ( not ( = ?auto_20625 ?auto_20642 ) ) ( not ( = ?auto_20625 ?auto_20638 ) ) ( not ( = ?auto_20625 ?auto_20654 ) ) ( not ( = ?auto_20625 ?auto_20649 ) ) ( not ( = ?auto_20625 ?auto_20641 ) ) ( not ( = ?auto_20625 ?auto_20652 ) ) ( not ( = ?auto_20650 ?auto_20642 ) ) ( not ( = ?auto_20650 ?auto_20638 ) ) ( not ( = ?auto_20650 ?auto_20654 ) ) ( not ( = ?auto_20650 ?auto_20649 ) ) ( not ( = ?auto_20650 ?auto_20641 ) ) ( not ( = ?auto_20650 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20624 ) ) ( not ( = ?auto_20616 ?auto_20657 ) ) ( not ( = ?auto_20617 ?auto_20624 ) ) ( not ( = ?auto_20617 ?auto_20657 ) ) ( not ( = ?auto_20618 ?auto_20624 ) ) ( not ( = ?auto_20618 ?auto_20657 ) ) ( not ( = ?auto_20619 ?auto_20624 ) ) ( not ( = ?auto_20619 ?auto_20657 ) ) ( not ( = ?auto_20620 ?auto_20624 ) ) ( not ( = ?auto_20620 ?auto_20657 ) ) ( not ( = ?auto_20621 ?auto_20624 ) ) ( not ( = ?auto_20621 ?auto_20657 ) ) ( not ( = ?auto_20622 ?auto_20624 ) ) ( not ( = ?auto_20622 ?auto_20657 ) ) ( not ( = ?auto_20624 ?auto_20650 ) ) ( not ( = ?auto_20624 ?auto_20642 ) ) ( not ( = ?auto_20624 ?auto_20638 ) ) ( not ( = ?auto_20624 ?auto_20654 ) ) ( not ( = ?auto_20624 ?auto_20649 ) ) ( not ( = ?auto_20624 ?auto_20641 ) ) ( not ( = ?auto_20624 ?auto_20652 ) ) ( not ( = ?auto_20657 ?auto_20650 ) ) ( not ( = ?auto_20657 ?auto_20642 ) ) ( not ( = ?auto_20657 ?auto_20638 ) ) ( not ( = ?auto_20657 ?auto_20654 ) ) ( not ( = ?auto_20657 ?auto_20649 ) ) ( not ( = ?auto_20657 ?auto_20641 ) ) ( not ( = ?auto_20657 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20623 ) ) ( not ( = ?auto_20616 ?auto_20653 ) ) ( not ( = ?auto_20617 ?auto_20623 ) ) ( not ( = ?auto_20617 ?auto_20653 ) ) ( not ( = ?auto_20618 ?auto_20623 ) ) ( not ( = ?auto_20618 ?auto_20653 ) ) ( not ( = ?auto_20619 ?auto_20623 ) ) ( not ( = ?auto_20619 ?auto_20653 ) ) ( not ( = ?auto_20620 ?auto_20623 ) ) ( not ( = ?auto_20620 ?auto_20653 ) ) ( not ( = ?auto_20621 ?auto_20623 ) ) ( not ( = ?auto_20621 ?auto_20653 ) ) ( not ( = ?auto_20622 ?auto_20623 ) ) ( not ( = ?auto_20622 ?auto_20653 ) ) ( not ( = ?auto_20625 ?auto_20623 ) ) ( not ( = ?auto_20625 ?auto_20653 ) ) ( not ( = ?auto_20623 ?auto_20657 ) ) ( not ( = ?auto_20623 ?auto_20650 ) ) ( not ( = ?auto_20623 ?auto_20642 ) ) ( not ( = ?auto_20623 ?auto_20638 ) ) ( not ( = ?auto_20623 ?auto_20654 ) ) ( not ( = ?auto_20623 ?auto_20649 ) ) ( not ( = ?auto_20623 ?auto_20641 ) ) ( not ( = ?auto_20623 ?auto_20652 ) ) ( not ( = ?auto_20648 ?auto_20655 ) ) ( not ( = ?auto_20648 ?auto_20644 ) ) ( not ( = ?auto_20648 ?auto_20651 ) ) ( not ( = ?auto_20648 ?auto_20661 ) ) ( not ( = ?auto_20648 ?auto_20659 ) ) ( not ( = ?auto_20656 ?auto_20662 ) ) ( not ( = ?auto_20656 ?auto_20665 ) ) ( not ( = ?auto_20656 ?auto_20645 ) ) ( not ( = ?auto_20656 ?auto_20658 ) ) ( not ( = ?auto_20656 ?auto_20663 ) ) ( not ( = ?auto_20653 ?auto_20657 ) ) ( not ( = ?auto_20653 ?auto_20650 ) ) ( not ( = ?auto_20653 ?auto_20642 ) ) ( not ( = ?auto_20653 ?auto_20638 ) ) ( not ( = ?auto_20653 ?auto_20654 ) ) ( not ( = ?auto_20653 ?auto_20649 ) ) ( not ( = ?auto_20653 ?auto_20641 ) ) ( not ( = ?auto_20653 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20626 ) ) ( not ( = ?auto_20616 ?auto_20660 ) ) ( not ( = ?auto_20617 ?auto_20626 ) ) ( not ( = ?auto_20617 ?auto_20660 ) ) ( not ( = ?auto_20618 ?auto_20626 ) ) ( not ( = ?auto_20618 ?auto_20660 ) ) ( not ( = ?auto_20619 ?auto_20626 ) ) ( not ( = ?auto_20619 ?auto_20660 ) ) ( not ( = ?auto_20620 ?auto_20626 ) ) ( not ( = ?auto_20620 ?auto_20660 ) ) ( not ( = ?auto_20621 ?auto_20626 ) ) ( not ( = ?auto_20621 ?auto_20660 ) ) ( not ( = ?auto_20622 ?auto_20626 ) ) ( not ( = ?auto_20622 ?auto_20660 ) ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( not ( = ?auto_20625 ?auto_20660 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) ( not ( = ?auto_20624 ?auto_20660 ) ) ( not ( = ?auto_20626 ?auto_20653 ) ) ( not ( = ?auto_20626 ?auto_20657 ) ) ( not ( = ?auto_20626 ?auto_20650 ) ) ( not ( = ?auto_20626 ?auto_20642 ) ) ( not ( = ?auto_20626 ?auto_20638 ) ) ( not ( = ?auto_20626 ?auto_20654 ) ) ( not ( = ?auto_20626 ?auto_20649 ) ) ( not ( = ?auto_20626 ?auto_20641 ) ) ( not ( = ?auto_20626 ?auto_20652 ) ) ( not ( = ?auto_20639 ?auto_20648 ) ) ( not ( = ?auto_20639 ?auto_20655 ) ) ( not ( = ?auto_20639 ?auto_20644 ) ) ( not ( = ?auto_20639 ?auto_20651 ) ) ( not ( = ?auto_20639 ?auto_20661 ) ) ( not ( = ?auto_20639 ?auto_20659 ) ) ( not ( = ?auto_20664 ?auto_20656 ) ) ( not ( = ?auto_20664 ?auto_20662 ) ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( not ( = ?auto_20664 ?auto_20645 ) ) ( not ( = ?auto_20664 ?auto_20658 ) ) ( not ( = ?auto_20664 ?auto_20663 ) ) ( not ( = ?auto_20660 ?auto_20653 ) ) ( not ( = ?auto_20660 ?auto_20657 ) ) ( not ( = ?auto_20660 ?auto_20650 ) ) ( not ( = ?auto_20660 ?auto_20642 ) ) ( not ( = ?auto_20660 ?auto_20638 ) ) ( not ( = ?auto_20660 ?auto_20654 ) ) ( not ( = ?auto_20660 ?auto_20649 ) ) ( not ( = ?auto_20660 ?auto_20641 ) ) ( not ( = ?auto_20660 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20627 ) ) ( not ( = ?auto_20616 ?auto_20646 ) ) ( not ( = ?auto_20617 ?auto_20627 ) ) ( not ( = ?auto_20617 ?auto_20646 ) ) ( not ( = ?auto_20618 ?auto_20627 ) ) ( not ( = ?auto_20618 ?auto_20646 ) ) ( not ( = ?auto_20619 ?auto_20627 ) ) ( not ( = ?auto_20619 ?auto_20646 ) ) ( not ( = ?auto_20620 ?auto_20627 ) ) ( not ( = ?auto_20620 ?auto_20646 ) ) ( not ( = ?auto_20621 ?auto_20627 ) ) ( not ( = ?auto_20621 ?auto_20646 ) ) ( not ( = ?auto_20622 ?auto_20627 ) ) ( not ( = ?auto_20622 ?auto_20646 ) ) ( not ( = ?auto_20625 ?auto_20627 ) ) ( not ( = ?auto_20625 ?auto_20646 ) ) ( not ( = ?auto_20624 ?auto_20627 ) ) ( not ( = ?auto_20624 ?auto_20646 ) ) ( not ( = ?auto_20623 ?auto_20627 ) ) ( not ( = ?auto_20623 ?auto_20646 ) ) ( not ( = ?auto_20627 ?auto_20660 ) ) ( not ( = ?auto_20627 ?auto_20653 ) ) ( not ( = ?auto_20627 ?auto_20657 ) ) ( not ( = ?auto_20627 ?auto_20650 ) ) ( not ( = ?auto_20627 ?auto_20642 ) ) ( not ( = ?auto_20627 ?auto_20638 ) ) ( not ( = ?auto_20627 ?auto_20654 ) ) ( not ( = ?auto_20627 ?auto_20649 ) ) ( not ( = ?auto_20627 ?auto_20641 ) ) ( not ( = ?auto_20627 ?auto_20652 ) ) ( not ( = ?auto_20646 ?auto_20660 ) ) ( not ( = ?auto_20646 ?auto_20653 ) ) ( not ( = ?auto_20646 ?auto_20657 ) ) ( not ( = ?auto_20646 ?auto_20650 ) ) ( not ( = ?auto_20646 ?auto_20642 ) ) ( not ( = ?auto_20646 ?auto_20638 ) ) ( not ( = ?auto_20646 ?auto_20654 ) ) ( not ( = ?auto_20646 ?auto_20649 ) ) ( not ( = ?auto_20646 ?auto_20641 ) ) ( not ( = ?auto_20646 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20628 ) ) ( not ( = ?auto_20616 ?auto_20643 ) ) ( not ( = ?auto_20617 ?auto_20628 ) ) ( not ( = ?auto_20617 ?auto_20643 ) ) ( not ( = ?auto_20618 ?auto_20628 ) ) ( not ( = ?auto_20618 ?auto_20643 ) ) ( not ( = ?auto_20619 ?auto_20628 ) ) ( not ( = ?auto_20619 ?auto_20643 ) ) ( not ( = ?auto_20620 ?auto_20628 ) ) ( not ( = ?auto_20620 ?auto_20643 ) ) ( not ( = ?auto_20621 ?auto_20628 ) ) ( not ( = ?auto_20621 ?auto_20643 ) ) ( not ( = ?auto_20622 ?auto_20628 ) ) ( not ( = ?auto_20622 ?auto_20643 ) ) ( not ( = ?auto_20625 ?auto_20628 ) ) ( not ( = ?auto_20625 ?auto_20643 ) ) ( not ( = ?auto_20624 ?auto_20628 ) ) ( not ( = ?auto_20624 ?auto_20643 ) ) ( not ( = ?auto_20623 ?auto_20628 ) ) ( not ( = ?auto_20623 ?auto_20643 ) ) ( not ( = ?auto_20626 ?auto_20628 ) ) ( not ( = ?auto_20626 ?auto_20643 ) ) ( not ( = ?auto_20628 ?auto_20646 ) ) ( not ( = ?auto_20628 ?auto_20660 ) ) ( not ( = ?auto_20628 ?auto_20653 ) ) ( not ( = ?auto_20628 ?auto_20657 ) ) ( not ( = ?auto_20628 ?auto_20650 ) ) ( not ( = ?auto_20628 ?auto_20642 ) ) ( not ( = ?auto_20628 ?auto_20638 ) ) ( not ( = ?auto_20628 ?auto_20654 ) ) ( not ( = ?auto_20628 ?auto_20649 ) ) ( not ( = ?auto_20628 ?auto_20641 ) ) ( not ( = ?auto_20628 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20646 ) ) ( not ( = ?auto_20643 ?auto_20660 ) ) ( not ( = ?auto_20643 ?auto_20653 ) ) ( not ( = ?auto_20643 ?auto_20657 ) ) ( not ( = ?auto_20643 ?auto_20650 ) ) ( not ( = ?auto_20643 ?auto_20642 ) ) ( not ( = ?auto_20643 ?auto_20638 ) ) ( not ( = ?auto_20643 ?auto_20654 ) ) ( not ( = ?auto_20643 ?auto_20649 ) ) ( not ( = ?auto_20643 ?auto_20641 ) ) ( not ( = ?auto_20643 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20629 ) ) ( not ( = ?auto_20616 ?auto_20640 ) ) ( not ( = ?auto_20617 ?auto_20629 ) ) ( not ( = ?auto_20617 ?auto_20640 ) ) ( not ( = ?auto_20618 ?auto_20629 ) ) ( not ( = ?auto_20618 ?auto_20640 ) ) ( not ( = ?auto_20619 ?auto_20629 ) ) ( not ( = ?auto_20619 ?auto_20640 ) ) ( not ( = ?auto_20620 ?auto_20629 ) ) ( not ( = ?auto_20620 ?auto_20640 ) ) ( not ( = ?auto_20621 ?auto_20629 ) ) ( not ( = ?auto_20621 ?auto_20640 ) ) ( not ( = ?auto_20622 ?auto_20629 ) ) ( not ( = ?auto_20622 ?auto_20640 ) ) ( not ( = ?auto_20625 ?auto_20629 ) ) ( not ( = ?auto_20625 ?auto_20640 ) ) ( not ( = ?auto_20624 ?auto_20629 ) ) ( not ( = ?auto_20624 ?auto_20640 ) ) ( not ( = ?auto_20623 ?auto_20629 ) ) ( not ( = ?auto_20623 ?auto_20640 ) ) ( not ( = ?auto_20626 ?auto_20629 ) ) ( not ( = ?auto_20626 ?auto_20640 ) ) ( not ( = ?auto_20627 ?auto_20629 ) ) ( not ( = ?auto_20627 ?auto_20640 ) ) ( not ( = ?auto_20629 ?auto_20643 ) ) ( not ( = ?auto_20629 ?auto_20646 ) ) ( not ( = ?auto_20629 ?auto_20660 ) ) ( not ( = ?auto_20629 ?auto_20653 ) ) ( not ( = ?auto_20629 ?auto_20657 ) ) ( not ( = ?auto_20629 ?auto_20650 ) ) ( not ( = ?auto_20629 ?auto_20642 ) ) ( not ( = ?auto_20629 ?auto_20638 ) ) ( not ( = ?auto_20629 ?auto_20654 ) ) ( not ( = ?auto_20629 ?auto_20649 ) ) ( not ( = ?auto_20629 ?auto_20641 ) ) ( not ( = ?auto_20629 ?auto_20652 ) ) ( not ( = ?auto_20640 ?auto_20643 ) ) ( not ( = ?auto_20640 ?auto_20646 ) ) ( not ( = ?auto_20640 ?auto_20660 ) ) ( not ( = ?auto_20640 ?auto_20653 ) ) ( not ( = ?auto_20640 ?auto_20657 ) ) ( not ( = ?auto_20640 ?auto_20650 ) ) ( not ( = ?auto_20640 ?auto_20642 ) ) ( not ( = ?auto_20640 ?auto_20638 ) ) ( not ( = ?auto_20640 ?auto_20654 ) ) ( not ( = ?auto_20640 ?auto_20649 ) ) ( not ( = ?auto_20640 ?auto_20641 ) ) ( not ( = ?auto_20640 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20631 ) ) ( not ( = ?auto_20616 ?auto_20647 ) ) ( not ( = ?auto_20617 ?auto_20631 ) ) ( not ( = ?auto_20617 ?auto_20647 ) ) ( not ( = ?auto_20618 ?auto_20631 ) ) ( not ( = ?auto_20618 ?auto_20647 ) ) ( not ( = ?auto_20619 ?auto_20631 ) ) ( not ( = ?auto_20619 ?auto_20647 ) ) ( not ( = ?auto_20620 ?auto_20631 ) ) ( not ( = ?auto_20620 ?auto_20647 ) ) ( not ( = ?auto_20621 ?auto_20631 ) ) ( not ( = ?auto_20621 ?auto_20647 ) ) ( not ( = ?auto_20622 ?auto_20631 ) ) ( not ( = ?auto_20622 ?auto_20647 ) ) ( not ( = ?auto_20625 ?auto_20631 ) ) ( not ( = ?auto_20625 ?auto_20647 ) ) ( not ( = ?auto_20624 ?auto_20631 ) ) ( not ( = ?auto_20624 ?auto_20647 ) ) ( not ( = ?auto_20623 ?auto_20631 ) ) ( not ( = ?auto_20623 ?auto_20647 ) ) ( not ( = ?auto_20626 ?auto_20631 ) ) ( not ( = ?auto_20626 ?auto_20647 ) ) ( not ( = ?auto_20627 ?auto_20631 ) ) ( not ( = ?auto_20627 ?auto_20647 ) ) ( not ( = ?auto_20628 ?auto_20631 ) ) ( not ( = ?auto_20628 ?auto_20647 ) ) ( not ( = ?auto_20631 ?auto_20640 ) ) ( not ( = ?auto_20631 ?auto_20643 ) ) ( not ( = ?auto_20631 ?auto_20646 ) ) ( not ( = ?auto_20631 ?auto_20660 ) ) ( not ( = ?auto_20631 ?auto_20653 ) ) ( not ( = ?auto_20631 ?auto_20657 ) ) ( not ( = ?auto_20631 ?auto_20650 ) ) ( not ( = ?auto_20631 ?auto_20642 ) ) ( not ( = ?auto_20631 ?auto_20638 ) ) ( not ( = ?auto_20631 ?auto_20654 ) ) ( not ( = ?auto_20631 ?auto_20649 ) ) ( not ( = ?auto_20631 ?auto_20641 ) ) ( not ( = ?auto_20631 ?auto_20652 ) ) ( not ( = ?auto_20647 ?auto_20640 ) ) ( not ( = ?auto_20647 ?auto_20643 ) ) ( not ( = ?auto_20647 ?auto_20646 ) ) ( not ( = ?auto_20647 ?auto_20660 ) ) ( not ( = ?auto_20647 ?auto_20653 ) ) ( not ( = ?auto_20647 ?auto_20657 ) ) ( not ( = ?auto_20647 ?auto_20650 ) ) ( not ( = ?auto_20647 ?auto_20642 ) ) ( not ( = ?auto_20647 ?auto_20638 ) ) ( not ( = ?auto_20647 ?auto_20654 ) ) ( not ( = ?auto_20647 ?auto_20649 ) ) ( not ( = ?auto_20647 ?auto_20641 ) ) ( not ( = ?auto_20647 ?auto_20652 ) ) ( not ( = ?auto_20616 ?auto_20630 ) ) ( not ( = ?auto_20616 ?auto_20634 ) ) ( not ( = ?auto_20617 ?auto_20630 ) ) ( not ( = ?auto_20617 ?auto_20634 ) ) ( not ( = ?auto_20618 ?auto_20630 ) ) ( not ( = ?auto_20618 ?auto_20634 ) ) ( not ( = ?auto_20619 ?auto_20630 ) ) ( not ( = ?auto_20619 ?auto_20634 ) ) ( not ( = ?auto_20620 ?auto_20630 ) ) ( not ( = ?auto_20620 ?auto_20634 ) ) ( not ( = ?auto_20621 ?auto_20630 ) ) ( not ( = ?auto_20621 ?auto_20634 ) ) ( not ( = ?auto_20622 ?auto_20630 ) ) ( not ( = ?auto_20622 ?auto_20634 ) ) ( not ( = ?auto_20625 ?auto_20630 ) ) ( not ( = ?auto_20625 ?auto_20634 ) ) ( not ( = ?auto_20624 ?auto_20630 ) ) ( not ( = ?auto_20624 ?auto_20634 ) ) ( not ( = ?auto_20623 ?auto_20630 ) ) ( not ( = ?auto_20623 ?auto_20634 ) ) ( not ( = ?auto_20626 ?auto_20630 ) ) ( not ( = ?auto_20626 ?auto_20634 ) ) ( not ( = ?auto_20627 ?auto_20630 ) ) ( not ( = ?auto_20627 ?auto_20634 ) ) ( not ( = ?auto_20628 ?auto_20630 ) ) ( not ( = ?auto_20628 ?auto_20634 ) ) ( not ( = ?auto_20629 ?auto_20630 ) ) ( not ( = ?auto_20629 ?auto_20634 ) ) ( not ( = ?auto_20630 ?auto_20647 ) ) ( not ( = ?auto_20630 ?auto_20640 ) ) ( not ( = ?auto_20630 ?auto_20643 ) ) ( not ( = ?auto_20630 ?auto_20646 ) ) ( not ( = ?auto_20630 ?auto_20660 ) ) ( not ( = ?auto_20630 ?auto_20653 ) ) ( not ( = ?auto_20630 ?auto_20657 ) ) ( not ( = ?auto_20630 ?auto_20650 ) ) ( not ( = ?auto_20630 ?auto_20642 ) ) ( not ( = ?auto_20630 ?auto_20638 ) ) ( not ( = ?auto_20630 ?auto_20654 ) ) ( not ( = ?auto_20630 ?auto_20649 ) ) ( not ( = ?auto_20630 ?auto_20641 ) ) ( not ( = ?auto_20630 ?auto_20652 ) ) ( not ( = ?auto_20637 ?auto_20661 ) ) ( not ( = ?auto_20637 ?auto_20651 ) ) ( not ( = ?auto_20637 ?auto_20639 ) ) ( not ( = ?auto_20637 ?auto_20659 ) ) ( not ( = ?auto_20637 ?auto_20648 ) ) ( not ( = ?auto_20637 ?auto_20655 ) ) ( not ( = ?auto_20637 ?auto_20644 ) ) ( not ( = ?auto_20633 ?auto_20658 ) ) ( not ( = ?auto_20633 ?auto_20645 ) ) ( not ( = ?auto_20633 ?auto_20664 ) ) ( not ( = ?auto_20633 ?auto_20663 ) ) ( not ( = ?auto_20633 ?auto_20656 ) ) ( not ( = ?auto_20633 ?auto_20662 ) ) ( not ( = ?auto_20633 ?auto_20665 ) ) ( not ( = ?auto_20634 ?auto_20647 ) ) ( not ( = ?auto_20634 ?auto_20640 ) ) ( not ( = ?auto_20634 ?auto_20643 ) ) ( not ( = ?auto_20634 ?auto_20646 ) ) ( not ( = ?auto_20634 ?auto_20660 ) ) ( not ( = ?auto_20634 ?auto_20653 ) ) ( not ( = ?auto_20634 ?auto_20657 ) ) ( not ( = ?auto_20634 ?auto_20650 ) ) ( not ( = ?auto_20634 ?auto_20642 ) ) ( not ( = ?auto_20634 ?auto_20638 ) ) ( not ( = ?auto_20634 ?auto_20654 ) ) ( not ( = ?auto_20634 ?auto_20649 ) ) ( not ( = ?auto_20634 ?auto_20641 ) ) ( not ( = ?auto_20634 ?auto_20652 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ?auto_20621 ?auto_20622 ?auto_20625 ?auto_20624 ?auto_20623 ?auto_20626 ?auto_20627 ?auto_20628 ?auto_20629 ?auto_20631 )
      ( MAKE-1CRATE ?auto_20631 ?auto_20630 )
      ( MAKE-15CRATE-VERIFY ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ?auto_20621 ?auto_20622 ?auto_20625 ?auto_20624 ?auto_20623 ?auto_20626 ?auto_20627 ?auto_20628 ?auto_20629 ?auto_20631 ?auto_20630 ) )
  )

)

