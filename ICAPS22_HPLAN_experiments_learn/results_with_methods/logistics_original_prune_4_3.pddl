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
      ?auto_136289 - OBJ
      ?auto_136288 - LOCATION
    )
    :vars
    (
      ?auto_136290 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136290 ?auto_136288 ) ( IN-TRUCK ?auto_136289 ?auto_136290 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_136289 ?auto_136290 ?auto_136288 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136307 - OBJ
      ?auto_136306 - LOCATION
    )
    :vars
    (
      ?auto_136308 - TRUCK
      ?auto_136309 - LOCATION
      ?auto_136310 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136307 ?auto_136308 ) ( TRUCK-AT ?auto_136308 ?auto_136309 ) ( IN-CITY ?auto_136309 ?auto_136310 ) ( IN-CITY ?auto_136306 ?auto_136310 ) ( not ( = ?auto_136306 ?auto_136309 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136308 ?auto_136309 ?auto_136306 ?auto_136310 )
      ( DELIVER-1PKG ?auto_136307 ?auto_136306 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136333 - OBJ
      ?auto_136332 - LOCATION
    )
    :vars
    (
      ?auto_136335 - TRUCK
      ?auto_136334 - LOCATION
      ?auto_136336 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136335 ?auto_136334 ) ( IN-CITY ?auto_136334 ?auto_136336 ) ( IN-CITY ?auto_136332 ?auto_136336 ) ( not ( = ?auto_136332 ?auto_136334 ) ) ( OBJ-AT ?auto_136333 ?auto_136334 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136333 ?auto_136335 ?auto_136334 )
      ( DELIVER-1PKG ?auto_136333 ?auto_136332 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136359 - OBJ
      ?auto_136358 - LOCATION
    )
    :vars
    (
      ?auto_136360 - LOCATION
      ?auto_136361 - CITY
      ?auto_136362 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_136360 ?auto_136361 ) ( IN-CITY ?auto_136358 ?auto_136361 ) ( not ( = ?auto_136358 ?auto_136360 ) ) ( OBJ-AT ?auto_136359 ?auto_136360 ) ( TRUCK-AT ?auto_136362 ?auto_136358 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_136362 ?auto_136358 ?auto_136360 ?auto_136361 )
      ( DELIVER-1PKG ?auto_136359 ?auto_136358 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136502 - OBJ
      ?auto_136503 - OBJ
      ?auto_136501 - LOCATION
    )
    :vars
    (
      ?auto_136504 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136504 ?auto_136501 ) ( IN-TRUCK ?auto_136503 ?auto_136504 ) ( OBJ-AT ?auto_136502 ?auto_136501 ) ( not ( = ?auto_136502 ?auto_136503 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136503 ?auto_136501 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136506 - OBJ
      ?auto_136507 - OBJ
      ?auto_136505 - LOCATION
    )
    :vars
    (
      ?auto_136508 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136508 ?auto_136505 ) ( IN-TRUCK ?auto_136506 ?auto_136508 ) ( OBJ-AT ?auto_136507 ?auto_136505 ) ( not ( = ?auto_136506 ?auto_136507 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136506 ?auto_136505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136514 - OBJ
      ?auto_136515 - OBJ
      ?auto_136516 - OBJ
      ?auto_136513 - LOCATION
    )
    :vars
    (
      ?auto_136517 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136517 ?auto_136513 ) ( IN-TRUCK ?auto_136516 ?auto_136517 ) ( OBJ-AT ?auto_136514 ?auto_136513 ) ( OBJ-AT ?auto_136515 ?auto_136513 ) ( not ( = ?auto_136514 ?auto_136515 ) ) ( not ( = ?auto_136514 ?auto_136516 ) ) ( not ( = ?auto_136515 ?auto_136516 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136516 ?auto_136513 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136519 - OBJ
      ?auto_136520 - OBJ
      ?auto_136521 - OBJ
      ?auto_136518 - LOCATION
    )
    :vars
    (
      ?auto_136522 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136522 ?auto_136518 ) ( IN-TRUCK ?auto_136520 ?auto_136522 ) ( OBJ-AT ?auto_136519 ?auto_136518 ) ( OBJ-AT ?auto_136521 ?auto_136518 ) ( not ( = ?auto_136519 ?auto_136520 ) ) ( not ( = ?auto_136519 ?auto_136521 ) ) ( not ( = ?auto_136520 ?auto_136521 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136520 ?auto_136518 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136529 - OBJ
      ?auto_136530 - OBJ
      ?auto_136531 - OBJ
      ?auto_136528 - LOCATION
    )
    :vars
    (
      ?auto_136532 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136532 ?auto_136528 ) ( IN-TRUCK ?auto_136529 ?auto_136532 ) ( OBJ-AT ?auto_136530 ?auto_136528 ) ( OBJ-AT ?auto_136531 ?auto_136528 ) ( not ( = ?auto_136529 ?auto_136530 ) ) ( not ( = ?auto_136529 ?auto_136531 ) ) ( not ( = ?auto_136530 ?auto_136531 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136529 ?auto_136528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136549 - OBJ
      ?auto_136550 - OBJ
      ?auto_136551 - OBJ
      ?auto_136552 - OBJ
      ?auto_136548 - LOCATION
    )
    :vars
    (
      ?auto_136553 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136553 ?auto_136548 ) ( IN-TRUCK ?auto_136552 ?auto_136553 ) ( OBJ-AT ?auto_136549 ?auto_136548 ) ( OBJ-AT ?auto_136550 ?auto_136548 ) ( OBJ-AT ?auto_136551 ?auto_136548 ) ( not ( = ?auto_136549 ?auto_136550 ) ) ( not ( = ?auto_136549 ?auto_136551 ) ) ( not ( = ?auto_136549 ?auto_136552 ) ) ( not ( = ?auto_136550 ?auto_136551 ) ) ( not ( = ?auto_136550 ?auto_136552 ) ) ( not ( = ?auto_136551 ?auto_136552 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136552 ?auto_136548 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136555 - OBJ
      ?auto_136556 - OBJ
      ?auto_136557 - OBJ
      ?auto_136558 - OBJ
      ?auto_136554 - LOCATION
    )
    :vars
    (
      ?auto_136559 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136559 ?auto_136554 ) ( IN-TRUCK ?auto_136557 ?auto_136559 ) ( OBJ-AT ?auto_136555 ?auto_136554 ) ( OBJ-AT ?auto_136556 ?auto_136554 ) ( OBJ-AT ?auto_136558 ?auto_136554 ) ( not ( = ?auto_136555 ?auto_136556 ) ) ( not ( = ?auto_136555 ?auto_136557 ) ) ( not ( = ?auto_136555 ?auto_136558 ) ) ( not ( = ?auto_136556 ?auto_136557 ) ) ( not ( = ?auto_136556 ?auto_136558 ) ) ( not ( = ?auto_136557 ?auto_136558 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136557 ?auto_136554 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136567 - OBJ
      ?auto_136568 - OBJ
      ?auto_136569 - OBJ
      ?auto_136570 - OBJ
      ?auto_136566 - LOCATION
    )
    :vars
    (
      ?auto_136571 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136571 ?auto_136566 ) ( IN-TRUCK ?auto_136568 ?auto_136571 ) ( OBJ-AT ?auto_136567 ?auto_136566 ) ( OBJ-AT ?auto_136569 ?auto_136566 ) ( OBJ-AT ?auto_136570 ?auto_136566 ) ( not ( = ?auto_136567 ?auto_136568 ) ) ( not ( = ?auto_136567 ?auto_136569 ) ) ( not ( = ?auto_136567 ?auto_136570 ) ) ( not ( = ?auto_136568 ?auto_136569 ) ) ( not ( = ?auto_136568 ?auto_136570 ) ) ( not ( = ?auto_136569 ?auto_136570 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136568 ?auto_136566 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136591 - OBJ
      ?auto_136592 - OBJ
      ?auto_136593 - OBJ
      ?auto_136594 - OBJ
      ?auto_136590 - LOCATION
    )
    :vars
    (
      ?auto_136595 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136595 ?auto_136590 ) ( IN-TRUCK ?auto_136591 ?auto_136595 ) ( OBJ-AT ?auto_136592 ?auto_136590 ) ( OBJ-AT ?auto_136593 ?auto_136590 ) ( OBJ-AT ?auto_136594 ?auto_136590 ) ( not ( = ?auto_136591 ?auto_136592 ) ) ( not ( = ?auto_136591 ?auto_136593 ) ) ( not ( = ?auto_136591 ?auto_136594 ) ) ( not ( = ?auto_136592 ?auto_136593 ) ) ( not ( = ?auto_136592 ?auto_136594 ) ) ( not ( = ?auto_136593 ?auto_136594 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136591 ?auto_136590 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136644 - OBJ
      ?auto_136645 - OBJ
      ?auto_136643 - LOCATION
    )
    :vars
    (
      ?auto_136646 - TRUCK
      ?auto_136648 - LOCATION
      ?auto_136647 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136645 ?auto_136646 ) ( TRUCK-AT ?auto_136646 ?auto_136648 ) ( IN-CITY ?auto_136648 ?auto_136647 ) ( IN-CITY ?auto_136643 ?auto_136647 ) ( not ( = ?auto_136643 ?auto_136648 ) ) ( OBJ-AT ?auto_136644 ?auto_136643 ) ( not ( = ?auto_136644 ?auto_136645 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136645 ?auto_136643 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136650 - OBJ
      ?auto_136651 - OBJ
      ?auto_136649 - LOCATION
    )
    :vars
    (
      ?auto_136654 - TRUCK
      ?auto_136652 - LOCATION
      ?auto_136653 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136650 ?auto_136654 ) ( TRUCK-AT ?auto_136654 ?auto_136652 ) ( IN-CITY ?auto_136652 ?auto_136653 ) ( IN-CITY ?auto_136649 ?auto_136653 ) ( not ( = ?auto_136649 ?auto_136652 ) ) ( OBJ-AT ?auto_136651 ?auto_136649 ) ( not ( = ?auto_136651 ?auto_136650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136651 ?auto_136650 ?auto_136649 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136663 - OBJ
      ?auto_136664 - OBJ
      ?auto_136665 - OBJ
      ?auto_136662 - LOCATION
    )
    :vars
    (
      ?auto_136668 - TRUCK
      ?auto_136666 - LOCATION
      ?auto_136667 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136665 ?auto_136668 ) ( TRUCK-AT ?auto_136668 ?auto_136666 ) ( IN-CITY ?auto_136666 ?auto_136667 ) ( IN-CITY ?auto_136662 ?auto_136667 ) ( not ( = ?auto_136662 ?auto_136666 ) ) ( OBJ-AT ?auto_136664 ?auto_136662 ) ( not ( = ?auto_136664 ?auto_136665 ) ) ( OBJ-AT ?auto_136663 ?auto_136662 ) ( not ( = ?auto_136663 ?auto_136664 ) ) ( not ( = ?auto_136663 ?auto_136665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136664 ?auto_136665 ?auto_136662 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136670 - OBJ
      ?auto_136671 - OBJ
      ?auto_136672 - OBJ
      ?auto_136669 - LOCATION
    )
    :vars
    (
      ?auto_136675 - TRUCK
      ?auto_136673 - LOCATION
      ?auto_136674 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136671 ?auto_136675 ) ( TRUCK-AT ?auto_136675 ?auto_136673 ) ( IN-CITY ?auto_136673 ?auto_136674 ) ( IN-CITY ?auto_136669 ?auto_136674 ) ( not ( = ?auto_136669 ?auto_136673 ) ) ( OBJ-AT ?auto_136672 ?auto_136669 ) ( not ( = ?auto_136672 ?auto_136671 ) ) ( OBJ-AT ?auto_136670 ?auto_136669 ) ( not ( = ?auto_136670 ?auto_136671 ) ) ( not ( = ?auto_136670 ?auto_136672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136672 ?auto_136671 ?auto_136669 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136684 - OBJ
      ?auto_136685 - OBJ
      ?auto_136686 - OBJ
      ?auto_136683 - LOCATION
    )
    :vars
    (
      ?auto_136689 - TRUCK
      ?auto_136687 - LOCATION
      ?auto_136688 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136684 ?auto_136689 ) ( TRUCK-AT ?auto_136689 ?auto_136687 ) ( IN-CITY ?auto_136687 ?auto_136688 ) ( IN-CITY ?auto_136683 ?auto_136688 ) ( not ( = ?auto_136683 ?auto_136687 ) ) ( OBJ-AT ?auto_136685 ?auto_136683 ) ( not ( = ?auto_136685 ?auto_136684 ) ) ( OBJ-AT ?auto_136686 ?auto_136683 ) ( not ( = ?auto_136684 ?auto_136686 ) ) ( not ( = ?auto_136685 ?auto_136686 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136685 ?auto_136684 ?auto_136683 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136713 - OBJ
      ?auto_136714 - OBJ
      ?auto_136715 - OBJ
      ?auto_136716 - OBJ
      ?auto_136712 - LOCATION
    )
    :vars
    (
      ?auto_136719 - TRUCK
      ?auto_136717 - LOCATION
      ?auto_136718 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136716 ?auto_136719 ) ( TRUCK-AT ?auto_136719 ?auto_136717 ) ( IN-CITY ?auto_136717 ?auto_136718 ) ( IN-CITY ?auto_136712 ?auto_136718 ) ( not ( = ?auto_136712 ?auto_136717 ) ) ( OBJ-AT ?auto_136714 ?auto_136712 ) ( not ( = ?auto_136714 ?auto_136716 ) ) ( OBJ-AT ?auto_136713 ?auto_136712 ) ( OBJ-AT ?auto_136715 ?auto_136712 ) ( not ( = ?auto_136713 ?auto_136714 ) ) ( not ( = ?auto_136713 ?auto_136715 ) ) ( not ( = ?auto_136713 ?auto_136716 ) ) ( not ( = ?auto_136714 ?auto_136715 ) ) ( not ( = ?auto_136715 ?auto_136716 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136714 ?auto_136716 ?auto_136712 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136721 - OBJ
      ?auto_136722 - OBJ
      ?auto_136723 - OBJ
      ?auto_136724 - OBJ
      ?auto_136720 - LOCATION
    )
    :vars
    (
      ?auto_136727 - TRUCK
      ?auto_136725 - LOCATION
      ?auto_136726 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136723 ?auto_136727 ) ( TRUCK-AT ?auto_136727 ?auto_136725 ) ( IN-CITY ?auto_136725 ?auto_136726 ) ( IN-CITY ?auto_136720 ?auto_136726 ) ( not ( = ?auto_136720 ?auto_136725 ) ) ( OBJ-AT ?auto_136721 ?auto_136720 ) ( not ( = ?auto_136721 ?auto_136723 ) ) ( OBJ-AT ?auto_136722 ?auto_136720 ) ( OBJ-AT ?auto_136724 ?auto_136720 ) ( not ( = ?auto_136721 ?auto_136722 ) ) ( not ( = ?auto_136721 ?auto_136724 ) ) ( not ( = ?auto_136722 ?auto_136723 ) ) ( not ( = ?auto_136722 ?auto_136724 ) ) ( not ( = ?auto_136723 ?auto_136724 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136721 ?auto_136723 ?auto_136720 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136737 - OBJ
      ?auto_136738 - OBJ
      ?auto_136739 - OBJ
      ?auto_136740 - OBJ
      ?auto_136736 - LOCATION
    )
    :vars
    (
      ?auto_136743 - TRUCK
      ?auto_136741 - LOCATION
      ?auto_136742 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136738 ?auto_136743 ) ( TRUCK-AT ?auto_136743 ?auto_136741 ) ( IN-CITY ?auto_136741 ?auto_136742 ) ( IN-CITY ?auto_136736 ?auto_136742 ) ( not ( = ?auto_136736 ?auto_136741 ) ) ( OBJ-AT ?auto_136739 ?auto_136736 ) ( not ( = ?auto_136739 ?auto_136738 ) ) ( OBJ-AT ?auto_136737 ?auto_136736 ) ( OBJ-AT ?auto_136740 ?auto_136736 ) ( not ( = ?auto_136737 ?auto_136738 ) ) ( not ( = ?auto_136737 ?auto_136739 ) ) ( not ( = ?auto_136737 ?auto_136740 ) ) ( not ( = ?auto_136738 ?auto_136740 ) ) ( not ( = ?auto_136739 ?auto_136740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136739 ?auto_136738 ?auto_136736 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136769 - OBJ
      ?auto_136770 - OBJ
      ?auto_136771 - OBJ
      ?auto_136772 - OBJ
      ?auto_136768 - LOCATION
    )
    :vars
    (
      ?auto_136775 - TRUCK
      ?auto_136773 - LOCATION
      ?auto_136774 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_136769 ?auto_136775 ) ( TRUCK-AT ?auto_136775 ?auto_136773 ) ( IN-CITY ?auto_136773 ?auto_136774 ) ( IN-CITY ?auto_136768 ?auto_136774 ) ( not ( = ?auto_136768 ?auto_136773 ) ) ( OBJ-AT ?auto_136770 ?auto_136768 ) ( not ( = ?auto_136770 ?auto_136769 ) ) ( OBJ-AT ?auto_136771 ?auto_136768 ) ( OBJ-AT ?auto_136772 ?auto_136768 ) ( not ( = ?auto_136769 ?auto_136771 ) ) ( not ( = ?auto_136769 ?auto_136772 ) ) ( not ( = ?auto_136770 ?auto_136771 ) ) ( not ( = ?auto_136770 ?auto_136772 ) ) ( not ( = ?auto_136771 ?auto_136772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136770 ?auto_136769 ?auto_136768 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_136834 - OBJ
      ?auto_136833 - LOCATION
    )
    :vars
    (
      ?auto_136838 - TRUCK
      ?auto_136835 - LOCATION
      ?auto_136836 - CITY
      ?auto_136837 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136838 ?auto_136835 ) ( IN-CITY ?auto_136835 ?auto_136836 ) ( IN-CITY ?auto_136833 ?auto_136836 ) ( not ( = ?auto_136833 ?auto_136835 ) ) ( OBJ-AT ?auto_136837 ?auto_136833 ) ( not ( = ?auto_136837 ?auto_136834 ) ) ( OBJ-AT ?auto_136834 ?auto_136835 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_136834 ?auto_136838 ?auto_136835 )
      ( DELIVER-2PKG ?auto_136837 ?auto_136834 ?auto_136833 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136840 - OBJ
      ?auto_136841 - OBJ
      ?auto_136839 - LOCATION
    )
    :vars
    (
      ?auto_136844 - TRUCK
      ?auto_136842 - LOCATION
      ?auto_136843 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136844 ?auto_136842 ) ( IN-CITY ?auto_136842 ?auto_136843 ) ( IN-CITY ?auto_136839 ?auto_136843 ) ( not ( = ?auto_136839 ?auto_136842 ) ) ( OBJ-AT ?auto_136840 ?auto_136839 ) ( not ( = ?auto_136840 ?auto_136841 ) ) ( OBJ-AT ?auto_136841 ?auto_136842 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_136841 ?auto_136839 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_136846 - OBJ
      ?auto_136847 - OBJ
      ?auto_136845 - LOCATION
    )
    :vars
    (
      ?auto_136848 - TRUCK
      ?auto_136850 - LOCATION
      ?auto_136849 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136848 ?auto_136850 ) ( IN-CITY ?auto_136850 ?auto_136849 ) ( IN-CITY ?auto_136845 ?auto_136849 ) ( not ( = ?auto_136845 ?auto_136850 ) ) ( OBJ-AT ?auto_136847 ?auto_136845 ) ( not ( = ?auto_136847 ?auto_136846 ) ) ( OBJ-AT ?auto_136846 ?auto_136850 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136847 ?auto_136846 ?auto_136845 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136859 - OBJ
      ?auto_136860 - OBJ
      ?auto_136861 - OBJ
      ?auto_136858 - LOCATION
    )
    :vars
    (
      ?auto_136862 - TRUCK
      ?auto_136864 - LOCATION
      ?auto_136863 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136862 ?auto_136864 ) ( IN-CITY ?auto_136864 ?auto_136863 ) ( IN-CITY ?auto_136858 ?auto_136863 ) ( not ( = ?auto_136858 ?auto_136864 ) ) ( OBJ-AT ?auto_136860 ?auto_136858 ) ( not ( = ?auto_136860 ?auto_136861 ) ) ( OBJ-AT ?auto_136861 ?auto_136864 ) ( OBJ-AT ?auto_136859 ?auto_136858 ) ( not ( = ?auto_136859 ?auto_136860 ) ) ( not ( = ?auto_136859 ?auto_136861 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136860 ?auto_136861 ?auto_136858 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136866 - OBJ
      ?auto_136867 - OBJ
      ?auto_136868 - OBJ
      ?auto_136865 - LOCATION
    )
    :vars
    (
      ?auto_136869 - TRUCK
      ?auto_136871 - LOCATION
      ?auto_136870 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136869 ?auto_136871 ) ( IN-CITY ?auto_136871 ?auto_136870 ) ( IN-CITY ?auto_136865 ?auto_136870 ) ( not ( = ?auto_136865 ?auto_136871 ) ) ( OBJ-AT ?auto_136868 ?auto_136865 ) ( not ( = ?auto_136868 ?auto_136867 ) ) ( OBJ-AT ?auto_136867 ?auto_136871 ) ( OBJ-AT ?auto_136866 ?auto_136865 ) ( not ( = ?auto_136866 ?auto_136867 ) ) ( not ( = ?auto_136866 ?auto_136868 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136868 ?auto_136867 ?auto_136865 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_136880 - OBJ
      ?auto_136881 - OBJ
      ?auto_136882 - OBJ
      ?auto_136879 - LOCATION
    )
    :vars
    (
      ?auto_136883 - TRUCK
      ?auto_136885 - LOCATION
      ?auto_136884 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136883 ?auto_136885 ) ( IN-CITY ?auto_136885 ?auto_136884 ) ( IN-CITY ?auto_136879 ?auto_136884 ) ( not ( = ?auto_136879 ?auto_136885 ) ) ( OBJ-AT ?auto_136881 ?auto_136879 ) ( not ( = ?auto_136881 ?auto_136880 ) ) ( OBJ-AT ?auto_136880 ?auto_136885 ) ( OBJ-AT ?auto_136882 ?auto_136879 ) ( not ( = ?auto_136880 ?auto_136882 ) ) ( not ( = ?auto_136881 ?auto_136882 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136881 ?auto_136880 ?auto_136879 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136909 - OBJ
      ?auto_136910 - OBJ
      ?auto_136911 - OBJ
      ?auto_136912 - OBJ
      ?auto_136908 - LOCATION
    )
    :vars
    (
      ?auto_136913 - TRUCK
      ?auto_136915 - LOCATION
      ?auto_136914 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136913 ?auto_136915 ) ( IN-CITY ?auto_136915 ?auto_136914 ) ( IN-CITY ?auto_136908 ?auto_136914 ) ( not ( = ?auto_136908 ?auto_136915 ) ) ( OBJ-AT ?auto_136909 ?auto_136908 ) ( not ( = ?auto_136909 ?auto_136912 ) ) ( OBJ-AT ?auto_136912 ?auto_136915 ) ( OBJ-AT ?auto_136910 ?auto_136908 ) ( OBJ-AT ?auto_136911 ?auto_136908 ) ( not ( = ?auto_136909 ?auto_136910 ) ) ( not ( = ?auto_136909 ?auto_136911 ) ) ( not ( = ?auto_136910 ?auto_136911 ) ) ( not ( = ?auto_136910 ?auto_136912 ) ) ( not ( = ?auto_136911 ?auto_136912 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136909 ?auto_136912 ?auto_136908 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136917 - OBJ
      ?auto_136918 - OBJ
      ?auto_136919 - OBJ
      ?auto_136920 - OBJ
      ?auto_136916 - LOCATION
    )
    :vars
    (
      ?auto_136921 - TRUCK
      ?auto_136923 - LOCATION
      ?auto_136922 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136921 ?auto_136923 ) ( IN-CITY ?auto_136923 ?auto_136922 ) ( IN-CITY ?auto_136916 ?auto_136922 ) ( not ( = ?auto_136916 ?auto_136923 ) ) ( OBJ-AT ?auto_136917 ?auto_136916 ) ( not ( = ?auto_136917 ?auto_136919 ) ) ( OBJ-AT ?auto_136919 ?auto_136923 ) ( OBJ-AT ?auto_136918 ?auto_136916 ) ( OBJ-AT ?auto_136920 ?auto_136916 ) ( not ( = ?auto_136917 ?auto_136918 ) ) ( not ( = ?auto_136917 ?auto_136920 ) ) ( not ( = ?auto_136918 ?auto_136919 ) ) ( not ( = ?auto_136918 ?auto_136920 ) ) ( not ( = ?auto_136919 ?auto_136920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136917 ?auto_136919 ?auto_136916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136933 - OBJ
      ?auto_136934 - OBJ
      ?auto_136935 - OBJ
      ?auto_136936 - OBJ
      ?auto_136932 - LOCATION
    )
    :vars
    (
      ?auto_136937 - TRUCK
      ?auto_136939 - LOCATION
      ?auto_136938 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136937 ?auto_136939 ) ( IN-CITY ?auto_136939 ?auto_136938 ) ( IN-CITY ?auto_136932 ?auto_136938 ) ( not ( = ?auto_136932 ?auto_136939 ) ) ( OBJ-AT ?auto_136935 ?auto_136932 ) ( not ( = ?auto_136935 ?auto_136934 ) ) ( OBJ-AT ?auto_136934 ?auto_136939 ) ( OBJ-AT ?auto_136933 ?auto_136932 ) ( OBJ-AT ?auto_136936 ?auto_136932 ) ( not ( = ?auto_136933 ?auto_136934 ) ) ( not ( = ?auto_136933 ?auto_136935 ) ) ( not ( = ?auto_136933 ?auto_136936 ) ) ( not ( = ?auto_136934 ?auto_136936 ) ) ( not ( = ?auto_136935 ?auto_136936 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136935 ?auto_136934 ?auto_136932 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_136965 - OBJ
      ?auto_136966 - OBJ
      ?auto_136967 - OBJ
      ?auto_136968 - OBJ
      ?auto_136964 - LOCATION
    )
    :vars
    (
      ?auto_136969 - TRUCK
      ?auto_136971 - LOCATION
      ?auto_136970 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_136969 ?auto_136971 ) ( IN-CITY ?auto_136971 ?auto_136970 ) ( IN-CITY ?auto_136964 ?auto_136970 ) ( not ( = ?auto_136964 ?auto_136971 ) ) ( OBJ-AT ?auto_136968 ?auto_136964 ) ( not ( = ?auto_136968 ?auto_136965 ) ) ( OBJ-AT ?auto_136965 ?auto_136971 ) ( OBJ-AT ?auto_136966 ?auto_136964 ) ( OBJ-AT ?auto_136967 ?auto_136964 ) ( not ( = ?auto_136965 ?auto_136966 ) ) ( not ( = ?auto_136965 ?auto_136967 ) ) ( not ( = ?auto_136966 ?auto_136967 ) ) ( not ( = ?auto_136966 ?auto_136968 ) ) ( not ( = ?auto_136967 ?auto_136968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_136968 ?auto_136965 ?auto_136964 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137030 - OBJ
      ?auto_137029 - LOCATION
    )
    :vars
    (
      ?auto_137033 - LOCATION
      ?auto_137032 - CITY
      ?auto_137034 - OBJ
      ?auto_137031 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137033 ?auto_137032 ) ( IN-CITY ?auto_137029 ?auto_137032 ) ( not ( = ?auto_137029 ?auto_137033 ) ) ( OBJ-AT ?auto_137034 ?auto_137029 ) ( not ( = ?auto_137034 ?auto_137030 ) ) ( OBJ-AT ?auto_137030 ?auto_137033 ) ( TRUCK-AT ?auto_137031 ?auto_137029 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_137031 ?auto_137029 ?auto_137033 ?auto_137032 )
      ( DELIVER-2PKG ?auto_137034 ?auto_137030 ?auto_137029 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137036 - OBJ
      ?auto_137037 - OBJ
      ?auto_137035 - LOCATION
    )
    :vars
    (
      ?auto_137040 - LOCATION
      ?auto_137038 - CITY
      ?auto_137039 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137040 ?auto_137038 ) ( IN-CITY ?auto_137035 ?auto_137038 ) ( not ( = ?auto_137035 ?auto_137040 ) ) ( OBJ-AT ?auto_137036 ?auto_137035 ) ( not ( = ?auto_137036 ?auto_137037 ) ) ( OBJ-AT ?auto_137037 ?auto_137040 ) ( TRUCK-AT ?auto_137039 ?auto_137035 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137037 ?auto_137035 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137042 - OBJ
      ?auto_137043 - OBJ
      ?auto_137041 - LOCATION
    )
    :vars
    (
      ?auto_137046 - LOCATION
      ?auto_137045 - CITY
      ?auto_137044 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137046 ?auto_137045 ) ( IN-CITY ?auto_137041 ?auto_137045 ) ( not ( = ?auto_137041 ?auto_137046 ) ) ( OBJ-AT ?auto_137043 ?auto_137041 ) ( not ( = ?auto_137043 ?auto_137042 ) ) ( OBJ-AT ?auto_137042 ?auto_137046 ) ( TRUCK-AT ?auto_137044 ?auto_137041 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137043 ?auto_137042 ?auto_137041 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137055 - OBJ
      ?auto_137056 - OBJ
      ?auto_137057 - OBJ
      ?auto_137054 - LOCATION
    )
    :vars
    (
      ?auto_137060 - LOCATION
      ?auto_137059 - CITY
      ?auto_137058 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137060 ?auto_137059 ) ( IN-CITY ?auto_137054 ?auto_137059 ) ( not ( = ?auto_137054 ?auto_137060 ) ) ( OBJ-AT ?auto_137055 ?auto_137054 ) ( not ( = ?auto_137055 ?auto_137057 ) ) ( OBJ-AT ?auto_137057 ?auto_137060 ) ( TRUCK-AT ?auto_137058 ?auto_137054 ) ( OBJ-AT ?auto_137056 ?auto_137054 ) ( not ( = ?auto_137055 ?auto_137056 ) ) ( not ( = ?auto_137056 ?auto_137057 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137055 ?auto_137057 ?auto_137054 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137062 - OBJ
      ?auto_137063 - OBJ
      ?auto_137064 - OBJ
      ?auto_137061 - LOCATION
    )
    :vars
    (
      ?auto_137067 - LOCATION
      ?auto_137066 - CITY
      ?auto_137065 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137067 ?auto_137066 ) ( IN-CITY ?auto_137061 ?auto_137066 ) ( not ( = ?auto_137061 ?auto_137067 ) ) ( OBJ-AT ?auto_137062 ?auto_137061 ) ( not ( = ?auto_137062 ?auto_137063 ) ) ( OBJ-AT ?auto_137063 ?auto_137067 ) ( TRUCK-AT ?auto_137065 ?auto_137061 ) ( OBJ-AT ?auto_137064 ?auto_137061 ) ( not ( = ?auto_137062 ?auto_137064 ) ) ( not ( = ?auto_137063 ?auto_137064 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137062 ?auto_137063 ?auto_137061 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_137076 - OBJ
      ?auto_137077 - OBJ
      ?auto_137078 - OBJ
      ?auto_137075 - LOCATION
    )
    :vars
    (
      ?auto_137081 - LOCATION
      ?auto_137080 - CITY
      ?auto_137079 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137081 ?auto_137080 ) ( IN-CITY ?auto_137075 ?auto_137080 ) ( not ( = ?auto_137075 ?auto_137081 ) ) ( OBJ-AT ?auto_137077 ?auto_137075 ) ( not ( = ?auto_137077 ?auto_137076 ) ) ( OBJ-AT ?auto_137076 ?auto_137081 ) ( TRUCK-AT ?auto_137079 ?auto_137075 ) ( OBJ-AT ?auto_137078 ?auto_137075 ) ( not ( = ?auto_137076 ?auto_137078 ) ) ( not ( = ?auto_137077 ?auto_137078 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137077 ?auto_137076 ?auto_137075 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137105 - OBJ
      ?auto_137106 - OBJ
      ?auto_137107 - OBJ
      ?auto_137108 - OBJ
      ?auto_137104 - LOCATION
    )
    :vars
    (
      ?auto_137111 - LOCATION
      ?auto_137110 - CITY
      ?auto_137109 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137111 ?auto_137110 ) ( IN-CITY ?auto_137104 ?auto_137110 ) ( not ( = ?auto_137104 ?auto_137111 ) ) ( OBJ-AT ?auto_137107 ?auto_137104 ) ( not ( = ?auto_137107 ?auto_137108 ) ) ( OBJ-AT ?auto_137108 ?auto_137111 ) ( TRUCK-AT ?auto_137109 ?auto_137104 ) ( OBJ-AT ?auto_137105 ?auto_137104 ) ( OBJ-AT ?auto_137106 ?auto_137104 ) ( not ( = ?auto_137105 ?auto_137106 ) ) ( not ( = ?auto_137105 ?auto_137107 ) ) ( not ( = ?auto_137105 ?auto_137108 ) ) ( not ( = ?auto_137106 ?auto_137107 ) ) ( not ( = ?auto_137106 ?auto_137108 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137107 ?auto_137108 ?auto_137104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137113 - OBJ
      ?auto_137114 - OBJ
      ?auto_137115 - OBJ
      ?auto_137116 - OBJ
      ?auto_137112 - LOCATION
    )
    :vars
    (
      ?auto_137119 - LOCATION
      ?auto_137118 - CITY
      ?auto_137117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137119 ?auto_137118 ) ( IN-CITY ?auto_137112 ?auto_137118 ) ( not ( = ?auto_137112 ?auto_137119 ) ) ( OBJ-AT ?auto_137113 ?auto_137112 ) ( not ( = ?auto_137113 ?auto_137115 ) ) ( OBJ-AT ?auto_137115 ?auto_137119 ) ( TRUCK-AT ?auto_137117 ?auto_137112 ) ( OBJ-AT ?auto_137114 ?auto_137112 ) ( OBJ-AT ?auto_137116 ?auto_137112 ) ( not ( = ?auto_137113 ?auto_137114 ) ) ( not ( = ?auto_137113 ?auto_137116 ) ) ( not ( = ?auto_137114 ?auto_137115 ) ) ( not ( = ?auto_137114 ?auto_137116 ) ) ( not ( = ?auto_137115 ?auto_137116 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137113 ?auto_137115 ?auto_137112 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137129 - OBJ
      ?auto_137130 - OBJ
      ?auto_137131 - OBJ
      ?auto_137132 - OBJ
      ?auto_137128 - LOCATION
    )
    :vars
    (
      ?auto_137135 - LOCATION
      ?auto_137134 - CITY
      ?auto_137133 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137135 ?auto_137134 ) ( IN-CITY ?auto_137128 ?auto_137134 ) ( not ( = ?auto_137128 ?auto_137135 ) ) ( OBJ-AT ?auto_137132 ?auto_137128 ) ( not ( = ?auto_137132 ?auto_137130 ) ) ( OBJ-AT ?auto_137130 ?auto_137135 ) ( TRUCK-AT ?auto_137133 ?auto_137128 ) ( OBJ-AT ?auto_137129 ?auto_137128 ) ( OBJ-AT ?auto_137131 ?auto_137128 ) ( not ( = ?auto_137129 ?auto_137130 ) ) ( not ( = ?auto_137129 ?auto_137131 ) ) ( not ( = ?auto_137129 ?auto_137132 ) ) ( not ( = ?auto_137130 ?auto_137131 ) ) ( not ( = ?auto_137131 ?auto_137132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137132 ?auto_137130 ?auto_137128 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_137161 - OBJ
      ?auto_137162 - OBJ
      ?auto_137163 - OBJ
      ?auto_137164 - OBJ
      ?auto_137160 - LOCATION
    )
    :vars
    (
      ?auto_137167 - LOCATION
      ?auto_137166 - CITY
      ?auto_137165 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137167 ?auto_137166 ) ( IN-CITY ?auto_137160 ?auto_137166 ) ( not ( = ?auto_137160 ?auto_137167 ) ) ( OBJ-AT ?auto_137163 ?auto_137160 ) ( not ( = ?auto_137163 ?auto_137161 ) ) ( OBJ-AT ?auto_137161 ?auto_137167 ) ( TRUCK-AT ?auto_137165 ?auto_137160 ) ( OBJ-AT ?auto_137162 ?auto_137160 ) ( OBJ-AT ?auto_137164 ?auto_137160 ) ( not ( = ?auto_137161 ?auto_137162 ) ) ( not ( = ?auto_137161 ?auto_137164 ) ) ( not ( = ?auto_137162 ?auto_137163 ) ) ( not ( = ?auto_137162 ?auto_137164 ) ) ( not ( = ?auto_137163 ?auto_137164 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137163 ?auto_137161 ?auto_137160 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137226 - OBJ
      ?auto_137225 - LOCATION
    )
    :vars
    (
      ?auto_137230 - LOCATION
      ?auto_137228 - CITY
      ?auto_137229 - OBJ
      ?auto_137227 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137230 ?auto_137228 ) ( IN-CITY ?auto_137225 ?auto_137228 ) ( not ( = ?auto_137225 ?auto_137230 ) ) ( not ( = ?auto_137229 ?auto_137226 ) ) ( OBJ-AT ?auto_137226 ?auto_137230 ) ( TRUCK-AT ?auto_137227 ?auto_137225 ) ( IN-TRUCK ?auto_137229 ?auto_137227 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137229 ?auto_137225 )
      ( DELIVER-2PKG ?auto_137229 ?auto_137226 ?auto_137225 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137232 - OBJ
      ?auto_137233 - OBJ
      ?auto_137231 - LOCATION
    )
    :vars
    (
      ?auto_137235 - LOCATION
      ?auto_137234 - CITY
      ?auto_137236 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137235 ?auto_137234 ) ( IN-CITY ?auto_137231 ?auto_137234 ) ( not ( = ?auto_137231 ?auto_137235 ) ) ( not ( = ?auto_137232 ?auto_137233 ) ) ( OBJ-AT ?auto_137233 ?auto_137235 ) ( TRUCK-AT ?auto_137236 ?auto_137231 ) ( IN-TRUCK ?auto_137232 ?auto_137236 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137233 ?auto_137231 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137238 - OBJ
      ?auto_137239 - OBJ
      ?auto_137237 - LOCATION
    )
    :vars
    (
      ?auto_137240 - LOCATION
      ?auto_137242 - CITY
      ?auto_137241 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_137240 ?auto_137242 ) ( IN-CITY ?auto_137237 ?auto_137242 ) ( not ( = ?auto_137237 ?auto_137240 ) ) ( not ( = ?auto_137239 ?auto_137238 ) ) ( OBJ-AT ?auto_137238 ?auto_137240 ) ( TRUCK-AT ?auto_137241 ?auto_137237 ) ( IN-TRUCK ?auto_137239 ?auto_137241 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137239 ?auto_137238 ?auto_137237 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137422 - OBJ
      ?auto_137421 - LOCATION
    )
    :vars
    (
      ?auto_137423 - LOCATION
      ?auto_137426 - CITY
      ?auto_137424 - OBJ
      ?auto_137425 - TRUCK
      ?auto_137427 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137423 ?auto_137426 ) ( IN-CITY ?auto_137421 ?auto_137426 ) ( not ( = ?auto_137421 ?auto_137423 ) ) ( not ( = ?auto_137424 ?auto_137422 ) ) ( OBJ-AT ?auto_137422 ?auto_137423 ) ( IN-TRUCK ?auto_137424 ?auto_137425 ) ( TRUCK-AT ?auto_137425 ?auto_137427 ) ( IN-CITY ?auto_137427 ?auto_137426 ) ( not ( = ?auto_137421 ?auto_137427 ) ) ( not ( = ?auto_137423 ?auto_137427 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_137425 ?auto_137427 ?auto_137421 ?auto_137426 )
      ( DELIVER-2PKG ?auto_137424 ?auto_137422 ?auto_137421 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137429 - OBJ
      ?auto_137430 - OBJ
      ?auto_137428 - LOCATION
    )
    :vars
    (
      ?auto_137434 - LOCATION
      ?auto_137431 - CITY
      ?auto_137432 - TRUCK
      ?auto_137433 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137434 ?auto_137431 ) ( IN-CITY ?auto_137428 ?auto_137431 ) ( not ( = ?auto_137428 ?auto_137434 ) ) ( not ( = ?auto_137429 ?auto_137430 ) ) ( OBJ-AT ?auto_137430 ?auto_137434 ) ( IN-TRUCK ?auto_137429 ?auto_137432 ) ( TRUCK-AT ?auto_137432 ?auto_137433 ) ( IN-CITY ?auto_137433 ?auto_137431 ) ( not ( = ?auto_137428 ?auto_137433 ) ) ( not ( = ?auto_137434 ?auto_137433 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137430 ?auto_137428 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137436 - OBJ
      ?auto_137437 - OBJ
      ?auto_137435 - LOCATION
    )
    :vars
    (
      ?auto_137441 - LOCATION
      ?auto_137438 - CITY
      ?auto_137440 - TRUCK
      ?auto_137439 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137441 ?auto_137438 ) ( IN-CITY ?auto_137435 ?auto_137438 ) ( not ( = ?auto_137435 ?auto_137441 ) ) ( not ( = ?auto_137437 ?auto_137436 ) ) ( OBJ-AT ?auto_137436 ?auto_137441 ) ( IN-TRUCK ?auto_137437 ?auto_137440 ) ( TRUCK-AT ?auto_137440 ?auto_137439 ) ( IN-CITY ?auto_137439 ?auto_137438 ) ( not ( = ?auto_137435 ?auto_137439 ) ) ( not ( = ?auto_137441 ?auto_137439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137437 ?auto_137436 ?auto_137435 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_137644 - OBJ
      ?auto_137643 - LOCATION
    )
    :vars
    (
      ?auto_137648 - LOCATION
      ?auto_137645 - CITY
      ?auto_137649 - OBJ
      ?auto_137647 - TRUCK
      ?auto_137646 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137648 ?auto_137645 ) ( IN-CITY ?auto_137643 ?auto_137645 ) ( not ( = ?auto_137643 ?auto_137648 ) ) ( not ( = ?auto_137649 ?auto_137644 ) ) ( OBJ-AT ?auto_137644 ?auto_137648 ) ( TRUCK-AT ?auto_137647 ?auto_137646 ) ( IN-CITY ?auto_137646 ?auto_137645 ) ( not ( = ?auto_137643 ?auto_137646 ) ) ( not ( = ?auto_137648 ?auto_137646 ) ) ( OBJ-AT ?auto_137649 ?auto_137646 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_137649 ?auto_137647 ?auto_137646 )
      ( DELIVER-2PKG ?auto_137649 ?auto_137644 ?auto_137643 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137651 - OBJ
      ?auto_137652 - OBJ
      ?auto_137650 - LOCATION
    )
    :vars
    (
      ?auto_137655 - LOCATION
      ?auto_137656 - CITY
      ?auto_137653 - TRUCK
      ?auto_137654 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137655 ?auto_137656 ) ( IN-CITY ?auto_137650 ?auto_137656 ) ( not ( = ?auto_137650 ?auto_137655 ) ) ( not ( = ?auto_137651 ?auto_137652 ) ) ( OBJ-AT ?auto_137652 ?auto_137655 ) ( TRUCK-AT ?auto_137653 ?auto_137654 ) ( IN-CITY ?auto_137654 ?auto_137656 ) ( not ( = ?auto_137650 ?auto_137654 ) ) ( not ( = ?auto_137655 ?auto_137654 ) ) ( OBJ-AT ?auto_137651 ?auto_137654 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_137652 ?auto_137650 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_137658 - OBJ
      ?auto_137659 - OBJ
      ?auto_137657 - LOCATION
    )
    :vars
    (
      ?auto_137663 - LOCATION
      ?auto_137662 - CITY
      ?auto_137660 - TRUCK
      ?auto_137661 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_137663 ?auto_137662 ) ( IN-CITY ?auto_137657 ?auto_137662 ) ( not ( = ?auto_137657 ?auto_137663 ) ) ( not ( = ?auto_137659 ?auto_137658 ) ) ( OBJ-AT ?auto_137658 ?auto_137663 ) ( TRUCK-AT ?auto_137660 ?auto_137661 ) ( IN-CITY ?auto_137661 ?auto_137662 ) ( not ( = ?auto_137657 ?auto_137661 ) ) ( not ( = ?auto_137663 ?auto_137661 ) ) ( OBJ-AT ?auto_137659 ?auto_137661 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_137659 ?auto_137658 ?auto_137657 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139003 - OBJ
      ?auto_139004 - OBJ
      ?auto_139005 - OBJ
      ?auto_139002 - LOCATION
    )
    :vars
    (
      ?auto_139007 - TRUCK
      ?auto_139006 - LOCATION
      ?auto_139008 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139005 ?auto_139007 ) ( TRUCK-AT ?auto_139007 ?auto_139006 ) ( IN-CITY ?auto_139006 ?auto_139008 ) ( IN-CITY ?auto_139002 ?auto_139008 ) ( not ( = ?auto_139002 ?auto_139006 ) ) ( OBJ-AT ?auto_139003 ?auto_139002 ) ( not ( = ?auto_139003 ?auto_139005 ) ) ( OBJ-AT ?auto_139004 ?auto_139002 ) ( not ( = ?auto_139003 ?auto_139004 ) ) ( not ( = ?auto_139004 ?auto_139005 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139003 ?auto_139005 ?auto_139002 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139014 - OBJ
      ?auto_139015 - OBJ
      ?auto_139016 - OBJ
      ?auto_139013 - LOCATION
    )
    :vars
    (
      ?auto_139018 - TRUCK
      ?auto_139017 - LOCATION
      ?auto_139019 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139015 ?auto_139018 ) ( TRUCK-AT ?auto_139018 ?auto_139017 ) ( IN-CITY ?auto_139017 ?auto_139019 ) ( IN-CITY ?auto_139013 ?auto_139019 ) ( not ( = ?auto_139013 ?auto_139017 ) ) ( OBJ-AT ?auto_139014 ?auto_139013 ) ( not ( = ?auto_139014 ?auto_139015 ) ) ( OBJ-AT ?auto_139016 ?auto_139013 ) ( not ( = ?auto_139014 ?auto_139016 ) ) ( not ( = ?auto_139015 ?auto_139016 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139014 ?auto_139015 ?auto_139013 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139036 - OBJ
      ?auto_139037 - OBJ
      ?auto_139038 - OBJ
      ?auto_139035 - LOCATION
    )
    :vars
    (
      ?auto_139041 - TRUCK
      ?auto_139039 - LOCATION
      ?auto_139042 - CITY
      ?auto_139040 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139038 ?auto_139041 ) ( TRUCK-AT ?auto_139041 ?auto_139039 ) ( IN-CITY ?auto_139039 ?auto_139042 ) ( IN-CITY ?auto_139035 ?auto_139042 ) ( not ( = ?auto_139035 ?auto_139039 ) ) ( OBJ-AT ?auto_139040 ?auto_139035 ) ( not ( = ?auto_139040 ?auto_139038 ) ) ( OBJ-AT ?auto_139036 ?auto_139035 ) ( OBJ-AT ?auto_139037 ?auto_139035 ) ( not ( = ?auto_139036 ?auto_139037 ) ) ( not ( = ?auto_139036 ?auto_139038 ) ) ( not ( = ?auto_139036 ?auto_139040 ) ) ( not ( = ?auto_139037 ?auto_139038 ) ) ( not ( = ?auto_139037 ?auto_139040 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139040 ?auto_139038 ?auto_139035 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139048 - OBJ
      ?auto_139049 - OBJ
      ?auto_139050 - OBJ
      ?auto_139047 - LOCATION
    )
    :vars
    (
      ?auto_139053 - TRUCK
      ?auto_139051 - LOCATION
      ?auto_139054 - CITY
      ?auto_139052 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139049 ?auto_139053 ) ( TRUCK-AT ?auto_139053 ?auto_139051 ) ( IN-CITY ?auto_139051 ?auto_139054 ) ( IN-CITY ?auto_139047 ?auto_139054 ) ( not ( = ?auto_139047 ?auto_139051 ) ) ( OBJ-AT ?auto_139052 ?auto_139047 ) ( not ( = ?auto_139052 ?auto_139049 ) ) ( OBJ-AT ?auto_139048 ?auto_139047 ) ( OBJ-AT ?auto_139050 ?auto_139047 ) ( not ( = ?auto_139048 ?auto_139049 ) ) ( not ( = ?auto_139048 ?auto_139050 ) ) ( not ( = ?auto_139048 ?auto_139052 ) ) ( not ( = ?auto_139049 ?auto_139050 ) ) ( not ( = ?auto_139050 ?auto_139052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139052 ?auto_139049 ?auto_139047 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139064 - OBJ
      ?auto_139065 - OBJ
      ?auto_139066 - OBJ
      ?auto_139063 - LOCATION
    )
    :vars
    (
      ?auto_139068 - TRUCK
      ?auto_139067 - LOCATION
      ?auto_139069 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139064 ?auto_139068 ) ( TRUCK-AT ?auto_139068 ?auto_139067 ) ( IN-CITY ?auto_139067 ?auto_139069 ) ( IN-CITY ?auto_139063 ?auto_139069 ) ( not ( = ?auto_139063 ?auto_139067 ) ) ( OBJ-AT ?auto_139066 ?auto_139063 ) ( not ( = ?auto_139066 ?auto_139064 ) ) ( OBJ-AT ?auto_139065 ?auto_139063 ) ( not ( = ?auto_139064 ?auto_139065 ) ) ( not ( = ?auto_139065 ?auto_139066 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139066 ?auto_139064 ?auto_139063 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139086 - OBJ
      ?auto_139087 - OBJ
      ?auto_139088 - OBJ
      ?auto_139085 - LOCATION
    )
    :vars
    (
      ?auto_139091 - TRUCK
      ?auto_139089 - LOCATION
      ?auto_139092 - CITY
      ?auto_139090 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139086 ?auto_139091 ) ( TRUCK-AT ?auto_139091 ?auto_139089 ) ( IN-CITY ?auto_139089 ?auto_139092 ) ( IN-CITY ?auto_139085 ?auto_139092 ) ( not ( = ?auto_139085 ?auto_139089 ) ) ( OBJ-AT ?auto_139090 ?auto_139085 ) ( not ( = ?auto_139090 ?auto_139086 ) ) ( OBJ-AT ?auto_139087 ?auto_139085 ) ( OBJ-AT ?auto_139088 ?auto_139085 ) ( not ( = ?auto_139086 ?auto_139087 ) ) ( not ( = ?auto_139086 ?auto_139088 ) ) ( not ( = ?auto_139087 ?auto_139088 ) ) ( not ( = ?auto_139087 ?auto_139090 ) ) ( not ( = ?auto_139088 ?auto_139090 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139090 ?auto_139086 ?auto_139085 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139141 - OBJ
      ?auto_139142 - OBJ
      ?auto_139143 - OBJ
      ?auto_139144 - OBJ
      ?auto_139140 - LOCATION
    )
    :vars
    (
      ?auto_139146 - TRUCK
      ?auto_139145 - LOCATION
      ?auto_139147 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139143 ?auto_139146 ) ( TRUCK-AT ?auto_139146 ?auto_139145 ) ( IN-CITY ?auto_139145 ?auto_139147 ) ( IN-CITY ?auto_139140 ?auto_139147 ) ( not ( = ?auto_139140 ?auto_139145 ) ) ( OBJ-AT ?auto_139144 ?auto_139140 ) ( not ( = ?auto_139144 ?auto_139143 ) ) ( OBJ-AT ?auto_139141 ?auto_139140 ) ( OBJ-AT ?auto_139142 ?auto_139140 ) ( not ( = ?auto_139141 ?auto_139142 ) ) ( not ( = ?auto_139141 ?auto_139143 ) ) ( not ( = ?auto_139141 ?auto_139144 ) ) ( not ( = ?auto_139142 ?auto_139143 ) ) ( not ( = ?auto_139142 ?auto_139144 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139144 ?auto_139143 ?auto_139140 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139165 - OBJ
      ?auto_139166 - OBJ
      ?auto_139167 - OBJ
      ?auto_139168 - OBJ
      ?auto_139164 - LOCATION
    )
    :vars
    (
      ?auto_139170 - TRUCK
      ?auto_139169 - LOCATION
      ?auto_139171 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139168 ?auto_139170 ) ( TRUCK-AT ?auto_139170 ?auto_139169 ) ( IN-CITY ?auto_139169 ?auto_139171 ) ( IN-CITY ?auto_139164 ?auto_139171 ) ( not ( = ?auto_139164 ?auto_139169 ) ) ( OBJ-AT ?auto_139167 ?auto_139164 ) ( not ( = ?auto_139167 ?auto_139168 ) ) ( OBJ-AT ?auto_139165 ?auto_139164 ) ( OBJ-AT ?auto_139166 ?auto_139164 ) ( not ( = ?auto_139165 ?auto_139166 ) ) ( not ( = ?auto_139165 ?auto_139167 ) ) ( not ( = ?auto_139165 ?auto_139168 ) ) ( not ( = ?auto_139166 ?auto_139167 ) ) ( not ( = ?auto_139166 ?auto_139168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139167 ?auto_139168 ?auto_139164 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139173 - OBJ
      ?auto_139174 - OBJ
      ?auto_139175 - OBJ
      ?auto_139176 - OBJ
      ?auto_139172 - LOCATION
    )
    :vars
    (
      ?auto_139178 - TRUCK
      ?auto_139177 - LOCATION
      ?auto_139179 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139176 ?auto_139178 ) ( TRUCK-AT ?auto_139178 ?auto_139177 ) ( IN-CITY ?auto_139177 ?auto_139179 ) ( IN-CITY ?auto_139172 ?auto_139179 ) ( not ( = ?auto_139172 ?auto_139177 ) ) ( OBJ-AT ?auto_139173 ?auto_139172 ) ( not ( = ?auto_139173 ?auto_139176 ) ) ( OBJ-AT ?auto_139174 ?auto_139172 ) ( OBJ-AT ?auto_139175 ?auto_139172 ) ( not ( = ?auto_139173 ?auto_139174 ) ) ( not ( = ?auto_139173 ?auto_139175 ) ) ( not ( = ?auto_139174 ?auto_139175 ) ) ( not ( = ?auto_139174 ?auto_139176 ) ) ( not ( = ?auto_139175 ?auto_139176 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139173 ?auto_139176 ?auto_139172 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139213 - OBJ
      ?auto_139214 - OBJ
      ?auto_139215 - OBJ
      ?auto_139216 - OBJ
      ?auto_139212 - LOCATION
    )
    :vars
    (
      ?auto_139218 - TRUCK
      ?auto_139217 - LOCATION
      ?auto_139219 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139214 ?auto_139218 ) ( TRUCK-AT ?auto_139218 ?auto_139217 ) ( IN-CITY ?auto_139217 ?auto_139219 ) ( IN-CITY ?auto_139212 ?auto_139219 ) ( not ( = ?auto_139212 ?auto_139217 ) ) ( OBJ-AT ?auto_139213 ?auto_139212 ) ( not ( = ?auto_139213 ?auto_139214 ) ) ( OBJ-AT ?auto_139215 ?auto_139212 ) ( OBJ-AT ?auto_139216 ?auto_139212 ) ( not ( = ?auto_139213 ?auto_139215 ) ) ( not ( = ?auto_139213 ?auto_139216 ) ) ( not ( = ?auto_139214 ?auto_139215 ) ) ( not ( = ?auto_139214 ?auto_139216 ) ) ( not ( = ?auto_139215 ?auto_139216 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139213 ?auto_139214 ?auto_139212 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139301 - OBJ
      ?auto_139302 - OBJ
      ?auto_139303 - OBJ
      ?auto_139304 - OBJ
      ?auto_139300 - LOCATION
    )
    :vars
    (
      ?auto_139306 - TRUCK
      ?auto_139305 - LOCATION
      ?auto_139307 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139303 ?auto_139306 ) ( TRUCK-AT ?auto_139306 ?auto_139305 ) ( IN-CITY ?auto_139305 ?auto_139307 ) ( IN-CITY ?auto_139300 ?auto_139307 ) ( not ( = ?auto_139300 ?auto_139305 ) ) ( OBJ-AT ?auto_139302 ?auto_139300 ) ( not ( = ?auto_139302 ?auto_139303 ) ) ( OBJ-AT ?auto_139301 ?auto_139300 ) ( OBJ-AT ?auto_139304 ?auto_139300 ) ( not ( = ?auto_139301 ?auto_139302 ) ) ( not ( = ?auto_139301 ?auto_139303 ) ) ( not ( = ?auto_139301 ?auto_139304 ) ) ( not ( = ?auto_139302 ?auto_139304 ) ) ( not ( = ?auto_139303 ?auto_139304 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139302 ?auto_139303 ?auto_139300 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139325 - OBJ
      ?auto_139326 - OBJ
      ?auto_139327 - OBJ
      ?auto_139328 - OBJ
      ?auto_139324 - LOCATION
    )
    :vars
    (
      ?auto_139331 - TRUCK
      ?auto_139329 - LOCATION
      ?auto_139332 - CITY
      ?auto_139330 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139328 ?auto_139331 ) ( TRUCK-AT ?auto_139331 ?auto_139329 ) ( IN-CITY ?auto_139329 ?auto_139332 ) ( IN-CITY ?auto_139324 ?auto_139332 ) ( not ( = ?auto_139324 ?auto_139329 ) ) ( OBJ-AT ?auto_139330 ?auto_139324 ) ( not ( = ?auto_139330 ?auto_139328 ) ) ( OBJ-AT ?auto_139325 ?auto_139324 ) ( OBJ-AT ?auto_139326 ?auto_139324 ) ( OBJ-AT ?auto_139327 ?auto_139324 ) ( not ( = ?auto_139325 ?auto_139326 ) ) ( not ( = ?auto_139325 ?auto_139327 ) ) ( not ( = ?auto_139325 ?auto_139328 ) ) ( not ( = ?auto_139325 ?auto_139330 ) ) ( not ( = ?auto_139326 ?auto_139327 ) ) ( not ( = ?auto_139326 ?auto_139328 ) ) ( not ( = ?auto_139326 ?auto_139330 ) ) ( not ( = ?auto_139327 ?auto_139328 ) ) ( not ( = ?auto_139327 ?auto_139330 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139330 ?auto_139328 ?auto_139324 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139342 - OBJ
      ?auto_139343 - OBJ
      ?auto_139344 - OBJ
      ?auto_139345 - OBJ
      ?auto_139341 - LOCATION
    )
    :vars
    (
      ?auto_139348 - TRUCK
      ?auto_139346 - LOCATION
      ?auto_139349 - CITY
      ?auto_139347 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139344 ?auto_139348 ) ( TRUCK-AT ?auto_139348 ?auto_139346 ) ( IN-CITY ?auto_139346 ?auto_139349 ) ( IN-CITY ?auto_139341 ?auto_139349 ) ( not ( = ?auto_139341 ?auto_139346 ) ) ( OBJ-AT ?auto_139347 ?auto_139341 ) ( not ( = ?auto_139347 ?auto_139344 ) ) ( OBJ-AT ?auto_139342 ?auto_139341 ) ( OBJ-AT ?auto_139343 ?auto_139341 ) ( OBJ-AT ?auto_139345 ?auto_139341 ) ( not ( = ?auto_139342 ?auto_139343 ) ) ( not ( = ?auto_139342 ?auto_139344 ) ) ( not ( = ?auto_139342 ?auto_139345 ) ) ( not ( = ?auto_139342 ?auto_139347 ) ) ( not ( = ?auto_139343 ?auto_139344 ) ) ( not ( = ?auto_139343 ?auto_139345 ) ) ( not ( = ?auto_139343 ?auto_139347 ) ) ( not ( = ?auto_139344 ?auto_139345 ) ) ( not ( = ?auto_139345 ?auto_139347 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139347 ?auto_139344 ?auto_139341 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139384 - OBJ
      ?auto_139385 - OBJ
      ?auto_139386 - OBJ
      ?auto_139387 - OBJ
      ?auto_139383 - LOCATION
    )
    :vars
    (
      ?auto_139389 - TRUCK
      ?auto_139388 - LOCATION
      ?auto_139390 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139385 ?auto_139389 ) ( TRUCK-AT ?auto_139389 ?auto_139388 ) ( IN-CITY ?auto_139388 ?auto_139390 ) ( IN-CITY ?auto_139383 ?auto_139390 ) ( not ( = ?auto_139383 ?auto_139388 ) ) ( OBJ-AT ?auto_139387 ?auto_139383 ) ( not ( = ?auto_139387 ?auto_139385 ) ) ( OBJ-AT ?auto_139384 ?auto_139383 ) ( OBJ-AT ?auto_139386 ?auto_139383 ) ( not ( = ?auto_139384 ?auto_139385 ) ) ( not ( = ?auto_139384 ?auto_139386 ) ) ( not ( = ?auto_139384 ?auto_139387 ) ) ( not ( = ?auto_139385 ?auto_139386 ) ) ( not ( = ?auto_139386 ?auto_139387 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139387 ?auto_139385 ?auto_139383 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139392 - OBJ
      ?auto_139393 - OBJ
      ?auto_139394 - OBJ
      ?auto_139395 - OBJ
      ?auto_139391 - LOCATION
    )
    :vars
    (
      ?auto_139398 - TRUCK
      ?auto_139396 - LOCATION
      ?auto_139399 - CITY
      ?auto_139397 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139393 ?auto_139398 ) ( TRUCK-AT ?auto_139398 ?auto_139396 ) ( IN-CITY ?auto_139396 ?auto_139399 ) ( IN-CITY ?auto_139391 ?auto_139399 ) ( not ( = ?auto_139391 ?auto_139396 ) ) ( OBJ-AT ?auto_139397 ?auto_139391 ) ( not ( = ?auto_139397 ?auto_139393 ) ) ( OBJ-AT ?auto_139392 ?auto_139391 ) ( OBJ-AT ?auto_139394 ?auto_139391 ) ( OBJ-AT ?auto_139395 ?auto_139391 ) ( not ( = ?auto_139392 ?auto_139393 ) ) ( not ( = ?auto_139392 ?auto_139394 ) ) ( not ( = ?auto_139392 ?auto_139395 ) ) ( not ( = ?auto_139392 ?auto_139397 ) ) ( not ( = ?auto_139393 ?auto_139394 ) ) ( not ( = ?auto_139393 ?auto_139395 ) ) ( not ( = ?auto_139394 ?auto_139395 ) ) ( not ( = ?auto_139394 ?auto_139397 ) ) ( not ( = ?auto_139395 ?auto_139397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139397 ?auto_139393 ?auto_139391 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139436 - OBJ
      ?auto_139437 - OBJ
      ?auto_139438 - OBJ
      ?auto_139439 - OBJ
      ?auto_139435 - LOCATION
    )
    :vars
    (
      ?auto_139441 - TRUCK
      ?auto_139440 - LOCATION
      ?auto_139442 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139436 ?auto_139441 ) ( TRUCK-AT ?auto_139441 ?auto_139440 ) ( IN-CITY ?auto_139440 ?auto_139442 ) ( IN-CITY ?auto_139435 ?auto_139442 ) ( not ( = ?auto_139435 ?auto_139440 ) ) ( OBJ-AT ?auto_139438 ?auto_139435 ) ( not ( = ?auto_139438 ?auto_139436 ) ) ( OBJ-AT ?auto_139437 ?auto_139435 ) ( OBJ-AT ?auto_139439 ?auto_139435 ) ( not ( = ?auto_139436 ?auto_139437 ) ) ( not ( = ?auto_139436 ?auto_139439 ) ) ( not ( = ?auto_139437 ?auto_139438 ) ) ( not ( = ?auto_139437 ?auto_139439 ) ) ( not ( = ?auto_139438 ?auto_139439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139438 ?auto_139436 ?auto_139435 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139460 - OBJ
      ?auto_139461 - OBJ
      ?auto_139462 - OBJ
      ?auto_139463 - OBJ
      ?auto_139459 - LOCATION
    )
    :vars
    (
      ?auto_139465 - TRUCK
      ?auto_139464 - LOCATION
      ?auto_139466 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139460 ?auto_139465 ) ( TRUCK-AT ?auto_139465 ?auto_139464 ) ( IN-CITY ?auto_139464 ?auto_139466 ) ( IN-CITY ?auto_139459 ?auto_139466 ) ( not ( = ?auto_139459 ?auto_139464 ) ) ( OBJ-AT ?auto_139463 ?auto_139459 ) ( not ( = ?auto_139463 ?auto_139460 ) ) ( OBJ-AT ?auto_139461 ?auto_139459 ) ( OBJ-AT ?auto_139462 ?auto_139459 ) ( not ( = ?auto_139460 ?auto_139461 ) ) ( not ( = ?auto_139460 ?auto_139462 ) ) ( not ( = ?auto_139461 ?auto_139462 ) ) ( not ( = ?auto_139461 ?auto_139463 ) ) ( not ( = ?auto_139462 ?auto_139463 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139463 ?auto_139460 ?auto_139459 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139540 - OBJ
      ?auto_139541 - OBJ
      ?auto_139542 - OBJ
      ?auto_139543 - OBJ
      ?auto_139539 - LOCATION
    )
    :vars
    (
      ?auto_139546 - TRUCK
      ?auto_139544 - LOCATION
      ?auto_139547 - CITY
      ?auto_139545 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_139540 ?auto_139546 ) ( TRUCK-AT ?auto_139546 ?auto_139544 ) ( IN-CITY ?auto_139544 ?auto_139547 ) ( IN-CITY ?auto_139539 ?auto_139547 ) ( not ( = ?auto_139539 ?auto_139544 ) ) ( OBJ-AT ?auto_139545 ?auto_139539 ) ( not ( = ?auto_139545 ?auto_139540 ) ) ( OBJ-AT ?auto_139541 ?auto_139539 ) ( OBJ-AT ?auto_139542 ?auto_139539 ) ( OBJ-AT ?auto_139543 ?auto_139539 ) ( not ( = ?auto_139540 ?auto_139541 ) ) ( not ( = ?auto_139540 ?auto_139542 ) ) ( not ( = ?auto_139540 ?auto_139543 ) ) ( not ( = ?auto_139541 ?auto_139542 ) ) ( not ( = ?auto_139541 ?auto_139543 ) ) ( not ( = ?auto_139541 ?auto_139545 ) ) ( not ( = ?auto_139542 ?auto_139543 ) ) ( not ( = ?auto_139542 ?auto_139545 ) ) ( not ( = ?auto_139543 ?auto_139545 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139545 ?auto_139540 ?auto_139539 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139691 - OBJ
      ?auto_139692 - OBJ
      ?auto_139693 - OBJ
      ?auto_139690 - LOCATION
    )
    :vars
    (
      ?auto_139695 - TRUCK
      ?auto_139696 - LOCATION
      ?auto_139694 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139695 ?auto_139696 ) ( IN-CITY ?auto_139696 ?auto_139694 ) ( IN-CITY ?auto_139690 ?auto_139694 ) ( not ( = ?auto_139690 ?auto_139696 ) ) ( OBJ-AT ?auto_139691 ?auto_139690 ) ( not ( = ?auto_139691 ?auto_139693 ) ) ( OBJ-AT ?auto_139693 ?auto_139696 ) ( OBJ-AT ?auto_139692 ?auto_139690 ) ( not ( = ?auto_139691 ?auto_139692 ) ) ( not ( = ?auto_139692 ?auto_139693 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139691 ?auto_139693 ?auto_139690 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139724 - OBJ
      ?auto_139725 - OBJ
      ?auto_139726 - OBJ
      ?auto_139723 - LOCATION
    )
    :vars
    (
      ?auto_139729 - TRUCK
      ?auto_139730 - LOCATION
      ?auto_139727 - CITY
      ?auto_139728 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139729 ?auto_139730 ) ( IN-CITY ?auto_139730 ?auto_139727 ) ( IN-CITY ?auto_139723 ?auto_139727 ) ( not ( = ?auto_139723 ?auto_139730 ) ) ( OBJ-AT ?auto_139728 ?auto_139723 ) ( not ( = ?auto_139728 ?auto_139726 ) ) ( OBJ-AT ?auto_139726 ?auto_139730 ) ( OBJ-AT ?auto_139724 ?auto_139723 ) ( OBJ-AT ?auto_139725 ?auto_139723 ) ( not ( = ?auto_139724 ?auto_139725 ) ) ( not ( = ?auto_139724 ?auto_139726 ) ) ( not ( = ?auto_139724 ?auto_139728 ) ) ( not ( = ?auto_139725 ?auto_139726 ) ) ( not ( = ?auto_139725 ?auto_139728 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139728 ?auto_139726 ?auto_139723 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139736 - OBJ
      ?auto_139737 - OBJ
      ?auto_139738 - OBJ
      ?auto_139735 - LOCATION
    )
    :vars
    (
      ?auto_139741 - TRUCK
      ?auto_139742 - LOCATION
      ?auto_139739 - CITY
      ?auto_139740 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139741 ?auto_139742 ) ( IN-CITY ?auto_139742 ?auto_139739 ) ( IN-CITY ?auto_139735 ?auto_139739 ) ( not ( = ?auto_139735 ?auto_139742 ) ) ( OBJ-AT ?auto_139740 ?auto_139735 ) ( not ( = ?auto_139740 ?auto_139737 ) ) ( OBJ-AT ?auto_139737 ?auto_139742 ) ( OBJ-AT ?auto_139736 ?auto_139735 ) ( OBJ-AT ?auto_139738 ?auto_139735 ) ( not ( = ?auto_139736 ?auto_139737 ) ) ( not ( = ?auto_139736 ?auto_139738 ) ) ( not ( = ?auto_139736 ?auto_139740 ) ) ( not ( = ?auto_139737 ?auto_139738 ) ) ( not ( = ?auto_139738 ?auto_139740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139740 ?auto_139737 ?auto_139735 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_139774 - OBJ
      ?auto_139775 - OBJ
      ?auto_139776 - OBJ
      ?auto_139773 - LOCATION
    )
    :vars
    (
      ?auto_139779 - TRUCK
      ?auto_139780 - LOCATION
      ?auto_139777 - CITY
      ?auto_139778 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139779 ?auto_139780 ) ( IN-CITY ?auto_139780 ?auto_139777 ) ( IN-CITY ?auto_139773 ?auto_139777 ) ( not ( = ?auto_139773 ?auto_139780 ) ) ( OBJ-AT ?auto_139778 ?auto_139773 ) ( not ( = ?auto_139778 ?auto_139774 ) ) ( OBJ-AT ?auto_139774 ?auto_139780 ) ( OBJ-AT ?auto_139775 ?auto_139773 ) ( OBJ-AT ?auto_139776 ?auto_139773 ) ( not ( = ?auto_139774 ?auto_139775 ) ) ( not ( = ?auto_139774 ?auto_139776 ) ) ( not ( = ?auto_139775 ?auto_139776 ) ) ( not ( = ?auto_139775 ?auto_139778 ) ) ( not ( = ?auto_139776 ?auto_139778 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139778 ?auto_139774 ?auto_139773 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139901 - OBJ
      ?auto_139902 - OBJ
      ?auto_139903 - OBJ
      ?auto_139904 - OBJ
      ?auto_139900 - LOCATION
    )
    :vars
    (
      ?auto_139906 - TRUCK
      ?auto_139907 - LOCATION
      ?auto_139905 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139906 ?auto_139907 ) ( IN-CITY ?auto_139907 ?auto_139905 ) ( IN-CITY ?auto_139900 ?auto_139905 ) ( not ( = ?auto_139900 ?auto_139907 ) ) ( OBJ-AT ?auto_139901 ?auto_139900 ) ( not ( = ?auto_139901 ?auto_139902 ) ) ( OBJ-AT ?auto_139902 ?auto_139907 ) ( OBJ-AT ?auto_139903 ?auto_139900 ) ( OBJ-AT ?auto_139904 ?auto_139900 ) ( not ( = ?auto_139901 ?auto_139903 ) ) ( not ( = ?auto_139901 ?auto_139904 ) ) ( not ( = ?auto_139902 ?auto_139903 ) ) ( not ( = ?auto_139902 ?auto_139904 ) ) ( not ( = ?auto_139903 ?auto_139904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139901 ?auto_139902 ?auto_139900 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139917 - OBJ
      ?auto_139918 - OBJ
      ?auto_139919 - OBJ
      ?auto_139920 - OBJ
      ?auto_139916 - LOCATION
    )
    :vars
    (
      ?auto_139922 - TRUCK
      ?auto_139923 - LOCATION
      ?auto_139921 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139922 ?auto_139923 ) ( IN-CITY ?auto_139923 ?auto_139921 ) ( IN-CITY ?auto_139916 ?auto_139921 ) ( not ( = ?auto_139916 ?auto_139923 ) ) ( OBJ-AT ?auto_139920 ?auto_139916 ) ( not ( = ?auto_139920 ?auto_139918 ) ) ( OBJ-AT ?auto_139918 ?auto_139923 ) ( OBJ-AT ?auto_139917 ?auto_139916 ) ( OBJ-AT ?auto_139919 ?auto_139916 ) ( not ( = ?auto_139917 ?auto_139918 ) ) ( not ( = ?auto_139917 ?auto_139919 ) ) ( not ( = ?auto_139917 ?auto_139920 ) ) ( not ( = ?auto_139918 ?auto_139919 ) ) ( not ( = ?auto_139919 ?auto_139920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139920 ?auto_139918 ?auto_139916 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139965 - OBJ
      ?auto_139966 - OBJ
      ?auto_139967 - OBJ
      ?auto_139968 - OBJ
      ?auto_139964 - LOCATION
    )
    :vars
    (
      ?auto_139970 - TRUCK
      ?auto_139971 - LOCATION
      ?auto_139969 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139970 ?auto_139971 ) ( IN-CITY ?auto_139971 ?auto_139969 ) ( IN-CITY ?auto_139964 ?auto_139969 ) ( not ( = ?auto_139964 ?auto_139971 ) ) ( OBJ-AT ?auto_139966 ?auto_139964 ) ( not ( = ?auto_139966 ?auto_139968 ) ) ( OBJ-AT ?auto_139968 ?auto_139971 ) ( OBJ-AT ?auto_139965 ?auto_139964 ) ( OBJ-AT ?auto_139967 ?auto_139964 ) ( not ( = ?auto_139965 ?auto_139966 ) ) ( not ( = ?auto_139965 ?auto_139967 ) ) ( not ( = ?auto_139965 ?auto_139968 ) ) ( not ( = ?auto_139966 ?auto_139967 ) ) ( not ( = ?auto_139967 ?auto_139968 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139966 ?auto_139968 ?auto_139964 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_139981 - OBJ
      ?auto_139982 - OBJ
      ?auto_139983 - OBJ
      ?auto_139984 - OBJ
      ?auto_139980 - LOCATION
    )
    :vars
    (
      ?auto_139986 - TRUCK
      ?auto_139987 - LOCATION
      ?auto_139985 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_139986 ?auto_139987 ) ( IN-CITY ?auto_139987 ?auto_139985 ) ( IN-CITY ?auto_139980 ?auto_139985 ) ( not ( = ?auto_139980 ?auto_139987 ) ) ( OBJ-AT ?auto_139982 ?auto_139980 ) ( not ( = ?auto_139982 ?auto_139983 ) ) ( OBJ-AT ?auto_139983 ?auto_139987 ) ( OBJ-AT ?auto_139981 ?auto_139980 ) ( OBJ-AT ?auto_139984 ?auto_139980 ) ( not ( = ?auto_139981 ?auto_139982 ) ) ( not ( = ?auto_139981 ?auto_139983 ) ) ( not ( = ?auto_139981 ?auto_139984 ) ) ( not ( = ?auto_139982 ?auto_139984 ) ) ( not ( = ?auto_139983 ?auto_139984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_139982 ?auto_139983 ?auto_139980 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140005 - OBJ
      ?auto_140006 - OBJ
      ?auto_140007 - OBJ
      ?auto_140008 - OBJ
      ?auto_140004 - LOCATION
    )
    :vars
    (
      ?auto_140010 - TRUCK
      ?auto_140011 - LOCATION
      ?auto_140009 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140010 ?auto_140011 ) ( IN-CITY ?auto_140011 ?auto_140009 ) ( IN-CITY ?auto_140004 ?auto_140009 ) ( not ( = ?auto_140004 ?auto_140011 ) ) ( OBJ-AT ?auto_140007 ?auto_140004 ) ( not ( = ?auto_140007 ?auto_140008 ) ) ( OBJ-AT ?auto_140008 ?auto_140011 ) ( OBJ-AT ?auto_140005 ?auto_140004 ) ( OBJ-AT ?auto_140006 ?auto_140004 ) ( not ( = ?auto_140005 ?auto_140006 ) ) ( not ( = ?auto_140005 ?auto_140007 ) ) ( not ( = ?auto_140005 ?auto_140008 ) ) ( not ( = ?auto_140006 ?auto_140007 ) ) ( not ( = ?auto_140006 ?auto_140008 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140007 ?auto_140008 ?auto_140004 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140013 - OBJ
      ?auto_140014 - OBJ
      ?auto_140015 - OBJ
      ?auto_140016 - OBJ
      ?auto_140012 - LOCATION
    )
    :vars
    (
      ?auto_140019 - TRUCK
      ?auto_140020 - LOCATION
      ?auto_140017 - CITY
      ?auto_140018 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140019 ?auto_140020 ) ( IN-CITY ?auto_140020 ?auto_140017 ) ( IN-CITY ?auto_140012 ?auto_140017 ) ( not ( = ?auto_140012 ?auto_140020 ) ) ( OBJ-AT ?auto_140018 ?auto_140012 ) ( not ( = ?auto_140018 ?auto_140016 ) ) ( OBJ-AT ?auto_140016 ?auto_140020 ) ( OBJ-AT ?auto_140013 ?auto_140012 ) ( OBJ-AT ?auto_140014 ?auto_140012 ) ( OBJ-AT ?auto_140015 ?auto_140012 ) ( not ( = ?auto_140013 ?auto_140014 ) ) ( not ( = ?auto_140013 ?auto_140015 ) ) ( not ( = ?auto_140013 ?auto_140016 ) ) ( not ( = ?auto_140013 ?auto_140018 ) ) ( not ( = ?auto_140014 ?auto_140015 ) ) ( not ( = ?auto_140014 ?auto_140016 ) ) ( not ( = ?auto_140014 ?auto_140018 ) ) ( not ( = ?auto_140015 ?auto_140016 ) ) ( not ( = ?auto_140015 ?auto_140018 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140018 ?auto_140016 ?auto_140012 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140022 - OBJ
      ?auto_140023 - OBJ
      ?auto_140024 - OBJ
      ?auto_140025 - OBJ
      ?auto_140021 - LOCATION
    )
    :vars
    (
      ?auto_140027 - TRUCK
      ?auto_140028 - LOCATION
      ?auto_140026 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140027 ?auto_140028 ) ( IN-CITY ?auto_140028 ?auto_140026 ) ( IN-CITY ?auto_140021 ?auto_140026 ) ( not ( = ?auto_140021 ?auto_140028 ) ) ( OBJ-AT ?auto_140025 ?auto_140021 ) ( not ( = ?auto_140025 ?auto_140024 ) ) ( OBJ-AT ?auto_140024 ?auto_140028 ) ( OBJ-AT ?auto_140022 ?auto_140021 ) ( OBJ-AT ?auto_140023 ?auto_140021 ) ( not ( = ?auto_140022 ?auto_140023 ) ) ( not ( = ?auto_140022 ?auto_140024 ) ) ( not ( = ?auto_140022 ?auto_140025 ) ) ( not ( = ?auto_140023 ?auto_140024 ) ) ( not ( = ?auto_140023 ?auto_140025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140025 ?auto_140024 ?auto_140021 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140030 - OBJ
      ?auto_140031 - OBJ
      ?auto_140032 - OBJ
      ?auto_140033 - OBJ
      ?auto_140029 - LOCATION
    )
    :vars
    (
      ?auto_140036 - TRUCK
      ?auto_140037 - LOCATION
      ?auto_140034 - CITY
      ?auto_140035 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140036 ?auto_140037 ) ( IN-CITY ?auto_140037 ?auto_140034 ) ( IN-CITY ?auto_140029 ?auto_140034 ) ( not ( = ?auto_140029 ?auto_140037 ) ) ( OBJ-AT ?auto_140035 ?auto_140029 ) ( not ( = ?auto_140035 ?auto_140032 ) ) ( OBJ-AT ?auto_140032 ?auto_140037 ) ( OBJ-AT ?auto_140030 ?auto_140029 ) ( OBJ-AT ?auto_140031 ?auto_140029 ) ( OBJ-AT ?auto_140033 ?auto_140029 ) ( not ( = ?auto_140030 ?auto_140031 ) ) ( not ( = ?auto_140030 ?auto_140032 ) ) ( not ( = ?auto_140030 ?auto_140033 ) ) ( not ( = ?auto_140030 ?auto_140035 ) ) ( not ( = ?auto_140031 ?auto_140032 ) ) ( not ( = ?auto_140031 ?auto_140033 ) ) ( not ( = ?auto_140031 ?auto_140035 ) ) ( not ( = ?auto_140032 ?auto_140033 ) ) ( not ( = ?auto_140033 ?auto_140035 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140035 ?auto_140032 ?auto_140029 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140080 - OBJ
      ?auto_140081 - OBJ
      ?auto_140082 - OBJ
      ?auto_140083 - OBJ
      ?auto_140079 - LOCATION
    )
    :vars
    (
      ?auto_140086 - TRUCK
      ?auto_140087 - LOCATION
      ?auto_140084 - CITY
      ?auto_140085 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140086 ?auto_140087 ) ( IN-CITY ?auto_140087 ?auto_140084 ) ( IN-CITY ?auto_140079 ?auto_140084 ) ( not ( = ?auto_140079 ?auto_140087 ) ) ( OBJ-AT ?auto_140085 ?auto_140079 ) ( not ( = ?auto_140085 ?auto_140081 ) ) ( OBJ-AT ?auto_140081 ?auto_140087 ) ( OBJ-AT ?auto_140080 ?auto_140079 ) ( OBJ-AT ?auto_140082 ?auto_140079 ) ( OBJ-AT ?auto_140083 ?auto_140079 ) ( not ( = ?auto_140080 ?auto_140081 ) ) ( not ( = ?auto_140080 ?auto_140082 ) ) ( not ( = ?auto_140080 ?auto_140083 ) ) ( not ( = ?auto_140080 ?auto_140085 ) ) ( not ( = ?auto_140081 ?auto_140082 ) ) ( not ( = ?auto_140081 ?auto_140083 ) ) ( not ( = ?auto_140082 ?auto_140083 ) ) ( not ( = ?auto_140082 ?auto_140085 ) ) ( not ( = ?auto_140083 ?auto_140085 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140085 ?auto_140081 ?auto_140079 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140124 - OBJ
      ?auto_140125 - OBJ
      ?auto_140126 - OBJ
      ?auto_140127 - OBJ
      ?auto_140123 - LOCATION
    )
    :vars
    (
      ?auto_140129 - TRUCK
      ?auto_140130 - LOCATION
      ?auto_140128 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140129 ?auto_140130 ) ( IN-CITY ?auto_140130 ?auto_140128 ) ( IN-CITY ?auto_140123 ?auto_140128 ) ( not ( = ?auto_140123 ?auto_140130 ) ) ( OBJ-AT ?auto_140125 ?auto_140123 ) ( not ( = ?auto_140125 ?auto_140124 ) ) ( OBJ-AT ?auto_140124 ?auto_140130 ) ( OBJ-AT ?auto_140126 ?auto_140123 ) ( OBJ-AT ?auto_140127 ?auto_140123 ) ( not ( = ?auto_140124 ?auto_140126 ) ) ( not ( = ?auto_140124 ?auto_140127 ) ) ( not ( = ?auto_140125 ?auto_140126 ) ) ( not ( = ?auto_140125 ?auto_140127 ) ) ( not ( = ?auto_140126 ?auto_140127 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140125 ?auto_140124 ?auto_140123 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140132 - OBJ
      ?auto_140133 - OBJ
      ?auto_140134 - OBJ
      ?auto_140135 - OBJ
      ?auto_140131 - LOCATION
    )
    :vars
    (
      ?auto_140137 - TRUCK
      ?auto_140138 - LOCATION
      ?auto_140136 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140137 ?auto_140138 ) ( IN-CITY ?auto_140138 ?auto_140136 ) ( IN-CITY ?auto_140131 ?auto_140136 ) ( not ( = ?auto_140131 ?auto_140138 ) ) ( OBJ-AT ?auto_140134 ?auto_140131 ) ( not ( = ?auto_140134 ?auto_140132 ) ) ( OBJ-AT ?auto_140132 ?auto_140138 ) ( OBJ-AT ?auto_140133 ?auto_140131 ) ( OBJ-AT ?auto_140135 ?auto_140131 ) ( not ( = ?auto_140132 ?auto_140133 ) ) ( not ( = ?auto_140132 ?auto_140135 ) ) ( not ( = ?auto_140133 ?auto_140134 ) ) ( not ( = ?auto_140133 ?auto_140135 ) ) ( not ( = ?auto_140134 ?auto_140135 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140134 ?auto_140132 ?auto_140131 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140228 - OBJ
      ?auto_140229 - OBJ
      ?auto_140230 - OBJ
      ?auto_140231 - OBJ
      ?auto_140227 - LOCATION
    )
    :vars
    (
      ?auto_140234 - TRUCK
      ?auto_140235 - LOCATION
      ?auto_140232 - CITY
      ?auto_140233 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_140234 ?auto_140235 ) ( IN-CITY ?auto_140235 ?auto_140232 ) ( IN-CITY ?auto_140227 ?auto_140232 ) ( not ( = ?auto_140227 ?auto_140235 ) ) ( OBJ-AT ?auto_140233 ?auto_140227 ) ( not ( = ?auto_140233 ?auto_140228 ) ) ( OBJ-AT ?auto_140228 ?auto_140235 ) ( OBJ-AT ?auto_140229 ?auto_140227 ) ( OBJ-AT ?auto_140230 ?auto_140227 ) ( OBJ-AT ?auto_140231 ?auto_140227 ) ( not ( = ?auto_140228 ?auto_140229 ) ) ( not ( = ?auto_140228 ?auto_140230 ) ) ( not ( = ?auto_140228 ?auto_140231 ) ) ( not ( = ?auto_140229 ?auto_140230 ) ) ( not ( = ?auto_140229 ?auto_140231 ) ) ( not ( = ?auto_140229 ?auto_140233 ) ) ( not ( = ?auto_140230 ?auto_140231 ) ) ( not ( = ?auto_140230 ?auto_140233 ) ) ( not ( = ?auto_140231 ?auto_140233 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140233 ?auto_140228 ?auto_140227 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140379 - OBJ
      ?auto_140380 - OBJ
      ?auto_140381 - OBJ
      ?auto_140378 - LOCATION
    )
    :vars
    (
      ?auto_140384 - LOCATION
      ?auto_140383 - CITY
      ?auto_140382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140384 ?auto_140383 ) ( IN-CITY ?auto_140378 ?auto_140383 ) ( not ( = ?auto_140378 ?auto_140384 ) ) ( OBJ-AT ?auto_140380 ?auto_140378 ) ( not ( = ?auto_140380 ?auto_140381 ) ) ( OBJ-AT ?auto_140381 ?auto_140384 ) ( TRUCK-AT ?auto_140382 ?auto_140378 ) ( OBJ-AT ?auto_140379 ?auto_140378 ) ( not ( = ?auto_140379 ?auto_140380 ) ) ( not ( = ?auto_140379 ?auto_140381 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140380 ?auto_140381 ?auto_140378 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140390 - OBJ
      ?auto_140391 - OBJ
      ?auto_140392 - OBJ
      ?auto_140389 - LOCATION
    )
    :vars
    (
      ?auto_140395 - LOCATION
      ?auto_140394 - CITY
      ?auto_140393 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140395 ?auto_140394 ) ( IN-CITY ?auto_140389 ?auto_140394 ) ( not ( = ?auto_140389 ?auto_140395 ) ) ( OBJ-AT ?auto_140392 ?auto_140389 ) ( not ( = ?auto_140392 ?auto_140391 ) ) ( OBJ-AT ?auto_140391 ?auto_140395 ) ( TRUCK-AT ?auto_140393 ?auto_140389 ) ( OBJ-AT ?auto_140390 ?auto_140389 ) ( not ( = ?auto_140390 ?auto_140391 ) ) ( not ( = ?auto_140390 ?auto_140392 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140392 ?auto_140391 ?auto_140389 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140412 - OBJ
      ?auto_140413 - OBJ
      ?auto_140414 - OBJ
      ?auto_140411 - LOCATION
    )
    :vars
    (
      ?auto_140418 - LOCATION
      ?auto_140417 - CITY
      ?auto_140415 - OBJ
      ?auto_140416 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140418 ?auto_140417 ) ( IN-CITY ?auto_140411 ?auto_140417 ) ( not ( = ?auto_140411 ?auto_140418 ) ) ( OBJ-AT ?auto_140415 ?auto_140411 ) ( not ( = ?auto_140415 ?auto_140414 ) ) ( OBJ-AT ?auto_140414 ?auto_140418 ) ( TRUCK-AT ?auto_140416 ?auto_140411 ) ( OBJ-AT ?auto_140412 ?auto_140411 ) ( OBJ-AT ?auto_140413 ?auto_140411 ) ( not ( = ?auto_140412 ?auto_140413 ) ) ( not ( = ?auto_140412 ?auto_140414 ) ) ( not ( = ?auto_140412 ?auto_140415 ) ) ( not ( = ?auto_140413 ?auto_140414 ) ) ( not ( = ?auto_140413 ?auto_140415 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140415 ?auto_140414 ?auto_140411 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140424 - OBJ
      ?auto_140425 - OBJ
      ?auto_140426 - OBJ
      ?auto_140423 - LOCATION
    )
    :vars
    (
      ?auto_140430 - LOCATION
      ?auto_140429 - CITY
      ?auto_140427 - OBJ
      ?auto_140428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140430 ?auto_140429 ) ( IN-CITY ?auto_140423 ?auto_140429 ) ( not ( = ?auto_140423 ?auto_140430 ) ) ( OBJ-AT ?auto_140427 ?auto_140423 ) ( not ( = ?auto_140427 ?auto_140425 ) ) ( OBJ-AT ?auto_140425 ?auto_140430 ) ( TRUCK-AT ?auto_140428 ?auto_140423 ) ( OBJ-AT ?auto_140424 ?auto_140423 ) ( OBJ-AT ?auto_140426 ?auto_140423 ) ( not ( = ?auto_140424 ?auto_140425 ) ) ( not ( = ?auto_140424 ?auto_140426 ) ) ( not ( = ?auto_140424 ?auto_140427 ) ) ( not ( = ?auto_140425 ?auto_140426 ) ) ( not ( = ?auto_140426 ?auto_140427 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140427 ?auto_140425 ?auto_140423 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140440 - OBJ
      ?auto_140441 - OBJ
      ?auto_140442 - OBJ
      ?auto_140439 - LOCATION
    )
    :vars
    (
      ?auto_140445 - LOCATION
      ?auto_140444 - CITY
      ?auto_140443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140445 ?auto_140444 ) ( IN-CITY ?auto_140439 ?auto_140444 ) ( not ( = ?auto_140439 ?auto_140445 ) ) ( OBJ-AT ?auto_140442 ?auto_140439 ) ( not ( = ?auto_140442 ?auto_140440 ) ) ( OBJ-AT ?auto_140440 ?auto_140445 ) ( TRUCK-AT ?auto_140443 ?auto_140439 ) ( OBJ-AT ?auto_140441 ?auto_140439 ) ( not ( = ?auto_140440 ?auto_140441 ) ) ( not ( = ?auto_140441 ?auto_140442 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140442 ?auto_140440 ?auto_140439 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_140462 - OBJ
      ?auto_140463 - OBJ
      ?auto_140464 - OBJ
      ?auto_140461 - LOCATION
    )
    :vars
    (
      ?auto_140468 - LOCATION
      ?auto_140467 - CITY
      ?auto_140465 - OBJ
      ?auto_140466 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140468 ?auto_140467 ) ( IN-CITY ?auto_140461 ?auto_140467 ) ( not ( = ?auto_140461 ?auto_140468 ) ) ( OBJ-AT ?auto_140465 ?auto_140461 ) ( not ( = ?auto_140465 ?auto_140462 ) ) ( OBJ-AT ?auto_140462 ?auto_140468 ) ( TRUCK-AT ?auto_140466 ?auto_140461 ) ( OBJ-AT ?auto_140463 ?auto_140461 ) ( OBJ-AT ?auto_140464 ?auto_140461 ) ( not ( = ?auto_140462 ?auto_140463 ) ) ( not ( = ?auto_140462 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140464 ) ) ( not ( = ?auto_140463 ?auto_140465 ) ) ( not ( = ?auto_140464 ?auto_140465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140465 ?auto_140462 ?auto_140461 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140509 - OBJ
      ?auto_140510 - OBJ
      ?auto_140511 - OBJ
      ?auto_140512 - OBJ
      ?auto_140508 - LOCATION
    )
    :vars
    (
      ?auto_140515 - LOCATION
      ?auto_140514 - CITY
      ?auto_140513 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140515 ?auto_140514 ) ( IN-CITY ?auto_140508 ?auto_140514 ) ( not ( = ?auto_140508 ?auto_140515 ) ) ( OBJ-AT ?auto_140509 ?auto_140508 ) ( not ( = ?auto_140509 ?auto_140512 ) ) ( OBJ-AT ?auto_140512 ?auto_140515 ) ( TRUCK-AT ?auto_140513 ?auto_140508 ) ( OBJ-AT ?auto_140510 ?auto_140508 ) ( OBJ-AT ?auto_140511 ?auto_140508 ) ( not ( = ?auto_140509 ?auto_140510 ) ) ( not ( = ?auto_140509 ?auto_140511 ) ) ( not ( = ?auto_140510 ?auto_140511 ) ) ( not ( = ?auto_140510 ?auto_140512 ) ) ( not ( = ?auto_140511 ?auto_140512 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140509 ?auto_140512 ?auto_140508 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140517 - OBJ
      ?auto_140518 - OBJ
      ?auto_140519 - OBJ
      ?auto_140520 - OBJ
      ?auto_140516 - LOCATION
    )
    :vars
    (
      ?auto_140523 - LOCATION
      ?auto_140522 - CITY
      ?auto_140521 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140523 ?auto_140522 ) ( IN-CITY ?auto_140516 ?auto_140522 ) ( not ( = ?auto_140516 ?auto_140523 ) ) ( OBJ-AT ?auto_140520 ?auto_140516 ) ( not ( = ?auto_140520 ?auto_140519 ) ) ( OBJ-AT ?auto_140519 ?auto_140523 ) ( TRUCK-AT ?auto_140521 ?auto_140516 ) ( OBJ-AT ?auto_140517 ?auto_140516 ) ( OBJ-AT ?auto_140518 ?auto_140516 ) ( not ( = ?auto_140517 ?auto_140518 ) ) ( not ( = ?auto_140517 ?auto_140519 ) ) ( not ( = ?auto_140517 ?auto_140520 ) ) ( not ( = ?auto_140518 ?auto_140519 ) ) ( not ( = ?auto_140518 ?auto_140520 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140520 ?auto_140519 ?auto_140516 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140581 - OBJ
      ?auto_140582 - OBJ
      ?auto_140583 - OBJ
      ?auto_140584 - OBJ
      ?auto_140580 - LOCATION
    )
    :vars
    (
      ?auto_140587 - LOCATION
      ?auto_140586 - CITY
      ?auto_140585 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140587 ?auto_140586 ) ( IN-CITY ?auto_140580 ?auto_140586 ) ( not ( = ?auto_140580 ?auto_140587 ) ) ( OBJ-AT ?auto_140581 ?auto_140580 ) ( not ( = ?auto_140581 ?auto_140582 ) ) ( OBJ-AT ?auto_140582 ?auto_140587 ) ( TRUCK-AT ?auto_140585 ?auto_140580 ) ( OBJ-AT ?auto_140583 ?auto_140580 ) ( OBJ-AT ?auto_140584 ?auto_140580 ) ( not ( = ?auto_140581 ?auto_140583 ) ) ( not ( = ?auto_140581 ?auto_140584 ) ) ( not ( = ?auto_140582 ?auto_140583 ) ) ( not ( = ?auto_140582 ?auto_140584 ) ) ( not ( = ?auto_140583 ?auto_140584 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140581 ?auto_140582 ?auto_140580 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140661 - OBJ
      ?auto_140662 - OBJ
      ?auto_140663 - OBJ
      ?auto_140664 - OBJ
      ?auto_140660 - LOCATION
    )
    :vars
    (
      ?auto_140667 - LOCATION
      ?auto_140666 - CITY
      ?auto_140665 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140667 ?auto_140666 ) ( IN-CITY ?auto_140660 ?auto_140666 ) ( not ( = ?auto_140660 ?auto_140667 ) ) ( OBJ-AT ?auto_140662 ?auto_140660 ) ( not ( = ?auto_140662 ?auto_140664 ) ) ( OBJ-AT ?auto_140664 ?auto_140667 ) ( TRUCK-AT ?auto_140665 ?auto_140660 ) ( OBJ-AT ?auto_140661 ?auto_140660 ) ( OBJ-AT ?auto_140663 ?auto_140660 ) ( not ( = ?auto_140661 ?auto_140662 ) ) ( not ( = ?auto_140661 ?auto_140663 ) ) ( not ( = ?auto_140661 ?auto_140664 ) ) ( not ( = ?auto_140662 ?auto_140663 ) ) ( not ( = ?auto_140663 ?auto_140664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140662 ?auto_140664 ?auto_140660 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140669 - OBJ
      ?auto_140670 - OBJ
      ?auto_140671 - OBJ
      ?auto_140672 - OBJ
      ?auto_140668 - LOCATION
    )
    :vars
    (
      ?auto_140675 - LOCATION
      ?auto_140674 - CITY
      ?auto_140673 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140675 ?auto_140674 ) ( IN-CITY ?auto_140668 ?auto_140674 ) ( not ( = ?auto_140668 ?auto_140675 ) ) ( OBJ-AT ?auto_140670 ?auto_140668 ) ( not ( = ?auto_140670 ?auto_140671 ) ) ( OBJ-AT ?auto_140671 ?auto_140675 ) ( TRUCK-AT ?auto_140673 ?auto_140668 ) ( OBJ-AT ?auto_140669 ?auto_140668 ) ( OBJ-AT ?auto_140672 ?auto_140668 ) ( not ( = ?auto_140669 ?auto_140670 ) ) ( not ( = ?auto_140669 ?auto_140671 ) ) ( not ( = ?auto_140669 ?auto_140672 ) ) ( not ( = ?auto_140670 ?auto_140672 ) ) ( not ( = ?auto_140671 ?auto_140672 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140670 ?auto_140671 ?auto_140668 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140701 - OBJ
      ?auto_140702 - OBJ
      ?auto_140703 - OBJ
      ?auto_140704 - OBJ
      ?auto_140700 - LOCATION
    )
    :vars
    (
      ?auto_140708 - LOCATION
      ?auto_140707 - CITY
      ?auto_140705 - OBJ
      ?auto_140706 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140708 ?auto_140707 ) ( IN-CITY ?auto_140700 ?auto_140707 ) ( not ( = ?auto_140700 ?auto_140708 ) ) ( OBJ-AT ?auto_140705 ?auto_140700 ) ( not ( = ?auto_140705 ?auto_140704 ) ) ( OBJ-AT ?auto_140704 ?auto_140708 ) ( TRUCK-AT ?auto_140706 ?auto_140700 ) ( OBJ-AT ?auto_140701 ?auto_140700 ) ( OBJ-AT ?auto_140702 ?auto_140700 ) ( OBJ-AT ?auto_140703 ?auto_140700 ) ( not ( = ?auto_140701 ?auto_140702 ) ) ( not ( = ?auto_140701 ?auto_140703 ) ) ( not ( = ?auto_140701 ?auto_140704 ) ) ( not ( = ?auto_140701 ?auto_140705 ) ) ( not ( = ?auto_140702 ?auto_140703 ) ) ( not ( = ?auto_140702 ?auto_140704 ) ) ( not ( = ?auto_140702 ?auto_140705 ) ) ( not ( = ?auto_140703 ?auto_140704 ) ) ( not ( = ?auto_140703 ?auto_140705 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140705 ?auto_140704 ?auto_140700 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140718 - OBJ
      ?auto_140719 - OBJ
      ?auto_140720 - OBJ
      ?auto_140721 - OBJ
      ?auto_140717 - LOCATION
    )
    :vars
    (
      ?auto_140725 - LOCATION
      ?auto_140724 - CITY
      ?auto_140722 - OBJ
      ?auto_140723 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140725 ?auto_140724 ) ( IN-CITY ?auto_140717 ?auto_140724 ) ( not ( = ?auto_140717 ?auto_140725 ) ) ( OBJ-AT ?auto_140722 ?auto_140717 ) ( not ( = ?auto_140722 ?auto_140720 ) ) ( OBJ-AT ?auto_140720 ?auto_140725 ) ( TRUCK-AT ?auto_140723 ?auto_140717 ) ( OBJ-AT ?auto_140718 ?auto_140717 ) ( OBJ-AT ?auto_140719 ?auto_140717 ) ( OBJ-AT ?auto_140721 ?auto_140717 ) ( not ( = ?auto_140718 ?auto_140719 ) ) ( not ( = ?auto_140718 ?auto_140720 ) ) ( not ( = ?auto_140718 ?auto_140721 ) ) ( not ( = ?auto_140718 ?auto_140722 ) ) ( not ( = ?auto_140719 ?auto_140720 ) ) ( not ( = ?auto_140719 ?auto_140721 ) ) ( not ( = ?auto_140719 ?auto_140722 ) ) ( not ( = ?auto_140720 ?auto_140721 ) ) ( not ( = ?auto_140721 ?auto_140722 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140722 ?auto_140720 ?auto_140717 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140744 - OBJ
      ?auto_140745 - OBJ
      ?auto_140746 - OBJ
      ?auto_140747 - OBJ
      ?auto_140743 - LOCATION
    )
    :vars
    (
      ?auto_140750 - LOCATION
      ?auto_140749 - CITY
      ?auto_140748 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140750 ?auto_140749 ) ( IN-CITY ?auto_140743 ?auto_140749 ) ( not ( = ?auto_140743 ?auto_140750 ) ) ( OBJ-AT ?auto_140746 ?auto_140743 ) ( not ( = ?auto_140746 ?auto_140745 ) ) ( OBJ-AT ?auto_140745 ?auto_140750 ) ( TRUCK-AT ?auto_140748 ?auto_140743 ) ( OBJ-AT ?auto_140744 ?auto_140743 ) ( OBJ-AT ?auto_140747 ?auto_140743 ) ( not ( = ?auto_140744 ?auto_140745 ) ) ( not ( = ?auto_140744 ?auto_140746 ) ) ( not ( = ?auto_140744 ?auto_140747 ) ) ( not ( = ?auto_140745 ?auto_140747 ) ) ( not ( = ?auto_140746 ?auto_140747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140746 ?auto_140745 ?auto_140743 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140768 - OBJ
      ?auto_140769 - OBJ
      ?auto_140770 - OBJ
      ?auto_140771 - OBJ
      ?auto_140767 - LOCATION
    )
    :vars
    (
      ?auto_140775 - LOCATION
      ?auto_140774 - CITY
      ?auto_140772 - OBJ
      ?auto_140773 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140775 ?auto_140774 ) ( IN-CITY ?auto_140767 ?auto_140774 ) ( not ( = ?auto_140767 ?auto_140775 ) ) ( OBJ-AT ?auto_140772 ?auto_140767 ) ( not ( = ?auto_140772 ?auto_140769 ) ) ( OBJ-AT ?auto_140769 ?auto_140775 ) ( TRUCK-AT ?auto_140773 ?auto_140767 ) ( OBJ-AT ?auto_140768 ?auto_140767 ) ( OBJ-AT ?auto_140770 ?auto_140767 ) ( OBJ-AT ?auto_140771 ?auto_140767 ) ( not ( = ?auto_140768 ?auto_140769 ) ) ( not ( = ?auto_140768 ?auto_140770 ) ) ( not ( = ?auto_140768 ?auto_140771 ) ) ( not ( = ?auto_140768 ?auto_140772 ) ) ( not ( = ?auto_140769 ?auto_140770 ) ) ( not ( = ?auto_140769 ?auto_140771 ) ) ( not ( = ?auto_140770 ?auto_140771 ) ) ( not ( = ?auto_140770 ?auto_140772 ) ) ( not ( = ?auto_140771 ?auto_140772 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140772 ?auto_140769 ?auto_140767 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140812 - OBJ
      ?auto_140813 - OBJ
      ?auto_140814 - OBJ
      ?auto_140815 - OBJ
      ?auto_140811 - LOCATION
    )
    :vars
    (
      ?auto_140818 - LOCATION
      ?auto_140817 - CITY
      ?auto_140816 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140818 ?auto_140817 ) ( IN-CITY ?auto_140811 ?auto_140817 ) ( not ( = ?auto_140811 ?auto_140818 ) ) ( OBJ-AT ?auto_140815 ?auto_140811 ) ( not ( = ?auto_140815 ?auto_140812 ) ) ( OBJ-AT ?auto_140812 ?auto_140818 ) ( TRUCK-AT ?auto_140816 ?auto_140811 ) ( OBJ-AT ?auto_140813 ?auto_140811 ) ( OBJ-AT ?auto_140814 ?auto_140811 ) ( not ( = ?auto_140812 ?auto_140813 ) ) ( not ( = ?auto_140812 ?auto_140814 ) ) ( not ( = ?auto_140813 ?auto_140814 ) ) ( not ( = ?auto_140813 ?auto_140815 ) ) ( not ( = ?auto_140814 ?auto_140815 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140815 ?auto_140812 ?auto_140811 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140836 - OBJ
      ?auto_140837 - OBJ
      ?auto_140838 - OBJ
      ?auto_140839 - OBJ
      ?auto_140835 - LOCATION
    )
    :vars
    (
      ?auto_140842 - LOCATION
      ?auto_140841 - CITY
      ?auto_140840 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140842 ?auto_140841 ) ( IN-CITY ?auto_140835 ?auto_140841 ) ( not ( = ?auto_140835 ?auto_140842 ) ) ( OBJ-AT ?auto_140837 ?auto_140835 ) ( not ( = ?auto_140837 ?auto_140836 ) ) ( OBJ-AT ?auto_140836 ?auto_140842 ) ( TRUCK-AT ?auto_140840 ?auto_140835 ) ( OBJ-AT ?auto_140838 ?auto_140835 ) ( OBJ-AT ?auto_140839 ?auto_140835 ) ( not ( = ?auto_140836 ?auto_140838 ) ) ( not ( = ?auto_140836 ?auto_140839 ) ) ( not ( = ?auto_140837 ?auto_140838 ) ) ( not ( = ?auto_140837 ?auto_140839 ) ) ( not ( = ?auto_140838 ?auto_140839 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140837 ?auto_140836 ?auto_140835 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_140916 - OBJ
      ?auto_140917 - OBJ
      ?auto_140918 - OBJ
      ?auto_140919 - OBJ
      ?auto_140915 - LOCATION
    )
    :vars
    (
      ?auto_140923 - LOCATION
      ?auto_140922 - CITY
      ?auto_140920 - OBJ
      ?auto_140921 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_140923 ?auto_140922 ) ( IN-CITY ?auto_140915 ?auto_140922 ) ( not ( = ?auto_140915 ?auto_140923 ) ) ( OBJ-AT ?auto_140920 ?auto_140915 ) ( not ( = ?auto_140920 ?auto_140916 ) ) ( OBJ-AT ?auto_140916 ?auto_140923 ) ( TRUCK-AT ?auto_140921 ?auto_140915 ) ( OBJ-AT ?auto_140917 ?auto_140915 ) ( OBJ-AT ?auto_140918 ?auto_140915 ) ( OBJ-AT ?auto_140919 ?auto_140915 ) ( not ( = ?auto_140916 ?auto_140917 ) ) ( not ( = ?auto_140916 ?auto_140918 ) ) ( not ( = ?auto_140916 ?auto_140919 ) ) ( not ( = ?auto_140917 ?auto_140918 ) ) ( not ( = ?auto_140917 ?auto_140919 ) ) ( not ( = ?auto_140917 ?auto_140920 ) ) ( not ( = ?auto_140918 ?auto_140919 ) ) ( not ( = ?auto_140918 ?auto_140920 ) ) ( not ( = ?auto_140919 ?auto_140920 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_140920 ?auto_140916 ?auto_140915 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_141740 - OBJ
      ?auto_141739 - LOCATION
    )
    :vars
    (
      ?auto_141744 - LOCATION
      ?auto_141741 - CITY
      ?auto_141743 - OBJ
      ?auto_141742 - TRUCK
      ?auto_141745 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141744 ?auto_141741 ) ( IN-CITY ?auto_141739 ?auto_141741 ) ( not ( = ?auto_141739 ?auto_141744 ) ) ( OBJ-AT ?auto_141743 ?auto_141739 ) ( not ( = ?auto_141743 ?auto_141740 ) ) ( OBJ-AT ?auto_141740 ?auto_141744 ) ( TRUCK-AT ?auto_141742 ?auto_141745 ) ( IN-CITY ?auto_141745 ?auto_141741 ) ( not ( = ?auto_141739 ?auto_141745 ) ) ( not ( = ?auto_141744 ?auto_141745 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_141742 ?auto_141745 ?auto_141739 ?auto_141741 )
      ( DELIVER-2PKG ?auto_141743 ?auto_141740 ?auto_141739 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141747 - OBJ
      ?auto_141748 - OBJ
      ?auto_141746 - LOCATION
    )
    :vars
    (
      ?auto_141750 - LOCATION
      ?auto_141749 - CITY
      ?auto_141751 - TRUCK
      ?auto_141752 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141750 ?auto_141749 ) ( IN-CITY ?auto_141746 ?auto_141749 ) ( not ( = ?auto_141746 ?auto_141750 ) ) ( OBJ-AT ?auto_141747 ?auto_141746 ) ( not ( = ?auto_141747 ?auto_141748 ) ) ( OBJ-AT ?auto_141748 ?auto_141750 ) ( TRUCK-AT ?auto_141751 ?auto_141752 ) ( IN-CITY ?auto_141752 ?auto_141749 ) ( not ( = ?auto_141746 ?auto_141752 ) ) ( not ( = ?auto_141750 ?auto_141752 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_141748 ?auto_141746 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_141762 - OBJ
      ?auto_141763 - OBJ
      ?auto_141761 - LOCATION
    )
    :vars
    (
      ?auto_141767 - LOCATION
      ?auto_141764 - CITY
      ?auto_141765 - TRUCK
      ?auto_141766 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141767 ?auto_141764 ) ( IN-CITY ?auto_141761 ?auto_141764 ) ( not ( = ?auto_141761 ?auto_141767 ) ) ( OBJ-AT ?auto_141763 ?auto_141761 ) ( not ( = ?auto_141763 ?auto_141762 ) ) ( OBJ-AT ?auto_141762 ?auto_141767 ) ( TRUCK-AT ?auto_141765 ?auto_141766 ) ( IN-CITY ?auto_141766 ?auto_141764 ) ( not ( = ?auto_141761 ?auto_141766 ) ) ( not ( = ?auto_141767 ?auto_141766 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141763 ?auto_141762 ?auto_141761 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141785 - OBJ
      ?auto_141786 - OBJ
      ?auto_141787 - OBJ
      ?auto_141784 - LOCATION
    )
    :vars
    (
      ?auto_141791 - LOCATION
      ?auto_141788 - CITY
      ?auto_141789 - TRUCK
      ?auto_141790 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141791 ?auto_141788 ) ( IN-CITY ?auto_141784 ?auto_141788 ) ( not ( = ?auto_141784 ?auto_141791 ) ) ( OBJ-AT ?auto_141785 ?auto_141784 ) ( not ( = ?auto_141785 ?auto_141787 ) ) ( OBJ-AT ?auto_141787 ?auto_141791 ) ( TRUCK-AT ?auto_141789 ?auto_141790 ) ( IN-CITY ?auto_141790 ?auto_141788 ) ( not ( = ?auto_141784 ?auto_141790 ) ) ( not ( = ?auto_141791 ?auto_141790 ) ) ( OBJ-AT ?auto_141786 ?auto_141784 ) ( not ( = ?auto_141785 ?auto_141786 ) ) ( not ( = ?auto_141786 ?auto_141787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141785 ?auto_141787 ?auto_141784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141801 - OBJ
      ?auto_141802 - OBJ
      ?auto_141803 - OBJ
      ?auto_141800 - LOCATION
    )
    :vars
    (
      ?auto_141807 - LOCATION
      ?auto_141804 - CITY
      ?auto_141805 - TRUCK
      ?auto_141806 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141807 ?auto_141804 ) ( IN-CITY ?auto_141800 ?auto_141804 ) ( not ( = ?auto_141800 ?auto_141807 ) ) ( OBJ-AT ?auto_141803 ?auto_141800 ) ( not ( = ?auto_141803 ?auto_141802 ) ) ( OBJ-AT ?auto_141802 ?auto_141807 ) ( TRUCK-AT ?auto_141805 ?auto_141806 ) ( IN-CITY ?auto_141806 ?auto_141804 ) ( not ( = ?auto_141800 ?auto_141806 ) ) ( not ( = ?auto_141807 ?auto_141806 ) ) ( OBJ-AT ?auto_141801 ?auto_141800 ) ( not ( = ?auto_141801 ?auto_141802 ) ) ( not ( = ?auto_141801 ?auto_141803 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141803 ?auto_141802 ?auto_141800 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_141868 - OBJ
      ?auto_141869 - OBJ
      ?auto_141870 - OBJ
      ?auto_141867 - LOCATION
    )
    :vars
    (
      ?auto_141874 - LOCATION
      ?auto_141871 - CITY
      ?auto_141872 - TRUCK
      ?auto_141873 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141874 ?auto_141871 ) ( IN-CITY ?auto_141867 ?auto_141871 ) ( not ( = ?auto_141867 ?auto_141874 ) ) ( OBJ-AT ?auto_141870 ?auto_141867 ) ( not ( = ?auto_141870 ?auto_141868 ) ) ( OBJ-AT ?auto_141868 ?auto_141874 ) ( TRUCK-AT ?auto_141872 ?auto_141873 ) ( IN-CITY ?auto_141873 ?auto_141871 ) ( not ( = ?auto_141867 ?auto_141873 ) ) ( not ( = ?auto_141874 ?auto_141873 ) ) ( OBJ-AT ?auto_141869 ?auto_141867 ) ( not ( = ?auto_141868 ?auto_141869 ) ) ( not ( = ?auto_141869 ?auto_141870 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141870 ?auto_141868 ?auto_141867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141944 - OBJ
      ?auto_141945 - OBJ
      ?auto_141946 - OBJ
      ?auto_141947 - OBJ
      ?auto_141943 - LOCATION
    )
    :vars
    (
      ?auto_141951 - LOCATION
      ?auto_141948 - CITY
      ?auto_141949 - TRUCK
      ?auto_141950 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141951 ?auto_141948 ) ( IN-CITY ?auto_141943 ?auto_141948 ) ( not ( = ?auto_141943 ?auto_141951 ) ) ( OBJ-AT ?auto_141944 ?auto_141943 ) ( not ( = ?auto_141944 ?auto_141947 ) ) ( OBJ-AT ?auto_141947 ?auto_141951 ) ( TRUCK-AT ?auto_141949 ?auto_141950 ) ( IN-CITY ?auto_141950 ?auto_141948 ) ( not ( = ?auto_141943 ?auto_141950 ) ) ( not ( = ?auto_141951 ?auto_141950 ) ) ( OBJ-AT ?auto_141945 ?auto_141943 ) ( OBJ-AT ?auto_141946 ?auto_141943 ) ( not ( = ?auto_141944 ?auto_141945 ) ) ( not ( = ?auto_141944 ?auto_141946 ) ) ( not ( = ?auto_141945 ?auto_141946 ) ) ( not ( = ?auto_141945 ?auto_141947 ) ) ( not ( = ?auto_141946 ?auto_141947 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141944 ?auto_141947 ?auto_141943 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_141962 - OBJ
      ?auto_141963 - OBJ
      ?auto_141964 - OBJ
      ?auto_141965 - OBJ
      ?auto_141961 - LOCATION
    )
    :vars
    (
      ?auto_141969 - LOCATION
      ?auto_141966 - CITY
      ?auto_141967 - TRUCK
      ?auto_141968 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_141969 ?auto_141966 ) ( IN-CITY ?auto_141961 ?auto_141966 ) ( not ( = ?auto_141961 ?auto_141969 ) ) ( OBJ-AT ?auto_141965 ?auto_141961 ) ( not ( = ?auto_141965 ?auto_141964 ) ) ( OBJ-AT ?auto_141964 ?auto_141969 ) ( TRUCK-AT ?auto_141967 ?auto_141968 ) ( IN-CITY ?auto_141968 ?auto_141966 ) ( not ( = ?auto_141961 ?auto_141968 ) ) ( not ( = ?auto_141969 ?auto_141968 ) ) ( OBJ-AT ?auto_141962 ?auto_141961 ) ( OBJ-AT ?auto_141963 ?auto_141961 ) ( not ( = ?auto_141962 ?auto_141963 ) ) ( not ( = ?auto_141962 ?auto_141964 ) ) ( not ( = ?auto_141962 ?auto_141965 ) ) ( not ( = ?auto_141963 ?auto_141964 ) ) ( not ( = ?auto_141963 ?auto_141965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_141965 ?auto_141964 ?auto_141961 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_142034 - OBJ
      ?auto_142035 - OBJ
      ?auto_142036 - OBJ
      ?auto_142037 - OBJ
      ?auto_142033 - LOCATION
    )
    :vars
    (
      ?auto_142041 - LOCATION
      ?auto_142038 - CITY
      ?auto_142039 - TRUCK
      ?auto_142040 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142041 ?auto_142038 ) ( IN-CITY ?auto_142033 ?auto_142038 ) ( not ( = ?auto_142033 ?auto_142041 ) ) ( OBJ-AT ?auto_142034 ?auto_142033 ) ( not ( = ?auto_142034 ?auto_142035 ) ) ( OBJ-AT ?auto_142035 ?auto_142041 ) ( TRUCK-AT ?auto_142039 ?auto_142040 ) ( IN-CITY ?auto_142040 ?auto_142038 ) ( not ( = ?auto_142033 ?auto_142040 ) ) ( not ( = ?auto_142041 ?auto_142040 ) ) ( OBJ-AT ?auto_142036 ?auto_142033 ) ( OBJ-AT ?auto_142037 ?auto_142033 ) ( not ( = ?auto_142034 ?auto_142036 ) ) ( not ( = ?auto_142034 ?auto_142037 ) ) ( not ( = ?auto_142035 ?auto_142036 ) ) ( not ( = ?auto_142035 ?auto_142037 ) ) ( not ( = ?auto_142036 ?auto_142037 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142034 ?auto_142035 ?auto_142033 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_142293 - OBJ
      ?auto_142294 - OBJ
      ?auto_142295 - OBJ
      ?auto_142296 - OBJ
      ?auto_142292 - LOCATION
    )
    :vars
    (
      ?auto_142300 - LOCATION
      ?auto_142297 - CITY
      ?auto_142298 - TRUCK
      ?auto_142299 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142300 ?auto_142297 ) ( IN-CITY ?auto_142292 ?auto_142297 ) ( not ( = ?auto_142292 ?auto_142300 ) ) ( OBJ-AT ?auto_142295 ?auto_142292 ) ( not ( = ?auto_142295 ?auto_142293 ) ) ( OBJ-AT ?auto_142293 ?auto_142300 ) ( TRUCK-AT ?auto_142298 ?auto_142299 ) ( IN-CITY ?auto_142299 ?auto_142297 ) ( not ( = ?auto_142292 ?auto_142299 ) ) ( not ( = ?auto_142300 ?auto_142299 ) ) ( OBJ-AT ?auto_142294 ?auto_142292 ) ( OBJ-AT ?auto_142296 ?auto_142292 ) ( not ( = ?auto_142293 ?auto_142294 ) ) ( not ( = ?auto_142293 ?auto_142296 ) ) ( not ( = ?auto_142294 ?auto_142295 ) ) ( not ( = ?auto_142294 ?auto_142296 ) ) ( not ( = ?auto_142295 ?auto_142296 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142295 ?auto_142293 ?auto_142292 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_142735 - OBJ
      ?auto_142736 - OBJ
      ?auto_142737 - OBJ
      ?auto_142738 - OBJ
      ?auto_142734 - LOCATION
    )
    :vars
    (
      ?auto_142742 - LOCATION
      ?auto_142741 - CITY
      ?auto_142739 - TRUCK
      ?auto_142740 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142742 ?auto_142741 ) ( IN-CITY ?auto_142734 ?auto_142741 ) ( not ( = ?auto_142734 ?auto_142742 ) ) ( OBJ-AT ?auto_142737 ?auto_142734 ) ( not ( = ?auto_142737 ?auto_142738 ) ) ( OBJ-AT ?auto_142738 ?auto_142742 ) ( TRUCK-AT ?auto_142739 ?auto_142740 ) ( IN-CITY ?auto_142740 ?auto_142741 ) ( not ( = ?auto_142734 ?auto_142740 ) ) ( not ( = ?auto_142742 ?auto_142740 ) ) ( OBJ-AT ?auto_142735 ?auto_142734 ) ( OBJ-AT ?auto_142736 ?auto_142734 ) ( not ( = ?auto_142735 ?auto_142736 ) ) ( not ( = ?auto_142735 ?auto_142737 ) ) ( not ( = ?auto_142735 ?auto_142738 ) ) ( not ( = ?auto_142736 ?auto_142737 ) ) ( not ( = ?auto_142736 ?auto_142738 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142737 ?auto_142738 ?auto_142734 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_142753 - OBJ
      ?auto_142754 - OBJ
      ?auto_142755 - OBJ
      ?auto_142756 - OBJ
      ?auto_142752 - LOCATION
    )
    :vars
    (
      ?auto_142760 - LOCATION
      ?auto_142759 - CITY
      ?auto_142757 - TRUCK
      ?auto_142758 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_142760 ?auto_142759 ) ( IN-CITY ?auto_142752 ?auto_142759 ) ( not ( = ?auto_142752 ?auto_142760 ) ) ( OBJ-AT ?auto_142754 ?auto_142752 ) ( not ( = ?auto_142754 ?auto_142755 ) ) ( OBJ-AT ?auto_142755 ?auto_142760 ) ( TRUCK-AT ?auto_142757 ?auto_142758 ) ( IN-CITY ?auto_142758 ?auto_142759 ) ( not ( = ?auto_142752 ?auto_142758 ) ) ( not ( = ?auto_142760 ?auto_142758 ) ) ( OBJ-AT ?auto_142753 ?auto_142752 ) ( OBJ-AT ?auto_142756 ?auto_142752 ) ( not ( = ?auto_142753 ?auto_142754 ) ) ( not ( = ?auto_142753 ?auto_142755 ) ) ( not ( = ?auto_142753 ?auto_142756 ) ) ( not ( = ?auto_142754 ?auto_142756 ) ) ( not ( = ?auto_142755 ?auto_142756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_142754 ?auto_142755 ?auto_142752 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_143084 - OBJ
      ?auto_143085 - OBJ
      ?auto_143086 - OBJ
      ?auto_143087 - OBJ
      ?auto_143083 - LOCATION
    )
    :vars
    (
      ?auto_143091 - LOCATION
      ?auto_143090 - CITY
      ?auto_143088 - TRUCK
      ?auto_143089 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_143091 ?auto_143090 ) ( IN-CITY ?auto_143083 ?auto_143090 ) ( not ( = ?auto_143083 ?auto_143091 ) ) ( OBJ-AT ?auto_143085 ?auto_143083 ) ( not ( = ?auto_143085 ?auto_143084 ) ) ( OBJ-AT ?auto_143084 ?auto_143091 ) ( TRUCK-AT ?auto_143088 ?auto_143089 ) ( IN-CITY ?auto_143089 ?auto_143090 ) ( not ( = ?auto_143083 ?auto_143089 ) ) ( not ( = ?auto_143091 ?auto_143089 ) ) ( OBJ-AT ?auto_143086 ?auto_143083 ) ( OBJ-AT ?auto_143087 ?auto_143083 ) ( not ( = ?auto_143084 ?auto_143086 ) ) ( not ( = ?auto_143084 ?auto_143087 ) ) ( not ( = ?auto_143085 ?auto_143086 ) ) ( not ( = ?auto_143085 ?auto_143087 ) ) ( not ( = ?auto_143086 ?auto_143087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_143085 ?auto_143084 ?auto_143083 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_151077 - OBJ
      ?auto_151078 - OBJ
      ?auto_151079 - OBJ
      ?auto_151076 - LOCATION
    )
    :vars
    (
      ?auto_151080 - TRUCK
      ?auto_151081 - LOCATION
      ?auto_151082 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_151080 ?auto_151081 ) ( IN-CITY ?auto_151081 ?auto_151082 ) ( IN-CITY ?auto_151076 ?auto_151082 ) ( not ( = ?auto_151076 ?auto_151081 ) ) ( OBJ-AT ?auto_151079 ?auto_151076 ) ( not ( = ?auto_151079 ?auto_151077 ) ) ( OBJ-AT ?auto_151077 ?auto_151081 ) ( OBJ-AT ?auto_151078 ?auto_151076 ) ( not ( = ?auto_151077 ?auto_151078 ) ) ( not ( = ?auto_151078 ?auto_151079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_151079 ?auto_151077 ?auto_151076 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156030 - OBJ
      ?auto_156031 - OBJ
      ?auto_156032 - OBJ
      ?auto_156029 - LOCATION
    )
    :vars
    (
      ?auto_156035 - LOCATION
      ?auto_156034 - CITY
      ?auto_156033 - TRUCK
      ?auto_156036 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156035 ?auto_156034 ) ( IN-CITY ?auto_156029 ?auto_156034 ) ( not ( = ?auto_156029 ?auto_156035 ) ) ( OBJ-AT ?auto_156031 ?auto_156029 ) ( not ( = ?auto_156031 ?auto_156032 ) ) ( OBJ-AT ?auto_156032 ?auto_156035 ) ( TRUCK-AT ?auto_156033 ?auto_156036 ) ( IN-CITY ?auto_156036 ?auto_156034 ) ( not ( = ?auto_156029 ?auto_156036 ) ) ( not ( = ?auto_156035 ?auto_156036 ) ) ( OBJ-AT ?auto_156030 ?auto_156029 ) ( not ( = ?auto_156030 ?auto_156031 ) ) ( not ( = ?auto_156030 ?auto_156032 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156031 ?auto_156032 ?auto_156029 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156050 - OBJ
      ?auto_156051 - OBJ
      ?auto_156052 - OBJ
      ?auto_156049 - LOCATION
    )
    :vars
    (
      ?auto_156055 - LOCATION
      ?auto_156054 - CITY
      ?auto_156053 - TRUCK
      ?auto_156056 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156055 ?auto_156054 ) ( IN-CITY ?auto_156049 ?auto_156054 ) ( not ( = ?auto_156049 ?auto_156055 ) ) ( OBJ-AT ?auto_156050 ?auto_156049 ) ( not ( = ?auto_156050 ?auto_156051 ) ) ( OBJ-AT ?auto_156051 ?auto_156055 ) ( TRUCK-AT ?auto_156053 ?auto_156056 ) ( IN-CITY ?auto_156056 ?auto_156054 ) ( not ( = ?auto_156049 ?auto_156056 ) ) ( not ( = ?auto_156055 ?auto_156056 ) ) ( OBJ-AT ?auto_156052 ?auto_156049 ) ( not ( = ?auto_156050 ?auto_156052 ) ) ( not ( = ?auto_156051 ?auto_156052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156050 ?auto_156051 ?auto_156049 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156082 - OBJ
      ?auto_156083 - OBJ
      ?auto_156084 - OBJ
      ?auto_156081 - LOCATION
    )
    :vars
    (
      ?auto_156088 - LOCATION
      ?auto_156086 - CITY
      ?auto_156087 - OBJ
      ?auto_156085 - TRUCK
      ?auto_156089 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156088 ?auto_156086 ) ( IN-CITY ?auto_156081 ?auto_156086 ) ( not ( = ?auto_156081 ?auto_156088 ) ) ( OBJ-AT ?auto_156087 ?auto_156081 ) ( not ( = ?auto_156087 ?auto_156084 ) ) ( OBJ-AT ?auto_156084 ?auto_156088 ) ( TRUCK-AT ?auto_156085 ?auto_156089 ) ( IN-CITY ?auto_156089 ?auto_156086 ) ( not ( = ?auto_156081 ?auto_156089 ) ) ( not ( = ?auto_156088 ?auto_156089 ) ) ( OBJ-AT ?auto_156082 ?auto_156081 ) ( OBJ-AT ?auto_156083 ?auto_156081 ) ( not ( = ?auto_156082 ?auto_156083 ) ) ( not ( = ?auto_156082 ?auto_156084 ) ) ( not ( = ?auto_156082 ?auto_156087 ) ) ( not ( = ?auto_156083 ?auto_156084 ) ) ( not ( = ?auto_156083 ?auto_156087 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156087 ?auto_156084 ?auto_156081 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156104 - OBJ
      ?auto_156105 - OBJ
      ?auto_156106 - OBJ
      ?auto_156103 - LOCATION
    )
    :vars
    (
      ?auto_156110 - LOCATION
      ?auto_156108 - CITY
      ?auto_156109 - OBJ
      ?auto_156107 - TRUCK
      ?auto_156111 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156110 ?auto_156108 ) ( IN-CITY ?auto_156103 ?auto_156108 ) ( not ( = ?auto_156103 ?auto_156110 ) ) ( OBJ-AT ?auto_156109 ?auto_156103 ) ( not ( = ?auto_156109 ?auto_156105 ) ) ( OBJ-AT ?auto_156105 ?auto_156110 ) ( TRUCK-AT ?auto_156107 ?auto_156111 ) ( IN-CITY ?auto_156111 ?auto_156108 ) ( not ( = ?auto_156103 ?auto_156111 ) ) ( not ( = ?auto_156110 ?auto_156111 ) ) ( OBJ-AT ?auto_156104 ?auto_156103 ) ( OBJ-AT ?auto_156106 ?auto_156103 ) ( not ( = ?auto_156104 ?auto_156105 ) ) ( not ( = ?auto_156104 ?auto_156106 ) ) ( not ( = ?auto_156104 ?auto_156109 ) ) ( not ( = ?auto_156105 ?auto_156106 ) ) ( not ( = ?auto_156106 ?auto_156109 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156109 ?auto_156105 ?auto_156103 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156192 - OBJ
      ?auto_156193 - OBJ
      ?auto_156194 - OBJ
      ?auto_156191 - LOCATION
    )
    :vars
    (
      ?auto_156197 - LOCATION
      ?auto_156196 - CITY
      ?auto_156195 - TRUCK
      ?auto_156198 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156197 ?auto_156196 ) ( IN-CITY ?auto_156191 ?auto_156196 ) ( not ( = ?auto_156191 ?auto_156197 ) ) ( OBJ-AT ?auto_156193 ?auto_156191 ) ( not ( = ?auto_156193 ?auto_156192 ) ) ( OBJ-AT ?auto_156192 ?auto_156197 ) ( TRUCK-AT ?auto_156195 ?auto_156198 ) ( IN-CITY ?auto_156198 ?auto_156196 ) ( not ( = ?auto_156191 ?auto_156198 ) ) ( not ( = ?auto_156197 ?auto_156198 ) ) ( OBJ-AT ?auto_156194 ?auto_156191 ) ( not ( = ?auto_156192 ?auto_156194 ) ) ( not ( = ?auto_156193 ?auto_156194 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156193 ?auto_156192 ?auto_156191 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_156224 - OBJ
      ?auto_156225 - OBJ
      ?auto_156226 - OBJ
      ?auto_156223 - LOCATION
    )
    :vars
    (
      ?auto_156230 - LOCATION
      ?auto_156228 - CITY
      ?auto_156229 - OBJ
      ?auto_156227 - TRUCK
      ?auto_156231 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156230 ?auto_156228 ) ( IN-CITY ?auto_156223 ?auto_156228 ) ( not ( = ?auto_156223 ?auto_156230 ) ) ( OBJ-AT ?auto_156229 ?auto_156223 ) ( not ( = ?auto_156229 ?auto_156224 ) ) ( OBJ-AT ?auto_156224 ?auto_156230 ) ( TRUCK-AT ?auto_156227 ?auto_156231 ) ( IN-CITY ?auto_156231 ?auto_156228 ) ( not ( = ?auto_156223 ?auto_156231 ) ) ( not ( = ?auto_156230 ?auto_156231 ) ) ( OBJ-AT ?auto_156225 ?auto_156223 ) ( OBJ-AT ?auto_156226 ?auto_156223 ) ( not ( = ?auto_156224 ?auto_156225 ) ) ( not ( = ?auto_156224 ?auto_156226 ) ) ( not ( = ?auto_156225 ?auto_156226 ) ) ( not ( = ?auto_156225 ?auto_156229 ) ) ( not ( = ?auto_156226 ?auto_156229 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156229 ?auto_156224 ?auto_156223 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156330 - OBJ
      ?auto_156331 - OBJ
      ?auto_156332 - OBJ
      ?auto_156333 - OBJ
      ?auto_156329 - LOCATION
    )
    :vars
    (
      ?auto_156336 - LOCATION
      ?auto_156335 - CITY
      ?auto_156334 - TRUCK
      ?auto_156337 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156336 ?auto_156335 ) ( IN-CITY ?auto_156329 ?auto_156335 ) ( not ( = ?auto_156329 ?auto_156336 ) ) ( OBJ-AT ?auto_156331 ?auto_156329 ) ( not ( = ?auto_156331 ?auto_156333 ) ) ( OBJ-AT ?auto_156333 ?auto_156336 ) ( TRUCK-AT ?auto_156334 ?auto_156337 ) ( IN-CITY ?auto_156337 ?auto_156335 ) ( not ( = ?auto_156329 ?auto_156337 ) ) ( not ( = ?auto_156336 ?auto_156337 ) ) ( OBJ-AT ?auto_156330 ?auto_156329 ) ( OBJ-AT ?auto_156332 ?auto_156329 ) ( not ( = ?auto_156330 ?auto_156331 ) ) ( not ( = ?auto_156330 ?auto_156332 ) ) ( not ( = ?auto_156330 ?auto_156333 ) ) ( not ( = ?auto_156331 ?auto_156332 ) ) ( not ( = ?auto_156332 ?auto_156333 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156331 ?auto_156333 ?auto_156329 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156420 - OBJ
      ?auto_156421 - OBJ
      ?auto_156422 - OBJ
      ?auto_156423 - OBJ
      ?auto_156419 - LOCATION
    )
    :vars
    (
      ?auto_156426 - LOCATION
      ?auto_156425 - CITY
      ?auto_156424 - TRUCK
      ?auto_156427 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156426 ?auto_156425 ) ( IN-CITY ?auto_156419 ?auto_156425 ) ( not ( = ?auto_156419 ?auto_156426 ) ) ( OBJ-AT ?auto_156420 ?auto_156419 ) ( not ( = ?auto_156420 ?auto_156422 ) ) ( OBJ-AT ?auto_156422 ?auto_156426 ) ( TRUCK-AT ?auto_156424 ?auto_156427 ) ( IN-CITY ?auto_156427 ?auto_156425 ) ( not ( = ?auto_156419 ?auto_156427 ) ) ( not ( = ?auto_156426 ?auto_156427 ) ) ( OBJ-AT ?auto_156421 ?auto_156419 ) ( OBJ-AT ?auto_156423 ?auto_156419 ) ( not ( = ?auto_156420 ?auto_156421 ) ) ( not ( = ?auto_156420 ?auto_156423 ) ) ( not ( = ?auto_156421 ?auto_156422 ) ) ( not ( = ?auto_156421 ?auto_156423 ) ) ( not ( = ?auto_156422 ?auto_156423 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156420 ?auto_156422 ?auto_156419 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156519 - OBJ
      ?auto_156520 - OBJ
      ?auto_156521 - OBJ
      ?auto_156522 - OBJ
      ?auto_156518 - LOCATION
    )
    :vars
    (
      ?auto_156525 - LOCATION
      ?auto_156524 - CITY
      ?auto_156523 - TRUCK
      ?auto_156526 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156525 ?auto_156524 ) ( IN-CITY ?auto_156518 ?auto_156524 ) ( not ( = ?auto_156518 ?auto_156525 ) ) ( OBJ-AT ?auto_156521 ?auto_156518 ) ( not ( = ?auto_156521 ?auto_156520 ) ) ( OBJ-AT ?auto_156520 ?auto_156525 ) ( TRUCK-AT ?auto_156523 ?auto_156526 ) ( IN-CITY ?auto_156526 ?auto_156524 ) ( not ( = ?auto_156518 ?auto_156526 ) ) ( not ( = ?auto_156525 ?auto_156526 ) ) ( OBJ-AT ?auto_156519 ?auto_156518 ) ( OBJ-AT ?auto_156522 ?auto_156518 ) ( not ( = ?auto_156519 ?auto_156520 ) ) ( not ( = ?auto_156519 ?auto_156521 ) ) ( not ( = ?auto_156519 ?auto_156522 ) ) ( not ( = ?auto_156520 ?auto_156522 ) ) ( not ( = ?auto_156521 ?auto_156522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156521 ?auto_156520 ?auto_156518 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156546 - OBJ
      ?auto_156547 - OBJ
      ?auto_156548 - OBJ
      ?auto_156549 - OBJ
      ?auto_156545 - LOCATION
    )
    :vars
    (
      ?auto_156552 - LOCATION
      ?auto_156551 - CITY
      ?auto_156550 - TRUCK
      ?auto_156553 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156552 ?auto_156551 ) ( IN-CITY ?auto_156545 ?auto_156551 ) ( not ( = ?auto_156545 ?auto_156552 ) ) ( OBJ-AT ?auto_156549 ?auto_156545 ) ( not ( = ?auto_156549 ?auto_156547 ) ) ( OBJ-AT ?auto_156547 ?auto_156552 ) ( TRUCK-AT ?auto_156550 ?auto_156553 ) ( IN-CITY ?auto_156553 ?auto_156551 ) ( not ( = ?auto_156545 ?auto_156553 ) ) ( not ( = ?auto_156552 ?auto_156553 ) ) ( OBJ-AT ?auto_156546 ?auto_156545 ) ( OBJ-AT ?auto_156548 ?auto_156545 ) ( not ( = ?auto_156546 ?auto_156547 ) ) ( not ( = ?auto_156546 ?auto_156548 ) ) ( not ( = ?auto_156546 ?auto_156549 ) ) ( not ( = ?auto_156547 ?auto_156548 ) ) ( not ( = ?auto_156548 ?auto_156549 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156549 ?auto_156547 ?auto_156545 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156726 - OBJ
      ?auto_156727 - OBJ
      ?auto_156728 - OBJ
      ?auto_156729 - OBJ
      ?auto_156725 - LOCATION
    )
    :vars
    (
      ?auto_156733 - LOCATION
      ?auto_156731 - CITY
      ?auto_156732 - OBJ
      ?auto_156730 - TRUCK
      ?auto_156734 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156733 ?auto_156731 ) ( IN-CITY ?auto_156725 ?auto_156731 ) ( not ( = ?auto_156725 ?auto_156733 ) ) ( OBJ-AT ?auto_156732 ?auto_156725 ) ( not ( = ?auto_156732 ?auto_156729 ) ) ( OBJ-AT ?auto_156729 ?auto_156733 ) ( TRUCK-AT ?auto_156730 ?auto_156734 ) ( IN-CITY ?auto_156734 ?auto_156731 ) ( not ( = ?auto_156725 ?auto_156734 ) ) ( not ( = ?auto_156733 ?auto_156734 ) ) ( OBJ-AT ?auto_156726 ?auto_156725 ) ( OBJ-AT ?auto_156727 ?auto_156725 ) ( OBJ-AT ?auto_156728 ?auto_156725 ) ( not ( = ?auto_156726 ?auto_156727 ) ) ( not ( = ?auto_156726 ?auto_156728 ) ) ( not ( = ?auto_156726 ?auto_156729 ) ) ( not ( = ?auto_156726 ?auto_156732 ) ) ( not ( = ?auto_156727 ?auto_156728 ) ) ( not ( = ?auto_156727 ?auto_156729 ) ) ( not ( = ?auto_156727 ?auto_156732 ) ) ( not ( = ?auto_156728 ?auto_156729 ) ) ( not ( = ?auto_156728 ?auto_156732 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156732 ?auto_156729 ?auto_156725 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156755 - OBJ
      ?auto_156756 - OBJ
      ?auto_156757 - OBJ
      ?auto_156758 - OBJ
      ?auto_156754 - LOCATION
    )
    :vars
    (
      ?auto_156762 - LOCATION
      ?auto_156760 - CITY
      ?auto_156761 - OBJ
      ?auto_156759 - TRUCK
      ?auto_156763 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156762 ?auto_156760 ) ( IN-CITY ?auto_156754 ?auto_156760 ) ( not ( = ?auto_156754 ?auto_156762 ) ) ( OBJ-AT ?auto_156761 ?auto_156754 ) ( not ( = ?auto_156761 ?auto_156757 ) ) ( OBJ-AT ?auto_156757 ?auto_156762 ) ( TRUCK-AT ?auto_156759 ?auto_156763 ) ( IN-CITY ?auto_156763 ?auto_156760 ) ( not ( = ?auto_156754 ?auto_156763 ) ) ( not ( = ?auto_156762 ?auto_156763 ) ) ( OBJ-AT ?auto_156755 ?auto_156754 ) ( OBJ-AT ?auto_156756 ?auto_156754 ) ( OBJ-AT ?auto_156758 ?auto_156754 ) ( not ( = ?auto_156755 ?auto_156756 ) ) ( not ( = ?auto_156755 ?auto_156757 ) ) ( not ( = ?auto_156755 ?auto_156758 ) ) ( not ( = ?auto_156755 ?auto_156761 ) ) ( not ( = ?auto_156756 ?auto_156757 ) ) ( not ( = ?auto_156756 ?auto_156758 ) ) ( not ( = ?auto_156756 ?auto_156761 ) ) ( not ( = ?auto_156757 ?auto_156758 ) ) ( not ( = ?auto_156758 ?auto_156761 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156761 ?auto_156757 ?auto_156754 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_156898 - OBJ
      ?auto_156899 - OBJ
      ?auto_156900 - OBJ
      ?auto_156901 - OBJ
      ?auto_156897 - LOCATION
    )
    :vars
    (
      ?auto_156905 - LOCATION
      ?auto_156903 - CITY
      ?auto_156904 - OBJ
      ?auto_156902 - TRUCK
      ?auto_156906 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_156905 ?auto_156903 ) ( IN-CITY ?auto_156897 ?auto_156903 ) ( not ( = ?auto_156897 ?auto_156905 ) ) ( OBJ-AT ?auto_156904 ?auto_156897 ) ( not ( = ?auto_156904 ?auto_156899 ) ) ( OBJ-AT ?auto_156899 ?auto_156905 ) ( TRUCK-AT ?auto_156902 ?auto_156906 ) ( IN-CITY ?auto_156906 ?auto_156903 ) ( not ( = ?auto_156897 ?auto_156906 ) ) ( not ( = ?auto_156905 ?auto_156906 ) ) ( OBJ-AT ?auto_156898 ?auto_156897 ) ( OBJ-AT ?auto_156900 ?auto_156897 ) ( OBJ-AT ?auto_156901 ?auto_156897 ) ( not ( = ?auto_156898 ?auto_156899 ) ) ( not ( = ?auto_156898 ?auto_156900 ) ) ( not ( = ?auto_156898 ?auto_156901 ) ) ( not ( = ?auto_156898 ?auto_156904 ) ) ( not ( = ?auto_156899 ?auto_156900 ) ) ( not ( = ?auto_156899 ?auto_156901 ) ) ( not ( = ?auto_156900 ?auto_156901 ) ) ( not ( = ?auto_156900 ?auto_156904 ) ) ( not ( = ?auto_156901 ?auto_156904 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_156904 ?auto_156899 ?auto_156897 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_157394 - OBJ
      ?auto_157395 - OBJ
      ?auto_157396 - OBJ
      ?auto_157397 - OBJ
      ?auto_157393 - LOCATION
    )
    :vars
    (
      ?auto_157400 - LOCATION
      ?auto_157399 - CITY
      ?auto_157398 - TRUCK
      ?auto_157401 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_157400 ?auto_157399 ) ( IN-CITY ?auto_157393 ?auto_157399 ) ( not ( = ?auto_157393 ?auto_157400 ) ) ( OBJ-AT ?auto_157397 ?auto_157393 ) ( not ( = ?auto_157397 ?auto_157394 ) ) ( OBJ-AT ?auto_157394 ?auto_157400 ) ( TRUCK-AT ?auto_157398 ?auto_157401 ) ( IN-CITY ?auto_157401 ?auto_157399 ) ( not ( = ?auto_157393 ?auto_157401 ) ) ( not ( = ?auto_157400 ?auto_157401 ) ) ( OBJ-AT ?auto_157395 ?auto_157393 ) ( OBJ-AT ?auto_157396 ?auto_157393 ) ( not ( = ?auto_157394 ?auto_157395 ) ) ( not ( = ?auto_157394 ?auto_157396 ) ) ( not ( = ?auto_157395 ?auto_157396 ) ) ( not ( = ?auto_157395 ?auto_157397 ) ) ( not ( = ?auto_157396 ?auto_157397 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157397 ?auto_157394 ?auto_157393 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_157547 - OBJ
      ?auto_157548 - OBJ
      ?auto_157549 - OBJ
      ?auto_157550 - OBJ
      ?auto_157546 - LOCATION
    )
    :vars
    (
      ?auto_157554 - LOCATION
      ?auto_157552 - CITY
      ?auto_157553 - OBJ
      ?auto_157551 - TRUCK
      ?auto_157555 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_157554 ?auto_157552 ) ( IN-CITY ?auto_157546 ?auto_157552 ) ( not ( = ?auto_157546 ?auto_157554 ) ) ( OBJ-AT ?auto_157553 ?auto_157546 ) ( not ( = ?auto_157553 ?auto_157547 ) ) ( OBJ-AT ?auto_157547 ?auto_157554 ) ( TRUCK-AT ?auto_157551 ?auto_157555 ) ( IN-CITY ?auto_157555 ?auto_157552 ) ( not ( = ?auto_157546 ?auto_157555 ) ) ( not ( = ?auto_157554 ?auto_157555 ) ) ( OBJ-AT ?auto_157548 ?auto_157546 ) ( OBJ-AT ?auto_157549 ?auto_157546 ) ( OBJ-AT ?auto_157550 ?auto_157546 ) ( not ( = ?auto_157547 ?auto_157548 ) ) ( not ( = ?auto_157547 ?auto_157549 ) ) ( not ( = ?auto_157547 ?auto_157550 ) ) ( not ( = ?auto_157548 ?auto_157549 ) ) ( not ( = ?auto_157548 ?auto_157550 ) ) ( not ( = ?auto_157548 ?auto_157553 ) ) ( not ( = ?auto_157549 ?auto_157550 ) ) ( not ( = ?auto_157549 ?auto_157553 ) ) ( not ( = ?auto_157550 ?auto_157553 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_157553 ?auto_157547 ?auto_157546 ) )
  )

)

