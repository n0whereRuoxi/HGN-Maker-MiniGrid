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
    ( ( !UNLOAD-TRUCK ?auto_502 ?auto_503 ?auto_501 ) )
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
      ( DELIVER-1PKG ?auto_509 ?auto_508 ) )
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
      ( DELIVER-1PKG ?auto_520 ?auto_519 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_531 - OBJ
      ?auto_530 - LOCATION
    )
    :vars
    (
      ?auto_533 - LOCATION
      ?auto_532 - CITY
      ?auto_534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_533 ?auto_532 ) ( IN-CITY ?auto_530 ?auto_532 ) ( not ( = ?auto_530 ?auto_533 ) ) ( OBJ-AT ?auto_531 ?auto_533 ) ( TRUCK-AT ?auto_534 ?auto_530 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_534 ?auto_530 ?auto_533 ?auto_532 )
      ( DELIVER-1PKG ?auto_531 ?auto_530 ) )
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
    ( ( DELIVER-1PKG ?auto_557 ?auto_555 ) )
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
    ( ( DELIVER-1PKG ?auto_560 ?auto_559 ) )
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
      ?auto_575 - TRUCK
      ?auto_577 - LOCATION
      ?auto_576 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_574 ?auto_575 ) ( TRUCK-AT ?auto_575 ?auto_577 ) ( IN-CITY ?auto_577 ?auto_576 ) ( IN-CITY ?auto_572 ?auto_576 ) ( not ( = ?auto_572 ?auto_577 ) ) ( OBJ-AT ?auto_573 ?auto_572 ) ( not ( = ?auto_573 ?auto_574 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_574 ?auto_572 ) )
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
    ( ( DELIVER-2PKG ?auto_580 ?auto_579 ?auto_578 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_592 - OBJ
      ?auto_591 - LOCATION
    )
    :vars
    (
      ?auto_594 - TRUCK
      ?auto_593 - LOCATION
      ?auto_596 - CITY
      ?auto_595 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_594 ?auto_593 ) ( IN-CITY ?auto_593 ?auto_596 ) ( IN-CITY ?auto_591 ?auto_596 ) ( not ( = ?auto_591 ?auto_593 ) ) ( OBJ-AT ?auto_595 ?auto_591 ) ( not ( = ?auto_595 ?auto_592 ) ) ( OBJ-AT ?auto_592 ?auto_593 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_592 ?auto_594 ?auto_593 )
      ( DELIVER-2PKG ?auto_595 ?auto_592 ?auto_591 ) )
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
      ?auto_600 - TRUCK
      ?auto_601 - LOCATION
      ?auto_602 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_600 ?auto_601 ) ( IN-CITY ?auto_601 ?auto_602 ) ( IN-CITY ?auto_597 ?auto_602 ) ( not ( = ?auto_597 ?auto_601 ) ) ( OBJ-AT ?auto_598 ?auto_597 ) ( not ( = ?auto_598 ?auto_599 ) ) ( OBJ-AT ?auto_599 ?auto_601 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_599 ?auto_597 ) )
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
      ?auto_608 - TRUCK
      ?auto_606 - LOCATION
      ?auto_607 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_608 ?auto_606 ) ( IN-CITY ?auto_606 ?auto_607 ) ( IN-CITY ?auto_603 ?auto_607 ) ( not ( = ?auto_603 ?auto_606 ) ) ( OBJ-AT ?auto_605 ?auto_603 ) ( not ( = ?auto_605 ?auto_604 ) ) ( OBJ-AT ?auto_604 ?auto_606 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_605 ?auto_604 ?auto_603 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_617 - OBJ
      ?auto_616 - LOCATION
    )
    :vars
    (
      ?auto_618 - LOCATION
      ?auto_619 - CITY
      ?auto_621 - OBJ
      ?auto_620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_618 ?auto_619 ) ( IN-CITY ?auto_616 ?auto_619 ) ( not ( = ?auto_616 ?auto_618 ) ) ( OBJ-AT ?auto_621 ?auto_616 ) ( not ( = ?auto_621 ?auto_617 ) ) ( OBJ-AT ?auto_617 ?auto_618 ) ( TRUCK-AT ?auto_620 ?auto_616 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_620 ?auto_616 ?auto_618 ?auto_619 )
      ( DELIVER-2PKG ?auto_621 ?auto_617 ?auto_616 ) )
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
    ( ( DELIVER-1PKG ?auto_624 ?auto_622 ) )
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
      ?auto_631 - LOCATION
      ?auto_632 - CITY
      ?auto_633 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_631 ?auto_632 ) ( IN-CITY ?auto_628 ?auto_632 ) ( not ( = ?auto_628 ?auto_631 ) ) ( OBJ-AT ?auto_630 ?auto_628 ) ( not ( = ?auto_630 ?auto_629 ) ) ( OBJ-AT ?auto_629 ?auto_631 ) ( TRUCK-AT ?auto_633 ?auto_628 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_630 ?auto_629 ?auto_628 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_642 - OBJ
      ?auto_641 - LOCATION
    )
    :vars
    (
      ?auto_643 - LOCATION
      ?auto_644 - CITY
      ?auto_646 - OBJ
      ?auto_645 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_643 ?auto_644 ) ( IN-CITY ?auto_641 ?auto_644 ) ( not ( = ?auto_641 ?auto_643 ) ) ( not ( = ?auto_646 ?auto_642 ) ) ( OBJ-AT ?auto_642 ?auto_643 ) ( TRUCK-AT ?auto_645 ?auto_641 ) ( IN-TRUCK ?auto_646 ?auto_645 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_646 ?auto_641 )
      ( DELIVER-2PKG ?auto_646 ?auto_642 ?auto_641 ) )
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
      ?auto_650 - LOCATION
      ?auto_652 - CITY
      ?auto_651 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_650 ?auto_652 ) ( IN-CITY ?auto_647 ?auto_652 ) ( not ( = ?auto_647 ?auto_650 ) ) ( not ( = ?auto_648 ?auto_649 ) ) ( OBJ-AT ?auto_649 ?auto_650 ) ( TRUCK-AT ?auto_651 ?auto_647 ) ( IN-TRUCK ?auto_648 ?auto_651 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_649 ?auto_647 ) )
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
      ?auto_657 - LOCATION
      ?auto_656 - CITY
      ?auto_658 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_657 ?auto_656 ) ( IN-CITY ?auto_653 ?auto_656 ) ( not ( = ?auto_653 ?auto_657 ) ) ( not ( = ?auto_655 ?auto_654 ) ) ( OBJ-AT ?auto_654 ?auto_657 ) ( TRUCK-AT ?auto_658 ?auto_653 ) ( IN-TRUCK ?auto_655 ?auto_658 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_655 ?auto_654 ?auto_653 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_667 - OBJ
      ?auto_666 - LOCATION
    )
    :vars
    (
      ?auto_669 - LOCATION
      ?auto_668 - CITY
      ?auto_671 - OBJ
      ?auto_670 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_669 ?auto_668 ) ( IN-CITY ?auto_666 ?auto_668 ) ( not ( = ?auto_666 ?auto_669 ) ) ( not ( = ?auto_671 ?auto_667 ) ) ( OBJ-AT ?auto_667 ?auto_669 ) ( IN-TRUCK ?auto_671 ?auto_670 ) ( TRUCK-AT ?auto_670 ?auto_669 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_670 ?auto_669 ?auto_666 ?auto_668 )
      ( DELIVER-2PKG ?auto_671 ?auto_667 ?auto_666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_673 - OBJ
      ?auto_674 - OBJ
      ?auto_672 - LOCATION
    )
    :vars
    (
      ?auto_676 - LOCATION
      ?auto_675 - CITY
      ?auto_677 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_676 ?auto_675 ) ( IN-CITY ?auto_672 ?auto_675 ) ( not ( = ?auto_672 ?auto_676 ) ) ( not ( = ?auto_673 ?auto_674 ) ) ( OBJ-AT ?auto_674 ?auto_676 ) ( IN-TRUCK ?auto_673 ?auto_677 ) ( TRUCK-AT ?auto_677 ?auto_676 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_674 ?auto_672 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_679 - OBJ
      ?auto_680 - OBJ
      ?auto_678 - LOCATION
    )
    :vars
    (
      ?auto_682 - LOCATION
      ?auto_683 - CITY
      ?auto_681 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_682 ?auto_683 ) ( IN-CITY ?auto_678 ?auto_683 ) ( not ( = ?auto_678 ?auto_682 ) ) ( not ( = ?auto_680 ?auto_679 ) ) ( OBJ-AT ?auto_679 ?auto_682 ) ( IN-TRUCK ?auto_680 ?auto_681 ) ( TRUCK-AT ?auto_681 ?auto_682 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_680 ?auto_679 ?auto_678 ) )
  )

)

