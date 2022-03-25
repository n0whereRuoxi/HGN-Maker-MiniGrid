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
      ( !UNLOAD-TRUCK ?auto_1324 ?auto_1325 ?auto_1323 )
      ( DELIVER-1PKG-VERIFY ?auto_1324 ?auto_1323 ) )
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
      ?auto_1349 - LOCATION
      ?auto_1347 - CITY
      ?auto_1348 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1349 ?auto_1347 ) ( IN-CITY ?auto_1344 ?auto_1347 ) ( not ( = ?auto_1344 ?auto_1349 ) ) ( OBJ-AT ?auto_1346 ?auto_1349 ) ( OBJ-AT ?auto_1345 ?auto_1349 ) ( TRUCK-AT ?auto_1348 ?auto_1344 ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1345 ?auto_1344 )
      ( DELIVER-1PKG ?auto_1346 ?auto_1344 )
      ( DELIVER-2PKG-VERIFY ?auto_1345 ?auto_1346 ?auto_1344 ) )
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
      ?auto_1458 - LOCATION
      ?auto_1457 - CITY
      ?auto_1459 - LOCATION
      ?auto_1456 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1458 ?auto_1457 ) ( IN-CITY ?auto_1452 ?auto_1457 ) ( not ( = ?auto_1452 ?auto_1458 ) ) ( OBJ-AT ?auto_1455 ?auto_1458 ) ( IN-CITY ?auto_1459 ?auto_1457 ) ( not ( = ?auto_1452 ?auto_1459 ) ) ( OBJ-AT ?auto_1454 ?auto_1459 ) ( OBJ-AT ?auto_1453 ?auto_1459 ) ( TRUCK-AT ?auto_1456 ?auto_1452 ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1455 ) ) ( not ( = ?auto_1454 ?auto_1455 ) ) ( not ( = ?auto_1458 ?auto_1459 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1453 ?auto_1454 ?auto_1452 )
      ( DELIVER-1PKG ?auto_1455 ?auto_1452 )
      ( DELIVER-3PKG-VERIFY ?auto_1453 ?auto_1454 ?auto_1455 ?auto_1452 ) )
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
      ?auto_1474 - LOCATION
      ?auto_1473 - CITY
      ?auto_1476 - LOCATION
      ?auto_1475 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1474 ?auto_1473 ) ( IN-CITY ?auto_1469 ?auto_1473 ) ( not ( = ?auto_1469 ?auto_1474 ) ) ( OBJ-AT ?auto_1471 ?auto_1474 ) ( IN-CITY ?auto_1476 ?auto_1473 ) ( not ( = ?auto_1469 ?auto_1476 ) ) ( OBJ-AT ?auto_1472 ?auto_1476 ) ( OBJ-AT ?auto_1470 ?auto_1476 ) ( TRUCK-AT ?auto_1475 ?auto_1469 ) ( not ( = ?auto_1470 ?auto_1472 ) ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( not ( = ?auto_1472 ?auto_1471 ) ) ( not ( = ?auto_1474 ?auto_1476 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1470 ?auto_1472 ?auto_1471 ?auto_1469 )
      ( DELIVER-3PKG-VERIFY ?auto_1470 ?auto_1471 ?auto_1472 ?auto_1469 ) )
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
      ?auto_1535 - LOCATION
      ?auto_1534 - CITY
      ?auto_1537 - LOCATION
      ?auto_1536 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1535 ?auto_1534 ) ( IN-CITY ?auto_1530 ?auto_1534 ) ( not ( = ?auto_1530 ?auto_1535 ) ) ( OBJ-AT ?auto_1531 ?auto_1535 ) ( IN-CITY ?auto_1537 ?auto_1534 ) ( not ( = ?auto_1530 ?auto_1537 ) ) ( OBJ-AT ?auto_1533 ?auto_1537 ) ( OBJ-AT ?auto_1532 ?auto_1537 ) ( TRUCK-AT ?auto_1536 ?auto_1530 ) ( not ( = ?auto_1532 ?auto_1533 ) ) ( not ( = ?auto_1532 ?auto_1531 ) ) ( not ( = ?auto_1533 ?auto_1531 ) ) ( not ( = ?auto_1535 ?auto_1537 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1532 ?auto_1531 ?auto_1533 ?auto_1530 )
      ( DELIVER-3PKG-VERIFY ?auto_1531 ?auto_1532 ?auto_1533 ?auto_1530 ) )
  )

)

