( define ( domain logistics )
  ( :requirements :strips :typing :equality :htn )
  ( :types airplane city location obj truck )
  ( :predicates
    ( OBJ-AT ?a - OBJ ?b - LOCATION )
    ( TRUCK-AT ?c - TRUCK ?d - LOCATION )
    ( AIRPLANE-AT ?e - AIRPLANE ?f - LOCATION )
    ( IN-TRUCK ?g - OBJ ?h - TRUCK )
    ( IN-AIRPLANE ?i - OBJ ?j - AIRPLANE )
    ( IN-CITY ?k - LOCATION ?l - CITY )
    ( AIRPORT ?o - LOCATION )
  )
  ( :action !LOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( OBJ-AT ?obj ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-TRUCK ?obj ?truck ) )
  )
  ( :action !LOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?loc ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( OBJ-AT ?obj ?loc ) ) ( IN-AIRPLANE ?obj ?airplane ) )
  )
  ( :action !UNLOAD-TRUCK
    :parameters
    (
      ?obj - OBJ
      ?truck - TRUCK
      ?loc - LOCATION
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc ) ( IN-TRUCK ?obj ?truck ) )
    :effect
    ( and ( not ( IN-TRUCK ?obj ?truck ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !UNLOAD-AIRPLANE
    :parameters
    (
      ?obj - OBJ
      ?airplane - AIRPLANE
      ?loc - LOCATION
    )
    :precondition
    ( and ( IN-AIRPLANE ?obj ?airplane ) ( AIRPLANE-AT ?airplane ?loc ) )
    :effect
    ( and ( not ( IN-AIRPLANE ?obj ?airplane ) ) ( OBJ-AT ?obj ?loc ) )
  )
  ( :action !DRIVE-TRUCK
    :parameters
    (
      ?truck - TRUCK
      ?loc-from - LOCATION
      ?loc-to - LOCATION
      ?city - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?loc-from ) ( IN-CITY ?loc-from ?city ) ( IN-CITY ?loc-to ?city ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?loc-from ) ) ( TRUCK-AT ?truck ?loc-to ) )
  )
  ( :action !FLY-AIRPLANE
    :parameters
    (
      ?airplane - AIRPLANE
      ?loc-from - LOCATION
      ?loc-to - LOCATION
    )
    :precondition
    ( and ( AIRPORT ?loc-from ) ( AIRPORT ?loc-to ) ( AIRPLANE-AT ?airplane ?loc-from ) ( not ( = ?loc-from ?loc-to ) ) )
    :effect
    ( and ( not ( AIRPLANE-AT ?airplane ?loc-from ) ) ( AIRPLANE-AT ?airplane ?loc-to ) )
  )
  ( :method DELIVER-PKG
    :parameters
    (
      ?obj - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-2PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_489 - OBJ
      ?auto_488 - LOCATION
    )
    :vars
    (
      ?auto_490 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_490 ?auto_488 ) ( IN-TRUCK ?auto_489 ?auto_490 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_489 ?auto_490 ?auto_488 )
      ( DELIVER-1PKG-VERIFY ?auto_489 ?auto_488 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_496 - OBJ
      ?auto_495 - LOCATION
    )
    :vars
    (
      ?auto_497 - TRUCK
      ?auto_498 - LOCATION
      ?auto_499 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_496 ?auto_497 ) ( TRUCK-AT ?auto_497 ?auto_498 ) ( IN-CITY ?auto_498 ?auto_499 ) ( IN-CITY ?auto_495 ?auto_499 ) ( not ( = ?auto_495 ?auto_498 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_497 ?auto_498 ?auto_495 ?auto_499 )
      ( DELIVER-1PKG ?auto_496 ?auto_495 )
      ( DELIVER-1PKG-VERIFY ?auto_496 ?auto_495 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_507 - OBJ
      ?auto_506 - LOCATION
    )
    :vars
    (
      ?auto_509 - TRUCK
      ?auto_508 - LOCATION
      ?auto_510 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_509 ?auto_508 ) ( IN-CITY ?auto_508 ?auto_510 ) ( IN-CITY ?auto_506 ?auto_510 ) ( not ( = ?auto_506 ?auto_508 ) ) ( OBJ-AT ?auto_507 ?auto_508 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_507 ?auto_509 ?auto_508 )
      ( DELIVER-1PKG ?auto_507 ?auto_506 )
      ( DELIVER-1PKG-VERIFY ?auto_507 ?auto_506 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_518 - OBJ
      ?auto_517 - LOCATION
    )
    :vars
    (
      ?auto_521 - LOCATION
      ?auto_519 - CITY
      ?auto_520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_521 ?auto_519 ) ( IN-CITY ?auto_517 ?auto_519 ) ( not ( = ?auto_517 ?auto_521 ) ) ( OBJ-AT ?auto_518 ?auto_521 ) ( TRUCK-AT ?auto_520 ?auto_517 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_520 ?auto_517 ?auto_521 ?auto_519 )
      ( DELIVER-1PKG ?auto_518 ?auto_517 )
      ( DELIVER-1PKG-VERIFY ?auto_518 ?auto_517 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_543 - OBJ
      ?auto_544 - OBJ
      ?auto_542 - LOCATION
    )
    :vars
    (
      ?auto_545 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_545 ?auto_542 ) ( IN-TRUCK ?auto_544 ?auto_545 ) ( OBJ-AT ?auto_543 ?auto_542 ) ( not ( = ?auto_543 ?auto_544 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_544 ?auto_542 )
      ( DELIVER-2PKG-VERIFY ?auto_543 ?auto_544 ?auto_542 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_547 - OBJ
      ?auto_548 - OBJ
      ?auto_546 - LOCATION
    )
    :vars
    (
      ?auto_549 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_549 ?auto_546 ) ( IN-TRUCK ?auto_547 ?auto_549 ) ( OBJ-AT ?auto_548 ?auto_546 ) ( not ( = ?auto_547 ?auto_548 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_547 ?auto_546 )
      ( DELIVER-2PKG-VERIFY ?auto_547 ?auto_548 ?auto_546 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_560 - OBJ
      ?auto_561 - OBJ
      ?auto_559 - LOCATION
    )
    :vars
    (
      ?auto_564 - TRUCK
      ?auto_563 - LOCATION
      ?auto_562 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_561 ?auto_564 ) ( TRUCK-AT ?auto_564 ?auto_563 ) ( IN-CITY ?auto_563 ?auto_562 ) ( IN-CITY ?auto_559 ?auto_562 ) ( not ( = ?auto_559 ?auto_563 ) ) ( OBJ-AT ?auto_560 ?auto_559 ) ( not ( = ?auto_560 ?auto_561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_561 ?auto_559 )
      ( DELIVER-2PKG-VERIFY ?auto_560 ?auto_561 ?auto_559 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_566 - OBJ
      ?auto_567 - OBJ
      ?auto_565 - LOCATION
    )
    :vars
    (
      ?auto_569 - TRUCK
      ?auto_570 - LOCATION
      ?auto_568 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_566 ?auto_569 ) ( TRUCK-AT ?auto_569 ?auto_570 ) ( IN-CITY ?auto_570 ?auto_568 ) ( IN-CITY ?auto_565 ?auto_568 ) ( not ( = ?auto_565 ?auto_570 ) ) ( OBJ-AT ?auto_567 ?auto_565 ) ( not ( = ?auto_567 ?auto_566 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_567 ?auto_566 ?auto_565 )
      ( DELIVER-2PKG-VERIFY ?auto_566 ?auto_567 ?auto_565 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_579 - OBJ
      ?auto_578 - LOCATION
    )
    :vars
    (
      ?auto_581 - TRUCK
      ?auto_582 - LOCATION
      ?auto_580 - CITY
      ?auto_583 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_581 ?auto_582 ) ( IN-CITY ?auto_582 ?auto_580 ) ( IN-CITY ?auto_578 ?auto_580 ) ( not ( = ?auto_578 ?auto_582 ) ) ( OBJ-AT ?auto_583 ?auto_578 ) ( not ( = ?auto_583 ?auto_579 ) ) ( OBJ-AT ?auto_579 ?auto_582 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_579 ?auto_581 ?auto_582 )
      ( DELIVER-2PKG ?auto_583 ?auto_579 ?auto_578 )
      ( DELIVER-1PKG-VERIFY ?auto_579 ?auto_578 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_585 - OBJ
      ?auto_586 - OBJ
      ?auto_584 - LOCATION
    )
    :vars
    (
      ?auto_589 - TRUCK
      ?auto_587 - LOCATION
      ?auto_588 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_589 ?auto_587 ) ( IN-CITY ?auto_587 ?auto_588 ) ( IN-CITY ?auto_584 ?auto_588 ) ( not ( = ?auto_584 ?auto_587 ) ) ( OBJ-AT ?auto_585 ?auto_584 ) ( not ( = ?auto_585 ?auto_586 ) ) ( OBJ-AT ?auto_586 ?auto_587 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_586 ?auto_584 )
      ( DELIVER-2PKG-VERIFY ?auto_585 ?auto_586 ?auto_584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_591 - OBJ
      ?auto_592 - OBJ
      ?auto_590 - LOCATION
    )
    :vars
    (
      ?auto_595 - TRUCK
      ?auto_594 - LOCATION
      ?auto_593 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_595 ?auto_594 ) ( IN-CITY ?auto_594 ?auto_593 ) ( IN-CITY ?auto_590 ?auto_593 ) ( not ( = ?auto_590 ?auto_594 ) ) ( OBJ-AT ?auto_592 ?auto_590 ) ( not ( = ?auto_592 ?auto_591 ) ) ( OBJ-AT ?auto_591 ?auto_594 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_592 ?auto_591 ?auto_590 )
      ( DELIVER-2PKG-VERIFY ?auto_591 ?auto_592 ?auto_590 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_604 - OBJ
      ?auto_603 - LOCATION
    )
    :vars
    (
      ?auto_606 - LOCATION
      ?auto_605 - CITY
      ?auto_608 - OBJ
      ?auto_607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_606 ?auto_605 ) ( IN-CITY ?auto_603 ?auto_605 ) ( not ( = ?auto_603 ?auto_606 ) ) ( OBJ-AT ?auto_608 ?auto_603 ) ( not ( = ?auto_608 ?auto_604 ) ) ( OBJ-AT ?auto_604 ?auto_606 ) ( TRUCK-AT ?auto_607 ?auto_603 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_607 ?auto_603 ?auto_606 ?auto_605 )
      ( DELIVER-2PKG ?auto_608 ?auto_604 ?auto_603 )
      ( DELIVER-1PKG-VERIFY ?auto_604 ?auto_603 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_610 - OBJ
      ?auto_611 - OBJ
      ?auto_609 - LOCATION
    )
    :vars
    (
      ?auto_614 - LOCATION
      ?auto_613 - CITY
      ?auto_612 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_614 ?auto_613 ) ( IN-CITY ?auto_609 ?auto_613 ) ( not ( = ?auto_609 ?auto_614 ) ) ( OBJ-AT ?auto_610 ?auto_609 ) ( not ( = ?auto_610 ?auto_611 ) ) ( OBJ-AT ?auto_611 ?auto_614 ) ( TRUCK-AT ?auto_612 ?auto_609 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_611 ?auto_609 )
      ( DELIVER-2PKG-VERIFY ?auto_610 ?auto_611 ?auto_609 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_616 - OBJ
      ?auto_617 - OBJ
      ?auto_615 - LOCATION
    )
    :vars
    (
      ?auto_619 - LOCATION
      ?auto_618 - CITY
      ?auto_620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_619 ?auto_618 ) ( IN-CITY ?auto_615 ?auto_618 ) ( not ( = ?auto_615 ?auto_619 ) ) ( OBJ-AT ?auto_617 ?auto_615 ) ( not ( = ?auto_617 ?auto_616 ) ) ( OBJ-AT ?auto_616 ?auto_619 ) ( TRUCK-AT ?auto_620 ?auto_615 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_617 ?auto_616 ?auto_615 )
      ( DELIVER-2PKG-VERIFY ?auto_616 ?auto_617 ?auto_615 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_629 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_631 - LOCATION
      ?auto_630 - CITY
      ?auto_633 - OBJ
      ?auto_632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_631 ?auto_630 ) ( IN-CITY ?auto_628 ?auto_630 ) ( not ( = ?auto_628 ?auto_631 ) ) ( not ( = ?auto_633 ?auto_629 ) ) ( OBJ-AT ?auto_629 ?auto_631 ) ( TRUCK-AT ?auto_632 ?auto_628 ) ( IN-TRUCK ?auto_633 ?auto_632 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_633 ?auto_628 )
      ( DELIVER-2PKG ?auto_633 ?auto_629 ?auto_628 )
      ( DELIVER-1PKG-VERIFY ?auto_629 ?auto_628 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_635 - OBJ
      ?auto_636 - OBJ
      ?auto_634 - LOCATION
    )
    :vars
    (
      ?auto_637 - LOCATION
      ?auto_638 - CITY
      ?auto_639 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_637 ?auto_638 ) ( IN-CITY ?auto_634 ?auto_638 ) ( not ( = ?auto_634 ?auto_637 ) ) ( not ( = ?auto_635 ?auto_636 ) ) ( OBJ-AT ?auto_636 ?auto_637 ) ( TRUCK-AT ?auto_639 ?auto_634 ) ( IN-TRUCK ?auto_635 ?auto_639 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_636 ?auto_634 )
      ( DELIVER-2PKG-VERIFY ?auto_635 ?auto_636 ?auto_634 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_641 - OBJ
      ?auto_642 - OBJ
      ?auto_640 - LOCATION
    )
    :vars
    (
      ?auto_643 - LOCATION
      ?auto_645 - CITY
      ?auto_644 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_643 ?auto_645 ) ( IN-CITY ?auto_640 ?auto_645 ) ( not ( = ?auto_640 ?auto_643 ) ) ( not ( = ?auto_642 ?auto_641 ) ) ( OBJ-AT ?auto_641 ?auto_643 ) ( TRUCK-AT ?auto_644 ?auto_640 ) ( IN-TRUCK ?auto_642 ?auto_644 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_642 ?auto_641 ?auto_640 )
      ( DELIVER-2PKG-VERIFY ?auto_641 ?auto_642 ?auto_640 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_653 - LOCATION
    )
    :vars
    (
      ?auto_655 - LOCATION
      ?auto_657 - CITY
      ?auto_658 - OBJ
      ?auto_656 - TRUCK
      ?auto_659 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_655 ?auto_657 ) ( IN-CITY ?auto_653 ?auto_657 ) ( not ( = ?auto_653 ?auto_655 ) ) ( not ( = ?auto_658 ?auto_654 ) ) ( OBJ-AT ?auto_654 ?auto_655 ) ( IN-TRUCK ?auto_658 ?auto_656 ) ( TRUCK-AT ?auto_656 ?auto_659 ) ( IN-CITY ?auto_659 ?auto_657 ) ( not ( = ?auto_653 ?auto_659 ) ) ( not ( = ?auto_655 ?auto_659 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_656 ?auto_659 ?auto_653 ?auto_657 )
      ( DELIVER-2PKG ?auto_658 ?auto_654 ?auto_653 )
      ( DELIVER-1PKG-VERIFY ?auto_654 ?auto_653 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_661 - OBJ
      ?auto_662 - OBJ
      ?auto_660 - LOCATION
    )
    :vars
    (
      ?auto_665 - LOCATION
      ?auto_663 - CITY
      ?auto_664 - TRUCK
      ?auto_666 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_665 ?auto_663 ) ( IN-CITY ?auto_660 ?auto_663 ) ( not ( = ?auto_660 ?auto_665 ) ) ( not ( = ?auto_661 ?auto_662 ) ) ( OBJ-AT ?auto_662 ?auto_665 ) ( IN-TRUCK ?auto_661 ?auto_664 ) ( TRUCK-AT ?auto_664 ?auto_666 ) ( IN-CITY ?auto_666 ?auto_663 ) ( not ( = ?auto_660 ?auto_666 ) ) ( not ( = ?auto_665 ?auto_666 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_662 ?auto_660 )
      ( DELIVER-2PKG-VERIFY ?auto_661 ?auto_662 ?auto_660 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_668 - OBJ
      ?auto_669 - OBJ
      ?auto_667 - LOCATION
    )
    :vars
    (
      ?auto_671 - LOCATION
      ?auto_672 - CITY
      ?auto_670 - TRUCK
      ?auto_673 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_671 ?auto_672 ) ( IN-CITY ?auto_667 ?auto_672 ) ( not ( = ?auto_667 ?auto_671 ) ) ( not ( = ?auto_669 ?auto_668 ) ) ( OBJ-AT ?auto_668 ?auto_671 ) ( IN-TRUCK ?auto_669 ?auto_670 ) ( TRUCK-AT ?auto_670 ?auto_673 ) ( IN-CITY ?auto_673 ?auto_672 ) ( not ( = ?auto_667 ?auto_673 ) ) ( not ( = ?auto_671 ?auto_673 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_669 ?auto_668 ?auto_667 )
      ( DELIVER-2PKG-VERIFY ?auto_668 ?auto_669 ?auto_667 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_683 - OBJ
      ?auto_682 - LOCATION
    )
    :vars
    (
      ?auto_685 - LOCATION
      ?auto_686 - CITY
      ?auto_687 - OBJ
      ?auto_684 - TRUCK
      ?auto_688 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_685 ?auto_686 ) ( IN-CITY ?auto_682 ?auto_686 ) ( not ( = ?auto_682 ?auto_685 ) ) ( not ( = ?auto_687 ?auto_683 ) ) ( OBJ-AT ?auto_683 ?auto_685 ) ( TRUCK-AT ?auto_684 ?auto_688 ) ( IN-CITY ?auto_688 ?auto_686 ) ( not ( = ?auto_682 ?auto_688 ) ) ( not ( = ?auto_685 ?auto_688 ) ) ( OBJ-AT ?auto_687 ?auto_688 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_687 ?auto_684 ?auto_688 )
      ( DELIVER-2PKG ?auto_687 ?auto_683 ?auto_682 )
      ( DELIVER-1PKG-VERIFY ?auto_683 ?auto_682 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_690 - OBJ
      ?auto_691 - OBJ
      ?auto_689 - LOCATION
    )
    :vars
    (
      ?auto_692 - LOCATION
      ?auto_693 - CITY
      ?auto_694 - TRUCK
      ?auto_695 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_692 ?auto_693 ) ( IN-CITY ?auto_689 ?auto_693 ) ( not ( = ?auto_689 ?auto_692 ) ) ( not ( = ?auto_690 ?auto_691 ) ) ( OBJ-AT ?auto_691 ?auto_692 ) ( TRUCK-AT ?auto_694 ?auto_695 ) ( IN-CITY ?auto_695 ?auto_693 ) ( not ( = ?auto_689 ?auto_695 ) ) ( not ( = ?auto_692 ?auto_695 ) ) ( OBJ-AT ?auto_690 ?auto_695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_691 ?auto_689 )
      ( DELIVER-2PKG-VERIFY ?auto_690 ?auto_691 ?auto_689 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_697 - OBJ
      ?auto_698 - OBJ
      ?auto_696 - LOCATION
    )
    :vars
    (
      ?auto_702 - LOCATION
      ?auto_699 - CITY
      ?auto_700 - TRUCK
      ?auto_701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_702 ?auto_699 ) ( IN-CITY ?auto_696 ?auto_699 ) ( not ( = ?auto_696 ?auto_702 ) ) ( not ( = ?auto_698 ?auto_697 ) ) ( OBJ-AT ?auto_697 ?auto_702 ) ( TRUCK-AT ?auto_700 ?auto_701 ) ( IN-CITY ?auto_701 ?auto_699 ) ( not ( = ?auto_696 ?auto_701 ) ) ( not ( = ?auto_702 ?auto_701 ) ) ( OBJ-AT ?auto_698 ?auto_701 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_698 ?auto_697 ?auto_696 )
      ( DELIVER-2PKG-VERIFY ?auto_697 ?auto_698 ?auto_696 ) )
  )

)

