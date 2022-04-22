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
      ?auto_186332 - OBJ
      ?auto_186331 - LOCATION
    )
    :vars
    (
      ?auto_186334 - LOCATION
      ?auto_186335 - CITY
      ?auto_186333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186334 ?auto_186335 ) ( IN-CITY ?auto_186331 ?auto_186335 ) ( not ( = ?auto_186331 ?auto_186334 ) ) ( OBJ-AT ?auto_186332 ?auto_186334 ) ( TRUCK-AT ?auto_186333 ?auto_186331 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_186333 ?auto_186331 ?auto_186334 ?auto_186335 )
      ( !LOAD-TRUCK ?auto_186332 ?auto_186333 ?auto_186334 )
      ( !DRIVE-TRUCK ?auto_186333 ?auto_186334 ?auto_186331 ?auto_186335 )
      ( !UNLOAD-TRUCK ?auto_186332 ?auto_186333 ?auto_186331 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_186353 - OBJ
      ?auto_186354 - OBJ
      ?auto_186352 - LOCATION
    )
    :vars
    (
      ?auto_186357 - LOCATION
      ?auto_186355 - CITY
      ?auto_186358 - LOCATION
      ?auto_186356 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186357 ?auto_186355 ) ( IN-CITY ?auto_186352 ?auto_186355 ) ( not ( = ?auto_186352 ?auto_186357 ) ) ( OBJ-AT ?auto_186354 ?auto_186357 ) ( IN-CITY ?auto_186358 ?auto_186355 ) ( not ( = ?auto_186352 ?auto_186358 ) ) ( OBJ-AT ?auto_186353 ?auto_186358 ) ( TRUCK-AT ?auto_186356 ?auto_186352 ) ( not ( = ?auto_186353 ?auto_186354 ) ) ( not ( = ?auto_186357 ?auto_186358 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_186353 ?auto_186352 )
      ( DELIVER-1PKG ?auto_186354 ?auto_186352 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186463 - OBJ
      ?auto_186464 - OBJ
      ?auto_186465 - OBJ
      ?auto_186462 - LOCATION
    )
    :vars
    (
      ?auto_186468 - LOCATION
      ?auto_186467 - CITY
      ?auto_186469 - LOCATION
      ?auto_186466 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186468 ?auto_186467 ) ( IN-CITY ?auto_186462 ?auto_186467 ) ( not ( = ?auto_186462 ?auto_186468 ) ) ( OBJ-AT ?auto_186465 ?auto_186468 ) ( IN-CITY ?auto_186469 ?auto_186467 ) ( not ( = ?auto_186462 ?auto_186469 ) ) ( OBJ-AT ?auto_186464 ?auto_186469 ) ( OBJ-AT ?auto_186463 ?auto_186468 ) ( TRUCK-AT ?auto_186466 ?auto_186462 ) ( not ( = ?auto_186463 ?auto_186464 ) ) ( not ( = ?auto_186469 ?auto_186468 ) ) ( not ( = ?auto_186463 ?auto_186465 ) ) ( not ( = ?auto_186464 ?auto_186465 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_186463 ?auto_186464 ?auto_186462 )
      ( DELIVER-1PKG ?auto_186465 ?auto_186462 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186480 - OBJ
      ?auto_186481 - OBJ
      ?auto_186482 - OBJ
      ?auto_186479 - LOCATION
    )
    :vars
    (
      ?auto_186483 - LOCATION
      ?auto_186486 - CITY
      ?auto_186484 - LOCATION
      ?auto_186485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186483 ?auto_186486 ) ( IN-CITY ?auto_186479 ?auto_186486 ) ( not ( = ?auto_186479 ?auto_186483 ) ) ( OBJ-AT ?auto_186481 ?auto_186483 ) ( IN-CITY ?auto_186484 ?auto_186486 ) ( not ( = ?auto_186479 ?auto_186484 ) ) ( OBJ-AT ?auto_186482 ?auto_186484 ) ( OBJ-AT ?auto_186480 ?auto_186483 ) ( TRUCK-AT ?auto_186485 ?auto_186479 ) ( not ( = ?auto_186480 ?auto_186482 ) ) ( not ( = ?auto_186484 ?auto_186483 ) ) ( not ( = ?auto_186480 ?auto_186481 ) ) ( not ( = ?auto_186482 ?auto_186481 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_186480 ?auto_186482 ?auto_186481 ?auto_186479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_186497 - OBJ
      ?auto_186498 - OBJ
      ?auto_186499 - OBJ
      ?auto_186496 - LOCATION
    )
    :vars
    (
      ?auto_186503 - LOCATION
      ?auto_186501 - CITY
      ?auto_186500 - LOCATION
      ?auto_186502 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_186503 ?auto_186501 ) ( IN-CITY ?auto_186496 ?auto_186501 ) ( not ( = ?auto_186496 ?auto_186503 ) ) ( OBJ-AT ?auto_186499 ?auto_186503 ) ( IN-CITY ?auto_186500 ?auto_186501 ) ( not ( = ?auto_186496 ?auto_186500 ) ) ( OBJ-AT ?auto_186497 ?auto_186500 ) ( OBJ-AT ?auto_186498 ?auto_186503 ) ( TRUCK-AT ?auto_186502 ?auto_186496 ) ( not ( = ?auto_186498 ?auto_186497 ) ) ( not ( = ?auto_186500 ?auto_186503 ) ) ( not ( = ?auto_186498 ?auto_186499 ) ) ( not ( = ?auto_186497 ?auto_186499 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_186498 ?auto_186499 ?auto_186497 ?auto_186496 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187583 - OBJ
      ?auto_187584 - OBJ
      ?auto_187585 - OBJ
      ?auto_187586 - OBJ
      ?auto_187582 - LOCATION
    )
    :vars
    (
      ?auto_187587 - LOCATION
      ?auto_187588 - CITY
      ?auto_187590 - LOCATION
      ?auto_187589 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187587 ?auto_187588 ) ( IN-CITY ?auto_187582 ?auto_187588 ) ( not ( = ?auto_187582 ?auto_187587 ) ) ( OBJ-AT ?auto_187586 ?auto_187587 ) ( IN-CITY ?auto_187590 ?auto_187588 ) ( not ( = ?auto_187582 ?auto_187590 ) ) ( OBJ-AT ?auto_187585 ?auto_187590 ) ( OBJ-AT ?auto_187584 ?auto_187587 ) ( OBJ-AT ?auto_187583 ?auto_187590 ) ( TRUCK-AT ?auto_187589 ?auto_187582 ) ( not ( = ?auto_187583 ?auto_187584 ) ) ( not ( = ?auto_187587 ?auto_187590 ) ) ( not ( = ?auto_187583 ?auto_187585 ) ) ( not ( = ?auto_187584 ?auto_187585 ) ) ( not ( = ?auto_187583 ?auto_187586 ) ) ( not ( = ?auto_187584 ?auto_187586 ) ) ( not ( = ?auto_187585 ?auto_187586 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_187583 ?auto_187585 ?auto_187584 ?auto_187582 )
      ( DELIVER-1PKG ?auto_187586 ?auto_187582 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187612 - OBJ
      ?auto_187613 - OBJ
      ?auto_187614 - OBJ
      ?auto_187615 - OBJ
      ?auto_187611 - LOCATION
    )
    :vars
    (
      ?auto_187616 - LOCATION
      ?auto_187619 - CITY
      ?auto_187618 - LOCATION
      ?auto_187617 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187616 ?auto_187619 ) ( IN-CITY ?auto_187611 ?auto_187619 ) ( not ( = ?auto_187611 ?auto_187616 ) ) ( OBJ-AT ?auto_187614 ?auto_187616 ) ( IN-CITY ?auto_187618 ?auto_187619 ) ( not ( = ?auto_187611 ?auto_187618 ) ) ( OBJ-AT ?auto_187615 ?auto_187618 ) ( OBJ-AT ?auto_187613 ?auto_187616 ) ( OBJ-AT ?auto_187612 ?auto_187618 ) ( TRUCK-AT ?auto_187617 ?auto_187611 ) ( not ( = ?auto_187612 ?auto_187613 ) ) ( not ( = ?auto_187616 ?auto_187618 ) ) ( not ( = ?auto_187612 ?auto_187615 ) ) ( not ( = ?auto_187613 ?auto_187615 ) ) ( not ( = ?auto_187612 ?auto_187614 ) ) ( not ( = ?auto_187613 ?auto_187614 ) ) ( not ( = ?auto_187615 ?auto_187614 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_187612 ?auto_187613 ?auto_187615 ?auto_187614 ?auto_187611 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_187641 - OBJ
      ?auto_187642 - OBJ
      ?auto_187643 - OBJ
      ?auto_187644 - OBJ
      ?auto_187640 - LOCATION
    )
    :vars
    (
      ?auto_187645 - LOCATION
      ?auto_187647 - CITY
      ?auto_187646 - LOCATION
      ?auto_187648 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_187645 ?auto_187647 ) ( IN-CITY ?auto_187640 ?auto_187647 ) ( not ( = ?auto_187640 ?auto_187645 ) ) ( OBJ-AT ?auto_187644 ?auto_187645 ) ( IN-CITY ?auto_187646 ?auto_187647 ) ( not ( = ?auto_187640 ?auto_187646 ) ) ( OBJ-AT ?auto_187642 ?auto_187646 ) ( OBJ-AT ?auto_187643 ?auto_187645 ) ( OBJ-AT ?auto_187641 ?auto_187646 ) ( TRUCK-AT ?auto_187648 ?auto_187640 ) ( not ( = ?auto_187641 ?auto_187643 ) ) ( not ( = ?auto_187645 ?auto_187646 ) ) ( not ( = ?auto_187641 ?auto_187642 ) ) ( not ( = ?auto_187643 ?auto_187642 ) ) ( not ( = ?auto_187641 ?auto_187644 ) ) ( not ( = ?auto_187643 ?auto_187644 ) ) ( not ( = ?auto_187642 ?auto_187644 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_187641 ?auto_187643 ?auto_187644 ?auto_187642 ?auto_187640 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_202751 - OBJ
      ?auto_202752 - OBJ
      ?auto_202753 - OBJ
      ?auto_202754 - OBJ
      ?auto_202755 - OBJ
      ?auto_202750 - LOCATION
    )
    :vars
    (
      ?auto_202757 - LOCATION
      ?auto_202756 - CITY
      ?auto_202759 - LOCATION
      ?auto_202758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_202757 ?auto_202756 ) ( IN-CITY ?auto_202750 ?auto_202756 ) ( not ( = ?auto_202750 ?auto_202757 ) ) ( OBJ-AT ?auto_202755 ?auto_202757 ) ( IN-CITY ?auto_202759 ?auto_202756 ) ( not ( = ?auto_202750 ?auto_202759 ) ) ( OBJ-AT ?auto_202754 ?auto_202759 ) ( OBJ-AT ?auto_202753 ?auto_202757 ) ( OBJ-AT ?auto_202752 ?auto_202759 ) ( OBJ-AT ?auto_202751 ?auto_202757 ) ( TRUCK-AT ?auto_202758 ?auto_202750 ) ( not ( = ?auto_202751 ?auto_202752 ) ) ( not ( = ?auto_202759 ?auto_202757 ) ) ( not ( = ?auto_202751 ?auto_202753 ) ) ( not ( = ?auto_202752 ?auto_202753 ) ) ( not ( = ?auto_202751 ?auto_202754 ) ) ( not ( = ?auto_202752 ?auto_202754 ) ) ( not ( = ?auto_202753 ?auto_202754 ) ) ( not ( = ?auto_202751 ?auto_202755 ) ) ( not ( = ?auto_202752 ?auto_202755 ) ) ( not ( = ?auto_202753 ?auto_202755 ) ) ( not ( = ?auto_202754 ?auto_202755 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_202751 ?auto_202752 ?auto_202754 ?auto_202753 ?auto_202750 )
      ( DELIVER-1PKG ?auto_202755 ?auto_202750 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_202794 - OBJ
      ?auto_202795 - OBJ
      ?auto_202796 - OBJ
      ?auto_202797 - OBJ
      ?auto_202798 - OBJ
      ?auto_202793 - LOCATION
    )
    :vars
    (
      ?auto_202799 - LOCATION
      ?auto_202801 - CITY
      ?auto_202800 - LOCATION
      ?auto_202802 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_202799 ?auto_202801 ) ( IN-CITY ?auto_202793 ?auto_202801 ) ( not ( = ?auto_202793 ?auto_202799 ) ) ( OBJ-AT ?auto_202797 ?auto_202799 ) ( IN-CITY ?auto_202800 ?auto_202801 ) ( not ( = ?auto_202793 ?auto_202800 ) ) ( OBJ-AT ?auto_202798 ?auto_202800 ) ( OBJ-AT ?auto_202796 ?auto_202799 ) ( OBJ-AT ?auto_202795 ?auto_202800 ) ( OBJ-AT ?auto_202794 ?auto_202799 ) ( TRUCK-AT ?auto_202802 ?auto_202793 ) ( not ( = ?auto_202794 ?auto_202795 ) ) ( not ( = ?auto_202800 ?auto_202799 ) ) ( not ( = ?auto_202794 ?auto_202796 ) ) ( not ( = ?auto_202795 ?auto_202796 ) ) ( not ( = ?auto_202794 ?auto_202798 ) ) ( not ( = ?auto_202795 ?auto_202798 ) ) ( not ( = ?auto_202796 ?auto_202798 ) ) ( not ( = ?auto_202794 ?auto_202797 ) ) ( not ( = ?auto_202795 ?auto_202797 ) ) ( not ( = ?auto_202796 ?auto_202797 ) ) ( not ( = ?auto_202798 ?auto_202797 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_202794 ?auto_202795 ?auto_202796 ?auto_202798 ?auto_202797 ?auto_202793 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_202837 - OBJ
      ?auto_202838 - OBJ
      ?auto_202839 - OBJ
      ?auto_202840 - OBJ
      ?auto_202841 - OBJ
      ?auto_202836 - LOCATION
    )
    :vars
    (
      ?auto_202843 - LOCATION
      ?auto_202842 - CITY
      ?auto_202844 - LOCATION
      ?auto_202845 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_202843 ?auto_202842 ) ( IN-CITY ?auto_202836 ?auto_202842 ) ( not ( = ?auto_202836 ?auto_202843 ) ) ( OBJ-AT ?auto_202841 ?auto_202843 ) ( IN-CITY ?auto_202844 ?auto_202842 ) ( not ( = ?auto_202836 ?auto_202844 ) ) ( OBJ-AT ?auto_202839 ?auto_202844 ) ( OBJ-AT ?auto_202840 ?auto_202843 ) ( OBJ-AT ?auto_202838 ?auto_202844 ) ( OBJ-AT ?auto_202837 ?auto_202843 ) ( TRUCK-AT ?auto_202845 ?auto_202836 ) ( not ( = ?auto_202837 ?auto_202838 ) ) ( not ( = ?auto_202844 ?auto_202843 ) ) ( not ( = ?auto_202837 ?auto_202840 ) ) ( not ( = ?auto_202838 ?auto_202840 ) ) ( not ( = ?auto_202837 ?auto_202839 ) ) ( not ( = ?auto_202838 ?auto_202839 ) ) ( not ( = ?auto_202840 ?auto_202839 ) ) ( not ( = ?auto_202837 ?auto_202841 ) ) ( not ( = ?auto_202838 ?auto_202841 ) ) ( not ( = ?auto_202840 ?auto_202841 ) ) ( not ( = ?auto_202839 ?auto_202841 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_202837 ?auto_202838 ?auto_202840 ?auto_202841 ?auto_202839 ?auto_202836 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_203319 - OBJ
      ?auto_203320 - OBJ
      ?auto_203321 - OBJ
      ?auto_203322 - OBJ
      ?auto_203323 - OBJ
      ?auto_203318 - LOCATION
    )
    :vars
    (
      ?auto_203325 - LOCATION
      ?auto_203324 - CITY
      ?auto_203326 - LOCATION
      ?auto_203327 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_203325 ?auto_203324 ) ( IN-CITY ?auto_203318 ?auto_203324 ) ( not ( = ?auto_203318 ?auto_203325 ) ) ( OBJ-AT ?auto_203323 ?auto_203325 ) ( IN-CITY ?auto_203326 ?auto_203324 ) ( not ( = ?auto_203318 ?auto_203326 ) ) ( OBJ-AT ?auto_203322 ?auto_203326 ) ( OBJ-AT ?auto_203320 ?auto_203325 ) ( OBJ-AT ?auto_203321 ?auto_203326 ) ( OBJ-AT ?auto_203319 ?auto_203325 ) ( TRUCK-AT ?auto_203327 ?auto_203318 ) ( not ( = ?auto_203319 ?auto_203321 ) ) ( not ( = ?auto_203326 ?auto_203325 ) ) ( not ( = ?auto_203319 ?auto_203320 ) ) ( not ( = ?auto_203321 ?auto_203320 ) ) ( not ( = ?auto_203319 ?auto_203322 ) ) ( not ( = ?auto_203321 ?auto_203322 ) ) ( not ( = ?auto_203320 ?auto_203322 ) ) ( not ( = ?auto_203319 ?auto_203323 ) ) ( not ( = ?auto_203321 ?auto_203323 ) ) ( not ( = ?auto_203320 ?auto_203323 ) ) ( not ( = ?auto_203322 ?auto_203323 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_203319 ?auto_203321 ?auto_203320 ?auto_203323 ?auto_203322 ?auto_203318 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_203362 - OBJ
      ?auto_203363 - OBJ
      ?auto_203364 - OBJ
      ?auto_203365 - OBJ
      ?auto_203366 - OBJ
      ?auto_203361 - LOCATION
    )
    :vars
    (
      ?auto_203368 - LOCATION
      ?auto_203367 - CITY
      ?auto_203369 - LOCATION
      ?auto_203370 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_203368 ?auto_203367 ) ( IN-CITY ?auto_203361 ?auto_203367 ) ( not ( = ?auto_203361 ?auto_203368 ) ) ( OBJ-AT ?auto_203365 ?auto_203368 ) ( IN-CITY ?auto_203369 ?auto_203367 ) ( not ( = ?auto_203361 ?auto_203369 ) ) ( OBJ-AT ?auto_203366 ?auto_203369 ) ( OBJ-AT ?auto_203363 ?auto_203368 ) ( OBJ-AT ?auto_203364 ?auto_203369 ) ( OBJ-AT ?auto_203362 ?auto_203368 ) ( TRUCK-AT ?auto_203370 ?auto_203361 ) ( not ( = ?auto_203362 ?auto_203364 ) ) ( not ( = ?auto_203369 ?auto_203368 ) ) ( not ( = ?auto_203362 ?auto_203363 ) ) ( not ( = ?auto_203364 ?auto_203363 ) ) ( not ( = ?auto_203362 ?auto_203366 ) ) ( not ( = ?auto_203364 ?auto_203366 ) ) ( not ( = ?auto_203363 ?auto_203366 ) ) ( not ( = ?auto_203362 ?auto_203365 ) ) ( not ( = ?auto_203364 ?auto_203365 ) ) ( not ( = ?auto_203363 ?auto_203365 ) ) ( not ( = ?auto_203366 ?auto_203365 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_203362 ?auto_203364 ?auto_203363 ?auto_203365 ?auto_203366 ?auto_203361 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_203667 - OBJ
      ?auto_203668 - OBJ
      ?auto_203669 - OBJ
      ?auto_203670 - OBJ
      ?auto_203671 - OBJ
      ?auto_203666 - LOCATION
    )
    :vars
    (
      ?auto_203673 - LOCATION
      ?auto_203672 - CITY
      ?auto_203674 - LOCATION
      ?auto_203675 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_203673 ?auto_203672 ) ( IN-CITY ?auto_203666 ?auto_203672 ) ( not ( = ?auto_203666 ?auto_203673 ) ) ( OBJ-AT ?auto_203669 ?auto_203673 ) ( IN-CITY ?auto_203674 ?auto_203672 ) ( not ( = ?auto_203666 ?auto_203674 ) ) ( OBJ-AT ?auto_203671 ?auto_203674 ) ( OBJ-AT ?auto_203668 ?auto_203673 ) ( OBJ-AT ?auto_203670 ?auto_203674 ) ( OBJ-AT ?auto_203667 ?auto_203673 ) ( TRUCK-AT ?auto_203675 ?auto_203666 ) ( not ( = ?auto_203667 ?auto_203670 ) ) ( not ( = ?auto_203674 ?auto_203673 ) ) ( not ( = ?auto_203667 ?auto_203668 ) ) ( not ( = ?auto_203670 ?auto_203668 ) ) ( not ( = ?auto_203667 ?auto_203671 ) ) ( not ( = ?auto_203670 ?auto_203671 ) ) ( not ( = ?auto_203668 ?auto_203671 ) ) ( not ( = ?auto_203667 ?auto_203669 ) ) ( not ( = ?auto_203670 ?auto_203669 ) ) ( not ( = ?auto_203668 ?auto_203669 ) ) ( not ( = ?auto_203671 ?auto_203669 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_203667 ?auto_203670 ?auto_203668 ?auto_203669 ?auto_203671 ?auto_203666 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206173 - OBJ
      ?auto_206174 - OBJ
      ?auto_206175 - OBJ
      ?auto_206176 - OBJ
      ?auto_206177 - OBJ
      ?auto_206172 - LOCATION
    )
    :vars
    (
      ?auto_206179 - LOCATION
      ?auto_206178 - CITY
      ?auto_206180 - LOCATION
      ?auto_206181 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206179 ?auto_206178 ) ( IN-CITY ?auto_206172 ?auto_206178 ) ( not ( = ?auto_206172 ?auto_206179 ) ) ( OBJ-AT ?auto_206177 ?auto_206179 ) ( IN-CITY ?auto_206180 ?auto_206178 ) ( not ( = ?auto_206172 ?auto_206180 ) ) ( OBJ-AT ?auto_206176 ?auto_206180 ) ( OBJ-AT ?auto_206175 ?auto_206179 ) ( OBJ-AT ?auto_206173 ?auto_206180 ) ( OBJ-AT ?auto_206174 ?auto_206179 ) ( TRUCK-AT ?auto_206181 ?auto_206172 ) ( not ( = ?auto_206174 ?auto_206173 ) ) ( not ( = ?auto_206180 ?auto_206179 ) ) ( not ( = ?auto_206174 ?auto_206175 ) ) ( not ( = ?auto_206173 ?auto_206175 ) ) ( not ( = ?auto_206174 ?auto_206176 ) ) ( not ( = ?auto_206173 ?auto_206176 ) ) ( not ( = ?auto_206175 ?auto_206176 ) ) ( not ( = ?auto_206174 ?auto_206177 ) ) ( not ( = ?auto_206173 ?auto_206177 ) ) ( not ( = ?auto_206175 ?auto_206177 ) ) ( not ( = ?auto_206176 ?auto_206177 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206174 ?auto_206173 ?auto_206175 ?auto_206177 ?auto_206176 ?auto_206172 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206216 - OBJ
      ?auto_206217 - OBJ
      ?auto_206218 - OBJ
      ?auto_206219 - OBJ
      ?auto_206220 - OBJ
      ?auto_206215 - LOCATION
    )
    :vars
    (
      ?auto_206222 - LOCATION
      ?auto_206221 - CITY
      ?auto_206223 - LOCATION
      ?auto_206224 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206222 ?auto_206221 ) ( IN-CITY ?auto_206215 ?auto_206221 ) ( not ( = ?auto_206215 ?auto_206222 ) ) ( OBJ-AT ?auto_206219 ?auto_206222 ) ( IN-CITY ?auto_206223 ?auto_206221 ) ( not ( = ?auto_206215 ?auto_206223 ) ) ( OBJ-AT ?auto_206220 ?auto_206223 ) ( OBJ-AT ?auto_206218 ?auto_206222 ) ( OBJ-AT ?auto_206216 ?auto_206223 ) ( OBJ-AT ?auto_206217 ?auto_206222 ) ( TRUCK-AT ?auto_206224 ?auto_206215 ) ( not ( = ?auto_206217 ?auto_206216 ) ) ( not ( = ?auto_206223 ?auto_206222 ) ) ( not ( = ?auto_206217 ?auto_206218 ) ) ( not ( = ?auto_206216 ?auto_206218 ) ) ( not ( = ?auto_206217 ?auto_206220 ) ) ( not ( = ?auto_206216 ?auto_206220 ) ) ( not ( = ?auto_206218 ?auto_206220 ) ) ( not ( = ?auto_206217 ?auto_206219 ) ) ( not ( = ?auto_206216 ?auto_206219 ) ) ( not ( = ?auto_206218 ?auto_206219 ) ) ( not ( = ?auto_206220 ?auto_206219 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206217 ?auto_206216 ?auto_206218 ?auto_206219 ?auto_206220 ?auto_206215 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_206259 - OBJ
      ?auto_206260 - OBJ
      ?auto_206261 - OBJ
      ?auto_206262 - OBJ
      ?auto_206263 - OBJ
      ?auto_206258 - LOCATION
    )
    :vars
    (
      ?auto_206265 - LOCATION
      ?auto_206264 - CITY
      ?auto_206266 - LOCATION
      ?auto_206267 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_206265 ?auto_206264 ) ( IN-CITY ?auto_206258 ?auto_206264 ) ( not ( = ?auto_206258 ?auto_206265 ) ) ( OBJ-AT ?auto_206263 ?auto_206265 ) ( IN-CITY ?auto_206266 ?auto_206264 ) ( not ( = ?auto_206258 ?auto_206266 ) ) ( OBJ-AT ?auto_206261 ?auto_206266 ) ( OBJ-AT ?auto_206262 ?auto_206265 ) ( OBJ-AT ?auto_206259 ?auto_206266 ) ( OBJ-AT ?auto_206260 ?auto_206265 ) ( TRUCK-AT ?auto_206267 ?auto_206258 ) ( not ( = ?auto_206260 ?auto_206259 ) ) ( not ( = ?auto_206266 ?auto_206265 ) ) ( not ( = ?auto_206260 ?auto_206262 ) ) ( not ( = ?auto_206259 ?auto_206262 ) ) ( not ( = ?auto_206260 ?auto_206261 ) ) ( not ( = ?auto_206259 ?auto_206261 ) ) ( not ( = ?auto_206262 ?auto_206261 ) ) ( not ( = ?auto_206260 ?auto_206263 ) ) ( not ( = ?auto_206259 ?auto_206263 ) ) ( not ( = ?auto_206262 ?auto_206263 ) ) ( not ( = ?auto_206261 ?auto_206263 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_206260 ?auto_206259 ?auto_206262 ?auto_206263 ?auto_206261 ?auto_206258 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_208007 - OBJ
      ?auto_208008 - OBJ
      ?auto_208009 - OBJ
      ?auto_208010 - OBJ
      ?auto_208011 - OBJ
      ?auto_208006 - LOCATION
    )
    :vars
    (
      ?auto_208013 - LOCATION
      ?auto_208012 - CITY
      ?auto_208014 - LOCATION
      ?auto_208015 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_208013 ?auto_208012 ) ( IN-CITY ?auto_208006 ?auto_208012 ) ( not ( = ?auto_208006 ?auto_208013 ) ) ( OBJ-AT ?auto_208011 ?auto_208013 ) ( IN-CITY ?auto_208014 ?auto_208012 ) ( not ( = ?auto_208006 ?auto_208014 ) ) ( OBJ-AT ?auto_208008 ?auto_208014 ) ( OBJ-AT ?auto_208010 ?auto_208013 ) ( OBJ-AT ?auto_208007 ?auto_208014 ) ( OBJ-AT ?auto_208009 ?auto_208013 ) ( TRUCK-AT ?auto_208015 ?auto_208006 ) ( not ( = ?auto_208009 ?auto_208007 ) ) ( not ( = ?auto_208014 ?auto_208013 ) ) ( not ( = ?auto_208009 ?auto_208010 ) ) ( not ( = ?auto_208007 ?auto_208010 ) ) ( not ( = ?auto_208009 ?auto_208008 ) ) ( not ( = ?auto_208007 ?auto_208008 ) ) ( not ( = ?auto_208010 ?auto_208008 ) ) ( not ( = ?auto_208009 ?auto_208011 ) ) ( not ( = ?auto_208007 ?auto_208011 ) ) ( not ( = ?auto_208010 ?auto_208011 ) ) ( not ( = ?auto_208008 ?auto_208011 ) ) )
    :subtasks
    ( ( DELIVER-5PKG ?auto_208009 ?auto_208007 ?auto_208010 ?auto_208011 ?auto_208008 ?auto_208006 ) )
  )

)

