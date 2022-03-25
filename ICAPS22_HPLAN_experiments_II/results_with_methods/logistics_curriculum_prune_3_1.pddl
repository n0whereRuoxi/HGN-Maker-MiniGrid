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
      ?auto_484 - OBJ
      ?auto_483 - LOCATION
    )
    :vars
    (
      ?auto_486 - LOCATION
      ?auto_487 - CITY
      ?auto_485 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_486 ?auto_487 ) ( IN-CITY ?auto_483 ?auto_487 ) ( not ( = ?auto_483 ?auto_486 ) ) ( OBJ-AT ?auto_484 ?auto_486 ) ( TRUCK-AT ?auto_485 ?auto_483 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_485 ?auto_483 ?auto_486 ?auto_487 )
      ( !LOAD-TRUCK ?auto_484 ?auto_485 ?auto_486 )
      ( !DRIVE-TRUCK ?auto_485 ?auto_486 ?auto_483 ?auto_487 )
      ( !UNLOAD-TRUCK ?auto_484 ?auto_485 ?auto_483 )
      ( DELIVER-1PKG-VERIFY ?auto_484 ?auto_483 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_505 - OBJ
      ?auto_506 - OBJ
      ?auto_504 - LOCATION
    )
    :vars
    (
      ?auto_508 - LOCATION
      ?auto_507 - CITY
      ?auto_510 - LOCATION
      ?auto_509 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_508 ?auto_507 ) ( IN-CITY ?auto_504 ?auto_507 ) ( not ( = ?auto_504 ?auto_508 ) ) ( OBJ-AT ?auto_506 ?auto_508 ) ( IN-CITY ?auto_510 ?auto_507 ) ( not ( = ?auto_504 ?auto_510 ) ) ( OBJ-AT ?auto_505 ?auto_510 ) ( TRUCK-AT ?auto_509 ?auto_504 ) ( not ( = ?auto_505 ?auto_506 ) ) ( not ( = ?auto_508 ?auto_510 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_505 ?auto_504 )
      ( DELIVER-1PKG ?auto_506 ?auto_504 )
      ( DELIVER-2PKG-VERIFY ?auto_505 ?auto_506 ?auto_504 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_615 - OBJ
      ?auto_616 - OBJ
      ?auto_617 - OBJ
      ?auto_614 - LOCATION
    )
    :vars
    (
      ?auto_620 - LOCATION
      ?auto_619 - CITY
      ?auto_621 - LOCATION
      ?auto_618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_620 ?auto_619 ) ( IN-CITY ?auto_614 ?auto_619 ) ( not ( = ?auto_614 ?auto_620 ) ) ( OBJ-AT ?auto_617 ?auto_620 ) ( IN-CITY ?auto_621 ?auto_619 ) ( not ( = ?auto_614 ?auto_621 ) ) ( OBJ-AT ?auto_616 ?auto_621 ) ( OBJ-AT ?auto_615 ?auto_620 ) ( TRUCK-AT ?auto_618 ?auto_614 ) ( not ( = ?auto_615 ?auto_616 ) ) ( not ( = ?auto_621 ?auto_620 ) ) ( not ( = ?auto_615 ?auto_617 ) ) ( not ( = ?auto_616 ?auto_617 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_615 ?auto_616 ?auto_614 )
      ( DELIVER-1PKG ?auto_617 ?auto_614 )
      ( DELIVER-3PKG-VERIFY ?auto_615 ?auto_616 ?auto_617 ?auto_614 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_632 - OBJ
      ?auto_633 - OBJ
      ?auto_634 - OBJ
      ?auto_631 - LOCATION
    )
    :vars
    (
      ?auto_636 - LOCATION
      ?auto_635 - CITY
      ?auto_637 - LOCATION
      ?auto_638 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_636 ?auto_635 ) ( IN-CITY ?auto_631 ?auto_635 ) ( not ( = ?auto_631 ?auto_636 ) ) ( OBJ-AT ?auto_633 ?auto_636 ) ( IN-CITY ?auto_637 ?auto_635 ) ( not ( = ?auto_631 ?auto_637 ) ) ( OBJ-AT ?auto_634 ?auto_637 ) ( OBJ-AT ?auto_632 ?auto_636 ) ( TRUCK-AT ?auto_638 ?auto_631 ) ( not ( = ?auto_632 ?auto_634 ) ) ( not ( = ?auto_637 ?auto_636 ) ) ( not ( = ?auto_632 ?auto_633 ) ) ( not ( = ?auto_634 ?auto_633 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_632 ?auto_634 ?auto_633 ?auto_631 )
      ( DELIVER-3PKG-VERIFY ?auto_632 ?auto_633 ?auto_634 ?auto_631 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_649 - OBJ
      ?auto_650 - OBJ
      ?auto_651 - OBJ
      ?auto_648 - LOCATION
    )
    :vars
    (
      ?auto_653 - LOCATION
      ?auto_652 - CITY
      ?auto_654 - LOCATION
      ?auto_655 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_653 ?auto_652 ) ( IN-CITY ?auto_648 ?auto_652 ) ( not ( = ?auto_648 ?auto_653 ) ) ( OBJ-AT ?auto_651 ?auto_653 ) ( IN-CITY ?auto_654 ?auto_652 ) ( not ( = ?auto_648 ?auto_654 ) ) ( OBJ-AT ?auto_649 ?auto_654 ) ( OBJ-AT ?auto_650 ?auto_653 ) ( TRUCK-AT ?auto_655 ?auto_648 ) ( not ( = ?auto_650 ?auto_649 ) ) ( not ( = ?auto_654 ?auto_653 ) ) ( not ( = ?auto_650 ?auto_651 ) ) ( not ( = ?auto_649 ?auto_651 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_650 ?auto_651 ?auto_649 ?auto_648 )
      ( DELIVER-3PKG-VERIFY ?auto_649 ?auto_650 ?auto_651 ?auto_648 ) )
  )

)

