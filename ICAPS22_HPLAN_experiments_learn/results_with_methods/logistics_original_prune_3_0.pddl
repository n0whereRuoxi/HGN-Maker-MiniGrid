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
      ?auto_1237 - OBJ
      ?auto_1236 - LOCATION
    )
    :vars
    (
      ?auto_1238 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1238 ?auto_1236 ) ( IN-TRUCK ?auto_1237 ?auto_1238 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1237 ?auto_1238 ?auto_1236 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1249 - OBJ
      ?auto_1248 - LOCATION
    )
    :vars
    (
      ?auto_1250 - TRUCK
      ?auto_1251 - LOCATION
      ?auto_1252 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1249 ?auto_1250 ) ( TRUCK-AT ?auto_1250 ?auto_1251 ) ( IN-CITY ?auto_1251 ?auto_1252 ) ( IN-CITY ?auto_1248 ?auto_1252 ) ( not ( = ?auto_1248 ?auto_1251 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1250 ?auto_1251 ?auto_1248 ?auto_1252 )
      ( DELIVER-1PKG ?auto_1249 ?auto_1248 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1267 - OBJ
      ?auto_1266 - LOCATION
    )
    :vars
    (
      ?auto_1268 - TRUCK
      ?auto_1269 - LOCATION
      ?auto_1270 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1268 ?auto_1269 ) ( IN-CITY ?auto_1269 ?auto_1270 ) ( IN-CITY ?auto_1266 ?auto_1270 ) ( not ( = ?auto_1266 ?auto_1269 ) ) ( OBJ-AT ?auto_1267 ?auto_1269 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1267 ?auto_1268 ?auto_1269 )
      ( DELIVER-1PKG ?auto_1267 ?auto_1266 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1285 - OBJ
      ?auto_1284 - LOCATION
    )
    :vars
    (
      ?auto_1287 - LOCATION
      ?auto_1286 - CITY
      ?auto_1288 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1287 ?auto_1286 ) ( IN-CITY ?auto_1284 ?auto_1286 ) ( not ( = ?auto_1284 ?auto_1287 ) ) ( OBJ-AT ?auto_1285 ?auto_1287 ) ( TRUCK-AT ?auto_1288 ?auto_1284 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1288 ?auto_1284 ?auto_1287 ?auto_1286 )
      ( DELIVER-1PKG ?auto_1285 ?auto_1284 ) )
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
      ?auto_1347 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1347 ?auto_1344 ) ( IN-TRUCK ?auto_1346 ?auto_1347 ) ( OBJ-AT ?auto_1345 ?auto_1344 ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1346 ?auto_1344 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1349 - OBJ
      ?auto_1350 - OBJ
      ?auto_1348 - LOCATION
    )
    :vars
    (
      ?auto_1351 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1351 ?auto_1348 ) ( IN-TRUCK ?auto_1349 ?auto_1351 ) ( OBJ-AT ?auto_1350 ?auto_1348 ) ( not ( = ?auto_1349 ?auto_1350 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1349 ?auto_1348 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1357 - OBJ
      ?auto_1358 - OBJ
      ?auto_1359 - OBJ
      ?auto_1356 - LOCATION
    )
    :vars
    (
      ?auto_1360 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1360 ?auto_1356 ) ( IN-TRUCK ?auto_1359 ?auto_1360 ) ( OBJ-AT ?auto_1357 ?auto_1356 ) ( OBJ-AT ?auto_1358 ?auto_1356 ) ( not ( = ?auto_1357 ?auto_1358 ) ) ( not ( = ?auto_1357 ?auto_1359 ) ) ( not ( = ?auto_1358 ?auto_1359 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1359 ?auto_1356 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1362 - OBJ
      ?auto_1363 - OBJ
      ?auto_1364 - OBJ
      ?auto_1361 - LOCATION
    )
    :vars
    (
      ?auto_1365 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1365 ?auto_1361 ) ( IN-TRUCK ?auto_1363 ?auto_1365 ) ( OBJ-AT ?auto_1362 ?auto_1361 ) ( OBJ-AT ?auto_1364 ?auto_1361 ) ( not ( = ?auto_1362 ?auto_1363 ) ) ( not ( = ?auto_1362 ?auto_1364 ) ) ( not ( = ?auto_1363 ?auto_1364 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1363 ?auto_1361 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1372 - OBJ
      ?auto_1373 - OBJ
      ?auto_1374 - OBJ
      ?auto_1371 - LOCATION
    )
    :vars
    (
      ?auto_1375 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1375 ?auto_1371 ) ( IN-TRUCK ?auto_1372 ?auto_1375 ) ( OBJ-AT ?auto_1373 ?auto_1371 ) ( OBJ-AT ?auto_1374 ?auto_1371 ) ( not ( = ?auto_1372 ?auto_1373 ) ) ( not ( = ?auto_1372 ?auto_1374 ) ) ( not ( = ?auto_1373 ?auto_1374 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1372 ?auto_1371 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1397 - OBJ
      ?auto_1398 - OBJ
      ?auto_1396 - LOCATION
    )
    :vars
    (
      ?auto_1400 - TRUCK
      ?auto_1399 - LOCATION
      ?auto_1401 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1398 ?auto_1400 ) ( TRUCK-AT ?auto_1400 ?auto_1399 ) ( IN-CITY ?auto_1399 ?auto_1401 ) ( IN-CITY ?auto_1396 ?auto_1401 ) ( not ( = ?auto_1396 ?auto_1399 ) ) ( OBJ-AT ?auto_1397 ?auto_1396 ) ( not ( = ?auto_1397 ?auto_1398 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1398 ?auto_1396 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1403 - OBJ
      ?auto_1404 - OBJ
      ?auto_1402 - LOCATION
    )
    :vars
    (
      ?auto_1405 - TRUCK
      ?auto_1406 - LOCATION
      ?auto_1407 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1403 ?auto_1405 ) ( TRUCK-AT ?auto_1405 ?auto_1406 ) ( IN-CITY ?auto_1406 ?auto_1407 ) ( IN-CITY ?auto_1402 ?auto_1407 ) ( not ( = ?auto_1402 ?auto_1406 ) ) ( OBJ-AT ?auto_1404 ?auto_1402 ) ( not ( = ?auto_1404 ?auto_1403 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1404 ?auto_1403 ?auto_1402 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1416 - OBJ
      ?auto_1417 - OBJ
      ?auto_1418 - OBJ
      ?auto_1415 - LOCATION
    )
    :vars
    (
      ?auto_1419 - TRUCK
      ?auto_1420 - LOCATION
      ?auto_1421 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1418 ?auto_1419 ) ( TRUCK-AT ?auto_1419 ?auto_1420 ) ( IN-CITY ?auto_1420 ?auto_1421 ) ( IN-CITY ?auto_1415 ?auto_1421 ) ( not ( = ?auto_1415 ?auto_1420 ) ) ( OBJ-AT ?auto_1416 ?auto_1415 ) ( not ( = ?auto_1416 ?auto_1418 ) ) ( OBJ-AT ?auto_1417 ?auto_1415 ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( not ( = ?auto_1417 ?auto_1418 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1416 ?auto_1418 ?auto_1415 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1423 - OBJ
      ?auto_1424 - OBJ
      ?auto_1425 - OBJ
      ?auto_1422 - LOCATION
    )
    :vars
    (
      ?auto_1426 - TRUCK
      ?auto_1427 - LOCATION
      ?auto_1428 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1424 ?auto_1426 ) ( TRUCK-AT ?auto_1426 ?auto_1427 ) ( IN-CITY ?auto_1427 ?auto_1428 ) ( IN-CITY ?auto_1422 ?auto_1428 ) ( not ( = ?auto_1422 ?auto_1427 ) ) ( OBJ-AT ?auto_1425 ?auto_1422 ) ( not ( = ?auto_1425 ?auto_1424 ) ) ( OBJ-AT ?auto_1423 ?auto_1422 ) ( not ( = ?auto_1423 ?auto_1424 ) ) ( not ( = ?auto_1423 ?auto_1425 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1425 ?auto_1424 ?auto_1422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1437 - OBJ
      ?auto_1438 - OBJ
      ?auto_1439 - OBJ
      ?auto_1436 - LOCATION
    )
    :vars
    (
      ?auto_1440 - TRUCK
      ?auto_1441 - LOCATION
      ?auto_1442 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1437 ?auto_1440 ) ( TRUCK-AT ?auto_1440 ?auto_1441 ) ( IN-CITY ?auto_1441 ?auto_1442 ) ( IN-CITY ?auto_1436 ?auto_1442 ) ( not ( = ?auto_1436 ?auto_1441 ) ) ( OBJ-AT ?auto_1438 ?auto_1436 ) ( not ( = ?auto_1438 ?auto_1437 ) ) ( OBJ-AT ?auto_1439 ?auto_1436 ) ( not ( = ?auto_1437 ?auto_1439 ) ) ( not ( = ?auto_1438 ?auto_1439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1438 ?auto_1437 ?auto_1436 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1466 - OBJ
      ?auto_1465 - LOCATION
    )
    :vars
    (
      ?auto_1467 - TRUCK
      ?auto_1468 - LOCATION
      ?auto_1470 - CITY
      ?auto_1469 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1467 ?auto_1468 ) ( IN-CITY ?auto_1468 ?auto_1470 ) ( IN-CITY ?auto_1465 ?auto_1470 ) ( not ( = ?auto_1465 ?auto_1468 ) ) ( OBJ-AT ?auto_1469 ?auto_1465 ) ( not ( = ?auto_1469 ?auto_1466 ) ) ( OBJ-AT ?auto_1466 ?auto_1468 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1466 ?auto_1467 ?auto_1468 )
      ( DELIVER-2PKG ?auto_1469 ?auto_1466 ?auto_1465 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1472 - OBJ
      ?auto_1473 - OBJ
      ?auto_1471 - LOCATION
    )
    :vars
    (
      ?auto_1476 - TRUCK
      ?auto_1475 - LOCATION
      ?auto_1474 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1476 ?auto_1475 ) ( IN-CITY ?auto_1475 ?auto_1474 ) ( IN-CITY ?auto_1471 ?auto_1474 ) ( not ( = ?auto_1471 ?auto_1475 ) ) ( OBJ-AT ?auto_1472 ?auto_1471 ) ( not ( = ?auto_1472 ?auto_1473 ) ) ( OBJ-AT ?auto_1473 ?auto_1475 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1473 ?auto_1471 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1478 - OBJ
      ?auto_1479 - OBJ
      ?auto_1477 - LOCATION
    )
    :vars
    (
      ?auto_1482 - TRUCK
      ?auto_1480 - LOCATION
      ?auto_1481 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1482 ?auto_1480 ) ( IN-CITY ?auto_1480 ?auto_1481 ) ( IN-CITY ?auto_1477 ?auto_1481 ) ( not ( = ?auto_1477 ?auto_1480 ) ) ( OBJ-AT ?auto_1479 ?auto_1477 ) ( not ( = ?auto_1479 ?auto_1478 ) ) ( OBJ-AT ?auto_1478 ?auto_1480 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1479 ?auto_1478 ?auto_1477 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1491 - OBJ
      ?auto_1492 - OBJ
      ?auto_1493 - OBJ
      ?auto_1490 - LOCATION
    )
    :vars
    (
      ?auto_1496 - TRUCK
      ?auto_1494 - LOCATION
      ?auto_1495 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1496 ?auto_1494 ) ( IN-CITY ?auto_1494 ?auto_1495 ) ( IN-CITY ?auto_1490 ?auto_1495 ) ( not ( = ?auto_1490 ?auto_1494 ) ) ( OBJ-AT ?auto_1491 ?auto_1490 ) ( not ( = ?auto_1491 ?auto_1493 ) ) ( OBJ-AT ?auto_1493 ?auto_1494 ) ( OBJ-AT ?auto_1492 ?auto_1490 ) ( not ( = ?auto_1491 ?auto_1492 ) ) ( not ( = ?auto_1492 ?auto_1493 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1491 ?auto_1493 ?auto_1490 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1498 - OBJ
      ?auto_1499 - OBJ
      ?auto_1500 - OBJ
      ?auto_1497 - LOCATION
    )
    :vars
    (
      ?auto_1503 - TRUCK
      ?auto_1501 - LOCATION
      ?auto_1502 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1503 ?auto_1501 ) ( IN-CITY ?auto_1501 ?auto_1502 ) ( IN-CITY ?auto_1497 ?auto_1502 ) ( not ( = ?auto_1497 ?auto_1501 ) ) ( OBJ-AT ?auto_1500 ?auto_1497 ) ( not ( = ?auto_1500 ?auto_1499 ) ) ( OBJ-AT ?auto_1499 ?auto_1501 ) ( OBJ-AT ?auto_1498 ?auto_1497 ) ( not ( = ?auto_1498 ?auto_1499 ) ) ( not ( = ?auto_1498 ?auto_1500 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1500 ?auto_1499 ?auto_1497 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1512 - OBJ
      ?auto_1513 - OBJ
      ?auto_1514 - OBJ
      ?auto_1511 - LOCATION
    )
    :vars
    (
      ?auto_1517 - TRUCK
      ?auto_1515 - LOCATION
      ?auto_1516 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1517 ?auto_1515 ) ( IN-CITY ?auto_1515 ?auto_1516 ) ( IN-CITY ?auto_1511 ?auto_1516 ) ( not ( = ?auto_1511 ?auto_1515 ) ) ( OBJ-AT ?auto_1513 ?auto_1511 ) ( not ( = ?auto_1513 ?auto_1512 ) ) ( OBJ-AT ?auto_1512 ?auto_1515 ) ( OBJ-AT ?auto_1514 ?auto_1511 ) ( not ( = ?auto_1512 ?auto_1514 ) ) ( not ( = ?auto_1513 ?auto_1514 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1513 ?auto_1512 ?auto_1511 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1541 - OBJ
      ?auto_1540 - LOCATION
    )
    :vars
    (
      ?auto_1542 - LOCATION
      ?auto_1543 - CITY
      ?auto_1545 - OBJ
      ?auto_1544 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1542 ?auto_1543 ) ( IN-CITY ?auto_1540 ?auto_1543 ) ( not ( = ?auto_1540 ?auto_1542 ) ) ( OBJ-AT ?auto_1545 ?auto_1540 ) ( not ( = ?auto_1545 ?auto_1541 ) ) ( OBJ-AT ?auto_1541 ?auto_1542 ) ( TRUCK-AT ?auto_1544 ?auto_1540 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1544 ?auto_1540 ?auto_1542 ?auto_1543 )
      ( DELIVER-2PKG ?auto_1545 ?auto_1541 ?auto_1540 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1547 - OBJ
      ?auto_1548 - OBJ
      ?auto_1546 - LOCATION
    )
    :vars
    (
      ?auto_1549 - LOCATION
      ?auto_1550 - CITY
      ?auto_1551 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1549 ?auto_1550 ) ( IN-CITY ?auto_1546 ?auto_1550 ) ( not ( = ?auto_1546 ?auto_1549 ) ) ( OBJ-AT ?auto_1547 ?auto_1546 ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( OBJ-AT ?auto_1548 ?auto_1549 ) ( TRUCK-AT ?auto_1551 ?auto_1546 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1548 ?auto_1546 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1553 - OBJ
      ?auto_1554 - OBJ
      ?auto_1552 - LOCATION
    )
    :vars
    (
      ?auto_1557 - LOCATION
      ?auto_1555 - CITY
      ?auto_1556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1557 ?auto_1555 ) ( IN-CITY ?auto_1552 ?auto_1555 ) ( not ( = ?auto_1552 ?auto_1557 ) ) ( OBJ-AT ?auto_1554 ?auto_1552 ) ( not ( = ?auto_1554 ?auto_1553 ) ) ( OBJ-AT ?auto_1553 ?auto_1557 ) ( TRUCK-AT ?auto_1556 ?auto_1552 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1554 ?auto_1553 ?auto_1552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1566 - OBJ
      ?auto_1567 - OBJ
      ?auto_1568 - OBJ
      ?auto_1565 - LOCATION
    )
    :vars
    (
      ?auto_1571 - LOCATION
      ?auto_1569 - CITY
      ?auto_1570 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1571 ?auto_1569 ) ( IN-CITY ?auto_1565 ?auto_1569 ) ( not ( = ?auto_1565 ?auto_1571 ) ) ( OBJ-AT ?auto_1566 ?auto_1565 ) ( not ( = ?auto_1566 ?auto_1568 ) ) ( OBJ-AT ?auto_1568 ?auto_1571 ) ( TRUCK-AT ?auto_1570 ?auto_1565 ) ( OBJ-AT ?auto_1567 ?auto_1565 ) ( not ( = ?auto_1566 ?auto_1567 ) ) ( not ( = ?auto_1567 ?auto_1568 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1566 ?auto_1568 ?auto_1565 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1573 - OBJ
      ?auto_1574 - OBJ
      ?auto_1575 - OBJ
      ?auto_1572 - LOCATION
    )
    :vars
    (
      ?auto_1578 - LOCATION
      ?auto_1576 - CITY
      ?auto_1577 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1578 ?auto_1576 ) ( IN-CITY ?auto_1572 ?auto_1576 ) ( not ( = ?auto_1572 ?auto_1578 ) ) ( OBJ-AT ?auto_1573 ?auto_1572 ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( OBJ-AT ?auto_1574 ?auto_1578 ) ( TRUCK-AT ?auto_1577 ?auto_1572 ) ( OBJ-AT ?auto_1575 ?auto_1572 ) ( not ( = ?auto_1573 ?auto_1575 ) ) ( not ( = ?auto_1574 ?auto_1575 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1573 ?auto_1574 ?auto_1572 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1587 - OBJ
      ?auto_1588 - OBJ
      ?auto_1589 - OBJ
      ?auto_1586 - LOCATION
    )
    :vars
    (
      ?auto_1592 - LOCATION
      ?auto_1590 - CITY
      ?auto_1591 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1592 ?auto_1590 ) ( IN-CITY ?auto_1586 ?auto_1590 ) ( not ( = ?auto_1586 ?auto_1592 ) ) ( OBJ-AT ?auto_1588 ?auto_1586 ) ( not ( = ?auto_1588 ?auto_1587 ) ) ( OBJ-AT ?auto_1587 ?auto_1592 ) ( TRUCK-AT ?auto_1591 ?auto_1586 ) ( OBJ-AT ?auto_1589 ?auto_1586 ) ( not ( = ?auto_1587 ?auto_1589 ) ) ( not ( = ?auto_1588 ?auto_1589 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1588 ?auto_1587 ?auto_1586 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1616 - OBJ
      ?auto_1615 - LOCATION
    )
    :vars
    (
      ?auto_1619 - LOCATION
      ?auto_1617 - CITY
      ?auto_1620 - OBJ
      ?auto_1618 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1619 ?auto_1617 ) ( IN-CITY ?auto_1615 ?auto_1617 ) ( not ( = ?auto_1615 ?auto_1619 ) ) ( not ( = ?auto_1620 ?auto_1616 ) ) ( OBJ-AT ?auto_1616 ?auto_1619 ) ( TRUCK-AT ?auto_1618 ?auto_1615 ) ( IN-TRUCK ?auto_1620 ?auto_1618 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1620 ?auto_1615 )
      ( DELIVER-2PKG ?auto_1620 ?auto_1616 ?auto_1615 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1622 - OBJ
      ?auto_1623 - OBJ
      ?auto_1621 - LOCATION
    )
    :vars
    (
      ?auto_1625 - LOCATION
      ?auto_1624 - CITY
      ?auto_1626 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1625 ?auto_1624 ) ( IN-CITY ?auto_1621 ?auto_1624 ) ( not ( = ?auto_1621 ?auto_1625 ) ) ( not ( = ?auto_1622 ?auto_1623 ) ) ( OBJ-AT ?auto_1623 ?auto_1625 ) ( TRUCK-AT ?auto_1626 ?auto_1621 ) ( IN-TRUCK ?auto_1622 ?auto_1626 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1623 ?auto_1621 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1628 - OBJ
      ?auto_1629 - OBJ
      ?auto_1627 - LOCATION
    )
    :vars
    (
      ?auto_1630 - LOCATION
      ?auto_1631 - CITY
      ?auto_1632 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1630 ?auto_1631 ) ( IN-CITY ?auto_1627 ?auto_1631 ) ( not ( = ?auto_1627 ?auto_1630 ) ) ( not ( = ?auto_1629 ?auto_1628 ) ) ( OBJ-AT ?auto_1628 ?auto_1630 ) ( TRUCK-AT ?auto_1632 ?auto_1627 ) ( IN-TRUCK ?auto_1629 ?auto_1632 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1629 ?auto_1628 ?auto_1627 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1691 - OBJ
      ?auto_1690 - LOCATION
    )
    :vars
    (
      ?auto_1692 - LOCATION
      ?auto_1693 - CITY
      ?auto_1695 - OBJ
      ?auto_1694 - TRUCK
      ?auto_1696 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1692 ?auto_1693 ) ( IN-CITY ?auto_1690 ?auto_1693 ) ( not ( = ?auto_1690 ?auto_1692 ) ) ( not ( = ?auto_1695 ?auto_1691 ) ) ( OBJ-AT ?auto_1691 ?auto_1692 ) ( IN-TRUCK ?auto_1695 ?auto_1694 ) ( TRUCK-AT ?auto_1694 ?auto_1696 ) ( IN-CITY ?auto_1696 ?auto_1693 ) ( not ( = ?auto_1690 ?auto_1696 ) ) ( not ( = ?auto_1692 ?auto_1696 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1694 ?auto_1696 ?auto_1690 ?auto_1693 )
      ( DELIVER-2PKG ?auto_1695 ?auto_1691 ?auto_1690 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1698 - OBJ
      ?auto_1699 - OBJ
      ?auto_1697 - LOCATION
    )
    :vars
    (
      ?auto_1702 - LOCATION
      ?auto_1701 - CITY
      ?auto_1700 - TRUCK
      ?auto_1703 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1702 ?auto_1701 ) ( IN-CITY ?auto_1697 ?auto_1701 ) ( not ( = ?auto_1697 ?auto_1702 ) ) ( not ( = ?auto_1698 ?auto_1699 ) ) ( OBJ-AT ?auto_1699 ?auto_1702 ) ( IN-TRUCK ?auto_1698 ?auto_1700 ) ( TRUCK-AT ?auto_1700 ?auto_1703 ) ( IN-CITY ?auto_1703 ?auto_1701 ) ( not ( = ?auto_1697 ?auto_1703 ) ) ( not ( = ?auto_1702 ?auto_1703 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1699 ?auto_1697 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1705 - OBJ
      ?auto_1706 - OBJ
      ?auto_1704 - LOCATION
    )
    :vars
    (
      ?auto_1709 - LOCATION
      ?auto_1710 - CITY
      ?auto_1707 - TRUCK
      ?auto_1708 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1709 ?auto_1710 ) ( IN-CITY ?auto_1704 ?auto_1710 ) ( not ( = ?auto_1704 ?auto_1709 ) ) ( not ( = ?auto_1706 ?auto_1705 ) ) ( OBJ-AT ?auto_1705 ?auto_1709 ) ( IN-TRUCK ?auto_1706 ?auto_1707 ) ( TRUCK-AT ?auto_1707 ?auto_1708 ) ( IN-CITY ?auto_1708 ?auto_1710 ) ( not ( = ?auto_1704 ?auto_1708 ) ) ( not ( = ?auto_1709 ?auto_1708 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1706 ?auto_1705 ?auto_1704 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1777 - OBJ
      ?auto_1776 - LOCATION
    )
    :vars
    (
      ?auto_1780 - LOCATION
      ?auto_1781 - CITY
      ?auto_1782 - OBJ
      ?auto_1778 - TRUCK
      ?auto_1779 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1780 ?auto_1781 ) ( IN-CITY ?auto_1776 ?auto_1781 ) ( not ( = ?auto_1776 ?auto_1780 ) ) ( not ( = ?auto_1782 ?auto_1777 ) ) ( OBJ-AT ?auto_1777 ?auto_1780 ) ( TRUCK-AT ?auto_1778 ?auto_1779 ) ( IN-CITY ?auto_1779 ?auto_1781 ) ( not ( = ?auto_1776 ?auto_1779 ) ) ( not ( = ?auto_1780 ?auto_1779 ) ) ( OBJ-AT ?auto_1782 ?auto_1779 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1782 ?auto_1778 ?auto_1779 )
      ( DELIVER-2PKG ?auto_1782 ?auto_1777 ?auto_1776 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1784 - OBJ
      ?auto_1785 - OBJ
      ?auto_1783 - LOCATION
    )
    :vars
    (
      ?auto_1787 - LOCATION
      ?auto_1789 - CITY
      ?auto_1788 - TRUCK
      ?auto_1786 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1787 ?auto_1789 ) ( IN-CITY ?auto_1783 ?auto_1789 ) ( not ( = ?auto_1783 ?auto_1787 ) ) ( not ( = ?auto_1784 ?auto_1785 ) ) ( OBJ-AT ?auto_1785 ?auto_1787 ) ( TRUCK-AT ?auto_1788 ?auto_1786 ) ( IN-CITY ?auto_1786 ?auto_1789 ) ( not ( = ?auto_1783 ?auto_1786 ) ) ( not ( = ?auto_1787 ?auto_1786 ) ) ( OBJ-AT ?auto_1784 ?auto_1786 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1785 ?auto_1783 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1791 - OBJ
      ?auto_1792 - OBJ
      ?auto_1790 - LOCATION
    )
    :vars
    (
      ?auto_1794 - LOCATION
      ?auto_1796 - CITY
      ?auto_1793 - TRUCK
      ?auto_1795 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1794 ?auto_1796 ) ( IN-CITY ?auto_1790 ?auto_1796 ) ( not ( = ?auto_1790 ?auto_1794 ) ) ( not ( = ?auto_1792 ?auto_1791 ) ) ( OBJ-AT ?auto_1791 ?auto_1794 ) ( TRUCK-AT ?auto_1793 ?auto_1795 ) ( IN-CITY ?auto_1795 ?auto_1796 ) ( not ( = ?auto_1790 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( OBJ-AT ?auto_1792 ?auto_1795 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1792 ?auto_1791 ?auto_1790 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2198 - OBJ
      ?auto_2199 - OBJ
      ?auto_2200 - OBJ
      ?auto_2197 - LOCATION
    )
    :vars
    (
      ?auto_2202 - TRUCK
      ?auto_2204 - LOCATION
      ?auto_2201 - CITY
      ?auto_2203 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2200 ?auto_2202 ) ( TRUCK-AT ?auto_2202 ?auto_2204 ) ( IN-CITY ?auto_2204 ?auto_2201 ) ( IN-CITY ?auto_2197 ?auto_2201 ) ( not ( = ?auto_2197 ?auto_2204 ) ) ( OBJ-AT ?auto_2203 ?auto_2197 ) ( not ( = ?auto_2203 ?auto_2200 ) ) ( OBJ-AT ?auto_2198 ?auto_2197 ) ( OBJ-AT ?auto_2199 ?auto_2197 ) ( not ( = ?auto_2198 ?auto_2199 ) ) ( not ( = ?auto_2198 ?auto_2200 ) ) ( not ( = ?auto_2198 ?auto_2203 ) ) ( not ( = ?auto_2199 ?auto_2200 ) ) ( not ( = ?auto_2199 ?auto_2203 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2203 ?auto_2200 ?auto_2197 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2210 - OBJ
      ?auto_2211 - OBJ
      ?auto_2212 - OBJ
      ?auto_2209 - LOCATION
    )
    :vars
    (
      ?auto_2214 - TRUCK
      ?auto_2216 - LOCATION
      ?auto_2213 - CITY
      ?auto_2215 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2211 ?auto_2214 ) ( TRUCK-AT ?auto_2214 ?auto_2216 ) ( IN-CITY ?auto_2216 ?auto_2213 ) ( IN-CITY ?auto_2209 ?auto_2213 ) ( not ( = ?auto_2209 ?auto_2216 ) ) ( OBJ-AT ?auto_2215 ?auto_2209 ) ( not ( = ?auto_2215 ?auto_2211 ) ) ( OBJ-AT ?auto_2210 ?auto_2209 ) ( OBJ-AT ?auto_2212 ?auto_2209 ) ( not ( = ?auto_2210 ?auto_2211 ) ) ( not ( = ?auto_2210 ?auto_2212 ) ) ( not ( = ?auto_2210 ?auto_2215 ) ) ( not ( = ?auto_2211 ?auto_2212 ) ) ( not ( = ?auto_2212 ?auto_2215 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2215 ?auto_2211 ?auto_2209 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2248 - OBJ
      ?auto_2249 - OBJ
      ?auto_2250 - OBJ
      ?auto_2247 - LOCATION
    )
    :vars
    (
      ?auto_2252 - TRUCK
      ?auto_2254 - LOCATION
      ?auto_2251 - CITY
      ?auto_2253 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2248 ?auto_2252 ) ( TRUCK-AT ?auto_2252 ?auto_2254 ) ( IN-CITY ?auto_2254 ?auto_2251 ) ( IN-CITY ?auto_2247 ?auto_2251 ) ( not ( = ?auto_2247 ?auto_2254 ) ) ( OBJ-AT ?auto_2253 ?auto_2247 ) ( not ( = ?auto_2253 ?auto_2248 ) ) ( OBJ-AT ?auto_2249 ?auto_2247 ) ( OBJ-AT ?auto_2250 ?auto_2247 ) ( not ( = ?auto_2248 ?auto_2249 ) ) ( not ( = ?auto_2248 ?auto_2250 ) ) ( not ( = ?auto_2249 ?auto_2250 ) ) ( not ( = ?auto_2249 ?auto_2253 ) ) ( not ( = ?auto_2250 ?auto_2253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2253 ?auto_2248 ?auto_2247 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2329 - OBJ
      ?auto_2330 - OBJ
      ?auto_2331 - OBJ
      ?auto_2328 - LOCATION
    )
    :vars
    (
      ?auto_2333 - TRUCK
      ?auto_2334 - LOCATION
      ?auto_2332 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2333 ?auto_2334 ) ( IN-CITY ?auto_2334 ?auto_2332 ) ( IN-CITY ?auto_2328 ?auto_2332 ) ( not ( = ?auto_2328 ?auto_2334 ) ) ( OBJ-AT ?auto_2329 ?auto_2328 ) ( not ( = ?auto_2329 ?auto_2330 ) ) ( OBJ-AT ?auto_2330 ?auto_2334 ) ( OBJ-AT ?auto_2331 ?auto_2328 ) ( not ( = ?auto_2329 ?auto_2331 ) ) ( not ( = ?auto_2330 ?auto_2331 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2329 ?auto_2330 ?auto_2328 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2351 - OBJ
      ?auto_2352 - OBJ
      ?auto_2353 - OBJ
      ?auto_2350 - LOCATION
    )
    :vars
    (
      ?auto_2355 - TRUCK
      ?auto_2356 - LOCATION
      ?auto_2354 - CITY
      ?auto_2357 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2355 ?auto_2356 ) ( IN-CITY ?auto_2356 ?auto_2354 ) ( IN-CITY ?auto_2350 ?auto_2354 ) ( not ( = ?auto_2350 ?auto_2356 ) ) ( OBJ-AT ?auto_2357 ?auto_2350 ) ( not ( = ?auto_2357 ?auto_2353 ) ) ( OBJ-AT ?auto_2353 ?auto_2356 ) ( OBJ-AT ?auto_2351 ?auto_2350 ) ( OBJ-AT ?auto_2352 ?auto_2350 ) ( not ( = ?auto_2351 ?auto_2352 ) ) ( not ( = ?auto_2351 ?auto_2353 ) ) ( not ( = ?auto_2351 ?auto_2357 ) ) ( not ( = ?auto_2352 ?auto_2353 ) ) ( not ( = ?auto_2352 ?auto_2357 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2357 ?auto_2353 ?auto_2350 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2363 - OBJ
      ?auto_2364 - OBJ
      ?auto_2365 - OBJ
      ?auto_2362 - LOCATION
    )
    :vars
    (
      ?auto_2367 - TRUCK
      ?auto_2368 - LOCATION
      ?auto_2366 - CITY
      ?auto_2369 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2367 ?auto_2368 ) ( IN-CITY ?auto_2368 ?auto_2366 ) ( IN-CITY ?auto_2362 ?auto_2366 ) ( not ( = ?auto_2362 ?auto_2368 ) ) ( OBJ-AT ?auto_2369 ?auto_2362 ) ( not ( = ?auto_2369 ?auto_2364 ) ) ( OBJ-AT ?auto_2364 ?auto_2368 ) ( OBJ-AT ?auto_2363 ?auto_2362 ) ( OBJ-AT ?auto_2365 ?auto_2362 ) ( not ( = ?auto_2363 ?auto_2364 ) ) ( not ( = ?auto_2363 ?auto_2365 ) ) ( not ( = ?auto_2363 ?auto_2369 ) ) ( not ( = ?auto_2364 ?auto_2365 ) ) ( not ( = ?auto_2365 ?auto_2369 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2369 ?auto_2364 ?auto_2362 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2401 - OBJ
      ?auto_2402 - OBJ
      ?auto_2403 - OBJ
      ?auto_2400 - LOCATION
    )
    :vars
    (
      ?auto_2405 - TRUCK
      ?auto_2406 - LOCATION
      ?auto_2404 - CITY
      ?auto_2407 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2405 ?auto_2406 ) ( IN-CITY ?auto_2406 ?auto_2404 ) ( IN-CITY ?auto_2400 ?auto_2404 ) ( not ( = ?auto_2400 ?auto_2406 ) ) ( OBJ-AT ?auto_2407 ?auto_2400 ) ( not ( = ?auto_2407 ?auto_2401 ) ) ( OBJ-AT ?auto_2401 ?auto_2406 ) ( OBJ-AT ?auto_2402 ?auto_2400 ) ( OBJ-AT ?auto_2403 ?auto_2400 ) ( not ( = ?auto_2401 ?auto_2402 ) ) ( not ( = ?auto_2401 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2403 ) ) ( not ( = ?auto_2402 ?auto_2407 ) ) ( not ( = ?auto_2403 ?auto_2407 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2407 ?auto_2401 ?auto_2400 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2471 - OBJ
      ?auto_2472 - OBJ
      ?auto_2473 - OBJ
      ?auto_2470 - LOCATION
    )
    :vars
    (
      ?auto_2476 - LOCATION
      ?auto_2475 - CITY
      ?auto_2474 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2476 ?auto_2475 ) ( IN-CITY ?auto_2470 ?auto_2475 ) ( not ( = ?auto_2470 ?auto_2476 ) ) ( OBJ-AT ?auto_2472 ?auto_2470 ) ( not ( = ?auto_2472 ?auto_2473 ) ) ( OBJ-AT ?auto_2473 ?auto_2476 ) ( TRUCK-AT ?auto_2474 ?auto_2470 ) ( OBJ-AT ?auto_2471 ?auto_2470 ) ( not ( = ?auto_2471 ?auto_2472 ) ) ( not ( = ?auto_2471 ?auto_2473 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2472 ?auto_2473 ?auto_2470 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2504 - OBJ
      ?auto_2505 - OBJ
      ?auto_2506 - OBJ
      ?auto_2503 - LOCATION
    )
    :vars
    (
      ?auto_2509 - LOCATION
      ?auto_2508 - CITY
      ?auto_2510 - OBJ
      ?auto_2507 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2509 ?auto_2508 ) ( IN-CITY ?auto_2503 ?auto_2508 ) ( not ( = ?auto_2503 ?auto_2509 ) ) ( OBJ-AT ?auto_2510 ?auto_2503 ) ( not ( = ?auto_2510 ?auto_2506 ) ) ( OBJ-AT ?auto_2506 ?auto_2509 ) ( TRUCK-AT ?auto_2507 ?auto_2503 ) ( OBJ-AT ?auto_2504 ?auto_2503 ) ( OBJ-AT ?auto_2505 ?auto_2503 ) ( not ( = ?auto_2504 ?auto_2505 ) ) ( not ( = ?auto_2504 ?auto_2506 ) ) ( not ( = ?auto_2504 ?auto_2510 ) ) ( not ( = ?auto_2505 ?auto_2506 ) ) ( not ( = ?auto_2505 ?auto_2510 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2510 ?auto_2506 ?auto_2503 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2516 - OBJ
      ?auto_2517 - OBJ
      ?auto_2518 - OBJ
      ?auto_2515 - LOCATION
    )
    :vars
    (
      ?auto_2521 - LOCATION
      ?auto_2520 - CITY
      ?auto_2522 - OBJ
      ?auto_2519 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2521 ?auto_2520 ) ( IN-CITY ?auto_2515 ?auto_2520 ) ( not ( = ?auto_2515 ?auto_2521 ) ) ( OBJ-AT ?auto_2522 ?auto_2515 ) ( not ( = ?auto_2522 ?auto_2517 ) ) ( OBJ-AT ?auto_2517 ?auto_2521 ) ( TRUCK-AT ?auto_2519 ?auto_2515 ) ( OBJ-AT ?auto_2516 ?auto_2515 ) ( OBJ-AT ?auto_2518 ?auto_2515 ) ( not ( = ?auto_2516 ?auto_2517 ) ) ( not ( = ?auto_2516 ?auto_2518 ) ) ( not ( = ?auto_2516 ?auto_2522 ) ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2518 ?auto_2522 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2522 ?auto_2517 ?auto_2515 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2554 - OBJ
      ?auto_2555 - OBJ
      ?auto_2556 - OBJ
      ?auto_2553 - LOCATION
    )
    :vars
    (
      ?auto_2559 - LOCATION
      ?auto_2558 - CITY
      ?auto_2560 - OBJ
      ?auto_2557 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2559 ?auto_2558 ) ( IN-CITY ?auto_2553 ?auto_2558 ) ( not ( = ?auto_2553 ?auto_2559 ) ) ( OBJ-AT ?auto_2560 ?auto_2553 ) ( not ( = ?auto_2560 ?auto_2554 ) ) ( OBJ-AT ?auto_2554 ?auto_2559 ) ( TRUCK-AT ?auto_2557 ?auto_2553 ) ( OBJ-AT ?auto_2555 ?auto_2553 ) ( OBJ-AT ?auto_2556 ?auto_2553 ) ( not ( = ?auto_2554 ?auto_2555 ) ) ( not ( = ?auto_2554 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2556 ) ) ( not ( = ?auto_2555 ?auto_2560 ) ) ( not ( = ?auto_2556 ?auto_2560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2560 ?auto_2554 ?auto_2553 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2695 - OBJ
      ?auto_2696 - OBJ
      ?auto_2697 - OBJ
      ?auto_2694 - LOCATION
    )
    :vars
    (
      ?auto_2699 - LOCATION
      ?auto_2700 - CITY
      ?auto_2698 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2699 ?auto_2700 ) ( IN-CITY ?auto_2694 ?auto_2700 ) ( not ( = ?auto_2694 ?auto_2699 ) ) ( OBJ-AT ?auto_2697 ?auto_2694 ) ( not ( = ?auto_2697 ?auto_2695 ) ) ( OBJ-AT ?auto_2695 ?auto_2699 ) ( TRUCK-AT ?auto_2698 ?auto_2694 ) ( OBJ-AT ?auto_2696 ?auto_2694 ) ( not ( = ?auto_2695 ?auto_2696 ) ) ( not ( = ?auto_2696 ?auto_2697 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2697 ?auto_2695 ?auto_2694 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2762 - OBJ
      ?auto_2761 - LOCATION
    )
    :vars
    (
      ?auto_2765 - LOCATION
      ?auto_2766 - CITY
      ?auto_2764 - OBJ
      ?auto_2763 - TRUCK
      ?auto_2767 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2765 ?auto_2766 ) ( IN-CITY ?auto_2761 ?auto_2766 ) ( not ( = ?auto_2761 ?auto_2765 ) ) ( OBJ-AT ?auto_2764 ?auto_2761 ) ( not ( = ?auto_2764 ?auto_2762 ) ) ( OBJ-AT ?auto_2762 ?auto_2765 ) ( TRUCK-AT ?auto_2763 ?auto_2767 ) ( IN-CITY ?auto_2767 ?auto_2766 ) ( not ( = ?auto_2761 ?auto_2767 ) ) ( not ( = ?auto_2765 ?auto_2767 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2763 ?auto_2767 ?auto_2761 ?auto_2766 )
      ( DELIVER-2PKG ?auto_2764 ?auto_2762 ?auto_2761 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2769 - OBJ
      ?auto_2770 - OBJ
      ?auto_2768 - LOCATION
    )
    :vars
    (
      ?auto_2771 - LOCATION
      ?auto_2772 - CITY
      ?auto_2773 - TRUCK
      ?auto_2774 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2771 ?auto_2772 ) ( IN-CITY ?auto_2768 ?auto_2772 ) ( not ( = ?auto_2768 ?auto_2771 ) ) ( OBJ-AT ?auto_2769 ?auto_2768 ) ( not ( = ?auto_2769 ?auto_2770 ) ) ( OBJ-AT ?auto_2770 ?auto_2771 ) ( TRUCK-AT ?auto_2773 ?auto_2774 ) ( IN-CITY ?auto_2774 ?auto_2772 ) ( not ( = ?auto_2768 ?auto_2774 ) ) ( not ( = ?auto_2771 ?auto_2774 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2770 ?auto_2768 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2784 - OBJ
      ?auto_2785 - OBJ
      ?auto_2783 - LOCATION
    )
    :vars
    (
      ?auto_2789 - LOCATION
      ?auto_2788 - CITY
      ?auto_2786 - TRUCK
      ?auto_2787 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2789 ?auto_2788 ) ( IN-CITY ?auto_2783 ?auto_2788 ) ( not ( = ?auto_2783 ?auto_2789 ) ) ( OBJ-AT ?auto_2785 ?auto_2783 ) ( not ( = ?auto_2785 ?auto_2784 ) ) ( OBJ-AT ?auto_2784 ?auto_2789 ) ( TRUCK-AT ?auto_2786 ?auto_2787 ) ( IN-CITY ?auto_2787 ?auto_2788 ) ( not ( = ?auto_2783 ?auto_2787 ) ) ( not ( = ?auto_2789 ?auto_2787 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2785 ?auto_2784 ?auto_2783 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2807 - OBJ
      ?auto_2808 - OBJ
      ?auto_2809 - OBJ
      ?auto_2806 - LOCATION
    )
    :vars
    (
      ?auto_2813 - LOCATION
      ?auto_2812 - CITY
      ?auto_2810 - TRUCK
      ?auto_2811 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2813 ?auto_2812 ) ( IN-CITY ?auto_2806 ?auto_2812 ) ( not ( = ?auto_2806 ?auto_2813 ) ) ( OBJ-AT ?auto_2807 ?auto_2806 ) ( not ( = ?auto_2807 ?auto_2809 ) ) ( OBJ-AT ?auto_2809 ?auto_2813 ) ( TRUCK-AT ?auto_2810 ?auto_2811 ) ( IN-CITY ?auto_2811 ?auto_2812 ) ( not ( = ?auto_2806 ?auto_2811 ) ) ( not ( = ?auto_2813 ?auto_2811 ) ) ( OBJ-AT ?auto_2808 ?auto_2806 ) ( not ( = ?auto_2807 ?auto_2808 ) ) ( not ( = ?auto_2808 ?auto_2809 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2807 ?auto_2809 ?auto_2806 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2823 - OBJ
      ?auto_2824 - OBJ
      ?auto_2825 - OBJ
      ?auto_2822 - LOCATION
    )
    :vars
    (
      ?auto_2829 - LOCATION
      ?auto_2828 - CITY
      ?auto_2826 - TRUCK
      ?auto_2827 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2829 ?auto_2828 ) ( IN-CITY ?auto_2822 ?auto_2828 ) ( not ( = ?auto_2822 ?auto_2829 ) ) ( OBJ-AT ?auto_2825 ?auto_2822 ) ( not ( = ?auto_2825 ?auto_2824 ) ) ( OBJ-AT ?auto_2824 ?auto_2829 ) ( TRUCK-AT ?auto_2826 ?auto_2827 ) ( IN-CITY ?auto_2827 ?auto_2828 ) ( not ( = ?auto_2822 ?auto_2827 ) ) ( not ( = ?auto_2829 ?auto_2827 ) ) ( OBJ-AT ?auto_2823 ?auto_2822 ) ( not ( = ?auto_2823 ?auto_2824 ) ) ( not ( = ?auto_2823 ?auto_2825 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2825 ?auto_2824 ?auto_2822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2890 - OBJ
      ?auto_2891 - OBJ
      ?auto_2892 - OBJ
      ?auto_2889 - LOCATION
    )
    :vars
    (
      ?auto_2896 - LOCATION
      ?auto_2895 - CITY
      ?auto_2893 - TRUCK
      ?auto_2894 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2896 ?auto_2895 ) ( IN-CITY ?auto_2889 ?auto_2895 ) ( not ( = ?auto_2889 ?auto_2896 ) ) ( OBJ-AT ?auto_2892 ?auto_2889 ) ( not ( = ?auto_2892 ?auto_2890 ) ) ( OBJ-AT ?auto_2890 ?auto_2896 ) ( TRUCK-AT ?auto_2893 ?auto_2894 ) ( IN-CITY ?auto_2894 ?auto_2895 ) ( not ( = ?auto_2889 ?auto_2894 ) ) ( not ( = ?auto_2896 ?auto_2894 ) ) ( OBJ-AT ?auto_2891 ?auto_2889 ) ( not ( = ?auto_2890 ?auto_2891 ) ) ( not ( = ?auto_2891 ?auto_2892 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2892 ?auto_2890 ?auto_2889 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3081 - OBJ
      ?auto_3082 - OBJ
      ?auto_3083 - OBJ
      ?auto_3080 - LOCATION
    )
    :vars
    (
      ?auto_3087 - LOCATION
      ?auto_3086 - CITY
      ?auto_3085 - TRUCK
      ?auto_3084 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3087 ?auto_3086 ) ( IN-CITY ?auto_3080 ?auto_3086 ) ( not ( = ?auto_3080 ?auto_3087 ) ) ( OBJ-AT ?auto_3082 ?auto_3080 ) ( not ( = ?auto_3082 ?auto_3081 ) ) ( OBJ-AT ?auto_3081 ?auto_3087 ) ( TRUCK-AT ?auto_3085 ?auto_3084 ) ( IN-CITY ?auto_3084 ?auto_3086 ) ( not ( = ?auto_3080 ?auto_3084 ) ) ( not ( = ?auto_3087 ?auto_3084 ) ) ( OBJ-AT ?auto_3083 ?auto_3080 ) ( not ( = ?auto_3081 ?auto_3083 ) ) ( not ( = ?auto_3082 ?auto_3083 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3082 ?auto_3081 ?auto_3080 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3200 - OBJ
      ?auto_3201 - OBJ
      ?auto_3202 - OBJ
      ?auto_3199 - LOCATION
    )
    :vars
    (
      ?auto_3205 - LOCATION
      ?auto_3204 - CITY
      ?auto_3203 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3205 ?auto_3204 ) ( IN-CITY ?auto_3199 ?auto_3204 ) ( not ( = ?auto_3199 ?auto_3205 ) ) ( OBJ-AT ?auto_3202 ?auto_3199 ) ( not ( = ?auto_3202 ?auto_3201 ) ) ( OBJ-AT ?auto_3201 ?auto_3205 ) ( TRUCK-AT ?auto_3203 ?auto_3199 ) ( OBJ-AT ?auto_3200 ?auto_3199 ) ( not ( = ?auto_3200 ?auto_3201 ) ) ( not ( = ?auto_3200 ?auto_3202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3202 ?auto_3201 ?auto_3199 ) )
  )

)

