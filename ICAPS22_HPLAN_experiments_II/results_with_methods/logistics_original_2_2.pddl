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
      ?auto_520 - OBJ
      ?auto_519 - LOCATION
    )
    :vars
    (
      ?auto_521 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_521 ?auto_519 ) ( IN-TRUCK ?auto_520 ?auto_521 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_520 ?auto_521 ?auto_519 )
      ( DELIVER-1PKG-VERIFY ?auto_520 ?auto_519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_527 - OBJ
      ?auto_526 - LOCATION
    )
    :vars
    (
      ?auto_528 - TRUCK
      ?auto_529 - LOCATION
      ?auto_530 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_527 ?auto_528 ) ( TRUCK-AT ?auto_528 ?auto_529 ) ( IN-CITY ?auto_529 ?auto_530 ) ( IN-CITY ?auto_526 ?auto_530 ) ( not ( = ?auto_526 ?auto_529 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_528 ?auto_529 ?auto_526 ?auto_530 )
      ( DELIVER-1PKG ?auto_527 ?auto_526 )
      ( DELIVER-1PKG-VERIFY ?auto_527 ?auto_526 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_538 - OBJ
      ?auto_537 - LOCATION
    )
    :vars
    (
      ?auto_541 - TRUCK
      ?auto_540 - LOCATION
      ?auto_539 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_541 ?auto_540 ) ( IN-CITY ?auto_540 ?auto_539 ) ( IN-CITY ?auto_537 ?auto_539 ) ( not ( = ?auto_537 ?auto_540 ) ) ( OBJ-AT ?auto_538 ?auto_540 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_538 ?auto_541 ?auto_540 )
      ( DELIVER-1PKG ?auto_538 ?auto_537 )
      ( DELIVER-1PKG-VERIFY ?auto_538 ?auto_537 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_549 - OBJ
      ?auto_548 - LOCATION
    )
    :vars
    (
      ?auto_552 - LOCATION
      ?auto_550 - CITY
      ?auto_551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_552 ?auto_550 ) ( IN-CITY ?auto_548 ?auto_550 ) ( not ( = ?auto_548 ?auto_552 ) ) ( OBJ-AT ?auto_549 ?auto_552 ) ( TRUCK-AT ?auto_551 ?auto_548 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_551 ?auto_548 ?auto_552 ?auto_550 )
      ( DELIVER-1PKG ?auto_549 ?auto_548 )
      ( DELIVER-1PKG-VERIFY ?auto_549 ?auto_548 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_571 - OBJ
      ?auto_570 - LOCATION
    )
    :vars
    (
      ?auto_572 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_572 ?auto_570 ) ( IN-TRUCK ?auto_571 ?auto_572 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_571 ?auto_572 ?auto_570 )
      ( DELIVER-1PKG-VERIFY ?auto_571 ?auto_570 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_574 - OBJ
      ?auto_575 - OBJ
      ?auto_573 - LOCATION
    )
    :vars
    (
      ?auto_576 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_576 ?auto_573 ) ( IN-TRUCK ?auto_575 ?auto_576 ) ( OBJ-AT ?auto_574 ?auto_573 ) ( not ( = ?auto_574 ?auto_575 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_575 ?auto_573 )
      ( DELIVER-2PKG-VERIFY ?auto_574 ?auto_575 ?auto_573 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_578 - OBJ
      ?auto_579 - OBJ
      ?auto_577 - LOCATION
    )
    :vars
    (
      ?auto_580 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_580 ?auto_577 ) ( IN-TRUCK ?auto_578 ?auto_580 ) ( OBJ-AT ?auto_579 ?auto_577 ) ( not ( = ?auto_578 ?auto_579 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_578 ?auto_577 )
      ( DELIVER-2PKG-VERIFY ?auto_578 ?auto_579 ?auto_577 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_586 - OBJ
      ?auto_585 - LOCATION
    )
    :vars
    (
      ?auto_587 - TRUCK
      ?auto_588 - LOCATION
      ?auto_589 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_586 ?auto_587 ) ( TRUCK-AT ?auto_587 ?auto_588 ) ( IN-CITY ?auto_588 ?auto_589 ) ( IN-CITY ?auto_585 ?auto_589 ) ( not ( = ?auto_585 ?auto_588 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_587 ?auto_588 ?auto_585 ?auto_589 )
      ( DELIVER-1PKG ?auto_586 ?auto_585 )
      ( DELIVER-1PKG-VERIFY ?auto_586 ?auto_585 ) )
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
      ?auto_593 - TRUCK
      ?auto_594 - LOCATION
      ?auto_595 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_592 ?auto_593 ) ( TRUCK-AT ?auto_593 ?auto_594 ) ( IN-CITY ?auto_594 ?auto_595 ) ( IN-CITY ?auto_590 ?auto_595 ) ( not ( = ?auto_590 ?auto_594 ) ) ( OBJ-AT ?auto_591 ?auto_590 ) ( not ( = ?auto_591 ?auto_592 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_592 ?auto_590 )
      ( DELIVER-2PKG-VERIFY ?auto_591 ?auto_592 ?auto_590 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_597 - OBJ
      ?auto_598 - OBJ
      ?auto_596 - LOCATION
    )
    :vars
    (
      ?auto_599 - TRUCK
      ?auto_601 - LOCATION
      ?auto_600 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_597 ?auto_599 ) ( TRUCK-AT ?auto_599 ?auto_601 ) ( IN-CITY ?auto_601 ?auto_600 ) ( IN-CITY ?auto_596 ?auto_600 ) ( not ( = ?auto_596 ?auto_601 ) ) ( OBJ-AT ?auto_598 ?auto_596 ) ( not ( = ?auto_598 ?auto_597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_598 ?auto_597 ?auto_596 )
      ( DELIVER-2PKG-VERIFY ?auto_597 ?auto_598 ?auto_596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_610 - OBJ
      ?auto_609 - LOCATION
    )
    :vars
    (
      ?auto_611 - TRUCK
      ?auto_614 - LOCATION
      ?auto_613 - CITY
      ?auto_612 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_611 ?auto_614 ) ( IN-CITY ?auto_614 ?auto_613 ) ( IN-CITY ?auto_609 ?auto_613 ) ( not ( = ?auto_609 ?auto_614 ) ) ( OBJ-AT ?auto_612 ?auto_609 ) ( not ( = ?auto_612 ?auto_610 ) ) ( OBJ-AT ?auto_610 ?auto_614 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_610 ?auto_611 ?auto_614 )
      ( DELIVER-2PKG ?auto_612 ?auto_610 ?auto_609 )
      ( DELIVER-1PKG-VERIFY ?auto_610 ?auto_609 ) )
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
      ?auto_620 - TRUCK
      ?auto_618 - LOCATION
      ?auto_619 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_620 ?auto_618 ) ( IN-CITY ?auto_618 ?auto_619 ) ( IN-CITY ?auto_615 ?auto_619 ) ( not ( = ?auto_615 ?auto_618 ) ) ( OBJ-AT ?auto_616 ?auto_615 ) ( not ( = ?auto_616 ?auto_617 ) ) ( OBJ-AT ?auto_617 ?auto_618 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_617 ?auto_615 )
      ( DELIVER-2PKG-VERIFY ?auto_616 ?auto_617 ?auto_615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_622 - OBJ
      ?auto_623 - OBJ
      ?auto_621 - LOCATION
    )
    :vars
    (
      ?auto_624 - TRUCK
      ?auto_626 - LOCATION
      ?auto_625 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_624 ?auto_626 ) ( IN-CITY ?auto_626 ?auto_625 ) ( IN-CITY ?auto_621 ?auto_625 ) ( not ( = ?auto_621 ?auto_626 ) ) ( OBJ-AT ?auto_623 ?auto_621 ) ( not ( = ?auto_623 ?auto_622 ) ) ( OBJ-AT ?auto_622 ?auto_626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_623 ?auto_622 ?auto_621 )
      ( DELIVER-2PKG-VERIFY ?auto_622 ?auto_623 ?auto_621 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_635 - OBJ
      ?auto_634 - LOCATION
    )
    :vars
    (
      ?auto_639 - LOCATION
      ?auto_638 - CITY
      ?auto_636 - OBJ
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_639 ?auto_638 ) ( IN-CITY ?auto_634 ?auto_638 ) ( not ( = ?auto_634 ?auto_639 ) ) ( OBJ-AT ?auto_636 ?auto_634 ) ( not ( = ?auto_636 ?auto_635 ) ) ( OBJ-AT ?auto_635 ?auto_639 ) ( TRUCK-AT ?auto_637 ?auto_634 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_637 ?auto_634 ?auto_639 ?auto_638 )
      ( DELIVER-2PKG ?auto_636 ?auto_635 ?auto_634 )
      ( DELIVER-1PKG-VERIFY ?auto_635 ?auto_634 ) )
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
      ?auto_645 - LOCATION
      ?auto_644 - CITY
      ?auto_643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_645 ?auto_644 ) ( IN-CITY ?auto_640 ?auto_644 ) ( not ( = ?auto_640 ?auto_645 ) ) ( OBJ-AT ?auto_641 ?auto_640 ) ( not ( = ?auto_641 ?auto_642 ) ) ( OBJ-AT ?auto_642 ?auto_645 ) ( TRUCK-AT ?auto_643 ?auto_640 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_642 ?auto_640 )
      ( DELIVER-2PKG-VERIFY ?auto_641 ?auto_642 ?auto_640 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_647 - OBJ
      ?auto_648 - OBJ
      ?auto_646 - LOCATION
    )
    :vars
    (
      ?auto_651 - LOCATION
      ?auto_649 - CITY
      ?auto_650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_651 ?auto_649 ) ( IN-CITY ?auto_646 ?auto_649 ) ( not ( = ?auto_646 ?auto_651 ) ) ( OBJ-AT ?auto_648 ?auto_646 ) ( not ( = ?auto_648 ?auto_647 ) ) ( OBJ-AT ?auto_647 ?auto_651 ) ( TRUCK-AT ?auto_650 ?auto_646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_648 ?auto_647 ?auto_646 )
      ( DELIVER-2PKG-VERIFY ?auto_647 ?auto_648 ?auto_646 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_660 - OBJ
      ?auto_659 - LOCATION
    )
    :vars
    (
      ?auto_664 - LOCATION
      ?auto_661 - CITY
      ?auto_663 - OBJ
      ?auto_662 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_664 ?auto_661 ) ( IN-CITY ?auto_659 ?auto_661 ) ( not ( = ?auto_659 ?auto_664 ) ) ( not ( = ?auto_663 ?auto_660 ) ) ( OBJ-AT ?auto_660 ?auto_664 ) ( TRUCK-AT ?auto_662 ?auto_659 ) ( IN-TRUCK ?auto_663 ?auto_662 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_663 ?auto_659 )
      ( DELIVER-2PKG ?auto_663 ?auto_660 ?auto_659 )
      ( DELIVER-1PKG-VERIFY ?auto_660 ?auto_659 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_666 - OBJ
      ?auto_667 - OBJ
      ?auto_665 - LOCATION
    )
    :vars
    (
      ?auto_669 - LOCATION
      ?auto_670 - CITY
      ?auto_668 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_669 ?auto_670 ) ( IN-CITY ?auto_665 ?auto_670 ) ( not ( = ?auto_665 ?auto_669 ) ) ( not ( = ?auto_666 ?auto_667 ) ) ( OBJ-AT ?auto_667 ?auto_669 ) ( TRUCK-AT ?auto_668 ?auto_665 ) ( IN-TRUCK ?auto_666 ?auto_668 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_667 ?auto_665 )
      ( DELIVER-2PKG-VERIFY ?auto_666 ?auto_667 ?auto_665 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_672 - OBJ
      ?auto_673 - OBJ
      ?auto_671 - LOCATION
    )
    :vars
    (
      ?auto_676 - LOCATION
      ?auto_674 - CITY
      ?auto_675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_676 ?auto_674 ) ( IN-CITY ?auto_671 ?auto_674 ) ( not ( = ?auto_671 ?auto_676 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( OBJ-AT ?auto_672 ?auto_676 ) ( TRUCK-AT ?auto_675 ?auto_671 ) ( IN-TRUCK ?auto_673 ?auto_675 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_673 ?auto_672 ?auto_671 )
      ( DELIVER-2PKG-VERIFY ?auto_672 ?auto_673 ?auto_671 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_685 - OBJ
      ?auto_684 - LOCATION
    )
    :vars
    (
      ?auto_689 - LOCATION
      ?auto_686 - CITY
      ?auto_688 - OBJ
      ?auto_687 - TRUCK
      ?auto_690 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_689 ?auto_686 ) ( IN-CITY ?auto_684 ?auto_686 ) ( not ( = ?auto_684 ?auto_689 ) ) ( not ( = ?auto_688 ?auto_685 ) ) ( OBJ-AT ?auto_685 ?auto_689 ) ( IN-TRUCK ?auto_688 ?auto_687 ) ( TRUCK-AT ?auto_687 ?auto_690 ) ( IN-CITY ?auto_690 ?auto_686 ) ( not ( = ?auto_684 ?auto_690 ) ) ( not ( = ?auto_689 ?auto_690 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_687 ?auto_690 ?auto_684 ?auto_686 )
      ( DELIVER-2PKG ?auto_688 ?auto_685 ?auto_684 )
      ( DELIVER-1PKG-VERIFY ?auto_685 ?auto_684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_692 - OBJ
      ?auto_693 - OBJ
      ?auto_691 - LOCATION
    )
    :vars
    (
      ?auto_697 - LOCATION
      ?auto_696 - CITY
      ?auto_694 - TRUCK
      ?auto_695 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_697 ?auto_696 ) ( IN-CITY ?auto_691 ?auto_696 ) ( not ( = ?auto_691 ?auto_697 ) ) ( not ( = ?auto_692 ?auto_693 ) ) ( OBJ-AT ?auto_693 ?auto_697 ) ( IN-TRUCK ?auto_692 ?auto_694 ) ( TRUCK-AT ?auto_694 ?auto_695 ) ( IN-CITY ?auto_695 ?auto_696 ) ( not ( = ?auto_691 ?auto_695 ) ) ( not ( = ?auto_697 ?auto_695 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_693 ?auto_691 )
      ( DELIVER-2PKG-VERIFY ?auto_692 ?auto_693 ?auto_691 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_699 - OBJ
      ?auto_700 - OBJ
      ?auto_698 - LOCATION
    )
    :vars
    (
      ?auto_703 - LOCATION
      ?auto_702 - CITY
      ?auto_701 - TRUCK
      ?auto_704 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_703 ?auto_702 ) ( IN-CITY ?auto_698 ?auto_702 ) ( not ( = ?auto_698 ?auto_703 ) ) ( not ( = ?auto_700 ?auto_699 ) ) ( OBJ-AT ?auto_699 ?auto_703 ) ( IN-TRUCK ?auto_700 ?auto_701 ) ( TRUCK-AT ?auto_701 ?auto_704 ) ( IN-CITY ?auto_704 ?auto_702 ) ( not ( = ?auto_698 ?auto_704 ) ) ( not ( = ?auto_703 ?auto_704 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_700 ?auto_699 ?auto_698 )
      ( DELIVER-2PKG-VERIFY ?auto_699 ?auto_700 ?auto_698 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_714 - OBJ
      ?auto_713 - LOCATION
    )
    :vars
    (
      ?auto_717 - LOCATION
      ?auto_716 - CITY
      ?auto_719 - OBJ
      ?auto_715 - TRUCK
      ?auto_718 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_717 ?auto_716 ) ( IN-CITY ?auto_713 ?auto_716 ) ( not ( = ?auto_713 ?auto_717 ) ) ( not ( = ?auto_719 ?auto_714 ) ) ( OBJ-AT ?auto_714 ?auto_717 ) ( TRUCK-AT ?auto_715 ?auto_718 ) ( IN-CITY ?auto_718 ?auto_716 ) ( not ( = ?auto_713 ?auto_718 ) ) ( not ( = ?auto_717 ?auto_718 ) ) ( OBJ-AT ?auto_719 ?auto_718 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_719 ?auto_715 ?auto_718 )
      ( DELIVER-2PKG ?auto_719 ?auto_714 ?auto_713 )
      ( DELIVER-1PKG-VERIFY ?auto_714 ?auto_713 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_721 - OBJ
      ?auto_722 - OBJ
      ?auto_720 - LOCATION
    )
    :vars
    (
      ?auto_723 - LOCATION
      ?auto_725 - CITY
      ?auto_724 - TRUCK
      ?auto_726 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_723 ?auto_725 ) ( IN-CITY ?auto_720 ?auto_725 ) ( not ( = ?auto_720 ?auto_723 ) ) ( not ( = ?auto_721 ?auto_722 ) ) ( OBJ-AT ?auto_722 ?auto_723 ) ( TRUCK-AT ?auto_724 ?auto_726 ) ( IN-CITY ?auto_726 ?auto_725 ) ( not ( = ?auto_720 ?auto_726 ) ) ( not ( = ?auto_723 ?auto_726 ) ) ( OBJ-AT ?auto_721 ?auto_726 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_722 ?auto_720 )
      ( DELIVER-2PKG-VERIFY ?auto_721 ?auto_722 ?auto_720 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_728 - OBJ
      ?auto_729 - OBJ
      ?auto_727 - LOCATION
    )
    :vars
    (
      ?auto_731 - LOCATION
      ?auto_730 - CITY
      ?auto_732 - TRUCK
      ?auto_733 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_731 ?auto_730 ) ( IN-CITY ?auto_727 ?auto_730 ) ( not ( = ?auto_727 ?auto_731 ) ) ( not ( = ?auto_729 ?auto_728 ) ) ( OBJ-AT ?auto_728 ?auto_731 ) ( TRUCK-AT ?auto_732 ?auto_733 ) ( IN-CITY ?auto_733 ?auto_730 ) ( not ( = ?auto_727 ?auto_733 ) ) ( not ( = ?auto_731 ?auto_733 ) ) ( OBJ-AT ?auto_729 ?auto_733 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_729 ?auto_728 ?auto_727 )
      ( DELIVER-2PKG-VERIFY ?auto_728 ?auto_729 ?auto_727 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_743 - OBJ
      ?auto_742 - LOCATION
    )
    :vars
    (
      ?auto_745 - LOCATION
      ?auto_744 - CITY
      ?auto_748 - OBJ
      ?auto_747 - LOCATION
      ?auto_746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_745 ?auto_744 ) ( IN-CITY ?auto_742 ?auto_744 ) ( not ( = ?auto_742 ?auto_745 ) ) ( not ( = ?auto_748 ?auto_743 ) ) ( OBJ-AT ?auto_743 ?auto_745 ) ( IN-CITY ?auto_747 ?auto_744 ) ( not ( = ?auto_742 ?auto_747 ) ) ( not ( = ?auto_745 ?auto_747 ) ) ( OBJ-AT ?auto_748 ?auto_747 ) ( TRUCK-AT ?auto_746 ?auto_742 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_746 ?auto_742 ?auto_747 ?auto_744 )
      ( DELIVER-2PKG ?auto_748 ?auto_743 ?auto_742 )
      ( DELIVER-1PKG-VERIFY ?auto_743 ?auto_742 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_750 - OBJ
      ?auto_751 - OBJ
      ?auto_749 - LOCATION
    )
    :vars
    (
      ?auto_755 - LOCATION
      ?auto_752 - CITY
      ?auto_754 - LOCATION
      ?auto_753 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_755 ?auto_752 ) ( IN-CITY ?auto_749 ?auto_752 ) ( not ( = ?auto_749 ?auto_755 ) ) ( not ( = ?auto_750 ?auto_751 ) ) ( OBJ-AT ?auto_751 ?auto_755 ) ( IN-CITY ?auto_754 ?auto_752 ) ( not ( = ?auto_749 ?auto_754 ) ) ( not ( = ?auto_755 ?auto_754 ) ) ( OBJ-AT ?auto_750 ?auto_754 ) ( TRUCK-AT ?auto_753 ?auto_749 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_751 ?auto_749 )
      ( DELIVER-2PKG-VERIFY ?auto_750 ?auto_751 ?auto_749 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_757 - OBJ
      ?auto_758 - OBJ
      ?auto_756 - LOCATION
    )
    :vars
    (
      ?auto_760 - LOCATION
      ?auto_759 - CITY
      ?auto_762 - LOCATION
      ?auto_761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_760 ?auto_759 ) ( IN-CITY ?auto_756 ?auto_759 ) ( not ( = ?auto_756 ?auto_760 ) ) ( not ( = ?auto_758 ?auto_757 ) ) ( OBJ-AT ?auto_757 ?auto_760 ) ( IN-CITY ?auto_762 ?auto_759 ) ( not ( = ?auto_756 ?auto_762 ) ) ( not ( = ?auto_760 ?auto_762 ) ) ( OBJ-AT ?auto_758 ?auto_762 ) ( TRUCK-AT ?auto_761 ?auto_756 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_758 ?auto_757 ?auto_756 )
      ( DELIVER-2PKG-VERIFY ?auto_757 ?auto_758 ?auto_756 ) )
  )

)

