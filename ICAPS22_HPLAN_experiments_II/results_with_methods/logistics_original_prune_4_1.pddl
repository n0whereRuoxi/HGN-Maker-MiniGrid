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
      ?auto_55272 - OBJ
      ?auto_55271 - LOCATION
    )
    :vars
    (
      ?auto_55273 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55273 ?auto_55271 ) ( IN-TRUCK ?auto_55272 ?auto_55273 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_55272 ?auto_55273 ?auto_55271 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55290 - OBJ
      ?auto_55289 - LOCATION
    )
    :vars
    (
      ?auto_55291 - TRUCK
      ?auto_55292 - LOCATION
      ?auto_55293 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55290 ?auto_55291 ) ( TRUCK-AT ?auto_55291 ?auto_55292 ) ( IN-CITY ?auto_55292 ?auto_55293 ) ( IN-CITY ?auto_55289 ?auto_55293 ) ( not ( = ?auto_55289 ?auto_55292 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55291 ?auto_55292 ?auto_55289 ?auto_55293 )
      ( DELIVER-1PKG ?auto_55290 ?auto_55289 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55316 - OBJ
      ?auto_55315 - LOCATION
    )
    :vars
    (
      ?auto_55319 - TRUCK
      ?auto_55317 - LOCATION
      ?auto_55318 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55319 ?auto_55317 ) ( IN-CITY ?auto_55317 ?auto_55318 ) ( IN-CITY ?auto_55315 ?auto_55318 ) ( not ( = ?auto_55315 ?auto_55317 ) ) ( OBJ-AT ?auto_55316 ?auto_55317 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55316 ?auto_55319 ?auto_55317 )
      ( DELIVER-1PKG ?auto_55316 ?auto_55315 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55342 - OBJ
      ?auto_55341 - LOCATION
    )
    :vars
    (
      ?auto_55343 - LOCATION
      ?auto_55344 - CITY
      ?auto_55345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55343 ?auto_55344 ) ( IN-CITY ?auto_55341 ?auto_55344 ) ( not ( = ?auto_55341 ?auto_55343 ) ) ( OBJ-AT ?auto_55342 ?auto_55343 ) ( TRUCK-AT ?auto_55345 ?auto_55341 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55345 ?auto_55341 ?auto_55343 ?auto_55344 )
      ( DELIVER-1PKG ?auto_55342 ?auto_55341 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55485 - OBJ
      ?auto_55486 - OBJ
      ?auto_55484 - LOCATION
    )
    :vars
    (
      ?auto_55487 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55487 ?auto_55484 ) ( IN-TRUCK ?auto_55486 ?auto_55487 ) ( OBJ-AT ?auto_55485 ?auto_55484 ) ( not ( = ?auto_55485 ?auto_55486 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55486 ?auto_55484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55489 - OBJ
      ?auto_55490 - OBJ
      ?auto_55488 - LOCATION
    )
    :vars
    (
      ?auto_55491 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55491 ?auto_55488 ) ( IN-TRUCK ?auto_55489 ?auto_55491 ) ( OBJ-AT ?auto_55490 ?auto_55488 ) ( not ( = ?auto_55489 ?auto_55490 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55489 ?auto_55488 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55497 - OBJ
      ?auto_55498 - OBJ
      ?auto_55499 - OBJ
      ?auto_55496 - LOCATION
    )
    :vars
    (
      ?auto_55500 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55500 ?auto_55496 ) ( IN-TRUCK ?auto_55499 ?auto_55500 ) ( OBJ-AT ?auto_55497 ?auto_55496 ) ( OBJ-AT ?auto_55498 ?auto_55496 ) ( not ( = ?auto_55497 ?auto_55498 ) ) ( not ( = ?auto_55497 ?auto_55499 ) ) ( not ( = ?auto_55498 ?auto_55499 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55499 ?auto_55496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55502 - OBJ
      ?auto_55503 - OBJ
      ?auto_55504 - OBJ
      ?auto_55501 - LOCATION
    )
    :vars
    (
      ?auto_55505 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55505 ?auto_55501 ) ( IN-TRUCK ?auto_55503 ?auto_55505 ) ( OBJ-AT ?auto_55502 ?auto_55501 ) ( OBJ-AT ?auto_55504 ?auto_55501 ) ( not ( = ?auto_55502 ?auto_55503 ) ) ( not ( = ?auto_55502 ?auto_55504 ) ) ( not ( = ?auto_55503 ?auto_55504 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55503 ?auto_55501 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55512 - OBJ
      ?auto_55513 - OBJ
      ?auto_55514 - OBJ
      ?auto_55511 - LOCATION
    )
    :vars
    (
      ?auto_55515 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55515 ?auto_55511 ) ( IN-TRUCK ?auto_55512 ?auto_55515 ) ( OBJ-AT ?auto_55513 ?auto_55511 ) ( OBJ-AT ?auto_55514 ?auto_55511 ) ( not ( = ?auto_55512 ?auto_55513 ) ) ( not ( = ?auto_55512 ?auto_55514 ) ) ( not ( = ?auto_55513 ?auto_55514 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55512 ?auto_55511 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55532 - OBJ
      ?auto_55533 - OBJ
      ?auto_55534 - OBJ
      ?auto_55535 - OBJ
      ?auto_55531 - LOCATION
    )
    :vars
    (
      ?auto_55536 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55536 ?auto_55531 ) ( IN-TRUCK ?auto_55535 ?auto_55536 ) ( OBJ-AT ?auto_55532 ?auto_55531 ) ( OBJ-AT ?auto_55533 ?auto_55531 ) ( OBJ-AT ?auto_55534 ?auto_55531 ) ( not ( = ?auto_55532 ?auto_55533 ) ) ( not ( = ?auto_55532 ?auto_55534 ) ) ( not ( = ?auto_55532 ?auto_55535 ) ) ( not ( = ?auto_55533 ?auto_55534 ) ) ( not ( = ?auto_55533 ?auto_55535 ) ) ( not ( = ?auto_55534 ?auto_55535 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55535 ?auto_55531 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55538 - OBJ
      ?auto_55539 - OBJ
      ?auto_55540 - OBJ
      ?auto_55541 - OBJ
      ?auto_55537 - LOCATION
    )
    :vars
    (
      ?auto_55542 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55542 ?auto_55537 ) ( IN-TRUCK ?auto_55540 ?auto_55542 ) ( OBJ-AT ?auto_55538 ?auto_55537 ) ( OBJ-AT ?auto_55539 ?auto_55537 ) ( OBJ-AT ?auto_55541 ?auto_55537 ) ( not ( = ?auto_55538 ?auto_55539 ) ) ( not ( = ?auto_55538 ?auto_55540 ) ) ( not ( = ?auto_55538 ?auto_55541 ) ) ( not ( = ?auto_55539 ?auto_55540 ) ) ( not ( = ?auto_55539 ?auto_55541 ) ) ( not ( = ?auto_55540 ?auto_55541 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55540 ?auto_55537 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55550 - OBJ
      ?auto_55551 - OBJ
      ?auto_55552 - OBJ
      ?auto_55553 - OBJ
      ?auto_55549 - LOCATION
    )
    :vars
    (
      ?auto_55554 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55554 ?auto_55549 ) ( IN-TRUCK ?auto_55551 ?auto_55554 ) ( OBJ-AT ?auto_55550 ?auto_55549 ) ( OBJ-AT ?auto_55552 ?auto_55549 ) ( OBJ-AT ?auto_55553 ?auto_55549 ) ( not ( = ?auto_55550 ?auto_55551 ) ) ( not ( = ?auto_55550 ?auto_55552 ) ) ( not ( = ?auto_55550 ?auto_55553 ) ) ( not ( = ?auto_55551 ?auto_55552 ) ) ( not ( = ?auto_55551 ?auto_55553 ) ) ( not ( = ?auto_55552 ?auto_55553 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55551 ?auto_55549 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55574 - OBJ
      ?auto_55575 - OBJ
      ?auto_55576 - OBJ
      ?auto_55577 - OBJ
      ?auto_55573 - LOCATION
    )
    :vars
    (
      ?auto_55578 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55578 ?auto_55573 ) ( IN-TRUCK ?auto_55574 ?auto_55578 ) ( OBJ-AT ?auto_55575 ?auto_55573 ) ( OBJ-AT ?auto_55576 ?auto_55573 ) ( OBJ-AT ?auto_55577 ?auto_55573 ) ( not ( = ?auto_55574 ?auto_55575 ) ) ( not ( = ?auto_55574 ?auto_55576 ) ) ( not ( = ?auto_55574 ?auto_55577 ) ) ( not ( = ?auto_55575 ?auto_55576 ) ) ( not ( = ?auto_55575 ?auto_55577 ) ) ( not ( = ?auto_55576 ?auto_55577 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55574 ?auto_55573 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55627 - OBJ
      ?auto_55628 - OBJ
      ?auto_55626 - LOCATION
    )
    :vars
    (
      ?auto_55630 - TRUCK
      ?auto_55629 - LOCATION
      ?auto_55631 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55628 ?auto_55630 ) ( TRUCK-AT ?auto_55630 ?auto_55629 ) ( IN-CITY ?auto_55629 ?auto_55631 ) ( IN-CITY ?auto_55626 ?auto_55631 ) ( not ( = ?auto_55626 ?auto_55629 ) ) ( OBJ-AT ?auto_55627 ?auto_55626 ) ( not ( = ?auto_55627 ?auto_55628 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55628 ?auto_55626 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55633 - OBJ
      ?auto_55634 - OBJ
      ?auto_55632 - LOCATION
    )
    :vars
    (
      ?auto_55637 - TRUCK
      ?auto_55636 - LOCATION
      ?auto_55635 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55633 ?auto_55637 ) ( TRUCK-AT ?auto_55637 ?auto_55636 ) ( IN-CITY ?auto_55636 ?auto_55635 ) ( IN-CITY ?auto_55632 ?auto_55635 ) ( not ( = ?auto_55632 ?auto_55636 ) ) ( OBJ-AT ?auto_55634 ?auto_55632 ) ( not ( = ?auto_55634 ?auto_55633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55634 ?auto_55633 ?auto_55632 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55646 - OBJ
      ?auto_55647 - OBJ
      ?auto_55648 - OBJ
      ?auto_55645 - LOCATION
    )
    :vars
    (
      ?auto_55651 - TRUCK
      ?auto_55650 - LOCATION
      ?auto_55649 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55648 ?auto_55651 ) ( TRUCK-AT ?auto_55651 ?auto_55650 ) ( IN-CITY ?auto_55650 ?auto_55649 ) ( IN-CITY ?auto_55645 ?auto_55649 ) ( not ( = ?auto_55645 ?auto_55650 ) ) ( OBJ-AT ?auto_55647 ?auto_55645 ) ( not ( = ?auto_55647 ?auto_55648 ) ) ( OBJ-AT ?auto_55646 ?auto_55645 ) ( not ( = ?auto_55646 ?auto_55647 ) ) ( not ( = ?auto_55646 ?auto_55648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55647 ?auto_55648 ?auto_55645 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55653 - OBJ
      ?auto_55654 - OBJ
      ?auto_55655 - OBJ
      ?auto_55652 - LOCATION
    )
    :vars
    (
      ?auto_55658 - TRUCK
      ?auto_55657 - LOCATION
      ?auto_55656 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55654 ?auto_55658 ) ( TRUCK-AT ?auto_55658 ?auto_55657 ) ( IN-CITY ?auto_55657 ?auto_55656 ) ( IN-CITY ?auto_55652 ?auto_55656 ) ( not ( = ?auto_55652 ?auto_55657 ) ) ( OBJ-AT ?auto_55655 ?auto_55652 ) ( not ( = ?auto_55655 ?auto_55654 ) ) ( OBJ-AT ?auto_55653 ?auto_55652 ) ( not ( = ?auto_55653 ?auto_55654 ) ) ( not ( = ?auto_55653 ?auto_55655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55655 ?auto_55654 ?auto_55652 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55667 - OBJ
      ?auto_55668 - OBJ
      ?auto_55669 - OBJ
      ?auto_55666 - LOCATION
    )
    :vars
    (
      ?auto_55672 - TRUCK
      ?auto_55671 - LOCATION
      ?auto_55670 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55667 ?auto_55672 ) ( TRUCK-AT ?auto_55672 ?auto_55671 ) ( IN-CITY ?auto_55671 ?auto_55670 ) ( IN-CITY ?auto_55666 ?auto_55670 ) ( not ( = ?auto_55666 ?auto_55671 ) ) ( OBJ-AT ?auto_55668 ?auto_55666 ) ( not ( = ?auto_55668 ?auto_55667 ) ) ( OBJ-AT ?auto_55669 ?auto_55666 ) ( not ( = ?auto_55667 ?auto_55669 ) ) ( not ( = ?auto_55668 ?auto_55669 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55668 ?auto_55667 ?auto_55666 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55696 - OBJ
      ?auto_55697 - OBJ
      ?auto_55698 - OBJ
      ?auto_55699 - OBJ
      ?auto_55695 - LOCATION
    )
    :vars
    (
      ?auto_55702 - TRUCK
      ?auto_55701 - LOCATION
      ?auto_55700 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55699 ?auto_55702 ) ( TRUCK-AT ?auto_55702 ?auto_55701 ) ( IN-CITY ?auto_55701 ?auto_55700 ) ( IN-CITY ?auto_55695 ?auto_55700 ) ( not ( = ?auto_55695 ?auto_55701 ) ) ( OBJ-AT ?auto_55697 ?auto_55695 ) ( not ( = ?auto_55697 ?auto_55699 ) ) ( OBJ-AT ?auto_55696 ?auto_55695 ) ( OBJ-AT ?auto_55698 ?auto_55695 ) ( not ( = ?auto_55696 ?auto_55697 ) ) ( not ( = ?auto_55696 ?auto_55698 ) ) ( not ( = ?auto_55696 ?auto_55699 ) ) ( not ( = ?auto_55697 ?auto_55698 ) ) ( not ( = ?auto_55698 ?auto_55699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55697 ?auto_55699 ?auto_55695 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55704 - OBJ
      ?auto_55705 - OBJ
      ?auto_55706 - OBJ
      ?auto_55707 - OBJ
      ?auto_55703 - LOCATION
    )
    :vars
    (
      ?auto_55710 - TRUCK
      ?auto_55709 - LOCATION
      ?auto_55708 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55706 ?auto_55710 ) ( TRUCK-AT ?auto_55710 ?auto_55709 ) ( IN-CITY ?auto_55709 ?auto_55708 ) ( IN-CITY ?auto_55703 ?auto_55708 ) ( not ( = ?auto_55703 ?auto_55709 ) ) ( OBJ-AT ?auto_55705 ?auto_55703 ) ( not ( = ?auto_55705 ?auto_55706 ) ) ( OBJ-AT ?auto_55704 ?auto_55703 ) ( OBJ-AT ?auto_55707 ?auto_55703 ) ( not ( = ?auto_55704 ?auto_55705 ) ) ( not ( = ?auto_55704 ?auto_55706 ) ) ( not ( = ?auto_55704 ?auto_55707 ) ) ( not ( = ?auto_55705 ?auto_55707 ) ) ( not ( = ?auto_55706 ?auto_55707 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55705 ?auto_55706 ?auto_55703 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55720 - OBJ
      ?auto_55721 - OBJ
      ?auto_55722 - OBJ
      ?auto_55723 - OBJ
      ?auto_55719 - LOCATION
    )
    :vars
    (
      ?auto_55726 - TRUCK
      ?auto_55725 - LOCATION
      ?auto_55724 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55721 ?auto_55726 ) ( TRUCK-AT ?auto_55726 ?auto_55725 ) ( IN-CITY ?auto_55725 ?auto_55724 ) ( IN-CITY ?auto_55719 ?auto_55724 ) ( not ( = ?auto_55719 ?auto_55725 ) ) ( OBJ-AT ?auto_55720 ?auto_55719 ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( OBJ-AT ?auto_55722 ?auto_55719 ) ( OBJ-AT ?auto_55723 ?auto_55719 ) ( not ( = ?auto_55720 ?auto_55722 ) ) ( not ( = ?auto_55720 ?auto_55723 ) ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55723 ) ) ( not ( = ?auto_55722 ?auto_55723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55720 ?auto_55721 ?auto_55719 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55752 - OBJ
      ?auto_55753 - OBJ
      ?auto_55754 - OBJ
      ?auto_55755 - OBJ
      ?auto_55751 - LOCATION
    )
    :vars
    (
      ?auto_55758 - TRUCK
      ?auto_55757 - LOCATION
      ?auto_55756 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55752 ?auto_55758 ) ( TRUCK-AT ?auto_55758 ?auto_55757 ) ( IN-CITY ?auto_55757 ?auto_55756 ) ( IN-CITY ?auto_55751 ?auto_55756 ) ( not ( = ?auto_55751 ?auto_55757 ) ) ( OBJ-AT ?auto_55755 ?auto_55751 ) ( not ( = ?auto_55755 ?auto_55752 ) ) ( OBJ-AT ?auto_55753 ?auto_55751 ) ( OBJ-AT ?auto_55754 ?auto_55751 ) ( not ( = ?auto_55752 ?auto_55753 ) ) ( not ( = ?auto_55752 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55755 ) ) ( not ( = ?auto_55754 ?auto_55755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55755 ?auto_55752 ?auto_55751 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55817 - OBJ
      ?auto_55816 - LOCATION
    )
    :vars
    (
      ?auto_55821 - TRUCK
      ?auto_55820 - LOCATION
      ?auto_55819 - CITY
      ?auto_55818 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55821 ?auto_55820 ) ( IN-CITY ?auto_55820 ?auto_55819 ) ( IN-CITY ?auto_55816 ?auto_55819 ) ( not ( = ?auto_55816 ?auto_55820 ) ) ( OBJ-AT ?auto_55818 ?auto_55816 ) ( not ( = ?auto_55818 ?auto_55817 ) ) ( OBJ-AT ?auto_55817 ?auto_55820 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55817 ?auto_55821 ?auto_55820 )
      ( DELIVER-2PKG ?auto_55818 ?auto_55817 ?auto_55816 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55823 - OBJ
      ?auto_55824 - OBJ
      ?auto_55822 - LOCATION
    )
    :vars
    (
      ?auto_55826 - TRUCK
      ?auto_55827 - LOCATION
      ?auto_55825 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55826 ?auto_55827 ) ( IN-CITY ?auto_55827 ?auto_55825 ) ( IN-CITY ?auto_55822 ?auto_55825 ) ( not ( = ?auto_55822 ?auto_55827 ) ) ( OBJ-AT ?auto_55823 ?auto_55822 ) ( not ( = ?auto_55823 ?auto_55824 ) ) ( OBJ-AT ?auto_55824 ?auto_55827 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55824 ?auto_55822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_55829 - OBJ
      ?auto_55830 - OBJ
      ?auto_55828 - LOCATION
    )
    :vars
    (
      ?auto_55831 - TRUCK
      ?auto_55832 - LOCATION
      ?auto_55833 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55831 ?auto_55832 ) ( IN-CITY ?auto_55832 ?auto_55833 ) ( IN-CITY ?auto_55828 ?auto_55833 ) ( not ( = ?auto_55828 ?auto_55832 ) ) ( OBJ-AT ?auto_55830 ?auto_55828 ) ( not ( = ?auto_55830 ?auto_55829 ) ) ( OBJ-AT ?auto_55829 ?auto_55832 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55830 ?auto_55829 ?auto_55828 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55842 - OBJ
      ?auto_55843 - OBJ
      ?auto_55844 - OBJ
      ?auto_55841 - LOCATION
    )
    :vars
    (
      ?auto_55845 - TRUCK
      ?auto_55846 - LOCATION
      ?auto_55847 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55845 ?auto_55846 ) ( IN-CITY ?auto_55846 ?auto_55847 ) ( IN-CITY ?auto_55841 ?auto_55847 ) ( not ( = ?auto_55841 ?auto_55846 ) ) ( OBJ-AT ?auto_55842 ?auto_55841 ) ( not ( = ?auto_55842 ?auto_55844 ) ) ( OBJ-AT ?auto_55844 ?auto_55846 ) ( OBJ-AT ?auto_55843 ?auto_55841 ) ( not ( = ?auto_55842 ?auto_55843 ) ) ( not ( = ?auto_55843 ?auto_55844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55842 ?auto_55844 ?auto_55841 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55849 - OBJ
      ?auto_55850 - OBJ
      ?auto_55851 - OBJ
      ?auto_55848 - LOCATION
    )
    :vars
    (
      ?auto_55852 - TRUCK
      ?auto_55853 - LOCATION
      ?auto_55854 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55852 ?auto_55853 ) ( IN-CITY ?auto_55853 ?auto_55854 ) ( IN-CITY ?auto_55848 ?auto_55854 ) ( not ( = ?auto_55848 ?auto_55853 ) ) ( OBJ-AT ?auto_55849 ?auto_55848 ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( OBJ-AT ?auto_55850 ?auto_55853 ) ( OBJ-AT ?auto_55851 ?auto_55848 ) ( not ( = ?auto_55849 ?auto_55851 ) ) ( not ( = ?auto_55850 ?auto_55851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55849 ?auto_55850 ?auto_55848 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_55863 - OBJ
      ?auto_55864 - OBJ
      ?auto_55865 - OBJ
      ?auto_55862 - LOCATION
    )
    :vars
    (
      ?auto_55866 - TRUCK
      ?auto_55867 - LOCATION
      ?auto_55868 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55866 ?auto_55867 ) ( IN-CITY ?auto_55867 ?auto_55868 ) ( IN-CITY ?auto_55862 ?auto_55868 ) ( not ( = ?auto_55862 ?auto_55867 ) ) ( OBJ-AT ?auto_55865 ?auto_55862 ) ( not ( = ?auto_55865 ?auto_55863 ) ) ( OBJ-AT ?auto_55863 ?auto_55867 ) ( OBJ-AT ?auto_55864 ?auto_55862 ) ( not ( = ?auto_55863 ?auto_55864 ) ) ( not ( = ?auto_55864 ?auto_55865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55865 ?auto_55863 ?auto_55862 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55892 - OBJ
      ?auto_55893 - OBJ
      ?auto_55894 - OBJ
      ?auto_55895 - OBJ
      ?auto_55891 - LOCATION
    )
    :vars
    (
      ?auto_55896 - TRUCK
      ?auto_55897 - LOCATION
      ?auto_55898 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55896 ?auto_55897 ) ( IN-CITY ?auto_55897 ?auto_55898 ) ( IN-CITY ?auto_55891 ?auto_55898 ) ( not ( = ?auto_55891 ?auto_55897 ) ) ( OBJ-AT ?auto_55894 ?auto_55891 ) ( not ( = ?auto_55894 ?auto_55895 ) ) ( OBJ-AT ?auto_55895 ?auto_55897 ) ( OBJ-AT ?auto_55892 ?auto_55891 ) ( OBJ-AT ?auto_55893 ?auto_55891 ) ( not ( = ?auto_55892 ?auto_55893 ) ) ( not ( = ?auto_55892 ?auto_55894 ) ) ( not ( = ?auto_55892 ?auto_55895 ) ) ( not ( = ?auto_55893 ?auto_55894 ) ) ( not ( = ?auto_55893 ?auto_55895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55894 ?auto_55895 ?auto_55891 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55900 - OBJ
      ?auto_55901 - OBJ
      ?auto_55902 - OBJ
      ?auto_55903 - OBJ
      ?auto_55899 - LOCATION
    )
    :vars
    (
      ?auto_55904 - TRUCK
      ?auto_55905 - LOCATION
      ?auto_55906 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55904 ?auto_55905 ) ( IN-CITY ?auto_55905 ?auto_55906 ) ( IN-CITY ?auto_55899 ?auto_55906 ) ( not ( = ?auto_55899 ?auto_55905 ) ) ( OBJ-AT ?auto_55901 ?auto_55899 ) ( not ( = ?auto_55901 ?auto_55902 ) ) ( OBJ-AT ?auto_55902 ?auto_55905 ) ( OBJ-AT ?auto_55900 ?auto_55899 ) ( OBJ-AT ?auto_55903 ?auto_55899 ) ( not ( = ?auto_55900 ?auto_55901 ) ) ( not ( = ?auto_55900 ?auto_55902 ) ) ( not ( = ?auto_55900 ?auto_55903 ) ) ( not ( = ?auto_55901 ?auto_55903 ) ) ( not ( = ?auto_55902 ?auto_55903 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55901 ?auto_55902 ?auto_55899 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55916 - OBJ
      ?auto_55917 - OBJ
      ?auto_55918 - OBJ
      ?auto_55919 - OBJ
      ?auto_55915 - LOCATION
    )
    :vars
    (
      ?auto_55920 - TRUCK
      ?auto_55921 - LOCATION
      ?auto_55922 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55920 ?auto_55921 ) ( IN-CITY ?auto_55921 ?auto_55922 ) ( IN-CITY ?auto_55915 ?auto_55922 ) ( not ( = ?auto_55915 ?auto_55921 ) ) ( OBJ-AT ?auto_55919 ?auto_55915 ) ( not ( = ?auto_55919 ?auto_55917 ) ) ( OBJ-AT ?auto_55917 ?auto_55921 ) ( OBJ-AT ?auto_55916 ?auto_55915 ) ( OBJ-AT ?auto_55918 ?auto_55915 ) ( not ( = ?auto_55916 ?auto_55917 ) ) ( not ( = ?auto_55916 ?auto_55918 ) ) ( not ( = ?auto_55916 ?auto_55919 ) ) ( not ( = ?auto_55917 ?auto_55918 ) ) ( not ( = ?auto_55918 ?auto_55919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55919 ?auto_55917 ?auto_55915 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_55948 - OBJ
      ?auto_55949 - OBJ
      ?auto_55950 - OBJ
      ?auto_55951 - OBJ
      ?auto_55947 - LOCATION
    )
    :vars
    (
      ?auto_55952 - TRUCK
      ?auto_55953 - LOCATION
      ?auto_55954 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55952 ?auto_55953 ) ( IN-CITY ?auto_55953 ?auto_55954 ) ( IN-CITY ?auto_55947 ?auto_55954 ) ( not ( = ?auto_55947 ?auto_55953 ) ) ( OBJ-AT ?auto_55951 ?auto_55947 ) ( not ( = ?auto_55951 ?auto_55948 ) ) ( OBJ-AT ?auto_55948 ?auto_55953 ) ( OBJ-AT ?auto_55949 ?auto_55947 ) ( OBJ-AT ?auto_55950 ?auto_55947 ) ( not ( = ?auto_55948 ?auto_55949 ) ) ( not ( = ?auto_55948 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55950 ?auto_55951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55951 ?auto_55948 ?auto_55947 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56013 - OBJ
      ?auto_56012 - LOCATION
    )
    :vars
    (
      ?auto_56015 - LOCATION
      ?auto_56016 - CITY
      ?auto_56017 - OBJ
      ?auto_56014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56015 ?auto_56016 ) ( IN-CITY ?auto_56012 ?auto_56016 ) ( not ( = ?auto_56012 ?auto_56015 ) ) ( OBJ-AT ?auto_56017 ?auto_56012 ) ( not ( = ?auto_56017 ?auto_56013 ) ) ( OBJ-AT ?auto_56013 ?auto_56015 ) ( TRUCK-AT ?auto_56014 ?auto_56012 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56014 ?auto_56012 ?auto_56015 ?auto_56016 )
      ( DELIVER-2PKG ?auto_56017 ?auto_56013 ?auto_56012 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56019 - OBJ
      ?auto_56020 - OBJ
      ?auto_56018 - LOCATION
    )
    :vars
    (
      ?auto_56023 - LOCATION
      ?auto_56021 - CITY
      ?auto_56022 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56023 ?auto_56021 ) ( IN-CITY ?auto_56018 ?auto_56021 ) ( not ( = ?auto_56018 ?auto_56023 ) ) ( OBJ-AT ?auto_56019 ?auto_56018 ) ( not ( = ?auto_56019 ?auto_56020 ) ) ( OBJ-AT ?auto_56020 ?auto_56023 ) ( TRUCK-AT ?auto_56022 ?auto_56018 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56020 ?auto_56018 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56025 - OBJ
      ?auto_56026 - OBJ
      ?auto_56024 - LOCATION
    )
    :vars
    (
      ?auto_56029 - LOCATION
      ?auto_56027 - CITY
      ?auto_56028 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56029 ?auto_56027 ) ( IN-CITY ?auto_56024 ?auto_56027 ) ( not ( = ?auto_56024 ?auto_56029 ) ) ( OBJ-AT ?auto_56026 ?auto_56024 ) ( not ( = ?auto_56026 ?auto_56025 ) ) ( OBJ-AT ?auto_56025 ?auto_56029 ) ( TRUCK-AT ?auto_56028 ?auto_56024 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56026 ?auto_56025 ?auto_56024 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56038 - OBJ
      ?auto_56039 - OBJ
      ?auto_56040 - OBJ
      ?auto_56037 - LOCATION
    )
    :vars
    (
      ?auto_56043 - LOCATION
      ?auto_56041 - CITY
      ?auto_56042 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56043 ?auto_56041 ) ( IN-CITY ?auto_56037 ?auto_56041 ) ( not ( = ?auto_56037 ?auto_56043 ) ) ( OBJ-AT ?auto_56039 ?auto_56037 ) ( not ( = ?auto_56039 ?auto_56040 ) ) ( OBJ-AT ?auto_56040 ?auto_56043 ) ( TRUCK-AT ?auto_56042 ?auto_56037 ) ( OBJ-AT ?auto_56038 ?auto_56037 ) ( not ( = ?auto_56038 ?auto_56039 ) ) ( not ( = ?auto_56038 ?auto_56040 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56039 ?auto_56040 ?auto_56037 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56045 - OBJ
      ?auto_56046 - OBJ
      ?auto_56047 - OBJ
      ?auto_56044 - LOCATION
    )
    :vars
    (
      ?auto_56050 - LOCATION
      ?auto_56048 - CITY
      ?auto_56049 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56050 ?auto_56048 ) ( IN-CITY ?auto_56044 ?auto_56048 ) ( not ( = ?auto_56044 ?auto_56050 ) ) ( OBJ-AT ?auto_56045 ?auto_56044 ) ( not ( = ?auto_56045 ?auto_56046 ) ) ( OBJ-AT ?auto_56046 ?auto_56050 ) ( TRUCK-AT ?auto_56049 ?auto_56044 ) ( OBJ-AT ?auto_56047 ?auto_56044 ) ( not ( = ?auto_56045 ?auto_56047 ) ) ( not ( = ?auto_56046 ?auto_56047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56045 ?auto_56046 ?auto_56044 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_56059 - OBJ
      ?auto_56060 - OBJ
      ?auto_56061 - OBJ
      ?auto_56058 - LOCATION
    )
    :vars
    (
      ?auto_56064 - LOCATION
      ?auto_56062 - CITY
      ?auto_56063 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56064 ?auto_56062 ) ( IN-CITY ?auto_56058 ?auto_56062 ) ( not ( = ?auto_56058 ?auto_56064 ) ) ( OBJ-AT ?auto_56061 ?auto_56058 ) ( not ( = ?auto_56061 ?auto_56059 ) ) ( OBJ-AT ?auto_56059 ?auto_56064 ) ( TRUCK-AT ?auto_56063 ?auto_56058 ) ( OBJ-AT ?auto_56060 ?auto_56058 ) ( not ( = ?auto_56059 ?auto_56060 ) ) ( not ( = ?auto_56060 ?auto_56061 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56061 ?auto_56059 ?auto_56058 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56088 - OBJ
      ?auto_56089 - OBJ
      ?auto_56090 - OBJ
      ?auto_56091 - OBJ
      ?auto_56087 - LOCATION
    )
    :vars
    (
      ?auto_56094 - LOCATION
      ?auto_56092 - CITY
      ?auto_56093 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56094 ?auto_56092 ) ( IN-CITY ?auto_56087 ?auto_56092 ) ( not ( = ?auto_56087 ?auto_56094 ) ) ( OBJ-AT ?auto_56089 ?auto_56087 ) ( not ( = ?auto_56089 ?auto_56091 ) ) ( OBJ-AT ?auto_56091 ?auto_56094 ) ( TRUCK-AT ?auto_56093 ?auto_56087 ) ( OBJ-AT ?auto_56088 ?auto_56087 ) ( OBJ-AT ?auto_56090 ?auto_56087 ) ( not ( = ?auto_56088 ?auto_56089 ) ) ( not ( = ?auto_56088 ?auto_56090 ) ) ( not ( = ?auto_56088 ?auto_56091 ) ) ( not ( = ?auto_56089 ?auto_56090 ) ) ( not ( = ?auto_56090 ?auto_56091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56089 ?auto_56091 ?auto_56087 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56096 - OBJ
      ?auto_56097 - OBJ
      ?auto_56098 - OBJ
      ?auto_56099 - OBJ
      ?auto_56095 - LOCATION
    )
    :vars
    (
      ?auto_56102 - LOCATION
      ?auto_56100 - CITY
      ?auto_56101 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56102 ?auto_56100 ) ( IN-CITY ?auto_56095 ?auto_56100 ) ( not ( = ?auto_56095 ?auto_56102 ) ) ( OBJ-AT ?auto_56096 ?auto_56095 ) ( not ( = ?auto_56096 ?auto_56098 ) ) ( OBJ-AT ?auto_56098 ?auto_56102 ) ( TRUCK-AT ?auto_56101 ?auto_56095 ) ( OBJ-AT ?auto_56097 ?auto_56095 ) ( OBJ-AT ?auto_56099 ?auto_56095 ) ( not ( = ?auto_56096 ?auto_56097 ) ) ( not ( = ?auto_56096 ?auto_56099 ) ) ( not ( = ?auto_56097 ?auto_56098 ) ) ( not ( = ?auto_56097 ?auto_56099 ) ) ( not ( = ?auto_56098 ?auto_56099 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56096 ?auto_56098 ?auto_56095 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56112 - OBJ
      ?auto_56113 - OBJ
      ?auto_56114 - OBJ
      ?auto_56115 - OBJ
      ?auto_56111 - LOCATION
    )
    :vars
    (
      ?auto_56118 - LOCATION
      ?auto_56116 - CITY
      ?auto_56117 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56118 ?auto_56116 ) ( IN-CITY ?auto_56111 ?auto_56116 ) ( not ( = ?auto_56111 ?auto_56118 ) ) ( OBJ-AT ?auto_56114 ?auto_56111 ) ( not ( = ?auto_56114 ?auto_56113 ) ) ( OBJ-AT ?auto_56113 ?auto_56118 ) ( TRUCK-AT ?auto_56117 ?auto_56111 ) ( OBJ-AT ?auto_56112 ?auto_56111 ) ( OBJ-AT ?auto_56115 ?auto_56111 ) ( not ( = ?auto_56112 ?auto_56113 ) ) ( not ( = ?auto_56112 ?auto_56114 ) ) ( not ( = ?auto_56112 ?auto_56115 ) ) ( not ( = ?auto_56113 ?auto_56115 ) ) ( not ( = ?auto_56114 ?auto_56115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56114 ?auto_56113 ?auto_56111 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_56144 - OBJ
      ?auto_56145 - OBJ
      ?auto_56146 - OBJ
      ?auto_56147 - OBJ
      ?auto_56143 - LOCATION
    )
    :vars
    (
      ?auto_56150 - LOCATION
      ?auto_56148 - CITY
      ?auto_56149 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56150 ?auto_56148 ) ( IN-CITY ?auto_56143 ?auto_56148 ) ( not ( = ?auto_56143 ?auto_56150 ) ) ( OBJ-AT ?auto_56145 ?auto_56143 ) ( not ( = ?auto_56145 ?auto_56144 ) ) ( OBJ-AT ?auto_56144 ?auto_56150 ) ( TRUCK-AT ?auto_56149 ?auto_56143 ) ( OBJ-AT ?auto_56146 ?auto_56143 ) ( OBJ-AT ?auto_56147 ?auto_56143 ) ( not ( = ?auto_56144 ?auto_56146 ) ) ( not ( = ?auto_56144 ?auto_56147 ) ) ( not ( = ?auto_56145 ?auto_56146 ) ) ( not ( = ?auto_56145 ?auto_56147 ) ) ( not ( = ?auto_56146 ?auto_56147 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56145 ?auto_56144 ?auto_56143 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56209 - OBJ
      ?auto_56208 - LOCATION
    )
    :vars
    (
      ?auto_56213 - LOCATION
      ?auto_56210 - CITY
      ?auto_56212 - OBJ
      ?auto_56211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56213 ?auto_56210 ) ( IN-CITY ?auto_56208 ?auto_56210 ) ( not ( = ?auto_56208 ?auto_56213 ) ) ( not ( = ?auto_56212 ?auto_56209 ) ) ( OBJ-AT ?auto_56209 ?auto_56213 ) ( TRUCK-AT ?auto_56211 ?auto_56208 ) ( IN-TRUCK ?auto_56212 ?auto_56211 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56212 ?auto_56208 )
      ( DELIVER-2PKG ?auto_56212 ?auto_56209 ?auto_56208 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56215 - OBJ
      ?auto_56216 - OBJ
      ?auto_56214 - LOCATION
    )
    :vars
    (
      ?auto_56217 - LOCATION
      ?auto_56218 - CITY
      ?auto_56219 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56217 ?auto_56218 ) ( IN-CITY ?auto_56214 ?auto_56218 ) ( not ( = ?auto_56214 ?auto_56217 ) ) ( not ( = ?auto_56215 ?auto_56216 ) ) ( OBJ-AT ?auto_56216 ?auto_56217 ) ( TRUCK-AT ?auto_56219 ?auto_56214 ) ( IN-TRUCK ?auto_56215 ?auto_56219 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56216 ?auto_56214 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56221 - OBJ
      ?auto_56222 - OBJ
      ?auto_56220 - LOCATION
    )
    :vars
    (
      ?auto_56225 - LOCATION
      ?auto_56224 - CITY
      ?auto_56223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56225 ?auto_56224 ) ( IN-CITY ?auto_56220 ?auto_56224 ) ( not ( = ?auto_56220 ?auto_56225 ) ) ( not ( = ?auto_56222 ?auto_56221 ) ) ( OBJ-AT ?auto_56221 ?auto_56225 ) ( TRUCK-AT ?auto_56223 ?auto_56220 ) ( IN-TRUCK ?auto_56222 ?auto_56223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56222 ?auto_56221 ?auto_56220 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56405 - OBJ
      ?auto_56404 - LOCATION
    )
    :vars
    (
      ?auto_56409 - LOCATION
      ?auto_56407 - CITY
      ?auto_56408 - OBJ
      ?auto_56406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56409 ?auto_56407 ) ( IN-CITY ?auto_56404 ?auto_56407 ) ( not ( = ?auto_56404 ?auto_56409 ) ) ( not ( = ?auto_56408 ?auto_56405 ) ) ( OBJ-AT ?auto_56405 ?auto_56409 ) ( IN-TRUCK ?auto_56408 ?auto_56406 ) ( TRUCK-AT ?auto_56406 ?auto_56409 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56406 ?auto_56409 ?auto_56404 ?auto_56407 )
      ( DELIVER-2PKG ?auto_56408 ?auto_56405 ?auto_56404 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56411 - OBJ
      ?auto_56412 - OBJ
      ?auto_56410 - LOCATION
    )
    :vars
    (
      ?auto_56414 - LOCATION
      ?auto_56413 - CITY
      ?auto_56415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56414 ?auto_56413 ) ( IN-CITY ?auto_56410 ?auto_56413 ) ( not ( = ?auto_56410 ?auto_56414 ) ) ( not ( = ?auto_56411 ?auto_56412 ) ) ( OBJ-AT ?auto_56412 ?auto_56414 ) ( IN-TRUCK ?auto_56411 ?auto_56415 ) ( TRUCK-AT ?auto_56415 ?auto_56414 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56412 ?auto_56410 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_56417 - OBJ
      ?auto_56418 - OBJ
      ?auto_56416 - LOCATION
    )
    :vars
    (
      ?auto_56421 - LOCATION
      ?auto_56419 - CITY
      ?auto_56420 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56421 ?auto_56419 ) ( IN-CITY ?auto_56416 ?auto_56419 ) ( not ( = ?auto_56416 ?auto_56421 ) ) ( not ( = ?auto_56418 ?auto_56417 ) ) ( OBJ-AT ?auto_56417 ?auto_56421 ) ( IN-TRUCK ?auto_56418 ?auto_56420 ) ( TRUCK-AT ?auto_56420 ?auto_56421 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56418 ?auto_56417 ?auto_56416 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57927 - OBJ
      ?auto_57928 - OBJ
      ?auto_57929 - OBJ
      ?auto_57926 - LOCATION
    )
    :vars
    (
      ?auto_57930 - TRUCK
      ?auto_57932 - LOCATION
      ?auto_57931 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57929 ?auto_57930 ) ( TRUCK-AT ?auto_57930 ?auto_57932 ) ( IN-CITY ?auto_57932 ?auto_57931 ) ( IN-CITY ?auto_57926 ?auto_57931 ) ( not ( = ?auto_57926 ?auto_57932 ) ) ( OBJ-AT ?auto_57927 ?auto_57926 ) ( not ( = ?auto_57927 ?auto_57929 ) ) ( OBJ-AT ?auto_57928 ?auto_57926 ) ( not ( = ?auto_57927 ?auto_57928 ) ) ( not ( = ?auto_57928 ?auto_57929 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57927 ?auto_57929 ?auto_57926 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57938 - OBJ
      ?auto_57939 - OBJ
      ?auto_57940 - OBJ
      ?auto_57937 - LOCATION
    )
    :vars
    (
      ?auto_57941 - TRUCK
      ?auto_57943 - LOCATION
      ?auto_57942 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57939 ?auto_57941 ) ( TRUCK-AT ?auto_57941 ?auto_57943 ) ( IN-CITY ?auto_57943 ?auto_57942 ) ( IN-CITY ?auto_57937 ?auto_57942 ) ( not ( = ?auto_57937 ?auto_57943 ) ) ( OBJ-AT ?auto_57938 ?auto_57937 ) ( not ( = ?auto_57938 ?auto_57939 ) ) ( OBJ-AT ?auto_57940 ?auto_57937 ) ( not ( = ?auto_57938 ?auto_57940 ) ) ( not ( = ?auto_57939 ?auto_57940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57938 ?auto_57939 ?auto_57937 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57960 - OBJ
      ?auto_57961 - OBJ
      ?auto_57962 - OBJ
      ?auto_57959 - LOCATION
    )
    :vars
    (
      ?auto_57964 - TRUCK
      ?auto_57966 - LOCATION
      ?auto_57965 - CITY
      ?auto_57963 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57962 ?auto_57964 ) ( TRUCK-AT ?auto_57964 ?auto_57966 ) ( IN-CITY ?auto_57966 ?auto_57965 ) ( IN-CITY ?auto_57959 ?auto_57965 ) ( not ( = ?auto_57959 ?auto_57966 ) ) ( OBJ-AT ?auto_57963 ?auto_57959 ) ( not ( = ?auto_57963 ?auto_57962 ) ) ( OBJ-AT ?auto_57960 ?auto_57959 ) ( OBJ-AT ?auto_57961 ?auto_57959 ) ( not ( = ?auto_57960 ?auto_57961 ) ) ( not ( = ?auto_57960 ?auto_57962 ) ) ( not ( = ?auto_57960 ?auto_57963 ) ) ( not ( = ?auto_57961 ?auto_57962 ) ) ( not ( = ?auto_57961 ?auto_57963 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57963 ?auto_57962 ?auto_57959 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57972 - OBJ
      ?auto_57973 - OBJ
      ?auto_57974 - OBJ
      ?auto_57971 - LOCATION
    )
    :vars
    (
      ?auto_57976 - TRUCK
      ?auto_57978 - LOCATION
      ?auto_57977 - CITY
      ?auto_57975 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57973 ?auto_57976 ) ( TRUCK-AT ?auto_57976 ?auto_57978 ) ( IN-CITY ?auto_57978 ?auto_57977 ) ( IN-CITY ?auto_57971 ?auto_57977 ) ( not ( = ?auto_57971 ?auto_57978 ) ) ( OBJ-AT ?auto_57975 ?auto_57971 ) ( not ( = ?auto_57975 ?auto_57973 ) ) ( OBJ-AT ?auto_57972 ?auto_57971 ) ( OBJ-AT ?auto_57974 ?auto_57971 ) ( not ( = ?auto_57972 ?auto_57973 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( not ( = ?auto_57972 ?auto_57975 ) ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57974 ?auto_57975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57975 ?auto_57973 ?auto_57971 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57988 - OBJ
      ?auto_57989 - OBJ
      ?auto_57990 - OBJ
      ?auto_57987 - LOCATION
    )
    :vars
    (
      ?auto_57991 - TRUCK
      ?auto_57993 - LOCATION
      ?auto_57992 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57988 ?auto_57991 ) ( TRUCK-AT ?auto_57991 ?auto_57993 ) ( IN-CITY ?auto_57993 ?auto_57992 ) ( IN-CITY ?auto_57987 ?auto_57992 ) ( not ( = ?auto_57987 ?auto_57993 ) ) ( OBJ-AT ?auto_57990 ?auto_57987 ) ( not ( = ?auto_57990 ?auto_57988 ) ) ( OBJ-AT ?auto_57989 ?auto_57987 ) ( not ( = ?auto_57988 ?auto_57989 ) ) ( not ( = ?auto_57989 ?auto_57990 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57990 ?auto_57988 ?auto_57987 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58010 - OBJ
      ?auto_58011 - OBJ
      ?auto_58012 - OBJ
      ?auto_58009 - LOCATION
    )
    :vars
    (
      ?auto_58014 - TRUCK
      ?auto_58016 - LOCATION
      ?auto_58015 - CITY
      ?auto_58013 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58010 ?auto_58014 ) ( TRUCK-AT ?auto_58014 ?auto_58016 ) ( IN-CITY ?auto_58016 ?auto_58015 ) ( IN-CITY ?auto_58009 ?auto_58015 ) ( not ( = ?auto_58009 ?auto_58016 ) ) ( OBJ-AT ?auto_58013 ?auto_58009 ) ( not ( = ?auto_58013 ?auto_58010 ) ) ( OBJ-AT ?auto_58011 ?auto_58009 ) ( OBJ-AT ?auto_58012 ?auto_58009 ) ( not ( = ?auto_58010 ?auto_58011 ) ) ( not ( = ?auto_58010 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58013 ) ) ( not ( = ?auto_58012 ?auto_58013 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58013 ?auto_58010 ?auto_58009 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58049 - OBJ
      ?auto_58050 - OBJ
      ?auto_58051 - OBJ
      ?auto_58052 - OBJ
      ?auto_58048 - LOCATION
    )
    :vars
    (
      ?auto_58053 - TRUCK
      ?auto_58055 - LOCATION
      ?auto_58054 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58052 ?auto_58053 ) ( TRUCK-AT ?auto_58053 ?auto_58055 ) ( IN-CITY ?auto_58055 ?auto_58054 ) ( IN-CITY ?auto_58048 ?auto_58054 ) ( not ( = ?auto_58048 ?auto_58055 ) ) ( OBJ-AT ?auto_58051 ?auto_58048 ) ( not ( = ?auto_58051 ?auto_58052 ) ) ( OBJ-AT ?auto_58049 ?auto_58048 ) ( OBJ-AT ?auto_58050 ?auto_58048 ) ( not ( = ?auto_58049 ?auto_58050 ) ) ( not ( = ?auto_58049 ?auto_58051 ) ) ( not ( = ?auto_58049 ?auto_58052 ) ) ( not ( = ?auto_58050 ?auto_58051 ) ) ( not ( = ?auto_58050 ?auto_58052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58051 ?auto_58052 ?auto_58048 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58057 - OBJ
      ?auto_58058 - OBJ
      ?auto_58059 - OBJ
      ?auto_58060 - OBJ
      ?auto_58056 - LOCATION
    )
    :vars
    (
      ?auto_58061 - TRUCK
      ?auto_58063 - LOCATION
      ?auto_58062 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58060 ?auto_58061 ) ( TRUCK-AT ?auto_58061 ?auto_58063 ) ( IN-CITY ?auto_58063 ?auto_58062 ) ( IN-CITY ?auto_58056 ?auto_58062 ) ( not ( = ?auto_58056 ?auto_58063 ) ) ( OBJ-AT ?auto_58057 ?auto_58056 ) ( not ( = ?auto_58057 ?auto_58060 ) ) ( OBJ-AT ?auto_58058 ?auto_58056 ) ( OBJ-AT ?auto_58059 ?auto_58056 ) ( not ( = ?auto_58057 ?auto_58058 ) ) ( not ( = ?auto_58057 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( not ( = ?auto_58059 ?auto_58060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58057 ?auto_58060 ?auto_58056 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58065 - OBJ
      ?auto_58066 - OBJ
      ?auto_58067 - OBJ
      ?auto_58068 - OBJ
      ?auto_58064 - LOCATION
    )
    :vars
    (
      ?auto_58069 - TRUCK
      ?auto_58071 - LOCATION
      ?auto_58070 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58067 ?auto_58069 ) ( TRUCK-AT ?auto_58069 ?auto_58071 ) ( IN-CITY ?auto_58071 ?auto_58070 ) ( IN-CITY ?auto_58064 ?auto_58070 ) ( not ( = ?auto_58064 ?auto_58071 ) ) ( OBJ-AT ?auto_58068 ?auto_58064 ) ( not ( = ?auto_58068 ?auto_58067 ) ) ( OBJ-AT ?auto_58065 ?auto_58064 ) ( OBJ-AT ?auto_58066 ?auto_58064 ) ( not ( = ?auto_58065 ?auto_58066 ) ) ( not ( = ?auto_58065 ?auto_58067 ) ) ( not ( = ?auto_58065 ?auto_58068 ) ) ( not ( = ?auto_58066 ?auto_58067 ) ) ( not ( = ?auto_58066 ?auto_58068 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58068 ?auto_58067 ?auto_58064 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58073 - OBJ
      ?auto_58074 - OBJ
      ?auto_58075 - OBJ
      ?auto_58076 - OBJ
      ?auto_58072 - LOCATION
    )
    :vars
    (
      ?auto_58077 - TRUCK
      ?auto_58079 - LOCATION
      ?auto_58078 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58075 ?auto_58077 ) ( TRUCK-AT ?auto_58077 ?auto_58079 ) ( IN-CITY ?auto_58079 ?auto_58078 ) ( IN-CITY ?auto_58072 ?auto_58078 ) ( not ( = ?auto_58072 ?auto_58079 ) ) ( OBJ-AT ?auto_58073 ?auto_58072 ) ( not ( = ?auto_58073 ?auto_58075 ) ) ( OBJ-AT ?auto_58074 ?auto_58072 ) ( OBJ-AT ?auto_58076 ?auto_58072 ) ( not ( = ?auto_58073 ?auto_58074 ) ) ( not ( = ?auto_58073 ?auto_58076 ) ) ( not ( = ?auto_58074 ?auto_58075 ) ) ( not ( = ?auto_58074 ?auto_58076 ) ) ( not ( = ?auto_58075 ?auto_58076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58073 ?auto_58075 ?auto_58072 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58249 - OBJ
      ?auto_58250 - OBJ
      ?auto_58251 - OBJ
      ?auto_58252 - OBJ
      ?auto_58248 - LOCATION
    )
    :vars
    (
      ?auto_58254 - TRUCK
      ?auto_58256 - LOCATION
      ?auto_58255 - CITY
      ?auto_58253 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58252 ?auto_58254 ) ( TRUCK-AT ?auto_58254 ?auto_58256 ) ( IN-CITY ?auto_58256 ?auto_58255 ) ( IN-CITY ?auto_58248 ?auto_58255 ) ( not ( = ?auto_58248 ?auto_58256 ) ) ( OBJ-AT ?auto_58253 ?auto_58248 ) ( not ( = ?auto_58253 ?auto_58252 ) ) ( OBJ-AT ?auto_58249 ?auto_58248 ) ( OBJ-AT ?auto_58250 ?auto_58248 ) ( OBJ-AT ?auto_58251 ?auto_58248 ) ( not ( = ?auto_58249 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58252 ) ) ( not ( = ?auto_58249 ?auto_58253 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58252 ) ) ( not ( = ?auto_58250 ?auto_58253 ) ) ( not ( = ?auto_58251 ?auto_58252 ) ) ( not ( = ?auto_58251 ?auto_58253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58253 ?auto_58252 ?auto_58248 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58266 - OBJ
      ?auto_58267 - OBJ
      ?auto_58268 - OBJ
      ?auto_58269 - OBJ
      ?auto_58265 - LOCATION
    )
    :vars
    (
      ?auto_58271 - TRUCK
      ?auto_58273 - LOCATION
      ?auto_58272 - CITY
      ?auto_58270 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58268 ?auto_58271 ) ( TRUCK-AT ?auto_58271 ?auto_58273 ) ( IN-CITY ?auto_58273 ?auto_58272 ) ( IN-CITY ?auto_58265 ?auto_58272 ) ( not ( = ?auto_58265 ?auto_58273 ) ) ( OBJ-AT ?auto_58270 ?auto_58265 ) ( not ( = ?auto_58270 ?auto_58268 ) ) ( OBJ-AT ?auto_58266 ?auto_58265 ) ( OBJ-AT ?auto_58267 ?auto_58265 ) ( OBJ-AT ?auto_58269 ?auto_58265 ) ( not ( = ?auto_58266 ?auto_58267 ) ) ( not ( = ?auto_58266 ?auto_58268 ) ) ( not ( = ?auto_58266 ?auto_58269 ) ) ( not ( = ?auto_58266 ?auto_58270 ) ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( not ( = ?auto_58267 ?auto_58269 ) ) ( not ( = ?auto_58267 ?auto_58270 ) ) ( not ( = ?auto_58268 ?auto_58269 ) ) ( not ( = ?auto_58269 ?auto_58270 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58270 ?auto_58268 ?auto_58265 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58284 - OBJ
      ?auto_58285 - OBJ
      ?auto_58286 - OBJ
      ?auto_58287 - OBJ
      ?auto_58283 - LOCATION
    )
    :vars
    (
      ?auto_58288 - TRUCK
      ?auto_58290 - LOCATION
      ?auto_58289 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58285 ?auto_58288 ) ( TRUCK-AT ?auto_58288 ?auto_58290 ) ( IN-CITY ?auto_58290 ?auto_58289 ) ( IN-CITY ?auto_58283 ?auto_58289 ) ( not ( = ?auto_58283 ?auto_58290 ) ) ( OBJ-AT ?auto_58287 ?auto_58283 ) ( not ( = ?auto_58287 ?auto_58285 ) ) ( OBJ-AT ?auto_58284 ?auto_58283 ) ( OBJ-AT ?auto_58286 ?auto_58283 ) ( not ( = ?auto_58284 ?auto_58285 ) ) ( not ( = ?auto_58284 ?auto_58286 ) ) ( not ( = ?auto_58284 ?auto_58287 ) ) ( not ( = ?auto_58285 ?auto_58286 ) ) ( not ( = ?auto_58286 ?auto_58287 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58287 ?auto_58285 ?auto_58283 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58292 - OBJ
      ?auto_58293 - OBJ
      ?auto_58294 - OBJ
      ?auto_58295 - OBJ
      ?auto_58291 - LOCATION
    )
    :vars
    (
      ?auto_58296 - TRUCK
      ?auto_58298 - LOCATION
      ?auto_58297 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58293 ?auto_58296 ) ( TRUCK-AT ?auto_58296 ?auto_58298 ) ( IN-CITY ?auto_58298 ?auto_58297 ) ( IN-CITY ?auto_58291 ?auto_58297 ) ( not ( = ?auto_58291 ?auto_58298 ) ) ( OBJ-AT ?auto_58294 ?auto_58291 ) ( not ( = ?auto_58294 ?auto_58293 ) ) ( OBJ-AT ?auto_58292 ?auto_58291 ) ( OBJ-AT ?auto_58295 ?auto_58291 ) ( not ( = ?auto_58292 ?auto_58293 ) ) ( not ( = ?auto_58292 ?auto_58294 ) ) ( not ( = ?auto_58292 ?auto_58295 ) ) ( not ( = ?auto_58293 ?auto_58295 ) ) ( not ( = ?auto_58294 ?auto_58295 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58294 ?auto_58293 ?auto_58291 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58316 - OBJ
      ?auto_58317 - OBJ
      ?auto_58318 - OBJ
      ?auto_58319 - OBJ
      ?auto_58315 - LOCATION
    )
    :vars
    (
      ?auto_58321 - TRUCK
      ?auto_58323 - LOCATION
      ?auto_58322 - CITY
      ?auto_58320 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58317 ?auto_58321 ) ( TRUCK-AT ?auto_58321 ?auto_58323 ) ( IN-CITY ?auto_58323 ?auto_58322 ) ( IN-CITY ?auto_58315 ?auto_58322 ) ( not ( = ?auto_58315 ?auto_58323 ) ) ( OBJ-AT ?auto_58320 ?auto_58315 ) ( not ( = ?auto_58320 ?auto_58317 ) ) ( OBJ-AT ?auto_58316 ?auto_58315 ) ( OBJ-AT ?auto_58318 ?auto_58315 ) ( OBJ-AT ?auto_58319 ?auto_58315 ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58316 ?auto_58318 ) ) ( not ( = ?auto_58316 ?auto_58319 ) ) ( not ( = ?auto_58316 ?auto_58320 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58320 ) ) ( not ( = ?auto_58319 ?auto_58320 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58320 ?auto_58317 ?auto_58315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58368 - OBJ
      ?auto_58369 - OBJ
      ?auto_58370 - OBJ
      ?auto_58371 - OBJ
      ?auto_58367 - LOCATION
    )
    :vars
    (
      ?auto_58372 - TRUCK
      ?auto_58374 - LOCATION
      ?auto_58373 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58368 ?auto_58372 ) ( TRUCK-AT ?auto_58372 ?auto_58374 ) ( IN-CITY ?auto_58374 ?auto_58373 ) ( IN-CITY ?auto_58367 ?auto_58373 ) ( not ( = ?auto_58367 ?auto_58374 ) ) ( OBJ-AT ?auto_58369 ?auto_58367 ) ( not ( = ?auto_58369 ?auto_58368 ) ) ( OBJ-AT ?auto_58370 ?auto_58367 ) ( OBJ-AT ?auto_58371 ?auto_58367 ) ( not ( = ?auto_58368 ?auto_58370 ) ) ( not ( = ?auto_58368 ?auto_58371 ) ) ( not ( = ?auto_58369 ?auto_58370 ) ) ( not ( = ?auto_58369 ?auto_58371 ) ) ( not ( = ?auto_58370 ?auto_58371 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58369 ?auto_58368 ?auto_58367 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58432 - OBJ
      ?auto_58433 - OBJ
      ?auto_58434 - OBJ
      ?auto_58435 - OBJ
      ?auto_58431 - LOCATION
    )
    :vars
    (
      ?auto_58436 - TRUCK
      ?auto_58438 - LOCATION
      ?auto_58437 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58432 ?auto_58436 ) ( TRUCK-AT ?auto_58436 ?auto_58438 ) ( IN-CITY ?auto_58438 ?auto_58437 ) ( IN-CITY ?auto_58431 ?auto_58437 ) ( not ( = ?auto_58431 ?auto_58438 ) ) ( OBJ-AT ?auto_58434 ?auto_58431 ) ( not ( = ?auto_58434 ?auto_58432 ) ) ( OBJ-AT ?auto_58433 ?auto_58431 ) ( OBJ-AT ?auto_58435 ?auto_58431 ) ( not ( = ?auto_58432 ?auto_58433 ) ) ( not ( = ?auto_58432 ?auto_58435 ) ) ( not ( = ?auto_58433 ?auto_58434 ) ) ( not ( = ?auto_58433 ?auto_58435 ) ) ( not ( = ?auto_58434 ?auto_58435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58434 ?auto_58432 ?auto_58431 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58464 - OBJ
      ?auto_58465 - OBJ
      ?auto_58466 - OBJ
      ?auto_58467 - OBJ
      ?auto_58463 - LOCATION
    )
    :vars
    (
      ?auto_58469 - TRUCK
      ?auto_58471 - LOCATION
      ?auto_58470 - CITY
      ?auto_58468 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58464 ?auto_58469 ) ( TRUCK-AT ?auto_58469 ?auto_58471 ) ( IN-CITY ?auto_58471 ?auto_58470 ) ( IN-CITY ?auto_58463 ?auto_58470 ) ( not ( = ?auto_58463 ?auto_58471 ) ) ( OBJ-AT ?auto_58468 ?auto_58463 ) ( not ( = ?auto_58468 ?auto_58464 ) ) ( OBJ-AT ?auto_58465 ?auto_58463 ) ( OBJ-AT ?auto_58466 ?auto_58463 ) ( OBJ-AT ?auto_58467 ?auto_58463 ) ( not ( = ?auto_58464 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58466 ) ) ( not ( = ?auto_58464 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58466 ) ) ( not ( = ?auto_58465 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58468 ) ) ( not ( = ?auto_58466 ?auto_58467 ) ) ( not ( = ?auto_58466 ?auto_58468 ) ) ( not ( = ?auto_58467 ?auto_58468 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58468 ?auto_58464 ?auto_58463 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58626 - OBJ
      ?auto_58627 - OBJ
      ?auto_58628 - OBJ
      ?auto_58625 - LOCATION
    )
    :vars
    (
      ?auto_58631 - TRUCK
      ?auto_58630 - LOCATION
      ?auto_58629 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58631 ?auto_58630 ) ( IN-CITY ?auto_58630 ?auto_58629 ) ( IN-CITY ?auto_58625 ?auto_58629 ) ( not ( = ?auto_58625 ?auto_58630 ) ) ( OBJ-AT ?auto_58628 ?auto_58625 ) ( not ( = ?auto_58628 ?auto_58627 ) ) ( OBJ-AT ?auto_58627 ?auto_58630 ) ( OBJ-AT ?auto_58626 ?auto_58625 ) ( not ( = ?auto_58626 ?auto_58627 ) ) ( not ( = ?auto_58626 ?auto_58628 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58628 ?auto_58627 ?auto_58625 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58648 - OBJ
      ?auto_58649 - OBJ
      ?auto_58650 - OBJ
      ?auto_58647 - LOCATION
    )
    :vars
    (
      ?auto_58654 - TRUCK
      ?auto_58653 - LOCATION
      ?auto_58651 - CITY
      ?auto_58652 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58654 ?auto_58653 ) ( IN-CITY ?auto_58653 ?auto_58651 ) ( IN-CITY ?auto_58647 ?auto_58651 ) ( not ( = ?auto_58647 ?auto_58653 ) ) ( OBJ-AT ?auto_58652 ?auto_58647 ) ( not ( = ?auto_58652 ?auto_58650 ) ) ( OBJ-AT ?auto_58650 ?auto_58653 ) ( OBJ-AT ?auto_58648 ?auto_58647 ) ( OBJ-AT ?auto_58649 ?auto_58647 ) ( not ( = ?auto_58648 ?auto_58649 ) ) ( not ( = ?auto_58648 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58652 ) ) ( not ( = ?auto_58649 ?auto_58650 ) ) ( not ( = ?auto_58649 ?auto_58652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58652 ?auto_58650 ?auto_58647 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58660 - OBJ
      ?auto_58661 - OBJ
      ?auto_58662 - OBJ
      ?auto_58659 - LOCATION
    )
    :vars
    (
      ?auto_58666 - TRUCK
      ?auto_58665 - LOCATION
      ?auto_58663 - CITY
      ?auto_58664 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58666 ?auto_58665 ) ( IN-CITY ?auto_58665 ?auto_58663 ) ( IN-CITY ?auto_58659 ?auto_58663 ) ( not ( = ?auto_58659 ?auto_58665 ) ) ( OBJ-AT ?auto_58664 ?auto_58659 ) ( not ( = ?auto_58664 ?auto_58661 ) ) ( OBJ-AT ?auto_58661 ?auto_58665 ) ( OBJ-AT ?auto_58660 ?auto_58659 ) ( OBJ-AT ?auto_58662 ?auto_58659 ) ( not ( = ?auto_58660 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58662 ) ) ( not ( = ?auto_58660 ?auto_58664 ) ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58662 ?auto_58664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58664 ?auto_58661 ?auto_58659 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58676 - OBJ
      ?auto_58677 - OBJ
      ?auto_58678 - OBJ
      ?auto_58675 - LOCATION
    )
    :vars
    (
      ?auto_58681 - TRUCK
      ?auto_58680 - LOCATION
      ?auto_58679 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58681 ?auto_58680 ) ( IN-CITY ?auto_58680 ?auto_58679 ) ( IN-CITY ?auto_58675 ?auto_58679 ) ( not ( = ?auto_58675 ?auto_58680 ) ) ( OBJ-AT ?auto_58677 ?auto_58675 ) ( not ( = ?auto_58677 ?auto_58676 ) ) ( OBJ-AT ?auto_58676 ?auto_58680 ) ( OBJ-AT ?auto_58678 ?auto_58675 ) ( not ( = ?auto_58676 ?auto_58678 ) ) ( not ( = ?auto_58677 ?auto_58678 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58677 ?auto_58676 ?auto_58675 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58698 - OBJ
      ?auto_58699 - OBJ
      ?auto_58700 - OBJ
      ?auto_58697 - LOCATION
    )
    :vars
    (
      ?auto_58704 - TRUCK
      ?auto_58703 - LOCATION
      ?auto_58701 - CITY
      ?auto_58702 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58704 ?auto_58703 ) ( IN-CITY ?auto_58703 ?auto_58701 ) ( IN-CITY ?auto_58697 ?auto_58701 ) ( not ( = ?auto_58697 ?auto_58703 ) ) ( OBJ-AT ?auto_58702 ?auto_58697 ) ( not ( = ?auto_58702 ?auto_58698 ) ) ( OBJ-AT ?auto_58698 ?auto_58703 ) ( OBJ-AT ?auto_58699 ?auto_58697 ) ( OBJ-AT ?auto_58700 ?auto_58697 ) ( not ( = ?auto_58698 ?auto_58699 ) ) ( not ( = ?auto_58698 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58702 ) ) ( not ( = ?auto_58700 ?auto_58702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58702 ?auto_58698 ?auto_58697 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58737 - OBJ
      ?auto_58738 - OBJ
      ?auto_58739 - OBJ
      ?auto_58740 - OBJ
      ?auto_58736 - LOCATION
    )
    :vars
    (
      ?auto_58743 - TRUCK
      ?auto_58742 - LOCATION
      ?auto_58741 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58743 ?auto_58742 ) ( IN-CITY ?auto_58742 ?auto_58741 ) ( IN-CITY ?auto_58736 ?auto_58741 ) ( not ( = ?auto_58736 ?auto_58742 ) ) ( OBJ-AT ?auto_58738 ?auto_58736 ) ( not ( = ?auto_58738 ?auto_58740 ) ) ( OBJ-AT ?auto_58740 ?auto_58742 ) ( OBJ-AT ?auto_58737 ?auto_58736 ) ( OBJ-AT ?auto_58739 ?auto_58736 ) ( not ( = ?auto_58737 ?auto_58738 ) ) ( not ( = ?auto_58737 ?auto_58739 ) ) ( not ( = ?auto_58737 ?auto_58740 ) ) ( not ( = ?auto_58738 ?auto_58739 ) ) ( not ( = ?auto_58739 ?auto_58740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58738 ?auto_58740 ?auto_58736 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58745 - OBJ
      ?auto_58746 - OBJ
      ?auto_58747 - OBJ
      ?auto_58748 - OBJ
      ?auto_58744 - LOCATION
    )
    :vars
    (
      ?auto_58751 - TRUCK
      ?auto_58750 - LOCATION
      ?auto_58749 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58751 ?auto_58750 ) ( IN-CITY ?auto_58750 ?auto_58749 ) ( IN-CITY ?auto_58744 ?auto_58749 ) ( not ( = ?auto_58744 ?auto_58750 ) ) ( OBJ-AT ?auto_58745 ?auto_58744 ) ( not ( = ?auto_58745 ?auto_58748 ) ) ( OBJ-AT ?auto_58748 ?auto_58750 ) ( OBJ-AT ?auto_58746 ?auto_58744 ) ( OBJ-AT ?auto_58747 ?auto_58744 ) ( not ( = ?auto_58745 ?auto_58746 ) ) ( not ( = ?auto_58745 ?auto_58747 ) ) ( not ( = ?auto_58746 ?auto_58747 ) ) ( not ( = ?auto_58746 ?auto_58748 ) ) ( not ( = ?auto_58747 ?auto_58748 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58745 ?auto_58748 ?auto_58744 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58753 - OBJ
      ?auto_58754 - OBJ
      ?auto_58755 - OBJ
      ?auto_58756 - OBJ
      ?auto_58752 - LOCATION
    )
    :vars
    (
      ?auto_58759 - TRUCK
      ?auto_58758 - LOCATION
      ?auto_58757 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58759 ?auto_58758 ) ( IN-CITY ?auto_58758 ?auto_58757 ) ( IN-CITY ?auto_58752 ?auto_58757 ) ( not ( = ?auto_58752 ?auto_58758 ) ) ( OBJ-AT ?auto_58756 ?auto_58752 ) ( not ( = ?auto_58756 ?auto_58755 ) ) ( OBJ-AT ?auto_58755 ?auto_58758 ) ( OBJ-AT ?auto_58753 ?auto_58752 ) ( OBJ-AT ?auto_58754 ?auto_58752 ) ( not ( = ?auto_58753 ?auto_58754 ) ) ( not ( = ?auto_58753 ?auto_58755 ) ) ( not ( = ?auto_58753 ?auto_58756 ) ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58756 ?auto_58755 ?auto_58752 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58761 - OBJ
      ?auto_58762 - OBJ
      ?auto_58763 - OBJ
      ?auto_58764 - OBJ
      ?auto_58760 - LOCATION
    )
    :vars
    (
      ?auto_58767 - TRUCK
      ?auto_58766 - LOCATION
      ?auto_58765 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58767 ?auto_58766 ) ( IN-CITY ?auto_58766 ?auto_58765 ) ( IN-CITY ?auto_58760 ?auto_58765 ) ( not ( = ?auto_58760 ?auto_58766 ) ) ( OBJ-AT ?auto_58761 ?auto_58760 ) ( not ( = ?auto_58761 ?auto_58763 ) ) ( OBJ-AT ?auto_58763 ?auto_58766 ) ( OBJ-AT ?auto_58762 ?auto_58760 ) ( OBJ-AT ?auto_58764 ?auto_58760 ) ( not ( = ?auto_58761 ?auto_58762 ) ) ( not ( = ?auto_58761 ?auto_58764 ) ) ( not ( = ?auto_58762 ?auto_58763 ) ) ( not ( = ?auto_58762 ?auto_58764 ) ) ( not ( = ?auto_58763 ?auto_58764 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58761 ?auto_58763 ?auto_58760 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58817 - OBJ
      ?auto_58818 - OBJ
      ?auto_58819 - OBJ
      ?auto_58820 - OBJ
      ?auto_58816 - LOCATION
    )
    :vars
    (
      ?auto_58823 - TRUCK
      ?auto_58822 - LOCATION
      ?auto_58821 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58823 ?auto_58822 ) ( IN-CITY ?auto_58822 ?auto_58821 ) ( IN-CITY ?auto_58816 ?auto_58821 ) ( not ( = ?auto_58816 ?auto_58822 ) ) ( OBJ-AT ?auto_58817 ?auto_58816 ) ( not ( = ?auto_58817 ?auto_58818 ) ) ( OBJ-AT ?auto_58818 ?auto_58822 ) ( OBJ-AT ?auto_58819 ?auto_58816 ) ( OBJ-AT ?auto_58820 ?auto_58816 ) ( not ( = ?auto_58817 ?auto_58819 ) ) ( not ( = ?auto_58817 ?auto_58820 ) ) ( not ( = ?auto_58818 ?auto_58819 ) ) ( not ( = ?auto_58818 ?auto_58820 ) ) ( not ( = ?auto_58819 ?auto_58820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58817 ?auto_58818 ?auto_58816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58937 - OBJ
      ?auto_58938 - OBJ
      ?auto_58939 - OBJ
      ?auto_58940 - OBJ
      ?auto_58936 - LOCATION
    )
    :vars
    (
      ?auto_58944 - TRUCK
      ?auto_58943 - LOCATION
      ?auto_58941 - CITY
      ?auto_58942 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58944 ?auto_58943 ) ( IN-CITY ?auto_58943 ?auto_58941 ) ( IN-CITY ?auto_58936 ?auto_58941 ) ( not ( = ?auto_58936 ?auto_58943 ) ) ( OBJ-AT ?auto_58942 ?auto_58936 ) ( not ( = ?auto_58942 ?auto_58940 ) ) ( OBJ-AT ?auto_58940 ?auto_58943 ) ( OBJ-AT ?auto_58937 ?auto_58936 ) ( OBJ-AT ?auto_58938 ?auto_58936 ) ( OBJ-AT ?auto_58939 ?auto_58936 ) ( not ( = ?auto_58937 ?auto_58938 ) ) ( not ( = ?auto_58937 ?auto_58939 ) ) ( not ( = ?auto_58937 ?auto_58940 ) ) ( not ( = ?auto_58937 ?auto_58942 ) ) ( not ( = ?auto_58938 ?auto_58939 ) ) ( not ( = ?auto_58938 ?auto_58940 ) ) ( not ( = ?auto_58938 ?auto_58942 ) ) ( not ( = ?auto_58939 ?auto_58940 ) ) ( not ( = ?auto_58939 ?auto_58942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58942 ?auto_58940 ?auto_58936 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58954 - OBJ
      ?auto_58955 - OBJ
      ?auto_58956 - OBJ
      ?auto_58957 - OBJ
      ?auto_58953 - LOCATION
    )
    :vars
    (
      ?auto_58961 - TRUCK
      ?auto_58960 - LOCATION
      ?auto_58958 - CITY
      ?auto_58959 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58961 ?auto_58960 ) ( IN-CITY ?auto_58960 ?auto_58958 ) ( IN-CITY ?auto_58953 ?auto_58958 ) ( not ( = ?auto_58953 ?auto_58960 ) ) ( OBJ-AT ?auto_58959 ?auto_58953 ) ( not ( = ?auto_58959 ?auto_58956 ) ) ( OBJ-AT ?auto_58956 ?auto_58960 ) ( OBJ-AT ?auto_58954 ?auto_58953 ) ( OBJ-AT ?auto_58955 ?auto_58953 ) ( OBJ-AT ?auto_58957 ?auto_58953 ) ( not ( = ?auto_58954 ?auto_58955 ) ) ( not ( = ?auto_58954 ?auto_58956 ) ) ( not ( = ?auto_58954 ?auto_58957 ) ) ( not ( = ?auto_58954 ?auto_58959 ) ) ( not ( = ?auto_58955 ?auto_58956 ) ) ( not ( = ?auto_58955 ?auto_58957 ) ) ( not ( = ?auto_58955 ?auto_58959 ) ) ( not ( = ?auto_58956 ?auto_58957 ) ) ( not ( = ?auto_58957 ?auto_58959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58959 ?auto_58956 ?auto_58953 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58972 - OBJ
      ?auto_58973 - OBJ
      ?auto_58974 - OBJ
      ?auto_58975 - OBJ
      ?auto_58971 - LOCATION
    )
    :vars
    (
      ?auto_58978 - TRUCK
      ?auto_58977 - LOCATION
      ?auto_58976 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58978 ?auto_58977 ) ( IN-CITY ?auto_58977 ?auto_58976 ) ( IN-CITY ?auto_58971 ?auto_58976 ) ( not ( = ?auto_58971 ?auto_58977 ) ) ( OBJ-AT ?auto_58974 ?auto_58971 ) ( not ( = ?auto_58974 ?auto_58973 ) ) ( OBJ-AT ?auto_58973 ?auto_58977 ) ( OBJ-AT ?auto_58972 ?auto_58971 ) ( OBJ-AT ?auto_58975 ?auto_58971 ) ( not ( = ?auto_58972 ?auto_58973 ) ) ( not ( = ?auto_58972 ?auto_58974 ) ) ( not ( = ?auto_58972 ?auto_58975 ) ) ( not ( = ?auto_58973 ?auto_58975 ) ) ( not ( = ?auto_58974 ?auto_58975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58974 ?auto_58973 ?auto_58971 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59004 - OBJ
      ?auto_59005 - OBJ
      ?auto_59006 - OBJ
      ?auto_59007 - OBJ
      ?auto_59003 - LOCATION
    )
    :vars
    (
      ?auto_59011 - TRUCK
      ?auto_59010 - LOCATION
      ?auto_59008 - CITY
      ?auto_59009 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59011 ?auto_59010 ) ( IN-CITY ?auto_59010 ?auto_59008 ) ( IN-CITY ?auto_59003 ?auto_59008 ) ( not ( = ?auto_59003 ?auto_59010 ) ) ( OBJ-AT ?auto_59009 ?auto_59003 ) ( not ( = ?auto_59009 ?auto_59005 ) ) ( OBJ-AT ?auto_59005 ?auto_59010 ) ( OBJ-AT ?auto_59004 ?auto_59003 ) ( OBJ-AT ?auto_59006 ?auto_59003 ) ( OBJ-AT ?auto_59007 ?auto_59003 ) ( not ( = ?auto_59004 ?auto_59005 ) ) ( not ( = ?auto_59004 ?auto_59006 ) ) ( not ( = ?auto_59004 ?auto_59007 ) ) ( not ( = ?auto_59004 ?auto_59009 ) ) ( not ( = ?auto_59005 ?auto_59006 ) ) ( not ( = ?auto_59005 ?auto_59007 ) ) ( not ( = ?auto_59006 ?auto_59007 ) ) ( not ( = ?auto_59006 ?auto_59009 ) ) ( not ( = ?auto_59007 ?auto_59009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59009 ?auto_59005 ?auto_59003 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59048 - OBJ
      ?auto_59049 - OBJ
      ?auto_59050 - OBJ
      ?auto_59051 - OBJ
      ?auto_59047 - LOCATION
    )
    :vars
    (
      ?auto_59054 - TRUCK
      ?auto_59053 - LOCATION
      ?auto_59052 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59054 ?auto_59053 ) ( IN-CITY ?auto_59053 ?auto_59052 ) ( IN-CITY ?auto_59047 ?auto_59052 ) ( not ( = ?auto_59047 ?auto_59053 ) ) ( OBJ-AT ?auto_59050 ?auto_59047 ) ( not ( = ?auto_59050 ?auto_59048 ) ) ( OBJ-AT ?auto_59048 ?auto_59053 ) ( OBJ-AT ?auto_59049 ?auto_59047 ) ( OBJ-AT ?auto_59051 ?auto_59047 ) ( not ( = ?auto_59048 ?auto_59049 ) ) ( not ( = ?auto_59048 ?auto_59051 ) ) ( not ( = ?auto_59049 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59051 ) ) ( not ( = ?auto_59050 ?auto_59051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59050 ?auto_59048 ?auto_59047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59072 - OBJ
      ?auto_59073 - OBJ
      ?auto_59074 - OBJ
      ?auto_59075 - OBJ
      ?auto_59071 - LOCATION
    )
    :vars
    (
      ?auto_59078 - TRUCK
      ?auto_59077 - LOCATION
      ?auto_59076 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59078 ?auto_59077 ) ( IN-CITY ?auto_59077 ?auto_59076 ) ( IN-CITY ?auto_59071 ?auto_59076 ) ( not ( = ?auto_59071 ?auto_59077 ) ) ( OBJ-AT ?auto_59073 ?auto_59071 ) ( not ( = ?auto_59073 ?auto_59072 ) ) ( OBJ-AT ?auto_59072 ?auto_59077 ) ( OBJ-AT ?auto_59074 ?auto_59071 ) ( OBJ-AT ?auto_59075 ?auto_59071 ) ( not ( = ?auto_59072 ?auto_59074 ) ) ( not ( = ?auto_59072 ?auto_59075 ) ) ( not ( = ?auto_59073 ?auto_59074 ) ) ( not ( = ?auto_59073 ?auto_59075 ) ) ( not ( = ?auto_59074 ?auto_59075 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59073 ?auto_59072 ?auto_59071 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59152 - OBJ
      ?auto_59153 - OBJ
      ?auto_59154 - OBJ
      ?auto_59155 - OBJ
      ?auto_59151 - LOCATION
    )
    :vars
    (
      ?auto_59159 - TRUCK
      ?auto_59158 - LOCATION
      ?auto_59156 - CITY
      ?auto_59157 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59159 ?auto_59158 ) ( IN-CITY ?auto_59158 ?auto_59156 ) ( IN-CITY ?auto_59151 ?auto_59156 ) ( not ( = ?auto_59151 ?auto_59158 ) ) ( OBJ-AT ?auto_59157 ?auto_59151 ) ( not ( = ?auto_59157 ?auto_59152 ) ) ( OBJ-AT ?auto_59152 ?auto_59158 ) ( OBJ-AT ?auto_59153 ?auto_59151 ) ( OBJ-AT ?auto_59154 ?auto_59151 ) ( OBJ-AT ?auto_59155 ?auto_59151 ) ( not ( = ?auto_59152 ?auto_59153 ) ) ( not ( = ?auto_59152 ?auto_59154 ) ) ( not ( = ?auto_59152 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59154 ) ) ( not ( = ?auto_59153 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59157 ) ) ( not ( = ?auto_59154 ?auto_59155 ) ) ( not ( = ?auto_59154 ?auto_59157 ) ) ( not ( = ?auto_59155 ?auto_59157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59157 ?auto_59152 ?auto_59151 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59314 - OBJ
      ?auto_59315 - OBJ
      ?auto_59316 - OBJ
      ?auto_59313 - LOCATION
    )
    :vars
    (
      ?auto_59319 - LOCATION
      ?auto_59317 - CITY
      ?auto_59318 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59319 ?auto_59317 ) ( IN-CITY ?auto_59313 ?auto_59317 ) ( not ( = ?auto_59313 ?auto_59319 ) ) ( OBJ-AT ?auto_59316 ?auto_59313 ) ( not ( = ?auto_59316 ?auto_59315 ) ) ( OBJ-AT ?auto_59315 ?auto_59319 ) ( TRUCK-AT ?auto_59318 ?auto_59313 ) ( OBJ-AT ?auto_59314 ?auto_59313 ) ( not ( = ?auto_59314 ?auto_59315 ) ) ( not ( = ?auto_59314 ?auto_59316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59316 ?auto_59315 ?auto_59313 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59336 - OBJ
      ?auto_59337 - OBJ
      ?auto_59338 - OBJ
      ?auto_59335 - LOCATION
    )
    :vars
    (
      ?auto_59342 - LOCATION
      ?auto_59340 - CITY
      ?auto_59339 - OBJ
      ?auto_59341 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59342 ?auto_59340 ) ( IN-CITY ?auto_59335 ?auto_59340 ) ( not ( = ?auto_59335 ?auto_59342 ) ) ( OBJ-AT ?auto_59339 ?auto_59335 ) ( not ( = ?auto_59339 ?auto_59338 ) ) ( OBJ-AT ?auto_59338 ?auto_59342 ) ( TRUCK-AT ?auto_59341 ?auto_59335 ) ( OBJ-AT ?auto_59336 ?auto_59335 ) ( OBJ-AT ?auto_59337 ?auto_59335 ) ( not ( = ?auto_59336 ?auto_59337 ) ) ( not ( = ?auto_59336 ?auto_59338 ) ) ( not ( = ?auto_59336 ?auto_59339 ) ) ( not ( = ?auto_59337 ?auto_59338 ) ) ( not ( = ?auto_59337 ?auto_59339 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59339 ?auto_59338 ?auto_59335 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59348 - OBJ
      ?auto_59349 - OBJ
      ?auto_59350 - OBJ
      ?auto_59347 - LOCATION
    )
    :vars
    (
      ?auto_59354 - LOCATION
      ?auto_59352 - CITY
      ?auto_59351 - OBJ
      ?auto_59353 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59354 ?auto_59352 ) ( IN-CITY ?auto_59347 ?auto_59352 ) ( not ( = ?auto_59347 ?auto_59354 ) ) ( OBJ-AT ?auto_59351 ?auto_59347 ) ( not ( = ?auto_59351 ?auto_59349 ) ) ( OBJ-AT ?auto_59349 ?auto_59354 ) ( TRUCK-AT ?auto_59353 ?auto_59347 ) ( OBJ-AT ?auto_59348 ?auto_59347 ) ( OBJ-AT ?auto_59350 ?auto_59347 ) ( not ( = ?auto_59348 ?auto_59349 ) ) ( not ( = ?auto_59348 ?auto_59350 ) ) ( not ( = ?auto_59348 ?auto_59351 ) ) ( not ( = ?auto_59349 ?auto_59350 ) ) ( not ( = ?auto_59350 ?auto_59351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59351 ?auto_59349 ?auto_59347 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59386 - OBJ
      ?auto_59387 - OBJ
      ?auto_59388 - OBJ
      ?auto_59385 - LOCATION
    )
    :vars
    (
      ?auto_59392 - LOCATION
      ?auto_59390 - CITY
      ?auto_59389 - OBJ
      ?auto_59391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59392 ?auto_59390 ) ( IN-CITY ?auto_59385 ?auto_59390 ) ( not ( = ?auto_59385 ?auto_59392 ) ) ( OBJ-AT ?auto_59389 ?auto_59385 ) ( not ( = ?auto_59389 ?auto_59386 ) ) ( OBJ-AT ?auto_59386 ?auto_59392 ) ( TRUCK-AT ?auto_59391 ?auto_59385 ) ( OBJ-AT ?auto_59387 ?auto_59385 ) ( OBJ-AT ?auto_59388 ?auto_59385 ) ( not ( = ?auto_59386 ?auto_59387 ) ) ( not ( = ?auto_59386 ?auto_59388 ) ) ( not ( = ?auto_59387 ?auto_59388 ) ) ( not ( = ?auto_59387 ?auto_59389 ) ) ( not ( = ?auto_59388 ?auto_59389 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59389 ?auto_59386 ?auto_59385 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59425 - OBJ
      ?auto_59426 - OBJ
      ?auto_59427 - OBJ
      ?auto_59428 - OBJ
      ?auto_59424 - LOCATION
    )
    :vars
    (
      ?auto_59431 - LOCATION
      ?auto_59429 - CITY
      ?auto_59430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59431 ?auto_59429 ) ( IN-CITY ?auto_59424 ?auto_59429 ) ( not ( = ?auto_59424 ?auto_59431 ) ) ( OBJ-AT ?auto_59427 ?auto_59424 ) ( not ( = ?auto_59427 ?auto_59428 ) ) ( OBJ-AT ?auto_59428 ?auto_59431 ) ( TRUCK-AT ?auto_59430 ?auto_59424 ) ( OBJ-AT ?auto_59425 ?auto_59424 ) ( OBJ-AT ?auto_59426 ?auto_59424 ) ( not ( = ?auto_59425 ?auto_59426 ) ) ( not ( = ?auto_59425 ?auto_59427 ) ) ( not ( = ?auto_59425 ?auto_59428 ) ) ( not ( = ?auto_59426 ?auto_59427 ) ) ( not ( = ?auto_59426 ?auto_59428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59427 ?auto_59428 ?auto_59424 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59433 - OBJ
      ?auto_59434 - OBJ
      ?auto_59435 - OBJ
      ?auto_59436 - OBJ
      ?auto_59432 - LOCATION
    )
    :vars
    (
      ?auto_59439 - LOCATION
      ?auto_59437 - CITY
      ?auto_59438 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59439 ?auto_59437 ) ( IN-CITY ?auto_59432 ?auto_59437 ) ( not ( = ?auto_59432 ?auto_59439 ) ) ( OBJ-AT ?auto_59433 ?auto_59432 ) ( not ( = ?auto_59433 ?auto_59436 ) ) ( OBJ-AT ?auto_59436 ?auto_59439 ) ( TRUCK-AT ?auto_59438 ?auto_59432 ) ( OBJ-AT ?auto_59434 ?auto_59432 ) ( OBJ-AT ?auto_59435 ?auto_59432 ) ( not ( = ?auto_59433 ?auto_59434 ) ) ( not ( = ?auto_59433 ?auto_59435 ) ) ( not ( = ?auto_59434 ?auto_59435 ) ) ( not ( = ?auto_59434 ?auto_59436 ) ) ( not ( = ?auto_59435 ?auto_59436 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59433 ?auto_59436 ?auto_59432 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59441 - OBJ
      ?auto_59442 - OBJ
      ?auto_59443 - OBJ
      ?auto_59444 - OBJ
      ?auto_59440 - LOCATION
    )
    :vars
    (
      ?auto_59447 - LOCATION
      ?auto_59445 - CITY
      ?auto_59446 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59447 ?auto_59445 ) ( IN-CITY ?auto_59440 ?auto_59445 ) ( not ( = ?auto_59440 ?auto_59447 ) ) ( OBJ-AT ?auto_59444 ?auto_59440 ) ( not ( = ?auto_59444 ?auto_59443 ) ) ( OBJ-AT ?auto_59443 ?auto_59447 ) ( TRUCK-AT ?auto_59446 ?auto_59440 ) ( OBJ-AT ?auto_59441 ?auto_59440 ) ( OBJ-AT ?auto_59442 ?auto_59440 ) ( not ( = ?auto_59441 ?auto_59442 ) ) ( not ( = ?auto_59441 ?auto_59443 ) ) ( not ( = ?auto_59441 ?auto_59444 ) ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( not ( = ?auto_59442 ?auto_59444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59444 ?auto_59443 ?auto_59440 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59505 - OBJ
      ?auto_59506 - OBJ
      ?auto_59507 - OBJ
      ?auto_59508 - OBJ
      ?auto_59504 - LOCATION
    )
    :vars
    (
      ?auto_59511 - LOCATION
      ?auto_59509 - CITY
      ?auto_59510 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59511 ?auto_59509 ) ( IN-CITY ?auto_59504 ?auto_59509 ) ( not ( = ?auto_59504 ?auto_59511 ) ) ( OBJ-AT ?auto_59505 ?auto_59504 ) ( not ( = ?auto_59505 ?auto_59506 ) ) ( OBJ-AT ?auto_59506 ?auto_59511 ) ( TRUCK-AT ?auto_59510 ?auto_59504 ) ( OBJ-AT ?auto_59507 ?auto_59504 ) ( OBJ-AT ?auto_59508 ?auto_59504 ) ( not ( = ?auto_59505 ?auto_59507 ) ) ( not ( = ?auto_59505 ?auto_59508 ) ) ( not ( = ?auto_59506 ?auto_59507 ) ) ( not ( = ?auto_59506 ?auto_59508 ) ) ( not ( = ?auto_59507 ?auto_59508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59505 ?auto_59506 ?auto_59504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59529 - OBJ
      ?auto_59530 - OBJ
      ?auto_59531 - OBJ
      ?auto_59532 - OBJ
      ?auto_59528 - LOCATION
    )
    :vars
    (
      ?auto_59535 - LOCATION
      ?auto_59533 - CITY
      ?auto_59534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59535 ?auto_59533 ) ( IN-CITY ?auto_59528 ?auto_59533 ) ( not ( = ?auto_59528 ?auto_59535 ) ) ( OBJ-AT ?auto_59532 ?auto_59528 ) ( not ( = ?auto_59532 ?auto_59530 ) ) ( OBJ-AT ?auto_59530 ?auto_59535 ) ( TRUCK-AT ?auto_59534 ?auto_59528 ) ( OBJ-AT ?auto_59529 ?auto_59528 ) ( OBJ-AT ?auto_59531 ?auto_59528 ) ( not ( = ?auto_59529 ?auto_59530 ) ) ( not ( = ?auto_59529 ?auto_59531 ) ) ( not ( = ?auto_59529 ?auto_59532 ) ) ( not ( = ?auto_59530 ?auto_59531 ) ) ( not ( = ?auto_59531 ?auto_59532 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59532 ?auto_59530 ?auto_59528 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59593 - OBJ
      ?auto_59594 - OBJ
      ?auto_59595 - OBJ
      ?auto_59596 - OBJ
      ?auto_59592 - LOCATION
    )
    :vars
    (
      ?auto_59599 - LOCATION
      ?auto_59597 - CITY
      ?auto_59598 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59599 ?auto_59597 ) ( IN-CITY ?auto_59592 ?auto_59597 ) ( not ( = ?auto_59592 ?auto_59599 ) ) ( OBJ-AT ?auto_59594 ?auto_59592 ) ( not ( = ?auto_59594 ?auto_59595 ) ) ( OBJ-AT ?auto_59595 ?auto_59599 ) ( TRUCK-AT ?auto_59598 ?auto_59592 ) ( OBJ-AT ?auto_59593 ?auto_59592 ) ( OBJ-AT ?auto_59596 ?auto_59592 ) ( not ( = ?auto_59593 ?auto_59594 ) ) ( not ( = ?auto_59593 ?auto_59595 ) ) ( not ( = ?auto_59593 ?auto_59596 ) ) ( not ( = ?auto_59594 ?auto_59596 ) ) ( not ( = ?auto_59595 ?auto_59596 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59594 ?auto_59595 ?auto_59592 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59625 - OBJ
      ?auto_59626 - OBJ
      ?auto_59627 - OBJ
      ?auto_59628 - OBJ
      ?auto_59624 - LOCATION
    )
    :vars
    (
      ?auto_59632 - LOCATION
      ?auto_59630 - CITY
      ?auto_59629 - OBJ
      ?auto_59631 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59632 ?auto_59630 ) ( IN-CITY ?auto_59624 ?auto_59630 ) ( not ( = ?auto_59624 ?auto_59632 ) ) ( OBJ-AT ?auto_59629 ?auto_59624 ) ( not ( = ?auto_59629 ?auto_59628 ) ) ( OBJ-AT ?auto_59628 ?auto_59632 ) ( TRUCK-AT ?auto_59631 ?auto_59624 ) ( OBJ-AT ?auto_59625 ?auto_59624 ) ( OBJ-AT ?auto_59626 ?auto_59624 ) ( OBJ-AT ?auto_59627 ?auto_59624 ) ( not ( = ?auto_59625 ?auto_59626 ) ) ( not ( = ?auto_59625 ?auto_59627 ) ) ( not ( = ?auto_59625 ?auto_59628 ) ) ( not ( = ?auto_59625 ?auto_59629 ) ) ( not ( = ?auto_59626 ?auto_59627 ) ) ( not ( = ?auto_59626 ?auto_59628 ) ) ( not ( = ?auto_59626 ?auto_59629 ) ) ( not ( = ?auto_59627 ?auto_59628 ) ) ( not ( = ?auto_59627 ?auto_59629 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59629 ?auto_59628 ?auto_59624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59642 - OBJ
      ?auto_59643 - OBJ
      ?auto_59644 - OBJ
      ?auto_59645 - OBJ
      ?auto_59641 - LOCATION
    )
    :vars
    (
      ?auto_59649 - LOCATION
      ?auto_59647 - CITY
      ?auto_59646 - OBJ
      ?auto_59648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59649 ?auto_59647 ) ( IN-CITY ?auto_59641 ?auto_59647 ) ( not ( = ?auto_59641 ?auto_59649 ) ) ( OBJ-AT ?auto_59646 ?auto_59641 ) ( not ( = ?auto_59646 ?auto_59644 ) ) ( OBJ-AT ?auto_59644 ?auto_59649 ) ( TRUCK-AT ?auto_59648 ?auto_59641 ) ( OBJ-AT ?auto_59642 ?auto_59641 ) ( OBJ-AT ?auto_59643 ?auto_59641 ) ( OBJ-AT ?auto_59645 ?auto_59641 ) ( not ( = ?auto_59642 ?auto_59643 ) ) ( not ( = ?auto_59642 ?auto_59644 ) ) ( not ( = ?auto_59642 ?auto_59645 ) ) ( not ( = ?auto_59642 ?auto_59646 ) ) ( not ( = ?auto_59643 ?auto_59644 ) ) ( not ( = ?auto_59643 ?auto_59645 ) ) ( not ( = ?auto_59643 ?auto_59646 ) ) ( not ( = ?auto_59644 ?auto_59645 ) ) ( not ( = ?auto_59645 ?auto_59646 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59646 ?auto_59644 ?auto_59641 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59692 - OBJ
      ?auto_59693 - OBJ
      ?auto_59694 - OBJ
      ?auto_59695 - OBJ
      ?auto_59691 - LOCATION
    )
    :vars
    (
      ?auto_59699 - LOCATION
      ?auto_59697 - CITY
      ?auto_59696 - OBJ
      ?auto_59698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59699 ?auto_59697 ) ( IN-CITY ?auto_59691 ?auto_59697 ) ( not ( = ?auto_59691 ?auto_59699 ) ) ( OBJ-AT ?auto_59696 ?auto_59691 ) ( not ( = ?auto_59696 ?auto_59693 ) ) ( OBJ-AT ?auto_59693 ?auto_59699 ) ( TRUCK-AT ?auto_59698 ?auto_59691 ) ( OBJ-AT ?auto_59692 ?auto_59691 ) ( OBJ-AT ?auto_59694 ?auto_59691 ) ( OBJ-AT ?auto_59695 ?auto_59691 ) ( not ( = ?auto_59692 ?auto_59693 ) ) ( not ( = ?auto_59692 ?auto_59694 ) ) ( not ( = ?auto_59692 ?auto_59695 ) ) ( not ( = ?auto_59692 ?auto_59696 ) ) ( not ( = ?auto_59693 ?auto_59694 ) ) ( not ( = ?auto_59693 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59696 ) ) ( not ( = ?auto_59695 ?auto_59696 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59696 ?auto_59693 ?auto_59691 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59736 - OBJ
      ?auto_59737 - OBJ
      ?auto_59738 - OBJ
      ?auto_59739 - OBJ
      ?auto_59735 - LOCATION
    )
    :vars
    (
      ?auto_59742 - LOCATION
      ?auto_59740 - CITY
      ?auto_59741 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59742 ?auto_59740 ) ( IN-CITY ?auto_59735 ?auto_59740 ) ( not ( = ?auto_59735 ?auto_59742 ) ) ( OBJ-AT ?auto_59738 ?auto_59735 ) ( not ( = ?auto_59738 ?auto_59736 ) ) ( OBJ-AT ?auto_59736 ?auto_59742 ) ( TRUCK-AT ?auto_59741 ?auto_59735 ) ( OBJ-AT ?auto_59737 ?auto_59735 ) ( OBJ-AT ?auto_59739 ?auto_59735 ) ( not ( = ?auto_59736 ?auto_59737 ) ) ( not ( = ?auto_59736 ?auto_59739 ) ) ( not ( = ?auto_59737 ?auto_59738 ) ) ( not ( = ?auto_59737 ?auto_59739 ) ) ( not ( = ?auto_59738 ?auto_59739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59738 ?auto_59736 ?auto_59735 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59760 - OBJ
      ?auto_59761 - OBJ
      ?auto_59762 - OBJ
      ?auto_59763 - OBJ
      ?auto_59759 - LOCATION
    )
    :vars
    (
      ?auto_59766 - LOCATION
      ?auto_59764 - CITY
      ?auto_59765 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59766 ?auto_59764 ) ( IN-CITY ?auto_59759 ?auto_59764 ) ( not ( = ?auto_59759 ?auto_59766 ) ) ( OBJ-AT ?auto_59763 ?auto_59759 ) ( not ( = ?auto_59763 ?auto_59760 ) ) ( OBJ-AT ?auto_59760 ?auto_59766 ) ( TRUCK-AT ?auto_59765 ?auto_59759 ) ( OBJ-AT ?auto_59761 ?auto_59759 ) ( OBJ-AT ?auto_59762 ?auto_59759 ) ( not ( = ?auto_59760 ?auto_59761 ) ) ( not ( = ?auto_59760 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59763 ) ) ( not ( = ?auto_59762 ?auto_59763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59763 ?auto_59760 ?auto_59759 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59840 - OBJ
      ?auto_59841 - OBJ
      ?auto_59842 - OBJ
      ?auto_59843 - OBJ
      ?auto_59839 - LOCATION
    )
    :vars
    (
      ?auto_59847 - LOCATION
      ?auto_59845 - CITY
      ?auto_59844 - OBJ
      ?auto_59846 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59847 ?auto_59845 ) ( IN-CITY ?auto_59839 ?auto_59845 ) ( not ( = ?auto_59839 ?auto_59847 ) ) ( OBJ-AT ?auto_59844 ?auto_59839 ) ( not ( = ?auto_59844 ?auto_59840 ) ) ( OBJ-AT ?auto_59840 ?auto_59847 ) ( TRUCK-AT ?auto_59846 ?auto_59839 ) ( OBJ-AT ?auto_59841 ?auto_59839 ) ( OBJ-AT ?auto_59842 ?auto_59839 ) ( OBJ-AT ?auto_59843 ?auto_59839 ) ( not ( = ?auto_59840 ?auto_59841 ) ) ( not ( = ?auto_59840 ?auto_59842 ) ) ( not ( = ?auto_59840 ?auto_59843 ) ) ( not ( = ?auto_59841 ?auto_59842 ) ) ( not ( = ?auto_59841 ?auto_59843 ) ) ( not ( = ?auto_59841 ?auto_59844 ) ) ( not ( = ?auto_59842 ?auto_59843 ) ) ( not ( = ?auto_59842 ?auto_59844 ) ) ( not ( = ?auto_59843 ?auto_59844 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59844 ?auto_59840 ?auto_59839 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59989 - OBJ
      ?auto_59990 - OBJ
      ?auto_59991 - OBJ
      ?auto_59988 - LOCATION
    )
    :vars
    (
      ?auto_59994 - LOCATION
      ?auto_59993 - CITY
      ?auto_59992 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59994 ?auto_59993 ) ( IN-CITY ?auto_59988 ?auto_59993 ) ( not ( = ?auto_59988 ?auto_59994 ) ) ( OBJ-AT ?auto_59989 ?auto_59988 ) ( not ( = ?auto_59989 ?auto_59991 ) ) ( OBJ-AT ?auto_59991 ?auto_59994 ) ( TRUCK-AT ?auto_59992 ?auto_59988 ) ( OBJ-AT ?auto_59990 ?auto_59988 ) ( not ( = ?auto_59989 ?auto_59990 ) ) ( not ( = ?auto_59990 ?auto_59991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59989 ?auto_59991 ?auto_59988 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60664 - OBJ
      ?auto_60663 - LOCATION
    )
    :vars
    (
      ?auto_60667 - LOCATION
      ?auto_60666 - CITY
      ?auto_60668 - OBJ
      ?auto_60665 - TRUCK
      ?auto_60669 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60667 ?auto_60666 ) ( IN-CITY ?auto_60663 ?auto_60666 ) ( not ( = ?auto_60663 ?auto_60667 ) ) ( OBJ-AT ?auto_60668 ?auto_60663 ) ( not ( = ?auto_60668 ?auto_60664 ) ) ( OBJ-AT ?auto_60664 ?auto_60667 ) ( TRUCK-AT ?auto_60665 ?auto_60669 ) ( IN-CITY ?auto_60669 ?auto_60666 ) ( not ( = ?auto_60663 ?auto_60669 ) ) ( not ( = ?auto_60667 ?auto_60669 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60665 ?auto_60669 ?auto_60663 ?auto_60666 )
      ( DELIVER-2PKG ?auto_60668 ?auto_60664 ?auto_60663 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60671 - OBJ
      ?auto_60672 - OBJ
      ?auto_60670 - LOCATION
    )
    :vars
    (
      ?auto_60673 - LOCATION
      ?auto_60675 - CITY
      ?auto_60674 - TRUCK
      ?auto_60676 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60673 ?auto_60675 ) ( IN-CITY ?auto_60670 ?auto_60675 ) ( not ( = ?auto_60670 ?auto_60673 ) ) ( OBJ-AT ?auto_60671 ?auto_60670 ) ( not ( = ?auto_60671 ?auto_60672 ) ) ( OBJ-AT ?auto_60672 ?auto_60673 ) ( TRUCK-AT ?auto_60674 ?auto_60676 ) ( IN-CITY ?auto_60676 ?auto_60675 ) ( not ( = ?auto_60670 ?auto_60676 ) ) ( not ( = ?auto_60673 ?auto_60676 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60672 ?auto_60670 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_60686 - OBJ
      ?auto_60687 - OBJ
      ?auto_60685 - LOCATION
    )
    :vars
    (
      ?auto_60689 - LOCATION
      ?auto_60688 - CITY
      ?auto_60690 - TRUCK
      ?auto_60691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60689 ?auto_60688 ) ( IN-CITY ?auto_60685 ?auto_60688 ) ( not ( = ?auto_60685 ?auto_60689 ) ) ( OBJ-AT ?auto_60687 ?auto_60685 ) ( not ( = ?auto_60687 ?auto_60686 ) ) ( OBJ-AT ?auto_60686 ?auto_60689 ) ( TRUCK-AT ?auto_60690 ?auto_60691 ) ( IN-CITY ?auto_60691 ?auto_60688 ) ( not ( = ?auto_60685 ?auto_60691 ) ) ( not ( = ?auto_60689 ?auto_60691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60687 ?auto_60686 ?auto_60685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60709 - OBJ
      ?auto_60710 - OBJ
      ?auto_60711 - OBJ
      ?auto_60708 - LOCATION
    )
    :vars
    (
      ?auto_60713 - LOCATION
      ?auto_60712 - CITY
      ?auto_60714 - TRUCK
      ?auto_60715 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60713 ?auto_60712 ) ( IN-CITY ?auto_60708 ?auto_60712 ) ( not ( = ?auto_60708 ?auto_60713 ) ) ( OBJ-AT ?auto_60709 ?auto_60708 ) ( not ( = ?auto_60709 ?auto_60711 ) ) ( OBJ-AT ?auto_60711 ?auto_60713 ) ( TRUCK-AT ?auto_60714 ?auto_60715 ) ( IN-CITY ?auto_60715 ?auto_60712 ) ( not ( = ?auto_60708 ?auto_60715 ) ) ( not ( = ?auto_60713 ?auto_60715 ) ) ( OBJ-AT ?auto_60710 ?auto_60708 ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60710 ?auto_60711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60709 ?auto_60711 ?auto_60708 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60725 - OBJ
      ?auto_60726 - OBJ
      ?auto_60727 - OBJ
      ?auto_60724 - LOCATION
    )
    :vars
    (
      ?auto_60729 - LOCATION
      ?auto_60728 - CITY
      ?auto_60730 - TRUCK
      ?auto_60731 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60729 ?auto_60728 ) ( IN-CITY ?auto_60724 ?auto_60728 ) ( not ( = ?auto_60724 ?auto_60729 ) ) ( OBJ-AT ?auto_60725 ?auto_60724 ) ( not ( = ?auto_60725 ?auto_60726 ) ) ( OBJ-AT ?auto_60726 ?auto_60729 ) ( TRUCK-AT ?auto_60730 ?auto_60731 ) ( IN-CITY ?auto_60731 ?auto_60728 ) ( not ( = ?auto_60724 ?auto_60731 ) ) ( not ( = ?auto_60729 ?auto_60731 ) ) ( OBJ-AT ?auto_60727 ?auto_60724 ) ( not ( = ?auto_60725 ?auto_60727 ) ) ( not ( = ?auto_60726 ?auto_60727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60725 ?auto_60726 ?auto_60724 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_60792 - OBJ
      ?auto_60793 - OBJ
      ?auto_60794 - OBJ
      ?auto_60791 - LOCATION
    )
    :vars
    (
      ?auto_60796 - LOCATION
      ?auto_60795 - CITY
      ?auto_60797 - TRUCK
      ?auto_60798 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60796 ?auto_60795 ) ( IN-CITY ?auto_60791 ?auto_60795 ) ( not ( = ?auto_60791 ?auto_60796 ) ) ( OBJ-AT ?auto_60794 ?auto_60791 ) ( not ( = ?auto_60794 ?auto_60792 ) ) ( OBJ-AT ?auto_60792 ?auto_60796 ) ( TRUCK-AT ?auto_60797 ?auto_60798 ) ( IN-CITY ?auto_60798 ?auto_60795 ) ( not ( = ?auto_60791 ?auto_60798 ) ) ( not ( = ?auto_60796 ?auto_60798 ) ) ( OBJ-AT ?auto_60793 ?auto_60791 ) ( not ( = ?auto_60792 ?auto_60793 ) ) ( not ( = ?auto_60793 ?auto_60794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60794 ?auto_60792 ?auto_60791 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60868 - OBJ
      ?auto_60869 - OBJ
      ?auto_60870 - OBJ
      ?auto_60871 - OBJ
      ?auto_60867 - LOCATION
    )
    :vars
    (
      ?auto_60873 - LOCATION
      ?auto_60872 - CITY
      ?auto_60874 - TRUCK
      ?auto_60875 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60873 ?auto_60872 ) ( IN-CITY ?auto_60867 ?auto_60872 ) ( not ( = ?auto_60867 ?auto_60873 ) ) ( OBJ-AT ?auto_60868 ?auto_60867 ) ( not ( = ?auto_60868 ?auto_60871 ) ) ( OBJ-AT ?auto_60871 ?auto_60873 ) ( TRUCK-AT ?auto_60874 ?auto_60875 ) ( IN-CITY ?auto_60875 ?auto_60872 ) ( not ( = ?auto_60867 ?auto_60875 ) ) ( not ( = ?auto_60873 ?auto_60875 ) ) ( OBJ-AT ?auto_60869 ?auto_60867 ) ( OBJ-AT ?auto_60870 ?auto_60867 ) ( not ( = ?auto_60868 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60870 ) ) ( not ( = ?auto_60869 ?auto_60870 ) ) ( not ( = ?auto_60869 ?auto_60871 ) ) ( not ( = ?auto_60870 ?auto_60871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60868 ?auto_60871 ?auto_60867 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60886 - OBJ
      ?auto_60887 - OBJ
      ?auto_60888 - OBJ
      ?auto_60889 - OBJ
      ?auto_60885 - LOCATION
    )
    :vars
    (
      ?auto_60891 - LOCATION
      ?auto_60890 - CITY
      ?auto_60892 - TRUCK
      ?auto_60893 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60891 ?auto_60890 ) ( IN-CITY ?auto_60885 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60891 ) ) ( OBJ-AT ?auto_60889 ?auto_60885 ) ( not ( = ?auto_60889 ?auto_60888 ) ) ( OBJ-AT ?auto_60888 ?auto_60891 ) ( TRUCK-AT ?auto_60892 ?auto_60893 ) ( IN-CITY ?auto_60893 ?auto_60890 ) ( not ( = ?auto_60885 ?auto_60893 ) ) ( not ( = ?auto_60891 ?auto_60893 ) ) ( OBJ-AT ?auto_60886 ?auto_60885 ) ( OBJ-AT ?auto_60887 ?auto_60885 ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60886 ?auto_60888 ) ) ( not ( = ?auto_60886 ?auto_60889 ) ) ( not ( = ?auto_60887 ?auto_60888 ) ) ( not ( = ?auto_60887 ?auto_60889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60889 ?auto_60888 ?auto_60885 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_60958 - OBJ
      ?auto_60959 - OBJ
      ?auto_60960 - OBJ
      ?auto_60961 - OBJ
      ?auto_60957 - LOCATION
    )
    :vars
    (
      ?auto_60963 - LOCATION
      ?auto_60962 - CITY
      ?auto_60964 - TRUCK
      ?auto_60965 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60963 ?auto_60962 ) ( IN-CITY ?auto_60957 ?auto_60962 ) ( not ( = ?auto_60957 ?auto_60963 ) ) ( OBJ-AT ?auto_60958 ?auto_60957 ) ( not ( = ?auto_60958 ?auto_60959 ) ) ( OBJ-AT ?auto_60959 ?auto_60963 ) ( TRUCK-AT ?auto_60964 ?auto_60965 ) ( IN-CITY ?auto_60965 ?auto_60962 ) ( not ( = ?auto_60957 ?auto_60965 ) ) ( not ( = ?auto_60963 ?auto_60965 ) ) ( OBJ-AT ?auto_60960 ?auto_60957 ) ( OBJ-AT ?auto_60961 ?auto_60957 ) ( not ( = ?auto_60958 ?auto_60960 ) ) ( not ( = ?auto_60958 ?auto_60961 ) ) ( not ( = ?auto_60959 ?auto_60960 ) ) ( not ( = ?auto_60959 ?auto_60961 ) ) ( not ( = ?auto_60960 ?auto_60961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60958 ?auto_60959 ?auto_60957 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61217 - OBJ
      ?auto_61218 - OBJ
      ?auto_61219 - OBJ
      ?auto_61220 - OBJ
      ?auto_61216 - LOCATION
    )
    :vars
    (
      ?auto_61222 - LOCATION
      ?auto_61221 - CITY
      ?auto_61223 - TRUCK
      ?auto_61224 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61222 ?auto_61221 ) ( IN-CITY ?auto_61216 ?auto_61221 ) ( not ( = ?auto_61216 ?auto_61222 ) ) ( OBJ-AT ?auto_61219 ?auto_61216 ) ( not ( = ?auto_61219 ?auto_61217 ) ) ( OBJ-AT ?auto_61217 ?auto_61222 ) ( TRUCK-AT ?auto_61223 ?auto_61224 ) ( IN-CITY ?auto_61224 ?auto_61221 ) ( not ( = ?auto_61216 ?auto_61224 ) ) ( not ( = ?auto_61222 ?auto_61224 ) ) ( OBJ-AT ?auto_61218 ?auto_61216 ) ( OBJ-AT ?auto_61220 ?auto_61216 ) ( not ( = ?auto_61217 ?auto_61218 ) ) ( not ( = ?auto_61217 ?auto_61220 ) ) ( not ( = ?auto_61218 ?auto_61219 ) ) ( not ( = ?auto_61218 ?auto_61220 ) ) ( not ( = ?auto_61219 ?auto_61220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61219 ?auto_61217 ?auto_61216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61516 - OBJ
      ?auto_61517 - OBJ
      ?auto_61518 - OBJ
      ?auto_61515 - LOCATION
    )
    :vars
    (
      ?auto_61521 - LOCATION
      ?auto_61519 - CITY
      ?auto_61522 - TRUCK
      ?auto_61520 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61521 ?auto_61519 ) ( IN-CITY ?auto_61515 ?auto_61519 ) ( not ( = ?auto_61515 ?auto_61521 ) ) ( OBJ-AT ?auto_61518 ?auto_61515 ) ( not ( = ?auto_61518 ?auto_61517 ) ) ( OBJ-AT ?auto_61517 ?auto_61521 ) ( TRUCK-AT ?auto_61522 ?auto_61520 ) ( IN-CITY ?auto_61520 ?auto_61519 ) ( not ( = ?auto_61515 ?auto_61520 ) ) ( not ( = ?auto_61521 ?auto_61520 ) ) ( OBJ-AT ?auto_61516 ?auto_61515 ) ( not ( = ?auto_61516 ?auto_61517 ) ) ( not ( = ?auto_61516 ?auto_61518 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61518 ?auto_61517 ?auto_61515 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_61749 - OBJ
      ?auto_61750 - OBJ
      ?auto_61751 - OBJ
      ?auto_61752 - OBJ
      ?auto_61748 - LOCATION
    )
    :vars
    (
      ?auto_61755 - LOCATION
      ?auto_61753 - CITY
      ?auto_61756 - TRUCK
      ?auto_61754 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61755 ?auto_61753 ) ( IN-CITY ?auto_61748 ?auto_61753 ) ( not ( = ?auto_61748 ?auto_61755 ) ) ( OBJ-AT ?auto_61751 ?auto_61748 ) ( not ( = ?auto_61751 ?auto_61750 ) ) ( OBJ-AT ?auto_61750 ?auto_61755 ) ( TRUCK-AT ?auto_61756 ?auto_61754 ) ( IN-CITY ?auto_61754 ?auto_61753 ) ( not ( = ?auto_61748 ?auto_61754 ) ) ( not ( = ?auto_61755 ?auto_61754 ) ) ( OBJ-AT ?auto_61749 ?auto_61748 ) ( OBJ-AT ?auto_61752 ?auto_61748 ) ( not ( = ?auto_61749 ?auto_61750 ) ) ( not ( = ?auto_61749 ?auto_61751 ) ) ( not ( = ?auto_61749 ?auto_61752 ) ) ( not ( = ?auto_61750 ?auto_61752 ) ) ( not ( = ?auto_61751 ?auto_61752 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61751 ?auto_61750 ?auto_61748 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_62361 - OBJ
      ?auto_62362 - OBJ
      ?auto_62363 - OBJ
      ?auto_62360 - LOCATION
    )
    :vars
    (
      ?auto_62366 - LOCATION
      ?auto_62365 - CITY
      ?auto_62364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_62366 ?auto_62365 ) ( IN-CITY ?auto_62360 ?auto_62365 ) ( not ( = ?auto_62360 ?auto_62366 ) ) ( OBJ-AT ?auto_62362 ?auto_62360 ) ( not ( = ?auto_62362 ?auto_62361 ) ) ( OBJ-AT ?auto_62361 ?auto_62366 ) ( TRUCK-AT ?auto_62364 ?auto_62360 ) ( OBJ-AT ?auto_62363 ?auto_62360 ) ( not ( = ?auto_62361 ?auto_62363 ) ) ( not ( = ?auto_62362 ?auto_62363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62362 ?auto_62361 ?auto_62360 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63667 - OBJ
      ?auto_63666 - LOCATION
    )
    :vars
    (
      ?auto_63671 - LOCATION
      ?auto_63668 - CITY
      ?auto_63669 - OBJ
      ?auto_63670 - TRUCK
      ?auto_63672 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63671 ?auto_63668 ) ( IN-CITY ?auto_63666 ?auto_63668 ) ( not ( = ?auto_63666 ?auto_63671 ) ) ( not ( = ?auto_63669 ?auto_63667 ) ) ( OBJ-AT ?auto_63667 ?auto_63671 ) ( IN-TRUCK ?auto_63669 ?auto_63670 ) ( TRUCK-AT ?auto_63670 ?auto_63672 ) ( IN-CITY ?auto_63672 ?auto_63668 ) ( not ( = ?auto_63666 ?auto_63672 ) ) ( not ( = ?auto_63671 ?auto_63672 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63670 ?auto_63672 ?auto_63666 ?auto_63668 )
      ( DELIVER-2PKG ?auto_63669 ?auto_63667 ?auto_63666 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63674 - OBJ
      ?auto_63675 - OBJ
      ?auto_63673 - LOCATION
    )
    :vars
    (
      ?auto_63676 - LOCATION
      ?auto_63679 - CITY
      ?auto_63677 - TRUCK
      ?auto_63678 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63676 ?auto_63679 ) ( IN-CITY ?auto_63673 ?auto_63679 ) ( not ( = ?auto_63673 ?auto_63676 ) ) ( not ( = ?auto_63674 ?auto_63675 ) ) ( OBJ-AT ?auto_63675 ?auto_63676 ) ( IN-TRUCK ?auto_63674 ?auto_63677 ) ( TRUCK-AT ?auto_63677 ?auto_63678 ) ( IN-CITY ?auto_63678 ?auto_63679 ) ( not ( = ?auto_63673 ?auto_63678 ) ) ( not ( = ?auto_63676 ?auto_63678 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63675 ?auto_63673 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_63689 - OBJ
      ?auto_63690 - OBJ
      ?auto_63688 - LOCATION
    )
    :vars
    (
      ?auto_63694 - LOCATION
      ?auto_63691 - CITY
      ?auto_63693 - TRUCK
      ?auto_63692 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63694 ?auto_63691 ) ( IN-CITY ?auto_63688 ?auto_63691 ) ( not ( = ?auto_63688 ?auto_63694 ) ) ( not ( = ?auto_63690 ?auto_63689 ) ) ( OBJ-AT ?auto_63689 ?auto_63694 ) ( IN-TRUCK ?auto_63690 ?auto_63693 ) ( TRUCK-AT ?auto_63693 ?auto_63692 ) ( IN-CITY ?auto_63692 ?auto_63691 ) ( not ( = ?auto_63688 ?auto_63692 ) ) ( not ( = ?auto_63694 ?auto_63692 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63690 ?auto_63689 ?auto_63688 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_64471 - OBJ
      ?auto_64470 - LOCATION
    )
    :vars
    (
      ?auto_64476 - LOCATION
      ?auto_64472 - CITY
      ?auto_64473 - OBJ
      ?auto_64475 - TRUCK
      ?auto_64474 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64476 ?auto_64472 ) ( IN-CITY ?auto_64470 ?auto_64472 ) ( not ( = ?auto_64470 ?auto_64476 ) ) ( not ( = ?auto_64473 ?auto_64471 ) ) ( OBJ-AT ?auto_64471 ?auto_64476 ) ( TRUCK-AT ?auto_64475 ?auto_64474 ) ( IN-CITY ?auto_64474 ?auto_64472 ) ( not ( = ?auto_64470 ?auto_64474 ) ) ( not ( = ?auto_64476 ?auto_64474 ) ) ( OBJ-AT ?auto_64473 ?auto_64474 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_64473 ?auto_64475 ?auto_64474 )
      ( DELIVER-2PKG ?auto_64473 ?auto_64471 ?auto_64470 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64478 - OBJ
      ?auto_64479 - OBJ
      ?auto_64477 - LOCATION
    )
    :vars
    (
      ?auto_64483 - LOCATION
      ?auto_64480 - CITY
      ?auto_64482 - TRUCK
      ?auto_64481 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64483 ?auto_64480 ) ( IN-CITY ?auto_64477 ?auto_64480 ) ( not ( = ?auto_64477 ?auto_64483 ) ) ( not ( = ?auto_64478 ?auto_64479 ) ) ( OBJ-AT ?auto_64479 ?auto_64483 ) ( TRUCK-AT ?auto_64482 ?auto_64481 ) ( IN-CITY ?auto_64481 ?auto_64480 ) ( not ( = ?auto_64477 ?auto_64481 ) ) ( not ( = ?auto_64483 ?auto_64481 ) ) ( OBJ-AT ?auto_64478 ?auto_64481 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64479 ?auto_64477 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_64488 - OBJ
      ?auto_64489 - OBJ
      ?auto_64487 - LOCATION
    )
    :vars
    (
      ?auto_64493 - LOCATION
      ?auto_64490 - CITY
      ?auto_64492 - TRUCK
      ?auto_64491 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64493 ?auto_64490 ) ( IN-CITY ?auto_64487 ?auto_64490 ) ( not ( = ?auto_64487 ?auto_64493 ) ) ( not ( = ?auto_64489 ?auto_64488 ) ) ( OBJ-AT ?auto_64488 ?auto_64493 ) ( TRUCK-AT ?auto_64492 ?auto_64491 ) ( IN-CITY ?auto_64491 ?auto_64490 ) ( not ( = ?auto_64487 ?auto_64491 ) ) ( not ( = ?auto_64493 ?auto_64491 ) ) ( OBJ-AT ?auto_64489 ?auto_64491 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64489 ?auto_64488 ?auto_64487 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_69900 - OBJ
      ?auto_69901 - OBJ
      ?auto_69902 - OBJ
      ?auto_69899 - LOCATION
    )
    :vars
    (
      ?auto_69905 - TRUCK
      ?auto_69904 - LOCATION
      ?auto_69903 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_69905 ?auto_69904 ) ( IN-CITY ?auto_69904 ?auto_69903 ) ( IN-CITY ?auto_69899 ?auto_69903 ) ( not ( = ?auto_69899 ?auto_69904 ) ) ( OBJ-AT ?auto_69901 ?auto_69899 ) ( not ( = ?auto_69901 ?auto_69902 ) ) ( OBJ-AT ?auto_69902 ?auto_69904 ) ( OBJ-AT ?auto_69900 ?auto_69899 ) ( not ( = ?auto_69900 ?auto_69901 ) ) ( not ( = ?auto_69900 ?auto_69902 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_69901 ?auto_69902 ?auto_69899 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75022 - OBJ
      ?auto_75023 - OBJ
      ?auto_75024 - OBJ
      ?auto_75021 - LOCATION
    )
    :vars
    (
      ?auto_75025 - LOCATION
      ?auto_75027 - CITY
      ?auto_75026 - OBJ
      ?auto_75029 - TRUCK
      ?auto_75028 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75025 ?auto_75027 ) ( IN-CITY ?auto_75021 ?auto_75027 ) ( not ( = ?auto_75021 ?auto_75025 ) ) ( OBJ-AT ?auto_75026 ?auto_75021 ) ( not ( = ?auto_75026 ?auto_75024 ) ) ( OBJ-AT ?auto_75024 ?auto_75025 ) ( TRUCK-AT ?auto_75029 ?auto_75028 ) ( IN-CITY ?auto_75028 ?auto_75027 ) ( not ( = ?auto_75021 ?auto_75028 ) ) ( not ( = ?auto_75025 ?auto_75028 ) ) ( OBJ-AT ?auto_75022 ?auto_75021 ) ( OBJ-AT ?auto_75023 ?auto_75021 ) ( not ( = ?auto_75022 ?auto_75023 ) ) ( not ( = ?auto_75022 ?auto_75024 ) ) ( not ( = ?auto_75022 ?auto_75026 ) ) ( not ( = ?auto_75023 ?auto_75024 ) ) ( not ( = ?auto_75023 ?auto_75026 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75026 ?auto_75024 ?auto_75021 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75044 - OBJ
      ?auto_75045 - OBJ
      ?auto_75046 - OBJ
      ?auto_75043 - LOCATION
    )
    :vars
    (
      ?auto_75047 - LOCATION
      ?auto_75049 - CITY
      ?auto_75048 - OBJ
      ?auto_75051 - TRUCK
      ?auto_75050 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75047 ?auto_75049 ) ( IN-CITY ?auto_75043 ?auto_75049 ) ( not ( = ?auto_75043 ?auto_75047 ) ) ( OBJ-AT ?auto_75048 ?auto_75043 ) ( not ( = ?auto_75048 ?auto_75045 ) ) ( OBJ-AT ?auto_75045 ?auto_75047 ) ( TRUCK-AT ?auto_75051 ?auto_75050 ) ( IN-CITY ?auto_75050 ?auto_75049 ) ( not ( = ?auto_75043 ?auto_75050 ) ) ( not ( = ?auto_75047 ?auto_75050 ) ) ( OBJ-AT ?auto_75044 ?auto_75043 ) ( OBJ-AT ?auto_75046 ?auto_75043 ) ( not ( = ?auto_75044 ?auto_75045 ) ) ( not ( = ?auto_75044 ?auto_75046 ) ) ( not ( = ?auto_75044 ?auto_75048 ) ) ( not ( = ?auto_75045 ?auto_75046 ) ) ( not ( = ?auto_75046 ?auto_75048 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75048 ?auto_75045 ?auto_75043 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75132 - OBJ
      ?auto_75133 - OBJ
      ?auto_75134 - OBJ
      ?auto_75131 - LOCATION
    )
    :vars
    (
      ?auto_75135 - LOCATION
      ?auto_75136 - CITY
      ?auto_75138 - TRUCK
      ?auto_75137 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75135 ?auto_75136 ) ( IN-CITY ?auto_75131 ?auto_75136 ) ( not ( = ?auto_75131 ?auto_75135 ) ) ( OBJ-AT ?auto_75133 ?auto_75131 ) ( not ( = ?auto_75133 ?auto_75132 ) ) ( OBJ-AT ?auto_75132 ?auto_75135 ) ( TRUCK-AT ?auto_75138 ?auto_75137 ) ( IN-CITY ?auto_75137 ?auto_75136 ) ( not ( = ?auto_75131 ?auto_75137 ) ) ( not ( = ?auto_75135 ?auto_75137 ) ) ( OBJ-AT ?auto_75134 ?auto_75131 ) ( not ( = ?auto_75132 ?auto_75134 ) ) ( not ( = ?auto_75133 ?auto_75134 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75133 ?auto_75132 ?auto_75131 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_75164 - OBJ
      ?auto_75165 - OBJ
      ?auto_75166 - OBJ
      ?auto_75163 - LOCATION
    )
    :vars
    (
      ?auto_75167 - LOCATION
      ?auto_75169 - CITY
      ?auto_75168 - OBJ
      ?auto_75171 - TRUCK
      ?auto_75170 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75167 ?auto_75169 ) ( IN-CITY ?auto_75163 ?auto_75169 ) ( not ( = ?auto_75163 ?auto_75167 ) ) ( OBJ-AT ?auto_75168 ?auto_75163 ) ( not ( = ?auto_75168 ?auto_75164 ) ) ( OBJ-AT ?auto_75164 ?auto_75167 ) ( TRUCK-AT ?auto_75171 ?auto_75170 ) ( IN-CITY ?auto_75170 ?auto_75169 ) ( not ( = ?auto_75163 ?auto_75170 ) ) ( not ( = ?auto_75167 ?auto_75170 ) ) ( OBJ-AT ?auto_75165 ?auto_75163 ) ( OBJ-AT ?auto_75166 ?auto_75163 ) ( not ( = ?auto_75164 ?auto_75165 ) ) ( not ( = ?auto_75164 ?auto_75166 ) ) ( not ( = ?auto_75165 ?auto_75166 ) ) ( not ( = ?auto_75165 ?auto_75168 ) ) ( not ( = ?auto_75166 ?auto_75168 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75168 ?auto_75164 ?auto_75163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75270 - OBJ
      ?auto_75271 - OBJ
      ?auto_75272 - OBJ
      ?auto_75273 - OBJ
      ?auto_75269 - LOCATION
    )
    :vars
    (
      ?auto_75274 - LOCATION
      ?auto_75275 - CITY
      ?auto_75277 - TRUCK
      ?auto_75276 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75274 ?auto_75275 ) ( IN-CITY ?auto_75269 ?auto_75275 ) ( not ( = ?auto_75269 ?auto_75274 ) ) ( OBJ-AT ?auto_75271 ?auto_75269 ) ( not ( = ?auto_75271 ?auto_75273 ) ) ( OBJ-AT ?auto_75273 ?auto_75274 ) ( TRUCK-AT ?auto_75277 ?auto_75276 ) ( IN-CITY ?auto_75276 ?auto_75275 ) ( not ( = ?auto_75269 ?auto_75276 ) ) ( not ( = ?auto_75274 ?auto_75276 ) ) ( OBJ-AT ?auto_75270 ?auto_75269 ) ( OBJ-AT ?auto_75272 ?auto_75269 ) ( not ( = ?auto_75270 ?auto_75271 ) ) ( not ( = ?auto_75270 ?auto_75272 ) ) ( not ( = ?auto_75270 ?auto_75273 ) ) ( not ( = ?auto_75271 ?auto_75272 ) ) ( not ( = ?auto_75272 ?auto_75273 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75271 ?auto_75273 ?auto_75269 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75297 - OBJ
      ?auto_75298 - OBJ
      ?auto_75299 - OBJ
      ?auto_75300 - OBJ
      ?auto_75296 - LOCATION
    )
    :vars
    (
      ?auto_75301 - LOCATION
      ?auto_75302 - CITY
      ?auto_75304 - TRUCK
      ?auto_75303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75301 ?auto_75302 ) ( IN-CITY ?auto_75296 ?auto_75302 ) ( not ( = ?auto_75296 ?auto_75301 ) ) ( OBJ-AT ?auto_75298 ?auto_75296 ) ( not ( = ?auto_75298 ?auto_75299 ) ) ( OBJ-AT ?auto_75299 ?auto_75301 ) ( TRUCK-AT ?auto_75304 ?auto_75303 ) ( IN-CITY ?auto_75303 ?auto_75302 ) ( not ( = ?auto_75296 ?auto_75303 ) ) ( not ( = ?auto_75301 ?auto_75303 ) ) ( OBJ-AT ?auto_75297 ?auto_75296 ) ( OBJ-AT ?auto_75300 ?auto_75296 ) ( not ( = ?auto_75297 ?auto_75298 ) ) ( not ( = ?auto_75297 ?auto_75299 ) ) ( not ( = ?auto_75297 ?auto_75300 ) ) ( not ( = ?auto_75298 ?auto_75300 ) ) ( not ( = ?auto_75299 ?auto_75300 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75298 ?auto_75299 ?auto_75296 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75324 - OBJ
      ?auto_75325 - OBJ
      ?auto_75326 - OBJ
      ?auto_75327 - OBJ
      ?auto_75323 - LOCATION
    )
    :vars
    (
      ?auto_75328 - LOCATION
      ?auto_75329 - CITY
      ?auto_75331 - TRUCK
      ?auto_75330 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75328 ?auto_75329 ) ( IN-CITY ?auto_75323 ?auto_75329 ) ( not ( = ?auto_75323 ?auto_75328 ) ) ( OBJ-AT ?auto_75326 ?auto_75323 ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( OBJ-AT ?auto_75327 ?auto_75328 ) ( TRUCK-AT ?auto_75331 ?auto_75330 ) ( IN-CITY ?auto_75330 ?auto_75329 ) ( not ( = ?auto_75323 ?auto_75330 ) ) ( not ( = ?auto_75328 ?auto_75330 ) ) ( OBJ-AT ?auto_75324 ?auto_75323 ) ( OBJ-AT ?auto_75325 ?auto_75323 ) ( not ( = ?auto_75324 ?auto_75325 ) ) ( not ( = ?auto_75324 ?auto_75326 ) ) ( not ( = ?auto_75324 ?auto_75327 ) ) ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75326 ?auto_75327 ?auto_75323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75360 - OBJ
      ?auto_75361 - OBJ
      ?auto_75362 - OBJ
      ?auto_75363 - OBJ
      ?auto_75359 - LOCATION
    )
    :vars
    (
      ?auto_75364 - LOCATION
      ?auto_75365 - CITY
      ?auto_75367 - TRUCK
      ?auto_75366 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75364 ?auto_75365 ) ( IN-CITY ?auto_75359 ?auto_75365 ) ( not ( = ?auto_75359 ?auto_75364 ) ) ( OBJ-AT ?auto_75360 ?auto_75359 ) ( not ( = ?auto_75360 ?auto_75362 ) ) ( OBJ-AT ?auto_75362 ?auto_75364 ) ( TRUCK-AT ?auto_75367 ?auto_75366 ) ( IN-CITY ?auto_75366 ?auto_75365 ) ( not ( = ?auto_75359 ?auto_75366 ) ) ( not ( = ?auto_75364 ?auto_75366 ) ) ( OBJ-AT ?auto_75361 ?auto_75359 ) ( OBJ-AT ?auto_75363 ?auto_75359 ) ( not ( = ?auto_75360 ?auto_75361 ) ) ( not ( = ?auto_75360 ?auto_75363 ) ) ( not ( = ?auto_75361 ?auto_75362 ) ) ( not ( = ?auto_75361 ?auto_75363 ) ) ( not ( = ?auto_75362 ?auto_75363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75360 ?auto_75362 ?auto_75359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75486 - OBJ
      ?auto_75487 - OBJ
      ?auto_75488 - OBJ
      ?auto_75489 - OBJ
      ?auto_75485 - LOCATION
    )
    :vars
    (
      ?auto_75490 - LOCATION
      ?auto_75491 - CITY
      ?auto_75493 - TRUCK
      ?auto_75492 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75490 ?auto_75491 ) ( IN-CITY ?auto_75485 ?auto_75491 ) ( not ( = ?auto_75485 ?auto_75490 ) ) ( OBJ-AT ?auto_75489 ?auto_75485 ) ( not ( = ?auto_75489 ?auto_75487 ) ) ( OBJ-AT ?auto_75487 ?auto_75490 ) ( TRUCK-AT ?auto_75493 ?auto_75492 ) ( IN-CITY ?auto_75492 ?auto_75491 ) ( not ( = ?auto_75485 ?auto_75492 ) ) ( not ( = ?auto_75490 ?auto_75492 ) ) ( OBJ-AT ?auto_75486 ?auto_75485 ) ( OBJ-AT ?auto_75488 ?auto_75485 ) ( not ( = ?auto_75486 ?auto_75487 ) ) ( not ( = ?auto_75486 ?auto_75488 ) ) ( not ( = ?auto_75486 ?auto_75489 ) ) ( not ( = ?auto_75487 ?auto_75488 ) ) ( not ( = ?auto_75488 ?auto_75489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75489 ?auto_75487 ?auto_75485 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75666 - OBJ
      ?auto_75667 - OBJ
      ?auto_75668 - OBJ
      ?auto_75669 - OBJ
      ?auto_75665 - LOCATION
    )
    :vars
    (
      ?auto_75670 - LOCATION
      ?auto_75672 - CITY
      ?auto_75671 - OBJ
      ?auto_75674 - TRUCK
      ?auto_75673 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75670 ?auto_75672 ) ( IN-CITY ?auto_75665 ?auto_75672 ) ( not ( = ?auto_75665 ?auto_75670 ) ) ( OBJ-AT ?auto_75671 ?auto_75665 ) ( not ( = ?auto_75671 ?auto_75669 ) ) ( OBJ-AT ?auto_75669 ?auto_75670 ) ( TRUCK-AT ?auto_75674 ?auto_75673 ) ( IN-CITY ?auto_75673 ?auto_75672 ) ( not ( = ?auto_75665 ?auto_75673 ) ) ( not ( = ?auto_75670 ?auto_75673 ) ) ( OBJ-AT ?auto_75666 ?auto_75665 ) ( OBJ-AT ?auto_75667 ?auto_75665 ) ( OBJ-AT ?auto_75668 ?auto_75665 ) ( not ( = ?auto_75666 ?auto_75667 ) ) ( not ( = ?auto_75666 ?auto_75668 ) ) ( not ( = ?auto_75666 ?auto_75669 ) ) ( not ( = ?auto_75666 ?auto_75671 ) ) ( not ( = ?auto_75667 ?auto_75668 ) ) ( not ( = ?auto_75667 ?auto_75669 ) ) ( not ( = ?auto_75667 ?auto_75671 ) ) ( not ( = ?auto_75668 ?auto_75669 ) ) ( not ( = ?auto_75668 ?auto_75671 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75671 ?auto_75669 ?auto_75665 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75695 - OBJ
      ?auto_75696 - OBJ
      ?auto_75697 - OBJ
      ?auto_75698 - OBJ
      ?auto_75694 - LOCATION
    )
    :vars
    (
      ?auto_75699 - LOCATION
      ?auto_75701 - CITY
      ?auto_75700 - OBJ
      ?auto_75703 - TRUCK
      ?auto_75702 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75699 ?auto_75701 ) ( IN-CITY ?auto_75694 ?auto_75701 ) ( not ( = ?auto_75694 ?auto_75699 ) ) ( OBJ-AT ?auto_75700 ?auto_75694 ) ( not ( = ?auto_75700 ?auto_75697 ) ) ( OBJ-AT ?auto_75697 ?auto_75699 ) ( TRUCK-AT ?auto_75703 ?auto_75702 ) ( IN-CITY ?auto_75702 ?auto_75701 ) ( not ( = ?auto_75694 ?auto_75702 ) ) ( not ( = ?auto_75699 ?auto_75702 ) ) ( OBJ-AT ?auto_75695 ?auto_75694 ) ( OBJ-AT ?auto_75696 ?auto_75694 ) ( OBJ-AT ?auto_75698 ?auto_75694 ) ( not ( = ?auto_75695 ?auto_75696 ) ) ( not ( = ?auto_75695 ?auto_75697 ) ) ( not ( = ?auto_75695 ?auto_75698 ) ) ( not ( = ?auto_75695 ?auto_75700 ) ) ( not ( = ?auto_75696 ?auto_75697 ) ) ( not ( = ?auto_75696 ?auto_75698 ) ) ( not ( = ?auto_75696 ?auto_75700 ) ) ( not ( = ?auto_75697 ?auto_75698 ) ) ( not ( = ?auto_75698 ?auto_75700 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75700 ?auto_75697 ?auto_75694 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75838 - OBJ
      ?auto_75839 - OBJ
      ?auto_75840 - OBJ
      ?auto_75841 - OBJ
      ?auto_75837 - LOCATION
    )
    :vars
    (
      ?auto_75842 - LOCATION
      ?auto_75844 - CITY
      ?auto_75843 - OBJ
      ?auto_75846 - TRUCK
      ?auto_75845 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75842 ?auto_75844 ) ( IN-CITY ?auto_75837 ?auto_75844 ) ( not ( = ?auto_75837 ?auto_75842 ) ) ( OBJ-AT ?auto_75843 ?auto_75837 ) ( not ( = ?auto_75843 ?auto_75839 ) ) ( OBJ-AT ?auto_75839 ?auto_75842 ) ( TRUCK-AT ?auto_75846 ?auto_75845 ) ( IN-CITY ?auto_75845 ?auto_75844 ) ( not ( = ?auto_75837 ?auto_75845 ) ) ( not ( = ?auto_75842 ?auto_75845 ) ) ( OBJ-AT ?auto_75838 ?auto_75837 ) ( OBJ-AT ?auto_75840 ?auto_75837 ) ( OBJ-AT ?auto_75841 ?auto_75837 ) ( not ( = ?auto_75838 ?auto_75839 ) ) ( not ( = ?auto_75838 ?auto_75840 ) ) ( not ( = ?auto_75838 ?auto_75841 ) ) ( not ( = ?auto_75838 ?auto_75843 ) ) ( not ( = ?auto_75839 ?auto_75840 ) ) ( not ( = ?auto_75839 ?auto_75841 ) ) ( not ( = ?auto_75840 ?auto_75841 ) ) ( not ( = ?auto_75840 ?auto_75843 ) ) ( not ( = ?auto_75841 ?auto_75843 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75843 ?auto_75839 ?auto_75837 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76334 - OBJ
      ?auto_76335 - OBJ
      ?auto_76336 - OBJ
      ?auto_76337 - OBJ
      ?auto_76333 - LOCATION
    )
    :vars
    (
      ?auto_76338 - LOCATION
      ?auto_76339 - CITY
      ?auto_76341 - TRUCK
      ?auto_76340 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76338 ?auto_76339 ) ( IN-CITY ?auto_76333 ?auto_76339 ) ( not ( = ?auto_76333 ?auto_76338 ) ) ( OBJ-AT ?auto_76337 ?auto_76333 ) ( not ( = ?auto_76337 ?auto_76334 ) ) ( OBJ-AT ?auto_76334 ?auto_76338 ) ( TRUCK-AT ?auto_76341 ?auto_76340 ) ( IN-CITY ?auto_76340 ?auto_76339 ) ( not ( = ?auto_76333 ?auto_76340 ) ) ( not ( = ?auto_76338 ?auto_76340 ) ) ( OBJ-AT ?auto_76335 ?auto_76333 ) ( OBJ-AT ?auto_76336 ?auto_76333 ) ( not ( = ?auto_76334 ?auto_76335 ) ) ( not ( = ?auto_76334 ?auto_76336 ) ) ( not ( = ?auto_76335 ?auto_76336 ) ) ( not ( = ?auto_76335 ?auto_76337 ) ) ( not ( = ?auto_76336 ?auto_76337 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76337 ?auto_76334 ?auto_76333 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76343 - OBJ
      ?auto_76344 - OBJ
      ?auto_76345 - OBJ
      ?auto_76346 - OBJ
      ?auto_76342 - LOCATION
    )
    :vars
    (
      ?auto_76347 - LOCATION
      ?auto_76348 - CITY
      ?auto_76350 - TRUCK
      ?auto_76349 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76347 ?auto_76348 ) ( IN-CITY ?auto_76342 ?auto_76348 ) ( not ( = ?auto_76342 ?auto_76347 ) ) ( OBJ-AT ?auto_76344 ?auto_76342 ) ( not ( = ?auto_76344 ?auto_76343 ) ) ( OBJ-AT ?auto_76343 ?auto_76347 ) ( TRUCK-AT ?auto_76350 ?auto_76349 ) ( IN-CITY ?auto_76349 ?auto_76348 ) ( not ( = ?auto_76342 ?auto_76349 ) ) ( not ( = ?auto_76347 ?auto_76349 ) ) ( OBJ-AT ?auto_76345 ?auto_76342 ) ( OBJ-AT ?auto_76346 ?auto_76342 ) ( not ( = ?auto_76343 ?auto_76345 ) ) ( not ( = ?auto_76343 ?auto_76346 ) ) ( not ( = ?auto_76344 ?auto_76345 ) ) ( not ( = ?auto_76344 ?auto_76346 ) ) ( not ( = ?auto_76345 ?auto_76346 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76344 ?auto_76343 ?auto_76342 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76487 - OBJ
      ?auto_76488 - OBJ
      ?auto_76489 - OBJ
      ?auto_76490 - OBJ
      ?auto_76486 - LOCATION
    )
    :vars
    (
      ?auto_76491 - LOCATION
      ?auto_76493 - CITY
      ?auto_76492 - OBJ
      ?auto_76495 - TRUCK
      ?auto_76494 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76491 ?auto_76493 ) ( IN-CITY ?auto_76486 ?auto_76493 ) ( not ( = ?auto_76486 ?auto_76491 ) ) ( OBJ-AT ?auto_76492 ?auto_76486 ) ( not ( = ?auto_76492 ?auto_76487 ) ) ( OBJ-AT ?auto_76487 ?auto_76491 ) ( TRUCK-AT ?auto_76495 ?auto_76494 ) ( IN-CITY ?auto_76494 ?auto_76493 ) ( not ( = ?auto_76486 ?auto_76494 ) ) ( not ( = ?auto_76491 ?auto_76494 ) ) ( OBJ-AT ?auto_76488 ?auto_76486 ) ( OBJ-AT ?auto_76489 ?auto_76486 ) ( OBJ-AT ?auto_76490 ?auto_76486 ) ( not ( = ?auto_76487 ?auto_76488 ) ) ( not ( = ?auto_76487 ?auto_76489 ) ) ( not ( = ?auto_76487 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76489 ) ) ( not ( = ?auto_76488 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76492 ) ) ( not ( = ?auto_76489 ?auto_76490 ) ) ( not ( = ?auto_76489 ?auto_76492 ) ) ( not ( = ?auto_76490 ?auto_76492 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76492 ?auto_76487 ?auto_76486 ) )
  )

)

