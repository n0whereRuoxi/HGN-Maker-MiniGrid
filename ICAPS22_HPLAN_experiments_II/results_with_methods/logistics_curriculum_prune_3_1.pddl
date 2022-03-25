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
      ?auto_490 - OBJ
      ?auto_489 - LOCATION
    )
    :vars
    (
      ?auto_492 - LOCATION
      ?auto_493 - CITY
      ?auto_491 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_492 ?auto_493 ) ( IN-CITY ?auto_489 ?auto_493 ) ( not ( = ?auto_489 ?auto_492 ) ) ( OBJ-AT ?auto_490 ?auto_492 ) ( TRUCK-AT ?auto_491 ?auto_489 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_491 ?auto_489 ?auto_492 ?auto_493 )
      ( !LOAD-TRUCK ?auto_490 ?auto_491 ?auto_492 )
      ( !DRIVE-TRUCK ?auto_491 ?auto_492 ?auto_489 ?auto_493 )
      ( !UNLOAD-TRUCK ?auto_490 ?auto_491 ?auto_489 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_511 - OBJ
      ?auto_512 - OBJ
      ?auto_510 - LOCATION
    )
    :vars
    (
      ?auto_513 - LOCATION
      ?auto_514 - CITY
      ?auto_515 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_513 ?auto_514 ) ( IN-CITY ?auto_510 ?auto_514 ) ( not ( = ?auto_510 ?auto_513 ) ) ( OBJ-AT ?auto_512 ?auto_513 ) ( OBJ-AT ?auto_511 ?auto_513 ) ( TRUCK-AT ?auto_515 ?auto_510 ) ( not ( = ?auto_511 ?auto_512 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_511 ?auto_510 )
      ( DELIVER-1PKG ?auto_512 ?auto_510 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_618 - OBJ
      ?auto_619 - OBJ
      ?auto_620 - OBJ
      ?auto_617 - LOCATION
    )
    :vars
    (
      ?auto_621 - LOCATION
      ?auto_622 - CITY
      ?auto_623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_621 ?auto_622 ) ( IN-CITY ?auto_617 ?auto_622 ) ( not ( = ?auto_617 ?auto_621 ) ) ( OBJ-AT ?auto_620 ?auto_621 ) ( OBJ-AT ?auto_619 ?auto_621 ) ( OBJ-AT ?auto_618 ?auto_621 ) ( TRUCK-AT ?auto_623 ?auto_617 ) ( not ( = ?auto_618 ?auto_619 ) ) ( not ( = ?auto_618 ?auto_620 ) ) ( not ( = ?auto_619 ?auto_620 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_618 ?auto_619 ?auto_617 )
      ( DELIVER-1PKG ?auto_620 ?auto_617 ) )
  )

)

