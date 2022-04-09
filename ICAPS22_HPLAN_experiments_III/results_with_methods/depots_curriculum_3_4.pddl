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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_429 - SURFACE
      ?auto_430 - SURFACE
    )
    :vars
    (
      ?auto_431 - HOIST
      ?auto_432 - PLACE
      ?auto_434 - PLACE
      ?auto_435 - HOIST
      ?auto_436 - SURFACE
      ?auto_433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_431 ?auto_432 ) ( SURFACE-AT ?auto_429 ?auto_432 ) ( CLEAR ?auto_429 ) ( IS-CRATE ?auto_430 ) ( AVAILABLE ?auto_431 ) ( not ( = ?auto_434 ?auto_432 ) ) ( HOIST-AT ?auto_435 ?auto_434 ) ( AVAILABLE ?auto_435 ) ( SURFACE-AT ?auto_430 ?auto_434 ) ( ON ?auto_430 ?auto_436 ) ( CLEAR ?auto_430 ) ( TRUCK-AT ?auto_433 ?auto_432 ) ( not ( = ?auto_429 ?auto_430 ) ) ( not ( = ?auto_429 ?auto_436 ) ) ( not ( = ?auto_430 ?auto_436 ) ) ( not ( = ?auto_431 ?auto_435 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_433 ?auto_432 ?auto_434 )
      ( !LIFT ?auto_435 ?auto_430 ?auto_436 ?auto_434 )
      ( !LOAD ?auto_435 ?auto_430 ?auto_433 ?auto_434 )
      ( !DRIVE ?auto_433 ?auto_434 ?auto_432 )
      ( !UNLOAD ?auto_431 ?auto_430 ?auto_433 ?auto_432 )
      ( !DROP ?auto_431 ?auto_430 ?auto_429 ?auto_432 )
      ( MAKE-1CRATE-VERIFY ?auto_429 ?auto_430 ) )
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
      ?auto_448 - PLACE
      ?auto_445 - PLACE
      ?auto_446 - HOIST
      ?auto_443 - SURFACE
      ?auto_449 - PLACE
      ?auto_450 - HOIST
      ?auto_451 - SURFACE
      ?auto_444 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_447 ?auto_448 ) ( IS-CRATE ?auto_442 ) ( not ( = ?auto_445 ?auto_448 ) ) ( HOIST-AT ?auto_446 ?auto_445 ) ( AVAILABLE ?auto_446 ) ( SURFACE-AT ?auto_442 ?auto_445 ) ( ON ?auto_442 ?auto_443 ) ( CLEAR ?auto_442 ) ( not ( = ?auto_441 ?auto_442 ) ) ( not ( = ?auto_441 ?auto_443 ) ) ( not ( = ?auto_442 ?auto_443 ) ) ( not ( = ?auto_447 ?auto_446 ) ) ( SURFACE-AT ?auto_440 ?auto_448 ) ( CLEAR ?auto_440 ) ( IS-CRATE ?auto_441 ) ( AVAILABLE ?auto_447 ) ( not ( = ?auto_449 ?auto_448 ) ) ( HOIST-AT ?auto_450 ?auto_449 ) ( AVAILABLE ?auto_450 ) ( SURFACE-AT ?auto_441 ?auto_449 ) ( ON ?auto_441 ?auto_451 ) ( CLEAR ?auto_441 ) ( TRUCK-AT ?auto_444 ?auto_448 ) ( not ( = ?auto_440 ?auto_441 ) ) ( not ( = ?auto_440 ?auto_451 ) ) ( not ( = ?auto_441 ?auto_451 ) ) ( not ( = ?auto_447 ?auto_450 ) ) ( not ( = ?auto_440 ?auto_442 ) ) ( not ( = ?auto_440 ?auto_443 ) ) ( not ( = ?auto_442 ?auto_451 ) ) ( not ( = ?auto_445 ?auto_449 ) ) ( not ( = ?auto_446 ?auto_450 ) ) ( not ( = ?auto_443 ?auto_451 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_440 ?auto_441 )
      ( MAKE-1CRATE ?auto_441 ?auto_442 )
      ( MAKE-2CRATE-VERIFY ?auto_440 ?auto_441 ?auto_442 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_454 - SURFACE
      ?auto_455 - SURFACE
    )
    :vars
    (
      ?auto_456 - HOIST
      ?auto_457 - PLACE
      ?auto_459 - PLACE
      ?auto_460 - HOIST
      ?auto_461 - SURFACE
      ?auto_458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_456 ?auto_457 ) ( SURFACE-AT ?auto_454 ?auto_457 ) ( CLEAR ?auto_454 ) ( IS-CRATE ?auto_455 ) ( AVAILABLE ?auto_456 ) ( not ( = ?auto_459 ?auto_457 ) ) ( HOIST-AT ?auto_460 ?auto_459 ) ( AVAILABLE ?auto_460 ) ( SURFACE-AT ?auto_455 ?auto_459 ) ( ON ?auto_455 ?auto_461 ) ( CLEAR ?auto_455 ) ( TRUCK-AT ?auto_458 ?auto_457 ) ( not ( = ?auto_454 ?auto_455 ) ) ( not ( = ?auto_454 ?auto_461 ) ) ( not ( = ?auto_455 ?auto_461 ) ) ( not ( = ?auto_456 ?auto_460 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_458 ?auto_457 ?auto_459 )
      ( !LIFT ?auto_460 ?auto_455 ?auto_461 ?auto_459 )
      ( !LOAD ?auto_460 ?auto_455 ?auto_458 ?auto_459 )
      ( !DRIVE ?auto_458 ?auto_459 ?auto_457 )
      ( !UNLOAD ?auto_456 ?auto_455 ?auto_458 ?auto_457 )
      ( !DROP ?auto_456 ?auto_455 ?auto_454 ?auto_457 )
      ( MAKE-1CRATE-VERIFY ?auto_454 ?auto_455 ) )
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
      ?auto_475 - PLACE
      ?auto_471 - PLACE
      ?auto_470 - HOIST
      ?auto_473 - SURFACE
      ?auto_478 - PLACE
      ?auto_477 - HOIST
      ?auto_479 - SURFACE
      ?auto_476 - SURFACE
      ?auto_474 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_472 ?auto_475 ) ( IS-CRATE ?auto_469 ) ( not ( = ?auto_471 ?auto_475 ) ) ( HOIST-AT ?auto_470 ?auto_471 ) ( SURFACE-AT ?auto_469 ?auto_471 ) ( ON ?auto_469 ?auto_473 ) ( CLEAR ?auto_469 ) ( not ( = ?auto_468 ?auto_469 ) ) ( not ( = ?auto_468 ?auto_473 ) ) ( not ( = ?auto_469 ?auto_473 ) ) ( not ( = ?auto_472 ?auto_470 ) ) ( IS-CRATE ?auto_468 ) ( not ( = ?auto_478 ?auto_475 ) ) ( HOIST-AT ?auto_477 ?auto_478 ) ( AVAILABLE ?auto_477 ) ( SURFACE-AT ?auto_468 ?auto_478 ) ( ON ?auto_468 ?auto_479 ) ( CLEAR ?auto_468 ) ( not ( = ?auto_467 ?auto_468 ) ) ( not ( = ?auto_467 ?auto_479 ) ) ( not ( = ?auto_468 ?auto_479 ) ) ( not ( = ?auto_472 ?auto_477 ) ) ( SURFACE-AT ?auto_466 ?auto_475 ) ( CLEAR ?auto_466 ) ( IS-CRATE ?auto_467 ) ( AVAILABLE ?auto_472 ) ( AVAILABLE ?auto_470 ) ( SURFACE-AT ?auto_467 ?auto_471 ) ( ON ?auto_467 ?auto_476 ) ( CLEAR ?auto_467 ) ( TRUCK-AT ?auto_474 ?auto_475 ) ( not ( = ?auto_466 ?auto_467 ) ) ( not ( = ?auto_466 ?auto_476 ) ) ( not ( = ?auto_467 ?auto_476 ) ) ( not ( = ?auto_466 ?auto_468 ) ) ( not ( = ?auto_466 ?auto_479 ) ) ( not ( = ?auto_468 ?auto_476 ) ) ( not ( = ?auto_478 ?auto_471 ) ) ( not ( = ?auto_477 ?auto_470 ) ) ( not ( = ?auto_479 ?auto_476 ) ) ( not ( = ?auto_466 ?auto_469 ) ) ( not ( = ?auto_466 ?auto_473 ) ) ( not ( = ?auto_467 ?auto_469 ) ) ( not ( = ?auto_467 ?auto_473 ) ) ( not ( = ?auto_469 ?auto_479 ) ) ( not ( = ?auto_469 ?auto_476 ) ) ( not ( = ?auto_473 ?auto_479 ) ) ( not ( = ?auto_473 ?auto_476 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_466 ?auto_467 ?auto_468 )
      ( MAKE-1CRATE ?auto_468 ?auto_469 )
      ( MAKE-3CRATE-VERIFY ?auto_466 ?auto_467 ?auto_468 ?auto_469 ) )
  )

)

