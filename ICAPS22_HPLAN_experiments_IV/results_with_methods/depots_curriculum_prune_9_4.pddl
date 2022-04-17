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

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_2112 - SURFACE
      ?auto_2113 - SURFACE
    )
    :vars
    (
      ?auto_2114 - HOIST
      ?auto_2115 - PLACE
      ?auto_2117 - PLACE
      ?auto_2118 - HOIST
      ?auto_2119 - SURFACE
      ?auto_2116 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_2114 ?auto_2115 ) ( SURFACE-AT ?auto_2113 ?auto_2115 ) ( CLEAR ?auto_2113 ) ( IS-CRATE ?auto_2112 ) ( AVAILABLE ?auto_2114 ) ( not ( = ?auto_2117 ?auto_2115 ) ) ( HOIST-AT ?auto_2118 ?auto_2117 ) ( AVAILABLE ?auto_2118 ) ( SURFACE-AT ?auto_2112 ?auto_2117 ) ( ON ?auto_2112 ?auto_2119 ) ( CLEAR ?auto_2112 ) ( TRUCK-AT ?auto_2116 ?auto_2115 ) ( not ( = ?auto_2112 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2119 ) ) ( not ( = ?auto_2113 ?auto_2119 ) ) ( not ( = ?auto_2114 ?auto_2118 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_2116 ?auto_2115 ?auto_2117 )
      ( !LIFT ?auto_2118 ?auto_2112 ?auto_2119 ?auto_2117 )
      ( !LOAD ?auto_2118 ?auto_2112 ?auto_2116 ?auto_2117 )
      ( !DRIVE ?auto_2116 ?auto_2117 ?auto_2115 )
      ( !UNLOAD ?auto_2114 ?auto_2112 ?auto_2116 ?auto_2115 )
      ( !DROP ?auto_2114 ?auto_2112 ?auto_2113 ?auto_2115 )
      ( MAKE-ON-VERIFY ?auto_2112 ?auto_2113 ) )
  )

)

