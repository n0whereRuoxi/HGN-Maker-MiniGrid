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

  ( :method DELIVER-3PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_535 - OBJ
      ?auto_534 - LOCATION
    )
    :vars
    (
      ?auto_537 - LOCATION
      ?auto_538 - CITY
      ?auto_536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_537 ?auto_538 ) ( IN-CITY ?auto_534 ?auto_538 ) ( not ( = ?auto_534 ?auto_537 ) ) ( OBJ-AT ?auto_535 ?auto_537 ) ( TRUCK-AT ?auto_536 ?auto_534 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_536 ?auto_534 ?auto_537 ?auto_538 )
      ( !LOAD-TRUCK ?auto_535 ?auto_536 ?auto_537 )
      ( !DRIVE-TRUCK ?auto_536 ?auto_537 ?auto_534 ?auto_538 )
      ( !UNLOAD-TRUCK ?auto_535 ?auto_536 ?auto_534 )
      ( DELIVER-1PKG-VERIFY ?auto_535 ?auto_534 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_542 - OBJ
      ?auto_541 - LOCATION
    )
    :vars
    (
      ?auto_544 - LOCATION
      ?auto_545 - CITY
      ?auto_543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_544 ?auto_545 ) ( IN-CITY ?auto_541 ?auto_545 ) ( not ( = ?auto_541 ?auto_544 ) ) ( OBJ-AT ?auto_542 ?auto_544 ) ( TRUCK-AT ?auto_543 ?auto_541 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_543 ?auto_541 ?auto_544 ?auto_545 )
      ( !LOAD-TRUCK ?auto_542 ?auto_543 ?auto_544 )
      ( !DRIVE-TRUCK ?auto_543 ?auto_544 ?auto_541 ?auto_545 )
      ( !UNLOAD-TRUCK ?auto_542 ?auto_543 ?auto_541 )
      ( DELIVER-1PKG-VERIFY ?auto_542 ?auto_541 ) )
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
      ?auto_560 - LOCATION
      ?auto_559 - CITY
      ?auto_561 - LOCATION
      ?auto_558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_560 ?auto_559 ) ( IN-CITY ?auto_555 ?auto_559 ) ( not ( = ?auto_555 ?auto_560 ) ) ( OBJ-AT ?auto_557 ?auto_560 ) ( IN-CITY ?auto_561 ?auto_559 ) ( not ( = ?auto_555 ?auto_561 ) ) ( OBJ-AT ?auto_556 ?auto_561 ) ( TRUCK-AT ?auto_558 ?auto_555 ) ( not ( = ?auto_556 ?auto_557 ) ) ( not ( = ?auto_560 ?auto_561 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_556 ?auto_555 )
      ( DELIVER-1PKG ?auto_557 ?auto_555 )
      ( DELIVER-2PKG-VERIFY ?auto_556 ?auto_557 ?auto_555 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_563 - OBJ
      ?auto_564 - OBJ
      ?auto_562 - LOCATION
    )
    :vars
    (
      ?auto_567 - LOCATION
      ?auto_568 - CITY
      ?auto_565 - LOCATION
      ?auto_566 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_567 ?auto_568 ) ( IN-CITY ?auto_562 ?auto_568 ) ( not ( = ?auto_562 ?auto_567 ) ) ( OBJ-AT ?auto_563 ?auto_567 ) ( IN-CITY ?auto_565 ?auto_568 ) ( not ( = ?auto_562 ?auto_565 ) ) ( OBJ-AT ?auto_564 ?auto_565 ) ( TRUCK-AT ?auto_566 ?auto_562 ) ( not ( = ?auto_564 ?auto_563 ) ) ( not ( = ?auto_567 ?auto_565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_564 ?auto_563 ?auto_562 )
      ( DELIVER-2PKG-VERIFY ?auto_563 ?auto_564 ?auto_562 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_580 - OBJ
      ?auto_579 - LOCATION
    )
    :vars
    (
      ?auto_582 - LOCATION
      ?auto_583 - CITY
      ?auto_581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_582 ?auto_583 ) ( IN-CITY ?auto_579 ?auto_583 ) ( not ( = ?auto_579 ?auto_582 ) ) ( OBJ-AT ?auto_580 ?auto_582 ) ( TRUCK-AT ?auto_581 ?auto_579 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_581 ?auto_579 ?auto_582 ?auto_583 )
      ( !LOAD-TRUCK ?auto_580 ?auto_581 ?auto_582 )
      ( !DRIVE-TRUCK ?auto_581 ?auto_582 ?auto_579 ?auto_583 )
      ( !UNLOAD-TRUCK ?auto_580 ?auto_581 ?auto_579 )
      ( DELIVER-1PKG-VERIFY ?auto_580 ?auto_579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_670 - OBJ
      ?auto_671 - OBJ
      ?auto_672 - OBJ
      ?auto_669 - LOCATION
    )
    :vars
    (
      ?auto_674 - LOCATION
      ?auto_673 - CITY
      ?auto_676 - LOCATION
      ?auto_675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_674 ?auto_673 ) ( IN-CITY ?auto_669 ?auto_673 ) ( not ( = ?auto_669 ?auto_674 ) ) ( OBJ-AT ?auto_672 ?auto_674 ) ( OBJ-AT ?auto_671 ?auto_674 ) ( IN-CITY ?auto_676 ?auto_673 ) ( not ( = ?auto_669 ?auto_676 ) ) ( OBJ-AT ?auto_670 ?auto_676 ) ( TRUCK-AT ?auto_675 ?auto_669 ) ( not ( = ?auto_670 ?auto_671 ) ) ( not ( = ?auto_674 ?auto_676 ) ) ( not ( = ?auto_670 ?auto_672 ) ) ( not ( = ?auto_671 ?auto_672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_671 ?auto_670 ?auto_669 )
      ( DELIVER-1PKG ?auto_672 ?auto_669 )
      ( DELIVER-3PKG-VERIFY ?auto_670 ?auto_671 ?auto_672 ?auto_669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_687 - OBJ
      ?auto_688 - OBJ
      ?auto_689 - OBJ
      ?auto_686 - LOCATION
    )
    :vars
    (
      ?auto_692 - LOCATION
      ?auto_690 - CITY
      ?auto_691 - LOCATION
      ?auto_693 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_692 ?auto_690 ) ( IN-CITY ?auto_686 ?auto_690 ) ( not ( = ?auto_686 ?auto_692 ) ) ( OBJ-AT ?auto_688 ?auto_692 ) ( OBJ-AT ?auto_689 ?auto_692 ) ( IN-CITY ?auto_691 ?auto_690 ) ( not ( = ?auto_686 ?auto_691 ) ) ( OBJ-AT ?auto_687 ?auto_691 ) ( TRUCK-AT ?auto_693 ?auto_686 ) ( not ( = ?auto_687 ?auto_689 ) ) ( not ( = ?auto_692 ?auto_691 ) ) ( not ( = ?auto_687 ?auto_688 ) ) ( not ( = ?auto_689 ?auto_688 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_687 ?auto_689 ?auto_688 ?auto_686 )
      ( DELIVER-3PKG-VERIFY ?auto_687 ?auto_688 ?auto_689 ?auto_686 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_704 - OBJ
      ?auto_705 - OBJ
      ?auto_706 - OBJ
      ?auto_703 - LOCATION
    )
    :vars
    (
      ?auto_710 - LOCATION
      ?auto_708 - CITY
      ?auto_707 - LOCATION
      ?auto_709 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_710 ?auto_708 ) ( IN-CITY ?auto_703 ?auto_708 ) ( not ( = ?auto_703 ?auto_710 ) ) ( OBJ-AT ?auto_706 ?auto_710 ) ( OBJ-AT ?auto_704 ?auto_710 ) ( IN-CITY ?auto_707 ?auto_708 ) ( not ( = ?auto_703 ?auto_707 ) ) ( OBJ-AT ?auto_705 ?auto_707 ) ( TRUCK-AT ?auto_709 ?auto_703 ) ( not ( = ?auto_705 ?auto_704 ) ) ( not ( = ?auto_710 ?auto_707 ) ) ( not ( = ?auto_705 ?auto_706 ) ) ( not ( = ?auto_704 ?auto_706 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_705 ?auto_706 ?auto_704 ?auto_703 )
      ( DELIVER-3PKG-VERIFY ?auto_704 ?auto_705 ?auto_706 ?auto_703 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_721 - OBJ
      ?auto_722 - OBJ
      ?auto_723 - OBJ
      ?auto_720 - LOCATION
    )
    :vars
    (
      ?auto_727 - LOCATION
      ?auto_725 - CITY
      ?auto_724 - LOCATION
      ?auto_726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_727 ?auto_725 ) ( IN-CITY ?auto_720 ?auto_725 ) ( not ( = ?auto_720 ?auto_727 ) ) ( OBJ-AT ?auto_722 ?auto_727 ) ( OBJ-AT ?auto_721 ?auto_727 ) ( IN-CITY ?auto_724 ?auto_725 ) ( not ( = ?auto_720 ?auto_724 ) ) ( OBJ-AT ?auto_723 ?auto_724 ) ( TRUCK-AT ?auto_726 ?auto_720 ) ( not ( = ?auto_723 ?auto_721 ) ) ( not ( = ?auto_727 ?auto_724 ) ) ( not ( = ?auto_723 ?auto_722 ) ) ( not ( = ?auto_721 ?auto_722 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_723 ?auto_722 ?auto_721 ?auto_720 )
      ( DELIVER-3PKG-VERIFY ?auto_721 ?auto_722 ?auto_723 ?auto_720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_756 - OBJ
      ?auto_757 - OBJ
      ?auto_758 - OBJ
      ?auto_755 - LOCATION
    )
    :vars
    (
      ?auto_762 - LOCATION
      ?auto_760 - CITY
      ?auto_759 - LOCATION
      ?auto_761 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_762 ?auto_760 ) ( IN-CITY ?auto_755 ?auto_760 ) ( not ( = ?auto_755 ?auto_762 ) ) ( OBJ-AT ?auto_756 ?auto_762 ) ( OBJ-AT ?auto_758 ?auto_762 ) ( IN-CITY ?auto_759 ?auto_760 ) ( not ( = ?auto_755 ?auto_759 ) ) ( OBJ-AT ?auto_757 ?auto_759 ) ( TRUCK-AT ?auto_761 ?auto_755 ) ( not ( = ?auto_757 ?auto_758 ) ) ( not ( = ?auto_762 ?auto_759 ) ) ( not ( = ?auto_757 ?auto_756 ) ) ( not ( = ?auto_758 ?auto_756 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_757 ?auto_756 ?auto_758 ?auto_755 )
      ( DELIVER-3PKG-VERIFY ?auto_756 ?auto_757 ?auto_758 ?auto_755 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_773 - OBJ
      ?auto_774 - OBJ
      ?auto_775 - OBJ
      ?auto_772 - LOCATION
    )
    :vars
    (
      ?auto_779 - LOCATION
      ?auto_777 - CITY
      ?auto_776 - LOCATION
      ?auto_778 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_779 ?auto_777 ) ( IN-CITY ?auto_772 ?auto_777 ) ( not ( = ?auto_772 ?auto_779 ) ) ( OBJ-AT ?auto_773 ?auto_779 ) ( OBJ-AT ?auto_774 ?auto_779 ) ( IN-CITY ?auto_776 ?auto_777 ) ( not ( = ?auto_772 ?auto_776 ) ) ( OBJ-AT ?auto_775 ?auto_776 ) ( TRUCK-AT ?auto_778 ?auto_772 ) ( not ( = ?auto_775 ?auto_774 ) ) ( not ( = ?auto_779 ?auto_776 ) ) ( not ( = ?auto_775 ?auto_773 ) ) ( not ( = ?auto_774 ?auto_773 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_775 ?auto_773 ?auto_774 ?auto_772 )
      ( DELIVER-3PKG-VERIFY ?auto_773 ?auto_774 ?auto_775 ?auto_772 ) )
  )

)

