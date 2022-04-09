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

  ( :method MAKE-16CRATE-VERIFY
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
      ?c16 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( ON ?c7 ?c6 ) ( ON ?c8 ?c7 ) ( ON ?c9 ?c8 ) ( ON ?c10 ?c9 ) ( ON ?c11 ?c10 ) ( ON ?c12 ?c11 ) ( ON ?c13 ?c12 ) ( ON ?c14 ?c13 ) ( ON ?c15 ?c14 ) ( ON ?c16 ?c15 ) ( CLEAR ?c16 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128038 - SURFACE
      ?auto_2128039 - SURFACE
    )
    :vars
    (
      ?auto_2128040 - HOIST
      ?auto_2128041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128040 ?auto_2128041 ) ( SURFACE-AT ?auto_2128038 ?auto_2128041 ) ( CLEAR ?auto_2128038 ) ( LIFTING ?auto_2128040 ?auto_2128039 ) ( IS-CRATE ?auto_2128039 ) ( not ( = ?auto_2128038 ?auto_2128039 ) ) )
    :subtasks
    ( ( !DROP ?auto_2128040 ?auto_2128039 ?auto_2128038 ?auto_2128041 )
      ( MAKE-1CRATE-VERIFY ?auto_2128038 ?auto_2128039 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128042 - SURFACE
      ?auto_2128043 - SURFACE
    )
    :vars
    (
      ?auto_2128045 - HOIST
      ?auto_2128044 - PLACE
      ?auto_2128046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128045 ?auto_2128044 ) ( SURFACE-AT ?auto_2128042 ?auto_2128044 ) ( CLEAR ?auto_2128042 ) ( IS-CRATE ?auto_2128043 ) ( not ( = ?auto_2128042 ?auto_2128043 ) ) ( TRUCK-AT ?auto_2128046 ?auto_2128044 ) ( AVAILABLE ?auto_2128045 ) ( IN ?auto_2128043 ?auto_2128046 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2128045 ?auto_2128043 ?auto_2128046 ?auto_2128044 )
      ( MAKE-1CRATE ?auto_2128042 ?auto_2128043 )
      ( MAKE-1CRATE-VERIFY ?auto_2128042 ?auto_2128043 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128047 - SURFACE
      ?auto_2128048 - SURFACE
    )
    :vars
    (
      ?auto_2128049 - HOIST
      ?auto_2128050 - PLACE
      ?auto_2128051 - TRUCK
      ?auto_2128052 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128049 ?auto_2128050 ) ( SURFACE-AT ?auto_2128047 ?auto_2128050 ) ( CLEAR ?auto_2128047 ) ( IS-CRATE ?auto_2128048 ) ( not ( = ?auto_2128047 ?auto_2128048 ) ) ( AVAILABLE ?auto_2128049 ) ( IN ?auto_2128048 ?auto_2128051 ) ( TRUCK-AT ?auto_2128051 ?auto_2128052 ) ( not ( = ?auto_2128052 ?auto_2128050 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128051 ?auto_2128052 ?auto_2128050 )
      ( MAKE-1CRATE ?auto_2128047 ?auto_2128048 )
      ( MAKE-1CRATE-VERIFY ?auto_2128047 ?auto_2128048 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128053 - SURFACE
      ?auto_2128054 - SURFACE
    )
    :vars
    (
      ?auto_2128058 - HOIST
      ?auto_2128056 - PLACE
      ?auto_2128057 - TRUCK
      ?auto_2128055 - PLACE
      ?auto_2128059 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128058 ?auto_2128056 ) ( SURFACE-AT ?auto_2128053 ?auto_2128056 ) ( CLEAR ?auto_2128053 ) ( IS-CRATE ?auto_2128054 ) ( not ( = ?auto_2128053 ?auto_2128054 ) ) ( AVAILABLE ?auto_2128058 ) ( TRUCK-AT ?auto_2128057 ?auto_2128055 ) ( not ( = ?auto_2128055 ?auto_2128056 ) ) ( HOIST-AT ?auto_2128059 ?auto_2128055 ) ( LIFTING ?auto_2128059 ?auto_2128054 ) ( not ( = ?auto_2128058 ?auto_2128059 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2128059 ?auto_2128054 ?auto_2128057 ?auto_2128055 )
      ( MAKE-1CRATE ?auto_2128053 ?auto_2128054 )
      ( MAKE-1CRATE-VERIFY ?auto_2128053 ?auto_2128054 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128060 - SURFACE
      ?auto_2128061 - SURFACE
    )
    :vars
    (
      ?auto_2128064 - HOIST
      ?auto_2128065 - PLACE
      ?auto_2128062 - TRUCK
      ?auto_2128063 - PLACE
      ?auto_2128066 - HOIST
      ?auto_2128067 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128064 ?auto_2128065 ) ( SURFACE-AT ?auto_2128060 ?auto_2128065 ) ( CLEAR ?auto_2128060 ) ( IS-CRATE ?auto_2128061 ) ( not ( = ?auto_2128060 ?auto_2128061 ) ) ( AVAILABLE ?auto_2128064 ) ( TRUCK-AT ?auto_2128062 ?auto_2128063 ) ( not ( = ?auto_2128063 ?auto_2128065 ) ) ( HOIST-AT ?auto_2128066 ?auto_2128063 ) ( not ( = ?auto_2128064 ?auto_2128066 ) ) ( AVAILABLE ?auto_2128066 ) ( SURFACE-AT ?auto_2128061 ?auto_2128063 ) ( ON ?auto_2128061 ?auto_2128067 ) ( CLEAR ?auto_2128061 ) ( not ( = ?auto_2128060 ?auto_2128067 ) ) ( not ( = ?auto_2128061 ?auto_2128067 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2128066 ?auto_2128061 ?auto_2128067 ?auto_2128063 )
      ( MAKE-1CRATE ?auto_2128060 ?auto_2128061 )
      ( MAKE-1CRATE-VERIFY ?auto_2128060 ?auto_2128061 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128068 - SURFACE
      ?auto_2128069 - SURFACE
    )
    :vars
    (
      ?auto_2128071 - HOIST
      ?auto_2128072 - PLACE
      ?auto_2128070 - PLACE
      ?auto_2128074 - HOIST
      ?auto_2128073 - SURFACE
      ?auto_2128075 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128071 ?auto_2128072 ) ( SURFACE-AT ?auto_2128068 ?auto_2128072 ) ( CLEAR ?auto_2128068 ) ( IS-CRATE ?auto_2128069 ) ( not ( = ?auto_2128068 ?auto_2128069 ) ) ( AVAILABLE ?auto_2128071 ) ( not ( = ?auto_2128070 ?auto_2128072 ) ) ( HOIST-AT ?auto_2128074 ?auto_2128070 ) ( not ( = ?auto_2128071 ?auto_2128074 ) ) ( AVAILABLE ?auto_2128074 ) ( SURFACE-AT ?auto_2128069 ?auto_2128070 ) ( ON ?auto_2128069 ?auto_2128073 ) ( CLEAR ?auto_2128069 ) ( not ( = ?auto_2128068 ?auto_2128073 ) ) ( not ( = ?auto_2128069 ?auto_2128073 ) ) ( TRUCK-AT ?auto_2128075 ?auto_2128072 ) )
    :subtasks
    ( ( !DRIVE ?auto_2128075 ?auto_2128072 ?auto_2128070 )
      ( MAKE-1CRATE ?auto_2128068 ?auto_2128069 )
      ( MAKE-1CRATE-VERIFY ?auto_2128068 ?auto_2128069 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128085 - SURFACE
      ?auto_2128086 - SURFACE
      ?auto_2128087 - SURFACE
    )
    :vars
    (
      ?auto_2128088 - HOIST
      ?auto_2128089 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128088 ?auto_2128089 ) ( SURFACE-AT ?auto_2128086 ?auto_2128089 ) ( CLEAR ?auto_2128086 ) ( LIFTING ?auto_2128088 ?auto_2128087 ) ( IS-CRATE ?auto_2128087 ) ( not ( = ?auto_2128086 ?auto_2128087 ) ) ( ON ?auto_2128086 ?auto_2128085 ) ( not ( = ?auto_2128085 ?auto_2128086 ) ) ( not ( = ?auto_2128085 ?auto_2128087 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128086 ?auto_2128087 )
      ( MAKE-2CRATE-VERIFY ?auto_2128085 ?auto_2128086 ?auto_2128087 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128095 - SURFACE
      ?auto_2128096 - SURFACE
      ?auto_2128097 - SURFACE
    )
    :vars
    (
      ?auto_2128098 - HOIST
      ?auto_2128099 - PLACE
      ?auto_2128100 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128098 ?auto_2128099 ) ( SURFACE-AT ?auto_2128096 ?auto_2128099 ) ( CLEAR ?auto_2128096 ) ( IS-CRATE ?auto_2128097 ) ( not ( = ?auto_2128096 ?auto_2128097 ) ) ( TRUCK-AT ?auto_2128100 ?auto_2128099 ) ( AVAILABLE ?auto_2128098 ) ( IN ?auto_2128097 ?auto_2128100 ) ( ON ?auto_2128096 ?auto_2128095 ) ( not ( = ?auto_2128095 ?auto_2128096 ) ) ( not ( = ?auto_2128095 ?auto_2128097 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128096 ?auto_2128097 )
      ( MAKE-2CRATE-VERIFY ?auto_2128095 ?auto_2128096 ?auto_2128097 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128101 - SURFACE
      ?auto_2128102 - SURFACE
    )
    :vars
    (
      ?auto_2128103 - HOIST
      ?auto_2128105 - PLACE
      ?auto_2128106 - TRUCK
      ?auto_2128104 - SURFACE
      ?auto_2128107 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128103 ?auto_2128105 ) ( SURFACE-AT ?auto_2128101 ?auto_2128105 ) ( CLEAR ?auto_2128101 ) ( IS-CRATE ?auto_2128102 ) ( not ( = ?auto_2128101 ?auto_2128102 ) ) ( AVAILABLE ?auto_2128103 ) ( IN ?auto_2128102 ?auto_2128106 ) ( ON ?auto_2128101 ?auto_2128104 ) ( not ( = ?auto_2128104 ?auto_2128101 ) ) ( not ( = ?auto_2128104 ?auto_2128102 ) ) ( TRUCK-AT ?auto_2128106 ?auto_2128107 ) ( not ( = ?auto_2128107 ?auto_2128105 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128106 ?auto_2128107 ?auto_2128105 )
      ( MAKE-2CRATE ?auto_2128104 ?auto_2128101 ?auto_2128102 )
      ( MAKE-1CRATE-VERIFY ?auto_2128101 ?auto_2128102 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128108 - SURFACE
      ?auto_2128109 - SURFACE
      ?auto_2128110 - SURFACE
    )
    :vars
    (
      ?auto_2128114 - HOIST
      ?auto_2128112 - PLACE
      ?auto_2128111 - TRUCK
      ?auto_2128113 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128114 ?auto_2128112 ) ( SURFACE-AT ?auto_2128109 ?auto_2128112 ) ( CLEAR ?auto_2128109 ) ( IS-CRATE ?auto_2128110 ) ( not ( = ?auto_2128109 ?auto_2128110 ) ) ( AVAILABLE ?auto_2128114 ) ( IN ?auto_2128110 ?auto_2128111 ) ( ON ?auto_2128109 ?auto_2128108 ) ( not ( = ?auto_2128108 ?auto_2128109 ) ) ( not ( = ?auto_2128108 ?auto_2128110 ) ) ( TRUCK-AT ?auto_2128111 ?auto_2128113 ) ( not ( = ?auto_2128113 ?auto_2128112 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128109 ?auto_2128110 )
      ( MAKE-2CRATE-VERIFY ?auto_2128108 ?auto_2128109 ?auto_2128110 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128115 - SURFACE
      ?auto_2128116 - SURFACE
    )
    :vars
    (
      ?auto_2128120 - HOIST
      ?auto_2128119 - PLACE
      ?auto_2128121 - SURFACE
      ?auto_2128117 - TRUCK
      ?auto_2128118 - PLACE
      ?auto_2128122 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128120 ?auto_2128119 ) ( SURFACE-AT ?auto_2128115 ?auto_2128119 ) ( CLEAR ?auto_2128115 ) ( IS-CRATE ?auto_2128116 ) ( not ( = ?auto_2128115 ?auto_2128116 ) ) ( AVAILABLE ?auto_2128120 ) ( ON ?auto_2128115 ?auto_2128121 ) ( not ( = ?auto_2128121 ?auto_2128115 ) ) ( not ( = ?auto_2128121 ?auto_2128116 ) ) ( TRUCK-AT ?auto_2128117 ?auto_2128118 ) ( not ( = ?auto_2128118 ?auto_2128119 ) ) ( HOIST-AT ?auto_2128122 ?auto_2128118 ) ( LIFTING ?auto_2128122 ?auto_2128116 ) ( not ( = ?auto_2128120 ?auto_2128122 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2128122 ?auto_2128116 ?auto_2128117 ?auto_2128118 )
      ( MAKE-2CRATE ?auto_2128121 ?auto_2128115 ?auto_2128116 )
      ( MAKE-1CRATE-VERIFY ?auto_2128115 ?auto_2128116 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128123 - SURFACE
      ?auto_2128124 - SURFACE
      ?auto_2128125 - SURFACE
    )
    :vars
    (
      ?auto_2128127 - HOIST
      ?auto_2128126 - PLACE
      ?auto_2128130 - TRUCK
      ?auto_2128129 - PLACE
      ?auto_2128128 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128127 ?auto_2128126 ) ( SURFACE-AT ?auto_2128124 ?auto_2128126 ) ( CLEAR ?auto_2128124 ) ( IS-CRATE ?auto_2128125 ) ( not ( = ?auto_2128124 ?auto_2128125 ) ) ( AVAILABLE ?auto_2128127 ) ( ON ?auto_2128124 ?auto_2128123 ) ( not ( = ?auto_2128123 ?auto_2128124 ) ) ( not ( = ?auto_2128123 ?auto_2128125 ) ) ( TRUCK-AT ?auto_2128130 ?auto_2128129 ) ( not ( = ?auto_2128129 ?auto_2128126 ) ) ( HOIST-AT ?auto_2128128 ?auto_2128129 ) ( LIFTING ?auto_2128128 ?auto_2128125 ) ( not ( = ?auto_2128127 ?auto_2128128 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128124 ?auto_2128125 )
      ( MAKE-2CRATE-VERIFY ?auto_2128123 ?auto_2128124 ?auto_2128125 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128131 - SURFACE
      ?auto_2128132 - SURFACE
    )
    :vars
    (
      ?auto_2128134 - HOIST
      ?auto_2128138 - PLACE
      ?auto_2128133 - SURFACE
      ?auto_2128137 - TRUCK
      ?auto_2128136 - PLACE
      ?auto_2128135 - HOIST
      ?auto_2128139 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128134 ?auto_2128138 ) ( SURFACE-AT ?auto_2128131 ?auto_2128138 ) ( CLEAR ?auto_2128131 ) ( IS-CRATE ?auto_2128132 ) ( not ( = ?auto_2128131 ?auto_2128132 ) ) ( AVAILABLE ?auto_2128134 ) ( ON ?auto_2128131 ?auto_2128133 ) ( not ( = ?auto_2128133 ?auto_2128131 ) ) ( not ( = ?auto_2128133 ?auto_2128132 ) ) ( TRUCK-AT ?auto_2128137 ?auto_2128136 ) ( not ( = ?auto_2128136 ?auto_2128138 ) ) ( HOIST-AT ?auto_2128135 ?auto_2128136 ) ( not ( = ?auto_2128134 ?auto_2128135 ) ) ( AVAILABLE ?auto_2128135 ) ( SURFACE-AT ?auto_2128132 ?auto_2128136 ) ( ON ?auto_2128132 ?auto_2128139 ) ( CLEAR ?auto_2128132 ) ( not ( = ?auto_2128131 ?auto_2128139 ) ) ( not ( = ?auto_2128132 ?auto_2128139 ) ) ( not ( = ?auto_2128133 ?auto_2128139 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2128135 ?auto_2128132 ?auto_2128139 ?auto_2128136 )
      ( MAKE-2CRATE ?auto_2128133 ?auto_2128131 ?auto_2128132 )
      ( MAKE-1CRATE-VERIFY ?auto_2128131 ?auto_2128132 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128140 - SURFACE
      ?auto_2128141 - SURFACE
      ?auto_2128142 - SURFACE
    )
    :vars
    (
      ?auto_2128144 - HOIST
      ?auto_2128143 - PLACE
      ?auto_2128145 - TRUCK
      ?auto_2128146 - PLACE
      ?auto_2128148 - HOIST
      ?auto_2128147 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128144 ?auto_2128143 ) ( SURFACE-AT ?auto_2128141 ?auto_2128143 ) ( CLEAR ?auto_2128141 ) ( IS-CRATE ?auto_2128142 ) ( not ( = ?auto_2128141 ?auto_2128142 ) ) ( AVAILABLE ?auto_2128144 ) ( ON ?auto_2128141 ?auto_2128140 ) ( not ( = ?auto_2128140 ?auto_2128141 ) ) ( not ( = ?auto_2128140 ?auto_2128142 ) ) ( TRUCK-AT ?auto_2128145 ?auto_2128146 ) ( not ( = ?auto_2128146 ?auto_2128143 ) ) ( HOIST-AT ?auto_2128148 ?auto_2128146 ) ( not ( = ?auto_2128144 ?auto_2128148 ) ) ( AVAILABLE ?auto_2128148 ) ( SURFACE-AT ?auto_2128142 ?auto_2128146 ) ( ON ?auto_2128142 ?auto_2128147 ) ( CLEAR ?auto_2128142 ) ( not ( = ?auto_2128141 ?auto_2128147 ) ) ( not ( = ?auto_2128142 ?auto_2128147 ) ) ( not ( = ?auto_2128140 ?auto_2128147 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128141 ?auto_2128142 )
      ( MAKE-2CRATE-VERIFY ?auto_2128140 ?auto_2128141 ?auto_2128142 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128149 - SURFACE
      ?auto_2128150 - SURFACE
    )
    :vars
    (
      ?auto_2128151 - HOIST
      ?auto_2128156 - PLACE
      ?auto_2128154 - SURFACE
      ?auto_2128152 - PLACE
      ?auto_2128157 - HOIST
      ?auto_2128153 - SURFACE
      ?auto_2128155 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128151 ?auto_2128156 ) ( SURFACE-AT ?auto_2128149 ?auto_2128156 ) ( CLEAR ?auto_2128149 ) ( IS-CRATE ?auto_2128150 ) ( not ( = ?auto_2128149 ?auto_2128150 ) ) ( AVAILABLE ?auto_2128151 ) ( ON ?auto_2128149 ?auto_2128154 ) ( not ( = ?auto_2128154 ?auto_2128149 ) ) ( not ( = ?auto_2128154 ?auto_2128150 ) ) ( not ( = ?auto_2128152 ?auto_2128156 ) ) ( HOIST-AT ?auto_2128157 ?auto_2128152 ) ( not ( = ?auto_2128151 ?auto_2128157 ) ) ( AVAILABLE ?auto_2128157 ) ( SURFACE-AT ?auto_2128150 ?auto_2128152 ) ( ON ?auto_2128150 ?auto_2128153 ) ( CLEAR ?auto_2128150 ) ( not ( = ?auto_2128149 ?auto_2128153 ) ) ( not ( = ?auto_2128150 ?auto_2128153 ) ) ( not ( = ?auto_2128154 ?auto_2128153 ) ) ( TRUCK-AT ?auto_2128155 ?auto_2128156 ) )
    :subtasks
    ( ( !DRIVE ?auto_2128155 ?auto_2128156 ?auto_2128152 )
      ( MAKE-2CRATE ?auto_2128154 ?auto_2128149 ?auto_2128150 )
      ( MAKE-1CRATE-VERIFY ?auto_2128149 ?auto_2128150 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128158 - SURFACE
      ?auto_2128159 - SURFACE
      ?auto_2128160 - SURFACE
    )
    :vars
    (
      ?auto_2128162 - HOIST
      ?auto_2128165 - PLACE
      ?auto_2128164 - PLACE
      ?auto_2128166 - HOIST
      ?auto_2128161 - SURFACE
      ?auto_2128163 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128162 ?auto_2128165 ) ( SURFACE-AT ?auto_2128159 ?auto_2128165 ) ( CLEAR ?auto_2128159 ) ( IS-CRATE ?auto_2128160 ) ( not ( = ?auto_2128159 ?auto_2128160 ) ) ( AVAILABLE ?auto_2128162 ) ( ON ?auto_2128159 ?auto_2128158 ) ( not ( = ?auto_2128158 ?auto_2128159 ) ) ( not ( = ?auto_2128158 ?auto_2128160 ) ) ( not ( = ?auto_2128164 ?auto_2128165 ) ) ( HOIST-AT ?auto_2128166 ?auto_2128164 ) ( not ( = ?auto_2128162 ?auto_2128166 ) ) ( AVAILABLE ?auto_2128166 ) ( SURFACE-AT ?auto_2128160 ?auto_2128164 ) ( ON ?auto_2128160 ?auto_2128161 ) ( CLEAR ?auto_2128160 ) ( not ( = ?auto_2128159 ?auto_2128161 ) ) ( not ( = ?auto_2128160 ?auto_2128161 ) ) ( not ( = ?auto_2128158 ?auto_2128161 ) ) ( TRUCK-AT ?auto_2128163 ?auto_2128165 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128159 ?auto_2128160 )
      ( MAKE-2CRATE-VERIFY ?auto_2128158 ?auto_2128159 ?auto_2128160 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128167 - SURFACE
      ?auto_2128168 - SURFACE
    )
    :vars
    (
      ?auto_2128175 - HOIST
      ?auto_2128174 - PLACE
      ?auto_2128169 - SURFACE
      ?auto_2128173 - PLACE
      ?auto_2128172 - HOIST
      ?auto_2128171 - SURFACE
      ?auto_2128170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128175 ?auto_2128174 ) ( IS-CRATE ?auto_2128168 ) ( not ( = ?auto_2128167 ?auto_2128168 ) ) ( not ( = ?auto_2128169 ?auto_2128167 ) ) ( not ( = ?auto_2128169 ?auto_2128168 ) ) ( not ( = ?auto_2128173 ?auto_2128174 ) ) ( HOIST-AT ?auto_2128172 ?auto_2128173 ) ( not ( = ?auto_2128175 ?auto_2128172 ) ) ( AVAILABLE ?auto_2128172 ) ( SURFACE-AT ?auto_2128168 ?auto_2128173 ) ( ON ?auto_2128168 ?auto_2128171 ) ( CLEAR ?auto_2128168 ) ( not ( = ?auto_2128167 ?auto_2128171 ) ) ( not ( = ?auto_2128168 ?auto_2128171 ) ) ( not ( = ?auto_2128169 ?auto_2128171 ) ) ( TRUCK-AT ?auto_2128170 ?auto_2128174 ) ( SURFACE-AT ?auto_2128169 ?auto_2128174 ) ( CLEAR ?auto_2128169 ) ( LIFTING ?auto_2128175 ?auto_2128167 ) ( IS-CRATE ?auto_2128167 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128169 ?auto_2128167 )
      ( MAKE-2CRATE ?auto_2128169 ?auto_2128167 ?auto_2128168 )
      ( MAKE-1CRATE-VERIFY ?auto_2128167 ?auto_2128168 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128176 - SURFACE
      ?auto_2128177 - SURFACE
      ?auto_2128178 - SURFACE
    )
    :vars
    (
      ?auto_2128182 - HOIST
      ?auto_2128180 - PLACE
      ?auto_2128184 - PLACE
      ?auto_2128179 - HOIST
      ?auto_2128183 - SURFACE
      ?auto_2128181 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128182 ?auto_2128180 ) ( IS-CRATE ?auto_2128178 ) ( not ( = ?auto_2128177 ?auto_2128178 ) ) ( not ( = ?auto_2128176 ?auto_2128177 ) ) ( not ( = ?auto_2128176 ?auto_2128178 ) ) ( not ( = ?auto_2128184 ?auto_2128180 ) ) ( HOIST-AT ?auto_2128179 ?auto_2128184 ) ( not ( = ?auto_2128182 ?auto_2128179 ) ) ( AVAILABLE ?auto_2128179 ) ( SURFACE-AT ?auto_2128178 ?auto_2128184 ) ( ON ?auto_2128178 ?auto_2128183 ) ( CLEAR ?auto_2128178 ) ( not ( = ?auto_2128177 ?auto_2128183 ) ) ( not ( = ?auto_2128178 ?auto_2128183 ) ) ( not ( = ?auto_2128176 ?auto_2128183 ) ) ( TRUCK-AT ?auto_2128181 ?auto_2128180 ) ( SURFACE-AT ?auto_2128176 ?auto_2128180 ) ( CLEAR ?auto_2128176 ) ( LIFTING ?auto_2128182 ?auto_2128177 ) ( IS-CRATE ?auto_2128177 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128177 ?auto_2128178 )
      ( MAKE-2CRATE-VERIFY ?auto_2128176 ?auto_2128177 ?auto_2128178 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128185 - SURFACE
      ?auto_2128186 - SURFACE
    )
    :vars
    (
      ?auto_2128193 - HOIST
      ?auto_2128192 - PLACE
      ?auto_2128190 - SURFACE
      ?auto_2128191 - PLACE
      ?auto_2128187 - HOIST
      ?auto_2128189 - SURFACE
      ?auto_2128188 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128193 ?auto_2128192 ) ( IS-CRATE ?auto_2128186 ) ( not ( = ?auto_2128185 ?auto_2128186 ) ) ( not ( = ?auto_2128190 ?auto_2128185 ) ) ( not ( = ?auto_2128190 ?auto_2128186 ) ) ( not ( = ?auto_2128191 ?auto_2128192 ) ) ( HOIST-AT ?auto_2128187 ?auto_2128191 ) ( not ( = ?auto_2128193 ?auto_2128187 ) ) ( AVAILABLE ?auto_2128187 ) ( SURFACE-AT ?auto_2128186 ?auto_2128191 ) ( ON ?auto_2128186 ?auto_2128189 ) ( CLEAR ?auto_2128186 ) ( not ( = ?auto_2128185 ?auto_2128189 ) ) ( not ( = ?auto_2128186 ?auto_2128189 ) ) ( not ( = ?auto_2128190 ?auto_2128189 ) ) ( TRUCK-AT ?auto_2128188 ?auto_2128192 ) ( SURFACE-AT ?auto_2128190 ?auto_2128192 ) ( CLEAR ?auto_2128190 ) ( IS-CRATE ?auto_2128185 ) ( AVAILABLE ?auto_2128193 ) ( IN ?auto_2128185 ?auto_2128188 ) )
    :subtasks
    ( ( !UNLOAD ?auto_2128193 ?auto_2128185 ?auto_2128188 ?auto_2128192 )
      ( MAKE-2CRATE ?auto_2128190 ?auto_2128185 ?auto_2128186 )
      ( MAKE-1CRATE-VERIFY ?auto_2128185 ?auto_2128186 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2128194 - SURFACE
      ?auto_2128195 - SURFACE
      ?auto_2128196 - SURFACE
    )
    :vars
    (
      ?auto_2128201 - HOIST
      ?auto_2128199 - PLACE
      ?auto_2128197 - PLACE
      ?auto_2128200 - HOIST
      ?auto_2128198 - SURFACE
      ?auto_2128202 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128201 ?auto_2128199 ) ( IS-CRATE ?auto_2128196 ) ( not ( = ?auto_2128195 ?auto_2128196 ) ) ( not ( = ?auto_2128194 ?auto_2128195 ) ) ( not ( = ?auto_2128194 ?auto_2128196 ) ) ( not ( = ?auto_2128197 ?auto_2128199 ) ) ( HOIST-AT ?auto_2128200 ?auto_2128197 ) ( not ( = ?auto_2128201 ?auto_2128200 ) ) ( AVAILABLE ?auto_2128200 ) ( SURFACE-AT ?auto_2128196 ?auto_2128197 ) ( ON ?auto_2128196 ?auto_2128198 ) ( CLEAR ?auto_2128196 ) ( not ( = ?auto_2128195 ?auto_2128198 ) ) ( not ( = ?auto_2128196 ?auto_2128198 ) ) ( not ( = ?auto_2128194 ?auto_2128198 ) ) ( TRUCK-AT ?auto_2128202 ?auto_2128199 ) ( SURFACE-AT ?auto_2128194 ?auto_2128199 ) ( CLEAR ?auto_2128194 ) ( IS-CRATE ?auto_2128195 ) ( AVAILABLE ?auto_2128201 ) ( IN ?auto_2128195 ?auto_2128202 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128195 ?auto_2128196 )
      ( MAKE-2CRATE-VERIFY ?auto_2128194 ?auto_2128195 ?auto_2128196 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2128239 - SURFACE
      ?auto_2128240 - SURFACE
    )
    :vars
    (
      ?auto_2128241 - HOIST
      ?auto_2128246 - PLACE
      ?auto_2128245 - SURFACE
      ?auto_2128243 - PLACE
      ?auto_2128247 - HOIST
      ?auto_2128244 - SURFACE
      ?auto_2128242 - TRUCK
      ?auto_2128248 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128241 ?auto_2128246 ) ( SURFACE-AT ?auto_2128239 ?auto_2128246 ) ( CLEAR ?auto_2128239 ) ( IS-CRATE ?auto_2128240 ) ( not ( = ?auto_2128239 ?auto_2128240 ) ) ( AVAILABLE ?auto_2128241 ) ( ON ?auto_2128239 ?auto_2128245 ) ( not ( = ?auto_2128245 ?auto_2128239 ) ) ( not ( = ?auto_2128245 ?auto_2128240 ) ) ( not ( = ?auto_2128243 ?auto_2128246 ) ) ( HOIST-AT ?auto_2128247 ?auto_2128243 ) ( not ( = ?auto_2128241 ?auto_2128247 ) ) ( AVAILABLE ?auto_2128247 ) ( SURFACE-AT ?auto_2128240 ?auto_2128243 ) ( ON ?auto_2128240 ?auto_2128244 ) ( CLEAR ?auto_2128240 ) ( not ( = ?auto_2128239 ?auto_2128244 ) ) ( not ( = ?auto_2128240 ?auto_2128244 ) ) ( not ( = ?auto_2128245 ?auto_2128244 ) ) ( TRUCK-AT ?auto_2128242 ?auto_2128248 ) ( not ( = ?auto_2128248 ?auto_2128246 ) ) ( not ( = ?auto_2128243 ?auto_2128248 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2128242 ?auto_2128248 ?auto_2128246 )
      ( MAKE-1CRATE ?auto_2128239 ?auto_2128240 )
      ( MAKE-1CRATE-VERIFY ?auto_2128239 ?auto_2128240 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128278 - SURFACE
      ?auto_2128279 - SURFACE
      ?auto_2128280 - SURFACE
      ?auto_2128281 - SURFACE
    )
    :vars
    (
      ?auto_2128283 - HOIST
      ?auto_2128282 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128283 ?auto_2128282 ) ( SURFACE-AT ?auto_2128280 ?auto_2128282 ) ( CLEAR ?auto_2128280 ) ( LIFTING ?auto_2128283 ?auto_2128281 ) ( IS-CRATE ?auto_2128281 ) ( not ( = ?auto_2128280 ?auto_2128281 ) ) ( ON ?auto_2128279 ?auto_2128278 ) ( ON ?auto_2128280 ?auto_2128279 ) ( not ( = ?auto_2128278 ?auto_2128279 ) ) ( not ( = ?auto_2128278 ?auto_2128280 ) ) ( not ( = ?auto_2128278 ?auto_2128281 ) ) ( not ( = ?auto_2128279 ?auto_2128280 ) ) ( not ( = ?auto_2128279 ?auto_2128281 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128280 ?auto_2128281 )
      ( MAKE-3CRATE-VERIFY ?auto_2128278 ?auto_2128279 ?auto_2128280 ?auto_2128281 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128295 - SURFACE
      ?auto_2128296 - SURFACE
      ?auto_2128297 - SURFACE
      ?auto_2128298 - SURFACE
    )
    :vars
    (
      ?auto_2128301 - HOIST
      ?auto_2128300 - PLACE
      ?auto_2128299 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128301 ?auto_2128300 ) ( SURFACE-AT ?auto_2128297 ?auto_2128300 ) ( CLEAR ?auto_2128297 ) ( IS-CRATE ?auto_2128298 ) ( not ( = ?auto_2128297 ?auto_2128298 ) ) ( TRUCK-AT ?auto_2128299 ?auto_2128300 ) ( AVAILABLE ?auto_2128301 ) ( IN ?auto_2128298 ?auto_2128299 ) ( ON ?auto_2128297 ?auto_2128296 ) ( not ( = ?auto_2128296 ?auto_2128297 ) ) ( not ( = ?auto_2128296 ?auto_2128298 ) ) ( ON ?auto_2128296 ?auto_2128295 ) ( not ( = ?auto_2128295 ?auto_2128296 ) ) ( not ( = ?auto_2128295 ?auto_2128297 ) ) ( not ( = ?auto_2128295 ?auto_2128298 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128296 ?auto_2128297 ?auto_2128298 )
      ( MAKE-3CRATE-VERIFY ?auto_2128295 ?auto_2128296 ?auto_2128297 ?auto_2128298 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128316 - SURFACE
      ?auto_2128317 - SURFACE
      ?auto_2128318 - SURFACE
      ?auto_2128319 - SURFACE
    )
    :vars
    (
      ?auto_2128323 - HOIST
      ?auto_2128321 - PLACE
      ?auto_2128322 - TRUCK
      ?auto_2128320 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128323 ?auto_2128321 ) ( SURFACE-AT ?auto_2128318 ?auto_2128321 ) ( CLEAR ?auto_2128318 ) ( IS-CRATE ?auto_2128319 ) ( not ( = ?auto_2128318 ?auto_2128319 ) ) ( AVAILABLE ?auto_2128323 ) ( IN ?auto_2128319 ?auto_2128322 ) ( ON ?auto_2128318 ?auto_2128317 ) ( not ( = ?auto_2128317 ?auto_2128318 ) ) ( not ( = ?auto_2128317 ?auto_2128319 ) ) ( TRUCK-AT ?auto_2128322 ?auto_2128320 ) ( not ( = ?auto_2128320 ?auto_2128321 ) ) ( ON ?auto_2128317 ?auto_2128316 ) ( not ( = ?auto_2128316 ?auto_2128317 ) ) ( not ( = ?auto_2128316 ?auto_2128318 ) ) ( not ( = ?auto_2128316 ?auto_2128319 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128317 ?auto_2128318 ?auto_2128319 )
      ( MAKE-3CRATE-VERIFY ?auto_2128316 ?auto_2128317 ?auto_2128318 ?auto_2128319 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128340 - SURFACE
      ?auto_2128341 - SURFACE
      ?auto_2128342 - SURFACE
      ?auto_2128343 - SURFACE
    )
    :vars
    (
      ?auto_2128344 - HOIST
      ?auto_2128345 - PLACE
      ?auto_2128348 - TRUCK
      ?auto_2128347 - PLACE
      ?auto_2128346 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128344 ?auto_2128345 ) ( SURFACE-AT ?auto_2128342 ?auto_2128345 ) ( CLEAR ?auto_2128342 ) ( IS-CRATE ?auto_2128343 ) ( not ( = ?auto_2128342 ?auto_2128343 ) ) ( AVAILABLE ?auto_2128344 ) ( ON ?auto_2128342 ?auto_2128341 ) ( not ( = ?auto_2128341 ?auto_2128342 ) ) ( not ( = ?auto_2128341 ?auto_2128343 ) ) ( TRUCK-AT ?auto_2128348 ?auto_2128347 ) ( not ( = ?auto_2128347 ?auto_2128345 ) ) ( HOIST-AT ?auto_2128346 ?auto_2128347 ) ( LIFTING ?auto_2128346 ?auto_2128343 ) ( not ( = ?auto_2128344 ?auto_2128346 ) ) ( ON ?auto_2128341 ?auto_2128340 ) ( not ( = ?auto_2128340 ?auto_2128341 ) ) ( not ( = ?auto_2128340 ?auto_2128342 ) ) ( not ( = ?auto_2128340 ?auto_2128343 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128341 ?auto_2128342 ?auto_2128343 )
      ( MAKE-3CRATE-VERIFY ?auto_2128340 ?auto_2128341 ?auto_2128342 ?auto_2128343 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128367 - SURFACE
      ?auto_2128368 - SURFACE
      ?auto_2128369 - SURFACE
      ?auto_2128370 - SURFACE
    )
    :vars
    (
      ?auto_2128375 - HOIST
      ?auto_2128371 - PLACE
      ?auto_2128373 - TRUCK
      ?auto_2128372 - PLACE
      ?auto_2128374 - HOIST
      ?auto_2128376 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128375 ?auto_2128371 ) ( SURFACE-AT ?auto_2128369 ?auto_2128371 ) ( CLEAR ?auto_2128369 ) ( IS-CRATE ?auto_2128370 ) ( not ( = ?auto_2128369 ?auto_2128370 ) ) ( AVAILABLE ?auto_2128375 ) ( ON ?auto_2128369 ?auto_2128368 ) ( not ( = ?auto_2128368 ?auto_2128369 ) ) ( not ( = ?auto_2128368 ?auto_2128370 ) ) ( TRUCK-AT ?auto_2128373 ?auto_2128372 ) ( not ( = ?auto_2128372 ?auto_2128371 ) ) ( HOIST-AT ?auto_2128374 ?auto_2128372 ) ( not ( = ?auto_2128375 ?auto_2128374 ) ) ( AVAILABLE ?auto_2128374 ) ( SURFACE-AT ?auto_2128370 ?auto_2128372 ) ( ON ?auto_2128370 ?auto_2128376 ) ( CLEAR ?auto_2128370 ) ( not ( = ?auto_2128369 ?auto_2128376 ) ) ( not ( = ?auto_2128370 ?auto_2128376 ) ) ( not ( = ?auto_2128368 ?auto_2128376 ) ) ( ON ?auto_2128368 ?auto_2128367 ) ( not ( = ?auto_2128367 ?auto_2128368 ) ) ( not ( = ?auto_2128367 ?auto_2128369 ) ) ( not ( = ?auto_2128367 ?auto_2128370 ) ) ( not ( = ?auto_2128367 ?auto_2128376 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128368 ?auto_2128369 ?auto_2128370 )
      ( MAKE-3CRATE-VERIFY ?auto_2128367 ?auto_2128368 ?auto_2128369 ?auto_2128370 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128395 - SURFACE
      ?auto_2128396 - SURFACE
      ?auto_2128397 - SURFACE
      ?auto_2128398 - SURFACE
    )
    :vars
    (
      ?auto_2128403 - HOIST
      ?auto_2128401 - PLACE
      ?auto_2128399 - PLACE
      ?auto_2128400 - HOIST
      ?auto_2128402 - SURFACE
      ?auto_2128404 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128403 ?auto_2128401 ) ( SURFACE-AT ?auto_2128397 ?auto_2128401 ) ( CLEAR ?auto_2128397 ) ( IS-CRATE ?auto_2128398 ) ( not ( = ?auto_2128397 ?auto_2128398 ) ) ( AVAILABLE ?auto_2128403 ) ( ON ?auto_2128397 ?auto_2128396 ) ( not ( = ?auto_2128396 ?auto_2128397 ) ) ( not ( = ?auto_2128396 ?auto_2128398 ) ) ( not ( = ?auto_2128399 ?auto_2128401 ) ) ( HOIST-AT ?auto_2128400 ?auto_2128399 ) ( not ( = ?auto_2128403 ?auto_2128400 ) ) ( AVAILABLE ?auto_2128400 ) ( SURFACE-AT ?auto_2128398 ?auto_2128399 ) ( ON ?auto_2128398 ?auto_2128402 ) ( CLEAR ?auto_2128398 ) ( not ( = ?auto_2128397 ?auto_2128402 ) ) ( not ( = ?auto_2128398 ?auto_2128402 ) ) ( not ( = ?auto_2128396 ?auto_2128402 ) ) ( TRUCK-AT ?auto_2128404 ?auto_2128401 ) ( ON ?auto_2128396 ?auto_2128395 ) ( not ( = ?auto_2128395 ?auto_2128396 ) ) ( not ( = ?auto_2128395 ?auto_2128397 ) ) ( not ( = ?auto_2128395 ?auto_2128398 ) ) ( not ( = ?auto_2128395 ?auto_2128402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128396 ?auto_2128397 ?auto_2128398 )
      ( MAKE-3CRATE-VERIFY ?auto_2128395 ?auto_2128396 ?auto_2128397 ?auto_2128398 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128423 - SURFACE
      ?auto_2128424 - SURFACE
      ?auto_2128425 - SURFACE
      ?auto_2128426 - SURFACE
    )
    :vars
    (
      ?auto_2128429 - HOIST
      ?auto_2128428 - PLACE
      ?auto_2128430 - PLACE
      ?auto_2128431 - HOIST
      ?auto_2128432 - SURFACE
      ?auto_2128427 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128429 ?auto_2128428 ) ( IS-CRATE ?auto_2128426 ) ( not ( = ?auto_2128425 ?auto_2128426 ) ) ( not ( = ?auto_2128424 ?auto_2128425 ) ) ( not ( = ?auto_2128424 ?auto_2128426 ) ) ( not ( = ?auto_2128430 ?auto_2128428 ) ) ( HOIST-AT ?auto_2128431 ?auto_2128430 ) ( not ( = ?auto_2128429 ?auto_2128431 ) ) ( AVAILABLE ?auto_2128431 ) ( SURFACE-AT ?auto_2128426 ?auto_2128430 ) ( ON ?auto_2128426 ?auto_2128432 ) ( CLEAR ?auto_2128426 ) ( not ( = ?auto_2128425 ?auto_2128432 ) ) ( not ( = ?auto_2128426 ?auto_2128432 ) ) ( not ( = ?auto_2128424 ?auto_2128432 ) ) ( TRUCK-AT ?auto_2128427 ?auto_2128428 ) ( SURFACE-AT ?auto_2128424 ?auto_2128428 ) ( CLEAR ?auto_2128424 ) ( LIFTING ?auto_2128429 ?auto_2128425 ) ( IS-CRATE ?auto_2128425 ) ( ON ?auto_2128424 ?auto_2128423 ) ( not ( = ?auto_2128423 ?auto_2128424 ) ) ( not ( = ?auto_2128423 ?auto_2128425 ) ) ( not ( = ?auto_2128423 ?auto_2128426 ) ) ( not ( = ?auto_2128423 ?auto_2128432 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128424 ?auto_2128425 ?auto_2128426 )
      ( MAKE-3CRATE-VERIFY ?auto_2128423 ?auto_2128424 ?auto_2128425 ?auto_2128426 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2128451 - SURFACE
      ?auto_2128452 - SURFACE
      ?auto_2128453 - SURFACE
      ?auto_2128454 - SURFACE
    )
    :vars
    (
      ?auto_2128457 - HOIST
      ?auto_2128455 - PLACE
      ?auto_2128458 - PLACE
      ?auto_2128456 - HOIST
      ?auto_2128460 - SURFACE
      ?auto_2128459 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128457 ?auto_2128455 ) ( IS-CRATE ?auto_2128454 ) ( not ( = ?auto_2128453 ?auto_2128454 ) ) ( not ( = ?auto_2128452 ?auto_2128453 ) ) ( not ( = ?auto_2128452 ?auto_2128454 ) ) ( not ( = ?auto_2128458 ?auto_2128455 ) ) ( HOIST-AT ?auto_2128456 ?auto_2128458 ) ( not ( = ?auto_2128457 ?auto_2128456 ) ) ( AVAILABLE ?auto_2128456 ) ( SURFACE-AT ?auto_2128454 ?auto_2128458 ) ( ON ?auto_2128454 ?auto_2128460 ) ( CLEAR ?auto_2128454 ) ( not ( = ?auto_2128453 ?auto_2128460 ) ) ( not ( = ?auto_2128454 ?auto_2128460 ) ) ( not ( = ?auto_2128452 ?auto_2128460 ) ) ( TRUCK-AT ?auto_2128459 ?auto_2128455 ) ( SURFACE-AT ?auto_2128452 ?auto_2128455 ) ( CLEAR ?auto_2128452 ) ( IS-CRATE ?auto_2128453 ) ( AVAILABLE ?auto_2128457 ) ( IN ?auto_2128453 ?auto_2128459 ) ( ON ?auto_2128452 ?auto_2128451 ) ( not ( = ?auto_2128451 ?auto_2128452 ) ) ( not ( = ?auto_2128451 ?auto_2128453 ) ) ( not ( = ?auto_2128451 ?auto_2128454 ) ) ( not ( = ?auto_2128451 ?auto_2128460 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128452 ?auto_2128453 ?auto_2128454 )
      ( MAKE-3CRATE-VERIFY ?auto_2128451 ?auto_2128452 ?auto_2128453 ?auto_2128454 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128742 - SURFACE
      ?auto_2128743 - SURFACE
      ?auto_2128744 - SURFACE
      ?auto_2128745 - SURFACE
      ?auto_2128746 - SURFACE
    )
    :vars
    (
      ?auto_2128747 - HOIST
      ?auto_2128748 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128747 ?auto_2128748 ) ( SURFACE-AT ?auto_2128745 ?auto_2128748 ) ( CLEAR ?auto_2128745 ) ( LIFTING ?auto_2128747 ?auto_2128746 ) ( IS-CRATE ?auto_2128746 ) ( not ( = ?auto_2128745 ?auto_2128746 ) ) ( ON ?auto_2128743 ?auto_2128742 ) ( ON ?auto_2128744 ?auto_2128743 ) ( ON ?auto_2128745 ?auto_2128744 ) ( not ( = ?auto_2128742 ?auto_2128743 ) ) ( not ( = ?auto_2128742 ?auto_2128744 ) ) ( not ( = ?auto_2128742 ?auto_2128745 ) ) ( not ( = ?auto_2128742 ?auto_2128746 ) ) ( not ( = ?auto_2128743 ?auto_2128744 ) ) ( not ( = ?auto_2128743 ?auto_2128745 ) ) ( not ( = ?auto_2128743 ?auto_2128746 ) ) ( not ( = ?auto_2128744 ?auto_2128745 ) ) ( not ( = ?auto_2128744 ?auto_2128746 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2128745 ?auto_2128746 )
      ( MAKE-4CRATE-VERIFY ?auto_2128742 ?auto_2128743 ?auto_2128744 ?auto_2128745 ?auto_2128746 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128767 - SURFACE
      ?auto_2128768 - SURFACE
      ?auto_2128769 - SURFACE
      ?auto_2128770 - SURFACE
      ?auto_2128771 - SURFACE
    )
    :vars
    (
      ?auto_2128772 - HOIST
      ?auto_2128774 - PLACE
      ?auto_2128773 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128772 ?auto_2128774 ) ( SURFACE-AT ?auto_2128770 ?auto_2128774 ) ( CLEAR ?auto_2128770 ) ( IS-CRATE ?auto_2128771 ) ( not ( = ?auto_2128770 ?auto_2128771 ) ) ( TRUCK-AT ?auto_2128773 ?auto_2128774 ) ( AVAILABLE ?auto_2128772 ) ( IN ?auto_2128771 ?auto_2128773 ) ( ON ?auto_2128770 ?auto_2128769 ) ( not ( = ?auto_2128769 ?auto_2128770 ) ) ( not ( = ?auto_2128769 ?auto_2128771 ) ) ( ON ?auto_2128768 ?auto_2128767 ) ( ON ?auto_2128769 ?auto_2128768 ) ( not ( = ?auto_2128767 ?auto_2128768 ) ) ( not ( = ?auto_2128767 ?auto_2128769 ) ) ( not ( = ?auto_2128767 ?auto_2128770 ) ) ( not ( = ?auto_2128767 ?auto_2128771 ) ) ( not ( = ?auto_2128768 ?auto_2128769 ) ) ( not ( = ?auto_2128768 ?auto_2128770 ) ) ( not ( = ?auto_2128768 ?auto_2128771 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128769 ?auto_2128770 ?auto_2128771 )
      ( MAKE-4CRATE-VERIFY ?auto_2128767 ?auto_2128768 ?auto_2128769 ?auto_2128770 ?auto_2128771 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128797 - SURFACE
      ?auto_2128798 - SURFACE
      ?auto_2128799 - SURFACE
      ?auto_2128800 - SURFACE
      ?auto_2128801 - SURFACE
    )
    :vars
    (
      ?auto_2128805 - HOIST
      ?auto_2128802 - PLACE
      ?auto_2128803 - TRUCK
      ?auto_2128804 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128805 ?auto_2128802 ) ( SURFACE-AT ?auto_2128800 ?auto_2128802 ) ( CLEAR ?auto_2128800 ) ( IS-CRATE ?auto_2128801 ) ( not ( = ?auto_2128800 ?auto_2128801 ) ) ( AVAILABLE ?auto_2128805 ) ( IN ?auto_2128801 ?auto_2128803 ) ( ON ?auto_2128800 ?auto_2128799 ) ( not ( = ?auto_2128799 ?auto_2128800 ) ) ( not ( = ?auto_2128799 ?auto_2128801 ) ) ( TRUCK-AT ?auto_2128803 ?auto_2128804 ) ( not ( = ?auto_2128804 ?auto_2128802 ) ) ( ON ?auto_2128798 ?auto_2128797 ) ( ON ?auto_2128799 ?auto_2128798 ) ( not ( = ?auto_2128797 ?auto_2128798 ) ) ( not ( = ?auto_2128797 ?auto_2128799 ) ) ( not ( = ?auto_2128797 ?auto_2128800 ) ) ( not ( = ?auto_2128797 ?auto_2128801 ) ) ( not ( = ?auto_2128798 ?auto_2128799 ) ) ( not ( = ?auto_2128798 ?auto_2128800 ) ) ( not ( = ?auto_2128798 ?auto_2128801 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128799 ?auto_2128800 ?auto_2128801 )
      ( MAKE-4CRATE-VERIFY ?auto_2128797 ?auto_2128798 ?auto_2128799 ?auto_2128800 ?auto_2128801 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128831 - SURFACE
      ?auto_2128832 - SURFACE
      ?auto_2128833 - SURFACE
      ?auto_2128834 - SURFACE
      ?auto_2128835 - SURFACE
    )
    :vars
    (
      ?auto_2128840 - HOIST
      ?auto_2128839 - PLACE
      ?auto_2128838 - TRUCK
      ?auto_2128837 - PLACE
      ?auto_2128836 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128840 ?auto_2128839 ) ( SURFACE-AT ?auto_2128834 ?auto_2128839 ) ( CLEAR ?auto_2128834 ) ( IS-CRATE ?auto_2128835 ) ( not ( = ?auto_2128834 ?auto_2128835 ) ) ( AVAILABLE ?auto_2128840 ) ( ON ?auto_2128834 ?auto_2128833 ) ( not ( = ?auto_2128833 ?auto_2128834 ) ) ( not ( = ?auto_2128833 ?auto_2128835 ) ) ( TRUCK-AT ?auto_2128838 ?auto_2128837 ) ( not ( = ?auto_2128837 ?auto_2128839 ) ) ( HOIST-AT ?auto_2128836 ?auto_2128837 ) ( LIFTING ?auto_2128836 ?auto_2128835 ) ( not ( = ?auto_2128840 ?auto_2128836 ) ) ( ON ?auto_2128832 ?auto_2128831 ) ( ON ?auto_2128833 ?auto_2128832 ) ( not ( = ?auto_2128831 ?auto_2128832 ) ) ( not ( = ?auto_2128831 ?auto_2128833 ) ) ( not ( = ?auto_2128831 ?auto_2128834 ) ) ( not ( = ?auto_2128831 ?auto_2128835 ) ) ( not ( = ?auto_2128832 ?auto_2128833 ) ) ( not ( = ?auto_2128832 ?auto_2128834 ) ) ( not ( = ?auto_2128832 ?auto_2128835 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128833 ?auto_2128834 ?auto_2128835 )
      ( MAKE-4CRATE-VERIFY ?auto_2128831 ?auto_2128832 ?auto_2128833 ?auto_2128834 ?auto_2128835 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128869 - SURFACE
      ?auto_2128870 - SURFACE
      ?auto_2128871 - SURFACE
      ?auto_2128872 - SURFACE
      ?auto_2128873 - SURFACE
    )
    :vars
    (
      ?auto_2128879 - HOIST
      ?auto_2128874 - PLACE
      ?auto_2128876 - TRUCK
      ?auto_2128875 - PLACE
      ?auto_2128877 - HOIST
      ?auto_2128878 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128879 ?auto_2128874 ) ( SURFACE-AT ?auto_2128872 ?auto_2128874 ) ( CLEAR ?auto_2128872 ) ( IS-CRATE ?auto_2128873 ) ( not ( = ?auto_2128872 ?auto_2128873 ) ) ( AVAILABLE ?auto_2128879 ) ( ON ?auto_2128872 ?auto_2128871 ) ( not ( = ?auto_2128871 ?auto_2128872 ) ) ( not ( = ?auto_2128871 ?auto_2128873 ) ) ( TRUCK-AT ?auto_2128876 ?auto_2128875 ) ( not ( = ?auto_2128875 ?auto_2128874 ) ) ( HOIST-AT ?auto_2128877 ?auto_2128875 ) ( not ( = ?auto_2128879 ?auto_2128877 ) ) ( AVAILABLE ?auto_2128877 ) ( SURFACE-AT ?auto_2128873 ?auto_2128875 ) ( ON ?auto_2128873 ?auto_2128878 ) ( CLEAR ?auto_2128873 ) ( not ( = ?auto_2128872 ?auto_2128878 ) ) ( not ( = ?auto_2128873 ?auto_2128878 ) ) ( not ( = ?auto_2128871 ?auto_2128878 ) ) ( ON ?auto_2128870 ?auto_2128869 ) ( ON ?auto_2128871 ?auto_2128870 ) ( not ( = ?auto_2128869 ?auto_2128870 ) ) ( not ( = ?auto_2128869 ?auto_2128871 ) ) ( not ( = ?auto_2128869 ?auto_2128872 ) ) ( not ( = ?auto_2128869 ?auto_2128873 ) ) ( not ( = ?auto_2128869 ?auto_2128878 ) ) ( not ( = ?auto_2128870 ?auto_2128871 ) ) ( not ( = ?auto_2128870 ?auto_2128872 ) ) ( not ( = ?auto_2128870 ?auto_2128873 ) ) ( not ( = ?auto_2128870 ?auto_2128878 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128871 ?auto_2128872 ?auto_2128873 )
      ( MAKE-4CRATE-VERIFY ?auto_2128869 ?auto_2128870 ?auto_2128871 ?auto_2128872 ?auto_2128873 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128908 - SURFACE
      ?auto_2128909 - SURFACE
      ?auto_2128910 - SURFACE
      ?auto_2128911 - SURFACE
      ?auto_2128912 - SURFACE
    )
    :vars
    (
      ?auto_2128914 - HOIST
      ?auto_2128916 - PLACE
      ?auto_2128918 - PLACE
      ?auto_2128913 - HOIST
      ?auto_2128917 - SURFACE
      ?auto_2128915 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128914 ?auto_2128916 ) ( SURFACE-AT ?auto_2128911 ?auto_2128916 ) ( CLEAR ?auto_2128911 ) ( IS-CRATE ?auto_2128912 ) ( not ( = ?auto_2128911 ?auto_2128912 ) ) ( AVAILABLE ?auto_2128914 ) ( ON ?auto_2128911 ?auto_2128910 ) ( not ( = ?auto_2128910 ?auto_2128911 ) ) ( not ( = ?auto_2128910 ?auto_2128912 ) ) ( not ( = ?auto_2128918 ?auto_2128916 ) ) ( HOIST-AT ?auto_2128913 ?auto_2128918 ) ( not ( = ?auto_2128914 ?auto_2128913 ) ) ( AVAILABLE ?auto_2128913 ) ( SURFACE-AT ?auto_2128912 ?auto_2128918 ) ( ON ?auto_2128912 ?auto_2128917 ) ( CLEAR ?auto_2128912 ) ( not ( = ?auto_2128911 ?auto_2128917 ) ) ( not ( = ?auto_2128912 ?auto_2128917 ) ) ( not ( = ?auto_2128910 ?auto_2128917 ) ) ( TRUCK-AT ?auto_2128915 ?auto_2128916 ) ( ON ?auto_2128909 ?auto_2128908 ) ( ON ?auto_2128910 ?auto_2128909 ) ( not ( = ?auto_2128908 ?auto_2128909 ) ) ( not ( = ?auto_2128908 ?auto_2128910 ) ) ( not ( = ?auto_2128908 ?auto_2128911 ) ) ( not ( = ?auto_2128908 ?auto_2128912 ) ) ( not ( = ?auto_2128908 ?auto_2128917 ) ) ( not ( = ?auto_2128909 ?auto_2128910 ) ) ( not ( = ?auto_2128909 ?auto_2128911 ) ) ( not ( = ?auto_2128909 ?auto_2128912 ) ) ( not ( = ?auto_2128909 ?auto_2128917 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128910 ?auto_2128911 ?auto_2128912 )
      ( MAKE-4CRATE-VERIFY ?auto_2128908 ?auto_2128909 ?auto_2128910 ?auto_2128911 ?auto_2128912 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128947 - SURFACE
      ?auto_2128948 - SURFACE
      ?auto_2128949 - SURFACE
      ?auto_2128950 - SURFACE
      ?auto_2128951 - SURFACE
    )
    :vars
    (
      ?auto_2128955 - HOIST
      ?auto_2128953 - PLACE
      ?auto_2128956 - PLACE
      ?auto_2128957 - HOIST
      ?auto_2128952 - SURFACE
      ?auto_2128954 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128955 ?auto_2128953 ) ( IS-CRATE ?auto_2128951 ) ( not ( = ?auto_2128950 ?auto_2128951 ) ) ( not ( = ?auto_2128949 ?auto_2128950 ) ) ( not ( = ?auto_2128949 ?auto_2128951 ) ) ( not ( = ?auto_2128956 ?auto_2128953 ) ) ( HOIST-AT ?auto_2128957 ?auto_2128956 ) ( not ( = ?auto_2128955 ?auto_2128957 ) ) ( AVAILABLE ?auto_2128957 ) ( SURFACE-AT ?auto_2128951 ?auto_2128956 ) ( ON ?auto_2128951 ?auto_2128952 ) ( CLEAR ?auto_2128951 ) ( not ( = ?auto_2128950 ?auto_2128952 ) ) ( not ( = ?auto_2128951 ?auto_2128952 ) ) ( not ( = ?auto_2128949 ?auto_2128952 ) ) ( TRUCK-AT ?auto_2128954 ?auto_2128953 ) ( SURFACE-AT ?auto_2128949 ?auto_2128953 ) ( CLEAR ?auto_2128949 ) ( LIFTING ?auto_2128955 ?auto_2128950 ) ( IS-CRATE ?auto_2128950 ) ( ON ?auto_2128948 ?auto_2128947 ) ( ON ?auto_2128949 ?auto_2128948 ) ( not ( = ?auto_2128947 ?auto_2128948 ) ) ( not ( = ?auto_2128947 ?auto_2128949 ) ) ( not ( = ?auto_2128947 ?auto_2128950 ) ) ( not ( = ?auto_2128947 ?auto_2128951 ) ) ( not ( = ?auto_2128947 ?auto_2128952 ) ) ( not ( = ?auto_2128948 ?auto_2128949 ) ) ( not ( = ?auto_2128948 ?auto_2128950 ) ) ( not ( = ?auto_2128948 ?auto_2128951 ) ) ( not ( = ?auto_2128948 ?auto_2128952 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128949 ?auto_2128950 ?auto_2128951 )
      ( MAKE-4CRATE-VERIFY ?auto_2128947 ?auto_2128948 ?auto_2128949 ?auto_2128950 ?auto_2128951 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2128986 - SURFACE
      ?auto_2128987 - SURFACE
      ?auto_2128988 - SURFACE
      ?auto_2128989 - SURFACE
      ?auto_2128990 - SURFACE
    )
    :vars
    (
      ?auto_2128995 - HOIST
      ?auto_2128994 - PLACE
      ?auto_2128991 - PLACE
      ?auto_2128993 - HOIST
      ?auto_2128992 - SURFACE
      ?auto_2128996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2128995 ?auto_2128994 ) ( IS-CRATE ?auto_2128990 ) ( not ( = ?auto_2128989 ?auto_2128990 ) ) ( not ( = ?auto_2128988 ?auto_2128989 ) ) ( not ( = ?auto_2128988 ?auto_2128990 ) ) ( not ( = ?auto_2128991 ?auto_2128994 ) ) ( HOIST-AT ?auto_2128993 ?auto_2128991 ) ( not ( = ?auto_2128995 ?auto_2128993 ) ) ( AVAILABLE ?auto_2128993 ) ( SURFACE-AT ?auto_2128990 ?auto_2128991 ) ( ON ?auto_2128990 ?auto_2128992 ) ( CLEAR ?auto_2128990 ) ( not ( = ?auto_2128989 ?auto_2128992 ) ) ( not ( = ?auto_2128990 ?auto_2128992 ) ) ( not ( = ?auto_2128988 ?auto_2128992 ) ) ( TRUCK-AT ?auto_2128996 ?auto_2128994 ) ( SURFACE-AT ?auto_2128988 ?auto_2128994 ) ( CLEAR ?auto_2128988 ) ( IS-CRATE ?auto_2128989 ) ( AVAILABLE ?auto_2128995 ) ( IN ?auto_2128989 ?auto_2128996 ) ( ON ?auto_2128987 ?auto_2128986 ) ( ON ?auto_2128988 ?auto_2128987 ) ( not ( = ?auto_2128986 ?auto_2128987 ) ) ( not ( = ?auto_2128986 ?auto_2128988 ) ) ( not ( = ?auto_2128986 ?auto_2128989 ) ) ( not ( = ?auto_2128986 ?auto_2128990 ) ) ( not ( = ?auto_2128986 ?auto_2128992 ) ) ( not ( = ?auto_2128987 ?auto_2128988 ) ) ( not ( = ?auto_2128987 ?auto_2128989 ) ) ( not ( = ?auto_2128987 ?auto_2128990 ) ) ( not ( = ?auto_2128987 ?auto_2128992 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2128988 ?auto_2128989 ?auto_2128990 )
      ( MAKE-4CRATE-VERIFY ?auto_2128986 ?auto_2128987 ?auto_2128988 ?auto_2128989 ?auto_2128990 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129646 - SURFACE
      ?auto_2129647 - SURFACE
      ?auto_2129648 - SURFACE
      ?auto_2129649 - SURFACE
      ?auto_2129650 - SURFACE
      ?auto_2129651 - SURFACE
    )
    :vars
    (
      ?auto_2129653 - HOIST
      ?auto_2129652 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129653 ?auto_2129652 ) ( SURFACE-AT ?auto_2129650 ?auto_2129652 ) ( CLEAR ?auto_2129650 ) ( LIFTING ?auto_2129653 ?auto_2129651 ) ( IS-CRATE ?auto_2129651 ) ( not ( = ?auto_2129650 ?auto_2129651 ) ) ( ON ?auto_2129647 ?auto_2129646 ) ( ON ?auto_2129648 ?auto_2129647 ) ( ON ?auto_2129649 ?auto_2129648 ) ( ON ?auto_2129650 ?auto_2129649 ) ( not ( = ?auto_2129646 ?auto_2129647 ) ) ( not ( = ?auto_2129646 ?auto_2129648 ) ) ( not ( = ?auto_2129646 ?auto_2129649 ) ) ( not ( = ?auto_2129646 ?auto_2129650 ) ) ( not ( = ?auto_2129646 ?auto_2129651 ) ) ( not ( = ?auto_2129647 ?auto_2129648 ) ) ( not ( = ?auto_2129647 ?auto_2129649 ) ) ( not ( = ?auto_2129647 ?auto_2129650 ) ) ( not ( = ?auto_2129647 ?auto_2129651 ) ) ( not ( = ?auto_2129648 ?auto_2129649 ) ) ( not ( = ?auto_2129648 ?auto_2129650 ) ) ( not ( = ?auto_2129648 ?auto_2129651 ) ) ( not ( = ?auto_2129649 ?auto_2129650 ) ) ( not ( = ?auto_2129649 ?auto_2129651 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2129650 ?auto_2129651 )
      ( MAKE-5CRATE-VERIFY ?auto_2129646 ?auto_2129647 ?auto_2129648 ?auto_2129649 ?auto_2129650 ?auto_2129651 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129680 - SURFACE
      ?auto_2129681 - SURFACE
      ?auto_2129682 - SURFACE
      ?auto_2129683 - SURFACE
      ?auto_2129684 - SURFACE
      ?auto_2129685 - SURFACE
    )
    :vars
    (
      ?auto_2129687 - HOIST
      ?auto_2129686 - PLACE
      ?auto_2129688 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129687 ?auto_2129686 ) ( SURFACE-AT ?auto_2129684 ?auto_2129686 ) ( CLEAR ?auto_2129684 ) ( IS-CRATE ?auto_2129685 ) ( not ( = ?auto_2129684 ?auto_2129685 ) ) ( TRUCK-AT ?auto_2129688 ?auto_2129686 ) ( AVAILABLE ?auto_2129687 ) ( IN ?auto_2129685 ?auto_2129688 ) ( ON ?auto_2129684 ?auto_2129683 ) ( not ( = ?auto_2129683 ?auto_2129684 ) ) ( not ( = ?auto_2129683 ?auto_2129685 ) ) ( ON ?auto_2129681 ?auto_2129680 ) ( ON ?auto_2129682 ?auto_2129681 ) ( ON ?auto_2129683 ?auto_2129682 ) ( not ( = ?auto_2129680 ?auto_2129681 ) ) ( not ( = ?auto_2129680 ?auto_2129682 ) ) ( not ( = ?auto_2129680 ?auto_2129683 ) ) ( not ( = ?auto_2129680 ?auto_2129684 ) ) ( not ( = ?auto_2129680 ?auto_2129685 ) ) ( not ( = ?auto_2129681 ?auto_2129682 ) ) ( not ( = ?auto_2129681 ?auto_2129683 ) ) ( not ( = ?auto_2129681 ?auto_2129684 ) ) ( not ( = ?auto_2129681 ?auto_2129685 ) ) ( not ( = ?auto_2129682 ?auto_2129683 ) ) ( not ( = ?auto_2129682 ?auto_2129684 ) ) ( not ( = ?auto_2129682 ?auto_2129685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129683 ?auto_2129684 ?auto_2129685 )
      ( MAKE-5CRATE-VERIFY ?auto_2129680 ?auto_2129681 ?auto_2129682 ?auto_2129683 ?auto_2129684 ?auto_2129685 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129720 - SURFACE
      ?auto_2129721 - SURFACE
      ?auto_2129722 - SURFACE
      ?auto_2129723 - SURFACE
      ?auto_2129724 - SURFACE
      ?auto_2129725 - SURFACE
    )
    :vars
    (
      ?auto_2129729 - HOIST
      ?auto_2129726 - PLACE
      ?auto_2129728 - TRUCK
      ?auto_2129727 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129729 ?auto_2129726 ) ( SURFACE-AT ?auto_2129724 ?auto_2129726 ) ( CLEAR ?auto_2129724 ) ( IS-CRATE ?auto_2129725 ) ( not ( = ?auto_2129724 ?auto_2129725 ) ) ( AVAILABLE ?auto_2129729 ) ( IN ?auto_2129725 ?auto_2129728 ) ( ON ?auto_2129724 ?auto_2129723 ) ( not ( = ?auto_2129723 ?auto_2129724 ) ) ( not ( = ?auto_2129723 ?auto_2129725 ) ) ( TRUCK-AT ?auto_2129728 ?auto_2129727 ) ( not ( = ?auto_2129727 ?auto_2129726 ) ) ( ON ?auto_2129721 ?auto_2129720 ) ( ON ?auto_2129722 ?auto_2129721 ) ( ON ?auto_2129723 ?auto_2129722 ) ( not ( = ?auto_2129720 ?auto_2129721 ) ) ( not ( = ?auto_2129720 ?auto_2129722 ) ) ( not ( = ?auto_2129720 ?auto_2129723 ) ) ( not ( = ?auto_2129720 ?auto_2129724 ) ) ( not ( = ?auto_2129720 ?auto_2129725 ) ) ( not ( = ?auto_2129721 ?auto_2129722 ) ) ( not ( = ?auto_2129721 ?auto_2129723 ) ) ( not ( = ?auto_2129721 ?auto_2129724 ) ) ( not ( = ?auto_2129721 ?auto_2129725 ) ) ( not ( = ?auto_2129722 ?auto_2129723 ) ) ( not ( = ?auto_2129722 ?auto_2129724 ) ) ( not ( = ?auto_2129722 ?auto_2129725 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129723 ?auto_2129724 ?auto_2129725 )
      ( MAKE-5CRATE-VERIFY ?auto_2129720 ?auto_2129721 ?auto_2129722 ?auto_2129723 ?auto_2129724 ?auto_2129725 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129765 - SURFACE
      ?auto_2129766 - SURFACE
      ?auto_2129767 - SURFACE
      ?auto_2129768 - SURFACE
      ?auto_2129769 - SURFACE
      ?auto_2129770 - SURFACE
    )
    :vars
    (
      ?auto_2129772 - HOIST
      ?auto_2129775 - PLACE
      ?auto_2129774 - TRUCK
      ?auto_2129773 - PLACE
      ?auto_2129771 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129772 ?auto_2129775 ) ( SURFACE-AT ?auto_2129769 ?auto_2129775 ) ( CLEAR ?auto_2129769 ) ( IS-CRATE ?auto_2129770 ) ( not ( = ?auto_2129769 ?auto_2129770 ) ) ( AVAILABLE ?auto_2129772 ) ( ON ?auto_2129769 ?auto_2129768 ) ( not ( = ?auto_2129768 ?auto_2129769 ) ) ( not ( = ?auto_2129768 ?auto_2129770 ) ) ( TRUCK-AT ?auto_2129774 ?auto_2129773 ) ( not ( = ?auto_2129773 ?auto_2129775 ) ) ( HOIST-AT ?auto_2129771 ?auto_2129773 ) ( LIFTING ?auto_2129771 ?auto_2129770 ) ( not ( = ?auto_2129772 ?auto_2129771 ) ) ( ON ?auto_2129766 ?auto_2129765 ) ( ON ?auto_2129767 ?auto_2129766 ) ( ON ?auto_2129768 ?auto_2129767 ) ( not ( = ?auto_2129765 ?auto_2129766 ) ) ( not ( = ?auto_2129765 ?auto_2129767 ) ) ( not ( = ?auto_2129765 ?auto_2129768 ) ) ( not ( = ?auto_2129765 ?auto_2129769 ) ) ( not ( = ?auto_2129765 ?auto_2129770 ) ) ( not ( = ?auto_2129766 ?auto_2129767 ) ) ( not ( = ?auto_2129766 ?auto_2129768 ) ) ( not ( = ?auto_2129766 ?auto_2129769 ) ) ( not ( = ?auto_2129766 ?auto_2129770 ) ) ( not ( = ?auto_2129767 ?auto_2129768 ) ) ( not ( = ?auto_2129767 ?auto_2129769 ) ) ( not ( = ?auto_2129767 ?auto_2129770 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129768 ?auto_2129769 ?auto_2129770 )
      ( MAKE-5CRATE-VERIFY ?auto_2129765 ?auto_2129766 ?auto_2129767 ?auto_2129768 ?auto_2129769 ?auto_2129770 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129815 - SURFACE
      ?auto_2129816 - SURFACE
      ?auto_2129817 - SURFACE
      ?auto_2129818 - SURFACE
      ?auto_2129819 - SURFACE
      ?auto_2129820 - SURFACE
    )
    :vars
    (
      ?auto_2129825 - HOIST
      ?auto_2129823 - PLACE
      ?auto_2129826 - TRUCK
      ?auto_2129821 - PLACE
      ?auto_2129824 - HOIST
      ?auto_2129822 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129825 ?auto_2129823 ) ( SURFACE-AT ?auto_2129819 ?auto_2129823 ) ( CLEAR ?auto_2129819 ) ( IS-CRATE ?auto_2129820 ) ( not ( = ?auto_2129819 ?auto_2129820 ) ) ( AVAILABLE ?auto_2129825 ) ( ON ?auto_2129819 ?auto_2129818 ) ( not ( = ?auto_2129818 ?auto_2129819 ) ) ( not ( = ?auto_2129818 ?auto_2129820 ) ) ( TRUCK-AT ?auto_2129826 ?auto_2129821 ) ( not ( = ?auto_2129821 ?auto_2129823 ) ) ( HOIST-AT ?auto_2129824 ?auto_2129821 ) ( not ( = ?auto_2129825 ?auto_2129824 ) ) ( AVAILABLE ?auto_2129824 ) ( SURFACE-AT ?auto_2129820 ?auto_2129821 ) ( ON ?auto_2129820 ?auto_2129822 ) ( CLEAR ?auto_2129820 ) ( not ( = ?auto_2129819 ?auto_2129822 ) ) ( not ( = ?auto_2129820 ?auto_2129822 ) ) ( not ( = ?auto_2129818 ?auto_2129822 ) ) ( ON ?auto_2129816 ?auto_2129815 ) ( ON ?auto_2129817 ?auto_2129816 ) ( ON ?auto_2129818 ?auto_2129817 ) ( not ( = ?auto_2129815 ?auto_2129816 ) ) ( not ( = ?auto_2129815 ?auto_2129817 ) ) ( not ( = ?auto_2129815 ?auto_2129818 ) ) ( not ( = ?auto_2129815 ?auto_2129819 ) ) ( not ( = ?auto_2129815 ?auto_2129820 ) ) ( not ( = ?auto_2129815 ?auto_2129822 ) ) ( not ( = ?auto_2129816 ?auto_2129817 ) ) ( not ( = ?auto_2129816 ?auto_2129818 ) ) ( not ( = ?auto_2129816 ?auto_2129819 ) ) ( not ( = ?auto_2129816 ?auto_2129820 ) ) ( not ( = ?auto_2129816 ?auto_2129822 ) ) ( not ( = ?auto_2129817 ?auto_2129818 ) ) ( not ( = ?auto_2129817 ?auto_2129819 ) ) ( not ( = ?auto_2129817 ?auto_2129820 ) ) ( not ( = ?auto_2129817 ?auto_2129822 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129818 ?auto_2129819 ?auto_2129820 )
      ( MAKE-5CRATE-VERIFY ?auto_2129815 ?auto_2129816 ?auto_2129817 ?auto_2129818 ?auto_2129819 ?auto_2129820 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129866 - SURFACE
      ?auto_2129867 - SURFACE
      ?auto_2129868 - SURFACE
      ?auto_2129869 - SURFACE
      ?auto_2129870 - SURFACE
      ?auto_2129871 - SURFACE
    )
    :vars
    (
      ?auto_2129875 - HOIST
      ?auto_2129876 - PLACE
      ?auto_2129873 - PLACE
      ?auto_2129874 - HOIST
      ?auto_2129877 - SURFACE
      ?auto_2129872 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129875 ?auto_2129876 ) ( SURFACE-AT ?auto_2129870 ?auto_2129876 ) ( CLEAR ?auto_2129870 ) ( IS-CRATE ?auto_2129871 ) ( not ( = ?auto_2129870 ?auto_2129871 ) ) ( AVAILABLE ?auto_2129875 ) ( ON ?auto_2129870 ?auto_2129869 ) ( not ( = ?auto_2129869 ?auto_2129870 ) ) ( not ( = ?auto_2129869 ?auto_2129871 ) ) ( not ( = ?auto_2129873 ?auto_2129876 ) ) ( HOIST-AT ?auto_2129874 ?auto_2129873 ) ( not ( = ?auto_2129875 ?auto_2129874 ) ) ( AVAILABLE ?auto_2129874 ) ( SURFACE-AT ?auto_2129871 ?auto_2129873 ) ( ON ?auto_2129871 ?auto_2129877 ) ( CLEAR ?auto_2129871 ) ( not ( = ?auto_2129870 ?auto_2129877 ) ) ( not ( = ?auto_2129871 ?auto_2129877 ) ) ( not ( = ?auto_2129869 ?auto_2129877 ) ) ( TRUCK-AT ?auto_2129872 ?auto_2129876 ) ( ON ?auto_2129867 ?auto_2129866 ) ( ON ?auto_2129868 ?auto_2129867 ) ( ON ?auto_2129869 ?auto_2129868 ) ( not ( = ?auto_2129866 ?auto_2129867 ) ) ( not ( = ?auto_2129866 ?auto_2129868 ) ) ( not ( = ?auto_2129866 ?auto_2129869 ) ) ( not ( = ?auto_2129866 ?auto_2129870 ) ) ( not ( = ?auto_2129866 ?auto_2129871 ) ) ( not ( = ?auto_2129866 ?auto_2129877 ) ) ( not ( = ?auto_2129867 ?auto_2129868 ) ) ( not ( = ?auto_2129867 ?auto_2129869 ) ) ( not ( = ?auto_2129867 ?auto_2129870 ) ) ( not ( = ?auto_2129867 ?auto_2129871 ) ) ( not ( = ?auto_2129867 ?auto_2129877 ) ) ( not ( = ?auto_2129868 ?auto_2129869 ) ) ( not ( = ?auto_2129868 ?auto_2129870 ) ) ( not ( = ?auto_2129868 ?auto_2129871 ) ) ( not ( = ?auto_2129868 ?auto_2129877 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129869 ?auto_2129870 ?auto_2129871 )
      ( MAKE-5CRATE-VERIFY ?auto_2129866 ?auto_2129867 ?auto_2129868 ?auto_2129869 ?auto_2129870 ?auto_2129871 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129917 - SURFACE
      ?auto_2129918 - SURFACE
      ?auto_2129919 - SURFACE
      ?auto_2129920 - SURFACE
      ?auto_2129921 - SURFACE
      ?auto_2129922 - SURFACE
    )
    :vars
    (
      ?auto_2129925 - HOIST
      ?auto_2129928 - PLACE
      ?auto_2129923 - PLACE
      ?auto_2129926 - HOIST
      ?auto_2129924 - SURFACE
      ?auto_2129927 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129925 ?auto_2129928 ) ( IS-CRATE ?auto_2129922 ) ( not ( = ?auto_2129921 ?auto_2129922 ) ) ( not ( = ?auto_2129920 ?auto_2129921 ) ) ( not ( = ?auto_2129920 ?auto_2129922 ) ) ( not ( = ?auto_2129923 ?auto_2129928 ) ) ( HOIST-AT ?auto_2129926 ?auto_2129923 ) ( not ( = ?auto_2129925 ?auto_2129926 ) ) ( AVAILABLE ?auto_2129926 ) ( SURFACE-AT ?auto_2129922 ?auto_2129923 ) ( ON ?auto_2129922 ?auto_2129924 ) ( CLEAR ?auto_2129922 ) ( not ( = ?auto_2129921 ?auto_2129924 ) ) ( not ( = ?auto_2129922 ?auto_2129924 ) ) ( not ( = ?auto_2129920 ?auto_2129924 ) ) ( TRUCK-AT ?auto_2129927 ?auto_2129928 ) ( SURFACE-AT ?auto_2129920 ?auto_2129928 ) ( CLEAR ?auto_2129920 ) ( LIFTING ?auto_2129925 ?auto_2129921 ) ( IS-CRATE ?auto_2129921 ) ( ON ?auto_2129918 ?auto_2129917 ) ( ON ?auto_2129919 ?auto_2129918 ) ( ON ?auto_2129920 ?auto_2129919 ) ( not ( = ?auto_2129917 ?auto_2129918 ) ) ( not ( = ?auto_2129917 ?auto_2129919 ) ) ( not ( = ?auto_2129917 ?auto_2129920 ) ) ( not ( = ?auto_2129917 ?auto_2129921 ) ) ( not ( = ?auto_2129917 ?auto_2129922 ) ) ( not ( = ?auto_2129917 ?auto_2129924 ) ) ( not ( = ?auto_2129918 ?auto_2129919 ) ) ( not ( = ?auto_2129918 ?auto_2129920 ) ) ( not ( = ?auto_2129918 ?auto_2129921 ) ) ( not ( = ?auto_2129918 ?auto_2129922 ) ) ( not ( = ?auto_2129918 ?auto_2129924 ) ) ( not ( = ?auto_2129919 ?auto_2129920 ) ) ( not ( = ?auto_2129919 ?auto_2129921 ) ) ( not ( = ?auto_2129919 ?auto_2129922 ) ) ( not ( = ?auto_2129919 ?auto_2129924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129920 ?auto_2129921 ?auto_2129922 )
      ( MAKE-5CRATE-VERIFY ?auto_2129917 ?auto_2129918 ?auto_2129919 ?auto_2129920 ?auto_2129921 ?auto_2129922 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2129968 - SURFACE
      ?auto_2129969 - SURFACE
      ?auto_2129970 - SURFACE
      ?auto_2129971 - SURFACE
      ?auto_2129972 - SURFACE
      ?auto_2129973 - SURFACE
    )
    :vars
    (
      ?auto_2129974 - HOIST
      ?auto_2129977 - PLACE
      ?auto_2129976 - PLACE
      ?auto_2129978 - HOIST
      ?auto_2129979 - SURFACE
      ?auto_2129975 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2129974 ?auto_2129977 ) ( IS-CRATE ?auto_2129973 ) ( not ( = ?auto_2129972 ?auto_2129973 ) ) ( not ( = ?auto_2129971 ?auto_2129972 ) ) ( not ( = ?auto_2129971 ?auto_2129973 ) ) ( not ( = ?auto_2129976 ?auto_2129977 ) ) ( HOIST-AT ?auto_2129978 ?auto_2129976 ) ( not ( = ?auto_2129974 ?auto_2129978 ) ) ( AVAILABLE ?auto_2129978 ) ( SURFACE-AT ?auto_2129973 ?auto_2129976 ) ( ON ?auto_2129973 ?auto_2129979 ) ( CLEAR ?auto_2129973 ) ( not ( = ?auto_2129972 ?auto_2129979 ) ) ( not ( = ?auto_2129973 ?auto_2129979 ) ) ( not ( = ?auto_2129971 ?auto_2129979 ) ) ( TRUCK-AT ?auto_2129975 ?auto_2129977 ) ( SURFACE-AT ?auto_2129971 ?auto_2129977 ) ( CLEAR ?auto_2129971 ) ( IS-CRATE ?auto_2129972 ) ( AVAILABLE ?auto_2129974 ) ( IN ?auto_2129972 ?auto_2129975 ) ( ON ?auto_2129969 ?auto_2129968 ) ( ON ?auto_2129970 ?auto_2129969 ) ( ON ?auto_2129971 ?auto_2129970 ) ( not ( = ?auto_2129968 ?auto_2129969 ) ) ( not ( = ?auto_2129968 ?auto_2129970 ) ) ( not ( = ?auto_2129968 ?auto_2129971 ) ) ( not ( = ?auto_2129968 ?auto_2129972 ) ) ( not ( = ?auto_2129968 ?auto_2129973 ) ) ( not ( = ?auto_2129968 ?auto_2129979 ) ) ( not ( = ?auto_2129969 ?auto_2129970 ) ) ( not ( = ?auto_2129969 ?auto_2129971 ) ) ( not ( = ?auto_2129969 ?auto_2129972 ) ) ( not ( = ?auto_2129969 ?auto_2129973 ) ) ( not ( = ?auto_2129969 ?auto_2129979 ) ) ( not ( = ?auto_2129970 ?auto_2129971 ) ) ( not ( = ?auto_2129970 ?auto_2129972 ) ) ( not ( = ?auto_2129970 ?auto_2129973 ) ) ( not ( = ?auto_2129970 ?auto_2129979 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2129971 ?auto_2129972 ?auto_2129973 )
      ( MAKE-5CRATE-VERIFY ?auto_2129968 ?auto_2129969 ?auto_2129970 ?auto_2129971 ?auto_2129972 ?auto_2129973 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131177 - SURFACE
      ?auto_2131178 - SURFACE
      ?auto_2131179 - SURFACE
      ?auto_2131180 - SURFACE
      ?auto_2131181 - SURFACE
      ?auto_2131182 - SURFACE
      ?auto_2131183 - SURFACE
    )
    :vars
    (
      ?auto_2131185 - HOIST
      ?auto_2131184 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131185 ?auto_2131184 ) ( SURFACE-AT ?auto_2131182 ?auto_2131184 ) ( CLEAR ?auto_2131182 ) ( LIFTING ?auto_2131185 ?auto_2131183 ) ( IS-CRATE ?auto_2131183 ) ( not ( = ?auto_2131182 ?auto_2131183 ) ) ( ON ?auto_2131178 ?auto_2131177 ) ( ON ?auto_2131179 ?auto_2131178 ) ( ON ?auto_2131180 ?auto_2131179 ) ( ON ?auto_2131181 ?auto_2131180 ) ( ON ?auto_2131182 ?auto_2131181 ) ( not ( = ?auto_2131177 ?auto_2131178 ) ) ( not ( = ?auto_2131177 ?auto_2131179 ) ) ( not ( = ?auto_2131177 ?auto_2131180 ) ) ( not ( = ?auto_2131177 ?auto_2131181 ) ) ( not ( = ?auto_2131177 ?auto_2131182 ) ) ( not ( = ?auto_2131177 ?auto_2131183 ) ) ( not ( = ?auto_2131178 ?auto_2131179 ) ) ( not ( = ?auto_2131178 ?auto_2131180 ) ) ( not ( = ?auto_2131178 ?auto_2131181 ) ) ( not ( = ?auto_2131178 ?auto_2131182 ) ) ( not ( = ?auto_2131178 ?auto_2131183 ) ) ( not ( = ?auto_2131179 ?auto_2131180 ) ) ( not ( = ?auto_2131179 ?auto_2131181 ) ) ( not ( = ?auto_2131179 ?auto_2131182 ) ) ( not ( = ?auto_2131179 ?auto_2131183 ) ) ( not ( = ?auto_2131180 ?auto_2131181 ) ) ( not ( = ?auto_2131180 ?auto_2131182 ) ) ( not ( = ?auto_2131180 ?auto_2131183 ) ) ( not ( = ?auto_2131181 ?auto_2131182 ) ) ( not ( = ?auto_2131181 ?auto_2131183 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2131182 ?auto_2131183 )
      ( MAKE-6CRATE-VERIFY ?auto_2131177 ?auto_2131178 ?auto_2131179 ?auto_2131180 ?auto_2131181 ?auto_2131182 ?auto_2131183 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131221 - SURFACE
      ?auto_2131222 - SURFACE
      ?auto_2131223 - SURFACE
      ?auto_2131224 - SURFACE
      ?auto_2131225 - SURFACE
      ?auto_2131226 - SURFACE
      ?auto_2131227 - SURFACE
    )
    :vars
    (
      ?auto_2131230 - HOIST
      ?auto_2131229 - PLACE
      ?auto_2131228 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131230 ?auto_2131229 ) ( SURFACE-AT ?auto_2131226 ?auto_2131229 ) ( CLEAR ?auto_2131226 ) ( IS-CRATE ?auto_2131227 ) ( not ( = ?auto_2131226 ?auto_2131227 ) ) ( TRUCK-AT ?auto_2131228 ?auto_2131229 ) ( AVAILABLE ?auto_2131230 ) ( IN ?auto_2131227 ?auto_2131228 ) ( ON ?auto_2131226 ?auto_2131225 ) ( not ( = ?auto_2131225 ?auto_2131226 ) ) ( not ( = ?auto_2131225 ?auto_2131227 ) ) ( ON ?auto_2131222 ?auto_2131221 ) ( ON ?auto_2131223 ?auto_2131222 ) ( ON ?auto_2131224 ?auto_2131223 ) ( ON ?auto_2131225 ?auto_2131224 ) ( not ( = ?auto_2131221 ?auto_2131222 ) ) ( not ( = ?auto_2131221 ?auto_2131223 ) ) ( not ( = ?auto_2131221 ?auto_2131224 ) ) ( not ( = ?auto_2131221 ?auto_2131225 ) ) ( not ( = ?auto_2131221 ?auto_2131226 ) ) ( not ( = ?auto_2131221 ?auto_2131227 ) ) ( not ( = ?auto_2131222 ?auto_2131223 ) ) ( not ( = ?auto_2131222 ?auto_2131224 ) ) ( not ( = ?auto_2131222 ?auto_2131225 ) ) ( not ( = ?auto_2131222 ?auto_2131226 ) ) ( not ( = ?auto_2131222 ?auto_2131227 ) ) ( not ( = ?auto_2131223 ?auto_2131224 ) ) ( not ( = ?auto_2131223 ?auto_2131225 ) ) ( not ( = ?auto_2131223 ?auto_2131226 ) ) ( not ( = ?auto_2131223 ?auto_2131227 ) ) ( not ( = ?auto_2131224 ?auto_2131225 ) ) ( not ( = ?auto_2131224 ?auto_2131226 ) ) ( not ( = ?auto_2131224 ?auto_2131227 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131225 ?auto_2131226 ?auto_2131227 )
      ( MAKE-6CRATE-VERIFY ?auto_2131221 ?auto_2131222 ?auto_2131223 ?auto_2131224 ?auto_2131225 ?auto_2131226 ?auto_2131227 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131272 - SURFACE
      ?auto_2131273 - SURFACE
      ?auto_2131274 - SURFACE
      ?auto_2131275 - SURFACE
      ?auto_2131276 - SURFACE
      ?auto_2131277 - SURFACE
      ?auto_2131278 - SURFACE
    )
    :vars
    (
      ?auto_2131282 - HOIST
      ?auto_2131279 - PLACE
      ?auto_2131280 - TRUCK
      ?auto_2131281 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131282 ?auto_2131279 ) ( SURFACE-AT ?auto_2131277 ?auto_2131279 ) ( CLEAR ?auto_2131277 ) ( IS-CRATE ?auto_2131278 ) ( not ( = ?auto_2131277 ?auto_2131278 ) ) ( AVAILABLE ?auto_2131282 ) ( IN ?auto_2131278 ?auto_2131280 ) ( ON ?auto_2131277 ?auto_2131276 ) ( not ( = ?auto_2131276 ?auto_2131277 ) ) ( not ( = ?auto_2131276 ?auto_2131278 ) ) ( TRUCK-AT ?auto_2131280 ?auto_2131281 ) ( not ( = ?auto_2131281 ?auto_2131279 ) ) ( ON ?auto_2131273 ?auto_2131272 ) ( ON ?auto_2131274 ?auto_2131273 ) ( ON ?auto_2131275 ?auto_2131274 ) ( ON ?auto_2131276 ?auto_2131275 ) ( not ( = ?auto_2131272 ?auto_2131273 ) ) ( not ( = ?auto_2131272 ?auto_2131274 ) ) ( not ( = ?auto_2131272 ?auto_2131275 ) ) ( not ( = ?auto_2131272 ?auto_2131276 ) ) ( not ( = ?auto_2131272 ?auto_2131277 ) ) ( not ( = ?auto_2131272 ?auto_2131278 ) ) ( not ( = ?auto_2131273 ?auto_2131274 ) ) ( not ( = ?auto_2131273 ?auto_2131275 ) ) ( not ( = ?auto_2131273 ?auto_2131276 ) ) ( not ( = ?auto_2131273 ?auto_2131277 ) ) ( not ( = ?auto_2131273 ?auto_2131278 ) ) ( not ( = ?auto_2131274 ?auto_2131275 ) ) ( not ( = ?auto_2131274 ?auto_2131276 ) ) ( not ( = ?auto_2131274 ?auto_2131277 ) ) ( not ( = ?auto_2131274 ?auto_2131278 ) ) ( not ( = ?auto_2131275 ?auto_2131276 ) ) ( not ( = ?auto_2131275 ?auto_2131277 ) ) ( not ( = ?auto_2131275 ?auto_2131278 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131276 ?auto_2131277 ?auto_2131278 )
      ( MAKE-6CRATE-VERIFY ?auto_2131272 ?auto_2131273 ?auto_2131274 ?auto_2131275 ?auto_2131276 ?auto_2131277 ?auto_2131278 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131329 - SURFACE
      ?auto_2131330 - SURFACE
      ?auto_2131331 - SURFACE
      ?auto_2131332 - SURFACE
      ?auto_2131333 - SURFACE
      ?auto_2131334 - SURFACE
      ?auto_2131335 - SURFACE
    )
    :vars
    (
      ?auto_2131338 - HOIST
      ?auto_2131339 - PLACE
      ?auto_2131336 - TRUCK
      ?auto_2131337 - PLACE
      ?auto_2131340 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131338 ?auto_2131339 ) ( SURFACE-AT ?auto_2131334 ?auto_2131339 ) ( CLEAR ?auto_2131334 ) ( IS-CRATE ?auto_2131335 ) ( not ( = ?auto_2131334 ?auto_2131335 ) ) ( AVAILABLE ?auto_2131338 ) ( ON ?auto_2131334 ?auto_2131333 ) ( not ( = ?auto_2131333 ?auto_2131334 ) ) ( not ( = ?auto_2131333 ?auto_2131335 ) ) ( TRUCK-AT ?auto_2131336 ?auto_2131337 ) ( not ( = ?auto_2131337 ?auto_2131339 ) ) ( HOIST-AT ?auto_2131340 ?auto_2131337 ) ( LIFTING ?auto_2131340 ?auto_2131335 ) ( not ( = ?auto_2131338 ?auto_2131340 ) ) ( ON ?auto_2131330 ?auto_2131329 ) ( ON ?auto_2131331 ?auto_2131330 ) ( ON ?auto_2131332 ?auto_2131331 ) ( ON ?auto_2131333 ?auto_2131332 ) ( not ( = ?auto_2131329 ?auto_2131330 ) ) ( not ( = ?auto_2131329 ?auto_2131331 ) ) ( not ( = ?auto_2131329 ?auto_2131332 ) ) ( not ( = ?auto_2131329 ?auto_2131333 ) ) ( not ( = ?auto_2131329 ?auto_2131334 ) ) ( not ( = ?auto_2131329 ?auto_2131335 ) ) ( not ( = ?auto_2131330 ?auto_2131331 ) ) ( not ( = ?auto_2131330 ?auto_2131332 ) ) ( not ( = ?auto_2131330 ?auto_2131333 ) ) ( not ( = ?auto_2131330 ?auto_2131334 ) ) ( not ( = ?auto_2131330 ?auto_2131335 ) ) ( not ( = ?auto_2131331 ?auto_2131332 ) ) ( not ( = ?auto_2131331 ?auto_2131333 ) ) ( not ( = ?auto_2131331 ?auto_2131334 ) ) ( not ( = ?auto_2131331 ?auto_2131335 ) ) ( not ( = ?auto_2131332 ?auto_2131333 ) ) ( not ( = ?auto_2131332 ?auto_2131334 ) ) ( not ( = ?auto_2131332 ?auto_2131335 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131333 ?auto_2131334 ?auto_2131335 )
      ( MAKE-6CRATE-VERIFY ?auto_2131329 ?auto_2131330 ?auto_2131331 ?auto_2131332 ?auto_2131333 ?auto_2131334 ?auto_2131335 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131392 - SURFACE
      ?auto_2131393 - SURFACE
      ?auto_2131394 - SURFACE
      ?auto_2131395 - SURFACE
      ?auto_2131396 - SURFACE
      ?auto_2131397 - SURFACE
      ?auto_2131398 - SURFACE
    )
    :vars
    (
      ?auto_2131400 - HOIST
      ?auto_2131399 - PLACE
      ?auto_2131403 - TRUCK
      ?auto_2131401 - PLACE
      ?auto_2131404 - HOIST
      ?auto_2131402 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131400 ?auto_2131399 ) ( SURFACE-AT ?auto_2131397 ?auto_2131399 ) ( CLEAR ?auto_2131397 ) ( IS-CRATE ?auto_2131398 ) ( not ( = ?auto_2131397 ?auto_2131398 ) ) ( AVAILABLE ?auto_2131400 ) ( ON ?auto_2131397 ?auto_2131396 ) ( not ( = ?auto_2131396 ?auto_2131397 ) ) ( not ( = ?auto_2131396 ?auto_2131398 ) ) ( TRUCK-AT ?auto_2131403 ?auto_2131401 ) ( not ( = ?auto_2131401 ?auto_2131399 ) ) ( HOIST-AT ?auto_2131404 ?auto_2131401 ) ( not ( = ?auto_2131400 ?auto_2131404 ) ) ( AVAILABLE ?auto_2131404 ) ( SURFACE-AT ?auto_2131398 ?auto_2131401 ) ( ON ?auto_2131398 ?auto_2131402 ) ( CLEAR ?auto_2131398 ) ( not ( = ?auto_2131397 ?auto_2131402 ) ) ( not ( = ?auto_2131398 ?auto_2131402 ) ) ( not ( = ?auto_2131396 ?auto_2131402 ) ) ( ON ?auto_2131393 ?auto_2131392 ) ( ON ?auto_2131394 ?auto_2131393 ) ( ON ?auto_2131395 ?auto_2131394 ) ( ON ?auto_2131396 ?auto_2131395 ) ( not ( = ?auto_2131392 ?auto_2131393 ) ) ( not ( = ?auto_2131392 ?auto_2131394 ) ) ( not ( = ?auto_2131392 ?auto_2131395 ) ) ( not ( = ?auto_2131392 ?auto_2131396 ) ) ( not ( = ?auto_2131392 ?auto_2131397 ) ) ( not ( = ?auto_2131392 ?auto_2131398 ) ) ( not ( = ?auto_2131392 ?auto_2131402 ) ) ( not ( = ?auto_2131393 ?auto_2131394 ) ) ( not ( = ?auto_2131393 ?auto_2131395 ) ) ( not ( = ?auto_2131393 ?auto_2131396 ) ) ( not ( = ?auto_2131393 ?auto_2131397 ) ) ( not ( = ?auto_2131393 ?auto_2131398 ) ) ( not ( = ?auto_2131393 ?auto_2131402 ) ) ( not ( = ?auto_2131394 ?auto_2131395 ) ) ( not ( = ?auto_2131394 ?auto_2131396 ) ) ( not ( = ?auto_2131394 ?auto_2131397 ) ) ( not ( = ?auto_2131394 ?auto_2131398 ) ) ( not ( = ?auto_2131394 ?auto_2131402 ) ) ( not ( = ?auto_2131395 ?auto_2131396 ) ) ( not ( = ?auto_2131395 ?auto_2131397 ) ) ( not ( = ?auto_2131395 ?auto_2131398 ) ) ( not ( = ?auto_2131395 ?auto_2131402 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131396 ?auto_2131397 ?auto_2131398 )
      ( MAKE-6CRATE-VERIFY ?auto_2131392 ?auto_2131393 ?auto_2131394 ?auto_2131395 ?auto_2131396 ?auto_2131397 ?auto_2131398 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131456 - SURFACE
      ?auto_2131457 - SURFACE
      ?auto_2131458 - SURFACE
      ?auto_2131459 - SURFACE
      ?auto_2131460 - SURFACE
      ?auto_2131461 - SURFACE
      ?auto_2131462 - SURFACE
    )
    :vars
    (
      ?auto_2131467 - HOIST
      ?auto_2131468 - PLACE
      ?auto_2131463 - PLACE
      ?auto_2131465 - HOIST
      ?auto_2131464 - SURFACE
      ?auto_2131466 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131467 ?auto_2131468 ) ( SURFACE-AT ?auto_2131461 ?auto_2131468 ) ( CLEAR ?auto_2131461 ) ( IS-CRATE ?auto_2131462 ) ( not ( = ?auto_2131461 ?auto_2131462 ) ) ( AVAILABLE ?auto_2131467 ) ( ON ?auto_2131461 ?auto_2131460 ) ( not ( = ?auto_2131460 ?auto_2131461 ) ) ( not ( = ?auto_2131460 ?auto_2131462 ) ) ( not ( = ?auto_2131463 ?auto_2131468 ) ) ( HOIST-AT ?auto_2131465 ?auto_2131463 ) ( not ( = ?auto_2131467 ?auto_2131465 ) ) ( AVAILABLE ?auto_2131465 ) ( SURFACE-AT ?auto_2131462 ?auto_2131463 ) ( ON ?auto_2131462 ?auto_2131464 ) ( CLEAR ?auto_2131462 ) ( not ( = ?auto_2131461 ?auto_2131464 ) ) ( not ( = ?auto_2131462 ?auto_2131464 ) ) ( not ( = ?auto_2131460 ?auto_2131464 ) ) ( TRUCK-AT ?auto_2131466 ?auto_2131468 ) ( ON ?auto_2131457 ?auto_2131456 ) ( ON ?auto_2131458 ?auto_2131457 ) ( ON ?auto_2131459 ?auto_2131458 ) ( ON ?auto_2131460 ?auto_2131459 ) ( not ( = ?auto_2131456 ?auto_2131457 ) ) ( not ( = ?auto_2131456 ?auto_2131458 ) ) ( not ( = ?auto_2131456 ?auto_2131459 ) ) ( not ( = ?auto_2131456 ?auto_2131460 ) ) ( not ( = ?auto_2131456 ?auto_2131461 ) ) ( not ( = ?auto_2131456 ?auto_2131462 ) ) ( not ( = ?auto_2131456 ?auto_2131464 ) ) ( not ( = ?auto_2131457 ?auto_2131458 ) ) ( not ( = ?auto_2131457 ?auto_2131459 ) ) ( not ( = ?auto_2131457 ?auto_2131460 ) ) ( not ( = ?auto_2131457 ?auto_2131461 ) ) ( not ( = ?auto_2131457 ?auto_2131462 ) ) ( not ( = ?auto_2131457 ?auto_2131464 ) ) ( not ( = ?auto_2131458 ?auto_2131459 ) ) ( not ( = ?auto_2131458 ?auto_2131460 ) ) ( not ( = ?auto_2131458 ?auto_2131461 ) ) ( not ( = ?auto_2131458 ?auto_2131462 ) ) ( not ( = ?auto_2131458 ?auto_2131464 ) ) ( not ( = ?auto_2131459 ?auto_2131460 ) ) ( not ( = ?auto_2131459 ?auto_2131461 ) ) ( not ( = ?auto_2131459 ?auto_2131462 ) ) ( not ( = ?auto_2131459 ?auto_2131464 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131460 ?auto_2131461 ?auto_2131462 )
      ( MAKE-6CRATE-VERIFY ?auto_2131456 ?auto_2131457 ?auto_2131458 ?auto_2131459 ?auto_2131460 ?auto_2131461 ?auto_2131462 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131520 - SURFACE
      ?auto_2131521 - SURFACE
      ?auto_2131522 - SURFACE
      ?auto_2131523 - SURFACE
      ?auto_2131524 - SURFACE
      ?auto_2131525 - SURFACE
      ?auto_2131526 - SURFACE
    )
    :vars
    (
      ?auto_2131527 - HOIST
      ?auto_2131530 - PLACE
      ?auto_2131529 - PLACE
      ?auto_2131528 - HOIST
      ?auto_2131531 - SURFACE
      ?auto_2131532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131527 ?auto_2131530 ) ( IS-CRATE ?auto_2131526 ) ( not ( = ?auto_2131525 ?auto_2131526 ) ) ( not ( = ?auto_2131524 ?auto_2131525 ) ) ( not ( = ?auto_2131524 ?auto_2131526 ) ) ( not ( = ?auto_2131529 ?auto_2131530 ) ) ( HOIST-AT ?auto_2131528 ?auto_2131529 ) ( not ( = ?auto_2131527 ?auto_2131528 ) ) ( AVAILABLE ?auto_2131528 ) ( SURFACE-AT ?auto_2131526 ?auto_2131529 ) ( ON ?auto_2131526 ?auto_2131531 ) ( CLEAR ?auto_2131526 ) ( not ( = ?auto_2131525 ?auto_2131531 ) ) ( not ( = ?auto_2131526 ?auto_2131531 ) ) ( not ( = ?auto_2131524 ?auto_2131531 ) ) ( TRUCK-AT ?auto_2131532 ?auto_2131530 ) ( SURFACE-AT ?auto_2131524 ?auto_2131530 ) ( CLEAR ?auto_2131524 ) ( LIFTING ?auto_2131527 ?auto_2131525 ) ( IS-CRATE ?auto_2131525 ) ( ON ?auto_2131521 ?auto_2131520 ) ( ON ?auto_2131522 ?auto_2131521 ) ( ON ?auto_2131523 ?auto_2131522 ) ( ON ?auto_2131524 ?auto_2131523 ) ( not ( = ?auto_2131520 ?auto_2131521 ) ) ( not ( = ?auto_2131520 ?auto_2131522 ) ) ( not ( = ?auto_2131520 ?auto_2131523 ) ) ( not ( = ?auto_2131520 ?auto_2131524 ) ) ( not ( = ?auto_2131520 ?auto_2131525 ) ) ( not ( = ?auto_2131520 ?auto_2131526 ) ) ( not ( = ?auto_2131520 ?auto_2131531 ) ) ( not ( = ?auto_2131521 ?auto_2131522 ) ) ( not ( = ?auto_2131521 ?auto_2131523 ) ) ( not ( = ?auto_2131521 ?auto_2131524 ) ) ( not ( = ?auto_2131521 ?auto_2131525 ) ) ( not ( = ?auto_2131521 ?auto_2131526 ) ) ( not ( = ?auto_2131521 ?auto_2131531 ) ) ( not ( = ?auto_2131522 ?auto_2131523 ) ) ( not ( = ?auto_2131522 ?auto_2131524 ) ) ( not ( = ?auto_2131522 ?auto_2131525 ) ) ( not ( = ?auto_2131522 ?auto_2131526 ) ) ( not ( = ?auto_2131522 ?auto_2131531 ) ) ( not ( = ?auto_2131523 ?auto_2131524 ) ) ( not ( = ?auto_2131523 ?auto_2131525 ) ) ( not ( = ?auto_2131523 ?auto_2131526 ) ) ( not ( = ?auto_2131523 ?auto_2131531 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131524 ?auto_2131525 ?auto_2131526 )
      ( MAKE-6CRATE-VERIFY ?auto_2131520 ?auto_2131521 ?auto_2131522 ?auto_2131523 ?auto_2131524 ?auto_2131525 ?auto_2131526 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2131584 - SURFACE
      ?auto_2131585 - SURFACE
      ?auto_2131586 - SURFACE
      ?auto_2131587 - SURFACE
      ?auto_2131588 - SURFACE
      ?auto_2131589 - SURFACE
      ?auto_2131590 - SURFACE
    )
    :vars
    (
      ?auto_2131594 - HOIST
      ?auto_2131595 - PLACE
      ?auto_2131592 - PLACE
      ?auto_2131593 - HOIST
      ?auto_2131596 - SURFACE
      ?auto_2131591 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2131594 ?auto_2131595 ) ( IS-CRATE ?auto_2131590 ) ( not ( = ?auto_2131589 ?auto_2131590 ) ) ( not ( = ?auto_2131588 ?auto_2131589 ) ) ( not ( = ?auto_2131588 ?auto_2131590 ) ) ( not ( = ?auto_2131592 ?auto_2131595 ) ) ( HOIST-AT ?auto_2131593 ?auto_2131592 ) ( not ( = ?auto_2131594 ?auto_2131593 ) ) ( AVAILABLE ?auto_2131593 ) ( SURFACE-AT ?auto_2131590 ?auto_2131592 ) ( ON ?auto_2131590 ?auto_2131596 ) ( CLEAR ?auto_2131590 ) ( not ( = ?auto_2131589 ?auto_2131596 ) ) ( not ( = ?auto_2131590 ?auto_2131596 ) ) ( not ( = ?auto_2131588 ?auto_2131596 ) ) ( TRUCK-AT ?auto_2131591 ?auto_2131595 ) ( SURFACE-AT ?auto_2131588 ?auto_2131595 ) ( CLEAR ?auto_2131588 ) ( IS-CRATE ?auto_2131589 ) ( AVAILABLE ?auto_2131594 ) ( IN ?auto_2131589 ?auto_2131591 ) ( ON ?auto_2131585 ?auto_2131584 ) ( ON ?auto_2131586 ?auto_2131585 ) ( ON ?auto_2131587 ?auto_2131586 ) ( ON ?auto_2131588 ?auto_2131587 ) ( not ( = ?auto_2131584 ?auto_2131585 ) ) ( not ( = ?auto_2131584 ?auto_2131586 ) ) ( not ( = ?auto_2131584 ?auto_2131587 ) ) ( not ( = ?auto_2131584 ?auto_2131588 ) ) ( not ( = ?auto_2131584 ?auto_2131589 ) ) ( not ( = ?auto_2131584 ?auto_2131590 ) ) ( not ( = ?auto_2131584 ?auto_2131596 ) ) ( not ( = ?auto_2131585 ?auto_2131586 ) ) ( not ( = ?auto_2131585 ?auto_2131587 ) ) ( not ( = ?auto_2131585 ?auto_2131588 ) ) ( not ( = ?auto_2131585 ?auto_2131589 ) ) ( not ( = ?auto_2131585 ?auto_2131590 ) ) ( not ( = ?auto_2131585 ?auto_2131596 ) ) ( not ( = ?auto_2131586 ?auto_2131587 ) ) ( not ( = ?auto_2131586 ?auto_2131588 ) ) ( not ( = ?auto_2131586 ?auto_2131589 ) ) ( not ( = ?auto_2131586 ?auto_2131590 ) ) ( not ( = ?auto_2131586 ?auto_2131596 ) ) ( not ( = ?auto_2131587 ?auto_2131588 ) ) ( not ( = ?auto_2131587 ?auto_2131589 ) ) ( not ( = ?auto_2131587 ?auto_2131590 ) ) ( not ( = ?auto_2131587 ?auto_2131596 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2131588 ?auto_2131589 ?auto_2131590 )
      ( MAKE-6CRATE-VERIFY ?auto_2131584 ?auto_2131585 ?auto_2131586 ?auto_2131587 ?auto_2131588 ?auto_2131589 ?auto_2131590 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2132858 - SURFACE
      ?auto_2132859 - SURFACE
    )
    :vars
    (
      ?auto_2132863 - HOIST
      ?auto_2132864 - PLACE
      ?auto_2132860 - SURFACE
      ?auto_2132862 - TRUCK
      ?auto_2132865 - PLACE
      ?auto_2132861 - HOIST
      ?auto_2132866 - SURFACE
      ?auto_2132867 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2132863 ?auto_2132864 ) ( SURFACE-AT ?auto_2132858 ?auto_2132864 ) ( CLEAR ?auto_2132858 ) ( IS-CRATE ?auto_2132859 ) ( not ( = ?auto_2132858 ?auto_2132859 ) ) ( AVAILABLE ?auto_2132863 ) ( ON ?auto_2132858 ?auto_2132860 ) ( not ( = ?auto_2132860 ?auto_2132858 ) ) ( not ( = ?auto_2132860 ?auto_2132859 ) ) ( TRUCK-AT ?auto_2132862 ?auto_2132865 ) ( not ( = ?auto_2132865 ?auto_2132864 ) ) ( HOIST-AT ?auto_2132861 ?auto_2132865 ) ( not ( = ?auto_2132863 ?auto_2132861 ) ) ( SURFACE-AT ?auto_2132859 ?auto_2132865 ) ( ON ?auto_2132859 ?auto_2132866 ) ( CLEAR ?auto_2132859 ) ( not ( = ?auto_2132858 ?auto_2132866 ) ) ( not ( = ?auto_2132859 ?auto_2132866 ) ) ( not ( = ?auto_2132860 ?auto_2132866 ) ) ( LIFTING ?auto_2132861 ?auto_2132867 ) ( IS-CRATE ?auto_2132867 ) ( not ( = ?auto_2132858 ?auto_2132867 ) ) ( not ( = ?auto_2132859 ?auto_2132867 ) ) ( not ( = ?auto_2132860 ?auto_2132867 ) ) ( not ( = ?auto_2132866 ?auto_2132867 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2132861 ?auto_2132867 ?auto_2132862 ?auto_2132865 )
      ( MAKE-1CRATE ?auto_2132858 ?auto_2132859 )
      ( MAKE-1CRATE-VERIFY ?auto_2132858 ?auto_2132859 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133535 - SURFACE
      ?auto_2133536 - SURFACE
      ?auto_2133537 - SURFACE
      ?auto_2133538 - SURFACE
      ?auto_2133539 - SURFACE
      ?auto_2133540 - SURFACE
      ?auto_2133541 - SURFACE
      ?auto_2133542 - SURFACE
    )
    :vars
    (
      ?auto_2133544 - HOIST
      ?auto_2133543 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133544 ?auto_2133543 ) ( SURFACE-AT ?auto_2133541 ?auto_2133543 ) ( CLEAR ?auto_2133541 ) ( LIFTING ?auto_2133544 ?auto_2133542 ) ( IS-CRATE ?auto_2133542 ) ( not ( = ?auto_2133541 ?auto_2133542 ) ) ( ON ?auto_2133536 ?auto_2133535 ) ( ON ?auto_2133537 ?auto_2133536 ) ( ON ?auto_2133538 ?auto_2133537 ) ( ON ?auto_2133539 ?auto_2133538 ) ( ON ?auto_2133540 ?auto_2133539 ) ( ON ?auto_2133541 ?auto_2133540 ) ( not ( = ?auto_2133535 ?auto_2133536 ) ) ( not ( = ?auto_2133535 ?auto_2133537 ) ) ( not ( = ?auto_2133535 ?auto_2133538 ) ) ( not ( = ?auto_2133535 ?auto_2133539 ) ) ( not ( = ?auto_2133535 ?auto_2133540 ) ) ( not ( = ?auto_2133535 ?auto_2133541 ) ) ( not ( = ?auto_2133535 ?auto_2133542 ) ) ( not ( = ?auto_2133536 ?auto_2133537 ) ) ( not ( = ?auto_2133536 ?auto_2133538 ) ) ( not ( = ?auto_2133536 ?auto_2133539 ) ) ( not ( = ?auto_2133536 ?auto_2133540 ) ) ( not ( = ?auto_2133536 ?auto_2133541 ) ) ( not ( = ?auto_2133536 ?auto_2133542 ) ) ( not ( = ?auto_2133537 ?auto_2133538 ) ) ( not ( = ?auto_2133537 ?auto_2133539 ) ) ( not ( = ?auto_2133537 ?auto_2133540 ) ) ( not ( = ?auto_2133537 ?auto_2133541 ) ) ( not ( = ?auto_2133537 ?auto_2133542 ) ) ( not ( = ?auto_2133538 ?auto_2133539 ) ) ( not ( = ?auto_2133538 ?auto_2133540 ) ) ( not ( = ?auto_2133538 ?auto_2133541 ) ) ( not ( = ?auto_2133538 ?auto_2133542 ) ) ( not ( = ?auto_2133539 ?auto_2133540 ) ) ( not ( = ?auto_2133539 ?auto_2133541 ) ) ( not ( = ?auto_2133539 ?auto_2133542 ) ) ( not ( = ?auto_2133540 ?auto_2133541 ) ) ( not ( = ?auto_2133540 ?auto_2133542 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2133541 ?auto_2133542 )
      ( MAKE-7CRATE-VERIFY ?auto_2133535 ?auto_2133536 ?auto_2133537 ?auto_2133538 ?auto_2133539 ?auto_2133540 ?auto_2133541 ?auto_2133542 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133590 - SURFACE
      ?auto_2133591 - SURFACE
      ?auto_2133592 - SURFACE
      ?auto_2133593 - SURFACE
      ?auto_2133594 - SURFACE
      ?auto_2133595 - SURFACE
      ?auto_2133596 - SURFACE
      ?auto_2133597 - SURFACE
    )
    :vars
    (
      ?auto_2133599 - HOIST
      ?auto_2133598 - PLACE
      ?auto_2133600 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133599 ?auto_2133598 ) ( SURFACE-AT ?auto_2133596 ?auto_2133598 ) ( CLEAR ?auto_2133596 ) ( IS-CRATE ?auto_2133597 ) ( not ( = ?auto_2133596 ?auto_2133597 ) ) ( TRUCK-AT ?auto_2133600 ?auto_2133598 ) ( AVAILABLE ?auto_2133599 ) ( IN ?auto_2133597 ?auto_2133600 ) ( ON ?auto_2133596 ?auto_2133595 ) ( not ( = ?auto_2133595 ?auto_2133596 ) ) ( not ( = ?auto_2133595 ?auto_2133597 ) ) ( ON ?auto_2133591 ?auto_2133590 ) ( ON ?auto_2133592 ?auto_2133591 ) ( ON ?auto_2133593 ?auto_2133592 ) ( ON ?auto_2133594 ?auto_2133593 ) ( ON ?auto_2133595 ?auto_2133594 ) ( not ( = ?auto_2133590 ?auto_2133591 ) ) ( not ( = ?auto_2133590 ?auto_2133592 ) ) ( not ( = ?auto_2133590 ?auto_2133593 ) ) ( not ( = ?auto_2133590 ?auto_2133594 ) ) ( not ( = ?auto_2133590 ?auto_2133595 ) ) ( not ( = ?auto_2133590 ?auto_2133596 ) ) ( not ( = ?auto_2133590 ?auto_2133597 ) ) ( not ( = ?auto_2133591 ?auto_2133592 ) ) ( not ( = ?auto_2133591 ?auto_2133593 ) ) ( not ( = ?auto_2133591 ?auto_2133594 ) ) ( not ( = ?auto_2133591 ?auto_2133595 ) ) ( not ( = ?auto_2133591 ?auto_2133596 ) ) ( not ( = ?auto_2133591 ?auto_2133597 ) ) ( not ( = ?auto_2133592 ?auto_2133593 ) ) ( not ( = ?auto_2133592 ?auto_2133594 ) ) ( not ( = ?auto_2133592 ?auto_2133595 ) ) ( not ( = ?auto_2133592 ?auto_2133596 ) ) ( not ( = ?auto_2133592 ?auto_2133597 ) ) ( not ( = ?auto_2133593 ?auto_2133594 ) ) ( not ( = ?auto_2133593 ?auto_2133595 ) ) ( not ( = ?auto_2133593 ?auto_2133596 ) ) ( not ( = ?auto_2133593 ?auto_2133597 ) ) ( not ( = ?auto_2133594 ?auto_2133595 ) ) ( not ( = ?auto_2133594 ?auto_2133596 ) ) ( not ( = ?auto_2133594 ?auto_2133597 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133595 ?auto_2133596 ?auto_2133597 )
      ( MAKE-7CRATE-VERIFY ?auto_2133590 ?auto_2133591 ?auto_2133592 ?auto_2133593 ?auto_2133594 ?auto_2133595 ?auto_2133596 ?auto_2133597 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133653 - SURFACE
      ?auto_2133654 - SURFACE
      ?auto_2133655 - SURFACE
      ?auto_2133656 - SURFACE
      ?auto_2133657 - SURFACE
      ?auto_2133658 - SURFACE
      ?auto_2133659 - SURFACE
      ?auto_2133660 - SURFACE
    )
    :vars
    (
      ?auto_2133664 - HOIST
      ?auto_2133662 - PLACE
      ?auto_2133661 - TRUCK
      ?auto_2133663 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133664 ?auto_2133662 ) ( SURFACE-AT ?auto_2133659 ?auto_2133662 ) ( CLEAR ?auto_2133659 ) ( IS-CRATE ?auto_2133660 ) ( not ( = ?auto_2133659 ?auto_2133660 ) ) ( AVAILABLE ?auto_2133664 ) ( IN ?auto_2133660 ?auto_2133661 ) ( ON ?auto_2133659 ?auto_2133658 ) ( not ( = ?auto_2133658 ?auto_2133659 ) ) ( not ( = ?auto_2133658 ?auto_2133660 ) ) ( TRUCK-AT ?auto_2133661 ?auto_2133663 ) ( not ( = ?auto_2133663 ?auto_2133662 ) ) ( ON ?auto_2133654 ?auto_2133653 ) ( ON ?auto_2133655 ?auto_2133654 ) ( ON ?auto_2133656 ?auto_2133655 ) ( ON ?auto_2133657 ?auto_2133656 ) ( ON ?auto_2133658 ?auto_2133657 ) ( not ( = ?auto_2133653 ?auto_2133654 ) ) ( not ( = ?auto_2133653 ?auto_2133655 ) ) ( not ( = ?auto_2133653 ?auto_2133656 ) ) ( not ( = ?auto_2133653 ?auto_2133657 ) ) ( not ( = ?auto_2133653 ?auto_2133658 ) ) ( not ( = ?auto_2133653 ?auto_2133659 ) ) ( not ( = ?auto_2133653 ?auto_2133660 ) ) ( not ( = ?auto_2133654 ?auto_2133655 ) ) ( not ( = ?auto_2133654 ?auto_2133656 ) ) ( not ( = ?auto_2133654 ?auto_2133657 ) ) ( not ( = ?auto_2133654 ?auto_2133658 ) ) ( not ( = ?auto_2133654 ?auto_2133659 ) ) ( not ( = ?auto_2133654 ?auto_2133660 ) ) ( not ( = ?auto_2133655 ?auto_2133656 ) ) ( not ( = ?auto_2133655 ?auto_2133657 ) ) ( not ( = ?auto_2133655 ?auto_2133658 ) ) ( not ( = ?auto_2133655 ?auto_2133659 ) ) ( not ( = ?auto_2133655 ?auto_2133660 ) ) ( not ( = ?auto_2133656 ?auto_2133657 ) ) ( not ( = ?auto_2133656 ?auto_2133658 ) ) ( not ( = ?auto_2133656 ?auto_2133659 ) ) ( not ( = ?auto_2133656 ?auto_2133660 ) ) ( not ( = ?auto_2133657 ?auto_2133658 ) ) ( not ( = ?auto_2133657 ?auto_2133659 ) ) ( not ( = ?auto_2133657 ?auto_2133660 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133658 ?auto_2133659 ?auto_2133660 )
      ( MAKE-7CRATE-VERIFY ?auto_2133653 ?auto_2133654 ?auto_2133655 ?auto_2133656 ?auto_2133657 ?auto_2133658 ?auto_2133659 ?auto_2133660 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133723 - SURFACE
      ?auto_2133724 - SURFACE
      ?auto_2133725 - SURFACE
      ?auto_2133726 - SURFACE
      ?auto_2133727 - SURFACE
      ?auto_2133728 - SURFACE
      ?auto_2133729 - SURFACE
      ?auto_2133730 - SURFACE
    )
    :vars
    (
      ?auto_2133731 - HOIST
      ?auto_2133735 - PLACE
      ?auto_2133733 - TRUCK
      ?auto_2133734 - PLACE
      ?auto_2133732 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133731 ?auto_2133735 ) ( SURFACE-AT ?auto_2133729 ?auto_2133735 ) ( CLEAR ?auto_2133729 ) ( IS-CRATE ?auto_2133730 ) ( not ( = ?auto_2133729 ?auto_2133730 ) ) ( AVAILABLE ?auto_2133731 ) ( ON ?auto_2133729 ?auto_2133728 ) ( not ( = ?auto_2133728 ?auto_2133729 ) ) ( not ( = ?auto_2133728 ?auto_2133730 ) ) ( TRUCK-AT ?auto_2133733 ?auto_2133734 ) ( not ( = ?auto_2133734 ?auto_2133735 ) ) ( HOIST-AT ?auto_2133732 ?auto_2133734 ) ( LIFTING ?auto_2133732 ?auto_2133730 ) ( not ( = ?auto_2133731 ?auto_2133732 ) ) ( ON ?auto_2133724 ?auto_2133723 ) ( ON ?auto_2133725 ?auto_2133724 ) ( ON ?auto_2133726 ?auto_2133725 ) ( ON ?auto_2133727 ?auto_2133726 ) ( ON ?auto_2133728 ?auto_2133727 ) ( not ( = ?auto_2133723 ?auto_2133724 ) ) ( not ( = ?auto_2133723 ?auto_2133725 ) ) ( not ( = ?auto_2133723 ?auto_2133726 ) ) ( not ( = ?auto_2133723 ?auto_2133727 ) ) ( not ( = ?auto_2133723 ?auto_2133728 ) ) ( not ( = ?auto_2133723 ?auto_2133729 ) ) ( not ( = ?auto_2133723 ?auto_2133730 ) ) ( not ( = ?auto_2133724 ?auto_2133725 ) ) ( not ( = ?auto_2133724 ?auto_2133726 ) ) ( not ( = ?auto_2133724 ?auto_2133727 ) ) ( not ( = ?auto_2133724 ?auto_2133728 ) ) ( not ( = ?auto_2133724 ?auto_2133729 ) ) ( not ( = ?auto_2133724 ?auto_2133730 ) ) ( not ( = ?auto_2133725 ?auto_2133726 ) ) ( not ( = ?auto_2133725 ?auto_2133727 ) ) ( not ( = ?auto_2133725 ?auto_2133728 ) ) ( not ( = ?auto_2133725 ?auto_2133729 ) ) ( not ( = ?auto_2133725 ?auto_2133730 ) ) ( not ( = ?auto_2133726 ?auto_2133727 ) ) ( not ( = ?auto_2133726 ?auto_2133728 ) ) ( not ( = ?auto_2133726 ?auto_2133729 ) ) ( not ( = ?auto_2133726 ?auto_2133730 ) ) ( not ( = ?auto_2133727 ?auto_2133728 ) ) ( not ( = ?auto_2133727 ?auto_2133729 ) ) ( not ( = ?auto_2133727 ?auto_2133730 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133728 ?auto_2133729 ?auto_2133730 )
      ( MAKE-7CRATE-VERIFY ?auto_2133723 ?auto_2133724 ?auto_2133725 ?auto_2133726 ?auto_2133727 ?auto_2133728 ?auto_2133729 ?auto_2133730 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133800 - SURFACE
      ?auto_2133801 - SURFACE
      ?auto_2133802 - SURFACE
      ?auto_2133803 - SURFACE
      ?auto_2133804 - SURFACE
      ?auto_2133805 - SURFACE
      ?auto_2133806 - SURFACE
      ?auto_2133807 - SURFACE
    )
    :vars
    (
      ?auto_2133808 - HOIST
      ?auto_2133813 - PLACE
      ?auto_2133809 - TRUCK
      ?auto_2133812 - PLACE
      ?auto_2133811 - HOIST
      ?auto_2133810 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133808 ?auto_2133813 ) ( SURFACE-AT ?auto_2133806 ?auto_2133813 ) ( CLEAR ?auto_2133806 ) ( IS-CRATE ?auto_2133807 ) ( not ( = ?auto_2133806 ?auto_2133807 ) ) ( AVAILABLE ?auto_2133808 ) ( ON ?auto_2133806 ?auto_2133805 ) ( not ( = ?auto_2133805 ?auto_2133806 ) ) ( not ( = ?auto_2133805 ?auto_2133807 ) ) ( TRUCK-AT ?auto_2133809 ?auto_2133812 ) ( not ( = ?auto_2133812 ?auto_2133813 ) ) ( HOIST-AT ?auto_2133811 ?auto_2133812 ) ( not ( = ?auto_2133808 ?auto_2133811 ) ) ( AVAILABLE ?auto_2133811 ) ( SURFACE-AT ?auto_2133807 ?auto_2133812 ) ( ON ?auto_2133807 ?auto_2133810 ) ( CLEAR ?auto_2133807 ) ( not ( = ?auto_2133806 ?auto_2133810 ) ) ( not ( = ?auto_2133807 ?auto_2133810 ) ) ( not ( = ?auto_2133805 ?auto_2133810 ) ) ( ON ?auto_2133801 ?auto_2133800 ) ( ON ?auto_2133802 ?auto_2133801 ) ( ON ?auto_2133803 ?auto_2133802 ) ( ON ?auto_2133804 ?auto_2133803 ) ( ON ?auto_2133805 ?auto_2133804 ) ( not ( = ?auto_2133800 ?auto_2133801 ) ) ( not ( = ?auto_2133800 ?auto_2133802 ) ) ( not ( = ?auto_2133800 ?auto_2133803 ) ) ( not ( = ?auto_2133800 ?auto_2133804 ) ) ( not ( = ?auto_2133800 ?auto_2133805 ) ) ( not ( = ?auto_2133800 ?auto_2133806 ) ) ( not ( = ?auto_2133800 ?auto_2133807 ) ) ( not ( = ?auto_2133800 ?auto_2133810 ) ) ( not ( = ?auto_2133801 ?auto_2133802 ) ) ( not ( = ?auto_2133801 ?auto_2133803 ) ) ( not ( = ?auto_2133801 ?auto_2133804 ) ) ( not ( = ?auto_2133801 ?auto_2133805 ) ) ( not ( = ?auto_2133801 ?auto_2133806 ) ) ( not ( = ?auto_2133801 ?auto_2133807 ) ) ( not ( = ?auto_2133801 ?auto_2133810 ) ) ( not ( = ?auto_2133802 ?auto_2133803 ) ) ( not ( = ?auto_2133802 ?auto_2133804 ) ) ( not ( = ?auto_2133802 ?auto_2133805 ) ) ( not ( = ?auto_2133802 ?auto_2133806 ) ) ( not ( = ?auto_2133802 ?auto_2133807 ) ) ( not ( = ?auto_2133802 ?auto_2133810 ) ) ( not ( = ?auto_2133803 ?auto_2133804 ) ) ( not ( = ?auto_2133803 ?auto_2133805 ) ) ( not ( = ?auto_2133803 ?auto_2133806 ) ) ( not ( = ?auto_2133803 ?auto_2133807 ) ) ( not ( = ?auto_2133803 ?auto_2133810 ) ) ( not ( = ?auto_2133804 ?auto_2133805 ) ) ( not ( = ?auto_2133804 ?auto_2133806 ) ) ( not ( = ?auto_2133804 ?auto_2133807 ) ) ( not ( = ?auto_2133804 ?auto_2133810 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133805 ?auto_2133806 ?auto_2133807 )
      ( MAKE-7CRATE-VERIFY ?auto_2133800 ?auto_2133801 ?auto_2133802 ?auto_2133803 ?auto_2133804 ?auto_2133805 ?auto_2133806 ?auto_2133807 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133878 - SURFACE
      ?auto_2133879 - SURFACE
      ?auto_2133880 - SURFACE
      ?auto_2133881 - SURFACE
      ?auto_2133882 - SURFACE
      ?auto_2133883 - SURFACE
      ?auto_2133884 - SURFACE
      ?auto_2133885 - SURFACE
    )
    :vars
    (
      ?auto_2133889 - HOIST
      ?auto_2133890 - PLACE
      ?auto_2133886 - PLACE
      ?auto_2133887 - HOIST
      ?auto_2133891 - SURFACE
      ?auto_2133888 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133889 ?auto_2133890 ) ( SURFACE-AT ?auto_2133884 ?auto_2133890 ) ( CLEAR ?auto_2133884 ) ( IS-CRATE ?auto_2133885 ) ( not ( = ?auto_2133884 ?auto_2133885 ) ) ( AVAILABLE ?auto_2133889 ) ( ON ?auto_2133884 ?auto_2133883 ) ( not ( = ?auto_2133883 ?auto_2133884 ) ) ( not ( = ?auto_2133883 ?auto_2133885 ) ) ( not ( = ?auto_2133886 ?auto_2133890 ) ) ( HOIST-AT ?auto_2133887 ?auto_2133886 ) ( not ( = ?auto_2133889 ?auto_2133887 ) ) ( AVAILABLE ?auto_2133887 ) ( SURFACE-AT ?auto_2133885 ?auto_2133886 ) ( ON ?auto_2133885 ?auto_2133891 ) ( CLEAR ?auto_2133885 ) ( not ( = ?auto_2133884 ?auto_2133891 ) ) ( not ( = ?auto_2133885 ?auto_2133891 ) ) ( not ( = ?auto_2133883 ?auto_2133891 ) ) ( TRUCK-AT ?auto_2133888 ?auto_2133890 ) ( ON ?auto_2133879 ?auto_2133878 ) ( ON ?auto_2133880 ?auto_2133879 ) ( ON ?auto_2133881 ?auto_2133880 ) ( ON ?auto_2133882 ?auto_2133881 ) ( ON ?auto_2133883 ?auto_2133882 ) ( not ( = ?auto_2133878 ?auto_2133879 ) ) ( not ( = ?auto_2133878 ?auto_2133880 ) ) ( not ( = ?auto_2133878 ?auto_2133881 ) ) ( not ( = ?auto_2133878 ?auto_2133882 ) ) ( not ( = ?auto_2133878 ?auto_2133883 ) ) ( not ( = ?auto_2133878 ?auto_2133884 ) ) ( not ( = ?auto_2133878 ?auto_2133885 ) ) ( not ( = ?auto_2133878 ?auto_2133891 ) ) ( not ( = ?auto_2133879 ?auto_2133880 ) ) ( not ( = ?auto_2133879 ?auto_2133881 ) ) ( not ( = ?auto_2133879 ?auto_2133882 ) ) ( not ( = ?auto_2133879 ?auto_2133883 ) ) ( not ( = ?auto_2133879 ?auto_2133884 ) ) ( not ( = ?auto_2133879 ?auto_2133885 ) ) ( not ( = ?auto_2133879 ?auto_2133891 ) ) ( not ( = ?auto_2133880 ?auto_2133881 ) ) ( not ( = ?auto_2133880 ?auto_2133882 ) ) ( not ( = ?auto_2133880 ?auto_2133883 ) ) ( not ( = ?auto_2133880 ?auto_2133884 ) ) ( not ( = ?auto_2133880 ?auto_2133885 ) ) ( not ( = ?auto_2133880 ?auto_2133891 ) ) ( not ( = ?auto_2133881 ?auto_2133882 ) ) ( not ( = ?auto_2133881 ?auto_2133883 ) ) ( not ( = ?auto_2133881 ?auto_2133884 ) ) ( not ( = ?auto_2133881 ?auto_2133885 ) ) ( not ( = ?auto_2133881 ?auto_2133891 ) ) ( not ( = ?auto_2133882 ?auto_2133883 ) ) ( not ( = ?auto_2133882 ?auto_2133884 ) ) ( not ( = ?auto_2133882 ?auto_2133885 ) ) ( not ( = ?auto_2133882 ?auto_2133891 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133883 ?auto_2133884 ?auto_2133885 )
      ( MAKE-7CRATE-VERIFY ?auto_2133878 ?auto_2133879 ?auto_2133880 ?auto_2133881 ?auto_2133882 ?auto_2133883 ?auto_2133884 ?auto_2133885 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2133956 - SURFACE
      ?auto_2133957 - SURFACE
      ?auto_2133958 - SURFACE
      ?auto_2133959 - SURFACE
      ?auto_2133960 - SURFACE
      ?auto_2133961 - SURFACE
      ?auto_2133962 - SURFACE
      ?auto_2133963 - SURFACE
    )
    :vars
    (
      ?auto_2133965 - HOIST
      ?auto_2133964 - PLACE
      ?auto_2133968 - PLACE
      ?auto_2133966 - HOIST
      ?auto_2133969 - SURFACE
      ?auto_2133967 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2133965 ?auto_2133964 ) ( IS-CRATE ?auto_2133963 ) ( not ( = ?auto_2133962 ?auto_2133963 ) ) ( not ( = ?auto_2133961 ?auto_2133962 ) ) ( not ( = ?auto_2133961 ?auto_2133963 ) ) ( not ( = ?auto_2133968 ?auto_2133964 ) ) ( HOIST-AT ?auto_2133966 ?auto_2133968 ) ( not ( = ?auto_2133965 ?auto_2133966 ) ) ( AVAILABLE ?auto_2133966 ) ( SURFACE-AT ?auto_2133963 ?auto_2133968 ) ( ON ?auto_2133963 ?auto_2133969 ) ( CLEAR ?auto_2133963 ) ( not ( = ?auto_2133962 ?auto_2133969 ) ) ( not ( = ?auto_2133963 ?auto_2133969 ) ) ( not ( = ?auto_2133961 ?auto_2133969 ) ) ( TRUCK-AT ?auto_2133967 ?auto_2133964 ) ( SURFACE-AT ?auto_2133961 ?auto_2133964 ) ( CLEAR ?auto_2133961 ) ( LIFTING ?auto_2133965 ?auto_2133962 ) ( IS-CRATE ?auto_2133962 ) ( ON ?auto_2133957 ?auto_2133956 ) ( ON ?auto_2133958 ?auto_2133957 ) ( ON ?auto_2133959 ?auto_2133958 ) ( ON ?auto_2133960 ?auto_2133959 ) ( ON ?auto_2133961 ?auto_2133960 ) ( not ( = ?auto_2133956 ?auto_2133957 ) ) ( not ( = ?auto_2133956 ?auto_2133958 ) ) ( not ( = ?auto_2133956 ?auto_2133959 ) ) ( not ( = ?auto_2133956 ?auto_2133960 ) ) ( not ( = ?auto_2133956 ?auto_2133961 ) ) ( not ( = ?auto_2133956 ?auto_2133962 ) ) ( not ( = ?auto_2133956 ?auto_2133963 ) ) ( not ( = ?auto_2133956 ?auto_2133969 ) ) ( not ( = ?auto_2133957 ?auto_2133958 ) ) ( not ( = ?auto_2133957 ?auto_2133959 ) ) ( not ( = ?auto_2133957 ?auto_2133960 ) ) ( not ( = ?auto_2133957 ?auto_2133961 ) ) ( not ( = ?auto_2133957 ?auto_2133962 ) ) ( not ( = ?auto_2133957 ?auto_2133963 ) ) ( not ( = ?auto_2133957 ?auto_2133969 ) ) ( not ( = ?auto_2133958 ?auto_2133959 ) ) ( not ( = ?auto_2133958 ?auto_2133960 ) ) ( not ( = ?auto_2133958 ?auto_2133961 ) ) ( not ( = ?auto_2133958 ?auto_2133962 ) ) ( not ( = ?auto_2133958 ?auto_2133963 ) ) ( not ( = ?auto_2133958 ?auto_2133969 ) ) ( not ( = ?auto_2133959 ?auto_2133960 ) ) ( not ( = ?auto_2133959 ?auto_2133961 ) ) ( not ( = ?auto_2133959 ?auto_2133962 ) ) ( not ( = ?auto_2133959 ?auto_2133963 ) ) ( not ( = ?auto_2133959 ?auto_2133969 ) ) ( not ( = ?auto_2133960 ?auto_2133961 ) ) ( not ( = ?auto_2133960 ?auto_2133962 ) ) ( not ( = ?auto_2133960 ?auto_2133963 ) ) ( not ( = ?auto_2133960 ?auto_2133969 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2133961 ?auto_2133962 ?auto_2133963 )
      ( MAKE-7CRATE-VERIFY ?auto_2133956 ?auto_2133957 ?auto_2133958 ?auto_2133959 ?auto_2133960 ?auto_2133961 ?auto_2133962 ?auto_2133963 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2134034 - SURFACE
      ?auto_2134035 - SURFACE
      ?auto_2134036 - SURFACE
      ?auto_2134037 - SURFACE
      ?auto_2134038 - SURFACE
      ?auto_2134039 - SURFACE
      ?auto_2134040 - SURFACE
      ?auto_2134041 - SURFACE
    )
    :vars
    (
      ?auto_2134044 - HOIST
      ?auto_2134042 - PLACE
      ?auto_2134043 - PLACE
      ?auto_2134047 - HOIST
      ?auto_2134045 - SURFACE
      ?auto_2134046 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2134044 ?auto_2134042 ) ( IS-CRATE ?auto_2134041 ) ( not ( = ?auto_2134040 ?auto_2134041 ) ) ( not ( = ?auto_2134039 ?auto_2134040 ) ) ( not ( = ?auto_2134039 ?auto_2134041 ) ) ( not ( = ?auto_2134043 ?auto_2134042 ) ) ( HOIST-AT ?auto_2134047 ?auto_2134043 ) ( not ( = ?auto_2134044 ?auto_2134047 ) ) ( AVAILABLE ?auto_2134047 ) ( SURFACE-AT ?auto_2134041 ?auto_2134043 ) ( ON ?auto_2134041 ?auto_2134045 ) ( CLEAR ?auto_2134041 ) ( not ( = ?auto_2134040 ?auto_2134045 ) ) ( not ( = ?auto_2134041 ?auto_2134045 ) ) ( not ( = ?auto_2134039 ?auto_2134045 ) ) ( TRUCK-AT ?auto_2134046 ?auto_2134042 ) ( SURFACE-AT ?auto_2134039 ?auto_2134042 ) ( CLEAR ?auto_2134039 ) ( IS-CRATE ?auto_2134040 ) ( AVAILABLE ?auto_2134044 ) ( IN ?auto_2134040 ?auto_2134046 ) ( ON ?auto_2134035 ?auto_2134034 ) ( ON ?auto_2134036 ?auto_2134035 ) ( ON ?auto_2134037 ?auto_2134036 ) ( ON ?auto_2134038 ?auto_2134037 ) ( ON ?auto_2134039 ?auto_2134038 ) ( not ( = ?auto_2134034 ?auto_2134035 ) ) ( not ( = ?auto_2134034 ?auto_2134036 ) ) ( not ( = ?auto_2134034 ?auto_2134037 ) ) ( not ( = ?auto_2134034 ?auto_2134038 ) ) ( not ( = ?auto_2134034 ?auto_2134039 ) ) ( not ( = ?auto_2134034 ?auto_2134040 ) ) ( not ( = ?auto_2134034 ?auto_2134041 ) ) ( not ( = ?auto_2134034 ?auto_2134045 ) ) ( not ( = ?auto_2134035 ?auto_2134036 ) ) ( not ( = ?auto_2134035 ?auto_2134037 ) ) ( not ( = ?auto_2134035 ?auto_2134038 ) ) ( not ( = ?auto_2134035 ?auto_2134039 ) ) ( not ( = ?auto_2134035 ?auto_2134040 ) ) ( not ( = ?auto_2134035 ?auto_2134041 ) ) ( not ( = ?auto_2134035 ?auto_2134045 ) ) ( not ( = ?auto_2134036 ?auto_2134037 ) ) ( not ( = ?auto_2134036 ?auto_2134038 ) ) ( not ( = ?auto_2134036 ?auto_2134039 ) ) ( not ( = ?auto_2134036 ?auto_2134040 ) ) ( not ( = ?auto_2134036 ?auto_2134041 ) ) ( not ( = ?auto_2134036 ?auto_2134045 ) ) ( not ( = ?auto_2134037 ?auto_2134038 ) ) ( not ( = ?auto_2134037 ?auto_2134039 ) ) ( not ( = ?auto_2134037 ?auto_2134040 ) ) ( not ( = ?auto_2134037 ?auto_2134041 ) ) ( not ( = ?auto_2134037 ?auto_2134045 ) ) ( not ( = ?auto_2134038 ?auto_2134039 ) ) ( not ( = ?auto_2134038 ?auto_2134040 ) ) ( not ( = ?auto_2134038 ?auto_2134041 ) ) ( not ( = ?auto_2134038 ?auto_2134045 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2134039 ?auto_2134040 ?auto_2134041 )
      ( MAKE-7CRATE-VERIFY ?auto_2134034 ?auto_2134035 ?auto_2134036 ?auto_2134037 ?auto_2134038 ?auto_2134039 ?auto_2134040 ?auto_2134041 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2136107 - SURFACE
      ?auto_2136108 - SURFACE
    )
    :vars
    (
      ?auto_2136112 - HOIST
      ?auto_2136110 - PLACE
      ?auto_2136109 - SURFACE
      ?auto_2136111 - PLACE
      ?auto_2136114 - HOIST
      ?auto_2136113 - SURFACE
      ?auto_2136115 - TRUCK
      ?auto_2136116 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136112 ?auto_2136110 ) ( SURFACE-AT ?auto_2136107 ?auto_2136110 ) ( CLEAR ?auto_2136107 ) ( IS-CRATE ?auto_2136108 ) ( not ( = ?auto_2136107 ?auto_2136108 ) ) ( ON ?auto_2136107 ?auto_2136109 ) ( not ( = ?auto_2136109 ?auto_2136107 ) ) ( not ( = ?auto_2136109 ?auto_2136108 ) ) ( not ( = ?auto_2136111 ?auto_2136110 ) ) ( HOIST-AT ?auto_2136114 ?auto_2136111 ) ( not ( = ?auto_2136112 ?auto_2136114 ) ) ( AVAILABLE ?auto_2136114 ) ( SURFACE-AT ?auto_2136108 ?auto_2136111 ) ( ON ?auto_2136108 ?auto_2136113 ) ( CLEAR ?auto_2136108 ) ( not ( = ?auto_2136107 ?auto_2136113 ) ) ( not ( = ?auto_2136108 ?auto_2136113 ) ) ( not ( = ?auto_2136109 ?auto_2136113 ) ) ( TRUCK-AT ?auto_2136115 ?auto_2136110 ) ( LIFTING ?auto_2136112 ?auto_2136116 ) ( IS-CRATE ?auto_2136116 ) ( not ( = ?auto_2136107 ?auto_2136116 ) ) ( not ( = ?auto_2136108 ?auto_2136116 ) ) ( not ( = ?auto_2136109 ?auto_2136116 ) ) ( not ( = ?auto_2136113 ?auto_2136116 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2136112 ?auto_2136116 ?auto_2136115 ?auto_2136110 )
      ( MAKE-1CRATE ?auto_2136107 ?auto_2136108 )
      ( MAKE-1CRATE-VERIFY ?auto_2136107 ?auto_2136108 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2136946 - SURFACE
      ?auto_2136947 - SURFACE
      ?auto_2136948 - SURFACE
      ?auto_2136949 - SURFACE
      ?auto_2136950 - SURFACE
      ?auto_2136951 - SURFACE
      ?auto_2136952 - SURFACE
      ?auto_2136953 - SURFACE
      ?auto_2136954 - SURFACE
    )
    :vars
    (
      ?auto_2136956 - HOIST
      ?auto_2136955 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2136956 ?auto_2136955 ) ( SURFACE-AT ?auto_2136953 ?auto_2136955 ) ( CLEAR ?auto_2136953 ) ( LIFTING ?auto_2136956 ?auto_2136954 ) ( IS-CRATE ?auto_2136954 ) ( not ( = ?auto_2136953 ?auto_2136954 ) ) ( ON ?auto_2136947 ?auto_2136946 ) ( ON ?auto_2136948 ?auto_2136947 ) ( ON ?auto_2136949 ?auto_2136948 ) ( ON ?auto_2136950 ?auto_2136949 ) ( ON ?auto_2136951 ?auto_2136950 ) ( ON ?auto_2136952 ?auto_2136951 ) ( ON ?auto_2136953 ?auto_2136952 ) ( not ( = ?auto_2136946 ?auto_2136947 ) ) ( not ( = ?auto_2136946 ?auto_2136948 ) ) ( not ( = ?auto_2136946 ?auto_2136949 ) ) ( not ( = ?auto_2136946 ?auto_2136950 ) ) ( not ( = ?auto_2136946 ?auto_2136951 ) ) ( not ( = ?auto_2136946 ?auto_2136952 ) ) ( not ( = ?auto_2136946 ?auto_2136953 ) ) ( not ( = ?auto_2136946 ?auto_2136954 ) ) ( not ( = ?auto_2136947 ?auto_2136948 ) ) ( not ( = ?auto_2136947 ?auto_2136949 ) ) ( not ( = ?auto_2136947 ?auto_2136950 ) ) ( not ( = ?auto_2136947 ?auto_2136951 ) ) ( not ( = ?auto_2136947 ?auto_2136952 ) ) ( not ( = ?auto_2136947 ?auto_2136953 ) ) ( not ( = ?auto_2136947 ?auto_2136954 ) ) ( not ( = ?auto_2136948 ?auto_2136949 ) ) ( not ( = ?auto_2136948 ?auto_2136950 ) ) ( not ( = ?auto_2136948 ?auto_2136951 ) ) ( not ( = ?auto_2136948 ?auto_2136952 ) ) ( not ( = ?auto_2136948 ?auto_2136953 ) ) ( not ( = ?auto_2136948 ?auto_2136954 ) ) ( not ( = ?auto_2136949 ?auto_2136950 ) ) ( not ( = ?auto_2136949 ?auto_2136951 ) ) ( not ( = ?auto_2136949 ?auto_2136952 ) ) ( not ( = ?auto_2136949 ?auto_2136953 ) ) ( not ( = ?auto_2136949 ?auto_2136954 ) ) ( not ( = ?auto_2136950 ?auto_2136951 ) ) ( not ( = ?auto_2136950 ?auto_2136952 ) ) ( not ( = ?auto_2136950 ?auto_2136953 ) ) ( not ( = ?auto_2136950 ?auto_2136954 ) ) ( not ( = ?auto_2136951 ?auto_2136952 ) ) ( not ( = ?auto_2136951 ?auto_2136953 ) ) ( not ( = ?auto_2136951 ?auto_2136954 ) ) ( not ( = ?auto_2136952 ?auto_2136953 ) ) ( not ( = ?auto_2136952 ?auto_2136954 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2136953 ?auto_2136954 )
      ( MAKE-8CRATE-VERIFY ?auto_2136946 ?auto_2136947 ?auto_2136948 ?auto_2136949 ?auto_2136950 ?auto_2136951 ?auto_2136952 ?auto_2136953 ?auto_2136954 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137013 - SURFACE
      ?auto_2137014 - SURFACE
      ?auto_2137015 - SURFACE
      ?auto_2137016 - SURFACE
      ?auto_2137017 - SURFACE
      ?auto_2137018 - SURFACE
      ?auto_2137019 - SURFACE
      ?auto_2137020 - SURFACE
      ?auto_2137021 - SURFACE
    )
    :vars
    (
      ?auto_2137024 - HOIST
      ?auto_2137023 - PLACE
      ?auto_2137022 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137024 ?auto_2137023 ) ( SURFACE-AT ?auto_2137020 ?auto_2137023 ) ( CLEAR ?auto_2137020 ) ( IS-CRATE ?auto_2137021 ) ( not ( = ?auto_2137020 ?auto_2137021 ) ) ( TRUCK-AT ?auto_2137022 ?auto_2137023 ) ( AVAILABLE ?auto_2137024 ) ( IN ?auto_2137021 ?auto_2137022 ) ( ON ?auto_2137020 ?auto_2137019 ) ( not ( = ?auto_2137019 ?auto_2137020 ) ) ( not ( = ?auto_2137019 ?auto_2137021 ) ) ( ON ?auto_2137014 ?auto_2137013 ) ( ON ?auto_2137015 ?auto_2137014 ) ( ON ?auto_2137016 ?auto_2137015 ) ( ON ?auto_2137017 ?auto_2137016 ) ( ON ?auto_2137018 ?auto_2137017 ) ( ON ?auto_2137019 ?auto_2137018 ) ( not ( = ?auto_2137013 ?auto_2137014 ) ) ( not ( = ?auto_2137013 ?auto_2137015 ) ) ( not ( = ?auto_2137013 ?auto_2137016 ) ) ( not ( = ?auto_2137013 ?auto_2137017 ) ) ( not ( = ?auto_2137013 ?auto_2137018 ) ) ( not ( = ?auto_2137013 ?auto_2137019 ) ) ( not ( = ?auto_2137013 ?auto_2137020 ) ) ( not ( = ?auto_2137013 ?auto_2137021 ) ) ( not ( = ?auto_2137014 ?auto_2137015 ) ) ( not ( = ?auto_2137014 ?auto_2137016 ) ) ( not ( = ?auto_2137014 ?auto_2137017 ) ) ( not ( = ?auto_2137014 ?auto_2137018 ) ) ( not ( = ?auto_2137014 ?auto_2137019 ) ) ( not ( = ?auto_2137014 ?auto_2137020 ) ) ( not ( = ?auto_2137014 ?auto_2137021 ) ) ( not ( = ?auto_2137015 ?auto_2137016 ) ) ( not ( = ?auto_2137015 ?auto_2137017 ) ) ( not ( = ?auto_2137015 ?auto_2137018 ) ) ( not ( = ?auto_2137015 ?auto_2137019 ) ) ( not ( = ?auto_2137015 ?auto_2137020 ) ) ( not ( = ?auto_2137015 ?auto_2137021 ) ) ( not ( = ?auto_2137016 ?auto_2137017 ) ) ( not ( = ?auto_2137016 ?auto_2137018 ) ) ( not ( = ?auto_2137016 ?auto_2137019 ) ) ( not ( = ?auto_2137016 ?auto_2137020 ) ) ( not ( = ?auto_2137016 ?auto_2137021 ) ) ( not ( = ?auto_2137017 ?auto_2137018 ) ) ( not ( = ?auto_2137017 ?auto_2137019 ) ) ( not ( = ?auto_2137017 ?auto_2137020 ) ) ( not ( = ?auto_2137017 ?auto_2137021 ) ) ( not ( = ?auto_2137018 ?auto_2137019 ) ) ( not ( = ?auto_2137018 ?auto_2137020 ) ) ( not ( = ?auto_2137018 ?auto_2137021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137019 ?auto_2137020 ?auto_2137021 )
      ( MAKE-8CRATE-VERIFY ?auto_2137013 ?auto_2137014 ?auto_2137015 ?auto_2137016 ?auto_2137017 ?auto_2137018 ?auto_2137019 ?auto_2137020 ?auto_2137021 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137089 - SURFACE
      ?auto_2137090 - SURFACE
      ?auto_2137091 - SURFACE
      ?auto_2137092 - SURFACE
      ?auto_2137093 - SURFACE
      ?auto_2137094 - SURFACE
      ?auto_2137095 - SURFACE
      ?auto_2137096 - SURFACE
      ?auto_2137097 - SURFACE
    )
    :vars
    (
      ?auto_2137101 - HOIST
      ?auto_2137100 - PLACE
      ?auto_2137098 - TRUCK
      ?auto_2137099 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137101 ?auto_2137100 ) ( SURFACE-AT ?auto_2137096 ?auto_2137100 ) ( CLEAR ?auto_2137096 ) ( IS-CRATE ?auto_2137097 ) ( not ( = ?auto_2137096 ?auto_2137097 ) ) ( AVAILABLE ?auto_2137101 ) ( IN ?auto_2137097 ?auto_2137098 ) ( ON ?auto_2137096 ?auto_2137095 ) ( not ( = ?auto_2137095 ?auto_2137096 ) ) ( not ( = ?auto_2137095 ?auto_2137097 ) ) ( TRUCK-AT ?auto_2137098 ?auto_2137099 ) ( not ( = ?auto_2137099 ?auto_2137100 ) ) ( ON ?auto_2137090 ?auto_2137089 ) ( ON ?auto_2137091 ?auto_2137090 ) ( ON ?auto_2137092 ?auto_2137091 ) ( ON ?auto_2137093 ?auto_2137092 ) ( ON ?auto_2137094 ?auto_2137093 ) ( ON ?auto_2137095 ?auto_2137094 ) ( not ( = ?auto_2137089 ?auto_2137090 ) ) ( not ( = ?auto_2137089 ?auto_2137091 ) ) ( not ( = ?auto_2137089 ?auto_2137092 ) ) ( not ( = ?auto_2137089 ?auto_2137093 ) ) ( not ( = ?auto_2137089 ?auto_2137094 ) ) ( not ( = ?auto_2137089 ?auto_2137095 ) ) ( not ( = ?auto_2137089 ?auto_2137096 ) ) ( not ( = ?auto_2137089 ?auto_2137097 ) ) ( not ( = ?auto_2137090 ?auto_2137091 ) ) ( not ( = ?auto_2137090 ?auto_2137092 ) ) ( not ( = ?auto_2137090 ?auto_2137093 ) ) ( not ( = ?auto_2137090 ?auto_2137094 ) ) ( not ( = ?auto_2137090 ?auto_2137095 ) ) ( not ( = ?auto_2137090 ?auto_2137096 ) ) ( not ( = ?auto_2137090 ?auto_2137097 ) ) ( not ( = ?auto_2137091 ?auto_2137092 ) ) ( not ( = ?auto_2137091 ?auto_2137093 ) ) ( not ( = ?auto_2137091 ?auto_2137094 ) ) ( not ( = ?auto_2137091 ?auto_2137095 ) ) ( not ( = ?auto_2137091 ?auto_2137096 ) ) ( not ( = ?auto_2137091 ?auto_2137097 ) ) ( not ( = ?auto_2137092 ?auto_2137093 ) ) ( not ( = ?auto_2137092 ?auto_2137094 ) ) ( not ( = ?auto_2137092 ?auto_2137095 ) ) ( not ( = ?auto_2137092 ?auto_2137096 ) ) ( not ( = ?auto_2137092 ?auto_2137097 ) ) ( not ( = ?auto_2137093 ?auto_2137094 ) ) ( not ( = ?auto_2137093 ?auto_2137095 ) ) ( not ( = ?auto_2137093 ?auto_2137096 ) ) ( not ( = ?auto_2137093 ?auto_2137097 ) ) ( not ( = ?auto_2137094 ?auto_2137095 ) ) ( not ( = ?auto_2137094 ?auto_2137096 ) ) ( not ( = ?auto_2137094 ?auto_2137097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137095 ?auto_2137096 ?auto_2137097 )
      ( MAKE-8CRATE-VERIFY ?auto_2137089 ?auto_2137090 ?auto_2137091 ?auto_2137092 ?auto_2137093 ?auto_2137094 ?auto_2137095 ?auto_2137096 ?auto_2137097 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137173 - SURFACE
      ?auto_2137174 - SURFACE
      ?auto_2137175 - SURFACE
      ?auto_2137176 - SURFACE
      ?auto_2137177 - SURFACE
      ?auto_2137178 - SURFACE
      ?auto_2137179 - SURFACE
      ?auto_2137180 - SURFACE
      ?auto_2137181 - SURFACE
    )
    :vars
    (
      ?auto_2137185 - HOIST
      ?auto_2137183 - PLACE
      ?auto_2137182 - TRUCK
      ?auto_2137184 - PLACE
      ?auto_2137186 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137185 ?auto_2137183 ) ( SURFACE-AT ?auto_2137180 ?auto_2137183 ) ( CLEAR ?auto_2137180 ) ( IS-CRATE ?auto_2137181 ) ( not ( = ?auto_2137180 ?auto_2137181 ) ) ( AVAILABLE ?auto_2137185 ) ( ON ?auto_2137180 ?auto_2137179 ) ( not ( = ?auto_2137179 ?auto_2137180 ) ) ( not ( = ?auto_2137179 ?auto_2137181 ) ) ( TRUCK-AT ?auto_2137182 ?auto_2137184 ) ( not ( = ?auto_2137184 ?auto_2137183 ) ) ( HOIST-AT ?auto_2137186 ?auto_2137184 ) ( LIFTING ?auto_2137186 ?auto_2137181 ) ( not ( = ?auto_2137185 ?auto_2137186 ) ) ( ON ?auto_2137174 ?auto_2137173 ) ( ON ?auto_2137175 ?auto_2137174 ) ( ON ?auto_2137176 ?auto_2137175 ) ( ON ?auto_2137177 ?auto_2137176 ) ( ON ?auto_2137178 ?auto_2137177 ) ( ON ?auto_2137179 ?auto_2137178 ) ( not ( = ?auto_2137173 ?auto_2137174 ) ) ( not ( = ?auto_2137173 ?auto_2137175 ) ) ( not ( = ?auto_2137173 ?auto_2137176 ) ) ( not ( = ?auto_2137173 ?auto_2137177 ) ) ( not ( = ?auto_2137173 ?auto_2137178 ) ) ( not ( = ?auto_2137173 ?auto_2137179 ) ) ( not ( = ?auto_2137173 ?auto_2137180 ) ) ( not ( = ?auto_2137173 ?auto_2137181 ) ) ( not ( = ?auto_2137174 ?auto_2137175 ) ) ( not ( = ?auto_2137174 ?auto_2137176 ) ) ( not ( = ?auto_2137174 ?auto_2137177 ) ) ( not ( = ?auto_2137174 ?auto_2137178 ) ) ( not ( = ?auto_2137174 ?auto_2137179 ) ) ( not ( = ?auto_2137174 ?auto_2137180 ) ) ( not ( = ?auto_2137174 ?auto_2137181 ) ) ( not ( = ?auto_2137175 ?auto_2137176 ) ) ( not ( = ?auto_2137175 ?auto_2137177 ) ) ( not ( = ?auto_2137175 ?auto_2137178 ) ) ( not ( = ?auto_2137175 ?auto_2137179 ) ) ( not ( = ?auto_2137175 ?auto_2137180 ) ) ( not ( = ?auto_2137175 ?auto_2137181 ) ) ( not ( = ?auto_2137176 ?auto_2137177 ) ) ( not ( = ?auto_2137176 ?auto_2137178 ) ) ( not ( = ?auto_2137176 ?auto_2137179 ) ) ( not ( = ?auto_2137176 ?auto_2137180 ) ) ( not ( = ?auto_2137176 ?auto_2137181 ) ) ( not ( = ?auto_2137177 ?auto_2137178 ) ) ( not ( = ?auto_2137177 ?auto_2137179 ) ) ( not ( = ?auto_2137177 ?auto_2137180 ) ) ( not ( = ?auto_2137177 ?auto_2137181 ) ) ( not ( = ?auto_2137178 ?auto_2137179 ) ) ( not ( = ?auto_2137178 ?auto_2137180 ) ) ( not ( = ?auto_2137178 ?auto_2137181 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137179 ?auto_2137180 ?auto_2137181 )
      ( MAKE-8CRATE-VERIFY ?auto_2137173 ?auto_2137174 ?auto_2137175 ?auto_2137176 ?auto_2137177 ?auto_2137178 ?auto_2137179 ?auto_2137180 ?auto_2137181 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137265 - SURFACE
      ?auto_2137266 - SURFACE
      ?auto_2137267 - SURFACE
      ?auto_2137268 - SURFACE
      ?auto_2137269 - SURFACE
      ?auto_2137270 - SURFACE
      ?auto_2137271 - SURFACE
      ?auto_2137272 - SURFACE
      ?auto_2137273 - SURFACE
    )
    :vars
    (
      ?auto_2137279 - HOIST
      ?auto_2137276 - PLACE
      ?auto_2137275 - TRUCK
      ?auto_2137278 - PLACE
      ?auto_2137277 - HOIST
      ?auto_2137274 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137279 ?auto_2137276 ) ( SURFACE-AT ?auto_2137272 ?auto_2137276 ) ( CLEAR ?auto_2137272 ) ( IS-CRATE ?auto_2137273 ) ( not ( = ?auto_2137272 ?auto_2137273 ) ) ( AVAILABLE ?auto_2137279 ) ( ON ?auto_2137272 ?auto_2137271 ) ( not ( = ?auto_2137271 ?auto_2137272 ) ) ( not ( = ?auto_2137271 ?auto_2137273 ) ) ( TRUCK-AT ?auto_2137275 ?auto_2137278 ) ( not ( = ?auto_2137278 ?auto_2137276 ) ) ( HOIST-AT ?auto_2137277 ?auto_2137278 ) ( not ( = ?auto_2137279 ?auto_2137277 ) ) ( AVAILABLE ?auto_2137277 ) ( SURFACE-AT ?auto_2137273 ?auto_2137278 ) ( ON ?auto_2137273 ?auto_2137274 ) ( CLEAR ?auto_2137273 ) ( not ( = ?auto_2137272 ?auto_2137274 ) ) ( not ( = ?auto_2137273 ?auto_2137274 ) ) ( not ( = ?auto_2137271 ?auto_2137274 ) ) ( ON ?auto_2137266 ?auto_2137265 ) ( ON ?auto_2137267 ?auto_2137266 ) ( ON ?auto_2137268 ?auto_2137267 ) ( ON ?auto_2137269 ?auto_2137268 ) ( ON ?auto_2137270 ?auto_2137269 ) ( ON ?auto_2137271 ?auto_2137270 ) ( not ( = ?auto_2137265 ?auto_2137266 ) ) ( not ( = ?auto_2137265 ?auto_2137267 ) ) ( not ( = ?auto_2137265 ?auto_2137268 ) ) ( not ( = ?auto_2137265 ?auto_2137269 ) ) ( not ( = ?auto_2137265 ?auto_2137270 ) ) ( not ( = ?auto_2137265 ?auto_2137271 ) ) ( not ( = ?auto_2137265 ?auto_2137272 ) ) ( not ( = ?auto_2137265 ?auto_2137273 ) ) ( not ( = ?auto_2137265 ?auto_2137274 ) ) ( not ( = ?auto_2137266 ?auto_2137267 ) ) ( not ( = ?auto_2137266 ?auto_2137268 ) ) ( not ( = ?auto_2137266 ?auto_2137269 ) ) ( not ( = ?auto_2137266 ?auto_2137270 ) ) ( not ( = ?auto_2137266 ?auto_2137271 ) ) ( not ( = ?auto_2137266 ?auto_2137272 ) ) ( not ( = ?auto_2137266 ?auto_2137273 ) ) ( not ( = ?auto_2137266 ?auto_2137274 ) ) ( not ( = ?auto_2137267 ?auto_2137268 ) ) ( not ( = ?auto_2137267 ?auto_2137269 ) ) ( not ( = ?auto_2137267 ?auto_2137270 ) ) ( not ( = ?auto_2137267 ?auto_2137271 ) ) ( not ( = ?auto_2137267 ?auto_2137272 ) ) ( not ( = ?auto_2137267 ?auto_2137273 ) ) ( not ( = ?auto_2137267 ?auto_2137274 ) ) ( not ( = ?auto_2137268 ?auto_2137269 ) ) ( not ( = ?auto_2137268 ?auto_2137270 ) ) ( not ( = ?auto_2137268 ?auto_2137271 ) ) ( not ( = ?auto_2137268 ?auto_2137272 ) ) ( not ( = ?auto_2137268 ?auto_2137273 ) ) ( not ( = ?auto_2137268 ?auto_2137274 ) ) ( not ( = ?auto_2137269 ?auto_2137270 ) ) ( not ( = ?auto_2137269 ?auto_2137271 ) ) ( not ( = ?auto_2137269 ?auto_2137272 ) ) ( not ( = ?auto_2137269 ?auto_2137273 ) ) ( not ( = ?auto_2137269 ?auto_2137274 ) ) ( not ( = ?auto_2137270 ?auto_2137271 ) ) ( not ( = ?auto_2137270 ?auto_2137272 ) ) ( not ( = ?auto_2137270 ?auto_2137273 ) ) ( not ( = ?auto_2137270 ?auto_2137274 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137271 ?auto_2137272 ?auto_2137273 )
      ( MAKE-8CRATE-VERIFY ?auto_2137265 ?auto_2137266 ?auto_2137267 ?auto_2137268 ?auto_2137269 ?auto_2137270 ?auto_2137271 ?auto_2137272 ?auto_2137273 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137358 - SURFACE
      ?auto_2137359 - SURFACE
      ?auto_2137360 - SURFACE
      ?auto_2137361 - SURFACE
      ?auto_2137362 - SURFACE
      ?auto_2137363 - SURFACE
      ?auto_2137364 - SURFACE
      ?auto_2137365 - SURFACE
      ?auto_2137366 - SURFACE
    )
    :vars
    (
      ?auto_2137371 - HOIST
      ?auto_2137370 - PLACE
      ?auto_2137369 - PLACE
      ?auto_2137368 - HOIST
      ?auto_2137367 - SURFACE
      ?auto_2137372 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137371 ?auto_2137370 ) ( SURFACE-AT ?auto_2137365 ?auto_2137370 ) ( CLEAR ?auto_2137365 ) ( IS-CRATE ?auto_2137366 ) ( not ( = ?auto_2137365 ?auto_2137366 ) ) ( AVAILABLE ?auto_2137371 ) ( ON ?auto_2137365 ?auto_2137364 ) ( not ( = ?auto_2137364 ?auto_2137365 ) ) ( not ( = ?auto_2137364 ?auto_2137366 ) ) ( not ( = ?auto_2137369 ?auto_2137370 ) ) ( HOIST-AT ?auto_2137368 ?auto_2137369 ) ( not ( = ?auto_2137371 ?auto_2137368 ) ) ( AVAILABLE ?auto_2137368 ) ( SURFACE-AT ?auto_2137366 ?auto_2137369 ) ( ON ?auto_2137366 ?auto_2137367 ) ( CLEAR ?auto_2137366 ) ( not ( = ?auto_2137365 ?auto_2137367 ) ) ( not ( = ?auto_2137366 ?auto_2137367 ) ) ( not ( = ?auto_2137364 ?auto_2137367 ) ) ( TRUCK-AT ?auto_2137372 ?auto_2137370 ) ( ON ?auto_2137359 ?auto_2137358 ) ( ON ?auto_2137360 ?auto_2137359 ) ( ON ?auto_2137361 ?auto_2137360 ) ( ON ?auto_2137362 ?auto_2137361 ) ( ON ?auto_2137363 ?auto_2137362 ) ( ON ?auto_2137364 ?auto_2137363 ) ( not ( = ?auto_2137358 ?auto_2137359 ) ) ( not ( = ?auto_2137358 ?auto_2137360 ) ) ( not ( = ?auto_2137358 ?auto_2137361 ) ) ( not ( = ?auto_2137358 ?auto_2137362 ) ) ( not ( = ?auto_2137358 ?auto_2137363 ) ) ( not ( = ?auto_2137358 ?auto_2137364 ) ) ( not ( = ?auto_2137358 ?auto_2137365 ) ) ( not ( = ?auto_2137358 ?auto_2137366 ) ) ( not ( = ?auto_2137358 ?auto_2137367 ) ) ( not ( = ?auto_2137359 ?auto_2137360 ) ) ( not ( = ?auto_2137359 ?auto_2137361 ) ) ( not ( = ?auto_2137359 ?auto_2137362 ) ) ( not ( = ?auto_2137359 ?auto_2137363 ) ) ( not ( = ?auto_2137359 ?auto_2137364 ) ) ( not ( = ?auto_2137359 ?auto_2137365 ) ) ( not ( = ?auto_2137359 ?auto_2137366 ) ) ( not ( = ?auto_2137359 ?auto_2137367 ) ) ( not ( = ?auto_2137360 ?auto_2137361 ) ) ( not ( = ?auto_2137360 ?auto_2137362 ) ) ( not ( = ?auto_2137360 ?auto_2137363 ) ) ( not ( = ?auto_2137360 ?auto_2137364 ) ) ( not ( = ?auto_2137360 ?auto_2137365 ) ) ( not ( = ?auto_2137360 ?auto_2137366 ) ) ( not ( = ?auto_2137360 ?auto_2137367 ) ) ( not ( = ?auto_2137361 ?auto_2137362 ) ) ( not ( = ?auto_2137361 ?auto_2137363 ) ) ( not ( = ?auto_2137361 ?auto_2137364 ) ) ( not ( = ?auto_2137361 ?auto_2137365 ) ) ( not ( = ?auto_2137361 ?auto_2137366 ) ) ( not ( = ?auto_2137361 ?auto_2137367 ) ) ( not ( = ?auto_2137362 ?auto_2137363 ) ) ( not ( = ?auto_2137362 ?auto_2137364 ) ) ( not ( = ?auto_2137362 ?auto_2137365 ) ) ( not ( = ?auto_2137362 ?auto_2137366 ) ) ( not ( = ?auto_2137362 ?auto_2137367 ) ) ( not ( = ?auto_2137363 ?auto_2137364 ) ) ( not ( = ?auto_2137363 ?auto_2137365 ) ) ( not ( = ?auto_2137363 ?auto_2137366 ) ) ( not ( = ?auto_2137363 ?auto_2137367 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137364 ?auto_2137365 ?auto_2137366 )
      ( MAKE-8CRATE-VERIFY ?auto_2137358 ?auto_2137359 ?auto_2137360 ?auto_2137361 ?auto_2137362 ?auto_2137363 ?auto_2137364 ?auto_2137365 ?auto_2137366 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137451 - SURFACE
      ?auto_2137452 - SURFACE
      ?auto_2137453 - SURFACE
      ?auto_2137454 - SURFACE
      ?auto_2137455 - SURFACE
      ?auto_2137456 - SURFACE
      ?auto_2137457 - SURFACE
      ?auto_2137458 - SURFACE
      ?auto_2137459 - SURFACE
    )
    :vars
    (
      ?auto_2137464 - HOIST
      ?auto_2137461 - PLACE
      ?auto_2137463 - PLACE
      ?auto_2137460 - HOIST
      ?auto_2137462 - SURFACE
      ?auto_2137465 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137464 ?auto_2137461 ) ( IS-CRATE ?auto_2137459 ) ( not ( = ?auto_2137458 ?auto_2137459 ) ) ( not ( = ?auto_2137457 ?auto_2137458 ) ) ( not ( = ?auto_2137457 ?auto_2137459 ) ) ( not ( = ?auto_2137463 ?auto_2137461 ) ) ( HOIST-AT ?auto_2137460 ?auto_2137463 ) ( not ( = ?auto_2137464 ?auto_2137460 ) ) ( AVAILABLE ?auto_2137460 ) ( SURFACE-AT ?auto_2137459 ?auto_2137463 ) ( ON ?auto_2137459 ?auto_2137462 ) ( CLEAR ?auto_2137459 ) ( not ( = ?auto_2137458 ?auto_2137462 ) ) ( not ( = ?auto_2137459 ?auto_2137462 ) ) ( not ( = ?auto_2137457 ?auto_2137462 ) ) ( TRUCK-AT ?auto_2137465 ?auto_2137461 ) ( SURFACE-AT ?auto_2137457 ?auto_2137461 ) ( CLEAR ?auto_2137457 ) ( LIFTING ?auto_2137464 ?auto_2137458 ) ( IS-CRATE ?auto_2137458 ) ( ON ?auto_2137452 ?auto_2137451 ) ( ON ?auto_2137453 ?auto_2137452 ) ( ON ?auto_2137454 ?auto_2137453 ) ( ON ?auto_2137455 ?auto_2137454 ) ( ON ?auto_2137456 ?auto_2137455 ) ( ON ?auto_2137457 ?auto_2137456 ) ( not ( = ?auto_2137451 ?auto_2137452 ) ) ( not ( = ?auto_2137451 ?auto_2137453 ) ) ( not ( = ?auto_2137451 ?auto_2137454 ) ) ( not ( = ?auto_2137451 ?auto_2137455 ) ) ( not ( = ?auto_2137451 ?auto_2137456 ) ) ( not ( = ?auto_2137451 ?auto_2137457 ) ) ( not ( = ?auto_2137451 ?auto_2137458 ) ) ( not ( = ?auto_2137451 ?auto_2137459 ) ) ( not ( = ?auto_2137451 ?auto_2137462 ) ) ( not ( = ?auto_2137452 ?auto_2137453 ) ) ( not ( = ?auto_2137452 ?auto_2137454 ) ) ( not ( = ?auto_2137452 ?auto_2137455 ) ) ( not ( = ?auto_2137452 ?auto_2137456 ) ) ( not ( = ?auto_2137452 ?auto_2137457 ) ) ( not ( = ?auto_2137452 ?auto_2137458 ) ) ( not ( = ?auto_2137452 ?auto_2137459 ) ) ( not ( = ?auto_2137452 ?auto_2137462 ) ) ( not ( = ?auto_2137453 ?auto_2137454 ) ) ( not ( = ?auto_2137453 ?auto_2137455 ) ) ( not ( = ?auto_2137453 ?auto_2137456 ) ) ( not ( = ?auto_2137453 ?auto_2137457 ) ) ( not ( = ?auto_2137453 ?auto_2137458 ) ) ( not ( = ?auto_2137453 ?auto_2137459 ) ) ( not ( = ?auto_2137453 ?auto_2137462 ) ) ( not ( = ?auto_2137454 ?auto_2137455 ) ) ( not ( = ?auto_2137454 ?auto_2137456 ) ) ( not ( = ?auto_2137454 ?auto_2137457 ) ) ( not ( = ?auto_2137454 ?auto_2137458 ) ) ( not ( = ?auto_2137454 ?auto_2137459 ) ) ( not ( = ?auto_2137454 ?auto_2137462 ) ) ( not ( = ?auto_2137455 ?auto_2137456 ) ) ( not ( = ?auto_2137455 ?auto_2137457 ) ) ( not ( = ?auto_2137455 ?auto_2137458 ) ) ( not ( = ?auto_2137455 ?auto_2137459 ) ) ( not ( = ?auto_2137455 ?auto_2137462 ) ) ( not ( = ?auto_2137456 ?auto_2137457 ) ) ( not ( = ?auto_2137456 ?auto_2137458 ) ) ( not ( = ?auto_2137456 ?auto_2137459 ) ) ( not ( = ?auto_2137456 ?auto_2137462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137457 ?auto_2137458 ?auto_2137459 )
      ( MAKE-8CRATE-VERIFY ?auto_2137451 ?auto_2137452 ?auto_2137453 ?auto_2137454 ?auto_2137455 ?auto_2137456 ?auto_2137457 ?auto_2137458 ?auto_2137459 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2137544 - SURFACE
      ?auto_2137545 - SURFACE
      ?auto_2137546 - SURFACE
      ?auto_2137547 - SURFACE
      ?auto_2137548 - SURFACE
      ?auto_2137549 - SURFACE
      ?auto_2137550 - SURFACE
      ?auto_2137551 - SURFACE
      ?auto_2137552 - SURFACE
    )
    :vars
    (
      ?auto_2137557 - HOIST
      ?auto_2137555 - PLACE
      ?auto_2137554 - PLACE
      ?auto_2137553 - HOIST
      ?auto_2137558 - SURFACE
      ?auto_2137556 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2137557 ?auto_2137555 ) ( IS-CRATE ?auto_2137552 ) ( not ( = ?auto_2137551 ?auto_2137552 ) ) ( not ( = ?auto_2137550 ?auto_2137551 ) ) ( not ( = ?auto_2137550 ?auto_2137552 ) ) ( not ( = ?auto_2137554 ?auto_2137555 ) ) ( HOIST-AT ?auto_2137553 ?auto_2137554 ) ( not ( = ?auto_2137557 ?auto_2137553 ) ) ( AVAILABLE ?auto_2137553 ) ( SURFACE-AT ?auto_2137552 ?auto_2137554 ) ( ON ?auto_2137552 ?auto_2137558 ) ( CLEAR ?auto_2137552 ) ( not ( = ?auto_2137551 ?auto_2137558 ) ) ( not ( = ?auto_2137552 ?auto_2137558 ) ) ( not ( = ?auto_2137550 ?auto_2137558 ) ) ( TRUCK-AT ?auto_2137556 ?auto_2137555 ) ( SURFACE-AT ?auto_2137550 ?auto_2137555 ) ( CLEAR ?auto_2137550 ) ( IS-CRATE ?auto_2137551 ) ( AVAILABLE ?auto_2137557 ) ( IN ?auto_2137551 ?auto_2137556 ) ( ON ?auto_2137545 ?auto_2137544 ) ( ON ?auto_2137546 ?auto_2137545 ) ( ON ?auto_2137547 ?auto_2137546 ) ( ON ?auto_2137548 ?auto_2137547 ) ( ON ?auto_2137549 ?auto_2137548 ) ( ON ?auto_2137550 ?auto_2137549 ) ( not ( = ?auto_2137544 ?auto_2137545 ) ) ( not ( = ?auto_2137544 ?auto_2137546 ) ) ( not ( = ?auto_2137544 ?auto_2137547 ) ) ( not ( = ?auto_2137544 ?auto_2137548 ) ) ( not ( = ?auto_2137544 ?auto_2137549 ) ) ( not ( = ?auto_2137544 ?auto_2137550 ) ) ( not ( = ?auto_2137544 ?auto_2137551 ) ) ( not ( = ?auto_2137544 ?auto_2137552 ) ) ( not ( = ?auto_2137544 ?auto_2137558 ) ) ( not ( = ?auto_2137545 ?auto_2137546 ) ) ( not ( = ?auto_2137545 ?auto_2137547 ) ) ( not ( = ?auto_2137545 ?auto_2137548 ) ) ( not ( = ?auto_2137545 ?auto_2137549 ) ) ( not ( = ?auto_2137545 ?auto_2137550 ) ) ( not ( = ?auto_2137545 ?auto_2137551 ) ) ( not ( = ?auto_2137545 ?auto_2137552 ) ) ( not ( = ?auto_2137545 ?auto_2137558 ) ) ( not ( = ?auto_2137546 ?auto_2137547 ) ) ( not ( = ?auto_2137546 ?auto_2137548 ) ) ( not ( = ?auto_2137546 ?auto_2137549 ) ) ( not ( = ?auto_2137546 ?auto_2137550 ) ) ( not ( = ?auto_2137546 ?auto_2137551 ) ) ( not ( = ?auto_2137546 ?auto_2137552 ) ) ( not ( = ?auto_2137546 ?auto_2137558 ) ) ( not ( = ?auto_2137547 ?auto_2137548 ) ) ( not ( = ?auto_2137547 ?auto_2137549 ) ) ( not ( = ?auto_2137547 ?auto_2137550 ) ) ( not ( = ?auto_2137547 ?auto_2137551 ) ) ( not ( = ?auto_2137547 ?auto_2137552 ) ) ( not ( = ?auto_2137547 ?auto_2137558 ) ) ( not ( = ?auto_2137548 ?auto_2137549 ) ) ( not ( = ?auto_2137548 ?auto_2137550 ) ) ( not ( = ?auto_2137548 ?auto_2137551 ) ) ( not ( = ?auto_2137548 ?auto_2137552 ) ) ( not ( = ?auto_2137548 ?auto_2137558 ) ) ( not ( = ?auto_2137549 ?auto_2137550 ) ) ( not ( = ?auto_2137549 ?auto_2137551 ) ) ( not ( = ?auto_2137549 ?auto_2137552 ) ) ( not ( = ?auto_2137549 ?auto_2137558 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2137550 ?auto_2137551 ?auto_2137552 )
      ( MAKE-8CRATE-VERIFY ?auto_2137544 ?auto_2137545 ?auto_2137546 ?auto_2137547 ?auto_2137548 ?auto_2137549 ?auto_2137550 ?auto_2137551 ?auto_2137552 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141660 - SURFACE
      ?auto_2141661 - SURFACE
      ?auto_2141662 - SURFACE
      ?auto_2141663 - SURFACE
      ?auto_2141664 - SURFACE
      ?auto_2141665 - SURFACE
      ?auto_2141666 - SURFACE
      ?auto_2141667 - SURFACE
      ?auto_2141668 - SURFACE
      ?auto_2141669 - SURFACE
    )
    :vars
    (
      ?auto_2141671 - HOIST
      ?auto_2141670 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141671 ?auto_2141670 ) ( SURFACE-AT ?auto_2141668 ?auto_2141670 ) ( CLEAR ?auto_2141668 ) ( LIFTING ?auto_2141671 ?auto_2141669 ) ( IS-CRATE ?auto_2141669 ) ( not ( = ?auto_2141668 ?auto_2141669 ) ) ( ON ?auto_2141661 ?auto_2141660 ) ( ON ?auto_2141662 ?auto_2141661 ) ( ON ?auto_2141663 ?auto_2141662 ) ( ON ?auto_2141664 ?auto_2141663 ) ( ON ?auto_2141665 ?auto_2141664 ) ( ON ?auto_2141666 ?auto_2141665 ) ( ON ?auto_2141667 ?auto_2141666 ) ( ON ?auto_2141668 ?auto_2141667 ) ( not ( = ?auto_2141660 ?auto_2141661 ) ) ( not ( = ?auto_2141660 ?auto_2141662 ) ) ( not ( = ?auto_2141660 ?auto_2141663 ) ) ( not ( = ?auto_2141660 ?auto_2141664 ) ) ( not ( = ?auto_2141660 ?auto_2141665 ) ) ( not ( = ?auto_2141660 ?auto_2141666 ) ) ( not ( = ?auto_2141660 ?auto_2141667 ) ) ( not ( = ?auto_2141660 ?auto_2141668 ) ) ( not ( = ?auto_2141660 ?auto_2141669 ) ) ( not ( = ?auto_2141661 ?auto_2141662 ) ) ( not ( = ?auto_2141661 ?auto_2141663 ) ) ( not ( = ?auto_2141661 ?auto_2141664 ) ) ( not ( = ?auto_2141661 ?auto_2141665 ) ) ( not ( = ?auto_2141661 ?auto_2141666 ) ) ( not ( = ?auto_2141661 ?auto_2141667 ) ) ( not ( = ?auto_2141661 ?auto_2141668 ) ) ( not ( = ?auto_2141661 ?auto_2141669 ) ) ( not ( = ?auto_2141662 ?auto_2141663 ) ) ( not ( = ?auto_2141662 ?auto_2141664 ) ) ( not ( = ?auto_2141662 ?auto_2141665 ) ) ( not ( = ?auto_2141662 ?auto_2141666 ) ) ( not ( = ?auto_2141662 ?auto_2141667 ) ) ( not ( = ?auto_2141662 ?auto_2141668 ) ) ( not ( = ?auto_2141662 ?auto_2141669 ) ) ( not ( = ?auto_2141663 ?auto_2141664 ) ) ( not ( = ?auto_2141663 ?auto_2141665 ) ) ( not ( = ?auto_2141663 ?auto_2141666 ) ) ( not ( = ?auto_2141663 ?auto_2141667 ) ) ( not ( = ?auto_2141663 ?auto_2141668 ) ) ( not ( = ?auto_2141663 ?auto_2141669 ) ) ( not ( = ?auto_2141664 ?auto_2141665 ) ) ( not ( = ?auto_2141664 ?auto_2141666 ) ) ( not ( = ?auto_2141664 ?auto_2141667 ) ) ( not ( = ?auto_2141664 ?auto_2141668 ) ) ( not ( = ?auto_2141664 ?auto_2141669 ) ) ( not ( = ?auto_2141665 ?auto_2141666 ) ) ( not ( = ?auto_2141665 ?auto_2141667 ) ) ( not ( = ?auto_2141665 ?auto_2141668 ) ) ( not ( = ?auto_2141665 ?auto_2141669 ) ) ( not ( = ?auto_2141666 ?auto_2141667 ) ) ( not ( = ?auto_2141666 ?auto_2141668 ) ) ( not ( = ?auto_2141666 ?auto_2141669 ) ) ( not ( = ?auto_2141667 ?auto_2141668 ) ) ( not ( = ?auto_2141667 ?auto_2141669 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2141668 ?auto_2141669 )
      ( MAKE-9CRATE-VERIFY ?auto_2141660 ?auto_2141661 ?auto_2141662 ?auto_2141663 ?auto_2141664 ?auto_2141665 ?auto_2141666 ?auto_2141667 ?auto_2141668 ?auto_2141669 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141740 - SURFACE
      ?auto_2141741 - SURFACE
      ?auto_2141742 - SURFACE
      ?auto_2141743 - SURFACE
      ?auto_2141744 - SURFACE
      ?auto_2141745 - SURFACE
      ?auto_2141746 - SURFACE
      ?auto_2141747 - SURFACE
      ?auto_2141748 - SURFACE
      ?auto_2141749 - SURFACE
    )
    :vars
    (
      ?auto_2141751 - HOIST
      ?auto_2141750 - PLACE
      ?auto_2141752 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141751 ?auto_2141750 ) ( SURFACE-AT ?auto_2141748 ?auto_2141750 ) ( CLEAR ?auto_2141748 ) ( IS-CRATE ?auto_2141749 ) ( not ( = ?auto_2141748 ?auto_2141749 ) ) ( TRUCK-AT ?auto_2141752 ?auto_2141750 ) ( AVAILABLE ?auto_2141751 ) ( IN ?auto_2141749 ?auto_2141752 ) ( ON ?auto_2141748 ?auto_2141747 ) ( not ( = ?auto_2141747 ?auto_2141748 ) ) ( not ( = ?auto_2141747 ?auto_2141749 ) ) ( ON ?auto_2141741 ?auto_2141740 ) ( ON ?auto_2141742 ?auto_2141741 ) ( ON ?auto_2141743 ?auto_2141742 ) ( ON ?auto_2141744 ?auto_2141743 ) ( ON ?auto_2141745 ?auto_2141744 ) ( ON ?auto_2141746 ?auto_2141745 ) ( ON ?auto_2141747 ?auto_2141746 ) ( not ( = ?auto_2141740 ?auto_2141741 ) ) ( not ( = ?auto_2141740 ?auto_2141742 ) ) ( not ( = ?auto_2141740 ?auto_2141743 ) ) ( not ( = ?auto_2141740 ?auto_2141744 ) ) ( not ( = ?auto_2141740 ?auto_2141745 ) ) ( not ( = ?auto_2141740 ?auto_2141746 ) ) ( not ( = ?auto_2141740 ?auto_2141747 ) ) ( not ( = ?auto_2141740 ?auto_2141748 ) ) ( not ( = ?auto_2141740 ?auto_2141749 ) ) ( not ( = ?auto_2141741 ?auto_2141742 ) ) ( not ( = ?auto_2141741 ?auto_2141743 ) ) ( not ( = ?auto_2141741 ?auto_2141744 ) ) ( not ( = ?auto_2141741 ?auto_2141745 ) ) ( not ( = ?auto_2141741 ?auto_2141746 ) ) ( not ( = ?auto_2141741 ?auto_2141747 ) ) ( not ( = ?auto_2141741 ?auto_2141748 ) ) ( not ( = ?auto_2141741 ?auto_2141749 ) ) ( not ( = ?auto_2141742 ?auto_2141743 ) ) ( not ( = ?auto_2141742 ?auto_2141744 ) ) ( not ( = ?auto_2141742 ?auto_2141745 ) ) ( not ( = ?auto_2141742 ?auto_2141746 ) ) ( not ( = ?auto_2141742 ?auto_2141747 ) ) ( not ( = ?auto_2141742 ?auto_2141748 ) ) ( not ( = ?auto_2141742 ?auto_2141749 ) ) ( not ( = ?auto_2141743 ?auto_2141744 ) ) ( not ( = ?auto_2141743 ?auto_2141745 ) ) ( not ( = ?auto_2141743 ?auto_2141746 ) ) ( not ( = ?auto_2141743 ?auto_2141747 ) ) ( not ( = ?auto_2141743 ?auto_2141748 ) ) ( not ( = ?auto_2141743 ?auto_2141749 ) ) ( not ( = ?auto_2141744 ?auto_2141745 ) ) ( not ( = ?auto_2141744 ?auto_2141746 ) ) ( not ( = ?auto_2141744 ?auto_2141747 ) ) ( not ( = ?auto_2141744 ?auto_2141748 ) ) ( not ( = ?auto_2141744 ?auto_2141749 ) ) ( not ( = ?auto_2141745 ?auto_2141746 ) ) ( not ( = ?auto_2141745 ?auto_2141747 ) ) ( not ( = ?auto_2141745 ?auto_2141748 ) ) ( not ( = ?auto_2141745 ?auto_2141749 ) ) ( not ( = ?auto_2141746 ?auto_2141747 ) ) ( not ( = ?auto_2141746 ?auto_2141748 ) ) ( not ( = ?auto_2141746 ?auto_2141749 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141747 ?auto_2141748 ?auto_2141749 )
      ( MAKE-9CRATE-VERIFY ?auto_2141740 ?auto_2141741 ?auto_2141742 ?auto_2141743 ?auto_2141744 ?auto_2141745 ?auto_2141746 ?auto_2141747 ?auto_2141748 ?auto_2141749 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141830 - SURFACE
      ?auto_2141831 - SURFACE
      ?auto_2141832 - SURFACE
      ?auto_2141833 - SURFACE
      ?auto_2141834 - SURFACE
      ?auto_2141835 - SURFACE
      ?auto_2141836 - SURFACE
      ?auto_2141837 - SURFACE
      ?auto_2141838 - SURFACE
      ?auto_2141839 - SURFACE
    )
    :vars
    (
      ?auto_2141842 - HOIST
      ?auto_2141843 - PLACE
      ?auto_2141841 - TRUCK
      ?auto_2141840 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141842 ?auto_2141843 ) ( SURFACE-AT ?auto_2141838 ?auto_2141843 ) ( CLEAR ?auto_2141838 ) ( IS-CRATE ?auto_2141839 ) ( not ( = ?auto_2141838 ?auto_2141839 ) ) ( AVAILABLE ?auto_2141842 ) ( IN ?auto_2141839 ?auto_2141841 ) ( ON ?auto_2141838 ?auto_2141837 ) ( not ( = ?auto_2141837 ?auto_2141838 ) ) ( not ( = ?auto_2141837 ?auto_2141839 ) ) ( TRUCK-AT ?auto_2141841 ?auto_2141840 ) ( not ( = ?auto_2141840 ?auto_2141843 ) ) ( ON ?auto_2141831 ?auto_2141830 ) ( ON ?auto_2141832 ?auto_2141831 ) ( ON ?auto_2141833 ?auto_2141832 ) ( ON ?auto_2141834 ?auto_2141833 ) ( ON ?auto_2141835 ?auto_2141834 ) ( ON ?auto_2141836 ?auto_2141835 ) ( ON ?auto_2141837 ?auto_2141836 ) ( not ( = ?auto_2141830 ?auto_2141831 ) ) ( not ( = ?auto_2141830 ?auto_2141832 ) ) ( not ( = ?auto_2141830 ?auto_2141833 ) ) ( not ( = ?auto_2141830 ?auto_2141834 ) ) ( not ( = ?auto_2141830 ?auto_2141835 ) ) ( not ( = ?auto_2141830 ?auto_2141836 ) ) ( not ( = ?auto_2141830 ?auto_2141837 ) ) ( not ( = ?auto_2141830 ?auto_2141838 ) ) ( not ( = ?auto_2141830 ?auto_2141839 ) ) ( not ( = ?auto_2141831 ?auto_2141832 ) ) ( not ( = ?auto_2141831 ?auto_2141833 ) ) ( not ( = ?auto_2141831 ?auto_2141834 ) ) ( not ( = ?auto_2141831 ?auto_2141835 ) ) ( not ( = ?auto_2141831 ?auto_2141836 ) ) ( not ( = ?auto_2141831 ?auto_2141837 ) ) ( not ( = ?auto_2141831 ?auto_2141838 ) ) ( not ( = ?auto_2141831 ?auto_2141839 ) ) ( not ( = ?auto_2141832 ?auto_2141833 ) ) ( not ( = ?auto_2141832 ?auto_2141834 ) ) ( not ( = ?auto_2141832 ?auto_2141835 ) ) ( not ( = ?auto_2141832 ?auto_2141836 ) ) ( not ( = ?auto_2141832 ?auto_2141837 ) ) ( not ( = ?auto_2141832 ?auto_2141838 ) ) ( not ( = ?auto_2141832 ?auto_2141839 ) ) ( not ( = ?auto_2141833 ?auto_2141834 ) ) ( not ( = ?auto_2141833 ?auto_2141835 ) ) ( not ( = ?auto_2141833 ?auto_2141836 ) ) ( not ( = ?auto_2141833 ?auto_2141837 ) ) ( not ( = ?auto_2141833 ?auto_2141838 ) ) ( not ( = ?auto_2141833 ?auto_2141839 ) ) ( not ( = ?auto_2141834 ?auto_2141835 ) ) ( not ( = ?auto_2141834 ?auto_2141836 ) ) ( not ( = ?auto_2141834 ?auto_2141837 ) ) ( not ( = ?auto_2141834 ?auto_2141838 ) ) ( not ( = ?auto_2141834 ?auto_2141839 ) ) ( not ( = ?auto_2141835 ?auto_2141836 ) ) ( not ( = ?auto_2141835 ?auto_2141837 ) ) ( not ( = ?auto_2141835 ?auto_2141838 ) ) ( not ( = ?auto_2141835 ?auto_2141839 ) ) ( not ( = ?auto_2141836 ?auto_2141837 ) ) ( not ( = ?auto_2141836 ?auto_2141838 ) ) ( not ( = ?auto_2141836 ?auto_2141839 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141837 ?auto_2141838 ?auto_2141839 )
      ( MAKE-9CRATE-VERIFY ?auto_2141830 ?auto_2141831 ?auto_2141832 ?auto_2141833 ?auto_2141834 ?auto_2141835 ?auto_2141836 ?auto_2141837 ?auto_2141838 ?auto_2141839 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2141929 - SURFACE
      ?auto_2141930 - SURFACE
      ?auto_2141931 - SURFACE
      ?auto_2141932 - SURFACE
      ?auto_2141933 - SURFACE
      ?auto_2141934 - SURFACE
      ?auto_2141935 - SURFACE
      ?auto_2141936 - SURFACE
      ?auto_2141937 - SURFACE
      ?auto_2141938 - SURFACE
    )
    :vars
    (
      ?auto_2141942 - HOIST
      ?auto_2141943 - PLACE
      ?auto_2141940 - TRUCK
      ?auto_2141941 - PLACE
      ?auto_2141939 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2141942 ?auto_2141943 ) ( SURFACE-AT ?auto_2141937 ?auto_2141943 ) ( CLEAR ?auto_2141937 ) ( IS-CRATE ?auto_2141938 ) ( not ( = ?auto_2141937 ?auto_2141938 ) ) ( AVAILABLE ?auto_2141942 ) ( ON ?auto_2141937 ?auto_2141936 ) ( not ( = ?auto_2141936 ?auto_2141937 ) ) ( not ( = ?auto_2141936 ?auto_2141938 ) ) ( TRUCK-AT ?auto_2141940 ?auto_2141941 ) ( not ( = ?auto_2141941 ?auto_2141943 ) ) ( HOIST-AT ?auto_2141939 ?auto_2141941 ) ( LIFTING ?auto_2141939 ?auto_2141938 ) ( not ( = ?auto_2141942 ?auto_2141939 ) ) ( ON ?auto_2141930 ?auto_2141929 ) ( ON ?auto_2141931 ?auto_2141930 ) ( ON ?auto_2141932 ?auto_2141931 ) ( ON ?auto_2141933 ?auto_2141932 ) ( ON ?auto_2141934 ?auto_2141933 ) ( ON ?auto_2141935 ?auto_2141934 ) ( ON ?auto_2141936 ?auto_2141935 ) ( not ( = ?auto_2141929 ?auto_2141930 ) ) ( not ( = ?auto_2141929 ?auto_2141931 ) ) ( not ( = ?auto_2141929 ?auto_2141932 ) ) ( not ( = ?auto_2141929 ?auto_2141933 ) ) ( not ( = ?auto_2141929 ?auto_2141934 ) ) ( not ( = ?auto_2141929 ?auto_2141935 ) ) ( not ( = ?auto_2141929 ?auto_2141936 ) ) ( not ( = ?auto_2141929 ?auto_2141937 ) ) ( not ( = ?auto_2141929 ?auto_2141938 ) ) ( not ( = ?auto_2141930 ?auto_2141931 ) ) ( not ( = ?auto_2141930 ?auto_2141932 ) ) ( not ( = ?auto_2141930 ?auto_2141933 ) ) ( not ( = ?auto_2141930 ?auto_2141934 ) ) ( not ( = ?auto_2141930 ?auto_2141935 ) ) ( not ( = ?auto_2141930 ?auto_2141936 ) ) ( not ( = ?auto_2141930 ?auto_2141937 ) ) ( not ( = ?auto_2141930 ?auto_2141938 ) ) ( not ( = ?auto_2141931 ?auto_2141932 ) ) ( not ( = ?auto_2141931 ?auto_2141933 ) ) ( not ( = ?auto_2141931 ?auto_2141934 ) ) ( not ( = ?auto_2141931 ?auto_2141935 ) ) ( not ( = ?auto_2141931 ?auto_2141936 ) ) ( not ( = ?auto_2141931 ?auto_2141937 ) ) ( not ( = ?auto_2141931 ?auto_2141938 ) ) ( not ( = ?auto_2141932 ?auto_2141933 ) ) ( not ( = ?auto_2141932 ?auto_2141934 ) ) ( not ( = ?auto_2141932 ?auto_2141935 ) ) ( not ( = ?auto_2141932 ?auto_2141936 ) ) ( not ( = ?auto_2141932 ?auto_2141937 ) ) ( not ( = ?auto_2141932 ?auto_2141938 ) ) ( not ( = ?auto_2141933 ?auto_2141934 ) ) ( not ( = ?auto_2141933 ?auto_2141935 ) ) ( not ( = ?auto_2141933 ?auto_2141936 ) ) ( not ( = ?auto_2141933 ?auto_2141937 ) ) ( not ( = ?auto_2141933 ?auto_2141938 ) ) ( not ( = ?auto_2141934 ?auto_2141935 ) ) ( not ( = ?auto_2141934 ?auto_2141936 ) ) ( not ( = ?auto_2141934 ?auto_2141937 ) ) ( not ( = ?auto_2141934 ?auto_2141938 ) ) ( not ( = ?auto_2141935 ?auto_2141936 ) ) ( not ( = ?auto_2141935 ?auto_2141937 ) ) ( not ( = ?auto_2141935 ?auto_2141938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2141936 ?auto_2141937 ?auto_2141938 )
      ( MAKE-9CRATE-VERIFY ?auto_2141929 ?auto_2141930 ?auto_2141931 ?auto_2141932 ?auto_2141933 ?auto_2141934 ?auto_2141935 ?auto_2141936 ?auto_2141937 ?auto_2141938 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142037 - SURFACE
      ?auto_2142038 - SURFACE
      ?auto_2142039 - SURFACE
      ?auto_2142040 - SURFACE
      ?auto_2142041 - SURFACE
      ?auto_2142042 - SURFACE
      ?auto_2142043 - SURFACE
      ?auto_2142044 - SURFACE
      ?auto_2142045 - SURFACE
      ?auto_2142046 - SURFACE
    )
    :vars
    (
      ?auto_2142049 - HOIST
      ?auto_2142050 - PLACE
      ?auto_2142048 - TRUCK
      ?auto_2142047 - PLACE
      ?auto_2142052 - HOIST
      ?auto_2142051 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142049 ?auto_2142050 ) ( SURFACE-AT ?auto_2142045 ?auto_2142050 ) ( CLEAR ?auto_2142045 ) ( IS-CRATE ?auto_2142046 ) ( not ( = ?auto_2142045 ?auto_2142046 ) ) ( AVAILABLE ?auto_2142049 ) ( ON ?auto_2142045 ?auto_2142044 ) ( not ( = ?auto_2142044 ?auto_2142045 ) ) ( not ( = ?auto_2142044 ?auto_2142046 ) ) ( TRUCK-AT ?auto_2142048 ?auto_2142047 ) ( not ( = ?auto_2142047 ?auto_2142050 ) ) ( HOIST-AT ?auto_2142052 ?auto_2142047 ) ( not ( = ?auto_2142049 ?auto_2142052 ) ) ( AVAILABLE ?auto_2142052 ) ( SURFACE-AT ?auto_2142046 ?auto_2142047 ) ( ON ?auto_2142046 ?auto_2142051 ) ( CLEAR ?auto_2142046 ) ( not ( = ?auto_2142045 ?auto_2142051 ) ) ( not ( = ?auto_2142046 ?auto_2142051 ) ) ( not ( = ?auto_2142044 ?auto_2142051 ) ) ( ON ?auto_2142038 ?auto_2142037 ) ( ON ?auto_2142039 ?auto_2142038 ) ( ON ?auto_2142040 ?auto_2142039 ) ( ON ?auto_2142041 ?auto_2142040 ) ( ON ?auto_2142042 ?auto_2142041 ) ( ON ?auto_2142043 ?auto_2142042 ) ( ON ?auto_2142044 ?auto_2142043 ) ( not ( = ?auto_2142037 ?auto_2142038 ) ) ( not ( = ?auto_2142037 ?auto_2142039 ) ) ( not ( = ?auto_2142037 ?auto_2142040 ) ) ( not ( = ?auto_2142037 ?auto_2142041 ) ) ( not ( = ?auto_2142037 ?auto_2142042 ) ) ( not ( = ?auto_2142037 ?auto_2142043 ) ) ( not ( = ?auto_2142037 ?auto_2142044 ) ) ( not ( = ?auto_2142037 ?auto_2142045 ) ) ( not ( = ?auto_2142037 ?auto_2142046 ) ) ( not ( = ?auto_2142037 ?auto_2142051 ) ) ( not ( = ?auto_2142038 ?auto_2142039 ) ) ( not ( = ?auto_2142038 ?auto_2142040 ) ) ( not ( = ?auto_2142038 ?auto_2142041 ) ) ( not ( = ?auto_2142038 ?auto_2142042 ) ) ( not ( = ?auto_2142038 ?auto_2142043 ) ) ( not ( = ?auto_2142038 ?auto_2142044 ) ) ( not ( = ?auto_2142038 ?auto_2142045 ) ) ( not ( = ?auto_2142038 ?auto_2142046 ) ) ( not ( = ?auto_2142038 ?auto_2142051 ) ) ( not ( = ?auto_2142039 ?auto_2142040 ) ) ( not ( = ?auto_2142039 ?auto_2142041 ) ) ( not ( = ?auto_2142039 ?auto_2142042 ) ) ( not ( = ?auto_2142039 ?auto_2142043 ) ) ( not ( = ?auto_2142039 ?auto_2142044 ) ) ( not ( = ?auto_2142039 ?auto_2142045 ) ) ( not ( = ?auto_2142039 ?auto_2142046 ) ) ( not ( = ?auto_2142039 ?auto_2142051 ) ) ( not ( = ?auto_2142040 ?auto_2142041 ) ) ( not ( = ?auto_2142040 ?auto_2142042 ) ) ( not ( = ?auto_2142040 ?auto_2142043 ) ) ( not ( = ?auto_2142040 ?auto_2142044 ) ) ( not ( = ?auto_2142040 ?auto_2142045 ) ) ( not ( = ?auto_2142040 ?auto_2142046 ) ) ( not ( = ?auto_2142040 ?auto_2142051 ) ) ( not ( = ?auto_2142041 ?auto_2142042 ) ) ( not ( = ?auto_2142041 ?auto_2142043 ) ) ( not ( = ?auto_2142041 ?auto_2142044 ) ) ( not ( = ?auto_2142041 ?auto_2142045 ) ) ( not ( = ?auto_2142041 ?auto_2142046 ) ) ( not ( = ?auto_2142041 ?auto_2142051 ) ) ( not ( = ?auto_2142042 ?auto_2142043 ) ) ( not ( = ?auto_2142042 ?auto_2142044 ) ) ( not ( = ?auto_2142042 ?auto_2142045 ) ) ( not ( = ?auto_2142042 ?auto_2142046 ) ) ( not ( = ?auto_2142042 ?auto_2142051 ) ) ( not ( = ?auto_2142043 ?auto_2142044 ) ) ( not ( = ?auto_2142043 ?auto_2142045 ) ) ( not ( = ?auto_2142043 ?auto_2142046 ) ) ( not ( = ?auto_2142043 ?auto_2142051 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142044 ?auto_2142045 ?auto_2142046 )
      ( MAKE-9CRATE-VERIFY ?auto_2142037 ?auto_2142038 ?auto_2142039 ?auto_2142040 ?auto_2142041 ?auto_2142042 ?auto_2142043 ?auto_2142044 ?auto_2142045 ?auto_2142046 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142146 - SURFACE
      ?auto_2142147 - SURFACE
      ?auto_2142148 - SURFACE
      ?auto_2142149 - SURFACE
      ?auto_2142150 - SURFACE
      ?auto_2142151 - SURFACE
      ?auto_2142152 - SURFACE
      ?auto_2142153 - SURFACE
      ?auto_2142154 - SURFACE
      ?auto_2142155 - SURFACE
    )
    :vars
    (
      ?auto_2142157 - HOIST
      ?auto_2142161 - PLACE
      ?auto_2142160 - PLACE
      ?auto_2142156 - HOIST
      ?auto_2142159 - SURFACE
      ?auto_2142158 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142157 ?auto_2142161 ) ( SURFACE-AT ?auto_2142154 ?auto_2142161 ) ( CLEAR ?auto_2142154 ) ( IS-CRATE ?auto_2142155 ) ( not ( = ?auto_2142154 ?auto_2142155 ) ) ( AVAILABLE ?auto_2142157 ) ( ON ?auto_2142154 ?auto_2142153 ) ( not ( = ?auto_2142153 ?auto_2142154 ) ) ( not ( = ?auto_2142153 ?auto_2142155 ) ) ( not ( = ?auto_2142160 ?auto_2142161 ) ) ( HOIST-AT ?auto_2142156 ?auto_2142160 ) ( not ( = ?auto_2142157 ?auto_2142156 ) ) ( AVAILABLE ?auto_2142156 ) ( SURFACE-AT ?auto_2142155 ?auto_2142160 ) ( ON ?auto_2142155 ?auto_2142159 ) ( CLEAR ?auto_2142155 ) ( not ( = ?auto_2142154 ?auto_2142159 ) ) ( not ( = ?auto_2142155 ?auto_2142159 ) ) ( not ( = ?auto_2142153 ?auto_2142159 ) ) ( TRUCK-AT ?auto_2142158 ?auto_2142161 ) ( ON ?auto_2142147 ?auto_2142146 ) ( ON ?auto_2142148 ?auto_2142147 ) ( ON ?auto_2142149 ?auto_2142148 ) ( ON ?auto_2142150 ?auto_2142149 ) ( ON ?auto_2142151 ?auto_2142150 ) ( ON ?auto_2142152 ?auto_2142151 ) ( ON ?auto_2142153 ?auto_2142152 ) ( not ( = ?auto_2142146 ?auto_2142147 ) ) ( not ( = ?auto_2142146 ?auto_2142148 ) ) ( not ( = ?auto_2142146 ?auto_2142149 ) ) ( not ( = ?auto_2142146 ?auto_2142150 ) ) ( not ( = ?auto_2142146 ?auto_2142151 ) ) ( not ( = ?auto_2142146 ?auto_2142152 ) ) ( not ( = ?auto_2142146 ?auto_2142153 ) ) ( not ( = ?auto_2142146 ?auto_2142154 ) ) ( not ( = ?auto_2142146 ?auto_2142155 ) ) ( not ( = ?auto_2142146 ?auto_2142159 ) ) ( not ( = ?auto_2142147 ?auto_2142148 ) ) ( not ( = ?auto_2142147 ?auto_2142149 ) ) ( not ( = ?auto_2142147 ?auto_2142150 ) ) ( not ( = ?auto_2142147 ?auto_2142151 ) ) ( not ( = ?auto_2142147 ?auto_2142152 ) ) ( not ( = ?auto_2142147 ?auto_2142153 ) ) ( not ( = ?auto_2142147 ?auto_2142154 ) ) ( not ( = ?auto_2142147 ?auto_2142155 ) ) ( not ( = ?auto_2142147 ?auto_2142159 ) ) ( not ( = ?auto_2142148 ?auto_2142149 ) ) ( not ( = ?auto_2142148 ?auto_2142150 ) ) ( not ( = ?auto_2142148 ?auto_2142151 ) ) ( not ( = ?auto_2142148 ?auto_2142152 ) ) ( not ( = ?auto_2142148 ?auto_2142153 ) ) ( not ( = ?auto_2142148 ?auto_2142154 ) ) ( not ( = ?auto_2142148 ?auto_2142155 ) ) ( not ( = ?auto_2142148 ?auto_2142159 ) ) ( not ( = ?auto_2142149 ?auto_2142150 ) ) ( not ( = ?auto_2142149 ?auto_2142151 ) ) ( not ( = ?auto_2142149 ?auto_2142152 ) ) ( not ( = ?auto_2142149 ?auto_2142153 ) ) ( not ( = ?auto_2142149 ?auto_2142154 ) ) ( not ( = ?auto_2142149 ?auto_2142155 ) ) ( not ( = ?auto_2142149 ?auto_2142159 ) ) ( not ( = ?auto_2142150 ?auto_2142151 ) ) ( not ( = ?auto_2142150 ?auto_2142152 ) ) ( not ( = ?auto_2142150 ?auto_2142153 ) ) ( not ( = ?auto_2142150 ?auto_2142154 ) ) ( not ( = ?auto_2142150 ?auto_2142155 ) ) ( not ( = ?auto_2142150 ?auto_2142159 ) ) ( not ( = ?auto_2142151 ?auto_2142152 ) ) ( not ( = ?auto_2142151 ?auto_2142153 ) ) ( not ( = ?auto_2142151 ?auto_2142154 ) ) ( not ( = ?auto_2142151 ?auto_2142155 ) ) ( not ( = ?auto_2142151 ?auto_2142159 ) ) ( not ( = ?auto_2142152 ?auto_2142153 ) ) ( not ( = ?auto_2142152 ?auto_2142154 ) ) ( not ( = ?auto_2142152 ?auto_2142155 ) ) ( not ( = ?auto_2142152 ?auto_2142159 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142153 ?auto_2142154 ?auto_2142155 )
      ( MAKE-9CRATE-VERIFY ?auto_2142146 ?auto_2142147 ?auto_2142148 ?auto_2142149 ?auto_2142150 ?auto_2142151 ?auto_2142152 ?auto_2142153 ?auto_2142154 ?auto_2142155 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142255 - SURFACE
      ?auto_2142256 - SURFACE
      ?auto_2142257 - SURFACE
      ?auto_2142258 - SURFACE
      ?auto_2142259 - SURFACE
      ?auto_2142260 - SURFACE
      ?auto_2142261 - SURFACE
      ?auto_2142262 - SURFACE
      ?auto_2142263 - SURFACE
      ?auto_2142264 - SURFACE
    )
    :vars
    (
      ?auto_2142270 - HOIST
      ?auto_2142268 - PLACE
      ?auto_2142266 - PLACE
      ?auto_2142267 - HOIST
      ?auto_2142265 - SURFACE
      ?auto_2142269 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142270 ?auto_2142268 ) ( IS-CRATE ?auto_2142264 ) ( not ( = ?auto_2142263 ?auto_2142264 ) ) ( not ( = ?auto_2142262 ?auto_2142263 ) ) ( not ( = ?auto_2142262 ?auto_2142264 ) ) ( not ( = ?auto_2142266 ?auto_2142268 ) ) ( HOIST-AT ?auto_2142267 ?auto_2142266 ) ( not ( = ?auto_2142270 ?auto_2142267 ) ) ( AVAILABLE ?auto_2142267 ) ( SURFACE-AT ?auto_2142264 ?auto_2142266 ) ( ON ?auto_2142264 ?auto_2142265 ) ( CLEAR ?auto_2142264 ) ( not ( = ?auto_2142263 ?auto_2142265 ) ) ( not ( = ?auto_2142264 ?auto_2142265 ) ) ( not ( = ?auto_2142262 ?auto_2142265 ) ) ( TRUCK-AT ?auto_2142269 ?auto_2142268 ) ( SURFACE-AT ?auto_2142262 ?auto_2142268 ) ( CLEAR ?auto_2142262 ) ( LIFTING ?auto_2142270 ?auto_2142263 ) ( IS-CRATE ?auto_2142263 ) ( ON ?auto_2142256 ?auto_2142255 ) ( ON ?auto_2142257 ?auto_2142256 ) ( ON ?auto_2142258 ?auto_2142257 ) ( ON ?auto_2142259 ?auto_2142258 ) ( ON ?auto_2142260 ?auto_2142259 ) ( ON ?auto_2142261 ?auto_2142260 ) ( ON ?auto_2142262 ?auto_2142261 ) ( not ( = ?auto_2142255 ?auto_2142256 ) ) ( not ( = ?auto_2142255 ?auto_2142257 ) ) ( not ( = ?auto_2142255 ?auto_2142258 ) ) ( not ( = ?auto_2142255 ?auto_2142259 ) ) ( not ( = ?auto_2142255 ?auto_2142260 ) ) ( not ( = ?auto_2142255 ?auto_2142261 ) ) ( not ( = ?auto_2142255 ?auto_2142262 ) ) ( not ( = ?auto_2142255 ?auto_2142263 ) ) ( not ( = ?auto_2142255 ?auto_2142264 ) ) ( not ( = ?auto_2142255 ?auto_2142265 ) ) ( not ( = ?auto_2142256 ?auto_2142257 ) ) ( not ( = ?auto_2142256 ?auto_2142258 ) ) ( not ( = ?auto_2142256 ?auto_2142259 ) ) ( not ( = ?auto_2142256 ?auto_2142260 ) ) ( not ( = ?auto_2142256 ?auto_2142261 ) ) ( not ( = ?auto_2142256 ?auto_2142262 ) ) ( not ( = ?auto_2142256 ?auto_2142263 ) ) ( not ( = ?auto_2142256 ?auto_2142264 ) ) ( not ( = ?auto_2142256 ?auto_2142265 ) ) ( not ( = ?auto_2142257 ?auto_2142258 ) ) ( not ( = ?auto_2142257 ?auto_2142259 ) ) ( not ( = ?auto_2142257 ?auto_2142260 ) ) ( not ( = ?auto_2142257 ?auto_2142261 ) ) ( not ( = ?auto_2142257 ?auto_2142262 ) ) ( not ( = ?auto_2142257 ?auto_2142263 ) ) ( not ( = ?auto_2142257 ?auto_2142264 ) ) ( not ( = ?auto_2142257 ?auto_2142265 ) ) ( not ( = ?auto_2142258 ?auto_2142259 ) ) ( not ( = ?auto_2142258 ?auto_2142260 ) ) ( not ( = ?auto_2142258 ?auto_2142261 ) ) ( not ( = ?auto_2142258 ?auto_2142262 ) ) ( not ( = ?auto_2142258 ?auto_2142263 ) ) ( not ( = ?auto_2142258 ?auto_2142264 ) ) ( not ( = ?auto_2142258 ?auto_2142265 ) ) ( not ( = ?auto_2142259 ?auto_2142260 ) ) ( not ( = ?auto_2142259 ?auto_2142261 ) ) ( not ( = ?auto_2142259 ?auto_2142262 ) ) ( not ( = ?auto_2142259 ?auto_2142263 ) ) ( not ( = ?auto_2142259 ?auto_2142264 ) ) ( not ( = ?auto_2142259 ?auto_2142265 ) ) ( not ( = ?auto_2142260 ?auto_2142261 ) ) ( not ( = ?auto_2142260 ?auto_2142262 ) ) ( not ( = ?auto_2142260 ?auto_2142263 ) ) ( not ( = ?auto_2142260 ?auto_2142264 ) ) ( not ( = ?auto_2142260 ?auto_2142265 ) ) ( not ( = ?auto_2142261 ?auto_2142262 ) ) ( not ( = ?auto_2142261 ?auto_2142263 ) ) ( not ( = ?auto_2142261 ?auto_2142264 ) ) ( not ( = ?auto_2142261 ?auto_2142265 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142262 ?auto_2142263 ?auto_2142264 )
      ( MAKE-9CRATE-VERIFY ?auto_2142255 ?auto_2142256 ?auto_2142257 ?auto_2142258 ?auto_2142259 ?auto_2142260 ?auto_2142261 ?auto_2142262 ?auto_2142263 ?auto_2142264 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2142364 - SURFACE
      ?auto_2142365 - SURFACE
      ?auto_2142366 - SURFACE
      ?auto_2142367 - SURFACE
      ?auto_2142368 - SURFACE
      ?auto_2142369 - SURFACE
      ?auto_2142370 - SURFACE
      ?auto_2142371 - SURFACE
      ?auto_2142372 - SURFACE
      ?auto_2142373 - SURFACE
    )
    :vars
    (
      ?auto_2142378 - HOIST
      ?auto_2142376 - PLACE
      ?auto_2142375 - PLACE
      ?auto_2142377 - HOIST
      ?auto_2142379 - SURFACE
      ?auto_2142374 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2142378 ?auto_2142376 ) ( IS-CRATE ?auto_2142373 ) ( not ( = ?auto_2142372 ?auto_2142373 ) ) ( not ( = ?auto_2142371 ?auto_2142372 ) ) ( not ( = ?auto_2142371 ?auto_2142373 ) ) ( not ( = ?auto_2142375 ?auto_2142376 ) ) ( HOIST-AT ?auto_2142377 ?auto_2142375 ) ( not ( = ?auto_2142378 ?auto_2142377 ) ) ( AVAILABLE ?auto_2142377 ) ( SURFACE-AT ?auto_2142373 ?auto_2142375 ) ( ON ?auto_2142373 ?auto_2142379 ) ( CLEAR ?auto_2142373 ) ( not ( = ?auto_2142372 ?auto_2142379 ) ) ( not ( = ?auto_2142373 ?auto_2142379 ) ) ( not ( = ?auto_2142371 ?auto_2142379 ) ) ( TRUCK-AT ?auto_2142374 ?auto_2142376 ) ( SURFACE-AT ?auto_2142371 ?auto_2142376 ) ( CLEAR ?auto_2142371 ) ( IS-CRATE ?auto_2142372 ) ( AVAILABLE ?auto_2142378 ) ( IN ?auto_2142372 ?auto_2142374 ) ( ON ?auto_2142365 ?auto_2142364 ) ( ON ?auto_2142366 ?auto_2142365 ) ( ON ?auto_2142367 ?auto_2142366 ) ( ON ?auto_2142368 ?auto_2142367 ) ( ON ?auto_2142369 ?auto_2142368 ) ( ON ?auto_2142370 ?auto_2142369 ) ( ON ?auto_2142371 ?auto_2142370 ) ( not ( = ?auto_2142364 ?auto_2142365 ) ) ( not ( = ?auto_2142364 ?auto_2142366 ) ) ( not ( = ?auto_2142364 ?auto_2142367 ) ) ( not ( = ?auto_2142364 ?auto_2142368 ) ) ( not ( = ?auto_2142364 ?auto_2142369 ) ) ( not ( = ?auto_2142364 ?auto_2142370 ) ) ( not ( = ?auto_2142364 ?auto_2142371 ) ) ( not ( = ?auto_2142364 ?auto_2142372 ) ) ( not ( = ?auto_2142364 ?auto_2142373 ) ) ( not ( = ?auto_2142364 ?auto_2142379 ) ) ( not ( = ?auto_2142365 ?auto_2142366 ) ) ( not ( = ?auto_2142365 ?auto_2142367 ) ) ( not ( = ?auto_2142365 ?auto_2142368 ) ) ( not ( = ?auto_2142365 ?auto_2142369 ) ) ( not ( = ?auto_2142365 ?auto_2142370 ) ) ( not ( = ?auto_2142365 ?auto_2142371 ) ) ( not ( = ?auto_2142365 ?auto_2142372 ) ) ( not ( = ?auto_2142365 ?auto_2142373 ) ) ( not ( = ?auto_2142365 ?auto_2142379 ) ) ( not ( = ?auto_2142366 ?auto_2142367 ) ) ( not ( = ?auto_2142366 ?auto_2142368 ) ) ( not ( = ?auto_2142366 ?auto_2142369 ) ) ( not ( = ?auto_2142366 ?auto_2142370 ) ) ( not ( = ?auto_2142366 ?auto_2142371 ) ) ( not ( = ?auto_2142366 ?auto_2142372 ) ) ( not ( = ?auto_2142366 ?auto_2142373 ) ) ( not ( = ?auto_2142366 ?auto_2142379 ) ) ( not ( = ?auto_2142367 ?auto_2142368 ) ) ( not ( = ?auto_2142367 ?auto_2142369 ) ) ( not ( = ?auto_2142367 ?auto_2142370 ) ) ( not ( = ?auto_2142367 ?auto_2142371 ) ) ( not ( = ?auto_2142367 ?auto_2142372 ) ) ( not ( = ?auto_2142367 ?auto_2142373 ) ) ( not ( = ?auto_2142367 ?auto_2142379 ) ) ( not ( = ?auto_2142368 ?auto_2142369 ) ) ( not ( = ?auto_2142368 ?auto_2142370 ) ) ( not ( = ?auto_2142368 ?auto_2142371 ) ) ( not ( = ?auto_2142368 ?auto_2142372 ) ) ( not ( = ?auto_2142368 ?auto_2142373 ) ) ( not ( = ?auto_2142368 ?auto_2142379 ) ) ( not ( = ?auto_2142369 ?auto_2142370 ) ) ( not ( = ?auto_2142369 ?auto_2142371 ) ) ( not ( = ?auto_2142369 ?auto_2142372 ) ) ( not ( = ?auto_2142369 ?auto_2142373 ) ) ( not ( = ?auto_2142369 ?auto_2142379 ) ) ( not ( = ?auto_2142370 ?auto_2142371 ) ) ( not ( = ?auto_2142370 ?auto_2142372 ) ) ( not ( = ?auto_2142370 ?auto_2142373 ) ) ( not ( = ?auto_2142370 ?auto_2142379 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2142371 ?auto_2142372 ?auto_2142373 )
      ( MAKE-9CRATE-VERIFY ?auto_2142364 ?auto_2142365 ?auto_2142366 ?auto_2142367 ?auto_2142368 ?auto_2142369 ?auto_2142370 ?auto_2142371 ?auto_2142372 ?auto_2142373 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2147929 - SURFACE
      ?auto_2147930 - SURFACE
      ?auto_2147931 - SURFACE
      ?auto_2147932 - SURFACE
      ?auto_2147933 - SURFACE
      ?auto_2147934 - SURFACE
      ?auto_2147935 - SURFACE
      ?auto_2147936 - SURFACE
      ?auto_2147937 - SURFACE
      ?auto_2147938 - SURFACE
      ?auto_2147939 - SURFACE
    )
    :vars
    (
      ?auto_2147940 - HOIST
      ?auto_2147941 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2147940 ?auto_2147941 ) ( SURFACE-AT ?auto_2147938 ?auto_2147941 ) ( CLEAR ?auto_2147938 ) ( LIFTING ?auto_2147940 ?auto_2147939 ) ( IS-CRATE ?auto_2147939 ) ( not ( = ?auto_2147938 ?auto_2147939 ) ) ( ON ?auto_2147930 ?auto_2147929 ) ( ON ?auto_2147931 ?auto_2147930 ) ( ON ?auto_2147932 ?auto_2147931 ) ( ON ?auto_2147933 ?auto_2147932 ) ( ON ?auto_2147934 ?auto_2147933 ) ( ON ?auto_2147935 ?auto_2147934 ) ( ON ?auto_2147936 ?auto_2147935 ) ( ON ?auto_2147937 ?auto_2147936 ) ( ON ?auto_2147938 ?auto_2147937 ) ( not ( = ?auto_2147929 ?auto_2147930 ) ) ( not ( = ?auto_2147929 ?auto_2147931 ) ) ( not ( = ?auto_2147929 ?auto_2147932 ) ) ( not ( = ?auto_2147929 ?auto_2147933 ) ) ( not ( = ?auto_2147929 ?auto_2147934 ) ) ( not ( = ?auto_2147929 ?auto_2147935 ) ) ( not ( = ?auto_2147929 ?auto_2147936 ) ) ( not ( = ?auto_2147929 ?auto_2147937 ) ) ( not ( = ?auto_2147929 ?auto_2147938 ) ) ( not ( = ?auto_2147929 ?auto_2147939 ) ) ( not ( = ?auto_2147930 ?auto_2147931 ) ) ( not ( = ?auto_2147930 ?auto_2147932 ) ) ( not ( = ?auto_2147930 ?auto_2147933 ) ) ( not ( = ?auto_2147930 ?auto_2147934 ) ) ( not ( = ?auto_2147930 ?auto_2147935 ) ) ( not ( = ?auto_2147930 ?auto_2147936 ) ) ( not ( = ?auto_2147930 ?auto_2147937 ) ) ( not ( = ?auto_2147930 ?auto_2147938 ) ) ( not ( = ?auto_2147930 ?auto_2147939 ) ) ( not ( = ?auto_2147931 ?auto_2147932 ) ) ( not ( = ?auto_2147931 ?auto_2147933 ) ) ( not ( = ?auto_2147931 ?auto_2147934 ) ) ( not ( = ?auto_2147931 ?auto_2147935 ) ) ( not ( = ?auto_2147931 ?auto_2147936 ) ) ( not ( = ?auto_2147931 ?auto_2147937 ) ) ( not ( = ?auto_2147931 ?auto_2147938 ) ) ( not ( = ?auto_2147931 ?auto_2147939 ) ) ( not ( = ?auto_2147932 ?auto_2147933 ) ) ( not ( = ?auto_2147932 ?auto_2147934 ) ) ( not ( = ?auto_2147932 ?auto_2147935 ) ) ( not ( = ?auto_2147932 ?auto_2147936 ) ) ( not ( = ?auto_2147932 ?auto_2147937 ) ) ( not ( = ?auto_2147932 ?auto_2147938 ) ) ( not ( = ?auto_2147932 ?auto_2147939 ) ) ( not ( = ?auto_2147933 ?auto_2147934 ) ) ( not ( = ?auto_2147933 ?auto_2147935 ) ) ( not ( = ?auto_2147933 ?auto_2147936 ) ) ( not ( = ?auto_2147933 ?auto_2147937 ) ) ( not ( = ?auto_2147933 ?auto_2147938 ) ) ( not ( = ?auto_2147933 ?auto_2147939 ) ) ( not ( = ?auto_2147934 ?auto_2147935 ) ) ( not ( = ?auto_2147934 ?auto_2147936 ) ) ( not ( = ?auto_2147934 ?auto_2147937 ) ) ( not ( = ?auto_2147934 ?auto_2147938 ) ) ( not ( = ?auto_2147934 ?auto_2147939 ) ) ( not ( = ?auto_2147935 ?auto_2147936 ) ) ( not ( = ?auto_2147935 ?auto_2147937 ) ) ( not ( = ?auto_2147935 ?auto_2147938 ) ) ( not ( = ?auto_2147935 ?auto_2147939 ) ) ( not ( = ?auto_2147936 ?auto_2147937 ) ) ( not ( = ?auto_2147936 ?auto_2147938 ) ) ( not ( = ?auto_2147936 ?auto_2147939 ) ) ( not ( = ?auto_2147937 ?auto_2147938 ) ) ( not ( = ?auto_2147937 ?auto_2147939 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2147938 ?auto_2147939 )
      ( MAKE-10CRATE-VERIFY ?auto_2147929 ?auto_2147930 ?auto_2147931 ?auto_2147932 ?auto_2147933 ?auto_2147934 ?auto_2147935 ?auto_2147936 ?auto_2147937 ?auto_2147938 ?auto_2147939 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148023 - SURFACE
      ?auto_2148024 - SURFACE
      ?auto_2148025 - SURFACE
      ?auto_2148026 - SURFACE
      ?auto_2148027 - SURFACE
      ?auto_2148028 - SURFACE
      ?auto_2148029 - SURFACE
      ?auto_2148030 - SURFACE
      ?auto_2148031 - SURFACE
      ?auto_2148032 - SURFACE
      ?auto_2148033 - SURFACE
    )
    :vars
    (
      ?auto_2148034 - HOIST
      ?auto_2148036 - PLACE
      ?auto_2148035 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148034 ?auto_2148036 ) ( SURFACE-AT ?auto_2148032 ?auto_2148036 ) ( CLEAR ?auto_2148032 ) ( IS-CRATE ?auto_2148033 ) ( not ( = ?auto_2148032 ?auto_2148033 ) ) ( TRUCK-AT ?auto_2148035 ?auto_2148036 ) ( AVAILABLE ?auto_2148034 ) ( IN ?auto_2148033 ?auto_2148035 ) ( ON ?auto_2148032 ?auto_2148031 ) ( not ( = ?auto_2148031 ?auto_2148032 ) ) ( not ( = ?auto_2148031 ?auto_2148033 ) ) ( ON ?auto_2148024 ?auto_2148023 ) ( ON ?auto_2148025 ?auto_2148024 ) ( ON ?auto_2148026 ?auto_2148025 ) ( ON ?auto_2148027 ?auto_2148026 ) ( ON ?auto_2148028 ?auto_2148027 ) ( ON ?auto_2148029 ?auto_2148028 ) ( ON ?auto_2148030 ?auto_2148029 ) ( ON ?auto_2148031 ?auto_2148030 ) ( not ( = ?auto_2148023 ?auto_2148024 ) ) ( not ( = ?auto_2148023 ?auto_2148025 ) ) ( not ( = ?auto_2148023 ?auto_2148026 ) ) ( not ( = ?auto_2148023 ?auto_2148027 ) ) ( not ( = ?auto_2148023 ?auto_2148028 ) ) ( not ( = ?auto_2148023 ?auto_2148029 ) ) ( not ( = ?auto_2148023 ?auto_2148030 ) ) ( not ( = ?auto_2148023 ?auto_2148031 ) ) ( not ( = ?auto_2148023 ?auto_2148032 ) ) ( not ( = ?auto_2148023 ?auto_2148033 ) ) ( not ( = ?auto_2148024 ?auto_2148025 ) ) ( not ( = ?auto_2148024 ?auto_2148026 ) ) ( not ( = ?auto_2148024 ?auto_2148027 ) ) ( not ( = ?auto_2148024 ?auto_2148028 ) ) ( not ( = ?auto_2148024 ?auto_2148029 ) ) ( not ( = ?auto_2148024 ?auto_2148030 ) ) ( not ( = ?auto_2148024 ?auto_2148031 ) ) ( not ( = ?auto_2148024 ?auto_2148032 ) ) ( not ( = ?auto_2148024 ?auto_2148033 ) ) ( not ( = ?auto_2148025 ?auto_2148026 ) ) ( not ( = ?auto_2148025 ?auto_2148027 ) ) ( not ( = ?auto_2148025 ?auto_2148028 ) ) ( not ( = ?auto_2148025 ?auto_2148029 ) ) ( not ( = ?auto_2148025 ?auto_2148030 ) ) ( not ( = ?auto_2148025 ?auto_2148031 ) ) ( not ( = ?auto_2148025 ?auto_2148032 ) ) ( not ( = ?auto_2148025 ?auto_2148033 ) ) ( not ( = ?auto_2148026 ?auto_2148027 ) ) ( not ( = ?auto_2148026 ?auto_2148028 ) ) ( not ( = ?auto_2148026 ?auto_2148029 ) ) ( not ( = ?auto_2148026 ?auto_2148030 ) ) ( not ( = ?auto_2148026 ?auto_2148031 ) ) ( not ( = ?auto_2148026 ?auto_2148032 ) ) ( not ( = ?auto_2148026 ?auto_2148033 ) ) ( not ( = ?auto_2148027 ?auto_2148028 ) ) ( not ( = ?auto_2148027 ?auto_2148029 ) ) ( not ( = ?auto_2148027 ?auto_2148030 ) ) ( not ( = ?auto_2148027 ?auto_2148031 ) ) ( not ( = ?auto_2148027 ?auto_2148032 ) ) ( not ( = ?auto_2148027 ?auto_2148033 ) ) ( not ( = ?auto_2148028 ?auto_2148029 ) ) ( not ( = ?auto_2148028 ?auto_2148030 ) ) ( not ( = ?auto_2148028 ?auto_2148031 ) ) ( not ( = ?auto_2148028 ?auto_2148032 ) ) ( not ( = ?auto_2148028 ?auto_2148033 ) ) ( not ( = ?auto_2148029 ?auto_2148030 ) ) ( not ( = ?auto_2148029 ?auto_2148031 ) ) ( not ( = ?auto_2148029 ?auto_2148032 ) ) ( not ( = ?auto_2148029 ?auto_2148033 ) ) ( not ( = ?auto_2148030 ?auto_2148031 ) ) ( not ( = ?auto_2148030 ?auto_2148032 ) ) ( not ( = ?auto_2148030 ?auto_2148033 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148031 ?auto_2148032 ?auto_2148033 )
      ( MAKE-10CRATE-VERIFY ?auto_2148023 ?auto_2148024 ?auto_2148025 ?auto_2148026 ?auto_2148027 ?auto_2148028 ?auto_2148029 ?auto_2148030 ?auto_2148031 ?auto_2148032 ?auto_2148033 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148128 - SURFACE
      ?auto_2148129 - SURFACE
      ?auto_2148130 - SURFACE
      ?auto_2148131 - SURFACE
      ?auto_2148132 - SURFACE
      ?auto_2148133 - SURFACE
      ?auto_2148134 - SURFACE
      ?auto_2148135 - SURFACE
      ?auto_2148136 - SURFACE
      ?auto_2148137 - SURFACE
      ?auto_2148138 - SURFACE
    )
    :vars
    (
      ?auto_2148142 - HOIST
      ?auto_2148139 - PLACE
      ?auto_2148140 - TRUCK
      ?auto_2148141 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148142 ?auto_2148139 ) ( SURFACE-AT ?auto_2148137 ?auto_2148139 ) ( CLEAR ?auto_2148137 ) ( IS-CRATE ?auto_2148138 ) ( not ( = ?auto_2148137 ?auto_2148138 ) ) ( AVAILABLE ?auto_2148142 ) ( IN ?auto_2148138 ?auto_2148140 ) ( ON ?auto_2148137 ?auto_2148136 ) ( not ( = ?auto_2148136 ?auto_2148137 ) ) ( not ( = ?auto_2148136 ?auto_2148138 ) ) ( TRUCK-AT ?auto_2148140 ?auto_2148141 ) ( not ( = ?auto_2148141 ?auto_2148139 ) ) ( ON ?auto_2148129 ?auto_2148128 ) ( ON ?auto_2148130 ?auto_2148129 ) ( ON ?auto_2148131 ?auto_2148130 ) ( ON ?auto_2148132 ?auto_2148131 ) ( ON ?auto_2148133 ?auto_2148132 ) ( ON ?auto_2148134 ?auto_2148133 ) ( ON ?auto_2148135 ?auto_2148134 ) ( ON ?auto_2148136 ?auto_2148135 ) ( not ( = ?auto_2148128 ?auto_2148129 ) ) ( not ( = ?auto_2148128 ?auto_2148130 ) ) ( not ( = ?auto_2148128 ?auto_2148131 ) ) ( not ( = ?auto_2148128 ?auto_2148132 ) ) ( not ( = ?auto_2148128 ?auto_2148133 ) ) ( not ( = ?auto_2148128 ?auto_2148134 ) ) ( not ( = ?auto_2148128 ?auto_2148135 ) ) ( not ( = ?auto_2148128 ?auto_2148136 ) ) ( not ( = ?auto_2148128 ?auto_2148137 ) ) ( not ( = ?auto_2148128 ?auto_2148138 ) ) ( not ( = ?auto_2148129 ?auto_2148130 ) ) ( not ( = ?auto_2148129 ?auto_2148131 ) ) ( not ( = ?auto_2148129 ?auto_2148132 ) ) ( not ( = ?auto_2148129 ?auto_2148133 ) ) ( not ( = ?auto_2148129 ?auto_2148134 ) ) ( not ( = ?auto_2148129 ?auto_2148135 ) ) ( not ( = ?auto_2148129 ?auto_2148136 ) ) ( not ( = ?auto_2148129 ?auto_2148137 ) ) ( not ( = ?auto_2148129 ?auto_2148138 ) ) ( not ( = ?auto_2148130 ?auto_2148131 ) ) ( not ( = ?auto_2148130 ?auto_2148132 ) ) ( not ( = ?auto_2148130 ?auto_2148133 ) ) ( not ( = ?auto_2148130 ?auto_2148134 ) ) ( not ( = ?auto_2148130 ?auto_2148135 ) ) ( not ( = ?auto_2148130 ?auto_2148136 ) ) ( not ( = ?auto_2148130 ?auto_2148137 ) ) ( not ( = ?auto_2148130 ?auto_2148138 ) ) ( not ( = ?auto_2148131 ?auto_2148132 ) ) ( not ( = ?auto_2148131 ?auto_2148133 ) ) ( not ( = ?auto_2148131 ?auto_2148134 ) ) ( not ( = ?auto_2148131 ?auto_2148135 ) ) ( not ( = ?auto_2148131 ?auto_2148136 ) ) ( not ( = ?auto_2148131 ?auto_2148137 ) ) ( not ( = ?auto_2148131 ?auto_2148138 ) ) ( not ( = ?auto_2148132 ?auto_2148133 ) ) ( not ( = ?auto_2148132 ?auto_2148134 ) ) ( not ( = ?auto_2148132 ?auto_2148135 ) ) ( not ( = ?auto_2148132 ?auto_2148136 ) ) ( not ( = ?auto_2148132 ?auto_2148137 ) ) ( not ( = ?auto_2148132 ?auto_2148138 ) ) ( not ( = ?auto_2148133 ?auto_2148134 ) ) ( not ( = ?auto_2148133 ?auto_2148135 ) ) ( not ( = ?auto_2148133 ?auto_2148136 ) ) ( not ( = ?auto_2148133 ?auto_2148137 ) ) ( not ( = ?auto_2148133 ?auto_2148138 ) ) ( not ( = ?auto_2148134 ?auto_2148135 ) ) ( not ( = ?auto_2148134 ?auto_2148136 ) ) ( not ( = ?auto_2148134 ?auto_2148137 ) ) ( not ( = ?auto_2148134 ?auto_2148138 ) ) ( not ( = ?auto_2148135 ?auto_2148136 ) ) ( not ( = ?auto_2148135 ?auto_2148137 ) ) ( not ( = ?auto_2148135 ?auto_2148138 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148136 ?auto_2148137 ?auto_2148138 )
      ( MAKE-10CRATE-VERIFY ?auto_2148128 ?auto_2148129 ?auto_2148130 ?auto_2148131 ?auto_2148132 ?auto_2148133 ?auto_2148134 ?auto_2148135 ?auto_2148136 ?auto_2148137 ?auto_2148138 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148243 - SURFACE
      ?auto_2148244 - SURFACE
      ?auto_2148245 - SURFACE
      ?auto_2148246 - SURFACE
      ?auto_2148247 - SURFACE
      ?auto_2148248 - SURFACE
      ?auto_2148249 - SURFACE
      ?auto_2148250 - SURFACE
      ?auto_2148251 - SURFACE
      ?auto_2148252 - SURFACE
      ?auto_2148253 - SURFACE
    )
    :vars
    (
      ?auto_2148257 - HOIST
      ?auto_2148255 - PLACE
      ?auto_2148256 - TRUCK
      ?auto_2148254 - PLACE
      ?auto_2148258 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148257 ?auto_2148255 ) ( SURFACE-AT ?auto_2148252 ?auto_2148255 ) ( CLEAR ?auto_2148252 ) ( IS-CRATE ?auto_2148253 ) ( not ( = ?auto_2148252 ?auto_2148253 ) ) ( AVAILABLE ?auto_2148257 ) ( ON ?auto_2148252 ?auto_2148251 ) ( not ( = ?auto_2148251 ?auto_2148252 ) ) ( not ( = ?auto_2148251 ?auto_2148253 ) ) ( TRUCK-AT ?auto_2148256 ?auto_2148254 ) ( not ( = ?auto_2148254 ?auto_2148255 ) ) ( HOIST-AT ?auto_2148258 ?auto_2148254 ) ( LIFTING ?auto_2148258 ?auto_2148253 ) ( not ( = ?auto_2148257 ?auto_2148258 ) ) ( ON ?auto_2148244 ?auto_2148243 ) ( ON ?auto_2148245 ?auto_2148244 ) ( ON ?auto_2148246 ?auto_2148245 ) ( ON ?auto_2148247 ?auto_2148246 ) ( ON ?auto_2148248 ?auto_2148247 ) ( ON ?auto_2148249 ?auto_2148248 ) ( ON ?auto_2148250 ?auto_2148249 ) ( ON ?auto_2148251 ?auto_2148250 ) ( not ( = ?auto_2148243 ?auto_2148244 ) ) ( not ( = ?auto_2148243 ?auto_2148245 ) ) ( not ( = ?auto_2148243 ?auto_2148246 ) ) ( not ( = ?auto_2148243 ?auto_2148247 ) ) ( not ( = ?auto_2148243 ?auto_2148248 ) ) ( not ( = ?auto_2148243 ?auto_2148249 ) ) ( not ( = ?auto_2148243 ?auto_2148250 ) ) ( not ( = ?auto_2148243 ?auto_2148251 ) ) ( not ( = ?auto_2148243 ?auto_2148252 ) ) ( not ( = ?auto_2148243 ?auto_2148253 ) ) ( not ( = ?auto_2148244 ?auto_2148245 ) ) ( not ( = ?auto_2148244 ?auto_2148246 ) ) ( not ( = ?auto_2148244 ?auto_2148247 ) ) ( not ( = ?auto_2148244 ?auto_2148248 ) ) ( not ( = ?auto_2148244 ?auto_2148249 ) ) ( not ( = ?auto_2148244 ?auto_2148250 ) ) ( not ( = ?auto_2148244 ?auto_2148251 ) ) ( not ( = ?auto_2148244 ?auto_2148252 ) ) ( not ( = ?auto_2148244 ?auto_2148253 ) ) ( not ( = ?auto_2148245 ?auto_2148246 ) ) ( not ( = ?auto_2148245 ?auto_2148247 ) ) ( not ( = ?auto_2148245 ?auto_2148248 ) ) ( not ( = ?auto_2148245 ?auto_2148249 ) ) ( not ( = ?auto_2148245 ?auto_2148250 ) ) ( not ( = ?auto_2148245 ?auto_2148251 ) ) ( not ( = ?auto_2148245 ?auto_2148252 ) ) ( not ( = ?auto_2148245 ?auto_2148253 ) ) ( not ( = ?auto_2148246 ?auto_2148247 ) ) ( not ( = ?auto_2148246 ?auto_2148248 ) ) ( not ( = ?auto_2148246 ?auto_2148249 ) ) ( not ( = ?auto_2148246 ?auto_2148250 ) ) ( not ( = ?auto_2148246 ?auto_2148251 ) ) ( not ( = ?auto_2148246 ?auto_2148252 ) ) ( not ( = ?auto_2148246 ?auto_2148253 ) ) ( not ( = ?auto_2148247 ?auto_2148248 ) ) ( not ( = ?auto_2148247 ?auto_2148249 ) ) ( not ( = ?auto_2148247 ?auto_2148250 ) ) ( not ( = ?auto_2148247 ?auto_2148251 ) ) ( not ( = ?auto_2148247 ?auto_2148252 ) ) ( not ( = ?auto_2148247 ?auto_2148253 ) ) ( not ( = ?auto_2148248 ?auto_2148249 ) ) ( not ( = ?auto_2148248 ?auto_2148250 ) ) ( not ( = ?auto_2148248 ?auto_2148251 ) ) ( not ( = ?auto_2148248 ?auto_2148252 ) ) ( not ( = ?auto_2148248 ?auto_2148253 ) ) ( not ( = ?auto_2148249 ?auto_2148250 ) ) ( not ( = ?auto_2148249 ?auto_2148251 ) ) ( not ( = ?auto_2148249 ?auto_2148252 ) ) ( not ( = ?auto_2148249 ?auto_2148253 ) ) ( not ( = ?auto_2148250 ?auto_2148251 ) ) ( not ( = ?auto_2148250 ?auto_2148252 ) ) ( not ( = ?auto_2148250 ?auto_2148253 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148251 ?auto_2148252 ?auto_2148253 )
      ( MAKE-10CRATE-VERIFY ?auto_2148243 ?auto_2148244 ?auto_2148245 ?auto_2148246 ?auto_2148247 ?auto_2148248 ?auto_2148249 ?auto_2148250 ?auto_2148251 ?auto_2148252 ?auto_2148253 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148368 - SURFACE
      ?auto_2148369 - SURFACE
      ?auto_2148370 - SURFACE
      ?auto_2148371 - SURFACE
      ?auto_2148372 - SURFACE
      ?auto_2148373 - SURFACE
      ?auto_2148374 - SURFACE
      ?auto_2148375 - SURFACE
      ?auto_2148376 - SURFACE
      ?auto_2148377 - SURFACE
      ?auto_2148378 - SURFACE
    )
    :vars
    (
      ?auto_2148379 - HOIST
      ?auto_2148382 - PLACE
      ?auto_2148383 - TRUCK
      ?auto_2148380 - PLACE
      ?auto_2148381 - HOIST
      ?auto_2148384 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148379 ?auto_2148382 ) ( SURFACE-AT ?auto_2148377 ?auto_2148382 ) ( CLEAR ?auto_2148377 ) ( IS-CRATE ?auto_2148378 ) ( not ( = ?auto_2148377 ?auto_2148378 ) ) ( AVAILABLE ?auto_2148379 ) ( ON ?auto_2148377 ?auto_2148376 ) ( not ( = ?auto_2148376 ?auto_2148377 ) ) ( not ( = ?auto_2148376 ?auto_2148378 ) ) ( TRUCK-AT ?auto_2148383 ?auto_2148380 ) ( not ( = ?auto_2148380 ?auto_2148382 ) ) ( HOIST-AT ?auto_2148381 ?auto_2148380 ) ( not ( = ?auto_2148379 ?auto_2148381 ) ) ( AVAILABLE ?auto_2148381 ) ( SURFACE-AT ?auto_2148378 ?auto_2148380 ) ( ON ?auto_2148378 ?auto_2148384 ) ( CLEAR ?auto_2148378 ) ( not ( = ?auto_2148377 ?auto_2148384 ) ) ( not ( = ?auto_2148378 ?auto_2148384 ) ) ( not ( = ?auto_2148376 ?auto_2148384 ) ) ( ON ?auto_2148369 ?auto_2148368 ) ( ON ?auto_2148370 ?auto_2148369 ) ( ON ?auto_2148371 ?auto_2148370 ) ( ON ?auto_2148372 ?auto_2148371 ) ( ON ?auto_2148373 ?auto_2148372 ) ( ON ?auto_2148374 ?auto_2148373 ) ( ON ?auto_2148375 ?auto_2148374 ) ( ON ?auto_2148376 ?auto_2148375 ) ( not ( = ?auto_2148368 ?auto_2148369 ) ) ( not ( = ?auto_2148368 ?auto_2148370 ) ) ( not ( = ?auto_2148368 ?auto_2148371 ) ) ( not ( = ?auto_2148368 ?auto_2148372 ) ) ( not ( = ?auto_2148368 ?auto_2148373 ) ) ( not ( = ?auto_2148368 ?auto_2148374 ) ) ( not ( = ?auto_2148368 ?auto_2148375 ) ) ( not ( = ?auto_2148368 ?auto_2148376 ) ) ( not ( = ?auto_2148368 ?auto_2148377 ) ) ( not ( = ?auto_2148368 ?auto_2148378 ) ) ( not ( = ?auto_2148368 ?auto_2148384 ) ) ( not ( = ?auto_2148369 ?auto_2148370 ) ) ( not ( = ?auto_2148369 ?auto_2148371 ) ) ( not ( = ?auto_2148369 ?auto_2148372 ) ) ( not ( = ?auto_2148369 ?auto_2148373 ) ) ( not ( = ?auto_2148369 ?auto_2148374 ) ) ( not ( = ?auto_2148369 ?auto_2148375 ) ) ( not ( = ?auto_2148369 ?auto_2148376 ) ) ( not ( = ?auto_2148369 ?auto_2148377 ) ) ( not ( = ?auto_2148369 ?auto_2148378 ) ) ( not ( = ?auto_2148369 ?auto_2148384 ) ) ( not ( = ?auto_2148370 ?auto_2148371 ) ) ( not ( = ?auto_2148370 ?auto_2148372 ) ) ( not ( = ?auto_2148370 ?auto_2148373 ) ) ( not ( = ?auto_2148370 ?auto_2148374 ) ) ( not ( = ?auto_2148370 ?auto_2148375 ) ) ( not ( = ?auto_2148370 ?auto_2148376 ) ) ( not ( = ?auto_2148370 ?auto_2148377 ) ) ( not ( = ?auto_2148370 ?auto_2148378 ) ) ( not ( = ?auto_2148370 ?auto_2148384 ) ) ( not ( = ?auto_2148371 ?auto_2148372 ) ) ( not ( = ?auto_2148371 ?auto_2148373 ) ) ( not ( = ?auto_2148371 ?auto_2148374 ) ) ( not ( = ?auto_2148371 ?auto_2148375 ) ) ( not ( = ?auto_2148371 ?auto_2148376 ) ) ( not ( = ?auto_2148371 ?auto_2148377 ) ) ( not ( = ?auto_2148371 ?auto_2148378 ) ) ( not ( = ?auto_2148371 ?auto_2148384 ) ) ( not ( = ?auto_2148372 ?auto_2148373 ) ) ( not ( = ?auto_2148372 ?auto_2148374 ) ) ( not ( = ?auto_2148372 ?auto_2148375 ) ) ( not ( = ?auto_2148372 ?auto_2148376 ) ) ( not ( = ?auto_2148372 ?auto_2148377 ) ) ( not ( = ?auto_2148372 ?auto_2148378 ) ) ( not ( = ?auto_2148372 ?auto_2148384 ) ) ( not ( = ?auto_2148373 ?auto_2148374 ) ) ( not ( = ?auto_2148373 ?auto_2148375 ) ) ( not ( = ?auto_2148373 ?auto_2148376 ) ) ( not ( = ?auto_2148373 ?auto_2148377 ) ) ( not ( = ?auto_2148373 ?auto_2148378 ) ) ( not ( = ?auto_2148373 ?auto_2148384 ) ) ( not ( = ?auto_2148374 ?auto_2148375 ) ) ( not ( = ?auto_2148374 ?auto_2148376 ) ) ( not ( = ?auto_2148374 ?auto_2148377 ) ) ( not ( = ?auto_2148374 ?auto_2148378 ) ) ( not ( = ?auto_2148374 ?auto_2148384 ) ) ( not ( = ?auto_2148375 ?auto_2148376 ) ) ( not ( = ?auto_2148375 ?auto_2148377 ) ) ( not ( = ?auto_2148375 ?auto_2148378 ) ) ( not ( = ?auto_2148375 ?auto_2148384 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148376 ?auto_2148377 ?auto_2148378 )
      ( MAKE-10CRATE-VERIFY ?auto_2148368 ?auto_2148369 ?auto_2148370 ?auto_2148371 ?auto_2148372 ?auto_2148373 ?auto_2148374 ?auto_2148375 ?auto_2148376 ?auto_2148377 ?auto_2148378 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148494 - SURFACE
      ?auto_2148495 - SURFACE
      ?auto_2148496 - SURFACE
      ?auto_2148497 - SURFACE
      ?auto_2148498 - SURFACE
      ?auto_2148499 - SURFACE
      ?auto_2148500 - SURFACE
      ?auto_2148501 - SURFACE
      ?auto_2148502 - SURFACE
      ?auto_2148503 - SURFACE
      ?auto_2148504 - SURFACE
    )
    :vars
    (
      ?auto_2148505 - HOIST
      ?auto_2148510 - PLACE
      ?auto_2148509 - PLACE
      ?auto_2148508 - HOIST
      ?auto_2148507 - SURFACE
      ?auto_2148506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148505 ?auto_2148510 ) ( SURFACE-AT ?auto_2148503 ?auto_2148510 ) ( CLEAR ?auto_2148503 ) ( IS-CRATE ?auto_2148504 ) ( not ( = ?auto_2148503 ?auto_2148504 ) ) ( AVAILABLE ?auto_2148505 ) ( ON ?auto_2148503 ?auto_2148502 ) ( not ( = ?auto_2148502 ?auto_2148503 ) ) ( not ( = ?auto_2148502 ?auto_2148504 ) ) ( not ( = ?auto_2148509 ?auto_2148510 ) ) ( HOIST-AT ?auto_2148508 ?auto_2148509 ) ( not ( = ?auto_2148505 ?auto_2148508 ) ) ( AVAILABLE ?auto_2148508 ) ( SURFACE-AT ?auto_2148504 ?auto_2148509 ) ( ON ?auto_2148504 ?auto_2148507 ) ( CLEAR ?auto_2148504 ) ( not ( = ?auto_2148503 ?auto_2148507 ) ) ( not ( = ?auto_2148504 ?auto_2148507 ) ) ( not ( = ?auto_2148502 ?auto_2148507 ) ) ( TRUCK-AT ?auto_2148506 ?auto_2148510 ) ( ON ?auto_2148495 ?auto_2148494 ) ( ON ?auto_2148496 ?auto_2148495 ) ( ON ?auto_2148497 ?auto_2148496 ) ( ON ?auto_2148498 ?auto_2148497 ) ( ON ?auto_2148499 ?auto_2148498 ) ( ON ?auto_2148500 ?auto_2148499 ) ( ON ?auto_2148501 ?auto_2148500 ) ( ON ?auto_2148502 ?auto_2148501 ) ( not ( = ?auto_2148494 ?auto_2148495 ) ) ( not ( = ?auto_2148494 ?auto_2148496 ) ) ( not ( = ?auto_2148494 ?auto_2148497 ) ) ( not ( = ?auto_2148494 ?auto_2148498 ) ) ( not ( = ?auto_2148494 ?auto_2148499 ) ) ( not ( = ?auto_2148494 ?auto_2148500 ) ) ( not ( = ?auto_2148494 ?auto_2148501 ) ) ( not ( = ?auto_2148494 ?auto_2148502 ) ) ( not ( = ?auto_2148494 ?auto_2148503 ) ) ( not ( = ?auto_2148494 ?auto_2148504 ) ) ( not ( = ?auto_2148494 ?auto_2148507 ) ) ( not ( = ?auto_2148495 ?auto_2148496 ) ) ( not ( = ?auto_2148495 ?auto_2148497 ) ) ( not ( = ?auto_2148495 ?auto_2148498 ) ) ( not ( = ?auto_2148495 ?auto_2148499 ) ) ( not ( = ?auto_2148495 ?auto_2148500 ) ) ( not ( = ?auto_2148495 ?auto_2148501 ) ) ( not ( = ?auto_2148495 ?auto_2148502 ) ) ( not ( = ?auto_2148495 ?auto_2148503 ) ) ( not ( = ?auto_2148495 ?auto_2148504 ) ) ( not ( = ?auto_2148495 ?auto_2148507 ) ) ( not ( = ?auto_2148496 ?auto_2148497 ) ) ( not ( = ?auto_2148496 ?auto_2148498 ) ) ( not ( = ?auto_2148496 ?auto_2148499 ) ) ( not ( = ?auto_2148496 ?auto_2148500 ) ) ( not ( = ?auto_2148496 ?auto_2148501 ) ) ( not ( = ?auto_2148496 ?auto_2148502 ) ) ( not ( = ?auto_2148496 ?auto_2148503 ) ) ( not ( = ?auto_2148496 ?auto_2148504 ) ) ( not ( = ?auto_2148496 ?auto_2148507 ) ) ( not ( = ?auto_2148497 ?auto_2148498 ) ) ( not ( = ?auto_2148497 ?auto_2148499 ) ) ( not ( = ?auto_2148497 ?auto_2148500 ) ) ( not ( = ?auto_2148497 ?auto_2148501 ) ) ( not ( = ?auto_2148497 ?auto_2148502 ) ) ( not ( = ?auto_2148497 ?auto_2148503 ) ) ( not ( = ?auto_2148497 ?auto_2148504 ) ) ( not ( = ?auto_2148497 ?auto_2148507 ) ) ( not ( = ?auto_2148498 ?auto_2148499 ) ) ( not ( = ?auto_2148498 ?auto_2148500 ) ) ( not ( = ?auto_2148498 ?auto_2148501 ) ) ( not ( = ?auto_2148498 ?auto_2148502 ) ) ( not ( = ?auto_2148498 ?auto_2148503 ) ) ( not ( = ?auto_2148498 ?auto_2148504 ) ) ( not ( = ?auto_2148498 ?auto_2148507 ) ) ( not ( = ?auto_2148499 ?auto_2148500 ) ) ( not ( = ?auto_2148499 ?auto_2148501 ) ) ( not ( = ?auto_2148499 ?auto_2148502 ) ) ( not ( = ?auto_2148499 ?auto_2148503 ) ) ( not ( = ?auto_2148499 ?auto_2148504 ) ) ( not ( = ?auto_2148499 ?auto_2148507 ) ) ( not ( = ?auto_2148500 ?auto_2148501 ) ) ( not ( = ?auto_2148500 ?auto_2148502 ) ) ( not ( = ?auto_2148500 ?auto_2148503 ) ) ( not ( = ?auto_2148500 ?auto_2148504 ) ) ( not ( = ?auto_2148500 ?auto_2148507 ) ) ( not ( = ?auto_2148501 ?auto_2148502 ) ) ( not ( = ?auto_2148501 ?auto_2148503 ) ) ( not ( = ?auto_2148501 ?auto_2148504 ) ) ( not ( = ?auto_2148501 ?auto_2148507 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148502 ?auto_2148503 ?auto_2148504 )
      ( MAKE-10CRATE-VERIFY ?auto_2148494 ?auto_2148495 ?auto_2148496 ?auto_2148497 ?auto_2148498 ?auto_2148499 ?auto_2148500 ?auto_2148501 ?auto_2148502 ?auto_2148503 ?auto_2148504 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148620 - SURFACE
      ?auto_2148621 - SURFACE
      ?auto_2148622 - SURFACE
      ?auto_2148623 - SURFACE
      ?auto_2148624 - SURFACE
      ?auto_2148625 - SURFACE
      ?auto_2148626 - SURFACE
      ?auto_2148627 - SURFACE
      ?auto_2148628 - SURFACE
      ?auto_2148629 - SURFACE
      ?auto_2148630 - SURFACE
    )
    :vars
    (
      ?auto_2148635 - HOIST
      ?auto_2148631 - PLACE
      ?auto_2148632 - PLACE
      ?auto_2148634 - HOIST
      ?auto_2148633 - SURFACE
      ?auto_2148636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148635 ?auto_2148631 ) ( IS-CRATE ?auto_2148630 ) ( not ( = ?auto_2148629 ?auto_2148630 ) ) ( not ( = ?auto_2148628 ?auto_2148629 ) ) ( not ( = ?auto_2148628 ?auto_2148630 ) ) ( not ( = ?auto_2148632 ?auto_2148631 ) ) ( HOIST-AT ?auto_2148634 ?auto_2148632 ) ( not ( = ?auto_2148635 ?auto_2148634 ) ) ( AVAILABLE ?auto_2148634 ) ( SURFACE-AT ?auto_2148630 ?auto_2148632 ) ( ON ?auto_2148630 ?auto_2148633 ) ( CLEAR ?auto_2148630 ) ( not ( = ?auto_2148629 ?auto_2148633 ) ) ( not ( = ?auto_2148630 ?auto_2148633 ) ) ( not ( = ?auto_2148628 ?auto_2148633 ) ) ( TRUCK-AT ?auto_2148636 ?auto_2148631 ) ( SURFACE-AT ?auto_2148628 ?auto_2148631 ) ( CLEAR ?auto_2148628 ) ( LIFTING ?auto_2148635 ?auto_2148629 ) ( IS-CRATE ?auto_2148629 ) ( ON ?auto_2148621 ?auto_2148620 ) ( ON ?auto_2148622 ?auto_2148621 ) ( ON ?auto_2148623 ?auto_2148622 ) ( ON ?auto_2148624 ?auto_2148623 ) ( ON ?auto_2148625 ?auto_2148624 ) ( ON ?auto_2148626 ?auto_2148625 ) ( ON ?auto_2148627 ?auto_2148626 ) ( ON ?auto_2148628 ?auto_2148627 ) ( not ( = ?auto_2148620 ?auto_2148621 ) ) ( not ( = ?auto_2148620 ?auto_2148622 ) ) ( not ( = ?auto_2148620 ?auto_2148623 ) ) ( not ( = ?auto_2148620 ?auto_2148624 ) ) ( not ( = ?auto_2148620 ?auto_2148625 ) ) ( not ( = ?auto_2148620 ?auto_2148626 ) ) ( not ( = ?auto_2148620 ?auto_2148627 ) ) ( not ( = ?auto_2148620 ?auto_2148628 ) ) ( not ( = ?auto_2148620 ?auto_2148629 ) ) ( not ( = ?auto_2148620 ?auto_2148630 ) ) ( not ( = ?auto_2148620 ?auto_2148633 ) ) ( not ( = ?auto_2148621 ?auto_2148622 ) ) ( not ( = ?auto_2148621 ?auto_2148623 ) ) ( not ( = ?auto_2148621 ?auto_2148624 ) ) ( not ( = ?auto_2148621 ?auto_2148625 ) ) ( not ( = ?auto_2148621 ?auto_2148626 ) ) ( not ( = ?auto_2148621 ?auto_2148627 ) ) ( not ( = ?auto_2148621 ?auto_2148628 ) ) ( not ( = ?auto_2148621 ?auto_2148629 ) ) ( not ( = ?auto_2148621 ?auto_2148630 ) ) ( not ( = ?auto_2148621 ?auto_2148633 ) ) ( not ( = ?auto_2148622 ?auto_2148623 ) ) ( not ( = ?auto_2148622 ?auto_2148624 ) ) ( not ( = ?auto_2148622 ?auto_2148625 ) ) ( not ( = ?auto_2148622 ?auto_2148626 ) ) ( not ( = ?auto_2148622 ?auto_2148627 ) ) ( not ( = ?auto_2148622 ?auto_2148628 ) ) ( not ( = ?auto_2148622 ?auto_2148629 ) ) ( not ( = ?auto_2148622 ?auto_2148630 ) ) ( not ( = ?auto_2148622 ?auto_2148633 ) ) ( not ( = ?auto_2148623 ?auto_2148624 ) ) ( not ( = ?auto_2148623 ?auto_2148625 ) ) ( not ( = ?auto_2148623 ?auto_2148626 ) ) ( not ( = ?auto_2148623 ?auto_2148627 ) ) ( not ( = ?auto_2148623 ?auto_2148628 ) ) ( not ( = ?auto_2148623 ?auto_2148629 ) ) ( not ( = ?auto_2148623 ?auto_2148630 ) ) ( not ( = ?auto_2148623 ?auto_2148633 ) ) ( not ( = ?auto_2148624 ?auto_2148625 ) ) ( not ( = ?auto_2148624 ?auto_2148626 ) ) ( not ( = ?auto_2148624 ?auto_2148627 ) ) ( not ( = ?auto_2148624 ?auto_2148628 ) ) ( not ( = ?auto_2148624 ?auto_2148629 ) ) ( not ( = ?auto_2148624 ?auto_2148630 ) ) ( not ( = ?auto_2148624 ?auto_2148633 ) ) ( not ( = ?auto_2148625 ?auto_2148626 ) ) ( not ( = ?auto_2148625 ?auto_2148627 ) ) ( not ( = ?auto_2148625 ?auto_2148628 ) ) ( not ( = ?auto_2148625 ?auto_2148629 ) ) ( not ( = ?auto_2148625 ?auto_2148630 ) ) ( not ( = ?auto_2148625 ?auto_2148633 ) ) ( not ( = ?auto_2148626 ?auto_2148627 ) ) ( not ( = ?auto_2148626 ?auto_2148628 ) ) ( not ( = ?auto_2148626 ?auto_2148629 ) ) ( not ( = ?auto_2148626 ?auto_2148630 ) ) ( not ( = ?auto_2148626 ?auto_2148633 ) ) ( not ( = ?auto_2148627 ?auto_2148628 ) ) ( not ( = ?auto_2148627 ?auto_2148629 ) ) ( not ( = ?auto_2148627 ?auto_2148630 ) ) ( not ( = ?auto_2148627 ?auto_2148633 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148628 ?auto_2148629 ?auto_2148630 )
      ( MAKE-10CRATE-VERIFY ?auto_2148620 ?auto_2148621 ?auto_2148622 ?auto_2148623 ?auto_2148624 ?auto_2148625 ?auto_2148626 ?auto_2148627 ?auto_2148628 ?auto_2148629 ?auto_2148630 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2148746 - SURFACE
      ?auto_2148747 - SURFACE
      ?auto_2148748 - SURFACE
      ?auto_2148749 - SURFACE
      ?auto_2148750 - SURFACE
      ?auto_2148751 - SURFACE
      ?auto_2148752 - SURFACE
      ?auto_2148753 - SURFACE
      ?auto_2148754 - SURFACE
      ?auto_2148755 - SURFACE
      ?auto_2148756 - SURFACE
    )
    :vars
    (
      ?auto_2148761 - HOIST
      ?auto_2148759 - PLACE
      ?auto_2148760 - PLACE
      ?auto_2148758 - HOIST
      ?auto_2148757 - SURFACE
      ?auto_2148762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2148761 ?auto_2148759 ) ( IS-CRATE ?auto_2148756 ) ( not ( = ?auto_2148755 ?auto_2148756 ) ) ( not ( = ?auto_2148754 ?auto_2148755 ) ) ( not ( = ?auto_2148754 ?auto_2148756 ) ) ( not ( = ?auto_2148760 ?auto_2148759 ) ) ( HOIST-AT ?auto_2148758 ?auto_2148760 ) ( not ( = ?auto_2148761 ?auto_2148758 ) ) ( AVAILABLE ?auto_2148758 ) ( SURFACE-AT ?auto_2148756 ?auto_2148760 ) ( ON ?auto_2148756 ?auto_2148757 ) ( CLEAR ?auto_2148756 ) ( not ( = ?auto_2148755 ?auto_2148757 ) ) ( not ( = ?auto_2148756 ?auto_2148757 ) ) ( not ( = ?auto_2148754 ?auto_2148757 ) ) ( TRUCK-AT ?auto_2148762 ?auto_2148759 ) ( SURFACE-AT ?auto_2148754 ?auto_2148759 ) ( CLEAR ?auto_2148754 ) ( IS-CRATE ?auto_2148755 ) ( AVAILABLE ?auto_2148761 ) ( IN ?auto_2148755 ?auto_2148762 ) ( ON ?auto_2148747 ?auto_2148746 ) ( ON ?auto_2148748 ?auto_2148747 ) ( ON ?auto_2148749 ?auto_2148748 ) ( ON ?auto_2148750 ?auto_2148749 ) ( ON ?auto_2148751 ?auto_2148750 ) ( ON ?auto_2148752 ?auto_2148751 ) ( ON ?auto_2148753 ?auto_2148752 ) ( ON ?auto_2148754 ?auto_2148753 ) ( not ( = ?auto_2148746 ?auto_2148747 ) ) ( not ( = ?auto_2148746 ?auto_2148748 ) ) ( not ( = ?auto_2148746 ?auto_2148749 ) ) ( not ( = ?auto_2148746 ?auto_2148750 ) ) ( not ( = ?auto_2148746 ?auto_2148751 ) ) ( not ( = ?auto_2148746 ?auto_2148752 ) ) ( not ( = ?auto_2148746 ?auto_2148753 ) ) ( not ( = ?auto_2148746 ?auto_2148754 ) ) ( not ( = ?auto_2148746 ?auto_2148755 ) ) ( not ( = ?auto_2148746 ?auto_2148756 ) ) ( not ( = ?auto_2148746 ?auto_2148757 ) ) ( not ( = ?auto_2148747 ?auto_2148748 ) ) ( not ( = ?auto_2148747 ?auto_2148749 ) ) ( not ( = ?auto_2148747 ?auto_2148750 ) ) ( not ( = ?auto_2148747 ?auto_2148751 ) ) ( not ( = ?auto_2148747 ?auto_2148752 ) ) ( not ( = ?auto_2148747 ?auto_2148753 ) ) ( not ( = ?auto_2148747 ?auto_2148754 ) ) ( not ( = ?auto_2148747 ?auto_2148755 ) ) ( not ( = ?auto_2148747 ?auto_2148756 ) ) ( not ( = ?auto_2148747 ?auto_2148757 ) ) ( not ( = ?auto_2148748 ?auto_2148749 ) ) ( not ( = ?auto_2148748 ?auto_2148750 ) ) ( not ( = ?auto_2148748 ?auto_2148751 ) ) ( not ( = ?auto_2148748 ?auto_2148752 ) ) ( not ( = ?auto_2148748 ?auto_2148753 ) ) ( not ( = ?auto_2148748 ?auto_2148754 ) ) ( not ( = ?auto_2148748 ?auto_2148755 ) ) ( not ( = ?auto_2148748 ?auto_2148756 ) ) ( not ( = ?auto_2148748 ?auto_2148757 ) ) ( not ( = ?auto_2148749 ?auto_2148750 ) ) ( not ( = ?auto_2148749 ?auto_2148751 ) ) ( not ( = ?auto_2148749 ?auto_2148752 ) ) ( not ( = ?auto_2148749 ?auto_2148753 ) ) ( not ( = ?auto_2148749 ?auto_2148754 ) ) ( not ( = ?auto_2148749 ?auto_2148755 ) ) ( not ( = ?auto_2148749 ?auto_2148756 ) ) ( not ( = ?auto_2148749 ?auto_2148757 ) ) ( not ( = ?auto_2148750 ?auto_2148751 ) ) ( not ( = ?auto_2148750 ?auto_2148752 ) ) ( not ( = ?auto_2148750 ?auto_2148753 ) ) ( not ( = ?auto_2148750 ?auto_2148754 ) ) ( not ( = ?auto_2148750 ?auto_2148755 ) ) ( not ( = ?auto_2148750 ?auto_2148756 ) ) ( not ( = ?auto_2148750 ?auto_2148757 ) ) ( not ( = ?auto_2148751 ?auto_2148752 ) ) ( not ( = ?auto_2148751 ?auto_2148753 ) ) ( not ( = ?auto_2148751 ?auto_2148754 ) ) ( not ( = ?auto_2148751 ?auto_2148755 ) ) ( not ( = ?auto_2148751 ?auto_2148756 ) ) ( not ( = ?auto_2148751 ?auto_2148757 ) ) ( not ( = ?auto_2148752 ?auto_2148753 ) ) ( not ( = ?auto_2148752 ?auto_2148754 ) ) ( not ( = ?auto_2148752 ?auto_2148755 ) ) ( not ( = ?auto_2148752 ?auto_2148756 ) ) ( not ( = ?auto_2148752 ?auto_2148757 ) ) ( not ( = ?auto_2148753 ?auto_2148754 ) ) ( not ( = ?auto_2148753 ?auto_2148755 ) ) ( not ( = ?auto_2148753 ?auto_2148756 ) ) ( not ( = ?auto_2148753 ?auto_2148757 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2148754 ?auto_2148755 ?auto_2148756 )
      ( MAKE-10CRATE-VERIFY ?auto_2148746 ?auto_2148747 ?auto_2148748 ?auto_2148749 ?auto_2148750 ?auto_2148751 ?auto_2148752 ?auto_2148753 ?auto_2148754 ?auto_2148755 ?auto_2148756 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156030 - SURFACE
      ?auto_2156031 - SURFACE
      ?auto_2156032 - SURFACE
      ?auto_2156033 - SURFACE
      ?auto_2156034 - SURFACE
      ?auto_2156035 - SURFACE
      ?auto_2156036 - SURFACE
      ?auto_2156037 - SURFACE
      ?auto_2156038 - SURFACE
      ?auto_2156039 - SURFACE
      ?auto_2156040 - SURFACE
      ?auto_2156041 - SURFACE
    )
    :vars
    (
      ?auto_2156042 - HOIST
      ?auto_2156043 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156042 ?auto_2156043 ) ( SURFACE-AT ?auto_2156040 ?auto_2156043 ) ( CLEAR ?auto_2156040 ) ( LIFTING ?auto_2156042 ?auto_2156041 ) ( IS-CRATE ?auto_2156041 ) ( not ( = ?auto_2156040 ?auto_2156041 ) ) ( ON ?auto_2156031 ?auto_2156030 ) ( ON ?auto_2156032 ?auto_2156031 ) ( ON ?auto_2156033 ?auto_2156032 ) ( ON ?auto_2156034 ?auto_2156033 ) ( ON ?auto_2156035 ?auto_2156034 ) ( ON ?auto_2156036 ?auto_2156035 ) ( ON ?auto_2156037 ?auto_2156036 ) ( ON ?auto_2156038 ?auto_2156037 ) ( ON ?auto_2156039 ?auto_2156038 ) ( ON ?auto_2156040 ?auto_2156039 ) ( not ( = ?auto_2156030 ?auto_2156031 ) ) ( not ( = ?auto_2156030 ?auto_2156032 ) ) ( not ( = ?auto_2156030 ?auto_2156033 ) ) ( not ( = ?auto_2156030 ?auto_2156034 ) ) ( not ( = ?auto_2156030 ?auto_2156035 ) ) ( not ( = ?auto_2156030 ?auto_2156036 ) ) ( not ( = ?auto_2156030 ?auto_2156037 ) ) ( not ( = ?auto_2156030 ?auto_2156038 ) ) ( not ( = ?auto_2156030 ?auto_2156039 ) ) ( not ( = ?auto_2156030 ?auto_2156040 ) ) ( not ( = ?auto_2156030 ?auto_2156041 ) ) ( not ( = ?auto_2156031 ?auto_2156032 ) ) ( not ( = ?auto_2156031 ?auto_2156033 ) ) ( not ( = ?auto_2156031 ?auto_2156034 ) ) ( not ( = ?auto_2156031 ?auto_2156035 ) ) ( not ( = ?auto_2156031 ?auto_2156036 ) ) ( not ( = ?auto_2156031 ?auto_2156037 ) ) ( not ( = ?auto_2156031 ?auto_2156038 ) ) ( not ( = ?auto_2156031 ?auto_2156039 ) ) ( not ( = ?auto_2156031 ?auto_2156040 ) ) ( not ( = ?auto_2156031 ?auto_2156041 ) ) ( not ( = ?auto_2156032 ?auto_2156033 ) ) ( not ( = ?auto_2156032 ?auto_2156034 ) ) ( not ( = ?auto_2156032 ?auto_2156035 ) ) ( not ( = ?auto_2156032 ?auto_2156036 ) ) ( not ( = ?auto_2156032 ?auto_2156037 ) ) ( not ( = ?auto_2156032 ?auto_2156038 ) ) ( not ( = ?auto_2156032 ?auto_2156039 ) ) ( not ( = ?auto_2156032 ?auto_2156040 ) ) ( not ( = ?auto_2156032 ?auto_2156041 ) ) ( not ( = ?auto_2156033 ?auto_2156034 ) ) ( not ( = ?auto_2156033 ?auto_2156035 ) ) ( not ( = ?auto_2156033 ?auto_2156036 ) ) ( not ( = ?auto_2156033 ?auto_2156037 ) ) ( not ( = ?auto_2156033 ?auto_2156038 ) ) ( not ( = ?auto_2156033 ?auto_2156039 ) ) ( not ( = ?auto_2156033 ?auto_2156040 ) ) ( not ( = ?auto_2156033 ?auto_2156041 ) ) ( not ( = ?auto_2156034 ?auto_2156035 ) ) ( not ( = ?auto_2156034 ?auto_2156036 ) ) ( not ( = ?auto_2156034 ?auto_2156037 ) ) ( not ( = ?auto_2156034 ?auto_2156038 ) ) ( not ( = ?auto_2156034 ?auto_2156039 ) ) ( not ( = ?auto_2156034 ?auto_2156040 ) ) ( not ( = ?auto_2156034 ?auto_2156041 ) ) ( not ( = ?auto_2156035 ?auto_2156036 ) ) ( not ( = ?auto_2156035 ?auto_2156037 ) ) ( not ( = ?auto_2156035 ?auto_2156038 ) ) ( not ( = ?auto_2156035 ?auto_2156039 ) ) ( not ( = ?auto_2156035 ?auto_2156040 ) ) ( not ( = ?auto_2156035 ?auto_2156041 ) ) ( not ( = ?auto_2156036 ?auto_2156037 ) ) ( not ( = ?auto_2156036 ?auto_2156038 ) ) ( not ( = ?auto_2156036 ?auto_2156039 ) ) ( not ( = ?auto_2156036 ?auto_2156040 ) ) ( not ( = ?auto_2156036 ?auto_2156041 ) ) ( not ( = ?auto_2156037 ?auto_2156038 ) ) ( not ( = ?auto_2156037 ?auto_2156039 ) ) ( not ( = ?auto_2156037 ?auto_2156040 ) ) ( not ( = ?auto_2156037 ?auto_2156041 ) ) ( not ( = ?auto_2156038 ?auto_2156039 ) ) ( not ( = ?auto_2156038 ?auto_2156040 ) ) ( not ( = ?auto_2156038 ?auto_2156041 ) ) ( not ( = ?auto_2156039 ?auto_2156040 ) ) ( not ( = ?auto_2156039 ?auto_2156041 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2156040 ?auto_2156041 )
      ( MAKE-11CRATE-VERIFY ?auto_2156030 ?auto_2156031 ?auto_2156032 ?auto_2156033 ?auto_2156034 ?auto_2156035 ?auto_2156036 ?auto_2156037 ?auto_2156038 ?auto_2156039 ?auto_2156040 ?auto_2156041 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156139 - SURFACE
      ?auto_2156140 - SURFACE
      ?auto_2156141 - SURFACE
      ?auto_2156142 - SURFACE
      ?auto_2156143 - SURFACE
      ?auto_2156144 - SURFACE
      ?auto_2156145 - SURFACE
      ?auto_2156146 - SURFACE
      ?auto_2156147 - SURFACE
      ?auto_2156148 - SURFACE
      ?auto_2156149 - SURFACE
      ?auto_2156150 - SURFACE
    )
    :vars
    (
      ?auto_2156152 - HOIST
      ?auto_2156153 - PLACE
      ?auto_2156151 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156152 ?auto_2156153 ) ( SURFACE-AT ?auto_2156149 ?auto_2156153 ) ( CLEAR ?auto_2156149 ) ( IS-CRATE ?auto_2156150 ) ( not ( = ?auto_2156149 ?auto_2156150 ) ) ( TRUCK-AT ?auto_2156151 ?auto_2156153 ) ( AVAILABLE ?auto_2156152 ) ( IN ?auto_2156150 ?auto_2156151 ) ( ON ?auto_2156149 ?auto_2156148 ) ( not ( = ?auto_2156148 ?auto_2156149 ) ) ( not ( = ?auto_2156148 ?auto_2156150 ) ) ( ON ?auto_2156140 ?auto_2156139 ) ( ON ?auto_2156141 ?auto_2156140 ) ( ON ?auto_2156142 ?auto_2156141 ) ( ON ?auto_2156143 ?auto_2156142 ) ( ON ?auto_2156144 ?auto_2156143 ) ( ON ?auto_2156145 ?auto_2156144 ) ( ON ?auto_2156146 ?auto_2156145 ) ( ON ?auto_2156147 ?auto_2156146 ) ( ON ?auto_2156148 ?auto_2156147 ) ( not ( = ?auto_2156139 ?auto_2156140 ) ) ( not ( = ?auto_2156139 ?auto_2156141 ) ) ( not ( = ?auto_2156139 ?auto_2156142 ) ) ( not ( = ?auto_2156139 ?auto_2156143 ) ) ( not ( = ?auto_2156139 ?auto_2156144 ) ) ( not ( = ?auto_2156139 ?auto_2156145 ) ) ( not ( = ?auto_2156139 ?auto_2156146 ) ) ( not ( = ?auto_2156139 ?auto_2156147 ) ) ( not ( = ?auto_2156139 ?auto_2156148 ) ) ( not ( = ?auto_2156139 ?auto_2156149 ) ) ( not ( = ?auto_2156139 ?auto_2156150 ) ) ( not ( = ?auto_2156140 ?auto_2156141 ) ) ( not ( = ?auto_2156140 ?auto_2156142 ) ) ( not ( = ?auto_2156140 ?auto_2156143 ) ) ( not ( = ?auto_2156140 ?auto_2156144 ) ) ( not ( = ?auto_2156140 ?auto_2156145 ) ) ( not ( = ?auto_2156140 ?auto_2156146 ) ) ( not ( = ?auto_2156140 ?auto_2156147 ) ) ( not ( = ?auto_2156140 ?auto_2156148 ) ) ( not ( = ?auto_2156140 ?auto_2156149 ) ) ( not ( = ?auto_2156140 ?auto_2156150 ) ) ( not ( = ?auto_2156141 ?auto_2156142 ) ) ( not ( = ?auto_2156141 ?auto_2156143 ) ) ( not ( = ?auto_2156141 ?auto_2156144 ) ) ( not ( = ?auto_2156141 ?auto_2156145 ) ) ( not ( = ?auto_2156141 ?auto_2156146 ) ) ( not ( = ?auto_2156141 ?auto_2156147 ) ) ( not ( = ?auto_2156141 ?auto_2156148 ) ) ( not ( = ?auto_2156141 ?auto_2156149 ) ) ( not ( = ?auto_2156141 ?auto_2156150 ) ) ( not ( = ?auto_2156142 ?auto_2156143 ) ) ( not ( = ?auto_2156142 ?auto_2156144 ) ) ( not ( = ?auto_2156142 ?auto_2156145 ) ) ( not ( = ?auto_2156142 ?auto_2156146 ) ) ( not ( = ?auto_2156142 ?auto_2156147 ) ) ( not ( = ?auto_2156142 ?auto_2156148 ) ) ( not ( = ?auto_2156142 ?auto_2156149 ) ) ( not ( = ?auto_2156142 ?auto_2156150 ) ) ( not ( = ?auto_2156143 ?auto_2156144 ) ) ( not ( = ?auto_2156143 ?auto_2156145 ) ) ( not ( = ?auto_2156143 ?auto_2156146 ) ) ( not ( = ?auto_2156143 ?auto_2156147 ) ) ( not ( = ?auto_2156143 ?auto_2156148 ) ) ( not ( = ?auto_2156143 ?auto_2156149 ) ) ( not ( = ?auto_2156143 ?auto_2156150 ) ) ( not ( = ?auto_2156144 ?auto_2156145 ) ) ( not ( = ?auto_2156144 ?auto_2156146 ) ) ( not ( = ?auto_2156144 ?auto_2156147 ) ) ( not ( = ?auto_2156144 ?auto_2156148 ) ) ( not ( = ?auto_2156144 ?auto_2156149 ) ) ( not ( = ?auto_2156144 ?auto_2156150 ) ) ( not ( = ?auto_2156145 ?auto_2156146 ) ) ( not ( = ?auto_2156145 ?auto_2156147 ) ) ( not ( = ?auto_2156145 ?auto_2156148 ) ) ( not ( = ?auto_2156145 ?auto_2156149 ) ) ( not ( = ?auto_2156145 ?auto_2156150 ) ) ( not ( = ?auto_2156146 ?auto_2156147 ) ) ( not ( = ?auto_2156146 ?auto_2156148 ) ) ( not ( = ?auto_2156146 ?auto_2156149 ) ) ( not ( = ?auto_2156146 ?auto_2156150 ) ) ( not ( = ?auto_2156147 ?auto_2156148 ) ) ( not ( = ?auto_2156147 ?auto_2156149 ) ) ( not ( = ?auto_2156147 ?auto_2156150 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156148 ?auto_2156149 ?auto_2156150 )
      ( MAKE-11CRATE-VERIFY ?auto_2156139 ?auto_2156140 ?auto_2156141 ?auto_2156142 ?auto_2156143 ?auto_2156144 ?auto_2156145 ?auto_2156146 ?auto_2156147 ?auto_2156148 ?auto_2156149 ?auto_2156150 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156260 - SURFACE
      ?auto_2156261 - SURFACE
      ?auto_2156262 - SURFACE
      ?auto_2156263 - SURFACE
      ?auto_2156264 - SURFACE
      ?auto_2156265 - SURFACE
      ?auto_2156266 - SURFACE
      ?auto_2156267 - SURFACE
      ?auto_2156268 - SURFACE
      ?auto_2156269 - SURFACE
      ?auto_2156270 - SURFACE
      ?auto_2156271 - SURFACE
    )
    :vars
    (
      ?auto_2156272 - HOIST
      ?auto_2156273 - PLACE
      ?auto_2156274 - TRUCK
      ?auto_2156275 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156272 ?auto_2156273 ) ( SURFACE-AT ?auto_2156270 ?auto_2156273 ) ( CLEAR ?auto_2156270 ) ( IS-CRATE ?auto_2156271 ) ( not ( = ?auto_2156270 ?auto_2156271 ) ) ( AVAILABLE ?auto_2156272 ) ( IN ?auto_2156271 ?auto_2156274 ) ( ON ?auto_2156270 ?auto_2156269 ) ( not ( = ?auto_2156269 ?auto_2156270 ) ) ( not ( = ?auto_2156269 ?auto_2156271 ) ) ( TRUCK-AT ?auto_2156274 ?auto_2156275 ) ( not ( = ?auto_2156275 ?auto_2156273 ) ) ( ON ?auto_2156261 ?auto_2156260 ) ( ON ?auto_2156262 ?auto_2156261 ) ( ON ?auto_2156263 ?auto_2156262 ) ( ON ?auto_2156264 ?auto_2156263 ) ( ON ?auto_2156265 ?auto_2156264 ) ( ON ?auto_2156266 ?auto_2156265 ) ( ON ?auto_2156267 ?auto_2156266 ) ( ON ?auto_2156268 ?auto_2156267 ) ( ON ?auto_2156269 ?auto_2156268 ) ( not ( = ?auto_2156260 ?auto_2156261 ) ) ( not ( = ?auto_2156260 ?auto_2156262 ) ) ( not ( = ?auto_2156260 ?auto_2156263 ) ) ( not ( = ?auto_2156260 ?auto_2156264 ) ) ( not ( = ?auto_2156260 ?auto_2156265 ) ) ( not ( = ?auto_2156260 ?auto_2156266 ) ) ( not ( = ?auto_2156260 ?auto_2156267 ) ) ( not ( = ?auto_2156260 ?auto_2156268 ) ) ( not ( = ?auto_2156260 ?auto_2156269 ) ) ( not ( = ?auto_2156260 ?auto_2156270 ) ) ( not ( = ?auto_2156260 ?auto_2156271 ) ) ( not ( = ?auto_2156261 ?auto_2156262 ) ) ( not ( = ?auto_2156261 ?auto_2156263 ) ) ( not ( = ?auto_2156261 ?auto_2156264 ) ) ( not ( = ?auto_2156261 ?auto_2156265 ) ) ( not ( = ?auto_2156261 ?auto_2156266 ) ) ( not ( = ?auto_2156261 ?auto_2156267 ) ) ( not ( = ?auto_2156261 ?auto_2156268 ) ) ( not ( = ?auto_2156261 ?auto_2156269 ) ) ( not ( = ?auto_2156261 ?auto_2156270 ) ) ( not ( = ?auto_2156261 ?auto_2156271 ) ) ( not ( = ?auto_2156262 ?auto_2156263 ) ) ( not ( = ?auto_2156262 ?auto_2156264 ) ) ( not ( = ?auto_2156262 ?auto_2156265 ) ) ( not ( = ?auto_2156262 ?auto_2156266 ) ) ( not ( = ?auto_2156262 ?auto_2156267 ) ) ( not ( = ?auto_2156262 ?auto_2156268 ) ) ( not ( = ?auto_2156262 ?auto_2156269 ) ) ( not ( = ?auto_2156262 ?auto_2156270 ) ) ( not ( = ?auto_2156262 ?auto_2156271 ) ) ( not ( = ?auto_2156263 ?auto_2156264 ) ) ( not ( = ?auto_2156263 ?auto_2156265 ) ) ( not ( = ?auto_2156263 ?auto_2156266 ) ) ( not ( = ?auto_2156263 ?auto_2156267 ) ) ( not ( = ?auto_2156263 ?auto_2156268 ) ) ( not ( = ?auto_2156263 ?auto_2156269 ) ) ( not ( = ?auto_2156263 ?auto_2156270 ) ) ( not ( = ?auto_2156263 ?auto_2156271 ) ) ( not ( = ?auto_2156264 ?auto_2156265 ) ) ( not ( = ?auto_2156264 ?auto_2156266 ) ) ( not ( = ?auto_2156264 ?auto_2156267 ) ) ( not ( = ?auto_2156264 ?auto_2156268 ) ) ( not ( = ?auto_2156264 ?auto_2156269 ) ) ( not ( = ?auto_2156264 ?auto_2156270 ) ) ( not ( = ?auto_2156264 ?auto_2156271 ) ) ( not ( = ?auto_2156265 ?auto_2156266 ) ) ( not ( = ?auto_2156265 ?auto_2156267 ) ) ( not ( = ?auto_2156265 ?auto_2156268 ) ) ( not ( = ?auto_2156265 ?auto_2156269 ) ) ( not ( = ?auto_2156265 ?auto_2156270 ) ) ( not ( = ?auto_2156265 ?auto_2156271 ) ) ( not ( = ?auto_2156266 ?auto_2156267 ) ) ( not ( = ?auto_2156266 ?auto_2156268 ) ) ( not ( = ?auto_2156266 ?auto_2156269 ) ) ( not ( = ?auto_2156266 ?auto_2156270 ) ) ( not ( = ?auto_2156266 ?auto_2156271 ) ) ( not ( = ?auto_2156267 ?auto_2156268 ) ) ( not ( = ?auto_2156267 ?auto_2156269 ) ) ( not ( = ?auto_2156267 ?auto_2156270 ) ) ( not ( = ?auto_2156267 ?auto_2156271 ) ) ( not ( = ?auto_2156268 ?auto_2156269 ) ) ( not ( = ?auto_2156268 ?auto_2156270 ) ) ( not ( = ?auto_2156268 ?auto_2156271 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156269 ?auto_2156270 ?auto_2156271 )
      ( MAKE-11CRATE-VERIFY ?auto_2156260 ?auto_2156261 ?auto_2156262 ?auto_2156263 ?auto_2156264 ?auto_2156265 ?auto_2156266 ?auto_2156267 ?auto_2156268 ?auto_2156269 ?auto_2156270 ?auto_2156271 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156392 - SURFACE
      ?auto_2156393 - SURFACE
      ?auto_2156394 - SURFACE
      ?auto_2156395 - SURFACE
      ?auto_2156396 - SURFACE
      ?auto_2156397 - SURFACE
      ?auto_2156398 - SURFACE
      ?auto_2156399 - SURFACE
      ?auto_2156400 - SURFACE
      ?auto_2156401 - SURFACE
      ?auto_2156402 - SURFACE
      ?auto_2156403 - SURFACE
    )
    :vars
    (
      ?auto_2156405 - HOIST
      ?auto_2156404 - PLACE
      ?auto_2156408 - TRUCK
      ?auto_2156406 - PLACE
      ?auto_2156407 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156405 ?auto_2156404 ) ( SURFACE-AT ?auto_2156402 ?auto_2156404 ) ( CLEAR ?auto_2156402 ) ( IS-CRATE ?auto_2156403 ) ( not ( = ?auto_2156402 ?auto_2156403 ) ) ( AVAILABLE ?auto_2156405 ) ( ON ?auto_2156402 ?auto_2156401 ) ( not ( = ?auto_2156401 ?auto_2156402 ) ) ( not ( = ?auto_2156401 ?auto_2156403 ) ) ( TRUCK-AT ?auto_2156408 ?auto_2156406 ) ( not ( = ?auto_2156406 ?auto_2156404 ) ) ( HOIST-AT ?auto_2156407 ?auto_2156406 ) ( LIFTING ?auto_2156407 ?auto_2156403 ) ( not ( = ?auto_2156405 ?auto_2156407 ) ) ( ON ?auto_2156393 ?auto_2156392 ) ( ON ?auto_2156394 ?auto_2156393 ) ( ON ?auto_2156395 ?auto_2156394 ) ( ON ?auto_2156396 ?auto_2156395 ) ( ON ?auto_2156397 ?auto_2156396 ) ( ON ?auto_2156398 ?auto_2156397 ) ( ON ?auto_2156399 ?auto_2156398 ) ( ON ?auto_2156400 ?auto_2156399 ) ( ON ?auto_2156401 ?auto_2156400 ) ( not ( = ?auto_2156392 ?auto_2156393 ) ) ( not ( = ?auto_2156392 ?auto_2156394 ) ) ( not ( = ?auto_2156392 ?auto_2156395 ) ) ( not ( = ?auto_2156392 ?auto_2156396 ) ) ( not ( = ?auto_2156392 ?auto_2156397 ) ) ( not ( = ?auto_2156392 ?auto_2156398 ) ) ( not ( = ?auto_2156392 ?auto_2156399 ) ) ( not ( = ?auto_2156392 ?auto_2156400 ) ) ( not ( = ?auto_2156392 ?auto_2156401 ) ) ( not ( = ?auto_2156392 ?auto_2156402 ) ) ( not ( = ?auto_2156392 ?auto_2156403 ) ) ( not ( = ?auto_2156393 ?auto_2156394 ) ) ( not ( = ?auto_2156393 ?auto_2156395 ) ) ( not ( = ?auto_2156393 ?auto_2156396 ) ) ( not ( = ?auto_2156393 ?auto_2156397 ) ) ( not ( = ?auto_2156393 ?auto_2156398 ) ) ( not ( = ?auto_2156393 ?auto_2156399 ) ) ( not ( = ?auto_2156393 ?auto_2156400 ) ) ( not ( = ?auto_2156393 ?auto_2156401 ) ) ( not ( = ?auto_2156393 ?auto_2156402 ) ) ( not ( = ?auto_2156393 ?auto_2156403 ) ) ( not ( = ?auto_2156394 ?auto_2156395 ) ) ( not ( = ?auto_2156394 ?auto_2156396 ) ) ( not ( = ?auto_2156394 ?auto_2156397 ) ) ( not ( = ?auto_2156394 ?auto_2156398 ) ) ( not ( = ?auto_2156394 ?auto_2156399 ) ) ( not ( = ?auto_2156394 ?auto_2156400 ) ) ( not ( = ?auto_2156394 ?auto_2156401 ) ) ( not ( = ?auto_2156394 ?auto_2156402 ) ) ( not ( = ?auto_2156394 ?auto_2156403 ) ) ( not ( = ?auto_2156395 ?auto_2156396 ) ) ( not ( = ?auto_2156395 ?auto_2156397 ) ) ( not ( = ?auto_2156395 ?auto_2156398 ) ) ( not ( = ?auto_2156395 ?auto_2156399 ) ) ( not ( = ?auto_2156395 ?auto_2156400 ) ) ( not ( = ?auto_2156395 ?auto_2156401 ) ) ( not ( = ?auto_2156395 ?auto_2156402 ) ) ( not ( = ?auto_2156395 ?auto_2156403 ) ) ( not ( = ?auto_2156396 ?auto_2156397 ) ) ( not ( = ?auto_2156396 ?auto_2156398 ) ) ( not ( = ?auto_2156396 ?auto_2156399 ) ) ( not ( = ?auto_2156396 ?auto_2156400 ) ) ( not ( = ?auto_2156396 ?auto_2156401 ) ) ( not ( = ?auto_2156396 ?auto_2156402 ) ) ( not ( = ?auto_2156396 ?auto_2156403 ) ) ( not ( = ?auto_2156397 ?auto_2156398 ) ) ( not ( = ?auto_2156397 ?auto_2156399 ) ) ( not ( = ?auto_2156397 ?auto_2156400 ) ) ( not ( = ?auto_2156397 ?auto_2156401 ) ) ( not ( = ?auto_2156397 ?auto_2156402 ) ) ( not ( = ?auto_2156397 ?auto_2156403 ) ) ( not ( = ?auto_2156398 ?auto_2156399 ) ) ( not ( = ?auto_2156398 ?auto_2156400 ) ) ( not ( = ?auto_2156398 ?auto_2156401 ) ) ( not ( = ?auto_2156398 ?auto_2156402 ) ) ( not ( = ?auto_2156398 ?auto_2156403 ) ) ( not ( = ?auto_2156399 ?auto_2156400 ) ) ( not ( = ?auto_2156399 ?auto_2156401 ) ) ( not ( = ?auto_2156399 ?auto_2156402 ) ) ( not ( = ?auto_2156399 ?auto_2156403 ) ) ( not ( = ?auto_2156400 ?auto_2156401 ) ) ( not ( = ?auto_2156400 ?auto_2156402 ) ) ( not ( = ?auto_2156400 ?auto_2156403 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156401 ?auto_2156402 ?auto_2156403 )
      ( MAKE-11CRATE-VERIFY ?auto_2156392 ?auto_2156393 ?auto_2156394 ?auto_2156395 ?auto_2156396 ?auto_2156397 ?auto_2156398 ?auto_2156399 ?auto_2156400 ?auto_2156401 ?auto_2156402 ?auto_2156403 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156535 - SURFACE
      ?auto_2156536 - SURFACE
      ?auto_2156537 - SURFACE
      ?auto_2156538 - SURFACE
      ?auto_2156539 - SURFACE
      ?auto_2156540 - SURFACE
      ?auto_2156541 - SURFACE
      ?auto_2156542 - SURFACE
      ?auto_2156543 - SURFACE
      ?auto_2156544 - SURFACE
      ?auto_2156545 - SURFACE
      ?auto_2156546 - SURFACE
    )
    :vars
    (
      ?auto_2156551 - HOIST
      ?auto_2156547 - PLACE
      ?auto_2156552 - TRUCK
      ?auto_2156549 - PLACE
      ?auto_2156550 - HOIST
      ?auto_2156548 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156551 ?auto_2156547 ) ( SURFACE-AT ?auto_2156545 ?auto_2156547 ) ( CLEAR ?auto_2156545 ) ( IS-CRATE ?auto_2156546 ) ( not ( = ?auto_2156545 ?auto_2156546 ) ) ( AVAILABLE ?auto_2156551 ) ( ON ?auto_2156545 ?auto_2156544 ) ( not ( = ?auto_2156544 ?auto_2156545 ) ) ( not ( = ?auto_2156544 ?auto_2156546 ) ) ( TRUCK-AT ?auto_2156552 ?auto_2156549 ) ( not ( = ?auto_2156549 ?auto_2156547 ) ) ( HOIST-AT ?auto_2156550 ?auto_2156549 ) ( not ( = ?auto_2156551 ?auto_2156550 ) ) ( AVAILABLE ?auto_2156550 ) ( SURFACE-AT ?auto_2156546 ?auto_2156549 ) ( ON ?auto_2156546 ?auto_2156548 ) ( CLEAR ?auto_2156546 ) ( not ( = ?auto_2156545 ?auto_2156548 ) ) ( not ( = ?auto_2156546 ?auto_2156548 ) ) ( not ( = ?auto_2156544 ?auto_2156548 ) ) ( ON ?auto_2156536 ?auto_2156535 ) ( ON ?auto_2156537 ?auto_2156536 ) ( ON ?auto_2156538 ?auto_2156537 ) ( ON ?auto_2156539 ?auto_2156538 ) ( ON ?auto_2156540 ?auto_2156539 ) ( ON ?auto_2156541 ?auto_2156540 ) ( ON ?auto_2156542 ?auto_2156541 ) ( ON ?auto_2156543 ?auto_2156542 ) ( ON ?auto_2156544 ?auto_2156543 ) ( not ( = ?auto_2156535 ?auto_2156536 ) ) ( not ( = ?auto_2156535 ?auto_2156537 ) ) ( not ( = ?auto_2156535 ?auto_2156538 ) ) ( not ( = ?auto_2156535 ?auto_2156539 ) ) ( not ( = ?auto_2156535 ?auto_2156540 ) ) ( not ( = ?auto_2156535 ?auto_2156541 ) ) ( not ( = ?auto_2156535 ?auto_2156542 ) ) ( not ( = ?auto_2156535 ?auto_2156543 ) ) ( not ( = ?auto_2156535 ?auto_2156544 ) ) ( not ( = ?auto_2156535 ?auto_2156545 ) ) ( not ( = ?auto_2156535 ?auto_2156546 ) ) ( not ( = ?auto_2156535 ?auto_2156548 ) ) ( not ( = ?auto_2156536 ?auto_2156537 ) ) ( not ( = ?auto_2156536 ?auto_2156538 ) ) ( not ( = ?auto_2156536 ?auto_2156539 ) ) ( not ( = ?auto_2156536 ?auto_2156540 ) ) ( not ( = ?auto_2156536 ?auto_2156541 ) ) ( not ( = ?auto_2156536 ?auto_2156542 ) ) ( not ( = ?auto_2156536 ?auto_2156543 ) ) ( not ( = ?auto_2156536 ?auto_2156544 ) ) ( not ( = ?auto_2156536 ?auto_2156545 ) ) ( not ( = ?auto_2156536 ?auto_2156546 ) ) ( not ( = ?auto_2156536 ?auto_2156548 ) ) ( not ( = ?auto_2156537 ?auto_2156538 ) ) ( not ( = ?auto_2156537 ?auto_2156539 ) ) ( not ( = ?auto_2156537 ?auto_2156540 ) ) ( not ( = ?auto_2156537 ?auto_2156541 ) ) ( not ( = ?auto_2156537 ?auto_2156542 ) ) ( not ( = ?auto_2156537 ?auto_2156543 ) ) ( not ( = ?auto_2156537 ?auto_2156544 ) ) ( not ( = ?auto_2156537 ?auto_2156545 ) ) ( not ( = ?auto_2156537 ?auto_2156546 ) ) ( not ( = ?auto_2156537 ?auto_2156548 ) ) ( not ( = ?auto_2156538 ?auto_2156539 ) ) ( not ( = ?auto_2156538 ?auto_2156540 ) ) ( not ( = ?auto_2156538 ?auto_2156541 ) ) ( not ( = ?auto_2156538 ?auto_2156542 ) ) ( not ( = ?auto_2156538 ?auto_2156543 ) ) ( not ( = ?auto_2156538 ?auto_2156544 ) ) ( not ( = ?auto_2156538 ?auto_2156545 ) ) ( not ( = ?auto_2156538 ?auto_2156546 ) ) ( not ( = ?auto_2156538 ?auto_2156548 ) ) ( not ( = ?auto_2156539 ?auto_2156540 ) ) ( not ( = ?auto_2156539 ?auto_2156541 ) ) ( not ( = ?auto_2156539 ?auto_2156542 ) ) ( not ( = ?auto_2156539 ?auto_2156543 ) ) ( not ( = ?auto_2156539 ?auto_2156544 ) ) ( not ( = ?auto_2156539 ?auto_2156545 ) ) ( not ( = ?auto_2156539 ?auto_2156546 ) ) ( not ( = ?auto_2156539 ?auto_2156548 ) ) ( not ( = ?auto_2156540 ?auto_2156541 ) ) ( not ( = ?auto_2156540 ?auto_2156542 ) ) ( not ( = ?auto_2156540 ?auto_2156543 ) ) ( not ( = ?auto_2156540 ?auto_2156544 ) ) ( not ( = ?auto_2156540 ?auto_2156545 ) ) ( not ( = ?auto_2156540 ?auto_2156546 ) ) ( not ( = ?auto_2156540 ?auto_2156548 ) ) ( not ( = ?auto_2156541 ?auto_2156542 ) ) ( not ( = ?auto_2156541 ?auto_2156543 ) ) ( not ( = ?auto_2156541 ?auto_2156544 ) ) ( not ( = ?auto_2156541 ?auto_2156545 ) ) ( not ( = ?auto_2156541 ?auto_2156546 ) ) ( not ( = ?auto_2156541 ?auto_2156548 ) ) ( not ( = ?auto_2156542 ?auto_2156543 ) ) ( not ( = ?auto_2156542 ?auto_2156544 ) ) ( not ( = ?auto_2156542 ?auto_2156545 ) ) ( not ( = ?auto_2156542 ?auto_2156546 ) ) ( not ( = ?auto_2156542 ?auto_2156548 ) ) ( not ( = ?auto_2156543 ?auto_2156544 ) ) ( not ( = ?auto_2156543 ?auto_2156545 ) ) ( not ( = ?auto_2156543 ?auto_2156546 ) ) ( not ( = ?auto_2156543 ?auto_2156548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156544 ?auto_2156545 ?auto_2156546 )
      ( MAKE-11CRATE-VERIFY ?auto_2156535 ?auto_2156536 ?auto_2156537 ?auto_2156538 ?auto_2156539 ?auto_2156540 ?auto_2156541 ?auto_2156542 ?auto_2156543 ?auto_2156544 ?auto_2156545 ?auto_2156546 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156679 - SURFACE
      ?auto_2156680 - SURFACE
      ?auto_2156681 - SURFACE
      ?auto_2156682 - SURFACE
      ?auto_2156683 - SURFACE
      ?auto_2156684 - SURFACE
      ?auto_2156685 - SURFACE
      ?auto_2156686 - SURFACE
      ?auto_2156687 - SURFACE
      ?auto_2156688 - SURFACE
      ?auto_2156689 - SURFACE
      ?auto_2156690 - SURFACE
    )
    :vars
    (
      ?auto_2156691 - HOIST
      ?auto_2156696 - PLACE
      ?auto_2156692 - PLACE
      ?auto_2156695 - HOIST
      ?auto_2156693 - SURFACE
      ?auto_2156694 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156691 ?auto_2156696 ) ( SURFACE-AT ?auto_2156689 ?auto_2156696 ) ( CLEAR ?auto_2156689 ) ( IS-CRATE ?auto_2156690 ) ( not ( = ?auto_2156689 ?auto_2156690 ) ) ( AVAILABLE ?auto_2156691 ) ( ON ?auto_2156689 ?auto_2156688 ) ( not ( = ?auto_2156688 ?auto_2156689 ) ) ( not ( = ?auto_2156688 ?auto_2156690 ) ) ( not ( = ?auto_2156692 ?auto_2156696 ) ) ( HOIST-AT ?auto_2156695 ?auto_2156692 ) ( not ( = ?auto_2156691 ?auto_2156695 ) ) ( AVAILABLE ?auto_2156695 ) ( SURFACE-AT ?auto_2156690 ?auto_2156692 ) ( ON ?auto_2156690 ?auto_2156693 ) ( CLEAR ?auto_2156690 ) ( not ( = ?auto_2156689 ?auto_2156693 ) ) ( not ( = ?auto_2156690 ?auto_2156693 ) ) ( not ( = ?auto_2156688 ?auto_2156693 ) ) ( TRUCK-AT ?auto_2156694 ?auto_2156696 ) ( ON ?auto_2156680 ?auto_2156679 ) ( ON ?auto_2156681 ?auto_2156680 ) ( ON ?auto_2156682 ?auto_2156681 ) ( ON ?auto_2156683 ?auto_2156682 ) ( ON ?auto_2156684 ?auto_2156683 ) ( ON ?auto_2156685 ?auto_2156684 ) ( ON ?auto_2156686 ?auto_2156685 ) ( ON ?auto_2156687 ?auto_2156686 ) ( ON ?auto_2156688 ?auto_2156687 ) ( not ( = ?auto_2156679 ?auto_2156680 ) ) ( not ( = ?auto_2156679 ?auto_2156681 ) ) ( not ( = ?auto_2156679 ?auto_2156682 ) ) ( not ( = ?auto_2156679 ?auto_2156683 ) ) ( not ( = ?auto_2156679 ?auto_2156684 ) ) ( not ( = ?auto_2156679 ?auto_2156685 ) ) ( not ( = ?auto_2156679 ?auto_2156686 ) ) ( not ( = ?auto_2156679 ?auto_2156687 ) ) ( not ( = ?auto_2156679 ?auto_2156688 ) ) ( not ( = ?auto_2156679 ?auto_2156689 ) ) ( not ( = ?auto_2156679 ?auto_2156690 ) ) ( not ( = ?auto_2156679 ?auto_2156693 ) ) ( not ( = ?auto_2156680 ?auto_2156681 ) ) ( not ( = ?auto_2156680 ?auto_2156682 ) ) ( not ( = ?auto_2156680 ?auto_2156683 ) ) ( not ( = ?auto_2156680 ?auto_2156684 ) ) ( not ( = ?auto_2156680 ?auto_2156685 ) ) ( not ( = ?auto_2156680 ?auto_2156686 ) ) ( not ( = ?auto_2156680 ?auto_2156687 ) ) ( not ( = ?auto_2156680 ?auto_2156688 ) ) ( not ( = ?auto_2156680 ?auto_2156689 ) ) ( not ( = ?auto_2156680 ?auto_2156690 ) ) ( not ( = ?auto_2156680 ?auto_2156693 ) ) ( not ( = ?auto_2156681 ?auto_2156682 ) ) ( not ( = ?auto_2156681 ?auto_2156683 ) ) ( not ( = ?auto_2156681 ?auto_2156684 ) ) ( not ( = ?auto_2156681 ?auto_2156685 ) ) ( not ( = ?auto_2156681 ?auto_2156686 ) ) ( not ( = ?auto_2156681 ?auto_2156687 ) ) ( not ( = ?auto_2156681 ?auto_2156688 ) ) ( not ( = ?auto_2156681 ?auto_2156689 ) ) ( not ( = ?auto_2156681 ?auto_2156690 ) ) ( not ( = ?auto_2156681 ?auto_2156693 ) ) ( not ( = ?auto_2156682 ?auto_2156683 ) ) ( not ( = ?auto_2156682 ?auto_2156684 ) ) ( not ( = ?auto_2156682 ?auto_2156685 ) ) ( not ( = ?auto_2156682 ?auto_2156686 ) ) ( not ( = ?auto_2156682 ?auto_2156687 ) ) ( not ( = ?auto_2156682 ?auto_2156688 ) ) ( not ( = ?auto_2156682 ?auto_2156689 ) ) ( not ( = ?auto_2156682 ?auto_2156690 ) ) ( not ( = ?auto_2156682 ?auto_2156693 ) ) ( not ( = ?auto_2156683 ?auto_2156684 ) ) ( not ( = ?auto_2156683 ?auto_2156685 ) ) ( not ( = ?auto_2156683 ?auto_2156686 ) ) ( not ( = ?auto_2156683 ?auto_2156687 ) ) ( not ( = ?auto_2156683 ?auto_2156688 ) ) ( not ( = ?auto_2156683 ?auto_2156689 ) ) ( not ( = ?auto_2156683 ?auto_2156690 ) ) ( not ( = ?auto_2156683 ?auto_2156693 ) ) ( not ( = ?auto_2156684 ?auto_2156685 ) ) ( not ( = ?auto_2156684 ?auto_2156686 ) ) ( not ( = ?auto_2156684 ?auto_2156687 ) ) ( not ( = ?auto_2156684 ?auto_2156688 ) ) ( not ( = ?auto_2156684 ?auto_2156689 ) ) ( not ( = ?auto_2156684 ?auto_2156690 ) ) ( not ( = ?auto_2156684 ?auto_2156693 ) ) ( not ( = ?auto_2156685 ?auto_2156686 ) ) ( not ( = ?auto_2156685 ?auto_2156687 ) ) ( not ( = ?auto_2156685 ?auto_2156688 ) ) ( not ( = ?auto_2156685 ?auto_2156689 ) ) ( not ( = ?auto_2156685 ?auto_2156690 ) ) ( not ( = ?auto_2156685 ?auto_2156693 ) ) ( not ( = ?auto_2156686 ?auto_2156687 ) ) ( not ( = ?auto_2156686 ?auto_2156688 ) ) ( not ( = ?auto_2156686 ?auto_2156689 ) ) ( not ( = ?auto_2156686 ?auto_2156690 ) ) ( not ( = ?auto_2156686 ?auto_2156693 ) ) ( not ( = ?auto_2156687 ?auto_2156688 ) ) ( not ( = ?auto_2156687 ?auto_2156689 ) ) ( not ( = ?auto_2156687 ?auto_2156690 ) ) ( not ( = ?auto_2156687 ?auto_2156693 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156688 ?auto_2156689 ?auto_2156690 )
      ( MAKE-11CRATE-VERIFY ?auto_2156679 ?auto_2156680 ?auto_2156681 ?auto_2156682 ?auto_2156683 ?auto_2156684 ?auto_2156685 ?auto_2156686 ?auto_2156687 ?auto_2156688 ?auto_2156689 ?auto_2156690 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156823 - SURFACE
      ?auto_2156824 - SURFACE
      ?auto_2156825 - SURFACE
      ?auto_2156826 - SURFACE
      ?auto_2156827 - SURFACE
      ?auto_2156828 - SURFACE
      ?auto_2156829 - SURFACE
      ?auto_2156830 - SURFACE
      ?auto_2156831 - SURFACE
      ?auto_2156832 - SURFACE
      ?auto_2156833 - SURFACE
      ?auto_2156834 - SURFACE
    )
    :vars
    (
      ?auto_2156835 - HOIST
      ?auto_2156837 - PLACE
      ?auto_2156839 - PLACE
      ?auto_2156840 - HOIST
      ?auto_2156836 - SURFACE
      ?auto_2156838 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156835 ?auto_2156837 ) ( IS-CRATE ?auto_2156834 ) ( not ( = ?auto_2156833 ?auto_2156834 ) ) ( not ( = ?auto_2156832 ?auto_2156833 ) ) ( not ( = ?auto_2156832 ?auto_2156834 ) ) ( not ( = ?auto_2156839 ?auto_2156837 ) ) ( HOIST-AT ?auto_2156840 ?auto_2156839 ) ( not ( = ?auto_2156835 ?auto_2156840 ) ) ( AVAILABLE ?auto_2156840 ) ( SURFACE-AT ?auto_2156834 ?auto_2156839 ) ( ON ?auto_2156834 ?auto_2156836 ) ( CLEAR ?auto_2156834 ) ( not ( = ?auto_2156833 ?auto_2156836 ) ) ( not ( = ?auto_2156834 ?auto_2156836 ) ) ( not ( = ?auto_2156832 ?auto_2156836 ) ) ( TRUCK-AT ?auto_2156838 ?auto_2156837 ) ( SURFACE-AT ?auto_2156832 ?auto_2156837 ) ( CLEAR ?auto_2156832 ) ( LIFTING ?auto_2156835 ?auto_2156833 ) ( IS-CRATE ?auto_2156833 ) ( ON ?auto_2156824 ?auto_2156823 ) ( ON ?auto_2156825 ?auto_2156824 ) ( ON ?auto_2156826 ?auto_2156825 ) ( ON ?auto_2156827 ?auto_2156826 ) ( ON ?auto_2156828 ?auto_2156827 ) ( ON ?auto_2156829 ?auto_2156828 ) ( ON ?auto_2156830 ?auto_2156829 ) ( ON ?auto_2156831 ?auto_2156830 ) ( ON ?auto_2156832 ?auto_2156831 ) ( not ( = ?auto_2156823 ?auto_2156824 ) ) ( not ( = ?auto_2156823 ?auto_2156825 ) ) ( not ( = ?auto_2156823 ?auto_2156826 ) ) ( not ( = ?auto_2156823 ?auto_2156827 ) ) ( not ( = ?auto_2156823 ?auto_2156828 ) ) ( not ( = ?auto_2156823 ?auto_2156829 ) ) ( not ( = ?auto_2156823 ?auto_2156830 ) ) ( not ( = ?auto_2156823 ?auto_2156831 ) ) ( not ( = ?auto_2156823 ?auto_2156832 ) ) ( not ( = ?auto_2156823 ?auto_2156833 ) ) ( not ( = ?auto_2156823 ?auto_2156834 ) ) ( not ( = ?auto_2156823 ?auto_2156836 ) ) ( not ( = ?auto_2156824 ?auto_2156825 ) ) ( not ( = ?auto_2156824 ?auto_2156826 ) ) ( not ( = ?auto_2156824 ?auto_2156827 ) ) ( not ( = ?auto_2156824 ?auto_2156828 ) ) ( not ( = ?auto_2156824 ?auto_2156829 ) ) ( not ( = ?auto_2156824 ?auto_2156830 ) ) ( not ( = ?auto_2156824 ?auto_2156831 ) ) ( not ( = ?auto_2156824 ?auto_2156832 ) ) ( not ( = ?auto_2156824 ?auto_2156833 ) ) ( not ( = ?auto_2156824 ?auto_2156834 ) ) ( not ( = ?auto_2156824 ?auto_2156836 ) ) ( not ( = ?auto_2156825 ?auto_2156826 ) ) ( not ( = ?auto_2156825 ?auto_2156827 ) ) ( not ( = ?auto_2156825 ?auto_2156828 ) ) ( not ( = ?auto_2156825 ?auto_2156829 ) ) ( not ( = ?auto_2156825 ?auto_2156830 ) ) ( not ( = ?auto_2156825 ?auto_2156831 ) ) ( not ( = ?auto_2156825 ?auto_2156832 ) ) ( not ( = ?auto_2156825 ?auto_2156833 ) ) ( not ( = ?auto_2156825 ?auto_2156834 ) ) ( not ( = ?auto_2156825 ?auto_2156836 ) ) ( not ( = ?auto_2156826 ?auto_2156827 ) ) ( not ( = ?auto_2156826 ?auto_2156828 ) ) ( not ( = ?auto_2156826 ?auto_2156829 ) ) ( not ( = ?auto_2156826 ?auto_2156830 ) ) ( not ( = ?auto_2156826 ?auto_2156831 ) ) ( not ( = ?auto_2156826 ?auto_2156832 ) ) ( not ( = ?auto_2156826 ?auto_2156833 ) ) ( not ( = ?auto_2156826 ?auto_2156834 ) ) ( not ( = ?auto_2156826 ?auto_2156836 ) ) ( not ( = ?auto_2156827 ?auto_2156828 ) ) ( not ( = ?auto_2156827 ?auto_2156829 ) ) ( not ( = ?auto_2156827 ?auto_2156830 ) ) ( not ( = ?auto_2156827 ?auto_2156831 ) ) ( not ( = ?auto_2156827 ?auto_2156832 ) ) ( not ( = ?auto_2156827 ?auto_2156833 ) ) ( not ( = ?auto_2156827 ?auto_2156834 ) ) ( not ( = ?auto_2156827 ?auto_2156836 ) ) ( not ( = ?auto_2156828 ?auto_2156829 ) ) ( not ( = ?auto_2156828 ?auto_2156830 ) ) ( not ( = ?auto_2156828 ?auto_2156831 ) ) ( not ( = ?auto_2156828 ?auto_2156832 ) ) ( not ( = ?auto_2156828 ?auto_2156833 ) ) ( not ( = ?auto_2156828 ?auto_2156834 ) ) ( not ( = ?auto_2156828 ?auto_2156836 ) ) ( not ( = ?auto_2156829 ?auto_2156830 ) ) ( not ( = ?auto_2156829 ?auto_2156831 ) ) ( not ( = ?auto_2156829 ?auto_2156832 ) ) ( not ( = ?auto_2156829 ?auto_2156833 ) ) ( not ( = ?auto_2156829 ?auto_2156834 ) ) ( not ( = ?auto_2156829 ?auto_2156836 ) ) ( not ( = ?auto_2156830 ?auto_2156831 ) ) ( not ( = ?auto_2156830 ?auto_2156832 ) ) ( not ( = ?auto_2156830 ?auto_2156833 ) ) ( not ( = ?auto_2156830 ?auto_2156834 ) ) ( not ( = ?auto_2156830 ?auto_2156836 ) ) ( not ( = ?auto_2156831 ?auto_2156832 ) ) ( not ( = ?auto_2156831 ?auto_2156833 ) ) ( not ( = ?auto_2156831 ?auto_2156834 ) ) ( not ( = ?auto_2156831 ?auto_2156836 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156832 ?auto_2156833 ?auto_2156834 )
      ( MAKE-11CRATE-VERIFY ?auto_2156823 ?auto_2156824 ?auto_2156825 ?auto_2156826 ?auto_2156827 ?auto_2156828 ?auto_2156829 ?auto_2156830 ?auto_2156831 ?auto_2156832 ?auto_2156833 ?auto_2156834 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2156967 - SURFACE
      ?auto_2156968 - SURFACE
      ?auto_2156969 - SURFACE
      ?auto_2156970 - SURFACE
      ?auto_2156971 - SURFACE
      ?auto_2156972 - SURFACE
      ?auto_2156973 - SURFACE
      ?auto_2156974 - SURFACE
      ?auto_2156975 - SURFACE
      ?auto_2156976 - SURFACE
      ?auto_2156977 - SURFACE
      ?auto_2156978 - SURFACE
    )
    :vars
    (
      ?auto_2156979 - HOIST
      ?auto_2156981 - PLACE
      ?auto_2156982 - PLACE
      ?auto_2156980 - HOIST
      ?auto_2156983 - SURFACE
      ?auto_2156984 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2156979 ?auto_2156981 ) ( IS-CRATE ?auto_2156978 ) ( not ( = ?auto_2156977 ?auto_2156978 ) ) ( not ( = ?auto_2156976 ?auto_2156977 ) ) ( not ( = ?auto_2156976 ?auto_2156978 ) ) ( not ( = ?auto_2156982 ?auto_2156981 ) ) ( HOIST-AT ?auto_2156980 ?auto_2156982 ) ( not ( = ?auto_2156979 ?auto_2156980 ) ) ( AVAILABLE ?auto_2156980 ) ( SURFACE-AT ?auto_2156978 ?auto_2156982 ) ( ON ?auto_2156978 ?auto_2156983 ) ( CLEAR ?auto_2156978 ) ( not ( = ?auto_2156977 ?auto_2156983 ) ) ( not ( = ?auto_2156978 ?auto_2156983 ) ) ( not ( = ?auto_2156976 ?auto_2156983 ) ) ( TRUCK-AT ?auto_2156984 ?auto_2156981 ) ( SURFACE-AT ?auto_2156976 ?auto_2156981 ) ( CLEAR ?auto_2156976 ) ( IS-CRATE ?auto_2156977 ) ( AVAILABLE ?auto_2156979 ) ( IN ?auto_2156977 ?auto_2156984 ) ( ON ?auto_2156968 ?auto_2156967 ) ( ON ?auto_2156969 ?auto_2156968 ) ( ON ?auto_2156970 ?auto_2156969 ) ( ON ?auto_2156971 ?auto_2156970 ) ( ON ?auto_2156972 ?auto_2156971 ) ( ON ?auto_2156973 ?auto_2156972 ) ( ON ?auto_2156974 ?auto_2156973 ) ( ON ?auto_2156975 ?auto_2156974 ) ( ON ?auto_2156976 ?auto_2156975 ) ( not ( = ?auto_2156967 ?auto_2156968 ) ) ( not ( = ?auto_2156967 ?auto_2156969 ) ) ( not ( = ?auto_2156967 ?auto_2156970 ) ) ( not ( = ?auto_2156967 ?auto_2156971 ) ) ( not ( = ?auto_2156967 ?auto_2156972 ) ) ( not ( = ?auto_2156967 ?auto_2156973 ) ) ( not ( = ?auto_2156967 ?auto_2156974 ) ) ( not ( = ?auto_2156967 ?auto_2156975 ) ) ( not ( = ?auto_2156967 ?auto_2156976 ) ) ( not ( = ?auto_2156967 ?auto_2156977 ) ) ( not ( = ?auto_2156967 ?auto_2156978 ) ) ( not ( = ?auto_2156967 ?auto_2156983 ) ) ( not ( = ?auto_2156968 ?auto_2156969 ) ) ( not ( = ?auto_2156968 ?auto_2156970 ) ) ( not ( = ?auto_2156968 ?auto_2156971 ) ) ( not ( = ?auto_2156968 ?auto_2156972 ) ) ( not ( = ?auto_2156968 ?auto_2156973 ) ) ( not ( = ?auto_2156968 ?auto_2156974 ) ) ( not ( = ?auto_2156968 ?auto_2156975 ) ) ( not ( = ?auto_2156968 ?auto_2156976 ) ) ( not ( = ?auto_2156968 ?auto_2156977 ) ) ( not ( = ?auto_2156968 ?auto_2156978 ) ) ( not ( = ?auto_2156968 ?auto_2156983 ) ) ( not ( = ?auto_2156969 ?auto_2156970 ) ) ( not ( = ?auto_2156969 ?auto_2156971 ) ) ( not ( = ?auto_2156969 ?auto_2156972 ) ) ( not ( = ?auto_2156969 ?auto_2156973 ) ) ( not ( = ?auto_2156969 ?auto_2156974 ) ) ( not ( = ?auto_2156969 ?auto_2156975 ) ) ( not ( = ?auto_2156969 ?auto_2156976 ) ) ( not ( = ?auto_2156969 ?auto_2156977 ) ) ( not ( = ?auto_2156969 ?auto_2156978 ) ) ( not ( = ?auto_2156969 ?auto_2156983 ) ) ( not ( = ?auto_2156970 ?auto_2156971 ) ) ( not ( = ?auto_2156970 ?auto_2156972 ) ) ( not ( = ?auto_2156970 ?auto_2156973 ) ) ( not ( = ?auto_2156970 ?auto_2156974 ) ) ( not ( = ?auto_2156970 ?auto_2156975 ) ) ( not ( = ?auto_2156970 ?auto_2156976 ) ) ( not ( = ?auto_2156970 ?auto_2156977 ) ) ( not ( = ?auto_2156970 ?auto_2156978 ) ) ( not ( = ?auto_2156970 ?auto_2156983 ) ) ( not ( = ?auto_2156971 ?auto_2156972 ) ) ( not ( = ?auto_2156971 ?auto_2156973 ) ) ( not ( = ?auto_2156971 ?auto_2156974 ) ) ( not ( = ?auto_2156971 ?auto_2156975 ) ) ( not ( = ?auto_2156971 ?auto_2156976 ) ) ( not ( = ?auto_2156971 ?auto_2156977 ) ) ( not ( = ?auto_2156971 ?auto_2156978 ) ) ( not ( = ?auto_2156971 ?auto_2156983 ) ) ( not ( = ?auto_2156972 ?auto_2156973 ) ) ( not ( = ?auto_2156972 ?auto_2156974 ) ) ( not ( = ?auto_2156972 ?auto_2156975 ) ) ( not ( = ?auto_2156972 ?auto_2156976 ) ) ( not ( = ?auto_2156972 ?auto_2156977 ) ) ( not ( = ?auto_2156972 ?auto_2156978 ) ) ( not ( = ?auto_2156972 ?auto_2156983 ) ) ( not ( = ?auto_2156973 ?auto_2156974 ) ) ( not ( = ?auto_2156973 ?auto_2156975 ) ) ( not ( = ?auto_2156973 ?auto_2156976 ) ) ( not ( = ?auto_2156973 ?auto_2156977 ) ) ( not ( = ?auto_2156973 ?auto_2156978 ) ) ( not ( = ?auto_2156973 ?auto_2156983 ) ) ( not ( = ?auto_2156974 ?auto_2156975 ) ) ( not ( = ?auto_2156974 ?auto_2156976 ) ) ( not ( = ?auto_2156974 ?auto_2156977 ) ) ( not ( = ?auto_2156974 ?auto_2156978 ) ) ( not ( = ?auto_2156974 ?auto_2156983 ) ) ( not ( = ?auto_2156975 ?auto_2156976 ) ) ( not ( = ?auto_2156975 ?auto_2156977 ) ) ( not ( = ?auto_2156975 ?auto_2156978 ) ) ( not ( = ?auto_2156975 ?auto_2156983 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2156976 ?auto_2156977 ?auto_2156978 )
      ( MAKE-11CRATE-VERIFY ?auto_2156967 ?auto_2156968 ?auto_2156969 ?auto_2156970 ?auto_2156971 ?auto_2156972 ?auto_2156973 ?auto_2156974 ?auto_2156975 ?auto_2156976 ?auto_2156977 ?auto_2156978 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166240 - SURFACE
      ?auto_2166241 - SURFACE
      ?auto_2166242 - SURFACE
      ?auto_2166243 - SURFACE
      ?auto_2166244 - SURFACE
      ?auto_2166245 - SURFACE
      ?auto_2166246 - SURFACE
      ?auto_2166247 - SURFACE
      ?auto_2166248 - SURFACE
      ?auto_2166249 - SURFACE
      ?auto_2166250 - SURFACE
      ?auto_2166251 - SURFACE
      ?auto_2166252 - SURFACE
    )
    :vars
    (
      ?auto_2166253 - HOIST
      ?auto_2166254 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166253 ?auto_2166254 ) ( SURFACE-AT ?auto_2166251 ?auto_2166254 ) ( CLEAR ?auto_2166251 ) ( LIFTING ?auto_2166253 ?auto_2166252 ) ( IS-CRATE ?auto_2166252 ) ( not ( = ?auto_2166251 ?auto_2166252 ) ) ( ON ?auto_2166241 ?auto_2166240 ) ( ON ?auto_2166242 ?auto_2166241 ) ( ON ?auto_2166243 ?auto_2166242 ) ( ON ?auto_2166244 ?auto_2166243 ) ( ON ?auto_2166245 ?auto_2166244 ) ( ON ?auto_2166246 ?auto_2166245 ) ( ON ?auto_2166247 ?auto_2166246 ) ( ON ?auto_2166248 ?auto_2166247 ) ( ON ?auto_2166249 ?auto_2166248 ) ( ON ?auto_2166250 ?auto_2166249 ) ( ON ?auto_2166251 ?auto_2166250 ) ( not ( = ?auto_2166240 ?auto_2166241 ) ) ( not ( = ?auto_2166240 ?auto_2166242 ) ) ( not ( = ?auto_2166240 ?auto_2166243 ) ) ( not ( = ?auto_2166240 ?auto_2166244 ) ) ( not ( = ?auto_2166240 ?auto_2166245 ) ) ( not ( = ?auto_2166240 ?auto_2166246 ) ) ( not ( = ?auto_2166240 ?auto_2166247 ) ) ( not ( = ?auto_2166240 ?auto_2166248 ) ) ( not ( = ?auto_2166240 ?auto_2166249 ) ) ( not ( = ?auto_2166240 ?auto_2166250 ) ) ( not ( = ?auto_2166240 ?auto_2166251 ) ) ( not ( = ?auto_2166240 ?auto_2166252 ) ) ( not ( = ?auto_2166241 ?auto_2166242 ) ) ( not ( = ?auto_2166241 ?auto_2166243 ) ) ( not ( = ?auto_2166241 ?auto_2166244 ) ) ( not ( = ?auto_2166241 ?auto_2166245 ) ) ( not ( = ?auto_2166241 ?auto_2166246 ) ) ( not ( = ?auto_2166241 ?auto_2166247 ) ) ( not ( = ?auto_2166241 ?auto_2166248 ) ) ( not ( = ?auto_2166241 ?auto_2166249 ) ) ( not ( = ?auto_2166241 ?auto_2166250 ) ) ( not ( = ?auto_2166241 ?auto_2166251 ) ) ( not ( = ?auto_2166241 ?auto_2166252 ) ) ( not ( = ?auto_2166242 ?auto_2166243 ) ) ( not ( = ?auto_2166242 ?auto_2166244 ) ) ( not ( = ?auto_2166242 ?auto_2166245 ) ) ( not ( = ?auto_2166242 ?auto_2166246 ) ) ( not ( = ?auto_2166242 ?auto_2166247 ) ) ( not ( = ?auto_2166242 ?auto_2166248 ) ) ( not ( = ?auto_2166242 ?auto_2166249 ) ) ( not ( = ?auto_2166242 ?auto_2166250 ) ) ( not ( = ?auto_2166242 ?auto_2166251 ) ) ( not ( = ?auto_2166242 ?auto_2166252 ) ) ( not ( = ?auto_2166243 ?auto_2166244 ) ) ( not ( = ?auto_2166243 ?auto_2166245 ) ) ( not ( = ?auto_2166243 ?auto_2166246 ) ) ( not ( = ?auto_2166243 ?auto_2166247 ) ) ( not ( = ?auto_2166243 ?auto_2166248 ) ) ( not ( = ?auto_2166243 ?auto_2166249 ) ) ( not ( = ?auto_2166243 ?auto_2166250 ) ) ( not ( = ?auto_2166243 ?auto_2166251 ) ) ( not ( = ?auto_2166243 ?auto_2166252 ) ) ( not ( = ?auto_2166244 ?auto_2166245 ) ) ( not ( = ?auto_2166244 ?auto_2166246 ) ) ( not ( = ?auto_2166244 ?auto_2166247 ) ) ( not ( = ?auto_2166244 ?auto_2166248 ) ) ( not ( = ?auto_2166244 ?auto_2166249 ) ) ( not ( = ?auto_2166244 ?auto_2166250 ) ) ( not ( = ?auto_2166244 ?auto_2166251 ) ) ( not ( = ?auto_2166244 ?auto_2166252 ) ) ( not ( = ?auto_2166245 ?auto_2166246 ) ) ( not ( = ?auto_2166245 ?auto_2166247 ) ) ( not ( = ?auto_2166245 ?auto_2166248 ) ) ( not ( = ?auto_2166245 ?auto_2166249 ) ) ( not ( = ?auto_2166245 ?auto_2166250 ) ) ( not ( = ?auto_2166245 ?auto_2166251 ) ) ( not ( = ?auto_2166245 ?auto_2166252 ) ) ( not ( = ?auto_2166246 ?auto_2166247 ) ) ( not ( = ?auto_2166246 ?auto_2166248 ) ) ( not ( = ?auto_2166246 ?auto_2166249 ) ) ( not ( = ?auto_2166246 ?auto_2166250 ) ) ( not ( = ?auto_2166246 ?auto_2166251 ) ) ( not ( = ?auto_2166246 ?auto_2166252 ) ) ( not ( = ?auto_2166247 ?auto_2166248 ) ) ( not ( = ?auto_2166247 ?auto_2166249 ) ) ( not ( = ?auto_2166247 ?auto_2166250 ) ) ( not ( = ?auto_2166247 ?auto_2166251 ) ) ( not ( = ?auto_2166247 ?auto_2166252 ) ) ( not ( = ?auto_2166248 ?auto_2166249 ) ) ( not ( = ?auto_2166248 ?auto_2166250 ) ) ( not ( = ?auto_2166248 ?auto_2166251 ) ) ( not ( = ?auto_2166248 ?auto_2166252 ) ) ( not ( = ?auto_2166249 ?auto_2166250 ) ) ( not ( = ?auto_2166249 ?auto_2166251 ) ) ( not ( = ?auto_2166249 ?auto_2166252 ) ) ( not ( = ?auto_2166250 ?auto_2166251 ) ) ( not ( = ?auto_2166250 ?auto_2166252 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2166251 ?auto_2166252 )
      ( MAKE-12CRATE-VERIFY ?auto_2166240 ?auto_2166241 ?auto_2166242 ?auto_2166243 ?auto_2166244 ?auto_2166245 ?auto_2166246 ?auto_2166247 ?auto_2166248 ?auto_2166249 ?auto_2166250 ?auto_2166251 ?auto_2166252 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166365 - SURFACE
      ?auto_2166366 - SURFACE
      ?auto_2166367 - SURFACE
      ?auto_2166368 - SURFACE
      ?auto_2166369 - SURFACE
      ?auto_2166370 - SURFACE
      ?auto_2166371 - SURFACE
      ?auto_2166372 - SURFACE
      ?auto_2166373 - SURFACE
      ?auto_2166374 - SURFACE
      ?auto_2166375 - SURFACE
      ?auto_2166376 - SURFACE
      ?auto_2166377 - SURFACE
    )
    :vars
    (
      ?auto_2166380 - HOIST
      ?auto_2166379 - PLACE
      ?auto_2166378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166380 ?auto_2166379 ) ( SURFACE-AT ?auto_2166376 ?auto_2166379 ) ( CLEAR ?auto_2166376 ) ( IS-CRATE ?auto_2166377 ) ( not ( = ?auto_2166376 ?auto_2166377 ) ) ( TRUCK-AT ?auto_2166378 ?auto_2166379 ) ( AVAILABLE ?auto_2166380 ) ( IN ?auto_2166377 ?auto_2166378 ) ( ON ?auto_2166376 ?auto_2166375 ) ( not ( = ?auto_2166375 ?auto_2166376 ) ) ( not ( = ?auto_2166375 ?auto_2166377 ) ) ( ON ?auto_2166366 ?auto_2166365 ) ( ON ?auto_2166367 ?auto_2166366 ) ( ON ?auto_2166368 ?auto_2166367 ) ( ON ?auto_2166369 ?auto_2166368 ) ( ON ?auto_2166370 ?auto_2166369 ) ( ON ?auto_2166371 ?auto_2166370 ) ( ON ?auto_2166372 ?auto_2166371 ) ( ON ?auto_2166373 ?auto_2166372 ) ( ON ?auto_2166374 ?auto_2166373 ) ( ON ?auto_2166375 ?auto_2166374 ) ( not ( = ?auto_2166365 ?auto_2166366 ) ) ( not ( = ?auto_2166365 ?auto_2166367 ) ) ( not ( = ?auto_2166365 ?auto_2166368 ) ) ( not ( = ?auto_2166365 ?auto_2166369 ) ) ( not ( = ?auto_2166365 ?auto_2166370 ) ) ( not ( = ?auto_2166365 ?auto_2166371 ) ) ( not ( = ?auto_2166365 ?auto_2166372 ) ) ( not ( = ?auto_2166365 ?auto_2166373 ) ) ( not ( = ?auto_2166365 ?auto_2166374 ) ) ( not ( = ?auto_2166365 ?auto_2166375 ) ) ( not ( = ?auto_2166365 ?auto_2166376 ) ) ( not ( = ?auto_2166365 ?auto_2166377 ) ) ( not ( = ?auto_2166366 ?auto_2166367 ) ) ( not ( = ?auto_2166366 ?auto_2166368 ) ) ( not ( = ?auto_2166366 ?auto_2166369 ) ) ( not ( = ?auto_2166366 ?auto_2166370 ) ) ( not ( = ?auto_2166366 ?auto_2166371 ) ) ( not ( = ?auto_2166366 ?auto_2166372 ) ) ( not ( = ?auto_2166366 ?auto_2166373 ) ) ( not ( = ?auto_2166366 ?auto_2166374 ) ) ( not ( = ?auto_2166366 ?auto_2166375 ) ) ( not ( = ?auto_2166366 ?auto_2166376 ) ) ( not ( = ?auto_2166366 ?auto_2166377 ) ) ( not ( = ?auto_2166367 ?auto_2166368 ) ) ( not ( = ?auto_2166367 ?auto_2166369 ) ) ( not ( = ?auto_2166367 ?auto_2166370 ) ) ( not ( = ?auto_2166367 ?auto_2166371 ) ) ( not ( = ?auto_2166367 ?auto_2166372 ) ) ( not ( = ?auto_2166367 ?auto_2166373 ) ) ( not ( = ?auto_2166367 ?auto_2166374 ) ) ( not ( = ?auto_2166367 ?auto_2166375 ) ) ( not ( = ?auto_2166367 ?auto_2166376 ) ) ( not ( = ?auto_2166367 ?auto_2166377 ) ) ( not ( = ?auto_2166368 ?auto_2166369 ) ) ( not ( = ?auto_2166368 ?auto_2166370 ) ) ( not ( = ?auto_2166368 ?auto_2166371 ) ) ( not ( = ?auto_2166368 ?auto_2166372 ) ) ( not ( = ?auto_2166368 ?auto_2166373 ) ) ( not ( = ?auto_2166368 ?auto_2166374 ) ) ( not ( = ?auto_2166368 ?auto_2166375 ) ) ( not ( = ?auto_2166368 ?auto_2166376 ) ) ( not ( = ?auto_2166368 ?auto_2166377 ) ) ( not ( = ?auto_2166369 ?auto_2166370 ) ) ( not ( = ?auto_2166369 ?auto_2166371 ) ) ( not ( = ?auto_2166369 ?auto_2166372 ) ) ( not ( = ?auto_2166369 ?auto_2166373 ) ) ( not ( = ?auto_2166369 ?auto_2166374 ) ) ( not ( = ?auto_2166369 ?auto_2166375 ) ) ( not ( = ?auto_2166369 ?auto_2166376 ) ) ( not ( = ?auto_2166369 ?auto_2166377 ) ) ( not ( = ?auto_2166370 ?auto_2166371 ) ) ( not ( = ?auto_2166370 ?auto_2166372 ) ) ( not ( = ?auto_2166370 ?auto_2166373 ) ) ( not ( = ?auto_2166370 ?auto_2166374 ) ) ( not ( = ?auto_2166370 ?auto_2166375 ) ) ( not ( = ?auto_2166370 ?auto_2166376 ) ) ( not ( = ?auto_2166370 ?auto_2166377 ) ) ( not ( = ?auto_2166371 ?auto_2166372 ) ) ( not ( = ?auto_2166371 ?auto_2166373 ) ) ( not ( = ?auto_2166371 ?auto_2166374 ) ) ( not ( = ?auto_2166371 ?auto_2166375 ) ) ( not ( = ?auto_2166371 ?auto_2166376 ) ) ( not ( = ?auto_2166371 ?auto_2166377 ) ) ( not ( = ?auto_2166372 ?auto_2166373 ) ) ( not ( = ?auto_2166372 ?auto_2166374 ) ) ( not ( = ?auto_2166372 ?auto_2166375 ) ) ( not ( = ?auto_2166372 ?auto_2166376 ) ) ( not ( = ?auto_2166372 ?auto_2166377 ) ) ( not ( = ?auto_2166373 ?auto_2166374 ) ) ( not ( = ?auto_2166373 ?auto_2166375 ) ) ( not ( = ?auto_2166373 ?auto_2166376 ) ) ( not ( = ?auto_2166373 ?auto_2166377 ) ) ( not ( = ?auto_2166374 ?auto_2166375 ) ) ( not ( = ?auto_2166374 ?auto_2166376 ) ) ( not ( = ?auto_2166374 ?auto_2166377 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166375 ?auto_2166376 ?auto_2166377 )
      ( MAKE-12CRATE-VERIFY ?auto_2166365 ?auto_2166366 ?auto_2166367 ?auto_2166368 ?auto_2166369 ?auto_2166370 ?auto_2166371 ?auto_2166372 ?auto_2166373 ?auto_2166374 ?auto_2166375 ?auto_2166376 ?auto_2166377 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166503 - SURFACE
      ?auto_2166504 - SURFACE
      ?auto_2166505 - SURFACE
      ?auto_2166506 - SURFACE
      ?auto_2166507 - SURFACE
      ?auto_2166508 - SURFACE
      ?auto_2166509 - SURFACE
      ?auto_2166510 - SURFACE
      ?auto_2166511 - SURFACE
      ?auto_2166512 - SURFACE
      ?auto_2166513 - SURFACE
      ?auto_2166514 - SURFACE
      ?auto_2166515 - SURFACE
    )
    :vars
    (
      ?auto_2166516 - HOIST
      ?auto_2166517 - PLACE
      ?auto_2166519 - TRUCK
      ?auto_2166518 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166516 ?auto_2166517 ) ( SURFACE-AT ?auto_2166514 ?auto_2166517 ) ( CLEAR ?auto_2166514 ) ( IS-CRATE ?auto_2166515 ) ( not ( = ?auto_2166514 ?auto_2166515 ) ) ( AVAILABLE ?auto_2166516 ) ( IN ?auto_2166515 ?auto_2166519 ) ( ON ?auto_2166514 ?auto_2166513 ) ( not ( = ?auto_2166513 ?auto_2166514 ) ) ( not ( = ?auto_2166513 ?auto_2166515 ) ) ( TRUCK-AT ?auto_2166519 ?auto_2166518 ) ( not ( = ?auto_2166518 ?auto_2166517 ) ) ( ON ?auto_2166504 ?auto_2166503 ) ( ON ?auto_2166505 ?auto_2166504 ) ( ON ?auto_2166506 ?auto_2166505 ) ( ON ?auto_2166507 ?auto_2166506 ) ( ON ?auto_2166508 ?auto_2166507 ) ( ON ?auto_2166509 ?auto_2166508 ) ( ON ?auto_2166510 ?auto_2166509 ) ( ON ?auto_2166511 ?auto_2166510 ) ( ON ?auto_2166512 ?auto_2166511 ) ( ON ?auto_2166513 ?auto_2166512 ) ( not ( = ?auto_2166503 ?auto_2166504 ) ) ( not ( = ?auto_2166503 ?auto_2166505 ) ) ( not ( = ?auto_2166503 ?auto_2166506 ) ) ( not ( = ?auto_2166503 ?auto_2166507 ) ) ( not ( = ?auto_2166503 ?auto_2166508 ) ) ( not ( = ?auto_2166503 ?auto_2166509 ) ) ( not ( = ?auto_2166503 ?auto_2166510 ) ) ( not ( = ?auto_2166503 ?auto_2166511 ) ) ( not ( = ?auto_2166503 ?auto_2166512 ) ) ( not ( = ?auto_2166503 ?auto_2166513 ) ) ( not ( = ?auto_2166503 ?auto_2166514 ) ) ( not ( = ?auto_2166503 ?auto_2166515 ) ) ( not ( = ?auto_2166504 ?auto_2166505 ) ) ( not ( = ?auto_2166504 ?auto_2166506 ) ) ( not ( = ?auto_2166504 ?auto_2166507 ) ) ( not ( = ?auto_2166504 ?auto_2166508 ) ) ( not ( = ?auto_2166504 ?auto_2166509 ) ) ( not ( = ?auto_2166504 ?auto_2166510 ) ) ( not ( = ?auto_2166504 ?auto_2166511 ) ) ( not ( = ?auto_2166504 ?auto_2166512 ) ) ( not ( = ?auto_2166504 ?auto_2166513 ) ) ( not ( = ?auto_2166504 ?auto_2166514 ) ) ( not ( = ?auto_2166504 ?auto_2166515 ) ) ( not ( = ?auto_2166505 ?auto_2166506 ) ) ( not ( = ?auto_2166505 ?auto_2166507 ) ) ( not ( = ?auto_2166505 ?auto_2166508 ) ) ( not ( = ?auto_2166505 ?auto_2166509 ) ) ( not ( = ?auto_2166505 ?auto_2166510 ) ) ( not ( = ?auto_2166505 ?auto_2166511 ) ) ( not ( = ?auto_2166505 ?auto_2166512 ) ) ( not ( = ?auto_2166505 ?auto_2166513 ) ) ( not ( = ?auto_2166505 ?auto_2166514 ) ) ( not ( = ?auto_2166505 ?auto_2166515 ) ) ( not ( = ?auto_2166506 ?auto_2166507 ) ) ( not ( = ?auto_2166506 ?auto_2166508 ) ) ( not ( = ?auto_2166506 ?auto_2166509 ) ) ( not ( = ?auto_2166506 ?auto_2166510 ) ) ( not ( = ?auto_2166506 ?auto_2166511 ) ) ( not ( = ?auto_2166506 ?auto_2166512 ) ) ( not ( = ?auto_2166506 ?auto_2166513 ) ) ( not ( = ?auto_2166506 ?auto_2166514 ) ) ( not ( = ?auto_2166506 ?auto_2166515 ) ) ( not ( = ?auto_2166507 ?auto_2166508 ) ) ( not ( = ?auto_2166507 ?auto_2166509 ) ) ( not ( = ?auto_2166507 ?auto_2166510 ) ) ( not ( = ?auto_2166507 ?auto_2166511 ) ) ( not ( = ?auto_2166507 ?auto_2166512 ) ) ( not ( = ?auto_2166507 ?auto_2166513 ) ) ( not ( = ?auto_2166507 ?auto_2166514 ) ) ( not ( = ?auto_2166507 ?auto_2166515 ) ) ( not ( = ?auto_2166508 ?auto_2166509 ) ) ( not ( = ?auto_2166508 ?auto_2166510 ) ) ( not ( = ?auto_2166508 ?auto_2166511 ) ) ( not ( = ?auto_2166508 ?auto_2166512 ) ) ( not ( = ?auto_2166508 ?auto_2166513 ) ) ( not ( = ?auto_2166508 ?auto_2166514 ) ) ( not ( = ?auto_2166508 ?auto_2166515 ) ) ( not ( = ?auto_2166509 ?auto_2166510 ) ) ( not ( = ?auto_2166509 ?auto_2166511 ) ) ( not ( = ?auto_2166509 ?auto_2166512 ) ) ( not ( = ?auto_2166509 ?auto_2166513 ) ) ( not ( = ?auto_2166509 ?auto_2166514 ) ) ( not ( = ?auto_2166509 ?auto_2166515 ) ) ( not ( = ?auto_2166510 ?auto_2166511 ) ) ( not ( = ?auto_2166510 ?auto_2166512 ) ) ( not ( = ?auto_2166510 ?auto_2166513 ) ) ( not ( = ?auto_2166510 ?auto_2166514 ) ) ( not ( = ?auto_2166510 ?auto_2166515 ) ) ( not ( = ?auto_2166511 ?auto_2166512 ) ) ( not ( = ?auto_2166511 ?auto_2166513 ) ) ( not ( = ?auto_2166511 ?auto_2166514 ) ) ( not ( = ?auto_2166511 ?auto_2166515 ) ) ( not ( = ?auto_2166512 ?auto_2166513 ) ) ( not ( = ?auto_2166512 ?auto_2166514 ) ) ( not ( = ?auto_2166512 ?auto_2166515 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166513 ?auto_2166514 ?auto_2166515 )
      ( MAKE-12CRATE-VERIFY ?auto_2166503 ?auto_2166504 ?auto_2166505 ?auto_2166506 ?auto_2166507 ?auto_2166508 ?auto_2166509 ?auto_2166510 ?auto_2166511 ?auto_2166512 ?auto_2166513 ?auto_2166514 ?auto_2166515 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166653 - SURFACE
      ?auto_2166654 - SURFACE
      ?auto_2166655 - SURFACE
      ?auto_2166656 - SURFACE
      ?auto_2166657 - SURFACE
      ?auto_2166658 - SURFACE
      ?auto_2166659 - SURFACE
      ?auto_2166660 - SURFACE
      ?auto_2166661 - SURFACE
      ?auto_2166662 - SURFACE
      ?auto_2166663 - SURFACE
      ?auto_2166664 - SURFACE
      ?auto_2166665 - SURFACE
    )
    :vars
    (
      ?auto_2166667 - HOIST
      ?auto_2166668 - PLACE
      ?auto_2166670 - TRUCK
      ?auto_2166666 - PLACE
      ?auto_2166669 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166667 ?auto_2166668 ) ( SURFACE-AT ?auto_2166664 ?auto_2166668 ) ( CLEAR ?auto_2166664 ) ( IS-CRATE ?auto_2166665 ) ( not ( = ?auto_2166664 ?auto_2166665 ) ) ( AVAILABLE ?auto_2166667 ) ( ON ?auto_2166664 ?auto_2166663 ) ( not ( = ?auto_2166663 ?auto_2166664 ) ) ( not ( = ?auto_2166663 ?auto_2166665 ) ) ( TRUCK-AT ?auto_2166670 ?auto_2166666 ) ( not ( = ?auto_2166666 ?auto_2166668 ) ) ( HOIST-AT ?auto_2166669 ?auto_2166666 ) ( LIFTING ?auto_2166669 ?auto_2166665 ) ( not ( = ?auto_2166667 ?auto_2166669 ) ) ( ON ?auto_2166654 ?auto_2166653 ) ( ON ?auto_2166655 ?auto_2166654 ) ( ON ?auto_2166656 ?auto_2166655 ) ( ON ?auto_2166657 ?auto_2166656 ) ( ON ?auto_2166658 ?auto_2166657 ) ( ON ?auto_2166659 ?auto_2166658 ) ( ON ?auto_2166660 ?auto_2166659 ) ( ON ?auto_2166661 ?auto_2166660 ) ( ON ?auto_2166662 ?auto_2166661 ) ( ON ?auto_2166663 ?auto_2166662 ) ( not ( = ?auto_2166653 ?auto_2166654 ) ) ( not ( = ?auto_2166653 ?auto_2166655 ) ) ( not ( = ?auto_2166653 ?auto_2166656 ) ) ( not ( = ?auto_2166653 ?auto_2166657 ) ) ( not ( = ?auto_2166653 ?auto_2166658 ) ) ( not ( = ?auto_2166653 ?auto_2166659 ) ) ( not ( = ?auto_2166653 ?auto_2166660 ) ) ( not ( = ?auto_2166653 ?auto_2166661 ) ) ( not ( = ?auto_2166653 ?auto_2166662 ) ) ( not ( = ?auto_2166653 ?auto_2166663 ) ) ( not ( = ?auto_2166653 ?auto_2166664 ) ) ( not ( = ?auto_2166653 ?auto_2166665 ) ) ( not ( = ?auto_2166654 ?auto_2166655 ) ) ( not ( = ?auto_2166654 ?auto_2166656 ) ) ( not ( = ?auto_2166654 ?auto_2166657 ) ) ( not ( = ?auto_2166654 ?auto_2166658 ) ) ( not ( = ?auto_2166654 ?auto_2166659 ) ) ( not ( = ?auto_2166654 ?auto_2166660 ) ) ( not ( = ?auto_2166654 ?auto_2166661 ) ) ( not ( = ?auto_2166654 ?auto_2166662 ) ) ( not ( = ?auto_2166654 ?auto_2166663 ) ) ( not ( = ?auto_2166654 ?auto_2166664 ) ) ( not ( = ?auto_2166654 ?auto_2166665 ) ) ( not ( = ?auto_2166655 ?auto_2166656 ) ) ( not ( = ?auto_2166655 ?auto_2166657 ) ) ( not ( = ?auto_2166655 ?auto_2166658 ) ) ( not ( = ?auto_2166655 ?auto_2166659 ) ) ( not ( = ?auto_2166655 ?auto_2166660 ) ) ( not ( = ?auto_2166655 ?auto_2166661 ) ) ( not ( = ?auto_2166655 ?auto_2166662 ) ) ( not ( = ?auto_2166655 ?auto_2166663 ) ) ( not ( = ?auto_2166655 ?auto_2166664 ) ) ( not ( = ?auto_2166655 ?auto_2166665 ) ) ( not ( = ?auto_2166656 ?auto_2166657 ) ) ( not ( = ?auto_2166656 ?auto_2166658 ) ) ( not ( = ?auto_2166656 ?auto_2166659 ) ) ( not ( = ?auto_2166656 ?auto_2166660 ) ) ( not ( = ?auto_2166656 ?auto_2166661 ) ) ( not ( = ?auto_2166656 ?auto_2166662 ) ) ( not ( = ?auto_2166656 ?auto_2166663 ) ) ( not ( = ?auto_2166656 ?auto_2166664 ) ) ( not ( = ?auto_2166656 ?auto_2166665 ) ) ( not ( = ?auto_2166657 ?auto_2166658 ) ) ( not ( = ?auto_2166657 ?auto_2166659 ) ) ( not ( = ?auto_2166657 ?auto_2166660 ) ) ( not ( = ?auto_2166657 ?auto_2166661 ) ) ( not ( = ?auto_2166657 ?auto_2166662 ) ) ( not ( = ?auto_2166657 ?auto_2166663 ) ) ( not ( = ?auto_2166657 ?auto_2166664 ) ) ( not ( = ?auto_2166657 ?auto_2166665 ) ) ( not ( = ?auto_2166658 ?auto_2166659 ) ) ( not ( = ?auto_2166658 ?auto_2166660 ) ) ( not ( = ?auto_2166658 ?auto_2166661 ) ) ( not ( = ?auto_2166658 ?auto_2166662 ) ) ( not ( = ?auto_2166658 ?auto_2166663 ) ) ( not ( = ?auto_2166658 ?auto_2166664 ) ) ( not ( = ?auto_2166658 ?auto_2166665 ) ) ( not ( = ?auto_2166659 ?auto_2166660 ) ) ( not ( = ?auto_2166659 ?auto_2166661 ) ) ( not ( = ?auto_2166659 ?auto_2166662 ) ) ( not ( = ?auto_2166659 ?auto_2166663 ) ) ( not ( = ?auto_2166659 ?auto_2166664 ) ) ( not ( = ?auto_2166659 ?auto_2166665 ) ) ( not ( = ?auto_2166660 ?auto_2166661 ) ) ( not ( = ?auto_2166660 ?auto_2166662 ) ) ( not ( = ?auto_2166660 ?auto_2166663 ) ) ( not ( = ?auto_2166660 ?auto_2166664 ) ) ( not ( = ?auto_2166660 ?auto_2166665 ) ) ( not ( = ?auto_2166661 ?auto_2166662 ) ) ( not ( = ?auto_2166661 ?auto_2166663 ) ) ( not ( = ?auto_2166661 ?auto_2166664 ) ) ( not ( = ?auto_2166661 ?auto_2166665 ) ) ( not ( = ?auto_2166662 ?auto_2166663 ) ) ( not ( = ?auto_2166662 ?auto_2166664 ) ) ( not ( = ?auto_2166662 ?auto_2166665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166663 ?auto_2166664 ?auto_2166665 )
      ( MAKE-12CRATE-VERIFY ?auto_2166653 ?auto_2166654 ?auto_2166655 ?auto_2166656 ?auto_2166657 ?auto_2166658 ?auto_2166659 ?auto_2166660 ?auto_2166661 ?auto_2166662 ?auto_2166663 ?auto_2166664 ?auto_2166665 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166815 - SURFACE
      ?auto_2166816 - SURFACE
      ?auto_2166817 - SURFACE
      ?auto_2166818 - SURFACE
      ?auto_2166819 - SURFACE
      ?auto_2166820 - SURFACE
      ?auto_2166821 - SURFACE
      ?auto_2166822 - SURFACE
      ?auto_2166823 - SURFACE
      ?auto_2166824 - SURFACE
      ?auto_2166825 - SURFACE
      ?auto_2166826 - SURFACE
      ?auto_2166827 - SURFACE
    )
    :vars
    (
      ?auto_2166831 - HOIST
      ?auto_2166830 - PLACE
      ?auto_2166832 - TRUCK
      ?auto_2166828 - PLACE
      ?auto_2166833 - HOIST
      ?auto_2166829 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166831 ?auto_2166830 ) ( SURFACE-AT ?auto_2166826 ?auto_2166830 ) ( CLEAR ?auto_2166826 ) ( IS-CRATE ?auto_2166827 ) ( not ( = ?auto_2166826 ?auto_2166827 ) ) ( AVAILABLE ?auto_2166831 ) ( ON ?auto_2166826 ?auto_2166825 ) ( not ( = ?auto_2166825 ?auto_2166826 ) ) ( not ( = ?auto_2166825 ?auto_2166827 ) ) ( TRUCK-AT ?auto_2166832 ?auto_2166828 ) ( not ( = ?auto_2166828 ?auto_2166830 ) ) ( HOIST-AT ?auto_2166833 ?auto_2166828 ) ( not ( = ?auto_2166831 ?auto_2166833 ) ) ( AVAILABLE ?auto_2166833 ) ( SURFACE-AT ?auto_2166827 ?auto_2166828 ) ( ON ?auto_2166827 ?auto_2166829 ) ( CLEAR ?auto_2166827 ) ( not ( = ?auto_2166826 ?auto_2166829 ) ) ( not ( = ?auto_2166827 ?auto_2166829 ) ) ( not ( = ?auto_2166825 ?auto_2166829 ) ) ( ON ?auto_2166816 ?auto_2166815 ) ( ON ?auto_2166817 ?auto_2166816 ) ( ON ?auto_2166818 ?auto_2166817 ) ( ON ?auto_2166819 ?auto_2166818 ) ( ON ?auto_2166820 ?auto_2166819 ) ( ON ?auto_2166821 ?auto_2166820 ) ( ON ?auto_2166822 ?auto_2166821 ) ( ON ?auto_2166823 ?auto_2166822 ) ( ON ?auto_2166824 ?auto_2166823 ) ( ON ?auto_2166825 ?auto_2166824 ) ( not ( = ?auto_2166815 ?auto_2166816 ) ) ( not ( = ?auto_2166815 ?auto_2166817 ) ) ( not ( = ?auto_2166815 ?auto_2166818 ) ) ( not ( = ?auto_2166815 ?auto_2166819 ) ) ( not ( = ?auto_2166815 ?auto_2166820 ) ) ( not ( = ?auto_2166815 ?auto_2166821 ) ) ( not ( = ?auto_2166815 ?auto_2166822 ) ) ( not ( = ?auto_2166815 ?auto_2166823 ) ) ( not ( = ?auto_2166815 ?auto_2166824 ) ) ( not ( = ?auto_2166815 ?auto_2166825 ) ) ( not ( = ?auto_2166815 ?auto_2166826 ) ) ( not ( = ?auto_2166815 ?auto_2166827 ) ) ( not ( = ?auto_2166815 ?auto_2166829 ) ) ( not ( = ?auto_2166816 ?auto_2166817 ) ) ( not ( = ?auto_2166816 ?auto_2166818 ) ) ( not ( = ?auto_2166816 ?auto_2166819 ) ) ( not ( = ?auto_2166816 ?auto_2166820 ) ) ( not ( = ?auto_2166816 ?auto_2166821 ) ) ( not ( = ?auto_2166816 ?auto_2166822 ) ) ( not ( = ?auto_2166816 ?auto_2166823 ) ) ( not ( = ?auto_2166816 ?auto_2166824 ) ) ( not ( = ?auto_2166816 ?auto_2166825 ) ) ( not ( = ?auto_2166816 ?auto_2166826 ) ) ( not ( = ?auto_2166816 ?auto_2166827 ) ) ( not ( = ?auto_2166816 ?auto_2166829 ) ) ( not ( = ?auto_2166817 ?auto_2166818 ) ) ( not ( = ?auto_2166817 ?auto_2166819 ) ) ( not ( = ?auto_2166817 ?auto_2166820 ) ) ( not ( = ?auto_2166817 ?auto_2166821 ) ) ( not ( = ?auto_2166817 ?auto_2166822 ) ) ( not ( = ?auto_2166817 ?auto_2166823 ) ) ( not ( = ?auto_2166817 ?auto_2166824 ) ) ( not ( = ?auto_2166817 ?auto_2166825 ) ) ( not ( = ?auto_2166817 ?auto_2166826 ) ) ( not ( = ?auto_2166817 ?auto_2166827 ) ) ( not ( = ?auto_2166817 ?auto_2166829 ) ) ( not ( = ?auto_2166818 ?auto_2166819 ) ) ( not ( = ?auto_2166818 ?auto_2166820 ) ) ( not ( = ?auto_2166818 ?auto_2166821 ) ) ( not ( = ?auto_2166818 ?auto_2166822 ) ) ( not ( = ?auto_2166818 ?auto_2166823 ) ) ( not ( = ?auto_2166818 ?auto_2166824 ) ) ( not ( = ?auto_2166818 ?auto_2166825 ) ) ( not ( = ?auto_2166818 ?auto_2166826 ) ) ( not ( = ?auto_2166818 ?auto_2166827 ) ) ( not ( = ?auto_2166818 ?auto_2166829 ) ) ( not ( = ?auto_2166819 ?auto_2166820 ) ) ( not ( = ?auto_2166819 ?auto_2166821 ) ) ( not ( = ?auto_2166819 ?auto_2166822 ) ) ( not ( = ?auto_2166819 ?auto_2166823 ) ) ( not ( = ?auto_2166819 ?auto_2166824 ) ) ( not ( = ?auto_2166819 ?auto_2166825 ) ) ( not ( = ?auto_2166819 ?auto_2166826 ) ) ( not ( = ?auto_2166819 ?auto_2166827 ) ) ( not ( = ?auto_2166819 ?auto_2166829 ) ) ( not ( = ?auto_2166820 ?auto_2166821 ) ) ( not ( = ?auto_2166820 ?auto_2166822 ) ) ( not ( = ?auto_2166820 ?auto_2166823 ) ) ( not ( = ?auto_2166820 ?auto_2166824 ) ) ( not ( = ?auto_2166820 ?auto_2166825 ) ) ( not ( = ?auto_2166820 ?auto_2166826 ) ) ( not ( = ?auto_2166820 ?auto_2166827 ) ) ( not ( = ?auto_2166820 ?auto_2166829 ) ) ( not ( = ?auto_2166821 ?auto_2166822 ) ) ( not ( = ?auto_2166821 ?auto_2166823 ) ) ( not ( = ?auto_2166821 ?auto_2166824 ) ) ( not ( = ?auto_2166821 ?auto_2166825 ) ) ( not ( = ?auto_2166821 ?auto_2166826 ) ) ( not ( = ?auto_2166821 ?auto_2166827 ) ) ( not ( = ?auto_2166821 ?auto_2166829 ) ) ( not ( = ?auto_2166822 ?auto_2166823 ) ) ( not ( = ?auto_2166822 ?auto_2166824 ) ) ( not ( = ?auto_2166822 ?auto_2166825 ) ) ( not ( = ?auto_2166822 ?auto_2166826 ) ) ( not ( = ?auto_2166822 ?auto_2166827 ) ) ( not ( = ?auto_2166822 ?auto_2166829 ) ) ( not ( = ?auto_2166823 ?auto_2166824 ) ) ( not ( = ?auto_2166823 ?auto_2166825 ) ) ( not ( = ?auto_2166823 ?auto_2166826 ) ) ( not ( = ?auto_2166823 ?auto_2166827 ) ) ( not ( = ?auto_2166823 ?auto_2166829 ) ) ( not ( = ?auto_2166824 ?auto_2166825 ) ) ( not ( = ?auto_2166824 ?auto_2166826 ) ) ( not ( = ?auto_2166824 ?auto_2166827 ) ) ( not ( = ?auto_2166824 ?auto_2166829 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166825 ?auto_2166826 ?auto_2166827 )
      ( MAKE-12CRATE-VERIFY ?auto_2166815 ?auto_2166816 ?auto_2166817 ?auto_2166818 ?auto_2166819 ?auto_2166820 ?auto_2166821 ?auto_2166822 ?auto_2166823 ?auto_2166824 ?auto_2166825 ?auto_2166826 ?auto_2166827 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2166978 - SURFACE
      ?auto_2166979 - SURFACE
      ?auto_2166980 - SURFACE
      ?auto_2166981 - SURFACE
      ?auto_2166982 - SURFACE
      ?auto_2166983 - SURFACE
      ?auto_2166984 - SURFACE
      ?auto_2166985 - SURFACE
      ?auto_2166986 - SURFACE
      ?auto_2166987 - SURFACE
      ?auto_2166988 - SURFACE
      ?auto_2166989 - SURFACE
      ?auto_2166990 - SURFACE
    )
    :vars
    (
      ?auto_2166992 - HOIST
      ?auto_2166993 - PLACE
      ?auto_2166996 - PLACE
      ?auto_2166995 - HOIST
      ?auto_2166991 - SURFACE
      ?auto_2166994 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2166992 ?auto_2166993 ) ( SURFACE-AT ?auto_2166989 ?auto_2166993 ) ( CLEAR ?auto_2166989 ) ( IS-CRATE ?auto_2166990 ) ( not ( = ?auto_2166989 ?auto_2166990 ) ) ( AVAILABLE ?auto_2166992 ) ( ON ?auto_2166989 ?auto_2166988 ) ( not ( = ?auto_2166988 ?auto_2166989 ) ) ( not ( = ?auto_2166988 ?auto_2166990 ) ) ( not ( = ?auto_2166996 ?auto_2166993 ) ) ( HOIST-AT ?auto_2166995 ?auto_2166996 ) ( not ( = ?auto_2166992 ?auto_2166995 ) ) ( AVAILABLE ?auto_2166995 ) ( SURFACE-AT ?auto_2166990 ?auto_2166996 ) ( ON ?auto_2166990 ?auto_2166991 ) ( CLEAR ?auto_2166990 ) ( not ( = ?auto_2166989 ?auto_2166991 ) ) ( not ( = ?auto_2166990 ?auto_2166991 ) ) ( not ( = ?auto_2166988 ?auto_2166991 ) ) ( TRUCK-AT ?auto_2166994 ?auto_2166993 ) ( ON ?auto_2166979 ?auto_2166978 ) ( ON ?auto_2166980 ?auto_2166979 ) ( ON ?auto_2166981 ?auto_2166980 ) ( ON ?auto_2166982 ?auto_2166981 ) ( ON ?auto_2166983 ?auto_2166982 ) ( ON ?auto_2166984 ?auto_2166983 ) ( ON ?auto_2166985 ?auto_2166984 ) ( ON ?auto_2166986 ?auto_2166985 ) ( ON ?auto_2166987 ?auto_2166986 ) ( ON ?auto_2166988 ?auto_2166987 ) ( not ( = ?auto_2166978 ?auto_2166979 ) ) ( not ( = ?auto_2166978 ?auto_2166980 ) ) ( not ( = ?auto_2166978 ?auto_2166981 ) ) ( not ( = ?auto_2166978 ?auto_2166982 ) ) ( not ( = ?auto_2166978 ?auto_2166983 ) ) ( not ( = ?auto_2166978 ?auto_2166984 ) ) ( not ( = ?auto_2166978 ?auto_2166985 ) ) ( not ( = ?auto_2166978 ?auto_2166986 ) ) ( not ( = ?auto_2166978 ?auto_2166987 ) ) ( not ( = ?auto_2166978 ?auto_2166988 ) ) ( not ( = ?auto_2166978 ?auto_2166989 ) ) ( not ( = ?auto_2166978 ?auto_2166990 ) ) ( not ( = ?auto_2166978 ?auto_2166991 ) ) ( not ( = ?auto_2166979 ?auto_2166980 ) ) ( not ( = ?auto_2166979 ?auto_2166981 ) ) ( not ( = ?auto_2166979 ?auto_2166982 ) ) ( not ( = ?auto_2166979 ?auto_2166983 ) ) ( not ( = ?auto_2166979 ?auto_2166984 ) ) ( not ( = ?auto_2166979 ?auto_2166985 ) ) ( not ( = ?auto_2166979 ?auto_2166986 ) ) ( not ( = ?auto_2166979 ?auto_2166987 ) ) ( not ( = ?auto_2166979 ?auto_2166988 ) ) ( not ( = ?auto_2166979 ?auto_2166989 ) ) ( not ( = ?auto_2166979 ?auto_2166990 ) ) ( not ( = ?auto_2166979 ?auto_2166991 ) ) ( not ( = ?auto_2166980 ?auto_2166981 ) ) ( not ( = ?auto_2166980 ?auto_2166982 ) ) ( not ( = ?auto_2166980 ?auto_2166983 ) ) ( not ( = ?auto_2166980 ?auto_2166984 ) ) ( not ( = ?auto_2166980 ?auto_2166985 ) ) ( not ( = ?auto_2166980 ?auto_2166986 ) ) ( not ( = ?auto_2166980 ?auto_2166987 ) ) ( not ( = ?auto_2166980 ?auto_2166988 ) ) ( not ( = ?auto_2166980 ?auto_2166989 ) ) ( not ( = ?auto_2166980 ?auto_2166990 ) ) ( not ( = ?auto_2166980 ?auto_2166991 ) ) ( not ( = ?auto_2166981 ?auto_2166982 ) ) ( not ( = ?auto_2166981 ?auto_2166983 ) ) ( not ( = ?auto_2166981 ?auto_2166984 ) ) ( not ( = ?auto_2166981 ?auto_2166985 ) ) ( not ( = ?auto_2166981 ?auto_2166986 ) ) ( not ( = ?auto_2166981 ?auto_2166987 ) ) ( not ( = ?auto_2166981 ?auto_2166988 ) ) ( not ( = ?auto_2166981 ?auto_2166989 ) ) ( not ( = ?auto_2166981 ?auto_2166990 ) ) ( not ( = ?auto_2166981 ?auto_2166991 ) ) ( not ( = ?auto_2166982 ?auto_2166983 ) ) ( not ( = ?auto_2166982 ?auto_2166984 ) ) ( not ( = ?auto_2166982 ?auto_2166985 ) ) ( not ( = ?auto_2166982 ?auto_2166986 ) ) ( not ( = ?auto_2166982 ?auto_2166987 ) ) ( not ( = ?auto_2166982 ?auto_2166988 ) ) ( not ( = ?auto_2166982 ?auto_2166989 ) ) ( not ( = ?auto_2166982 ?auto_2166990 ) ) ( not ( = ?auto_2166982 ?auto_2166991 ) ) ( not ( = ?auto_2166983 ?auto_2166984 ) ) ( not ( = ?auto_2166983 ?auto_2166985 ) ) ( not ( = ?auto_2166983 ?auto_2166986 ) ) ( not ( = ?auto_2166983 ?auto_2166987 ) ) ( not ( = ?auto_2166983 ?auto_2166988 ) ) ( not ( = ?auto_2166983 ?auto_2166989 ) ) ( not ( = ?auto_2166983 ?auto_2166990 ) ) ( not ( = ?auto_2166983 ?auto_2166991 ) ) ( not ( = ?auto_2166984 ?auto_2166985 ) ) ( not ( = ?auto_2166984 ?auto_2166986 ) ) ( not ( = ?auto_2166984 ?auto_2166987 ) ) ( not ( = ?auto_2166984 ?auto_2166988 ) ) ( not ( = ?auto_2166984 ?auto_2166989 ) ) ( not ( = ?auto_2166984 ?auto_2166990 ) ) ( not ( = ?auto_2166984 ?auto_2166991 ) ) ( not ( = ?auto_2166985 ?auto_2166986 ) ) ( not ( = ?auto_2166985 ?auto_2166987 ) ) ( not ( = ?auto_2166985 ?auto_2166988 ) ) ( not ( = ?auto_2166985 ?auto_2166989 ) ) ( not ( = ?auto_2166985 ?auto_2166990 ) ) ( not ( = ?auto_2166985 ?auto_2166991 ) ) ( not ( = ?auto_2166986 ?auto_2166987 ) ) ( not ( = ?auto_2166986 ?auto_2166988 ) ) ( not ( = ?auto_2166986 ?auto_2166989 ) ) ( not ( = ?auto_2166986 ?auto_2166990 ) ) ( not ( = ?auto_2166986 ?auto_2166991 ) ) ( not ( = ?auto_2166987 ?auto_2166988 ) ) ( not ( = ?auto_2166987 ?auto_2166989 ) ) ( not ( = ?auto_2166987 ?auto_2166990 ) ) ( not ( = ?auto_2166987 ?auto_2166991 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2166988 ?auto_2166989 ?auto_2166990 )
      ( MAKE-12CRATE-VERIFY ?auto_2166978 ?auto_2166979 ?auto_2166980 ?auto_2166981 ?auto_2166982 ?auto_2166983 ?auto_2166984 ?auto_2166985 ?auto_2166986 ?auto_2166987 ?auto_2166988 ?auto_2166989 ?auto_2166990 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167141 - SURFACE
      ?auto_2167142 - SURFACE
      ?auto_2167143 - SURFACE
      ?auto_2167144 - SURFACE
      ?auto_2167145 - SURFACE
      ?auto_2167146 - SURFACE
      ?auto_2167147 - SURFACE
      ?auto_2167148 - SURFACE
      ?auto_2167149 - SURFACE
      ?auto_2167150 - SURFACE
      ?auto_2167151 - SURFACE
      ?auto_2167152 - SURFACE
      ?auto_2167153 - SURFACE
    )
    :vars
    (
      ?auto_2167155 - HOIST
      ?auto_2167158 - PLACE
      ?auto_2167159 - PLACE
      ?auto_2167157 - HOIST
      ?auto_2167154 - SURFACE
      ?auto_2167156 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167155 ?auto_2167158 ) ( IS-CRATE ?auto_2167153 ) ( not ( = ?auto_2167152 ?auto_2167153 ) ) ( not ( = ?auto_2167151 ?auto_2167152 ) ) ( not ( = ?auto_2167151 ?auto_2167153 ) ) ( not ( = ?auto_2167159 ?auto_2167158 ) ) ( HOIST-AT ?auto_2167157 ?auto_2167159 ) ( not ( = ?auto_2167155 ?auto_2167157 ) ) ( AVAILABLE ?auto_2167157 ) ( SURFACE-AT ?auto_2167153 ?auto_2167159 ) ( ON ?auto_2167153 ?auto_2167154 ) ( CLEAR ?auto_2167153 ) ( not ( = ?auto_2167152 ?auto_2167154 ) ) ( not ( = ?auto_2167153 ?auto_2167154 ) ) ( not ( = ?auto_2167151 ?auto_2167154 ) ) ( TRUCK-AT ?auto_2167156 ?auto_2167158 ) ( SURFACE-AT ?auto_2167151 ?auto_2167158 ) ( CLEAR ?auto_2167151 ) ( LIFTING ?auto_2167155 ?auto_2167152 ) ( IS-CRATE ?auto_2167152 ) ( ON ?auto_2167142 ?auto_2167141 ) ( ON ?auto_2167143 ?auto_2167142 ) ( ON ?auto_2167144 ?auto_2167143 ) ( ON ?auto_2167145 ?auto_2167144 ) ( ON ?auto_2167146 ?auto_2167145 ) ( ON ?auto_2167147 ?auto_2167146 ) ( ON ?auto_2167148 ?auto_2167147 ) ( ON ?auto_2167149 ?auto_2167148 ) ( ON ?auto_2167150 ?auto_2167149 ) ( ON ?auto_2167151 ?auto_2167150 ) ( not ( = ?auto_2167141 ?auto_2167142 ) ) ( not ( = ?auto_2167141 ?auto_2167143 ) ) ( not ( = ?auto_2167141 ?auto_2167144 ) ) ( not ( = ?auto_2167141 ?auto_2167145 ) ) ( not ( = ?auto_2167141 ?auto_2167146 ) ) ( not ( = ?auto_2167141 ?auto_2167147 ) ) ( not ( = ?auto_2167141 ?auto_2167148 ) ) ( not ( = ?auto_2167141 ?auto_2167149 ) ) ( not ( = ?auto_2167141 ?auto_2167150 ) ) ( not ( = ?auto_2167141 ?auto_2167151 ) ) ( not ( = ?auto_2167141 ?auto_2167152 ) ) ( not ( = ?auto_2167141 ?auto_2167153 ) ) ( not ( = ?auto_2167141 ?auto_2167154 ) ) ( not ( = ?auto_2167142 ?auto_2167143 ) ) ( not ( = ?auto_2167142 ?auto_2167144 ) ) ( not ( = ?auto_2167142 ?auto_2167145 ) ) ( not ( = ?auto_2167142 ?auto_2167146 ) ) ( not ( = ?auto_2167142 ?auto_2167147 ) ) ( not ( = ?auto_2167142 ?auto_2167148 ) ) ( not ( = ?auto_2167142 ?auto_2167149 ) ) ( not ( = ?auto_2167142 ?auto_2167150 ) ) ( not ( = ?auto_2167142 ?auto_2167151 ) ) ( not ( = ?auto_2167142 ?auto_2167152 ) ) ( not ( = ?auto_2167142 ?auto_2167153 ) ) ( not ( = ?auto_2167142 ?auto_2167154 ) ) ( not ( = ?auto_2167143 ?auto_2167144 ) ) ( not ( = ?auto_2167143 ?auto_2167145 ) ) ( not ( = ?auto_2167143 ?auto_2167146 ) ) ( not ( = ?auto_2167143 ?auto_2167147 ) ) ( not ( = ?auto_2167143 ?auto_2167148 ) ) ( not ( = ?auto_2167143 ?auto_2167149 ) ) ( not ( = ?auto_2167143 ?auto_2167150 ) ) ( not ( = ?auto_2167143 ?auto_2167151 ) ) ( not ( = ?auto_2167143 ?auto_2167152 ) ) ( not ( = ?auto_2167143 ?auto_2167153 ) ) ( not ( = ?auto_2167143 ?auto_2167154 ) ) ( not ( = ?auto_2167144 ?auto_2167145 ) ) ( not ( = ?auto_2167144 ?auto_2167146 ) ) ( not ( = ?auto_2167144 ?auto_2167147 ) ) ( not ( = ?auto_2167144 ?auto_2167148 ) ) ( not ( = ?auto_2167144 ?auto_2167149 ) ) ( not ( = ?auto_2167144 ?auto_2167150 ) ) ( not ( = ?auto_2167144 ?auto_2167151 ) ) ( not ( = ?auto_2167144 ?auto_2167152 ) ) ( not ( = ?auto_2167144 ?auto_2167153 ) ) ( not ( = ?auto_2167144 ?auto_2167154 ) ) ( not ( = ?auto_2167145 ?auto_2167146 ) ) ( not ( = ?auto_2167145 ?auto_2167147 ) ) ( not ( = ?auto_2167145 ?auto_2167148 ) ) ( not ( = ?auto_2167145 ?auto_2167149 ) ) ( not ( = ?auto_2167145 ?auto_2167150 ) ) ( not ( = ?auto_2167145 ?auto_2167151 ) ) ( not ( = ?auto_2167145 ?auto_2167152 ) ) ( not ( = ?auto_2167145 ?auto_2167153 ) ) ( not ( = ?auto_2167145 ?auto_2167154 ) ) ( not ( = ?auto_2167146 ?auto_2167147 ) ) ( not ( = ?auto_2167146 ?auto_2167148 ) ) ( not ( = ?auto_2167146 ?auto_2167149 ) ) ( not ( = ?auto_2167146 ?auto_2167150 ) ) ( not ( = ?auto_2167146 ?auto_2167151 ) ) ( not ( = ?auto_2167146 ?auto_2167152 ) ) ( not ( = ?auto_2167146 ?auto_2167153 ) ) ( not ( = ?auto_2167146 ?auto_2167154 ) ) ( not ( = ?auto_2167147 ?auto_2167148 ) ) ( not ( = ?auto_2167147 ?auto_2167149 ) ) ( not ( = ?auto_2167147 ?auto_2167150 ) ) ( not ( = ?auto_2167147 ?auto_2167151 ) ) ( not ( = ?auto_2167147 ?auto_2167152 ) ) ( not ( = ?auto_2167147 ?auto_2167153 ) ) ( not ( = ?auto_2167147 ?auto_2167154 ) ) ( not ( = ?auto_2167148 ?auto_2167149 ) ) ( not ( = ?auto_2167148 ?auto_2167150 ) ) ( not ( = ?auto_2167148 ?auto_2167151 ) ) ( not ( = ?auto_2167148 ?auto_2167152 ) ) ( not ( = ?auto_2167148 ?auto_2167153 ) ) ( not ( = ?auto_2167148 ?auto_2167154 ) ) ( not ( = ?auto_2167149 ?auto_2167150 ) ) ( not ( = ?auto_2167149 ?auto_2167151 ) ) ( not ( = ?auto_2167149 ?auto_2167152 ) ) ( not ( = ?auto_2167149 ?auto_2167153 ) ) ( not ( = ?auto_2167149 ?auto_2167154 ) ) ( not ( = ?auto_2167150 ?auto_2167151 ) ) ( not ( = ?auto_2167150 ?auto_2167152 ) ) ( not ( = ?auto_2167150 ?auto_2167153 ) ) ( not ( = ?auto_2167150 ?auto_2167154 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167151 ?auto_2167152 ?auto_2167153 )
      ( MAKE-12CRATE-VERIFY ?auto_2167141 ?auto_2167142 ?auto_2167143 ?auto_2167144 ?auto_2167145 ?auto_2167146 ?auto_2167147 ?auto_2167148 ?auto_2167149 ?auto_2167150 ?auto_2167151 ?auto_2167152 ?auto_2167153 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167304 - SURFACE
      ?auto_2167305 - SURFACE
      ?auto_2167306 - SURFACE
      ?auto_2167307 - SURFACE
      ?auto_2167308 - SURFACE
      ?auto_2167309 - SURFACE
      ?auto_2167310 - SURFACE
      ?auto_2167311 - SURFACE
      ?auto_2167312 - SURFACE
      ?auto_2167313 - SURFACE
      ?auto_2167314 - SURFACE
      ?auto_2167315 - SURFACE
      ?auto_2167316 - SURFACE
    )
    :vars
    (
      ?auto_2167321 - HOIST
      ?auto_2167319 - PLACE
      ?auto_2167317 - PLACE
      ?auto_2167322 - HOIST
      ?auto_2167320 - SURFACE
      ?auto_2167318 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167321 ?auto_2167319 ) ( IS-CRATE ?auto_2167316 ) ( not ( = ?auto_2167315 ?auto_2167316 ) ) ( not ( = ?auto_2167314 ?auto_2167315 ) ) ( not ( = ?auto_2167314 ?auto_2167316 ) ) ( not ( = ?auto_2167317 ?auto_2167319 ) ) ( HOIST-AT ?auto_2167322 ?auto_2167317 ) ( not ( = ?auto_2167321 ?auto_2167322 ) ) ( AVAILABLE ?auto_2167322 ) ( SURFACE-AT ?auto_2167316 ?auto_2167317 ) ( ON ?auto_2167316 ?auto_2167320 ) ( CLEAR ?auto_2167316 ) ( not ( = ?auto_2167315 ?auto_2167320 ) ) ( not ( = ?auto_2167316 ?auto_2167320 ) ) ( not ( = ?auto_2167314 ?auto_2167320 ) ) ( TRUCK-AT ?auto_2167318 ?auto_2167319 ) ( SURFACE-AT ?auto_2167314 ?auto_2167319 ) ( CLEAR ?auto_2167314 ) ( IS-CRATE ?auto_2167315 ) ( AVAILABLE ?auto_2167321 ) ( IN ?auto_2167315 ?auto_2167318 ) ( ON ?auto_2167305 ?auto_2167304 ) ( ON ?auto_2167306 ?auto_2167305 ) ( ON ?auto_2167307 ?auto_2167306 ) ( ON ?auto_2167308 ?auto_2167307 ) ( ON ?auto_2167309 ?auto_2167308 ) ( ON ?auto_2167310 ?auto_2167309 ) ( ON ?auto_2167311 ?auto_2167310 ) ( ON ?auto_2167312 ?auto_2167311 ) ( ON ?auto_2167313 ?auto_2167312 ) ( ON ?auto_2167314 ?auto_2167313 ) ( not ( = ?auto_2167304 ?auto_2167305 ) ) ( not ( = ?auto_2167304 ?auto_2167306 ) ) ( not ( = ?auto_2167304 ?auto_2167307 ) ) ( not ( = ?auto_2167304 ?auto_2167308 ) ) ( not ( = ?auto_2167304 ?auto_2167309 ) ) ( not ( = ?auto_2167304 ?auto_2167310 ) ) ( not ( = ?auto_2167304 ?auto_2167311 ) ) ( not ( = ?auto_2167304 ?auto_2167312 ) ) ( not ( = ?auto_2167304 ?auto_2167313 ) ) ( not ( = ?auto_2167304 ?auto_2167314 ) ) ( not ( = ?auto_2167304 ?auto_2167315 ) ) ( not ( = ?auto_2167304 ?auto_2167316 ) ) ( not ( = ?auto_2167304 ?auto_2167320 ) ) ( not ( = ?auto_2167305 ?auto_2167306 ) ) ( not ( = ?auto_2167305 ?auto_2167307 ) ) ( not ( = ?auto_2167305 ?auto_2167308 ) ) ( not ( = ?auto_2167305 ?auto_2167309 ) ) ( not ( = ?auto_2167305 ?auto_2167310 ) ) ( not ( = ?auto_2167305 ?auto_2167311 ) ) ( not ( = ?auto_2167305 ?auto_2167312 ) ) ( not ( = ?auto_2167305 ?auto_2167313 ) ) ( not ( = ?auto_2167305 ?auto_2167314 ) ) ( not ( = ?auto_2167305 ?auto_2167315 ) ) ( not ( = ?auto_2167305 ?auto_2167316 ) ) ( not ( = ?auto_2167305 ?auto_2167320 ) ) ( not ( = ?auto_2167306 ?auto_2167307 ) ) ( not ( = ?auto_2167306 ?auto_2167308 ) ) ( not ( = ?auto_2167306 ?auto_2167309 ) ) ( not ( = ?auto_2167306 ?auto_2167310 ) ) ( not ( = ?auto_2167306 ?auto_2167311 ) ) ( not ( = ?auto_2167306 ?auto_2167312 ) ) ( not ( = ?auto_2167306 ?auto_2167313 ) ) ( not ( = ?auto_2167306 ?auto_2167314 ) ) ( not ( = ?auto_2167306 ?auto_2167315 ) ) ( not ( = ?auto_2167306 ?auto_2167316 ) ) ( not ( = ?auto_2167306 ?auto_2167320 ) ) ( not ( = ?auto_2167307 ?auto_2167308 ) ) ( not ( = ?auto_2167307 ?auto_2167309 ) ) ( not ( = ?auto_2167307 ?auto_2167310 ) ) ( not ( = ?auto_2167307 ?auto_2167311 ) ) ( not ( = ?auto_2167307 ?auto_2167312 ) ) ( not ( = ?auto_2167307 ?auto_2167313 ) ) ( not ( = ?auto_2167307 ?auto_2167314 ) ) ( not ( = ?auto_2167307 ?auto_2167315 ) ) ( not ( = ?auto_2167307 ?auto_2167316 ) ) ( not ( = ?auto_2167307 ?auto_2167320 ) ) ( not ( = ?auto_2167308 ?auto_2167309 ) ) ( not ( = ?auto_2167308 ?auto_2167310 ) ) ( not ( = ?auto_2167308 ?auto_2167311 ) ) ( not ( = ?auto_2167308 ?auto_2167312 ) ) ( not ( = ?auto_2167308 ?auto_2167313 ) ) ( not ( = ?auto_2167308 ?auto_2167314 ) ) ( not ( = ?auto_2167308 ?auto_2167315 ) ) ( not ( = ?auto_2167308 ?auto_2167316 ) ) ( not ( = ?auto_2167308 ?auto_2167320 ) ) ( not ( = ?auto_2167309 ?auto_2167310 ) ) ( not ( = ?auto_2167309 ?auto_2167311 ) ) ( not ( = ?auto_2167309 ?auto_2167312 ) ) ( not ( = ?auto_2167309 ?auto_2167313 ) ) ( not ( = ?auto_2167309 ?auto_2167314 ) ) ( not ( = ?auto_2167309 ?auto_2167315 ) ) ( not ( = ?auto_2167309 ?auto_2167316 ) ) ( not ( = ?auto_2167309 ?auto_2167320 ) ) ( not ( = ?auto_2167310 ?auto_2167311 ) ) ( not ( = ?auto_2167310 ?auto_2167312 ) ) ( not ( = ?auto_2167310 ?auto_2167313 ) ) ( not ( = ?auto_2167310 ?auto_2167314 ) ) ( not ( = ?auto_2167310 ?auto_2167315 ) ) ( not ( = ?auto_2167310 ?auto_2167316 ) ) ( not ( = ?auto_2167310 ?auto_2167320 ) ) ( not ( = ?auto_2167311 ?auto_2167312 ) ) ( not ( = ?auto_2167311 ?auto_2167313 ) ) ( not ( = ?auto_2167311 ?auto_2167314 ) ) ( not ( = ?auto_2167311 ?auto_2167315 ) ) ( not ( = ?auto_2167311 ?auto_2167316 ) ) ( not ( = ?auto_2167311 ?auto_2167320 ) ) ( not ( = ?auto_2167312 ?auto_2167313 ) ) ( not ( = ?auto_2167312 ?auto_2167314 ) ) ( not ( = ?auto_2167312 ?auto_2167315 ) ) ( not ( = ?auto_2167312 ?auto_2167316 ) ) ( not ( = ?auto_2167312 ?auto_2167320 ) ) ( not ( = ?auto_2167313 ?auto_2167314 ) ) ( not ( = ?auto_2167313 ?auto_2167315 ) ) ( not ( = ?auto_2167313 ?auto_2167316 ) ) ( not ( = ?auto_2167313 ?auto_2167320 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167314 ?auto_2167315 ?auto_2167316 )
      ( MAKE-12CRATE-VERIFY ?auto_2167304 ?auto_2167305 ?auto_2167306 ?auto_2167307 ?auto_2167308 ?auto_2167309 ?auto_2167310 ?auto_2167311 ?auto_2167312 ?auto_2167313 ?auto_2167314 ?auto_2167315 ?auto_2167316 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2167323 - SURFACE
      ?auto_2167324 - SURFACE
    )
    :vars
    (
      ?auto_2167330 - HOIST
      ?auto_2167328 - PLACE
      ?auto_2167325 - SURFACE
      ?auto_2167326 - PLACE
      ?auto_2167331 - HOIST
      ?auto_2167329 - SURFACE
      ?auto_2167327 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167330 ?auto_2167328 ) ( IS-CRATE ?auto_2167324 ) ( not ( = ?auto_2167323 ?auto_2167324 ) ) ( not ( = ?auto_2167325 ?auto_2167323 ) ) ( not ( = ?auto_2167325 ?auto_2167324 ) ) ( not ( = ?auto_2167326 ?auto_2167328 ) ) ( HOIST-AT ?auto_2167331 ?auto_2167326 ) ( not ( = ?auto_2167330 ?auto_2167331 ) ) ( AVAILABLE ?auto_2167331 ) ( SURFACE-AT ?auto_2167324 ?auto_2167326 ) ( ON ?auto_2167324 ?auto_2167329 ) ( CLEAR ?auto_2167324 ) ( not ( = ?auto_2167323 ?auto_2167329 ) ) ( not ( = ?auto_2167324 ?auto_2167329 ) ) ( not ( = ?auto_2167325 ?auto_2167329 ) ) ( SURFACE-AT ?auto_2167325 ?auto_2167328 ) ( CLEAR ?auto_2167325 ) ( IS-CRATE ?auto_2167323 ) ( AVAILABLE ?auto_2167330 ) ( IN ?auto_2167323 ?auto_2167327 ) ( TRUCK-AT ?auto_2167327 ?auto_2167326 ) )
    :subtasks
    ( ( !DRIVE ?auto_2167327 ?auto_2167326 ?auto_2167328 )
      ( MAKE-2CRATE ?auto_2167325 ?auto_2167323 ?auto_2167324 )
      ( MAKE-1CRATE-VERIFY ?auto_2167323 ?auto_2167324 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2167332 - SURFACE
      ?auto_2167333 - SURFACE
      ?auto_2167334 - SURFACE
    )
    :vars
    (
      ?auto_2167340 - HOIST
      ?auto_2167338 - PLACE
      ?auto_2167336 - PLACE
      ?auto_2167337 - HOIST
      ?auto_2167339 - SURFACE
      ?auto_2167335 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167340 ?auto_2167338 ) ( IS-CRATE ?auto_2167334 ) ( not ( = ?auto_2167333 ?auto_2167334 ) ) ( not ( = ?auto_2167332 ?auto_2167333 ) ) ( not ( = ?auto_2167332 ?auto_2167334 ) ) ( not ( = ?auto_2167336 ?auto_2167338 ) ) ( HOIST-AT ?auto_2167337 ?auto_2167336 ) ( not ( = ?auto_2167340 ?auto_2167337 ) ) ( AVAILABLE ?auto_2167337 ) ( SURFACE-AT ?auto_2167334 ?auto_2167336 ) ( ON ?auto_2167334 ?auto_2167339 ) ( CLEAR ?auto_2167334 ) ( not ( = ?auto_2167333 ?auto_2167339 ) ) ( not ( = ?auto_2167334 ?auto_2167339 ) ) ( not ( = ?auto_2167332 ?auto_2167339 ) ) ( SURFACE-AT ?auto_2167332 ?auto_2167338 ) ( CLEAR ?auto_2167332 ) ( IS-CRATE ?auto_2167333 ) ( AVAILABLE ?auto_2167340 ) ( IN ?auto_2167333 ?auto_2167335 ) ( TRUCK-AT ?auto_2167335 ?auto_2167336 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2167333 ?auto_2167334 )
      ( MAKE-2CRATE-VERIFY ?auto_2167332 ?auto_2167333 ?auto_2167334 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2167341 - SURFACE
      ?auto_2167342 - SURFACE
      ?auto_2167343 - SURFACE
      ?auto_2167344 - SURFACE
    )
    :vars
    (
      ?auto_2167350 - HOIST
      ?auto_2167346 - PLACE
      ?auto_2167349 - PLACE
      ?auto_2167348 - HOIST
      ?auto_2167347 - SURFACE
      ?auto_2167345 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167350 ?auto_2167346 ) ( IS-CRATE ?auto_2167344 ) ( not ( = ?auto_2167343 ?auto_2167344 ) ) ( not ( = ?auto_2167342 ?auto_2167343 ) ) ( not ( = ?auto_2167342 ?auto_2167344 ) ) ( not ( = ?auto_2167349 ?auto_2167346 ) ) ( HOIST-AT ?auto_2167348 ?auto_2167349 ) ( not ( = ?auto_2167350 ?auto_2167348 ) ) ( AVAILABLE ?auto_2167348 ) ( SURFACE-AT ?auto_2167344 ?auto_2167349 ) ( ON ?auto_2167344 ?auto_2167347 ) ( CLEAR ?auto_2167344 ) ( not ( = ?auto_2167343 ?auto_2167347 ) ) ( not ( = ?auto_2167344 ?auto_2167347 ) ) ( not ( = ?auto_2167342 ?auto_2167347 ) ) ( SURFACE-AT ?auto_2167342 ?auto_2167346 ) ( CLEAR ?auto_2167342 ) ( IS-CRATE ?auto_2167343 ) ( AVAILABLE ?auto_2167350 ) ( IN ?auto_2167343 ?auto_2167345 ) ( TRUCK-AT ?auto_2167345 ?auto_2167349 ) ( ON ?auto_2167342 ?auto_2167341 ) ( not ( = ?auto_2167341 ?auto_2167342 ) ) ( not ( = ?auto_2167341 ?auto_2167343 ) ) ( not ( = ?auto_2167341 ?auto_2167344 ) ) ( not ( = ?auto_2167341 ?auto_2167347 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167342 ?auto_2167343 ?auto_2167344 )
      ( MAKE-3CRATE-VERIFY ?auto_2167341 ?auto_2167342 ?auto_2167343 ?auto_2167344 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2167351 - SURFACE
      ?auto_2167352 - SURFACE
      ?auto_2167353 - SURFACE
      ?auto_2167354 - SURFACE
      ?auto_2167355 - SURFACE
    )
    :vars
    (
      ?auto_2167361 - HOIST
      ?auto_2167357 - PLACE
      ?auto_2167360 - PLACE
      ?auto_2167359 - HOIST
      ?auto_2167358 - SURFACE
      ?auto_2167356 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167361 ?auto_2167357 ) ( IS-CRATE ?auto_2167355 ) ( not ( = ?auto_2167354 ?auto_2167355 ) ) ( not ( = ?auto_2167353 ?auto_2167354 ) ) ( not ( = ?auto_2167353 ?auto_2167355 ) ) ( not ( = ?auto_2167360 ?auto_2167357 ) ) ( HOIST-AT ?auto_2167359 ?auto_2167360 ) ( not ( = ?auto_2167361 ?auto_2167359 ) ) ( AVAILABLE ?auto_2167359 ) ( SURFACE-AT ?auto_2167355 ?auto_2167360 ) ( ON ?auto_2167355 ?auto_2167358 ) ( CLEAR ?auto_2167355 ) ( not ( = ?auto_2167354 ?auto_2167358 ) ) ( not ( = ?auto_2167355 ?auto_2167358 ) ) ( not ( = ?auto_2167353 ?auto_2167358 ) ) ( SURFACE-AT ?auto_2167353 ?auto_2167357 ) ( CLEAR ?auto_2167353 ) ( IS-CRATE ?auto_2167354 ) ( AVAILABLE ?auto_2167361 ) ( IN ?auto_2167354 ?auto_2167356 ) ( TRUCK-AT ?auto_2167356 ?auto_2167360 ) ( ON ?auto_2167352 ?auto_2167351 ) ( ON ?auto_2167353 ?auto_2167352 ) ( not ( = ?auto_2167351 ?auto_2167352 ) ) ( not ( = ?auto_2167351 ?auto_2167353 ) ) ( not ( = ?auto_2167351 ?auto_2167354 ) ) ( not ( = ?auto_2167351 ?auto_2167355 ) ) ( not ( = ?auto_2167351 ?auto_2167358 ) ) ( not ( = ?auto_2167352 ?auto_2167353 ) ) ( not ( = ?auto_2167352 ?auto_2167354 ) ) ( not ( = ?auto_2167352 ?auto_2167355 ) ) ( not ( = ?auto_2167352 ?auto_2167358 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167353 ?auto_2167354 ?auto_2167355 )
      ( MAKE-4CRATE-VERIFY ?auto_2167351 ?auto_2167352 ?auto_2167353 ?auto_2167354 ?auto_2167355 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2167362 - SURFACE
      ?auto_2167363 - SURFACE
      ?auto_2167364 - SURFACE
      ?auto_2167365 - SURFACE
      ?auto_2167366 - SURFACE
      ?auto_2167367 - SURFACE
    )
    :vars
    (
      ?auto_2167373 - HOIST
      ?auto_2167369 - PLACE
      ?auto_2167372 - PLACE
      ?auto_2167371 - HOIST
      ?auto_2167370 - SURFACE
      ?auto_2167368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167373 ?auto_2167369 ) ( IS-CRATE ?auto_2167367 ) ( not ( = ?auto_2167366 ?auto_2167367 ) ) ( not ( = ?auto_2167365 ?auto_2167366 ) ) ( not ( = ?auto_2167365 ?auto_2167367 ) ) ( not ( = ?auto_2167372 ?auto_2167369 ) ) ( HOIST-AT ?auto_2167371 ?auto_2167372 ) ( not ( = ?auto_2167373 ?auto_2167371 ) ) ( AVAILABLE ?auto_2167371 ) ( SURFACE-AT ?auto_2167367 ?auto_2167372 ) ( ON ?auto_2167367 ?auto_2167370 ) ( CLEAR ?auto_2167367 ) ( not ( = ?auto_2167366 ?auto_2167370 ) ) ( not ( = ?auto_2167367 ?auto_2167370 ) ) ( not ( = ?auto_2167365 ?auto_2167370 ) ) ( SURFACE-AT ?auto_2167365 ?auto_2167369 ) ( CLEAR ?auto_2167365 ) ( IS-CRATE ?auto_2167366 ) ( AVAILABLE ?auto_2167373 ) ( IN ?auto_2167366 ?auto_2167368 ) ( TRUCK-AT ?auto_2167368 ?auto_2167372 ) ( ON ?auto_2167363 ?auto_2167362 ) ( ON ?auto_2167364 ?auto_2167363 ) ( ON ?auto_2167365 ?auto_2167364 ) ( not ( = ?auto_2167362 ?auto_2167363 ) ) ( not ( = ?auto_2167362 ?auto_2167364 ) ) ( not ( = ?auto_2167362 ?auto_2167365 ) ) ( not ( = ?auto_2167362 ?auto_2167366 ) ) ( not ( = ?auto_2167362 ?auto_2167367 ) ) ( not ( = ?auto_2167362 ?auto_2167370 ) ) ( not ( = ?auto_2167363 ?auto_2167364 ) ) ( not ( = ?auto_2167363 ?auto_2167365 ) ) ( not ( = ?auto_2167363 ?auto_2167366 ) ) ( not ( = ?auto_2167363 ?auto_2167367 ) ) ( not ( = ?auto_2167363 ?auto_2167370 ) ) ( not ( = ?auto_2167364 ?auto_2167365 ) ) ( not ( = ?auto_2167364 ?auto_2167366 ) ) ( not ( = ?auto_2167364 ?auto_2167367 ) ) ( not ( = ?auto_2167364 ?auto_2167370 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167365 ?auto_2167366 ?auto_2167367 )
      ( MAKE-5CRATE-VERIFY ?auto_2167362 ?auto_2167363 ?auto_2167364 ?auto_2167365 ?auto_2167366 ?auto_2167367 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2167374 - SURFACE
      ?auto_2167375 - SURFACE
      ?auto_2167376 - SURFACE
      ?auto_2167377 - SURFACE
      ?auto_2167378 - SURFACE
      ?auto_2167379 - SURFACE
      ?auto_2167380 - SURFACE
    )
    :vars
    (
      ?auto_2167386 - HOIST
      ?auto_2167382 - PLACE
      ?auto_2167385 - PLACE
      ?auto_2167384 - HOIST
      ?auto_2167383 - SURFACE
      ?auto_2167381 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167386 ?auto_2167382 ) ( IS-CRATE ?auto_2167380 ) ( not ( = ?auto_2167379 ?auto_2167380 ) ) ( not ( = ?auto_2167378 ?auto_2167379 ) ) ( not ( = ?auto_2167378 ?auto_2167380 ) ) ( not ( = ?auto_2167385 ?auto_2167382 ) ) ( HOIST-AT ?auto_2167384 ?auto_2167385 ) ( not ( = ?auto_2167386 ?auto_2167384 ) ) ( AVAILABLE ?auto_2167384 ) ( SURFACE-AT ?auto_2167380 ?auto_2167385 ) ( ON ?auto_2167380 ?auto_2167383 ) ( CLEAR ?auto_2167380 ) ( not ( = ?auto_2167379 ?auto_2167383 ) ) ( not ( = ?auto_2167380 ?auto_2167383 ) ) ( not ( = ?auto_2167378 ?auto_2167383 ) ) ( SURFACE-AT ?auto_2167378 ?auto_2167382 ) ( CLEAR ?auto_2167378 ) ( IS-CRATE ?auto_2167379 ) ( AVAILABLE ?auto_2167386 ) ( IN ?auto_2167379 ?auto_2167381 ) ( TRUCK-AT ?auto_2167381 ?auto_2167385 ) ( ON ?auto_2167375 ?auto_2167374 ) ( ON ?auto_2167376 ?auto_2167375 ) ( ON ?auto_2167377 ?auto_2167376 ) ( ON ?auto_2167378 ?auto_2167377 ) ( not ( = ?auto_2167374 ?auto_2167375 ) ) ( not ( = ?auto_2167374 ?auto_2167376 ) ) ( not ( = ?auto_2167374 ?auto_2167377 ) ) ( not ( = ?auto_2167374 ?auto_2167378 ) ) ( not ( = ?auto_2167374 ?auto_2167379 ) ) ( not ( = ?auto_2167374 ?auto_2167380 ) ) ( not ( = ?auto_2167374 ?auto_2167383 ) ) ( not ( = ?auto_2167375 ?auto_2167376 ) ) ( not ( = ?auto_2167375 ?auto_2167377 ) ) ( not ( = ?auto_2167375 ?auto_2167378 ) ) ( not ( = ?auto_2167375 ?auto_2167379 ) ) ( not ( = ?auto_2167375 ?auto_2167380 ) ) ( not ( = ?auto_2167375 ?auto_2167383 ) ) ( not ( = ?auto_2167376 ?auto_2167377 ) ) ( not ( = ?auto_2167376 ?auto_2167378 ) ) ( not ( = ?auto_2167376 ?auto_2167379 ) ) ( not ( = ?auto_2167376 ?auto_2167380 ) ) ( not ( = ?auto_2167376 ?auto_2167383 ) ) ( not ( = ?auto_2167377 ?auto_2167378 ) ) ( not ( = ?auto_2167377 ?auto_2167379 ) ) ( not ( = ?auto_2167377 ?auto_2167380 ) ) ( not ( = ?auto_2167377 ?auto_2167383 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167378 ?auto_2167379 ?auto_2167380 )
      ( MAKE-6CRATE-VERIFY ?auto_2167374 ?auto_2167375 ?auto_2167376 ?auto_2167377 ?auto_2167378 ?auto_2167379 ?auto_2167380 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2167387 - SURFACE
      ?auto_2167388 - SURFACE
      ?auto_2167389 - SURFACE
      ?auto_2167390 - SURFACE
      ?auto_2167391 - SURFACE
      ?auto_2167392 - SURFACE
      ?auto_2167393 - SURFACE
      ?auto_2167394 - SURFACE
    )
    :vars
    (
      ?auto_2167400 - HOIST
      ?auto_2167396 - PLACE
      ?auto_2167399 - PLACE
      ?auto_2167398 - HOIST
      ?auto_2167397 - SURFACE
      ?auto_2167395 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167400 ?auto_2167396 ) ( IS-CRATE ?auto_2167394 ) ( not ( = ?auto_2167393 ?auto_2167394 ) ) ( not ( = ?auto_2167392 ?auto_2167393 ) ) ( not ( = ?auto_2167392 ?auto_2167394 ) ) ( not ( = ?auto_2167399 ?auto_2167396 ) ) ( HOIST-AT ?auto_2167398 ?auto_2167399 ) ( not ( = ?auto_2167400 ?auto_2167398 ) ) ( AVAILABLE ?auto_2167398 ) ( SURFACE-AT ?auto_2167394 ?auto_2167399 ) ( ON ?auto_2167394 ?auto_2167397 ) ( CLEAR ?auto_2167394 ) ( not ( = ?auto_2167393 ?auto_2167397 ) ) ( not ( = ?auto_2167394 ?auto_2167397 ) ) ( not ( = ?auto_2167392 ?auto_2167397 ) ) ( SURFACE-AT ?auto_2167392 ?auto_2167396 ) ( CLEAR ?auto_2167392 ) ( IS-CRATE ?auto_2167393 ) ( AVAILABLE ?auto_2167400 ) ( IN ?auto_2167393 ?auto_2167395 ) ( TRUCK-AT ?auto_2167395 ?auto_2167399 ) ( ON ?auto_2167388 ?auto_2167387 ) ( ON ?auto_2167389 ?auto_2167388 ) ( ON ?auto_2167390 ?auto_2167389 ) ( ON ?auto_2167391 ?auto_2167390 ) ( ON ?auto_2167392 ?auto_2167391 ) ( not ( = ?auto_2167387 ?auto_2167388 ) ) ( not ( = ?auto_2167387 ?auto_2167389 ) ) ( not ( = ?auto_2167387 ?auto_2167390 ) ) ( not ( = ?auto_2167387 ?auto_2167391 ) ) ( not ( = ?auto_2167387 ?auto_2167392 ) ) ( not ( = ?auto_2167387 ?auto_2167393 ) ) ( not ( = ?auto_2167387 ?auto_2167394 ) ) ( not ( = ?auto_2167387 ?auto_2167397 ) ) ( not ( = ?auto_2167388 ?auto_2167389 ) ) ( not ( = ?auto_2167388 ?auto_2167390 ) ) ( not ( = ?auto_2167388 ?auto_2167391 ) ) ( not ( = ?auto_2167388 ?auto_2167392 ) ) ( not ( = ?auto_2167388 ?auto_2167393 ) ) ( not ( = ?auto_2167388 ?auto_2167394 ) ) ( not ( = ?auto_2167388 ?auto_2167397 ) ) ( not ( = ?auto_2167389 ?auto_2167390 ) ) ( not ( = ?auto_2167389 ?auto_2167391 ) ) ( not ( = ?auto_2167389 ?auto_2167392 ) ) ( not ( = ?auto_2167389 ?auto_2167393 ) ) ( not ( = ?auto_2167389 ?auto_2167394 ) ) ( not ( = ?auto_2167389 ?auto_2167397 ) ) ( not ( = ?auto_2167390 ?auto_2167391 ) ) ( not ( = ?auto_2167390 ?auto_2167392 ) ) ( not ( = ?auto_2167390 ?auto_2167393 ) ) ( not ( = ?auto_2167390 ?auto_2167394 ) ) ( not ( = ?auto_2167390 ?auto_2167397 ) ) ( not ( = ?auto_2167391 ?auto_2167392 ) ) ( not ( = ?auto_2167391 ?auto_2167393 ) ) ( not ( = ?auto_2167391 ?auto_2167394 ) ) ( not ( = ?auto_2167391 ?auto_2167397 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167392 ?auto_2167393 ?auto_2167394 )
      ( MAKE-7CRATE-VERIFY ?auto_2167387 ?auto_2167388 ?auto_2167389 ?auto_2167390 ?auto_2167391 ?auto_2167392 ?auto_2167393 ?auto_2167394 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2167401 - SURFACE
      ?auto_2167402 - SURFACE
      ?auto_2167403 - SURFACE
      ?auto_2167404 - SURFACE
      ?auto_2167405 - SURFACE
      ?auto_2167406 - SURFACE
      ?auto_2167407 - SURFACE
      ?auto_2167408 - SURFACE
      ?auto_2167409 - SURFACE
    )
    :vars
    (
      ?auto_2167415 - HOIST
      ?auto_2167411 - PLACE
      ?auto_2167414 - PLACE
      ?auto_2167413 - HOIST
      ?auto_2167412 - SURFACE
      ?auto_2167410 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167415 ?auto_2167411 ) ( IS-CRATE ?auto_2167409 ) ( not ( = ?auto_2167408 ?auto_2167409 ) ) ( not ( = ?auto_2167407 ?auto_2167408 ) ) ( not ( = ?auto_2167407 ?auto_2167409 ) ) ( not ( = ?auto_2167414 ?auto_2167411 ) ) ( HOIST-AT ?auto_2167413 ?auto_2167414 ) ( not ( = ?auto_2167415 ?auto_2167413 ) ) ( AVAILABLE ?auto_2167413 ) ( SURFACE-AT ?auto_2167409 ?auto_2167414 ) ( ON ?auto_2167409 ?auto_2167412 ) ( CLEAR ?auto_2167409 ) ( not ( = ?auto_2167408 ?auto_2167412 ) ) ( not ( = ?auto_2167409 ?auto_2167412 ) ) ( not ( = ?auto_2167407 ?auto_2167412 ) ) ( SURFACE-AT ?auto_2167407 ?auto_2167411 ) ( CLEAR ?auto_2167407 ) ( IS-CRATE ?auto_2167408 ) ( AVAILABLE ?auto_2167415 ) ( IN ?auto_2167408 ?auto_2167410 ) ( TRUCK-AT ?auto_2167410 ?auto_2167414 ) ( ON ?auto_2167402 ?auto_2167401 ) ( ON ?auto_2167403 ?auto_2167402 ) ( ON ?auto_2167404 ?auto_2167403 ) ( ON ?auto_2167405 ?auto_2167404 ) ( ON ?auto_2167406 ?auto_2167405 ) ( ON ?auto_2167407 ?auto_2167406 ) ( not ( = ?auto_2167401 ?auto_2167402 ) ) ( not ( = ?auto_2167401 ?auto_2167403 ) ) ( not ( = ?auto_2167401 ?auto_2167404 ) ) ( not ( = ?auto_2167401 ?auto_2167405 ) ) ( not ( = ?auto_2167401 ?auto_2167406 ) ) ( not ( = ?auto_2167401 ?auto_2167407 ) ) ( not ( = ?auto_2167401 ?auto_2167408 ) ) ( not ( = ?auto_2167401 ?auto_2167409 ) ) ( not ( = ?auto_2167401 ?auto_2167412 ) ) ( not ( = ?auto_2167402 ?auto_2167403 ) ) ( not ( = ?auto_2167402 ?auto_2167404 ) ) ( not ( = ?auto_2167402 ?auto_2167405 ) ) ( not ( = ?auto_2167402 ?auto_2167406 ) ) ( not ( = ?auto_2167402 ?auto_2167407 ) ) ( not ( = ?auto_2167402 ?auto_2167408 ) ) ( not ( = ?auto_2167402 ?auto_2167409 ) ) ( not ( = ?auto_2167402 ?auto_2167412 ) ) ( not ( = ?auto_2167403 ?auto_2167404 ) ) ( not ( = ?auto_2167403 ?auto_2167405 ) ) ( not ( = ?auto_2167403 ?auto_2167406 ) ) ( not ( = ?auto_2167403 ?auto_2167407 ) ) ( not ( = ?auto_2167403 ?auto_2167408 ) ) ( not ( = ?auto_2167403 ?auto_2167409 ) ) ( not ( = ?auto_2167403 ?auto_2167412 ) ) ( not ( = ?auto_2167404 ?auto_2167405 ) ) ( not ( = ?auto_2167404 ?auto_2167406 ) ) ( not ( = ?auto_2167404 ?auto_2167407 ) ) ( not ( = ?auto_2167404 ?auto_2167408 ) ) ( not ( = ?auto_2167404 ?auto_2167409 ) ) ( not ( = ?auto_2167404 ?auto_2167412 ) ) ( not ( = ?auto_2167405 ?auto_2167406 ) ) ( not ( = ?auto_2167405 ?auto_2167407 ) ) ( not ( = ?auto_2167405 ?auto_2167408 ) ) ( not ( = ?auto_2167405 ?auto_2167409 ) ) ( not ( = ?auto_2167405 ?auto_2167412 ) ) ( not ( = ?auto_2167406 ?auto_2167407 ) ) ( not ( = ?auto_2167406 ?auto_2167408 ) ) ( not ( = ?auto_2167406 ?auto_2167409 ) ) ( not ( = ?auto_2167406 ?auto_2167412 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167407 ?auto_2167408 ?auto_2167409 )
      ( MAKE-8CRATE-VERIFY ?auto_2167401 ?auto_2167402 ?auto_2167403 ?auto_2167404 ?auto_2167405 ?auto_2167406 ?auto_2167407 ?auto_2167408 ?auto_2167409 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2167416 - SURFACE
      ?auto_2167417 - SURFACE
      ?auto_2167418 - SURFACE
      ?auto_2167419 - SURFACE
      ?auto_2167420 - SURFACE
      ?auto_2167421 - SURFACE
      ?auto_2167422 - SURFACE
      ?auto_2167423 - SURFACE
      ?auto_2167424 - SURFACE
      ?auto_2167425 - SURFACE
    )
    :vars
    (
      ?auto_2167431 - HOIST
      ?auto_2167427 - PLACE
      ?auto_2167430 - PLACE
      ?auto_2167429 - HOIST
      ?auto_2167428 - SURFACE
      ?auto_2167426 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167431 ?auto_2167427 ) ( IS-CRATE ?auto_2167425 ) ( not ( = ?auto_2167424 ?auto_2167425 ) ) ( not ( = ?auto_2167423 ?auto_2167424 ) ) ( not ( = ?auto_2167423 ?auto_2167425 ) ) ( not ( = ?auto_2167430 ?auto_2167427 ) ) ( HOIST-AT ?auto_2167429 ?auto_2167430 ) ( not ( = ?auto_2167431 ?auto_2167429 ) ) ( AVAILABLE ?auto_2167429 ) ( SURFACE-AT ?auto_2167425 ?auto_2167430 ) ( ON ?auto_2167425 ?auto_2167428 ) ( CLEAR ?auto_2167425 ) ( not ( = ?auto_2167424 ?auto_2167428 ) ) ( not ( = ?auto_2167425 ?auto_2167428 ) ) ( not ( = ?auto_2167423 ?auto_2167428 ) ) ( SURFACE-AT ?auto_2167423 ?auto_2167427 ) ( CLEAR ?auto_2167423 ) ( IS-CRATE ?auto_2167424 ) ( AVAILABLE ?auto_2167431 ) ( IN ?auto_2167424 ?auto_2167426 ) ( TRUCK-AT ?auto_2167426 ?auto_2167430 ) ( ON ?auto_2167417 ?auto_2167416 ) ( ON ?auto_2167418 ?auto_2167417 ) ( ON ?auto_2167419 ?auto_2167418 ) ( ON ?auto_2167420 ?auto_2167419 ) ( ON ?auto_2167421 ?auto_2167420 ) ( ON ?auto_2167422 ?auto_2167421 ) ( ON ?auto_2167423 ?auto_2167422 ) ( not ( = ?auto_2167416 ?auto_2167417 ) ) ( not ( = ?auto_2167416 ?auto_2167418 ) ) ( not ( = ?auto_2167416 ?auto_2167419 ) ) ( not ( = ?auto_2167416 ?auto_2167420 ) ) ( not ( = ?auto_2167416 ?auto_2167421 ) ) ( not ( = ?auto_2167416 ?auto_2167422 ) ) ( not ( = ?auto_2167416 ?auto_2167423 ) ) ( not ( = ?auto_2167416 ?auto_2167424 ) ) ( not ( = ?auto_2167416 ?auto_2167425 ) ) ( not ( = ?auto_2167416 ?auto_2167428 ) ) ( not ( = ?auto_2167417 ?auto_2167418 ) ) ( not ( = ?auto_2167417 ?auto_2167419 ) ) ( not ( = ?auto_2167417 ?auto_2167420 ) ) ( not ( = ?auto_2167417 ?auto_2167421 ) ) ( not ( = ?auto_2167417 ?auto_2167422 ) ) ( not ( = ?auto_2167417 ?auto_2167423 ) ) ( not ( = ?auto_2167417 ?auto_2167424 ) ) ( not ( = ?auto_2167417 ?auto_2167425 ) ) ( not ( = ?auto_2167417 ?auto_2167428 ) ) ( not ( = ?auto_2167418 ?auto_2167419 ) ) ( not ( = ?auto_2167418 ?auto_2167420 ) ) ( not ( = ?auto_2167418 ?auto_2167421 ) ) ( not ( = ?auto_2167418 ?auto_2167422 ) ) ( not ( = ?auto_2167418 ?auto_2167423 ) ) ( not ( = ?auto_2167418 ?auto_2167424 ) ) ( not ( = ?auto_2167418 ?auto_2167425 ) ) ( not ( = ?auto_2167418 ?auto_2167428 ) ) ( not ( = ?auto_2167419 ?auto_2167420 ) ) ( not ( = ?auto_2167419 ?auto_2167421 ) ) ( not ( = ?auto_2167419 ?auto_2167422 ) ) ( not ( = ?auto_2167419 ?auto_2167423 ) ) ( not ( = ?auto_2167419 ?auto_2167424 ) ) ( not ( = ?auto_2167419 ?auto_2167425 ) ) ( not ( = ?auto_2167419 ?auto_2167428 ) ) ( not ( = ?auto_2167420 ?auto_2167421 ) ) ( not ( = ?auto_2167420 ?auto_2167422 ) ) ( not ( = ?auto_2167420 ?auto_2167423 ) ) ( not ( = ?auto_2167420 ?auto_2167424 ) ) ( not ( = ?auto_2167420 ?auto_2167425 ) ) ( not ( = ?auto_2167420 ?auto_2167428 ) ) ( not ( = ?auto_2167421 ?auto_2167422 ) ) ( not ( = ?auto_2167421 ?auto_2167423 ) ) ( not ( = ?auto_2167421 ?auto_2167424 ) ) ( not ( = ?auto_2167421 ?auto_2167425 ) ) ( not ( = ?auto_2167421 ?auto_2167428 ) ) ( not ( = ?auto_2167422 ?auto_2167423 ) ) ( not ( = ?auto_2167422 ?auto_2167424 ) ) ( not ( = ?auto_2167422 ?auto_2167425 ) ) ( not ( = ?auto_2167422 ?auto_2167428 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167423 ?auto_2167424 ?auto_2167425 )
      ( MAKE-9CRATE-VERIFY ?auto_2167416 ?auto_2167417 ?auto_2167418 ?auto_2167419 ?auto_2167420 ?auto_2167421 ?auto_2167422 ?auto_2167423 ?auto_2167424 ?auto_2167425 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2167432 - SURFACE
      ?auto_2167433 - SURFACE
      ?auto_2167434 - SURFACE
      ?auto_2167435 - SURFACE
      ?auto_2167436 - SURFACE
      ?auto_2167437 - SURFACE
      ?auto_2167438 - SURFACE
      ?auto_2167439 - SURFACE
      ?auto_2167440 - SURFACE
      ?auto_2167441 - SURFACE
      ?auto_2167442 - SURFACE
    )
    :vars
    (
      ?auto_2167448 - HOIST
      ?auto_2167444 - PLACE
      ?auto_2167447 - PLACE
      ?auto_2167446 - HOIST
      ?auto_2167445 - SURFACE
      ?auto_2167443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167448 ?auto_2167444 ) ( IS-CRATE ?auto_2167442 ) ( not ( = ?auto_2167441 ?auto_2167442 ) ) ( not ( = ?auto_2167440 ?auto_2167441 ) ) ( not ( = ?auto_2167440 ?auto_2167442 ) ) ( not ( = ?auto_2167447 ?auto_2167444 ) ) ( HOIST-AT ?auto_2167446 ?auto_2167447 ) ( not ( = ?auto_2167448 ?auto_2167446 ) ) ( AVAILABLE ?auto_2167446 ) ( SURFACE-AT ?auto_2167442 ?auto_2167447 ) ( ON ?auto_2167442 ?auto_2167445 ) ( CLEAR ?auto_2167442 ) ( not ( = ?auto_2167441 ?auto_2167445 ) ) ( not ( = ?auto_2167442 ?auto_2167445 ) ) ( not ( = ?auto_2167440 ?auto_2167445 ) ) ( SURFACE-AT ?auto_2167440 ?auto_2167444 ) ( CLEAR ?auto_2167440 ) ( IS-CRATE ?auto_2167441 ) ( AVAILABLE ?auto_2167448 ) ( IN ?auto_2167441 ?auto_2167443 ) ( TRUCK-AT ?auto_2167443 ?auto_2167447 ) ( ON ?auto_2167433 ?auto_2167432 ) ( ON ?auto_2167434 ?auto_2167433 ) ( ON ?auto_2167435 ?auto_2167434 ) ( ON ?auto_2167436 ?auto_2167435 ) ( ON ?auto_2167437 ?auto_2167436 ) ( ON ?auto_2167438 ?auto_2167437 ) ( ON ?auto_2167439 ?auto_2167438 ) ( ON ?auto_2167440 ?auto_2167439 ) ( not ( = ?auto_2167432 ?auto_2167433 ) ) ( not ( = ?auto_2167432 ?auto_2167434 ) ) ( not ( = ?auto_2167432 ?auto_2167435 ) ) ( not ( = ?auto_2167432 ?auto_2167436 ) ) ( not ( = ?auto_2167432 ?auto_2167437 ) ) ( not ( = ?auto_2167432 ?auto_2167438 ) ) ( not ( = ?auto_2167432 ?auto_2167439 ) ) ( not ( = ?auto_2167432 ?auto_2167440 ) ) ( not ( = ?auto_2167432 ?auto_2167441 ) ) ( not ( = ?auto_2167432 ?auto_2167442 ) ) ( not ( = ?auto_2167432 ?auto_2167445 ) ) ( not ( = ?auto_2167433 ?auto_2167434 ) ) ( not ( = ?auto_2167433 ?auto_2167435 ) ) ( not ( = ?auto_2167433 ?auto_2167436 ) ) ( not ( = ?auto_2167433 ?auto_2167437 ) ) ( not ( = ?auto_2167433 ?auto_2167438 ) ) ( not ( = ?auto_2167433 ?auto_2167439 ) ) ( not ( = ?auto_2167433 ?auto_2167440 ) ) ( not ( = ?auto_2167433 ?auto_2167441 ) ) ( not ( = ?auto_2167433 ?auto_2167442 ) ) ( not ( = ?auto_2167433 ?auto_2167445 ) ) ( not ( = ?auto_2167434 ?auto_2167435 ) ) ( not ( = ?auto_2167434 ?auto_2167436 ) ) ( not ( = ?auto_2167434 ?auto_2167437 ) ) ( not ( = ?auto_2167434 ?auto_2167438 ) ) ( not ( = ?auto_2167434 ?auto_2167439 ) ) ( not ( = ?auto_2167434 ?auto_2167440 ) ) ( not ( = ?auto_2167434 ?auto_2167441 ) ) ( not ( = ?auto_2167434 ?auto_2167442 ) ) ( not ( = ?auto_2167434 ?auto_2167445 ) ) ( not ( = ?auto_2167435 ?auto_2167436 ) ) ( not ( = ?auto_2167435 ?auto_2167437 ) ) ( not ( = ?auto_2167435 ?auto_2167438 ) ) ( not ( = ?auto_2167435 ?auto_2167439 ) ) ( not ( = ?auto_2167435 ?auto_2167440 ) ) ( not ( = ?auto_2167435 ?auto_2167441 ) ) ( not ( = ?auto_2167435 ?auto_2167442 ) ) ( not ( = ?auto_2167435 ?auto_2167445 ) ) ( not ( = ?auto_2167436 ?auto_2167437 ) ) ( not ( = ?auto_2167436 ?auto_2167438 ) ) ( not ( = ?auto_2167436 ?auto_2167439 ) ) ( not ( = ?auto_2167436 ?auto_2167440 ) ) ( not ( = ?auto_2167436 ?auto_2167441 ) ) ( not ( = ?auto_2167436 ?auto_2167442 ) ) ( not ( = ?auto_2167436 ?auto_2167445 ) ) ( not ( = ?auto_2167437 ?auto_2167438 ) ) ( not ( = ?auto_2167437 ?auto_2167439 ) ) ( not ( = ?auto_2167437 ?auto_2167440 ) ) ( not ( = ?auto_2167437 ?auto_2167441 ) ) ( not ( = ?auto_2167437 ?auto_2167442 ) ) ( not ( = ?auto_2167437 ?auto_2167445 ) ) ( not ( = ?auto_2167438 ?auto_2167439 ) ) ( not ( = ?auto_2167438 ?auto_2167440 ) ) ( not ( = ?auto_2167438 ?auto_2167441 ) ) ( not ( = ?auto_2167438 ?auto_2167442 ) ) ( not ( = ?auto_2167438 ?auto_2167445 ) ) ( not ( = ?auto_2167439 ?auto_2167440 ) ) ( not ( = ?auto_2167439 ?auto_2167441 ) ) ( not ( = ?auto_2167439 ?auto_2167442 ) ) ( not ( = ?auto_2167439 ?auto_2167445 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167440 ?auto_2167441 ?auto_2167442 )
      ( MAKE-10CRATE-VERIFY ?auto_2167432 ?auto_2167433 ?auto_2167434 ?auto_2167435 ?auto_2167436 ?auto_2167437 ?auto_2167438 ?auto_2167439 ?auto_2167440 ?auto_2167441 ?auto_2167442 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2167449 - SURFACE
      ?auto_2167450 - SURFACE
      ?auto_2167451 - SURFACE
      ?auto_2167452 - SURFACE
      ?auto_2167453 - SURFACE
      ?auto_2167454 - SURFACE
      ?auto_2167455 - SURFACE
      ?auto_2167456 - SURFACE
      ?auto_2167457 - SURFACE
      ?auto_2167458 - SURFACE
      ?auto_2167459 - SURFACE
      ?auto_2167460 - SURFACE
    )
    :vars
    (
      ?auto_2167466 - HOIST
      ?auto_2167462 - PLACE
      ?auto_2167465 - PLACE
      ?auto_2167464 - HOIST
      ?auto_2167463 - SURFACE
      ?auto_2167461 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167466 ?auto_2167462 ) ( IS-CRATE ?auto_2167460 ) ( not ( = ?auto_2167459 ?auto_2167460 ) ) ( not ( = ?auto_2167458 ?auto_2167459 ) ) ( not ( = ?auto_2167458 ?auto_2167460 ) ) ( not ( = ?auto_2167465 ?auto_2167462 ) ) ( HOIST-AT ?auto_2167464 ?auto_2167465 ) ( not ( = ?auto_2167466 ?auto_2167464 ) ) ( AVAILABLE ?auto_2167464 ) ( SURFACE-AT ?auto_2167460 ?auto_2167465 ) ( ON ?auto_2167460 ?auto_2167463 ) ( CLEAR ?auto_2167460 ) ( not ( = ?auto_2167459 ?auto_2167463 ) ) ( not ( = ?auto_2167460 ?auto_2167463 ) ) ( not ( = ?auto_2167458 ?auto_2167463 ) ) ( SURFACE-AT ?auto_2167458 ?auto_2167462 ) ( CLEAR ?auto_2167458 ) ( IS-CRATE ?auto_2167459 ) ( AVAILABLE ?auto_2167466 ) ( IN ?auto_2167459 ?auto_2167461 ) ( TRUCK-AT ?auto_2167461 ?auto_2167465 ) ( ON ?auto_2167450 ?auto_2167449 ) ( ON ?auto_2167451 ?auto_2167450 ) ( ON ?auto_2167452 ?auto_2167451 ) ( ON ?auto_2167453 ?auto_2167452 ) ( ON ?auto_2167454 ?auto_2167453 ) ( ON ?auto_2167455 ?auto_2167454 ) ( ON ?auto_2167456 ?auto_2167455 ) ( ON ?auto_2167457 ?auto_2167456 ) ( ON ?auto_2167458 ?auto_2167457 ) ( not ( = ?auto_2167449 ?auto_2167450 ) ) ( not ( = ?auto_2167449 ?auto_2167451 ) ) ( not ( = ?auto_2167449 ?auto_2167452 ) ) ( not ( = ?auto_2167449 ?auto_2167453 ) ) ( not ( = ?auto_2167449 ?auto_2167454 ) ) ( not ( = ?auto_2167449 ?auto_2167455 ) ) ( not ( = ?auto_2167449 ?auto_2167456 ) ) ( not ( = ?auto_2167449 ?auto_2167457 ) ) ( not ( = ?auto_2167449 ?auto_2167458 ) ) ( not ( = ?auto_2167449 ?auto_2167459 ) ) ( not ( = ?auto_2167449 ?auto_2167460 ) ) ( not ( = ?auto_2167449 ?auto_2167463 ) ) ( not ( = ?auto_2167450 ?auto_2167451 ) ) ( not ( = ?auto_2167450 ?auto_2167452 ) ) ( not ( = ?auto_2167450 ?auto_2167453 ) ) ( not ( = ?auto_2167450 ?auto_2167454 ) ) ( not ( = ?auto_2167450 ?auto_2167455 ) ) ( not ( = ?auto_2167450 ?auto_2167456 ) ) ( not ( = ?auto_2167450 ?auto_2167457 ) ) ( not ( = ?auto_2167450 ?auto_2167458 ) ) ( not ( = ?auto_2167450 ?auto_2167459 ) ) ( not ( = ?auto_2167450 ?auto_2167460 ) ) ( not ( = ?auto_2167450 ?auto_2167463 ) ) ( not ( = ?auto_2167451 ?auto_2167452 ) ) ( not ( = ?auto_2167451 ?auto_2167453 ) ) ( not ( = ?auto_2167451 ?auto_2167454 ) ) ( not ( = ?auto_2167451 ?auto_2167455 ) ) ( not ( = ?auto_2167451 ?auto_2167456 ) ) ( not ( = ?auto_2167451 ?auto_2167457 ) ) ( not ( = ?auto_2167451 ?auto_2167458 ) ) ( not ( = ?auto_2167451 ?auto_2167459 ) ) ( not ( = ?auto_2167451 ?auto_2167460 ) ) ( not ( = ?auto_2167451 ?auto_2167463 ) ) ( not ( = ?auto_2167452 ?auto_2167453 ) ) ( not ( = ?auto_2167452 ?auto_2167454 ) ) ( not ( = ?auto_2167452 ?auto_2167455 ) ) ( not ( = ?auto_2167452 ?auto_2167456 ) ) ( not ( = ?auto_2167452 ?auto_2167457 ) ) ( not ( = ?auto_2167452 ?auto_2167458 ) ) ( not ( = ?auto_2167452 ?auto_2167459 ) ) ( not ( = ?auto_2167452 ?auto_2167460 ) ) ( not ( = ?auto_2167452 ?auto_2167463 ) ) ( not ( = ?auto_2167453 ?auto_2167454 ) ) ( not ( = ?auto_2167453 ?auto_2167455 ) ) ( not ( = ?auto_2167453 ?auto_2167456 ) ) ( not ( = ?auto_2167453 ?auto_2167457 ) ) ( not ( = ?auto_2167453 ?auto_2167458 ) ) ( not ( = ?auto_2167453 ?auto_2167459 ) ) ( not ( = ?auto_2167453 ?auto_2167460 ) ) ( not ( = ?auto_2167453 ?auto_2167463 ) ) ( not ( = ?auto_2167454 ?auto_2167455 ) ) ( not ( = ?auto_2167454 ?auto_2167456 ) ) ( not ( = ?auto_2167454 ?auto_2167457 ) ) ( not ( = ?auto_2167454 ?auto_2167458 ) ) ( not ( = ?auto_2167454 ?auto_2167459 ) ) ( not ( = ?auto_2167454 ?auto_2167460 ) ) ( not ( = ?auto_2167454 ?auto_2167463 ) ) ( not ( = ?auto_2167455 ?auto_2167456 ) ) ( not ( = ?auto_2167455 ?auto_2167457 ) ) ( not ( = ?auto_2167455 ?auto_2167458 ) ) ( not ( = ?auto_2167455 ?auto_2167459 ) ) ( not ( = ?auto_2167455 ?auto_2167460 ) ) ( not ( = ?auto_2167455 ?auto_2167463 ) ) ( not ( = ?auto_2167456 ?auto_2167457 ) ) ( not ( = ?auto_2167456 ?auto_2167458 ) ) ( not ( = ?auto_2167456 ?auto_2167459 ) ) ( not ( = ?auto_2167456 ?auto_2167460 ) ) ( not ( = ?auto_2167456 ?auto_2167463 ) ) ( not ( = ?auto_2167457 ?auto_2167458 ) ) ( not ( = ?auto_2167457 ?auto_2167459 ) ) ( not ( = ?auto_2167457 ?auto_2167460 ) ) ( not ( = ?auto_2167457 ?auto_2167463 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167458 ?auto_2167459 ?auto_2167460 )
      ( MAKE-11CRATE-VERIFY ?auto_2167449 ?auto_2167450 ?auto_2167451 ?auto_2167452 ?auto_2167453 ?auto_2167454 ?auto_2167455 ?auto_2167456 ?auto_2167457 ?auto_2167458 ?auto_2167459 ?auto_2167460 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167467 - SURFACE
      ?auto_2167468 - SURFACE
      ?auto_2167469 - SURFACE
      ?auto_2167470 - SURFACE
      ?auto_2167471 - SURFACE
      ?auto_2167472 - SURFACE
      ?auto_2167473 - SURFACE
      ?auto_2167474 - SURFACE
      ?auto_2167475 - SURFACE
      ?auto_2167476 - SURFACE
      ?auto_2167477 - SURFACE
      ?auto_2167478 - SURFACE
      ?auto_2167479 - SURFACE
    )
    :vars
    (
      ?auto_2167485 - HOIST
      ?auto_2167481 - PLACE
      ?auto_2167484 - PLACE
      ?auto_2167483 - HOIST
      ?auto_2167482 - SURFACE
      ?auto_2167480 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167485 ?auto_2167481 ) ( IS-CRATE ?auto_2167479 ) ( not ( = ?auto_2167478 ?auto_2167479 ) ) ( not ( = ?auto_2167477 ?auto_2167478 ) ) ( not ( = ?auto_2167477 ?auto_2167479 ) ) ( not ( = ?auto_2167484 ?auto_2167481 ) ) ( HOIST-AT ?auto_2167483 ?auto_2167484 ) ( not ( = ?auto_2167485 ?auto_2167483 ) ) ( AVAILABLE ?auto_2167483 ) ( SURFACE-AT ?auto_2167479 ?auto_2167484 ) ( ON ?auto_2167479 ?auto_2167482 ) ( CLEAR ?auto_2167479 ) ( not ( = ?auto_2167478 ?auto_2167482 ) ) ( not ( = ?auto_2167479 ?auto_2167482 ) ) ( not ( = ?auto_2167477 ?auto_2167482 ) ) ( SURFACE-AT ?auto_2167477 ?auto_2167481 ) ( CLEAR ?auto_2167477 ) ( IS-CRATE ?auto_2167478 ) ( AVAILABLE ?auto_2167485 ) ( IN ?auto_2167478 ?auto_2167480 ) ( TRUCK-AT ?auto_2167480 ?auto_2167484 ) ( ON ?auto_2167468 ?auto_2167467 ) ( ON ?auto_2167469 ?auto_2167468 ) ( ON ?auto_2167470 ?auto_2167469 ) ( ON ?auto_2167471 ?auto_2167470 ) ( ON ?auto_2167472 ?auto_2167471 ) ( ON ?auto_2167473 ?auto_2167472 ) ( ON ?auto_2167474 ?auto_2167473 ) ( ON ?auto_2167475 ?auto_2167474 ) ( ON ?auto_2167476 ?auto_2167475 ) ( ON ?auto_2167477 ?auto_2167476 ) ( not ( = ?auto_2167467 ?auto_2167468 ) ) ( not ( = ?auto_2167467 ?auto_2167469 ) ) ( not ( = ?auto_2167467 ?auto_2167470 ) ) ( not ( = ?auto_2167467 ?auto_2167471 ) ) ( not ( = ?auto_2167467 ?auto_2167472 ) ) ( not ( = ?auto_2167467 ?auto_2167473 ) ) ( not ( = ?auto_2167467 ?auto_2167474 ) ) ( not ( = ?auto_2167467 ?auto_2167475 ) ) ( not ( = ?auto_2167467 ?auto_2167476 ) ) ( not ( = ?auto_2167467 ?auto_2167477 ) ) ( not ( = ?auto_2167467 ?auto_2167478 ) ) ( not ( = ?auto_2167467 ?auto_2167479 ) ) ( not ( = ?auto_2167467 ?auto_2167482 ) ) ( not ( = ?auto_2167468 ?auto_2167469 ) ) ( not ( = ?auto_2167468 ?auto_2167470 ) ) ( not ( = ?auto_2167468 ?auto_2167471 ) ) ( not ( = ?auto_2167468 ?auto_2167472 ) ) ( not ( = ?auto_2167468 ?auto_2167473 ) ) ( not ( = ?auto_2167468 ?auto_2167474 ) ) ( not ( = ?auto_2167468 ?auto_2167475 ) ) ( not ( = ?auto_2167468 ?auto_2167476 ) ) ( not ( = ?auto_2167468 ?auto_2167477 ) ) ( not ( = ?auto_2167468 ?auto_2167478 ) ) ( not ( = ?auto_2167468 ?auto_2167479 ) ) ( not ( = ?auto_2167468 ?auto_2167482 ) ) ( not ( = ?auto_2167469 ?auto_2167470 ) ) ( not ( = ?auto_2167469 ?auto_2167471 ) ) ( not ( = ?auto_2167469 ?auto_2167472 ) ) ( not ( = ?auto_2167469 ?auto_2167473 ) ) ( not ( = ?auto_2167469 ?auto_2167474 ) ) ( not ( = ?auto_2167469 ?auto_2167475 ) ) ( not ( = ?auto_2167469 ?auto_2167476 ) ) ( not ( = ?auto_2167469 ?auto_2167477 ) ) ( not ( = ?auto_2167469 ?auto_2167478 ) ) ( not ( = ?auto_2167469 ?auto_2167479 ) ) ( not ( = ?auto_2167469 ?auto_2167482 ) ) ( not ( = ?auto_2167470 ?auto_2167471 ) ) ( not ( = ?auto_2167470 ?auto_2167472 ) ) ( not ( = ?auto_2167470 ?auto_2167473 ) ) ( not ( = ?auto_2167470 ?auto_2167474 ) ) ( not ( = ?auto_2167470 ?auto_2167475 ) ) ( not ( = ?auto_2167470 ?auto_2167476 ) ) ( not ( = ?auto_2167470 ?auto_2167477 ) ) ( not ( = ?auto_2167470 ?auto_2167478 ) ) ( not ( = ?auto_2167470 ?auto_2167479 ) ) ( not ( = ?auto_2167470 ?auto_2167482 ) ) ( not ( = ?auto_2167471 ?auto_2167472 ) ) ( not ( = ?auto_2167471 ?auto_2167473 ) ) ( not ( = ?auto_2167471 ?auto_2167474 ) ) ( not ( = ?auto_2167471 ?auto_2167475 ) ) ( not ( = ?auto_2167471 ?auto_2167476 ) ) ( not ( = ?auto_2167471 ?auto_2167477 ) ) ( not ( = ?auto_2167471 ?auto_2167478 ) ) ( not ( = ?auto_2167471 ?auto_2167479 ) ) ( not ( = ?auto_2167471 ?auto_2167482 ) ) ( not ( = ?auto_2167472 ?auto_2167473 ) ) ( not ( = ?auto_2167472 ?auto_2167474 ) ) ( not ( = ?auto_2167472 ?auto_2167475 ) ) ( not ( = ?auto_2167472 ?auto_2167476 ) ) ( not ( = ?auto_2167472 ?auto_2167477 ) ) ( not ( = ?auto_2167472 ?auto_2167478 ) ) ( not ( = ?auto_2167472 ?auto_2167479 ) ) ( not ( = ?auto_2167472 ?auto_2167482 ) ) ( not ( = ?auto_2167473 ?auto_2167474 ) ) ( not ( = ?auto_2167473 ?auto_2167475 ) ) ( not ( = ?auto_2167473 ?auto_2167476 ) ) ( not ( = ?auto_2167473 ?auto_2167477 ) ) ( not ( = ?auto_2167473 ?auto_2167478 ) ) ( not ( = ?auto_2167473 ?auto_2167479 ) ) ( not ( = ?auto_2167473 ?auto_2167482 ) ) ( not ( = ?auto_2167474 ?auto_2167475 ) ) ( not ( = ?auto_2167474 ?auto_2167476 ) ) ( not ( = ?auto_2167474 ?auto_2167477 ) ) ( not ( = ?auto_2167474 ?auto_2167478 ) ) ( not ( = ?auto_2167474 ?auto_2167479 ) ) ( not ( = ?auto_2167474 ?auto_2167482 ) ) ( not ( = ?auto_2167475 ?auto_2167476 ) ) ( not ( = ?auto_2167475 ?auto_2167477 ) ) ( not ( = ?auto_2167475 ?auto_2167478 ) ) ( not ( = ?auto_2167475 ?auto_2167479 ) ) ( not ( = ?auto_2167475 ?auto_2167482 ) ) ( not ( = ?auto_2167476 ?auto_2167477 ) ) ( not ( = ?auto_2167476 ?auto_2167478 ) ) ( not ( = ?auto_2167476 ?auto_2167479 ) ) ( not ( = ?auto_2167476 ?auto_2167482 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167477 ?auto_2167478 ?auto_2167479 )
      ( MAKE-12CRATE-VERIFY ?auto_2167467 ?auto_2167468 ?auto_2167469 ?auto_2167470 ?auto_2167471 ?auto_2167472 ?auto_2167473 ?auto_2167474 ?auto_2167475 ?auto_2167476 ?auto_2167477 ?auto_2167478 ?auto_2167479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2167486 - SURFACE
      ?auto_2167487 - SURFACE
    )
    :vars
    (
      ?auto_2167494 - HOIST
      ?auto_2167489 - PLACE
      ?auto_2167490 - SURFACE
      ?auto_2167493 - PLACE
      ?auto_2167492 - HOIST
      ?auto_2167491 - SURFACE
      ?auto_2167488 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167494 ?auto_2167489 ) ( IS-CRATE ?auto_2167487 ) ( not ( = ?auto_2167486 ?auto_2167487 ) ) ( not ( = ?auto_2167490 ?auto_2167486 ) ) ( not ( = ?auto_2167490 ?auto_2167487 ) ) ( not ( = ?auto_2167493 ?auto_2167489 ) ) ( HOIST-AT ?auto_2167492 ?auto_2167493 ) ( not ( = ?auto_2167494 ?auto_2167492 ) ) ( SURFACE-AT ?auto_2167487 ?auto_2167493 ) ( ON ?auto_2167487 ?auto_2167491 ) ( CLEAR ?auto_2167487 ) ( not ( = ?auto_2167486 ?auto_2167491 ) ) ( not ( = ?auto_2167487 ?auto_2167491 ) ) ( not ( = ?auto_2167490 ?auto_2167491 ) ) ( SURFACE-AT ?auto_2167490 ?auto_2167489 ) ( CLEAR ?auto_2167490 ) ( IS-CRATE ?auto_2167486 ) ( AVAILABLE ?auto_2167494 ) ( TRUCK-AT ?auto_2167488 ?auto_2167493 ) ( LIFTING ?auto_2167492 ?auto_2167486 ) )
    :subtasks
    ( ( !LOAD ?auto_2167492 ?auto_2167486 ?auto_2167488 ?auto_2167493 )
      ( MAKE-2CRATE ?auto_2167490 ?auto_2167486 ?auto_2167487 )
      ( MAKE-1CRATE-VERIFY ?auto_2167486 ?auto_2167487 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2167495 - SURFACE
      ?auto_2167496 - SURFACE
      ?auto_2167497 - SURFACE
    )
    :vars
    (
      ?auto_2167502 - HOIST
      ?auto_2167500 - PLACE
      ?auto_2167498 - PLACE
      ?auto_2167499 - HOIST
      ?auto_2167503 - SURFACE
      ?auto_2167501 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167502 ?auto_2167500 ) ( IS-CRATE ?auto_2167497 ) ( not ( = ?auto_2167496 ?auto_2167497 ) ) ( not ( = ?auto_2167495 ?auto_2167496 ) ) ( not ( = ?auto_2167495 ?auto_2167497 ) ) ( not ( = ?auto_2167498 ?auto_2167500 ) ) ( HOIST-AT ?auto_2167499 ?auto_2167498 ) ( not ( = ?auto_2167502 ?auto_2167499 ) ) ( SURFACE-AT ?auto_2167497 ?auto_2167498 ) ( ON ?auto_2167497 ?auto_2167503 ) ( CLEAR ?auto_2167497 ) ( not ( = ?auto_2167496 ?auto_2167503 ) ) ( not ( = ?auto_2167497 ?auto_2167503 ) ) ( not ( = ?auto_2167495 ?auto_2167503 ) ) ( SURFACE-AT ?auto_2167495 ?auto_2167500 ) ( CLEAR ?auto_2167495 ) ( IS-CRATE ?auto_2167496 ) ( AVAILABLE ?auto_2167502 ) ( TRUCK-AT ?auto_2167501 ?auto_2167498 ) ( LIFTING ?auto_2167499 ?auto_2167496 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2167496 ?auto_2167497 )
      ( MAKE-2CRATE-VERIFY ?auto_2167495 ?auto_2167496 ?auto_2167497 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2167504 - SURFACE
      ?auto_2167505 - SURFACE
      ?auto_2167506 - SURFACE
      ?auto_2167507 - SURFACE
    )
    :vars
    (
      ?auto_2167513 - HOIST
      ?auto_2167511 - PLACE
      ?auto_2167510 - PLACE
      ?auto_2167508 - HOIST
      ?auto_2167512 - SURFACE
      ?auto_2167509 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167513 ?auto_2167511 ) ( IS-CRATE ?auto_2167507 ) ( not ( = ?auto_2167506 ?auto_2167507 ) ) ( not ( = ?auto_2167505 ?auto_2167506 ) ) ( not ( = ?auto_2167505 ?auto_2167507 ) ) ( not ( = ?auto_2167510 ?auto_2167511 ) ) ( HOIST-AT ?auto_2167508 ?auto_2167510 ) ( not ( = ?auto_2167513 ?auto_2167508 ) ) ( SURFACE-AT ?auto_2167507 ?auto_2167510 ) ( ON ?auto_2167507 ?auto_2167512 ) ( CLEAR ?auto_2167507 ) ( not ( = ?auto_2167506 ?auto_2167512 ) ) ( not ( = ?auto_2167507 ?auto_2167512 ) ) ( not ( = ?auto_2167505 ?auto_2167512 ) ) ( SURFACE-AT ?auto_2167505 ?auto_2167511 ) ( CLEAR ?auto_2167505 ) ( IS-CRATE ?auto_2167506 ) ( AVAILABLE ?auto_2167513 ) ( TRUCK-AT ?auto_2167509 ?auto_2167510 ) ( LIFTING ?auto_2167508 ?auto_2167506 ) ( ON ?auto_2167505 ?auto_2167504 ) ( not ( = ?auto_2167504 ?auto_2167505 ) ) ( not ( = ?auto_2167504 ?auto_2167506 ) ) ( not ( = ?auto_2167504 ?auto_2167507 ) ) ( not ( = ?auto_2167504 ?auto_2167512 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167505 ?auto_2167506 ?auto_2167507 )
      ( MAKE-3CRATE-VERIFY ?auto_2167504 ?auto_2167505 ?auto_2167506 ?auto_2167507 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2167514 - SURFACE
      ?auto_2167515 - SURFACE
      ?auto_2167516 - SURFACE
      ?auto_2167517 - SURFACE
      ?auto_2167518 - SURFACE
    )
    :vars
    (
      ?auto_2167524 - HOIST
      ?auto_2167522 - PLACE
      ?auto_2167521 - PLACE
      ?auto_2167519 - HOIST
      ?auto_2167523 - SURFACE
      ?auto_2167520 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167524 ?auto_2167522 ) ( IS-CRATE ?auto_2167518 ) ( not ( = ?auto_2167517 ?auto_2167518 ) ) ( not ( = ?auto_2167516 ?auto_2167517 ) ) ( not ( = ?auto_2167516 ?auto_2167518 ) ) ( not ( = ?auto_2167521 ?auto_2167522 ) ) ( HOIST-AT ?auto_2167519 ?auto_2167521 ) ( not ( = ?auto_2167524 ?auto_2167519 ) ) ( SURFACE-AT ?auto_2167518 ?auto_2167521 ) ( ON ?auto_2167518 ?auto_2167523 ) ( CLEAR ?auto_2167518 ) ( not ( = ?auto_2167517 ?auto_2167523 ) ) ( not ( = ?auto_2167518 ?auto_2167523 ) ) ( not ( = ?auto_2167516 ?auto_2167523 ) ) ( SURFACE-AT ?auto_2167516 ?auto_2167522 ) ( CLEAR ?auto_2167516 ) ( IS-CRATE ?auto_2167517 ) ( AVAILABLE ?auto_2167524 ) ( TRUCK-AT ?auto_2167520 ?auto_2167521 ) ( LIFTING ?auto_2167519 ?auto_2167517 ) ( ON ?auto_2167515 ?auto_2167514 ) ( ON ?auto_2167516 ?auto_2167515 ) ( not ( = ?auto_2167514 ?auto_2167515 ) ) ( not ( = ?auto_2167514 ?auto_2167516 ) ) ( not ( = ?auto_2167514 ?auto_2167517 ) ) ( not ( = ?auto_2167514 ?auto_2167518 ) ) ( not ( = ?auto_2167514 ?auto_2167523 ) ) ( not ( = ?auto_2167515 ?auto_2167516 ) ) ( not ( = ?auto_2167515 ?auto_2167517 ) ) ( not ( = ?auto_2167515 ?auto_2167518 ) ) ( not ( = ?auto_2167515 ?auto_2167523 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167516 ?auto_2167517 ?auto_2167518 )
      ( MAKE-4CRATE-VERIFY ?auto_2167514 ?auto_2167515 ?auto_2167516 ?auto_2167517 ?auto_2167518 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2167525 - SURFACE
      ?auto_2167526 - SURFACE
      ?auto_2167527 - SURFACE
      ?auto_2167528 - SURFACE
      ?auto_2167529 - SURFACE
      ?auto_2167530 - SURFACE
    )
    :vars
    (
      ?auto_2167536 - HOIST
      ?auto_2167534 - PLACE
      ?auto_2167533 - PLACE
      ?auto_2167531 - HOIST
      ?auto_2167535 - SURFACE
      ?auto_2167532 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167536 ?auto_2167534 ) ( IS-CRATE ?auto_2167530 ) ( not ( = ?auto_2167529 ?auto_2167530 ) ) ( not ( = ?auto_2167528 ?auto_2167529 ) ) ( not ( = ?auto_2167528 ?auto_2167530 ) ) ( not ( = ?auto_2167533 ?auto_2167534 ) ) ( HOIST-AT ?auto_2167531 ?auto_2167533 ) ( not ( = ?auto_2167536 ?auto_2167531 ) ) ( SURFACE-AT ?auto_2167530 ?auto_2167533 ) ( ON ?auto_2167530 ?auto_2167535 ) ( CLEAR ?auto_2167530 ) ( not ( = ?auto_2167529 ?auto_2167535 ) ) ( not ( = ?auto_2167530 ?auto_2167535 ) ) ( not ( = ?auto_2167528 ?auto_2167535 ) ) ( SURFACE-AT ?auto_2167528 ?auto_2167534 ) ( CLEAR ?auto_2167528 ) ( IS-CRATE ?auto_2167529 ) ( AVAILABLE ?auto_2167536 ) ( TRUCK-AT ?auto_2167532 ?auto_2167533 ) ( LIFTING ?auto_2167531 ?auto_2167529 ) ( ON ?auto_2167526 ?auto_2167525 ) ( ON ?auto_2167527 ?auto_2167526 ) ( ON ?auto_2167528 ?auto_2167527 ) ( not ( = ?auto_2167525 ?auto_2167526 ) ) ( not ( = ?auto_2167525 ?auto_2167527 ) ) ( not ( = ?auto_2167525 ?auto_2167528 ) ) ( not ( = ?auto_2167525 ?auto_2167529 ) ) ( not ( = ?auto_2167525 ?auto_2167530 ) ) ( not ( = ?auto_2167525 ?auto_2167535 ) ) ( not ( = ?auto_2167526 ?auto_2167527 ) ) ( not ( = ?auto_2167526 ?auto_2167528 ) ) ( not ( = ?auto_2167526 ?auto_2167529 ) ) ( not ( = ?auto_2167526 ?auto_2167530 ) ) ( not ( = ?auto_2167526 ?auto_2167535 ) ) ( not ( = ?auto_2167527 ?auto_2167528 ) ) ( not ( = ?auto_2167527 ?auto_2167529 ) ) ( not ( = ?auto_2167527 ?auto_2167530 ) ) ( not ( = ?auto_2167527 ?auto_2167535 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167528 ?auto_2167529 ?auto_2167530 )
      ( MAKE-5CRATE-VERIFY ?auto_2167525 ?auto_2167526 ?auto_2167527 ?auto_2167528 ?auto_2167529 ?auto_2167530 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2167537 - SURFACE
      ?auto_2167538 - SURFACE
      ?auto_2167539 - SURFACE
      ?auto_2167540 - SURFACE
      ?auto_2167541 - SURFACE
      ?auto_2167542 - SURFACE
      ?auto_2167543 - SURFACE
    )
    :vars
    (
      ?auto_2167549 - HOIST
      ?auto_2167547 - PLACE
      ?auto_2167546 - PLACE
      ?auto_2167544 - HOIST
      ?auto_2167548 - SURFACE
      ?auto_2167545 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167549 ?auto_2167547 ) ( IS-CRATE ?auto_2167543 ) ( not ( = ?auto_2167542 ?auto_2167543 ) ) ( not ( = ?auto_2167541 ?auto_2167542 ) ) ( not ( = ?auto_2167541 ?auto_2167543 ) ) ( not ( = ?auto_2167546 ?auto_2167547 ) ) ( HOIST-AT ?auto_2167544 ?auto_2167546 ) ( not ( = ?auto_2167549 ?auto_2167544 ) ) ( SURFACE-AT ?auto_2167543 ?auto_2167546 ) ( ON ?auto_2167543 ?auto_2167548 ) ( CLEAR ?auto_2167543 ) ( not ( = ?auto_2167542 ?auto_2167548 ) ) ( not ( = ?auto_2167543 ?auto_2167548 ) ) ( not ( = ?auto_2167541 ?auto_2167548 ) ) ( SURFACE-AT ?auto_2167541 ?auto_2167547 ) ( CLEAR ?auto_2167541 ) ( IS-CRATE ?auto_2167542 ) ( AVAILABLE ?auto_2167549 ) ( TRUCK-AT ?auto_2167545 ?auto_2167546 ) ( LIFTING ?auto_2167544 ?auto_2167542 ) ( ON ?auto_2167538 ?auto_2167537 ) ( ON ?auto_2167539 ?auto_2167538 ) ( ON ?auto_2167540 ?auto_2167539 ) ( ON ?auto_2167541 ?auto_2167540 ) ( not ( = ?auto_2167537 ?auto_2167538 ) ) ( not ( = ?auto_2167537 ?auto_2167539 ) ) ( not ( = ?auto_2167537 ?auto_2167540 ) ) ( not ( = ?auto_2167537 ?auto_2167541 ) ) ( not ( = ?auto_2167537 ?auto_2167542 ) ) ( not ( = ?auto_2167537 ?auto_2167543 ) ) ( not ( = ?auto_2167537 ?auto_2167548 ) ) ( not ( = ?auto_2167538 ?auto_2167539 ) ) ( not ( = ?auto_2167538 ?auto_2167540 ) ) ( not ( = ?auto_2167538 ?auto_2167541 ) ) ( not ( = ?auto_2167538 ?auto_2167542 ) ) ( not ( = ?auto_2167538 ?auto_2167543 ) ) ( not ( = ?auto_2167538 ?auto_2167548 ) ) ( not ( = ?auto_2167539 ?auto_2167540 ) ) ( not ( = ?auto_2167539 ?auto_2167541 ) ) ( not ( = ?auto_2167539 ?auto_2167542 ) ) ( not ( = ?auto_2167539 ?auto_2167543 ) ) ( not ( = ?auto_2167539 ?auto_2167548 ) ) ( not ( = ?auto_2167540 ?auto_2167541 ) ) ( not ( = ?auto_2167540 ?auto_2167542 ) ) ( not ( = ?auto_2167540 ?auto_2167543 ) ) ( not ( = ?auto_2167540 ?auto_2167548 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167541 ?auto_2167542 ?auto_2167543 )
      ( MAKE-6CRATE-VERIFY ?auto_2167537 ?auto_2167538 ?auto_2167539 ?auto_2167540 ?auto_2167541 ?auto_2167542 ?auto_2167543 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2167550 - SURFACE
      ?auto_2167551 - SURFACE
      ?auto_2167552 - SURFACE
      ?auto_2167553 - SURFACE
      ?auto_2167554 - SURFACE
      ?auto_2167555 - SURFACE
      ?auto_2167556 - SURFACE
      ?auto_2167557 - SURFACE
    )
    :vars
    (
      ?auto_2167563 - HOIST
      ?auto_2167561 - PLACE
      ?auto_2167560 - PLACE
      ?auto_2167558 - HOIST
      ?auto_2167562 - SURFACE
      ?auto_2167559 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167563 ?auto_2167561 ) ( IS-CRATE ?auto_2167557 ) ( not ( = ?auto_2167556 ?auto_2167557 ) ) ( not ( = ?auto_2167555 ?auto_2167556 ) ) ( not ( = ?auto_2167555 ?auto_2167557 ) ) ( not ( = ?auto_2167560 ?auto_2167561 ) ) ( HOIST-AT ?auto_2167558 ?auto_2167560 ) ( not ( = ?auto_2167563 ?auto_2167558 ) ) ( SURFACE-AT ?auto_2167557 ?auto_2167560 ) ( ON ?auto_2167557 ?auto_2167562 ) ( CLEAR ?auto_2167557 ) ( not ( = ?auto_2167556 ?auto_2167562 ) ) ( not ( = ?auto_2167557 ?auto_2167562 ) ) ( not ( = ?auto_2167555 ?auto_2167562 ) ) ( SURFACE-AT ?auto_2167555 ?auto_2167561 ) ( CLEAR ?auto_2167555 ) ( IS-CRATE ?auto_2167556 ) ( AVAILABLE ?auto_2167563 ) ( TRUCK-AT ?auto_2167559 ?auto_2167560 ) ( LIFTING ?auto_2167558 ?auto_2167556 ) ( ON ?auto_2167551 ?auto_2167550 ) ( ON ?auto_2167552 ?auto_2167551 ) ( ON ?auto_2167553 ?auto_2167552 ) ( ON ?auto_2167554 ?auto_2167553 ) ( ON ?auto_2167555 ?auto_2167554 ) ( not ( = ?auto_2167550 ?auto_2167551 ) ) ( not ( = ?auto_2167550 ?auto_2167552 ) ) ( not ( = ?auto_2167550 ?auto_2167553 ) ) ( not ( = ?auto_2167550 ?auto_2167554 ) ) ( not ( = ?auto_2167550 ?auto_2167555 ) ) ( not ( = ?auto_2167550 ?auto_2167556 ) ) ( not ( = ?auto_2167550 ?auto_2167557 ) ) ( not ( = ?auto_2167550 ?auto_2167562 ) ) ( not ( = ?auto_2167551 ?auto_2167552 ) ) ( not ( = ?auto_2167551 ?auto_2167553 ) ) ( not ( = ?auto_2167551 ?auto_2167554 ) ) ( not ( = ?auto_2167551 ?auto_2167555 ) ) ( not ( = ?auto_2167551 ?auto_2167556 ) ) ( not ( = ?auto_2167551 ?auto_2167557 ) ) ( not ( = ?auto_2167551 ?auto_2167562 ) ) ( not ( = ?auto_2167552 ?auto_2167553 ) ) ( not ( = ?auto_2167552 ?auto_2167554 ) ) ( not ( = ?auto_2167552 ?auto_2167555 ) ) ( not ( = ?auto_2167552 ?auto_2167556 ) ) ( not ( = ?auto_2167552 ?auto_2167557 ) ) ( not ( = ?auto_2167552 ?auto_2167562 ) ) ( not ( = ?auto_2167553 ?auto_2167554 ) ) ( not ( = ?auto_2167553 ?auto_2167555 ) ) ( not ( = ?auto_2167553 ?auto_2167556 ) ) ( not ( = ?auto_2167553 ?auto_2167557 ) ) ( not ( = ?auto_2167553 ?auto_2167562 ) ) ( not ( = ?auto_2167554 ?auto_2167555 ) ) ( not ( = ?auto_2167554 ?auto_2167556 ) ) ( not ( = ?auto_2167554 ?auto_2167557 ) ) ( not ( = ?auto_2167554 ?auto_2167562 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167555 ?auto_2167556 ?auto_2167557 )
      ( MAKE-7CRATE-VERIFY ?auto_2167550 ?auto_2167551 ?auto_2167552 ?auto_2167553 ?auto_2167554 ?auto_2167555 ?auto_2167556 ?auto_2167557 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2167564 - SURFACE
      ?auto_2167565 - SURFACE
      ?auto_2167566 - SURFACE
      ?auto_2167567 - SURFACE
      ?auto_2167568 - SURFACE
      ?auto_2167569 - SURFACE
      ?auto_2167570 - SURFACE
      ?auto_2167571 - SURFACE
      ?auto_2167572 - SURFACE
    )
    :vars
    (
      ?auto_2167578 - HOIST
      ?auto_2167576 - PLACE
      ?auto_2167575 - PLACE
      ?auto_2167573 - HOIST
      ?auto_2167577 - SURFACE
      ?auto_2167574 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167578 ?auto_2167576 ) ( IS-CRATE ?auto_2167572 ) ( not ( = ?auto_2167571 ?auto_2167572 ) ) ( not ( = ?auto_2167570 ?auto_2167571 ) ) ( not ( = ?auto_2167570 ?auto_2167572 ) ) ( not ( = ?auto_2167575 ?auto_2167576 ) ) ( HOIST-AT ?auto_2167573 ?auto_2167575 ) ( not ( = ?auto_2167578 ?auto_2167573 ) ) ( SURFACE-AT ?auto_2167572 ?auto_2167575 ) ( ON ?auto_2167572 ?auto_2167577 ) ( CLEAR ?auto_2167572 ) ( not ( = ?auto_2167571 ?auto_2167577 ) ) ( not ( = ?auto_2167572 ?auto_2167577 ) ) ( not ( = ?auto_2167570 ?auto_2167577 ) ) ( SURFACE-AT ?auto_2167570 ?auto_2167576 ) ( CLEAR ?auto_2167570 ) ( IS-CRATE ?auto_2167571 ) ( AVAILABLE ?auto_2167578 ) ( TRUCK-AT ?auto_2167574 ?auto_2167575 ) ( LIFTING ?auto_2167573 ?auto_2167571 ) ( ON ?auto_2167565 ?auto_2167564 ) ( ON ?auto_2167566 ?auto_2167565 ) ( ON ?auto_2167567 ?auto_2167566 ) ( ON ?auto_2167568 ?auto_2167567 ) ( ON ?auto_2167569 ?auto_2167568 ) ( ON ?auto_2167570 ?auto_2167569 ) ( not ( = ?auto_2167564 ?auto_2167565 ) ) ( not ( = ?auto_2167564 ?auto_2167566 ) ) ( not ( = ?auto_2167564 ?auto_2167567 ) ) ( not ( = ?auto_2167564 ?auto_2167568 ) ) ( not ( = ?auto_2167564 ?auto_2167569 ) ) ( not ( = ?auto_2167564 ?auto_2167570 ) ) ( not ( = ?auto_2167564 ?auto_2167571 ) ) ( not ( = ?auto_2167564 ?auto_2167572 ) ) ( not ( = ?auto_2167564 ?auto_2167577 ) ) ( not ( = ?auto_2167565 ?auto_2167566 ) ) ( not ( = ?auto_2167565 ?auto_2167567 ) ) ( not ( = ?auto_2167565 ?auto_2167568 ) ) ( not ( = ?auto_2167565 ?auto_2167569 ) ) ( not ( = ?auto_2167565 ?auto_2167570 ) ) ( not ( = ?auto_2167565 ?auto_2167571 ) ) ( not ( = ?auto_2167565 ?auto_2167572 ) ) ( not ( = ?auto_2167565 ?auto_2167577 ) ) ( not ( = ?auto_2167566 ?auto_2167567 ) ) ( not ( = ?auto_2167566 ?auto_2167568 ) ) ( not ( = ?auto_2167566 ?auto_2167569 ) ) ( not ( = ?auto_2167566 ?auto_2167570 ) ) ( not ( = ?auto_2167566 ?auto_2167571 ) ) ( not ( = ?auto_2167566 ?auto_2167572 ) ) ( not ( = ?auto_2167566 ?auto_2167577 ) ) ( not ( = ?auto_2167567 ?auto_2167568 ) ) ( not ( = ?auto_2167567 ?auto_2167569 ) ) ( not ( = ?auto_2167567 ?auto_2167570 ) ) ( not ( = ?auto_2167567 ?auto_2167571 ) ) ( not ( = ?auto_2167567 ?auto_2167572 ) ) ( not ( = ?auto_2167567 ?auto_2167577 ) ) ( not ( = ?auto_2167568 ?auto_2167569 ) ) ( not ( = ?auto_2167568 ?auto_2167570 ) ) ( not ( = ?auto_2167568 ?auto_2167571 ) ) ( not ( = ?auto_2167568 ?auto_2167572 ) ) ( not ( = ?auto_2167568 ?auto_2167577 ) ) ( not ( = ?auto_2167569 ?auto_2167570 ) ) ( not ( = ?auto_2167569 ?auto_2167571 ) ) ( not ( = ?auto_2167569 ?auto_2167572 ) ) ( not ( = ?auto_2167569 ?auto_2167577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167570 ?auto_2167571 ?auto_2167572 )
      ( MAKE-8CRATE-VERIFY ?auto_2167564 ?auto_2167565 ?auto_2167566 ?auto_2167567 ?auto_2167568 ?auto_2167569 ?auto_2167570 ?auto_2167571 ?auto_2167572 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2167579 - SURFACE
      ?auto_2167580 - SURFACE
      ?auto_2167581 - SURFACE
      ?auto_2167582 - SURFACE
      ?auto_2167583 - SURFACE
      ?auto_2167584 - SURFACE
      ?auto_2167585 - SURFACE
      ?auto_2167586 - SURFACE
      ?auto_2167587 - SURFACE
      ?auto_2167588 - SURFACE
    )
    :vars
    (
      ?auto_2167594 - HOIST
      ?auto_2167592 - PLACE
      ?auto_2167591 - PLACE
      ?auto_2167589 - HOIST
      ?auto_2167593 - SURFACE
      ?auto_2167590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167594 ?auto_2167592 ) ( IS-CRATE ?auto_2167588 ) ( not ( = ?auto_2167587 ?auto_2167588 ) ) ( not ( = ?auto_2167586 ?auto_2167587 ) ) ( not ( = ?auto_2167586 ?auto_2167588 ) ) ( not ( = ?auto_2167591 ?auto_2167592 ) ) ( HOIST-AT ?auto_2167589 ?auto_2167591 ) ( not ( = ?auto_2167594 ?auto_2167589 ) ) ( SURFACE-AT ?auto_2167588 ?auto_2167591 ) ( ON ?auto_2167588 ?auto_2167593 ) ( CLEAR ?auto_2167588 ) ( not ( = ?auto_2167587 ?auto_2167593 ) ) ( not ( = ?auto_2167588 ?auto_2167593 ) ) ( not ( = ?auto_2167586 ?auto_2167593 ) ) ( SURFACE-AT ?auto_2167586 ?auto_2167592 ) ( CLEAR ?auto_2167586 ) ( IS-CRATE ?auto_2167587 ) ( AVAILABLE ?auto_2167594 ) ( TRUCK-AT ?auto_2167590 ?auto_2167591 ) ( LIFTING ?auto_2167589 ?auto_2167587 ) ( ON ?auto_2167580 ?auto_2167579 ) ( ON ?auto_2167581 ?auto_2167580 ) ( ON ?auto_2167582 ?auto_2167581 ) ( ON ?auto_2167583 ?auto_2167582 ) ( ON ?auto_2167584 ?auto_2167583 ) ( ON ?auto_2167585 ?auto_2167584 ) ( ON ?auto_2167586 ?auto_2167585 ) ( not ( = ?auto_2167579 ?auto_2167580 ) ) ( not ( = ?auto_2167579 ?auto_2167581 ) ) ( not ( = ?auto_2167579 ?auto_2167582 ) ) ( not ( = ?auto_2167579 ?auto_2167583 ) ) ( not ( = ?auto_2167579 ?auto_2167584 ) ) ( not ( = ?auto_2167579 ?auto_2167585 ) ) ( not ( = ?auto_2167579 ?auto_2167586 ) ) ( not ( = ?auto_2167579 ?auto_2167587 ) ) ( not ( = ?auto_2167579 ?auto_2167588 ) ) ( not ( = ?auto_2167579 ?auto_2167593 ) ) ( not ( = ?auto_2167580 ?auto_2167581 ) ) ( not ( = ?auto_2167580 ?auto_2167582 ) ) ( not ( = ?auto_2167580 ?auto_2167583 ) ) ( not ( = ?auto_2167580 ?auto_2167584 ) ) ( not ( = ?auto_2167580 ?auto_2167585 ) ) ( not ( = ?auto_2167580 ?auto_2167586 ) ) ( not ( = ?auto_2167580 ?auto_2167587 ) ) ( not ( = ?auto_2167580 ?auto_2167588 ) ) ( not ( = ?auto_2167580 ?auto_2167593 ) ) ( not ( = ?auto_2167581 ?auto_2167582 ) ) ( not ( = ?auto_2167581 ?auto_2167583 ) ) ( not ( = ?auto_2167581 ?auto_2167584 ) ) ( not ( = ?auto_2167581 ?auto_2167585 ) ) ( not ( = ?auto_2167581 ?auto_2167586 ) ) ( not ( = ?auto_2167581 ?auto_2167587 ) ) ( not ( = ?auto_2167581 ?auto_2167588 ) ) ( not ( = ?auto_2167581 ?auto_2167593 ) ) ( not ( = ?auto_2167582 ?auto_2167583 ) ) ( not ( = ?auto_2167582 ?auto_2167584 ) ) ( not ( = ?auto_2167582 ?auto_2167585 ) ) ( not ( = ?auto_2167582 ?auto_2167586 ) ) ( not ( = ?auto_2167582 ?auto_2167587 ) ) ( not ( = ?auto_2167582 ?auto_2167588 ) ) ( not ( = ?auto_2167582 ?auto_2167593 ) ) ( not ( = ?auto_2167583 ?auto_2167584 ) ) ( not ( = ?auto_2167583 ?auto_2167585 ) ) ( not ( = ?auto_2167583 ?auto_2167586 ) ) ( not ( = ?auto_2167583 ?auto_2167587 ) ) ( not ( = ?auto_2167583 ?auto_2167588 ) ) ( not ( = ?auto_2167583 ?auto_2167593 ) ) ( not ( = ?auto_2167584 ?auto_2167585 ) ) ( not ( = ?auto_2167584 ?auto_2167586 ) ) ( not ( = ?auto_2167584 ?auto_2167587 ) ) ( not ( = ?auto_2167584 ?auto_2167588 ) ) ( not ( = ?auto_2167584 ?auto_2167593 ) ) ( not ( = ?auto_2167585 ?auto_2167586 ) ) ( not ( = ?auto_2167585 ?auto_2167587 ) ) ( not ( = ?auto_2167585 ?auto_2167588 ) ) ( not ( = ?auto_2167585 ?auto_2167593 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167586 ?auto_2167587 ?auto_2167588 )
      ( MAKE-9CRATE-VERIFY ?auto_2167579 ?auto_2167580 ?auto_2167581 ?auto_2167582 ?auto_2167583 ?auto_2167584 ?auto_2167585 ?auto_2167586 ?auto_2167587 ?auto_2167588 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2167595 - SURFACE
      ?auto_2167596 - SURFACE
      ?auto_2167597 - SURFACE
      ?auto_2167598 - SURFACE
      ?auto_2167599 - SURFACE
      ?auto_2167600 - SURFACE
      ?auto_2167601 - SURFACE
      ?auto_2167602 - SURFACE
      ?auto_2167603 - SURFACE
      ?auto_2167604 - SURFACE
      ?auto_2167605 - SURFACE
    )
    :vars
    (
      ?auto_2167611 - HOIST
      ?auto_2167609 - PLACE
      ?auto_2167608 - PLACE
      ?auto_2167606 - HOIST
      ?auto_2167610 - SURFACE
      ?auto_2167607 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167611 ?auto_2167609 ) ( IS-CRATE ?auto_2167605 ) ( not ( = ?auto_2167604 ?auto_2167605 ) ) ( not ( = ?auto_2167603 ?auto_2167604 ) ) ( not ( = ?auto_2167603 ?auto_2167605 ) ) ( not ( = ?auto_2167608 ?auto_2167609 ) ) ( HOIST-AT ?auto_2167606 ?auto_2167608 ) ( not ( = ?auto_2167611 ?auto_2167606 ) ) ( SURFACE-AT ?auto_2167605 ?auto_2167608 ) ( ON ?auto_2167605 ?auto_2167610 ) ( CLEAR ?auto_2167605 ) ( not ( = ?auto_2167604 ?auto_2167610 ) ) ( not ( = ?auto_2167605 ?auto_2167610 ) ) ( not ( = ?auto_2167603 ?auto_2167610 ) ) ( SURFACE-AT ?auto_2167603 ?auto_2167609 ) ( CLEAR ?auto_2167603 ) ( IS-CRATE ?auto_2167604 ) ( AVAILABLE ?auto_2167611 ) ( TRUCK-AT ?auto_2167607 ?auto_2167608 ) ( LIFTING ?auto_2167606 ?auto_2167604 ) ( ON ?auto_2167596 ?auto_2167595 ) ( ON ?auto_2167597 ?auto_2167596 ) ( ON ?auto_2167598 ?auto_2167597 ) ( ON ?auto_2167599 ?auto_2167598 ) ( ON ?auto_2167600 ?auto_2167599 ) ( ON ?auto_2167601 ?auto_2167600 ) ( ON ?auto_2167602 ?auto_2167601 ) ( ON ?auto_2167603 ?auto_2167602 ) ( not ( = ?auto_2167595 ?auto_2167596 ) ) ( not ( = ?auto_2167595 ?auto_2167597 ) ) ( not ( = ?auto_2167595 ?auto_2167598 ) ) ( not ( = ?auto_2167595 ?auto_2167599 ) ) ( not ( = ?auto_2167595 ?auto_2167600 ) ) ( not ( = ?auto_2167595 ?auto_2167601 ) ) ( not ( = ?auto_2167595 ?auto_2167602 ) ) ( not ( = ?auto_2167595 ?auto_2167603 ) ) ( not ( = ?auto_2167595 ?auto_2167604 ) ) ( not ( = ?auto_2167595 ?auto_2167605 ) ) ( not ( = ?auto_2167595 ?auto_2167610 ) ) ( not ( = ?auto_2167596 ?auto_2167597 ) ) ( not ( = ?auto_2167596 ?auto_2167598 ) ) ( not ( = ?auto_2167596 ?auto_2167599 ) ) ( not ( = ?auto_2167596 ?auto_2167600 ) ) ( not ( = ?auto_2167596 ?auto_2167601 ) ) ( not ( = ?auto_2167596 ?auto_2167602 ) ) ( not ( = ?auto_2167596 ?auto_2167603 ) ) ( not ( = ?auto_2167596 ?auto_2167604 ) ) ( not ( = ?auto_2167596 ?auto_2167605 ) ) ( not ( = ?auto_2167596 ?auto_2167610 ) ) ( not ( = ?auto_2167597 ?auto_2167598 ) ) ( not ( = ?auto_2167597 ?auto_2167599 ) ) ( not ( = ?auto_2167597 ?auto_2167600 ) ) ( not ( = ?auto_2167597 ?auto_2167601 ) ) ( not ( = ?auto_2167597 ?auto_2167602 ) ) ( not ( = ?auto_2167597 ?auto_2167603 ) ) ( not ( = ?auto_2167597 ?auto_2167604 ) ) ( not ( = ?auto_2167597 ?auto_2167605 ) ) ( not ( = ?auto_2167597 ?auto_2167610 ) ) ( not ( = ?auto_2167598 ?auto_2167599 ) ) ( not ( = ?auto_2167598 ?auto_2167600 ) ) ( not ( = ?auto_2167598 ?auto_2167601 ) ) ( not ( = ?auto_2167598 ?auto_2167602 ) ) ( not ( = ?auto_2167598 ?auto_2167603 ) ) ( not ( = ?auto_2167598 ?auto_2167604 ) ) ( not ( = ?auto_2167598 ?auto_2167605 ) ) ( not ( = ?auto_2167598 ?auto_2167610 ) ) ( not ( = ?auto_2167599 ?auto_2167600 ) ) ( not ( = ?auto_2167599 ?auto_2167601 ) ) ( not ( = ?auto_2167599 ?auto_2167602 ) ) ( not ( = ?auto_2167599 ?auto_2167603 ) ) ( not ( = ?auto_2167599 ?auto_2167604 ) ) ( not ( = ?auto_2167599 ?auto_2167605 ) ) ( not ( = ?auto_2167599 ?auto_2167610 ) ) ( not ( = ?auto_2167600 ?auto_2167601 ) ) ( not ( = ?auto_2167600 ?auto_2167602 ) ) ( not ( = ?auto_2167600 ?auto_2167603 ) ) ( not ( = ?auto_2167600 ?auto_2167604 ) ) ( not ( = ?auto_2167600 ?auto_2167605 ) ) ( not ( = ?auto_2167600 ?auto_2167610 ) ) ( not ( = ?auto_2167601 ?auto_2167602 ) ) ( not ( = ?auto_2167601 ?auto_2167603 ) ) ( not ( = ?auto_2167601 ?auto_2167604 ) ) ( not ( = ?auto_2167601 ?auto_2167605 ) ) ( not ( = ?auto_2167601 ?auto_2167610 ) ) ( not ( = ?auto_2167602 ?auto_2167603 ) ) ( not ( = ?auto_2167602 ?auto_2167604 ) ) ( not ( = ?auto_2167602 ?auto_2167605 ) ) ( not ( = ?auto_2167602 ?auto_2167610 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167603 ?auto_2167604 ?auto_2167605 )
      ( MAKE-10CRATE-VERIFY ?auto_2167595 ?auto_2167596 ?auto_2167597 ?auto_2167598 ?auto_2167599 ?auto_2167600 ?auto_2167601 ?auto_2167602 ?auto_2167603 ?auto_2167604 ?auto_2167605 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2167612 - SURFACE
      ?auto_2167613 - SURFACE
      ?auto_2167614 - SURFACE
      ?auto_2167615 - SURFACE
      ?auto_2167616 - SURFACE
      ?auto_2167617 - SURFACE
      ?auto_2167618 - SURFACE
      ?auto_2167619 - SURFACE
      ?auto_2167620 - SURFACE
      ?auto_2167621 - SURFACE
      ?auto_2167622 - SURFACE
      ?auto_2167623 - SURFACE
    )
    :vars
    (
      ?auto_2167629 - HOIST
      ?auto_2167627 - PLACE
      ?auto_2167626 - PLACE
      ?auto_2167624 - HOIST
      ?auto_2167628 - SURFACE
      ?auto_2167625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167629 ?auto_2167627 ) ( IS-CRATE ?auto_2167623 ) ( not ( = ?auto_2167622 ?auto_2167623 ) ) ( not ( = ?auto_2167621 ?auto_2167622 ) ) ( not ( = ?auto_2167621 ?auto_2167623 ) ) ( not ( = ?auto_2167626 ?auto_2167627 ) ) ( HOIST-AT ?auto_2167624 ?auto_2167626 ) ( not ( = ?auto_2167629 ?auto_2167624 ) ) ( SURFACE-AT ?auto_2167623 ?auto_2167626 ) ( ON ?auto_2167623 ?auto_2167628 ) ( CLEAR ?auto_2167623 ) ( not ( = ?auto_2167622 ?auto_2167628 ) ) ( not ( = ?auto_2167623 ?auto_2167628 ) ) ( not ( = ?auto_2167621 ?auto_2167628 ) ) ( SURFACE-AT ?auto_2167621 ?auto_2167627 ) ( CLEAR ?auto_2167621 ) ( IS-CRATE ?auto_2167622 ) ( AVAILABLE ?auto_2167629 ) ( TRUCK-AT ?auto_2167625 ?auto_2167626 ) ( LIFTING ?auto_2167624 ?auto_2167622 ) ( ON ?auto_2167613 ?auto_2167612 ) ( ON ?auto_2167614 ?auto_2167613 ) ( ON ?auto_2167615 ?auto_2167614 ) ( ON ?auto_2167616 ?auto_2167615 ) ( ON ?auto_2167617 ?auto_2167616 ) ( ON ?auto_2167618 ?auto_2167617 ) ( ON ?auto_2167619 ?auto_2167618 ) ( ON ?auto_2167620 ?auto_2167619 ) ( ON ?auto_2167621 ?auto_2167620 ) ( not ( = ?auto_2167612 ?auto_2167613 ) ) ( not ( = ?auto_2167612 ?auto_2167614 ) ) ( not ( = ?auto_2167612 ?auto_2167615 ) ) ( not ( = ?auto_2167612 ?auto_2167616 ) ) ( not ( = ?auto_2167612 ?auto_2167617 ) ) ( not ( = ?auto_2167612 ?auto_2167618 ) ) ( not ( = ?auto_2167612 ?auto_2167619 ) ) ( not ( = ?auto_2167612 ?auto_2167620 ) ) ( not ( = ?auto_2167612 ?auto_2167621 ) ) ( not ( = ?auto_2167612 ?auto_2167622 ) ) ( not ( = ?auto_2167612 ?auto_2167623 ) ) ( not ( = ?auto_2167612 ?auto_2167628 ) ) ( not ( = ?auto_2167613 ?auto_2167614 ) ) ( not ( = ?auto_2167613 ?auto_2167615 ) ) ( not ( = ?auto_2167613 ?auto_2167616 ) ) ( not ( = ?auto_2167613 ?auto_2167617 ) ) ( not ( = ?auto_2167613 ?auto_2167618 ) ) ( not ( = ?auto_2167613 ?auto_2167619 ) ) ( not ( = ?auto_2167613 ?auto_2167620 ) ) ( not ( = ?auto_2167613 ?auto_2167621 ) ) ( not ( = ?auto_2167613 ?auto_2167622 ) ) ( not ( = ?auto_2167613 ?auto_2167623 ) ) ( not ( = ?auto_2167613 ?auto_2167628 ) ) ( not ( = ?auto_2167614 ?auto_2167615 ) ) ( not ( = ?auto_2167614 ?auto_2167616 ) ) ( not ( = ?auto_2167614 ?auto_2167617 ) ) ( not ( = ?auto_2167614 ?auto_2167618 ) ) ( not ( = ?auto_2167614 ?auto_2167619 ) ) ( not ( = ?auto_2167614 ?auto_2167620 ) ) ( not ( = ?auto_2167614 ?auto_2167621 ) ) ( not ( = ?auto_2167614 ?auto_2167622 ) ) ( not ( = ?auto_2167614 ?auto_2167623 ) ) ( not ( = ?auto_2167614 ?auto_2167628 ) ) ( not ( = ?auto_2167615 ?auto_2167616 ) ) ( not ( = ?auto_2167615 ?auto_2167617 ) ) ( not ( = ?auto_2167615 ?auto_2167618 ) ) ( not ( = ?auto_2167615 ?auto_2167619 ) ) ( not ( = ?auto_2167615 ?auto_2167620 ) ) ( not ( = ?auto_2167615 ?auto_2167621 ) ) ( not ( = ?auto_2167615 ?auto_2167622 ) ) ( not ( = ?auto_2167615 ?auto_2167623 ) ) ( not ( = ?auto_2167615 ?auto_2167628 ) ) ( not ( = ?auto_2167616 ?auto_2167617 ) ) ( not ( = ?auto_2167616 ?auto_2167618 ) ) ( not ( = ?auto_2167616 ?auto_2167619 ) ) ( not ( = ?auto_2167616 ?auto_2167620 ) ) ( not ( = ?auto_2167616 ?auto_2167621 ) ) ( not ( = ?auto_2167616 ?auto_2167622 ) ) ( not ( = ?auto_2167616 ?auto_2167623 ) ) ( not ( = ?auto_2167616 ?auto_2167628 ) ) ( not ( = ?auto_2167617 ?auto_2167618 ) ) ( not ( = ?auto_2167617 ?auto_2167619 ) ) ( not ( = ?auto_2167617 ?auto_2167620 ) ) ( not ( = ?auto_2167617 ?auto_2167621 ) ) ( not ( = ?auto_2167617 ?auto_2167622 ) ) ( not ( = ?auto_2167617 ?auto_2167623 ) ) ( not ( = ?auto_2167617 ?auto_2167628 ) ) ( not ( = ?auto_2167618 ?auto_2167619 ) ) ( not ( = ?auto_2167618 ?auto_2167620 ) ) ( not ( = ?auto_2167618 ?auto_2167621 ) ) ( not ( = ?auto_2167618 ?auto_2167622 ) ) ( not ( = ?auto_2167618 ?auto_2167623 ) ) ( not ( = ?auto_2167618 ?auto_2167628 ) ) ( not ( = ?auto_2167619 ?auto_2167620 ) ) ( not ( = ?auto_2167619 ?auto_2167621 ) ) ( not ( = ?auto_2167619 ?auto_2167622 ) ) ( not ( = ?auto_2167619 ?auto_2167623 ) ) ( not ( = ?auto_2167619 ?auto_2167628 ) ) ( not ( = ?auto_2167620 ?auto_2167621 ) ) ( not ( = ?auto_2167620 ?auto_2167622 ) ) ( not ( = ?auto_2167620 ?auto_2167623 ) ) ( not ( = ?auto_2167620 ?auto_2167628 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167621 ?auto_2167622 ?auto_2167623 )
      ( MAKE-11CRATE-VERIFY ?auto_2167612 ?auto_2167613 ?auto_2167614 ?auto_2167615 ?auto_2167616 ?auto_2167617 ?auto_2167618 ?auto_2167619 ?auto_2167620 ?auto_2167621 ?auto_2167622 ?auto_2167623 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167630 - SURFACE
      ?auto_2167631 - SURFACE
      ?auto_2167632 - SURFACE
      ?auto_2167633 - SURFACE
      ?auto_2167634 - SURFACE
      ?auto_2167635 - SURFACE
      ?auto_2167636 - SURFACE
      ?auto_2167637 - SURFACE
      ?auto_2167638 - SURFACE
      ?auto_2167639 - SURFACE
      ?auto_2167640 - SURFACE
      ?auto_2167641 - SURFACE
      ?auto_2167642 - SURFACE
    )
    :vars
    (
      ?auto_2167648 - HOIST
      ?auto_2167646 - PLACE
      ?auto_2167645 - PLACE
      ?auto_2167643 - HOIST
      ?auto_2167647 - SURFACE
      ?auto_2167644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167648 ?auto_2167646 ) ( IS-CRATE ?auto_2167642 ) ( not ( = ?auto_2167641 ?auto_2167642 ) ) ( not ( = ?auto_2167640 ?auto_2167641 ) ) ( not ( = ?auto_2167640 ?auto_2167642 ) ) ( not ( = ?auto_2167645 ?auto_2167646 ) ) ( HOIST-AT ?auto_2167643 ?auto_2167645 ) ( not ( = ?auto_2167648 ?auto_2167643 ) ) ( SURFACE-AT ?auto_2167642 ?auto_2167645 ) ( ON ?auto_2167642 ?auto_2167647 ) ( CLEAR ?auto_2167642 ) ( not ( = ?auto_2167641 ?auto_2167647 ) ) ( not ( = ?auto_2167642 ?auto_2167647 ) ) ( not ( = ?auto_2167640 ?auto_2167647 ) ) ( SURFACE-AT ?auto_2167640 ?auto_2167646 ) ( CLEAR ?auto_2167640 ) ( IS-CRATE ?auto_2167641 ) ( AVAILABLE ?auto_2167648 ) ( TRUCK-AT ?auto_2167644 ?auto_2167645 ) ( LIFTING ?auto_2167643 ?auto_2167641 ) ( ON ?auto_2167631 ?auto_2167630 ) ( ON ?auto_2167632 ?auto_2167631 ) ( ON ?auto_2167633 ?auto_2167632 ) ( ON ?auto_2167634 ?auto_2167633 ) ( ON ?auto_2167635 ?auto_2167634 ) ( ON ?auto_2167636 ?auto_2167635 ) ( ON ?auto_2167637 ?auto_2167636 ) ( ON ?auto_2167638 ?auto_2167637 ) ( ON ?auto_2167639 ?auto_2167638 ) ( ON ?auto_2167640 ?auto_2167639 ) ( not ( = ?auto_2167630 ?auto_2167631 ) ) ( not ( = ?auto_2167630 ?auto_2167632 ) ) ( not ( = ?auto_2167630 ?auto_2167633 ) ) ( not ( = ?auto_2167630 ?auto_2167634 ) ) ( not ( = ?auto_2167630 ?auto_2167635 ) ) ( not ( = ?auto_2167630 ?auto_2167636 ) ) ( not ( = ?auto_2167630 ?auto_2167637 ) ) ( not ( = ?auto_2167630 ?auto_2167638 ) ) ( not ( = ?auto_2167630 ?auto_2167639 ) ) ( not ( = ?auto_2167630 ?auto_2167640 ) ) ( not ( = ?auto_2167630 ?auto_2167641 ) ) ( not ( = ?auto_2167630 ?auto_2167642 ) ) ( not ( = ?auto_2167630 ?auto_2167647 ) ) ( not ( = ?auto_2167631 ?auto_2167632 ) ) ( not ( = ?auto_2167631 ?auto_2167633 ) ) ( not ( = ?auto_2167631 ?auto_2167634 ) ) ( not ( = ?auto_2167631 ?auto_2167635 ) ) ( not ( = ?auto_2167631 ?auto_2167636 ) ) ( not ( = ?auto_2167631 ?auto_2167637 ) ) ( not ( = ?auto_2167631 ?auto_2167638 ) ) ( not ( = ?auto_2167631 ?auto_2167639 ) ) ( not ( = ?auto_2167631 ?auto_2167640 ) ) ( not ( = ?auto_2167631 ?auto_2167641 ) ) ( not ( = ?auto_2167631 ?auto_2167642 ) ) ( not ( = ?auto_2167631 ?auto_2167647 ) ) ( not ( = ?auto_2167632 ?auto_2167633 ) ) ( not ( = ?auto_2167632 ?auto_2167634 ) ) ( not ( = ?auto_2167632 ?auto_2167635 ) ) ( not ( = ?auto_2167632 ?auto_2167636 ) ) ( not ( = ?auto_2167632 ?auto_2167637 ) ) ( not ( = ?auto_2167632 ?auto_2167638 ) ) ( not ( = ?auto_2167632 ?auto_2167639 ) ) ( not ( = ?auto_2167632 ?auto_2167640 ) ) ( not ( = ?auto_2167632 ?auto_2167641 ) ) ( not ( = ?auto_2167632 ?auto_2167642 ) ) ( not ( = ?auto_2167632 ?auto_2167647 ) ) ( not ( = ?auto_2167633 ?auto_2167634 ) ) ( not ( = ?auto_2167633 ?auto_2167635 ) ) ( not ( = ?auto_2167633 ?auto_2167636 ) ) ( not ( = ?auto_2167633 ?auto_2167637 ) ) ( not ( = ?auto_2167633 ?auto_2167638 ) ) ( not ( = ?auto_2167633 ?auto_2167639 ) ) ( not ( = ?auto_2167633 ?auto_2167640 ) ) ( not ( = ?auto_2167633 ?auto_2167641 ) ) ( not ( = ?auto_2167633 ?auto_2167642 ) ) ( not ( = ?auto_2167633 ?auto_2167647 ) ) ( not ( = ?auto_2167634 ?auto_2167635 ) ) ( not ( = ?auto_2167634 ?auto_2167636 ) ) ( not ( = ?auto_2167634 ?auto_2167637 ) ) ( not ( = ?auto_2167634 ?auto_2167638 ) ) ( not ( = ?auto_2167634 ?auto_2167639 ) ) ( not ( = ?auto_2167634 ?auto_2167640 ) ) ( not ( = ?auto_2167634 ?auto_2167641 ) ) ( not ( = ?auto_2167634 ?auto_2167642 ) ) ( not ( = ?auto_2167634 ?auto_2167647 ) ) ( not ( = ?auto_2167635 ?auto_2167636 ) ) ( not ( = ?auto_2167635 ?auto_2167637 ) ) ( not ( = ?auto_2167635 ?auto_2167638 ) ) ( not ( = ?auto_2167635 ?auto_2167639 ) ) ( not ( = ?auto_2167635 ?auto_2167640 ) ) ( not ( = ?auto_2167635 ?auto_2167641 ) ) ( not ( = ?auto_2167635 ?auto_2167642 ) ) ( not ( = ?auto_2167635 ?auto_2167647 ) ) ( not ( = ?auto_2167636 ?auto_2167637 ) ) ( not ( = ?auto_2167636 ?auto_2167638 ) ) ( not ( = ?auto_2167636 ?auto_2167639 ) ) ( not ( = ?auto_2167636 ?auto_2167640 ) ) ( not ( = ?auto_2167636 ?auto_2167641 ) ) ( not ( = ?auto_2167636 ?auto_2167642 ) ) ( not ( = ?auto_2167636 ?auto_2167647 ) ) ( not ( = ?auto_2167637 ?auto_2167638 ) ) ( not ( = ?auto_2167637 ?auto_2167639 ) ) ( not ( = ?auto_2167637 ?auto_2167640 ) ) ( not ( = ?auto_2167637 ?auto_2167641 ) ) ( not ( = ?auto_2167637 ?auto_2167642 ) ) ( not ( = ?auto_2167637 ?auto_2167647 ) ) ( not ( = ?auto_2167638 ?auto_2167639 ) ) ( not ( = ?auto_2167638 ?auto_2167640 ) ) ( not ( = ?auto_2167638 ?auto_2167641 ) ) ( not ( = ?auto_2167638 ?auto_2167642 ) ) ( not ( = ?auto_2167638 ?auto_2167647 ) ) ( not ( = ?auto_2167639 ?auto_2167640 ) ) ( not ( = ?auto_2167639 ?auto_2167641 ) ) ( not ( = ?auto_2167639 ?auto_2167642 ) ) ( not ( = ?auto_2167639 ?auto_2167647 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167640 ?auto_2167641 ?auto_2167642 )
      ( MAKE-12CRATE-VERIFY ?auto_2167630 ?auto_2167631 ?auto_2167632 ?auto_2167633 ?auto_2167634 ?auto_2167635 ?auto_2167636 ?auto_2167637 ?auto_2167638 ?auto_2167639 ?auto_2167640 ?auto_2167641 ?auto_2167642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2167649 - SURFACE
      ?auto_2167650 - SURFACE
    )
    :vars
    (
      ?auto_2167656 - HOIST
      ?auto_2167654 - PLACE
      ?auto_2167657 - SURFACE
      ?auto_2167653 - PLACE
      ?auto_2167651 - HOIST
      ?auto_2167655 - SURFACE
      ?auto_2167652 - TRUCK
      ?auto_2167658 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167656 ?auto_2167654 ) ( IS-CRATE ?auto_2167650 ) ( not ( = ?auto_2167649 ?auto_2167650 ) ) ( not ( = ?auto_2167657 ?auto_2167649 ) ) ( not ( = ?auto_2167657 ?auto_2167650 ) ) ( not ( = ?auto_2167653 ?auto_2167654 ) ) ( HOIST-AT ?auto_2167651 ?auto_2167653 ) ( not ( = ?auto_2167656 ?auto_2167651 ) ) ( SURFACE-AT ?auto_2167650 ?auto_2167653 ) ( ON ?auto_2167650 ?auto_2167655 ) ( CLEAR ?auto_2167650 ) ( not ( = ?auto_2167649 ?auto_2167655 ) ) ( not ( = ?auto_2167650 ?auto_2167655 ) ) ( not ( = ?auto_2167657 ?auto_2167655 ) ) ( SURFACE-AT ?auto_2167657 ?auto_2167654 ) ( CLEAR ?auto_2167657 ) ( IS-CRATE ?auto_2167649 ) ( AVAILABLE ?auto_2167656 ) ( TRUCK-AT ?auto_2167652 ?auto_2167653 ) ( AVAILABLE ?auto_2167651 ) ( SURFACE-AT ?auto_2167649 ?auto_2167653 ) ( ON ?auto_2167649 ?auto_2167658 ) ( CLEAR ?auto_2167649 ) ( not ( = ?auto_2167649 ?auto_2167658 ) ) ( not ( = ?auto_2167650 ?auto_2167658 ) ) ( not ( = ?auto_2167657 ?auto_2167658 ) ) ( not ( = ?auto_2167655 ?auto_2167658 ) ) )
    :subtasks
    ( ( !LIFT ?auto_2167651 ?auto_2167649 ?auto_2167658 ?auto_2167653 )
      ( MAKE-2CRATE ?auto_2167657 ?auto_2167649 ?auto_2167650 )
      ( MAKE-1CRATE-VERIFY ?auto_2167649 ?auto_2167650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2167659 - SURFACE
      ?auto_2167660 - SURFACE
      ?auto_2167661 - SURFACE
    )
    :vars
    (
      ?auto_2167664 - HOIST
      ?auto_2167663 - PLACE
      ?auto_2167662 - PLACE
      ?auto_2167668 - HOIST
      ?auto_2167665 - SURFACE
      ?auto_2167667 - TRUCK
      ?auto_2167666 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167664 ?auto_2167663 ) ( IS-CRATE ?auto_2167661 ) ( not ( = ?auto_2167660 ?auto_2167661 ) ) ( not ( = ?auto_2167659 ?auto_2167660 ) ) ( not ( = ?auto_2167659 ?auto_2167661 ) ) ( not ( = ?auto_2167662 ?auto_2167663 ) ) ( HOIST-AT ?auto_2167668 ?auto_2167662 ) ( not ( = ?auto_2167664 ?auto_2167668 ) ) ( SURFACE-AT ?auto_2167661 ?auto_2167662 ) ( ON ?auto_2167661 ?auto_2167665 ) ( CLEAR ?auto_2167661 ) ( not ( = ?auto_2167660 ?auto_2167665 ) ) ( not ( = ?auto_2167661 ?auto_2167665 ) ) ( not ( = ?auto_2167659 ?auto_2167665 ) ) ( SURFACE-AT ?auto_2167659 ?auto_2167663 ) ( CLEAR ?auto_2167659 ) ( IS-CRATE ?auto_2167660 ) ( AVAILABLE ?auto_2167664 ) ( TRUCK-AT ?auto_2167667 ?auto_2167662 ) ( AVAILABLE ?auto_2167668 ) ( SURFACE-AT ?auto_2167660 ?auto_2167662 ) ( ON ?auto_2167660 ?auto_2167666 ) ( CLEAR ?auto_2167660 ) ( not ( = ?auto_2167660 ?auto_2167666 ) ) ( not ( = ?auto_2167661 ?auto_2167666 ) ) ( not ( = ?auto_2167659 ?auto_2167666 ) ) ( not ( = ?auto_2167665 ?auto_2167666 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2167660 ?auto_2167661 )
      ( MAKE-2CRATE-VERIFY ?auto_2167659 ?auto_2167660 ?auto_2167661 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2167669 - SURFACE
      ?auto_2167670 - SURFACE
      ?auto_2167671 - SURFACE
      ?auto_2167672 - SURFACE
    )
    :vars
    (
      ?auto_2167677 - HOIST
      ?auto_2167676 - PLACE
      ?auto_2167674 - PLACE
      ?auto_2167675 - HOIST
      ?auto_2167678 - SURFACE
      ?auto_2167679 - TRUCK
      ?auto_2167673 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167677 ?auto_2167676 ) ( IS-CRATE ?auto_2167672 ) ( not ( = ?auto_2167671 ?auto_2167672 ) ) ( not ( = ?auto_2167670 ?auto_2167671 ) ) ( not ( = ?auto_2167670 ?auto_2167672 ) ) ( not ( = ?auto_2167674 ?auto_2167676 ) ) ( HOIST-AT ?auto_2167675 ?auto_2167674 ) ( not ( = ?auto_2167677 ?auto_2167675 ) ) ( SURFACE-AT ?auto_2167672 ?auto_2167674 ) ( ON ?auto_2167672 ?auto_2167678 ) ( CLEAR ?auto_2167672 ) ( not ( = ?auto_2167671 ?auto_2167678 ) ) ( not ( = ?auto_2167672 ?auto_2167678 ) ) ( not ( = ?auto_2167670 ?auto_2167678 ) ) ( SURFACE-AT ?auto_2167670 ?auto_2167676 ) ( CLEAR ?auto_2167670 ) ( IS-CRATE ?auto_2167671 ) ( AVAILABLE ?auto_2167677 ) ( TRUCK-AT ?auto_2167679 ?auto_2167674 ) ( AVAILABLE ?auto_2167675 ) ( SURFACE-AT ?auto_2167671 ?auto_2167674 ) ( ON ?auto_2167671 ?auto_2167673 ) ( CLEAR ?auto_2167671 ) ( not ( = ?auto_2167671 ?auto_2167673 ) ) ( not ( = ?auto_2167672 ?auto_2167673 ) ) ( not ( = ?auto_2167670 ?auto_2167673 ) ) ( not ( = ?auto_2167678 ?auto_2167673 ) ) ( ON ?auto_2167670 ?auto_2167669 ) ( not ( = ?auto_2167669 ?auto_2167670 ) ) ( not ( = ?auto_2167669 ?auto_2167671 ) ) ( not ( = ?auto_2167669 ?auto_2167672 ) ) ( not ( = ?auto_2167669 ?auto_2167678 ) ) ( not ( = ?auto_2167669 ?auto_2167673 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167670 ?auto_2167671 ?auto_2167672 )
      ( MAKE-3CRATE-VERIFY ?auto_2167669 ?auto_2167670 ?auto_2167671 ?auto_2167672 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2167680 - SURFACE
      ?auto_2167681 - SURFACE
      ?auto_2167682 - SURFACE
      ?auto_2167683 - SURFACE
      ?auto_2167684 - SURFACE
    )
    :vars
    (
      ?auto_2167689 - HOIST
      ?auto_2167688 - PLACE
      ?auto_2167686 - PLACE
      ?auto_2167687 - HOIST
      ?auto_2167690 - SURFACE
      ?auto_2167691 - TRUCK
      ?auto_2167685 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167689 ?auto_2167688 ) ( IS-CRATE ?auto_2167684 ) ( not ( = ?auto_2167683 ?auto_2167684 ) ) ( not ( = ?auto_2167682 ?auto_2167683 ) ) ( not ( = ?auto_2167682 ?auto_2167684 ) ) ( not ( = ?auto_2167686 ?auto_2167688 ) ) ( HOIST-AT ?auto_2167687 ?auto_2167686 ) ( not ( = ?auto_2167689 ?auto_2167687 ) ) ( SURFACE-AT ?auto_2167684 ?auto_2167686 ) ( ON ?auto_2167684 ?auto_2167690 ) ( CLEAR ?auto_2167684 ) ( not ( = ?auto_2167683 ?auto_2167690 ) ) ( not ( = ?auto_2167684 ?auto_2167690 ) ) ( not ( = ?auto_2167682 ?auto_2167690 ) ) ( SURFACE-AT ?auto_2167682 ?auto_2167688 ) ( CLEAR ?auto_2167682 ) ( IS-CRATE ?auto_2167683 ) ( AVAILABLE ?auto_2167689 ) ( TRUCK-AT ?auto_2167691 ?auto_2167686 ) ( AVAILABLE ?auto_2167687 ) ( SURFACE-AT ?auto_2167683 ?auto_2167686 ) ( ON ?auto_2167683 ?auto_2167685 ) ( CLEAR ?auto_2167683 ) ( not ( = ?auto_2167683 ?auto_2167685 ) ) ( not ( = ?auto_2167684 ?auto_2167685 ) ) ( not ( = ?auto_2167682 ?auto_2167685 ) ) ( not ( = ?auto_2167690 ?auto_2167685 ) ) ( ON ?auto_2167681 ?auto_2167680 ) ( ON ?auto_2167682 ?auto_2167681 ) ( not ( = ?auto_2167680 ?auto_2167681 ) ) ( not ( = ?auto_2167680 ?auto_2167682 ) ) ( not ( = ?auto_2167680 ?auto_2167683 ) ) ( not ( = ?auto_2167680 ?auto_2167684 ) ) ( not ( = ?auto_2167680 ?auto_2167690 ) ) ( not ( = ?auto_2167680 ?auto_2167685 ) ) ( not ( = ?auto_2167681 ?auto_2167682 ) ) ( not ( = ?auto_2167681 ?auto_2167683 ) ) ( not ( = ?auto_2167681 ?auto_2167684 ) ) ( not ( = ?auto_2167681 ?auto_2167690 ) ) ( not ( = ?auto_2167681 ?auto_2167685 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167682 ?auto_2167683 ?auto_2167684 )
      ( MAKE-4CRATE-VERIFY ?auto_2167680 ?auto_2167681 ?auto_2167682 ?auto_2167683 ?auto_2167684 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2167692 - SURFACE
      ?auto_2167693 - SURFACE
      ?auto_2167694 - SURFACE
      ?auto_2167695 - SURFACE
      ?auto_2167696 - SURFACE
      ?auto_2167697 - SURFACE
    )
    :vars
    (
      ?auto_2167702 - HOIST
      ?auto_2167701 - PLACE
      ?auto_2167699 - PLACE
      ?auto_2167700 - HOIST
      ?auto_2167703 - SURFACE
      ?auto_2167704 - TRUCK
      ?auto_2167698 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167702 ?auto_2167701 ) ( IS-CRATE ?auto_2167697 ) ( not ( = ?auto_2167696 ?auto_2167697 ) ) ( not ( = ?auto_2167695 ?auto_2167696 ) ) ( not ( = ?auto_2167695 ?auto_2167697 ) ) ( not ( = ?auto_2167699 ?auto_2167701 ) ) ( HOIST-AT ?auto_2167700 ?auto_2167699 ) ( not ( = ?auto_2167702 ?auto_2167700 ) ) ( SURFACE-AT ?auto_2167697 ?auto_2167699 ) ( ON ?auto_2167697 ?auto_2167703 ) ( CLEAR ?auto_2167697 ) ( not ( = ?auto_2167696 ?auto_2167703 ) ) ( not ( = ?auto_2167697 ?auto_2167703 ) ) ( not ( = ?auto_2167695 ?auto_2167703 ) ) ( SURFACE-AT ?auto_2167695 ?auto_2167701 ) ( CLEAR ?auto_2167695 ) ( IS-CRATE ?auto_2167696 ) ( AVAILABLE ?auto_2167702 ) ( TRUCK-AT ?auto_2167704 ?auto_2167699 ) ( AVAILABLE ?auto_2167700 ) ( SURFACE-AT ?auto_2167696 ?auto_2167699 ) ( ON ?auto_2167696 ?auto_2167698 ) ( CLEAR ?auto_2167696 ) ( not ( = ?auto_2167696 ?auto_2167698 ) ) ( not ( = ?auto_2167697 ?auto_2167698 ) ) ( not ( = ?auto_2167695 ?auto_2167698 ) ) ( not ( = ?auto_2167703 ?auto_2167698 ) ) ( ON ?auto_2167693 ?auto_2167692 ) ( ON ?auto_2167694 ?auto_2167693 ) ( ON ?auto_2167695 ?auto_2167694 ) ( not ( = ?auto_2167692 ?auto_2167693 ) ) ( not ( = ?auto_2167692 ?auto_2167694 ) ) ( not ( = ?auto_2167692 ?auto_2167695 ) ) ( not ( = ?auto_2167692 ?auto_2167696 ) ) ( not ( = ?auto_2167692 ?auto_2167697 ) ) ( not ( = ?auto_2167692 ?auto_2167703 ) ) ( not ( = ?auto_2167692 ?auto_2167698 ) ) ( not ( = ?auto_2167693 ?auto_2167694 ) ) ( not ( = ?auto_2167693 ?auto_2167695 ) ) ( not ( = ?auto_2167693 ?auto_2167696 ) ) ( not ( = ?auto_2167693 ?auto_2167697 ) ) ( not ( = ?auto_2167693 ?auto_2167703 ) ) ( not ( = ?auto_2167693 ?auto_2167698 ) ) ( not ( = ?auto_2167694 ?auto_2167695 ) ) ( not ( = ?auto_2167694 ?auto_2167696 ) ) ( not ( = ?auto_2167694 ?auto_2167697 ) ) ( not ( = ?auto_2167694 ?auto_2167703 ) ) ( not ( = ?auto_2167694 ?auto_2167698 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167695 ?auto_2167696 ?auto_2167697 )
      ( MAKE-5CRATE-VERIFY ?auto_2167692 ?auto_2167693 ?auto_2167694 ?auto_2167695 ?auto_2167696 ?auto_2167697 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2167705 - SURFACE
      ?auto_2167706 - SURFACE
      ?auto_2167707 - SURFACE
      ?auto_2167708 - SURFACE
      ?auto_2167709 - SURFACE
      ?auto_2167710 - SURFACE
      ?auto_2167711 - SURFACE
    )
    :vars
    (
      ?auto_2167716 - HOIST
      ?auto_2167715 - PLACE
      ?auto_2167713 - PLACE
      ?auto_2167714 - HOIST
      ?auto_2167717 - SURFACE
      ?auto_2167718 - TRUCK
      ?auto_2167712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167716 ?auto_2167715 ) ( IS-CRATE ?auto_2167711 ) ( not ( = ?auto_2167710 ?auto_2167711 ) ) ( not ( = ?auto_2167709 ?auto_2167710 ) ) ( not ( = ?auto_2167709 ?auto_2167711 ) ) ( not ( = ?auto_2167713 ?auto_2167715 ) ) ( HOIST-AT ?auto_2167714 ?auto_2167713 ) ( not ( = ?auto_2167716 ?auto_2167714 ) ) ( SURFACE-AT ?auto_2167711 ?auto_2167713 ) ( ON ?auto_2167711 ?auto_2167717 ) ( CLEAR ?auto_2167711 ) ( not ( = ?auto_2167710 ?auto_2167717 ) ) ( not ( = ?auto_2167711 ?auto_2167717 ) ) ( not ( = ?auto_2167709 ?auto_2167717 ) ) ( SURFACE-AT ?auto_2167709 ?auto_2167715 ) ( CLEAR ?auto_2167709 ) ( IS-CRATE ?auto_2167710 ) ( AVAILABLE ?auto_2167716 ) ( TRUCK-AT ?auto_2167718 ?auto_2167713 ) ( AVAILABLE ?auto_2167714 ) ( SURFACE-AT ?auto_2167710 ?auto_2167713 ) ( ON ?auto_2167710 ?auto_2167712 ) ( CLEAR ?auto_2167710 ) ( not ( = ?auto_2167710 ?auto_2167712 ) ) ( not ( = ?auto_2167711 ?auto_2167712 ) ) ( not ( = ?auto_2167709 ?auto_2167712 ) ) ( not ( = ?auto_2167717 ?auto_2167712 ) ) ( ON ?auto_2167706 ?auto_2167705 ) ( ON ?auto_2167707 ?auto_2167706 ) ( ON ?auto_2167708 ?auto_2167707 ) ( ON ?auto_2167709 ?auto_2167708 ) ( not ( = ?auto_2167705 ?auto_2167706 ) ) ( not ( = ?auto_2167705 ?auto_2167707 ) ) ( not ( = ?auto_2167705 ?auto_2167708 ) ) ( not ( = ?auto_2167705 ?auto_2167709 ) ) ( not ( = ?auto_2167705 ?auto_2167710 ) ) ( not ( = ?auto_2167705 ?auto_2167711 ) ) ( not ( = ?auto_2167705 ?auto_2167717 ) ) ( not ( = ?auto_2167705 ?auto_2167712 ) ) ( not ( = ?auto_2167706 ?auto_2167707 ) ) ( not ( = ?auto_2167706 ?auto_2167708 ) ) ( not ( = ?auto_2167706 ?auto_2167709 ) ) ( not ( = ?auto_2167706 ?auto_2167710 ) ) ( not ( = ?auto_2167706 ?auto_2167711 ) ) ( not ( = ?auto_2167706 ?auto_2167717 ) ) ( not ( = ?auto_2167706 ?auto_2167712 ) ) ( not ( = ?auto_2167707 ?auto_2167708 ) ) ( not ( = ?auto_2167707 ?auto_2167709 ) ) ( not ( = ?auto_2167707 ?auto_2167710 ) ) ( not ( = ?auto_2167707 ?auto_2167711 ) ) ( not ( = ?auto_2167707 ?auto_2167717 ) ) ( not ( = ?auto_2167707 ?auto_2167712 ) ) ( not ( = ?auto_2167708 ?auto_2167709 ) ) ( not ( = ?auto_2167708 ?auto_2167710 ) ) ( not ( = ?auto_2167708 ?auto_2167711 ) ) ( not ( = ?auto_2167708 ?auto_2167717 ) ) ( not ( = ?auto_2167708 ?auto_2167712 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167709 ?auto_2167710 ?auto_2167711 )
      ( MAKE-6CRATE-VERIFY ?auto_2167705 ?auto_2167706 ?auto_2167707 ?auto_2167708 ?auto_2167709 ?auto_2167710 ?auto_2167711 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2167719 - SURFACE
      ?auto_2167720 - SURFACE
      ?auto_2167721 - SURFACE
      ?auto_2167722 - SURFACE
      ?auto_2167723 - SURFACE
      ?auto_2167724 - SURFACE
      ?auto_2167725 - SURFACE
      ?auto_2167726 - SURFACE
    )
    :vars
    (
      ?auto_2167731 - HOIST
      ?auto_2167730 - PLACE
      ?auto_2167728 - PLACE
      ?auto_2167729 - HOIST
      ?auto_2167732 - SURFACE
      ?auto_2167733 - TRUCK
      ?auto_2167727 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167731 ?auto_2167730 ) ( IS-CRATE ?auto_2167726 ) ( not ( = ?auto_2167725 ?auto_2167726 ) ) ( not ( = ?auto_2167724 ?auto_2167725 ) ) ( not ( = ?auto_2167724 ?auto_2167726 ) ) ( not ( = ?auto_2167728 ?auto_2167730 ) ) ( HOIST-AT ?auto_2167729 ?auto_2167728 ) ( not ( = ?auto_2167731 ?auto_2167729 ) ) ( SURFACE-AT ?auto_2167726 ?auto_2167728 ) ( ON ?auto_2167726 ?auto_2167732 ) ( CLEAR ?auto_2167726 ) ( not ( = ?auto_2167725 ?auto_2167732 ) ) ( not ( = ?auto_2167726 ?auto_2167732 ) ) ( not ( = ?auto_2167724 ?auto_2167732 ) ) ( SURFACE-AT ?auto_2167724 ?auto_2167730 ) ( CLEAR ?auto_2167724 ) ( IS-CRATE ?auto_2167725 ) ( AVAILABLE ?auto_2167731 ) ( TRUCK-AT ?auto_2167733 ?auto_2167728 ) ( AVAILABLE ?auto_2167729 ) ( SURFACE-AT ?auto_2167725 ?auto_2167728 ) ( ON ?auto_2167725 ?auto_2167727 ) ( CLEAR ?auto_2167725 ) ( not ( = ?auto_2167725 ?auto_2167727 ) ) ( not ( = ?auto_2167726 ?auto_2167727 ) ) ( not ( = ?auto_2167724 ?auto_2167727 ) ) ( not ( = ?auto_2167732 ?auto_2167727 ) ) ( ON ?auto_2167720 ?auto_2167719 ) ( ON ?auto_2167721 ?auto_2167720 ) ( ON ?auto_2167722 ?auto_2167721 ) ( ON ?auto_2167723 ?auto_2167722 ) ( ON ?auto_2167724 ?auto_2167723 ) ( not ( = ?auto_2167719 ?auto_2167720 ) ) ( not ( = ?auto_2167719 ?auto_2167721 ) ) ( not ( = ?auto_2167719 ?auto_2167722 ) ) ( not ( = ?auto_2167719 ?auto_2167723 ) ) ( not ( = ?auto_2167719 ?auto_2167724 ) ) ( not ( = ?auto_2167719 ?auto_2167725 ) ) ( not ( = ?auto_2167719 ?auto_2167726 ) ) ( not ( = ?auto_2167719 ?auto_2167732 ) ) ( not ( = ?auto_2167719 ?auto_2167727 ) ) ( not ( = ?auto_2167720 ?auto_2167721 ) ) ( not ( = ?auto_2167720 ?auto_2167722 ) ) ( not ( = ?auto_2167720 ?auto_2167723 ) ) ( not ( = ?auto_2167720 ?auto_2167724 ) ) ( not ( = ?auto_2167720 ?auto_2167725 ) ) ( not ( = ?auto_2167720 ?auto_2167726 ) ) ( not ( = ?auto_2167720 ?auto_2167732 ) ) ( not ( = ?auto_2167720 ?auto_2167727 ) ) ( not ( = ?auto_2167721 ?auto_2167722 ) ) ( not ( = ?auto_2167721 ?auto_2167723 ) ) ( not ( = ?auto_2167721 ?auto_2167724 ) ) ( not ( = ?auto_2167721 ?auto_2167725 ) ) ( not ( = ?auto_2167721 ?auto_2167726 ) ) ( not ( = ?auto_2167721 ?auto_2167732 ) ) ( not ( = ?auto_2167721 ?auto_2167727 ) ) ( not ( = ?auto_2167722 ?auto_2167723 ) ) ( not ( = ?auto_2167722 ?auto_2167724 ) ) ( not ( = ?auto_2167722 ?auto_2167725 ) ) ( not ( = ?auto_2167722 ?auto_2167726 ) ) ( not ( = ?auto_2167722 ?auto_2167732 ) ) ( not ( = ?auto_2167722 ?auto_2167727 ) ) ( not ( = ?auto_2167723 ?auto_2167724 ) ) ( not ( = ?auto_2167723 ?auto_2167725 ) ) ( not ( = ?auto_2167723 ?auto_2167726 ) ) ( not ( = ?auto_2167723 ?auto_2167732 ) ) ( not ( = ?auto_2167723 ?auto_2167727 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167724 ?auto_2167725 ?auto_2167726 )
      ( MAKE-7CRATE-VERIFY ?auto_2167719 ?auto_2167720 ?auto_2167721 ?auto_2167722 ?auto_2167723 ?auto_2167724 ?auto_2167725 ?auto_2167726 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2167734 - SURFACE
      ?auto_2167735 - SURFACE
      ?auto_2167736 - SURFACE
      ?auto_2167737 - SURFACE
      ?auto_2167738 - SURFACE
      ?auto_2167739 - SURFACE
      ?auto_2167740 - SURFACE
      ?auto_2167741 - SURFACE
      ?auto_2167742 - SURFACE
    )
    :vars
    (
      ?auto_2167747 - HOIST
      ?auto_2167746 - PLACE
      ?auto_2167744 - PLACE
      ?auto_2167745 - HOIST
      ?auto_2167748 - SURFACE
      ?auto_2167749 - TRUCK
      ?auto_2167743 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167747 ?auto_2167746 ) ( IS-CRATE ?auto_2167742 ) ( not ( = ?auto_2167741 ?auto_2167742 ) ) ( not ( = ?auto_2167740 ?auto_2167741 ) ) ( not ( = ?auto_2167740 ?auto_2167742 ) ) ( not ( = ?auto_2167744 ?auto_2167746 ) ) ( HOIST-AT ?auto_2167745 ?auto_2167744 ) ( not ( = ?auto_2167747 ?auto_2167745 ) ) ( SURFACE-AT ?auto_2167742 ?auto_2167744 ) ( ON ?auto_2167742 ?auto_2167748 ) ( CLEAR ?auto_2167742 ) ( not ( = ?auto_2167741 ?auto_2167748 ) ) ( not ( = ?auto_2167742 ?auto_2167748 ) ) ( not ( = ?auto_2167740 ?auto_2167748 ) ) ( SURFACE-AT ?auto_2167740 ?auto_2167746 ) ( CLEAR ?auto_2167740 ) ( IS-CRATE ?auto_2167741 ) ( AVAILABLE ?auto_2167747 ) ( TRUCK-AT ?auto_2167749 ?auto_2167744 ) ( AVAILABLE ?auto_2167745 ) ( SURFACE-AT ?auto_2167741 ?auto_2167744 ) ( ON ?auto_2167741 ?auto_2167743 ) ( CLEAR ?auto_2167741 ) ( not ( = ?auto_2167741 ?auto_2167743 ) ) ( not ( = ?auto_2167742 ?auto_2167743 ) ) ( not ( = ?auto_2167740 ?auto_2167743 ) ) ( not ( = ?auto_2167748 ?auto_2167743 ) ) ( ON ?auto_2167735 ?auto_2167734 ) ( ON ?auto_2167736 ?auto_2167735 ) ( ON ?auto_2167737 ?auto_2167736 ) ( ON ?auto_2167738 ?auto_2167737 ) ( ON ?auto_2167739 ?auto_2167738 ) ( ON ?auto_2167740 ?auto_2167739 ) ( not ( = ?auto_2167734 ?auto_2167735 ) ) ( not ( = ?auto_2167734 ?auto_2167736 ) ) ( not ( = ?auto_2167734 ?auto_2167737 ) ) ( not ( = ?auto_2167734 ?auto_2167738 ) ) ( not ( = ?auto_2167734 ?auto_2167739 ) ) ( not ( = ?auto_2167734 ?auto_2167740 ) ) ( not ( = ?auto_2167734 ?auto_2167741 ) ) ( not ( = ?auto_2167734 ?auto_2167742 ) ) ( not ( = ?auto_2167734 ?auto_2167748 ) ) ( not ( = ?auto_2167734 ?auto_2167743 ) ) ( not ( = ?auto_2167735 ?auto_2167736 ) ) ( not ( = ?auto_2167735 ?auto_2167737 ) ) ( not ( = ?auto_2167735 ?auto_2167738 ) ) ( not ( = ?auto_2167735 ?auto_2167739 ) ) ( not ( = ?auto_2167735 ?auto_2167740 ) ) ( not ( = ?auto_2167735 ?auto_2167741 ) ) ( not ( = ?auto_2167735 ?auto_2167742 ) ) ( not ( = ?auto_2167735 ?auto_2167748 ) ) ( not ( = ?auto_2167735 ?auto_2167743 ) ) ( not ( = ?auto_2167736 ?auto_2167737 ) ) ( not ( = ?auto_2167736 ?auto_2167738 ) ) ( not ( = ?auto_2167736 ?auto_2167739 ) ) ( not ( = ?auto_2167736 ?auto_2167740 ) ) ( not ( = ?auto_2167736 ?auto_2167741 ) ) ( not ( = ?auto_2167736 ?auto_2167742 ) ) ( not ( = ?auto_2167736 ?auto_2167748 ) ) ( not ( = ?auto_2167736 ?auto_2167743 ) ) ( not ( = ?auto_2167737 ?auto_2167738 ) ) ( not ( = ?auto_2167737 ?auto_2167739 ) ) ( not ( = ?auto_2167737 ?auto_2167740 ) ) ( not ( = ?auto_2167737 ?auto_2167741 ) ) ( not ( = ?auto_2167737 ?auto_2167742 ) ) ( not ( = ?auto_2167737 ?auto_2167748 ) ) ( not ( = ?auto_2167737 ?auto_2167743 ) ) ( not ( = ?auto_2167738 ?auto_2167739 ) ) ( not ( = ?auto_2167738 ?auto_2167740 ) ) ( not ( = ?auto_2167738 ?auto_2167741 ) ) ( not ( = ?auto_2167738 ?auto_2167742 ) ) ( not ( = ?auto_2167738 ?auto_2167748 ) ) ( not ( = ?auto_2167738 ?auto_2167743 ) ) ( not ( = ?auto_2167739 ?auto_2167740 ) ) ( not ( = ?auto_2167739 ?auto_2167741 ) ) ( not ( = ?auto_2167739 ?auto_2167742 ) ) ( not ( = ?auto_2167739 ?auto_2167748 ) ) ( not ( = ?auto_2167739 ?auto_2167743 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167740 ?auto_2167741 ?auto_2167742 )
      ( MAKE-8CRATE-VERIFY ?auto_2167734 ?auto_2167735 ?auto_2167736 ?auto_2167737 ?auto_2167738 ?auto_2167739 ?auto_2167740 ?auto_2167741 ?auto_2167742 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2167750 - SURFACE
      ?auto_2167751 - SURFACE
      ?auto_2167752 - SURFACE
      ?auto_2167753 - SURFACE
      ?auto_2167754 - SURFACE
      ?auto_2167755 - SURFACE
      ?auto_2167756 - SURFACE
      ?auto_2167757 - SURFACE
      ?auto_2167758 - SURFACE
      ?auto_2167759 - SURFACE
    )
    :vars
    (
      ?auto_2167764 - HOIST
      ?auto_2167763 - PLACE
      ?auto_2167761 - PLACE
      ?auto_2167762 - HOIST
      ?auto_2167765 - SURFACE
      ?auto_2167766 - TRUCK
      ?auto_2167760 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167764 ?auto_2167763 ) ( IS-CRATE ?auto_2167759 ) ( not ( = ?auto_2167758 ?auto_2167759 ) ) ( not ( = ?auto_2167757 ?auto_2167758 ) ) ( not ( = ?auto_2167757 ?auto_2167759 ) ) ( not ( = ?auto_2167761 ?auto_2167763 ) ) ( HOIST-AT ?auto_2167762 ?auto_2167761 ) ( not ( = ?auto_2167764 ?auto_2167762 ) ) ( SURFACE-AT ?auto_2167759 ?auto_2167761 ) ( ON ?auto_2167759 ?auto_2167765 ) ( CLEAR ?auto_2167759 ) ( not ( = ?auto_2167758 ?auto_2167765 ) ) ( not ( = ?auto_2167759 ?auto_2167765 ) ) ( not ( = ?auto_2167757 ?auto_2167765 ) ) ( SURFACE-AT ?auto_2167757 ?auto_2167763 ) ( CLEAR ?auto_2167757 ) ( IS-CRATE ?auto_2167758 ) ( AVAILABLE ?auto_2167764 ) ( TRUCK-AT ?auto_2167766 ?auto_2167761 ) ( AVAILABLE ?auto_2167762 ) ( SURFACE-AT ?auto_2167758 ?auto_2167761 ) ( ON ?auto_2167758 ?auto_2167760 ) ( CLEAR ?auto_2167758 ) ( not ( = ?auto_2167758 ?auto_2167760 ) ) ( not ( = ?auto_2167759 ?auto_2167760 ) ) ( not ( = ?auto_2167757 ?auto_2167760 ) ) ( not ( = ?auto_2167765 ?auto_2167760 ) ) ( ON ?auto_2167751 ?auto_2167750 ) ( ON ?auto_2167752 ?auto_2167751 ) ( ON ?auto_2167753 ?auto_2167752 ) ( ON ?auto_2167754 ?auto_2167753 ) ( ON ?auto_2167755 ?auto_2167754 ) ( ON ?auto_2167756 ?auto_2167755 ) ( ON ?auto_2167757 ?auto_2167756 ) ( not ( = ?auto_2167750 ?auto_2167751 ) ) ( not ( = ?auto_2167750 ?auto_2167752 ) ) ( not ( = ?auto_2167750 ?auto_2167753 ) ) ( not ( = ?auto_2167750 ?auto_2167754 ) ) ( not ( = ?auto_2167750 ?auto_2167755 ) ) ( not ( = ?auto_2167750 ?auto_2167756 ) ) ( not ( = ?auto_2167750 ?auto_2167757 ) ) ( not ( = ?auto_2167750 ?auto_2167758 ) ) ( not ( = ?auto_2167750 ?auto_2167759 ) ) ( not ( = ?auto_2167750 ?auto_2167765 ) ) ( not ( = ?auto_2167750 ?auto_2167760 ) ) ( not ( = ?auto_2167751 ?auto_2167752 ) ) ( not ( = ?auto_2167751 ?auto_2167753 ) ) ( not ( = ?auto_2167751 ?auto_2167754 ) ) ( not ( = ?auto_2167751 ?auto_2167755 ) ) ( not ( = ?auto_2167751 ?auto_2167756 ) ) ( not ( = ?auto_2167751 ?auto_2167757 ) ) ( not ( = ?auto_2167751 ?auto_2167758 ) ) ( not ( = ?auto_2167751 ?auto_2167759 ) ) ( not ( = ?auto_2167751 ?auto_2167765 ) ) ( not ( = ?auto_2167751 ?auto_2167760 ) ) ( not ( = ?auto_2167752 ?auto_2167753 ) ) ( not ( = ?auto_2167752 ?auto_2167754 ) ) ( not ( = ?auto_2167752 ?auto_2167755 ) ) ( not ( = ?auto_2167752 ?auto_2167756 ) ) ( not ( = ?auto_2167752 ?auto_2167757 ) ) ( not ( = ?auto_2167752 ?auto_2167758 ) ) ( not ( = ?auto_2167752 ?auto_2167759 ) ) ( not ( = ?auto_2167752 ?auto_2167765 ) ) ( not ( = ?auto_2167752 ?auto_2167760 ) ) ( not ( = ?auto_2167753 ?auto_2167754 ) ) ( not ( = ?auto_2167753 ?auto_2167755 ) ) ( not ( = ?auto_2167753 ?auto_2167756 ) ) ( not ( = ?auto_2167753 ?auto_2167757 ) ) ( not ( = ?auto_2167753 ?auto_2167758 ) ) ( not ( = ?auto_2167753 ?auto_2167759 ) ) ( not ( = ?auto_2167753 ?auto_2167765 ) ) ( not ( = ?auto_2167753 ?auto_2167760 ) ) ( not ( = ?auto_2167754 ?auto_2167755 ) ) ( not ( = ?auto_2167754 ?auto_2167756 ) ) ( not ( = ?auto_2167754 ?auto_2167757 ) ) ( not ( = ?auto_2167754 ?auto_2167758 ) ) ( not ( = ?auto_2167754 ?auto_2167759 ) ) ( not ( = ?auto_2167754 ?auto_2167765 ) ) ( not ( = ?auto_2167754 ?auto_2167760 ) ) ( not ( = ?auto_2167755 ?auto_2167756 ) ) ( not ( = ?auto_2167755 ?auto_2167757 ) ) ( not ( = ?auto_2167755 ?auto_2167758 ) ) ( not ( = ?auto_2167755 ?auto_2167759 ) ) ( not ( = ?auto_2167755 ?auto_2167765 ) ) ( not ( = ?auto_2167755 ?auto_2167760 ) ) ( not ( = ?auto_2167756 ?auto_2167757 ) ) ( not ( = ?auto_2167756 ?auto_2167758 ) ) ( not ( = ?auto_2167756 ?auto_2167759 ) ) ( not ( = ?auto_2167756 ?auto_2167765 ) ) ( not ( = ?auto_2167756 ?auto_2167760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167757 ?auto_2167758 ?auto_2167759 )
      ( MAKE-9CRATE-VERIFY ?auto_2167750 ?auto_2167751 ?auto_2167752 ?auto_2167753 ?auto_2167754 ?auto_2167755 ?auto_2167756 ?auto_2167757 ?auto_2167758 ?auto_2167759 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2167767 - SURFACE
      ?auto_2167768 - SURFACE
      ?auto_2167769 - SURFACE
      ?auto_2167770 - SURFACE
      ?auto_2167771 - SURFACE
      ?auto_2167772 - SURFACE
      ?auto_2167773 - SURFACE
      ?auto_2167774 - SURFACE
      ?auto_2167775 - SURFACE
      ?auto_2167776 - SURFACE
      ?auto_2167777 - SURFACE
    )
    :vars
    (
      ?auto_2167782 - HOIST
      ?auto_2167781 - PLACE
      ?auto_2167779 - PLACE
      ?auto_2167780 - HOIST
      ?auto_2167783 - SURFACE
      ?auto_2167784 - TRUCK
      ?auto_2167778 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167782 ?auto_2167781 ) ( IS-CRATE ?auto_2167777 ) ( not ( = ?auto_2167776 ?auto_2167777 ) ) ( not ( = ?auto_2167775 ?auto_2167776 ) ) ( not ( = ?auto_2167775 ?auto_2167777 ) ) ( not ( = ?auto_2167779 ?auto_2167781 ) ) ( HOIST-AT ?auto_2167780 ?auto_2167779 ) ( not ( = ?auto_2167782 ?auto_2167780 ) ) ( SURFACE-AT ?auto_2167777 ?auto_2167779 ) ( ON ?auto_2167777 ?auto_2167783 ) ( CLEAR ?auto_2167777 ) ( not ( = ?auto_2167776 ?auto_2167783 ) ) ( not ( = ?auto_2167777 ?auto_2167783 ) ) ( not ( = ?auto_2167775 ?auto_2167783 ) ) ( SURFACE-AT ?auto_2167775 ?auto_2167781 ) ( CLEAR ?auto_2167775 ) ( IS-CRATE ?auto_2167776 ) ( AVAILABLE ?auto_2167782 ) ( TRUCK-AT ?auto_2167784 ?auto_2167779 ) ( AVAILABLE ?auto_2167780 ) ( SURFACE-AT ?auto_2167776 ?auto_2167779 ) ( ON ?auto_2167776 ?auto_2167778 ) ( CLEAR ?auto_2167776 ) ( not ( = ?auto_2167776 ?auto_2167778 ) ) ( not ( = ?auto_2167777 ?auto_2167778 ) ) ( not ( = ?auto_2167775 ?auto_2167778 ) ) ( not ( = ?auto_2167783 ?auto_2167778 ) ) ( ON ?auto_2167768 ?auto_2167767 ) ( ON ?auto_2167769 ?auto_2167768 ) ( ON ?auto_2167770 ?auto_2167769 ) ( ON ?auto_2167771 ?auto_2167770 ) ( ON ?auto_2167772 ?auto_2167771 ) ( ON ?auto_2167773 ?auto_2167772 ) ( ON ?auto_2167774 ?auto_2167773 ) ( ON ?auto_2167775 ?auto_2167774 ) ( not ( = ?auto_2167767 ?auto_2167768 ) ) ( not ( = ?auto_2167767 ?auto_2167769 ) ) ( not ( = ?auto_2167767 ?auto_2167770 ) ) ( not ( = ?auto_2167767 ?auto_2167771 ) ) ( not ( = ?auto_2167767 ?auto_2167772 ) ) ( not ( = ?auto_2167767 ?auto_2167773 ) ) ( not ( = ?auto_2167767 ?auto_2167774 ) ) ( not ( = ?auto_2167767 ?auto_2167775 ) ) ( not ( = ?auto_2167767 ?auto_2167776 ) ) ( not ( = ?auto_2167767 ?auto_2167777 ) ) ( not ( = ?auto_2167767 ?auto_2167783 ) ) ( not ( = ?auto_2167767 ?auto_2167778 ) ) ( not ( = ?auto_2167768 ?auto_2167769 ) ) ( not ( = ?auto_2167768 ?auto_2167770 ) ) ( not ( = ?auto_2167768 ?auto_2167771 ) ) ( not ( = ?auto_2167768 ?auto_2167772 ) ) ( not ( = ?auto_2167768 ?auto_2167773 ) ) ( not ( = ?auto_2167768 ?auto_2167774 ) ) ( not ( = ?auto_2167768 ?auto_2167775 ) ) ( not ( = ?auto_2167768 ?auto_2167776 ) ) ( not ( = ?auto_2167768 ?auto_2167777 ) ) ( not ( = ?auto_2167768 ?auto_2167783 ) ) ( not ( = ?auto_2167768 ?auto_2167778 ) ) ( not ( = ?auto_2167769 ?auto_2167770 ) ) ( not ( = ?auto_2167769 ?auto_2167771 ) ) ( not ( = ?auto_2167769 ?auto_2167772 ) ) ( not ( = ?auto_2167769 ?auto_2167773 ) ) ( not ( = ?auto_2167769 ?auto_2167774 ) ) ( not ( = ?auto_2167769 ?auto_2167775 ) ) ( not ( = ?auto_2167769 ?auto_2167776 ) ) ( not ( = ?auto_2167769 ?auto_2167777 ) ) ( not ( = ?auto_2167769 ?auto_2167783 ) ) ( not ( = ?auto_2167769 ?auto_2167778 ) ) ( not ( = ?auto_2167770 ?auto_2167771 ) ) ( not ( = ?auto_2167770 ?auto_2167772 ) ) ( not ( = ?auto_2167770 ?auto_2167773 ) ) ( not ( = ?auto_2167770 ?auto_2167774 ) ) ( not ( = ?auto_2167770 ?auto_2167775 ) ) ( not ( = ?auto_2167770 ?auto_2167776 ) ) ( not ( = ?auto_2167770 ?auto_2167777 ) ) ( not ( = ?auto_2167770 ?auto_2167783 ) ) ( not ( = ?auto_2167770 ?auto_2167778 ) ) ( not ( = ?auto_2167771 ?auto_2167772 ) ) ( not ( = ?auto_2167771 ?auto_2167773 ) ) ( not ( = ?auto_2167771 ?auto_2167774 ) ) ( not ( = ?auto_2167771 ?auto_2167775 ) ) ( not ( = ?auto_2167771 ?auto_2167776 ) ) ( not ( = ?auto_2167771 ?auto_2167777 ) ) ( not ( = ?auto_2167771 ?auto_2167783 ) ) ( not ( = ?auto_2167771 ?auto_2167778 ) ) ( not ( = ?auto_2167772 ?auto_2167773 ) ) ( not ( = ?auto_2167772 ?auto_2167774 ) ) ( not ( = ?auto_2167772 ?auto_2167775 ) ) ( not ( = ?auto_2167772 ?auto_2167776 ) ) ( not ( = ?auto_2167772 ?auto_2167777 ) ) ( not ( = ?auto_2167772 ?auto_2167783 ) ) ( not ( = ?auto_2167772 ?auto_2167778 ) ) ( not ( = ?auto_2167773 ?auto_2167774 ) ) ( not ( = ?auto_2167773 ?auto_2167775 ) ) ( not ( = ?auto_2167773 ?auto_2167776 ) ) ( not ( = ?auto_2167773 ?auto_2167777 ) ) ( not ( = ?auto_2167773 ?auto_2167783 ) ) ( not ( = ?auto_2167773 ?auto_2167778 ) ) ( not ( = ?auto_2167774 ?auto_2167775 ) ) ( not ( = ?auto_2167774 ?auto_2167776 ) ) ( not ( = ?auto_2167774 ?auto_2167777 ) ) ( not ( = ?auto_2167774 ?auto_2167783 ) ) ( not ( = ?auto_2167774 ?auto_2167778 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167775 ?auto_2167776 ?auto_2167777 )
      ( MAKE-10CRATE-VERIFY ?auto_2167767 ?auto_2167768 ?auto_2167769 ?auto_2167770 ?auto_2167771 ?auto_2167772 ?auto_2167773 ?auto_2167774 ?auto_2167775 ?auto_2167776 ?auto_2167777 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2167785 - SURFACE
      ?auto_2167786 - SURFACE
      ?auto_2167787 - SURFACE
      ?auto_2167788 - SURFACE
      ?auto_2167789 - SURFACE
      ?auto_2167790 - SURFACE
      ?auto_2167791 - SURFACE
      ?auto_2167792 - SURFACE
      ?auto_2167793 - SURFACE
      ?auto_2167794 - SURFACE
      ?auto_2167795 - SURFACE
      ?auto_2167796 - SURFACE
    )
    :vars
    (
      ?auto_2167801 - HOIST
      ?auto_2167800 - PLACE
      ?auto_2167798 - PLACE
      ?auto_2167799 - HOIST
      ?auto_2167802 - SURFACE
      ?auto_2167803 - TRUCK
      ?auto_2167797 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167801 ?auto_2167800 ) ( IS-CRATE ?auto_2167796 ) ( not ( = ?auto_2167795 ?auto_2167796 ) ) ( not ( = ?auto_2167794 ?auto_2167795 ) ) ( not ( = ?auto_2167794 ?auto_2167796 ) ) ( not ( = ?auto_2167798 ?auto_2167800 ) ) ( HOIST-AT ?auto_2167799 ?auto_2167798 ) ( not ( = ?auto_2167801 ?auto_2167799 ) ) ( SURFACE-AT ?auto_2167796 ?auto_2167798 ) ( ON ?auto_2167796 ?auto_2167802 ) ( CLEAR ?auto_2167796 ) ( not ( = ?auto_2167795 ?auto_2167802 ) ) ( not ( = ?auto_2167796 ?auto_2167802 ) ) ( not ( = ?auto_2167794 ?auto_2167802 ) ) ( SURFACE-AT ?auto_2167794 ?auto_2167800 ) ( CLEAR ?auto_2167794 ) ( IS-CRATE ?auto_2167795 ) ( AVAILABLE ?auto_2167801 ) ( TRUCK-AT ?auto_2167803 ?auto_2167798 ) ( AVAILABLE ?auto_2167799 ) ( SURFACE-AT ?auto_2167795 ?auto_2167798 ) ( ON ?auto_2167795 ?auto_2167797 ) ( CLEAR ?auto_2167795 ) ( not ( = ?auto_2167795 ?auto_2167797 ) ) ( not ( = ?auto_2167796 ?auto_2167797 ) ) ( not ( = ?auto_2167794 ?auto_2167797 ) ) ( not ( = ?auto_2167802 ?auto_2167797 ) ) ( ON ?auto_2167786 ?auto_2167785 ) ( ON ?auto_2167787 ?auto_2167786 ) ( ON ?auto_2167788 ?auto_2167787 ) ( ON ?auto_2167789 ?auto_2167788 ) ( ON ?auto_2167790 ?auto_2167789 ) ( ON ?auto_2167791 ?auto_2167790 ) ( ON ?auto_2167792 ?auto_2167791 ) ( ON ?auto_2167793 ?auto_2167792 ) ( ON ?auto_2167794 ?auto_2167793 ) ( not ( = ?auto_2167785 ?auto_2167786 ) ) ( not ( = ?auto_2167785 ?auto_2167787 ) ) ( not ( = ?auto_2167785 ?auto_2167788 ) ) ( not ( = ?auto_2167785 ?auto_2167789 ) ) ( not ( = ?auto_2167785 ?auto_2167790 ) ) ( not ( = ?auto_2167785 ?auto_2167791 ) ) ( not ( = ?auto_2167785 ?auto_2167792 ) ) ( not ( = ?auto_2167785 ?auto_2167793 ) ) ( not ( = ?auto_2167785 ?auto_2167794 ) ) ( not ( = ?auto_2167785 ?auto_2167795 ) ) ( not ( = ?auto_2167785 ?auto_2167796 ) ) ( not ( = ?auto_2167785 ?auto_2167802 ) ) ( not ( = ?auto_2167785 ?auto_2167797 ) ) ( not ( = ?auto_2167786 ?auto_2167787 ) ) ( not ( = ?auto_2167786 ?auto_2167788 ) ) ( not ( = ?auto_2167786 ?auto_2167789 ) ) ( not ( = ?auto_2167786 ?auto_2167790 ) ) ( not ( = ?auto_2167786 ?auto_2167791 ) ) ( not ( = ?auto_2167786 ?auto_2167792 ) ) ( not ( = ?auto_2167786 ?auto_2167793 ) ) ( not ( = ?auto_2167786 ?auto_2167794 ) ) ( not ( = ?auto_2167786 ?auto_2167795 ) ) ( not ( = ?auto_2167786 ?auto_2167796 ) ) ( not ( = ?auto_2167786 ?auto_2167802 ) ) ( not ( = ?auto_2167786 ?auto_2167797 ) ) ( not ( = ?auto_2167787 ?auto_2167788 ) ) ( not ( = ?auto_2167787 ?auto_2167789 ) ) ( not ( = ?auto_2167787 ?auto_2167790 ) ) ( not ( = ?auto_2167787 ?auto_2167791 ) ) ( not ( = ?auto_2167787 ?auto_2167792 ) ) ( not ( = ?auto_2167787 ?auto_2167793 ) ) ( not ( = ?auto_2167787 ?auto_2167794 ) ) ( not ( = ?auto_2167787 ?auto_2167795 ) ) ( not ( = ?auto_2167787 ?auto_2167796 ) ) ( not ( = ?auto_2167787 ?auto_2167802 ) ) ( not ( = ?auto_2167787 ?auto_2167797 ) ) ( not ( = ?auto_2167788 ?auto_2167789 ) ) ( not ( = ?auto_2167788 ?auto_2167790 ) ) ( not ( = ?auto_2167788 ?auto_2167791 ) ) ( not ( = ?auto_2167788 ?auto_2167792 ) ) ( not ( = ?auto_2167788 ?auto_2167793 ) ) ( not ( = ?auto_2167788 ?auto_2167794 ) ) ( not ( = ?auto_2167788 ?auto_2167795 ) ) ( not ( = ?auto_2167788 ?auto_2167796 ) ) ( not ( = ?auto_2167788 ?auto_2167802 ) ) ( not ( = ?auto_2167788 ?auto_2167797 ) ) ( not ( = ?auto_2167789 ?auto_2167790 ) ) ( not ( = ?auto_2167789 ?auto_2167791 ) ) ( not ( = ?auto_2167789 ?auto_2167792 ) ) ( not ( = ?auto_2167789 ?auto_2167793 ) ) ( not ( = ?auto_2167789 ?auto_2167794 ) ) ( not ( = ?auto_2167789 ?auto_2167795 ) ) ( not ( = ?auto_2167789 ?auto_2167796 ) ) ( not ( = ?auto_2167789 ?auto_2167802 ) ) ( not ( = ?auto_2167789 ?auto_2167797 ) ) ( not ( = ?auto_2167790 ?auto_2167791 ) ) ( not ( = ?auto_2167790 ?auto_2167792 ) ) ( not ( = ?auto_2167790 ?auto_2167793 ) ) ( not ( = ?auto_2167790 ?auto_2167794 ) ) ( not ( = ?auto_2167790 ?auto_2167795 ) ) ( not ( = ?auto_2167790 ?auto_2167796 ) ) ( not ( = ?auto_2167790 ?auto_2167802 ) ) ( not ( = ?auto_2167790 ?auto_2167797 ) ) ( not ( = ?auto_2167791 ?auto_2167792 ) ) ( not ( = ?auto_2167791 ?auto_2167793 ) ) ( not ( = ?auto_2167791 ?auto_2167794 ) ) ( not ( = ?auto_2167791 ?auto_2167795 ) ) ( not ( = ?auto_2167791 ?auto_2167796 ) ) ( not ( = ?auto_2167791 ?auto_2167802 ) ) ( not ( = ?auto_2167791 ?auto_2167797 ) ) ( not ( = ?auto_2167792 ?auto_2167793 ) ) ( not ( = ?auto_2167792 ?auto_2167794 ) ) ( not ( = ?auto_2167792 ?auto_2167795 ) ) ( not ( = ?auto_2167792 ?auto_2167796 ) ) ( not ( = ?auto_2167792 ?auto_2167802 ) ) ( not ( = ?auto_2167792 ?auto_2167797 ) ) ( not ( = ?auto_2167793 ?auto_2167794 ) ) ( not ( = ?auto_2167793 ?auto_2167795 ) ) ( not ( = ?auto_2167793 ?auto_2167796 ) ) ( not ( = ?auto_2167793 ?auto_2167802 ) ) ( not ( = ?auto_2167793 ?auto_2167797 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167794 ?auto_2167795 ?auto_2167796 )
      ( MAKE-11CRATE-VERIFY ?auto_2167785 ?auto_2167786 ?auto_2167787 ?auto_2167788 ?auto_2167789 ?auto_2167790 ?auto_2167791 ?auto_2167792 ?auto_2167793 ?auto_2167794 ?auto_2167795 ?auto_2167796 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167804 - SURFACE
      ?auto_2167805 - SURFACE
      ?auto_2167806 - SURFACE
      ?auto_2167807 - SURFACE
      ?auto_2167808 - SURFACE
      ?auto_2167809 - SURFACE
      ?auto_2167810 - SURFACE
      ?auto_2167811 - SURFACE
      ?auto_2167812 - SURFACE
      ?auto_2167813 - SURFACE
      ?auto_2167814 - SURFACE
      ?auto_2167815 - SURFACE
      ?auto_2167816 - SURFACE
    )
    :vars
    (
      ?auto_2167821 - HOIST
      ?auto_2167820 - PLACE
      ?auto_2167818 - PLACE
      ?auto_2167819 - HOIST
      ?auto_2167822 - SURFACE
      ?auto_2167823 - TRUCK
      ?auto_2167817 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167821 ?auto_2167820 ) ( IS-CRATE ?auto_2167816 ) ( not ( = ?auto_2167815 ?auto_2167816 ) ) ( not ( = ?auto_2167814 ?auto_2167815 ) ) ( not ( = ?auto_2167814 ?auto_2167816 ) ) ( not ( = ?auto_2167818 ?auto_2167820 ) ) ( HOIST-AT ?auto_2167819 ?auto_2167818 ) ( not ( = ?auto_2167821 ?auto_2167819 ) ) ( SURFACE-AT ?auto_2167816 ?auto_2167818 ) ( ON ?auto_2167816 ?auto_2167822 ) ( CLEAR ?auto_2167816 ) ( not ( = ?auto_2167815 ?auto_2167822 ) ) ( not ( = ?auto_2167816 ?auto_2167822 ) ) ( not ( = ?auto_2167814 ?auto_2167822 ) ) ( SURFACE-AT ?auto_2167814 ?auto_2167820 ) ( CLEAR ?auto_2167814 ) ( IS-CRATE ?auto_2167815 ) ( AVAILABLE ?auto_2167821 ) ( TRUCK-AT ?auto_2167823 ?auto_2167818 ) ( AVAILABLE ?auto_2167819 ) ( SURFACE-AT ?auto_2167815 ?auto_2167818 ) ( ON ?auto_2167815 ?auto_2167817 ) ( CLEAR ?auto_2167815 ) ( not ( = ?auto_2167815 ?auto_2167817 ) ) ( not ( = ?auto_2167816 ?auto_2167817 ) ) ( not ( = ?auto_2167814 ?auto_2167817 ) ) ( not ( = ?auto_2167822 ?auto_2167817 ) ) ( ON ?auto_2167805 ?auto_2167804 ) ( ON ?auto_2167806 ?auto_2167805 ) ( ON ?auto_2167807 ?auto_2167806 ) ( ON ?auto_2167808 ?auto_2167807 ) ( ON ?auto_2167809 ?auto_2167808 ) ( ON ?auto_2167810 ?auto_2167809 ) ( ON ?auto_2167811 ?auto_2167810 ) ( ON ?auto_2167812 ?auto_2167811 ) ( ON ?auto_2167813 ?auto_2167812 ) ( ON ?auto_2167814 ?auto_2167813 ) ( not ( = ?auto_2167804 ?auto_2167805 ) ) ( not ( = ?auto_2167804 ?auto_2167806 ) ) ( not ( = ?auto_2167804 ?auto_2167807 ) ) ( not ( = ?auto_2167804 ?auto_2167808 ) ) ( not ( = ?auto_2167804 ?auto_2167809 ) ) ( not ( = ?auto_2167804 ?auto_2167810 ) ) ( not ( = ?auto_2167804 ?auto_2167811 ) ) ( not ( = ?auto_2167804 ?auto_2167812 ) ) ( not ( = ?auto_2167804 ?auto_2167813 ) ) ( not ( = ?auto_2167804 ?auto_2167814 ) ) ( not ( = ?auto_2167804 ?auto_2167815 ) ) ( not ( = ?auto_2167804 ?auto_2167816 ) ) ( not ( = ?auto_2167804 ?auto_2167822 ) ) ( not ( = ?auto_2167804 ?auto_2167817 ) ) ( not ( = ?auto_2167805 ?auto_2167806 ) ) ( not ( = ?auto_2167805 ?auto_2167807 ) ) ( not ( = ?auto_2167805 ?auto_2167808 ) ) ( not ( = ?auto_2167805 ?auto_2167809 ) ) ( not ( = ?auto_2167805 ?auto_2167810 ) ) ( not ( = ?auto_2167805 ?auto_2167811 ) ) ( not ( = ?auto_2167805 ?auto_2167812 ) ) ( not ( = ?auto_2167805 ?auto_2167813 ) ) ( not ( = ?auto_2167805 ?auto_2167814 ) ) ( not ( = ?auto_2167805 ?auto_2167815 ) ) ( not ( = ?auto_2167805 ?auto_2167816 ) ) ( not ( = ?auto_2167805 ?auto_2167822 ) ) ( not ( = ?auto_2167805 ?auto_2167817 ) ) ( not ( = ?auto_2167806 ?auto_2167807 ) ) ( not ( = ?auto_2167806 ?auto_2167808 ) ) ( not ( = ?auto_2167806 ?auto_2167809 ) ) ( not ( = ?auto_2167806 ?auto_2167810 ) ) ( not ( = ?auto_2167806 ?auto_2167811 ) ) ( not ( = ?auto_2167806 ?auto_2167812 ) ) ( not ( = ?auto_2167806 ?auto_2167813 ) ) ( not ( = ?auto_2167806 ?auto_2167814 ) ) ( not ( = ?auto_2167806 ?auto_2167815 ) ) ( not ( = ?auto_2167806 ?auto_2167816 ) ) ( not ( = ?auto_2167806 ?auto_2167822 ) ) ( not ( = ?auto_2167806 ?auto_2167817 ) ) ( not ( = ?auto_2167807 ?auto_2167808 ) ) ( not ( = ?auto_2167807 ?auto_2167809 ) ) ( not ( = ?auto_2167807 ?auto_2167810 ) ) ( not ( = ?auto_2167807 ?auto_2167811 ) ) ( not ( = ?auto_2167807 ?auto_2167812 ) ) ( not ( = ?auto_2167807 ?auto_2167813 ) ) ( not ( = ?auto_2167807 ?auto_2167814 ) ) ( not ( = ?auto_2167807 ?auto_2167815 ) ) ( not ( = ?auto_2167807 ?auto_2167816 ) ) ( not ( = ?auto_2167807 ?auto_2167822 ) ) ( not ( = ?auto_2167807 ?auto_2167817 ) ) ( not ( = ?auto_2167808 ?auto_2167809 ) ) ( not ( = ?auto_2167808 ?auto_2167810 ) ) ( not ( = ?auto_2167808 ?auto_2167811 ) ) ( not ( = ?auto_2167808 ?auto_2167812 ) ) ( not ( = ?auto_2167808 ?auto_2167813 ) ) ( not ( = ?auto_2167808 ?auto_2167814 ) ) ( not ( = ?auto_2167808 ?auto_2167815 ) ) ( not ( = ?auto_2167808 ?auto_2167816 ) ) ( not ( = ?auto_2167808 ?auto_2167822 ) ) ( not ( = ?auto_2167808 ?auto_2167817 ) ) ( not ( = ?auto_2167809 ?auto_2167810 ) ) ( not ( = ?auto_2167809 ?auto_2167811 ) ) ( not ( = ?auto_2167809 ?auto_2167812 ) ) ( not ( = ?auto_2167809 ?auto_2167813 ) ) ( not ( = ?auto_2167809 ?auto_2167814 ) ) ( not ( = ?auto_2167809 ?auto_2167815 ) ) ( not ( = ?auto_2167809 ?auto_2167816 ) ) ( not ( = ?auto_2167809 ?auto_2167822 ) ) ( not ( = ?auto_2167809 ?auto_2167817 ) ) ( not ( = ?auto_2167810 ?auto_2167811 ) ) ( not ( = ?auto_2167810 ?auto_2167812 ) ) ( not ( = ?auto_2167810 ?auto_2167813 ) ) ( not ( = ?auto_2167810 ?auto_2167814 ) ) ( not ( = ?auto_2167810 ?auto_2167815 ) ) ( not ( = ?auto_2167810 ?auto_2167816 ) ) ( not ( = ?auto_2167810 ?auto_2167822 ) ) ( not ( = ?auto_2167810 ?auto_2167817 ) ) ( not ( = ?auto_2167811 ?auto_2167812 ) ) ( not ( = ?auto_2167811 ?auto_2167813 ) ) ( not ( = ?auto_2167811 ?auto_2167814 ) ) ( not ( = ?auto_2167811 ?auto_2167815 ) ) ( not ( = ?auto_2167811 ?auto_2167816 ) ) ( not ( = ?auto_2167811 ?auto_2167822 ) ) ( not ( = ?auto_2167811 ?auto_2167817 ) ) ( not ( = ?auto_2167812 ?auto_2167813 ) ) ( not ( = ?auto_2167812 ?auto_2167814 ) ) ( not ( = ?auto_2167812 ?auto_2167815 ) ) ( not ( = ?auto_2167812 ?auto_2167816 ) ) ( not ( = ?auto_2167812 ?auto_2167822 ) ) ( not ( = ?auto_2167812 ?auto_2167817 ) ) ( not ( = ?auto_2167813 ?auto_2167814 ) ) ( not ( = ?auto_2167813 ?auto_2167815 ) ) ( not ( = ?auto_2167813 ?auto_2167816 ) ) ( not ( = ?auto_2167813 ?auto_2167822 ) ) ( not ( = ?auto_2167813 ?auto_2167817 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167814 ?auto_2167815 ?auto_2167816 )
      ( MAKE-12CRATE-VERIFY ?auto_2167804 ?auto_2167805 ?auto_2167806 ?auto_2167807 ?auto_2167808 ?auto_2167809 ?auto_2167810 ?auto_2167811 ?auto_2167812 ?auto_2167813 ?auto_2167814 ?auto_2167815 ?auto_2167816 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2167824 - SURFACE
      ?auto_2167825 - SURFACE
    )
    :vars
    (
      ?auto_2167831 - HOIST
      ?auto_2167830 - PLACE
      ?auto_2167828 - SURFACE
      ?auto_2167827 - PLACE
      ?auto_2167829 - HOIST
      ?auto_2167832 - SURFACE
      ?auto_2167826 - SURFACE
      ?auto_2167833 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167831 ?auto_2167830 ) ( IS-CRATE ?auto_2167825 ) ( not ( = ?auto_2167824 ?auto_2167825 ) ) ( not ( = ?auto_2167828 ?auto_2167824 ) ) ( not ( = ?auto_2167828 ?auto_2167825 ) ) ( not ( = ?auto_2167827 ?auto_2167830 ) ) ( HOIST-AT ?auto_2167829 ?auto_2167827 ) ( not ( = ?auto_2167831 ?auto_2167829 ) ) ( SURFACE-AT ?auto_2167825 ?auto_2167827 ) ( ON ?auto_2167825 ?auto_2167832 ) ( CLEAR ?auto_2167825 ) ( not ( = ?auto_2167824 ?auto_2167832 ) ) ( not ( = ?auto_2167825 ?auto_2167832 ) ) ( not ( = ?auto_2167828 ?auto_2167832 ) ) ( SURFACE-AT ?auto_2167828 ?auto_2167830 ) ( CLEAR ?auto_2167828 ) ( IS-CRATE ?auto_2167824 ) ( AVAILABLE ?auto_2167831 ) ( AVAILABLE ?auto_2167829 ) ( SURFACE-AT ?auto_2167824 ?auto_2167827 ) ( ON ?auto_2167824 ?auto_2167826 ) ( CLEAR ?auto_2167824 ) ( not ( = ?auto_2167824 ?auto_2167826 ) ) ( not ( = ?auto_2167825 ?auto_2167826 ) ) ( not ( = ?auto_2167828 ?auto_2167826 ) ) ( not ( = ?auto_2167832 ?auto_2167826 ) ) ( TRUCK-AT ?auto_2167833 ?auto_2167830 ) )
    :subtasks
    ( ( !DRIVE ?auto_2167833 ?auto_2167830 ?auto_2167827 )
      ( MAKE-2CRATE ?auto_2167828 ?auto_2167824 ?auto_2167825 )
      ( MAKE-1CRATE-VERIFY ?auto_2167824 ?auto_2167825 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2167834 - SURFACE
      ?auto_2167835 - SURFACE
      ?auto_2167836 - SURFACE
    )
    :vars
    (
      ?auto_2167837 - HOIST
      ?auto_2167843 - PLACE
      ?auto_2167840 - PLACE
      ?auto_2167842 - HOIST
      ?auto_2167839 - SURFACE
      ?auto_2167838 - SURFACE
      ?auto_2167841 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167837 ?auto_2167843 ) ( IS-CRATE ?auto_2167836 ) ( not ( = ?auto_2167835 ?auto_2167836 ) ) ( not ( = ?auto_2167834 ?auto_2167835 ) ) ( not ( = ?auto_2167834 ?auto_2167836 ) ) ( not ( = ?auto_2167840 ?auto_2167843 ) ) ( HOIST-AT ?auto_2167842 ?auto_2167840 ) ( not ( = ?auto_2167837 ?auto_2167842 ) ) ( SURFACE-AT ?auto_2167836 ?auto_2167840 ) ( ON ?auto_2167836 ?auto_2167839 ) ( CLEAR ?auto_2167836 ) ( not ( = ?auto_2167835 ?auto_2167839 ) ) ( not ( = ?auto_2167836 ?auto_2167839 ) ) ( not ( = ?auto_2167834 ?auto_2167839 ) ) ( SURFACE-AT ?auto_2167834 ?auto_2167843 ) ( CLEAR ?auto_2167834 ) ( IS-CRATE ?auto_2167835 ) ( AVAILABLE ?auto_2167837 ) ( AVAILABLE ?auto_2167842 ) ( SURFACE-AT ?auto_2167835 ?auto_2167840 ) ( ON ?auto_2167835 ?auto_2167838 ) ( CLEAR ?auto_2167835 ) ( not ( = ?auto_2167835 ?auto_2167838 ) ) ( not ( = ?auto_2167836 ?auto_2167838 ) ) ( not ( = ?auto_2167834 ?auto_2167838 ) ) ( not ( = ?auto_2167839 ?auto_2167838 ) ) ( TRUCK-AT ?auto_2167841 ?auto_2167843 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2167835 ?auto_2167836 )
      ( MAKE-2CRATE-VERIFY ?auto_2167834 ?auto_2167835 ?auto_2167836 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2167844 - SURFACE
      ?auto_2167845 - SURFACE
      ?auto_2167846 - SURFACE
      ?auto_2167847 - SURFACE
    )
    :vars
    (
      ?auto_2167849 - HOIST
      ?auto_2167851 - PLACE
      ?auto_2167853 - PLACE
      ?auto_2167850 - HOIST
      ?auto_2167848 - SURFACE
      ?auto_2167854 - SURFACE
      ?auto_2167852 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167849 ?auto_2167851 ) ( IS-CRATE ?auto_2167847 ) ( not ( = ?auto_2167846 ?auto_2167847 ) ) ( not ( = ?auto_2167845 ?auto_2167846 ) ) ( not ( = ?auto_2167845 ?auto_2167847 ) ) ( not ( = ?auto_2167853 ?auto_2167851 ) ) ( HOIST-AT ?auto_2167850 ?auto_2167853 ) ( not ( = ?auto_2167849 ?auto_2167850 ) ) ( SURFACE-AT ?auto_2167847 ?auto_2167853 ) ( ON ?auto_2167847 ?auto_2167848 ) ( CLEAR ?auto_2167847 ) ( not ( = ?auto_2167846 ?auto_2167848 ) ) ( not ( = ?auto_2167847 ?auto_2167848 ) ) ( not ( = ?auto_2167845 ?auto_2167848 ) ) ( SURFACE-AT ?auto_2167845 ?auto_2167851 ) ( CLEAR ?auto_2167845 ) ( IS-CRATE ?auto_2167846 ) ( AVAILABLE ?auto_2167849 ) ( AVAILABLE ?auto_2167850 ) ( SURFACE-AT ?auto_2167846 ?auto_2167853 ) ( ON ?auto_2167846 ?auto_2167854 ) ( CLEAR ?auto_2167846 ) ( not ( = ?auto_2167846 ?auto_2167854 ) ) ( not ( = ?auto_2167847 ?auto_2167854 ) ) ( not ( = ?auto_2167845 ?auto_2167854 ) ) ( not ( = ?auto_2167848 ?auto_2167854 ) ) ( TRUCK-AT ?auto_2167852 ?auto_2167851 ) ( ON ?auto_2167845 ?auto_2167844 ) ( not ( = ?auto_2167844 ?auto_2167845 ) ) ( not ( = ?auto_2167844 ?auto_2167846 ) ) ( not ( = ?auto_2167844 ?auto_2167847 ) ) ( not ( = ?auto_2167844 ?auto_2167848 ) ) ( not ( = ?auto_2167844 ?auto_2167854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167845 ?auto_2167846 ?auto_2167847 )
      ( MAKE-3CRATE-VERIFY ?auto_2167844 ?auto_2167845 ?auto_2167846 ?auto_2167847 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2167855 - SURFACE
      ?auto_2167856 - SURFACE
      ?auto_2167857 - SURFACE
      ?auto_2167858 - SURFACE
      ?auto_2167859 - SURFACE
    )
    :vars
    (
      ?auto_2167861 - HOIST
      ?auto_2167863 - PLACE
      ?auto_2167865 - PLACE
      ?auto_2167862 - HOIST
      ?auto_2167860 - SURFACE
      ?auto_2167866 - SURFACE
      ?auto_2167864 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167861 ?auto_2167863 ) ( IS-CRATE ?auto_2167859 ) ( not ( = ?auto_2167858 ?auto_2167859 ) ) ( not ( = ?auto_2167857 ?auto_2167858 ) ) ( not ( = ?auto_2167857 ?auto_2167859 ) ) ( not ( = ?auto_2167865 ?auto_2167863 ) ) ( HOIST-AT ?auto_2167862 ?auto_2167865 ) ( not ( = ?auto_2167861 ?auto_2167862 ) ) ( SURFACE-AT ?auto_2167859 ?auto_2167865 ) ( ON ?auto_2167859 ?auto_2167860 ) ( CLEAR ?auto_2167859 ) ( not ( = ?auto_2167858 ?auto_2167860 ) ) ( not ( = ?auto_2167859 ?auto_2167860 ) ) ( not ( = ?auto_2167857 ?auto_2167860 ) ) ( SURFACE-AT ?auto_2167857 ?auto_2167863 ) ( CLEAR ?auto_2167857 ) ( IS-CRATE ?auto_2167858 ) ( AVAILABLE ?auto_2167861 ) ( AVAILABLE ?auto_2167862 ) ( SURFACE-AT ?auto_2167858 ?auto_2167865 ) ( ON ?auto_2167858 ?auto_2167866 ) ( CLEAR ?auto_2167858 ) ( not ( = ?auto_2167858 ?auto_2167866 ) ) ( not ( = ?auto_2167859 ?auto_2167866 ) ) ( not ( = ?auto_2167857 ?auto_2167866 ) ) ( not ( = ?auto_2167860 ?auto_2167866 ) ) ( TRUCK-AT ?auto_2167864 ?auto_2167863 ) ( ON ?auto_2167856 ?auto_2167855 ) ( ON ?auto_2167857 ?auto_2167856 ) ( not ( = ?auto_2167855 ?auto_2167856 ) ) ( not ( = ?auto_2167855 ?auto_2167857 ) ) ( not ( = ?auto_2167855 ?auto_2167858 ) ) ( not ( = ?auto_2167855 ?auto_2167859 ) ) ( not ( = ?auto_2167855 ?auto_2167860 ) ) ( not ( = ?auto_2167855 ?auto_2167866 ) ) ( not ( = ?auto_2167856 ?auto_2167857 ) ) ( not ( = ?auto_2167856 ?auto_2167858 ) ) ( not ( = ?auto_2167856 ?auto_2167859 ) ) ( not ( = ?auto_2167856 ?auto_2167860 ) ) ( not ( = ?auto_2167856 ?auto_2167866 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167857 ?auto_2167858 ?auto_2167859 )
      ( MAKE-4CRATE-VERIFY ?auto_2167855 ?auto_2167856 ?auto_2167857 ?auto_2167858 ?auto_2167859 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2167867 - SURFACE
      ?auto_2167868 - SURFACE
      ?auto_2167869 - SURFACE
      ?auto_2167870 - SURFACE
      ?auto_2167871 - SURFACE
      ?auto_2167872 - SURFACE
    )
    :vars
    (
      ?auto_2167874 - HOIST
      ?auto_2167876 - PLACE
      ?auto_2167878 - PLACE
      ?auto_2167875 - HOIST
      ?auto_2167873 - SURFACE
      ?auto_2167879 - SURFACE
      ?auto_2167877 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167874 ?auto_2167876 ) ( IS-CRATE ?auto_2167872 ) ( not ( = ?auto_2167871 ?auto_2167872 ) ) ( not ( = ?auto_2167870 ?auto_2167871 ) ) ( not ( = ?auto_2167870 ?auto_2167872 ) ) ( not ( = ?auto_2167878 ?auto_2167876 ) ) ( HOIST-AT ?auto_2167875 ?auto_2167878 ) ( not ( = ?auto_2167874 ?auto_2167875 ) ) ( SURFACE-AT ?auto_2167872 ?auto_2167878 ) ( ON ?auto_2167872 ?auto_2167873 ) ( CLEAR ?auto_2167872 ) ( not ( = ?auto_2167871 ?auto_2167873 ) ) ( not ( = ?auto_2167872 ?auto_2167873 ) ) ( not ( = ?auto_2167870 ?auto_2167873 ) ) ( SURFACE-AT ?auto_2167870 ?auto_2167876 ) ( CLEAR ?auto_2167870 ) ( IS-CRATE ?auto_2167871 ) ( AVAILABLE ?auto_2167874 ) ( AVAILABLE ?auto_2167875 ) ( SURFACE-AT ?auto_2167871 ?auto_2167878 ) ( ON ?auto_2167871 ?auto_2167879 ) ( CLEAR ?auto_2167871 ) ( not ( = ?auto_2167871 ?auto_2167879 ) ) ( not ( = ?auto_2167872 ?auto_2167879 ) ) ( not ( = ?auto_2167870 ?auto_2167879 ) ) ( not ( = ?auto_2167873 ?auto_2167879 ) ) ( TRUCK-AT ?auto_2167877 ?auto_2167876 ) ( ON ?auto_2167868 ?auto_2167867 ) ( ON ?auto_2167869 ?auto_2167868 ) ( ON ?auto_2167870 ?auto_2167869 ) ( not ( = ?auto_2167867 ?auto_2167868 ) ) ( not ( = ?auto_2167867 ?auto_2167869 ) ) ( not ( = ?auto_2167867 ?auto_2167870 ) ) ( not ( = ?auto_2167867 ?auto_2167871 ) ) ( not ( = ?auto_2167867 ?auto_2167872 ) ) ( not ( = ?auto_2167867 ?auto_2167873 ) ) ( not ( = ?auto_2167867 ?auto_2167879 ) ) ( not ( = ?auto_2167868 ?auto_2167869 ) ) ( not ( = ?auto_2167868 ?auto_2167870 ) ) ( not ( = ?auto_2167868 ?auto_2167871 ) ) ( not ( = ?auto_2167868 ?auto_2167872 ) ) ( not ( = ?auto_2167868 ?auto_2167873 ) ) ( not ( = ?auto_2167868 ?auto_2167879 ) ) ( not ( = ?auto_2167869 ?auto_2167870 ) ) ( not ( = ?auto_2167869 ?auto_2167871 ) ) ( not ( = ?auto_2167869 ?auto_2167872 ) ) ( not ( = ?auto_2167869 ?auto_2167873 ) ) ( not ( = ?auto_2167869 ?auto_2167879 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167870 ?auto_2167871 ?auto_2167872 )
      ( MAKE-5CRATE-VERIFY ?auto_2167867 ?auto_2167868 ?auto_2167869 ?auto_2167870 ?auto_2167871 ?auto_2167872 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2167880 - SURFACE
      ?auto_2167881 - SURFACE
      ?auto_2167882 - SURFACE
      ?auto_2167883 - SURFACE
      ?auto_2167884 - SURFACE
      ?auto_2167885 - SURFACE
      ?auto_2167886 - SURFACE
    )
    :vars
    (
      ?auto_2167888 - HOIST
      ?auto_2167890 - PLACE
      ?auto_2167892 - PLACE
      ?auto_2167889 - HOIST
      ?auto_2167887 - SURFACE
      ?auto_2167893 - SURFACE
      ?auto_2167891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167888 ?auto_2167890 ) ( IS-CRATE ?auto_2167886 ) ( not ( = ?auto_2167885 ?auto_2167886 ) ) ( not ( = ?auto_2167884 ?auto_2167885 ) ) ( not ( = ?auto_2167884 ?auto_2167886 ) ) ( not ( = ?auto_2167892 ?auto_2167890 ) ) ( HOIST-AT ?auto_2167889 ?auto_2167892 ) ( not ( = ?auto_2167888 ?auto_2167889 ) ) ( SURFACE-AT ?auto_2167886 ?auto_2167892 ) ( ON ?auto_2167886 ?auto_2167887 ) ( CLEAR ?auto_2167886 ) ( not ( = ?auto_2167885 ?auto_2167887 ) ) ( not ( = ?auto_2167886 ?auto_2167887 ) ) ( not ( = ?auto_2167884 ?auto_2167887 ) ) ( SURFACE-AT ?auto_2167884 ?auto_2167890 ) ( CLEAR ?auto_2167884 ) ( IS-CRATE ?auto_2167885 ) ( AVAILABLE ?auto_2167888 ) ( AVAILABLE ?auto_2167889 ) ( SURFACE-AT ?auto_2167885 ?auto_2167892 ) ( ON ?auto_2167885 ?auto_2167893 ) ( CLEAR ?auto_2167885 ) ( not ( = ?auto_2167885 ?auto_2167893 ) ) ( not ( = ?auto_2167886 ?auto_2167893 ) ) ( not ( = ?auto_2167884 ?auto_2167893 ) ) ( not ( = ?auto_2167887 ?auto_2167893 ) ) ( TRUCK-AT ?auto_2167891 ?auto_2167890 ) ( ON ?auto_2167881 ?auto_2167880 ) ( ON ?auto_2167882 ?auto_2167881 ) ( ON ?auto_2167883 ?auto_2167882 ) ( ON ?auto_2167884 ?auto_2167883 ) ( not ( = ?auto_2167880 ?auto_2167881 ) ) ( not ( = ?auto_2167880 ?auto_2167882 ) ) ( not ( = ?auto_2167880 ?auto_2167883 ) ) ( not ( = ?auto_2167880 ?auto_2167884 ) ) ( not ( = ?auto_2167880 ?auto_2167885 ) ) ( not ( = ?auto_2167880 ?auto_2167886 ) ) ( not ( = ?auto_2167880 ?auto_2167887 ) ) ( not ( = ?auto_2167880 ?auto_2167893 ) ) ( not ( = ?auto_2167881 ?auto_2167882 ) ) ( not ( = ?auto_2167881 ?auto_2167883 ) ) ( not ( = ?auto_2167881 ?auto_2167884 ) ) ( not ( = ?auto_2167881 ?auto_2167885 ) ) ( not ( = ?auto_2167881 ?auto_2167886 ) ) ( not ( = ?auto_2167881 ?auto_2167887 ) ) ( not ( = ?auto_2167881 ?auto_2167893 ) ) ( not ( = ?auto_2167882 ?auto_2167883 ) ) ( not ( = ?auto_2167882 ?auto_2167884 ) ) ( not ( = ?auto_2167882 ?auto_2167885 ) ) ( not ( = ?auto_2167882 ?auto_2167886 ) ) ( not ( = ?auto_2167882 ?auto_2167887 ) ) ( not ( = ?auto_2167882 ?auto_2167893 ) ) ( not ( = ?auto_2167883 ?auto_2167884 ) ) ( not ( = ?auto_2167883 ?auto_2167885 ) ) ( not ( = ?auto_2167883 ?auto_2167886 ) ) ( not ( = ?auto_2167883 ?auto_2167887 ) ) ( not ( = ?auto_2167883 ?auto_2167893 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167884 ?auto_2167885 ?auto_2167886 )
      ( MAKE-6CRATE-VERIFY ?auto_2167880 ?auto_2167881 ?auto_2167882 ?auto_2167883 ?auto_2167884 ?auto_2167885 ?auto_2167886 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2167894 - SURFACE
      ?auto_2167895 - SURFACE
      ?auto_2167896 - SURFACE
      ?auto_2167897 - SURFACE
      ?auto_2167898 - SURFACE
      ?auto_2167899 - SURFACE
      ?auto_2167900 - SURFACE
      ?auto_2167901 - SURFACE
    )
    :vars
    (
      ?auto_2167903 - HOIST
      ?auto_2167905 - PLACE
      ?auto_2167907 - PLACE
      ?auto_2167904 - HOIST
      ?auto_2167902 - SURFACE
      ?auto_2167908 - SURFACE
      ?auto_2167906 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167903 ?auto_2167905 ) ( IS-CRATE ?auto_2167901 ) ( not ( = ?auto_2167900 ?auto_2167901 ) ) ( not ( = ?auto_2167899 ?auto_2167900 ) ) ( not ( = ?auto_2167899 ?auto_2167901 ) ) ( not ( = ?auto_2167907 ?auto_2167905 ) ) ( HOIST-AT ?auto_2167904 ?auto_2167907 ) ( not ( = ?auto_2167903 ?auto_2167904 ) ) ( SURFACE-AT ?auto_2167901 ?auto_2167907 ) ( ON ?auto_2167901 ?auto_2167902 ) ( CLEAR ?auto_2167901 ) ( not ( = ?auto_2167900 ?auto_2167902 ) ) ( not ( = ?auto_2167901 ?auto_2167902 ) ) ( not ( = ?auto_2167899 ?auto_2167902 ) ) ( SURFACE-AT ?auto_2167899 ?auto_2167905 ) ( CLEAR ?auto_2167899 ) ( IS-CRATE ?auto_2167900 ) ( AVAILABLE ?auto_2167903 ) ( AVAILABLE ?auto_2167904 ) ( SURFACE-AT ?auto_2167900 ?auto_2167907 ) ( ON ?auto_2167900 ?auto_2167908 ) ( CLEAR ?auto_2167900 ) ( not ( = ?auto_2167900 ?auto_2167908 ) ) ( not ( = ?auto_2167901 ?auto_2167908 ) ) ( not ( = ?auto_2167899 ?auto_2167908 ) ) ( not ( = ?auto_2167902 ?auto_2167908 ) ) ( TRUCK-AT ?auto_2167906 ?auto_2167905 ) ( ON ?auto_2167895 ?auto_2167894 ) ( ON ?auto_2167896 ?auto_2167895 ) ( ON ?auto_2167897 ?auto_2167896 ) ( ON ?auto_2167898 ?auto_2167897 ) ( ON ?auto_2167899 ?auto_2167898 ) ( not ( = ?auto_2167894 ?auto_2167895 ) ) ( not ( = ?auto_2167894 ?auto_2167896 ) ) ( not ( = ?auto_2167894 ?auto_2167897 ) ) ( not ( = ?auto_2167894 ?auto_2167898 ) ) ( not ( = ?auto_2167894 ?auto_2167899 ) ) ( not ( = ?auto_2167894 ?auto_2167900 ) ) ( not ( = ?auto_2167894 ?auto_2167901 ) ) ( not ( = ?auto_2167894 ?auto_2167902 ) ) ( not ( = ?auto_2167894 ?auto_2167908 ) ) ( not ( = ?auto_2167895 ?auto_2167896 ) ) ( not ( = ?auto_2167895 ?auto_2167897 ) ) ( not ( = ?auto_2167895 ?auto_2167898 ) ) ( not ( = ?auto_2167895 ?auto_2167899 ) ) ( not ( = ?auto_2167895 ?auto_2167900 ) ) ( not ( = ?auto_2167895 ?auto_2167901 ) ) ( not ( = ?auto_2167895 ?auto_2167902 ) ) ( not ( = ?auto_2167895 ?auto_2167908 ) ) ( not ( = ?auto_2167896 ?auto_2167897 ) ) ( not ( = ?auto_2167896 ?auto_2167898 ) ) ( not ( = ?auto_2167896 ?auto_2167899 ) ) ( not ( = ?auto_2167896 ?auto_2167900 ) ) ( not ( = ?auto_2167896 ?auto_2167901 ) ) ( not ( = ?auto_2167896 ?auto_2167902 ) ) ( not ( = ?auto_2167896 ?auto_2167908 ) ) ( not ( = ?auto_2167897 ?auto_2167898 ) ) ( not ( = ?auto_2167897 ?auto_2167899 ) ) ( not ( = ?auto_2167897 ?auto_2167900 ) ) ( not ( = ?auto_2167897 ?auto_2167901 ) ) ( not ( = ?auto_2167897 ?auto_2167902 ) ) ( not ( = ?auto_2167897 ?auto_2167908 ) ) ( not ( = ?auto_2167898 ?auto_2167899 ) ) ( not ( = ?auto_2167898 ?auto_2167900 ) ) ( not ( = ?auto_2167898 ?auto_2167901 ) ) ( not ( = ?auto_2167898 ?auto_2167902 ) ) ( not ( = ?auto_2167898 ?auto_2167908 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167899 ?auto_2167900 ?auto_2167901 )
      ( MAKE-7CRATE-VERIFY ?auto_2167894 ?auto_2167895 ?auto_2167896 ?auto_2167897 ?auto_2167898 ?auto_2167899 ?auto_2167900 ?auto_2167901 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2167909 - SURFACE
      ?auto_2167910 - SURFACE
      ?auto_2167911 - SURFACE
      ?auto_2167912 - SURFACE
      ?auto_2167913 - SURFACE
      ?auto_2167914 - SURFACE
      ?auto_2167915 - SURFACE
      ?auto_2167916 - SURFACE
      ?auto_2167917 - SURFACE
    )
    :vars
    (
      ?auto_2167919 - HOIST
      ?auto_2167921 - PLACE
      ?auto_2167923 - PLACE
      ?auto_2167920 - HOIST
      ?auto_2167918 - SURFACE
      ?auto_2167924 - SURFACE
      ?auto_2167922 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167919 ?auto_2167921 ) ( IS-CRATE ?auto_2167917 ) ( not ( = ?auto_2167916 ?auto_2167917 ) ) ( not ( = ?auto_2167915 ?auto_2167916 ) ) ( not ( = ?auto_2167915 ?auto_2167917 ) ) ( not ( = ?auto_2167923 ?auto_2167921 ) ) ( HOIST-AT ?auto_2167920 ?auto_2167923 ) ( not ( = ?auto_2167919 ?auto_2167920 ) ) ( SURFACE-AT ?auto_2167917 ?auto_2167923 ) ( ON ?auto_2167917 ?auto_2167918 ) ( CLEAR ?auto_2167917 ) ( not ( = ?auto_2167916 ?auto_2167918 ) ) ( not ( = ?auto_2167917 ?auto_2167918 ) ) ( not ( = ?auto_2167915 ?auto_2167918 ) ) ( SURFACE-AT ?auto_2167915 ?auto_2167921 ) ( CLEAR ?auto_2167915 ) ( IS-CRATE ?auto_2167916 ) ( AVAILABLE ?auto_2167919 ) ( AVAILABLE ?auto_2167920 ) ( SURFACE-AT ?auto_2167916 ?auto_2167923 ) ( ON ?auto_2167916 ?auto_2167924 ) ( CLEAR ?auto_2167916 ) ( not ( = ?auto_2167916 ?auto_2167924 ) ) ( not ( = ?auto_2167917 ?auto_2167924 ) ) ( not ( = ?auto_2167915 ?auto_2167924 ) ) ( not ( = ?auto_2167918 ?auto_2167924 ) ) ( TRUCK-AT ?auto_2167922 ?auto_2167921 ) ( ON ?auto_2167910 ?auto_2167909 ) ( ON ?auto_2167911 ?auto_2167910 ) ( ON ?auto_2167912 ?auto_2167911 ) ( ON ?auto_2167913 ?auto_2167912 ) ( ON ?auto_2167914 ?auto_2167913 ) ( ON ?auto_2167915 ?auto_2167914 ) ( not ( = ?auto_2167909 ?auto_2167910 ) ) ( not ( = ?auto_2167909 ?auto_2167911 ) ) ( not ( = ?auto_2167909 ?auto_2167912 ) ) ( not ( = ?auto_2167909 ?auto_2167913 ) ) ( not ( = ?auto_2167909 ?auto_2167914 ) ) ( not ( = ?auto_2167909 ?auto_2167915 ) ) ( not ( = ?auto_2167909 ?auto_2167916 ) ) ( not ( = ?auto_2167909 ?auto_2167917 ) ) ( not ( = ?auto_2167909 ?auto_2167918 ) ) ( not ( = ?auto_2167909 ?auto_2167924 ) ) ( not ( = ?auto_2167910 ?auto_2167911 ) ) ( not ( = ?auto_2167910 ?auto_2167912 ) ) ( not ( = ?auto_2167910 ?auto_2167913 ) ) ( not ( = ?auto_2167910 ?auto_2167914 ) ) ( not ( = ?auto_2167910 ?auto_2167915 ) ) ( not ( = ?auto_2167910 ?auto_2167916 ) ) ( not ( = ?auto_2167910 ?auto_2167917 ) ) ( not ( = ?auto_2167910 ?auto_2167918 ) ) ( not ( = ?auto_2167910 ?auto_2167924 ) ) ( not ( = ?auto_2167911 ?auto_2167912 ) ) ( not ( = ?auto_2167911 ?auto_2167913 ) ) ( not ( = ?auto_2167911 ?auto_2167914 ) ) ( not ( = ?auto_2167911 ?auto_2167915 ) ) ( not ( = ?auto_2167911 ?auto_2167916 ) ) ( not ( = ?auto_2167911 ?auto_2167917 ) ) ( not ( = ?auto_2167911 ?auto_2167918 ) ) ( not ( = ?auto_2167911 ?auto_2167924 ) ) ( not ( = ?auto_2167912 ?auto_2167913 ) ) ( not ( = ?auto_2167912 ?auto_2167914 ) ) ( not ( = ?auto_2167912 ?auto_2167915 ) ) ( not ( = ?auto_2167912 ?auto_2167916 ) ) ( not ( = ?auto_2167912 ?auto_2167917 ) ) ( not ( = ?auto_2167912 ?auto_2167918 ) ) ( not ( = ?auto_2167912 ?auto_2167924 ) ) ( not ( = ?auto_2167913 ?auto_2167914 ) ) ( not ( = ?auto_2167913 ?auto_2167915 ) ) ( not ( = ?auto_2167913 ?auto_2167916 ) ) ( not ( = ?auto_2167913 ?auto_2167917 ) ) ( not ( = ?auto_2167913 ?auto_2167918 ) ) ( not ( = ?auto_2167913 ?auto_2167924 ) ) ( not ( = ?auto_2167914 ?auto_2167915 ) ) ( not ( = ?auto_2167914 ?auto_2167916 ) ) ( not ( = ?auto_2167914 ?auto_2167917 ) ) ( not ( = ?auto_2167914 ?auto_2167918 ) ) ( not ( = ?auto_2167914 ?auto_2167924 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167915 ?auto_2167916 ?auto_2167917 )
      ( MAKE-8CRATE-VERIFY ?auto_2167909 ?auto_2167910 ?auto_2167911 ?auto_2167912 ?auto_2167913 ?auto_2167914 ?auto_2167915 ?auto_2167916 ?auto_2167917 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2167925 - SURFACE
      ?auto_2167926 - SURFACE
      ?auto_2167927 - SURFACE
      ?auto_2167928 - SURFACE
      ?auto_2167929 - SURFACE
      ?auto_2167930 - SURFACE
      ?auto_2167931 - SURFACE
      ?auto_2167932 - SURFACE
      ?auto_2167933 - SURFACE
      ?auto_2167934 - SURFACE
    )
    :vars
    (
      ?auto_2167936 - HOIST
      ?auto_2167938 - PLACE
      ?auto_2167940 - PLACE
      ?auto_2167937 - HOIST
      ?auto_2167935 - SURFACE
      ?auto_2167941 - SURFACE
      ?auto_2167939 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167936 ?auto_2167938 ) ( IS-CRATE ?auto_2167934 ) ( not ( = ?auto_2167933 ?auto_2167934 ) ) ( not ( = ?auto_2167932 ?auto_2167933 ) ) ( not ( = ?auto_2167932 ?auto_2167934 ) ) ( not ( = ?auto_2167940 ?auto_2167938 ) ) ( HOIST-AT ?auto_2167937 ?auto_2167940 ) ( not ( = ?auto_2167936 ?auto_2167937 ) ) ( SURFACE-AT ?auto_2167934 ?auto_2167940 ) ( ON ?auto_2167934 ?auto_2167935 ) ( CLEAR ?auto_2167934 ) ( not ( = ?auto_2167933 ?auto_2167935 ) ) ( not ( = ?auto_2167934 ?auto_2167935 ) ) ( not ( = ?auto_2167932 ?auto_2167935 ) ) ( SURFACE-AT ?auto_2167932 ?auto_2167938 ) ( CLEAR ?auto_2167932 ) ( IS-CRATE ?auto_2167933 ) ( AVAILABLE ?auto_2167936 ) ( AVAILABLE ?auto_2167937 ) ( SURFACE-AT ?auto_2167933 ?auto_2167940 ) ( ON ?auto_2167933 ?auto_2167941 ) ( CLEAR ?auto_2167933 ) ( not ( = ?auto_2167933 ?auto_2167941 ) ) ( not ( = ?auto_2167934 ?auto_2167941 ) ) ( not ( = ?auto_2167932 ?auto_2167941 ) ) ( not ( = ?auto_2167935 ?auto_2167941 ) ) ( TRUCK-AT ?auto_2167939 ?auto_2167938 ) ( ON ?auto_2167926 ?auto_2167925 ) ( ON ?auto_2167927 ?auto_2167926 ) ( ON ?auto_2167928 ?auto_2167927 ) ( ON ?auto_2167929 ?auto_2167928 ) ( ON ?auto_2167930 ?auto_2167929 ) ( ON ?auto_2167931 ?auto_2167930 ) ( ON ?auto_2167932 ?auto_2167931 ) ( not ( = ?auto_2167925 ?auto_2167926 ) ) ( not ( = ?auto_2167925 ?auto_2167927 ) ) ( not ( = ?auto_2167925 ?auto_2167928 ) ) ( not ( = ?auto_2167925 ?auto_2167929 ) ) ( not ( = ?auto_2167925 ?auto_2167930 ) ) ( not ( = ?auto_2167925 ?auto_2167931 ) ) ( not ( = ?auto_2167925 ?auto_2167932 ) ) ( not ( = ?auto_2167925 ?auto_2167933 ) ) ( not ( = ?auto_2167925 ?auto_2167934 ) ) ( not ( = ?auto_2167925 ?auto_2167935 ) ) ( not ( = ?auto_2167925 ?auto_2167941 ) ) ( not ( = ?auto_2167926 ?auto_2167927 ) ) ( not ( = ?auto_2167926 ?auto_2167928 ) ) ( not ( = ?auto_2167926 ?auto_2167929 ) ) ( not ( = ?auto_2167926 ?auto_2167930 ) ) ( not ( = ?auto_2167926 ?auto_2167931 ) ) ( not ( = ?auto_2167926 ?auto_2167932 ) ) ( not ( = ?auto_2167926 ?auto_2167933 ) ) ( not ( = ?auto_2167926 ?auto_2167934 ) ) ( not ( = ?auto_2167926 ?auto_2167935 ) ) ( not ( = ?auto_2167926 ?auto_2167941 ) ) ( not ( = ?auto_2167927 ?auto_2167928 ) ) ( not ( = ?auto_2167927 ?auto_2167929 ) ) ( not ( = ?auto_2167927 ?auto_2167930 ) ) ( not ( = ?auto_2167927 ?auto_2167931 ) ) ( not ( = ?auto_2167927 ?auto_2167932 ) ) ( not ( = ?auto_2167927 ?auto_2167933 ) ) ( not ( = ?auto_2167927 ?auto_2167934 ) ) ( not ( = ?auto_2167927 ?auto_2167935 ) ) ( not ( = ?auto_2167927 ?auto_2167941 ) ) ( not ( = ?auto_2167928 ?auto_2167929 ) ) ( not ( = ?auto_2167928 ?auto_2167930 ) ) ( not ( = ?auto_2167928 ?auto_2167931 ) ) ( not ( = ?auto_2167928 ?auto_2167932 ) ) ( not ( = ?auto_2167928 ?auto_2167933 ) ) ( not ( = ?auto_2167928 ?auto_2167934 ) ) ( not ( = ?auto_2167928 ?auto_2167935 ) ) ( not ( = ?auto_2167928 ?auto_2167941 ) ) ( not ( = ?auto_2167929 ?auto_2167930 ) ) ( not ( = ?auto_2167929 ?auto_2167931 ) ) ( not ( = ?auto_2167929 ?auto_2167932 ) ) ( not ( = ?auto_2167929 ?auto_2167933 ) ) ( not ( = ?auto_2167929 ?auto_2167934 ) ) ( not ( = ?auto_2167929 ?auto_2167935 ) ) ( not ( = ?auto_2167929 ?auto_2167941 ) ) ( not ( = ?auto_2167930 ?auto_2167931 ) ) ( not ( = ?auto_2167930 ?auto_2167932 ) ) ( not ( = ?auto_2167930 ?auto_2167933 ) ) ( not ( = ?auto_2167930 ?auto_2167934 ) ) ( not ( = ?auto_2167930 ?auto_2167935 ) ) ( not ( = ?auto_2167930 ?auto_2167941 ) ) ( not ( = ?auto_2167931 ?auto_2167932 ) ) ( not ( = ?auto_2167931 ?auto_2167933 ) ) ( not ( = ?auto_2167931 ?auto_2167934 ) ) ( not ( = ?auto_2167931 ?auto_2167935 ) ) ( not ( = ?auto_2167931 ?auto_2167941 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167932 ?auto_2167933 ?auto_2167934 )
      ( MAKE-9CRATE-VERIFY ?auto_2167925 ?auto_2167926 ?auto_2167927 ?auto_2167928 ?auto_2167929 ?auto_2167930 ?auto_2167931 ?auto_2167932 ?auto_2167933 ?auto_2167934 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2167942 - SURFACE
      ?auto_2167943 - SURFACE
      ?auto_2167944 - SURFACE
      ?auto_2167945 - SURFACE
      ?auto_2167946 - SURFACE
      ?auto_2167947 - SURFACE
      ?auto_2167948 - SURFACE
      ?auto_2167949 - SURFACE
      ?auto_2167950 - SURFACE
      ?auto_2167951 - SURFACE
      ?auto_2167952 - SURFACE
    )
    :vars
    (
      ?auto_2167954 - HOIST
      ?auto_2167956 - PLACE
      ?auto_2167958 - PLACE
      ?auto_2167955 - HOIST
      ?auto_2167953 - SURFACE
      ?auto_2167959 - SURFACE
      ?auto_2167957 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167954 ?auto_2167956 ) ( IS-CRATE ?auto_2167952 ) ( not ( = ?auto_2167951 ?auto_2167952 ) ) ( not ( = ?auto_2167950 ?auto_2167951 ) ) ( not ( = ?auto_2167950 ?auto_2167952 ) ) ( not ( = ?auto_2167958 ?auto_2167956 ) ) ( HOIST-AT ?auto_2167955 ?auto_2167958 ) ( not ( = ?auto_2167954 ?auto_2167955 ) ) ( SURFACE-AT ?auto_2167952 ?auto_2167958 ) ( ON ?auto_2167952 ?auto_2167953 ) ( CLEAR ?auto_2167952 ) ( not ( = ?auto_2167951 ?auto_2167953 ) ) ( not ( = ?auto_2167952 ?auto_2167953 ) ) ( not ( = ?auto_2167950 ?auto_2167953 ) ) ( SURFACE-AT ?auto_2167950 ?auto_2167956 ) ( CLEAR ?auto_2167950 ) ( IS-CRATE ?auto_2167951 ) ( AVAILABLE ?auto_2167954 ) ( AVAILABLE ?auto_2167955 ) ( SURFACE-AT ?auto_2167951 ?auto_2167958 ) ( ON ?auto_2167951 ?auto_2167959 ) ( CLEAR ?auto_2167951 ) ( not ( = ?auto_2167951 ?auto_2167959 ) ) ( not ( = ?auto_2167952 ?auto_2167959 ) ) ( not ( = ?auto_2167950 ?auto_2167959 ) ) ( not ( = ?auto_2167953 ?auto_2167959 ) ) ( TRUCK-AT ?auto_2167957 ?auto_2167956 ) ( ON ?auto_2167943 ?auto_2167942 ) ( ON ?auto_2167944 ?auto_2167943 ) ( ON ?auto_2167945 ?auto_2167944 ) ( ON ?auto_2167946 ?auto_2167945 ) ( ON ?auto_2167947 ?auto_2167946 ) ( ON ?auto_2167948 ?auto_2167947 ) ( ON ?auto_2167949 ?auto_2167948 ) ( ON ?auto_2167950 ?auto_2167949 ) ( not ( = ?auto_2167942 ?auto_2167943 ) ) ( not ( = ?auto_2167942 ?auto_2167944 ) ) ( not ( = ?auto_2167942 ?auto_2167945 ) ) ( not ( = ?auto_2167942 ?auto_2167946 ) ) ( not ( = ?auto_2167942 ?auto_2167947 ) ) ( not ( = ?auto_2167942 ?auto_2167948 ) ) ( not ( = ?auto_2167942 ?auto_2167949 ) ) ( not ( = ?auto_2167942 ?auto_2167950 ) ) ( not ( = ?auto_2167942 ?auto_2167951 ) ) ( not ( = ?auto_2167942 ?auto_2167952 ) ) ( not ( = ?auto_2167942 ?auto_2167953 ) ) ( not ( = ?auto_2167942 ?auto_2167959 ) ) ( not ( = ?auto_2167943 ?auto_2167944 ) ) ( not ( = ?auto_2167943 ?auto_2167945 ) ) ( not ( = ?auto_2167943 ?auto_2167946 ) ) ( not ( = ?auto_2167943 ?auto_2167947 ) ) ( not ( = ?auto_2167943 ?auto_2167948 ) ) ( not ( = ?auto_2167943 ?auto_2167949 ) ) ( not ( = ?auto_2167943 ?auto_2167950 ) ) ( not ( = ?auto_2167943 ?auto_2167951 ) ) ( not ( = ?auto_2167943 ?auto_2167952 ) ) ( not ( = ?auto_2167943 ?auto_2167953 ) ) ( not ( = ?auto_2167943 ?auto_2167959 ) ) ( not ( = ?auto_2167944 ?auto_2167945 ) ) ( not ( = ?auto_2167944 ?auto_2167946 ) ) ( not ( = ?auto_2167944 ?auto_2167947 ) ) ( not ( = ?auto_2167944 ?auto_2167948 ) ) ( not ( = ?auto_2167944 ?auto_2167949 ) ) ( not ( = ?auto_2167944 ?auto_2167950 ) ) ( not ( = ?auto_2167944 ?auto_2167951 ) ) ( not ( = ?auto_2167944 ?auto_2167952 ) ) ( not ( = ?auto_2167944 ?auto_2167953 ) ) ( not ( = ?auto_2167944 ?auto_2167959 ) ) ( not ( = ?auto_2167945 ?auto_2167946 ) ) ( not ( = ?auto_2167945 ?auto_2167947 ) ) ( not ( = ?auto_2167945 ?auto_2167948 ) ) ( not ( = ?auto_2167945 ?auto_2167949 ) ) ( not ( = ?auto_2167945 ?auto_2167950 ) ) ( not ( = ?auto_2167945 ?auto_2167951 ) ) ( not ( = ?auto_2167945 ?auto_2167952 ) ) ( not ( = ?auto_2167945 ?auto_2167953 ) ) ( not ( = ?auto_2167945 ?auto_2167959 ) ) ( not ( = ?auto_2167946 ?auto_2167947 ) ) ( not ( = ?auto_2167946 ?auto_2167948 ) ) ( not ( = ?auto_2167946 ?auto_2167949 ) ) ( not ( = ?auto_2167946 ?auto_2167950 ) ) ( not ( = ?auto_2167946 ?auto_2167951 ) ) ( not ( = ?auto_2167946 ?auto_2167952 ) ) ( not ( = ?auto_2167946 ?auto_2167953 ) ) ( not ( = ?auto_2167946 ?auto_2167959 ) ) ( not ( = ?auto_2167947 ?auto_2167948 ) ) ( not ( = ?auto_2167947 ?auto_2167949 ) ) ( not ( = ?auto_2167947 ?auto_2167950 ) ) ( not ( = ?auto_2167947 ?auto_2167951 ) ) ( not ( = ?auto_2167947 ?auto_2167952 ) ) ( not ( = ?auto_2167947 ?auto_2167953 ) ) ( not ( = ?auto_2167947 ?auto_2167959 ) ) ( not ( = ?auto_2167948 ?auto_2167949 ) ) ( not ( = ?auto_2167948 ?auto_2167950 ) ) ( not ( = ?auto_2167948 ?auto_2167951 ) ) ( not ( = ?auto_2167948 ?auto_2167952 ) ) ( not ( = ?auto_2167948 ?auto_2167953 ) ) ( not ( = ?auto_2167948 ?auto_2167959 ) ) ( not ( = ?auto_2167949 ?auto_2167950 ) ) ( not ( = ?auto_2167949 ?auto_2167951 ) ) ( not ( = ?auto_2167949 ?auto_2167952 ) ) ( not ( = ?auto_2167949 ?auto_2167953 ) ) ( not ( = ?auto_2167949 ?auto_2167959 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167950 ?auto_2167951 ?auto_2167952 )
      ( MAKE-10CRATE-VERIFY ?auto_2167942 ?auto_2167943 ?auto_2167944 ?auto_2167945 ?auto_2167946 ?auto_2167947 ?auto_2167948 ?auto_2167949 ?auto_2167950 ?auto_2167951 ?auto_2167952 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2167960 - SURFACE
      ?auto_2167961 - SURFACE
      ?auto_2167962 - SURFACE
      ?auto_2167963 - SURFACE
      ?auto_2167964 - SURFACE
      ?auto_2167965 - SURFACE
      ?auto_2167966 - SURFACE
      ?auto_2167967 - SURFACE
      ?auto_2167968 - SURFACE
      ?auto_2167969 - SURFACE
      ?auto_2167970 - SURFACE
      ?auto_2167971 - SURFACE
    )
    :vars
    (
      ?auto_2167973 - HOIST
      ?auto_2167975 - PLACE
      ?auto_2167977 - PLACE
      ?auto_2167974 - HOIST
      ?auto_2167972 - SURFACE
      ?auto_2167978 - SURFACE
      ?auto_2167976 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167973 ?auto_2167975 ) ( IS-CRATE ?auto_2167971 ) ( not ( = ?auto_2167970 ?auto_2167971 ) ) ( not ( = ?auto_2167969 ?auto_2167970 ) ) ( not ( = ?auto_2167969 ?auto_2167971 ) ) ( not ( = ?auto_2167977 ?auto_2167975 ) ) ( HOIST-AT ?auto_2167974 ?auto_2167977 ) ( not ( = ?auto_2167973 ?auto_2167974 ) ) ( SURFACE-AT ?auto_2167971 ?auto_2167977 ) ( ON ?auto_2167971 ?auto_2167972 ) ( CLEAR ?auto_2167971 ) ( not ( = ?auto_2167970 ?auto_2167972 ) ) ( not ( = ?auto_2167971 ?auto_2167972 ) ) ( not ( = ?auto_2167969 ?auto_2167972 ) ) ( SURFACE-AT ?auto_2167969 ?auto_2167975 ) ( CLEAR ?auto_2167969 ) ( IS-CRATE ?auto_2167970 ) ( AVAILABLE ?auto_2167973 ) ( AVAILABLE ?auto_2167974 ) ( SURFACE-AT ?auto_2167970 ?auto_2167977 ) ( ON ?auto_2167970 ?auto_2167978 ) ( CLEAR ?auto_2167970 ) ( not ( = ?auto_2167970 ?auto_2167978 ) ) ( not ( = ?auto_2167971 ?auto_2167978 ) ) ( not ( = ?auto_2167969 ?auto_2167978 ) ) ( not ( = ?auto_2167972 ?auto_2167978 ) ) ( TRUCK-AT ?auto_2167976 ?auto_2167975 ) ( ON ?auto_2167961 ?auto_2167960 ) ( ON ?auto_2167962 ?auto_2167961 ) ( ON ?auto_2167963 ?auto_2167962 ) ( ON ?auto_2167964 ?auto_2167963 ) ( ON ?auto_2167965 ?auto_2167964 ) ( ON ?auto_2167966 ?auto_2167965 ) ( ON ?auto_2167967 ?auto_2167966 ) ( ON ?auto_2167968 ?auto_2167967 ) ( ON ?auto_2167969 ?auto_2167968 ) ( not ( = ?auto_2167960 ?auto_2167961 ) ) ( not ( = ?auto_2167960 ?auto_2167962 ) ) ( not ( = ?auto_2167960 ?auto_2167963 ) ) ( not ( = ?auto_2167960 ?auto_2167964 ) ) ( not ( = ?auto_2167960 ?auto_2167965 ) ) ( not ( = ?auto_2167960 ?auto_2167966 ) ) ( not ( = ?auto_2167960 ?auto_2167967 ) ) ( not ( = ?auto_2167960 ?auto_2167968 ) ) ( not ( = ?auto_2167960 ?auto_2167969 ) ) ( not ( = ?auto_2167960 ?auto_2167970 ) ) ( not ( = ?auto_2167960 ?auto_2167971 ) ) ( not ( = ?auto_2167960 ?auto_2167972 ) ) ( not ( = ?auto_2167960 ?auto_2167978 ) ) ( not ( = ?auto_2167961 ?auto_2167962 ) ) ( not ( = ?auto_2167961 ?auto_2167963 ) ) ( not ( = ?auto_2167961 ?auto_2167964 ) ) ( not ( = ?auto_2167961 ?auto_2167965 ) ) ( not ( = ?auto_2167961 ?auto_2167966 ) ) ( not ( = ?auto_2167961 ?auto_2167967 ) ) ( not ( = ?auto_2167961 ?auto_2167968 ) ) ( not ( = ?auto_2167961 ?auto_2167969 ) ) ( not ( = ?auto_2167961 ?auto_2167970 ) ) ( not ( = ?auto_2167961 ?auto_2167971 ) ) ( not ( = ?auto_2167961 ?auto_2167972 ) ) ( not ( = ?auto_2167961 ?auto_2167978 ) ) ( not ( = ?auto_2167962 ?auto_2167963 ) ) ( not ( = ?auto_2167962 ?auto_2167964 ) ) ( not ( = ?auto_2167962 ?auto_2167965 ) ) ( not ( = ?auto_2167962 ?auto_2167966 ) ) ( not ( = ?auto_2167962 ?auto_2167967 ) ) ( not ( = ?auto_2167962 ?auto_2167968 ) ) ( not ( = ?auto_2167962 ?auto_2167969 ) ) ( not ( = ?auto_2167962 ?auto_2167970 ) ) ( not ( = ?auto_2167962 ?auto_2167971 ) ) ( not ( = ?auto_2167962 ?auto_2167972 ) ) ( not ( = ?auto_2167962 ?auto_2167978 ) ) ( not ( = ?auto_2167963 ?auto_2167964 ) ) ( not ( = ?auto_2167963 ?auto_2167965 ) ) ( not ( = ?auto_2167963 ?auto_2167966 ) ) ( not ( = ?auto_2167963 ?auto_2167967 ) ) ( not ( = ?auto_2167963 ?auto_2167968 ) ) ( not ( = ?auto_2167963 ?auto_2167969 ) ) ( not ( = ?auto_2167963 ?auto_2167970 ) ) ( not ( = ?auto_2167963 ?auto_2167971 ) ) ( not ( = ?auto_2167963 ?auto_2167972 ) ) ( not ( = ?auto_2167963 ?auto_2167978 ) ) ( not ( = ?auto_2167964 ?auto_2167965 ) ) ( not ( = ?auto_2167964 ?auto_2167966 ) ) ( not ( = ?auto_2167964 ?auto_2167967 ) ) ( not ( = ?auto_2167964 ?auto_2167968 ) ) ( not ( = ?auto_2167964 ?auto_2167969 ) ) ( not ( = ?auto_2167964 ?auto_2167970 ) ) ( not ( = ?auto_2167964 ?auto_2167971 ) ) ( not ( = ?auto_2167964 ?auto_2167972 ) ) ( not ( = ?auto_2167964 ?auto_2167978 ) ) ( not ( = ?auto_2167965 ?auto_2167966 ) ) ( not ( = ?auto_2167965 ?auto_2167967 ) ) ( not ( = ?auto_2167965 ?auto_2167968 ) ) ( not ( = ?auto_2167965 ?auto_2167969 ) ) ( not ( = ?auto_2167965 ?auto_2167970 ) ) ( not ( = ?auto_2167965 ?auto_2167971 ) ) ( not ( = ?auto_2167965 ?auto_2167972 ) ) ( not ( = ?auto_2167965 ?auto_2167978 ) ) ( not ( = ?auto_2167966 ?auto_2167967 ) ) ( not ( = ?auto_2167966 ?auto_2167968 ) ) ( not ( = ?auto_2167966 ?auto_2167969 ) ) ( not ( = ?auto_2167966 ?auto_2167970 ) ) ( not ( = ?auto_2167966 ?auto_2167971 ) ) ( not ( = ?auto_2167966 ?auto_2167972 ) ) ( not ( = ?auto_2167966 ?auto_2167978 ) ) ( not ( = ?auto_2167967 ?auto_2167968 ) ) ( not ( = ?auto_2167967 ?auto_2167969 ) ) ( not ( = ?auto_2167967 ?auto_2167970 ) ) ( not ( = ?auto_2167967 ?auto_2167971 ) ) ( not ( = ?auto_2167967 ?auto_2167972 ) ) ( not ( = ?auto_2167967 ?auto_2167978 ) ) ( not ( = ?auto_2167968 ?auto_2167969 ) ) ( not ( = ?auto_2167968 ?auto_2167970 ) ) ( not ( = ?auto_2167968 ?auto_2167971 ) ) ( not ( = ?auto_2167968 ?auto_2167972 ) ) ( not ( = ?auto_2167968 ?auto_2167978 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167969 ?auto_2167970 ?auto_2167971 )
      ( MAKE-11CRATE-VERIFY ?auto_2167960 ?auto_2167961 ?auto_2167962 ?auto_2167963 ?auto_2167964 ?auto_2167965 ?auto_2167966 ?auto_2167967 ?auto_2167968 ?auto_2167969 ?auto_2167970 ?auto_2167971 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2167979 - SURFACE
      ?auto_2167980 - SURFACE
      ?auto_2167981 - SURFACE
      ?auto_2167982 - SURFACE
      ?auto_2167983 - SURFACE
      ?auto_2167984 - SURFACE
      ?auto_2167985 - SURFACE
      ?auto_2167986 - SURFACE
      ?auto_2167987 - SURFACE
      ?auto_2167988 - SURFACE
      ?auto_2167989 - SURFACE
      ?auto_2167990 - SURFACE
      ?auto_2167991 - SURFACE
    )
    :vars
    (
      ?auto_2167993 - HOIST
      ?auto_2167995 - PLACE
      ?auto_2167997 - PLACE
      ?auto_2167994 - HOIST
      ?auto_2167992 - SURFACE
      ?auto_2167998 - SURFACE
      ?auto_2167996 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2167993 ?auto_2167995 ) ( IS-CRATE ?auto_2167991 ) ( not ( = ?auto_2167990 ?auto_2167991 ) ) ( not ( = ?auto_2167989 ?auto_2167990 ) ) ( not ( = ?auto_2167989 ?auto_2167991 ) ) ( not ( = ?auto_2167997 ?auto_2167995 ) ) ( HOIST-AT ?auto_2167994 ?auto_2167997 ) ( not ( = ?auto_2167993 ?auto_2167994 ) ) ( SURFACE-AT ?auto_2167991 ?auto_2167997 ) ( ON ?auto_2167991 ?auto_2167992 ) ( CLEAR ?auto_2167991 ) ( not ( = ?auto_2167990 ?auto_2167992 ) ) ( not ( = ?auto_2167991 ?auto_2167992 ) ) ( not ( = ?auto_2167989 ?auto_2167992 ) ) ( SURFACE-AT ?auto_2167989 ?auto_2167995 ) ( CLEAR ?auto_2167989 ) ( IS-CRATE ?auto_2167990 ) ( AVAILABLE ?auto_2167993 ) ( AVAILABLE ?auto_2167994 ) ( SURFACE-AT ?auto_2167990 ?auto_2167997 ) ( ON ?auto_2167990 ?auto_2167998 ) ( CLEAR ?auto_2167990 ) ( not ( = ?auto_2167990 ?auto_2167998 ) ) ( not ( = ?auto_2167991 ?auto_2167998 ) ) ( not ( = ?auto_2167989 ?auto_2167998 ) ) ( not ( = ?auto_2167992 ?auto_2167998 ) ) ( TRUCK-AT ?auto_2167996 ?auto_2167995 ) ( ON ?auto_2167980 ?auto_2167979 ) ( ON ?auto_2167981 ?auto_2167980 ) ( ON ?auto_2167982 ?auto_2167981 ) ( ON ?auto_2167983 ?auto_2167982 ) ( ON ?auto_2167984 ?auto_2167983 ) ( ON ?auto_2167985 ?auto_2167984 ) ( ON ?auto_2167986 ?auto_2167985 ) ( ON ?auto_2167987 ?auto_2167986 ) ( ON ?auto_2167988 ?auto_2167987 ) ( ON ?auto_2167989 ?auto_2167988 ) ( not ( = ?auto_2167979 ?auto_2167980 ) ) ( not ( = ?auto_2167979 ?auto_2167981 ) ) ( not ( = ?auto_2167979 ?auto_2167982 ) ) ( not ( = ?auto_2167979 ?auto_2167983 ) ) ( not ( = ?auto_2167979 ?auto_2167984 ) ) ( not ( = ?auto_2167979 ?auto_2167985 ) ) ( not ( = ?auto_2167979 ?auto_2167986 ) ) ( not ( = ?auto_2167979 ?auto_2167987 ) ) ( not ( = ?auto_2167979 ?auto_2167988 ) ) ( not ( = ?auto_2167979 ?auto_2167989 ) ) ( not ( = ?auto_2167979 ?auto_2167990 ) ) ( not ( = ?auto_2167979 ?auto_2167991 ) ) ( not ( = ?auto_2167979 ?auto_2167992 ) ) ( not ( = ?auto_2167979 ?auto_2167998 ) ) ( not ( = ?auto_2167980 ?auto_2167981 ) ) ( not ( = ?auto_2167980 ?auto_2167982 ) ) ( not ( = ?auto_2167980 ?auto_2167983 ) ) ( not ( = ?auto_2167980 ?auto_2167984 ) ) ( not ( = ?auto_2167980 ?auto_2167985 ) ) ( not ( = ?auto_2167980 ?auto_2167986 ) ) ( not ( = ?auto_2167980 ?auto_2167987 ) ) ( not ( = ?auto_2167980 ?auto_2167988 ) ) ( not ( = ?auto_2167980 ?auto_2167989 ) ) ( not ( = ?auto_2167980 ?auto_2167990 ) ) ( not ( = ?auto_2167980 ?auto_2167991 ) ) ( not ( = ?auto_2167980 ?auto_2167992 ) ) ( not ( = ?auto_2167980 ?auto_2167998 ) ) ( not ( = ?auto_2167981 ?auto_2167982 ) ) ( not ( = ?auto_2167981 ?auto_2167983 ) ) ( not ( = ?auto_2167981 ?auto_2167984 ) ) ( not ( = ?auto_2167981 ?auto_2167985 ) ) ( not ( = ?auto_2167981 ?auto_2167986 ) ) ( not ( = ?auto_2167981 ?auto_2167987 ) ) ( not ( = ?auto_2167981 ?auto_2167988 ) ) ( not ( = ?auto_2167981 ?auto_2167989 ) ) ( not ( = ?auto_2167981 ?auto_2167990 ) ) ( not ( = ?auto_2167981 ?auto_2167991 ) ) ( not ( = ?auto_2167981 ?auto_2167992 ) ) ( not ( = ?auto_2167981 ?auto_2167998 ) ) ( not ( = ?auto_2167982 ?auto_2167983 ) ) ( not ( = ?auto_2167982 ?auto_2167984 ) ) ( not ( = ?auto_2167982 ?auto_2167985 ) ) ( not ( = ?auto_2167982 ?auto_2167986 ) ) ( not ( = ?auto_2167982 ?auto_2167987 ) ) ( not ( = ?auto_2167982 ?auto_2167988 ) ) ( not ( = ?auto_2167982 ?auto_2167989 ) ) ( not ( = ?auto_2167982 ?auto_2167990 ) ) ( not ( = ?auto_2167982 ?auto_2167991 ) ) ( not ( = ?auto_2167982 ?auto_2167992 ) ) ( not ( = ?auto_2167982 ?auto_2167998 ) ) ( not ( = ?auto_2167983 ?auto_2167984 ) ) ( not ( = ?auto_2167983 ?auto_2167985 ) ) ( not ( = ?auto_2167983 ?auto_2167986 ) ) ( not ( = ?auto_2167983 ?auto_2167987 ) ) ( not ( = ?auto_2167983 ?auto_2167988 ) ) ( not ( = ?auto_2167983 ?auto_2167989 ) ) ( not ( = ?auto_2167983 ?auto_2167990 ) ) ( not ( = ?auto_2167983 ?auto_2167991 ) ) ( not ( = ?auto_2167983 ?auto_2167992 ) ) ( not ( = ?auto_2167983 ?auto_2167998 ) ) ( not ( = ?auto_2167984 ?auto_2167985 ) ) ( not ( = ?auto_2167984 ?auto_2167986 ) ) ( not ( = ?auto_2167984 ?auto_2167987 ) ) ( not ( = ?auto_2167984 ?auto_2167988 ) ) ( not ( = ?auto_2167984 ?auto_2167989 ) ) ( not ( = ?auto_2167984 ?auto_2167990 ) ) ( not ( = ?auto_2167984 ?auto_2167991 ) ) ( not ( = ?auto_2167984 ?auto_2167992 ) ) ( not ( = ?auto_2167984 ?auto_2167998 ) ) ( not ( = ?auto_2167985 ?auto_2167986 ) ) ( not ( = ?auto_2167985 ?auto_2167987 ) ) ( not ( = ?auto_2167985 ?auto_2167988 ) ) ( not ( = ?auto_2167985 ?auto_2167989 ) ) ( not ( = ?auto_2167985 ?auto_2167990 ) ) ( not ( = ?auto_2167985 ?auto_2167991 ) ) ( not ( = ?auto_2167985 ?auto_2167992 ) ) ( not ( = ?auto_2167985 ?auto_2167998 ) ) ( not ( = ?auto_2167986 ?auto_2167987 ) ) ( not ( = ?auto_2167986 ?auto_2167988 ) ) ( not ( = ?auto_2167986 ?auto_2167989 ) ) ( not ( = ?auto_2167986 ?auto_2167990 ) ) ( not ( = ?auto_2167986 ?auto_2167991 ) ) ( not ( = ?auto_2167986 ?auto_2167992 ) ) ( not ( = ?auto_2167986 ?auto_2167998 ) ) ( not ( = ?auto_2167987 ?auto_2167988 ) ) ( not ( = ?auto_2167987 ?auto_2167989 ) ) ( not ( = ?auto_2167987 ?auto_2167990 ) ) ( not ( = ?auto_2167987 ?auto_2167991 ) ) ( not ( = ?auto_2167987 ?auto_2167992 ) ) ( not ( = ?auto_2167987 ?auto_2167998 ) ) ( not ( = ?auto_2167988 ?auto_2167989 ) ) ( not ( = ?auto_2167988 ?auto_2167990 ) ) ( not ( = ?auto_2167988 ?auto_2167991 ) ) ( not ( = ?auto_2167988 ?auto_2167992 ) ) ( not ( = ?auto_2167988 ?auto_2167998 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2167989 ?auto_2167990 ?auto_2167991 )
      ( MAKE-12CRATE-VERIFY ?auto_2167979 ?auto_2167980 ?auto_2167981 ?auto_2167982 ?auto_2167983 ?auto_2167984 ?auto_2167985 ?auto_2167986 ?auto_2167987 ?auto_2167988 ?auto_2167989 ?auto_2167990 ?auto_2167991 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2167999 - SURFACE
      ?auto_2168000 - SURFACE
    )
    :vars
    (
      ?auto_2168002 - HOIST
      ?auto_2168004 - PLACE
      ?auto_2168005 - SURFACE
      ?auto_2168007 - PLACE
      ?auto_2168003 - HOIST
      ?auto_2168001 - SURFACE
      ?auto_2168008 - SURFACE
      ?auto_2168006 - TRUCK
      ?auto_2168009 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168002 ?auto_2168004 ) ( IS-CRATE ?auto_2168000 ) ( not ( = ?auto_2167999 ?auto_2168000 ) ) ( not ( = ?auto_2168005 ?auto_2167999 ) ) ( not ( = ?auto_2168005 ?auto_2168000 ) ) ( not ( = ?auto_2168007 ?auto_2168004 ) ) ( HOIST-AT ?auto_2168003 ?auto_2168007 ) ( not ( = ?auto_2168002 ?auto_2168003 ) ) ( SURFACE-AT ?auto_2168000 ?auto_2168007 ) ( ON ?auto_2168000 ?auto_2168001 ) ( CLEAR ?auto_2168000 ) ( not ( = ?auto_2167999 ?auto_2168001 ) ) ( not ( = ?auto_2168000 ?auto_2168001 ) ) ( not ( = ?auto_2168005 ?auto_2168001 ) ) ( IS-CRATE ?auto_2167999 ) ( AVAILABLE ?auto_2168003 ) ( SURFACE-AT ?auto_2167999 ?auto_2168007 ) ( ON ?auto_2167999 ?auto_2168008 ) ( CLEAR ?auto_2167999 ) ( not ( = ?auto_2167999 ?auto_2168008 ) ) ( not ( = ?auto_2168000 ?auto_2168008 ) ) ( not ( = ?auto_2168005 ?auto_2168008 ) ) ( not ( = ?auto_2168001 ?auto_2168008 ) ) ( TRUCK-AT ?auto_2168006 ?auto_2168004 ) ( SURFACE-AT ?auto_2168009 ?auto_2168004 ) ( CLEAR ?auto_2168009 ) ( LIFTING ?auto_2168002 ?auto_2168005 ) ( IS-CRATE ?auto_2168005 ) ( not ( = ?auto_2168009 ?auto_2168005 ) ) ( not ( = ?auto_2167999 ?auto_2168009 ) ) ( not ( = ?auto_2168000 ?auto_2168009 ) ) ( not ( = ?auto_2168001 ?auto_2168009 ) ) ( not ( = ?auto_2168008 ?auto_2168009 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2168009 ?auto_2168005 )
      ( MAKE-2CRATE ?auto_2168005 ?auto_2167999 ?auto_2168000 )
      ( MAKE-1CRATE-VERIFY ?auto_2167999 ?auto_2168000 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2168010 - SURFACE
      ?auto_2168011 - SURFACE
      ?auto_2168012 - SURFACE
    )
    :vars
    (
      ?auto_2168013 - HOIST
      ?auto_2168015 - PLACE
      ?auto_2168017 - PLACE
      ?auto_2168014 - HOIST
      ?auto_2168018 - SURFACE
      ?auto_2168020 - SURFACE
      ?auto_2168019 - TRUCK
      ?auto_2168016 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168013 ?auto_2168015 ) ( IS-CRATE ?auto_2168012 ) ( not ( = ?auto_2168011 ?auto_2168012 ) ) ( not ( = ?auto_2168010 ?auto_2168011 ) ) ( not ( = ?auto_2168010 ?auto_2168012 ) ) ( not ( = ?auto_2168017 ?auto_2168015 ) ) ( HOIST-AT ?auto_2168014 ?auto_2168017 ) ( not ( = ?auto_2168013 ?auto_2168014 ) ) ( SURFACE-AT ?auto_2168012 ?auto_2168017 ) ( ON ?auto_2168012 ?auto_2168018 ) ( CLEAR ?auto_2168012 ) ( not ( = ?auto_2168011 ?auto_2168018 ) ) ( not ( = ?auto_2168012 ?auto_2168018 ) ) ( not ( = ?auto_2168010 ?auto_2168018 ) ) ( IS-CRATE ?auto_2168011 ) ( AVAILABLE ?auto_2168014 ) ( SURFACE-AT ?auto_2168011 ?auto_2168017 ) ( ON ?auto_2168011 ?auto_2168020 ) ( CLEAR ?auto_2168011 ) ( not ( = ?auto_2168011 ?auto_2168020 ) ) ( not ( = ?auto_2168012 ?auto_2168020 ) ) ( not ( = ?auto_2168010 ?auto_2168020 ) ) ( not ( = ?auto_2168018 ?auto_2168020 ) ) ( TRUCK-AT ?auto_2168019 ?auto_2168015 ) ( SURFACE-AT ?auto_2168016 ?auto_2168015 ) ( CLEAR ?auto_2168016 ) ( LIFTING ?auto_2168013 ?auto_2168010 ) ( IS-CRATE ?auto_2168010 ) ( not ( = ?auto_2168016 ?auto_2168010 ) ) ( not ( = ?auto_2168011 ?auto_2168016 ) ) ( not ( = ?auto_2168012 ?auto_2168016 ) ) ( not ( = ?auto_2168018 ?auto_2168016 ) ) ( not ( = ?auto_2168020 ?auto_2168016 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2168011 ?auto_2168012 )
      ( MAKE-2CRATE-VERIFY ?auto_2168010 ?auto_2168011 ?auto_2168012 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_2168021 - SURFACE
      ?auto_2168022 - SURFACE
      ?auto_2168023 - SURFACE
      ?auto_2168024 - SURFACE
    )
    :vars
    (
      ?auto_2168031 - HOIST
      ?auto_2168028 - PLACE
      ?auto_2168029 - PLACE
      ?auto_2168025 - HOIST
      ?auto_2168030 - SURFACE
      ?auto_2168027 - SURFACE
      ?auto_2168026 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168031 ?auto_2168028 ) ( IS-CRATE ?auto_2168024 ) ( not ( = ?auto_2168023 ?auto_2168024 ) ) ( not ( = ?auto_2168022 ?auto_2168023 ) ) ( not ( = ?auto_2168022 ?auto_2168024 ) ) ( not ( = ?auto_2168029 ?auto_2168028 ) ) ( HOIST-AT ?auto_2168025 ?auto_2168029 ) ( not ( = ?auto_2168031 ?auto_2168025 ) ) ( SURFACE-AT ?auto_2168024 ?auto_2168029 ) ( ON ?auto_2168024 ?auto_2168030 ) ( CLEAR ?auto_2168024 ) ( not ( = ?auto_2168023 ?auto_2168030 ) ) ( not ( = ?auto_2168024 ?auto_2168030 ) ) ( not ( = ?auto_2168022 ?auto_2168030 ) ) ( IS-CRATE ?auto_2168023 ) ( AVAILABLE ?auto_2168025 ) ( SURFACE-AT ?auto_2168023 ?auto_2168029 ) ( ON ?auto_2168023 ?auto_2168027 ) ( CLEAR ?auto_2168023 ) ( not ( = ?auto_2168023 ?auto_2168027 ) ) ( not ( = ?auto_2168024 ?auto_2168027 ) ) ( not ( = ?auto_2168022 ?auto_2168027 ) ) ( not ( = ?auto_2168030 ?auto_2168027 ) ) ( TRUCK-AT ?auto_2168026 ?auto_2168028 ) ( SURFACE-AT ?auto_2168021 ?auto_2168028 ) ( CLEAR ?auto_2168021 ) ( LIFTING ?auto_2168031 ?auto_2168022 ) ( IS-CRATE ?auto_2168022 ) ( not ( = ?auto_2168021 ?auto_2168022 ) ) ( not ( = ?auto_2168023 ?auto_2168021 ) ) ( not ( = ?auto_2168024 ?auto_2168021 ) ) ( not ( = ?auto_2168030 ?auto_2168021 ) ) ( not ( = ?auto_2168027 ?auto_2168021 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168022 ?auto_2168023 ?auto_2168024 )
      ( MAKE-3CRATE-VERIFY ?auto_2168021 ?auto_2168022 ?auto_2168023 ?auto_2168024 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_2168032 - SURFACE
      ?auto_2168033 - SURFACE
      ?auto_2168034 - SURFACE
      ?auto_2168035 - SURFACE
      ?auto_2168036 - SURFACE
    )
    :vars
    (
      ?auto_2168043 - HOIST
      ?auto_2168040 - PLACE
      ?auto_2168041 - PLACE
      ?auto_2168037 - HOIST
      ?auto_2168042 - SURFACE
      ?auto_2168039 - SURFACE
      ?auto_2168038 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168043 ?auto_2168040 ) ( IS-CRATE ?auto_2168036 ) ( not ( = ?auto_2168035 ?auto_2168036 ) ) ( not ( = ?auto_2168034 ?auto_2168035 ) ) ( not ( = ?auto_2168034 ?auto_2168036 ) ) ( not ( = ?auto_2168041 ?auto_2168040 ) ) ( HOIST-AT ?auto_2168037 ?auto_2168041 ) ( not ( = ?auto_2168043 ?auto_2168037 ) ) ( SURFACE-AT ?auto_2168036 ?auto_2168041 ) ( ON ?auto_2168036 ?auto_2168042 ) ( CLEAR ?auto_2168036 ) ( not ( = ?auto_2168035 ?auto_2168042 ) ) ( not ( = ?auto_2168036 ?auto_2168042 ) ) ( not ( = ?auto_2168034 ?auto_2168042 ) ) ( IS-CRATE ?auto_2168035 ) ( AVAILABLE ?auto_2168037 ) ( SURFACE-AT ?auto_2168035 ?auto_2168041 ) ( ON ?auto_2168035 ?auto_2168039 ) ( CLEAR ?auto_2168035 ) ( not ( = ?auto_2168035 ?auto_2168039 ) ) ( not ( = ?auto_2168036 ?auto_2168039 ) ) ( not ( = ?auto_2168034 ?auto_2168039 ) ) ( not ( = ?auto_2168042 ?auto_2168039 ) ) ( TRUCK-AT ?auto_2168038 ?auto_2168040 ) ( SURFACE-AT ?auto_2168033 ?auto_2168040 ) ( CLEAR ?auto_2168033 ) ( LIFTING ?auto_2168043 ?auto_2168034 ) ( IS-CRATE ?auto_2168034 ) ( not ( = ?auto_2168033 ?auto_2168034 ) ) ( not ( = ?auto_2168035 ?auto_2168033 ) ) ( not ( = ?auto_2168036 ?auto_2168033 ) ) ( not ( = ?auto_2168042 ?auto_2168033 ) ) ( not ( = ?auto_2168039 ?auto_2168033 ) ) ( ON ?auto_2168033 ?auto_2168032 ) ( not ( = ?auto_2168032 ?auto_2168033 ) ) ( not ( = ?auto_2168032 ?auto_2168034 ) ) ( not ( = ?auto_2168032 ?auto_2168035 ) ) ( not ( = ?auto_2168032 ?auto_2168036 ) ) ( not ( = ?auto_2168032 ?auto_2168042 ) ) ( not ( = ?auto_2168032 ?auto_2168039 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168034 ?auto_2168035 ?auto_2168036 )
      ( MAKE-4CRATE-VERIFY ?auto_2168032 ?auto_2168033 ?auto_2168034 ?auto_2168035 ?auto_2168036 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_2168044 - SURFACE
      ?auto_2168045 - SURFACE
      ?auto_2168046 - SURFACE
      ?auto_2168047 - SURFACE
      ?auto_2168048 - SURFACE
      ?auto_2168049 - SURFACE
    )
    :vars
    (
      ?auto_2168056 - HOIST
      ?auto_2168053 - PLACE
      ?auto_2168054 - PLACE
      ?auto_2168050 - HOIST
      ?auto_2168055 - SURFACE
      ?auto_2168052 - SURFACE
      ?auto_2168051 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168056 ?auto_2168053 ) ( IS-CRATE ?auto_2168049 ) ( not ( = ?auto_2168048 ?auto_2168049 ) ) ( not ( = ?auto_2168047 ?auto_2168048 ) ) ( not ( = ?auto_2168047 ?auto_2168049 ) ) ( not ( = ?auto_2168054 ?auto_2168053 ) ) ( HOIST-AT ?auto_2168050 ?auto_2168054 ) ( not ( = ?auto_2168056 ?auto_2168050 ) ) ( SURFACE-AT ?auto_2168049 ?auto_2168054 ) ( ON ?auto_2168049 ?auto_2168055 ) ( CLEAR ?auto_2168049 ) ( not ( = ?auto_2168048 ?auto_2168055 ) ) ( not ( = ?auto_2168049 ?auto_2168055 ) ) ( not ( = ?auto_2168047 ?auto_2168055 ) ) ( IS-CRATE ?auto_2168048 ) ( AVAILABLE ?auto_2168050 ) ( SURFACE-AT ?auto_2168048 ?auto_2168054 ) ( ON ?auto_2168048 ?auto_2168052 ) ( CLEAR ?auto_2168048 ) ( not ( = ?auto_2168048 ?auto_2168052 ) ) ( not ( = ?auto_2168049 ?auto_2168052 ) ) ( not ( = ?auto_2168047 ?auto_2168052 ) ) ( not ( = ?auto_2168055 ?auto_2168052 ) ) ( TRUCK-AT ?auto_2168051 ?auto_2168053 ) ( SURFACE-AT ?auto_2168046 ?auto_2168053 ) ( CLEAR ?auto_2168046 ) ( LIFTING ?auto_2168056 ?auto_2168047 ) ( IS-CRATE ?auto_2168047 ) ( not ( = ?auto_2168046 ?auto_2168047 ) ) ( not ( = ?auto_2168048 ?auto_2168046 ) ) ( not ( = ?auto_2168049 ?auto_2168046 ) ) ( not ( = ?auto_2168055 ?auto_2168046 ) ) ( not ( = ?auto_2168052 ?auto_2168046 ) ) ( ON ?auto_2168045 ?auto_2168044 ) ( ON ?auto_2168046 ?auto_2168045 ) ( not ( = ?auto_2168044 ?auto_2168045 ) ) ( not ( = ?auto_2168044 ?auto_2168046 ) ) ( not ( = ?auto_2168044 ?auto_2168047 ) ) ( not ( = ?auto_2168044 ?auto_2168048 ) ) ( not ( = ?auto_2168044 ?auto_2168049 ) ) ( not ( = ?auto_2168044 ?auto_2168055 ) ) ( not ( = ?auto_2168044 ?auto_2168052 ) ) ( not ( = ?auto_2168045 ?auto_2168046 ) ) ( not ( = ?auto_2168045 ?auto_2168047 ) ) ( not ( = ?auto_2168045 ?auto_2168048 ) ) ( not ( = ?auto_2168045 ?auto_2168049 ) ) ( not ( = ?auto_2168045 ?auto_2168055 ) ) ( not ( = ?auto_2168045 ?auto_2168052 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168047 ?auto_2168048 ?auto_2168049 )
      ( MAKE-5CRATE-VERIFY ?auto_2168044 ?auto_2168045 ?auto_2168046 ?auto_2168047 ?auto_2168048 ?auto_2168049 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_2168057 - SURFACE
      ?auto_2168058 - SURFACE
      ?auto_2168059 - SURFACE
      ?auto_2168060 - SURFACE
      ?auto_2168061 - SURFACE
      ?auto_2168062 - SURFACE
      ?auto_2168063 - SURFACE
    )
    :vars
    (
      ?auto_2168070 - HOIST
      ?auto_2168067 - PLACE
      ?auto_2168068 - PLACE
      ?auto_2168064 - HOIST
      ?auto_2168069 - SURFACE
      ?auto_2168066 - SURFACE
      ?auto_2168065 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168070 ?auto_2168067 ) ( IS-CRATE ?auto_2168063 ) ( not ( = ?auto_2168062 ?auto_2168063 ) ) ( not ( = ?auto_2168061 ?auto_2168062 ) ) ( not ( = ?auto_2168061 ?auto_2168063 ) ) ( not ( = ?auto_2168068 ?auto_2168067 ) ) ( HOIST-AT ?auto_2168064 ?auto_2168068 ) ( not ( = ?auto_2168070 ?auto_2168064 ) ) ( SURFACE-AT ?auto_2168063 ?auto_2168068 ) ( ON ?auto_2168063 ?auto_2168069 ) ( CLEAR ?auto_2168063 ) ( not ( = ?auto_2168062 ?auto_2168069 ) ) ( not ( = ?auto_2168063 ?auto_2168069 ) ) ( not ( = ?auto_2168061 ?auto_2168069 ) ) ( IS-CRATE ?auto_2168062 ) ( AVAILABLE ?auto_2168064 ) ( SURFACE-AT ?auto_2168062 ?auto_2168068 ) ( ON ?auto_2168062 ?auto_2168066 ) ( CLEAR ?auto_2168062 ) ( not ( = ?auto_2168062 ?auto_2168066 ) ) ( not ( = ?auto_2168063 ?auto_2168066 ) ) ( not ( = ?auto_2168061 ?auto_2168066 ) ) ( not ( = ?auto_2168069 ?auto_2168066 ) ) ( TRUCK-AT ?auto_2168065 ?auto_2168067 ) ( SURFACE-AT ?auto_2168060 ?auto_2168067 ) ( CLEAR ?auto_2168060 ) ( LIFTING ?auto_2168070 ?auto_2168061 ) ( IS-CRATE ?auto_2168061 ) ( not ( = ?auto_2168060 ?auto_2168061 ) ) ( not ( = ?auto_2168062 ?auto_2168060 ) ) ( not ( = ?auto_2168063 ?auto_2168060 ) ) ( not ( = ?auto_2168069 ?auto_2168060 ) ) ( not ( = ?auto_2168066 ?auto_2168060 ) ) ( ON ?auto_2168058 ?auto_2168057 ) ( ON ?auto_2168059 ?auto_2168058 ) ( ON ?auto_2168060 ?auto_2168059 ) ( not ( = ?auto_2168057 ?auto_2168058 ) ) ( not ( = ?auto_2168057 ?auto_2168059 ) ) ( not ( = ?auto_2168057 ?auto_2168060 ) ) ( not ( = ?auto_2168057 ?auto_2168061 ) ) ( not ( = ?auto_2168057 ?auto_2168062 ) ) ( not ( = ?auto_2168057 ?auto_2168063 ) ) ( not ( = ?auto_2168057 ?auto_2168069 ) ) ( not ( = ?auto_2168057 ?auto_2168066 ) ) ( not ( = ?auto_2168058 ?auto_2168059 ) ) ( not ( = ?auto_2168058 ?auto_2168060 ) ) ( not ( = ?auto_2168058 ?auto_2168061 ) ) ( not ( = ?auto_2168058 ?auto_2168062 ) ) ( not ( = ?auto_2168058 ?auto_2168063 ) ) ( not ( = ?auto_2168058 ?auto_2168069 ) ) ( not ( = ?auto_2168058 ?auto_2168066 ) ) ( not ( = ?auto_2168059 ?auto_2168060 ) ) ( not ( = ?auto_2168059 ?auto_2168061 ) ) ( not ( = ?auto_2168059 ?auto_2168062 ) ) ( not ( = ?auto_2168059 ?auto_2168063 ) ) ( not ( = ?auto_2168059 ?auto_2168069 ) ) ( not ( = ?auto_2168059 ?auto_2168066 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168061 ?auto_2168062 ?auto_2168063 )
      ( MAKE-6CRATE-VERIFY ?auto_2168057 ?auto_2168058 ?auto_2168059 ?auto_2168060 ?auto_2168061 ?auto_2168062 ?auto_2168063 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_2168071 - SURFACE
      ?auto_2168072 - SURFACE
      ?auto_2168073 - SURFACE
      ?auto_2168074 - SURFACE
      ?auto_2168075 - SURFACE
      ?auto_2168076 - SURFACE
      ?auto_2168077 - SURFACE
      ?auto_2168078 - SURFACE
    )
    :vars
    (
      ?auto_2168085 - HOIST
      ?auto_2168082 - PLACE
      ?auto_2168083 - PLACE
      ?auto_2168079 - HOIST
      ?auto_2168084 - SURFACE
      ?auto_2168081 - SURFACE
      ?auto_2168080 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168085 ?auto_2168082 ) ( IS-CRATE ?auto_2168078 ) ( not ( = ?auto_2168077 ?auto_2168078 ) ) ( not ( = ?auto_2168076 ?auto_2168077 ) ) ( not ( = ?auto_2168076 ?auto_2168078 ) ) ( not ( = ?auto_2168083 ?auto_2168082 ) ) ( HOIST-AT ?auto_2168079 ?auto_2168083 ) ( not ( = ?auto_2168085 ?auto_2168079 ) ) ( SURFACE-AT ?auto_2168078 ?auto_2168083 ) ( ON ?auto_2168078 ?auto_2168084 ) ( CLEAR ?auto_2168078 ) ( not ( = ?auto_2168077 ?auto_2168084 ) ) ( not ( = ?auto_2168078 ?auto_2168084 ) ) ( not ( = ?auto_2168076 ?auto_2168084 ) ) ( IS-CRATE ?auto_2168077 ) ( AVAILABLE ?auto_2168079 ) ( SURFACE-AT ?auto_2168077 ?auto_2168083 ) ( ON ?auto_2168077 ?auto_2168081 ) ( CLEAR ?auto_2168077 ) ( not ( = ?auto_2168077 ?auto_2168081 ) ) ( not ( = ?auto_2168078 ?auto_2168081 ) ) ( not ( = ?auto_2168076 ?auto_2168081 ) ) ( not ( = ?auto_2168084 ?auto_2168081 ) ) ( TRUCK-AT ?auto_2168080 ?auto_2168082 ) ( SURFACE-AT ?auto_2168075 ?auto_2168082 ) ( CLEAR ?auto_2168075 ) ( LIFTING ?auto_2168085 ?auto_2168076 ) ( IS-CRATE ?auto_2168076 ) ( not ( = ?auto_2168075 ?auto_2168076 ) ) ( not ( = ?auto_2168077 ?auto_2168075 ) ) ( not ( = ?auto_2168078 ?auto_2168075 ) ) ( not ( = ?auto_2168084 ?auto_2168075 ) ) ( not ( = ?auto_2168081 ?auto_2168075 ) ) ( ON ?auto_2168072 ?auto_2168071 ) ( ON ?auto_2168073 ?auto_2168072 ) ( ON ?auto_2168074 ?auto_2168073 ) ( ON ?auto_2168075 ?auto_2168074 ) ( not ( = ?auto_2168071 ?auto_2168072 ) ) ( not ( = ?auto_2168071 ?auto_2168073 ) ) ( not ( = ?auto_2168071 ?auto_2168074 ) ) ( not ( = ?auto_2168071 ?auto_2168075 ) ) ( not ( = ?auto_2168071 ?auto_2168076 ) ) ( not ( = ?auto_2168071 ?auto_2168077 ) ) ( not ( = ?auto_2168071 ?auto_2168078 ) ) ( not ( = ?auto_2168071 ?auto_2168084 ) ) ( not ( = ?auto_2168071 ?auto_2168081 ) ) ( not ( = ?auto_2168072 ?auto_2168073 ) ) ( not ( = ?auto_2168072 ?auto_2168074 ) ) ( not ( = ?auto_2168072 ?auto_2168075 ) ) ( not ( = ?auto_2168072 ?auto_2168076 ) ) ( not ( = ?auto_2168072 ?auto_2168077 ) ) ( not ( = ?auto_2168072 ?auto_2168078 ) ) ( not ( = ?auto_2168072 ?auto_2168084 ) ) ( not ( = ?auto_2168072 ?auto_2168081 ) ) ( not ( = ?auto_2168073 ?auto_2168074 ) ) ( not ( = ?auto_2168073 ?auto_2168075 ) ) ( not ( = ?auto_2168073 ?auto_2168076 ) ) ( not ( = ?auto_2168073 ?auto_2168077 ) ) ( not ( = ?auto_2168073 ?auto_2168078 ) ) ( not ( = ?auto_2168073 ?auto_2168084 ) ) ( not ( = ?auto_2168073 ?auto_2168081 ) ) ( not ( = ?auto_2168074 ?auto_2168075 ) ) ( not ( = ?auto_2168074 ?auto_2168076 ) ) ( not ( = ?auto_2168074 ?auto_2168077 ) ) ( not ( = ?auto_2168074 ?auto_2168078 ) ) ( not ( = ?auto_2168074 ?auto_2168084 ) ) ( not ( = ?auto_2168074 ?auto_2168081 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168076 ?auto_2168077 ?auto_2168078 )
      ( MAKE-7CRATE-VERIFY ?auto_2168071 ?auto_2168072 ?auto_2168073 ?auto_2168074 ?auto_2168075 ?auto_2168076 ?auto_2168077 ?auto_2168078 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_2168086 - SURFACE
      ?auto_2168087 - SURFACE
      ?auto_2168088 - SURFACE
      ?auto_2168089 - SURFACE
      ?auto_2168090 - SURFACE
      ?auto_2168091 - SURFACE
      ?auto_2168092 - SURFACE
      ?auto_2168093 - SURFACE
      ?auto_2168094 - SURFACE
    )
    :vars
    (
      ?auto_2168101 - HOIST
      ?auto_2168098 - PLACE
      ?auto_2168099 - PLACE
      ?auto_2168095 - HOIST
      ?auto_2168100 - SURFACE
      ?auto_2168097 - SURFACE
      ?auto_2168096 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168101 ?auto_2168098 ) ( IS-CRATE ?auto_2168094 ) ( not ( = ?auto_2168093 ?auto_2168094 ) ) ( not ( = ?auto_2168092 ?auto_2168093 ) ) ( not ( = ?auto_2168092 ?auto_2168094 ) ) ( not ( = ?auto_2168099 ?auto_2168098 ) ) ( HOIST-AT ?auto_2168095 ?auto_2168099 ) ( not ( = ?auto_2168101 ?auto_2168095 ) ) ( SURFACE-AT ?auto_2168094 ?auto_2168099 ) ( ON ?auto_2168094 ?auto_2168100 ) ( CLEAR ?auto_2168094 ) ( not ( = ?auto_2168093 ?auto_2168100 ) ) ( not ( = ?auto_2168094 ?auto_2168100 ) ) ( not ( = ?auto_2168092 ?auto_2168100 ) ) ( IS-CRATE ?auto_2168093 ) ( AVAILABLE ?auto_2168095 ) ( SURFACE-AT ?auto_2168093 ?auto_2168099 ) ( ON ?auto_2168093 ?auto_2168097 ) ( CLEAR ?auto_2168093 ) ( not ( = ?auto_2168093 ?auto_2168097 ) ) ( not ( = ?auto_2168094 ?auto_2168097 ) ) ( not ( = ?auto_2168092 ?auto_2168097 ) ) ( not ( = ?auto_2168100 ?auto_2168097 ) ) ( TRUCK-AT ?auto_2168096 ?auto_2168098 ) ( SURFACE-AT ?auto_2168091 ?auto_2168098 ) ( CLEAR ?auto_2168091 ) ( LIFTING ?auto_2168101 ?auto_2168092 ) ( IS-CRATE ?auto_2168092 ) ( not ( = ?auto_2168091 ?auto_2168092 ) ) ( not ( = ?auto_2168093 ?auto_2168091 ) ) ( not ( = ?auto_2168094 ?auto_2168091 ) ) ( not ( = ?auto_2168100 ?auto_2168091 ) ) ( not ( = ?auto_2168097 ?auto_2168091 ) ) ( ON ?auto_2168087 ?auto_2168086 ) ( ON ?auto_2168088 ?auto_2168087 ) ( ON ?auto_2168089 ?auto_2168088 ) ( ON ?auto_2168090 ?auto_2168089 ) ( ON ?auto_2168091 ?auto_2168090 ) ( not ( = ?auto_2168086 ?auto_2168087 ) ) ( not ( = ?auto_2168086 ?auto_2168088 ) ) ( not ( = ?auto_2168086 ?auto_2168089 ) ) ( not ( = ?auto_2168086 ?auto_2168090 ) ) ( not ( = ?auto_2168086 ?auto_2168091 ) ) ( not ( = ?auto_2168086 ?auto_2168092 ) ) ( not ( = ?auto_2168086 ?auto_2168093 ) ) ( not ( = ?auto_2168086 ?auto_2168094 ) ) ( not ( = ?auto_2168086 ?auto_2168100 ) ) ( not ( = ?auto_2168086 ?auto_2168097 ) ) ( not ( = ?auto_2168087 ?auto_2168088 ) ) ( not ( = ?auto_2168087 ?auto_2168089 ) ) ( not ( = ?auto_2168087 ?auto_2168090 ) ) ( not ( = ?auto_2168087 ?auto_2168091 ) ) ( not ( = ?auto_2168087 ?auto_2168092 ) ) ( not ( = ?auto_2168087 ?auto_2168093 ) ) ( not ( = ?auto_2168087 ?auto_2168094 ) ) ( not ( = ?auto_2168087 ?auto_2168100 ) ) ( not ( = ?auto_2168087 ?auto_2168097 ) ) ( not ( = ?auto_2168088 ?auto_2168089 ) ) ( not ( = ?auto_2168088 ?auto_2168090 ) ) ( not ( = ?auto_2168088 ?auto_2168091 ) ) ( not ( = ?auto_2168088 ?auto_2168092 ) ) ( not ( = ?auto_2168088 ?auto_2168093 ) ) ( not ( = ?auto_2168088 ?auto_2168094 ) ) ( not ( = ?auto_2168088 ?auto_2168100 ) ) ( not ( = ?auto_2168088 ?auto_2168097 ) ) ( not ( = ?auto_2168089 ?auto_2168090 ) ) ( not ( = ?auto_2168089 ?auto_2168091 ) ) ( not ( = ?auto_2168089 ?auto_2168092 ) ) ( not ( = ?auto_2168089 ?auto_2168093 ) ) ( not ( = ?auto_2168089 ?auto_2168094 ) ) ( not ( = ?auto_2168089 ?auto_2168100 ) ) ( not ( = ?auto_2168089 ?auto_2168097 ) ) ( not ( = ?auto_2168090 ?auto_2168091 ) ) ( not ( = ?auto_2168090 ?auto_2168092 ) ) ( not ( = ?auto_2168090 ?auto_2168093 ) ) ( not ( = ?auto_2168090 ?auto_2168094 ) ) ( not ( = ?auto_2168090 ?auto_2168100 ) ) ( not ( = ?auto_2168090 ?auto_2168097 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168092 ?auto_2168093 ?auto_2168094 )
      ( MAKE-8CRATE-VERIFY ?auto_2168086 ?auto_2168087 ?auto_2168088 ?auto_2168089 ?auto_2168090 ?auto_2168091 ?auto_2168092 ?auto_2168093 ?auto_2168094 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_2168102 - SURFACE
      ?auto_2168103 - SURFACE
      ?auto_2168104 - SURFACE
      ?auto_2168105 - SURFACE
      ?auto_2168106 - SURFACE
      ?auto_2168107 - SURFACE
      ?auto_2168108 - SURFACE
      ?auto_2168109 - SURFACE
      ?auto_2168110 - SURFACE
      ?auto_2168111 - SURFACE
    )
    :vars
    (
      ?auto_2168118 - HOIST
      ?auto_2168115 - PLACE
      ?auto_2168116 - PLACE
      ?auto_2168112 - HOIST
      ?auto_2168117 - SURFACE
      ?auto_2168114 - SURFACE
      ?auto_2168113 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168118 ?auto_2168115 ) ( IS-CRATE ?auto_2168111 ) ( not ( = ?auto_2168110 ?auto_2168111 ) ) ( not ( = ?auto_2168109 ?auto_2168110 ) ) ( not ( = ?auto_2168109 ?auto_2168111 ) ) ( not ( = ?auto_2168116 ?auto_2168115 ) ) ( HOIST-AT ?auto_2168112 ?auto_2168116 ) ( not ( = ?auto_2168118 ?auto_2168112 ) ) ( SURFACE-AT ?auto_2168111 ?auto_2168116 ) ( ON ?auto_2168111 ?auto_2168117 ) ( CLEAR ?auto_2168111 ) ( not ( = ?auto_2168110 ?auto_2168117 ) ) ( not ( = ?auto_2168111 ?auto_2168117 ) ) ( not ( = ?auto_2168109 ?auto_2168117 ) ) ( IS-CRATE ?auto_2168110 ) ( AVAILABLE ?auto_2168112 ) ( SURFACE-AT ?auto_2168110 ?auto_2168116 ) ( ON ?auto_2168110 ?auto_2168114 ) ( CLEAR ?auto_2168110 ) ( not ( = ?auto_2168110 ?auto_2168114 ) ) ( not ( = ?auto_2168111 ?auto_2168114 ) ) ( not ( = ?auto_2168109 ?auto_2168114 ) ) ( not ( = ?auto_2168117 ?auto_2168114 ) ) ( TRUCK-AT ?auto_2168113 ?auto_2168115 ) ( SURFACE-AT ?auto_2168108 ?auto_2168115 ) ( CLEAR ?auto_2168108 ) ( LIFTING ?auto_2168118 ?auto_2168109 ) ( IS-CRATE ?auto_2168109 ) ( not ( = ?auto_2168108 ?auto_2168109 ) ) ( not ( = ?auto_2168110 ?auto_2168108 ) ) ( not ( = ?auto_2168111 ?auto_2168108 ) ) ( not ( = ?auto_2168117 ?auto_2168108 ) ) ( not ( = ?auto_2168114 ?auto_2168108 ) ) ( ON ?auto_2168103 ?auto_2168102 ) ( ON ?auto_2168104 ?auto_2168103 ) ( ON ?auto_2168105 ?auto_2168104 ) ( ON ?auto_2168106 ?auto_2168105 ) ( ON ?auto_2168107 ?auto_2168106 ) ( ON ?auto_2168108 ?auto_2168107 ) ( not ( = ?auto_2168102 ?auto_2168103 ) ) ( not ( = ?auto_2168102 ?auto_2168104 ) ) ( not ( = ?auto_2168102 ?auto_2168105 ) ) ( not ( = ?auto_2168102 ?auto_2168106 ) ) ( not ( = ?auto_2168102 ?auto_2168107 ) ) ( not ( = ?auto_2168102 ?auto_2168108 ) ) ( not ( = ?auto_2168102 ?auto_2168109 ) ) ( not ( = ?auto_2168102 ?auto_2168110 ) ) ( not ( = ?auto_2168102 ?auto_2168111 ) ) ( not ( = ?auto_2168102 ?auto_2168117 ) ) ( not ( = ?auto_2168102 ?auto_2168114 ) ) ( not ( = ?auto_2168103 ?auto_2168104 ) ) ( not ( = ?auto_2168103 ?auto_2168105 ) ) ( not ( = ?auto_2168103 ?auto_2168106 ) ) ( not ( = ?auto_2168103 ?auto_2168107 ) ) ( not ( = ?auto_2168103 ?auto_2168108 ) ) ( not ( = ?auto_2168103 ?auto_2168109 ) ) ( not ( = ?auto_2168103 ?auto_2168110 ) ) ( not ( = ?auto_2168103 ?auto_2168111 ) ) ( not ( = ?auto_2168103 ?auto_2168117 ) ) ( not ( = ?auto_2168103 ?auto_2168114 ) ) ( not ( = ?auto_2168104 ?auto_2168105 ) ) ( not ( = ?auto_2168104 ?auto_2168106 ) ) ( not ( = ?auto_2168104 ?auto_2168107 ) ) ( not ( = ?auto_2168104 ?auto_2168108 ) ) ( not ( = ?auto_2168104 ?auto_2168109 ) ) ( not ( = ?auto_2168104 ?auto_2168110 ) ) ( not ( = ?auto_2168104 ?auto_2168111 ) ) ( not ( = ?auto_2168104 ?auto_2168117 ) ) ( not ( = ?auto_2168104 ?auto_2168114 ) ) ( not ( = ?auto_2168105 ?auto_2168106 ) ) ( not ( = ?auto_2168105 ?auto_2168107 ) ) ( not ( = ?auto_2168105 ?auto_2168108 ) ) ( not ( = ?auto_2168105 ?auto_2168109 ) ) ( not ( = ?auto_2168105 ?auto_2168110 ) ) ( not ( = ?auto_2168105 ?auto_2168111 ) ) ( not ( = ?auto_2168105 ?auto_2168117 ) ) ( not ( = ?auto_2168105 ?auto_2168114 ) ) ( not ( = ?auto_2168106 ?auto_2168107 ) ) ( not ( = ?auto_2168106 ?auto_2168108 ) ) ( not ( = ?auto_2168106 ?auto_2168109 ) ) ( not ( = ?auto_2168106 ?auto_2168110 ) ) ( not ( = ?auto_2168106 ?auto_2168111 ) ) ( not ( = ?auto_2168106 ?auto_2168117 ) ) ( not ( = ?auto_2168106 ?auto_2168114 ) ) ( not ( = ?auto_2168107 ?auto_2168108 ) ) ( not ( = ?auto_2168107 ?auto_2168109 ) ) ( not ( = ?auto_2168107 ?auto_2168110 ) ) ( not ( = ?auto_2168107 ?auto_2168111 ) ) ( not ( = ?auto_2168107 ?auto_2168117 ) ) ( not ( = ?auto_2168107 ?auto_2168114 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168109 ?auto_2168110 ?auto_2168111 )
      ( MAKE-9CRATE-VERIFY ?auto_2168102 ?auto_2168103 ?auto_2168104 ?auto_2168105 ?auto_2168106 ?auto_2168107 ?auto_2168108 ?auto_2168109 ?auto_2168110 ?auto_2168111 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_2168119 - SURFACE
      ?auto_2168120 - SURFACE
      ?auto_2168121 - SURFACE
      ?auto_2168122 - SURFACE
      ?auto_2168123 - SURFACE
      ?auto_2168124 - SURFACE
      ?auto_2168125 - SURFACE
      ?auto_2168126 - SURFACE
      ?auto_2168127 - SURFACE
      ?auto_2168128 - SURFACE
      ?auto_2168129 - SURFACE
    )
    :vars
    (
      ?auto_2168136 - HOIST
      ?auto_2168133 - PLACE
      ?auto_2168134 - PLACE
      ?auto_2168130 - HOIST
      ?auto_2168135 - SURFACE
      ?auto_2168132 - SURFACE
      ?auto_2168131 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168136 ?auto_2168133 ) ( IS-CRATE ?auto_2168129 ) ( not ( = ?auto_2168128 ?auto_2168129 ) ) ( not ( = ?auto_2168127 ?auto_2168128 ) ) ( not ( = ?auto_2168127 ?auto_2168129 ) ) ( not ( = ?auto_2168134 ?auto_2168133 ) ) ( HOIST-AT ?auto_2168130 ?auto_2168134 ) ( not ( = ?auto_2168136 ?auto_2168130 ) ) ( SURFACE-AT ?auto_2168129 ?auto_2168134 ) ( ON ?auto_2168129 ?auto_2168135 ) ( CLEAR ?auto_2168129 ) ( not ( = ?auto_2168128 ?auto_2168135 ) ) ( not ( = ?auto_2168129 ?auto_2168135 ) ) ( not ( = ?auto_2168127 ?auto_2168135 ) ) ( IS-CRATE ?auto_2168128 ) ( AVAILABLE ?auto_2168130 ) ( SURFACE-AT ?auto_2168128 ?auto_2168134 ) ( ON ?auto_2168128 ?auto_2168132 ) ( CLEAR ?auto_2168128 ) ( not ( = ?auto_2168128 ?auto_2168132 ) ) ( not ( = ?auto_2168129 ?auto_2168132 ) ) ( not ( = ?auto_2168127 ?auto_2168132 ) ) ( not ( = ?auto_2168135 ?auto_2168132 ) ) ( TRUCK-AT ?auto_2168131 ?auto_2168133 ) ( SURFACE-AT ?auto_2168126 ?auto_2168133 ) ( CLEAR ?auto_2168126 ) ( LIFTING ?auto_2168136 ?auto_2168127 ) ( IS-CRATE ?auto_2168127 ) ( not ( = ?auto_2168126 ?auto_2168127 ) ) ( not ( = ?auto_2168128 ?auto_2168126 ) ) ( not ( = ?auto_2168129 ?auto_2168126 ) ) ( not ( = ?auto_2168135 ?auto_2168126 ) ) ( not ( = ?auto_2168132 ?auto_2168126 ) ) ( ON ?auto_2168120 ?auto_2168119 ) ( ON ?auto_2168121 ?auto_2168120 ) ( ON ?auto_2168122 ?auto_2168121 ) ( ON ?auto_2168123 ?auto_2168122 ) ( ON ?auto_2168124 ?auto_2168123 ) ( ON ?auto_2168125 ?auto_2168124 ) ( ON ?auto_2168126 ?auto_2168125 ) ( not ( = ?auto_2168119 ?auto_2168120 ) ) ( not ( = ?auto_2168119 ?auto_2168121 ) ) ( not ( = ?auto_2168119 ?auto_2168122 ) ) ( not ( = ?auto_2168119 ?auto_2168123 ) ) ( not ( = ?auto_2168119 ?auto_2168124 ) ) ( not ( = ?auto_2168119 ?auto_2168125 ) ) ( not ( = ?auto_2168119 ?auto_2168126 ) ) ( not ( = ?auto_2168119 ?auto_2168127 ) ) ( not ( = ?auto_2168119 ?auto_2168128 ) ) ( not ( = ?auto_2168119 ?auto_2168129 ) ) ( not ( = ?auto_2168119 ?auto_2168135 ) ) ( not ( = ?auto_2168119 ?auto_2168132 ) ) ( not ( = ?auto_2168120 ?auto_2168121 ) ) ( not ( = ?auto_2168120 ?auto_2168122 ) ) ( not ( = ?auto_2168120 ?auto_2168123 ) ) ( not ( = ?auto_2168120 ?auto_2168124 ) ) ( not ( = ?auto_2168120 ?auto_2168125 ) ) ( not ( = ?auto_2168120 ?auto_2168126 ) ) ( not ( = ?auto_2168120 ?auto_2168127 ) ) ( not ( = ?auto_2168120 ?auto_2168128 ) ) ( not ( = ?auto_2168120 ?auto_2168129 ) ) ( not ( = ?auto_2168120 ?auto_2168135 ) ) ( not ( = ?auto_2168120 ?auto_2168132 ) ) ( not ( = ?auto_2168121 ?auto_2168122 ) ) ( not ( = ?auto_2168121 ?auto_2168123 ) ) ( not ( = ?auto_2168121 ?auto_2168124 ) ) ( not ( = ?auto_2168121 ?auto_2168125 ) ) ( not ( = ?auto_2168121 ?auto_2168126 ) ) ( not ( = ?auto_2168121 ?auto_2168127 ) ) ( not ( = ?auto_2168121 ?auto_2168128 ) ) ( not ( = ?auto_2168121 ?auto_2168129 ) ) ( not ( = ?auto_2168121 ?auto_2168135 ) ) ( not ( = ?auto_2168121 ?auto_2168132 ) ) ( not ( = ?auto_2168122 ?auto_2168123 ) ) ( not ( = ?auto_2168122 ?auto_2168124 ) ) ( not ( = ?auto_2168122 ?auto_2168125 ) ) ( not ( = ?auto_2168122 ?auto_2168126 ) ) ( not ( = ?auto_2168122 ?auto_2168127 ) ) ( not ( = ?auto_2168122 ?auto_2168128 ) ) ( not ( = ?auto_2168122 ?auto_2168129 ) ) ( not ( = ?auto_2168122 ?auto_2168135 ) ) ( not ( = ?auto_2168122 ?auto_2168132 ) ) ( not ( = ?auto_2168123 ?auto_2168124 ) ) ( not ( = ?auto_2168123 ?auto_2168125 ) ) ( not ( = ?auto_2168123 ?auto_2168126 ) ) ( not ( = ?auto_2168123 ?auto_2168127 ) ) ( not ( = ?auto_2168123 ?auto_2168128 ) ) ( not ( = ?auto_2168123 ?auto_2168129 ) ) ( not ( = ?auto_2168123 ?auto_2168135 ) ) ( not ( = ?auto_2168123 ?auto_2168132 ) ) ( not ( = ?auto_2168124 ?auto_2168125 ) ) ( not ( = ?auto_2168124 ?auto_2168126 ) ) ( not ( = ?auto_2168124 ?auto_2168127 ) ) ( not ( = ?auto_2168124 ?auto_2168128 ) ) ( not ( = ?auto_2168124 ?auto_2168129 ) ) ( not ( = ?auto_2168124 ?auto_2168135 ) ) ( not ( = ?auto_2168124 ?auto_2168132 ) ) ( not ( = ?auto_2168125 ?auto_2168126 ) ) ( not ( = ?auto_2168125 ?auto_2168127 ) ) ( not ( = ?auto_2168125 ?auto_2168128 ) ) ( not ( = ?auto_2168125 ?auto_2168129 ) ) ( not ( = ?auto_2168125 ?auto_2168135 ) ) ( not ( = ?auto_2168125 ?auto_2168132 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168127 ?auto_2168128 ?auto_2168129 )
      ( MAKE-10CRATE-VERIFY ?auto_2168119 ?auto_2168120 ?auto_2168121 ?auto_2168122 ?auto_2168123 ?auto_2168124 ?auto_2168125 ?auto_2168126 ?auto_2168127 ?auto_2168128 ?auto_2168129 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_2168137 - SURFACE
      ?auto_2168138 - SURFACE
      ?auto_2168139 - SURFACE
      ?auto_2168140 - SURFACE
      ?auto_2168141 - SURFACE
      ?auto_2168142 - SURFACE
      ?auto_2168143 - SURFACE
      ?auto_2168144 - SURFACE
      ?auto_2168145 - SURFACE
      ?auto_2168146 - SURFACE
      ?auto_2168147 - SURFACE
      ?auto_2168148 - SURFACE
    )
    :vars
    (
      ?auto_2168155 - HOIST
      ?auto_2168152 - PLACE
      ?auto_2168153 - PLACE
      ?auto_2168149 - HOIST
      ?auto_2168154 - SURFACE
      ?auto_2168151 - SURFACE
      ?auto_2168150 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168155 ?auto_2168152 ) ( IS-CRATE ?auto_2168148 ) ( not ( = ?auto_2168147 ?auto_2168148 ) ) ( not ( = ?auto_2168146 ?auto_2168147 ) ) ( not ( = ?auto_2168146 ?auto_2168148 ) ) ( not ( = ?auto_2168153 ?auto_2168152 ) ) ( HOIST-AT ?auto_2168149 ?auto_2168153 ) ( not ( = ?auto_2168155 ?auto_2168149 ) ) ( SURFACE-AT ?auto_2168148 ?auto_2168153 ) ( ON ?auto_2168148 ?auto_2168154 ) ( CLEAR ?auto_2168148 ) ( not ( = ?auto_2168147 ?auto_2168154 ) ) ( not ( = ?auto_2168148 ?auto_2168154 ) ) ( not ( = ?auto_2168146 ?auto_2168154 ) ) ( IS-CRATE ?auto_2168147 ) ( AVAILABLE ?auto_2168149 ) ( SURFACE-AT ?auto_2168147 ?auto_2168153 ) ( ON ?auto_2168147 ?auto_2168151 ) ( CLEAR ?auto_2168147 ) ( not ( = ?auto_2168147 ?auto_2168151 ) ) ( not ( = ?auto_2168148 ?auto_2168151 ) ) ( not ( = ?auto_2168146 ?auto_2168151 ) ) ( not ( = ?auto_2168154 ?auto_2168151 ) ) ( TRUCK-AT ?auto_2168150 ?auto_2168152 ) ( SURFACE-AT ?auto_2168145 ?auto_2168152 ) ( CLEAR ?auto_2168145 ) ( LIFTING ?auto_2168155 ?auto_2168146 ) ( IS-CRATE ?auto_2168146 ) ( not ( = ?auto_2168145 ?auto_2168146 ) ) ( not ( = ?auto_2168147 ?auto_2168145 ) ) ( not ( = ?auto_2168148 ?auto_2168145 ) ) ( not ( = ?auto_2168154 ?auto_2168145 ) ) ( not ( = ?auto_2168151 ?auto_2168145 ) ) ( ON ?auto_2168138 ?auto_2168137 ) ( ON ?auto_2168139 ?auto_2168138 ) ( ON ?auto_2168140 ?auto_2168139 ) ( ON ?auto_2168141 ?auto_2168140 ) ( ON ?auto_2168142 ?auto_2168141 ) ( ON ?auto_2168143 ?auto_2168142 ) ( ON ?auto_2168144 ?auto_2168143 ) ( ON ?auto_2168145 ?auto_2168144 ) ( not ( = ?auto_2168137 ?auto_2168138 ) ) ( not ( = ?auto_2168137 ?auto_2168139 ) ) ( not ( = ?auto_2168137 ?auto_2168140 ) ) ( not ( = ?auto_2168137 ?auto_2168141 ) ) ( not ( = ?auto_2168137 ?auto_2168142 ) ) ( not ( = ?auto_2168137 ?auto_2168143 ) ) ( not ( = ?auto_2168137 ?auto_2168144 ) ) ( not ( = ?auto_2168137 ?auto_2168145 ) ) ( not ( = ?auto_2168137 ?auto_2168146 ) ) ( not ( = ?auto_2168137 ?auto_2168147 ) ) ( not ( = ?auto_2168137 ?auto_2168148 ) ) ( not ( = ?auto_2168137 ?auto_2168154 ) ) ( not ( = ?auto_2168137 ?auto_2168151 ) ) ( not ( = ?auto_2168138 ?auto_2168139 ) ) ( not ( = ?auto_2168138 ?auto_2168140 ) ) ( not ( = ?auto_2168138 ?auto_2168141 ) ) ( not ( = ?auto_2168138 ?auto_2168142 ) ) ( not ( = ?auto_2168138 ?auto_2168143 ) ) ( not ( = ?auto_2168138 ?auto_2168144 ) ) ( not ( = ?auto_2168138 ?auto_2168145 ) ) ( not ( = ?auto_2168138 ?auto_2168146 ) ) ( not ( = ?auto_2168138 ?auto_2168147 ) ) ( not ( = ?auto_2168138 ?auto_2168148 ) ) ( not ( = ?auto_2168138 ?auto_2168154 ) ) ( not ( = ?auto_2168138 ?auto_2168151 ) ) ( not ( = ?auto_2168139 ?auto_2168140 ) ) ( not ( = ?auto_2168139 ?auto_2168141 ) ) ( not ( = ?auto_2168139 ?auto_2168142 ) ) ( not ( = ?auto_2168139 ?auto_2168143 ) ) ( not ( = ?auto_2168139 ?auto_2168144 ) ) ( not ( = ?auto_2168139 ?auto_2168145 ) ) ( not ( = ?auto_2168139 ?auto_2168146 ) ) ( not ( = ?auto_2168139 ?auto_2168147 ) ) ( not ( = ?auto_2168139 ?auto_2168148 ) ) ( not ( = ?auto_2168139 ?auto_2168154 ) ) ( not ( = ?auto_2168139 ?auto_2168151 ) ) ( not ( = ?auto_2168140 ?auto_2168141 ) ) ( not ( = ?auto_2168140 ?auto_2168142 ) ) ( not ( = ?auto_2168140 ?auto_2168143 ) ) ( not ( = ?auto_2168140 ?auto_2168144 ) ) ( not ( = ?auto_2168140 ?auto_2168145 ) ) ( not ( = ?auto_2168140 ?auto_2168146 ) ) ( not ( = ?auto_2168140 ?auto_2168147 ) ) ( not ( = ?auto_2168140 ?auto_2168148 ) ) ( not ( = ?auto_2168140 ?auto_2168154 ) ) ( not ( = ?auto_2168140 ?auto_2168151 ) ) ( not ( = ?auto_2168141 ?auto_2168142 ) ) ( not ( = ?auto_2168141 ?auto_2168143 ) ) ( not ( = ?auto_2168141 ?auto_2168144 ) ) ( not ( = ?auto_2168141 ?auto_2168145 ) ) ( not ( = ?auto_2168141 ?auto_2168146 ) ) ( not ( = ?auto_2168141 ?auto_2168147 ) ) ( not ( = ?auto_2168141 ?auto_2168148 ) ) ( not ( = ?auto_2168141 ?auto_2168154 ) ) ( not ( = ?auto_2168141 ?auto_2168151 ) ) ( not ( = ?auto_2168142 ?auto_2168143 ) ) ( not ( = ?auto_2168142 ?auto_2168144 ) ) ( not ( = ?auto_2168142 ?auto_2168145 ) ) ( not ( = ?auto_2168142 ?auto_2168146 ) ) ( not ( = ?auto_2168142 ?auto_2168147 ) ) ( not ( = ?auto_2168142 ?auto_2168148 ) ) ( not ( = ?auto_2168142 ?auto_2168154 ) ) ( not ( = ?auto_2168142 ?auto_2168151 ) ) ( not ( = ?auto_2168143 ?auto_2168144 ) ) ( not ( = ?auto_2168143 ?auto_2168145 ) ) ( not ( = ?auto_2168143 ?auto_2168146 ) ) ( not ( = ?auto_2168143 ?auto_2168147 ) ) ( not ( = ?auto_2168143 ?auto_2168148 ) ) ( not ( = ?auto_2168143 ?auto_2168154 ) ) ( not ( = ?auto_2168143 ?auto_2168151 ) ) ( not ( = ?auto_2168144 ?auto_2168145 ) ) ( not ( = ?auto_2168144 ?auto_2168146 ) ) ( not ( = ?auto_2168144 ?auto_2168147 ) ) ( not ( = ?auto_2168144 ?auto_2168148 ) ) ( not ( = ?auto_2168144 ?auto_2168154 ) ) ( not ( = ?auto_2168144 ?auto_2168151 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168146 ?auto_2168147 ?auto_2168148 )
      ( MAKE-11CRATE-VERIFY ?auto_2168137 ?auto_2168138 ?auto_2168139 ?auto_2168140 ?auto_2168141 ?auto_2168142 ?auto_2168143 ?auto_2168144 ?auto_2168145 ?auto_2168146 ?auto_2168147 ?auto_2168148 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_2168156 - SURFACE
      ?auto_2168157 - SURFACE
      ?auto_2168158 - SURFACE
      ?auto_2168159 - SURFACE
      ?auto_2168160 - SURFACE
      ?auto_2168161 - SURFACE
      ?auto_2168162 - SURFACE
      ?auto_2168163 - SURFACE
      ?auto_2168164 - SURFACE
      ?auto_2168165 - SURFACE
      ?auto_2168166 - SURFACE
      ?auto_2168167 - SURFACE
      ?auto_2168168 - SURFACE
    )
    :vars
    (
      ?auto_2168175 - HOIST
      ?auto_2168172 - PLACE
      ?auto_2168173 - PLACE
      ?auto_2168169 - HOIST
      ?auto_2168174 - SURFACE
      ?auto_2168171 - SURFACE
      ?auto_2168170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2168175 ?auto_2168172 ) ( IS-CRATE ?auto_2168168 ) ( not ( = ?auto_2168167 ?auto_2168168 ) ) ( not ( = ?auto_2168166 ?auto_2168167 ) ) ( not ( = ?auto_2168166 ?auto_2168168 ) ) ( not ( = ?auto_2168173 ?auto_2168172 ) ) ( HOIST-AT ?auto_2168169 ?auto_2168173 ) ( not ( = ?auto_2168175 ?auto_2168169 ) ) ( SURFACE-AT ?auto_2168168 ?auto_2168173 ) ( ON ?auto_2168168 ?auto_2168174 ) ( CLEAR ?auto_2168168 ) ( not ( = ?auto_2168167 ?auto_2168174 ) ) ( not ( = ?auto_2168168 ?auto_2168174 ) ) ( not ( = ?auto_2168166 ?auto_2168174 ) ) ( IS-CRATE ?auto_2168167 ) ( AVAILABLE ?auto_2168169 ) ( SURFACE-AT ?auto_2168167 ?auto_2168173 ) ( ON ?auto_2168167 ?auto_2168171 ) ( CLEAR ?auto_2168167 ) ( not ( = ?auto_2168167 ?auto_2168171 ) ) ( not ( = ?auto_2168168 ?auto_2168171 ) ) ( not ( = ?auto_2168166 ?auto_2168171 ) ) ( not ( = ?auto_2168174 ?auto_2168171 ) ) ( TRUCK-AT ?auto_2168170 ?auto_2168172 ) ( SURFACE-AT ?auto_2168165 ?auto_2168172 ) ( CLEAR ?auto_2168165 ) ( LIFTING ?auto_2168175 ?auto_2168166 ) ( IS-CRATE ?auto_2168166 ) ( not ( = ?auto_2168165 ?auto_2168166 ) ) ( not ( = ?auto_2168167 ?auto_2168165 ) ) ( not ( = ?auto_2168168 ?auto_2168165 ) ) ( not ( = ?auto_2168174 ?auto_2168165 ) ) ( not ( = ?auto_2168171 ?auto_2168165 ) ) ( ON ?auto_2168157 ?auto_2168156 ) ( ON ?auto_2168158 ?auto_2168157 ) ( ON ?auto_2168159 ?auto_2168158 ) ( ON ?auto_2168160 ?auto_2168159 ) ( ON ?auto_2168161 ?auto_2168160 ) ( ON ?auto_2168162 ?auto_2168161 ) ( ON ?auto_2168163 ?auto_2168162 ) ( ON ?auto_2168164 ?auto_2168163 ) ( ON ?auto_2168165 ?auto_2168164 ) ( not ( = ?auto_2168156 ?auto_2168157 ) ) ( not ( = ?auto_2168156 ?auto_2168158 ) ) ( not ( = ?auto_2168156 ?auto_2168159 ) ) ( not ( = ?auto_2168156 ?auto_2168160 ) ) ( not ( = ?auto_2168156 ?auto_2168161 ) ) ( not ( = ?auto_2168156 ?auto_2168162 ) ) ( not ( = ?auto_2168156 ?auto_2168163 ) ) ( not ( = ?auto_2168156 ?auto_2168164 ) ) ( not ( = ?auto_2168156 ?auto_2168165 ) ) ( not ( = ?auto_2168156 ?auto_2168166 ) ) ( not ( = ?auto_2168156 ?auto_2168167 ) ) ( not ( = ?auto_2168156 ?auto_2168168 ) ) ( not ( = ?auto_2168156 ?auto_2168174 ) ) ( not ( = ?auto_2168156 ?auto_2168171 ) ) ( not ( = ?auto_2168157 ?auto_2168158 ) ) ( not ( = ?auto_2168157 ?auto_2168159 ) ) ( not ( = ?auto_2168157 ?auto_2168160 ) ) ( not ( = ?auto_2168157 ?auto_2168161 ) ) ( not ( = ?auto_2168157 ?auto_2168162 ) ) ( not ( = ?auto_2168157 ?auto_2168163 ) ) ( not ( = ?auto_2168157 ?auto_2168164 ) ) ( not ( = ?auto_2168157 ?auto_2168165 ) ) ( not ( = ?auto_2168157 ?auto_2168166 ) ) ( not ( = ?auto_2168157 ?auto_2168167 ) ) ( not ( = ?auto_2168157 ?auto_2168168 ) ) ( not ( = ?auto_2168157 ?auto_2168174 ) ) ( not ( = ?auto_2168157 ?auto_2168171 ) ) ( not ( = ?auto_2168158 ?auto_2168159 ) ) ( not ( = ?auto_2168158 ?auto_2168160 ) ) ( not ( = ?auto_2168158 ?auto_2168161 ) ) ( not ( = ?auto_2168158 ?auto_2168162 ) ) ( not ( = ?auto_2168158 ?auto_2168163 ) ) ( not ( = ?auto_2168158 ?auto_2168164 ) ) ( not ( = ?auto_2168158 ?auto_2168165 ) ) ( not ( = ?auto_2168158 ?auto_2168166 ) ) ( not ( = ?auto_2168158 ?auto_2168167 ) ) ( not ( = ?auto_2168158 ?auto_2168168 ) ) ( not ( = ?auto_2168158 ?auto_2168174 ) ) ( not ( = ?auto_2168158 ?auto_2168171 ) ) ( not ( = ?auto_2168159 ?auto_2168160 ) ) ( not ( = ?auto_2168159 ?auto_2168161 ) ) ( not ( = ?auto_2168159 ?auto_2168162 ) ) ( not ( = ?auto_2168159 ?auto_2168163 ) ) ( not ( = ?auto_2168159 ?auto_2168164 ) ) ( not ( = ?auto_2168159 ?auto_2168165 ) ) ( not ( = ?auto_2168159 ?auto_2168166 ) ) ( not ( = ?auto_2168159 ?auto_2168167 ) ) ( not ( = ?auto_2168159 ?auto_2168168 ) ) ( not ( = ?auto_2168159 ?auto_2168174 ) ) ( not ( = ?auto_2168159 ?auto_2168171 ) ) ( not ( = ?auto_2168160 ?auto_2168161 ) ) ( not ( = ?auto_2168160 ?auto_2168162 ) ) ( not ( = ?auto_2168160 ?auto_2168163 ) ) ( not ( = ?auto_2168160 ?auto_2168164 ) ) ( not ( = ?auto_2168160 ?auto_2168165 ) ) ( not ( = ?auto_2168160 ?auto_2168166 ) ) ( not ( = ?auto_2168160 ?auto_2168167 ) ) ( not ( = ?auto_2168160 ?auto_2168168 ) ) ( not ( = ?auto_2168160 ?auto_2168174 ) ) ( not ( = ?auto_2168160 ?auto_2168171 ) ) ( not ( = ?auto_2168161 ?auto_2168162 ) ) ( not ( = ?auto_2168161 ?auto_2168163 ) ) ( not ( = ?auto_2168161 ?auto_2168164 ) ) ( not ( = ?auto_2168161 ?auto_2168165 ) ) ( not ( = ?auto_2168161 ?auto_2168166 ) ) ( not ( = ?auto_2168161 ?auto_2168167 ) ) ( not ( = ?auto_2168161 ?auto_2168168 ) ) ( not ( = ?auto_2168161 ?auto_2168174 ) ) ( not ( = ?auto_2168161 ?auto_2168171 ) ) ( not ( = ?auto_2168162 ?auto_2168163 ) ) ( not ( = ?auto_2168162 ?auto_2168164 ) ) ( not ( = ?auto_2168162 ?auto_2168165 ) ) ( not ( = ?auto_2168162 ?auto_2168166 ) ) ( not ( = ?auto_2168162 ?auto_2168167 ) ) ( not ( = ?auto_2168162 ?auto_2168168 ) ) ( not ( = ?auto_2168162 ?auto_2168174 ) ) ( not ( = ?auto_2168162 ?auto_2168171 ) ) ( not ( = ?auto_2168163 ?auto_2168164 ) ) ( not ( = ?auto_2168163 ?auto_2168165 ) ) ( not ( = ?auto_2168163 ?auto_2168166 ) ) ( not ( = ?auto_2168163 ?auto_2168167 ) ) ( not ( = ?auto_2168163 ?auto_2168168 ) ) ( not ( = ?auto_2168163 ?auto_2168174 ) ) ( not ( = ?auto_2168163 ?auto_2168171 ) ) ( not ( = ?auto_2168164 ?auto_2168165 ) ) ( not ( = ?auto_2168164 ?auto_2168166 ) ) ( not ( = ?auto_2168164 ?auto_2168167 ) ) ( not ( = ?auto_2168164 ?auto_2168168 ) ) ( not ( = ?auto_2168164 ?auto_2168174 ) ) ( not ( = ?auto_2168164 ?auto_2168171 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2168166 ?auto_2168167 ?auto_2168168 )
      ( MAKE-12CRATE-VERIFY ?auto_2168156 ?auto_2168157 ?auto_2168158 ?auto_2168159 ?auto_2168160 ?auto_2168161 ?auto_2168162 ?auto_2168163 ?auto_2168164 ?auto_2168165 ?auto_2168166 ?auto_2168167 ?auto_2168168 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_2173706 - SURFACE
      ?auto_2173707 - SURFACE
    )
    :vars
    (
      ?auto_2173713 - HOIST
      ?auto_2173715 - PLACE
      ?auto_2173711 - SURFACE
      ?auto_2173710 - PLACE
      ?auto_2173714 - HOIST
      ?auto_2173709 - SURFACE
      ?auto_2173708 - TRUCK
      ?auto_2173712 - SURFACE
      ?auto_2173716 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2173713 ?auto_2173715 ) ( IS-CRATE ?auto_2173707 ) ( not ( = ?auto_2173706 ?auto_2173707 ) ) ( not ( = ?auto_2173711 ?auto_2173706 ) ) ( not ( = ?auto_2173711 ?auto_2173707 ) ) ( not ( = ?auto_2173710 ?auto_2173715 ) ) ( HOIST-AT ?auto_2173714 ?auto_2173710 ) ( not ( = ?auto_2173713 ?auto_2173714 ) ) ( SURFACE-AT ?auto_2173707 ?auto_2173710 ) ( ON ?auto_2173707 ?auto_2173709 ) ( CLEAR ?auto_2173707 ) ( not ( = ?auto_2173706 ?auto_2173709 ) ) ( not ( = ?auto_2173707 ?auto_2173709 ) ) ( not ( = ?auto_2173711 ?auto_2173709 ) ) ( SURFACE-AT ?auto_2173711 ?auto_2173715 ) ( CLEAR ?auto_2173711 ) ( IS-CRATE ?auto_2173706 ) ( AVAILABLE ?auto_2173713 ) ( TRUCK-AT ?auto_2173708 ?auto_2173710 ) ( SURFACE-AT ?auto_2173706 ?auto_2173710 ) ( ON ?auto_2173706 ?auto_2173712 ) ( CLEAR ?auto_2173706 ) ( not ( = ?auto_2173706 ?auto_2173712 ) ) ( not ( = ?auto_2173707 ?auto_2173712 ) ) ( not ( = ?auto_2173711 ?auto_2173712 ) ) ( not ( = ?auto_2173709 ?auto_2173712 ) ) ( LIFTING ?auto_2173714 ?auto_2173716 ) ( IS-CRATE ?auto_2173716 ) ( not ( = ?auto_2173706 ?auto_2173716 ) ) ( not ( = ?auto_2173707 ?auto_2173716 ) ) ( not ( = ?auto_2173711 ?auto_2173716 ) ) ( not ( = ?auto_2173709 ?auto_2173716 ) ) ( not ( = ?auto_2173712 ?auto_2173716 ) ) )
    :subtasks
    ( ( !LOAD ?auto_2173714 ?auto_2173716 ?auto_2173708 ?auto_2173710 )
      ( MAKE-2CRATE ?auto_2173711 ?auto_2173706 ?auto_2173707 )
      ( MAKE-1CRATE-VERIFY ?auto_2173706 ?auto_2173707 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_2173717 - SURFACE
      ?auto_2173718 - SURFACE
      ?auto_2173719 - SURFACE
    )
    :vars
    (
      ?auto_2173727 - HOIST
      ?auto_2173720 - PLACE
      ?auto_2173721 - PLACE
      ?auto_2173724 - HOIST
      ?auto_2173723 - SURFACE
      ?auto_2173726 - TRUCK
      ?auto_2173725 - SURFACE
      ?auto_2173722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2173727 ?auto_2173720 ) ( IS-CRATE ?auto_2173719 ) ( not ( = ?auto_2173718 ?auto_2173719 ) ) ( not ( = ?auto_2173717 ?auto_2173718 ) ) ( not ( = ?auto_2173717 ?auto_2173719 ) ) ( not ( = ?auto_2173721 ?auto_2173720 ) ) ( HOIST-AT ?auto_2173724 ?auto_2173721 ) ( not ( = ?auto_2173727 ?auto_2173724 ) ) ( SURFACE-AT ?auto_2173719 ?auto_2173721 ) ( ON ?auto_2173719 ?auto_2173723 ) ( CLEAR ?auto_2173719 ) ( not ( = ?auto_2173718 ?auto_2173723 ) ) ( not ( = ?auto_2173719 ?auto_2173723 ) ) ( not ( = ?auto_2173717 ?auto_2173723 ) ) ( SURFACE-AT ?auto_2173717 ?auto_2173720 ) ( CLEAR ?auto_2173717 ) ( IS-CRATE ?auto_2173718 ) ( AVAILABLE ?auto_2173727 ) ( TRUCK-AT ?auto_2173726 ?auto_2173721 ) ( SURFACE-AT ?auto_2173718 ?auto_2173721 ) ( ON ?auto_2173718 ?auto_2173725 ) ( CLEAR ?auto_2173718 ) ( not ( = ?auto_2173718 ?auto_2173725 ) ) ( not ( = ?auto_2173719 ?auto_2173725 ) ) ( not ( = ?auto_2173717 ?auto_2173725 ) ) ( not ( = ?auto_2173723 ?auto_2173725 ) ) ( LIFTING ?auto_2173724 ?auto_2173722 ) ( IS-CRATE ?auto_2173722 ) ( not ( = ?auto_2173718 ?auto_2173722 ) ) ( not ( = ?auto_2173719 ?auto_2173722 ) ) ( not ( = ?auto_2173717 ?auto_2173722 ) ) ( not ( = ?auto_2173723 ?auto_2173722 ) ) ( not ( = ?auto_2173725 ?auto_2173722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2173718 ?auto_2173719 )
      ( MAKE-2CRATE-VERIFY ?auto_2173717 ?auto_2173718 ?auto_2173719 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178726 - SURFACE
      ?auto_2178727 - SURFACE
      ?auto_2178728 - SURFACE
      ?auto_2178729 - SURFACE
      ?auto_2178730 - SURFACE
      ?auto_2178731 - SURFACE
      ?auto_2178732 - SURFACE
      ?auto_2178733 - SURFACE
      ?auto_2178734 - SURFACE
      ?auto_2178735 - SURFACE
      ?auto_2178736 - SURFACE
      ?auto_2178737 - SURFACE
      ?auto_2178738 - SURFACE
      ?auto_2178739 - SURFACE
    )
    :vars
    (
      ?auto_2178741 - HOIST
      ?auto_2178740 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178741 ?auto_2178740 ) ( SURFACE-AT ?auto_2178738 ?auto_2178740 ) ( CLEAR ?auto_2178738 ) ( LIFTING ?auto_2178741 ?auto_2178739 ) ( IS-CRATE ?auto_2178739 ) ( not ( = ?auto_2178738 ?auto_2178739 ) ) ( ON ?auto_2178727 ?auto_2178726 ) ( ON ?auto_2178728 ?auto_2178727 ) ( ON ?auto_2178729 ?auto_2178728 ) ( ON ?auto_2178730 ?auto_2178729 ) ( ON ?auto_2178731 ?auto_2178730 ) ( ON ?auto_2178732 ?auto_2178731 ) ( ON ?auto_2178733 ?auto_2178732 ) ( ON ?auto_2178734 ?auto_2178733 ) ( ON ?auto_2178735 ?auto_2178734 ) ( ON ?auto_2178736 ?auto_2178735 ) ( ON ?auto_2178737 ?auto_2178736 ) ( ON ?auto_2178738 ?auto_2178737 ) ( not ( = ?auto_2178726 ?auto_2178727 ) ) ( not ( = ?auto_2178726 ?auto_2178728 ) ) ( not ( = ?auto_2178726 ?auto_2178729 ) ) ( not ( = ?auto_2178726 ?auto_2178730 ) ) ( not ( = ?auto_2178726 ?auto_2178731 ) ) ( not ( = ?auto_2178726 ?auto_2178732 ) ) ( not ( = ?auto_2178726 ?auto_2178733 ) ) ( not ( = ?auto_2178726 ?auto_2178734 ) ) ( not ( = ?auto_2178726 ?auto_2178735 ) ) ( not ( = ?auto_2178726 ?auto_2178736 ) ) ( not ( = ?auto_2178726 ?auto_2178737 ) ) ( not ( = ?auto_2178726 ?auto_2178738 ) ) ( not ( = ?auto_2178726 ?auto_2178739 ) ) ( not ( = ?auto_2178727 ?auto_2178728 ) ) ( not ( = ?auto_2178727 ?auto_2178729 ) ) ( not ( = ?auto_2178727 ?auto_2178730 ) ) ( not ( = ?auto_2178727 ?auto_2178731 ) ) ( not ( = ?auto_2178727 ?auto_2178732 ) ) ( not ( = ?auto_2178727 ?auto_2178733 ) ) ( not ( = ?auto_2178727 ?auto_2178734 ) ) ( not ( = ?auto_2178727 ?auto_2178735 ) ) ( not ( = ?auto_2178727 ?auto_2178736 ) ) ( not ( = ?auto_2178727 ?auto_2178737 ) ) ( not ( = ?auto_2178727 ?auto_2178738 ) ) ( not ( = ?auto_2178727 ?auto_2178739 ) ) ( not ( = ?auto_2178728 ?auto_2178729 ) ) ( not ( = ?auto_2178728 ?auto_2178730 ) ) ( not ( = ?auto_2178728 ?auto_2178731 ) ) ( not ( = ?auto_2178728 ?auto_2178732 ) ) ( not ( = ?auto_2178728 ?auto_2178733 ) ) ( not ( = ?auto_2178728 ?auto_2178734 ) ) ( not ( = ?auto_2178728 ?auto_2178735 ) ) ( not ( = ?auto_2178728 ?auto_2178736 ) ) ( not ( = ?auto_2178728 ?auto_2178737 ) ) ( not ( = ?auto_2178728 ?auto_2178738 ) ) ( not ( = ?auto_2178728 ?auto_2178739 ) ) ( not ( = ?auto_2178729 ?auto_2178730 ) ) ( not ( = ?auto_2178729 ?auto_2178731 ) ) ( not ( = ?auto_2178729 ?auto_2178732 ) ) ( not ( = ?auto_2178729 ?auto_2178733 ) ) ( not ( = ?auto_2178729 ?auto_2178734 ) ) ( not ( = ?auto_2178729 ?auto_2178735 ) ) ( not ( = ?auto_2178729 ?auto_2178736 ) ) ( not ( = ?auto_2178729 ?auto_2178737 ) ) ( not ( = ?auto_2178729 ?auto_2178738 ) ) ( not ( = ?auto_2178729 ?auto_2178739 ) ) ( not ( = ?auto_2178730 ?auto_2178731 ) ) ( not ( = ?auto_2178730 ?auto_2178732 ) ) ( not ( = ?auto_2178730 ?auto_2178733 ) ) ( not ( = ?auto_2178730 ?auto_2178734 ) ) ( not ( = ?auto_2178730 ?auto_2178735 ) ) ( not ( = ?auto_2178730 ?auto_2178736 ) ) ( not ( = ?auto_2178730 ?auto_2178737 ) ) ( not ( = ?auto_2178730 ?auto_2178738 ) ) ( not ( = ?auto_2178730 ?auto_2178739 ) ) ( not ( = ?auto_2178731 ?auto_2178732 ) ) ( not ( = ?auto_2178731 ?auto_2178733 ) ) ( not ( = ?auto_2178731 ?auto_2178734 ) ) ( not ( = ?auto_2178731 ?auto_2178735 ) ) ( not ( = ?auto_2178731 ?auto_2178736 ) ) ( not ( = ?auto_2178731 ?auto_2178737 ) ) ( not ( = ?auto_2178731 ?auto_2178738 ) ) ( not ( = ?auto_2178731 ?auto_2178739 ) ) ( not ( = ?auto_2178732 ?auto_2178733 ) ) ( not ( = ?auto_2178732 ?auto_2178734 ) ) ( not ( = ?auto_2178732 ?auto_2178735 ) ) ( not ( = ?auto_2178732 ?auto_2178736 ) ) ( not ( = ?auto_2178732 ?auto_2178737 ) ) ( not ( = ?auto_2178732 ?auto_2178738 ) ) ( not ( = ?auto_2178732 ?auto_2178739 ) ) ( not ( = ?auto_2178733 ?auto_2178734 ) ) ( not ( = ?auto_2178733 ?auto_2178735 ) ) ( not ( = ?auto_2178733 ?auto_2178736 ) ) ( not ( = ?auto_2178733 ?auto_2178737 ) ) ( not ( = ?auto_2178733 ?auto_2178738 ) ) ( not ( = ?auto_2178733 ?auto_2178739 ) ) ( not ( = ?auto_2178734 ?auto_2178735 ) ) ( not ( = ?auto_2178734 ?auto_2178736 ) ) ( not ( = ?auto_2178734 ?auto_2178737 ) ) ( not ( = ?auto_2178734 ?auto_2178738 ) ) ( not ( = ?auto_2178734 ?auto_2178739 ) ) ( not ( = ?auto_2178735 ?auto_2178736 ) ) ( not ( = ?auto_2178735 ?auto_2178737 ) ) ( not ( = ?auto_2178735 ?auto_2178738 ) ) ( not ( = ?auto_2178735 ?auto_2178739 ) ) ( not ( = ?auto_2178736 ?auto_2178737 ) ) ( not ( = ?auto_2178736 ?auto_2178738 ) ) ( not ( = ?auto_2178736 ?auto_2178739 ) ) ( not ( = ?auto_2178737 ?auto_2178738 ) ) ( not ( = ?auto_2178737 ?auto_2178739 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2178738 ?auto_2178739 )
      ( MAKE-13CRATE-VERIFY ?auto_2178726 ?auto_2178727 ?auto_2178728 ?auto_2178729 ?auto_2178730 ?auto_2178731 ?auto_2178732 ?auto_2178733 ?auto_2178734 ?auto_2178735 ?auto_2178736 ?auto_2178737 ?auto_2178738 ?auto_2178739 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2178868 - SURFACE
      ?auto_2178869 - SURFACE
      ?auto_2178870 - SURFACE
      ?auto_2178871 - SURFACE
      ?auto_2178872 - SURFACE
      ?auto_2178873 - SURFACE
      ?auto_2178874 - SURFACE
      ?auto_2178875 - SURFACE
      ?auto_2178876 - SURFACE
      ?auto_2178877 - SURFACE
      ?auto_2178878 - SURFACE
      ?auto_2178879 - SURFACE
      ?auto_2178880 - SURFACE
      ?auto_2178881 - SURFACE
    )
    :vars
    (
      ?auto_2178882 - HOIST
      ?auto_2178884 - PLACE
      ?auto_2178883 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2178882 ?auto_2178884 ) ( SURFACE-AT ?auto_2178880 ?auto_2178884 ) ( CLEAR ?auto_2178880 ) ( IS-CRATE ?auto_2178881 ) ( not ( = ?auto_2178880 ?auto_2178881 ) ) ( TRUCK-AT ?auto_2178883 ?auto_2178884 ) ( AVAILABLE ?auto_2178882 ) ( IN ?auto_2178881 ?auto_2178883 ) ( ON ?auto_2178880 ?auto_2178879 ) ( not ( = ?auto_2178879 ?auto_2178880 ) ) ( not ( = ?auto_2178879 ?auto_2178881 ) ) ( ON ?auto_2178869 ?auto_2178868 ) ( ON ?auto_2178870 ?auto_2178869 ) ( ON ?auto_2178871 ?auto_2178870 ) ( ON ?auto_2178872 ?auto_2178871 ) ( ON ?auto_2178873 ?auto_2178872 ) ( ON ?auto_2178874 ?auto_2178873 ) ( ON ?auto_2178875 ?auto_2178874 ) ( ON ?auto_2178876 ?auto_2178875 ) ( ON ?auto_2178877 ?auto_2178876 ) ( ON ?auto_2178878 ?auto_2178877 ) ( ON ?auto_2178879 ?auto_2178878 ) ( not ( = ?auto_2178868 ?auto_2178869 ) ) ( not ( = ?auto_2178868 ?auto_2178870 ) ) ( not ( = ?auto_2178868 ?auto_2178871 ) ) ( not ( = ?auto_2178868 ?auto_2178872 ) ) ( not ( = ?auto_2178868 ?auto_2178873 ) ) ( not ( = ?auto_2178868 ?auto_2178874 ) ) ( not ( = ?auto_2178868 ?auto_2178875 ) ) ( not ( = ?auto_2178868 ?auto_2178876 ) ) ( not ( = ?auto_2178868 ?auto_2178877 ) ) ( not ( = ?auto_2178868 ?auto_2178878 ) ) ( not ( = ?auto_2178868 ?auto_2178879 ) ) ( not ( = ?auto_2178868 ?auto_2178880 ) ) ( not ( = ?auto_2178868 ?auto_2178881 ) ) ( not ( = ?auto_2178869 ?auto_2178870 ) ) ( not ( = ?auto_2178869 ?auto_2178871 ) ) ( not ( = ?auto_2178869 ?auto_2178872 ) ) ( not ( = ?auto_2178869 ?auto_2178873 ) ) ( not ( = ?auto_2178869 ?auto_2178874 ) ) ( not ( = ?auto_2178869 ?auto_2178875 ) ) ( not ( = ?auto_2178869 ?auto_2178876 ) ) ( not ( = ?auto_2178869 ?auto_2178877 ) ) ( not ( = ?auto_2178869 ?auto_2178878 ) ) ( not ( = ?auto_2178869 ?auto_2178879 ) ) ( not ( = ?auto_2178869 ?auto_2178880 ) ) ( not ( = ?auto_2178869 ?auto_2178881 ) ) ( not ( = ?auto_2178870 ?auto_2178871 ) ) ( not ( = ?auto_2178870 ?auto_2178872 ) ) ( not ( = ?auto_2178870 ?auto_2178873 ) ) ( not ( = ?auto_2178870 ?auto_2178874 ) ) ( not ( = ?auto_2178870 ?auto_2178875 ) ) ( not ( = ?auto_2178870 ?auto_2178876 ) ) ( not ( = ?auto_2178870 ?auto_2178877 ) ) ( not ( = ?auto_2178870 ?auto_2178878 ) ) ( not ( = ?auto_2178870 ?auto_2178879 ) ) ( not ( = ?auto_2178870 ?auto_2178880 ) ) ( not ( = ?auto_2178870 ?auto_2178881 ) ) ( not ( = ?auto_2178871 ?auto_2178872 ) ) ( not ( = ?auto_2178871 ?auto_2178873 ) ) ( not ( = ?auto_2178871 ?auto_2178874 ) ) ( not ( = ?auto_2178871 ?auto_2178875 ) ) ( not ( = ?auto_2178871 ?auto_2178876 ) ) ( not ( = ?auto_2178871 ?auto_2178877 ) ) ( not ( = ?auto_2178871 ?auto_2178878 ) ) ( not ( = ?auto_2178871 ?auto_2178879 ) ) ( not ( = ?auto_2178871 ?auto_2178880 ) ) ( not ( = ?auto_2178871 ?auto_2178881 ) ) ( not ( = ?auto_2178872 ?auto_2178873 ) ) ( not ( = ?auto_2178872 ?auto_2178874 ) ) ( not ( = ?auto_2178872 ?auto_2178875 ) ) ( not ( = ?auto_2178872 ?auto_2178876 ) ) ( not ( = ?auto_2178872 ?auto_2178877 ) ) ( not ( = ?auto_2178872 ?auto_2178878 ) ) ( not ( = ?auto_2178872 ?auto_2178879 ) ) ( not ( = ?auto_2178872 ?auto_2178880 ) ) ( not ( = ?auto_2178872 ?auto_2178881 ) ) ( not ( = ?auto_2178873 ?auto_2178874 ) ) ( not ( = ?auto_2178873 ?auto_2178875 ) ) ( not ( = ?auto_2178873 ?auto_2178876 ) ) ( not ( = ?auto_2178873 ?auto_2178877 ) ) ( not ( = ?auto_2178873 ?auto_2178878 ) ) ( not ( = ?auto_2178873 ?auto_2178879 ) ) ( not ( = ?auto_2178873 ?auto_2178880 ) ) ( not ( = ?auto_2178873 ?auto_2178881 ) ) ( not ( = ?auto_2178874 ?auto_2178875 ) ) ( not ( = ?auto_2178874 ?auto_2178876 ) ) ( not ( = ?auto_2178874 ?auto_2178877 ) ) ( not ( = ?auto_2178874 ?auto_2178878 ) ) ( not ( = ?auto_2178874 ?auto_2178879 ) ) ( not ( = ?auto_2178874 ?auto_2178880 ) ) ( not ( = ?auto_2178874 ?auto_2178881 ) ) ( not ( = ?auto_2178875 ?auto_2178876 ) ) ( not ( = ?auto_2178875 ?auto_2178877 ) ) ( not ( = ?auto_2178875 ?auto_2178878 ) ) ( not ( = ?auto_2178875 ?auto_2178879 ) ) ( not ( = ?auto_2178875 ?auto_2178880 ) ) ( not ( = ?auto_2178875 ?auto_2178881 ) ) ( not ( = ?auto_2178876 ?auto_2178877 ) ) ( not ( = ?auto_2178876 ?auto_2178878 ) ) ( not ( = ?auto_2178876 ?auto_2178879 ) ) ( not ( = ?auto_2178876 ?auto_2178880 ) ) ( not ( = ?auto_2178876 ?auto_2178881 ) ) ( not ( = ?auto_2178877 ?auto_2178878 ) ) ( not ( = ?auto_2178877 ?auto_2178879 ) ) ( not ( = ?auto_2178877 ?auto_2178880 ) ) ( not ( = ?auto_2178877 ?auto_2178881 ) ) ( not ( = ?auto_2178878 ?auto_2178879 ) ) ( not ( = ?auto_2178878 ?auto_2178880 ) ) ( not ( = ?auto_2178878 ?auto_2178881 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2178879 ?auto_2178880 ?auto_2178881 )
      ( MAKE-13CRATE-VERIFY ?auto_2178868 ?auto_2178869 ?auto_2178870 ?auto_2178871 ?auto_2178872 ?auto_2178873 ?auto_2178874 ?auto_2178875 ?auto_2178876 ?auto_2178877 ?auto_2178878 ?auto_2178879 ?auto_2178880 ?auto_2178881 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179024 - SURFACE
      ?auto_2179025 - SURFACE
      ?auto_2179026 - SURFACE
      ?auto_2179027 - SURFACE
      ?auto_2179028 - SURFACE
      ?auto_2179029 - SURFACE
      ?auto_2179030 - SURFACE
      ?auto_2179031 - SURFACE
      ?auto_2179032 - SURFACE
      ?auto_2179033 - SURFACE
      ?auto_2179034 - SURFACE
      ?auto_2179035 - SURFACE
      ?auto_2179036 - SURFACE
      ?auto_2179037 - SURFACE
    )
    :vars
    (
      ?auto_2179039 - HOIST
      ?auto_2179040 - PLACE
      ?auto_2179038 - TRUCK
      ?auto_2179041 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179039 ?auto_2179040 ) ( SURFACE-AT ?auto_2179036 ?auto_2179040 ) ( CLEAR ?auto_2179036 ) ( IS-CRATE ?auto_2179037 ) ( not ( = ?auto_2179036 ?auto_2179037 ) ) ( AVAILABLE ?auto_2179039 ) ( IN ?auto_2179037 ?auto_2179038 ) ( ON ?auto_2179036 ?auto_2179035 ) ( not ( = ?auto_2179035 ?auto_2179036 ) ) ( not ( = ?auto_2179035 ?auto_2179037 ) ) ( TRUCK-AT ?auto_2179038 ?auto_2179041 ) ( not ( = ?auto_2179041 ?auto_2179040 ) ) ( ON ?auto_2179025 ?auto_2179024 ) ( ON ?auto_2179026 ?auto_2179025 ) ( ON ?auto_2179027 ?auto_2179026 ) ( ON ?auto_2179028 ?auto_2179027 ) ( ON ?auto_2179029 ?auto_2179028 ) ( ON ?auto_2179030 ?auto_2179029 ) ( ON ?auto_2179031 ?auto_2179030 ) ( ON ?auto_2179032 ?auto_2179031 ) ( ON ?auto_2179033 ?auto_2179032 ) ( ON ?auto_2179034 ?auto_2179033 ) ( ON ?auto_2179035 ?auto_2179034 ) ( not ( = ?auto_2179024 ?auto_2179025 ) ) ( not ( = ?auto_2179024 ?auto_2179026 ) ) ( not ( = ?auto_2179024 ?auto_2179027 ) ) ( not ( = ?auto_2179024 ?auto_2179028 ) ) ( not ( = ?auto_2179024 ?auto_2179029 ) ) ( not ( = ?auto_2179024 ?auto_2179030 ) ) ( not ( = ?auto_2179024 ?auto_2179031 ) ) ( not ( = ?auto_2179024 ?auto_2179032 ) ) ( not ( = ?auto_2179024 ?auto_2179033 ) ) ( not ( = ?auto_2179024 ?auto_2179034 ) ) ( not ( = ?auto_2179024 ?auto_2179035 ) ) ( not ( = ?auto_2179024 ?auto_2179036 ) ) ( not ( = ?auto_2179024 ?auto_2179037 ) ) ( not ( = ?auto_2179025 ?auto_2179026 ) ) ( not ( = ?auto_2179025 ?auto_2179027 ) ) ( not ( = ?auto_2179025 ?auto_2179028 ) ) ( not ( = ?auto_2179025 ?auto_2179029 ) ) ( not ( = ?auto_2179025 ?auto_2179030 ) ) ( not ( = ?auto_2179025 ?auto_2179031 ) ) ( not ( = ?auto_2179025 ?auto_2179032 ) ) ( not ( = ?auto_2179025 ?auto_2179033 ) ) ( not ( = ?auto_2179025 ?auto_2179034 ) ) ( not ( = ?auto_2179025 ?auto_2179035 ) ) ( not ( = ?auto_2179025 ?auto_2179036 ) ) ( not ( = ?auto_2179025 ?auto_2179037 ) ) ( not ( = ?auto_2179026 ?auto_2179027 ) ) ( not ( = ?auto_2179026 ?auto_2179028 ) ) ( not ( = ?auto_2179026 ?auto_2179029 ) ) ( not ( = ?auto_2179026 ?auto_2179030 ) ) ( not ( = ?auto_2179026 ?auto_2179031 ) ) ( not ( = ?auto_2179026 ?auto_2179032 ) ) ( not ( = ?auto_2179026 ?auto_2179033 ) ) ( not ( = ?auto_2179026 ?auto_2179034 ) ) ( not ( = ?auto_2179026 ?auto_2179035 ) ) ( not ( = ?auto_2179026 ?auto_2179036 ) ) ( not ( = ?auto_2179026 ?auto_2179037 ) ) ( not ( = ?auto_2179027 ?auto_2179028 ) ) ( not ( = ?auto_2179027 ?auto_2179029 ) ) ( not ( = ?auto_2179027 ?auto_2179030 ) ) ( not ( = ?auto_2179027 ?auto_2179031 ) ) ( not ( = ?auto_2179027 ?auto_2179032 ) ) ( not ( = ?auto_2179027 ?auto_2179033 ) ) ( not ( = ?auto_2179027 ?auto_2179034 ) ) ( not ( = ?auto_2179027 ?auto_2179035 ) ) ( not ( = ?auto_2179027 ?auto_2179036 ) ) ( not ( = ?auto_2179027 ?auto_2179037 ) ) ( not ( = ?auto_2179028 ?auto_2179029 ) ) ( not ( = ?auto_2179028 ?auto_2179030 ) ) ( not ( = ?auto_2179028 ?auto_2179031 ) ) ( not ( = ?auto_2179028 ?auto_2179032 ) ) ( not ( = ?auto_2179028 ?auto_2179033 ) ) ( not ( = ?auto_2179028 ?auto_2179034 ) ) ( not ( = ?auto_2179028 ?auto_2179035 ) ) ( not ( = ?auto_2179028 ?auto_2179036 ) ) ( not ( = ?auto_2179028 ?auto_2179037 ) ) ( not ( = ?auto_2179029 ?auto_2179030 ) ) ( not ( = ?auto_2179029 ?auto_2179031 ) ) ( not ( = ?auto_2179029 ?auto_2179032 ) ) ( not ( = ?auto_2179029 ?auto_2179033 ) ) ( not ( = ?auto_2179029 ?auto_2179034 ) ) ( not ( = ?auto_2179029 ?auto_2179035 ) ) ( not ( = ?auto_2179029 ?auto_2179036 ) ) ( not ( = ?auto_2179029 ?auto_2179037 ) ) ( not ( = ?auto_2179030 ?auto_2179031 ) ) ( not ( = ?auto_2179030 ?auto_2179032 ) ) ( not ( = ?auto_2179030 ?auto_2179033 ) ) ( not ( = ?auto_2179030 ?auto_2179034 ) ) ( not ( = ?auto_2179030 ?auto_2179035 ) ) ( not ( = ?auto_2179030 ?auto_2179036 ) ) ( not ( = ?auto_2179030 ?auto_2179037 ) ) ( not ( = ?auto_2179031 ?auto_2179032 ) ) ( not ( = ?auto_2179031 ?auto_2179033 ) ) ( not ( = ?auto_2179031 ?auto_2179034 ) ) ( not ( = ?auto_2179031 ?auto_2179035 ) ) ( not ( = ?auto_2179031 ?auto_2179036 ) ) ( not ( = ?auto_2179031 ?auto_2179037 ) ) ( not ( = ?auto_2179032 ?auto_2179033 ) ) ( not ( = ?auto_2179032 ?auto_2179034 ) ) ( not ( = ?auto_2179032 ?auto_2179035 ) ) ( not ( = ?auto_2179032 ?auto_2179036 ) ) ( not ( = ?auto_2179032 ?auto_2179037 ) ) ( not ( = ?auto_2179033 ?auto_2179034 ) ) ( not ( = ?auto_2179033 ?auto_2179035 ) ) ( not ( = ?auto_2179033 ?auto_2179036 ) ) ( not ( = ?auto_2179033 ?auto_2179037 ) ) ( not ( = ?auto_2179034 ?auto_2179035 ) ) ( not ( = ?auto_2179034 ?auto_2179036 ) ) ( not ( = ?auto_2179034 ?auto_2179037 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179035 ?auto_2179036 ?auto_2179037 )
      ( MAKE-13CRATE-VERIFY ?auto_2179024 ?auto_2179025 ?auto_2179026 ?auto_2179027 ?auto_2179028 ?auto_2179029 ?auto_2179030 ?auto_2179031 ?auto_2179032 ?auto_2179033 ?auto_2179034 ?auto_2179035 ?auto_2179036 ?auto_2179037 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179193 - SURFACE
      ?auto_2179194 - SURFACE
      ?auto_2179195 - SURFACE
      ?auto_2179196 - SURFACE
      ?auto_2179197 - SURFACE
      ?auto_2179198 - SURFACE
      ?auto_2179199 - SURFACE
      ?auto_2179200 - SURFACE
      ?auto_2179201 - SURFACE
      ?auto_2179202 - SURFACE
      ?auto_2179203 - SURFACE
      ?auto_2179204 - SURFACE
      ?auto_2179205 - SURFACE
      ?auto_2179206 - SURFACE
    )
    :vars
    (
      ?auto_2179207 - HOIST
      ?auto_2179209 - PLACE
      ?auto_2179208 - TRUCK
      ?auto_2179210 - PLACE
      ?auto_2179211 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179207 ?auto_2179209 ) ( SURFACE-AT ?auto_2179205 ?auto_2179209 ) ( CLEAR ?auto_2179205 ) ( IS-CRATE ?auto_2179206 ) ( not ( = ?auto_2179205 ?auto_2179206 ) ) ( AVAILABLE ?auto_2179207 ) ( ON ?auto_2179205 ?auto_2179204 ) ( not ( = ?auto_2179204 ?auto_2179205 ) ) ( not ( = ?auto_2179204 ?auto_2179206 ) ) ( TRUCK-AT ?auto_2179208 ?auto_2179210 ) ( not ( = ?auto_2179210 ?auto_2179209 ) ) ( HOIST-AT ?auto_2179211 ?auto_2179210 ) ( LIFTING ?auto_2179211 ?auto_2179206 ) ( not ( = ?auto_2179207 ?auto_2179211 ) ) ( ON ?auto_2179194 ?auto_2179193 ) ( ON ?auto_2179195 ?auto_2179194 ) ( ON ?auto_2179196 ?auto_2179195 ) ( ON ?auto_2179197 ?auto_2179196 ) ( ON ?auto_2179198 ?auto_2179197 ) ( ON ?auto_2179199 ?auto_2179198 ) ( ON ?auto_2179200 ?auto_2179199 ) ( ON ?auto_2179201 ?auto_2179200 ) ( ON ?auto_2179202 ?auto_2179201 ) ( ON ?auto_2179203 ?auto_2179202 ) ( ON ?auto_2179204 ?auto_2179203 ) ( not ( = ?auto_2179193 ?auto_2179194 ) ) ( not ( = ?auto_2179193 ?auto_2179195 ) ) ( not ( = ?auto_2179193 ?auto_2179196 ) ) ( not ( = ?auto_2179193 ?auto_2179197 ) ) ( not ( = ?auto_2179193 ?auto_2179198 ) ) ( not ( = ?auto_2179193 ?auto_2179199 ) ) ( not ( = ?auto_2179193 ?auto_2179200 ) ) ( not ( = ?auto_2179193 ?auto_2179201 ) ) ( not ( = ?auto_2179193 ?auto_2179202 ) ) ( not ( = ?auto_2179193 ?auto_2179203 ) ) ( not ( = ?auto_2179193 ?auto_2179204 ) ) ( not ( = ?auto_2179193 ?auto_2179205 ) ) ( not ( = ?auto_2179193 ?auto_2179206 ) ) ( not ( = ?auto_2179194 ?auto_2179195 ) ) ( not ( = ?auto_2179194 ?auto_2179196 ) ) ( not ( = ?auto_2179194 ?auto_2179197 ) ) ( not ( = ?auto_2179194 ?auto_2179198 ) ) ( not ( = ?auto_2179194 ?auto_2179199 ) ) ( not ( = ?auto_2179194 ?auto_2179200 ) ) ( not ( = ?auto_2179194 ?auto_2179201 ) ) ( not ( = ?auto_2179194 ?auto_2179202 ) ) ( not ( = ?auto_2179194 ?auto_2179203 ) ) ( not ( = ?auto_2179194 ?auto_2179204 ) ) ( not ( = ?auto_2179194 ?auto_2179205 ) ) ( not ( = ?auto_2179194 ?auto_2179206 ) ) ( not ( = ?auto_2179195 ?auto_2179196 ) ) ( not ( = ?auto_2179195 ?auto_2179197 ) ) ( not ( = ?auto_2179195 ?auto_2179198 ) ) ( not ( = ?auto_2179195 ?auto_2179199 ) ) ( not ( = ?auto_2179195 ?auto_2179200 ) ) ( not ( = ?auto_2179195 ?auto_2179201 ) ) ( not ( = ?auto_2179195 ?auto_2179202 ) ) ( not ( = ?auto_2179195 ?auto_2179203 ) ) ( not ( = ?auto_2179195 ?auto_2179204 ) ) ( not ( = ?auto_2179195 ?auto_2179205 ) ) ( not ( = ?auto_2179195 ?auto_2179206 ) ) ( not ( = ?auto_2179196 ?auto_2179197 ) ) ( not ( = ?auto_2179196 ?auto_2179198 ) ) ( not ( = ?auto_2179196 ?auto_2179199 ) ) ( not ( = ?auto_2179196 ?auto_2179200 ) ) ( not ( = ?auto_2179196 ?auto_2179201 ) ) ( not ( = ?auto_2179196 ?auto_2179202 ) ) ( not ( = ?auto_2179196 ?auto_2179203 ) ) ( not ( = ?auto_2179196 ?auto_2179204 ) ) ( not ( = ?auto_2179196 ?auto_2179205 ) ) ( not ( = ?auto_2179196 ?auto_2179206 ) ) ( not ( = ?auto_2179197 ?auto_2179198 ) ) ( not ( = ?auto_2179197 ?auto_2179199 ) ) ( not ( = ?auto_2179197 ?auto_2179200 ) ) ( not ( = ?auto_2179197 ?auto_2179201 ) ) ( not ( = ?auto_2179197 ?auto_2179202 ) ) ( not ( = ?auto_2179197 ?auto_2179203 ) ) ( not ( = ?auto_2179197 ?auto_2179204 ) ) ( not ( = ?auto_2179197 ?auto_2179205 ) ) ( not ( = ?auto_2179197 ?auto_2179206 ) ) ( not ( = ?auto_2179198 ?auto_2179199 ) ) ( not ( = ?auto_2179198 ?auto_2179200 ) ) ( not ( = ?auto_2179198 ?auto_2179201 ) ) ( not ( = ?auto_2179198 ?auto_2179202 ) ) ( not ( = ?auto_2179198 ?auto_2179203 ) ) ( not ( = ?auto_2179198 ?auto_2179204 ) ) ( not ( = ?auto_2179198 ?auto_2179205 ) ) ( not ( = ?auto_2179198 ?auto_2179206 ) ) ( not ( = ?auto_2179199 ?auto_2179200 ) ) ( not ( = ?auto_2179199 ?auto_2179201 ) ) ( not ( = ?auto_2179199 ?auto_2179202 ) ) ( not ( = ?auto_2179199 ?auto_2179203 ) ) ( not ( = ?auto_2179199 ?auto_2179204 ) ) ( not ( = ?auto_2179199 ?auto_2179205 ) ) ( not ( = ?auto_2179199 ?auto_2179206 ) ) ( not ( = ?auto_2179200 ?auto_2179201 ) ) ( not ( = ?auto_2179200 ?auto_2179202 ) ) ( not ( = ?auto_2179200 ?auto_2179203 ) ) ( not ( = ?auto_2179200 ?auto_2179204 ) ) ( not ( = ?auto_2179200 ?auto_2179205 ) ) ( not ( = ?auto_2179200 ?auto_2179206 ) ) ( not ( = ?auto_2179201 ?auto_2179202 ) ) ( not ( = ?auto_2179201 ?auto_2179203 ) ) ( not ( = ?auto_2179201 ?auto_2179204 ) ) ( not ( = ?auto_2179201 ?auto_2179205 ) ) ( not ( = ?auto_2179201 ?auto_2179206 ) ) ( not ( = ?auto_2179202 ?auto_2179203 ) ) ( not ( = ?auto_2179202 ?auto_2179204 ) ) ( not ( = ?auto_2179202 ?auto_2179205 ) ) ( not ( = ?auto_2179202 ?auto_2179206 ) ) ( not ( = ?auto_2179203 ?auto_2179204 ) ) ( not ( = ?auto_2179203 ?auto_2179205 ) ) ( not ( = ?auto_2179203 ?auto_2179206 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179204 ?auto_2179205 ?auto_2179206 )
      ( MAKE-13CRATE-VERIFY ?auto_2179193 ?auto_2179194 ?auto_2179195 ?auto_2179196 ?auto_2179197 ?auto_2179198 ?auto_2179199 ?auto_2179200 ?auto_2179201 ?auto_2179202 ?auto_2179203 ?auto_2179204 ?auto_2179205 ?auto_2179206 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179375 - SURFACE
      ?auto_2179376 - SURFACE
      ?auto_2179377 - SURFACE
      ?auto_2179378 - SURFACE
      ?auto_2179379 - SURFACE
      ?auto_2179380 - SURFACE
      ?auto_2179381 - SURFACE
      ?auto_2179382 - SURFACE
      ?auto_2179383 - SURFACE
      ?auto_2179384 - SURFACE
      ?auto_2179385 - SURFACE
      ?auto_2179386 - SURFACE
      ?auto_2179387 - SURFACE
      ?auto_2179388 - SURFACE
    )
    :vars
    (
      ?auto_2179393 - HOIST
      ?auto_2179391 - PLACE
      ?auto_2179392 - TRUCK
      ?auto_2179390 - PLACE
      ?auto_2179389 - HOIST
      ?auto_2179394 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179393 ?auto_2179391 ) ( SURFACE-AT ?auto_2179387 ?auto_2179391 ) ( CLEAR ?auto_2179387 ) ( IS-CRATE ?auto_2179388 ) ( not ( = ?auto_2179387 ?auto_2179388 ) ) ( AVAILABLE ?auto_2179393 ) ( ON ?auto_2179387 ?auto_2179386 ) ( not ( = ?auto_2179386 ?auto_2179387 ) ) ( not ( = ?auto_2179386 ?auto_2179388 ) ) ( TRUCK-AT ?auto_2179392 ?auto_2179390 ) ( not ( = ?auto_2179390 ?auto_2179391 ) ) ( HOIST-AT ?auto_2179389 ?auto_2179390 ) ( not ( = ?auto_2179393 ?auto_2179389 ) ) ( AVAILABLE ?auto_2179389 ) ( SURFACE-AT ?auto_2179388 ?auto_2179390 ) ( ON ?auto_2179388 ?auto_2179394 ) ( CLEAR ?auto_2179388 ) ( not ( = ?auto_2179387 ?auto_2179394 ) ) ( not ( = ?auto_2179388 ?auto_2179394 ) ) ( not ( = ?auto_2179386 ?auto_2179394 ) ) ( ON ?auto_2179376 ?auto_2179375 ) ( ON ?auto_2179377 ?auto_2179376 ) ( ON ?auto_2179378 ?auto_2179377 ) ( ON ?auto_2179379 ?auto_2179378 ) ( ON ?auto_2179380 ?auto_2179379 ) ( ON ?auto_2179381 ?auto_2179380 ) ( ON ?auto_2179382 ?auto_2179381 ) ( ON ?auto_2179383 ?auto_2179382 ) ( ON ?auto_2179384 ?auto_2179383 ) ( ON ?auto_2179385 ?auto_2179384 ) ( ON ?auto_2179386 ?auto_2179385 ) ( not ( = ?auto_2179375 ?auto_2179376 ) ) ( not ( = ?auto_2179375 ?auto_2179377 ) ) ( not ( = ?auto_2179375 ?auto_2179378 ) ) ( not ( = ?auto_2179375 ?auto_2179379 ) ) ( not ( = ?auto_2179375 ?auto_2179380 ) ) ( not ( = ?auto_2179375 ?auto_2179381 ) ) ( not ( = ?auto_2179375 ?auto_2179382 ) ) ( not ( = ?auto_2179375 ?auto_2179383 ) ) ( not ( = ?auto_2179375 ?auto_2179384 ) ) ( not ( = ?auto_2179375 ?auto_2179385 ) ) ( not ( = ?auto_2179375 ?auto_2179386 ) ) ( not ( = ?auto_2179375 ?auto_2179387 ) ) ( not ( = ?auto_2179375 ?auto_2179388 ) ) ( not ( = ?auto_2179375 ?auto_2179394 ) ) ( not ( = ?auto_2179376 ?auto_2179377 ) ) ( not ( = ?auto_2179376 ?auto_2179378 ) ) ( not ( = ?auto_2179376 ?auto_2179379 ) ) ( not ( = ?auto_2179376 ?auto_2179380 ) ) ( not ( = ?auto_2179376 ?auto_2179381 ) ) ( not ( = ?auto_2179376 ?auto_2179382 ) ) ( not ( = ?auto_2179376 ?auto_2179383 ) ) ( not ( = ?auto_2179376 ?auto_2179384 ) ) ( not ( = ?auto_2179376 ?auto_2179385 ) ) ( not ( = ?auto_2179376 ?auto_2179386 ) ) ( not ( = ?auto_2179376 ?auto_2179387 ) ) ( not ( = ?auto_2179376 ?auto_2179388 ) ) ( not ( = ?auto_2179376 ?auto_2179394 ) ) ( not ( = ?auto_2179377 ?auto_2179378 ) ) ( not ( = ?auto_2179377 ?auto_2179379 ) ) ( not ( = ?auto_2179377 ?auto_2179380 ) ) ( not ( = ?auto_2179377 ?auto_2179381 ) ) ( not ( = ?auto_2179377 ?auto_2179382 ) ) ( not ( = ?auto_2179377 ?auto_2179383 ) ) ( not ( = ?auto_2179377 ?auto_2179384 ) ) ( not ( = ?auto_2179377 ?auto_2179385 ) ) ( not ( = ?auto_2179377 ?auto_2179386 ) ) ( not ( = ?auto_2179377 ?auto_2179387 ) ) ( not ( = ?auto_2179377 ?auto_2179388 ) ) ( not ( = ?auto_2179377 ?auto_2179394 ) ) ( not ( = ?auto_2179378 ?auto_2179379 ) ) ( not ( = ?auto_2179378 ?auto_2179380 ) ) ( not ( = ?auto_2179378 ?auto_2179381 ) ) ( not ( = ?auto_2179378 ?auto_2179382 ) ) ( not ( = ?auto_2179378 ?auto_2179383 ) ) ( not ( = ?auto_2179378 ?auto_2179384 ) ) ( not ( = ?auto_2179378 ?auto_2179385 ) ) ( not ( = ?auto_2179378 ?auto_2179386 ) ) ( not ( = ?auto_2179378 ?auto_2179387 ) ) ( not ( = ?auto_2179378 ?auto_2179388 ) ) ( not ( = ?auto_2179378 ?auto_2179394 ) ) ( not ( = ?auto_2179379 ?auto_2179380 ) ) ( not ( = ?auto_2179379 ?auto_2179381 ) ) ( not ( = ?auto_2179379 ?auto_2179382 ) ) ( not ( = ?auto_2179379 ?auto_2179383 ) ) ( not ( = ?auto_2179379 ?auto_2179384 ) ) ( not ( = ?auto_2179379 ?auto_2179385 ) ) ( not ( = ?auto_2179379 ?auto_2179386 ) ) ( not ( = ?auto_2179379 ?auto_2179387 ) ) ( not ( = ?auto_2179379 ?auto_2179388 ) ) ( not ( = ?auto_2179379 ?auto_2179394 ) ) ( not ( = ?auto_2179380 ?auto_2179381 ) ) ( not ( = ?auto_2179380 ?auto_2179382 ) ) ( not ( = ?auto_2179380 ?auto_2179383 ) ) ( not ( = ?auto_2179380 ?auto_2179384 ) ) ( not ( = ?auto_2179380 ?auto_2179385 ) ) ( not ( = ?auto_2179380 ?auto_2179386 ) ) ( not ( = ?auto_2179380 ?auto_2179387 ) ) ( not ( = ?auto_2179380 ?auto_2179388 ) ) ( not ( = ?auto_2179380 ?auto_2179394 ) ) ( not ( = ?auto_2179381 ?auto_2179382 ) ) ( not ( = ?auto_2179381 ?auto_2179383 ) ) ( not ( = ?auto_2179381 ?auto_2179384 ) ) ( not ( = ?auto_2179381 ?auto_2179385 ) ) ( not ( = ?auto_2179381 ?auto_2179386 ) ) ( not ( = ?auto_2179381 ?auto_2179387 ) ) ( not ( = ?auto_2179381 ?auto_2179388 ) ) ( not ( = ?auto_2179381 ?auto_2179394 ) ) ( not ( = ?auto_2179382 ?auto_2179383 ) ) ( not ( = ?auto_2179382 ?auto_2179384 ) ) ( not ( = ?auto_2179382 ?auto_2179385 ) ) ( not ( = ?auto_2179382 ?auto_2179386 ) ) ( not ( = ?auto_2179382 ?auto_2179387 ) ) ( not ( = ?auto_2179382 ?auto_2179388 ) ) ( not ( = ?auto_2179382 ?auto_2179394 ) ) ( not ( = ?auto_2179383 ?auto_2179384 ) ) ( not ( = ?auto_2179383 ?auto_2179385 ) ) ( not ( = ?auto_2179383 ?auto_2179386 ) ) ( not ( = ?auto_2179383 ?auto_2179387 ) ) ( not ( = ?auto_2179383 ?auto_2179388 ) ) ( not ( = ?auto_2179383 ?auto_2179394 ) ) ( not ( = ?auto_2179384 ?auto_2179385 ) ) ( not ( = ?auto_2179384 ?auto_2179386 ) ) ( not ( = ?auto_2179384 ?auto_2179387 ) ) ( not ( = ?auto_2179384 ?auto_2179388 ) ) ( not ( = ?auto_2179384 ?auto_2179394 ) ) ( not ( = ?auto_2179385 ?auto_2179386 ) ) ( not ( = ?auto_2179385 ?auto_2179387 ) ) ( not ( = ?auto_2179385 ?auto_2179388 ) ) ( not ( = ?auto_2179385 ?auto_2179394 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179386 ?auto_2179387 ?auto_2179388 )
      ( MAKE-13CRATE-VERIFY ?auto_2179375 ?auto_2179376 ?auto_2179377 ?auto_2179378 ?auto_2179379 ?auto_2179380 ?auto_2179381 ?auto_2179382 ?auto_2179383 ?auto_2179384 ?auto_2179385 ?auto_2179386 ?auto_2179387 ?auto_2179388 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179558 - SURFACE
      ?auto_2179559 - SURFACE
      ?auto_2179560 - SURFACE
      ?auto_2179561 - SURFACE
      ?auto_2179562 - SURFACE
      ?auto_2179563 - SURFACE
      ?auto_2179564 - SURFACE
      ?auto_2179565 - SURFACE
      ?auto_2179566 - SURFACE
      ?auto_2179567 - SURFACE
      ?auto_2179568 - SURFACE
      ?auto_2179569 - SURFACE
      ?auto_2179570 - SURFACE
      ?auto_2179571 - SURFACE
    )
    :vars
    (
      ?auto_2179573 - HOIST
      ?auto_2179572 - PLACE
      ?auto_2179574 - PLACE
      ?auto_2179575 - HOIST
      ?auto_2179577 - SURFACE
      ?auto_2179576 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179573 ?auto_2179572 ) ( SURFACE-AT ?auto_2179570 ?auto_2179572 ) ( CLEAR ?auto_2179570 ) ( IS-CRATE ?auto_2179571 ) ( not ( = ?auto_2179570 ?auto_2179571 ) ) ( AVAILABLE ?auto_2179573 ) ( ON ?auto_2179570 ?auto_2179569 ) ( not ( = ?auto_2179569 ?auto_2179570 ) ) ( not ( = ?auto_2179569 ?auto_2179571 ) ) ( not ( = ?auto_2179574 ?auto_2179572 ) ) ( HOIST-AT ?auto_2179575 ?auto_2179574 ) ( not ( = ?auto_2179573 ?auto_2179575 ) ) ( AVAILABLE ?auto_2179575 ) ( SURFACE-AT ?auto_2179571 ?auto_2179574 ) ( ON ?auto_2179571 ?auto_2179577 ) ( CLEAR ?auto_2179571 ) ( not ( = ?auto_2179570 ?auto_2179577 ) ) ( not ( = ?auto_2179571 ?auto_2179577 ) ) ( not ( = ?auto_2179569 ?auto_2179577 ) ) ( TRUCK-AT ?auto_2179576 ?auto_2179572 ) ( ON ?auto_2179559 ?auto_2179558 ) ( ON ?auto_2179560 ?auto_2179559 ) ( ON ?auto_2179561 ?auto_2179560 ) ( ON ?auto_2179562 ?auto_2179561 ) ( ON ?auto_2179563 ?auto_2179562 ) ( ON ?auto_2179564 ?auto_2179563 ) ( ON ?auto_2179565 ?auto_2179564 ) ( ON ?auto_2179566 ?auto_2179565 ) ( ON ?auto_2179567 ?auto_2179566 ) ( ON ?auto_2179568 ?auto_2179567 ) ( ON ?auto_2179569 ?auto_2179568 ) ( not ( = ?auto_2179558 ?auto_2179559 ) ) ( not ( = ?auto_2179558 ?auto_2179560 ) ) ( not ( = ?auto_2179558 ?auto_2179561 ) ) ( not ( = ?auto_2179558 ?auto_2179562 ) ) ( not ( = ?auto_2179558 ?auto_2179563 ) ) ( not ( = ?auto_2179558 ?auto_2179564 ) ) ( not ( = ?auto_2179558 ?auto_2179565 ) ) ( not ( = ?auto_2179558 ?auto_2179566 ) ) ( not ( = ?auto_2179558 ?auto_2179567 ) ) ( not ( = ?auto_2179558 ?auto_2179568 ) ) ( not ( = ?auto_2179558 ?auto_2179569 ) ) ( not ( = ?auto_2179558 ?auto_2179570 ) ) ( not ( = ?auto_2179558 ?auto_2179571 ) ) ( not ( = ?auto_2179558 ?auto_2179577 ) ) ( not ( = ?auto_2179559 ?auto_2179560 ) ) ( not ( = ?auto_2179559 ?auto_2179561 ) ) ( not ( = ?auto_2179559 ?auto_2179562 ) ) ( not ( = ?auto_2179559 ?auto_2179563 ) ) ( not ( = ?auto_2179559 ?auto_2179564 ) ) ( not ( = ?auto_2179559 ?auto_2179565 ) ) ( not ( = ?auto_2179559 ?auto_2179566 ) ) ( not ( = ?auto_2179559 ?auto_2179567 ) ) ( not ( = ?auto_2179559 ?auto_2179568 ) ) ( not ( = ?auto_2179559 ?auto_2179569 ) ) ( not ( = ?auto_2179559 ?auto_2179570 ) ) ( not ( = ?auto_2179559 ?auto_2179571 ) ) ( not ( = ?auto_2179559 ?auto_2179577 ) ) ( not ( = ?auto_2179560 ?auto_2179561 ) ) ( not ( = ?auto_2179560 ?auto_2179562 ) ) ( not ( = ?auto_2179560 ?auto_2179563 ) ) ( not ( = ?auto_2179560 ?auto_2179564 ) ) ( not ( = ?auto_2179560 ?auto_2179565 ) ) ( not ( = ?auto_2179560 ?auto_2179566 ) ) ( not ( = ?auto_2179560 ?auto_2179567 ) ) ( not ( = ?auto_2179560 ?auto_2179568 ) ) ( not ( = ?auto_2179560 ?auto_2179569 ) ) ( not ( = ?auto_2179560 ?auto_2179570 ) ) ( not ( = ?auto_2179560 ?auto_2179571 ) ) ( not ( = ?auto_2179560 ?auto_2179577 ) ) ( not ( = ?auto_2179561 ?auto_2179562 ) ) ( not ( = ?auto_2179561 ?auto_2179563 ) ) ( not ( = ?auto_2179561 ?auto_2179564 ) ) ( not ( = ?auto_2179561 ?auto_2179565 ) ) ( not ( = ?auto_2179561 ?auto_2179566 ) ) ( not ( = ?auto_2179561 ?auto_2179567 ) ) ( not ( = ?auto_2179561 ?auto_2179568 ) ) ( not ( = ?auto_2179561 ?auto_2179569 ) ) ( not ( = ?auto_2179561 ?auto_2179570 ) ) ( not ( = ?auto_2179561 ?auto_2179571 ) ) ( not ( = ?auto_2179561 ?auto_2179577 ) ) ( not ( = ?auto_2179562 ?auto_2179563 ) ) ( not ( = ?auto_2179562 ?auto_2179564 ) ) ( not ( = ?auto_2179562 ?auto_2179565 ) ) ( not ( = ?auto_2179562 ?auto_2179566 ) ) ( not ( = ?auto_2179562 ?auto_2179567 ) ) ( not ( = ?auto_2179562 ?auto_2179568 ) ) ( not ( = ?auto_2179562 ?auto_2179569 ) ) ( not ( = ?auto_2179562 ?auto_2179570 ) ) ( not ( = ?auto_2179562 ?auto_2179571 ) ) ( not ( = ?auto_2179562 ?auto_2179577 ) ) ( not ( = ?auto_2179563 ?auto_2179564 ) ) ( not ( = ?auto_2179563 ?auto_2179565 ) ) ( not ( = ?auto_2179563 ?auto_2179566 ) ) ( not ( = ?auto_2179563 ?auto_2179567 ) ) ( not ( = ?auto_2179563 ?auto_2179568 ) ) ( not ( = ?auto_2179563 ?auto_2179569 ) ) ( not ( = ?auto_2179563 ?auto_2179570 ) ) ( not ( = ?auto_2179563 ?auto_2179571 ) ) ( not ( = ?auto_2179563 ?auto_2179577 ) ) ( not ( = ?auto_2179564 ?auto_2179565 ) ) ( not ( = ?auto_2179564 ?auto_2179566 ) ) ( not ( = ?auto_2179564 ?auto_2179567 ) ) ( not ( = ?auto_2179564 ?auto_2179568 ) ) ( not ( = ?auto_2179564 ?auto_2179569 ) ) ( not ( = ?auto_2179564 ?auto_2179570 ) ) ( not ( = ?auto_2179564 ?auto_2179571 ) ) ( not ( = ?auto_2179564 ?auto_2179577 ) ) ( not ( = ?auto_2179565 ?auto_2179566 ) ) ( not ( = ?auto_2179565 ?auto_2179567 ) ) ( not ( = ?auto_2179565 ?auto_2179568 ) ) ( not ( = ?auto_2179565 ?auto_2179569 ) ) ( not ( = ?auto_2179565 ?auto_2179570 ) ) ( not ( = ?auto_2179565 ?auto_2179571 ) ) ( not ( = ?auto_2179565 ?auto_2179577 ) ) ( not ( = ?auto_2179566 ?auto_2179567 ) ) ( not ( = ?auto_2179566 ?auto_2179568 ) ) ( not ( = ?auto_2179566 ?auto_2179569 ) ) ( not ( = ?auto_2179566 ?auto_2179570 ) ) ( not ( = ?auto_2179566 ?auto_2179571 ) ) ( not ( = ?auto_2179566 ?auto_2179577 ) ) ( not ( = ?auto_2179567 ?auto_2179568 ) ) ( not ( = ?auto_2179567 ?auto_2179569 ) ) ( not ( = ?auto_2179567 ?auto_2179570 ) ) ( not ( = ?auto_2179567 ?auto_2179571 ) ) ( not ( = ?auto_2179567 ?auto_2179577 ) ) ( not ( = ?auto_2179568 ?auto_2179569 ) ) ( not ( = ?auto_2179568 ?auto_2179570 ) ) ( not ( = ?auto_2179568 ?auto_2179571 ) ) ( not ( = ?auto_2179568 ?auto_2179577 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179569 ?auto_2179570 ?auto_2179571 )
      ( MAKE-13CRATE-VERIFY ?auto_2179558 ?auto_2179559 ?auto_2179560 ?auto_2179561 ?auto_2179562 ?auto_2179563 ?auto_2179564 ?auto_2179565 ?auto_2179566 ?auto_2179567 ?auto_2179568 ?auto_2179569 ?auto_2179570 ?auto_2179571 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179741 - SURFACE
      ?auto_2179742 - SURFACE
      ?auto_2179743 - SURFACE
      ?auto_2179744 - SURFACE
      ?auto_2179745 - SURFACE
      ?auto_2179746 - SURFACE
      ?auto_2179747 - SURFACE
      ?auto_2179748 - SURFACE
      ?auto_2179749 - SURFACE
      ?auto_2179750 - SURFACE
      ?auto_2179751 - SURFACE
      ?auto_2179752 - SURFACE
      ?auto_2179753 - SURFACE
      ?auto_2179754 - SURFACE
    )
    :vars
    (
      ?auto_2179756 - HOIST
      ?auto_2179758 - PLACE
      ?auto_2179759 - PLACE
      ?auto_2179755 - HOIST
      ?auto_2179760 - SURFACE
      ?auto_2179757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179756 ?auto_2179758 ) ( IS-CRATE ?auto_2179754 ) ( not ( = ?auto_2179753 ?auto_2179754 ) ) ( not ( = ?auto_2179752 ?auto_2179753 ) ) ( not ( = ?auto_2179752 ?auto_2179754 ) ) ( not ( = ?auto_2179759 ?auto_2179758 ) ) ( HOIST-AT ?auto_2179755 ?auto_2179759 ) ( not ( = ?auto_2179756 ?auto_2179755 ) ) ( AVAILABLE ?auto_2179755 ) ( SURFACE-AT ?auto_2179754 ?auto_2179759 ) ( ON ?auto_2179754 ?auto_2179760 ) ( CLEAR ?auto_2179754 ) ( not ( = ?auto_2179753 ?auto_2179760 ) ) ( not ( = ?auto_2179754 ?auto_2179760 ) ) ( not ( = ?auto_2179752 ?auto_2179760 ) ) ( TRUCK-AT ?auto_2179757 ?auto_2179758 ) ( SURFACE-AT ?auto_2179752 ?auto_2179758 ) ( CLEAR ?auto_2179752 ) ( LIFTING ?auto_2179756 ?auto_2179753 ) ( IS-CRATE ?auto_2179753 ) ( ON ?auto_2179742 ?auto_2179741 ) ( ON ?auto_2179743 ?auto_2179742 ) ( ON ?auto_2179744 ?auto_2179743 ) ( ON ?auto_2179745 ?auto_2179744 ) ( ON ?auto_2179746 ?auto_2179745 ) ( ON ?auto_2179747 ?auto_2179746 ) ( ON ?auto_2179748 ?auto_2179747 ) ( ON ?auto_2179749 ?auto_2179748 ) ( ON ?auto_2179750 ?auto_2179749 ) ( ON ?auto_2179751 ?auto_2179750 ) ( ON ?auto_2179752 ?auto_2179751 ) ( not ( = ?auto_2179741 ?auto_2179742 ) ) ( not ( = ?auto_2179741 ?auto_2179743 ) ) ( not ( = ?auto_2179741 ?auto_2179744 ) ) ( not ( = ?auto_2179741 ?auto_2179745 ) ) ( not ( = ?auto_2179741 ?auto_2179746 ) ) ( not ( = ?auto_2179741 ?auto_2179747 ) ) ( not ( = ?auto_2179741 ?auto_2179748 ) ) ( not ( = ?auto_2179741 ?auto_2179749 ) ) ( not ( = ?auto_2179741 ?auto_2179750 ) ) ( not ( = ?auto_2179741 ?auto_2179751 ) ) ( not ( = ?auto_2179741 ?auto_2179752 ) ) ( not ( = ?auto_2179741 ?auto_2179753 ) ) ( not ( = ?auto_2179741 ?auto_2179754 ) ) ( not ( = ?auto_2179741 ?auto_2179760 ) ) ( not ( = ?auto_2179742 ?auto_2179743 ) ) ( not ( = ?auto_2179742 ?auto_2179744 ) ) ( not ( = ?auto_2179742 ?auto_2179745 ) ) ( not ( = ?auto_2179742 ?auto_2179746 ) ) ( not ( = ?auto_2179742 ?auto_2179747 ) ) ( not ( = ?auto_2179742 ?auto_2179748 ) ) ( not ( = ?auto_2179742 ?auto_2179749 ) ) ( not ( = ?auto_2179742 ?auto_2179750 ) ) ( not ( = ?auto_2179742 ?auto_2179751 ) ) ( not ( = ?auto_2179742 ?auto_2179752 ) ) ( not ( = ?auto_2179742 ?auto_2179753 ) ) ( not ( = ?auto_2179742 ?auto_2179754 ) ) ( not ( = ?auto_2179742 ?auto_2179760 ) ) ( not ( = ?auto_2179743 ?auto_2179744 ) ) ( not ( = ?auto_2179743 ?auto_2179745 ) ) ( not ( = ?auto_2179743 ?auto_2179746 ) ) ( not ( = ?auto_2179743 ?auto_2179747 ) ) ( not ( = ?auto_2179743 ?auto_2179748 ) ) ( not ( = ?auto_2179743 ?auto_2179749 ) ) ( not ( = ?auto_2179743 ?auto_2179750 ) ) ( not ( = ?auto_2179743 ?auto_2179751 ) ) ( not ( = ?auto_2179743 ?auto_2179752 ) ) ( not ( = ?auto_2179743 ?auto_2179753 ) ) ( not ( = ?auto_2179743 ?auto_2179754 ) ) ( not ( = ?auto_2179743 ?auto_2179760 ) ) ( not ( = ?auto_2179744 ?auto_2179745 ) ) ( not ( = ?auto_2179744 ?auto_2179746 ) ) ( not ( = ?auto_2179744 ?auto_2179747 ) ) ( not ( = ?auto_2179744 ?auto_2179748 ) ) ( not ( = ?auto_2179744 ?auto_2179749 ) ) ( not ( = ?auto_2179744 ?auto_2179750 ) ) ( not ( = ?auto_2179744 ?auto_2179751 ) ) ( not ( = ?auto_2179744 ?auto_2179752 ) ) ( not ( = ?auto_2179744 ?auto_2179753 ) ) ( not ( = ?auto_2179744 ?auto_2179754 ) ) ( not ( = ?auto_2179744 ?auto_2179760 ) ) ( not ( = ?auto_2179745 ?auto_2179746 ) ) ( not ( = ?auto_2179745 ?auto_2179747 ) ) ( not ( = ?auto_2179745 ?auto_2179748 ) ) ( not ( = ?auto_2179745 ?auto_2179749 ) ) ( not ( = ?auto_2179745 ?auto_2179750 ) ) ( not ( = ?auto_2179745 ?auto_2179751 ) ) ( not ( = ?auto_2179745 ?auto_2179752 ) ) ( not ( = ?auto_2179745 ?auto_2179753 ) ) ( not ( = ?auto_2179745 ?auto_2179754 ) ) ( not ( = ?auto_2179745 ?auto_2179760 ) ) ( not ( = ?auto_2179746 ?auto_2179747 ) ) ( not ( = ?auto_2179746 ?auto_2179748 ) ) ( not ( = ?auto_2179746 ?auto_2179749 ) ) ( not ( = ?auto_2179746 ?auto_2179750 ) ) ( not ( = ?auto_2179746 ?auto_2179751 ) ) ( not ( = ?auto_2179746 ?auto_2179752 ) ) ( not ( = ?auto_2179746 ?auto_2179753 ) ) ( not ( = ?auto_2179746 ?auto_2179754 ) ) ( not ( = ?auto_2179746 ?auto_2179760 ) ) ( not ( = ?auto_2179747 ?auto_2179748 ) ) ( not ( = ?auto_2179747 ?auto_2179749 ) ) ( not ( = ?auto_2179747 ?auto_2179750 ) ) ( not ( = ?auto_2179747 ?auto_2179751 ) ) ( not ( = ?auto_2179747 ?auto_2179752 ) ) ( not ( = ?auto_2179747 ?auto_2179753 ) ) ( not ( = ?auto_2179747 ?auto_2179754 ) ) ( not ( = ?auto_2179747 ?auto_2179760 ) ) ( not ( = ?auto_2179748 ?auto_2179749 ) ) ( not ( = ?auto_2179748 ?auto_2179750 ) ) ( not ( = ?auto_2179748 ?auto_2179751 ) ) ( not ( = ?auto_2179748 ?auto_2179752 ) ) ( not ( = ?auto_2179748 ?auto_2179753 ) ) ( not ( = ?auto_2179748 ?auto_2179754 ) ) ( not ( = ?auto_2179748 ?auto_2179760 ) ) ( not ( = ?auto_2179749 ?auto_2179750 ) ) ( not ( = ?auto_2179749 ?auto_2179751 ) ) ( not ( = ?auto_2179749 ?auto_2179752 ) ) ( not ( = ?auto_2179749 ?auto_2179753 ) ) ( not ( = ?auto_2179749 ?auto_2179754 ) ) ( not ( = ?auto_2179749 ?auto_2179760 ) ) ( not ( = ?auto_2179750 ?auto_2179751 ) ) ( not ( = ?auto_2179750 ?auto_2179752 ) ) ( not ( = ?auto_2179750 ?auto_2179753 ) ) ( not ( = ?auto_2179750 ?auto_2179754 ) ) ( not ( = ?auto_2179750 ?auto_2179760 ) ) ( not ( = ?auto_2179751 ?auto_2179752 ) ) ( not ( = ?auto_2179751 ?auto_2179753 ) ) ( not ( = ?auto_2179751 ?auto_2179754 ) ) ( not ( = ?auto_2179751 ?auto_2179760 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179752 ?auto_2179753 ?auto_2179754 )
      ( MAKE-13CRATE-VERIFY ?auto_2179741 ?auto_2179742 ?auto_2179743 ?auto_2179744 ?auto_2179745 ?auto_2179746 ?auto_2179747 ?auto_2179748 ?auto_2179749 ?auto_2179750 ?auto_2179751 ?auto_2179752 ?auto_2179753 ?auto_2179754 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_2179924 - SURFACE
      ?auto_2179925 - SURFACE
      ?auto_2179926 - SURFACE
      ?auto_2179927 - SURFACE
      ?auto_2179928 - SURFACE
      ?auto_2179929 - SURFACE
      ?auto_2179930 - SURFACE
      ?auto_2179931 - SURFACE
      ?auto_2179932 - SURFACE
      ?auto_2179933 - SURFACE
      ?auto_2179934 - SURFACE
      ?auto_2179935 - SURFACE
      ?auto_2179936 - SURFACE
      ?auto_2179937 - SURFACE
    )
    :vars
    (
      ?auto_2179941 - HOIST
      ?auto_2179939 - PLACE
      ?auto_2179943 - PLACE
      ?auto_2179940 - HOIST
      ?auto_2179938 - SURFACE
      ?auto_2179942 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2179941 ?auto_2179939 ) ( IS-CRATE ?auto_2179937 ) ( not ( = ?auto_2179936 ?auto_2179937 ) ) ( not ( = ?auto_2179935 ?auto_2179936 ) ) ( not ( = ?auto_2179935 ?auto_2179937 ) ) ( not ( = ?auto_2179943 ?auto_2179939 ) ) ( HOIST-AT ?auto_2179940 ?auto_2179943 ) ( not ( = ?auto_2179941 ?auto_2179940 ) ) ( AVAILABLE ?auto_2179940 ) ( SURFACE-AT ?auto_2179937 ?auto_2179943 ) ( ON ?auto_2179937 ?auto_2179938 ) ( CLEAR ?auto_2179937 ) ( not ( = ?auto_2179936 ?auto_2179938 ) ) ( not ( = ?auto_2179937 ?auto_2179938 ) ) ( not ( = ?auto_2179935 ?auto_2179938 ) ) ( TRUCK-AT ?auto_2179942 ?auto_2179939 ) ( SURFACE-AT ?auto_2179935 ?auto_2179939 ) ( CLEAR ?auto_2179935 ) ( IS-CRATE ?auto_2179936 ) ( AVAILABLE ?auto_2179941 ) ( IN ?auto_2179936 ?auto_2179942 ) ( ON ?auto_2179925 ?auto_2179924 ) ( ON ?auto_2179926 ?auto_2179925 ) ( ON ?auto_2179927 ?auto_2179926 ) ( ON ?auto_2179928 ?auto_2179927 ) ( ON ?auto_2179929 ?auto_2179928 ) ( ON ?auto_2179930 ?auto_2179929 ) ( ON ?auto_2179931 ?auto_2179930 ) ( ON ?auto_2179932 ?auto_2179931 ) ( ON ?auto_2179933 ?auto_2179932 ) ( ON ?auto_2179934 ?auto_2179933 ) ( ON ?auto_2179935 ?auto_2179934 ) ( not ( = ?auto_2179924 ?auto_2179925 ) ) ( not ( = ?auto_2179924 ?auto_2179926 ) ) ( not ( = ?auto_2179924 ?auto_2179927 ) ) ( not ( = ?auto_2179924 ?auto_2179928 ) ) ( not ( = ?auto_2179924 ?auto_2179929 ) ) ( not ( = ?auto_2179924 ?auto_2179930 ) ) ( not ( = ?auto_2179924 ?auto_2179931 ) ) ( not ( = ?auto_2179924 ?auto_2179932 ) ) ( not ( = ?auto_2179924 ?auto_2179933 ) ) ( not ( = ?auto_2179924 ?auto_2179934 ) ) ( not ( = ?auto_2179924 ?auto_2179935 ) ) ( not ( = ?auto_2179924 ?auto_2179936 ) ) ( not ( = ?auto_2179924 ?auto_2179937 ) ) ( not ( = ?auto_2179924 ?auto_2179938 ) ) ( not ( = ?auto_2179925 ?auto_2179926 ) ) ( not ( = ?auto_2179925 ?auto_2179927 ) ) ( not ( = ?auto_2179925 ?auto_2179928 ) ) ( not ( = ?auto_2179925 ?auto_2179929 ) ) ( not ( = ?auto_2179925 ?auto_2179930 ) ) ( not ( = ?auto_2179925 ?auto_2179931 ) ) ( not ( = ?auto_2179925 ?auto_2179932 ) ) ( not ( = ?auto_2179925 ?auto_2179933 ) ) ( not ( = ?auto_2179925 ?auto_2179934 ) ) ( not ( = ?auto_2179925 ?auto_2179935 ) ) ( not ( = ?auto_2179925 ?auto_2179936 ) ) ( not ( = ?auto_2179925 ?auto_2179937 ) ) ( not ( = ?auto_2179925 ?auto_2179938 ) ) ( not ( = ?auto_2179926 ?auto_2179927 ) ) ( not ( = ?auto_2179926 ?auto_2179928 ) ) ( not ( = ?auto_2179926 ?auto_2179929 ) ) ( not ( = ?auto_2179926 ?auto_2179930 ) ) ( not ( = ?auto_2179926 ?auto_2179931 ) ) ( not ( = ?auto_2179926 ?auto_2179932 ) ) ( not ( = ?auto_2179926 ?auto_2179933 ) ) ( not ( = ?auto_2179926 ?auto_2179934 ) ) ( not ( = ?auto_2179926 ?auto_2179935 ) ) ( not ( = ?auto_2179926 ?auto_2179936 ) ) ( not ( = ?auto_2179926 ?auto_2179937 ) ) ( not ( = ?auto_2179926 ?auto_2179938 ) ) ( not ( = ?auto_2179927 ?auto_2179928 ) ) ( not ( = ?auto_2179927 ?auto_2179929 ) ) ( not ( = ?auto_2179927 ?auto_2179930 ) ) ( not ( = ?auto_2179927 ?auto_2179931 ) ) ( not ( = ?auto_2179927 ?auto_2179932 ) ) ( not ( = ?auto_2179927 ?auto_2179933 ) ) ( not ( = ?auto_2179927 ?auto_2179934 ) ) ( not ( = ?auto_2179927 ?auto_2179935 ) ) ( not ( = ?auto_2179927 ?auto_2179936 ) ) ( not ( = ?auto_2179927 ?auto_2179937 ) ) ( not ( = ?auto_2179927 ?auto_2179938 ) ) ( not ( = ?auto_2179928 ?auto_2179929 ) ) ( not ( = ?auto_2179928 ?auto_2179930 ) ) ( not ( = ?auto_2179928 ?auto_2179931 ) ) ( not ( = ?auto_2179928 ?auto_2179932 ) ) ( not ( = ?auto_2179928 ?auto_2179933 ) ) ( not ( = ?auto_2179928 ?auto_2179934 ) ) ( not ( = ?auto_2179928 ?auto_2179935 ) ) ( not ( = ?auto_2179928 ?auto_2179936 ) ) ( not ( = ?auto_2179928 ?auto_2179937 ) ) ( not ( = ?auto_2179928 ?auto_2179938 ) ) ( not ( = ?auto_2179929 ?auto_2179930 ) ) ( not ( = ?auto_2179929 ?auto_2179931 ) ) ( not ( = ?auto_2179929 ?auto_2179932 ) ) ( not ( = ?auto_2179929 ?auto_2179933 ) ) ( not ( = ?auto_2179929 ?auto_2179934 ) ) ( not ( = ?auto_2179929 ?auto_2179935 ) ) ( not ( = ?auto_2179929 ?auto_2179936 ) ) ( not ( = ?auto_2179929 ?auto_2179937 ) ) ( not ( = ?auto_2179929 ?auto_2179938 ) ) ( not ( = ?auto_2179930 ?auto_2179931 ) ) ( not ( = ?auto_2179930 ?auto_2179932 ) ) ( not ( = ?auto_2179930 ?auto_2179933 ) ) ( not ( = ?auto_2179930 ?auto_2179934 ) ) ( not ( = ?auto_2179930 ?auto_2179935 ) ) ( not ( = ?auto_2179930 ?auto_2179936 ) ) ( not ( = ?auto_2179930 ?auto_2179937 ) ) ( not ( = ?auto_2179930 ?auto_2179938 ) ) ( not ( = ?auto_2179931 ?auto_2179932 ) ) ( not ( = ?auto_2179931 ?auto_2179933 ) ) ( not ( = ?auto_2179931 ?auto_2179934 ) ) ( not ( = ?auto_2179931 ?auto_2179935 ) ) ( not ( = ?auto_2179931 ?auto_2179936 ) ) ( not ( = ?auto_2179931 ?auto_2179937 ) ) ( not ( = ?auto_2179931 ?auto_2179938 ) ) ( not ( = ?auto_2179932 ?auto_2179933 ) ) ( not ( = ?auto_2179932 ?auto_2179934 ) ) ( not ( = ?auto_2179932 ?auto_2179935 ) ) ( not ( = ?auto_2179932 ?auto_2179936 ) ) ( not ( = ?auto_2179932 ?auto_2179937 ) ) ( not ( = ?auto_2179932 ?auto_2179938 ) ) ( not ( = ?auto_2179933 ?auto_2179934 ) ) ( not ( = ?auto_2179933 ?auto_2179935 ) ) ( not ( = ?auto_2179933 ?auto_2179936 ) ) ( not ( = ?auto_2179933 ?auto_2179937 ) ) ( not ( = ?auto_2179933 ?auto_2179938 ) ) ( not ( = ?auto_2179934 ?auto_2179935 ) ) ( not ( = ?auto_2179934 ?auto_2179936 ) ) ( not ( = ?auto_2179934 ?auto_2179937 ) ) ( not ( = ?auto_2179934 ?auto_2179938 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2179935 ?auto_2179936 ?auto_2179937 )
      ( MAKE-13CRATE-VERIFY ?auto_2179924 ?auto_2179925 ?auto_2179926 ?auto_2179927 ?auto_2179928 ?auto_2179929 ?auto_2179930 ?auto_2179931 ?auto_2179932 ?auto_2179933 ?auto_2179934 ?auto_2179935 ?auto_2179936 ?auto_2179937 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194107 - SURFACE
      ?auto_2194108 - SURFACE
      ?auto_2194109 - SURFACE
      ?auto_2194110 - SURFACE
      ?auto_2194111 - SURFACE
      ?auto_2194112 - SURFACE
      ?auto_2194113 - SURFACE
      ?auto_2194114 - SURFACE
      ?auto_2194115 - SURFACE
      ?auto_2194116 - SURFACE
      ?auto_2194117 - SURFACE
      ?auto_2194118 - SURFACE
      ?auto_2194119 - SURFACE
      ?auto_2194120 - SURFACE
      ?auto_2194121 - SURFACE
    )
    :vars
    (
      ?auto_2194122 - HOIST
      ?auto_2194123 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194122 ?auto_2194123 ) ( SURFACE-AT ?auto_2194120 ?auto_2194123 ) ( CLEAR ?auto_2194120 ) ( LIFTING ?auto_2194122 ?auto_2194121 ) ( IS-CRATE ?auto_2194121 ) ( not ( = ?auto_2194120 ?auto_2194121 ) ) ( ON ?auto_2194108 ?auto_2194107 ) ( ON ?auto_2194109 ?auto_2194108 ) ( ON ?auto_2194110 ?auto_2194109 ) ( ON ?auto_2194111 ?auto_2194110 ) ( ON ?auto_2194112 ?auto_2194111 ) ( ON ?auto_2194113 ?auto_2194112 ) ( ON ?auto_2194114 ?auto_2194113 ) ( ON ?auto_2194115 ?auto_2194114 ) ( ON ?auto_2194116 ?auto_2194115 ) ( ON ?auto_2194117 ?auto_2194116 ) ( ON ?auto_2194118 ?auto_2194117 ) ( ON ?auto_2194119 ?auto_2194118 ) ( ON ?auto_2194120 ?auto_2194119 ) ( not ( = ?auto_2194107 ?auto_2194108 ) ) ( not ( = ?auto_2194107 ?auto_2194109 ) ) ( not ( = ?auto_2194107 ?auto_2194110 ) ) ( not ( = ?auto_2194107 ?auto_2194111 ) ) ( not ( = ?auto_2194107 ?auto_2194112 ) ) ( not ( = ?auto_2194107 ?auto_2194113 ) ) ( not ( = ?auto_2194107 ?auto_2194114 ) ) ( not ( = ?auto_2194107 ?auto_2194115 ) ) ( not ( = ?auto_2194107 ?auto_2194116 ) ) ( not ( = ?auto_2194107 ?auto_2194117 ) ) ( not ( = ?auto_2194107 ?auto_2194118 ) ) ( not ( = ?auto_2194107 ?auto_2194119 ) ) ( not ( = ?auto_2194107 ?auto_2194120 ) ) ( not ( = ?auto_2194107 ?auto_2194121 ) ) ( not ( = ?auto_2194108 ?auto_2194109 ) ) ( not ( = ?auto_2194108 ?auto_2194110 ) ) ( not ( = ?auto_2194108 ?auto_2194111 ) ) ( not ( = ?auto_2194108 ?auto_2194112 ) ) ( not ( = ?auto_2194108 ?auto_2194113 ) ) ( not ( = ?auto_2194108 ?auto_2194114 ) ) ( not ( = ?auto_2194108 ?auto_2194115 ) ) ( not ( = ?auto_2194108 ?auto_2194116 ) ) ( not ( = ?auto_2194108 ?auto_2194117 ) ) ( not ( = ?auto_2194108 ?auto_2194118 ) ) ( not ( = ?auto_2194108 ?auto_2194119 ) ) ( not ( = ?auto_2194108 ?auto_2194120 ) ) ( not ( = ?auto_2194108 ?auto_2194121 ) ) ( not ( = ?auto_2194109 ?auto_2194110 ) ) ( not ( = ?auto_2194109 ?auto_2194111 ) ) ( not ( = ?auto_2194109 ?auto_2194112 ) ) ( not ( = ?auto_2194109 ?auto_2194113 ) ) ( not ( = ?auto_2194109 ?auto_2194114 ) ) ( not ( = ?auto_2194109 ?auto_2194115 ) ) ( not ( = ?auto_2194109 ?auto_2194116 ) ) ( not ( = ?auto_2194109 ?auto_2194117 ) ) ( not ( = ?auto_2194109 ?auto_2194118 ) ) ( not ( = ?auto_2194109 ?auto_2194119 ) ) ( not ( = ?auto_2194109 ?auto_2194120 ) ) ( not ( = ?auto_2194109 ?auto_2194121 ) ) ( not ( = ?auto_2194110 ?auto_2194111 ) ) ( not ( = ?auto_2194110 ?auto_2194112 ) ) ( not ( = ?auto_2194110 ?auto_2194113 ) ) ( not ( = ?auto_2194110 ?auto_2194114 ) ) ( not ( = ?auto_2194110 ?auto_2194115 ) ) ( not ( = ?auto_2194110 ?auto_2194116 ) ) ( not ( = ?auto_2194110 ?auto_2194117 ) ) ( not ( = ?auto_2194110 ?auto_2194118 ) ) ( not ( = ?auto_2194110 ?auto_2194119 ) ) ( not ( = ?auto_2194110 ?auto_2194120 ) ) ( not ( = ?auto_2194110 ?auto_2194121 ) ) ( not ( = ?auto_2194111 ?auto_2194112 ) ) ( not ( = ?auto_2194111 ?auto_2194113 ) ) ( not ( = ?auto_2194111 ?auto_2194114 ) ) ( not ( = ?auto_2194111 ?auto_2194115 ) ) ( not ( = ?auto_2194111 ?auto_2194116 ) ) ( not ( = ?auto_2194111 ?auto_2194117 ) ) ( not ( = ?auto_2194111 ?auto_2194118 ) ) ( not ( = ?auto_2194111 ?auto_2194119 ) ) ( not ( = ?auto_2194111 ?auto_2194120 ) ) ( not ( = ?auto_2194111 ?auto_2194121 ) ) ( not ( = ?auto_2194112 ?auto_2194113 ) ) ( not ( = ?auto_2194112 ?auto_2194114 ) ) ( not ( = ?auto_2194112 ?auto_2194115 ) ) ( not ( = ?auto_2194112 ?auto_2194116 ) ) ( not ( = ?auto_2194112 ?auto_2194117 ) ) ( not ( = ?auto_2194112 ?auto_2194118 ) ) ( not ( = ?auto_2194112 ?auto_2194119 ) ) ( not ( = ?auto_2194112 ?auto_2194120 ) ) ( not ( = ?auto_2194112 ?auto_2194121 ) ) ( not ( = ?auto_2194113 ?auto_2194114 ) ) ( not ( = ?auto_2194113 ?auto_2194115 ) ) ( not ( = ?auto_2194113 ?auto_2194116 ) ) ( not ( = ?auto_2194113 ?auto_2194117 ) ) ( not ( = ?auto_2194113 ?auto_2194118 ) ) ( not ( = ?auto_2194113 ?auto_2194119 ) ) ( not ( = ?auto_2194113 ?auto_2194120 ) ) ( not ( = ?auto_2194113 ?auto_2194121 ) ) ( not ( = ?auto_2194114 ?auto_2194115 ) ) ( not ( = ?auto_2194114 ?auto_2194116 ) ) ( not ( = ?auto_2194114 ?auto_2194117 ) ) ( not ( = ?auto_2194114 ?auto_2194118 ) ) ( not ( = ?auto_2194114 ?auto_2194119 ) ) ( not ( = ?auto_2194114 ?auto_2194120 ) ) ( not ( = ?auto_2194114 ?auto_2194121 ) ) ( not ( = ?auto_2194115 ?auto_2194116 ) ) ( not ( = ?auto_2194115 ?auto_2194117 ) ) ( not ( = ?auto_2194115 ?auto_2194118 ) ) ( not ( = ?auto_2194115 ?auto_2194119 ) ) ( not ( = ?auto_2194115 ?auto_2194120 ) ) ( not ( = ?auto_2194115 ?auto_2194121 ) ) ( not ( = ?auto_2194116 ?auto_2194117 ) ) ( not ( = ?auto_2194116 ?auto_2194118 ) ) ( not ( = ?auto_2194116 ?auto_2194119 ) ) ( not ( = ?auto_2194116 ?auto_2194120 ) ) ( not ( = ?auto_2194116 ?auto_2194121 ) ) ( not ( = ?auto_2194117 ?auto_2194118 ) ) ( not ( = ?auto_2194117 ?auto_2194119 ) ) ( not ( = ?auto_2194117 ?auto_2194120 ) ) ( not ( = ?auto_2194117 ?auto_2194121 ) ) ( not ( = ?auto_2194118 ?auto_2194119 ) ) ( not ( = ?auto_2194118 ?auto_2194120 ) ) ( not ( = ?auto_2194118 ?auto_2194121 ) ) ( not ( = ?auto_2194119 ?auto_2194120 ) ) ( not ( = ?auto_2194119 ?auto_2194121 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2194120 ?auto_2194121 )
      ( MAKE-14CRATE-VERIFY ?auto_2194107 ?auto_2194108 ?auto_2194109 ?auto_2194110 ?auto_2194111 ?auto_2194112 ?auto_2194113 ?auto_2194114 ?auto_2194115 ?auto_2194116 ?auto_2194117 ?auto_2194118 ?auto_2194119 ?auto_2194120 ?auto_2194121 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194267 - SURFACE
      ?auto_2194268 - SURFACE
      ?auto_2194269 - SURFACE
      ?auto_2194270 - SURFACE
      ?auto_2194271 - SURFACE
      ?auto_2194272 - SURFACE
      ?auto_2194273 - SURFACE
      ?auto_2194274 - SURFACE
      ?auto_2194275 - SURFACE
      ?auto_2194276 - SURFACE
      ?auto_2194277 - SURFACE
      ?auto_2194278 - SURFACE
      ?auto_2194279 - SURFACE
      ?auto_2194280 - SURFACE
      ?auto_2194281 - SURFACE
    )
    :vars
    (
      ?auto_2194282 - HOIST
      ?auto_2194284 - PLACE
      ?auto_2194283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194282 ?auto_2194284 ) ( SURFACE-AT ?auto_2194280 ?auto_2194284 ) ( CLEAR ?auto_2194280 ) ( IS-CRATE ?auto_2194281 ) ( not ( = ?auto_2194280 ?auto_2194281 ) ) ( TRUCK-AT ?auto_2194283 ?auto_2194284 ) ( AVAILABLE ?auto_2194282 ) ( IN ?auto_2194281 ?auto_2194283 ) ( ON ?auto_2194280 ?auto_2194279 ) ( not ( = ?auto_2194279 ?auto_2194280 ) ) ( not ( = ?auto_2194279 ?auto_2194281 ) ) ( ON ?auto_2194268 ?auto_2194267 ) ( ON ?auto_2194269 ?auto_2194268 ) ( ON ?auto_2194270 ?auto_2194269 ) ( ON ?auto_2194271 ?auto_2194270 ) ( ON ?auto_2194272 ?auto_2194271 ) ( ON ?auto_2194273 ?auto_2194272 ) ( ON ?auto_2194274 ?auto_2194273 ) ( ON ?auto_2194275 ?auto_2194274 ) ( ON ?auto_2194276 ?auto_2194275 ) ( ON ?auto_2194277 ?auto_2194276 ) ( ON ?auto_2194278 ?auto_2194277 ) ( ON ?auto_2194279 ?auto_2194278 ) ( not ( = ?auto_2194267 ?auto_2194268 ) ) ( not ( = ?auto_2194267 ?auto_2194269 ) ) ( not ( = ?auto_2194267 ?auto_2194270 ) ) ( not ( = ?auto_2194267 ?auto_2194271 ) ) ( not ( = ?auto_2194267 ?auto_2194272 ) ) ( not ( = ?auto_2194267 ?auto_2194273 ) ) ( not ( = ?auto_2194267 ?auto_2194274 ) ) ( not ( = ?auto_2194267 ?auto_2194275 ) ) ( not ( = ?auto_2194267 ?auto_2194276 ) ) ( not ( = ?auto_2194267 ?auto_2194277 ) ) ( not ( = ?auto_2194267 ?auto_2194278 ) ) ( not ( = ?auto_2194267 ?auto_2194279 ) ) ( not ( = ?auto_2194267 ?auto_2194280 ) ) ( not ( = ?auto_2194267 ?auto_2194281 ) ) ( not ( = ?auto_2194268 ?auto_2194269 ) ) ( not ( = ?auto_2194268 ?auto_2194270 ) ) ( not ( = ?auto_2194268 ?auto_2194271 ) ) ( not ( = ?auto_2194268 ?auto_2194272 ) ) ( not ( = ?auto_2194268 ?auto_2194273 ) ) ( not ( = ?auto_2194268 ?auto_2194274 ) ) ( not ( = ?auto_2194268 ?auto_2194275 ) ) ( not ( = ?auto_2194268 ?auto_2194276 ) ) ( not ( = ?auto_2194268 ?auto_2194277 ) ) ( not ( = ?auto_2194268 ?auto_2194278 ) ) ( not ( = ?auto_2194268 ?auto_2194279 ) ) ( not ( = ?auto_2194268 ?auto_2194280 ) ) ( not ( = ?auto_2194268 ?auto_2194281 ) ) ( not ( = ?auto_2194269 ?auto_2194270 ) ) ( not ( = ?auto_2194269 ?auto_2194271 ) ) ( not ( = ?auto_2194269 ?auto_2194272 ) ) ( not ( = ?auto_2194269 ?auto_2194273 ) ) ( not ( = ?auto_2194269 ?auto_2194274 ) ) ( not ( = ?auto_2194269 ?auto_2194275 ) ) ( not ( = ?auto_2194269 ?auto_2194276 ) ) ( not ( = ?auto_2194269 ?auto_2194277 ) ) ( not ( = ?auto_2194269 ?auto_2194278 ) ) ( not ( = ?auto_2194269 ?auto_2194279 ) ) ( not ( = ?auto_2194269 ?auto_2194280 ) ) ( not ( = ?auto_2194269 ?auto_2194281 ) ) ( not ( = ?auto_2194270 ?auto_2194271 ) ) ( not ( = ?auto_2194270 ?auto_2194272 ) ) ( not ( = ?auto_2194270 ?auto_2194273 ) ) ( not ( = ?auto_2194270 ?auto_2194274 ) ) ( not ( = ?auto_2194270 ?auto_2194275 ) ) ( not ( = ?auto_2194270 ?auto_2194276 ) ) ( not ( = ?auto_2194270 ?auto_2194277 ) ) ( not ( = ?auto_2194270 ?auto_2194278 ) ) ( not ( = ?auto_2194270 ?auto_2194279 ) ) ( not ( = ?auto_2194270 ?auto_2194280 ) ) ( not ( = ?auto_2194270 ?auto_2194281 ) ) ( not ( = ?auto_2194271 ?auto_2194272 ) ) ( not ( = ?auto_2194271 ?auto_2194273 ) ) ( not ( = ?auto_2194271 ?auto_2194274 ) ) ( not ( = ?auto_2194271 ?auto_2194275 ) ) ( not ( = ?auto_2194271 ?auto_2194276 ) ) ( not ( = ?auto_2194271 ?auto_2194277 ) ) ( not ( = ?auto_2194271 ?auto_2194278 ) ) ( not ( = ?auto_2194271 ?auto_2194279 ) ) ( not ( = ?auto_2194271 ?auto_2194280 ) ) ( not ( = ?auto_2194271 ?auto_2194281 ) ) ( not ( = ?auto_2194272 ?auto_2194273 ) ) ( not ( = ?auto_2194272 ?auto_2194274 ) ) ( not ( = ?auto_2194272 ?auto_2194275 ) ) ( not ( = ?auto_2194272 ?auto_2194276 ) ) ( not ( = ?auto_2194272 ?auto_2194277 ) ) ( not ( = ?auto_2194272 ?auto_2194278 ) ) ( not ( = ?auto_2194272 ?auto_2194279 ) ) ( not ( = ?auto_2194272 ?auto_2194280 ) ) ( not ( = ?auto_2194272 ?auto_2194281 ) ) ( not ( = ?auto_2194273 ?auto_2194274 ) ) ( not ( = ?auto_2194273 ?auto_2194275 ) ) ( not ( = ?auto_2194273 ?auto_2194276 ) ) ( not ( = ?auto_2194273 ?auto_2194277 ) ) ( not ( = ?auto_2194273 ?auto_2194278 ) ) ( not ( = ?auto_2194273 ?auto_2194279 ) ) ( not ( = ?auto_2194273 ?auto_2194280 ) ) ( not ( = ?auto_2194273 ?auto_2194281 ) ) ( not ( = ?auto_2194274 ?auto_2194275 ) ) ( not ( = ?auto_2194274 ?auto_2194276 ) ) ( not ( = ?auto_2194274 ?auto_2194277 ) ) ( not ( = ?auto_2194274 ?auto_2194278 ) ) ( not ( = ?auto_2194274 ?auto_2194279 ) ) ( not ( = ?auto_2194274 ?auto_2194280 ) ) ( not ( = ?auto_2194274 ?auto_2194281 ) ) ( not ( = ?auto_2194275 ?auto_2194276 ) ) ( not ( = ?auto_2194275 ?auto_2194277 ) ) ( not ( = ?auto_2194275 ?auto_2194278 ) ) ( not ( = ?auto_2194275 ?auto_2194279 ) ) ( not ( = ?auto_2194275 ?auto_2194280 ) ) ( not ( = ?auto_2194275 ?auto_2194281 ) ) ( not ( = ?auto_2194276 ?auto_2194277 ) ) ( not ( = ?auto_2194276 ?auto_2194278 ) ) ( not ( = ?auto_2194276 ?auto_2194279 ) ) ( not ( = ?auto_2194276 ?auto_2194280 ) ) ( not ( = ?auto_2194276 ?auto_2194281 ) ) ( not ( = ?auto_2194277 ?auto_2194278 ) ) ( not ( = ?auto_2194277 ?auto_2194279 ) ) ( not ( = ?auto_2194277 ?auto_2194280 ) ) ( not ( = ?auto_2194277 ?auto_2194281 ) ) ( not ( = ?auto_2194278 ?auto_2194279 ) ) ( not ( = ?auto_2194278 ?auto_2194280 ) ) ( not ( = ?auto_2194278 ?auto_2194281 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194279 ?auto_2194280 ?auto_2194281 )
      ( MAKE-14CRATE-VERIFY ?auto_2194267 ?auto_2194268 ?auto_2194269 ?auto_2194270 ?auto_2194271 ?auto_2194272 ?auto_2194273 ?auto_2194274 ?auto_2194275 ?auto_2194276 ?auto_2194277 ?auto_2194278 ?auto_2194279 ?auto_2194280 ?auto_2194281 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194442 - SURFACE
      ?auto_2194443 - SURFACE
      ?auto_2194444 - SURFACE
      ?auto_2194445 - SURFACE
      ?auto_2194446 - SURFACE
      ?auto_2194447 - SURFACE
      ?auto_2194448 - SURFACE
      ?auto_2194449 - SURFACE
      ?auto_2194450 - SURFACE
      ?auto_2194451 - SURFACE
      ?auto_2194452 - SURFACE
      ?auto_2194453 - SURFACE
      ?auto_2194454 - SURFACE
      ?auto_2194455 - SURFACE
      ?auto_2194456 - SURFACE
    )
    :vars
    (
      ?auto_2194458 - HOIST
      ?auto_2194457 - PLACE
      ?auto_2194459 - TRUCK
      ?auto_2194460 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194458 ?auto_2194457 ) ( SURFACE-AT ?auto_2194455 ?auto_2194457 ) ( CLEAR ?auto_2194455 ) ( IS-CRATE ?auto_2194456 ) ( not ( = ?auto_2194455 ?auto_2194456 ) ) ( AVAILABLE ?auto_2194458 ) ( IN ?auto_2194456 ?auto_2194459 ) ( ON ?auto_2194455 ?auto_2194454 ) ( not ( = ?auto_2194454 ?auto_2194455 ) ) ( not ( = ?auto_2194454 ?auto_2194456 ) ) ( TRUCK-AT ?auto_2194459 ?auto_2194460 ) ( not ( = ?auto_2194460 ?auto_2194457 ) ) ( ON ?auto_2194443 ?auto_2194442 ) ( ON ?auto_2194444 ?auto_2194443 ) ( ON ?auto_2194445 ?auto_2194444 ) ( ON ?auto_2194446 ?auto_2194445 ) ( ON ?auto_2194447 ?auto_2194446 ) ( ON ?auto_2194448 ?auto_2194447 ) ( ON ?auto_2194449 ?auto_2194448 ) ( ON ?auto_2194450 ?auto_2194449 ) ( ON ?auto_2194451 ?auto_2194450 ) ( ON ?auto_2194452 ?auto_2194451 ) ( ON ?auto_2194453 ?auto_2194452 ) ( ON ?auto_2194454 ?auto_2194453 ) ( not ( = ?auto_2194442 ?auto_2194443 ) ) ( not ( = ?auto_2194442 ?auto_2194444 ) ) ( not ( = ?auto_2194442 ?auto_2194445 ) ) ( not ( = ?auto_2194442 ?auto_2194446 ) ) ( not ( = ?auto_2194442 ?auto_2194447 ) ) ( not ( = ?auto_2194442 ?auto_2194448 ) ) ( not ( = ?auto_2194442 ?auto_2194449 ) ) ( not ( = ?auto_2194442 ?auto_2194450 ) ) ( not ( = ?auto_2194442 ?auto_2194451 ) ) ( not ( = ?auto_2194442 ?auto_2194452 ) ) ( not ( = ?auto_2194442 ?auto_2194453 ) ) ( not ( = ?auto_2194442 ?auto_2194454 ) ) ( not ( = ?auto_2194442 ?auto_2194455 ) ) ( not ( = ?auto_2194442 ?auto_2194456 ) ) ( not ( = ?auto_2194443 ?auto_2194444 ) ) ( not ( = ?auto_2194443 ?auto_2194445 ) ) ( not ( = ?auto_2194443 ?auto_2194446 ) ) ( not ( = ?auto_2194443 ?auto_2194447 ) ) ( not ( = ?auto_2194443 ?auto_2194448 ) ) ( not ( = ?auto_2194443 ?auto_2194449 ) ) ( not ( = ?auto_2194443 ?auto_2194450 ) ) ( not ( = ?auto_2194443 ?auto_2194451 ) ) ( not ( = ?auto_2194443 ?auto_2194452 ) ) ( not ( = ?auto_2194443 ?auto_2194453 ) ) ( not ( = ?auto_2194443 ?auto_2194454 ) ) ( not ( = ?auto_2194443 ?auto_2194455 ) ) ( not ( = ?auto_2194443 ?auto_2194456 ) ) ( not ( = ?auto_2194444 ?auto_2194445 ) ) ( not ( = ?auto_2194444 ?auto_2194446 ) ) ( not ( = ?auto_2194444 ?auto_2194447 ) ) ( not ( = ?auto_2194444 ?auto_2194448 ) ) ( not ( = ?auto_2194444 ?auto_2194449 ) ) ( not ( = ?auto_2194444 ?auto_2194450 ) ) ( not ( = ?auto_2194444 ?auto_2194451 ) ) ( not ( = ?auto_2194444 ?auto_2194452 ) ) ( not ( = ?auto_2194444 ?auto_2194453 ) ) ( not ( = ?auto_2194444 ?auto_2194454 ) ) ( not ( = ?auto_2194444 ?auto_2194455 ) ) ( not ( = ?auto_2194444 ?auto_2194456 ) ) ( not ( = ?auto_2194445 ?auto_2194446 ) ) ( not ( = ?auto_2194445 ?auto_2194447 ) ) ( not ( = ?auto_2194445 ?auto_2194448 ) ) ( not ( = ?auto_2194445 ?auto_2194449 ) ) ( not ( = ?auto_2194445 ?auto_2194450 ) ) ( not ( = ?auto_2194445 ?auto_2194451 ) ) ( not ( = ?auto_2194445 ?auto_2194452 ) ) ( not ( = ?auto_2194445 ?auto_2194453 ) ) ( not ( = ?auto_2194445 ?auto_2194454 ) ) ( not ( = ?auto_2194445 ?auto_2194455 ) ) ( not ( = ?auto_2194445 ?auto_2194456 ) ) ( not ( = ?auto_2194446 ?auto_2194447 ) ) ( not ( = ?auto_2194446 ?auto_2194448 ) ) ( not ( = ?auto_2194446 ?auto_2194449 ) ) ( not ( = ?auto_2194446 ?auto_2194450 ) ) ( not ( = ?auto_2194446 ?auto_2194451 ) ) ( not ( = ?auto_2194446 ?auto_2194452 ) ) ( not ( = ?auto_2194446 ?auto_2194453 ) ) ( not ( = ?auto_2194446 ?auto_2194454 ) ) ( not ( = ?auto_2194446 ?auto_2194455 ) ) ( not ( = ?auto_2194446 ?auto_2194456 ) ) ( not ( = ?auto_2194447 ?auto_2194448 ) ) ( not ( = ?auto_2194447 ?auto_2194449 ) ) ( not ( = ?auto_2194447 ?auto_2194450 ) ) ( not ( = ?auto_2194447 ?auto_2194451 ) ) ( not ( = ?auto_2194447 ?auto_2194452 ) ) ( not ( = ?auto_2194447 ?auto_2194453 ) ) ( not ( = ?auto_2194447 ?auto_2194454 ) ) ( not ( = ?auto_2194447 ?auto_2194455 ) ) ( not ( = ?auto_2194447 ?auto_2194456 ) ) ( not ( = ?auto_2194448 ?auto_2194449 ) ) ( not ( = ?auto_2194448 ?auto_2194450 ) ) ( not ( = ?auto_2194448 ?auto_2194451 ) ) ( not ( = ?auto_2194448 ?auto_2194452 ) ) ( not ( = ?auto_2194448 ?auto_2194453 ) ) ( not ( = ?auto_2194448 ?auto_2194454 ) ) ( not ( = ?auto_2194448 ?auto_2194455 ) ) ( not ( = ?auto_2194448 ?auto_2194456 ) ) ( not ( = ?auto_2194449 ?auto_2194450 ) ) ( not ( = ?auto_2194449 ?auto_2194451 ) ) ( not ( = ?auto_2194449 ?auto_2194452 ) ) ( not ( = ?auto_2194449 ?auto_2194453 ) ) ( not ( = ?auto_2194449 ?auto_2194454 ) ) ( not ( = ?auto_2194449 ?auto_2194455 ) ) ( not ( = ?auto_2194449 ?auto_2194456 ) ) ( not ( = ?auto_2194450 ?auto_2194451 ) ) ( not ( = ?auto_2194450 ?auto_2194452 ) ) ( not ( = ?auto_2194450 ?auto_2194453 ) ) ( not ( = ?auto_2194450 ?auto_2194454 ) ) ( not ( = ?auto_2194450 ?auto_2194455 ) ) ( not ( = ?auto_2194450 ?auto_2194456 ) ) ( not ( = ?auto_2194451 ?auto_2194452 ) ) ( not ( = ?auto_2194451 ?auto_2194453 ) ) ( not ( = ?auto_2194451 ?auto_2194454 ) ) ( not ( = ?auto_2194451 ?auto_2194455 ) ) ( not ( = ?auto_2194451 ?auto_2194456 ) ) ( not ( = ?auto_2194452 ?auto_2194453 ) ) ( not ( = ?auto_2194452 ?auto_2194454 ) ) ( not ( = ?auto_2194452 ?auto_2194455 ) ) ( not ( = ?auto_2194452 ?auto_2194456 ) ) ( not ( = ?auto_2194453 ?auto_2194454 ) ) ( not ( = ?auto_2194453 ?auto_2194455 ) ) ( not ( = ?auto_2194453 ?auto_2194456 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194454 ?auto_2194455 ?auto_2194456 )
      ( MAKE-14CRATE-VERIFY ?auto_2194442 ?auto_2194443 ?auto_2194444 ?auto_2194445 ?auto_2194446 ?auto_2194447 ?auto_2194448 ?auto_2194449 ?auto_2194450 ?auto_2194451 ?auto_2194452 ?auto_2194453 ?auto_2194454 ?auto_2194455 ?auto_2194456 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194631 - SURFACE
      ?auto_2194632 - SURFACE
      ?auto_2194633 - SURFACE
      ?auto_2194634 - SURFACE
      ?auto_2194635 - SURFACE
      ?auto_2194636 - SURFACE
      ?auto_2194637 - SURFACE
      ?auto_2194638 - SURFACE
      ?auto_2194639 - SURFACE
      ?auto_2194640 - SURFACE
      ?auto_2194641 - SURFACE
      ?auto_2194642 - SURFACE
      ?auto_2194643 - SURFACE
      ?auto_2194644 - SURFACE
      ?auto_2194645 - SURFACE
    )
    :vars
    (
      ?auto_2194650 - HOIST
      ?auto_2194649 - PLACE
      ?auto_2194648 - TRUCK
      ?auto_2194646 - PLACE
      ?auto_2194647 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194650 ?auto_2194649 ) ( SURFACE-AT ?auto_2194644 ?auto_2194649 ) ( CLEAR ?auto_2194644 ) ( IS-CRATE ?auto_2194645 ) ( not ( = ?auto_2194644 ?auto_2194645 ) ) ( AVAILABLE ?auto_2194650 ) ( ON ?auto_2194644 ?auto_2194643 ) ( not ( = ?auto_2194643 ?auto_2194644 ) ) ( not ( = ?auto_2194643 ?auto_2194645 ) ) ( TRUCK-AT ?auto_2194648 ?auto_2194646 ) ( not ( = ?auto_2194646 ?auto_2194649 ) ) ( HOIST-AT ?auto_2194647 ?auto_2194646 ) ( LIFTING ?auto_2194647 ?auto_2194645 ) ( not ( = ?auto_2194650 ?auto_2194647 ) ) ( ON ?auto_2194632 ?auto_2194631 ) ( ON ?auto_2194633 ?auto_2194632 ) ( ON ?auto_2194634 ?auto_2194633 ) ( ON ?auto_2194635 ?auto_2194634 ) ( ON ?auto_2194636 ?auto_2194635 ) ( ON ?auto_2194637 ?auto_2194636 ) ( ON ?auto_2194638 ?auto_2194637 ) ( ON ?auto_2194639 ?auto_2194638 ) ( ON ?auto_2194640 ?auto_2194639 ) ( ON ?auto_2194641 ?auto_2194640 ) ( ON ?auto_2194642 ?auto_2194641 ) ( ON ?auto_2194643 ?auto_2194642 ) ( not ( = ?auto_2194631 ?auto_2194632 ) ) ( not ( = ?auto_2194631 ?auto_2194633 ) ) ( not ( = ?auto_2194631 ?auto_2194634 ) ) ( not ( = ?auto_2194631 ?auto_2194635 ) ) ( not ( = ?auto_2194631 ?auto_2194636 ) ) ( not ( = ?auto_2194631 ?auto_2194637 ) ) ( not ( = ?auto_2194631 ?auto_2194638 ) ) ( not ( = ?auto_2194631 ?auto_2194639 ) ) ( not ( = ?auto_2194631 ?auto_2194640 ) ) ( not ( = ?auto_2194631 ?auto_2194641 ) ) ( not ( = ?auto_2194631 ?auto_2194642 ) ) ( not ( = ?auto_2194631 ?auto_2194643 ) ) ( not ( = ?auto_2194631 ?auto_2194644 ) ) ( not ( = ?auto_2194631 ?auto_2194645 ) ) ( not ( = ?auto_2194632 ?auto_2194633 ) ) ( not ( = ?auto_2194632 ?auto_2194634 ) ) ( not ( = ?auto_2194632 ?auto_2194635 ) ) ( not ( = ?auto_2194632 ?auto_2194636 ) ) ( not ( = ?auto_2194632 ?auto_2194637 ) ) ( not ( = ?auto_2194632 ?auto_2194638 ) ) ( not ( = ?auto_2194632 ?auto_2194639 ) ) ( not ( = ?auto_2194632 ?auto_2194640 ) ) ( not ( = ?auto_2194632 ?auto_2194641 ) ) ( not ( = ?auto_2194632 ?auto_2194642 ) ) ( not ( = ?auto_2194632 ?auto_2194643 ) ) ( not ( = ?auto_2194632 ?auto_2194644 ) ) ( not ( = ?auto_2194632 ?auto_2194645 ) ) ( not ( = ?auto_2194633 ?auto_2194634 ) ) ( not ( = ?auto_2194633 ?auto_2194635 ) ) ( not ( = ?auto_2194633 ?auto_2194636 ) ) ( not ( = ?auto_2194633 ?auto_2194637 ) ) ( not ( = ?auto_2194633 ?auto_2194638 ) ) ( not ( = ?auto_2194633 ?auto_2194639 ) ) ( not ( = ?auto_2194633 ?auto_2194640 ) ) ( not ( = ?auto_2194633 ?auto_2194641 ) ) ( not ( = ?auto_2194633 ?auto_2194642 ) ) ( not ( = ?auto_2194633 ?auto_2194643 ) ) ( not ( = ?auto_2194633 ?auto_2194644 ) ) ( not ( = ?auto_2194633 ?auto_2194645 ) ) ( not ( = ?auto_2194634 ?auto_2194635 ) ) ( not ( = ?auto_2194634 ?auto_2194636 ) ) ( not ( = ?auto_2194634 ?auto_2194637 ) ) ( not ( = ?auto_2194634 ?auto_2194638 ) ) ( not ( = ?auto_2194634 ?auto_2194639 ) ) ( not ( = ?auto_2194634 ?auto_2194640 ) ) ( not ( = ?auto_2194634 ?auto_2194641 ) ) ( not ( = ?auto_2194634 ?auto_2194642 ) ) ( not ( = ?auto_2194634 ?auto_2194643 ) ) ( not ( = ?auto_2194634 ?auto_2194644 ) ) ( not ( = ?auto_2194634 ?auto_2194645 ) ) ( not ( = ?auto_2194635 ?auto_2194636 ) ) ( not ( = ?auto_2194635 ?auto_2194637 ) ) ( not ( = ?auto_2194635 ?auto_2194638 ) ) ( not ( = ?auto_2194635 ?auto_2194639 ) ) ( not ( = ?auto_2194635 ?auto_2194640 ) ) ( not ( = ?auto_2194635 ?auto_2194641 ) ) ( not ( = ?auto_2194635 ?auto_2194642 ) ) ( not ( = ?auto_2194635 ?auto_2194643 ) ) ( not ( = ?auto_2194635 ?auto_2194644 ) ) ( not ( = ?auto_2194635 ?auto_2194645 ) ) ( not ( = ?auto_2194636 ?auto_2194637 ) ) ( not ( = ?auto_2194636 ?auto_2194638 ) ) ( not ( = ?auto_2194636 ?auto_2194639 ) ) ( not ( = ?auto_2194636 ?auto_2194640 ) ) ( not ( = ?auto_2194636 ?auto_2194641 ) ) ( not ( = ?auto_2194636 ?auto_2194642 ) ) ( not ( = ?auto_2194636 ?auto_2194643 ) ) ( not ( = ?auto_2194636 ?auto_2194644 ) ) ( not ( = ?auto_2194636 ?auto_2194645 ) ) ( not ( = ?auto_2194637 ?auto_2194638 ) ) ( not ( = ?auto_2194637 ?auto_2194639 ) ) ( not ( = ?auto_2194637 ?auto_2194640 ) ) ( not ( = ?auto_2194637 ?auto_2194641 ) ) ( not ( = ?auto_2194637 ?auto_2194642 ) ) ( not ( = ?auto_2194637 ?auto_2194643 ) ) ( not ( = ?auto_2194637 ?auto_2194644 ) ) ( not ( = ?auto_2194637 ?auto_2194645 ) ) ( not ( = ?auto_2194638 ?auto_2194639 ) ) ( not ( = ?auto_2194638 ?auto_2194640 ) ) ( not ( = ?auto_2194638 ?auto_2194641 ) ) ( not ( = ?auto_2194638 ?auto_2194642 ) ) ( not ( = ?auto_2194638 ?auto_2194643 ) ) ( not ( = ?auto_2194638 ?auto_2194644 ) ) ( not ( = ?auto_2194638 ?auto_2194645 ) ) ( not ( = ?auto_2194639 ?auto_2194640 ) ) ( not ( = ?auto_2194639 ?auto_2194641 ) ) ( not ( = ?auto_2194639 ?auto_2194642 ) ) ( not ( = ?auto_2194639 ?auto_2194643 ) ) ( not ( = ?auto_2194639 ?auto_2194644 ) ) ( not ( = ?auto_2194639 ?auto_2194645 ) ) ( not ( = ?auto_2194640 ?auto_2194641 ) ) ( not ( = ?auto_2194640 ?auto_2194642 ) ) ( not ( = ?auto_2194640 ?auto_2194643 ) ) ( not ( = ?auto_2194640 ?auto_2194644 ) ) ( not ( = ?auto_2194640 ?auto_2194645 ) ) ( not ( = ?auto_2194641 ?auto_2194642 ) ) ( not ( = ?auto_2194641 ?auto_2194643 ) ) ( not ( = ?auto_2194641 ?auto_2194644 ) ) ( not ( = ?auto_2194641 ?auto_2194645 ) ) ( not ( = ?auto_2194642 ?auto_2194643 ) ) ( not ( = ?auto_2194642 ?auto_2194644 ) ) ( not ( = ?auto_2194642 ?auto_2194645 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194643 ?auto_2194644 ?auto_2194645 )
      ( MAKE-14CRATE-VERIFY ?auto_2194631 ?auto_2194632 ?auto_2194633 ?auto_2194634 ?auto_2194635 ?auto_2194636 ?auto_2194637 ?auto_2194638 ?auto_2194639 ?auto_2194640 ?auto_2194641 ?auto_2194642 ?auto_2194643 ?auto_2194644 ?auto_2194645 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2194834 - SURFACE
      ?auto_2194835 - SURFACE
      ?auto_2194836 - SURFACE
      ?auto_2194837 - SURFACE
      ?auto_2194838 - SURFACE
      ?auto_2194839 - SURFACE
      ?auto_2194840 - SURFACE
      ?auto_2194841 - SURFACE
      ?auto_2194842 - SURFACE
      ?auto_2194843 - SURFACE
      ?auto_2194844 - SURFACE
      ?auto_2194845 - SURFACE
      ?auto_2194846 - SURFACE
      ?auto_2194847 - SURFACE
      ?auto_2194848 - SURFACE
    )
    :vars
    (
      ?auto_2194851 - HOIST
      ?auto_2194850 - PLACE
      ?auto_2194849 - TRUCK
      ?auto_2194852 - PLACE
      ?auto_2194853 - HOIST
      ?auto_2194854 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2194851 ?auto_2194850 ) ( SURFACE-AT ?auto_2194847 ?auto_2194850 ) ( CLEAR ?auto_2194847 ) ( IS-CRATE ?auto_2194848 ) ( not ( = ?auto_2194847 ?auto_2194848 ) ) ( AVAILABLE ?auto_2194851 ) ( ON ?auto_2194847 ?auto_2194846 ) ( not ( = ?auto_2194846 ?auto_2194847 ) ) ( not ( = ?auto_2194846 ?auto_2194848 ) ) ( TRUCK-AT ?auto_2194849 ?auto_2194852 ) ( not ( = ?auto_2194852 ?auto_2194850 ) ) ( HOIST-AT ?auto_2194853 ?auto_2194852 ) ( not ( = ?auto_2194851 ?auto_2194853 ) ) ( AVAILABLE ?auto_2194853 ) ( SURFACE-AT ?auto_2194848 ?auto_2194852 ) ( ON ?auto_2194848 ?auto_2194854 ) ( CLEAR ?auto_2194848 ) ( not ( = ?auto_2194847 ?auto_2194854 ) ) ( not ( = ?auto_2194848 ?auto_2194854 ) ) ( not ( = ?auto_2194846 ?auto_2194854 ) ) ( ON ?auto_2194835 ?auto_2194834 ) ( ON ?auto_2194836 ?auto_2194835 ) ( ON ?auto_2194837 ?auto_2194836 ) ( ON ?auto_2194838 ?auto_2194837 ) ( ON ?auto_2194839 ?auto_2194838 ) ( ON ?auto_2194840 ?auto_2194839 ) ( ON ?auto_2194841 ?auto_2194840 ) ( ON ?auto_2194842 ?auto_2194841 ) ( ON ?auto_2194843 ?auto_2194842 ) ( ON ?auto_2194844 ?auto_2194843 ) ( ON ?auto_2194845 ?auto_2194844 ) ( ON ?auto_2194846 ?auto_2194845 ) ( not ( = ?auto_2194834 ?auto_2194835 ) ) ( not ( = ?auto_2194834 ?auto_2194836 ) ) ( not ( = ?auto_2194834 ?auto_2194837 ) ) ( not ( = ?auto_2194834 ?auto_2194838 ) ) ( not ( = ?auto_2194834 ?auto_2194839 ) ) ( not ( = ?auto_2194834 ?auto_2194840 ) ) ( not ( = ?auto_2194834 ?auto_2194841 ) ) ( not ( = ?auto_2194834 ?auto_2194842 ) ) ( not ( = ?auto_2194834 ?auto_2194843 ) ) ( not ( = ?auto_2194834 ?auto_2194844 ) ) ( not ( = ?auto_2194834 ?auto_2194845 ) ) ( not ( = ?auto_2194834 ?auto_2194846 ) ) ( not ( = ?auto_2194834 ?auto_2194847 ) ) ( not ( = ?auto_2194834 ?auto_2194848 ) ) ( not ( = ?auto_2194834 ?auto_2194854 ) ) ( not ( = ?auto_2194835 ?auto_2194836 ) ) ( not ( = ?auto_2194835 ?auto_2194837 ) ) ( not ( = ?auto_2194835 ?auto_2194838 ) ) ( not ( = ?auto_2194835 ?auto_2194839 ) ) ( not ( = ?auto_2194835 ?auto_2194840 ) ) ( not ( = ?auto_2194835 ?auto_2194841 ) ) ( not ( = ?auto_2194835 ?auto_2194842 ) ) ( not ( = ?auto_2194835 ?auto_2194843 ) ) ( not ( = ?auto_2194835 ?auto_2194844 ) ) ( not ( = ?auto_2194835 ?auto_2194845 ) ) ( not ( = ?auto_2194835 ?auto_2194846 ) ) ( not ( = ?auto_2194835 ?auto_2194847 ) ) ( not ( = ?auto_2194835 ?auto_2194848 ) ) ( not ( = ?auto_2194835 ?auto_2194854 ) ) ( not ( = ?auto_2194836 ?auto_2194837 ) ) ( not ( = ?auto_2194836 ?auto_2194838 ) ) ( not ( = ?auto_2194836 ?auto_2194839 ) ) ( not ( = ?auto_2194836 ?auto_2194840 ) ) ( not ( = ?auto_2194836 ?auto_2194841 ) ) ( not ( = ?auto_2194836 ?auto_2194842 ) ) ( not ( = ?auto_2194836 ?auto_2194843 ) ) ( not ( = ?auto_2194836 ?auto_2194844 ) ) ( not ( = ?auto_2194836 ?auto_2194845 ) ) ( not ( = ?auto_2194836 ?auto_2194846 ) ) ( not ( = ?auto_2194836 ?auto_2194847 ) ) ( not ( = ?auto_2194836 ?auto_2194848 ) ) ( not ( = ?auto_2194836 ?auto_2194854 ) ) ( not ( = ?auto_2194837 ?auto_2194838 ) ) ( not ( = ?auto_2194837 ?auto_2194839 ) ) ( not ( = ?auto_2194837 ?auto_2194840 ) ) ( not ( = ?auto_2194837 ?auto_2194841 ) ) ( not ( = ?auto_2194837 ?auto_2194842 ) ) ( not ( = ?auto_2194837 ?auto_2194843 ) ) ( not ( = ?auto_2194837 ?auto_2194844 ) ) ( not ( = ?auto_2194837 ?auto_2194845 ) ) ( not ( = ?auto_2194837 ?auto_2194846 ) ) ( not ( = ?auto_2194837 ?auto_2194847 ) ) ( not ( = ?auto_2194837 ?auto_2194848 ) ) ( not ( = ?auto_2194837 ?auto_2194854 ) ) ( not ( = ?auto_2194838 ?auto_2194839 ) ) ( not ( = ?auto_2194838 ?auto_2194840 ) ) ( not ( = ?auto_2194838 ?auto_2194841 ) ) ( not ( = ?auto_2194838 ?auto_2194842 ) ) ( not ( = ?auto_2194838 ?auto_2194843 ) ) ( not ( = ?auto_2194838 ?auto_2194844 ) ) ( not ( = ?auto_2194838 ?auto_2194845 ) ) ( not ( = ?auto_2194838 ?auto_2194846 ) ) ( not ( = ?auto_2194838 ?auto_2194847 ) ) ( not ( = ?auto_2194838 ?auto_2194848 ) ) ( not ( = ?auto_2194838 ?auto_2194854 ) ) ( not ( = ?auto_2194839 ?auto_2194840 ) ) ( not ( = ?auto_2194839 ?auto_2194841 ) ) ( not ( = ?auto_2194839 ?auto_2194842 ) ) ( not ( = ?auto_2194839 ?auto_2194843 ) ) ( not ( = ?auto_2194839 ?auto_2194844 ) ) ( not ( = ?auto_2194839 ?auto_2194845 ) ) ( not ( = ?auto_2194839 ?auto_2194846 ) ) ( not ( = ?auto_2194839 ?auto_2194847 ) ) ( not ( = ?auto_2194839 ?auto_2194848 ) ) ( not ( = ?auto_2194839 ?auto_2194854 ) ) ( not ( = ?auto_2194840 ?auto_2194841 ) ) ( not ( = ?auto_2194840 ?auto_2194842 ) ) ( not ( = ?auto_2194840 ?auto_2194843 ) ) ( not ( = ?auto_2194840 ?auto_2194844 ) ) ( not ( = ?auto_2194840 ?auto_2194845 ) ) ( not ( = ?auto_2194840 ?auto_2194846 ) ) ( not ( = ?auto_2194840 ?auto_2194847 ) ) ( not ( = ?auto_2194840 ?auto_2194848 ) ) ( not ( = ?auto_2194840 ?auto_2194854 ) ) ( not ( = ?auto_2194841 ?auto_2194842 ) ) ( not ( = ?auto_2194841 ?auto_2194843 ) ) ( not ( = ?auto_2194841 ?auto_2194844 ) ) ( not ( = ?auto_2194841 ?auto_2194845 ) ) ( not ( = ?auto_2194841 ?auto_2194846 ) ) ( not ( = ?auto_2194841 ?auto_2194847 ) ) ( not ( = ?auto_2194841 ?auto_2194848 ) ) ( not ( = ?auto_2194841 ?auto_2194854 ) ) ( not ( = ?auto_2194842 ?auto_2194843 ) ) ( not ( = ?auto_2194842 ?auto_2194844 ) ) ( not ( = ?auto_2194842 ?auto_2194845 ) ) ( not ( = ?auto_2194842 ?auto_2194846 ) ) ( not ( = ?auto_2194842 ?auto_2194847 ) ) ( not ( = ?auto_2194842 ?auto_2194848 ) ) ( not ( = ?auto_2194842 ?auto_2194854 ) ) ( not ( = ?auto_2194843 ?auto_2194844 ) ) ( not ( = ?auto_2194843 ?auto_2194845 ) ) ( not ( = ?auto_2194843 ?auto_2194846 ) ) ( not ( = ?auto_2194843 ?auto_2194847 ) ) ( not ( = ?auto_2194843 ?auto_2194848 ) ) ( not ( = ?auto_2194843 ?auto_2194854 ) ) ( not ( = ?auto_2194844 ?auto_2194845 ) ) ( not ( = ?auto_2194844 ?auto_2194846 ) ) ( not ( = ?auto_2194844 ?auto_2194847 ) ) ( not ( = ?auto_2194844 ?auto_2194848 ) ) ( not ( = ?auto_2194844 ?auto_2194854 ) ) ( not ( = ?auto_2194845 ?auto_2194846 ) ) ( not ( = ?auto_2194845 ?auto_2194847 ) ) ( not ( = ?auto_2194845 ?auto_2194848 ) ) ( not ( = ?auto_2194845 ?auto_2194854 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2194846 ?auto_2194847 ?auto_2194848 )
      ( MAKE-14CRATE-VERIFY ?auto_2194834 ?auto_2194835 ?auto_2194836 ?auto_2194837 ?auto_2194838 ?auto_2194839 ?auto_2194840 ?auto_2194841 ?auto_2194842 ?auto_2194843 ?auto_2194844 ?auto_2194845 ?auto_2194846 ?auto_2194847 ?auto_2194848 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195038 - SURFACE
      ?auto_2195039 - SURFACE
      ?auto_2195040 - SURFACE
      ?auto_2195041 - SURFACE
      ?auto_2195042 - SURFACE
      ?auto_2195043 - SURFACE
      ?auto_2195044 - SURFACE
      ?auto_2195045 - SURFACE
      ?auto_2195046 - SURFACE
      ?auto_2195047 - SURFACE
      ?auto_2195048 - SURFACE
      ?auto_2195049 - SURFACE
      ?auto_2195050 - SURFACE
      ?auto_2195051 - SURFACE
      ?auto_2195052 - SURFACE
    )
    :vars
    (
      ?auto_2195054 - HOIST
      ?auto_2195056 - PLACE
      ?auto_2195053 - PLACE
      ?auto_2195058 - HOIST
      ?auto_2195055 - SURFACE
      ?auto_2195057 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195054 ?auto_2195056 ) ( SURFACE-AT ?auto_2195051 ?auto_2195056 ) ( CLEAR ?auto_2195051 ) ( IS-CRATE ?auto_2195052 ) ( not ( = ?auto_2195051 ?auto_2195052 ) ) ( AVAILABLE ?auto_2195054 ) ( ON ?auto_2195051 ?auto_2195050 ) ( not ( = ?auto_2195050 ?auto_2195051 ) ) ( not ( = ?auto_2195050 ?auto_2195052 ) ) ( not ( = ?auto_2195053 ?auto_2195056 ) ) ( HOIST-AT ?auto_2195058 ?auto_2195053 ) ( not ( = ?auto_2195054 ?auto_2195058 ) ) ( AVAILABLE ?auto_2195058 ) ( SURFACE-AT ?auto_2195052 ?auto_2195053 ) ( ON ?auto_2195052 ?auto_2195055 ) ( CLEAR ?auto_2195052 ) ( not ( = ?auto_2195051 ?auto_2195055 ) ) ( not ( = ?auto_2195052 ?auto_2195055 ) ) ( not ( = ?auto_2195050 ?auto_2195055 ) ) ( TRUCK-AT ?auto_2195057 ?auto_2195056 ) ( ON ?auto_2195039 ?auto_2195038 ) ( ON ?auto_2195040 ?auto_2195039 ) ( ON ?auto_2195041 ?auto_2195040 ) ( ON ?auto_2195042 ?auto_2195041 ) ( ON ?auto_2195043 ?auto_2195042 ) ( ON ?auto_2195044 ?auto_2195043 ) ( ON ?auto_2195045 ?auto_2195044 ) ( ON ?auto_2195046 ?auto_2195045 ) ( ON ?auto_2195047 ?auto_2195046 ) ( ON ?auto_2195048 ?auto_2195047 ) ( ON ?auto_2195049 ?auto_2195048 ) ( ON ?auto_2195050 ?auto_2195049 ) ( not ( = ?auto_2195038 ?auto_2195039 ) ) ( not ( = ?auto_2195038 ?auto_2195040 ) ) ( not ( = ?auto_2195038 ?auto_2195041 ) ) ( not ( = ?auto_2195038 ?auto_2195042 ) ) ( not ( = ?auto_2195038 ?auto_2195043 ) ) ( not ( = ?auto_2195038 ?auto_2195044 ) ) ( not ( = ?auto_2195038 ?auto_2195045 ) ) ( not ( = ?auto_2195038 ?auto_2195046 ) ) ( not ( = ?auto_2195038 ?auto_2195047 ) ) ( not ( = ?auto_2195038 ?auto_2195048 ) ) ( not ( = ?auto_2195038 ?auto_2195049 ) ) ( not ( = ?auto_2195038 ?auto_2195050 ) ) ( not ( = ?auto_2195038 ?auto_2195051 ) ) ( not ( = ?auto_2195038 ?auto_2195052 ) ) ( not ( = ?auto_2195038 ?auto_2195055 ) ) ( not ( = ?auto_2195039 ?auto_2195040 ) ) ( not ( = ?auto_2195039 ?auto_2195041 ) ) ( not ( = ?auto_2195039 ?auto_2195042 ) ) ( not ( = ?auto_2195039 ?auto_2195043 ) ) ( not ( = ?auto_2195039 ?auto_2195044 ) ) ( not ( = ?auto_2195039 ?auto_2195045 ) ) ( not ( = ?auto_2195039 ?auto_2195046 ) ) ( not ( = ?auto_2195039 ?auto_2195047 ) ) ( not ( = ?auto_2195039 ?auto_2195048 ) ) ( not ( = ?auto_2195039 ?auto_2195049 ) ) ( not ( = ?auto_2195039 ?auto_2195050 ) ) ( not ( = ?auto_2195039 ?auto_2195051 ) ) ( not ( = ?auto_2195039 ?auto_2195052 ) ) ( not ( = ?auto_2195039 ?auto_2195055 ) ) ( not ( = ?auto_2195040 ?auto_2195041 ) ) ( not ( = ?auto_2195040 ?auto_2195042 ) ) ( not ( = ?auto_2195040 ?auto_2195043 ) ) ( not ( = ?auto_2195040 ?auto_2195044 ) ) ( not ( = ?auto_2195040 ?auto_2195045 ) ) ( not ( = ?auto_2195040 ?auto_2195046 ) ) ( not ( = ?auto_2195040 ?auto_2195047 ) ) ( not ( = ?auto_2195040 ?auto_2195048 ) ) ( not ( = ?auto_2195040 ?auto_2195049 ) ) ( not ( = ?auto_2195040 ?auto_2195050 ) ) ( not ( = ?auto_2195040 ?auto_2195051 ) ) ( not ( = ?auto_2195040 ?auto_2195052 ) ) ( not ( = ?auto_2195040 ?auto_2195055 ) ) ( not ( = ?auto_2195041 ?auto_2195042 ) ) ( not ( = ?auto_2195041 ?auto_2195043 ) ) ( not ( = ?auto_2195041 ?auto_2195044 ) ) ( not ( = ?auto_2195041 ?auto_2195045 ) ) ( not ( = ?auto_2195041 ?auto_2195046 ) ) ( not ( = ?auto_2195041 ?auto_2195047 ) ) ( not ( = ?auto_2195041 ?auto_2195048 ) ) ( not ( = ?auto_2195041 ?auto_2195049 ) ) ( not ( = ?auto_2195041 ?auto_2195050 ) ) ( not ( = ?auto_2195041 ?auto_2195051 ) ) ( not ( = ?auto_2195041 ?auto_2195052 ) ) ( not ( = ?auto_2195041 ?auto_2195055 ) ) ( not ( = ?auto_2195042 ?auto_2195043 ) ) ( not ( = ?auto_2195042 ?auto_2195044 ) ) ( not ( = ?auto_2195042 ?auto_2195045 ) ) ( not ( = ?auto_2195042 ?auto_2195046 ) ) ( not ( = ?auto_2195042 ?auto_2195047 ) ) ( not ( = ?auto_2195042 ?auto_2195048 ) ) ( not ( = ?auto_2195042 ?auto_2195049 ) ) ( not ( = ?auto_2195042 ?auto_2195050 ) ) ( not ( = ?auto_2195042 ?auto_2195051 ) ) ( not ( = ?auto_2195042 ?auto_2195052 ) ) ( not ( = ?auto_2195042 ?auto_2195055 ) ) ( not ( = ?auto_2195043 ?auto_2195044 ) ) ( not ( = ?auto_2195043 ?auto_2195045 ) ) ( not ( = ?auto_2195043 ?auto_2195046 ) ) ( not ( = ?auto_2195043 ?auto_2195047 ) ) ( not ( = ?auto_2195043 ?auto_2195048 ) ) ( not ( = ?auto_2195043 ?auto_2195049 ) ) ( not ( = ?auto_2195043 ?auto_2195050 ) ) ( not ( = ?auto_2195043 ?auto_2195051 ) ) ( not ( = ?auto_2195043 ?auto_2195052 ) ) ( not ( = ?auto_2195043 ?auto_2195055 ) ) ( not ( = ?auto_2195044 ?auto_2195045 ) ) ( not ( = ?auto_2195044 ?auto_2195046 ) ) ( not ( = ?auto_2195044 ?auto_2195047 ) ) ( not ( = ?auto_2195044 ?auto_2195048 ) ) ( not ( = ?auto_2195044 ?auto_2195049 ) ) ( not ( = ?auto_2195044 ?auto_2195050 ) ) ( not ( = ?auto_2195044 ?auto_2195051 ) ) ( not ( = ?auto_2195044 ?auto_2195052 ) ) ( not ( = ?auto_2195044 ?auto_2195055 ) ) ( not ( = ?auto_2195045 ?auto_2195046 ) ) ( not ( = ?auto_2195045 ?auto_2195047 ) ) ( not ( = ?auto_2195045 ?auto_2195048 ) ) ( not ( = ?auto_2195045 ?auto_2195049 ) ) ( not ( = ?auto_2195045 ?auto_2195050 ) ) ( not ( = ?auto_2195045 ?auto_2195051 ) ) ( not ( = ?auto_2195045 ?auto_2195052 ) ) ( not ( = ?auto_2195045 ?auto_2195055 ) ) ( not ( = ?auto_2195046 ?auto_2195047 ) ) ( not ( = ?auto_2195046 ?auto_2195048 ) ) ( not ( = ?auto_2195046 ?auto_2195049 ) ) ( not ( = ?auto_2195046 ?auto_2195050 ) ) ( not ( = ?auto_2195046 ?auto_2195051 ) ) ( not ( = ?auto_2195046 ?auto_2195052 ) ) ( not ( = ?auto_2195046 ?auto_2195055 ) ) ( not ( = ?auto_2195047 ?auto_2195048 ) ) ( not ( = ?auto_2195047 ?auto_2195049 ) ) ( not ( = ?auto_2195047 ?auto_2195050 ) ) ( not ( = ?auto_2195047 ?auto_2195051 ) ) ( not ( = ?auto_2195047 ?auto_2195052 ) ) ( not ( = ?auto_2195047 ?auto_2195055 ) ) ( not ( = ?auto_2195048 ?auto_2195049 ) ) ( not ( = ?auto_2195048 ?auto_2195050 ) ) ( not ( = ?auto_2195048 ?auto_2195051 ) ) ( not ( = ?auto_2195048 ?auto_2195052 ) ) ( not ( = ?auto_2195048 ?auto_2195055 ) ) ( not ( = ?auto_2195049 ?auto_2195050 ) ) ( not ( = ?auto_2195049 ?auto_2195051 ) ) ( not ( = ?auto_2195049 ?auto_2195052 ) ) ( not ( = ?auto_2195049 ?auto_2195055 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195050 ?auto_2195051 ?auto_2195052 )
      ( MAKE-14CRATE-VERIFY ?auto_2195038 ?auto_2195039 ?auto_2195040 ?auto_2195041 ?auto_2195042 ?auto_2195043 ?auto_2195044 ?auto_2195045 ?auto_2195046 ?auto_2195047 ?auto_2195048 ?auto_2195049 ?auto_2195050 ?auto_2195051 ?auto_2195052 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195242 - SURFACE
      ?auto_2195243 - SURFACE
      ?auto_2195244 - SURFACE
      ?auto_2195245 - SURFACE
      ?auto_2195246 - SURFACE
      ?auto_2195247 - SURFACE
      ?auto_2195248 - SURFACE
      ?auto_2195249 - SURFACE
      ?auto_2195250 - SURFACE
      ?auto_2195251 - SURFACE
      ?auto_2195252 - SURFACE
      ?auto_2195253 - SURFACE
      ?auto_2195254 - SURFACE
      ?auto_2195255 - SURFACE
      ?auto_2195256 - SURFACE
    )
    :vars
    (
      ?auto_2195257 - HOIST
      ?auto_2195262 - PLACE
      ?auto_2195261 - PLACE
      ?auto_2195258 - HOIST
      ?auto_2195260 - SURFACE
      ?auto_2195259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195257 ?auto_2195262 ) ( IS-CRATE ?auto_2195256 ) ( not ( = ?auto_2195255 ?auto_2195256 ) ) ( not ( = ?auto_2195254 ?auto_2195255 ) ) ( not ( = ?auto_2195254 ?auto_2195256 ) ) ( not ( = ?auto_2195261 ?auto_2195262 ) ) ( HOIST-AT ?auto_2195258 ?auto_2195261 ) ( not ( = ?auto_2195257 ?auto_2195258 ) ) ( AVAILABLE ?auto_2195258 ) ( SURFACE-AT ?auto_2195256 ?auto_2195261 ) ( ON ?auto_2195256 ?auto_2195260 ) ( CLEAR ?auto_2195256 ) ( not ( = ?auto_2195255 ?auto_2195260 ) ) ( not ( = ?auto_2195256 ?auto_2195260 ) ) ( not ( = ?auto_2195254 ?auto_2195260 ) ) ( TRUCK-AT ?auto_2195259 ?auto_2195262 ) ( SURFACE-AT ?auto_2195254 ?auto_2195262 ) ( CLEAR ?auto_2195254 ) ( LIFTING ?auto_2195257 ?auto_2195255 ) ( IS-CRATE ?auto_2195255 ) ( ON ?auto_2195243 ?auto_2195242 ) ( ON ?auto_2195244 ?auto_2195243 ) ( ON ?auto_2195245 ?auto_2195244 ) ( ON ?auto_2195246 ?auto_2195245 ) ( ON ?auto_2195247 ?auto_2195246 ) ( ON ?auto_2195248 ?auto_2195247 ) ( ON ?auto_2195249 ?auto_2195248 ) ( ON ?auto_2195250 ?auto_2195249 ) ( ON ?auto_2195251 ?auto_2195250 ) ( ON ?auto_2195252 ?auto_2195251 ) ( ON ?auto_2195253 ?auto_2195252 ) ( ON ?auto_2195254 ?auto_2195253 ) ( not ( = ?auto_2195242 ?auto_2195243 ) ) ( not ( = ?auto_2195242 ?auto_2195244 ) ) ( not ( = ?auto_2195242 ?auto_2195245 ) ) ( not ( = ?auto_2195242 ?auto_2195246 ) ) ( not ( = ?auto_2195242 ?auto_2195247 ) ) ( not ( = ?auto_2195242 ?auto_2195248 ) ) ( not ( = ?auto_2195242 ?auto_2195249 ) ) ( not ( = ?auto_2195242 ?auto_2195250 ) ) ( not ( = ?auto_2195242 ?auto_2195251 ) ) ( not ( = ?auto_2195242 ?auto_2195252 ) ) ( not ( = ?auto_2195242 ?auto_2195253 ) ) ( not ( = ?auto_2195242 ?auto_2195254 ) ) ( not ( = ?auto_2195242 ?auto_2195255 ) ) ( not ( = ?auto_2195242 ?auto_2195256 ) ) ( not ( = ?auto_2195242 ?auto_2195260 ) ) ( not ( = ?auto_2195243 ?auto_2195244 ) ) ( not ( = ?auto_2195243 ?auto_2195245 ) ) ( not ( = ?auto_2195243 ?auto_2195246 ) ) ( not ( = ?auto_2195243 ?auto_2195247 ) ) ( not ( = ?auto_2195243 ?auto_2195248 ) ) ( not ( = ?auto_2195243 ?auto_2195249 ) ) ( not ( = ?auto_2195243 ?auto_2195250 ) ) ( not ( = ?auto_2195243 ?auto_2195251 ) ) ( not ( = ?auto_2195243 ?auto_2195252 ) ) ( not ( = ?auto_2195243 ?auto_2195253 ) ) ( not ( = ?auto_2195243 ?auto_2195254 ) ) ( not ( = ?auto_2195243 ?auto_2195255 ) ) ( not ( = ?auto_2195243 ?auto_2195256 ) ) ( not ( = ?auto_2195243 ?auto_2195260 ) ) ( not ( = ?auto_2195244 ?auto_2195245 ) ) ( not ( = ?auto_2195244 ?auto_2195246 ) ) ( not ( = ?auto_2195244 ?auto_2195247 ) ) ( not ( = ?auto_2195244 ?auto_2195248 ) ) ( not ( = ?auto_2195244 ?auto_2195249 ) ) ( not ( = ?auto_2195244 ?auto_2195250 ) ) ( not ( = ?auto_2195244 ?auto_2195251 ) ) ( not ( = ?auto_2195244 ?auto_2195252 ) ) ( not ( = ?auto_2195244 ?auto_2195253 ) ) ( not ( = ?auto_2195244 ?auto_2195254 ) ) ( not ( = ?auto_2195244 ?auto_2195255 ) ) ( not ( = ?auto_2195244 ?auto_2195256 ) ) ( not ( = ?auto_2195244 ?auto_2195260 ) ) ( not ( = ?auto_2195245 ?auto_2195246 ) ) ( not ( = ?auto_2195245 ?auto_2195247 ) ) ( not ( = ?auto_2195245 ?auto_2195248 ) ) ( not ( = ?auto_2195245 ?auto_2195249 ) ) ( not ( = ?auto_2195245 ?auto_2195250 ) ) ( not ( = ?auto_2195245 ?auto_2195251 ) ) ( not ( = ?auto_2195245 ?auto_2195252 ) ) ( not ( = ?auto_2195245 ?auto_2195253 ) ) ( not ( = ?auto_2195245 ?auto_2195254 ) ) ( not ( = ?auto_2195245 ?auto_2195255 ) ) ( not ( = ?auto_2195245 ?auto_2195256 ) ) ( not ( = ?auto_2195245 ?auto_2195260 ) ) ( not ( = ?auto_2195246 ?auto_2195247 ) ) ( not ( = ?auto_2195246 ?auto_2195248 ) ) ( not ( = ?auto_2195246 ?auto_2195249 ) ) ( not ( = ?auto_2195246 ?auto_2195250 ) ) ( not ( = ?auto_2195246 ?auto_2195251 ) ) ( not ( = ?auto_2195246 ?auto_2195252 ) ) ( not ( = ?auto_2195246 ?auto_2195253 ) ) ( not ( = ?auto_2195246 ?auto_2195254 ) ) ( not ( = ?auto_2195246 ?auto_2195255 ) ) ( not ( = ?auto_2195246 ?auto_2195256 ) ) ( not ( = ?auto_2195246 ?auto_2195260 ) ) ( not ( = ?auto_2195247 ?auto_2195248 ) ) ( not ( = ?auto_2195247 ?auto_2195249 ) ) ( not ( = ?auto_2195247 ?auto_2195250 ) ) ( not ( = ?auto_2195247 ?auto_2195251 ) ) ( not ( = ?auto_2195247 ?auto_2195252 ) ) ( not ( = ?auto_2195247 ?auto_2195253 ) ) ( not ( = ?auto_2195247 ?auto_2195254 ) ) ( not ( = ?auto_2195247 ?auto_2195255 ) ) ( not ( = ?auto_2195247 ?auto_2195256 ) ) ( not ( = ?auto_2195247 ?auto_2195260 ) ) ( not ( = ?auto_2195248 ?auto_2195249 ) ) ( not ( = ?auto_2195248 ?auto_2195250 ) ) ( not ( = ?auto_2195248 ?auto_2195251 ) ) ( not ( = ?auto_2195248 ?auto_2195252 ) ) ( not ( = ?auto_2195248 ?auto_2195253 ) ) ( not ( = ?auto_2195248 ?auto_2195254 ) ) ( not ( = ?auto_2195248 ?auto_2195255 ) ) ( not ( = ?auto_2195248 ?auto_2195256 ) ) ( not ( = ?auto_2195248 ?auto_2195260 ) ) ( not ( = ?auto_2195249 ?auto_2195250 ) ) ( not ( = ?auto_2195249 ?auto_2195251 ) ) ( not ( = ?auto_2195249 ?auto_2195252 ) ) ( not ( = ?auto_2195249 ?auto_2195253 ) ) ( not ( = ?auto_2195249 ?auto_2195254 ) ) ( not ( = ?auto_2195249 ?auto_2195255 ) ) ( not ( = ?auto_2195249 ?auto_2195256 ) ) ( not ( = ?auto_2195249 ?auto_2195260 ) ) ( not ( = ?auto_2195250 ?auto_2195251 ) ) ( not ( = ?auto_2195250 ?auto_2195252 ) ) ( not ( = ?auto_2195250 ?auto_2195253 ) ) ( not ( = ?auto_2195250 ?auto_2195254 ) ) ( not ( = ?auto_2195250 ?auto_2195255 ) ) ( not ( = ?auto_2195250 ?auto_2195256 ) ) ( not ( = ?auto_2195250 ?auto_2195260 ) ) ( not ( = ?auto_2195251 ?auto_2195252 ) ) ( not ( = ?auto_2195251 ?auto_2195253 ) ) ( not ( = ?auto_2195251 ?auto_2195254 ) ) ( not ( = ?auto_2195251 ?auto_2195255 ) ) ( not ( = ?auto_2195251 ?auto_2195256 ) ) ( not ( = ?auto_2195251 ?auto_2195260 ) ) ( not ( = ?auto_2195252 ?auto_2195253 ) ) ( not ( = ?auto_2195252 ?auto_2195254 ) ) ( not ( = ?auto_2195252 ?auto_2195255 ) ) ( not ( = ?auto_2195252 ?auto_2195256 ) ) ( not ( = ?auto_2195252 ?auto_2195260 ) ) ( not ( = ?auto_2195253 ?auto_2195254 ) ) ( not ( = ?auto_2195253 ?auto_2195255 ) ) ( not ( = ?auto_2195253 ?auto_2195256 ) ) ( not ( = ?auto_2195253 ?auto_2195260 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195254 ?auto_2195255 ?auto_2195256 )
      ( MAKE-14CRATE-VERIFY ?auto_2195242 ?auto_2195243 ?auto_2195244 ?auto_2195245 ?auto_2195246 ?auto_2195247 ?auto_2195248 ?auto_2195249 ?auto_2195250 ?auto_2195251 ?auto_2195252 ?auto_2195253 ?auto_2195254 ?auto_2195255 ?auto_2195256 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_2195446 - SURFACE
      ?auto_2195447 - SURFACE
      ?auto_2195448 - SURFACE
      ?auto_2195449 - SURFACE
      ?auto_2195450 - SURFACE
      ?auto_2195451 - SURFACE
      ?auto_2195452 - SURFACE
      ?auto_2195453 - SURFACE
      ?auto_2195454 - SURFACE
      ?auto_2195455 - SURFACE
      ?auto_2195456 - SURFACE
      ?auto_2195457 - SURFACE
      ?auto_2195458 - SURFACE
      ?auto_2195459 - SURFACE
      ?auto_2195460 - SURFACE
    )
    :vars
    (
      ?auto_2195466 - HOIST
      ?auto_2195464 - PLACE
      ?auto_2195465 - PLACE
      ?auto_2195461 - HOIST
      ?auto_2195462 - SURFACE
      ?auto_2195463 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2195466 ?auto_2195464 ) ( IS-CRATE ?auto_2195460 ) ( not ( = ?auto_2195459 ?auto_2195460 ) ) ( not ( = ?auto_2195458 ?auto_2195459 ) ) ( not ( = ?auto_2195458 ?auto_2195460 ) ) ( not ( = ?auto_2195465 ?auto_2195464 ) ) ( HOIST-AT ?auto_2195461 ?auto_2195465 ) ( not ( = ?auto_2195466 ?auto_2195461 ) ) ( AVAILABLE ?auto_2195461 ) ( SURFACE-AT ?auto_2195460 ?auto_2195465 ) ( ON ?auto_2195460 ?auto_2195462 ) ( CLEAR ?auto_2195460 ) ( not ( = ?auto_2195459 ?auto_2195462 ) ) ( not ( = ?auto_2195460 ?auto_2195462 ) ) ( not ( = ?auto_2195458 ?auto_2195462 ) ) ( TRUCK-AT ?auto_2195463 ?auto_2195464 ) ( SURFACE-AT ?auto_2195458 ?auto_2195464 ) ( CLEAR ?auto_2195458 ) ( IS-CRATE ?auto_2195459 ) ( AVAILABLE ?auto_2195466 ) ( IN ?auto_2195459 ?auto_2195463 ) ( ON ?auto_2195447 ?auto_2195446 ) ( ON ?auto_2195448 ?auto_2195447 ) ( ON ?auto_2195449 ?auto_2195448 ) ( ON ?auto_2195450 ?auto_2195449 ) ( ON ?auto_2195451 ?auto_2195450 ) ( ON ?auto_2195452 ?auto_2195451 ) ( ON ?auto_2195453 ?auto_2195452 ) ( ON ?auto_2195454 ?auto_2195453 ) ( ON ?auto_2195455 ?auto_2195454 ) ( ON ?auto_2195456 ?auto_2195455 ) ( ON ?auto_2195457 ?auto_2195456 ) ( ON ?auto_2195458 ?auto_2195457 ) ( not ( = ?auto_2195446 ?auto_2195447 ) ) ( not ( = ?auto_2195446 ?auto_2195448 ) ) ( not ( = ?auto_2195446 ?auto_2195449 ) ) ( not ( = ?auto_2195446 ?auto_2195450 ) ) ( not ( = ?auto_2195446 ?auto_2195451 ) ) ( not ( = ?auto_2195446 ?auto_2195452 ) ) ( not ( = ?auto_2195446 ?auto_2195453 ) ) ( not ( = ?auto_2195446 ?auto_2195454 ) ) ( not ( = ?auto_2195446 ?auto_2195455 ) ) ( not ( = ?auto_2195446 ?auto_2195456 ) ) ( not ( = ?auto_2195446 ?auto_2195457 ) ) ( not ( = ?auto_2195446 ?auto_2195458 ) ) ( not ( = ?auto_2195446 ?auto_2195459 ) ) ( not ( = ?auto_2195446 ?auto_2195460 ) ) ( not ( = ?auto_2195446 ?auto_2195462 ) ) ( not ( = ?auto_2195447 ?auto_2195448 ) ) ( not ( = ?auto_2195447 ?auto_2195449 ) ) ( not ( = ?auto_2195447 ?auto_2195450 ) ) ( not ( = ?auto_2195447 ?auto_2195451 ) ) ( not ( = ?auto_2195447 ?auto_2195452 ) ) ( not ( = ?auto_2195447 ?auto_2195453 ) ) ( not ( = ?auto_2195447 ?auto_2195454 ) ) ( not ( = ?auto_2195447 ?auto_2195455 ) ) ( not ( = ?auto_2195447 ?auto_2195456 ) ) ( not ( = ?auto_2195447 ?auto_2195457 ) ) ( not ( = ?auto_2195447 ?auto_2195458 ) ) ( not ( = ?auto_2195447 ?auto_2195459 ) ) ( not ( = ?auto_2195447 ?auto_2195460 ) ) ( not ( = ?auto_2195447 ?auto_2195462 ) ) ( not ( = ?auto_2195448 ?auto_2195449 ) ) ( not ( = ?auto_2195448 ?auto_2195450 ) ) ( not ( = ?auto_2195448 ?auto_2195451 ) ) ( not ( = ?auto_2195448 ?auto_2195452 ) ) ( not ( = ?auto_2195448 ?auto_2195453 ) ) ( not ( = ?auto_2195448 ?auto_2195454 ) ) ( not ( = ?auto_2195448 ?auto_2195455 ) ) ( not ( = ?auto_2195448 ?auto_2195456 ) ) ( not ( = ?auto_2195448 ?auto_2195457 ) ) ( not ( = ?auto_2195448 ?auto_2195458 ) ) ( not ( = ?auto_2195448 ?auto_2195459 ) ) ( not ( = ?auto_2195448 ?auto_2195460 ) ) ( not ( = ?auto_2195448 ?auto_2195462 ) ) ( not ( = ?auto_2195449 ?auto_2195450 ) ) ( not ( = ?auto_2195449 ?auto_2195451 ) ) ( not ( = ?auto_2195449 ?auto_2195452 ) ) ( not ( = ?auto_2195449 ?auto_2195453 ) ) ( not ( = ?auto_2195449 ?auto_2195454 ) ) ( not ( = ?auto_2195449 ?auto_2195455 ) ) ( not ( = ?auto_2195449 ?auto_2195456 ) ) ( not ( = ?auto_2195449 ?auto_2195457 ) ) ( not ( = ?auto_2195449 ?auto_2195458 ) ) ( not ( = ?auto_2195449 ?auto_2195459 ) ) ( not ( = ?auto_2195449 ?auto_2195460 ) ) ( not ( = ?auto_2195449 ?auto_2195462 ) ) ( not ( = ?auto_2195450 ?auto_2195451 ) ) ( not ( = ?auto_2195450 ?auto_2195452 ) ) ( not ( = ?auto_2195450 ?auto_2195453 ) ) ( not ( = ?auto_2195450 ?auto_2195454 ) ) ( not ( = ?auto_2195450 ?auto_2195455 ) ) ( not ( = ?auto_2195450 ?auto_2195456 ) ) ( not ( = ?auto_2195450 ?auto_2195457 ) ) ( not ( = ?auto_2195450 ?auto_2195458 ) ) ( not ( = ?auto_2195450 ?auto_2195459 ) ) ( not ( = ?auto_2195450 ?auto_2195460 ) ) ( not ( = ?auto_2195450 ?auto_2195462 ) ) ( not ( = ?auto_2195451 ?auto_2195452 ) ) ( not ( = ?auto_2195451 ?auto_2195453 ) ) ( not ( = ?auto_2195451 ?auto_2195454 ) ) ( not ( = ?auto_2195451 ?auto_2195455 ) ) ( not ( = ?auto_2195451 ?auto_2195456 ) ) ( not ( = ?auto_2195451 ?auto_2195457 ) ) ( not ( = ?auto_2195451 ?auto_2195458 ) ) ( not ( = ?auto_2195451 ?auto_2195459 ) ) ( not ( = ?auto_2195451 ?auto_2195460 ) ) ( not ( = ?auto_2195451 ?auto_2195462 ) ) ( not ( = ?auto_2195452 ?auto_2195453 ) ) ( not ( = ?auto_2195452 ?auto_2195454 ) ) ( not ( = ?auto_2195452 ?auto_2195455 ) ) ( not ( = ?auto_2195452 ?auto_2195456 ) ) ( not ( = ?auto_2195452 ?auto_2195457 ) ) ( not ( = ?auto_2195452 ?auto_2195458 ) ) ( not ( = ?auto_2195452 ?auto_2195459 ) ) ( not ( = ?auto_2195452 ?auto_2195460 ) ) ( not ( = ?auto_2195452 ?auto_2195462 ) ) ( not ( = ?auto_2195453 ?auto_2195454 ) ) ( not ( = ?auto_2195453 ?auto_2195455 ) ) ( not ( = ?auto_2195453 ?auto_2195456 ) ) ( not ( = ?auto_2195453 ?auto_2195457 ) ) ( not ( = ?auto_2195453 ?auto_2195458 ) ) ( not ( = ?auto_2195453 ?auto_2195459 ) ) ( not ( = ?auto_2195453 ?auto_2195460 ) ) ( not ( = ?auto_2195453 ?auto_2195462 ) ) ( not ( = ?auto_2195454 ?auto_2195455 ) ) ( not ( = ?auto_2195454 ?auto_2195456 ) ) ( not ( = ?auto_2195454 ?auto_2195457 ) ) ( not ( = ?auto_2195454 ?auto_2195458 ) ) ( not ( = ?auto_2195454 ?auto_2195459 ) ) ( not ( = ?auto_2195454 ?auto_2195460 ) ) ( not ( = ?auto_2195454 ?auto_2195462 ) ) ( not ( = ?auto_2195455 ?auto_2195456 ) ) ( not ( = ?auto_2195455 ?auto_2195457 ) ) ( not ( = ?auto_2195455 ?auto_2195458 ) ) ( not ( = ?auto_2195455 ?auto_2195459 ) ) ( not ( = ?auto_2195455 ?auto_2195460 ) ) ( not ( = ?auto_2195455 ?auto_2195462 ) ) ( not ( = ?auto_2195456 ?auto_2195457 ) ) ( not ( = ?auto_2195456 ?auto_2195458 ) ) ( not ( = ?auto_2195456 ?auto_2195459 ) ) ( not ( = ?auto_2195456 ?auto_2195460 ) ) ( not ( = ?auto_2195456 ?auto_2195462 ) ) ( not ( = ?auto_2195457 ?auto_2195458 ) ) ( not ( = ?auto_2195457 ?auto_2195459 ) ) ( not ( = ?auto_2195457 ?auto_2195460 ) ) ( not ( = ?auto_2195457 ?auto_2195462 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2195458 ?auto_2195459 ?auto_2195460 )
      ( MAKE-14CRATE-VERIFY ?auto_2195446 ?auto_2195447 ?auto_2195448 ?auto_2195449 ?auto_2195450 ?auto_2195451 ?auto_2195452 ?auto_2195453 ?auto_2195454 ?auto_2195455 ?auto_2195456 ?auto_2195457 ?auto_2195458 ?auto_2195459 ?auto_2195460 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212612 - SURFACE
      ?auto_2212613 - SURFACE
      ?auto_2212614 - SURFACE
      ?auto_2212615 - SURFACE
      ?auto_2212616 - SURFACE
      ?auto_2212617 - SURFACE
      ?auto_2212618 - SURFACE
      ?auto_2212619 - SURFACE
      ?auto_2212620 - SURFACE
      ?auto_2212621 - SURFACE
      ?auto_2212622 - SURFACE
      ?auto_2212623 - SURFACE
      ?auto_2212624 - SURFACE
      ?auto_2212625 - SURFACE
      ?auto_2212626 - SURFACE
      ?auto_2212627 - SURFACE
    )
    :vars
    (
      ?auto_2212628 - HOIST
      ?auto_2212629 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212628 ?auto_2212629 ) ( SURFACE-AT ?auto_2212626 ?auto_2212629 ) ( CLEAR ?auto_2212626 ) ( LIFTING ?auto_2212628 ?auto_2212627 ) ( IS-CRATE ?auto_2212627 ) ( not ( = ?auto_2212626 ?auto_2212627 ) ) ( ON ?auto_2212613 ?auto_2212612 ) ( ON ?auto_2212614 ?auto_2212613 ) ( ON ?auto_2212615 ?auto_2212614 ) ( ON ?auto_2212616 ?auto_2212615 ) ( ON ?auto_2212617 ?auto_2212616 ) ( ON ?auto_2212618 ?auto_2212617 ) ( ON ?auto_2212619 ?auto_2212618 ) ( ON ?auto_2212620 ?auto_2212619 ) ( ON ?auto_2212621 ?auto_2212620 ) ( ON ?auto_2212622 ?auto_2212621 ) ( ON ?auto_2212623 ?auto_2212622 ) ( ON ?auto_2212624 ?auto_2212623 ) ( ON ?auto_2212625 ?auto_2212624 ) ( ON ?auto_2212626 ?auto_2212625 ) ( not ( = ?auto_2212612 ?auto_2212613 ) ) ( not ( = ?auto_2212612 ?auto_2212614 ) ) ( not ( = ?auto_2212612 ?auto_2212615 ) ) ( not ( = ?auto_2212612 ?auto_2212616 ) ) ( not ( = ?auto_2212612 ?auto_2212617 ) ) ( not ( = ?auto_2212612 ?auto_2212618 ) ) ( not ( = ?auto_2212612 ?auto_2212619 ) ) ( not ( = ?auto_2212612 ?auto_2212620 ) ) ( not ( = ?auto_2212612 ?auto_2212621 ) ) ( not ( = ?auto_2212612 ?auto_2212622 ) ) ( not ( = ?auto_2212612 ?auto_2212623 ) ) ( not ( = ?auto_2212612 ?auto_2212624 ) ) ( not ( = ?auto_2212612 ?auto_2212625 ) ) ( not ( = ?auto_2212612 ?auto_2212626 ) ) ( not ( = ?auto_2212612 ?auto_2212627 ) ) ( not ( = ?auto_2212613 ?auto_2212614 ) ) ( not ( = ?auto_2212613 ?auto_2212615 ) ) ( not ( = ?auto_2212613 ?auto_2212616 ) ) ( not ( = ?auto_2212613 ?auto_2212617 ) ) ( not ( = ?auto_2212613 ?auto_2212618 ) ) ( not ( = ?auto_2212613 ?auto_2212619 ) ) ( not ( = ?auto_2212613 ?auto_2212620 ) ) ( not ( = ?auto_2212613 ?auto_2212621 ) ) ( not ( = ?auto_2212613 ?auto_2212622 ) ) ( not ( = ?auto_2212613 ?auto_2212623 ) ) ( not ( = ?auto_2212613 ?auto_2212624 ) ) ( not ( = ?auto_2212613 ?auto_2212625 ) ) ( not ( = ?auto_2212613 ?auto_2212626 ) ) ( not ( = ?auto_2212613 ?auto_2212627 ) ) ( not ( = ?auto_2212614 ?auto_2212615 ) ) ( not ( = ?auto_2212614 ?auto_2212616 ) ) ( not ( = ?auto_2212614 ?auto_2212617 ) ) ( not ( = ?auto_2212614 ?auto_2212618 ) ) ( not ( = ?auto_2212614 ?auto_2212619 ) ) ( not ( = ?auto_2212614 ?auto_2212620 ) ) ( not ( = ?auto_2212614 ?auto_2212621 ) ) ( not ( = ?auto_2212614 ?auto_2212622 ) ) ( not ( = ?auto_2212614 ?auto_2212623 ) ) ( not ( = ?auto_2212614 ?auto_2212624 ) ) ( not ( = ?auto_2212614 ?auto_2212625 ) ) ( not ( = ?auto_2212614 ?auto_2212626 ) ) ( not ( = ?auto_2212614 ?auto_2212627 ) ) ( not ( = ?auto_2212615 ?auto_2212616 ) ) ( not ( = ?auto_2212615 ?auto_2212617 ) ) ( not ( = ?auto_2212615 ?auto_2212618 ) ) ( not ( = ?auto_2212615 ?auto_2212619 ) ) ( not ( = ?auto_2212615 ?auto_2212620 ) ) ( not ( = ?auto_2212615 ?auto_2212621 ) ) ( not ( = ?auto_2212615 ?auto_2212622 ) ) ( not ( = ?auto_2212615 ?auto_2212623 ) ) ( not ( = ?auto_2212615 ?auto_2212624 ) ) ( not ( = ?auto_2212615 ?auto_2212625 ) ) ( not ( = ?auto_2212615 ?auto_2212626 ) ) ( not ( = ?auto_2212615 ?auto_2212627 ) ) ( not ( = ?auto_2212616 ?auto_2212617 ) ) ( not ( = ?auto_2212616 ?auto_2212618 ) ) ( not ( = ?auto_2212616 ?auto_2212619 ) ) ( not ( = ?auto_2212616 ?auto_2212620 ) ) ( not ( = ?auto_2212616 ?auto_2212621 ) ) ( not ( = ?auto_2212616 ?auto_2212622 ) ) ( not ( = ?auto_2212616 ?auto_2212623 ) ) ( not ( = ?auto_2212616 ?auto_2212624 ) ) ( not ( = ?auto_2212616 ?auto_2212625 ) ) ( not ( = ?auto_2212616 ?auto_2212626 ) ) ( not ( = ?auto_2212616 ?auto_2212627 ) ) ( not ( = ?auto_2212617 ?auto_2212618 ) ) ( not ( = ?auto_2212617 ?auto_2212619 ) ) ( not ( = ?auto_2212617 ?auto_2212620 ) ) ( not ( = ?auto_2212617 ?auto_2212621 ) ) ( not ( = ?auto_2212617 ?auto_2212622 ) ) ( not ( = ?auto_2212617 ?auto_2212623 ) ) ( not ( = ?auto_2212617 ?auto_2212624 ) ) ( not ( = ?auto_2212617 ?auto_2212625 ) ) ( not ( = ?auto_2212617 ?auto_2212626 ) ) ( not ( = ?auto_2212617 ?auto_2212627 ) ) ( not ( = ?auto_2212618 ?auto_2212619 ) ) ( not ( = ?auto_2212618 ?auto_2212620 ) ) ( not ( = ?auto_2212618 ?auto_2212621 ) ) ( not ( = ?auto_2212618 ?auto_2212622 ) ) ( not ( = ?auto_2212618 ?auto_2212623 ) ) ( not ( = ?auto_2212618 ?auto_2212624 ) ) ( not ( = ?auto_2212618 ?auto_2212625 ) ) ( not ( = ?auto_2212618 ?auto_2212626 ) ) ( not ( = ?auto_2212618 ?auto_2212627 ) ) ( not ( = ?auto_2212619 ?auto_2212620 ) ) ( not ( = ?auto_2212619 ?auto_2212621 ) ) ( not ( = ?auto_2212619 ?auto_2212622 ) ) ( not ( = ?auto_2212619 ?auto_2212623 ) ) ( not ( = ?auto_2212619 ?auto_2212624 ) ) ( not ( = ?auto_2212619 ?auto_2212625 ) ) ( not ( = ?auto_2212619 ?auto_2212626 ) ) ( not ( = ?auto_2212619 ?auto_2212627 ) ) ( not ( = ?auto_2212620 ?auto_2212621 ) ) ( not ( = ?auto_2212620 ?auto_2212622 ) ) ( not ( = ?auto_2212620 ?auto_2212623 ) ) ( not ( = ?auto_2212620 ?auto_2212624 ) ) ( not ( = ?auto_2212620 ?auto_2212625 ) ) ( not ( = ?auto_2212620 ?auto_2212626 ) ) ( not ( = ?auto_2212620 ?auto_2212627 ) ) ( not ( = ?auto_2212621 ?auto_2212622 ) ) ( not ( = ?auto_2212621 ?auto_2212623 ) ) ( not ( = ?auto_2212621 ?auto_2212624 ) ) ( not ( = ?auto_2212621 ?auto_2212625 ) ) ( not ( = ?auto_2212621 ?auto_2212626 ) ) ( not ( = ?auto_2212621 ?auto_2212627 ) ) ( not ( = ?auto_2212622 ?auto_2212623 ) ) ( not ( = ?auto_2212622 ?auto_2212624 ) ) ( not ( = ?auto_2212622 ?auto_2212625 ) ) ( not ( = ?auto_2212622 ?auto_2212626 ) ) ( not ( = ?auto_2212622 ?auto_2212627 ) ) ( not ( = ?auto_2212623 ?auto_2212624 ) ) ( not ( = ?auto_2212623 ?auto_2212625 ) ) ( not ( = ?auto_2212623 ?auto_2212626 ) ) ( not ( = ?auto_2212623 ?auto_2212627 ) ) ( not ( = ?auto_2212624 ?auto_2212625 ) ) ( not ( = ?auto_2212624 ?auto_2212626 ) ) ( not ( = ?auto_2212624 ?auto_2212627 ) ) ( not ( = ?auto_2212625 ?auto_2212626 ) ) ( not ( = ?auto_2212625 ?auto_2212627 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2212626 ?auto_2212627 )
      ( MAKE-15CRATE-VERIFY ?auto_2212612 ?auto_2212613 ?auto_2212614 ?auto_2212615 ?auto_2212616 ?auto_2212617 ?auto_2212618 ?auto_2212619 ?auto_2212620 ?auto_2212621 ?auto_2212622 ?auto_2212623 ?auto_2212624 ?auto_2212625 ?auto_2212626 ?auto_2212627 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212791 - SURFACE
      ?auto_2212792 - SURFACE
      ?auto_2212793 - SURFACE
      ?auto_2212794 - SURFACE
      ?auto_2212795 - SURFACE
      ?auto_2212796 - SURFACE
      ?auto_2212797 - SURFACE
      ?auto_2212798 - SURFACE
      ?auto_2212799 - SURFACE
      ?auto_2212800 - SURFACE
      ?auto_2212801 - SURFACE
      ?auto_2212802 - SURFACE
      ?auto_2212803 - SURFACE
      ?auto_2212804 - SURFACE
      ?auto_2212805 - SURFACE
      ?auto_2212806 - SURFACE
    )
    :vars
    (
      ?auto_2212809 - HOIST
      ?auto_2212808 - PLACE
      ?auto_2212807 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2212809 ?auto_2212808 ) ( SURFACE-AT ?auto_2212805 ?auto_2212808 ) ( CLEAR ?auto_2212805 ) ( IS-CRATE ?auto_2212806 ) ( not ( = ?auto_2212805 ?auto_2212806 ) ) ( TRUCK-AT ?auto_2212807 ?auto_2212808 ) ( AVAILABLE ?auto_2212809 ) ( IN ?auto_2212806 ?auto_2212807 ) ( ON ?auto_2212805 ?auto_2212804 ) ( not ( = ?auto_2212804 ?auto_2212805 ) ) ( not ( = ?auto_2212804 ?auto_2212806 ) ) ( ON ?auto_2212792 ?auto_2212791 ) ( ON ?auto_2212793 ?auto_2212792 ) ( ON ?auto_2212794 ?auto_2212793 ) ( ON ?auto_2212795 ?auto_2212794 ) ( ON ?auto_2212796 ?auto_2212795 ) ( ON ?auto_2212797 ?auto_2212796 ) ( ON ?auto_2212798 ?auto_2212797 ) ( ON ?auto_2212799 ?auto_2212798 ) ( ON ?auto_2212800 ?auto_2212799 ) ( ON ?auto_2212801 ?auto_2212800 ) ( ON ?auto_2212802 ?auto_2212801 ) ( ON ?auto_2212803 ?auto_2212802 ) ( ON ?auto_2212804 ?auto_2212803 ) ( not ( = ?auto_2212791 ?auto_2212792 ) ) ( not ( = ?auto_2212791 ?auto_2212793 ) ) ( not ( = ?auto_2212791 ?auto_2212794 ) ) ( not ( = ?auto_2212791 ?auto_2212795 ) ) ( not ( = ?auto_2212791 ?auto_2212796 ) ) ( not ( = ?auto_2212791 ?auto_2212797 ) ) ( not ( = ?auto_2212791 ?auto_2212798 ) ) ( not ( = ?auto_2212791 ?auto_2212799 ) ) ( not ( = ?auto_2212791 ?auto_2212800 ) ) ( not ( = ?auto_2212791 ?auto_2212801 ) ) ( not ( = ?auto_2212791 ?auto_2212802 ) ) ( not ( = ?auto_2212791 ?auto_2212803 ) ) ( not ( = ?auto_2212791 ?auto_2212804 ) ) ( not ( = ?auto_2212791 ?auto_2212805 ) ) ( not ( = ?auto_2212791 ?auto_2212806 ) ) ( not ( = ?auto_2212792 ?auto_2212793 ) ) ( not ( = ?auto_2212792 ?auto_2212794 ) ) ( not ( = ?auto_2212792 ?auto_2212795 ) ) ( not ( = ?auto_2212792 ?auto_2212796 ) ) ( not ( = ?auto_2212792 ?auto_2212797 ) ) ( not ( = ?auto_2212792 ?auto_2212798 ) ) ( not ( = ?auto_2212792 ?auto_2212799 ) ) ( not ( = ?auto_2212792 ?auto_2212800 ) ) ( not ( = ?auto_2212792 ?auto_2212801 ) ) ( not ( = ?auto_2212792 ?auto_2212802 ) ) ( not ( = ?auto_2212792 ?auto_2212803 ) ) ( not ( = ?auto_2212792 ?auto_2212804 ) ) ( not ( = ?auto_2212792 ?auto_2212805 ) ) ( not ( = ?auto_2212792 ?auto_2212806 ) ) ( not ( = ?auto_2212793 ?auto_2212794 ) ) ( not ( = ?auto_2212793 ?auto_2212795 ) ) ( not ( = ?auto_2212793 ?auto_2212796 ) ) ( not ( = ?auto_2212793 ?auto_2212797 ) ) ( not ( = ?auto_2212793 ?auto_2212798 ) ) ( not ( = ?auto_2212793 ?auto_2212799 ) ) ( not ( = ?auto_2212793 ?auto_2212800 ) ) ( not ( = ?auto_2212793 ?auto_2212801 ) ) ( not ( = ?auto_2212793 ?auto_2212802 ) ) ( not ( = ?auto_2212793 ?auto_2212803 ) ) ( not ( = ?auto_2212793 ?auto_2212804 ) ) ( not ( = ?auto_2212793 ?auto_2212805 ) ) ( not ( = ?auto_2212793 ?auto_2212806 ) ) ( not ( = ?auto_2212794 ?auto_2212795 ) ) ( not ( = ?auto_2212794 ?auto_2212796 ) ) ( not ( = ?auto_2212794 ?auto_2212797 ) ) ( not ( = ?auto_2212794 ?auto_2212798 ) ) ( not ( = ?auto_2212794 ?auto_2212799 ) ) ( not ( = ?auto_2212794 ?auto_2212800 ) ) ( not ( = ?auto_2212794 ?auto_2212801 ) ) ( not ( = ?auto_2212794 ?auto_2212802 ) ) ( not ( = ?auto_2212794 ?auto_2212803 ) ) ( not ( = ?auto_2212794 ?auto_2212804 ) ) ( not ( = ?auto_2212794 ?auto_2212805 ) ) ( not ( = ?auto_2212794 ?auto_2212806 ) ) ( not ( = ?auto_2212795 ?auto_2212796 ) ) ( not ( = ?auto_2212795 ?auto_2212797 ) ) ( not ( = ?auto_2212795 ?auto_2212798 ) ) ( not ( = ?auto_2212795 ?auto_2212799 ) ) ( not ( = ?auto_2212795 ?auto_2212800 ) ) ( not ( = ?auto_2212795 ?auto_2212801 ) ) ( not ( = ?auto_2212795 ?auto_2212802 ) ) ( not ( = ?auto_2212795 ?auto_2212803 ) ) ( not ( = ?auto_2212795 ?auto_2212804 ) ) ( not ( = ?auto_2212795 ?auto_2212805 ) ) ( not ( = ?auto_2212795 ?auto_2212806 ) ) ( not ( = ?auto_2212796 ?auto_2212797 ) ) ( not ( = ?auto_2212796 ?auto_2212798 ) ) ( not ( = ?auto_2212796 ?auto_2212799 ) ) ( not ( = ?auto_2212796 ?auto_2212800 ) ) ( not ( = ?auto_2212796 ?auto_2212801 ) ) ( not ( = ?auto_2212796 ?auto_2212802 ) ) ( not ( = ?auto_2212796 ?auto_2212803 ) ) ( not ( = ?auto_2212796 ?auto_2212804 ) ) ( not ( = ?auto_2212796 ?auto_2212805 ) ) ( not ( = ?auto_2212796 ?auto_2212806 ) ) ( not ( = ?auto_2212797 ?auto_2212798 ) ) ( not ( = ?auto_2212797 ?auto_2212799 ) ) ( not ( = ?auto_2212797 ?auto_2212800 ) ) ( not ( = ?auto_2212797 ?auto_2212801 ) ) ( not ( = ?auto_2212797 ?auto_2212802 ) ) ( not ( = ?auto_2212797 ?auto_2212803 ) ) ( not ( = ?auto_2212797 ?auto_2212804 ) ) ( not ( = ?auto_2212797 ?auto_2212805 ) ) ( not ( = ?auto_2212797 ?auto_2212806 ) ) ( not ( = ?auto_2212798 ?auto_2212799 ) ) ( not ( = ?auto_2212798 ?auto_2212800 ) ) ( not ( = ?auto_2212798 ?auto_2212801 ) ) ( not ( = ?auto_2212798 ?auto_2212802 ) ) ( not ( = ?auto_2212798 ?auto_2212803 ) ) ( not ( = ?auto_2212798 ?auto_2212804 ) ) ( not ( = ?auto_2212798 ?auto_2212805 ) ) ( not ( = ?auto_2212798 ?auto_2212806 ) ) ( not ( = ?auto_2212799 ?auto_2212800 ) ) ( not ( = ?auto_2212799 ?auto_2212801 ) ) ( not ( = ?auto_2212799 ?auto_2212802 ) ) ( not ( = ?auto_2212799 ?auto_2212803 ) ) ( not ( = ?auto_2212799 ?auto_2212804 ) ) ( not ( = ?auto_2212799 ?auto_2212805 ) ) ( not ( = ?auto_2212799 ?auto_2212806 ) ) ( not ( = ?auto_2212800 ?auto_2212801 ) ) ( not ( = ?auto_2212800 ?auto_2212802 ) ) ( not ( = ?auto_2212800 ?auto_2212803 ) ) ( not ( = ?auto_2212800 ?auto_2212804 ) ) ( not ( = ?auto_2212800 ?auto_2212805 ) ) ( not ( = ?auto_2212800 ?auto_2212806 ) ) ( not ( = ?auto_2212801 ?auto_2212802 ) ) ( not ( = ?auto_2212801 ?auto_2212803 ) ) ( not ( = ?auto_2212801 ?auto_2212804 ) ) ( not ( = ?auto_2212801 ?auto_2212805 ) ) ( not ( = ?auto_2212801 ?auto_2212806 ) ) ( not ( = ?auto_2212802 ?auto_2212803 ) ) ( not ( = ?auto_2212802 ?auto_2212804 ) ) ( not ( = ?auto_2212802 ?auto_2212805 ) ) ( not ( = ?auto_2212802 ?auto_2212806 ) ) ( not ( = ?auto_2212803 ?auto_2212804 ) ) ( not ( = ?auto_2212803 ?auto_2212805 ) ) ( not ( = ?auto_2212803 ?auto_2212806 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212804 ?auto_2212805 ?auto_2212806 )
      ( MAKE-15CRATE-VERIFY ?auto_2212791 ?auto_2212792 ?auto_2212793 ?auto_2212794 ?auto_2212795 ?auto_2212796 ?auto_2212797 ?auto_2212798 ?auto_2212799 ?auto_2212800 ?auto_2212801 ?auto_2212802 ?auto_2212803 ?auto_2212804 ?auto_2212805 ?auto_2212806 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2212986 - SURFACE
      ?auto_2212987 - SURFACE
      ?auto_2212988 - SURFACE
      ?auto_2212989 - SURFACE
      ?auto_2212990 - SURFACE
      ?auto_2212991 - SURFACE
      ?auto_2212992 - SURFACE
      ?auto_2212993 - SURFACE
      ?auto_2212994 - SURFACE
      ?auto_2212995 - SURFACE
      ?auto_2212996 - SURFACE
      ?auto_2212997 - SURFACE
      ?auto_2212998 - SURFACE
      ?auto_2212999 - SURFACE
      ?auto_2213000 - SURFACE
      ?auto_2213001 - SURFACE
    )
    :vars
    (
      ?auto_2213004 - HOIST
      ?auto_2213005 - PLACE
      ?auto_2213003 - TRUCK
      ?auto_2213002 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213004 ?auto_2213005 ) ( SURFACE-AT ?auto_2213000 ?auto_2213005 ) ( CLEAR ?auto_2213000 ) ( IS-CRATE ?auto_2213001 ) ( not ( = ?auto_2213000 ?auto_2213001 ) ) ( AVAILABLE ?auto_2213004 ) ( IN ?auto_2213001 ?auto_2213003 ) ( ON ?auto_2213000 ?auto_2212999 ) ( not ( = ?auto_2212999 ?auto_2213000 ) ) ( not ( = ?auto_2212999 ?auto_2213001 ) ) ( TRUCK-AT ?auto_2213003 ?auto_2213002 ) ( not ( = ?auto_2213002 ?auto_2213005 ) ) ( ON ?auto_2212987 ?auto_2212986 ) ( ON ?auto_2212988 ?auto_2212987 ) ( ON ?auto_2212989 ?auto_2212988 ) ( ON ?auto_2212990 ?auto_2212989 ) ( ON ?auto_2212991 ?auto_2212990 ) ( ON ?auto_2212992 ?auto_2212991 ) ( ON ?auto_2212993 ?auto_2212992 ) ( ON ?auto_2212994 ?auto_2212993 ) ( ON ?auto_2212995 ?auto_2212994 ) ( ON ?auto_2212996 ?auto_2212995 ) ( ON ?auto_2212997 ?auto_2212996 ) ( ON ?auto_2212998 ?auto_2212997 ) ( ON ?auto_2212999 ?auto_2212998 ) ( not ( = ?auto_2212986 ?auto_2212987 ) ) ( not ( = ?auto_2212986 ?auto_2212988 ) ) ( not ( = ?auto_2212986 ?auto_2212989 ) ) ( not ( = ?auto_2212986 ?auto_2212990 ) ) ( not ( = ?auto_2212986 ?auto_2212991 ) ) ( not ( = ?auto_2212986 ?auto_2212992 ) ) ( not ( = ?auto_2212986 ?auto_2212993 ) ) ( not ( = ?auto_2212986 ?auto_2212994 ) ) ( not ( = ?auto_2212986 ?auto_2212995 ) ) ( not ( = ?auto_2212986 ?auto_2212996 ) ) ( not ( = ?auto_2212986 ?auto_2212997 ) ) ( not ( = ?auto_2212986 ?auto_2212998 ) ) ( not ( = ?auto_2212986 ?auto_2212999 ) ) ( not ( = ?auto_2212986 ?auto_2213000 ) ) ( not ( = ?auto_2212986 ?auto_2213001 ) ) ( not ( = ?auto_2212987 ?auto_2212988 ) ) ( not ( = ?auto_2212987 ?auto_2212989 ) ) ( not ( = ?auto_2212987 ?auto_2212990 ) ) ( not ( = ?auto_2212987 ?auto_2212991 ) ) ( not ( = ?auto_2212987 ?auto_2212992 ) ) ( not ( = ?auto_2212987 ?auto_2212993 ) ) ( not ( = ?auto_2212987 ?auto_2212994 ) ) ( not ( = ?auto_2212987 ?auto_2212995 ) ) ( not ( = ?auto_2212987 ?auto_2212996 ) ) ( not ( = ?auto_2212987 ?auto_2212997 ) ) ( not ( = ?auto_2212987 ?auto_2212998 ) ) ( not ( = ?auto_2212987 ?auto_2212999 ) ) ( not ( = ?auto_2212987 ?auto_2213000 ) ) ( not ( = ?auto_2212987 ?auto_2213001 ) ) ( not ( = ?auto_2212988 ?auto_2212989 ) ) ( not ( = ?auto_2212988 ?auto_2212990 ) ) ( not ( = ?auto_2212988 ?auto_2212991 ) ) ( not ( = ?auto_2212988 ?auto_2212992 ) ) ( not ( = ?auto_2212988 ?auto_2212993 ) ) ( not ( = ?auto_2212988 ?auto_2212994 ) ) ( not ( = ?auto_2212988 ?auto_2212995 ) ) ( not ( = ?auto_2212988 ?auto_2212996 ) ) ( not ( = ?auto_2212988 ?auto_2212997 ) ) ( not ( = ?auto_2212988 ?auto_2212998 ) ) ( not ( = ?auto_2212988 ?auto_2212999 ) ) ( not ( = ?auto_2212988 ?auto_2213000 ) ) ( not ( = ?auto_2212988 ?auto_2213001 ) ) ( not ( = ?auto_2212989 ?auto_2212990 ) ) ( not ( = ?auto_2212989 ?auto_2212991 ) ) ( not ( = ?auto_2212989 ?auto_2212992 ) ) ( not ( = ?auto_2212989 ?auto_2212993 ) ) ( not ( = ?auto_2212989 ?auto_2212994 ) ) ( not ( = ?auto_2212989 ?auto_2212995 ) ) ( not ( = ?auto_2212989 ?auto_2212996 ) ) ( not ( = ?auto_2212989 ?auto_2212997 ) ) ( not ( = ?auto_2212989 ?auto_2212998 ) ) ( not ( = ?auto_2212989 ?auto_2212999 ) ) ( not ( = ?auto_2212989 ?auto_2213000 ) ) ( not ( = ?auto_2212989 ?auto_2213001 ) ) ( not ( = ?auto_2212990 ?auto_2212991 ) ) ( not ( = ?auto_2212990 ?auto_2212992 ) ) ( not ( = ?auto_2212990 ?auto_2212993 ) ) ( not ( = ?auto_2212990 ?auto_2212994 ) ) ( not ( = ?auto_2212990 ?auto_2212995 ) ) ( not ( = ?auto_2212990 ?auto_2212996 ) ) ( not ( = ?auto_2212990 ?auto_2212997 ) ) ( not ( = ?auto_2212990 ?auto_2212998 ) ) ( not ( = ?auto_2212990 ?auto_2212999 ) ) ( not ( = ?auto_2212990 ?auto_2213000 ) ) ( not ( = ?auto_2212990 ?auto_2213001 ) ) ( not ( = ?auto_2212991 ?auto_2212992 ) ) ( not ( = ?auto_2212991 ?auto_2212993 ) ) ( not ( = ?auto_2212991 ?auto_2212994 ) ) ( not ( = ?auto_2212991 ?auto_2212995 ) ) ( not ( = ?auto_2212991 ?auto_2212996 ) ) ( not ( = ?auto_2212991 ?auto_2212997 ) ) ( not ( = ?auto_2212991 ?auto_2212998 ) ) ( not ( = ?auto_2212991 ?auto_2212999 ) ) ( not ( = ?auto_2212991 ?auto_2213000 ) ) ( not ( = ?auto_2212991 ?auto_2213001 ) ) ( not ( = ?auto_2212992 ?auto_2212993 ) ) ( not ( = ?auto_2212992 ?auto_2212994 ) ) ( not ( = ?auto_2212992 ?auto_2212995 ) ) ( not ( = ?auto_2212992 ?auto_2212996 ) ) ( not ( = ?auto_2212992 ?auto_2212997 ) ) ( not ( = ?auto_2212992 ?auto_2212998 ) ) ( not ( = ?auto_2212992 ?auto_2212999 ) ) ( not ( = ?auto_2212992 ?auto_2213000 ) ) ( not ( = ?auto_2212992 ?auto_2213001 ) ) ( not ( = ?auto_2212993 ?auto_2212994 ) ) ( not ( = ?auto_2212993 ?auto_2212995 ) ) ( not ( = ?auto_2212993 ?auto_2212996 ) ) ( not ( = ?auto_2212993 ?auto_2212997 ) ) ( not ( = ?auto_2212993 ?auto_2212998 ) ) ( not ( = ?auto_2212993 ?auto_2212999 ) ) ( not ( = ?auto_2212993 ?auto_2213000 ) ) ( not ( = ?auto_2212993 ?auto_2213001 ) ) ( not ( = ?auto_2212994 ?auto_2212995 ) ) ( not ( = ?auto_2212994 ?auto_2212996 ) ) ( not ( = ?auto_2212994 ?auto_2212997 ) ) ( not ( = ?auto_2212994 ?auto_2212998 ) ) ( not ( = ?auto_2212994 ?auto_2212999 ) ) ( not ( = ?auto_2212994 ?auto_2213000 ) ) ( not ( = ?auto_2212994 ?auto_2213001 ) ) ( not ( = ?auto_2212995 ?auto_2212996 ) ) ( not ( = ?auto_2212995 ?auto_2212997 ) ) ( not ( = ?auto_2212995 ?auto_2212998 ) ) ( not ( = ?auto_2212995 ?auto_2212999 ) ) ( not ( = ?auto_2212995 ?auto_2213000 ) ) ( not ( = ?auto_2212995 ?auto_2213001 ) ) ( not ( = ?auto_2212996 ?auto_2212997 ) ) ( not ( = ?auto_2212996 ?auto_2212998 ) ) ( not ( = ?auto_2212996 ?auto_2212999 ) ) ( not ( = ?auto_2212996 ?auto_2213000 ) ) ( not ( = ?auto_2212996 ?auto_2213001 ) ) ( not ( = ?auto_2212997 ?auto_2212998 ) ) ( not ( = ?auto_2212997 ?auto_2212999 ) ) ( not ( = ?auto_2212997 ?auto_2213000 ) ) ( not ( = ?auto_2212997 ?auto_2213001 ) ) ( not ( = ?auto_2212998 ?auto_2212999 ) ) ( not ( = ?auto_2212998 ?auto_2213000 ) ) ( not ( = ?auto_2212998 ?auto_2213001 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2212999 ?auto_2213000 ?auto_2213001 )
      ( MAKE-15CRATE-VERIFY ?auto_2212986 ?auto_2212987 ?auto_2212988 ?auto_2212989 ?auto_2212990 ?auto_2212991 ?auto_2212992 ?auto_2212993 ?auto_2212994 ?auto_2212995 ?auto_2212996 ?auto_2212997 ?auto_2212998 ?auto_2212999 ?auto_2213000 ?auto_2213001 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213196 - SURFACE
      ?auto_2213197 - SURFACE
      ?auto_2213198 - SURFACE
      ?auto_2213199 - SURFACE
      ?auto_2213200 - SURFACE
      ?auto_2213201 - SURFACE
      ?auto_2213202 - SURFACE
      ?auto_2213203 - SURFACE
      ?auto_2213204 - SURFACE
      ?auto_2213205 - SURFACE
      ?auto_2213206 - SURFACE
      ?auto_2213207 - SURFACE
      ?auto_2213208 - SURFACE
      ?auto_2213209 - SURFACE
      ?auto_2213210 - SURFACE
      ?auto_2213211 - SURFACE
    )
    :vars
    (
      ?auto_2213215 - HOIST
      ?auto_2213214 - PLACE
      ?auto_2213212 - TRUCK
      ?auto_2213213 - PLACE
      ?auto_2213216 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213215 ?auto_2213214 ) ( SURFACE-AT ?auto_2213210 ?auto_2213214 ) ( CLEAR ?auto_2213210 ) ( IS-CRATE ?auto_2213211 ) ( not ( = ?auto_2213210 ?auto_2213211 ) ) ( AVAILABLE ?auto_2213215 ) ( ON ?auto_2213210 ?auto_2213209 ) ( not ( = ?auto_2213209 ?auto_2213210 ) ) ( not ( = ?auto_2213209 ?auto_2213211 ) ) ( TRUCK-AT ?auto_2213212 ?auto_2213213 ) ( not ( = ?auto_2213213 ?auto_2213214 ) ) ( HOIST-AT ?auto_2213216 ?auto_2213213 ) ( LIFTING ?auto_2213216 ?auto_2213211 ) ( not ( = ?auto_2213215 ?auto_2213216 ) ) ( ON ?auto_2213197 ?auto_2213196 ) ( ON ?auto_2213198 ?auto_2213197 ) ( ON ?auto_2213199 ?auto_2213198 ) ( ON ?auto_2213200 ?auto_2213199 ) ( ON ?auto_2213201 ?auto_2213200 ) ( ON ?auto_2213202 ?auto_2213201 ) ( ON ?auto_2213203 ?auto_2213202 ) ( ON ?auto_2213204 ?auto_2213203 ) ( ON ?auto_2213205 ?auto_2213204 ) ( ON ?auto_2213206 ?auto_2213205 ) ( ON ?auto_2213207 ?auto_2213206 ) ( ON ?auto_2213208 ?auto_2213207 ) ( ON ?auto_2213209 ?auto_2213208 ) ( not ( = ?auto_2213196 ?auto_2213197 ) ) ( not ( = ?auto_2213196 ?auto_2213198 ) ) ( not ( = ?auto_2213196 ?auto_2213199 ) ) ( not ( = ?auto_2213196 ?auto_2213200 ) ) ( not ( = ?auto_2213196 ?auto_2213201 ) ) ( not ( = ?auto_2213196 ?auto_2213202 ) ) ( not ( = ?auto_2213196 ?auto_2213203 ) ) ( not ( = ?auto_2213196 ?auto_2213204 ) ) ( not ( = ?auto_2213196 ?auto_2213205 ) ) ( not ( = ?auto_2213196 ?auto_2213206 ) ) ( not ( = ?auto_2213196 ?auto_2213207 ) ) ( not ( = ?auto_2213196 ?auto_2213208 ) ) ( not ( = ?auto_2213196 ?auto_2213209 ) ) ( not ( = ?auto_2213196 ?auto_2213210 ) ) ( not ( = ?auto_2213196 ?auto_2213211 ) ) ( not ( = ?auto_2213197 ?auto_2213198 ) ) ( not ( = ?auto_2213197 ?auto_2213199 ) ) ( not ( = ?auto_2213197 ?auto_2213200 ) ) ( not ( = ?auto_2213197 ?auto_2213201 ) ) ( not ( = ?auto_2213197 ?auto_2213202 ) ) ( not ( = ?auto_2213197 ?auto_2213203 ) ) ( not ( = ?auto_2213197 ?auto_2213204 ) ) ( not ( = ?auto_2213197 ?auto_2213205 ) ) ( not ( = ?auto_2213197 ?auto_2213206 ) ) ( not ( = ?auto_2213197 ?auto_2213207 ) ) ( not ( = ?auto_2213197 ?auto_2213208 ) ) ( not ( = ?auto_2213197 ?auto_2213209 ) ) ( not ( = ?auto_2213197 ?auto_2213210 ) ) ( not ( = ?auto_2213197 ?auto_2213211 ) ) ( not ( = ?auto_2213198 ?auto_2213199 ) ) ( not ( = ?auto_2213198 ?auto_2213200 ) ) ( not ( = ?auto_2213198 ?auto_2213201 ) ) ( not ( = ?auto_2213198 ?auto_2213202 ) ) ( not ( = ?auto_2213198 ?auto_2213203 ) ) ( not ( = ?auto_2213198 ?auto_2213204 ) ) ( not ( = ?auto_2213198 ?auto_2213205 ) ) ( not ( = ?auto_2213198 ?auto_2213206 ) ) ( not ( = ?auto_2213198 ?auto_2213207 ) ) ( not ( = ?auto_2213198 ?auto_2213208 ) ) ( not ( = ?auto_2213198 ?auto_2213209 ) ) ( not ( = ?auto_2213198 ?auto_2213210 ) ) ( not ( = ?auto_2213198 ?auto_2213211 ) ) ( not ( = ?auto_2213199 ?auto_2213200 ) ) ( not ( = ?auto_2213199 ?auto_2213201 ) ) ( not ( = ?auto_2213199 ?auto_2213202 ) ) ( not ( = ?auto_2213199 ?auto_2213203 ) ) ( not ( = ?auto_2213199 ?auto_2213204 ) ) ( not ( = ?auto_2213199 ?auto_2213205 ) ) ( not ( = ?auto_2213199 ?auto_2213206 ) ) ( not ( = ?auto_2213199 ?auto_2213207 ) ) ( not ( = ?auto_2213199 ?auto_2213208 ) ) ( not ( = ?auto_2213199 ?auto_2213209 ) ) ( not ( = ?auto_2213199 ?auto_2213210 ) ) ( not ( = ?auto_2213199 ?auto_2213211 ) ) ( not ( = ?auto_2213200 ?auto_2213201 ) ) ( not ( = ?auto_2213200 ?auto_2213202 ) ) ( not ( = ?auto_2213200 ?auto_2213203 ) ) ( not ( = ?auto_2213200 ?auto_2213204 ) ) ( not ( = ?auto_2213200 ?auto_2213205 ) ) ( not ( = ?auto_2213200 ?auto_2213206 ) ) ( not ( = ?auto_2213200 ?auto_2213207 ) ) ( not ( = ?auto_2213200 ?auto_2213208 ) ) ( not ( = ?auto_2213200 ?auto_2213209 ) ) ( not ( = ?auto_2213200 ?auto_2213210 ) ) ( not ( = ?auto_2213200 ?auto_2213211 ) ) ( not ( = ?auto_2213201 ?auto_2213202 ) ) ( not ( = ?auto_2213201 ?auto_2213203 ) ) ( not ( = ?auto_2213201 ?auto_2213204 ) ) ( not ( = ?auto_2213201 ?auto_2213205 ) ) ( not ( = ?auto_2213201 ?auto_2213206 ) ) ( not ( = ?auto_2213201 ?auto_2213207 ) ) ( not ( = ?auto_2213201 ?auto_2213208 ) ) ( not ( = ?auto_2213201 ?auto_2213209 ) ) ( not ( = ?auto_2213201 ?auto_2213210 ) ) ( not ( = ?auto_2213201 ?auto_2213211 ) ) ( not ( = ?auto_2213202 ?auto_2213203 ) ) ( not ( = ?auto_2213202 ?auto_2213204 ) ) ( not ( = ?auto_2213202 ?auto_2213205 ) ) ( not ( = ?auto_2213202 ?auto_2213206 ) ) ( not ( = ?auto_2213202 ?auto_2213207 ) ) ( not ( = ?auto_2213202 ?auto_2213208 ) ) ( not ( = ?auto_2213202 ?auto_2213209 ) ) ( not ( = ?auto_2213202 ?auto_2213210 ) ) ( not ( = ?auto_2213202 ?auto_2213211 ) ) ( not ( = ?auto_2213203 ?auto_2213204 ) ) ( not ( = ?auto_2213203 ?auto_2213205 ) ) ( not ( = ?auto_2213203 ?auto_2213206 ) ) ( not ( = ?auto_2213203 ?auto_2213207 ) ) ( not ( = ?auto_2213203 ?auto_2213208 ) ) ( not ( = ?auto_2213203 ?auto_2213209 ) ) ( not ( = ?auto_2213203 ?auto_2213210 ) ) ( not ( = ?auto_2213203 ?auto_2213211 ) ) ( not ( = ?auto_2213204 ?auto_2213205 ) ) ( not ( = ?auto_2213204 ?auto_2213206 ) ) ( not ( = ?auto_2213204 ?auto_2213207 ) ) ( not ( = ?auto_2213204 ?auto_2213208 ) ) ( not ( = ?auto_2213204 ?auto_2213209 ) ) ( not ( = ?auto_2213204 ?auto_2213210 ) ) ( not ( = ?auto_2213204 ?auto_2213211 ) ) ( not ( = ?auto_2213205 ?auto_2213206 ) ) ( not ( = ?auto_2213205 ?auto_2213207 ) ) ( not ( = ?auto_2213205 ?auto_2213208 ) ) ( not ( = ?auto_2213205 ?auto_2213209 ) ) ( not ( = ?auto_2213205 ?auto_2213210 ) ) ( not ( = ?auto_2213205 ?auto_2213211 ) ) ( not ( = ?auto_2213206 ?auto_2213207 ) ) ( not ( = ?auto_2213206 ?auto_2213208 ) ) ( not ( = ?auto_2213206 ?auto_2213209 ) ) ( not ( = ?auto_2213206 ?auto_2213210 ) ) ( not ( = ?auto_2213206 ?auto_2213211 ) ) ( not ( = ?auto_2213207 ?auto_2213208 ) ) ( not ( = ?auto_2213207 ?auto_2213209 ) ) ( not ( = ?auto_2213207 ?auto_2213210 ) ) ( not ( = ?auto_2213207 ?auto_2213211 ) ) ( not ( = ?auto_2213208 ?auto_2213209 ) ) ( not ( = ?auto_2213208 ?auto_2213210 ) ) ( not ( = ?auto_2213208 ?auto_2213211 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213209 ?auto_2213210 ?auto_2213211 )
      ( MAKE-15CRATE-VERIFY ?auto_2213196 ?auto_2213197 ?auto_2213198 ?auto_2213199 ?auto_2213200 ?auto_2213201 ?auto_2213202 ?auto_2213203 ?auto_2213204 ?auto_2213205 ?auto_2213206 ?auto_2213207 ?auto_2213208 ?auto_2213209 ?auto_2213210 ?auto_2213211 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213421 - SURFACE
      ?auto_2213422 - SURFACE
      ?auto_2213423 - SURFACE
      ?auto_2213424 - SURFACE
      ?auto_2213425 - SURFACE
      ?auto_2213426 - SURFACE
      ?auto_2213427 - SURFACE
      ?auto_2213428 - SURFACE
      ?auto_2213429 - SURFACE
      ?auto_2213430 - SURFACE
      ?auto_2213431 - SURFACE
      ?auto_2213432 - SURFACE
      ?auto_2213433 - SURFACE
      ?auto_2213434 - SURFACE
      ?auto_2213435 - SURFACE
      ?auto_2213436 - SURFACE
    )
    :vars
    (
      ?auto_2213438 - HOIST
      ?auto_2213441 - PLACE
      ?auto_2213439 - TRUCK
      ?auto_2213440 - PLACE
      ?auto_2213442 - HOIST
      ?auto_2213437 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213438 ?auto_2213441 ) ( SURFACE-AT ?auto_2213435 ?auto_2213441 ) ( CLEAR ?auto_2213435 ) ( IS-CRATE ?auto_2213436 ) ( not ( = ?auto_2213435 ?auto_2213436 ) ) ( AVAILABLE ?auto_2213438 ) ( ON ?auto_2213435 ?auto_2213434 ) ( not ( = ?auto_2213434 ?auto_2213435 ) ) ( not ( = ?auto_2213434 ?auto_2213436 ) ) ( TRUCK-AT ?auto_2213439 ?auto_2213440 ) ( not ( = ?auto_2213440 ?auto_2213441 ) ) ( HOIST-AT ?auto_2213442 ?auto_2213440 ) ( not ( = ?auto_2213438 ?auto_2213442 ) ) ( AVAILABLE ?auto_2213442 ) ( SURFACE-AT ?auto_2213436 ?auto_2213440 ) ( ON ?auto_2213436 ?auto_2213437 ) ( CLEAR ?auto_2213436 ) ( not ( = ?auto_2213435 ?auto_2213437 ) ) ( not ( = ?auto_2213436 ?auto_2213437 ) ) ( not ( = ?auto_2213434 ?auto_2213437 ) ) ( ON ?auto_2213422 ?auto_2213421 ) ( ON ?auto_2213423 ?auto_2213422 ) ( ON ?auto_2213424 ?auto_2213423 ) ( ON ?auto_2213425 ?auto_2213424 ) ( ON ?auto_2213426 ?auto_2213425 ) ( ON ?auto_2213427 ?auto_2213426 ) ( ON ?auto_2213428 ?auto_2213427 ) ( ON ?auto_2213429 ?auto_2213428 ) ( ON ?auto_2213430 ?auto_2213429 ) ( ON ?auto_2213431 ?auto_2213430 ) ( ON ?auto_2213432 ?auto_2213431 ) ( ON ?auto_2213433 ?auto_2213432 ) ( ON ?auto_2213434 ?auto_2213433 ) ( not ( = ?auto_2213421 ?auto_2213422 ) ) ( not ( = ?auto_2213421 ?auto_2213423 ) ) ( not ( = ?auto_2213421 ?auto_2213424 ) ) ( not ( = ?auto_2213421 ?auto_2213425 ) ) ( not ( = ?auto_2213421 ?auto_2213426 ) ) ( not ( = ?auto_2213421 ?auto_2213427 ) ) ( not ( = ?auto_2213421 ?auto_2213428 ) ) ( not ( = ?auto_2213421 ?auto_2213429 ) ) ( not ( = ?auto_2213421 ?auto_2213430 ) ) ( not ( = ?auto_2213421 ?auto_2213431 ) ) ( not ( = ?auto_2213421 ?auto_2213432 ) ) ( not ( = ?auto_2213421 ?auto_2213433 ) ) ( not ( = ?auto_2213421 ?auto_2213434 ) ) ( not ( = ?auto_2213421 ?auto_2213435 ) ) ( not ( = ?auto_2213421 ?auto_2213436 ) ) ( not ( = ?auto_2213421 ?auto_2213437 ) ) ( not ( = ?auto_2213422 ?auto_2213423 ) ) ( not ( = ?auto_2213422 ?auto_2213424 ) ) ( not ( = ?auto_2213422 ?auto_2213425 ) ) ( not ( = ?auto_2213422 ?auto_2213426 ) ) ( not ( = ?auto_2213422 ?auto_2213427 ) ) ( not ( = ?auto_2213422 ?auto_2213428 ) ) ( not ( = ?auto_2213422 ?auto_2213429 ) ) ( not ( = ?auto_2213422 ?auto_2213430 ) ) ( not ( = ?auto_2213422 ?auto_2213431 ) ) ( not ( = ?auto_2213422 ?auto_2213432 ) ) ( not ( = ?auto_2213422 ?auto_2213433 ) ) ( not ( = ?auto_2213422 ?auto_2213434 ) ) ( not ( = ?auto_2213422 ?auto_2213435 ) ) ( not ( = ?auto_2213422 ?auto_2213436 ) ) ( not ( = ?auto_2213422 ?auto_2213437 ) ) ( not ( = ?auto_2213423 ?auto_2213424 ) ) ( not ( = ?auto_2213423 ?auto_2213425 ) ) ( not ( = ?auto_2213423 ?auto_2213426 ) ) ( not ( = ?auto_2213423 ?auto_2213427 ) ) ( not ( = ?auto_2213423 ?auto_2213428 ) ) ( not ( = ?auto_2213423 ?auto_2213429 ) ) ( not ( = ?auto_2213423 ?auto_2213430 ) ) ( not ( = ?auto_2213423 ?auto_2213431 ) ) ( not ( = ?auto_2213423 ?auto_2213432 ) ) ( not ( = ?auto_2213423 ?auto_2213433 ) ) ( not ( = ?auto_2213423 ?auto_2213434 ) ) ( not ( = ?auto_2213423 ?auto_2213435 ) ) ( not ( = ?auto_2213423 ?auto_2213436 ) ) ( not ( = ?auto_2213423 ?auto_2213437 ) ) ( not ( = ?auto_2213424 ?auto_2213425 ) ) ( not ( = ?auto_2213424 ?auto_2213426 ) ) ( not ( = ?auto_2213424 ?auto_2213427 ) ) ( not ( = ?auto_2213424 ?auto_2213428 ) ) ( not ( = ?auto_2213424 ?auto_2213429 ) ) ( not ( = ?auto_2213424 ?auto_2213430 ) ) ( not ( = ?auto_2213424 ?auto_2213431 ) ) ( not ( = ?auto_2213424 ?auto_2213432 ) ) ( not ( = ?auto_2213424 ?auto_2213433 ) ) ( not ( = ?auto_2213424 ?auto_2213434 ) ) ( not ( = ?auto_2213424 ?auto_2213435 ) ) ( not ( = ?auto_2213424 ?auto_2213436 ) ) ( not ( = ?auto_2213424 ?auto_2213437 ) ) ( not ( = ?auto_2213425 ?auto_2213426 ) ) ( not ( = ?auto_2213425 ?auto_2213427 ) ) ( not ( = ?auto_2213425 ?auto_2213428 ) ) ( not ( = ?auto_2213425 ?auto_2213429 ) ) ( not ( = ?auto_2213425 ?auto_2213430 ) ) ( not ( = ?auto_2213425 ?auto_2213431 ) ) ( not ( = ?auto_2213425 ?auto_2213432 ) ) ( not ( = ?auto_2213425 ?auto_2213433 ) ) ( not ( = ?auto_2213425 ?auto_2213434 ) ) ( not ( = ?auto_2213425 ?auto_2213435 ) ) ( not ( = ?auto_2213425 ?auto_2213436 ) ) ( not ( = ?auto_2213425 ?auto_2213437 ) ) ( not ( = ?auto_2213426 ?auto_2213427 ) ) ( not ( = ?auto_2213426 ?auto_2213428 ) ) ( not ( = ?auto_2213426 ?auto_2213429 ) ) ( not ( = ?auto_2213426 ?auto_2213430 ) ) ( not ( = ?auto_2213426 ?auto_2213431 ) ) ( not ( = ?auto_2213426 ?auto_2213432 ) ) ( not ( = ?auto_2213426 ?auto_2213433 ) ) ( not ( = ?auto_2213426 ?auto_2213434 ) ) ( not ( = ?auto_2213426 ?auto_2213435 ) ) ( not ( = ?auto_2213426 ?auto_2213436 ) ) ( not ( = ?auto_2213426 ?auto_2213437 ) ) ( not ( = ?auto_2213427 ?auto_2213428 ) ) ( not ( = ?auto_2213427 ?auto_2213429 ) ) ( not ( = ?auto_2213427 ?auto_2213430 ) ) ( not ( = ?auto_2213427 ?auto_2213431 ) ) ( not ( = ?auto_2213427 ?auto_2213432 ) ) ( not ( = ?auto_2213427 ?auto_2213433 ) ) ( not ( = ?auto_2213427 ?auto_2213434 ) ) ( not ( = ?auto_2213427 ?auto_2213435 ) ) ( not ( = ?auto_2213427 ?auto_2213436 ) ) ( not ( = ?auto_2213427 ?auto_2213437 ) ) ( not ( = ?auto_2213428 ?auto_2213429 ) ) ( not ( = ?auto_2213428 ?auto_2213430 ) ) ( not ( = ?auto_2213428 ?auto_2213431 ) ) ( not ( = ?auto_2213428 ?auto_2213432 ) ) ( not ( = ?auto_2213428 ?auto_2213433 ) ) ( not ( = ?auto_2213428 ?auto_2213434 ) ) ( not ( = ?auto_2213428 ?auto_2213435 ) ) ( not ( = ?auto_2213428 ?auto_2213436 ) ) ( not ( = ?auto_2213428 ?auto_2213437 ) ) ( not ( = ?auto_2213429 ?auto_2213430 ) ) ( not ( = ?auto_2213429 ?auto_2213431 ) ) ( not ( = ?auto_2213429 ?auto_2213432 ) ) ( not ( = ?auto_2213429 ?auto_2213433 ) ) ( not ( = ?auto_2213429 ?auto_2213434 ) ) ( not ( = ?auto_2213429 ?auto_2213435 ) ) ( not ( = ?auto_2213429 ?auto_2213436 ) ) ( not ( = ?auto_2213429 ?auto_2213437 ) ) ( not ( = ?auto_2213430 ?auto_2213431 ) ) ( not ( = ?auto_2213430 ?auto_2213432 ) ) ( not ( = ?auto_2213430 ?auto_2213433 ) ) ( not ( = ?auto_2213430 ?auto_2213434 ) ) ( not ( = ?auto_2213430 ?auto_2213435 ) ) ( not ( = ?auto_2213430 ?auto_2213436 ) ) ( not ( = ?auto_2213430 ?auto_2213437 ) ) ( not ( = ?auto_2213431 ?auto_2213432 ) ) ( not ( = ?auto_2213431 ?auto_2213433 ) ) ( not ( = ?auto_2213431 ?auto_2213434 ) ) ( not ( = ?auto_2213431 ?auto_2213435 ) ) ( not ( = ?auto_2213431 ?auto_2213436 ) ) ( not ( = ?auto_2213431 ?auto_2213437 ) ) ( not ( = ?auto_2213432 ?auto_2213433 ) ) ( not ( = ?auto_2213432 ?auto_2213434 ) ) ( not ( = ?auto_2213432 ?auto_2213435 ) ) ( not ( = ?auto_2213432 ?auto_2213436 ) ) ( not ( = ?auto_2213432 ?auto_2213437 ) ) ( not ( = ?auto_2213433 ?auto_2213434 ) ) ( not ( = ?auto_2213433 ?auto_2213435 ) ) ( not ( = ?auto_2213433 ?auto_2213436 ) ) ( not ( = ?auto_2213433 ?auto_2213437 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213434 ?auto_2213435 ?auto_2213436 )
      ( MAKE-15CRATE-VERIFY ?auto_2213421 ?auto_2213422 ?auto_2213423 ?auto_2213424 ?auto_2213425 ?auto_2213426 ?auto_2213427 ?auto_2213428 ?auto_2213429 ?auto_2213430 ?auto_2213431 ?auto_2213432 ?auto_2213433 ?auto_2213434 ?auto_2213435 ?auto_2213436 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213647 - SURFACE
      ?auto_2213648 - SURFACE
      ?auto_2213649 - SURFACE
      ?auto_2213650 - SURFACE
      ?auto_2213651 - SURFACE
      ?auto_2213652 - SURFACE
      ?auto_2213653 - SURFACE
      ?auto_2213654 - SURFACE
      ?auto_2213655 - SURFACE
      ?auto_2213656 - SURFACE
      ?auto_2213657 - SURFACE
      ?auto_2213658 - SURFACE
      ?auto_2213659 - SURFACE
      ?auto_2213660 - SURFACE
      ?auto_2213661 - SURFACE
      ?auto_2213662 - SURFACE
    )
    :vars
    (
      ?auto_2213667 - HOIST
      ?auto_2213664 - PLACE
      ?auto_2213663 - PLACE
      ?auto_2213668 - HOIST
      ?auto_2213665 - SURFACE
      ?auto_2213666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213667 ?auto_2213664 ) ( SURFACE-AT ?auto_2213661 ?auto_2213664 ) ( CLEAR ?auto_2213661 ) ( IS-CRATE ?auto_2213662 ) ( not ( = ?auto_2213661 ?auto_2213662 ) ) ( AVAILABLE ?auto_2213667 ) ( ON ?auto_2213661 ?auto_2213660 ) ( not ( = ?auto_2213660 ?auto_2213661 ) ) ( not ( = ?auto_2213660 ?auto_2213662 ) ) ( not ( = ?auto_2213663 ?auto_2213664 ) ) ( HOIST-AT ?auto_2213668 ?auto_2213663 ) ( not ( = ?auto_2213667 ?auto_2213668 ) ) ( AVAILABLE ?auto_2213668 ) ( SURFACE-AT ?auto_2213662 ?auto_2213663 ) ( ON ?auto_2213662 ?auto_2213665 ) ( CLEAR ?auto_2213662 ) ( not ( = ?auto_2213661 ?auto_2213665 ) ) ( not ( = ?auto_2213662 ?auto_2213665 ) ) ( not ( = ?auto_2213660 ?auto_2213665 ) ) ( TRUCK-AT ?auto_2213666 ?auto_2213664 ) ( ON ?auto_2213648 ?auto_2213647 ) ( ON ?auto_2213649 ?auto_2213648 ) ( ON ?auto_2213650 ?auto_2213649 ) ( ON ?auto_2213651 ?auto_2213650 ) ( ON ?auto_2213652 ?auto_2213651 ) ( ON ?auto_2213653 ?auto_2213652 ) ( ON ?auto_2213654 ?auto_2213653 ) ( ON ?auto_2213655 ?auto_2213654 ) ( ON ?auto_2213656 ?auto_2213655 ) ( ON ?auto_2213657 ?auto_2213656 ) ( ON ?auto_2213658 ?auto_2213657 ) ( ON ?auto_2213659 ?auto_2213658 ) ( ON ?auto_2213660 ?auto_2213659 ) ( not ( = ?auto_2213647 ?auto_2213648 ) ) ( not ( = ?auto_2213647 ?auto_2213649 ) ) ( not ( = ?auto_2213647 ?auto_2213650 ) ) ( not ( = ?auto_2213647 ?auto_2213651 ) ) ( not ( = ?auto_2213647 ?auto_2213652 ) ) ( not ( = ?auto_2213647 ?auto_2213653 ) ) ( not ( = ?auto_2213647 ?auto_2213654 ) ) ( not ( = ?auto_2213647 ?auto_2213655 ) ) ( not ( = ?auto_2213647 ?auto_2213656 ) ) ( not ( = ?auto_2213647 ?auto_2213657 ) ) ( not ( = ?auto_2213647 ?auto_2213658 ) ) ( not ( = ?auto_2213647 ?auto_2213659 ) ) ( not ( = ?auto_2213647 ?auto_2213660 ) ) ( not ( = ?auto_2213647 ?auto_2213661 ) ) ( not ( = ?auto_2213647 ?auto_2213662 ) ) ( not ( = ?auto_2213647 ?auto_2213665 ) ) ( not ( = ?auto_2213648 ?auto_2213649 ) ) ( not ( = ?auto_2213648 ?auto_2213650 ) ) ( not ( = ?auto_2213648 ?auto_2213651 ) ) ( not ( = ?auto_2213648 ?auto_2213652 ) ) ( not ( = ?auto_2213648 ?auto_2213653 ) ) ( not ( = ?auto_2213648 ?auto_2213654 ) ) ( not ( = ?auto_2213648 ?auto_2213655 ) ) ( not ( = ?auto_2213648 ?auto_2213656 ) ) ( not ( = ?auto_2213648 ?auto_2213657 ) ) ( not ( = ?auto_2213648 ?auto_2213658 ) ) ( not ( = ?auto_2213648 ?auto_2213659 ) ) ( not ( = ?auto_2213648 ?auto_2213660 ) ) ( not ( = ?auto_2213648 ?auto_2213661 ) ) ( not ( = ?auto_2213648 ?auto_2213662 ) ) ( not ( = ?auto_2213648 ?auto_2213665 ) ) ( not ( = ?auto_2213649 ?auto_2213650 ) ) ( not ( = ?auto_2213649 ?auto_2213651 ) ) ( not ( = ?auto_2213649 ?auto_2213652 ) ) ( not ( = ?auto_2213649 ?auto_2213653 ) ) ( not ( = ?auto_2213649 ?auto_2213654 ) ) ( not ( = ?auto_2213649 ?auto_2213655 ) ) ( not ( = ?auto_2213649 ?auto_2213656 ) ) ( not ( = ?auto_2213649 ?auto_2213657 ) ) ( not ( = ?auto_2213649 ?auto_2213658 ) ) ( not ( = ?auto_2213649 ?auto_2213659 ) ) ( not ( = ?auto_2213649 ?auto_2213660 ) ) ( not ( = ?auto_2213649 ?auto_2213661 ) ) ( not ( = ?auto_2213649 ?auto_2213662 ) ) ( not ( = ?auto_2213649 ?auto_2213665 ) ) ( not ( = ?auto_2213650 ?auto_2213651 ) ) ( not ( = ?auto_2213650 ?auto_2213652 ) ) ( not ( = ?auto_2213650 ?auto_2213653 ) ) ( not ( = ?auto_2213650 ?auto_2213654 ) ) ( not ( = ?auto_2213650 ?auto_2213655 ) ) ( not ( = ?auto_2213650 ?auto_2213656 ) ) ( not ( = ?auto_2213650 ?auto_2213657 ) ) ( not ( = ?auto_2213650 ?auto_2213658 ) ) ( not ( = ?auto_2213650 ?auto_2213659 ) ) ( not ( = ?auto_2213650 ?auto_2213660 ) ) ( not ( = ?auto_2213650 ?auto_2213661 ) ) ( not ( = ?auto_2213650 ?auto_2213662 ) ) ( not ( = ?auto_2213650 ?auto_2213665 ) ) ( not ( = ?auto_2213651 ?auto_2213652 ) ) ( not ( = ?auto_2213651 ?auto_2213653 ) ) ( not ( = ?auto_2213651 ?auto_2213654 ) ) ( not ( = ?auto_2213651 ?auto_2213655 ) ) ( not ( = ?auto_2213651 ?auto_2213656 ) ) ( not ( = ?auto_2213651 ?auto_2213657 ) ) ( not ( = ?auto_2213651 ?auto_2213658 ) ) ( not ( = ?auto_2213651 ?auto_2213659 ) ) ( not ( = ?auto_2213651 ?auto_2213660 ) ) ( not ( = ?auto_2213651 ?auto_2213661 ) ) ( not ( = ?auto_2213651 ?auto_2213662 ) ) ( not ( = ?auto_2213651 ?auto_2213665 ) ) ( not ( = ?auto_2213652 ?auto_2213653 ) ) ( not ( = ?auto_2213652 ?auto_2213654 ) ) ( not ( = ?auto_2213652 ?auto_2213655 ) ) ( not ( = ?auto_2213652 ?auto_2213656 ) ) ( not ( = ?auto_2213652 ?auto_2213657 ) ) ( not ( = ?auto_2213652 ?auto_2213658 ) ) ( not ( = ?auto_2213652 ?auto_2213659 ) ) ( not ( = ?auto_2213652 ?auto_2213660 ) ) ( not ( = ?auto_2213652 ?auto_2213661 ) ) ( not ( = ?auto_2213652 ?auto_2213662 ) ) ( not ( = ?auto_2213652 ?auto_2213665 ) ) ( not ( = ?auto_2213653 ?auto_2213654 ) ) ( not ( = ?auto_2213653 ?auto_2213655 ) ) ( not ( = ?auto_2213653 ?auto_2213656 ) ) ( not ( = ?auto_2213653 ?auto_2213657 ) ) ( not ( = ?auto_2213653 ?auto_2213658 ) ) ( not ( = ?auto_2213653 ?auto_2213659 ) ) ( not ( = ?auto_2213653 ?auto_2213660 ) ) ( not ( = ?auto_2213653 ?auto_2213661 ) ) ( not ( = ?auto_2213653 ?auto_2213662 ) ) ( not ( = ?auto_2213653 ?auto_2213665 ) ) ( not ( = ?auto_2213654 ?auto_2213655 ) ) ( not ( = ?auto_2213654 ?auto_2213656 ) ) ( not ( = ?auto_2213654 ?auto_2213657 ) ) ( not ( = ?auto_2213654 ?auto_2213658 ) ) ( not ( = ?auto_2213654 ?auto_2213659 ) ) ( not ( = ?auto_2213654 ?auto_2213660 ) ) ( not ( = ?auto_2213654 ?auto_2213661 ) ) ( not ( = ?auto_2213654 ?auto_2213662 ) ) ( not ( = ?auto_2213654 ?auto_2213665 ) ) ( not ( = ?auto_2213655 ?auto_2213656 ) ) ( not ( = ?auto_2213655 ?auto_2213657 ) ) ( not ( = ?auto_2213655 ?auto_2213658 ) ) ( not ( = ?auto_2213655 ?auto_2213659 ) ) ( not ( = ?auto_2213655 ?auto_2213660 ) ) ( not ( = ?auto_2213655 ?auto_2213661 ) ) ( not ( = ?auto_2213655 ?auto_2213662 ) ) ( not ( = ?auto_2213655 ?auto_2213665 ) ) ( not ( = ?auto_2213656 ?auto_2213657 ) ) ( not ( = ?auto_2213656 ?auto_2213658 ) ) ( not ( = ?auto_2213656 ?auto_2213659 ) ) ( not ( = ?auto_2213656 ?auto_2213660 ) ) ( not ( = ?auto_2213656 ?auto_2213661 ) ) ( not ( = ?auto_2213656 ?auto_2213662 ) ) ( not ( = ?auto_2213656 ?auto_2213665 ) ) ( not ( = ?auto_2213657 ?auto_2213658 ) ) ( not ( = ?auto_2213657 ?auto_2213659 ) ) ( not ( = ?auto_2213657 ?auto_2213660 ) ) ( not ( = ?auto_2213657 ?auto_2213661 ) ) ( not ( = ?auto_2213657 ?auto_2213662 ) ) ( not ( = ?auto_2213657 ?auto_2213665 ) ) ( not ( = ?auto_2213658 ?auto_2213659 ) ) ( not ( = ?auto_2213658 ?auto_2213660 ) ) ( not ( = ?auto_2213658 ?auto_2213661 ) ) ( not ( = ?auto_2213658 ?auto_2213662 ) ) ( not ( = ?auto_2213658 ?auto_2213665 ) ) ( not ( = ?auto_2213659 ?auto_2213660 ) ) ( not ( = ?auto_2213659 ?auto_2213661 ) ) ( not ( = ?auto_2213659 ?auto_2213662 ) ) ( not ( = ?auto_2213659 ?auto_2213665 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213660 ?auto_2213661 ?auto_2213662 )
      ( MAKE-15CRATE-VERIFY ?auto_2213647 ?auto_2213648 ?auto_2213649 ?auto_2213650 ?auto_2213651 ?auto_2213652 ?auto_2213653 ?auto_2213654 ?auto_2213655 ?auto_2213656 ?auto_2213657 ?auto_2213658 ?auto_2213659 ?auto_2213660 ?auto_2213661 ?auto_2213662 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2213873 - SURFACE
      ?auto_2213874 - SURFACE
      ?auto_2213875 - SURFACE
      ?auto_2213876 - SURFACE
      ?auto_2213877 - SURFACE
      ?auto_2213878 - SURFACE
      ?auto_2213879 - SURFACE
      ?auto_2213880 - SURFACE
      ?auto_2213881 - SURFACE
      ?auto_2213882 - SURFACE
      ?auto_2213883 - SURFACE
      ?auto_2213884 - SURFACE
      ?auto_2213885 - SURFACE
      ?auto_2213886 - SURFACE
      ?auto_2213887 - SURFACE
      ?auto_2213888 - SURFACE
    )
    :vars
    (
      ?auto_2213889 - HOIST
      ?auto_2213893 - PLACE
      ?auto_2213894 - PLACE
      ?auto_2213890 - HOIST
      ?auto_2213892 - SURFACE
      ?auto_2213891 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2213889 ?auto_2213893 ) ( IS-CRATE ?auto_2213888 ) ( not ( = ?auto_2213887 ?auto_2213888 ) ) ( not ( = ?auto_2213886 ?auto_2213887 ) ) ( not ( = ?auto_2213886 ?auto_2213888 ) ) ( not ( = ?auto_2213894 ?auto_2213893 ) ) ( HOIST-AT ?auto_2213890 ?auto_2213894 ) ( not ( = ?auto_2213889 ?auto_2213890 ) ) ( AVAILABLE ?auto_2213890 ) ( SURFACE-AT ?auto_2213888 ?auto_2213894 ) ( ON ?auto_2213888 ?auto_2213892 ) ( CLEAR ?auto_2213888 ) ( not ( = ?auto_2213887 ?auto_2213892 ) ) ( not ( = ?auto_2213888 ?auto_2213892 ) ) ( not ( = ?auto_2213886 ?auto_2213892 ) ) ( TRUCK-AT ?auto_2213891 ?auto_2213893 ) ( SURFACE-AT ?auto_2213886 ?auto_2213893 ) ( CLEAR ?auto_2213886 ) ( LIFTING ?auto_2213889 ?auto_2213887 ) ( IS-CRATE ?auto_2213887 ) ( ON ?auto_2213874 ?auto_2213873 ) ( ON ?auto_2213875 ?auto_2213874 ) ( ON ?auto_2213876 ?auto_2213875 ) ( ON ?auto_2213877 ?auto_2213876 ) ( ON ?auto_2213878 ?auto_2213877 ) ( ON ?auto_2213879 ?auto_2213878 ) ( ON ?auto_2213880 ?auto_2213879 ) ( ON ?auto_2213881 ?auto_2213880 ) ( ON ?auto_2213882 ?auto_2213881 ) ( ON ?auto_2213883 ?auto_2213882 ) ( ON ?auto_2213884 ?auto_2213883 ) ( ON ?auto_2213885 ?auto_2213884 ) ( ON ?auto_2213886 ?auto_2213885 ) ( not ( = ?auto_2213873 ?auto_2213874 ) ) ( not ( = ?auto_2213873 ?auto_2213875 ) ) ( not ( = ?auto_2213873 ?auto_2213876 ) ) ( not ( = ?auto_2213873 ?auto_2213877 ) ) ( not ( = ?auto_2213873 ?auto_2213878 ) ) ( not ( = ?auto_2213873 ?auto_2213879 ) ) ( not ( = ?auto_2213873 ?auto_2213880 ) ) ( not ( = ?auto_2213873 ?auto_2213881 ) ) ( not ( = ?auto_2213873 ?auto_2213882 ) ) ( not ( = ?auto_2213873 ?auto_2213883 ) ) ( not ( = ?auto_2213873 ?auto_2213884 ) ) ( not ( = ?auto_2213873 ?auto_2213885 ) ) ( not ( = ?auto_2213873 ?auto_2213886 ) ) ( not ( = ?auto_2213873 ?auto_2213887 ) ) ( not ( = ?auto_2213873 ?auto_2213888 ) ) ( not ( = ?auto_2213873 ?auto_2213892 ) ) ( not ( = ?auto_2213874 ?auto_2213875 ) ) ( not ( = ?auto_2213874 ?auto_2213876 ) ) ( not ( = ?auto_2213874 ?auto_2213877 ) ) ( not ( = ?auto_2213874 ?auto_2213878 ) ) ( not ( = ?auto_2213874 ?auto_2213879 ) ) ( not ( = ?auto_2213874 ?auto_2213880 ) ) ( not ( = ?auto_2213874 ?auto_2213881 ) ) ( not ( = ?auto_2213874 ?auto_2213882 ) ) ( not ( = ?auto_2213874 ?auto_2213883 ) ) ( not ( = ?auto_2213874 ?auto_2213884 ) ) ( not ( = ?auto_2213874 ?auto_2213885 ) ) ( not ( = ?auto_2213874 ?auto_2213886 ) ) ( not ( = ?auto_2213874 ?auto_2213887 ) ) ( not ( = ?auto_2213874 ?auto_2213888 ) ) ( not ( = ?auto_2213874 ?auto_2213892 ) ) ( not ( = ?auto_2213875 ?auto_2213876 ) ) ( not ( = ?auto_2213875 ?auto_2213877 ) ) ( not ( = ?auto_2213875 ?auto_2213878 ) ) ( not ( = ?auto_2213875 ?auto_2213879 ) ) ( not ( = ?auto_2213875 ?auto_2213880 ) ) ( not ( = ?auto_2213875 ?auto_2213881 ) ) ( not ( = ?auto_2213875 ?auto_2213882 ) ) ( not ( = ?auto_2213875 ?auto_2213883 ) ) ( not ( = ?auto_2213875 ?auto_2213884 ) ) ( not ( = ?auto_2213875 ?auto_2213885 ) ) ( not ( = ?auto_2213875 ?auto_2213886 ) ) ( not ( = ?auto_2213875 ?auto_2213887 ) ) ( not ( = ?auto_2213875 ?auto_2213888 ) ) ( not ( = ?auto_2213875 ?auto_2213892 ) ) ( not ( = ?auto_2213876 ?auto_2213877 ) ) ( not ( = ?auto_2213876 ?auto_2213878 ) ) ( not ( = ?auto_2213876 ?auto_2213879 ) ) ( not ( = ?auto_2213876 ?auto_2213880 ) ) ( not ( = ?auto_2213876 ?auto_2213881 ) ) ( not ( = ?auto_2213876 ?auto_2213882 ) ) ( not ( = ?auto_2213876 ?auto_2213883 ) ) ( not ( = ?auto_2213876 ?auto_2213884 ) ) ( not ( = ?auto_2213876 ?auto_2213885 ) ) ( not ( = ?auto_2213876 ?auto_2213886 ) ) ( not ( = ?auto_2213876 ?auto_2213887 ) ) ( not ( = ?auto_2213876 ?auto_2213888 ) ) ( not ( = ?auto_2213876 ?auto_2213892 ) ) ( not ( = ?auto_2213877 ?auto_2213878 ) ) ( not ( = ?auto_2213877 ?auto_2213879 ) ) ( not ( = ?auto_2213877 ?auto_2213880 ) ) ( not ( = ?auto_2213877 ?auto_2213881 ) ) ( not ( = ?auto_2213877 ?auto_2213882 ) ) ( not ( = ?auto_2213877 ?auto_2213883 ) ) ( not ( = ?auto_2213877 ?auto_2213884 ) ) ( not ( = ?auto_2213877 ?auto_2213885 ) ) ( not ( = ?auto_2213877 ?auto_2213886 ) ) ( not ( = ?auto_2213877 ?auto_2213887 ) ) ( not ( = ?auto_2213877 ?auto_2213888 ) ) ( not ( = ?auto_2213877 ?auto_2213892 ) ) ( not ( = ?auto_2213878 ?auto_2213879 ) ) ( not ( = ?auto_2213878 ?auto_2213880 ) ) ( not ( = ?auto_2213878 ?auto_2213881 ) ) ( not ( = ?auto_2213878 ?auto_2213882 ) ) ( not ( = ?auto_2213878 ?auto_2213883 ) ) ( not ( = ?auto_2213878 ?auto_2213884 ) ) ( not ( = ?auto_2213878 ?auto_2213885 ) ) ( not ( = ?auto_2213878 ?auto_2213886 ) ) ( not ( = ?auto_2213878 ?auto_2213887 ) ) ( not ( = ?auto_2213878 ?auto_2213888 ) ) ( not ( = ?auto_2213878 ?auto_2213892 ) ) ( not ( = ?auto_2213879 ?auto_2213880 ) ) ( not ( = ?auto_2213879 ?auto_2213881 ) ) ( not ( = ?auto_2213879 ?auto_2213882 ) ) ( not ( = ?auto_2213879 ?auto_2213883 ) ) ( not ( = ?auto_2213879 ?auto_2213884 ) ) ( not ( = ?auto_2213879 ?auto_2213885 ) ) ( not ( = ?auto_2213879 ?auto_2213886 ) ) ( not ( = ?auto_2213879 ?auto_2213887 ) ) ( not ( = ?auto_2213879 ?auto_2213888 ) ) ( not ( = ?auto_2213879 ?auto_2213892 ) ) ( not ( = ?auto_2213880 ?auto_2213881 ) ) ( not ( = ?auto_2213880 ?auto_2213882 ) ) ( not ( = ?auto_2213880 ?auto_2213883 ) ) ( not ( = ?auto_2213880 ?auto_2213884 ) ) ( not ( = ?auto_2213880 ?auto_2213885 ) ) ( not ( = ?auto_2213880 ?auto_2213886 ) ) ( not ( = ?auto_2213880 ?auto_2213887 ) ) ( not ( = ?auto_2213880 ?auto_2213888 ) ) ( not ( = ?auto_2213880 ?auto_2213892 ) ) ( not ( = ?auto_2213881 ?auto_2213882 ) ) ( not ( = ?auto_2213881 ?auto_2213883 ) ) ( not ( = ?auto_2213881 ?auto_2213884 ) ) ( not ( = ?auto_2213881 ?auto_2213885 ) ) ( not ( = ?auto_2213881 ?auto_2213886 ) ) ( not ( = ?auto_2213881 ?auto_2213887 ) ) ( not ( = ?auto_2213881 ?auto_2213888 ) ) ( not ( = ?auto_2213881 ?auto_2213892 ) ) ( not ( = ?auto_2213882 ?auto_2213883 ) ) ( not ( = ?auto_2213882 ?auto_2213884 ) ) ( not ( = ?auto_2213882 ?auto_2213885 ) ) ( not ( = ?auto_2213882 ?auto_2213886 ) ) ( not ( = ?auto_2213882 ?auto_2213887 ) ) ( not ( = ?auto_2213882 ?auto_2213888 ) ) ( not ( = ?auto_2213882 ?auto_2213892 ) ) ( not ( = ?auto_2213883 ?auto_2213884 ) ) ( not ( = ?auto_2213883 ?auto_2213885 ) ) ( not ( = ?auto_2213883 ?auto_2213886 ) ) ( not ( = ?auto_2213883 ?auto_2213887 ) ) ( not ( = ?auto_2213883 ?auto_2213888 ) ) ( not ( = ?auto_2213883 ?auto_2213892 ) ) ( not ( = ?auto_2213884 ?auto_2213885 ) ) ( not ( = ?auto_2213884 ?auto_2213886 ) ) ( not ( = ?auto_2213884 ?auto_2213887 ) ) ( not ( = ?auto_2213884 ?auto_2213888 ) ) ( not ( = ?auto_2213884 ?auto_2213892 ) ) ( not ( = ?auto_2213885 ?auto_2213886 ) ) ( not ( = ?auto_2213885 ?auto_2213887 ) ) ( not ( = ?auto_2213885 ?auto_2213888 ) ) ( not ( = ?auto_2213885 ?auto_2213892 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2213886 ?auto_2213887 ?auto_2213888 )
      ( MAKE-15CRATE-VERIFY ?auto_2213873 ?auto_2213874 ?auto_2213875 ?auto_2213876 ?auto_2213877 ?auto_2213878 ?auto_2213879 ?auto_2213880 ?auto_2213881 ?auto_2213882 ?auto_2213883 ?auto_2213884 ?auto_2213885 ?auto_2213886 ?auto_2213887 ?auto_2213888 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_2214099 - SURFACE
      ?auto_2214100 - SURFACE
      ?auto_2214101 - SURFACE
      ?auto_2214102 - SURFACE
      ?auto_2214103 - SURFACE
      ?auto_2214104 - SURFACE
      ?auto_2214105 - SURFACE
      ?auto_2214106 - SURFACE
      ?auto_2214107 - SURFACE
      ?auto_2214108 - SURFACE
      ?auto_2214109 - SURFACE
      ?auto_2214110 - SURFACE
      ?auto_2214111 - SURFACE
      ?auto_2214112 - SURFACE
      ?auto_2214113 - SURFACE
      ?auto_2214114 - SURFACE
    )
    :vars
    (
      ?auto_2214119 - HOIST
      ?auto_2214116 - PLACE
      ?auto_2214118 - PLACE
      ?auto_2214120 - HOIST
      ?auto_2214115 - SURFACE
      ?auto_2214117 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2214119 ?auto_2214116 ) ( IS-CRATE ?auto_2214114 ) ( not ( = ?auto_2214113 ?auto_2214114 ) ) ( not ( = ?auto_2214112 ?auto_2214113 ) ) ( not ( = ?auto_2214112 ?auto_2214114 ) ) ( not ( = ?auto_2214118 ?auto_2214116 ) ) ( HOIST-AT ?auto_2214120 ?auto_2214118 ) ( not ( = ?auto_2214119 ?auto_2214120 ) ) ( AVAILABLE ?auto_2214120 ) ( SURFACE-AT ?auto_2214114 ?auto_2214118 ) ( ON ?auto_2214114 ?auto_2214115 ) ( CLEAR ?auto_2214114 ) ( not ( = ?auto_2214113 ?auto_2214115 ) ) ( not ( = ?auto_2214114 ?auto_2214115 ) ) ( not ( = ?auto_2214112 ?auto_2214115 ) ) ( TRUCK-AT ?auto_2214117 ?auto_2214116 ) ( SURFACE-AT ?auto_2214112 ?auto_2214116 ) ( CLEAR ?auto_2214112 ) ( IS-CRATE ?auto_2214113 ) ( AVAILABLE ?auto_2214119 ) ( IN ?auto_2214113 ?auto_2214117 ) ( ON ?auto_2214100 ?auto_2214099 ) ( ON ?auto_2214101 ?auto_2214100 ) ( ON ?auto_2214102 ?auto_2214101 ) ( ON ?auto_2214103 ?auto_2214102 ) ( ON ?auto_2214104 ?auto_2214103 ) ( ON ?auto_2214105 ?auto_2214104 ) ( ON ?auto_2214106 ?auto_2214105 ) ( ON ?auto_2214107 ?auto_2214106 ) ( ON ?auto_2214108 ?auto_2214107 ) ( ON ?auto_2214109 ?auto_2214108 ) ( ON ?auto_2214110 ?auto_2214109 ) ( ON ?auto_2214111 ?auto_2214110 ) ( ON ?auto_2214112 ?auto_2214111 ) ( not ( = ?auto_2214099 ?auto_2214100 ) ) ( not ( = ?auto_2214099 ?auto_2214101 ) ) ( not ( = ?auto_2214099 ?auto_2214102 ) ) ( not ( = ?auto_2214099 ?auto_2214103 ) ) ( not ( = ?auto_2214099 ?auto_2214104 ) ) ( not ( = ?auto_2214099 ?auto_2214105 ) ) ( not ( = ?auto_2214099 ?auto_2214106 ) ) ( not ( = ?auto_2214099 ?auto_2214107 ) ) ( not ( = ?auto_2214099 ?auto_2214108 ) ) ( not ( = ?auto_2214099 ?auto_2214109 ) ) ( not ( = ?auto_2214099 ?auto_2214110 ) ) ( not ( = ?auto_2214099 ?auto_2214111 ) ) ( not ( = ?auto_2214099 ?auto_2214112 ) ) ( not ( = ?auto_2214099 ?auto_2214113 ) ) ( not ( = ?auto_2214099 ?auto_2214114 ) ) ( not ( = ?auto_2214099 ?auto_2214115 ) ) ( not ( = ?auto_2214100 ?auto_2214101 ) ) ( not ( = ?auto_2214100 ?auto_2214102 ) ) ( not ( = ?auto_2214100 ?auto_2214103 ) ) ( not ( = ?auto_2214100 ?auto_2214104 ) ) ( not ( = ?auto_2214100 ?auto_2214105 ) ) ( not ( = ?auto_2214100 ?auto_2214106 ) ) ( not ( = ?auto_2214100 ?auto_2214107 ) ) ( not ( = ?auto_2214100 ?auto_2214108 ) ) ( not ( = ?auto_2214100 ?auto_2214109 ) ) ( not ( = ?auto_2214100 ?auto_2214110 ) ) ( not ( = ?auto_2214100 ?auto_2214111 ) ) ( not ( = ?auto_2214100 ?auto_2214112 ) ) ( not ( = ?auto_2214100 ?auto_2214113 ) ) ( not ( = ?auto_2214100 ?auto_2214114 ) ) ( not ( = ?auto_2214100 ?auto_2214115 ) ) ( not ( = ?auto_2214101 ?auto_2214102 ) ) ( not ( = ?auto_2214101 ?auto_2214103 ) ) ( not ( = ?auto_2214101 ?auto_2214104 ) ) ( not ( = ?auto_2214101 ?auto_2214105 ) ) ( not ( = ?auto_2214101 ?auto_2214106 ) ) ( not ( = ?auto_2214101 ?auto_2214107 ) ) ( not ( = ?auto_2214101 ?auto_2214108 ) ) ( not ( = ?auto_2214101 ?auto_2214109 ) ) ( not ( = ?auto_2214101 ?auto_2214110 ) ) ( not ( = ?auto_2214101 ?auto_2214111 ) ) ( not ( = ?auto_2214101 ?auto_2214112 ) ) ( not ( = ?auto_2214101 ?auto_2214113 ) ) ( not ( = ?auto_2214101 ?auto_2214114 ) ) ( not ( = ?auto_2214101 ?auto_2214115 ) ) ( not ( = ?auto_2214102 ?auto_2214103 ) ) ( not ( = ?auto_2214102 ?auto_2214104 ) ) ( not ( = ?auto_2214102 ?auto_2214105 ) ) ( not ( = ?auto_2214102 ?auto_2214106 ) ) ( not ( = ?auto_2214102 ?auto_2214107 ) ) ( not ( = ?auto_2214102 ?auto_2214108 ) ) ( not ( = ?auto_2214102 ?auto_2214109 ) ) ( not ( = ?auto_2214102 ?auto_2214110 ) ) ( not ( = ?auto_2214102 ?auto_2214111 ) ) ( not ( = ?auto_2214102 ?auto_2214112 ) ) ( not ( = ?auto_2214102 ?auto_2214113 ) ) ( not ( = ?auto_2214102 ?auto_2214114 ) ) ( not ( = ?auto_2214102 ?auto_2214115 ) ) ( not ( = ?auto_2214103 ?auto_2214104 ) ) ( not ( = ?auto_2214103 ?auto_2214105 ) ) ( not ( = ?auto_2214103 ?auto_2214106 ) ) ( not ( = ?auto_2214103 ?auto_2214107 ) ) ( not ( = ?auto_2214103 ?auto_2214108 ) ) ( not ( = ?auto_2214103 ?auto_2214109 ) ) ( not ( = ?auto_2214103 ?auto_2214110 ) ) ( not ( = ?auto_2214103 ?auto_2214111 ) ) ( not ( = ?auto_2214103 ?auto_2214112 ) ) ( not ( = ?auto_2214103 ?auto_2214113 ) ) ( not ( = ?auto_2214103 ?auto_2214114 ) ) ( not ( = ?auto_2214103 ?auto_2214115 ) ) ( not ( = ?auto_2214104 ?auto_2214105 ) ) ( not ( = ?auto_2214104 ?auto_2214106 ) ) ( not ( = ?auto_2214104 ?auto_2214107 ) ) ( not ( = ?auto_2214104 ?auto_2214108 ) ) ( not ( = ?auto_2214104 ?auto_2214109 ) ) ( not ( = ?auto_2214104 ?auto_2214110 ) ) ( not ( = ?auto_2214104 ?auto_2214111 ) ) ( not ( = ?auto_2214104 ?auto_2214112 ) ) ( not ( = ?auto_2214104 ?auto_2214113 ) ) ( not ( = ?auto_2214104 ?auto_2214114 ) ) ( not ( = ?auto_2214104 ?auto_2214115 ) ) ( not ( = ?auto_2214105 ?auto_2214106 ) ) ( not ( = ?auto_2214105 ?auto_2214107 ) ) ( not ( = ?auto_2214105 ?auto_2214108 ) ) ( not ( = ?auto_2214105 ?auto_2214109 ) ) ( not ( = ?auto_2214105 ?auto_2214110 ) ) ( not ( = ?auto_2214105 ?auto_2214111 ) ) ( not ( = ?auto_2214105 ?auto_2214112 ) ) ( not ( = ?auto_2214105 ?auto_2214113 ) ) ( not ( = ?auto_2214105 ?auto_2214114 ) ) ( not ( = ?auto_2214105 ?auto_2214115 ) ) ( not ( = ?auto_2214106 ?auto_2214107 ) ) ( not ( = ?auto_2214106 ?auto_2214108 ) ) ( not ( = ?auto_2214106 ?auto_2214109 ) ) ( not ( = ?auto_2214106 ?auto_2214110 ) ) ( not ( = ?auto_2214106 ?auto_2214111 ) ) ( not ( = ?auto_2214106 ?auto_2214112 ) ) ( not ( = ?auto_2214106 ?auto_2214113 ) ) ( not ( = ?auto_2214106 ?auto_2214114 ) ) ( not ( = ?auto_2214106 ?auto_2214115 ) ) ( not ( = ?auto_2214107 ?auto_2214108 ) ) ( not ( = ?auto_2214107 ?auto_2214109 ) ) ( not ( = ?auto_2214107 ?auto_2214110 ) ) ( not ( = ?auto_2214107 ?auto_2214111 ) ) ( not ( = ?auto_2214107 ?auto_2214112 ) ) ( not ( = ?auto_2214107 ?auto_2214113 ) ) ( not ( = ?auto_2214107 ?auto_2214114 ) ) ( not ( = ?auto_2214107 ?auto_2214115 ) ) ( not ( = ?auto_2214108 ?auto_2214109 ) ) ( not ( = ?auto_2214108 ?auto_2214110 ) ) ( not ( = ?auto_2214108 ?auto_2214111 ) ) ( not ( = ?auto_2214108 ?auto_2214112 ) ) ( not ( = ?auto_2214108 ?auto_2214113 ) ) ( not ( = ?auto_2214108 ?auto_2214114 ) ) ( not ( = ?auto_2214108 ?auto_2214115 ) ) ( not ( = ?auto_2214109 ?auto_2214110 ) ) ( not ( = ?auto_2214109 ?auto_2214111 ) ) ( not ( = ?auto_2214109 ?auto_2214112 ) ) ( not ( = ?auto_2214109 ?auto_2214113 ) ) ( not ( = ?auto_2214109 ?auto_2214114 ) ) ( not ( = ?auto_2214109 ?auto_2214115 ) ) ( not ( = ?auto_2214110 ?auto_2214111 ) ) ( not ( = ?auto_2214110 ?auto_2214112 ) ) ( not ( = ?auto_2214110 ?auto_2214113 ) ) ( not ( = ?auto_2214110 ?auto_2214114 ) ) ( not ( = ?auto_2214110 ?auto_2214115 ) ) ( not ( = ?auto_2214111 ?auto_2214112 ) ) ( not ( = ?auto_2214111 ?auto_2214113 ) ) ( not ( = ?auto_2214111 ?auto_2214114 ) ) ( not ( = ?auto_2214111 ?auto_2214115 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2214112 ?auto_2214113 ?auto_2214114 )
      ( MAKE-15CRATE-VERIFY ?auto_2214099 ?auto_2214100 ?auto_2214101 ?auto_2214102 ?auto_2214103 ?auto_2214104 ?auto_2214105 ?auto_2214106 ?auto_2214107 ?auto_2214108 ?auto_2214109 ?auto_2214110 ?auto_2214111 ?auto_2214112 ?auto_2214113 ?auto_2214114 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234592 - SURFACE
      ?auto_2234593 - SURFACE
      ?auto_2234594 - SURFACE
      ?auto_2234595 - SURFACE
      ?auto_2234596 - SURFACE
      ?auto_2234597 - SURFACE
      ?auto_2234598 - SURFACE
      ?auto_2234599 - SURFACE
      ?auto_2234600 - SURFACE
      ?auto_2234601 - SURFACE
      ?auto_2234602 - SURFACE
      ?auto_2234603 - SURFACE
      ?auto_2234604 - SURFACE
      ?auto_2234605 - SURFACE
      ?auto_2234606 - SURFACE
      ?auto_2234607 - SURFACE
      ?auto_2234608 - SURFACE
    )
    :vars
    (
      ?auto_2234609 - HOIST
      ?auto_2234610 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234609 ?auto_2234610 ) ( SURFACE-AT ?auto_2234607 ?auto_2234610 ) ( CLEAR ?auto_2234607 ) ( LIFTING ?auto_2234609 ?auto_2234608 ) ( IS-CRATE ?auto_2234608 ) ( not ( = ?auto_2234607 ?auto_2234608 ) ) ( ON ?auto_2234593 ?auto_2234592 ) ( ON ?auto_2234594 ?auto_2234593 ) ( ON ?auto_2234595 ?auto_2234594 ) ( ON ?auto_2234596 ?auto_2234595 ) ( ON ?auto_2234597 ?auto_2234596 ) ( ON ?auto_2234598 ?auto_2234597 ) ( ON ?auto_2234599 ?auto_2234598 ) ( ON ?auto_2234600 ?auto_2234599 ) ( ON ?auto_2234601 ?auto_2234600 ) ( ON ?auto_2234602 ?auto_2234601 ) ( ON ?auto_2234603 ?auto_2234602 ) ( ON ?auto_2234604 ?auto_2234603 ) ( ON ?auto_2234605 ?auto_2234604 ) ( ON ?auto_2234606 ?auto_2234605 ) ( ON ?auto_2234607 ?auto_2234606 ) ( not ( = ?auto_2234592 ?auto_2234593 ) ) ( not ( = ?auto_2234592 ?auto_2234594 ) ) ( not ( = ?auto_2234592 ?auto_2234595 ) ) ( not ( = ?auto_2234592 ?auto_2234596 ) ) ( not ( = ?auto_2234592 ?auto_2234597 ) ) ( not ( = ?auto_2234592 ?auto_2234598 ) ) ( not ( = ?auto_2234592 ?auto_2234599 ) ) ( not ( = ?auto_2234592 ?auto_2234600 ) ) ( not ( = ?auto_2234592 ?auto_2234601 ) ) ( not ( = ?auto_2234592 ?auto_2234602 ) ) ( not ( = ?auto_2234592 ?auto_2234603 ) ) ( not ( = ?auto_2234592 ?auto_2234604 ) ) ( not ( = ?auto_2234592 ?auto_2234605 ) ) ( not ( = ?auto_2234592 ?auto_2234606 ) ) ( not ( = ?auto_2234592 ?auto_2234607 ) ) ( not ( = ?auto_2234592 ?auto_2234608 ) ) ( not ( = ?auto_2234593 ?auto_2234594 ) ) ( not ( = ?auto_2234593 ?auto_2234595 ) ) ( not ( = ?auto_2234593 ?auto_2234596 ) ) ( not ( = ?auto_2234593 ?auto_2234597 ) ) ( not ( = ?auto_2234593 ?auto_2234598 ) ) ( not ( = ?auto_2234593 ?auto_2234599 ) ) ( not ( = ?auto_2234593 ?auto_2234600 ) ) ( not ( = ?auto_2234593 ?auto_2234601 ) ) ( not ( = ?auto_2234593 ?auto_2234602 ) ) ( not ( = ?auto_2234593 ?auto_2234603 ) ) ( not ( = ?auto_2234593 ?auto_2234604 ) ) ( not ( = ?auto_2234593 ?auto_2234605 ) ) ( not ( = ?auto_2234593 ?auto_2234606 ) ) ( not ( = ?auto_2234593 ?auto_2234607 ) ) ( not ( = ?auto_2234593 ?auto_2234608 ) ) ( not ( = ?auto_2234594 ?auto_2234595 ) ) ( not ( = ?auto_2234594 ?auto_2234596 ) ) ( not ( = ?auto_2234594 ?auto_2234597 ) ) ( not ( = ?auto_2234594 ?auto_2234598 ) ) ( not ( = ?auto_2234594 ?auto_2234599 ) ) ( not ( = ?auto_2234594 ?auto_2234600 ) ) ( not ( = ?auto_2234594 ?auto_2234601 ) ) ( not ( = ?auto_2234594 ?auto_2234602 ) ) ( not ( = ?auto_2234594 ?auto_2234603 ) ) ( not ( = ?auto_2234594 ?auto_2234604 ) ) ( not ( = ?auto_2234594 ?auto_2234605 ) ) ( not ( = ?auto_2234594 ?auto_2234606 ) ) ( not ( = ?auto_2234594 ?auto_2234607 ) ) ( not ( = ?auto_2234594 ?auto_2234608 ) ) ( not ( = ?auto_2234595 ?auto_2234596 ) ) ( not ( = ?auto_2234595 ?auto_2234597 ) ) ( not ( = ?auto_2234595 ?auto_2234598 ) ) ( not ( = ?auto_2234595 ?auto_2234599 ) ) ( not ( = ?auto_2234595 ?auto_2234600 ) ) ( not ( = ?auto_2234595 ?auto_2234601 ) ) ( not ( = ?auto_2234595 ?auto_2234602 ) ) ( not ( = ?auto_2234595 ?auto_2234603 ) ) ( not ( = ?auto_2234595 ?auto_2234604 ) ) ( not ( = ?auto_2234595 ?auto_2234605 ) ) ( not ( = ?auto_2234595 ?auto_2234606 ) ) ( not ( = ?auto_2234595 ?auto_2234607 ) ) ( not ( = ?auto_2234595 ?auto_2234608 ) ) ( not ( = ?auto_2234596 ?auto_2234597 ) ) ( not ( = ?auto_2234596 ?auto_2234598 ) ) ( not ( = ?auto_2234596 ?auto_2234599 ) ) ( not ( = ?auto_2234596 ?auto_2234600 ) ) ( not ( = ?auto_2234596 ?auto_2234601 ) ) ( not ( = ?auto_2234596 ?auto_2234602 ) ) ( not ( = ?auto_2234596 ?auto_2234603 ) ) ( not ( = ?auto_2234596 ?auto_2234604 ) ) ( not ( = ?auto_2234596 ?auto_2234605 ) ) ( not ( = ?auto_2234596 ?auto_2234606 ) ) ( not ( = ?auto_2234596 ?auto_2234607 ) ) ( not ( = ?auto_2234596 ?auto_2234608 ) ) ( not ( = ?auto_2234597 ?auto_2234598 ) ) ( not ( = ?auto_2234597 ?auto_2234599 ) ) ( not ( = ?auto_2234597 ?auto_2234600 ) ) ( not ( = ?auto_2234597 ?auto_2234601 ) ) ( not ( = ?auto_2234597 ?auto_2234602 ) ) ( not ( = ?auto_2234597 ?auto_2234603 ) ) ( not ( = ?auto_2234597 ?auto_2234604 ) ) ( not ( = ?auto_2234597 ?auto_2234605 ) ) ( not ( = ?auto_2234597 ?auto_2234606 ) ) ( not ( = ?auto_2234597 ?auto_2234607 ) ) ( not ( = ?auto_2234597 ?auto_2234608 ) ) ( not ( = ?auto_2234598 ?auto_2234599 ) ) ( not ( = ?auto_2234598 ?auto_2234600 ) ) ( not ( = ?auto_2234598 ?auto_2234601 ) ) ( not ( = ?auto_2234598 ?auto_2234602 ) ) ( not ( = ?auto_2234598 ?auto_2234603 ) ) ( not ( = ?auto_2234598 ?auto_2234604 ) ) ( not ( = ?auto_2234598 ?auto_2234605 ) ) ( not ( = ?auto_2234598 ?auto_2234606 ) ) ( not ( = ?auto_2234598 ?auto_2234607 ) ) ( not ( = ?auto_2234598 ?auto_2234608 ) ) ( not ( = ?auto_2234599 ?auto_2234600 ) ) ( not ( = ?auto_2234599 ?auto_2234601 ) ) ( not ( = ?auto_2234599 ?auto_2234602 ) ) ( not ( = ?auto_2234599 ?auto_2234603 ) ) ( not ( = ?auto_2234599 ?auto_2234604 ) ) ( not ( = ?auto_2234599 ?auto_2234605 ) ) ( not ( = ?auto_2234599 ?auto_2234606 ) ) ( not ( = ?auto_2234599 ?auto_2234607 ) ) ( not ( = ?auto_2234599 ?auto_2234608 ) ) ( not ( = ?auto_2234600 ?auto_2234601 ) ) ( not ( = ?auto_2234600 ?auto_2234602 ) ) ( not ( = ?auto_2234600 ?auto_2234603 ) ) ( not ( = ?auto_2234600 ?auto_2234604 ) ) ( not ( = ?auto_2234600 ?auto_2234605 ) ) ( not ( = ?auto_2234600 ?auto_2234606 ) ) ( not ( = ?auto_2234600 ?auto_2234607 ) ) ( not ( = ?auto_2234600 ?auto_2234608 ) ) ( not ( = ?auto_2234601 ?auto_2234602 ) ) ( not ( = ?auto_2234601 ?auto_2234603 ) ) ( not ( = ?auto_2234601 ?auto_2234604 ) ) ( not ( = ?auto_2234601 ?auto_2234605 ) ) ( not ( = ?auto_2234601 ?auto_2234606 ) ) ( not ( = ?auto_2234601 ?auto_2234607 ) ) ( not ( = ?auto_2234601 ?auto_2234608 ) ) ( not ( = ?auto_2234602 ?auto_2234603 ) ) ( not ( = ?auto_2234602 ?auto_2234604 ) ) ( not ( = ?auto_2234602 ?auto_2234605 ) ) ( not ( = ?auto_2234602 ?auto_2234606 ) ) ( not ( = ?auto_2234602 ?auto_2234607 ) ) ( not ( = ?auto_2234602 ?auto_2234608 ) ) ( not ( = ?auto_2234603 ?auto_2234604 ) ) ( not ( = ?auto_2234603 ?auto_2234605 ) ) ( not ( = ?auto_2234603 ?auto_2234606 ) ) ( not ( = ?auto_2234603 ?auto_2234607 ) ) ( not ( = ?auto_2234603 ?auto_2234608 ) ) ( not ( = ?auto_2234604 ?auto_2234605 ) ) ( not ( = ?auto_2234604 ?auto_2234606 ) ) ( not ( = ?auto_2234604 ?auto_2234607 ) ) ( not ( = ?auto_2234604 ?auto_2234608 ) ) ( not ( = ?auto_2234605 ?auto_2234606 ) ) ( not ( = ?auto_2234605 ?auto_2234607 ) ) ( not ( = ?auto_2234605 ?auto_2234608 ) ) ( not ( = ?auto_2234606 ?auto_2234607 ) ) ( not ( = ?auto_2234606 ?auto_2234608 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_2234607 ?auto_2234608 )
      ( MAKE-16CRATE-VERIFY ?auto_2234592 ?auto_2234593 ?auto_2234594 ?auto_2234595 ?auto_2234596 ?auto_2234597 ?auto_2234598 ?auto_2234599 ?auto_2234600 ?auto_2234601 ?auto_2234602 ?auto_2234603 ?auto_2234604 ?auto_2234605 ?auto_2234606 ?auto_2234607 ?auto_2234608 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2234791 - SURFACE
      ?auto_2234792 - SURFACE
      ?auto_2234793 - SURFACE
      ?auto_2234794 - SURFACE
      ?auto_2234795 - SURFACE
      ?auto_2234796 - SURFACE
      ?auto_2234797 - SURFACE
      ?auto_2234798 - SURFACE
      ?auto_2234799 - SURFACE
      ?auto_2234800 - SURFACE
      ?auto_2234801 - SURFACE
      ?auto_2234802 - SURFACE
      ?auto_2234803 - SURFACE
      ?auto_2234804 - SURFACE
      ?auto_2234805 - SURFACE
      ?auto_2234806 - SURFACE
      ?auto_2234807 - SURFACE
    )
    :vars
    (
      ?auto_2234810 - HOIST
      ?auto_2234808 - PLACE
      ?auto_2234809 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2234810 ?auto_2234808 ) ( SURFACE-AT ?auto_2234806 ?auto_2234808 ) ( CLEAR ?auto_2234806 ) ( IS-CRATE ?auto_2234807 ) ( not ( = ?auto_2234806 ?auto_2234807 ) ) ( TRUCK-AT ?auto_2234809 ?auto_2234808 ) ( AVAILABLE ?auto_2234810 ) ( IN ?auto_2234807 ?auto_2234809 ) ( ON ?auto_2234806 ?auto_2234805 ) ( not ( = ?auto_2234805 ?auto_2234806 ) ) ( not ( = ?auto_2234805 ?auto_2234807 ) ) ( ON ?auto_2234792 ?auto_2234791 ) ( ON ?auto_2234793 ?auto_2234792 ) ( ON ?auto_2234794 ?auto_2234793 ) ( ON ?auto_2234795 ?auto_2234794 ) ( ON ?auto_2234796 ?auto_2234795 ) ( ON ?auto_2234797 ?auto_2234796 ) ( ON ?auto_2234798 ?auto_2234797 ) ( ON ?auto_2234799 ?auto_2234798 ) ( ON ?auto_2234800 ?auto_2234799 ) ( ON ?auto_2234801 ?auto_2234800 ) ( ON ?auto_2234802 ?auto_2234801 ) ( ON ?auto_2234803 ?auto_2234802 ) ( ON ?auto_2234804 ?auto_2234803 ) ( ON ?auto_2234805 ?auto_2234804 ) ( not ( = ?auto_2234791 ?auto_2234792 ) ) ( not ( = ?auto_2234791 ?auto_2234793 ) ) ( not ( = ?auto_2234791 ?auto_2234794 ) ) ( not ( = ?auto_2234791 ?auto_2234795 ) ) ( not ( = ?auto_2234791 ?auto_2234796 ) ) ( not ( = ?auto_2234791 ?auto_2234797 ) ) ( not ( = ?auto_2234791 ?auto_2234798 ) ) ( not ( = ?auto_2234791 ?auto_2234799 ) ) ( not ( = ?auto_2234791 ?auto_2234800 ) ) ( not ( = ?auto_2234791 ?auto_2234801 ) ) ( not ( = ?auto_2234791 ?auto_2234802 ) ) ( not ( = ?auto_2234791 ?auto_2234803 ) ) ( not ( = ?auto_2234791 ?auto_2234804 ) ) ( not ( = ?auto_2234791 ?auto_2234805 ) ) ( not ( = ?auto_2234791 ?auto_2234806 ) ) ( not ( = ?auto_2234791 ?auto_2234807 ) ) ( not ( = ?auto_2234792 ?auto_2234793 ) ) ( not ( = ?auto_2234792 ?auto_2234794 ) ) ( not ( = ?auto_2234792 ?auto_2234795 ) ) ( not ( = ?auto_2234792 ?auto_2234796 ) ) ( not ( = ?auto_2234792 ?auto_2234797 ) ) ( not ( = ?auto_2234792 ?auto_2234798 ) ) ( not ( = ?auto_2234792 ?auto_2234799 ) ) ( not ( = ?auto_2234792 ?auto_2234800 ) ) ( not ( = ?auto_2234792 ?auto_2234801 ) ) ( not ( = ?auto_2234792 ?auto_2234802 ) ) ( not ( = ?auto_2234792 ?auto_2234803 ) ) ( not ( = ?auto_2234792 ?auto_2234804 ) ) ( not ( = ?auto_2234792 ?auto_2234805 ) ) ( not ( = ?auto_2234792 ?auto_2234806 ) ) ( not ( = ?auto_2234792 ?auto_2234807 ) ) ( not ( = ?auto_2234793 ?auto_2234794 ) ) ( not ( = ?auto_2234793 ?auto_2234795 ) ) ( not ( = ?auto_2234793 ?auto_2234796 ) ) ( not ( = ?auto_2234793 ?auto_2234797 ) ) ( not ( = ?auto_2234793 ?auto_2234798 ) ) ( not ( = ?auto_2234793 ?auto_2234799 ) ) ( not ( = ?auto_2234793 ?auto_2234800 ) ) ( not ( = ?auto_2234793 ?auto_2234801 ) ) ( not ( = ?auto_2234793 ?auto_2234802 ) ) ( not ( = ?auto_2234793 ?auto_2234803 ) ) ( not ( = ?auto_2234793 ?auto_2234804 ) ) ( not ( = ?auto_2234793 ?auto_2234805 ) ) ( not ( = ?auto_2234793 ?auto_2234806 ) ) ( not ( = ?auto_2234793 ?auto_2234807 ) ) ( not ( = ?auto_2234794 ?auto_2234795 ) ) ( not ( = ?auto_2234794 ?auto_2234796 ) ) ( not ( = ?auto_2234794 ?auto_2234797 ) ) ( not ( = ?auto_2234794 ?auto_2234798 ) ) ( not ( = ?auto_2234794 ?auto_2234799 ) ) ( not ( = ?auto_2234794 ?auto_2234800 ) ) ( not ( = ?auto_2234794 ?auto_2234801 ) ) ( not ( = ?auto_2234794 ?auto_2234802 ) ) ( not ( = ?auto_2234794 ?auto_2234803 ) ) ( not ( = ?auto_2234794 ?auto_2234804 ) ) ( not ( = ?auto_2234794 ?auto_2234805 ) ) ( not ( = ?auto_2234794 ?auto_2234806 ) ) ( not ( = ?auto_2234794 ?auto_2234807 ) ) ( not ( = ?auto_2234795 ?auto_2234796 ) ) ( not ( = ?auto_2234795 ?auto_2234797 ) ) ( not ( = ?auto_2234795 ?auto_2234798 ) ) ( not ( = ?auto_2234795 ?auto_2234799 ) ) ( not ( = ?auto_2234795 ?auto_2234800 ) ) ( not ( = ?auto_2234795 ?auto_2234801 ) ) ( not ( = ?auto_2234795 ?auto_2234802 ) ) ( not ( = ?auto_2234795 ?auto_2234803 ) ) ( not ( = ?auto_2234795 ?auto_2234804 ) ) ( not ( = ?auto_2234795 ?auto_2234805 ) ) ( not ( = ?auto_2234795 ?auto_2234806 ) ) ( not ( = ?auto_2234795 ?auto_2234807 ) ) ( not ( = ?auto_2234796 ?auto_2234797 ) ) ( not ( = ?auto_2234796 ?auto_2234798 ) ) ( not ( = ?auto_2234796 ?auto_2234799 ) ) ( not ( = ?auto_2234796 ?auto_2234800 ) ) ( not ( = ?auto_2234796 ?auto_2234801 ) ) ( not ( = ?auto_2234796 ?auto_2234802 ) ) ( not ( = ?auto_2234796 ?auto_2234803 ) ) ( not ( = ?auto_2234796 ?auto_2234804 ) ) ( not ( = ?auto_2234796 ?auto_2234805 ) ) ( not ( = ?auto_2234796 ?auto_2234806 ) ) ( not ( = ?auto_2234796 ?auto_2234807 ) ) ( not ( = ?auto_2234797 ?auto_2234798 ) ) ( not ( = ?auto_2234797 ?auto_2234799 ) ) ( not ( = ?auto_2234797 ?auto_2234800 ) ) ( not ( = ?auto_2234797 ?auto_2234801 ) ) ( not ( = ?auto_2234797 ?auto_2234802 ) ) ( not ( = ?auto_2234797 ?auto_2234803 ) ) ( not ( = ?auto_2234797 ?auto_2234804 ) ) ( not ( = ?auto_2234797 ?auto_2234805 ) ) ( not ( = ?auto_2234797 ?auto_2234806 ) ) ( not ( = ?auto_2234797 ?auto_2234807 ) ) ( not ( = ?auto_2234798 ?auto_2234799 ) ) ( not ( = ?auto_2234798 ?auto_2234800 ) ) ( not ( = ?auto_2234798 ?auto_2234801 ) ) ( not ( = ?auto_2234798 ?auto_2234802 ) ) ( not ( = ?auto_2234798 ?auto_2234803 ) ) ( not ( = ?auto_2234798 ?auto_2234804 ) ) ( not ( = ?auto_2234798 ?auto_2234805 ) ) ( not ( = ?auto_2234798 ?auto_2234806 ) ) ( not ( = ?auto_2234798 ?auto_2234807 ) ) ( not ( = ?auto_2234799 ?auto_2234800 ) ) ( not ( = ?auto_2234799 ?auto_2234801 ) ) ( not ( = ?auto_2234799 ?auto_2234802 ) ) ( not ( = ?auto_2234799 ?auto_2234803 ) ) ( not ( = ?auto_2234799 ?auto_2234804 ) ) ( not ( = ?auto_2234799 ?auto_2234805 ) ) ( not ( = ?auto_2234799 ?auto_2234806 ) ) ( not ( = ?auto_2234799 ?auto_2234807 ) ) ( not ( = ?auto_2234800 ?auto_2234801 ) ) ( not ( = ?auto_2234800 ?auto_2234802 ) ) ( not ( = ?auto_2234800 ?auto_2234803 ) ) ( not ( = ?auto_2234800 ?auto_2234804 ) ) ( not ( = ?auto_2234800 ?auto_2234805 ) ) ( not ( = ?auto_2234800 ?auto_2234806 ) ) ( not ( = ?auto_2234800 ?auto_2234807 ) ) ( not ( = ?auto_2234801 ?auto_2234802 ) ) ( not ( = ?auto_2234801 ?auto_2234803 ) ) ( not ( = ?auto_2234801 ?auto_2234804 ) ) ( not ( = ?auto_2234801 ?auto_2234805 ) ) ( not ( = ?auto_2234801 ?auto_2234806 ) ) ( not ( = ?auto_2234801 ?auto_2234807 ) ) ( not ( = ?auto_2234802 ?auto_2234803 ) ) ( not ( = ?auto_2234802 ?auto_2234804 ) ) ( not ( = ?auto_2234802 ?auto_2234805 ) ) ( not ( = ?auto_2234802 ?auto_2234806 ) ) ( not ( = ?auto_2234802 ?auto_2234807 ) ) ( not ( = ?auto_2234803 ?auto_2234804 ) ) ( not ( = ?auto_2234803 ?auto_2234805 ) ) ( not ( = ?auto_2234803 ?auto_2234806 ) ) ( not ( = ?auto_2234803 ?auto_2234807 ) ) ( not ( = ?auto_2234804 ?auto_2234805 ) ) ( not ( = ?auto_2234804 ?auto_2234806 ) ) ( not ( = ?auto_2234804 ?auto_2234807 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2234805 ?auto_2234806 ?auto_2234807 )
      ( MAKE-16CRATE-VERIFY ?auto_2234791 ?auto_2234792 ?auto_2234793 ?auto_2234794 ?auto_2234795 ?auto_2234796 ?auto_2234797 ?auto_2234798 ?auto_2234799 ?auto_2234800 ?auto_2234801 ?auto_2234802 ?auto_2234803 ?auto_2234804 ?auto_2234805 ?auto_2234806 ?auto_2234807 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235007 - SURFACE
      ?auto_2235008 - SURFACE
      ?auto_2235009 - SURFACE
      ?auto_2235010 - SURFACE
      ?auto_2235011 - SURFACE
      ?auto_2235012 - SURFACE
      ?auto_2235013 - SURFACE
      ?auto_2235014 - SURFACE
      ?auto_2235015 - SURFACE
      ?auto_2235016 - SURFACE
      ?auto_2235017 - SURFACE
      ?auto_2235018 - SURFACE
      ?auto_2235019 - SURFACE
      ?auto_2235020 - SURFACE
      ?auto_2235021 - SURFACE
      ?auto_2235022 - SURFACE
      ?auto_2235023 - SURFACE
    )
    :vars
    (
      ?auto_2235026 - HOIST
      ?auto_2235024 - PLACE
      ?auto_2235025 - TRUCK
      ?auto_2235027 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235026 ?auto_2235024 ) ( SURFACE-AT ?auto_2235022 ?auto_2235024 ) ( CLEAR ?auto_2235022 ) ( IS-CRATE ?auto_2235023 ) ( not ( = ?auto_2235022 ?auto_2235023 ) ) ( AVAILABLE ?auto_2235026 ) ( IN ?auto_2235023 ?auto_2235025 ) ( ON ?auto_2235022 ?auto_2235021 ) ( not ( = ?auto_2235021 ?auto_2235022 ) ) ( not ( = ?auto_2235021 ?auto_2235023 ) ) ( TRUCK-AT ?auto_2235025 ?auto_2235027 ) ( not ( = ?auto_2235027 ?auto_2235024 ) ) ( ON ?auto_2235008 ?auto_2235007 ) ( ON ?auto_2235009 ?auto_2235008 ) ( ON ?auto_2235010 ?auto_2235009 ) ( ON ?auto_2235011 ?auto_2235010 ) ( ON ?auto_2235012 ?auto_2235011 ) ( ON ?auto_2235013 ?auto_2235012 ) ( ON ?auto_2235014 ?auto_2235013 ) ( ON ?auto_2235015 ?auto_2235014 ) ( ON ?auto_2235016 ?auto_2235015 ) ( ON ?auto_2235017 ?auto_2235016 ) ( ON ?auto_2235018 ?auto_2235017 ) ( ON ?auto_2235019 ?auto_2235018 ) ( ON ?auto_2235020 ?auto_2235019 ) ( ON ?auto_2235021 ?auto_2235020 ) ( not ( = ?auto_2235007 ?auto_2235008 ) ) ( not ( = ?auto_2235007 ?auto_2235009 ) ) ( not ( = ?auto_2235007 ?auto_2235010 ) ) ( not ( = ?auto_2235007 ?auto_2235011 ) ) ( not ( = ?auto_2235007 ?auto_2235012 ) ) ( not ( = ?auto_2235007 ?auto_2235013 ) ) ( not ( = ?auto_2235007 ?auto_2235014 ) ) ( not ( = ?auto_2235007 ?auto_2235015 ) ) ( not ( = ?auto_2235007 ?auto_2235016 ) ) ( not ( = ?auto_2235007 ?auto_2235017 ) ) ( not ( = ?auto_2235007 ?auto_2235018 ) ) ( not ( = ?auto_2235007 ?auto_2235019 ) ) ( not ( = ?auto_2235007 ?auto_2235020 ) ) ( not ( = ?auto_2235007 ?auto_2235021 ) ) ( not ( = ?auto_2235007 ?auto_2235022 ) ) ( not ( = ?auto_2235007 ?auto_2235023 ) ) ( not ( = ?auto_2235008 ?auto_2235009 ) ) ( not ( = ?auto_2235008 ?auto_2235010 ) ) ( not ( = ?auto_2235008 ?auto_2235011 ) ) ( not ( = ?auto_2235008 ?auto_2235012 ) ) ( not ( = ?auto_2235008 ?auto_2235013 ) ) ( not ( = ?auto_2235008 ?auto_2235014 ) ) ( not ( = ?auto_2235008 ?auto_2235015 ) ) ( not ( = ?auto_2235008 ?auto_2235016 ) ) ( not ( = ?auto_2235008 ?auto_2235017 ) ) ( not ( = ?auto_2235008 ?auto_2235018 ) ) ( not ( = ?auto_2235008 ?auto_2235019 ) ) ( not ( = ?auto_2235008 ?auto_2235020 ) ) ( not ( = ?auto_2235008 ?auto_2235021 ) ) ( not ( = ?auto_2235008 ?auto_2235022 ) ) ( not ( = ?auto_2235008 ?auto_2235023 ) ) ( not ( = ?auto_2235009 ?auto_2235010 ) ) ( not ( = ?auto_2235009 ?auto_2235011 ) ) ( not ( = ?auto_2235009 ?auto_2235012 ) ) ( not ( = ?auto_2235009 ?auto_2235013 ) ) ( not ( = ?auto_2235009 ?auto_2235014 ) ) ( not ( = ?auto_2235009 ?auto_2235015 ) ) ( not ( = ?auto_2235009 ?auto_2235016 ) ) ( not ( = ?auto_2235009 ?auto_2235017 ) ) ( not ( = ?auto_2235009 ?auto_2235018 ) ) ( not ( = ?auto_2235009 ?auto_2235019 ) ) ( not ( = ?auto_2235009 ?auto_2235020 ) ) ( not ( = ?auto_2235009 ?auto_2235021 ) ) ( not ( = ?auto_2235009 ?auto_2235022 ) ) ( not ( = ?auto_2235009 ?auto_2235023 ) ) ( not ( = ?auto_2235010 ?auto_2235011 ) ) ( not ( = ?auto_2235010 ?auto_2235012 ) ) ( not ( = ?auto_2235010 ?auto_2235013 ) ) ( not ( = ?auto_2235010 ?auto_2235014 ) ) ( not ( = ?auto_2235010 ?auto_2235015 ) ) ( not ( = ?auto_2235010 ?auto_2235016 ) ) ( not ( = ?auto_2235010 ?auto_2235017 ) ) ( not ( = ?auto_2235010 ?auto_2235018 ) ) ( not ( = ?auto_2235010 ?auto_2235019 ) ) ( not ( = ?auto_2235010 ?auto_2235020 ) ) ( not ( = ?auto_2235010 ?auto_2235021 ) ) ( not ( = ?auto_2235010 ?auto_2235022 ) ) ( not ( = ?auto_2235010 ?auto_2235023 ) ) ( not ( = ?auto_2235011 ?auto_2235012 ) ) ( not ( = ?auto_2235011 ?auto_2235013 ) ) ( not ( = ?auto_2235011 ?auto_2235014 ) ) ( not ( = ?auto_2235011 ?auto_2235015 ) ) ( not ( = ?auto_2235011 ?auto_2235016 ) ) ( not ( = ?auto_2235011 ?auto_2235017 ) ) ( not ( = ?auto_2235011 ?auto_2235018 ) ) ( not ( = ?auto_2235011 ?auto_2235019 ) ) ( not ( = ?auto_2235011 ?auto_2235020 ) ) ( not ( = ?auto_2235011 ?auto_2235021 ) ) ( not ( = ?auto_2235011 ?auto_2235022 ) ) ( not ( = ?auto_2235011 ?auto_2235023 ) ) ( not ( = ?auto_2235012 ?auto_2235013 ) ) ( not ( = ?auto_2235012 ?auto_2235014 ) ) ( not ( = ?auto_2235012 ?auto_2235015 ) ) ( not ( = ?auto_2235012 ?auto_2235016 ) ) ( not ( = ?auto_2235012 ?auto_2235017 ) ) ( not ( = ?auto_2235012 ?auto_2235018 ) ) ( not ( = ?auto_2235012 ?auto_2235019 ) ) ( not ( = ?auto_2235012 ?auto_2235020 ) ) ( not ( = ?auto_2235012 ?auto_2235021 ) ) ( not ( = ?auto_2235012 ?auto_2235022 ) ) ( not ( = ?auto_2235012 ?auto_2235023 ) ) ( not ( = ?auto_2235013 ?auto_2235014 ) ) ( not ( = ?auto_2235013 ?auto_2235015 ) ) ( not ( = ?auto_2235013 ?auto_2235016 ) ) ( not ( = ?auto_2235013 ?auto_2235017 ) ) ( not ( = ?auto_2235013 ?auto_2235018 ) ) ( not ( = ?auto_2235013 ?auto_2235019 ) ) ( not ( = ?auto_2235013 ?auto_2235020 ) ) ( not ( = ?auto_2235013 ?auto_2235021 ) ) ( not ( = ?auto_2235013 ?auto_2235022 ) ) ( not ( = ?auto_2235013 ?auto_2235023 ) ) ( not ( = ?auto_2235014 ?auto_2235015 ) ) ( not ( = ?auto_2235014 ?auto_2235016 ) ) ( not ( = ?auto_2235014 ?auto_2235017 ) ) ( not ( = ?auto_2235014 ?auto_2235018 ) ) ( not ( = ?auto_2235014 ?auto_2235019 ) ) ( not ( = ?auto_2235014 ?auto_2235020 ) ) ( not ( = ?auto_2235014 ?auto_2235021 ) ) ( not ( = ?auto_2235014 ?auto_2235022 ) ) ( not ( = ?auto_2235014 ?auto_2235023 ) ) ( not ( = ?auto_2235015 ?auto_2235016 ) ) ( not ( = ?auto_2235015 ?auto_2235017 ) ) ( not ( = ?auto_2235015 ?auto_2235018 ) ) ( not ( = ?auto_2235015 ?auto_2235019 ) ) ( not ( = ?auto_2235015 ?auto_2235020 ) ) ( not ( = ?auto_2235015 ?auto_2235021 ) ) ( not ( = ?auto_2235015 ?auto_2235022 ) ) ( not ( = ?auto_2235015 ?auto_2235023 ) ) ( not ( = ?auto_2235016 ?auto_2235017 ) ) ( not ( = ?auto_2235016 ?auto_2235018 ) ) ( not ( = ?auto_2235016 ?auto_2235019 ) ) ( not ( = ?auto_2235016 ?auto_2235020 ) ) ( not ( = ?auto_2235016 ?auto_2235021 ) ) ( not ( = ?auto_2235016 ?auto_2235022 ) ) ( not ( = ?auto_2235016 ?auto_2235023 ) ) ( not ( = ?auto_2235017 ?auto_2235018 ) ) ( not ( = ?auto_2235017 ?auto_2235019 ) ) ( not ( = ?auto_2235017 ?auto_2235020 ) ) ( not ( = ?auto_2235017 ?auto_2235021 ) ) ( not ( = ?auto_2235017 ?auto_2235022 ) ) ( not ( = ?auto_2235017 ?auto_2235023 ) ) ( not ( = ?auto_2235018 ?auto_2235019 ) ) ( not ( = ?auto_2235018 ?auto_2235020 ) ) ( not ( = ?auto_2235018 ?auto_2235021 ) ) ( not ( = ?auto_2235018 ?auto_2235022 ) ) ( not ( = ?auto_2235018 ?auto_2235023 ) ) ( not ( = ?auto_2235019 ?auto_2235020 ) ) ( not ( = ?auto_2235019 ?auto_2235021 ) ) ( not ( = ?auto_2235019 ?auto_2235022 ) ) ( not ( = ?auto_2235019 ?auto_2235023 ) ) ( not ( = ?auto_2235020 ?auto_2235021 ) ) ( not ( = ?auto_2235020 ?auto_2235022 ) ) ( not ( = ?auto_2235020 ?auto_2235023 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235021 ?auto_2235022 ?auto_2235023 )
      ( MAKE-16CRATE-VERIFY ?auto_2235007 ?auto_2235008 ?auto_2235009 ?auto_2235010 ?auto_2235011 ?auto_2235012 ?auto_2235013 ?auto_2235014 ?auto_2235015 ?auto_2235016 ?auto_2235017 ?auto_2235018 ?auto_2235019 ?auto_2235020 ?auto_2235021 ?auto_2235022 ?auto_2235023 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235239 - SURFACE
      ?auto_2235240 - SURFACE
      ?auto_2235241 - SURFACE
      ?auto_2235242 - SURFACE
      ?auto_2235243 - SURFACE
      ?auto_2235244 - SURFACE
      ?auto_2235245 - SURFACE
      ?auto_2235246 - SURFACE
      ?auto_2235247 - SURFACE
      ?auto_2235248 - SURFACE
      ?auto_2235249 - SURFACE
      ?auto_2235250 - SURFACE
      ?auto_2235251 - SURFACE
      ?auto_2235252 - SURFACE
      ?auto_2235253 - SURFACE
      ?auto_2235254 - SURFACE
      ?auto_2235255 - SURFACE
    )
    :vars
    (
      ?auto_2235256 - HOIST
      ?auto_2235259 - PLACE
      ?auto_2235260 - TRUCK
      ?auto_2235258 - PLACE
      ?auto_2235257 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235256 ?auto_2235259 ) ( SURFACE-AT ?auto_2235254 ?auto_2235259 ) ( CLEAR ?auto_2235254 ) ( IS-CRATE ?auto_2235255 ) ( not ( = ?auto_2235254 ?auto_2235255 ) ) ( AVAILABLE ?auto_2235256 ) ( ON ?auto_2235254 ?auto_2235253 ) ( not ( = ?auto_2235253 ?auto_2235254 ) ) ( not ( = ?auto_2235253 ?auto_2235255 ) ) ( TRUCK-AT ?auto_2235260 ?auto_2235258 ) ( not ( = ?auto_2235258 ?auto_2235259 ) ) ( HOIST-AT ?auto_2235257 ?auto_2235258 ) ( LIFTING ?auto_2235257 ?auto_2235255 ) ( not ( = ?auto_2235256 ?auto_2235257 ) ) ( ON ?auto_2235240 ?auto_2235239 ) ( ON ?auto_2235241 ?auto_2235240 ) ( ON ?auto_2235242 ?auto_2235241 ) ( ON ?auto_2235243 ?auto_2235242 ) ( ON ?auto_2235244 ?auto_2235243 ) ( ON ?auto_2235245 ?auto_2235244 ) ( ON ?auto_2235246 ?auto_2235245 ) ( ON ?auto_2235247 ?auto_2235246 ) ( ON ?auto_2235248 ?auto_2235247 ) ( ON ?auto_2235249 ?auto_2235248 ) ( ON ?auto_2235250 ?auto_2235249 ) ( ON ?auto_2235251 ?auto_2235250 ) ( ON ?auto_2235252 ?auto_2235251 ) ( ON ?auto_2235253 ?auto_2235252 ) ( not ( = ?auto_2235239 ?auto_2235240 ) ) ( not ( = ?auto_2235239 ?auto_2235241 ) ) ( not ( = ?auto_2235239 ?auto_2235242 ) ) ( not ( = ?auto_2235239 ?auto_2235243 ) ) ( not ( = ?auto_2235239 ?auto_2235244 ) ) ( not ( = ?auto_2235239 ?auto_2235245 ) ) ( not ( = ?auto_2235239 ?auto_2235246 ) ) ( not ( = ?auto_2235239 ?auto_2235247 ) ) ( not ( = ?auto_2235239 ?auto_2235248 ) ) ( not ( = ?auto_2235239 ?auto_2235249 ) ) ( not ( = ?auto_2235239 ?auto_2235250 ) ) ( not ( = ?auto_2235239 ?auto_2235251 ) ) ( not ( = ?auto_2235239 ?auto_2235252 ) ) ( not ( = ?auto_2235239 ?auto_2235253 ) ) ( not ( = ?auto_2235239 ?auto_2235254 ) ) ( not ( = ?auto_2235239 ?auto_2235255 ) ) ( not ( = ?auto_2235240 ?auto_2235241 ) ) ( not ( = ?auto_2235240 ?auto_2235242 ) ) ( not ( = ?auto_2235240 ?auto_2235243 ) ) ( not ( = ?auto_2235240 ?auto_2235244 ) ) ( not ( = ?auto_2235240 ?auto_2235245 ) ) ( not ( = ?auto_2235240 ?auto_2235246 ) ) ( not ( = ?auto_2235240 ?auto_2235247 ) ) ( not ( = ?auto_2235240 ?auto_2235248 ) ) ( not ( = ?auto_2235240 ?auto_2235249 ) ) ( not ( = ?auto_2235240 ?auto_2235250 ) ) ( not ( = ?auto_2235240 ?auto_2235251 ) ) ( not ( = ?auto_2235240 ?auto_2235252 ) ) ( not ( = ?auto_2235240 ?auto_2235253 ) ) ( not ( = ?auto_2235240 ?auto_2235254 ) ) ( not ( = ?auto_2235240 ?auto_2235255 ) ) ( not ( = ?auto_2235241 ?auto_2235242 ) ) ( not ( = ?auto_2235241 ?auto_2235243 ) ) ( not ( = ?auto_2235241 ?auto_2235244 ) ) ( not ( = ?auto_2235241 ?auto_2235245 ) ) ( not ( = ?auto_2235241 ?auto_2235246 ) ) ( not ( = ?auto_2235241 ?auto_2235247 ) ) ( not ( = ?auto_2235241 ?auto_2235248 ) ) ( not ( = ?auto_2235241 ?auto_2235249 ) ) ( not ( = ?auto_2235241 ?auto_2235250 ) ) ( not ( = ?auto_2235241 ?auto_2235251 ) ) ( not ( = ?auto_2235241 ?auto_2235252 ) ) ( not ( = ?auto_2235241 ?auto_2235253 ) ) ( not ( = ?auto_2235241 ?auto_2235254 ) ) ( not ( = ?auto_2235241 ?auto_2235255 ) ) ( not ( = ?auto_2235242 ?auto_2235243 ) ) ( not ( = ?auto_2235242 ?auto_2235244 ) ) ( not ( = ?auto_2235242 ?auto_2235245 ) ) ( not ( = ?auto_2235242 ?auto_2235246 ) ) ( not ( = ?auto_2235242 ?auto_2235247 ) ) ( not ( = ?auto_2235242 ?auto_2235248 ) ) ( not ( = ?auto_2235242 ?auto_2235249 ) ) ( not ( = ?auto_2235242 ?auto_2235250 ) ) ( not ( = ?auto_2235242 ?auto_2235251 ) ) ( not ( = ?auto_2235242 ?auto_2235252 ) ) ( not ( = ?auto_2235242 ?auto_2235253 ) ) ( not ( = ?auto_2235242 ?auto_2235254 ) ) ( not ( = ?auto_2235242 ?auto_2235255 ) ) ( not ( = ?auto_2235243 ?auto_2235244 ) ) ( not ( = ?auto_2235243 ?auto_2235245 ) ) ( not ( = ?auto_2235243 ?auto_2235246 ) ) ( not ( = ?auto_2235243 ?auto_2235247 ) ) ( not ( = ?auto_2235243 ?auto_2235248 ) ) ( not ( = ?auto_2235243 ?auto_2235249 ) ) ( not ( = ?auto_2235243 ?auto_2235250 ) ) ( not ( = ?auto_2235243 ?auto_2235251 ) ) ( not ( = ?auto_2235243 ?auto_2235252 ) ) ( not ( = ?auto_2235243 ?auto_2235253 ) ) ( not ( = ?auto_2235243 ?auto_2235254 ) ) ( not ( = ?auto_2235243 ?auto_2235255 ) ) ( not ( = ?auto_2235244 ?auto_2235245 ) ) ( not ( = ?auto_2235244 ?auto_2235246 ) ) ( not ( = ?auto_2235244 ?auto_2235247 ) ) ( not ( = ?auto_2235244 ?auto_2235248 ) ) ( not ( = ?auto_2235244 ?auto_2235249 ) ) ( not ( = ?auto_2235244 ?auto_2235250 ) ) ( not ( = ?auto_2235244 ?auto_2235251 ) ) ( not ( = ?auto_2235244 ?auto_2235252 ) ) ( not ( = ?auto_2235244 ?auto_2235253 ) ) ( not ( = ?auto_2235244 ?auto_2235254 ) ) ( not ( = ?auto_2235244 ?auto_2235255 ) ) ( not ( = ?auto_2235245 ?auto_2235246 ) ) ( not ( = ?auto_2235245 ?auto_2235247 ) ) ( not ( = ?auto_2235245 ?auto_2235248 ) ) ( not ( = ?auto_2235245 ?auto_2235249 ) ) ( not ( = ?auto_2235245 ?auto_2235250 ) ) ( not ( = ?auto_2235245 ?auto_2235251 ) ) ( not ( = ?auto_2235245 ?auto_2235252 ) ) ( not ( = ?auto_2235245 ?auto_2235253 ) ) ( not ( = ?auto_2235245 ?auto_2235254 ) ) ( not ( = ?auto_2235245 ?auto_2235255 ) ) ( not ( = ?auto_2235246 ?auto_2235247 ) ) ( not ( = ?auto_2235246 ?auto_2235248 ) ) ( not ( = ?auto_2235246 ?auto_2235249 ) ) ( not ( = ?auto_2235246 ?auto_2235250 ) ) ( not ( = ?auto_2235246 ?auto_2235251 ) ) ( not ( = ?auto_2235246 ?auto_2235252 ) ) ( not ( = ?auto_2235246 ?auto_2235253 ) ) ( not ( = ?auto_2235246 ?auto_2235254 ) ) ( not ( = ?auto_2235246 ?auto_2235255 ) ) ( not ( = ?auto_2235247 ?auto_2235248 ) ) ( not ( = ?auto_2235247 ?auto_2235249 ) ) ( not ( = ?auto_2235247 ?auto_2235250 ) ) ( not ( = ?auto_2235247 ?auto_2235251 ) ) ( not ( = ?auto_2235247 ?auto_2235252 ) ) ( not ( = ?auto_2235247 ?auto_2235253 ) ) ( not ( = ?auto_2235247 ?auto_2235254 ) ) ( not ( = ?auto_2235247 ?auto_2235255 ) ) ( not ( = ?auto_2235248 ?auto_2235249 ) ) ( not ( = ?auto_2235248 ?auto_2235250 ) ) ( not ( = ?auto_2235248 ?auto_2235251 ) ) ( not ( = ?auto_2235248 ?auto_2235252 ) ) ( not ( = ?auto_2235248 ?auto_2235253 ) ) ( not ( = ?auto_2235248 ?auto_2235254 ) ) ( not ( = ?auto_2235248 ?auto_2235255 ) ) ( not ( = ?auto_2235249 ?auto_2235250 ) ) ( not ( = ?auto_2235249 ?auto_2235251 ) ) ( not ( = ?auto_2235249 ?auto_2235252 ) ) ( not ( = ?auto_2235249 ?auto_2235253 ) ) ( not ( = ?auto_2235249 ?auto_2235254 ) ) ( not ( = ?auto_2235249 ?auto_2235255 ) ) ( not ( = ?auto_2235250 ?auto_2235251 ) ) ( not ( = ?auto_2235250 ?auto_2235252 ) ) ( not ( = ?auto_2235250 ?auto_2235253 ) ) ( not ( = ?auto_2235250 ?auto_2235254 ) ) ( not ( = ?auto_2235250 ?auto_2235255 ) ) ( not ( = ?auto_2235251 ?auto_2235252 ) ) ( not ( = ?auto_2235251 ?auto_2235253 ) ) ( not ( = ?auto_2235251 ?auto_2235254 ) ) ( not ( = ?auto_2235251 ?auto_2235255 ) ) ( not ( = ?auto_2235252 ?auto_2235253 ) ) ( not ( = ?auto_2235252 ?auto_2235254 ) ) ( not ( = ?auto_2235252 ?auto_2235255 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235253 ?auto_2235254 ?auto_2235255 )
      ( MAKE-16CRATE-VERIFY ?auto_2235239 ?auto_2235240 ?auto_2235241 ?auto_2235242 ?auto_2235243 ?auto_2235244 ?auto_2235245 ?auto_2235246 ?auto_2235247 ?auto_2235248 ?auto_2235249 ?auto_2235250 ?auto_2235251 ?auto_2235252 ?auto_2235253 ?auto_2235254 ?auto_2235255 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235487 - SURFACE
      ?auto_2235488 - SURFACE
      ?auto_2235489 - SURFACE
      ?auto_2235490 - SURFACE
      ?auto_2235491 - SURFACE
      ?auto_2235492 - SURFACE
      ?auto_2235493 - SURFACE
      ?auto_2235494 - SURFACE
      ?auto_2235495 - SURFACE
      ?auto_2235496 - SURFACE
      ?auto_2235497 - SURFACE
      ?auto_2235498 - SURFACE
      ?auto_2235499 - SURFACE
      ?auto_2235500 - SURFACE
      ?auto_2235501 - SURFACE
      ?auto_2235502 - SURFACE
      ?auto_2235503 - SURFACE
    )
    :vars
    (
      ?auto_2235505 - HOIST
      ?auto_2235506 - PLACE
      ?auto_2235508 - TRUCK
      ?auto_2235507 - PLACE
      ?auto_2235504 - HOIST
      ?auto_2235509 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235505 ?auto_2235506 ) ( SURFACE-AT ?auto_2235502 ?auto_2235506 ) ( CLEAR ?auto_2235502 ) ( IS-CRATE ?auto_2235503 ) ( not ( = ?auto_2235502 ?auto_2235503 ) ) ( AVAILABLE ?auto_2235505 ) ( ON ?auto_2235502 ?auto_2235501 ) ( not ( = ?auto_2235501 ?auto_2235502 ) ) ( not ( = ?auto_2235501 ?auto_2235503 ) ) ( TRUCK-AT ?auto_2235508 ?auto_2235507 ) ( not ( = ?auto_2235507 ?auto_2235506 ) ) ( HOIST-AT ?auto_2235504 ?auto_2235507 ) ( not ( = ?auto_2235505 ?auto_2235504 ) ) ( AVAILABLE ?auto_2235504 ) ( SURFACE-AT ?auto_2235503 ?auto_2235507 ) ( ON ?auto_2235503 ?auto_2235509 ) ( CLEAR ?auto_2235503 ) ( not ( = ?auto_2235502 ?auto_2235509 ) ) ( not ( = ?auto_2235503 ?auto_2235509 ) ) ( not ( = ?auto_2235501 ?auto_2235509 ) ) ( ON ?auto_2235488 ?auto_2235487 ) ( ON ?auto_2235489 ?auto_2235488 ) ( ON ?auto_2235490 ?auto_2235489 ) ( ON ?auto_2235491 ?auto_2235490 ) ( ON ?auto_2235492 ?auto_2235491 ) ( ON ?auto_2235493 ?auto_2235492 ) ( ON ?auto_2235494 ?auto_2235493 ) ( ON ?auto_2235495 ?auto_2235494 ) ( ON ?auto_2235496 ?auto_2235495 ) ( ON ?auto_2235497 ?auto_2235496 ) ( ON ?auto_2235498 ?auto_2235497 ) ( ON ?auto_2235499 ?auto_2235498 ) ( ON ?auto_2235500 ?auto_2235499 ) ( ON ?auto_2235501 ?auto_2235500 ) ( not ( = ?auto_2235487 ?auto_2235488 ) ) ( not ( = ?auto_2235487 ?auto_2235489 ) ) ( not ( = ?auto_2235487 ?auto_2235490 ) ) ( not ( = ?auto_2235487 ?auto_2235491 ) ) ( not ( = ?auto_2235487 ?auto_2235492 ) ) ( not ( = ?auto_2235487 ?auto_2235493 ) ) ( not ( = ?auto_2235487 ?auto_2235494 ) ) ( not ( = ?auto_2235487 ?auto_2235495 ) ) ( not ( = ?auto_2235487 ?auto_2235496 ) ) ( not ( = ?auto_2235487 ?auto_2235497 ) ) ( not ( = ?auto_2235487 ?auto_2235498 ) ) ( not ( = ?auto_2235487 ?auto_2235499 ) ) ( not ( = ?auto_2235487 ?auto_2235500 ) ) ( not ( = ?auto_2235487 ?auto_2235501 ) ) ( not ( = ?auto_2235487 ?auto_2235502 ) ) ( not ( = ?auto_2235487 ?auto_2235503 ) ) ( not ( = ?auto_2235487 ?auto_2235509 ) ) ( not ( = ?auto_2235488 ?auto_2235489 ) ) ( not ( = ?auto_2235488 ?auto_2235490 ) ) ( not ( = ?auto_2235488 ?auto_2235491 ) ) ( not ( = ?auto_2235488 ?auto_2235492 ) ) ( not ( = ?auto_2235488 ?auto_2235493 ) ) ( not ( = ?auto_2235488 ?auto_2235494 ) ) ( not ( = ?auto_2235488 ?auto_2235495 ) ) ( not ( = ?auto_2235488 ?auto_2235496 ) ) ( not ( = ?auto_2235488 ?auto_2235497 ) ) ( not ( = ?auto_2235488 ?auto_2235498 ) ) ( not ( = ?auto_2235488 ?auto_2235499 ) ) ( not ( = ?auto_2235488 ?auto_2235500 ) ) ( not ( = ?auto_2235488 ?auto_2235501 ) ) ( not ( = ?auto_2235488 ?auto_2235502 ) ) ( not ( = ?auto_2235488 ?auto_2235503 ) ) ( not ( = ?auto_2235488 ?auto_2235509 ) ) ( not ( = ?auto_2235489 ?auto_2235490 ) ) ( not ( = ?auto_2235489 ?auto_2235491 ) ) ( not ( = ?auto_2235489 ?auto_2235492 ) ) ( not ( = ?auto_2235489 ?auto_2235493 ) ) ( not ( = ?auto_2235489 ?auto_2235494 ) ) ( not ( = ?auto_2235489 ?auto_2235495 ) ) ( not ( = ?auto_2235489 ?auto_2235496 ) ) ( not ( = ?auto_2235489 ?auto_2235497 ) ) ( not ( = ?auto_2235489 ?auto_2235498 ) ) ( not ( = ?auto_2235489 ?auto_2235499 ) ) ( not ( = ?auto_2235489 ?auto_2235500 ) ) ( not ( = ?auto_2235489 ?auto_2235501 ) ) ( not ( = ?auto_2235489 ?auto_2235502 ) ) ( not ( = ?auto_2235489 ?auto_2235503 ) ) ( not ( = ?auto_2235489 ?auto_2235509 ) ) ( not ( = ?auto_2235490 ?auto_2235491 ) ) ( not ( = ?auto_2235490 ?auto_2235492 ) ) ( not ( = ?auto_2235490 ?auto_2235493 ) ) ( not ( = ?auto_2235490 ?auto_2235494 ) ) ( not ( = ?auto_2235490 ?auto_2235495 ) ) ( not ( = ?auto_2235490 ?auto_2235496 ) ) ( not ( = ?auto_2235490 ?auto_2235497 ) ) ( not ( = ?auto_2235490 ?auto_2235498 ) ) ( not ( = ?auto_2235490 ?auto_2235499 ) ) ( not ( = ?auto_2235490 ?auto_2235500 ) ) ( not ( = ?auto_2235490 ?auto_2235501 ) ) ( not ( = ?auto_2235490 ?auto_2235502 ) ) ( not ( = ?auto_2235490 ?auto_2235503 ) ) ( not ( = ?auto_2235490 ?auto_2235509 ) ) ( not ( = ?auto_2235491 ?auto_2235492 ) ) ( not ( = ?auto_2235491 ?auto_2235493 ) ) ( not ( = ?auto_2235491 ?auto_2235494 ) ) ( not ( = ?auto_2235491 ?auto_2235495 ) ) ( not ( = ?auto_2235491 ?auto_2235496 ) ) ( not ( = ?auto_2235491 ?auto_2235497 ) ) ( not ( = ?auto_2235491 ?auto_2235498 ) ) ( not ( = ?auto_2235491 ?auto_2235499 ) ) ( not ( = ?auto_2235491 ?auto_2235500 ) ) ( not ( = ?auto_2235491 ?auto_2235501 ) ) ( not ( = ?auto_2235491 ?auto_2235502 ) ) ( not ( = ?auto_2235491 ?auto_2235503 ) ) ( not ( = ?auto_2235491 ?auto_2235509 ) ) ( not ( = ?auto_2235492 ?auto_2235493 ) ) ( not ( = ?auto_2235492 ?auto_2235494 ) ) ( not ( = ?auto_2235492 ?auto_2235495 ) ) ( not ( = ?auto_2235492 ?auto_2235496 ) ) ( not ( = ?auto_2235492 ?auto_2235497 ) ) ( not ( = ?auto_2235492 ?auto_2235498 ) ) ( not ( = ?auto_2235492 ?auto_2235499 ) ) ( not ( = ?auto_2235492 ?auto_2235500 ) ) ( not ( = ?auto_2235492 ?auto_2235501 ) ) ( not ( = ?auto_2235492 ?auto_2235502 ) ) ( not ( = ?auto_2235492 ?auto_2235503 ) ) ( not ( = ?auto_2235492 ?auto_2235509 ) ) ( not ( = ?auto_2235493 ?auto_2235494 ) ) ( not ( = ?auto_2235493 ?auto_2235495 ) ) ( not ( = ?auto_2235493 ?auto_2235496 ) ) ( not ( = ?auto_2235493 ?auto_2235497 ) ) ( not ( = ?auto_2235493 ?auto_2235498 ) ) ( not ( = ?auto_2235493 ?auto_2235499 ) ) ( not ( = ?auto_2235493 ?auto_2235500 ) ) ( not ( = ?auto_2235493 ?auto_2235501 ) ) ( not ( = ?auto_2235493 ?auto_2235502 ) ) ( not ( = ?auto_2235493 ?auto_2235503 ) ) ( not ( = ?auto_2235493 ?auto_2235509 ) ) ( not ( = ?auto_2235494 ?auto_2235495 ) ) ( not ( = ?auto_2235494 ?auto_2235496 ) ) ( not ( = ?auto_2235494 ?auto_2235497 ) ) ( not ( = ?auto_2235494 ?auto_2235498 ) ) ( not ( = ?auto_2235494 ?auto_2235499 ) ) ( not ( = ?auto_2235494 ?auto_2235500 ) ) ( not ( = ?auto_2235494 ?auto_2235501 ) ) ( not ( = ?auto_2235494 ?auto_2235502 ) ) ( not ( = ?auto_2235494 ?auto_2235503 ) ) ( not ( = ?auto_2235494 ?auto_2235509 ) ) ( not ( = ?auto_2235495 ?auto_2235496 ) ) ( not ( = ?auto_2235495 ?auto_2235497 ) ) ( not ( = ?auto_2235495 ?auto_2235498 ) ) ( not ( = ?auto_2235495 ?auto_2235499 ) ) ( not ( = ?auto_2235495 ?auto_2235500 ) ) ( not ( = ?auto_2235495 ?auto_2235501 ) ) ( not ( = ?auto_2235495 ?auto_2235502 ) ) ( not ( = ?auto_2235495 ?auto_2235503 ) ) ( not ( = ?auto_2235495 ?auto_2235509 ) ) ( not ( = ?auto_2235496 ?auto_2235497 ) ) ( not ( = ?auto_2235496 ?auto_2235498 ) ) ( not ( = ?auto_2235496 ?auto_2235499 ) ) ( not ( = ?auto_2235496 ?auto_2235500 ) ) ( not ( = ?auto_2235496 ?auto_2235501 ) ) ( not ( = ?auto_2235496 ?auto_2235502 ) ) ( not ( = ?auto_2235496 ?auto_2235503 ) ) ( not ( = ?auto_2235496 ?auto_2235509 ) ) ( not ( = ?auto_2235497 ?auto_2235498 ) ) ( not ( = ?auto_2235497 ?auto_2235499 ) ) ( not ( = ?auto_2235497 ?auto_2235500 ) ) ( not ( = ?auto_2235497 ?auto_2235501 ) ) ( not ( = ?auto_2235497 ?auto_2235502 ) ) ( not ( = ?auto_2235497 ?auto_2235503 ) ) ( not ( = ?auto_2235497 ?auto_2235509 ) ) ( not ( = ?auto_2235498 ?auto_2235499 ) ) ( not ( = ?auto_2235498 ?auto_2235500 ) ) ( not ( = ?auto_2235498 ?auto_2235501 ) ) ( not ( = ?auto_2235498 ?auto_2235502 ) ) ( not ( = ?auto_2235498 ?auto_2235503 ) ) ( not ( = ?auto_2235498 ?auto_2235509 ) ) ( not ( = ?auto_2235499 ?auto_2235500 ) ) ( not ( = ?auto_2235499 ?auto_2235501 ) ) ( not ( = ?auto_2235499 ?auto_2235502 ) ) ( not ( = ?auto_2235499 ?auto_2235503 ) ) ( not ( = ?auto_2235499 ?auto_2235509 ) ) ( not ( = ?auto_2235500 ?auto_2235501 ) ) ( not ( = ?auto_2235500 ?auto_2235502 ) ) ( not ( = ?auto_2235500 ?auto_2235503 ) ) ( not ( = ?auto_2235500 ?auto_2235509 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235501 ?auto_2235502 ?auto_2235503 )
      ( MAKE-16CRATE-VERIFY ?auto_2235487 ?auto_2235488 ?auto_2235489 ?auto_2235490 ?auto_2235491 ?auto_2235492 ?auto_2235493 ?auto_2235494 ?auto_2235495 ?auto_2235496 ?auto_2235497 ?auto_2235498 ?auto_2235499 ?auto_2235500 ?auto_2235501 ?auto_2235502 ?auto_2235503 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235736 - SURFACE
      ?auto_2235737 - SURFACE
      ?auto_2235738 - SURFACE
      ?auto_2235739 - SURFACE
      ?auto_2235740 - SURFACE
      ?auto_2235741 - SURFACE
      ?auto_2235742 - SURFACE
      ?auto_2235743 - SURFACE
      ?auto_2235744 - SURFACE
      ?auto_2235745 - SURFACE
      ?auto_2235746 - SURFACE
      ?auto_2235747 - SURFACE
      ?auto_2235748 - SURFACE
      ?auto_2235749 - SURFACE
      ?auto_2235750 - SURFACE
      ?auto_2235751 - SURFACE
      ?auto_2235752 - SURFACE
    )
    :vars
    (
      ?auto_2235758 - HOIST
      ?auto_2235754 - PLACE
      ?auto_2235756 - PLACE
      ?auto_2235755 - HOIST
      ?auto_2235753 - SURFACE
      ?auto_2235757 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2235758 ?auto_2235754 ) ( SURFACE-AT ?auto_2235751 ?auto_2235754 ) ( CLEAR ?auto_2235751 ) ( IS-CRATE ?auto_2235752 ) ( not ( = ?auto_2235751 ?auto_2235752 ) ) ( AVAILABLE ?auto_2235758 ) ( ON ?auto_2235751 ?auto_2235750 ) ( not ( = ?auto_2235750 ?auto_2235751 ) ) ( not ( = ?auto_2235750 ?auto_2235752 ) ) ( not ( = ?auto_2235756 ?auto_2235754 ) ) ( HOIST-AT ?auto_2235755 ?auto_2235756 ) ( not ( = ?auto_2235758 ?auto_2235755 ) ) ( AVAILABLE ?auto_2235755 ) ( SURFACE-AT ?auto_2235752 ?auto_2235756 ) ( ON ?auto_2235752 ?auto_2235753 ) ( CLEAR ?auto_2235752 ) ( not ( = ?auto_2235751 ?auto_2235753 ) ) ( not ( = ?auto_2235752 ?auto_2235753 ) ) ( not ( = ?auto_2235750 ?auto_2235753 ) ) ( TRUCK-AT ?auto_2235757 ?auto_2235754 ) ( ON ?auto_2235737 ?auto_2235736 ) ( ON ?auto_2235738 ?auto_2235737 ) ( ON ?auto_2235739 ?auto_2235738 ) ( ON ?auto_2235740 ?auto_2235739 ) ( ON ?auto_2235741 ?auto_2235740 ) ( ON ?auto_2235742 ?auto_2235741 ) ( ON ?auto_2235743 ?auto_2235742 ) ( ON ?auto_2235744 ?auto_2235743 ) ( ON ?auto_2235745 ?auto_2235744 ) ( ON ?auto_2235746 ?auto_2235745 ) ( ON ?auto_2235747 ?auto_2235746 ) ( ON ?auto_2235748 ?auto_2235747 ) ( ON ?auto_2235749 ?auto_2235748 ) ( ON ?auto_2235750 ?auto_2235749 ) ( not ( = ?auto_2235736 ?auto_2235737 ) ) ( not ( = ?auto_2235736 ?auto_2235738 ) ) ( not ( = ?auto_2235736 ?auto_2235739 ) ) ( not ( = ?auto_2235736 ?auto_2235740 ) ) ( not ( = ?auto_2235736 ?auto_2235741 ) ) ( not ( = ?auto_2235736 ?auto_2235742 ) ) ( not ( = ?auto_2235736 ?auto_2235743 ) ) ( not ( = ?auto_2235736 ?auto_2235744 ) ) ( not ( = ?auto_2235736 ?auto_2235745 ) ) ( not ( = ?auto_2235736 ?auto_2235746 ) ) ( not ( = ?auto_2235736 ?auto_2235747 ) ) ( not ( = ?auto_2235736 ?auto_2235748 ) ) ( not ( = ?auto_2235736 ?auto_2235749 ) ) ( not ( = ?auto_2235736 ?auto_2235750 ) ) ( not ( = ?auto_2235736 ?auto_2235751 ) ) ( not ( = ?auto_2235736 ?auto_2235752 ) ) ( not ( = ?auto_2235736 ?auto_2235753 ) ) ( not ( = ?auto_2235737 ?auto_2235738 ) ) ( not ( = ?auto_2235737 ?auto_2235739 ) ) ( not ( = ?auto_2235737 ?auto_2235740 ) ) ( not ( = ?auto_2235737 ?auto_2235741 ) ) ( not ( = ?auto_2235737 ?auto_2235742 ) ) ( not ( = ?auto_2235737 ?auto_2235743 ) ) ( not ( = ?auto_2235737 ?auto_2235744 ) ) ( not ( = ?auto_2235737 ?auto_2235745 ) ) ( not ( = ?auto_2235737 ?auto_2235746 ) ) ( not ( = ?auto_2235737 ?auto_2235747 ) ) ( not ( = ?auto_2235737 ?auto_2235748 ) ) ( not ( = ?auto_2235737 ?auto_2235749 ) ) ( not ( = ?auto_2235737 ?auto_2235750 ) ) ( not ( = ?auto_2235737 ?auto_2235751 ) ) ( not ( = ?auto_2235737 ?auto_2235752 ) ) ( not ( = ?auto_2235737 ?auto_2235753 ) ) ( not ( = ?auto_2235738 ?auto_2235739 ) ) ( not ( = ?auto_2235738 ?auto_2235740 ) ) ( not ( = ?auto_2235738 ?auto_2235741 ) ) ( not ( = ?auto_2235738 ?auto_2235742 ) ) ( not ( = ?auto_2235738 ?auto_2235743 ) ) ( not ( = ?auto_2235738 ?auto_2235744 ) ) ( not ( = ?auto_2235738 ?auto_2235745 ) ) ( not ( = ?auto_2235738 ?auto_2235746 ) ) ( not ( = ?auto_2235738 ?auto_2235747 ) ) ( not ( = ?auto_2235738 ?auto_2235748 ) ) ( not ( = ?auto_2235738 ?auto_2235749 ) ) ( not ( = ?auto_2235738 ?auto_2235750 ) ) ( not ( = ?auto_2235738 ?auto_2235751 ) ) ( not ( = ?auto_2235738 ?auto_2235752 ) ) ( not ( = ?auto_2235738 ?auto_2235753 ) ) ( not ( = ?auto_2235739 ?auto_2235740 ) ) ( not ( = ?auto_2235739 ?auto_2235741 ) ) ( not ( = ?auto_2235739 ?auto_2235742 ) ) ( not ( = ?auto_2235739 ?auto_2235743 ) ) ( not ( = ?auto_2235739 ?auto_2235744 ) ) ( not ( = ?auto_2235739 ?auto_2235745 ) ) ( not ( = ?auto_2235739 ?auto_2235746 ) ) ( not ( = ?auto_2235739 ?auto_2235747 ) ) ( not ( = ?auto_2235739 ?auto_2235748 ) ) ( not ( = ?auto_2235739 ?auto_2235749 ) ) ( not ( = ?auto_2235739 ?auto_2235750 ) ) ( not ( = ?auto_2235739 ?auto_2235751 ) ) ( not ( = ?auto_2235739 ?auto_2235752 ) ) ( not ( = ?auto_2235739 ?auto_2235753 ) ) ( not ( = ?auto_2235740 ?auto_2235741 ) ) ( not ( = ?auto_2235740 ?auto_2235742 ) ) ( not ( = ?auto_2235740 ?auto_2235743 ) ) ( not ( = ?auto_2235740 ?auto_2235744 ) ) ( not ( = ?auto_2235740 ?auto_2235745 ) ) ( not ( = ?auto_2235740 ?auto_2235746 ) ) ( not ( = ?auto_2235740 ?auto_2235747 ) ) ( not ( = ?auto_2235740 ?auto_2235748 ) ) ( not ( = ?auto_2235740 ?auto_2235749 ) ) ( not ( = ?auto_2235740 ?auto_2235750 ) ) ( not ( = ?auto_2235740 ?auto_2235751 ) ) ( not ( = ?auto_2235740 ?auto_2235752 ) ) ( not ( = ?auto_2235740 ?auto_2235753 ) ) ( not ( = ?auto_2235741 ?auto_2235742 ) ) ( not ( = ?auto_2235741 ?auto_2235743 ) ) ( not ( = ?auto_2235741 ?auto_2235744 ) ) ( not ( = ?auto_2235741 ?auto_2235745 ) ) ( not ( = ?auto_2235741 ?auto_2235746 ) ) ( not ( = ?auto_2235741 ?auto_2235747 ) ) ( not ( = ?auto_2235741 ?auto_2235748 ) ) ( not ( = ?auto_2235741 ?auto_2235749 ) ) ( not ( = ?auto_2235741 ?auto_2235750 ) ) ( not ( = ?auto_2235741 ?auto_2235751 ) ) ( not ( = ?auto_2235741 ?auto_2235752 ) ) ( not ( = ?auto_2235741 ?auto_2235753 ) ) ( not ( = ?auto_2235742 ?auto_2235743 ) ) ( not ( = ?auto_2235742 ?auto_2235744 ) ) ( not ( = ?auto_2235742 ?auto_2235745 ) ) ( not ( = ?auto_2235742 ?auto_2235746 ) ) ( not ( = ?auto_2235742 ?auto_2235747 ) ) ( not ( = ?auto_2235742 ?auto_2235748 ) ) ( not ( = ?auto_2235742 ?auto_2235749 ) ) ( not ( = ?auto_2235742 ?auto_2235750 ) ) ( not ( = ?auto_2235742 ?auto_2235751 ) ) ( not ( = ?auto_2235742 ?auto_2235752 ) ) ( not ( = ?auto_2235742 ?auto_2235753 ) ) ( not ( = ?auto_2235743 ?auto_2235744 ) ) ( not ( = ?auto_2235743 ?auto_2235745 ) ) ( not ( = ?auto_2235743 ?auto_2235746 ) ) ( not ( = ?auto_2235743 ?auto_2235747 ) ) ( not ( = ?auto_2235743 ?auto_2235748 ) ) ( not ( = ?auto_2235743 ?auto_2235749 ) ) ( not ( = ?auto_2235743 ?auto_2235750 ) ) ( not ( = ?auto_2235743 ?auto_2235751 ) ) ( not ( = ?auto_2235743 ?auto_2235752 ) ) ( not ( = ?auto_2235743 ?auto_2235753 ) ) ( not ( = ?auto_2235744 ?auto_2235745 ) ) ( not ( = ?auto_2235744 ?auto_2235746 ) ) ( not ( = ?auto_2235744 ?auto_2235747 ) ) ( not ( = ?auto_2235744 ?auto_2235748 ) ) ( not ( = ?auto_2235744 ?auto_2235749 ) ) ( not ( = ?auto_2235744 ?auto_2235750 ) ) ( not ( = ?auto_2235744 ?auto_2235751 ) ) ( not ( = ?auto_2235744 ?auto_2235752 ) ) ( not ( = ?auto_2235744 ?auto_2235753 ) ) ( not ( = ?auto_2235745 ?auto_2235746 ) ) ( not ( = ?auto_2235745 ?auto_2235747 ) ) ( not ( = ?auto_2235745 ?auto_2235748 ) ) ( not ( = ?auto_2235745 ?auto_2235749 ) ) ( not ( = ?auto_2235745 ?auto_2235750 ) ) ( not ( = ?auto_2235745 ?auto_2235751 ) ) ( not ( = ?auto_2235745 ?auto_2235752 ) ) ( not ( = ?auto_2235745 ?auto_2235753 ) ) ( not ( = ?auto_2235746 ?auto_2235747 ) ) ( not ( = ?auto_2235746 ?auto_2235748 ) ) ( not ( = ?auto_2235746 ?auto_2235749 ) ) ( not ( = ?auto_2235746 ?auto_2235750 ) ) ( not ( = ?auto_2235746 ?auto_2235751 ) ) ( not ( = ?auto_2235746 ?auto_2235752 ) ) ( not ( = ?auto_2235746 ?auto_2235753 ) ) ( not ( = ?auto_2235747 ?auto_2235748 ) ) ( not ( = ?auto_2235747 ?auto_2235749 ) ) ( not ( = ?auto_2235747 ?auto_2235750 ) ) ( not ( = ?auto_2235747 ?auto_2235751 ) ) ( not ( = ?auto_2235747 ?auto_2235752 ) ) ( not ( = ?auto_2235747 ?auto_2235753 ) ) ( not ( = ?auto_2235748 ?auto_2235749 ) ) ( not ( = ?auto_2235748 ?auto_2235750 ) ) ( not ( = ?auto_2235748 ?auto_2235751 ) ) ( not ( = ?auto_2235748 ?auto_2235752 ) ) ( not ( = ?auto_2235748 ?auto_2235753 ) ) ( not ( = ?auto_2235749 ?auto_2235750 ) ) ( not ( = ?auto_2235749 ?auto_2235751 ) ) ( not ( = ?auto_2235749 ?auto_2235752 ) ) ( not ( = ?auto_2235749 ?auto_2235753 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235750 ?auto_2235751 ?auto_2235752 )
      ( MAKE-16CRATE-VERIFY ?auto_2235736 ?auto_2235737 ?auto_2235738 ?auto_2235739 ?auto_2235740 ?auto_2235741 ?auto_2235742 ?auto_2235743 ?auto_2235744 ?auto_2235745 ?auto_2235746 ?auto_2235747 ?auto_2235748 ?auto_2235749 ?auto_2235750 ?auto_2235751 ?auto_2235752 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2235985 - SURFACE
      ?auto_2235986 - SURFACE
      ?auto_2235987 - SURFACE
      ?auto_2235988 - SURFACE
      ?auto_2235989 - SURFACE
      ?auto_2235990 - SURFACE
      ?auto_2235991 - SURFACE
      ?auto_2235992 - SURFACE
      ?auto_2235993 - SURFACE
      ?auto_2235994 - SURFACE
      ?auto_2235995 - SURFACE
      ?auto_2235996 - SURFACE
      ?auto_2235997 - SURFACE
      ?auto_2235998 - SURFACE
      ?auto_2235999 - SURFACE
      ?auto_2236000 - SURFACE
      ?auto_2236001 - SURFACE
    )
    :vars
    (
      ?auto_2236007 - HOIST
      ?auto_2236006 - PLACE
      ?auto_2236003 - PLACE
      ?auto_2236005 - HOIST
      ?auto_2236002 - SURFACE
      ?auto_2236004 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236007 ?auto_2236006 ) ( IS-CRATE ?auto_2236001 ) ( not ( = ?auto_2236000 ?auto_2236001 ) ) ( not ( = ?auto_2235999 ?auto_2236000 ) ) ( not ( = ?auto_2235999 ?auto_2236001 ) ) ( not ( = ?auto_2236003 ?auto_2236006 ) ) ( HOIST-AT ?auto_2236005 ?auto_2236003 ) ( not ( = ?auto_2236007 ?auto_2236005 ) ) ( AVAILABLE ?auto_2236005 ) ( SURFACE-AT ?auto_2236001 ?auto_2236003 ) ( ON ?auto_2236001 ?auto_2236002 ) ( CLEAR ?auto_2236001 ) ( not ( = ?auto_2236000 ?auto_2236002 ) ) ( not ( = ?auto_2236001 ?auto_2236002 ) ) ( not ( = ?auto_2235999 ?auto_2236002 ) ) ( TRUCK-AT ?auto_2236004 ?auto_2236006 ) ( SURFACE-AT ?auto_2235999 ?auto_2236006 ) ( CLEAR ?auto_2235999 ) ( LIFTING ?auto_2236007 ?auto_2236000 ) ( IS-CRATE ?auto_2236000 ) ( ON ?auto_2235986 ?auto_2235985 ) ( ON ?auto_2235987 ?auto_2235986 ) ( ON ?auto_2235988 ?auto_2235987 ) ( ON ?auto_2235989 ?auto_2235988 ) ( ON ?auto_2235990 ?auto_2235989 ) ( ON ?auto_2235991 ?auto_2235990 ) ( ON ?auto_2235992 ?auto_2235991 ) ( ON ?auto_2235993 ?auto_2235992 ) ( ON ?auto_2235994 ?auto_2235993 ) ( ON ?auto_2235995 ?auto_2235994 ) ( ON ?auto_2235996 ?auto_2235995 ) ( ON ?auto_2235997 ?auto_2235996 ) ( ON ?auto_2235998 ?auto_2235997 ) ( ON ?auto_2235999 ?auto_2235998 ) ( not ( = ?auto_2235985 ?auto_2235986 ) ) ( not ( = ?auto_2235985 ?auto_2235987 ) ) ( not ( = ?auto_2235985 ?auto_2235988 ) ) ( not ( = ?auto_2235985 ?auto_2235989 ) ) ( not ( = ?auto_2235985 ?auto_2235990 ) ) ( not ( = ?auto_2235985 ?auto_2235991 ) ) ( not ( = ?auto_2235985 ?auto_2235992 ) ) ( not ( = ?auto_2235985 ?auto_2235993 ) ) ( not ( = ?auto_2235985 ?auto_2235994 ) ) ( not ( = ?auto_2235985 ?auto_2235995 ) ) ( not ( = ?auto_2235985 ?auto_2235996 ) ) ( not ( = ?auto_2235985 ?auto_2235997 ) ) ( not ( = ?auto_2235985 ?auto_2235998 ) ) ( not ( = ?auto_2235985 ?auto_2235999 ) ) ( not ( = ?auto_2235985 ?auto_2236000 ) ) ( not ( = ?auto_2235985 ?auto_2236001 ) ) ( not ( = ?auto_2235985 ?auto_2236002 ) ) ( not ( = ?auto_2235986 ?auto_2235987 ) ) ( not ( = ?auto_2235986 ?auto_2235988 ) ) ( not ( = ?auto_2235986 ?auto_2235989 ) ) ( not ( = ?auto_2235986 ?auto_2235990 ) ) ( not ( = ?auto_2235986 ?auto_2235991 ) ) ( not ( = ?auto_2235986 ?auto_2235992 ) ) ( not ( = ?auto_2235986 ?auto_2235993 ) ) ( not ( = ?auto_2235986 ?auto_2235994 ) ) ( not ( = ?auto_2235986 ?auto_2235995 ) ) ( not ( = ?auto_2235986 ?auto_2235996 ) ) ( not ( = ?auto_2235986 ?auto_2235997 ) ) ( not ( = ?auto_2235986 ?auto_2235998 ) ) ( not ( = ?auto_2235986 ?auto_2235999 ) ) ( not ( = ?auto_2235986 ?auto_2236000 ) ) ( not ( = ?auto_2235986 ?auto_2236001 ) ) ( not ( = ?auto_2235986 ?auto_2236002 ) ) ( not ( = ?auto_2235987 ?auto_2235988 ) ) ( not ( = ?auto_2235987 ?auto_2235989 ) ) ( not ( = ?auto_2235987 ?auto_2235990 ) ) ( not ( = ?auto_2235987 ?auto_2235991 ) ) ( not ( = ?auto_2235987 ?auto_2235992 ) ) ( not ( = ?auto_2235987 ?auto_2235993 ) ) ( not ( = ?auto_2235987 ?auto_2235994 ) ) ( not ( = ?auto_2235987 ?auto_2235995 ) ) ( not ( = ?auto_2235987 ?auto_2235996 ) ) ( not ( = ?auto_2235987 ?auto_2235997 ) ) ( not ( = ?auto_2235987 ?auto_2235998 ) ) ( not ( = ?auto_2235987 ?auto_2235999 ) ) ( not ( = ?auto_2235987 ?auto_2236000 ) ) ( not ( = ?auto_2235987 ?auto_2236001 ) ) ( not ( = ?auto_2235987 ?auto_2236002 ) ) ( not ( = ?auto_2235988 ?auto_2235989 ) ) ( not ( = ?auto_2235988 ?auto_2235990 ) ) ( not ( = ?auto_2235988 ?auto_2235991 ) ) ( not ( = ?auto_2235988 ?auto_2235992 ) ) ( not ( = ?auto_2235988 ?auto_2235993 ) ) ( not ( = ?auto_2235988 ?auto_2235994 ) ) ( not ( = ?auto_2235988 ?auto_2235995 ) ) ( not ( = ?auto_2235988 ?auto_2235996 ) ) ( not ( = ?auto_2235988 ?auto_2235997 ) ) ( not ( = ?auto_2235988 ?auto_2235998 ) ) ( not ( = ?auto_2235988 ?auto_2235999 ) ) ( not ( = ?auto_2235988 ?auto_2236000 ) ) ( not ( = ?auto_2235988 ?auto_2236001 ) ) ( not ( = ?auto_2235988 ?auto_2236002 ) ) ( not ( = ?auto_2235989 ?auto_2235990 ) ) ( not ( = ?auto_2235989 ?auto_2235991 ) ) ( not ( = ?auto_2235989 ?auto_2235992 ) ) ( not ( = ?auto_2235989 ?auto_2235993 ) ) ( not ( = ?auto_2235989 ?auto_2235994 ) ) ( not ( = ?auto_2235989 ?auto_2235995 ) ) ( not ( = ?auto_2235989 ?auto_2235996 ) ) ( not ( = ?auto_2235989 ?auto_2235997 ) ) ( not ( = ?auto_2235989 ?auto_2235998 ) ) ( not ( = ?auto_2235989 ?auto_2235999 ) ) ( not ( = ?auto_2235989 ?auto_2236000 ) ) ( not ( = ?auto_2235989 ?auto_2236001 ) ) ( not ( = ?auto_2235989 ?auto_2236002 ) ) ( not ( = ?auto_2235990 ?auto_2235991 ) ) ( not ( = ?auto_2235990 ?auto_2235992 ) ) ( not ( = ?auto_2235990 ?auto_2235993 ) ) ( not ( = ?auto_2235990 ?auto_2235994 ) ) ( not ( = ?auto_2235990 ?auto_2235995 ) ) ( not ( = ?auto_2235990 ?auto_2235996 ) ) ( not ( = ?auto_2235990 ?auto_2235997 ) ) ( not ( = ?auto_2235990 ?auto_2235998 ) ) ( not ( = ?auto_2235990 ?auto_2235999 ) ) ( not ( = ?auto_2235990 ?auto_2236000 ) ) ( not ( = ?auto_2235990 ?auto_2236001 ) ) ( not ( = ?auto_2235990 ?auto_2236002 ) ) ( not ( = ?auto_2235991 ?auto_2235992 ) ) ( not ( = ?auto_2235991 ?auto_2235993 ) ) ( not ( = ?auto_2235991 ?auto_2235994 ) ) ( not ( = ?auto_2235991 ?auto_2235995 ) ) ( not ( = ?auto_2235991 ?auto_2235996 ) ) ( not ( = ?auto_2235991 ?auto_2235997 ) ) ( not ( = ?auto_2235991 ?auto_2235998 ) ) ( not ( = ?auto_2235991 ?auto_2235999 ) ) ( not ( = ?auto_2235991 ?auto_2236000 ) ) ( not ( = ?auto_2235991 ?auto_2236001 ) ) ( not ( = ?auto_2235991 ?auto_2236002 ) ) ( not ( = ?auto_2235992 ?auto_2235993 ) ) ( not ( = ?auto_2235992 ?auto_2235994 ) ) ( not ( = ?auto_2235992 ?auto_2235995 ) ) ( not ( = ?auto_2235992 ?auto_2235996 ) ) ( not ( = ?auto_2235992 ?auto_2235997 ) ) ( not ( = ?auto_2235992 ?auto_2235998 ) ) ( not ( = ?auto_2235992 ?auto_2235999 ) ) ( not ( = ?auto_2235992 ?auto_2236000 ) ) ( not ( = ?auto_2235992 ?auto_2236001 ) ) ( not ( = ?auto_2235992 ?auto_2236002 ) ) ( not ( = ?auto_2235993 ?auto_2235994 ) ) ( not ( = ?auto_2235993 ?auto_2235995 ) ) ( not ( = ?auto_2235993 ?auto_2235996 ) ) ( not ( = ?auto_2235993 ?auto_2235997 ) ) ( not ( = ?auto_2235993 ?auto_2235998 ) ) ( not ( = ?auto_2235993 ?auto_2235999 ) ) ( not ( = ?auto_2235993 ?auto_2236000 ) ) ( not ( = ?auto_2235993 ?auto_2236001 ) ) ( not ( = ?auto_2235993 ?auto_2236002 ) ) ( not ( = ?auto_2235994 ?auto_2235995 ) ) ( not ( = ?auto_2235994 ?auto_2235996 ) ) ( not ( = ?auto_2235994 ?auto_2235997 ) ) ( not ( = ?auto_2235994 ?auto_2235998 ) ) ( not ( = ?auto_2235994 ?auto_2235999 ) ) ( not ( = ?auto_2235994 ?auto_2236000 ) ) ( not ( = ?auto_2235994 ?auto_2236001 ) ) ( not ( = ?auto_2235994 ?auto_2236002 ) ) ( not ( = ?auto_2235995 ?auto_2235996 ) ) ( not ( = ?auto_2235995 ?auto_2235997 ) ) ( not ( = ?auto_2235995 ?auto_2235998 ) ) ( not ( = ?auto_2235995 ?auto_2235999 ) ) ( not ( = ?auto_2235995 ?auto_2236000 ) ) ( not ( = ?auto_2235995 ?auto_2236001 ) ) ( not ( = ?auto_2235995 ?auto_2236002 ) ) ( not ( = ?auto_2235996 ?auto_2235997 ) ) ( not ( = ?auto_2235996 ?auto_2235998 ) ) ( not ( = ?auto_2235996 ?auto_2235999 ) ) ( not ( = ?auto_2235996 ?auto_2236000 ) ) ( not ( = ?auto_2235996 ?auto_2236001 ) ) ( not ( = ?auto_2235996 ?auto_2236002 ) ) ( not ( = ?auto_2235997 ?auto_2235998 ) ) ( not ( = ?auto_2235997 ?auto_2235999 ) ) ( not ( = ?auto_2235997 ?auto_2236000 ) ) ( not ( = ?auto_2235997 ?auto_2236001 ) ) ( not ( = ?auto_2235997 ?auto_2236002 ) ) ( not ( = ?auto_2235998 ?auto_2235999 ) ) ( not ( = ?auto_2235998 ?auto_2236000 ) ) ( not ( = ?auto_2235998 ?auto_2236001 ) ) ( not ( = ?auto_2235998 ?auto_2236002 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2235999 ?auto_2236000 ?auto_2236001 )
      ( MAKE-16CRATE-VERIFY ?auto_2235985 ?auto_2235986 ?auto_2235987 ?auto_2235988 ?auto_2235989 ?auto_2235990 ?auto_2235991 ?auto_2235992 ?auto_2235993 ?auto_2235994 ?auto_2235995 ?auto_2235996 ?auto_2235997 ?auto_2235998 ?auto_2235999 ?auto_2236000 ?auto_2236001 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_2236234 - SURFACE
      ?auto_2236235 - SURFACE
      ?auto_2236236 - SURFACE
      ?auto_2236237 - SURFACE
      ?auto_2236238 - SURFACE
      ?auto_2236239 - SURFACE
      ?auto_2236240 - SURFACE
      ?auto_2236241 - SURFACE
      ?auto_2236242 - SURFACE
      ?auto_2236243 - SURFACE
      ?auto_2236244 - SURFACE
      ?auto_2236245 - SURFACE
      ?auto_2236246 - SURFACE
      ?auto_2236247 - SURFACE
      ?auto_2236248 - SURFACE
      ?auto_2236249 - SURFACE
      ?auto_2236250 - SURFACE
    )
    :vars
    (
      ?auto_2236256 - HOIST
      ?auto_2236253 - PLACE
      ?auto_2236254 - PLACE
      ?auto_2236255 - HOIST
      ?auto_2236252 - SURFACE
      ?auto_2236251 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2236256 ?auto_2236253 ) ( IS-CRATE ?auto_2236250 ) ( not ( = ?auto_2236249 ?auto_2236250 ) ) ( not ( = ?auto_2236248 ?auto_2236249 ) ) ( not ( = ?auto_2236248 ?auto_2236250 ) ) ( not ( = ?auto_2236254 ?auto_2236253 ) ) ( HOIST-AT ?auto_2236255 ?auto_2236254 ) ( not ( = ?auto_2236256 ?auto_2236255 ) ) ( AVAILABLE ?auto_2236255 ) ( SURFACE-AT ?auto_2236250 ?auto_2236254 ) ( ON ?auto_2236250 ?auto_2236252 ) ( CLEAR ?auto_2236250 ) ( not ( = ?auto_2236249 ?auto_2236252 ) ) ( not ( = ?auto_2236250 ?auto_2236252 ) ) ( not ( = ?auto_2236248 ?auto_2236252 ) ) ( TRUCK-AT ?auto_2236251 ?auto_2236253 ) ( SURFACE-AT ?auto_2236248 ?auto_2236253 ) ( CLEAR ?auto_2236248 ) ( IS-CRATE ?auto_2236249 ) ( AVAILABLE ?auto_2236256 ) ( IN ?auto_2236249 ?auto_2236251 ) ( ON ?auto_2236235 ?auto_2236234 ) ( ON ?auto_2236236 ?auto_2236235 ) ( ON ?auto_2236237 ?auto_2236236 ) ( ON ?auto_2236238 ?auto_2236237 ) ( ON ?auto_2236239 ?auto_2236238 ) ( ON ?auto_2236240 ?auto_2236239 ) ( ON ?auto_2236241 ?auto_2236240 ) ( ON ?auto_2236242 ?auto_2236241 ) ( ON ?auto_2236243 ?auto_2236242 ) ( ON ?auto_2236244 ?auto_2236243 ) ( ON ?auto_2236245 ?auto_2236244 ) ( ON ?auto_2236246 ?auto_2236245 ) ( ON ?auto_2236247 ?auto_2236246 ) ( ON ?auto_2236248 ?auto_2236247 ) ( not ( = ?auto_2236234 ?auto_2236235 ) ) ( not ( = ?auto_2236234 ?auto_2236236 ) ) ( not ( = ?auto_2236234 ?auto_2236237 ) ) ( not ( = ?auto_2236234 ?auto_2236238 ) ) ( not ( = ?auto_2236234 ?auto_2236239 ) ) ( not ( = ?auto_2236234 ?auto_2236240 ) ) ( not ( = ?auto_2236234 ?auto_2236241 ) ) ( not ( = ?auto_2236234 ?auto_2236242 ) ) ( not ( = ?auto_2236234 ?auto_2236243 ) ) ( not ( = ?auto_2236234 ?auto_2236244 ) ) ( not ( = ?auto_2236234 ?auto_2236245 ) ) ( not ( = ?auto_2236234 ?auto_2236246 ) ) ( not ( = ?auto_2236234 ?auto_2236247 ) ) ( not ( = ?auto_2236234 ?auto_2236248 ) ) ( not ( = ?auto_2236234 ?auto_2236249 ) ) ( not ( = ?auto_2236234 ?auto_2236250 ) ) ( not ( = ?auto_2236234 ?auto_2236252 ) ) ( not ( = ?auto_2236235 ?auto_2236236 ) ) ( not ( = ?auto_2236235 ?auto_2236237 ) ) ( not ( = ?auto_2236235 ?auto_2236238 ) ) ( not ( = ?auto_2236235 ?auto_2236239 ) ) ( not ( = ?auto_2236235 ?auto_2236240 ) ) ( not ( = ?auto_2236235 ?auto_2236241 ) ) ( not ( = ?auto_2236235 ?auto_2236242 ) ) ( not ( = ?auto_2236235 ?auto_2236243 ) ) ( not ( = ?auto_2236235 ?auto_2236244 ) ) ( not ( = ?auto_2236235 ?auto_2236245 ) ) ( not ( = ?auto_2236235 ?auto_2236246 ) ) ( not ( = ?auto_2236235 ?auto_2236247 ) ) ( not ( = ?auto_2236235 ?auto_2236248 ) ) ( not ( = ?auto_2236235 ?auto_2236249 ) ) ( not ( = ?auto_2236235 ?auto_2236250 ) ) ( not ( = ?auto_2236235 ?auto_2236252 ) ) ( not ( = ?auto_2236236 ?auto_2236237 ) ) ( not ( = ?auto_2236236 ?auto_2236238 ) ) ( not ( = ?auto_2236236 ?auto_2236239 ) ) ( not ( = ?auto_2236236 ?auto_2236240 ) ) ( not ( = ?auto_2236236 ?auto_2236241 ) ) ( not ( = ?auto_2236236 ?auto_2236242 ) ) ( not ( = ?auto_2236236 ?auto_2236243 ) ) ( not ( = ?auto_2236236 ?auto_2236244 ) ) ( not ( = ?auto_2236236 ?auto_2236245 ) ) ( not ( = ?auto_2236236 ?auto_2236246 ) ) ( not ( = ?auto_2236236 ?auto_2236247 ) ) ( not ( = ?auto_2236236 ?auto_2236248 ) ) ( not ( = ?auto_2236236 ?auto_2236249 ) ) ( not ( = ?auto_2236236 ?auto_2236250 ) ) ( not ( = ?auto_2236236 ?auto_2236252 ) ) ( not ( = ?auto_2236237 ?auto_2236238 ) ) ( not ( = ?auto_2236237 ?auto_2236239 ) ) ( not ( = ?auto_2236237 ?auto_2236240 ) ) ( not ( = ?auto_2236237 ?auto_2236241 ) ) ( not ( = ?auto_2236237 ?auto_2236242 ) ) ( not ( = ?auto_2236237 ?auto_2236243 ) ) ( not ( = ?auto_2236237 ?auto_2236244 ) ) ( not ( = ?auto_2236237 ?auto_2236245 ) ) ( not ( = ?auto_2236237 ?auto_2236246 ) ) ( not ( = ?auto_2236237 ?auto_2236247 ) ) ( not ( = ?auto_2236237 ?auto_2236248 ) ) ( not ( = ?auto_2236237 ?auto_2236249 ) ) ( not ( = ?auto_2236237 ?auto_2236250 ) ) ( not ( = ?auto_2236237 ?auto_2236252 ) ) ( not ( = ?auto_2236238 ?auto_2236239 ) ) ( not ( = ?auto_2236238 ?auto_2236240 ) ) ( not ( = ?auto_2236238 ?auto_2236241 ) ) ( not ( = ?auto_2236238 ?auto_2236242 ) ) ( not ( = ?auto_2236238 ?auto_2236243 ) ) ( not ( = ?auto_2236238 ?auto_2236244 ) ) ( not ( = ?auto_2236238 ?auto_2236245 ) ) ( not ( = ?auto_2236238 ?auto_2236246 ) ) ( not ( = ?auto_2236238 ?auto_2236247 ) ) ( not ( = ?auto_2236238 ?auto_2236248 ) ) ( not ( = ?auto_2236238 ?auto_2236249 ) ) ( not ( = ?auto_2236238 ?auto_2236250 ) ) ( not ( = ?auto_2236238 ?auto_2236252 ) ) ( not ( = ?auto_2236239 ?auto_2236240 ) ) ( not ( = ?auto_2236239 ?auto_2236241 ) ) ( not ( = ?auto_2236239 ?auto_2236242 ) ) ( not ( = ?auto_2236239 ?auto_2236243 ) ) ( not ( = ?auto_2236239 ?auto_2236244 ) ) ( not ( = ?auto_2236239 ?auto_2236245 ) ) ( not ( = ?auto_2236239 ?auto_2236246 ) ) ( not ( = ?auto_2236239 ?auto_2236247 ) ) ( not ( = ?auto_2236239 ?auto_2236248 ) ) ( not ( = ?auto_2236239 ?auto_2236249 ) ) ( not ( = ?auto_2236239 ?auto_2236250 ) ) ( not ( = ?auto_2236239 ?auto_2236252 ) ) ( not ( = ?auto_2236240 ?auto_2236241 ) ) ( not ( = ?auto_2236240 ?auto_2236242 ) ) ( not ( = ?auto_2236240 ?auto_2236243 ) ) ( not ( = ?auto_2236240 ?auto_2236244 ) ) ( not ( = ?auto_2236240 ?auto_2236245 ) ) ( not ( = ?auto_2236240 ?auto_2236246 ) ) ( not ( = ?auto_2236240 ?auto_2236247 ) ) ( not ( = ?auto_2236240 ?auto_2236248 ) ) ( not ( = ?auto_2236240 ?auto_2236249 ) ) ( not ( = ?auto_2236240 ?auto_2236250 ) ) ( not ( = ?auto_2236240 ?auto_2236252 ) ) ( not ( = ?auto_2236241 ?auto_2236242 ) ) ( not ( = ?auto_2236241 ?auto_2236243 ) ) ( not ( = ?auto_2236241 ?auto_2236244 ) ) ( not ( = ?auto_2236241 ?auto_2236245 ) ) ( not ( = ?auto_2236241 ?auto_2236246 ) ) ( not ( = ?auto_2236241 ?auto_2236247 ) ) ( not ( = ?auto_2236241 ?auto_2236248 ) ) ( not ( = ?auto_2236241 ?auto_2236249 ) ) ( not ( = ?auto_2236241 ?auto_2236250 ) ) ( not ( = ?auto_2236241 ?auto_2236252 ) ) ( not ( = ?auto_2236242 ?auto_2236243 ) ) ( not ( = ?auto_2236242 ?auto_2236244 ) ) ( not ( = ?auto_2236242 ?auto_2236245 ) ) ( not ( = ?auto_2236242 ?auto_2236246 ) ) ( not ( = ?auto_2236242 ?auto_2236247 ) ) ( not ( = ?auto_2236242 ?auto_2236248 ) ) ( not ( = ?auto_2236242 ?auto_2236249 ) ) ( not ( = ?auto_2236242 ?auto_2236250 ) ) ( not ( = ?auto_2236242 ?auto_2236252 ) ) ( not ( = ?auto_2236243 ?auto_2236244 ) ) ( not ( = ?auto_2236243 ?auto_2236245 ) ) ( not ( = ?auto_2236243 ?auto_2236246 ) ) ( not ( = ?auto_2236243 ?auto_2236247 ) ) ( not ( = ?auto_2236243 ?auto_2236248 ) ) ( not ( = ?auto_2236243 ?auto_2236249 ) ) ( not ( = ?auto_2236243 ?auto_2236250 ) ) ( not ( = ?auto_2236243 ?auto_2236252 ) ) ( not ( = ?auto_2236244 ?auto_2236245 ) ) ( not ( = ?auto_2236244 ?auto_2236246 ) ) ( not ( = ?auto_2236244 ?auto_2236247 ) ) ( not ( = ?auto_2236244 ?auto_2236248 ) ) ( not ( = ?auto_2236244 ?auto_2236249 ) ) ( not ( = ?auto_2236244 ?auto_2236250 ) ) ( not ( = ?auto_2236244 ?auto_2236252 ) ) ( not ( = ?auto_2236245 ?auto_2236246 ) ) ( not ( = ?auto_2236245 ?auto_2236247 ) ) ( not ( = ?auto_2236245 ?auto_2236248 ) ) ( not ( = ?auto_2236245 ?auto_2236249 ) ) ( not ( = ?auto_2236245 ?auto_2236250 ) ) ( not ( = ?auto_2236245 ?auto_2236252 ) ) ( not ( = ?auto_2236246 ?auto_2236247 ) ) ( not ( = ?auto_2236246 ?auto_2236248 ) ) ( not ( = ?auto_2236246 ?auto_2236249 ) ) ( not ( = ?auto_2236246 ?auto_2236250 ) ) ( not ( = ?auto_2236246 ?auto_2236252 ) ) ( not ( = ?auto_2236247 ?auto_2236248 ) ) ( not ( = ?auto_2236247 ?auto_2236249 ) ) ( not ( = ?auto_2236247 ?auto_2236250 ) ) ( not ( = ?auto_2236247 ?auto_2236252 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_2236248 ?auto_2236249 ?auto_2236250 )
      ( MAKE-16CRATE-VERIFY ?auto_2236234 ?auto_2236235 ?auto_2236236 ?auto_2236237 ?auto_2236238 ?auto_2236239 ?auto_2236240 ?auto_2236241 ?auto_2236242 ?auto_2236243 ?auto_2236244 ?auto_2236245 ?auto_2236246 ?auto_2236247 ?auto_2236248 ?auto_2236249 ?auto_2236250 ) )
  )

)

