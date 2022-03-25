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
      ?auto_519 - OBJ
      ?auto_518 - LOCATION
    )
    :vars
    (
      ?auto_521 - LOCATION
      ?auto_522 - CITY
      ?auto_520 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_521 ?auto_522 ) ( IN-CITY ?auto_518 ?auto_522 ) ( not ( = ?auto_518 ?auto_521 ) ) ( OBJ-AT ?auto_519 ?auto_521 ) ( TRUCK-AT ?auto_520 ?auto_518 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_520 ?auto_518 ?auto_521 ?auto_522 )
      ( !LOAD-TRUCK ?auto_519 ?auto_520 ?auto_521 )
      ( !DRIVE-TRUCK ?auto_520 ?auto_521 ?auto_518 ?auto_522 )
      ( !UNLOAD-TRUCK ?auto_519 ?auto_520 ?auto_518 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_526 - OBJ
      ?auto_525 - LOCATION
    )
    :vars
    (
      ?auto_528 - LOCATION
      ?auto_529 - CITY
      ?auto_527 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_528 ?auto_529 ) ( IN-CITY ?auto_525 ?auto_529 ) ( not ( = ?auto_525 ?auto_528 ) ) ( OBJ-AT ?auto_526 ?auto_528 ) ( TRUCK-AT ?auto_527 ?auto_525 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_527 ?auto_525 ?auto_528 ?auto_529 )
      ( !LOAD-TRUCK ?auto_526 ?auto_527 ?auto_528 )
      ( !DRIVE-TRUCK ?auto_527 ?auto_528 ?auto_525 ?auto_529 )
      ( !UNLOAD-TRUCK ?auto_526 ?auto_527 ?auto_525 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_540 - OBJ
      ?auto_541 - OBJ
      ?auto_539 - LOCATION
    )
    :vars
    (
      ?auto_542 - LOCATION
      ?auto_544 - CITY
      ?auto_545 - LOCATION
      ?auto_543 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_542 ?auto_544 ) ( IN-CITY ?auto_539 ?auto_544 ) ( not ( = ?auto_539 ?auto_542 ) ) ( OBJ-AT ?auto_541 ?auto_542 ) ( IN-CITY ?auto_545 ?auto_544 ) ( not ( = ?auto_539 ?auto_545 ) ) ( OBJ-AT ?auto_540 ?auto_545 ) ( TRUCK-AT ?auto_543 ?auto_539 ) ( not ( = ?auto_540 ?auto_541 ) ) ( not ( = ?auto_542 ?auto_545 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_540 ?auto_539 )
      ( DELIVER-1PKG ?auto_541 ?auto_539 ) )
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
      ?auto_550 - LOCATION
      ?auto_552 - CITY
      ?auto_551 - LOCATION
      ?auto_549 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_550 ?auto_552 ) ( IN-CITY ?auto_546 ?auto_552 ) ( not ( = ?auto_546 ?auto_550 ) ) ( OBJ-AT ?auto_547 ?auto_550 ) ( IN-CITY ?auto_551 ?auto_552 ) ( not ( = ?auto_546 ?auto_551 ) ) ( OBJ-AT ?auto_548 ?auto_551 ) ( TRUCK-AT ?auto_549 ?auto_546 ) ( not ( = ?auto_548 ?auto_547 ) ) ( not ( = ?auto_550 ?auto_551 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_548 ?auto_547 ?auto_546 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_564 - OBJ
      ?auto_563 - LOCATION
    )
    :vars
    (
      ?auto_566 - LOCATION
      ?auto_567 - CITY
      ?auto_565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_566 ?auto_567 ) ( IN-CITY ?auto_563 ?auto_567 ) ( not ( = ?auto_563 ?auto_566 ) ) ( OBJ-AT ?auto_564 ?auto_566 ) ( TRUCK-AT ?auto_565 ?auto_563 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_565 ?auto_563 ?auto_566 ?auto_567 )
      ( !LOAD-TRUCK ?auto_564 ?auto_565 ?auto_566 )
      ( !DRIVE-TRUCK ?auto_565 ?auto_566 ?auto_563 ?auto_567 )
      ( !UNLOAD-TRUCK ?auto_564 ?auto_565 ?auto_563 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_654 - OBJ
      ?auto_655 - OBJ
      ?auto_656 - OBJ
      ?auto_653 - LOCATION
    )
    :vars
    (
      ?auto_658 - LOCATION
      ?auto_659 - CITY
      ?auto_660 - LOCATION
      ?auto_657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_658 ?auto_659 ) ( IN-CITY ?auto_653 ?auto_659 ) ( not ( = ?auto_653 ?auto_658 ) ) ( OBJ-AT ?auto_656 ?auto_658 ) ( IN-CITY ?auto_660 ?auto_659 ) ( not ( = ?auto_653 ?auto_660 ) ) ( OBJ-AT ?auto_655 ?auto_660 ) ( OBJ-AT ?auto_654 ?auto_658 ) ( TRUCK-AT ?auto_657 ?auto_653 ) ( not ( = ?auto_654 ?auto_655 ) ) ( not ( = ?auto_660 ?auto_658 ) ) ( not ( = ?auto_654 ?auto_656 ) ) ( not ( = ?auto_655 ?auto_656 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_655 ?auto_654 ?auto_653 )
      ( DELIVER-1PKG ?auto_656 ?auto_653 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_671 - OBJ
      ?auto_672 - OBJ
      ?auto_673 - OBJ
      ?auto_670 - LOCATION
    )
    :vars
    (
      ?auto_675 - LOCATION
      ?auto_677 - CITY
      ?auto_676 - LOCATION
      ?auto_674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_675 ?auto_677 ) ( IN-CITY ?auto_670 ?auto_677 ) ( not ( = ?auto_670 ?auto_675 ) ) ( OBJ-AT ?auto_672 ?auto_675 ) ( IN-CITY ?auto_676 ?auto_677 ) ( not ( = ?auto_670 ?auto_676 ) ) ( OBJ-AT ?auto_673 ?auto_676 ) ( OBJ-AT ?auto_671 ?auto_675 ) ( TRUCK-AT ?auto_674 ?auto_670 ) ( not ( = ?auto_671 ?auto_673 ) ) ( not ( = ?auto_676 ?auto_675 ) ) ( not ( = ?auto_671 ?auto_672 ) ) ( not ( = ?auto_673 ?auto_672 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_671 ?auto_673 ?auto_672 ?auto_670 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_688 - OBJ
      ?auto_689 - OBJ
      ?auto_690 - OBJ
      ?auto_687 - LOCATION
    )
    :vars
    (
      ?auto_691 - LOCATION
      ?auto_692 - CITY
      ?auto_693 - LOCATION
      ?auto_694 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_691 ?auto_692 ) ( IN-CITY ?auto_687 ?auto_692 ) ( not ( = ?auto_687 ?auto_691 ) ) ( OBJ-AT ?auto_690 ?auto_691 ) ( IN-CITY ?auto_693 ?auto_692 ) ( not ( = ?auto_687 ?auto_693 ) ) ( OBJ-AT ?auto_688 ?auto_693 ) ( OBJ-AT ?auto_689 ?auto_691 ) ( TRUCK-AT ?auto_694 ?auto_687 ) ( not ( = ?auto_689 ?auto_688 ) ) ( not ( = ?auto_693 ?auto_691 ) ) ( not ( = ?auto_689 ?auto_690 ) ) ( not ( = ?auto_688 ?auto_690 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_689 ?auto_690 ?auto_688 ?auto_687 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_705 - OBJ
      ?auto_706 - OBJ
      ?auto_707 - OBJ
      ?auto_704 - LOCATION
    )
    :vars
    (
      ?auto_708 - LOCATION
      ?auto_709 - CITY
      ?auto_710 - LOCATION
      ?auto_711 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_708 ?auto_709 ) ( IN-CITY ?auto_704 ?auto_709 ) ( not ( = ?auto_704 ?auto_708 ) ) ( OBJ-AT ?auto_706 ?auto_708 ) ( IN-CITY ?auto_710 ?auto_709 ) ( not ( = ?auto_704 ?auto_710 ) ) ( OBJ-AT ?auto_705 ?auto_710 ) ( OBJ-AT ?auto_707 ?auto_708 ) ( TRUCK-AT ?auto_711 ?auto_704 ) ( not ( = ?auto_707 ?auto_705 ) ) ( not ( = ?auto_710 ?auto_708 ) ) ( not ( = ?auto_707 ?auto_706 ) ) ( not ( = ?auto_705 ?auto_706 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_707 ?auto_706 ?auto_705 ?auto_704 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_740 - OBJ
      ?auto_741 - OBJ
      ?auto_742 - OBJ
      ?auto_739 - LOCATION
    )
    :vars
    (
      ?auto_743 - LOCATION
      ?auto_744 - CITY
      ?auto_745 - LOCATION
      ?auto_746 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_743 ?auto_744 ) ( IN-CITY ?auto_739 ?auto_744 ) ( not ( = ?auto_739 ?auto_743 ) ) ( OBJ-AT ?auto_740 ?auto_743 ) ( IN-CITY ?auto_745 ?auto_744 ) ( not ( = ?auto_739 ?auto_745 ) ) ( OBJ-AT ?auto_742 ?auto_745 ) ( OBJ-AT ?auto_741 ?auto_743 ) ( TRUCK-AT ?auto_746 ?auto_739 ) ( not ( = ?auto_741 ?auto_742 ) ) ( not ( = ?auto_745 ?auto_743 ) ) ( not ( = ?auto_741 ?auto_740 ) ) ( not ( = ?auto_742 ?auto_740 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_741 ?auto_740 ?auto_742 ?auto_739 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_757 - OBJ
      ?auto_758 - OBJ
      ?auto_759 - OBJ
      ?auto_756 - LOCATION
    )
    :vars
    (
      ?auto_760 - LOCATION
      ?auto_761 - CITY
      ?auto_762 - LOCATION
      ?auto_763 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_760 ?auto_761 ) ( IN-CITY ?auto_756 ?auto_761 ) ( not ( = ?auto_756 ?auto_760 ) ) ( OBJ-AT ?auto_757 ?auto_760 ) ( IN-CITY ?auto_762 ?auto_761 ) ( not ( = ?auto_756 ?auto_762 ) ) ( OBJ-AT ?auto_758 ?auto_762 ) ( OBJ-AT ?auto_759 ?auto_760 ) ( TRUCK-AT ?auto_763 ?auto_756 ) ( not ( = ?auto_759 ?auto_758 ) ) ( not ( = ?auto_762 ?auto_760 ) ) ( not ( = ?auto_759 ?auto_757 ) ) ( not ( = ?auto_758 ?auto_757 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_759 ?auto_757 ?auto_758 ?auto_756 ) )
  )

)

