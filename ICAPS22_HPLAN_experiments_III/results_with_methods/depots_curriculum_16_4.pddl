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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27060 - SURFACE
      ?auto_27061 - SURFACE
    )
    :vars
    (
      ?auto_27062 - HOIST
      ?auto_27063 - PLACE
      ?auto_27065 - PLACE
      ?auto_27066 - HOIST
      ?auto_27067 - SURFACE
      ?auto_27064 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27062 ?auto_27063 ) ( SURFACE-AT ?auto_27060 ?auto_27063 ) ( CLEAR ?auto_27060 ) ( IS-CRATE ?auto_27061 ) ( AVAILABLE ?auto_27062 ) ( not ( = ?auto_27065 ?auto_27063 ) ) ( HOIST-AT ?auto_27066 ?auto_27065 ) ( AVAILABLE ?auto_27066 ) ( SURFACE-AT ?auto_27061 ?auto_27065 ) ( ON ?auto_27061 ?auto_27067 ) ( CLEAR ?auto_27061 ) ( TRUCK-AT ?auto_27064 ?auto_27063 ) ( not ( = ?auto_27060 ?auto_27061 ) ) ( not ( = ?auto_27060 ?auto_27067 ) ) ( not ( = ?auto_27061 ?auto_27067 ) ) ( not ( = ?auto_27062 ?auto_27066 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27064 ?auto_27063 ?auto_27065 )
      ( !LIFT ?auto_27066 ?auto_27061 ?auto_27067 ?auto_27065 )
      ( !LOAD ?auto_27066 ?auto_27061 ?auto_27064 ?auto_27065 )
      ( !DRIVE ?auto_27064 ?auto_27065 ?auto_27063 )
      ( !UNLOAD ?auto_27062 ?auto_27061 ?auto_27064 ?auto_27063 )
      ( !DROP ?auto_27062 ?auto_27061 ?auto_27060 ?auto_27063 )
      ( MAKE-1CRATE-VERIFY ?auto_27060 ?auto_27061 ) )
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
      ?auto_27078 - HOIST
      ?auto_27075 - PLACE
      ?auto_27077 - PLACE
      ?auto_27074 - HOIST
      ?auto_27079 - SURFACE
      ?auto_27082 - PLACE
      ?auto_27081 - HOIST
      ?auto_27080 - SURFACE
      ?auto_27076 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27078 ?auto_27075 ) ( IS-CRATE ?auto_27073 ) ( not ( = ?auto_27077 ?auto_27075 ) ) ( HOIST-AT ?auto_27074 ?auto_27077 ) ( AVAILABLE ?auto_27074 ) ( SURFACE-AT ?auto_27073 ?auto_27077 ) ( ON ?auto_27073 ?auto_27079 ) ( CLEAR ?auto_27073 ) ( not ( = ?auto_27072 ?auto_27073 ) ) ( not ( = ?auto_27072 ?auto_27079 ) ) ( not ( = ?auto_27073 ?auto_27079 ) ) ( not ( = ?auto_27078 ?auto_27074 ) ) ( SURFACE-AT ?auto_27071 ?auto_27075 ) ( CLEAR ?auto_27071 ) ( IS-CRATE ?auto_27072 ) ( AVAILABLE ?auto_27078 ) ( not ( = ?auto_27082 ?auto_27075 ) ) ( HOIST-AT ?auto_27081 ?auto_27082 ) ( AVAILABLE ?auto_27081 ) ( SURFACE-AT ?auto_27072 ?auto_27082 ) ( ON ?auto_27072 ?auto_27080 ) ( CLEAR ?auto_27072 ) ( TRUCK-AT ?auto_27076 ?auto_27075 ) ( not ( = ?auto_27071 ?auto_27072 ) ) ( not ( = ?auto_27071 ?auto_27080 ) ) ( not ( = ?auto_27072 ?auto_27080 ) ) ( not ( = ?auto_27078 ?auto_27081 ) ) ( not ( = ?auto_27071 ?auto_27073 ) ) ( not ( = ?auto_27071 ?auto_27079 ) ) ( not ( = ?auto_27073 ?auto_27080 ) ) ( not ( = ?auto_27077 ?auto_27082 ) ) ( not ( = ?auto_27074 ?auto_27081 ) ) ( not ( = ?auto_27079 ?auto_27080 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_27071 ?auto_27072 )
      ( MAKE-1CRATE ?auto_27072 ?auto_27073 )
      ( MAKE-2CRATE-VERIFY ?auto_27071 ?auto_27072 ?auto_27073 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27085 - SURFACE
      ?auto_27086 - SURFACE
    )
    :vars
    (
      ?auto_27087 - HOIST
      ?auto_27088 - PLACE
      ?auto_27090 - PLACE
      ?auto_27091 - HOIST
      ?auto_27092 - SURFACE
      ?auto_27089 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27087 ?auto_27088 ) ( SURFACE-AT ?auto_27085 ?auto_27088 ) ( CLEAR ?auto_27085 ) ( IS-CRATE ?auto_27086 ) ( AVAILABLE ?auto_27087 ) ( not ( = ?auto_27090 ?auto_27088 ) ) ( HOIST-AT ?auto_27091 ?auto_27090 ) ( AVAILABLE ?auto_27091 ) ( SURFACE-AT ?auto_27086 ?auto_27090 ) ( ON ?auto_27086 ?auto_27092 ) ( CLEAR ?auto_27086 ) ( TRUCK-AT ?auto_27089 ?auto_27088 ) ( not ( = ?auto_27085 ?auto_27086 ) ) ( not ( = ?auto_27085 ?auto_27092 ) ) ( not ( = ?auto_27086 ?auto_27092 ) ) ( not ( = ?auto_27087 ?auto_27091 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27089 ?auto_27088 ?auto_27090 )
      ( !LIFT ?auto_27091 ?auto_27086 ?auto_27092 ?auto_27090 )
      ( !LOAD ?auto_27091 ?auto_27086 ?auto_27089 ?auto_27090 )
      ( !DRIVE ?auto_27089 ?auto_27090 ?auto_27088 )
      ( !UNLOAD ?auto_27087 ?auto_27086 ?auto_27089 ?auto_27088 )
      ( !DROP ?auto_27087 ?auto_27086 ?auto_27085 ?auto_27088 )
      ( MAKE-1CRATE-VERIFY ?auto_27085 ?auto_27086 ) )
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
      ?auto_27104 - HOIST
      ?auto_27105 - PLACE
      ?auto_27106 - PLACE
      ?auto_27101 - HOIST
      ?auto_27102 - SURFACE
      ?auto_27111 - PLACE
      ?auto_27110 - HOIST
      ?auto_27112 - SURFACE
      ?auto_27108 - PLACE
      ?auto_27109 - HOIST
      ?auto_27107 - SURFACE
      ?auto_27103 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27104 ?auto_27105 ) ( IS-CRATE ?auto_27100 ) ( not ( = ?auto_27106 ?auto_27105 ) ) ( HOIST-AT ?auto_27101 ?auto_27106 ) ( AVAILABLE ?auto_27101 ) ( SURFACE-AT ?auto_27100 ?auto_27106 ) ( ON ?auto_27100 ?auto_27102 ) ( CLEAR ?auto_27100 ) ( not ( = ?auto_27099 ?auto_27100 ) ) ( not ( = ?auto_27099 ?auto_27102 ) ) ( not ( = ?auto_27100 ?auto_27102 ) ) ( not ( = ?auto_27104 ?auto_27101 ) ) ( IS-CRATE ?auto_27099 ) ( not ( = ?auto_27111 ?auto_27105 ) ) ( HOIST-AT ?auto_27110 ?auto_27111 ) ( AVAILABLE ?auto_27110 ) ( SURFACE-AT ?auto_27099 ?auto_27111 ) ( ON ?auto_27099 ?auto_27112 ) ( CLEAR ?auto_27099 ) ( not ( = ?auto_27098 ?auto_27099 ) ) ( not ( = ?auto_27098 ?auto_27112 ) ) ( not ( = ?auto_27099 ?auto_27112 ) ) ( not ( = ?auto_27104 ?auto_27110 ) ) ( SURFACE-AT ?auto_27097 ?auto_27105 ) ( CLEAR ?auto_27097 ) ( IS-CRATE ?auto_27098 ) ( AVAILABLE ?auto_27104 ) ( not ( = ?auto_27108 ?auto_27105 ) ) ( HOIST-AT ?auto_27109 ?auto_27108 ) ( AVAILABLE ?auto_27109 ) ( SURFACE-AT ?auto_27098 ?auto_27108 ) ( ON ?auto_27098 ?auto_27107 ) ( CLEAR ?auto_27098 ) ( TRUCK-AT ?auto_27103 ?auto_27105 ) ( not ( = ?auto_27097 ?auto_27098 ) ) ( not ( = ?auto_27097 ?auto_27107 ) ) ( not ( = ?auto_27098 ?auto_27107 ) ) ( not ( = ?auto_27104 ?auto_27109 ) ) ( not ( = ?auto_27097 ?auto_27099 ) ) ( not ( = ?auto_27097 ?auto_27112 ) ) ( not ( = ?auto_27099 ?auto_27107 ) ) ( not ( = ?auto_27111 ?auto_27108 ) ) ( not ( = ?auto_27110 ?auto_27109 ) ) ( not ( = ?auto_27112 ?auto_27107 ) ) ( not ( = ?auto_27097 ?auto_27100 ) ) ( not ( = ?auto_27097 ?auto_27102 ) ) ( not ( = ?auto_27098 ?auto_27100 ) ) ( not ( = ?auto_27098 ?auto_27102 ) ) ( not ( = ?auto_27100 ?auto_27112 ) ) ( not ( = ?auto_27100 ?auto_27107 ) ) ( not ( = ?auto_27106 ?auto_27111 ) ) ( not ( = ?auto_27106 ?auto_27108 ) ) ( not ( = ?auto_27101 ?auto_27110 ) ) ( not ( = ?auto_27101 ?auto_27109 ) ) ( not ( = ?auto_27102 ?auto_27112 ) ) ( not ( = ?auto_27102 ?auto_27107 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_27097 ?auto_27098 ?auto_27099 )
      ( MAKE-1CRATE ?auto_27099 ?auto_27100 )
      ( MAKE-3CRATE-VERIFY ?auto_27097 ?auto_27098 ?auto_27099 ?auto_27100 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27115 - SURFACE
      ?auto_27116 - SURFACE
    )
    :vars
    (
      ?auto_27117 - HOIST
      ?auto_27118 - PLACE
      ?auto_27120 - PLACE
      ?auto_27121 - HOIST
      ?auto_27122 - SURFACE
      ?auto_27119 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27117 ?auto_27118 ) ( SURFACE-AT ?auto_27115 ?auto_27118 ) ( CLEAR ?auto_27115 ) ( IS-CRATE ?auto_27116 ) ( AVAILABLE ?auto_27117 ) ( not ( = ?auto_27120 ?auto_27118 ) ) ( HOIST-AT ?auto_27121 ?auto_27120 ) ( AVAILABLE ?auto_27121 ) ( SURFACE-AT ?auto_27116 ?auto_27120 ) ( ON ?auto_27116 ?auto_27122 ) ( CLEAR ?auto_27116 ) ( TRUCK-AT ?auto_27119 ?auto_27118 ) ( not ( = ?auto_27115 ?auto_27116 ) ) ( not ( = ?auto_27115 ?auto_27122 ) ) ( not ( = ?auto_27116 ?auto_27122 ) ) ( not ( = ?auto_27117 ?auto_27121 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27119 ?auto_27118 ?auto_27120 )
      ( !LIFT ?auto_27121 ?auto_27116 ?auto_27122 ?auto_27120 )
      ( !LOAD ?auto_27121 ?auto_27116 ?auto_27119 ?auto_27120 )
      ( !DRIVE ?auto_27119 ?auto_27120 ?auto_27118 )
      ( !UNLOAD ?auto_27117 ?auto_27116 ?auto_27119 ?auto_27118 )
      ( !DROP ?auto_27117 ?auto_27116 ?auto_27115 ?auto_27118 )
      ( MAKE-1CRATE-VERIFY ?auto_27115 ?auto_27116 ) )
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
      ?auto_27136 - HOIST
      ?auto_27134 - PLACE
      ?auto_27138 - PLACE
      ?auto_27137 - HOIST
      ?auto_27135 - SURFACE
      ?auto_27142 - PLACE
      ?auto_27140 - HOIST
      ?auto_27144 - SURFACE
      ?auto_27146 - PLACE
      ?auto_27141 - HOIST
      ?auto_27139 - SURFACE
      ?auto_27143 - PLACE
      ?auto_27145 - HOIST
      ?auto_27147 - SURFACE
      ?auto_27133 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27136 ?auto_27134 ) ( IS-CRATE ?auto_27132 ) ( not ( = ?auto_27138 ?auto_27134 ) ) ( HOIST-AT ?auto_27137 ?auto_27138 ) ( AVAILABLE ?auto_27137 ) ( SURFACE-AT ?auto_27132 ?auto_27138 ) ( ON ?auto_27132 ?auto_27135 ) ( CLEAR ?auto_27132 ) ( not ( = ?auto_27131 ?auto_27132 ) ) ( not ( = ?auto_27131 ?auto_27135 ) ) ( not ( = ?auto_27132 ?auto_27135 ) ) ( not ( = ?auto_27136 ?auto_27137 ) ) ( IS-CRATE ?auto_27131 ) ( not ( = ?auto_27142 ?auto_27134 ) ) ( HOIST-AT ?auto_27140 ?auto_27142 ) ( AVAILABLE ?auto_27140 ) ( SURFACE-AT ?auto_27131 ?auto_27142 ) ( ON ?auto_27131 ?auto_27144 ) ( CLEAR ?auto_27131 ) ( not ( = ?auto_27130 ?auto_27131 ) ) ( not ( = ?auto_27130 ?auto_27144 ) ) ( not ( = ?auto_27131 ?auto_27144 ) ) ( not ( = ?auto_27136 ?auto_27140 ) ) ( IS-CRATE ?auto_27130 ) ( not ( = ?auto_27146 ?auto_27134 ) ) ( HOIST-AT ?auto_27141 ?auto_27146 ) ( AVAILABLE ?auto_27141 ) ( SURFACE-AT ?auto_27130 ?auto_27146 ) ( ON ?auto_27130 ?auto_27139 ) ( CLEAR ?auto_27130 ) ( not ( = ?auto_27129 ?auto_27130 ) ) ( not ( = ?auto_27129 ?auto_27139 ) ) ( not ( = ?auto_27130 ?auto_27139 ) ) ( not ( = ?auto_27136 ?auto_27141 ) ) ( SURFACE-AT ?auto_27128 ?auto_27134 ) ( CLEAR ?auto_27128 ) ( IS-CRATE ?auto_27129 ) ( AVAILABLE ?auto_27136 ) ( not ( = ?auto_27143 ?auto_27134 ) ) ( HOIST-AT ?auto_27145 ?auto_27143 ) ( AVAILABLE ?auto_27145 ) ( SURFACE-AT ?auto_27129 ?auto_27143 ) ( ON ?auto_27129 ?auto_27147 ) ( CLEAR ?auto_27129 ) ( TRUCK-AT ?auto_27133 ?auto_27134 ) ( not ( = ?auto_27128 ?auto_27129 ) ) ( not ( = ?auto_27128 ?auto_27147 ) ) ( not ( = ?auto_27129 ?auto_27147 ) ) ( not ( = ?auto_27136 ?auto_27145 ) ) ( not ( = ?auto_27128 ?auto_27130 ) ) ( not ( = ?auto_27128 ?auto_27139 ) ) ( not ( = ?auto_27130 ?auto_27147 ) ) ( not ( = ?auto_27146 ?auto_27143 ) ) ( not ( = ?auto_27141 ?auto_27145 ) ) ( not ( = ?auto_27139 ?auto_27147 ) ) ( not ( = ?auto_27128 ?auto_27131 ) ) ( not ( = ?auto_27128 ?auto_27144 ) ) ( not ( = ?auto_27129 ?auto_27131 ) ) ( not ( = ?auto_27129 ?auto_27144 ) ) ( not ( = ?auto_27131 ?auto_27139 ) ) ( not ( = ?auto_27131 ?auto_27147 ) ) ( not ( = ?auto_27142 ?auto_27146 ) ) ( not ( = ?auto_27142 ?auto_27143 ) ) ( not ( = ?auto_27140 ?auto_27141 ) ) ( not ( = ?auto_27140 ?auto_27145 ) ) ( not ( = ?auto_27144 ?auto_27139 ) ) ( not ( = ?auto_27144 ?auto_27147 ) ) ( not ( = ?auto_27128 ?auto_27132 ) ) ( not ( = ?auto_27128 ?auto_27135 ) ) ( not ( = ?auto_27129 ?auto_27132 ) ) ( not ( = ?auto_27129 ?auto_27135 ) ) ( not ( = ?auto_27130 ?auto_27132 ) ) ( not ( = ?auto_27130 ?auto_27135 ) ) ( not ( = ?auto_27132 ?auto_27144 ) ) ( not ( = ?auto_27132 ?auto_27139 ) ) ( not ( = ?auto_27132 ?auto_27147 ) ) ( not ( = ?auto_27138 ?auto_27142 ) ) ( not ( = ?auto_27138 ?auto_27146 ) ) ( not ( = ?auto_27138 ?auto_27143 ) ) ( not ( = ?auto_27137 ?auto_27140 ) ) ( not ( = ?auto_27137 ?auto_27141 ) ) ( not ( = ?auto_27137 ?auto_27145 ) ) ( not ( = ?auto_27135 ?auto_27144 ) ) ( not ( = ?auto_27135 ?auto_27139 ) ) ( not ( = ?auto_27135 ?auto_27147 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_27128 ?auto_27129 ?auto_27130 ?auto_27131 )
      ( MAKE-1CRATE ?auto_27131 ?auto_27132 )
      ( MAKE-4CRATE-VERIFY ?auto_27128 ?auto_27129 ?auto_27130 ?auto_27131 ?auto_27132 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27150 - SURFACE
      ?auto_27151 - SURFACE
    )
    :vars
    (
      ?auto_27152 - HOIST
      ?auto_27153 - PLACE
      ?auto_27155 - PLACE
      ?auto_27156 - HOIST
      ?auto_27157 - SURFACE
      ?auto_27154 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27152 ?auto_27153 ) ( SURFACE-AT ?auto_27150 ?auto_27153 ) ( CLEAR ?auto_27150 ) ( IS-CRATE ?auto_27151 ) ( AVAILABLE ?auto_27152 ) ( not ( = ?auto_27155 ?auto_27153 ) ) ( HOIST-AT ?auto_27156 ?auto_27155 ) ( AVAILABLE ?auto_27156 ) ( SURFACE-AT ?auto_27151 ?auto_27155 ) ( ON ?auto_27151 ?auto_27157 ) ( CLEAR ?auto_27151 ) ( TRUCK-AT ?auto_27154 ?auto_27153 ) ( not ( = ?auto_27150 ?auto_27151 ) ) ( not ( = ?auto_27150 ?auto_27157 ) ) ( not ( = ?auto_27151 ?auto_27157 ) ) ( not ( = ?auto_27152 ?auto_27156 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27154 ?auto_27153 ?auto_27155 )
      ( !LIFT ?auto_27156 ?auto_27151 ?auto_27157 ?auto_27155 )
      ( !LOAD ?auto_27156 ?auto_27151 ?auto_27154 ?auto_27155 )
      ( !DRIVE ?auto_27154 ?auto_27155 ?auto_27153 )
      ( !UNLOAD ?auto_27152 ?auto_27151 ?auto_27154 ?auto_27153 )
      ( !DROP ?auto_27152 ?auto_27151 ?auto_27150 ?auto_27153 )
      ( MAKE-1CRATE-VERIFY ?auto_27150 ?auto_27151 ) )
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
      ?auto_27170 - HOIST
      ?auto_27175 - PLACE
      ?auto_27174 - PLACE
      ?auto_27172 - HOIST
      ?auto_27171 - SURFACE
      ?auto_27182 - SURFACE
      ?auto_27180 - PLACE
      ?auto_27185 - HOIST
      ?auto_27183 - SURFACE
      ?auto_27179 - PLACE
      ?auto_27177 - HOIST
      ?auto_27176 - SURFACE
      ?auto_27178 - PLACE
      ?auto_27184 - HOIST
      ?auto_27181 - SURFACE
      ?auto_27173 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27170 ?auto_27175 ) ( IS-CRATE ?auto_27169 ) ( not ( = ?auto_27174 ?auto_27175 ) ) ( HOIST-AT ?auto_27172 ?auto_27174 ) ( SURFACE-AT ?auto_27169 ?auto_27174 ) ( ON ?auto_27169 ?auto_27171 ) ( CLEAR ?auto_27169 ) ( not ( = ?auto_27168 ?auto_27169 ) ) ( not ( = ?auto_27168 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27171 ) ) ( not ( = ?auto_27170 ?auto_27172 ) ) ( IS-CRATE ?auto_27168 ) ( AVAILABLE ?auto_27172 ) ( SURFACE-AT ?auto_27168 ?auto_27174 ) ( ON ?auto_27168 ?auto_27182 ) ( CLEAR ?auto_27168 ) ( not ( = ?auto_27167 ?auto_27168 ) ) ( not ( = ?auto_27167 ?auto_27182 ) ) ( not ( = ?auto_27168 ?auto_27182 ) ) ( IS-CRATE ?auto_27167 ) ( not ( = ?auto_27180 ?auto_27175 ) ) ( HOIST-AT ?auto_27185 ?auto_27180 ) ( AVAILABLE ?auto_27185 ) ( SURFACE-AT ?auto_27167 ?auto_27180 ) ( ON ?auto_27167 ?auto_27183 ) ( CLEAR ?auto_27167 ) ( not ( = ?auto_27166 ?auto_27167 ) ) ( not ( = ?auto_27166 ?auto_27183 ) ) ( not ( = ?auto_27167 ?auto_27183 ) ) ( not ( = ?auto_27170 ?auto_27185 ) ) ( IS-CRATE ?auto_27166 ) ( not ( = ?auto_27179 ?auto_27175 ) ) ( HOIST-AT ?auto_27177 ?auto_27179 ) ( AVAILABLE ?auto_27177 ) ( SURFACE-AT ?auto_27166 ?auto_27179 ) ( ON ?auto_27166 ?auto_27176 ) ( CLEAR ?auto_27166 ) ( not ( = ?auto_27165 ?auto_27166 ) ) ( not ( = ?auto_27165 ?auto_27176 ) ) ( not ( = ?auto_27166 ?auto_27176 ) ) ( not ( = ?auto_27170 ?auto_27177 ) ) ( SURFACE-AT ?auto_27164 ?auto_27175 ) ( CLEAR ?auto_27164 ) ( IS-CRATE ?auto_27165 ) ( AVAILABLE ?auto_27170 ) ( not ( = ?auto_27178 ?auto_27175 ) ) ( HOIST-AT ?auto_27184 ?auto_27178 ) ( AVAILABLE ?auto_27184 ) ( SURFACE-AT ?auto_27165 ?auto_27178 ) ( ON ?auto_27165 ?auto_27181 ) ( CLEAR ?auto_27165 ) ( TRUCK-AT ?auto_27173 ?auto_27175 ) ( not ( = ?auto_27164 ?auto_27165 ) ) ( not ( = ?auto_27164 ?auto_27181 ) ) ( not ( = ?auto_27165 ?auto_27181 ) ) ( not ( = ?auto_27170 ?auto_27184 ) ) ( not ( = ?auto_27164 ?auto_27166 ) ) ( not ( = ?auto_27164 ?auto_27176 ) ) ( not ( = ?auto_27166 ?auto_27181 ) ) ( not ( = ?auto_27179 ?auto_27178 ) ) ( not ( = ?auto_27177 ?auto_27184 ) ) ( not ( = ?auto_27176 ?auto_27181 ) ) ( not ( = ?auto_27164 ?auto_27167 ) ) ( not ( = ?auto_27164 ?auto_27183 ) ) ( not ( = ?auto_27165 ?auto_27167 ) ) ( not ( = ?auto_27165 ?auto_27183 ) ) ( not ( = ?auto_27167 ?auto_27176 ) ) ( not ( = ?auto_27167 ?auto_27181 ) ) ( not ( = ?auto_27180 ?auto_27179 ) ) ( not ( = ?auto_27180 ?auto_27178 ) ) ( not ( = ?auto_27185 ?auto_27177 ) ) ( not ( = ?auto_27185 ?auto_27184 ) ) ( not ( = ?auto_27183 ?auto_27176 ) ) ( not ( = ?auto_27183 ?auto_27181 ) ) ( not ( = ?auto_27164 ?auto_27168 ) ) ( not ( = ?auto_27164 ?auto_27182 ) ) ( not ( = ?auto_27165 ?auto_27168 ) ) ( not ( = ?auto_27165 ?auto_27182 ) ) ( not ( = ?auto_27166 ?auto_27168 ) ) ( not ( = ?auto_27166 ?auto_27182 ) ) ( not ( = ?auto_27168 ?auto_27183 ) ) ( not ( = ?auto_27168 ?auto_27176 ) ) ( not ( = ?auto_27168 ?auto_27181 ) ) ( not ( = ?auto_27174 ?auto_27180 ) ) ( not ( = ?auto_27174 ?auto_27179 ) ) ( not ( = ?auto_27174 ?auto_27178 ) ) ( not ( = ?auto_27172 ?auto_27185 ) ) ( not ( = ?auto_27172 ?auto_27177 ) ) ( not ( = ?auto_27172 ?auto_27184 ) ) ( not ( = ?auto_27182 ?auto_27183 ) ) ( not ( = ?auto_27182 ?auto_27176 ) ) ( not ( = ?auto_27182 ?auto_27181 ) ) ( not ( = ?auto_27164 ?auto_27169 ) ) ( not ( = ?auto_27164 ?auto_27171 ) ) ( not ( = ?auto_27165 ?auto_27169 ) ) ( not ( = ?auto_27165 ?auto_27171 ) ) ( not ( = ?auto_27166 ?auto_27169 ) ) ( not ( = ?auto_27166 ?auto_27171 ) ) ( not ( = ?auto_27167 ?auto_27169 ) ) ( not ( = ?auto_27167 ?auto_27171 ) ) ( not ( = ?auto_27169 ?auto_27182 ) ) ( not ( = ?auto_27169 ?auto_27183 ) ) ( not ( = ?auto_27169 ?auto_27176 ) ) ( not ( = ?auto_27169 ?auto_27181 ) ) ( not ( = ?auto_27171 ?auto_27182 ) ) ( not ( = ?auto_27171 ?auto_27183 ) ) ( not ( = ?auto_27171 ?auto_27176 ) ) ( not ( = ?auto_27171 ?auto_27181 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_27164 ?auto_27165 ?auto_27166 ?auto_27167 ?auto_27168 )
      ( MAKE-1CRATE ?auto_27168 ?auto_27169 )
      ( MAKE-5CRATE-VERIFY ?auto_27164 ?auto_27165 ?auto_27166 ?auto_27167 ?auto_27168 ?auto_27169 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27188 - SURFACE
      ?auto_27189 - SURFACE
    )
    :vars
    (
      ?auto_27190 - HOIST
      ?auto_27191 - PLACE
      ?auto_27193 - PLACE
      ?auto_27194 - HOIST
      ?auto_27195 - SURFACE
      ?auto_27192 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27190 ?auto_27191 ) ( SURFACE-AT ?auto_27188 ?auto_27191 ) ( CLEAR ?auto_27188 ) ( IS-CRATE ?auto_27189 ) ( AVAILABLE ?auto_27190 ) ( not ( = ?auto_27193 ?auto_27191 ) ) ( HOIST-AT ?auto_27194 ?auto_27193 ) ( AVAILABLE ?auto_27194 ) ( SURFACE-AT ?auto_27189 ?auto_27193 ) ( ON ?auto_27189 ?auto_27195 ) ( CLEAR ?auto_27189 ) ( TRUCK-AT ?auto_27192 ?auto_27191 ) ( not ( = ?auto_27188 ?auto_27189 ) ) ( not ( = ?auto_27188 ?auto_27195 ) ) ( not ( = ?auto_27189 ?auto_27195 ) ) ( not ( = ?auto_27190 ?auto_27194 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27192 ?auto_27191 ?auto_27193 )
      ( !LIFT ?auto_27194 ?auto_27189 ?auto_27195 ?auto_27193 )
      ( !LOAD ?auto_27194 ?auto_27189 ?auto_27192 ?auto_27193 )
      ( !DRIVE ?auto_27192 ?auto_27193 ?auto_27191 )
      ( !UNLOAD ?auto_27190 ?auto_27189 ?auto_27192 ?auto_27191 )
      ( !DROP ?auto_27190 ?auto_27189 ?auto_27188 ?auto_27191 )
      ( MAKE-1CRATE-VERIFY ?auto_27188 ?auto_27189 ) )
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
      ?auto_27213 - HOIST
      ?auto_27212 - PLACE
      ?auto_27210 - PLACE
      ?auto_27211 - HOIST
      ?auto_27215 - SURFACE
      ?auto_27216 - PLACE
      ?auto_27220 - HOIST
      ?auto_27217 - SURFACE
      ?auto_27219 - SURFACE
      ?auto_27224 - PLACE
      ?auto_27222 - HOIST
      ?auto_27218 - SURFACE
      ?auto_27228 - PLACE
      ?auto_27227 - HOIST
      ?auto_27221 - SURFACE
      ?auto_27226 - PLACE
      ?auto_27223 - HOIST
      ?auto_27225 - SURFACE
      ?auto_27214 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27213 ?auto_27212 ) ( IS-CRATE ?auto_27209 ) ( not ( = ?auto_27210 ?auto_27212 ) ) ( HOIST-AT ?auto_27211 ?auto_27210 ) ( AVAILABLE ?auto_27211 ) ( SURFACE-AT ?auto_27209 ?auto_27210 ) ( ON ?auto_27209 ?auto_27215 ) ( CLEAR ?auto_27209 ) ( not ( = ?auto_27208 ?auto_27209 ) ) ( not ( = ?auto_27208 ?auto_27215 ) ) ( not ( = ?auto_27209 ?auto_27215 ) ) ( not ( = ?auto_27213 ?auto_27211 ) ) ( IS-CRATE ?auto_27208 ) ( not ( = ?auto_27216 ?auto_27212 ) ) ( HOIST-AT ?auto_27220 ?auto_27216 ) ( SURFACE-AT ?auto_27208 ?auto_27216 ) ( ON ?auto_27208 ?auto_27217 ) ( CLEAR ?auto_27208 ) ( not ( = ?auto_27207 ?auto_27208 ) ) ( not ( = ?auto_27207 ?auto_27217 ) ) ( not ( = ?auto_27208 ?auto_27217 ) ) ( not ( = ?auto_27213 ?auto_27220 ) ) ( IS-CRATE ?auto_27207 ) ( AVAILABLE ?auto_27220 ) ( SURFACE-AT ?auto_27207 ?auto_27216 ) ( ON ?auto_27207 ?auto_27219 ) ( CLEAR ?auto_27207 ) ( not ( = ?auto_27206 ?auto_27207 ) ) ( not ( = ?auto_27206 ?auto_27219 ) ) ( not ( = ?auto_27207 ?auto_27219 ) ) ( IS-CRATE ?auto_27206 ) ( not ( = ?auto_27224 ?auto_27212 ) ) ( HOIST-AT ?auto_27222 ?auto_27224 ) ( AVAILABLE ?auto_27222 ) ( SURFACE-AT ?auto_27206 ?auto_27224 ) ( ON ?auto_27206 ?auto_27218 ) ( CLEAR ?auto_27206 ) ( not ( = ?auto_27205 ?auto_27206 ) ) ( not ( = ?auto_27205 ?auto_27218 ) ) ( not ( = ?auto_27206 ?auto_27218 ) ) ( not ( = ?auto_27213 ?auto_27222 ) ) ( IS-CRATE ?auto_27205 ) ( not ( = ?auto_27228 ?auto_27212 ) ) ( HOIST-AT ?auto_27227 ?auto_27228 ) ( AVAILABLE ?auto_27227 ) ( SURFACE-AT ?auto_27205 ?auto_27228 ) ( ON ?auto_27205 ?auto_27221 ) ( CLEAR ?auto_27205 ) ( not ( = ?auto_27204 ?auto_27205 ) ) ( not ( = ?auto_27204 ?auto_27221 ) ) ( not ( = ?auto_27205 ?auto_27221 ) ) ( not ( = ?auto_27213 ?auto_27227 ) ) ( SURFACE-AT ?auto_27203 ?auto_27212 ) ( CLEAR ?auto_27203 ) ( IS-CRATE ?auto_27204 ) ( AVAILABLE ?auto_27213 ) ( not ( = ?auto_27226 ?auto_27212 ) ) ( HOIST-AT ?auto_27223 ?auto_27226 ) ( AVAILABLE ?auto_27223 ) ( SURFACE-AT ?auto_27204 ?auto_27226 ) ( ON ?auto_27204 ?auto_27225 ) ( CLEAR ?auto_27204 ) ( TRUCK-AT ?auto_27214 ?auto_27212 ) ( not ( = ?auto_27203 ?auto_27204 ) ) ( not ( = ?auto_27203 ?auto_27225 ) ) ( not ( = ?auto_27204 ?auto_27225 ) ) ( not ( = ?auto_27213 ?auto_27223 ) ) ( not ( = ?auto_27203 ?auto_27205 ) ) ( not ( = ?auto_27203 ?auto_27221 ) ) ( not ( = ?auto_27205 ?auto_27225 ) ) ( not ( = ?auto_27228 ?auto_27226 ) ) ( not ( = ?auto_27227 ?auto_27223 ) ) ( not ( = ?auto_27221 ?auto_27225 ) ) ( not ( = ?auto_27203 ?auto_27206 ) ) ( not ( = ?auto_27203 ?auto_27218 ) ) ( not ( = ?auto_27204 ?auto_27206 ) ) ( not ( = ?auto_27204 ?auto_27218 ) ) ( not ( = ?auto_27206 ?auto_27221 ) ) ( not ( = ?auto_27206 ?auto_27225 ) ) ( not ( = ?auto_27224 ?auto_27228 ) ) ( not ( = ?auto_27224 ?auto_27226 ) ) ( not ( = ?auto_27222 ?auto_27227 ) ) ( not ( = ?auto_27222 ?auto_27223 ) ) ( not ( = ?auto_27218 ?auto_27221 ) ) ( not ( = ?auto_27218 ?auto_27225 ) ) ( not ( = ?auto_27203 ?auto_27207 ) ) ( not ( = ?auto_27203 ?auto_27219 ) ) ( not ( = ?auto_27204 ?auto_27207 ) ) ( not ( = ?auto_27204 ?auto_27219 ) ) ( not ( = ?auto_27205 ?auto_27207 ) ) ( not ( = ?auto_27205 ?auto_27219 ) ) ( not ( = ?auto_27207 ?auto_27218 ) ) ( not ( = ?auto_27207 ?auto_27221 ) ) ( not ( = ?auto_27207 ?auto_27225 ) ) ( not ( = ?auto_27216 ?auto_27224 ) ) ( not ( = ?auto_27216 ?auto_27228 ) ) ( not ( = ?auto_27216 ?auto_27226 ) ) ( not ( = ?auto_27220 ?auto_27222 ) ) ( not ( = ?auto_27220 ?auto_27227 ) ) ( not ( = ?auto_27220 ?auto_27223 ) ) ( not ( = ?auto_27219 ?auto_27218 ) ) ( not ( = ?auto_27219 ?auto_27221 ) ) ( not ( = ?auto_27219 ?auto_27225 ) ) ( not ( = ?auto_27203 ?auto_27208 ) ) ( not ( = ?auto_27203 ?auto_27217 ) ) ( not ( = ?auto_27204 ?auto_27208 ) ) ( not ( = ?auto_27204 ?auto_27217 ) ) ( not ( = ?auto_27205 ?auto_27208 ) ) ( not ( = ?auto_27205 ?auto_27217 ) ) ( not ( = ?auto_27206 ?auto_27208 ) ) ( not ( = ?auto_27206 ?auto_27217 ) ) ( not ( = ?auto_27208 ?auto_27219 ) ) ( not ( = ?auto_27208 ?auto_27218 ) ) ( not ( = ?auto_27208 ?auto_27221 ) ) ( not ( = ?auto_27208 ?auto_27225 ) ) ( not ( = ?auto_27217 ?auto_27219 ) ) ( not ( = ?auto_27217 ?auto_27218 ) ) ( not ( = ?auto_27217 ?auto_27221 ) ) ( not ( = ?auto_27217 ?auto_27225 ) ) ( not ( = ?auto_27203 ?auto_27209 ) ) ( not ( = ?auto_27203 ?auto_27215 ) ) ( not ( = ?auto_27204 ?auto_27209 ) ) ( not ( = ?auto_27204 ?auto_27215 ) ) ( not ( = ?auto_27205 ?auto_27209 ) ) ( not ( = ?auto_27205 ?auto_27215 ) ) ( not ( = ?auto_27206 ?auto_27209 ) ) ( not ( = ?auto_27206 ?auto_27215 ) ) ( not ( = ?auto_27207 ?auto_27209 ) ) ( not ( = ?auto_27207 ?auto_27215 ) ) ( not ( = ?auto_27209 ?auto_27217 ) ) ( not ( = ?auto_27209 ?auto_27219 ) ) ( not ( = ?auto_27209 ?auto_27218 ) ) ( not ( = ?auto_27209 ?auto_27221 ) ) ( not ( = ?auto_27209 ?auto_27225 ) ) ( not ( = ?auto_27210 ?auto_27216 ) ) ( not ( = ?auto_27210 ?auto_27224 ) ) ( not ( = ?auto_27210 ?auto_27228 ) ) ( not ( = ?auto_27210 ?auto_27226 ) ) ( not ( = ?auto_27211 ?auto_27220 ) ) ( not ( = ?auto_27211 ?auto_27222 ) ) ( not ( = ?auto_27211 ?auto_27227 ) ) ( not ( = ?auto_27211 ?auto_27223 ) ) ( not ( = ?auto_27215 ?auto_27217 ) ) ( not ( = ?auto_27215 ?auto_27219 ) ) ( not ( = ?auto_27215 ?auto_27218 ) ) ( not ( = ?auto_27215 ?auto_27221 ) ) ( not ( = ?auto_27215 ?auto_27225 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 )
      ( MAKE-1CRATE ?auto_27208 ?auto_27209 )
      ( MAKE-6CRATE-VERIFY ?auto_27203 ?auto_27204 ?auto_27205 ?auto_27206 ?auto_27207 ?auto_27208 ?auto_27209 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27231 - SURFACE
      ?auto_27232 - SURFACE
    )
    :vars
    (
      ?auto_27233 - HOIST
      ?auto_27234 - PLACE
      ?auto_27236 - PLACE
      ?auto_27237 - HOIST
      ?auto_27238 - SURFACE
      ?auto_27235 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27233 ?auto_27234 ) ( SURFACE-AT ?auto_27231 ?auto_27234 ) ( CLEAR ?auto_27231 ) ( IS-CRATE ?auto_27232 ) ( AVAILABLE ?auto_27233 ) ( not ( = ?auto_27236 ?auto_27234 ) ) ( HOIST-AT ?auto_27237 ?auto_27236 ) ( AVAILABLE ?auto_27237 ) ( SURFACE-AT ?auto_27232 ?auto_27236 ) ( ON ?auto_27232 ?auto_27238 ) ( CLEAR ?auto_27232 ) ( TRUCK-AT ?auto_27235 ?auto_27234 ) ( not ( = ?auto_27231 ?auto_27232 ) ) ( not ( = ?auto_27231 ?auto_27238 ) ) ( not ( = ?auto_27232 ?auto_27238 ) ) ( not ( = ?auto_27233 ?auto_27237 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27235 ?auto_27234 ?auto_27236 )
      ( !LIFT ?auto_27237 ?auto_27232 ?auto_27238 ?auto_27236 )
      ( !LOAD ?auto_27237 ?auto_27232 ?auto_27235 ?auto_27236 )
      ( !DRIVE ?auto_27235 ?auto_27236 ?auto_27234 )
      ( !UNLOAD ?auto_27233 ?auto_27232 ?auto_27235 ?auto_27234 )
      ( !DROP ?auto_27233 ?auto_27232 ?auto_27231 ?auto_27234 )
      ( MAKE-1CRATE-VERIFY ?auto_27231 ?auto_27232 ) )
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
      ?auto_27254 - SURFACE
      ?auto_27253 - SURFACE
    )
    :vars
    (
      ?auto_27257 - HOIST
      ?auto_27256 - PLACE
      ?auto_27259 - PLACE
      ?auto_27258 - HOIST
      ?auto_27260 - SURFACE
      ?auto_27274 - PLACE
      ?auto_27273 - HOIST
      ?auto_27271 - SURFACE
      ?auto_27276 - PLACE
      ?auto_27269 - HOIST
      ?auto_27272 - SURFACE
      ?auto_27270 - SURFACE
      ?auto_27261 - PLACE
      ?auto_27267 - HOIST
      ?auto_27275 - SURFACE
      ?auto_27265 - PLACE
      ?auto_27264 - HOIST
      ?auto_27268 - SURFACE
      ?auto_27262 - PLACE
      ?auto_27266 - HOIST
      ?auto_27263 - SURFACE
      ?auto_27255 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27257 ?auto_27256 ) ( IS-CRATE ?auto_27253 ) ( not ( = ?auto_27259 ?auto_27256 ) ) ( HOIST-AT ?auto_27258 ?auto_27259 ) ( AVAILABLE ?auto_27258 ) ( SURFACE-AT ?auto_27253 ?auto_27259 ) ( ON ?auto_27253 ?auto_27260 ) ( CLEAR ?auto_27253 ) ( not ( = ?auto_27254 ?auto_27253 ) ) ( not ( = ?auto_27254 ?auto_27260 ) ) ( not ( = ?auto_27253 ?auto_27260 ) ) ( not ( = ?auto_27257 ?auto_27258 ) ) ( IS-CRATE ?auto_27254 ) ( not ( = ?auto_27274 ?auto_27256 ) ) ( HOIST-AT ?auto_27273 ?auto_27274 ) ( AVAILABLE ?auto_27273 ) ( SURFACE-AT ?auto_27254 ?auto_27274 ) ( ON ?auto_27254 ?auto_27271 ) ( CLEAR ?auto_27254 ) ( not ( = ?auto_27252 ?auto_27254 ) ) ( not ( = ?auto_27252 ?auto_27271 ) ) ( not ( = ?auto_27254 ?auto_27271 ) ) ( not ( = ?auto_27257 ?auto_27273 ) ) ( IS-CRATE ?auto_27252 ) ( not ( = ?auto_27276 ?auto_27256 ) ) ( HOIST-AT ?auto_27269 ?auto_27276 ) ( SURFACE-AT ?auto_27252 ?auto_27276 ) ( ON ?auto_27252 ?auto_27272 ) ( CLEAR ?auto_27252 ) ( not ( = ?auto_27251 ?auto_27252 ) ) ( not ( = ?auto_27251 ?auto_27272 ) ) ( not ( = ?auto_27252 ?auto_27272 ) ) ( not ( = ?auto_27257 ?auto_27269 ) ) ( IS-CRATE ?auto_27251 ) ( AVAILABLE ?auto_27269 ) ( SURFACE-AT ?auto_27251 ?auto_27276 ) ( ON ?auto_27251 ?auto_27270 ) ( CLEAR ?auto_27251 ) ( not ( = ?auto_27250 ?auto_27251 ) ) ( not ( = ?auto_27250 ?auto_27270 ) ) ( not ( = ?auto_27251 ?auto_27270 ) ) ( IS-CRATE ?auto_27250 ) ( not ( = ?auto_27261 ?auto_27256 ) ) ( HOIST-AT ?auto_27267 ?auto_27261 ) ( AVAILABLE ?auto_27267 ) ( SURFACE-AT ?auto_27250 ?auto_27261 ) ( ON ?auto_27250 ?auto_27275 ) ( CLEAR ?auto_27250 ) ( not ( = ?auto_27249 ?auto_27250 ) ) ( not ( = ?auto_27249 ?auto_27275 ) ) ( not ( = ?auto_27250 ?auto_27275 ) ) ( not ( = ?auto_27257 ?auto_27267 ) ) ( IS-CRATE ?auto_27249 ) ( not ( = ?auto_27265 ?auto_27256 ) ) ( HOIST-AT ?auto_27264 ?auto_27265 ) ( AVAILABLE ?auto_27264 ) ( SURFACE-AT ?auto_27249 ?auto_27265 ) ( ON ?auto_27249 ?auto_27268 ) ( CLEAR ?auto_27249 ) ( not ( = ?auto_27248 ?auto_27249 ) ) ( not ( = ?auto_27248 ?auto_27268 ) ) ( not ( = ?auto_27249 ?auto_27268 ) ) ( not ( = ?auto_27257 ?auto_27264 ) ) ( SURFACE-AT ?auto_27247 ?auto_27256 ) ( CLEAR ?auto_27247 ) ( IS-CRATE ?auto_27248 ) ( AVAILABLE ?auto_27257 ) ( not ( = ?auto_27262 ?auto_27256 ) ) ( HOIST-AT ?auto_27266 ?auto_27262 ) ( AVAILABLE ?auto_27266 ) ( SURFACE-AT ?auto_27248 ?auto_27262 ) ( ON ?auto_27248 ?auto_27263 ) ( CLEAR ?auto_27248 ) ( TRUCK-AT ?auto_27255 ?auto_27256 ) ( not ( = ?auto_27247 ?auto_27248 ) ) ( not ( = ?auto_27247 ?auto_27263 ) ) ( not ( = ?auto_27248 ?auto_27263 ) ) ( not ( = ?auto_27257 ?auto_27266 ) ) ( not ( = ?auto_27247 ?auto_27249 ) ) ( not ( = ?auto_27247 ?auto_27268 ) ) ( not ( = ?auto_27249 ?auto_27263 ) ) ( not ( = ?auto_27265 ?auto_27262 ) ) ( not ( = ?auto_27264 ?auto_27266 ) ) ( not ( = ?auto_27268 ?auto_27263 ) ) ( not ( = ?auto_27247 ?auto_27250 ) ) ( not ( = ?auto_27247 ?auto_27275 ) ) ( not ( = ?auto_27248 ?auto_27250 ) ) ( not ( = ?auto_27248 ?auto_27275 ) ) ( not ( = ?auto_27250 ?auto_27268 ) ) ( not ( = ?auto_27250 ?auto_27263 ) ) ( not ( = ?auto_27261 ?auto_27265 ) ) ( not ( = ?auto_27261 ?auto_27262 ) ) ( not ( = ?auto_27267 ?auto_27264 ) ) ( not ( = ?auto_27267 ?auto_27266 ) ) ( not ( = ?auto_27275 ?auto_27268 ) ) ( not ( = ?auto_27275 ?auto_27263 ) ) ( not ( = ?auto_27247 ?auto_27251 ) ) ( not ( = ?auto_27247 ?auto_27270 ) ) ( not ( = ?auto_27248 ?auto_27251 ) ) ( not ( = ?auto_27248 ?auto_27270 ) ) ( not ( = ?auto_27249 ?auto_27251 ) ) ( not ( = ?auto_27249 ?auto_27270 ) ) ( not ( = ?auto_27251 ?auto_27275 ) ) ( not ( = ?auto_27251 ?auto_27268 ) ) ( not ( = ?auto_27251 ?auto_27263 ) ) ( not ( = ?auto_27276 ?auto_27261 ) ) ( not ( = ?auto_27276 ?auto_27265 ) ) ( not ( = ?auto_27276 ?auto_27262 ) ) ( not ( = ?auto_27269 ?auto_27267 ) ) ( not ( = ?auto_27269 ?auto_27264 ) ) ( not ( = ?auto_27269 ?auto_27266 ) ) ( not ( = ?auto_27270 ?auto_27275 ) ) ( not ( = ?auto_27270 ?auto_27268 ) ) ( not ( = ?auto_27270 ?auto_27263 ) ) ( not ( = ?auto_27247 ?auto_27252 ) ) ( not ( = ?auto_27247 ?auto_27272 ) ) ( not ( = ?auto_27248 ?auto_27252 ) ) ( not ( = ?auto_27248 ?auto_27272 ) ) ( not ( = ?auto_27249 ?auto_27252 ) ) ( not ( = ?auto_27249 ?auto_27272 ) ) ( not ( = ?auto_27250 ?auto_27252 ) ) ( not ( = ?auto_27250 ?auto_27272 ) ) ( not ( = ?auto_27252 ?auto_27270 ) ) ( not ( = ?auto_27252 ?auto_27275 ) ) ( not ( = ?auto_27252 ?auto_27268 ) ) ( not ( = ?auto_27252 ?auto_27263 ) ) ( not ( = ?auto_27272 ?auto_27270 ) ) ( not ( = ?auto_27272 ?auto_27275 ) ) ( not ( = ?auto_27272 ?auto_27268 ) ) ( not ( = ?auto_27272 ?auto_27263 ) ) ( not ( = ?auto_27247 ?auto_27254 ) ) ( not ( = ?auto_27247 ?auto_27271 ) ) ( not ( = ?auto_27248 ?auto_27254 ) ) ( not ( = ?auto_27248 ?auto_27271 ) ) ( not ( = ?auto_27249 ?auto_27254 ) ) ( not ( = ?auto_27249 ?auto_27271 ) ) ( not ( = ?auto_27250 ?auto_27254 ) ) ( not ( = ?auto_27250 ?auto_27271 ) ) ( not ( = ?auto_27251 ?auto_27254 ) ) ( not ( = ?auto_27251 ?auto_27271 ) ) ( not ( = ?auto_27254 ?auto_27272 ) ) ( not ( = ?auto_27254 ?auto_27270 ) ) ( not ( = ?auto_27254 ?auto_27275 ) ) ( not ( = ?auto_27254 ?auto_27268 ) ) ( not ( = ?auto_27254 ?auto_27263 ) ) ( not ( = ?auto_27274 ?auto_27276 ) ) ( not ( = ?auto_27274 ?auto_27261 ) ) ( not ( = ?auto_27274 ?auto_27265 ) ) ( not ( = ?auto_27274 ?auto_27262 ) ) ( not ( = ?auto_27273 ?auto_27269 ) ) ( not ( = ?auto_27273 ?auto_27267 ) ) ( not ( = ?auto_27273 ?auto_27264 ) ) ( not ( = ?auto_27273 ?auto_27266 ) ) ( not ( = ?auto_27271 ?auto_27272 ) ) ( not ( = ?auto_27271 ?auto_27270 ) ) ( not ( = ?auto_27271 ?auto_27275 ) ) ( not ( = ?auto_27271 ?auto_27268 ) ) ( not ( = ?auto_27271 ?auto_27263 ) ) ( not ( = ?auto_27247 ?auto_27253 ) ) ( not ( = ?auto_27247 ?auto_27260 ) ) ( not ( = ?auto_27248 ?auto_27253 ) ) ( not ( = ?auto_27248 ?auto_27260 ) ) ( not ( = ?auto_27249 ?auto_27253 ) ) ( not ( = ?auto_27249 ?auto_27260 ) ) ( not ( = ?auto_27250 ?auto_27253 ) ) ( not ( = ?auto_27250 ?auto_27260 ) ) ( not ( = ?auto_27251 ?auto_27253 ) ) ( not ( = ?auto_27251 ?auto_27260 ) ) ( not ( = ?auto_27252 ?auto_27253 ) ) ( not ( = ?auto_27252 ?auto_27260 ) ) ( not ( = ?auto_27253 ?auto_27271 ) ) ( not ( = ?auto_27253 ?auto_27272 ) ) ( not ( = ?auto_27253 ?auto_27270 ) ) ( not ( = ?auto_27253 ?auto_27275 ) ) ( not ( = ?auto_27253 ?auto_27268 ) ) ( not ( = ?auto_27253 ?auto_27263 ) ) ( not ( = ?auto_27259 ?auto_27274 ) ) ( not ( = ?auto_27259 ?auto_27276 ) ) ( not ( = ?auto_27259 ?auto_27261 ) ) ( not ( = ?auto_27259 ?auto_27265 ) ) ( not ( = ?auto_27259 ?auto_27262 ) ) ( not ( = ?auto_27258 ?auto_27273 ) ) ( not ( = ?auto_27258 ?auto_27269 ) ) ( not ( = ?auto_27258 ?auto_27267 ) ) ( not ( = ?auto_27258 ?auto_27264 ) ) ( not ( = ?auto_27258 ?auto_27266 ) ) ( not ( = ?auto_27260 ?auto_27271 ) ) ( not ( = ?auto_27260 ?auto_27272 ) ) ( not ( = ?auto_27260 ?auto_27270 ) ) ( not ( = ?auto_27260 ?auto_27275 ) ) ( not ( = ?auto_27260 ?auto_27268 ) ) ( not ( = ?auto_27260 ?auto_27263 ) ) )
    :subtasks
    ( ( MAKE-6CRATE ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ?auto_27251 ?auto_27252 ?auto_27254 )
      ( MAKE-1CRATE ?auto_27254 ?auto_27253 )
      ( MAKE-7CRATE-VERIFY ?auto_27247 ?auto_27248 ?auto_27249 ?auto_27250 ?auto_27251 ?auto_27252 ?auto_27254 ?auto_27253 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27279 - SURFACE
      ?auto_27280 - SURFACE
    )
    :vars
    (
      ?auto_27281 - HOIST
      ?auto_27282 - PLACE
      ?auto_27284 - PLACE
      ?auto_27285 - HOIST
      ?auto_27286 - SURFACE
      ?auto_27283 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27281 ?auto_27282 ) ( SURFACE-AT ?auto_27279 ?auto_27282 ) ( CLEAR ?auto_27279 ) ( IS-CRATE ?auto_27280 ) ( AVAILABLE ?auto_27281 ) ( not ( = ?auto_27284 ?auto_27282 ) ) ( HOIST-AT ?auto_27285 ?auto_27284 ) ( AVAILABLE ?auto_27285 ) ( SURFACE-AT ?auto_27280 ?auto_27284 ) ( ON ?auto_27280 ?auto_27286 ) ( CLEAR ?auto_27280 ) ( TRUCK-AT ?auto_27283 ?auto_27282 ) ( not ( = ?auto_27279 ?auto_27280 ) ) ( not ( = ?auto_27279 ?auto_27286 ) ) ( not ( = ?auto_27280 ?auto_27286 ) ) ( not ( = ?auto_27281 ?auto_27285 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27283 ?auto_27282 ?auto_27284 )
      ( !LIFT ?auto_27285 ?auto_27280 ?auto_27286 ?auto_27284 )
      ( !LOAD ?auto_27285 ?auto_27280 ?auto_27283 ?auto_27284 )
      ( !DRIVE ?auto_27283 ?auto_27284 ?auto_27282 )
      ( !UNLOAD ?auto_27281 ?auto_27280 ?auto_27283 ?auto_27282 )
      ( !DROP ?auto_27281 ?auto_27280 ?auto_27279 ?auto_27282 )
      ( MAKE-1CRATE-VERIFY ?auto_27279 ?auto_27280 ) )
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
      ?auto_27304 - SURFACE
      ?auto_27303 - SURFACE
      ?auto_27302 - SURFACE
    )
    :vars
    (
      ?auto_27306 - HOIST
      ?auto_27308 - PLACE
      ?auto_27307 - PLACE
      ?auto_27309 - HOIST
      ?auto_27305 - SURFACE
      ?auto_27311 - PLACE
      ?auto_27312 - HOIST
      ?auto_27314 - SURFACE
      ?auto_27322 - PLACE
      ?auto_27321 - HOIST
      ?auto_27318 - SURFACE
      ?auto_27316 - PLACE
      ?auto_27317 - HOIST
      ?auto_27320 - SURFACE
      ?auto_27319 - SURFACE
      ?auto_27329 - PLACE
      ?auto_27324 - HOIST
      ?auto_27327 - SURFACE
      ?auto_27326 - PLACE
      ?auto_27313 - HOIST
      ?auto_27323 - SURFACE
      ?auto_27328 - PLACE
      ?auto_27325 - HOIST
      ?auto_27315 - SURFACE
      ?auto_27310 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27306 ?auto_27308 ) ( IS-CRATE ?auto_27302 ) ( not ( = ?auto_27307 ?auto_27308 ) ) ( HOIST-AT ?auto_27309 ?auto_27307 ) ( AVAILABLE ?auto_27309 ) ( SURFACE-AT ?auto_27302 ?auto_27307 ) ( ON ?auto_27302 ?auto_27305 ) ( CLEAR ?auto_27302 ) ( not ( = ?auto_27303 ?auto_27302 ) ) ( not ( = ?auto_27303 ?auto_27305 ) ) ( not ( = ?auto_27302 ?auto_27305 ) ) ( not ( = ?auto_27306 ?auto_27309 ) ) ( IS-CRATE ?auto_27303 ) ( not ( = ?auto_27311 ?auto_27308 ) ) ( HOIST-AT ?auto_27312 ?auto_27311 ) ( AVAILABLE ?auto_27312 ) ( SURFACE-AT ?auto_27303 ?auto_27311 ) ( ON ?auto_27303 ?auto_27314 ) ( CLEAR ?auto_27303 ) ( not ( = ?auto_27304 ?auto_27303 ) ) ( not ( = ?auto_27304 ?auto_27314 ) ) ( not ( = ?auto_27303 ?auto_27314 ) ) ( not ( = ?auto_27306 ?auto_27312 ) ) ( IS-CRATE ?auto_27304 ) ( not ( = ?auto_27322 ?auto_27308 ) ) ( HOIST-AT ?auto_27321 ?auto_27322 ) ( AVAILABLE ?auto_27321 ) ( SURFACE-AT ?auto_27304 ?auto_27322 ) ( ON ?auto_27304 ?auto_27318 ) ( CLEAR ?auto_27304 ) ( not ( = ?auto_27301 ?auto_27304 ) ) ( not ( = ?auto_27301 ?auto_27318 ) ) ( not ( = ?auto_27304 ?auto_27318 ) ) ( not ( = ?auto_27306 ?auto_27321 ) ) ( IS-CRATE ?auto_27301 ) ( not ( = ?auto_27316 ?auto_27308 ) ) ( HOIST-AT ?auto_27317 ?auto_27316 ) ( SURFACE-AT ?auto_27301 ?auto_27316 ) ( ON ?auto_27301 ?auto_27320 ) ( CLEAR ?auto_27301 ) ( not ( = ?auto_27300 ?auto_27301 ) ) ( not ( = ?auto_27300 ?auto_27320 ) ) ( not ( = ?auto_27301 ?auto_27320 ) ) ( not ( = ?auto_27306 ?auto_27317 ) ) ( IS-CRATE ?auto_27300 ) ( AVAILABLE ?auto_27317 ) ( SURFACE-AT ?auto_27300 ?auto_27316 ) ( ON ?auto_27300 ?auto_27319 ) ( CLEAR ?auto_27300 ) ( not ( = ?auto_27299 ?auto_27300 ) ) ( not ( = ?auto_27299 ?auto_27319 ) ) ( not ( = ?auto_27300 ?auto_27319 ) ) ( IS-CRATE ?auto_27299 ) ( not ( = ?auto_27329 ?auto_27308 ) ) ( HOIST-AT ?auto_27324 ?auto_27329 ) ( AVAILABLE ?auto_27324 ) ( SURFACE-AT ?auto_27299 ?auto_27329 ) ( ON ?auto_27299 ?auto_27327 ) ( CLEAR ?auto_27299 ) ( not ( = ?auto_27298 ?auto_27299 ) ) ( not ( = ?auto_27298 ?auto_27327 ) ) ( not ( = ?auto_27299 ?auto_27327 ) ) ( not ( = ?auto_27306 ?auto_27324 ) ) ( IS-CRATE ?auto_27298 ) ( not ( = ?auto_27326 ?auto_27308 ) ) ( HOIST-AT ?auto_27313 ?auto_27326 ) ( AVAILABLE ?auto_27313 ) ( SURFACE-AT ?auto_27298 ?auto_27326 ) ( ON ?auto_27298 ?auto_27323 ) ( CLEAR ?auto_27298 ) ( not ( = ?auto_27297 ?auto_27298 ) ) ( not ( = ?auto_27297 ?auto_27323 ) ) ( not ( = ?auto_27298 ?auto_27323 ) ) ( not ( = ?auto_27306 ?auto_27313 ) ) ( SURFACE-AT ?auto_27296 ?auto_27308 ) ( CLEAR ?auto_27296 ) ( IS-CRATE ?auto_27297 ) ( AVAILABLE ?auto_27306 ) ( not ( = ?auto_27328 ?auto_27308 ) ) ( HOIST-AT ?auto_27325 ?auto_27328 ) ( AVAILABLE ?auto_27325 ) ( SURFACE-AT ?auto_27297 ?auto_27328 ) ( ON ?auto_27297 ?auto_27315 ) ( CLEAR ?auto_27297 ) ( TRUCK-AT ?auto_27310 ?auto_27308 ) ( not ( = ?auto_27296 ?auto_27297 ) ) ( not ( = ?auto_27296 ?auto_27315 ) ) ( not ( = ?auto_27297 ?auto_27315 ) ) ( not ( = ?auto_27306 ?auto_27325 ) ) ( not ( = ?auto_27296 ?auto_27298 ) ) ( not ( = ?auto_27296 ?auto_27323 ) ) ( not ( = ?auto_27298 ?auto_27315 ) ) ( not ( = ?auto_27326 ?auto_27328 ) ) ( not ( = ?auto_27313 ?auto_27325 ) ) ( not ( = ?auto_27323 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27299 ) ) ( not ( = ?auto_27296 ?auto_27327 ) ) ( not ( = ?auto_27297 ?auto_27299 ) ) ( not ( = ?auto_27297 ?auto_27327 ) ) ( not ( = ?auto_27299 ?auto_27323 ) ) ( not ( = ?auto_27299 ?auto_27315 ) ) ( not ( = ?auto_27329 ?auto_27326 ) ) ( not ( = ?auto_27329 ?auto_27328 ) ) ( not ( = ?auto_27324 ?auto_27313 ) ) ( not ( = ?auto_27324 ?auto_27325 ) ) ( not ( = ?auto_27327 ?auto_27323 ) ) ( not ( = ?auto_27327 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27300 ) ) ( not ( = ?auto_27296 ?auto_27319 ) ) ( not ( = ?auto_27297 ?auto_27300 ) ) ( not ( = ?auto_27297 ?auto_27319 ) ) ( not ( = ?auto_27298 ?auto_27300 ) ) ( not ( = ?auto_27298 ?auto_27319 ) ) ( not ( = ?auto_27300 ?auto_27327 ) ) ( not ( = ?auto_27300 ?auto_27323 ) ) ( not ( = ?auto_27300 ?auto_27315 ) ) ( not ( = ?auto_27316 ?auto_27329 ) ) ( not ( = ?auto_27316 ?auto_27326 ) ) ( not ( = ?auto_27316 ?auto_27328 ) ) ( not ( = ?auto_27317 ?auto_27324 ) ) ( not ( = ?auto_27317 ?auto_27313 ) ) ( not ( = ?auto_27317 ?auto_27325 ) ) ( not ( = ?auto_27319 ?auto_27327 ) ) ( not ( = ?auto_27319 ?auto_27323 ) ) ( not ( = ?auto_27319 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27301 ) ) ( not ( = ?auto_27296 ?auto_27320 ) ) ( not ( = ?auto_27297 ?auto_27301 ) ) ( not ( = ?auto_27297 ?auto_27320 ) ) ( not ( = ?auto_27298 ?auto_27301 ) ) ( not ( = ?auto_27298 ?auto_27320 ) ) ( not ( = ?auto_27299 ?auto_27301 ) ) ( not ( = ?auto_27299 ?auto_27320 ) ) ( not ( = ?auto_27301 ?auto_27319 ) ) ( not ( = ?auto_27301 ?auto_27327 ) ) ( not ( = ?auto_27301 ?auto_27323 ) ) ( not ( = ?auto_27301 ?auto_27315 ) ) ( not ( = ?auto_27320 ?auto_27319 ) ) ( not ( = ?auto_27320 ?auto_27327 ) ) ( not ( = ?auto_27320 ?auto_27323 ) ) ( not ( = ?auto_27320 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27304 ) ) ( not ( = ?auto_27296 ?auto_27318 ) ) ( not ( = ?auto_27297 ?auto_27304 ) ) ( not ( = ?auto_27297 ?auto_27318 ) ) ( not ( = ?auto_27298 ?auto_27304 ) ) ( not ( = ?auto_27298 ?auto_27318 ) ) ( not ( = ?auto_27299 ?auto_27304 ) ) ( not ( = ?auto_27299 ?auto_27318 ) ) ( not ( = ?auto_27300 ?auto_27304 ) ) ( not ( = ?auto_27300 ?auto_27318 ) ) ( not ( = ?auto_27304 ?auto_27320 ) ) ( not ( = ?auto_27304 ?auto_27319 ) ) ( not ( = ?auto_27304 ?auto_27327 ) ) ( not ( = ?auto_27304 ?auto_27323 ) ) ( not ( = ?auto_27304 ?auto_27315 ) ) ( not ( = ?auto_27322 ?auto_27316 ) ) ( not ( = ?auto_27322 ?auto_27329 ) ) ( not ( = ?auto_27322 ?auto_27326 ) ) ( not ( = ?auto_27322 ?auto_27328 ) ) ( not ( = ?auto_27321 ?auto_27317 ) ) ( not ( = ?auto_27321 ?auto_27324 ) ) ( not ( = ?auto_27321 ?auto_27313 ) ) ( not ( = ?auto_27321 ?auto_27325 ) ) ( not ( = ?auto_27318 ?auto_27320 ) ) ( not ( = ?auto_27318 ?auto_27319 ) ) ( not ( = ?auto_27318 ?auto_27327 ) ) ( not ( = ?auto_27318 ?auto_27323 ) ) ( not ( = ?auto_27318 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27303 ) ) ( not ( = ?auto_27296 ?auto_27314 ) ) ( not ( = ?auto_27297 ?auto_27303 ) ) ( not ( = ?auto_27297 ?auto_27314 ) ) ( not ( = ?auto_27298 ?auto_27303 ) ) ( not ( = ?auto_27298 ?auto_27314 ) ) ( not ( = ?auto_27299 ?auto_27303 ) ) ( not ( = ?auto_27299 ?auto_27314 ) ) ( not ( = ?auto_27300 ?auto_27303 ) ) ( not ( = ?auto_27300 ?auto_27314 ) ) ( not ( = ?auto_27301 ?auto_27303 ) ) ( not ( = ?auto_27301 ?auto_27314 ) ) ( not ( = ?auto_27303 ?auto_27318 ) ) ( not ( = ?auto_27303 ?auto_27320 ) ) ( not ( = ?auto_27303 ?auto_27319 ) ) ( not ( = ?auto_27303 ?auto_27327 ) ) ( not ( = ?auto_27303 ?auto_27323 ) ) ( not ( = ?auto_27303 ?auto_27315 ) ) ( not ( = ?auto_27311 ?auto_27322 ) ) ( not ( = ?auto_27311 ?auto_27316 ) ) ( not ( = ?auto_27311 ?auto_27329 ) ) ( not ( = ?auto_27311 ?auto_27326 ) ) ( not ( = ?auto_27311 ?auto_27328 ) ) ( not ( = ?auto_27312 ?auto_27321 ) ) ( not ( = ?auto_27312 ?auto_27317 ) ) ( not ( = ?auto_27312 ?auto_27324 ) ) ( not ( = ?auto_27312 ?auto_27313 ) ) ( not ( = ?auto_27312 ?auto_27325 ) ) ( not ( = ?auto_27314 ?auto_27318 ) ) ( not ( = ?auto_27314 ?auto_27320 ) ) ( not ( = ?auto_27314 ?auto_27319 ) ) ( not ( = ?auto_27314 ?auto_27327 ) ) ( not ( = ?auto_27314 ?auto_27323 ) ) ( not ( = ?auto_27314 ?auto_27315 ) ) ( not ( = ?auto_27296 ?auto_27302 ) ) ( not ( = ?auto_27296 ?auto_27305 ) ) ( not ( = ?auto_27297 ?auto_27302 ) ) ( not ( = ?auto_27297 ?auto_27305 ) ) ( not ( = ?auto_27298 ?auto_27302 ) ) ( not ( = ?auto_27298 ?auto_27305 ) ) ( not ( = ?auto_27299 ?auto_27302 ) ) ( not ( = ?auto_27299 ?auto_27305 ) ) ( not ( = ?auto_27300 ?auto_27302 ) ) ( not ( = ?auto_27300 ?auto_27305 ) ) ( not ( = ?auto_27301 ?auto_27302 ) ) ( not ( = ?auto_27301 ?auto_27305 ) ) ( not ( = ?auto_27304 ?auto_27302 ) ) ( not ( = ?auto_27304 ?auto_27305 ) ) ( not ( = ?auto_27302 ?auto_27314 ) ) ( not ( = ?auto_27302 ?auto_27318 ) ) ( not ( = ?auto_27302 ?auto_27320 ) ) ( not ( = ?auto_27302 ?auto_27319 ) ) ( not ( = ?auto_27302 ?auto_27327 ) ) ( not ( = ?auto_27302 ?auto_27323 ) ) ( not ( = ?auto_27302 ?auto_27315 ) ) ( not ( = ?auto_27307 ?auto_27311 ) ) ( not ( = ?auto_27307 ?auto_27322 ) ) ( not ( = ?auto_27307 ?auto_27316 ) ) ( not ( = ?auto_27307 ?auto_27329 ) ) ( not ( = ?auto_27307 ?auto_27326 ) ) ( not ( = ?auto_27307 ?auto_27328 ) ) ( not ( = ?auto_27309 ?auto_27312 ) ) ( not ( = ?auto_27309 ?auto_27321 ) ) ( not ( = ?auto_27309 ?auto_27317 ) ) ( not ( = ?auto_27309 ?auto_27324 ) ) ( not ( = ?auto_27309 ?auto_27313 ) ) ( not ( = ?auto_27309 ?auto_27325 ) ) ( not ( = ?auto_27305 ?auto_27314 ) ) ( not ( = ?auto_27305 ?auto_27318 ) ) ( not ( = ?auto_27305 ?auto_27320 ) ) ( not ( = ?auto_27305 ?auto_27319 ) ) ( not ( = ?auto_27305 ?auto_27327 ) ) ( not ( = ?auto_27305 ?auto_27323 ) ) ( not ( = ?auto_27305 ?auto_27315 ) ) )
    :subtasks
    ( ( MAKE-7CRATE ?auto_27296 ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ?auto_27301 ?auto_27304 ?auto_27303 )
      ( MAKE-1CRATE ?auto_27303 ?auto_27302 )
      ( MAKE-8CRATE-VERIFY ?auto_27296 ?auto_27297 ?auto_27298 ?auto_27299 ?auto_27300 ?auto_27301 ?auto_27304 ?auto_27303 ?auto_27302 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27332 - SURFACE
      ?auto_27333 - SURFACE
    )
    :vars
    (
      ?auto_27334 - HOIST
      ?auto_27335 - PLACE
      ?auto_27337 - PLACE
      ?auto_27338 - HOIST
      ?auto_27339 - SURFACE
      ?auto_27336 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27334 ?auto_27335 ) ( SURFACE-AT ?auto_27332 ?auto_27335 ) ( CLEAR ?auto_27332 ) ( IS-CRATE ?auto_27333 ) ( AVAILABLE ?auto_27334 ) ( not ( = ?auto_27337 ?auto_27335 ) ) ( HOIST-AT ?auto_27338 ?auto_27337 ) ( AVAILABLE ?auto_27338 ) ( SURFACE-AT ?auto_27333 ?auto_27337 ) ( ON ?auto_27333 ?auto_27339 ) ( CLEAR ?auto_27333 ) ( TRUCK-AT ?auto_27336 ?auto_27335 ) ( not ( = ?auto_27332 ?auto_27333 ) ) ( not ( = ?auto_27332 ?auto_27339 ) ) ( not ( = ?auto_27333 ?auto_27339 ) ) ( not ( = ?auto_27334 ?auto_27338 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27336 ?auto_27335 ?auto_27337 )
      ( !LIFT ?auto_27338 ?auto_27333 ?auto_27339 ?auto_27337 )
      ( !LOAD ?auto_27338 ?auto_27333 ?auto_27336 ?auto_27337 )
      ( !DRIVE ?auto_27336 ?auto_27337 ?auto_27335 )
      ( !UNLOAD ?auto_27334 ?auto_27333 ?auto_27336 ?auto_27335 )
      ( !DROP ?auto_27334 ?auto_27333 ?auto_27332 ?auto_27335 )
      ( MAKE-1CRATE-VERIFY ?auto_27332 ?auto_27333 ) )
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
      ?auto_27358 - SURFACE
      ?auto_27357 - SURFACE
      ?auto_27356 - SURFACE
      ?auto_27359 - SURFACE
    )
    :vars
    (
      ?auto_27364 - HOIST
      ?auto_27361 - PLACE
      ?auto_27362 - PLACE
      ?auto_27365 - HOIST
      ?auto_27363 - SURFACE
      ?auto_27369 - PLACE
      ?auto_27371 - HOIST
      ?auto_27370 - SURFACE
      ?auto_27374 - PLACE
      ?auto_27366 - HOIST
      ?auto_27372 - SURFACE
      ?auto_27381 - PLACE
      ?auto_27379 - HOIST
      ?auto_27384 - SURFACE
      ?auto_27386 - PLACE
      ?auto_27385 - HOIST
      ?auto_27380 - SURFACE
      ?auto_27378 - SURFACE
      ?auto_27376 - PLACE
      ?auto_27383 - HOIST
      ?auto_27375 - SURFACE
      ?auto_27377 - PLACE
      ?auto_27368 - HOIST
      ?auto_27382 - SURFACE
      ?auto_27367 - PLACE
      ?auto_27373 - HOIST
      ?auto_27387 - SURFACE
      ?auto_27360 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27364 ?auto_27361 ) ( IS-CRATE ?auto_27359 ) ( not ( = ?auto_27362 ?auto_27361 ) ) ( HOIST-AT ?auto_27365 ?auto_27362 ) ( AVAILABLE ?auto_27365 ) ( SURFACE-AT ?auto_27359 ?auto_27362 ) ( ON ?auto_27359 ?auto_27363 ) ( CLEAR ?auto_27359 ) ( not ( = ?auto_27356 ?auto_27359 ) ) ( not ( = ?auto_27356 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27363 ) ) ( not ( = ?auto_27364 ?auto_27365 ) ) ( IS-CRATE ?auto_27356 ) ( not ( = ?auto_27369 ?auto_27361 ) ) ( HOIST-AT ?auto_27371 ?auto_27369 ) ( AVAILABLE ?auto_27371 ) ( SURFACE-AT ?auto_27356 ?auto_27369 ) ( ON ?auto_27356 ?auto_27370 ) ( CLEAR ?auto_27356 ) ( not ( = ?auto_27357 ?auto_27356 ) ) ( not ( = ?auto_27357 ?auto_27370 ) ) ( not ( = ?auto_27356 ?auto_27370 ) ) ( not ( = ?auto_27364 ?auto_27371 ) ) ( IS-CRATE ?auto_27357 ) ( not ( = ?auto_27374 ?auto_27361 ) ) ( HOIST-AT ?auto_27366 ?auto_27374 ) ( AVAILABLE ?auto_27366 ) ( SURFACE-AT ?auto_27357 ?auto_27374 ) ( ON ?auto_27357 ?auto_27372 ) ( CLEAR ?auto_27357 ) ( not ( = ?auto_27358 ?auto_27357 ) ) ( not ( = ?auto_27358 ?auto_27372 ) ) ( not ( = ?auto_27357 ?auto_27372 ) ) ( not ( = ?auto_27364 ?auto_27366 ) ) ( IS-CRATE ?auto_27358 ) ( not ( = ?auto_27381 ?auto_27361 ) ) ( HOIST-AT ?auto_27379 ?auto_27381 ) ( AVAILABLE ?auto_27379 ) ( SURFACE-AT ?auto_27358 ?auto_27381 ) ( ON ?auto_27358 ?auto_27384 ) ( CLEAR ?auto_27358 ) ( not ( = ?auto_27355 ?auto_27358 ) ) ( not ( = ?auto_27355 ?auto_27384 ) ) ( not ( = ?auto_27358 ?auto_27384 ) ) ( not ( = ?auto_27364 ?auto_27379 ) ) ( IS-CRATE ?auto_27355 ) ( not ( = ?auto_27386 ?auto_27361 ) ) ( HOIST-AT ?auto_27385 ?auto_27386 ) ( SURFACE-AT ?auto_27355 ?auto_27386 ) ( ON ?auto_27355 ?auto_27380 ) ( CLEAR ?auto_27355 ) ( not ( = ?auto_27354 ?auto_27355 ) ) ( not ( = ?auto_27354 ?auto_27380 ) ) ( not ( = ?auto_27355 ?auto_27380 ) ) ( not ( = ?auto_27364 ?auto_27385 ) ) ( IS-CRATE ?auto_27354 ) ( AVAILABLE ?auto_27385 ) ( SURFACE-AT ?auto_27354 ?auto_27386 ) ( ON ?auto_27354 ?auto_27378 ) ( CLEAR ?auto_27354 ) ( not ( = ?auto_27353 ?auto_27354 ) ) ( not ( = ?auto_27353 ?auto_27378 ) ) ( not ( = ?auto_27354 ?auto_27378 ) ) ( IS-CRATE ?auto_27353 ) ( not ( = ?auto_27376 ?auto_27361 ) ) ( HOIST-AT ?auto_27383 ?auto_27376 ) ( AVAILABLE ?auto_27383 ) ( SURFACE-AT ?auto_27353 ?auto_27376 ) ( ON ?auto_27353 ?auto_27375 ) ( CLEAR ?auto_27353 ) ( not ( = ?auto_27352 ?auto_27353 ) ) ( not ( = ?auto_27352 ?auto_27375 ) ) ( not ( = ?auto_27353 ?auto_27375 ) ) ( not ( = ?auto_27364 ?auto_27383 ) ) ( IS-CRATE ?auto_27352 ) ( not ( = ?auto_27377 ?auto_27361 ) ) ( HOIST-AT ?auto_27368 ?auto_27377 ) ( AVAILABLE ?auto_27368 ) ( SURFACE-AT ?auto_27352 ?auto_27377 ) ( ON ?auto_27352 ?auto_27382 ) ( CLEAR ?auto_27352 ) ( not ( = ?auto_27351 ?auto_27352 ) ) ( not ( = ?auto_27351 ?auto_27382 ) ) ( not ( = ?auto_27352 ?auto_27382 ) ) ( not ( = ?auto_27364 ?auto_27368 ) ) ( SURFACE-AT ?auto_27350 ?auto_27361 ) ( CLEAR ?auto_27350 ) ( IS-CRATE ?auto_27351 ) ( AVAILABLE ?auto_27364 ) ( not ( = ?auto_27367 ?auto_27361 ) ) ( HOIST-AT ?auto_27373 ?auto_27367 ) ( AVAILABLE ?auto_27373 ) ( SURFACE-AT ?auto_27351 ?auto_27367 ) ( ON ?auto_27351 ?auto_27387 ) ( CLEAR ?auto_27351 ) ( TRUCK-AT ?auto_27360 ?auto_27361 ) ( not ( = ?auto_27350 ?auto_27351 ) ) ( not ( = ?auto_27350 ?auto_27387 ) ) ( not ( = ?auto_27351 ?auto_27387 ) ) ( not ( = ?auto_27364 ?auto_27373 ) ) ( not ( = ?auto_27350 ?auto_27352 ) ) ( not ( = ?auto_27350 ?auto_27382 ) ) ( not ( = ?auto_27352 ?auto_27387 ) ) ( not ( = ?auto_27377 ?auto_27367 ) ) ( not ( = ?auto_27368 ?auto_27373 ) ) ( not ( = ?auto_27382 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27353 ) ) ( not ( = ?auto_27350 ?auto_27375 ) ) ( not ( = ?auto_27351 ?auto_27353 ) ) ( not ( = ?auto_27351 ?auto_27375 ) ) ( not ( = ?auto_27353 ?auto_27382 ) ) ( not ( = ?auto_27353 ?auto_27387 ) ) ( not ( = ?auto_27376 ?auto_27377 ) ) ( not ( = ?auto_27376 ?auto_27367 ) ) ( not ( = ?auto_27383 ?auto_27368 ) ) ( not ( = ?auto_27383 ?auto_27373 ) ) ( not ( = ?auto_27375 ?auto_27382 ) ) ( not ( = ?auto_27375 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27354 ) ) ( not ( = ?auto_27350 ?auto_27378 ) ) ( not ( = ?auto_27351 ?auto_27354 ) ) ( not ( = ?auto_27351 ?auto_27378 ) ) ( not ( = ?auto_27352 ?auto_27354 ) ) ( not ( = ?auto_27352 ?auto_27378 ) ) ( not ( = ?auto_27354 ?auto_27375 ) ) ( not ( = ?auto_27354 ?auto_27382 ) ) ( not ( = ?auto_27354 ?auto_27387 ) ) ( not ( = ?auto_27386 ?auto_27376 ) ) ( not ( = ?auto_27386 ?auto_27377 ) ) ( not ( = ?auto_27386 ?auto_27367 ) ) ( not ( = ?auto_27385 ?auto_27383 ) ) ( not ( = ?auto_27385 ?auto_27368 ) ) ( not ( = ?auto_27385 ?auto_27373 ) ) ( not ( = ?auto_27378 ?auto_27375 ) ) ( not ( = ?auto_27378 ?auto_27382 ) ) ( not ( = ?auto_27378 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27355 ) ) ( not ( = ?auto_27350 ?auto_27380 ) ) ( not ( = ?auto_27351 ?auto_27355 ) ) ( not ( = ?auto_27351 ?auto_27380 ) ) ( not ( = ?auto_27352 ?auto_27355 ) ) ( not ( = ?auto_27352 ?auto_27380 ) ) ( not ( = ?auto_27353 ?auto_27355 ) ) ( not ( = ?auto_27353 ?auto_27380 ) ) ( not ( = ?auto_27355 ?auto_27378 ) ) ( not ( = ?auto_27355 ?auto_27375 ) ) ( not ( = ?auto_27355 ?auto_27382 ) ) ( not ( = ?auto_27355 ?auto_27387 ) ) ( not ( = ?auto_27380 ?auto_27378 ) ) ( not ( = ?auto_27380 ?auto_27375 ) ) ( not ( = ?auto_27380 ?auto_27382 ) ) ( not ( = ?auto_27380 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27358 ) ) ( not ( = ?auto_27350 ?auto_27384 ) ) ( not ( = ?auto_27351 ?auto_27358 ) ) ( not ( = ?auto_27351 ?auto_27384 ) ) ( not ( = ?auto_27352 ?auto_27358 ) ) ( not ( = ?auto_27352 ?auto_27384 ) ) ( not ( = ?auto_27353 ?auto_27358 ) ) ( not ( = ?auto_27353 ?auto_27384 ) ) ( not ( = ?auto_27354 ?auto_27358 ) ) ( not ( = ?auto_27354 ?auto_27384 ) ) ( not ( = ?auto_27358 ?auto_27380 ) ) ( not ( = ?auto_27358 ?auto_27378 ) ) ( not ( = ?auto_27358 ?auto_27375 ) ) ( not ( = ?auto_27358 ?auto_27382 ) ) ( not ( = ?auto_27358 ?auto_27387 ) ) ( not ( = ?auto_27381 ?auto_27386 ) ) ( not ( = ?auto_27381 ?auto_27376 ) ) ( not ( = ?auto_27381 ?auto_27377 ) ) ( not ( = ?auto_27381 ?auto_27367 ) ) ( not ( = ?auto_27379 ?auto_27385 ) ) ( not ( = ?auto_27379 ?auto_27383 ) ) ( not ( = ?auto_27379 ?auto_27368 ) ) ( not ( = ?auto_27379 ?auto_27373 ) ) ( not ( = ?auto_27384 ?auto_27380 ) ) ( not ( = ?auto_27384 ?auto_27378 ) ) ( not ( = ?auto_27384 ?auto_27375 ) ) ( not ( = ?auto_27384 ?auto_27382 ) ) ( not ( = ?auto_27384 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27357 ) ) ( not ( = ?auto_27350 ?auto_27372 ) ) ( not ( = ?auto_27351 ?auto_27357 ) ) ( not ( = ?auto_27351 ?auto_27372 ) ) ( not ( = ?auto_27352 ?auto_27357 ) ) ( not ( = ?auto_27352 ?auto_27372 ) ) ( not ( = ?auto_27353 ?auto_27357 ) ) ( not ( = ?auto_27353 ?auto_27372 ) ) ( not ( = ?auto_27354 ?auto_27357 ) ) ( not ( = ?auto_27354 ?auto_27372 ) ) ( not ( = ?auto_27355 ?auto_27357 ) ) ( not ( = ?auto_27355 ?auto_27372 ) ) ( not ( = ?auto_27357 ?auto_27384 ) ) ( not ( = ?auto_27357 ?auto_27380 ) ) ( not ( = ?auto_27357 ?auto_27378 ) ) ( not ( = ?auto_27357 ?auto_27375 ) ) ( not ( = ?auto_27357 ?auto_27382 ) ) ( not ( = ?auto_27357 ?auto_27387 ) ) ( not ( = ?auto_27374 ?auto_27381 ) ) ( not ( = ?auto_27374 ?auto_27386 ) ) ( not ( = ?auto_27374 ?auto_27376 ) ) ( not ( = ?auto_27374 ?auto_27377 ) ) ( not ( = ?auto_27374 ?auto_27367 ) ) ( not ( = ?auto_27366 ?auto_27379 ) ) ( not ( = ?auto_27366 ?auto_27385 ) ) ( not ( = ?auto_27366 ?auto_27383 ) ) ( not ( = ?auto_27366 ?auto_27368 ) ) ( not ( = ?auto_27366 ?auto_27373 ) ) ( not ( = ?auto_27372 ?auto_27384 ) ) ( not ( = ?auto_27372 ?auto_27380 ) ) ( not ( = ?auto_27372 ?auto_27378 ) ) ( not ( = ?auto_27372 ?auto_27375 ) ) ( not ( = ?auto_27372 ?auto_27382 ) ) ( not ( = ?auto_27372 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27356 ) ) ( not ( = ?auto_27350 ?auto_27370 ) ) ( not ( = ?auto_27351 ?auto_27356 ) ) ( not ( = ?auto_27351 ?auto_27370 ) ) ( not ( = ?auto_27352 ?auto_27356 ) ) ( not ( = ?auto_27352 ?auto_27370 ) ) ( not ( = ?auto_27353 ?auto_27356 ) ) ( not ( = ?auto_27353 ?auto_27370 ) ) ( not ( = ?auto_27354 ?auto_27356 ) ) ( not ( = ?auto_27354 ?auto_27370 ) ) ( not ( = ?auto_27355 ?auto_27356 ) ) ( not ( = ?auto_27355 ?auto_27370 ) ) ( not ( = ?auto_27358 ?auto_27356 ) ) ( not ( = ?auto_27358 ?auto_27370 ) ) ( not ( = ?auto_27356 ?auto_27372 ) ) ( not ( = ?auto_27356 ?auto_27384 ) ) ( not ( = ?auto_27356 ?auto_27380 ) ) ( not ( = ?auto_27356 ?auto_27378 ) ) ( not ( = ?auto_27356 ?auto_27375 ) ) ( not ( = ?auto_27356 ?auto_27382 ) ) ( not ( = ?auto_27356 ?auto_27387 ) ) ( not ( = ?auto_27369 ?auto_27374 ) ) ( not ( = ?auto_27369 ?auto_27381 ) ) ( not ( = ?auto_27369 ?auto_27386 ) ) ( not ( = ?auto_27369 ?auto_27376 ) ) ( not ( = ?auto_27369 ?auto_27377 ) ) ( not ( = ?auto_27369 ?auto_27367 ) ) ( not ( = ?auto_27371 ?auto_27366 ) ) ( not ( = ?auto_27371 ?auto_27379 ) ) ( not ( = ?auto_27371 ?auto_27385 ) ) ( not ( = ?auto_27371 ?auto_27383 ) ) ( not ( = ?auto_27371 ?auto_27368 ) ) ( not ( = ?auto_27371 ?auto_27373 ) ) ( not ( = ?auto_27370 ?auto_27372 ) ) ( not ( = ?auto_27370 ?auto_27384 ) ) ( not ( = ?auto_27370 ?auto_27380 ) ) ( not ( = ?auto_27370 ?auto_27378 ) ) ( not ( = ?auto_27370 ?auto_27375 ) ) ( not ( = ?auto_27370 ?auto_27382 ) ) ( not ( = ?auto_27370 ?auto_27387 ) ) ( not ( = ?auto_27350 ?auto_27359 ) ) ( not ( = ?auto_27350 ?auto_27363 ) ) ( not ( = ?auto_27351 ?auto_27359 ) ) ( not ( = ?auto_27351 ?auto_27363 ) ) ( not ( = ?auto_27352 ?auto_27359 ) ) ( not ( = ?auto_27352 ?auto_27363 ) ) ( not ( = ?auto_27353 ?auto_27359 ) ) ( not ( = ?auto_27353 ?auto_27363 ) ) ( not ( = ?auto_27354 ?auto_27359 ) ) ( not ( = ?auto_27354 ?auto_27363 ) ) ( not ( = ?auto_27355 ?auto_27359 ) ) ( not ( = ?auto_27355 ?auto_27363 ) ) ( not ( = ?auto_27358 ?auto_27359 ) ) ( not ( = ?auto_27358 ?auto_27363 ) ) ( not ( = ?auto_27357 ?auto_27359 ) ) ( not ( = ?auto_27357 ?auto_27363 ) ) ( not ( = ?auto_27359 ?auto_27370 ) ) ( not ( = ?auto_27359 ?auto_27372 ) ) ( not ( = ?auto_27359 ?auto_27384 ) ) ( not ( = ?auto_27359 ?auto_27380 ) ) ( not ( = ?auto_27359 ?auto_27378 ) ) ( not ( = ?auto_27359 ?auto_27375 ) ) ( not ( = ?auto_27359 ?auto_27382 ) ) ( not ( = ?auto_27359 ?auto_27387 ) ) ( not ( = ?auto_27362 ?auto_27369 ) ) ( not ( = ?auto_27362 ?auto_27374 ) ) ( not ( = ?auto_27362 ?auto_27381 ) ) ( not ( = ?auto_27362 ?auto_27386 ) ) ( not ( = ?auto_27362 ?auto_27376 ) ) ( not ( = ?auto_27362 ?auto_27377 ) ) ( not ( = ?auto_27362 ?auto_27367 ) ) ( not ( = ?auto_27365 ?auto_27371 ) ) ( not ( = ?auto_27365 ?auto_27366 ) ) ( not ( = ?auto_27365 ?auto_27379 ) ) ( not ( = ?auto_27365 ?auto_27385 ) ) ( not ( = ?auto_27365 ?auto_27383 ) ) ( not ( = ?auto_27365 ?auto_27368 ) ) ( not ( = ?auto_27365 ?auto_27373 ) ) ( not ( = ?auto_27363 ?auto_27370 ) ) ( not ( = ?auto_27363 ?auto_27372 ) ) ( not ( = ?auto_27363 ?auto_27384 ) ) ( not ( = ?auto_27363 ?auto_27380 ) ) ( not ( = ?auto_27363 ?auto_27378 ) ) ( not ( = ?auto_27363 ?auto_27375 ) ) ( not ( = ?auto_27363 ?auto_27382 ) ) ( not ( = ?auto_27363 ?auto_27387 ) ) )
    :subtasks
    ( ( MAKE-8CRATE ?auto_27350 ?auto_27351 ?auto_27352 ?auto_27353 ?auto_27354 ?auto_27355 ?auto_27358 ?auto_27357 ?auto_27356 )
      ( MAKE-1CRATE ?auto_27356 ?auto_27359 )
      ( MAKE-9CRATE-VERIFY ?auto_27350 ?auto_27351 ?auto_27352 ?auto_27353 ?auto_27354 ?auto_27355 ?auto_27358 ?auto_27357 ?auto_27356 ?auto_27359 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27390 - SURFACE
      ?auto_27391 - SURFACE
    )
    :vars
    (
      ?auto_27392 - HOIST
      ?auto_27393 - PLACE
      ?auto_27395 - PLACE
      ?auto_27396 - HOIST
      ?auto_27397 - SURFACE
      ?auto_27394 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27392 ?auto_27393 ) ( SURFACE-AT ?auto_27390 ?auto_27393 ) ( CLEAR ?auto_27390 ) ( IS-CRATE ?auto_27391 ) ( AVAILABLE ?auto_27392 ) ( not ( = ?auto_27395 ?auto_27393 ) ) ( HOIST-AT ?auto_27396 ?auto_27395 ) ( AVAILABLE ?auto_27396 ) ( SURFACE-AT ?auto_27391 ?auto_27395 ) ( ON ?auto_27391 ?auto_27397 ) ( CLEAR ?auto_27391 ) ( TRUCK-AT ?auto_27394 ?auto_27393 ) ( not ( = ?auto_27390 ?auto_27391 ) ) ( not ( = ?auto_27390 ?auto_27397 ) ) ( not ( = ?auto_27391 ?auto_27397 ) ) ( not ( = ?auto_27392 ?auto_27396 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27394 ?auto_27393 ?auto_27395 )
      ( !LIFT ?auto_27396 ?auto_27391 ?auto_27397 ?auto_27395 )
      ( !LOAD ?auto_27396 ?auto_27391 ?auto_27394 ?auto_27395 )
      ( !DRIVE ?auto_27394 ?auto_27395 ?auto_27393 )
      ( !UNLOAD ?auto_27392 ?auto_27391 ?auto_27394 ?auto_27393 )
      ( !DROP ?auto_27392 ?auto_27391 ?auto_27390 ?auto_27393 )
      ( MAKE-1CRATE-VERIFY ?auto_27390 ?auto_27391 ) )
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
      ?auto_27417 - SURFACE
      ?auto_27416 - SURFACE
      ?auto_27415 - SURFACE
      ?auto_27418 - SURFACE
      ?auto_27419 - SURFACE
    )
    :vars
    (
      ?auto_27420 - HOIST
      ?auto_27423 - PLACE
      ?auto_27425 - PLACE
      ?auto_27422 - HOIST
      ?auto_27421 - SURFACE
      ?auto_27436 - PLACE
      ?auto_27444 - HOIST
      ?auto_27435 - SURFACE
      ?auto_27449 - PLACE
      ?auto_27430 - HOIST
      ?auto_27431 - SURFACE
      ?auto_27438 - PLACE
      ?auto_27442 - HOIST
      ?auto_27429 - SURFACE
      ?auto_27426 - PLACE
      ?auto_27427 - HOIST
      ?auto_27434 - SURFACE
      ?auto_27437 - PLACE
      ?auto_27445 - HOIST
      ?auto_27450 - SURFACE
      ?auto_27440 - SURFACE
      ?auto_27432 - PLACE
      ?auto_27448 - HOIST
      ?auto_27439 - SURFACE
      ?auto_27441 - PLACE
      ?auto_27446 - HOIST
      ?auto_27433 - SURFACE
      ?auto_27447 - PLACE
      ?auto_27428 - HOIST
      ?auto_27443 - SURFACE
      ?auto_27424 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27420 ?auto_27423 ) ( IS-CRATE ?auto_27419 ) ( not ( = ?auto_27425 ?auto_27423 ) ) ( HOIST-AT ?auto_27422 ?auto_27425 ) ( AVAILABLE ?auto_27422 ) ( SURFACE-AT ?auto_27419 ?auto_27425 ) ( ON ?auto_27419 ?auto_27421 ) ( CLEAR ?auto_27419 ) ( not ( = ?auto_27418 ?auto_27419 ) ) ( not ( = ?auto_27418 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27421 ) ) ( not ( = ?auto_27420 ?auto_27422 ) ) ( IS-CRATE ?auto_27418 ) ( not ( = ?auto_27436 ?auto_27423 ) ) ( HOIST-AT ?auto_27444 ?auto_27436 ) ( AVAILABLE ?auto_27444 ) ( SURFACE-AT ?auto_27418 ?auto_27436 ) ( ON ?auto_27418 ?auto_27435 ) ( CLEAR ?auto_27418 ) ( not ( = ?auto_27415 ?auto_27418 ) ) ( not ( = ?auto_27415 ?auto_27435 ) ) ( not ( = ?auto_27418 ?auto_27435 ) ) ( not ( = ?auto_27420 ?auto_27444 ) ) ( IS-CRATE ?auto_27415 ) ( not ( = ?auto_27449 ?auto_27423 ) ) ( HOIST-AT ?auto_27430 ?auto_27449 ) ( AVAILABLE ?auto_27430 ) ( SURFACE-AT ?auto_27415 ?auto_27449 ) ( ON ?auto_27415 ?auto_27431 ) ( CLEAR ?auto_27415 ) ( not ( = ?auto_27416 ?auto_27415 ) ) ( not ( = ?auto_27416 ?auto_27431 ) ) ( not ( = ?auto_27415 ?auto_27431 ) ) ( not ( = ?auto_27420 ?auto_27430 ) ) ( IS-CRATE ?auto_27416 ) ( not ( = ?auto_27438 ?auto_27423 ) ) ( HOIST-AT ?auto_27442 ?auto_27438 ) ( AVAILABLE ?auto_27442 ) ( SURFACE-AT ?auto_27416 ?auto_27438 ) ( ON ?auto_27416 ?auto_27429 ) ( CLEAR ?auto_27416 ) ( not ( = ?auto_27417 ?auto_27416 ) ) ( not ( = ?auto_27417 ?auto_27429 ) ) ( not ( = ?auto_27416 ?auto_27429 ) ) ( not ( = ?auto_27420 ?auto_27442 ) ) ( IS-CRATE ?auto_27417 ) ( not ( = ?auto_27426 ?auto_27423 ) ) ( HOIST-AT ?auto_27427 ?auto_27426 ) ( AVAILABLE ?auto_27427 ) ( SURFACE-AT ?auto_27417 ?auto_27426 ) ( ON ?auto_27417 ?auto_27434 ) ( CLEAR ?auto_27417 ) ( not ( = ?auto_27414 ?auto_27417 ) ) ( not ( = ?auto_27414 ?auto_27434 ) ) ( not ( = ?auto_27417 ?auto_27434 ) ) ( not ( = ?auto_27420 ?auto_27427 ) ) ( IS-CRATE ?auto_27414 ) ( not ( = ?auto_27437 ?auto_27423 ) ) ( HOIST-AT ?auto_27445 ?auto_27437 ) ( SURFACE-AT ?auto_27414 ?auto_27437 ) ( ON ?auto_27414 ?auto_27450 ) ( CLEAR ?auto_27414 ) ( not ( = ?auto_27413 ?auto_27414 ) ) ( not ( = ?auto_27413 ?auto_27450 ) ) ( not ( = ?auto_27414 ?auto_27450 ) ) ( not ( = ?auto_27420 ?auto_27445 ) ) ( IS-CRATE ?auto_27413 ) ( AVAILABLE ?auto_27445 ) ( SURFACE-AT ?auto_27413 ?auto_27437 ) ( ON ?auto_27413 ?auto_27440 ) ( CLEAR ?auto_27413 ) ( not ( = ?auto_27412 ?auto_27413 ) ) ( not ( = ?auto_27412 ?auto_27440 ) ) ( not ( = ?auto_27413 ?auto_27440 ) ) ( IS-CRATE ?auto_27412 ) ( not ( = ?auto_27432 ?auto_27423 ) ) ( HOIST-AT ?auto_27448 ?auto_27432 ) ( AVAILABLE ?auto_27448 ) ( SURFACE-AT ?auto_27412 ?auto_27432 ) ( ON ?auto_27412 ?auto_27439 ) ( CLEAR ?auto_27412 ) ( not ( = ?auto_27411 ?auto_27412 ) ) ( not ( = ?auto_27411 ?auto_27439 ) ) ( not ( = ?auto_27412 ?auto_27439 ) ) ( not ( = ?auto_27420 ?auto_27448 ) ) ( IS-CRATE ?auto_27411 ) ( not ( = ?auto_27441 ?auto_27423 ) ) ( HOIST-AT ?auto_27446 ?auto_27441 ) ( AVAILABLE ?auto_27446 ) ( SURFACE-AT ?auto_27411 ?auto_27441 ) ( ON ?auto_27411 ?auto_27433 ) ( CLEAR ?auto_27411 ) ( not ( = ?auto_27410 ?auto_27411 ) ) ( not ( = ?auto_27410 ?auto_27433 ) ) ( not ( = ?auto_27411 ?auto_27433 ) ) ( not ( = ?auto_27420 ?auto_27446 ) ) ( SURFACE-AT ?auto_27409 ?auto_27423 ) ( CLEAR ?auto_27409 ) ( IS-CRATE ?auto_27410 ) ( AVAILABLE ?auto_27420 ) ( not ( = ?auto_27447 ?auto_27423 ) ) ( HOIST-AT ?auto_27428 ?auto_27447 ) ( AVAILABLE ?auto_27428 ) ( SURFACE-AT ?auto_27410 ?auto_27447 ) ( ON ?auto_27410 ?auto_27443 ) ( CLEAR ?auto_27410 ) ( TRUCK-AT ?auto_27424 ?auto_27423 ) ( not ( = ?auto_27409 ?auto_27410 ) ) ( not ( = ?auto_27409 ?auto_27443 ) ) ( not ( = ?auto_27410 ?auto_27443 ) ) ( not ( = ?auto_27420 ?auto_27428 ) ) ( not ( = ?auto_27409 ?auto_27411 ) ) ( not ( = ?auto_27409 ?auto_27433 ) ) ( not ( = ?auto_27411 ?auto_27443 ) ) ( not ( = ?auto_27441 ?auto_27447 ) ) ( not ( = ?auto_27446 ?auto_27428 ) ) ( not ( = ?auto_27433 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27412 ) ) ( not ( = ?auto_27409 ?auto_27439 ) ) ( not ( = ?auto_27410 ?auto_27412 ) ) ( not ( = ?auto_27410 ?auto_27439 ) ) ( not ( = ?auto_27412 ?auto_27433 ) ) ( not ( = ?auto_27412 ?auto_27443 ) ) ( not ( = ?auto_27432 ?auto_27441 ) ) ( not ( = ?auto_27432 ?auto_27447 ) ) ( not ( = ?auto_27448 ?auto_27446 ) ) ( not ( = ?auto_27448 ?auto_27428 ) ) ( not ( = ?auto_27439 ?auto_27433 ) ) ( not ( = ?auto_27439 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27413 ) ) ( not ( = ?auto_27409 ?auto_27440 ) ) ( not ( = ?auto_27410 ?auto_27413 ) ) ( not ( = ?auto_27410 ?auto_27440 ) ) ( not ( = ?auto_27411 ?auto_27413 ) ) ( not ( = ?auto_27411 ?auto_27440 ) ) ( not ( = ?auto_27413 ?auto_27439 ) ) ( not ( = ?auto_27413 ?auto_27433 ) ) ( not ( = ?auto_27413 ?auto_27443 ) ) ( not ( = ?auto_27437 ?auto_27432 ) ) ( not ( = ?auto_27437 ?auto_27441 ) ) ( not ( = ?auto_27437 ?auto_27447 ) ) ( not ( = ?auto_27445 ?auto_27448 ) ) ( not ( = ?auto_27445 ?auto_27446 ) ) ( not ( = ?auto_27445 ?auto_27428 ) ) ( not ( = ?auto_27440 ?auto_27439 ) ) ( not ( = ?auto_27440 ?auto_27433 ) ) ( not ( = ?auto_27440 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27414 ) ) ( not ( = ?auto_27409 ?auto_27450 ) ) ( not ( = ?auto_27410 ?auto_27414 ) ) ( not ( = ?auto_27410 ?auto_27450 ) ) ( not ( = ?auto_27411 ?auto_27414 ) ) ( not ( = ?auto_27411 ?auto_27450 ) ) ( not ( = ?auto_27412 ?auto_27414 ) ) ( not ( = ?auto_27412 ?auto_27450 ) ) ( not ( = ?auto_27414 ?auto_27440 ) ) ( not ( = ?auto_27414 ?auto_27439 ) ) ( not ( = ?auto_27414 ?auto_27433 ) ) ( not ( = ?auto_27414 ?auto_27443 ) ) ( not ( = ?auto_27450 ?auto_27440 ) ) ( not ( = ?auto_27450 ?auto_27439 ) ) ( not ( = ?auto_27450 ?auto_27433 ) ) ( not ( = ?auto_27450 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27417 ) ) ( not ( = ?auto_27409 ?auto_27434 ) ) ( not ( = ?auto_27410 ?auto_27417 ) ) ( not ( = ?auto_27410 ?auto_27434 ) ) ( not ( = ?auto_27411 ?auto_27417 ) ) ( not ( = ?auto_27411 ?auto_27434 ) ) ( not ( = ?auto_27412 ?auto_27417 ) ) ( not ( = ?auto_27412 ?auto_27434 ) ) ( not ( = ?auto_27413 ?auto_27417 ) ) ( not ( = ?auto_27413 ?auto_27434 ) ) ( not ( = ?auto_27417 ?auto_27450 ) ) ( not ( = ?auto_27417 ?auto_27440 ) ) ( not ( = ?auto_27417 ?auto_27439 ) ) ( not ( = ?auto_27417 ?auto_27433 ) ) ( not ( = ?auto_27417 ?auto_27443 ) ) ( not ( = ?auto_27426 ?auto_27437 ) ) ( not ( = ?auto_27426 ?auto_27432 ) ) ( not ( = ?auto_27426 ?auto_27441 ) ) ( not ( = ?auto_27426 ?auto_27447 ) ) ( not ( = ?auto_27427 ?auto_27445 ) ) ( not ( = ?auto_27427 ?auto_27448 ) ) ( not ( = ?auto_27427 ?auto_27446 ) ) ( not ( = ?auto_27427 ?auto_27428 ) ) ( not ( = ?auto_27434 ?auto_27450 ) ) ( not ( = ?auto_27434 ?auto_27440 ) ) ( not ( = ?auto_27434 ?auto_27439 ) ) ( not ( = ?auto_27434 ?auto_27433 ) ) ( not ( = ?auto_27434 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27416 ) ) ( not ( = ?auto_27409 ?auto_27429 ) ) ( not ( = ?auto_27410 ?auto_27416 ) ) ( not ( = ?auto_27410 ?auto_27429 ) ) ( not ( = ?auto_27411 ?auto_27416 ) ) ( not ( = ?auto_27411 ?auto_27429 ) ) ( not ( = ?auto_27412 ?auto_27416 ) ) ( not ( = ?auto_27412 ?auto_27429 ) ) ( not ( = ?auto_27413 ?auto_27416 ) ) ( not ( = ?auto_27413 ?auto_27429 ) ) ( not ( = ?auto_27414 ?auto_27416 ) ) ( not ( = ?auto_27414 ?auto_27429 ) ) ( not ( = ?auto_27416 ?auto_27434 ) ) ( not ( = ?auto_27416 ?auto_27450 ) ) ( not ( = ?auto_27416 ?auto_27440 ) ) ( not ( = ?auto_27416 ?auto_27439 ) ) ( not ( = ?auto_27416 ?auto_27433 ) ) ( not ( = ?auto_27416 ?auto_27443 ) ) ( not ( = ?auto_27438 ?auto_27426 ) ) ( not ( = ?auto_27438 ?auto_27437 ) ) ( not ( = ?auto_27438 ?auto_27432 ) ) ( not ( = ?auto_27438 ?auto_27441 ) ) ( not ( = ?auto_27438 ?auto_27447 ) ) ( not ( = ?auto_27442 ?auto_27427 ) ) ( not ( = ?auto_27442 ?auto_27445 ) ) ( not ( = ?auto_27442 ?auto_27448 ) ) ( not ( = ?auto_27442 ?auto_27446 ) ) ( not ( = ?auto_27442 ?auto_27428 ) ) ( not ( = ?auto_27429 ?auto_27434 ) ) ( not ( = ?auto_27429 ?auto_27450 ) ) ( not ( = ?auto_27429 ?auto_27440 ) ) ( not ( = ?auto_27429 ?auto_27439 ) ) ( not ( = ?auto_27429 ?auto_27433 ) ) ( not ( = ?auto_27429 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27415 ) ) ( not ( = ?auto_27409 ?auto_27431 ) ) ( not ( = ?auto_27410 ?auto_27415 ) ) ( not ( = ?auto_27410 ?auto_27431 ) ) ( not ( = ?auto_27411 ?auto_27415 ) ) ( not ( = ?auto_27411 ?auto_27431 ) ) ( not ( = ?auto_27412 ?auto_27415 ) ) ( not ( = ?auto_27412 ?auto_27431 ) ) ( not ( = ?auto_27413 ?auto_27415 ) ) ( not ( = ?auto_27413 ?auto_27431 ) ) ( not ( = ?auto_27414 ?auto_27415 ) ) ( not ( = ?auto_27414 ?auto_27431 ) ) ( not ( = ?auto_27417 ?auto_27415 ) ) ( not ( = ?auto_27417 ?auto_27431 ) ) ( not ( = ?auto_27415 ?auto_27429 ) ) ( not ( = ?auto_27415 ?auto_27434 ) ) ( not ( = ?auto_27415 ?auto_27450 ) ) ( not ( = ?auto_27415 ?auto_27440 ) ) ( not ( = ?auto_27415 ?auto_27439 ) ) ( not ( = ?auto_27415 ?auto_27433 ) ) ( not ( = ?auto_27415 ?auto_27443 ) ) ( not ( = ?auto_27449 ?auto_27438 ) ) ( not ( = ?auto_27449 ?auto_27426 ) ) ( not ( = ?auto_27449 ?auto_27437 ) ) ( not ( = ?auto_27449 ?auto_27432 ) ) ( not ( = ?auto_27449 ?auto_27441 ) ) ( not ( = ?auto_27449 ?auto_27447 ) ) ( not ( = ?auto_27430 ?auto_27442 ) ) ( not ( = ?auto_27430 ?auto_27427 ) ) ( not ( = ?auto_27430 ?auto_27445 ) ) ( not ( = ?auto_27430 ?auto_27448 ) ) ( not ( = ?auto_27430 ?auto_27446 ) ) ( not ( = ?auto_27430 ?auto_27428 ) ) ( not ( = ?auto_27431 ?auto_27429 ) ) ( not ( = ?auto_27431 ?auto_27434 ) ) ( not ( = ?auto_27431 ?auto_27450 ) ) ( not ( = ?auto_27431 ?auto_27440 ) ) ( not ( = ?auto_27431 ?auto_27439 ) ) ( not ( = ?auto_27431 ?auto_27433 ) ) ( not ( = ?auto_27431 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27418 ) ) ( not ( = ?auto_27409 ?auto_27435 ) ) ( not ( = ?auto_27410 ?auto_27418 ) ) ( not ( = ?auto_27410 ?auto_27435 ) ) ( not ( = ?auto_27411 ?auto_27418 ) ) ( not ( = ?auto_27411 ?auto_27435 ) ) ( not ( = ?auto_27412 ?auto_27418 ) ) ( not ( = ?auto_27412 ?auto_27435 ) ) ( not ( = ?auto_27413 ?auto_27418 ) ) ( not ( = ?auto_27413 ?auto_27435 ) ) ( not ( = ?auto_27414 ?auto_27418 ) ) ( not ( = ?auto_27414 ?auto_27435 ) ) ( not ( = ?auto_27417 ?auto_27418 ) ) ( not ( = ?auto_27417 ?auto_27435 ) ) ( not ( = ?auto_27416 ?auto_27418 ) ) ( not ( = ?auto_27416 ?auto_27435 ) ) ( not ( = ?auto_27418 ?auto_27431 ) ) ( not ( = ?auto_27418 ?auto_27429 ) ) ( not ( = ?auto_27418 ?auto_27434 ) ) ( not ( = ?auto_27418 ?auto_27450 ) ) ( not ( = ?auto_27418 ?auto_27440 ) ) ( not ( = ?auto_27418 ?auto_27439 ) ) ( not ( = ?auto_27418 ?auto_27433 ) ) ( not ( = ?auto_27418 ?auto_27443 ) ) ( not ( = ?auto_27436 ?auto_27449 ) ) ( not ( = ?auto_27436 ?auto_27438 ) ) ( not ( = ?auto_27436 ?auto_27426 ) ) ( not ( = ?auto_27436 ?auto_27437 ) ) ( not ( = ?auto_27436 ?auto_27432 ) ) ( not ( = ?auto_27436 ?auto_27441 ) ) ( not ( = ?auto_27436 ?auto_27447 ) ) ( not ( = ?auto_27444 ?auto_27430 ) ) ( not ( = ?auto_27444 ?auto_27442 ) ) ( not ( = ?auto_27444 ?auto_27427 ) ) ( not ( = ?auto_27444 ?auto_27445 ) ) ( not ( = ?auto_27444 ?auto_27448 ) ) ( not ( = ?auto_27444 ?auto_27446 ) ) ( not ( = ?auto_27444 ?auto_27428 ) ) ( not ( = ?auto_27435 ?auto_27431 ) ) ( not ( = ?auto_27435 ?auto_27429 ) ) ( not ( = ?auto_27435 ?auto_27434 ) ) ( not ( = ?auto_27435 ?auto_27450 ) ) ( not ( = ?auto_27435 ?auto_27440 ) ) ( not ( = ?auto_27435 ?auto_27439 ) ) ( not ( = ?auto_27435 ?auto_27433 ) ) ( not ( = ?auto_27435 ?auto_27443 ) ) ( not ( = ?auto_27409 ?auto_27419 ) ) ( not ( = ?auto_27409 ?auto_27421 ) ) ( not ( = ?auto_27410 ?auto_27419 ) ) ( not ( = ?auto_27410 ?auto_27421 ) ) ( not ( = ?auto_27411 ?auto_27419 ) ) ( not ( = ?auto_27411 ?auto_27421 ) ) ( not ( = ?auto_27412 ?auto_27419 ) ) ( not ( = ?auto_27412 ?auto_27421 ) ) ( not ( = ?auto_27413 ?auto_27419 ) ) ( not ( = ?auto_27413 ?auto_27421 ) ) ( not ( = ?auto_27414 ?auto_27419 ) ) ( not ( = ?auto_27414 ?auto_27421 ) ) ( not ( = ?auto_27417 ?auto_27419 ) ) ( not ( = ?auto_27417 ?auto_27421 ) ) ( not ( = ?auto_27416 ?auto_27419 ) ) ( not ( = ?auto_27416 ?auto_27421 ) ) ( not ( = ?auto_27415 ?auto_27419 ) ) ( not ( = ?auto_27415 ?auto_27421 ) ) ( not ( = ?auto_27419 ?auto_27435 ) ) ( not ( = ?auto_27419 ?auto_27431 ) ) ( not ( = ?auto_27419 ?auto_27429 ) ) ( not ( = ?auto_27419 ?auto_27434 ) ) ( not ( = ?auto_27419 ?auto_27450 ) ) ( not ( = ?auto_27419 ?auto_27440 ) ) ( not ( = ?auto_27419 ?auto_27439 ) ) ( not ( = ?auto_27419 ?auto_27433 ) ) ( not ( = ?auto_27419 ?auto_27443 ) ) ( not ( = ?auto_27425 ?auto_27436 ) ) ( not ( = ?auto_27425 ?auto_27449 ) ) ( not ( = ?auto_27425 ?auto_27438 ) ) ( not ( = ?auto_27425 ?auto_27426 ) ) ( not ( = ?auto_27425 ?auto_27437 ) ) ( not ( = ?auto_27425 ?auto_27432 ) ) ( not ( = ?auto_27425 ?auto_27441 ) ) ( not ( = ?auto_27425 ?auto_27447 ) ) ( not ( = ?auto_27422 ?auto_27444 ) ) ( not ( = ?auto_27422 ?auto_27430 ) ) ( not ( = ?auto_27422 ?auto_27442 ) ) ( not ( = ?auto_27422 ?auto_27427 ) ) ( not ( = ?auto_27422 ?auto_27445 ) ) ( not ( = ?auto_27422 ?auto_27448 ) ) ( not ( = ?auto_27422 ?auto_27446 ) ) ( not ( = ?auto_27422 ?auto_27428 ) ) ( not ( = ?auto_27421 ?auto_27435 ) ) ( not ( = ?auto_27421 ?auto_27431 ) ) ( not ( = ?auto_27421 ?auto_27429 ) ) ( not ( = ?auto_27421 ?auto_27434 ) ) ( not ( = ?auto_27421 ?auto_27450 ) ) ( not ( = ?auto_27421 ?auto_27440 ) ) ( not ( = ?auto_27421 ?auto_27439 ) ) ( not ( = ?auto_27421 ?auto_27433 ) ) ( not ( = ?auto_27421 ?auto_27443 ) ) )
    :subtasks
    ( ( MAKE-9CRATE ?auto_27409 ?auto_27410 ?auto_27411 ?auto_27412 ?auto_27413 ?auto_27414 ?auto_27417 ?auto_27416 ?auto_27415 ?auto_27418 )
      ( MAKE-1CRATE ?auto_27418 ?auto_27419 )
      ( MAKE-10CRATE-VERIFY ?auto_27409 ?auto_27410 ?auto_27411 ?auto_27412 ?auto_27413 ?auto_27414 ?auto_27417 ?auto_27416 ?auto_27415 ?auto_27418 ?auto_27419 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27453 - SURFACE
      ?auto_27454 - SURFACE
    )
    :vars
    (
      ?auto_27455 - HOIST
      ?auto_27456 - PLACE
      ?auto_27458 - PLACE
      ?auto_27459 - HOIST
      ?auto_27460 - SURFACE
      ?auto_27457 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27455 ?auto_27456 ) ( SURFACE-AT ?auto_27453 ?auto_27456 ) ( CLEAR ?auto_27453 ) ( IS-CRATE ?auto_27454 ) ( AVAILABLE ?auto_27455 ) ( not ( = ?auto_27458 ?auto_27456 ) ) ( HOIST-AT ?auto_27459 ?auto_27458 ) ( AVAILABLE ?auto_27459 ) ( SURFACE-AT ?auto_27454 ?auto_27458 ) ( ON ?auto_27454 ?auto_27460 ) ( CLEAR ?auto_27454 ) ( TRUCK-AT ?auto_27457 ?auto_27456 ) ( not ( = ?auto_27453 ?auto_27454 ) ) ( not ( = ?auto_27453 ?auto_27460 ) ) ( not ( = ?auto_27454 ?auto_27460 ) ) ( not ( = ?auto_27455 ?auto_27459 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27457 ?auto_27456 ?auto_27458 )
      ( !LIFT ?auto_27459 ?auto_27454 ?auto_27460 ?auto_27458 )
      ( !LOAD ?auto_27459 ?auto_27454 ?auto_27457 ?auto_27458 )
      ( !DRIVE ?auto_27457 ?auto_27458 ?auto_27456 )
      ( !UNLOAD ?auto_27455 ?auto_27454 ?auto_27457 ?auto_27456 )
      ( !DROP ?auto_27455 ?auto_27454 ?auto_27453 ?auto_27456 )
      ( MAKE-1CRATE-VERIFY ?auto_27453 ?auto_27454 ) )
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
      ?auto_27481 - SURFACE
      ?auto_27480 - SURFACE
      ?auto_27479 - SURFACE
      ?auto_27482 - SURFACE
      ?auto_27484 - SURFACE
      ?auto_27483 - SURFACE
    )
    :vars
    (
      ?auto_27488 - HOIST
      ?auto_27487 - PLACE
      ?auto_27486 - PLACE
      ?auto_27490 - HOIST
      ?auto_27489 - SURFACE
      ?auto_27505 - PLACE
      ?auto_27507 - HOIST
      ?auto_27508 - SURFACE
      ?auto_27513 - PLACE
      ?auto_27504 - HOIST
      ?auto_27509 - SURFACE
      ?auto_27500 - PLACE
      ?auto_27510 - HOIST
      ?auto_27498 - SURFACE
      ?auto_27514 - PLACE
      ?auto_27503 - HOIST
      ?auto_27501 - SURFACE
      ?auto_27494 - PLACE
      ?auto_27511 - HOIST
      ?auto_27516 - SURFACE
      ?auto_27496 - PLACE
      ?auto_27491 - HOIST
      ?auto_27506 - SURFACE
      ?auto_27493 - SURFACE
      ?auto_27512 - PLACE
      ?auto_27497 - HOIST
      ?auto_27499 - SURFACE
      ?auto_27515 - SURFACE
      ?auto_27492 - PLACE
      ?auto_27502 - HOIST
      ?auto_27495 - SURFACE
      ?auto_27485 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27488 ?auto_27487 ) ( IS-CRATE ?auto_27483 ) ( not ( = ?auto_27486 ?auto_27487 ) ) ( HOIST-AT ?auto_27490 ?auto_27486 ) ( SURFACE-AT ?auto_27483 ?auto_27486 ) ( ON ?auto_27483 ?auto_27489 ) ( CLEAR ?auto_27483 ) ( not ( = ?auto_27484 ?auto_27483 ) ) ( not ( = ?auto_27484 ?auto_27489 ) ) ( not ( = ?auto_27483 ?auto_27489 ) ) ( not ( = ?auto_27488 ?auto_27490 ) ) ( IS-CRATE ?auto_27484 ) ( not ( = ?auto_27505 ?auto_27487 ) ) ( HOIST-AT ?auto_27507 ?auto_27505 ) ( AVAILABLE ?auto_27507 ) ( SURFACE-AT ?auto_27484 ?auto_27505 ) ( ON ?auto_27484 ?auto_27508 ) ( CLEAR ?auto_27484 ) ( not ( = ?auto_27482 ?auto_27484 ) ) ( not ( = ?auto_27482 ?auto_27508 ) ) ( not ( = ?auto_27484 ?auto_27508 ) ) ( not ( = ?auto_27488 ?auto_27507 ) ) ( IS-CRATE ?auto_27482 ) ( not ( = ?auto_27513 ?auto_27487 ) ) ( HOIST-AT ?auto_27504 ?auto_27513 ) ( AVAILABLE ?auto_27504 ) ( SURFACE-AT ?auto_27482 ?auto_27513 ) ( ON ?auto_27482 ?auto_27509 ) ( CLEAR ?auto_27482 ) ( not ( = ?auto_27479 ?auto_27482 ) ) ( not ( = ?auto_27479 ?auto_27509 ) ) ( not ( = ?auto_27482 ?auto_27509 ) ) ( not ( = ?auto_27488 ?auto_27504 ) ) ( IS-CRATE ?auto_27479 ) ( not ( = ?auto_27500 ?auto_27487 ) ) ( HOIST-AT ?auto_27510 ?auto_27500 ) ( AVAILABLE ?auto_27510 ) ( SURFACE-AT ?auto_27479 ?auto_27500 ) ( ON ?auto_27479 ?auto_27498 ) ( CLEAR ?auto_27479 ) ( not ( = ?auto_27480 ?auto_27479 ) ) ( not ( = ?auto_27480 ?auto_27498 ) ) ( not ( = ?auto_27479 ?auto_27498 ) ) ( not ( = ?auto_27488 ?auto_27510 ) ) ( IS-CRATE ?auto_27480 ) ( not ( = ?auto_27514 ?auto_27487 ) ) ( HOIST-AT ?auto_27503 ?auto_27514 ) ( AVAILABLE ?auto_27503 ) ( SURFACE-AT ?auto_27480 ?auto_27514 ) ( ON ?auto_27480 ?auto_27501 ) ( CLEAR ?auto_27480 ) ( not ( = ?auto_27481 ?auto_27480 ) ) ( not ( = ?auto_27481 ?auto_27501 ) ) ( not ( = ?auto_27480 ?auto_27501 ) ) ( not ( = ?auto_27488 ?auto_27503 ) ) ( IS-CRATE ?auto_27481 ) ( not ( = ?auto_27494 ?auto_27487 ) ) ( HOIST-AT ?auto_27511 ?auto_27494 ) ( AVAILABLE ?auto_27511 ) ( SURFACE-AT ?auto_27481 ?auto_27494 ) ( ON ?auto_27481 ?auto_27516 ) ( CLEAR ?auto_27481 ) ( not ( = ?auto_27478 ?auto_27481 ) ) ( not ( = ?auto_27478 ?auto_27516 ) ) ( not ( = ?auto_27481 ?auto_27516 ) ) ( not ( = ?auto_27488 ?auto_27511 ) ) ( IS-CRATE ?auto_27478 ) ( not ( = ?auto_27496 ?auto_27487 ) ) ( HOIST-AT ?auto_27491 ?auto_27496 ) ( SURFACE-AT ?auto_27478 ?auto_27496 ) ( ON ?auto_27478 ?auto_27506 ) ( CLEAR ?auto_27478 ) ( not ( = ?auto_27477 ?auto_27478 ) ) ( not ( = ?auto_27477 ?auto_27506 ) ) ( not ( = ?auto_27478 ?auto_27506 ) ) ( not ( = ?auto_27488 ?auto_27491 ) ) ( IS-CRATE ?auto_27477 ) ( AVAILABLE ?auto_27491 ) ( SURFACE-AT ?auto_27477 ?auto_27496 ) ( ON ?auto_27477 ?auto_27493 ) ( CLEAR ?auto_27477 ) ( not ( = ?auto_27476 ?auto_27477 ) ) ( not ( = ?auto_27476 ?auto_27493 ) ) ( not ( = ?auto_27477 ?auto_27493 ) ) ( IS-CRATE ?auto_27476 ) ( not ( = ?auto_27512 ?auto_27487 ) ) ( HOIST-AT ?auto_27497 ?auto_27512 ) ( AVAILABLE ?auto_27497 ) ( SURFACE-AT ?auto_27476 ?auto_27512 ) ( ON ?auto_27476 ?auto_27499 ) ( CLEAR ?auto_27476 ) ( not ( = ?auto_27475 ?auto_27476 ) ) ( not ( = ?auto_27475 ?auto_27499 ) ) ( not ( = ?auto_27476 ?auto_27499 ) ) ( not ( = ?auto_27488 ?auto_27497 ) ) ( IS-CRATE ?auto_27475 ) ( AVAILABLE ?auto_27490 ) ( SURFACE-AT ?auto_27475 ?auto_27486 ) ( ON ?auto_27475 ?auto_27515 ) ( CLEAR ?auto_27475 ) ( not ( = ?auto_27474 ?auto_27475 ) ) ( not ( = ?auto_27474 ?auto_27515 ) ) ( not ( = ?auto_27475 ?auto_27515 ) ) ( SURFACE-AT ?auto_27473 ?auto_27487 ) ( CLEAR ?auto_27473 ) ( IS-CRATE ?auto_27474 ) ( AVAILABLE ?auto_27488 ) ( not ( = ?auto_27492 ?auto_27487 ) ) ( HOIST-AT ?auto_27502 ?auto_27492 ) ( AVAILABLE ?auto_27502 ) ( SURFACE-AT ?auto_27474 ?auto_27492 ) ( ON ?auto_27474 ?auto_27495 ) ( CLEAR ?auto_27474 ) ( TRUCK-AT ?auto_27485 ?auto_27487 ) ( not ( = ?auto_27473 ?auto_27474 ) ) ( not ( = ?auto_27473 ?auto_27495 ) ) ( not ( = ?auto_27474 ?auto_27495 ) ) ( not ( = ?auto_27488 ?auto_27502 ) ) ( not ( = ?auto_27473 ?auto_27475 ) ) ( not ( = ?auto_27473 ?auto_27515 ) ) ( not ( = ?auto_27475 ?auto_27495 ) ) ( not ( = ?auto_27486 ?auto_27492 ) ) ( not ( = ?auto_27490 ?auto_27502 ) ) ( not ( = ?auto_27515 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27476 ) ) ( not ( = ?auto_27473 ?auto_27499 ) ) ( not ( = ?auto_27474 ?auto_27476 ) ) ( not ( = ?auto_27474 ?auto_27499 ) ) ( not ( = ?auto_27476 ?auto_27515 ) ) ( not ( = ?auto_27476 ?auto_27495 ) ) ( not ( = ?auto_27512 ?auto_27486 ) ) ( not ( = ?auto_27512 ?auto_27492 ) ) ( not ( = ?auto_27497 ?auto_27490 ) ) ( not ( = ?auto_27497 ?auto_27502 ) ) ( not ( = ?auto_27499 ?auto_27515 ) ) ( not ( = ?auto_27499 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27477 ) ) ( not ( = ?auto_27473 ?auto_27493 ) ) ( not ( = ?auto_27474 ?auto_27477 ) ) ( not ( = ?auto_27474 ?auto_27493 ) ) ( not ( = ?auto_27475 ?auto_27477 ) ) ( not ( = ?auto_27475 ?auto_27493 ) ) ( not ( = ?auto_27477 ?auto_27499 ) ) ( not ( = ?auto_27477 ?auto_27515 ) ) ( not ( = ?auto_27477 ?auto_27495 ) ) ( not ( = ?auto_27496 ?auto_27512 ) ) ( not ( = ?auto_27496 ?auto_27486 ) ) ( not ( = ?auto_27496 ?auto_27492 ) ) ( not ( = ?auto_27491 ?auto_27497 ) ) ( not ( = ?auto_27491 ?auto_27490 ) ) ( not ( = ?auto_27491 ?auto_27502 ) ) ( not ( = ?auto_27493 ?auto_27499 ) ) ( not ( = ?auto_27493 ?auto_27515 ) ) ( not ( = ?auto_27493 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27478 ) ) ( not ( = ?auto_27473 ?auto_27506 ) ) ( not ( = ?auto_27474 ?auto_27478 ) ) ( not ( = ?auto_27474 ?auto_27506 ) ) ( not ( = ?auto_27475 ?auto_27478 ) ) ( not ( = ?auto_27475 ?auto_27506 ) ) ( not ( = ?auto_27476 ?auto_27478 ) ) ( not ( = ?auto_27476 ?auto_27506 ) ) ( not ( = ?auto_27478 ?auto_27493 ) ) ( not ( = ?auto_27478 ?auto_27499 ) ) ( not ( = ?auto_27478 ?auto_27515 ) ) ( not ( = ?auto_27478 ?auto_27495 ) ) ( not ( = ?auto_27506 ?auto_27493 ) ) ( not ( = ?auto_27506 ?auto_27499 ) ) ( not ( = ?auto_27506 ?auto_27515 ) ) ( not ( = ?auto_27506 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27481 ) ) ( not ( = ?auto_27473 ?auto_27516 ) ) ( not ( = ?auto_27474 ?auto_27481 ) ) ( not ( = ?auto_27474 ?auto_27516 ) ) ( not ( = ?auto_27475 ?auto_27481 ) ) ( not ( = ?auto_27475 ?auto_27516 ) ) ( not ( = ?auto_27476 ?auto_27481 ) ) ( not ( = ?auto_27476 ?auto_27516 ) ) ( not ( = ?auto_27477 ?auto_27481 ) ) ( not ( = ?auto_27477 ?auto_27516 ) ) ( not ( = ?auto_27481 ?auto_27506 ) ) ( not ( = ?auto_27481 ?auto_27493 ) ) ( not ( = ?auto_27481 ?auto_27499 ) ) ( not ( = ?auto_27481 ?auto_27515 ) ) ( not ( = ?auto_27481 ?auto_27495 ) ) ( not ( = ?auto_27494 ?auto_27496 ) ) ( not ( = ?auto_27494 ?auto_27512 ) ) ( not ( = ?auto_27494 ?auto_27486 ) ) ( not ( = ?auto_27494 ?auto_27492 ) ) ( not ( = ?auto_27511 ?auto_27491 ) ) ( not ( = ?auto_27511 ?auto_27497 ) ) ( not ( = ?auto_27511 ?auto_27490 ) ) ( not ( = ?auto_27511 ?auto_27502 ) ) ( not ( = ?auto_27516 ?auto_27506 ) ) ( not ( = ?auto_27516 ?auto_27493 ) ) ( not ( = ?auto_27516 ?auto_27499 ) ) ( not ( = ?auto_27516 ?auto_27515 ) ) ( not ( = ?auto_27516 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27480 ) ) ( not ( = ?auto_27473 ?auto_27501 ) ) ( not ( = ?auto_27474 ?auto_27480 ) ) ( not ( = ?auto_27474 ?auto_27501 ) ) ( not ( = ?auto_27475 ?auto_27480 ) ) ( not ( = ?auto_27475 ?auto_27501 ) ) ( not ( = ?auto_27476 ?auto_27480 ) ) ( not ( = ?auto_27476 ?auto_27501 ) ) ( not ( = ?auto_27477 ?auto_27480 ) ) ( not ( = ?auto_27477 ?auto_27501 ) ) ( not ( = ?auto_27478 ?auto_27480 ) ) ( not ( = ?auto_27478 ?auto_27501 ) ) ( not ( = ?auto_27480 ?auto_27516 ) ) ( not ( = ?auto_27480 ?auto_27506 ) ) ( not ( = ?auto_27480 ?auto_27493 ) ) ( not ( = ?auto_27480 ?auto_27499 ) ) ( not ( = ?auto_27480 ?auto_27515 ) ) ( not ( = ?auto_27480 ?auto_27495 ) ) ( not ( = ?auto_27514 ?auto_27494 ) ) ( not ( = ?auto_27514 ?auto_27496 ) ) ( not ( = ?auto_27514 ?auto_27512 ) ) ( not ( = ?auto_27514 ?auto_27486 ) ) ( not ( = ?auto_27514 ?auto_27492 ) ) ( not ( = ?auto_27503 ?auto_27511 ) ) ( not ( = ?auto_27503 ?auto_27491 ) ) ( not ( = ?auto_27503 ?auto_27497 ) ) ( not ( = ?auto_27503 ?auto_27490 ) ) ( not ( = ?auto_27503 ?auto_27502 ) ) ( not ( = ?auto_27501 ?auto_27516 ) ) ( not ( = ?auto_27501 ?auto_27506 ) ) ( not ( = ?auto_27501 ?auto_27493 ) ) ( not ( = ?auto_27501 ?auto_27499 ) ) ( not ( = ?auto_27501 ?auto_27515 ) ) ( not ( = ?auto_27501 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27479 ) ) ( not ( = ?auto_27473 ?auto_27498 ) ) ( not ( = ?auto_27474 ?auto_27479 ) ) ( not ( = ?auto_27474 ?auto_27498 ) ) ( not ( = ?auto_27475 ?auto_27479 ) ) ( not ( = ?auto_27475 ?auto_27498 ) ) ( not ( = ?auto_27476 ?auto_27479 ) ) ( not ( = ?auto_27476 ?auto_27498 ) ) ( not ( = ?auto_27477 ?auto_27479 ) ) ( not ( = ?auto_27477 ?auto_27498 ) ) ( not ( = ?auto_27478 ?auto_27479 ) ) ( not ( = ?auto_27478 ?auto_27498 ) ) ( not ( = ?auto_27481 ?auto_27479 ) ) ( not ( = ?auto_27481 ?auto_27498 ) ) ( not ( = ?auto_27479 ?auto_27501 ) ) ( not ( = ?auto_27479 ?auto_27516 ) ) ( not ( = ?auto_27479 ?auto_27506 ) ) ( not ( = ?auto_27479 ?auto_27493 ) ) ( not ( = ?auto_27479 ?auto_27499 ) ) ( not ( = ?auto_27479 ?auto_27515 ) ) ( not ( = ?auto_27479 ?auto_27495 ) ) ( not ( = ?auto_27500 ?auto_27514 ) ) ( not ( = ?auto_27500 ?auto_27494 ) ) ( not ( = ?auto_27500 ?auto_27496 ) ) ( not ( = ?auto_27500 ?auto_27512 ) ) ( not ( = ?auto_27500 ?auto_27486 ) ) ( not ( = ?auto_27500 ?auto_27492 ) ) ( not ( = ?auto_27510 ?auto_27503 ) ) ( not ( = ?auto_27510 ?auto_27511 ) ) ( not ( = ?auto_27510 ?auto_27491 ) ) ( not ( = ?auto_27510 ?auto_27497 ) ) ( not ( = ?auto_27510 ?auto_27490 ) ) ( not ( = ?auto_27510 ?auto_27502 ) ) ( not ( = ?auto_27498 ?auto_27501 ) ) ( not ( = ?auto_27498 ?auto_27516 ) ) ( not ( = ?auto_27498 ?auto_27506 ) ) ( not ( = ?auto_27498 ?auto_27493 ) ) ( not ( = ?auto_27498 ?auto_27499 ) ) ( not ( = ?auto_27498 ?auto_27515 ) ) ( not ( = ?auto_27498 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27482 ) ) ( not ( = ?auto_27473 ?auto_27509 ) ) ( not ( = ?auto_27474 ?auto_27482 ) ) ( not ( = ?auto_27474 ?auto_27509 ) ) ( not ( = ?auto_27475 ?auto_27482 ) ) ( not ( = ?auto_27475 ?auto_27509 ) ) ( not ( = ?auto_27476 ?auto_27482 ) ) ( not ( = ?auto_27476 ?auto_27509 ) ) ( not ( = ?auto_27477 ?auto_27482 ) ) ( not ( = ?auto_27477 ?auto_27509 ) ) ( not ( = ?auto_27478 ?auto_27482 ) ) ( not ( = ?auto_27478 ?auto_27509 ) ) ( not ( = ?auto_27481 ?auto_27482 ) ) ( not ( = ?auto_27481 ?auto_27509 ) ) ( not ( = ?auto_27480 ?auto_27482 ) ) ( not ( = ?auto_27480 ?auto_27509 ) ) ( not ( = ?auto_27482 ?auto_27498 ) ) ( not ( = ?auto_27482 ?auto_27501 ) ) ( not ( = ?auto_27482 ?auto_27516 ) ) ( not ( = ?auto_27482 ?auto_27506 ) ) ( not ( = ?auto_27482 ?auto_27493 ) ) ( not ( = ?auto_27482 ?auto_27499 ) ) ( not ( = ?auto_27482 ?auto_27515 ) ) ( not ( = ?auto_27482 ?auto_27495 ) ) ( not ( = ?auto_27513 ?auto_27500 ) ) ( not ( = ?auto_27513 ?auto_27514 ) ) ( not ( = ?auto_27513 ?auto_27494 ) ) ( not ( = ?auto_27513 ?auto_27496 ) ) ( not ( = ?auto_27513 ?auto_27512 ) ) ( not ( = ?auto_27513 ?auto_27486 ) ) ( not ( = ?auto_27513 ?auto_27492 ) ) ( not ( = ?auto_27504 ?auto_27510 ) ) ( not ( = ?auto_27504 ?auto_27503 ) ) ( not ( = ?auto_27504 ?auto_27511 ) ) ( not ( = ?auto_27504 ?auto_27491 ) ) ( not ( = ?auto_27504 ?auto_27497 ) ) ( not ( = ?auto_27504 ?auto_27490 ) ) ( not ( = ?auto_27504 ?auto_27502 ) ) ( not ( = ?auto_27509 ?auto_27498 ) ) ( not ( = ?auto_27509 ?auto_27501 ) ) ( not ( = ?auto_27509 ?auto_27516 ) ) ( not ( = ?auto_27509 ?auto_27506 ) ) ( not ( = ?auto_27509 ?auto_27493 ) ) ( not ( = ?auto_27509 ?auto_27499 ) ) ( not ( = ?auto_27509 ?auto_27515 ) ) ( not ( = ?auto_27509 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27484 ) ) ( not ( = ?auto_27473 ?auto_27508 ) ) ( not ( = ?auto_27474 ?auto_27484 ) ) ( not ( = ?auto_27474 ?auto_27508 ) ) ( not ( = ?auto_27475 ?auto_27484 ) ) ( not ( = ?auto_27475 ?auto_27508 ) ) ( not ( = ?auto_27476 ?auto_27484 ) ) ( not ( = ?auto_27476 ?auto_27508 ) ) ( not ( = ?auto_27477 ?auto_27484 ) ) ( not ( = ?auto_27477 ?auto_27508 ) ) ( not ( = ?auto_27478 ?auto_27484 ) ) ( not ( = ?auto_27478 ?auto_27508 ) ) ( not ( = ?auto_27481 ?auto_27484 ) ) ( not ( = ?auto_27481 ?auto_27508 ) ) ( not ( = ?auto_27480 ?auto_27484 ) ) ( not ( = ?auto_27480 ?auto_27508 ) ) ( not ( = ?auto_27479 ?auto_27484 ) ) ( not ( = ?auto_27479 ?auto_27508 ) ) ( not ( = ?auto_27484 ?auto_27509 ) ) ( not ( = ?auto_27484 ?auto_27498 ) ) ( not ( = ?auto_27484 ?auto_27501 ) ) ( not ( = ?auto_27484 ?auto_27516 ) ) ( not ( = ?auto_27484 ?auto_27506 ) ) ( not ( = ?auto_27484 ?auto_27493 ) ) ( not ( = ?auto_27484 ?auto_27499 ) ) ( not ( = ?auto_27484 ?auto_27515 ) ) ( not ( = ?auto_27484 ?auto_27495 ) ) ( not ( = ?auto_27505 ?auto_27513 ) ) ( not ( = ?auto_27505 ?auto_27500 ) ) ( not ( = ?auto_27505 ?auto_27514 ) ) ( not ( = ?auto_27505 ?auto_27494 ) ) ( not ( = ?auto_27505 ?auto_27496 ) ) ( not ( = ?auto_27505 ?auto_27512 ) ) ( not ( = ?auto_27505 ?auto_27486 ) ) ( not ( = ?auto_27505 ?auto_27492 ) ) ( not ( = ?auto_27507 ?auto_27504 ) ) ( not ( = ?auto_27507 ?auto_27510 ) ) ( not ( = ?auto_27507 ?auto_27503 ) ) ( not ( = ?auto_27507 ?auto_27511 ) ) ( not ( = ?auto_27507 ?auto_27491 ) ) ( not ( = ?auto_27507 ?auto_27497 ) ) ( not ( = ?auto_27507 ?auto_27490 ) ) ( not ( = ?auto_27507 ?auto_27502 ) ) ( not ( = ?auto_27508 ?auto_27509 ) ) ( not ( = ?auto_27508 ?auto_27498 ) ) ( not ( = ?auto_27508 ?auto_27501 ) ) ( not ( = ?auto_27508 ?auto_27516 ) ) ( not ( = ?auto_27508 ?auto_27506 ) ) ( not ( = ?auto_27508 ?auto_27493 ) ) ( not ( = ?auto_27508 ?auto_27499 ) ) ( not ( = ?auto_27508 ?auto_27515 ) ) ( not ( = ?auto_27508 ?auto_27495 ) ) ( not ( = ?auto_27473 ?auto_27483 ) ) ( not ( = ?auto_27473 ?auto_27489 ) ) ( not ( = ?auto_27474 ?auto_27483 ) ) ( not ( = ?auto_27474 ?auto_27489 ) ) ( not ( = ?auto_27475 ?auto_27483 ) ) ( not ( = ?auto_27475 ?auto_27489 ) ) ( not ( = ?auto_27476 ?auto_27483 ) ) ( not ( = ?auto_27476 ?auto_27489 ) ) ( not ( = ?auto_27477 ?auto_27483 ) ) ( not ( = ?auto_27477 ?auto_27489 ) ) ( not ( = ?auto_27478 ?auto_27483 ) ) ( not ( = ?auto_27478 ?auto_27489 ) ) ( not ( = ?auto_27481 ?auto_27483 ) ) ( not ( = ?auto_27481 ?auto_27489 ) ) ( not ( = ?auto_27480 ?auto_27483 ) ) ( not ( = ?auto_27480 ?auto_27489 ) ) ( not ( = ?auto_27479 ?auto_27483 ) ) ( not ( = ?auto_27479 ?auto_27489 ) ) ( not ( = ?auto_27482 ?auto_27483 ) ) ( not ( = ?auto_27482 ?auto_27489 ) ) ( not ( = ?auto_27483 ?auto_27508 ) ) ( not ( = ?auto_27483 ?auto_27509 ) ) ( not ( = ?auto_27483 ?auto_27498 ) ) ( not ( = ?auto_27483 ?auto_27501 ) ) ( not ( = ?auto_27483 ?auto_27516 ) ) ( not ( = ?auto_27483 ?auto_27506 ) ) ( not ( = ?auto_27483 ?auto_27493 ) ) ( not ( = ?auto_27483 ?auto_27499 ) ) ( not ( = ?auto_27483 ?auto_27515 ) ) ( not ( = ?auto_27483 ?auto_27495 ) ) ( not ( = ?auto_27489 ?auto_27508 ) ) ( not ( = ?auto_27489 ?auto_27509 ) ) ( not ( = ?auto_27489 ?auto_27498 ) ) ( not ( = ?auto_27489 ?auto_27501 ) ) ( not ( = ?auto_27489 ?auto_27516 ) ) ( not ( = ?auto_27489 ?auto_27506 ) ) ( not ( = ?auto_27489 ?auto_27493 ) ) ( not ( = ?auto_27489 ?auto_27499 ) ) ( not ( = ?auto_27489 ?auto_27515 ) ) ( not ( = ?auto_27489 ?auto_27495 ) ) )
    :subtasks
    ( ( MAKE-10CRATE ?auto_27473 ?auto_27474 ?auto_27475 ?auto_27476 ?auto_27477 ?auto_27478 ?auto_27481 ?auto_27480 ?auto_27479 ?auto_27482 ?auto_27484 )
      ( MAKE-1CRATE ?auto_27484 ?auto_27483 )
      ( MAKE-11CRATE-VERIFY ?auto_27473 ?auto_27474 ?auto_27475 ?auto_27476 ?auto_27477 ?auto_27478 ?auto_27481 ?auto_27480 ?auto_27479 ?auto_27482 ?auto_27484 ?auto_27483 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27519 - SURFACE
      ?auto_27520 - SURFACE
    )
    :vars
    (
      ?auto_27521 - HOIST
      ?auto_27522 - PLACE
      ?auto_27524 - PLACE
      ?auto_27525 - HOIST
      ?auto_27526 - SURFACE
      ?auto_27523 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27521 ?auto_27522 ) ( SURFACE-AT ?auto_27519 ?auto_27522 ) ( CLEAR ?auto_27519 ) ( IS-CRATE ?auto_27520 ) ( AVAILABLE ?auto_27521 ) ( not ( = ?auto_27524 ?auto_27522 ) ) ( HOIST-AT ?auto_27525 ?auto_27524 ) ( AVAILABLE ?auto_27525 ) ( SURFACE-AT ?auto_27520 ?auto_27524 ) ( ON ?auto_27520 ?auto_27526 ) ( CLEAR ?auto_27520 ) ( TRUCK-AT ?auto_27523 ?auto_27522 ) ( not ( = ?auto_27519 ?auto_27520 ) ) ( not ( = ?auto_27519 ?auto_27526 ) ) ( not ( = ?auto_27520 ?auto_27526 ) ) ( not ( = ?auto_27521 ?auto_27525 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27523 ?auto_27522 ?auto_27524 )
      ( !LIFT ?auto_27525 ?auto_27520 ?auto_27526 ?auto_27524 )
      ( !LOAD ?auto_27525 ?auto_27520 ?auto_27523 ?auto_27524 )
      ( !DRIVE ?auto_27523 ?auto_27524 ?auto_27522 )
      ( !UNLOAD ?auto_27521 ?auto_27520 ?auto_27523 ?auto_27522 )
      ( !DROP ?auto_27521 ?auto_27520 ?auto_27519 ?auto_27522 )
      ( MAKE-1CRATE-VERIFY ?auto_27519 ?auto_27520 ) )
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
      ?auto_27548 - SURFACE
      ?auto_27547 - SURFACE
      ?auto_27546 - SURFACE
      ?auto_27549 - SURFACE
      ?auto_27551 - SURFACE
      ?auto_27550 - SURFACE
      ?auto_27552 - SURFACE
    )
    :vars
    (
      ?auto_27557 - HOIST
      ?auto_27553 - PLACE
      ?auto_27555 - PLACE
      ?auto_27556 - HOIST
      ?auto_27558 - SURFACE
      ?auto_27570 - PLACE
      ?auto_27564 - HOIST
      ?auto_27561 - SURFACE
      ?auto_27563 - PLACE
      ?auto_27579 - HOIST
      ?auto_27571 - SURFACE
      ?auto_27581 - PLACE
      ?auto_27562 - HOIST
      ?auto_27559 - SURFACE
      ?auto_27569 - PLACE
      ?auto_27584 - HOIST
      ?auto_27573 - SURFACE
      ?auto_27576 - PLACE
      ?auto_27574 - HOIST
      ?auto_27568 - SURFACE
      ?auto_27560 - PLACE
      ?auto_27582 - HOIST
      ?auto_27572 - SURFACE
      ?auto_27567 - SURFACE
      ?auto_27577 - SURFACE
      ?auto_27575 - PLACE
      ?auto_27580 - HOIST
      ?auto_27583 - SURFACE
      ?auto_27578 - SURFACE
      ?auto_27565 - PLACE
      ?auto_27566 - HOIST
      ?auto_27585 - SURFACE
      ?auto_27554 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27557 ?auto_27553 ) ( IS-CRATE ?auto_27552 ) ( not ( = ?auto_27555 ?auto_27553 ) ) ( HOIST-AT ?auto_27556 ?auto_27555 ) ( SURFACE-AT ?auto_27552 ?auto_27555 ) ( ON ?auto_27552 ?auto_27558 ) ( CLEAR ?auto_27552 ) ( not ( = ?auto_27550 ?auto_27552 ) ) ( not ( = ?auto_27550 ?auto_27558 ) ) ( not ( = ?auto_27552 ?auto_27558 ) ) ( not ( = ?auto_27557 ?auto_27556 ) ) ( IS-CRATE ?auto_27550 ) ( not ( = ?auto_27570 ?auto_27553 ) ) ( HOIST-AT ?auto_27564 ?auto_27570 ) ( SURFACE-AT ?auto_27550 ?auto_27570 ) ( ON ?auto_27550 ?auto_27561 ) ( CLEAR ?auto_27550 ) ( not ( = ?auto_27551 ?auto_27550 ) ) ( not ( = ?auto_27551 ?auto_27561 ) ) ( not ( = ?auto_27550 ?auto_27561 ) ) ( not ( = ?auto_27557 ?auto_27564 ) ) ( IS-CRATE ?auto_27551 ) ( not ( = ?auto_27563 ?auto_27553 ) ) ( HOIST-AT ?auto_27579 ?auto_27563 ) ( AVAILABLE ?auto_27579 ) ( SURFACE-AT ?auto_27551 ?auto_27563 ) ( ON ?auto_27551 ?auto_27571 ) ( CLEAR ?auto_27551 ) ( not ( = ?auto_27549 ?auto_27551 ) ) ( not ( = ?auto_27549 ?auto_27571 ) ) ( not ( = ?auto_27551 ?auto_27571 ) ) ( not ( = ?auto_27557 ?auto_27579 ) ) ( IS-CRATE ?auto_27549 ) ( not ( = ?auto_27581 ?auto_27553 ) ) ( HOIST-AT ?auto_27562 ?auto_27581 ) ( AVAILABLE ?auto_27562 ) ( SURFACE-AT ?auto_27549 ?auto_27581 ) ( ON ?auto_27549 ?auto_27559 ) ( CLEAR ?auto_27549 ) ( not ( = ?auto_27546 ?auto_27549 ) ) ( not ( = ?auto_27546 ?auto_27559 ) ) ( not ( = ?auto_27549 ?auto_27559 ) ) ( not ( = ?auto_27557 ?auto_27562 ) ) ( IS-CRATE ?auto_27546 ) ( not ( = ?auto_27569 ?auto_27553 ) ) ( HOIST-AT ?auto_27584 ?auto_27569 ) ( AVAILABLE ?auto_27584 ) ( SURFACE-AT ?auto_27546 ?auto_27569 ) ( ON ?auto_27546 ?auto_27573 ) ( CLEAR ?auto_27546 ) ( not ( = ?auto_27547 ?auto_27546 ) ) ( not ( = ?auto_27547 ?auto_27573 ) ) ( not ( = ?auto_27546 ?auto_27573 ) ) ( not ( = ?auto_27557 ?auto_27584 ) ) ( IS-CRATE ?auto_27547 ) ( not ( = ?auto_27576 ?auto_27553 ) ) ( HOIST-AT ?auto_27574 ?auto_27576 ) ( AVAILABLE ?auto_27574 ) ( SURFACE-AT ?auto_27547 ?auto_27576 ) ( ON ?auto_27547 ?auto_27568 ) ( CLEAR ?auto_27547 ) ( not ( = ?auto_27548 ?auto_27547 ) ) ( not ( = ?auto_27548 ?auto_27568 ) ) ( not ( = ?auto_27547 ?auto_27568 ) ) ( not ( = ?auto_27557 ?auto_27574 ) ) ( IS-CRATE ?auto_27548 ) ( not ( = ?auto_27560 ?auto_27553 ) ) ( HOIST-AT ?auto_27582 ?auto_27560 ) ( AVAILABLE ?auto_27582 ) ( SURFACE-AT ?auto_27548 ?auto_27560 ) ( ON ?auto_27548 ?auto_27572 ) ( CLEAR ?auto_27548 ) ( not ( = ?auto_27545 ?auto_27548 ) ) ( not ( = ?auto_27545 ?auto_27572 ) ) ( not ( = ?auto_27548 ?auto_27572 ) ) ( not ( = ?auto_27557 ?auto_27582 ) ) ( IS-CRATE ?auto_27545 ) ( SURFACE-AT ?auto_27545 ?auto_27555 ) ( ON ?auto_27545 ?auto_27567 ) ( CLEAR ?auto_27545 ) ( not ( = ?auto_27544 ?auto_27545 ) ) ( not ( = ?auto_27544 ?auto_27567 ) ) ( not ( = ?auto_27545 ?auto_27567 ) ) ( IS-CRATE ?auto_27544 ) ( AVAILABLE ?auto_27556 ) ( SURFACE-AT ?auto_27544 ?auto_27555 ) ( ON ?auto_27544 ?auto_27577 ) ( CLEAR ?auto_27544 ) ( not ( = ?auto_27543 ?auto_27544 ) ) ( not ( = ?auto_27543 ?auto_27577 ) ) ( not ( = ?auto_27544 ?auto_27577 ) ) ( IS-CRATE ?auto_27543 ) ( not ( = ?auto_27575 ?auto_27553 ) ) ( HOIST-AT ?auto_27580 ?auto_27575 ) ( AVAILABLE ?auto_27580 ) ( SURFACE-AT ?auto_27543 ?auto_27575 ) ( ON ?auto_27543 ?auto_27583 ) ( CLEAR ?auto_27543 ) ( not ( = ?auto_27542 ?auto_27543 ) ) ( not ( = ?auto_27542 ?auto_27583 ) ) ( not ( = ?auto_27543 ?auto_27583 ) ) ( not ( = ?auto_27557 ?auto_27580 ) ) ( IS-CRATE ?auto_27542 ) ( AVAILABLE ?auto_27564 ) ( SURFACE-AT ?auto_27542 ?auto_27570 ) ( ON ?auto_27542 ?auto_27578 ) ( CLEAR ?auto_27542 ) ( not ( = ?auto_27541 ?auto_27542 ) ) ( not ( = ?auto_27541 ?auto_27578 ) ) ( not ( = ?auto_27542 ?auto_27578 ) ) ( SURFACE-AT ?auto_27540 ?auto_27553 ) ( CLEAR ?auto_27540 ) ( IS-CRATE ?auto_27541 ) ( AVAILABLE ?auto_27557 ) ( not ( = ?auto_27565 ?auto_27553 ) ) ( HOIST-AT ?auto_27566 ?auto_27565 ) ( AVAILABLE ?auto_27566 ) ( SURFACE-AT ?auto_27541 ?auto_27565 ) ( ON ?auto_27541 ?auto_27585 ) ( CLEAR ?auto_27541 ) ( TRUCK-AT ?auto_27554 ?auto_27553 ) ( not ( = ?auto_27540 ?auto_27541 ) ) ( not ( = ?auto_27540 ?auto_27585 ) ) ( not ( = ?auto_27541 ?auto_27585 ) ) ( not ( = ?auto_27557 ?auto_27566 ) ) ( not ( = ?auto_27540 ?auto_27542 ) ) ( not ( = ?auto_27540 ?auto_27578 ) ) ( not ( = ?auto_27542 ?auto_27585 ) ) ( not ( = ?auto_27570 ?auto_27565 ) ) ( not ( = ?auto_27564 ?auto_27566 ) ) ( not ( = ?auto_27578 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27543 ) ) ( not ( = ?auto_27540 ?auto_27583 ) ) ( not ( = ?auto_27541 ?auto_27543 ) ) ( not ( = ?auto_27541 ?auto_27583 ) ) ( not ( = ?auto_27543 ?auto_27578 ) ) ( not ( = ?auto_27543 ?auto_27585 ) ) ( not ( = ?auto_27575 ?auto_27570 ) ) ( not ( = ?auto_27575 ?auto_27565 ) ) ( not ( = ?auto_27580 ?auto_27564 ) ) ( not ( = ?auto_27580 ?auto_27566 ) ) ( not ( = ?auto_27583 ?auto_27578 ) ) ( not ( = ?auto_27583 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27544 ) ) ( not ( = ?auto_27540 ?auto_27577 ) ) ( not ( = ?auto_27541 ?auto_27544 ) ) ( not ( = ?auto_27541 ?auto_27577 ) ) ( not ( = ?auto_27542 ?auto_27544 ) ) ( not ( = ?auto_27542 ?auto_27577 ) ) ( not ( = ?auto_27544 ?auto_27583 ) ) ( not ( = ?auto_27544 ?auto_27578 ) ) ( not ( = ?auto_27544 ?auto_27585 ) ) ( not ( = ?auto_27555 ?auto_27575 ) ) ( not ( = ?auto_27555 ?auto_27570 ) ) ( not ( = ?auto_27555 ?auto_27565 ) ) ( not ( = ?auto_27556 ?auto_27580 ) ) ( not ( = ?auto_27556 ?auto_27564 ) ) ( not ( = ?auto_27556 ?auto_27566 ) ) ( not ( = ?auto_27577 ?auto_27583 ) ) ( not ( = ?auto_27577 ?auto_27578 ) ) ( not ( = ?auto_27577 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27545 ) ) ( not ( = ?auto_27540 ?auto_27567 ) ) ( not ( = ?auto_27541 ?auto_27545 ) ) ( not ( = ?auto_27541 ?auto_27567 ) ) ( not ( = ?auto_27542 ?auto_27545 ) ) ( not ( = ?auto_27542 ?auto_27567 ) ) ( not ( = ?auto_27543 ?auto_27545 ) ) ( not ( = ?auto_27543 ?auto_27567 ) ) ( not ( = ?auto_27545 ?auto_27577 ) ) ( not ( = ?auto_27545 ?auto_27583 ) ) ( not ( = ?auto_27545 ?auto_27578 ) ) ( not ( = ?auto_27545 ?auto_27585 ) ) ( not ( = ?auto_27567 ?auto_27577 ) ) ( not ( = ?auto_27567 ?auto_27583 ) ) ( not ( = ?auto_27567 ?auto_27578 ) ) ( not ( = ?auto_27567 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27548 ) ) ( not ( = ?auto_27540 ?auto_27572 ) ) ( not ( = ?auto_27541 ?auto_27548 ) ) ( not ( = ?auto_27541 ?auto_27572 ) ) ( not ( = ?auto_27542 ?auto_27548 ) ) ( not ( = ?auto_27542 ?auto_27572 ) ) ( not ( = ?auto_27543 ?auto_27548 ) ) ( not ( = ?auto_27543 ?auto_27572 ) ) ( not ( = ?auto_27544 ?auto_27548 ) ) ( not ( = ?auto_27544 ?auto_27572 ) ) ( not ( = ?auto_27548 ?auto_27567 ) ) ( not ( = ?auto_27548 ?auto_27577 ) ) ( not ( = ?auto_27548 ?auto_27583 ) ) ( not ( = ?auto_27548 ?auto_27578 ) ) ( not ( = ?auto_27548 ?auto_27585 ) ) ( not ( = ?auto_27560 ?auto_27555 ) ) ( not ( = ?auto_27560 ?auto_27575 ) ) ( not ( = ?auto_27560 ?auto_27570 ) ) ( not ( = ?auto_27560 ?auto_27565 ) ) ( not ( = ?auto_27582 ?auto_27556 ) ) ( not ( = ?auto_27582 ?auto_27580 ) ) ( not ( = ?auto_27582 ?auto_27564 ) ) ( not ( = ?auto_27582 ?auto_27566 ) ) ( not ( = ?auto_27572 ?auto_27567 ) ) ( not ( = ?auto_27572 ?auto_27577 ) ) ( not ( = ?auto_27572 ?auto_27583 ) ) ( not ( = ?auto_27572 ?auto_27578 ) ) ( not ( = ?auto_27572 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27547 ) ) ( not ( = ?auto_27540 ?auto_27568 ) ) ( not ( = ?auto_27541 ?auto_27547 ) ) ( not ( = ?auto_27541 ?auto_27568 ) ) ( not ( = ?auto_27542 ?auto_27547 ) ) ( not ( = ?auto_27542 ?auto_27568 ) ) ( not ( = ?auto_27543 ?auto_27547 ) ) ( not ( = ?auto_27543 ?auto_27568 ) ) ( not ( = ?auto_27544 ?auto_27547 ) ) ( not ( = ?auto_27544 ?auto_27568 ) ) ( not ( = ?auto_27545 ?auto_27547 ) ) ( not ( = ?auto_27545 ?auto_27568 ) ) ( not ( = ?auto_27547 ?auto_27572 ) ) ( not ( = ?auto_27547 ?auto_27567 ) ) ( not ( = ?auto_27547 ?auto_27577 ) ) ( not ( = ?auto_27547 ?auto_27583 ) ) ( not ( = ?auto_27547 ?auto_27578 ) ) ( not ( = ?auto_27547 ?auto_27585 ) ) ( not ( = ?auto_27576 ?auto_27560 ) ) ( not ( = ?auto_27576 ?auto_27555 ) ) ( not ( = ?auto_27576 ?auto_27575 ) ) ( not ( = ?auto_27576 ?auto_27570 ) ) ( not ( = ?auto_27576 ?auto_27565 ) ) ( not ( = ?auto_27574 ?auto_27582 ) ) ( not ( = ?auto_27574 ?auto_27556 ) ) ( not ( = ?auto_27574 ?auto_27580 ) ) ( not ( = ?auto_27574 ?auto_27564 ) ) ( not ( = ?auto_27574 ?auto_27566 ) ) ( not ( = ?auto_27568 ?auto_27572 ) ) ( not ( = ?auto_27568 ?auto_27567 ) ) ( not ( = ?auto_27568 ?auto_27577 ) ) ( not ( = ?auto_27568 ?auto_27583 ) ) ( not ( = ?auto_27568 ?auto_27578 ) ) ( not ( = ?auto_27568 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27546 ) ) ( not ( = ?auto_27540 ?auto_27573 ) ) ( not ( = ?auto_27541 ?auto_27546 ) ) ( not ( = ?auto_27541 ?auto_27573 ) ) ( not ( = ?auto_27542 ?auto_27546 ) ) ( not ( = ?auto_27542 ?auto_27573 ) ) ( not ( = ?auto_27543 ?auto_27546 ) ) ( not ( = ?auto_27543 ?auto_27573 ) ) ( not ( = ?auto_27544 ?auto_27546 ) ) ( not ( = ?auto_27544 ?auto_27573 ) ) ( not ( = ?auto_27545 ?auto_27546 ) ) ( not ( = ?auto_27545 ?auto_27573 ) ) ( not ( = ?auto_27548 ?auto_27546 ) ) ( not ( = ?auto_27548 ?auto_27573 ) ) ( not ( = ?auto_27546 ?auto_27568 ) ) ( not ( = ?auto_27546 ?auto_27572 ) ) ( not ( = ?auto_27546 ?auto_27567 ) ) ( not ( = ?auto_27546 ?auto_27577 ) ) ( not ( = ?auto_27546 ?auto_27583 ) ) ( not ( = ?auto_27546 ?auto_27578 ) ) ( not ( = ?auto_27546 ?auto_27585 ) ) ( not ( = ?auto_27569 ?auto_27576 ) ) ( not ( = ?auto_27569 ?auto_27560 ) ) ( not ( = ?auto_27569 ?auto_27555 ) ) ( not ( = ?auto_27569 ?auto_27575 ) ) ( not ( = ?auto_27569 ?auto_27570 ) ) ( not ( = ?auto_27569 ?auto_27565 ) ) ( not ( = ?auto_27584 ?auto_27574 ) ) ( not ( = ?auto_27584 ?auto_27582 ) ) ( not ( = ?auto_27584 ?auto_27556 ) ) ( not ( = ?auto_27584 ?auto_27580 ) ) ( not ( = ?auto_27584 ?auto_27564 ) ) ( not ( = ?auto_27584 ?auto_27566 ) ) ( not ( = ?auto_27573 ?auto_27568 ) ) ( not ( = ?auto_27573 ?auto_27572 ) ) ( not ( = ?auto_27573 ?auto_27567 ) ) ( not ( = ?auto_27573 ?auto_27577 ) ) ( not ( = ?auto_27573 ?auto_27583 ) ) ( not ( = ?auto_27573 ?auto_27578 ) ) ( not ( = ?auto_27573 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27549 ) ) ( not ( = ?auto_27540 ?auto_27559 ) ) ( not ( = ?auto_27541 ?auto_27549 ) ) ( not ( = ?auto_27541 ?auto_27559 ) ) ( not ( = ?auto_27542 ?auto_27549 ) ) ( not ( = ?auto_27542 ?auto_27559 ) ) ( not ( = ?auto_27543 ?auto_27549 ) ) ( not ( = ?auto_27543 ?auto_27559 ) ) ( not ( = ?auto_27544 ?auto_27549 ) ) ( not ( = ?auto_27544 ?auto_27559 ) ) ( not ( = ?auto_27545 ?auto_27549 ) ) ( not ( = ?auto_27545 ?auto_27559 ) ) ( not ( = ?auto_27548 ?auto_27549 ) ) ( not ( = ?auto_27548 ?auto_27559 ) ) ( not ( = ?auto_27547 ?auto_27549 ) ) ( not ( = ?auto_27547 ?auto_27559 ) ) ( not ( = ?auto_27549 ?auto_27573 ) ) ( not ( = ?auto_27549 ?auto_27568 ) ) ( not ( = ?auto_27549 ?auto_27572 ) ) ( not ( = ?auto_27549 ?auto_27567 ) ) ( not ( = ?auto_27549 ?auto_27577 ) ) ( not ( = ?auto_27549 ?auto_27583 ) ) ( not ( = ?auto_27549 ?auto_27578 ) ) ( not ( = ?auto_27549 ?auto_27585 ) ) ( not ( = ?auto_27581 ?auto_27569 ) ) ( not ( = ?auto_27581 ?auto_27576 ) ) ( not ( = ?auto_27581 ?auto_27560 ) ) ( not ( = ?auto_27581 ?auto_27555 ) ) ( not ( = ?auto_27581 ?auto_27575 ) ) ( not ( = ?auto_27581 ?auto_27570 ) ) ( not ( = ?auto_27581 ?auto_27565 ) ) ( not ( = ?auto_27562 ?auto_27584 ) ) ( not ( = ?auto_27562 ?auto_27574 ) ) ( not ( = ?auto_27562 ?auto_27582 ) ) ( not ( = ?auto_27562 ?auto_27556 ) ) ( not ( = ?auto_27562 ?auto_27580 ) ) ( not ( = ?auto_27562 ?auto_27564 ) ) ( not ( = ?auto_27562 ?auto_27566 ) ) ( not ( = ?auto_27559 ?auto_27573 ) ) ( not ( = ?auto_27559 ?auto_27568 ) ) ( not ( = ?auto_27559 ?auto_27572 ) ) ( not ( = ?auto_27559 ?auto_27567 ) ) ( not ( = ?auto_27559 ?auto_27577 ) ) ( not ( = ?auto_27559 ?auto_27583 ) ) ( not ( = ?auto_27559 ?auto_27578 ) ) ( not ( = ?auto_27559 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27551 ) ) ( not ( = ?auto_27540 ?auto_27571 ) ) ( not ( = ?auto_27541 ?auto_27551 ) ) ( not ( = ?auto_27541 ?auto_27571 ) ) ( not ( = ?auto_27542 ?auto_27551 ) ) ( not ( = ?auto_27542 ?auto_27571 ) ) ( not ( = ?auto_27543 ?auto_27551 ) ) ( not ( = ?auto_27543 ?auto_27571 ) ) ( not ( = ?auto_27544 ?auto_27551 ) ) ( not ( = ?auto_27544 ?auto_27571 ) ) ( not ( = ?auto_27545 ?auto_27551 ) ) ( not ( = ?auto_27545 ?auto_27571 ) ) ( not ( = ?auto_27548 ?auto_27551 ) ) ( not ( = ?auto_27548 ?auto_27571 ) ) ( not ( = ?auto_27547 ?auto_27551 ) ) ( not ( = ?auto_27547 ?auto_27571 ) ) ( not ( = ?auto_27546 ?auto_27551 ) ) ( not ( = ?auto_27546 ?auto_27571 ) ) ( not ( = ?auto_27551 ?auto_27559 ) ) ( not ( = ?auto_27551 ?auto_27573 ) ) ( not ( = ?auto_27551 ?auto_27568 ) ) ( not ( = ?auto_27551 ?auto_27572 ) ) ( not ( = ?auto_27551 ?auto_27567 ) ) ( not ( = ?auto_27551 ?auto_27577 ) ) ( not ( = ?auto_27551 ?auto_27583 ) ) ( not ( = ?auto_27551 ?auto_27578 ) ) ( not ( = ?auto_27551 ?auto_27585 ) ) ( not ( = ?auto_27563 ?auto_27581 ) ) ( not ( = ?auto_27563 ?auto_27569 ) ) ( not ( = ?auto_27563 ?auto_27576 ) ) ( not ( = ?auto_27563 ?auto_27560 ) ) ( not ( = ?auto_27563 ?auto_27555 ) ) ( not ( = ?auto_27563 ?auto_27575 ) ) ( not ( = ?auto_27563 ?auto_27570 ) ) ( not ( = ?auto_27563 ?auto_27565 ) ) ( not ( = ?auto_27579 ?auto_27562 ) ) ( not ( = ?auto_27579 ?auto_27584 ) ) ( not ( = ?auto_27579 ?auto_27574 ) ) ( not ( = ?auto_27579 ?auto_27582 ) ) ( not ( = ?auto_27579 ?auto_27556 ) ) ( not ( = ?auto_27579 ?auto_27580 ) ) ( not ( = ?auto_27579 ?auto_27564 ) ) ( not ( = ?auto_27579 ?auto_27566 ) ) ( not ( = ?auto_27571 ?auto_27559 ) ) ( not ( = ?auto_27571 ?auto_27573 ) ) ( not ( = ?auto_27571 ?auto_27568 ) ) ( not ( = ?auto_27571 ?auto_27572 ) ) ( not ( = ?auto_27571 ?auto_27567 ) ) ( not ( = ?auto_27571 ?auto_27577 ) ) ( not ( = ?auto_27571 ?auto_27583 ) ) ( not ( = ?auto_27571 ?auto_27578 ) ) ( not ( = ?auto_27571 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27550 ) ) ( not ( = ?auto_27540 ?auto_27561 ) ) ( not ( = ?auto_27541 ?auto_27550 ) ) ( not ( = ?auto_27541 ?auto_27561 ) ) ( not ( = ?auto_27542 ?auto_27550 ) ) ( not ( = ?auto_27542 ?auto_27561 ) ) ( not ( = ?auto_27543 ?auto_27550 ) ) ( not ( = ?auto_27543 ?auto_27561 ) ) ( not ( = ?auto_27544 ?auto_27550 ) ) ( not ( = ?auto_27544 ?auto_27561 ) ) ( not ( = ?auto_27545 ?auto_27550 ) ) ( not ( = ?auto_27545 ?auto_27561 ) ) ( not ( = ?auto_27548 ?auto_27550 ) ) ( not ( = ?auto_27548 ?auto_27561 ) ) ( not ( = ?auto_27547 ?auto_27550 ) ) ( not ( = ?auto_27547 ?auto_27561 ) ) ( not ( = ?auto_27546 ?auto_27550 ) ) ( not ( = ?auto_27546 ?auto_27561 ) ) ( not ( = ?auto_27549 ?auto_27550 ) ) ( not ( = ?auto_27549 ?auto_27561 ) ) ( not ( = ?auto_27550 ?auto_27571 ) ) ( not ( = ?auto_27550 ?auto_27559 ) ) ( not ( = ?auto_27550 ?auto_27573 ) ) ( not ( = ?auto_27550 ?auto_27568 ) ) ( not ( = ?auto_27550 ?auto_27572 ) ) ( not ( = ?auto_27550 ?auto_27567 ) ) ( not ( = ?auto_27550 ?auto_27577 ) ) ( not ( = ?auto_27550 ?auto_27583 ) ) ( not ( = ?auto_27550 ?auto_27578 ) ) ( not ( = ?auto_27550 ?auto_27585 ) ) ( not ( = ?auto_27561 ?auto_27571 ) ) ( not ( = ?auto_27561 ?auto_27559 ) ) ( not ( = ?auto_27561 ?auto_27573 ) ) ( not ( = ?auto_27561 ?auto_27568 ) ) ( not ( = ?auto_27561 ?auto_27572 ) ) ( not ( = ?auto_27561 ?auto_27567 ) ) ( not ( = ?auto_27561 ?auto_27577 ) ) ( not ( = ?auto_27561 ?auto_27583 ) ) ( not ( = ?auto_27561 ?auto_27578 ) ) ( not ( = ?auto_27561 ?auto_27585 ) ) ( not ( = ?auto_27540 ?auto_27552 ) ) ( not ( = ?auto_27540 ?auto_27558 ) ) ( not ( = ?auto_27541 ?auto_27552 ) ) ( not ( = ?auto_27541 ?auto_27558 ) ) ( not ( = ?auto_27542 ?auto_27552 ) ) ( not ( = ?auto_27542 ?auto_27558 ) ) ( not ( = ?auto_27543 ?auto_27552 ) ) ( not ( = ?auto_27543 ?auto_27558 ) ) ( not ( = ?auto_27544 ?auto_27552 ) ) ( not ( = ?auto_27544 ?auto_27558 ) ) ( not ( = ?auto_27545 ?auto_27552 ) ) ( not ( = ?auto_27545 ?auto_27558 ) ) ( not ( = ?auto_27548 ?auto_27552 ) ) ( not ( = ?auto_27548 ?auto_27558 ) ) ( not ( = ?auto_27547 ?auto_27552 ) ) ( not ( = ?auto_27547 ?auto_27558 ) ) ( not ( = ?auto_27546 ?auto_27552 ) ) ( not ( = ?auto_27546 ?auto_27558 ) ) ( not ( = ?auto_27549 ?auto_27552 ) ) ( not ( = ?auto_27549 ?auto_27558 ) ) ( not ( = ?auto_27551 ?auto_27552 ) ) ( not ( = ?auto_27551 ?auto_27558 ) ) ( not ( = ?auto_27552 ?auto_27561 ) ) ( not ( = ?auto_27552 ?auto_27571 ) ) ( not ( = ?auto_27552 ?auto_27559 ) ) ( not ( = ?auto_27552 ?auto_27573 ) ) ( not ( = ?auto_27552 ?auto_27568 ) ) ( not ( = ?auto_27552 ?auto_27572 ) ) ( not ( = ?auto_27552 ?auto_27567 ) ) ( not ( = ?auto_27552 ?auto_27577 ) ) ( not ( = ?auto_27552 ?auto_27583 ) ) ( not ( = ?auto_27552 ?auto_27578 ) ) ( not ( = ?auto_27552 ?auto_27585 ) ) ( not ( = ?auto_27558 ?auto_27561 ) ) ( not ( = ?auto_27558 ?auto_27571 ) ) ( not ( = ?auto_27558 ?auto_27559 ) ) ( not ( = ?auto_27558 ?auto_27573 ) ) ( not ( = ?auto_27558 ?auto_27568 ) ) ( not ( = ?auto_27558 ?auto_27572 ) ) ( not ( = ?auto_27558 ?auto_27567 ) ) ( not ( = ?auto_27558 ?auto_27577 ) ) ( not ( = ?auto_27558 ?auto_27583 ) ) ( not ( = ?auto_27558 ?auto_27578 ) ) ( not ( = ?auto_27558 ?auto_27585 ) ) )
    :subtasks
    ( ( MAKE-11CRATE ?auto_27540 ?auto_27541 ?auto_27542 ?auto_27543 ?auto_27544 ?auto_27545 ?auto_27548 ?auto_27547 ?auto_27546 ?auto_27549 ?auto_27551 ?auto_27550 )
      ( MAKE-1CRATE ?auto_27550 ?auto_27552 )
      ( MAKE-12CRATE-VERIFY ?auto_27540 ?auto_27541 ?auto_27542 ?auto_27543 ?auto_27544 ?auto_27545 ?auto_27548 ?auto_27547 ?auto_27546 ?auto_27549 ?auto_27551 ?auto_27550 ?auto_27552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27588 - SURFACE
      ?auto_27589 - SURFACE
    )
    :vars
    (
      ?auto_27590 - HOIST
      ?auto_27591 - PLACE
      ?auto_27593 - PLACE
      ?auto_27594 - HOIST
      ?auto_27595 - SURFACE
      ?auto_27592 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27590 ?auto_27591 ) ( SURFACE-AT ?auto_27588 ?auto_27591 ) ( CLEAR ?auto_27588 ) ( IS-CRATE ?auto_27589 ) ( AVAILABLE ?auto_27590 ) ( not ( = ?auto_27593 ?auto_27591 ) ) ( HOIST-AT ?auto_27594 ?auto_27593 ) ( AVAILABLE ?auto_27594 ) ( SURFACE-AT ?auto_27589 ?auto_27593 ) ( ON ?auto_27589 ?auto_27595 ) ( CLEAR ?auto_27589 ) ( TRUCK-AT ?auto_27592 ?auto_27591 ) ( not ( = ?auto_27588 ?auto_27589 ) ) ( not ( = ?auto_27588 ?auto_27595 ) ) ( not ( = ?auto_27589 ?auto_27595 ) ) ( not ( = ?auto_27590 ?auto_27594 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27592 ?auto_27591 ?auto_27593 )
      ( !LIFT ?auto_27594 ?auto_27589 ?auto_27595 ?auto_27593 )
      ( !LOAD ?auto_27594 ?auto_27589 ?auto_27592 ?auto_27593 )
      ( !DRIVE ?auto_27592 ?auto_27593 ?auto_27591 )
      ( !UNLOAD ?auto_27590 ?auto_27589 ?auto_27592 ?auto_27591 )
      ( !DROP ?auto_27590 ?auto_27589 ?auto_27588 ?auto_27591 )
      ( MAKE-1CRATE-VERIFY ?auto_27588 ?auto_27589 ) )
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
      ?auto_27618 - SURFACE
      ?auto_27617 - SURFACE
      ?auto_27616 - SURFACE
      ?auto_27619 - SURFACE
      ?auto_27621 - SURFACE
      ?auto_27620 - SURFACE
      ?auto_27622 - SURFACE
      ?auto_27623 - SURFACE
    )
    :vars
    (
      ?auto_27627 - HOIST
      ?auto_27629 - PLACE
      ?auto_27626 - PLACE
      ?auto_27628 - HOIST
      ?auto_27624 - SURFACE
      ?auto_27640 - PLACE
      ?auto_27648 - HOIST
      ?auto_27647 - SURFACE
      ?auto_27656 - PLACE
      ?auto_27644 - HOIST
      ?auto_27637 - SURFACE
      ?auto_27657 - PLACE
      ?auto_27655 - HOIST
      ?auto_27649 - SURFACE
      ?auto_27632 - PLACE
      ?auto_27643 - HOIST
      ?auto_27630 - SURFACE
      ?auto_27641 - PLACE
      ?auto_27635 - HOIST
      ?auto_27631 - SURFACE
      ?auto_27651 - PLACE
      ?auto_27652 - HOIST
      ?auto_27638 - SURFACE
      ?auto_27653 - PLACE
      ?auto_27646 - HOIST
      ?auto_27650 - SURFACE
      ?auto_27654 - SURFACE
      ?auto_27645 - SURFACE
      ?auto_27636 - PLACE
      ?auto_27639 - HOIST
      ?auto_27642 - SURFACE
      ?auto_27633 - SURFACE
      ?auto_27634 - SURFACE
      ?auto_27625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27627 ?auto_27629 ) ( IS-CRATE ?auto_27623 ) ( not ( = ?auto_27626 ?auto_27629 ) ) ( HOIST-AT ?auto_27628 ?auto_27626 ) ( SURFACE-AT ?auto_27623 ?auto_27626 ) ( ON ?auto_27623 ?auto_27624 ) ( CLEAR ?auto_27623 ) ( not ( = ?auto_27622 ?auto_27623 ) ) ( not ( = ?auto_27622 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27624 ) ) ( not ( = ?auto_27627 ?auto_27628 ) ) ( IS-CRATE ?auto_27622 ) ( not ( = ?auto_27640 ?auto_27629 ) ) ( HOIST-AT ?auto_27648 ?auto_27640 ) ( SURFACE-AT ?auto_27622 ?auto_27640 ) ( ON ?auto_27622 ?auto_27647 ) ( CLEAR ?auto_27622 ) ( not ( = ?auto_27620 ?auto_27622 ) ) ( not ( = ?auto_27620 ?auto_27647 ) ) ( not ( = ?auto_27622 ?auto_27647 ) ) ( not ( = ?auto_27627 ?auto_27648 ) ) ( IS-CRATE ?auto_27620 ) ( not ( = ?auto_27656 ?auto_27629 ) ) ( HOIST-AT ?auto_27644 ?auto_27656 ) ( SURFACE-AT ?auto_27620 ?auto_27656 ) ( ON ?auto_27620 ?auto_27637 ) ( CLEAR ?auto_27620 ) ( not ( = ?auto_27621 ?auto_27620 ) ) ( not ( = ?auto_27621 ?auto_27637 ) ) ( not ( = ?auto_27620 ?auto_27637 ) ) ( not ( = ?auto_27627 ?auto_27644 ) ) ( IS-CRATE ?auto_27621 ) ( not ( = ?auto_27657 ?auto_27629 ) ) ( HOIST-AT ?auto_27655 ?auto_27657 ) ( AVAILABLE ?auto_27655 ) ( SURFACE-AT ?auto_27621 ?auto_27657 ) ( ON ?auto_27621 ?auto_27649 ) ( CLEAR ?auto_27621 ) ( not ( = ?auto_27619 ?auto_27621 ) ) ( not ( = ?auto_27619 ?auto_27649 ) ) ( not ( = ?auto_27621 ?auto_27649 ) ) ( not ( = ?auto_27627 ?auto_27655 ) ) ( IS-CRATE ?auto_27619 ) ( not ( = ?auto_27632 ?auto_27629 ) ) ( HOIST-AT ?auto_27643 ?auto_27632 ) ( AVAILABLE ?auto_27643 ) ( SURFACE-AT ?auto_27619 ?auto_27632 ) ( ON ?auto_27619 ?auto_27630 ) ( CLEAR ?auto_27619 ) ( not ( = ?auto_27616 ?auto_27619 ) ) ( not ( = ?auto_27616 ?auto_27630 ) ) ( not ( = ?auto_27619 ?auto_27630 ) ) ( not ( = ?auto_27627 ?auto_27643 ) ) ( IS-CRATE ?auto_27616 ) ( not ( = ?auto_27641 ?auto_27629 ) ) ( HOIST-AT ?auto_27635 ?auto_27641 ) ( AVAILABLE ?auto_27635 ) ( SURFACE-AT ?auto_27616 ?auto_27641 ) ( ON ?auto_27616 ?auto_27631 ) ( CLEAR ?auto_27616 ) ( not ( = ?auto_27617 ?auto_27616 ) ) ( not ( = ?auto_27617 ?auto_27631 ) ) ( not ( = ?auto_27616 ?auto_27631 ) ) ( not ( = ?auto_27627 ?auto_27635 ) ) ( IS-CRATE ?auto_27617 ) ( not ( = ?auto_27651 ?auto_27629 ) ) ( HOIST-AT ?auto_27652 ?auto_27651 ) ( AVAILABLE ?auto_27652 ) ( SURFACE-AT ?auto_27617 ?auto_27651 ) ( ON ?auto_27617 ?auto_27638 ) ( CLEAR ?auto_27617 ) ( not ( = ?auto_27618 ?auto_27617 ) ) ( not ( = ?auto_27618 ?auto_27638 ) ) ( not ( = ?auto_27617 ?auto_27638 ) ) ( not ( = ?auto_27627 ?auto_27652 ) ) ( IS-CRATE ?auto_27618 ) ( not ( = ?auto_27653 ?auto_27629 ) ) ( HOIST-AT ?auto_27646 ?auto_27653 ) ( AVAILABLE ?auto_27646 ) ( SURFACE-AT ?auto_27618 ?auto_27653 ) ( ON ?auto_27618 ?auto_27650 ) ( CLEAR ?auto_27618 ) ( not ( = ?auto_27615 ?auto_27618 ) ) ( not ( = ?auto_27615 ?auto_27650 ) ) ( not ( = ?auto_27618 ?auto_27650 ) ) ( not ( = ?auto_27627 ?auto_27646 ) ) ( IS-CRATE ?auto_27615 ) ( SURFACE-AT ?auto_27615 ?auto_27640 ) ( ON ?auto_27615 ?auto_27654 ) ( CLEAR ?auto_27615 ) ( not ( = ?auto_27614 ?auto_27615 ) ) ( not ( = ?auto_27614 ?auto_27654 ) ) ( not ( = ?auto_27615 ?auto_27654 ) ) ( IS-CRATE ?auto_27614 ) ( AVAILABLE ?auto_27648 ) ( SURFACE-AT ?auto_27614 ?auto_27640 ) ( ON ?auto_27614 ?auto_27645 ) ( CLEAR ?auto_27614 ) ( not ( = ?auto_27613 ?auto_27614 ) ) ( not ( = ?auto_27613 ?auto_27645 ) ) ( not ( = ?auto_27614 ?auto_27645 ) ) ( IS-CRATE ?auto_27613 ) ( not ( = ?auto_27636 ?auto_27629 ) ) ( HOIST-AT ?auto_27639 ?auto_27636 ) ( AVAILABLE ?auto_27639 ) ( SURFACE-AT ?auto_27613 ?auto_27636 ) ( ON ?auto_27613 ?auto_27642 ) ( CLEAR ?auto_27613 ) ( not ( = ?auto_27612 ?auto_27613 ) ) ( not ( = ?auto_27612 ?auto_27642 ) ) ( not ( = ?auto_27613 ?auto_27642 ) ) ( not ( = ?auto_27627 ?auto_27639 ) ) ( IS-CRATE ?auto_27612 ) ( AVAILABLE ?auto_27644 ) ( SURFACE-AT ?auto_27612 ?auto_27656 ) ( ON ?auto_27612 ?auto_27633 ) ( CLEAR ?auto_27612 ) ( not ( = ?auto_27611 ?auto_27612 ) ) ( not ( = ?auto_27611 ?auto_27633 ) ) ( not ( = ?auto_27612 ?auto_27633 ) ) ( SURFACE-AT ?auto_27610 ?auto_27629 ) ( CLEAR ?auto_27610 ) ( IS-CRATE ?auto_27611 ) ( AVAILABLE ?auto_27627 ) ( AVAILABLE ?auto_27628 ) ( SURFACE-AT ?auto_27611 ?auto_27626 ) ( ON ?auto_27611 ?auto_27634 ) ( CLEAR ?auto_27611 ) ( TRUCK-AT ?auto_27625 ?auto_27629 ) ( not ( = ?auto_27610 ?auto_27611 ) ) ( not ( = ?auto_27610 ?auto_27634 ) ) ( not ( = ?auto_27611 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27612 ) ) ( not ( = ?auto_27610 ?auto_27633 ) ) ( not ( = ?auto_27612 ?auto_27634 ) ) ( not ( = ?auto_27656 ?auto_27626 ) ) ( not ( = ?auto_27644 ?auto_27628 ) ) ( not ( = ?auto_27633 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27613 ) ) ( not ( = ?auto_27610 ?auto_27642 ) ) ( not ( = ?auto_27611 ?auto_27613 ) ) ( not ( = ?auto_27611 ?auto_27642 ) ) ( not ( = ?auto_27613 ?auto_27633 ) ) ( not ( = ?auto_27613 ?auto_27634 ) ) ( not ( = ?auto_27636 ?auto_27656 ) ) ( not ( = ?auto_27636 ?auto_27626 ) ) ( not ( = ?auto_27639 ?auto_27644 ) ) ( not ( = ?auto_27639 ?auto_27628 ) ) ( not ( = ?auto_27642 ?auto_27633 ) ) ( not ( = ?auto_27642 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27614 ) ) ( not ( = ?auto_27610 ?auto_27645 ) ) ( not ( = ?auto_27611 ?auto_27614 ) ) ( not ( = ?auto_27611 ?auto_27645 ) ) ( not ( = ?auto_27612 ?auto_27614 ) ) ( not ( = ?auto_27612 ?auto_27645 ) ) ( not ( = ?auto_27614 ?auto_27642 ) ) ( not ( = ?auto_27614 ?auto_27633 ) ) ( not ( = ?auto_27614 ?auto_27634 ) ) ( not ( = ?auto_27640 ?auto_27636 ) ) ( not ( = ?auto_27640 ?auto_27656 ) ) ( not ( = ?auto_27640 ?auto_27626 ) ) ( not ( = ?auto_27648 ?auto_27639 ) ) ( not ( = ?auto_27648 ?auto_27644 ) ) ( not ( = ?auto_27648 ?auto_27628 ) ) ( not ( = ?auto_27645 ?auto_27642 ) ) ( not ( = ?auto_27645 ?auto_27633 ) ) ( not ( = ?auto_27645 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27615 ) ) ( not ( = ?auto_27610 ?auto_27654 ) ) ( not ( = ?auto_27611 ?auto_27615 ) ) ( not ( = ?auto_27611 ?auto_27654 ) ) ( not ( = ?auto_27612 ?auto_27615 ) ) ( not ( = ?auto_27612 ?auto_27654 ) ) ( not ( = ?auto_27613 ?auto_27615 ) ) ( not ( = ?auto_27613 ?auto_27654 ) ) ( not ( = ?auto_27615 ?auto_27645 ) ) ( not ( = ?auto_27615 ?auto_27642 ) ) ( not ( = ?auto_27615 ?auto_27633 ) ) ( not ( = ?auto_27615 ?auto_27634 ) ) ( not ( = ?auto_27654 ?auto_27645 ) ) ( not ( = ?auto_27654 ?auto_27642 ) ) ( not ( = ?auto_27654 ?auto_27633 ) ) ( not ( = ?auto_27654 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27618 ) ) ( not ( = ?auto_27610 ?auto_27650 ) ) ( not ( = ?auto_27611 ?auto_27618 ) ) ( not ( = ?auto_27611 ?auto_27650 ) ) ( not ( = ?auto_27612 ?auto_27618 ) ) ( not ( = ?auto_27612 ?auto_27650 ) ) ( not ( = ?auto_27613 ?auto_27618 ) ) ( not ( = ?auto_27613 ?auto_27650 ) ) ( not ( = ?auto_27614 ?auto_27618 ) ) ( not ( = ?auto_27614 ?auto_27650 ) ) ( not ( = ?auto_27618 ?auto_27654 ) ) ( not ( = ?auto_27618 ?auto_27645 ) ) ( not ( = ?auto_27618 ?auto_27642 ) ) ( not ( = ?auto_27618 ?auto_27633 ) ) ( not ( = ?auto_27618 ?auto_27634 ) ) ( not ( = ?auto_27653 ?auto_27640 ) ) ( not ( = ?auto_27653 ?auto_27636 ) ) ( not ( = ?auto_27653 ?auto_27656 ) ) ( not ( = ?auto_27653 ?auto_27626 ) ) ( not ( = ?auto_27646 ?auto_27648 ) ) ( not ( = ?auto_27646 ?auto_27639 ) ) ( not ( = ?auto_27646 ?auto_27644 ) ) ( not ( = ?auto_27646 ?auto_27628 ) ) ( not ( = ?auto_27650 ?auto_27654 ) ) ( not ( = ?auto_27650 ?auto_27645 ) ) ( not ( = ?auto_27650 ?auto_27642 ) ) ( not ( = ?auto_27650 ?auto_27633 ) ) ( not ( = ?auto_27650 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27617 ) ) ( not ( = ?auto_27610 ?auto_27638 ) ) ( not ( = ?auto_27611 ?auto_27617 ) ) ( not ( = ?auto_27611 ?auto_27638 ) ) ( not ( = ?auto_27612 ?auto_27617 ) ) ( not ( = ?auto_27612 ?auto_27638 ) ) ( not ( = ?auto_27613 ?auto_27617 ) ) ( not ( = ?auto_27613 ?auto_27638 ) ) ( not ( = ?auto_27614 ?auto_27617 ) ) ( not ( = ?auto_27614 ?auto_27638 ) ) ( not ( = ?auto_27615 ?auto_27617 ) ) ( not ( = ?auto_27615 ?auto_27638 ) ) ( not ( = ?auto_27617 ?auto_27650 ) ) ( not ( = ?auto_27617 ?auto_27654 ) ) ( not ( = ?auto_27617 ?auto_27645 ) ) ( not ( = ?auto_27617 ?auto_27642 ) ) ( not ( = ?auto_27617 ?auto_27633 ) ) ( not ( = ?auto_27617 ?auto_27634 ) ) ( not ( = ?auto_27651 ?auto_27653 ) ) ( not ( = ?auto_27651 ?auto_27640 ) ) ( not ( = ?auto_27651 ?auto_27636 ) ) ( not ( = ?auto_27651 ?auto_27656 ) ) ( not ( = ?auto_27651 ?auto_27626 ) ) ( not ( = ?auto_27652 ?auto_27646 ) ) ( not ( = ?auto_27652 ?auto_27648 ) ) ( not ( = ?auto_27652 ?auto_27639 ) ) ( not ( = ?auto_27652 ?auto_27644 ) ) ( not ( = ?auto_27652 ?auto_27628 ) ) ( not ( = ?auto_27638 ?auto_27650 ) ) ( not ( = ?auto_27638 ?auto_27654 ) ) ( not ( = ?auto_27638 ?auto_27645 ) ) ( not ( = ?auto_27638 ?auto_27642 ) ) ( not ( = ?auto_27638 ?auto_27633 ) ) ( not ( = ?auto_27638 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27616 ) ) ( not ( = ?auto_27610 ?auto_27631 ) ) ( not ( = ?auto_27611 ?auto_27616 ) ) ( not ( = ?auto_27611 ?auto_27631 ) ) ( not ( = ?auto_27612 ?auto_27616 ) ) ( not ( = ?auto_27612 ?auto_27631 ) ) ( not ( = ?auto_27613 ?auto_27616 ) ) ( not ( = ?auto_27613 ?auto_27631 ) ) ( not ( = ?auto_27614 ?auto_27616 ) ) ( not ( = ?auto_27614 ?auto_27631 ) ) ( not ( = ?auto_27615 ?auto_27616 ) ) ( not ( = ?auto_27615 ?auto_27631 ) ) ( not ( = ?auto_27618 ?auto_27616 ) ) ( not ( = ?auto_27618 ?auto_27631 ) ) ( not ( = ?auto_27616 ?auto_27638 ) ) ( not ( = ?auto_27616 ?auto_27650 ) ) ( not ( = ?auto_27616 ?auto_27654 ) ) ( not ( = ?auto_27616 ?auto_27645 ) ) ( not ( = ?auto_27616 ?auto_27642 ) ) ( not ( = ?auto_27616 ?auto_27633 ) ) ( not ( = ?auto_27616 ?auto_27634 ) ) ( not ( = ?auto_27641 ?auto_27651 ) ) ( not ( = ?auto_27641 ?auto_27653 ) ) ( not ( = ?auto_27641 ?auto_27640 ) ) ( not ( = ?auto_27641 ?auto_27636 ) ) ( not ( = ?auto_27641 ?auto_27656 ) ) ( not ( = ?auto_27641 ?auto_27626 ) ) ( not ( = ?auto_27635 ?auto_27652 ) ) ( not ( = ?auto_27635 ?auto_27646 ) ) ( not ( = ?auto_27635 ?auto_27648 ) ) ( not ( = ?auto_27635 ?auto_27639 ) ) ( not ( = ?auto_27635 ?auto_27644 ) ) ( not ( = ?auto_27635 ?auto_27628 ) ) ( not ( = ?auto_27631 ?auto_27638 ) ) ( not ( = ?auto_27631 ?auto_27650 ) ) ( not ( = ?auto_27631 ?auto_27654 ) ) ( not ( = ?auto_27631 ?auto_27645 ) ) ( not ( = ?auto_27631 ?auto_27642 ) ) ( not ( = ?auto_27631 ?auto_27633 ) ) ( not ( = ?auto_27631 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27619 ) ) ( not ( = ?auto_27610 ?auto_27630 ) ) ( not ( = ?auto_27611 ?auto_27619 ) ) ( not ( = ?auto_27611 ?auto_27630 ) ) ( not ( = ?auto_27612 ?auto_27619 ) ) ( not ( = ?auto_27612 ?auto_27630 ) ) ( not ( = ?auto_27613 ?auto_27619 ) ) ( not ( = ?auto_27613 ?auto_27630 ) ) ( not ( = ?auto_27614 ?auto_27619 ) ) ( not ( = ?auto_27614 ?auto_27630 ) ) ( not ( = ?auto_27615 ?auto_27619 ) ) ( not ( = ?auto_27615 ?auto_27630 ) ) ( not ( = ?auto_27618 ?auto_27619 ) ) ( not ( = ?auto_27618 ?auto_27630 ) ) ( not ( = ?auto_27617 ?auto_27619 ) ) ( not ( = ?auto_27617 ?auto_27630 ) ) ( not ( = ?auto_27619 ?auto_27631 ) ) ( not ( = ?auto_27619 ?auto_27638 ) ) ( not ( = ?auto_27619 ?auto_27650 ) ) ( not ( = ?auto_27619 ?auto_27654 ) ) ( not ( = ?auto_27619 ?auto_27645 ) ) ( not ( = ?auto_27619 ?auto_27642 ) ) ( not ( = ?auto_27619 ?auto_27633 ) ) ( not ( = ?auto_27619 ?auto_27634 ) ) ( not ( = ?auto_27632 ?auto_27641 ) ) ( not ( = ?auto_27632 ?auto_27651 ) ) ( not ( = ?auto_27632 ?auto_27653 ) ) ( not ( = ?auto_27632 ?auto_27640 ) ) ( not ( = ?auto_27632 ?auto_27636 ) ) ( not ( = ?auto_27632 ?auto_27656 ) ) ( not ( = ?auto_27632 ?auto_27626 ) ) ( not ( = ?auto_27643 ?auto_27635 ) ) ( not ( = ?auto_27643 ?auto_27652 ) ) ( not ( = ?auto_27643 ?auto_27646 ) ) ( not ( = ?auto_27643 ?auto_27648 ) ) ( not ( = ?auto_27643 ?auto_27639 ) ) ( not ( = ?auto_27643 ?auto_27644 ) ) ( not ( = ?auto_27643 ?auto_27628 ) ) ( not ( = ?auto_27630 ?auto_27631 ) ) ( not ( = ?auto_27630 ?auto_27638 ) ) ( not ( = ?auto_27630 ?auto_27650 ) ) ( not ( = ?auto_27630 ?auto_27654 ) ) ( not ( = ?auto_27630 ?auto_27645 ) ) ( not ( = ?auto_27630 ?auto_27642 ) ) ( not ( = ?auto_27630 ?auto_27633 ) ) ( not ( = ?auto_27630 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27621 ) ) ( not ( = ?auto_27610 ?auto_27649 ) ) ( not ( = ?auto_27611 ?auto_27621 ) ) ( not ( = ?auto_27611 ?auto_27649 ) ) ( not ( = ?auto_27612 ?auto_27621 ) ) ( not ( = ?auto_27612 ?auto_27649 ) ) ( not ( = ?auto_27613 ?auto_27621 ) ) ( not ( = ?auto_27613 ?auto_27649 ) ) ( not ( = ?auto_27614 ?auto_27621 ) ) ( not ( = ?auto_27614 ?auto_27649 ) ) ( not ( = ?auto_27615 ?auto_27621 ) ) ( not ( = ?auto_27615 ?auto_27649 ) ) ( not ( = ?auto_27618 ?auto_27621 ) ) ( not ( = ?auto_27618 ?auto_27649 ) ) ( not ( = ?auto_27617 ?auto_27621 ) ) ( not ( = ?auto_27617 ?auto_27649 ) ) ( not ( = ?auto_27616 ?auto_27621 ) ) ( not ( = ?auto_27616 ?auto_27649 ) ) ( not ( = ?auto_27621 ?auto_27630 ) ) ( not ( = ?auto_27621 ?auto_27631 ) ) ( not ( = ?auto_27621 ?auto_27638 ) ) ( not ( = ?auto_27621 ?auto_27650 ) ) ( not ( = ?auto_27621 ?auto_27654 ) ) ( not ( = ?auto_27621 ?auto_27645 ) ) ( not ( = ?auto_27621 ?auto_27642 ) ) ( not ( = ?auto_27621 ?auto_27633 ) ) ( not ( = ?auto_27621 ?auto_27634 ) ) ( not ( = ?auto_27657 ?auto_27632 ) ) ( not ( = ?auto_27657 ?auto_27641 ) ) ( not ( = ?auto_27657 ?auto_27651 ) ) ( not ( = ?auto_27657 ?auto_27653 ) ) ( not ( = ?auto_27657 ?auto_27640 ) ) ( not ( = ?auto_27657 ?auto_27636 ) ) ( not ( = ?auto_27657 ?auto_27656 ) ) ( not ( = ?auto_27657 ?auto_27626 ) ) ( not ( = ?auto_27655 ?auto_27643 ) ) ( not ( = ?auto_27655 ?auto_27635 ) ) ( not ( = ?auto_27655 ?auto_27652 ) ) ( not ( = ?auto_27655 ?auto_27646 ) ) ( not ( = ?auto_27655 ?auto_27648 ) ) ( not ( = ?auto_27655 ?auto_27639 ) ) ( not ( = ?auto_27655 ?auto_27644 ) ) ( not ( = ?auto_27655 ?auto_27628 ) ) ( not ( = ?auto_27649 ?auto_27630 ) ) ( not ( = ?auto_27649 ?auto_27631 ) ) ( not ( = ?auto_27649 ?auto_27638 ) ) ( not ( = ?auto_27649 ?auto_27650 ) ) ( not ( = ?auto_27649 ?auto_27654 ) ) ( not ( = ?auto_27649 ?auto_27645 ) ) ( not ( = ?auto_27649 ?auto_27642 ) ) ( not ( = ?auto_27649 ?auto_27633 ) ) ( not ( = ?auto_27649 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27620 ) ) ( not ( = ?auto_27610 ?auto_27637 ) ) ( not ( = ?auto_27611 ?auto_27620 ) ) ( not ( = ?auto_27611 ?auto_27637 ) ) ( not ( = ?auto_27612 ?auto_27620 ) ) ( not ( = ?auto_27612 ?auto_27637 ) ) ( not ( = ?auto_27613 ?auto_27620 ) ) ( not ( = ?auto_27613 ?auto_27637 ) ) ( not ( = ?auto_27614 ?auto_27620 ) ) ( not ( = ?auto_27614 ?auto_27637 ) ) ( not ( = ?auto_27615 ?auto_27620 ) ) ( not ( = ?auto_27615 ?auto_27637 ) ) ( not ( = ?auto_27618 ?auto_27620 ) ) ( not ( = ?auto_27618 ?auto_27637 ) ) ( not ( = ?auto_27617 ?auto_27620 ) ) ( not ( = ?auto_27617 ?auto_27637 ) ) ( not ( = ?auto_27616 ?auto_27620 ) ) ( not ( = ?auto_27616 ?auto_27637 ) ) ( not ( = ?auto_27619 ?auto_27620 ) ) ( not ( = ?auto_27619 ?auto_27637 ) ) ( not ( = ?auto_27620 ?auto_27649 ) ) ( not ( = ?auto_27620 ?auto_27630 ) ) ( not ( = ?auto_27620 ?auto_27631 ) ) ( not ( = ?auto_27620 ?auto_27638 ) ) ( not ( = ?auto_27620 ?auto_27650 ) ) ( not ( = ?auto_27620 ?auto_27654 ) ) ( not ( = ?auto_27620 ?auto_27645 ) ) ( not ( = ?auto_27620 ?auto_27642 ) ) ( not ( = ?auto_27620 ?auto_27633 ) ) ( not ( = ?auto_27620 ?auto_27634 ) ) ( not ( = ?auto_27637 ?auto_27649 ) ) ( not ( = ?auto_27637 ?auto_27630 ) ) ( not ( = ?auto_27637 ?auto_27631 ) ) ( not ( = ?auto_27637 ?auto_27638 ) ) ( not ( = ?auto_27637 ?auto_27650 ) ) ( not ( = ?auto_27637 ?auto_27654 ) ) ( not ( = ?auto_27637 ?auto_27645 ) ) ( not ( = ?auto_27637 ?auto_27642 ) ) ( not ( = ?auto_27637 ?auto_27633 ) ) ( not ( = ?auto_27637 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27622 ) ) ( not ( = ?auto_27610 ?auto_27647 ) ) ( not ( = ?auto_27611 ?auto_27622 ) ) ( not ( = ?auto_27611 ?auto_27647 ) ) ( not ( = ?auto_27612 ?auto_27622 ) ) ( not ( = ?auto_27612 ?auto_27647 ) ) ( not ( = ?auto_27613 ?auto_27622 ) ) ( not ( = ?auto_27613 ?auto_27647 ) ) ( not ( = ?auto_27614 ?auto_27622 ) ) ( not ( = ?auto_27614 ?auto_27647 ) ) ( not ( = ?auto_27615 ?auto_27622 ) ) ( not ( = ?auto_27615 ?auto_27647 ) ) ( not ( = ?auto_27618 ?auto_27622 ) ) ( not ( = ?auto_27618 ?auto_27647 ) ) ( not ( = ?auto_27617 ?auto_27622 ) ) ( not ( = ?auto_27617 ?auto_27647 ) ) ( not ( = ?auto_27616 ?auto_27622 ) ) ( not ( = ?auto_27616 ?auto_27647 ) ) ( not ( = ?auto_27619 ?auto_27622 ) ) ( not ( = ?auto_27619 ?auto_27647 ) ) ( not ( = ?auto_27621 ?auto_27622 ) ) ( not ( = ?auto_27621 ?auto_27647 ) ) ( not ( = ?auto_27622 ?auto_27637 ) ) ( not ( = ?auto_27622 ?auto_27649 ) ) ( not ( = ?auto_27622 ?auto_27630 ) ) ( not ( = ?auto_27622 ?auto_27631 ) ) ( not ( = ?auto_27622 ?auto_27638 ) ) ( not ( = ?auto_27622 ?auto_27650 ) ) ( not ( = ?auto_27622 ?auto_27654 ) ) ( not ( = ?auto_27622 ?auto_27645 ) ) ( not ( = ?auto_27622 ?auto_27642 ) ) ( not ( = ?auto_27622 ?auto_27633 ) ) ( not ( = ?auto_27622 ?auto_27634 ) ) ( not ( = ?auto_27647 ?auto_27637 ) ) ( not ( = ?auto_27647 ?auto_27649 ) ) ( not ( = ?auto_27647 ?auto_27630 ) ) ( not ( = ?auto_27647 ?auto_27631 ) ) ( not ( = ?auto_27647 ?auto_27638 ) ) ( not ( = ?auto_27647 ?auto_27650 ) ) ( not ( = ?auto_27647 ?auto_27654 ) ) ( not ( = ?auto_27647 ?auto_27645 ) ) ( not ( = ?auto_27647 ?auto_27642 ) ) ( not ( = ?auto_27647 ?auto_27633 ) ) ( not ( = ?auto_27647 ?auto_27634 ) ) ( not ( = ?auto_27610 ?auto_27623 ) ) ( not ( = ?auto_27610 ?auto_27624 ) ) ( not ( = ?auto_27611 ?auto_27623 ) ) ( not ( = ?auto_27611 ?auto_27624 ) ) ( not ( = ?auto_27612 ?auto_27623 ) ) ( not ( = ?auto_27612 ?auto_27624 ) ) ( not ( = ?auto_27613 ?auto_27623 ) ) ( not ( = ?auto_27613 ?auto_27624 ) ) ( not ( = ?auto_27614 ?auto_27623 ) ) ( not ( = ?auto_27614 ?auto_27624 ) ) ( not ( = ?auto_27615 ?auto_27623 ) ) ( not ( = ?auto_27615 ?auto_27624 ) ) ( not ( = ?auto_27618 ?auto_27623 ) ) ( not ( = ?auto_27618 ?auto_27624 ) ) ( not ( = ?auto_27617 ?auto_27623 ) ) ( not ( = ?auto_27617 ?auto_27624 ) ) ( not ( = ?auto_27616 ?auto_27623 ) ) ( not ( = ?auto_27616 ?auto_27624 ) ) ( not ( = ?auto_27619 ?auto_27623 ) ) ( not ( = ?auto_27619 ?auto_27624 ) ) ( not ( = ?auto_27621 ?auto_27623 ) ) ( not ( = ?auto_27621 ?auto_27624 ) ) ( not ( = ?auto_27620 ?auto_27623 ) ) ( not ( = ?auto_27620 ?auto_27624 ) ) ( not ( = ?auto_27623 ?auto_27647 ) ) ( not ( = ?auto_27623 ?auto_27637 ) ) ( not ( = ?auto_27623 ?auto_27649 ) ) ( not ( = ?auto_27623 ?auto_27630 ) ) ( not ( = ?auto_27623 ?auto_27631 ) ) ( not ( = ?auto_27623 ?auto_27638 ) ) ( not ( = ?auto_27623 ?auto_27650 ) ) ( not ( = ?auto_27623 ?auto_27654 ) ) ( not ( = ?auto_27623 ?auto_27645 ) ) ( not ( = ?auto_27623 ?auto_27642 ) ) ( not ( = ?auto_27623 ?auto_27633 ) ) ( not ( = ?auto_27623 ?auto_27634 ) ) ( not ( = ?auto_27624 ?auto_27647 ) ) ( not ( = ?auto_27624 ?auto_27637 ) ) ( not ( = ?auto_27624 ?auto_27649 ) ) ( not ( = ?auto_27624 ?auto_27630 ) ) ( not ( = ?auto_27624 ?auto_27631 ) ) ( not ( = ?auto_27624 ?auto_27638 ) ) ( not ( = ?auto_27624 ?auto_27650 ) ) ( not ( = ?auto_27624 ?auto_27654 ) ) ( not ( = ?auto_27624 ?auto_27645 ) ) ( not ( = ?auto_27624 ?auto_27642 ) ) ( not ( = ?auto_27624 ?auto_27633 ) ) ( not ( = ?auto_27624 ?auto_27634 ) ) )
    :subtasks
    ( ( MAKE-12CRATE ?auto_27610 ?auto_27611 ?auto_27612 ?auto_27613 ?auto_27614 ?auto_27615 ?auto_27618 ?auto_27617 ?auto_27616 ?auto_27619 ?auto_27621 ?auto_27620 ?auto_27622 )
      ( MAKE-1CRATE ?auto_27622 ?auto_27623 )
      ( MAKE-13CRATE-VERIFY ?auto_27610 ?auto_27611 ?auto_27612 ?auto_27613 ?auto_27614 ?auto_27615 ?auto_27618 ?auto_27617 ?auto_27616 ?auto_27619 ?auto_27621 ?auto_27620 ?auto_27622 ?auto_27623 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27660 - SURFACE
      ?auto_27661 - SURFACE
    )
    :vars
    (
      ?auto_27662 - HOIST
      ?auto_27663 - PLACE
      ?auto_27665 - PLACE
      ?auto_27666 - HOIST
      ?auto_27667 - SURFACE
      ?auto_27664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27662 ?auto_27663 ) ( SURFACE-AT ?auto_27660 ?auto_27663 ) ( CLEAR ?auto_27660 ) ( IS-CRATE ?auto_27661 ) ( AVAILABLE ?auto_27662 ) ( not ( = ?auto_27665 ?auto_27663 ) ) ( HOIST-AT ?auto_27666 ?auto_27665 ) ( AVAILABLE ?auto_27666 ) ( SURFACE-AT ?auto_27661 ?auto_27665 ) ( ON ?auto_27661 ?auto_27667 ) ( CLEAR ?auto_27661 ) ( TRUCK-AT ?auto_27664 ?auto_27663 ) ( not ( = ?auto_27660 ?auto_27661 ) ) ( not ( = ?auto_27660 ?auto_27667 ) ) ( not ( = ?auto_27661 ?auto_27667 ) ) ( not ( = ?auto_27662 ?auto_27666 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27664 ?auto_27663 ?auto_27665 )
      ( !LIFT ?auto_27666 ?auto_27661 ?auto_27667 ?auto_27665 )
      ( !LOAD ?auto_27666 ?auto_27661 ?auto_27664 ?auto_27665 )
      ( !DRIVE ?auto_27664 ?auto_27665 ?auto_27663 )
      ( !UNLOAD ?auto_27662 ?auto_27661 ?auto_27664 ?auto_27663 )
      ( !DROP ?auto_27662 ?auto_27661 ?auto_27660 ?auto_27663 )
      ( MAKE-1CRATE-VERIFY ?auto_27660 ?auto_27661 ) )
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
      ?auto_27691 - SURFACE
      ?auto_27690 - SURFACE
      ?auto_27689 - SURFACE
      ?auto_27692 - SURFACE
      ?auto_27694 - SURFACE
      ?auto_27693 - SURFACE
      ?auto_27695 - SURFACE
      ?auto_27697 - SURFACE
      ?auto_27696 - SURFACE
    )
    :vars
    (
      ?auto_27699 - HOIST
      ?auto_27703 - PLACE
      ?auto_27698 - PLACE
      ?auto_27700 - HOIST
      ?auto_27702 - SURFACE
      ?auto_27720 - PLACE
      ?auto_27726 - HOIST
      ?auto_27715 - SURFACE
      ?auto_27725 - PLACE
      ?auto_27722 - HOIST
      ?auto_27710 - SURFACE
      ?auto_27731 - PLACE
      ?auto_27706 - HOIST
      ?auto_27717 - SURFACE
      ?auto_27724 - PLACE
      ?auto_27713 - HOIST
      ?auto_27712 - SURFACE
      ?auto_27714 - PLACE
      ?auto_27723 - HOIST
      ?auto_27721 - SURFACE
      ?auto_27716 - SURFACE
      ?auto_27730 - PLACE
      ?auto_27719 - HOIST
      ?auto_27718 - SURFACE
      ?auto_27711 - PLACE
      ?auto_27705 - HOIST
      ?auto_27728 - SURFACE
      ?auto_27727 - SURFACE
      ?auto_27704 - SURFACE
      ?auto_27729 - PLACE
      ?auto_27709 - HOIST
      ?auto_27732 - SURFACE
      ?auto_27708 - SURFACE
      ?auto_27707 - SURFACE
      ?auto_27701 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27699 ?auto_27703 ) ( IS-CRATE ?auto_27696 ) ( not ( = ?auto_27698 ?auto_27703 ) ) ( HOIST-AT ?auto_27700 ?auto_27698 ) ( SURFACE-AT ?auto_27696 ?auto_27698 ) ( ON ?auto_27696 ?auto_27702 ) ( CLEAR ?auto_27696 ) ( not ( = ?auto_27697 ?auto_27696 ) ) ( not ( = ?auto_27697 ?auto_27702 ) ) ( not ( = ?auto_27696 ?auto_27702 ) ) ( not ( = ?auto_27699 ?auto_27700 ) ) ( IS-CRATE ?auto_27697 ) ( not ( = ?auto_27720 ?auto_27703 ) ) ( HOIST-AT ?auto_27726 ?auto_27720 ) ( SURFACE-AT ?auto_27697 ?auto_27720 ) ( ON ?auto_27697 ?auto_27715 ) ( CLEAR ?auto_27697 ) ( not ( = ?auto_27695 ?auto_27697 ) ) ( not ( = ?auto_27695 ?auto_27715 ) ) ( not ( = ?auto_27697 ?auto_27715 ) ) ( not ( = ?auto_27699 ?auto_27726 ) ) ( IS-CRATE ?auto_27695 ) ( not ( = ?auto_27725 ?auto_27703 ) ) ( HOIST-AT ?auto_27722 ?auto_27725 ) ( SURFACE-AT ?auto_27695 ?auto_27725 ) ( ON ?auto_27695 ?auto_27710 ) ( CLEAR ?auto_27695 ) ( not ( = ?auto_27693 ?auto_27695 ) ) ( not ( = ?auto_27693 ?auto_27710 ) ) ( not ( = ?auto_27695 ?auto_27710 ) ) ( not ( = ?auto_27699 ?auto_27722 ) ) ( IS-CRATE ?auto_27693 ) ( not ( = ?auto_27731 ?auto_27703 ) ) ( HOIST-AT ?auto_27706 ?auto_27731 ) ( SURFACE-AT ?auto_27693 ?auto_27731 ) ( ON ?auto_27693 ?auto_27717 ) ( CLEAR ?auto_27693 ) ( not ( = ?auto_27694 ?auto_27693 ) ) ( not ( = ?auto_27694 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27717 ) ) ( not ( = ?auto_27699 ?auto_27706 ) ) ( IS-CRATE ?auto_27694 ) ( not ( = ?auto_27724 ?auto_27703 ) ) ( HOIST-AT ?auto_27713 ?auto_27724 ) ( AVAILABLE ?auto_27713 ) ( SURFACE-AT ?auto_27694 ?auto_27724 ) ( ON ?auto_27694 ?auto_27712 ) ( CLEAR ?auto_27694 ) ( not ( = ?auto_27692 ?auto_27694 ) ) ( not ( = ?auto_27692 ?auto_27712 ) ) ( not ( = ?auto_27694 ?auto_27712 ) ) ( not ( = ?auto_27699 ?auto_27713 ) ) ( IS-CRATE ?auto_27692 ) ( not ( = ?auto_27714 ?auto_27703 ) ) ( HOIST-AT ?auto_27723 ?auto_27714 ) ( AVAILABLE ?auto_27723 ) ( SURFACE-AT ?auto_27692 ?auto_27714 ) ( ON ?auto_27692 ?auto_27721 ) ( CLEAR ?auto_27692 ) ( not ( = ?auto_27689 ?auto_27692 ) ) ( not ( = ?auto_27689 ?auto_27721 ) ) ( not ( = ?auto_27692 ?auto_27721 ) ) ( not ( = ?auto_27699 ?auto_27723 ) ) ( IS-CRATE ?auto_27689 ) ( AVAILABLE ?auto_27700 ) ( SURFACE-AT ?auto_27689 ?auto_27698 ) ( ON ?auto_27689 ?auto_27716 ) ( CLEAR ?auto_27689 ) ( not ( = ?auto_27690 ?auto_27689 ) ) ( not ( = ?auto_27690 ?auto_27716 ) ) ( not ( = ?auto_27689 ?auto_27716 ) ) ( IS-CRATE ?auto_27690 ) ( not ( = ?auto_27730 ?auto_27703 ) ) ( HOIST-AT ?auto_27719 ?auto_27730 ) ( AVAILABLE ?auto_27719 ) ( SURFACE-AT ?auto_27690 ?auto_27730 ) ( ON ?auto_27690 ?auto_27718 ) ( CLEAR ?auto_27690 ) ( not ( = ?auto_27691 ?auto_27690 ) ) ( not ( = ?auto_27691 ?auto_27718 ) ) ( not ( = ?auto_27690 ?auto_27718 ) ) ( not ( = ?auto_27699 ?auto_27719 ) ) ( IS-CRATE ?auto_27691 ) ( not ( = ?auto_27711 ?auto_27703 ) ) ( HOIST-AT ?auto_27705 ?auto_27711 ) ( AVAILABLE ?auto_27705 ) ( SURFACE-AT ?auto_27691 ?auto_27711 ) ( ON ?auto_27691 ?auto_27728 ) ( CLEAR ?auto_27691 ) ( not ( = ?auto_27688 ?auto_27691 ) ) ( not ( = ?auto_27688 ?auto_27728 ) ) ( not ( = ?auto_27691 ?auto_27728 ) ) ( not ( = ?auto_27699 ?auto_27705 ) ) ( IS-CRATE ?auto_27688 ) ( SURFACE-AT ?auto_27688 ?auto_27725 ) ( ON ?auto_27688 ?auto_27727 ) ( CLEAR ?auto_27688 ) ( not ( = ?auto_27687 ?auto_27688 ) ) ( not ( = ?auto_27687 ?auto_27727 ) ) ( not ( = ?auto_27688 ?auto_27727 ) ) ( IS-CRATE ?auto_27687 ) ( AVAILABLE ?auto_27722 ) ( SURFACE-AT ?auto_27687 ?auto_27725 ) ( ON ?auto_27687 ?auto_27704 ) ( CLEAR ?auto_27687 ) ( not ( = ?auto_27686 ?auto_27687 ) ) ( not ( = ?auto_27686 ?auto_27704 ) ) ( not ( = ?auto_27687 ?auto_27704 ) ) ( IS-CRATE ?auto_27686 ) ( not ( = ?auto_27729 ?auto_27703 ) ) ( HOIST-AT ?auto_27709 ?auto_27729 ) ( AVAILABLE ?auto_27709 ) ( SURFACE-AT ?auto_27686 ?auto_27729 ) ( ON ?auto_27686 ?auto_27732 ) ( CLEAR ?auto_27686 ) ( not ( = ?auto_27685 ?auto_27686 ) ) ( not ( = ?auto_27685 ?auto_27732 ) ) ( not ( = ?auto_27686 ?auto_27732 ) ) ( not ( = ?auto_27699 ?auto_27709 ) ) ( IS-CRATE ?auto_27685 ) ( AVAILABLE ?auto_27706 ) ( SURFACE-AT ?auto_27685 ?auto_27731 ) ( ON ?auto_27685 ?auto_27708 ) ( CLEAR ?auto_27685 ) ( not ( = ?auto_27684 ?auto_27685 ) ) ( not ( = ?auto_27684 ?auto_27708 ) ) ( not ( = ?auto_27685 ?auto_27708 ) ) ( SURFACE-AT ?auto_27683 ?auto_27703 ) ( CLEAR ?auto_27683 ) ( IS-CRATE ?auto_27684 ) ( AVAILABLE ?auto_27699 ) ( AVAILABLE ?auto_27726 ) ( SURFACE-AT ?auto_27684 ?auto_27720 ) ( ON ?auto_27684 ?auto_27707 ) ( CLEAR ?auto_27684 ) ( TRUCK-AT ?auto_27701 ?auto_27703 ) ( not ( = ?auto_27683 ?auto_27684 ) ) ( not ( = ?auto_27683 ?auto_27707 ) ) ( not ( = ?auto_27684 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27685 ) ) ( not ( = ?auto_27683 ?auto_27708 ) ) ( not ( = ?auto_27685 ?auto_27707 ) ) ( not ( = ?auto_27731 ?auto_27720 ) ) ( not ( = ?auto_27706 ?auto_27726 ) ) ( not ( = ?auto_27708 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27686 ) ) ( not ( = ?auto_27683 ?auto_27732 ) ) ( not ( = ?auto_27684 ?auto_27686 ) ) ( not ( = ?auto_27684 ?auto_27732 ) ) ( not ( = ?auto_27686 ?auto_27708 ) ) ( not ( = ?auto_27686 ?auto_27707 ) ) ( not ( = ?auto_27729 ?auto_27731 ) ) ( not ( = ?auto_27729 ?auto_27720 ) ) ( not ( = ?auto_27709 ?auto_27706 ) ) ( not ( = ?auto_27709 ?auto_27726 ) ) ( not ( = ?auto_27732 ?auto_27708 ) ) ( not ( = ?auto_27732 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27687 ) ) ( not ( = ?auto_27683 ?auto_27704 ) ) ( not ( = ?auto_27684 ?auto_27687 ) ) ( not ( = ?auto_27684 ?auto_27704 ) ) ( not ( = ?auto_27685 ?auto_27687 ) ) ( not ( = ?auto_27685 ?auto_27704 ) ) ( not ( = ?auto_27687 ?auto_27732 ) ) ( not ( = ?auto_27687 ?auto_27708 ) ) ( not ( = ?auto_27687 ?auto_27707 ) ) ( not ( = ?auto_27725 ?auto_27729 ) ) ( not ( = ?auto_27725 ?auto_27731 ) ) ( not ( = ?auto_27725 ?auto_27720 ) ) ( not ( = ?auto_27722 ?auto_27709 ) ) ( not ( = ?auto_27722 ?auto_27706 ) ) ( not ( = ?auto_27722 ?auto_27726 ) ) ( not ( = ?auto_27704 ?auto_27732 ) ) ( not ( = ?auto_27704 ?auto_27708 ) ) ( not ( = ?auto_27704 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27688 ) ) ( not ( = ?auto_27683 ?auto_27727 ) ) ( not ( = ?auto_27684 ?auto_27688 ) ) ( not ( = ?auto_27684 ?auto_27727 ) ) ( not ( = ?auto_27685 ?auto_27688 ) ) ( not ( = ?auto_27685 ?auto_27727 ) ) ( not ( = ?auto_27686 ?auto_27688 ) ) ( not ( = ?auto_27686 ?auto_27727 ) ) ( not ( = ?auto_27688 ?auto_27704 ) ) ( not ( = ?auto_27688 ?auto_27732 ) ) ( not ( = ?auto_27688 ?auto_27708 ) ) ( not ( = ?auto_27688 ?auto_27707 ) ) ( not ( = ?auto_27727 ?auto_27704 ) ) ( not ( = ?auto_27727 ?auto_27732 ) ) ( not ( = ?auto_27727 ?auto_27708 ) ) ( not ( = ?auto_27727 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27691 ) ) ( not ( = ?auto_27683 ?auto_27728 ) ) ( not ( = ?auto_27684 ?auto_27691 ) ) ( not ( = ?auto_27684 ?auto_27728 ) ) ( not ( = ?auto_27685 ?auto_27691 ) ) ( not ( = ?auto_27685 ?auto_27728 ) ) ( not ( = ?auto_27686 ?auto_27691 ) ) ( not ( = ?auto_27686 ?auto_27728 ) ) ( not ( = ?auto_27687 ?auto_27691 ) ) ( not ( = ?auto_27687 ?auto_27728 ) ) ( not ( = ?auto_27691 ?auto_27727 ) ) ( not ( = ?auto_27691 ?auto_27704 ) ) ( not ( = ?auto_27691 ?auto_27732 ) ) ( not ( = ?auto_27691 ?auto_27708 ) ) ( not ( = ?auto_27691 ?auto_27707 ) ) ( not ( = ?auto_27711 ?auto_27725 ) ) ( not ( = ?auto_27711 ?auto_27729 ) ) ( not ( = ?auto_27711 ?auto_27731 ) ) ( not ( = ?auto_27711 ?auto_27720 ) ) ( not ( = ?auto_27705 ?auto_27722 ) ) ( not ( = ?auto_27705 ?auto_27709 ) ) ( not ( = ?auto_27705 ?auto_27706 ) ) ( not ( = ?auto_27705 ?auto_27726 ) ) ( not ( = ?auto_27728 ?auto_27727 ) ) ( not ( = ?auto_27728 ?auto_27704 ) ) ( not ( = ?auto_27728 ?auto_27732 ) ) ( not ( = ?auto_27728 ?auto_27708 ) ) ( not ( = ?auto_27728 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27690 ) ) ( not ( = ?auto_27683 ?auto_27718 ) ) ( not ( = ?auto_27684 ?auto_27690 ) ) ( not ( = ?auto_27684 ?auto_27718 ) ) ( not ( = ?auto_27685 ?auto_27690 ) ) ( not ( = ?auto_27685 ?auto_27718 ) ) ( not ( = ?auto_27686 ?auto_27690 ) ) ( not ( = ?auto_27686 ?auto_27718 ) ) ( not ( = ?auto_27687 ?auto_27690 ) ) ( not ( = ?auto_27687 ?auto_27718 ) ) ( not ( = ?auto_27688 ?auto_27690 ) ) ( not ( = ?auto_27688 ?auto_27718 ) ) ( not ( = ?auto_27690 ?auto_27728 ) ) ( not ( = ?auto_27690 ?auto_27727 ) ) ( not ( = ?auto_27690 ?auto_27704 ) ) ( not ( = ?auto_27690 ?auto_27732 ) ) ( not ( = ?auto_27690 ?auto_27708 ) ) ( not ( = ?auto_27690 ?auto_27707 ) ) ( not ( = ?auto_27730 ?auto_27711 ) ) ( not ( = ?auto_27730 ?auto_27725 ) ) ( not ( = ?auto_27730 ?auto_27729 ) ) ( not ( = ?auto_27730 ?auto_27731 ) ) ( not ( = ?auto_27730 ?auto_27720 ) ) ( not ( = ?auto_27719 ?auto_27705 ) ) ( not ( = ?auto_27719 ?auto_27722 ) ) ( not ( = ?auto_27719 ?auto_27709 ) ) ( not ( = ?auto_27719 ?auto_27706 ) ) ( not ( = ?auto_27719 ?auto_27726 ) ) ( not ( = ?auto_27718 ?auto_27728 ) ) ( not ( = ?auto_27718 ?auto_27727 ) ) ( not ( = ?auto_27718 ?auto_27704 ) ) ( not ( = ?auto_27718 ?auto_27732 ) ) ( not ( = ?auto_27718 ?auto_27708 ) ) ( not ( = ?auto_27718 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27689 ) ) ( not ( = ?auto_27683 ?auto_27716 ) ) ( not ( = ?auto_27684 ?auto_27689 ) ) ( not ( = ?auto_27684 ?auto_27716 ) ) ( not ( = ?auto_27685 ?auto_27689 ) ) ( not ( = ?auto_27685 ?auto_27716 ) ) ( not ( = ?auto_27686 ?auto_27689 ) ) ( not ( = ?auto_27686 ?auto_27716 ) ) ( not ( = ?auto_27687 ?auto_27689 ) ) ( not ( = ?auto_27687 ?auto_27716 ) ) ( not ( = ?auto_27688 ?auto_27689 ) ) ( not ( = ?auto_27688 ?auto_27716 ) ) ( not ( = ?auto_27691 ?auto_27689 ) ) ( not ( = ?auto_27691 ?auto_27716 ) ) ( not ( = ?auto_27689 ?auto_27718 ) ) ( not ( = ?auto_27689 ?auto_27728 ) ) ( not ( = ?auto_27689 ?auto_27727 ) ) ( not ( = ?auto_27689 ?auto_27704 ) ) ( not ( = ?auto_27689 ?auto_27732 ) ) ( not ( = ?auto_27689 ?auto_27708 ) ) ( not ( = ?auto_27689 ?auto_27707 ) ) ( not ( = ?auto_27698 ?auto_27730 ) ) ( not ( = ?auto_27698 ?auto_27711 ) ) ( not ( = ?auto_27698 ?auto_27725 ) ) ( not ( = ?auto_27698 ?auto_27729 ) ) ( not ( = ?auto_27698 ?auto_27731 ) ) ( not ( = ?auto_27698 ?auto_27720 ) ) ( not ( = ?auto_27700 ?auto_27719 ) ) ( not ( = ?auto_27700 ?auto_27705 ) ) ( not ( = ?auto_27700 ?auto_27722 ) ) ( not ( = ?auto_27700 ?auto_27709 ) ) ( not ( = ?auto_27700 ?auto_27706 ) ) ( not ( = ?auto_27700 ?auto_27726 ) ) ( not ( = ?auto_27716 ?auto_27718 ) ) ( not ( = ?auto_27716 ?auto_27728 ) ) ( not ( = ?auto_27716 ?auto_27727 ) ) ( not ( = ?auto_27716 ?auto_27704 ) ) ( not ( = ?auto_27716 ?auto_27732 ) ) ( not ( = ?auto_27716 ?auto_27708 ) ) ( not ( = ?auto_27716 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27692 ) ) ( not ( = ?auto_27683 ?auto_27721 ) ) ( not ( = ?auto_27684 ?auto_27692 ) ) ( not ( = ?auto_27684 ?auto_27721 ) ) ( not ( = ?auto_27685 ?auto_27692 ) ) ( not ( = ?auto_27685 ?auto_27721 ) ) ( not ( = ?auto_27686 ?auto_27692 ) ) ( not ( = ?auto_27686 ?auto_27721 ) ) ( not ( = ?auto_27687 ?auto_27692 ) ) ( not ( = ?auto_27687 ?auto_27721 ) ) ( not ( = ?auto_27688 ?auto_27692 ) ) ( not ( = ?auto_27688 ?auto_27721 ) ) ( not ( = ?auto_27691 ?auto_27692 ) ) ( not ( = ?auto_27691 ?auto_27721 ) ) ( not ( = ?auto_27690 ?auto_27692 ) ) ( not ( = ?auto_27690 ?auto_27721 ) ) ( not ( = ?auto_27692 ?auto_27716 ) ) ( not ( = ?auto_27692 ?auto_27718 ) ) ( not ( = ?auto_27692 ?auto_27728 ) ) ( not ( = ?auto_27692 ?auto_27727 ) ) ( not ( = ?auto_27692 ?auto_27704 ) ) ( not ( = ?auto_27692 ?auto_27732 ) ) ( not ( = ?auto_27692 ?auto_27708 ) ) ( not ( = ?auto_27692 ?auto_27707 ) ) ( not ( = ?auto_27714 ?auto_27698 ) ) ( not ( = ?auto_27714 ?auto_27730 ) ) ( not ( = ?auto_27714 ?auto_27711 ) ) ( not ( = ?auto_27714 ?auto_27725 ) ) ( not ( = ?auto_27714 ?auto_27729 ) ) ( not ( = ?auto_27714 ?auto_27731 ) ) ( not ( = ?auto_27714 ?auto_27720 ) ) ( not ( = ?auto_27723 ?auto_27700 ) ) ( not ( = ?auto_27723 ?auto_27719 ) ) ( not ( = ?auto_27723 ?auto_27705 ) ) ( not ( = ?auto_27723 ?auto_27722 ) ) ( not ( = ?auto_27723 ?auto_27709 ) ) ( not ( = ?auto_27723 ?auto_27706 ) ) ( not ( = ?auto_27723 ?auto_27726 ) ) ( not ( = ?auto_27721 ?auto_27716 ) ) ( not ( = ?auto_27721 ?auto_27718 ) ) ( not ( = ?auto_27721 ?auto_27728 ) ) ( not ( = ?auto_27721 ?auto_27727 ) ) ( not ( = ?auto_27721 ?auto_27704 ) ) ( not ( = ?auto_27721 ?auto_27732 ) ) ( not ( = ?auto_27721 ?auto_27708 ) ) ( not ( = ?auto_27721 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27694 ) ) ( not ( = ?auto_27683 ?auto_27712 ) ) ( not ( = ?auto_27684 ?auto_27694 ) ) ( not ( = ?auto_27684 ?auto_27712 ) ) ( not ( = ?auto_27685 ?auto_27694 ) ) ( not ( = ?auto_27685 ?auto_27712 ) ) ( not ( = ?auto_27686 ?auto_27694 ) ) ( not ( = ?auto_27686 ?auto_27712 ) ) ( not ( = ?auto_27687 ?auto_27694 ) ) ( not ( = ?auto_27687 ?auto_27712 ) ) ( not ( = ?auto_27688 ?auto_27694 ) ) ( not ( = ?auto_27688 ?auto_27712 ) ) ( not ( = ?auto_27691 ?auto_27694 ) ) ( not ( = ?auto_27691 ?auto_27712 ) ) ( not ( = ?auto_27690 ?auto_27694 ) ) ( not ( = ?auto_27690 ?auto_27712 ) ) ( not ( = ?auto_27689 ?auto_27694 ) ) ( not ( = ?auto_27689 ?auto_27712 ) ) ( not ( = ?auto_27694 ?auto_27721 ) ) ( not ( = ?auto_27694 ?auto_27716 ) ) ( not ( = ?auto_27694 ?auto_27718 ) ) ( not ( = ?auto_27694 ?auto_27728 ) ) ( not ( = ?auto_27694 ?auto_27727 ) ) ( not ( = ?auto_27694 ?auto_27704 ) ) ( not ( = ?auto_27694 ?auto_27732 ) ) ( not ( = ?auto_27694 ?auto_27708 ) ) ( not ( = ?auto_27694 ?auto_27707 ) ) ( not ( = ?auto_27724 ?auto_27714 ) ) ( not ( = ?auto_27724 ?auto_27698 ) ) ( not ( = ?auto_27724 ?auto_27730 ) ) ( not ( = ?auto_27724 ?auto_27711 ) ) ( not ( = ?auto_27724 ?auto_27725 ) ) ( not ( = ?auto_27724 ?auto_27729 ) ) ( not ( = ?auto_27724 ?auto_27731 ) ) ( not ( = ?auto_27724 ?auto_27720 ) ) ( not ( = ?auto_27713 ?auto_27723 ) ) ( not ( = ?auto_27713 ?auto_27700 ) ) ( not ( = ?auto_27713 ?auto_27719 ) ) ( not ( = ?auto_27713 ?auto_27705 ) ) ( not ( = ?auto_27713 ?auto_27722 ) ) ( not ( = ?auto_27713 ?auto_27709 ) ) ( not ( = ?auto_27713 ?auto_27706 ) ) ( not ( = ?auto_27713 ?auto_27726 ) ) ( not ( = ?auto_27712 ?auto_27721 ) ) ( not ( = ?auto_27712 ?auto_27716 ) ) ( not ( = ?auto_27712 ?auto_27718 ) ) ( not ( = ?auto_27712 ?auto_27728 ) ) ( not ( = ?auto_27712 ?auto_27727 ) ) ( not ( = ?auto_27712 ?auto_27704 ) ) ( not ( = ?auto_27712 ?auto_27732 ) ) ( not ( = ?auto_27712 ?auto_27708 ) ) ( not ( = ?auto_27712 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27693 ) ) ( not ( = ?auto_27683 ?auto_27717 ) ) ( not ( = ?auto_27684 ?auto_27693 ) ) ( not ( = ?auto_27684 ?auto_27717 ) ) ( not ( = ?auto_27685 ?auto_27693 ) ) ( not ( = ?auto_27685 ?auto_27717 ) ) ( not ( = ?auto_27686 ?auto_27693 ) ) ( not ( = ?auto_27686 ?auto_27717 ) ) ( not ( = ?auto_27687 ?auto_27693 ) ) ( not ( = ?auto_27687 ?auto_27717 ) ) ( not ( = ?auto_27688 ?auto_27693 ) ) ( not ( = ?auto_27688 ?auto_27717 ) ) ( not ( = ?auto_27691 ?auto_27693 ) ) ( not ( = ?auto_27691 ?auto_27717 ) ) ( not ( = ?auto_27690 ?auto_27693 ) ) ( not ( = ?auto_27690 ?auto_27717 ) ) ( not ( = ?auto_27689 ?auto_27693 ) ) ( not ( = ?auto_27689 ?auto_27717 ) ) ( not ( = ?auto_27692 ?auto_27693 ) ) ( not ( = ?auto_27692 ?auto_27717 ) ) ( not ( = ?auto_27693 ?auto_27712 ) ) ( not ( = ?auto_27693 ?auto_27721 ) ) ( not ( = ?auto_27693 ?auto_27716 ) ) ( not ( = ?auto_27693 ?auto_27718 ) ) ( not ( = ?auto_27693 ?auto_27728 ) ) ( not ( = ?auto_27693 ?auto_27727 ) ) ( not ( = ?auto_27693 ?auto_27704 ) ) ( not ( = ?auto_27693 ?auto_27732 ) ) ( not ( = ?auto_27693 ?auto_27708 ) ) ( not ( = ?auto_27693 ?auto_27707 ) ) ( not ( = ?auto_27717 ?auto_27712 ) ) ( not ( = ?auto_27717 ?auto_27721 ) ) ( not ( = ?auto_27717 ?auto_27716 ) ) ( not ( = ?auto_27717 ?auto_27718 ) ) ( not ( = ?auto_27717 ?auto_27728 ) ) ( not ( = ?auto_27717 ?auto_27727 ) ) ( not ( = ?auto_27717 ?auto_27704 ) ) ( not ( = ?auto_27717 ?auto_27732 ) ) ( not ( = ?auto_27717 ?auto_27708 ) ) ( not ( = ?auto_27717 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27695 ) ) ( not ( = ?auto_27683 ?auto_27710 ) ) ( not ( = ?auto_27684 ?auto_27695 ) ) ( not ( = ?auto_27684 ?auto_27710 ) ) ( not ( = ?auto_27685 ?auto_27695 ) ) ( not ( = ?auto_27685 ?auto_27710 ) ) ( not ( = ?auto_27686 ?auto_27695 ) ) ( not ( = ?auto_27686 ?auto_27710 ) ) ( not ( = ?auto_27687 ?auto_27695 ) ) ( not ( = ?auto_27687 ?auto_27710 ) ) ( not ( = ?auto_27688 ?auto_27695 ) ) ( not ( = ?auto_27688 ?auto_27710 ) ) ( not ( = ?auto_27691 ?auto_27695 ) ) ( not ( = ?auto_27691 ?auto_27710 ) ) ( not ( = ?auto_27690 ?auto_27695 ) ) ( not ( = ?auto_27690 ?auto_27710 ) ) ( not ( = ?auto_27689 ?auto_27695 ) ) ( not ( = ?auto_27689 ?auto_27710 ) ) ( not ( = ?auto_27692 ?auto_27695 ) ) ( not ( = ?auto_27692 ?auto_27710 ) ) ( not ( = ?auto_27694 ?auto_27695 ) ) ( not ( = ?auto_27694 ?auto_27710 ) ) ( not ( = ?auto_27695 ?auto_27717 ) ) ( not ( = ?auto_27695 ?auto_27712 ) ) ( not ( = ?auto_27695 ?auto_27721 ) ) ( not ( = ?auto_27695 ?auto_27716 ) ) ( not ( = ?auto_27695 ?auto_27718 ) ) ( not ( = ?auto_27695 ?auto_27728 ) ) ( not ( = ?auto_27695 ?auto_27727 ) ) ( not ( = ?auto_27695 ?auto_27704 ) ) ( not ( = ?auto_27695 ?auto_27732 ) ) ( not ( = ?auto_27695 ?auto_27708 ) ) ( not ( = ?auto_27695 ?auto_27707 ) ) ( not ( = ?auto_27710 ?auto_27717 ) ) ( not ( = ?auto_27710 ?auto_27712 ) ) ( not ( = ?auto_27710 ?auto_27721 ) ) ( not ( = ?auto_27710 ?auto_27716 ) ) ( not ( = ?auto_27710 ?auto_27718 ) ) ( not ( = ?auto_27710 ?auto_27728 ) ) ( not ( = ?auto_27710 ?auto_27727 ) ) ( not ( = ?auto_27710 ?auto_27704 ) ) ( not ( = ?auto_27710 ?auto_27732 ) ) ( not ( = ?auto_27710 ?auto_27708 ) ) ( not ( = ?auto_27710 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27697 ) ) ( not ( = ?auto_27683 ?auto_27715 ) ) ( not ( = ?auto_27684 ?auto_27697 ) ) ( not ( = ?auto_27684 ?auto_27715 ) ) ( not ( = ?auto_27685 ?auto_27697 ) ) ( not ( = ?auto_27685 ?auto_27715 ) ) ( not ( = ?auto_27686 ?auto_27697 ) ) ( not ( = ?auto_27686 ?auto_27715 ) ) ( not ( = ?auto_27687 ?auto_27697 ) ) ( not ( = ?auto_27687 ?auto_27715 ) ) ( not ( = ?auto_27688 ?auto_27697 ) ) ( not ( = ?auto_27688 ?auto_27715 ) ) ( not ( = ?auto_27691 ?auto_27697 ) ) ( not ( = ?auto_27691 ?auto_27715 ) ) ( not ( = ?auto_27690 ?auto_27697 ) ) ( not ( = ?auto_27690 ?auto_27715 ) ) ( not ( = ?auto_27689 ?auto_27697 ) ) ( not ( = ?auto_27689 ?auto_27715 ) ) ( not ( = ?auto_27692 ?auto_27697 ) ) ( not ( = ?auto_27692 ?auto_27715 ) ) ( not ( = ?auto_27694 ?auto_27697 ) ) ( not ( = ?auto_27694 ?auto_27715 ) ) ( not ( = ?auto_27693 ?auto_27697 ) ) ( not ( = ?auto_27693 ?auto_27715 ) ) ( not ( = ?auto_27697 ?auto_27710 ) ) ( not ( = ?auto_27697 ?auto_27717 ) ) ( not ( = ?auto_27697 ?auto_27712 ) ) ( not ( = ?auto_27697 ?auto_27721 ) ) ( not ( = ?auto_27697 ?auto_27716 ) ) ( not ( = ?auto_27697 ?auto_27718 ) ) ( not ( = ?auto_27697 ?auto_27728 ) ) ( not ( = ?auto_27697 ?auto_27727 ) ) ( not ( = ?auto_27697 ?auto_27704 ) ) ( not ( = ?auto_27697 ?auto_27732 ) ) ( not ( = ?auto_27697 ?auto_27708 ) ) ( not ( = ?auto_27697 ?auto_27707 ) ) ( not ( = ?auto_27715 ?auto_27710 ) ) ( not ( = ?auto_27715 ?auto_27717 ) ) ( not ( = ?auto_27715 ?auto_27712 ) ) ( not ( = ?auto_27715 ?auto_27721 ) ) ( not ( = ?auto_27715 ?auto_27716 ) ) ( not ( = ?auto_27715 ?auto_27718 ) ) ( not ( = ?auto_27715 ?auto_27728 ) ) ( not ( = ?auto_27715 ?auto_27727 ) ) ( not ( = ?auto_27715 ?auto_27704 ) ) ( not ( = ?auto_27715 ?auto_27732 ) ) ( not ( = ?auto_27715 ?auto_27708 ) ) ( not ( = ?auto_27715 ?auto_27707 ) ) ( not ( = ?auto_27683 ?auto_27696 ) ) ( not ( = ?auto_27683 ?auto_27702 ) ) ( not ( = ?auto_27684 ?auto_27696 ) ) ( not ( = ?auto_27684 ?auto_27702 ) ) ( not ( = ?auto_27685 ?auto_27696 ) ) ( not ( = ?auto_27685 ?auto_27702 ) ) ( not ( = ?auto_27686 ?auto_27696 ) ) ( not ( = ?auto_27686 ?auto_27702 ) ) ( not ( = ?auto_27687 ?auto_27696 ) ) ( not ( = ?auto_27687 ?auto_27702 ) ) ( not ( = ?auto_27688 ?auto_27696 ) ) ( not ( = ?auto_27688 ?auto_27702 ) ) ( not ( = ?auto_27691 ?auto_27696 ) ) ( not ( = ?auto_27691 ?auto_27702 ) ) ( not ( = ?auto_27690 ?auto_27696 ) ) ( not ( = ?auto_27690 ?auto_27702 ) ) ( not ( = ?auto_27689 ?auto_27696 ) ) ( not ( = ?auto_27689 ?auto_27702 ) ) ( not ( = ?auto_27692 ?auto_27696 ) ) ( not ( = ?auto_27692 ?auto_27702 ) ) ( not ( = ?auto_27694 ?auto_27696 ) ) ( not ( = ?auto_27694 ?auto_27702 ) ) ( not ( = ?auto_27693 ?auto_27696 ) ) ( not ( = ?auto_27693 ?auto_27702 ) ) ( not ( = ?auto_27695 ?auto_27696 ) ) ( not ( = ?auto_27695 ?auto_27702 ) ) ( not ( = ?auto_27696 ?auto_27715 ) ) ( not ( = ?auto_27696 ?auto_27710 ) ) ( not ( = ?auto_27696 ?auto_27717 ) ) ( not ( = ?auto_27696 ?auto_27712 ) ) ( not ( = ?auto_27696 ?auto_27721 ) ) ( not ( = ?auto_27696 ?auto_27716 ) ) ( not ( = ?auto_27696 ?auto_27718 ) ) ( not ( = ?auto_27696 ?auto_27728 ) ) ( not ( = ?auto_27696 ?auto_27727 ) ) ( not ( = ?auto_27696 ?auto_27704 ) ) ( not ( = ?auto_27696 ?auto_27732 ) ) ( not ( = ?auto_27696 ?auto_27708 ) ) ( not ( = ?auto_27696 ?auto_27707 ) ) ( not ( = ?auto_27702 ?auto_27715 ) ) ( not ( = ?auto_27702 ?auto_27710 ) ) ( not ( = ?auto_27702 ?auto_27717 ) ) ( not ( = ?auto_27702 ?auto_27712 ) ) ( not ( = ?auto_27702 ?auto_27721 ) ) ( not ( = ?auto_27702 ?auto_27716 ) ) ( not ( = ?auto_27702 ?auto_27718 ) ) ( not ( = ?auto_27702 ?auto_27728 ) ) ( not ( = ?auto_27702 ?auto_27727 ) ) ( not ( = ?auto_27702 ?auto_27704 ) ) ( not ( = ?auto_27702 ?auto_27732 ) ) ( not ( = ?auto_27702 ?auto_27708 ) ) ( not ( = ?auto_27702 ?auto_27707 ) ) )
    :subtasks
    ( ( MAKE-13CRATE ?auto_27683 ?auto_27684 ?auto_27685 ?auto_27686 ?auto_27687 ?auto_27688 ?auto_27691 ?auto_27690 ?auto_27689 ?auto_27692 ?auto_27694 ?auto_27693 ?auto_27695 ?auto_27697 )
      ( MAKE-1CRATE ?auto_27697 ?auto_27696 )
      ( MAKE-14CRATE-VERIFY ?auto_27683 ?auto_27684 ?auto_27685 ?auto_27686 ?auto_27687 ?auto_27688 ?auto_27691 ?auto_27690 ?auto_27689 ?auto_27692 ?auto_27694 ?auto_27693 ?auto_27695 ?auto_27697 ?auto_27696 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27735 - SURFACE
      ?auto_27736 - SURFACE
    )
    :vars
    (
      ?auto_27737 - HOIST
      ?auto_27738 - PLACE
      ?auto_27740 - PLACE
      ?auto_27741 - HOIST
      ?auto_27742 - SURFACE
      ?auto_27739 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27737 ?auto_27738 ) ( SURFACE-AT ?auto_27735 ?auto_27738 ) ( CLEAR ?auto_27735 ) ( IS-CRATE ?auto_27736 ) ( AVAILABLE ?auto_27737 ) ( not ( = ?auto_27740 ?auto_27738 ) ) ( HOIST-AT ?auto_27741 ?auto_27740 ) ( AVAILABLE ?auto_27741 ) ( SURFACE-AT ?auto_27736 ?auto_27740 ) ( ON ?auto_27736 ?auto_27742 ) ( CLEAR ?auto_27736 ) ( TRUCK-AT ?auto_27739 ?auto_27738 ) ( not ( = ?auto_27735 ?auto_27736 ) ) ( not ( = ?auto_27735 ?auto_27742 ) ) ( not ( = ?auto_27736 ?auto_27742 ) ) ( not ( = ?auto_27737 ?auto_27741 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27739 ?auto_27738 ?auto_27740 )
      ( !LIFT ?auto_27741 ?auto_27736 ?auto_27742 ?auto_27740 )
      ( !LOAD ?auto_27741 ?auto_27736 ?auto_27739 ?auto_27740 )
      ( !DRIVE ?auto_27739 ?auto_27740 ?auto_27738 )
      ( !UNLOAD ?auto_27737 ?auto_27736 ?auto_27739 ?auto_27738 )
      ( !DROP ?auto_27737 ?auto_27736 ?auto_27735 ?auto_27738 )
      ( MAKE-1CRATE-VERIFY ?auto_27735 ?auto_27736 ) )
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
      ?auto_27767 - SURFACE
      ?auto_27766 - SURFACE
      ?auto_27765 - SURFACE
      ?auto_27768 - SURFACE
      ?auto_27770 - SURFACE
      ?auto_27769 - SURFACE
      ?auto_27771 - SURFACE
      ?auto_27773 - SURFACE
      ?auto_27772 - SURFACE
      ?auto_27774 - SURFACE
    )
    :vars
    (
      ?auto_27777 - HOIST
      ?auto_27776 - PLACE
      ?auto_27779 - PLACE
      ?auto_27778 - HOIST
      ?auto_27775 - SURFACE
      ?auto_27784 - PLACE
      ?auto_27807 - HOIST
      ?auto_27810 - SURFACE
      ?auto_27781 - PLACE
      ?auto_27785 - HOIST
      ?auto_27782 - SURFACE
      ?auto_27790 - PLACE
      ?auto_27802 - HOIST
      ?auto_27796 - SURFACE
      ?auto_27811 - PLACE
      ?auto_27799 - HOIST
      ?auto_27792 - SURFACE
      ?auto_27801 - PLACE
      ?auto_27797 - HOIST
      ?auto_27795 - SURFACE
      ?auto_27793 - PLACE
      ?auto_27791 - HOIST
      ?auto_27812 - SURFACE
      ?auto_27800 - SURFACE
      ?auto_27805 - PLACE
      ?auto_27804 - HOIST
      ?auto_27789 - SURFACE
      ?auto_27798 - PLACE
      ?auto_27787 - HOIST
      ?auto_27786 - SURFACE
      ?auto_27794 - SURFACE
      ?auto_27808 - SURFACE
      ?auto_27806 - PLACE
      ?auto_27803 - HOIST
      ?auto_27783 - SURFACE
      ?auto_27809 - SURFACE
      ?auto_27788 - SURFACE
      ?auto_27780 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27777 ?auto_27776 ) ( IS-CRATE ?auto_27774 ) ( not ( = ?auto_27779 ?auto_27776 ) ) ( HOIST-AT ?auto_27778 ?auto_27779 ) ( AVAILABLE ?auto_27778 ) ( SURFACE-AT ?auto_27774 ?auto_27779 ) ( ON ?auto_27774 ?auto_27775 ) ( CLEAR ?auto_27774 ) ( not ( = ?auto_27772 ?auto_27774 ) ) ( not ( = ?auto_27772 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27775 ) ) ( not ( = ?auto_27777 ?auto_27778 ) ) ( IS-CRATE ?auto_27772 ) ( not ( = ?auto_27784 ?auto_27776 ) ) ( HOIST-AT ?auto_27807 ?auto_27784 ) ( SURFACE-AT ?auto_27772 ?auto_27784 ) ( ON ?auto_27772 ?auto_27810 ) ( CLEAR ?auto_27772 ) ( not ( = ?auto_27773 ?auto_27772 ) ) ( not ( = ?auto_27773 ?auto_27810 ) ) ( not ( = ?auto_27772 ?auto_27810 ) ) ( not ( = ?auto_27777 ?auto_27807 ) ) ( IS-CRATE ?auto_27773 ) ( not ( = ?auto_27781 ?auto_27776 ) ) ( HOIST-AT ?auto_27785 ?auto_27781 ) ( SURFACE-AT ?auto_27773 ?auto_27781 ) ( ON ?auto_27773 ?auto_27782 ) ( CLEAR ?auto_27773 ) ( not ( = ?auto_27771 ?auto_27773 ) ) ( not ( = ?auto_27771 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27782 ) ) ( not ( = ?auto_27777 ?auto_27785 ) ) ( IS-CRATE ?auto_27771 ) ( not ( = ?auto_27790 ?auto_27776 ) ) ( HOIST-AT ?auto_27802 ?auto_27790 ) ( SURFACE-AT ?auto_27771 ?auto_27790 ) ( ON ?auto_27771 ?auto_27796 ) ( CLEAR ?auto_27771 ) ( not ( = ?auto_27769 ?auto_27771 ) ) ( not ( = ?auto_27769 ?auto_27796 ) ) ( not ( = ?auto_27771 ?auto_27796 ) ) ( not ( = ?auto_27777 ?auto_27802 ) ) ( IS-CRATE ?auto_27769 ) ( not ( = ?auto_27811 ?auto_27776 ) ) ( HOIST-AT ?auto_27799 ?auto_27811 ) ( SURFACE-AT ?auto_27769 ?auto_27811 ) ( ON ?auto_27769 ?auto_27792 ) ( CLEAR ?auto_27769 ) ( not ( = ?auto_27770 ?auto_27769 ) ) ( not ( = ?auto_27770 ?auto_27792 ) ) ( not ( = ?auto_27769 ?auto_27792 ) ) ( not ( = ?auto_27777 ?auto_27799 ) ) ( IS-CRATE ?auto_27770 ) ( not ( = ?auto_27801 ?auto_27776 ) ) ( HOIST-AT ?auto_27797 ?auto_27801 ) ( AVAILABLE ?auto_27797 ) ( SURFACE-AT ?auto_27770 ?auto_27801 ) ( ON ?auto_27770 ?auto_27795 ) ( CLEAR ?auto_27770 ) ( not ( = ?auto_27768 ?auto_27770 ) ) ( not ( = ?auto_27768 ?auto_27795 ) ) ( not ( = ?auto_27770 ?auto_27795 ) ) ( not ( = ?auto_27777 ?auto_27797 ) ) ( IS-CRATE ?auto_27768 ) ( not ( = ?auto_27793 ?auto_27776 ) ) ( HOIST-AT ?auto_27791 ?auto_27793 ) ( AVAILABLE ?auto_27791 ) ( SURFACE-AT ?auto_27768 ?auto_27793 ) ( ON ?auto_27768 ?auto_27812 ) ( CLEAR ?auto_27768 ) ( not ( = ?auto_27765 ?auto_27768 ) ) ( not ( = ?auto_27765 ?auto_27812 ) ) ( not ( = ?auto_27768 ?auto_27812 ) ) ( not ( = ?auto_27777 ?auto_27791 ) ) ( IS-CRATE ?auto_27765 ) ( AVAILABLE ?auto_27807 ) ( SURFACE-AT ?auto_27765 ?auto_27784 ) ( ON ?auto_27765 ?auto_27800 ) ( CLEAR ?auto_27765 ) ( not ( = ?auto_27766 ?auto_27765 ) ) ( not ( = ?auto_27766 ?auto_27800 ) ) ( not ( = ?auto_27765 ?auto_27800 ) ) ( IS-CRATE ?auto_27766 ) ( not ( = ?auto_27805 ?auto_27776 ) ) ( HOIST-AT ?auto_27804 ?auto_27805 ) ( AVAILABLE ?auto_27804 ) ( SURFACE-AT ?auto_27766 ?auto_27805 ) ( ON ?auto_27766 ?auto_27789 ) ( CLEAR ?auto_27766 ) ( not ( = ?auto_27767 ?auto_27766 ) ) ( not ( = ?auto_27767 ?auto_27789 ) ) ( not ( = ?auto_27766 ?auto_27789 ) ) ( not ( = ?auto_27777 ?auto_27804 ) ) ( IS-CRATE ?auto_27767 ) ( not ( = ?auto_27798 ?auto_27776 ) ) ( HOIST-AT ?auto_27787 ?auto_27798 ) ( AVAILABLE ?auto_27787 ) ( SURFACE-AT ?auto_27767 ?auto_27798 ) ( ON ?auto_27767 ?auto_27786 ) ( CLEAR ?auto_27767 ) ( not ( = ?auto_27764 ?auto_27767 ) ) ( not ( = ?auto_27764 ?auto_27786 ) ) ( not ( = ?auto_27767 ?auto_27786 ) ) ( not ( = ?auto_27777 ?auto_27787 ) ) ( IS-CRATE ?auto_27764 ) ( SURFACE-AT ?auto_27764 ?auto_27790 ) ( ON ?auto_27764 ?auto_27794 ) ( CLEAR ?auto_27764 ) ( not ( = ?auto_27763 ?auto_27764 ) ) ( not ( = ?auto_27763 ?auto_27794 ) ) ( not ( = ?auto_27764 ?auto_27794 ) ) ( IS-CRATE ?auto_27763 ) ( AVAILABLE ?auto_27802 ) ( SURFACE-AT ?auto_27763 ?auto_27790 ) ( ON ?auto_27763 ?auto_27808 ) ( CLEAR ?auto_27763 ) ( not ( = ?auto_27762 ?auto_27763 ) ) ( not ( = ?auto_27762 ?auto_27808 ) ) ( not ( = ?auto_27763 ?auto_27808 ) ) ( IS-CRATE ?auto_27762 ) ( not ( = ?auto_27806 ?auto_27776 ) ) ( HOIST-AT ?auto_27803 ?auto_27806 ) ( AVAILABLE ?auto_27803 ) ( SURFACE-AT ?auto_27762 ?auto_27806 ) ( ON ?auto_27762 ?auto_27783 ) ( CLEAR ?auto_27762 ) ( not ( = ?auto_27761 ?auto_27762 ) ) ( not ( = ?auto_27761 ?auto_27783 ) ) ( not ( = ?auto_27762 ?auto_27783 ) ) ( not ( = ?auto_27777 ?auto_27803 ) ) ( IS-CRATE ?auto_27761 ) ( AVAILABLE ?auto_27799 ) ( SURFACE-AT ?auto_27761 ?auto_27811 ) ( ON ?auto_27761 ?auto_27809 ) ( CLEAR ?auto_27761 ) ( not ( = ?auto_27760 ?auto_27761 ) ) ( not ( = ?auto_27760 ?auto_27809 ) ) ( not ( = ?auto_27761 ?auto_27809 ) ) ( SURFACE-AT ?auto_27759 ?auto_27776 ) ( CLEAR ?auto_27759 ) ( IS-CRATE ?auto_27760 ) ( AVAILABLE ?auto_27777 ) ( AVAILABLE ?auto_27785 ) ( SURFACE-AT ?auto_27760 ?auto_27781 ) ( ON ?auto_27760 ?auto_27788 ) ( CLEAR ?auto_27760 ) ( TRUCK-AT ?auto_27780 ?auto_27776 ) ( not ( = ?auto_27759 ?auto_27760 ) ) ( not ( = ?auto_27759 ?auto_27788 ) ) ( not ( = ?auto_27760 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27761 ) ) ( not ( = ?auto_27759 ?auto_27809 ) ) ( not ( = ?auto_27761 ?auto_27788 ) ) ( not ( = ?auto_27811 ?auto_27781 ) ) ( not ( = ?auto_27799 ?auto_27785 ) ) ( not ( = ?auto_27809 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27762 ) ) ( not ( = ?auto_27759 ?auto_27783 ) ) ( not ( = ?auto_27760 ?auto_27762 ) ) ( not ( = ?auto_27760 ?auto_27783 ) ) ( not ( = ?auto_27762 ?auto_27809 ) ) ( not ( = ?auto_27762 ?auto_27788 ) ) ( not ( = ?auto_27806 ?auto_27811 ) ) ( not ( = ?auto_27806 ?auto_27781 ) ) ( not ( = ?auto_27803 ?auto_27799 ) ) ( not ( = ?auto_27803 ?auto_27785 ) ) ( not ( = ?auto_27783 ?auto_27809 ) ) ( not ( = ?auto_27783 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27763 ) ) ( not ( = ?auto_27759 ?auto_27808 ) ) ( not ( = ?auto_27760 ?auto_27763 ) ) ( not ( = ?auto_27760 ?auto_27808 ) ) ( not ( = ?auto_27761 ?auto_27763 ) ) ( not ( = ?auto_27761 ?auto_27808 ) ) ( not ( = ?auto_27763 ?auto_27783 ) ) ( not ( = ?auto_27763 ?auto_27809 ) ) ( not ( = ?auto_27763 ?auto_27788 ) ) ( not ( = ?auto_27790 ?auto_27806 ) ) ( not ( = ?auto_27790 ?auto_27811 ) ) ( not ( = ?auto_27790 ?auto_27781 ) ) ( not ( = ?auto_27802 ?auto_27803 ) ) ( not ( = ?auto_27802 ?auto_27799 ) ) ( not ( = ?auto_27802 ?auto_27785 ) ) ( not ( = ?auto_27808 ?auto_27783 ) ) ( not ( = ?auto_27808 ?auto_27809 ) ) ( not ( = ?auto_27808 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27764 ) ) ( not ( = ?auto_27759 ?auto_27794 ) ) ( not ( = ?auto_27760 ?auto_27764 ) ) ( not ( = ?auto_27760 ?auto_27794 ) ) ( not ( = ?auto_27761 ?auto_27764 ) ) ( not ( = ?auto_27761 ?auto_27794 ) ) ( not ( = ?auto_27762 ?auto_27764 ) ) ( not ( = ?auto_27762 ?auto_27794 ) ) ( not ( = ?auto_27764 ?auto_27808 ) ) ( not ( = ?auto_27764 ?auto_27783 ) ) ( not ( = ?auto_27764 ?auto_27809 ) ) ( not ( = ?auto_27764 ?auto_27788 ) ) ( not ( = ?auto_27794 ?auto_27808 ) ) ( not ( = ?auto_27794 ?auto_27783 ) ) ( not ( = ?auto_27794 ?auto_27809 ) ) ( not ( = ?auto_27794 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27767 ) ) ( not ( = ?auto_27759 ?auto_27786 ) ) ( not ( = ?auto_27760 ?auto_27767 ) ) ( not ( = ?auto_27760 ?auto_27786 ) ) ( not ( = ?auto_27761 ?auto_27767 ) ) ( not ( = ?auto_27761 ?auto_27786 ) ) ( not ( = ?auto_27762 ?auto_27767 ) ) ( not ( = ?auto_27762 ?auto_27786 ) ) ( not ( = ?auto_27763 ?auto_27767 ) ) ( not ( = ?auto_27763 ?auto_27786 ) ) ( not ( = ?auto_27767 ?auto_27794 ) ) ( not ( = ?auto_27767 ?auto_27808 ) ) ( not ( = ?auto_27767 ?auto_27783 ) ) ( not ( = ?auto_27767 ?auto_27809 ) ) ( not ( = ?auto_27767 ?auto_27788 ) ) ( not ( = ?auto_27798 ?auto_27790 ) ) ( not ( = ?auto_27798 ?auto_27806 ) ) ( not ( = ?auto_27798 ?auto_27811 ) ) ( not ( = ?auto_27798 ?auto_27781 ) ) ( not ( = ?auto_27787 ?auto_27802 ) ) ( not ( = ?auto_27787 ?auto_27803 ) ) ( not ( = ?auto_27787 ?auto_27799 ) ) ( not ( = ?auto_27787 ?auto_27785 ) ) ( not ( = ?auto_27786 ?auto_27794 ) ) ( not ( = ?auto_27786 ?auto_27808 ) ) ( not ( = ?auto_27786 ?auto_27783 ) ) ( not ( = ?auto_27786 ?auto_27809 ) ) ( not ( = ?auto_27786 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27766 ) ) ( not ( = ?auto_27759 ?auto_27789 ) ) ( not ( = ?auto_27760 ?auto_27766 ) ) ( not ( = ?auto_27760 ?auto_27789 ) ) ( not ( = ?auto_27761 ?auto_27766 ) ) ( not ( = ?auto_27761 ?auto_27789 ) ) ( not ( = ?auto_27762 ?auto_27766 ) ) ( not ( = ?auto_27762 ?auto_27789 ) ) ( not ( = ?auto_27763 ?auto_27766 ) ) ( not ( = ?auto_27763 ?auto_27789 ) ) ( not ( = ?auto_27764 ?auto_27766 ) ) ( not ( = ?auto_27764 ?auto_27789 ) ) ( not ( = ?auto_27766 ?auto_27786 ) ) ( not ( = ?auto_27766 ?auto_27794 ) ) ( not ( = ?auto_27766 ?auto_27808 ) ) ( not ( = ?auto_27766 ?auto_27783 ) ) ( not ( = ?auto_27766 ?auto_27809 ) ) ( not ( = ?auto_27766 ?auto_27788 ) ) ( not ( = ?auto_27805 ?auto_27798 ) ) ( not ( = ?auto_27805 ?auto_27790 ) ) ( not ( = ?auto_27805 ?auto_27806 ) ) ( not ( = ?auto_27805 ?auto_27811 ) ) ( not ( = ?auto_27805 ?auto_27781 ) ) ( not ( = ?auto_27804 ?auto_27787 ) ) ( not ( = ?auto_27804 ?auto_27802 ) ) ( not ( = ?auto_27804 ?auto_27803 ) ) ( not ( = ?auto_27804 ?auto_27799 ) ) ( not ( = ?auto_27804 ?auto_27785 ) ) ( not ( = ?auto_27789 ?auto_27786 ) ) ( not ( = ?auto_27789 ?auto_27794 ) ) ( not ( = ?auto_27789 ?auto_27808 ) ) ( not ( = ?auto_27789 ?auto_27783 ) ) ( not ( = ?auto_27789 ?auto_27809 ) ) ( not ( = ?auto_27789 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27765 ) ) ( not ( = ?auto_27759 ?auto_27800 ) ) ( not ( = ?auto_27760 ?auto_27765 ) ) ( not ( = ?auto_27760 ?auto_27800 ) ) ( not ( = ?auto_27761 ?auto_27765 ) ) ( not ( = ?auto_27761 ?auto_27800 ) ) ( not ( = ?auto_27762 ?auto_27765 ) ) ( not ( = ?auto_27762 ?auto_27800 ) ) ( not ( = ?auto_27763 ?auto_27765 ) ) ( not ( = ?auto_27763 ?auto_27800 ) ) ( not ( = ?auto_27764 ?auto_27765 ) ) ( not ( = ?auto_27764 ?auto_27800 ) ) ( not ( = ?auto_27767 ?auto_27765 ) ) ( not ( = ?auto_27767 ?auto_27800 ) ) ( not ( = ?auto_27765 ?auto_27789 ) ) ( not ( = ?auto_27765 ?auto_27786 ) ) ( not ( = ?auto_27765 ?auto_27794 ) ) ( not ( = ?auto_27765 ?auto_27808 ) ) ( not ( = ?auto_27765 ?auto_27783 ) ) ( not ( = ?auto_27765 ?auto_27809 ) ) ( not ( = ?auto_27765 ?auto_27788 ) ) ( not ( = ?auto_27784 ?auto_27805 ) ) ( not ( = ?auto_27784 ?auto_27798 ) ) ( not ( = ?auto_27784 ?auto_27790 ) ) ( not ( = ?auto_27784 ?auto_27806 ) ) ( not ( = ?auto_27784 ?auto_27811 ) ) ( not ( = ?auto_27784 ?auto_27781 ) ) ( not ( = ?auto_27807 ?auto_27804 ) ) ( not ( = ?auto_27807 ?auto_27787 ) ) ( not ( = ?auto_27807 ?auto_27802 ) ) ( not ( = ?auto_27807 ?auto_27803 ) ) ( not ( = ?auto_27807 ?auto_27799 ) ) ( not ( = ?auto_27807 ?auto_27785 ) ) ( not ( = ?auto_27800 ?auto_27789 ) ) ( not ( = ?auto_27800 ?auto_27786 ) ) ( not ( = ?auto_27800 ?auto_27794 ) ) ( not ( = ?auto_27800 ?auto_27808 ) ) ( not ( = ?auto_27800 ?auto_27783 ) ) ( not ( = ?auto_27800 ?auto_27809 ) ) ( not ( = ?auto_27800 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27768 ) ) ( not ( = ?auto_27759 ?auto_27812 ) ) ( not ( = ?auto_27760 ?auto_27768 ) ) ( not ( = ?auto_27760 ?auto_27812 ) ) ( not ( = ?auto_27761 ?auto_27768 ) ) ( not ( = ?auto_27761 ?auto_27812 ) ) ( not ( = ?auto_27762 ?auto_27768 ) ) ( not ( = ?auto_27762 ?auto_27812 ) ) ( not ( = ?auto_27763 ?auto_27768 ) ) ( not ( = ?auto_27763 ?auto_27812 ) ) ( not ( = ?auto_27764 ?auto_27768 ) ) ( not ( = ?auto_27764 ?auto_27812 ) ) ( not ( = ?auto_27767 ?auto_27768 ) ) ( not ( = ?auto_27767 ?auto_27812 ) ) ( not ( = ?auto_27766 ?auto_27768 ) ) ( not ( = ?auto_27766 ?auto_27812 ) ) ( not ( = ?auto_27768 ?auto_27800 ) ) ( not ( = ?auto_27768 ?auto_27789 ) ) ( not ( = ?auto_27768 ?auto_27786 ) ) ( not ( = ?auto_27768 ?auto_27794 ) ) ( not ( = ?auto_27768 ?auto_27808 ) ) ( not ( = ?auto_27768 ?auto_27783 ) ) ( not ( = ?auto_27768 ?auto_27809 ) ) ( not ( = ?auto_27768 ?auto_27788 ) ) ( not ( = ?auto_27793 ?auto_27784 ) ) ( not ( = ?auto_27793 ?auto_27805 ) ) ( not ( = ?auto_27793 ?auto_27798 ) ) ( not ( = ?auto_27793 ?auto_27790 ) ) ( not ( = ?auto_27793 ?auto_27806 ) ) ( not ( = ?auto_27793 ?auto_27811 ) ) ( not ( = ?auto_27793 ?auto_27781 ) ) ( not ( = ?auto_27791 ?auto_27807 ) ) ( not ( = ?auto_27791 ?auto_27804 ) ) ( not ( = ?auto_27791 ?auto_27787 ) ) ( not ( = ?auto_27791 ?auto_27802 ) ) ( not ( = ?auto_27791 ?auto_27803 ) ) ( not ( = ?auto_27791 ?auto_27799 ) ) ( not ( = ?auto_27791 ?auto_27785 ) ) ( not ( = ?auto_27812 ?auto_27800 ) ) ( not ( = ?auto_27812 ?auto_27789 ) ) ( not ( = ?auto_27812 ?auto_27786 ) ) ( not ( = ?auto_27812 ?auto_27794 ) ) ( not ( = ?auto_27812 ?auto_27808 ) ) ( not ( = ?auto_27812 ?auto_27783 ) ) ( not ( = ?auto_27812 ?auto_27809 ) ) ( not ( = ?auto_27812 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27770 ) ) ( not ( = ?auto_27759 ?auto_27795 ) ) ( not ( = ?auto_27760 ?auto_27770 ) ) ( not ( = ?auto_27760 ?auto_27795 ) ) ( not ( = ?auto_27761 ?auto_27770 ) ) ( not ( = ?auto_27761 ?auto_27795 ) ) ( not ( = ?auto_27762 ?auto_27770 ) ) ( not ( = ?auto_27762 ?auto_27795 ) ) ( not ( = ?auto_27763 ?auto_27770 ) ) ( not ( = ?auto_27763 ?auto_27795 ) ) ( not ( = ?auto_27764 ?auto_27770 ) ) ( not ( = ?auto_27764 ?auto_27795 ) ) ( not ( = ?auto_27767 ?auto_27770 ) ) ( not ( = ?auto_27767 ?auto_27795 ) ) ( not ( = ?auto_27766 ?auto_27770 ) ) ( not ( = ?auto_27766 ?auto_27795 ) ) ( not ( = ?auto_27765 ?auto_27770 ) ) ( not ( = ?auto_27765 ?auto_27795 ) ) ( not ( = ?auto_27770 ?auto_27812 ) ) ( not ( = ?auto_27770 ?auto_27800 ) ) ( not ( = ?auto_27770 ?auto_27789 ) ) ( not ( = ?auto_27770 ?auto_27786 ) ) ( not ( = ?auto_27770 ?auto_27794 ) ) ( not ( = ?auto_27770 ?auto_27808 ) ) ( not ( = ?auto_27770 ?auto_27783 ) ) ( not ( = ?auto_27770 ?auto_27809 ) ) ( not ( = ?auto_27770 ?auto_27788 ) ) ( not ( = ?auto_27801 ?auto_27793 ) ) ( not ( = ?auto_27801 ?auto_27784 ) ) ( not ( = ?auto_27801 ?auto_27805 ) ) ( not ( = ?auto_27801 ?auto_27798 ) ) ( not ( = ?auto_27801 ?auto_27790 ) ) ( not ( = ?auto_27801 ?auto_27806 ) ) ( not ( = ?auto_27801 ?auto_27811 ) ) ( not ( = ?auto_27801 ?auto_27781 ) ) ( not ( = ?auto_27797 ?auto_27791 ) ) ( not ( = ?auto_27797 ?auto_27807 ) ) ( not ( = ?auto_27797 ?auto_27804 ) ) ( not ( = ?auto_27797 ?auto_27787 ) ) ( not ( = ?auto_27797 ?auto_27802 ) ) ( not ( = ?auto_27797 ?auto_27803 ) ) ( not ( = ?auto_27797 ?auto_27799 ) ) ( not ( = ?auto_27797 ?auto_27785 ) ) ( not ( = ?auto_27795 ?auto_27812 ) ) ( not ( = ?auto_27795 ?auto_27800 ) ) ( not ( = ?auto_27795 ?auto_27789 ) ) ( not ( = ?auto_27795 ?auto_27786 ) ) ( not ( = ?auto_27795 ?auto_27794 ) ) ( not ( = ?auto_27795 ?auto_27808 ) ) ( not ( = ?auto_27795 ?auto_27783 ) ) ( not ( = ?auto_27795 ?auto_27809 ) ) ( not ( = ?auto_27795 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27769 ) ) ( not ( = ?auto_27759 ?auto_27792 ) ) ( not ( = ?auto_27760 ?auto_27769 ) ) ( not ( = ?auto_27760 ?auto_27792 ) ) ( not ( = ?auto_27761 ?auto_27769 ) ) ( not ( = ?auto_27761 ?auto_27792 ) ) ( not ( = ?auto_27762 ?auto_27769 ) ) ( not ( = ?auto_27762 ?auto_27792 ) ) ( not ( = ?auto_27763 ?auto_27769 ) ) ( not ( = ?auto_27763 ?auto_27792 ) ) ( not ( = ?auto_27764 ?auto_27769 ) ) ( not ( = ?auto_27764 ?auto_27792 ) ) ( not ( = ?auto_27767 ?auto_27769 ) ) ( not ( = ?auto_27767 ?auto_27792 ) ) ( not ( = ?auto_27766 ?auto_27769 ) ) ( not ( = ?auto_27766 ?auto_27792 ) ) ( not ( = ?auto_27765 ?auto_27769 ) ) ( not ( = ?auto_27765 ?auto_27792 ) ) ( not ( = ?auto_27768 ?auto_27769 ) ) ( not ( = ?auto_27768 ?auto_27792 ) ) ( not ( = ?auto_27769 ?auto_27795 ) ) ( not ( = ?auto_27769 ?auto_27812 ) ) ( not ( = ?auto_27769 ?auto_27800 ) ) ( not ( = ?auto_27769 ?auto_27789 ) ) ( not ( = ?auto_27769 ?auto_27786 ) ) ( not ( = ?auto_27769 ?auto_27794 ) ) ( not ( = ?auto_27769 ?auto_27808 ) ) ( not ( = ?auto_27769 ?auto_27783 ) ) ( not ( = ?auto_27769 ?auto_27809 ) ) ( not ( = ?auto_27769 ?auto_27788 ) ) ( not ( = ?auto_27792 ?auto_27795 ) ) ( not ( = ?auto_27792 ?auto_27812 ) ) ( not ( = ?auto_27792 ?auto_27800 ) ) ( not ( = ?auto_27792 ?auto_27789 ) ) ( not ( = ?auto_27792 ?auto_27786 ) ) ( not ( = ?auto_27792 ?auto_27794 ) ) ( not ( = ?auto_27792 ?auto_27808 ) ) ( not ( = ?auto_27792 ?auto_27783 ) ) ( not ( = ?auto_27792 ?auto_27809 ) ) ( not ( = ?auto_27792 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27771 ) ) ( not ( = ?auto_27759 ?auto_27796 ) ) ( not ( = ?auto_27760 ?auto_27771 ) ) ( not ( = ?auto_27760 ?auto_27796 ) ) ( not ( = ?auto_27761 ?auto_27771 ) ) ( not ( = ?auto_27761 ?auto_27796 ) ) ( not ( = ?auto_27762 ?auto_27771 ) ) ( not ( = ?auto_27762 ?auto_27796 ) ) ( not ( = ?auto_27763 ?auto_27771 ) ) ( not ( = ?auto_27763 ?auto_27796 ) ) ( not ( = ?auto_27764 ?auto_27771 ) ) ( not ( = ?auto_27764 ?auto_27796 ) ) ( not ( = ?auto_27767 ?auto_27771 ) ) ( not ( = ?auto_27767 ?auto_27796 ) ) ( not ( = ?auto_27766 ?auto_27771 ) ) ( not ( = ?auto_27766 ?auto_27796 ) ) ( not ( = ?auto_27765 ?auto_27771 ) ) ( not ( = ?auto_27765 ?auto_27796 ) ) ( not ( = ?auto_27768 ?auto_27771 ) ) ( not ( = ?auto_27768 ?auto_27796 ) ) ( not ( = ?auto_27770 ?auto_27771 ) ) ( not ( = ?auto_27770 ?auto_27796 ) ) ( not ( = ?auto_27771 ?auto_27792 ) ) ( not ( = ?auto_27771 ?auto_27795 ) ) ( not ( = ?auto_27771 ?auto_27812 ) ) ( not ( = ?auto_27771 ?auto_27800 ) ) ( not ( = ?auto_27771 ?auto_27789 ) ) ( not ( = ?auto_27771 ?auto_27786 ) ) ( not ( = ?auto_27771 ?auto_27794 ) ) ( not ( = ?auto_27771 ?auto_27808 ) ) ( not ( = ?auto_27771 ?auto_27783 ) ) ( not ( = ?auto_27771 ?auto_27809 ) ) ( not ( = ?auto_27771 ?auto_27788 ) ) ( not ( = ?auto_27796 ?auto_27792 ) ) ( not ( = ?auto_27796 ?auto_27795 ) ) ( not ( = ?auto_27796 ?auto_27812 ) ) ( not ( = ?auto_27796 ?auto_27800 ) ) ( not ( = ?auto_27796 ?auto_27789 ) ) ( not ( = ?auto_27796 ?auto_27786 ) ) ( not ( = ?auto_27796 ?auto_27794 ) ) ( not ( = ?auto_27796 ?auto_27808 ) ) ( not ( = ?auto_27796 ?auto_27783 ) ) ( not ( = ?auto_27796 ?auto_27809 ) ) ( not ( = ?auto_27796 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27773 ) ) ( not ( = ?auto_27759 ?auto_27782 ) ) ( not ( = ?auto_27760 ?auto_27773 ) ) ( not ( = ?auto_27760 ?auto_27782 ) ) ( not ( = ?auto_27761 ?auto_27773 ) ) ( not ( = ?auto_27761 ?auto_27782 ) ) ( not ( = ?auto_27762 ?auto_27773 ) ) ( not ( = ?auto_27762 ?auto_27782 ) ) ( not ( = ?auto_27763 ?auto_27773 ) ) ( not ( = ?auto_27763 ?auto_27782 ) ) ( not ( = ?auto_27764 ?auto_27773 ) ) ( not ( = ?auto_27764 ?auto_27782 ) ) ( not ( = ?auto_27767 ?auto_27773 ) ) ( not ( = ?auto_27767 ?auto_27782 ) ) ( not ( = ?auto_27766 ?auto_27773 ) ) ( not ( = ?auto_27766 ?auto_27782 ) ) ( not ( = ?auto_27765 ?auto_27773 ) ) ( not ( = ?auto_27765 ?auto_27782 ) ) ( not ( = ?auto_27768 ?auto_27773 ) ) ( not ( = ?auto_27768 ?auto_27782 ) ) ( not ( = ?auto_27770 ?auto_27773 ) ) ( not ( = ?auto_27770 ?auto_27782 ) ) ( not ( = ?auto_27769 ?auto_27773 ) ) ( not ( = ?auto_27769 ?auto_27782 ) ) ( not ( = ?auto_27773 ?auto_27796 ) ) ( not ( = ?auto_27773 ?auto_27792 ) ) ( not ( = ?auto_27773 ?auto_27795 ) ) ( not ( = ?auto_27773 ?auto_27812 ) ) ( not ( = ?auto_27773 ?auto_27800 ) ) ( not ( = ?auto_27773 ?auto_27789 ) ) ( not ( = ?auto_27773 ?auto_27786 ) ) ( not ( = ?auto_27773 ?auto_27794 ) ) ( not ( = ?auto_27773 ?auto_27808 ) ) ( not ( = ?auto_27773 ?auto_27783 ) ) ( not ( = ?auto_27773 ?auto_27809 ) ) ( not ( = ?auto_27773 ?auto_27788 ) ) ( not ( = ?auto_27782 ?auto_27796 ) ) ( not ( = ?auto_27782 ?auto_27792 ) ) ( not ( = ?auto_27782 ?auto_27795 ) ) ( not ( = ?auto_27782 ?auto_27812 ) ) ( not ( = ?auto_27782 ?auto_27800 ) ) ( not ( = ?auto_27782 ?auto_27789 ) ) ( not ( = ?auto_27782 ?auto_27786 ) ) ( not ( = ?auto_27782 ?auto_27794 ) ) ( not ( = ?auto_27782 ?auto_27808 ) ) ( not ( = ?auto_27782 ?auto_27783 ) ) ( not ( = ?auto_27782 ?auto_27809 ) ) ( not ( = ?auto_27782 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27772 ) ) ( not ( = ?auto_27759 ?auto_27810 ) ) ( not ( = ?auto_27760 ?auto_27772 ) ) ( not ( = ?auto_27760 ?auto_27810 ) ) ( not ( = ?auto_27761 ?auto_27772 ) ) ( not ( = ?auto_27761 ?auto_27810 ) ) ( not ( = ?auto_27762 ?auto_27772 ) ) ( not ( = ?auto_27762 ?auto_27810 ) ) ( not ( = ?auto_27763 ?auto_27772 ) ) ( not ( = ?auto_27763 ?auto_27810 ) ) ( not ( = ?auto_27764 ?auto_27772 ) ) ( not ( = ?auto_27764 ?auto_27810 ) ) ( not ( = ?auto_27767 ?auto_27772 ) ) ( not ( = ?auto_27767 ?auto_27810 ) ) ( not ( = ?auto_27766 ?auto_27772 ) ) ( not ( = ?auto_27766 ?auto_27810 ) ) ( not ( = ?auto_27765 ?auto_27772 ) ) ( not ( = ?auto_27765 ?auto_27810 ) ) ( not ( = ?auto_27768 ?auto_27772 ) ) ( not ( = ?auto_27768 ?auto_27810 ) ) ( not ( = ?auto_27770 ?auto_27772 ) ) ( not ( = ?auto_27770 ?auto_27810 ) ) ( not ( = ?auto_27769 ?auto_27772 ) ) ( not ( = ?auto_27769 ?auto_27810 ) ) ( not ( = ?auto_27771 ?auto_27772 ) ) ( not ( = ?auto_27771 ?auto_27810 ) ) ( not ( = ?auto_27772 ?auto_27782 ) ) ( not ( = ?auto_27772 ?auto_27796 ) ) ( not ( = ?auto_27772 ?auto_27792 ) ) ( not ( = ?auto_27772 ?auto_27795 ) ) ( not ( = ?auto_27772 ?auto_27812 ) ) ( not ( = ?auto_27772 ?auto_27800 ) ) ( not ( = ?auto_27772 ?auto_27789 ) ) ( not ( = ?auto_27772 ?auto_27786 ) ) ( not ( = ?auto_27772 ?auto_27794 ) ) ( not ( = ?auto_27772 ?auto_27808 ) ) ( not ( = ?auto_27772 ?auto_27783 ) ) ( not ( = ?auto_27772 ?auto_27809 ) ) ( not ( = ?auto_27772 ?auto_27788 ) ) ( not ( = ?auto_27810 ?auto_27782 ) ) ( not ( = ?auto_27810 ?auto_27796 ) ) ( not ( = ?auto_27810 ?auto_27792 ) ) ( not ( = ?auto_27810 ?auto_27795 ) ) ( not ( = ?auto_27810 ?auto_27812 ) ) ( not ( = ?auto_27810 ?auto_27800 ) ) ( not ( = ?auto_27810 ?auto_27789 ) ) ( not ( = ?auto_27810 ?auto_27786 ) ) ( not ( = ?auto_27810 ?auto_27794 ) ) ( not ( = ?auto_27810 ?auto_27808 ) ) ( not ( = ?auto_27810 ?auto_27783 ) ) ( not ( = ?auto_27810 ?auto_27809 ) ) ( not ( = ?auto_27810 ?auto_27788 ) ) ( not ( = ?auto_27759 ?auto_27774 ) ) ( not ( = ?auto_27759 ?auto_27775 ) ) ( not ( = ?auto_27760 ?auto_27774 ) ) ( not ( = ?auto_27760 ?auto_27775 ) ) ( not ( = ?auto_27761 ?auto_27774 ) ) ( not ( = ?auto_27761 ?auto_27775 ) ) ( not ( = ?auto_27762 ?auto_27774 ) ) ( not ( = ?auto_27762 ?auto_27775 ) ) ( not ( = ?auto_27763 ?auto_27774 ) ) ( not ( = ?auto_27763 ?auto_27775 ) ) ( not ( = ?auto_27764 ?auto_27774 ) ) ( not ( = ?auto_27764 ?auto_27775 ) ) ( not ( = ?auto_27767 ?auto_27774 ) ) ( not ( = ?auto_27767 ?auto_27775 ) ) ( not ( = ?auto_27766 ?auto_27774 ) ) ( not ( = ?auto_27766 ?auto_27775 ) ) ( not ( = ?auto_27765 ?auto_27774 ) ) ( not ( = ?auto_27765 ?auto_27775 ) ) ( not ( = ?auto_27768 ?auto_27774 ) ) ( not ( = ?auto_27768 ?auto_27775 ) ) ( not ( = ?auto_27770 ?auto_27774 ) ) ( not ( = ?auto_27770 ?auto_27775 ) ) ( not ( = ?auto_27769 ?auto_27774 ) ) ( not ( = ?auto_27769 ?auto_27775 ) ) ( not ( = ?auto_27771 ?auto_27774 ) ) ( not ( = ?auto_27771 ?auto_27775 ) ) ( not ( = ?auto_27773 ?auto_27774 ) ) ( not ( = ?auto_27773 ?auto_27775 ) ) ( not ( = ?auto_27774 ?auto_27810 ) ) ( not ( = ?auto_27774 ?auto_27782 ) ) ( not ( = ?auto_27774 ?auto_27796 ) ) ( not ( = ?auto_27774 ?auto_27792 ) ) ( not ( = ?auto_27774 ?auto_27795 ) ) ( not ( = ?auto_27774 ?auto_27812 ) ) ( not ( = ?auto_27774 ?auto_27800 ) ) ( not ( = ?auto_27774 ?auto_27789 ) ) ( not ( = ?auto_27774 ?auto_27786 ) ) ( not ( = ?auto_27774 ?auto_27794 ) ) ( not ( = ?auto_27774 ?auto_27808 ) ) ( not ( = ?auto_27774 ?auto_27783 ) ) ( not ( = ?auto_27774 ?auto_27809 ) ) ( not ( = ?auto_27774 ?auto_27788 ) ) ( not ( = ?auto_27779 ?auto_27784 ) ) ( not ( = ?auto_27779 ?auto_27781 ) ) ( not ( = ?auto_27779 ?auto_27790 ) ) ( not ( = ?auto_27779 ?auto_27811 ) ) ( not ( = ?auto_27779 ?auto_27801 ) ) ( not ( = ?auto_27779 ?auto_27793 ) ) ( not ( = ?auto_27779 ?auto_27805 ) ) ( not ( = ?auto_27779 ?auto_27798 ) ) ( not ( = ?auto_27779 ?auto_27806 ) ) ( not ( = ?auto_27778 ?auto_27807 ) ) ( not ( = ?auto_27778 ?auto_27785 ) ) ( not ( = ?auto_27778 ?auto_27802 ) ) ( not ( = ?auto_27778 ?auto_27799 ) ) ( not ( = ?auto_27778 ?auto_27797 ) ) ( not ( = ?auto_27778 ?auto_27791 ) ) ( not ( = ?auto_27778 ?auto_27804 ) ) ( not ( = ?auto_27778 ?auto_27787 ) ) ( not ( = ?auto_27778 ?auto_27803 ) ) ( not ( = ?auto_27775 ?auto_27810 ) ) ( not ( = ?auto_27775 ?auto_27782 ) ) ( not ( = ?auto_27775 ?auto_27796 ) ) ( not ( = ?auto_27775 ?auto_27792 ) ) ( not ( = ?auto_27775 ?auto_27795 ) ) ( not ( = ?auto_27775 ?auto_27812 ) ) ( not ( = ?auto_27775 ?auto_27800 ) ) ( not ( = ?auto_27775 ?auto_27789 ) ) ( not ( = ?auto_27775 ?auto_27786 ) ) ( not ( = ?auto_27775 ?auto_27794 ) ) ( not ( = ?auto_27775 ?auto_27808 ) ) ( not ( = ?auto_27775 ?auto_27783 ) ) ( not ( = ?auto_27775 ?auto_27809 ) ) ( not ( = ?auto_27775 ?auto_27788 ) ) )
    :subtasks
    ( ( MAKE-14CRATE ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ?auto_27763 ?auto_27764 ?auto_27767 ?auto_27766 ?auto_27765 ?auto_27768 ?auto_27770 ?auto_27769 ?auto_27771 ?auto_27773 ?auto_27772 )
      ( MAKE-1CRATE ?auto_27772 ?auto_27774 )
      ( MAKE-15CRATE-VERIFY ?auto_27759 ?auto_27760 ?auto_27761 ?auto_27762 ?auto_27763 ?auto_27764 ?auto_27767 ?auto_27766 ?auto_27765 ?auto_27768 ?auto_27770 ?auto_27769 ?auto_27771 ?auto_27773 ?auto_27772 ?auto_27774 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_27815 - SURFACE
      ?auto_27816 - SURFACE
    )
    :vars
    (
      ?auto_27817 - HOIST
      ?auto_27818 - PLACE
      ?auto_27820 - PLACE
      ?auto_27821 - HOIST
      ?auto_27822 - SURFACE
      ?auto_27819 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27817 ?auto_27818 ) ( SURFACE-AT ?auto_27815 ?auto_27818 ) ( CLEAR ?auto_27815 ) ( IS-CRATE ?auto_27816 ) ( AVAILABLE ?auto_27817 ) ( not ( = ?auto_27820 ?auto_27818 ) ) ( HOIST-AT ?auto_27821 ?auto_27820 ) ( AVAILABLE ?auto_27821 ) ( SURFACE-AT ?auto_27816 ?auto_27820 ) ( ON ?auto_27816 ?auto_27822 ) ( CLEAR ?auto_27816 ) ( TRUCK-AT ?auto_27819 ?auto_27818 ) ( not ( = ?auto_27815 ?auto_27816 ) ) ( not ( = ?auto_27815 ?auto_27822 ) ) ( not ( = ?auto_27816 ?auto_27822 ) ) ( not ( = ?auto_27817 ?auto_27821 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_27819 ?auto_27818 ?auto_27820 )
      ( !LIFT ?auto_27821 ?auto_27816 ?auto_27822 ?auto_27820 )
      ( !LOAD ?auto_27821 ?auto_27816 ?auto_27819 ?auto_27820 )
      ( !DRIVE ?auto_27819 ?auto_27820 ?auto_27818 )
      ( !UNLOAD ?auto_27817 ?auto_27816 ?auto_27819 ?auto_27818 )
      ( !DROP ?auto_27817 ?auto_27816 ?auto_27815 ?auto_27818 )
      ( MAKE-1CRATE-VERIFY ?auto_27815 ?auto_27816 ) )
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
      ?auto_27848 - SURFACE
      ?auto_27847 - SURFACE
      ?auto_27846 - SURFACE
      ?auto_27849 - SURFACE
      ?auto_27851 - SURFACE
      ?auto_27850 - SURFACE
      ?auto_27852 - SURFACE
      ?auto_27854 - SURFACE
      ?auto_27853 - SURFACE
      ?auto_27855 - SURFACE
      ?auto_27856 - SURFACE
    )
    :vars
    (
      ?auto_27858 - HOIST
      ?auto_27857 - PLACE
      ?auto_27860 - PLACE
      ?auto_27862 - HOIST
      ?auto_27859 - SURFACE
      ?auto_27883 - PLACE
      ?auto_27865 - HOIST
      ?auto_27874 - SURFACE
      ?auto_27880 - PLACE
      ?auto_27864 - HOIST
      ?auto_27888 - SURFACE
      ?auto_27895 - PLACE
      ?auto_27886 - HOIST
      ?auto_27871 - SURFACE
      ?auto_27884 - PLACE
      ?auto_27875 - HOIST
      ?auto_27877 - SURFACE
      ?auto_27876 - PLACE
      ?auto_27894 - HOIST
      ?auto_27885 - SURFACE
      ?auto_27866 - PLACE
      ?auto_27869 - HOIST
      ?auto_27889 - SURFACE
      ?auto_27879 - SURFACE
      ?auto_27891 - SURFACE
      ?auto_27887 - PLACE
      ?auto_27881 - HOIST
      ?auto_27890 - SURFACE
      ?auto_27867 - PLACE
      ?auto_27870 - HOIST
      ?auto_27893 - SURFACE
      ?auto_27878 - SURFACE
      ?auto_27882 - SURFACE
      ?auto_27872 - PLACE
      ?auto_27863 - HOIST
      ?auto_27868 - SURFACE
      ?auto_27873 - SURFACE
      ?auto_27892 - SURFACE
      ?auto_27861 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_27858 ?auto_27857 ) ( IS-CRATE ?auto_27856 ) ( not ( = ?auto_27860 ?auto_27857 ) ) ( HOIST-AT ?auto_27862 ?auto_27860 ) ( SURFACE-AT ?auto_27856 ?auto_27860 ) ( ON ?auto_27856 ?auto_27859 ) ( CLEAR ?auto_27856 ) ( not ( = ?auto_27855 ?auto_27856 ) ) ( not ( = ?auto_27855 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27859 ) ) ( not ( = ?auto_27858 ?auto_27862 ) ) ( IS-CRATE ?auto_27855 ) ( not ( = ?auto_27883 ?auto_27857 ) ) ( HOIST-AT ?auto_27865 ?auto_27883 ) ( AVAILABLE ?auto_27865 ) ( SURFACE-AT ?auto_27855 ?auto_27883 ) ( ON ?auto_27855 ?auto_27874 ) ( CLEAR ?auto_27855 ) ( not ( = ?auto_27853 ?auto_27855 ) ) ( not ( = ?auto_27853 ?auto_27874 ) ) ( not ( = ?auto_27855 ?auto_27874 ) ) ( not ( = ?auto_27858 ?auto_27865 ) ) ( IS-CRATE ?auto_27853 ) ( not ( = ?auto_27880 ?auto_27857 ) ) ( HOIST-AT ?auto_27864 ?auto_27880 ) ( SURFACE-AT ?auto_27853 ?auto_27880 ) ( ON ?auto_27853 ?auto_27888 ) ( CLEAR ?auto_27853 ) ( not ( = ?auto_27854 ?auto_27853 ) ) ( not ( = ?auto_27854 ?auto_27888 ) ) ( not ( = ?auto_27853 ?auto_27888 ) ) ( not ( = ?auto_27858 ?auto_27864 ) ) ( IS-CRATE ?auto_27854 ) ( not ( = ?auto_27895 ?auto_27857 ) ) ( HOIST-AT ?auto_27886 ?auto_27895 ) ( SURFACE-AT ?auto_27854 ?auto_27895 ) ( ON ?auto_27854 ?auto_27871 ) ( CLEAR ?auto_27854 ) ( not ( = ?auto_27852 ?auto_27854 ) ) ( not ( = ?auto_27852 ?auto_27871 ) ) ( not ( = ?auto_27854 ?auto_27871 ) ) ( not ( = ?auto_27858 ?auto_27886 ) ) ( IS-CRATE ?auto_27852 ) ( not ( = ?auto_27884 ?auto_27857 ) ) ( HOIST-AT ?auto_27875 ?auto_27884 ) ( SURFACE-AT ?auto_27852 ?auto_27884 ) ( ON ?auto_27852 ?auto_27877 ) ( CLEAR ?auto_27852 ) ( not ( = ?auto_27850 ?auto_27852 ) ) ( not ( = ?auto_27850 ?auto_27877 ) ) ( not ( = ?auto_27852 ?auto_27877 ) ) ( not ( = ?auto_27858 ?auto_27875 ) ) ( IS-CRATE ?auto_27850 ) ( not ( = ?auto_27876 ?auto_27857 ) ) ( HOIST-AT ?auto_27894 ?auto_27876 ) ( SURFACE-AT ?auto_27850 ?auto_27876 ) ( ON ?auto_27850 ?auto_27885 ) ( CLEAR ?auto_27850 ) ( not ( = ?auto_27851 ?auto_27850 ) ) ( not ( = ?auto_27851 ?auto_27885 ) ) ( not ( = ?auto_27850 ?auto_27885 ) ) ( not ( = ?auto_27858 ?auto_27894 ) ) ( IS-CRATE ?auto_27851 ) ( not ( = ?auto_27866 ?auto_27857 ) ) ( HOIST-AT ?auto_27869 ?auto_27866 ) ( AVAILABLE ?auto_27869 ) ( SURFACE-AT ?auto_27851 ?auto_27866 ) ( ON ?auto_27851 ?auto_27889 ) ( CLEAR ?auto_27851 ) ( not ( = ?auto_27849 ?auto_27851 ) ) ( not ( = ?auto_27849 ?auto_27889 ) ) ( not ( = ?auto_27851 ?auto_27889 ) ) ( not ( = ?auto_27858 ?auto_27869 ) ) ( IS-CRATE ?auto_27849 ) ( AVAILABLE ?auto_27862 ) ( SURFACE-AT ?auto_27849 ?auto_27860 ) ( ON ?auto_27849 ?auto_27879 ) ( CLEAR ?auto_27849 ) ( not ( = ?auto_27846 ?auto_27849 ) ) ( not ( = ?auto_27846 ?auto_27879 ) ) ( not ( = ?auto_27849 ?auto_27879 ) ) ( IS-CRATE ?auto_27846 ) ( AVAILABLE ?auto_27864 ) ( SURFACE-AT ?auto_27846 ?auto_27880 ) ( ON ?auto_27846 ?auto_27891 ) ( CLEAR ?auto_27846 ) ( not ( = ?auto_27847 ?auto_27846 ) ) ( not ( = ?auto_27847 ?auto_27891 ) ) ( not ( = ?auto_27846 ?auto_27891 ) ) ( IS-CRATE ?auto_27847 ) ( not ( = ?auto_27887 ?auto_27857 ) ) ( HOIST-AT ?auto_27881 ?auto_27887 ) ( AVAILABLE ?auto_27881 ) ( SURFACE-AT ?auto_27847 ?auto_27887 ) ( ON ?auto_27847 ?auto_27890 ) ( CLEAR ?auto_27847 ) ( not ( = ?auto_27848 ?auto_27847 ) ) ( not ( = ?auto_27848 ?auto_27890 ) ) ( not ( = ?auto_27847 ?auto_27890 ) ) ( not ( = ?auto_27858 ?auto_27881 ) ) ( IS-CRATE ?auto_27848 ) ( not ( = ?auto_27867 ?auto_27857 ) ) ( HOIST-AT ?auto_27870 ?auto_27867 ) ( AVAILABLE ?auto_27870 ) ( SURFACE-AT ?auto_27848 ?auto_27867 ) ( ON ?auto_27848 ?auto_27893 ) ( CLEAR ?auto_27848 ) ( not ( = ?auto_27845 ?auto_27848 ) ) ( not ( = ?auto_27845 ?auto_27893 ) ) ( not ( = ?auto_27848 ?auto_27893 ) ) ( not ( = ?auto_27858 ?auto_27870 ) ) ( IS-CRATE ?auto_27845 ) ( SURFACE-AT ?auto_27845 ?auto_27884 ) ( ON ?auto_27845 ?auto_27878 ) ( CLEAR ?auto_27845 ) ( not ( = ?auto_27844 ?auto_27845 ) ) ( not ( = ?auto_27844 ?auto_27878 ) ) ( not ( = ?auto_27845 ?auto_27878 ) ) ( IS-CRATE ?auto_27844 ) ( AVAILABLE ?auto_27875 ) ( SURFACE-AT ?auto_27844 ?auto_27884 ) ( ON ?auto_27844 ?auto_27882 ) ( CLEAR ?auto_27844 ) ( not ( = ?auto_27843 ?auto_27844 ) ) ( not ( = ?auto_27843 ?auto_27882 ) ) ( not ( = ?auto_27844 ?auto_27882 ) ) ( IS-CRATE ?auto_27843 ) ( not ( = ?auto_27872 ?auto_27857 ) ) ( HOIST-AT ?auto_27863 ?auto_27872 ) ( AVAILABLE ?auto_27863 ) ( SURFACE-AT ?auto_27843 ?auto_27872 ) ( ON ?auto_27843 ?auto_27868 ) ( CLEAR ?auto_27843 ) ( not ( = ?auto_27842 ?auto_27843 ) ) ( not ( = ?auto_27842 ?auto_27868 ) ) ( not ( = ?auto_27843 ?auto_27868 ) ) ( not ( = ?auto_27858 ?auto_27863 ) ) ( IS-CRATE ?auto_27842 ) ( AVAILABLE ?auto_27894 ) ( SURFACE-AT ?auto_27842 ?auto_27876 ) ( ON ?auto_27842 ?auto_27873 ) ( CLEAR ?auto_27842 ) ( not ( = ?auto_27841 ?auto_27842 ) ) ( not ( = ?auto_27841 ?auto_27873 ) ) ( not ( = ?auto_27842 ?auto_27873 ) ) ( SURFACE-AT ?auto_27840 ?auto_27857 ) ( CLEAR ?auto_27840 ) ( IS-CRATE ?auto_27841 ) ( AVAILABLE ?auto_27858 ) ( AVAILABLE ?auto_27886 ) ( SURFACE-AT ?auto_27841 ?auto_27895 ) ( ON ?auto_27841 ?auto_27892 ) ( CLEAR ?auto_27841 ) ( TRUCK-AT ?auto_27861 ?auto_27857 ) ( not ( = ?auto_27840 ?auto_27841 ) ) ( not ( = ?auto_27840 ?auto_27892 ) ) ( not ( = ?auto_27841 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27842 ) ) ( not ( = ?auto_27840 ?auto_27873 ) ) ( not ( = ?auto_27842 ?auto_27892 ) ) ( not ( = ?auto_27876 ?auto_27895 ) ) ( not ( = ?auto_27894 ?auto_27886 ) ) ( not ( = ?auto_27873 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27843 ) ) ( not ( = ?auto_27840 ?auto_27868 ) ) ( not ( = ?auto_27841 ?auto_27843 ) ) ( not ( = ?auto_27841 ?auto_27868 ) ) ( not ( = ?auto_27843 ?auto_27873 ) ) ( not ( = ?auto_27843 ?auto_27892 ) ) ( not ( = ?auto_27872 ?auto_27876 ) ) ( not ( = ?auto_27872 ?auto_27895 ) ) ( not ( = ?auto_27863 ?auto_27894 ) ) ( not ( = ?auto_27863 ?auto_27886 ) ) ( not ( = ?auto_27868 ?auto_27873 ) ) ( not ( = ?auto_27868 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27844 ) ) ( not ( = ?auto_27840 ?auto_27882 ) ) ( not ( = ?auto_27841 ?auto_27844 ) ) ( not ( = ?auto_27841 ?auto_27882 ) ) ( not ( = ?auto_27842 ?auto_27844 ) ) ( not ( = ?auto_27842 ?auto_27882 ) ) ( not ( = ?auto_27844 ?auto_27868 ) ) ( not ( = ?auto_27844 ?auto_27873 ) ) ( not ( = ?auto_27844 ?auto_27892 ) ) ( not ( = ?auto_27884 ?auto_27872 ) ) ( not ( = ?auto_27884 ?auto_27876 ) ) ( not ( = ?auto_27884 ?auto_27895 ) ) ( not ( = ?auto_27875 ?auto_27863 ) ) ( not ( = ?auto_27875 ?auto_27894 ) ) ( not ( = ?auto_27875 ?auto_27886 ) ) ( not ( = ?auto_27882 ?auto_27868 ) ) ( not ( = ?auto_27882 ?auto_27873 ) ) ( not ( = ?auto_27882 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27845 ) ) ( not ( = ?auto_27840 ?auto_27878 ) ) ( not ( = ?auto_27841 ?auto_27845 ) ) ( not ( = ?auto_27841 ?auto_27878 ) ) ( not ( = ?auto_27842 ?auto_27845 ) ) ( not ( = ?auto_27842 ?auto_27878 ) ) ( not ( = ?auto_27843 ?auto_27845 ) ) ( not ( = ?auto_27843 ?auto_27878 ) ) ( not ( = ?auto_27845 ?auto_27882 ) ) ( not ( = ?auto_27845 ?auto_27868 ) ) ( not ( = ?auto_27845 ?auto_27873 ) ) ( not ( = ?auto_27845 ?auto_27892 ) ) ( not ( = ?auto_27878 ?auto_27882 ) ) ( not ( = ?auto_27878 ?auto_27868 ) ) ( not ( = ?auto_27878 ?auto_27873 ) ) ( not ( = ?auto_27878 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27848 ) ) ( not ( = ?auto_27840 ?auto_27893 ) ) ( not ( = ?auto_27841 ?auto_27848 ) ) ( not ( = ?auto_27841 ?auto_27893 ) ) ( not ( = ?auto_27842 ?auto_27848 ) ) ( not ( = ?auto_27842 ?auto_27893 ) ) ( not ( = ?auto_27843 ?auto_27848 ) ) ( not ( = ?auto_27843 ?auto_27893 ) ) ( not ( = ?auto_27844 ?auto_27848 ) ) ( not ( = ?auto_27844 ?auto_27893 ) ) ( not ( = ?auto_27848 ?auto_27878 ) ) ( not ( = ?auto_27848 ?auto_27882 ) ) ( not ( = ?auto_27848 ?auto_27868 ) ) ( not ( = ?auto_27848 ?auto_27873 ) ) ( not ( = ?auto_27848 ?auto_27892 ) ) ( not ( = ?auto_27867 ?auto_27884 ) ) ( not ( = ?auto_27867 ?auto_27872 ) ) ( not ( = ?auto_27867 ?auto_27876 ) ) ( not ( = ?auto_27867 ?auto_27895 ) ) ( not ( = ?auto_27870 ?auto_27875 ) ) ( not ( = ?auto_27870 ?auto_27863 ) ) ( not ( = ?auto_27870 ?auto_27894 ) ) ( not ( = ?auto_27870 ?auto_27886 ) ) ( not ( = ?auto_27893 ?auto_27878 ) ) ( not ( = ?auto_27893 ?auto_27882 ) ) ( not ( = ?auto_27893 ?auto_27868 ) ) ( not ( = ?auto_27893 ?auto_27873 ) ) ( not ( = ?auto_27893 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27847 ) ) ( not ( = ?auto_27840 ?auto_27890 ) ) ( not ( = ?auto_27841 ?auto_27847 ) ) ( not ( = ?auto_27841 ?auto_27890 ) ) ( not ( = ?auto_27842 ?auto_27847 ) ) ( not ( = ?auto_27842 ?auto_27890 ) ) ( not ( = ?auto_27843 ?auto_27847 ) ) ( not ( = ?auto_27843 ?auto_27890 ) ) ( not ( = ?auto_27844 ?auto_27847 ) ) ( not ( = ?auto_27844 ?auto_27890 ) ) ( not ( = ?auto_27845 ?auto_27847 ) ) ( not ( = ?auto_27845 ?auto_27890 ) ) ( not ( = ?auto_27847 ?auto_27893 ) ) ( not ( = ?auto_27847 ?auto_27878 ) ) ( not ( = ?auto_27847 ?auto_27882 ) ) ( not ( = ?auto_27847 ?auto_27868 ) ) ( not ( = ?auto_27847 ?auto_27873 ) ) ( not ( = ?auto_27847 ?auto_27892 ) ) ( not ( = ?auto_27887 ?auto_27867 ) ) ( not ( = ?auto_27887 ?auto_27884 ) ) ( not ( = ?auto_27887 ?auto_27872 ) ) ( not ( = ?auto_27887 ?auto_27876 ) ) ( not ( = ?auto_27887 ?auto_27895 ) ) ( not ( = ?auto_27881 ?auto_27870 ) ) ( not ( = ?auto_27881 ?auto_27875 ) ) ( not ( = ?auto_27881 ?auto_27863 ) ) ( not ( = ?auto_27881 ?auto_27894 ) ) ( not ( = ?auto_27881 ?auto_27886 ) ) ( not ( = ?auto_27890 ?auto_27893 ) ) ( not ( = ?auto_27890 ?auto_27878 ) ) ( not ( = ?auto_27890 ?auto_27882 ) ) ( not ( = ?auto_27890 ?auto_27868 ) ) ( not ( = ?auto_27890 ?auto_27873 ) ) ( not ( = ?auto_27890 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27846 ) ) ( not ( = ?auto_27840 ?auto_27891 ) ) ( not ( = ?auto_27841 ?auto_27846 ) ) ( not ( = ?auto_27841 ?auto_27891 ) ) ( not ( = ?auto_27842 ?auto_27846 ) ) ( not ( = ?auto_27842 ?auto_27891 ) ) ( not ( = ?auto_27843 ?auto_27846 ) ) ( not ( = ?auto_27843 ?auto_27891 ) ) ( not ( = ?auto_27844 ?auto_27846 ) ) ( not ( = ?auto_27844 ?auto_27891 ) ) ( not ( = ?auto_27845 ?auto_27846 ) ) ( not ( = ?auto_27845 ?auto_27891 ) ) ( not ( = ?auto_27848 ?auto_27846 ) ) ( not ( = ?auto_27848 ?auto_27891 ) ) ( not ( = ?auto_27846 ?auto_27890 ) ) ( not ( = ?auto_27846 ?auto_27893 ) ) ( not ( = ?auto_27846 ?auto_27878 ) ) ( not ( = ?auto_27846 ?auto_27882 ) ) ( not ( = ?auto_27846 ?auto_27868 ) ) ( not ( = ?auto_27846 ?auto_27873 ) ) ( not ( = ?auto_27846 ?auto_27892 ) ) ( not ( = ?auto_27880 ?auto_27887 ) ) ( not ( = ?auto_27880 ?auto_27867 ) ) ( not ( = ?auto_27880 ?auto_27884 ) ) ( not ( = ?auto_27880 ?auto_27872 ) ) ( not ( = ?auto_27880 ?auto_27876 ) ) ( not ( = ?auto_27880 ?auto_27895 ) ) ( not ( = ?auto_27864 ?auto_27881 ) ) ( not ( = ?auto_27864 ?auto_27870 ) ) ( not ( = ?auto_27864 ?auto_27875 ) ) ( not ( = ?auto_27864 ?auto_27863 ) ) ( not ( = ?auto_27864 ?auto_27894 ) ) ( not ( = ?auto_27864 ?auto_27886 ) ) ( not ( = ?auto_27891 ?auto_27890 ) ) ( not ( = ?auto_27891 ?auto_27893 ) ) ( not ( = ?auto_27891 ?auto_27878 ) ) ( not ( = ?auto_27891 ?auto_27882 ) ) ( not ( = ?auto_27891 ?auto_27868 ) ) ( not ( = ?auto_27891 ?auto_27873 ) ) ( not ( = ?auto_27891 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27849 ) ) ( not ( = ?auto_27840 ?auto_27879 ) ) ( not ( = ?auto_27841 ?auto_27849 ) ) ( not ( = ?auto_27841 ?auto_27879 ) ) ( not ( = ?auto_27842 ?auto_27849 ) ) ( not ( = ?auto_27842 ?auto_27879 ) ) ( not ( = ?auto_27843 ?auto_27849 ) ) ( not ( = ?auto_27843 ?auto_27879 ) ) ( not ( = ?auto_27844 ?auto_27849 ) ) ( not ( = ?auto_27844 ?auto_27879 ) ) ( not ( = ?auto_27845 ?auto_27849 ) ) ( not ( = ?auto_27845 ?auto_27879 ) ) ( not ( = ?auto_27848 ?auto_27849 ) ) ( not ( = ?auto_27848 ?auto_27879 ) ) ( not ( = ?auto_27847 ?auto_27849 ) ) ( not ( = ?auto_27847 ?auto_27879 ) ) ( not ( = ?auto_27849 ?auto_27891 ) ) ( not ( = ?auto_27849 ?auto_27890 ) ) ( not ( = ?auto_27849 ?auto_27893 ) ) ( not ( = ?auto_27849 ?auto_27878 ) ) ( not ( = ?auto_27849 ?auto_27882 ) ) ( not ( = ?auto_27849 ?auto_27868 ) ) ( not ( = ?auto_27849 ?auto_27873 ) ) ( not ( = ?auto_27849 ?auto_27892 ) ) ( not ( = ?auto_27860 ?auto_27880 ) ) ( not ( = ?auto_27860 ?auto_27887 ) ) ( not ( = ?auto_27860 ?auto_27867 ) ) ( not ( = ?auto_27860 ?auto_27884 ) ) ( not ( = ?auto_27860 ?auto_27872 ) ) ( not ( = ?auto_27860 ?auto_27876 ) ) ( not ( = ?auto_27860 ?auto_27895 ) ) ( not ( = ?auto_27862 ?auto_27864 ) ) ( not ( = ?auto_27862 ?auto_27881 ) ) ( not ( = ?auto_27862 ?auto_27870 ) ) ( not ( = ?auto_27862 ?auto_27875 ) ) ( not ( = ?auto_27862 ?auto_27863 ) ) ( not ( = ?auto_27862 ?auto_27894 ) ) ( not ( = ?auto_27862 ?auto_27886 ) ) ( not ( = ?auto_27879 ?auto_27891 ) ) ( not ( = ?auto_27879 ?auto_27890 ) ) ( not ( = ?auto_27879 ?auto_27893 ) ) ( not ( = ?auto_27879 ?auto_27878 ) ) ( not ( = ?auto_27879 ?auto_27882 ) ) ( not ( = ?auto_27879 ?auto_27868 ) ) ( not ( = ?auto_27879 ?auto_27873 ) ) ( not ( = ?auto_27879 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27851 ) ) ( not ( = ?auto_27840 ?auto_27889 ) ) ( not ( = ?auto_27841 ?auto_27851 ) ) ( not ( = ?auto_27841 ?auto_27889 ) ) ( not ( = ?auto_27842 ?auto_27851 ) ) ( not ( = ?auto_27842 ?auto_27889 ) ) ( not ( = ?auto_27843 ?auto_27851 ) ) ( not ( = ?auto_27843 ?auto_27889 ) ) ( not ( = ?auto_27844 ?auto_27851 ) ) ( not ( = ?auto_27844 ?auto_27889 ) ) ( not ( = ?auto_27845 ?auto_27851 ) ) ( not ( = ?auto_27845 ?auto_27889 ) ) ( not ( = ?auto_27848 ?auto_27851 ) ) ( not ( = ?auto_27848 ?auto_27889 ) ) ( not ( = ?auto_27847 ?auto_27851 ) ) ( not ( = ?auto_27847 ?auto_27889 ) ) ( not ( = ?auto_27846 ?auto_27851 ) ) ( not ( = ?auto_27846 ?auto_27889 ) ) ( not ( = ?auto_27851 ?auto_27879 ) ) ( not ( = ?auto_27851 ?auto_27891 ) ) ( not ( = ?auto_27851 ?auto_27890 ) ) ( not ( = ?auto_27851 ?auto_27893 ) ) ( not ( = ?auto_27851 ?auto_27878 ) ) ( not ( = ?auto_27851 ?auto_27882 ) ) ( not ( = ?auto_27851 ?auto_27868 ) ) ( not ( = ?auto_27851 ?auto_27873 ) ) ( not ( = ?auto_27851 ?auto_27892 ) ) ( not ( = ?auto_27866 ?auto_27860 ) ) ( not ( = ?auto_27866 ?auto_27880 ) ) ( not ( = ?auto_27866 ?auto_27887 ) ) ( not ( = ?auto_27866 ?auto_27867 ) ) ( not ( = ?auto_27866 ?auto_27884 ) ) ( not ( = ?auto_27866 ?auto_27872 ) ) ( not ( = ?auto_27866 ?auto_27876 ) ) ( not ( = ?auto_27866 ?auto_27895 ) ) ( not ( = ?auto_27869 ?auto_27862 ) ) ( not ( = ?auto_27869 ?auto_27864 ) ) ( not ( = ?auto_27869 ?auto_27881 ) ) ( not ( = ?auto_27869 ?auto_27870 ) ) ( not ( = ?auto_27869 ?auto_27875 ) ) ( not ( = ?auto_27869 ?auto_27863 ) ) ( not ( = ?auto_27869 ?auto_27894 ) ) ( not ( = ?auto_27869 ?auto_27886 ) ) ( not ( = ?auto_27889 ?auto_27879 ) ) ( not ( = ?auto_27889 ?auto_27891 ) ) ( not ( = ?auto_27889 ?auto_27890 ) ) ( not ( = ?auto_27889 ?auto_27893 ) ) ( not ( = ?auto_27889 ?auto_27878 ) ) ( not ( = ?auto_27889 ?auto_27882 ) ) ( not ( = ?auto_27889 ?auto_27868 ) ) ( not ( = ?auto_27889 ?auto_27873 ) ) ( not ( = ?auto_27889 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27850 ) ) ( not ( = ?auto_27840 ?auto_27885 ) ) ( not ( = ?auto_27841 ?auto_27850 ) ) ( not ( = ?auto_27841 ?auto_27885 ) ) ( not ( = ?auto_27842 ?auto_27850 ) ) ( not ( = ?auto_27842 ?auto_27885 ) ) ( not ( = ?auto_27843 ?auto_27850 ) ) ( not ( = ?auto_27843 ?auto_27885 ) ) ( not ( = ?auto_27844 ?auto_27850 ) ) ( not ( = ?auto_27844 ?auto_27885 ) ) ( not ( = ?auto_27845 ?auto_27850 ) ) ( not ( = ?auto_27845 ?auto_27885 ) ) ( not ( = ?auto_27848 ?auto_27850 ) ) ( not ( = ?auto_27848 ?auto_27885 ) ) ( not ( = ?auto_27847 ?auto_27850 ) ) ( not ( = ?auto_27847 ?auto_27885 ) ) ( not ( = ?auto_27846 ?auto_27850 ) ) ( not ( = ?auto_27846 ?auto_27885 ) ) ( not ( = ?auto_27849 ?auto_27850 ) ) ( not ( = ?auto_27849 ?auto_27885 ) ) ( not ( = ?auto_27850 ?auto_27889 ) ) ( not ( = ?auto_27850 ?auto_27879 ) ) ( not ( = ?auto_27850 ?auto_27891 ) ) ( not ( = ?auto_27850 ?auto_27890 ) ) ( not ( = ?auto_27850 ?auto_27893 ) ) ( not ( = ?auto_27850 ?auto_27878 ) ) ( not ( = ?auto_27850 ?auto_27882 ) ) ( not ( = ?auto_27850 ?auto_27868 ) ) ( not ( = ?auto_27850 ?auto_27873 ) ) ( not ( = ?auto_27850 ?auto_27892 ) ) ( not ( = ?auto_27885 ?auto_27889 ) ) ( not ( = ?auto_27885 ?auto_27879 ) ) ( not ( = ?auto_27885 ?auto_27891 ) ) ( not ( = ?auto_27885 ?auto_27890 ) ) ( not ( = ?auto_27885 ?auto_27893 ) ) ( not ( = ?auto_27885 ?auto_27878 ) ) ( not ( = ?auto_27885 ?auto_27882 ) ) ( not ( = ?auto_27885 ?auto_27868 ) ) ( not ( = ?auto_27885 ?auto_27873 ) ) ( not ( = ?auto_27885 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27852 ) ) ( not ( = ?auto_27840 ?auto_27877 ) ) ( not ( = ?auto_27841 ?auto_27852 ) ) ( not ( = ?auto_27841 ?auto_27877 ) ) ( not ( = ?auto_27842 ?auto_27852 ) ) ( not ( = ?auto_27842 ?auto_27877 ) ) ( not ( = ?auto_27843 ?auto_27852 ) ) ( not ( = ?auto_27843 ?auto_27877 ) ) ( not ( = ?auto_27844 ?auto_27852 ) ) ( not ( = ?auto_27844 ?auto_27877 ) ) ( not ( = ?auto_27845 ?auto_27852 ) ) ( not ( = ?auto_27845 ?auto_27877 ) ) ( not ( = ?auto_27848 ?auto_27852 ) ) ( not ( = ?auto_27848 ?auto_27877 ) ) ( not ( = ?auto_27847 ?auto_27852 ) ) ( not ( = ?auto_27847 ?auto_27877 ) ) ( not ( = ?auto_27846 ?auto_27852 ) ) ( not ( = ?auto_27846 ?auto_27877 ) ) ( not ( = ?auto_27849 ?auto_27852 ) ) ( not ( = ?auto_27849 ?auto_27877 ) ) ( not ( = ?auto_27851 ?auto_27852 ) ) ( not ( = ?auto_27851 ?auto_27877 ) ) ( not ( = ?auto_27852 ?auto_27885 ) ) ( not ( = ?auto_27852 ?auto_27889 ) ) ( not ( = ?auto_27852 ?auto_27879 ) ) ( not ( = ?auto_27852 ?auto_27891 ) ) ( not ( = ?auto_27852 ?auto_27890 ) ) ( not ( = ?auto_27852 ?auto_27893 ) ) ( not ( = ?auto_27852 ?auto_27878 ) ) ( not ( = ?auto_27852 ?auto_27882 ) ) ( not ( = ?auto_27852 ?auto_27868 ) ) ( not ( = ?auto_27852 ?auto_27873 ) ) ( not ( = ?auto_27852 ?auto_27892 ) ) ( not ( = ?auto_27877 ?auto_27885 ) ) ( not ( = ?auto_27877 ?auto_27889 ) ) ( not ( = ?auto_27877 ?auto_27879 ) ) ( not ( = ?auto_27877 ?auto_27891 ) ) ( not ( = ?auto_27877 ?auto_27890 ) ) ( not ( = ?auto_27877 ?auto_27893 ) ) ( not ( = ?auto_27877 ?auto_27878 ) ) ( not ( = ?auto_27877 ?auto_27882 ) ) ( not ( = ?auto_27877 ?auto_27868 ) ) ( not ( = ?auto_27877 ?auto_27873 ) ) ( not ( = ?auto_27877 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27854 ) ) ( not ( = ?auto_27840 ?auto_27871 ) ) ( not ( = ?auto_27841 ?auto_27854 ) ) ( not ( = ?auto_27841 ?auto_27871 ) ) ( not ( = ?auto_27842 ?auto_27854 ) ) ( not ( = ?auto_27842 ?auto_27871 ) ) ( not ( = ?auto_27843 ?auto_27854 ) ) ( not ( = ?auto_27843 ?auto_27871 ) ) ( not ( = ?auto_27844 ?auto_27854 ) ) ( not ( = ?auto_27844 ?auto_27871 ) ) ( not ( = ?auto_27845 ?auto_27854 ) ) ( not ( = ?auto_27845 ?auto_27871 ) ) ( not ( = ?auto_27848 ?auto_27854 ) ) ( not ( = ?auto_27848 ?auto_27871 ) ) ( not ( = ?auto_27847 ?auto_27854 ) ) ( not ( = ?auto_27847 ?auto_27871 ) ) ( not ( = ?auto_27846 ?auto_27854 ) ) ( not ( = ?auto_27846 ?auto_27871 ) ) ( not ( = ?auto_27849 ?auto_27854 ) ) ( not ( = ?auto_27849 ?auto_27871 ) ) ( not ( = ?auto_27851 ?auto_27854 ) ) ( not ( = ?auto_27851 ?auto_27871 ) ) ( not ( = ?auto_27850 ?auto_27854 ) ) ( not ( = ?auto_27850 ?auto_27871 ) ) ( not ( = ?auto_27854 ?auto_27877 ) ) ( not ( = ?auto_27854 ?auto_27885 ) ) ( not ( = ?auto_27854 ?auto_27889 ) ) ( not ( = ?auto_27854 ?auto_27879 ) ) ( not ( = ?auto_27854 ?auto_27891 ) ) ( not ( = ?auto_27854 ?auto_27890 ) ) ( not ( = ?auto_27854 ?auto_27893 ) ) ( not ( = ?auto_27854 ?auto_27878 ) ) ( not ( = ?auto_27854 ?auto_27882 ) ) ( not ( = ?auto_27854 ?auto_27868 ) ) ( not ( = ?auto_27854 ?auto_27873 ) ) ( not ( = ?auto_27854 ?auto_27892 ) ) ( not ( = ?auto_27871 ?auto_27877 ) ) ( not ( = ?auto_27871 ?auto_27885 ) ) ( not ( = ?auto_27871 ?auto_27889 ) ) ( not ( = ?auto_27871 ?auto_27879 ) ) ( not ( = ?auto_27871 ?auto_27891 ) ) ( not ( = ?auto_27871 ?auto_27890 ) ) ( not ( = ?auto_27871 ?auto_27893 ) ) ( not ( = ?auto_27871 ?auto_27878 ) ) ( not ( = ?auto_27871 ?auto_27882 ) ) ( not ( = ?auto_27871 ?auto_27868 ) ) ( not ( = ?auto_27871 ?auto_27873 ) ) ( not ( = ?auto_27871 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27853 ) ) ( not ( = ?auto_27840 ?auto_27888 ) ) ( not ( = ?auto_27841 ?auto_27853 ) ) ( not ( = ?auto_27841 ?auto_27888 ) ) ( not ( = ?auto_27842 ?auto_27853 ) ) ( not ( = ?auto_27842 ?auto_27888 ) ) ( not ( = ?auto_27843 ?auto_27853 ) ) ( not ( = ?auto_27843 ?auto_27888 ) ) ( not ( = ?auto_27844 ?auto_27853 ) ) ( not ( = ?auto_27844 ?auto_27888 ) ) ( not ( = ?auto_27845 ?auto_27853 ) ) ( not ( = ?auto_27845 ?auto_27888 ) ) ( not ( = ?auto_27848 ?auto_27853 ) ) ( not ( = ?auto_27848 ?auto_27888 ) ) ( not ( = ?auto_27847 ?auto_27853 ) ) ( not ( = ?auto_27847 ?auto_27888 ) ) ( not ( = ?auto_27846 ?auto_27853 ) ) ( not ( = ?auto_27846 ?auto_27888 ) ) ( not ( = ?auto_27849 ?auto_27853 ) ) ( not ( = ?auto_27849 ?auto_27888 ) ) ( not ( = ?auto_27851 ?auto_27853 ) ) ( not ( = ?auto_27851 ?auto_27888 ) ) ( not ( = ?auto_27850 ?auto_27853 ) ) ( not ( = ?auto_27850 ?auto_27888 ) ) ( not ( = ?auto_27852 ?auto_27853 ) ) ( not ( = ?auto_27852 ?auto_27888 ) ) ( not ( = ?auto_27853 ?auto_27871 ) ) ( not ( = ?auto_27853 ?auto_27877 ) ) ( not ( = ?auto_27853 ?auto_27885 ) ) ( not ( = ?auto_27853 ?auto_27889 ) ) ( not ( = ?auto_27853 ?auto_27879 ) ) ( not ( = ?auto_27853 ?auto_27891 ) ) ( not ( = ?auto_27853 ?auto_27890 ) ) ( not ( = ?auto_27853 ?auto_27893 ) ) ( not ( = ?auto_27853 ?auto_27878 ) ) ( not ( = ?auto_27853 ?auto_27882 ) ) ( not ( = ?auto_27853 ?auto_27868 ) ) ( not ( = ?auto_27853 ?auto_27873 ) ) ( not ( = ?auto_27853 ?auto_27892 ) ) ( not ( = ?auto_27888 ?auto_27871 ) ) ( not ( = ?auto_27888 ?auto_27877 ) ) ( not ( = ?auto_27888 ?auto_27885 ) ) ( not ( = ?auto_27888 ?auto_27889 ) ) ( not ( = ?auto_27888 ?auto_27879 ) ) ( not ( = ?auto_27888 ?auto_27891 ) ) ( not ( = ?auto_27888 ?auto_27890 ) ) ( not ( = ?auto_27888 ?auto_27893 ) ) ( not ( = ?auto_27888 ?auto_27878 ) ) ( not ( = ?auto_27888 ?auto_27882 ) ) ( not ( = ?auto_27888 ?auto_27868 ) ) ( not ( = ?auto_27888 ?auto_27873 ) ) ( not ( = ?auto_27888 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27855 ) ) ( not ( = ?auto_27840 ?auto_27874 ) ) ( not ( = ?auto_27841 ?auto_27855 ) ) ( not ( = ?auto_27841 ?auto_27874 ) ) ( not ( = ?auto_27842 ?auto_27855 ) ) ( not ( = ?auto_27842 ?auto_27874 ) ) ( not ( = ?auto_27843 ?auto_27855 ) ) ( not ( = ?auto_27843 ?auto_27874 ) ) ( not ( = ?auto_27844 ?auto_27855 ) ) ( not ( = ?auto_27844 ?auto_27874 ) ) ( not ( = ?auto_27845 ?auto_27855 ) ) ( not ( = ?auto_27845 ?auto_27874 ) ) ( not ( = ?auto_27848 ?auto_27855 ) ) ( not ( = ?auto_27848 ?auto_27874 ) ) ( not ( = ?auto_27847 ?auto_27855 ) ) ( not ( = ?auto_27847 ?auto_27874 ) ) ( not ( = ?auto_27846 ?auto_27855 ) ) ( not ( = ?auto_27846 ?auto_27874 ) ) ( not ( = ?auto_27849 ?auto_27855 ) ) ( not ( = ?auto_27849 ?auto_27874 ) ) ( not ( = ?auto_27851 ?auto_27855 ) ) ( not ( = ?auto_27851 ?auto_27874 ) ) ( not ( = ?auto_27850 ?auto_27855 ) ) ( not ( = ?auto_27850 ?auto_27874 ) ) ( not ( = ?auto_27852 ?auto_27855 ) ) ( not ( = ?auto_27852 ?auto_27874 ) ) ( not ( = ?auto_27854 ?auto_27855 ) ) ( not ( = ?auto_27854 ?auto_27874 ) ) ( not ( = ?auto_27855 ?auto_27888 ) ) ( not ( = ?auto_27855 ?auto_27871 ) ) ( not ( = ?auto_27855 ?auto_27877 ) ) ( not ( = ?auto_27855 ?auto_27885 ) ) ( not ( = ?auto_27855 ?auto_27889 ) ) ( not ( = ?auto_27855 ?auto_27879 ) ) ( not ( = ?auto_27855 ?auto_27891 ) ) ( not ( = ?auto_27855 ?auto_27890 ) ) ( not ( = ?auto_27855 ?auto_27893 ) ) ( not ( = ?auto_27855 ?auto_27878 ) ) ( not ( = ?auto_27855 ?auto_27882 ) ) ( not ( = ?auto_27855 ?auto_27868 ) ) ( not ( = ?auto_27855 ?auto_27873 ) ) ( not ( = ?auto_27855 ?auto_27892 ) ) ( not ( = ?auto_27883 ?auto_27880 ) ) ( not ( = ?auto_27883 ?auto_27895 ) ) ( not ( = ?auto_27883 ?auto_27884 ) ) ( not ( = ?auto_27883 ?auto_27876 ) ) ( not ( = ?auto_27883 ?auto_27866 ) ) ( not ( = ?auto_27883 ?auto_27860 ) ) ( not ( = ?auto_27883 ?auto_27887 ) ) ( not ( = ?auto_27883 ?auto_27867 ) ) ( not ( = ?auto_27883 ?auto_27872 ) ) ( not ( = ?auto_27865 ?auto_27864 ) ) ( not ( = ?auto_27865 ?auto_27886 ) ) ( not ( = ?auto_27865 ?auto_27875 ) ) ( not ( = ?auto_27865 ?auto_27894 ) ) ( not ( = ?auto_27865 ?auto_27869 ) ) ( not ( = ?auto_27865 ?auto_27862 ) ) ( not ( = ?auto_27865 ?auto_27881 ) ) ( not ( = ?auto_27865 ?auto_27870 ) ) ( not ( = ?auto_27865 ?auto_27863 ) ) ( not ( = ?auto_27874 ?auto_27888 ) ) ( not ( = ?auto_27874 ?auto_27871 ) ) ( not ( = ?auto_27874 ?auto_27877 ) ) ( not ( = ?auto_27874 ?auto_27885 ) ) ( not ( = ?auto_27874 ?auto_27889 ) ) ( not ( = ?auto_27874 ?auto_27879 ) ) ( not ( = ?auto_27874 ?auto_27891 ) ) ( not ( = ?auto_27874 ?auto_27890 ) ) ( not ( = ?auto_27874 ?auto_27893 ) ) ( not ( = ?auto_27874 ?auto_27878 ) ) ( not ( = ?auto_27874 ?auto_27882 ) ) ( not ( = ?auto_27874 ?auto_27868 ) ) ( not ( = ?auto_27874 ?auto_27873 ) ) ( not ( = ?auto_27874 ?auto_27892 ) ) ( not ( = ?auto_27840 ?auto_27856 ) ) ( not ( = ?auto_27840 ?auto_27859 ) ) ( not ( = ?auto_27841 ?auto_27856 ) ) ( not ( = ?auto_27841 ?auto_27859 ) ) ( not ( = ?auto_27842 ?auto_27856 ) ) ( not ( = ?auto_27842 ?auto_27859 ) ) ( not ( = ?auto_27843 ?auto_27856 ) ) ( not ( = ?auto_27843 ?auto_27859 ) ) ( not ( = ?auto_27844 ?auto_27856 ) ) ( not ( = ?auto_27844 ?auto_27859 ) ) ( not ( = ?auto_27845 ?auto_27856 ) ) ( not ( = ?auto_27845 ?auto_27859 ) ) ( not ( = ?auto_27848 ?auto_27856 ) ) ( not ( = ?auto_27848 ?auto_27859 ) ) ( not ( = ?auto_27847 ?auto_27856 ) ) ( not ( = ?auto_27847 ?auto_27859 ) ) ( not ( = ?auto_27846 ?auto_27856 ) ) ( not ( = ?auto_27846 ?auto_27859 ) ) ( not ( = ?auto_27849 ?auto_27856 ) ) ( not ( = ?auto_27849 ?auto_27859 ) ) ( not ( = ?auto_27851 ?auto_27856 ) ) ( not ( = ?auto_27851 ?auto_27859 ) ) ( not ( = ?auto_27850 ?auto_27856 ) ) ( not ( = ?auto_27850 ?auto_27859 ) ) ( not ( = ?auto_27852 ?auto_27856 ) ) ( not ( = ?auto_27852 ?auto_27859 ) ) ( not ( = ?auto_27854 ?auto_27856 ) ) ( not ( = ?auto_27854 ?auto_27859 ) ) ( not ( = ?auto_27853 ?auto_27856 ) ) ( not ( = ?auto_27853 ?auto_27859 ) ) ( not ( = ?auto_27856 ?auto_27874 ) ) ( not ( = ?auto_27856 ?auto_27888 ) ) ( not ( = ?auto_27856 ?auto_27871 ) ) ( not ( = ?auto_27856 ?auto_27877 ) ) ( not ( = ?auto_27856 ?auto_27885 ) ) ( not ( = ?auto_27856 ?auto_27889 ) ) ( not ( = ?auto_27856 ?auto_27879 ) ) ( not ( = ?auto_27856 ?auto_27891 ) ) ( not ( = ?auto_27856 ?auto_27890 ) ) ( not ( = ?auto_27856 ?auto_27893 ) ) ( not ( = ?auto_27856 ?auto_27878 ) ) ( not ( = ?auto_27856 ?auto_27882 ) ) ( not ( = ?auto_27856 ?auto_27868 ) ) ( not ( = ?auto_27856 ?auto_27873 ) ) ( not ( = ?auto_27856 ?auto_27892 ) ) ( not ( = ?auto_27859 ?auto_27874 ) ) ( not ( = ?auto_27859 ?auto_27888 ) ) ( not ( = ?auto_27859 ?auto_27871 ) ) ( not ( = ?auto_27859 ?auto_27877 ) ) ( not ( = ?auto_27859 ?auto_27885 ) ) ( not ( = ?auto_27859 ?auto_27889 ) ) ( not ( = ?auto_27859 ?auto_27879 ) ) ( not ( = ?auto_27859 ?auto_27891 ) ) ( not ( = ?auto_27859 ?auto_27890 ) ) ( not ( = ?auto_27859 ?auto_27893 ) ) ( not ( = ?auto_27859 ?auto_27878 ) ) ( not ( = ?auto_27859 ?auto_27882 ) ) ( not ( = ?auto_27859 ?auto_27868 ) ) ( not ( = ?auto_27859 ?auto_27873 ) ) ( not ( = ?auto_27859 ?auto_27892 ) ) )
    :subtasks
    ( ( MAKE-15CRATE ?auto_27840 ?auto_27841 ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 ?auto_27848 ?auto_27847 ?auto_27846 ?auto_27849 ?auto_27851 ?auto_27850 ?auto_27852 ?auto_27854 ?auto_27853 ?auto_27855 )
      ( MAKE-1CRATE ?auto_27855 ?auto_27856 )
      ( MAKE-16CRATE-VERIFY ?auto_27840 ?auto_27841 ?auto_27842 ?auto_27843 ?auto_27844 ?auto_27845 ?auto_27848 ?auto_27847 ?auto_27846 ?auto_27849 ?auto_27851 ?auto_27850 ?auto_27852 ?auto_27854 ?auto_27853 ?auto_27855 ?auto_27856 ) )
  )

)

