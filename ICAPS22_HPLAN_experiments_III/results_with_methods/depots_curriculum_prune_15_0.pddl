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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_19956 - SURFACE
      ?auto_19957 - SURFACE
      ?auto_19958 - SURFACE
    )
    :vars
    (
      ?auto_19960 - HOIST
      ?auto_19961 - PLACE
      ?auto_19959 - PLACE
      ?auto_19963 - HOIST
      ?auto_19962 - SURFACE
      ?auto_19966 - PLACE
      ?auto_19965 - HOIST
      ?auto_19967 - SURFACE
      ?auto_19964 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19960 ?auto_19961 ) ( IS-CRATE ?auto_19958 ) ( not ( = ?auto_19959 ?auto_19961 ) ) ( HOIST-AT ?auto_19963 ?auto_19959 ) ( AVAILABLE ?auto_19963 ) ( SURFACE-AT ?auto_19958 ?auto_19959 ) ( ON ?auto_19958 ?auto_19962 ) ( CLEAR ?auto_19958 ) ( not ( = ?auto_19957 ?auto_19958 ) ) ( not ( = ?auto_19957 ?auto_19962 ) ) ( not ( = ?auto_19958 ?auto_19962 ) ) ( not ( = ?auto_19960 ?auto_19963 ) ) ( SURFACE-AT ?auto_19956 ?auto_19961 ) ( CLEAR ?auto_19956 ) ( IS-CRATE ?auto_19957 ) ( AVAILABLE ?auto_19960 ) ( not ( = ?auto_19966 ?auto_19961 ) ) ( HOIST-AT ?auto_19965 ?auto_19966 ) ( AVAILABLE ?auto_19965 ) ( SURFACE-AT ?auto_19957 ?auto_19966 ) ( ON ?auto_19957 ?auto_19967 ) ( CLEAR ?auto_19957 ) ( TRUCK-AT ?auto_19964 ?auto_19961 ) ( not ( = ?auto_19956 ?auto_19957 ) ) ( not ( = ?auto_19956 ?auto_19967 ) ) ( not ( = ?auto_19957 ?auto_19967 ) ) ( not ( = ?auto_19960 ?auto_19965 ) ) ( not ( = ?auto_19956 ?auto_19958 ) ) ( not ( = ?auto_19956 ?auto_19962 ) ) ( not ( = ?auto_19958 ?auto_19967 ) ) ( not ( = ?auto_19959 ?auto_19966 ) ) ( not ( = ?auto_19963 ?auto_19965 ) ) ( not ( = ?auto_19962 ?auto_19967 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_19956 ?auto_19957 )
      ( MAKE-1CRATE ?auto_19957 ?auto_19958 )
      ( MAKE-2CRATE-VERIFY ?auto_19956 ?auto_19957 ?auto_19958 ) )
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
      ?auto_19990 - HOIST
      ?auto_19988 - PLACE
      ?auto_19987 - PLACE
      ?auto_19989 - HOIST
      ?auto_19991 - SURFACE
      ?auto_19992 - PLACE
      ?auto_19993 - HOIST
      ?auto_19996 - SURFACE
      ?auto_19994 - PLACE
      ?auto_19995 - HOIST
      ?auto_19997 - SURFACE
      ?auto_19986 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_19990 ?auto_19988 ) ( IS-CRATE ?auto_19985 ) ( not ( = ?auto_19987 ?auto_19988 ) ) ( HOIST-AT ?auto_19989 ?auto_19987 ) ( AVAILABLE ?auto_19989 ) ( SURFACE-AT ?auto_19985 ?auto_19987 ) ( ON ?auto_19985 ?auto_19991 ) ( CLEAR ?auto_19985 ) ( not ( = ?auto_19984 ?auto_19985 ) ) ( not ( = ?auto_19984 ?auto_19991 ) ) ( not ( = ?auto_19985 ?auto_19991 ) ) ( not ( = ?auto_19990 ?auto_19989 ) ) ( IS-CRATE ?auto_19984 ) ( not ( = ?auto_19992 ?auto_19988 ) ) ( HOIST-AT ?auto_19993 ?auto_19992 ) ( AVAILABLE ?auto_19993 ) ( SURFACE-AT ?auto_19984 ?auto_19992 ) ( ON ?auto_19984 ?auto_19996 ) ( CLEAR ?auto_19984 ) ( not ( = ?auto_19983 ?auto_19984 ) ) ( not ( = ?auto_19983 ?auto_19996 ) ) ( not ( = ?auto_19984 ?auto_19996 ) ) ( not ( = ?auto_19990 ?auto_19993 ) ) ( SURFACE-AT ?auto_19982 ?auto_19988 ) ( CLEAR ?auto_19982 ) ( IS-CRATE ?auto_19983 ) ( AVAILABLE ?auto_19990 ) ( not ( = ?auto_19994 ?auto_19988 ) ) ( HOIST-AT ?auto_19995 ?auto_19994 ) ( AVAILABLE ?auto_19995 ) ( SURFACE-AT ?auto_19983 ?auto_19994 ) ( ON ?auto_19983 ?auto_19997 ) ( CLEAR ?auto_19983 ) ( TRUCK-AT ?auto_19986 ?auto_19988 ) ( not ( = ?auto_19982 ?auto_19983 ) ) ( not ( = ?auto_19982 ?auto_19997 ) ) ( not ( = ?auto_19983 ?auto_19997 ) ) ( not ( = ?auto_19990 ?auto_19995 ) ) ( not ( = ?auto_19982 ?auto_19984 ) ) ( not ( = ?auto_19982 ?auto_19996 ) ) ( not ( = ?auto_19984 ?auto_19997 ) ) ( not ( = ?auto_19992 ?auto_19994 ) ) ( not ( = ?auto_19993 ?auto_19995 ) ) ( not ( = ?auto_19996 ?auto_19997 ) ) ( not ( = ?auto_19982 ?auto_19985 ) ) ( not ( = ?auto_19982 ?auto_19991 ) ) ( not ( = ?auto_19983 ?auto_19985 ) ) ( not ( = ?auto_19983 ?auto_19991 ) ) ( not ( = ?auto_19985 ?auto_19996 ) ) ( not ( = ?auto_19985 ?auto_19997 ) ) ( not ( = ?auto_19987 ?auto_19992 ) ) ( not ( = ?auto_19987 ?auto_19994 ) ) ( not ( = ?auto_19989 ?auto_19993 ) ) ( not ( = ?auto_19989 ?auto_19995 ) ) ( not ( = ?auto_19991 ?auto_19996 ) ) ( not ( = ?auto_19991 ?auto_19997 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_19982 ?auto_19983 ?auto_19984 )
      ( MAKE-1CRATE ?auto_19984 ?auto_19985 )
      ( MAKE-3CRATE-VERIFY ?auto_19982 ?auto_19983 ?auto_19984 ?auto_19985 ) )
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
      ?auto_20018 - HOIST
      ?auto_20022 - PLACE
      ?auto_20023 - PLACE
      ?auto_20019 - HOIST
      ?auto_20021 - SURFACE
      ?auto_20028 - PLACE
      ?auto_20029 - HOIST
      ?auto_20031 - SURFACE
      ?auto_20026 - PLACE
      ?auto_20027 - HOIST
      ?auto_20024 - SURFACE
      ?auto_20030 - PLACE
      ?auto_20025 - HOIST
      ?auto_20032 - SURFACE
      ?auto_20020 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20018 ?auto_20022 ) ( IS-CRATE ?auto_20017 ) ( not ( = ?auto_20023 ?auto_20022 ) ) ( HOIST-AT ?auto_20019 ?auto_20023 ) ( AVAILABLE ?auto_20019 ) ( SURFACE-AT ?auto_20017 ?auto_20023 ) ( ON ?auto_20017 ?auto_20021 ) ( CLEAR ?auto_20017 ) ( not ( = ?auto_20016 ?auto_20017 ) ) ( not ( = ?auto_20016 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20021 ) ) ( not ( = ?auto_20018 ?auto_20019 ) ) ( IS-CRATE ?auto_20016 ) ( not ( = ?auto_20028 ?auto_20022 ) ) ( HOIST-AT ?auto_20029 ?auto_20028 ) ( AVAILABLE ?auto_20029 ) ( SURFACE-AT ?auto_20016 ?auto_20028 ) ( ON ?auto_20016 ?auto_20031 ) ( CLEAR ?auto_20016 ) ( not ( = ?auto_20015 ?auto_20016 ) ) ( not ( = ?auto_20015 ?auto_20031 ) ) ( not ( = ?auto_20016 ?auto_20031 ) ) ( not ( = ?auto_20018 ?auto_20029 ) ) ( IS-CRATE ?auto_20015 ) ( not ( = ?auto_20026 ?auto_20022 ) ) ( HOIST-AT ?auto_20027 ?auto_20026 ) ( AVAILABLE ?auto_20027 ) ( SURFACE-AT ?auto_20015 ?auto_20026 ) ( ON ?auto_20015 ?auto_20024 ) ( CLEAR ?auto_20015 ) ( not ( = ?auto_20014 ?auto_20015 ) ) ( not ( = ?auto_20014 ?auto_20024 ) ) ( not ( = ?auto_20015 ?auto_20024 ) ) ( not ( = ?auto_20018 ?auto_20027 ) ) ( SURFACE-AT ?auto_20013 ?auto_20022 ) ( CLEAR ?auto_20013 ) ( IS-CRATE ?auto_20014 ) ( AVAILABLE ?auto_20018 ) ( not ( = ?auto_20030 ?auto_20022 ) ) ( HOIST-AT ?auto_20025 ?auto_20030 ) ( AVAILABLE ?auto_20025 ) ( SURFACE-AT ?auto_20014 ?auto_20030 ) ( ON ?auto_20014 ?auto_20032 ) ( CLEAR ?auto_20014 ) ( TRUCK-AT ?auto_20020 ?auto_20022 ) ( not ( = ?auto_20013 ?auto_20014 ) ) ( not ( = ?auto_20013 ?auto_20032 ) ) ( not ( = ?auto_20014 ?auto_20032 ) ) ( not ( = ?auto_20018 ?auto_20025 ) ) ( not ( = ?auto_20013 ?auto_20015 ) ) ( not ( = ?auto_20013 ?auto_20024 ) ) ( not ( = ?auto_20015 ?auto_20032 ) ) ( not ( = ?auto_20026 ?auto_20030 ) ) ( not ( = ?auto_20027 ?auto_20025 ) ) ( not ( = ?auto_20024 ?auto_20032 ) ) ( not ( = ?auto_20013 ?auto_20016 ) ) ( not ( = ?auto_20013 ?auto_20031 ) ) ( not ( = ?auto_20014 ?auto_20016 ) ) ( not ( = ?auto_20014 ?auto_20031 ) ) ( not ( = ?auto_20016 ?auto_20024 ) ) ( not ( = ?auto_20016 ?auto_20032 ) ) ( not ( = ?auto_20028 ?auto_20026 ) ) ( not ( = ?auto_20028 ?auto_20030 ) ) ( not ( = ?auto_20029 ?auto_20027 ) ) ( not ( = ?auto_20029 ?auto_20025 ) ) ( not ( = ?auto_20031 ?auto_20024 ) ) ( not ( = ?auto_20031 ?auto_20032 ) ) ( not ( = ?auto_20013 ?auto_20017 ) ) ( not ( = ?auto_20013 ?auto_20021 ) ) ( not ( = ?auto_20014 ?auto_20017 ) ) ( not ( = ?auto_20014 ?auto_20021 ) ) ( not ( = ?auto_20015 ?auto_20017 ) ) ( not ( = ?auto_20015 ?auto_20021 ) ) ( not ( = ?auto_20017 ?auto_20031 ) ) ( not ( = ?auto_20017 ?auto_20024 ) ) ( not ( = ?auto_20017 ?auto_20032 ) ) ( not ( = ?auto_20023 ?auto_20028 ) ) ( not ( = ?auto_20023 ?auto_20026 ) ) ( not ( = ?auto_20023 ?auto_20030 ) ) ( not ( = ?auto_20019 ?auto_20029 ) ) ( not ( = ?auto_20019 ?auto_20027 ) ) ( not ( = ?auto_20019 ?auto_20025 ) ) ( not ( = ?auto_20021 ?auto_20031 ) ) ( not ( = ?auto_20021 ?auto_20024 ) ) ( not ( = ?auto_20021 ?auto_20032 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 )
      ( MAKE-1CRATE ?auto_20016 ?auto_20017 )
      ( MAKE-4CRATE-VERIFY ?auto_20013 ?auto_20014 ?auto_20015 ?auto_20016 ?auto_20017 ) )
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
      ?auto_20056 - HOIST
      ?auto_20057 - PLACE
      ?auto_20058 - PLACE
      ?auto_20059 - HOIST
      ?auto_20060 - SURFACE
      ?auto_20068 - PLACE
      ?auto_20061 - HOIST
      ?auto_20064 - SURFACE
      ?auto_20062 - PLACE
      ?auto_20063 - HOIST
      ?auto_20065 - SURFACE
      ?auto_20067 - PLACE
      ?auto_20072 - HOIST
      ?auto_20066 - SURFACE
      ?auto_20069 - PLACE
      ?auto_20071 - HOIST
      ?auto_20070 - SURFACE
      ?auto_20055 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20056 ?auto_20057 ) ( IS-CRATE ?auto_20054 ) ( not ( = ?auto_20058 ?auto_20057 ) ) ( HOIST-AT ?auto_20059 ?auto_20058 ) ( AVAILABLE ?auto_20059 ) ( SURFACE-AT ?auto_20054 ?auto_20058 ) ( ON ?auto_20054 ?auto_20060 ) ( CLEAR ?auto_20054 ) ( not ( = ?auto_20053 ?auto_20054 ) ) ( not ( = ?auto_20053 ?auto_20060 ) ) ( not ( = ?auto_20054 ?auto_20060 ) ) ( not ( = ?auto_20056 ?auto_20059 ) ) ( IS-CRATE ?auto_20053 ) ( not ( = ?auto_20068 ?auto_20057 ) ) ( HOIST-AT ?auto_20061 ?auto_20068 ) ( AVAILABLE ?auto_20061 ) ( SURFACE-AT ?auto_20053 ?auto_20068 ) ( ON ?auto_20053 ?auto_20064 ) ( CLEAR ?auto_20053 ) ( not ( = ?auto_20052 ?auto_20053 ) ) ( not ( = ?auto_20052 ?auto_20064 ) ) ( not ( = ?auto_20053 ?auto_20064 ) ) ( not ( = ?auto_20056 ?auto_20061 ) ) ( IS-CRATE ?auto_20052 ) ( not ( = ?auto_20062 ?auto_20057 ) ) ( HOIST-AT ?auto_20063 ?auto_20062 ) ( AVAILABLE ?auto_20063 ) ( SURFACE-AT ?auto_20052 ?auto_20062 ) ( ON ?auto_20052 ?auto_20065 ) ( CLEAR ?auto_20052 ) ( not ( = ?auto_20051 ?auto_20052 ) ) ( not ( = ?auto_20051 ?auto_20065 ) ) ( not ( = ?auto_20052 ?auto_20065 ) ) ( not ( = ?auto_20056 ?auto_20063 ) ) ( IS-CRATE ?auto_20051 ) ( not ( = ?auto_20067 ?auto_20057 ) ) ( HOIST-AT ?auto_20072 ?auto_20067 ) ( AVAILABLE ?auto_20072 ) ( SURFACE-AT ?auto_20051 ?auto_20067 ) ( ON ?auto_20051 ?auto_20066 ) ( CLEAR ?auto_20051 ) ( not ( = ?auto_20050 ?auto_20051 ) ) ( not ( = ?auto_20050 ?auto_20066 ) ) ( not ( = ?auto_20051 ?auto_20066 ) ) ( not ( = ?auto_20056 ?auto_20072 ) ) ( SURFACE-AT ?auto_20049 ?auto_20057 ) ( CLEAR ?auto_20049 ) ( IS-CRATE ?auto_20050 ) ( AVAILABLE ?auto_20056 ) ( not ( = ?auto_20069 ?auto_20057 ) ) ( HOIST-AT ?auto_20071 ?auto_20069 ) ( AVAILABLE ?auto_20071 ) ( SURFACE-AT ?auto_20050 ?auto_20069 ) ( ON ?auto_20050 ?auto_20070 ) ( CLEAR ?auto_20050 ) ( TRUCK-AT ?auto_20055 ?auto_20057 ) ( not ( = ?auto_20049 ?auto_20050 ) ) ( not ( = ?auto_20049 ?auto_20070 ) ) ( not ( = ?auto_20050 ?auto_20070 ) ) ( not ( = ?auto_20056 ?auto_20071 ) ) ( not ( = ?auto_20049 ?auto_20051 ) ) ( not ( = ?auto_20049 ?auto_20066 ) ) ( not ( = ?auto_20051 ?auto_20070 ) ) ( not ( = ?auto_20067 ?auto_20069 ) ) ( not ( = ?auto_20072 ?auto_20071 ) ) ( not ( = ?auto_20066 ?auto_20070 ) ) ( not ( = ?auto_20049 ?auto_20052 ) ) ( not ( = ?auto_20049 ?auto_20065 ) ) ( not ( = ?auto_20050 ?auto_20052 ) ) ( not ( = ?auto_20050 ?auto_20065 ) ) ( not ( = ?auto_20052 ?auto_20066 ) ) ( not ( = ?auto_20052 ?auto_20070 ) ) ( not ( = ?auto_20062 ?auto_20067 ) ) ( not ( = ?auto_20062 ?auto_20069 ) ) ( not ( = ?auto_20063 ?auto_20072 ) ) ( not ( = ?auto_20063 ?auto_20071 ) ) ( not ( = ?auto_20065 ?auto_20066 ) ) ( not ( = ?auto_20065 ?auto_20070 ) ) ( not ( = ?auto_20049 ?auto_20053 ) ) ( not ( = ?auto_20049 ?auto_20064 ) ) ( not ( = ?auto_20050 ?auto_20053 ) ) ( not ( = ?auto_20050 ?auto_20064 ) ) ( not ( = ?auto_20051 ?auto_20053 ) ) ( not ( = ?auto_20051 ?auto_20064 ) ) ( not ( = ?auto_20053 ?auto_20065 ) ) ( not ( = ?auto_20053 ?auto_20066 ) ) ( not ( = ?auto_20053 ?auto_20070 ) ) ( not ( = ?auto_20068 ?auto_20062 ) ) ( not ( = ?auto_20068 ?auto_20067 ) ) ( not ( = ?auto_20068 ?auto_20069 ) ) ( not ( = ?auto_20061 ?auto_20063 ) ) ( not ( = ?auto_20061 ?auto_20072 ) ) ( not ( = ?auto_20061 ?auto_20071 ) ) ( not ( = ?auto_20064 ?auto_20065 ) ) ( not ( = ?auto_20064 ?auto_20066 ) ) ( not ( = ?auto_20064 ?auto_20070 ) ) ( not ( = ?auto_20049 ?auto_20054 ) ) ( not ( = ?auto_20049 ?auto_20060 ) ) ( not ( = ?auto_20050 ?auto_20054 ) ) ( not ( = ?auto_20050 ?auto_20060 ) ) ( not ( = ?auto_20051 ?auto_20054 ) ) ( not ( = ?auto_20051 ?auto_20060 ) ) ( not ( = ?auto_20052 ?auto_20054 ) ) ( not ( = ?auto_20052 ?auto_20060 ) ) ( not ( = ?auto_20054 ?auto_20064 ) ) ( not ( = ?auto_20054 ?auto_20065 ) ) ( not ( = ?auto_20054 ?auto_20066 ) ) ( not ( = ?auto_20054 ?auto_20070 ) ) ( not ( = ?auto_20058 ?auto_20068 ) ) ( not ( = ?auto_20058 ?auto_20062 ) ) ( not ( = ?auto_20058 ?auto_20067 ) ) ( not ( = ?auto_20058 ?auto_20069 ) ) ( not ( = ?auto_20059 ?auto_20061 ) ) ( not ( = ?auto_20059 ?auto_20063 ) ) ( not ( = ?auto_20059 ?auto_20072 ) ) ( not ( = ?auto_20059 ?auto_20071 ) ) ( not ( = ?auto_20060 ?auto_20064 ) ) ( not ( = ?auto_20060 ?auto_20065 ) ) ( not ( = ?auto_20060 ?auto_20066 ) ) ( not ( = ?auto_20060 ?auto_20070 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_20049 ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20053 )
      ( MAKE-1CRATE ?auto_20053 ?auto_20054 )
      ( MAKE-5CRATE-VERIFY ?auto_20049 ?auto_20050 ?auto_20051 ?auto_20052 ?auto_20053 ?auto_20054 ) )
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
      ?auto_20100 - HOIST
      ?auto_20099 - PLACE
      ?auto_20098 - PLACE
      ?auto_20097 - HOIST
      ?auto_20101 - SURFACE
      ?auto_20108 - SURFACE
      ?auto_20107 - PLACE
      ?auto_20114 - HOIST
      ?auto_20110 - SURFACE
      ?auto_20113 - PLACE
      ?auto_20103 - HOIST
      ?auto_20111 - SURFACE
      ?auto_20112 - PLACE
      ?auto_20109 - HOIST
      ?auto_20106 - SURFACE
      ?auto_20104 - PLACE
      ?auto_20115 - HOIST
      ?auto_20105 - SURFACE
      ?auto_20102 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20100 ?auto_20099 ) ( IS-CRATE ?auto_20096 ) ( not ( = ?auto_20098 ?auto_20099 ) ) ( HOIST-AT ?auto_20097 ?auto_20098 ) ( SURFACE-AT ?auto_20096 ?auto_20098 ) ( ON ?auto_20096 ?auto_20101 ) ( CLEAR ?auto_20096 ) ( not ( = ?auto_20095 ?auto_20096 ) ) ( not ( = ?auto_20095 ?auto_20101 ) ) ( not ( = ?auto_20096 ?auto_20101 ) ) ( not ( = ?auto_20100 ?auto_20097 ) ) ( IS-CRATE ?auto_20095 ) ( AVAILABLE ?auto_20097 ) ( SURFACE-AT ?auto_20095 ?auto_20098 ) ( ON ?auto_20095 ?auto_20108 ) ( CLEAR ?auto_20095 ) ( not ( = ?auto_20094 ?auto_20095 ) ) ( not ( = ?auto_20094 ?auto_20108 ) ) ( not ( = ?auto_20095 ?auto_20108 ) ) ( IS-CRATE ?auto_20094 ) ( not ( = ?auto_20107 ?auto_20099 ) ) ( HOIST-AT ?auto_20114 ?auto_20107 ) ( AVAILABLE ?auto_20114 ) ( SURFACE-AT ?auto_20094 ?auto_20107 ) ( ON ?auto_20094 ?auto_20110 ) ( CLEAR ?auto_20094 ) ( not ( = ?auto_20093 ?auto_20094 ) ) ( not ( = ?auto_20093 ?auto_20110 ) ) ( not ( = ?auto_20094 ?auto_20110 ) ) ( not ( = ?auto_20100 ?auto_20114 ) ) ( IS-CRATE ?auto_20093 ) ( not ( = ?auto_20113 ?auto_20099 ) ) ( HOIST-AT ?auto_20103 ?auto_20113 ) ( AVAILABLE ?auto_20103 ) ( SURFACE-AT ?auto_20093 ?auto_20113 ) ( ON ?auto_20093 ?auto_20111 ) ( CLEAR ?auto_20093 ) ( not ( = ?auto_20092 ?auto_20093 ) ) ( not ( = ?auto_20092 ?auto_20111 ) ) ( not ( = ?auto_20093 ?auto_20111 ) ) ( not ( = ?auto_20100 ?auto_20103 ) ) ( IS-CRATE ?auto_20092 ) ( not ( = ?auto_20112 ?auto_20099 ) ) ( HOIST-AT ?auto_20109 ?auto_20112 ) ( AVAILABLE ?auto_20109 ) ( SURFACE-AT ?auto_20092 ?auto_20112 ) ( ON ?auto_20092 ?auto_20106 ) ( CLEAR ?auto_20092 ) ( not ( = ?auto_20091 ?auto_20092 ) ) ( not ( = ?auto_20091 ?auto_20106 ) ) ( not ( = ?auto_20092 ?auto_20106 ) ) ( not ( = ?auto_20100 ?auto_20109 ) ) ( SURFACE-AT ?auto_20090 ?auto_20099 ) ( CLEAR ?auto_20090 ) ( IS-CRATE ?auto_20091 ) ( AVAILABLE ?auto_20100 ) ( not ( = ?auto_20104 ?auto_20099 ) ) ( HOIST-AT ?auto_20115 ?auto_20104 ) ( AVAILABLE ?auto_20115 ) ( SURFACE-AT ?auto_20091 ?auto_20104 ) ( ON ?auto_20091 ?auto_20105 ) ( CLEAR ?auto_20091 ) ( TRUCK-AT ?auto_20102 ?auto_20099 ) ( not ( = ?auto_20090 ?auto_20091 ) ) ( not ( = ?auto_20090 ?auto_20105 ) ) ( not ( = ?auto_20091 ?auto_20105 ) ) ( not ( = ?auto_20100 ?auto_20115 ) ) ( not ( = ?auto_20090 ?auto_20092 ) ) ( not ( = ?auto_20090 ?auto_20106 ) ) ( not ( = ?auto_20092 ?auto_20105 ) ) ( not ( = ?auto_20112 ?auto_20104 ) ) ( not ( = ?auto_20109 ?auto_20115 ) ) ( not ( = ?auto_20106 ?auto_20105 ) ) ( not ( = ?auto_20090 ?auto_20093 ) ) ( not ( = ?auto_20090 ?auto_20111 ) ) ( not ( = ?auto_20091 ?auto_20093 ) ) ( not ( = ?auto_20091 ?auto_20111 ) ) ( not ( = ?auto_20093 ?auto_20106 ) ) ( not ( = ?auto_20093 ?auto_20105 ) ) ( not ( = ?auto_20113 ?auto_20112 ) ) ( not ( = ?auto_20113 ?auto_20104 ) ) ( not ( = ?auto_20103 ?auto_20109 ) ) ( not ( = ?auto_20103 ?auto_20115 ) ) ( not ( = ?auto_20111 ?auto_20106 ) ) ( not ( = ?auto_20111 ?auto_20105 ) ) ( not ( = ?auto_20090 ?auto_20094 ) ) ( not ( = ?auto_20090 ?auto_20110 ) ) ( not ( = ?auto_20091 ?auto_20094 ) ) ( not ( = ?auto_20091 ?auto_20110 ) ) ( not ( = ?auto_20092 ?auto_20094 ) ) ( not ( = ?auto_20092 ?auto_20110 ) ) ( not ( = ?auto_20094 ?auto_20111 ) ) ( not ( = ?auto_20094 ?auto_20106 ) ) ( not ( = ?auto_20094 ?auto_20105 ) ) ( not ( = ?auto_20107 ?auto_20113 ) ) ( not ( = ?auto_20107 ?auto_20112 ) ) ( not ( = ?auto_20107 ?auto_20104 ) ) ( not ( = ?auto_20114 ?auto_20103 ) ) ( not ( = ?auto_20114 ?auto_20109 ) ) ( not ( = ?auto_20114 ?auto_20115 ) ) ( not ( = ?auto_20110 ?auto_20111 ) ) ( not ( = ?auto_20110 ?auto_20106 ) ) ( not ( = ?auto_20110 ?auto_20105 ) ) ( not ( = ?auto_20090 ?auto_20095 ) ) ( not ( = ?auto_20090 ?auto_20108 ) ) ( not ( = ?auto_20091 ?auto_20095 ) ) ( not ( = ?auto_20091 ?auto_20108 ) ) ( not ( = ?auto_20092 ?auto_20095 ) ) ( not ( = ?auto_20092 ?auto_20108 ) ) ( not ( = ?auto_20093 ?auto_20095 ) ) ( not ( = ?auto_20093 ?auto_20108 ) ) ( not ( = ?auto_20095 ?auto_20110 ) ) ( not ( = ?auto_20095 ?auto_20111 ) ) ( not ( = ?auto_20095 ?auto_20106 ) ) ( not ( = ?auto_20095 ?auto_20105 ) ) ( not ( = ?auto_20098 ?auto_20107 ) ) ( not ( = ?auto_20098 ?auto_20113 ) ) ( not ( = ?auto_20098 ?auto_20112 ) ) ( not ( = ?auto_20098 ?auto_20104 ) ) ( not ( = ?auto_20097 ?auto_20114 ) ) ( not ( = ?auto_20097 ?auto_20103 ) ) ( not ( = ?auto_20097 ?auto_20109 ) ) ( not ( = ?auto_20097 ?auto_20115 ) ) ( not ( = ?auto_20108 ?auto_20110 ) ) ( not ( = ?auto_20108 ?auto_20111 ) ) ( not ( = ?auto_20108 ?auto_20106 ) ) ( not ( = ?auto_20108 ?auto_20105 ) ) ( not ( = ?auto_20090 ?auto_20096 ) ) ( not ( = ?auto_20090 ?auto_20101 ) ) ( not ( = ?auto_20091 ?auto_20096 ) ) ( not ( = ?auto_20091 ?auto_20101 ) ) ( not ( = ?auto_20092 ?auto_20096 ) ) ( not ( = ?auto_20092 ?auto_20101 ) ) ( not ( = ?auto_20093 ?auto_20096 ) ) ( not ( = ?auto_20093 ?auto_20101 ) ) ( not ( = ?auto_20094 ?auto_20096 ) ) ( not ( = ?auto_20094 ?auto_20101 ) ) ( not ( = ?auto_20096 ?auto_20108 ) ) ( not ( = ?auto_20096 ?auto_20110 ) ) ( not ( = ?auto_20096 ?auto_20111 ) ) ( not ( = ?auto_20096 ?auto_20106 ) ) ( not ( = ?auto_20096 ?auto_20105 ) ) ( not ( = ?auto_20101 ?auto_20108 ) ) ( not ( = ?auto_20101 ?auto_20110 ) ) ( not ( = ?auto_20101 ?auto_20111 ) ) ( not ( = ?auto_20101 ?auto_20106 ) ) ( not ( = ?auto_20101 ?auto_20105 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_20090 ?auto_20091 ?auto_20092 ?auto_20093 ?auto_20094 ?auto_20095 )
      ( MAKE-1CRATE ?auto_20095 ?auto_20096 )
      ( MAKE-6CRATE-VERIFY ?auto_20090 ?auto_20091 ?auto_20092 ?auto_20093 ?auto_20094 ?auto_20095 ?auto_20096 ) )
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
      ?auto_20142 - HOIST
      ?auto_20144 - PLACE
      ?auto_20146 - PLACE
      ?auto_20145 - HOIST
      ?auto_20147 - SURFACE
      ?auto_20159 - PLACE
      ?auto_20158 - HOIST
      ?auto_20148 - SURFACE
      ?auto_20160 - SURFACE
      ?auto_20156 - PLACE
      ?auto_20153 - HOIST
      ?auto_20152 - SURFACE
      ?auto_20155 - PLACE
      ?auto_20161 - HOIST
      ?auto_20154 - SURFACE
      ?auto_20151 - SURFACE
      ?auto_20149 - PLACE
      ?auto_20157 - HOIST
      ?auto_20150 - SURFACE
      ?auto_20143 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20142 ?auto_20144 ) ( IS-CRATE ?auto_20141 ) ( not ( = ?auto_20146 ?auto_20144 ) ) ( HOIST-AT ?auto_20145 ?auto_20146 ) ( SURFACE-AT ?auto_20141 ?auto_20146 ) ( ON ?auto_20141 ?auto_20147 ) ( CLEAR ?auto_20141 ) ( not ( = ?auto_20140 ?auto_20141 ) ) ( not ( = ?auto_20140 ?auto_20147 ) ) ( not ( = ?auto_20141 ?auto_20147 ) ) ( not ( = ?auto_20142 ?auto_20145 ) ) ( IS-CRATE ?auto_20140 ) ( not ( = ?auto_20159 ?auto_20144 ) ) ( HOIST-AT ?auto_20158 ?auto_20159 ) ( SURFACE-AT ?auto_20140 ?auto_20159 ) ( ON ?auto_20140 ?auto_20148 ) ( CLEAR ?auto_20140 ) ( not ( = ?auto_20139 ?auto_20140 ) ) ( not ( = ?auto_20139 ?auto_20148 ) ) ( not ( = ?auto_20140 ?auto_20148 ) ) ( not ( = ?auto_20142 ?auto_20158 ) ) ( IS-CRATE ?auto_20139 ) ( AVAILABLE ?auto_20158 ) ( SURFACE-AT ?auto_20139 ?auto_20159 ) ( ON ?auto_20139 ?auto_20160 ) ( CLEAR ?auto_20139 ) ( not ( = ?auto_20138 ?auto_20139 ) ) ( not ( = ?auto_20138 ?auto_20160 ) ) ( not ( = ?auto_20139 ?auto_20160 ) ) ( IS-CRATE ?auto_20138 ) ( not ( = ?auto_20156 ?auto_20144 ) ) ( HOIST-AT ?auto_20153 ?auto_20156 ) ( AVAILABLE ?auto_20153 ) ( SURFACE-AT ?auto_20138 ?auto_20156 ) ( ON ?auto_20138 ?auto_20152 ) ( CLEAR ?auto_20138 ) ( not ( = ?auto_20137 ?auto_20138 ) ) ( not ( = ?auto_20137 ?auto_20152 ) ) ( not ( = ?auto_20138 ?auto_20152 ) ) ( not ( = ?auto_20142 ?auto_20153 ) ) ( IS-CRATE ?auto_20137 ) ( not ( = ?auto_20155 ?auto_20144 ) ) ( HOIST-AT ?auto_20161 ?auto_20155 ) ( AVAILABLE ?auto_20161 ) ( SURFACE-AT ?auto_20137 ?auto_20155 ) ( ON ?auto_20137 ?auto_20154 ) ( CLEAR ?auto_20137 ) ( not ( = ?auto_20136 ?auto_20137 ) ) ( not ( = ?auto_20136 ?auto_20154 ) ) ( not ( = ?auto_20137 ?auto_20154 ) ) ( not ( = ?auto_20142 ?auto_20161 ) ) ( IS-CRATE ?auto_20136 ) ( AVAILABLE ?auto_20145 ) ( SURFACE-AT ?auto_20136 ?auto_20146 ) ( ON ?auto_20136 ?auto_20151 ) ( CLEAR ?auto_20136 ) ( not ( = ?auto_20135 ?auto_20136 ) ) ( not ( = ?auto_20135 ?auto_20151 ) ) ( not ( = ?auto_20136 ?auto_20151 ) ) ( SURFACE-AT ?auto_20134 ?auto_20144 ) ( CLEAR ?auto_20134 ) ( IS-CRATE ?auto_20135 ) ( AVAILABLE ?auto_20142 ) ( not ( = ?auto_20149 ?auto_20144 ) ) ( HOIST-AT ?auto_20157 ?auto_20149 ) ( AVAILABLE ?auto_20157 ) ( SURFACE-AT ?auto_20135 ?auto_20149 ) ( ON ?auto_20135 ?auto_20150 ) ( CLEAR ?auto_20135 ) ( TRUCK-AT ?auto_20143 ?auto_20144 ) ( not ( = ?auto_20134 ?auto_20135 ) ) ( not ( = ?auto_20134 ?auto_20150 ) ) ( not ( = ?auto_20135 ?auto_20150 ) ) ( not ( = ?auto_20142 ?auto_20157 ) ) ( not ( = ?auto_20134 ?auto_20136 ) ) ( not ( = ?auto_20134 ?auto_20151 ) ) ( not ( = ?auto_20136 ?auto_20150 ) ) ( not ( = ?auto_20146 ?auto_20149 ) ) ( not ( = ?auto_20145 ?auto_20157 ) ) ( not ( = ?auto_20151 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20137 ) ) ( not ( = ?auto_20134 ?auto_20154 ) ) ( not ( = ?auto_20135 ?auto_20137 ) ) ( not ( = ?auto_20135 ?auto_20154 ) ) ( not ( = ?auto_20137 ?auto_20151 ) ) ( not ( = ?auto_20137 ?auto_20150 ) ) ( not ( = ?auto_20155 ?auto_20146 ) ) ( not ( = ?auto_20155 ?auto_20149 ) ) ( not ( = ?auto_20161 ?auto_20145 ) ) ( not ( = ?auto_20161 ?auto_20157 ) ) ( not ( = ?auto_20154 ?auto_20151 ) ) ( not ( = ?auto_20154 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20138 ) ) ( not ( = ?auto_20134 ?auto_20152 ) ) ( not ( = ?auto_20135 ?auto_20138 ) ) ( not ( = ?auto_20135 ?auto_20152 ) ) ( not ( = ?auto_20136 ?auto_20138 ) ) ( not ( = ?auto_20136 ?auto_20152 ) ) ( not ( = ?auto_20138 ?auto_20154 ) ) ( not ( = ?auto_20138 ?auto_20151 ) ) ( not ( = ?auto_20138 ?auto_20150 ) ) ( not ( = ?auto_20156 ?auto_20155 ) ) ( not ( = ?auto_20156 ?auto_20146 ) ) ( not ( = ?auto_20156 ?auto_20149 ) ) ( not ( = ?auto_20153 ?auto_20161 ) ) ( not ( = ?auto_20153 ?auto_20145 ) ) ( not ( = ?auto_20153 ?auto_20157 ) ) ( not ( = ?auto_20152 ?auto_20154 ) ) ( not ( = ?auto_20152 ?auto_20151 ) ) ( not ( = ?auto_20152 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20139 ) ) ( not ( = ?auto_20134 ?auto_20160 ) ) ( not ( = ?auto_20135 ?auto_20139 ) ) ( not ( = ?auto_20135 ?auto_20160 ) ) ( not ( = ?auto_20136 ?auto_20139 ) ) ( not ( = ?auto_20136 ?auto_20160 ) ) ( not ( = ?auto_20137 ?auto_20139 ) ) ( not ( = ?auto_20137 ?auto_20160 ) ) ( not ( = ?auto_20139 ?auto_20152 ) ) ( not ( = ?auto_20139 ?auto_20154 ) ) ( not ( = ?auto_20139 ?auto_20151 ) ) ( not ( = ?auto_20139 ?auto_20150 ) ) ( not ( = ?auto_20159 ?auto_20156 ) ) ( not ( = ?auto_20159 ?auto_20155 ) ) ( not ( = ?auto_20159 ?auto_20146 ) ) ( not ( = ?auto_20159 ?auto_20149 ) ) ( not ( = ?auto_20158 ?auto_20153 ) ) ( not ( = ?auto_20158 ?auto_20161 ) ) ( not ( = ?auto_20158 ?auto_20145 ) ) ( not ( = ?auto_20158 ?auto_20157 ) ) ( not ( = ?auto_20160 ?auto_20152 ) ) ( not ( = ?auto_20160 ?auto_20154 ) ) ( not ( = ?auto_20160 ?auto_20151 ) ) ( not ( = ?auto_20160 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20140 ) ) ( not ( = ?auto_20134 ?auto_20148 ) ) ( not ( = ?auto_20135 ?auto_20140 ) ) ( not ( = ?auto_20135 ?auto_20148 ) ) ( not ( = ?auto_20136 ?auto_20140 ) ) ( not ( = ?auto_20136 ?auto_20148 ) ) ( not ( = ?auto_20137 ?auto_20140 ) ) ( not ( = ?auto_20137 ?auto_20148 ) ) ( not ( = ?auto_20138 ?auto_20140 ) ) ( not ( = ?auto_20138 ?auto_20148 ) ) ( not ( = ?auto_20140 ?auto_20160 ) ) ( not ( = ?auto_20140 ?auto_20152 ) ) ( not ( = ?auto_20140 ?auto_20154 ) ) ( not ( = ?auto_20140 ?auto_20151 ) ) ( not ( = ?auto_20140 ?auto_20150 ) ) ( not ( = ?auto_20148 ?auto_20160 ) ) ( not ( = ?auto_20148 ?auto_20152 ) ) ( not ( = ?auto_20148 ?auto_20154 ) ) ( not ( = ?auto_20148 ?auto_20151 ) ) ( not ( = ?auto_20148 ?auto_20150 ) ) ( not ( = ?auto_20134 ?auto_20141 ) ) ( not ( = ?auto_20134 ?auto_20147 ) ) ( not ( = ?auto_20135 ?auto_20141 ) ) ( not ( = ?auto_20135 ?auto_20147 ) ) ( not ( = ?auto_20136 ?auto_20141 ) ) ( not ( = ?auto_20136 ?auto_20147 ) ) ( not ( = ?auto_20137 ?auto_20141 ) ) ( not ( = ?auto_20137 ?auto_20147 ) ) ( not ( = ?auto_20138 ?auto_20141 ) ) ( not ( = ?auto_20138 ?auto_20147 ) ) ( not ( = ?auto_20139 ?auto_20141 ) ) ( not ( = ?auto_20139 ?auto_20147 ) ) ( not ( = ?auto_20141 ?auto_20148 ) ) ( not ( = ?auto_20141 ?auto_20160 ) ) ( not ( = ?auto_20141 ?auto_20152 ) ) ( not ( = ?auto_20141 ?auto_20154 ) ) ( not ( = ?auto_20141 ?auto_20151 ) ) ( not ( = ?auto_20141 ?auto_20150 ) ) ( not ( = ?auto_20147 ?auto_20148 ) ) ( not ( = ?auto_20147 ?auto_20160 ) ) ( not ( = ?auto_20147 ?auto_20152 ) ) ( not ( = ?auto_20147 ?auto_20154 ) ) ( not ( = ?auto_20147 ?auto_20151 ) ) ( not ( = ?auto_20147 ?auto_20150 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_20134 ?auto_20135 ?auto_20136 ?auto_20137 ?auto_20138 ?auto_20139 ?auto_20140 )
      ( MAKE-1CRATE ?auto_20140 ?auto_20141 )
      ( MAKE-7CRATE-VERIFY ?auto_20134 ?auto_20135 ?auto_20136 ?auto_20137 ?auto_20138 ?auto_20139 ?auto_20140 ?auto_20141 ) )
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
      ?auto_20188 - SURFACE
      ?auto_20189 - SURFACE
    )
    :vars
    (
      ?auto_20192 - HOIST
      ?auto_20193 - PLACE
      ?auto_20191 - PLACE
      ?auto_20195 - HOIST
      ?auto_20194 - SURFACE
      ?auto_20204 - SURFACE
      ?auto_20200 - PLACE
      ?auto_20206 - HOIST
      ?auto_20209 - SURFACE
      ?auto_20197 - SURFACE
      ?auto_20210 - PLACE
      ?auto_20198 - HOIST
      ?auto_20196 - SURFACE
      ?auto_20199 - PLACE
      ?auto_20202 - HOIST
      ?auto_20201 - SURFACE
      ?auto_20208 - SURFACE
      ?auto_20207 - PLACE
      ?auto_20205 - HOIST
      ?auto_20203 - SURFACE
      ?auto_20190 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20192 ?auto_20193 ) ( IS-CRATE ?auto_20189 ) ( not ( = ?auto_20191 ?auto_20193 ) ) ( HOIST-AT ?auto_20195 ?auto_20191 ) ( SURFACE-AT ?auto_20189 ?auto_20191 ) ( ON ?auto_20189 ?auto_20194 ) ( CLEAR ?auto_20189 ) ( not ( = ?auto_20188 ?auto_20189 ) ) ( not ( = ?auto_20188 ?auto_20194 ) ) ( not ( = ?auto_20189 ?auto_20194 ) ) ( not ( = ?auto_20192 ?auto_20195 ) ) ( IS-CRATE ?auto_20188 ) ( SURFACE-AT ?auto_20188 ?auto_20191 ) ( ON ?auto_20188 ?auto_20204 ) ( CLEAR ?auto_20188 ) ( not ( = ?auto_20187 ?auto_20188 ) ) ( not ( = ?auto_20187 ?auto_20204 ) ) ( not ( = ?auto_20188 ?auto_20204 ) ) ( IS-CRATE ?auto_20187 ) ( not ( = ?auto_20200 ?auto_20193 ) ) ( HOIST-AT ?auto_20206 ?auto_20200 ) ( SURFACE-AT ?auto_20187 ?auto_20200 ) ( ON ?auto_20187 ?auto_20209 ) ( CLEAR ?auto_20187 ) ( not ( = ?auto_20186 ?auto_20187 ) ) ( not ( = ?auto_20186 ?auto_20209 ) ) ( not ( = ?auto_20187 ?auto_20209 ) ) ( not ( = ?auto_20192 ?auto_20206 ) ) ( IS-CRATE ?auto_20186 ) ( AVAILABLE ?auto_20206 ) ( SURFACE-AT ?auto_20186 ?auto_20200 ) ( ON ?auto_20186 ?auto_20197 ) ( CLEAR ?auto_20186 ) ( not ( = ?auto_20185 ?auto_20186 ) ) ( not ( = ?auto_20185 ?auto_20197 ) ) ( not ( = ?auto_20186 ?auto_20197 ) ) ( IS-CRATE ?auto_20185 ) ( not ( = ?auto_20210 ?auto_20193 ) ) ( HOIST-AT ?auto_20198 ?auto_20210 ) ( AVAILABLE ?auto_20198 ) ( SURFACE-AT ?auto_20185 ?auto_20210 ) ( ON ?auto_20185 ?auto_20196 ) ( CLEAR ?auto_20185 ) ( not ( = ?auto_20184 ?auto_20185 ) ) ( not ( = ?auto_20184 ?auto_20196 ) ) ( not ( = ?auto_20185 ?auto_20196 ) ) ( not ( = ?auto_20192 ?auto_20198 ) ) ( IS-CRATE ?auto_20184 ) ( not ( = ?auto_20199 ?auto_20193 ) ) ( HOIST-AT ?auto_20202 ?auto_20199 ) ( AVAILABLE ?auto_20202 ) ( SURFACE-AT ?auto_20184 ?auto_20199 ) ( ON ?auto_20184 ?auto_20201 ) ( CLEAR ?auto_20184 ) ( not ( = ?auto_20183 ?auto_20184 ) ) ( not ( = ?auto_20183 ?auto_20201 ) ) ( not ( = ?auto_20184 ?auto_20201 ) ) ( not ( = ?auto_20192 ?auto_20202 ) ) ( IS-CRATE ?auto_20183 ) ( AVAILABLE ?auto_20195 ) ( SURFACE-AT ?auto_20183 ?auto_20191 ) ( ON ?auto_20183 ?auto_20208 ) ( CLEAR ?auto_20183 ) ( not ( = ?auto_20182 ?auto_20183 ) ) ( not ( = ?auto_20182 ?auto_20208 ) ) ( not ( = ?auto_20183 ?auto_20208 ) ) ( SURFACE-AT ?auto_20181 ?auto_20193 ) ( CLEAR ?auto_20181 ) ( IS-CRATE ?auto_20182 ) ( AVAILABLE ?auto_20192 ) ( not ( = ?auto_20207 ?auto_20193 ) ) ( HOIST-AT ?auto_20205 ?auto_20207 ) ( AVAILABLE ?auto_20205 ) ( SURFACE-AT ?auto_20182 ?auto_20207 ) ( ON ?auto_20182 ?auto_20203 ) ( CLEAR ?auto_20182 ) ( TRUCK-AT ?auto_20190 ?auto_20193 ) ( not ( = ?auto_20181 ?auto_20182 ) ) ( not ( = ?auto_20181 ?auto_20203 ) ) ( not ( = ?auto_20182 ?auto_20203 ) ) ( not ( = ?auto_20192 ?auto_20205 ) ) ( not ( = ?auto_20181 ?auto_20183 ) ) ( not ( = ?auto_20181 ?auto_20208 ) ) ( not ( = ?auto_20183 ?auto_20203 ) ) ( not ( = ?auto_20191 ?auto_20207 ) ) ( not ( = ?auto_20195 ?auto_20205 ) ) ( not ( = ?auto_20208 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20184 ) ) ( not ( = ?auto_20181 ?auto_20201 ) ) ( not ( = ?auto_20182 ?auto_20184 ) ) ( not ( = ?auto_20182 ?auto_20201 ) ) ( not ( = ?auto_20184 ?auto_20208 ) ) ( not ( = ?auto_20184 ?auto_20203 ) ) ( not ( = ?auto_20199 ?auto_20191 ) ) ( not ( = ?auto_20199 ?auto_20207 ) ) ( not ( = ?auto_20202 ?auto_20195 ) ) ( not ( = ?auto_20202 ?auto_20205 ) ) ( not ( = ?auto_20201 ?auto_20208 ) ) ( not ( = ?auto_20201 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20185 ) ) ( not ( = ?auto_20181 ?auto_20196 ) ) ( not ( = ?auto_20182 ?auto_20185 ) ) ( not ( = ?auto_20182 ?auto_20196 ) ) ( not ( = ?auto_20183 ?auto_20185 ) ) ( not ( = ?auto_20183 ?auto_20196 ) ) ( not ( = ?auto_20185 ?auto_20201 ) ) ( not ( = ?auto_20185 ?auto_20208 ) ) ( not ( = ?auto_20185 ?auto_20203 ) ) ( not ( = ?auto_20210 ?auto_20199 ) ) ( not ( = ?auto_20210 ?auto_20191 ) ) ( not ( = ?auto_20210 ?auto_20207 ) ) ( not ( = ?auto_20198 ?auto_20202 ) ) ( not ( = ?auto_20198 ?auto_20195 ) ) ( not ( = ?auto_20198 ?auto_20205 ) ) ( not ( = ?auto_20196 ?auto_20201 ) ) ( not ( = ?auto_20196 ?auto_20208 ) ) ( not ( = ?auto_20196 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20186 ) ) ( not ( = ?auto_20181 ?auto_20197 ) ) ( not ( = ?auto_20182 ?auto_20186 ) ) ( not ( = ?auto_20182 ?auto_20197 ) ) ( not ( = ?auto_20183 ?auto_20186 ) ) ( not ( = ?auto_20183 ?auto_20197 ) ) ( not ( = ?auto_20184 ?auto_20186 ) ) ( not ( = ?auto_20184 ?auto_20197 ) ) ( not ( = ?auto_20186 ?auto_20196 ) ) ( not ( = ?auto_20186 ?auto_20201 ) ) ( not ( = ?auto_20186 ?auto_20208 ) ) ( not ( = ?auto_20186 ?auto_20203 ) ) ( not ( = ?auto_20200 ?auto_20210 ) ) ( not ( = ?auto_20200 ?auto_20199 ) ) ( not ( = ?auto_20200 ?auto_20191 ) ) ( not ( = ?auto_20200 ?auto_20207 ) ) ( not ( = ?auto_20206 ?auto_20198 ) ) ( not ( = ?auto_20206 ?auto_20202 ) ) ( not ( = ?auto_20206 ?auto_20195 ) ) ( not ( = ?auto_20206 ?auto_20205 ) ) ( not ( = ?auto_20197 ?auto_20196 ) ) ( not ( = ?auto_20197 ?auto_20201 ) ) ( not ( = ?auto_20197 ?auto_20208 ) ) ( not ( = ?auto_20197 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20187 ) ) ( not ( = ?auto_20181 ?auto_20209 ) ) ( not ( = ?auto_20182 ?auto_20187 ) ) ( not ( = ?auto_20182 ?auto_20209 ) ) ( not ( = ?auto_20183 ?auto_20187 ) ) ( not ( = ?auto_20183 ?auto_20209 ) ) ( not ( = ?auto_20184 ?auto_20187 ) ) ( not ( = ?auto_20184 ?auto_20209 ) ) ( not ( = ?auto_20185 ?auto_20187 ) ) ( not ( = ?auto_20185 ?auto_20209 ) ) ( not ( = ?auto_20187 ?auto_20197 ) ) ( not ( = ?auto_20187 ?auto_20196 ) ) ( not ( = ?auto_20187 ?auto_20201 ) ) ( not ( = ?auto_20187 ?auto_20208 ) ) ( not ( = ?auto_20187 ?auto_20203 ) ) ( not ( = ?auto_20209 ?auto_20197 ) ) ( not ( = ?auto_20209 ?auto_20196 ) ) ( not ( = ?auto_20209 ?auto_20201 ) ) ( not ( = ?auto_20209 ?auto_20208 ) ) ( not ( = ?auto_20209 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20188 ) ) ( not ( = ?auto_20181 ?auto_20204 ) ) ( not ( = ?auto_20182 ?auto_20188 ) ) ( not ( = ?auto_20182 ?auto_20204 ) ) ( not ( = ?auto_20183 ?auto_20188 ) ) ( not ( = ?auto_20183 ?auto_20204 ) ) ( not ( = ?auto_20184 ?auto_20188 ) ) ( not ( = ?auto_20184 ?auto_20204 ) ) ( not ( = ?auto_20185 ?auto_20188 ) ) ( not ( = ?auto_20185 ?auto_20204 ) ) ( not ( = ?auto_20186 ?auto_20188 ) ) ( not ( = ?auto_20186 ?auto_20204 ) ) ( not ( = ?auto_20188 ?auto_20209 ) ) ( not ( = ?auto_20188 ?auto_20197 ) ) ( not ( = ?auto_20188 ?auto_20196 ) ) ( not ( = ?auto_20188 ?auto_20201 ) ) ( not ( = ?auto_20188 ?auto_20208 ) ) ( not ( = ?auto_20188 ?auto_20203 ) ) ( not ( = ?auto_20204 ?auto_20209 ) ) ( not ( = ?auto_20204 ?auto_20197 ) ) ( not ( = ?auto_20204 ?auto_20196 ) ) ( not ( = ?auto_20204 ?auto_20201 ) ) ( not ( = ?auto_20204 ?auto_20208 ) ) ( not ( = ?auto_20204 ?auto_20203 ) ) ( not ( = ?auto_20181 ?auto_20189 ) ) ( not ( = ?auto_20181 ?auto_20194 ) ) ( not ( = ?auto_20182 ?auto_20189 ) ) ( not ( = ?auto_20182 ?auto_20194 ) ) ( not ( = ?auto_20183 ?auto_20189 ) ) ( not ( = ?auto_20183 ?auto_20194 ) ) ( not ( = ?auto_20184 ?auto_20189 ) ) ( not ( = ?auto_20184 ?auto_20194 ) ) ( not ( = ?auto_20185 ?auto_20189 ) ) ( not ( = ?auto_20185 ?auto_20194 ) ) ( not ( = ?auto_20186 ?auto_20189 ) ) ( not ( = ?auto_20186 ?auto_20194 ) ) ( not ( = ?auto_20187 ?auto_20189 ) ) ( not ( = ?auto_20187 ?auto_20194 ) ) ( not ( = ?auto_20189 ?auto_20204 ) ) ( not ( = ?auto_20189 ?auto_20209 ) ) ( not ( = ?auto_20189 ?auto_20197 ) ) ( not ( = ?auto_20189 ?auto_20196 ) ) ( not ( = ?auto_20189 ?auto_20201 ) ) ( not ( = ?auto_20189 ?auto_20208 ) ) ( not ( = ?auto_20189 ?auto_20203 ) ) ( not ( = ?auto_20194 ?auto_20204 ) ) ( not ( = ?auto_20194 ?auto_20209 ) ) ( not ( = ?auto_20194 ?auto_20197 ) ) ( not ( = ?auto_20194 ?auto_20196 ) ) ( not ( = ?auto_20194 ?auto_20201 ) ) ( not ( = ?auto_20194 ?auto_20208 ) ) ( not ( = ?auto_20194 ?auto_20203 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 ?auto_20186 ?auto_20187 ?auto_20188 )
      ( MAKE-1CRATE ?auto_20188 ?auto_20189 )
      ( MAKE-8CRATE-VERIFY ?auto_20181 ?auto_20182 ?auto_20183 ?auto_20184 ?auto_20185 ?auto_20186 ?auto_20187 ?auto_20188 ?auto_20189 ) )
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
      ?auto_20238 - SURFACE
      ?auto_20239 - SURFACE
      ?auto_20240 - SURFACE
    )
    :vars
    (
      ?auto_20241 - HOIST
      ?auto_20243 - PLACE
      ?auto_20242 - PLACE
      ?auto_20245 - HOIST
      ?auto_20244 - SURFACE
      ?auto_20253 - PLACE
      ?auto_20250 - HOIST
      ?auto_20247 - SURFACE
      ?auto_20258 - SURFACE
      ?auto_20249 - PLACE
      ?auto_20259 - HOIST
      ?auto_20261 - SURFACE
      ?auto_20264 - SURFACE
      ?auto_20255 - PLACE
      ?auto_20251 - HOIST
      ?auto_20248 - SURFACE
      ?auto_20252 - PLACE
      ?auto_20254 - HOIST
      ?auto_20260 - SURFACE
      ?auto_20263 - SURFACE
      ?auto_20262 - PLACE
      ?auto_20256 - HOIST
      ?auto_20257 - SURFACE
      ?auto_20246 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20241 ?auto_20243 ) ( IS-CRATE ?auto_20240 ) ( not ( = ?auto_20242 ?auto_20243 ) ) ( HOIST-AT ?auto_20245 ?auto_20242 ) ( AVAILABLE ?auto_20245 ) ( SURFACE-AT ?auto_20240 ?auto_20242 ) ( ON ?auto_20240 ?auto_20244 ) ( CLEAR ?auto_20240 ) ( not ( = ?auto_20239 ?auto_20240 ) ) ( not ( = ?auto_20239 ?auto_20244 ) ) ( not ( = ?auto_20240 ?auto_20244 ) ) ( not ( = ?auto_20241 ?auto_20245 ) ) ( IS-CRATE ?auto_20239 ) ( not ( = ?auto_20253 ?auto_20243 ) ) ( HOIST-AT ?auto_20250 ?auto_20253 ) ( SURFACE-AT ?auto_20239 ?auto_20253 ) ( ON ?auto_20239 ?auto_20247 ) ( CLEAR ?auto_20239 ) ( not ( = ?auto_20238 ?auto_20239 ) ) ( not ( = ?auto_20238 ?auto_20247 ) ) ( not ( = ?auto_20239 ?auto_20247 ) ) ( not ( = ?auto_20241 ?auto_20250 ) ) ( IS-CRATE ?auto_20238 ) ( SURFACE-AT ?auto_20238 ?auto_20253 ) ( ON ?auto_20238 ?auto_20258 ) ( CLEAR ?auto_20238 ) ( not ( = ?auto_20237 ?auto_20238 ) ) ( not ( = ?auto_20237 ?auto_20258 ) ) ( not ( = ?auto_20238 ?auto_20258 ) ) ( IS-CRATE ?auto_20237 ) ( not ( = ?auto_20249 ?auto_20243 ) ) ( HOIST-AT ?auto_20259 ?auto_20249 ) ( SURFACE-AT ?auto_20237 ?auto_20249 ) ( ON ?auto_20237 ?auto_20261 ) ( CLEAR ?auto_20237 ) ( not ( = ?auto_20236 ?auto_20237 ) ) ( not ( = ?auto_20236 ?auto_20261 ) ) ( not ( = ?auto_20237 ?auto_20261 ) ) ( not ( = ?auto_20241 ?auto_20259 ) ) ( IS-CRATE ?auto_20236 ) ( AVAILABLE ?auto_20259 ) ( SURFACE-AT ?auto_20236 ?auto_20249 ) ( ON ?auto_20236 ?auto_20264 ) ( CLEAR ?auto_20236 ) ( not ( = ?auto_20235 ?auto_20236 ) ) ( not ( = ?auto_20235 ?auto_20264 ) ) ( not ( = ?auto_20236 ?auto_20264 ) ) ( IS-CRATE ?auto_20235 ) ( not ( = ?auto_20255 ?auto_20243 ) ) ( HOIST-AT ?auto_20251 ?auto_20255 ) ( AVAILABLE ?auto_20251 ) ( SURFACE-AT ?auto_20235 ?auto_20255 ) ( ON ?auto_20235 ?auto_20248 ) ( CLEAR ?auto_20235 ) ( not ( = ?auto_20234 ?auto_20235 ) ) ( not ( = ?auto_20234 ?auto_20248 ) ) ( not ( = ?auto_20235 ?auto_20248 ) ) ( not ( = ?auto_20241 ?auto_20251 ) ) ( IS-CRATE ?auto_20234 ) ( not ( = ?auto_20252 ?auto_20243 ) ) ( HOIST-AT ?auto_20254 ?auto_20252 ) ( AVAILABLE ?auto_20254 ) ( SURFACE-AT ?auto_20234 ?auto_20252 ) ( ON ?auto_20234 ?auto_20260 ) ( CLEAR ?auto_20234 ) ( not ( = ?auto_20233 ?auto_20234 ) ) ( not ( = ?auto_20233 ?auto_20260 ) ) ( not ( = ?auto_20234 ?auto_20260 ) ) ( not ( = ?auto_20241 ?auto_20254 ) ) ( IS-CRATE ?auto_20233 ) ( AVAILABLE ?auto_20250 ) ( SURFACE-AT ?auto_20233 ?auto_20253 ) ( ON ?auto_20233 ?auto_20263 ) ( CLEAR ?auto_20233 ) ( not ( = ?auto_20232 ?auto_20233 ) ) ( not ( = ?auto_20232 ?auto_20263 ) ) ( not ( = ?auto_20233 ?auto_20263 ) ) ( SURFACE-AT ?auto_20231 ?auto_20243 ) ( CLEAR ?auto_20231 ) ( IS-CRATE ?auto_20232 ) ( AVAILABLE ?auto_20241 ) ( not ( = ?auto_20262 ?auto_20243 ) ) ( HOIST-AT ?auto_20256 ?auto_20262 ) ( AVAILABLE ?auto_20256 ) ( SURFACE-AT ?auto_20232 ?auto_20262 ) ( ON ?auto_20232 ?auto_20257 ) ( CLEAR ?auto_20232 ) ( TRUCK-AT ?auto_20246 ?auto_20243 ) ( not ( = ?auto_20231 ?auto_20232 ) ) ( not ( = ?auto_20231 ?auto_20257 ) ) ( not ( = ?auto_20232 ?auto_20257 ) ) ( not ( = ?auto_20241 ?auto_20256 ) ) ( not ( = ?auto_20231 ?auto_20233 ) ) ( not ( = ?auto_20231 ?auto_20263 ) ) ( not ( = ?auto_20233 ?auto_20257 ) ) ( not ( = ?auto_20253 ?auto_20262 ) ) ( not ( = ?auto_20250 ?auto_20256 ) ) ( not ( = ?auto_20263 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20234 ) ) ( not ( = ?auto_20231 ?auto_20260 ) ) ( not ( = ?auto_20232 ?auto_20234 ) ) ( not ( = ?auto_20232 ?auto_20260 ) ) ( not ( = ?auto_20234 ?auto_20263 ) ) ( not ( = ?auto_20234 ?auto_20257 ) ) ( not ( = ?auto_20252 ?auto_20253 ) ) ( not ( = ?auto_20252 ?auto_20262 ) ) ( not ( = ?auto_20254 ?auto_20250 ) ) ( not ( = ?auto_20254 ?auto_20256 ) ) ( not ( = ?auto_20260 ?auto_20263 ) ) ( not ( = ?auto_20260 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20235 ) ) ( not ( = ?auto_20231 ?auto_20248 ) ) ( not ( = ?auto_20232 ?auto_20235 ) ) ( not ( = ?auto_20232 ?auto_20248 ) ) ( not ( = ?auto_20233 ?auto_20235 ) ) ( not ( = ?auto_20233 ?auto_20248 ) ) ( not ( = ?auto_20235 ?auto_20260 ) ) ( not ( = ?auto_20235 ?auto_20263 ) ) ( not ( = ?auto_20235 ?auto_20257 ) ) ( not ( = ?auto_20255 ?auto_20252 ) ) ( not ( = ?auto_20255 ?auto_20253 ) ) ( not ( = ?auto_20255 ?auto_20262 ) ) ( not ( = ?auto_20251 ?auto_20254 ) ) ( not ( = ?auto_20251 ?auto_20250 ) ) ( not ( = ?auto_20251 ?auto_20256 ) ) ( not ( = ?auto_20248 ?auto_20260 ) ) ( not ( = ?auto_20248 ?auto_20263 ) ) ( not ( = ?auto_20248 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20236 ) ) ( not ( = ?auto_20231 ?auto_20264 ) ) ( not ( = ?auto_20232 ?auto_20236 ) ) ( not ( = ?auto_20232 ?auto_20264 ) ) ( not ( = ?auto_20233 ?auto_20236 ) ) ( not ( = ?auto_20233 ?auto_20264 ) ) ( not ( = ?auto_20234 ?auto_20236 ) ) ( not ( = ?auto_20234 ?auto_20264 ) ) ( not ( = ?auto_20236 ?auto_20248 ) ) ( not ( = ?auto_20236 ?auto_20260 ) ) ( not ( = ?auto_20236 ?auto_20263 ) ) ( not ( = ?auto_20236 ?auto_20257 ) ) ( not ( = ?auto_20249 ?auto_20255 ) ) ( not ( = ?auto_20249 ?auto_20252 ) ) ( not ( = ?auto_20249 ?auto_20253 ) ) ( not ( = ?auto_20249 ?auto_20262 ) ) ( not ( = ?auto_20259 ?auto_20251 ) ) ( not ( = ?auto_20259 ?auto_20254 ) ) ( not ( = ?auto_20259 ?auto_20250 ) ) ( not ( = ?auto_20259 ?auto_20256 ) ) ( not ( = ?auto_20264 ?auto_20248 ) ) ( not ( = ?auto_20264 ?auto_20260 ) ) ( not ( = ?auto_20264 ?auto_20263 ) ) ( not ( = ?auto_20264 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20237 ) ) ( not ( = ?auto_20231 ?auto_20261 ) ) ( not ( = ?auto_20232 ?auto_20237 ) ) ( not ( = ?auto_20232 ?auto_20261 ) ) ( not ( = ?auto_20233 ?auto_20237 ) ) ( not ( = ?auto_20233 ?auto_20261 ) ) ( not ( = ?auto_20234 ?auto_20237 ) ) ( not ( = ?auto_20234 ?auto_20261 ) ) ( not ( = ?auto_20235 ?auto_20237 ) ) ( not ( = ?auto_20235 ?auto_20261 ) ) ( not ( = ?auto_20237 ?auto_20264 ) ) ( not ( = ?auto_20237 ?auto_20248 ) ) ( not ( = ?auto_20237 ?auto_20260 ) ) ( not ( = ?auto_20237 ?auto_20263 ) ) ( not ( = ?auto_20237 ?auto_20257 ) ) ( not ( = ?auto_20261 ?auto_20264 ) ) ( not ( = ?auto_20261 ?auto_20248 ) ) ( not ( = ?auto_20261 ?auto_20260 ) ) ( not ( = ?auto_20261 ?auto_20263 ) ) ( not ( = ?auto_20261 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20238 ) ) ( not ( = ?auto_20231 ?auto_20258 ) ) ( not ( = ?auto_20232 ?auto_20238 ) ) ( not ( = ?auto_20232 ?auto_20258 ) ) ( not ( = ?auto_20233 ?auto_20238 ) ) ( not ( = ?auto_20233 ?auto_20258 ) ) ( not ( = ?auto_20234 ?auto_20238 ) ) ( not ( = ?auto_20234 ?auto_20258 ) ) ( not ( = ?auto_20235 ?auto_20238 ) ) ( not ( = ?auto_20235 ?auto_20258 ) ) ( not ( = ?auto_20236 ?auto_20238 ) ) ( not ( = ?auto_20236 ?auto_20258 ) ) ( not ( = ?auto_20238 ?auto_20261 ) ) ( not ( = ?auto_20238 ?auto_20264 ) ) ( not ( = ?auto_20238 ?auto_20248 ) ) ( not ( = ?auto_20238 ?auto_20260 ) ) ( not ( = ?auto_20238 ?auto_20263 ) ) ( not ( = ?auto_20238 ?auto_20257 ) ) ( not ( = ?auto_20258 ?auto_20261 ) ) ( not ( = ?auto_20258 ?auto_20264 ) ) ( not ( = ?auto_20258 ?auto_20248 ) ) ( not ( = ?auto_20258 ?auto_20260 ) ) ( not ( = ?auto_20258 ?auto_20263 ) ) ( not ( = ?auto_20258 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20239 ) ) ( not ( = ?auto_20231 ?auto_20247 ) ) ( not ( = ?auto_20232 ?auto_20239 ) ) ( not ( = ?auto_20232 ?auto_20247 ) ) ( not ( = ?auto_20233 ?auto_20239 ) ) ( not ( = ?auto_20233 ?auto_20247 ) ) ( not ( = ?auto_20234 ?auto_20239 ) ) ( not ( = ?auto_20234 ?auto_20247 ) ) ( not ( = ?auto_20235 ?auto_20239 ) ) ( not ( = ?auto_20235 ?auto_20247 ) ) ( not ( = ?auto_20236 ?auto_20239 ) ) ( not ( = ?auto_20236 ?auto_20247 ) ) ( not ( = ?auto_20237 ?auto_20239 ) ) ( not ( = ?auto_20237 ?auto_20247 ) ) ( not ( = ?auto_20239 ?auto_20258 ) ) ( not ( = ?auto_20239 ?auto_20261 ) ) ( not ( = ?auto_20239 ?auto_20264 ) ) ( not ( = ?auto_20239 ?auto_20248 ) ) ( not ( = ?auto_20239 ?auto_20260 ) ) ( not ( = ?auto_20239 ?auto_20263 ) ) ( not ( = ?auto_20239 ?auto_20257 ) ) ( not ( = ?auto_20247 ?auto_20258 ) ) ( not ( = ?auto_20247 ?auto_20261 ) ) ( not ( = ?auto_20247 ?auto_20264 ) ) ( not ( = ?auto_20247 ?auto_20248 ) ) ( not ( = ?auto_20247 ?auto_20260 ) ) ( not ( = ?auto_20247 ?auto_20263 ) ) ( not ( = ?auto_20247 ?auto_20257 ) ) ( not ( = ?auto_20231 ?auto_20240 ) ) ( not ( = ?auto_20231 ?auto_20244 ) ) ( not ( = ?auto_20232 ?auto_20240 ) ) ( not ( = ?auto_20232 ?auto_20244 ) ) ( not ( = ?auto_20233 ?auto_20240 ) ) ( not ( = ?auto_20233 ?auto_20244 ) ) ( not ( = ?auto_20234 ?auto_20240 ) ) ( not ( = ?auto_20234 ?auto_20244 ) ) ( not ( = ?auto_20235 ?auto_20240 ) ) ( not ( = ?auto_20235 ?auto_20244 ) ) ( not ( = ?auto_20236 ?auto_20240 ) ) ( not ( = ?auto_20236 ?auto_20244 ) ) ( not ( = ?auto_20237 ?auto_20240 ) ) ( not ( = ?auto_20237 ?auto_20244 ) ) ( not ( = ?auto_20238 ?auto_20240 ) ) ( not ( = ?auto_20238 ?auto_20244 ) ) ( not ( = ?auto_20240 ?auto_20247 ) ) ( not ( = ?auto_20240 ?auto_20258 ) ) ( not ( = ?auto_20240 ?auto_20261 ) ) ( not ( = ?auto_20240 ?auto_20264 ) ) ( not ( = ?auto_20240 ?auto_20248 ) ) ( not ( = ?auto_20240 ?auto_20260 ) ) ( not ( = ?auto_20240 ?auto_20263 ) ) ( not ( = ?auto_20240 ?auto_20257 ) ) ( not ( = ?auto_20242 ?auto_20253 ) ) ( not ( = ?auto_20242 ?auto_20249 ) ) ( not ( = ?auto_20242 ?auto_20255 ) ) ( not ( = ?auto_20242 ?auto_20252 ) ) ( not ( = ?auto_20242 ?auto_20262 ) ) ( not ( = ?auto_20245 ?auto_20250 ) ) ( not ( = ?auto_20245 ?auto_20259 ) ) ( not ( = ?auto_20245 ?auto_20251 ) ) ( not ( = ?auto_20245 ?auto_20254 ) ) ( not ( = ?auto_20245 ?auto_20256 ) ) ( not ( = ?auto_20244 ?auto_20247 ) ) ( not ( = ?auto_20244 ?auto_20258 ) ) ( not ( = ?auto_20244 ?auto_20261 ) ) ( not ( = ?auto_20244 ?auto_20264 ) ) ( not ( = ?auto_20244 ?auto_20248 ) ) ( not ( = ?auto_20244 ?auto_20260 ) ) ( not ( = ?auto_20244 ?auto_20263 ) ) ( not ( = ?auto_20244 ?auto_20257 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20238 ?auto_20239 )
      ( MAKE-1CRATE ?auto_20239 ?auto_20240 )
      ( MAKE-9CRATE-VERIFY ?auto_20231 ?auto_20232 ?auto_20233 ?auto_20234 ?auto_20235 ?auto_20236 ?auto_20237 ?auto_20238 ?auto_20239 ?auto_20240 ) )
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
      ?auto_20293 - SURFACE
      ?auto_20294 - SURFACE
      ?auto_20295 - SURFACE
      ?auto_20296 - SURFACE
    )
    :vars
    (
      ?auto_20298 - HOIST
      ?auto_20302 - PLACE
      ?auto_20297 - PLACE
      ?auto_20300 - HOIST
      ?auto_20301 - SURFACE
      ?auto_20308 - PLACE
      ?auto_20314 - HOIST
      ?auto_20311 - SURFACE
      ?auto_20307 - PLACE
      ?auto_20305 - HOIST
      ?auto_20316 - SURFACE
      ?auto_20320 - SURFACE
      ?auto_20319 - PLACE
      ?auto_20323 - HOIST
      ?auto_20315 - SURFACE
      ?auto_20304 - SURFACE
      ?auto_20303 - PLACE
      ?auto_20321 - HOIST
      ?auto_20317 - SURFACE
      ?auto_20322 - PLACE
      ?auto_20306 - HOIST
      ?auto_20318 - SURFACE
      ?auto_20309 - SURFACE
      ?auto_20310 - PLACE
      ?auto_20312 - HOIST
      ?auto_20313 - SURFACE
      ?auto_20299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20298 ?auto_20302 ) ( IS-CRATE ?auto_20296 ) ( not ( = ?auto_20297 ?auto_20302 ) ) ( HOIST-AT ?auto_20300 ?auto_20297 ) ( AVAILABLE ?auto_20300 ) ( SURFACE-AT ?auto_20296 ?auto_20297 ) ( ON ?auto_20296 ?auto_20301 ) ( CLEAR ?auto_20296 ) ( not ( = ?auto_20295 ?auto_20296 ) ) ( not ( = ?auto_20295 ?auto_20301 ) ) ( not ( = ?auto_20296 ?auto_20301 ) ) ( not ( = ?auto_20298 ?auto_20300 ) ) ( IS-CRATE ?auto_20295 ) ( not ( = ?auto_20308 ?auto_20302 ) ) ( HOIST-AT ?auto_20314 ?auto_20308 ) ( AVAILABLE ?auto_20314 ) ( SURFACE-AT ?auto_20295 ?auto_20308 ) ( ON ?auto_20295 ?auto_20311 ) ( CLEAR ?auto_20295 ) ( not ( = ?auto_20294 ?auto_20295 ) ) ( not ( = ?auto_20294 ?auto_20311 ) ) ( not ( = ?auto_20295 ?auto_20311 ) ) ( not ( = ?auto_20298 ?auto_20314 ) ) ( IS-CRATE ?auto_20294 ) ( not ( = ?auto_20307 ?auto_20302 ) ) ( HOIST-AT ?auto_20305 ?auto_20307 ) ( SURFACE-AT ?auto_20294 ?auto_20307 ) ( ON ?auto_20294 ?auto_20316 ) ( CLEAR ?auto_20294 ) ( not ( = ?auto_20293 ?auto_20294 ) ) ( not ( = ?auto_20293 ?auto_20316 ) ) ( not ( = ?auto_20294 ?auto_20316 ) ) ( not ( = ?auto_20298 ?auto_20305 ) ) ( IS-CRATE ?auto_20293 ) ( SURFACE-AT ?auto_20293 ?auto_20307 ) ( ON ?auto_20293 ?auto_20320 ) ( CLEAR ?auto_20293 ) ( not ( = ?auto_20292 ?auto_20293 ) ) ( not ( = ?auto_20292 ?auto_20320 ) ) ( not ( = ?auto_20293 ?auto_20320 ) ) ( IS-CRATE ?auto_20292 ) ( not ( = ?auto_20319 ?auto_20302 ) ) ( HOIST-AT ?auto_20323 ?auto_20319 ) ( SURFACE-AT ?auto_20292 ?auto_20319 ) ( ON ?auto_20292 ?auto_20315 ) ( CLEAR ?auto_20292 ) ( not ( = ?auto_20291 ?auto_20292 ) ) ( not ( = ?auto_20291 ?auto_20315 ) ) ( not ( = ?auto_20292 ?auto_20315 ) ) ( not ( = ?auto_20298 ?auto_20323 ) ) ( IS-CRATE ?auto_20291 ) ( AVAILABLE ?auto_20323 ) ( SURFACE-AT ?auto_20291 ?auto_20319 ) ( ON ?auto_20291 ?auto_20304 ) ( CLEAR ?auto_20291 ) ( not ( = ?auto_20290 ?auto_20291 ) ) ( not ( = ?auto_20290 ?auto_20304 ) ) ( not ( = ?auto_20291 ?auto_20304 ) ) ( IS-CRATE ?auto_20290 ) ( not ( = ?auto_20303 ?auto_20302 ) ) ( HOIST-AT ?auto_20321 ?auto_20303 ) ( AVAILABLE ?auto_20321 ) ( SURFACE-AT ?auto_20290 ?auto_20303 ) ( ON ?auto_20290 ?auto_20317 ) ( CLEAR ?auto_20290 ) ( not ( = ?auto_20289 ?auto_20290 ) ) ( not ( = ?auto_20289 ?auto_20317 ) ) ( not ( = ?auto_20290 ?auto_20317 ) ) ( not ( = ?auto_20298 ?auto_20321 ) ) ( IS-CRATE ?auto_20289 ) ( not ( = ?auto_20322 ?auto_20302 ) ) ( HOIST-AT ?auto_20306 ?auto_20322 ) ( AVAILABLE ?auto_20306 ) ( SURFACE-AT ?auto_20289 ?auto_20322 ) ( ON ?auto_20289 ?auto_20318 ) ( CLEAR ?auto_20289 ) ( not ( = ?auto_20288 ?auto_20289 ) ) ( not ( = ?auto_20288 ?auto_20318 ) ) ( not ( = ?auto_20289 ?auto_20318 ) ) ( not ( = ?auto_20298 ?auto_20306 ) ) ( IS-CRATE ?auto_20288 ) ( AVAILABLE ?auto_20305 ) ( SURFACE-AT ?auto_20288 ?auto_20307 ) ( ON ?auto_20288 ?auto_20309 ) ( CLEAR ?auto_20288 ) ( not ( = ?auto_20287 ?auto_20288 ) ) ( not ( = ?auto_20287 ?auto_20309 ) ) ( not ( = ?auto_20288 ?auto_20309 ) ) ( SURFACE-AT ?auto_20286 ?auto_20302 ) ( CLEAR ?auto_20286 ) ( IS-CRATE ?auto_20287 ) ( AVAILABLE ?auto_20298 ) ( not ( = ?auto_20310 ?auto_20302 ) ) ( HOIST-AT ?auto_20312 ?auto_20310 ) ( AVAILABLE ?auto_20312 ) ( SURFACE-AT ?auto_20287 ?auto_20310 ) ( ON ?auto_20287 ?auto_20313 ) ( CLEAR ?auto_20287 ) ( TRUCK-AT ?auto_20299 ?auto_20302 ) ( not ( = ?auto_20286 ?auto_20287 ) ) ( not ( = ?auto_20286 ?auto_20313 ) ) ( not ( = ?auto_20287 ?auto_20313 ) ) ( not ( = ?auto_20298 ?auto_20312 ) ) ( not ( = ?auto_20286 ?auto_20288 ) ) ( not ( = ?auto_20286 ?auto_20309 ) ) ( not ( = ?auto_20288 ?auto_20313 ) ) ( not ( = ?auto_20307 ?auto_20310 ) ) ( not ( = ?auto_20305 ?auto_20312 ) ) ( not ( = ?auto_20309 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20289 ) ) ( not ( = ?auto_20286 ?auto_20318 ) ) ( not ( = ?auto_20287 ?auto_20289 ) ) ( not ( = ?auto_20287 ?auto_20318 ) ) ( not ( = ?auto_20289 ?auto_20309 ) ) ( not ( = ?auto_20289 ?auto_20313 ) ) ( not ( = ?auto_20322 ?auto_20307 ) ) ( not ( = ?auto_20322 ?auto_20310 ) ) ( not ( = ?auto_20306 ?auto_20305 ) ) ( not ( = ?auto_20306 ?auto_20312 ) ) ( not ( = ?auto_20318 ?auto_20309 ) ) ( not ( = ?auto_20318 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20290 ) ) ( not ( = ?auto_20286 ?auto_20317 ) ) ( not ( = ?auto_20287 ?auto_20290 ) ) ( not ( = ?auto_20287 ?auto_20317 ) ) ( not ( = ?auto_20288 ?auto_20290 ) ) ( not ( = ?auto_20288 ?auto_20317 ) ) ( not ( = ?auto_20290 ?auto_20318 ) ) ( not ( = ?auto_20290 ?auto_20309 ) ) ( not ( = ?auto_20290 ?auto_20313 ) ) ( not ( = ?auto_20303 ?auto_20322 ) ) ( not ( = ?auto_20303 ?auto_20307 ) ) ( not ( = ?auto_20303 ?auto_20310 ) ) ( not ( = ?auto_20321 ?auto_20306 ) ) ( not ( = ?auto_20321 ?auto_20305 ) ) ( not ( = ?auto_20321 ?auto_20312 ) ) ( not ( = ?auto_20317 ?auto_20318 ) ) ( not ( = ?auto_20317 ?auto_20309 ) ) ( not ( = ?auto_20317 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20291 ) ) ( not ( = ?auto_20286 ?auto_20304 ) ) ( not ( = ?auto_20287 ?auto_20291 ) ) ( not ( = ?auto_20287 ?auto_20304 ) ) ( not ( = ?auto_20288 ?auto_20291 ) ) ( not ( = ?auto_20288 ?auto_20304 ) ) ( not ( = ?auto_20289 ?auto_20291 ) ) ( not ( = ?auto_20289 ?auto_20304 ) ) ( not ( = ?auto_20291 ?auto_20317 ) ) ( not ( = ?auto_20291 ?auto_20318 ) ) ( not ( = ?auto_20291 ?auto_20309 ) ) ( not ( = ?auto_20291 ?auto_20313 ) ) ( not ( = ?auto_20319 ?auto_20303 ) ) ( not ( = ?auto_20319 ?auto_20322 ) ) ( not ( = ?auto_20319 ?auto_20307 ) ) ( not ( = ?auto_20319 ?auto_20310 ) ) ( not ( = ?auto_20323 ?auto_20321 ) ) ( not ( = ?auto_20323 ?auto_20306 ) ) ( not ( = ?auto_20323 ?auto_20305 ) ) ( not ( = ?auto_20323 ?auto_20312 ) ) ( not ( = ?auto_20304 ?auto_20317 ) ) ( not ( = ?auto_20304 ?auto_20318 ) ) ( not ( = ?auto_20304 ?auto_20309 ) ) ( not ( = ?auto_20304 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20292 ) ) ( not ( = ?auto_20286 ?auto_20315 ) ) ( not ( = ?auto_20287 ?auto_20292 ) ) ( not ( = ?auto_20287 ?auto_20315 ) ) ( not ( = ?auto_20288 ?auto_20292 ) ) ( not ( = ?auto_20288 ?auto_20315 ) ) ( not ( = ?auto_20289 ?auto_20292 ) ) ( not ( = ?auto_20289 ?auto_20315 ) ) ( not ( = ?auto_20290 ?auto_20292 ) ) ( not ( = ?auto_20290 ?auto_20315 ) ) ( not ( = ?auto_20292 ?auto_20304 ) ) ( not ( = ?auto_20292 ?auto_20317 ) ) ( not ( = ?auto_20292 ?auto_20318 ) ) ( not ( = ?auto_20292 ?auto_20309 ) ) ( not ( = ?auto_20292 ?auto_20313 ) ) ( not ( = ?auto_20315 ?auto_20304 ) ) ( not ( = ?auto_20315 ?auto_20317 ) ) ( not ( = ?auto_20315 ?auto_20318 ) ) ( not ( = ?auto_20315 ?auto_20309 ) ) ( not ( = ?auto_20315 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20293 ) ) ( not ( = ?auto_20286 ?auto_20320 ) ) ( not ( = ?auto_20287 ?auto_20293 ) ) ( not ( = ?auto_20287 ?auto_20320 ) ) ( not ( = ?auto_20288 ?auto_20293 ) ) ( not ( = ?auto_20288 ?auto_20320 ) ) ( not ( = ?auto_20289 ?auto_20293 ) ) ( not ( = ?auto_20289 ?auto_20320 ) ) ( not ( = ?auto_20290 ?auto_20293 ) ) ( not ( = ?auto_20290 ?auto_20320 ) ) ( not ( = ?auto_20291 ?auto_20293 ) ) ( not ( = ?auto_20291 ?auto_20320 ) ) ( not ( = ?auto_20293 ?auto_20315 ) ) ( not ( = ?auto_20293 ?auto_20304 ) ) ( not ( = ?auto_20293 ?auto_20317 ) ) ( not ( = ?auto_20293 ?auto_20318 ) ) ( not ( = ?auto_20293 ?auto_20309 ) ) ( not ( = ?auto_20293 ?auto_20313 ) ) ( not ( = ?auto_20320 ?auto_20315 ) ) ( not ( = ?auto_20320 ?auto_20304 ) ) ( not ( = ?auto_20320 ?auto_20317 ) ) ( not ( = ?auto_20320 ?auto_20318 ) ) ( not ( = ?auto_20320 ?auto_20309 ) ) ( not ( = ?auto_20320 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20294 ) ) ( not ( = ?auto_20286 ?auto_20316 ) ) ( not ( = ?auto_20287 ?auto_20294 ) ) ( not ( = ?auto_20287 ?auto_20316 ) ) ( not ( = ?auto_20288 ?auto_20294 ) ) ( not ( = ?auto_20288 ?auto_20316 ) ) ( not ( = ?auto_20289 ?auto_20294 ) ) ( not ( = ?auto_20289 ?auto_20316 ) ) ( not ( = ?auto_20290 ?auto_20294 ) ) ( not ( = ?auto_20290 ?auto_20316 ) ) ( not ( = ?auto_20291 ?auto_20294 ) ) ( not ( = ?auto_20291 ?auto_20316 ) ) ( not ( = ?auto_20292 ?auto_20294 ) ) ( not ( = ?auto_20292 ?auto_20316 ) ) ( not ( = ?auto_20294 ?auto_20320 ) ) ( not ( = ?auto_20294 ?auto_20315 ) ) ( not ( = ?auto_20294 ?auto_20304 ) ) ( not ( = ?auto_20294 ?auto_20317 ) ) ( not ( = ?auto_20294 ?auto_20318 ) ) ( not ( = ?auto_20294 ?auto_20309 ) ) ( not ( = ?auto_20294 ?auto_20313 ) ) ( not ( = ?auto_20316 ?auto_20320 ) ) ( not ( = ?auto_20316 ?auto_20315 ) ) ( not ( = ?auto_20316 ?auto_20304 ) ) ( not ( = ?auto_20316 ?auto_20317 ) ) ( not ( = ?auto_20316 ?auto_20318 ) ) ( not ( = ?auto_20316 ?auto_20309 ) ) ( not ( = ?auto_20316 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20295 ) ) ( not ( = ?auto_20286 ?auto_20311 ) ) ( not ( = ?auto_20287 ?auto_20295 ) ) ( not ( = ?auto_20287 ?auto_20311 ) ) ( not ( = ?auto_20288 ?auto_20295 ) ) ( not ( = ?auto_20288 ?auto_20311 ) ) ( not ( = ?auto_20289 ?auto_20295 ) ) ( not ( = ?auto_20289 ?auto_20311 ) ) ( not ( = ?auto_20290 ?auto_20295 ) ) ( not ( = ?auto_20290 ?auto_20311 ) ) ( not ( = ?auto_20291 ?auto_20295 ) ) ( not ( = ?auto_20291 ?auto_20311 ) ) ( not ( = ?auto_20292 ?auto_20295 ) ) ( not ( = ?auto_20292 ?auto_20311 ) ) ( not ( = ?auto_20293 ?auto_20295 ) ) ( not ( = ?auto_20293 ?auto_20311 ) ) ( not ( = ?auto_20295 ?auto_20316 ) ) ( not ( = ?auto_20295 ?auto_20320 ) ) ( not ( = ?auto_20295 ?auto_20315 ) ) ( not ( = ?auto_20295 ?auto_20304 ) ) ( not ( = ?auto_20295 ?auto_20317 ) ) ( not ( = ?auto_20295 ?auto_20318 ) ) ( not ( = ?auto_20295 ?auto_20309 ) ) ( not ( = ?auto_20295 ?auto_20313 ) ) ( not ( = ?auto_20308 ?auto_20307 ) ) ( not ( = ?auto_20308 ?auto_20319 ) ) ( not ( = ?auto_20308 ?auto_20303 ) ) ( not ( = ?auto_20308 ?auto_20322 ) ) ( not ( = ?auto_20308 ?auto_20310 ) ) ( not ( = ?auto_20314 ?auto_20305 ) ) ( not ( = ?auto_20314 ?auto_20323 ) ) ( not ( = ?auto_20314 ?auto_20321 ) ) ( not ( = ?auto_20314 ?auto_20306 ) ) ( not ( = ?auto_20314 ?auto_20312 ) ) ( not ( = ?auto_20311 ?auto_20316 ) ) ( not ( = ?auto_20311 ?auto_20320 ) ) ( not ( = ?auto_20311 ?auto_20315 ) ) ( not ( = ?auto_20311 ?auto_20304 ) ) ( not ( = ?auto_20311 ?auto_20317 ) ) ( not ( = ?auto_20311 ?auto_20318 ) ) ( not ( = ?auto_20311 ?auto_20309 ) ) ( not ( = ?auto_20311 ?auto_20313 ) ) ( not ( = ?auto_20286 ?auto_20296 ) ) ( not ( = ?auto_20286 ?auto_20301 ) ) ( not ( = ?auto_20287 ?auto_20296 ) ) ( not ( = ?auto_20287 ?auto_20301 ) ) ( not ( = ?auto_20288 ?auto_20296 ) ) ( not ( = ?auto_20288 ?auto_20301 ) ) ( not ( = ?auto_20289 ?auto_20296 ) ) ( not ( = ?auto_20289 ?auto_20301 ) ) ( not ( = ?auto_20290 ?auto_20296 ) ) ( not ( = ?auto_20290 ?auto_20301 ) ) ( not ( = ?auto_20291 ?auto_20296 ) ) ( not ( = ?auto_20291 ?auto_20301 ) ) ( not ( = ?auto_20292 ?auto_20296 ) ) ( not ( = ?auto_20292 ?auto_20301 ) ) ( not ( = ?auto_20293 ?auto_20296 ) ) ( not ( = ?auto_20293 ?auto_20301 ) ) ( not ( = ?auto_20294 ?auto_20296 ) ) ( not ( = ?auto_20294 ?auto_20301 ) ) ( not ( = ?auto_20296 ?auto_20311 ) ) ( not ( = ?auto_20296 ?auto_20316 ) ) ( not ( = ?auto_20296 ?auto_20320 ) ) ( not ( = ?auto_20296 ?auto_20315 ) ) ( not ( = ?auto_20296 ?auto_20304 ) ) ( not ( = ?auto_20296 ?auto_20317 ) ) ( not ( = ?auto_20296 ?auto_20318 ) ) ( not ( = ?auto_20296 ?auto_20309 ) ) ( not ( = ?auto_20296 ?auto_20313 ) ) ( not ( = ?auto_20297 ?auto_20308 ) ) ( not ( = ?auto_20297 ?auto_20307 ) ) ( not ( = ?auto_20297 ?auto_20319 ) ) ( not ( = ?auto_20297 ?auto_20303 ) ) ( not ( = ?auto_20297 ?auto_20322 ) ) ( not ( = ?auto_20297 ?auto_20310 ) ) ( not ( = ?auto_20300 ?auto_20314 ) ) ( not ( = ?auto_20300 ?auto_20305 ) ) ( not ( = ?auto_20300 ?auto_20323 ) ) ( not ( = ?auto_20300 ?auto_20321 ) ) ( not ( = ?auto_20300 ?auto_20306 ) ) ( not ( = ?auto_20300 ?auto_20312 ) ) ( not ( = ?auto_20301 ?auto_20311 ) ) ( not ( = ?auto_20301 ?auto_20316 ) ) ( not ( = ?auto_20301 ?auto_20320 ) ) ( not ( = ?auto_20301 ?auto_20315 ) ) ( not ( = ?auto_20301 ?auto_20304 ) ) ( not ( = ?auto_20301 ?auto_20317 ) ) ( not ( = ?auto_20301 ?auto_20318 ) ) ( not ( = ?auto_20301 ?auto_20309 ) ) ( not ( = ?auto_20301 ?auto_20313 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_20286 ?auto_20287 ?auto_20288 ?auto_20289 ?auto_20290 ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 )
      ( MAKE-1CRATE ?auto_20295 ?auto_20296 )
      ( MAKE-10CRATE-VERIFY ?auto_20286 ?auto_20287 ?auto_20288 ?auto_20289 ?auto_20290 ?auto_20291 ?auto_20292 ?auto_20293 ?auto_20294 ?auto_20295 ?auto_20296 ) )
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
      ?auto_20353 - SURFACE
      ?auto_20354 - SURFACE
      ?auto_20355 - SURFACE
      ?auto_20356 - SURFACE
      ?auto_20357 - SURFACE
    )
    :vars
    (
      ?auto_20362 - HOIST
      ?auto_20361 - PLACE
      ?auto_20359 - PLACE
      ?auto_20363 - HOIST
      ?auto_20360 - SURFACE
      ?auto_20382 - PLACE
      ?auto_20364 - HOIST
      ?auto_20375 - SURFACE
      ?auto_20384 - PLACE
      ?auto_20385 - HOIST
      ?auto_20379 - SURFACE
      ?auto_20374 - PLACE
      ?auto_20373 - HOIST
      ?auto_20368 - SURFACE
      ?auto_20383 - SURFACE
      ?auto_20377 - PLACE
      ?auto_20380 - HOIST
      ?auto_20371 - SURFACE
      ?auto_20367 - SURFACE
      ?auto_20366 - PLACE
      ?auto_20376 - HOIST
      ?auto_20381 - SURFACE
      ?auto_20378 - PLACE
      ?auto_20365 - HOIST
      ?auto_20369 - SURFACE
      ?auto_20370 - SURFACE
      ?auto_20372 - SURFACE
      ?auto_20358 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20362 ?auto_20361 ) ( IS-CRATE ?auto_20357 ) ( not ( = ?auto_20359 ?auto_20361 ) ) ( HOIST-AT ?auto_20363 ?auto_20359 ) ( SURFACE-AT ?auto_20357 ?auto_20359 ) ( ON ?auto_20357 ?auto_20360 ) ( CLEAR ?auto_20357 ) ( not ( = ?auto_20356 ?auto_20357 ) ) ( not ( = ?auto_20356 ?auto_20360 ) ) ( not ( = ?auto_20357 ?auto_20360 ) ) ( not ( = ?auto_20362 ?auto_20363 ) ) ( IS-CRATE ?auto_20356 ) ( not ( = ?auto_20382 ?auto_20361 ) ) ( HOIST-AT ?auto_20364 ?auto_20382 ) ( AVAILABLE ?auto_20364 ) ( SURFACE-AT ?auto_20356 ?auto_20382 ) ( ON ?auto_20356 ?auto_20375 ) ( CLEAR ?auto_20356 ) ( not ( = ?auto_20355 ?auto_20356 ) ) ( not ( = ?auto_20355 ?auto_20375 ) ) ( not ( = ?auto_20356 ?auto_20375 ) ) ( not ( = ?auto_20362 ?auto_20364 ) ) ( IS-CRATE ?auto_20355 ) ( not ( = ?auto_20384 ?auto_20361 ) ) ( HOIST-AT ?auto_20385 ?auto_20384 ) ( AVAILABLE ?auto_20385 ) ( SURFACE-AT ?auto_20355 ?auto_20384 ) ( ON ?auto_20355 ?auto_20379 ) ( CLEAR ?auto_20355 ) ( not ( = ?auto_20354 ?auto_20355 ) ) ( not ( = ?auto_20354 ?auto_20379 ) ) ( not ( = ?auto_20355 ?auto_20379 ) ) ( not ( = ?auto_20362 ?auto_20385 ) ) ( IS-CRATE ?auto_20354 ) ( not ( = ?auto_20374 ?auto_20361 ) ) ( HOIST-AT ?auto_20373 ?auto_20374 ) ( SURFACE-AT ?auto_20354 ?auto_20374 ) ( ON ?auto_20354 ?auto_20368 ) ( CLEAR ?auto_20354 ) ( not ( = ?auto_20353 ?auto_20354 ) ) ( not ( = ?auto_20353 ?auto_20368 ) ) ( not ( = ?auto_20354 ?auto_20368 ) ) ( not ( = ?auto_20362 ?auto_20373 ) ) ( IS-CRATE ?auto_20353 ) ( SURFACE-AT ?auto_20353 ?auto_20374 ) ( ON ?auto_20353 ?auto_20383 ) ( CLEAR ?auto_20353 ) ( not ( = ?auto_20352 ?auto_20353 ) ) ( not ( = ?auto_20352 ?auto_20383 ) ) ( not ( = ?auto_20353 ?auto_20383 ) ) ( IS-CRATE ?auto_20352 ) ( not ( = ?auto_20377 ?auto_20361 ) ) ( HOIST-AT ?auto_20380 ?auto_20377 ) ( SURFACE-AT ?auto_20352 ?auto_20377 ) ( ON ?auto_20352 ?auto_20371 ) ( CLEAR ?auto_20352 ) ( not ( = ?auto_20351 ?auto_20352 ) ) ( not ( = ?auto_20351 ?auto_20371 ) ) ( not ( = ?auto_20352 ?auto_20371 ) ) ( not ( = ?auto_20362 ?auto_20380 ) ) ( IS-CRATE ?auto_20351 ) ( AVAILABLE ?auto_20380 ) ( SURFACE-AT ?auto_20351 ?auto_20377 ) ( ON ?auto_20351 ?auto_20367 ) ( CLEAR ?auto_20351 ) ( not ( = ?auto_20350 ?auto_20351 ) ) ( not ( = ?auto_20350 ?auto_20367 ) ) ( not ( = ?auto_20351 ?auto_20367 ) ) ( IS-CRATE ?auto_20350 ) ( not ( = ?auto_20366 ?auto_20361 ) ) ( HOIST-AT ?auto_20376 ?auto_20366 ) ( AVAILABLE ?auto_20376 ) ( SURFACE-AT ?auto_20350 ?auto_20366 ) ( ON ?auto_20350 ?auto_20381 ) ( CLEAR ?auto_20350 ) ( not ( = ?auto_20349 ?auto_20350 ) ) ( not ( = ?auto_20349 ?auto_20381 ) ) ( not ( = ?auto_20350 ?auto_20381 ) ) ( not ( = ?auto_20362 ?auto_20376 ) ) ( IS-CRATE ?auto_20349 ) ( not ( = ?auto_20378 ?auto_20361 ) ) ( HOIST-AT ?auto_20365 ?auto_20378 ) ( AVAILABLE ?auto_20365 ) ( SURFACE-AT ?auto_20349 ?auto_20378 ) ( ON ?auto_20349 ?auto_20369 ) ( CLEAR ?auto_20349 ) ( not ( = ?auto_20348 ?auto_20349 ) ) ( not ( = ?auto_20348 ?auto_20369 ) ) ( not ( = ?auto_20349 ?auto_20369 ) ) ( not ( = ?auto_20362 ?auto_20365 ) ) ( IS-CRATE ?auto_20348 ) ( AVAILABLE ?auto_20373 ) ( SURFACE-AT ?auto_20348 ?auto_20374 ) ( ON ?auto_20348 ?auto_20370 ) ( CLEAR ?auto_20348 ) ( not ( = ?auto_20347 ?auto_20348 ) ) ( not ( = ?auto_20347 ?auto_20370 ) ) ( not ( = ?auto_20348 ?auto_20370 ) ) ( SURFACE-AT ?auto_20346 ?auto_20361 ) ( CLEAR ?auto_20346 ) ( IS-CRATE ?auto_20347 ) ( AVAILABLE ?auto_20362 ) ( AVAILABLE ?auto_20363 ) ( SURFACE-AT ?auto_20347 ?auto_20359 ) ( ON ?auto_20347 ?auto_20372 ) ( CLEAR ?auto_20347 ) ( TRUCK-AT ?auto_20358 ?auto_20361 ) ( not ( = ?auto_20346 ?auto_20347 ) ) ( not ( = ?auto_20346 ?auto_20372 ) ) ( not ( = ?auto_20347 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20348 ) ) ( not ( = ?auto_20346 ?auto_20370 ) ) ( not ( = ?auto_20348 ?auto_20372 ) ) ( not ( = ?auto_20374 ?auto_20359 ) ) ( not ( = ?auto_20373 ?auto_20363 ) ) ( not ( = ?auto_20370 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20349 ) ) ( not ( = ?auto_20346 ?auto_20369 ) ) ( not ( = ?auto_20347 ?auto_20349 ) ) ( not ( = ?auto_20347 ?auto_20369 ) ) ( not ( = ?auto_20349 ?auto_20370 ) ) ( not ( = ?auto_20349 ?auto_20372 ) ) ( not ( = ?auto_20378 ?auto_20374 ) ) ( not ( = ?auto_20378 ?auto_20359 ) ) ( not ( = ?auto_20365 ?auto_20373 ) ) ( not ( = ?auto_20365 ?auto_20363 ) ) ( not ( = ?auto_20369 ?auto_20370 ) ) ( not ( = ?auto_20369 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20350 ) ) ( not ( = ?auto_20346 ?auto_20381 ) ) ( not ( = ?auto_20347 ?auto_20350 ) ) ( not ( = ?auto_20347 ?auto_20381 ) ) ( not ( = ?auto_20348 ?auto_20350 ) ) ( not ( = ?auto_20348 ?auto_20381 ) ) ( not ( = ?auto_20350 ?auto_20369 ) ) ( not ( = ?auto_20350 ?auto_20370 ) ) ( not ( = ?auto_20350 ?auto_20372 ) ) ( not ( = ?auto_20366 ?auto_20378 ) ) ( not ( = ?auto_20366 ?auto_20374 ) ) ( not ( = ?auto_20366 ?auto_20359 ) ) ( not ( = ?auto_20376 ?auto_20365 ) ) ( not ( = ?auto_20376 ?auto_20373 ) ) ( not ( = ?auto_20376 ?auto_20363 ) ) ( not ( = ?auto_20381 ?auto_20369 ) ) ( not ( = ?auto_20381 ?auto_20370 ) ) ( not ( = ?auto_20381 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20351 ) ) ( not ( = ?auto_20346 ?auto_20367 ) ) ( not ( = ?auto_20347 ?auto_20351 ) ) ( not ( = ?auto_20347 ?auto_20367 ) ) ( not ( = ?auto_20348 ?auto_20351 ) ) ( not ( = ?auto_20348 ?auto_20367 ) ) ( not ( = ?auto_20349 ?auto_20351 ) ) ( not ( = ?auto_20349 ?auto_20367 ) ) ( not ( = ?auto_20351 ?auto_20381 ) ) ( not ( = ?auto_20351 ?auto_20369 ) ) ( not ( = ?auto_20351 ?auto_20370 ) ) ( not ( = ?auto_20351 ?auto_20372 ) ) ( not ( = ?auto_20377 ?auto_20366 ) ) ( not ( = ?auto_20377 ?auto_20378 ) ) ( not ( = ?auto_20377 ?auto_20374 ) ) ( not ( = ?auto_20377 ?auto_20359 ) ) ( not ( = ?auto_20380 ?auto_20376 ) ) ( not ( = ?auto_20380 ?auto_20365 ) ) ( not ( = ?auto_20380 ?auto_20373 ) ) ( not ( = ?auto_20380 ?auto_20363 ) ) ( not ( = ?auto_20367 ?auto_20381 ) ) ( not ( = ?auto_20367 ?auto_20369 ) ) ( not ( = ?auto_20367 ?auto_20370 ) ) ( not ( = ?auto_20367 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20352 ) ) ( not ( = ?auto_20346 ?auto_20371 ) ) ( not ( = ?auto_20347 ?auto_20352 ) ) ( not ( = ?auto_20347 ?auto_20371 ) ) ( not ( = ?auto_20348 ?auto_20352 ) ) ( not ( = ?auto_20348 ?auto_20371 ) ) ( not ( = ?auto_20349 ?auto_20352 ) ) ( not ( = ?auto_20349 ?auto_20371 ) ) ( not ( = ?auto_20350 ?auto_20352 ) ) ( not ( = ?auto_20350 ?auto_20371 ) ) ( not ( = ?auto_20352 ?auto_20367 ) ) ( not ( = ?auto_20352 ?auto_20381 ) ) ( not ( = ?auto_20352 ?auto_20369 ) ) ( not ( = ?auto_20352 ?auto_20370 ) ) ( not ( = ?auto_20352 ?auto_20372 ) ) ( not ( = ?auto_20371 ?auto_20367 ) ) ( not ( = ?auto_20371 ?auto_20381 ) ) ( not ( = ?auto_20371 ?auto_20369 ) ) ( not ( = ?auto_20371 ?auto_20370 ) ) ( not ( = ?auto_20371 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20353 ) ) ( not ( = ?auto_20346 ?auto_20383 ) ) ( not ( = ?auto_20347 ?auto_20353 ) ) ( not ( = ?auto_20347 ?auto_20383 ) ) ( not ( = ?auto_20348 ?auto_20353 ) ) ( not ( = ?auto_20348 ?auto_20383 ) ) ( not ( = ?auto_20349 ?auto_20353 ) ) ( not ( = ?auto_20349 ?auto_20383 ) ) ( not ( = ?auto_20350 ?auto_20353 ) ) ( not ( = ?auto_20350 ?auto_20383 ) ) ( not ( = ?auto_20351 ?auto_20353 ) ) ( not ( = ?auto_20351 ?auto_20383 ) ) ( not ( = ?auto_20353 ?auto_20371 ) ) ( not ( = ?auto_20353 ?auto_20367 ) ) ( not ( = ?auto_20353 ?auto_20381 ) ) ( not ( = ?auto_20353 ?auto_20369 ) ) ( not ( = ?auto_20353 ?auto_20370 ) ) ( not ( = ?auto_20353 ?auto_20372 ) ) ( not ( = ?auto_20383 ?auto_20371 ) ) ( not ( = ?auto_20383 ?auto_20367 ) ) ( not ( = ?auto_20383 ?auto_20381 ) ) ( not ( = ?auto_20383 ?auto_20369 ) ) ( not ( = ?auto_20383 ?auto_20370 ) ) ( not ( = ?auto_20383 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20354 ) ) ( not ( = ?auto_20346 ?auto_20368 ) ) ( not ( = ?auto_20347 ?auto_20354 ) ) ( not ( = ?auto_20347 ?auto_20368 ) ) ( not ( = ?auto_20348 ?auto_20354 ) ) ( not ( = ?auto_20348 ?auto_20368 ) ) ( not ( = ?auto_20349 ?auto_20354 ) ) ( not ( = ?auto_20349 ?auto_20368 ) ) ( not ( = ?auto_20350 ?auto_20354 ) ) ( not ( = ?auto_20350 ?auto_20368 ) ) ( not ( = ?auto_20351 ?auto_20354 ) ) ( not ( = ?auto_20351 ?auto_20368 ) ) ( not ( = ?auto_20352 ?auto_20354 ) ) ( not ( = ?auto_20352 ?auto_20368 ) ) ( not ( = ?auto_20354 ?auto_20383 ) ) ( not ( = ?auto_20354 ?auto_20371 ) ) ( not ( = ?auto_20354 ?auto_20367 ) ) ( not ( = ?auto_20354 ?auto_20381 ) ) ( not ( = ?auto_20354 ?auto_20369 ) ) ( not ( = ?auto_20354 ?auto_20370 ) ) ( not ( = ?auto_20354 ?auto_20372 ) ) ( not ( = ?auto_20368 ?auto_20383 ) ) ( not ( = ?auto_20368 ?auto_20371 ) ) ( not ( = ?auto_20368 ?auto_20367 ) ) ( not ( = ?auto_20368 ?auto_20381 ) ) ( not ( = ?auto_20368 ?auto_20369 ) ) ( not ( = ?auto_20368 ?auto_20370 ) ) ( not ( = ?auto_20368 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20355 ) ) ( not ( = ?auto_20346 ?auto_20379 ) ) ( not ( = ?auto_20347 ?auto_20355 ) ) ( not ( = ?auto_20347 ?auto_20379 ) ) ( not ( = ?auto_20348 ?auto_20355 ) ) ( not ( = ?auto_20348 ?auto_20379 ) ) ( not ( = ?auto_20349 ?auto_20355 ) ) ( not ( = ?auto_20349 ?auto_20379 ) ) ( not ( = ?auto_20350 ?auto_20355 ) ) ( not ( = ?auto_20350 ?auto_20379 ) ) ( not ( = ?auto_20351 ?auto_20355 ) ) ( not ( = ?auto_20351 ?auto_20379 ) ) ( not ( = ?auto_20352 ?auto_20355 ) ) ( not ( = ?auto_20352 ?auto_20379 ) ) ( not ( = ?auto_20353 ?auto_20355 ) ) ( not ( = ?auto_20353 ?auto_20379 ) ) ( not ( = ?auto_20355 ?auto_20368 ) ) ( not ( = ?auto_20355 ?auto_20383 ) ) ( not ( = ?auto_20355 ?auto_20371 ) ) ( not ( = ?auto_20355 ?auto_20367 ) ) ( not ( = ?auto_20355 ?auto_20381 ) ) ( not ( = ?auto_20355 ?auto_20369 ) ) ( not ( = ?auto_20355 ?auto_20370 ) ) ( not ( = ?auto_20355 ?auto_20372 ) ) ( not ( = ?auto_20384 ?auto_20374 ) ) ( not ( = ?auto_20384 ?auto_20377 ) ) ( not ( = ?auto_20384 ?auto_20366 ) ) ( not ( = ?auto_20384 ?auto_20378 ) ) ( not ( = ?auto_20384 ?auto_20359 ) ) ( not ( = ?auto_20385 ?auto_20373 ) ) ( not ( = ?auto_20385 ?auto_20380 ) ) ( not ( = ?auto_20385 ?auto_20376 ) ) ( not ( = ?auto_20385 ?auto_20365 ) ) ( not ( = ?auto_20385 ?auto_20363 ) ) ( not ( = ?auto_20379 ?auto_20368 ) ) ( not ( = ?auto_20379 ?auto_20383 ) ) ( not ( = ?auto_20379 ?auto_20371 ) ) ( not ( = ?auto_20379 ?auto_20367 ) ) ( not ( = ?auto_20379 ?auto_20381 ) ) ( not ( = ?auto_20379 ?auto_20369 ) ) ( not ( = ?auto_20379 ?auto_20370 ) ) ( not ( = ?auto_20379 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20356 ) ) ( not ( = ?auto_20346 ?auto_20375 ) ) ( not ( = ?auto_20347 ?auto_20356 ) ) ( not ( = ?auto_20347 ?auto_20375 ) ) ( not ( = ?auto_20348 ?auto_20356 ) ) ( not ( = ?auto_20348 ?auto_20375 ) ) ( not ( = ?auto_20349 ?auto_20356 ) ) ( not ( = ?auto_20349 ?auto_20375 ) ) ( not ( = ?auto_20350 ?auto_20356 ) ) ( not ( = ?auto_20350 ?auto_20375 ) ) ( not ( = ?auto_20351 ?auto_20356 ) ) ( not ( = ?auto_20351 ?auto_20375 ) ) ( not ( = ?auto_20352 ?auto_20356 ) ) ( not ( = ?auto_20352 ?auto_20375 ) ) ( not ( = ?auto_20353 ?auto_20356 ) ) ( not ( = ?auto_20353 ?auto_20375 ) ) ( not ( = ?auto_20354 ?auto_20356 ) ) ( not ( = ?auto_20354 ?auto_20375 ) ) ( not ( = ?auto_20356 ?auto_20379 ) ) ( not ( = ?auto_20356 ?auto_20368 ) ) ( not ( = ?auto_20356 ?auto_20383 ) ) ( not ( = ?auto_20356 ?auto_20371 ) ) ( not ( = ?auto_20356 ?auto_20367 ) ) ( not ( = ?auto_20356 ?auto_20381 ) ) ( not ( = ?auto_20356 ?auto_20369 ) ) ( not ( = ?auto_20356 ?auto_20370 ) ) ( not ( = ?auto_20356 ?auto_20372 ) ) ( not ( = ?auto_20382 ?auto_20384 ) ) ( not ( = ?auto_20382 ?auto_20374 ) ) ( not ( = ?auto_20382 ?auto_20377 ) ) ( not ( = ?auto_20382 ?auto_20366 ) ) ( not ( = ?auto_20382 ?auto_20378 ) ) ( not ( = ?auto_20382 ?auto_20359 ) ) ( not ( = ?auto_20364 ?auto_20385 ) ) ( not ( = ?auto_20364 ?auto_20373 ) ) ( not ( = ?auto_20364 ?auto_20380 ) ) ( not ( = ?auto_20364 ?auto_20376 ) ) ( not ( = ?auto_20364 ?auto_20365 ) ) ( not ( = ?auto_20364 ?auto_20363 ) ) ( not ( = ?auto_20375 ?auto_20379 ) ) ( not ( = ?auto_20375 ?auto_20368 ) ) ( not ( = ?auto_20375 ?auto_20383 ) ) ( not ( = ?auto_20375 ?auto_20371 ) ) ( not ( = ?auto_20375 ?auto_20367 ) ) ( not ( = ?auto_20375 ?auto_20381 ) ) ( not ( = ?auto_20375 ?auto_20369 ) ) ( not ( = ?auto_20375 ?auto_20370 ) ) ( not ( = ?auto_20375 ?auto_20372 ) ) ( not ( = ?auto_20346 ?auto_20357 ) ) ( not ( = ?auto_20346 ?auto_20360 ) ) ( not ( = ?auto_20347 ?auto_20357 ) ) ( not ( = ?auto_20347 ?auto_20360 ) ) ( not ( = ?auto_20348 ?auto_20357 ) ) ( not ( = ?auto_20348 ?auto_20360 ) ) ( not ( = ?auto_20349 ?auto_20357 ) ) ( not ( = ?auto_20349 ?auto_20360 ) ) ( not ( = ?auto_20350 ?auto_20357 ) ) ( not ( = ?auto_20350 ?auto_20360 ) ) ( not ( = ?auto_20351 ?auto_20357 ) ) ( not ( = ?auto_20351 ?auto_20360 ) ) ( not ( = ?auto_20352 ?auto_20357 ) ) ( not ( = ?auto_20352 ?auto_20360 ) ) ( not ( = ?auto_20353 ?auto_20357 ) ) ( not ( = ?auto_20353 ?auto_20360 ) ) ( not ( = ?auto_20354 ?auto_20357 ) ) ( not ( = ?auto_20354 ?auto_20360 ) ) ( not ( = ?auto_20355 ?auto_20357 ) ) ( not ( = ?auto_20355 ?auto_20360 ) ) ( not ( = ?auto_20357 ?auto_20375 ) ) ( not ( = ?auto_20357 ?auto_20379 ) ) ( not ( = ?auto_20357 ?auto_20368 ) ) ( not ( = ?auto_20357 ?auto_20383 ) ) ( not ( = ?auto_20357 ?auto_20371 ) ) ( not ( = ?auto_20357 ?auto_20367 ) ) ( not ( = ?auto_20357 ?auto_20381 ) ) ( not ( = ?auto_20357 ?auto_20369 ) ) ( not ( = ?auto_20357 ?auto_20370 ) ) ( not ( = ?auto_20357 ?auto_20372 ) ) ( not ( = ?auto_20360 ?auto_20375 ) ) ( not ( = ?auto_20360 ?auto_20379 ) ) ( not ( = ?auto_20360 ?auto_20368 ) ) ( not ( = ?auto_20360 ?auto_20383 ) ) ( not ( = ?auto_20360 ?auto_20371 ) ) ( not ( = ?auto_20360 ?auto_20367 ) ) ( not ( = ?auto_20360 ?auto_20381 ) ) ( not ( = ?auto_20360 ?auto_20369 ) ) ( not ( = ?auto_20360 ?auto_20370 ) ) ( not ( = ?auto_20360 ?auto_20372 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ?auto_20351 ?auto_20352 ?auto_20353 ?auto_20354 ?auto_20355 ?auto_20356 )
      ( MAKE-1CRATE ?auto_20356 ?auto_20357 )
      ( MAKE-11CRATE-VERIFY ?auto_20346 ?auto_20347 ?auto_20348 ?auto_20349 ?auto_20350 ?auto_20351 ?auto_20352 ?auto_20353 ?auto_20354 ?auto_20355 ?auto_20356 ?auto_20357 ) )
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
      ?auto_20416 - SURFACE
      ?auto_20417 - SURFACE
      ?auto_20418 - SURFACE
      ?auto_20419 - SURFACE
      ?auto_20420 - SURFACE
      ?auto_20421 - SURFACE
    )
    :vars
    (
      ?auto_20427 - HOIST
      ?auto_20426 - PLACE
      ?auto_20422 - PLACE
      ?auto_20425 - HOIST
      ?auto_20423 - SURFACE
      ?auto_20438 - PLACE
      ?auto_20432 - HOIST
      ?auto_20448 - SURFACE
      ?auto_20437 - SURFACE
      ?auto_20450 - PLACE
      ?auto_20449 - HOIST
      ?auto_20447 - SURFACE
      ?auto_20442 - PLACE
      ?auto_20443 - HOIST
      ?auto_20439 - SURFACE
      ?auto_20433 - SURFACE
      ?auto_20436 - PLACE
      ?auto_20430 - HOIST
      ?auto_20441 - SURFACE
      ?auto_20435 - SURFACE
      ?auto_20440 - PLACE
      ?auto_20444 - HOIST
      ?auto_20429 - SURFACE
      ?auto_20446 - PLACE
      ?auto_20431 - HOIST
      ?auto_20434 - SURFACE
      ?auto_20445 - SURFACE
      ?auto_20428 - SURFACE
      ?auto_20424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20427 ?auto_20426 ) ( IS-CRATE ?auto_20421 ) ( not ( = ?auto_20422 ?auto_20426 ) ) ( HOIST-AT ?auto_20425 ?auto_20422 ) ( SURFACE-AT ?auto_20421 ?auto_20422 ) ( ON ?auto_20421 ?auto_20423 ) ( CLEAR ?auto_20421 ) ( not ( = ?auto_20420 ?auto_20421 ) ) ( not ( = ?auto_20420 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20423 ) ) ( not ( = ?auto_20427 ?auto_20425 ) ) ( IS-CRATE ?auto_20420 ) ( not ( = ?auto_20438 ?auto_20426 ) ) ( HOIST-AT ?auto_20432 ?auto_20438 ) ( SURFACE-AT ?auto_20420 ?auto_20438 ) ( ON ?auto_20420 ?auto_20448 ) ( CLEAR ?auto_20420 ) ( not ( = ?auto_20419 ?auto_20420 ) ) ( not ( = ?auto_20419 ?auto_20448 ) ) ( not ( = ?auto_20420 ?auto_20448 ) ) ( not ( = ?auto_20427 ?auto_20432 ) ) ( IS-CRATE ?auto_20419 ) ( AVAILABLE ?auto_20425 ) ( SURFACE-AT ?auto_20419 ?auto_20422 ) ( ON ?auto_20419 ?auto_20437 ) ( CLEAR ?auto_20419 ) ( not ( = ?auto_20418 ?auto_20419 ) ) ( not ( = ?auto_20418 ?auto_20437 ) ) ( not ( = ?auto_20419 ?auto_20437 ) ) ( IS-CRATE ?auto_20418 ) ( not ( = ?auto_20450 ?auto_20426 ) ) ( HOIST-AT ?auto_20449 ?auto_20450 ) ( AVAILABLE ?auto_20449 ) ( SURFACE-AT ?auto_20418 ?auto_20450 ) ( ON ?auto_20418 ?auto_20447 ) ( CLEAR ?auto_20418 ) ( not ( = ?auto_20417 ?auto_20418 ) ) ( not ( = ?auto_20417 ?auto_20447 ) ) ( not ( = ?auto_20418 ?auto_20447 ) ) ( not ( = ?auto_20427 ?auto_20449 ) ) ( IS-CRATE ?auto_20417 ) ( not ( = ?auto_20442 ?auto_20426 ) ) ( HOIST-AT ?auto_20443 ?auto_20442 ) ( SURFACE-AT ?auto_20417 ?auto_20442 ) ( ON ?auto_20417 ?auto_20439 ) ( CLEAR ?auto_20417 ) ( not ( = ?auto_20416 ?auto_20417 ) ) ( not ( = ?auto_20416 ?auto_20439 ) ) ( not ( = ?auto_20417 ?auto_20439 ) ) ( not ( = ?auto_20427 ?auto_20443 ) ) ( IS-CRATE ?auto_20416 ) ( SURFACE-AT ?auto_20416 ?auto_20442 ) ( ON ?auto_20416 ?auto_20433 ) ( CLEAR ?auto_20416 ) ( not ( = ?auto_20415 ?auto_20416 ) ) ( not ( = ?auto_20415 ?auto_20433 ) ) ( not ( = ?auto_20416 ?auto_20433 ) ) ( IS-CRATE ?auto_20415 ) ( not ( = ?auto_20436 ?auto_20426 ) ) ( HOIST-AT ?auto_20430 ?auto_20436 ) ( SURFACE-AT ?auto_20415 ?auto_20436 ) ( ON ?auto_20415 ?auto_20441 ) ( CLEAR ?auto_20415 ) ( not ( = ?auto_20414 ?auto_20415 ) ) ( not ( = ?auto_20414 ?auto_20441 ) ) ( not ( = ?auto_20415 ?auto_20441 ) ) ( not ( = ?auto_20427 ?auto_20430 ) ) ( IS-CRATE ?auto_20414 ) ( AVAILABLE ?auto_20430 ) ( SURFACE-AT ?auto_20414 ?auto_20436 ) ( ON ?auto_20414 ?auto_20435 ) ( CLEAR ?auto_20414 ) ( not ( = ?auto_20413 ?auto_20414 ) ) ( not ( = ?auto_20413 ?auto_20435 ) ) ( not ( = ?auto_20414 ?auto_20435 ) ) ( IS-CRATE ?auto_20413 ) ( not ( = ?auto_20440 ?auto_20426 ) ) ( HOIST-AT ?auto_20444 ?auto_20440 ) ( AVAILABLE ?auto_20444 ) ( SURFACE-AT ?auto_20413 ?auto_20440 ) ( ON ?auto_20413 ?auto_20429 ) ( CLEAR ?auto_20413 ) ( not ( = ?auto_20412 ?auto_20413 ) ) ( not ( = ?auto_20412 ?auto_20429 ) ) ( not ( = ?auto_20413 ?auto_20429 ) ) ( not ( = ?auto_20427 ?auto_20444 ) ) ( IS-CRATE ?auto_20412 ) ( not ( = ?auto_20446 ?auto_20426 ) ) ( HOIST-AT ?auto_20431 ?auto_20446 ) ( AVAILABLE ?auto_20431 ) ( SURFACE-AT ?auto_20412 ?auto_20446 ) ( ON ?auto_20412 ?auto_20434 ) ( CLEAR ?auto_20412 ) ( not ( = ?auto_20411 ?auto_20412 ) ) ( not ( = ?auto_20411 ?auto_20434 ) ) ( not ( = ?auto_20412 ?auto_20434 ) ) ( not ( = ?auto_20427 ?auto_20431 ) ) ( IS-CRATE ?auto_20411 ) ( AVAILABLE ?auto_20443 ) ( SURFACE-AT ?auto_20411 ?auto_20442 ) ( ON ?auto_20411 ?auto_20445 ) ( CLEAR ?auto_20411 ) ( not ( = ?auto_20410 ?auto_20411 ) ) ( not ( = ?auto_20410 ?auto_20445 ) ) ( not ( = ?auto_20411 ?auto_20445 ) ) ( SURFACE-AT ?auto_20409 ?auto_20426 ) ( CLEAR ?auto_20409 ) ( IS-CRATE ?auto_20410 ) ( AVAILABLE ?auto_20427 ) ( AVAILABLE ?auto_20432 ) ( SURFACE-AT ?auto_20410 ?auto_20438 ) ( ON ?auto_20410 ?auto_20428 ) ( CLEAR ?auto_20410 ) ( TRUCK-AT ?auto_20424 ?auto_20426 ) ( not ( = ?auto_20409 ?auto_20410 ) ) ( not ( = ?auto_20409 ?auto_20428 ) ) ( not ( = ?auto_20410 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20411 ) ) ( not ( = ?auto_20409 ?auto_20445 ) ) ( not ( = ?auto_20411 ?auto_20428 ) ) ( not ( = ?auto_20442 ?auto_20438 ) ) ( not ( = ?auto_20443 ?auto_20432 ) ) ( not ( = ?auto_20445 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20412 ) ) ( not ( = ?auto_20409 ?auto_20434 ) ) ( not ( = ?auto_20410 ?auto_20412 ) ) ( not ( = ?auto_20410 ?auto_20434 ) ) ( not ( = ?auto_20412 ?auto_20445 ) ) ( not ( = ?auto_20412 ?auto_20428 ) ) ( not ( = ?auto_20446 ?auto_20442 ) ) ( not ( = ?auto_20446 ?auto_20438 ) ) ( not ( = ?auto_20431 ?auto_20443 ) ) ( not ( = ?auto_20431 ?auto_20432 ) ) ( not ( = ?auto_20434 ?auto_20445 ) ) ( not ( = ?auto_20434 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20413 ) ) ( not ( = ?auto_20409 ?auto_20429 ) ) ( not ( = ?auto_20410 ?auto_20413 ) ) ( not ( = ?auto_20410 ?auto_20429 ) ) ( not ( = ?auto_20411 ?auto_20413 ) ) ( not ( = ?auto_20411 ?auto_20429 ) ) ( not ( = ?auto_20413 ?auto_20434 ) ) ( not ( = ?auto_20413 ?auto_20445 ) ) ( not ( = ?auto_20413 ?auto_20428 ) ) ( not ( = ?auto_20440 ?auto_20446 ) ) ( not ( = ?auto_20440 ?auto_20442 ) ) ( not ( = ?auto_20440 ?auto_20438 ) ) ( not ( = ?auto_20444 ?auto_20431 ) ) ( not ( = ?auto_20444 ?auto_20443 ) ) ( not ( = ?auto_20444 ?auto_20432 ) ) ( not ( = ?auto_20429 ?auto_20434 ) ) ( not ( = ?auto_20429 ?auto_20445 ) ) ( not ( = ?auto_20429 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20414 ) ) ( not ( = ?auto_20409 ?auto_20435 ) ) ( not ( = ?auto_20410 ?auto_20414 ) ) ( not ( = ?auto_20410 ?auto_20435 ) ) ( not ( = ?auto_20411 ?auto_20414 ) ) ( not ( = ?auto_20411 ?auto_20435 ) ) ( not ( = ?auto_20412 ?auto_20414 ) ) ( not ( = ?auto_20412 ?auto_20435 ) ) ( not ( = ?auto_20414 ?auto_20429 ) ) ( not ( = ?auto_20414 ?auto_20434 ) ) ( not ( = ?auto_20414 ?auto_20445 ) ) ( not ( = ?auto_20414 ?auto_20428 ) ) ( not ( = ?auto_20436 ?auto_20440 ) ) ( not ( = ?auto_20436 ?auto_20446 ) ) ( not ( = ?auto_20436 ?auto_20442 ) ) ( not ( = ?auto_20436 ?auto_20438 ) ) ( not ( = ?auto_20430 ?auto_20444 ) ) ( not ( = ?auto_20430 ?auto_20431 ) ) ( not ( = ?auto_20430 ?auto_20443 ) ) ( not ( = ?auto_20430 ?auto_20432 ) ) ( not ( = ?auto_20435 ?auto_20429 ) ) ( not ( = ?auto_20435 ?auto_20434 ) ) ( not ( = ?auto_20435 ?auto_20445 ) ) ( not ( = ?auto_20435 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20415 ) ) ( not ( = ?auto_20409 ?auto_20441 ) ) ( not ( = ?auto_20410 ?auto_20415 ) ) ( not ( = ?auto_20410 ?auto_20441 ) ) ( not ( = ?auto_20411 ?auto_20415 ) ) ( not ( = ?auto_20411 ?auto_20441 ) ) ( not ( = ?auto_20412 ?auto_20415 ) ) ( not ( = ?auto_20412 ?auto_20441 ) ) ( not ( = ?auto_20413 ?auto_20415 ) ) ( not ( = ?auto_20413 ?auto_20441 ) ) ( not ( = ?auto_20415 ?auto_20435 ) ) ( not ( = ?auto_20415 ?auto_20429 ) ) ( not ( = ?auto_20415 ?auto_20434 ) ) ( not ( = ?auto_20415 ?auto_20445 ) ) ( not ( = ?auto_20415 ?auto_20428 ) ) ( not ( = ?auto_20441 ?auto_20435 ) ) ( not ( = ?auto_20441 ?auto_20429 ) ) ( not ( = ?auto_20441 ?auto_20434 ) ) ( not ( = ?auto_20441 ?auto_20445 ) ) ( not ( = ?auto_20441 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20416 ) ) ( not ( = ?auto_20409 ?auto_20433 ) ) ( not ( = ?auto_20410 ?auto_20416 ) ) ( not ( = ?auto_20410 ?auto_20433 ) ) ( not ( = ?auto_20411 ?auto_20416 ) ) ( not ( = ?auto_20411 ?auto_20433 ) ) ( not ( = ?auto_20412 ?auto_20416 ) ) ( not ( = ?auto_20412 ?auto_20433 ) ) ( not ( = ?auto_20413 ?auto_20416 ) ) ( not ( = ?auto_20413 ?auto_20433 ) ) ( not ( = ?auto_20414 ?auto_20416 ) ) ( not ( = ?auto_20414 ?auto_20433 ) ) ( not ( = ?auto_20416 ?auto_20441 ) ) ( not ( = ?auto_20416 ?auto_20435 ) ) ( not ( = ?auto_20416 ?auto_20429 ) ) ( not ( = ?auto_20416 ?auto_20434 ) ) ( not ( = ?auto_20416 ?auto_20445 ) ) ( not ( = ?auto_20416 ?auto_20428 ) ) ( not ( = ?auto_20433 ?auto_20441 ) ) ( not ( = ?auto_20433 ?auto_20435 ) ) ( not ( = ?auto_20433 ?auto_20429 ) ) ( not ( = ?auto_20433 ?auto_20434 ) ) ( not ( = ?auto_20433 ?auto_20445 ) ) ( not ( = ?auto_20433 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20417 ) ) ( not ( = ?auto_20409 ?auto_20439 ) ) ( not ( = ?auto_20410 ?auto_20417 ) ) ( not ( = ?auto_20410 ?auto_20439 ) ) ( not ( = ?auto_20411 ?auto_20417 ) ) ( not ( = ?auto_20411 ?auto_20439 ) ) ( not ( = ?auto_20412 ?auto_20417 ) ) ( not ( = ?auto_20412 ?auto_20439 ) ) ( not ( = ?auto_20413 ?auto_20417 ) ) ( not ( = ?auto_20413 ?auto_20439 ) ) ( not ( = ?auto_20414 ?auto_20417 ) ) ( not ( = ?auto_20414 ?auto_20439 ) ) ( not ( = ?auto_20415 ?auto_20417 ) ) ( not ( = ?auto_20415 ?auto_20439 ) ) ( not ( = ?auto_20417 ?auto_20433 ) ) ( not ( = ?auto_20417 ?auto_20441 ) ) ( not ( = ?auto_20417 ?auto_20435 ) ) ( not ( = ?auto_20417 ?auto_20429 ) ) ( not ( = ?auto_20417 ?auto_20434 ) ) ( not ( = ?auto_20417 ?auto_20445 ) ) ( not ( = ?auto_20417 ?auto_20428 ) ) ( not ( = ?auto_20439 ?auto_20433 ) ) ( not ( = ?auto_20439 ?auto_20441 ) ) ( not ( = ?auto_20439 ?auto_20435 ) ) ( not ( = ?auto_20439 ?auto_20429 ) ) ( not ( = ?auto_20439 ?auto_20434 ) ) ( not ( = ?auto_20439 ?auto_20445 ) ) ( not ( = ?auto_20439 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20418 ) ) ( not ( = ?auto_20409 ?auto_20447 ) ) ( not ( = ?auto_20410 ?auto_20418 ) ) ( not ( = ?auto_20410 ?auto_20447 ) ) ( not ( = ?auto_20411 ?auto_20418 ) ) ( not ( = ?auto_20411 ?auto_20447 ) ) ( not ( = ?auto_20412 ?auto_20418 ) ) ( not ( = ?auto_20412 ?auto_20447 ) ) ( not ( = ?auto_20413 ?auto_20418 ) ) ( not ( = ?auto_20413 ?auto_20447 ) ) ( not ( = ?auto_20414 ?auto_20418 ) ) ( not ( = ?auto_20414 ?auto_20447 ) ) ( not ( = ?auto_20415 ?auto_20418 ) ) ( not ( = ?auto_20415 ?auto_20447 ) ) ( not ( = ?auto_20416 ?auto_20418 ) ) ( not ( = ?auto_20416 ?auto_20447 ) ) ( not ( = ?auto_20418 ?auto_20439 ) ) ( not ( = ?auto_20418 ?auto_20433 ) ) ( not ( = ?auto_20418 ?auto_20441 ) ) ( not ( = ?auto_20418 ?auto_20435 ) ) ( not ( = ?auto_20418 ?auto_20429 ) ) ( not ( = ?auto_20418 ?auto_20434 ) ) ( not ( = ?auto_20418 ?auto_20445 ) ) ( not ( = ?auto_20418 ?auto_20428 ) ) ( not ( = ?auto_20450 ?auto_20442 ) ) ( not ( = ?auto_20450 ?auto_20436 ) ) ( not ( = ?auto_20450 ?auto_20440 ) ) ( not ( = ?auto_20450 ?auto_20446 ) ) ( not ( = ?auto_20450 ?auto_20438 ) ) ( not ( = ?auto_20449 ?auto_20443 ) ) ( not ( = ?auto_20449 ?auto_20430 ) ) ( not ( = ?auto_20449 ?auto_20444 ) ) ( not ( = ?auto_20449 ?auto_20431 ) ) ( not ( = ?auto_20449 ?auto_20432 ) ) ( not ( = ?auto_20447 ?auto_20439 ) ) ( not ( = ?auto_20447 ?auto_20433 ) ) ( not ( = ?auto_20447 ?auto_20441 ) ) ( not ( = ?auto_20447 ?auto_20435 ) ) ( not ( = ?auto_20447 ?auto_20429 ) ) ( not ( = ?auto_20447 ?auto_20434 ) ) ( not ( = ?auto_20447 ?auto_20445 ) ) ( not ( = ?auto_20447 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20419 ) ) ( not ( = ?auto_20409 ?auto_20437 ) ) ( not ( = ?auto_20410 ?auto_20419 ) ) ( not ( = ?auto_20410 ?auto_20437 ) ) ( not ( = ?auto_20411 ?auto_20419 ) ) ( not ( = ?auto_20411 ?auto_20437 ) ) ( not ( = ?auto_20412 ?auto_20419 ) ) ( not ( = ?auto_20412 ?auto_20437 ) ) ( not ( = ?auto_20413 ?auto_20419 ) ) ( not ( = ?auto_20413 ?auto_20437 ) ) ( not ( = ?auto_20414 ?auto_20419 ) ) ( not ( = ?auto_20414 ?auto_20437 ) ) ( not ( = ?auto_20415 ?auto_20419 ) ) ( not ( = ?auto_20415 ?auto_20437 ) ) ( not ( = ?auto_20416 ?auto_20419 ) ) ( not ( = ?auto_20416 ?auto_20437 ) ) ( not ( = ?auto_20417 ?auto_20419 ) ) ( not ( = ?auto_20417 ?auto_20437 ) ) ( not ( = ?auto_20419 ?auto_20447 ) ) ( not ( = ?auto_20419 ?auto_20439 ) ) ( not ( = ?auto_20419 ?auto_20433 ) ) ( not ( = ?auto_20419 ?auto_20441 ) ) ( not ( = ?auto_20419 ?auto_20435 ) ) ( not ( = ?auto_20419 ?auto_20429 ) ) ( not ( = ?auto_20419 ?auto_20434 ) ) ( not ( = ?auto_20419 ?auto_20445 ) ) ( not ( = ?auto_20419 ?auto_20428 ) ) ( not ( = ?auto_20422 ?auto_20450 ) ) ( not ( = ?auto_20422 ?auto_20442 ) ) ( not ( = ?auto_20422 ?auto_20436 ) ) ( not ( = ?auto_20422 ?auto_20440 ) ) ( not ( = ?auto_20422 ?auto_20446 ) ) ( not ( = ?auto_20422 ?auto_20438 ) ) ( not ( = ?auto_20425 ?auto_20449 ) ) ( not ( = ?auto_20425 ?auto_20443 ) ) ( not ( = ?auto_20425 ?auto_20430 ) ) ( not ( = ?auto_20425 ?auto_20444 ) ) ( not ( = ?auto_20425 ?auto_20431 ) ) ( not ( = ?auto_20425 ?auto_20432 ) ) ( not ( = ?auto_20437 ?auto_20447 ) ) ( not ( = ?auto_20437 ?auto_20439 ) ) ( not ( = ?auto_20437 ?auto_20433 ) ) ( not ( = ?auto_20437 ?auto_20441 ) ) ( not ( = ?auto_20437 ?auto_20435 ) ) ( not ( = ?auto_20437 ?auto_20429 ) ) ( not ( = ?auto_20437 ?auto_20434 ) ) ( not ( = ?auto_20437 ?auto_20445 ) ) ( not ( = ?auto_20437 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20420 ) ) ( not ( = ?auto_20409 ?auto_20448 ) ) ( not ( = ?auto_20410 ?auto_20420 ) ) ( not ( = ?auto_20410 ?auto_20448 ) ) ( not ( = ?auto_20411 ?auto_20420 ) ) ( not ( = ?auto_20411 ?auto_20448 ) ) ( not ( = ?auto_20412 ?auto_20420 ) ) ( not ( = ?auto_20412 ?auto_20448 ) ) ( not ( = ?auto_20413 ?auto_20420 ) ) ( not ( = ?auto_20413 ?auto_20448 ) ) ( not ( = ?auto_20414 ?auto_20420 ) ) ( not ( = ?auto_20414 ?auto_20448 ) ) ( not ( = ?auto_20415 ?auto_20420 ) ) ( not ( = ?auto_20415 ?auto_20448 ) ) ( not ( = ?auto_20416 ?auto_20420 ) ) ( not ( = ?auto_20416 ?auto_20448 ) ) ( not ( = ?auto_20417 ?auto_20420 ) ) ( not ( = ?auto_20417 ?auto_20448 ) ) ( not ( = ?auto_20418 ?auto_20420 ) ) ( not ( = ?auto_20418 ?auto_20448 ) ) ( not ( = ?auto_20420 ?auto_20437 ) ) ( not ( = ?auto_20420 ?auto_20447 ) ) ( not ( = ?auto_20420 ?auto_20439 ) ) ( not ( = ?auto_20420 ?auto_20433 ) ) ( not ( = ?auto_20420 ?auto_20441 ) ) ( not ( = ?auto_20420 ?auto_20435 ) ) ( not ( = ?auto_20420 ?auto_20429 ) ) ( not ( = ?auto_20420 ?auto_20434 ) ) ( not ( = ?auto_20420 ?auto_20445 ) ) ( not ( = ?auto_20420 ?auto_20428 ) ) ( not ( = ?auto_20448 ?auto_20437 ) ) ( not ( = ?auto_20448 ?auto_20447 ) ) ( not ( = ?auto_20448 ?auto_20439 ) ) ( not ( = ?auto_20448 ?auto_20433 ) ) ( not ( = ?auto_20448 ?auto_20441 ) ) ( not ( = ?auto_20448 ?auto_20435 ) ) ( not ( = ?auto_20448 ?auto_20429 ) ) ( not ( = ?auto_20448 ?auto_20434 ) ) ( not ( = ?auto_20448 ?auto_20445 ) ) ( not ( = ?auto_20448 ?auto_20428 ) ) ( not ( = ?auto_20409 ?auto_20421 ) ) ( not ( = ?auto_20409 ?auto_20423 ) ) ( not ( = ?auto_20410 ?auto_20421 ) ) ( not ( = ?auto_20410 ?auto_20423 ) ) ( not ( = ?auto_20411 ?auto_20421 ) ) ( not ( = ?auto_20411 ?auto_20423 ) ) ( not ( = ?auto_20412 ?auto_20421 ) ) ( not ( = ?auto_20412 ?auto_20423 ) ) ( not ( = ?auto_20413 ?auto_20421 ) ) ( not ( = ?auto_20413 ?auto_20423 ) ) ( not ( = ?auto_20414 ?auto_20421 ) ) ( not ( = ?auto_20414 ?auto_20423 ) ) ( not ( = ?auto_20415 ?auto_20421 ) ) ( not ( = ?auto_20415 ?auto_20423 ) ) ( not ( = ?auto_20416 ?auto_20421 ) ) ( not ( = ?auto_20416 ?auto_20423 ) ) ( not ( = ?auto_20417 ?auto_20421 ) ) ( not ( = ?auto_20417 ?auto_20423 ) ) ( not ( = ?auto_20418 ?auto_20421 ) ) ( not ( = ?auto_20418 ?auto_20423 ) ) ( not ( = ?auto_20419 ?auto_20421 ) ) ( not ( = ?auto_20419 ?auto_20423 ) ) ( not ( = ?auto_20421 ?auto_20448 ) ) ( not ( = ?auto_20421 ?auto_20437 ) ) ( not ( = ?auto_20421 ?auto_20447 ) ) ( not ( = ?auto_20421 ?auto_20439 ) ) ( not ( = ?auto_20421 ?auto_20433 ) ) ( not ( = ?auto_20421 ?auto_20441 ) ) ( not ( = ?auto_20421 ?auto_20435 ) ) ( not ( = ?auto_20421 ?auto_20429 ) ) ( not ( = ?auto_20421 ?auto_20434 ) ) ( not ( = ?auto_20421 ?auto_20445 ) ) ( not ( = ?auto_20421 ?auto_20428 ) ) ( not ( = ?auto_20423 ?auto_20448 ) ) ( not ( = ?auto_20423 ?auto_20437 ) ) ( not ( = ?auto_20423 ?auto_20447 ) ) ( not ( = ?auto_20423 ?auto_20439 ) ) ( not ( = ?auto_20423 ?auto_20433 ) ) ( not ( = ?auto_20423 ?auto_20441 ) ) ( not ( = ?auto_20423 ?auto_20435 ) ) ( not ( = ?auto_20423 ?auto_20429 ) ) ( not ( = ?auto_20423 ?auto_20434 ) ) ( not ( = ?auto_20423 ?auto_20445 ) ) ( not ( = ?auto_20423 ?auto_20428 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20414 ?auto_20415 ?auto_20416 ?auto_20417 ?auto_20418 ?auto_20419 ?auto_20420 )
      ( MAKE-1CRATE ?auto_20420 ?auto_20421 )
      ( MAKE-12CRATE-VERIFY ?auto_20409 ?auto_20410 ?auto_20411 ?auto_20412 ?auto_20413 ?auto_20414 ?auto_20415 ?auto_20416 ?auto_20417 ?auto_20418 ?auto_20419 ?auto_20420 ?auto_20421 ) )
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
      ?auto_20482 - SURFACE
      ?auto_20483 - SURFACE
      ?auto_20484 - SURFACE
      ?auto_20485 - SURFACE
      ?auto_20486 - SURFACE
      ?auto_20487 - SURFACE
      ?auto_20488 - SURFACE
    )
    :vars
    (
      ?auto_20494 - HOIST
      ?auto_20490 - PLACE
      ?auto_20491 - PLACE
      ?auto_20493 - HOIST
      ?auto_20492 - SURFACE
      ?auto_20517 - PLACE
      ?auto_20504 - HOIST
      ?auto_20499 - SURFACE
      ?auto_20500 - PLACE
      ?auto_20508 - HOIST
      ?auto_20511 - SURFACE
      ?auto_20497 - SURFACE
      ?auto_20505 - PLACE
      ?auto_20501 - HOIST
      ?auto_20509 - SURFACE
      ?auto_20507 - PLACE
      ?auto_20512 - HOIST
      ?auto_20518 - SURFACE
      ?auto_20495 - SURFACE
      ?auto_20506 - PLACE
      ?auto_20496 - HOIST
      ?auto_20516 - SURFACE
      ?auto_20503 - SURFACE
      ?auto_20513 - SURFACE
      ?auto_20502 - PLACE
      ?auto_20498 - HOIST
      ?auto_20510 - SURFACE
      ?auto_20514 - SURFACE
      ?auto_20515 - SURFACE
      ?auto_20489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20494 ?auto_20490 ) ( IS-CRATE ?auto_20488 ) ( not ( = ?auto_20491 ?auto_20490 ) ) ( HOIST-AT ?auto_20493 ?auto_20491 ) ( SURFACE-AT ?auto_20488 ?auto_20491 ) ( ON ?auto_20488 ?auto_20492 ) ( CLEAR ?auto_20488 ) ( not ( = ?auto_20487 ?auto_20488 ) ) ( not ( = ?auto_20487 ?auto_20492 ) ) ( not ( = ?auto_20488 ?auto_20492 ) ) ( not ( = ?auto_20494 ?auto_20493 ) ) ( IS-CRATE ?auto_20487 ) ( not ( = ?auto_20517 ?auto_20490 ) ) ( HOIST-AT ?auto_20504 ?auto_20517 ) ( SURFACE-AT ?auto_20487 ?auto_20517 ) ( ON ?auto_20487 ?auto_20499 ) ( CLEAR ?auto_20487 ) ( not ( = ?auto_20486 ?auto_20487 ) ) ( not ( = ?auto_20486 ?auto_20499 ) ) ( not ( = ?auto_20487 ?auto_20499 ) ) ( not ( = ?auto_20494 ?auto_20504 ) ) ( IS-CRATE ?auto_20486 ) ( not ( = ?auto_20500 ?auto_20490 ) ) ( HOIST-AT ?auto_20508 ?auto_20500 ) ( SURFACE-AT ?auto_20486 ?auto_20500 ) ( ON ?auto_20486 ?auto_20511 ) ( CLEAR ?auto_20486 ) ( not ( = ?auto_20485 ?auto_20486 ) ) ( not ( = ?auto_20485 ?auto_20511 ) ) ( not ( = ?auto_20486 ?auto_20511 ) ) ( not ( = ?auto_20494 ?auto_20508 ) ) ( IS-CRATE ?auto_20485 ) ( AVAILABLE ?auto_20504 ) ( SURFACE-AT ?auto_20485 ?auto_20517 ) ( ON ?auto_20485 ?auto_20497 ) ( CLEAR ?auto_20485 ) ( not ( = ?auto_20484 ?auto_20485 ) ) ( not ( = ?auto_20484 ?auto_20497 ) ) ( not ( = ?auto_20485 ?auto_20497 ) ) ( IS-CRATE ?auto_20484 ) ( not ( = ?auto_20505 ?auto_20490 ) ) ( HOIST-AT ?auto_20501 ?auto_20505 ) ( AVAILABLE ?auto_20501 ) ( SURFACE-AT ?auto_20484 ?auto_20505 ) ( ON ?auto_20484 ?auto_20509 ) ( CLEAR ?auto_20484 ) ( not ( = ?auto_20483 ?auto_20484 ) ) ( not ( = ?auto_20483 ?auto_20509 ) ) ( not ( = ?auto_20484 ?auto_20509 ) ) ( not ( = ?auto_20494 ?auto_20501 ) ) ( IS-CRATE ?auto_20483 ) ( not ( = ?auto_20507 ?auto_20490 ) ) ( HOIST-AT ?auto_20512 ?auto_20507 ) ( SURFACE-AT ?auto_20483 ?auto_20507 ) ( ON ?auto_20483 ?auto_20518 ) ( CLEAR ?auto_20483 ) ( not ( = ?auto_20482 ?auto_20483 ) ) ( not ( = ?auto_20482 ?auto_20518 ) ) ( not ( = ?auto_20483 ?auto_20518 ) ) ( not ( = ?auto_20494 ?auto_20512 ) ) ( IS-CRATE ?auto_20482 ) ( SURFACE-AT ?auto_20482 ?auto_20507 ) ( ON ?auto_20482 ?auto_20495 ) ( CLEAR ?auto_20482 ) ( not ( = ?auto_20481 ?auto_20482 ) ) ( not ( = ?auto_20481 ?auto_20495 ) ) ( not ( = ?auto_20482 ?auto_20495 ) ) ( IS-CRATE ?auto_20481 ) ( not ( = ?auto_20506 ?auto_20490 ) ) ( HOIST-AT ?auto_20496 ?auto_20506 ) ( SURFACE-AT ?auto_20481 ?auto_20506 ) ( ON ?auto_20481 ?auto_20516 ) ( CLEAR ?auto_20481 ) ( not ( = ?auto_20480 ?auto_20481 ) ) ( not ( = ?auto_20480 ?auto_20516 ) ) ( not ( = ?auto_20481 ?auto_20516 ) ) ( not ( = ?auto_20494 ?auto_20496 ) ) ( IS-CRATE ?auto_20480 ) ( AVAILABLE ?auto_20496 ) ( SURFACE-AT ?auto_20480 ?auto_20506 ) ( ON ?auto_20480 ?auto_20503 ) ( CLEAR ?auto_20480 ) ( not ( = ?auto_20479 ?auto_20480 ) ) ( not ( = ?auto_20479 ?auto_20503 ) ) ( not ( = ?auto_20480 ?auto_20503 ) ) ( IS-CRATE ?auto_20479 ) ( AVAILABLE ?auto_20493 ) ( SURFACE-AT ?auto_20479 ?auto_20491 ) ( ON ?auto_20479 ?auto_20513 ) ( CLEAR ?auto_20479 ) ( not ( = ?auto_20478 ?auto_20479 ) ) ( not ( = ?auto_20478 ?auto_20513 ) ) ( not ( = ?auto_20479 ?auto_20513 ) ) ( IS-CRATE ?auto_20478 ) ( not ( = ?auto_20502 ?auto_20490 ) ) ( HOIST-AT ?auto_20498 ?auto_20502 ) ( AVAILABLE ?auto_20498 ) ( SURFACE-AT ?auto_20478 ?auto_20502 ) ( ON ?auto_20478 ?auto_20510 ) ( CLEAR ?auto_20478 ) ( not ( = ?auto_20477 ?auto_20478 ) ) ( not ( = ?auto_20477 ?auto_20510 ) ) ( not ( = ?auto_20478 ?auto_20510 ) ) ( not ( = ?auto_20494 ?auto_20498 ) ) ( IS-CRATE ?auto_20477 ) ( AVAILABLE ?auto_20512 ) ( SURFACE-AT ?auto_20477 ?auto_20507 ) ( ON ?auto_20477 ?auto_20514 ) ( CLEAR ?auto_20477 ) ( not ( = ?auto_20476 ?auto_20477 ) ) ( not ( = ?auto_20476 ?auto_20514 ) ) ( not ( = ?auto_20477 ?auto_20514 ) ) ( SURFACE-AT ?auto_20475 ?auto_20490 ) ( CLEAR ?auto_20475 ) ( IS-CRATE ?auto_20476 ) ( AVAILABLE ?auto_20494 ) ( AVAILABLE ?auto_20508 ) ( SURFACE-AT ?auto_20476 ?auto_20500 ) ( ON ?auto_20476 ?auto_20515 ) ( CLEAR ?auto_20476 ) ( TRUCK-AT ?auto_20489 ?auto_20490 ) ( not ( = ?auto_20475 ?auto_20476 ) ) ( not ( = ?auto_20475 ?auto_20515 ) ) ( not ( = ?auto_20476 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20477 ) ) ( not ( = ?auto_20475 ?auto_20514 ) ) ( not ( = ?auto_20477 ?auto_20515 ) ) ( not ( = ?auto_20507 ?auto_20500 ) ) ( not ( = ?auto_20512 ?auto_20508 ) ) ( not ( = ?auto_20514 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20478 ) ) ( not ( = ?auto_20475 ?auto_20510 ) ) ( not ( = ?auto_20476 ?auto_20478 ) ) ( not ( = ?auto_20476 ?auto_20510 ) ) ( not ( = ?auto_20478 ?auto_20514 ) ) ( not ( = ?auto_20478 ?auto_20515 ) ) ( not ( = ?auto_20502 ?auto_20507 ) ) ( not ( = ?auto_20502 ?auto_20500 ) ) ( not ( = ?auto_20498 ?auto_20512 ) ) ( not ( = ?auto_20498 ?auto_20508 ) ) ( not ( = ?auto_20510 ?auto_20514 ) ) ( not ( = ?auto_20510 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20479 ) ) ( not ( = ?auto_20475 ?auto_20513 ) ) ( not ( = ?auto_20476 ?auto_20479 ) ) ( not ( = ?auto_20476 ?auto_20513 ) ) ( not ( = ?auto_20477 ?auto_20479 ) ) ( not ( = ?auto_20477 ?auto_20513 ) ) ( not ( = ?auto_20479 ?auto_20510 ) ) ( not ( = ?auto_20479 ?auto_20514 ) ) ( not ( = ?auto_20479 ?auto_20515 ) ) ( not ( = ?auto_20491 ?auto_20502 ) ) ( not ( = ?auto_20491 ?auto_20507 ) ) ( not ( = ?auto_20491 ?auto_20500 ) ) ( not ( = ?auto_20493 ?auto_20498 ) ) ( not ( = ?auto_20493 ?auto_20512 ) ) ( not ( = ?auto_20493 ?auto_20508 ) ) ( not ( = ?auto_20513 ?auto_20510 ) ) ( not ( = ?auto_20513 ?auto_20514 ) ) ( not ( = ?auto_20513 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20480 ) ) ( not ( = ?auto_20475 ?auto_20503 ) ) ( not ( = ?auto_20476 ?auto_20480 ) ) ( not ( = ?auto_20476 ?auto_20503 ) ) ( not ( = ?auto_20477 ?auto_20480 ) ) ( not ( = ?auto_20477 ?auto_20503 ) ) ( not ( = ?auto_20478 ?auto_20480 ) ) ( not ( = ?auto_20478 ?auto_20503 ) ) ( not ( = ?auto_20480 ?auto_20513 ) ) ( not ( = ?auto_20480 ?auto_20510 ) ) ( not ( = ?auto_20480 ?auto_20514 ) ) ( not ( = ?auto_20480 ?auto_20515 ) ) ( not ( = ?auto_20506 ?auto_20491 ) ) ( not ( = ?auto_20506 ?auto_20502 ) ) ( not ( = ?auto_20506 ?auto_20507 ) ) ( not ( = ?auto_20506 ?auto_20500 ) ) ( not ( = ?auto_20496 ?auto_20493 ) ) ( not ( = ?auto_20496 ?auto_20498 ) ) ( not ( = ?auto_20496 ?auto_20512 ) ) ( not ( = ?auto_20496 ?auto_20508 ) ) ( not ( = ?auto_20503 ?auto_20513 ) ) ( not ( = ?auto_20503 ?auto_20510 ) ) ( not ( = ?auto_20503 ?auto_20514 ) ) ( not ( = ?auto_20503 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20481 ) ) ( not ( = ?auto_20475 ?auto_20516 ) ) ( not ( = ?auto_20476 ?auto_20481 ) ) ( not ( = ?auto_20476 ?auto_20516 ) ) ( not ( = ?auto_20477 ?auto_20481 ) ) ( not ( = ?auto_20477 ?auto_20516 ) ) ( not ( = ?auto_20478 ?auto_20481 ) ) ( not ( = ?auto_20478 ?auto_20516 ) ) ( not ( = ?auto_20479 ?auto_20481 ) ) ( not ( = ?auto_20479 ?auto_20516 ) ) ( not ( = ?auto_20481 ?auto_20503 ) ) ( not ( = ?auto_20481 ?auto_20513 ) ) ( not ( = ?auto_20481 ?auto_20510 ) ) ( not ( = ?auto_20481 ?auto_20514 ) ) ( not ( = ?auto_20481 ?auto_20515 ) ) ( not ( = ?auto_20516 ?auto_20503 ) ) ( not ( = ?auto_20516 ?auto_20513 ) ) ( not ( = ?auto_20516 ?auto_20510 ) ) ( not ( = ?auto_20516 ?auto_20514 ) ) ( not ( = ?auto_20516 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20482 ) ) ( not ( = ?auto_20475 ?auto_20495 ) ) ( not ( = ?auto_20476 ?auto_20482 ) ) ( not ( = ?auto_20476 ?auto_20495 ) ) ( not ( = ?auto_20477 ?auto_20482 ) ) ( not ( = ?auto_20477 ?auto_20495 ) ) ( not ( = ?auto_20478 ?auto_20482 ) ) ( not ( = ?auto_20478 ?auto_20495 ) ) ( not ( = ?auto_20479 ?auto_20482 ) ) ( not ( = ?auto_20479 ?auto_20495 ) ) ( not ( = ?auto_20480 ?auto_20482 ) ) ( not ( = ?auto_20480 ?auto_20495 ) ) ( not ( = ?auto_20482 ?auto_20516 ) ) ( not ( = ?auto_20482 ?auto_20503 ) ) ( not ( = ?auto_20482 ?auto_20513 ) ) ( not ( = ?auto_20482 ?auto_20510 ) ) ( not ( = ?auto_20482 ?auto_20514 ) ) ( not ( = ?auto_20482 ?auto_20515 ) ) ( not ( = ?auto_20495 ?auto_20516 ) ) ( not ( = ?auto_20495 ?auto_20503 ) ) ( not ( = ?auto_20495 ?auto_20513 ) ) ( not ( = ?auto_20495 ?auto_20510 ) ) ( not ( = ?auto_20495 ?auto_20514 ) ) ( not ( = ?auto_20495 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20483 ) ) ( not ( = ?auto_20475 ?auto_20518 ) ) ( not ( = ?auto_20476 ?auto_20483 ) ) ( not ( = ?auto_20476 ?auto_20518 ) ) ( not ( = ?auto_20477 ?auto_20483 ) ) ( not ( = ?auto_20477 ?auto_20518 ) ) ( not ( = ?auto_20478 ?auto_20483 ) ) ( not ( = ?auto_20478 ?auto_20518 ) ) ( not ( = ?auto_20479 ?auto_20483 ) ) ( not ( = ?auto_20479 ?auto_20518 ) ) ( not ( = ?auto_20480 ?auto_20483 ) ) ( not ( = ?auto_20480 ?auto_20518 ) ) ( not ( = ?auto_20481 ?auto_20483 ) ) ( not ( = ?auto_20481 ?auto_20518 ) ) ( not ( = ?auto_20483 ?auto_20495 ) ) ( not ( = ?auto_20483 ?auto_20516 ) ) ( not ( = ?auto_20483 ?auto_20503 ) ) ( not ( = ?auto_20483 ?auto_20513 ) ) ( not ( = ?auto_20483 ?auto_20510 ) ) ( not ( = ?auto_20483 ?auto_20514 ) ) ( not ( = ?auto_20483 ?auto_20515 ) ) ( not ( = ?auto_20518 ?auto_20495 ) ) ( not ( = ?auto_20518 ?auto_20516 ) ) ( not ( = ?auto_20518 ?auto_20503 ) ) ( not ( = ?auto_20518 ?auto_20513 ) ) ( not ( = ?auto_20518 ?auto_20510 ) ) ( not ( = ?auto_20518 ?auto_20514 ) ) ( not ( = ?auto_20518 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20484 ) ) ( not ( = ?auto_20475 ?auto_20509 ) ) ( not ( = ?auto_20476 ?auto_20484 ) ) ( not ( = ?auto_20476 ?auto_20509 ) ) ( not ( = ?auto_20477 ?auto_20484 ) ) ( not ( = ?auto_20477 ?auto_20509 ) ) ( not ( = ?auto_20478 ?auto_20484 ) ) ( not ( = ?auto_20478 ?auto_20509 ) ) ( not ( = ?auto_20479 ?auto_20484 ) ) ( not ( = ?auto_20479 ?auto_20509 ) ) ( not ( = ?auto_20480 ?auto_20484 ) ) ( not ( = ?auto_20480 ?auto_20509 ) ) ( not ( = ?auto_20481 ?auto_20484 ) ) ( not ( = ?auto_20481 ?auto_20509 ) ) ( not ( = ?auto_20482 ?auto_20484 ) ) ( not ( = ?auto_20482 ?auto_20509 ) ) ( not ( = ?auto_20484 ?auto_20518 ) ) ( not ( = ?auto_20484 ?auto_20495 ) ) ( not ( = ?auto_20484 ?auto_20516 ) ) ( not ( = ?auto_20484 ?auto_20503 ) ) ( not ( = ?auto_20484 ?auto_20513 ) ) ( not ( = ?auto_20484 ?auto_20510 ) ) ( not ( = ?auto_20484 ?auto_20514 ) ) ( not ( = ?auto_20484 ?auto_20515 ) ) ( not ( = ?auto_20505 ?auto_20507 ) ) ( not ( = ?auto_20505 ?auto_20506 ) ) ( not ( = ?auto_20505 ?auto_20491 ) ) ( not ( = ?auto_20505 ?auto_20502 ) ) ( not ( = ?auto_20505 ?auto_20500 ) ) ( not ( = ?auto_20501 ?auto_20512 ) ) ( not ( = ?auto_20501 ?auto_20496 ) ) ( not ( = ?auto_20501 ?auto_20493 ) ) ( not ( = ?auto_20501 ?auto_20498 ) ) ( not ( = ?auto_20501 ?auto_20508 ) ) ( not ( = ?auto_20509 ?auto_20518 ) ) ( not ( = ?auto_20509 ?auto_20495 ) ) ( not ( = ?auto_20509 ?auto_20516 ) ) ( not ( = ?auto_20509 ?auto_20503 ) ) ( not ( = ?auto_20509 ?auto_20513 ) ) ( not ( = ?auto_20509 ?auto_20510 ) ) ( not ( = ?auto_20509 ?auto_20514 ) ) ( not ( = ?auto_20509 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20485 ) ) ( not ( = ?auto_20475 ?auto_20497 ) ) ( not ( = ?auto_20476 ?auto_20485 ) ) ( not ( = ?auto_20476 ?auto_20497 ) ) ( not ( = ?auto_20477 ?auto_20485 ) ) ( not ( = ?auto_20477 ?auto_20497 ) ) ( not ( = ?auto_20478 ?auto_20485 ) ) ( not ( = ?auto_20478 ?auto_20497 ) ) ( not ( = ?auto_20479 ?auto_20485 ) ) ( not ( = ?auto_20479 ?auto_20497 ) ) ( not ( = ?auto_20480 ?auto_20485 ) ) ( not ( = ?auto_20480 ?auto_20497 ) ) ( not ( = ?auto_20481 ?auto_20485 ) ) ( not ( = ?auto_20481 ?auto_20497 ) ) ( not ( = ?auto_20482 ?auto_20485 ) ) ( not ( = ?auto_20482 ?auto_20497 ) ) ( not ( = ?auto_20483 ?auto_20485 ) ) ( not ( = ?auto_20483 ?auto_20497 ) ) ( not ( = ?auto_20485 ?auto_20509 ) ) ( not ( = ?auto_20485 ?auto_20518 ) ) ( not ( = ?auto_20485 ?auto_20495 ) ) ( not ( = ?auto_20485 ?auto_20516 ) ) ( not ( = ?auto_20485 ?auto_20503 ) ) ( not ( = ?auto_20485 ?auto_20513 ) ) ( not ( = ?auto_20485 ?auto_20510 ) ) ( not ( = ?auto_20485 ?auto_20514 ) ) ( not ( = ?auto_20485 ?auto_20515 ) ) ( not ( = ?auto_20517 ?auto_20505 ) ) ( not ( = ?auto_20517 ?auto_20507 ) ) ( not ( = ?auto_20517 ?auto_20506 ) ) ( not ( = ?auto_20517 ?auto_20491 ) ) ( not ( = ?auto_20517 ?auto_20502 ) ) ( not ( = ?auto_20517 ?auto_20500 ) ) ( not ( = ?auto_20504 ?auto_20501 ) ) ( not ( = ?auto_20504 ?auto_20512 ) ) ( not ( = ?auto_20504 ?auto_20496 ) ) ( not ( = ?auto_20504 ?auto_20493 ) ) ( not ( = ?auto_20504 ?auto_20498 ) ) ( not ( = ?auto_20504 ?auto_20508 ) ) ( not ( = ?auto_20497 ?auto_20509 ) ) ( not ( = ?auto_20497 ?auto_20518 ) ) ( not ( = ?auto_20497 ?auto_20495 ) ) ( not ( = ?auto_20497 ?auto_20516 ) ) ( not ( = ?auto_20497 ?auto_20503 ) ) ( not ( = ?auto_20497 ?auto_20513 ) ) ( not ( = ?auto_20497 ?auto_20510 ) ) ( not ( = ?auto_20497 ?auto_20514 ) ) ( not ( = ?auto_20497 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20486 ) ) ( not ( = ?auto_20475 ?auto_20511 ) ) ( not ( = ?auto_20476 ?auto_20486 ) ) ( not ( = ?auto_20476 ?auto_20511 ) ) ( not ( = ?auto_20477 ?auto_20486 ) ) ( not ( = ?auto_20477 ?auto_20511 ) ) ( not ( = ?auto_20478 ?auto_20486 ) ) ( not ( = ?auto_20478 ?auto_20511 ) ) ( not ( = ?auto_20479 ?auto_20486 ) ) ( not ( = ?auto_20479 ?auto_20511 ) ) ( not ( = ?auto_20480 ?auto_20486 ) ) ( not ( = ?auto_20480 ?auto_20511 ) ) ( not ( = ?auto_20481 ?auto_20486 ) ) ( not ( = ?auto_20481 ?auto_20511 ) ) ( not ( = ?auto_20482 ?auto_20486 ) ) ( not ( = ?auto_20482 ?auto_20511 ) ) ( not ( = ?auto_20483 ?auto_20486 ) ) ( not ( = ?auto_20483 ?auto_20511 ) ) ( not ( = ?auto_20484 ?auto_20486 ) ) ( not ( = ?auto_20484 ?auto_20511 ) ) ( not ( = ?auto_20486 ?auto_20497 ) ) ( not ( = ?auto_20486 ?auto_20509 ) ) ( not ( = ?auto_20486 ?auto_20518 ) ) ( not ( = ?auto_20486 ?auto_20495 ) ) ( not ( = ?auto_20486 ?auto_20516 ) ) ( not ( = ?auto_20486 ?auto_20503 ) ) ( not ( = ?auto_20486 ?auto_20513 ) ) ( not ( = ?auto_20486 ?auto_20510 ) ) ( not ( = ?auto_20486 ?auto_20514 ) ) ( not ( = ?auto_20486 ?auto_20515 ) ) ( not ( = ?auto_20511 ?auto_20497 ) ) ( not ( = ?auto_20511 ?auto_20509 ) ) ( not ( = ?auto_20511 ?auto_20518 ) ) ( not ( = ?auto_20511 ?auto_20495 ) ) ( not ( = ?auto_20511 ?auto_20516 ) ) ( not ( = ?auto_20511 ?auto_20503 ) ) ( not ( = ?auto_20511 ?auto_20513 ) ) ( not ( = ?auto_20511 ?auto_20510 ) ) ( not ( = ?auto_20511 ?auto_20514 ) ) ( not ( = ?auto_20511 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20487 ) ) ( not ( = ?auto_20475 ?auto_20499 ) ) ( not ( = ?auto_20476 ?auto_20487 ) ) ( not ( = ?auto_20476 ?auto_20499 ) ) ( not ( = ?auto_20477 ?auto_20487 ) ) ( not ( = ?auto_20477 ?auto_20499 ) ) ( not ( = ?auto_20478 ?auto_20487 ) ) ( not ( = ?auto_20478 ?auto_20499 ) ) ( not ( = ?auto_20479 ?auto_20487 ) ) ( not ( = ?auto_20479 ?auto_20499 ) ) ( not ( = ?auto_20480 ?auto_20487 ) ) ( not ( = ?auto_20480 ?auto_20499 ) ) ( not ( = ?auto_20481 ?auto_20487 ) ) ( not ( = ?auto_20481 ?auto_20499 ) ) ( not ( = ?auto_20482 ?auto_20487 ) ) ( not ( = ?auto_20482 ?auto_20499 ) ) ( not ( = ?auto_20483 ?auto_20487 ) ) ( not ( = ?auto_20483 ?auto_20499 ) ) ( not ( = ?auto_20484 ?auto_20487 ) ) ( not ( = ?auto_20484 ?auto_20499 ) ) ( not ( = ?auto_20485 ?auto_20487 ) ) ( not ( = ?auto_20485 ?auto_20499 ) ) ( not ( = ?auto_20487 ?auto_20511 ) ) ( not ( = ?auto_20487 ?auto_20497 ) ) ( not ( = ?auto_20487 ?auto_20509 ) ) ( not ( = ?auto_20487 ?auto_20518 ) ) ( not ( = ?auto_20487 ?auto_20495 ) ) ( not ( = ?auto_20487 ?auto_20516 ) ) ( not ( = ?auto_20487 ?auto_20503 ) ) ( not ( = ?auto_20487 ?auto_20513 ) ) ( not ( = ?auto_20487 ?auto_20510 ) ) ( not ( = ?auto_20487 ?auto_20514 ) ) ( not ( = ?auto_20487 ?auto_20515 ) ) ( not ( = ?auto_20499 ?auto_20511 ) ) ( not ( = ?auto_20499 ?auto_20497 ) ) ( not ( = ?auto_20499 ?auto_20509 ) ) ( not ( = ?auto_20499 ?auto_20518 ) ) ( not ( = ?auto_20499 ?auto_20495 ) ) ( not ( = ?auto_20499 ?auto_20516 ) ) ( not ( = ?auto_20499 ?auto_20503 ) ) ( not ( = ?auto_20499 ?auto_20513 ) ) ( not ( = ?auto_20499 ?auto_20510 ) ) ( not ( = ?auto_20499 ?auto_20514 ) ) ( not ( = ?auto_20499 ?auto_20515 ) ) ( not ( = ?auto_20475 ?auto_20488 ) ) ( not ( = ?auto_20475 ?auto_20492 ) ) ( not ( = ?auto_20476 ?auto_20488 ) ) ( not ( = ?auto_20476 ?auto_20492 ) ) ( not ( = ?auto_20477 ?auto_20488 ) ) ( not ( = ?auto_20477 ?auto_20492 ) ) ( not ( = ?auto_20478 ?auto_20488 ) ) ( not ( = ?auto_20478 ?auto_20492 ) ) ( not ( = ?auto_20479 ?auto_20488 ) ) ( not ( = ?auto_20479 ?auto_20492 ) ) ( not ( = ?auto_20480 ?auto_20488 ) ) ( not ( = ?auto_20480 ?auto_20492 ) ) ( not ( = ?auto_20481 ?auto_20488 ) ) ( not ( = ?auto_20481 ?auto_20492 ) ) ( not ( = ?auto_20482 ?auto_20488 ) ) ( not ( = ?auto_20482 ?auto_20492 ) ) ( not ( = ?auto_20483 ?auto_20488 ) ) ( not ( = ?auto_20483 ?auto_20492 ) ) ( not ( = ?auto_20484 ?auto_20488 ) ) ( not ( = ?auto_20484 ?auto_20492 ) ) ( not ( = ?auto_20485 ?auto_20488 ) ) ( not ( = ?auto_20485 ?auto_20492 ) ) ( not ( = ?auto_20486 ?auto_20488 ) ) ( not ( = ?auto_20486 ?auto_20492 ) ) ( not ( = ?auto_20488 ?auto_20499 ) ) ( not ( = ?auto_20488 ?auto_20511 ) ) ( not ( = ?auto_20488 ?auto_20497 ) ) ( not ( = ?auto_20488 ?auto_20509 ) ) ( not ( = ?auto_20488 ?auto_20518 ) ) ( not ( = ?auto_20488 ?auto_20495 ) ) ( not ( = ?auto_20488 ?auto_20516 ) ) ( not ( = ?auto_20488 ?auto_20503 ) ) ( not ( = ?auto_20488 ?auto_20513 ) ) ( not ( = ?auto_20488 ?auto_20510 ) ) ( not ( = ?auto_20488 ?auto_20514 ) ) ( not ( = ?auto_20488 ?auto_20515 ) ) ( not ( = ?auto_20492 ?auto_20499 ) ) ( not ( = ?auto_20492 ?auto_20511 ) ) ( not ( = ?auto_20492 ?auto_20497 ) ) ( not ( = ?auto_20492 ?auto_20509 ) ) ( not ( = ?auto_20492 ?auto_20518 ) ) ( not ( = ?auto_20492 ?auto_20495 ) ) ( not ( = ?auto_20492 ?auto_20516 ) ) ( not ( = ?auto_20492 ?auto_20503 ) ) ( not ( = ?auto_20492 ?auto_20513 ) ) ( not ( = ?auto_20492 ?auto_20510 ) ) ( not ( = ?auto_20492 ?auto_20514 ) ) ( not ( = ?auto_20492 ?auto_20515 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ?auto_20479 ?auto_20480 ?auto_20481 ?auto_20482 ?auto_20483 ?auto_20484 ?auto_20485 ?auto_20486 ?auto_20487 )
      ( MAKE-1CRATE ?auto_20487 ?auto_20488 )
      ( MAKE-13CRATE-VERIFY ?auto_20475 ?auto_20476 ?auto_20477 ?auto_20478 ?auto_20479 ?auto_20480 ?auto_20481 ?auto_20482 ?auto_20483 ?auto_20484 ?auto_20485 ?auto_20486 ?auto_20487 ?auto_20488 ) )
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
      ?auto_20551 - SURFACE
      ?auto_20552 - SURFACE
      ?auto_20553 - SURFACE
      ?auto_20554 - SURFACE
      ?auto_20555 - SURFACE
      ?auto_20556 - SURFACE
      ?auto_20558 - SURFACE
      ?auto_20557 - SURFACE
    )
    :vars
    (
      ?auto_20562 - HOIST
      ?auto_20564 - PLACE
      ?auto_20560 - PLACE
      ?auto_20559 - HOIST
      ?auto_20561 - SURFACE
      ?auto_20589 - PLACE
      ?auto_20569 - HOIST
      ?auto_20584 - SURFACE
      ?auto_20572 - PLACE
      ?auto_20576 - HOIST
      ?auto_20570 - SURFACE
      ?auto_20583 - PLACE
      ?auto_20577 - HOIST
      ?auto_20581 - SURFACE
      ?auto_20588 - SURFACE
      ?auto_20571 - PLACE
      ?auto_20587 - HOIST
      ?auto_20566 - SURFACE
      ?auto_20580 - PLACE
      ?auto_20573 - HOIST
      ?auto_20575 - SURFACE
      ?auto_20565 - SURFACE
      ?auto_20578 - PLACE
      ?auto_20582 - HOIST
      ?auto_20579 - SURFACE
      ?auto_20568 - SURFACE
      ?auto_20567 - SURFACE
      ?auto_20586 - SURFACE
      ?auto_20574 - SURFACE
      ?auto_20585 - SURFACE
      ?auto_20563 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20562 ?auto_20564 ) ( IS-CRATE ?auto_20557 ) ( not ( = ?auto_20560 ?auto_20564 ) ) ( HOIST-AT ?auto_20559 ?auto_20560 ) ( SURFACE-AT ?auto_20557 ?auto_20560 ) ( ON ?auto_20557 ?auto_20561 ) ( CLEAR ?auto_20557 ) ( not ( = ?auto_20558 ?auto_20557 ) ) ( not ( = ?auto_20558 ?auto_20561 ) ) ( not ( = ?auto_20557 ?auto_20561 ) ) ( not ( = ?auto_20562 ?auto_20559 ) ) ( IS-CRATE ?auto_20558 ) ( not ( = ?auto_20589 ?auto_20564 ) ) ( HOIST-AT ?auto_20569 ?auto_20589 ) ( SURFACE-AT ?auto_20558 ?auto_20589 ) ( ON ?auto_20558 ?auto_20584 ) ( CLEAR ?auto_20558 ) ( not ( = ?auto_20556 ?auto_20558 ) ) ( not ( = ?auto_20556 ?auto_20584 ) ) ( not ( = ?auto_20558 ?auto_20584 ) ) ( not ( = ?auto_20562 ?auto_20569 ) ) ( IS-CRATE ?auto_20556 ) ( not ( = ?auto_20572 ?auto_20564 ) ) ( HOIST-AT ?auto_20576 ?auto_20572 ) ( SURFACE-AT ?auto_20556 ?auto_20572 ) ( ON ?auto_20556 ?auto_20570 ) ( CLEAR ?auto_20556 ) ( not ( = ?auto_20555 ?auto_20556 ) ) ( not ( = ?auto_20555 ?auto_20570 ) ) ( not ( = ?auto_20556 ?auto_20570 ) ) ( not ( = ?auto_20562 ?auto_20576 ) ) ( IS-CRATE ?auto_20555 ) ( not ( = ?auto_20583 ?auto_20564 ) ) ( HOIST-AT ?auto_20577 ?auto_20583 ) ( SURFACE-AT ?auto_20555 ?auto_20583 ) ( ON ?auto_20555 ?auto_20581 ) ( CLEAR ?auto_20555 ) ( not ( = ?auto_20554 ?auto_20555 ) ) ( not ( = ?auto_20554 ?auto_20581 ) ) ( not ( = ?auto_20555 ?auto_20581 ) ) ( not ( = ?auto_20562 ?auto_20577 ) ) ( IS-CRATE ?auto_20554 ) ( AVAILABLE ?auto_20576 ) ( SURFACE-AT ?auto_20554 ?auto_20572 ) ( ON ?auto_20554 ?auto_20588 ) ( CLEAR ?auto_20554 ) ( not ( = ?auto_20553 ?auto_20554 ) ) ( not ( = ?auto_20553 ?auto_20588 ) ) ( not ( = ?auto_20554 ?auto_20588 ) ) ( IS-CRATE ?auto_20553 ) ( not ( = ?auto_20571 ?auto_20564 ) ) ( HOIST-AT ?auto_20587 ?auto_20571 ) ( AVAILABLE ?auto_20587 ) ( SURFACE-AT ?auto_20553 ?auto_20571 ) ( ON ?auto_20553 ?auto_20566 ) ( CLEAR ?auto_20553 ) ( not ( = ?auto_20552 ?auto_20553 ) ) ( not ( = ?auto_20552 ?auto_20566 ) ) ( not ( = ?auto_20553 ?auto_20566 ) ) ( not ( = ?auto_20562 ?auto_20587 ) ) ( IS-CRATE ?auto_20552 ) ( not ( = ?auto_20580 ?auto_20564 ) ) ( HOIST-AT ?auto_20573 ?auto_20580 ) ( SURFACE-AT ?auto_20552 ?auto_20580 ) ( ON ?auto_20552 ?auto_20575 ) ( CLEAR ?auto_20552 ) ( not ( = ?auto_20551 ?auto_20552 ) ) ( not ( = ?auto_20551 ?auto_20575 ) ) ( not ( = ?auto_20552 ?auto_20575 ) ) ( not ( = ?auto_20562 ?auto_20573 ) ) ( IS-CRATE ?auto_20551 ) ( SURFACE-AT ?auto_20551 ?auto_20580 ) ( ON ?auto_20551 ?auto_20565 ) ( CLEAR ?auto_20551 ) ( not ( = ?auto_20550 ?auto_20551 ) ) ( not ( = ?auto_20550 ?auto_20565 ) ) ( not ( = ?auto_20551 ?auto_20565 ) ) ( IS-CRATE ?auto_20550 ) ( not ( = ?auto_20578 ?auto_20564 ) ) ( HOIST-AT ?auto_20582 ?auto_20578 ) ( SURFACE-AT ?auto_20550 ?auto_20578 ) ( ON ?auto_20550 ?auto_20579 ) ( CLEAR ?auto_20550 ) ( not ( = ?auto_20549 ?auto_20550 ) ) ( not ( = ?auto_20549 ?auto_20579 ) ) ( not ( = ?auto_20550 ?auto_20579 ) ) ( not ( = ?auto_20562 ?auto_20582 ) ) ( IS-CRATE ?auto_20549 ) ( AVAILABLE ?auto_20582 ) ( SURFACE-AT ?auto_20549 ?auto_20578 ) ( ON ?auto_20549 ?auto_20568 ) ( CLEAR ?auto_20549 ) ( not ( = ?auto_20548 ?auto_20549 ) ) ( not ( = ?auto_20548 ?auto_20568 ) ) ( not ( = ?auto_20549 ?auto_20568 ) ) ( IS-CRATE ?auto_20548 ) ( AVAILABLE ?auto_20569 ) ( SURFACE-AT ?auto_20548 ?auto_20589 ) ( ON ?auto_20548 ?auto_20567 ) ( CLEAR ?auto_20548 ) ( not ( = ?auto_20547 ?auto_20548 ) ) ( not ( = ?auto_20547 ?auto_20567 ) ) ( not ( = ?auto_20548 ?auto_20567 ) ) ( IS-CRATE ?auto_20547 ) ( AVAILABLE ?auto_20559 ) ( SURFACE-AT ?auto_20547 ?auto_20560 ) ( ON ?auto_20547 ?auto_20586 ) ( CLEAR ?auto_20547 ) ( not ( = ?auto_20546 ?auto_20547 ) ) ( not ( = ?auto_20546 ?auto_20586 ) ) ( not ( = ?auto_20547 ?auto_20586 ) ) ( IS-CRATE ?auto_20546 ) ( AVAILABLE ?auto_20573 ) ( SURFACE-AT ?auto_20546 ?auto_20580 ) ( ON ?auto_20546 ?auto_20574 ) ( CLEAR ?auto_20546 ) ( not ( = ?auto_20545 ?auto_20546 ) ) ( not ( = ?auto_20545 ?auto_20574 ) ) ( not ( = ?auto_20546 ?auto_20574 ) ) ( SURFACE-AT ?auto_20544 ?auto_20564 ) ( CLEAR ?auto_20544 ) ( IS-CRATE ?auto_20545 ) ( AVAILABLE ?auto_20562 ) ( AVAILABLE ?auto_20577 ) ( SURFACE-AT ?auto_20545 ?auto_20583 ) ( ON ?auto_20545 ?auto_20585 ) ( CLEAR ?auto_20545 ) ( TRUCK-AT ?auto_20563 ?auto_20564 ) ( not ( = ?auto_20544 ?auto_20545 ) ) ( not ( = ?auto_20544 ?auto_20585 ) ) ( not ( = ?auto_20545 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20546 ) ) ( not ( = ?auto_20544 ?auto_20574 ) ) ( not ( = ?auto_20546 ?auto_20585 ) ) ( not ( = ?auto_20580 ?auto_20583 ) ) ( not ( = ?auto_20573 ?auto_20577 ) ) ( not ( = ?auto_20574 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20547 ) ) ( not ( = ?auto_20544 ?auto_20586 ) ) ( not ( = ?auto_20545 ?auto_20547 ) ) ( not ( = ?auto_20545 ?auto_20586 ) ) ( not ( = ?auto_20547 ?auto_20574 ) ) ( not ( = ?auto_20547 ?auto_20585 ) ) ( not ( = ?auto_20560 ?auto_20580 ) ) ( not ( = ?auto_20560 ?auto_20583 ) ) ( not ( = ?auto_20559 ?auto_20573 ) ) ( not ( = ?auto_20559 ?auto_20577 ) ) ( not ( = ?auto_20586 ?auto_20574 ) ) ( not ( = ?auto_20586 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20548 ) ) ( not ( = ?auto_20544 ?auto_20567 ) ) ( not ( = ?auto_20545 ?auto_20548 ) ) ( not ( = ?auto_20545 ?auto_20567 ) ) ( not ( = ?auto_20546 ?auto_20548 ) ) ( not ( = ?auto_20546 ?auto_20567 ) ) ( not ( = ?auto_20548 ?auto_20586 ) ) ( not ( = ?auto_20548 ?auto_20574 ) ) ( not ( = ?auto_20548 ?auto_20585 ) ) ( not ( = ?auto_20589 ?auto_20560 ) ) ( not ( = ?auto_20589 ?auto_20580 ) ) ( not ( = ?auto_20589 ?auto_20583 ) ) ( not ( = ?auto_20569 ?auto_20559 ) ) ( not ( = ?auto_20569 ?auto_20573 ) ) ( not ( = ?auto_20569 ?auto_20577 ) ) ( not ( = ?auto_20567 ?auto_20586 ) ) ( not ( = ?auto_20567 ?auto_20574 ) ) ( not ( = ?auto_20567 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20549 ) ) ( not ( = ?auto_20544 ?auto_20568 ) ) ( not ( = ?auto_20545 ?auto_20549 ) ) ( not ( = ?auto_20545 ?auto_20568 ) ) ( not ( = ?auto_20546 ?auto_20549 ) ) ( not ( = ?auto_20546 ?auto_20568 ) ) ( not ( = ?auto_20547 ?auto_20549 ) ) ( not ( = ?auto_20547 ?auto_20568 ) ) ( not ( = ?auto_20549 ?auto_20567 ) ) ( not ( = ?auto_20549 ?auto_20586 ) ) ( not ( = ?auto_20549 ?auto_20574 ) ) ( not ( = ?auto_20549 ?auto_20585 ) ) ( not ( = ?auto_20578 ?auto_20589 ) ) ( not ( = ?auto_20578 ?auto_20560 ) ) ( not ( = ?auto_20578 ?auto_20580 ) ) ( not ( = ?auto_20578 ?auto_20583 ) ) ( not ( = ?auto_20582 ?auto_20569 ) ) ( not ( = ?auto_20582 ?auto_20559 ) ) ( not ( = ?auto_20582 ?auto_20573 ) ) ( not ( = ?auto_20582 ?auto_20577 ) ) ( not ( = ?auto_20568 ?auto_20567 ) ) ( not ( = ?auto_20568 ?auto_20586 ) ) ( not ( = ?auto_20568 ?auto_20574 ) ) ( not ( = ?auto_20568 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20550 ) ) ( not ( = ?auto_20544 ?auto_20579 ) ) ( not ( = ?auto_20545 ?auto_20550 ) ) ( not ( = ?auto_20545 ?auto_20579 ) ) ( not ( = ?auto_20546 ?auto_20550 ) ) ( not ( = ?auto_20546 ?auto_20579 ) ) ( not ( = ?auto_20547 ?auto_20550 ) ) ( not ( = ?auto_20547 ?auto_20579 ) ) ( not ( = ?auto_20548 ?auto_20550 ) ) ( not ( = ?auto_20548 ?auto_20579 ) ) ( not ( = ?auto_20550 ?auto_20568 ) ) ( not ( = ?auto_20550 ?auto_20567 ) ) ( not ( = ?auto_20550 ?auto_20586 ) ) ( not ( = ?auto_20550 ?auto_20574 ) ) ( not ( = ?auto_20550 ?auto_20585 ) ) ( not ( = ?auto_20579 ?auto_20568 ) ) ( not ( = ?auto_20579 ?auto_20567 ) ) ( not ( = ?auto_20579 ?auto_20586 ) ) ( not ( = ?auto_20579 ?auto_20574 ) ) ( not ( = ?auto_20579 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20551 ) ) ( not ( = ?auto_20544 ?auto_20565 ) ) ( not ( = ?auto_20545 ?auto_20551 ) ) ( not ( = ?auto_20545 ?auto_20565 ) ) ( not ( = ?auto_20546 ?auto_20551 ) ) ( not ( = ?auto_20546 ?auto_20565 ) ) ( not ( = ?auto_20547 ?auto_20551 ) ) ( not ( = ?auto_20547 ?auto_20565 ) ) ( not ( = ?auto_20548 ?auto_20551 ) ) ( not ( = ?auto_20548 ?auto_20565 ) ) ( not ( = ?auto_20549 ?auto_20551 ) ) ( not ( = ?auto_20549 ?auto_20565 ) ) ( not ( = ?auto_20551 ?auto_20579 ) ) ( not ( = ?auto_20551 ?auto_20568 ) ) ( not ( = ?auto_20551 ?auto_20567 ) ) ( not ( = ?auto_20551 ?auto_20586 ) ) ( not ( = ?auto_20551 ?auto_20574 ) ) ( not ( = ?auto_20551 ?auto_20585 ) ) ( not ( = ?auto_20565 ?auto_20579 ) ) ( not ( = ?auto_20565 ?auto_20568 ) ) ( not ( = ?auto_20565 ?auto_20567 ) ) ( not ( = ?auto_20565 ?auto_20586 ) ) ( not ( = ?auto_20565 ?auto_20574 ) ) ( not ( = ?auto_20565 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20552 ) ) ( not ( = ?auto_20544 ?auto_20575 ) ) ( not ( = ?auto_20545 ?auto_20552 ) ) ( not ( = ?auto_20545 ?auto_20575 ) ) ( not ( = ?auto_20546 ?auto_20552 ) ) ( not ( = ?auto_20546 ?auto_20575 ) ) ( not ( = ?auto_20547 ?auto_20552 ) ) ( not ( = ?auto_20547 ?auto_20575 ) ) ( not ( = ?auto_20548 ?auto_20552 ) ) ( not ( = ?auto_20548 ?auto_20575 ) ) ( not ( = ?auto_20549 ?auto_20552 ) ) ( not ( = ?auto_20549 ?auto_20575 ) ) ( not ( = ?auto_20550 ?auto_20552 ) ) ( not ( = ?auto_20550 ?auto_20575 ) ) ( not ( = ?auto_20552 ?auto_20565 ) ) ( not ( = ?auto_20552 ?auto_20579 ) ) ( not ( = ?auto_20552 ?auto_20568 ) ) ( not ( = ?auto_20552 ?auto_20567 ) ) ( not ( = ?auto_20552 ?auto_20586 ) ) ( not ( = ?auto_20552 ?auto_20574 ) ) ( not ( = ?auto_20552 ?auto_20585 ) ) ( not ( = ?auto_20575 ?auto_20565 ) ) ( not ( = ?auto_20575 ?auto_20579 ) ) ( not ( = ?auto_20575 ?auto_20568 ) ) ( not ( = ?auto_20575 ?auto_20567 ) ) ( not ( = ?auto_20575 ?auto_20586 ) ) ( not ( = ?auto_20575 ?auto_20574 ) ) ( not ( = ?auto_20575 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20553 ) ) ( not ( = ?auto_20544 ?auto_20566 ) ) ( not ( = ?auto_20545 ?auto_20553 ) ) ( not ( = ?auto_20545 ?auto_20566 ) ) ( not ( = ?auto_20546 ?auto_20553 ) ) ( not ( = ?auto_20546 ?auto_20566 ) ) ( not ( = ?auto_20547 ?auto_20553 ) ) ( not ( = ?auto_20547 ?auto_20566 ) ) ( not ( = ?auto_20548 ?auto_20553 ) ) ( not ( = ?auto_20548 ?auto_20566 ) ) ( not ( = ?auto_20549 ?auto_20553 ) ) ( not ( = ?auto_20549 ?auto_20566 ) ) ( not ( = ?auto_20550 ?auto_20553 ) ) ( not ( = ?auto_20550 ?auto_20566 ) ) ( not ( = ?auto_20551 ?auto_20553 ) ) ( not ( = ?auto_20551 ?auto_20566 ) ) ( not ( = ?auto_20553 ?auto_20575 ) ) ( not ( = ?auto_20553 ?auto_20565 ) ) ( not ( = ?auto_20553 ?auto_20579 ) ) ( not ( = ?auto_20553 ?auto_20568 ) ) ( not ( = ?auto_20553 ?auto_20567 ) ) ( not ( = ?auto_20553 ?auto_20586 ) ) ( not ( = ?auto_20553 ?auto_20574 ) ) ( not ( = ?auto_20553 ?auto_20585 ) ) ( not ( = ?auto_20571 ?auto_20580 ) ) ( not ( = ?auto_20571 ?auto_20578 ) ) ( not ( = ?auto_20571 ?auto_20589 ) ) ( not ( = ?auto_20571 ?auto_20560 ) ) ( not ( = ?auto_20571 ?auto_20583 ) ) ( not ( = ?auto_20587 ?auto_20573 ) ) ( not ( = ?auto_20587 ?auto_20582 ) ) ( not ( = ?auto_20587 ?auto_20569 ) ) ( not ( = ?auto_20587 ?auto_20559 ) ) ( not ( = ?auto_20587 ?auto_20577 ) ) ( not ( = ?auto_20566 ?auto_20575 ) ) ( not ( = ?auto_20566 ?auto_20565 ) ) ( not ( = ?auto_20566 ?auto_20579 ) ) ( not ( = ?auto_20566 ?auto_20568 ) ) ( not ( = ?auto_20566 ?auto_20567 ) ) ( not ( = ?auto_20566 ?auto_20586 ) ) ( not ( = ?auto_20566 ?auto_20574 ) ) ( not ( = ?auto_20566 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20554 ) ) ( not ( = ?auto_20544 ?auto_20588 ) ) ( not ( = ?auto_20545 ?auto_20554 ) ) ( not ( = ?auto_20545 ?auto_20588 ) ) ( not ( = ?auto_20546 ?auto_20554 ) ) ( not ( = ?auto_20546 ?auto_20588 ) ) ( not ( = ?auto_20547 ?auto_20554 ) ) ( not ( = ?auto_20547 ?auto_20588 ) ) ( not ( = ?auto_20548 ?auto_20554 ) ) ( not ( = ?auto_20548 ?auto_20588 ) ) ( not ( = ?auto_20549 ?auto_20554 ) ) ( not ( = ?auto_20549 ?auto_20588 ) ) ( not ( = ?auto_20550 ?auto_20554 ) ) ( not ( = ?auto_20550 ?auto_20588 ) ) ( not ( = ?auto_20551 ?auto_20554 ) ) ( not ( = ?auto_20551 ?auto_20588 ) ) ( not ( = ?auto_20552 ?auto_20554 ) ) ( not ( = ?auto_20552 ?auto_20588 ) ) ( not ( = ?auto_20554 ?auto_20566 ) ) ( not ( = ?auto_20554 ?auto_20575 ) ) ( not ( = ?auto_20554 ?auto_20565 ) ) ( not ( = ?auto_20554 ?auto_20579 ) ) ( not ( = ?auto_20554 ?auto_20568 ) ) ( not ( = ?auto_20554 ?auto_20567 ) ) ( not ( = ?auto_20554 ?auto_20586 ) ) ( not ( = ?auto_20554 ?auto_20574 ) ) ( not ( = ?auto_20554 ?auto_20585 ) ) ( not ( = ?auto_20572 ?auto_20571 ) ) ( not ( = ?auto_20572 ?auto_20580 ) ) ( not ( = ?auto_20572 ?auto_20578 ) ) ( not ( = ?auto_20572 ?auto_20589 ) ) ( not ( = ?auto_20572 ?auto_20560 ) ) ( not ( = ?auto_20572 ?auto_20583 ) ) ( not ( = ?auto_20576 ?auto_20587 ) ) ( not ( = ?auto_20576 ?auto_20573 ) ) ( not ( = ?auto_20576 ?auto_20582 ) ) ( not ( = ?auto_20576 ?auto_20569 ) ) ( not ( = ?auto_20576 ?auto_20559 ) ) ( not ( = ?auto_20576 ?auto_20577 ) ) ( not ( = ?auto_20588 ?auto_20566 ) ) ( not ( = ?auto_20588 ?auto_20575 ) ) ( not ( = ?auto_20588 ?auto_20565 ) ) ( not ( = ?auto_20588 ?auto_20579 ) ) ( not ( = ?auto_20588 ?auto_20568 ) ) ( not ( = ?auto_20588 ?auto_20567 ) ) ( not ( = ?auto_20588 ?auto_20586 ) ) ( not ( = ?auto_20588 ?auto_20574 ) ) ( not ( = ?auto_20588 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20555 ) ) ( not ( = ?auto_20544 ?auto_20581 ) ) ( not ( = ?auto_20545 ?auto_20555 ) ) ( not ( = ?auto_20545 ?auto_20581 ) ) ( not ( = ?auto_20546 ?auto_20555 ) ) ( not ( = ?auto_20546 ?auto_20581 ) ) ( not ( = ?auto_20547 ?auto_20555 ) ) ( not ( = ?auto_20547 ?auto_20581 ) ) ( not ( = ?auto_20548 ?auto_20555 ) ) ( not ( = ?auto_20548 ?auto_20581 ) ) ( not ( = ?auto_20549 ?auto_20555 ) ) ( not ( = ?auto_20549 ?auto_20581 ) ) ( not ( = ?auto_20550 ?auto_20555 ) ) ( not ( = ?auto_20550 ?auto_20581 ) ) ( not ( = ?auto_20551 ?auto_20555 ) ) ( not ( = ?auto_20551 ?auto_20581 ) ) ( not ( = ?auto_20552 ?auto_20555 ) ) ( not ( = ?auto_20552 ?auto_20581 ) ) ( not ( = ?auto_20553 ?auto_20555 ) ) ( not ( = ?auto_20553 ?auto_20581 ) ) ( not ( = ?auto_20555 ?auto_20588 ) ) ( not ( = ?auto_20555 ?auto_20566 ) ) ( not ( = ?auto_20555 ?auto_20575 ) ) ( not ( = ?auto_20555 ?auto_20565 ) ) ( not ( = ?auto_20555 ?auto_20579 ) ) ( not ( = ?auto_20555 ?auto_20568 ) ) ( not ( = ?auto_20555 ?auto_20567 ) ) ( not ( = ?auto_20555 ?auto_20586 ) ) ( not ( = ?auto_20555 ?auto_20574 ) ) ( not ( = ?auto_20555 ?auto_20585 ) ) ( not ( = ?auto_20581 ?auto_20588 ) ) ( not ( = ?auto_20581 ?auto_20566 ) ) ( not ( = ?auto_20581 ?auto_20575 ) ) ( not ( = ?auto_20581 ?auto_20565 ) ) ( not ( = ?auto_20581 ?auto_20579 ) ) ( not ( = ?auto_20581 ?auto_20568 ) ) ( not ( = ?auto_20581 ?auto_20567 ) ) ( not ( = ?auto_20581 ?auto_20586 ) ) ( not ( = ?auto_20581 ?auto_20574 ) ) ( not ( = ?auto_20581 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20556 ) ) ( not ( = ?auto_20544 ?auto_20570 ) ) ( not ( = ?auto_20545 ?auto_20556 ) ) ( not ( = ?auto_20545 ?auto_20570 ) ) ( not ( = ?auto_20546 ?auto_20556 ) ) ( not ( = ?auto_20546 ?auto_20570 ) ) ( not ( = ?auto_20547 ?auto_20556 ) ) ( not ( = ?auto_20547 ?auto_20570 ) ) ( not ( = ?auto_20548 ?auto_20556 ) ) ( not ( = ?auto_20548 ?auto_20570 ) ) ( not ( = ?auto_20549 ?auto_20556 ) ) ( not ( = ?auto_20549 ?auto_20570 ) ) ( not ( = ?auto_20550 ?auto_20556 ) ) ( not ( = ?auto_20550 ?auto_20570 ) ) ( not ( = ?auto_20551 ?auto_20556 ) ) ( not ( = ?auto_20551 ?auto_20570 ) ) ( not ( = ?auto_20552 ?auto_20556 ) ) ( not ( = ?auto_20552 ?auto_20570 ) ) ( not ( = ?auto_20553 ?auto_20556 ) ) ( not ( = ?auto_20553 ?auto_20570 ) ) ( not ( = ?auto_20554 ?auto_20556 ) ) ( not ( = ?auto_20554 ?auto_20570 ) ) ( not ( = ?auto_20556 ?auto_20581 ) ) ( not ( = ?auto_20556 ?auto_20588 ) ) ( not ( = ?auto_20556 ?auto_20566 ) ) ( not ( = ?auto_20556 ?auto_20575 ) ) ( not ( = ?auto_20556 ?auto_20565 ) ) ( not ( = ?auto_20556 ?auto_20579 ) ) ( not ( = ?auto_20556 ?auto_20568 ) ) ( not ( = ?auto_20556 ?auto_20567 ) ) ( not ( = ?auto_20556 ?auto_20586 ) ) ( not ( = ?auto_20556 ?auto_20574 ) ) ( not ( = ?auto_20556 ?auto_20585 ) ) ( not ( = ?auto_20570 ?auto_20581 ) ) ( not ( = ?auto_20570 ?auto_20588 ) ) ( not ( = ?auto_20570 ?auto_20566 ) ) ( not ( = ?auto_20570 ?auto_20575 ) ) ( not ( = ?auto_20570 ?auto_20565 ) ) ( not ( = ?auto_20570 ?auto_20579 ) ) ( not ( = ?auto_20570 ?auto_20568 ) ) ( not ( = ?auto_20570 ?auto_20567 ) ) ( not ( = ?auto_20570 ?auto_20586 ) ) ( not ( = ?auto_20570 ?auto_20574 ) ) ( not ( = ?auto_20570 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20558 ) ) ( not ( = ?auto_20544 ?auto_20584 ) ) ( not ( = ?auto_20545 ?auto_20558 ) ) ( not ( = ?auto_20545 ?auto_20584 ) ) ( not ( = ?auto_20546 ?auto_20558 ) ) ( not ( = ?auto_20546 ?auto_20584 ) ) ( not ( = ?auto_20547 ?auto_20558 ) ) ( not ( = ?auto_20547 ?auto_20584 ) ) ( not ( = ?auto_20548 ?auto_20558 ) ) ( not ( = ?auto_20548 ?auto_20584 ) ) ( not ( = ?auto_20549 ?auto_20558 ) ) ( not ( = ?auto_20549 ?auto_20584 ) ) ( not ( = ?auto_20550 ?auto_20558 ) ) ( not ( = ?auto_20550 ?auto_20584 ) ) ( not ( = ?auto_20551 ?auto_20558 ) ) ( not ( = ?auto_20551 ?auto_20584 ) ) ( not ( = ?auto_20552 ?auto_20558 ) ) ( not ( = ?auto_20552 ?auto_20584 ) ) ( not ( = ?auto_20553 ?auto_20558 ) ) ( not ( = ?auto_20553 ?auto_20584 ) ) ( not ( = ?auto_20554 ?auto_20558 ) ) ( not ( = ?auto_20554 ?auto_20584 ) ) ( not ( = ?auto_20555 ?auto_20558 ) ) ( not ( = ?auto_20555 ?auto_20584 ) ) ( not ( = ?auto_20558 ?auto_20570 ) ) ( not ( = ?auto_20558 ?auto_20581 ) ) ( not ( = ?auto_20558 ?auto_20588 ) ) ( not ( = ?auto_20558 ?auto_20566 ) ) ( not ( = ?auto_20558 ?auto_20575 ) ) ( not ( = ?auto_20558 ?auto_20565 ) ) ( not ( = ?auto_20558 ?auto_20579 ) ) ( not ( = ?auto_20558 ?auto_20568 ) ) ( not ( = ?auto_20558 ?auto_20567 ) ) ( not ( = ?auto_20558 ?auto_20586 ) ) ( not ( = ?auto_20558 ?auto_20574 ) ) ( not ( = ?auto_20558 ?auto_20585 ) ) ( not ( = ?auto_20584 ?auto_20570 ) ) ( not ( = ?auto_20584 ?auto_20581 ) ) ( not ( = ?auto_20584 ?auto_20588 ) ) ( not ( = ?auto_20584 ?auto_20566 ) ) ( not ( = ?auto_20584 ?auto_20575 ) ) ( not ( = ?auto_20584 ?auto_20565 ) ) ( not ( = ?auto_20584 ?auto_20579 ) ) ( not ( = ?auto_20584 ?auto_20568 ) ) ( not ( = ?auto_20584 ?auto_20567 ) ) ( not ( = ?auto_20584 ?auto_20586 ) ) ( not ( = ?auto_20584 ?auto_20574 ) ) ( not ( = ?auto_20584 ?auto_20585 ) ) ( not ( = ?auto_20544 ?auto_20557 ) ) ( not ( = ?auto_20544 ?auto_20561 ) ) ( not ( = ?auto_20545 ?auto_20557 ) ) ( not ( = ?auto_20545 ?auto_20561 ) ) ( not ( = ?auto_20546 ?auto_20557 ) ) ( not ( = ?auto_20546 ?auto_20561 ) ) ( not ( = ?auto_20547 ?auto_20557 ) ) ( not ( = ?auto_20547 ?auto_20561 ) ) ( not ( = ?auto_20548 ?auto_20557 ) ) ( not ( = ?auto_20548 ?auto_20561 ) ) ( not ( = ?auto_20549 ?auto_20557 ) ) ( not ( = ?auto_20549 ?auto_20561 ) ) ( not ( = ?auto_20550 ?auto_20557 ) ) ( not ( = ?auto_20550 ?auto_20561 ) ) ( not ( = ?auto_20551 ?auto_20557 ) ) ( not ( = ?auto_20551 ?auto_20561 ) ) ( not ( = ?auto_20552 ?auto_20557 ) ) ( not ( = ?auto_20552 ?auto_20561 ) ) ( not ( = ?auto_20553 ?auto_20557 ) ) ( not ( = ?auto_20553 ?auto_20561 ) ) ( not ( = ?auto_20554 ?auto_20557 ) ) ( not ( = ?auto_20554 ?auto_20561 ) ) ( not ( = ?auto_20555 ?auto_20557 ) ) ( not ( = ?auto_20555 ?auto_20561 ) ) ( not ( = ?auto_20556 ?auto_20557 ) ) ( not ( = ?auto_20556 ?auto_20561 ) ) ( not ( = ?auto_20557 ?auto_20584 ) ) ( not ( = ?auto_20557 ?auto_20570 ) ) ( not ( = ?auto_20557 ?auto_20581 ) ) ( not ( = ?auto_20557 ?auto_20588 ) ) ( not ( = ?auto_20557 ?auto_20566 ) ) ( not ( = ?auto_20557 ?auto_20575 ) ) ( not ( = ?auto_20557 ?auto_20565 ) ) ( not ( = ?auto_20557 ?auto_20579 ) ) ( not ( = ?auto_20557 ?auto_20568 ) ) ( not ( = ?auto_20557 ?auto_20567 ) ) ( not ( = ?auto_20557 ?auto_20586 ) ) ( not ( = ?auto_20557 ?auto_20574 ) ) ( not ( = ?auto_20557 ?auto_20585 ) ) ( not ( = ?auto_20561 ?auto_20584 ) ) ( not ( = ?auto_20561 ?auto_20570 ) ) ( not ( = ?auto_20561 ?auto_20581 ) ) ( not ( = ?auto_20561 ?auto_20588 ) ) ( not ( = ?auto_20561 ?auto_20566 ) ) ( not ( = ?auto_20561 ?auto_20575 ) ) ( not ( = ?auto_20561 ?auto_20565 ) ) ( not ( = ?auto_20561 ?auto_20579 ) ) ( not ( = ?auto_20561 ?auto_20568 ) ) ( not ( = ?auto_20561 ?auto_20567 ) ) ( not ( = ?auto_20561 ?auto_20586 ) ) ( not ( = ?auto_20561 ?auto_20574 ) ) ( not ( = ?auto_20561 ?auto_20585 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 ?auto_20549 ?auto_20550 ?auto_20551 ?auto_20552 ?auto_20553 ?auto_20554 ?auto_20555 ?auto_20556 ?auto_20558 )
      ( MAKE-1CRATE ?auto_20558 ?auto_20557 )
      ( MAKE-14CRATE-VERIFY ?auto_20544 ?auto_20545 ?auto_20546 ?auto_20547 ?auto_20548 ?auto_20549 ?auto_20550 ?auto_20551 ?auto_20552 ?auto_20553 ?auto_20554 ?auto_20555 ?auto_20556 ?auto_20558 ?auto_20557 ) )
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
      ?auto_20623 - SURFACE
      ?auto_20624 - SURFACE
      ?auto_20625 - SURFACE
      ?auto_20626 - SURFACE
      ?auto_20627 - SURFACE
      ?auto_20628 - SURFACE
      ?auto_20630 - SURFACE
      ?auto_20629 - SURFACE
      ?auto_20631 - SURFACE
    )
    :vars
    (
      ?auto_20634 - HOIST
      ?auto_20637 - PLACE
      ?auto_20635 - PLACE
      ?auto_20632 - HOIST
      ?auto_20633 - SURFACE
      ?auto_20648 - PLACE
      ?auto_20642 - HOIST
      ?auto_20661 - SURFACE
      ?auto_20641 - PLACE
      ?auto_20640 - HOIST
      ?auto_20664 - SURFACE
      ?auto_20663 - PLACE
      ?auto_20655 - HOIST
      ?auto_20662 - SURFACE
      ?auto_20656 - PLACE
      ?auto_20652 - HOIST
      ?auto_20665 - SURFACE
      ?auto_20639 - SURFACE
      ?auto_20645 - PLACE
      ?auto_20654 - HOIST
      ?auto_20653 - SURFACE
      ?auto_20660 - PLACE
      ?auto_20646 - HOIST
      ?auto_20647 - SURFACE
      ?auto_20659 - SURFACE
      ?auto_20650 - PLACE
      ?auto_20649 - HOIST
      ?auto_20638 - SURFACE
      ?auto_20657 - SURFACE
      ?auto_20643 - SURFACE
      ?auto_20651 - SURFACE
      ?auto_20644 - SURFACE
      ?auto_20658 - SURFACE
      ?auto_20636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_20634 ?auto_20637 ) ( IS-CRATE ?auto_20631 ) ( not ( = ?auto_20635 ?auto_20637 ) ) ( HOIST-AT ?auto_20632 ?auto_20635 ) ( AVAILABLE ?auto_20632 ) ( SURFACE-AT ?auto_20631 ?auto_20635 ) ( ON ?auto_20631 ?auto_20633 ) ( CLEAR ?auto_20631 ) ( not ( = ?auto_20629 ?auto_20631 ) ) ( not ( = ?auto_20629 ?auto_20633 ) ) ( not ( = ?auto_20631 ?auto_20633 ) ) ( not ( = ?auto_20634 ?auto_20632 ) ) ( IS-CRATE ?auto_20629 ) ( not ( = ?auto_20648 ?auto_20637 ) ) ( HOIST-AT ?auto_20642 ?auto_20648 ) ( SURFACE-AT ?auto_20629 ?auto_20648 ) ( ON ?auto_20629 ?auto_20661 ) ( CLEAR ?auto_20629 ) ( not ( = ?auto_20630 ?auto_20629 ) ) ( not ( = ?auto_20630 ?auto_20661 ) ) ( not ( = ?auto_20629 ?auto_20661 ) ) ( not ( = ?auto_20634 ?auto_20642 ) ) ( IS-CRATE ?auto_20630 ) ( not ( = ?auto_20641 ?auto_20637 ) ) ( HOIST-AT ?auto_20640 ?auto_20641 ) ( SURFACE-AT ?auto_20630 ?auto_20641 ) ( ON ?auto_20630 ?auto_20664 ) ( CLEAR ?auto_20630 ) ( not ( = ?auto_20628 ?auto_20630 ) ) ( not ( = ?auto_20628 ?auto_20664 ) ) ( not ( = ?auto_20630 ?auto_20664 ) ) ( not ( = ?auto_20634 ?auto_20640 ) ) ( IS-CRATE ?auto_20628 ) ( not ( = ?auto_20663 ?auto_20637 ) ) ( HOIST-AT ?auto_20655 ?auto_20663 ) ( SURFACE-AT ?auto_20628 ?auto_20663 ) ( ON ?auto_20628 ?auto_20662 ) ( CLEAR ?auto_20628 ) ( not ( = ?auto_20627 ?auto_20628 ) ) ( not ( = ?auto_20627 ?auto_20662 ) ) ( not ( = ?auto_20628 ?auto_20662 ) ) ( not ( = ?auto_20634 ?auto_20655 ) ) ( IS-CRATE ?auto_20627 ) ( not ( = ?auto_20656 ?auto_20637 ) ) ( HOIST-AT ?auto_20652 ?auto_20656 ) ( SURFACE-AT ?auto_20627 ?auto_20656 ) ( ON ?auto_20627 ?auto_20665 ) ( CLEAR ?auto_20627 ) ( not ( = ?auto_20626 ?auto_20627 ) ) ( not ( = ?auto_20626 ?auto_20665 ) ) ( not ( = ?auto_20627 ?auto_20665 ) ) ( not ( = ?auto_20634 ?auto_20652 ) ) ( IS-CRATE ?auto_20626 ) ( AVAILABLE ?auto_20655 ) ( SURFACE-AT ?auto_20626 ?auto_20663 ) ( ON ?auto_20626 ?auto_20639 ) ( CLEAR ?auto_20626 ) ( not ( = ?auto_20625 ?auto_20626 ) ) ( not ( = ?auto_20625 ?auto_20639 ) ) ( not ( = ?auto_20626 ?auto_20639 ) ) ( IS-CRATE ?auto_20625 ) ( not ( = ?auto_20645 ?auto_20637 ) ) ( HOIST-AT ?auto_20654 ?auto_20645 ) ( AVAILABLE ?auto_20654 ) ( SURFACE-AT ?auto_20625 ?auto_20645 ) ( ON ?auto_20625 ?auto_20653 ) ( CLEAR ?auto_20625 ) ( not ( = ?auto_20624 ?auto_20625 ) ) ( not ( = ?auto_20624 ?auto_20653 ) ) ( not ( = ?auto_20625 ?auto_20653 ) ) ( not ( = ?auto_20634 ?auto_20654 ) ) ( IS-CRATE ?auto_20624 ) ( not ( = ?auto_20660 ?auto_20637 ) ) ( HOIST-AT ?auto_20646 ?auto_20660 ) ( SURFACE-AT ?auto_20624 ?auto_20660 ) ( ON ?auto_20624 ?auto_20647 ) ( CLEAR ?auto_20624 ) ( not ( = ?auto_20623 ?auto_20624 ) ) ( not ( = ?auto_20623 ?auto_20647 ) ) ( not ( = ?auto_20624 ?auto_20647 ) ) ( not ( = ?auto_20634 ?auto_20646 ) ) ( IS-CRATE ?auto_20623 ) ( SURFACE-AT ?auto_20623 ?auto_20660 ) ( ON ?auto_20623 ?auto_20659 ) ( CLEAR ?auto_20623 ) ( not ( = ?auto_20622 ?auto_20623 ) ) ( not ( = ?auto_20622 ?auto_20659 ) ) ( not ( = ?auto_20623 ?auto_20659 ) ) ( IS-CRATE ?auto_20622 ) ( not ( = ?auto_20650 ?auto_20637 ) ) ( HOIST-AT ?auto_20649 ?auto_20650 ) ( SURFACE-AT ?auto_20622 ?auto_20650 ) ( ON ?auto_20622 ?auto_20638 ) ( CLEAR ?auto_20622 ) ( not ( = ?auto_20621 ?auto_20622 ) ) ( not ( = ?auto_20621 ?auto_20638 ) ) ( not ( = ?auto_20622 ?auto_20638 ) ) ( not ( = ?auto_20634 ?auto_20649 ) ) ( IS-CRATE ?auto_20621 ) ( AVAILABLE ?auto_20649 ) ( SURFACE-AT ?auto_20621 ?auto_20650 ) ( ON ?auto_20621 ?auto_20657 ) ( CLEAR ?auto_20621 ) ( not ( = ?auto_20620 ?auto_20621 ) ) ( not ( = ?auto_20620 ?auto_20657 ) ) ( not ( = ?auto_20621 ?auto_20657 ) ) ( IS-CRATE ?auto_20620 ) ( AVAILABLE ?auto_20640 ) ( SURFACE-AT ?auto_20620 ?auto_20641 ) ( ON ?auto_20620 ?auto_20643 ) ( CLEAR ?auto_20620 ) ( not ( = ?auto_20619 ?auto_20620 ) ) ( not ( = ?auto_20619 ?auto_20643 ) ) ( not ( = ?auto_20620 ?auto_20643 ) ) ( IS-CRATE ?auto_20619 ) ( AVAILABLE ?auto_20642 ) ( SURFACE-AT ?auto_20619 ?auto_20648 ) ( ON ?auto_20619 ?auto_20651 ) ( CLEAR ?auto_20619 ) ( not ( = ?auto_20618 ?auto_20619 ) ) ( not ( = ?auto_20618 ?auto_20651 ) ) ( not ( = ?auto_20619 ?auto_20651 ) ) ( IS-CRATE ?auto_20618 ) ( AVAILABLE ?auto_20646 ) ( SURFACE-AT ?auto_20618 ?auto_20660 ) ( ON ?auto_20618 ?auto_20644 ) ( CLEAR ?auto_20618 ) ( not ( = ?auto_20617 ?auto_20618 ) ) ( not ( = ?auto_20617 ?auto_20644 ) ) ( not ( = ?auto_20618 ?auto_20644 ) ) ( SURFACE-AT ?auto_20616 ?auto_20637 ) ( CLEAR ?auto_20616 ) ( IS-CRATE ?auto_20617 ) ( AVAILABLE ?auto_20634 ) ( AVAILABLE ?auto_20652 ) ( SURFACE-AT ?auto_20617 ?auto_20656 ) ( ON ?auto_20617 ?auto_20658 ) ( CLEAR ?auto_20617 ) ( TRUCK-AT ?auto_20636 ?auto_20637 ) ( not ( = ?auto_20616 ?auto_20617 ) ) ( not ( = ?auto_20616 ?auto_20658 ) ) ( not ( = ?auto_20617 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20618 ) ) ( not ( = ?auto_20616 ?auto_20644 ) ) ( not ( = ?auto_20618 ?auto_20658 ) ) ( not ( = ?auto_20660 ?auto_20656 ) ) ( not ( = ?auto_20646 ?auto_20652 ) ) ( not ( = ?auto_20644 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20619 ) ) ( not ( = ?auto_20616 ?auto_20651 ) ) ( not ( = ?auto_20617 ?auto_20619 ) ) ( not ( = ?auto_20617 ?auto_20651 ) ) ( not ( = ?auto_20619 ?auto_20644 ) ) ( not ( = ?auto_20619 ?auto_20658 ) ) ( not ( = ?auto_20648 ?auto_20660 ) ) ( not ( = ?auto_20648 ?auto_20656 ) ) ( not ( = ?auto_20642 ?auto_20646 ) ) ( not ( = ?auto_20642 ?auto_20652 ) ) ( not ( = ?auto_20651 ?auto_20644 ) ) ( not ( = ?auto_20651 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20620 ) ) ( not ( = ?auto_20616 ?auto_20643 ) ) ( not ( = ?auto_20617 ?auto_20620 ) ) ( not ( = ?auto_20617 ?auto_20643 ) ) ( not ( = ?auto_20618 ?auto_20620 ) ) ( not ( = ?auto_20618 ?auto_20643 ) ) ( not ( = ?auto_20620 ?auto_20651 ) ) ( not ( = ?auto_20620 ?auto_20644 ) ) ( not ( = ?auto_20620 ?auto_20658 ) ) ( not ( = ?auto_20641 ?auto_20648 ) ) ( not ( = ?auto_20641 ?auto_20660 ) ) ( not ( = ?auto_20641 ?auto_20656 ) ) ( not ( = ?auto_20640 ?auto_20642 ) ) ( not ( = ?auto_20640 ?auto_20646 ) ) ( not ( = ?auto_20640 ?auto_20652 ) ) ( not ( = ?auto_20643 ?auto_20651 ) ) ( not ( = ?auto_20643 ?auto_20644 ) ) ( not ( = ?auto_20643 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20621 ) ) ( not ( = ?auto_20616 ?auto_20657 ) ) ( not ( = ?auto_20617 ?auto_20621 ) ) ( not ( = ?auto_20617 ?auto_20657 ) ) ( not ( = ?auto_20618 ?auto_20621 ) ) ( not ( = ?auto_20618 ?auto_20657 ) ) ( not ( = ?auto_20619 ?auto_20621 ) ) ( not ( = ?auto_20619 ?auto_20657 ) ) ( not ( = ?auto_20621 ?auto_20643 ) ) ( not ( = ?auto_20621 ?auto_20651 ) ) ( not ( = ?auto_20621 ?auto_20644 ) ) ( not ( = ?auto_20621 ?auto_20658 ) ) ( not ( = ?auto_20650 ?auto_20641 ) ) ( not ( = ?auto_20650 ?auto_20648 ) ) ( not ( = ?auto_20650 ?auto_20660 ) ) ( not ( = ?auto_20650 ?auto_20656 ) ) ( not ( = ?auto_20649 ?auto_20640 ) ) ( not ( = ?auto_20649 ?auto_20642 ) ) ( not ( = ?auto_20649 ?auto_20646 ) ) ( not ( = ?auto_20649 ?auto_20652 ) ) ( not ( = ?auto_20657 ?auto_20643 ) ) ( not ( = ?auto_20657 ?auto_20651 ) ) ( not ( = ?auto_20657 ?auto_20644 ) ) ( not ( = ?auto_20657 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20622 ) ) ( not ( = ?auto_20616 ?auto_20638 ) ) ( not ( = ?auto_20617 ?auto_20622 ) ) ( not ( = ?auto_20617 ?auto_20638 ) ) ( not ( = ?auto_20618 ?auto_20622 ) ) ( not ( = ?auto_20618 ?auto_20638 ) ) ( not ( = ?auto_20619 ?auto_20622 ) ) ( not ( = ?auto_20619 ?auto_20638 ) ) ( not ( = ?auto_20620 ?auto_20622 ) ) ( not ( = ?auto_20620 ?auto_20638 ) ) ( not ( = ?auto_20622 ?auto_20657 ) ) ( not ( = ?auto_20622 ?auto_20643 ) ) ( not ( = ?auto_20622 ?auto_20651 ) ) ( not ( = ?auto_20622 ?auto_20644 ) ) ( not ( = ?auto_20622 ?auto_20658 ) ) ( not ( = ?auto_20638 ?auto_20657 ) ) ( not ( = ?auto_20638 ?auto_20643 ) ) ( not ( = ?auto_20638 ?auto_20651 ) ) ( not ( = ?auto_20638 ?auto_20644 ) ) ( not ( = ?auto_20638 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20623 ) ) ( not ( = ?auto_20616 ?auto_20659 ) ) ( not ( = ?auto_20617 ?auto_20623 ) ) ( not ( = ?auto_20617 ?auto_20659 ) ) ( not ( = ?auto_20618 ?auto_20623 ) ) ( not ( = ?auto_20618 ?auto_20659 ) ) ( not ( = ?auto_20619 ?auto_20623 ) ) ( not ( = ?auto_20619 ?auto_20659 ) ) ( not ( = ?auto_20620 ?auto_20623 ) ) ( not ( = ?auto_20620 ?auto_20659 ) ) ( not ( = ?auto_20621 ?auto_20623 ) ) ( not ( = ?auto_20621 ?auto_20659 ) ) ( not ( = ?auto_20623 ?auto_20638 ) ) ( not ( = ?auto_20623 ?auto_20657 ) ) ( not ( = ?auto_20623 ?auto_20643 ) ) ( not ( = ?auto_20623 ?auto_20651 ) ) ( not ( = ?auto_20623 ?auto_20644 ) ) ( not ( = ?auto_20623 ?auto_20658 ) ) ( not ( = ?auto_20659 ?auto_20638 ) ) ( not ( = ?auto_20659 ?auto_20657 ) ) ( not ( = ?auto_20659 ?auto_20643 ) ) ( not ( = ?auto_20659 ?auto_20651 ) ) ( not ( = ?auto_20659 ?auto_20644 ) ) ( not ( = ?auto_20659 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20624 ) ) ( not ( = ?auto_20616 ?auto_20647 ) ) ( not ( = ?auto_20617 ?auto_20624 ) ) ( not ( = ?auto_20617 ?auto_20647 ) ) ( not ( = ?auto_20618 ?auto_20624 ) ) ( not ( = ?auto_20618 ?auto_20647 ) ) ( not ( = ?auto_20619 ?auto_20624 ) ) ( not ( = ?auto_20619 ?auto_20647 ) ) ( not ( = ?auto_20620 ?auto_20624 ) ) ( not ( = ?auto_20620 ?auto_20647 ) ) ( not ( = ?auto_20621 ?auto_20624 ) ) ( not ( = ?auto_20621 ?auto_20647 ) ) ( not ( = ?auto_20622 ?auto_20624 ) ) ( not ( = ?auto_20622 ?auto_20647 ) ) ( not ( = ?auto_20624 ?auto_20659 ) ) ( not ( = ?auto_20624 ?auto_20638 ) ) ( not ( = ?auto_20624 ?auto_20657 ) ) ( not ( = ?auto_20624 ?auto_20643 ) ) ( not ( = ?auto_20624 ?auto_20651 ) ) ( not ( = ?auto_20624 ?auto_20644 ) ) ( not ( = ?auto_20624 ?auto_20658 ) ) ( not ( = ?auto_20647 ?auto_20659 ) ) ( not ( = ?auto_20647 ?auto_20638 ) ) ( not ( = ?auto_20647 ?auto_20657 ) ) ( not ( = ?auto_20647 ?auto_20643 ) ) ( not ( = ?auto_20647 ?auto_20651 ) ) ( not ( = ?auto_20647 ?auto_20644 ) ) ( not ( = ?auto_20647 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20625 ) ) ( not ( = ?auto_20616 ?auto_20653 ) ) ( not ( = ?auto_20617 ?auto_20625 ) ) ( not ( = ?auto_20617 ?auto_20653 ) ) ( not ( = ?auto_20618 ?auto_20625 ) ) ( not ( = ?auto_20618 ?auto_20653 ) ) ( not ( = ?auto_20619 ?auto_20625 ) ) ( not ( = ?auto_20619 ?auto_20653 ) ) ( not ( = ?auto_20620 ?auto_20625 ) ) ( not ( = ?auto_20620 ?auto_20653 ) ) ( not ( = ?auto_20621 ?auto_20625 ) ) ( not ( = ?auto_20621 ?auto_20653 ) ) ( not ( = ?auto_20622 ?auto_20625 ) ) ( not ( = ?auto_20622 ?auto_20653 ) ) ( not ( = ?auto_20623 ?auto_20625 ) ) ( not ( = ?auto_20623 ?auto_20653 ) ) ( not ( = ?auto_20625 ?auto_20647 ) ) ( not ( = ?auto_20625 ?auto_20659 ) ) ( not ( = ?auto_20625 ?auto_20638 ) ) ( not ( = ?auto_20625 ?auto_20657 ) ) ( not ( = ?auto_20625 ?auto_20643 ) ) ( not ( = ?auto_20625 ?auto_20651 ) ) ( not ( = ?auto_20625 ?auto_20644 ) ) ( not ( = ?auto_20625 ?auto_20658 ) ) ( not ( = ?auto_20645 ?auto_20660 ) ) ( not ( = ?auto_20645 ?auto_20650 ) ) ( not ( = ?auto_20645 ?auto_20641 ) ) ( not ( = ?auto_20645 ?auto_20648 ) ) ( not ( = ?auto_20645 ?auto_20656 ) ) ( not ( = ?auto_20654 ?auto_20646 ) ) ( not ( = ?auto_20654 ?auto_20649 ) ) ( not ( = ?auto_20654 ?auto_20640 ) ) ( not ( = ?auto_20654 ?auto_20642 ) ) ( not ( = ?auto_20654 ?auto_20652 ) ) ( not ( = ?auto_20653 ?auto_20647 ) ) ( not ( = ?auto_20653 ?auto_20659 ) ) ( not ( = ?auto_20653 ?auto_20638 ) ) ( not ( = ?auto_20653 ?auto_20657 ) ) ( not ( = ?auto_20653 ?auto_20643 ) ) ( not ( = ?auto_20653 ?auto_20651 ) ) ( not ( = ?auto_20653 ?auto_20644 ) ) ( not ( = ?auto_20653 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20626 ) ) ( not ( = ?auto_20616 ?auto_20639 ) ) ( not ( = ?auto_20617 ?auto_20626 ) ) ( not ( = ?auto_20617 ?auto_20639 ) ) ( not ( = ?auto_20618 ?auto_20626 ) ) ( not ( = ?auto_20618 ?auto_20639 ) ) ( not ( = ?auto_20619 ?auto_20626 ) ) ( not ( = ?auto_20619 ?auto_20639 ) ) ( not ( = ?auto_20620 ?auto_20626 ) ) ( not ( = ?auto_20620 ?auto_20639 ) ) ( not ( = ?auto_20621 ?auto_20626 ) ) ( not ( = ?auto_20621 ?auto_20639 ) ) ( not ( = ?auto_20622 ?auto_20626 ) ) ( not ( = ?auto_20622 ?auto_20639 ) ) ( not ( = ?auto_20623 ?auto_20626 ) ) ( not ( = ?auto_20623 ?auto_20639 ) ) ( not ( = ?auto_20624 ?auto_20626 ) ) ( not ( = ?auto_20624 ?auto_20639 ) ) ( not ( = ?auto_20626 ?auto_20653 ) ) ( not ( = ?auto_20626 ?auto_20647 ) ) ( not ( = ?auto_20626 ?auto_20659 ) ) ( not ( = ?auto_20626 ?auto_20638 ) ) ( not ( = ?auto_20626 ?auto_20657 ) ) ( not ( = ?auto_20626 ?auto_20643 ) ) ( not ( = ?auto_20626 ?auto_20651 ) ) ( not ( = ?auto_20626 ?auto_20644 ) ) ( not ( = ?auto_20626 ?auto_20658 ) ) ( not ( = ?auto_20663 ?auto_20645 ) ) ( not ( = ?auto_20663 ?auto_20660 ) ) ( not ( = ?auto_20663 ?auto_20650 ) ) ( not ( = ?auto_20663 ?auto_20641 ) ) ( not ( = ?auto_20663 ?auto_20648 ) ) ( not ( = ?auto_20663 ?auto_20656 ) ) ( not ( = ?auto_20655 ?auto_20654 ) ) ( not ( = ?auto_20655 ?auto_20646 ) ) ( not ( = ?auto_20655 ?auto_20649 ) ) ( not ( = ?auto_20655 ?auto_20640 ) ) ( not ( = ?auto_20655 ?auto_20642 ) ) ( not ( = ?auto_20655 ?auto_20652 ) ) ( not ( = ?auto_20639 ?auto_20653 ) ) ( not ( = ?auto_20639 ?auto_20647 ) ) ( not ( = ?auto_20639 ?auto_20659 ) ) ( not ( = ?auto_20639 ?auto_20638 ) ) ( not ( = ?auto_20639 ?auto_20657 ) ) ( not ( = ?auto_20639 ?auto_20643 ) ) ( not ( = ?auto_20639 ?auto_20651 ) ) ( not ( = ?auto_20639 ?auto_20644 ) ) ( not ( = ?auto_20639 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20627 ) ) ( not ( = ?auto_20616 ?auto_20665 ) ) ( not ( = ?auto_20617 ?auto_20627 ) ) ( not ( = ?auto_20617 ?auto_20665 ) ) ( not ( = ?auto_20618 ?auto_20627 ) ) ( not ( = ?auto_20618 ?auto_20665 ) ) ( not ( = ?auto_20619 ?auto_20627 ) ) ( not ( = ?auto_20619 ?auto_20665 ) ) ( not ( = ?auto_20620 ?auto_20627 ) ) ( not ( = ?auto_20620 ?auto_20665 ) ) ( not ( = ?auto_20621 ?auto_20627 ) ) ( not ( = ?auto_20621 ?auto_20665 ) ) ( not ( = ?auto_20622 ?auto_20627 ) ) ( not ( = ?auto_20622 ?auto_20665 ) ) ( not ( = ?auto_20623 ?auto_20627 ) ) ( not ( = ?auto_20623 ?auto_20665 ) ) ( not ( = ?auto_20624 ?auto_20627 ) ) ( not ( = ?auto_20624 ?auto_20665 ) ) ( not ( = ?auto_20625 ?auto_20627 ) ) ( not ( = ?auto_20625 ?auto_20665 ) ) ( not ( = ?auto_20627 ?auto_20639 ) ) ( not ( = ?auto_20627 ?auto_20653 ) ) ( not ( = ?auto_20627 ?auto_20647 ) ) ( not ( = ?auto_20627 ?auto_20659 ) ) ( not ( = ?auto_20627 ?auto_20638 ) ) ( not ( = ?auto_20627 ?auto_20657 ) ) ( not ( = ?auto_20627 ?auto_20643 ) ) ( not ( = ?auto_20627 ?auto_20651 ) ) ( not ( = ?auto_20627 ?auto_20644 ) ) ( not ( = ?auto_20627 ?auto_20658 ) ) ( not ( = ?auto_20665 ?auto_20639 ) ) ( not ( = ?auto_20665 ?auto_20653 ) ) ( not ( = ?auto_20665 ?auto_20647 ) ) ( not ( = ?auto_20665 ?auto_20659 ) ) ( not ( = ?auto_20665 ?auto_20638 ) ) ( not ( = ?auto_20665 ?auto_20657 ) ) ( not ( = ?auto_20665 ?auto_20643 ) ) ( not ( = ?auto_20665 ?auto_20651 ) ) ( not ( = ?auto_20665 ?auto_20644 ) ) ( not ( = ?auto_20665 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20628 ) ) ( not ( = ?auto_20616 ?auto_20662 ) ) ( not ( = ?auto_20617 ?auto_20628 ) ) ( not ( = ?auto_20617 ?auto_20662 ) ) ( not ( = ?auto_20618 ?auto_20628 ) ) ( not ( = ?auto_20618 ?auto_20662 ) ) ( not ( = ?auto_20619 ?auto_20628 ) ) ( not ( = ?auto_20619 ?auto_20662 ) ) ( not ( = ?auto_20620 ?auto_20628 ) ) ( not ( = ?auto_20620 ?auto_20662 ) ) ( not ( = ?auto_20621 ?auto_20628 ) ) ( not ( = ?auto_20621 ?auto_20662 ) ) ( not ( = ?auto_20622 ?auto_20628 ) ) ( not ( = ?auto_20622 ?auto_20662 ) ) ( not ( = ?auto_20623 ?auto_20628 ) ) ( not ( = ?auto_20623 ?auto_20662 ) ) ( not ( = ?auto_20624 ?auto_20628 ) ) ( not ( = ?auto_20624 ?auto_20662 ) ) ( not ( = ?auto_20625 ?auto_20628 ) ) ( not ( = ?auto_20625 ?auto_20662 ) ) ( not ( = ?auto_20626 ?auto_20628 ) ) ( not ( = ?auto_20626 ?auto_20662 ) ) ( not ( = ?auto_20628 ?auto_20665 ) ) ( not ( = ?auto_20628 ?auto_20639 ) ) ( not ( = ?auto_20628 ?auto_20653 ) ) ( not ( = ?auto_20628 ?auto_20647 ) ) ( not ( = ?auto_20628 ?auto_20659 ) ) ( not ( = ?auto_20628 ?auto_20638 ) ) ( not ( = ?auto_20628 ?auto_20657 ) ) ( not ( = ?auto_20628 ?auto_20643 ) ) ( not ( = ?auto_20628 ?auto_20651 ) ) ( not ( = ?auto_20628 ?auto_20644 ) ) ( not ( = ?auto_20628 ?auto_20658 ) ) ( not ( = ?auto_20662 ?auto_20665 ) ) ( not ( = ?auto_20662 ?auto_20639 ) ) ( not ( = ?auto_20662 ?auto_20653 ) ) ( not ( = ?auto_20662 ?auto_20647 ) ) ( not ( = ?auto_20662 ?auto_20659 ) ) ( not ( = ?auto_20662 ?auto_20638 ) ) ( not ( = ?auto_20662 ?auto_20657 ) ) ( not ( = ?auto_20662 ?auto_20643 ) ) ( not ( = ?auto_20662 ?auto_20651 ) ) ( not ( = ?auto_20662 ?auto_20644 ) ) ( not ( = ?auto_20662 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20630 ) ) ( not ( = ?auto_20616 ?auto_20664 ) ) ( not ( = ?auto_20617 ?auto_20630 ) ) ( not ( = ?auto_20617 ?auto_20664 ) ) ( not ( = ?auto_20618 ?auto_20630 ) ) ( not ( = ?auto_20618 ?auto_20664 ) ) ( not ( = ?auto_20619 ?auto_20630 ) ) ( not ( = ?auto_20619 ?auto_20664 ) ) ( not ( = ?auto_20620 ?auto_20630 ) ) ( not ( = ?auto_20620 ?auto_20664 ) ) ( not ( = ?auto_20621 ?auto_20630 ) ) ( not ( = ?auto_20621 ?auto_20664 ) ) ( not ( = ?auto_20622 ?auto_20630 ) ) ( not ( = ?auto_20622 ?auto_20664 ) ) ( not ( = ?auto_20623 ?auto_20630 ) ) ( not ( = ?auto_20623 ?auto_20664 ) ) ( not ( = ?auto_20624 ?auto_20630 ) ) ( not ( = ?auto_20624 ?auto_20664 ) ) ( not ( = ?auto_20625 ?auto_20630 ) ) ( not ( = ?auto_20625 ?auto_20664 ) ) ( not ( = ?auto_20626 ?auto_20630 ) ) ( not ( = ?auto_20626 ?auto_20664 ) ) ( not ( = ?auto_20627 ?auto_20630 ) ) ( not ( = ?auto_20627 ?auto_20664 ) ) ( not ( = ?auto_20630 ?auto_20662 ) ) ( not ( = ?auto_20630 ?auto_20665 ) ) ( not ( = ?auto_20630 ?auto_20639 ) ) ( not ( = ?auto_20630 ?auto_20653 ) ) ( not ( = ?auto_20630 ?auto_20647 ) ) ( not ( = ?auto_20630 ?auto_20659 ) ) ( not ( = ?auto_20630 ?auto_20638 ) ) ( not ( = ?auto_20630 ?auto_20657 ) ) ( not ( = ?auto_20630 ?auto_20643 ) ) ( not ( = ?auto_20630 ?auto_20651 ) ) ( not ( = ?auto_20630 ?auto_20644 ) ) ( not ( = ?auto_20630 ?auto_20658 ) ) ( not ( = ?auto_20664 ?auto_20662 ) ) ( not ( = ?auto_20664 ?auto_20665 ) ) ( not ( = ?auto_20664 ?auto_20639 ) ) ( not ( = ?auto_20664 ?auto_20653 ) ) ( not ( = ?auto_20664 ?auto_20647 ) ) ( not ( = ?auto_20664 ?auto_20659 ) ) ( not ( = ?auto_20664 ?auto_20638 ) ) ( not ( = ?auto_20664 ?auto_20657 ) ) ( not ( = ?auto_20664 ?auto_20643 ) ) ( not ( = ?auto_20664 ?auto_20651 ) ) ( not ( = ?auto_20664 ?auto_20644 ) ) ( not ( = ?auto_20664 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20629 ) ) ( not ( = ?auto_20616 ?auto_20661 ) ) ( not ( = ?auto_20617 ?auto_20629 ) ) ( not ( = ?auto_20617 ?auto_20661 ) ) ( not ( = ?auto_20618 ?auto_20629 ) ) ( not ( = ?auto_20618 ?auto_20661 ) ) ( not ( = ?auto_20619 ?auto_20629 ) ) ( not ( = ?auto_20619 ?auto_20661 ) ) ( not ( = ?auto_20620 ?auto_20629 ) ) ( not ( = ?auto_20620 ?auto_20661 ) ) ( not ( = ?auto_20621 ?auto_20629 ) ) ( not ( = ?auto_20621 ?auto_20661 ) ) ( not ( = ?auto_20622 ?auto_20629 ) ) ( not ( = ?auto_20622 ?auto_20661 ) ) ( not ( = ?auto_20623 ?auto_20629 ) ) ( not ( = ?auto_20623 ?auto_20661 ) ) ( not ( = ?auto_20624 ?auto_20629 ) ) ( not ( = ?auto_20624 ?auto_20661 ) ) ( not ( = ?auto_20625 ?auto_20629 ) ) ( not ( = ?auto_20625 ?auto_20661 ) ) ( not ( = ?auto_20626 ?auto_20629 ) ) ( not ( = ?auto_20626 ?auto_20661 ) ) ( not ( = ?auto_20627 ?auto_20629 ) ) ( not ( = ?auto_20627 ?auto_20661 ) ) ( not ( = ?auto_20628 ?auto_20629 ) ) ( not ( = ?auto_20628 ?auto_20661 ) ) ( not ( = ?auto_20629 ?auto_20664 ) ) ( not ( = ?auto_20629 ?auto_20662 ) ) ( not ( = ?auto_20629 ?auto_20665 ) ) ( not ( = ?auto_20629 ?auto_20639 ) ) ( not ( = ?auto_20629 ?auto_20653 ) ) ( not ( = ?auto_20629 ?auto_20647 ) ) ( not ( = ?auto_20629 ?auto_20659 ) ) ( not ( = ?auto_20629 ?auto_20638 ) ) ( not ( = ?auto_20629 ?auto_20657 ) ) ( not ( = ?auto_20629 ?auto_20643 ) ) ( not ( = ?auto_20629 ?auto_20651 ) ) ( not ( = ?auto_20629 ?auto_20644 ) ) ( not ( = ?auto_20629 ?auto_20658 ) ) ( not ( = ?auto_20661 ?auto_20664 ) ) ( not ( = ?auto_20661 ?auto_20662 ) ) ( not ( = ?auto_20661 ?auto_20665 ) ) ( not ( = ?auto_20661 ?auto_20639 ) ) ( not ( = ?auto_20661 ?auto_20653 ) ) ( not ( = ?auto_20661 ?auto_20647 ) ) ( not ( = ?auto_20661 ?auto_20659 ) ) ( not ( = ?auto_20661 ?auto_20638 ) ) ( not ( = ?auto_20661 ?auto_20657 ) ) ( not ( = ?auto_20661 ?auto_20643 ) ) ( not ( = ?auto_20661 ?auto_20651 ) ) ( not ( = ?auto_20661 ?auto_20644 ) ) ( not ( = ?auto_20661 ?auto_20658 ) ) ( not ( = ?auto_20616 ?auto_20631 ) ) ( not ( = ?auto_20616 ?auto_20633 ) ) ( not ( = ?auto_20617 ?auto_20631 ) ) ( not ( = ?auto_20617 ?auto_20633 ) ) ( not ( = ?auto_20618 ?auto_20631 ) ) ( not ( = ?auto_20618 ?auto_20633 ) ) ( not ( = ?auto_20619 ?auto_20631 ) ) ( not ( = ?auto_20619 ?auto_20633 ) ) ( not ( = ?auto_20620 ?auto_20631 ) ) ( not ( = ?auto_20620 ?auto_20633 ) ) ( not ( = ?auto_20621 ?auto_20631 ) ) ( not ( = ?auto_20621 ?auto_20633 ) ) ( not ( = ?auto_20622 ?auto_20631 ) ) ( not ( = ?auto_20622 ?auto_20633 ) ) ( not ( = ?auto_20623 ?auto_20631 ) ) ( not ( = ?auto_20623 ?auto_20633 ) ) ( not ( = ?auto_20624 ?auto_20631 ) ) ( not ( = ?auto_20624 ?auto_20633 ) ) ( not ( = ?auto_20625 ?auto_20631 ) ) ( not ( = ?auto_20625 ?auto_20633 ) ) ( not ( = ?auto_20626 ?auto_20631 ) ) ( not ( = ?auto_20626 ?auto_20633 ) ) ( not ( = ?auto_20627 ?auto_20631 ) ) ( not ( = ?auto_20627 ?auto_20633 ) ) ( not ( = ?auto_20628 ?auto_20631 ) ) ( not ( = ?auto_20628 ?auto_20633 ) ) ( not ( = ?auto_20630 ?auto_20631 ) ) ( not ( = ?auto_20630 ?auto_20633 ) ) ( not ( = ?auto_20631 ?auto_20661 ) ) ( not ( = ?auto_20631 ?auto_20664 ) ) ( not ( = ?auto_20631 ?auto_20662 ) ) ( not ( = ?auto_20631 ?auto_20665 ) ) ( not ( = ?auto_20631 ?auto_20639 ) ) ( not ( = ?auto_20631 ?auto_20653 ) ) ( not ( = ?auto_20631 ?auto_20647 ) ) ( not ( = ?auto_20631 ?auto_20659 ) ) ( not ( = ?auto_20631 ?auto_20638 ) ) ( not ( = ?auto_20631 ?auto_20657 ) ) ( not ( = ?auto_20631 ?auto_20643 ) ) ( not ( = ?auto_20631 ?auto_20651 ) ) ( not ( = ?auto_20631 ?auto_20644 ) ) ( not ( = ?auto_20631 ?auto_20658 ) ) ( not ( = ?auto_20635 ?auto_20648 ) ) ( not ( = ?auto_20635 ?auto_20641 ) ) ( not ( = ?auto_20635 ?auto_20663 ) ) ( not ( = ?auto_20635 ?auto_20656 ) ) ( not ( = ?auto_20635 ?auto_20645 ) ) ( not ( = ?auto_20635 ?auto_20660 ) ) ( not ( = ?auto_20635 ?auto_20650 ) ) ( not ( = ?auto_20632 ?auto_20642 ) ) ( not ( = ?auto_20632 ?auto_20640 ) ) ( not ( = ?auto_20632 ?auto_20655 ) ) ( not ( = ?auto_20632 ?auto_20652 ) ) ( not ( = ?auto_20632 ?auto_20654 ) ) ( not ( = ?auto_20632 ?auto_20646 ) ) ( not ( = ?auto_20632 ?auto_20649 ) ) ( not ( = ?auto_20633 ?auto_20661 ) ) ( not ( = ?auto_20633 ?auto_20664 ) ) ( not ( = ?auto_20633 ?auto_20662 ) ) ( not ( = ?auto_20633 ?auto_20665 ) ) ( not ( = ?auto_20633 ?auto_20639 ) ) ( not ( = ?auto_20633 ?auto_20653 ) ) ( not ( = ?auto_20633 ?auto_20647 ) ) ( not ( = ?auto_20633 ?auto_20659 ) ) ( not ( = ?auto_20633 ?auto_20638 ) ) ( not ( = ?auto_20633 ?auto_20657 ) ) ( not ( = ?auto_20633 ?auto_20643 ) ) ( not ( = ?auto_20633 ?auto_20651 ) ) ( not ( = ?auto_20633 ?auto_20644 ) ) ( not ( = ?auto_20633 ?auto_20658 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ?auto_20621 ?auto_20622 ?auto_20623 ?auto_20624 ?auto_20625 ?auto_20626 ?auto_20627 ?auto_20628 ?auto_20630 ?auto_20629 )
      ( MAKE-1CRATE ?auto_20629 ?auto_20631 )
      ( MAKE-15CRATE-VERIFY ?auto_20616 ?auto_20617 ?auto_20618 ?auto_20619 ?auto_20620 ?auto_20621 ?auto_20622 ?auto_20623 ?auto_20624 ?auto_20625 ?auto_20626 ?auto_20627 ?auto_20628 ?auto_20630 ?auto_20629 ?auto_20631 ) )
  )

)

