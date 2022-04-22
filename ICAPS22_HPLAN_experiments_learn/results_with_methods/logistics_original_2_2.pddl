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
      ?auto_540 - TRUCK
      ?auto_541 - LOCATION
      ?auto_539 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_540 ?auto_541 ) ( IN-CITY ?auto_541 ?auto_539 ) ( IN-CITY ?auto_537 ?auto_539 ) ( not ( = ?auto_537 ?auto_541 ) ) ( OBJ-AT ?auto_538 ?auto_541 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_538 ?auto_540 ?auto_541 )
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
      ?auto_551 - LOCATION
      ?auto_552 - CITY
      ?auto_550 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_551 ?auto_552 ) ( IN-CITY ?auto_548 ?auto_552 ) ( not ( = ?auto_548 ?auto_551 ) ) ( OBJ-AT ?auto_549 ?auto_551 ) ( TRUCK-AT ?auto_550 ?auto_548 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_550 ?auto_548 ?auto_551 ?auto_552 )
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
      ?auto_595 - TRUCK
      ?auto_594 - LOCATION
      ?auto_593 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_592 ?auto_595 ) ( TRUCK-AT ?auto_595 ?auto_594 ) ( IN-CITY ?auto_594 ?auto_593 ) ( IN-CITY ?auto_590 ?auto_593 ) ( not ( = ?auto_590 ?auto_594 ) ) ( OBJ-AT ?auto_591 ?auto_590 ) ( not ( = ?auto_591 ?auto_592 ) ) )
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
      ?auto_601 - TRUCK
      ?auto_600 - LOCATION
      ?auto_599 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_597 ?auto_601 ) ( TRUCK-AT ?auto_601 ?auto_600 ) ( IN-CITY ?auto_600 ?auto_599 ) ( IN-CITY ?auto_596 ?auto_599 ) ( not ( = ?auto_596 ?auto_600 ) ) ( OBJ-AT ?auto_598 ?auto_596 ) ( not ( = ?auto_598 ?auto_597 ) ) )
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
      ?auto_614 - TRUCK
      ?auto_612 - LOCATION
      ?auto_611 - CITY
      ?auto_613 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_614 ?auto_612 ) ( IN-CITY ?auto_612 ?auto_611 ) ( IN-CITY ?auto_609 ?auto_611 ) ( not ( = ?auto_609 ?auto_612 ) ) ( OBJ-AT ?auto_613 ?auto_609 ) ( not ( = ?auto_613 ?auto_610 ) ) ( OBJ-AT ?auto_610 ?auto_612 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_610 ?auto_614 ?auto_612 )
      ( DELIVER-2PKG ?auto_613 ?auto_610 ?auto_609 ) )
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
      ?auto_619 - TRUCK
      ?auto_620 - LOCATION
      ?auto_618 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_619 ?auto_620 ) ( IN-CITY ?auto_620 ?auto_618 ) ( IN-CITY ?auto_615 ?auto_618 ) ( not ( = ?auto_615 ?auto_620 ) ) ( OBJ-AT ?auto_616 ?auto_615 ) ( not ( = ?auto_616 ?auto_617 ) ) ( OBJ-AT ?auto_617 ?auto_620 ) )
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
      ?auto_624 - LOCATION
      ?auto_626 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_625 ?auto_624 ) ( IN-CITY ?auto_624 ?auto_626 ) ( IN-CITY ?auto_621 ?auto_626 ) ( not ( = ?auto_621 ?auto_624 ) ) ( OBJ-AT ?auto_623 ?auto_621 ) ( not ( = ?auto_623 ?auto_622 ) ) ( OBJ-AT ?auto_622 ?auto_624 ) )
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
      ?auto_636 - LOCATION
      ?auto_638 - CITY
      ?auto_639 - OBJ
      ?auto_637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_636 ?auto_638 ) ( IN-CITY ?auto_634 ?auto_638 ) ( not ( = ?auto_634 ?auto_636 ) ) ( OBJ-AT ?auto_639 ?auto_634 ) ( not ( = ?auto_639 ?auto_635 ) ) ( OBJ-AT ?auto_635 ?auto_636 ) ( TRUCK-AT ?auto_637 ?auto_634 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_637 ?auto_634 ?auto_636 ?auto_638 )
      ( DELIVER-2PKG ?auto_639 ?auto_635 ?auto_634 ) )
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
      ?auto_663 - CITY
      ?auto_662 - OBJ
      ?auto_664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_661 ?auto_663 ) ( IN-CITY ?auto_659 ?auto_663 ) ( not ( = ?auto_659 ?auto_661 ) ) ( not ( = ?auto_662 ?auto_660 ) ) ( OBJ-AT ?auto_660 ?auto_661 ) ( TRUCK-AT ?auto_664 ?auto_659 ) ( IN-TRUCK ?auto_662 ?auto_664 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_662 ?auto_659 )
      ( DELIVER-2PKG ?auto_662 ?auto_660 ?auto_659 ) )
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
      ?auto_675 - LOCATION
      ?auto_676 - CITY
      ?auto_674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_675 ?auto_676 ) ( IN-CITY ?auto_671 ?auto_676 ) ( not ( = ?auto_671 ?auto_675 ) ) ( not ( = ?auto_673 ?auto_672 ) ) ( OBJ-AT ?auto_672 ?auto_675 ) ( TRUCK-AT ?auto_674 ?auto_671 ) ( IN-TRUCK ?auto_673 ?auto_674 ) )
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
      ?auto_688 - LOCATION
      ?auto_689 - CITY
      ?auto_687 - OBJ
      ?auto_686 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_688 ?auto_689 ) ( IN-CITY ?auto_684 ?auto_689 ) ( not ( = ?auto_684 ?auto_688 ) ) ( not ( = ?auto_687 ?auto_685 ) ) ( OBJ-AT ?auto_685 ?auto_688 ) ( IN-TRUCK ?auto_687 ?auto_686 ) ( TRUCK-AT ?auto_686 ?auto_688 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_686 ?auto_688 ?auto_684 ?auto_689 )
      ( DELIVER-2PKG ?auto_687 ?auto_685 ?auto_684 ) )
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
      ?auto_693 - LOCATION
      ?auto_695 - CITY
      ?auto_694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_693 ?auto_695 ) ( IN-CITY ?auto_690 ?auto_695 ) ( not ( = ?auto_690 ?auto_693 ) ) ( not ( = ?auto_691 ?auto_692 ) ) ( OBJ-AT ?auto_692 ?auto_693 ) ( IN-TRUCK ?auto_691 ?auto_694 ) ( TRUCK-AT ?auto_694 ?auto_693 ) )
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
      ?auto_719 - LOCATION
      ?auto_718 - CITY
      ?auto_720 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_719 ?auto_718 ) ( IN-CITY ?auto_715 ?auto_718 ) ( not ( = ?auto_715 ?auto_719 ) ) ( not ( = ?auto_716 ?auto_717 ) ) ( OBJ-AT ?auto_717 ?auto_719 ) ( TRUCK-AT ?auto_720 ?auto_719 ) ( OBJ-AT ?auto_716 ?auto_719 ) )
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
      ?auto_726 - LOCATION
      ?auto_724 - CITY
      ?auto_725 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_726 ?auto_724 ) ( IN-CITY ?auto_721 ?auto_724 ) ( not ( = ?auto_721 ?auto_726 ) ) ( not ( = ?auto_723 ?auto_722 ) ) ( OBJ-AT ?auto_722 ?auto_726 ) ( TRUCK-AT ?auto_725 ?auto_726 ) ( OBJ-AT ?auto_723 ?auto_726 ) )
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
      ?auto_738 - LOCATION
      ?auto_736 - CITY
      ?auto_739 - OBJ
      ?auto_737 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_738 ?auto_736 ) ( IN-CITY ?auto_734 ?auto_736 ) ( not ( = ?auto_734 ?auto_738 ) ) ( not ( = ?auto_739 ?auto_735 ) ) ( OBJ-AT ?auto_735 ?auto_738 ) ( OBJ-AT ?auto_739 ?auto_738 ) ( TRUCK-AT ?auto_737 ?auto_734 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_737 ?auto_734 ?auto_738 ?auto_736 )
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
      ?auto_744 - LOCATION
      ?auto_743 - CITY
      ?auto_745 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_744 ?auto_743 ) ( IN-CITY ?auto_740 ?auto_743 ) ( not ( = ?auto_740 ?auto_744 ) ) ( not ( = ?auto_741 ?auto_742 ) ) ( OBJ-AT ?auto_742 ?auto_744 ) ( OBJ-AT ?auto_741 ?auto_744 ) ( TRUCK-AT ?auto_745 ?auto_740 ) )
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
      ?auto_749 - LOCATION
      ?auto_750 - CITY
      ?auto_751 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_749 ?auto_750 ) ( IN-CITY ?auto_746 ?auto_750 ) ( not ( = ?auto_746 ?auto_749 ) ) ( not ( = ?auto_748 ?auto_747 ) ) ( OBJ-AT ?auto_747 ?auto_749 ) ( OBJ-AT ?auto_748 ?auto_749 ) ( TRUCK-AT ?auto_751 ?auto_746 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_748 ?auto_747 ?auto_746 ) )
  )

)

