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

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_450 - SURFACE
      ?auto_451 - SURFACE
    )
    :vars
    (
      ?auto_452 - HOIST
      ?auto_453 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_452 ?auto_453 ) ( SURFACE-AT ?auto_450 ?auto_453 ) ( CLEAR ?auto_450 ) ( LIFTING ?auto_452 ?auto_451 ) ( IS-CRATE ?auto_451 ) ( not ( = ?auto_450 ?auto_451 ) ) )
    :subtasks
    ( ( !DROP ?auto_452 ?auto_451 ?auto_450 ?auto_453 )
      ( MAKE-1CRATE-VERIFY ?auto_450 ?auto_451 ) )
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
      ?auto_458 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_456 ?auto_457 ) ( SURFACE-AT ?auto_454 ?auto_457 ) ( CLEAR ?auto_454 ) ( IS-CRATE ?auto_455 ) ( not ( = ?auto_454 ?auto_455 ) ) ( TRUCK-AT ?auto_458 ?auto_457 ) ( AVAILABLE ?auto_456 ) ( IN ?auto_455 ?auto_458 ) )
    :subtasks
    ( ( !UNLOAD ?auto_456 ?auto_455 ?auto_458 ?auto_457 )
      ( MAKE-1CRATE ?auto_454 ?auto_455 )
      ( MAKE-1CRATE-VERIFY ?auto_454 ?auto_455 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_459 - SURFACE
      ?auto_460 - SURFACE
    )
    :vars
    (
      ?auto_463 - HOIST
      ?auto_462 - PLACE
      ?auto_461 - TRUCK
      ?auto_464 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_463 ?auto_462 ) ( SURFACE-AT ?auto_459 ?auto_462 ) ( CLEAR ?auto_459 ) ( IS-CRATE ?auto_460 ) ( not ( = ?auto_459 ?auto_460 ) ) ( AVAILABLE ?auto_463 ) ( IN ?auto_460 ?auto_461 ) ( TRUCK-AT ?auto_461 ?auto_464 ) ( not ( = ?auto_464 ?auto_462 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_461 ?auto_464 ?auto_462 )
      ( MAKE-1CRATE ?auto_459 ?auto_460 )
      ( MAKE-1CRATE-VERIFY ?auto_459 ?auto_460 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_465 - SURFACE
      ?auto_466 - SURFACE
    )
    :vars
    (
      ?auto_468 - HOIST
      ?auto_469 - PLACE
      ?auto_470 - TRUCK
      ?auto_467 - PLACE
      ?auto_471 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_468 ?auto_469 ) ( SURFACE-AT ?auto_465 ?auto_469 ) ( CLEAR ?auto_465 ) ( IS-CRATE ?auto_466 ) ( not ( = ?auto_465 ?auto_466 ) ) ( AVAILABLE ?auto_468 ) ( TRUCK-AT ?auto_470 ?auto_467 ) ( not ( = ?auto_467 ?auto_469 ) ) ( HOIST-AT ?auto_471 ?auto_467 ) ( LIFTING ?auto_471 ?auto_466 ) ( not ( = ?auto_468 ?auto_471 ) ) )
    :subtasks
    ( ( !LOAD ?auto_471 ?auto_466 ?auto_470 ?auto_467 )
      ( MAKE-1CRATE ?auto_465 ?auto_466 )
      ( MAKE-1CRATE-VERIFY ?auto_465 ?auto_466 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_472 - SURFACE
      ?auto_473 - SURFACE
    )
    :vars
    (
      ?auto_474 - HOIST
      ?auto_476 - PLACE
      ?auto_478 - TRUCK
      ?auto_475 - PLACE
      ?auto_477 - HOIST
      ?auto_479 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_474 ?auto_476 ) ( SURFACE-AT ?auto_472 ?auto_476 ) ( CLEAR ?auto_472 ) ( IS-CRATE ?auto_473 ) ( not ( = ?auto_472 ?auto_473 ) ) ( AVAILABLE ?auto_474 ) ( TRUCK-AT ?auto_478 ?auto_475 ) ( not ( = ?auto_475 ?auto_476 ) ) ( HOIST-AT ?auto_477 ?auto_475 ) ( not ( = ?auto_474 ?auto_477 ) ) ( AVAILABLE ?auto_477 ) ( SURFACE-AT ?auto_473 ?auto_475 ) ( ON ?auto_473 ?auto_479 ) ( CLEAR ?auto_473 ) ( not ( = ?auto_472 ?auto_479 ) ) ( not ( = ?auto_473 ?auto_479 ) ) )
    :subtasks
    ( ( !LIFT ?auto_477 ?auto_473 ?auto_479 ?auto_475 )
      ( MAKE-1CRATE ?auto_472 ?auto_473 )
      ( MAKE-1CRATE-VERIFY ?auto_472 ?auto_473 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_480 - SURFACE
      ?auto_481 - SURFACE
    )
    :vars
    (
      ?auto_484 - HOIST
      ?auto_485 - PLACE
      ?auto_483 - PLACE
      ?auto_482 - HOIST
      ?auto_487 - SURFACE
      ?auto_486 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_484 ?auto_485 ) ( SURFACE-AT ?auto_480 ?auto_485 ) ( CLEAR ?auto_480 ) ( IS-CRATE ?auto_481 ) ( not ( = ?auto_480 ?auto_481 ) ) ( AVAILABLE ?auto_484 ) ( not ( = ?auto_483 ?auto_485 ) ) ( HOIST-AT ?auto_482 ?auto_483 ) ( not ( = ?auto_484 ?auto_482 ) ) ( AVAILABLE ?auto_482 ) ( SURFACE-AT ?auto_481 ?auto_483 ) ( ON ?auto_481 ?auto_487 ) ( CLEAR ?auto_481 ) ( not ( = ?auto_480 ?auto_487 ) ) ( not ( = ?auto_481 ?auto_487 ) ) ( TRUCK-AT ?auto_486 ?auto_485 ) )
    :subtasks
    ( ( !DRIVE ?auto_486 ?auto_485 ?auto_483 )
      ( MAKE-1CRATE ?auto_480 ?auto_481 )
      ( MAKE-1CRATE-VERIFY ?auto_480 ?auto_481 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_497 - SURFACE
      ?auto_498 - SURFACE
      ?auto_499 - SURFACE
    )
    :vars
    (
      ?auto_500 - HOIST
      ?auto_501 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_500 ?auto_501 ) ( SURFACE-AT ?auto_498 ?auto_501 ) ( CLEAR ?auto_498 ) ( LIFTING ?auto_500 ?auto_499 ) ( IS-CRATE ?auto_499 ) ( not ( = ?auto_498 ?auto_499 ) ) ( ON ?auto_498 ?auto_497 ) ( not ( = ?auto_497 ?auto_498 ) ) ( not ( = ?auto_497 ?auto_499 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_498 ?auto_499 )
      ( MAKE-2CRATE-VERIFY ?auto_497 ?auto_498 ?auto_499 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_507 - SURFACE
      ?auto_508 - SURFACE
      ?auto_509 - SURFACE
    )
    :vars
    (
      ?auto_511 - HOIST
      ?auto_512 - PLACE
      ?auto_510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_511 ?auto_512 ) ( SURFACE-AT ?auto_508 ?auto_512 ) ( CLEAR ?auto_508 ) ( IS-CRATE ?auto_509 ) ( not ( = ?auto_508 ?auto_509 ) ) ( TRUCK-AT ?auto_510 ?auto_512 ) ( AVAILABLE ?auto_511 ) ( IN ?auto_509 ?auto_510 ) ( ON ?auto_508 ?auto_507 ) ( not ( = ?auto_507 ?auto_508 ) ) ( not ( = ?auto_507 ?auto_509 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_508 ?auto_509 )
      ( MAKE-2CRATE-VERIFY ?auto_507 ?auto_508 ?auto_509 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_513 - SURFACE
      ?auto_514 - SURFACE
    )
    :vars
    (
      ?auto_515 - HOIST
      ?auto_518 - PLACE
      ?auto_516 - TRUCK
      ?auto_517 - SURFACE
      ?auto_519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_515 ?auto_518 ) ( SURFACE-AT ?auto_513 ?auto_518 ) ( CLEAR ?auto_513 ) ( IS-CRATE ?auto_514 ) ( not ( = ?auto_513 ?auto_514 ) ) ( AVAILABLE ?auto_515 ) ( IN ?auto_514 ?auto_516 ) ( ON ?auto_513 ?auto_517 ) ( not ( = ?auto_517 ?auto_513 ) ) ( not ( = ?auto_517 ?auto_514 ) ) ( TRUCK-AT ?auto_516 ?auto_519 ) ( not ( = ?auto_519 ?auto_518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_516 ?auto_519 ?auto_518 )
      ( MAKE-2CRATE ?auto_517 ?auto_513 ?auto_514 )
      ( MAKE-1CRATE-VERIFY ?auto_513 ?auto_514 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_520 - SURFACE
      ?auto_521 - SURFACE
      ?auto_522 - SURFACE
    )
    :vars
    (
      ?auto_526 - HOIST
      ?auto_525 - PLACE
      ?auto_524 - TRUCK
      ?auto_523 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526 ?auto_525 ) ( SURFACE-AT ?auto_521 ?auto_525 ) ( CLEAR ?auto_521 ) ( IS-CRATE ?auto_522 ) ( not ( = ?auto_521 ?auto_522 ) ) ( AVAILABLE ?auto_526 ) ( IN ?auto_522 ?auto_524 ) ( ON ?auto_521 ?auto_520 ) ( not ( = ?auto_520 ?auto_521 ) ) ( not ( = ?auto_520 ?auto_522 ) ) ( TRUCK-AT ?auto_524 ?auto_523 ) ( not ( = ?auto_523 ?auto_525 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_521 ?auto_522 )
      ( MAKE-2CRATE-VERIFY ?auto_520 ?auto_521 ?auto_522 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_527 - SURFACE
      ?auto_528 - SURFACE
    )
    :vars
    (
      ?auto_532 - HOIST
      ?auto_529 - PLACE
      ?auto_530 - SURFACE
      ?auto_531 - TRUCK
      ?auto_533 - PLACE
      ?auto_534 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_532 ?auto_529 ) ( SURFACE-AT ?auto_527 ?auto_529 ) ( CLEAR ?auto_527 ) ( IS-CRATE ?auto_528 ) ( not ( = ?auto_527 ?auto_528 ) ) ( AVAILABLE ?auto_532 ) ( ON ?auto_527 ?auto_530 ) ( not ( = ?auto_530 ?auto_527 ) ) ( not ( = ?auto_530 ?auto_528 ) ) ( TRUCK-AT ?auto_531 ?auto_533 ) ( not ( = ?auto_533 ?auto_529 ) ) ( HOIST-AT ?auto_534 ?auto_533 ) ( LIFTING ?auto_534 ?auto_528 ) ( not ( = ?auto_532 ?auto_534 ) ) )
    :subtasks
    ( ( !LOAD ?auto_534 ?auto_528 ?auto_531 ?auto_533 )
      ( MAKE-2CRATE ?auto_530 ?auto_527 ?auto_528 )
      ( MAKE-1CRATE-VERIFY ?auto_527 ?auto_528 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_535 - SURFACE
      ?auto_536 - SURFACE
      ?auto_537 - SURFACE
    )
    :vars
    (
      ?auto_542 - HOIST
      ?auto_541 - PLACE
      ?auto_538 - TRUCK
      ?auto_540 - PLACE
      ?auto_539 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_542 ?auto_541 ) ( SURFACE-AT ?auto_536 ?auto_541 ) ( CLEAR ?auto_536 ) ( IS-CRATE ?auto_537 ) ( not ( = ?auto_536 ?auto_537 ) ) ( AVAILABLE ?auto_542 ) ( ON ?auto_536 ?auto_535 ) ( not ( = ?auto_535 ?auto_536 ) ) ( not ( = ?auto_535 ?auto_537 ) ) ( TRUCK-AT ?auto_538 ?auto_540 ) ( not ( = ?auto_540 ?auto_541 ) ) ( HOIST-AT ?auto_539 ?auto_540 ) ( LIFTING ?auto_539 ?auto_537 ) ( not ( = ?auto_542 ?auto_539 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_536 ?auto_537 )
      ( MAKE-2CRATE-VERIFY ?auto_535 ?auto_536 ?auto_537 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_543 - SURFACE
      ?auto_544 - SURFACE
    )
    :vars
    (
      ?auto_545 - HOIST
      ?auto_549 - PLACE
      ?auto_548 - SURFACE
      ?auto_547 - TRUCK
      ?auto_550 - PLACE
      ?auto_546 - HOIST
      ?auto_551 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_545 ?auto_549 ) ( SURFACE-AT ?auto_543 ?auto_549 ) ( CLEAR ?auto_543 ) ( IS-CRATE ?auto_544 ) ( not ( = ?auto_543 ?auto_544 ) ) ( AVAILABLE ?auto_545 ) ( ON ?auto_543 ?auto_548 ) ( not ( = ?auto_548 ?auto_543 ) ) ( not ( = ?auto_548 ?auto_544 ) ) ( TRUCK-AT ?auto_547 ?auto_550 ) ( not ( = ?auto_550 ?auto_549 ) ) ( HOIST-AT ?auto_546 ?auto_550 ) ( not ( = ?auto_545 ?auto_546 ) ) ( AVAILABLE ?auto_546 ) ( SURFACE-AT ?auto_544 ?auto_550 ) ( ON ?auto_544 ?auto_551 ) ( CLEAR ?auto_544 ) ( not ( = ?auto_543 ?auto_551 ) ) ( not ( = ?auto_544 ?auto_551 ) ) ( not ( = ?auto_548 ?auto_551 ) ) )
    :subtasks
    ( ( !LIFT ?auto_546 ?auto_544 ?auto_551 ?auto_550 )
      ( MAKE-2CRATE ?auto_548 ?auto_543 ?auto_544 )
      ( MAKE-1CRATE-VERIFY ?auto_543 ?auto_544 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_552 - SURFACE
      ?auto_553 - SURFACE
      ?auto_554 - SURFACE
    )
    :vars
    (
      ?auto_555 - HOIST
      ?auto_558 - PLACE
      ?auto_556 - TRUCK
      ?auto_557 - PLACE
      ?auto_559 - HOIST
      ?auto_560 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_555 ?auto_558 ) ( SURFACE-AT ?auto_553 ?auto_558 ) ( CLEAR ?auto_553 ) ( IS-CRATE ?auto_554 ) ( not ( = ?auto_553 ?auto_554 ) ) ( AVAILABLE ?auto_555 ) ( ON ?auto_553 ?auto_552 ) ( not ( = ?auto_552 ?auto_553 ) ) ( not ( = ?auto_552 ?auto_554 ) ) ( TRUCK-AT ?auto_556 ?auto_557 ) ( not ( = ?auto_557 ?auto_558 ) ) ( HOIST-AT ?auto_559 ?auto_557 ) ( not ( = ?auto_555 ?auto_559 ) ) ( AVAILABLE ?auto_559 ) ( SURFACE-AT ?auto_554 ?auto_557 ) ( ON ?auto_554 ?auto_560 ) ( CLEAR ?auto_554 ) ( not ( = ?auto_553 ?auto_560 ) ) ( not ( = ?auto_554 ?auto_560 ) ) ( not ( = ?auto_552 ?auto_560 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_553 ?auto_554 )
      ( MAKE-2CRATE-VERIFY ?auto_552 ?auto_553 ?auto_554 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_561 - SURFACE
      ?auto_562 - SURFACE
    )
    :vars
    (
      ?auto_569 - HOIST
      ?auto_564 - PLACE
      ?auto_563 - SURFACE
      ?auto_567 - PLACE
      ?auto_565 - HOIST
      ?auto_566 - SURFACE
      ?auto_568 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_569 ?auto_564 ) ( SURFACE-AT ?auto_561 ?auto_564 ) ( CLEAR ?auto_561 ) ( IS-CRATE ?auto_562 ) ( not ( = ?auto_561 ?auto_562 ) ) ( AVAILABLE ?auto_569 ) ( ON ?auto_561 ?auto_563 ) ( not ( = ?auto_563 ?auto_561 ) ) ( not ( = ?auto_563 ?auto_562 ) ) ( not ( = ?auto_567 ?auto_564 ) ) ( HOIST-AT ?auto_565 ?auto_567 ) ( not ( = ?auto_569 ?auto_565 ) ) ( AVAILABLE ?auto_565 ) ( SURFACE-AT ?auto_562 ?auto_567 ) ( ON ?auto_562 ?auto_566 ) ( CLEAR ?auto_562 ) ( not ( = ?auto_561 ?auto_566 ) ) ( not ( = ?auto_562 ?auto_566 ) ) ( not ( = ?auto_563 ?auto_566 ) ) ( TRUCK-AT ?auto_568 ?auto_564 ) )
    :subtasks
    ( ( !DRIVE ?auto_568 ?auto_564 ?auto_567 )
      ( MAKE-2CRATE ?auto_563 ?auto_561 ?auto_562 )
      ( MAKE-1CRATE-VERIFY ?auto_561 ?auto_562 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_570 - SURFACE
      ?auto_571 - SURFACE
      ?auto_572 - SURFACE
    )
    :vars
    (
      ?auto_577 - HOIST
      ?auto_576 - PLACE
      ?auto_573 - PLACE
      ?auto_574 - HOIST
      ?auto_578 - SURFACE
      ?auto_575 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_577 ?auto_576 ) ( SURFACE-AT ?auto_571 ?auto_576 ) ( CLEAR ?auto_571 ) ( IS-CRATE ?auto_572 ) ( not ( = ?auto_571 ?auto_572 ) ) ( AVAILABLE ?auto_577 ) ( ON ?auto_571 ?auto_570 ) ( not ( = ?auto_570 ?auto_571 ) ) ( not ( = ?auto_570 ?auto_572 ) ) ( not ( = ?auto_573 ?auto_576 ) ) ( HOIST-AT ?auto_574 ?auto_573 ) ( not ( = ?auto_577 ?auto_574 ) ) ( AVAILABLE ?auto_574 ) ( SURFACE-AT ?auto_572 ?auto_573 ) ( ON ?auto_572 ?auto_578 ) ( CLEAR ?auto_572 ) ( not ( = ?auto_571 ?auto_578 ) ) ( not ( = ?auto_572 ?auto_578 ) ) ( not ( = ?auto_570 ?auto_578 ) ) ( TRUCK-AT ?auto_575 ?auto_576 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_571 ?auto_572 )
      ( MAKE-2CRATE-VERIFY ?auto_570 ?auto_571 ?auto_572 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_579 - SURFACE
      ?auto_580 - SURFACE
    )
    :vars
    (
      ?auto_582 - HOIST
      ?auto_585 - PLACE
      ?auto_587 - SURFACE
      ?auto_581 - PLACE
      ?auto_586 - HOIST
      ?auto_584 - SURFACE
      ?auto_583 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_582 ?auto_585 ) ( IS-CRATE ?auto_580 ) ( not ( = ?auto_579 ?auto_580 ) ) ( not ( = ?auto_587 ?auto_579 ) ) ( not ( = ?auto_587 ?auto_580 ) ) ( not ( = ?auto_581 ?auto_585 ) ) ( HOIST-AT ?auto_586 ?auto_581 ) ( not ( = ?auto_582 ?auto_586 ) ) ( AVAILABLE ?auto_586 ) ( SURFACE-AT ?auto_580 ?auto_581 ) ( ON ?auto_580 ?auto_584 ) ( CLEAR ?auto_580 ) ( not ( = ?auto_579 ?auto_584 ) ) ( not ( = ?auto_580 ?auto_584 ) ) ( not ( = ?auto_587 ?auto_584 ) ) ( TRUCK-AT ?auto_583 ?auto_585 ) ( SURFACE-AT ?auto_587 ?auto_585 ) ( CLEAR ?auto_587 ) ( LIFTING ?auto_582 ?auto_579 ) ( IS-CRATE ?auto_579 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_587 ?auto_579 )
      ( MAKE-2CRATE ?auto_587 ?auto_579 ?auto_580 )
      ( MAKE-1CRATE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_588 - SURFACE
      ?auto_589 - SURFACE
      ?auto_590 - SURFACE
    )
    :vars
    (
      ?auto_591 - HOIST
      ?auto_593 - PLACE
      ?auto_596 - PLACE
      ?auto_595 - HOIST
      ?auto_592 - SURFACE
      ?auto_594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_591 ?auto_593 ) ( IS-CRATE ?auto_590 ) ( not ( = ?auto_589 ?auto_590 ) ) ( not ( = ?auto_588 ?auto_589 ) ) ( not ( = ?auto_588 ?auto_590 ) ) ( not ( = ?auto_596 ?auto_593 ) ) ( HOIST-AT ?auto_595 ?auto_596 ) ( not ( = ?auto_591 ?auto_595 ) ) ( AVAILABLE ?auto_595 ) ( SURFACE-AT ?auto_590 ?auto_596 ) ( ON ?auto_590 ?auto_592 ) ( CLEAR ?auto_590 ) ( not ( = ?auto_589 ?auto_592 ) ) ( not ( = ?auto_590 ?auto_592 ) ) ( not ( = ?auto_588 ?auto_592 ) ) ( TRUCK-AT ?auto_594 ?auto_593 ) ( SURFACE-AT ?auto_588 ?auto_593 ) ( CLEAR ?auto_588 ) ( LIFTING ?auto_591 ?auto_589 ) ( IS-CRATE ?auto_589 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_589 ?auto_590 )
      ( MAKE-2CRATE-VERIFY ?auto_588 ?auto_589 ?auto_590 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_597 - SURFACE
      ?auto_598 - SURFACE
    )
    :vars
    (
      ?auto_604 - HOIST
      ?auto_599 - PLACE
      ?auto_605 - SURFACE
      ?auto_603 - PLACE
      ?auto_600 - HOIST
      ?auto_602 - SURFACE
      ?auto_601 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_604 ?auto_599 ) ( IS-CRATE ?auto_598 ) ( not ( = ?auto_597 ?auto_598 ) ) ( not ( = ?auto_605 ?auto_597 ) ) ( not ( = ?auto_605 ?auto_598 ) ) ( not ( = ?auto_603 ?auto_599 ) ) ( HOIST-AT ?auto_600 ?auto_603 ) ( not ( = ?auto_604 ?auto_600 ) ) ( AVAILABLE ?auto_600 ) ( SURFACE-AT ?auto_598 ?auto_603 ) ( ON ?auto_598 ?auto_602 ) ( CLEAR ?auto_598 ) ( not ( = ?auto_597 ?auto_602 ) ) ( not ( = ?auto_598 ?auto_602 ) ) ( not ( = ?auto_605 ?auto_602 ) ) ( TRUCK-AT ?auto_601 ?auto_599 ) ( SURFACE-AT ?auto_605 ?auto_599 ) ( CLEAR ?auto_605 ) ( IS-CRATE ?auto_597 ) ( AVAILABLE ?auto_604 ) ( IN ?auto_597 ?auto_601 ) )
    :subtasks
    ( ( !UNLOAD ?auto_604 ?auto_597 ?auto_601 ?auto_599 )
      ( MAKE-2CRATE ?auto_605 ?auto_597 ?auto_598 )
      ( MAKE-1CRATE-VERIFY ?auto_597 ?auto_598 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_606 - SURFACE
      ?auto_607 - SURFACE
      ?auto_608 - SURFACE
    )
    :vars
    (
      ?auto_610 - HOIST
      ?auto_609 - PLACE
      ?auto_613 - PLACE
      ?auto_612 - HOIST
      ?auto_614 - SURFACE
      ?auto_611 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_610 ?auto_609 ) ( IS-CRATE ?auto_608 ) ( not ( = ?auto_607 ?auto_608 ) ) ( not ( = ?auto_606 ?auto_607 ) ) ( not ( = ?auto_606 ?auto_608 ) ) ( not ( = ?auto_613 ?auto_609 ) ) ( HOIST-AT ?auto_612 ?auto_613 ) ( not ( = ?auto_610 ?auto_612 ) ) ( AVAILABLE ?auto_612 ) ( SURFACE-AT ?auto_608 ?auto_613 ) ( ON ?auto_608 ?auto_614 ) ( CLEAR ?auto_608 ) ( not ( = ?auto_607 ?auto_614 ) ) ( not ( = ?auto_608 ?auto_614 ) ) ( not ( = ?auto_606 ?auto_614 ) ) ( TRUCK-AT ?auto_611 ?auto_609 ) ( SURFACE-AT ?auto_606 ?auto_609 ) ( CLEAR ?auto_606 ) ( IS-CRATE ?auto_607 ) ( AVAILABLE ?auto_610 ) ( IN ?auto_607 ?auto_611 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_607 ?auto_608 )
      ( MAKE-2CRATE-VERIFY ?auto_606 ?auto_607 ?auto_608 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_615 - SURFACE
      ?auto_616 - SURFACE
    )
    :vars
    (
      ?auto_620 - HOIST
      ?auto_619 - PLACE
      ?auto_621 - SURFACE
      ?auto_618 - PLACE
      ?auto_617 - HOIST
      ?auto_622 - SURFACE
      ?auto_623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_620 ?auto_619 ) ( IS-CRATE ?auto_616 ) ( not ( = ?auto_615 ?auto_616 ) ) ( not ( = ?auto_621 ?auto_615 ) ) ( not ( = ?auto_621 ?auto_616 ) ) ( not ( = ?auto_618 ?auto_619 ) ) ( HOIST-AT ?auto_617 ?auto_618 ) ( not ( = ?auto_620 ?auto_617 ) ) ( AVAILABLE ?auto_617 ) ( SURFACE-AT ?auto_616 ?auto_618 ) ( ON ?auto_616 ?auto_622 ) ( CLEAR ?auto_616 ) ( not ( = ?auto_615 ?auto_622 ) ) ( not ( = ?auto_616 ?auto_622 ) ) ( not ( = ?auto_621 ?auto_622 ) ) ( SURFACE-AT ?auto_621 ?auto_619 ) ( CLEAR ?auto_621 ) ( IS-CRATE ?auto_615 ) ( AVAILABLE ?auto_620 ) ( IN ?auto_615 ?auto_623 ) ( TRUCK-AT ?auto_623 ?auto_618 ) )
    :subtasks
    ( ( !DRIVE ?auto_623 ?auto_618 ?auto_619 )
      ( MAKE-2CRATE ?auto_621 ?auto_615 ?auto_616 )
      ( MAKE-1CRATE-VERIFY ?auto_615 ?auto_616 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_624 - SURFACE
      ?auto_625 - SURFACE
      ?auto_626 - SURFACE
    )
    :vars
    (
      ?auto_631 - HOIST
      ?auto_630 - PLACE
      ?auto_632 - PLACE
      ?auto_629 - HOIST
      ?auto_628 - SURFACE
      ?auto_627 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631 ?auto_630 ) ( IS-CRATE ?auto_626 ) ( not ( = ?auto_625 ?auto_626 ) ) ( not ( = ?auto_624 ?auto_625 ) ) ( not ( = ?auto_624 ?auto_626 ) ) ( not ( = ?auto_632 ?auto_630 ) ) ( HOIST-AT ?auto_629 ?auto_632 ) ( not ( = ?auto_631 ?auto_629 ) ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_626 ?auto_632 ) ( ON ?auto_626 ?auto_628 ) ( CLEAR ?auto_626 ) ( not ( = ?auto_625 ?auto_628 ) ) ( not ( = ?auto_626 ?auto_628 ) ) ( not ( = ?auto_624 ?auto_628 ) ) ( SURFACE-AT ?auto_624 ?auto_630 ) ( CLEAR ?auto_624 ) ( IS-CRATE ?auto_625 ) ( AVAILABLE ?auto_631 ) ( IN ?auto_625 ?auto_627 ) ( TRUCK-AT ?auto_627 ?auto_632 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_625 ?auto_626 )
      ( MAKE-2CRATE-VERIFY ?auto_624 ?auto_625 ?auto_626 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_633 - SURFACE
      ?auto_634 - SURFACE
    )
    :vars
    (
      ?auto_638 - HOIST
      ?auto_641 - PLACE
      ?auto_637 - SURFACE
      ?auto_640 - PLACE
      ?auto_635 - HOIST
      ?auto_639 - SURFACE
      ?auto_636 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_638 ?auto_641 ) ( IS-CRATE ?auto_634 ) ( not ( = ?auto_633 ?auto_634 ) ) ( not ( = ?auto_637 ?auto_633 ) ) ( not ( = ?auto_637 ?auto_634 ) ) ( not ( = ?auto_640 ?auto_641 ) ) ( HOIST-AT ?auto_635 ?auto_640 ) ( not ( = ?auto_638 ?auto_635 ) ) ( SURFACE-AT ?auto_634 ?auto_640 ) ( ON ?auto_634 ?auto_639 ) ( CLEAR ?auto_634 ) ( not ( = ?auto_633 ?auto_639 ) ) ( not ( = ?auto_634 ?auto_639 ) ) ( not ( = ?auto_637 ?auto_639 ) ) ( SURFACE-AT ?auto_637 ?auto_641 ) ( CLEAR ?auto_637 ) ( IS-CRATE ?auto_633 ) ( AVAILABLE ?auto_638 ) ( TRUCK-AT ?auto_636 ?auto_640 ) ( LIFTING ?auto_635 ?auto_633 ) )
    :subtasks
    ( ( !LOAD ?auto_635 ?auto_633 ?auto_636 ?auto_640 )
      ( MAKE-2CRATE ?auto_637 ?auto_633 ?auto_634 )
      ( MAKE-1CRATE-VERIFY ?auto_633 ?auto_634 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_642 - SURFACE
      ?auto_643 - SURFACE
      ?auto_644 - SURFACE
    )
    :vars
    (
      ?auto_649 - HOIST
      ?auto_647 - PLACE
      ?auto_650 - PLACE
      ?auto_648 - HOIST
      ?auto_646 - SURFACE
      ?auto_645 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_649 ?auto_647 ) ( IS-CRATE ?auto_644 ) ( not ( = ?auto_643 ?auto_644 ) ) ( not ( = ?auto_642 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_650 ?auto_647 ) ) ( HOIST-AT ?auto_648 ?auto_650 ) ( not ( = ?auto_649 ?auto_648 ) ) ( SURFACE-AT ?auto_644 ?auto_650 ) ( ON ?auto_644 ?auto_646 ) ( CLEAR ?auto_644 ) ( not ( = ?auto_643 ?auto_646 ) ) ( not ( = ?auto_644 ?auto_646 ) ) ( not ( = ?auto_642 ?auto_646 ) ) ( SURFACE-AT ?auto_642 ?auto_647 ) ( CLEAR ?auto_642 ) ( IS-CRATE ?auto_643 ) ( AVAILABLE ?auto_649 ) ( TRUCK-AT ?auto_645 ?auto_650 ) ( LIFTING ?auto_648 ?auto_643 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_643 ?auto_644 )
      ( MAKE-2CRATE-VERIFY ?auto_642 ?auto_643 ?auto_644 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_651 - SURFACE
      ?auto_652 - SURFACE
    )
    :vars
    (
      ?auto_659 - HOIST
      ?auto_654 - PLACE
      ?auto_657 - SURFACE
      ?auto_653 - PLACE
      ?auto_656 - HOIST
      ?auto_658 - SURFACE
      ?auto_655 - TRUCK
      ?auto_660 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_659 ?auto_654 ) ( IS-CRATE ?auto_652 ) ( not ( = ?auto_651 ?auto_652 ) ) ( not ( = ?auto_657 ?auto_651 ) ) ( not ( = ?auto_657 ?auto_652 ) ) ( not ( = ?auto_653 ?auto_654 ) ) ( HOIST-AT ?auto_656 ?auto_653 ) ( not ( = ?auto_659 ?auto_656 ) ) ( SURFACE-AT ?auto_652 ?auto_653 ) ( ON ?auto_652 ?auto_658 ) ( CLEAR ?auto_652 ) ( not ( = ?auto_651 ?auto_658 ) ) ( not ( = ?auto_652 ?auto_658 ) ) ( not ( = ?auto_657 ?auto_658 ) ) ( SURFACE-AT ?auto_657 ?auto_654 ) ( CLEAR ?auto_657 ) ( IS-CRATE ?auto_651 ) ( AVAILABLE ?auto_659 ) ( TRUCK-AT ?auto_655 ?auto_653 ) ( AVAILABLE ?auto_656 ) ( SURFACE-AT ?auto_651 ?auto_653 ) ( ON ?auto_651 ?auto_660 ) ( CLEAR ?auto_651 ) ( not ( = ?auto_651 ?auto_660 ) ) ( not ( = ?auto_652 ?auto_660 ) ) ( not ( = ?auto_657 ?auto_660 ) ) ( not ( = ?auto_658 ?auto_660 ) ) )
    :subtasks
    ( ( !LIFT ?auto_656 ?auto_651 ?auto_660 ?auto_653 )
      ( MAKE-2CRATE ?auto_657 ?auto_651 ?auto_652 )
      ( MAKE-1CRATE-VERIFY ?auto_651 ?auto_652 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_661 - SURFACE
      ?auto_662 - SURFACE
      ?auto_663 - SURFACE
    )
    :vars
    (
      ?auto_666 - HOIST
      ?auto_665 - PLACE
      ?auto_667 - PLACE
      ?auto_668 - HOIST
      ?auto_669 - SURFACE
      ?auto_664 - TRUCK
      ?auto_670 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_666 ?auto_665 ) ( IS-CRATE ?auto_663 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_667 ?auto_665 ) ) ( HOIST-AT ?auto_668 ?auto_667 ) ( not ( = ?auto_666 ?auto_668 ) ) ( SURFACE-AT ?auto_663 ?auto_667 ) ( ON ?auto_663 ?auto_669 ) ( CLEAR ?auto_663 ) ( not ( = ?auto_662 ?auto_669 ) ) ( not ( = ?auto_663 ?auto_669 ) ) ( not ( = ?auto_661 ?auto_669 ) ) ( SURFACE-AT ?auto_661 ?auto_665 ) ( CLEAR ?auto_661 ) ( IS-CRATE ?auto_662 ) ( AVAILABLE ?auto_666 ) ( TRUCK-AT ?auto_664 ?auto_667 ) ( AVAILABLE ?auto_668 ) ( SURFACE-AT ?auto_662 ?auto_667 ) ( ON ?auto_662 ?auto_670 ) ( CLEAR ?auto_662 ) ( not ( = ?auto_662 ?auto_670 ) ) ( not ( = ?auto_663 ?auto_670 ) ) ( not ( = ?auto_661 ?auto_670 ) ) ( not ( = ?auto_669 ?auto_670 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_662 ?auto_663 )
      ( MAKE-2CRATE-VERIFY ?auto_661 ?auto_662 ?auto_663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_671 - SURFACE
      ?auto_672 - SURFACE
    )
    :vars
    (
      ?auto_673 - HOIST
      ?auto_676 - PLACE
      ?auto_678 - SURFACE
      ?auto_674 - PLACE
      ?auto_680 - HOIST
      ?auto_675 - SURFACE
      ?auto_679 - SURFACE
      ?auto_677 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_673 ?auto_676 ) ( IS-CRATE ?auto_672 ) ( not ( = ?auto_671 ?auto_672 ) ) ( not ( = ?auto_678 ?auto_671 ) ) ( not ( = ?auto_678 ?auto_672 ) ) ( not ( = ?auto_674 ?auto_676 ) ) ( HOIST-AT ?auto_680 ?auto_674 ) ( not ( = ?auto_673 ?auto_680 ) ) ( SURFACE-AT ?auto_672 ?auto_674 ) ( ON ?auto_672 ?auto_675 ) ( CLEAR ?auto_672 ) ( not ( = ?auto_671 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_675 ) ) ( not ( = ?auto_678 ?auto_675 ) ) ( SURFACE-AT ?auto_678 ?auto_676 ) ( CLEAR ?auto_678 ) ( IS-CRATE ?auto_671 ) ( AVAILABLE ?auto_673 ) ( AVAILABLE ?auto_680 ) ( SURFACE-AT ?auto_671 ?auto_674 ) ( ON ?auto_671 ?auto_679 ) ( CLEAR ?auto_671 ) ( not ( = ?auto_671 ?auto_679 ) ) ( not ( = ?auto_672 ?auto_679 ) ) ( not ( = ?auto_678 ?auto_679 ) ) ( not ( = ?auto_675 ?auto_679 ) ) ( TRUCK-AT ?auto_677 ?auto_676 ) )
    :subtasks
    ( ( !DRIVE ?auto_677 ?auto_676 ?auto_674 )
      ( MAKE-2CRATE ?auto_678 ?auto_671 ?auto_672 )
      ( MAKE-1CRATE-VERIFY ?auto_671 ?auto_672 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_681 - SURFACE
      ?auto_682 - SURFACE
      ?auto_683 - SURFACE
    )
    :vars
    (
      ?auto_685 - HOIST
      ?auto_687 - PLACE
      ?auto_686 - PLACE
      ?auto_684 - HOIST
      ?auto_688 - SURFACE
      ?auto_690 - SURFACE
      ?auto_689 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_685 ?auto_687 ) ( IS-CRATE ?auto_683 ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_681 ?auto_683 ) ) ( not ( = ?auto_686 ?auto_687 ) ) ( HOIST-AT ?auto_684 ?auto_686 ) ( not ( = ?auto_685 ?auto_684 ) ) ( SURFACE-AT ?auto_683 ?auto_686 ) ( ON ?auto_683 ?auto_688 ) ( CLEAR ?auto_683 ) ( not ( = ?auto_682 ?auto_688 ) ) ( not ( = ?auto_683 ?auto_688 ) ) ( not ( = ?auto_681 ?auto_688 ) ) ( SURFACE-AT ?auto_681 ?auto_687 ) ( CLEAR ?auto_681 ) ( IS-CRATE ?auto_682 ) ( AVAILABLE ?auto_685 ) ( AVAILABLE ?auto_684 ) ( SURFACE-AT ?auto_682 ?auto_686 ) ( ON ?auto_682 ?auto_690 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_682 ?auto_690 ) ) ( not ( = ?auto_683 ?auto_690 ) ) ( not ( = ?auto_681 ?auto_690 ) ) ( not ( = ?auto_688 ?auto_690 ) ) ( TRUCK-AT ?auto_689 ?auto_687 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_682 ?auto_683 )
      ( MAKE-2CRATE-VERIFY ?auto_681 ?auto_682 ?auto_683 ) )
  )

)

