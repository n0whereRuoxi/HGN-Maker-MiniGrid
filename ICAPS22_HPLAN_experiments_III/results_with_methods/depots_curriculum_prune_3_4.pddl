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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_419 - SURFACE
      ?auto_420 - SURFACE
    )
    :vars
    (
      ?auto_421 - HOIST
      ?auto_422 - PLACE
      ?auto_424 - PLACE
      ?auto_425 - HOIST
      ?auto_426 - SURFACE
      ?auto_423 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_421 ?auto_422 ) ( SURFACE-AT ?auto_419 ?auto_422 ) ( CLEAR ?auto_419 ) ( IS-CRATE ?auto_420 ) ( AVAILABLE ?auto_421 ) ( not ( = ?auto_424 ?auto_422 ) ) ( HOIST-AT ?auto_425 ?auto_424 ) ( AVAILABLE ?auto_425 ) ( SURFACE-AT ?auto_420 ?auto_424 ) ( ON ?auto_420 ?auto_426 ) ( CLEAR ?auto_420 ) ( TRUCK-AT ?auto_423 ?auto_422 ) ( not ( = ?auto_419 ?auto_420 ) ) ( not ( = ?auto_419 ?auto_426 ) ) ( not ( = ?auto_420 ?auto_426 ) ) ( not ( = ?auto_421 ?auto_425 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_423 ?auto_422 ?auto_424 )
      ( !LIFT ?auto_425 ?auto_420 ?auto_426 ?auto_424 )
      ( !LOAD ?auto_425 ?auto_420 ?auto_423 ?auto_424 )
      ( !DRIVE ?auto_423 ?auto_424 ?auto_422 )
      ( !UNLOAD ?auto_421 ?auto_420 ?auto_423 ?auto_422 )
      ( !DROP ?auto_421 ?auto_420 ?auto_419 ?auto_422 )
      ( MAKE-1CRATE-VERIFY ?auto_419 ?auto_420 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_440 - SURFACE
      ?auto_441 - SURFACE
      ?auto_442 - SURFACE
    )
    :vars
    (
      ?auto_447 - HOIST
      ?auto_445 - PLACE
      ?auto_446 - PLACE
      ?auto_444 - HOIST
      ?auto_448 - SURFACE
      ?auto_451 - PLACE
      ?auto_449 - HOIST
      ?auto_450 - SURFACE
      ?auto_443 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447 ?auto_445 ) ( IS-CRATE ?auto_442 ) ( not ( = ?auto_446 ?auto_445 ) ) ( HOIST-AT ?auto_444 ?auto_446 ) ( AVAILABLE ?auto_444 ) ( SURFACE-AT ?auto_442 ?auto_446 ) ( ON ?auto_442 ?auto_448 ) ( CLEAR ?auto_442 ) ( not ( = ?auto_441 ?auto_442 ) ) ( not ( = ?auto_441 ?auto_448 ) ) ( not ( = ?auto_442 ?auto_448 ) ) ( not ( = ?auto_447 ?auto_444 ) ) ( SURFACE-AT ?auto_440 ?auto_445 ) ( CLEAR ?auto_440 ) ( IS-CRATE ?auto_441 ) ( AVAILABLE ?auto_447 ) ( not ( = ?auto_451 ?auto_445 ) ) ( HOIST-AT ?auto_449 ?auto_451 ) ( AVAILABLE ?auto_449 ) ( SURFACE-AT ?auto_441 ?auto_451 ) ( ON ?auto_441 ?auto_450 ) ( CLEAR ?auto_441 ) ( TRUCK-AT ?auto_443 ?auto_445 ) ( not ( = ?auto_440 ?auto_441 ) ) ( not ( = ?auto_440 ?auto_450 ) ) ( not ( = ?auto_441 ?auto_450 ) ) ( not ( = ?auto_447 ?auto_449 ) ) ( not ( = ?auto_440 ?auto_442 ) ) ( not ( = ?auto_440 ?auto_448 ) ) ( not ( = ?auto_442 ?auto_450 ) ) ( not ( = ?auto_446 ?auto_451 ) ) ( not ( = ?auto_444 ?auto_449 ) ) ( not ( = ?auto_448 ?auto_450 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440 ?auto_441 )
      ( MAKE-1CRATE ?auto_441 ?auto_442 )
      ( MAKE-2CRATE-VERIFY ?auto_440 ?auto_441 ?auto_442 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_466 - SURFACE
      ?auto_467 - SURFACE
      ?auto_468 - SURFACE
      ?auto_469 - SURFACE
    )
    :vars
    (
      ?auto_472 - HOIST
      ?auto_470 - PLACE
      ?auto_475 - PLACE
      ?auto_473 - HOIST
      ?auto_471 - SURFACE
      ?auto_477 - PLACE
      ?auto_479 - HOIST
      ?auto_476 - SURFACE
      ?auto_478 - SURFACE
      ?auto_474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_472 ?auto_470 ) ( IS-CRATE ?auto_469 ) ( not ( = ?auto_475 ?auto_470 ) ) ( HOIST-AT ?auto_473 ?auto_475 ) ( SURFACE-AT ?auto_469 ?auto_475 ) ( ON ?auto_469 ?auto_471 ) ( CLEAR ?auto_469 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_468 ?auto_471 ) ) ( not ( = ?auto_469 ?auto_471 ) ) ( not ( = ?auto_472 ?auto_473 ) ) ( IS-CRATE ?auto_468 ) ( not ( = ?auto_477 ?auto_470 ) ) ( HOIST-AT ?auto_479 ?auto_477 ) ( AVAILABLE ?auto_479 ) ( SURFACE-AT ?auto_468 ?auto_477 ) ( ON ?auto_468 ?auto_476 ) ( CLEAR ?auto_468 ) ( not ( = ?auto_467 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_476 ) ) ( not ( = ?auto_468 ?auto_476 ) ) ( not ( = ?auto_472 ?auto_479 ) ) ( SURFACE-AT ?auto_466 ?auto_470 ) ( CLEAR ?auto_466 ) ( IS-CRATE ?auto_467 ) ( AVAILABLE ?auto_472 ) ( AVAILABLE ?auto_473 ) ( SURFACE-AT ?auto_467 ?auto_475 ) ( ON ?auto_467 ?auto_478 ) ( CLEAR ?auto_467 ) ( TRUCK-AT ?auto_474 ?auto_470 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_466 ?auto_478 ) ) ( not ( = ?auto_467 ?auto_478 ) ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_466 ?auto_476 ) ) ( not ( = ?auto_468 ?auto_478 ) ) ( not ( = ?auto_477 ?auto_475 ) ) ( not ( = ?auto_479 ?auto_473 ) ) ( not ( = ?auto_476 ?auto_478 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_471 ) ) ( not ( = ?auto_467 ?auto_469 ) ) ( not ( = ?auto_467 ?auto_471 ) ) ( not ( = ?auto_469 ?auto_476 ) ) ( not ( = ?auto_469 ?auto_478 ) ) ( not ( = ?auto_471 ?auto_476 ) ) ( not ( = ?auto_471 ?auto_478 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_466 ?auto_467 ?auto_468 )
      ( MAKE-1CRATE ?auto_468 ?auto_469 )
      ( MAKE-3CRATE-VERIFY ?auto_466 ?auto_467 ?auto_468 ?auto_469 ) )
  )

)

