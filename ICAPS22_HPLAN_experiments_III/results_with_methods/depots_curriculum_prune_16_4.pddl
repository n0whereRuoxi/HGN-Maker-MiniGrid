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
      ?auto_27050 - SURFACE
      ?auto_27051 - SURFACE
    )
    :vars
    (
      ?auto_27052 - HOIST
      ?auto_27053 - PLACE
      ?auto_27055 - PLACE
      ?auto_27056 - HOIST
      ?auto_27057 - SURFACE
      ?auto_27054 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27052 ?auto_27053 ) ( SURFACE-AT ?auto_27050 ?auto_27053 ) ( CLEAR ?auto_27050 ) ( IS-CRATE ?auto_27051 ) ( AVAILABLE ?auto_27052 ) ( not ( = ?auto_27055 ?auto_27053 ) ) ( HOIST-AT ?auto_27056 ?auto_27055 ) ( AVAILABLE ?auto_27056 ) ( SURFACE-AT ?auto_27051 ?auto_27055 ) ( ON ?auto_27051 ?auto_27057 ) ( CLEAR ?auto_27051 ) ( TRUCK-AT ?auto_27054 ?auto_27053 ) ( not ( = ?auto_27050 ?auto_27051 ) ) ( not ( = ?auto_27050 ?auto_27057 ) ) ( not ( = ?auto_27051 ?auto_27057 ) ) ( not ( = ?auto_27052 ?auto_27056 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27054 ?auto_27053 ?auto_27055 )
      ( !LIFT ?auto_27056 ?auto_27051 ?auto_27057 ?auto_27055 )
      ( !LOAD ?auto_27056 ?auto_27051 ?auto_27054 ?auto_27055 )
      ( !DRIVE ?auto_27054 ?auto_27055 ?auto_27053 )
      ( !UNLOAD ?auto_27052 ?auto_27051 ?auto_27054 ?auto_27053 )
      ( !DROP ?auto_27052 ?auto_27051 ?auto_27050 ?auto_27053 )
      ( MAKE-1CRATE-VERIFY ?auto_27050 ?auto_27051 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_27071 - SURFACE
      ?auto_27072 - SURFACE
      ?auto_27073 - SURFACE
    )
    :vars
    (
      ?auto_27075 - HOIST
      ?auto_27076 - PLACE
      ?auto_27079 - PLACE
      ?auto_27078 - HOIST
      ?auto_27077 - SURFACE
      ?auto_27082 - PLACE
      ?auto_27081 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27074 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27075 ?auto_27076 ) ( IS-CRATE ?auto_27073 ) ( not ( = ?auto_27079 ?auto_27076 ) ) ( HOIST-AT ?auto_27078 ?auto_27079 ) ( AVAILABLE ?auto_27078 ) ( SURFACE-AT ?auto_27073 ?auto_27079 ) ( ON ?auto_27073 ?auto_27077 ) ( CLEAR ?auto_27073 ) ( not ( = ?auto_27072 ?auto_27073 ) ) ( not ( = ?auto_27072 ?auto_27077 ) ) ( not ( = ?auto_27073 ?auto_27077 ) ) ( not ( = ?auto_27075 ?auto_27078 ) ) ( SURFACE-AT ?auto_27071 ?auto_27076 ) ( CLEAR ?auto_27071 ) ( IS-CRATE ?auto_27072 ) ( AVAILABLE ?auto_27075 ) ( not ( = ?auto_27082 ?auto_27076 ) ) ( HOIST-AT ?auto_27081 ?auto_27082 ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27072 ?auto_27082 ) ( ON ?auto_27072 ?auto_27080 ) ( CLEAR ?auto_27072 ) ( TRUCK-AT ?auto_27074 ?auto_27076 ) ( not ( = ?auto_27071 ?auto_27072 ) ) ( not ( = ?auto_27071 ?auto_27080 ) ) ( not ( = ?auto_27072 ?auto_27080 ) ) ( not ( = ?auto_27075 ?auto_27081 ) ) ( not ( = ?auto_27071 ?auto_27073 ) ) ( not ( = ?auto_27071 ?auto_27077 ) ) ( not ( = ?auto_27073 ?auto_27080 ) ) ( not ( = ?auto_27079 ?auto_27082 ) ) ( not ( = ?auto_27078 ?auto_27081 ) ) ( not ( = ?auto_27077 ?auto_27080 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27071 ?auto_27072 )
      ( MAKE-1CRATE ?auto_27072 ?auto_27073 )
      ( MAKE-2CRATE-VERIFY ?auto_27071 ?auto_27072 ?auto_27073 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_27097 - SURFACE
      ?auto_27098 - SURFACE
      ?auto_27099 - SURFACE
      ?auto_27100 - SURFACE
    )
    :vars
    (
      ?auto_27105 - HOIST
      ?auto_27103 - PLACE
      ?auto_27102 - PLACE
      ?auto_27104 - HOIST
      ?auto_27106 - SURFACE
      ?auto_27109 - PLACE
      ?auto_27110 - HOIST
      ?auto_27107 - SURFACE
      ?auto_27111 - PLACE
      ?auto_27108 - HOIST
      ?auto_27112 - SURFACE
      ?auto_27101 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27105 ?auto_27103 ) ( IS-CRATE ?auto_27100 ) ( not ( = ?auto_27102 ?auto_27103 ) ) ( HOIST-AT ?auto_27104 ?auto_27102 ) ( AVAILABLE ?auto_27104 ) ( SURFACE-AT ?auto_27100 ?auto_27102 ) ( ON ?auto_27100 ?auto_27106 ) ( CLEAR ?auto_27100 ) ( not ( = ?auto_27099 ?auto_27100 ) ) ( not ( = ?auto_27099 ?auto_27106 ) ) ( not ( = ?auto_27100 ?auto_27106 ) ) ( not ( = ?auto_27105 ?auto_27104 ) ) ( IS-CRATE ?auto_27099 ) ( not ( = ?auto_27109 ?auto_27103 ) ) ( HOIST-AT ?auto_27110 ?auto_27109 ) ( AVAILABLE ?auto_27110 ) ( SURFACE-AT ?auto_27099 ?auto_27109 ) ( ON ?auto_27099 ?auto_27107 ) ( CLEAR ?auto_27099 ) ( not ( = ?auto_27098 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27107 ) ) ( not ( = ?auto_27099 ?auto_27107 ) ) ( not ( = ?auto_27105 ?auto_27110 ) ) ( SURFACE-AT ?auto_27097 ?auto_27103 ) ( CLEAR ?auto_27097 ) ( IS-CRATE ?auto_27098 ) ( AVAILABLE ?auto_27105 ) ( not ( = ?auto_27111 ?auto_27103 ) ) ( HOIST-AT ?auto_27108 ?auto_27111 ) ( AVAILABLE ?auto_27108 ) ( SURFACE-AT ?auto_27098 ?auto_27111 ) ( ON ?auto_27098 ?auto_27112 ) ( CLEAR ?auto_27098 ) ( TRUCK-AT ?auto_27101 ?auto_27103 ) ( not ( = ?auto_27097 ?auto_27098 ) ) ( not ( = ?auto_27097 ?auto_27112 ) ) ( not ( = ?auto_27098 ?auto_27112 ) ) ( not ( = ?auto_27105 ?auto_27108 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27107 ) ) ( not ( = ?auto_27099 ?auto_27112 ) ) ( not ( = ?auto_27109 ?auto_27111 ) ) ( not ( = ?auto_27110 ?auto_27108 ) ) ( not ( = ?auto_27107 ?auto_27112 ) ) ( not ( = ?auto_27097 ?auto_27100 ) ) ( not ( = ?auto_27097 ?auto_27106 ) ) ( not ( = ?auto_27098 ?auto_27100 ) ) ( not ( = ?auto_27098 ?auto_27106 ) ) ( not ( = ?auto_27100 ?auto_27107 ) ) ( not ( = ?auto_27100 ?auto_27112 ) ) ( not ( = ?auto_27102 ?auto_27109 ) ) ( not ( = ?auto_27102 ?auto_27111 ) ) ( not ( = ?auto_27104 ?auto_27110 ) ) ( not ( = ?auto_27104 ?auto_27108 ) ) ( not ( = ?auto_27106 ?auto_27107 ) ) ( not ( = ?auto_27106 ?auto_27112 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27097 ?auto_27098 ?auto_27099 )
      ( MAKE-1CRATE ?auto_27099 ?auto_27100 )
      ( MAKE-3CRATE-VERIFY ?auto_27097 ?auto_27098 ?auto_27099 ?auto_27100 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_27128 - SURFACE
      ?auto_27129 - SURFACE
      ?auto_27130 - SURFACE
      ?auto_27131 - SURFACE
      ?auto_27132 - SURFACE
    )
    :vars
    (
      ?auto_27138 - HOIST
      ?auto_27134 - PLACE
      ?auto_27135 - PLACE
      ?auto_27136 - HOIST
      ?auto_27137 - SURFACE
      ?auto_27139 - PLACE
      ?auto_27146 - HOIST
      ?auto_27147 - SURFACE
      ?auto_27144 - PLACE
      ?auto_27140 - HOIST
      ?auto_27141 - SURFACE
      ?auto_27143 - PLACE
      ?auto_27145 - HOIST
      ?auto_27142 - SURFACE
      ?auto_27133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27138 ?auto_27134 ) ( IS-CRATE ?auto_27132 ) ( not ( = ?auto_27135 ?auto_27134 ) ) ( HOIST-AT ?auto_27136 ?auto_27135 ) ( AVAILABLE ?auto_27136 ) ( SURFACE-AT ?auto_27132 ?auto_27135 ) ( ON ?auto_27132 ?auto_27137 ) ( CLEAR ?auto_27132 ) ( not ( = ?auto_27131 ?auto_27132 ) ) ( not ( = ?auto_27131 ?auto_27137 ) ) ( not ( = ?auto_27132 ?auto_27137 ) ) ( not ( = ?auto_27138 ?auto_27136 ) ) ( IS-CRATE ?auto_27131 ) ( not ( = ?auto_27139 ?auto_27134 ) ) ( HOIST-AT ?auto_27146 ?auto_27139 ) ( AVAILABLE ?auto_27146 ) ( SURFACE-AT ?auto_27131 ?auto_27139 ) ( ON ?auto_27131 ?auto_27147 ) ( CLEAR ?auto_27131 ) ( not ( = ?auto_27130 ?auto_27131 ) ) ( not ( = ?auto_27130 ?auto_27147 ) ) ( not ( = ?auto_27131 ?auto_27147 ) ) ( not ( = ?auto_27138 ?auto_27146 ) ) ( IS-CRATE ?auto_27130 ) ( not ( = ?auto_27144 ?auto_27134 ) ) ( HOIST-AT ?auto_27140 ?auto_27144 ) ( AVAILABLE ?auto_27140 ) ( SURFACE-AT ?auto_27130 ?auto_27144 ) ( ON ?auto_27130 ?auto_27141 ) ( CLEAR ?auto_27130 ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27141 ) ) ( not ( = ?auto_27130 ?auto_27141 ) ) ( not ( = ?auto_27138 ?auto_27140 ) ) ( SURFACE-AT ?auto_27128 ?auto_27134 ) ( CLEAR ?auto_27128 ) ( IS-CRATE ?auto_27129 ) ( AVAILABLE ?auto_27138 ) ( not ( = ?auto_27143 ?auto_27134 ) ) ( HOIST-AT ?auto_27145 ?auto_27143 ) ( AVAILABLE ?auto_27145 ) ( SURFACE-AT ?auto_27129 ?auto_27143 ) ( ON ?auto_27129 ?auto_27142 ) ( CLEAR ?auto_27129 ) ( TRUCK-AT ?auto_27133 ?auto_27134 ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27128 ?auto_27142 ) ) ( not ( = ?auto_27129 ?auto_27142 ) ) ( not ( = ?auto_27138 ?auto_27145 ) ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27128 ?auto_27141 ) ) ( not ( = ?auto_27130 ?auto_27142 ) ) ( not ( = ?auto_27144 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27145 ) ) ( not ( = ?auto_27141 ?auto_27142 ) ) ( not ( = ?auto_27128 ?auto_27131 ) ) ( not ( = ?auto_27128 ?auto_27147 ) ) ( not ( = ?auto_27129 ?auto_27131 ) ) ( not ( = ?auto_27129 ?auto_27147 ) ) ( not ( = ?auto_27131 ?auto_27141 ) ) ( not ( = ?auto_27131 ?auto_27142 ) ) ( not ( = ?auto_27139 ?auto_27144 ) ) ( not ( = ?auto_27139 ?auto_27143 ) ) ( not ( = ?auto_27146 ?auto_27140 ) ) ( not ( = ?auto_27146 ?auto_27145 ) ) ( not ( = ?auto_27147 ?auto_27141 ) ) ( not ( = ?auto_27147 ?auto_27142 ) ) ( not ( = ?auto_27128 ?auto_27132 ) ) ( not ( = ?auto_27128 ?auto_27137 ) ) ( not ( = ?auto_27129 ?auto_27132 ) ) ( not ( = ?auto_27129 ?auto_27137 ) ) ( not ( = ?auto_27130 ?auto_27132 ) ) ( not ( = ?auto_27130 ?auto_27137 ) ) ( not ( = ?auto_27132 ?auto_27147 ) ) ( not ( = ?auto_27132 ?auto_27141 ) ) ( not ( = ?auto_27132 ?auto_27142 ) ) ( not ( = ?auto_27135 ?auto_27139 ) ) ( not ( = ?auto_27135 ?auto_27144 ) ) ( not ( = ?auto_27135 ?auto_27143 ) ) ( not ( = ?auto_27136 ?auto_27146 ) ) ( not ( = ?auto_27136 ?auto_27140 ) ) ( not ( = ?auto_27136 ?auto_27145 ) ) ( not ( = ?auto_27137 ?auto_27147 ) ) ( not ( = ?auto_27137 ?auto_27141 ) ) ( not ( = ?auto_27137 ?auto_27142 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27128 ?auto_27129 ?auto_27130 ?auto_27131 )
      ( MAKE-1CRATE ?auto_27131 ?auto_27132 )
      ( MAKE-4CRATE-VERIFY ?auto_27128 ?auto_27129 ?auto_27130 ?auto_27131 ?auto_27132 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_27164 - SURFACE
      ?auto_27165 - SURFACE
      ?auto_27166 - SURFACE
      ?auto_27167 - SURFACE
      ?auto_27168 - SURFACE
      ?auto_27169 - SURFACE
    )
    :vars
    (
      ?auto_27172 - HOIST
      ?auto_27173 - PLACE
      ?auto_27174 - PLACE
      ?auto_27175 - HOIST
      ?auto_27171 - SURFACE
      ?auto_27177 - SURFACE
      ?auto_27176 - PLACE
      ?auto_27185 - HOIST
      ?auto_27181 - SURFACE
      ?auto_27180 - PLACE
      ?auto_27183 - HOIST
      ?auto_27182 - SURFACE
      ?auto_27179 - PLACE
      ?auto_27178 - HOIST
      ?auto_27184 - SURFACE
      ?auto_27170 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27172 ?auto_27173 ) ( IS-CRATE ?auto_27169 ) ( not ( = ?auto_27174 ?auto_27173 ) ) ( HOIST-AT ?auto_27175 ?auto_27174 ) ( SURFACE-AT ?auto_27169 ?auto_27174 ) ( ON ?auto_27169 ?auto_27171 ) ( CLEAR ?auto_27169 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27172 ?auto_27175 ) ) ( IS-CRATE ?auto_27168 ) ( AVAILABLE ?auto_27175 ) ( SURFACE-AT ?auto_27168 ?auto_27174 ) ( ON ?auto_27168 ?auto_27177 ) ( CLEAR ?auto_27168 ) ( not ( = ?auto_27167 ?auto_27168 ) ) ( not ( = ?auto_27167 ?auto_27177 ) ) ( not ( = ?auto_27168 ?auto_27177 ) ) ( IS-CRATE ?auto_27167 ) ( not ( = ?auto_27176 ?auto_27173 ) ) ( HOIST-AT ?auto_27185 ?auto_27176 ) ( AVAILABLE ?auto_27185 ) ( SURFACE-AT ?auto_27167 ?auto_27176 ) ( ON ?auto_27167 ?auto_27181 ) ( CLEAR ?auto_27167 ) ( not ( = ?auto_27166 ?auto_27167 ) ) ( not ( = ?auto_27166 ?auto_27181 ) ) ( not ( = ?auto_27167 ?auto_27181 ) ) ( not ( = ?auto_27172 ?auto_27185 ) ) ( IS-CRATE ?auto_27166 ) ( not ( = ?auto_27180 ?auto_27173 ) ) ( HOIST-AT ?auto_27183 ?auto_27180 ) ( AVAILABLE ?auto_27183 ) ( SURFACE-AT ?auto_27166 ?auto_27180 ) ( ON ?auto_27166 ?auto_27182 ) ( CLEAR ?auto_27166 ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( not ( = ?auto_27165 ?auto_27182 ) ) ( not ( = ?auto_27166 ?auto_27182 ) ) ( not ( = ?auto_27172 ?auto_27183 ) ) ( SURFACE-AT ?auto_27164 ?auto_27173 ) ( CLEAR ?auto_27164 ) ( IS-CRATE ?auto_27165 ) ( AVAILABLE ?auto_27172 ) ( not ( = ?auto_27179 ?auto_27173 ) ) ( HOIST-AT ?auto_27178 ?auto_27179 ) ( AVAILABLE ?auto_27178 ) ( SURFACE-AT ?auto_27165 ?auto_27179 ) ( ON ?auto_27165 ?auto_27184 ) ( CLEAR ?auto_27165 ) ( TRUCK-AT ?auto_27170 ?auto_27173 ) ( not ( = ?auto_27164 ?auto_27165 ) ) ( not ( = ?auto_27164 ?auto_27184 ) ) ( not ( = ?auto_27165 ?auto_27184 ) ) ( not ( = ?auto_27172 ?auto_27178 ) ) ( not ( = ?auto_27164 ?auto_27166 ) ) ( not ( = ?auto_27164 ?auto_27182 ) ) ( not ( = ?auto_27166 ?auto_27184 ) ) ( not ( = ?auto_27180 ?auto_27179 ) ) ( not ( = ?auto_27183 ?auto_27178 ) ) ( not ( = ?auto_27182 ?auto_27184 ) ) ( not ( = ?auto_27164 ?auto_27167 ) ) ( not ( = ?auto_27164 ?auto_27181 ) ) ( not ( = ?auto_27165 ?auto_27167 ) ) ( not ( = ?auto_27165 ?auto_27181 ) ) ( not ( = ?auto_27167 ?auto_27182 ) ) ( not ( = ?auto_27167 ?auto_27184 ) ) ( not ( = ?auto_27176 ?auto_27180 ) ) ( not ( = ?auto_27176 ?auto_27179 ) ) ( not ( = ?auto_27185 ?auto_27183 ) ) ( not ( = ?auto_27185 ?auto_27178 ) ) ( not ( = ?auto_27181 ?auto_27182 ) ) ( not ( = ?auto_27181 ?auto_27184 ) ) ( not ( = ?auto_27164 ?auto_27168 ) ) ( not ( = ?auto_27164 ?auto_27177 ) ) ( not ( = ?auto_27165 ?auto_27168 ) ) ( not ( = ?auto_27165 ?auto_27177 ) ) ( not ( = ?auto_27166 ?auto_27168 ) ) ( not ( = ?auto_27166 ?auto_27177 ) ) ( not ( = ?auto_27168 ?auto_27181 ) ) ( not ( = ?auto_27168 ?auto_27182 ) ) ( not ( = ?auto_27168 ?auto_27184 ) ) ( not ( = ?auto_27174 ?auto_27176 ) ) ( not ( = ?auto_27174 ?auto_27180 ) ) ( not ( = ?auto_27174 ?auto_27179 ) ) ( not ( = ?auto_27175 ?auto_27185 ) ) ( not ( = ?auto_27175 ?auto_27183 ) ) ( not ( = ?auto_27175 ?auto_27178 ) ) ( not ( = ?auto_27177 ?auto_27181 ) ) ( not ( = ?auto_27177 ?auto_27182 ) ) ( not ( = ?auto_27177 ?auto_27184 ) ) ( not ( = ?auto_27164 ?auto_27169 ) ) ( not ( = ?auto_27164 ?auto_27171 ) ) ( not ( = ?auto_27165 ?auto_27169 ) ) ( not ( = ?auto_27165 ?auto_27171 ) ) ( not ( = ?auto_27166 ?auto_27169 ) ) ( not ( = ?auto_27166 ?auto_27171 ) ) ( not ( = ?auto_27167 ?auto_27169 ) ) ( not ( = ?auto_27167 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27177 ) ) ( not ( = ?auto_27169 ?auto_27181 ) ) ( not ( = ?auto_27169 ?auto_27182 ) ) ( not ( = ?auto_27169 ?auto_27184 ) ) ( not ( = ?auto_27171 ?auto_27177 ) ) ( not ( = ?auto_27171 ?auto_27181 ) ) ( not ( = ?auto_27171 ?auto_27182 ) ) ( not ( = ?auto_27171 ?auto_27184 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27164 ?auto_27165 ?auto_27166 ?auto_27167 ?auto_27168 )
      ( MAKE-1CRATE ?auto_27168 ?auto_27169 )
      ( MAKE-5CRATE-VERIFY ?auto_27164 ?auto_27165 ?auto_27166 ?auto_27167 ?auto_27168 ?auto_27169 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_27203 - SURFACE
      ?auto_27204 - SURFACE
      ?auto_27205 - SURFACE
      ?auto_27206 - SURFACE
      ?auto_27207 - SURFACE
      ?auto_27208 - SURFACE
      ?auto_27209 - SURFACE
    )
    :vars
    (
      ?auto_27210 - HOIST
      ?auto_27211 - PLACE
      ?auto_27215 - PLACE
      ?auto_27214 - HOIST
      ?auto_27212 - SURFACE
      ?auto_27223 - PLACE
      ?auto_27227 - HOIST
      ?auto_27226 - SURFACE
      ?auto_27221 - SURFACE
      ?auto_27216 - PLACE
      ?auto_27222 - HOIST
      ?auto_27219 - SURFACE
      ?auto_27220 - PLACE
      ?auto_27217 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27224 - PLACE
      ?auto_27225 - HOIST
      ?auto_27228 - SURFACE
      ?auto_27213 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27210 ?auto_27211 ) ( IS-CRATE ?auto_27209 ) ( not ( = ?auto_27215 ?auto_27211 ) ) ( HOIST-AT ?auto_27214 ?auto_27215 ) ( AVAILABLE ?auto_27214 ) ( SURFACE-AT ?auto_27209 ?auto_27215 ) ( ON ?auto_27209 ?auto_27212 ) ( CLEAR ?auto_27209 ) ( not ( = ?auto_27208 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27212 ) ) ( not ( = ?auto_27210 ?auto_27214 ) ) ( IS-CRATE ?auto_27208 ) ( not ( = ?auto_27223 ?auto_27211 ) ) ( HOIST-AT ?auto_27227 ?auto_27223 ) ( SURFACE-AT ?auto_27208 ?auto_27223 ) ( ON ?auto_27208 ?auto_27226 ) ( CLEAR ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( not ( = ?auto_27207 ?auto_27226 ) ) ( not ( = ?auto_27208 ?auto_27226 ) ) ( not ( = ?auto_27210 ?auto_27227 ) ) ( IS-CRATE ?auto_27207 ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27207 ?auto_27223 ) ( ON ?auto_27207 ?auto_27221 ) ( CLEAR ?auto_27207 ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27221 ) ) ( not ( = ?auto_27207 ?auto_27221 ) ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27216 ?auto_27211 ) ) ( HOIST-AT ?auto_27222 ?auto_27216 ) ( AVAILABLE ?auto_27222 ) ( SURFACE-AT ?auto_27206 ?auto_27216 ) ( ON ?auto_27206 ?auto_27219 ) ( CLEAR ?auto_27206 ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27205 ?auto_27219 ) ) ( not ( = ?auto_27206 ?auto_27219 ) ) ( not ( = ?auto_27210 ?auto_27222 ) ) ( IS-CRATE ?auto_27205 ) ( not ( = ?auto_27220 ?auto_27211 ) ) ( HOIST-AT ?auto_27217 ?auto_27220 ) ( AVAILABLE ?auto_27217 ) ( SURFACE-AT ?auto_27205 ?auto_27220 ) ( ON ?auto_27205 ?auto_27218 ) ( CLEAR ?auto_27205 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27218 ) ) ( not ( = ?auto_27205 ?auto_27218 ) ) ( not ( = ?auto_27210 ?auto_27217 ) ) ( SURFACE-AT ?auto_27203 ?auto_27211 ) ( CLEAR ?auto_27203 ) ( IS-CRATE ?auto_27204 ) ( AVAILABLE ?auto_27210 ) ( not ( = ?auto_27224 ?auto_27211 ) ) ( HOIST-AT ?auto_27225 ?auto_27224 ) ( AVAILABLE ?auto_27225 ) ( SURFACE-AT ?auto_27204 ?auto_27224 ) ( ON ?auto_27204 ?auto_27228 ) ( CLEAR ?auto_27204 ) ( TRUCK-AT ?auto_27213 ?auto_27211 ) ( not ( = ?auto_27203 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27228 ) ) ( not ( = ?auto_27204 ?auto_27228 ) ) ( not ( = ?auto_27210 ?auto_27225 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27203 ?auto_27218 ) ) ( not ( = ?auto_27205 ?auto_27228 ) ) ( not ( = ?auto_27220 ?auto_27224 ) ) ( not ( = ?auto_27217 ?auto_27225 ) ) ( not ( = ?auto_27218 ?auto_27228 ) ) ( not ( = ?auto_27203 ?auto_27206 ) ) ( not ( = ?auto_27203 ?auto_27219 ) ) ( not ( = ?auto_27204 ?auto_27206 ) ) ( not ( = ?auto_27204 ?auto_27219 ) ) ( not ( = ?auto_27206 ?auto_27218 ) ) ( not ( = ?auto_27206 ?auto_27228 ) ) ( not ( = ?auto_27216 ?auto_27220 ) ) ( not ( = ?auto_27216 ?auto_27224 ) ) ( not ( = ?auto_27222 ?auto_27217 ) ) ( not ( = ?auto_27222 ?auto_27225 ) ) ( not ( = ?auto_27219 ?auto_27218 ) ) ( not ( = ?auto_27219 ?auto_27228 ) ) ( not ( = ?auto_27203 ?auto_27207 ) ) ( not ( = ?auto_27203 ?auto_27221 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27221 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27221 ) ) ( not ( = ?auto_27207 ?auto_27219 ) ) ( not ( = ?auto_27207 ?auto_27218 ) ) ( not ( = ?auto_27207 ?auto_27228 ) ) ( not ( = ?auto_27223 ?auto_27216 ) ) ( not ( = ?auto_27223 ?auto_27220 ) ) ( not ( = ?auto_27223 ?auto_27224 ) ) ( not ( = ?auto_27227 ?auto_27222 ) ) ( not ( = ?auto_27227 ?auto_27217 ) ) ( not ( = ?auto_27227 ?auto_27225 ) ) ( not ( = ?auto_27221 ?auto_27219 ) ) ( not ( = ?auto_27221 ?auto_27218 ) ) ( not ( = ?auto_27221 ?auto_27228 ) ) ( not ( = ?auto_27203 ?auto_27208 ) ) ( not ( = ?auto_27203 ?auto_27226 ) ) ( not ( = ?auto_27204 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27226 ) ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27205 ?auto_27226 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27226 ) ) ( not ( = ?auto_27208 ?auto_27221 ) ) ( not ( = ?auto_27208 ?auto_27219 ) ) ( not ( = ?auto_27208 ?auto_27218 ) ) ( not ( = ?auto_27208 ?auto_27228 ) ) ( not ( = ?auto_27226 ?auto_27221 ) ) ( not ( = ?auto_27226 ?auto_27219 ) ) ( not ( = ?auto_27226 ?auto_27218 ) ) ( not ( = ?auto_27226 ?auto_27228 ) ) ( not ( = ?auto_27203 ?auto_27209 ) ) ( not ( = ?auto_27203 ?auto_27212 ) ) ( not ( = ?auto_27204 ?auto_27209 ) ) ( not ( = ?auto_27204 ?auto_27212 ) ) ( not ( = ?auto_27205 ?auto_27209 ) ) ( not ( = ?auto_27205 ?auto_27212 ) ) ( not ( = ?auto_27206 ?auto_27209 ) ) ( not ( = ?auto_27206 ?auto_27212 ) ) ( not ( = ?auto_27207 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27212 ) ) ( not ( = ?auto_27209 ?auto_27226 ) ) ( not ( = ?auto_27209 ?auto_27221 ) ) ( not ( = ?auto_27209 ?auto_27219 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27209 ?auto_27228 ) ) ( not ( = ?auto_27215 ?auto_27223 ) ) ( not ( = ?auto_27215 ?auto_27216 ) ) ( not ( = ?auto_27215 ?auto_27220 ) ) ( not ( = ?auto_27215 ?auto_27224 ) ) ( not ( = ?auto_27214 ?auto_27227 ) ) ( not ( = ?auto_27214 ?auto_27222 ) ) ( not ( = ?auto_27214 ?auto_27217 ) ) ( not ( = ?auto_27214 ?auto_27225 ) ) ( not ( = ?auto_27212 ?auto_27226 ) ) ( not ( = ?auto_27212 ?auto_27221 ) ) ( not ( = ?auto_27212 ?auto_27219 ) ) ( not ( = ?auto_27212 ?auto_27218 ) ) ( not ( = ?auto_27212 ?auto_27228 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 )
      ( MAKE-1CRATE ?auto_27208 ?auto_27209 )
      ( MAKE-6CRATE-VERIFY ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 ?auto_27209 ) )
  )

  ( :method MAKE-7CRATE
    :parameters
    (
      ?auto_27247 - SURFACE
      ?auto_27248 - SURFACE
      ?auto_27249 - SURFACE
      ?auto_27250 - SURFACE
      ?auto_27251 - SURFACE
      ?auto_27252 - SURFACE
      ?auto_27253 - SURFACE
      ?auto_27254 - SURFACE
    )
    :vars
    (
      ?auto_27260 - HOIST
      ?auto_27255 - PLACE
      ?auto_27256 - PLACE
      ?auto_27258 - HOIST
      ?auto_27257 - SURFACE
      ?auto_27275 - PLACE
      ?auto_27276 - HOIST
      ?auto_27262 - SURFACE
      ?auto_27267 - PLACE
      ?auto_27265 - HOIST
      ?auto_27263 - SURFACE
      ?auto_27261 - SURFACE
      ?auto_27271 - PLACE
      ?auto_27268 - HOIST
      ?auto_27272 - SURFACE
      ?auto_27270 - PLACE
      ?auto_27273 - HOIST
      ?auto_27274 - SURFACE
      ?auto_27269 - PLACE
      ?auto_27264 - HOIST
      ?auto_27266 - SURFACE
      ?auto_27259 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27260 ?auto_27255 ) ( IS-CRATE ?auto_27254 ) ( not ( = ?auto_27256 ?auto_27255 ) ) ( HOIST-AT ?auto_27258 ?auto_27256 ) ( AVAILABLE ?auto_27258 ) ( SURFACE-AT ?auto_27254 ?auto_27256 ) ( ON ?auto_27254 ?auto_27257 ) ( CLEAR ?auto_27254 ) ( not ( = ?auto_27253 ?auto_27254 ) ) ( not ( = ?auto_27253 ?auto_27257 ) ) ( not ( = ?auto_27254 ?auto_27257 ) ) ( not ( = ?auto_27260 ?auto_27258 ) ) ( IS-CRATE ?auto_27253 ) ( not ( = ?auto_27275 ?auto_27255 ) ) ( HOIST-AT ?auto_27276 ?auto_27275 ) ( AVAILABLE ?auto_27276 ) ( SURFACE-AT ?auto_27253 ?auto_27275 ) ( ON ?auto_27253 ?auto_27262 ) ( CLEAR ?auto_27253 ) ( not ( = ?auto_27252 ?auto_27253 ) ) ( not ( = ?auto_27252 ?auto_27262 ) ) ( not ( = ?auto_27253 ?auto_27262 ) ) ( not ( = ?auto_27260 ?auto_27276 ) ) ( IS-CRATE ?auto_27252 ) ( not ( = ?auto_27267 ?auto_27255 ) ) ( HOIST-AT ?auto_27265 ?auto_27267 ) ( SURFACE-AT ?auto_27252 ?auto_27267 ) ( ON ?auto_27252 ?auto_27263 ) ( CLEAR ?auto_27252 ) ( not ( = ?auto_27251 ?auto_27252 ) ) ( not ( = ?auto_27251 ?auto_27263 ) ) ( not ( = ?auto_27252 ?auto_27263 ) ) ( not ( = ?auto_27260 ?auto_27265 ) ) ( IS-CRATE ?auto_27251 ) ( AVAILABLE ?auto_27265 ) ( SURFACE-AT ?auto_27251 ?auto_27267 ) ( ON ?auto_27251 ?auto_27261 ) ( CLEAR ?auto_27251 ) ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27261 ) ) ( not ( = ?auto_27251 ?auto_27261 ) ) ( IS-CRATE ?auto_27250 ) ( not ( = ?auto_27271 ?auto_27255 ) ) ( HOIST-AT ?auto_27268 ?auto_27271 ) ( AVAILABLE ?auto_27268 ) ( SURFACE-AT ?auto_27250 ?auto_27271 ) ( ON ?auto_27250 ?auto_27272 ) ( CLEAR ?auto_27250 ) ( not ( = ?auto_27249 ?auto_27250 ) ) ( not ( = ?auto_27249 ?auto_27272 ) ) ( not ( = ?auto_27250 ?auto_27272 ) ) ( not ( = ?auto_27260 ?auto_27268 ) ) ( IS-CRATE ?auto_27249 ) ( not ( = ?auto_27270 ?auto_27255 ) ) ( HOIST-AT ?auto_27273 ?auto_27270 ) ( AVAILABLE ?auto_27273 ) ( SURFACE-AT ?auto_27249 ?auto_27270 ) ( ON ?auto_27249 ?auto_27274 ) ( CLEAR ?auto_27249 ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27274 ) ) ( not ( = ?auto_27249 ?auto_27274 ) ) ( not ( = ?auto_27260 ?auto_27273 ) ) ( SURFACE-AT ?auto_27247 ?auto_27255 ) ( CLEAR ?auto_27247 ) ( IS-CRATE ?auto_27248 ) ( AVAILABLE ?auto_27260 ) ( not ( = ?auto_27269 ?auto_27255 ) ) ( HOIST-AT ?auto_27264 ?auto_27269 ) ( AVAILABLE ?auto_27264 ) ( SURFACE-AT ?auto_27248 ?auto_27269 ) ( ON ?auto_27248 ?auto_27266 ) ( CLEAR ?auto_27248 ) ( TRUCK-AT ?auto_27259 ?auto_27255 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27266 ) ) ( not ( = ?auto_27248 ?auto_27266 ) ) ( not ( = ?auto_27260 ?auto_27264 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27247 ?auto_27274 ) ) ( not ( = ?auto_27249 ?auto_27266 ) ) ( not ( = ?auto_27270 ?auto_27269 ) ) ( not ( = ?auto_27273 ?auto_27264 ) ) ( not ( = ?auto_27274 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27250 ) ) ( not ( = ?auto_27247 ?auto_27272 ) ) ( not ( = ?auto_27248 ?auto_27250 ) ) ( not ( = ?auto_27248 ?auto_27272 ) ) ( not ( = ?auto_27250 ?auto_27274 ) ) ( not ( = ?auto_27250 ?auto_27266 ) ) ( not ( = ?auto_27271 ?auto_27270 ) ) ( not ( = ?auto_27271 ?auto_27269 ) ) ( not ( = ?auto_27268 ?auto_27273 ) ) ( not ( = ?auto_27268 ?auto_27264 ) ) ( not ( = ?auto_27272 ?auto_27274 ) ) ( not ( = ?auto_27272 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27247 ?auto_27261 ) ) ( not ( = ?auto_27248 ?auto_27251 ) ) ( not ( = ?auto_27248 ?auto_27261 ) ) ( not ( = ?auto_27249 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27261 ) ) ( not ( = ?auto_27251 ?auto_27272 ) ) ( not ( = ?auto_27251 ?auto_27274 ) ) ( not ( = ?auto_27251 ?auto_27266 ) ) ( not ( = ?auto_27267 ?auto_27271 ) ) ( not ( = ?auto_27267 ?auto_27270 ) ) ( not ( = ?auto_27267 ?auto_27269 ) ) ( not ( = ?auto_27265 ?auto_27268 ) ) ( not ( = ?auto_27265 ?auto_27273 ) ) ( not ( = ?auto_27265 ?auto_27264 ) ) ( not ( = ?auto_27261 ?auto_27272 ) ) ( not ( = ?auto_27261 ?auto_27274 ) ) ( not ( = ?auto_27261 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27252 ) ) ( not ( = ?auto_27247 ?auto_27263 ) ) ( not ( = ?auto_27248 ?auto_27252 ) ) ( not ( = ?auto_27248 ?auto_27263 ) ) ( not ( = ?auto_27249 ?auto_27252 ) ) ( not ( = ?auto_27249 ?auto_27263 ) ) ( not ( = ?auto_27250 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27263 ) ) ( not ( = ?auto_27252 ?auto_27261 ) ) ( not ( = ?auto_27252 ?auto_27272 ) ) ( not ( = ?auto_27252 ?auto_27274 ) ) ( not ( = ?auto_27252 ?auto_27266 ) ) ( not ( = ?auto_27263 ?auto_27261 ) ) ( not ( = ?auto_27263 ?auto_27272 ) ) ( not ( = ?auto_27263 ?auto_27274 ) ) ( not ( = ?auto_27263 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27253 ) ) ( not ( = ?auto_27247 ?auto_27262 ) ) ( not ( = ?auto_27248 ?auto_27253 ) ) ( not ( = ?auto_27248 ?auto_27262 ) ) ( not ( = ?auto_27249 ?auto_27253 ) ) ( not ( = ?auto_27249 ?auto_27262 ) ) ( not ( = ?auto_27250 ?auto_27253 ) ) ( not ( = ?auto_27250 ?auto_27262 ) ) ( not ( = ?auto_27251 ?auto_27253 ) ) ( not ( = ?auto_27251 ?auto_27262 ) ) ( not ( = ?auto_27253 ?auto_27263 ) ) ( not ( = ?auto_27253 ?auto_27261 ) ) ( not ( = ?auto_27253 ?auto_27272 ) ) ( not ( = ?auto_27253 ?auto_27274 ) ) ( not ( = ?auto_27253 ?auto_27266 ) ) ( not ( = ?auto_27275 ?auto_27267 ) ) ( not ( = ?auto_27275 ?auto_27271 ) ) ( not ( = ?auto_27275 ?auto_27270 ) ) ( not ( = ?auto_27275 ?auto_27269 ) ) ( not ( = ?auto_27276 ?auto_27265 ) ) ( not ( = ?auto_27276 ?auto_27268 ) ) ( not ( = ?auto_27276 ?auto_27273 ) ) ( not ( = ?auto_27276 ?auto_27264 ) ) ( not ( = ?auto_27262 ?auto_27263 ) ) ( not ( = ?auto_27262 ?auto_27261 ) ) ( not ( = ?auto_27262 ?auto_27272 ) ) ( not ( = ?auto_27262 ?auto_27274 ) ) ( not ( = ?auto_27262 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27254 ) ) ( not ( = ?auto_27247 ?auto_27257 ) ) ( not ( = ?auto_27248 ?auto_27254 ) ) ( not ( = ?auto_27248 ?auto_27257 ) ) ( not ( = ?auto_27249 ?auto_27254 ) ) ( not ( = ?auto_27249 ?auto_27257 ) ) ( not ( = ?auto_27250 ?auto_27254 ) ) ( not ( = ?auto_27250 ?auto_27257 ) ) ( not ( = ?auto_27251 ?auto_27254 ) ) ( not ( = ?auto_27251 ?auto_27257 ) ) ( not ( = ?auto_27252 ?auto_27254 ) ) ( not ( = ?auto_27252 ?auto_27257 ) ) ( not ( = ?auto_27254 ?auto_27262 ) ) ( not ( = ?auto_27254 ?auto_27263 ) ) ( not ( = ?auto_27254 ?auto_27261 ) ) ( not ( = ?auto_27254 ?auto_27272 ) ) ( not ( = ?auto_27254 ?auto_27274 ) ) ( not ( = ?auto_27254 ?auto_27266 ) ) ( not ( = ?auto_27256 ?auto_27275 ) ) ( not ( = ?auto_27256 ?auto_27267 ) ) ( not ( = ?auto_27256 ?auto_27271 ) ) ( not ( = ?auto_27256 ?auto_27270 ) ) ( not ( = ?auto_27256 ?auto_27269 ) ) ( not ( = ?auto_27258 ?auto_27276 ) ) ( not ( = ?auto_27258 ?auto_27265 ) ) ( not ( = ?auto_27258 ?auto_27268 ) ) ( not ( = ?auto_27258 ?auto_27273 ) ) ( not ( = ?auto_27258 ?auto_27264 ) ) ( not ( = ?auto_27257 ?auto_27262 ) ) ( not ( = ?auto_27257 ?auto_27263 ) ) ( not ( = ?auto_27257 ?auto_27261 ) ) ( not ( = ?auto_27257 ?auto_27272 ) ) ( not ( = ?auto_27257 ?auto_27274 ) ) ( not ( = ?auto_27257 ?auto_27266 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ?auto_27251 ?auto_27252 ?auto_27253 )
      ( MAKE-1CRATE ?auto_27253 ?auto_27254 )
      ( MAKE-7CRATE-VERIFY ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ?auto_27251 ?auto_27252 ?auto_27253 ?auto_27254 ) )
  )

  ( :method MAKE-8CRATE
    :parameters
    (
      ?auto_27296 - SURFACE
      ?auto_27297 - SURFACE
      ?auto_27298 - SURFACE
      ?auto_27299 - SURFACE
      ?auto_27300 - SURFACE
      ?auto_27301 - SURFACE
      ?auto_27302 - SURFACE
      ?auto_27303 - SURFACE
      ?auto_27304 - SURFACE
    )
    :vars
    (
      ?auto_27309 - HOIST
      ?auto_27308 - PLACE
      ?auto_27307 - PLACE
      ?auto_27305 - HOIST
      ?auto_27306 - SURFACE
      ?auto_27312 - PLACE
      ?auto_27313 - HOIST
      ?auto_27315 - SURFACE
      ?auto_27314 - PLACE
      ?auto_27328 - HOIST
      ?auto_27325 - SURFACE
      ?auto_27323 - PLACE
      ?auto_27311 - HOIST
      ?auto_27326 - SURFACE
      ?auto_27327 - SURFACE
      ?auto_27317 - PLACE
      ?auto_27322 - HOIST
      ?auto_27319 - SURFACE
      ?auto_27318 - PLACE
      ?auto_27320 - HOIST
      ?auto_27321 - SURFACE
      ?auto_27316 - PLACE
      ?auto_27329 - HOIST
      ?auto_27324 - SURFACE
      ?auto_27310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27309 ?auto_27308 ) ( IS-CRATE ?auto_27304 ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( HOIST-AT ?auto_27305 ?auto_27307 ) ( AVAILABLE ?auto_27305 ) ( SURFACE-AT ?auto_27304 ?auto_27307 ) ( ON ?auto_27304 ?auto_27306 ) ( CLEAR ?auto_27304 ) ( not ( = ?auto_27303 ?auto_27304 ) ) ( not ( = ?auto_27303 ?auto_27306 ) ) ( not ( = ?auto_27304 ?auto_27306 ) ) ( not ( = ?auto_27309 ?auto_27305 ) ) ( IS-CRATE ?auto_27303 ) ( not ( = ?auto_27312 ?auto_27308 ) ) ( HOIST-AT ?auto_27313 ?auto_27312 ) ( AVAILABLE ?auto_27313 ) ( SURFACE-AT ?auto_27303 ?auto_27312 ) ( ON ?auto_27303 ?auto_27315 ) ( CLEAR ?auto_27303 ) ( not ( = ?auto_27302 ?auto_27303 ) ) ( not ( = ?auto_27302 ?auto_27315 ) ) ( not ( = ?auto_27303 ?auto_27315 ) ) ( not ( = ?auto_27309 ?auto_27313 ) ) ( IS-CRATE ?auto_27302 ) ( not ( = ?auto_27314 ?auto_27308 ) ) ( HOIST-AT ?auto_27328 ?auto_27314 ) ( AVAILABLE ?auto_27328 ) ( SURFACE-AT ?auto_27302 ?auto_27314 ) ( ON ?auto_27302 ?auto_27325 ) ( CLEAR ?auto_27302 ) ( not ( = ?auto_27301 ?auto_27302 ) ) ( not ( = ?auto_27301 ?auto_27325 ) ) ( not ( = ?auto_27302 ?auto_27325 ) ) ( not ( = ?auto_27309 ?auto_27328 ) ) ( IS-CRATE ?auto_27301 ) ( not ( = ?auto_27323 ?auto_27308 ) ) ( HOIST-AT ?auto_27311 ?auto_27323 ) ( SURFACE-AT ?auto_27301 ?auto_27323 ) ( ON ?auto_27301 ?auto_27326 ) ( CLEAR ?auto_27301 ) ( not ( = ?auto_27300 ?auto_27301 ) ) ( not ( = ?auto_27300 ?auto_27326 ) ) ( not ( = ?auto_27301 ?auto_27326 ) ) ( not ( = ?auto_27309 ?auto_27311 ) ) ( IS-CRATE ?auto_27300 ) ( AVAILABLE ?auto_27311 ) ( SURFACE-AT ?auto_27300 ?auto_27323 ) ( ON ?auto_27300 ?auto_27327 ) ( CLEAR ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27300 ) ) ( not ( = ?auto_27299 ?auto_27327 ) ) ( not ( = ?auto_27300 ?auto_27327 ) ) ( IS-CRATE ?auto_27299 ) ( not ( = ?auto_27317 ?auto_27308 ) ) ( HOIST-AT ?auto_27322 ?auto_27317 ) ( AVAILABLE ?auto_27322 ) ( SURFACE-AT ?auto_27299 ?auto_27317 ) ( ON ?auto_27299 ?auto_27319 ) ( CLEAR ?auto_27299 ) ( not ( = ?auto_27298 ?auto_27299 ) ) ( not ( = ?auto_27298 ?auto_27319 ) ) ( not ( = ?auto_27299 ?auto_27319 ) ) ( not ( = ?auto_27309 ?auto_27322 ) ) ( IS-CRATE ?auto_27298 ) ( not ( = ?auto_27318 ?auto_27308 ) ) ( HOIST-AT ?auto_27320 ?auto_27318 ) ( AVAILABLE ?auto_27320 ) ( SURFACE-AT ?auto_27298 ?auto_27318 ) ( ON ?auto_27298 ?auto_27321 ) ( CLEAR ?auto_27298 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27297 ?auto_27321 ) ) ( not ( = ?auto_27298 ?auto_27321 ) ) ( not ( = ?auto_27309 ?auto_27320 ) ) ( SURFACE-AT ?auto_27296 ?auto_27308 ) ( CLEAR ?auto_27296 ) ( IS-CRATE ?auto_27297 ) ( AVAILABLE ?auto_27309 ) ( not ( = ?auto_27316 ?auto_27308 ) ) ( HOIST-AT ?auto_27329 ?auto_27316 ) ( AVAILABLE ?auto_27329 ) ( SURFACE-AT ?auto_27297 ?auto_27316 ) ( ON ?auto_27297 ?auto_27324 ) ( CLEAR ?auto_27297 ) ( TRUCK-AT ?auto_27310 ?auto_27308 ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27324 ) ) ( not ( = ?auto_27297 ?auto_27324 ) ) ( not ( = ?auto_27309 ?auto_27329 ) ) ( not ( = ?auto_27296 ?auto_27298 ) ) ( not ( = ?auto_27296 ?auto_27321 ) ) ( not ( = ?auto_27298 ?auto_27324 ) ) ( not ( = ?auto_27318 ?auto_27316 ) ) ( not ( = ?auto_27320 ?auto_27329 ) ) ( not ( = ?auto_27321 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27299 ) ) ( not ( = ?auto_27296 ?auto_27319 ) ) ( not ( = ?auto_27297 ?auto_27299 ) ) ( not ( = ?auto_27297 ?auto_27319 ) ) ( not ( = ?auto_27299 ?auto_27321 ) ) ( not ( = ?auto_27299 ?auto_27324 ) ) ( not ( = ?auto_27317 ?auto_27318 ) ) ( not ( = ?auto_27317 ?auto_27316 ) ) ( not ( = ?auto_27322 ?auto_27320 ) ) ( not ( = ?auto_27322 ?auto_27329 ) ) ( not ( = ?auto_27319 ?auto_27321 ) ) ( not ( = ?auto_27319 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27300 ) ) ( not ( = ?auto_27296 ?auto_27327 ) ) ( not ( = ?auto_27297 ?auto_27300 ) ) ( not ( = ?auto_27297 ?auto_27327 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27327 ) ) ( not ( = ?auto_27300 ?auto_27319 ) ) ( not ( = ?auto_27300 ?auto_27321 ) ) ( not ( = ?auto_27300 ?auto_27324 ) ) ( not ( = ?auto_27323 ?auto_27317 ) ) ( not ( = ?auto_27323 ?auto_27318 ) ) ( not ( = ?auto_27323 ?auto_27316 ) ) ( not ( = ?auto_27311 ?auto_27322 ) ) ( not ( = ?auto_27311 ?auto_27320 ) ) ( not ( = ?auto_27311 ?auto_27329 ) ) ( not ( = ?auto_27327 ?auto_27319 ) ) ( not ( = ?auto_27327 ?auto_27321 ) ) ( not ( = ?auto_27327 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27301 ) ) ( not ( = ?auto_27296 ?auto_27326 ) ) ( not ( = ?auto_27297 ?auto_27301 ) ) ( not ( = ?auto_27297 ?auto_27326 ) ) ( not ( = ?auto_27298 ?auto_27301 ) ) ( not ( = ?auto_27298 ?auto_27326 ) ) ( not ( = ?auto_27299 ?auto_27301 ) ) ( not ( = ?auto_27299 ?auto_27326 ) ) ( not ( = ?auto_27301 ?auto_27327 ) ) ( not ( = ?auto_27301 ?auto_27319 ) ) ( not ( = ?auto_27301 ?auto_27321 ) ) ( not ( = ?auto_27301 ?auto_27324 ) ) ( not ( = ?auto_27326 ?auto_27327 ) ) ( not ( = ?auto_27326 ?auto_27319 ) ) ( not ( = ?auto_27326 ?auto_27321 ) ) ( not ( = ?auto_27326 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27302 ) ) ( not ( = ?auto_27296 ?auto_27325 ) ) ( not ( = ?auto_27297 ?auto_27302 ) ) ( not ( = ?auto_27297 ?auto_27325 ) ) ( not ( = ?auto_27298 ?auto_27302 ) ) ( not ( = ?auto_27298 ?auto_27325 ) ) ( not ( = ?auto_27299 ?auto_27302 ) ) ( not ( = ?auto_27299 ?auto_27325 ) ) ( not ( = ?auto_27300 ?auto_27302 ) ) ( not ( = ?auto_27300 ?auto_27325 ) ) ( not ( = ?auto_27302 ?auto_27326 ) ) ( not ( = ?auto_27302 ?auto_27327 ) ) ( not ( = ?auto_27302 ?auto_27319 ) ) ( not ( = ?auto_27302 ?auto_27321 ) ) ( not ( = ?auto_27302 ?auto_27324 ) ) ( not ( = ?auto_27314 ?auto_27323 ) ) ( not ( = ?auto_27314 ?auto_27317 ) ) ( not ( = ?auto_27314 ?auto_27318 ) ) ( not ( = ?auto_27314 ?auto_27316 ) ) ( not ( = ?auto_27328 ?auto_27311 ) ) ( not ( = ?auto_27328 ?auto_27322 ) ) ( not ( = ?auto_27328 ?auto_27320 ) ) ( not ( = ?auto_27328 ?auto_27329 ) ) ( not ( = ?auto_27325 ?auto_27326 ) ) ( not ( = ?auto_27325 ?auto_27327 ) ) ( not ( = ?auto_27325 ?auto_27319 ) ) ( not ( = ?auto_27325 ?auto_27321 ) ) ( not ( = ?auto_27325 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27303 ) ) ( not ( = ?auto_27296 ?auto_27315 ) ) ( not ( = ?auto_27297 ?auto_27303 ) ) ( not ( = ?auto_27297 ?auto_27315 ) ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( not ( = ?auto_27298 ?auto_27315 ) ) ( not ( = ?auto_27299 ?auto_27303 ) ) ( not ( = ?auto_27299 ?auto_27315 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27315 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27315 ) ) ( not ( = ?auto_27303 ?auto_27325 ) ) ( not ( = ?auto_27303 ?auto_27326 ) ) ( not ( = ?auto_27303 ?auto_27327 ) ) ( not ( = ?auto_27303 ?auto_27319 ) ) ( not ( = ?auto_27303 ?auto_27321 ) ) ( not ( = ?auto_27303 ?auto_27324 ) ) ( not ( = ?auto_27312 ?auto_27314 ) ) ( not ( = ?auto_27312 ?auto_27323 ) ) ( not ( = ?auto_27312 ?auto_27317 ) ) ( not ( = ?auto_27312 ?auto_27318 ) ) ( not ( = ?auto_27312 ?auto_27316 ) ) ( not ( = ?auto_27313 ?auto_27328 ) ) ( not ( = ?auto_27313 ?auto_27311 ) ) ( not ( = ?auto_27313 ?auto_27322 ) ) ( not ( = ?auto_27313 ?auto_27320 ) ) ( not ( = ?auto_27313 ?auto_27329 ) ) ( not ( = ?auto_27315 ?auto_27325 ) ) ( not ( = ?auto_27315 ?auto_27326 ) ) ( not ( = ?auto_27315 ?auto_27327 ) ) ( not ( = ?auto_27315 ?auto_27319 ) ) ( not ( = ?auto_27315 ?auto_27321 ) ) ( not ( = ?auto_27315 ?auto_27324 ) ) ( not ( = ?auto_27296 ?auto_27304 ) ) ( not ( = ?auto_27296 ?auto_27306 ) ) ( not ( = ?auto_27297 ?auto_27304 ) ) ( not ( = ?auto_27297 ?auto_27306 ) ) ( not ( = ?auto_27298 ?auto_27304 ) ) ( not ( = ?auto_27298 ?auto_27306 ) ) ( not ( = ?auto_27299 ?auto_27304 ) ) ( not ( = ?auto_27299 ?auto_27306 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( not ( = ?auto_27300 ?auto_27306 ) ) ( not ( = ?auto_27301 ?auto_27304 ) ) ( not ( = ?auto_27301 ?auto_27306 ) ) ( not ( = ?auto_27302 ?auto_27304 ) ) ( not ( = ?auto_27302 ?auto_27306 ) ) ( not ( = ?auto_27304 ?auto_27315 ) ) ( not ( = ?auto_27304 ?auto_27325 ) ) ( not ( = ?auto_27304 ?auto_27326 ) ) ( not ( = ?auto_27304 ?auto_27327 ) ) ( not ( = ?auto_27304 ?auto_27319 ) ) ( not ( = ?auto_27304 ?auto_27321 ) ) ( not ( = ?auto_27304 ?auto_27324 ) ) ( not ( = ?auto_27307 ?auto_27312 ) ) ( not ( = ?auto_27307 ?auto_27314 ) ) ( not ( = ?auto_27307 ?auto_27323 ) ) ( not ( = ?auto_27307 ?auto_27317 ) ) ( not ( = ?auto_27307 ?auto_27318 ) ) ( not ( = ?auto_27307 ?auto_27316 ) ) ( not ( = ?auto_27305 ?auto_27313 ) ) ( not ( = ?auto_27305 ?auto_27328 ) ) ( not ( = ?auto_27305 ?auto_27311 ) ) ( not ( = ?auto_27305 ?auto_27322 ) ) ( not ( = ?auto_27305 ?auto_27320 ) ) ( not ( = ?auto_27305 ?auto_27329 ) ) ( not ( = ?auto_27306 ?auto_27315 ) ) ( not ( = ?auto_27306 ?auto_27325 ) ) ( not ( = ?auto_27306 ?auto_27326 ) ) ( not ( = ?auto_27306 ?auto_27327 ) ) ( not ( = ?auto_27306 ?auto_27319 ) ) ( not ( = ?auto_27306 ?auto_27321 ) ) ( not ( = ?auto_27306 ?auto_27324 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27296 ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ?auto_27301 ?auto_27302 ?auto_27303 )
      ( MAKE-1CRATE ?auto_27303 ?auto_27304 )
      ( MAKE-8CRATE-VERIFY ?auto_27296 ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ?auto_27301 ?auto_27302 ?auto_27303 ?auto_27304 ) )
  )

  ( :method MAKE-9CRATE
    :parameters
    (
      ?auto_27350 - SURFACE
      ?auto_27351 - SURFACE
      ?auto_27352 - SURFACE
      ?auto_27353 - SURFACE
      ?auto_27354 - SURFACE
      ?auto_27355 - SURFACE
      ?auto_27356 - SURFACE
      ?auto_27357 - SURFACE
      ?auto_27358 - SURFACE
      ?auto_27359 - SURFACE
    )
    :vars
    (
      ?auto_27362 - HOIST
      ?auto_27361 - PLACE
      ?auto_27365 - PLACE
      ?auto_27364 - HOIST
      ?auto_27363 - SURFACE
      ?auto_27376 - PLACE
      ?auto_27378 - HOIST
      ?auto_27373 - SURFACE
      ?auto_27382 - PLACE
      ?auto_27379 - HOIST
      ?auto_27368 - SURFACE
      ?auto_27370 - PLACE
      ?auto_27383 - HOIST
      ?auto_27374 - SURFACE
      ?auto_27380 - PLACE
      ?auto_27369 - HOIST
      ?auto_27384 - SURFACE
      ?auto_27375 - SURFACE
      ?auto_27366 - PLACE
      ?auto_27386 - HOIST
      ?auto_27371 - SURFACE
      ?auto_27387 - PLACE
      ?auto_27385 - HOIST
      ?auto_27372 - SURFACE
      ?auto_27367 - PLACE
      ?auto_27381 - HOIST
      ?auto_27377 - SURFACE
      ?auto_27360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27362 ?auto_27361 ) ( IS-CRATE ?auto_27359 ) ( not ( = ?auto_27365 ?auto_27361 ) ) ( HOIST-AT ?auto_27364 ?auto_27365 ) ( AVAILABLE ?auto_27364 ) ( SURFACE-AT ?auto_27359 ?auto_27365 ) ( ON ?auto_27359 ?auto_27363 ) ( CLEAR ?auto_27359 ) ( not ( = ?auto_27358 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27363 ) ) ( not ( = ?auto_27362 ?auto_27364 ) ) ( IS-CRATE ?auto_27358 ) ( not ( = ?auto_27376 ?auto_27361 ) ) ( HOIST-AT ?auto_27378 ?auto_27376 ) ( AVAILABLE ?auto_27378 ) ( SURFACE-AT ?auto_27358 ?auto_27376 ) ( ON ?auto_27358 ?auto_27373 ) ( CLEAR ?auto_27358 ) ( not ( = ?auto_27357 ?auto_27358 ) ) ( not ( = ?auto_27357 ?auto_27373 ) ) ( not ( = ?auto_27358 ?auto_27373 ) ) ( not ( = ?auto_27362 ?auto_27378 ) ) ( IS-CRATE ?auto_27357 ) ( not ( = ?auto_27382 ?auto_27361 ) ) ( HOIST-AT ?auto_27379 ?auto_27382 ) ( AVAILABLE ?auto_27379 ) ( SURFACE-AT ?auto_27357 ?auto_27382 ) ( ON ?auto_27357 ?auto_27368 ) ( CLEAR ?auto_27357 ) ( not ( = ?auto_27356 ?auto_27357 ) ) ( not ( = ?auto_27356 ?auto_27368 ) ) ( not ( = ?auto_27357 ?auto_27368 ) ) ( not ( = ?auto_27362 ?auto_27379 ) ) ( IS-CRATE ?auto_27356 ) ( not ( = ?auto_27370 ?auto_27361 ) ) ( HOIST-AT ?auto_27383 ?auto_27370 ) ( AVAILABLE ?auto_27383 ) ( SURFACE-AT ?auto_27356 ?auto_27370 ) ( ON ?auto_27356 ?auto_27374 ) ( CLEAR ?auto_27356 ) ( not ( = ?auto_27355 ?auto_27356 ) ) ( not ( = ?auto_27355 ?auto_27374 ) ) ( not ( = ?auto_27356 ?auto_27374 ) ) ( not ( = ?auto_27362 ?auto_27383 ) ) ( IS-CRATE ?auto_27355 ) ( not ( = ?auto_27380 ?auto_27361 ) ) ( HOIST-AT ?auto_27369 ?auto_27380 ) ( SURFACE-AT ?auto_27355 ?auto_27380 ) ( ON ?auto_27355 ?auto_27384 ) ( CLEAR ?auto_27355 ) ( not ( = ?auto_27354 ?auto_27355 ) ) ( not ( = ?auto_27354 ?auto_27384 ) ) ( not ( = ?auto_27355 ?auto_27384 ) ) ( not ( = ?auto_27362 ?auto_27369 ) ) ( IS-CRATE ?auto_27354 ) ( AVAILABLE ?auto_27369 ) ( SURFACE-AT ?auto_27354 ?auto_27380 ) ( ON ?auto_27354 ?auto_27375 ) ( CLEAR ?auto_27354 ) ( not ( = ?auto_27353 ?auto_27354 ) ) ( not ( = ?auto_27353 ?auto_27375 ) ) ( not ( = ?auto_27354 ?auto_27375 ) ) ( IS-CRATE ?auto_27353 ) ( not ( = ?auto_27366 ?auto_27361 ) ) ( HOIST-AT ?auto_27386 ?auto_27366 ) ( AVAILABLE ?auto_27386 ) ( SURFACE-AT ?auto_27353 ?auto_27366 ) ( ON ?auto_27353 ?auto_27371 ) ( CLEAR ?auto_27353 ) ( not ( = ?auto_27352 ?auto_27353 ) ) ( not ( = ?auto_27352 ?auto_27371 ) ) ( not ( = ?auto_27353 ?auto_27371 ) ) ( not ( = ?auto_27362 ?auto_27386 ) ) ( IS-CRATE ?auto_27352 ) ( not ( = ?auto_27387 ?auto_27361 ) ) ( HOIST-AT ?auto_27385 ?auto_27387 ) ( AVAILABLE ?auto_27385 ) ( SURFACE-AT ?auto_27352 ?auto_27387 ) ( ON ?auto_27352 ?auto_27372 ) ( CLEAR ?auto_27352 ) ( not ( = ?auto_27351 ?auto_27352 ) ) ( not ( = ?auto_27351 ?auto_27372 ) ) ( not ( = ?auto_27352 ?auto_27372 ) ) ( not ( = ?auto_27362 ?auto_27385 ) ) ( SURFACE-AT ?auto_27350 ?auto_27361 ) ( CLEAR ?auto_27350 ) ( IS-CRATE ?auto_27351 ) ( AVAILABLE ?auto_27362 ) ( not ( = ?auto_27367 ?auto_27361 ) ) ( HOIST-AT ?auto_27381 ?auto_27367 ) ( AVAILABLE ?auto_27381 ) ( SURFACE-AT ?auto_27351 ?auto_27367 ) ( ON ?auto_27351 ?auto_27377 ) ( CLEAR ?auto_27351 ) ( TRUCK-AT ?auto_27360 ?auto_27361 ) ( not ( = ?auto_27350 ?auto_27351 ) ) ( not ( = ?auto_27350 ?auto_27377 ) ) ( not ( = ?auto_27351 ?auto_27377 ) ) ( not ( = ?auto_27362 ?auto_27381 ) ) ( not ( = ?auto_27350 ?auto_27352 ) ) ( not ( = ?auto_27350 ?auto_27372 ) ) ( not ( = ?auto_27352 ?auto_27377 ) ) ( not ( = ?auto_27387 ?auto_27367 ) ) ( not ( = ?auto_27385 ?auto_27381 ) ) ( not ( = ?auto_27372 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27353 ) ) ( not ( = ?auto_27350 ?auto_27371 ) ) ( not ( = ?auto_27351 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27371 ) ) ( not ( = ?auto_27353 ?auto_27372 ) ) ( not ( = ?auto_27353 ?auto_27377 ) ) ( not ( = ?auto_27366 ?auto_27387 ) ) ( not ( = ?auto_27366 ?auto_27367 ) ) ( not ( = ?auto_27386 ?auto_27385 ) ) ( not ( = ?auto_27386 ?auto_27381 ) ) ( not ( = ?auto_27371 ?auto_27372 ) ) ( not ( = ?auto_27371 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27354 ) ) ( not ( = ?auto_27350 ?auto_27375 ) ) ( not ( = ?auto_27351 ?auto_27354 ) ) ( not ( = ?auto_27351 ?auto_27375 ) ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( not ( = ?auto_27352 ?auto_27375 ) ) ( not ( = ?auto_27354 ?auto_27371 ) ) ( not ( = ?auto_27354 ?auto_27372 ) ) ( not ( = ?auto_27354 ?auto_27377 ) ) ( not ( = ?auto_27380 ?auto_27366 ) ) ( not ( = ?auto_27380 ?auto_27387 ) ) ( not ( = ?auto_27380 ?auto_27367 ) ) ( not ( = ?auto_27369 ?auto_27386 ) ) ( not ( = ?auto_27369 ?auto_27385 ) ) ( not ( = ?auto_27369 ?auto_27381 ) ) ( not ( = ?auto_27375 ?auto_27371 ) ) ( not ( = ?auto_27375 ?auto_27372 ) ) ( not ( = ?auto_27375 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27355 ) ) ( not ( = ?auto_27350 ?auto_27384 ) ) ( not ( = ?auto_27351 ?auto_27355 ) ) ( not ( = ?auto_27351 ?auto_27384 ) ) ( not ( = ?auto_27352 ?auto_27355 ) ) ( not ( = ?auto_27352 ?auto_27384 ) ) ( not ( = ?auto_27353 ?auto_27355 ) ) ( not ( = ?auto_27353 ?auto_27384 ) ) ( not ( = ?auto_27355 ?auto_27375 ) ) ( not ( = ?auto_27355 ?auto_27371 ) ) ( not ( = ?auto_27355 ?auto_27372 ) ) ( not ( = ?auto_27355 ?auto_27377 ) ) ( not ( = ?auto_27384 ?auto_27375 ) ) ( not ( = ?auto_27384 ?auto_27371 ) ) ( not ( = ?auto_27384 ?auto_27372 ) ) ( not ( = ?auto_27384 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27356 ) ) ( not ( = ?auto_27350 ?auto_27374 ) ) ( not ( = ?auto_27351 ?auto_27356 ) ) ( not ( = ?auto_27351 ?auto_27374 ) ) ( not ( = ?auto_27352 ?auto_27356 ) ) ( not ( = ?auto_27352 ?auto_27374 ) ) ( not ( = ?auto_27353 ?auto_27356 ) ) ( not ( = ?auto_27353 ?auto_27374 ) ) ( not ( = ?auto_27354 ?auto_27356 ) ) ( not ( = ?auto_27354 ?auto_27374 ) ) ( not ( = ?auto_27356 ?auto_27384 ) ) ( not ( = ?auto_27356 ?auto_27375 ) ) ( not ( = ?auto_27356 ?auto_27371 ) ) ( not ( = ?auto_27356 ?auto_27372 ) ) ( not ( = ?auto_27356 ?auto_27377 ) ) ( not ( = ?auto_27370 ?auto_27380 ) ) ( not ( = ?auto_27370 ?auto_27366 ) ) ( not ( = ?auto_27370 ?auto_27387 ) ) ( not ( = ?auto_27370 ?auto_27367 ) ) ( not ( = ?auto_27383 ?auto_27369 ) ) ( not ( = ?auto_27383 ?auto_27386 ) ) ( not ( = ?auto_27383 ?auto_27385 ) ) ( not ( = ?auto_27383 ?auto_27381 ) ) ( not ( = ?auto_27374 ?auto_27384 ) ) ( not ( = ?auto_27374 ?auto_27375 ) ) ( not ( = ?auto_27374 ?auto_27371 ) ) ( not ( = ?auto_27374 ?auto_27372 ) ) ( not ( = ?auto_27374 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27357 ) ) ( not ( = ?auto_27350 ?auto_27368 ) ) ( not ( = ?auto_27351 ?auto_27357 ) ) ( not ( = ?auto_27351 ?auto_27368 ) ) ( not ( = ?auto_27352 ?auto_27357 ) ) ( not ( = ?auto_27352 ?auto_27368 ) ) ( not ( = ?auto_27353 ?auto_27357 ) ) ( not ( = ?auto_27353 ?auto_27368 ) ) ( not ( = ?auto_27354 ?auto_27357 ) ) ( not ( = ?auto_27354 ?auto_27368 ) ) ( not ( = ?auto_27355 ?auto_27357 ) ) ( not ( = ?auto_27355 ?auto_27368 ) ) ( not ( = ?auto_27357 ?auto_27374 ) ) ( not ( = ?auto_27357 ?auto_27384 ) ) ( not ( = ?auto_27357 ?auto_27375 ) ) ( not ( = ?auto_27357 ?auto_27371 ) ) ( not ( = ?auto_27357 ?auto_27372 ) ) ( not ( = ?auto_27357 ?auto_27377 ) ) ( not ( = ?auto_27382 ?auto_27370 ) ) ( not ( = ?auto_27382 ?auto_27380 ) ) ( not ( = ?auto_27382 ?auto_27366 ) ) ( not ( = ?auto_27382 ?auto_27387 ) ) ( not ( = ?auto_27382 ?auto_27367 ) ) ( not ( = ?auto_27379 ?auto_27383 ) ) ( not ( = ?auto_27379 ?auto_27369 ) ) ( not ( = ?auto_27379 ?auto_27386 ) ) ( not ( = ?auto_27379 ?auto_27385 ) ) ( not ( = ?auto_27379 ?auto_27381 ) ) ( not ( = ?auto_27368 ?auto_27374 ) ) ( not ( = ?auto_27368 ?auto_27384 ) ) ( not ( = ?auto_27368 ?auto_27375 ) ) ( not ( = ?auto_27368 ?auto_27371 ) ) ( not ( = ?auto_27368 ?auto_27372 ) ) ( not ( = ?auto_27368 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27358 ) ) ( not ( = ?auto_27350 ?auto_27373 ) ) ( not ( = ?auto_27351 ?auto_27358 ) ) ( not ( = ?auto_27351 ?auto_27373 ) ) ( not ( = ?auto_27352 ?auto_27358 ) ) ( not ( = ?auto_27352 ?auto_27373 ) ) ( not ( = ?auto_27353 ?auto_27358 ) ) ( not ( = ?auto_27353 ?auto_27373 ) ) ( not ( = ?auto_27354 ?auto_27358 ) ) ( not ( = ?auto_27354 ?auto_27373 ) ) ( not ( = ?auto_27355 ?auto_27358 ) ) ( not ( = ?auto_27355 ?auto_27373 ) ) ( not ( = ?auto_27356 ?auto_27358 ) ) ( not ( = ?auto_27356 ?auto_27373 ) ) ( not ( = ?auto_27358 ?auto_27368 ) ) ( not ( = ?auto_27358 ?auto_27374 ) ) ( not ( = ?auto_27358 ?auto_27384 ) ) ( not ( = ?auto_27358 ?auto_27375 ) ) ( not ( = ?auto_27358 ?auto_27371 ) ) ( not ( = ?auto_27358 ?auto_27372 ) ) ( not ( = ?auto_27358 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27382 ) ) ( not ( = ?auto_27376 ?auto_27370 ) ) ( not ( = ?auto_27376 ?auto_27380 ) ) ( not ( = ?auto_27376 ?auto_27366 ) ) ( not ( = ?auto_27376 ?auto_27387 ) ) ( not ( = ?auto_27376 ?auto_27367 ) ) ( not ( = ?auto_27378 ?auto_27379 ) ) ( not ( = ?auto_27378 ?auto_27383 ) ) ( not ( = ?auto_27378 ?auto_27369 ) ) ( not ( = ?auto_27378 ?auto_27386 ) ) ( not ( = ?auto_27378 ?auto_27385 ) ) ( not ( = ?auto_27378 ?auto_27381 ) ) ( not ( = ?auto_27373 ?auto_27368 ) ) ( not ( = ?auto_27373 ?auto_27374 ) ) ( not ( = ?auto_27373 ?auto_27384 ) ) ( not ( = ?auto_27373 ?auto_27375 ) ) ( not ( = ?auto_27373 ?auto_27371 ) ) ( not ( = ?auto_27373 ?auto_27372 ) ) ( not ( = ?auto_27373 ?auto_27377 ) ) ( not ( = ?auto_27350 ?auto_27359 ) ) ( not ( = ?auto_27350 ?auto_27363 ) ) ( not ( = ?auto_27351 ?auto_27359 ) ) ( not ( = ?auto_27351 ?auto_27363 ) ) ( not ( = ?auto_27352 ?auto_27359 ) ) ( not ( = ?auto_27352 ?auto_27363 ) ) ( not ( = ?auto_27353 ?auto_27359 ) ) ( not ( = ?auto_27353 ?auto_27363 ) ) ( not ( = ?auto_27354 ?auto_27359 ) ) ( not ( = ?auto_27354 ?auto_27363 ) ) ( not ( = ?auto_27355 ?auto_27359 ) ) ( not ( = ?auto_27355 ?auto_27363 ) ) ( not ( = ?auto_27356 ?auto_27359 ) ) ( not ( = ?auto_27356 ?auto_27363 ) ) ( not ( = ?auto_27357 ?auto_27359 ) ) ( not ( = ?auto_27357 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27373 ) ) ( not ( = ?auto_27359 ?auto_27368 ) ) ( not ( = ?auto_27359 ?auto_27374 ) ) ( not ( = ?auto_27359 ?auto_27384 ) ) ( not ( = ?auto_27359 ?auto_27375 ) ) ( not ( = ?auto_27359 ?auto_27371 ) ) ( not ( = ?auto_27359 ?auto_27372 ) ) ( not ( = ?auto_27359 ?auto_27377 ) ) ( not ( = ?auto_27365 ?auto_27376 ) ) ( not ( = ?auto_27365 ?auto_27382 ) ) ( not ( = ?auto_27365 ?auto_27370 ) ) ( not ( = ?auto_27365 ?auto_27380 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27387 ) ) ( not ( = ?auto_27365 ?auto_27367 ) ) ( not ( = ?auto_27364 ?auto_27378 ) ) ( not ( = ?auto_27364 ?auto_27379 ) ) ( not ( = ?auto_27364 ?auto_27383 ) ) ( not ( = ?auto_27364 ?auto_27369 ) ) ( not ( = ?auto_27364 ?auto_27386 ) ) ( not ( = ?auto_27364 ?auto_27385 ) ) ( not ( = ?auto_27364 ?auto_27381 ) ) ( not ( = ?auto_27363 ?auto_27373 ) ) ( not ( = ?auto_27363 ?auto_27368 ) ) ( not ( = ?auto_27363 ?auto_27374 ) ) ( not ( = ?auto_27363 ?auto_27384 ) ) ( not ( = ?auto_27363 ?auto_27375 ) ) ( not ( = ?auto_27363 ?auto_27371 ) ) ( not ( = ?auto_27363 ?auto_27372 ) ) ( not ( = ?auto_27363 ?auto_27377 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27350 ?auto_27351 ?auto_27352 ?auto_27353 ?auto_27354 ?auto_27355 ?auto_27356 ?auto_27357 ?auto_27358 )
      ( MAKE-1CRATE ?auto_27358 ?auto_27359 )
      ( MAKE-9CRATE-VERIFY ?auto_27350 ?auto_27351 ?auto_27352 ?auto_27353 ?auto_27354 ?auto_27355 ?auto_27356 ?auto_27357 ?auto_27358 ?auto_27359 ) )
  )

  ( :method MAKE-10CRATE
    :parameters
    (
      ?auto_27409 - SURFACE
      ?auto_27410 - SURFACE
      ?auto_27411 - SURFACE
      ?auto_27412 - SURFACE
      ?auto_27413 - SURFACE
      ?auto_27414 - SURFACE
      ?auto_27415 - SURFACE
      ?auto_27416 - SURFACE
      ?auto_27417 - SURFACE
      ?auto_27418 - SURFACE
      ?auto_27419 - SURFACE
    )
    :vars
    (
      ?auto_27425 - HOIST
      ?auto_27421 - PLACE
      ?auto_27422 - PLACE
      ?auto_27423 - HOIST
      ?auto_27420 - SURFACE
      ?auto_27443 - PLACE
      ?auto_27441 - HOIST
      ?auto_27429 - SURFACE
      ?auto_27427 - PLACE
      ?auto_27439 - HOIST
      ?auto_27433 - SURFACE
      ?auto_27428 - PLACE
      ?auto_27448 - HOIST
      ?auto_27431 - SURFACE
      ?auto_27447 - PLACE
      ?auto_27446 - HOIST
      ?auto_27436 - SURFACE
      ?auto_27426 - PLACE
      ?auto_27445 - HOIST
      ?auto_27444 - SURFACE
      ?auto_27438 - SURFACE
      ?auto_27450 - PLACE
      ?auto_27440 - HOIST
      ?auto_27430 - SURFACE
      ?auto_27449 - PLACE
      ?auto_27435 - HOIST
      ?auto_27442 - SURFACE
      ?auto_27434 - PLACE
      ?auto_27432 - HOIST
      ?auto_27437 - SURFACE
      ?auto_27424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27425 ?auto_27421 ) ( IS-CRATE ?auto_27419 ) ( not ( = ?auto_27422 ?auto_27421 ) ) ( HOIST-AT ?auto_27423 ?auto_27422 ) ( AVAILABLE ?auto_27423 ) ( SURFACE-AT ?auto_27419 ?auto_27422 ) ( ON ?auto_27419 ?auto_27420 ) ( CLEAR ?auto_27419 ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27420 ) ) ( not ( = ?auto_27419 ?auto_27420 ) ) ( not ( = ?auto_27425 ?auto_27423 ) ) ( IS-CRATE ?auto_27418 ) ( not ( = ?auto_27443 ?auto_27421 ) ) ( HOIST-AT ?auto_27441 ?auto_27443 ) ( AVAILABLE ?auto_27441 ) ( SURFACE-AT ?auto_27418 ?auto_27443 ) ( ON ?auto_27418 ?auto_27429 ) ( CLEAR ?auto_27418 ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27417 ?auto_27429 ) ) ( not ( = ?auto_27418 ?auto_27429 ) ) ( not ( = ?auto_27425 ?auto_27441 ) ) ( IS-CRATE ?auto_27417 ) ( not ( = ?auto_27427 ?auto_27421 ) ) ( HOIST-AT ?auto_27439 ?auto_27427 ) ( AVAILABLE ?auto_27439 ) ( SURFACE-AT ?auto_27417 ?auto_27427 ) ( ON ?auto_27417 ?auto_27433 ) ( CLEAR ?auto_27417 ) ( not ( = ?auto_27416 ?auto_27417 ) ) ( not ( = ?auto_27416 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27433 ) ) ( not ( = ?auto_27425 ?auto_27439 ) ) ( IS-CRATE ?auto_27416 ) ( not ( = ?auto_27428 ?auto_27421 ) ) ( HOIST-AT ?auto_27448 ?auto_27428 ) ( AVAILABLE ?auto_27448 ) ( SURFACE-AT ?auto_27416 ?auto_27428 ) ( ON ?auto_27416 ?auto_27431 ) ( CLEAR ?auto_27416 ) ( not ( = ?auto_27415 ?auto_27416 ) ) ( not ( = ?auto_27415 ?auto_27431 ) ) ( not ( = ?auto_27416 ?auto_27431 ) ) ( not ( = ?auto_27425 ?auto_27448 ) ) ( IS-CRATE ?auto_27415 ) ( not ( = ?auto_27447 ?auto_27421 ) ) ( HOIST-AT ?auto_27446 ?auto_27447 ) ( AVAILABLE ?auto_27446 ) ( SURFACE-AT ?auto_27415 ?auto_27447 ) ( ON ?auto_27415 ?auto_27436 ) ( CLEAR ?auto_27415 ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( not ( = ?auto_27414 ?auto_27436 ) ) ( not ( = ?auto_27415 ?auto_27436 ) ) ( not ( = ?auto_27425 ?auto_27446 ) ) ( IS-CRATE ?auto_27414 ) ( not ( = ?auto_27426 ?auto_27421 ) ) ( HOIST-AT ?auto_27445 ?auto_27426 ) ( SURFACE-AT ?auto_27414 ?auto_27426 ) ( ON ?auto_27414 ?auto_27444 ) ( CLEAR ?auto_27414 ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27444 ) ) ( not ( = ?auto_27414 ?auto_27444 ) ) ( not ( = ?auto_27425 ?auto_27445 ) ) ( IS-CRATE ?auto_27413 ) ( AVAILABLE ?auto_27445 ) ( SURFACE-AT ?auto_27413 ?auto_27426 ) ( ON ?auto_27413 ?auto_27438 ) ( CLEAR ?auto_27413 ) ( not ( = ?auto_27412 ?auto_27413 ) ) ( not ( = ?auto_27412 ?auto_27438 ) ) ( not ( = ?auto_27413 ?auto_27438 ) ) ( IS-CRATE ?auto_27412 ) ( not ( = ?auto_27450 ?auto_27421 ) ) ( HOIST-AT ?auto_27440 ?auto_27450 ) ( AVAILABLE ?auto_27440 ) ( SURFACE-AT ?auto_27412 ?auto_27450 ) ( ON ?auto_27412 ?auto_27430 ) ( CLEAR ?auto_27412 ) ( not ( = ?auto_27411 ?auto_27412 ) ) ( not ( = ?auto_27411 ?auto_27430 ) ) ( not ( = ?auto_27412 ?auto_27430 ) ) ( not ( = ?auto_27425 ?auto_27440 ) ) ( IS-CRATE ?auto_27411 ) ( not ( = ?auto_27449 ?auto_27421 ) ) ( HOIST-AT ?auto_27435 ?auto_27449 ) ( AVAILABLE ?auto_27435 ) ( SURFACE-AT ?auto_27411 ?auto_27449 ) ( ON ?auto_27411 ?auto_27442 ) ( CLEAR ?auto_27411 ) ( not ( = ?auto_27410 ?auto_27411 ) ) ( not ( = ?auto_27410 ?auto_27442 ) ) ( not ( = ?auto_27411 ?auto_27442 ) ) ( not ( = ?auto_27425 ?auto_27435 ) ) ( SURFACE-AT ?auto_27409 ?auto_27421 ) ( CLEAR ?auto_27409 ) ( IS-CRATE ?auto_27410 ) ( AVAILABLE ?auto_27425 ) ( not ( = ?auto_27434 ?auto_27421 ) ) ( HOIST-AT ?auto_27432 ?auto_27434 ) ( AVAILABLE ?auto_27432 ) ( SURFACE-AT ?auto_27410 ?auto_27434 ) ( ON ?auto_27410 ?auto_27437 ) ( CLEAR ?auto_27410 ) ( TRUCK-AT ?auto_27424 ?auto_27421 ) ( not ( = ?auto_27409 ?auto_27410 ) ) ( not ( = ?auto_27409 ?auto_27437 ) ) ( not ( = ?auto_27410 ?auto_27437 ) ) ( not ( = ?auto_27425 ?auto_27432 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27409 ?auto_27442 ) ) ( not ( = ?auto_27411 ?auto_27437 ) ) ( not ( = ?auto_27449 ?auto_27434 ) ) ( not ( = ?auto_27435 ?auto_27432 ) ) ( not ( = ?auto_27442 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27412 ) ) ( not ( = ?auto_27409 ?auto_27430 ) ) ( not ( = ?auto_27410 ?auto_27412 ) ) ( not ( = ?auto_27410 ?auto_27430 ) ) ( not ( = ?auto_27412 ?auto_27442 ) ) ( not ( = ?auto_27412 ?auto_27437 ) ) ( not ( = ?auto_27450 ?auto_27449 ) ) ( not ( = ?auto_27450 ?auto_27434 ) ) ( not ( = ?auto_27440 ?auto_27435 ) ) ( not ( = ?auto_27440 ?auto_27432 ) ) ( not ( = ?auto_27430 ?auto_27442 ) ) ( not ( = ?auto_27430 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27413 ) ) ( not ( = ?auto_27409 ?auto_27438 ) ) ( not ( = ?auto_27410 ?auto_27413 ) ) ( not ( = ?auto_27410 ?auto_27438 ) ) ( not ( = ?auto_27411 ?auto_27413 ) ) ( not ( = ?auto_27411 ?auto_27438 ) ) ( not ( = ?auto_27413 ?auto_27430 ) ) ( not ( = ?auto_27413 ?auto_27442 ) ) ( not ( = ?auto_27413 ?auto_27437 ) ) ( not ( = ?auto_27426 ?auto_27450 ) ) ( not ( = ?auto_27426 ?auto_27449 ) ) ( not ( = ?auto_27426 ?auto_27434 ) ) ( not ( = ?auto_27445 ?auto_27440 ) ) ( not ( = ?auto_27445 ?auto_27435 ) ) ( not ( = ?auto_27445 ?auto_27432 ) ) ( not ( = ?auto_27438 ?auto_27430 ) ) ( not ( = ?auto_27438 ?auto_27442 ) ) ( not ( = ?auto_27438 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27414 ) ) ( not ( = ?auto_27409 ?auto_27444 ) ) ( not ( = ?auto_27410 ?auto_27414 ) ) ( not ( = ?auto_27410 ?auto_27444 ) ) ( not ( = ?auto_27411 ?auto_27414 ) ) ( not ( = ?auto_27411 ?auto_27444 ) ) ( not ( = ?auto_27412 ?auto_27414 ) ) ( not ( = ?auto_27412 ?auto_27444 ) ) ( not ( = ?auto_27414 ?auto_27438 ) ) ( not ( = ?auto_27414 ?auto_27430 ) ) ( not ( = ?auto_27414 ?auto_27442 ) ) ( not ( = ?auto_27414 ?auto_27437 ) ) ( not ( = ?auto_27444 ?auto_27438 ) ) ( not ( = ?auto_27444 ?auto_27430 ) ) ( not ( = ?auto_27444 ?auto_27442 ) ) ( not ( = ?auto_27444 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27415 ) ) ( not ( = ?auto_27409 ?auto_27436 ) ) ( not ( = ?auto_27410 ?auto_27415 ) ) ( not ( = ?auto_27410 ?auto_27436 ) ) ( not ( = ?auto_27411 ?auto_27415 ) ) ( not ( = ?auto_27411 ?auto_27436 ) ) ( not ( = ?auto_27412 ?auto_27415 ) ) ( not ( = ?auto_27412 ?auto_27436 ) ) ( not ( = ?auto_27413 ?auto_27415 ) ) ( not ( = ?auto_27413 ?auto_27436 ) ) ( not ( = ?auto_27415 ?auto_27444 ) ) ( not ( = ?auto_27415 ?auto_27438 ) ) ( not ( = ?auto_27415 ?auto_27430 ) ) ( not ( = ?auto_27415 ?auto_27442 ) ) ( not ( = ?auto_27415 ?auto_27437 ) ) ( not ( = ?auto_27447 ?auto_27426 ) ) ( not ( = ?auto_27447 ?auto_27450 ) ) ( not ( = ?auto_27447 ?auto_27449 ) ) ( not ( = ?auto_27447 ?auto_27434 ) ) ( not ( = ?auto_27446 ?auto_27445 ) ) ( not ( = ?auto_27446 ?auto_27440 ) ) ( not ( = ?auto_27446 ?auto_27435 ) ) ( not ( = ?auto_27446 ?auto_27432 ) ) ( not ( = ?auto_27436 ?auto_27444 ) ) ( not ( = ?auto_27436 ?auto_27438 ) ) ( not ( = ?auto_27436 ?auto_27430 ) ) ( not ( = ?auto_27436 ?auto_27442 ) ) ( not ( = ?auto_27436 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27416 ) ) ( not ( = ?auto_27409 ?auto_27431 ) ) ( not ( = ?auto_27410 ?auto_27416 ) ) ( not ( = ?auto_27410 ?auto_27431 ) ) ( not ( = ?auto_27411 ?auto_27416 ) ) ( not ( = ?auto_27411 ?auto_27431 ) ) ( not ( = ?auto_27412 ?auto_27416 ) ) ( not ( = ?auto_27412 ?auto_27431 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27431 ) ) ( not ( = ?auto_27414 ?auto_27416 ) ) ( not ( = ?auto_27414 ?auto_27431 ) ) ( not ( = ?auto_27416 ?auto_27436 ) ) ( not ( = ?auto_27416 ?auto_27444 ) ) ( not ( = ?auto_27416 ?auto_27438 ) ) ( not ( = ?auto_27416 ?auto_27430 ) ) ( not ( = ?auto_27416 ?auto_27442 ) ) ( not ( = ?auto_27416 ?auto_27437 ) ) ( not ( = ?auto_27428 ?auto_27447 ) ) ( not ( = ?auto_27428 ?auto_27426 ) ) ( not ( = ?auto_27428 ?auto_27450 ) ) ( not ( = ?auto_27428 ?auto_27449 ) ) ( not ( = ?auto_27428 ?auto_27434 ) ) ( not ( = ?auto_27448 ?auto_27446 ) ) ( not ( = ?auto_27448 ?auto_27445 ) ) ( not ( = ?auto_27448 ?auto_27440 ) ) ( not ( = ?auto_27448 ?auto_27435 ) ) ( not ( = ?auto_27448 ?auto_27432 ) ) ( not ( = ?auto_27431 ?auto_27436 ) ) ( not ( = ?auto_27431 ?auto_27444 ) ) ( not ( = ?auto_27431 ?auto_27438 ) ) ( not ( = ?auto_27431 ?auto_27430 ) ) ( not ( = ?auto_27431 ?auto_27442 ) ) ( not ( = ?auto_27431 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27417 ) ) ( not ( = ?auto_27409 ?auto_27433 ) ) ( not ( = ?auto_27410 ?auto_27417 ) ) ( not ( = ?auto_27410 ?auto_27433 ) ) ( not ( = ?auto_27411 ?auto_27417 ) ) ( not ( = ?auto_27411 ?auto_27433 ) ) ( not ( = ?auto_27412 ?auto_27417 ) ) ( not ( = ?auto_27412 ?auto_27433 ) ) ( not ( = ?auto_27413 ?auto_27417 ) ) ( not ( = ?auto_27413 ?auto_27433 ) ) ( not ( = ?auto_27414 ?auto_27417 ) ) ( not ( = ?auto_27414 ?auto_27433 ) ) ( not ( = ?auto_27415 ?auto_27417 ) ) ( not ( = ?auto_27415 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27431 ) ) ( not ( = ?auto_27417 ?auto_27436 ) ) ( not ( = ?auto_27417 ?auto_27444 ) ) ( not ( = ?auto_27417 ?auto_27438 ) ) ( not ( = ?auto_27417 ?auto_27430 ) ) ( not ( = ?auto_27417 ?auto_27442 ) ) ( not ( = ?auto_27417 ?auto_27437 ) ) ( not ( = ?auto_27427 ?auto_27428 ) ) ( not ( = ?auto_27427 ?auto_27447 ) ) ( not ( = ?auto_27427 ?auto_27426 ) ) ( not ( = ?auto_27427 ?auto_27450 ) ) ( not ( = ?auto_27427 ?auto_27449 ) ) ( not ( = ?auto_27427 ?auto_27434 ) ) ( not ( = ?auto_27439 ?auto_27448 ) ) ( not ( = ?auto_27439 ?auto_27446 ) ) ( not ( = ?auto_27439 ?auto_27445 ) ) ( not ( = ?auto_27439 ?auto_27440 ) ) ( not ( = ?auto_27439 ?auto_27435 ) ) ( not ( = ?auto_27439 ?auto_27432 ) ) ( not ( = ?auto_27433 ?auto_27431 ) ) ( not ( = ?auto_27433 ?auto_27436 ) ) ( not ( = ?auto_27433 ?auto_27444 ) ) ( not ( = ?auto_27433 ?auto_27438 ) ) ( not ( = ?auto_27433 ?auto_27430 ) ) ( not ( = ?auto_27433 ?auto_27442 ) ) ( not ( = ?auto_27433 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27418 ) ) ( not ( = ?auto_27409 ?auto_27429 ) ) ( not ( = ?auto_27410 ?auto_27418 ) ) ( not ( = ?auto_27410 ?auto_27429 ) ) ( not ( = ?auto_27411 ?auto_27418 ) ) ( not ( = ?auto_27411 ?auto_27429 ) ) ( not ( = ?auto_27412 ?auto_27418 ) ) ( not ( = ?auto_27412 ?auto_27429 ) ) ( not ( = ?auto_27413 ?auto_27418 ) ) ( not ( = ?auto_27413 ?auto_27429 ) ) ( not ( = ?auto_27414 ?auto_27418 ) ) ( not ( = ?auto_27414 ?auto_27429 ) ) ( not ( = ?auto_27415 ?auto_27418 ) ) ( not ( = ?auto_27415 ?auto_27429 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( not ( = ?auto_27416 ?auto_27429 ) ) ( not ( = ?auto_27418 ?auto_27433 ) ) ( not ( = ?auto_27418 ?auto_27431 ) ) ( not ( = ?auto_27418 ?auto_27436 ) ) ( not ( = ?auto_27418 ?auto_27444 ) ) ( not ( = ?auto_27418 ?auto_27438 ) ) ( not ( = ?auto_27418 ?auto_27430 ) ) ( not ( = ?auto_27418 ?auto_27442 ) ) ( not ( = ?auto_27418 ?auto_27437 ) ) ( not ( = ?auto_27443 ?auto_27427 ) ) ( not ( = ?auto_27443 ?auto_27428 ) ) ( not ( = ?auto_27443 ?auto_27447 ) ) ( not ( = ?auto_27443 ?auto_27426 ) ) ( not ( = ?auto_27443 ?auto_27450 ) ) ( not ( = ?auto_27443 ?auto_27449 ) ) ( not ( = ?auto_27443 ?auto_27434 ) ) ( not ( = ?auto_27441 ?auto_27439 ) ) ( not ( = ?auto_27441 ?auto_27448 ) ) ( not ( = ?auto_27441 ?auto_27446 ) ) ( not ( = ?auto_27441 ?auto_27445 ) ) ( not ( = ?auto_27441 ?auto_27440 ) ) ( not ( = ?auto_27441 ?auto_27435 ) ) ( not ( = ?auto_27441 ?auto_27432 ) ) ( not ( = ?auto_27429 ?auto_27433 ) ) ( not ( = ?auto_27429 ?auto_27431 ) ) ( not ( = ?auto_27429 ?auto_27436 ) ) ( not ( = ?auto_27429 ?auto_27444 ) ) ( not ( = ?auto_27429 ?auto_27438 ) ) ( not ( = ?auto_27429 ?auto_27430 ) ) ( not ( = ?auto_27429 ?auto_27442 ) ) ( not ( = ?auto_27429 ?auto_27437 ) ) ( not ( = ?auto_27409 ?auto_27419 ) ) ( not ( = ?auto_27409 ?auto_27420 ) ) ( not ( = ?auto_27410 ?auto_27419 ) ) ( not ( = ?auto_27410 ?auto_27420 ) ) ( not ( = ?auto_27411 ?auto_27419 ) ) ( not ( = ?auto_27411 ?auto_27420 ) ) ( not ( = ?auto_27412 ?auto_27419 ) ) ( not ( = ?auto_27412 ?auto_27420 ) ) ( not ( = ?auto_27413 ?auto_27419 ) ) ( not ( = ?auto_27413 ?auto_27420 ) ) ( not ( = ?auto_27414 ?auto_27419 ) ) ( not ( = ?auto_27414 ?auto_27420 ) ) ( not ( = ?auto_27415 ?auto_27419 ) ) ( not ( = ?auto_27415 ?auto_27420 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27416 ?auto_27420 ) ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27417 ?auto_27420 ) ) ( not ( = ?auto_27419 ?auto_27429 ) ) ( not ( = ?auto_27419 ?auto_27433 ) ) ( not ( = ?auto_27419 ?auto_27431 ) ) ( not ( = ?auto_27419 ?auto_27436 ) ) ( not ( = ?auto_27419 ?auto_27444 ) ) ( not ( = ?auto_27419 ?auto_27438 ) ) ( not ( = ?auto_27419 ?auto_27430 ) ) ( not ( = ?auto_27419 ?auto_27442 ) ) ( not ( = ?auto_27419 ?auto_27437 ) ) ( not ( = ?auto_27422 ?auto_27443 ) ) ( not ( = ?auto_27422 ?auto_27427 ) ) ( not ( = ?auto_27422 ?auto_27428 ) ) ( not ( = ?auto_27422 ?auto_27447 ) ) ( not ( = ?auto_27422 ?auto_27426 ) ) ( not ( = ?auto_27422 ?auto_27450 ) ) ( not ( = ?auto_27422 ?auto_27449 ) ) ( not ( = ?auto_27422 ?auto_27434 ) ) ( not ( = ?auto_27423 ?auto_27441 ) ) ( not ( = ?auto_27423 ?auto_27439 ) ) ( not ( = ?auto_27423 ?auto_27448 ) ) ( not ( = ?auto_27423 ?auto_27446 ) ) ( not ( = ?auto_27423 ?auto_27445 ) ) ( not ( = ?auto_27423 ?auto_27440 ) ) ( not ( = ?auto_27423 ?auto_27435 ) ) ( not ( = ?auto_27423 ?auto_27432 ) ) ( not ( = ?auto_27420 ?auto_27429 ) ) ( not ( = ?auto_27420 ?auto_27433 ) ) ( not ( = ?auto_27420 ?auto_27431 ) ) ( not ( = ?auto_27420 ?auto_27436 ) ) ( not ( = ?auto_27420 ?auto_27444 ) ) ( not ( = ?auto_27420 ?auto_27438 ) ) ( not ( = ?auto_27420 ?auto_27430 ) ) ( not ( = ?auto_27420 ?auto_27442 ) ) ( not ( = ?auto_27420 ?auto_27437 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27409 ?auto_27410 ?auto_27411 ?auto_27412 ?auto_27413 ?auto_27414 ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 )
      ( MAKE-1CRATE ?auto_27418 ?auto_27419 )
      ( MAKE-10CRATE-VERIFY ?auto_27409 ?auto_27410 ?auto_27411 ?auto_27412 ?auto_27413 ?auto_27414 ?auto_27415 ?auto_27416 ?auto_27417 ?auto_27418 ?auto_27419 ) )
  )

  ( :method MAKE-11CRATE
    :parameters
    (
      ?auto_27473 - SURFACE
      ?auto_27474 - SURFACE
      ?auto_27475 - SURFACE
      ?auto_27476 - SURFACE
      ?auto_27477 - SURFACE
      ?auto_27478 - SURFACE
      ?auto_27479 - SURFACE
      ?auto_27480 - SURFACE
      ?auto_27481 - SURFACE
      ?auto_27482 - SURFACE
      ?auto_27483 - SURFACE
      ?auto_27484 - SURFACE
    )
    :vars
    (
      ?auto_27489 - HOIST
      ?auto_27488 - PLACE
      ?auto_27486 - PLACE
      ?auto_27490 - HOIST
      ?auto_27487 - SURFACE
      ?auto_27511 - PLACE
      ?auto_27510 - HOIST
      ?auto_27515 - SURFACE
      ?auto_27496 - PLACE
      ?auto_27500 - HOIST
      ?auto_27501 - SURFACE
      ?auto_27499 - PLACE
      ?auto_27514 - HOIST
      ?auto_27506 - SURFACE
      ?auto_27502 - PLACE
      ?auto_27513 - HOIST
      ?auto_27495 - SURFACE
      ?auto_27494 - PLACE
      ?auto_27493 - HOIST
      ?auto_27491 - SURFACE
      ?auto_27509 - PLACE
      ?auto_27508 - HOIST
      ?auto_27504 - SURFACE
      ?auto_27492 - SURFACE
      ?auto_27516 - PLACE
      ?auto_27512 - HOIST
      ?auto_27498 - SURFACE
      ?auto_27503 - SURFACE
      ?auto_27507 - PLACE
      ?auto_27505 - HOIST
      ?auto_27497 - SURFACE
      ?auto_27485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27489 ?auto_27488 ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27486 ?auto_27488 ) ) ( HOIST-AT ?auto_27490 ?auto_27486 ) ( SURFACE-AT ?auto_27484 ?auto_27486 ) ( ON ?auto_27484 ?auto_27487 ) ( CLEAR ?auto_27484 ) ( not ( = ?auto_27483 ?auto_27484 ) ) ( not ( = ?auto_27483 ?auto_27487 ) ) ( not ( = ?auto_27484 ?auto_27487 ) ) ( not ( = ?auto_27489 ?auto_27490 ) ) ( IS-CRATE ?auto_27483 ) ( not ( = ?auto_27511 ?auto_27488 ) ) ( HOIST-AT ?auto_27510 ?auto_27511 ) ( AVAILABLE ?auto_27510 ) ( SURFACE-AT ?auto_27483 ?auto_27511 ) ( ON ?auto_27483 ?auto_27515 ) ( CLEAR ?auto_27483 ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27515 ) ) ( not ( = ?auto_27483 ?auto_27515 ) ) ( not ( = ?auto_27489 ?auto_27510 ) ) ( IS-CRATE ?auto_27482 ) ( not ( = ?auto_27496 ?auto_27488 ) ) ( HOIST-AT ?auto_27500 ?auto_27496 ) ( AVAILABLE ?auto_27500 ) ( SURFACE-AT ?auto_27482 ?auto_27496 ) ( ON ?auto_27482 ?auto_27501 ) ( CLEAR ?auto_27482 ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27501 ) ) ( not ( = ?auto_27482 ?auto_27501 ) ) ( not ( = ?auto_27489 ?auto_27500 ) ) ( IS-CRATE ?auto_27481 ) ( not ( = ?auto_27499 ?auto_27488 ) ) ( HOIST-AT ?auto_27514 ?auto_27499 ) ( AVAILABLE ?auto_27514 ) ( SURFACE-AT ?auto_27481 ?auto_27499 ) ( ON ?auto_27481 ?auto_27506 ) ( CLEAR ?auto_27481 ) ( not ( = ?auto_27480 ?auto_27481 ) ) ( not ( = ?auto_27480 ?auto_27506 ) ) ( not ( = ?auto_27481 ?auto_27506 ) ) ( not ( = ?auto_27489 ?auto_27514 ) ) ( IS-CRATE ?auto_27480 ) ( not ( = ?auto_27502 ?auto_27488 ) ) ( HOIST-AT ?auto_27513 ?auto_27502 ) ( AVAILABLE ?auto_27513 ) ( SURFACE-AT ?auto_27480 ?auto_27502 ) ( ON ?auto_27480 ?auto_27495 ) ( CLEAR ?auto_27480 ) ( not ( = ?auto_27479 ?auto_27480 ) ) ( not ( = ?auto_27479 ?auto_27495 ) ) ( not ( = ?auto_27480 ?auto_27495 ) ) ( not ( = ?auto_27489 ?auto_27513 ) ) ( IS-CRATE ?auto_27479 ) ( not ( = ?auto_27494 ?auto_27488 ) ) ( HOIST-AT ?auto_27493 ?auto_27494 ) ( AVAILABLE ?auto_27493 ) ( SURFACE-AT ?auto_27479 ?auto_27494 ) ( ON ?auto_27479 ?auto_27491 ) ( CLEAR ?auto_27479 ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27491 ) ) ( not ( = ?auto_27479 ?auto_27491 ) ) ( not ( = ?auto_27489 ?auto_27493 ) ) ( IS-CRATE ?auto_27478 ) ( not ( = ?auto_27509 ?auto_27488 ) ) ( HOIST-AT ?auto_27508 ?auto_27509 ) ( SURFACE-AT ?auto_27478 ?auto_27509 ) ( ON ?auto_27478 ?auto_27504 ) ( CLEAR ?auto_27478 ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27504 ) ) ( not ( = ?auto_27478 ?auto_27504 ) ) ( not ( = ?auto_27489 ?auto_27508 ) ) ( IS-CRATE ?auto_27477 ) ( AVAILABLE ?auto_27508 ) ( SURFACE-AT ?auto_27477 ?auto_27509 ) ( ON ?auto_27477 ?auto_27492 ) ( CLEAR ?auto_27477 ) ( not ( = ?auto_27476 ?auto_27477 ) ) ( not ( = ?auto_27476 ?auto_27492 ) ) ( not ( = ?auto_27477 ?auto_27492 ) ) ( IS-CRATE ?auto_27476 ) ( not ( = ?auto_27516 ?auto_27488 ) ) ( HOIST-AT ?auto_27512 ?auto_27516 ) ( AVAILABLE ?auto_27512 ) ( SURFACE-AT ?auto_27476 ?auto_27516 ) ( ON ?auto_27476 ?auto_27498 ) ( CLEAR ?auto_27476 ) ( not ( = ?auto_27475 ?auto_27476 ) ) ( not ( = ?auto_27475 ?auto_27498 ) ) ( not ( = ?auto_27476 ?auto_27498 ) ) ( not ( = ?auto_27489 ?auto_27512 ) ) ( IS-CRATE ?auto_27475 ) ( AVAILABLE ?auto_27490 ) ( SURFACE-AT ?auto_27475 ?auto_27486 ) ( ON ?auto_27475 ?auto_27503 ) ( CLEAR ?auto_27475 ) ( not ( = ?auto_27474 ?auto_27475 ) ) ( not ( = ?auto_27474 ?auto_27503 ) ) ( not ( = ?auto_27475 ?auto_27503 ) ) ( SURFACE-AT ?auto_27473 ?auto_27488 ) ( CLEAR ?auto_27473 ) ( IS-CRATE ?auto_27474 ) ( AVAILABLE ?auto_27489 ) ( not ( = ?auto_27507 ?auto_27488 ) ) ( HOIST-AT ?auto_27505 ?auto_27507 ) ( AVAILABLE ?auto_27505 ) ( SURFACE-AT ?auto_27474 ?auto_27507 ) ( ON ?auto_27474 ?auto_27497 ) ( CLEAR ?auto_27474 ) ( TRUCK-AT ?auto_27485 ?auto_27488 ) ( not ( = ?auto_27473 ?auto_27474 ) ) ( not ( = ?auto_27473 ?auto_27497 ) ) ( not ( = ?auto_27474 ?auto_27497 ) ) ( not ( = ?auto_27489 ?auto_27505 ) ) ( not ( = ?auto_27473 ?auto_27475 ) ) ( not ( = ?auto_27473 ?auto_27503 ) ) ( not ( = ?auto_27475 ?auto_27497 ) ) ( not ( = ?auto_27486 ?auto_27507 ) ) ( not ( = ?auto_27490 ?auto_27505 ) ) ( not ( = ?auto_27503 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27476 ) ) ( not ( = ?auto_27473 ?auto_27498 ) ) ( not ( = ?auto_27474 ?auto_27476 ) ) ( not ( = ?auto_27474 ?auto_27498 ) ) ( not ( = ?auto_27476 ?auto_27503 ) ) ( not ( = ?auto_27476 ?auto_27497 ) ) ( not ( = ?auto_27516 ?auto_27486 ) ) ( not ( = ?auto_27516 ?auto_27507 ) ) ( not ( = ?auto_27512 ?auto_27490 ) ) ( not ( = ?auto_27512 ?auto_27505 ) ) ( not ( = ?auto_27498 ?auto_27503 ) ) ( not ( = ?auto_27498 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27477 ) ) ( not ( = ?auto_27473 ?auto_27492 ) ) ( not ( = ?auto_27474 ?auto_27477 ) ) ( not ( = ?auto_27474 ?auto_27492 ) ) ( not ( = ?auto_27475 ?auto_27477 ) ) ( not ( = ?auto_27475 ?auto_27492 ) ) ( not ( = ?auto_27477 ?auto_27498 ) ) ( not ( = ?auto_27477 ?auto_27503 ) ) ( not ( = ?auto_27477 ?auto_27497 ) ) ( not ( = ?auto_27509 ?auto_27516 ) ) ( not ( = ?auto_27509 ?auto_27486 ) ) ( not ( = ?auto_27509 ?auto_27507 ) ) ( not ( = ?auto_27508 ?auto_27512 ) ) ( not ( = ?auto_27508 ?auto_27490 ) ) ( not ( = ?auto_27508 ?auto_27505 ) ) ( not ( = ?auto_27492 ?auto_27498 ) ) ( not ( = ?auto_27492 ?auto_27503 ) ) ( not ( = ?auto_27492 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27478 ) ) ( not ( = ?auto_27473 ?auto_27504 ) ) ( not ( = ?auto_27474 ?auto_27478 ) ) ( not ( = ?auto_27474 ?auto_27504 ) ) ( not ( = ?auto_27475 ?auto_27478 ) ) ( not ( = ?auto_27475 ?auto_27504 ) ) ( not ( = ?auto_27476 ?auto_27478 ) ) ( not ( = ?auto_27476 ?auto_27504 ) ) ( not ( = ?auto_27478 ?auto_27492 ) ) ( not ( = ?auto_27478 ?auto_27498 ) ) ( not ( = ?auto_27478 ?auto_27503 ) ) ( not ( = ?auto_27478 ?auto_27497 ) ) ( not ( = ?auto_27504 ?auto_27492 ) ) ( not ( = ?auto_27504 ?auto_27498 ) ) ( not ( = ?auto_27504 ?auto_27503 ) ) ( not ( = ?auto_27504 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27479 ) ) ( not ( = ?auto_27473 ?auto_27491 ) ) ( not ( = ?auto_27474 ?auto_27479 ) ) ( not ( = ?auto_27474 ?auto_27491 ) ) ( not ( = ?auto_27475 ?auto_27479 ) ) ( not ( = ?auto_27475 ?auto_27491 ) ) ( not ( = ?auto_27476 ?auto_27479 ) ) ( not ( = ?auto_27476 ?auto_27491 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27491 ) ) ( not ( = ?auto_27479 ?auto_27504 ) ) ( not ( = ?auto_27479 ?auto_27492 ) ) ( not ( = ?auto_27479 ?auto_27498 ) ) ( not ( = ?auto_27479 ?auto_27503 ) ) ( not ( = ?auto_27479 ?auto_27497 ) ) ( not ( = ?auto_27494 ?auto_27509 ) ) ( not ( = ?auto_27494 ?auto_27516 ) ) ( not ( = ?auto_27494 ?auto_27486 ) ) ( not ( = ?auto_27494 ?auto_27507 ) ) ( not ( = ?auto_27493 ?auto_27508 ) ) ( not ( = ?auto_27493 ?auto_27512 ) ) ( not ( = ?auto_27493 ?auto_27490 ) ) ( not ( = ?auto_27493 ?auto_27505 ) ) ( not ( = ?auto_27491 ?auto_27504 ) ) ( not ( = ?auto_27491 ?auto_27492 ) ) ( not ( = ?auto_27491 ?auto_27498 ) ) ( not ( = ?auto_27491 ?auto_27503 ) ) ( not ( = ?auto_27491 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27480 ) ) ( not ( = ?auto_27473 ?auto_27495 ) ) ( not ( = ?auto_27474 ?auto_27480 ) ) ( not ( = ?auto_27474 ?auto_27495 ) ) ( not ( = ?auto_27475 ?auto_27480 ) ) ( not ( = ?auto_27475 ?auto_27495 ) ) ( not ( = ?auto_27476 ?auto_27480 ) ) ( not ( = ?auto_27476 ?auto_27495 ) ) ( not ( = ?auto_27477 ?auto_27480 ) ) ( not ( = ?auto_27477 ?auto_27495 ) ) ( not ( = ?auto_27478 ?auto_27480 ) ) ( not ( = ?auto_27478 ?auto_27495 ) ) ( not ( = ?auto_27480 ?auto_27491 ) ) ( not ( = ?auto_27480 ?auto_27504 ) ) ( not ( = ?auto_27480 ?auto_27492 ) ) ( not ( = ?auto_27480 ?auto_27498 ) ) ( not ( = ?auto_27480 ?auto_27503 ) ) ( not ( = ?auto_27480 ?auto_27497 ) ) ( not ( = ?auto_27502 ?auto_27494 ) ) ( not ( = ?auto_27502 ?auto_27509 ) ) ( not ( = ?auto_27502 ?auto_27516 ) ) ( not ( = ?auto_27502 ?auto_27486 ) ) ( not ( = ?auto_27502 ?auto_27507 ) ) ( not ( = ?auto_27513 ?auto_27493 ) ) ( not ( = ?auto_27513 ?auto_27508 ) ) ( not ( = ?auto_27513 ?auto_27512 ) ) ( not ( = ?auto_27513 ?auto_27490 ) ) ( not ( = ?auto_27513 ?auto_27505 ) ) ( not ( = ?auto_27495 ?auto_27491 ) ) ( not ( = ?auto_27495 ?auto_27504 ) ) ( not ( = ?auto_27495 ?auto_27492 ) ) ( not ( = ?auto_27495 ?auto_27498 ) ) ( not ( = ?auto_27495 ?auto_27503 ) ) ( not ( = ?auto_27495 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27481 ) ) ( not ( = ?auto_27473 ?auto_27506 ) ) ( not ( = ?auto_27474 ?auto_27481 ) ) ( not ( = ?auto_27474 ?auto_27506 ) ) ( not ( = ?auto_27475 ?auto_27481 ) ) ( not ( = ?auto_27475 ?auto_27506 ) ) ( not ( = ?auto_27476 ?auto_27481 ) ) ( not ( = ?auto_27476 ?auto_27506 ) ) ( not ( = ?auto_27477 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27506 ) ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27506 ) ) ( not ( = ?auto_27479 ?auto_27481 ) ) ( not ( = ?auto_27479 ?auto_27506 ) ) ( not ( = ?auto_27481 ?auto_27495 ) ) ( not ( = ?auto_27481 ?auto_27491 ) ) ( not ( = ?auto_27481 ?auto_27504 ) ) ( not ( = ?auto_27481 ?auto_27492 ) ) ( not ( = ?auto_27481 ?auto_27498 ) ) ( not ( = ?auto_27481 ?auto_27503 ) ) ( not ( = ?auto_27481 ?auto_27497 ) ) ( not ( = ?auto_27499 ?auto_27502 ) ) ( not ( = ?auto_27499 ?auto_27494 ) ) ( not ( = ?auto_27499 ?auto_27509 ) ) ( not ( = ?auto_27499 ?auto_27516 ) ) ( not ( = ?auto_27499 ?auto_27486 ) ) ( not ( = ?auto_27499 ?auto_27507 ) ) ( not ( = ?auto_27514 ?auto_27513 ) ) ( not ( = ?auto_27514 ?auto_27493 ) ) ( not ( = ?auto_27514 ?auto_27508 ) ) ( not ( = ?auto_27514 ?auto_27512 ) ) ( not ( = ?auto_27514 ?auto_27490 ) ) ( not ( = ?auto_27514 ?auto_27505 ) ) ( not ( = ?auto_27506 ?auto_27495 ) ) ( not ( = ?auto_27506 ?auto_27491 ) ) ( not ( = ?auto_27506 ?auto_27504 ) ) ( not ( = ?auto_27506 ?auto_27492 ) ) ( not ( = ?auto_27506 ?auto_27498 ) ) ( not ( = ?auto_27506 ?auto_27503 ) ) ( not ( = ?auto_27506 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27482 ) ) ( not ( = ?auto_27473 ?auto_27501 ) ) ( not ( = ?auto_27474 ?auto_27482 ) ) ( not ( = ?auto_27474 ?auto_27501 ) ) ( not ( = ?auto_27475 ?auto_27482 ) ) ( not ( = ?auto_27475 ?auto_27501 ) ) ( not ( = ?auto_27476 ?auto_27482 ) ) ( not ( = ?auto_27476 ?auto_27501 ) ) ( not ( = ?auto_27477 ?auto_27482 ) ) ( not ( = ?auto_27477 ?auto_27501 ) ) ( not ( = ?auto_27478 ?auto_27482 ) ) ( not ( = ?auto_27478 ?auto_27501 ) ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27501 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27501 ) ) ( not ( = ?auto_27482 ?auto_27506 ) ) ( not ( = ?auto_27482 ?auto_27495 ) ) ( not ( = ?auto_27482 ?auto_27491 ) ) ( not ( = ?auto_27482 ?auto_27504 ) ) ( not ( = ?auto_27482 ?auto_27492 ) ) ( not ( = ?auto_27482 ?auto_27498 ) ) ( not ( = ?auto_27482 ?auto_27503 ) ) ( not ( = ?auto_27482 ?auto_27497 ) ) ( not ( = ?auto_27496 ?auto_27499 ) ) ( not ( = ?auto_27496 ?auto_27502 ) ) ( not ( = ?auto_27496 ?auto_27494 ) ) ( not ( = ?auto_27496 ?auto_27509 ) ) ( not ( = ?auto_27496 ?auto_27516 ) ) ( not ( = ?auto_27496 ?auto_27486 ) ) ( not ( = ?auto_27496 ?auto_27507 ) ) ( not ( = ?auto_27500 ?auto_27514 ) ) ( not ( = ?auto_27500 ?auto_27513 ) ) ( not ( = ?auto_27500 ?auto_27493 ) ) ( not ( = ?auto_27500 ?auto_27508 ) ) ( not ( = ?auto_27500 ?auto_27512 ) ) ( not ( = ?auto_27500 ?auto_27490 ) ) ( not ( = ?auto_27500 ?auto_27505 ) ) ( not ( = ?auto_27501 ?auto_27506 ) ) ( not ( = ?auto_27501 ?auto_27495 ) ) ( not ( = ?auto_27501 ?auto_27491 ) ) ( not ( = ?auto_27501 ?auto_27504 ) ) ( not ( = ?auto_27501 ?auto_27492 ) ) ( not ( = ?auto_27501 ?auto_27498 ) ) ( not ( = ?auto_27501 ?auto_27503 ) ) ( not ( = ?auto_27501 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27483 ) ) ( not ( = ?auto_27473 ?auto_27515 ) ) ( not ( = ?auto_27474 ?auto_27483 ) ) ( not ( = ?auto_27474 ?auto_27515 ) ) ( not ( = ?auto_27475 ?auto_27483 ) ) ( not ( = ?auto_27475 ?auto_27515 ) ) ( not ( = ?auto_27476 ?auto_27483 ) ) ( not ( = ?auto_27476 ?auto_27515 ) ) ( not ( = ?auto_27477 ?auto_27483 ) ) ( not ( = ?auto_27477 ?auto_27515 ) ) ( not ( = ?auto_27478 ?auto_27483 ) ) ( not ( = ?auto_27478 ?auto_27515 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27479 ?auto_27515 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27515 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27515 ) ) ( not ( = ?auto_27483 ?auto_27501 ) ) ( not ( = ?auto_27483 ?auto_27506 ) ) ( not ( = ?auto_27483 ?auto_27495 ) ) ( not ( = ?auto_27483 ?auto_27491 ) ) ( not ( = ?auto_27483 ?auto_27504 ) ) ( not ( = ?auto_27483 ?auto_27492 ) ) ( not ( = ?auto_27483 ?auto_27498 ) ) ( not ( = ?auto_27483 ?auto_27503 ) ) ( not ( = ?auto_27483 ?auto_27497 ) ) ( not ( = ?auto_27511 ?auto_27496 ) ) ( not ( = ?auto_27511 ?auto_27499 ) ) ( not ( = ?auto_27511 ?auto_27502 ) ) ( not ( = ?auto_27511 ?auto_27494 ) ) ( not ( = ?auto_27511 ?auto_27509 ) ) ( not ( = ?auto_27511 ?auto_27516 ) ) ( not ( = ?auto_27511 ?auto_27486 ) ) ( not ( = ?auto_27511 ?auto_27507 ) ) ( not ( = ?auto_27510 ?auto_27500 ) ) ( not ( = ?auto_27510 ?auto_27514 ) ) ( not ( = ?auto_27510 ?auto_27513 ) ) ( not ( = ?auto_27510 ?auto_27493 ) ) ( not ( = ?auto_27510 ?auto_27508 ) ) ( not ( = ?auto_27510 ?auto_27512 ) ) ( not ( = ?auto_27510 ?auto_27490 ) ) ( not ( = ?auto_27510 ?auto_27505 ) ) ( not ( = ?auto_27515 ?auto_27501 ) ) ( not ( = ?auto_27515 ?auto_27506 ) ) ( not ( = ?auto_27515 ?auto_27495 ) ) ( not ( = ?auto_27515 ?auto_27491 ) ) ( not ( = ?auto_27515 ?auto_27504 ) ) ( not ( = ?auto_27515 ?auto_27492 ) ) ( not ( = ?auto_27515 ?auto_27498 ) ) ( not ( = ?auto_27515 ?auto_27503 ) ) ( not ( = ?auto_27515 ?auto_27497 ) ) ( not ( = ?auto_27473 ?auto_27484 ) ) ( not ( = ?auto_27473 ?auto_27487 ) ) ( not ( = ?auto_27474 ?auto_27484 ) ) ( not ( = ?auto_27474 ?auto_27487 ) ) ( not ( = ?auto_27475 ?auto_27484 ) ) ( not ( = ?auto_27475 ?auto_27487 ) ) ( not ( = ?auto_27476 ?auto_27484 ) ) ( not ( = ?auto_27476 ?auto_27487 ) ) ( not ( = ?auto_27477 ?auto_27484 ) ) ( not ( = ?auto_27477 ?auto_27487 ) ) ( not ( = ?auto_27478 ?auto_27484 ) ) ( not ( = ?auto_27478 ?auto_27487 ) ) ( not ( = ?auto_27479 ?auto_27484 ) ) ( not ( = ?auto_27479 ?auto_27487 ) ) ( not ( = ?auto_27480 ?auto_27484 ) ) ( not ( = ?auto_27480 ?auto_27487 ) ) ( not ( = ?auto_27481 ?auto_27484 ) ) ( not ( = ?auto_27481 ?auto_27487 ) ) ( not ( = ?auto_27482 ?auto_27484 ) ) ( not ( = ?auto_27482 ?auto_27487 ) ) ( not ( = ?auto_27484 ?auto_27515 ) ) ( not ( = ?auto_27484 ?auto_27501 ) ) ( not ( = ?auto_27484 ?auto_27506 ) ) ( not ( = ?auto_27484 ?auto_27495 ) ) ( not ( = ?auto_27484 ?auto_27491 ) ) ( not ( = ?auto_27484 ?auto_27504 ) ) ( not ( = ?auto_27484 ?auto_27492 ) ) ( not ( = ?auto_27484 ?auto_27498 ) ) ( not ( = ?auto_27484 ?auto_27503 ) ) ( not ( = ?auto_27484 ?auto_27497 ) ) ( not ( = ?auto_27487 ?auto_27515 ) ) ( not ( = ?auto_27487 ?auto_27501 ) ) ( not ( = ?auto_27487 ?auto_27506 ) ) ( not ( = ?auto_27487 ?auto_27495 ) ) ( not ( = ?auto_27487 ?auto_27491 ) ) ( not ( = ?auto_27487 ?auto_27504 ) ) ( not ( = ?auto_27487 ?auto_27492 ) ) ( not ( = ?auto_27487 ?auto_27498 ) ) ( not ( = ?auto_27487 ?auto_27503 ) ) ( not ( = ?auto_27487 ?auto_27497 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27473 ?auto_27474 ?auto_27475 ?auto_27476 ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 )
      ( MAKE-1CRATE ?auto_27483 ?auto_27484 )
      ( MAKE-11CRATE-VERIFY ?auto_27473 ?auto_27474 ?auto_27475 ?auto_27476 ?auto_27477 ?auto_27478 ?auto_27479 ?auto_27480 ?auto_27481 ?auto_27482 ?auto_27483 ?auto_27484 ) )
  )

  ( :method MAKE-12CRATE
    :parameters
    (
      ?auto_27540 - SURFACE
      ?auto_27541 - SURFACE
      ?auto_27542 - SURFACE
      ?auto_27543 - SURFACE
      ?auto_27544 - SURFACE
      ?auto_27545 - SURFACE
      ?auto_27546 - SURFACE
      ?auto_27547 - SURFACE
      ?auto_27548 - SURFACE
      ?auto_27549 - SURFACE
      ?auto_27550 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27552 - SURFACE
    )
    :vars
    (
      ?auto_27556 - HOIST
      ?auto_27555 - PLACE
      ?auto_27557 - PLACE
      ?auto_27554 - HOIST
      ?auto_27558 - SURFACE
      ?auto_27561 - PLACE
      ?auto_27560 - HOIST
      ?auto_27578 - SURFACE
      ?auto_27568 - PLACE
      ?auto_27569 - HOIST
      ?auto_27573 - SURFACE
      ?auto_27584 - PLACE
      ?auto_27564 - HOIST
      ?auto_27563 - SURFACE
      ?auto_27585 - PLACE
      ?auto_27577 - HOIST
      ?auto_27579 - SURFACE
      ?auto_27565 - PLACE
      ?auto_27576 - HOIST
      ?auto_27580 - SURFACE
      ?auto_27581 - PLACE
      ?auto_27574 - HOIST
      ?auto_27582 - SURFACE
      ?auto_27583 - SURFACE
      ?auto_27559 - SURFACE
      ?auto_27567 - PLACE
      ?auto_27562 - HOIST
      ?auto_27572 - SURFACE
      ?auto_27571 - SURFACE
      ?auto_27575 - PLACE
      ?auto_27570 - HOIST
      ?auto_27566 - SURFACE
      ?auto_27553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27556 ?auto_27555 ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27557 ?auto_27555 ) ) ( HOIST-AT ?auto_27554 ?auto_27557 ) ( SURFACE-AT ?auto_27552 ?auto_27557 ) ( ON ?auto_27552 ?auto_27558 ) ( CLEAR ?auto_27552 ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27558 ) ) ( not ( = ?auto_27552 ?auto_27558 ) ) ( not ( = ?auto_27556 ?auto_27554 ) ) ( IS-CRATE ?auto_27551 ) ( not ( = ?auto_27561 ?auto_27555 ) ) ( HOIST-AT ?auto_27560 ?auto_27561 ) ( SURFACE-AT ?auto_27551 ?auto_27561 ) ( ON ?auto_27551 ?auto_27578 ) ( CLEAR ?auto_27551 ) ( not ( = ?auto_27550 ?auto_27551 ) ) ( not ( = ?auto_27550 ?auto_27578 ) ) ( not ( = ?auto_27551 ?auto_27578 ) ) ( not ( = ?auto_27556 ?auto_27560 ) ) ( IS-CRATE ?auto_27550 ) ( not ( = ?auto_27568 ?auto_27555 ) ) ( HOIST-AT ?auto_27569 ?auto_27568 ) ( AVAILABLE ?auto_27569 ) ( SURFACE-AT ?auto_27550 ?auto_27568 ) ( ON ?auto_27550 ?auto_27573 ) ( CLEAR ?auto_27550 ) ( not ( = ?auto_27549 ?auto_27550 ) ) ( not ( = ?auto_27549 ?auto_27573 ) ) ( not ( = ?auto_27550 ?auto_27573 ) ) ( not ( = ?auto_27556 ?auto_27569 ) ) ( IS-CRATE ?auto_27549 ) ( not ( = ?auto_27584 ?auto_27555 ) ) ( HOIST-AT ?auto_27564 ?auto_27584 ) ( AVAILABLE ?auto_27564 ) ( SURFACE-AT ?auto_27549 ?auto_27584 ) ( ON ?auto_27549 ?auto_27563 ) ( CLEAR ?auto_27549 ) ( not ( = ?auto_27548 ?auto_27549 ) ) ( not ( = ?auto_27548 ?auto_27563 ) ) ( not ( = ?auto_27549 ?auto_27563 ) ) ( not ( = ?auto_27556 ?auto_27564 ) ) ( IS-CRATE ?auto_27548 ) ( not ( = ?auto_27585 ?auto_27555 ) ) ( HOIST-AT ?auto_27577 ?auto_27585 ) ( AVAILABLE ?auto_27577 ) ( SURFACE-AT ?auto_27548 ?auto_27585 ) ( ON ?auto_27548 ?auto_27579 ) ( CLEAR ?auto_27548 ) ( not ( = ?auto_27547 ?auto_27548 ) ) ( not ( = ?auto_27547 ?auto_27579 ) ) ( not ( = ?auto_27548 ?auto_27579 ) ) ( not ( = ?auto_27556 ?auto_27577 ) ) ( IS-CRATE ?auto_27547 ) ( not ( = ?auto_27565 ?auto_27555 ) ) ( HOIST-AT ?auto_27576 ?auto_27565 ) ( AVAILABLE ?auto_27576 ) ( SURFACE-AT ?auto_27547 ?auto_27565 ) ( ON ?auto_27547 ?auto_27580 ) ( CLEAR ?auto_27547 ) ( not ( = ?auto_27546 ?auto_27547 ) ) ( not ( = ?auto_27546 ?auto_27580 ) ) ( not ( = ?auto_27547 ?auto_27580 ) ) ( not ( = ?auto_27556 ?auto_27576 ) ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27581 ?auto_27555 ) ) ( HOIST-AT ?auto_27574 ?auto_27581 ) ( AVAILABLE ?auto_27574 ) ( SURFACE-AT ?auto_27546 ?auto_27581 ) ( ON ?auto_27546 ?auto_27582 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27582 ) ) ( not ( = ?auto_27546 ?auto_27582 ) ) ( not ( = ?auto_27556 ?auto_27574 ) ) ( IS-CRATE ?auto_27545 ) ( SURFACE-AT ?auto_27545 ?auto_27557 ) ( ON ?auto_27545 ?auto_27583 ) ( CLEAR ?auto_27545 ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27583 ) ) ( not ( = ?auto_27545 ?auto_27583 ) ) ( IS-CRATE ?auto_27544 ) ( AVAILABLE ?auto_27554 ) ( SURFACE-AT ?auto_27544 ?auto_27557 ) ( ON ?auto_27544 ?auto_27559 ) ( CLEAR ?auto_27544 ) ( not ( = ?auto_27543 ?auto_27544 ) ) ( not ( = ?auto_27543 ?auto_27559 ) ) ( not ( = ?auto_27544 ?auto_27559 ) ) ( IS-CRATE ?auto_27543 ) ( not ( = ?auto_27567 ?auto_27555 ) ) ( HOIST-AT ?auto_27562 ?auto_27567 ) ( AVAILABLE ?auto_27562 ) ( SURFACE-AT ?auto_27543 ?auto_27567 ) ( ON ?auto_27543 ?auto_27572 ) ( CLEAR ?auto_27543 ) ( not ( = ?auto_27542 ?auto_27543 ) ) ( not ( = ?auto_27542 ?auto_27572 ) ) ( not ( = ?auto_27543 ?auto_27572 ) ) ( not ( = ?auto_27556 ?auto_27562 ) ) ( IS-CRATE ?auto_27542 ) ( AVAILABLE ?auto_27560 ) ( SURFACE-AT ?auto_27542 ?auto_27561 ) ( ON ?auto_27542 ?auto_27571 ) ( CLEAR ?auto_27542 ) ( not ( = ?auto_27541 ?auto_27542 ) ) ( not ( = ?auto_27541 ?auto_27571 ) ) ( not ( = ?auto_27542 ?auto_27571 ) ) ( SURFACE-AT ?auto_27540 ?auto_27555 ) ( CLEAR ?auto_27540 ) ( IS-CRATE ?auto_27541 ) ( AVAILABLE ?auto_27556 ) ( not ( = ?auto_27575 ?auto_27555 ) ) ( HOIST-AT ?auto_27570 ?auto_27575 ) ( AVAILABLE ?auto_27570 ) ( SURFACE-AT ?auto_27541 ?auto_27575 ) ( ON ?auto_27541 ?auto_27566 ) ( CLEAR ?auto_27541 ) ( TRUCK-AT ?auto_27553 ?auto_27555 ) ( not ( = ?auto_27540 ?auto_27541 ) ) ( not ( = ?auto_27540 ?auto_27566 ) ) ( not ( = ?auto_27541 ?auto_27566 ) ) ( not ( = ?auto_27556 ?auto_27570 ) ) ( not ( = ?auto_27540 ?auto_27542 ) ) ( not ( = ?auto_27540 ?auto_27571 ) ) ( not ( = ?auto_27542 ?auto_27566 ) ) ( not ( = ?auto_27561 ?auto_27575 ) ) ( not ( = ?auto_27560 ?auto_27570 ) ) ( not ( = ?auto_27571 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27543 ) ) ( not ( = ?auto_27540 ?auto_27572 ) ) ( not ( = ?auto_27541 ?auto_27543 ) ) ( not ( = ?auto_27541 ?auto_27572 ) ) ( not ( = ?auto_27543 ?auto_27571 ) ) ( not ( = ?auto_27543 ?auto_27566 ) ) ( not ( = ?auto_27567 ?auto_27561 ) ) ( not ( = ?auto_27567 ?auto_27575 ) ) ( not ( = ?auto_27562 ?auto_27560 ) ) ( not ( = ?auto_27562 ?auto_27570 ) ) ( not ( = ?auto_27572 ?auto_27571 ) ) ( not ( = ?auto_27572 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27544 ) ) ( not ( = ?auto_27540 ?auto_27559 ) ) ( not ( = ?auto_27541 ?auto_27544 ) ) ( not ( = ?auto_27541 ?auto_27559 ) ) ( not ( = ?auto_27542 ?auto_27544 ) ) ( not ( = ?auto_27542 ?auto_27559 ) ) ( not ( = ?auto_27544 ?auto_27572 ) ) ( not ( = ?auto_27544 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27566 ) ) ( not ( = ?auto_27557 ?auto_27567 ) ) ( not ( = ?auto_27557 ?auto_27561 ) ) ( not ( = ?auto_27557 ?auto_27575 ) ) ( not ( = ?auto_27554 ?auto_27562 ) ) ( not ( = ?auto_27554 ?auto_27560 ) ) ( not ( = ?auto_27554 ?auto_27570 ) ) ( not ( = ?auto_27559 ?auto_27572 ) ) ( not ( = ?auto_27559 ?auto_27571 ) ) ( not ( = ?auto_27559 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27545 ) ) ( not ( = ?auto_27540 ?auto_27583 ) ) ( not ( = ?auto_27541 ?auto_27545 ) ) ( not ( = ?auto_27541 ?auto_27583 ) ) ( not ( = ?auto_27542 ?auto_27545 ) ) ( not ( = ?auto_27542 ?auto_27583 ) ) ( not ( = ?auto_27543 ?auto_27545 ) ) ( not ( = ?auto_27543 ?auto_27583 ) ) ( not ( = ?auto_27545 ?auto_27559 ) ) ( not ( = ?auto_27545 ?auto_27572 ) ) ( not ( = ?auto_27545 ?auto_27571 ) ) ( not ( = ?auto_27545 ?auto_27566 ) ) ( not ( = ?auto_27583 ?auto_27559 ) ) ( not ( = ?auto_27583 ?auto_27572 ) ) ( not ( = ?auto_27583 ?auto_27571 ) ) ( not ( = ?auto_27583 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27546 ) ) ( not ( = ?auto_27540 ?auto_27582 ) ) ( not ( = ?auto_27541 ?auto_27546 ) ) ( not ( = ?auto_27541 ?auto_27582 ) ) ( not ( = ?auto_27542 ?auto_27546 ) ) ( not ( = ?auto_27542 ?auto_27582 ) ) ( not ( = ?auto_27543 ?auto_27546 ) ) ( not ( = ?auto_27543 ?auto_27582 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27582 ) ) ( not ( = ?auto_27546 ?auto_27583 ) ) ( not ( = ?auto_27546 ?auto_27559 ) ) ( not ( = ?auto_27546 ?auto_27572 ) ) ( not ( = ?auto_27546 ?auto_27571 ) ) ( not ( = ?auto_27546 ?auto_27566 ) ) ( not ( = ?auto_27581 ?auto_27557 ) ) ( not ( = ?auto_27581 ?auto_27567 ) ) ( not ( = ?auto_27581 ?auto_27561 ) ) ( not ( = ?auto_27581 ?auto_27575 ) ) ( not ( = ?auto_27574 ?auto_27554 ) ) ( not ( = ?auto_27574 ?auto_27562 ) ) ( not ( = ?auto_27574 ?auto_27560 ) ) ( not ( = ?auto_27574 ?auto_27570 ) ) ( not ( = ?auto_27582 ?auto_27583 ) ) ( not ( = ?auto_27582 ?auto_27559 ) ) ( not ( = ?auto_27582 ?auto_27572 ) ) ( not ( = ?auto_27582 ?auto_27571 ) ) ( not ( = ?auto_27582 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27547 ) ) ( not ( = ?auto_27540 ?auto_27580 ) ) ( not ( = ?auto_27541 ?auto_27547 ) ) ( not ( = ?auto_27541 ?auto_27580 ) ) ( not ( = ?auto_27542 ?auto_27547 ) ) ( not ( = ?auto_27542 ?auto_27580 ) ) ( not ( = ?auto_27543 ?auto_27547 ) ) ( not ( = ?auto_27543 ?auto_27580 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27580 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27580 ) ) ( not ( = ?auto_27547 ?auto_27582 ) ) ( not ( = ?auto_27547 ?auto_27583 ) ) ( not ( = ?auto_27547 ?auto_27559 ) ) ( not ( = ?auto_27547 ?auto_27572 ) ) ( not ( = ?auto_27547 ?auto_27571 ) ) ( not ( = ?auto_27547 ?auto_27566 ) ) ( not ( = ?auto_27565 ?auto_27581 ) ) ( not ( = ?auto_27565 ?auto_27557 ) ) ( not ( = ?auto_27565 ?auto_27567 ) ) ( not ( = ?auto_27565 ?auto_27561 ) ) ( not ( = ?auto_27565 ?auto_27575 ) ) ( not ( = ?auto_27576 ?auto_27574 ) ) ( not ( = ?auto_27576 ?auto_27554 ) ) ( not ( = ?auto_27576 ?auto_27562 ) ) ( not ( = ?auto_27576 ?auto_27560 ) ) ( not ( = ?auto_27576 ?auto_27570 ) ) ( not ( = ?auto_27580 ?auto_27582 ) ) ( not ( = ?auto_27580 ?auto_27583 ) ) ( not ( = ?auto_27580 ?auto_27559 ) ) ( not ( = ?auto_27580 ?auto_27572 ) ) ( not ( = ?auto_27580 ?auto_27571 ) ) ( not ( = ?auto_27580 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27548 ) ) ( not ( = ?auto_27540 ?auto_27579 ) ) ( not ( = ?auto_27541 ?auto_27548 ) ) ( not ( = ?auto_27541 ?auto_27579 ) ) ( not ( = ?auto_27542 ?auto_27548 ) ) ( not ( = ?auto_27542 ?auto_27579 ) ) ( not ( = ?auto_27543 ?auto_27548 ) ) ( not ( = ?auto_27543 ?auto_27579 ) ) ( not ( = ?auto_27544 ?auto_27548 ) ) ( not ( = ?auto_27544 ?auto_27579 ) ) ( not ( = ?auto_27545 ?auto_27548 ) ) ( not ( = ?auto_27545 ?auto_27579 ) ) ( not ( = ?auto_27546 ?auto_27548 ) ) ( not ( = ?auto_27546 ?auto_27579 ) ) ( not ( = ?auto_27548 ?auto_27580 ) ) ( not ( = ?auto_27548 ?auto_27582 ) ) ( not ( = ?auto_27548 ?auto_27583 ) ) ( not ( = ?auto_27548 ?auto_27559 ) ) ( not ( = ?auto_27548 ?auto_27572 ) ) ( not ( = ?auto_27548 ?auto_27571 ) ) ( not ( = ?auto_27548 ?auto_27566 ) ) ( not ( = ?auto_27585 ?auto_27565 ) ) ( not ( = ?auto_27585 ?auto_27581 ) ) ( not ( = ?auto_27585 ?auto_27557 ) ) ( not ( = ?auto_27585 ?auto_27567 ) ) ( not ( = ?auto_27585 ?auto_27561 ) ) ( not ( = ?auto_27585 ?auto_27575 ) ) ( not ( = ?auto_27577 ?auto_27576 ) ) ( not ( = ?auto_27577 ?auto_27574 ) ) ( not ( = ?auto_27577 ?auto_27554 ) ) ( not ( = ?auto_27577 ?auto_27562 ) ) ( not ( = ?auto_27577 ?auto_27560 ) ) ( not ( = ?auto_27577 ?auto_27570 ) ) ( not ( = ?auto_27579 ?auto_27580 ) ) ( not ( = ?auto_27579 ?auto_27582 ) ) ( not ( = ?auto_27579 ?auto_27583 ) ) ( not ( = ?auto_27579 ?auto_27559 ) ) ( not ( = ?auto_27579 ?auto_27572 ) ) ( not ( = ?auto_27579 ?auto_27571 ) ) ( not ( = ?auto_27579 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27549 ) ) ( not ( = ?auto_27540 ?auto_27563 ) ) ( not ( = ?auto_27541 ?auto_27549 ) ) ( not ( = ?auto_27541 ?auto_27563 ) ) ( not ( = ?auto_27542 ?auto_27549 ) ) ( not ( = ?auto_27542 ?auto_27563 ) ) ( not ( = ?auto_27543 ?auto_27549 ) ) ( not ( = ?auto_27543 ?auto_27563 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27563 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27563 ) ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27563 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27563 ) ) ( not ( = ?auto_27549 ?auto_27579 ) ) ( not ( = ?auto_27549 ?auto_27580 ) ) ( not ( = ?auto_27549 ?auto_27582 ) ) ( not ( = ?auto_27549 ?auto_27583 ) ) ( not ( = ?auto_27549 ?auto_27559 ) ) ( not ( = ?auto_27549 ?auto_27572 ) ) ( not ( = ?auto_27549 ?auto_27571 ) ) ( not ( = ?auto_27549 ?auto_27566 ) ) ( not ( = ?auto_27584 ?auto_27585 ) ) ( not ( = ?auto_27584 ?auto_27565 ) ) ( not ( = ?auto_27584 ?auto_27581 ) ) ( not ( = ?auto_27584 ?auto_27557 ) ) ( not ( = ?auto_27584 ?auto_27567 ) ) ( not ( = ?auto_27584 ?auto_27561 ) ) ( not ( = ?auto_27584 ?auto_27575 ) ) ( not ( = ?auto_27564 ?auto_27577 ) ) ( not ( = ?auto_27564 ?auto_27576 ) ) ( not ( = ?auto_27564 ?auto_27574 ) ) ( not ( = ?auto_27564 ?auto_27554 ) ) ( not ( = ?auto_27564 ?auto_27562 ) ) ( not ( = ?auto_27564 ?auto_27560 ) ) ( not ( = ?auto_27564 ?auto_27570 ) ) ( not ( = ?auto_27563 ?auto_27579 ) ) ( not ( = ?auto_27563 ?auto_27580 ) ) ( not ( = ?auto_27563 ?auto_27582 ) ) ( not ( = ?auto_27563 ?auto_27583 ) ) ( not ( = ?auto_27563 ?auto_27559 ) ) ( not ( = ?auto_27563 ?auto_27572 ) ) ( not ( = ?auto_27563 ?auto_27571 ) ) ( not ( = ?auto_27563 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27550 ) ) ( not ( = ?auto_27540 ?auto_27573 ) ) ( not ( = ?auto_27541 ?auto_27550 ) ) ( not ( = ?auto_27541 ?auto_27573 ) ) ( not ( = ?auto_27542 ?auto_27550 ) ) ( not ( = ?auto_27542 ?auto_27573 ) ) ( not ( = ?auto_27543 ?auto_27550 ) ) ( not ( = ?auto_27543 ?auto_27573 ) ) ( not ( = ?auto_27544 ?auto_27550 ) ) ( not ( = ?auto_27544 ?auto_27573 ) ) ( not ( = ?auto_27545 ?auto_27550 ) ) ( not ( = ?auto_27545 ?auto_27573 ) ) ( not ( = ?auto_27546 ?auto_27550 ) ) ( not ( = ?auto_27546 ?auto_27573 ) ) ( not ( = ?auto_27547 ?auto_27550 ) ) ( not ( = ?auto_27547 ?auto_27573 ) ) ( not ( = ?auto_27548 ?auto_27550 ) ) ( not ( = ?auto_27548 ?auto_27573 ) ) ( not ( = ?auto_27550 ?auto_27563 ) ) ( not ( = ?auto_27550 ?auto_27579 ) ) ( not ( = ?auto_27550 ?auto_27580 ) ) ( not ( = ?auto_27550 ?auto_27582 ) ) ( not ( = ?auto_27550 ?auto_27583 ) ) ( not ( = ?auto_27550 ?auto_27559 ) ) ( not ( = ?auto_27550 ?auto_27572 ) ) ( not ( = ?auto_27550 ?auto_27571 ) ) ( not ( = ?auto_27550 ?auto_27566 ) ) ( not ( = ?auto_27568 ?auto_27584 ) ) ( not ( = ?auto_27568 ?auto_27585 ) ) ( not ( = ?auto_27568 ?auto_27565 ) ) ( not ( = ?auto_27568 ?auto_27581 ) ) ( not ( = ?auto_27568 ?auto_27557 ) ) ( not ( = ?auto_27568 ?auto_27567 ) ) ( not ( = ?auto_27568 ?auto_27561 ) ) ( not ( = ?auto_27568 ?auto_27575 ) ) ( not ( = ?auto_27569 ?auto_27564 ) ) ( not ( = ?auto_27569 ?auto_27577 ) ) ( not ( = ?auto_27569 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27574 ) ) ( not ( = ?auto_27569 ?auto_27554 ) ) ( not ( = ?auto_27569 ?auto_27562 ) ) ( not ( = ?auto_27569 ?auto_27560 ) ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27573 ?auto_27563 ) ) ( not ( = ?auto_27573 ?auto_27579 ) ) ( not ( = ?auto_27573 ?auto_27580 ) ) ( not ( = ?auto_27573 ?auto_27582 ) ) ( not ( = ?auto_27573 ?auto_27583 ) ) ( not ( = ?auto_27573 ?auto_27559 ) ) ( not ( = ?auto_27573 ?auto_27572 ) ) ( not ( = ?auto_27573 ?auto_27571 ) ) ( not ( = ?auto_27573 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27551 ) ) ( not ( = ?auto_27540 ?auto_27578 ) ) ( not ( = ?auto_27541 ?auto_27551 ) ) ( not ( = ?auto_27541 ?auto_27578 ) ) ( not ( = ?auto_27542 ?auto_27551 ) ) ( not ( = ?auto_27542 ?auto_27578 ) ) ( not ( = ?auto_27543 ?auto_27551 ) ) ( not ( = ?auto_27543 ?auto_27578 ) ) ( not ( = ?auto_27544 ?auto_27551 ) ) ( not ( = ?auto_27544 ?auto_27578 ) ) ( not ( = ?auto_27545 ?auto_27551 ) ) ( not ( = ?auto_27545 ?auto_27578 ) ) ( not ( = ?auto_27546 ?auto_27551 ) ) ( not ( = ?auto_27546 ?auto_27578 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) ( not ( = ?auto_27547 ?auto_27578 ) ) ( not ( = ?auto_27548 ?auto_27551 ) ) ( not ( = ?auto_27548 ?auto_27578 ) ) ( not ( = ?auto_27549 ?auto_27551 ) ) ( not ( = ?auto_27549 ?auto_27578 ) ) ( not ( = ?auto_27551 ?auto_27573 ) ) ( not ( = ?auto_27551 ?auto_27563 ) ) ( not ( = ?auto_27551 ?auto_27579 ) ) ( not ( = ?auto_27551 ?auto_27580 ) ) ( not ( = ?auto_27551 ?auto_27582 ) ) ( not ( = ?auto_27551 ?auto_27583 ) ) ( not ( = ?auto_27551 ?auto_27559 ) ) ( not ( = ?auto_27551 ?auto_27572 ) ) ( not ( = ?auto_27551 ?auto_27571 ) ) ( not ( = ?auto_27551 ?auto_27566 ) ) ( not ( = ?auto_27578 ?auto_27573 ) ) ( not ( = ?auto_27578 ?auto_27563 ) ) ( not ( = ?auto_27578 ?auto_27579 ) ) ( not ( = ?auto_27578 ?auto_27580 ) ) ( not ( = ?auto_27578 ?auto_27582 ) ) ( not ( = ?auto_27578 ?auto_27583 ) ) ( not ( = ?auto_27578 ?auto_27559 ) ) ( not ( = ?auto_27578 ?auto_27572 ) ) ( not ( = ?auto_27578 ?auto_27571 ) ) ( not ( = ?auto_27578 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27552 ) ) ( not ( = ?auto_27540 ?auto_27558 ) ) ( not ( = ?auto_27541 ?auto_27552 ) ) ( not ( = ?auto_27541 ?auto_27558 ) ) ( not ( = ?auto_27542 ?auto_27552 ) ) ( not ( = ?auto_27542 ?auto_27558 ) ) ( not ( = ?auto_27543 ?auto_27552 ) ) ( not ( = ?auto_27543 ?auto_27558 ) ) ( not ( = ?auto_27544 ?auto_27552 ) ) ( not ( = ?auto_27544 ?auto_27558 ) ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27545 ?auto_27558 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27558 ) ) ( not ( = ?auto_27547 ?auto_27552 ) ) ( not ( = ?auto_27547 ?auto_27558 ) ) ( not ( = ?auto_27548 ?auto_27552 ) ) ( not ( = ?auto_27548 ?auto_27558 ) ) ( not ( = ?auto_27549 ?auto_27552 ) ) ( not ( = ?auto_27549 ?auto_27558 ) ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27558 ) ) ( not ( = ?auto_27552 ?auto_27578 ) ) ( not ( = ?auto_27552 ?auto_27573 ) ) ( not ( = ?auto_27552 ?auto_27563 ) ) ( not ( = ?auto_27552 ?auto_27579 ) ) ( not ( = ?auto_27552 ?auto_27580 ) ) ( not ( = ?auto_27552 ?auto_27582 ) ) ( not ( = ?auto_27552 ?auto_27583 ) ) ( not ( = ?auto_27552 ?auto_27559 ) ) ( not ( = ?auto_27552 ?auto_27572 ) ) ( not ( = ?auto_27552 ?auto_27571 ) ) ( not ( = ?auto_27552 ?auto_27566 ) ) ( not ( = ?auto_27558 ?auto_27578 ) ) ( not ( = ?auto_27558 ?auto_27573 ) ) ( not ( = ?auto_27558 ?auto_27563 ) ) ( not ( = ?auto_27558 ?auto_27579 ) ) ( not ( = ?auto_27558 ?auto_27580 ) ) ( not ( = ?auto_27558 ?auto_27582 ) ) ( not ( = ?auto_27558 ?auto_27583 ) ) ( not ( = ?auto_27558 ?auto_27559 ) ) ( not ( = ?auto_27558 ?auto_27572 ) ) ( not ( = ?auto_27558 ?auto_27571 ) ) ( not ( = ?auto_27558 ?auto_27566 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27540 ?auto_27541 ?auto_27542 ?auto_27543 ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27549 ?auto_27550 ?auto_27551 )
      ( MAKE-1CRATE ?auto_27551 ?auto_27552 )
      ( MAKE-12CRATE-VERIFY ?auto_27540 ?auto_27541 ?auto_27542 ?auto_27543 ?auto_27544 ?auto_27545 ?auto_27546 ?auto_27547 ?auto_27548 ?auto_27549 ?auto_27550 ?auto_27551 ?auto_27552 ) )
  )

  ( :method MAKE-13CRATE
    :parameters
    (
      ?auto_27610 - SURFACE
      ?auto_27611 - SURFACE
      ?auto_27612 - SURFACE
      ?auto_27613 - SURFACE
      ?auto_27614 - SURFACE
      ?auto_27615 - SURFACE
      ?auto_27616 - SURFACE
      ?auto_27617 - SURFACE
      ?auto_27618 - SURFACE
      ?auto_27619 - SURFACE
      ?auto_27620 - SURFACE
      ?auto_27621 - SURFACE
      ?auto_27622 - SURFACE
      ?auto_27623 - SURFACE
    )
    :vars
    (
      ?auto_27627 - HOIST
      ?auto_27629 - PLACE
      ?auto_27626 - PLACE
      ?auto_27625 - HOIST
      ?auto_27628 - SURFACE
      ?auto_27637 - PLACE
      ?auto_27653 - HOIST
      ?auto_27635 - SURFACE
      ?auto_27631 - PLACE
      ?auto_27639 - HOIST
      ?auto_27652 - SURFACE
      ?auto_27647 - PLACE
      ?auto_27657 - HOIST
      ?auto_27651 - SURFACE
      ?auto_27641 - PLACE
      ?auto_27646 - HOIST
      ?auto_27636 - SURFACE
      ?auto_27642 - PLACE
      ?auto_27654 - HOIST
      ?auto_27634 - SURFACE
      ?auto_27640 - PLACE
      ?auto_27644 - HOIST
      ?auto_27648 - SURFACE
      ?auto_27650 - PLACE
      ?auto_27638 - HOIST
      ?auto_27633 - SURFACE
      ?auto_27656 - SURFACE
      ?auto_27655 - SURFACE
      ?auto_27643 - PLACE
      ?auto_27632 - HOIST
      ?auto_27645 - SURFACE
      ?auto_27630 - SURFACE
      ?auto_27649 - SURFACE
      ?auto_27624 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27627 ?auto_27629 ) ( IS-CRATE ?auto_27623 ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( HOIST-AT ?auto_27625 ?auto_27626 ) ( SURFACE-AT ?auto_27623 ?auto_27626 ) ( ON ?auto_27623 ?auto_27628 ) ( CLEAR ?auto_27623 ) ( not ( = ?auto_27622 ?auto_27623 ) ) ( not ( = ?auto_27622 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27628 ) ) ( not ( = ?auto_27627 ?auto_27625 ) ) ( IS-CRATE ?auto_27622 ) ( not ( = ?auto_27637 ?auto_27629 ) ) ( HOIST-AT ?auto_27653 ?auto_27637 ) ( SURFACE-AT ?auto_27622 ?auto_27637 ) ( ON ?auto_27622 ?auto_27635 ) ( CLEAR ?auto_27622 ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27635 ) ) ( not ( = ?auto_27622 ?auto_27635 ) ) ( not ( = ?auto_27627 ?auto_27653 ) ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27631 ?auto_27629 ) ) ( HOIST-AT ?auto_27639 ?auto_27631 ) ( SURFACE-AT ?auto_27621 ?auto_27631 ) ( ON ?auto_27621 ?auto_27652 ) ( CLEAR ?auto_27621 ) ( not ( = ?auto_27620 ?auto_27621 ) ) ( not ( = ?auto_27620 ?auto_27652 ) ) ( not ( = ?auto_27621 ?auto_27652 ) ) ( not ( = ?auto_27627 ?auto_27639 ) ) ( IS-CRATE ?auto_27620 ) ( not ( = ?auto_27647 ?auto_27629 ) ) ( HOIST-AT ?auto_27657 ?auto_27647 ) ( AVAILABLE ?auto_27657 ) ( SURFACE-AT ?auto_27620 ?auto_27647 ) ( ON ?auto_27620 ?auto_27651 ) ( CLEAR ?auto_27620 ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27651 ) ) ( not ( = ?auto_27620 ?auto_27651 ) ) ( not ( = ?auto_27627 ?auto_27657 ) ) ( IS-CRATE ?auto_27619 ) ( not ( = ?auto_27641 ?auto_27629 ) ) ( HOIST-AT ?auto_27646 ?auto_27641 ) ( AVAILABLE ?auto_27646 ) ( SURFACE-AT ?auto_27619 ?auto_27641 ) ( ON ?auto_27619 ?auto_27636 ) ( CLEAR ?auto_27619 ) ( not ( = ?auto_27618 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27636 ) ) ( not ( = ?auto_27619 ?auto_27636 ) ) ( not ( = ?auto_27627 ?auto_27646 ) ) ( IS-CRATE ?auto_27618 ) ( not ( = ?auto_27642 ?auto_27629 ) ) ( HOIST-AT ?auto_27654 ?auto_27642 ) ( AVAILABLE ?auto_27654 ) ( SURFACE-AT ?auto_27618 ?auto_27642 ) ( ON ?auto_27618 ?auto_27634 ) ( CLEAR ?auto_27618 ) ( not ( = ?auto_27617 ?auto_27618 ) ) ( not ( = ?auto_27617 ?auto_27634 ) ) ( not ( = ?auto_27618 ?auto_27634 ) ) ( not ( = ?auto_27627 ?auto_27654 ) ) ( IS-CRATE ?auto_27617 ) ( not ( = ?auto_27640 ?auto_27629 ) ) ( HOIST-AT ?auto_27644 ?auto_27640 ) ( AVAILABLE ?auto_27644 ) ( SURFACE-AT ?auto_27617 ?auto_27640 ) ( ON ?auto_27617 ?auto_27648 ) ( CLEAR ?auto_27617 ) ( not ( = ?auto_27616 ?auto_27617 ) ) ( not ( = ?auto_27616 ?auto_27648 ) ) ( not ( = ?auto_27617 ?auto_27648 ) ) ( not ( = ?auto_27627 ?auto_27644 ) ) ( IS-CRATE ?auto_27616 ) ( not ( = ?auto_27650 ?auto_27629 ) ) ( HOIST-AT ?auto_27638 ?auto_27650 ) ( AVAILABLE ?auto_27638 ) ( SURFACE-AT ?auto_27616 ?auto_27650 ) ( ON ?auto_27616 ?auto_27633 ) ( CLEAR ?auto_27616 ) ( not ( = ?auto_27615 ?auto_27616 ) ) ( not ( = ?auto_27615 ?auto_27633 ) ) ( not ( = ?auto_27616 ?auto_27633 ) ) ( not ( = ?auto_27627 ?auto_27638 ) ) ( IS-CRATE ?auto_27615 ) ( SURFACE-AT ?auto_27615 ?auto_27637 ) ( ON ?auto_27615 ?auto_27656 ) ( CLEAR ?auto_27615 ) ( not ( = ?auto_27614 ?auto_27615 ) ) ( not ( = ?auto_27614 ?auto_27656 ) ) ( not ( = ?auto_27615 ?auto_27656 ) ) ( IS-CRATE ?auto_27614 ) ( AVAILABLE ?auto_27653 ) ( SURFACE-AT ?auto_27614 ?auto_27637 ) ( ON ?auto_27614 ?auto_27655 ) ( CLEAR ?auto_27614 ) ( not ( = ?auto_27613 ?auto_27614 ) ) ( not ( = ?auto_27613 ?auto_27655 ) ) ( not ( = ?auto_27614 ?auto_27655 ) ) ( IS-CRATE ?auto_27613 ) ( not ( = ?auto_27643 ?auto_27629 ) ) ( HOIST-AT ?auto_27632 ?auto_27643 ) ( AVAILABLE ?auto_27632 ) ( SURFACE-AT ?auto_27613 ?auto_27643 ) ( ON ?auto_27613 ?auto_27645 ) ( CLEAR ?auto_27613 ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27645 ) ) ( not ( = ?auto_27613 ?auto_27645 ) ) ( not ( = ?auto_27627 ?auto_27632 ) ) ( IS-CRATE ?auto_27612 ) ( AVAILABLE ?auto_27639 ) ( SURFACE-AT ?auto_27612 ?auto_27631 ) ( ON ?auto_27612 ?auto_27630 ) ( CLEAR ?auto_27612 ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( not ( = ?auto_27611 ?auto_27630 ) ) ( not ( = ?auto_27612 ?auto_27630 ) ) ( SURFACE-AT ?auto_27610 ?auto_27629 ) ( CLEAR ?auto_27610 ) ( IS-CRATE ?auto_27611 ) ( AVAILABLE ?auto_27627 ) ( AVAILABLE ?auto_27625 ) ( SURFACE-AT ?auto_27611 ?auto_27626 ) ( ON ?auto_27611 ?auto_27649 ) ( CLEAR ?auto_27611 ) ( TRUCK-AT ?auto_27624 ?auto_27629 ) ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27649 ) ) ( not ( = ?auto_27611 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27612 ) ) ( not ( = ?auto_27610 ?auto_27630 ) ) ( not ( = ?auto_27612 ?auto_27649 ) ) ( not ( = ?auto_27631 ?auto_27626 ) ) ( not ( = ?auto_27639 ?auto_27625 ) ) ( not ( = ?auto_27630 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27613 ) ) ( not ( = ?auto_27610 ?auto_27645 ) ) ( not ( = ?auto_27611 ?auto_27613 ) ) ( not ( = ?auto_27611 ?auto_27645 ) ) ( not ( = ?auto_27613 ?auto_27630 ) ) ( not ( = ?auto_27613 ?auto_27649 ) ) ( not ( = ?auto_27643 ?auto_27631 ) ) ( not ( = ?auto_27643 ?auto_27626 ) ) ( not ( = ?auto_27632 ?auto_27639 ) ) ( not ( = ?auto_27632 ?auto_27625 ) ) ( not ( = ?auto_27645 ?auto_27630 ) ) ( not ( = ?auto_27645 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27614 ) ) ( not ( = ?auto_27610 ?auto_27655 ) ) ( not ( = ?auto_27611 ?auto_27614 ) ) ( not ( = ?auto_27611 ?auto_27655 ) ) ( not ( = ?auto_27612 ?auto_27614 ) ) ( not ( = ?auto_27612 ?auto_27655 ) ) ( not ( = ?auto_27614 ?auto_27645 ) ) ( not ( = ?auto_27614 ?auto_27630 ) ) ( not ( = ?auto_27614 ?auto_27649 ) ) ( not ( = ?auto_27637 ?auto_27643 ) ) ( not ( = ?auto_27637 ?auto_27631 ) ) ( not ( = ?auto_27637 ?auto_27626 ) ) ( not ( = ?auto_27653 ?auto_27632 ) ) ( not ( = ?auto_27653 ?auto_27639 ) ) ( not ( = ?auto_27653 ?auto_27625 ) ) ( not ( = ?auto_27655 ?auto_27645 ) ) ( not ( = ?auto_27655 ?auto_27630 ) ) ( not ( = ?auto_27655 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27615 ) ) ( not ( = ?auto_27610 ?auto_27656 ) ) ( not ( = ?auto_27611 ?auto_27615 ) ) ( not ( = ?auto_27611 ?auto_27656 ) ) ( not ( = ?auto_27612 ?auto_27615 ) ) ( not ( = ?auto_27612 ?auto_27656 ) ) ( not ( = ?auto_27613 ?auto_27615 ) ) ( not ( = ?auto_27613 ?auto_27656 ) ) ( not ( = ?auto_27615 ?auto_27655 ) ) ( not ( = ?auto_27615 ?auto_27645 ) ) ( not ( = ?auto_27615 ?auto_27630 ) ) ( not ( = ?auto_27615 ?auto_27649 ) ) ( not ( = ?auto_27656 ?auto_27655 ) ) ( not ( = ?auto_27656 ?auto_27645 ) ) ( not ( = ?auto_27656 ?auto_27630 ) ) ( not ( = ?auto_27656 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27616 ) ) ( not ( = ?auto_27610 ?auto_27633 ) ) ( not ( = ?auto_27611 ?auto_27616 ) ) ( not ( = ?auto_27611 ?auto_27633 ) ) ( not ( = ?auto_27612 ?auto_27616 ) ) ( not ( = ?auto_27612 ?auto_27633 ) ) ( not ( = ?auto_27613 ?auto_27616 ) ) ( not ( = ?auto_27613 ?auto_27633 ) ) ( not ( = ?auto_27614 ?auto_27616 ) ) ( not ( = ?auto_27614 ?auto_27633 ) ) ( not ( = ?auto_27616 ?auto_27656 ) ) ( not ( = ?auto_27616 ?auto_27655 ) ) ( not ( = ?auto_27616 ?auto_27645 ) ) ( not ( = ?auto_27616 ?auto_27630 ) ) ( not ( = ?auto_27616 ?auto_27649 ) ) ( not ( = ?auto_27650 ?auto_27637 ) ) ( not ( = ?auto_27650 ?auto_27643 ) ) ( not ( = ?auto_27650 ?auto_27631 ) ) ( not ( = ?auto_27650 ?auto_27626 ) ) ( not ( = ?auto_27638 ?auto_27653 ) ) ( not ( = ?auto_27638 ?auto_27632 ) ) ( not ( = ?auto_27638 ?auto_27639 ) ) ( not ( = ?auto_27638 ?auto_27625 ) ) ( not ( = ?auto_27633 ?auto_27656 ) ) ( not ( = ?auto_27633 ?auto_27655 ) ) ( not ( = ?auto_27633 ?auto_27645 ) ) ( not ( = ?auto_27633 ?auto_27630 ) ) ( not ( = ?auto_27633 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27617 ) ) ( not ( = ?auto_27610 ?auto_27648 ) ) ( not ( = ?auto_27611 ?auto_27617 ) ) ( not ( = ?auto_27611 ?auto_27648 ) ) ( not ( = ?auto_27612 ?auto_27617 ) ) ( not ( = ?auto_27612 ?auto_27648 ) ) ( not ( = ?auto_27613 ?auto_27617 ) ) ( not ( = ?auto_27613 ?auto_27648 ) ) ( not ( = ?auto_27614 ?auto_27617 ) ) ( not ( = ?auto_27614 ?auto_27648 ) ) ( not ( = ?auto_27615 ?auto_27617 ) ) ( not ( = ?auto_27615 ?auto_27648 ) ) ( not ( = ?auto_27617 ?auto_27633 ) ) ( not ( = ?auto_27617 ?auto_27656 ) ) ( not ( = ?auto_27617 ?auto_27655 ) ) ( not ( = ?auto_27617 ?auto_27645 ) ) ( not ( = ?auto_27617 ?auto_27630 ) ) ( not ( = ?auto_27617 ?auto_27649 ) ) ( not ( = ?auto_27640 ?auto_27650 ) ) ( not ( = ?auto_27640 ?auto_27637 ) ) ( not ( = ?auto_27640 ?auto_27643 ) ) ( not ( = ?auto_27640 ?auto_27631 ) ) ( not ( = ?auto_27640 ?auto_27626 ) ) ( not ( = ?auto_27644 ?auto_27638 ) ) ( not ( = ?auto_27644 ?auto_27653 ) ) ( not ( = ?auto_27644 ?auto_27632 ) ) ( not ( = ?auto_27644 ?auto_27639 ) ) ( not ( = ?auto_27644 ?auto_27625 ) ) ( not ( = ?auto_27648 ?auto_27633 ) ) ( not ( = ?auto_27648 ?auto_27656 ) ) ( not ( = ?auto_27648 ?auto_27655 ) ) ( not ( = ?auto_27648 ?auto_27645 ) ) ( not ( = ?auto_27648 ?auto_27630 ) ) ( not ( = ?auto_27648 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27618 ) ) ( not ( = ?auto_27610 ?auto_27634 ) ) ( not ( = ?auto_27611 ?auto_27618 ) ) ( not ( = ?auto_27611 ?auto_27634 ) ) ( not ( = ?auto_27612 ?auto_27618 ) ) ( not ( = ?auto_27612 ?auto_27634 ) ) ( not ( = ?auto_27613 ?auto_27618 ) ) ( not ( = ?auto_27613 ?auto_27634 ) ) ( not ( = ?auto_27614 ?auto_27618 ) ) ( not ( = ?auto_27614 ?auto_27634 ) ) ( not ( = ?auto_27615 ?auto_27618 ) ) ( not ( = ?auto_27615 ?auto_27634 ) ) ( not ( = ?auto_27616 ?auto_27618 ) ) ( not ( = ?auto_27616 ?auto_27634 ) ) ( not ( = ?auto_27618 ?auto_27648 ) ) ( not ( = ?auto_27618 ?auto_27633 ) ) ( not ( = ?auto_27618 ?auto_27656 ) ) ( not ( = ?auto_27618 ?auto_27655 ) ) ( not ( = ?auto_27618 ?auto_27645 ) ) ( not ( = ?auto_27618 ?auto_27630 ) ) ( not ( = ?auto_27618 ?auto_27649 ) ) ( not ( = ?auto_27642 ?auto_27640 ) ) ( not ( = ?auto_27642 ?auto_27650 ) ) ( not ( = ?auto_27642 ?auto_27637 ) ) ( not ( = ?auto_27642 ?auto_27643 ) ) ( not ( = ?auto_27642 ?auto_27631 ) ) ( not ( = ?auto_27642 ?auto_27626 ) ) ( not ( = ?auto_27654 ?auto_27644 ) ) ( not ( = ?auto_27654 ?auto_27638 ) ) ( not ( = ?auto_27654 ?auto_27653 ) ) ( not ( = ?auto_27654 ?auto_27632 ) ) ( not ( = ?auto_27654 ?auto_27639 ) ) ( not ( = ?auto_27654 ?auto_27625 ) ) ( not ( = ?auto_27634 ?auto_27648 ) ) ( not ( = ?auto_27634 ?auto_27633 ) ) ( not ( = ?auto_27634 ?auto_27656 ) ) ( not ( = ?auto_27634 ?auto_27655 ) ) ( not ( = ?auto_27634 ?auto_27645 ) ) ( not ( = ?auto_27634 ?auto_27630 ) ) ( not ( = ?auto_27634 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27619 ) ) ( not ( = ?auto_27610 ?auto_27636 ) ) ( not ( = ?auto_27611 ?auto_27619 ) ) ( not ( = ?auto_27611 ?auto_27636 ) ) ( not ( = ?auto_27612 ?auto_27619 ) ) ( not ( = ?auto_27612 ?auto_27636 ) ) ( not ( = ?auto_27613 ?auto_27619 ) ) ( not ( = ?auto_27613 ?auto_27636 ) ) ( not ( = ?auto_27614 ?auto_27619 ) ) ( not ( = ?auto_27614 ?auto_27636 ) ) ( not ( = ?auto_27615 ?auto_27619 ) ) ( not ( = ?auto_27615 ?auto_27636 ) ) ( not ( = ?auto_27616 ?auto_27619 ) ) ( not ( = ?auto_27616 ?auto_27636 ) ) ( not ( = ?auto_27617 ?auto_27619 ) ) ( not ( = ?auto_27617 ?auto_27636 ) ) ( not ( = ?auto_27619 ?auto_27634 ) ) ( not ( = ?auto_27619 ?auto_27648 ) ) ( not ( = ?auto_27619 ?auto_27633 ) ) ( not ( = ?auto_27619 ?auto_27656 ) ) ( not ( = ?auto_27619 ?auto_27655 ) ) ( not ( = ?auto_27619 ?auto_27645 ) ) ( not ( = ?auto_27619 ?auto_27630 ) ) ( not ( = ?auto_27619 ?auto_27649 ) ) ( not ( = ?auto_27641 ?auto_27642 ) ) ( not ( = ?auto_27641 ?auto_27640 ) ) ( not ( = ?auto_27641 ?auto_27650 ) ) ( not ( = ?auto_27641 ?auto_27637 ) ) ( not ( = ?auto_27641 ?auto_27643 ) ) ( not ( = ?auto_27641 ?auto_27631 ) ) ( not ( = ?auto_27641 ?auto_27626 ) ) ( not ( = ?auto_27646 ?auto_27654 ) ) ( not ( = ?auto_27646 ?auto_27644 ) ) ( not ( = ?auto_27646 ?auto_27638 ) ) ( not ( = ?auto_27646 ?auto_27653 ) ) ( not ( = ?auto_27646 ?auto_27632 ) ) ( not ( = ?auto_27646 ?auto_27639 ) ) ( not ( = ?auto_27646 ?auto_27625 ) ) ( not ( = ?auto_27636 ?auto_27634 ) ) ( not ( = ?auto_27636 ?auto_27648 ) ) ( not ( = ?auto_27636 ?auto_27633 ) ) ( not ( = ?auto_27636 ?auto_27656 ) ) ( not ( = ?auto_27636 ?auto_27655 ) ) ( not ( = ?auto_27636 ?auto_27645 ) ) ( not ( = ?auto_27636 ?auto_27630 ) ) ( not ( = ?auto_27636 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27620 ) ) ( not ( = ?auto_27610 ?auto_27651 ) ) ( not ( = ?auto_27611 ?auto_27620 ) ) ( not ( = ?auto_27611 ?auto_27651 ) ) ( not ( = ?auto_27612 ?auto_27620 ) ) ( not ( = ?auto_27612 ?auto_27651 ) ) ( not ( = ?auto_27613 ?auto_27620 ) ) ( not ( = ?auto_27613 ?auto_27651 ) ) ( not ( = ?auto_27614 ?auto_27620 ) ) ( not ( = ?auto_27614 ?auto_27651 ) ) ( not ( = ?auto_27615 ?auto_27620 ) ) ( not ( = ?auto_27615 ?auto_27651 ) ) ( not ( = ?auto_27616 ?auto_27620 ) ) ( not ( = ?auto_27616 ?auto_27651 ) ) ( not ( = ?auto_27617 ?auto_27620 ) ) ( not ( = ?auto_27617 ?auto_27651 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( not ( = ?auto_27618 ?auto_27651 ) ) ( not ( = ?auto_27620 ?auto_27636 ) ) ( not ( = ?auto_27620 ?auto_27634 ) ) ( not ( = ?auto_27620 ?auto_27648 ) ) ( not ( = ?auto_27620 ?auto_27633 ) ) ( not ( = ?auto_27620 ?auto_27656 ) ) ( not ( = ?auto_27620 ?auto_27655 ) ) ( not ( = ?auto_27620 ?auto_27645 ) ) ( not ( = ?auto_27620 ?auto_27630 ) ) ( not ( = ?auto_27620 ?auto_27649 ) ) ( not ( = ?auto_27647 ?auto_27641 ) ) ( not ( = ?auto_27647 ?auto_27642 ) ) ( not ( = ?auto_27647 ?auto_27640 ) ) ( not ( = ?auto_27647 ?auto_27650 ) ) ( not ( = ?auto_27647 ?auto_27637 ) ) ( not ( = ?auto_27647 ?auto_27643 ) ) ( not ( = ?auto_27647 ?auto_27631 ) ) ( not ( = ?auto_27647 ?auto_27626 ) ) ( not ( = ?auto_27657 ?auto_27646 ) ) ( not ( = ?auto_27657 ?auto_27654 ) ) ( not ( = ?auto_27657 ?auto_27644 ) ) ( not ( = ?auto_27657 ?auto_27638 ) ) ( not ( = ?auto_27657 ?auto_27653 ) ) ( not ( = ?auto_27657 ?auto_27632 ) ) ( not ( = ?auto_27657 ?auto_27639 ) ) ( not ( = ?auto_27657 ?auto_27625 ) ) ( not ( = ?auto_27651 ?auto_27636 ) ) ( not ( = ?auto_27651 ?auto_27634 ) ) ( not ( = ?auto_27651 ?auto_27648 ) ) ( not ( = ?auto_27651 ?auto_27633 ) ) ( not ( = ?auto_27651 ?auto_27656 ) ) ( not ( = ?auto_27651 ?auto_27655 ) ) ( not ( = ?auto_27651 ?auto_27645 ) ) ( not ( = ?auto_27651 ?auto_27630 ) ) ( not ( = ?auto_27651 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27621 ) ) ( not ( = ?auto_27610 ?auto_27652 ) ) ( not ( = ?auto_27611 ?auto_27621 ) ) ( not ( = ?auto_27611 ?auto_27652 ) ) ( not ( = ?auto_27612 ?auto_27621 ) ) ( not ( = ?auto_27612 ?auto_27652 ) ) ( not ( = ?auto_27613 ?auto_27621 ) ) ( not ( = ?auto_27613 ?auto_27652 ) ) ( not ( = ?auto_27614 ?auto_27621 ) ) ( not ( = ?auto_27614 ?auto_27652 ) ) ( not ( = ?auto_27615 ?auto_27621 ) ) ( not ( = ?auto_27615 ?auto_27652 ) ) ( not ( = ?auto_27616 ?auto_27621 ) ) ( not ( = ?auto_27616 ?auto_27652 ) ) ( not ( = ?auto_27617 ?auto_27621 ) ) ( not ( = ?auto_27617 ?auto_27652 ) ) ( not ( = ?auto_27618 ?auto_27621 ) ) ( not ( = ?auto_27618 ?auto_27652 ) ) ( not ( = ?auto_27619 ?auto_27621 ) ) ( not ( = ?auto_27619 ?auto_27652 ) ) ( not ( = ?auto_27621 ?auto_27651 ) ) ( not ( = ?auto_27621 ?auto_27636 ) ) ( not ( = ?auto_27621 ?auto_27634 ) ) ( not ( = ?auto_27621 ?auto_27648 ) ) ( not ( = ?auto_27621 ?auto_27633 ) ) ( not ( = ?auto_27621 ?auto_27656 ) ) ( not ( = ?auto_27621 ?auto_27655 ) ) ( not ( = ?auto_27621 ?auto_27645 ) ) ( not ( = ?auto_27621 ?auto_27630 ) ) ( not ( = ?auto_27621 ?auto_27649 ) ) ( not ( = ?auto_27652 ?auto_27651 ) ) ( not ( = ?auto_27652 ?auto_27636 ) ) ( not ( = ?auto_27652 ?auto_27634 ) ) ( not ( = ?auto_27652 ?auto_27648 ) ) ( not ( = ?auto_27652 ?auto_27633 ) ) ( not ( = ?auto_27652 ?auto_27656 ) ) ( not ( = ?auto_27652 ?auto_27655 ) ) ( not ( = ?auto_27652 ?auto_27645 ) ) ( not ( = ?auto_27652 ?auto_27630 ) ) ( not ( = ?auto_27652 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27622 ) ) ( not ( = ?auto_27610 ?auto_27635 ) ) ( not ( = ?auto_27611 ?auto_27622 ) ) ( not ( = ?auto_27611 ?auto_27635 ) ) ( not ( = ?auto_27612 ?auto_27622 ) ) ( not ( = ?auto_27612 ?auto_27635 ) ) ( not ( = ?auto_27613 ?auto_27622 ) ) ( not ( = ?auto_27613 ?auto_27635 ) ) ( not ( = ?auto_27614 ?auto_27622 ) ) ( not ( = ?auto_27614 ?auto_27635 ) ) ( not ( = ?auto_27615 ?auto_27622 ) ) ( not ( = ?auto_27615 ?auto_27635 ) ) ( not ( = ?auto_27616 ?auto_27622 ) ) ( not ( = ?auto_27616 ?auto_27635 ) ) ( not ( = ?auto_27617 ?auto_27622 ) ) ( not ( = ?auto_27617 ?auto_27635 ) ) ( not ( = ?auto_27618 ?auto_27622 ) ) ( not ( = ?auto_27618 ?auto_27635 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27619 ?auto_27635 ) ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27635 ) ) ( not ( = ?auto_27622 ?auto_27652 ) ) ( not ( = ?auto_27622 ?auto_27651 ) ) ( not ( = ?auto_27622 ?auto_27636 ) ) ( not ( = ?auto_27622 ?auto_27634 ) ) ( not ( = ?auto_27622 ?auto_27648 ) ) ( not ( = ?auto_27622 ?auto_27633 ) ) ( not ( = ?auto_27622 ?auto_27656 ) ) ( not ( = ?auto_27622 ?auto_27655 ) ) ( not ( = ?auto_27622 ?auto_27645 ) ) ( not ( = ?auto_27622 ?auto_27630 ) ) ( not ( = ?auto_27622 ?auto_27649 ) ) ( not ( = ?auto_27635 ?auto_27652 ) ) ( not ( = ?auto_27635 ?auto_27651 ) ) ( not ( = ?auto_27635 ?auto_27636 ) ) ( not ( = ?auto_27635 ?auto_27634 ) ) ( not ( = ?auto_27635 ?auto_27648 ) ) ( not ( = ?auto_27635 ?auto_27633 ) ) ( not ( = ?auto_27635 ?auto_27656 ) ) ( not ( = ?auto_27635 ?auto_27655 ) ) ( not ( = ?auto_27635 ?auto_27645 ) ) ( not ( = ?auto_27635 ?auto_27630 ) ) ( not ( = ?auto_27635 ?auto_27649 ) ) ( not ( = ?auto_27610 ?auto_27623 ) ) ( not ( = ?auto_27610 ?auto_27628 ) ) ( not ( = ?auto_27611 ?auto_27623 ) ) ( not ( = ?auto_27611 ?auto_27628 ) ) ( not ( = ?auto_27612 ?auto_27623 ) ) ( not ( = ?auto_27612 ?auto_27628 ) ) ( not ( = ?auto_27613 ?auto_27623 ) ) ( not ( = ?auto_27613 ?auto_27628 ) ) ( not ( = ?auto_27614 ?auto_27623 ) ) ( not ( = ?auto_27614 ?auto_27628 ) ) ( not ( = ?auto_27615 ?auto_27623 ) ) ( not ( = ?auto_27615 ?auto_27628 ) ) ( not ( = ?auto_27616 ?auto_27623 ) ) ( not ( = ?auto_27616 ?auto_27628 ) ) ( not ( = ?auto_27617 ?auto_27623 ) ) ( not ( = ?auto_27617 ?auto_27628 ) ) ( not ( = ?auto_27618 ?auto_27623 ) ) ( not ( = ?auto_27618 ?auto_27628 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27628 ) ) ( not ( = ?auto_27620 ?auto_27623 ) ) ( not ( = ?auto_27620 ?auto_27628 ) ) ( not ( = ?auto_27621 ?auto_27623 ) ) ( not ( = ?auto_27621 ?auto_27628 ) ) ( not ( = ?auto_27623 ?auto_27635 ) ) ( not ( = ?auto_27623 ?auto_27652 ) ) ( not ( = ?auto_27623 ?auto_27651 ) ) ( not ( = ?auto_27623 ?auto_27636 ) ) ( not ( = ?auto_27623 ?auto_27634 ) ) ( not ( = ?auto_27623 ?auto_27648 ) ) ( not ( = ?auto_27623 ?auto_27633 ) ) ( not ( = ?auto_27623 ?auto_27656 ) ) ( not ( = ?auto_27623 ?auto_27655 ) ) ( not ( = ?auto_27623 ?auto_27645 ) ) ( not ( = ?auto_27623 ?auto_27630 ) ) ( not ( = ?auto_27623 ?auto_27649 ) ) ( not ( = ?auto_27628 ?auto_27635 ) ) ( not ( = ?auto_27628 ?auto_27652 ) ) ( not ( = ?auto_27628 ?auto_27651 ) ) ( not ( = ?auto_27628 ?auto_27636 ) ) ( not ( = ?auto_27628 ?auto_27634 ) ) ( not ( = ?auto_27628 ?auto_27648 ) ) ( not ( = ?auto_27628 ?auto_27633 ) ) ( not ( = ?auto_27628 ?auto_27656 ) ) ( not ( = ?auto_27628 ?auto_27655 ) ) ( not ( = ?auto_27628 ?auto_27645 ) ) ( not ( = ?auto_27628 ?auto_27630 ) ) ( not ( = ?auto_27628 ?auto_27649 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27610 ?auto_27611 ?auto_27612 ?auto_27613 ?auto_27614 ?auto_27615 ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27621 ?auto_27622 )
      ( MAKE-1CRATE ?auto_27622 ?auto_27623 )
      ( MAKE-13CRATE-VERIFY ?auto_27610 ?auto_27611 ?auto_27612 ?auto_27613 ?auto_27614 ?auto_27615 ?auto_27616 ?auto_27617 ?auto_27618 ?auto_27619 ?auto_27620 ?auto_27621 ?auto_27622 ?auto_27623 ) )
  )

  ( :method MAKE-14CRATE
    :parameters
    (
      ?auto_27683 - SURFACE
      ?auto_27684 - SURFACE
      ?auto_27685 - SURFACE
      ?auto_27686 - SURFACE
      ?auto_27687 - SURFACE
      ?auto_27688 - SURFACE
      ?auto_27689 - SURFACE
      ?auto_27690 - SURFACE
      ?auto_27691 - SURFACE
      ?auto_27692 - SURFACE
      ?auto_27693 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27695 - SURFACE
      ?auto_27696 - SURFACE
      ?auto_27697 - SURFACE
    )
    :vars
    (
      ?auto_27701 - HOIST
      ?auto_27700 - PLACE
      ?auto_27698 - PLACE
      ?auto_27703 - HOIST
      ?auto_27702 - SURFACE
      ?auto_27732 - PLACE
      ?auto_27704 - HOIST
      ?auto_27725 - SURFACE
      ?auto_27728 - PLACE
      ?auto_27713 - HOIST
      ?auto_27726 - SURFACE
      ?auto_27722 - PLACE
      ?auto_27712 - HOIST
      ?auto_27710 - SURFACE
      ?auto_27731 - PLACE
      ?auto_27720 - HOIST
      ?auto_27706 - SURFACE
      ?auto_27718 - PLACE
      ?auto_27707 - HOIST
      ?auto_27717 - SURFACE
      ?auto_27723 - SURFACE
      ?auto_27711 - PLACE
      ?auto_27715 - HOIST
      ?auto_27727 - SURFACE
      ?auto_27729 - PLACE
      ?auto_27714 - HOIST
      ?auto_27721 - SURFACE
      ?auto_27709 - SURFACE
      ?auto_27716 - SURFACE
      ?auto_27719 - PLACE
      ?auto_27724 - HOIST
      ?auto_27708 - SURFACE
      ?auto_27705 - SURFACE
      ?auto_27730 - SURFACE
      ?auto_27699 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27701 ?auto_27700 ) ( IS-CRATE ?auto_27697 ) ( not ( = ?auto_27698 ?auto_27700 ) ) ( HOIST-AT ?auto_27703 ?auto_27698 ) ( SURFACE-AT ?auto_27697 ?auto_27698 ) ( ON ?auto_27697 ?auto_27702 ) ( CLEAR ?auto_27697 ) ( not ( = ?auto_27696 ?auto_27697 ) ) ( not ( = ?auto_27696 ?auto_27702 ) ) ( not ( = ?auto_27697 ?auto_27702 ) ) ( not ( = ?auto_27701 ?auto_27703 ) ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27732 ?auto_27700 ) ) ( HOIST-AT ?auto_27704 ?auto_27732 ) ( SURFACE-AT ?auto_27696 ?auto_27732 ) ( ON ?auto_27696 ?auto_27725 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( not ( = ?auto_27695 ?auto_27725 ) ) ( not ( = ?auto_27696 ?auto_27725 ) ) ( not ( = ?auto_27701 ?auto_27704 ) ) ( IS-CRATE ?auto_27695 ) ( not ( = ?auto_27728 ?auto_27700 ) ) ( HOIST-AT ?auto_27713 ?auto_27728 ) ( SURFACE-AT ?auto_27695 ?auto_27728 ) ( ON ?auto_27695 ?auto_27726 ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27726 ) ) ( not ( = ?auto_27695 ?auto_27726 ) ) ( not ( = ?auto_27701 ?auto_27713 ) ) ( IS-CRATE ?auto_27694 ) ( not ( = ?auto_27722 ?auto_27700 ) ) ( HOIST-AT ?auto_27712 ?auto_27722 ) ( SURFACE-AT ?auto_27694 ?auto_27722 ) ( ON ?auto_27694 ?auto_27710 ) ( CLEAR ?auto_27694 ) ( not ( = ?auto_27693 ?auto_27694 ) ) ( not ( = ?auto_27693 ?auto_27710 ) ) ( not ( = ?auto_27694 ?auto_27710 ) ) ( not ( = ?auto_27701 ?auto_27712 ) ) ( IS-CRATE ?auto_27693 ) ( not ( = ?auto_27731 ?auto_27700 ) ) ( HOIST-AT ?auto_27720 ?auto_27731 ) ( AVAILABLE ?auto_27720 ) ( SURFACE-AT ?auto_27693 ?auto_27731 ) ( ON ?auto_27693 ?auto_27706 ) ( CLEAR ?auto_27693 ) ( not ( = ?auto_27692 ?auto_27693 ) ) ( not ( = ?auto_27692 ?auto_27706 ) ) ( not ( = ?auto_27693 ?auto_27706 ) ) ( not ( = ?auto_27701 ?auto_27720 ) ) ( IS-CRATE ?auto_27692 ) ( not ( = ?auto_27718 ?auto_27700 ) ) ( HOIST-AT ?auto_27707 ?auto_27718 ) ( AVAILABLE ?auto_27707 ) ( SURFACE-AT ?auto_27692 ?auto_27718 ) ( ON ?auto_27692 ?auto_27717 ) ( CLEAR ?auto_27692 ) ( not ( = ?auto_27691 ?auto_27692 ) ) ( not ( = ?auto_27691 ?auto_27717 ) ) ( not ( = ?auto_27692 ?auto_27717 ) ) ( not ( = ?auto_27701 ?auto_27707 ) ) ( IS-CRATE ?auto_27691 ) ( AVAILABLE ?auto_27703 ) ( SURFACE-AT ?auto_27691 ?auto_27698 ) ( ON ?auto_27691 ?auto_27723 ) ( CLEAR ?auto_27691 ) ( not ( = ?auto_27690 ?auto_27691 ) ) ( not ( = ?auto_27690 ?auto_27723 ) ) ( not ( = ?auto_27691 ?auto_27723 ) ) ( IS-CRATE ?auto_27690 ) ( not ( = ?auto_27711 ?auto_27700 ) ) ( HOIST-AT ?auto_27715 ?auto_27711 ) ( AVAILABLE ?auto_27715 ) ( SURFACE-AT ?auto_27690 ?auto_27711 ) ( ON ?auto_27690 ?auto_27727 ) ( CLEAR ?auto_27690 ) ( not ( = ?auto_27689 ?auto_27690 ) ) ( not ( = ?auto_27689 ?auto_27727 ) ) ( not ( = ?auto_27690 ?auto_27727 ) ) ( not ( = ?auto_27701 ?auto_27715 ) ) ( IS-CRATE ?auto_27689 ) ( not ( = ?auto_27729 ?auto_27700 ) ) ( HOIST-AT ?auto_27714 ?auto_27729 ) ( AVAILABLE ?auto_27714 ) ( SURFACE-AT ?auto_27689 ?auto_27729 ) ( ON ?auto_27689 ?auto_27721 ) ( CLEAR ?auto_27689 ) ( not ( = ?auto_27688 ?auto_27689 ) ) ( not ( = ?auto_27688 ?auto_27721 ) ) ( not ( = ?auto_27689 ?auto_27721 ) ) ( not ( = ?auto_27701 ?auto_27714 ) ) ( IS-CRATE ?auto_27688 ) ( SURFACE-AT ?auto_27688 ?auto_27728 ) ( ON ?auto_27688 ?auto_27709 ) ( CLEAR ?auto_27688 ) ( not ( = ?auto_27687 ?auto_27688 ) ) ( not ( = ?auto_27687 ?auto_27709 ) ) ( not ( = ?auto_27688 ?auto_27709 ) ) ( IS-CRATE ?auto_27687 ) ( AVAILABLE ?auto_27713 ) ( SURFACE-AT ?auto_27687 ?auto_27728 ) ( ON ?auto_27687 ?auto_27716 ) ( CLEAR ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27687 ) ) ( not ( = ?auto_27686 ?auto_27716 ) ) ( not ( = ?auto_27687 ?auto_27716 ) ) ( IS-CRATE ?auto_27686 ) ( not ( = ?auto_27719 ?auto_27700 ) ) ( HOIST-AT ?auto_27724 ?auto_27719 ) ( AVAILABLE ?auto_27724 ) ( SURFACE-AT ?auto_27686 ?auto_27719 ) ( ON ?auto_27686 ?auto_27708 ) ( CLEAR ?auto_27686 ) ( not ( = ?auto_27685 ?auto_27686 ) ) ( not ( = ?auto_27685 ?auto_27708 ) ) ( not ( = ?auto_27686 ?auto_27708 ) ) ( not ( = ?auto_27701 ?auto_27724 ) ) ( IS-CRATE ?auto_27685 ) ( AVAILABLE ?auto_27712 ) ( SURFACE-AT ?auto_27685 ?auto_27722 ) ( ON ?auto_27685 ?auto_27705 ) ( CLEAR ?auto_27685 ) ( not ( = ?auto_27684 ?auto_27685 ) ) ( not ( = ?auto_27684 ?auto_27705 ) ) ( not ( = ?auto_27685 ?auto_27705 ) ) ( SURFACE-AT ?auto_27683 ?auto_27700 ) ( CLEAR ?auto_27683 ) ( IS-CRATE ?auto_27684 ) ( AVAILABLE ?auto_27701 ) ( AVAILABLE ?auto_27704 ) ( SURFACE-AT ?auto_27684 ?auto_27732 ) ( ON ?auto_27684 ?auto_27730 ) ( CLEAR ?auto_27684 ) ( TRUCK-AT ?auto_27699 ?auto_27700 ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27683 ?auto_27730 ) ) ( not ( = ?auto_27684 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27685 ) ) ( not ( = ?auto_27683 ?auto_27705 ) ) ( not ( = ?auto_27685 ?auto_27730 ) ) ( not ( = ?auto_27722 ?auto_27732 ) ) ( not ( = ?auto_27712 ?auto_27704 ) ) ( not ( = ?auto_27705 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27686 ) ) ( not ( = ?auto_27683 ?auto_27708 ) ) ( not ( = ?auto_27684 ?auto_27686 ) ) ( not ( = ?auto_27684 ?auto_27708 ) ) ( not ( = ?auto_27686 ?auto_27705 ) ) ( not ( = ?auto_27686 ?auto_27730 ) ) ( not ( = ?auto_27719 ?auto_27722 ) ) ( not ( = ?auto_27719 ?auto_27732 ) ) ( not ( = ?auto_27724 ?auto_27712 ) ) ( not ( = ?auto_27724 ?auto_27704 ) ) ( not ( = ?auto_27708 ?auto_27705 ) ) ( not ( = ?auto_27708 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27687 ) ) ( not ( = ?auto_27683 ?auto_27716 ) ) ( not ( = ?auto_27684 ?auto_27687 ) ) ( not ( = ?auto_27684 ?auto_27716 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27685 ?auto_27716 ) ) ( not ( = ?auto_27687 ?auto_27708 ) ) ( not ( = ?auto_27687 ?auto_27705 ) ) ( not ( = ?auto_27687 ?auto_27730 ) ) ( not ( = ?auto_27728 ?auto_27719 ) ) ( not ( = ?auto_27728 ?auto_27722 ) ) ( not ( = ?auto_27728 ?auto_27732 ) ) ( not ( = ?auto_27713 ?auto_27724 ) ) ( not ( = ?auto_27713 ?auto_27712 ) ) ( not ( = ?auto_27713 ?auto_27704 ) ) ( not ( = ?auto_27716 ?auto_27708 ) ) ( not ( = ?auto_27716 ?auto_27705 ) ) ( not ( = ?auto_27716 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27688 ) ) ( not ( = ?auto_27683 ?auto_27709 ) ) ( not ( = ?auto_27684 ?auto_27688 ) ) ( not ( = ?auto_27684 ?auto_27709 ) ) ( not ( = ?auto_27685 ?auto_27688 ) ) ( not ( = ?auto_27685 ?auto_27709 ) ) ( not ( = ?auto_27686 ?auto_27688 ) ) ( not ( = ?auto_27686 ?auto_27709 ) ) ( not ( = ?auto_27688 ?auto_27716 ) ) ( not ( = ?auto_27688 ?auto_27708 ) ) ( not ( = ?auto_27688 ?auto_27705 ) ) ( not ( = ?auto_27688 ?auto_27730 ) ) ( not ( = ?auto_27709 ?auto_27716 ) ) ( not ( = ?auto_27709 ?auto_27708 ) ) ( not ( = ?auto_27709 ?auto_27705 ) ) ( not ( = ?auto_27709 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27689 ) ) ( not ( = ?auto_27683 ?auto_27721 ) ) ( not ( = ?auto_27684 ?auto_27689 ) ) ( not ( = ?auto_27684 ?auto_27721 ) ) ( not ( = ?auto_27685 ?auto_27689 ) ) ( not ( = ?auto_27685 ?auto_27721 ) ) ( not ( = ?auto_27686 ?auto_27689 ) ) ( not ( = ?auto_27686 ?auto_27721 ) ) ( not ( = ?auto_27687 ?auto_27689 ) ) ( not ( = ?auto_27687 ?auto_27721 ) ) ( not ( = ?auto_27689 ?auto_27709 ) ) ( not ( = ?auto_27689 ?auto_27716 ) ) ( not ( = ?auto_27689 ?auto_27708 ) ) ( not ( = ?auto_27689 ?auto_27705 ) ) ( not ( = ?auto_27689 ?auto_27730 ) ) ( not ( = ?auto_27729 ?auto_27728 ) ) ( not ( = ?auto_27729 ?auto_27719 ) ) ( not ( = ?auto_27729 ?auto_27722 ) ) ( not ( = ?auto_27729 ?auto_27732 ) ) ( not ( = ?auto_27714 ?auto_27713 ) ) ( not ( = ?auto_27714 ?auto_27724 ) ) ( not ( = ?auto_27714 ?auto_27712 ) ) ( not ( = ?auto_27714 ?auto_27704 ) ) ( not ( = ?auto_27721 ?auto_27709 ) ) ( not ( = ?auto_27721 ?auto_27716 ) ) ( not ( = ?auto_27721 ?auto_27708 ) ) ( not ( = ?auto_27721 ?auto_27705 ) ) ( not ( = ?auto_27721 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27690 ) ) ( not ( = ?auto_27683 ?auto_27727 ) ) ( not ( = ?auto_27684 ?auto_27690 ) ) ( not ( = ?auto_27684 ?auto_27727 ) ) ( not ( = ?auto_27685 ?auto_27690 ) ) ( not ( = ?auto_27685 ?auto_27727 ) ) ( not ( = ?auto_27686 ?auto_27690 ) ) ( not ( = ?auto_27686 ?auto_27727 ) ) ( not ( = ?auto_27687 ?auto_27690 ) ) ( not ( = ?auto_27687 ?auto_27727 ) ) ( not ( = ?auto_27688 ?auto_27690 ) ) ( not ( = ?auto_27688 ?auto_27727 ) ) ( not ( = ?auto_27690 ?auto_27721 ) ) ( not ( = ?auto_27690 ?auto_27709 ) ) ( not ( = ?auto_27690 ?auto_27716 ) ) ( not ( = ?auto_27690 ?auto_27708 ) ) ( not ( = ?auto_27690 ?auto_27705 ) ) ( not ( = ?auto_27690 ?auto_27730 ) ) ( not ( = ?auto_27711 ?auto_27729 ) ) ( not ( = ?auto_27711 ?auto_27728 ) ) ( not ( = ?auto_27711 ?auto_27719 ) ) ( not ( = ?auto_27711 ?auto_27722 ) ) ( not ( = ?auto_27711 ?auto_27732 ) ) ( not ( = ?auto_27715 ?auto_27714 ) ) ( not ( = ?auto_27715 ?auto_27713 ) ) ( not ( = ?auto_27715 ?auto_27724 ) ) ( not ( = ?auto_27715 ?auto_27712 ) ) ( not ( = ?auto_27715 ?auto_27704 ) ) ( not ( = ?auto_27727 ?auto_27721 ) ) ( not ( = ?auto_27727 ?auto_27709 ) ) ( not ( = ?auto_27727 ?auto_27716 ) ) ( not ( = ?auto_27727 ?auto_27708 ) ) ( not ( = ?auto_27727 ?auto_27705 ) ) ( not ( = ?auto_27727 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27691 ) ) ( not ( = ?auto_27683 ?auto_27723 ) ) ( not ( = ?auto_27684 ?auto_27691 ) ) ( not ( = ?auto_27684 ?auto_27723 ) ) ( not ( = ?auto_27685 ?auto_27691 ) ) ( not ( = ?auto_27685 ?auto_27723 ) ) ( not ( = ?auto_27686 ?auto_27691 ) ) ( not ( = ?auto_27686 ?auto_27723 ) ) ( not ( = ?auto_27687 ?auto_27691 ) ) ( not ( = ?auto_27687 ?auto_27723 ) ) ( not ( = ?auto_27688 ?auto_27691 ) ) ( not ( = ?auto_27688 ?auto_27723 ) ) ( not ( = ?auto_27689 ?auto_27691 ) ) ( not ( = ?auto_27689 ?auto_27723 ) ) ( not ( = ?auto_27691 ?auto_27727 ) ) ( not ( = ?auto_27691 ?auto_27721 ) ) ( not ( = ?auto_27691 ?auto_27709 ) ) ( not ( = ?auto_27691 ?auto_27716 ) ) ( not ( = ?auto_27691 ?auto_27708 ) ) ( not ( = ?auto_27691 ?auto_27705 ) ) ( not ( = ?auto_27691 ?auto_27730 ) ) ( not ( = ?auto_27698 ?auto_27711 ) ) ( not ( = ?auto_27698 ?auto_27729 ) ) ( not ( = ?auto_27698 ?auto_27728 ) ) ( not ( = ?auto_27698 ?auto_27719 ) ) ( not ( = ?auto_27698 ?auto_27722 ) ) ( not ( = ?auto_27698 ?auto_27732 ) ) ( not ( = ?auto_27703 ?auto_27715 ) ) ( not ( = ?auto_27703 ?auto_27714 ) ) ( not ( = ?auto_27703 ?auto_27713 ) ) ( not ( = ?auto_27703 ?auto_27724 ) ) ( not ( = ?auto_27703 ?auto_27712 ) ) ( not ( = ?auto_27703 ?auto_27704 ) ) ( not ( = ?auto_27723 ?auto_27727 ) ) ( not ( = ?auto_27723 ?auto_27721 ) ) ( not ( = ?auto_27723 ?auto_27709 ) ) ( not ( = ?auto_27723 ?auto_27716 ) ) ( not ( = ?auto_27723 ?auto_27708 ) ) ( not ( = ?auto_27723 ?auto_27705 ) ) ( not ( = ?auto_27723 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27692 ) ) ( not ( = ?auto_27683 ?auto_27717 ) ) ( not ( = ?auto_27684 ?auto_27692 ) ) ( not ( = ?auto_27684 ?auto_27717 ) ) ( not ( = ?auto_27685 ?auto_27692 ) ) ( not ( = ?auto_27685 ?auto_27717 ) ) ( not ( = ?auto_27686 ?auto_27692 ) ) ( not ( = ?auto_27686 ?auto_27717 ) ) ( not ( = ?auto_27687 ?auto_27692 ) ) ( not ( = ?auto_27687 ?auto_27717 ) ) ( not ( = ?auto_27688 ?auto_27692 ) ) ( not ( = ?auto_27688 ?auto_27717 ) ) ( not ( = ?auto_27689 ?auto_27692 ) ) ( not ( = ?auto_27689 ?auto_27717 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27717 ) ) ( not ( = ?auto_27692 ?auto_27723 ) ) ( not ( = ?auto_27692 ?auto_27727 ) ) ( not ( = ?auto_27692 ?auto_27721 ) ) ( not ( = ?auto_27692 ?auto_27709 ) ) ( not ( = ?auto_27692 ?auto_27716 ) ) ( not ( = ?auto_27692 ?auto_27708 ) ) ( not ( = ?auto_27692 ?auto_27705 ) ) ( not ( = ?auto_27692 ?auto_27730 ) ) ( not ( = ?auto_27718 ?auto_27698 ) ) ( not ( = ?auto_27718 ?auto_27711 ) ) ( not ( = ?auto_27718 ?auto_27729 ) ) ( not ( = ?auto_27718 ?auto_27728 ) ) ( not ( = ?auto_27718 ?auto_27719 ) ) ( not ( = ?auto_27718 ?auto_27722 ) ) ( not ( = ?auto_27718 ?auto_27732 ) ) ( not ( = ?auto_27707 ?auto_27703 ) ) ( not ( = ?auto_27707 ?auto_27715 ) ) ( not ( = ?auto_27707 ?auto_27714 ) ) ( not ( = ?auto_27707 ?auto_27713 ) ) ( not ( = ?auto_27707 ?auto_27724 ) ) ( not ( = ?auto_27707 ?auto_27712 ) ) ( not ( = ?auto_27707 ?auto_27704 ) ) ( not ( = ?auto_27717 ?auto_27723 ) ) ( not ( = ?auto_27717 ?auto_27727 ) ) ( not ( = ?auto_27717 ?auto_27721 ) ) ( not ( = ?auto_27717 ?auto_27709 ) ) ( not ( = ?auto_27717 ?auto_27716 ) ) ( not ( = ?auto_27717 ?auto_27708 ) ) ( not ( = ?auto_27717 ?auto_27705 ) ) ( not ( = ?auto_27717 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27693 ) ) ( not ( = ?auto_27683 ?auto_27706 ) ) ( not ( = ?auto_27684 ?auto_27693 ) ) ( not ( = ?auto_27684 ?auto_27706 ) ) ( not ( = ?auto_27685 ?auto_27693 ) ) ( not ( = ?auto_27685 ?auto_27706 ) ) ( not ( = ?auto_27686 ?auto_27693 ) ) ( not ( = ?auto_27686 ?auto_27706 ) ) ( not ( = ?auto_27687 ?auto_27693 ) ) ( not ( = ?auto_27687 ?auto_27706 ) ) ( not ( = ?auto_27688 ?auto_27693 ) ) ( not ( = ?auto_27688 ?auto_27706 ) ) ( not ( = ?auto_27689 ?auto_27693 ) ) ( not ( = ?auto_27689 ?auto_27706 ) ) ( not ( = ?auto_27690 ?auto_27693 ) ) ( not ( = ?auto_27690 ?auto_27706 ) ) ( not ( = ?auto_27691 ?auto_27693 ) ) ( not ( = ?auto_27691 ?auto_27706 ) ) ( not ( = ?auto_27693 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27723 ) ) ( not ( = ?auto_27693 ?auto_27727 ) ) ( not ( = ?auto_27693 ?auto_27721 ) ) ( not ( = ?auto_27693 ?auto_27709 ) ) ( not ( = ?auto_27693 ?auto_27716 ) ) ( not ( = ?auto_27693 ?auto_27708 ) ) ( not ( = ?auto_27693 ?auto_27705 ) ) ( not ( = ?auto_27693 ?auto_27730 ) ) ( not ( = ?auto_27731 ?auto_27718 ) ) ( not ( = ?auto_27731 ?auto_27698 ) ) ( not ( = ?auto_27731 ?auto_27711 ) ) ( not ( = ?auto_27731 ?auto_27729 ) ) ( not ( = ?auto_27731 ?auto_27728 ) ) ( not ( = ?auto_27731 ?auto_27719 ) ) ( not ( = ?auto_27731 ?auto_27722 ) ) ( not ( = ?auto_27731 ?auto_27732 ) ) ( not ( = ?auto_27720 ?auto_27707 ) ) ( not ( = ?auto_27720 ?auto_27703 ) ) ( not ( = ?auto_27720 ?auto_27715 ) ) ( not ( = ?auto_27720 ?auto_27714 ) ) ( not ( = ?auto_27720 ?auto_27713 ) ) ( not ( = ?auto_27720 ?auto_27724 ) ) ( not ( = ?auto_27720 ?auto_27712 ) ) ( not ( = ?auto_27720 ?auto_27704 ) ) ( not ( = ?auto_27706 ?auto_27717 ) ) ( not ( = ?auto_27706 ?auto_27723 ) ) ( not ( = ?auto_27706 ?auto_27727 ) ) ( not ( = ?auto_27706 ?auto_27721 ) ) ( not ( = ?auto_27706 ?auto_27709 ) ) ( not ( = ?auto_27706 ?auto_27716 ) ) ( not ( = ?auto_27706 ?auto_27708 ) ) ( not ( = ?auto_27706 ?auto_27705 ) ) ( not ( = ?auto_27706 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27694 ) ) ( not ( = ?auto_27683 ?auto_27710 ) ) ( not ( = ?auto_27684 ?auto_27694 ) ) ( not ( = ?auto_27684 ?auto_27710 ) ) ( not ( = ?auto_27685 ?auto_27694 ) ) ( not ( = ?auto_27685 ?auto_27710 ) ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27686 ?auto_27710 ) ) ( not ( = ?auto_27687 ?auto_27694 ) ) ( not ( = ?auto_27687 ?auto_27710 ) ) ( not ( = ?auto_27688 ?auto_27694 ) ) ( not ( = ?auto_27688 ?auto_27710 ) ) ( not ( = ?auto_27689 ?auto_27694 ) ) ( not ( = ?auto_27689 ?auto_27710 ) ) ( not ( = ?auto_27690 ?auto_27694 ) ) ( not ( = ?auto_27690 ?auto_27710 ) ) ( not ( = ?auto_27691 ?auto_27694 ) ) ( not ( = ?auto_27691 ?auto_27710 ) ) ( not ( = ?auto_27692 ?auto_27694 ) ) ( not ( = ?auto_27692 ?auto_27710 ) ) ( not ( = ?auto_27694 ?auto_27706 ) ) ( not ( = ?auto_27694 ?auto_27717 ) ) ( not ( = ?auto_27694 ?auto_27723 ) ) ( not ( = ?auto_27694 ?auto_27727 ) ) ( not ( = ?auto_27694 ?auto_27721 ) ) ( not ( = ?auto_27694 ?auto_27709 ) ) ( not ( = ?auto_27694 ?auto_27716 ) ) ( not ( = ?auto_27694 ?auto_27708 ) ) ( not ( = ?auto_27694 ?auto_27705 ) ) ( not ( = ?auto_27694 ?auto_27730 ) ) ( not ( = ?auto_27710 ?auto_27706 ) ) ( not ( = ?auto_27710 ?auto_27717 ) ) ( not ( = ?auto_27710 ?auto_27723 ) ) ( not ( = ?auto_27710 ?auto_27727 ) ) ( not ( = ?auto_27710 ?auto_27721 ) ) ( not ( = ?auto_27710 ?auto_27709 ) ) ( not ( = ?auto_27710 ?auto_27716 ) ) ( not ( = ?auto_27710 ?auto_27708 ) ) ( not ( = ?auto_27710 ?auto_27705 ) ) ( not ( = ?auto_27710 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27695 ) ) ( not ( = ?auto_27683 ?auto_27726 ) ) ( not ( = ?auto_27684 ?auto_27695 ) ) ( not ( = ?auto_27684 ?auto_27726 ) ) ( not ( = ?auto_27685 ?auto_27695 ) ) ( not ( = ?auto_27685 ?auto_27726 ) ) ( not ( = ?auto_27686 ?auto_27695 ) ) ( not ( = ?auto_27686 ?auto_27726 ) ) ( not ( = ?auto_27687 ?auto_27695 ) ) ( not ( = ?auto_27687 ?auto_27726 ) ) ( not ( = ?auto_27688 ?auto_27695 ) ) ( not ( = ?auto_27688 ?auto_27726 ) ) ( not ( = ?auto_27689 ?auto_27695 ) ) ( not ( = ?auto_27689 ?auto_27726 ) ) ( not ( = ?auto_27690 ?auto_27695 ) ) ( not ( = ?auto_27690 ?auto_27726 ) ) ( not ( = ?auto_27691 ?auto_27695 ) ) ( not ( = ?auto_27691 ?auto_27726 ) ) ( not ( = ?auto_27692 ?auto_27695 ) ) ( not ( = ?auto_27692 ?auto_27726 ) ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27726 ) ) ( not ( = ?auto_27695 ?auto_27710 ) ) ( not ( = ?auto_27695 ?auto_27706 ) ) ( not ( = ?auto_27695 ?auto_27717 ) ) ( not ( = ?auto_27695 ?auto_27723 ) ) ( not ( = ?auto_27695 ?auto_27727 ) ) ( not ( = ?auto_27695 ?auto_27721 ) ) ( not ( = ?auto_27695 ?auto_27709 ) ) ( not ( = ?auto_27695 ?auto_27716 ) ) ( not ( = ?auto_27695 ?auto_27708 ) ) ( not ( = ?auto_27695 ?auto_27705 ) ) ( not ( = ?auto_27695 ?auto_27730 ) ) ( not ( = ?auto_27726 ?auto_27710 ) ) ( not ( = ?auto_27726 ?auto_27706 ) ) ( not ( = ?auto_27726 ?auto_27717 ) ) ( not ( = ?auto_27726 ?auto_27723 ) ) ( not ( = ?auto_27726 ?auto_27727 ) ) ( not ( = ?auto_27726 ?auto_27721 ) ) ( not ( = ?auto_27726 ?auto_27709 ) ) ( not ( = ?auto_27726 ?auto_27716 ) ) ( not ( = ?auto_27726 ?auto_27708 ) ) ( not ( = ?auto_27726 ?auto_27705 ) ) ( not ( = ?auto_27726 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27696 ) ) ( not ( = ?auto_27683 ?auto_27725 ) ) ( not ( = ?auto_27684 ?auto_27696 ) ) ( not ( = ?auto_27684 ?auto_27725 ) ) ( not ( = ?auto_27685 ?auto_27696 ) ) ( not ( = ?auto_27685 ?auto_27725 ) ) ( not ( = ?auto_27686 ?auto_27696 ) ) ( not ( = ?auto_27686 ?auto_27725 ) ) ( not ( = ?auto_27687 ?auto_27696 ) ) ( not ( = ?auto_27687 ?auto_27725 ) ) ( not ( = ?auto_27688 ?auto_27696 ) ) ( not ( = ?auto_27688 ?auto_27725 ) ) ( not ( = ?auto_27689 ?auto_27696 ) ) ( not ( = ?auto_27689 ?auto_27725 ) ) ( not ( = ?auto_27690 ?auto_27696 ) ) ( not ( = ?auto_27690 ?auto_27725 ) ) ( not ( = ?auto_27691 ?auto_27696 ) ) ( not ( = ?auto_27691 ?auto_27725 ) ) ( not ( = ?auto_27692 ?auto_27696 ) ) ( not ( = ?auto_27692 ?auto_27725 ) ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27693 ?auto_27725 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27725 ) ) ( not ( = ?auto_27696 ?auto_27726 ) ) ( not ( = ?auto_27696 ?auto_27710 ) ) ( not ( = ?auto_27696 ?auto_27706 ) ) ( not ( = ?auto_27696 ?auto_27717 ) ) ( not ( = ?auto_27696 ?auto_27723 ) ) ( not ( = ?auto_27696 ?auto_27727 ) ) ( not ( = ?auto_27696 ?auto_27721 ) ) ( not ( = ?auto_27696 ?auto_27709 ) ) ( not ( = ?auto_27696 ?auto_27716 ) ) ( not ( = ?auto_27696 ?auto_27708 ) ) ( not ( = ?auto_27696 ?auto_27705 ) ) ( not ( = ?auto_27696 ?auto_27730 ) ) ( not ( = ?auto_27725 ?auto_27726 ) ) ( not ( = ?auto_27725 ?auto_27710 ) ) ( not ( = ?auto_27725 ?auto_27706 ) ) ( not ( = ?auto_27725 ?auto_27717 ) ) ( not ( = ?auto_27725 ?auto_27723 ) ) ( not ( = ?auto_27725 ?auto_27727 ) ) ( not ( = ?auto_27725 ?auto_27721 ) ) ( not ( = ?auto_27725 ?auto_27709 ) ) ( not ( = ?auto_27725 ?auto_27716 ) ) ( not ( = ?auto_27725 ?auto_27708 ) ) ( not ( = ?auto_27725 ?auto_27705 ) ) ( not ( = ?auto_27725 ?auto_27730 ) ) ( not ( = ?auto_27683 ?auto_27697 ) ) ( not ( = ?auto_27683 ?auto_27702 ) ) ( not ( = ?auto_27684 ?auto_27697 ) ) ( not ( = ?auto_27684 ?auto_27702 ) ) ( not ( = ?auto_27685 ?auto_27697 ) ) ( not ( = ?auto_27685 ?auto_27702 ) ) ( not ( = ?auto_27686 ?auto_27697 ) ) ( not ( = ?auto_27686 ?auto_27702 ) ) ( not ( = ?auto_27687 ?auto_27697 ) ) ( not ( = ?auto_27687 ?auto_27702 ) ) ( not ( = ?auto_27688 ?auto_27697 ) ) ( not ( = ?auto_27688 ?auto_27702 ) ) ( not ( = ?auto_27689 ?auto_27697 ) ) ( not ( = ?auto_27689 ?auto_27702 ) ) ( not ( = ?auto_27690 ?auto_27697 ) ) ( not ( = ?auto_27690 ?auto_27702 ) ) ( not ( = ?auto_27691 ?auto_27697 ) ) ( not ( = ?auto_27691 ?auto_27702 ) ) ( not ( = ?auto_27692 ?auto_27697 ) ) ( not ( = ?auto_27692 ?auto_27702 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27693 ?auto_27702 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27702 ) ) ( not ( = ?auto_27695 ?auto_27697 ) ) ( not ( = ?auto_27695 ?auto_27702 ) ) ( not ( = ?auto_27697 ?auto_27725 ) ) ( not ( = ?auto_27697 ?auto_27726 ) ) ( not ( = ?auto_27697 ?auto_27710 ) ) ( not ( = ?auto_27697 ?auto_27706 ) ) ( not ( = ?auto_27697 ?auto_27717 ) ) ( not ( = ?auto_27697 ?auto_27723 ) ) ( not ( = ?auto_27697 ?auto_27727 ) ) ( not ( = ?auto_27697 ?auto_27721 ) ) ( not ( = ?auto_27697 ?auto_27709 ) ) ( not ( = ?auto_27697 ?auto_27716 ) ) ( not ( = ?auto_27697 ?auto_27708 ) ) ( not ( = ?auto_27697 ?auto_27705 ) ) ( not ( = ?auto_27697 ?auto_27730 ) ) ( not ( = ?auto_27702 ?auto_27725 ) ) ( not ( = ?auto_27702 ?auto_27726 ) ) ( not ( = ?auto_27702 ?auto_27710 ) ) ( not ( = ?auto_27702 ?auto_27706 ) ) ( not ( = ?auto_27702 ?auto_27717 ) ) ( not ( = ?auto_27702 ?auto_27723 ) ) ( not ( = ?auto_27702 ?auto_27727 ) ) ( not ( = ?auto_27702 ?auto_27721 ) ) ( not ( = ?auto_27702 ?auto_27709 ) ) ( not ( = ?auto_27702 ?auto_27716 ) ) ( not ( = ?auto_27702 ?auto_27708 ) ) ( not ( = ?auto_27702 ?auto_27705 ) ) ( not ( = ?auto_27702 ?auto_27730 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27683 ?auto_27684 ?auto_27685 ?auto_27686 ?auto_27687 ?auto_27688 ?auto_27689 ?auto_27690 ?auto_27691 ?auto_27692 ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 )
      ( MAKE-1CRATE ?auto_27696 ?auto_27697 )
      ( MAKE-14CRATE-VERIFY ?auto_27683 ?auto_27684 ?auto_27685 ?auto_27686 ?auto_27687 ?auto_27688 ?auto_27689 ?auto_27690 ?auto_27691 ?auto_27692 ?auto_27693 ?auto_27694 ?auto_27695 ?auto_27696 ?auto_27697 ) )
  )

  ( :method MAKE-15CRATE
    :parameters
    (
      ?auto_27759 - SURFACE
      ?auto_27760 - SURFACE
      ?auto_27761 - SURFACE
      ?auto_27762 - SURFACE
      ?auto_27763 - SURFACE
      ?auto_27764 - SURFACE
      ?auto_27765 - SURFACE
      ?auto_27766 - SURFACE
      ?auto_27767 - SURFACE
      ?auto_27768 - SURFACE
      ?auto_27769 - SURFACE
      ?auto_27770 - SURFACE
      ?auto_27771 - SURFACE
      ?auto_27772 - SURFACE
      ?auto_27774 - SURFACE
      ?auto_27773 - SURFACE
    )
    :vars
    (
      ?auto_27776 - HOIST
      ?auto_27780 - PLACE
      ?auto_27778 - PLACE
      ?auto_27777 - HOIST
      ?auto_27779 - SURFACE
      ?auto_27787 - PLACE
      ?auto_27791 - HOIST
      ?auto_27794 - SURFACE
      ?auto_27798 - PLACE
      ?auto_27800 - HOIST
      ?auto_27803 - SURFACE
      ?auto_27812 - PLACE
      ?auto_27811 - HOIST
      ?auto_27797 - SURFACE
      ?auto_27783 - PLACE
      ?auto_27809 - HOIST
      ?auto_27810 - SURFACE
      ?auto_27806 - PLACE
      ?auto_27785 - HOIST
      ?auto_27796 - SURFACE
      ?auto_27802 - PLACE
      ?auto_27801 - HOIST
      ?auto_27808 - SURFACE
      ?auto_27795 - SURFACE
      ?auto_27805 - PLACE
      ?auto_27799 - HOIST
      ?auto_27788 - SURFACE
      ?auto_27804 - PLACE
      ?auto_27782 - HOIST
      ?auto_27807 - SURFACE
      ?auto_27786 - SURFACE
      ?auto_27789 - SURFACE
      ?auto_27792 - PLACE
      ?auto_27790 - HOIST
      ?auto_27784 - SURFACE
      ?auto_27781 - SURFACE
      ?auto_27793 - SURFACE
      ?auto_27775 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27776 ?auto_27780 ) ( IS-CRATE ?auto_27773 ) ( not ( = ?auto_27778 ?auto_27780 ) ) ( HOIST-AT ?auto_27777 ?auto_27778 ) ( AVAILABLE ?auto_27777 ) ( SURFACE-AT ?auto_27773 ?auto_27778 ) ( ON ?auto_27773 ?auto_27779 ) ( CLEAR ?auto_27773 ) ( not ( = ?auto_27774 ?auto_27773 ) ) ( not ( = ?auto_27774 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27779 ) ) ( not ( = ?auto_27776 ?auto_27777 ) ) ( IS-CRATE ?auto_27774 ) ( not ( = ?auto_27787 ?auto_27780 ) ) ( HOIST-AT ?auto_27791 ?auto_27787 ) ( SURFACE-AT ?auto_27774 ?auto_27787 ) ( ON ?auto_27774 ?auto_27794 ) ( CLEAR ?auto_27774 ) ( not ( = ?auto_27772 ?auto_27774 ) ) ( not ( = ?auto_27772 ?auto_27794 ) ) ( not ( = ?auto_27774 ?auto_27794 ) ) ( not ( = ?auto_27776 ?auto_27791 ) ) ( IS-CRATE ?auto_27772 ) ( not ( = ?auto_27798 ?auto_27780 ) ) ( HOIST-AT ?auto_27800 ?auto_27798 ) ( SURFACE-AT ?auto_27772 ?auto_27798 ) ( ON ?auto_27772 ?auto_27803 ) ( CLEAR ?auto_27772 ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( not ( = ?auto_27771 ?auto_27803 ) ) ( not ( = ?auto_27772 ?auto_27803 ) ) ( not ( = ?auto_27776 ?auto_27800 ) ) ( IS-CRATE ?auto_27771 ) ( not ( = ?auto_27812 ?auto_27780 ) ) ( HOIST-AT ?auto_27811 ?auto_27812 ) ( SURFACE-AT ?auto_27771 ?auto_27812 ) ( ON ?auto_27771 ?auto_27797 ) ( CLEAR ?auto_27771 ) ( not ( = ?auto_27770 ?auto_27771 ) ) ( not ( = ?auto_27770 ?auto_27797 ) ) ( not ( = ?auto_27771 ?auto_27797 ) ) ( not ( = ?auto_27776 ?auto_27811 ) ) ( IS-CRATE ?auto_27770 ) ( not ( = ?auto_27783 ?auto_27780 ) ) ( HOIST-AT ?auto_27809 ?auto_27783 ) ( SURFACE-AT ?auto_27770 ?auto_27783 ) ( ON ?auto_27770 ?auto_27810 ) ( CLEAR ?auto_27770 ) ( not ( = ?auto_27769 ?auto_27770 ) ) ( not ( = ?auto_27769 ?auto_27810 ) ) ( not ( = ?auto_27770 ?auto_27810 ) ) ( not ( = ?auto_27776 ?auto_27809 ) ) ( IS-CRATE ?auto_27769 ) ( not ( = ?auto_27806 ?auto_27780 ) ) ( HOIST-AT ?auto_27785 ?auto_27806 ) ( AVAILABLE ?auto_27785 ) ( SURFACE-AT ?auto_27769 ?auto_27806 ) ( ON ?auto_27769 ?auto_27796 ) ( CLEAR ?auto_27769 ) ( not ( = ?auto_27768 ?auto_27769 ) ) ( not ( = ?auto_27768 ?auto_27796 ) ) ( not ( = ?auto_27769 ?auto_27796 ) ) ( not ( = ?auto_27776 ?auto_27785 ) ) ( IS-CRATE ?auto_27768 ) ( not ( = ?auto_27802 ?auto_27780 ) ) ( HOIST-AT ?auto_27801 ?auto_27802 ) ( AVAILABLE ?auto_27801 ) ( SURFACE-AT ?auto_27768 ?auto_27802 ) ( ON ?auto_27768 ?auto_27808 ) ( CLEAR ?auto_27768 ) ( not ( = ?auto_27767 ?auto_27768 ) ) ( not ( = ?auto_27767 ?auto_27808 ) ) ( not ( = ?auto_27768 ?auto_27808 ) ) ( not ( = ?auto_27776 ?auto_27801 ) ) ( IS-CRATE ?auto_27767 ) ( AVAILABLE ?auto_27791 ) ( SURFACE-AT ?auto_27767 ?auto_27787 ) ( ON ?auto_27767 ?auto_27795 ) ( CLEAR ?auto_27767 ) ( not ( = ?auto_27766 ?auto_27767 ) ) ( not ( = ?auto_27766 ?auto_27795 ) ) ( not ( = ?auto_27767 ?auto_27795 ) ) ( IS-CRATE ?auto_27766 ) ( not ( = ?auto_27805 ?auto_27780 ) ) ( HOIST-AT ?auto_27799 ?auto_27805 ) ( AVAILABLE ?auto_27799 ) ( SURFACE-AT ?auto_27766 ?auto_27805 ) ( ON ?auto_27766 ?auto_27788 ) ( CLEAR ?auto_27766 ) ( not ( = ?auto_27765 ?auto_27766 ) ) ( not ( = ?auto_27765 ?auto_27788 ) ) ( not ( = ?auto_27766 ?auto_27788 ) ) ( not ( = ?auto_27776 ?auto_27799 ) ) ( IS-CRATE ?auto_27765 ) ( not ( = ?auto_27804 ?auto_27780 ) ) ( HOIST-AT ?auto_27782 ?auto_27804 ) ( AVAILABLE ?auto_27782 ) ( SURFACE-AT ?auto_27765 ?auto_27804 ) ( ON ?auto_27765 ?auto_27807 ) ( CLEAR ?auto_27765 ) ( not ( = ?auto_27764 ?auto_27765 ) ) ( not ( = ?auto_27764 ?auto_27807 ) ) ( not ( = ?auto_27765 ?auto_27807 ) ) ( not ( = ?auto_27776 ?auto_27782 ) ) ( IS-CRATE ?auto_27764 ) ( SURFACE-AT ?auto_27764 ?auto_27812 ) ( ON ?auto_27764 ?auto_27786 ) ( CLEAR ?auto_27764 ) ( not ( = ?auto_27763 ?auto_27764 ) ) ( not ( = ?auto_27763 ?auto_27786 ) ) ( not ( = ?auto_27764 ?auto_27786 ) ) ( IS-CRATE ?auto_27763 ) ( AVAILABLE ?auto_27811 ) ( SURFACE-AT ?auto_27763 ?auto_27812 ) ( ON ?auto_27763 ?auto_27789 ) ( CLEAR ?auto_27763 ) ( not ( = ?auto_27762 ?auto_27763 ) ) ( not ( = ?auto_27762 ?auto_27789 ) ) ( not ( = ?auto_27763 ?auto_27789 ) ) ( IS-CRATE ?auto_27762 ) ( not ( = ?auto_27792 ?auto_27780 ) ) ( HOIST-AT ?auto_27790 ?auto_27792 ) ( AVAILABLE ?auto_27790 ) ( SURFACE-AT ?auto_27762 ?auto_27792 ) ( ON ?auto_27762 ?auto_27784 ) ( CLEAR ?auto_27762 ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( not ( = ?auto_27761 ?auto_27784 ) ) ( not ( = ?auto_27762 ?auto_27784 ) ) ( not ( = ?auto_27776 ?auto_27790 ) ) ( IS-CRATE ?auto_27761 ) ( AVAILABLE ?auto_27809 ) ( SURFACE-AT ?auto_27761 ?auto_27783 ) ( ON ?auto_27761 ?auto_27781 ) ( CLEAR ?auto_27761 ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27781 ) ) ( not ( = ?auto_27761 ?auto_27781 ) ) ( SURFACE-AT ?auto_27759 ?auto_27780 ) ( CLEAR ?auto_27759 ) ( IS-CRATE ?auto_27760 ) ( AVAILABLE ?auto_27776 ) ( AVAILABLE ?auto_27800 ) ( SURFACE-AT ?auto_27760 ?auto_27798 ) ( ON ?auto_27760 ?auto_27793 ) ( CLEAR ?auto_27760 ) ( TRUCK-AT ?auto_27775 ?auto_27780 ) ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27759 ?auto_27793 ) ) ( not ( = ?auto_27760 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27761 ) ) ( not ( = ?auto_27759 ?auto_27781 ) ) ( not ( = ?auto_27761 ?auto_27793 ) ) ( not ( = ?auto_27783 ?auto_27798 ) ) ( not ( = ?auto_27809 ?auto_27800 ) ) ( not ( = ?auto_27781 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27759 ?auto_27784 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27784 ) ) ( not ( = ?auto_27762 ?auto_27781 ) ) ( not ( = ?auto_27762 ?auto_27793 ) ) ( not ( = ?auto_27792 ?auto_27783 ) ) ( not ( = ?auto_27792 ?auto_27798 ) ) ( not ( = ?auto_27790 ?auto_27809 ) ) ( not ( = ?auto_27790 ?auto_27800 ) ) ( not ( = ?auto_27784 ?auto_27781 ) ) ( not ( = ?auto_27784 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27763 ) ) ( not ( = ?auto_27759 ?auto_27789 ) ) ( not ( = ?auto_27760 ?auto_27763 ) ) ( not ( = ?auto_27760 ?auto_27789 ) ) ( not ( = ?auto_27761 ?auto_27763 ) ) ( not ( = ?auto_27761 ?auto_27789 ) ) ( not ( = ?auto_27763 ?auto_27784 ) ) ( not ( = ?auto_27763 ?auto_27781 ) ) ( not ( = ?auto_27763 ?auto_27793 ) ) ( not ( = ?auto_27812 ?auto_27792 ) ) ( not ( = ?auto_27812 ?auto_27783 ) ) ( not ( = ?auto_27812 ?auto_27798 ) ) ( not ( = ?auto_27811 ?auto_27790 ) ) ( not ( = ?auto_27811 ?auto_27809 ) ) ( not ( = ?auto_27811 ?auto_27800 ) ) ( not ( = ?auto_27789 ?auto_27784 ) ) ( not ( = ?auto_27789 ?auto_27781 ) ) ( not ( = ?auto_27789 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27764 ) ) ( not ( = ?auto_27759 ?auto_27786 ) ) ( not ( = ?auto_27760 ?auto_27764 ) ) ( not ( = ?auto_27760 ?auto_27786 ) ) ( not ( = ?auto_27761 ?auto_27764 ) ) ( not ( = ?auto_27761 ?auto_27786 ) ) ( not ( = ?auto_27762 ?auto_27764 ) ) ( not ( = ?auto_27762 ?auto_27786 ) ) ( not ( = ?auto_27764 ?auto_27789 ) ) ( not ( = ?auto_27764 ?auto_27784 ) ) ( not ( = ?auto_27764 ?auto_27781 ) ) ( not ( = ?auto_27764 ?auto_27793 ) ) ( not ( = ?auto_27786 ?auto_27789 ) ) ( not ( = ?auto_27786 ?auto_27784 ) ) ( not ( = ?auto_27786 ?auto_27781 ) ) ( not ( = ?auto_27786 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27765 ) ) ( not ( = ?auto_27759 ?auto_27807 ) ) ( not ( = ?auto_27760 ?auto_27765 ) ) ( not ( = ?auto_27760 ?auto_27807 ) ) ( not ( = ?auto_27761 ?auto_27765 ) ) ( not ( = ?auto_27761 ?auto_27807 ) ) ( not ( = ?auto_27762 ?auto_27765 ) ) ( not ( = ?auto_27762 ?auto_27807 ) ) ( not ( = ?auto_27763 ?auto_27765 ) ) ( not ( = ?auto_27763 ?auto_27807 ) ) ( not ( = ?auto_27765 ?auto_27786 ) ) ( not ( = ?auto_27765 ?auto_27789 ) ) ( not ( = ?auto_27765 ?auto_27784 ) ) ( not ( = ?auto_27765 ?auto_27781 ) ) ( not ( = ?auto_27765 ?auto_27793 ) ) ( not ( = ?auto_27804 ?auto_27812 ) ) ( not ( = ?auto_27804 ?auto_27792 ) ) ( not ( = ?auto_27804 ?auto_27783 ) ) ( not ( = ?auto_27804 ?auto_27798 ) ) ( not ( = ?auto_27782 ?auto_27811 ) ) ( not ( = ?auto_27782 ?auto_27790 ) ) ( not ( = ?auto_27782 ?auto_27809 ) ) ( not ( = ?auto_27782 ?auto_27800 ) ) ( not ( = ?auto_27807 ?auto_27786 ) ) ( not ( = ?auto_27807 ?auto_27789 ) ) ( not ( = ?auto_27807 ?auto_27784 ) ) ( not ( = ?auto_27807 ?auto_27781 ) ) ( not ( = ?auto_27807 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27766 ) ) ( not ( = ?auto_27759 ?auto_27788 ) ) ( not ( = ?auto_27760 ?auto_27766 ) ) ( not ( = ?auto_27760 ?auto_27788 ) ) ( not ( = ?auto_27761 ?auto_27766 ) ) ( not ( = ?auto_27761 ?auto_27788 ) ) ( not ( = ?auto_27762 ?auto_27766 ) ) ( not ( = ?auto_27762 ?auto_27788 ) ) ( not ( = ?auto_27763 ?auto_27766 ) ) ( not ( = ?auto_27763 ?auto_27788 ) ) ( not ( = ?auto_27764 ?auto_27766 ) ) ( not ( = ?auto_27764 ?auto_27788 ) ) ( not ( = ?auto_27766 ?auto_27807 ) ) ( not ( = ?auto_27766 ?auto_27786 ) ) ( not ( = ?auto_27766 ?auto_27789 ) ) ( not ( = ?auto_27766 ?auto_27784 ) ) ( not ( = ?auto_27766 ?auto_27781 ) ) ( not ( = ?auto_27766 ?auto_27793 ) ) ( not ( = ?auto_27805 ?auto_27804 ) ) ( not ( = ?auto_27805 ?auto_27812 ) ) ( not ( = ?auto_27805 ?auto_27792 ) ) ( not ( = ?auto_27805 ?auto_27783 ) ) ( not ( = ?auto_27805 ?auto_27798 ) ) ( not ( = ?auto_27799 ?auto_27782 ) ) ( not ( = ?auto_27799 ?auto_27811 ) ) ( not ( = ?auto_27799 ?auto_27790 ) ) ( not ( = ?auto_27799 ?auto_27809 ) ) ( not ( = ?auto_27799 ?auto_27800 ) ) ( not ( = ?auto_27788 ?auto_27807 ) ) ( not ( = ?auto_27788 ?auto_27786 ) ) ( not ( = ?auto_27788 ?auto_27789 ) ) ( not ( = ?auto_27788 ?auto_27784 ) ) ( not ( = ?auto_27788 ?auto_27781 ) ) ( not ( = ?auto_27788 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27767 ) ) ( not ( = ?auto_27759 ?auto_27795 ) ) ( not ( = ?auto_27760 ?auto_27767 ) ) ( not ( = ?auto_27760 ?auto_27795 ) ) ( not ( = ?auto_27761 ?auto_27767 ) ) ( not ( = ?auto_27761 ?auto_27795 ) ) ( not ( = ?auto_27762 ?auto_27767 ) ) ( not ( = ?auto_27762 ?auto_27795 ) ) ( not ( = ?auto_27763 ?auto_27767 ) ) ( not ( = ?auto_27763 ?auto_27795 ) ) ( not ( = ?auto_27764 ?auto_27767 ) ) ( not ( = ?auto_27764 ?auto_27795 ) ) ( not ( = ?auto_27765 ?auto_27767 ) ) ( not ( = ?auto_27765 ?auto_27795 ) ) ( not ( = ?auto_27767 ?auto_27788 ) ) ( not ( = ?auto_27767 ?auto_27807 ) ) ( not ( = ?auto_27767 ?auto_27786 ) ) ( not ( = ?auto_27767 ?auto_27789 ) ) ( not ( = ?auto_27767 ?auto_27784 ) ) ( not ( = ?auto_27767 ?auto_27781 ) ) ( not ( = ?auto_27767 ?auto_27793 ) ) ( not ( = ?auto_27787 ?auto_27805 ) ) ( not ( = ?auto_27787 ?auto_27804 ) ) ( not ( = ?auto_27787 ?auto_27812 ) ) ( not ( = ?auto_27787 ?auto_27792 ) ) ( not ( = ?auto_27787 ?auto_27783 ) ) ( not ( = ?auto_27787 ?auto_27798 ) ) ( not ( = ?auto_27791 ?auto_27799 ) ) ( not ( = ?auto_27791 ?auto_27782 ) ) ( not ( = ?auto_27791 ?auto_27811 ) ) ( not ( = ?auto_27791 ?auto_27790 ) ) ( not ( = ?auto_27791 ?auto_27809 ) ) ( not ( = ?auto_27791 ?auto_27800 ) ) ( not ( = ?auto_27795 ?auto_27788 ) ) ( not ( = ?auto_27795 ?auto_27807 ) ) ( not ( = ?auto_27795 ?auto_27786 ) ) ( not ( = ?auto_27795 ?auto_27789 ) ) ( not ( = ?auto_27795 ?auto_27784 ) ) ( not ( = ?auto_27795 ?auto_27781 ) ) ( not ( = ?auto_27795 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27768 ) ) ( not ( = ?auto_27759 ?auto_27808 ) ) ( not ( = ?auto_27760 ?auto_27768 ) ) ( not ( = ?auto_27760 ?auto_27808 ) ) ( not ( = ?auto_27761 ?auto_27768 ) ) ( not ( = ?auto_27761 ?auto_27808 ) ) ( not ( = ?auto_27762 ?auto_27768 ) ) ( not ( = ?auto_27762 ?auto_27808 ) ) ( not ( = ?auto_27763 ?auto_27768 ) ) ( not ( = ?auto_27763 ?auto_27808 ) ) ( not ( = ?auto_27764 ?auto_27768 ) ) ( not ( = ?auto_27764 ?auto_27808 ) ) ( not ( = ?auto_27765 ?auto_27768 ) ) ( not ( = ?auto_27765 ?auto_27808 ) ) ( not ( = ?auto_27766 ?auto_27768 ) ) ( not ( = ?auto_27766 ?auto_27808 ) ) ( not ( = ?auto_27768 ?auto_27795 ) ) ( not ( = ?auto_27768 ?auto_27788 ) ) ( not ( = ?auto_27768 ?auto_27807 ) ) ( not ( = ?auto_27768 ?auto_27786 ) ) ( not ( = ?auto_27768 ?auto_27789 ) ) ( not ( = ?auto_27768 ?auto_27784 ) ) ( not ( = ?auto_27768 ?auto_27781 ) ) ( not ( = ?auto_27768 ?auto_27793 ) ) ( not ( = ?auto_27802 ?auto_27787 ) ) ( not ( = ?auto_27802 ?auto_27805 ) ) ( not ( = ?auto_27802 ?auto_27804 ) ) ( not ( = ?auto_27802 ?auto_27812 ) ) ( not ( = ?auto_27802 ?auto_27792 ) ) ( not ( = ?auto_27802 ?auto_27783 ) ) ( not ( = ?auto_27802 ?auto_27798 ) ) ( not ( = ?auto_27801 ?auto_27791 ) ) ( not ( = ?auto_27801 ?auto_27799 ) ) ( not ( = ?auto_27801 ?auto_27782 ) ) ( not ( = ?auto_27801 ?auto_27811 ) ) ( not ( = ?auto_27801 ?auto_27790 ) ) ( not ( = ?auto_27801 ?auto_27809 ) ) ( not ( = ?auto_27801 ?auto_27800 ) ) ( not ( = ?auto_27808 ?auto_27795 ) ) ( not ( = ?auto_27808 ?auto_27788 ) ) ( not ( = ?auto_27808 ?auto_27807 ) ) ( not ( = ?auto_27808 ?auto_27786 ) ) ( not ( = ?auto_27808 ?auto_27789 ) ) ( not ( = ?auto_27808 ?auto_27784 ) ) ( not ( = ?auto_27808 ?auto_27781 ) ) ( not ( = ?auto_27808 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27769 ) ) ( not ( = ?auto_27759 ?auto_27796 ) ) ( not ( = ?auto_27760 ?auto_27769 ) ) ( not ( = ?auto_27760 ?auto_27796 ) ) ( not ( = ?auto_27761 ?auto_27769 ) ) ( not ( = ?auto_27761 ?auto_27796 ) ) ( not ( = ?auto_27762 ?auto_27769 ) ) ( not ( = ?auto_27762 ?auto_27796 ) ) ( not ( = ?auto_27763 ?auto_27769 ) ) ( not ( = ?auto_27763 ?auto_27796 ) ) ( not ( = ?auto_27764 ?auto_27769 ) ) ( not ( = ?auto_27764 ?auto_27796 ) ) ( not ( = ?auto_27765 ?auto_27769 ) ) ( not ( = ?auto_27765 ?auto_27796 ) ) ( not ( = ?auto_27766 ?auto_27769 ) ) ( not ( = ?auto_27766 ?auto_27796 ) ) ( not ( = ?auto_27767 ?auto_27769 ) ) ( not ( = ?auto_27767 ?auto_27796 ) ) ( not ( = ?auto_27769 ?auto_27808 ) ) ( not ( = ?auto_27769 ?auto_27795 ) ) ( not ( = ?auto_27769 ?auto_27788 ) ) ( not ( = ?auto_27769 ?auto_27807 ) ) ( not ( = ?auto_27769 ?auto_27786 ) ) ( not ( = ?auto_27769 ?auto_27789 ) ) ( not ( = ?auto_27769 ?auto_27784 ) ) ( not ( = ?auto_27769 ?auto_27781 ) ) ( not ( = ?auto_27769 ?auto_27793 ) ) ( not ( = ?auto_27806 ?auto_27802 ) ) ( not ( = ?auto_27806 ?auto_27787 ) ) ( not ( = ?auto_27806 ?auto_27805 ) ) ( not ( = ?auto_27806 ?auto_27804 ) ) ( not ( = ?auto_27806 ?auto_27812 ) ) ( not ( = ?auto_27806 ?auto_27792 ) ) ( not ( = ?auto_27806 ?auto_27783 ) ) ( not ( = ?auto_27806 ?auto_27798 ) ) ( not ( = ?auto_27785 ?auto_27801 ) ) ( not ( = ?auto_27785 ?auto_27791 ) ) ( not ( = ?auto_27785 ?auto_27799 ) ) ( not ( = ?auto_27785 ?auto_27782 ) ) ( not ( = ?auto_27785 ?auto_27811 ) ) ( not ( = ?auto_27785 ?auto_27790 ) ) ( not ( = ?auto_27785 ?auto_27809 ) ) ( not ( = ?auto_27785 ?auto_27800 ) ) ( not ( = ?auto_27796 ?auto_27808 ) ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( not ( = ?auto_27796 ?auto_27788 ) ) ( not ( = ?auto_27796 ?auto_27807 ) ) ( not ( = ?auto_27796 ?auto_27786 ) ) ( not ( = ?auto_27796 ?auto_27789 ) ) ( not ( = ?auto_27796 ?auto_27784 ) ) ( not ( = ?auto_27796 ?auto_27781 ) ) ( not ( = ?auto_27796 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27770 ) ) ( not ( = ?auto_27759 ?auto_27810 ) ) ( not ( = ?auto_27760 ?auto_27770 ) ) ( not ( = ?auto_27760 ?auto_27810 ) ) ( not ( = ?auto_27761 ?auto_27770 ) ) ( not ( = ?auto_27761 ?auto_27810 ) ) ( not ( = ?auto_27762 ?auto_27770 ) ) ( not ( = ?auto_27762 ?auto_27810 ) ) ( not ( = ?auto_27763 ?auto_27770 ) ) ( not ( = ?auto_27763 ?auto_27810 ) ) ( not ( = ?auto_27764 ?auto_27770 ) ) ( not ( = ?auto_27764 ?auto_27810 ) ) ( not ( = ?auto_27765 ?auto_27770 ) ) ( not ( = ?auto_27765 ?auto_27810 ) ) ( not ( = ?auto_27766 ?auto_27770 ) ) ( not ( = ?auto_27766 ?auto_27810 ) ) ( not ( = ?auto_27767 ?auto_27770 ) ) ( not ( = ?auto_27767 ?auto_27810 ) ) ( not ( = ?auto_27768 ?auto_27770 ) ) ( not ( = ?auto_27768 ?auto_27810 ) ) ( not ( = ?auto_27770 ?auto_27796 ) ) ( not ( = ?auto_27770 ?auto_27808 ) ) ( not ( = ?auto_27770 ?auto_27795 ) ) ( not ( = ?auto_27770 ?auto_27788 ) ) ( not ( = ?auto_27770 ?auto_27807 ) ) ( not ( = ?auto_27770 ?auto_27786 ) ) ( not ( = ?auto_27770 ?auto_27789 ) ) ( not ( = ?auto_27770 ?auto_27784 ) ) ( not ( = ?auto_27770 ?auto_27781 ) ) ( not ( = ?auto_27770 ?auto_27793 ) ) ( not ( = ?auto_27810 ?auto_27796 ) ) ( not ( = ?auto_27810 ?auto_27808 ) ) ( not ( = ?auto_27810 ?auto_27795 ) ) ( not ( = ?auto_27810 ?auto_27788 ) ) ( not ( = ?auto_27810 ?auto_27807 ) ) ( not ( = ?auto_27810 ?auto_27786 ) ) ( not ( = ?auto_27810 ?auto_27789 ) ) ( not ( = ?auto_27810 ?auto_27784 ) ) ( not ( = ?auto_27810 ?auto_27781 ) ) ( not ( = ?auto_27810 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27771 ) ) ( not ( = ?auto_27759 ?auto_27797 ) ) ( not ( = ?auto_27760 ?auto_27771 ) ) ( not ( = ?auto_27760 ?auto_27797 ) ) ( not ( = ?auto_27761 ?auto_27771 ) ) ( not ( = ?auto_27761 ?auto_27797 ) ) ( not ( = ?auto_27762 ?auto_27771 ) ) ( not ( = ?auto_27762 ?auto_27797 ) ) ( not ( = ?auto_27763 ?auto_27771 ) ) ( not ( = ?auto_27763 ?auto_27797 ) ) ( not ( = ?auto_27764 ?auto_27771 ) ) ( not ( = ?auto_27764 ?auto_27797 ) ) ( not ( = ?auto_27765 ?auto_27771 ) ) ( not ( = ?auto_27765 ?auto_27797 ) ) ( not ( = ?auto_27766 ?auto_27771 ) ) ( not ( = ?auto_27766 ?auto_27797 ) ) ( not ( = ?auto_27767 ?auto_27771 ) ) ( not ( = ?auto_27767 ?auto_27797 ) ) ( not ( = ?auto_27768 ?auto_27771 ) ) ( not ( = ?auto_27768 ?auto_27797 ) ) ( not ( = ?auto_27769 ?auto_27771 ) ) ( not ( = ?auto_27769 ?auto_27797 ) ) ( not ( = ?auto_27771 ?auto_27810 ) ) ( not ( = ?auto_27771 ?auto_27796 ) ) ( not ( = ?auto_27771 ?auto_27808 ) ) ( not ( = ?auto_27771 ?auto_27795 ) ) ( not ( = ?auto_27771 ?auto_27788 ) ) ( not ( = ?auto_27771 ?auto_27807 ) ) ( not ( = ?auto_27771 ?auto_27786 ) ) ( not ( = ?auto_27771 ?auto_27789 ) ) ( not ( = ?auto_27771 ?auto_27784 ) ) ( not ( = ?auto_27771 ?auto_27781 ) ) ( not ( = ?auto_27771 ?auto_27793 ) ) ( not ( = ?auto_27797 ?auto_27810 ) ) ( not ( = ?auto_27797 ?auto_27796 ) ) ( not ( = ?auto_27797 ?auto_27808 ) ) ( not ( = ?auto_27797 ?auto_27795 ) ) ( not ( = ?auto_27797 ?auto_27788 ) ) ( not ( = ?auto_27797 ?auto_27807 ) ) ( not ( = ?auto_27797 ?auto_27786 ) ) ( not ( = ?auto_27797 ?auto_27789 ) ) ( not ( = ?auto_27797 ?auto_27784 ) ) ( not ( = ?auto_27797 ?auto_27781 ) ) ( not ( = ?auto_27797 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27772 ) ) ( not ( = ?auto_27759 ?auto_27803 ) ) ( not ( = ?auto_27760 ?auto_27772 ) ) ( not ( = ?auto_27760 ?auto_27803 ) ) ( not ( = ?auto_27761 ?auto_27772 ) ) ( not ( = ?auto_27761 ?auto_27803 ) ) ( not ( = ?auto_27762 ?auto_27772 ) ) ( not ( = ?auto_27762 ?auto_27803 ) ) ( not ( = ?auto_27763 ?auto_27772 ) ) ( not ( = ?auto_27763 ?auto_27803 ) ) ( not ( = ?auto_27764 ?auto_27772 ) ) ( not ( = ?auto_27764 ?auto_27803 ) ) ( not ( = ?auto_27765 ?auto_27772 ) ) ( not ( = ?auto_27765 ?auto_27803 ) ) ( not ( = ?auto_27766 ?auto_27772 ) ) ( not ( = ?auto_27766 ?auto_27803 ) ) ( not ( = ?auto_27767 ?auto_27772 ) ) ( not ( = ?auto_27767 ?auto_27803 ) ) ( not ( = ?auto_27768 ?auto_27772 ) ) ( not ( = ?auto_27768 ?auto_27803 ) ) ( not ( = ?auto_27769 ?auto_27772 ) ) ( not ( = ?auto_27769 ?auto_27803 ) ) ( not ( = ?auto_27770 ?auto_27772 ) ) ( not ( = ?auto_27770 ?auto_27803 ) ) ( not ( = ?auto_27772 ?auto_27797 ) ) ( not ( = ?auto_27772 ?auto_27810 ) ) ( not ( = ?auto_27772 ?auto_27796 ) ) ( not ( = ?auto_27772 ?auto_27808 ) ) ( not ( = ?auto_27772 ?auto_27795 ) ) ( not ( = ?auto_27772 ?auto_27788 ) ) ( not ( = ?auto_27772 ?auto_27807 ) ) ( not ( = ?auto_27772 ?auto_27786 ) ) ( not ( = ?auto_27772 ?auto_27789 ) ) ( not ( = ?auto_27772 ?auto_27784 ) ) ( not ( = ?auto_27772 ?auto_27781 ) ) ( not ( = ?auto_27772 ?auto_27793 ) ) ( not ( = ?auto_27803 ?auto_27797 ) ) ( not ( = ?auto_27803 ?auto_27810 ) ) ( not ( = ?auto_27803 ?auto_27796 ) ) ( not ( = ?auto_27803 ?auto_27808 ) ) ( not ( = ?auto_27803 ?auto_27795 ) ) ( not ( = ?auto_27803 ?auto_27788 ) ) ( not ( = ?auto_27803 ?auto_27807 ) ) ( not ( = ?auto_27803 ?auto_27786 ) ) ( not ( = ?auto_27803 ?auto_27789 ) ) ( not ( = ?auto_27803 ?auto_27784 ) ) ( not ( = ?auto_27803 ?auto_27781 ) ) ( not ( = ?auto_27803 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27774 ) ) ( not ( = ?auto_27759 ?auto_27794 ) ) ( not ( = ?auto_27760 ?auto_27774 ) ) ( not ( = ?auto_27760 ?auto_27794 ) ) ( not ( = ?auto_27761 ?auto_27774 ) ) ( not ( = ?auto_27761 ?auto_27794 ) ) ( not ( = ?auto_27762 ?auto_27774 ) ) ( not ( = ?auto_27762 ?auto_27794 ) ) ( not ( = ?auto_27763 ?auto_27774 ) ) ( not ( = ?auto_27763 ?auto_27794 ) ) ( not ( = ?auto_27764 ?auto_27774 ) ) ( not ( = ?auto_27764 ?auto_27794 ) ) ( not ( = ?auto_27765 ?auto_27774 ) ) ( not ( = ?auto_27765 ?auto_27794 ) ) ( not ( = ?auto_27766 ?auto_27774 ) ) ( not ( = ?auto_27766 ?auto_27794 ) ) ( not ( = ?auto_27767 ?auto_27774 ) ) ( not ( = ?auto_27767 ?auto_27794 ) ) ( not ( = ?auto_27768 ?auto_27774 ) ) ( not ( = ?auto_27768 ?auto_27794 ) ) ( not ( = ?auto_27769 ?auto_27774 ) ) ( not ( = ?auto_27769 ?auto_27794 ) ) ( not ( = ?auto_27770 ?auto_27774 ) ) ( not ( = ?auto_27770 ?auto_27794 ) ) ( not ( = ?auto_27771 ?auto_27774 ) ) ( not ( = ?auto_27771 ?auto_27794 ) ) ( not ( = ?auto_27774 ?auto_27803 ) ) ( not ( = ?auto_27774 ?auto_27797 ) ) ( not ( = ?auto_27774 ?auto_27810 ) ) ( not ( = ?auto_27774 ?auto_27796 ) ) ( not ( = ?auto_27774 ?auto_27808 ) ) ( not ( = ?auto_27774 ?auto_27795 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27774 ?auto_27807 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27789 ) ) ( not ( = ?auto_27774 ?auto_27784 ) ) ( not ( = ?auto_27774 ?auto_27781 ) ) ( not ( = ?auto_27774 ?auto_27793 ) ) ( not ( = ?auto_27794 ?auto_27803 ) ) ( not ( = ?auto_27794 ?auto_27797 ) ) ( not ( = ?auto_27794 ?auto_27810 ) ) ( not ( = ?auto_27794 ?auto_27796 ) ) ( not ( = ?auto_27794 ?auto_27808 ) ) ( not ( = ?auto_27794 ?auto_27795 ) ) ( not ( = ?auto_27794 ?auto_27788 ) ) ( not ( = ?auto_27794 ?auto_27807 ) ) ( not ( = ?auto_27794 ?auto_27786 ) ) ( not ( = ?auto_27794 ?auto_27789 ) ) ( not ( = ?auto_27794 ?auto_27784 ) ) ( not ( = ?auto_27794 ?auto_27781 ) ) ( not ( = ?auto_27794 ?auto_27793 ) ) ( not ( = ?auto_27759 ?auto_27773 ) ) ( not ( = ?auto_27759 ?auto_27779 ) ) ( not ( = ?auto_27760 ?auto_27773 ) ) ( not ( = ?auto_27760 ?auto_27779 ) ) ( not ( = ?auto_27761 ?auto_27773 ) ) ( not ( = ?auto_27761 ?auto_27779 ) ) ( not ( = ?auto_27762 ?auto_27773 ) ) ( not ( = ?auto_27762 ?auto_27779 ) ) ( not ( = ?auto_27763 ?auto_27773 ) ) ( not ( = ?auto_27763 ?auto_27779 ) ) ( not ( = ?auto_27764 ?auto_27773 ) ) ( not ( = ?auto_27764 ?auto_27779 ) ) ( not ( = ?auto_27765 ?auto_27773 ) ) ( not ( = ?auto_27765 ?auto_27779 ) ) ( not ( = ?auto_27766 ?auto_27773 ) ) ( not ( = ?auto_27766 ?auto_27779 ) ) ( not ( = ?auto_27767 ?auto_27773 ) ) ( not ( = ?auto_27767 ?auto_27779 ) ) ( not ( = ?auto_27768 ?auto_27773 ) ) ( not ( = ?auto_27768 ?auto_27779 ) ) ( not ( = ?auto_27769 ?auto_27773 ) ) ( not ( = ?auto_27769 ?auto_27779 ) ) ( not ( = ?auto_27770 ?auto_27773 ) ) ( not ( = ?auto_27770 ?auto_27779 ) ) ( not ( = ?auto_27771 ?auto_27773 ) ) ( not ( = ?auto_27771 ?auto_27779 ) ) ( not ( = ?auto_27772 ?auto_27773 ) ) ( not ( = ?auto_27772 ?auto_27779 ) ) ( not ( = ?auto_27773 ?auto_27794 ) ) ( not ( = ?auto_27773 ?auto_27803 ) ) ( not ( = ?auto_27773 ?auto_27797 ) ) ( not ( = ?auto_27773 ?auto_27810 ) ) ( not ( = ?auto_27773 ?auto_27796 ) ) ( not ( = ?auto_27773 ?auto_27808 ) ) ( not ( = ?auto_27773 ?auto_27795 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27773 ?auto_27807 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27789 ) ) ( not ( = ?auto_27773 ?auto_27784 ) ) ( not ( = ?auto_27773 ?auto_27781 ) ) ( not ( = ?auto_27773 ?auto_27793 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27798 ) ) ( not ( = ?auto_27778 ?auto_27812 ) ) ( not ( = ?auto_27778 ?auto_27783 ) ) ( not ( = ?auto_27778 ?auto_27806 ) ) ( not ( = ?auto_27778 ?auto_27802 ) ) ( not ( = ?auto_27778 ?auto_27805 ) ) ( not ( = ?auto_27778 ?auto_27804 ) ) ( not ( = ?auto_27778 ?auto_27792 ) ) ( not ( = ?auto_27777 ?auto_27791 ) ) ( not ( = ?auto_27777 ?auto_27800 ) ) ( not ( = ?auto_27777 ?auto_27811 ) ) ( not ( = ?auto_27777 ?auto_27809 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( not ( = ?auto_27777 ?auto_27801 ) ) ( not ( = ?auto_27777 ?auto_27799 ) ) ( not ( = ?auto_27777 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27790 ) ) ( not ( = ?auto_27779 ?auto_27794 ) ) ( not ( = ?auto_27779 ?auto_27803 ) ) ( not ( = ?auto_27779 ?auto_27797 ) ) ( not ( = ?auto_27779 ?auto_27810 ) ) ( not ( = ?auto_27779 ?auto_27796 ) ) ( not ( = ?auto_27779 ?auto_27808 ) ) ( not ( = ?auto_27779 ?auto_27795 ) ) ( not ( = ?auto_27779 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27807 ) ) ( not ( = ?auto_27779 ?auto_27786 ) ) ( not ( = ?auto_27779 ?auto_27789 ) ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27793 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ?auto_27763 ?auto_27764 ?auto_27765 ?auto_27766 ?auto_27767 ?auto_27768 ?auto_27769 ?auto_27770 ?auto_27771 ?auto_27772 ?auto_27774 )
      ( MAKE-1CRATE ?auto_27774 ?auto_27773 )
      ( MAKE-15CRATE-VERIFY ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ?auto_27763 ?auto_27764 ?auto_27765 ?auto_27766 ?auto_27767 ?auto_27768 ?auto_27769 ?auto_27770 ?auto_27771 ?auto_27772 ?auto_27774 ?auto_27773 ) )
  )

  ( :method MAKE-16CRATE
    :parameters
    (
      ?auto_27840 - SURFACE
      ?auto_27841 - SURFACE
      ?auto_27842 - SURFACE
      ?auto_27843 - SURFACE
      ?auto_27844 - SURFACE
      ?auto_27845 - SURFACE
      ?auto_27846 - SURFACE
      ?auto_27847 - SURFACE
      ?auto_27848 - SURFACE
      ?auto_27849 - SURFACE
      ?auto_27850 - SURFACE
      ?auto_27851 - SURFACE
      ?auto_27852 - SURFACE
      ?auto_27853 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27854 - SURFACE
      ?auto_27856 - SURFACE
    )
    :vars
    (
      ?auto_27861 - HOIST
      ?auto_27862 - PLACE
      ?auto_27857 - PLACE
      ?auto_27859 - HOIST
      ?auto_27860 - SURFACE
      ?auto_27895 - PLACE
      ?auto_27886 - HOIST
      ?auto_27891 - SURFACE
      ?auto_27869 - PLACE
      ?auto_27882 - HOIST
      ?auto_27871 - SURFACE
      ?auto_27894 - PLACE
      ?auto_27876 - HOIST
      ?auto_27884 - SURFACE
      ?auto_27877 - PLACE
      ?auto_27893 - HOIST
      ?auto_27872 - SURFACE
      ?auto_27866 - PLACE
      ?auto_27863 - HOIST
      ?auto_27870 - SURFACE
      ?auto_27890 - PLACE
      ?auto_27887 - HOIST
      ?auto_27888 - SURFACE
      ?auto_27892 - SURFACE
      ?auto_27885 - SURFACE
      ?auto_27880 - PLACE
      ?auto_27883 - HOIST
      ?auto_27874 - SURFACE
      ?auto_27867 - PLACE
      ?auto_27873 - HOIST
      ?auto_27879 - SURFACE
      ?auto_27881 - SURFACE
      ?auto_27875 - SURFACE
      ?auto_27878 - PLACE
      ?auto_27889 - HOIST
      ?auto_27864 - SURFACE
      ?auto_27865 - SURFACE
      ?auto_27868 - SURFACE
      ?auto_27858 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27861 ?auto_27862 ) ( IS-CRATE ?auto_27856 ) ( not ( = ?auto_27857 ?auto_27862 ) ) ( HOIST-AT ?auto_27859 ?auto_27857 ) ( SURFACE-AT ?auto_27856 ?auto_27857 ) ( ON ?auto_27856 ?auto_27860 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27860 ) ) ( not ( = ?auto_27861 ?auto_27859 ) ) ( IS-CRATE ?auto_27854 ) ( not ( = ?auto_27895 ?auto_27862 ) ) ( HOIST-AT ?auto_27886 ?auto_27895 ) ( AVAILABLE ?auto_27886 ) ( SURFACE-AT ?auto_27854 ?auto_27895 ) ( ON ?auto_27854 ?auto_27891 ) ( CLEAR ?auto_27854 ) ( not ( = ?auto_27855 ?auto_27854 ) ) ( not ( = ?auto_27855 ?auto_27891 ) ) ( not ( = ?auto_27854 ?auto_27891 ) ) ( not ( = ?auto_27861 ?auto_27886 ) ) ( IS-CRATE ?auto_27855 ) ( not ( = ?auto_27869 ?auto_27862 ) ) ( HOIST-AT ?auto_27882 ?auto_27869 ) ( SURFACE-AT ?auto_27855 ?auto_27869 ) ( ON ?auto_27855 ?auto_27871 ) ( CLEAR ?auto_27855 ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27871 ) ) ( not ( = ?auto_27855 ?auto_27871 ) ) ( not ( = ?auto_27861 ?auto_27882 ) ) ( IS-CRATE ?auto_27853 ) ( not ( = ?auto_27894 ?auto_27862 ) ) ( HOIST-AT ?auto_27876 ?auto_27894 ) ( SURFACE-AT ?auto_27853 ?auto_27894 ) ( ON ?auto_27853 ?auto_27884 ) ( CLEAR ?auto_27853 ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27884 ) ) ( not ( = ?auto_27853 ?auto_27884 ) ) ( not ( = ?auto_27861 ?auto_27876 ) ) ( IS-CRATE ?auto_27852 ) ( not ( = ?auto_27877 ?auto_27862 ) ) ( HOIST-AT ?auto_27893 ?auto_27877 ) ( SURFACE-AT ?auto_27852 ?auto_27877 ) ( ON ?auto_27852 ?auto_27872 ) ( CLEAR ?auto_27852 ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27872 ) ) ( not ( = ?auto_27852 ?auto_27872 ) ) ( not ( = ?auto_27861 ?auto_27893 ) ) ( IS-CRATE ?auto_27851 ) ( not ( = ?auto_27866 ?auto_27862 ) ) ( HOIST-AT ?auto_27863 ?auto_27866 ) ( SURFACE-AT ?auto_27851 ?auto_27866 ) ( ON ?auto_27851 ?auto_27870 ) ( CLEAR ?auto_27851 ) ( not ( = ?auto_27850 ?auto_27851 ) ) ( not ( = ?auto_27850 ?auto_27870 ) ) ( not ( = ?auto_27851 ?auto_27870 ) ) ( not ( = ?auto_27861 ?auto_27863 ) ) ( IS-CRATE ?auto_27850 ) ( not ( = ?auto_27890 ?auto_27862 ) ) ( HOIST-AT ?auto_27887 ?auto_27890 ) ( AVAILABLE ?auto_27887 ) ( SURFACE-AT ?auto_27850 ?auto_27890 ) ( ON ?auto_27850 ?auto_27888 ) ( CLEAR ?auto_27850 ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27888 ) ) ( not ( = ?auto_27850 ?auto_27888 ) ) ( not ( = ?auto_27861 ?auto_27887 ) ) ( IS-CRATE ?auto_27849 ) ( AVAILABLE ?auto_27859 ) ( SURFACE-AT ?auto_27849 ?auto_27857 ) ( ON ?auto_27849 ?auto_27892 ) ( CLEAR ?auto_27849 ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27892 ) ) ( not ( = ?auto_27849 ?auto_27892 ) ) ( IS-CRATE ?auto_27848 ) ( AVAILABLE ?auto_27882 ) ( SURFACE-AT ?auto_27848 ?auto_27869 ) ( ON ?auto_27848 ?auto_27885 ) ( CLEAR ?auto_27848 ) ( not ( = ?auto_27847 ?auto_27848 ) ) ( not ( = ?auto_27847 ?auto_27885 ) ) ( not ( = ?auto_27848 ?auto_27885 ) ) ( IS-CRATE ?auto_27847 ) ( not ( = ?auto_27880 ?auto_27862 ) ) ( HOIST-AT ?auto_27883 ?auto_27880 ) ( AVAILABLE ?auto_27883 ) ( SURFACE-AT ?auto_27847 ?auto_27880 ) ( ON ?auto_27847 ?auto_27874 ) ( CLEAR ?auto_27847 ) ( not ( = ?auto_27846 ?auto_27847 ) ) ( not ( = ?auto_27846 ?auto_27874 ) ) ( not ( = ?auto_27847 ?auto_27874 ) ) ( not ( = ?auto_27861 ?auto_27883 ) ) ( IS-CRATE ?auto_27846 ) ( not ( = ?auto_27867 ?auto_27862 ) ) ( HOIST-AT ?auto_27873 ?auto_27867 ) ( AVAILABLE ?auto_27873 ) ( SURFACE-AT ?auto_27846 ?auto_27867 ) ( ON ?auto_27846 ?auto_27879 ) ( CLEAR ?auto_27846 ) ( not ( = ?auto_27845 ?auto_27846 ) ) ( not ( = ?auto_27845 ?auto_27879 ) ) ( not ( = ?auto_27846 ?auto_27879 ) ) ( not ( = ?auto_27861 ?auto_27873 ) ) ( IS-CRATE ?auto_27845 ) ( SURFACE-AT ?auto_27845 ?auto_27877 ) ( ON ?auto_27845 ?auto_27881 ) ( CLEAR ?auto_27845 ) ( not ( = ?auto_27844 ?auto_27845 ) ) ( not ( = ?auto_27844 ?auto_27881 ) ) ( not ( = ?auto_27845 ?auto_27881 ) ) ( IS-CRATE ?auto_27844 ) ( AVAILABLE ?auto_27893 ) ( SURFACE-AT ?auto_27844 ?auto_27877 ) ( ON ?auto_27844 ?auto_27875 ) ( CLEAR ?auto_27844 ) ( not ( = ?auto_27843 ?auto_27844 ) ) ( not ( = ?auto_27843 ?auto_27875 ) ) ( not ( = ?auto_27844 ?auto_27875 ) ) ( IS-CRATE ?auto_27843 ) ( not ( = ?auto_27878 ?auto_27862 ) ) ( HOIST-AT ?auto_27889 ?auto_27878 ) ( AVAILABLE ?auto_27889 ) ( SURFACE-AT ?auto_27843 ?auto_27878 ) ( ON ?auto_27843 ?auto_27864 ) ( CLEAR ?auto_27843 ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27864 ) ) ( not ( = ?auto_27843 ?auto_27864 ) ) ( not ( = ?auto_27861 ?auto_27889 ) ) ( IS-CRATE ?auto_27842 ) ( AVAILABLE ?auto_27863 ) ( SURFACE-AT ?auto_27842 ?auto_27866 ) ( ON ?auto_27842 ?auto_27865 ) ( CLEAR ?auto_27842 ) ( not ( = ?auto_27841 ?auto_27842 ) ) ( not ( = ?auto_27841 ?auto_27865 ) ) ( not ( = ?auto_27842 ?auto_27865 ) ) ( SURFACE-AT ?auto_27840 ?auto_27862 ) ( CLEAR ?auto_27840 ) ( IS-CRATE ?auto_27841 ) ( AVAILABLE ?auto_27861 ) ( AVAILABLE ?auto_27876 ) ( SURFACE-AT ?auto_27841 ?auto_27894 ) ( ON ?auto_27841 ?auto_27868 ) ( CLEAR ?auto_27841 ) ( TRUCK-AT ?auto_27858 ?auto_27862 ) ( not ( = ?auto_27840 ?auto_27841 ) ) ( not ( = ?auto_27840 ?auto_27868 ) ) ( not ( = ?auto_27841 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27842 ) ) ( not ( = ?auto_27840 ?auto_27865 ) ) ( not ( = ?auto_27842 ?auto_27868 ) ) ( not ( = ?auto_27866 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27876 ) ) ( not ( = ?auto_27865 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27843 ) ) ( not ( = ?auto_27840 ?auto_27864 ) ) ( not ( = ?auto_27841 ?auto_27843 ) ) ( not ( = ?auto_27841 ?auto_27864 ) ) ( not ( = ?auto_27843 ?auto_27865 ) ) ( not ( = ?auto_27843 ?auto_27868 ) ) ( not ( = ?auto_27878 ?auto_27866 ) ) ( not ( = ?auto_27878 ?auto_27894 ) ) ( not ( = ?auto_27889 ?auto_27863 ) ) ( not ( = ?auto_27889 ?auto_27876 ) ) ( not ( = ?auto_27864 ?auto_27865 ) ) ( not ( = ?auto_27864 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27844 ) ) ( not ( = ?auto_27840 ?auto_27875 ) ) ( not ( = ?auto_27841 ?auto_27844 ) ) ( not ( = ?auto_27841 ?auto_27875 ) ) ( not ( = ?auto_27842 ?auto_27844 ) ) ( not ( = ?auto_27842 ?auto_27875 ) ) ( not ( = ?auto_27844 ?auto_27864 ) ) ( not ( = ?auto_27844 ?auto_27865 ) ) ( not ( = ?auto_27844 ?auto_27868 ) ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( not ( = ?auto_27877 ?auto_27866 ) ) ( not ( = ?auto_27877 ?auto_27894 ) ) ( not ( = ?auto_27893 ?auto_27889 ) ) ( not ( = ?auto_27893 ?auto_27863 ) ) ( not ( = ?auto_27893 ?auto_27876 ) ) ( not ( = ?auto_27875 ?auto_27864 ) ) ( not ( = ?auto_27875 ?auto_27865 ) ) ( not ( = ?auto_27875 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27845 ) ) ( not ( = ?auto_27840 ?auto_27881 ) ) ( not ( = ?auto_27841 ?auto_27845 ) ) ( not ( = ?auto_27841 ?auto_27881 ) ) ( not ( = ?auto_27842 ?auto_27845 ) ) ( not ( = ?auto_27842 ?auto_27881 ) ) ( not ( = ?auto_27843 ?auto_27845 ) ) ( not ( = ?auto_27843 ?auto_27881 ) ) ( not ( = ?auto_27845 ?auto_27875 ) ) ( not ( = ?auto_27845 ?auto_27864 ) ) ( not ( = ?auto_27845 ?auto_27865 ) ) ( not ( = ?auto_27845 ?auto_27868 ) ) ( not ( = ?auto_27881 ?auto_27875 ) ) ( not ( = ?auto_27881 ?auto_27864 ) ) ( not ( = ?auto_27881 ?auto_27865 ) ) ( not ( = ?auto_27881 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27846 ) ) ( not ( = ?auto_27840 ?auto_27879 ) ) ( not ( = ?auto_27841 ?auto_27846 ) ) ( not ( = ?auto_27841 ?auto_27879 ) ) ( not ( = ?auto_27842 ?auto_27846 ) ) ( not ( = ?auto_27842 ?auto_27879 ) ) ( not ( = ?auto_27843 ?auto_27846 ) ) ( not ( = ?auto_27843 ?auto_27879 ) ) ( not ( = ?auto_27844 ?auto_27846 ) ) ( not ( = ?auto_27844 ?auto_27879 ) ) ( not ( = ?auto_27846 ?auto_27881 ) ) ( not ( = ?auto_27846 ?auto_27875 ) ) ( not ( = ?auto_27846 ?auto_27864 ) ) ( not ( = ?auto_27846 ?auto_27865 ) ) ( not ( = ?auto_27846 ?auto_27868 ) ) ( not ( = ?auto_27867 ?auto_27877 ) ) ( not ( = ?auto_27867 ?auto_27878 ) ) ( not ( = ?auto_27867 ?auto_27866 ) ) ( not ( = ?auto_27867 ?auto_27894 ) ) ( not ( = ?auto_27873 ?auto_27893 ) ) ( not ( = ?auto_27873 ?auto_27889 ) ) ( not ( = ?auto_27873 ?auto_27863 ) ) ( not ( = ?auto_27873 ?auto_27876 ) ) ( not ( = ?auto_27879 ?auto_27881 ) ) ( not ( = ?auto_27879 ?auto_27875 ) ) ( not ( = ?auto_27879 ?auto_27864 ) ) ( not ( = ?auto_27879 ?auto_27865 ) ) ( not ( = ?auto_27879 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27847 ) ) ( not ( = ?auto_27840 ?auto_27874 ) ) ( not ( = ?auto_27841 ?auto_27847 ) ) ( not ( = ?auto_27841 ?auto_27874 ) ) ( not ( = ?auto_27842 ?auto_27847 ) ) ( not ( = ?auto_27842 ?auto_27874 ) ) ( not ( = ?auto_27843 ?auto_27847 ) ) ( not ( = ?auto_27843 ?auto_27874 ) ) ( not ( = ?auto_27844 ?auto_27847 ) ) ( not ( = ?auto_27844 ?auto_27874 ) ) ( not ( = ?auto_27845 ?auto_27847 ) ) ( not ( = ?auto_27845 ?auto_27874 ) ) ( not ( = ?auto_27847 ?auto_27879 ) ) ( not ( = ?auto_27847 ?auto_27881 ) ) ( not ( = ?auto_27847 ?auto_27875 ) ) ( not ( = ?auto_27847 ?auto_27864 ) ) ( not ( = ?auto_27847 ?auto_27865 ) ) ( not ( = ?auto_27847 ?auto_27868 ) ) ( not ( = ?auto_27880 ?auto_27867 ) ) ( not ( = ?auto_27880 ?auto_27877 ) ) ( not ( = ?auto_27880 ?auto_27878 ) ) ( not ( = ?auto_27880 ?auto_27866 ) ) ( not ( = ?auto_27880 ?auto_27894 ) ) ( not ( = ?auto_27883 ?auto_27873 ) ) ( not ( = ?auto_27883 ?auto_27893 ) ) ( not ( = ?auto_27883 ?auto_27889 ) ) ( not ( = ?auto_27883 ?auto_27863 ) ) ( not ( = ?auto_27883 ?auto_27876 ) ) ( not ( = ?auto_27874 ?auto_27879 ) ) ( not ( = ?auto_27874 ?auto_27881 ) ) ( not ( = ?auto_27874 ?auto_27875 ) ) ( not ( = ?auto_27874 ?auto_27864 ) ) ( not ( = ?auto_27874 ?auto_27865 ) ) ( not ( = ?auto_27874 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27848 ) ) ( not ( = ?auto_27840 ?auto_27885 ) ) ( not ( = ?auto_27841 ?auto_27848 ) ) ( not ( = ?auto_27841 ?auto_27885 ) ) ( not ( = ?auto_27842 ?auto_27848 ) ) ( not ( = ?auto_27842 ?auto_27885 ) ) ( not ( = ?auto_27843 ?auto_27848 ) ) ( not ( = ?auto_27843 ?auto_27885 ) ) ( not ( = ?auto_27844 ?auto_27848 ) ) ( not ( = ?auto_27844 ?auto_27885 ) ) ( not ( = ?auto_27845 ?auto_27848 ) ) ( not ( = ?auto_27845 ?auto_27885 ) ) ( not ( = ?auto_27846 ?auto_27848 ) ) ( not ( = ?auto_27846 ?auto_27885 ) ) ( not ( = ?auto_27848 ?auto_27874 ) ) ( not ( = ?auto_27848 ?auto_27879 ) ) ( not ( = ?auto_27848 ?auto_27881 ) ) ( not ( = ?auto_27848 ?auto_27875 ) ) ( not ( = ?auto_27848 ?auto_27864 ) ) ( not ( = ?auto_27848 ?auto_27865 ) ) ( not ( = ?auto_27848 ?auto_27868 ) ) ( not ( = ?auto_27869 ?auto_27880 ) ) ( not ( = ?auto_27869 ?auto_27867 ) ) ( not ( = ?auto_27869 ?auto_27877 ) ) ( not ( = ?auto_27869 ?auto_27878 ) ) ( not ( = ?auto_27869 ?auto_27866 ) ) ( not ( = ?auto_27869 ?auto_27894 ) ) ( not ( = ?auto_27882 ?auto_27883 ) ) ( not ( = ?auto_27882 ?auto_27873 ) ) ( not ( = ?auto_27882 ?auto_27893 ) ) ( not ( = ?auto_27882 ?auto_27889 ) ) ( not ( = ?auto_27882 ?auto_27863 ) ) ( not ( = ?auto_27882 ?auto_27876 ) ) ( not ( = ?auto_27885 ?auto_27874 ) ) ( not ( = ?auto_27885 ?auto_27879 ) ) ( not ( = ?auto_27885 ?auto_27881 ) ) ( not ( = ?auto_27885 ?auto_27875 ) ) ( not ( = ?auto_27885 ?auto_27864 ) ) ( not ( = ?auto_27885 ?auto_27865 ) ) ( not ( = ?auto_27885 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27849 ) ) ( not ( = ?auto_27840 ?auto_27892 ) ) ( not ( = ?auto_27841 ?auto_27849 ) ) ( not ( = ?auto_27841 ?auto_27892 ) ) ( not ( = ?auto_27842 ?auto_27849 ) ) ( not ( = ?auto_27842 ?auto_27892 ) ) ( not ( = ?auto_27843 ?auto_27849 ) ) ( not ( = ?auto_27843 ?auto_27892 ) ) ( not ( = ?auto_27844 ?auto_27849 ) ) ( not ( = ?auto_27844 ?auto_27892 ) ) ( not ( = ?auto_27845 ?auto_27849 ) ) ( not ( = ?auto_27845 ?auto_27892 ) ) ( not ( = ?auto_27846 ?auto_27849 ) ) ( not ( = ?auto_27846 ?auto_27892 ) ) ( not ( = ?auto_27847 ?auto_27849 ) ) ( not ( = ?auto_27847 ?auto_27892 ) ) ( not ( = ?auto_27849 ?auto_27885 ) ) ( not ( = ?auto_27849 ?auto_27874 ) ) ( not ( = ?auto_27849 ?auto_27879 ) ) ( not ( = ?auto_27849 ?auto_27881 ) ) ( not ( = ?auto_27849 ?auto_27875 ) ) ( not ( = ?auto_27849 ?auto_27864 ) ) ( not ( = ?auto_27849 ?auto_27865 ) ) ( not ( = ?auto_27849 ?auto_27868 ) ) ( not ( = ?auto_27857 ?auto_27869 ) ) ( not ( = ?auto_27857 ?auto_27880 ) ) ( not ( = ?auto_27857 ?auto_27867 ) ) ( not ( = ?auto_27857 ?auto_27877 ) ) ( not ( = ?auto_27857 ?auto_27878 ) ) ( not ( = ?auto_27857 ?auto_27866 ) ) ( not ( = ?auto_27857 ?auto_27894 ) ) ( not ( = ?auto_27859 ?auto_27882 ) ) ( not ( = ?auto_27859 ?auto_27883 ) ) ( not ( = ?auto_27859 ?auto_27873 ) ) ( not ( = ?auto_27859 ?auto_27893 ) ) ( not ( = ?auto_27859 ?auto_27889 ) ) ( not ( = ?auto_27859 ?auto_27863 ) ) ( not ( = ?auto_27859 ?auto_27876 ) ) ( not ( = ?auto_27892 ?auto_27885 ) ) ( not ( = ?auto_27892 ?auto_27874 ) ) ( not ( = ?auto_27892 ?auto_27879 ) ) ( not ( = ?auto_27892 ?auto_27881 ) ) ( not ( = ?auto_27892 ?auto_27875 ) ) ( not ( = ?auto_27892 ?auto_27864 ) ) ( not ( = ?auto_27892 ?auto_27865 ) ) ( not ( = ?auto_27892 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27850 ) ) ( not ( = ?auto_27840 ?auto_27888 ) ) ( not ( = ?auto_27841 ?auto_27850 ) ) ( not ( = ?auto_27841 ?auto_27888 ) ) ( not ( = ?auto_27842 ?auto_27850 ) ) ( not ( = ?auto_27842 ?auto_27888 ) ) ( not ( = ?auto_27843 ?auto_27850 ) ) ( not ( = ?auto_27843 ?auto_27888 ) ) ( not ( = ?auto_27844 ?auto_27850 ) ) ( not ( = ?auto_27844 ?auto_27888 ) ) ( not ( = ?auto_27845 ?auto_27850 ) ) ( not ( = ?auto_27845 ?auto_27888 ) ) ( not ( = ?auto_27846 ?auto_27850 ) ) ( not ( = ?auto_27846 ?auto_27888 ) ) ( not ( = ?auto_27847 ?auto_27850 ) ) ( not ( = ?auto_27847 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27888 ) ) ( not ( = ?auto_27850 ?auto_27892 ) ) ( not ( = ?auto_27850 ?auto_27885 ) ) ( not ( = ?auto_27850 ?auto_27874 ) ) ( not ( = ?auto_27850 ?auto_27879 ) ) ( not ( = ?auto_27850 ?auto_27881 ) ) ( not ( = ?auto_27850 ?auto_27875 ) ) ( not ( = ?auto_27850 ?auto_27864 ) ) ( not ( = ?auto_27850 ?auto_27865 ) ) ( not ( = ?auto_27850 ?auto_27868 ) ) ( not ( = ?auto_27890 ?auto_27857 ) ) ( not ( = ?auto_27890 ?auto_27869 ) ) ( not ( = ?auto_27890 ?auto_27880 ) ) ( not ( = ?auto_27890 ?auto_27867 ) ) ( not ( = ?auto_27890 ?auto_27877 ) ) ( not ( = ?auto_27890 ?auto_27878 ) ) ( not ( = ?auto_27890 ?auto_27866 ) ) ( not ( = ?auto_27890 ?auto_27894 ) ) ( not ( = ?auto_27887 ?auto_27859 ) ) ( not ( = ?auto_27887 ?auto_27882 ) ) ( not ( = ?auto_27887 ?auto_27883 ) ) ( not ( = ?auto_27887 ?auto_27873 ) ) ( not ( = ?auto_27887 ?auto_27893 ) ) ( not ( = ?auto_27887 ?auto_27889 ) ) ( not ( = ?auto_27887 ?auto_27863 ) ) ( not ( = ?auto_27887 ?auto_27876 ) ) ( not ( = ?auto_27888 ?auto_27892 ) ) ( not ( = ?auto_27888 ?auto_27885 ) ) ( not ( = ?auto_27888 ?auto_27874 ) ) ( not ( = ?auto_27888 ?auto_27879 ) ) ( not ( = ?auto_27888 ?auto_27881 ) ) ( not ( = ?auto_27888 ?auto_27875 ) ) ( not ( = ?auto_27888 ?auto_27864 ) ) ( not ( = ?auto_27888 ?auto_27865 ) ) ( not ( = ?auto_27888 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27851 ) ) ( not ( = ?auto_27840 ?auto_27870 ) ) ( not ( = ?auto_27841 ?auto_27851 ) ) ( not ( = ?auto_27841 ?auto_27870 ) ) ( not ( = ?auto_27842 ?auto_27851 ) ) ( not ( = ?auto_27842 ?auto_27870 ) ) ( not ( = ?auto_27843 ?auto_27851 ) ) ( not ( = ?auto_27843 ?auto_27870 ) ) ( not ( = ?auto_27844 ?auto_27851 ) ) ( not ( = ?auto_27844 ?auto_27870 ) ) ( not ( = ?auto_27845 ?auto_27851 ) ) ( not ( = ?auto_27845 ?auto_27870 ) ) ( not ( = ?auto_27846 ?auto_27851 ) ) ( not ( = ?auto_27846 ?auto_27870 ) ) ( not ( = ?auto_27847 ?auto_27851 ) ) ( not ( = ?auto_27847 ?auto_27870 ) ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( not ( = ?auto_27848 ?auto_27870 ) ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27870 ) ) ( not ( = ?auto_27851 ?auto_27888 ) ) ( not ( = ?auto_27851 ?auto_27892 ) ) ( not ( = ?auto_27851 ?auto_27885 ) ) ( not ( = ?auto_27851 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27879 ) ) ( not ( = ?auto_27851 ?auto_27881 ) ) ( not ( = ?auto_27851 ?auto_27875 ) ) ( not ( = ?auto_27851 ?auto_27864 ) ) ( not ( = ?auto_27851 ?auto_27865 ) ) ( not ( = ?auto_27851 ?auto_27868 ) ) ( not ( = ?auto_27870 ?auto_27888 ) ) ( not ( = ?auto_27870 ?auto_27892 ) ) ( not ( = ?auto_27870 ?auto_27885 ) ) ( not ( = ?auto_27870 ?auto_27874 ) ) ( not ( = ?auto_27870 ?auto_27879 ) ) ( not ( = ?auto_27870 ?auto_27881 ) ) ( not ( = ?auto_27870 ?auto_27875 ) ) ( not ( = ?auto_27870 ?auto_27864 ) ) ( not ( = ?auto_27870 ?auto_27865 ) ) ( not ( = ?auto_27870 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27852 ) ) ( not ( = ?auto_27840 ?auto_27872 ) ) ( not ( = ?auto_27841 ?auto_27852 ) ) ( not ( = ?auto_27841 ?auto_27872 ) ) ( not ( = ?auto_27842 ?auto_27852 ) ) ( not ( = ?auto_27842 ?auto_27872 ) ) ( not ( = ?auto_27843 ?auto_27852 ) ) ( not ( = ?auto_27843 ?auto_27872 ) ) ( not ( = ?auto_27844 ?auto_27852 ) ) ( not ( = ?auto_27844 ?auto_27872 ) ) ( not ( = ?auto_27845 ?auto_27852 ) ) ( not ( = ?auto_27845 ?auto_27872 ) ) ( not ( = ?auto_27846 ?auto_27852 ) ) ( not ( = ?auto_27846 ?auto_27872 ) ) ( not ( = ?auto_27847 ?auto_27852 ) ) ( not ( = ?auto_27847 ?auto_27872 ) ) ( not ( = ?auto_27848 ?auto_27852 ) ) ( not ( = ?auto_27848 ?auto_27872 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27872 ) ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27850 ?auto_27872 ) ) ( not ( = ?auto_27852 ?auto_27870 ) ) ( not ( = ?auto_27852 ?auto_27888 ) ) ( not ( = ?auto_27852 ?auto_27892 ) ) ( not ( = ?auto_27852 ?auto_27885 ) ) ( not ( = ?auto_27852 ?auto_27874 ) ) ( not ( = ?auto_27852 ?auto_27879 ) ) ( not ( = ?auto_27852 ?auto_27881 ) ) ( not ( = ?auto_27852 ?auto_27875 ) ) ( not ( = ?auto_27852 ?auto_27864 ) ) ( not ( = ?auto_27852 ?auto_27865 ) ) ( not ( = ?auto_27852 ?auto_27868 ) ) ( not ( = ?auto_27872 ?auto_27870 ) ) ( not ( = ?auto_27872 ?auto_27888 ) ) ( not ( = ?auto_27872 ?auto_27892 ) ) ( not ( = ?auto_27872 ?auto_27885 ) ) ( not ( = ?auto_27872 ?auto_27874 ) ) ( not ( = ?auto_27872 ?auto_27879 ) ) ( not ( = ?auto_27872 ?auto_27881 ) ) ( not ( = ?auto_27872 ?auto_27875 ) ) ( not ( = ?auto_27872 ?auto_27864 ) ) ( not ( = ?auto_27872 ?auto_27865 ) ) ( not ( = ?auto_27872 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27853 ) ) ( not ( = ?auto_27840 ?auto_27884 ) ) ( not ( = ?auto_27841 ?auto_27853 ) ) ( not ( = ?auto_27841 ?auto_27884 ) ) ( not ( = ?auto_27842 ?auto_27853 ) ) ( not ( = ?auto_27842 ?auto_27884 ) ) ( not ( = ?auto_27843 ?auto_27853 ) ) ( not ( = ?auto_27843 ?auto_27884 ) ) ( not ( = ?auto_27844 ?auto_27853 ) ) ( not ( = ?auto_27844 ?auto_27884 ) ) ( not ( = ?auto_27845 ?auto_27853 ) ) ( not ( = ?auto_27845 ?auto_27884 ) ) ( not ( = ?auto_27846 ?auto_27853 ) ) ( not ( = ?auto_27846 ?auto_27884 ) ) ( not ( = ?auto_27847 ?auto_27853 ) ) ( not ( = ?auto_27847 ?auto_27884 ) ) ( not ( = ?auto_27848 ?auto_27853 ) ) ( not ( = ?auto_27848 ?auto_27884 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27884 ) ) ( not ( = ?auto_27850 ?auto_27853 ) ) ( not ( = ?auto_27850 ?auto_27884 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27884 ) ) ( not ( = ?auto_27853 ?auto_27872 ) ) ( not ( = ?auto_27853 ?auto_27870 ) ) ( not ( = ?auto_27853 ?auto_27888 ) ) ( not ( = ?auto_27853 ?auto_27892 ) ) ( not ( = ?auto_27853 ?auto_27885 ) ) ( not ( = ?auto_27853 ?auto_27874 ) ) ( not ( = ?auto_27853 ?auto_27879 ) ) ( not ( = ?auto_27853 ?auto_27881 ) ) ( not ( = ?auto_27853 ?auto_27875 ) ) ( not ( = ?auto_27853 ?auto_27864 ) ) ( not ( = ?auto_27853 ?auto_27865 ) ) ( not ( = ?auto_27853 ?auto_27868 ) ) ( not ( = ?auto_27884 ?auto_27872 ) ) ( not ( = ?auto_27884 ?auto_27870 ) ) ( not ( = ?auto_27884 ?auto_27888 ) ) ( not ( = ?auto_27884 ?auto_27892 ) ) ( not ( = ?auto_27884 ?auto_27885 ) ) ( not ( = ?auto_27884 ?auto_27874 ) ) ( not ( = ?auto_27884 ?auto_27879 ) ) ( not ( = ?auto_27884 ?auto_27881 ) ) ( not ( = ?auto_27884 ?auto_27875 ) ) ( not ( = ?auto_27884 ?auto_27864 ) ) ( not ( = ?auto_27884 ?auto_27865 ) ) ( not ( = ?auto_27884 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27855 ) ) ( not ( = ?auto_27840 ?auto_27871 ) ) ( not ( = ?auto_27841 ?auto_27855 ) ) ( not ( = ?auto_27841 ?auto_27871 ) ) ( not ( = ?auto_27842 ?auto_27855 ) ) ( not ( = ?auto_27842 ?auto_27871 ) ) ( not ( = ?auto_27843 ?auto_27855 ) ) ( not ( = ?auto_27843 ?auto_27871 ) ) ( not ( = ?auto_27844 ?auto_27855 ) ) ( not ( = ?auto_27844 ?auto_27871 ) ) ( not ( = ?auto_27845 ?auto_27855 ) ) ( not ( = ?auto_27845 ?auto_27871 ) ) ( not ( = ?auto_27846 ?auto_27855 ) ) ( not ( = ?auto_27846 ?auto_27871 ) ) ( not ( = ?auto_27847 ?auto_27855 ) ) ( not ( = ?auto_27847 ?auto_27871 ) ) ( not ( = ?auto_27848 ?auto_27855 ) ) ( not ( = ?auto_27848 ?auto_27871 ) ) ( not ( = ?auto_27849 ?auto_27855 ) ) ( not ( = ?auto_27849 ?auto_27871 ) ) ( not ( = ?auto_27850 ?auto_27855 ) ) ( not ( = ?auto_27850 ?auto_27871 ) ) ( not ( = ?auto_27851 ?auto_27855 ) ) ( not ( = ?auto_27851 ?auto_27871 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27871 ) ) ( not ( = ?auto_27855 ?auto_27884 ) ) ( not ( = ?auto_27855 ?auto_27872 ) ) ( not ( = ?auto_27855 ?auto_27870 ) ) ( not ( = ?auto_27855 ?auto_27888 ) ) ( not ( = ?auto_27855 ?auto_27892 ) ) ( not ( = ?auto_27855 ?auto_27885 ) ) ( not ( = ?auto_27855 ?auto_27874 ) ) ( not ( = ?auto_27855 ?auto_27879 ) ) ( not ( = ?auto_27855 ?auto_27881 ) ) ( not ( = ?auto_27855 ?auto_27875 ) ) ( not ( = ?auto_27855 ?auto_27864 ) ) ( not ( = ?auto_27855 ?auto_27865 ) ) ( not ( = ?auto_27855 ?auto_27868 ) ) ( not ( = ?auto_27871 ?auto_27884 ) ) ( not ( = ?auto_27871 ?auto_27872 ) ) ( not ( = ?auto_27871 ?auto_27870 ) ) ( not ( = ?auto_27871 ?auto_27888 ) ) ( not ( = ?auto_27871 ?auto_27892 ) ) ( not ( = ?auto_27871 ?auto_27885 ) ) ( not ( = ?auto_27871 ?auto_27874 ) ) ( not ( = ?auto_27871 ?auto_27879 ) ) ( not ( = ?auto_27871 ?auto_27881 ) ) ( not ( = ?auto_27871 ?auto_27875 ) ) ( not ( = ?auto_27871 ?auto_27864 ) ) ( not ( = ?auto_27871 ?auto_27865 ) ) ( not ( = ?auto_27871 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27854 ) ) ( not ( = ?auto_27840 ?auto_27891 ) ) ( not ( = ?auto_27841 ?auto_27854 ) ) ( not ( = ?auto_27841 ?auto_27891 ) ) ( not ( = ?auto_27842 ?auto_27854 ) ) ( not ( = ?auto_27842 ?auto_27891 ) ) ( not ( = ?auto_27843 ?auto_27854 ) ) ( not ( = ?auto_27843 ?auto_27891 ) ) ( not ( = ?auto_27844 ?auto_27854 ) ) ( not ( = ?auto_27844 ?auto_27891 ) ) ( not ( = ?auto_27845 ?auto_27854 ) ) ( not ( = ?auto_27845 ?auto_27891 ) ) ( not ( = ?auto_27846 ?auto_27854 ) ) ( not ( = ?auto_27846 ?auto_27891 ) ) ( not ( = ?auto_27847 ?auto_27854 ) ) ( not ( = ?auto_27847 ?auto_27891 ) ) ( not ( = ?auto_27848 ?auto_27854 ) ) ( not ( = ?auto_27848 ?auto_27891 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27849 ?auto_27891 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27891 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27891 ) ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27891 ) ) ( not ( = ?auto_27853 ?auto_27854 ) ) ( not ( = ?auto_27853 ?auto_27891 ) ) ( not ( = ?auto_27854 ?auto_27871 ) ) ( not ( = ?auto_27854 ?auto_27884 ) ) ( not ( = ?auto_27854 ?auto_27872 ) ) ( not ( = ?auto_27854 ?auto_27870 ) ) ( not ( = ?auto_27854 ?auto_27888 ) ) ( not ( = ?auto_27854 ?auto_27892 ) ) ( not ( = ?auto_27854 ?auto_27885 ) ) ( not ( = ?auto_27854 ?auto_27874 ) ) ( not ( = ?auto_27854 ?auto_27879 ) ) ( not ( = ?auto_27854 ?auto_27881 ) ) ( not ( = ?auto_27854 ?auto_27875 ) ) ( not ( = ?auto_27854 ?auto_27864 ) ) ( not ( = ?auto_27854 ?auto_27865 ) ) ( not ( = ?auto_27854 ?auto_27868 ) ) ( not ( = ?auto_27895 ?auto_27869 ) ) ( not ( = ?auto_27895 ?auto_27894 ) ) ( not ( = ?auto_27895 ?auto_27877 ) ) ( not ( = ?auto_27895 ?auto_27866 ) ) ( not ( = ?auto_27895 ?auto_27890 ) ) ( not ( = ?auto_27895 ?auto_27857 ) ) ( not ( = ?auto_27895 ?auto_27880 ) ) ( not ( = ?auto_27895 ?auto_27867 ) ) ( not ( = ?auto_27895 ?auto_27878 ) ) ( not ( = ?auto_27886 ?auto_27882 ) ) ( not ( = ?auto_27886 ?auto_27876 ) ) ( not ( = ?auto_27886 ?auto_27893 ) ) ( not ( = ?auto_27886 ?auto_27863 ) ) ( not ( = ?auto_27886 ?auto_27887 ) ) ( not ( = ?auto_27886 ?auto_27859 ) ) ( not ( = ?auto_27886 ?auto_27883 ) ) ( not ( = ?auto_27886 ?auto_27873 ) ) ( not ( = ?auto_27886 ?auto_27889 ) ) ( not ( = ?auto_27891 ?auto_27871 ) ) ( not ( = ?auto_27891 ?auto_27884 ) ) ( not ( = ?auto_27891 ?auto_27872 ) ) ( not ( = ?auto_27891 ?auto_27870 ) ) ( not ( = ?auto_27891 ?auto_27888 ) ) ( not ( = ?auto_27891 ?auto_27892 ) ) ( not ( = ?auto_27891 ?auto_27885 ) ) ( not ( = ?auto_27891 ?auto_27874 ) ) ( not ( = ?auto_27891 ?auto_27879 ) ) ( not ( = ?auto_27891 ?auto_27881 ) ) ( not ( = ?auto_27891 ?auto_27875 ) ) ( not ( = ?auto_27891 ?auto_27864 ) ) ( not ( = ?auto_27891 ?auto_27865 ) ) ( not ( = ?auto_27891 ?auto_27868 ) ) ( not ( = ?auto_27840 ?auto_27856 ) ) ( not ( = ?auto_27840 ?auto_27860 ) ) ( not ( = ?auto_27841 ?auto_27856 ) ) ( not ( = ?auto_27841 ?auto_27860 ) ) ( not ( = ?auto_27842 ?auto_27856 ) ) ( not ( = ?auto_27842 ?auto_27860 ) ) ( not ( = ?auto_27843 ?auto_27856 ) ) ( not ( = ?auto_27843 ?auto_27860 ) ) ( not ( = ?auto_27844 ?auto_27856 ) ) ( not ( = ?auto_27844 ?auto_27860 ) ) ( not ( = ?auto_27845 ?auto_27856 ) ) ( not ( = ?auto_27845 ?auto_27860 ) ) ( not ( = ?auto_27846 ?auto_27856 ) ) ( not ( = ?auto_27846 ?auto_27860 ) ) ( not ( = ?auto_27847 ?auto_27856 ) ) ( not ( = ?auto_27847 ?auto_27860 ) ) ( not ( = ?auto_27848 ?auto_27856 ) ) ( not ( = ?auto_27848 ?auto_27860 ) ) ( not ( = ?auto_27849 ?auto_27856 ) ) ( not ( = ?auto_27849 ?auto_27860 ) ) ( not ( = ?auto_27850 ?auto_27856 ) ) ( not ( = ?auto_27850 ?auto_27860 ) ) ( not ( = ?auto_27851 ?auto_27856 ) ) ( not ( = ?auto_27851 ?auto_27860 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27852 ?auto_27860 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27860 ) ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27860 ) ) ( not ( = ?auto_27856 ?auto_27891 ) ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27856 ?auto_27884 ) ) ( not ( = ?auto_27856 ?auto_27872 ) ) ( not ( = ?auto_27856 ?auto_27870 ) ) ( not ( = ?auto_27856 ?auto_27888 ) ) ( not ( = ?auto_27856 ?auto_27892 ) ) ( not ( = ?auto_27856 ?auto_27885 ) ) ( not ( = ?auto_27856 ?auto_27874 ) ) ( not ( = ?auto_27856 ?auto_27879 ) ) ( not ( = ?auto_27856 ?auto_27881 ) ) ( not ( = ?auto_27856 ?auto_27875 ) ) ( not ( = ?auto_27856 ?auto_27864 ) ) ( not ( = ?auto_27856 ?auto_27865 ) ) ( not ( = ?auto_27856 ?auto_27868 ) ) ( not ( = ?auto_27860 ?auto_27891 ) ) ( not ( = ?auto_27860 ?auto_27871 ) ) ( not ( = ?auto_27860 ?auto_27884 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27870 ) ) ( not ( = ?auto_27860 ?auto_27888 ) ) ( not ( = ?auto_27860 ?auto_27892 ) ) ( not ( = ?auto_27860 ?auto_27885 ) ) ( not ( = ?auto_27860 ?auto_27874 ) ) ( not ( = ?auto_27860 ?auto_27879 ) ) ( not ( = ?auto_27860 ?auto_27881 ) ) ( not ( = ?auto_27860 ?auto_27875 ) ) ( not ( = ?auto_27860 ?auto_27864 ) ) ( not ( = ?auto_27860 ?auto_27865 ) ) ( not ( = ?auto_27860 ?auto_27868 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27840 ?auto_27841 ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 ?auto_27846 ?auto_27847 ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27855 ?auto_27854 )
      ( MAKE-1CRATE ?auto_27854 ?auto_27856 )
      ( MAKE-16CRATE-VERIFY ?auto_27840 ?auto_27841 ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 ?auto_27846 ?auto_27847 ?auto_27848 ?auto_27849 ?auto_27850 ?auto_27851 ?auto_27852 ?auto_27853 ?auto_27855 ?auto_27854 ?auto_27856 ) )
  )

)

