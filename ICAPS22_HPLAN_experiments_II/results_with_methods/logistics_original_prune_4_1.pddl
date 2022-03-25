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

  ( :method DELIVER-4PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) )
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
    ( ( !UNLOAD-TRUCK ?auto_55272 ?auto_55273 ?auto_55271 )
      ( DELIVER-1PKG-VERIFY ?auto_55272 ?auto_55271 ) )
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
      ( DELIVER-1PKG ?auto_55290 ?auto_55289 )
      ( DELIVER-1PKG-VERIFY ?auto_55290 ?auto_55289 ) )
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
      ( DELIVER-1PKG ?auto_55316 ?auto_55315 )
      ( DELIVER-1PKG-VERIFY ?auto_55316 ?auto_55315 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55342 - OBJ
      ?auto_55341 - LOCATION
    )
    :vars
    (
      ?auto_55344 - LOCATION
      ?auto_55343 - CITY
      ?auto_55345 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_55344 ?auto_55343 ) ( IN-CITY ?auto_55341 ?auto_55343 ) ( not ( = ?auto_55341 ?auto_55344 ) ) ( OBJ-AT ?auto_55342 ?auto_55344 ) ( TRUCK-AT ?auto_55345 ?auto_55341 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_55345 ?auto_55341 ?auto_55344 ?auto_55343 )
      ( DELIVER-1PKG ?auto_55342 ?auto_55341 )
      ( DELIVER-1PKG-VERIFY ?auto_55342 ?auto_55341 ) )
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
    ( ( DELIVER-1PKG ?auto_55486 ?auto_55484 )
      ( DELIVER-2PKG-VERIFY ?auto_55485 ?auto_55486 ?auto_55484 ) )
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
    ( ( DELIVER-1PKG ?auto_55489 ?auto_55488 )
      ( DELIVER-2PKG-VERIFY ?auto_55489 ?auto_55490 ?auto_55488 ) )
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
    ( ( DELIVER-1PKG ?auto_55499 ?auto_55496 )
      ( DELIVER-3PKG-VERIFY ?auto_55497 ?auto_55498 ?auto_55499 ?auto_55496 ) )
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
    ( ( DELIVER-1PKG ?auto_55503 ?auto_55501 )
      ( DELIVER-3PKG-VERIFY ?auto_55502 ?auto_55503 ?auto_55504 ?auto_55501 ) )
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
    ( ( DELIVER-1PKG ?auto_55512 ?auto_55511 )
      ( DELIVER-3PKG-VERIFY ?auto_55512 ?auto_55513 ?auto_55514 ?auto_55511 ) )
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
    ( ( DELIVER-1PKG ?auto_55535 ?auto_55531 )
      ( DELIVER-4PKG-VERIFY ?auto_55532 ?auto_55533 ?auto_55534 ?auto_55535 ?auto_55531 ) )
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
    ( ( DELIVER-1PKG ?auto_55540 ?auto_55537 )
      ( DELIVER-4PKG-VERIFY ?auto_55538 ?auto_55539 ?auto_55540 ?auto_55541 ?auto_55537 ) )
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
    ( ( DELIVER-1PKG ?auto_55551 ?auto_55549 )
      ( DELIVER-4PKG-VERIFY ?auto_55550 ?auto_55551 ?auto_55552 ?auto_55553 ?auto_55549 ) )
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
    ( ( DELIVER-1PKG ?auto_55574 ?auto_55573 )
      ( DELIVER-4PKG-VERIFY ?auto_55574 ?auto_55575 ?auto_55576 ?auto_55577 ?auto_55573 ) )
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
      ?auto_55631 - TRUCK
      ?auto_55630 - LOCATION
      ?auto_55629 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55628 ?auto_55631 ) ( TRUCK-AT ?auto_55631 ?auto_55630 ) ( IN-CITY ?auto_55630 ?auto_55629 ) ( IN-CITY ?auto_55626 ?auto_55629 ) ( not ( = ?auto_55626 ?auto_55630 ) ) ( OBJ-AT ?auto_55627 ?auto_55626 ) ( not ( = ?auto_55627 ?auto_55628 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55628 ?auto_55626 )
      ( DELIVER-2PKG-VERIFY ?auto_55627 ?auto_55628 ?auto_55626 ) )
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
      ?auto_55635 - TRUCK
      ?auto_55636 - LOCATION
      ?auto_55637 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55633 ?auto_55635 ) ( TRUCK-AT ?auto_55635 ?auto_55636 ) ( IN-CITY ?auto_55636 ?auto_55637 ) ( IN-CITY ?auto_55632 ?auto_55637 ) ( not ( = ?auto_55632 ?auto_55636 ) ) ( OBJ-AT ?auto_55634 ?auto_55632 ) ( not ( = ?auto_55634 ?auto_55633 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55634 ?auto_55633 ?auto_55632 )
      ( DELIVER-2PKG-VERIFY ?auto_55633 ?auto_55634 ?auto_55632 ) )
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
      ?auto_55649 - TRUCK
      ?auto_55650 - LOCATION
      ?auto_55651 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55648 ?auto_55649 ) ( TRUCK-AT ?auto_55649 ?auto_55650 ) ( IN-CITY ?auto_55650 ?auto_55651 ) ( IN-CITY ?auto_55645 ?auto_55651 ) ( not ( = ?auto_55645 ?auto_55650 ) ) ( OBJ-AT ?auto_55647 ?auto_55645 ) ( not ( = ?auto_55647 ?auto_55648 ) ) ( OBJ-AT ?auto_55646 ?auto_55645 ) ( not ( = ?auto_55646 ?auto_55647 ) ) ( not ( = ?auto_55646 ?auto_55648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55647 ?auto_55648 ?auto_55645 )
      ( DELIVER-3PKG-VERIFY ?auto_55646 ?auto_55647 ?auto_55648 ?auto_55645 ) )
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
      ?auto_55656 - TRUCK
      ?auto_55657 - LOCATION
      ?auto_55658 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55654 ?auto_55656 ) ( TRUCK-AT ?auto_55656 ?auto_55657 ) ( IN-CITY ?auto_55657 ?auto_55658 ) ( IN-CITY ?auto_55652 ?auto_55658 ) ( not ( = ?auto_55652 ?auto_55657 ) ) ( OBJ-AT ?auto_55655 ?auto_55652 ) ( not ( = ?auto_55655 ?auto_55654 ) ) ( OBJ-AT ?auto_55653 ?auto_55652 ) ( not ( = ?auto_55653 ?auto_55654 ) ) ( not ( = ?auto_55653 ?auto_55655 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55655 ?auto_55654 ?auto_55652 )
      ( DELIVER-3PKG-VERIFY ?auto_55653 ?auto_55654 ?auto_55655 ?auto_55652 ) )
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
      ?auto_55670 - TRUCK
      ?auto_55671 - LOCATION
      ?auto_55672 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55667 ?auto_55670 ) ( TRUCK-AT ?auto_55670 ?auto_55671 ) ( IN-CITY ?auto_55671 ?auto_55672 ) ( IN-CITY ?auto_55666 ?auto_55672 ) ( not ( = ?auto_55666 ?auto_55671 ) ) ( OBJ-AT ?auto_55668 ?auto_55666 ) ( not ( = ?auto_55668 ?auto_55667 ) ) ( OBJ-AT ?auto_55669 ?auto_55666 ) ( not ( = ?auto_55667 ?auto_55669 ) ) ( not ( = ?auto_55668 ?auto_55669 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55668 ?auto_55667 ?auto_55666 )
      ( DELIVER-3PKG-VERIFY ?auto_55667 ?auto_55668 ?auto_55669 ?auto_55666 ) )
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
      ?auto_55700 - TRUCK
      ?auto_55701 - LOCATION
      ?auto_55702 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55699 ?auto_55700 ) ( TRUCK-AT ?auto_55700 ?auto_55701 ) ( IN-CITY ?auto_55701 ?auto_55702 ) ( IN-CITY ?auto_55695 ?auto_55702 ) ( not ( = ?auto_55695 ?auto_55701 ) ) ( OBJ-AT ?auto_55698 ?auto_55695 ) ( not ( = ?auto_55698 ?auto_55699 ) ) ( OBJ-AT ?auto_55696 ?auto_55695 ) ( OBJ-AT ?auto_55697 ?auto_55695 ) ( not ( = ?auto_55696 ?auto_55697 ) ) ( not ( = ?auto_55696 ?auto_55698 ) ) ( not ( = ?auto_55696 ?auto_55699 ) ) ( not ( = ?auto_55697 ?auto_55698 ) ) ( not ( = ?auto_55697 ?auto_55699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55698 ?auto_55699 ?auto_55695 )
      ( DELIVER-4PKG-VERIFY ?auto_55696 ?auto_55697 ?auto_55698 ?auto_55699 ?auto_55695 ) )
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
      ?auto_55708 - TRUCK
      ?auto_55709 - LOCATION
      ?auto_55710 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55706 ?auto_55708 ) ( TRUCK-AT ?auto_55708 ?auto_55709 ) ( IN-CITY ?auto_55709 ?auto_55710 ) ( IN-CITY ?auto_55703 ?auto_55710 ) ( not ( = ?auto_55703 ?auto_55709 ) ) ( OBJ-AT ?auto_55707 ?auto_55703 ) ( not ( = ?auto_55707 ?auto_55706 ) ) ( OBJ-AT ?auto_55704 ?auto_55703 ) ( OBJ-AT ?auto_55705 ?auto_55703 ) ( not ( = ?auto_55704 ?auto_55705 ) ) ( not ( = ?auto_55704 ?auto_55706 ) ) ( not ( = ?auto_55704 ?auto_55707 ) ) ( not ( = ?auto_55705 ?auto_55706 ) ) ( not ( = ?auto_55705 ?auto_55707 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55707 ?auto_55706 ?auto_55703 )
      ( DELIVER-4PKG-VERIFY ?auto_55704 ?auto_55705 ?auto_55706 ?auto_55707 ?auto_55703 ) )
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
      ?auto_55724 - TRUCK
      ?auto_55725 - LOCATION
      ?auto_55726 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55721 ?auto_55724 ) ( TRUCK-AT ?auto_55724 ?auto_55725 ) ( IN-CITY ?auto_55725 ?auto_55726 ) ( IN-CITY ?auto_55719 ?auto_55726 ) ( not ( = ?auto_55719 ?auto_55725 ) ) ( OBJ-AT ?auto_55720 ?auto_55719 ) ( not ( = ?auto_55720 ?auto_55721 ) ) ( OBJ-AT ?auto_55722 ?auto_55719 ) ( OBJ-AT ?auto_55723 ?auto_55719 ) ( not ( = ?auto_55720 ?auto_55722 ) ) ( not ( = ?auto_55720 ?auto_55723 ) ) ( not ( = ?auto_55721 ?auto_55722 ) ) ( not ( = ?auto_55721 ?auto_55723 ) ) ( not ( = ?auto_55722 ?auto_55723 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55720 ?auto_55721 ?auto_55719 )
      ( DELIVER-4PKG-VERIFY ?auto_55720 ?auto_55721 ?auto_55722 ?auto_55723 ?auto_55719 ) )
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
      ?auto_55756 - TRUCK
      ?auto_55757 - LOCATION
      ?auto_55758 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_55752 ?auto_55756 ) ( TRUCK-AT ?auto_55756 ?auto_55757 ) ( IN-CITY ?auto_55757 ?auto_55758 ) ( IN-CITY ?auto_55751 ?auto_55758 ) ( not ( = ?auto_55751 ?auto_55757 ) ) ( OBJ-AT ?auto_55754 ?auto_55751 ) ( not ( = ?auto_55754 ?auto_55752 ) ) ( OBJ-AT ?auto_55753 ?auto_55751 ) ( OBJ-AT ?auto_55755 ?auto_55751 ) ( not ( = ?auto_55752 ?auto_55753 ) ) ( not ( = ?auto_55752 ?auto_55755 ) ) ( not ( = ?auto_55753 ?auto_55754 ) ) ( not ( = ?auto_55753 ?auto_55755 ) ) ( not ( = ?auto_55754 ?auto_55755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55754 ?auto_55752 ?auto_55751 )
      ( DELIVER-4PKG-VERIFY ?auto_55752 ?auto_55753 ?auto_55754 ?auto_55755 ?auto_55751 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_55817 - OBJ
      ?auto_55816 - LOCATION
    )
    :vars
    (
      ?auto_55818 - TRUCK
      ?auto_55819 - LOCATION
      ?auto_55820 - CITY
      ?auto_55821 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55818 ?auto_55819 ) ( IN-CITY ?auto_55819 ?auto_55820 ) ( IN-CITY ?auto_55816 ?auto_55820 ) ( not ( = ?auto_55816 ?auto_55819 ) ) ( OBJ-AT ?auto_55821 ?auto_55816 ) ( not ( = ?auto_55821 ?auto_55817 ) ) ( OBJ-AT ?auto_55817 ?auto_55819 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_55817 ?auto_55818 ?auto_55819 )
      ( DELIVER-2PKG ?auto_55821 ?auto_55817 ?auto_55816 )
      ( DELIVER-1PKG-VERIFY ?auto_55817 ?auto_55816 ) )
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
      ?auto_55825 - LOCATION
      ?auto_55827 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_55826 ?auto_55825 ) ( IN-CITY ?auto_55825 ?auto_55827 ) ( IN-CITY ?auto_55822 ?auto_55827 ) ( not ( = ?auto_55822 ?auto_55825 ) ) ( OBJ-AT ?auto_55823 ?auto_55822 ) ( not ( = ?auto_55823 ?auto_55824 ) ) ( OBJ-AT ?auto_55824 ?auto_55825 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_55824 ?auto_55822 )
      ( DELIVER-2PKG-VERIFY ?auto_55823 ?auto_55824 ?auto_55822 ) )
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
    ( ( DELIVER-2PKG ?auto_55830 ?auto_55829 ?auto_55828 )
      ( DELIVER-2PKG-VERIFY ?auto_55829 ?auto_55830 ?auto_55828 ) )
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
    ( ( DELIVER-2PKG ?auto_55842 ?auto_55844 ?auto_55841 )
      ( DELIVER-3PKG-VERIFY ?auto_55842 ?auto_55843 ?auto_55844 ?auto_55841 ) )
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
    ( and ( TRUCK-AT ?auto_55852 ?auto_55853 ) ( IN-CITY ?auto_55853 ?auto_55854 ) ( IN-CITY ?auto_55848 ?auto_55854 ) ( not ( = ?auto_55848 ?auto_55853 ) ) ( OBJ-AT ?auto_55851 ?auto_55848 ) ( not ( = ?auto_55851 ?auto_55850 ) ) ( OBJ-AT ?auto_55850 ?auto_55853 ) ( OBJ-AT ?auto_55849 ?auto_55848 ) ( not ( = ?auto_55849 ?auto_55850 ) ) ( not ( = ?auto_55849 ?auto_55851 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55851 ?auto_55850 ?auto_55848 )
      ( DELIVER-3PKG-VERIFY ?auto_55849 ?auto_55850 ?auto_55851 ?auto_55848 ) )
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
    ( and ( TRUCK-AT ?auto_55866 ?auto_55867 ) ( IN-CITY ?auto_55867 ?auto_55868 ) ( IN-CITY ?auto_55862 ?auto_55868 ) ( not ( = ?auto_55862 ?auto_55867 ) ) ( OBJ-AT ?auto_55864 ?auto_55862 ) ( not ( = ?auto_55864 ?auto_55863 ) ) ( OBJ-AT ?auto_55863 ?auto_55867 ) ( OBJ-AT ?auto_55865 ?auto_55862 ) ( not ( = ?auto_55863 ?auto_55865 ) ) ( not ( = ?auto_55864 ?auto_55865 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55864 ?auto_55863 ?auto_55862 )
      ( DELIVER-3PKG-VERIFY ?auto_55863 ?auto_55864 ?auto_55865 ?auto_55862 ) )
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
    ( and ( TRUCK-AT ?auto_55896 ?auto_55897 ) ( IN-CITY ?auto_55897 ?auto_55898 ) ( IN-CITY ?auto_55891 ?auto_55898 ) ( not ( = ?auto_55891 ?auto_55897 ) ) ( OBJ-AT ?auto_55892 ?auto_55891 ) ( not ( = ?auto_55892 ?auto_55895 ) ) ( OBJ-AT ?auto_55895 ?auto_55897 ) ( OBJ-AT ?auto_55893 ?auto_55891 ) ( OBJ-AT ?auto_55894 ?auto_55891 ) ( not ( = ?auto_55892 ?auto_55893 ) ) ( not ( = ?auto_55892 ?auto_55894 ) ) ( not ( = ?auto_55893 ?auto_55894 ) ) ( not ( = ?auto_55893 ?auto_55895 ) ) ( not ( = ?auto_55894 ?auto_55895 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55892 ?auto_55895 ?auto_55891 )
      ( DELIVER-4PKG-VERIFY ?auto_55892 ?auto_55893 ?auto_55894 ?auto_55895 ?auto_55891 ) )
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
    ( ( DELIVER-2PKG ?auto_55901 ?auto_55902 ?auto_55899 )
      ( DELIVER-4PKG-VERIFY ?auto_55900 ?auto_55901 ?auto_55902 ?auto_55903 ?auto_55899 ) )
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
    ( and ( TRUCK-AT ?auto_55920 ?auto_55921 ) ( IN-CITY ?auto_55921 ?auto_55922 ) ( IN-CITY ?auto_55915 ?auto_55922 ) ( not ( = ?auto_55915 ?auto_55921 ) ) ( OBJ-AT ?auto_55918 ?auto_55915 ) ( not ( = ?auto_55918 ?auto_55917 ) ) ( OBJ-AT ?auto_55917 ?auto_55921 ) ( OBJ-AT ?auto_55916 ?auto_55915 ) ( OBJ-AT ?auto_55919 ?auto_55915 ) ( not ( = ?auto_55916 ?auto_55917 ) ) ( not ( = ?auto_55916 ?auto_55918 ) ) ( not ( = ?auto_55916 ?auto_55919 ) ) ( not ( = ?auto_55917 ?auto_55919 ) ) ( not ( = ?auto_55918 ?auto_55919 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55918 ?auto_55917 ?auto_55915 )
      ( DELIVER-4PKG-VERIFY ?auto_55916 ?auto_55917 ?auto_55918 ?auto_55919 ?auto_55915 ) )
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
    ( and ( TRUCK-AT ?auto_55952 ?auto_55953 ) ( IN-CITY ?auto_55953 ?auto_55954 ) ( IN-CITY ?auto_55947 ?auto_55954 ) ( not ( = ?auto_55947 ?auto_55953 ) ) ( OBJ-AT ?auto_55950 ?auto_55947 ) ( not ( = ?auto_55950 ?auto_55948 ) ) ( OBJ-AT ?auto_55948 ?auto_55953 ) ( OBJ-AT ?auto_55949 ?auto_55947 ) ( OBJ-AT ?auto_55951 ?auto_55947 ) ( not ( = ?auto_55948 ?auto_55949 ) ) ( not ( = ?auto_55948 ?auto_55951 ) ) ( not ( = ?auto_55949 ?auto_55950 ) ) ( not ( = ?auto_55949 ?auto_55951 ) ) ( not ( = ?auto_55950 ?auto_55951 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_55950 ?auto_55948 ?auto_55947 )
      ( DELIVER-4PKG-VERIFY ?auto_55948 ?auto_55949 ?auto_55950 ?auto_55951 ?auto_55947 ) )
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
      ?auto_56017 - CITY
      ?auto_56016 - OBJ
      ?auto_56014 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56015 ?auto_56017 ) ( IN-CITY ?auto_56012 ?auto_56017 ) ( not ( = ?auto_56012 ?auto_56015 ) ) ( OBJ-AT ?auto_56016 ?auto_56012 ) ( not ( = ?auto_56016 ?auto_56013 ) ) ( OBJ-AT ?auto_56013 ?auto_56015 ) ( TRUCK-AT ?auto_56014 ?auto_56012 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56014 ?auto_56012 ?auto_56015 ?auto_56017 )
      ( DELIVER-2PKG ?auto_56016 ?auto_56013 ?auto_56012 )
      ( DELIVER-1PKG-VERIFY ?auto_56013 ?auto_56012 ) )
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
      ?auto_56022 - LOCATION
      ?auto_56023 - CITY
      ?auto_56021 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56022 ?auto_56023 ) ( IN-CITY ?auto_56018 ?auto_56023 ) ( not ( = ?auto_56018 ?auto_56022 ) ) ( OBJ-AT ?auto_56019 ?auto_56018 ) ( not ( = ?auto_56019 ?auto_56020 ) ) ( OBJ-AT ?auto_56020 ?auto_56022 ) ( TRUCK-AT ?auto_56021 ?auto_56018 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56020 ?auto_56018 )
      ( DELIVER-2PKG-VERIFY ?auto_56019 ?auto_56020 ?auto_56018 ) )
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
    ( ( DELIVER-2PKG ?auto_56026 ?auto_56025 ?auto_56024 )
      ( DELIVER-2PKG-VERIFY ?auto_56025 ?auto_56026 ?auto_56024 ) )
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
    ( ( DELIVER-2PKG ?auto_56039 ?auto_56040 ?auto_56037 )
      ( DELIVER-3PKG-VERIFY ?auto_56038 ?auto_56039 ?auto_56040 ?auto_56037 ) )
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
    ( and ( IN-CITY ?auto_56050 ?auto_56048 ) ( IN-CITY ?auto_56044 ?auto_56048 ) ( not ( = ?auto_56044 ?auto_56050 ) ) ( OBJ-AT ?auto_56047 ?auto_56044 ) ( not ( = ?auto_56047 ?auto_56046 ) ) ( OBJ-AT ?auto_56046 ?auto_56050 ) ( TRUCK-AT ?auto_56049 ?auto_56044 ) ( OBJ-AT ?auto_56045 ?auto_56044 ) ( not ( = ?auto_56045 ?auto_56046 ) ) ( not ( = ?auto_56045 ?auto_56047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56047 ?auto_56046 ?auto_56044 )
      ( DELIVER-3PKG-VERIFY ?auto_56045 ?auto_56046 ?auto_56047 ?auto_56044 ) )
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
    ( ( DELIVER-2PKG ?auto_56061 ?auto_56059 ?auto_56058 )
      ( DELIVER-3PKG-VERIFY ?auto_56059 ?auto_56060 ?auto_56061 ?auto_56058 ) )
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
    ( and ( IN-CITY ?auto_56094 ?auto_56092 ) ( IN-CITY ?auto_56087 ?auto_56092 ) ( not ( = ?auto_56087 ?auto_56094 ) ) ( OBJ-AT ?auto_56088 ?auto_56087 ) ( not ( = ?auto_56088 ?auto_56091 ) ) ( OBJ-AT ?auto_56091 ?auto_56094 ) ( TRUCK-AT ?auto_56093 ?auto_56087 ) ( OBJ-AT ?auto_56089 ?auto_56087 ) ( OBJ-AT ?auto_56090 ?auto_56087 ) ( not ( = ?auto_56088 ?auto_56089 ) ) ( not ( = ?auto_56088 ?auto_56090 ) ) ( not ( = ?auto_56089 ?auto_56090 ) ) ( not ( = ?auto_56089 ?auto_56091 ) ) ( not ( = ?auto_56090 ?auto_56091 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56088 ?auto_56091 ?auto_56087 )
      ( DELIVER-4PKG-VERIFY ?auto_56088 ?auto_56089 ?auto_56090 ?auto_56091 ?auto_56087 ) )
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
    ( ( DELIVER-2PKG ?auto_56096 ?auto_56098 ?auto_56095 )
      ( DELIVER-4PKG-VERIFY ?auto_56096 ?auto_56097 ?auto_56098 ?auto_56099 ?auto_56095 ) )
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
    ( and ( IN-CITY ?auto_56118 ?auto_56116 ) ( IN-CITY ?auto_56111 ?auto_56116 ) ( not ( = ?auto_56111 ?auto_56118 ) ) ( OBJ-AT ?auto_56115 ?auto_56111 ) ( not ( = ?auto_56115 ?auto_56113 ) ) ( OBJ-AT ?auto_56113 ?auto_56118 ) ( TRUCK-AT ?auto_56117 ?auto_56111 ) ( OBJ-AT ?auto_56112 ?auto_56111 ) ( OBJ-AT ?auto_56114 ?auto_56111 ) ( not ( = ?auto_56112 ?auto_56113 ) ) ( not ( = ?auto_56112 ?auto_56114 ) ) ( not ( = ?auto_56112 ?auto_56115 ) ) ( not ( = ?auto_56113 ?auto_56114 ) ) ( not ( = ?auto_56114 ?auto_56115 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56115 ?auto_56113 ?auto_56111 )
      ( DELIVER-4PKG-VERIFY ?auto_56112 ?auto_56113 ?auto_56114 ?auto_56115 ?auto_56111 ) )
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
    ( ( DELIVER-2PKG ?auto_56145 ?auto_56144 ?auto_56143 )
      ( DELIVER-4PKG-VERIFY ?auto_56144 ?auto_56145 ?auto_56146 ?auto_56147 ?auto_56143 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56209 - OBJ
      ?auto_56208 - LOCATION
    )
    :vars
    (
      ?auto_56212 - LOCATION
      ?auto_56210 - CITY
      ?auto_56213 - OBJ
      ?auto_56211 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56212 ?auto_56210 ) ( IN-CITY ?auto_56208 ?auto_56210 ) ( not ( = ?auto_56208 ?auto_56212 ) ) ( not ( = ?auto_56213 ?auto_56209 ) ) ( OBJ-AT ?auto_56209 ?auto_56212 ) ( TRUCK-AT ?auto_56211 ?auto_56208 ) ( IN-TRUCK ?auto_56213 ?auto_56211 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56213 ?auto_56208 )
      ( DELIVER-2PKG ?auto_56213 ?auto_56209 ?auto_56208 )
      ( DELIVER-1PKG-VERIFY ?auto_56209 ?auto_56208 ) )
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
      ?auto_56219 - CITY
      ?auto_56218 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56217 ?auto_56219 ) ( IN-CITY ?auto_56214 ?auto_56219 ) ( not ( = ?auto_56214 ?auto_56217 ) ) ( not ( = ?auto_56215 ?auto_56216 ) ) ( OBJ-AT ?auto_56216 ?auto_56217 ) ( TRUCK-AT ?auto_56218 ?auto_56214 ) ( IN-TRUCK ?auto_56215 ?auto_56218 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56216 ?auto_56214 )
      ( DELIVER-2PKG-VERIFY ?auto_56215 ?auto_56216 ?auto_56214 ) )
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
      ?auto_56224 - LOCATION
      ?auto_56225 - CITY
      ?auto_56223 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56224 ?auto_56225 ) ( IN-CITY ?auto_56220 ?auto_56225 ) ( not ( = ?auto_56220 ?auto_56224 ) ) ( not ( = ?auto_56222 ?auto_56221 ) ) ( OBJ-AT ?auto_56221 ?auto_56224 ) ( TRUCK-AT ?auto_56223 ?auto_56220 ) ( IN-TRUCK ?auto_56222 ?auto_56223 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56222 ?auto_56221 ?auto_56220 )
      ( DELIVER-2PKG-VERIFY ?auto_56221 ?auto_56222 ?auto_56220 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_56405 - OBJ
      ?auto_56404 - LOCATION
    )
    :vars
    (
      ?auto_56408 - LOCATION
      ?auto_56409 - CITY
      ?auto_56407 - OBJ
      ?auto_56406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56408 ?auto_56409 ) ( IN-CITY ?auto_56404 ?auto_56409 ) ( not ( = ?auto_56404 ?auto_56408 ) ) ( not ( = ?auto_56407 ?auto_56405 ) ) ( OBJ-AT ?auto_56405 ?auto_56408 ) ( IN-TRUCK ?auto_56407 ?auto_56406 ) ( TRUCK-AT ?auto_56406 ?auto_56408 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_56406 ?auto_56408 ?auto_56404 ?auto_56409 )
      ( DELIVER-2PKG ?auto_56407 ?auto_56405 ?auto_56404 )
      ( DELIVER-1PKG-VERIFY ?auto_56405 ?auto_56404 ) )
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
      ?auto_56413 - LOCATION
      ?auto_56414 - CITY
      ?auto_56415 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56413 ?auto_56414 ) ( IN-CITY ?auto_56410 ?auto_56414 ) ( not ( = ?auto_56410 ?auto_56413 ) ) ( not ( = ?auto_56411 ?auto_56412 ) ) ( OBJ-AT ?auto_56412 ?auto_56413 ) ( IN-TRUCK ?auto_56411 ?auto_56415 ) ( TRUCK-AT ?auto_56415 ?auto_56413 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_56412 ?auto_56410 )
      ( DELIVER-2PKG-VERIFY ?auto_56411 ?auto_56412 ?auto_56410 ) )
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
      ?auto_56419 - LOCATION
      ?auto_56420 - CITY
      ?auto_56421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_56419 ?auto_56420 ) ( IN-CITY ?auto_56416 ?auto_56420 ) ( not ( = ?auto_56416 ?auto_56419 ) ) ( not ( = ?auto_56418 ?auto_56417 ) ) ( OBJ-AT ?auto_56417 ?auto_56419 ) ( IN-TRUCK ?auto_56418 ?auto_56421 ) ( TRUCK-AT ?auto_56421 ?auto_56419 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_56418 ?auto_56417 ?auto_56416 )
      ( DELIVER-2PKG-VERIFY ?auto_56417 ?auto_56418 ?auto_56416 ) )
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
      ?auto_57943 - TRUCK
      ?auto_57941 - LOCATION
      ?auto_57942 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57939 ?auto_57943 ) ( TRUCK-AT ?auto_57943 ?auto_57941 ) ( IN-CITY ?auto_57941 ?auto_57942 ) ( IN-CITY ?auto_57937 ?auto_57942 ) ( not ( = ?auto_57937 ?auto_57941 ) ) ( OBJ-AT ?auto_57938 ?auto_57937 ) ( not ( = ?auto_57938 ?auto_57939 ) ) ( OBJ-AT ?auto_57940 ?auto_57937 ) ( not ( = ?auto_57938 ?auto_57940 ) ) ( not ( = ?auto_57939 ?auto_57940 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57938 ?auto_57939 ?auto_57937 )
      ( DELIVER-3PKG-VERIFY ?auto_57938 ?auto_57939 ?auto_57940 ?auto_57937 ) )
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
      ?auto_57966 - TRUCK
      ?auto_57963 - LOCATION
      ?auto_57964 - CITY
      ?auto_57965 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57962 ?auto_57966 ) ( TRUCK-AT ?auto_57966 ?auto_57963 ) ( IN-CITY ?auto_57963 ?auto_57964 ) ( IN-CITY ?auto_57959 ?auto_57964 ) ( not ( = ?auto_57959 ?auto_57963 ) ) ( OBJ-AT ?auto_57965 ?auto_57959 ) ( not ( = ?auto_57965 ?auto_57962 ) ) ( OBJ-AT ?auto_57960 ?auto_57959 ) ( OBJ-AT ?auto_57961 ?auto_57959 ) ( not ( = ?auto_57960 ?auto_57961 ) ) ( not ( = ?auto_57960 ?auto_57962 ) ) ( not ( = ?auto_57960 ?auto_57965 ) ) ( not ( = ?auto_57961 ?auto_57962 ) ) ( not ( = ?auto_57961 ?auto_57965 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57965 ?auto_57962 ?auto_57959 )
      ( DELIVER-3PKG-VERIFY ?auto_57960 ?auto_57961 ?auto_57962 ?auto_57959 ) )
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
      ?auto_57978 - TRUCK
      ?auto_57975 - LOCATION
      ?auto_57976 - CITY
      ?auto_57977 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_57973 ?auto_57978 ) ( TRUCK-AT ?auto_57978 ?auto_57975 ) ( IN-CITY ?auto_57975 ?auto_57976 ) ( IN-CITY ?auto_57971 ?auto_57976 ) ( not ( = ?auto_57971 ?auto_57975 ) ) ( OBJ-AT ?auto_57977 ?auto_57971 ) ( not ( = ?auto_57977 ?auto_57973 ) ) ( OBJ-AT ?auto_57972 ?auto_57971 ) ( OBJ-AT ?auto_57974 ?auto_57971 ) ( not ( = ?auto_57972 ?auto_57973 ) ) ( not ( = ?auto_57972 ?auto_57974 ) ) ( not ( = ?auto_57972 ?auto_57977 ) ) ( not ( = ?auto_57973 ?auto_57974 ) ) ( not ( = ?auto_57974 ?auto_57977 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57977 ?auto_57973 ?auto_57971 )
      ( DELIVER-3PKG-VERIFY ?auto_57972 ?auto_57973 ?auto_57974 ?auto_57971 ) )
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
      ?auto_58016 - TRUCK
      ?auto_58013 - LOCATION
      ?auto_58014 - CITY
      ?auto_58015 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58010 ?auto_58016 ) ( TRUCK-AT ?auto_58016 ?auto_58013 ) ( IN-CITY ?auto_58013 ?auto_58014 ) ( IN-CITY ?auto_58009 ?auto_58014 ) ( not ( = ?auto_58009 ?auto_58013 ) ) ( OBJ-AT ?auto_58015 ?auto_58009 ) ( not ( = ?auto_58015 ?auto_58010 ) ) ( OBJ-AT ?auto_58011 ?auto_58009 ) ( OBJ-AT ?auto_58012 ?auto_58009 ) ( not ( = ?auto_58010 ?auto_58011 ) ) ( not ( = ?auto_58010 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58012 ) ) ( not ( = ?auto_58011 ?auto_58015 ) ) ( not ( = ?auto_58012 ?auto_58015 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58015 ?auto_58010 ?auto_58009 )
      ( DELIVER-3PKG-VERIFY ?auto_58010 ?auto_58011 ?auto_58012 ?auto_58009 ) )
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
      ?auto_58055 - TRUCK
      ?auto_58053 - LOCATION
      ?auto_58054 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58052 ?auto_58055 ) ( TRUCK-AT ?auto_58055 ?auto_58053 ) ( IN-CITY ?auto_58053 ?auto_58054 ) ( IN-CITY ?auto_58048 ?auto_58054 ) ( not ( = ?auto_58048 ?auto_58053 ) ) ( OBJ-AT ?auto_58050 ?auto_58048 ) ( not ( = ?auto_58050 ?auto_58052 ) ) ( OBJ-AT ?auto_58049 ?auto_58048 ) ( OBJ-AT ?auto_58051 ?auto_58048 ) ( not ( = ?auto_58049 ?auto_58050 ) ) ( not ( = ?auto_58049 ?auto_58051 ) ) ( not ( = ?auto_58049 ?auto_58052 ) ) ( not ( = ?auto_58050 ?auto_58051 ) ) ( not ( = ?auto_58051 ?auto_58052 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58050 ?auto_58052 ?auto_58048 )
      ( DELIVER-4PKG-VERIFY ?auto_58049 ?auto_58050 ?auto_58051 ?auto_58052 ?auto_58048 ) )
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
      ?auto_58063 - TRUCK
      ?auto_58061 - LOCATION
      ?auto_58062 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58060 ?auto_58063 ) ( TRUCK-AT ?auto_58063 ?auto_58061 ) ( IN-CITY ?auto_58061 ?auto_58062 ) ( IN-CITY ?auto_58056 ?auto_58062 ) ( not ( = ?auto_58056 ?auto_58061 ) ) ( OBJ-AT ?auto_58057 ?auto_58056 ) ( not ( = ?auto_58057 ?auto_58060 ) ) ( OBJ-AT ?auto_58058 ?auto_58056 ) ( OBJ-AT ?auto_58059 ?auto_58056 ) ( not ( = ?auto_58057 ?auto_58058 ) ) ( not ( = ?auto_58057 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58059 ) ) ( not ( = ?auto_58058 ?auto_58060 ) ) ( not ( = ?auto_58059 ?auto_58060 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58057 ?auto_58060 ?auto_58056 )
      ( DELIVER-4PKG-VERIFY ?auto_58057 ?auto_58058 ?auto_58059 ?auto_58060 ?auto_58056 ) )
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
      ?auto_58079 - TRUCK
      ?auto_58077 - LOCATION
      ?auto_58078 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58075 ?auto_58079 ) ( TRUCK-AT ?auto_58079 ?auto_58077 ) ( IN-CITY ?auto_58077 ?auto_58078 ) ( IN-CITY ?auto_58072 ?auto_58078 ) ( not ( = ?auto_58072 ?auto_58077 ) ) ( OBJ-AT ?auto_58074 ?auto_58072 ) ( not ( = ?auto_58074 ?auto_58075 ) ) ( OBJ-AT ?auto_58073 ?auto_58072 ) ( OBJ-AT ?auto_58076 ?auto_58072 ) ( not ( = ?auto_58073 ?auto_58074 ) ) ( not ( = ?auto_58073 ?auto_58075 ) ) ( not ( = ?auto_58073 ?auto_58076 ) ) ( not ( = ?auto_58074 ?auto_58076 ) ) ( not ( = ?auto_58075 ?auto_58076 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58074 ?auto_58075 ?auto_58072 )
      ( DELIVER-4PKG-VERIFY ?auto_58073 ?auto_58074 ?auto_58075 ?auto_58076 ?auto_58072 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58105 - OBJ
      ?auto_58106 - OBJ
      ?auto_58107 - OBJ
      ?auto_58108 - OBJ
      ?auto_58104 - LOCATION
    )
    :vars
    (
      ?auto_58111 - TRUCK
      ?auto_58109 - LOCATION
      ?auto_58110 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58107 ?auto_58111 ) ( TRUCK-AT ?auto_58111 ?auto_58109 ) ( IN-CITY ?auto_58109 ?auto_58110 ) ( IN-CITY ?auto_58104 ?auto_58110 ) ( not ( = ?auto_58104 ?auto_58109 ) ) ( OBJ-AT ?auto_58105 ?auto_58104 ) ( not ( = ?auto_58105 ?auto_58107 ) ) ( OBJ-AT ?auto_58106 ?auto_58104 ) ( OBJ-AT ?auto_58108 ?auto_58104 ) ( not ( = ?auto_58105 ?auto_58106 ) ) ( not ( = ?auto_58105 ?auto_58108 ) ) ( not ( = ?auto_58106 ?auto_58107 ) ) ( not ( = ?auto_58106 ?auto_58108 ) ) ( not ( = ?auto_58107 ?auto_58108 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58105 ?auto_58107 ?auto_58104 )
      ( DELIVER-4PKG-VERIFY ?auto_58105 ?auto_58106 ?auto_58107 ?auto_58108 ?auto_58104 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58129 - OBJ
      ?auto_58130 - OBJ
      ?auto_58131 - OBJ
      ?auto_58132 - OBJ
      ?auto_58128 - LOCATION
    )
    :vars
    (
      ?auto_58135 - TRUCK
      ?auto_58133 - LOCATION
      ?auto_58134 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58130 ?auto_58135 ) ( TRUCK-AT ?auto_58135 ?auto_58133 ) ( IN-CITY ?auto_58133 ?auto_58134 ) ( IN-CITY ?auto_58128 ?auto_58134 ) ( not ( = ?auto_58128 ?auto_58133 ) ) ( OBJ-AT ?auto_58132 ?auto_58128 ) ( not ( = ?auto_58132 ?auto_58130 ) ) ( OBJ-AT ?auto_58129 ?auto_58128 ) ( OBJ-AT ?auto_58131 ?auto_58128 ) ( not ( = ?auto_58129 ?auto_58130 ) ) ( not ( = ?auto_58129 ?auto_58131 ) ) ( not ( = ?auto_58129 ?auto_58132 ) ) ( not ( = ?auto_58130 ?auto_58131 ) ) ( not ( = ?auto_58131 ?auto_58132 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58132 ?auto_58130 ?auto_58128 )
      ( DELIVER-4PKG-VERIFY ?auto_58129 ?auto_58130 ?auto_58131 ?auto_58132 ?auto_58128 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58137 - OBJ
      ?auto_58138 - OBJ
      ?auto_58139 - OBJ
      ?auto_58140 - OBJ
      ?auto_58136 - LOCATION
    )
    :vars
    (
      ?auto_58143 - TRUCK
      ?auto_58141 - LOCATION
      ?auto_58142 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58138 ?auto_58143 ) ( TRUCK-AT ?auto_58143 ?auto_58141 ) ( IN-CITY ?auto_58141 ?auto_58142 ) ( IN-CITY ?auto_58136 ?auto_58142 ) ( not ( = ?auto_58136 ?auto_58141 ) ) ( OBJ-AT ?auto_58139 ?auto_58136 ) ( not ( = ?auto_58139 ?auto_58138 ) ) ( OBJ-AT ?auto_58137 ?auto_58136 ) ( OBJ-AT ?auto_58140 ?auto_58136 ) ( not ( = ?auto_58137 ?auto_58138 ) ) ( not ( = ?auto_58137 ?auto_58139 ) ) ( not ( = ?auto_58137 ?auto_58140 ) ) ( not ( = ?auto_58138 ?auto_58140 ) ) ( not ( = ?auto_58139 ?auto_58140 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58139 ?auto_58138 ?auto_58136 )
      ( DELIVER-4PKG-VERIFY ?auto_58137 ?auto_58138 ?auto_58139 ?auto_58140 ?auto_58136 ) )
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
      ?auto_58256 - TRUCK
      ?auto_58253 - LOCATION
      ?auto_58254 - CITY
      ?auto_58255 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58252 ?auto_58256 ) ( TRUCK-AT ?auto_58256 ?auto_58253 ) ( IN-CITY ?auto_58253 ?auto_58254 ) ( IN-CITY ?auto_58248 ?auto_58254 ) ( not ( = ?auto_58248 ?auto_58253 ) ) ( OBJ-AT ?auto_58255 ?auto_58248 ) ( not ( = ?auto_58255 ?auto_58252 ) ) ( OBJ-AT ?auto_58249 ?auto_58248 ) ( OBJ-AT ?auto_58250 ?auto_58248 ) ( OBJ-AT ?auto_58251 ?auto_58248 ) ( not ( = ?auto_58249 ?auto_58250 ) ) ( not ( = ?auto_58249 ?auto_58251 ) ) ( not ( = ?auto_58249 ?auto_58252 ) ) ( not ( = ?auto_58249 ?auto_58255 ) ) ( not ( = ?auto_58250 ?auto_58251 ) ) ( not ( = ?auto_58250 ?auto_58252 ) ) ( not ( = ?auto_58250 ?auto_58255 ) ) ( not ( = ?auto_58251 ?auto_58252 ) ) ( not ( = ?auto_58251 ?auto_58255 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58255 ?auto_58252 ?auto_58248 )
      ( DELIVER-4PKG-VERIFY ?auto_58249 ?auto_58250 ?auto_58251 ?auto_58252 ?auto_58248 ) )
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
      ?auto_58273 - TRUCK
      ?auto_58270 - LOCATION
      ?auto_58271 - CITY
      ?auto_58272 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58268 ?auto_58273 ) ( TRUCK-AT ?auto_58273 ?auto_58270 ) ( IN-CITY ?auto_58270 ?auto_58271 ) ( IN-CITY ?auto_58265 ?auto_58271 ) ( not ( = ?auto_58265 ?auto_58270 ) ) ( OBJ-AT ?auto_58272 ?auto_58265 ) ( not ( = ?auto_58272 ?auto_58268 ) ) ( OBJ-AT ?auto_58266 ?auto_58265 ) ( OBJ-AT ?auto_58267 ?auto_58265 ) ( OBJ-AT ?auto_58269 ?auto_58265 ) ( not ( = ?auto_58266 ?auto_58267 ) ) ( not ( = ?auto_58266 ?auto_58268 ) ) ( not ( = ?auto_58266 ?auto_58269 ) ) ( not ( = ?auto_58266 ?auto_58272 ) ) ( not ( = ?auto_58267 ?auto_58268 ) ) ( not ( = ?auto_58267 ?auto_58269 ) ) ( not ( = ?auto_58267 ?auto_58272 ) ) ( not ( = ?auto_58268 ?auto_58269 ) ) ( not ( = ?auto_58269 ?auto_58272 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58272 ?auto_58268 ?auto_58265 )
      ( DELIVER-4PKG-VERIFY ?auto_58266 ?auto_58267 ?auto_58268 ?auto_58269 ?auto_58265 ) )
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
      ?auto_58323 - TRUCK
      ?auto_58320 - LOCATION
      ?auto_58321 - CITY
      ?auto_58322 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58317 ?auto_58323 ) ( TRUCK-AT ?auto_58323 ?auto_58320 ) ( IN-CITY ?auto_58320 ?auto_58321 ) ( IN-CITY ?auto_58315 ?auto_58321 ) ( not ( = ?auto_58315 ?auto_58320 ) ) ( OBJ-AT ?auto_58322 ?auto_58315 ) ( not ( = ?auto_58322 ?auto_58317 ) ) ( OBJ-AT ?auto_58316 ?auto_58315 ) ( OBJ-AT ?auto_58318 ?auto_58315 ) ( OBJ-AT ?auto_58319 ?auto_58315 ) ( not ( = ?auto_58316 ?auto_58317 ) ) ( not ( = ?auto_58316 ?auto_58318 ) ) ( not ( = ?auto_58316 ?auto_58319 ) ) ( not ( = ?auto_58316 ?auto_58322 ) ) ( not ( = ?auto_58317 ?auto_58318 ) ) ( not ( = ?auto_58317 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58319 ) ) ( not ( = ?auto_58318 ?auto_58322 ) ) ( not ( = ?auto_58319 ?auto_58322 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58322 ?auto_58317 ?auto_58315 )
      ( DELIVER-4PKG-VERIFY ?auto_58316 ?auto_58317 ?auto_58318 ?auto_58319 ?auto_58315 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58360 - OBJ
      ?auto_58361 - OBJ
      ?auto_58362 - OBJ
      ?auto_58363 - OBJ
      ?auto_58359 - LOCATION
    )
    :vars
    (
      ?auto_58366 - TRUCK
      ?auto_58364 - LOCATION
      ?auto_58365 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58360 ?auto_58366 ) ( TRUCK-AT ?auto_58366 ?auto_58364 ) ( IN-CITY ?auto_58364 ?auto_58365 ) ( IN-CITY ?auto_58359 ?auto_58365 ) ( not ( = ?auto_58359 ?auto_58364 ) ) ( OBJ-AT ?auto_58363 ?auto_58359 ) ( not ( = ?auto_58363 ?auto_58360 ) ) ( OBJ-AT ?auto_58361 ?auto_58359 ) ( OBJ-AT ?auto_58362 ?auto_58359 ) ( not ( = ?auto_58360 ?auto_58361 ) ) ( not ( = ?auto_58360 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58362 ) ) ( not ( = ?auto_58361 ?auto_58363 ) ) ( not ( = ?auto_58362 ?auto_58363 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58363 ?auto_58360 ?auto_58359 )
      ( DELIVER-4PKG-VERIFY ?auto_58360 ?auto_58361 ?auto_58362 ?auto_58363 ?auto_58359 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58392 - OBJ
      ?auto_58393 - OBJ
      ?auto_58394 - OBJ
      ?auto_58395 - OBJ
      ?auto_58391 - LOCATION
    )
    :vars
    (
      ?auto_58398 - TRUCK
      ?auto_58396 - LOCATION
      ?auto_58397 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58392 ?auto_58398 ) ( TRUCK-AT ?auto_58398 ?auto_58396 ) ( IN-CITY ?auto_58396 ?auto_58397 ) ( IN-CITY ?auto_58391 ?auto_58397 ) ( not ( = ?auto_58391 ?auto_58396 ) ) ( OBJ-AT ?auto_58393 ?auto_58391 ) ( not ( = ?auto_58393 ?auto_58392 ) ) ( OBJ-AT ?auto_58394 ?auto_58391 ) ( OBJ-AT ?auto_58395 ?auto_58391 ) ( not ( = ?auto_58392 ?auto_58394 ) ) ( not ( = ?auto_58392 ?auto_58395 ) ) ( not ( = ?auto_58393 ?auto_58394 ) ) ( not ( = ?auto_58393 ?auto_58395 ) ) ( not ( = ?auto_58394 ?auto_58395 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58393 ?auto_58392 ?auto_58391 )
      ( DELIVER-4PKG-VERIFY ?auto_58392 ?auto_58393 ?auto_58394 ?auto_58395 ?auto_58391 ) )
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
      ?auto_58471 - TRUCK
      ?auto_58468 - LOCATION
      ?auto_58469 - CITY
      ?auto_58470 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_58464 ?auto_58471 ) ( TRUCK-AT ?auto_58471 ?auto_58468 ) ( IN-CITY ?auto_58468 ?auto_58469 ) ( IN-CITY ?auto_58463 ?auto_58469 ) ( not ( = ?auto_58463 ?auto_58468 ) ) ( OBJ-AT ?auto_58470 ?auto_58463 ) ( not ( = ?auto_58470 ?auto_58464 ) ) ( OBJ-AT ?auto_58465 ?auto_58463 ) ( OBJ-AT ?auto_58466 ?auto_58463 ) ( OBJ-AT ?auto_58467 ?auto_58463 ) ( not ( = ?auto_58464 ?auto_58465 ) ) ( not ( = ?auto_58464 ?auto_58466 ) ) ( not ( = ?auto_58464 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58466 ) ) ( not ( = ?auto_58465 ?auto_58467 ) ) ( not ( = ?auto_58465 ?auto_58470 ) ) ( not ( = ?auto_58466 ?auto_58467 ) ) ( not ( = ?auto_58466 ?auto_58470 ) ) ( not ( = ?auto_58467 ?auto_58470 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58470 ?auto_58464 ?auto_58463 )
      ( DELIVER-4PKG-VERIFY ?auto_58464 ?auto_58465 ?auto_58466 ?auto_58467 ?auto_58463 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_58615 - OBJ
      ?auto_58616 - OBJ
      ?auto_58617 - OBJ
      ?auto_58614 - LOCATION
    )
    :vars
    (
      ?auto_58619 - TRUCK
      ?auto_58618 - LOCATION
      ?auto_58620 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58619 ?auto_58618 ) ( IN-CITY ?auto_58618 ?auto_58620 ) ( IN-CITY ?auto_58614 ?auto_58620 ) ( not ( = ?auto_58614 ?auto_58618 ) ) ( OBJ-AT ?auto_58616 ?auto_58614 ) ( not ( = ?auto_58616 ?auto_58617 ) ) ( OBJ-AT ?auto_58617 ?auto_58618 ) ( OBJ-AT ?auto_58615 ?auto_58614 ) ( not ( = ?auto_58615 ?auto_58616 ) ) ( not ( = ?auto_58615 ?auto_58617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58616 ?auto_58617 ?auto_58614 )
      ( DELIVER-3PKG-VERIFY ?auto_58615 ?auto_58616 ?auto_58617 ?auto_58614 ) )
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
      ?auto_58653 - TRUCK
      ?auto_58651 - LOCATION
      ?auto_58654 - CITY
      ?auto_58652 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58653 ?auto_58651 ) ( IN-CITY ?auto_58651 ?auto_58654 ) ( IN-CITY ?auto_58647 ?auto_58654 ) ( not ( = ?auto_58647 ?auto_58651 ) ) ( OBJ-AT ?auto_58652 ?auto_58647 ) ( not ( = ?auto_58652 ?auto_58650 ) ) ( OBJ-AT ?auto_58650 ?auto_58651 ) ( OBJ-AT ?auto_58648 ?auto_58647 ) ( OBJ-AT ?auto_58649 ?auto_58647 ) ( not ( = ?auto_58648 ?auto_58649 ) ) ( not ( = ?auto_58648 ?auto_58650 ) ) ( not ( = ?auto_58648 ?auto_58652 ) ) ( not ( = ?auto_58649 ?auto_58650 ) ) ( not ( = ?auto_58649 ?auto_58652 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58652 ?auto_58650 ?auto_58647 )
      ( DELIVER-3PKG-VERIFY ?auto_58648 ?auto_58649 ?auto_58650 ?auto_58647 ) )
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
      ?auto_58665 - TRUCK
      ?auto_58663 - LOCATION
      ?auto_58666 - CITY
      ?auto_58664 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58665 ?auto_58663 ) ( IN-CITY ?auto_58663 ?auto_58666 ) ( IN-CITY ?auto_58659 ?auto_58666 ) ( not ( = ?auto_58659 ?auto_58663 ) ) ( OBJ-AT ?auto_58664 ?auto_58659 ) ( not ( = ?auto_58664 ?auto_58661 ) ) ( OBJ-AT ?auto_58661 ?auto_58663 ) ( OBJ-AT ?auto_58660 ?auto_58659 ) ( OBJ-AT ?auto_58662 ?auto_58659 ) ( not ( = ?auto_58660 ?auto_58661 ) ) ( not ( = ?auto_58660 ?auto_58662 ) ) ( not ( = ?auto_58660 ?auto_58664 ) ) ( not ( = ?auto_58661 ?auto_58662 ) ) ( not ( = ?auto_58662 ?auto_58664 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58664 ?auto_58661 ?auto_58659 )
      ( DELIVER-3PKG-VERIFY ?auto_58660 ?auto_58661 ?auto_58662 ?auto_58659 ) )
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
      ?auto_58703 - TRUCK
      ?auto_58701 - LOCATION
      ?auto_58704 - CITY
      ?auto_58702 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58703 ?auto_58701 ) ( IN-CITY ?auto_58701 ?auto_58704 ) ( IN-CITY ?auto_58697 ?auto_58704 ) ( not ( = ?auto_58697 ?auto_58701 ) ) ( OBJ-AT ?auto_58702 ?auto_58697 ) ( not ( = ?auto_58702 ?auto_58698 ) ) ( OBJ-AT ?auto_58698 ?auto_58701 ) ( OBJ-AT ?auto_58699 ?auto_58697 ) ( OBJ-AT ?auto_58700 ?auto_58697 ) ( not ( = ?auto_58698 ?auto_58699 ) ) ( not ( = ?auto_58698 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58700 ) ) ( not ( = ?auto_58699 ?auto_58702 ) ) ( not ( = ?auto_58700 ?auto_58702 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58702 ?auto_58698 ?auto_58697 )
      ( DELIVER-3PKG-VERIFY ?auto_58698 ?auto_58699 ?auto_58700 ?auto_58697 ) )
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
      ?auto_58742 - TRUCK
      ?auto_58741 - LOCATION
      ?auto_58743 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58742 ?auto_58741 ) ( IN-CITY ?auto_58741 ?auto_58743 ) ( IN-CITY ?auto_58736 ?auto_58743 ) ( not ( = ?auto_58736 ?auto_58741 ) ) ( OBJ-AT ?auto_58739 ?auto_58736 ) ( not ( = ?auto_58739 ?auto_58740 ) ) ( OBJ-AT ?auto_58740 ?auto_58741 ) ( OBJ-AT ?auto_58737 ?auto_58736 ) ( OBJ-AT ?auto_58738 ?auto_58736 ) ( not ( = ?auto_58737 ?auto_58738 ) ) ( not ( = ?auto_58737 ?auto_58739 ) ) ( not ( = ?auto_58737 ?auto_58740 ) ) ( not ( = ?auto_58738 ?auto_58739 ) ) ( not ( = ?auto_58738 ?auto_58740 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58739 ?auto_58740 ?auto_58736 )
      ( DELIVER-4PKG-VERIFY ?auto_58737 ?auto_58738 ?auto_58739 ?auto_58740 ?auto_58736 ) )
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
      ?auto_58758 - TRUCK
      ?auto_58757 - LOCATION
      ?auto_58759 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58758 ?auto_58757 ) ( IN-CITY ?auto_58757 ?auto_58759 ) ( IN-CITY ?auto_58752 ?auto_58759 ) ( not ( = ?auto_58752 ?auto_58757 ) ) ( OBJ-AT ?auto_58753 ?auto_58752 ) ( not ( = ?auto_58753 ?auto_58755 ) ) ( OBJ-AT ?auto_58755 ?auto_58757 ) ( OBJ-AT ?auto_58754 ?auto_58752 ) ( OBJ-AT ?auto_58756 ?auto_58752 ) ( not ( = ?auto_58753 ?auto_58754 ) ) ( not ( = ?auto_58753 ?auto_58756 ) ) ( not ( = ?auto_58754 ?auto_58755 ) ) ( not ( = ?auto_58754 ?auto_58756 ) ) ( not ( = ?auto_58755 ?auto_58756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58753 ?auto_58755 ?auto_58752 )
      ( DELIVER-4PKG-VERIFY ?auto_58753 ?auto_58754 ?auto_58755 ?auto_58756 ?auto_58752 ) )
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
      ?auto_58822 - TRUCK
      ?auto_58821 - LOCATION
      ?auto_58823 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58822 ?auto_58821 ) ( IN-CITY ?auto_58821 ?auto_58823 ) ( IN-CITY ?auto_58816 ?auto_58823 ) ( not ( = ?auto_58816 ?auto_58821 ) ) ( OBJ-AT ?auto_58817 ?auto_58816 ) ( not ( = ?auto_58817 ?auto_58818 ) ) ( OBJ-AT ?auto_58818 ?auto_58821 ) ( OBJ-AT ?auto_58819 ?auto_58816 ) ( OBJ-AT ?auto_58820 ?auto_58816 ) ( not ( = ?auto_58817 ?auto_58819 ) ) ( not ( = ?auto_58817 ?auto_58820 ) ) ( not ( = ?auto_58818 ?auto_58819 ) ) ( not ( = ?auto_58818 ?auto_58820 ) ) ( not ( = ?auto_58819 ?auto_58820 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58817 ?auto_58818 ?auto_58816 )
      ( DELIVER-4PKG-VERIFY ?auto_58817 ?auto_58818 ?auto_58819 ?auto_58820 ?auto_58816 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58889 - OBJ
      ?auto_58890 - OBJ
      ?auto_58891 - OBJ
      ?auto_58892 - OBJ
      ?auto_58888 - LOCATION
    )
    :vars
    (
      ?auto_58894 - TRUCK
      ?auto_58893 - LOCATION
      ?auto_58895 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58894 ?auto_58893 ) ( IN-CITY ?auto_58893 ?auto_58895 ) ( IN-CITY ?auto_58888 ?auto_58895 ) ( not ( = ?auto_58888 ?auto_58893 ) ) ( OBJ-AT ?auto_58890 ?auto_58888 ) ( not ( = ?auto_58890 ?auto_58892 ) ) ( OBJ-AT ?auto_58892 ?auto_58893 ) ( OBJ-AT ?auto_58889 ?auto_58888 ) ( OBJ-AT ?auto_58891 ?auto_58888 ) ( not ( = ?auto_58889 ?auto_58890 ) ) ( not ( = ?auto_58889 ?auto_58891 ) ) ( not ( = ?auto_58889 ?auto_58892 ) ) ( not ( = ?auto_58890 ?auto_58891 ) ) ( not ( = ?auto_58891 ?auto_58892 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58890 ?auto_58892 ?auto_58888 )
      ( DELIVER-4PKG-VERIFY ?auto_58889 ?auto_58890 ?auto_58891 ?auto_58892 ?auto_58888 ) )
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
      ?auto_58943 - TRUCK
      ?auto_58941 - LOCATION
      ?auto_58944 - CITY
      ?auto_58942 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58943 ?auto_58941 ) ( IN-CITY ?auto_58941 ?auto_58944 ) ( IN-CITY ?auto_58936 ?auto_58944 ) ( not ( = ?auto_58936 ?auto_58941 ) ) ( OBJ-AT ?auto_58942 ?auto_58936 ) ( not ( = ?auto_58942 ?auto_58940 ) ) ( OBJ-AT ?auto_58940 ?auto_58941 ) ( OBJ-AT ?auto_58937 ?auto_58936 ) ( OBJ-AT ?auto_58938 ?auto_58936 ) ( OBJ-AT ?auto_58939 ?auto_58936 ) ( not ( = ?auto_58937 ?auto_58938 ) ) ( not ( = ?auto_58937 ?auto_58939 ) ) ( not ( = ?auto_58937 ?auto_58940 ) ) ( not ( = ?auto_58937 ?auto_58942 ) ) ( not ( = ?auto_58938 ?auto_58939 ) ) ( not ( = ?auto_58938 ?auto_58940 ) ) ( not ( = ?auto_58938 ?auto_58942 ) ) ( not ( = ?auto_58939 ?auto_58940 ) ) ( not ( = ?auto_58939 ?auto_58942 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58942 ?auto_58940 ?auto_58936 )
      ( DELIVER-4PKG-VERIFY ?auto_58937 ?auto_58938 ?auto_58939 ?auto_58940 ?auto_58936 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58946 - OBJ
      ?auto_58947 - OBJ
      ?auto_58948 - OBJ
      ?auto_58949 - OBJ
      ?auto_58945 - LOCATION
    )
    :vars
    (
      ?auto_58951 - TRUCK
      ?auto_58950 - LOCATION
      ?auto_58952 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58951 ?auto_58950 ) ( IN-CITY ?auto_58950 ?auto_58952 ) ( IN-CITY ?auto_58945 ?auto_58952 ) ( not ( = ?auto_58945 ?auto_58950 ) ) ( OBJ-AT ?auto_58949 ?auto_58945 ) ( not ( = ?auto_58949 ?auto_58948 ) ) ( OBJ-AT ?auto_58948 ?auto_58950 ) ( OBJ-AT ?auto_58946 ?auto_58945 ) ( OBJ-AT ?auto_58947 ?auto_58945 ) ( not ( = ?auto_58946 ?auto_58947 ) ) ( not ( = ?auto_58946 ?auto_58948 ) ) ( not ( = ?auto_58946 ?auto_58949 ) ) ( not ( = ?auto_58947 ?auto_58948 ) ) ( not ( = ?auto_58947 ?auto_58949 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58949 ?auto_58948 ?auto_58945 )
      ( DELIVER-4PKG-VERIFY ?auto_58946 ?auto_58947 ?auto_58948 ?auto_58949 ?auto_58945 ) )
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
      ?auto_58960 - TRUCK
      ?auto_58958 - LOCATION
      ?auto_58961 - CITY
      ?auto_58959 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58960 ?auto_58958 ) ( IN-CITY ?auto_58958 ?auto_58961 ) ( IN-CITY ?auto_58953 ?auto_58961 ) ( not ( = ?auto_58953 ?auto_58958 ) ) ( OBJ-AT ?auto_58959 ?auto_58953 ) ( not ( = ?auto_58959 ?auto_58956 ) ) ( OBJ-AT ?auto_58956 ?auto_58958 ) ( OBJ-AT ?auto_58954 ?auto_58953 ) ( OBJ-AT ?auto_58955 ?auto_58953 ) ( OBJ-AT ?auto_58957 ?auto_58953 ) ( not ( = ?auto_58954 ?auto_58955 ) ) ( not ( = ?auto_58954 ?auto_58956 ) ) ( not ( = ?auto_58954 ?auto_58957 ) ) ( not ( = ?auto_58954 ?auto_58959 ) ) ( not ( = ?auto_58955 ?auto_58956 ) ) ( not ( = ?auto_58955 ?auto_58957 ) ) ( not ( = ?auto_58955 ?auto_58959 ) ) ( not ( = ?auto_58956 ?auto_58957 ) ) ( not ( = ?auto_58957 ?auto_58959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58959 ?auto_58956 ?auto_58953 )
      ( DELIVER-4PKG-VERIFY ?auto_58954 ?auto_58955 ?auto_58956 ?auto_58957 ?auto_58953 ) )
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
      ?auto_58977 - TRUCK
      ?auto_58976 - LOCATION
      ?auto_58978 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_58977 ?auto_58976 ) ( IN-CITY ?auto_58976 ?auto_58978 ) ( IN-CITY ?auto_58971 ?auto_58978 ) ( not ( = ?auto_58971 ?auto_58976 ) ) ( OBJ-AT ?auto_58975 ?auto_58971 ) ( not ( = ?auto_58975 ?auto_58973 ) ) ( OBJ-AT ?auto_58973 ?auto_58976 ) ( OBJ-AT ?auto_58972 ?auto_58971 ) ( OBJ-AT ?auto_58974 ?auto_58971 ) ( not ( = ?auto_58972 ?auto_58973 ) ) ( not ( = ?auto_58972 ?auto_58974 ) ) ( not ( = ?auto_58972 ?auto_58975 ) ) ( not ( = ?auto_58973 ?auto_58974 ) ) ( not ( = ?auto_58974 ?auto_58975 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_58975 ?auto_58973 ?auto_58971 )
      ( DELIVER-4PKG-VERIFY ?auto_58972 ?auto_58973 ?auto_58974 ?auto_58975 ?auto_58971 ) )
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
      ?auto_59010 - TRUCK
      ?auto_59008 - LOCATION
      ?auto_59011 - CITY
      ?auto_59009 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59010 ?auto_59008 ) ( IN-CITY ?auto_59008 ?auto_59011 ) ( IN-CITY ?auto_59003 ?auto_59011 ) ( not ( = ?auto_59003 ?auto_59008 ) ) ( OBJ-AT ?auto_59009 ?auto_59003 ) ( not ( = ?auto_59009 ?auto_59005 ) ) ( OBJ-AT ?auto_59005 ?auto_59008 ) ( OBJ-AT ?auto_59004 ?auto_59003 ) ( OBJ-AT ?auto_59006 ?auto_59003 ) ( OBJ-AT ?auto_59007 ?auto_59003 ) ( not ( = ?auto_59004 ?auto_59005 ) ) ( not ( = ?auto_59004 ?auto_59006 ) ) ( not ( = ?auto_59004 ?auto_59007 ) ) ( not ( = ?auto_59004 ?auto_59009 ) ) ( not ( = ?auto_59005 ?auto_59006 ) ) ( not ( = ?auto_59005 ?auto_59007 ) ) ( not ( = ?auto_59006 ?auto_59007 ) ) ( not ( = ?auto_59006 ?auto_59009 ) ) ( not ( = ?auto_59007 ?auto_59009 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59009 ?auto_59005 ?auto_59003 )
      ( DELIVER-4PKG-VERIFY ?auto_59004 ?auto_59005 ?auto_59006 ?auto_59007 ?auto_59003 ) )
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
      ?auto_59053 - TRUCK
      ?auto_59052 - LOCATION
      ?auto_59054 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59053 ?auto_59052 ) ( IN-CITY ?auto_59052 ?auto_59054 ) ( IN-CITY ?auto_59047 ?auto_59054 ) ( not ( = ?auto_59047 ?auto_59052 ) ) ( OBJ-AT ?auto_59051 ?auto_59047 ) ( not ( = ?auto_59051 ?auto_59048 ) ) ( OBJ-AT ?auto_59048 ?auto_59052 ) ( OBJ-AT ?auto_59049 ?auto_59047 ) ( OBJ-AT ?auto_59050 ?auto_59047 ) ( not ( = ?auto_59048 ?auto_59049 ) ) ( not ( = ?auto_59048 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59050 ) ) ( not ( = ?auto_59049 ?auto_59051 ) ) ( not ( = ?auto_59050 ?auto_59051 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59051 ?auto_59048 ?auto_59047 )
      ( DELIVER-4PKG-VERIFY ?auto_59048 ?auto_59049 ?auto_59050 ?auto_59051 ?auto_59047 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59080 - OBJ
      ?auto_59081 - OBJ
      ?auto_59082 - OBJ
      ?auto_59083 - OBJ
      ?auto_59079 - LOCATION
    )
    :vars
    (
      ?auto_59085 - TRUCK
      ?auto_59084 - LOCATION
      ?auto_59086 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59085 ?auto_59084 ) ( IN-CITY ?auto_59084 ?auto_59086 ) ( IN-CITY ?auto_59079 ?auto_59086 ) ( not ( = ?auto_59079 ?auto_59084 ) ) ( OBJ-AT ?auto_59081 ?auto_59079 ) ( not ( = ?auto_59081 ?auto_59080 ) ) ( OBJ-AT ?auto_59080 ?auto_59084 ) ( OBJ-AT ?auto_59082 ?auto_59079 ) ( OBJ-AT ?auto_59083 ?auto_59079 ) ( not ( = ?auto_59080 ?auto_59082 ) ) ( not ( = ?auto_59080 ?auto_59083 ) ) ( not ( = ?auto_59081 ?auto_59082 ) ) ( not ( = ?auto_59081 ?auto_59083 ) ) ( not ( = ?auto_59082 ?auto_59083 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59081 ?auto_59080 ?auto_59079 )
      ( DELIVER-4PKG-VERIFY ?auto_59080 ?auto_59081 ?auto_59082 ?auto_59083 ?auto_59079 ) )
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
      ?auto_59158 - TRUCK
      ?auto_59156 - LOCATION
      ?auto_59159 - CITY
      ?auto_59157 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_59158 ?auto_59156 ) ( IN-CITY ?auto_59156 ?auto_59159 ) ( IN-CITY ?auto_59151 ?auto_59159 ) ( not ( = ?auto_59151 ?auto_59156 ) ) ( OBJ-AT ?auto_59157 ?auto_59151 ) ( not ( = ?auto_59157 ?auto_59152 ) ) ( OBJ-AT ?auto_59152 ?auto_59156 ) ( OBJ-AT ?auto_59153 ?auto_59151 ) ( OBJ-AT ?auto_59154 ?auto_59151 ) ( OBJ-AT ?auto_59155 ?auto_59151 ) ( not ( = ?auto_59152 ?auto_59153 ) ) ( not ( = ?auto_59152 ?auto_59154 ) ) ( not ( = ?auto_59152 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59154 ) ) ( not ( = ?auto_59153 ?auto_59155 ) ) ( not ( = ?auto_59153 ?auto_59157 ) ) ( not ( = ?auto_59154 ?auto_59155 ) ) ( not ( = ?auto_59154 ?auto_59157 ) ) ( not ( = ?auto_59155 ?auto_59157 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59157 ?auto_59152 ?auto_59151 )
      ( DELIVER-4PKG-VERIFY ?auto_59152 ?auto_59153 ?auto_59154 ?auto_59155 ?auto_59151 ) )
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
      ?auto_59318 - CITY
      ?auto_59317 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59319 ?auto_59318 ) ( IN-CITY ?auto_59313 ?auto_59318 ) ( not ( = ?auto_59313 ?auto_59319 ) ) ( OBJ-AT ?auto_59314 ?auto_59313 ) ( not ( = ?auto_59314 ?auto_59315 ) ) ( OBJ-AT ?auto_59315 ?auto_59319 ) ( TRUCK-AT ?auto_59317 ?auto_59313 ) ( OBJ-AT ?auto_59316 ?auto_59313 ) ( not ( = ?auto_59314 ?auto_59316 ) ) ( not ( = ?auto_59315 ?auto_59316 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59314 ?auto_59315 ?auto_59313 )
      ( DELIVER-3PKG-VERIFY ?auto_59314 ?auto_59315 ?auto_59316 ?auto_59313 ) )
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
      ?auto_59341 - OBJ
      ?auto_59339 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59342 ?auto_59340 ) ( IN-CITY ?auto_59335 ?auto_59340 ) ( not ( = ?auto_59335 ?auto_59342 ) ) ( OBJ-AT ?auto_59341 ?auto_59335 ) ( not ( = ?auto_59341 ?auto_59338 ) ) ( OBJ-AT ?auto_59338 ?auto_59342 ) ( TRUCK-AT ?auto_59339 ?auto_59335 ) ( OBJ-AT ?auto_59336 ?auto_59335 ) ( OBJ-AT ?auto_59337 ?auto_59335 ) ( not ( = ?auto_59336 ?auto_59337 ) ) ( not ( = ?auto_59336 ?auto_59338 ) ) ( not ( = ?auto_59336 ?auto_59341 ) ) ( not ( = ?auto_59337 ?auto_59338 ) ) ( not ( = ?auto_59337 ?auto_59341 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59341 ?auto_59338 ?auto_59335 )
      ( DELIVER-3PKG-VERIFY ?auto_59336 ?auto_59337 ?auto_59338 ?auto_59335 ) )
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
      ?auto_59353 - OBJ
      ?auto_59351 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59354 ?auto_59352 ) ( IN-CITY ?auto_59347 ?auto_59352 ) ( not ( = ?auto_59347 ?auto_59354 ) ) ( OBJ-AT ?auto_59353 ?auto_59347 ) ( not ( = ?auto_59353 ?auto_59349 ) ) ( OBJ-AT ?auto_59349 ?auto_59354 ) ( TRUCK-AT ?auto_59351 ?auto_59347 ) ( OBJ-AT ?auto_59348 ?auto_59347 ) ( OBJ-AT ?auto_59350 ?auto_59347 ) ( not ( = ?auto_59348 ?auto_59349 ) ) ( not ( = ?auto_59348 ?auto_59350 ) ) ( not ( = ?auto_59348 ?auto_59353 ) ) ( not ( = ?auto_59349 ?auto_59350 ) ) ( not ( = ?auto_59350 ?auto_59353 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59353 ?auto_59349 ?auto_59347 )
      ( DELIVER-3PKG-VERIFY ?auto_59348 ?auto_59349 ?auto_59350 ?auto_59347 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_59364 - OBJ
      ?auto_59365 - OBJ
      ?auto_59366 - OBJ
      ?auto_59363 - LOCATION
    )
    :vars
    (
      ?auto_59369 - LOCATION
      ?auto_59368 - CITY
      ?auto_59367 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59369 ?auto_59368 ) ( IN-CITY ?auto_59363 ?auto_59368 ) ( not ( = ?auto_59363 ?auto_59369 ) ) ( OBJ-AT ?auto_59365 ?auto_59363 ) ( not ( = ?auto_59365 ?auto_59364 ) ) ( OBJ-AT ?auto_59364 ?auto_59369 ) ( TRUCK-AT ?auto_59367 ?auto_59363 ) ( OBJ-AT ?auto_59366 ?auto_59363 ) ( not ( = ?auto_59364 ?auto_59366 ) ) ( not ( = ?auto_59365 ?auto_59366 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59365 ?auto_59364 ?auto_59363 )
      ( DELIVER-3PKG-VERIFY ?auto_59364 ?auto_59365 ?auto_59366 ?auto_59363 ) )
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
      ?auto_59391 - OBJ
      ?auto_59389 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59392 ?auto_59390 ) ( IN-CITY ?auto_59385 ?auto_59390 ) ( not ( = ?auto_59385 ?auto_59392 ) ) ( OBJ-AT ?auto_59391 ?auto_59385 ) ( not ( = ?auto_59391 ?auto_59386 ) ) ( OBJ-AT ?auto_59386 ?auto_59392 ) ( TRUCK-AT ?auto_59389 ?auto_59385 ) ( OBJ-AT ?auto_59387 ?auto_59385 ) ( OBJ-AT ?auto_59388 ?auto_59385 ) ( not ( = ?auto_59386 ?auto_59387 ) ) ( not ( = ?auto_59386 ?auto_59388 ) ) ( not ( = ?auto_59387 ?auto_59388 ) ) ( not ( = ?auto_59387 ?auto_59391 ) ) ( not ( = ?auto_59388 ?auto_59391 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59391 ?auto_59386 ?auto_59385 )
      ( DELIVER-3PKG-VERIFY ?auto_59386 ?auto_59387 ?auto_59388 ?auto_59385 ) )
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
      ?auto_59430 - CITY
      ?auto_59429 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59431 ?auto_59430 ) ( IN-CITY ?auto_59424 ?auto_59430 ) ( not ( = ?auto_59424 ?auto_59431 ) ) ( OBJ-AT ?auto_59426 ?auto_59424 ) ( not ( = ?auto_59426 ?auto_59428 ) ) ( OBJ-AT ?auto_59428 ?auto_59431 ) ( TRUCK-AT ?auto_59429 ?auto_59424 ) ( OBJ-AT ?auto_59425 ?auto_59424 ) ( OBJ-AT ?auto_59427 ?auto_59424 ) ( not ( = ?auto_59425 ?auto_59426 ) ) ( not ( = ?auto_59425 ?auto_59427 ) ) ( not ( = ?auto_59425 ?auto_59428 ) ) ( not ( = ?auto_59426 ?auto_59427 ) ) ( not ( = ?auto_59427 ?auto_59428 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59426 ?auto_59428 ?auto_59424 )
      ( DELIVER-4PKG-VERIFY ?auto_59425 ?auto_59426 ?auto_59427 ?auto_59428 ?auto_59424 ) )
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
      ?auto_59446 - CITY
      ?auto_59445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59447 ?auto_59446 ) ( IN-CITY ?auto_59440 ?auto_59446 ) ( not ( = ?auto_59440 ?auto_59447 ) ) ( OBJ-AT ?auto_59442 ?auto_59440 ) ( not ( = ?auto_59442 ?auto_59443 ) ) ( OBJ-AT ?auto_59443 ?auto_59447 ) ( TRUCK-AT ?auto_59445 ?auto_59440 ) ( OBJ-AT ?auto_59441 ?auto_59440 ) ( OBJ-AT ?auto_59444 ?auto_59440 ) ( not ( = ?auto_59441 ?auto_59442 ) ) ( not ( = ?auto_59441 ?auto_59443 ) ) ( not ( = ?auto_59441 ?auto_59444 ) ) ( not ( = ?auto_59442 ?auto_59444 ) ) ( not ( = ?auto_59443 ?auto_59444 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59442 ?auto_59443 ?auto_59440 )
      ( DELIVER-4PKG-VERIFY ?auto_59441 ?auto_59442 ?auto_59443 ?auto_59444 ?auto_59440 ) )
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
      ?auto_59510 - CITY
      ?auto_59509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59511 ?auto_59510 ) ( IN-CITY ?auto_59504 ?auto_59510 ) ( not ( = ?auto_59504 ?auto_59511 ) ) ( OBJ-AT ?auto_59505 ?auto_59504 ) ( not ( = ?auto_59505 ?auto_59506 ) ) ( OBJ-AT ?auto_59506 ?auto_59511 ) ( TRUCK-AT ?auto_59509 ?auto_59504 ) ( OBJ-AT ?auto_59507 ?auto_59504 ) ( OBJ-AT ?auto_59508 ?auto_59504 ) ( not ( = ?auto_59505 ?auto_59507 ) ) ( not ( = ?auto_59505 ?auto_59508 ) ) ( not ( = ?auto_59506 ?auto_59507 ) ) ( not ( = ?auto_59506 ?auto_59508 ) ) ( not ( = ?auto_59507 ?auto_59508 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59505 ?auto_59506 ?auto_59504 )
      ( DELIVER-4PKG-VERIFY ?auto_59505 ?auto_59506 ?auto_59507 ?auto_59508 ?auto_59504 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59513 - OBJ
      ?auto_59514 - OBJ
      ?auto_59515 - OBJ
      ?auto_59516 - OBJ
      ?auto_59512 - LOCATION
    )
    :vars
    (
      ?auto_59519 - LOCATION
      ?auto_59518 - CITY
      ?auto_59517 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59519 ?auto_59518 ) ( IN-CITY ?auto_59512 ?auto_59518 ) ( not ( = ?auto_59512 ?auto_59519 ) ) ( OBJ-AT ?auto_59515 ?auto_59512 ) ( not ( = ?auto_59515 ?auto_59514 ) ) ( OBJ-AT ?auto_59514 ?auto_59519 ) ( TRUCK-AT ?auto_59517 ?auto_59512 ) ( OBJ-AT ?auto_59513 ?auto_59512 ) ( OBJ-AT ?auto_59516 ?auto_59512 ) ( not ( = ?auto_59513 ?auto_59514 ) ) ( not ( = ?auto_59513 ?auto_59515 ) ) ( not ( = ?auto_59513 ?auto_59516 ) ) ( not ( = ?auto_59514 ?auto_59516 ) ) ( not ( = ?auto_59515 ?auto_59516 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59515 ?auto_59514 ?auto_59512 )
      ( DELIVER-4PKG-VERIFY ?auto_59513 ?auto_59514 ?auto_59515 ?auto_59516 ?auto_59512 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59617 - OBJ
      ?auto_59618 - OBJ
      ?auto_59619 - OBJ
      ?auto_59620 - OBJ
      ?auto_59616 - LOCATION
    )
    :vars
    (
      ?auto_59623 - LOCATION
      ?auto_59622 - CITY
      ?auto_59621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59623 ?auto_59622 ) ( IN-CITY ?auto_59616 ?auto_59622 ) ( not ( = ?auto_59616 ?auto_59623 ) ) ( OBJ-AT ?auto_59619 ?auto_59616 ) ( not ( = ?auto_59619 ?auto_59620 ) ) ( OBJ-AT ?auto_59620 ?auto_59623 ) ( TRUCK-AT ?auto_59621 ?auto_59616 ) ( OBJ-AT ?auto_59617 ?auto_59616 ) ( OBJ-AT ?auto_59618 ?auto_59616 ) ( not ( = ?auto_59617 ?auto_59618 ) ) ( not ( = ?auto_59617 ?auto_59619 ) ) ( not ( = ?auto_59617 ?auto_59620 ) ) ( not ( = ?auto_59618 ?auto_59619 ) ) ( not ( = ?auto_59618 ?auto_59620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59619 ?auto_59620 ?auto_59616 )
      ( DELIVER-4PKG-VERIFY ?auto_59617 ?auto_59618 ?auto_59619 ?auto_59620 ?auto_59616 ) )
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
      ?auto_59631 - OBJ
      ?auto_59629 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59632 ?auto_59630 ) ( IN-CITY ?auto_59624 ?auto_59630 ) ( not ( = ?auto_59624 ?auto_59632 ) ) ( OBJ-AT ?auto_59631 ?auto_59624 ) ( not ( = ?auto_59631 ?auto_59628 ) ) ( OBJ-AT ?auto_59628 ?auto_59632 ) ( TRUCK-AT ?auto_59629 ?auto_59624 ) ( OBJ-AT ?auto_59625 ?auto_59624 ) ( OBJ-AT ?auto_59626 ?auto_59624 ) ( OBJ-AT ?auto_59627 ?auto_59624 ) ( not ( = ?auto_59625 ?auto_59626 ) ) ( not ( = ?auto_59625 ?auto_59627 ) ) ( not ( = ?auto_59625 ?auto_59628 ) ) ( not ( = ?auto_59625 ?auto_59631 ) ) ( not ( = ?auto_59626 ?auto_59627 ) ) ( not ( = ?auto_59626 ?auto_59628 ) ) ( not ( = ?auto_59626 ?auto_59631 ) ) ( not ( = ?auto_59627 ?auto_59628 ) ) ( not ( = ?auto_59627 ?auto_59631 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59631 ?auto_59628 ?auto_59624 )
      ( DELIVER-4PKG-VERIFY ?auto_59625 ?auto_59626 ?auto_59627 ?auto_59628 ?auto_59624 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_59634 - OBJ
      ?auto_59635 - OBJ
      ?auto_59636 - OBJ
      ?auto_59637 - OBJ
      ?auto_59633 - LOCATION
    )
    :vars
    (
      ?auto_59640 - LOCATION
      ?auto_59639 - CITY
      ?auto_59638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59640 ?auto_59639 ) ( IN-CITY ?auto_59633 ?auto_59639 ) ( not ( = ?auto_59633 ?auto_59640 ) ) ( OBJ-AT ?auto_59637 ?auto_59633 ) ( not ( = ?auto_59637 ?auto_59636 ) ) ( OBJ-AT ?auto_59636 ?auto_59640 ) ( TRUCK-AT ?auto_59638 ?auto_59633 ) ( OBJ-AT ?auto_59634 ?auto_59633 ) ( OBJ-AT ?auto_59635 ?auto_59633 ) ( not ( = ?auto_59634 ?auto_59635 ) ) ( not ( = ?auto_59634 ?auto_59636 ) ) ( not ( = ?auto_59634 ?auto_59637 ) ) ( not ( = ?auto_59635 ?auto_59636 ) ) ( not ( = ?auto_59635 ?auto_59637 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59637 ?auto_59636 ?auto_59633 )
      ( DELIVER-4PKG-VERIFY ?auto_59634 ?auto_59635 ?auto_59636 ?auto_59637 ?auto_59633 ) )
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
      ?auto_59648 - OBJ
      ?auto_59646 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59649 ?auto_59647 ) ( IN-CITY ?auto_59641 ?auto_59647 ) ( not ( = ?auto_59641 ?auto_59649 ) ) ( OBJ-AT ?auto_59648 ?auto_59641 ) ( not ( = ?auto_59648 ?auto_59644 ) ) ( OBJ-AT ?auto_59644 ?auto_59649 ) ( TRUCK-AT ?auto_59646 ?auto_59641 ) ( OBJ-AT ?auto_59642 ?auto_59641 ) ( OBJ-AT ?auto_59643 ?auto_59641 ) ( OBJ-AT ?auto_59645 ?auto_59641 ) ( not ( = ?auto_59642 ?auto_59643 ) ) ( not ( = ?auto_59642 ?auto_59644 ) ) ( not ( = ?auto_59642 ?auto_59645 ) ) ( not ( = ?auto_59642 ?auto_59648 ) ) ( not ( = ?auto_59643 ?auto_59644 ) ) ( not ( = ?auto_59643 ?auto_59645 ) ) ( not ( = ?auto_59643 ?auto_59648 ) ) ( not ( = ?auto_59644 ?auto_59645 ) ) ( not ( = ?auto_59645 ?auto_59648 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59648 ?auto_59644 ?auto_59641 )
      ( DELIVER-4PKG-VERIFY ?auto_59642 ?auto_59643 ?auto_59644 ?auto_59645 ?auto_59641 ) )
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
      ?auto_59698 - OBJ
      ?auto_59696 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59699 ?auto_59697 ) ( IN-CITY ?auto_59691 ?auto_59697 ) ( not ( = ?auto_59691 ?auto_59699 ) ) ( OBJ-AT ?auto_59698 ?auto_59691 ) ( not ( = ?auto_59698 ?auto_59693 ) ) ( OBJ-AT ?auto_59693 ?auto_59699 ) ( TRUCK-AT ?auto_59696 ?auto_59691 ) ( OBJ-AT ?auto_59692 ?auto_59691 ) ( OBJ-AT ?auto_59694 ?auto_59691 ) ( OBJ-AT ?auto_59695 ?auto_59691 ) ( not ( = ?auto_59692 ?auto_59693 ) ) ( not ( = ?auto_59692 ?auto_59694 ) ) ( not ( = ?auto_59692 ?auto_59695 ) ) ( not ( = ?auto_59692 ?auto_59698 ) ) ( not ( = ?auto_59693 ?auto_59694 ) ) ( not ( = ?auto_59693 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59695 ) ) ( not ( = ?auto_59694 ?auto_59698 ) ) ( not ( = ?auto_59695 ?auto_59698 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59698 ?auto_59693 ?auto_59691 )
      ( DELIVER-4PKG-VERIFY ?auto_59692 ?auto_59693 ?auto_59694 ?auto_59695 ?auto_59691 ) )
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
      ?auto_59741 - CITY
      ?auto_59740 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59742 ?auto_59741 ) ( IN-CITY ?auto_59735 ?auto_59741 ) ( not ( = ?auto_59735 ?auto_59742 ) ) ( OBJ-AT ?auto_59738 ?auto_59735 ) ( not ( = ?auto_59738 ?auto_59736 ) ) ( OBJ-AT ?auto_59736 ?auto_59742 ) ( TRUCK-AT ?auto_59740 ?auto_59735 ) ( OBJ-AT ?auto_59737 ?auto_59735 ) ( OBJ-AT ?auto_59739 ?auto_59735 ) ( not ( = ?auto_59736 ?auto_59737 ) ) ( not ( = ?auto_59736 ?auto_59739 ) ) ( not ( = ?auto_59737 ?auto_59738 ) ) ( not ( = ?auto_59737 ?auto_59739 ) ) ( not ( = ?auto_59738 ?auto_59739 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59738 ?auto_59736 ?auto_59735 )
      ( DELIVER-4PKG-VERIFY ?auto_59736 ?auto_59737 ?auto_59738 ?auto_59739 ?auto_59735 ) )
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
      ?auto_59765 - CITY
      ?auto_59764 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59766 ?auto_59765 ) ( IN-CITY ?auto_59759 ?auto_59765 ) ( not ( = ?auto_59759 ?auto_59766 ) ) ( OBJ-AT ?auto_59763 ?auto_59759 ) ( not ( = ?auto_59763 ?auto_59760 ) ) ( OBJ-AT ?auto_59760 ?auto_59766 ) ( TRUCK-AT ?auto_59764 ?auto_59759 ) ( OBJ-AT ?auto_59761 ?auto_59759 ) ( OBJ-AT ?auto_59762 ?auto_59759 ) ( not ( = ?auto_59760 ?auto_59761 ) ) ( not ( = ?auto_59760 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59762 ) ) ( not ( = ?auto_59761 ?auto_59763 ) ) ( not ( = ?auto_59762 ?auto_59763 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59763 ?auto_59760 ?auto_59759 )
      ( DELIVER-4PKG-VERIFY ?auto_59760 ?auto_59761 ?auto_59762 ?auto_59763 ?auto_59759 ) )
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
      ?auto_59846 - OBJ
      ?auto_59844 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59847 ?auto_59845 ) ( IN-CITY ?auto_59839 ?auto_59845 ) ( not ( = ?auto_59839 ?auto_59847 ) ) ( OBJ-AT ?auto_59846 ?auto_59839 ) ( not ( = ?auto_59846 ?auto_59840 ) ) ( OBJ-AT ?auto_59840 ?auto_59847 ) ( TRUCK-AT ?auto_59844 ?auto_59839 ) ( OBJ-AT ?auto_59841 ?auto_59839 ) ( OBJ-AT ?auto_59842 ?auto_59839 ) ( OBJ-AT ?auto_59843 ?auto_59839 ) ( not ( = ?auto_59840 ?auto_59841 ) ) ( not ( = ?auto_59840 ?auto_59842 ) ) ( not ( = ?auto_59840 ?auto_59843 ) ) ( not ( = ?auto_59841 ?auto_59842 ) ) ( not ( = ?auto_59841 ?auto_59843 ) ) ( not ( = ?auto_59841 ?auto_59846 ) ) ( not ( = ?auto_59842 ?auto_59843 ) ) ( not ( = ?auto_59842 ?auto_59846 ) ) ( not ( = ?auto_59843 ?auto_59846 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59846 ?auto_59840 ?auto_59839 )
      ( DELIVER-4PKG-VERIFY ?auto_59840 ?auto_59841 ?auto_59842 ?auto_59843 ?auto_59839 ) )
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
      ?auto_59992 - LOCATION
      ?auto_59993 - CITY
      ?auto_59994 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_59992 ?auto_59993 ) ( IN-CITY ?auto_59988 ?auto_59993 ) ( not ( = ?auto_59988 ?auto_59992 ) ) ( OBJ-AT ?auto_59989 ?auto_59988 ) ( not ( = ?auto_59989 ?auto_59991 ) ) ( OBJ-AT ?auto_59991 ?auto_59992 ) ( TRUCK-AT ?auto_59994 ?auto_59988 ) ( OBJ-AT ?auto_59990 ?auto_59988 ) ( not ( = ?auto_59989 ?auto_59990 ) ) ( not ( = ?auto_59990 ?auto_59991 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_59989 ?auto_59991 ?auto_59988 )
      ( DELIVER-3PKG-VERIFY ?auto_59989 ?auto_59990 ?auto_59991 ?auto_59988 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_60664 - OBJ
      ?auto_60663 - LOCATION
    )
    :vars
    (
      ?auto_60666 - LOCATION
      ?auto_60667 - CITY
      ?auto_60665 - OBJ
      ?auto_60668 - TRUCK
      ?auto_60669 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60666 ?auto_60667 ) ( IN-CITY ?auto_60663 ?auto_60667 ) ( not ( = ?auto_60663 ?auto_60666 ) ) ( OBJ-AT ?auto_60665 ?auto_60663 ) ( not ( = ?auto_60665 ?auto_60664 ) ) ( OBJ-AT ?auto_60664 ?auto_60666 ) ( TRUCK-AT ?auto_60668 ?auto_60669 ) ( IN-CITY ?auto_60669 ?auto_60667 ) ( not ( = ?auto_60663 ?auto_60669 ) ) ( not ( = ?auto_60666 ?auto_60669 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_60668 ?auto_60669 ?auto_60663 ?auto_60667 )
      ( DELIVER-2PKG ?auto_60665 ?auto_60664 ?auto_60663 )
      ( DELIVER-1PKG-VERIFY ?auto_60664 ?auto_60663 ) )
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
      ?auto_60676 - LOCATION
      ?auto_60673 - CITY
      ?auto_60674 - TRUCK
      ?auto_60675 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60676 ?auto_60673 ) ( IN-CITY ?auto_60670 ?auto_60673 ) ( not ( = ?auto_60670 ?auto_60676 ) ) ( OBJ-AT ?auto_60671 ?auto_60670 ) ( not ( = ?auto_60671 ?auto_60672 ) ) ( OBJ-AT ?auto_60672 ?auto_60676 ) ( TRUCK-AT ?auto_60674 ?auto_60675 ) ( IN-CITY ?auto_60675 ?auto_60673 ) ( not ( = ?auto_60670 ?auto_60675 ) ) ( not ( = ?auto_60676 ?auto_60675 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_60672 ?auto_60670 )
      ( DELIVER-2PKG-VERIFY ?auto_60671 ?auto_60672 ?auto_60670 ) )
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
      ?auto_60691 - LOCATION
      ?auto_60689 - CITY
      ?auto_60690 - TRUCK
      ?auto_60688 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60691 ?auto_60689 ) ( IN-CITY ?auto_60685 ?auto_60689 ) ( not ( = ?auto_60685 ?auto_60691 ) ) ( OBJ-AT ?auto_60687 ?auto_60685 ) ( not ( = ?auto_60687 ?auto_60686 ) ) ( OBJ-AT ?auto_60686 ?auto_60691 ) ( TRUCK-AT ?auto_60690 ?auto_60688 ) ( IN-CITY ?auto_60688 ?auto_60689 ) ( not ( = ?auto_60685 ?auto_60688 ) ) ( not ( = ?auto_60691 ?auto_60688 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60687 ?auto_60686 ?auto_60685 )
      ( DELIVER-2PKG-VERIFY ?auto_60686 ?auto_60687 ?auto_60685 ) )
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
      ?auto_60715 - LOCATION
      ?auto_60713 - CITY
      ?auto_60714 - TRUCK
      ?auto_60712 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60715 ?auto_60713 ) ( IN-CITY ?auto_60708 ?auto_60713 ) ( not ( = ?auto_60708 ?auto_60715 ) ) ( OBJ-AT ?auto_60710 ?auto_60708 ) ( not ( = ?auto_60710 ?auto_60711 ) ) ( OBJ-AT ?auto_60711 ?auto_60715 ) ( TRUCK-AT ?auto_60714 ?auto_60712 ) ( IN-CITY ?auto_60712 ?auto_60713 ) ( not ( = ?auto_60708 ?auto_60712 ) ) ( not ( = ?auto_60715 ?auto_60712 ) ) ( OBJ-AT ?auto_60709 ?auto_60708 ) ( not ( = ?auto_60709 ?auto_60710 ) ) ( not ( = ?auto_60709 ?auto_60711 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60710 ?auto_60711 ?auto_60708 )
      ( DELIVER-3PKG-VERIFY ?auto_60709 ?auto_60710 ?auto_60711 ?auto_60708 ) )
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
      ?auto_60731 - LOCATION
      ?auto_60729 - CITY
      ?auto_60730 - TRUCK
      ?auto_60728 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60731 ?auto_60729 ) ( IN-CITY ?auto_60724 ?auto_60729 ) ( not ( = ?auto_60724 ?auto_60731 ) ) ( OBJ-AT ?auto_60727 ?auto_60724 ) ( not ( = ?auto_60727 ?auto_60726 ) ) ( OBJ-AT ?auto_60726 ?auto_60731 ) ( TRUCK-AT ?auto_60730 ?auto_60728 ) ( IN-CITY ?auto_60728 ?auto_60729 ) ( not ( = ?auto_60724 ?auto_60728 ) ) ( not ( = ?auto_60731 ?auto_60728 ) ) ( OBJ-AT ?auto_60725 ?auto_60724 ) ( not ( = ?auto_60725 ?auto_60726 ) ) ( not ( = ?auto_60725 ?auto_60727 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60727 ?auto_60726 ?auto_60724 )
      ( DELIVER-3PKG-VERIFY ?auto_60725 ?auto_60726 ?auto_60727 ?auto_60724 ) )
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
      ?auto_60798 - LOCATION
      ?auto_60796 - CITY
      ?auto_60797 - TRUCK
      ?auto_60795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60798 ?auto_60796 ) ( IN-CITY ?auto_60791 ?auto_60796 ) ( not ( = ?auto_60791 ?auto_60798 ) ) ( OBJ-AT ?auto_60794 ?auto_60791 ) ( not ( = ?auto_60794 ?auto_60792 ) ) ( OBJ-AT ?auto_60792 ?auto_60798 ) ( TRUCK-AT ?auto_60797 ?auto_60795 ) ( IN-CITY ?auto_60795 ?auto_60796 ) ( not ( = ?auto_60791 ?auto_60795 ) ) ( not ( = ?auto_60798 ?auto_60795 ) ) ( OBJ-AT ?auto_60793 ?auto_60791 ) ( not ( = ?auto_60792 ?auto_60793 ) ) ( not ( = ?auto_60793 ?auto_60794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60794 ?auto_60792 ?auto_60791 )
      ( DELIVER-3PKG-VERIFY ?auto_60792 ?auto_60793 ?auto_60794 ?auto_60791 ) )
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
      ?auto_60875 - LOCATION
      ?auto_60873 - CITY
      ?auto_60874 - TRUCK
      ?auto_60872 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60875 ?auto_60873 ) ( IN-CITY ?auto_60867 ?auto_60873 ) ( not ( = ?auto_60867 ?auto_60875 ) ) ( OBJ-AT ?auto_60868 ?auto_60867 ) ( not ( = ?auto_60868 ?auto_60871 ) ) ( OBJ-AT ?auto_60871 ?auto_60875 ) ( TRUCK-AT ?auto_60874 ?auto_60872 ) ( IN-CITY ?auto_60872 ?auto_60873 ) ( not ( = ?auto_60867 ?auto_60872 ) ) ( not ( = ?auto_60875 ?auto_60872 ) ) ( OBJ-AT ?auto_60869 ?auto_60867 ) ( OBJ-AT ?auto_60870 ?auto_60867 ) ( not ( = ?auto_60868 ?auto_60869 ) ) ( not ( = ?auto_60868 ?auto_60870 ) ) ( not ( = ?auto_60869 ?auto_60870 ) ) ( not ( = ?auto_60869 ?auto_60871 ) ) ( not ( = ?auto_60870 ?auto_60871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60868 ?auto_60871 ?auto_60867 )
      ( DELIVER-4PKG-VERIFY ?auto_60868 ?auto_60869 ?auto_60870 ?auto_60871 ?auto_60867 ) )
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
      ?auto_60893 - LOCATION
      ?auto_60891 - CITY
      ?auto_60892 - TRUCK
      ?auto_60890 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60893 ?auto_60891 ) ( IN-CITY ?auto_60885 ?auto_60891 ) ( not ( = ?auto_60885 ?auto_60893 ) ) ( OBJ-AT ?auto_60886 ?auto_60885 ) ( not ( = ?auto_60886 ?auto_60888 ) ) ( OBJ-AT ?auto_60888 ?auto_60893 ) ( TRUCK-AT ?auto_60892 ?auto_60890 ) ( IN-CITY ?auto_60890 ?auto_60891 ) ( not ( = ?auto_60885 ?auto_60890 ) ) ( not ( = ?auto_60893 ?auto_60890 ) ) ( OBJ-AT ?auto_60887 ?auto_60885 ) ( OBJ-AT ?auto_60889 ?auto_60885 ) ( not ( = ?auto_60886 ?auto_60887 ) ) ( not ( = ?auto_60886 ?auto_60889 ) ) ( not ( = ?auto_60887 ?auto_60888 ) ) ( not ( = ?auto_60887 ?auto_60889 ) ) ( not ( = ?auto_60888 ?auto_60889 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60886 ?auto_60888 ?auto_60885 )
      ( DELIVER-4PKG-VERIFY ?auto_60886 ?auto_60887 ?auto_60888 ?auto_60889 ?auto_60885 ) )
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
      ?auto_60965 - LOCATION
      ?auto_60963 - CITY
      ?auto_60964 - TRUCK
      ?auto_60962 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_60965 ?auto_60963 ) ( IN-CITY ?auto_60957 ?auto_60963 ) ( not ( = ?auto_60957 ?auto_60965 ) ) ( OBJ-AT ?auto_60958 ?auto_60957 ) ( not ( = ?auto_60958 ?auto_60959 ) ) ( OBJ-AT ?auto_60959 ?auto_60965 ) ( TRUCK-AT ?auto_60964 ?auto_60962 ) ( IN-CITY ?auto_60962 ?auto_60963 ) ( not ( = ?auto_60957 ?auto_60962 ) ) ( not ( = ?auto_60965 ?auto_60962 ) ) ( OBJ-AT ?auto_60960 ?auto_60957 ) ( OBJ-AT ?auto_60961 ?auto_60957 ) ( not ( = ?auto_60958 ?auto_60960 ) ) ( not ( = ?auto_60958 ?auto_60961 ) ) ( not ( = ?auto_60959 ?auto_60960 ) ) ( not ( = ?auto_60959 ?auto_60961 ) ) ( not ( = ?auto_60960 ?auto_60961 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_60958 ?auto_60959 ?auto_60957 )
      ( DELIVER-4PKG-VERIFY ?auto_60958 ?auto_60959 ?auto_60960 ?auto_60961 ?auto_60957 ) )
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
      ?auto_61224 - LOCATION
      ?auto_61222 - CITY
      ?auto_61223 - TRUCK
      ?auto_61221 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61224 ?auto_61222 ) ( IN-CITY ?auto_61216 ?auto_61222 ) ( not ( = ?auto_61216 ?auto_61224 ) ) ( OBJ-AT ?auto_61219 ?auto_61216 ) ( not ( = ?auto_61219 ?auto_61217 ) ) ( OBJ-AT ?auto_61217 ?auto_61224 ) ( TRUCK-AT ?auto_61223 ?auto_61221 ) ( IN-CITY ?auto_61221 ?auto_61222 ) ( not ( = ?auto_61216 ?auto_61221 ) ) ( not ( = ?auto_61224 ?auto_61221 ) ) ( OBJ-AT ?auto_61218 ?auto_61216 ) ( OBJ-AT ?auto_61220 ?auto_61216 ) ( not ( = ?auto_61217 ?auto_61218 ) ) ( not ( = ?auto_61217 ?auto_61220 ) ) ( not ( = ?auto_61218 ?auto_61219 ) ) ( not ( = ?auto_61218 ?auto_61220 ) ) ( not ( = ?auto_61219 ?auto_61220 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61219 ?auto_61217 ?auto_61216 )
      ( DELIVER-4PKG-VERIFY ?auto_61217 ?auto_61218 ?auto_61219 ?auto_61220 ?auto_61216 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61500 - OBJ
      ?auto_61501 - OBJ
      ?auto_61502 - OBJ
      ?auto_61499 - LOCATION
    )
    :vars
    (
      ?auto_61506 - LOCATION
      ?auto_61503 - CITY
      ?auto_61505 - TRUCK
      ?auto_61504 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61506 ?auto_61503 ) ( IN-CITY ?auto_61499 ?auto_61503 ) ( not ( = ?auto_61499 ?auto_61506 ) ) ( OBJ-AT ?auto_61500 ?auto_61499 ) ( not ( = ?auto_61500 ?auto_61502 ) ) ( OBJ-AT ?auto_61502 ?auto_61506 ) ( TRUCK-AT ?auto_61505 ?auto_61504 ) ( IN-CITY ?auto_61504 ?auto_61503 ) ( not ( = ?auto_61499 ?auto_61504 ) ) ( not ( = ?auto_61506 ?auto_61504 ) ) ( OBJ-AT ?auto_61501 ?auto_61499 ) ( not ( = ?auto_61500 ?auto_61501 ) ) ( not ( = ?auto_61501 ?auto_61502 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61500 ?auto_61502 ?auto_61499 )
      ( DELIVER-3PKG-VERIFY ?auto_61500 ?auto_61501 ?auto_61502 ?auto_61499 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_61583 - OBJ
      ?auto_61584 - OBJ
      ?auto_61585 - OBJ
      ?auto_61582 - LOCATION
    )
    :vars
    (
      ?auto_61589 - LOCATION
      ?auto_61586 - CITY
      ?auto_61588 - TRUCK
      ?auto_61587 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_61589 ?auto_61586 ) ( IN-CITY ?auto_61582 ?auto_61586 ) ( not ( = ?auto_61582 ?auto_61589 ) ) ( OBJ-AT ?auto_61584 ?auto_61582 ) ( not ( = ?auto_61584 ?auto_61583 ) ) ( OBJ-AT ?auto_61583 ?auto_61589 ) ( TRUCK-AT ?auto_61588 ?auto_61587 ) ( IN-CITY ?auto_61587 ?auto_61586 ) ( not ( = ?auto_61582 ?auto_61587 ) ) ( not ( = ?auto_61589 ?auto_61587 ) ) ( OBJ-AT ?auto_61585 ?auto_61582 ) ( not ( = ?auto_61583 ?auto_61585 ) ) ( not ( = ?auto_61584 ?auto_61585 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_61584 ?auto_61583 ?auto_61582 )
      ( DELIVER-3PKG-VERIFY ?auto_61583 ?auto_61584 ?auto_61585 ?auto_61582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_62008 - OBJ
      ?auto_62009 - OBJ
      ?auto_62010 - OBJ
      ?auto_62011 - OBJ
      ?auto_62007 - LOCATION
    )
    :vars
    (
      ?auto_62015 - LOCATION
      ?auto_62012 - CITY
      ?auto_62014 - TRUCK
      ?auto_62013 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_62015 ?auto_62012 ) ( IN-CITY ?auto_62007 ?auto_62012 ) ( not ( = ?auto_62007 ?auto_62015 ) ) ( OBJ-AT ?auto_62009 ?auto_62007 ) ( not ( = ?auto_62009 ?auto_62008 ) ) ( OBJ-AT ?auto_62008 ?auto_62015 ) ( TRUCK-AT ?auto_62014 ?auto_62013 ) ( IN-CITY ?auto_62013 ?auto_62012 ) ( not ( = ?auto_62007 ?auto_62013 ) ) ( not ( = ?auto_62015 ?auto_62013 ) ) ( OBJ-AT ?auto_62010 ?auto_62007 ) ( OBJ-AT ?auto_62011 ?auto_62007 ) ( not ( = ?auto_62008 ?auto_62010 ) ) ( not ( = ?auto_62008 ?auto_62011 ) ) ( not ( = ?auto_62009 ?auto_62010 ) ) ( not ( = ?auto_62009 ?auto_62011 ) ) ( not ( = ?auto_62010 ?auto_62011 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_62009 ?auto_62008 ?auto_62007 )
      ( DELIVER-4PKG-VERIFY ?auto_62008 ?auto_62009 ?auto_62010 ?auto_62011 ?auto_62007 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_63667 - OBJ
      ?auto_63666 - LOCATION
    )
    :vars
    (
      ?auto_63670 - LOCATION
      ?auto_63671 - CITY
      ?auto_63669 - OBJ
      ?auto_63668 - TRUCK
      ?auto_63672 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63670 ?auto_63671 ) ( IN-CITY ?auto_63666 ?auto_63671 ) ( not ( = ?auto_63666 ?auto_63670 ) ) ( not ( = ?auto_63669 ?auto_63667 ) ) ( OBJ-AT ?auto_63667 ?auto_63670 ) ( IN-TRUCK ?auto_63669 ?auto_63668 ) ( TRUCK-AT ?auto_63668 ?auto_63672 ) ( IN-CITY ?auto_63672 ?auto_63671 ) ( not ( = ?auto_63666 ?auto_63672 ) ) ( not ( = ?auto_63670 ?auto_63672 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_63668 ?auto_63672 ?auto_63666 ?auto_63671 )
      ( DELIVER-2PKG ?auto_63669 ?auto_63667 ?auto_63666 )
      ( DELIVER-1PKG-VERIFY ?auto_63667 ?auto_63666 ) )
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
      ?auto_63678 - LOCATION
      ?auto_63677 - CITY
      ?auto_63679 - TRUCK
      ?auto_63676 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63678 ?auto_63677 ) ( IN-CITY ?auto_63673 ?auto_63677 ) ( not ( = ?auto_63673 ?auto_63678 ) ) ( not ( = ?auto_63674 ?auto_63675 ) ) ( OBJ-AT ?auto_63675 ?auto_63678 ) ( IN-TRUCK ?auto_63674 ?auto_63679 ) ( TRUCK-AT ?auto_63679 ?auto_63676 ) ( IN-CITY ?auto_63676 ?auto_63677 ) ( not ( = ?auto_63673 ?auto_63676 ) ) ( not ( = ?auto_63678 ?auto_63676 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_63675 ?auto_63673 )
      ( DELIVER-2PKG-VERIFY ?auto_63674 ?auto_63675 ?auto_63673 ) )
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
      ?auto_63692 - LOCATION
      ?auto_63693 - CITY
      ?auto_63694 - TRUCK
      ?auto_63691 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_63692 ?auto_63693 ) ( IN-CITY ?auto_63688 ?auto_63693 ) ( not ( = ?auto_63688 ?auto_63692 ) ) ( not ( = ?auto_63690 ?auto_63689 ) ) ( OBJ-AT ?auto_63689 ?auto_63692 ) ( IN-TRUCK ?auto_63690 ?auto_63694 ) ( TRUCK-AT ?auto_63694 ?auto_63691 ) ( IN-CITY ?auto_63691 ?auto_63693 ) ( not ( = ?auto_63688 ?auto_63691 ) ) ( not ( = ?auto_63692 ?auto_63691 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_63690 ?auto_63689 ?auto_63688 )
      ( DELIVER-2PKG-VERIFY ?auto_63689 ?auto_63690 ?auto_63688 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_64471 - OBJ
      ?auto_64470 - LOCATION
    )
    :vars
    (
      ?auto_64474 - LOCATION
      ?auto_64475 - CITY
      ?auto_64472 - OBJ
      ?auto_64476 - TRUCK
      ?auto_64473 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64474 ?auto_64475 ) ( IN-CITY ?auto_64470 ?auto_64475 ) ( not ( = ?auto_64470 ?auto_64474 ) ) ( not ( = ?auto_64472 ?auto_64471 ) ) ( OBJ-AT ?auto_64471 ?auto_64474 ) ( TRUCK-AT ?auto_64476 ?auto_64473 ) ( IN-CITY ?auto_64473 ?auto_64475 ) ( not ( = ?auto_64470 ?auto_64473 ) ) ( not ( = ?auto_64474 ?auto_64473 ) ) ( OBJ-AT ?auto_64472 ?auto_64473 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_64472 ?auto_64476 ?auto_64473 )
      ( DELIVER-2PKG ?auto_64472 ?auto_64471 ?auto_64470 )
      ( DELIVER-1PKG-VERIFY ?auto_64471 ?auto_64470 ) )
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
      ?auto_64482 - LOCATION
      ?auto_64481 - CITY
      ?auto_64480 - TRUCK
      ?auto_64483 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64482 ?auto_64481 ) ( IN-CITY ?auto_64477 ?auto_64481 ) ( not ( = ?auto_64477 ?auto_64482 ) ) ( not ( = ?auto_64478 ?auto_64479 ) ) ( OBJ-AT ?auto_64479 ?auto_64482 ) ( TRUCK-AT ?auto_64480 ?auto_64483 ) ( IN-CITY ?auto_64483 ?auto_64481 ) ( not ( = ?auto_64477 ?auto_64483 ) ) ( not ( = ?auto_64482 ?auto_64483 ) ) ( OBJ-AT ?auto_64478 ?auto_64483 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_64479 ?auto_64477 )
      ( DELIVER-2PKG-VERIFY ?auto_64478 ?auto_64479 ?auto_64477 ) )
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
      ?auto_64492 - LOCATION
      ?auto_64490 - CITY
      ?auto_64491 - TRUCK
      ?auto_64493 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_64492 ?auto_64490 ) ( IN-CITY ?auto_64487 ?auto_64490 ) ( not ( = ?auto_64487 ?auto_64492 ) ) ( not ( = ?auto_64489 ?auto_64488 ) ) ( OBJ-AT ?auto_64488 ?auto_64492 ) ( TRUCK-AT ?auto_64491 ?auto_64493 ) ( IN-CITY ?auto_64493 ?auto_64490 ) ( not ( = ?auto_64487 ?auto_64493 ) ) ( not ( = ?auto_64492 ?auto_64493 ) ) ( OBJ-AT ?auto_64489 ?auto_64493 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_64489 ?auto_64488 ?auto_64487 )
      ( DELIVER-2PKG-VERIFY ?auto_64488 ?auto_64489 ?auto_64487 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_70017 - OBJ
      ?auto_70018 - OBJ
      ?auto_70019 - OBJ
      ?auto_70016 - LOCATION
    )
    :vars
    (
      ?auto_70022 - TRUCK
      ?auto_70020 - LOCATION
      ?auto_70021 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_70022 ?auto_70020 ) ( IN-CITY ?auto_70020 ?auto_70021 ) ( IN-CITY ?auto_70016 ?auto_70021 ) ( not ( = ?auto_70016 ?auto_70020 ) ) ( OBJ-AT ?auto_70019 ?auto_70016 ) ( not ( = ?auto_70019 ?auto_70017 ) ) ( OBJ-AT ?auto_70017 ?auto_70020 ) ( OBJ-AT ?auto_70018 ?auto_70016 ) ( not ( = ?auto_70017 ?auto_70018 ) ) ( not ( = ?auto_70018 ?auto_70019 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_70019 ?auto_70017 ?auto_70016 )
      ( DELIVER-3PKG-VERIFY ?auto_70017 ?auto_70018 ?auto_70019 ?auto_70016 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_74990 - OBJ
      ?auto_74991 - OBJ
      ?auto_74992 - OBJ
      ?auto_74989 - LOCATION
    )
    :vars
    (
      ?auto_74994 - LOCATION
      ?auto_74993 - CITY
      ?auto_74996 - TRUCK
      ?auto_74995 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_74994 ?auto_74993 ) ( IN-CITY ?auto_74989 ?auto_74993 ) ( not ( = ?auto_74989 ?auto_74994 ) ) ( OBJ-AT ?auto_74990 ?auto_74989 ) ( not ( = ?auto_74990 ?auto_74991 ) ) ( OBJ-AT ?auto_74991 ?auto_74994 ) ( TRUCK-AT ?auto_74996 ?auto_74995 ) ( IN-CITY ?auto_74995 ?auto_74993 ) ( not ( = ?auto_74989 ?auto_74995 ) ) ( not ( = ?auto_74994 ?auto_74995 ) ) ( OBJ-AT ?auto_74992 ?auto_74989 ) ( not ( = ?auto_74990 ?auto_74992 ) ) ( not ( = ?auto_74991 ?auto_74992 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_74990 ?auto_74991 ?auto_74989 )
      ( DELIVER-3PKG-VERIFY ?auto_74990 ?auto_74991 ?auto_74992 ?auto_74989 ) )
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
      ?auto_75027 - LOCATION
      ?auto_75026 - CITY
      ?auto_75025 - OBJ
      ?auto_75029 - TRUCK
      ?auto_75028 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75027 ?auto_75026 ) ( IN-CITY ?auto_75021 ?auto_75026 ) ( not ( = ?auto_75021 ?auto_75027 ) ) ( OBJ-AT ?auto_75025 ?auto_75021 ) ( not ( = ?auto_75025 ?auto_75024 ) ) ( OBJ-AT ?auto_75024 ?auto_75027 ) ( TRUCK-AT ?auto_75029 ?auto_75028 ) ( IN-CITY ?auto_75028 ?auto_75026 ) ( not ( = ?auto_75021 ?auto_75028 ) ) ( not ( = ?auto_75027 ?auto_75028 ) ) ( OBJ-AT ?auto_75022 ?auto_75021 ) ( OBJ-AT ?auto_75023 ?auto_75021 ) ( not ( = ?auto_75022 ?auto_75023 ) ) ( not ( = ?auto_75022 ?auto_75024 ) ) ( not ( = ?auto_75022 ?auto_75025 ) ) ( not ( = ?auto_75023 ?auto_75024 ) ) ( not ( = ?auto_75023 ?auto_75025 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75025 ?auto_75024 ?auto_75021 )
      ( DELIVER-3PKG-VERIFY ?auto_75022 ?auto_75023 ?auto_75024 ?auto_75021 ) )
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
      ?auto_75049 - LOCATION
      ?auto_75048 - CITY
      ?auto_75047 - OBJ
      ?auto_75051 - TRUCK
      ?auto_75050 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75049 ?auto_75048 ) ( IN-CITY ?auto_75043 ?auto_75048 ) ( not ( = ?auto_75043 ?auto_75049 ) ) ( OBJ-AT ?auto_75047 ?auto_75043 ) ( not ( = ?auto_75047 ?auto_75045 ) ) ( OBJ-AT ?auto_75045 ?auto_75049 ) ( TRUCK-AT ?auto_75051 ?auto_75050 ) ( IN-CITY ?auto_75050 ?auto_75048 ) ( not ( = ?auto_75043 ?auto_75050 ) ) ( not ( = ?auto_75049 ?auto_75050 ) ) ( OBJ-AT ?auto_75044 ?auto_75043 ) ( OBJ-AT ?auto_75046 ?auto_75043 ) ( not ( = ?auto_75044 ?auto_75045 ) ) ( not ( = ?auto_75044 ?auto_75046 ) ) ( not ( = ?auto_75044 ?auto_75047 ) ) ( not ( = ?auto_75045 ?auto_75046 ) ) ( not ( = ?auto_75046 ?auto_75047 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75047 ?auto_75045 ?auto_75043 )
      ( DELIVER-3PKG-VERIFY ?auto_75044 ?auto_75045 ?auto_75046 ?auto_75043 ) )
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
      ?auto_75169 - LOCATION
      ?auto_75168 - CITY
      ?auto_75167 - OBJ
      ?auto_75171 - TRUCK
      ?auto_75170 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75169 ?auto_75168 ) ( IN-CITY ?auto_75163 ?auto_75168 ) ( not ( = ?auto_75163 ?auto_75169 ) ) ( OBJ-AT ?auto_75167 ?auto_75163 ) ( not ( = ?auto_75167 ?auto_75164 ) ) ( OBJ-AT ?auto_75164 ?auto_75169 ) ( TRUCK-AT ?auto_75171 ?auto_75170 ) ( IN-CITY ?auto_75170 ?auto_75168 ) ( not ( = ?auto_75163 ?auto_75170 ) ) ( not ( = ?auto_75169 ?auto_75170 ) ) ( OBJ-AT ?auto_75165 ?auto_75163 ) ( OBJ-AT ?auto_75166 ?auto_75163 ) ( not ( = ?auto_75164 ?auto_75165 ) ) ( not ( = ?auto_75164 ?auto_75166 ) ) ( not ( = ?auto_75165 ?auto_75166 ) ) ( not ( = ?auto_75165 ?auto_75167 ) ) ( not ( = ?auto_75166 ?auto_75167 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75167 ?auto_75164 ?auto_75163 )
      ( DELIVER-3PKG-VERIFY ?auto_75164 ?auto_75165 ?auto_75166 ?auto_75163 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75261 - OBJ
      ?auto_75262 - OBJ
      ?auto_75263 - OBJ
      ?auto_75264 - OBJ
      ?auto_75260 - LOCATION
    )
    :vars
    (
      ?auto_75266 - LOCATION
      ?auto_75265 - CITY
      ?auto_75268 - TRUCK
      ?auto_75267 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75266 ?auto_75265 ) ( IN-CITY ?auto_75260 ?auto_75265 ) ( not ( = ?auto_75260 ?auto_75266 ) ) ( OBJ-AT ?auto_75262 ?auto_75260 ) ( not ( = ?auto_75262 ?auto_75264 ) ) ( OBJ-AT ?auto_75264 ?auto_75266 ) ( TRUCK-AT ?auto_75268 ?auto_75267 ) ( IN-CITY ?auto_75267 ?auto_75265 ) ( not ( = ?auto_75260 ?auto_75267 ) ) ( not ( = ?auto_75266 ?auto_75267 ) ) ( OBJ-AT ?auto_75261 ?auto_75260 ) ( OBJ-AT ?auto_75263 ?auto_75260 ) ( not ( = ?auto_75261 ?auto_75262 ) ) ( not ( = ?auto_75261 ?auto_75263 ) ) ( not ( = ?auto_75261 ?auto_75264 ) ) ( not ( = ?auto_75262 ?auto_75263 ) ) ( not ( = ?auto_75263 ?auto_75264 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75262 ?auto_75264 ?auto_75260 )
      ( DELIVER-4PKG-VERIFY ?auto_75261 ?auto_75262 ?auto_75263 ?auto_75264 ?auto_75260 ) )
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
      ?auto_75302 - LOCATION
      ?auto_75301 - CITY
      ?auto_75304 - TRUCK
      ?auto_75303 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75302 ?auto_75301 ) ( IN-CITY ?auto_75296 ?auto_75301 ) ( not ( = ?auto_75296 ?auto_75302 ) ) ( OBJ-AT ?auto_75298 ?auto_75296 ) ( not ( = ?auto_75298 ?auto_75299 ) ) ( OBJ-AT ?auto_75299 ?auto_75302 ) ( TRUCK-AT ?auto_75304 ?auto_75303 ) ( IN-CITY ?auto_75303 ?auto_75301 ) ( not ( = ?auto_75296 ?auto_75303 ) ) ( not ( = ?auto_75302 ?auto_75303 ) ) ( OBJ-AT ?auto_75297 ?auto_75296 ) ( OBJ-AT ?auto_75300 ?auto_75296 ) ( not ( = ?auto_75297 ?auto_75298 ) ) ( not ( = ?auto_75297 ?auto_75299 ) ) ( not ( = ?auto_75297 ?auto_75300 ) ) ( not ( = ?auto_75298 ?auto_75300 ) ) ( not ( = ?auto_75299 ?auto_75300 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75298 ?auto_75299 ?auto_75296 )
      ( DELIVER-4PKG-VERIFY ?auto_75297 ?auto_75298 ?auto_75299 ?auto_75300 ?auto_75296 ) )
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
      ?auto_75329 - LOCATION
      ?auto_75328 - CITY
      ?auto_75331 - TRUCK
      ?auto_75330 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75329 ?auto_75328 ) ( IN-CITY ?auto_75323 ?auto_75328 ) ( not ( = ?auto_75323 ?auto_75329 ) ) ( OBJ-AT ?auto_75326 ?auto_75323 ) ( not ( = ?auto_75326 ?auto_75327 ) ) ( OBJ-AT ?auto_75327 ?auto_75329 ) ( TRUCK-AT ?auto_75331 ?auto_75330 ) ( IN-CITY ?auto_75330 ?auto_75328 ) ( not ( = ?auto_75323 ?auto_75330 ) ) ( not ( = ?auto_75329 ?auto_75330 ) ) ( OBJ-AT ?auto_75324 ?auto_75323 ) ( OBJ-AT ?auto_75325 ?auto_75323 ) ( not ( = ?auto_75324 ?auto_75325 ) ) ( not ( = ?auto_75324 ?auto_75326 ) ) ( not ( = ?auto_75324 ?auto_75327 ) ) ( not ( = ?auto_75325 ?auto_75326 ) ) ( not ( = ?auto_75325 ?auto_75327 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75326 ?auto_75327 ?auto_75323 )
      ( DELIVER-4PKG-VERIFY ?auto_75324 ?auto_75325 ?auto_75326 ?auto_75327 ?auto_75323 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75459 - OBJ
      ?auto_75460 - OBJ
      ?auto_75461 - OBJ
      ?auto_75462 - OBJ
      ?auto_75458 - LOCATION
    )
    :vars
    (
      ?auto_75464 - LOCATION
      ?auto_75463 - CITY
      ?auto_75466 - TRUCK
      ?auto_75465 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75464 ?auto_75463 ) ( IN-CITY ?auto_75458 ?auto_75463 ) ( not ( = ?auto_75458 ?auto_75464 ) ) ( OBJ-AT ?auto_75461 ?auto_75458 ) ( not ( = ?auto_75461 ?auto_75460 ) ) ( OBJ-AT ?auto_75460 ?auto_75464 ) ( TRUCK-AT ?auto_75466 ?auto_75465 ) ( IN-CITY ?auto_75465 ?auto_75463 ) ( not ( = ?auto_75458 ?auto_75465 ) ) ( not ( = ?auto_75464 ?auto_75465 ) ) ( OBJ-AT ?auto_75459 ?auto_75458 ) ( OBJ-AT ?auto_75462 ?auto_75458 ) ( not ( = ?auto_75459 ?auto_75460 ) ) ( not ( = ?auto_75459 ?auto_75461 ) ) ( not ( = ?auto_75459 ?auto_75462 ) ) ( not ( = ?auto_75460 ?auto_75462 ) ) ( not ( = ?auto_75461 ?auto_75462 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75461 ?auto_75460 ?auto_75458 )
      ( DELIVER-4PKG-VERIFY ?auto_75459 ?auto_75460 ?auto_75461 ?auto_75462 ?auto_75458 ) )
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
      ?auto_75491 - LOCATION
      ?auto_75490 - CITY
      ?auto_75493 - TRUCK
      ?auto_75492 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75491 ?auto_75490 ) ( IN-CITY ?auto_75485 ?auto_75490 ) ( not ( = ?auto_75485 ?auto_75491 ) ) ( OBJ-AT ?auto_75489 ?auto_75485 ) ( not ( = ?auto_75489 ?auto_75487 ) ) ( OBJ-AT ?auto_75487 ?auto_75491 ) ( TRUCK-AT ?auto_75493 ?auto_75492 ) ( IN-CITY ?auto_75492 ?auto_75490 ) ( not ( = ?auto_75485 ?auto_75492 ) ) ( not ( = ?auto_75491 ?auto_75492 ) ) ( OBJ-AT ?auto_75486 ?auto_75485 ) ( OBJ-AT ?auto_75488 ?auto_75485 ) ( not ( = ?auto_75486 ?auto_75487 ) ) ( not ( = ?auto_75486 ?auto_75488 ) ) ( not ( = ?auto_75486 ?auto_75489 ) ) ( not ( = ?auto_75487 ?auto_75488 ) ) ( not ( = ?auto_75488 ?auto_75489 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75489 ?auto_75487 ?auto_75485 )
      ( DELIVER-4PKG-VERIFY ?auto_75486 ?auto_75487 ?auto_75488 ?auto_75489 ?auto_75485 ) )
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
      ?auto_75672 - LOCATION
      ?auto_75671 - CITY
      ?auto_75670 - OBJ
      ?auto_75674 - TRUCK
      ?auto_75673 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75672 ?auto_75671 ) ( IN-CITY ?auto_75665 ?auto_75671 ) ( not ( = ?auto_75665 ?auto_75672 ) ) ( OBJ-AT ?auto_75670 ?auto_75665 ) ( not ( = ?auto_75670 ?auto_75669 ) ) ( OBJ-AT ?auto_75669 ?auto_75672 ) ( TRUCK-AT ?auto_75674 ?auto_75673 ) ( IN-CITY ?auto_75673 ?auto_75671 ) ( not ( = ?auto_75665 ?auto_75673 ) ) ( not ( = ?auto_75672 ?auto_75673 ) ) ( OBJ-AT ?auto_75666 ?auto_75665 ) ( OBJ-AT ?auto_75667 ?auto_75665 ) ( OBJ-AT ?auto_75668 ?auto_75665 ) ( not ( = ?auto_75666 ?auto_75667 ) ) ( not ( = ?auto_75666 ?auto_75668 ) ) ( not ( = ?auto_75666 ?auto_75669 ) ) ( not ( = ?auto_75666 ?auto_75670 ) ) ( not ( = ?auto_75667 ?auto_75668 ) ) ( not ( = ?auto_75667 ?auto_75669 ) ) ( not ( = ?auto_75667 ?auto_75670 ) ) ( not ( = ?auto_75668 ?auto_75669 ) ) ( not ( = ?auto_75668 ?auto_75670 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75670 ?auto_75669 ?auto_75665 )
      ( DELIVER-4PKG-VERIFY ?auto_75666 ?auto_75667 ?auto_75668 ?auto_75669 ?auto_75665 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_75686 - OBJ
      ?auto_75687 - OBJ
      ?auto_75688 - OBJ
      ?auto_75689 - OBJ
      ?auto_75685 - LOCATION
    )
    :vars
    (
      ?auto_75691 - LOCATION
      ?auto_75690 - CITY
      ?auto_75693 - TRUCK
      ?auto_75692 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75691 ?auto_75690 ) ( IN-CITY ?auto_75685 ?auto_75690 ) ( not ( = ?auto_75685 ?auto_75691 ) ) ( OBJ-AT ?auto_75689 ?auto_75685 ) ( not ( = ?auto_75689 ?auto_75688 ) ) ( OBJ-AT ?auto_75688 ?auto_75691 ) ( TRUCK-AT ?auto_75693 ?auto_75692 ) ( IN-CITY ?auto_75692 ?auto_75690 ) ( not ( = ?auto_75685 ?auto_75692 ) ) ( not ( = ?auto_75691 ?auto_75692 ) ) ( OBJ-AT ?auto_75686 ?auto_75685 ) ( OBJ-AT ?auto_75687 ?auto_75685 ) ( not ( = ?auto_75686 ?auto_75687 ) ) ( not ( = ?auto_75686 ?auto_75688 ) ) ( not ( = ?auto_75686 ?auto_75689 ) ) ( not ( = ?auto_75687 ?auto_75688 ) ) ( not ( = ?auto_75687 ?auto_75689 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75689 ?auto_75688 ?auto_75685 )
      ( DELIVER-4PKG-VERIFY ?auto_75686 ?auto_75687 ?auto_75688 ?auto_75689 ?auto_75685 ) )
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
      ?auto_75701 - LOCATION
      ?auto_75700 - CITY
      ?auto_75699 - OBJ
      ?auto_75703 - TRUCK
      ?auto_75702 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75701 ?auto_75700 ) ( IN-CITY ?auto_75694 ?auto_75700 ) ( not ( = ?auto_75694 ?auto_75701 ) ) ( OBJ-AT ?auto_75699 ?auto_75694 ) ( not ( = ?auto_75699 ?auto_75697 ) ) ( OBJ-AT ?auto_75697 ?auto_75701 ) ( TRUCK-AT ?auto_75703 ?auto_75702 ) ( IN-CITY ?auto_75702 ?auto_75700 ) ( not ( = ?auto_75694 ?auto_75702 ) ) ( not ( = ?auto_75701 ?auto_75702 ) ) ( OBJ-AT ?auto_75695 ?auto_75694 ) ( OBJ-AT ?auto_75696 ?auto_75694 ) ( OBJ-AT ?auto_75698 ?auto_75694 ) ( not ( = ?auto_75695 ?auto_75696 ) ) ( not ( = ?auto_75695 ?auto_75697 ) ) ( not ( = ?auto_75695 ?auto_75698 ) ) ( not ( = ?auto_75695 ?auto_75699 ) ) ( not ( = ?auto_75696 ?auto_75697 ) ) ( not ( = ?auto_75696 ?auto_75698 ) ) ( not ( = ?auto_75696 ?auto_75699 ) ) ( not ( = ?auto_75697 ?auto_75698 ) ) ( not ( = ?auto_75698 ?auto_75699 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75699 ?auto_75697 ?auto_75694 )
      ( DELIVER-4PKG-VERIFY ?auto_75695 ?auto_75696 ?auto_75697 ?auto_75698 ?auto_75694 ) )
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
      ?auto_75844 - LOCATION
      ?auto_75843 - CITY
      ?auto_75842 - OBJ
      ?auto_75846 - TRUCK
      ?auto_75845 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_75844 ?auto_75843 ) ( IN-CITY ?auto_75837 ?auto_75843 ) ( not ( = ?auto_75837 ?auto_75844 ) ) ( OBJ-AT ?auto_75842 ?auto_75837 ) ( not ( = ?auto_75842 ?auto_75839 ) ) ( OBJ-AT ?auto_75839 ?auto_75844 ) ( TRUCK-AT ?auto_75846 ?auto_75845 ) ( IN-CITY ?auto_75845 ?auto_75843 ) ( not ( = ?auto_75837 ?auto_75845 ) ) ( not ( = ?auto_75844 ?auto_75845 ) ) ( OBJ-AT ?auto_75838 ?auto_75837 ) ( OBJ-AT ?auto_75840 ?auto_75837 ) ( OBJ-AT ?auto_75841 ?auto_75837 ) ( not ( = ?auto_75838 ?auto_75839 ) ) ( not ( = ?auto_75838 ?auto_75840 ) ) ( not ( = ?auto_75838 ?auto_75841 ) ) ( not ( = ?auto_75838 ?auto_75842 ) ) ( not ( = ?auto_75839 ?auto_75840 ) ) ( not ( = ?auto_75839 ?auto_75841 ) ) ( not ( = ?auto_75840 ?auto_75841 ) ) ( not ( = ?auto_75840 ?auto_75842 ) ) ( not ( = ?auto_75841 ?auto_75842 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_75842 ?auto_75839 ?auto_75837 )
      ( DELIVER-4PKG-VERIFY ?auto_75838 ?auto_75839 ?auto_75840 ?auto_75841 ?auto_75837 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_76442 - OBJ
      ?auto_76443 - OBJ
      ?auto_76444 - OBJ
      ?auto_76445 - OBJ
      ?auto_76441 - LOCATION
    )
    :vars
    (
      ?auto_76447 - LOCATION
      ?auto_76446 - CITY
      ?auto_76449 - TRUCK
      ?auto_76448 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76447 ?auto_76446 ) ( IN-CITY ?auto_76441 ?auto_76446 ) ( not ( = ?auto_76441 ?auto_76447 ) ) ( OBJ-AT ?auto_76445 ?auto_76441 ) ( not ( = ?auto_76445 ?auto_76442 ) ) ( OBJ-AT ?auto_76442 ?auto_76447 ) ( TRUCK-AT ?auto_76449 ?auto_76448 ) ( IN-CITY ?auto_76448 ?auto_76446 ) ( not ( = ?auto_76441 ?auto_76448 ) ) ( not ( = ?auto_76447 ?auto_76448 ) ) ( OBJ-AT ?auto_76443 ?auto_76441 ) ( OBJ-AT ?auto_76444 ?auto_76441 ) ( not ( = ?auto_76442 ?auto_76443 ) ) ( not ( = ?auto_76442 ?auto_76444 ) ) ( not ( = ?auto_76443 ?auto_76444 ) ) ( not ( = ?auto_76443 ?auto_76445 ) ) ( not ( = ?auto_76444 ?auto_76445 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76445 ?auto_76442 ?auto_76441 )
      ( DELIVER-4PKG-VERIFY ?auto_76442 ?auto_76443 ?auto_76444 ?auto_76445 ?auto_76441 ) )
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
      ?auto_76493 - LOCATION
      ?auto_76492 - CITY
      ?auto_76491 - OBJ
      ?auto_76495 - TRUCK
      ?auto_76494 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_76493 ?auto_76492 ) ( IN-CITY ?auto_76486 ?auto_76492 ) ( not ( = ?auto_76486 ?auto_76493 ) ) ( OBJ-AT ?auto_76491 ?auto_76486 ) ( not ( = ?auto_76491 ?auto_76487 ) ) ( OBJ-AT ?auto_76487 ?auto_76493 ) ( TRUCK-AT ?auto_76495 ?auto_76494 ) ( IN-CITY ?auto_76494 ?auto_76492 ) ( not ( = ?auto_76486 ?auto_76494 ) ) ( not ( = ?auto_76493 ?auto_76494 ) ) ( OBJ-AT ?auto_76488 ?auto_76486 ) ( OBJ-AT ?auto_76489 ?auto_76486 ) ( OBJ-AT ?auto_76490 ?auto_76486 ) ( not ( = ?auto_76487 ?auto_76488 ) ) ( not ( = ?auto_76487 ?auto_76489 ) ) ( not ( = ?auto_76487 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76489 ) ) ( not ( = ?auto_76488 ?auto_76490 ) ) ( not ( = ?auto_76488 ?auto_76491 ) ) ( not ( = ?auto_76489 ?auto_76490 ) ) ( not ( = ?auto_76489 ?auto_76491 ) ) ( not ( = ?auto_76490 ?auto_76491 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_76491 ?auto_76487 ?auto_76486 )
      ( DELIVER-4PKG-VERIFY ?auto_76487 ?auto_76488 ?auto_76489 ?auto_76490 ?auto_76486 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_84266 - OBJ
      ?auto_84267 - OBJ
      ?auto_84268 - OBJ
      ?auto_84265 - LOCATION
    )
    :vars
    (
      ?auto_84269 - TRUCK
      ?auto_84270 - LOCATION
      ?auto_84271 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_84269 ?auto_84270 ) ( IN-CITY ?auto_84270 ?auto_84271 ) ( IN-CITY ?auto_84265 ?auto_84271 ) ( not ( = ?auto_84265 ?auto_84270 ) ) ( OBJ-AT ?auto_84266 ?auto_84265 ) ( not ( = ?auto_84266 ?auto_84267 ) ) ( OBJ-AT ?auto_84267 ?auto_84270 ) ( OBJ-AT ?auto_84268 ?auto_84265 ) ( not ( = ?auto_84266 ?auto_84268 ) ) ( not ( = ?auto_84267 ?auto_84268 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_84266 ?auto_84267 ?auto_84265 )
      ( DELIVER-3PKG-VERIFY ?auto_84266 ?auto_84267 ?auto_84268 ?auto_84265 ) )
  )

)

