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

  ( :method DELIVER-5PKG-VERIFY
    :parameters
    (
      ?obj1 - OBJ
      ?obj2 - OBJ
      ?obj3 - OBJ
      ?obj4 - OBJ
      ?obj5 - OBJ
      ?dst - LOCATION
    )
    :precondition
    ( and ( OBJ-AT ?obj1 ?dst ) ( OBJ-AT ?obj2 ?dst ) ( OBJ-AT ?obj3 ?dst ) ( OBJ-AT ?obj4 ?dst ) ( OBJ-AT ?obj5 ?dst ) )
    :subtasks
    (  )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_57485 - OBJ
      ?auto_57484 - LOCATION
    )
    :vars
    (
      ?auto_57487 - LOCATION
      ?auto_57488 - CITY
      ?auto_57486 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57487 ?auto_57488 ) ( IN-CITY ?auto_57484 ?auto_57488 ) ( not ( = ?auto_57484 ?auto_57487 ) ) ( OBJ-AT ?auto_57485 ?auto_57487 ) ( TRUCK-AT ?auto_57486 ?auto_57484 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_57486 ?auto_57484 ?auto_57487 ?auto_57488 )
      ( !LOAD-TRUCK ?auto_57485 ?auto_57486 ?auto_57487 )
      ( !DRIVE-TRUCK ?auto_57486 ?auto_57487 ?auto_57484 ?auto_57488 )
      ( !UNLOAD-TRUCK ?auto_57485 ?auto_57486 ?auto_57484 )
      ( DELIVER-1PKG-VERIFY ?auto_57485 ?auto_57484 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_57506 - OBJ
      ?auto_57507 - OBJ
      ?auto_57505 - LOCATION
    )
    :vars
    (
      ?auto_57509 - LOCATION
      ?auto_57510 - CITY
      ?auto_57511 - LOCATION
      ?auto_57508 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57509 ?auto_57510 ) ( IN-CITY ?auto_57505 ?auto_57510 ) ( not ( = ?auto_57505 ?auto_57509 ) ) ( OBJ-AT ?auto_57507 ?auto_57509 ) ( IN-CITY ?auto_57511 ?auto_57510 ) ( not ( = ?auto_57505 ?auto_57511 ) ) ( OBJ-AT ?auto_57506 ?auto_57511 ) ( TRUCK-AT ?auto_57508 ?auto_57505 ) ( not ( = ?auto_57506 ?auto_57507 ) ) ( not ( = ?auto_57509 ?auto_57511 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_57506 ?auto_57505 )
      ( DELIVER-1PKG ?auto_57507 ?auto_57505 )
      ( DELIVER-2PKG-VERIFY ?auto_57506 ?auto_57507 ?auto_57505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_57617 - OBJ
      ?auto_57618 - OBJ
      ?auto_57619 - OBJ
      ?auto_57616 - LOCATION
    )
    :vars
    (
      ?auto_57621 - LOCATION
      ?auto_57622 - CITY
      ?auto_57624 - LOCATION
      ?auto_57623 - LOCATION
      ?auto_57620 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_57621 ?auto_57622 ) ( IN-CITY ?auto_57616 ?auto_57622 ) ( not ( = ?auto_57616 ?auto_57621 ) ) ( OBJ-AT ?auto_57619 ?auto_57621 ) ( IN-CITY ?auto_57624 ?auto_57622 ) ( not ( = ?auto_57616 ?auto_57624 ) ) ( OBJ-AT ?auto_57618 ?auto_57624 ) ( IN-CITY ?auto_57623 ?auto_57622 ) ( not ( = ?auto_57616 ?auto_57623 ) ) ( OBJ-AT ?auto_57617 ?auto_57623 ) ( TRUCK-AT ?auto_57620 ?auto_57616 ) ( not ( = ?auto_57617 ?auto_57618 ) ) ( not ( = ?auto_57624 ?auto_57623 ) ) ( not ( = ?auto_57617 ?auto_57619 ) ) ( not ( = ?auto_57618 ?auto_57619 ) ) ( not ( = ?auto_57621 ?auto_57624 ) ) ( not ( = ?auto_57621 ?auto_57623 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_57617 ?auto_57618 ?auto_57616 )
      ( DELIVER-1PKG ?auto_57619 ?auto_57616 )
      ( DELIVER-3PKG-VERIFY ?auto_57617 ?auto_57618 ?auto_57619 ?auto_57616 ) )
  )

  ( :method DELIVER-4PKG
    :parameters
    (
      ?auto_58760 - OBJ
      ?auto_58761 - OBJ
      ?auto_58762 - OBJ
      ?auto_58763 - OBJ
      ?auto_58759 - LOCATION
    )
    :vars
    (
      ?auto_58765 - LOCATION
      ?auto_58764 - CITY
      ?auto_58769 - LOCATION
      ?auto_58768 - LOCATION
      ?auto_58767 - LOCATION
      ?auto_58766 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_58765 ?auto_58764 ) ( IN-CITY ?auto_58759 ?auto_58764 ) ( not ( = ?auto_58759 ?auto_58765 ) ) ( OBJ-AT ?auto_58763 ?auto_58765 ) ( IN-CITY ?auto_58769 ?auto_58764 ) ( not ( = ?auto_58759 ?auto_58769 ) ) ( OBJ-AT ?auto_58762 ?auto_58769 ) ( IN-CITY ?auto_58768 ?auto_58764 ) ( not ( = ?auto_58759 ?auto_58768 ) ) ( OBJ-AT ?auto_58761 ?auto_58768 ) ( IN-CITY ?auto_58767 ?auto_58764 ) ( not ( = ?auto_58759 ?auto_58767 ) ) ( OBJ-AT ?auto_58760 ?auto_58767 ) ( TRUCK-AT ?auto_58766 ?auto_58759 ) ( not ( = ?auto_58760 ?auto_58761 ) ) ( not ( = ?auto_58768 ?auto_58767 ) ) ( not ( = ?auto_58760 ?auto_58762 ) ) ( not ( = ?auto_58761 ?auto_58762 ) ) ( not ( = ?auto_58769 ?auto_58768 ) ) ( not ( = ?auto_58769 ?auto_58767 ) ) ( not ( = ?auto_58760 ?auto_58763 ) ) ( not ( = ?auto_58761 ?auto_58763 ) ) ( not ( = ?auto_58762 ?auto_58763 ) ) ( not ( = ?auto_58765 ?auto_58769 ) ) ( not ( = ?auto_58765 ?auto_58768 ) ) ( not ( = ?auto_58765 ?auto_58767 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_58760 ?auto_58761 ?auto_58762 ?auto_58759 )
      ( DELIVER-1PKG ?auto_58763 ?auto_58759 )
      ( DELIVER-4PKG-VERIFY ?auto_58760 ?auto_58761 ?auto_58762 ?auto_58763 ?auto_58759 ) )
  )

  ( :method DELIVER-5PKG
    :parameters
    (
      ?auto_74452 - OBJ
      ?auto_74453 - OBJ
      ?auto_74454 - OBJ
      ?auto_74455 - OBJ
      ?auto_74456 - OBJ
      ?auto_74451 - LOCATION
    )
    :vars
    (
      ?auto_74459 - LOCATION
      ?auto_74458 - CITY
      ?auto_74463 - LOCATION
      ?auto_74460 - LOCATION
      ?auto_74461 - LOCATION
      ?auto_74462 - LOCATION
      ?auto_74457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_74459 ?auto_74458 ) ( IN-CITY ?auto_74451 ?auto_74458 ) ( not ( = ?auto_74451 ?auto_74459 ) ) ( OBJ-AT ?auto_74456 ?auto_74459 ) ( IN-CITY ?auto_74463 ?auto_74458 ) ( not ( = ?auto_74451 ?auto_74463 ) ) ( OBJ-AT ?auto_74455 ?auto_74463 ) ( IN-CITY ?auto_74460 ?auto_74458 ) ( not ( = ?auto_74451 ?auto_74460 ) ) ( OBJ-AT ?auto_74454 ?auto_74460 ) ( IN-CITY ?auto_74461 ?auto_74458 ) ( not ( = ?auto_74451 ?auto_74461 ) ) ( OBJ-AT ?auto_74453 ?auto_74461 ) ( IN-CITY ?auto_74462 ?auto_74458 ) ( not ( = ?auto_74451 ?auto_74462 ) ) ( OBJ-AT ?auto_74452 ?auto_74462 ) ( TRUCK-AT ?auto_74457 ?auto_74451 ) ( not ( = ?auto_74452 ?auto_74453 ) ) ( not ( = ?auto_74461 ?auto_74462 ) ) ( not ( = ?auto_74452 ?auto_74454 ) ) ( not ( = ?auto_74453 ?auto_74454 ) ) ( not ( = ?auto_74460 ?auto_74461 ) ) ( not ( = ?auto_74460 ?auto_74462 ) ) ( not ( = ?auto_74452 ?auto_74455 ) ) ( not ( = ?auto_74453 ?auto_74455 ) ) ( not ( = ?auto_74454 ?auto_74455 ) ) ( not ( = ?auto_74463 ?auto_74460 ) ) ( not ( = ?auto_74463 ?auto_74461 ) ) ( not ( = ?auto_74463 ?auto_74462 ) ) ( not ( = ?auto_74452 ?auto_74456 ) ) ( not ( = ?auto_74453 ?auto_74456 ) ) ( not ( = ?auto_74454 ?auto_74456 ) ) ( not ( = ?auto_74455 ?auto_74456 ) ) ( not ( = ?auto_74459 ?auto_74463 ) ) ( not ( = ?auto_74459 ?auto_74460 ) ) ( not ( = ?auto_74459 ?auto_74461 ) ) ( not ( = ?auto_74459 ?auto_74462 ) ) )
    :subtasks
    ( ( DELIVER-4PKG ?auto_74452 ?auto_74453 ?auto_74454 ?auto_74455 ?auto_74451 )
      ( DELIVER-1PKG ?auto_74456 ?auto_74451 )
      ( DELIVER-5PKG-VERIFY ?auto_74452 ?auto_74453 ?auto_74454 ?auto_74455 ?auto_74456 ?auto_74451 ) )
  )

)

