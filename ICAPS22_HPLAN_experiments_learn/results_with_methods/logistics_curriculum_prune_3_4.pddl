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
      ?auto_1300 - OBJ
      ?auto_1299 - LOCATION
    )
    :vars
    (
      ?auto_1302 - LOCATION
      ?auto_1303 - CITY
      ?auto_1301 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1302 ?auto_1303 ) ( IN-CITY ?auto_1299 ?auto_1303 ) ( not ( = ?auto_1299 ?auto_1302 ) ) ( OBJ-AT ?auto_1300 ?auto_1302 ) ( TRUCK-AT ?auto_1301 ?auto_1299 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1301 ?auto_1299 ?auto_1302 ?auto_1303 )
      ( !LOAD-TRUCK ?auto_1300 ?auto_1301 ?auto_1302 )
      ( !DRIVE-TRUCK ?auto_1301 ?auto_1302 ?auto_1299 ?auto_1303 )
      ( !UNLOAD-TRUCK ?auto_1300 ?auto_1301 ?auto_1299 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1321 - OBJ
      ?auto_1322 - OBJ
      ?auto_1320 - LOCATION
    )
    :vars
    (
      ?auto_1325 - LOCATION
      ?auto_1324 - CITY
      ?auto_1326 - LOCATION
      ?auto_1323 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1325 ?auto_1324 ) ( IN-CITY ?auto_1320 ?auto_1324 ) ( not ( = ?auto_1320 ?auto_1325 ) ) ( OBJ-AT ?auto_1322 ?auto_1325 ) ( IN-CITY ?auto_1326 ?auto_1324 ) ( not ( = ?auto_1320 ?auto_1326 ) ) ( OBJ-AT ?auto_1321 ?auto_1326 ) ( TRUCK-AT ?auto_1323 ?auto_1320 ) ( not ( = ?auto_1321 ?auto_1322 ) ) ( not ( = ?auto_1325 ?auto_1326 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1321 ?auto_1320 )
      ( DELIVER-1PKG ?auto_1322 ?auto_1320 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1432 - OBJ
      ?auto_1433 - OBJ
      ?auto_1434 - OBJ
      ?auto_1431 - LOCATION
    )
    :vars
    (
      ?auto_1436 - LOCATION
      ?auto_1435 - CITY
      ?auto_1439 - LOCATION
      ?auto_1438 - LOCATION
      ?auto_1437 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1436 ?auto_1435 ) ( IN-CITY ?auto_1431 ?auto_1435 ) ( not ( = ?auto_1431 ?auto_1436 ) ) ( OBJ-AT ?auto_1434 ?auto_1436 ) ( IN-CITY ?auto_1439 ?auto_1435 ) ( not ( = ?auto_1431 ?auto_1439 ) ) ( OBJ-AT ?auto_1433 ?auto_1439 ) ( IN-CITY ?auto_1438 ?auto_1435 ) ( not ( = ?auto_1431 ?auto_1438 ) ) ( OBJ-AT ?auto_1432 ?auto_1438 ) ( TRUCK-AT ?auto_1437 ?auto_1431 ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( not ( = ?auto_1439 ?auto_1438 ) ) ( not ( = ?auto_1432 ?auto_1434 ) ) ( not ( = ?auto_1433 ?auto_1434 ) ) ( not ( = ?auto_1436 ?auto_1439 ) ) ( not ( = ?auto_1436 ?auto_1438 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1432 ?auto_1433 ?auto_1431 )
      ( DELIVER-1PKG ?auto_1434 ?auto_1431 ) )
  )

)

