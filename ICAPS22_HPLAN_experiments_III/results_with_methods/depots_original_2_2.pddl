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
      ?auto_502 - SURFACE
      ?auto_503 - SURFACE
    )
    :vars
    (
      ?auto_504 - HOIST
      ?auto_505 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_504 ?auto_505 ) ( SURFACE-AT ?auto_502 ?auto_505 ) ( CLEAR ?auto_502 ) ( LIFTING ?auto_504 ?auto_503 ) ( IS-CRATE ?auto_503 ) ( not ( = ?auto_502 ?auto_503 ) ) )
    :subtasks
    ( ( !DROP ?auto_504 ?auto_503 ?auto_502 ?auto_505 )
      ( MAKE-1CRATE-VERIFY ?auto_502 ?auto_503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_506 - SURFACE
      ?auto_507 - SURFACE
    )
    :vars
    (
      ?auto_509 - HOIST
      ?auto_508 - PLACE
      ?auto_510 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_509 ?auto_508 ) ( SURFACE-AT ?auto_506 ?auto_508 ) ( CLEAR ?auto_506 ) ( IS-CRATE ?auto_507 ) ( not ( = ?auto_506 ?auto_507 ) ) ( TRUCK-AT ?auto_510 ?auto_508 ) ( AVAILABLE ?auto_509 ) ( IN ?auto_507 ?auto_510 ) )
    :subtasks
    ( ( !UNLOAD ?auto_509 ?auto_507 ?auto_510 ?auto_508 )
      ( MAKE-1CRATE ?auto_506 ?auto_507 )
      ( MAKE-1CRATE-VERIFY ?auto_506 ?auto_507 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_511 - SURFACE
      ?auto_512 - SURFACE
    )
    :vars
    (
      ?auto_513 - HOIST
      ?auto_514 - PLACE
      ?auto_515 - TRUCK
      ?auto_516 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_513 ?auto_514 ) ( SURFACE-AT ?auto_511 ?auto_514 ) ( CLEAR ?auto_511 ) ( IS-CRATE ?auto_512 ) ( not ( = ?auto_511 ?auto_512 ) ) ( AVAILABLE ?auto_513 ) ( IN ?auto_512 ?auto_515 ) ( TRUCK-AT ?auto_515 ?auto_516 ) ( not ( = ?auto_516 ?auto_514 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_515 ?auto_516 ?auto_514 )
      ( MAKE-1CRATE ?auto_511 ?auto_512 )
      ( MAKE-1CRATE-VERIFY ?auto_511 ?auto_512 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_517 - SURFACE
      ?auto_518 - SURFACE
    )
    :vars
    (
      ?auto_519 - HOIST
      ?auto_522 - PLACE
      ?auto_520 - TRUCK
      ?auto_521 - PLACE
      ?auto_523 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_519 ?auto_522 ) ( SURFACE-AT ?auto_517 ?auto_522 ) ( CLEAR ?auto_517 ) ( IS-CRATE ?auto_518 ) ( not ( = ?auto_517 ?auto_518 ) ) ( AVAILABLE ?auto_519 ) ( TRUCK-AT ?auto_520 ?auto_521 ) ( not ( = ?auto_521 ?auto_522 ) ) ( HOIST-AT ?auto_523 ?auto_521 ) ( LIFTING ?auto_523 ?auto_518 ) ( not ( = ?auto_519 ?auto_523 ) ) )
    :subtasks
    ( ( !LOAD ?auto_523 ?auto_518 ?auto_520 ?auto_521 )
      ( MAKE-1CRATE ?auto_517 ?auto_518 )
      ( MAKE-1CRATE-VERIFY ?auto_517 ?auto_518 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_524 - SURFACE
      ?auto_525 - SURFACE
    )
    :vars
    (
      ?auto_526 - HOIST
      ?auto_528 - PLACE
      ?auto_530 - TRUCK
      ?auto_529 - PLACE
      ?auto_527 - HOIST
      ?auto_531 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_526 ?auto_528 ) ( SURFACE-AT ?auto_524 ?auto_528 ) ( CLEAR ?auto_524 ) ( IS-CRATE ?auto_525 ) ( not ( = ?auto_524 ?auto_525 ) ) ( AVAILABLE ?auto_526 ) ( TRUCK-AT ?auto_530 ?auto_529 ) ( not ( = ?auto_529 ?auto_528 ) ) ( HOIST-AT ?auto_527 ?auto_529 ) ( not ( = ?auto_526 ?auto_527 ) ) ( AVAILABLE ?auto_527 ) ( SURFACE-AT ?auto_525 ?auto_529 ) ( ON ?auto_525 ?auto_531 ) ( CLEAR ?auto_525 ) ( not ( = ?auto_524 ?auto_531 ) ) ( not ( = ?auto_525 ?auto_531 ) ) )
    :subtasks
    ( ( !LIFT ?auto_527 ?auto_525 ?auto_531 ?auto_529 )
      ( MAKE-1CRATE ?auto_524 ?auto_525 )
      ( MAKE-1CRATE-VERIFY ?auto_524 ?auto_525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_532 - SURFACE
      ?auto_533 - SURFACE
    )
    :vars
    (
      ?auto_537 - HOIST
      ?auto_539 - PLACE
      ?auto_538 - PLACE
      ?auto_536 - HOIST
      ?auto_535 - SURFACE
      ?auto_534 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_537 ?auto_539 ) ( SURFACE-AT ?auto_532 ?auto_539 ) ( CLEAR ?auto_532 ) ( IS-CRATE ?auto_533 ) ( not ( = ?auto_532 ?auto_533 ) ) ( AVAILABLE ?auto_537 ) ( not ( = ?auto_538 ?auto_539 ) ) ( HOIST-AT ?auto_536 ?auto_538 ) ( not ( = ?auto_537 ?auto_536 ) ) ( AVAILABLE ?auto_536 ) ( SURFACE-AT ?auto_533 ?auto_538 ) ( ON ?auto_533 ?auto_535 ) ( CLEAR ?auto_533 ) ( not ( = ?auto_532 ?auto_535 ) ) ( not ( = ?auto_533 ?auto_535 ) ) ( TRUCK-AT ?auto_534 ?auto_539 ) )
    :subtasks
    ( ( !DRIVE ?auto_534 ?auto_539 ?auto_538 )
      ( MAKE-1CRATE ?auto_532 ?auto_533 )
      ( MAKE-1CRATE-VERIFY ?auto_532 ?auto_533 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_545 - SURFACE
      ?auto_546 - SURFACE
    )
    :vars
    (
      ?auto_547 - HOIST
      ?auto_548 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_547 ?auto_548 ) ( SURFACE-AT ?auto_545 ?auto_548 ) ( CLEAR ?auto_545 ) ( LIFTING ?auto_547 ?auto_546 ) ( IS-CRATE ?auto_546 ) ( not ( = ?auto_545 ?auto_546 ) ) )
    :subtasks
    ( ( !DROP ?auto_547 ?auto_546 ?auto_545 ?auto_548 )
      ( MAKE-1CRATE-VERIFY ?auto_545 ?auto_546 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_549 - SURFACE
      ?auto_550 - SURFACE
      ?auto_551 - SURFACE
    )
    :vars
    (
      ?auto_553 - HOIST
      ?auto_552 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_553 ?auto_552 ) ( SURFACE-AT ?auto_550 ?auto_552 ) ( CLEAR ?auto_550 ) ( LIFTING ?auto_553 ?auto_551 ) ( IS-CRATE ?auto_551 ) ( not ( = ?auto_550 ?auto_551 ) ) ( ON ?auto_550 ?auto_549 ) ( not ( = ?auto_549 ?auto_550 ) ) ( not ( = ?auto_549 ?auto_551 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_550 ?auto_551 )
      ( MAKE-2CRATE-VERIFY ?auto_549 ?auto_550 ?auto_551 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_554 - SURFACE
      ?auto_555 - SURFACE
    )
    :vars
    (
      ?auto_557 - HOIST
      ?auto_556 - PLACE
      ?auto_558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_557 ?auto_556 ) ( SURFACE-AT ?auto_554 ?auto_556 ) ( CLEAR ?auto_554 ) ( IS-CRATE ?auto_555 ) ( not ( = ?auto_554 ?auto_555 ) ) ( TRUCK-AT ?auto_558 ?auto_556 ) ( AVAILABLE ?auto_557 ) ( IN ?auto_555 ?auto_558 ) )
    :subtasks
    ( ( !UNLOAD ?auto_557 ?auto_555 ?auto_558 ?auto_556 )
      ( MAKE-1CRATE ?auto_554 ?auto_555 )
      ( MAKE-1CRATE-VERIFY ?auto_554 ?auto_555 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_559 - SURFACE
      ?auto_560 - SURFACE
      ?auto_561 - SURFACE
    )
    :vars
    (
      ?auto_562 - HOIST
      ?auto_563 - PLACE
      ?auto_564 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_562 ?auto_563 ) ( SURFACE-AT ?auto_560 ?auto_563 ) ( CLEAR ?auto_560 ) ( IS-CRATE ?auto_561 ) ( not ( = ?auto_560 ?auto_561 ) ) ( TRUCK-AT ?auto_564 ?auto_563 ) ( AVAILABLE ?auto_562 ) ( IN ?auto_561 ?auto_564 ) ( ON ?auto_560 ?auto_559 ) ( not ( = ?auto_559 ?auto_560 ) ) ( not ( = ?auto_559 ?auto_561 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_560 ?auto_561 )
      ( MAKE-2CRATE-VERIFY ?auto_559 ?auto_560 ?auto_561 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_565 - SURFACE
      ?auto_566 - SURFACE
    )
    :vars
    (
      ?auto_570 - HOIST
      ?auto_569 - PLACE
      ?auto_568 - TRUCK
      ?auto_567 - SURFACE
      ?auto_571 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_570 ?auto_569 ) ( SURFACE-AT ?auto_565 ?auto_569 ) ( CLEAR ?auto_565 ) ( IS-CRATE ?auto_566 ) ( not ( = ?auto_565 ?auto_566 ) ) ( AVAILABLE ?auto_570 ) ( IN ?auto_566 ?auto_568 ) ( ON ?auto_565 ?auto_567 ) ( not ( = ?auto_567 ?auto_565 ) ) ( not ( = ?auto_567 ?auto_566 ) ) ( TRUCK-AT ?auto_568 ?auto_571 ) ( not ( = ?auto_571 ?auto_569 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_568 ?auto_571 ?auto_569 )
      ( MAKE-2CRATE ?auto_567 ?auto_565 ?auto_566 )
      ( MAKE-1CRATE-VERIFY ?auto_565 ?auto_566 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_572 - SURFACE
      ?auto_573 - SURFACE
      ?auto_574 - SURFACE
    )
    :vars
    (
      ?auto_575 - HOIST
      ?auto_576 - PLACE
      ?auto_577 - TRUCK
      ?auto_578 - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_575 ?auto_576 ) ( SURFACE-AT ?auto_573 ?auto_576 ) ( CLEAR ?auto_573 ) ( IS-CRATE ?auto_574 ) ( not ( = ?auto_573 ?auto_574 ) ) ( AVAILABLE ?auto_575 ) ( IN ?auto_574 ?auto_577 ) ( ON ?auto_573 ?auto_572 ) ( not ( = ?auto_572 ?auto_573 ) ) ( not ( = ?auto_572 ?auto_574 ) ) ( TRUCK-AT ?auto_577 ?auto_578 ) ( not ( = ?auto_578 ?auto_576 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_573 ?auto_574 )
      ( MAKE-2CRATE-VERIFY ?auto_572 ?auto_573 ?auto_574 ) )
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
      ?auto_583 - SURFACE
      ?auto_582 - TRUCK
      ?auto_585 - PLACE
      ?auto_586 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_584 ?auto_581 ) ( SURFACE-AT ?auto_579 ?auto_581 ) ( CLEAR ?auto_579 ) ( IS-CRATE ?auto_580 ) ( not ( = ?auto_579 ?auto_580 ) ) ( AVAILABLE ?auto_584 ) ( ON ?auto_579 ?auto_583 ) ( not ( = ?auto_583 ?auto_579 ) ) ( not ( = ?auto_583 ?auto_580 ) ) ( TRUCK-AT ?auto_582 ?auto_585 ) ( not ( = ?auto_585 ?auto_581 ) ) ( HOIST-AT ?auto_586 ?auto_585 ) ( LIFTING ?auto_586 ?auto_580 ) ( not ( = ?auto_584 ?auto_586 ) ) )
    :subtasks
    ( ( !LOAD ?auto_586 ?auto_580 ?auto_582 ?auto_585 )
      ( MAKE-2CRATE ?auto_583 ?auto_579 ?auto_580 )
      ( MAKE-1CRATE-VERIFY ?auto_579 ?auto_580 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_587 - SURFACE
      ?auto_588 - SURFACE
      ?auto_589 - SURFACE
    )
    :vars
    (
      ?auto_592 - HOIST
      ?auto_593 - PLACE
      ?auto_590 - TRUCK
      ?auto_594 - PLACE
      ?auto_591 - HOIST
    )
    :precondition
    ( and ( HOIST-AT ?auto_592 ?auto_593 ) ( SURFACE-AT ?auto_588 ?auto_593 ) ( CLEAR ?auto_588 ) ( IS-CRATE ?auto_589 ) ( not ( = ?auto_588 ?auto_589 ) ) ( AVAILABLE ?auto_592 ) ( ON ?auto_588 ?auto_587 ) ( not ( = ?auto_587 ?auto_588 ) ) ( not ( = ?auto_587 ?auto_589 ) ) ( TRUCK-AT ?auto_590 ?auto_594 ) ( not ( = ?auto_594 ?auto_593 ) ) ( HOIST-AT ?auto_591 ?auto_594 ) ( LIFTING ?auto_591 ?auto_589 ) ( not ( = ?auto_592 ?auto_591 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_588 ?auto_589 )
      ( MAKE-2CRATE-VERIFY ?auto_587 ?auto_588 ?auto_589 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_595 - SURFACE
      ?auto_596 - SURFACE
    )
    :vars
    (
      ?auto_599 - HOIST
      ?auto_602 - PLACE
      ?auto_600 - SURFACE
      ?auto_598 - TRUCK
      ?auto_597 - PLACE
      ?auto_601 - HOIST
      ?auto_603 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_599 ?auto_602 ) ( SURFACE-AT ?auto_595 ?auto_602 ) ( CLEAR ?auto_595 ) ( IS-CRATE ?auto_596 ) ( not ( = ?auto_595 ?auto_596 ) ) ( AVAILABLE ?auto_599 ) ( ON ?auto_595 ?auto_600 ) ( not ( = ?auto_600 ?auto_595 ) ) ( not ( = ?auto_600 ?auto_596 ) ) ( TRUCK-AT ?auto_598 ?auto_597 ) ( not ( = ?auto_597 ?auto_602 ) ) ( HOIST-AT ?auto_601 ?auto_597 ) ( not ( = ?auto_599 ?auto_601 ) ) ( AVAILABLE ?auto_601 ) ( SURFACE-AT ?auto_596 ?auto_597 ) ( ON ?auto_596 ?auto_603 ) ( CLEAR ?auto_596 ) ( not ( = ?auto_595 ?auto_603 ) ) ( not ( = ?auto_596 ?auto_603 ) ) ( not ( = ?auto_600 ?auto_603 ) ) )
    :subtasks
    ( ( !LIFT ?auto_601 ?auto_596 ?auto_603 ?auto_597 )
      ( MAKE-2CRATE ?auto_600 ?auto_595 ?auto_596 )
      ( MAKE-1CRATE-VERIFY ?auto_595 ?auto_596 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_604 - SURFACE
      ?auto_605 - SURFACE
      ?auto_606 - SURFACE
    )
    :vars
    (
      ?auto_611 - HOIST
      ?auto_612 - PLACE
      ?auto_607 - TRUCK
      ?auto_608 - PLACE
      ?auto_610 - HOIST
      ?auto_609 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_611 ?auto_612 ) ( SURFACE-AT ?auto_605 ?auto_612 ) ( CLEAR ?auto_605 ) ( IS-CRATE ?auto_606 ) ( not ( = ?auto_605 ?auto_606 ) ) ( AVAILABLE ?auto_611 ) ( ON ?auto_605 ?auto_604 ) ( not ( = ?auto_604 ?auto_605 ) ) ( not ( = ?auto_604 ?auto_606 ) ) ( TRUCK-AT ?auto_607 ?auto_608 ) ( not ( = ?auto_608 ?auto_612 ) ) ( HOIST-AT ?auto_610 ?auto_608 ) ( not ( = ?auto_611 ?auto_610 ) ) ( AVAILABLE ?auto_610 ) ( SURFACE-AT ?auto_606 ?auto_608 ) ( ON ?auto_606 ?auto_609 ) ( CLEAR ?auto_606 ) ( not ( = ?auto_605 ?auto_609 ) ) ( not ( = ?auto_606 ?auto_609 ) ) ( not ( = ?auto_604 ?auto_609 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_605 ?auto_606 )
      ( MAKE-2CRATE-VERIFY ?auto_604 ?auto_605 ?auto_606 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_613 - SURFACE
      ?auto_614 - SURFACE
    )
    :vars
    (
      ?auto_617 - HOIST
      ?auto_615 - PLACE
      ?auto_619 - SURFACE
      ?auto_616 - PLACE
      ?auto_621 - HOIST
      ?auto_620 - SURFACE
      ?auto_618 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_617 ?auto_615 ) ( SURFACE-AT ?auto_613 ?auto_615 ) ( CLEAR ?auto_613 ) ( IS-CRATE ?auto_614 ) ( not ( = ?auto_613 ?auto_614 ) ) ( AVAILABLE ?auto_617 ) ( ON ?auto_613 ?auto_619 ) ( not ( = ?auto_619 ?auto_613 ) ) ( not ( = ?auto_619 ?auto_614 ) ) ( not ( = ?auto_616 ?auto_615 ) ) ( HOIST-AT ?auto_621 ?auto_616 ) ( not ( = ?auto_617 ?auto_621 ) ) ( AVAILABLE ?auto_621 ) ( SURFACE-AT ?auto_614 ?auto_616 ) ( ON ?auto_614 ?auto_620 ) ( CLEAR ?auto_614 ) ( not ( = ?auto_613 ?auto_620 ) ) ( not ( = ?auto_614 ?auto_620 ) ) ( not ( = ?auto_619 ?auto_620 ) ) ( TRUCK-AT ?auto_618 ?auto_615 ) )
    :subtasks
    ( ( !DRIVE ?auto_618 ?auto_615 ?auto_616 )
      ( MAKE-2CRATE ?auto_619 ?auto_613 ?auto_614 )
      ( MAKE-1CRATE-VERIFY ?auto_613 ?auto_614 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_622 - SURFACE
      ?auto_623 - SURFACE
      ?auto_624 - SURFACE
    )
    :vars
    (
      ?auto_628 - HOIST
      ?auto_627 - PLACE
      ?auto_625 - PLACE
      ?auto_626 - HOIST
      ?auto_630 - SURFACE
      ?auto_629 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_628 ?auto_627 ) ( SURFACE-AT ?auto_623 ?auto_627 ) ( CLEAR ?auto_623 ) ( IS-CRATE ?auto_624 ) ( not ( = ?auto_623 ?auto_624 ) ) ( AVAILABLE ?auto_628 ) ( ON ?auto_623 ?auto_622 ) ( not ( = ?auto_622 ?auto_623 ) ) ( not ( = ?auto_622 ?auto_624 ) ) ( not ( = ?auto_625 ?auto_627 ) ) ( HOIST-AT ?auto_626 ?auto_625 ) ( not ( = ?auto_628 ?auto_626 ) ) ( AVAILABLE ?auto_626 ) ( SURFACE-AT ?auto_624 ?auto_625 ) ( ON ?auto_624 ?auto_630 ) ( CLEAR ?auto_624 ) ( not ( = ?auto_623 ?auto_630 ) ) ( not ( = ?auto_624 ?auto_630 ) ) ( not ( = ?auto_622 ?auto_630 ) ) ( TRUCK-AT ?auto_629 ?auto_627 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_623 ?auto_624 )
      ( MAKE-2CRATE-VERIFY ?auto_622 ?auto_623 ?auto_624 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_631 - SURFACE
      ?auto_632 - SURFACE
    )
    :vars
    (
      ?auto_636 - HOIST
      ?auto_639 - PLACE
      ?auto_634 - SURFACE
      ?auto_635 - PLACE
      ?auto_638 - HOIST
      ?auto_633 - SURFACE
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_636 ?auto_639 ) ( IS-CRATE ?auto_632 ) ( not ( = ?auto_631 ?auto_632 ) ) ( not ( = ?auto_634 ?auto_631 ) ) ( not ( = ?auto_634 ?auto_632 ) ) ( not ( = ?auto_635 ?auto_639 ) ) ( HOIST-AT ?auto_638 ?auto_635 ) ( not ( = ?auto_636 ?auto_638 ) ) ( AVAILABLE ?auto_638 ) ( SURFACE-AT ?auto_632 ?auto_635 ) ( ON ?auto_632 ?auto_633 ) ( CLEAR ?auto_632 ) ( not ( = ?auto_631 ?auto_633 ) ) ( not ( = ?auto_632 ?auto_633 ) ) ( not ( = ?auto_634 ?auto_633 ) ) ( TRUCK-AT ?auto_637 ?auto_639 ) ( SURFACE-AT ?auto_634 ?auto_639 ) ( CLEAR ?auto_634 ) ( LIFTING ?auto_636 ?auto_631 ) ( IS-CRATE ?auto_631 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_634 ?auto_631 )
      ( MAKE-2CRATE ?auto_634 ?auto_631 ?auto_632 )
      ( MAKE-1CRATE-VERIFY ?auto_631 ?auto_632 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_640 - SURFACE
      ?auto_641 - SURFACE
      ?auto_642 - SURFACE
    )
    :vars
    (
      ?auto_646 - HOIST
      ?auto_643 - PLACE
      ?auto_647 - PLACE
      ?auto_645 - HOIST
      ?auto_644 - SURFACE
      ?auto_648 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_646 ?auto_643 ) ( IS-CRATE ?auto_642 ) ( not ( = ?auto_641 ?auto_642 ) ) ( not ( = ?auto_640 ?auto_641 ) ) ( not ( = ?auto_640 ?auto_642 ) ) ( not ( = ?auto_647 ?auto_643 ) ) ( HOIST-AT ?auto_645 ?auto_647 ) ( not ( = ?auto_646 ?auto_645 ) ) ( AVAILABLE ?auto_645 ) ( SURFACE-AT ?auto_642 ?auto_647 ) ( ON ?auto_642 ?auto_644 ) ( CLEAR ?auto_642 ) ( not ( = ?auto_641 ?auto_644 ) ) ( not ( = ?auto_642 ?auto_644 ) ) ( not ( = ?auto_640 ?auto_644 ) ) ( TRUCK-AT ?auto_648 ?auto_643 ) ( SURFACE-AT ?auto_640 ?auto_643 ) ( CLEAR ?auto_640 ) ( LIFTING ?auto_646 ?auto_641 ) ( IS-CRATE ?auto_641 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_641 ?auto_642 )
      ( MAKE-2CRATE-VERIFY ?auto_640 ?auto_641 ?auto_642 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_649 - SURFACE
      ?auto_650 - SURFACE
    )
    :vars
    (
      ?auto_655 - HOIST
      ?auto_656 - PLACE
      ?auto_651 - SURFACE
      ?auto_653 - PLACE
      ?auto_652 - HOIST
      ?auto_654 - SURFACE
      ?auto_657 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_655 ?auto_656 ) ( IS-CRATE ?auto_650 ) ( not ( = ?auto_649 ?auto_650 ) ) ( not ( = ?auto_651 ?auto_649 ) ) ( not ( = ?auto_651 ?auto_650 ) ) ( not ( = ?auto_653 ?auto_656 ) ) ( HOIST-AT ?auto_652 ?auto_653 ) ( not ( = ?auto_655 ?auto_652 ) ) ( AVAILABLE ?auto_652 ) ( SURFACE-AT ?auto_650 ?auto_653 ) ( ON ?auto_650 ?auto_654 ) ( CLEAR ?auto_650 ) ( not ( = ?auto_649 ?auto_654 ) ) ( not ( = ?auto_650 ?auto_654 ) ) ( not ( = ?auto_651 ?auto_654 ) ) ( TRUCK-AT ?auto_657 ?auto_656 ) ( SURFACE-AT ?auto_651 ?auto_656 ) ( CLEAR ?auto_651 ) ( IS-CRATE ?auto_649 ) ( AVAILABLE ?auto_655 ) ( IN ?auto_649 ?auto_657 ) )
    :subtasks
    ( ( !UNLOAD ?auto_655 ?auto_649 ?auto_657 ?auto_656 )
      ( MAKE-2CRATE ?auto_651 ?auto_649 ?auto_650 )
      ( MAKE-1CRATE-VERIFY ?auto_649 ?auto_650 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_658 - SURFACE
      ?auto_659 - SURFACE
      ?auto_660 - SURFACE
    )
    :vars
    (
      ?auto_664 - HOIST
      ?auto_663 - PLACE
      ?auto_666 - PLACE
      ?auto_662 - HOIST
      ?auto_661 - SURFACE
      ?auto_665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_664 ?auto_663 ) ( IS-CRATE ?auto_660 ) ( not ( = ?auto_659 ?auto_660 ) ) ( not ( = ?auto_658 ?auto_659 ) ) ( not ( = ?auto_658 ?auto_660 ) ) ( not ( = ?auto_666 ?auto_663 ) ) ( HOIST-AT ?auto_662 ?auto_666 ) ( not ( = ?auto_664 ?auto_662 ) ) ( AVAILABLE ?auto_662 ) ( SURFACE-AT ?auto_660 ?auto_666 ) ( ON ?auto_660 ?auto_661 ) ( CLEAR ?auto_660 ) ( not ( = ?auto_659 ?auto_661 ) ) ( not ( = ?auto_660 ?auto_661 ) ) ( not ( = ?auto_658 ?auto_661 ) ) ( TRUCK-AT ?auto_665 ?auto_663 ) ( SURFACE-AT ?auto_658 ?auto_663 ) ( CLEAR ?auto_658 ) ( IS-CRATE ?auto_659 ) ( AVAILABLE ?auto_664 ) ( IN ?auto_659 ?auto_665 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_659 ?auto_660 )
      ( MAKE-2CRATE-VERIFY ?auto_658 ?auto_659 ?auto_660 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_667 - SURFACE
      ?auto_668 - SURFACE
    )
    :vars
    (
      ?auto_669 - HOIST
      ?auto_674 - PLACE
      ?auto_670 - SURFACE
      ?auto_673 - PLACE
      ?auto_671 - HOIST
      ?auto_675 - SURFACE
      ?auto_672 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_669 ?auto_674 ) ( IS-CRATE ?auto_668 ) ( not ( = ?auto_667 ?auto_668 ) ) ( not ( = ?auto_670 ?auto_667 ) ) ( not ( = ?auto_670 ?auto_668 ) ) ( not ( = ?auto_673 ?auto_674 ) ) ( HOIST-AT ?auto_671 ?auto_673 ) ( not ( = ?auto_669 ?auto_671 ) ) ( AVAILABLE ?auto_671 ) ( SURFACE-AT ?auto_668 ?auto_673 ) ( ON ?auto_668 ?auto_675 ) ( CLEAR ?auto_668 ) ( not ( = ?auto_667 ?auto_675 ) ) ( not ( = ?auto_668 ?auto_675 ) ) ( not ( = ?auto_670 ?auto_675 ) ) ( SURFACE-AT ?auto_670 ?auto_674 ) ( CLEAR ?auto_670 ) ( IS-CRATE ?auto_667 ) ( AVAILABLE ?auto_669 ) ( IN ?auto_667 ?auto_672 ) ( TRUCK-AT ?auto_672 ?auto_673 ) )
    :subtasks
    ( ( !DRIVE ?auto_672 ?auto_673 ?auto_674 )
      ( MAKE-2CRATE ?auto_670 ?auto_667 ?auto_668 )
      ( MAKE-1CRATE-VERIFY ?auto_667 ?auto_668 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_676 - SURFACE
      ?auto_677 - SURFACE
      ?auto_678 - SURFACE
    )
    :vars
    (
      ?auto_679 - HOIST
      ?auto_683 - PLACE
      ?auto_682 - PLACE
      ?auto_684 - HOIST
      ?auto_680 - SURFACE
      ?auto_681 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_679 ?auto_683 ) ( IS-CRATE ?auto_678 ) ( not ( = ?auto_677 ?auto_678 ) ) ( not ( = ?auto_676 ?auto_677 ) ) ( not ( = ?auto_676 ?auto_678 ) ) ( not ( = ?auto_682 ?auto_683 ) ) ( HOIST-AT ?auto_684 ?auto_682 ) ( not ( = ?auto_679 ?auto_684 ) ) ( AVAILABLE ?auto_684 ) ( SURFACE-AT ?auto_678 ?auto_682 ) ( ON ?auto_678 ?auto_680 ) ( CLEAR ?auto_678 ) ( not ( = ?auto_677 ?auto_680 ) ) ( not ( = ?auto_678 ?auto_680 ) ) ( not ( = ?auto_676 ?auto_680 ) ) ( SURFACE-AT ?auto_676 ?auto_683 ) ( CLEAR ?auto_676 ) ( IS-CRATE ?auto_677 ) ( AVAILABLE ?auto_679 ) ( IN ?auto_677 ?auto_681 ) ( TRUCK-AT ?auto_681 ?auto_682 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_677 ?auto_678 )
      ( MAKE-2CRATE-VERIFY ?auto_676 ?auto_677 ?auto_678 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_685 - SURFACE
      ?auto_686 - SURFACE
    )
    :vars
    (
      ?auto_689 - HOIST
      ?auto_687 - PLACE
      ?auto_688 - SURFACE
      ?auto_693 - PLACE
      ?auto_690 - HOIST
      ?auto_691 - SURFACE
      ?auto_692 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_689 ?auto_687 ) ( IS-CRATE ?auto_686 ) ( not ( = ?auto_685 ?auto_686 ) ) ( not ( = ?auto_688 ?auto_685 ) ) ( not ( = ?auto_688 ?auto_686 ) ) ( not ( = ?auto_693 ?auto_687 ) ) ( HOIST-AT ?auto_690 ?auto_693 ) ( not ( = ?auto_689 ?auto_690 ) ) ( SURFACE-AT ?auto_686 ?auto_693 ) ( ON ?auto_686 ?auto_691 ) ( CLEAR ?auto_686 ) ( not ( = ?auto_685 ?auto_691 ) ) ( not ( = ?auto_686 ?auto_691 ) ) ( not ( = ?auto_688 ?auto_691 ) ) ( SURFACE-AT ?auto_688 ?auto_687 ) ( CLEAR ?auto_688 ) ( IS-CRATE ?auto_685 ) ( AVAILABLE ?auto_689 ) ( TRUCK-AT ?auto_692 ?auto_693 ) ( LIFTING ?auto_690 ?auto_685 ) )
    :subtasks
    ( ( !LOAD ?auto_690 ?auto_685 ?auto_692 ?auto_693 )
      ( MAKE-2CRATE ?auto_688 ?auto_685 ?auto_686 )
      ( MAKE-1CRATE-VERIFY ?auto_685 ?auto_686 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_694 - SURFACE
      ?auto_695 - SURFACE
      ?auto_696 - SURFACE
    )
    :vars
    (
      ?auto_699 - HOIST
      ?auto_701 - PLACE
      ?auto_697 - PLACE
      ?auto_700 - HOIST
      ?auto_702 - SURFACE
      ?auto_698 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_699 ?auto_701 ) ( IS-CRATE ?auto_696 ) ( not ( = ?auto_695 ?auto_696 ) ) ( not ( = ?auto_694 ?auto_695 ) ) ( not ( = ?auto_694 ?auto_696 ) ) ( not ( = ?auto_697 ?auto_701 ) ) ( HOIST-AT ?auto_700 ?auto_697 ) ( not ( = ?auto_699 ?auto_700 ) ) ( SURFACE-AT ?auto_696 ?auto_697 ) ( ON ?auto_696 ?auto_702 ) ( CLEAR ?auto_696 ) ( not ( = ?auto_695 ?auto_702 ) ) ( not ( = ?auto_696 ?auto_702 ) ) ( not ( = ?auto_694 ?auto_702 ) ) ( SURFACE-AT ?auto_694 ?auto_701 ) ( CLEAR ?auto_694 ) ( IS-CRATE ?auto_695 ) ( AVAILABLE ?auto_699 ) ( TRUCK-AT ?auto_698 ?auto_697 ) ( LIFTING ?auto_700 ?auto_695 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_695 ?auto_696 )
      ( MAKE-2CRATE-VERIFY ?auto_694 ?auto_695 ?auto_696 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_703 - SURFACE
      ?auto_704 - SURFACE
    )
    :vars
    (
      ?auto_705 - HOIST
      ?auto_710 - PLACE
      ?auto_711 - SURFACE
      ?auto_706 - PLACE
      ?auto_708 - HOIST
      ?auto_709 - SURFACE
      ?auto_707 - TRUCK
      ?auto_712 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_705 ?auto_710 ) ( IS-CRATE ?auto_704 ) ( not ( = ?auto_703 ?auto_704 ) ) ( not ( = ?auto_711 ?auto_703 ) ) ( not ( = ?auto_711 ?auto_704 ) ) ( not ( = ?auto_706 ?auto_710 ) ) ( HOIST-AT ?auto_708 ?auto_706 ) ( not ( = ?auto_705 ?auto_708 ) ) ( SURFACE-AT ?auto_704 ?auto_706 ) ( ON ?auto_704 ?auto_709 ) ( CLEAR ?auto_704 ) ( not ( = ?auto_703 ?auto_709 ) ) ( not ( = ?auto_704 ?auto_709 ) ) ( not ( = ?auto_711 ?auto_709 ) ) ( SURFACE-AT ?auto_711 ?auto_710 ) ( CLEAR ?auto_711 ) ( IS-CRATE ?auto_703 ) ( AVAILABLE ?auto_705 ) ( TRUCK-AT ?auto_707 ?auto_706 ) ( AVAILABLE ?auto_708 ) ( SURFACE-AT ?auto_703 ?auto_706 ) ( ON ?auto_703 ?auto_712 ) ( CLEAR ?auto_703 ) ( not ( = ?auto_703 ?auto_712 ) ) ( not ( = ?auto_704 ?auto_712 ) ) ( not ( = ?auto_711 ?auto_712 ) ) ( not ( = ?auto_709 ?auto_712 ) ) )
    :subtasks
    ( ( !LIFT ?auto_708 ?auto_703 ?auto_712 ?auto_706 )
      ( MAKE-2CRATE ?auto_711 ?auto_703 ?auto_704 )
      ( MAKE-1CRATE-VERIFY ?auto_703 ?auto_704 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_713 - SURFACE
      ?auto_714 - SURFACE
      ?auto_715 - SURFACE
    )
    :vars
    (
      ?auto_720 - HOIST
      ?auto_717 - PLACE
      ?auto_719 - PLACE
      ?auto_721 - HOIST
      ?auto_716 - SURFACE
      ?auto_718 - TRUCK
      ?auto_722 - SURFACE
    )
    :precondition
    ( and ( HOIST-AT ?auto_720 ?auto_717 ) ( IS-CRATE ?auto_715 ) ( not ( = ?auto_714 ?auto_715 ) ) ( not ( = ?auto_713 ?auto_714 ) ) ( not ( = ?auto_713 ?auto_715 ) ) ( not ( = ?auto_719 ?auto_717 ) ) ( HOIST-AT ?auto_721 ?auto_719 ) ( not ( = ?auto_720 ?auto_721 ) ) ( SURFACE-AT ?auto_715 ?auto_719 ) ( ON ?auto_715 ?auto_716 ) ( CLEAR ?auto_715 ) ( not ( = ?auto_714 ?auto_716 ) ) ( not ( = ?auto_715 ?auto_716 ) ) ( not ( = ?auto_713 ?auto_716 ) ) ( SURFACE-AT ?auto_713 ?auto_717 ) ( CLEAR ?auto_713 ) ( IS-CRATE ?auto_714 ) ( AVAILABLE ?auto_720 ) ( TRUCK-AT ?auto_718 ?auto_719 ) ( AVAILABLE ?auto_721 ) ( SURFACE-AT ?auto_714 ?auto_719 ) ( ON ?auto_714 ?auto_722 ) ( CLEAR ?auto_714 ) ( not ( = ?auto_714 ?auto_722 ) ) ( not ( = ?auto_715 ?auto_722 ) ) ( not ( = ?auto_713 ?auto_722 ) ) ( not ( = ?auto_716 ?auto_722 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_714 ?auto_715 )
      ( MAKE-2CRATE-VERIFY ?auto_713 ?auto_714 ?auto_715 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_723 - SURFACE
      ?auto_724 - SURFACE
    )
    :vars
    (
      ?auto_729 - HOIST
      ?auto_731 - PLACE
      ?auto_730 - SURFACE
      ?auto_726 - PLACE
      ?auto_728 - HOIST
      ?auto_725 - SURFACE
      ?auto_727 - SURFACE
      ?auto_732 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_729 ?auto_731 ) ( IS-CRATE ?auto_724 ) ( not ( = ?auto_723 ?auto_724 ) ) ( not ( = ?auto_730 ?auto_723 ) ) ( not ( = ?auto_730 ?auto_724 ) ) ( not ( = ?auto_726 ?auto_731 ) ) ( HOIST-AT ?auto_728 ?auto_726 ) ( not ( = ?auto_729 ?auto_728 ) ) ( SURFACE-AT ?auto_724 ?auto_726 ) ( ON ?auto_724 ?auto_725 ) ( CLEAR ?auto_724 ) ( not ( = ?auto_723 ?auto_725 ) ) ( not ( = ?auto_724 ?auto_725 ) ) ( not ( = ?auto_730 ?auto_725 ) ) ( SURFACE-AT ?auto_730 ?auto_731 ) ( CLEAR ?auto_730 ) ( IS-CRATE ?auto_723 ) ( AVAILABLE ?auto_729 ) ( AVAILABLE ?auto_728 ) ( SURFACE-AT ?auto_723 ?auto_726 ) ( ON ?auto_723 ?auto_727 ) ( CLEAR ?auto_723 ) ( not ( = ?auto_723 ?auto_727 ) ) ( not ( = ?auto_724 ?auto_727 ) ) ( not ( = ?auto_730 ?auto_727 ) ) ( not ( = ?auto_725 ?auto_727 ) ) ( TRUCK-AT ?auto_732 ?auto_731 ) )
    :subtasks
    ( ( !DRIVE ?auto_732 ?auto_731 ?auto_726 )
      ( MAKE-2CRATE ?auto_730 ?auto_723 ?auto_724 )
      ( MAKE-1CRATE-VERIFY ?auto_723 ?auto_724 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_733 - SURFACE
      ?auto_734 - SURFACE
      ?auto_735 - SURFACE
    )
    :vars
    (
      ?auto_736 - HOIST
      ?auto_741 - PLACE
      ?auto_738 - PLACE
      ?auto_739 - HOIST
      ?auto_742 - SURFACE
      ?auto_737 - SURFACE
      ?auto_740 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_736 ?auto_741 ) ( IS-CRATE ?auto_735 ) ( not ( = ?auto_734 ?auto_735 ) ) ( not ( = ?auto_733 ?auto_734 ) ) ( not ( = ?auto_733 ?auto_735 ) ) ( not ( = ?auto_738 ?auto_741 ) ) ( HOIST-AT ?auto_739 ?auto_738 ) ( not ( = ?auto_736 ?auto_739 ) ) ( SURFACE-AT ?auto_735 ?auto_738 ) ( ON ?auto_735 ?auto_742 ) ( CLEAR ?auto_735 ) ( not ( = ?auto_734 ?auto_742 ) ) ( not ( = ?auto_735 ?auto_742 ) ) ( not ( = ?auto_733 ?auto_742 ) ) ( SURFACE-AT ?auto_733 ?auto_741 ) ( CLEAR ?auto_733 ) ( IS-CRATE ?auto_734 ) ( AVAILABLE ?auto_736 ) ( AVAILABLE ?auto_739 ) ( SURFACE-AT ?auto_734 ?auto_738 ) ( ON ?auto_734 ?auto_737 ) ( CLEAR ?auto_734 ) ( not ( = ?auto_734 ?auto_737 ) ) ( not ( = ?auto_735 ?auto_737 ) ) ( not ( = ?auto_733 ?auto_737 ) ) ( not ( = ?auto_742 ?auto_737 ) ) ( TRUCK-AT ?auto_740 ?auto_741 ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_734 ?auto_735 )
      ( MAKE-2CRATE-VERIFY ?auto_733 ?auto_734 ?auto_735 ) )
  )

)

