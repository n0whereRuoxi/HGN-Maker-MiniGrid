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
    ( ( !UNLOAD-TRUCK ?auto_520 ?auto_521 ?auto_519 ) )
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
      ( DELIVER-1PKG ?auto_527 ?auto_526 ) )
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
      ?auto_539 - LOCATION
      ?auto_540 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_541 ?auto_539 ) ( IN-CITY ?auto_539 ?auto_540 ) ( IN-CITY ?auto_537 ?auto_540 ) ( not ( = ?auto_537 ?auto_539 ) ) ( OBJ-AT ?auto_538 ?auto_539 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_538 ?auto_541 ?auto_539 )
      ( DELIVER-1PKG ?auto_538 ?auto_537 ) )
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
      ( DELIVER-1PKG ?auto_549 ?auto_548 ) )
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
    ( ( !UNLOAD-TRUCK ?auto_571 ?auto_572 ?auto_570 ) )
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
    ( ( DELIVER-1PKG ?auto_575 ?auto_573 ) )
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
    ( ( DELIVER-1PKG ?auto_578 ?auto_577 ) )
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
      ( DELIVER-1PKG ?auto_586 ?auto_585 ) )
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
      ?auto_595 - LOCATION
      ?auto_594 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_592 ?auto_593 ) ( TRUCK-AT ?auto_593 ?auto_595 ) ( IN-CITY ?auto_595 ?auto_594 ) ( IN-CITY ?auto_590 ?auto_594 ) ( not ( = ?auto_590 ?auto_595 ) ) ( OBJ-AT ?auto_591 ?auto_590 ) ( not ( = ?auto_591 ?auto_592 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_592 ?auto_590 ) )
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
      ?auto_600 - TRUCK
      ?auto_599 - LOCATION
      ?auto_601 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_597 ?auto_600 ) ( TRUCK-AT ?auto_600 ?auto_599 ) ( IN-CITY ?auto_599 ?auto_601 ) ( IN-CITY ?auto_596 ?auto_601 ) ( not ( = ?auto_596 ?auto_599 ) ) ( OBJ-AT ?auto_598 ?auto_596 ) ( not ( = ?auto_598 ?auto_597 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_598 ?auto_597 ?auto_596 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_610 - OBJ
      ?auto_609 - LOCATION
    )
    :vars
    (
      ?auto_612 - TRUCK
      ?auto_611 - LOCATION
      ?auto_613 - CITY
      ?auto_614 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_612 ?auto_611 ) ( IN-CITY ?auto_611 ?auto_613 ) ( IN-CITY ?auto_609 ?auto_613 ) ( not ( = ?auto_609 ?auto_611 ) ) ( OBJ-AT ?auto_614 ?auto_609 ) ( not ( = ?auto_614 ?auto_610 ) ) ( OBJ-AT ?auto_610 ?auto_611 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_610 ?auto_612 ?auto_611 )
      ( DELIVER-2PKG ?auto_614 ?auto_610 ?auto_609 ) )
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
    ( ( DELIVER-1PKG ?auto_617 ?auto_615 ) )
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
      ?auto_625 - TRUCK
      ?auto_626 - LOCATION
      ?auto_624 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_625 ?auto_626 ) ( IN-CITY ?auto_626 ?auto_624 ) ( IN-CITY ?auto_621 ?auto_624 ) ( not ( = ?auto_621 ?auto_626 ) ) ( OBJ-AT ?auto_623 ?auto_621 ) ( not ( = ?auto_623 ?auto_622 ) ) ( OBJ-AT ?auto_622 ?auto_626 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_623 ?auto_622 ?auto_621 ) )
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
      ?auto_636 - CITY
      ?auto_637 - OBJ
      ?auto_638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_639 ?auto_636 ) ( IN-CITY ?auto_634 ?auto_636 ) ( not ( = ?auto_634 ?auto_639 ) ) ( OBJ-AT ?auto_637 ?auto_634 ) ( not ( = ?auto_637 ?auto_635 ) ) ( OBJ-AT ?auto_635 ?auto_639 ) ( TRUCK-AT ?auto_638 ?auto_634 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_638 ?auto_634 ?auto_639 ?auto_636 )
      ( DELIVER-2PKG ?auto_637 ?auto_635 ?auto_634 ) )
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
      ?auto_644 - LOCATION
      ?auto_643 - CITY
      ?auto_645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_644 ?auto_643 ) ( IN-CITY ?auto_640 ?auto_643 ) ( not ( = ?auto_640 ?auto_644 ) ) ( OBJ-AT ?auto_641 ?auto_640 ) ( not ( = ?auto_641 ?auto_642 ) ) ( OBJ-AT ?auto_642 ?auto_644 ) ( TRUCK-AT ?auto_645 ?auto_640 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_642 ?auto_640 ) )
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
      ?auto_649 - LOCATION
      ?auto_650 - CITY
      ?auto_651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_649 ?auto_650 ) ( IN-CITY ?auto_646 ?auto_650 ) ( not ( = ?auto_646 ?auto_649 ) ) ( OBJ-AT ?auto_648 ?auto_646 ) ( not ( = ?auto_648 ?auto_647 ) ) ( OBJ-AT ?auto_647 ?auto_649 ) ( TRUCK-AT ?auto_651 ?auto_646 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_648 ?auto_647 ?auto_646 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_660 - OBJ
      ?auto_659 - LOCATION
    )
    :vars
    (
      ?auto_661 - LOCATION
      ?auto_662 - CITY
      ?auto_663 - OBJ
      ?auto_664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_661 ?auto_662 ) ( IN-CITY ?auto_659 ?auto_662 ) ( not ( = ?auto_659 ?auto_661 ) ) ( not ( = ?auto_663 ?auto_660 ) ) ( OBJ-AT ?auto_660 ?auto_661 ) ( TRUCK-AT ?auto_664 ?auto_659 ) ( IN-TRUCK ?auto_663 ?auto_664 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_663 ?auto_659 )
      ( DELIVER-2PKG ?auto_663 ?auto_660 ?auto_659 ) )
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
      ?auto_668 - LOCATION
      ?auto_669 - CITY
      ?auto_670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_668 ?auto_669 ) ( IN-CITY ?auto_665 ?auto_669 ) ( not ( = ?auto_665 ?auto_668 ) ) ( not ( = ?auto_666 ?auto_667 ) ) ( OBJ-AT ?auto_667 ?auto_668 ) ( TRUCK-AT ?auto_670 ?auto_665 ) ( IN-TRUCK ?auto_666 ?auto_670 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_667 ?auto_665 ) )
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
      ?auto_674 - LOCATION
      ?auto_676 - CITY
      ?auto_675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_674 ?auto_676 ) ( IN-CITY ?auto_671 ?auto_676 ) ( not ( = ?auto_671 ?auto_674 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( OBJ-AT ?auto_672 ?auto_674 ) ( TRUCK-AT ?auto_675 ?auto_671 ) ( IN-TRUCK ?auto_673 ?auto_675 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_673 ?auto_672 ?auto_671 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_685 - OBJ
      ?auto_684 - LOCATION
    )
    :vars
    (
      ?auto_686 - LOCATION
      ?auto_688 - CITY
      ?auto_689 - OBJ
      ?auto_687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_686 ?auto_688 ) ( IN-CITY ?auto_684 ?auto_688 ) ( not ( = ?auto_684 ?auto_686 ) ) ( not ( = ?auto_689 ?auto_685 ) ) ( OBJ-AT ?auto_685 ?auto_686 ) ( IN-TRUCK ?auto_689 ?auto_687 ) ( TRUCK-AT ?auto_687 ?auto_686 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_687 ?auto_686 ?auto_684 ?auto_688 )
      ( DELIVER-2PKG ?auto_689 ?auto_685 ?auto_684 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_691 - OBJ
      ?auto_692 - OBJ
      ?auto_690 - LOCATION
    )
    :vars
    (
      ?auto_695 - LOCATION
      ?auto_693 - CITY
      ?auto_694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_695 ?auto_693 ) ( IN-CITY ?auto_690 ?auto_693 ) ( not ( = ?auto_690 ?auto_695 ) ) ( not ( = ?auto_691 ?auto_692 ) ) ( OBJ-AT ?auto_692 ?auto_695 ) ( IN-TRUCK ?auto_691 ?auto_694 ) ( TRUCK-AT ?auto_694 ?auto_695 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_692 ?auto_690 ) )
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
      ?auto_699 - LOCATION
      ?auto_700 - CITY
      ?auto_701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_699 ?auto_700 ) ( IN-CITY ?auto_696 ?auto_700 ) ( not ( = ?auto_696 ?auto_699 ) ) ( not ( = ?auto_698 ?auto_697 ) ) ( OBJ-AT ?auto_697 ?auto_699 ) ( IN-TRUCK ?auto_698 ?auto_701 ) ( TRUCK-AT ?auto_701 ?auto_699 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_698 ?auto_697 ?auto_696 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_710 - OBJ
      ?auto_709 - LOCATION
    )
    :vars
    (
      ?auto_711 - LOCATION
      ?auto_712 - CITY
      ?auto_714 - OBJ
      ?auto_713 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_711 ?auto_712 ) ( IN-CITY ?auto_709 ?auto_712 ) ( not ( = ?auto_709 ?auto_711 ) ) ( not ( = ?auto_714 ?auto_710 ) ) ( OBJ-AT ?auto_710 ?auto_711 ) ( TRUCK-AT ?auto_713 ?auto_711 ) ( OBJ-AT ?auto_714 ?auto_711 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_714 ?auto_713 ?auto_711 )
      ( DELIVER-2PKG ?auto_714 ?auto_710 ?auto_709 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_716 - OBJ
      ?auto_717 - OBJ
      ?auto_715 - LOCATION
    )
    :vars
    (
      ?auto_720 - LOCATION
      ?auto_719 - CITY
      ?auto_718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_720 ?auto_719 ) ( IN-CITY ?auto_715 ?auto_719 ) ( not ( = ?auto_715 ?auto_720 ) ) ( not ( = ?auto_716 ?auto_717 ) ) ( OBJ-AT ?auto_717 ?auto_720 ) ( TRUCK-AT ?auto_718 ?auto_720 ) ( OBJ-AT ?auto_716 ?auto_720 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_717 ?auto_715 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_722 - OBJ
      ?auto_723 - OBJ
      ?auto_721 - LOCATION
    )
    :vars
    (
      ?auto_725 - LOCATION
      ?auto_726 - CITY
      ?auto_724 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_725 ?auto_726 ) ( IN-CITY ?auto_721 ?auto_726 ) ( not ( = ?auto_721 ?auto_725 ) ) ( not ( = ?auto_723 ?auto_722 ) ) ( OBJ-AT ?auto_722 ?auto_725 ) ( TRUCK-AT ?auto_724 ?auto_725 ) ( OBJ-AT ?auto_723 ?auto_725 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_723 ?auto_722 ?auto_721 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_735 - OBJ
      ?auto_734 - LOCATION
    )
    :vars
    (
      ?auto_737 - LOCATION
      ?auto_738 - CITY
      ?auto_739 - OBJ
      ?auto_736 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_737 ?auto_738 ) ( IN-CITY ?auto_734 ?auto_738 ) ( not ( = ?auto_734 ?auto_737 ) ) ( not ( = ?auto_739 ?auto_735 ) ) ( OBJ-AT ?auto_735 ?auto_737 ) ( OBJ-AT ?auto_739 ?auto_737 ) ( TRUCK-AT ?auto_736 ?auto_734 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_736 ?auto_734 ?auto_737 ?auto_738 )
      ( DELIVER-2PKG ?auto_739 ?auto_735 ?auto_734 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_741 - OBJ
      ?auto_742 - OBJ
      ?auto_740 - LOCATION
    )
    :vars
    (
      ?auto_745 - LOCATION
      ?auto_744 - CITY
      ?auto_743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_745 ?auto_744 ) ( IN-CITY ?auto_740 ?auto_744 ) ( not ( = ?auto_740 ?auto_745 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( OBJ-AT ?auto_742 ?auto_745 ) ( OBJ-AT ?auto_741 ?auto_745 ) ( TRUCK-AT ?auto_743 ?auto_740 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_742 ?auto_740 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_747 - OBJ
      ?auto_748 - OBJ
      ?auto_746 - LOCATION
    )
    :vars
    (
      ?auto_751 - LOCATION
      ?auto_749 - CITY
      ?auto_750 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_751 ?auto_749 ) ( IN-CITY ?auto_746 ?auto_749 ) ( not ( = ?auto_746 ?auto_751 ) ) ( not ( = ?auto_748 ?auto_747 ) ) ( OBJ-AT ?auto_747 ?auto_751 ) ( OBJ-AT ?auto_748 ?auto_751 ) ( TRUCK-AT ?auto_750 ?auto_746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_748 ?auto_747 ?auto_746 ) )
  )

)

