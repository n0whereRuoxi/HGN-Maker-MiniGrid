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
      ?auto_1324 - OBJ
      ?auto_1323 - LOCATION
    )
    :vars
    (
      ?auto_1326 - LOCATION
      ?auto_1327 - CITY
      ?auto_1325 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1326 ?auto_1327 ) ( IN-CITY ?auto_1323 ?auto_1327 ) ( not ( = ?auto_1323 ?auto_1326 ) ) ( OBJ-AT ?auto_1324 ?auto_1326 ) ( TRUCK-AT ?auto_1325 ?auto_1323 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1325 ?auto_1323 ?auto_1326 ?auto_1327 )
      ( !LOAD-TRUCK ?auto_1324 ?auto_1325 ?auto_1326 )
      ( !DRIVE-TRUCK ?auto_1325 ?auto_1326 ?auto_1323 ?auto_1327 )
      ( !UNLOAD-TRUCK ?auto_1324 ?auto_1325 ?auto_1323 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1345 - OBJ
      ?auto_1346 - OBJ
      ?auto_1344 - LOCATION
    )
    :vars
    (
      ?auto_1347 - LOCATION
      ?auto_1348 - CITY
      ?auto_1349 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1347 ?auto_1348 ) ( IN-CITY ?auto_1344 ?auto_1348 ) ( not ( = ?auto_1344 ?auto_1347 ) ) ( OBJ-AT ?auto_1346 ?auto_1347 ) ( OBJ-AT ?auto_1345 ?auto_1347 ) ( TRUCK-AT ?auto_1349 ?auto_1344 ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1345 ?auto_1344 )
      ( DELIVER-1PKG ?auto_1346 ?auto_1344 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1453 - OBJ
      ?auto_1454 - OBJ
      ?auto_1455 - OBJ
      ?auto_1452 - LOCATION
    )
    :vars
    (
      ?auto_1456 - LOCATION
      ?auto_1458 - CITY
      ?auto_1459 - LOCATION
      ?auto_1457 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1456 ?auto_1458 ) ( IN-CITY ?auto_1452 ?auto_1458 ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( OBJ-AT ?auto_1455 ?auto_1456 ) ( IN-CITY ?auto_1459 ?auto_1458 ) ( not ( = ?auto_1452 ?auto_1459 ) ) ( OBJ-AT ?auto_1454 ?auto_1459 ) ( OBJ-AT ?auto_1453 ?auto_1459 ) ( TRUCK-AT ?auto_1457 ?auto_1452 ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1455 ) ) ( not ( = ?auto_1454 ?auto_1455 ) ) ( not ( = ?auto_1456 ?auto_1459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1453 ?auto_1454 ?auto_1452 )
      ( DELIVER-1PKG ?auto_1455 ?auto_1452 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1470 - OBJ
      ?auto_1471 - OBJ
      ?auto_1472 - OBJ
      ?auto_1469 - LOCATION
    )
    :vars
    (
      ?auto_1476 - LOCATION
      ?auto_1475 - CITY
      ?auto_1473 - LOCATION
      ?auto_1474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1476 ?auto_1475 ) ( IN-CITY ?auto_1469 ?auto_1475 ) ( not ( = ?auto_1469 ?auto_1476 ) ) ( OBJ-AT ?auto_1471 ?auto_1476 ) ( IN-CITY ?auto_1473 ?auto_1475 ) ( not ( = ?auto_1469 ?auto_1473 ) ) ( OBJ-AT ?auto_1472 ?auto_1473 ) ( OBJ-AT ?auto_1470 ?auto_1473 ) ( TRUCK-AT ?auto_1474 ?auto_1469 ) ( not ( = ?auto_1470 ?auto_1472 ) ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( not ( = ?auto_1476 ?auto_1473 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1470 ?auto_1472 ?auto_1471 ?auto_1469 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1531 - OBJ
      ?auto_1532 - OBJ
      ?auto_1533 - OBJ
      ?auto_1530 - LOCATION
    )
    :vars
    (
      ?auto_1537 - LOCATION
      ?auto_1536 - CITY
      ?auto_1535 - LOCATION
      ?auto_1534 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1537 ?auto_1536 ) ( IN-CITY ?auto_1530 ?auto_1536 ) ( not ( = ?auto_1530 ?auto_1537 ) ) ( OBJ-AT ?auto_1531 ?auto_1537 ) ( IN-CITY ?auto_1535 ?auto_1536 ) ( not ( = ?auto_1530 ?auto_1535 ) ) ( OBJ-AT ?auto_1533 ?auto_1535 ) ( OBJ-AT ?auto_1532 ?auto_1535 ) ( TRUCK-AT ?auto_1534 ?auto_1530 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1531 ) ) ( not ( = ?auto_1533 ?auto_1531 ) ) ( not ( = ?auto_1537 ?auto_1535 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1532 ?auto_1531 ?auto_1533 ?auto_1530 ) )
  )

)

