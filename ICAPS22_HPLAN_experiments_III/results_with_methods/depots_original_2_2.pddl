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
      ?auto_516 - SURFACE
      ?auto_517 - SURFACE
    )
    :vars
    (
      ?auto_518 - HOIST
      ?auto_519 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_518 ?auto_519 ) ( SURFACE-AT ?auto_516 ?auto_519 ) ( CLEAR ?auto_516 ) ( LIFTING ?auto_518 ?auto_517 ) ( IS-CRATE ?auto_517 ) ( not ( = ?auto_516 ?auto_517 ) ) )
    :subtasks
    ( ( !DROP ?auto_518 ?auto_517 ?auto_516 ?auto_519 )
      ( MAKE-1CRATE-VERIFY ?auto_516 ?auto_517 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_520 - SURFACE
      ?auto_521 - SURFACE
    )
    :vars
    (
      ?auto_523 - HOIST
      ?auto_522 - PLACE
      ?auto_524 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_523 ?auto_522 ) ( SURFACE-AT ?auto_520 ?auto_522 ) ( CLEAR ?auto_520 ) ( IS-CRATE ?auto_521 ) ( not ( = ?auto_520 ?auto_521 ) ) ( TRUCK-AT ?auto_524 ?auto_522 ) ( AVAILABLE ?auto_523 ) ( IN ?auto_521 ?auto_524 ) )
    :subtasks
    ( ( !UNLOAD ?auto_523 ?auto_521 ?auto_524 ?auto_522 )
      ( MAKE-1CRATE ?auto_520 ?auto_521 )
      ( MAKE-1CRATE-VERIFY ?auto_520 ?auto_521 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_525 - SURFACE
      ?auto_526 - SURFACE
    )
    :vars
    (
      ?auto_527 - HOIST
      ?auto_528 - PLACE
      ?auto_529 - TRUCK
      ?auto_530 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_527 ?auto_528 ) ( SURFACE-AT ?auto_525 ?auto_528 ) ( CLEAR ?auto_525 ) ( IS-CRATE ?auto_526 ) ( not ( = ?auto_525 ?auto_526 ) ) ( AVAILABLE ?auto_527 ) ( IN ?auto_526 ?auto_529 ) ( TRUCK-AT ?auto_529 ?auto_530 ) ( not ( = ?auto_530 ?auto_528 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_529 ?auto_530 ?auto_528 )
      ( MAKE-1CRATE ?auto_525 ?auto_526 )
      ( MAKE-1CRATE-VERIFY ?auto_525 ?auto_526 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_531 - SURFACE
      ?auto_532 - SURFACE
    )
    :vars
    (
      ?auto_534 - HOIST
      ?auto_533 - PLACE
      ?auto_536 - TRUCK
      ?auto_535 - PLACE
      ?auto_537 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_534 ?auto_533 ) ( SURFACE-AT ?auto_531 ?auto_533 ) ( CLEAR ?auto_531 ) ( IS-CRATE ?auto_532 ) ( not ( = ?auto_531 ?auto_532 ) ) ( AVAILABLE ?auto_534 ) ( TRUCK-AT ?auto_536 ?auto_535 ) ( not ( = ?auto_535 ?auto_533 ) ) ( HOIST-AT ?auto_537 ?auto_535 ) ( LIFTING ?auto_537 ?auto_532 ) ( not ( = ?auto_534 ?auto_537 ) ) )
    :subtasks
    ( ( !LOAD ?auto_537 ?auto_532 ?auto_536 ?auto_535 )
      ( MAKE-1CRATE ?auto_531 ?auto_532 )
      ( MAKE-1CRATE-VERIFY ?auto_531 ?auto_532 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_538 - SURFACE
      ?auto_539 - SURFACE
    )
    :vars
    (
      ?auto_540 - HOIST
      ?auto_541 - PLACE
      ?auto_542 - TRUCK
      ?auto_544 - PLACE
      ?auto_543 - HOIST
      ?auto_545 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_540 ?auto_541 ) ( SURFACE-AT ?auto_538 ?auto_541 ) ( CLEAR ?auto_538 ) ( IS-CRATE ?auto_539 ) ( not ( = ?auto_538 ?auto_539 ) ) ( AVAILABLE ?auto_540 ) ( TRUCK-AT ?auto_542 ?auto_544 ) ( not ( = ?auto_544 ?auto_541 ) ) ( HOIST-AT ?auto_543 ?auto_544 ) ( not ( = ?auto_540 ?auto_543 ) ) ( AVAILABLE ?auto_543 ) ( SURFACE-AT ?auto_539 ?auto_544 ) ( ON ?auto_539 ?auto_545 ) ( CLEAR ?auto_539 ) ( not ( = ?auto_538 ?auto_545 ) ) ( not ( = ?auto_539 ?auto_545 ) ) )
    :subtasks
    ( ( !LIFT ?auto_543 ?auto_539 ?auto_545 ?auto_544 )
      ( MAKE-1CRATE ?auto_538 ?auto_539 )
      ( MAKE-1CRATE-VERIFY ?auto_538 ?auto_539 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_546 - SURFACE
      ?auto_547 - SURFACE
    )
    :vars
    (
      ?auto_550 - HOIST
      ?auto_552 - PLACE
      ?auto_551 - PLACE
      ?auto_553 - HOIST
      ?auto_548 - SURFACE
      ?auto_549 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_550 ?auto_552 ) ( SURFACE-AT ?auto_546 ?auto_552 ) ( CLEAR ?auto_546 ) ( IS-CRATE ?auto_547 ) ( not ( = ?auto_546 ?auto_547 ) ) ( AVAILABLE ?auto_550 ) ( not ( = ?auto_551 ?auto_552 ) ) ( HOIST-AT ?auto_553 ?auto_551 ) ( not ( = ?auto_550 ?auto_553 ) ) ( AVAILABLE ?auto_553 ) ( SURFACE-AT ?auto_547 ?auto_551 ) ( ON ?auto_547 ?auto_548 ) ( CLEAR ?auto_547 ) ( not ( = ?auto_546 ?auto_548 ) ) ( not ( = ?auto_547 ?auto_548 ) ) ( TRUCK-AT ?auto_549 ?auto_552 ) )
    :subtasks
    ( ( !DRIVE ?auto_549 ?auto_552 ?auto_551 )
      ( MAKE-1CRATE ?auto_546 ?auto_547 )
      ( MAKE-1CRATE-VERIFY ?auto_546 ?auto_547 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_559 - SURFACE
      ?auto_560 - SURFACE
    )
    :vars
    (
      ?auto_561 - HOIST
      ?auto_562 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_561 ?auto_562 ) ( SURFACE-AT ?auto_559 ?auto_562 ) ( CLEAR ?auto_559 ) ( LIFTING ?auto_561 ?auto_560 ) ( IS-CRATE ?auto_560 ) ( not ( = ?auto_559 ?auto_560 ) ) )
    :subtasks
    ( ( !DROP ?auto_561 ?auto_560 ?auto_559 ?auto_562 )
      ( MAKE-1CRATE-VERIFY ?auto_559 ?auto_560 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_563 - SURFACE
      ?auto_564 - SURFACE
      ?auto_565 - SURFACE
    )
    :vars
    (
      ?auto_567 - HOIST
      ?auto_566 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_567 ?auto_566 ) ( SURFACE-AT ?auto_564 ?auto_566 ) ( CLEAR ?auto_564 ) ( LIFTING ?auto_567 ?auto_565 ) ( IS-CRATE ?auto_565 ) ( not ( = ?auto_564 ?auto_565 ) ) ( ON ?auto_564 ?auto_563 ) ( not ( = ?auto_563 ?auto_564 ) ) ( not ( = ?auto_563 ?auto_565 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_564 ?auto_565 )
      ( MAKE-2CRATE-VERIFY ?auto_563 ?auto_564 ?auto_565 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_568 - SURFACE
      ?auto_569 - SURFACE
    )
    :vars
    (
      ?auto_571 - HOIST
      ?auto_570 - PLACE
      ?auto_572 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_571 ?auto_570 ) ( SURFACE-AT ?auto_568 ?auto_570 ) ( CLEAR ?auto_568 ) ( IS-CRATE ?auto_569 ) ( not ( = ?auto_568 ?auto_569 ) ) ( TRUCK-AT ?auto_572 ?auto_570 ) ( AVAILABLE ?auto_571 ) ( IN ?auto_569 ?auto_572 ) )
    :subtasks
    ( ( !UNLOAD ?auto_571 ?auto_569 ?auto_572 ?auto_570 )
      ( MAKE-1CRATE ?auto_568 ?auto_569 )
      ( MAKE-1CRATE-VERIFY ?auto_568 ?auto_569 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_573 - SURFACE
      ?auto_574 - SURFACE
      ?auto_575 - SURFACE
    )
    :vars
    (
      ?auto_578 - HOIST
      ?auto_576 - PLACE
      ?auto_577 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_578 ?auto_576 ) ( SURFACE-AT ?auto_574 ?auto_576 ) ( CLEAR ?auto_574 ) ( IS-CRATE ?auto_575 ) ( not ( = ?auto_574 ?auto_575 ) ) ( TRUCK-AT ?auto_577 ?auto_576 ) ( AVAILABLE ?auto_578 ) ( IN ?auto_575 ?auto_577 ) ( ON ?auto_574 ?auto_573 ) ( not ( = ?auto_573 ?auto_574 ) ) ( not ( = ?auto_573 ?auto_575 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_574 ?auto_575 )
      ( MAKE-2CRATE-VERIFY ?auto_573 ?auto_574 ?auto_575 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_579 - SURFACE
      ?auto_580 - SURFACE
    )
    :vars
    (
      ?auto_584 - HOIST
      ?auto_581 - PLACE
      ?auto_583 - TRUCK
      ?auto_582 - SURFACE
      ?auto_585 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_584 ?auto_581 ) ( SURFACE-AT ?auto_579 ?auto_581 ) ( CLEAR ?auto_579 ) ( IS-CRATE ?auto_580 ) ( not ( = ?auto_579 ?auto_580 ) ) ( AVAILABLE ?auto_584 ) ( IN ?auto_580 ?auto_583 ) ( ON ?auto_579 ?auto_582 ) ( not ( = ?auto_582 ?auto_579 ) ) ( not ( = ?auto_582 ?auto_580 ) ) ( TRUCK-AT ?auto_583 ?auto_585 ) ( not ( = ?auto_585 ?auto_581 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_583 ?auto_585 ?auto_581 )
      ( MAKE-2CRATE ?auto_582 ?auto_579 ?auto_580 )
      ( MAKE-1CRATE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_586 - SURFACE
      ?auto_587 - SURFACE
      ?auto_588 - SURFACE
    )
    :vars
    (
      ?auto_592 - HOIST
      ?auto_590 - PLACE
      ?auto_591 - TRUCK
      ?auto_589 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_592 ?auto_590 ) ( SURFACE-AT ?auto_587 ?auto_590 ) ( CLEAR ?auto_587 ) ( IS-CRATE ?auto_588 ) ( not ( = ?auto_587 ?auto_588 ) ) ( AVAILABLE ?auto_592 ) ( IN ?auto_588 ?auto_591 ) ( ON ?auto_587 ?auto_586 ) ( not ( = ?auto_586 ?auto_587 ) ) ( not ( = ?auto_586 ?auto_588 ) ) ( TRUCK-AT ?auto_591 ?auto_589 ) ( not ( = ?auto_589 ?auto_590 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_587 ?auto_588 )
      ( MAKE-2CRATE-VERIFY ?auto_586 ?auto_587 ?auto_588 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_593 - SURFACE
      ?auto_594 - SURFACE
    )
    :vars
    (
      ?auto_596 - HOIST
      ?auto_598 - PLACE
      ?auto_595 - SURFACE
      ?auto_597 - TRUCK
      ?auto_599 - PLACE
      ?auto_600 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_596 ?auto_598 ) ( SURFACE-AT ?auto_593 ?auto_598 ) ( CLEAR ?auto_593 ) ( IS-CRATE ?auto_594 ) ( not ( = ?auto_593 ?auto_594 ) ) ( AVAILABLE ?auto_596 ) ( ON ?auto_593 ?auto_595 ) ( not ( = ?auto_595 ?auto_593 ) ) ( not ( = ?auto_595 ?auto_594 ) ) ( TRUCK-AT ?auto_597 ?auto_599 ) ( not ( = ?auto_599 ?auto_598 ) ) ( HOIST-AT ?auto_600 ?auto_599 ) ( LIFTING ?auto_600 ?auto_594 ) ( not ( = ?auto_596 ?auto_600 ) ) )
    :subtasks
    ( ( !LOAD ?auto_600 ?auto_594 ?auto_597 ?auto_599 )
      ( MAKE-2CRATE ?auto_595 ?auto_593 ?auto_594 )
      ( MAKE-1CRATE-VERIFY ?auto_593 ?auto_594 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_601 - SURFACE
      ?auto_602 - SURFACE
      ?auto_603 - SURFACE
    )
    :vars
    (
      ?auto_608 - HOIST
      ?auto_606 - PLACE
      ?auto_604 - TRUCK
      ?auto_607 - PLACE
      ?auto_605 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_608 ?auto_606 ) ( SURFACE-AT ?auto_602 ?auto_606 ) ( CLEAR ?auto_602 ) ( IS-CRATE ?auto_603 ) ( not ( = ?auto_602 ?auto_603 ) ) ( AVAILABLE ?auto_608 ) ( ON ?auto_602 ?auto_601 ) ( not ( = ?auto_601 ?auto_602 ) ) ( not ( = ?auto_601 ?auto_603 ) ) ( TRUCK-AT ?auto_604 ?auto_607 ) ( not ( = ?auto_607 ?auto_606 ) ) ( HOIST-AT ?auto_605 ?auto_607 ) ( LIFTING ?auto_605 ?auto_603 ) ( not ( = ?auto_608 ?auto_605 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_602 ?auto_603 )
      ( MAKE-2CRATE-VERIFY ?auto_601 ?auto_602 ?auto_603 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_609 - SURFACE
      ?auto_610 - SURFACE
    )
    :vars
    (
      ?auto_613 - HOIST
      ?auto_614 - PLACE
      ?auto_611 - SURFACE
      ?auto_615 - TRUCK
      ?auto_616 - PLACE
      ?auto_612 - HOIST
      ?auto_617 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_613 ?auto_614 ) ( SURFACE-AT ?auto_609 ?auto_614 ) ( CLEAR ?auto_609 ) ( IS-CRATE ?auto_610 ) ( not ( = ?auto_609 ?auto_610 ) ) ( AVAILABLE ?auto_613 ) ( ON ?auto_609 ?auto_611 ) ( not ( = ?auto_611 ?auto_609 ) ) ( not ( = ?auto_611 ?auto_610 ) ) ( TRUCK-AT ?auto_615 ?auto_616 ) ( not ( = ?auto_616 ?auto_614 ) ) ( HOIST-AT ?auto_612 ?auto_616 ) ( not ( = ?auto_613 ?auto_612 ) ) ( AVAILABLE ?auto_612 ) ( SURFACE-AT ?auto_610 ?auto_616 ) ( ON ?auto_610 ?auto_617 ) ( CLEAR ?auto_610 ) ( not ( = ?auto_609 ?auto_617 ) ) ( not ( = ?auto_610 ?auto_617 ) ) ( not ( = ?auto_611 ?auto_617 ) ) )
    :subtasks
    ( ( !LIFT ?auto_612 ?auto_610 ?auto_617 ?auto_616 )
      ( MAKE-2CRATE ?auto_611 ?auto_609 ?auto_610 )
      ( MAKE-1CRATE-VERIFY ?auto_609 ?auto_610 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_618 - SURFACE
      ?auto_619 - SURFACE
      ?auto_620 - SURFACE
    )
    :vars
    (
      ?auto_626 - HOIST
      ?auto_622 - PLACE
      ?auto_624 - TRUCK
      ?auto_621 - PLACE
      ?auto_623 - HOIST
      ?auto_625 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_626 ?auto_622 ) ( SURFACE-AT ?auto_619 ?auto_622 ) ( CLEAR ?auto_619 ) ( IS-CRATE ?auto_620 ) ( not ( = ?auto_619 ?auto_620 ) ) ( AVAILABLE ?auto_626 ) ( ON ?auto_619 ?auto_618 ) ( not ( = ?auto_618 ?auto_619 ) ) ( not ( = ?auto_618 ?auto_620 ) ) ( TRUCK-AT ?auto_624 ?auto_621 ) ( not ( = ?auto_621 ?auto_622 ) ) ( HOIST-AT ?auto_623 ?auto_621 ) ( not ( = ?auto_626 ?auto_623 ) ) ( AVAILABLE ?auto_623 ) ( SURFACE-AT ?auto_620 ?auto_621 ) ( ON ?auto_620 ?auto_625 ) ( CLEAR ?auto_620 ) ( not ( = ?auto_619 ?auto_625 ) ) ( not ( = ?auto_620 ?auto_625 ) ) ( not ( = ?auto_618 ?auto_625 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_619 ?auto_620 )
      ( MAKE-2CRATE-VERIFY ?auto_618 ?auto_619 ?auto_620 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_627 - SURFACE
      ?auto_628 - SURFACE
    )
    :vars
    (
      ?auto_630 - HOIST
      ?auto_631 - PLACE
      ?auto_635 - SURFACE
      ?auto_633 - PLACE
      ?auto_629 - HOIST
      ?auto_632 - SURFACE
      ?auto_634 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_630 ?auto_631 ) ( SURFACE-AT ?auto_627 ?auto_631 ) ( CLEAR ?auto_627 ) ( IS-CRATE ?auto_628 ) ( not ( = ?auto_627 ?auto_628 ) ) ( AVAILABLE ?auto_630 ) ( ON ?auto_627 ?auto_635 ) ( not ( = ?auto_635 ?auto_627 ) ) ( not ( = ?auto_635 ?auto_628 ) ) ( not ( = ?auto_633 ?auto_631 ) ) ( HOIST-AT ?auto_629 ?auto_633 ) ( not ( = ?auto_630 ?auto_629 ) ) ( AVAILABLE ?auto_629 ) ( SURFACE-AT ?auto_628 ?auto_633 ) ( ON ?auto_628 ?auto_632 ) ( CLEAR ?auto_628 ) ( not ( = ?auto_627 ?auto_632 ) ) ( not ( = ?auto_628 ?auto_632 ) ) ( not ( = ?auto_635 ?auto_632 ) ) ( TRUCK-AT ?auto_634 ?auto_631 ) )
    :subtasks
    ( ( !DRIVE ?auto_634 ?auto_631 ?auto_633 )
      ( MAKE-2CRATE ?auto_635 ?auto_627 ?auto_628 )
      ( MAKE-1CRATE-VERIFY ?auto_627 ?auto_628 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_636 - SURFACE
      ?auto_637 - SURFACE
      ?auto_638 - SURFACE
    )
    :vars
    (
      ?auto_644 - HOIST
      ?auto_642 - PLACE
      ?auto_639 - PLACE
      ?auto_640 - HOIST
      ?auto_643 - SURFACE
      ?auto_641 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_644 ?auto_642 ) ( SURFACE-AT ?auto_637 ?auto_642 ) ( CLEAR ?auto_637 ) ( IS-CRATE ?auto_638 ) ( not ( = ?auto_637 ?auto_638 ) ) ( AVAILABLE ?auto_644 ) ( ON ?auto_637 ?auto_636 ) ( not ( = ?auto_636 ?auto_637 ) ) ( not ( = ?auto_636 ?auto_638 ) ) ( not ( = ?auto_639 ?auto_642 ) ) ( HOIST-AT ?auto_640 ?auto_639 ) ( not ( = ?auto_644 ?auto_640 ) ) ( AVAILABLE ?auto_640 ) ( SURFACE-AT ?auto_638 ?auto_639 ) ( ON ?auto_638 ?auto_643 ) ( CLEAR ?auto_638 ) ( not ( = ?auto_637 ?auto_643 ) ) ( not ( = ?auto_638 ?auto_643 ) ) ( not ( = ?auto_636 ?auto_643 ) ) ( TRUCK-AT ?auto_641 ?auto_642 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_637 ?auto_638 )
      ( MAKE-2CRATE-VERIFY ?auto_636 ?auto_637 ?auto_638 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_645 - SURFACE
      ?auto_646 - SURFACE
    )
    :vars
    (
      ?auto_652 - HOIST
      ?auto_649 - PLACE
      ?auto_651 - SURFACE
      ?auto_647 - PLACE
      ?auto_653 - HOIST
      ?auto_650 - SURFACE
      ?auto_648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_652 ?auto_649 ) ( IS-CRATE ?auto_646 ) ( not ( = ?auto_645 ?auto_646 ) ) ( not ( = ?auto_651 ?auto_645 ) ) ( not ( = ?auto_651 ?auto_646 ) ) ( not ( = ?auto_647 ?auto_649 ) ) ( HOIST-AT ?auto_653 ?auto_647 ) ( not ( = ?auto_652 ?auto_653 ) ) ( AVAILABLE ?auto_653 ) ( SURFACE-AT ?auto_646 ?auto_647 ) ( ON ?auto_646 ?auto_650 ) ( CLEAR ?auto_646 ) ( not ( = ?auto_645 ?auto_650 ) ) ( not ( = ?auto_646 ?auto_650 ) ) ( not ( = ?auto_651 ?auto_650 ) ) ( TRUCK-AT ?auto_648 ?auto_649 ) ( SURFACE-AT ?auto_651 ?auto_649 ) ( CLEAR ?auto_651 ) ( LIFTING ?auto_652 ?auto_645 ) ( IS-CRATE ?auto_645 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_651 ?auto_645 )
      ( MAKE-2CRATE ?auto_651 ?auto_645 ?auto_646 )
      ( MAKE-1CRATE-VERIFY ?auto_645 ?auto_646 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_654 - SURFACE
      ?auto_655 - SURFACE
      ?auto_656 - SURFACE
    )
    :vars
    (
      ?auto_657 - HOIST
      ?auto_660 - PLACE
      ?auto_661 - PLACE
      ?auto_659 - HOIST
      ?auto_658 - SURFACE
      ?auto_662 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_657 ?auto_660 ) ( IS-CRATE ?auto_656 ) ( not ( = ?auto_655 ?auto_656 ) ) ( not ( = ?auto_654 ?auto_655 ) ) ( not ( = ?auto_654 ?auto_656 ) ) ( not ( = ?auto_661 ?auto_660 ) ) ( HOIST-AT ?auto_659 ?auto_661 ) ( not ( = ?auto_657 ?auto_659 ) ) ( AVAILABLE ?auto_659 ) ( SURFACE-AT ?auto_656 ?auto_661 ) ( ON ?auto_656 ?auto_658 ) ( CLEAR ?auto_656 ) ( not ( = ?auto_655 ?auto_658 ) ) ( not ( = ?auto_656 ?auto_658 ) ) ( not ( = ?auto_654 ?auto_658 ) ) ( TRUCK-AT ?auto_662 ?auto_660 ) ( SURFACE-AT ?auto_654 ?auto_660 ) ( CLEAR ?auto_654 ) ( LIFTING ?auto_657 ?auto_655 ) ( IS-CRATE ?auto_655 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_655 ?auto_656 )
      ( MAKE-2CRATE-VERIFY ?auto_654 ?auto_655 ?auto_656 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_663 - SURFACE
      ?auto_664 - SURFACE
    )
    :vars
    (
      ?auto_667 - HOIST
      ?auto_666 - PLACE
      ?auto_671 - SURFACE
      ?auto_668 - PLACE
      ?auto_670 - HOIST
      ?auto_665 - SURFACE
      ?auto_669 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_667 ?auto_666 ) ( IS-CRATE ?auto_664 ) ( not ( = ?auto_663 ?auto_664 ) ) ( not ( = ?auto_671 ?auto_663 ) ) ( not ( = ?auto_671 ?auto_664 ) ) ( not ( = ?auto_668 ?auto_666 ) ) ( HOIST-AT ?auto_670 ?auto_668 ) ( not ( = ?auto_667 ?auto_670 ) ) ( AVAILABLE ?auto_670 ) ( SURFACE-AT ?auto_664 ?auto_668 ) ( ON ?auto_664 ?auto_665 ) ( CLEAR ?auto_664 ) ( not ( = ?auto_663 ?auto_665 ) ) ( not ( = ?auto_664 ?auto_665 ) ) ( not ( = ?auto_671 ?auto_665 ) ) ( TRUCK-AT ?auto_669 ?auto_666 ) ( SURFACE-AT ?auto_671 ?auto_666 ) ( CLEAR ?auto_671 ) ( IS-CRATE ?auto_663 ) ( AVAILABLE ?auto_667 ) ( IN ?auto_663 ?auto_669 ) )
    :subtasks
    ( ( !UNLOAD ?auto_667 ?auto_663 ?auto_669 ?auto_666 )
      ( MAKE-2CRATE ?auto_671 ?auto_663 ?auto_664 )
      ( MAKE-1CRATE-VERIFY ?auto_663 ?auto_664 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_672 - SURFACE
      ?auto_673 - SURFACE
      ?auto_674 - SURFACE
    )
    :vars
    (
      ?auto_679 - HOIST
      ?auto_678 - PLACE
      ?auto_677 - PLACE
      ?auto_680 - HOIST
      ?auto_675 - SURFACE
      ?auto_676 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_679 ?auto_678 ) ( IS-CRATE ?auto_674 ) ( not ( = ?auto_673 ?auto_674 ) ) ( not ( = ?auto_672 ?auto_673 ) ) ( not ( = ?auto_672 ?auto_674 ) ) ( not ( = ?auto_677 ?auto_678 ) ) ( HOIST-AT ?auto_680 ?auto_677 ) ( not ( = ?auto_679 ?auto_680 ) ) ( AVAILABLE ?auto_680 ) ( SURFACE-AT ?auto_674 ?auto_677 ) ( ON ?auto_674 ?auto_675 ) ( CLEAR ?auto_674 ) ( not ( = ?auto_673 ?auto_675 ) ) ( not ( = ?auto_674 ?auto_675 ) ) ( not ( = ?auto_672 ?auto_675 ) ) ( TRUCK-AT ?auto_676 ?auto_678 ) ( SURFACE-AT ?auto_672 ?auto_678 ) ( CLEAR ?auto_672 ) ( IS-CRATE ?auto_673 ) ( AVAILABLE ?auto_679 ) ( IN ?auto_673 ?auto_676 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_673 ?auto_674 )
      ( MAKE-2CRATE-VERIFY ?auto_672 ?auto_673 ?auto_674 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_681 - SURFACE
      ?auto_682 - SURFACE
    )
    :vars
    (
      ?auto_687 - HOIST
      ?auto_689 - PLACE
      ?auto_688 - SURFACE
      ?auto_684 - PLACE
      ?auto_683 - HOIST
      ?auto_686 - SURFACE
      ?auto_685 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_687 ?auto_689 ) ( IS-CRATE ?auto_682 ) ( not ( = ?auto_681 ?auto_682 ) ) ( not ( = ?auto_688 ?auto_681 ) ) ( not ( = ?auto_688 ?auto_682 ) ) ( not ( = ?auto_684 ?auto_689 ) ) ( HOIST-AT ?auto_683 ?auto_684 ) ( not ( = ?auto_687 ?auto_683 ) ) ( AVAILABLE ?auto_683 ) ( SURFACE-AT ?auto_682 ?auto_684 ) ( ON ?auto_682 ?auto_686 ) ( CLEAR ?auto_682 ) ( not ( = ?auto_681 ?auto_686 ) ) ( not ( = ?auto_682 ?auto_686 ) ) ( not ( = ?auto_688 ?auto_686 ) ) ( SURFACE-AT ?auto_688 ?auto_689 ) ( CLEAR ?auto_688 ) ( IS-CRATE ?auto_681 ) ( AVAILABLE ?auto_687 ) ( IN ?auto_681 ?auto_685 ) ( TRUCK-AT ?auto_685 ?auto_684 ) )
    :subtasks
    ( ( !DRIVE ?auto_685 ?auto_684 ?auto_689 )
      ( MAKE-2CRATE ?auto_688 ?auto_681 ?auto_682 )
      ( MAKE-1CRATE-VERIFY ?auto_681 ?auto_682 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_690 - SURFACE
      ?auto_691 - SURFACE
      ?auto_692 - SURFACE
    )
    :vars
    (
      ?auto_694 - HOIST
      ?auto_697 - PLACE
      ?auto_696 - PLACE
      ?auto_693 - HOIST
      ?auto_698 - SURFACE
      ?auto_695 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_694 ?auto_697 ) ( IS-CRATE ?auto_692 ) ( not ( = ?auto_691 ?auto_692 ) ) ( not ( = ?auto_690 ?auto_691 ) ) ( not ( = ?auto_690 ?auto_692 ) ) ( not ( = ?auto_696 ?auto_697 ) ) ( HOIST-AT ?auto_693 ?auto_696 ) ( not ( = ?auto_694 ?auto_693 ) ) ( AVAILABLE ?auto_693 ) ( SURFACE-AT ?auto_692 ?auto_696 ) ( ON ?auto_692 ?auto_698 ) ( CLEAR ?auto_692 ) ( not ( = ?auto_691 ?auto_698 ) ) ( not ( = ?auto_692 ?auto_698 ) ) ( not ( = ?auto_690 ?auto_698 ) ) ( SURFACE-AT ?auto_690 ?auto_697 ) ( CLEAR ?auto_690 ) ( IS-CRATE ?auto_691 ) ( AVAILABLE ?auto_694 ) ( IN ?auto_691 ?auto_695 ) ( TRUCK-AT ?auto_695 ?auto_696 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_691 ?auto_692 )
      ( MAKE-2CRATE-VERIFY ?auto_690 ?auto_691 ?auto_692 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_699 - SURFACE
      ?auto_700 - SURFACE
    )
    :vars
    (
      ?auto_704 - HOIST
      ?auto_706 - PLACE
      ?auto_701 - SURFACE
      ?auto_707 - PLACE
      ?auto_702 - HOIST
      ?auto_703 - SURFACE
      ?auto_705 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_704 ?auto_706 ) ( IS-CRATE ?auto_700 ) ( not ( = ?auto_699 ?auto_700 ) ) ( not ( = ?auto_701 ?auto_699 ) ) ( not ( = ?auto_701 ?auto_700 ) ) ( not ( = ?auto_707 ?auto_706 ) ) ( HOIST-AT ?auto_702 ?auto_707 ) ( not ( = ?auto_704 ?auto_702 ) ) ( SURFACE-AT ?auto_700 ?auto_707 ) ( ON ?auto_700 ?auto_703 ) ( CLEAR ?auto_700 ) ( not ( = ?auto_699 ?auto_703 ) ) ( not ( = ?auto_700 ?auto_703 ) ) ( not ( = ?auto_701 ?auto_703 ) ) ( SURFACE-AT ?auto_701 ?auto_706 ) ( CLEAR ?auto_701 ) ( IS-CRATE ?auto_699 ) ( AVAILABLE ?auto_704 ) ( TRUCK-AT ?auto_705 ?auto_707 ) ( LIFTING ?auto_702 ?auto_699 ) )
    :subtasks
    ( ( !LOAD ?auto_702 ?auto_699 ?auto_705 ?auto_707 )
      ( MAKE-2CRATE ?auto_701 ?auto_699 ?auto_700 )
      ( MAKE-1CRATE-VERIFY ?auto_699 ?auto_700 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_708 - SURFACE
      ?auto_709 - SURFACE
      ?auto_710 - SURFACE
    )
    :vars
    (
      ?auto_714 - HOIST
      ?auto_711 - PLACE
      ?auto_715 - PLACE
      ?auto_716 - HOIST
      ?auto_713 - SURFACE
      ?auto_712 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_714 ?auto_711 ) ( IS-CRATE ?auto_710 ) ( not ( = ?auto_709 ?auto_710 ) ) ( not ( = ?auto_708 ?auto_709 ) ) ( not ( = ?auto_708 ?auto_710 ) ) ( not ( = ?auto_715 ?auto_711 ) ) ( HOIST-AT ?auto_716 ?auto_715 ) ( not ( = ?auto_714 ?auto_716 ) ) ( SURFACE-AT ?auto_710 ?auto_715 ) ( ON ?auto_710 ?auto_713 ) ( CLEAR ?auto_710 ) ( not ( = ?auto_709 ?auto_713 ) ) ( not ( = ?auto_710 ?auto_713 ) ) ( not ( = ?auto_708 ?auto_713 ) ) ( SURFACE-AT ?auto_708 ?auto_711 ) ( CLEAR ?auto_708 ) ( IS-CRATE ?auto_709 ) ( AVAILABLE ?auto_714 ) ( TRUCK-AT ?auto_712 ?auto_715 ) ( LIFTING ?auto_716 ?auto_709 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_709 ?auto_710 )
      ( MAKE-2CRATE-VERIFY ?auto_708 ?auto_709 ?auto_710 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_717 - SURFACE
      ?auto_718 - SURFACE
    )
    :vars
    (
      ?auto_723 - HOIST
      ?auto_720 - PLACE
      ?auto_725 - SURFACE
      ?auto_724 - PLACE
      ?auto_719 - HOIST
      ?auto_721 - SURFACE
      ?auto_722 - TRUCK
      ?auto_726 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_723 ?auto_720 ) ( IS-CRATE ?auto_718 ) ( not ( = ?auto_717 ?auto_718 ) ) ( not ( = ?auto_725 ?auto_717 ) ) ( not ( = ?auto_725 ?auto_718 ) ) ( not ( = ?auto_724 ?auto_720 ) ) ( HOIST-AT ?auto_719 ?auto_724 ) ( not ( = ?auto_723 ?auto_719 ) ) ( SURFACE-AT ?auto_718 ?auto_724 ) ( ON ?auto_718 ?auto_721 ) ( CLEAR ?auto_718 ) ( not ( = ?auto_717 ?auto_721 ) ) ( not ( = ?auto_718 ?auto_721 ) ) ( not ( = ?auto_725 ?auto_721 ) ) ( SURFACE-AT ?auto_725 ?auto_720 ) ( CLEAR ?auto_725 ) ( IS-CRATE ?auto_717 ) ( AVAILABLE ?auto_723 ) ( TRUCK-AT ?auto_722 ?auto_724 ) ( AVAILABLE ?auto_719 ) ( SURFACE-AT ?auto_717 ?auto_724 ) ( ON ?auto_717 ?auto_726 ) ( CLEAR ?auto_717 ) ( not ( = ?auto_717 ?auto_726 ) ) ( not ( = ?auto_718 ?auto_726 ) ) ( not ( = ?auto_725 ?auto_726 ) ) ( not ( = ?auto_721 ?auto_726 ) ) )
    :subtasks
    ( ( !LIFT ?auto_719 ?auto_717 ?auto_726 ?auto_724 )
      ( MAKE-2CRATE ?auto_725 ?auto_717 ?auto_718 )
      ( MAKE-1CRATE-VERIFY ?auto_717 ?auto_718 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_727 - SURFACE
      ?auto_728 - SURFACE
      ?auto_729 - SURFACE
    )
    :vars
    (
      ?auto_730 - HOIST
      ?auto_735 - PLACE
      ?auto_733 - PLACE
      ?auto_732 - HOIST
      ?auto_734 - SURFACE
      ?auto_736 - TRUCK
      ?auto_731 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_730 ?auto_735 ) ( IS-CRATE ?auto_729 ) ( not ( = ?auto_728 ?auto_729 ) ) ( not ( = ?auto_727 ?auto_728 ) ) ( not ( = ?auto_727 ?auto_729 ) ) ( not ( = ?auto_733 ?auto_735 ) ) ( HOIST-AT ?auto_732 ?auto_733 ) ( not ( = ?auto_730 ?auto_732 ) ) ( SURFACE-AT ?auto_729 ?auto_733 ) ( ON ?auto_729 ?auto_734 ) ( CLEAR ?auto_729 ) ( not ( = ?auto_728 ?auto_734 ) ) ( not ( = ?auto_729 ?auto_734 ) ) ( not ( = ?auto_727 ?auto_734 ) ) ( SURFACE-AT ?auto_727 ?auto_735 ) ( CLEAR ?auto_727 ) ( IS-CRATE ?auto_728 ) ( AVAILABLE ?auto_730 ) ( TRUCK-AT ?auto_736 ?auto_733 ) ( AVAILABLE ?auto_732 ) ( SURFACE-AT ?auto_728 ?auto_733 ) ( ON ?auto_728 ?auto_731 ) ( CLEAR ?auto_728 ) ( not ( = ?auto_728 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_731 ) ) ( not ( = ?auto_727 ?auto_731 ) ) ( not ( = ?auto_734 ?auto_731 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_728 ?auto_729 )
      ( MAKE-2CRATE-VERIFY ?auto_727 ?auto_728 ?auto_729 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_737 - SURFACE
      ?auto_738 - SURFACE
    )
    :vars
    (
      ?auto_744 - HOIST
      ?auto_742 - PLACE
      ?auto_745 - SURFACE
      ?auto_739 - PLACE
      ?auto_746 - HOIST
      ?auto_743 - SURFACE
      ?auto_740 - SURFACE
      ?auto_741 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_744 ?auto_742 ) ( IS-CRATE ?auto_738 ) ( not ( = ?auto_737 ?auto_738 ) ) ( not ( = ?auto_745 ?auto_737 ) ) ( not ( = ?auto_745 ?auto_738 ) ) ( not ( = ?auto_739 ?auto_742 ) ) ( HOIST-AT ?auto_746 ?auto_739 ) ( not ( = ?auto_744 ?auto_746 ) ) ( SURFACE-AT ?auto_738 ?auto_739 ) ( ON ?auto_738 ?auto_743 ) ( CLEAR ?auto_738 ) ( not ( = ?auto_737 ?auto_743 ) ) ( not ( = ?auto_738 ?auto_743 ) ) ( not ( = ?auto_745 ?auto_743 ) ) ( SURFACE-AT ?auto_745 ?auto_742 ) ( CLEAR ?auto_745 ) ( IS-CRATE ?auto_737 ) ( AVAILABLE ?auto_744 ) ( AVAILABLE ?auto_746 ) ( SURFACE-AT ?auto_737 ?auto_739 ) ( ON ?auto_737 ?auto_740 ) ( CLEAR ?auto_737 ) ( not ( = ?auto_737 ?auto_740 ) ) ( not ( = ?auto_738 ?auto_740 ) ) ( not ( = ?auto_745 ?auto_740 ) ) ( not ( = ?auto_743 ?auto_740 ) ) ( TRUCK-AT ?auto_741 ?auto_742 ) )
    :subtasks
    ( ( !DRIVE ?auto_741 ?auto_742 ?auto_739 )
      ( MAKE-2CRATE ?auto_745 ?auto_737 ?auto_738 )
      ( MAKE-1CRATE-VERIFY ?auto_737 ?auto_738 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_747 - SURFACE
      ?auto_748 - SURFACE
      ?auto_749 - SURFACE
    )
    :vars
    (
      ?auto_756 - HOIST
      ?auto_751 - PLACE
      ?auto_750 - PLACE
      ?auto_753 - HOIST
      ?auto_752 - SURFACE
      ?auto_755 - SURFACE
      ?auto_754 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_756 ?auto_751 ) ( IS-CRATE ?auto_749 ) ( not ( = ?auto_748 ?auto_749 ) ) ( not ( = ?auto_747 ?auto_748 ) ) ( not ( = ?auto_747 ?auto_749 ) ) ( not ( = ?auto_750 ?auto_751 ) ) ( HOIST-AT ?auto_753 ?auto_750 ) ( not ( = ?auto_756 ?auto_753 ) ) ( SURFACE-AT ?auto_749 ?auto_750 ) ( ON ?auto_749 ?auto_752 ) ( CLEAR ?auto_749 ) ( not ( = ?auto_748 ?auto_752 ) ) ( not ( = ?auto_749 ?auto_752 ) ) ( not ( = ?auto_747 ?auto_752 ) ) ( SURFACE-AT ?auto_747 ?auto_751 ) ( CLEAR ?auto_747 ) ( IS-CRATE ?auto_748 ) ( AVAILABLE ?auto_756 ) ( AVAILABLE ?auto_753 ) ( SURFACE-AT ?auto_748 ?auto_750 ) ( ON ?auto_748 ?auto_755 ) ( CLEAR ?auto_748 ) ( not ( = ?auto_748 ?auto_755 ) ) ( not ( = ?auto_749 ?auto_755 ) ) ( not ( = ?auto_747 ?auto_755 ) ) ( not ( = ?auto_752 ?auto_755 ) ) ( TRUCK-AT ?auto_754 ?auto_751 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_748 ?auto_749 )
      ( MAKE-2CRATE-VERIFY ?auto_747 ?auto_748 ?auto_749 ) )
  )

)

