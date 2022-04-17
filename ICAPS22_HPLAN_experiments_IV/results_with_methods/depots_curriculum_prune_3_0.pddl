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
      ?above - SURFACE
      ?below - SURFACE
    )
    :precondition
    ( and ( ON ?above ?below ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_23 - SURFACE
      ?auto_22 - SURFACE
    )
    :vars
    (
      ?auto_24 - HOIST
      ?auto_25 - PLACE
      ?auto_27 - PLACE
      ?auto_28 - HOIST
      ?auto_29 - SURFACE
      ?auto_26 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_24 ?auto_25 ) ( SURFACE-AT ?auto_22 ?auto_25 ) ( CLEAR ?auto_22 ) ( IS-CRATE ?auto_23 ) ( AVAILABLE ?auto_24 ) ( not ( = ?auto_27 ?auto_25 ) ) ( HOIST-AT ?auto_28 ?auto_27 ) ( AVAILABLE ?auto_28 ) ( SURFACE-AT ?auto_23 ?auto_27 ) ( ON ?auto_23 ?auto_29 ) ( CLEAR ?auto_23 ) ( TRUCK-AT ?auto_26 ?auto_25 ) ( not ( = ?auto_23 ?auto_22 ) ) ( not ( = ?auto_23 ?auto_29 ) ) ( not ( = ?auto_22 ?auto_29 ) ) ( not ( = ?auto_24 ?auto_28 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_26 ?auto_25 ?auto_27 )
      ( !LIFT ?auto_28 ?auto_23 ?auto_29 ?auto_27 )
      ( !LOAD ?auto_28 ?auto_23 ?auto_26 ?auto_27 )
      ( !DRIVE ?auto_26 ?auto_27 ?auto_25 )
      ( !UNLOAD ?auto_24 ?auto_23 ?auto_26 ?auto_25 )
      ( !DROP ?auto_24 ?auto_23 ?auto_22 ?auto_25 )
      ( MAKE-ON-VERIFY ?auto_23 ?auto_22 ) )
  )

)

