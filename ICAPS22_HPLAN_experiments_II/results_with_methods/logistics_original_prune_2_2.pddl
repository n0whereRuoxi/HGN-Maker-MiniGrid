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
      ?auto_502 - OBJ
      ?auto_501 - LOCATION
    )
    :vars
    (
      ?auto_503 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_503 ?auto_501 ) ( IN-TRUCK ?auto_502 ?auto_503 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_502 ?auto_503 ?auto_501 )
      ( DELIVER-1PKG-VERIFY ?auto_502 ?auto_501 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_509 - OBJ
      ?auto_508 - LOCATION
    )
    :vars
    (
      ?auto_510 - TRUCK
      ?auto_511 - LOCATION
      ?auto_512 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_509 ?auto_510 ) ( TRUCK-AT ?auto_510 ?auto_511 ) ( IN-CITY ?auto_511 ?auto_512 ) ( IN-CITY ?auto_508 ?auto_512 ) ( not ( = ?auto_508 ?auto_511 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_510 ?auto_511 ?auto_508 ?auto_512 )
      ( DELIVER-1PKG ?auto_509 ?auto_508 )
      ( DELIVER-1PKG-VERIFY ?auto_509 ?auto_508 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_520 - OBJ
      ?auto_519 - LOCATION
    )
    :vars
    (
      ?auto_522 - TRUCK
      ?auto_523 - LOCATION
      ?auto_521 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_522 ?auto_523 ) ( IN-CITY ?auto_523 ?auto_521 ) ( IN-CITY ?auto_519 ?auto_521 ) ( not ( = ?auto_519 ?auto_523 ) ) ( OBJ-AT ?auto_520 ?auto_523 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_520 ?auto_522 ?auto_523 )
      ( DELIVER-1PKG ?auto_520 ?auto_519 )
      ( DELIVER-1PKG-VERIFY ?auto_520 ?auto_519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_531 - OBJ
      ?auto_530 - LOCATION
    )
    :vars
    (
      ?auto_534 - LOCATION
      ?auto_533 - CITY
      ?auto_532 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_534 ?auto_533 ) ( IN-CITY ?auto_530 ?auto_533 ) ( not ( = ?auto_530 ?auto_534 ) ) ( OBJ-AT ?auto_531 ?auto_534 ) ( TRUCK-AT ?auto_532 ?auto_530 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_532 ?auto_530 ?auto_534 ?auto_533 )
      ( DELIVER-1PKG ?auto_531 ?auto_530 )
      ( DELIVER-1PKG-VERIFY ?auto_531 ?auto_530 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_556 - OBJ
      ?auto_557 - OBJ
      ?auto_555 - LOCATION
    )
    :vars
    (
      ?auto_558 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_558 ?auto_555 ) ( IN-TRUCK ?auto_557 ?auto_558 ) ( OBJ-AT ?auto_556 ?auto_555 ) ( not ( = ?auto_556 ?auto_557 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_557 ?auto_555 )
      ( DELIVER-2PKG-VERIFY ?auto_556 ?auto_557 ?auto_555 ) )
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
      ?auto_562 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_562 ?auto_559 ) ( IN-TRUCK ?auto_560 ?auto_562 ) ( OBJ-AT ?auto_561 ?auto_559 ) ( not ( = ?auto_560 ?auto_561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_560 ?auto_559 )
      ( DELIVER-2PKG-VERIFY ?auto_560 ?auto_561 ?auto_559 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_573 - OBJ
      ?auto_574 - OBJ
      ?auto_572 - LOCATION
    )
    :vars
    (
      ?auto_576 - TRUCK
      ?auto_577 - LOCATION
      ?auto_575 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_574 ?auto_576 ) ( TRUCK-AT ?auto_576 ?auto_577 ) ( IN-CITY ?auto_577 ?auto_575 ) ( IN-CITY ?auto_572 ?auto_575 ) ( not ( = ?auto_572 ?auto_577 ) ) ( OBJ-AT ?auto_573 ?auto_572 ) ( not ( = ?auto_573 ?auto_574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_574 ?auto_572 )
      ( DELIVER-2PKG-VERIFY ?auto_573 ?auto_574 ?auto_572 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_579 - OBJ
      ?auto_580 - OBJ
      ?auto_578 - LOCATION
    )
    :vars
    (
      ?auto_582 - TRUCK
      ?auto_581 - LOCATION
      ?auto_583 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_579 ?auto_582 ) ( TRUCK-AT ?auto_582 ?auto_581 ) ( IN-CITY ?auto_581 ?auto_583 ) ( IN-CITY ?auto_578 ?auto_583 ) ( not ( = ?auto_578 ?auto_581 ) ) ( OBJ-AT ?auto_580 ?auto_578 ) ( not ( = ?auto_580 ?auto_579 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_580 ?auto_579 ?auto_578 )
      ( DELIVER-2PKG-VERIFY ?auto_579 ?auto_580 ?auto_578 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_592 - OBJ
      ?auto_591 - LOCATION
    )
    :vars
    (
      ?auto_595 - TRUCK
      ?auto_593 - LOCATION
      ?auto_596 - CITY
      ?auto_594 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_595 ?auto_593 ) ( IN-CITY ?auto_593 ?auto_596 ) ( IN-CITY ?auto_591 ?auto_596 ) ( not ( = ?auto_591 ?auto_593 ) ) ( OBJ-AT ?auto_594 ?auto_591 ) ( not ( = ?auto_594 ?auto_592 ) ) ( OBJ-AT ?auto_592 ?auto_593 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_592 ?auto_595 ?auto_593 )
      ( DELIVER-2PKG ?auto_594 ?auto_592 ?auto_591 )
      ( DELIVER-1PKG-VERIFY ?auto_592 ?auto_591 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_598 - OBJ
      ?auto_599 - OBJ
      ?auto_597 - LOCATION
    )
    :vars
    (
      ?auto_602 - TRUCK
      ?auto_601 - LOCATION
      ?auto_600 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_602 ?auto_601 ) ( IN-CITY ?auto_601 ?auto_600 ) ( IN-CITY ?auto_597 ?auto_600 ) ( not ( = ?auto_597 ?auto_601 ) ) ( OBJ-AT ?auto_598 ?auto_597 ) ( not ( = ?auto_598 ?auto_599 ) ) ( OBJ-AT ?auto_599 ?auto_601 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_599 ?auto_597 )
      ( DELIVER-2PKG-VERIFY ?auto_598 ?auto_599 ?auto_597 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_604 - OBJ
      ?auto_605 - OBJ
      ?auto_603 - LOCATION
    )
    :vars
    (
      ?auto_606 - TRUCK
      ?auto_607 - LOCATION
      ?auto_608 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_606 ?auto_607 ) ( IN-CITY ?auto_607 ?auto_608 ) ( IN-CITY ?auto_603 ?auto_608 ) ( not ( = ?auto_603 ?auto_607 ) ) ( OBJ-AT ?auto_605 ?auto_603 ) ( not ( = ?auto_605 ?auto_604 ) ) ( OBJ-AT ?auto_604 ?auto_607 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_605 ?auto_604 ?auto_603 )
      ( DELIVER-2PKG-VERIFY ?auto_604 ?auto_605 ?auto_603 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_617 - OBJ
      ?auto_616 - LOCATION
    )
    :vars
    (
      ?auto_619 - LOCATION
      ?auto_621 - CITY
      ?auto_620 - OBJ
      ?auto_618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_619 ?auto_621 ) ( IN-CITY ?auto_616 ?auto_621 ) ( not ( = ?auto_616 ?auto_619 ) ) ( OBJ-AT ?auto_620 ?auto_616 ) ( not ( = ?auto_620 ?auto_617 ) ) ( OBJ-AT ?auto_617 ?auto_619 ) ( TRUCK-AT ?auto_618 ?auto_616 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_618 ?auto_616 ?auto_619 ?auto_621 )
      ( DELIVER-2PKG ?auto_620 ?auto_617 ?auto_616 )
      ( DELIVER-1PKG-VERIFY ?auto_617 ?auto_616 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_623 - OBJ
      ?auto_624 - OBJ
      ?auto_622 - LOCATION
    )
    :vars
    (
      ?auto_627 - LOCATION
      ?auto_626 - CITY
      ?auto_625 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_627 ?auto_626 ) ( IN-CITY ?auto_622 ?auto_626 ) ( not ( = ?auto_622 ?auto_627 ) ) ( OBJ-AT ?auto_623 ?auto_622 ) ( not ( = ?auto_623 ?auto_624 ) ) ( OBJ-AT ?auto_624 ?auto_627 ) ( TRUCK-AT ?auto_625 ?auto_622 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_624 ?auto_622 )
      ( DELIVER-2PKG-VERIFY ?auto_623 ?auto_624 ?auto_622 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_629 - OBJ
      ?auto_630 - OBJ
      ?auto_628 - LOCATION
    )
    :vars
    (
      ?auto_632 - LOCATION
      ?auto_633 - CITY
      ?auto_631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_632 ?auto_633 ) ( IN-CITY ?auto_628 ?auto_633 ) ( not ( = ?auto_628 ?auto_632 ) ) ( OBJ-AT ?auto_630 ?auto_628 ) ( not ( = ?auto_630 ?auto_629 ) ) ( OBJ-AT ?auto_629 ?auto_632 ) ( TRUCK-AT ?auto_631 ?auto_628 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_630 ?auto_629 ?auto_628 )
      ( DELIVER-2PKG-VERIFY ?auto_629 ?auto_630 ?auto_628 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_642 - OBJ
      ?auto_641 - LOCATION
    )
    :vars
    (
      ?auto_645 - LOCATION
      ?auto_646 - CITY
      ?auto_644 - OBJ
      ?auto_643 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_645 ?auto_646 ) ( IN-CITY ?auto_641 ?auto_646 ) ( not ( = ?auto_641 ?auto_645 ) ) ( not ( = ?auto_644 ?auto_642 ) ) ( OBJ-AT ?auto_642 ?auto_645 ) ( TRUCK-AT ?auto_643 ?auto_641 ) ( IN-TRUCK ?auto_644 ?auto_643 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_644 ?auto_641 )
      ( DELIVER-2PKG ?auto_644 ?auto_642 ?auto_641 )
      ( DELIVER-1PKG-VERIFY ?auto_642 ?auto_641 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_648 - OBJ
      ?auto_649 - OBJ
      ?auto_647 - LOCATION
    )
    :vars
    (
      ?auto_651 - LOCATION
      ?auto_652 - CITY
      ?auto_650 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_651 ?auto_652 ) ( IN-CITY ?auto_647 ?auto_652 ) ( not ( = ?auto_647 ?auto_651 ) ) ( not ( = ?auto_648 ?auto_649 ) ) ( OBJ-AT ?auto_649 ?auto_651 ) ( TRUCK-AT ?auto_650 ?auto_647 ) ( IN-TRUCK ?auto_648 ?auto_650 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_649 ?auto_647 )
      ( DELIVER-2PKG-VERIFY ?auto_648 ?auto_649 ?auto_647 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_655 - OBJ
      ?auto_653 - LOCATION
    )
    :vars
    (
      ?auto_658 - LOCATION
      ?auto_657 - CITY
      ?auto_656 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_658 ?auto_657 ) ( IN-CITY ?auto_653 ?auto_657 ) ( not ( = ?auto_653 ?auto_658 ) ) ( not ( = ?auto_655 ?auto_654 ) ) ( OBJ-AT ?auto_654 ?auto_658 ) ( TRUCK-AT ?auto_656 ?auto_653 ) ( IN-TRUCK ?auto_655 ?auto_656 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_655 ?auto_654 ?auto_653 )
      ( DELIVER-2PKG-VERIFY ?auto_654 ?auto_655 ?auto_653 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_667 - OBJ
      ?auto_666 - LOCATION
    )
    :vars
    (
      ?auto_670 - LOCATION
      ?auto_669 - CITY
      ?auto_671 - OBJ
      ?auto_668 - TRUCK
      ?auto_672 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_670 ?auto_669 ) ( IN-CITY ?auto_666 ?auto_669 ) ( not ( = ?auto_666 ?auto_670 ) ) ( not ( = ?auto_671 ?auto_667 ) ) ( OBJ-AT ?auto_667 ?auto_670 ) ( IN-TRUCK ?auto_671 ?auto_668 ) ( TRUCK-AT ?auto_668 ?auto_672 ) ( IN-CITY ?auto_672 ?auto_669 ) ( not ( = ?auto_666 ?auto_672 ) ) ( not ( = ?auto_670 ?auto_672 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_668 ?auto_672 ?auto_666 ?auto_669 )
      ( DELIVER-2PKG ?auto_671 ?auto_667 ?auto_666 )
      ( DELIVER-1PKG-VERIFY ?auto_667 ?auto_666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_674 - OBJ
      ?auto_675 - OBJ
      ?auto_673 - LOCATION
    )
    :vars
    (
      ?auto_676 - LOCATION
      ?auto_679 - CITY
      ?auto_678 - TRUCK
      ?auto_677 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_676 ?auto_679 ) ( IN-CITY ?auto_673 ?auto_679 ) ( not ( = ?auto_673 ?auto_676 ) ) ( not ( = ?auto_674 ?auto_675 ) ) ( OBJ-AT ?auto_675 ?auto_676 ) ( IN-TRUCK ?auto_674 ?auto_678 ) ( TRUCK-AT ?auto_678 ?auto_677 ) ( IN-CITY ?auto_677 ?auto_679 ) ( not ( = ?auto_673 ?auto_677 ) ) ( not ( = ?auto_676 ?auto_677 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_675 ?auto_673 )
      ( DELIVER-2PKG-VERIFY ?auto_674 ?auto_675 ?auto_673 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_681 - OBJ
      ?auto_682 - OBJ
      ?auto_680 - LOCATION
    )
    :vars
    (
      ?auto_684 - LOCATION
      ?auto_683 - CITY
      ?auto_685 - TRUCK
      ?auto_686 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_684 ?auto_683 ) ( IN-CITY ?auto_680 ?auto_683 ) ( not ( = ?auto_680 ?auto_684 ) ) ( not ( = ?auto_682 ?auto_681 ) ) ( OBJ-AT ?auto_681 ?auto_684 ) ( IN-TRUCK ?auto_682 ?auto_685 ) ( TRUCK-AT ?auto_685 ?auto_686 ) ( IN-CITY ?auto_686 ?auto_683 ) ( not ( = ?auto_680 ?auto_686 ) ) ( not ( = ?auto_684 ?auto_686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_682 ?auto_681 ?auto_680 )
      ( DELIVER-2PKG-VERIFY ?auto_681 ?auto_682 ?auto_680 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_696 - OBJ
      ?auto_695 - LOCATION
    )
    :vars
    (
      ?auto_699 - LOCATION
      ?auto_698 - CITY
      ?auto_697 - OBJ
      ?auto_700 - TRUCK
      ?auto_701 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_699 ?auto_698 ) ( IN-CITY ?auto_695 ?auto_698 ) ( not ( = ?auto_695 ?auto_699 ) ) ( not ( = ?auto_697 ?auto_696 ) ) ( OBJ-AT ?auto_696 ?auto_699 ) ( TRUCK-AT ?auto_700 ?auto_701 ) ( IN-CITY ?auto_701 ?auto_698 ) ( not ( = ?auto_695 ?auto_701 ) ) ( not ( = ?auto_699 ?auto_701 ) ) ( OBJ-AT ?auto_697 ?auto_701 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_697 ?auto_700 ?auto_701 )
      ( DELIVER-2PKG ?auto_697 ?auto_696 ?auto_695 )
      ( DELIVER-1PKG-VERIFY ?auto_696 ?auto_695 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_703 - OBJ
      ?auto_704 - OBJ
      ?auto_702 - LOCATION
    )
    :vars
    (
      ?auto_705 - LOCATION
      ?auto_707 - CITY
      ?auto_708 - TRUCK
      ?auto_706 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_705 ?auto_707 ) ( IN-CITY ?auto_702 ?auto_707 ) ( not ( = ?auto_702 ?auto_705 ) ) ( not ( = ?auto_703 ?auto_704 ) ) ( OBJ-AT ?auto_704 ?auto_705 ) ( TRUCK-AT ?auto_708 ?auto_706 ) ( IN-CITY ?auto_706 ?auto_707 ) ( not ( = ?auto_702 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_706 ) ) ( OBJ-AT ?auto_703 ?auto_706 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_704 ?auto_702 )
      ( DELIVER-2PKG-VERIFY ?auto_703 ?auto_704 ?auto_702 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_710 - OBJ
      ?auto_711 - OBJ
      ?auto_709 - LOCATION
    )
    :vars
    (
      ?auto_715 - LOCATION
      ?auto_713 - CITY
      ?auto_714 - TRUCK
      ?auto_712 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_715 ?auto_713 ) ( IN-CITY ?auto_709 ?auto_713 ) ( not ( = ?auto_709 ?auto_715 ) ) ( not ( = ?auto_711 ?auto_710 ) ) ( OBJ-AT ?auto_710 ?auto_715 ) ( TRUCK-AT ?auto_714 ?auto_712 ) ( IN-CITY ?auto_712 ?auto_713 ) ( not ( = ?auto_709 ?auto_712 ) ) ( not ( = ?auto_715 ?auto_712 ) ) ( OBJ-AT ?auto_711 ?auto_712 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_711 ?auto_710 ?auto_709 )
      ( DELIVER-2PKG-VERIFY ?auto_710 ?auto_711 ?auto_709 ) )
  )

)

