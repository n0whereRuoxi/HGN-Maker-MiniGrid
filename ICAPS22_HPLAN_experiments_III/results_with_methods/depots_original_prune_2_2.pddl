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
      ?auto_469 - SURFACE
      ?auto_470 - SURFACE
    )
    :vars
    (
      ?auto_471 - HOIST
      ?auto_472 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_471 ?auto_472 ) ( SURFACE-AT ?auto_469 ?auto_472 ) ( CLEAR ?auto_469 ) ( LIFTING ?auto_471 ?auto_470 ) ( IS-CRATE ?auto_470 ) ( not ( = ?auto_469 ?auto_470 ) ) )
    :subtasks
    ( ( !DROP ?auto_471 ?auto_470 ?auto_469 ?auto_472 )
      ( MAKE-1CRATE-VERIFY ?auto_469 ?auto_470 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_473 - SURFACE
      ?auto_474 - SURFACE
    )
    :vars
    (
      ?auto_476 - HOIST
      ?auto_475 - PLACE
      ?auto_477 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_476 ?auto_475 ) ( SURFACE-AT ?auto_473 ?auto_475 ) ( CLEAR ?auto_473 ) ( IS-CRATE ?auto_474 ) ( not ( = ?auto_473 ?auto_474 ) ) ( TRUCK-AT ?auto_477 ?auto_475 ) ( AVAILABLE ?auto_476 ) ( IN ?auto_474 ?auto_477 ) )
    :subtasks
    ( ( !UNLOAD ?auto_476 ?auto_474 ?auto_477 ?auto_475 )
      ( MAKE-1CRATE ?auto_473 ?auto_474 )
      ( MAKE-1CRATE-VERIFY ?auto_473 ?auto_474 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_478 - SURFACE
      ?auto_479 - SURFACE
    )
    :vars
    (
      ?auto_482 - HOIST
      ?auto_480 - PLACE
      ?auto_481 - TRUCK
      ?auto_483 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_482 ?auto_480 ) ( SURFACE-AT ?auto_478 ?auto_480 ) ( CLEAR ?auto_478 ) ( IS-CRATE ?auto_479 ) ( not ( = ?auto_478 ?auto_479 ) ) ( AVAILABLE ?auto_482 ) ( IN ?auto_479 ?auto_481 ) ( TRUCK-AT ?auto_481 ?auto_483 ) ( not ( = ?auto_483 ?auto_480 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_481 ?auto_483 ?auto_480 )
      ( MAKE-1CRATE ?auto_478 ?auto_479 )
      ( MAKE-1CRATE-VERIFY ?auto_478 ?auto_479 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_484 - SURFACE
      ?auto_485 - SURFACE
    )
    :vars
    (
      ?auto_486 - HOIST
      ?auto_488 - PLACE
      ?auto_489 - TRUCK
      ?auto_487 - PLACE
      ?auto_490 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_486 ?auto_488 ) ( SURFACE-AT ?auto_484 ?auto_488 ) ( CLEAR ?auto_484 ) ( IS-CRATE ?auto_485 ) ( not ( = ?auto_484 ?auto_485 ) ) ( AVAILABLE ?auto_486 ) ( TRUCK-AT ?auto_489 ?auto_487 ) ( not ( = ?auto_487 ?auto_488 ) ) ( HOIST-AT ?auto_490 ?auto_487 ) ( LIFTING ?auto_490 ?auto_485 ) ( not ( = ?auto_486 ?auto_490 ) ) )
    :subtasks
    ( ( !LOAD ?auto_490 ?auto_485 ?auto_489 ?auto_487 )
      ( MAKE-1CRATE ?auto_484 ?auto_485 )
      ( MAKE-1CRATE-VERIFY ?auto_484 ?auto_485 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_491 - SURFACE
      ?auto_492 - SURFACE
    )
    :vars
    (
      ?auto_493 - HOIST
      ?auto_494 - PLACE
      ?auto_497 - TRUCK
      ?auto_496 - PLACE
      ?auto_495 - HOIST
      ?auto_498 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_493 ?auto_494 ) ( SURFACE-AT ?auto_491 ?auto_494 ) ( CLEAR ?auto_491 ) ( IS-CRATE ?auto_492 ) ( not ( = ?auto_491 ?auto_492 ) ) ( AVAILABLE ?auto_493 ) ( TRUCK-AT ?auto_497 ?auto_496 ) ( not ( = ?auto_496 ?auto_494 ) ) ( HOIST-AT ?auto_495 ?auto_496 ) ( not ( = ?auto_493 ?auto_495 ) ) ( AVAILABLE ?auto_495 ) ( SURFACE-AT ?auto_492 ?auto_496 ) ( ON ?auto_492 ?auto_498 ) ( CLEAR ?auto_492 ) ( not ( = ?auto_491 ?auto_498 ) ) ( not ( = ?auto_492 ?auto_498 ) ) )
    :subtasks
    ( ( !LIFT ?auto_495 ?auto_492 ?auto_498 ?auto_496 )
      ( MAKE-1CRATE ?auto_491 ?auto_492 )
      ( MAKE-1CRATE-VERIFY ?auto_491 ?auto_492 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_499 - SURFACE
      ?auto_500 - SURFACE
    )
    :vars
    (
      ?auto_506 - HOIST
      ?auto_501 - PLACE
      ?auto_502 - PLACE
      ?auto_505 - HOIST
      ?auto_504 - SURFACE
      ?auto_503 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_506 ?auto_501 ) ( SURFACE-AT ?auto_499 ?auto_501 ) ( CLEAR ?auto_499 ) ( IS-CRATE ?auto_500 ) ( not ( = ?auto_499 ?auto_500 ) ) ( AVAILABLE ?auto_506 ) ( not ( = ?auto_502 ?auto_501 ) ) ( HOIST-AT ?auto_505 ?auto_502 ) ( not ( = ?auto_506 ?auto_505 ) ) ( AVAILABLE ?auto_505 ) ( SURFACE-AT ?auto_500 ?auto_502 ) ( ON ?auto_500 ?auto_504 ) ( CLEAR ?auto_500 ) ( not ( = ?auto_499 ?auto_504 ) ) ( not ( = ?auto_500 ?auto_504 ) ) ( TRUCK-AT ?auto_503 ?auto_501 ) )
    :subtasks
    ( ( !DRIVE ?auto_503 ?auto_501 ?auto_502 )
      ( MAKE-1CRATE ?auto_499 ?auto_500 )
      ( MAKE-1CRATE-VERIFY ?auto_499 ?auto_500 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_516 - SURFACE
      ?auto_517 - SURFACE
      ?auto_518 - SURFACE
    )
    :vars
    (
      ?auto_520 - HOIST
      ?auto_519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_520 ?auto_519 ) ( SURFACE-AT ?auto_517 ?auto_519 ) ( CLEAR ?auto_517 ) ( LIFTING ?auto_520 ?auto_518 ) ( IS-CRATE ?auto_518 ) ( not ( = ?auto_517 ?auto_518 ) ) ( ON ?auto_517 ?auto_516 ) ( not ( = ?auto_516 ?auto_517 ) ) ( not ( = ?auto_516 ?auto_518 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_517 ?auto_518 )
      ( MAKE-2CRATE-VERIFY ?auto_516 ?auto_517 ?auto_518 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_526 - SURFACE
      ?auto_527 - SURFACE
      ?auto_528 - SURFACE
    )
    :vars
    (
      ?auto_529 - HOIST
      ?auto_531 - PLACE
      ?auto_530 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_529 ?auto_531 ) ( SURFACE-AT ?auto_527 ?auto_531 ) ( CLEAR ?auto_527 ) ( IS-CRATE ?auto_528 ) ( not ( = ?auto_527 ?auto_528 ) ) ( TRUCK-AT ?auto_530 ?auto_531 ) ( AVAILABLE ?auto_529 ) ( IN ?auto_528 ?auto_530 ) ( ON ?auto_527 ?auto_526 ) ( not ( = ?auto_526 ?auto_527 ) ) ( not ( = ?auto_526 ?auto_528 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_527 ?auto_528 )
      ( MAKE-2CRATE-VERIFY ?auto_526 ?auto_527 ?auto_528 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
    )
    :vars
    (
      ?auto_534 - HOIST
      ?auto_536 - PLACE
      ?auto_535 - TRUCK
      ?auto_537 - SURFACE
      ?auto_538 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_534 ?auto_536 ) ( SURFACE-AT ?auto_532 ?auto_536 ) ( CLEAR ?auto_532 ) ( IS-CRATE ?auto_533 ) ( not ( = ?auto_532 ?auto_533 ) ) ( AVAILABLE ?auto_534 ) ( IN ?auto_533 ?auto_535 ) ( ON ?auto_532 ?auto_537 ) ( not ( = ?auto_537 ?auto_532 ) ) ( not ( = ?auto_537 ?auto_533 ) ) ( TRUCK-AT ?auto_535 ?auto_538 ) ( not ( = ?auto_538 ?auto_536 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_535 ?auto_538 ?auto_536 )
      ( MAKE-2CRATE ?auto_537 ?auto_532 ?auto_533 )
      ( MAKE-1CRATE-VERIFY ?auto_532 ?auto_533 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_539 - SURFACE
      ?auto_540 - SURFACE
      ?auto_541 - SURFACE
    )
    :vars
    (
      ?auto_543 - HOIST
      ?auto_545 - PLACE
      ?auto_544 - TRUCK
      ?auto_542 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_543 ?auto_545 ) ( SURFACE-AT ?auto_540 ?auto_545 ) ( CLEAR ?auto_540 ) ( IS-CRATE ?auto_541 ) ( not ( = ?auto_540 ?auto_541 ) ) ( AVAILABLE ?auto_543 ) ( IN ?auto_541 ?auto_544 ) ( ON ?auto_540 ?auto_539 ) ( not ( = ?auto_539 ?auto_540 ) ) ( not ( = ?auto_539 ?auto_541 ) ) ( TRUCK-AT ?auto_544 ?auto_542 ) ( not ( = ?auto_542 ?auto_545 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_540 ?auto_541 )
      ( MAKE-2CRATE-VERIFY ?auto_539 ?auto_540 ?auto_541 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_546 - SURFACE
      ?auto_547 - SURFACE
    )
    :vars
    (
      ?auto_552 - HOIST
      ?auto_550 - PLACE
      ?auto_548 - SURFACE
      ?auto_549 - TRUCK
      ?auto_551 - PLACE
      ?auto_553 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_552 ?auto_550 ) ( SURFACE-AT ?auto_546 ?auto_550 ) ( CLEAR ?auto_546 ) ( IS-CRATE ?auto_547 ) ( not ( = ?auto_546 ?auto_547 ) ) ( AVAILABLE ?auto_552 ) ( ON ?auto_546 ?auto_548 ) ( not ( = ?auto_548 ?auto_546 ) ) ( not ( = ?auto_548 ?auto_547 ) ) ( TRUCK-AT ?auto_549 ?auto_551 ) ( not ( = ?auto_551 ?auto_550 ) ) ( HOIST-AT ?auto_553 ?auto_551 ) ( LIFTING ?auto_553 ?auto_547 ) ( not ( = ?auto_552 ?auto_553 ) ) )
    :subtasks
    ( ( !LOAD ?auto_553 ?auto_547 ?auto_549 ?auto_551 )
      ( MAKE-2CRATE ?auto_548 ?auto_546 ?auto_547 )
      ( MAKE-1CRATE-VERIFY ?auto_546 ?auto_547 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_554 - SURFACE
      ?auto_555 - SURFACE
      ?auto_556 - SURFACE
    )
    :vars
    (
      ?auto_557 - HOIST
      ?auto_561 - PLACE
      ?auto_559 - TRUCK
      ?auto_560 - PLACE
      ?auto_558 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_557 ?auto_561 ) ( SURFACE-AT ?auto_555 ?auto_561 ) ( CLEAR ?auto_555 ) ( IS-CRATE ?auto_556 ) ( not ( = ?auto_555 ?auto_556 ) ) ( AVAILABLE ?auto_557 ) ( ON ?auto_555 ?auto_554 ) ( not ( = ?auto_554 ?auto_555 ) ) ( not ( = ?auto_554 ?auto_556 ) ) ( TRUCK-AT ?auto_559 ?auto_560 ) ( not ( = ?auto_560 ?auto_561 ) ) ( HOIST-AT ?auto_558 ?auto_560 ) ( LIFTING ?auto_558 ?auto_556 ) ( not ( = ?auto_557 ?auto_558 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_555 ?auto_556 )
      ( MAKE-2CRATE-VERIFY ?auto_554 ?auto_555 ?auto_556 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_562 - SURFACE
      ?auto_563 - SURFACE
    )
    :vars
    (
      ?auto_568 - HOIST
      ?auto_565 - PLACE
      ?auto_564 - SURFACE
      ?auto_569 - TRUCK
      ?auto_566 - PLACE
      ?auto_567 - HOIST
      ?auto_570 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_568 ?auto_565 ) ( SURFACE-AT ?auto_562 ?auto_565 ) ( CLEAR ?auto_562 ) ( IS-CRATE ?auto_563 ) ( not ( = ?auto_562 ?auto_563 ) ) ( AVAILABLE ?auto_568 ) ( ON ?auto_562 ?auto_564 ) ( not ( = ?auto_564 ?auto_562 ) ) ( not ( = ?auto_564 ?auto_563 ) ) ( TRUCK-AT ?auto_569 ?auto_566 ) ( not ( = ?auto_566 ?auto_565 ) ) ( HOIST-AT ?auto_567 ?auto_566 ) ( not ( = ?auto_568 ?auto_567 ) ) ( AVAILABLE ?auto_567 ) ( SURFACE-AT ?auto_563 ?auto_566 ) ( ON ?auto_563 ?auto_570 ) ( CLEAR ?auto_563 ) ( not ( = ?auto_562 ?auto_570 ) ) ( not ( = ?auto_563 ?auto_570 ) ) ( not ( = ?auto_564 ?auto_570 ) ) )
    :subtasks
    ( ( !LIFT ?auto_567 ?auto_563 ?auto_570 ?auto_566 )
      ( MAKE-2CRATE ?auto_564 ?auto_562 ?auto_563 )
      ( MAKE-1CRATE-VERIFY ?auto_562 ?auto_563 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_571 - SURFACE
      ?auto_572 - SURFACE
      ?auto_573 - SURFACE
    )
    :vars
    (
      ?auto_577 - HOIST
      ?auto_575 - PLACE
      ?auto_578 - TRUCK
      ?auto_574 - PLACE
      ?auto_576 - HOIST
      ?auto_579 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_577 ?auto_575 ) ( SURFACE-AT ?auto_572 ?auto_575 ) ( CLEAR ?auto_572 ) ( IS-CRATE ?auto_573 ) ( not ( = ?auto_572 ?auto_573 ) ) ( AVAILABLE ?auto_577 ) ( ON ?auto_572 ?auto_571 ) ( not ( = ?auto_571 ?auto_572 ) ) ( not ( = ?auto_571 ?auto_573 ) ) ( TRUCK-AT ?auto_578 ?auto_574 ) ( not ( = ?auto_574 ?auto_575 ) ) ( HOIST-AT ?auto_576 ?auto_574 ) ( not ( = ?auto_577 ?auto_576 ) ) ( AVAILABLE ?auto_576 ) ( SURFACE-AT ?auto_573 ?auto_574 ) ( ON ?auto_573 ?auto_579 ) ( CLEAR ?auto_573 ) ( not ( = ?auto_572 ?auto_579 ) ) ( not ( = ?auto_573 ?auto_579 ) ) ( not ( = ?auto_571 ?auto_579 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_572 ?auto_573 )
      ( MAKE-2CRATE-VERIFY ?auto_571 ?auto_572 ?auto_573 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_580 - SURFACE
      ?auto_581 - SURFACE
    )
    :vars
    (
      ?auto_587 - HOIST
      ?auto_586 - PLACE
      ?auto_583 - SURFACE
      ?auto_585 - PLACE
      ?auto_588 - HOIST
      ?auto_584 - SURFACE
      ?auto_582 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_587 ?auto_586 ) ( SURFACE-AT ?auto_580 ?auto_586 ) ( CLEAR ?auto_580 ) ( IS-CRATE ?auto_581 ) ( not ( = ?auto_580 ?auto_581 ) ) ( AVAILABLE ?auto_587 ) ( ON ?auto_580 ?auto_583 ) ( not ( = ?auto_583 ?auto_580 ) ) ( not ( = ?auto_583 ?auto_581 ) ) ( not ( = ?auto_585 ?auto_586 ) ) ( HOIST-AT ?auto_588 ?auto_585 ) ( not ( = ?auto_587 ?auto_588 ) ) ( AVAILABLE ?auto_588 ) ( SURFACE-AT ?auto_581 ?auto_585 ) ( ON ?auto_581 ?auto_584 ) ( CLEAR ?auto_581 ) ( not ( = ?auto_580 ?auto_584 ) ) ( not ( = ?auto_581 ?auto_584 ) ) ( not ( = ?auto_583 ?auto_584 ) ) ( TRUCK-AT ?auto_582 ?auto_586 ) )
    :subtasks
    ( ( !DRIVE ?auto_582 ?auto_586 ?auto_585 )
      ( MAKE-2CRATE ?auto_583 ?auto_580 ?auto_581 )
      ( MAKE-1CRATE-VERIFY ?auto_580 ?auto_581 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_589 - SURFACE
      ?auto_590 - SURFACE
      ?auto_591 - SURFACE
    )
    :vars
    (
      ?auto_595 - HOIST
      ?auto_597 - PLACE
      ?auto_596 - PLACE
      ?auto_593 - HOIST
      ?auto_592 - SURFACE
      ?auto_594 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_595 ?auto_597 ) ( SURFACE-AT ?auto_590 ?auto_597 ) ( CLEAR ?auto_590 ) ( IS-CRATE ?auto_591 ) ( not ( = ?auto_590 ?auto_591 ) ) ( AVAILABLE ?auto_595 ) ( ON ?auto_590 ?auto_589 ) ( not ( = ?auto_589 ?auto_590 ) ) ( not ( = ?auto_589 ?auto_591 ) ) ( not ( = ?auto_596 ?auto_597 ) ) ( HOIST-AT ?auto_593 ?auto_596 ) ( not ( = ?auto_595 ?auto_593 ) ) ( AVAILABLE ?auto_593 ) ( SURFACE-AT ?auto_591 ?auto_596 ) ( ON ?auto_591 ?auto_592 ) ( CLEAR ?auto_591 ) ( not ( = ?auto_590 ?auto_592 ) ) ( not ( = ?auto_591 ?auto_592 ) ) ( not ( = ?auto_589 ?auto_592 ) ) ( TRUCK-AT ?auto_594 ?auto_597 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_590 ?auto_591 )
      ( MAKE-2CRATE-VERIFY ?auto_589 ?auto_590 ?auto_591 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_598 - SURFACE
      ?auto_599 - SURFACE
    )
    :vars
    (
      ?auto_602 - HOIST
      ?auto_601 - PLACE
      ?auto_606 - SURFACE
      ?auto_604 - PLACE
      ?auto_605 - HOIST
      ?auto_600 - SURFACE
      ?auto_603 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_602 ?auto_601 ) ( IS-CRATE ?auto_599 ) ( not ( = ?auto_598 ?auto_599 ) ) ( not ( = ?auto_606 ?auto_598 ) ) ( not ( = ?auto_606 ?auto_599 ) ) ( not ( = ?auto_604 ?auto_601 ) ) ( HOIST-AT ?auto_605 ?auto_604 ) ( not ( = ?auto_602 ?auto_605 ) ) ( AVAILABLE ?auto_605 ) ( SURFACE-AT ?auto_599 ?auto_604 ) ( ON ?auto_599 ?auto_600 ) ( CLEAR ?auto_599 ) ( not ( = ?auto_598 ?auto_600 ) ) ( not ( = ?auto_599 ?auto_600 ) ) ( not ( = ?auto_606 ?auto_600 ) ) ( TRUCK-AT ?auto_603 ?auto_601 ) ( SURFACE-AT ?auto_606 ?auto_601 ) ( CLEAR ?auto_606 ) ( LIFTING ?auto_602 ?auto_598 ) ( IS-CRATE ?auto_598 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_606 ?auto_598 )
      ( MAKE-2CRATE ?auto_606 ?auto_598 ?auto_599 )
      ( MAKE-1CRATE-VERIFY ?auto_598 ?auto_599 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_607 - SURFACE
      ?auto_608 - SURFACE
      ?auto_609 - SURFACE
    )
    :vars
    (
      ?auto_612 - HOIST
      ?auto_610 - PLACE
      ?auto_611 - PLACE
      ?auto_615 - HOIST
      ?auto_613 - SURFACE
      ?auto_614 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_612 ?auto_610 ) ( IS-CRATE ?auto_609 ) ( not ( = ?auto_608 ?auto_609 ) ) ( not ( = ?auto_607 ?auto_608 ) ) ( not ( = ?auto_607 ?auto_609 ) ) ( not ( = ?auto_611 ?auto_610 ) ) ( HOIST-AT ?auto_615 ?auto_611 ) ( not ( = ?auto_612 ?auto_615 ) ) ( AVAILABLE ?auto_615 ) ( SURFACE-AT ?auto_609 ?auto_611 ) ( ON ?auto_609 ?auto_613 ) ( CLEAR ?auto_609 ) ( not ( = ?auto_608 ?auto_613 ) ) ( not ( = ?auto_609 ?auto_613 ) ) ( not ( = ?auto_607 ?auto_613 ) ) ( TRUCK-AT ?auto_614 ?auto_610 ) ( SURFACE-AT ?auto_607 ?auto_610 ) ( CLEAR ?auto_607 ) ( LIFTING ?auto_612 ?auto_608 ) ( IS-CRATE ?auto_608 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_608 ?auto_609 )
      ( MAKE-2CRATE-VERIFY ?auto_607 ?auto_608 ?auto_609 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_616 - SURFACE
      ?auto_617 - SURFACE
    )
    :vars
    (
      ?auto_622 - HOIST
      ?auto_623 - PLACE
      ?auto_624 - SURFACE
      ?auto_620 - PLACE
      ?auto_618 - HOIST
      ?auto_621 - SURFACE
      ?auto_619 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_622 ?auto_623 ) ( IS-CRATE ?auto_617 ) ( not ( = ?auto_616 ?auto_617 ) ) ( not ( = ?auto_624 ?auto_616 ) ) ( not ( = ?auto_624 ?auto_617 ) ) ( not ( = ?auto_620 ?auto_623 ) ) ( HOIST-AT ?auto_618 ?auto_620 ) ( not ( = ?auto_622 ?auto_618 ) ) ( AVAILABLE ?auto_618 ) ( SURFACE-AT ?auto_617 ?auto_620 ) ( ON ?auto_617 ?auto_621 ) ( CLEAR ?auto_617 ) ( not ( = ?auto_616 ?auto_621 ) ) ( not ( = ?auto_617 ?auto_621 ) ) ( not ( = ?auto_624 ?auto_621 ) ) ( TRUCK-AT ?auto_619 ?auto_623 ) ( SURFACE-AT ?auto_624 ?auto_623 ) ( CLEAR ?auto_624 ) ( IS-CRATE ?auto_616 ) ( AVAILABLE ?auto_622 ) ( IN ?auto_616 ?auto_619 ) )
    :subtasks
    ( ( !UNLOAD ?auto_622 ?auto_616 ?auto_619 ?auto_623 )
      ( MAKE-2CRATE ?auto_624 ?auto_616 ?auto_617 )
      ( MAKE-1CRATE-VERIFY ?auto_616 ?auto_617 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_625 - SURFACE
      ?auto_626 - SURFACE
      ?auto_627 - SURFACE
    )
    :vars
    (
      ?auto_631 - HOIST
      ?auto_630 - PLACE
      ?auto_632 - PLACE
      ?auto_628 - HOIST
      ?auto_629 - SURFACE
      ?auto_633 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_631 ?auto_630 ) ( IS-CRATE ?auto_627 ) ( not ( = ?auto_626 ?auto_627 ) ) ( not ( = ?auto_625 ?auto_626 ) ) ( not ( = ?auto_625 ?auto_627 ) ) ( not ( = ?auto_632 ?auto_630 ) ) ( HOIST-AT ?auto_628 ?auto_632 ) ( not ( = ?auto_631 ?auto_628 ) ) ( AVAILABLE ?auto_628 ) ( SURFACE-AT ?auto_627 ?auto_632 ) ( ON ?auto_627 ?auto_629 ) ( CLEAR ?auto_627 ) ( not ( = ?auto_626 ?auto_629 ) ) ( not ( = ?auto_627 ?auto_629 ) ) ( not ( = ?auto_625 ?auto_629 ) ) ( TRUCK-AT ?auto_633 ?auto_630 ) ( SURFACE-AT ?auto_625 ?auto_630 ) ( CLEAR ?auto_625 ) ( IS-CRATE ?auto_626 ) ( AVAILABLE ?auto_631 ) ( IN ?auto_626 ?auto_633 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_626 ?auto_627 )
      ( MAKE-2CRATE-VERIFY ?auto_625 ?auto_626 ?auto_627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_634 - SURFACE
      ?auto_635 - SURFACE
    )
    :vars
    (
      ?auto_640 - HOIST
      ?auto_641 - PLACE
      ?auto_642 - SURFACE
      ?auto_638 - PLACE
      ?auto_636 - HOIST
      ?auto_639 - SURFACE
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_640 ?auto_641 ) ( IS-CRATE ?auto_635 ) ( not ( = ?auto_634 ?auto_635 ) ) ( not ( = ?auto_642 ?auto_634 ) ) ( not ( = ?auto_642 ?auto_635 ) ) ( not ( = ?auto_638 ?auto_641 ) ) ( HOIST-AT ?auto_636 ?auto_638 ) ( not ( = ?auto_640 ?auto_636 ) ) ( AVAILABLE ?auto_636 ) ( SURFACE-AT ?auto_635 ?auto_638 ) ( ON ?auto_635 ?auto_639 ) ( CLEAR ?auto_635 ) ( not ( = ?auto_634 ?auto_639 ) ) ( not ( = ?auto_635 ?auto_639 ) ) ( not ( = ?auto_642 ?auto_639 ) ) ( SURFACE-AT ?auto_642 ?auto_641 ) ( CLEAR ?auto_642 ) ( IS-CRATE ?auto_634 ) ( AVAILABLE ?auto_640 ) ( IN ?auto_634 ?auto_637 ) ( TRUCK-AT ?auto_637 ?auto_638 ) )
    :subtasks
    ( ( !DRIVE ?auto_637 ?auto_638 ?auto_641 )
      ( MAKE-2CRATE ?auto_642 ?auto_634 ?auto_635 )
      ( MAKE-1CRATE-VERIFY ?auto_634 ?auto_635 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_643 - SURFACE
      ?auto_644 - SURFACE
      ?auto_645 - SURFACE
    )
    :vars
    (
      ?auto_651 - HOIST
      ?auto_650 - PLACE
      ?auto_649 - PLACE
      ?auto_648 - HOIST
      ?auto_646 - SURFACE
      ?auto_647 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_651 ?auto_650 ) ( IS-CRATE ?auto_645 ) ( not ( = ?auto_644 ?auto_645 ) ) ( not ( = ?auto_643 ?auto_644 ) ) ( not ( = ?auto_643 ?auto_645 ) ) ( not ( = ?auto_649 ?auto_650 ) ) ( HOIST-AT ?auto_648 ?auto_649 ) ( not ( = ?auto_651 ?auto_648 ) ) ( AVAILABLE ?auto_648 ) ( SURFACE-AT ?auto_645 ?auto_649 ) ( ON ?auto_645 ?auto_646 ) ( CLEAR ?auto_645 ) ( not ( = ?auto_644 ?auto_646 ) ) ( not ( = ?auto_645 ?auto_646 ) ) ( not ( = ?auto_643 ?auto_646 ) ) ( SURFACE-AT ?auto_643 ?auto_650 ) ( CLEAR ?auto_643 ) ( IS-CRATE ?auto_644 ) ( AVAILABLE ?auto_651 ) ( IN ?auto_644 ?auto_647 ) ( TRUCK-AT ?auto_647 ?auto_649 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_644 ?auto_645 )
      ( MAKE-2CRATE-VERIFY ?auto_643 ?auto_644 ?auto_645 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_652 - SURFACE
      ?auto_653 - SURFACE
    )
    :vars
    (
      ?auto_654 - HOIST
      ?auto_657 - PLACE
      ?auto_656 - SURFACE
      ?auto_659 - PLACE
      ?auto_658 - HOIST
      ?auto_660 - SURFACE
      ?auto_655 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_654 ?auto_657 ) ( IS-CRATE ?auto_653 ) ( not ( = ?auto_652 ?auto_653 ) ) ( not ( = ?auto_656 ?auto_652 ) ) ( not ( = ?auto_656 ?auto_653 ) ) ( not ( = ?auto_659 ?auto_657 ) ) ( HOIST-AT ?auto_658 ?auto_659 ) ( not ( = ?auto_654 ?auto_658 ) ) ( SURFACE-AT ?auto_653 ?auto_659 ) ( ON ?auto_653 ?auto_660 ) ( CLEAR ?auto_653 ) ( not ( = ?auto_652 ?auto_660 ) ) ( not ( = ?auto_653 ?auto_660 ) ) ( not ( = ?auto_656 ?auto_660 ) ) ( SURFACE-AT ?auto_656 ?auto_657 ) ( CLEAR ?auto_656 ) ( IS-CRATE ?auto_652 ) ( AVAILABLE ?auto_654 ) ( TRUCK-AT ?auto_655 ?auto_659 ) ( LIFTING ?auto_658 ?auto_652 ) )
    :subtasks
    ( ( !LOAD ?auto_658 ?auto_652 ?auto_655 ?auto_659 )
      ( MAKE-2CRATE ?auto_656 ?auto_652 ?auto_653 )
      ( MAKE-1CRATE-VERIFY ?auto_652 ?auto_653 ) )
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
      ?auto_665 - HOIST
      ?auto_666 - PLACE
      ?auto_669 - PLACE
      ?auto_667 - HOIST
      ?auto_668 - SURFACE
      ?auto_664 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_665 ?auto_666 ) ( IS-CRATE ?auto_663 ) ( not ( = ?auto_662 ?auto_663 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( not ( = ?auto_661 ?auto_663 ) ) ( not ( = ?auto_669 ?auto_666 ) ) ( HOIST-AT ?auto_667 ?auto_669 ) ( not ( = ?auto_665 ?auto_667 ) ) ( SURFACE-AT ?auto_663 ?auto_669 ) ( ON ?auto_663 ?auto_668 ) ( CLEAR ?auto_663 ) ( not ( = ?auto_662 ?auto_668 ) ) ( not ( = ?auto_663 ?auto_668 ) ) ( not ( = ?auto_661 ?auto_668 ) ) ( SURFACE-AT ?auto_661 ?auto_666 ) ( CLEAR ?auto_661 ) ( IS-CRATE ?auto_662 ) ( AVAILABLE ?auto_665 ) ( TRUCK-AT ?auto_664 ?auto_669 ) ( LIFTING ?auto_667 ?auto_662 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_662 ?auto_663 )
      ( MAKE-2CRATE-VERIFY ?auto_661 ?auto_662 ?auto_663 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_670 - SURFACE
      ?auto_671 - SURFACE
    )
    :vars
    (
      ?auto_678 - HOIST
      ?auto_672 - PLACE
      ?auto_676 - SURFACE
      ?auto_673 - PLACE
      ?auto_675 - HOIST
      ?auto_677 - SURFACE
      ?auto_674 - TRUCK
      ?auto_679 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_678 ?auto_672 ) ( IS-CRATE ?auto_671 ) ( not ( = ?auto_670 ?auto_671 ) ) ( not ( = ?auto_676 ?auto_670 ) ) ( not ( = ?auto_676 ?auto_671 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( HOIST-AT ?auto_675 ?auto_673 ) ( not ( = ?auto_678 ?auto_675 ) ) ( SURFACE-AT ?auto_671 ?auto_673 ) ( ON ?auto_671 ?auto_677 ) ( CLEAR ?auto_671 ) ( not ( = ?auto_670 ?auto_677 ) ) ( not ( = ?auto_671 ?auto_677 ) ) ( not ( = ?auto_676 ?auto_677 ) ) ( SURFACE-AT ?auto_676 ?auto_672 ) ( CLEAR ?auto_676 ) ( IS-CRATE ?auto_670 ) ( AVAILABLE ?auto_678 ) ( TRUCK-AT ?auto_674 ?auto_673 ) ( AVAILABLE ?auto_675 ) ( SURFACE-AT ?auto_670 ?auto_673 ) ( ON ?auto_670 ?auto_679 ) ( CLEAR ?auto_670 ) ( not ( = ?auto_670 ?auto_679 ) ) ( not ( = ?auto_671 ?auto_679 ) ) ( not ( = ?auto_676 ?auto_679 ) ) ( not ( = ?auto_677 ?auto_679 ) ) )
    :subtasks
    ( ( !LIFT ?auto_675 ?auto_670 ?auto_679 ?auto_673 )
      ( MAKE-2CRATE ?auto_676 ?auto_670 ?auto_671 )
      ( MAKE-1CRATE-VERIFY ?auto_670 ?auto_671 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_680 - SURFACE
      ?auto_681 - SURFACE
      ?auto_682 - SURFACE
    )
    :vars
    (
      ?auto_686 - HOIST
      ?auto_684 - PLACE
      ?auto_689 - PLACE
      ?auto_687 - HOIST
      ?auto_685 - SURFACE
      ?auto_688 - TRUCK
      ?auto_683 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_686 ?auto_684 ) ( IS-CRATE ?auto_682 ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_680 ?auto_681 ) ) ( not ( = ?auto_680 ?auto_682 ) ) ( not ( = ?auto_689 ?auto_684 ) ) ( HOIST-AT ?auto_687 ?auto_689 ) ( not ( = ?auto_686 ?auto_687 ) ) ( SURFACE-AT ?auto_682 ?auto_689 ) ( ON ?auto_682 ?auto_685 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_681 ?auto_685 ) ) ( not ( = ?auto_682 ?auto_685 ) ) ( not ( = ?auto_680 ?auto_685 ) ) ( SURFACE-AT ?auto_680 ?auto_684 ) ( CLEAR ?auto_680 ) ( IS-CRATE ?auto_681 ) ( AVAILABLE ?auto_686 ) ( TRUCK-AT ?auto_688 ?auto_689 ) ( AVAILABLE ?auto_687 ) ( SURFACE-AT ?auto_681 ?auto_689 ) ( ON ?auto_681 ?auto_683 ) ( CLEAR ?auto_681 ) ( not ( = ?auto_681 ?auto_683 ) ) ( not ( = ?auto_682 ?auto_683 ) ) ( not ( = ?auto_680 ?auto_683 ) ) ( not ( = ?auto_685 ?auto_683 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_681 ?auto_682 )
      ( MAKE-2CRATE-VERIFY ?auto_680 ?auto_681 ?auto_682 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_690 - SURFACE
      ?auto_691 - SURFACE
    )
    :vars
    (
      ?auto_693 - HOIST
      ?auto_695 - PLACE
      ?auto_699 - SURFACE
      ?auto_697 - PLACE
      ?auto_698 - HOIST
      ?auto_694 - SURFACE
      ?auto_692 - SURFACE
      ?auto_696 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_693 ?auto_695 ) ( IS-CRATE ?auto_691 ) ( not ( = ?auto_690 ?auto_691 ) ) ( not ( = ?auto_699 ?auto_690 ) ) ( not ( = ?auto_699 ?auto_691 ) ) ( not ( = ?auto_697 ?auto_695 ) ) ( HOIST-AT ?auto_698 ?auto_697 ) ( not ( = ?auto_693 ?auto_698 ) ) ( SURFACE-AT ?auto_691 ?auto_697 ) ( ON ?auto_691 ?auto_694 ) ( CLEAR ?auto_691 ) ( not ( = ?auto_690 ?auto_694 ) ) ( not ( = ?auto_691 ?auto_694 ) ) ( not ( = ?auto_699 ?auto_694 ) ) ( SURFACE-AT ?auto_699 ?auto_695 ) ( CLEAR ?auto_699 ) ( IS-CRATE ?auto_690 ) ( AVAILABLE ?auto_693 ) ( AVAILABLE ?auto_698 ) ( SURFACE-AT ?auto_690 ?auto_697 ) ( ON ?auto_690 ?auto_692 ) ( CLEAR ?auto_690 ) ( not ( = ?auto_690 ?auto_692 ) ) ( not ( = ?auto_691 ?auto_692 ) ) ( not ( = ?auto_699 ?auto_692 ) ) ( not ( = ?auto_694 ?auto_692 ) ) ( TRUCK-AT ?auto_696 ?auto_695 ) )
    :subtasks
    ( ( !DRIVE ?auto_696 ?auto_695 ?auto_697 )
      ( MAKE-2CRATE ?auto_699 ?auto_690 ?auto_691 )
      ( MAKE-1CRATE-VERIFY ?auto_690 ?auto_691 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_700 - SURFACE
      ?auto_701 - SURFACE
      ?auto_702 - SURFACE
    )
    :vars
    (
      ?auto_704 - HOIST
      ?auto_703 - PLACE
      ?auto_709 - PLACE
      ?auto_705 - HOIST
      ?auto_706 - SURFACE
      ?auto_707 - SURFACE
      ?auto_708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_704 ?auto_703 ) ( IS-CRATE ?auto_702 ) ( not ( = ?auto_701 ?auto_702 ) ) ( not ( = ?auto_700 ?auto_701 ) ) ( not ( = ?auto_700 ?auto_702 ) ) ( not ( = ?auto_709 ?auto_703 ) ) ( HOIST-AT ?auto_705 ?auto_709 ) ( not ( = ?auto_704 ?auto_705 ) ) ( SURFACE-AT ?auto_702 ?auto_709 ) ( ON ?auto_702 ?auto_706 ) ( CLEAR ?auto_702 ) ( not ( = ?auto_701 ?auto_706 ) ) ( not ( = ?auto_702 ?auto_706 ) ) ( not ( = ?auto_700 ?auto_706 ) ) ( SURFACE-AT ?auto_700 ?auto_703 ) ( CLEAR ?auto_700 ) ( IS-CRATE ?auto_701 ) ( AVAILABLE ?auto_704 ) ( AVAILABLE ?auto_705 ) ( SURFACE-AT ?auto_701 ?auto_709 ) ( ON ?auto_701 ?auto_707 ) ( CLEAR ?auto_701 ) ( not ( = ?auto_701 ?auto_707 ) ) ( not ( = ?auto_702 ?auto_707 ) ) ( not ( = ?auto_700 ?auto_707 ) ) ( not ( = ?auto_706 ?auto_707 ) ) ( TRUCK-AT ?auto_708 ?auto_703 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_701 ?auto_702 )
      ( MAKE-2CRATE-VERIFY ?auto_700 ?auto_701 ?auto_702 ) )
  )

)

