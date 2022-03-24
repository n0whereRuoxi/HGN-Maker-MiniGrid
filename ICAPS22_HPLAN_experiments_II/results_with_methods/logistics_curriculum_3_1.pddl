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
      ?auto_538 - OBJ
      ?auto_537 - LOCATION
    )
    :vars
    (
      ?auto_540 - LOCATION
      ?auto_541 - CITY
      ?auto_539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_540 ?auto_541 ) ( IN-CITY ?auto_537 ?auto_541 ) ( not ( = ?auto_537 ?auto_540 ) ) ( OBJ-AT ?auto_538 ?auto_540 ) ( TRUCK-AT ?auto_539 ?auto_537 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_539 ?auto_537 ?auto_540 ?auto_541 )
      ( !LOAD-TRUCK ?auto_538 ?auto_539 ?auto_540 )
      ( !DRIVE-TRUCK ?auto_539 ?auto_540 ?auto_537 ?auto_541 )
      ( !UNLOAD-TRUCK ?auto_538 ?auto_539 ?auto_537 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_545 - OBJ
      ?auto_544 - LOCATION
    )
    :vars
    (
      ?auto_547 - LOCATION
      ?auto_548 - CITY
      ?auto_546 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_547 ?auto_548 ) ( IN-CITY ?auto_544 ?auto_548 ) ( not ( = ?auto_544 ?auto_547 ) ) ( OBJ-AT ?auto_545 ?auto_547 ) ( TRUCK-AT ?auto_546 ?auto_544 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_546 ?auto_544 ?auto_547 ?auto_548 )
      ( !LOAD-TRUCK ?auto_545 ?auto_546 ?auto_547 )
      ( !DRIVE-TRUCK ?auto_546 ?auto_547 ?auto_544 ?auto_548 )
      ( !UNLOAD-TRUCK ?auto_545 ?auto_546 ?auto_544 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_559 - OBJ
      ?auto_560 - OBJ
      ?auto_558 - LOCATION
    )
    :vars
    (
      ?auto_561 - LOCATION
      ?auto_562 - CITY
      ?auto_563 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_561 ?auto_562 ) ( IN-CITY ?auto_558 ?auto_562 ) ( not ( = ?auto_558 ?auto_561 ) ) ( OBJ-AT ?auto_560 ?auto_561 ) ( OBJ-AT ?auto_559 ?auto_561 ) ( TRUCK-AT ?auto_563 ?auto_558 ) ( not ( = ?auto_559 ?auto_560 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_559 ?auto_558 )
      ( DELIVER-1PKG ?auto_560 ?auto_558 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_565 - OBJ
      ?auto_566 - OBJ
      ?auto_564 - LOCATION
    )
    :vars
    (
      ?auto_569 - LOCATION
      ?auto_568 - CITY
      ?auto_567 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_569 ?auto_568 ) ( IN-CITY ?auto_564 ?auto_568 ) ( not ( = ?auto_564 ?auto_569 ) ) ( OBJ-AT ?auto_565 ?auto_569 ) ( OBJ-AT ?auto_566 ?auto_569 ) ( TRUCK-AT ?auto_567 ?auto_564 ) ( not ( = ?auto_566 ?auto_565 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_566 ?auto_565 ?auto_564 ) )
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
      ( !UNLOAD-TRUCK ?auto_580 ?auto_581 ?auto_579 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_669 - OBJ
      ?auto_670 - OBJ
      ?auto_671 - OBJ
      ?auto_668 - LOCATION
    )
    :vars
    (
      ?auto_674 - LOCATION
      ?auto_672 - CITY
      ?auto_673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_674 ?auto_672 ) ( IN-CITY ?auto_668 ?auto_672 ) ( not ( = ?auto_668 ?auto_674 ) ) ( OBJ-AT ?auto_671 ?auto_674 ) ( OBJ-AT ?auto_670 ?auto_674 ) ( OBJ-AT ?auto_669 ?auto_674 ) ( TRUCK-AT ?auto_673 ?auto_668 ) ( not ( = ?auto_669 ?auto_670 ) ) ( not ( = ?auto_669 ?auto_671 ) ) ( not ( = ?auto_670 ?auto_671 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_670 ?auto_669 ?auto_668 )
      ( DELIVER-1PKG ?auto_671 ?auto_668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_684 - OBJ
      ?auto_685 - OBJ
      ?auto_686 - OBJ
      ?auto_683 - LOCATION
    )
    :vars
    (
      ?auto_688 - LOCATION
      ?auto_689 - CITY
      ?auto_687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_688 ?auto_689 ) ( IN-CITY ?auto_683 ?auto_689 ) ( not ( = ?auto_683 ?auto_688 ) ) ( OBJ-AT ?auto_685 ?auto_688 ) ( OBJ-AT ?auto_686 ?auto_688 ) ( OBJ-AT ?auto_684 ?auto_688 ) ( TRUCK-AT ?auto_687 ?auto_683 ) ( not ( = ?auto_684 ?auto_686 ) ) ( not ( = ?auto_684 ?auto_685 ) ) ( not ( = ?auto_686 ?auto_685 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_684 ?auto_686 ?auto_685 ?auto_683 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_699 - OBJ
      ?auto_700 - OBJ
      ?auto_701 - OBJ
      ?auto_698 - LOCATION
    )
    :vars
    (
      ?auto_704 - LOCATION
      ?auto_702 - CITY
      ?auto_703 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_704 ?auto_702 ) ( IN-CITY ?auto_698 ?auto_702 ) ( not ( = ?auto_698 ?auto_704 ) ) ( OBJ-AT ?auto_701 ?auto_704 ) ( OBJ-AT ?auto_699 ?auto_704 ) ( OBJ-AT ?auto_700 ?auto_704 ) ( TRUCK-AT ?auto_703 ?auto_698 ) ( not ( = ?auto_700 ?auto_699 ) ) ( not ( = ?auto_700 ?auto_701 ) ) ( not ( = ?auto_699 ?auto_701 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_700 ?auto_701 ?auto_699 ?auto_698 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_714 - OBJ
      ?auto_715 - OBJ
      ?auto_716 - OBJ
      ?auto_713 - LOCATION
    )
    :vars
    (
      ?auto_719 - LOCATION
      ?auto_717 - CITY
      ?auto_718 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_719 ?auto_717 ) ( IN-CITY ?auto_713 ?auto_717 ) ( not ( = ?auto_713 ?auto_719 ) ) ( OBJ-AT ?auto_715 ?auto_719 ) ( OBJ-AT ?auto_714 ?auto_719 ) ( OBJ-AT ?auto_716 ?auto_719 ) ( TRUCK-AT ?auto_718 ?auto_713 ) ( not ( = ?auto_716 ?auto_714 ) ) ( not ( = ?auto_716 ?auto_715 ) ) ( not ( = ?auto_714 ?auto_715 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_716 ?auto_715 ?auto_714 ?auto_713 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_745 - OBJ
      ?auto_746 - OBJ
      ?auto_747 - OBJ
      ?auto_744 - LOCATION
    )
    :vars
    (
      ?auto_750 - LOCATION
      ?auto_748 - CITY
      ?auto_749 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_750 ?auto_748 ) ( IN-CITY ?auto_744 ?auto_748 ) ( not ( = ?auto_744 ?auto_750 ) ) ( OBJ-AT ?auto_745 ?auto_750 ) ( OBJ-AT ?auto_747 ?auto_750 ) ( OBJ-AT ?auto_746 ?auto_750 ) ( TRUCK-AT ?auto_749 ?auto_744 ) ( not ( = ?auto_746 ?auto_747 ) ) ( not ( = ?auto_746 ?auto_745 ) ) ( not ( = ?auto_747 ?auto_745 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_746 ?auto_745 ?auto_747 ?auto_744 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_760 - OBJ
      ?auto_761 - OBJ
      ?auto_762 - OBJ
      ?auto_759 - LOCATION
    )
    :vars
    (
      ?auto_765 - LOCATION
      ?auto_763 - CITY
      ?auto_764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_765 ?auto_763 ) ( IN-CITY ?auto_759 ?auto_763 ) ( not ( = ?auto_759 ?auto_765 ) ) ( OBJ-AT ?auto_760 ?auto_765 ) ( OBJ-AT ?auto_761 ?auto_765 ) ( OBJ-AT ?auto_762 ?auto_765 ) ( TRUCK-AT ?auto_764 ?auto_759 ) ( not ( = ?auto_762 ?auto_761 ) ) ( not ( = ?auto_762 ?auto_760 ) ) ( not ( = ?auto_761 ?auto_760 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_762 ?auto_760 ?auto_761 ?auto_759 ) )
  )

)

