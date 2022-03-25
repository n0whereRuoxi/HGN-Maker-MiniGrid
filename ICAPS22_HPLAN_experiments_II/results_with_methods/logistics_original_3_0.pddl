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
      ?auto_1283 - OBJ
      ?auto_1282 - LOCATION
    )
    :vars
    (
      ?auto_1284 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1284 ?auto_1282 ) ( IN-TRUCK ?auto_1283 ?auto_1284 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1283 ?auto_1284 ?auto_1282 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1295 - OBJ
      ?auto_1294 - LOCATION
    )
    :vars
    (
      ?auto_1296 - TRUCK
      ?auto_1297 - LOCATION
      ?auto_1298 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1295 ?auto_1296 ) ( TRUCK-AT ?auto_1296 ?auto_1297 ) ( IN-CITY ?auto_1297 ?auto_1298 ) ( IN-CITY ?auto_1294 ?auto_1298 ) ( not ( = ?auto_1294 ?auto_1297 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1296 ?auto_1297 ?auto_1294 ?auto_1298 )
      ( DELIVER-1PKG ?auto_1295 ?auto_1294 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1313 - OBJ
      ?auto_1312 - LOCATION
    )
    :vars
    (
      ?auto_1315 - TRUCK
      ?auto_1314 - LOCATION
      ?auto_1316 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1315 ?auto_1314 ) ( IN-CITY ?auto_1314 ?auto_1316 ) ( IN-CITY ?auto_1312 ?auto_1316 ) ( not ( = ?auto_1312 ?auto_1314 ) ) ( OBJ-AT ?auto_1313 ?auto_1314 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1313 ?auto_1315 ?auto_1314 )
      ( DELIVER-1PKG ?auto_1313 ?auto_1312 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1331 - OBJ
      ?auto_1330 - LOCATION
    )
    :vars
    (
      ?auto_1332 - LOCATION
      ?auto_1334 - CITY
      ?auto_1333 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1332 ?auto_1334 ) ( IN-CITY ?auto_1330 ?auto_1334 ) ( not ( = ?auto_1330 ?auto_1332 ) ) ( OBJ-AT ?auto_1331 ?auto_1332 ) ( TRUCK-AT ?auto_1333 ?auto_1330 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1333 ?auto_1330 ?auto_1332 ?auto_1334 )
      ( DELIVER-1PKG ?auto_1331 ?auto_1330 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1388 - OBJ
      ?auto_1387 - LOCATION
    )
    :vars
    (
      ?auto_1389 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1389 ?auto_1387 ) ( IN-TRUCK ?auto_1388 ?auto_1389 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_1388 ?auto_1389 ?auto_1387 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1391 - OBJ
      ?auto_1392 - OBJ
      ?auto_1390 - LOCATION
    )
    :vars
    (
      ?auto_1393 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1393 ?auto_1390 ) ( IN-TRUCK ?auto_1392 ?auto_1393 ) ( OBJ-AT ?auto_1391 ?auto_1390 ) ( not ( = ?auto_1391 ?auto_1392 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1392 ?auto_1390 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1395 - OBJ
      ?auto_1396 - OBJ
      ?auto_1394 - LOCATION
    )
    :vars
    (
      ?auto_1397 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1397 ?auto_1394 ) ( IN-TRUCK ?auto_1395 ?auto_1397 ) ( OBJ-AT ?auto_1396 ?auto_1394 ) ( not ( = ?auto_1395 ?auto_1396 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1395 ?auto_1394 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1403 - OBJ
      ?auto_1404 - OBJ
      ?auto_1405 - OBJ
      ?auto_1402 - LOCATION
    )
    :vars
    (
      ?auto_1406 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1406 ?auto_1402 ) ( IN-TRUCK ?auto_1405 ?auto_1406 ) ( OBJ-AT ?auto_1403 ?auto_1402 ) ( OBJ-AT ?auto_1404 ?auto_1402 ) ( not ( = ?auto_1403 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1405 ) ) ( not ( = ?auto_1404 ?auto_1405 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1405 ?auto_1402 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1408 - OBJ
      ?auto_1409 - OBJ
      ?auto_1410 - OBJ
      ?auto_1407 - LOCATION
    )
    :vars
    (
      ?auto_1411 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1411 ?auto_1407 ) ( IN-TRUCK ?auto_1409 ?auto_1411 ) ( OBJ-AT ?auto_1408 ?auto_1407 ) ( OBJ-AT ?auto_1410 ?auto_1407 ) ( not ( = ?auto_1408 ?auto_1409 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1409 ?auto_1410 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1409 ?auto_1407 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1418 - OBJ
      ?auto_1419 - OBJ
      ?auto_1420 - OBJ
      ?auto_1417 - LOCATION
    )
    :vars
    (
      ?auto_1421 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1421 ?auto_1417 ) ( IN-TRUCK ?auto_1418 ?auto_1421 ) ( OBJ-AT ?auto_1419 ?auto_1417 ) ( OBJ-AT ?auto_1420 ?auto_1417 ) ( not ( = ?auto_1418 ?auto_1419 ) ) ( not ( = ?auto_1418 ?auto_1420 ) ) ( not ( = ?auto_1419 ?auto_1420 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1418 ?auto_1417 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1438 - OBJ
      ?auto_1437 - LOCATION
    )
    :vars
    (
      ?auto_1439 - TRUCK
      ?auto_1440 - LOCATION
      ?auto_1441 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1438 ?auto_1439 ) ( TRUCK-AT ?auto_1439 ?auto_1440 ) ( IN-CITY ?auto_1440 ?auto_1441 ) ( IN-CITY ?auto_1437 ?auto_1441 ) ( not ( = ?auto_1437 ?auto_1440 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1439 ?auto_1440 ?auto_1437 ?auto_1441 )
      ( DELIVER-1PKG ?auto_1438 ?auto_1437 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1443 - OBJ
      ?auto_1444 - OBJ
      ?auto_1442 - LOCATION
    )
    :vars
    (
      ?auto_1446 - TRUCK
      ?auto_1445 - LOCATION
      ?auto_1447 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1444 ?auto_1446 ) ( TRUCK-AT ?auto_1446 ?auto_1445 ) ( IN-CITY ?auto_1445 ?auto_1447 ) ( IN-CITY ?auto_1442 ?auto_1447 ) ( not ( = ?auto_1442 ?auto_1445 ) ) ( OBJ-AT ?auto_1443 ?auto_1442 ) ( not ( = ?auto_1443 ?auto_1444 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1444 ?auto_1442 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1449 - OBJ
      ?auto_1450 - OBJ
      ?auto_1448 - LOCATION
    )
    :vars
    (
      ?auto_1453 - TRUCK
      ?auto_1451 - LOCATION
      ?auto_1452 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1449 ?auto_1453 ) ( TRUCK-AT ?auto_1453 ?auto_1451 ) ( IN-CITY ?auto_1451 ?auto_1452 ) ( IN-CITY ?auto_1448 ?auto_1452 ) ( not ( = ?auto_1448 ?auto_1451 ) ) ( OBJ-AT ?auto_1450 ?auto_1448 ) ( not ( = ?auto_1450 ?auto_1449 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1450 ?auto_1449 ?auto_1448 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1462 - OBJ
      ?auto_1463 - OBJ
      ?auto_1464 - OBJ
      ?auto_1461 - LOCATION
    )
    :vars
    (
      ?auto_1467 - TRUCK
      ?auto_1465 - LOCATION
      ?auto_1466 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1464 ?auto_1467 ) ( TRUCK-AT ?auto_1467 ?auto_1465 ) ( IN-CITY ?auto_1465 ?auto_1466 ) ( IN-CITY ?auto_1461 ?auto_1466 ) ( not ( = ?auto_1461 ?auto_1465 ) ) ( OBJ-AT ?auto_1462 ?auto_1461 ) ( not ( = ?auto_1462 ?auto_1464 ) ) ( OBJ-AT ?auto_1463 ?auto_1461 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1463 ?auto_1464 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1462 ?auto_1464 ?auto_1461 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1469 - OBJ
      ?auto_1470 - OBJ
      ?auto_1471 - OBJ
      ?auto_1468 - LOCATION
    )
    :vars
    (
      ?auto_1474 - TRUCK
      ?auto_1472 - LOCATION
      ?auto_1473 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1470 ?auto_1474 ) ( TRUCK-AT ?auto_1474 ?auto_1472 ) ( IN-CITY ?auto_1472 ?auto_1473 ) ( IN-CITY ?auto_1468 ?auto_1473 ) ( not ( = ?auto_1468 ?auto_1472 ) ) ( OBJ-AT ?auto_1471 ?auto_1468 ) ( not ( = ?auto_1471 ?auto_1470 ) ) ( OBJ-AT ?auto_1469 ?auto_1468 ) ( not ( = ?auto_1469 ?auto_1470 ) ) ( not ( = ?auto_1469 ?auto_1471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1471 ?auto_1470 ?auto_1468 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1483 - OBJ
      ?auto_1484 - OBJ
      ?auto_1485 - OBJ
      ?auto_1482 - LOCATION
    )
    :vars
    (
      ?auto_1488 - TRUCK
      ?auto_1486 - LOCATION
      ?auto_1487 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_1483 ?auto_1488 ) ( TRUCK-AT ?auto_1488 ?auto_1486 ) ( IN-CITY ?auto_1486 ?auto_1487 ) ( IN-CITY ?auto_1482 ?auto_1487 ) ( not ( = ?auto_1482 ?auto_1486 ) ) ( OBJ-AT ?auto_1484 ?auto_1482 ) ( not ( = ?auto_1484 ?auto_1483 ) ) ( OBJ-AT ?auto_1485 ?auto_1482 ) ( not ( = ?auto_1483 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1485 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1484 ?auto_1483 ?auto_1482 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1512 - OBJ
      ?auto_1511 - LOCATION
    )
    :vars
    (
      ?auto_1516 - TRUCK
      ?auto_1513 - LOCATION
      ?auto_1514 - CITY
      ?auto_1515 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1516 ?auto_1513 ) ( IN-CITY ?auto_1513 ?auto_1514 ) ( IN-CITY ?auto_1511 ?auto_1514 ) ( not ( = ?auto_1511 ?auto_1513 ) ) ( OBJ-AT ?auto_1515 ?auto_1511 ) ( not ( = ?auto_1515 ?auto_1512 ) ) ( OBJ-AT ?auto_1512 ?auto_1513 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1512 ?auto_1516 ?auto_1513 )
      ( DELIVER-2PKG ?auto_1515 ?auto_1512 ?auto_1511 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1518 - OBJ
      ?auto_1519 - OBJ
      ?auto_1517 - LOCATION
    )
    :vars
    (
      ?auto_1522 - TRUCK
      ?auto_1521 - LOCATION
      ?auto_1520 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1522 ?auto_1521 ) ( IN-CITY ?auto_1521 ?auto_1520 ) ( IN-CITY ?auto_1517 ?auto_1520 ) ( not ( = ?auto_1517 ?auto_1521 ) ) ( OBJ-AT ?auto_1518 ?auto_1517 ) ( not ( = ?auto_1518 ?auto_1519 ) ) ( OBJ-AT ?auto_1519 ?auto_1521 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1519 ?auto_1517 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1524 - OBJ
      ?auto_1525 - OBJ
      ?auto_1523 - LOCATION
    )
    :vars
    (
      ?auto_1528 - TRUCK
      ?auto_1527 - LOCATION
      ?auto_1526 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1528 ?auto_1527 ) ( IN-CITY ?auto_1527 ?auto_1526 ) ( IN-CITY ?auto_1523 ?auto_1526 ) ( not ( = ?auto_1523 ?auto_1527 ) ) ( OBJ-AT ?auto_1525 ?auto_1523 ) ( not ( = ?auto_1525 ?auto_1524 ) ) ( OBJ-AT ?auto_1524 ?auto_1527 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1525 ?auto_1524 ?auto_1523 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1537 - OBJ
      ?auto_1538 - OBJ
      ?auto_1539 - OBJ
      ?auto_1536 - LOCATION
    )
    :vars
    (
      ?auto_1542 - TRUCK
      ?auto_1541 - LOCATION
      ?auto_1540 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1542 ?auto_1541 ) ( IN-CITY ?auto_1541 ?auto_1540 ) ( IN-CITY ?auto_1536 ?auto_1540 ) ( not ( = ?auto_1536 ?auto_1541 ) ) ( OBJ-AT ?auto_1537 ?auto_1536 ) ( not ( = ?auto_1537 ?auto_1539 ) ) ( OBJ-AT ?auto_1539 ?auto_1541 ) ( OBJ-AT ?auto_1538 ?auto_1536 ) ( not ( = ?auto_1537 ?auto_1538 ) ) ( not ( = ?auto_1538 ?auto_1539 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1537 ?auto_1539 ?auto_1536 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1544 - OBJ
      ?auto_1545 - OBJ
      ?auto_1546 - OBJ
      ?auto_1543 - LOCATION
    )
    :vars
    (
      ?auto_1549 - TRUCK
      ?auto_1548 - LOCATION
      ?auto_1547 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1549 ?auto_1548 ) ( IN-CITY ?auto_1548 ?auto_1547 ) ( IN-CITY ?auto_1543 ?auto_1547 ) ( not ( = ?auto_1543 ?auto_1548 ) ) ( OBJ-AT ?auto_1546 ?auto_1543 ) ( not ( = ?auto_1546 ?auto_1545 ) ) ( OBJ-AT ?auto_1545 ?auto_1548 ) ( OBJ-AT ?auto_1544 ?auto_1543 ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( not ( = ?auto_1544 ?auto_1546 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1546 ?auto_1545 ?auto_1543 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1558 - OBJ
      ?auto_1559 - OBJ
      ?auto_1560 - OBJ
      ?auto_1557 - LOCATION
    )
    :vars
    (
      ?auto_1563 - TRUCK
      ?auto_1562 - LOCATION
      ?auto_1561 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_1563 ?auto_1562 ) ( IN-CITY ?auto_1562 ?auto_1561 ) ( IN-CITY ?auto_1557 ?auto_1561 ) ( not ( = ?auto_1557 ?auto_1562 ) ) ( OBJ-AT ?auto_1559 ?auto_1557 ) ( not ( = ?auto_1559 ?auto_1558 ) ) ( OBJ-AT ?auto_1558 ?auto_1562 ) ( OBJ-AT ?auto_1560 ?auto_1557 ) ( not ( = ?auto_1558 ?auto_1560 ) ) ( not ( = ?auto_1559 ?auto_1560 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1559 ?auto_1558 ?auto_1557 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1587 - OBJ
      ?auto_1586 - LOCATION
    )
    :vars
    (
      ?auto_1589 - LOCATION
      ?auto_1588 - CITY
      ?auto_1591 - OBJ
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1589 ?auto_1588 ) ( IN-CITY ?auto_1586 ?auto_1588 ) ( not ( = ?auto_1586 ?auto_1589 ) ) ( OBJ-AT ?auto_1591 ?auto_1586 ) ( not ( = ?auto_1591 ?auto_1587 ) ) ( OBJ-AT ?auto_1587 ?auto_1589 ) ( TRUCK-AT ?auto_1590 ?auto_1586 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1590 ?auto_1586 ?auto_1589 ?auto_1588 )
      ( DELIVER-2PKG ?auto_1591 ?auto_1587 ?auto_1586 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1593 - OBJ
      ?auto_1594 - OBJ
      ?auto_1592 - LOCATION
    )
    :vars
    (
      ?auto_1595 - LOCATION
      ?auto_1597 - CITY
      ?auto_1596 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1595 ?auto_1597 ) ( IN-CITY ?auto_1592 ?auto_1597 ) ( not ( = ?auto_1592 ?auto_1595 ) ) ( OBJ-AT ?auto_1593 ?auto_1592 ) ( not ( = ?auto_1593 ?auto_1594 ) ) ( OBJ-AT ?auto_1594 ?auto_1595 ) ( TRUCK-AT ?auto_1596 ?auto_1592 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1594 ?auto_1592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1599 - OBJ
      ?auto_1600 - OBJ
      ?auto_1598 - LOCATION
    )
    :vars
    (
      ?auto_1601 - LOCATION
      ?auto_1603 - CITY
      ?auto_1602 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1601 ?auto_1603 ) ( IN-CITY ?auto_1598 ?auto_1603 ) ( not ( = ?auto_1598 ?auto_1601 ) ) ( OBJ-AT ?auto_1600 ?auto_1598 ) ( not ( = ?auto_1600 ?auto_1599 ) ) ( OBJ-AT ?auto_1599 ?auto_1601 ) ( TRUCK-AT ?auto_1602 ?auto_1598 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1600 ?auto_1599 ?auto_1598 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1612 - OBJ
      ?auto_1613 - OBJ
      ?auto_1614 - OBJ
      ?auto_1611 - LOCATION
    )
    :vars
    (
      ?auto_1615 - LOCATION
      ?auto_1617 - CITY
      ?auto_1616 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1615 ?auto_1617 ) ( IN-CITY ?auto_1611 ?auto_1617 ) ( not ( = ?auto_1611 ?auto_1615 ) ) ( OBJ-AT ?auto_1612 ?auto_1611 ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( OBJ-AT ?auto_1614 ?auto_1615 ) ( TRUCK-AT ?auto_1616 ?auto_1611 ) ( OBJ-AT ?auto_1613 ?auto_1611 ) ( not ( = ?auto_1612 ?auto_1613 ) ) ( not ( = ?auto_1613 ?auto_1614 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1612 ?auto_1614 ?auto_1611 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1619 - OBJ
      ?auto_1620 - OBJ
      ?auto_1621 - OBJ
      ?auto_1618 - LOCATION
    )
    :vars
    (
      ?auto_1622 - LOCATION
      ?auto_1624 - CITY
      ?auto_1623 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1622 ?auto_1624 ) ( IN-CITY ?auto_1618 ?auto_1624 ) ( not ( = ?auto_1618 ?auto_1622 ) ) ( OBJ-AT ?auto_1621 ?auto_1618 ) ( not ( = ?auto_1621 ?auto_1620 ) ) ( OBJ-AT ?auto_1620 ?auto_1622 ) ( TRUCK-AT ?auto_1623 ?auto_1618 ) ( OBJ-AT ?auto_1619 ?auto_1618 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1621 ?auto_1620 ?auto_1618 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1633 - OBJ
      ?auto_1634 - OBJ
      ?auto_1635 - OBJ
      ?auto_1632 - LOCATION
    )
    :vars
    (
      ?auto_1636 - LOCATION
      ?auto_1638 - CITY
      ?auto_1637 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1636 ?auto_1638 ) ( IN-CITY ?auto_1632 ?auto_1638 ) ( not ( = ?auto_1632 ?auto_1636 ) ) ( OBJ-AT ?auto_1634 ?auto_1632 ) ( not ( = ?auto_1634 ?auto_1633 ) ) ( OBJ-AT ?auto_1633 ?auto_1636 ) ( TRUCK-AT ?auto_1637 ?auto_1632 ) ( OBJ-AT ?auto_1635 ?auto_1632 ) ( not ( = ?auto_1633 ?auto_1635 ) ) ( not ( = ?auto_1634 ?auto_1635 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1634 ?auto_1633 ?auto_1632 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1662 - OBJ
      ?auto_1661 - LOCATION
    )
    :vars
    (
      ?auto_1663 - LOCATION
      ?auto_1665 - CITY
      ?auto_1666 - OBJ
      ?auto_1664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1663 ?auto_1665 ) ( IN-CITY ?auto_1661 ?auto_1665 ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( not ( = ?auto_1666 ?auto_1662 ) ) ( OBJ-AT ?auto_1662 ?auto_1663 ) ( TRUCK-AT ?auto_1664 ?auto_1661 ) ( IN-TRUCK ?auto_1666 ?auto_1664 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1666 ?auto_1661 )
      ( DELIVER-2PKG ?auto_1666 ?auto_1662 ?auto_1661 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1668 - OBJ
      ?auto_1669 - OBJ
      ?auto_1667 - LOCATION
    )
    :vars
    (
      ?auto_1670 - LOCATION
      ?auto_1672 - CITY
      ?auto_1671 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1670 ?auto_1672 ) ( IN-CITY ?auto_1667 ?auto_1672 ) ( not ( = ?auto_1667 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( OBJ-AT ?auto_1669 ?auto_1670 ) ( TRUCK-AT ?auto_1671 ?auto_1667 ) ( IN-TRUCK ?auto_1668 ?auto_1671 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1669 ?auto_1667 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1674 - OBJ
      ?auto_1675 - OBJ
      ?auto_1673 - LOCATION
    )
    :vars
    (
      ?auto_1678 - LOCATION
      ?auto_1677 - CITY
      ?auto_1676 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1678 ?auto_1677 ) ( IN-CITY ?auto_1673 ?auto_1677 ) ( not ( = ?auto_1673 ?auto_1678 ) ) ( not ( = ?auto_1675 ?auto_1674 ) ) ( OBJ-AT ?auto_1674 ?auto_1678 ) ( TRUCK-AT ?auto_1676 ?auto_1673 ) ( IN-TRUCK ?auto_1675 ?auto_1676 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1675 ?auto_1674 ?auto_1673 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1737 - OBJ
      ?auto_1736 - LOCATION
    )
    :vars
    (
      ?auto_1740 - LOCATION
      ?auto_1739 - CITY
      ?auto_1741 - OBJ
      ?auto_1738 - TRUCK
      ?auto_1742 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1740 ?auto_1739 ) ( IN-CITY ?auto_1736 ?auto_1739 ) ( not ( = ?auto_1736 ?auto_1740 ) ) ( not ( = ?auto_1741 ?auto_1737 ) ) ( OBJ-AT ?auto_1737 ?auto_1740 ) ( IN-TRUCK ?auto_1741 ?auto_1738 ) ( TRUCK-AT ?auto_1738 ?auto_1742 ) ( IN-CITY ?auto_1742 ?auto_1739 ) ( not ( = ?auto_1736 ?auto_1742 ) ) ( not ( = ?auto_1740 ?auto_1742 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1738 ?auto_1742 ?auto_1736 ?auto_1739 )
      ( DELIVER-2PKG ?auto_1741 ?auto_1737 ?auto_1736 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1744 - OBJ
      ?auto_1745 - OBJ
      ?auto_1743 - LOCATION
    )
    :vars
    (
      ?auto_1748 - LOCATION
      ?auto_1746 - CITY
      ?auto_1747 - TRUCK
      ?auto_1749 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1748 ?auto_1746 ) ( IN-CITY ?auto_1743 ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1748 ) ) ( not ( = ?auto_1744 ?auto_1745 ) ) ( OBJ-AT ?auto_1745 ?auto_1748 ) ( IN-TRUCK ?auto_1744 ?auto_1747 ) ( TRUCK-AT ?auto_1747 ?auto_1749 ) ( IN-CITY ?auto_1749 ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1749 ) ) ( not ( = ?auto_1748 ?auto_1749 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1745 ?auto_1743 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1751 - OBJ
      ?auto_1752 - OBJ
      ?auto_1750 - LOCATION
    )
    :vars
    (
      ?auto_1754 - LOCATION
      ?auto_1753 - CITY
      ?auto_1756 - TRUCK
      ?auto_1755 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1754 ?auto_1753 ) ( IN-CITY ?auto_1750 ?auto_1753 ) ( not ( = ?auto_1750 ?auto_1754 ) ) ( not ( = ?auto_1752 ?auto_1751 ) ) ( OBJ-AT ?auto_1751 ?auto_1754 ) ( IN-TRUCK ?auto_1752 ?auto_1756 ) ( TRUCK-AT ?auto_1756 ?auto_1755 ) ( IN-CITY ?auto_1755 ?auto_1753 ) ( not ( = ?auto_1750 ?auto_1755 ) ) ( not ( = ?auto_1754 ?auto_1755 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1752 ?auto_1751 ?auto_1750 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1823 - OBJ
      ?auto_1822 - LOCATION
    )
    :vars
    (
      ?auto_1825 - LOCATION
      ?auto_1824 - CITY
      ?auto_1828 - OBJ
      ?auto_1827 - TRUCK
      ?auto_1826 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1825 ?auto_1824 ) ( IN-CITY ?auto_1822 ?auto_1824 ) ( not ( = ?auto_1822 ?auto_1825 ) ) ( not ( = ?auto_1828 ?auto_1823 ) ) ( OBJ-AT ?auto_1823 ?auto_1825 ) ( TRUCK-AT ?auto_1827 ?auto_1826 ) ( IN-CITY ?auto_1826 ?auto_1824 ) ( not ( = ?auto_1822 ?auto_1826 ) ) ( not ( = ?auto_1825 ?auto_1826 ) ) ( OBJ-AT ?auto_1828 ?auto_1826 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_1828 ?auto_1827 ?auto_1826 )
      ( DELIVER-2PKG ?auto_1828 ?auto_1823 ?auto_1822 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1830 - OBJ
      ?auto_1831 - OBJ
      ?auto_1829 - LOCATION
    )
    :vars
    (
      ?auto_1833 - LOCATION
      ?auto_1832 - CITY
      ?auto_1834 - TRUCK
      ?auto_1835 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1833 ?auto_1832 ) ( IN-CITY ?auto_1829 ?auto_1832 ) ( not ( = ?auto_1829 ?auto_1833 ) ) ( not ( = ?auto_1830 ?auto_1831 ) ) ( OBJ-AT ?auto_1831 ?auto_1833 ) ( TRUCK-AT ?auto_1834 ?auto_1835 ) ( IN-CITY ?auto_1835 ?auto_1832 ) ( not ( = ?auto_1829 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( OBJ-AT ?auto_1830 ?auto_1835 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1831 ?auto_1829 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1837 - OBJ
      ?auto_1838 - OBJ
      ?auto_1836 - LOCATION
    )
    :vars
    (
      ?auto_1842 - LOCATION
      ?auto_1840 - CITY
      ?auto_1839 - TRUCK
      ?auto_1841 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_1842 ?auto_1840 ) ( IN-CITY ?auto_1836 ?auto_1840 ) ( not ( = ?auto_1836 ?auto_1842 ) ) ( not ( = ?auto_1838 ?auto_1837 ) ) ( OBJ-AT ?auto_1837 ?auto_1842 ) ( TRUCK-AT ?auto_1839 ?auto_1841 ) ( IN-CITY ?auto_1841 ?auto_1840 ) ( not ( = ?auto_1836 ?auto_1841 ) ) ( not ( = ?auto_1842 ?auto_1841 ) ) ( OBJ-AT ?auto_1838 ?auto_1841 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1838 ?auto_1837 ?auto_1836 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1909 - OBJ
      ?auto_1908 - LOCATION
    )
    :vars
    (
      ?auto_1913 - LOCATION
      ?auto_1911 - CITY
      ?auto_1914 - OBJ
      ?auto_1912 - LOCATION
      ?auto_1910 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1913 ?auto_1911 ) ( IN-CITY ?auto_1908 ?auto_1911 ) ( not ( = ?auto_1908 ?auto_1913 ) ) ( not ( = ?auto_1914 ?auto_1909 ) ) ( OBJ-AT ?auto_1909 ?auto_1913 ) ( IN-CITY ?auto_1912 ?auto_1911 ) ( not ( = ?auto_1908 ?auto_1912 ) ) ( not ( = ?auto_1913 ?auto_1912 ) ) ( OBJ-AT ?auto_1914 ?auto_1912 ) ( TRUCK-AT ?auto_1910 ?auto_1908 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1910 ?auto_1908 ?auto_1912 ?auto_1911 )
      ( DELIVER-2PKG ?auto_1914 ?auto_1909 ?auto_1908 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1916 - OBJ
      ?auto_1917 - OBJ
      ?auto_1915 - LOCATION
    )
    :vars
    (
      ?auto_1921 - LOCATION
      ?auto_1920 - CITY
      ?auto_1919 - LOCATION
      ?auto_1918 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1921 ?auto_1920 ) ( IN-CITY ?auto_1915 ?auto_1920 ) ( not ( = ?auto_1915 ?auto_1921 ) ) ( not ( = ?auto_1916 ?auto_1917 ) ) ( OBJ-AT ?auto_1917 ?auto_1921 ) ( IN-CITY ?auto_1919 ?auto_1920 ) ( not ( = ?auto_1915 ?auto_1919 ) ) ( not ( = ?auto_1921 ?auto_1919 ) ) ( OBJ-AT ?auto_1916 ?auto_1919 ) ( TRUCK-AT ?auto_1918 ?auto_1915 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1917 ?auto_1915 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1923 - OBJ
      ?auto_1924 - OBJ
      ?auto_1922 - LOCATION
    )
    :vars
    (
      ?auto_1927 - LOCATION
      ?auto_1928 - CITY
      ?auto_1926 - LOCATION
      ?auto_1925 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1927 ?auto_1928 ) ( IN-CITY ?auto_1922 ?auto_1928 ) ( not ( = ?auto_1922 ?auto_1927 ) ) ( not ( = ?auto_1924 ?auto_1923 ) ) ( OBJ-AT ?auto_1923 ?auto_1927 ) ( IN-CITY ?auto_1926 ?auto_1928 ) ( not ( = ?auto_1922 ?auto_1926 ) ) ( not ( = ?auto_1927 ?auto_1926 ) ) ( OBJ-AT ?auto_1924 ?auto_1926 ) ( TRUCK-AT ?auto_1925 ?auto_1922 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1924 ?auto_1923 ?auto_1922 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2088 - OBJ
      ?auto_2087 - LOCATION
    )
    :vars
    (
      ?auto_2089 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2089 ?auto_2087 ) ( IN-TRUCK ?auto_2088 ?auto_2089 ) )
    :subtasks
    ( ( !UNLOAD-TRUCK ?auto_2088 ?auto_2089 ?auto_2087 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2091 - OBJ
      ?auto_2092 - OBJ
      ?auto_2090 - LOCATION
    )
    :vars
    (
      ?auto_2093 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2093 ?auto_2090 ) ( IN-TRUCK ?auto_2092 ?auto_2093 ) ( OBJ-AT ?auto_2091 ?auto_2090 ) ( not ( = ?auto_2091 ?auto_2092 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2092 ?auto_2090 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2095 - OBJ
      ?auto_2096 - OBJ
      ?auto_2094 - LOCATION
    )
    :vars
    (
      ?auto_2097 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2097 ?auto_2094 ) ( IN-TRUCK ?auto_2096 ?auto_2097 ) ( OBJ-AT ?auto_2095 ?auto_2094 ) ( not ( = ?auto_2095 ?auto_2096 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2096 ?auto_2094 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2099 - OBJ
      ?auto_2100 - OBJ
      ?auto_2098 - LOCATION
    )
    :vars
    (
      ?auto_2101 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2101 ?auto_2098 ) ( IN-TRUCK ?auto_2099 ?auto_2101 ) ( OBJ-AT ?auto_2100 ?auto_2098 ) ( not ( = ?auto_2099 ?auto_2100 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2099 ?auto_2098 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2103 - OBJ
      ?auto_2104 - OBJ
      ?auto_2102 - LOCATION
    )
    :vars
    (
      ?auto_2105 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2105 ?auto_2102 ) ( IN-TRUCK ?auto_2103 ?auto_2105 ) ( OBJ-AT ?auto_2104 ?auto_2102 ) ( not ( = ?auto_2103 ?auto_2104 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2103 ?auto_2102 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2111 - OBJ
      ?auto_2112 - OBJ
      ?auto_2113 - OBJ
      ?auto_2110 - LOCATION
    )
    :vars
    (
      ?auto_2114 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2114 ?auto_2110 ) ( IN-TRUCK ?auto_2113 ?auto_2114 ) ( OBJ-AT ?auto_2111 ?auto_2110 ) ( OBJ-AT ?auto_2112 ?auto_2110 ) ( not ( = ?auto_2111 ?auto_2112 ) ) ( not ( = ?auto_2111 ?auto_2113 ) ) ( not ( = ?auto_2112 ?auto_2113 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2113 ?auto_2110 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2116 - OBJ
      ?auto_2117 - OBJ
      ?auto_2118 - OBJ
      ?auto_2115 - LOCATION
    )
    :vars
    (
      ?auto_2119 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2119 ?auto_2115 ) ( IN-TRUCK ?auto_2118 ?auto_2119 ) ( OBJ-AT ?auto_2116 ?auto_2115 ) ( OBJ-AT ?auto_2117 ?auto_2115 ) ( not ( = ?auto_2116 ?auto_2117 ) ) ( not ( = ?auto_2116 ?auto_2118 ) ) ( not ( = ?auto_2117 ?auto_2118 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2118 ?auto_2115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2121 - OBJ
      ?auto_2122 - OBJ
      ?auto_2123 - OBJ
      ?auto_2120 - LOCATION
    )
    :vars
    (
      ?auto_2124 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2124 ?auto_2120 ) ( IN-TRUCK ?auto_2122 ?auto_2124 ) ( OBJ-AT ?auto_2121 ?auto_2120 ) ( OBJ-AT ?auto_2123 ?auto_2120 ) ( not ( = ?auto_2121 ?auto_2122 ) ) ( not ( = ?auto_2121 ?auto_2123 ) ) ( not ( = ?auto_2122 ?auto_2123 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2122 ?auto_2120 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2126 - OBJ
      ?auto_2127 - OBJ
      ?auto_2128 - OBJ
      ?auto_2125 - LOCATION
    )
    :vars
    (
      ?auto_2129 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2129 ?auto_2125 ) ( IN-TRUCK ?auto_2127 ?auto_2129 ) ( OBJ-AT ?auto_2126 ?auto_2125 ) ( OBJ-AT ?auto_2128 ?auto_2125 ) ( not ( = ?auto_2126 ?auto_2127 ) ) ( not ( = ?auto_2126 ?auto_2128 ) ) ( not ( = ?auto_2127 ?auto_2128 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2127 ?auto_2125 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2136 - OBJ
      ?auto_2137 - OBJ
      ?auto_2138 - OBJ
      ?auto_2135 - LOCATION
    )
    :vars
    (
      ?auto_2139 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2139 ?auto_2135 ) ( IN-TRUCK ?auto_2138 ?auto_2139 ) ( OBJ-AT ?auto_2136 ?auto_2135 ) ( OBJ-AT ?auto_2137 ?auto_2135 ) ( not ( = ?auto_2136 ?auto_2137 ) ) ( not ( = ?auto_2136 ?auto_2138 ) ) ( not ( = ?auto_2137 ?auto_2138 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2138 ?auto_2135 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2141 - OBJ
      ?auto_2142 - OBJ
      ?auto_2143 - OBJ
      ?auto_2140 - LOCATION
    )
    :vars
    (
      ?auto_2144 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2144 ?auto_2140 ) ( IN-TRUCK ?auto_2143 ?auto_2144 ) ( OBJ-AT ?auto_2141 ?auto_2140 ) ( OBJ-AT ?auto_2142 ?auto_2140 ) ( not ( = ?auto_2141 ?auto_2142 ) ) ( not ( = ?auto_2141 ?auto_2143 ) ) ( not ( = ?auto_2142 ?auto_2143 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2143 ?auto_2140 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2146 - OBJ
      ?auto_2147 - OBJ
      ?auto_2148 - OBJ
      ?auto_2145 - LOCATION
    )
    :vars
    (
      ?auto_2149 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2149 ?auto_2145 ) ( IN-TRUCK ?auto_2147 ?auto_2149 ) ( OBJ-AT ?auto_2146 ?auto_2145 ) ( OBJ-AT ?auto_2148 ?auto_2145 ) ( not ( = ?auto_2146 ?auto_2147 ) ) ( not ( = ?auto_2146 ?auto_2148 ) ) ( not ( = ?auto_2147 ?auto_2148 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2147 ?auto_2145 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2151 - OBJ
      ?auto_2152 - OBJ
      ?auto_2153 - OBJ
      ?auto_2150 - LOCATION
    )
    :vars
    (
      ?auto_2154 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2154 ?auto_2150 ) ( IN-TRUCK ?auto_2152 ?auto_2154 ) ( OBJ-AT ?auto_2151 ?auto_2150 ) ( OBJ-AT ?auto_2153 ?auto_2150 ) ( not ( = ?auto_2151 ?auto_2152 ) ) ( not ( = ?auto_2151 ?auto_2153 ) ) ( not ( = ?auto_2152 ?auto_2153 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2152 ?auto_2150 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2161 - OBJ
      ?auto_2162 - OBJ
      ?auto_2163 - OBJ
      ?auto_2160 - LOCATION
    )
    :vars
    (
      ?auto_2164 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2164 ?auto_2160 ) ( IN-TRUCK ?auto_2161 ?auto_2164 ) ( OBJ-AT ?auto_2162 ?auto_2160 ) ( OBJ-AT ?auto_2163 ?auto_2160 ) ( not ( = ?auto_2161 ?auto_2162 ) ) ( not ( = ?auto_2161 ?auto_2163 ) ) ( not ( = ?auto_2162 ?auto_2163 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2161 ?auto_2160 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2166 - OBJ
      ?auto_2167 - OBJ
      ?auto_2168 - OBJ
      ?auto_2165 - LOCATION
    )
    :vars
    (
      ?auto_2169 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2169 ?auto_2165 ) ( IN-TRUCK ?auto_2166 ?auto_2169 ) ( OBJ-AT ?auto_2167 ?auto_2165 ) ( OBJ-AT ?auto_2168 ?auto_2165 ) ( not ( = ?auto_2166 ?auto_2167 ) ) ( not ( = ?auto_2166 ?auto_2168 ) ) ( not ( = ?auto_2167 ?auto_2168 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2166 ?auto_2165 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2176 - OBJ
      ?auto_2177 - OBJ
      ?auto_2178 - OBJ
      ?auto_2175 - LOCATION
    )
    :vars
    (
      ?auto_2179 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2179 ?auto_2175 ) ( IN-TRUCK ?auto_2176 ?auto_2179 ) ( OBJ-AT ?auto_2177 ?auto_2175 ) ( OBJ-AT ?auto_2178 ?auto_2175 ) ( not ( = ?auto_2176 ?auto_2177 ) ) ( not ( = ?auto_2176 ?auto_2178 ) ) ( not ( = ?auto_2177 ?auto_2178 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2176 ?auto_2175 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2181 - OBJ
      ?auto_2182 - OBJ
      ?auto_2183 - OBJ
      ?auto_2180 - LOCATION
    )
    :vars
    (
      ?auto_2184 - TRUCK
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2184 ?auto_2180 ) ( IN-TRUCK ?auto_2181 ?auto_2184 ) ( OBJ-AT ?auto_2182 ?auto_2180 ) ( OBJ-AT ?auto_2183 ?auto_2180 ) ( not ( = ?auto_2181 ?auto_2182 ) ) ( not ( = ?auto_2181 ?auto_2183 ) ) ( not ( = ?auto_2182 ?auto_2183 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2181 ?auto_2180 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2206 - OBJ
      ?auto_2205 - LOCATION
    )
    :vars
    (
      ?auto_2207 - TRUCK
      ?auto_2208 - LOCATION
      ?auto_2209 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2206 ?auto_2207 ) ( TRUCK-AT ?auto_2207 ?auto_2208 ) ( IN-CITY ?auto_2208 ?auto_2209 ) ( IN-CITY ?auto_2205 ?auto_2209 ) ( not ( = ?auto_2205 ?auto_2208 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2207 ?auto_2208 ?auto_2205 ?auto_2209 )
      ( DELIVER-1PKG ?auto_2206 ?auto_2205 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2211 - OBJ
      ?auto_2212 - OBJ
      ?auto_2210 - LOCATION
    )
    :vars
    (
      ?auto_2213 - TRUCK
      ?auto_2215 - LOCATION
      ?auto_2214 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2212 ?auto_2213 ) ( TRUCK-AT ?auto_2213 ?auto_2215 ) ( IN-CITY ?auto_2215 ?auto_2214 ) ( IN-CITY ?auto_2210 ?auto_2214 ) ( not ( = ?auto_2210 ?auto_2215 ) ) ( OBJ-AT ?auto_2211 ?auto_2210 ) ( not ( = ?auto_2211 ?auto_2212 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2212 ?auto_2210 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2217 - OBJ
      ?auto_2218 - OBJ
      ?auto_2216 - LOCATION
    )
    :vars
    (
      ?auto_2219 - TRUCK
      ?auto_2221 - LOCATION
      ?auto_2220 - CITY
      ?auto_2222 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2218 ?auto_2219 ) ( TRUCK-AT ?auto_2219 ?auto_2221 ) ( IN-CITY ?auto_2221 ?auto_2220 ) ( IN-CITY ?auto_2216 ?auto_2220 ) ( not ( = ?auto_2216 ?auto_2221 ) ) ( OBJ-AT ?auto_2222 ?auto_2216 ) ( not ( = ?auto_2222 ?auto_2218 ) ) ( OBJ-AT ?auto_2217 ?auto_2216 ) ( not ( = ?auto_2217 ?auto_2218 ) ) ( not ( = ?auto_2217 ?auto_2222 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2222 ?auto_2218 ?auto_2216 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2224 - OBJ
      ?auto_2225 - OBJ
      ?auto_2223 - LOCATION
    )
    :vars
    (
      ?auto_2226 - TRUCK
      ?auto_2228 - LOCATION
      ?auto_2227 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2224 ?auto_2226 ) ( TRUCK-AT ?auto_2226 ?auto_2228 ) ( IN-CITY ?auto_2228 ?auto_2227 ) ( IN-CITY ?auto_2223 ?auto_2227 ) ( not ( = ?auto_2223 ?auto_2228 ) ) ( OBJ-AT ?auto_2225 ?auto_2223 ) ( not ( = ?auto_2225 ?auto_2224 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2225 ?auto_2224 ?auto_2223 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2230 - OBJ
      ?auto_2231 - OBJ
      ?auto_2229 - LOCATION
    )
    :vars
    (
      ?auto_2232 - TRUCK
      ?auto_2234 - LOCATION
      ?auto_2233 - CITY
      ?auto_2235 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2230 ?auto_2232 ) ( TRUCK-AT ?auto_2232 ?auto_2234 ) ( IN-CITY ?auto_2234 ?auto_2233 ) ( IN-CITY ?auto_2229 ?auto_2233 ) ( not ( = ?auto_2229 ?auto_2234 ) ) ( OBJ-AT ?auto_2235 ?auto_2229 ) ( not ( = ?auto_2235 ?auto_2230 ) ) ( OBJ-AT ?auto_2231 ?auto_2229 ) ( not ( = ?auto_2230 ?auto_2231 ) ) ( not ( = ?auto_2231 ?auto_2235 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2235 ?auto_2230 ?auto_2229 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2244 - OBJ
      ?auto_2245 - OBJ
      ?auto_2246 - OBJ
      ?auto_2243 - LOCATION
    )
    :vars
    (
      ?auto_2247 - TRUCK
      ?auto_2249 - LOCATION
      ?auto_2248 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2246 ?auto_2247 ) ( TRUCK-AT ?auto_2247 ?auto_2249 ) ( IN-CITY ?auto_2249 ?auto_2248 ) ( IN-CITY ?auto_2243 ?auto_2248 ) ( not ( = ?auto_2243 ?auto_2249 ) ) ( OBJ-AT ?auto_2244 ?auto_2243 ) ( not ( = ?auto_2244 ?auto_2246 ) ) ( OBJ-AT ?auto_2245 ?auto_2243 ) ( not ( = ?auto_2244 ?auto_2245 ) ) ( not ( = ?auto_2245 ?auto_2246 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2244 ?auto_2246 ?auto_2243 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2251 - OBJ
      ?auto_2252 - OBJ
      ?auto_2253 - OBJ
      ?auto_2250 - LOCATION
    )
    :vars
    (
      ?auto_2254 - TRUCK
      ?auto_2256 - LOCATION
      ?auto_2255 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2253 ?auto_2254 ) ( TRUCK-AT ?auto_2254 ?auto_2256 ) ( IN-CITY ?auto_2256 ?auto_2255 ) ( IN-CITY ?auto_2250 ?auto_2255 ) ( not ( = ?auto_2250 ?auto_2256 ) ) ( OBJ-AT ?auto_2251 ?auto_2250 ) ( not ( = ?auto_2251 ?auto_2253 ) ) ( OBJ-AT ?auto_2252 ?auto_2250 ) ( not ( = ?auto_2251 ?auto_2252 ) ) ( not ( = ?auto_2252 ?auto_2253 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2251 ?auto_2253 ?auto_2250 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2258 - OBJ
      ?auto_2259 - OBJ
      ?auto_2260 - OBJ
      ?auto_2257 - LOCATION
    )
    :vars
    (
      ?auto_2261 - TRUCK
      ?auto_2263 - LOCATION
      ?auto_2262 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2259 ?auto_2261 ) ( TRUCK-AT ?auto_2261 ?auto_2263 ) ( IN-CITY ?auto_2263 ?auto_2262 ) ( IN-CITY ?auto_2257 ?auto_2262 ) ( not ( = ?auto_2257 ?auto_2263 ) ) ( OBJ-AT ?auto_2260 ?auto_2257 ) ( not ( = ?auto_2260 ?auto_2259 ) ) ( OBJ-AT ?auto_2258 ?auto_2257 ) ( not ( = ?auto_2258 ?auto_2259 ) ) ( not ( = ?auto_2258 ?auto_2260 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2260 ?auto_2259 ?auto_2257 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2265 - OBJ
      ?auto_2266 - OBJ
      ?auto_2267 - OBJ
      ?auto_2264 - LOCATION
    )
    :vars
    (
      ?auto_2268 - TRUCK
      ?auto_2270 - LOCATION
      ?auto_2269 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2266 ?auto_2268 ) ( TRUCK-AT ?auto_2268 ?auto_2270 ) ( IN-CITY ?auto_2270 ?auto_2269 ) ( IN-CITY ?auto_2264 ?auto_2269 ) ( not ( = ?auto_2264 ?auto_2270 ) ) ( OBJ-AT ?auto_2265 ?auto_2264 ) ( not ( = ?auto_2265 ?auto_2266 ) ) ( OBJ-AT ?auto_2267 ?auto_2264 ) ( not ( = ?auto_2265 ?auto_2267 ) ) ( not ( = ?auto_2266 ?auto_2267 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2265 ?auto_2266 ?auto_2264 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2279 - OBJ
      ?auto_2280 - OBJ
      ?auto_2281 - OBJ
      ?auto_2278 - LOCATION
    )
    :vars
    (
      ?auto_2282 - TRUCK
      ?auto_2284 - LOCATION
      ?auto_2283 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2281 ?auto_2282 ) ( TRUCK-AT ?auto_2282 ?auto_2284 ) ( IN-CITY ?auto_2284 ?auto_2283 ) ( IN-CITY ?auto_2278 ?auto_2283 ) ( not ( = ?auto_2278 ?auto_2284 ) ) ( OBJ-AT ?auto_2280 ?auto_2278 ) ( not ( = ?auto_2280 ?auto_2281 ) ) ( OBJ-AT ?auto_2279 ?auto_2278 ) ( not ( = ?auto_2279 ?auto_2280 ) ) ( not ( = ?auto_2279 ?auto_2281 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2280 ?auto_2281 ?auto_2278 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2286 - OBJ
      ?auto_2287 - OBJ
      ?auto_2288 - OBJ
      ?auto_2285 - LOCATION
    )
    :vars
    (
      ?auto_2289 - TRUCK
      ?auto_2291 - LOCATION
      ?auto_2290 - CITY
      ?auto_2292 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2288 ?auto_2289 ) ( TRUCK-AT ?auto_2289 ?auto_2291 ) ( IN-CITY ?auto_2291 ?auto_2290 ) ( IN-CITY ?auto_2285 ?auto_2290 ) ( not ( = ?auto_2285 ?auto_2291 ) ) ( OBJ-AT ?auto_2292 ?auto_2285 ) ( not ( = ?auto_2292 ?auto_2288 ) ) ( OBJ-AT ?auto_2286 ?auto_2285 ) ( OBJ-AT ?auto_2287 ?auto_2285 ) ( not ( = ?auto_2286 ?auto_2287 ) ) ( not ( = ?auto_2286 ?auto_2288 ) ) ( not ( = ?auto_2286 ?auto_2292 ) ) ( not ( = ?auto_2287 ?auto_2288 ) ) ( not ( = ?auto_2287 ?auto_2292 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2292 ?auto_2288 ?auto_2285 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2294 - OBJ
      ?auto_2295 - OBJ
      ?auto_2296 - OBJ
      ?auto_2293 - LOCATION
    )
    :vars
    (
      ?auto_2297 - TRUCK
      ?auto_2299 - LOCATION
      ?auto_2298 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2295 ?auto_2297 ) ( TRUCK-AT ?auto_2297 ?auto_2299 ) ( IN-CITY ?auto_2299 ?auto_2298 ) ( IN-CITY ?auto_2293 ?auto_2298 ) ( not ( = ?auto_2293 ?auto_2299 ) ) ( OBJ-AT ?auto_2296 ?auto_2293 ) ( not ( = ?auto_2296 ?auto_2295 ) ) ( OBJ-AT ?auto_2294 ?auto_2293 ) ( not ( = ?auto_2294 ?auto_2295 ) ) ( not ( = ?auto_2294 ?auto_2296 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2296 ?auto_2295 ?auto_2293 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2301 - OBJ
      ?auto_2302 - OBJ
      ?auto_2303 - OBJ
      ?auto_2300 - LOCATION
    )
    :vars
    (
      ?auto_2304 - TRUCK
      ?auto_2306 - LOCATION
      ?auto_2305 - CITY
      ?auto_2307 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2302 ?auto_2304 ) ( TRUCK-AT ?auto_2304 ?auto_2306 ) ( IN-CITY ?auto_2306 ?auto_2305 ) ( IN-CITY ?auto_2300 ?auto_2305 ) ( not ( = ?auto_2300 ?auto_2306 ) ) ( OBJ-AT ?auto_2307 ?auto_2300 ) ( not ( = ?auto_2307 ?auto_2302 ) ) ( OBJ-AT ?auto_2301 ?auto_2300 ) ( OBJ-AT ?auto_2303 ?auto_2300 ) ( not ( = ?auto_2301 ?auto_2302 ) ) ( not ( = ?auto_2301 ?auto_2303 ) ) ( not ( = ?auto_2301 ?auto_2307 ) ) ( not ( = ?auto_2302 ?auto_2303 ) ) ( not ( = ?auto_2303 ?auto_2307 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2307 ?auto_2302 ?auto_2300 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2317 - OBJ
      ?auto_2318 - OBJ
      ?auto_2319 - OBJ
      ?auto_2316 - LOCATION
    )
    :vars
    (
      ?auto_2320 - TRUCK
      ?auto_2322 - LOCATION
      ?auto_2321 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2317 ?auto_2320 ) ( TRUCK-AT ?auto_2320 ?auto_2322 ) ( IN-CITY ?auto_2322 ?auto_2321 ) ( IN-CITY ?auto_2316 ?auto_2321 ) ( not ( = ?auto_2316 ?auto_2322 ) ) ( OBJ-AT ?auto_2318 ?auto_2316 ) ( not ( = ?auto_2318 ?auto_2317 ) ) ( OBJ-AT ?auto_2319 ?auto_2316 ) ( not ( = ?auto_2317 ?auto_2319 ) ) ( not ( = ?auto_2318 ?auto_2319 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2318 ?auto_2317 ?auto_2316 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2324 - OBJ
      ?auto_2325 - OBJ
      ?auto_2326 - OBJ
      ?auto_2323 - LOCATION
    )
    :vars
    (
      ?auto_2327 - TRUCK
      ?auto_2329 - LOCATION
      ?auto_2328 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2324 ?auto_2327 ) ( TRUCK-AT ?auto_2327 ?auto_2329 ) ( IN-CITY ?auto_2329 ?auto_2328 ) ( IN-CITY ?auto_2323 ?auto_2328 ) ( not ( = ?auto_2323 ?auto_2329 ) ) ( OBJ-AT ?auto_2325 ?auto_2323 ) ( not ( = ?auto_2325 ?auto_2324 ) ) ( OBJ-AT ?auto_2326 ?auto_2323 ) ( not ( = ?auto_2324 ?auto_2326 ) ) ( not ( = ?auto_2325 ?auto_2326 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2325 ?auto_2324 ?auto_2323 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2338 - OBJ
      ?auto_2339 - OBJ
      ?auto_2340 - OBJ
      ?auto_2337 - LOCATION
    )
    :vars
    (
      ?auto_2341 - TRUCK
      ?auto_2343 - LOCATION
      ?auto_2342 - CITY
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2338 ?auto_2341 ) ( TRUCK-AT ?auto_2341 ?auto_2343 ) ( IN-CITY ?auto_2343 ?auto_2342 ) ( IN-CITY ?auto_2337 ?auto_2342 ) ( not ( = ?auto_2337 ?auto_2343 ) ) ( OBJ-AT ?auto_2340 ?auto_2337 ) ( not ( = ?auto_2340 ?auto_2338 ) ) ( OBJ-AT ?auto_2339 ?auto_2337 ) ( not ( = ?auto_2338 ?auto_2339 ) ) ( not ( = ?auto_2339 ?auto_2340 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2340 ?auto_2338 ?auto_2337 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2345 - OBJ
      ?auto_2346 - OBJ
      ?auto_2347 - OBJ
      ?auto_2344 - LOCATION
    )
    :vars
    (
      ?auto_2348 - TRUCK
      ?auto_2350 - LOCATION
      ?auto_2349 - CITY
      ?auto_2351 - OBJ
    )
    :precondition
    ( and ( IN-TRUCK ?auto_2345 ?auto_2348 ) ( TRUCK-AT ?auto_2348 ?auto_2350 ) ( IN-CITY ?auto_2350 ?auto_2349 ) ( IN-CITY ?auto_2344 ?auto_2349 ) ( not ( = ?auto_2344 ?auto_2350 ) ) ( OBJ-AT ?auto_2351 ?auto_2344 ) ( not ( = ?auto_2351 ?auto_2345 ) ) ( OBJ-AT ?auto_2346 ?auto_2344 ) ( OBJ-AT ?auto_2347 ?auto_2344 ) ( not ( = ?auto_2345 ?auto_2346 ) ) ( not ( = ?auto_2345 ?auto_2347 ) ) ( not ( = ?auto_2346 ?auto_2347 ) ) ( not ( = ?auto_2346 ?auto_2351 ) ) ( not ( = ?auto_2347 ?auto_2351 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2351 ?auto_2345 ?auto_2344 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2384 - OBJ
      ?auto_2383 - LOCATION
    )
    :vars
    (
      ?auto_2385 - TRUCK
      ?auto_2387 - LOCATION
      ?auto_2386 - CITY
      ?auto_2388 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2385 ?auto_2387 ) ( IN-CITY ?auto_2387 ?auto_2386 ) ( IN-CITY ?auto_2383 ?auto_2386 ) ( not ( = ?auto_2383 ?auto_2387 ) ) ( OBJ-AT ?auto_2388 ?auto_2383 ) ( not ( = ?auto_2388 ?auto_2384 ) ) ( OBJ-AT ?auto_2384 ?auto_2387 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_2384 ?auto_2385 ?auto_2387 )
      ( DELIVER-2PKG ?auto_2388 ?auto_2384 ?auto_2383 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2390 - OBJ
      ?auto_2391 - OBJ
      ?auto_2389 - LOCATION
    )
    :vars
    (
      ?auto_2393 - TRUCK
      ?auto_2394 - LOCATION
      ?auto_2392 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2393 ?auto_2394 ) ( IN-CITY ?auto_2394 ?auto_2392 ) ( IN-CITY ?auto_2389 ?auto_2392 ) ( not ( = ?auto_2389 ?auto_2394 ) ) ( OBJ-AT ?auto_2390 ?auto_2389 ) ( not ( = ?auto_2390 ?auto_2391 ) ) ( OBJ-AT ?auto_2391 ?auto_2394 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2391 ?auto_2389 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2396 - OBJ
      ?auto_2397 - OBJ
      ?auto_2395 - LOCATION
    )
    :vars
    (
      ?auto_2399 - TRUCK
      ?auto_2398 - LOCATION
      ?auto_2400 - CITY
      ?auto_2401 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2399 ?auto_2398 ) ( IN-CITY ?auto_2398 ?auto_2400 ) ( IN-CITY ?auto_2395 ?auto_2400 ) ( not ( = ?auto_2395 ?auto_2398 ) ) ( OBJ-AT ?auto_2401 ?auto_2395 ) ( not ( = ?auto_2401 ?auto_2397 ) ) ( OBJ-AT ?auto_2397 ?auto_2398 ) ( OBJ-AT ?auto_2396 ?auto_2395 ) ( not ( = ?auto_2396 ?auto_2397 ) ) ( not ( = ?auto_2396 ?auto_2401 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2401 ?auto_2397 ?auto_2395 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2403 - OBJ
      ?auto_2404 - OBJ
      ?auto_2402 - LOCATION
    )
    :vars
    (
      ?auto_2406 - TRUCK
      ?auto_2405 - LOCATION
      ?auto_2407 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2406 ?auto_2405 ) ( IN-CITY ?auto_2405 ?auto_2407 ) ( IN-CITY ?auto_2402 ?auto_2407 ) ( not ( = ?auto_2402 ?auto_2405 ) ) ( OBJ-AT ?auto_2404 ?auto_2402 ) ( not ( = ?auto_2404 ?auto_2403 ) ) ( OBJ-AT ?auto_2403 ?auto_2405 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2404 ?auto_2403 ?auto_2402 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2409 - OBJ
      ?auto_2410 - OBJ
      ?auto_2408 - LOCATION
    )
    :vars
    (
      ?auto_2412 - TRUCK
      ?auto_2411 - LOCATION
      ?auto_2413 - CITY
      ?auto_2414 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2412 ?auto_2411 ) ( IN-CITY ?auto_2411 ?auto_2413 ) ( IN-CITY ?auto_2408 ?auto_2413 ) ( not ( = ?auto_2408 ?auto_2411 ) ) ( OBJ-AT ?auto_2414 ?auto_2408 ) ( not ( = ?auto_2414 ?auto_2409 ) ) ( OBJ-AT ?auto_2409 ?auto_2411 ) ( OBJ-AT ?auto_2410 ?auto_2408 ) ( not ( = ?auto_2409 ?auto_2410 ) ) ( not ( = ?auto_2410 ?auto_2414 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2414 ?auto_2409 ?auto_2408 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2423 - OBJ
      ?auto_2424 - OBJ
      ?auto_2425 - OBJ
      ?auto_2422 - LOCATION
    )
    :vars
    (
      ?auto_2427 - TRUCK
      ?auto_2426 - LOCATION
      ?auto_2428 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2427 ?auto_2426 ) ( IN-CITY ?auto_2426 ?auto_2428 ) ( IN-CITY ?auto_2422 ?auto_2428 ) ( not ( = ?auto_2422 ?auto_2426 ) ) ( OBJ-AT ?auto_2423 ?auto_2422 ) ( not ( = ?auto_2423 ?auto_2425 ) ) ( OBJ-AT ?auto_2425 ?auto_2426 ) ( OBJ-AT ?auto_2424 ?auto_2422 ) ( not ( = ?auto_2423 ?auto_2424 ) ) ( not ( = ?auto_2424 ?auto_2425 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2423 ?auto_2425 ?auto_2422 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2430 - OBJ
      ?auto_2431 - OBJ
      ?auto_2432 - OBJ
      ?auto_2429 - LOCATION
    )
    :vars
    (
      ?auto_2434 - TRUCK
      ?auto_2433 - LOCATION
      ?auto_2435 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2434 ?auto_2433 ) ( IN-CITY ?auto_2433 ?auto_2435 ) ( IN-CITY ?auto_2429 ?auto_2435 ) ( not ( = ?auto_2429 ?auto_2433 ) ) ( OBJ-AT ?auto_2430 ?auto_2429 ) ( not ( = ?auto_2430 ?auto_2432 ) ) ( OBJ-AT ?auto_2432 ?auto_2433 ) ( OBJ-AT ?auto_2431 ?auto_2429 ) ( not ( = ?auto_2430 ?auto_2431 ) ) ( not ( = ?auto_2431 ?auto_2432 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2430 ?auto_2432 ?auto_2429 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2437 - OBJ
      ?auto_2438 - OBJ
      ?auto_2439 - OBJ
      ?auto_2436 - LOCATION
    )
    :vars
    (
      ?auto_2441 - TRUCK
      ?auto_2440 - LOCATION
      ?auto_2442 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2441 ?auto_2440 ) ( IN-CITY ?auto_2440 ?auto_2442 ) ( IN-CITY ?auto_2436 ?auto_2442 ) ( not ( = ?auto_2436 ?auto_2440 ) ) ( OBJ-AT ?auto_2439 ?auto_2436 ) ( not ( = ?auto_2439 ?auto_2438 ) ) ( OBJ-AT ?auto_2438 ?auto_2440 ) ( OBJ-AT ?auto_2437 ?auto_2436 ) ( not ( = ?auto_2437 ?auto_2438 ) ) ( not ( = ?auto_2437 ?auto_2439 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2439 ?auto_2438 ?auto_2436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2444 - OBJ
      ?auto_2445 - OBJ
      ?auto_2446 - OBJ
      ?auto_2443 - LOCATION
    )
    :vars
    (
      ?auto_2448 - TRUCK
      ?auto_2447 - LOCATION
      ?auto_2449 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2448 ?auto_2447 ) ( IN-CITY ?auto_2447 ?auto_2449 ) ( IN-CITY ?auto_2443 ?auto_2449 ) ( not ( = ?auto_2443 ?auto_2447 ) ) ( OBJ-AT ?auto_2444 ?auto_2443 ) ( not ( = ?auto_2444 ?auto_2445 ) ) ( OBJ-AT ?auto_2445 ?auto_2447 ) ( OBJ-AT ?auto_2446 ?auto_2443 ) ( not ( = ?auto_2444 ?auto_2446 ) ) ( not ( = ?auto_2445 ?auto_2446 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2444 ?auto_2445 ?auto_2443 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2458 - OBJ
      ?auto_2459 - OBJ
      ?auto_2460 - OBJ
      ?auto_2457 - LOCATION
    )
    :vars
    (
      ?auto_2462 - TRUCK
      ?auto_2461 - LOCATION
      ?auto_2463 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2462 ?auto_2461 ) ( IN-CITY ?auto_2461 ?auto_2463 ) ( IN-CITY ?auto_2457 ?auto_2463 ) ( not ( = ?auto_2457 ?auto_2461 ) ) ( OBJ-AT ?auto_2459 ?auto_2457 ) ( not ( = ?auto_2459 ?auto_2460 ) ) ( OBJ-AT ?auto_2460 ?auto_2461 ) ( OBJ-AT ?auto_2458 ?auto_2457 ) ( not ( = ?auto_2458 ?auto_2459 ) ) ( not ( = ?auto_2458 ?auto_2460 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2459 ?auto_2460 ?auto_2457 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2465 - OBJ
      ?auto_2466 - OBJ
      ?auto_2467 - OBJ
      ?auto_2464 - LOCATION
    )
    :vars
    (
      ?auto_2469 - TRUCK
      ?auto_2468 - LOCATION
      ?auto_2470 - CITY
      ?auto_2471 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2469 ?auto_2468 ) ( IN-CITY ?auto_2468 ?auto_2470 ) ( IN-CITY ?auto_2464 ?auto_2470 ) ( not ( = ?auto_2464 ?auto_2468 ) ) ( OBJ-AT ?auto_2471 ?auto_2464 ) ( not ( = ?auto_2471 ?auto_2467 ) ) ( OBJ-AT ?auto_2467 ?auto_2468 ) ( OBJ-AT ?auto_2465 ?auto_2464 ) ( OBJ-AT ?auto_2466 ?auto_2464 ) ( not ( = ?auto_2465 ?auto_2466 ) ) ( not ( = ?auto_2465 ?auto_2467 ) ) ( not ( = ?auto_2465 ?auto_2471 ) ) ( not ( = ?auto_2466 ?auto_2467 ) ) ( not ( = ?auto_2466 ?auto_2471 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2471 ?auto_2467 ?auto_2464 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2473 - OBJ
      ?auto_2474 - OBJ
      ?auto_2475 - OBJ
      ?auto_2472 - LOCATION
    )
    :vars
    (
      ?auto_2477 - TRUCK
      ?auto_2476 - LOCATION
      ?auto_2478 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2477 ?auto_2476 ) ( IN-CITY ?auto_2476 ?auto_2478 ) ( IN-CITY ?auto_2472 ?auto_2478 ) ( not ( = ?auto_2472 ?auto_2476 ) ) ( OBJ-AT ?auto_2475 ?auto_2472 ) ( not ( = ?auto_2475 ?auto_2474 ) ) ( OBJ-AT ?auto_2474 ?auto_2476 ) ( OBJ-AT ?auto_2473 ?auto_2472 ) ( not ( = ?auto_2473 ?auto_2474 ) ) ( not ( = ?auto_2473 ?auto_2475 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2475 ?auto_2474 ?auto_2472 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2480 - OBJ
      ?auto_2481 - OBJ
      ?auto_2482 - OBJ
      ?auto_2479 - LOCATION
    )
    :vars
    (
      ?auto_2484 - TRUCK
      ?auto_2483 - LOCATION
      ?auto_2485 - CITY
      ?auto_2486 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2484 ?auto_2483 ) ( IN-CITY ?auto_2483 ?auto_2485 ) ( IN-CITY ?auto_2479 ?auto_2485 ) ( not ( = ?auto_2479 ?auto_2483 ) ) ( OBJ-AT ?auto_2486 ?auto_2479 ) ( not ( = ?auto_2486 ?auto_2481 ) ) ( OBJ-AT ?auto_2481 ?auto_2483 ) ( OBJ-AT ?auto_2480 ?auto_2479 ) ( OBJ-AT ?auto_2482 ?auto_2479 ) ( not ( = ?auto_2480 ?auto_2481 ) ) ( not ( = ?auto_2480 ?auto_2482 ) ) ( not ( = ?auto_2480 ?auto_2486 ) ) ( not ( = ?auto_2481 ?auto_2482 ) ) ( not ( = ?auto_2482 ?auto_2486 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2486 ?auto_2481 ?auto_2479 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2496 - OBJ
      ?auto_2497 - OBJ
      ?auto_2498 - OBJ
      ?auto_2495 - LOCATION
    )
    :vars
    (
      ?auto_2500 - TRUCK
      ?auto_2499 - LOCATION
      ?auto_2501 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2500 ?auto_2499 ) ( IN-CITY ?auto_2499 ?auto_2501 ) ( IN-CITY ?auto_2495 ?auto_2501 ) ( not ( = ?auto_2495 ?auto_2499 ) ) ( OBJ-AT ?auto_2497 ?auto_2495 ) ( not ( = ?auto_2497 ?auto_2496 ) ) ( OBJ-AT ?auto_2496 ?auto_2499 ) ( OBJ-AT ?auto_2498 ?auto_2495 ) ( not ( = ?auto_2496 ?auto_2498 ) ) ( not ( = ?auto_2497 ?auto_2498 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2497 ?auto_2496 ?auto_2495 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2503 - OBJ
      ?auto_2504 - OBJ
      ?auto_2505 - OBJ
      ?auto_2502 - LOCATION
    )
    :vars
    (
      ?auto_2507 - TRUCK
      ?auto_2506 - LOCATION
      ?auto_2508 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2507 ?auto_2506 ) ( IN-CITY ?auto_2506 ?auto_2508 ) ( IN-CITY ?auto_2502 ?auto_2508 ) ( not ( = ?auto_2502 ?auto_2506 ) ) ( OBJ-AT ?auto_2504 ?auto_2502 ) ( not ( = ?auto_2504 ?auto_2503 ) ) ( OBJ-AT ?auto_2503 ?auto_2506 ) ( OBJ-AT ?auto_2505 ?auto_2502 ) ( not ( = ?auto_2503 ?auto_2505 ) ) ( not ( = ?auto_2504 ?auto_2505 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2504 ?auto_2503 ?auto_2502 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2517 - OBJ
      ?auto_2518 - OBJ
      ?auto_2519 - OBJ
      ?auto_2516 - LOCATION
    )
    :vars
    (
      ?auto_2521 - TRUCK
      ?auto_2520 - LOCATION
      ?auto_2522 - CITY
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2521 ?auto_2520 ) ( IN-CITY ?auto_2520 ?auto_2522 ) ( IN-CITY ?auto_2516 ?auto_2522 ) ( not ( = ?auto_2516 ?auto_2520 ) ) ( OBJ-AT ?auto_2519 ?auto_2516 ) ( not ( = ?auto_2519 ?auto_2517 ) ) ( OBJ-AT ?auto_2517 ?auto_2520 ) ( OBJ-AT ?auto_2518 ?auto_2516 ) ( not ( = ?auto_2517 ?auto_2518 ) ) ( not ( = ?auto_2518 ?auto_2519 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2519 ?auto_2517 ?auto_2516 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2524 - OBJ
      ?auto_2525 - OBJ
      ?auto_2526 - OBJ
      ?auto_2523 - LOCATION
    )
    :vars
    (
      ?auto_2528 - TRUCK
      ?auto_2527 - LOCATION
      ?auto_2529 - CITY
      ?auto_2530 - OBJ
    )
    :precondition
    ( and ( TRUCK-AT ?auto_2528 ?auto_2527 ) ( IN-CITY ?auto_2527 ?auto_2529 ) ( IN-CITY ?auto_2523 ?auto_2529 ) ( not ( = ?auto_2523 ?auto_2527 ) ) ( OBJ-AT ?auto_2530 ?auto_2523 ) ( not ( = ?auto_2530 ?auto_2524 ) ) ( OBJ-AT ?auto_2524 ?auto_2527 ) ( OBJ-AT ?auto_2525 ?auto_2523 ) ( OBJ-AT ?auto_2526 ?auto_2523 ) ( not ( = ?auto_2524 ?auto_2525 ) ) ( not ( = ?auto_2524 ?auto_2526 ) ) ( not ( = ?auto_2525 ?auto_2526 ) ) ( not ( = ?auto_2525 ?auto_2530 ) ) ( not ( = ?auto_2526 ?auto_2530 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2530 ?auto_2524 ?auto_2523 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2563 - OBJ
      ?auto_2562 - LOCATION
    )
    :vars
    (
      ?auto_2564 - LOCATION
      ?auto_2566 - CITY
      ?auto_2567 - OBJ
      ?auto_2565 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2564 ?auto_2566 ) ( IN-CITY ?auto_2562 ?auto_2566 ) ( not ( = ?auto_2562 ?auto_2564 ) ) ( OBJ-AT ?auto_2567 ?auto_2562 ) ( not ( = ?auto_2567 ?auto_2563 ) ) ( OBJ-AT ?auto_2563 ?auto_2564 ) ( TRUCK-AT ?auto_2565 ?auto_2562 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2565 ?auto_2562 ?auto_2564 ?auto_2566 )
      ( DELIVER-2PKG ?auto_2567 ?auto_2563 ?auto_2562 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2569 - OBJ
      ?auto_2570 - OBJ
      ?auto_2568 - LOCATION
    )
    :vars
    (
      ?auto_2571 - LOCATION
      ?auto_2573 - CITY
      ?auto_2572 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2571 ?auto_2573 ) ( IN-CITY ?auto_2568 ?auto_2573 ) ( not ( = ?auto_2568 ?auto_2571 ) ) ( OBJ-AT ?auto_2569 ?auto_2568 ) ( not ( = ?auto_2569 ?auto_2570 ) ) ( OBJ-AT ?auto_2570 ?auto_2571 ) ( TRUCK-AT ?auto_2572 ?auto_2568 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2570 ?auto_2568 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2575 - OBJ
      ?auto_2576 - OBJ
      ?auto_2574 - LOCATION
    )
    :vars
    (
      ?auto_2578 - LOCATION
      ?auto_2577 - CITY
      ?auto_2580 - OBJ
      ?auto_2579 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2578 ?auto_2577 ) ( IN-CITY ?auto_2574 ?auto_2577 ) ( not ( = ?auto_2574 ?auto_2578 ) ) ( OBJ-AT ?auto_2580 ?auto_2574 ) ( not ( = ?auto_2580 ?auto_2576 ) ) ( OBJ-AT ?auto_2576 ?auto_2578 ) ( TRUCK-AT ?auto_2579 ?auto_2574 ) ( OBJ-AT ?auto_2575 ?auto_2574 ) ( not ( = ?auto_2575 ?auto_2576 ) ) ( not ( = ?auto_2575 ?auto_2580 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2580 ?auto_2576 ?auto_2574 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2582 - OBJ
      ?auto_2583 - OBJ
      ?auto_2581 - LOCATION
    )
    :vars
    (
      ?auto_2585 - LOCATION
      ?auto_2584 - CITY
      ?auto_2586 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2585 ?auto_2584 ) ( IN-CITY ?auto_2581 ?auto_2584 ) ( not ( = ?auto_2581 ?auto_2585 ) ) ( OBJ-AT ?auto_2583 ?auto_2581 ) ( not ( = ?auto_2583 ?auto_2582 ) ) ( OBJ-AT ?auto_2582 ?auto_2585 ) ( TRUCK-AT ?auto_2586 ?auto_2581 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2583 ?auto_2582 ?auto_2581 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2588 - OBJ
      ?auto_2589 - OBJ
      ?auto_2587 - LOCATION
    )
    :vars
    (
      ?auto_2591 - LOCATION
      ?auto_2590 - CITY
      ?auto_2593 - OBJ
      ?auto_2592 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2591 ?auto_2590 ) ( IN-CITY ?auto_2587 ?auto_2590 ) ( not ( = ?auto_2587 ?auto_2591 ) ) ( OBJ-AT ?auto_2593 ?auto_2587 ) ( not ( = ?auto_2593 ?auto_2588 ) ) ( OBJ-AT ?auto_2588 ?auto_2591 ) ( TRUCK-AT ?auto_2592 ?auto_2587 ) ( OBJ-AT ?auto_2589 ?auto_2587 ) ( not ( = ?auto_2588 ?auto_2589 ) ) ( not ( = ?auto_2589 ?auto_2593 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2593 ?auto_2588 ?auto_2587 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2602 - OBJ
      ?auto_2603 - OBJ
      ?auto_2604 - OBJ
      ?auto_2601 - LOCATION
    )
    :vars
    (
      ?auto_2606 - LOCATION
      ?auto_2605 - CITY
      ?auto_2607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2606 ?auto_2605 ) ( IN-CITY ?auto_2601 ?auto_2605 ) ( not ( = ?auto_2601 ?auto_2606 ) ) ( OBJ-AT ?auto_2602 ?auto_2601 ) ( not ( = ?auto_2602 ?auto_2604 ) ) ( OBJ-AT ?auto_2604 ?auto_2606 ) ( TRUCK-AT ?auto_2607 ?auto_2601 ) ( OBJ-AT ?auto_2603 ?auto_2601 ) ( not ( = ?auto_2602 ?auto_2603 ) ) ( not ( = ?auto_2603 ?auto_2604 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2602 ?auto_2604 ?auto_2601 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2609 - OBJ
      ?auto_2610 - OBJ
      ?auto_2611 - OBJ
      ?auto_2608 - LOCATION
    )
    :vars
    (
      ?auto_2613 - LOCATION
      ?auto_2612 - CITY
      ?auto_2614 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2613 ?auto_2612 ) ( IN-CITY ?auto_2608 ?auto_2612 ) ( not ( = ?auto_2608 ?auto_2613 ) ) ( OBJ-AT ?auto_2609 ?auto_2608 ) ( not ( = ?auto_2609 ?auto_2611 ) ) ( OBJ-AT ?auto_2611 ?auto_2613 ) ( TRUCK-AT ?auto_2614 ?auto_2608 ) ( OBJ-AT ?auto_2610 ?auto_2608 ) ( not ( = ?auto_2609 ?auto_2610 ) ) ( not ( = ?auto_2610 ?auto_2611 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2609 ?auto_2611 ?auto_2608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2616 - OBJ
      ?auto_2617 - OBJ
      ?auto_2618 - OBJ
      ?auto_2615 - LOCATION
    )
    :vars
    (
      ?auto_2620 - LOCATION
      ?auto_2619 - CITY
      ?auto_2621 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2620 ?auto_2619 ) ( IN-CITY ?auto_2615 ?auto_2619 ) ( not ( = ?auto_2615 ?auto_2620 ) ) ( OBJ-AT ?auto_2618 ?auto_2615 ) ( not ( = ?auto_2618 ?auto_2617 ) ) ( OBJ-AT ?auto_2617 ?auto_2620 ) ( TRUCK-AT ?auto_2621 ?auto_2615 ) ( OBJ-AT ?auto_2616 ?auto_2615 ) ( not ( = ?auto_2616 ?auto_2617 ) ) ( not ( = ?auto_2616 ?auto_2618 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2618 ?auto_2617 ?auto_2615 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2623 - OBJ
      ?auto_2624 - OBJ
      ?auto_2625 - OBJ
      ?auto_2622 - LOCATION
    )
    :vars
    (
      ?auto_2627 - LOCATION
      ?auto_2626 - CITY
      ?auto_2628 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2627 ?auto_2626 ) ( IN-CITY ?auto_2622 ?auto_2626 ) ( not ( = ?auto_2622 ?auto_2627 ) ) ( OBJ-AT ?auto_2623 ?auto_2622 ) ( not ( = ?auto_2623 ?auto_2624 ) ) ( OBJ-AT ?auto_2624 ?auto_2627 ) ( TRUCK-AT ?auto_2628 ?auto_2622 ) ( OBJ-AT ?auto_2625 ?auto_2622 ) ( not ( = ?auto_2623 ?auto_2625 ) ) ( not ( = ?auto_2624 ?auto_2625 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2623 ?auto_2624 ?auto_2622 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2637 - OBJ
      ?auto_2638 - OBJ
      ?auto_2639 - OBJ
      ?auto_2636 - LOCATION
    )
    :vars
    (
      ?auto_2641 - LOCATION
      ?auto_2640 - CITY
      ?auto_2642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2641 ?auto_2640 ) ( IN-CITY ?auto_2636 ?auto_2640 ) ( not ( = ?auto_2636 ?auto_2641 ) ) ( OBJ-AT ?auto_2638 ?auto_2636 ) ( not ( = ?auto_2638 ?auto_2639 ) ) ( OBJ-AT ?auto_2639 ?auto_2641 ) ( TRUCK-AT ?auto_2642 ?auto_2636 ) ( OBJ-AT ?auto_2637 ?auto_2636 ) ( not ( = ?auto_2637 ?auto_2638 ) ) ( not ( = ?auto_2637 ?auto_2639 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2638 ?auto_2639 ?auto_2636 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2644 - OBJ
      ?auto_2645 - OBJ
      ?auto_2646 - OBJ
      ?auto_2643 - LOCATION
    )
    :vars
    (
      ?auto_2648 - LOCATION
      ?auto_2647 - CITY
      ?auto_2650 - OBJ
      ?auto_2649 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2648 ?auto_2647 ) ( IN-CITY ?auto_2643 ?auto_2647 ) ( not ( = ?auto_2643 ?auto_2648 ) ) ( OBJ-AT ?auto_2650 ?auto_2643 ) ( not ( = ?auto_2650 ?auto_2646 ) ) ( OBJ-AT ?auto_2646 ?auto_2648 ) ( TRUCK-AT ?auto_2649 ?auto_2643 ) ( OBJ-AT ?auto_2644 ?auto_2643 ) ( OBJ-AT ?auto_2645 ?auto_2643 ) ( not ( = ?auto_2644 ?auto_2645 ) ) ( not ( = ?auto_2644 ?auto_2646 ) ) ( not ( = ?auto_2644 ?auto_2650 ) ) ( not ( = ?auto_2645 ?auto_2646 ) ) ( not ( = ?auto_2645 ?auto_2650 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2650 ?auto_2646 ?auto_2643 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2652 - OBJ
      ?auto_2653 - OBJ
      ?auto_2654 - OBJ
      ?auto_2651 - LOCATION
    )
    :vars
    (
      ?auto_2656 - LOCATION
      ?auto_2655 - CITY
      ?auto_2657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2656 ?auto_2655 ) ( IN-CITY ?auto_2651 ?auto_2655 ) ( not ( = ?auto_2651 ?auto_2656 ) ) ( OBJ-AT ?auto_2654 ?auto_2651 ) ( not ( = ?auto_2654 ?auto_2653 ) ) ( OBJ-AT ?auto_2653 ?auto_2656 ) ( TRUCK-AT ?auto_2657 ?auto_2651 ) ( OBJ-AT ?auto_2652 ?auto_2651 ) ( not ( = ?auto_2652 ?auto_2653 ) ) ( not ( = ?auto_2652 ?auto_2654 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2654 ?auto_2653 ?auto_2651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2659 - OBJ
      ?auto_2660 - OBJ
      ?auto_2661 - OBJ
      ?auto_2658 - LOCATION
    )
    :vars
    (
      ?auto_2663 - LOCATION
      ?auto_2662 - CITY
      ?auto_2665 - OBJ
      ?auto_2664 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2663 ?auto_2662 ) ( IN-CITY ?auto_2658 ?auto_2662 ) ( not ( = ?auto_2658 ?auto_2663 ) ) ( OBJ-AT ?auto_2665 ?auto_2658 ) ( not ( = ?auto_2665 ?auto_2660 ) ) ( OBJ-AT ?auto_2660 ?auto_2663 ) ( TRUCK-AT ?auto_2664 ?auto_2658 ) ( OBJ-AT ?auto_2659 ?auto_2658 ) ( OBJ-AT ?auto_2661 ?auto_2658 ) ( not ( = ?auto_2659 ?auto_2660 ) ) ( not ( = ?auto_2659 ?auto_2661 ) ) ( not ( = ?auto_2659 ?auto_2665 ) ) ( not ( = ?auto_2660 ?auto_2661 ) ) ( not ( = ?auto_2661 ?auto_2665 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2665 ?auto_2660 ?auto_2658 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2675 - OBJ
      ?auto_2676 - OBJ
      ?auto_2677 - OBJ
      ?auto_2674 - LOCATION
    )
    :vars
    (
      ?auto_2679 - LOCATION
      ?auto_2678 - CITY
      ?auto_2680 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2679 ?auto_2678 ) ( IN-CITY ?auto_2674 ?auto_2678 ) ( not ( = ?auto_2674 ?auto_2679 ) ) ( OBJ-AT ?auto_2676 ?auto_2674 ) ( not ( = ?auto_2676 ?auto_2675 ) ) ( OBJ-AT ?auto_2675 ?auto_2679 ) ( TRUCK-AT ?auto_2680 ?auto_2674 ) ( OBJ-AT ?auto_2677 ?auto_2674 ) ( not ( = ?auto_2675 ?auto_2677 ) ) ( not ( = ?auto_2676 ?auto_2677 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2676 ?auto_2675 ?auto_2674 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2682 - OBJ
      ?auto_2683 - OBJ
      ?auto_2684 - OBJ
      ?auto_2681 - LOCATION
    )
    :vars
    (
      ?auto_2686 - LOCATION
      ?auto_2685 - CITY
      ?auto_2687 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2686 ?auto_2685 ) ( IN-CITY ?auto_2681 ?auto_2685 ) ( not ( = ?auto_2681 ?auto_2686 ) ) ( OBJ-AT ?auto_2683 ?auto_2681 ) ( not ( = ?auto_2683 ?auto_2682 ) ) ( OBJ-AT ?auto_2682 ?auto_2686 ) ( TRUCK-AT ?auto_2687 ?auto_2681 ) ( OBJ-AT ?auto_2684 ?auto_2681 ) ( not ( = ?auto_2682 ?auto_2684 ) ) ( not ( = ?auto_2683 ?auto_2684 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2683 ?auto_2682 ?auto_2681 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2696 - OBJ
      ?auto_2697 - OBJ
      ?auto_2698 - OBJ
      ?auto_2695 - LOCATION
    )
    :vars
    (
      ?auto_2700 - LOCATION
      ?auto_2699 - CITY
      ?auto_2701 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2700 ?auto_2699 ) ( IN-CITY ?auto_2695 ?auto_2699 ) ( not ( = ?auto_2695 ?auto_2700 ) ) ( OBJ-AT ?auto_2698 ?auto_2695 ) ( not ( = ?auto_2698 ?auto_2696 ) ) ( OBJ-AT ?auto_2696 ?auto_2700 ) ( TRUCK-AT ?auto_2701 ?auto_2695 ) ( OBJ-AT ?auto_2697 ?auto_2695 ) ( not ( = ?auto_2696 ?auto_2697 ) ) ( not ( = ?auto_2697 ?auto_2698 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2698 ?auto_2696 ?auto_2695 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2703 - OBJ
      ?auto_2704 - OBJ
      ?auto_2705 - OBJ
      ?auto_2702 - LOCATION
    )
    :vars
    (
      ?auto_2707 - LOCATION
      ?auto_2706 - CITY
      ?auto_2709 - OBJ
      ?auto_2708 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2707 ?auto_2706 ) ( IN-CITY ?auto_2702 ?auto_2706 ) ( not ( = ?auto_2702 ?auto_2707 ) ) ( OBJ-AT ?auto_2709 ?auto_2702 ) ( not ( = ?auto_2709 ?auto_2703 ) ) ( OBJ-AT ?auto_2703 ?auto_2707 ) ( TRUCK-AT ?auto_2708 ?auto_2702 ) ( OBJ-AT ?auto_2704 ?auto_2702 ) ( OBJ-AT ?auto_2705 ?auto_2702 ) ( not ( = ?auto_2703 ?auto_2704 ) ) ( not ( = ?auto_2703 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2705 ) ) ( not ( = ?auto_2704 ?auto_2709 ) ) ( not ( = ?auto_2705 ?auto_2709 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2709 ?auto_2703 ?auto_2702 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2742 - OBJ
      ?auto_2741 - LOCATION
    )
    :vars
    (
      ?auto_2744 - LOCATION
      ?auto_2743 - CITY
      ?auto_2746 - OBJ
      ?auto_2745 - TRUCK
      ?auto_2747 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2744 ?auto_2743 ) ( IN-CITY ?auto_2741 ?auto_2743 ) ( not ( = ?auto_2741 ?auto_2744 ) ) ( OBJ-AT ?auto_2746 ?auto_2741 ) ( not ( = ?auto_2746 ?auto_2742 ) ) ( OBJ-AT ?auto_2742 ?auto_2744 ) ( TRUCK-AT ?auto_2745 ?auto_2741 ) ( IN-TRUCK ?auto_2747 ?auto_2745 ) ( not ( = ?auto_2746 ?auto_2747 ) ) ( not ( = ?auto_2742 ?auto_2747 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2746 ?auto_2747 ?auto_2741 )
      ( DELIVER-2PKG ?auto_2746 ?auto_2742 ?auto_2741 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2749 - OBJ
      ?auto_2750 - OBJ
      ?auto_2748 - LOCATION
    )
    :vars
    (
      ?auto_2753 - LOCATION
      ?auto_2752 - CITY
      ?auto_2751 - TRUCK
      ?auto_2754 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2753 ?auto_2752 ) ( IN-CITY ?auto_2748 ?auto_2752 ) ( not ( = ?auto_2748 ?auto_2753 ) ) ( OBJ-AT ?auto_2749 ?auto_2748 ) ( not ( = ?auto_2749 ?auto_2750 ) ) ( OBJ-AT ?auto_2750 ?auto_2753 ) ( TRUCK-AT ?auto_2751 ?auto_2748 ) ( IN-TRUCK ?auto_2754 ?auto_2751 ) ( not ( = ?auto_2749 ?auto_2754 ) ) ( not ( = ?auto_2750 ?auto_2754 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2750 ?auto_2748 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2756 - OBJ
      ?auto_2757 - OBJ
      ?auto_2755 - LOCATION
    )
    :vars
    (
      ?auto_2760 - LOCATION
      ?auto_2759 - CITY
      ?auto_2761 - OBJ
      ?auto_2758 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2760 ?auto_2759 ) ( IN-CITY ?auto_2755 ?auto_2759 ) ( not ( = ?auto_2755 ?auto_2760 ) ) ( OBJ-AT ?auto_2761 ?auto_2755 ) ( not ( = ?auto_2761 ?auto_2757 ) ) ( OBJ-AT ?auto_2757 ?auto_2760 ) ( TRUCK-AT ?auto_2758 ?auto_2755 ) ( IN-TRUCK ?auto_2756 ?auto_2758 ) ( not ( = ?auto_2761 ?auto_2756 ) ) ( not ( = ?auto_2757 ?auto_2756 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2761 ?auto_2757 ?auto_2755 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2763 - OBJ
      ?auto_2764 - OBJ
      ?auto_2762 - LOCATION
    )
    :vars
    (
      ?auto_2768 - LOCATION
      ?auto_2766 - CITY
      ?auto_2765 - TRUCK
      ?auto_2767 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2768 ?auto_2766 ) ( IN-CITY ?auto_2762 ?auto_2766 ) ( not ( = ?auto_2762 ?auto_2768 ) ) ( OBJ-AT ?auto_2764 ?auto_2762 ) ( not ( = ?auto_2764 ?auto_2763 ) ) ( OBJ-AT ?auto_2763 ?auto_2768 ) ( TRUCK-AT ?auto_2765 ?auto_2762 ) ( IN-TRUCK ?auto_2767 ?auto_2765 ) ( not ( = ?auto_2764 ?auto_2767 ) ) ( not ( = ?auto_2763 ?auto_2767 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2764 ?auto_2763 ?auto_2762 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2770 - OBJ
      ?auto_2771 - OBJ
      ?auto_2769 - LOCATION
    )
    :vars
    (
      ?auto_2774 - LOCATION
      ?auto_2773 - CITY
      ?auto_2775 - OBJ
      ?auto_2772 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2774 ?auto_2773 ) ( IN-CITY ?auto_2769 ?auto_2773 ) ( not ( = ?auto_2769 ?auto_2774 ) ) ( OBJ-AT ?auto_2775 ?auto_2769 ) ( not ( = ?auto_2775 ?auto_2770 ) ) ( OBJ-AT ?auto_2770 ?auto_2774 ) ( TRUCK-AT ?auto_2772 ?auto_2769 ) ( IN-TRUCK ?auto_2771 ?auto_2772 ) ( not ( = ?auto_2775 ?auto_2771 ) ) ( not ( = ?auto_2770 ?auto_2771 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2775 ?auto_2770 ?auto_2769 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2785 - OBJ
      ?auto_2786 - OBJ
      ?auto_2787 - OBJ
      ?auto_2784 - LOCATION
    )
    :vars
    (
      ?auto_2791 - LOCATION
      ?auto_2789 - CITY
      ?auto_2788 - TRUCK
      ?auto_2790 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2791 ?auto_2789 ) ( IN-CITY ?auto_2784 ?auto_2789 ) ( not ( = ?auto_2784 ?auto_2791 ) ) ( OBJ-AT ?auto_2785 ?auto_2784 ) ( not ( = ?auto_2785 ?auto_2787 ) ) ( OBJ-AT ?auto_2787 ?auto_2791 ) ( TRUCK-AT ?auto_2788 ?auto_2784 ) ( IN-TRUCK ?auto_2790 ?auto_2788 ) ( not ( = ?auto_2785 ?auto_2790 ) ) ( not ( = ?auto_2787 ?auto_2790 ) ) ( OBJ-AT ?auto_2786 ?auto_2784 ) ( not ( = ?auto_2785 ?auto_2786 ) ) ( not ( = ?auto_2786 ?auto_2787 ) ) ( not ( = ?auto_2786 ?auto_2790 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2785 ?auto_2787 ?auto_2784 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2793 - OBJ
      ?auto_2794 - OBJ
      ?auto_2795 - OBJ
      ?auto_2792 - LOCATION
    )
    :vars
    (
      ?auto_2798 - LOCATION
      ?auto_2797 - CITY
      ?auto_2796 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2798 ?auto_2797 ) ( IN-CITY ?auto_2792 ?auto_2797 ) ( not ( = ?auto_2792 ?auto_2798 ) ) ( OBJ-AT ?auto_2793 ?auto_2792 ) ( not ( = ?auto_2793 ?auto_2795 ) ) ( OBJ-AT ?auto_2795 ?auto_2798 ) ( TRUCK-AT ?auto_2796 ?auto_2792 ) ( IN-TRUCK ?auto_2794 ?auto_2796 ) ( not ( = ?auto_2793 ?auto_2794 ) ) ( not ( = ?auto_2795 ?auto_2794 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2793 ?auto_2795 ?auto_2792 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2800 - OBJ
      ?auto_2801 - OBJ
      ?auto_2802 - OBJ
      ?auto_2799 - LOCATION
    )
    :vars
    (
      ?auto_2806 - LOCATION
      ?auto_2804 - CITY
      ?auto_2803 - TRUCK
      ?auto_2805 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2806 ?auto_2804 ) ( IN-CITY ?auto_2799 ?auto_2804 ) ( not ( = ?auto_2799 ?auto_2806 ) ) ( OBJ-AT ?auto_2802 ?auto_2799 ) ( not ( = ?auto_2802 ?auto_2801 ) ) ( OBJ-AT ?auto_2801 ?auto_2806 ) ( TRUCK-AT ?auto_2803 ?auto_2799 ) ( IN-TRUCK ?auto_2805 ?auto_2803 ) ( not ( = ?auto_2802 ?auto_2805 ) ) ( not ( = ?auto_2801 ?auto_2805 ) ) ( OBJ-AT ?auto_2800 ?auto_2799 ) ( not ( = ?auto_2800 ?auto_2801 ) ) ( not ( = ?auto_2800 ?auto_2802 ) ) ( not ( = ?auto_2800 ?auto_2805 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2802 ?auto_2801 ?auto_2799 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2808 - OBJ
      ?auto_2809 - OBJ
      ?auto_2810 - OBJ
      ?auto_2807 - LOCATION
    )
    :vars
    (
      ?auto_2813 - LOCATION
      ?auto_2812 - CITY
      ?auto_2811 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2813 ?auto_2812 ) ( IN-CITY ?auto_2807 ?auto_2812 ) ( not ( = ?auto_2807 ?auto_2813 ) ) ( OBJ-AT ?auto_2808 ?auto_2807 ) ( not ( = ?auto_2808 ?auto_2809 ) ) ( OBJ-AT ?auto_2809 ?auto_2813 ) ( TRUCK-AT ?auto_2811 ?auto_2807 ) ( IN-TRUCK ?auto_2810 ?auto_2811 ) ( not ( = ?auto_2808 ?auto_2810 ) ) ( not ( = ?auto_2809 ?auto_2810 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2808 ?auto_2809 ?auto_2807 ) )
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
      ?auto_2828 - LOCATION
      ?auto_2827 - CITY
      ?auto_2826 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2828 ?auto_2827 ) ( IN-CITY ?auto_2822 ?auto_2827 ) ( not ( = ?auto_2822 ?auto_2828 ) ) ( OBJ-AT ?auto_2824 ?auto_2822 ) ( not ( = ?auto_2824 ?auto_2825 ) ) ( OBJ-AT ?auto_2825 ?auto_2828 ) ( TRUCK-AT ?auto_2826 ?auto_2822 ) ( IN-TRUCK ?auto_2823 ?auto_2826 ) ( not ( = ?auto_2824 ?auto_2823 ) ) ( not ( = ?auto_2825 ?auto_2823 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2824 ?auto_2825 ?auto_2822 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2838 - OBJ
      ?auto_2839 - OBJ
      ?auto_2840 - OBJ
      ?auto_2837 - LOCATION
    )
    :vars
    (
      ?auto_2843 - LOCATION
      ?auto_2842 - CITY
      ?auto_2841 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2843 ?auto_2842 ) ( IN-CITY ?auto_2837 ?auto_2842 ) ( not ( = ?auto_2837 ?auto_2843 ) ) ( OBJ-AT ?auto_2840 ?auto_2837 ) ( not ( = ?auto_2840 ?auto_2839 ) ) ( OBJ-AT ?auto_2839 ?auto_2843 ) ( TRUCK-AT ?auto_2841 ?auto_2837 ) ( IN-TRUCK ?auto_2838 ?auto_2841 ) ( not ( = ?auto_2840 ?auto_2838 ) ) ( not ( = ?auto_2839 ?auto_2838 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2840 ?auto_2839 ?auto_2837 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2861 - OBJ
      ?auto_2862 - OBJ
      ?auto_2863 - OBJ
      ?auto_2860 - LOCATION
    )
    :vars
    (
      ?auto_2867 - LOCATION
      ?auto_2865 - CITY
      ?auto_2864 - TRUCK
      ?auto_2866 - OBJ
    )
    :precondition
    ( and ( IN-CITY ?auto_2867 ?auto_2865 ) ( IN-CITY ?auto_2860 ?auto_2865 ) ( not ( = ?auto_2860 ?auto_2867 ) ) ( OBJ-AT ?auto_2862 ?auto_2860 ) ( not ( = ?auto_2862 ?auto_2861 ) ) ( OBJ-AT ?auto_2861 ?auto_2867 ) ( TRUCK-AT ?auto_2864 ?auto_2860 ) ( IN-TRUCK ?auto_2866 ?auto_2864 ) ( not ( = ?auto_2862 ?auto_2866 ) ) ( not ( = ?auto_2861 ?auto_2866 ) ) ( OBJ-AT ?auto_2863 ?auto_2860 ) ( not ( = ?auto_2861 ?auto_2863 ) ) ( not ( = ?auto_2862 ?auto_2863 ) ) ( not ( = ?auto_2863 ?auto_2866 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2862 ?auto_2861 ?auto_2860 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2869 - OBJ
      ?auto_2870 - OBJ
      ?auto_2871 - OBJ
      ?auto_2868 - LOCATION
    )
    :vars
    (
      ?auto_2874 - LOCATION
      ?auto_2873 - CITY
      ?auto_2872 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2874 ?auto_2873 ) ( IN-CITY ?auto_2868 ?auto_2873 ) ( not ( = ?auto_2868 ?auto_2874 ) ) ( OBJ-AT ?auto_2870 ?auto_2868 ) ( not ( = ?auto_2870 ?auto_2869 ) ) ( OBJ-AT ?auto_2869 ?auto_2874 ) ( TRUCK-AT ?auto_2872 ?auto_2868 ) ( IN-TRUCK ?auto_2871 ?auto_2872 ) ( not ( = ?auto_2870 ?auto_2871 ) ) ( not ( = ?auto_2869 ?auto_2871 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2870 ?auto_2869 ?auto_2868 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2884 - OBJ
      ?auto_2885 - OBJ
      ?auto_2886 - OBJ
      ?auto_2883 - LOCATION
    )
    :vars
    (
      ?auto_2889 - LOCATION
      ?auto_2888 - CITY
      ?auto_2887 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_2889 ?auto_2888 ) ( IN-CITY ?auto_2883 ?auto_2888 ) ( not ( = ?auto_2883 ?auto_2889 ) ) ( OBJ-AT ?auto_2886 ?auto_2883 ) ( not ( = ?auto_2886 ?auto_2884 ) ) ( OBJ-AT ?auto_2884 ?auto_2889 ) ( TRUCK-AT ?auto_2887 ?auto_2883 ) ( IN-TRUCK ?auto_2885 ?auto_2887 ) ( not ( = ?auto_2886 ?auto_2885 ) ) ( not ( = ?auto_2884 ?auto_2885 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2886 ?auto_2884 ?auto_2883 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_2932 - OBJ
      ?auto_2931 - LOCATION
    )
    :vars
    (
      ?auto_2936 - LOCATION
      ?auto_2934 - CITY
      ?auto_2937 - OBJ
      ?auto_2935 - OBJ
      ?auto_2933 - TRUCK
      ?auto_2938 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2936 ?auto_2934 ) ( IN-CITY ?auto_2931 ?auto_2934 ) ( not ( = ?auto_2931 ?auto_2936 ) ) ( OBJ-AT ?auto_2937 ?auto_2931 ) ( not ( = ?auto_2937 ?auto_2932 ) ) ( OBJ-AT ?auto_2932 ?auto_2936 ) ( IN-TRUCK ?auto_2935 ?auto_2933 ) ( not ( = ?auto_2937 ?auto_2935 ) ) ( not ( = ?auto_2932 ?auto_2935 ) ) ( TRUCK-AT ?auto_2933 ?auto_2938 ) ( IN-CITY ?auto_2938 ?auto_2934 ) ( not ( = ?auto_2931 ?auto_2938 ) ) ( not ( = ?auto_2936 ?auto_2938 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_2933 ?auto_2938 ?auto_2931 ?auto_2934 )
      ( DELIVER-2PKG ?auto_2937 ?auto_2932 ?auto_2931 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2940 - OBJ
      ?auto_2941 - OBJ
      ?auto_2939 - LOCATION
    )
    :vars
    (
      ?auto_2946 - LOCATION
      ?auto_2942 - CITY
      ?auto_2943 - OBJ
      ?auto_2944 - TRUCK
      ?auto_2945 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2946 ?auto_2942 ) ( IN-CITY ?auto_2939 ?auto_2942 ) ( not ( = ?auto_2939 ?auto_2946 ) ) ( OBJ-AT ?auto_2940 ?auto_2939 ) ( not ( = ?auto_2940 ?auto_2941 ) ) ( OBJ-AT ?auto_2941 ?auto_2946 ) ( IN-TRUCK ?auto_2943 ?auto_2944 ) ( not ( = ?auto_2940 ?auto_2943 ) ) ( not ( = ?auto_2941 ?auto_2943 ) ) ( TRUCK-AT ?auto_2944 ?auto_2945 ) ( IN-CITY ?auto_2945 ?auto_2942 ) ( not ( = ?auto_2939 ?auto_2945 ) ) ( not ( = ?auto_2946 ?auto_2945 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_2941 ?auto_2939 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2948 - OBJ
      ?auto_2949 - OBJ
      ?auto_2947 - LOCATION
    )
    :vars
    (
      ?auto_2953 - LOCATION
      ?auto_2951 - CITY
      ?auto_2954 - OBJ
      ?auto_2952 - TRUCK
      ?auto_2950 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2953 ?auto_2951 ) ( IN-CITY ?auto_2947 ?auto_2951 ) ( not ( = ?auto_2947 ?auto_2953 ) ) ( OBJ-AT ?auto_2954 ?auto_2947 ) ( not ( = ?auto_2954 ?auto_2949 ) ) ( OBJ-AT ?auto_2949 ?auto_2953 ) ( IN-TRUCK ?auto_2948 ?auto_2952 ) ( not ( = ?auto_2954 ?auto_2948 ) ) ( not ( = ?auto_2949 ?auto_2948 ) ) ( TRUCK-AT ?auto_2952 ?auto_2950 ) ( IN-CITY ?auto_2950 ?auto_2951 ) ( not ( = ?auto_2947 ?auto_2950 ) ) ( not ( = ?auto_2953 ?auto_2950 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2954 ?auto_2949 ?auto_2947 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2956 - OBJ
      ?auto_2957 - OBJ
      ?auto_2955 - LOCATION
    )
    :vars
    (
      ?auto_2962 - LOCATION
      ?auto_2960 - CITY
      ?auto_2958 - OBJ
      ?auto_2961 - TRUCK
      ?auto_2959 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2962 ?auto_2960 ) ( IN-CITY ?auto_2955 ?auto_2960 ) ( not ( = ?auto_2955 ?auto_2962 ) ) ( OBJ-AT ?auto_2957 ?auto_2955 ) ( not ( = ?auto_2957 ?auto_2956 ) ) ( OBJ-AT ?auto_2956 ?auto_2962 ) ( IN-TRUCK ?auto_2958 ?auto_2961 ) ( not ( = ?auto_2957 ?auto_2958 ) ) ( not ( = ?auto_2956 ?auto_2958 ) ) ( TRUCK-AT ?auto_2961 ?auto_2959 ) ( IN-CITY ?auto_2959 ?auto_2960 ) ( not ( = ?auto_2955 ?auto_2959 ) ) ( not ( = ?auto_2962 ?auto_2959 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2957 ?auto_2956 ?auto_2955 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_2964 - OBJ
      ?auto_2965 - OBJ
      ?auto_2963 - LOCATION
    )
    :vars
    (
      ?auto_2969 - LOCATION
      ?auto_2967 - CITY
      ?auto_2970 - OBJ
      ?auto_2968 - TRUCK
      ?auto_2966 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2969 ?auto_2967 ) ( IN-CITY ?auto_2963 ?auto_2967 ) ( not ( = ?auto_2963 ?auto_2969 ) ) ( OBJ-AT ?auto_2970 ?auto_2963 ) ( not ( = ?auto_2970 ?auto_2964 ) ) ( OBJ-AT ?auto_2964 ?auto_2969 ) ( IN-TRUCK ?auto_2965 ?auto_2968 ) ( not ( = ?auto_2970 ?auto_2965 ) ) ( not ( = ?auto_2964 ?auto_2965 ) ) ( TRUCK-AT ?auto_2968 ?auto_2966 ) ( IN-CITY ?auto_2966 ?auto_2967 ) ( not ( = ?auto_2963 ?auto_2966 ) ) ( not ( = ?auto_2969 ?auto_2966 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2970 ?auto_2964 ?auto_2963 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2981 - OBJ
      ?auto_2982 - OBJ
      ?auto_2983 - OBJ
      ?auto_2980 - LOCATION
    )
    :vars
    (
      ?auto_2988 - LOCATION
      ?auto_2986 - CITY
      ?auto_2984 - OBJ
      ?auto_2987 - TRUCK
      ?auto_2985 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2988 ?auto_2986 ) ( IN-CITY ?auto_2980 ?auto_2986 ) ( not ( = ?auto_2980 ?auto_2988 ) ) ( OBJ-AT ?auto_2981 ?auto_2980 ) ( not ( = ?auto_2981 ?auto_2983 ) ) ( OBJ-AT ?auto_2983 ?auto_2988 ) ( IN-TRUCK ?auto_2984 ?auto_2987 ) ( not ( = ?auto_2981 ?auto_2984 ) ) ( not ( = ?auto_2983 ?auto_2984 ) ) ( TRUCK-AT ?auto_2987 ?auto_2985 ) ( IN-CITY ?auto_2985 ?auto_2986 ) ( not ( = ?auto_2980 ?auto_2985 ) ) ( not ( = ?auto_2988 ?auto_2985 ) ) ( OBJ-AT ?auto_2982 ?auto_2980 ) ( not ( = ?auto_2981 ?auto_2982 ) ) ( not ( = ?auto_2982 ?auto_2983 ) ) ( not ( = ?auto_2982 ?auto_2984 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2981 ?auto_2983 ?auto_2980 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2990 - OBJ
      ?auto_2991 - OBJ
      ?auto_2992 - OBJ
      ?auto_2989 - LOCATION
    )
    :vars
    (
      ?auto_2996 - LOCATION
      ?auto_2994 - CITY
      ?auto_2995 - TRUCK
      ?auto_2993 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_2996 ?auto_2994 ) ( IN-CITY ?auto_2989 ?auto_2994 ) ( not ( = ?auto_2989 ?auto_2996 ) ) ( OBJ-AT ?auto_2990 ?auto_2989 ) ( not ( = ?auto_2990 ?auto_2992 ) ) ( OBJ-AT ?auto_2992 ?auto_2996 ) ( IN-TRUCK ?auto_2991 ?auto_2995 ) ( not ( = ?auto_2990 ?auto_2991 ) ) ( not ( = ?auto_2992 ?auto_2991 ) ) ( TRUCK-AT ?auto_2995 ?auto_2993 ) ( IN-CITY ?auto_2993 ?auto_2994 ) ( not ( = ?auto_2989 ?auto_2993 ) ) ( not ( = ?auto_2996 ?auto_2993 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_2990 ?auto_2992 ?auto_2989 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_2998 - OBJ
      ?auto_2999 - OBJ
      ?auto_3000 - OBJ
      ?auto_2997 - LOCATION
    )
    :vars
    (
      ?auto_3005 - LOCATION
      ?auto_3003 - CITY
      ?auto_3001 - OBJ
      ?auto_3004 - TRUCK
      ?auto_3002 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3005 ?auto_3003 ) ( IN-CITY ?auto_2997 ?auto_3003 ) ( not ( = ?auto_2997 ?auto_3005 ) ) ( OBJ-AT ?auto_3000 ?auto_2997 ) ( not ( = ?auto_3000 ?auto_2999 ) ) ( OBJ-AT ?auto_2999 ?auto_3005 ) ( IN-TRUCK ?auto_3001 ?auto_3004 ) ( not ( = ?auto_3000 ?auto_3001 ) ) ( not ( = ?auto_2999 ?auto_3001 ) ) ( TRUCK-AT ?auto_3004 ?auto_3002 ) ( IN-CITY ?auto_3002 ?auto_3003 ) ( not ( = ?auto_2997 ?auto_3002 ) ) ( not ( = ?auto_3005 ?auto_3002 ) ) ( OBJ-AT ?auto_2998 ?auto_2997 ) ( not ( = ?auto_2998 ?auto_2999 ) ) ( not ( = ?auto_2998 ?auto_3000 ) ) ( not ( = ?auto_2998 ?auto_3001 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3000 ?auto_2999 ?auto_2997 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3007 - OBJ
      ?auto_3008 - OBJ
      ?auto_3009 - OBJ
      ?auto_3006 - LOCATION
    )
    :vars
    (
      ?auto_3013 - LOCATION
      ?auto_3011 - CITY
      ?auto_3012 - TRUCK
      ?auto_3010 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3013 ?auto_3011 ) ( IN-CITY ?auto_3006 ?auto_3011 ) ( not ( = ?auto_3006 ?auto_3013 ) ) ( OBJ-AT ?auto_3007 ?auto_3006 ) ( not ( = ?auto_3007 ?auto_3008 ) ) ( OBJ-AT ?auto_3008 ?auto_3013 ) ( IN-TRUCK ?auto_3009 ?auto_3012 ) ( not ( = ?auto_3007 ?auto_3009 ) ) ( not ( = ?auto_3008 ?auto_3009 ) ) ( TRUCK-AT ?auto_3012 ?auto_3010 ) ( IN-CITY ?auto_3010 ?auto_3011 ) ( not ( = ?auto_3006 ?auto_3010 ) ) ( not ( = ?auto_3013 ?auto_3010 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3007 ?auto_3008 ?auto_3006 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3024 - OBJ
      ?auto_3025 - OBJ
      ?auto_3026 - OBJ
      ?auto_3023 - LOCATION
    )
    :vars
    (
      ?auto_3030 - LOCATION
      ?auto_3028 - CITY
      ?auto_3029 - TRUCK
      ?auto_3027 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3030 ?auto_3028 ) ( IN-CITY ?auto_3023 ?auto_3028 ) ( not ( = ?auto_3023 ?auto_3030 ) ) ( OBJ-AT ?auto_3025 ?auto_3023 ) ( not ( = ?auto_3025 ?auto_3026 ) ) ( OBJ-AT ?auto_3026 ?auto_3030 ) ( IN-TRUCK ?auto_3024 ?auto_3029 ) ( not ( = ?auto_3025 ?auto_3024 ) ) ( not ( = ?auto_3026 ?auto_3024 ) ) ( TRUCK-AT ?auto_3029 ?auto_3027 ) ( IN-CITY ?auto_3027 ?auto_3028 ) ( not ( = ?auto_3023 ?auto_3027 ) ) ( not ( = ?auto_3030 ?auto_3027 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3025 ?auto_3026 ?auto_3023 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3041 - OBJ
      ?auto_3042 - OBJ
      ?auto_3043 - OBJ
      ?auto_3040 - LOCATION
    )
    :vars
    (
      ?auto_3047 - LOCATION
      ?auto_3045 - CITY
      ?auto_3046 - TRUCK
      ?auto_3044 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3047 ?auto_3045 ) ( IN-CITY ?auto_3040 ?auto_3045 ) ( not ( = ?auto_3040 ?auto_3047 ) ) ( OBJ-AT ?auto_3043 ?auto_3040 ) ( not ( = ?auto_3043 ?auto_3042 ) ) ( OBJ-AT ?auto_3042 ?auto_3047 ) ( IN-TRUCK ?auto_3041 ?auto_3046 ) ( not ( = ?auto_3043 ?auto_3041 ) ) ( not ( = ?auto_3042 ?auto_3041 ) ) ( TRUCK-AT ?auto_3046 ?auto_3044 ) ( IN-CITY ?auto_3044 ?auto_3045 ) ( not ( = ?auto_3040 ?auto_3044 ) ) ( not ( = ?auto_3047 ?auto_3044 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3043 ?auto_3042 ?auto_3040 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3067 - OBJ
      ?auto_3068 - OBJ
      ?auto_3069 - OBJ
      ?auto_3066 - LOCATION
    )
    :vars
    (
      ?auto_3074 - LOCATION
      ?auto_3072 - CITY
      ?auto_3070 - OBJ
      ?auto_3073 - TRUCK
      ?auto_3071 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3074 ?auto_3072 ) ( IN-CITY ?auto_3066 ?auto_3072 ) ( not ( = ?auto_3066 ?auto_3074 ) ) ( OBJ-AT ?auto_3069 ?auto_3066 ) ( not ( = ?auto_3069 ?auto_3067 ) ) ( OBJ-AT ?auto_3067 ?auto_3074 ) ( IN-TRUCK ?auto_3070 ?auto_3073 ) ( not ( = ?auto_3069 ?auto_3070 ) ) ( not ( = ?auto_3067 ?auto_3070 ) ) ( TRUCK-AT ?auto_3073 ?auto_3071 ) ( IN-CITY ?auto_3071 ?auto_3072 ) ( not ( = ?auto_3066 ?auto_3071 ) ) ( not ( = ?auto_3074 ?auto_3071 ) ) ( OBJ-AT ?auto_3068 ?auto_3066 ) ( not ( = ?auto_3067 ?auto_3068 ) ) ( not ( = ?auto_3068 ?auto_3069 ) ) ( not ( = ?auto_3068 ?auto_3070 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3069 ?auto_3067 ?auto_3066 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3076 - OBJ
      ?auto_3077 - OBJ
      ?auto_3078 - OBJ
      ?auto_3075 - LOCATION
    )
    :vars
    (
      ?auto_3082 - LOCATION
      ?auto_3080 - CITY
      ?auto_3081 - TRUCK
      ?auto_3079 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3082 ?auto_3080 ) ( IN-CITY ?auto_3075 ?auto_3080 ) ( not ( = ?auto_3075 ?auto_3082 ) ) ( OBJ-AT ?auto_3077 ?auto_3075 ) ( not ( = ?auto_3077 ?auto_3076 ) ) ( OBJ-AT ?auto_3076 ?auto_3082 ) ( IN-TRUCK ?auto_3078 ?auto_3081 ) ( not ( = ?auto_3077 ?auto_3078 ) ) ( not ( = ?auto_3076 ?auto_3078 ) ) ( TRUCK-AT ?auto_3081 ?auto_3079 ) ( IN-CITY ?auto_3079 ?auto_3080 ) ( not ( = ?auto_3075 ?auto_3079 ) ) ( not ( = ?auto_3082 ?auto_3079 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3077 ?auto_3076 ?auto_3075 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3093 - OBJ
      ?auto_3094 - OBJ
      ?auto_3095 - OBJ
      ?auto_3092 - LOCATION
    )
    :vars
    (
      ?auto_3099 - LOCATION
      ?auto_3097 - CITY
      ?auto_3098 - TRUCK
      ?auto_3096 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3099 ?auto_3097 ) ( IN-CITY ?auto_3092 ?auto_3097 ) ( not ( = ?auto_3092 ?auto_3099 ) ) ( OBJ-AT ?auto_3095 ?auto_3092 ) ( not ( = ?auto_3095 ?auto_3093 ) ) ( OBJ-AT ?auto_3093 ?auto_3099 ) ( IN-TRUCK ?auto_3094 ?auto_3098 ) ( not ( = ?auto_3095 ?auto_3094 ) ) ( not ( = ?auto_3093 ?auto_3094 ) ) ( TRUCK-AT ?auto_3098 ?auto_3096 ) ( IN-CITY ?auto_3096 ?auto_3097 ) ( not ( = ?auto_3092 ?auto_3096 ) ) ( not ( = ?auto_3099 ?auto_3096 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3095 ?auto_3093 ?auto_3092 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3147 - OBJ
      ?auto_3146 - LOCATION
    )
    :vars
    (
      ?auto_3152 - LOCATION
      ?auto_3150 - CITY
      ?auto_3153 - OBJ
      ?auto_3148 - OBJ
      ?auto_3151 - TRUCK
      ?auto_3149 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3152 ?auto_3150 ) ( IN-CITY ?auto_3146 ?auto_3150 ) ( not ( = ?auto_3146 ?auto_3152 ) ) ( OBJ-AT ?auto_3153 ?auto_3146 ) ( not ( = ?auto_3153 ?auto_3147 ) ) ( OBJ-AT ?auto_3147 ?auto_3152 ) ( not ( = ?auto_3153 ?auto_3148 ) ) ( not ( = ?auto_3147 ?auto_3148 ) ) ( TRUCK-AT ?auto_3151 ?auto_3149 ) ( IN-CITY ?auto_3149 ?auto_3150 ) ( not ( = ?auto_3146 ?auto_3149 ) ) ( not ( = ?auto_3152 ?auto_3149 ) ) ( OBJ-AT ?auto_3148 ?auto_3149 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_3148 ?auto_3151 ?auto_3149 )
      ( DELIVER-2PKG ?auto_3153 ?auto_3147 ?auto_3146 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3155 - OBJ
      ?auto_3156 - OBJ
      ?auto_3154 - LOCATION
    )
    :vars
    (
      ?auto_3157 - LOCATION
      ?auto_3161 - CITY
      ?auto_3160 - OBJ
      ?auto_3158 - TRUCK
      ?auto_3159 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3157 ?auto_3161 ) ( IN-CITY ?auto_3154 ?auto_3161 ) ( not ( = ?auto_3154 ?auto_3157 ) ) ( OBJ-AT ?auto_3155 ?auto_3154 ) ( not ( = ?auto_3155 ?auto_3156 ) ) ( OBJ-AT ?auto_3156 ?auto_3157 ) ( not ( = ?auto_3155 ?auto_3160 ) ) ( not ( = ?auto_3156 ?auto_3160 ) ) ( TRUCK-AT ?auto_3158 ?auto_3159 ) ( IN-CITY ?auto_3159 ?auto_3161 ) ( not ( = ?auto_3154 ?auto_3159 ) ) ( not ( = ?auto_3157 ?auto_3159 ) ) ( OBJ-AT ?auto_3160 ?auto_3159 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3156 ?auto_3154 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3163 - OBJ
      ?auto_3164 - OBJ
      ?auto_3162 - LOCATION
    )
    :vars
    (
      ?auto_3168 - LOCATION
      ?auto_3167 - CITY
      ?auto_3169 - OBJ
      ?auto_3166 - TRUCK
      ?auto_3165 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3168 ?auto_3167 ) ( IN-CITY ?auto_3162 ?auto_3167 ) ( not ( = ?auto_3162 ?auto_3168 ) ) ( OBJ-AT ?auto_3169 ?auto_3162 ) ( not ( = ?auto_3169 ?auto_3164 ) ) ( OBJ-AT ?auto_3164 ?auto_3168 ) ( not ( = ?auto_3169 ?auto_3163 ) ) ( not ( = ?auto_3164 ?auto_3163 ) ) ( TRUCK-AT ?auto_3166 ?auto_3165 ) ( IN-CITY ?auto_3165 ?auto_3167 ) ( not ( = ?auto_3162 ?auto_3165 ) ) ( not ( = ?auto_3168 ?auto_3165 ) ) ( OBJ-AT ?auto_3163 ?auto_3165 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3169 ?auto_3164 ?auto_3162 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3171 - OBJ
      ?auto_3172 - OBJ
      ?auto_3170 - LOCATION
    )
    :vars
    (
      ?auto_3177 - LOCATION
      ?auto_3175 - CITY
      ?auto_3176 - OBJ
      ?auto_3174 - TRUCK
      ?auto_3173 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3177 ?auto_3175 ) ( IN-CITY ?auto_3170 ?auto_3175 ) ( not ( = ?auto_3170 ?auto_3177 ) ) ( OBJ-AT ?auto_3172 ?auto_3170 ) ( not ( = ?auto_3172 ?auto_3171 ) ) ( OBJ-AT ?auto_3171 ?auto_3177 ) ( not ( = ?auto_3172 ?auto_3176 ) ) ( not ( = ?auto_3171 ?auto_3176 ) ) ( TRUCK-AT ?auto_3174 ?auto_3173 ) ( IN-CITY ?auto_3173 ?auto_3175 ) ( not ( = ?auto_3170 ?auto_3173 ) ) ( not ( = ?auto_3177 ?auto_3173 ) ) ( OBJ-AT ?auto_3176 ?auto_3173 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3172 ?auto_3171 ?auto_3170 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3179 - OBJ
      ?auto_3180 - OBJ
      ?auto_3178 - LOCATION
    )
    :vars
    (
      ?auto_3184 - LOCATION
      ?auto_3183 - CITY
      ?auto_3185 - OBJ
      ?auto_3182 - TRUCK
      ?auto_3181 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3184 ?auto_3183 ) ( IN-CITY ?auto_3178 ?auto_3183 ) ( not ( = ?auto_3178 ?auto_3184 ) ) ( OBJ-AT ?auto_3185 ?auto_3178 ) ( not ( = ?auto_3185 ?auto_3179 ) ) ( OBJ-AT ?auto_3179 ?auto_3184 ) ( not ( = ?auto_3185 ?auto_3180 ) ) ( not ( = ?auto_3179 ?auto_3180 ) ) ( TRUCK-AT ?auto_3182 ?auto_3181 ) ( IN-CITY ?auto_3181 ?auto_3183 ) ( not ( = ?auto_3178 ?auto_3181 ) ) ( not ( = ?auto_3184 ?auto_3181 ) ) ( OBJ-AT ?auto_3180 ?auto_3181 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3185 ?auto_3179 ?auto_3178 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3196 - OBJ
      ?auto_3197 - OBJ
      ?auto_3198 - OBJ
      ?auto_3195 - LOCATION
    )
    :vars
    (
      ?auto_3203 - LOCATION
      ?auto_3201 - CITY
      ?auto_3202 - OBJ
      ?auto_3200 - TRUCK
      ?auto_3199 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3203 ?auto_3201 ) ( IN-CITY ?auto_3195 ?auto_3201 ) ( not ( = ?auto_3195 ?auto_3203 ) ) ( OBJ-AT ?auto_3196 ?auto_3195 ) ( not ( = ?auto_3196 ?auto_3198 ) ) ( OBJ-AT ?auto_3198 ?auto_3203 ) ( not ( = ?auto_3196 ?auto_3202 ) ) ( not ( = ?auto_3198 ?auto_3202 ) ) ( TRUCK-AT ?auto_3200 ?auto_3199 ) ( IN-CITY ?auto_3199 ?auto_3201 ) ( not ( = ?auto_3195 ?auto_3199 ) ) ( not ( = ?auto_3203 ?auto_3199 ) ) ( OBJ-AT ?auto_3202 ?auto_3199 ) ( OBJ-AT ?auto_3197 ?auto_3195 ) ( not ( = ?auto_3196 ?auto_3197 ) ) ( not ( = ?auto_3197 ?auto_3198 ) ) ( not ( = ?auto_3197 ?auto_3202 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3196 ?auto_3198 ?auto_3195 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3205 - OBJ
      ?auto_3206 - OBJ
      ?auto_3207 - OBJ
      ?auto_3204 - LOCATION
    )
    :vars
    (
      ?auto_3211 - LOCATION
      ?auto_3210 - CITY
      ?auto_3209 - TRUCK
      ?auto_3208 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3211 ?auto_3210 ) ( IN-CITY ?auto_3204 ?auto_3210 ) ( not ( = ?auto_3204 ?auto_3211 ) ) ( OBJ-AT ?auto_3205 ?auto_3204 ) ( not ( = ?auto_3205 ?auto_3207 ) ) ( OBJ-AT ?auto_3207 ?auto_3211 ) ( not ( = ?auto_3205 ?auto_3206 ) ) ( not ( = ?auto_3207 ?auto_3206 ) ) ( TRUCK-AT ?auto_3209 ?auto_3208 ) ( IN-CITY ?auto_3208 ?auto_3210 ) ( not ( = ?auto_3204 ?auto_3208 ) ) ( not ( = ?auto_3211 ?auto_3208 ) ) ( OBJ-AT ?auto_3206 ?auto_3208 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3205 ?auto_3207 ?auto_3204 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3213 - OBJ
      ?auto_3214 - OBJ
      ?auto_3215 - OBJ
      ?auto_3212 - LOCATION
    )
    :vars
    (
      ?auto_3220 - LOCATION
      ?auto_3218 - CITY
      ?auto_3219 - OBJ
      ?auto_3217 - TRUCK
      ?auto_3216 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3220 ?auto_3218 ) ( IN-CITY ?auto_3212 ?auto_3218 ) ( not ( = ?auto_3212 ?auto_3220 ) ) ( OBJ-AT ?auto_3215 ?auto_3212 ) ( not ( = ?auto_3215 ?auto_3214 ) ) ( OBJ-AT ?auto_3214 ?auto_3220 ) ( not ( = ?auto_3215 ?auto_3219 ) ) ( not ( = ?auto_3214 ?auto_3219 ) ) ( TRUCK-AT ?auto_3217 ?auto_3216 ) ( IN-CITY ?auto_3216 ?auto_3218 ) ( not ( = ?auto_3212 ?auto_3216 ) ) ( not ( = ?auto_3220 ?auto_3216 ) ) ( OBJ-AT ?auto_3219 ?auto_3216 ) ( OBJ-AT ?auto_3213 ?auto_3212 ) ( not ( = ?auto_3213 ?auto_3214 ) ) ( not ( = ?auto_3213 ?auto_3215 ) ) ( not ( = ?auto_3213 ?auto_3219 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3215 ?auto_3214 ?auto_3212 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3222 - OBJ
      ?auto_3223 - OBJ
      ?auto_3224 - OBJ
      ?auto_3221 - LOCATION
    )
    :vars
    (
      ?auto_3228 - LOCATION
      ?auto_3227 - CITY
      ?auto_3226 - TRUCK
      ?auto_3225 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3228 ?auto_3227 ) ( IN-CITY ?auto_3221 ?auto_3227 ) ( not ( = ?auto_3221 ?auto_3228 ) ) ( OBJ-AT ?auto_3222 ?auto_3221 ) ( not ( = ?auto_3222 ?auto_3223 ) ) ( OBJ-AT ?auto_3223 ?auto_3228 ) ( not ( = ?auto_3222 ?auto_3224 ) ) ( not ( = ?auto_3223 ?auto_3224 ) ) ( TRUCK-AT ?auto_3226 ?auto_3225 ) ( IN-CITY ?auto_3225 ?auto_3227 ) ( not ( = ?auto_3221 ?auto_3225 ) ) ( not ( = ?auto_3228 ?auto_3225 ) ) ( OBJ-AT ?auto_3224 ?auto_3225 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3222 ?auto_3223 ?auto_3221 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3239 - OBJ
      ?auto_3240 - OBJ
      ?auto_3241 - OBJ
      ?auto_3238 - LOCATION
    )
    :vars
    (
      ?auto_3245 - LOCATION
      ?auto_3244 - CITY
      ?auto_3243 - TRUCK
      ?auto_3242 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3245 ?auto_3244 ) ( IN-CITY ?auto_3238 ?auto_3244 ) ( not ( = ?auto_3238 ?auto_3245 ) ) ( OBJ-AT ?auto_3240 ?auto_3238 ) ( not ( = ?auto_3240 ?auto_3241 ) ) ( OBJ-AT ?auto_3241 ?auto_3245 ) ( not ( = ?auto_3240 ?auto_3239 ) ) ( not ( = ?auto_3241 ?auto_3239 ) ) ( TRUCK-AT ?auto_3243 ?auto_3242 ) ( IN-CITY ?auto_3242 ?auto_3244 ) ( not ( = ?auto_3238 ?auto_3242 ) ) ( not ( = ?auto_3245 ?auto_3242 ) ) ( OBJ-AT ?auto_3239 ?auto_3242 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3240 ?auto_3241 ?auto_3238 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3256 - OBJ
      ?auto_3257 - OBJ
      ?auto_3258 - OBJ
      ?auto_3255 - LOCATION
    )
    :vars
    (
      ?auto_3262 - LOCATION
      ?auto_3261 - CITY
      ?auto_3260 - TRUCK
      ?auto_3259 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3262 ?auto_3261 ) ( IN-CITY ?auto_3255 ?auto_3261 ) ( not ( = ?auto_3255 ?auto_3262 ) ) ( OBJ-AT ?auto_3258 ?auto_3255 ) ( not ( = ?auto_3258 ?auto_3257 ) ) ( OBJ-AT ?auto_3257 ?auto_3262 ) ( not ( = ?auto_3258 ?auto_3256 ) ) ( not ( = ?auto_3257 ?auto_3256 ) ) ( TRUCK-AT ?auto_3260 ?auto_3259 ) ( IN-CITY ?auto_3259 ?auto_3261 ) ( not ( = ?auto_3255 ?auto_3259 ) ) ( not ( = ?auto_3262 ?auto_3259 ) ) ( OBJ-AT ?auto_3256 ?auto_3259 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3258 ?auto_3257 ?auto_3255 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3282 - OBJ
      ?auto_3283 - OBJ
      ?auto_3284 - OBJ
      ?auto_3281 - LOCATION
    )
    :vars
    (
      ?auto_3289 - LOCATION
      ?auto_3287 - CITY
      ?auto_3288 - OBJ
      ?auto_3286 - TRUCK
      ?auto_3285 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3289 ?auto_3287 ) ( IN-CITY ?auto_3281 ?auto_3287 ) ( not ( = ?auto_3281 ?auto_3289 ) ) ( OBJ-AT ?auto_3284 ?auto_3281 ) ( not ( = ?auto_3284 ?auto_3282 ) ) ( OBJ-AT ?auto_3282 ?auto_3289 ) ( not ( = ?auto_3284 ?auto_3288 ) ) ( not ( = ?auto_3282 ?auto_3288 ) ) ( TRUCK-AT ?auto_3286 ?auto_3285 ) ( IN-CITY ?auto_3285 ?auto_3287 ) ( not ( = ?auto_3281 ?auto_3285 ) ) ( not ( = ?auto_3289 ?auto_3285 ) ) ( OBJ-AT ?auto_3288 ?auto_3285 ) ( OBJ-AT ?auto_3283 ?auto_3281 ) ( not ( = ?auto_3282 ?auto_3283 ) ) ( not ( = ?auto_3283 ?auto_3284 ) ) ( not ( = ?auto_3283 ?auto_3288 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3284 ?auto_3282 ?auto_3281 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3291 - OBJ
      ?auto_3292 - OBJ
      ?auto_3293 - OBJ
      ?auto_3290 - LOCATION
    )
    :vars
    (
      ?auto_3297 - LOCATION
      ?auto_3296 - CITY
      ?auto_3295 - TRUCK
      ?auto_3294 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3297 ?auto_3296 ) ( IN-CITY ?auto_3290 ?auto_3296 ) ( not ( = ?auto_3290 ?auto_3297 ) ) ( OBJ-AT ?auto_3292 ?auto_3290 ) ( not ( = ?auto_3292 ?auto_3291 ) ) ( OBJ-AT ?auto_3291 ?auto_3297 ) ( not ( = ?auto_3292 ?auto_3293 ) ) ( not ( = ?auto_3291 ?auto_3293 ) ) ( TRUCK-AT ?auto_3295 ?auto_3294 ) ( IN-CITY ?auto_3294 ?auto_3296 ) ( not ( = ?auto_3290 ?auto_3294 ) ) ( not ( = ?auto_3297 ?auto_3294 ) ) ( OBJ-AT ?auto_3293 ?auto_3294 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3292 ?auto_3291 ?auto_3290 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3308 - OBJ
      ?auto_3309 - OBJ
      ?auto_3310 - OBJ
      ?auto_3307 - LOCATION
    )
    :vars
    (
      ?auto_3314 - LOCATION
      ?auto_3313 - CITY
      ?auto_3312 - TRUCK
      ?auto_3311 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3314 ?auto_3313 ) ( IN-CITY ?auto_3307 ?auto_3313 ) ( not ( = ?auto_3307 ?auto_3314 ) ) ( OBJ-AT ?auto_3310 ?auto_3307 ) ( not ( = ?auto_3310 ?auto_3308 ) ) ( OBJ-AT ?auto_3308 ?auto_3314 ) ( not ( = ?auto_3310 ?auto_3309 ) ) ( not ( = ?auto_3308 ?auto_3309 ) ) ( TRUCK-AT ?auto_3312 ?auto_3311 ) ( IN-CITY ?auto_3311 ?auto_3313 ) ( not ( = ?auto_3307 ?auto_3311 ) ) ( not ( = ?auto_3314 ?auto_3311 ) ) ( OBJ-AT ?auto_3309 ?auto_3311 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3310 ?auto_3308 ?auto_3307 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3362 - OBJ
      ?auto_3361 - LOCATION
    )
    :vars
    (
      ?auto_3367 - LOCATION
      ?auto_3365 - CITY
      ?auto_3368 - OBJ
      ?auto_3366 - OBJ
      ?auto_3363 - LOCATION
      ?auto_3364 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3367 ?auto_3365 ) ( IN-CITY ?auto_3361 ?auto_3365 ) ( not ( = ?auto_3361 ?auto_3367 ) ) ( OBJ-AT ?auto_3368 ?auto_3361 ) ( not ( = ?auto_3368 ?auto_3362 ) ) ( OBJ-AT ?auto_3362 ?auto_3367 ) ( not ( = ?auto_3368 ?auto_3366 ) ) ( not ( = ?auto_3362 ?auto_3366 ) ) ( IN-CITY ?auto_3363 ?auto_3365 ) ( not ( = ?auto_3361 ?auto_3363 ) ) ( not ( = ?auto_3367 ?auto_3363 ) ) ( OBJ-AT ?auto_3366 ?auto_3363 ) ( TRUCK-AT ?auto_3364 ?auto_3361 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3364 ?auto_3361 ?auto_3363 ?auto_3365 )
      ( DELIVER-2PKG ?auto_3368 ?auto_3362 ?auto_3361 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3370 - OBJ
      ?auto_3371 - OBJ
      ?auto_3369 - LOCATION
    )
    :vars
    (
      ?auto_3372 - LOCATION
      ?auto_3376 - CITY
      ?auto_3373 - OBJ
      ?auto_3375 - LOCATION
      ?auto_3374 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3372 ?auto_3376 ) ( IN-CITY ?auto_3369 ?auto_3376 ) ( not ( = ?auto_3369 ?auto_3372 ) ) ( OBJ-AT ?auto_3370 ?auto_3369 ) ( not ( = ?auto_3370 ?auto_3371 ) ) ( OBJ-AT ?auto_3371 ?auto_3372 ) ( not ( = ?auto_3370 ?auto_3373 ) ) ( not ( = ?auto_3371 ?auto_3373 ) ) ( IN-CITY ?auto_3375 ?auto_3376 ) ( not ( = ?auto_3369 ?auto_3375 ) ) ( not ( = ?auto_3372 ?auto_3375 ) ) ( OBJ-AT ?auto_3373 ?auto_3375 ) ( TRUCK-AT ?auto_3374 ?auto_3369 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3371 ?auto_3369 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3378 - OBJ
      ?auto_3379 - OBJ
      ?auto_3377 - LOCATION
    )
    :vars
    (
      ?auto_3382 - LOCATION
      ?auto_3380 - CITY
      ?auto_3384 - OBJ
      ?auto_3381 - LOCATION
      ?auto_3383 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3382 ?auto_3380 ) ( IN-CITY ?auto_3377 ?auto_3380 ) ( not ( = ?auto_3377 ?auto_3382 ) ) ( OBJ-AT ?auto_3384 ?auto_3377 ) ( not ( = ?auto_3384 ?auto_3379 ) ) ( OBJ-AT ?auto_3379 ?auto_3382 ) ( not ( = ?auto_3384 ?auto_3378 ) ) ( not ( = ?auto_3379 ?auto_3378 ) ) ( IN-CITY ?auto_3381 ?auto_3380 ) ( not ( = ?auto_3377 ?auto_3381 ) ) ( not ( = ?auto_3382 ?auto_3381 ) ) ( OBJ-AT ?auto_3378 ?auto_3381 ) ( TRUCK-AT ?auto_3383 ?auto_3377 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3384 ?auto_3379 ?auto_3377 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3386 - OBJ
      ?auto_3387 - OBJ
      ?auto_3385 - LOCATION
    )
    :vars
    (
      ?auto_3390 - LOCATION
      ?auto_3388 - CITY
      ?auto_3392 - OBJ
      ?auto_3389 - LOCATION
      ?auto_3391 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3390 ?auto_3388 ) ( IN-CITY ?auto_3385 ?auto_3388 ) ( not ( = ?auto_3385 ?auto_3390 ) ) ( OBJ-AT ?auto_3387 ?auto_3385 ) ( not ( = ?auto_3387 ?auto_3386 ) ) ( OBJ-AT ?auto_3386 ?auto_3390 ) ( not ( = ?auto_3387 ?auto_3392 ) ) ( not ( = ?auto_3386 ?auto_3392 ) ) ( IN-CITY ?auto_3389 ?auto_3388 ) ( not ( = ?auto_3385 ?auto_3389 ) ) ( not ( = ?auto_3390 ?auto_3389 ) ) ( OBJ-AT ?auto_3392 ?auto_3389 ) ( TRUCK-AT ?auto_3391 ?auto_3385 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3387 ?auto_3386 ?auto_3385 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3394 - OBJ
      ?auto_3395 - OBJ
      ?auto_3393 - LOCATION
    )
    :vars
    (
      ?auto_3398 - LOCATION
      ?auto_3396 - CITY
      ?auto_3400 - OBJ
      ?auto_3397 - LOCATION
      ?auto_3399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3398 ?auto_3396 ) ( IN-CITY ?auto_3393 ?auto_3396 ) ( not ( = ?auto_3393 ?auto_3398 ) ) ( OBJ-AT ?auto_3400 ?auto_3393 ) ( not ( = ?auto_3400 ?auto_3394 ) ) ( OBJ-AT ?auto_3394 ?auto_3398 ) ( not ( = ?auto_3400 ?auto_3395 ) ) ( not ( = ?auto_3394 ?auto_3395 ) ) ( IN-CITY ?auto_3397 ?auto_3396 ) ( not ( = ?auto_3393 ?auto_3397 ) ) ( not ( = ?auto_3398 ?auto_3397 ) ) ( OBJ-AT ?auto_3395 ?auto_3397 ) ( TRUCK-AT ?auto_3399 ?auto_3393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3400 ?auto_3394 ?auto_3393 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3411 - OBJ
      ?auto_3412 - OBJ
      ?auto_3413 - OBJ
      ?auto_3410 - LOCATION
    )
    :vars
    (
      ?auto_3416 - LOCATION
      ?auto_3414 - CITY
      ?auto_3418 - OBJ
      ?auto_3415 - LOCATION
      ?auto_3417 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3416 ?auto_3414 ) ( IN-CITY ?auto_3410 ?auto_3414 ) ( not ( = ?auto_3410 ?auto_3416 ) ) ( OBJ-AT ?auto_3411 ?auto_3410 ) ( not ( = ?auto_3411 ?auto_3413 ) ) ( OBJ-AT ?auto_3413 ?auto_3416 ) ( not ( = ?auto_3411 ?auto_3418 ) ) ( not ( = ?auto_3413 ?auto_3418 ) ) ( IN-CITY ?auto_3415 ?auto_3414 ) ( not ( = ?auto_3410 ?auto_3415 ) ) ( not ( = ?auto_3416 ?auto_3415 ) ) ( OBJ-AT ?auto_3418 ?auto_3415 ) ( TRUCK-AT ?auto_3417 ?auto_3410 ) ( OBJ-AT ?auto_3412 ?auto_3410 ) ( not ( = ?auto_3411 ?auto_3412 ) ) ( not ( = ?auto_3412 ?auto_3413 ) ) ( not ( = ?auto_3412 ?auto_3418 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3411 ?auto_3413 ?auto_3410 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3420 - OBJ
      ?auto_3421 - OBJ
      ?auto_3422 - OBJ
      ?auto_3419 - LOCATION
    )
    :vars
    (
      ?auto_3425 - LOCATION
      ?auto_3423 - CITY
      ?auto_3424 - LOCATION
      ?auto_3426 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3425 ?auto_3423 ) ( IN-CITY ?auto_3419 ?auto_3423 ) ( not ( = ?auto_3419 ?auto_3425 ) ) ( OBJ-AT ?auto_3420 ?auto_3419 ) ( not ( = ?auto_3420 ?auto_3422 ) ) ( OBJ-AT ?auto_3422 ?auto_3425 ) ( not ( = ?auto_3420 ?auto_3421 ) ) ( not ( = ?auto_3422 ?auto_3421 ) ) ( IN-CITY ?auto_3424 ?auto_3423 ) ( not ( = ?auto_3419 ?auto_3424 ) ) ( not ( = ?auto_3425 ?auto_3424 ) ) ( OBJ-AT ?auto_3421 ?auto_3424 ) ( TRUCK-AT ?auto_3426 ?auto_3419 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3420 ?auto_3422 ?auto_3419 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3428 - OBJ
      ?auto_3429 - OBJ
      ?auto_3430 - OBJ
      ?auto_3427 - LOCATION
    )
    :vars
    (
      ?auto_3433 - LOCATION
      ?auto_3431 - CITY
      ?auto_3435 - OBJ
      ?auto_3432 - LOCATION
      ?auto_3434 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3433 ?auto_3431 ) ( IN-CITY ?auto_3427 ?auto_3431 ) ( not ( = ?auto_3427 ?auto_3433 ) ) ( OBJ-AT ?auto_3430 ?auto_3427 ) ( not ( = ?auto_3430 ?auto_3429 ) ) ( OBJ-AT ?auto_3429 ?auto_3433 ) ( not ( = ?auto_3430 ?auto_3435 ) ) ( not ( = ?auto_3429 ?auto_3435 ) ) ( IN-CITY ?auto_3432 ?auto_3431 ) ( not ( = ?auto_3427 ?auto_3432 ) ) ( not ( = ?auto_3433 ?auto_3432 ) ) ( OBJ-AT ?auto_3435 ?auto_3432 ) ( TRUCK-AT ?auto_3434 ?auto_3427 ) ( OBJ-AT ?auto_3428 ?auto_3427 ) ( not ( = ?auto_3428 ?auto_3429 ) ) ( not ( = ?auto_3428 ?auto_3430 ) ) ( not ( = ?auto_3428 ?auto_3435 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3430 ?auto_3429 ?auto_3427 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3437 - OBJ
      ?auto_3438 - OBJ
      ?auto_3439 - OBJ
      ?auto_3436 - LOCATION
    )
    :vars
    (
      ?auto_3442 - LOCATION
      ?auto_3440 - CITY
      ?auto_3441 - LOCATION
      ?auto_3443 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3442 ?auto_3440 ) ( IN-CITY ?auto_3436 ?auto_3440 ) ( not ( = ?auto_3436 ?auto_3442 ) ) ( OBJ-AT ?auto_3437 ?auto_3436 ) ( not ( = ?auto_3437 ?auto_3438 ) ) ( OBJ-AT ?auto_3438 ?auto_3442 ) ( not ( = ?auto_3437 ?auto_3439 ) ) ( not ( = ?auto_3438 ?auto_3439 ) ) ( IN-CITY ?auto_3441 ?auto_3440 ) ( not ( = ?auto_3436 ?auto_3441 ) ) ( not ( = ?auto_3442 ?auto_3441 ) ) ( OBJ-AT ?auto_3439 ?auto_3441 ) ( TRUCK-AT ?auto_3443 ?auto_3436 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3437 ?auto_3438 ?auto_3436 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3454 - OBJ
      ?auto_3455 - OBJ
      ?auto_3456 - OBJ
      ?auto_3453 - LOCATION
    )
    :vars
    (
      ?auto_3459 - LOCATION
      ?auto_3457 - CITY
      ?auto_3458 - LOCATION
      ?auto_3460 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3459 ?auto_3457 ) ( IN-CITY ?auto_3453 ?auto_3457 ) ( not ( = ?auto_3453 ?auto_3459 ) ) ( OBJ-AT ?auto_3455 ?auto_3453 ) ( not ( = ?auto_3455 ?auto_3456 ) ) ( OBJ-AT ?auto_3456 ?auto_3459 ) ( not ( = ?auto_3455 ?auto_3454 ) ) ( not ( = ?auto_3456 ?auto_3454 ) ) ( IN-CITY ?auto_3458 ?auto_3457 ) ( not ( = ?auto_3453 ?auto_3458 ) ) ( not ( = ?auto_3459 ?auto_3458 ) ) ( OBJ-AT ?auto_3454 ?auto_3458 ) ( TRUCK-AT ?auto_3460 ?auto_3453 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3455 ?auto_3456 ?auto_3453 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3471 - OBJ
      ?auto_3472 - OBJ
      ?auto_3473 - OBJ
      ?auto_3470 - LOCATION
    )
    :vars
    (
      ?auto_3476 - LOCATION
      ?auto_3474 - CITY
      ?auto_3475 - LOCATION
      ?auto_3477 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3476 ?auto_3474 ) ( IN-CITY ?auto_3470 ?auto_3474 ) ( not ( = ?auto_3470 ?auto_3476 ) ) ( OBJ-AT ?auto_3473 ?auto_3470 ) ( not ( = ?auto_3473 ?auto_3472 ) ) ( OBJ-AT ?auto_3472 ?auto_3476 ) ( not ( = ?auto_3473 ?auto_3471 ) ) ( not ( = ?auto_3472 ?auto_3471 ) ) ( IN-CITY ?auto_3475 ?auto_3474 ) ( not ( = ?auto_3470 ?auto_3475 ) ) ( not ( = ?auto_3476 ?auto_3475 ) ) ( OBJ-AT ?auto_3471 ?auto_3475 ) ( TRUCK-AT ?auto_3477 ?auto_3470 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3473 ?auto_3472 ?auto_3470 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3497 - OBJ
      ?auto_3498 - OBJ
      ?auto_3499 - OBJ
      ?auto_3496 - LOCATION
    )
    :vars
    (
      ?auto_3502 - LOCATION
      ?auto_3500 - CITY
      ?auto_3504 - OBJ
      ?auto_3501 - LOCATION
      ?auto_3503 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3502 ?auto_3500 ) ( IN-CITY ?auto_3496 ?auto_3500 ) ( not ( = ?auto_3496 ?auto_3502 ) ) ( OBJ-AT ?auto_3499 ?auto_3496 ) ( not ( = ?auto_3499 ?auto_3497 ) ) ( OBJ-AT ?auto_3497 ?auto_3502 ) ( not ( = ?auto_3499 ?auto_3504 ) ) ( not ( = ?auto_3497 ?auto_3504 ) ) ( IN-CITY ?auto_3501 ?auto_3500 ) ( not ( = ?auto_3496 ?auto_3501 ) ) ( not ( = ?auto_3502 ?auto_3501 ) ) ( OBJ-AT ?auto_3504 ?auto_3501 ) ( TRUCK-AT ?auto_3503 ?auto_3496 ) ( OBJ-AT ?auto_3498 ?auto_3496 ) ( not ( = ?auto_3497 ?auto_3498 ) ) ( not ( = ?auto_3498 ?auto_3499 ) ) ( not ( = ?auto_3498 ?auto_3504 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3499 ?auto_3497 ?auto_3496 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3506 - OBJ
      ?auto_3507 - OBJ
      ?auto_3508 - OBJ
      ?auto_3505 - LOCATION
    )
    :vars
    (
      ?auto_3511 - LOCATION
      ?auto_3509 - CITY
      ?auto_3510 - LOCATION
      ?auto_3512 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3511 ?auto_3509 ) ( IN-CITY ?auto_3505 ?auto_3509 ) ( not ( = ?auto_3505 ?auto_3511 ) ) ( OBJ-AT ?auto_3507 ?auto_3505 ) ( not ( = ?auto_3507 ?auto_3506 ) ) ( OBJ-AT ?auto_3506 ?auto_3511 ) ( not ( = ?auto_3507 ?auto_3508 ) ) ( not ( = ?auto_3506 ?auto_3508 ) ) ( IN-CITY ?auto_3510 ?auto_3509 ) ( not ( = ?auto_3505 ?auto_3510 ) ) ( not ( = ?auto_3511 ?auto_3510 ) ) ( OBJ-AT ?auto_3508 ?auto_3510 ) ( TRUCK-AT ?auto_3512 ?auto_3505 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3507 ?auto_3506 ?auto_3505 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3523 - OBJ
      ?auto_3524 - OBJ
      ?auto_3525 - OBJ
      ?auto_3522 - LOCATION
    )
    :vars
    (
      ?auto_3528 - LOCATION
      ?auto_3526 - CITY
      ?auto_3527 - LOCATION
      ?auto_3529 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3528 ?auto_3526 ) ( IN-CITY ?auto_3522 ?auto_3526 ) ( not ( = ?auto_3522 ?auto_3528 ) ) ( OBJ-AT ?auto_3525 ?auto_3522 ) ( not ( = ?auto_3525 ?auto_3523 ) ) ( OBJ-AT ?auto_3523 ?auto_3528 ) ( not ( = ?auto_3525 ?auto_3524 ) ) ( not ( = ?auto_3523 ?auto_3524 ) ) ( IN-CITY ?auto_3527 ?auto_3526 ) ( not ( = ?auto_3522 ?auto_3527 ) ) ( not ( = ?auto_3528 ?auto_3527 ) ) ( OBJ-AT ?auto_3524 ?auto_3527 ) ( TRUCK-AT ?auto_3529 ?auto_3522 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3525 ?auto_3523 ?auto_3522 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3577 - OBJ
      ?auto_3576 - LOCATION
    )
    :vars
    (
      ?auto_3580 - LOCATION
      ?auto_3578 - CITY
      ?auto_3583 - OBJ
      ?auto_3582 - OBJ
      ?auto_3579 - LOCATION
      ?auto_3581 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3580 ?auto_3578 ) ( IN-CITY ?auto_3576 ?auto_3578 ) ( not ( = ?auto_3576 ?auto_3580 ) ) ( not ( = ?auto_3583 ?auto_3577 ) ) ( OBJ-AT ?auto_3577 ?auto_3580 ) ( not ( = ?auto_3583 ?auto_3582 ) ) ( not ( = ?auto_3577 ?auto_3582 ) ) ( IN-CITY ?auto_3579 ?auto_3578 ) ( not ( = ?auto_3576 ?auto_3579 ) ) ( not ( = ?auto_3580 ?auto_3579 ) ) ( OBJ-AT ?auto_3582 ?auto_3579 ) ( TRUCK-AT ?auto_3581 ?auto_3576 ) ( IN-TRUCK ?auto_3583 ?auto_3581 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3583 ?auto_3576 )
      ( DELIVER-2PKG ?auto_3583 ?auto_3577 ?auto_3576 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3585 - OBJ
      ?auto_3586 - OBJ
      ?auto_3584 - LOCATION
    )
    :vars
    (
      ?auto_3587 - LOCATION
      ?auto_3589 - CITY
      ?auto_3590 - OBJ
      ?auto_3591 - LOCATION
      ?auto_3588 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3587 ?auto_3589 ) ( IN-CITY ?auto_3584 ?auto_3589 ) ( not ( = ?auto_3584 ?auto_3587 ) ) ( not ( = ?auto_3585 ?auto_3586 ) ) ( OBJ-AT ?auto_3586 ?auto_3587 ) ( not ( = ?auto_3585 ?auto_3590 ) ) ( not ( = ?auto_3586 ?auto_3590 ) ) ( IN-CITY ?auto_3591 ?auto_3589 ) ( not ( = ?auto_3584 ?auto_3591 ) ) ( not ( = ?auto_3587 ?auto_3591 ) ) ( OBJ-AT ?auto_3590 ?auto_3591 ) ( TRUCK-AT ?auto_3588 ?auto_3584 ) ( IN-TRUCK ?auto_3585 ?auto_3588 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3586 ?auto_3584 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3593 - OBJ
      ?auto_3594 - OBJ
      ?auto_3592 - LOCATION
    )
    :vars
    (
      ?auto_3598 - LOCATION
      ?auto_3595 - CITY
      ?auto_3599 - OBJ
      ?auto_3596 - LOCATION
      ?auto_3597 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3598 ?auto_3595 ) ( IN-CITY ?auto_3592 ?auto_3595 ) ( not ( = ?auto_3592 ?auto_3598 ) ) ( not ( = ?auto_3599 ?auto_3594 ) ) ( OBJ-AT ?auto_3594 ?auto_3598 ) ( not ( = ?auto_3599 ?auto_3593 ) ) ( not ( = ?auto_3594 ?auto_3593 ) ) ( IN-CITY ?auto_3596 ?auto_3595 ) ( not ( = ?auto_3592 ?auto_3596 ) ) ( not ( = ?auto_3598 ?auto_3596 ) ) ( OBJ-AT ?auto_3593 ?auto_3596 ) ( TRUCK-AT ?auto_3597 ?auto_3592 ) ( IN-TRUCK ?auto_3599 ?auto_3597 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3599 ?auto_3594 ?auto_3592 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3601 - OBJ
      ?auto_3602 - OBJ
      ?auto_3600 - LOCATION
    )
    :vars
    (
      ?auto_3607 - LOCATION
      ?auto_3604 - CITY
      ?auto_3603 - OBJ
      ?auto_3605 - LOCATION
      ?auto_3606 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3607 ?auto_3604 ) ( IN-CITY ?auto_3600 ?auto_3604 ) ( not ( = ?auto_3600 ?auto_3607 ) ) ( not ( = ?auto_3602 ?auto_3601 ) ) ( OBJ-AT ?auto_3601 ?auto_3607 ) ( not ( = ?auto_3602 ?auto_3603 ) ) ( not ( = ?auto_3601 ?auto_3603 ) ) ( IN-CITY ?auto_3605 ?auto_3604 ) ( not ( = ?auto_3600 ?auto_3605 ) ) ( not ( = ?auto_3607 ?auto_3605 ) ) ( OBJ-AT ?auto_3603 ?auto_3605 ) ( TRUCK-AT ?auto_3606 ?auto_3600 ) ( IN-TRUCK ?auto_3602 ?auto_3606 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3602 ?auto_3601 ?auto_3600 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3609 - OBJ
      ?auto_3610 - OBJ
      ?auto_3608 - LOCATION
    )
    :vars
    (
      ?auto_3614 - LOCATION
      ?auto_3611 - CITY
      ?auto_3615 - OBJ
      ?auto_3612 - LOCATION
      ?auto_3613 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3614 ?auto_3611 ) ( IN-CITY ?auto_3608 ?auto_3611 ) ( not ( = ?auto_3608 ?auto_3614 ) ) ( not ( = ?auto_3615 ?auto_3609 ) ) ( OBJ-AT ?auto_3609 ?auto_3614 ) ( not ( = ?auto_3615 ?auto_3610 ) ) ( not ( = ?auto_3609 ?auto_3610 ) ) ( IN-CITY ?auto_3612 ?auto_3611 ) ( not ( = ?auto_3608 ?auto_3612 ) ) ( not ( = ?auto_3614 ?auto_3612 ) ) ( OBJ-AT ?auto_3610 ?auto_3612 ) ( TRUCK-AT ?auto_3613 ?auto_3608 ) ( IN-TRUCK ?auto_3615 ?auto_3613 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3615 ?auto_3609 ?auto_3608 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3635 - OBJ
      ?auto_3636 - OBJ
      ?auto_3637 - OBJ
      ?auto_3634 - LOCATION
    )
    :vars
    (
      ?auto_3641 - LOCATION
      ?auto_3638 - CITY
      ?auto_3639 - LOCATION
      ?auto_3640 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3641 ?auto_3638 ) ( IN-CITY ?auto_3634 ?auto_3638 ) ( not ( = ?auto_3634 ?auto_3641 ) ) ( not ( = ?auto_3635 ?auto_3637 ) ) ( OBJ-AT ?auto_3637 ?auto_3641 ) ( not ( = ?auto_3635 ?auto_3636 ) ) ( not ( = ?auto_3637 ?auto_3636 ) ) ( IN-CITY ?auto_3639 ?auto_3638 ) ( not ( = ?auto_3634 ?auto_3639 ) ) ( not ( = ?auto_3641 ?auto_3639 ) ) ( OBJ-AT ?auto_3636 ?auto_3639 ) ( TRUCK-AT ?auto_3640 ?auto_3634 ) ( IN-TRUCK ?auto_3635 ?auto_3640 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3635 ?auto_3637 ?auto_3634 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3652 - OBJ
      ?auto_3653 - OBJ
      ?auto_3654 - OBJ
      ?auto_3651 - LOCATION
    )
    :vars
    (
      ?auto_3658 - LOCATION
      ?auto_3655 - CITY
      ?auto_3656 - LOCATION
      ?auto_3657 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3658 ?auto_3655 ) ( IN-CITY ?auto_3651 ?auto_3655 ) ( not ( = ?auto_3651 ?auto_3658 ) ) ( not ( = ?auto_3652 ?auto_3653 ) ) ( OBJ-AT ?auto_3653 ?auto_3658 ) ( not ( = ?auto_3652 ?auto_3654 ) ) ( not ( = ?auto_3653 ?auto_3654 ) ) ( IN-CITY ?auto_3656 ?auto_3655 ) ( not ( = ?auto_3651 ?auto_3656 ) ) ( not ( = ?auto_3658 ?auto_3656 ) ) ( OBJ-AT ?auto_3654 ?auto_3656 ) ( TRUCK-AT ?auto_3657 ?auto_3651 ) ( IN-TRUCK ?auto_3652 ?auto_3657 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3652 ?auto_3653 ?auto_3651 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3669 - OBJ
      ?auto_3670 - OBJ
      ?auto_3671 - OBJ
      ?auto_3668 - LOCATION
    )
    :vars
    (
      ?auto_3675 - LOCATION
      ?auto_3672 - CITY
      ?auto_3673 - LOCATION
      ?auto_3674 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3675 ?auto_3672 ) ( IN-CITY ?auto_3668 ?auto_3672 ) ( not ( = ?auto_3668 ?auto_3675 ) ) ( not ( = ?auto_3670 ?auto_3671 ) ) ( OBJ-AT ?auto_3671 ?auto_3675 ) ( not ( = ?auto_3670 ?auto_3669 ) ) ( not ( = ?auto_3671 ?auto_3669 ) ) ( IN-CITY ?auto_3673 ?auto_3672 ) ( not ( = ?auto_3668 ?auto_3673 ) ) ( not ( = ?auto_3675 ?auto_3673 ) ) ( OBJ-AT ?auto_3669 ?auto_3673 ) ( TRUCK-AT ?auto_3674 ?auto_3668 ) ( IN-TRUCK ?auto_3670 ?auto_3674 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3670 ?auto_3671 ?auto_3668 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3686 - OBJ
      ?auto_3687 - OBJ
      ?auto_3688 - OBJ
      ?auto_3685 - LOCATION
    )
    :vars
    (
      ?auto_3692 - LOCATION
      ?auto_3689 - CITY
      ?auto_3690 - LOCATION
      ?auto_3691 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3692 ?auto_3689 ) ( IN-CITY ?auto_3685 ?auto_3689 ) ( not ( = ?auto_3685 ?auto_3692 ) ) ( not ( = ?auto_3688 ?auto_3687 ) ) ( OBJ-AT ?auto_3687 ?auto_3692 ) ( not ( = ?auto_3688 ?auto_3686 ) ) ( not ( = ?auto_3687 ?auto_3686 ) ) ( IN-CITY ?auto_3690 ?auto_3689 ) ( not ( = ?auto_3685 ?auto_3690 ) ) ( not ( = ?auto_3692 ?auto_3690 ) ) ( OBJ-AT ?auto_3686 ?auto_3690 ) ( TRUCK-AT ?auto_3691 ?auto_3685 ) ( IN-TRUCK ?auto_3688 ?auto_3691 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3688 ?auto_3687 ?auto_3685 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3721 - OBJ
      ?auto_3722 - OBJ
      ?auto_3723 - OBJ
      ?auto_3720 - LOCATION
    )
    :vars
    (
      ?auto_3727 - LOCATION
      ?auto_3724 - CITY
      ?auto_3725 - LOCATION
      ?auto_3726 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3727 ?auto_3724 ) ( IN-CITY ?auto_3720 ?auto_3724 ) ( not ( = ?auto_3720 ?auto_3727 ) ) ( not ( = ?auto_3722 ?auto_3721 ) ) ( OBJ-AT ?auto_3721 ?auto_3727 ) ( not ( = ?auto_3722 ?auto_3723 ) ) ( not ( = ?auto_3721 ?auto_3723 ) ) ( IN-CITY ?auto_3725 ?auto_3724 ) ( not ( = ?auto_3720 ?auto_3725 ) ) ( not ( = ?auto_3727 ?auto_3725 ) ) ( OBJ-AT ?auto_3723 ?auto_3725 ) ( TRUCK-AT ?auto_3726 ?auto_3720 ) ( IN-TRUCK ?auto_3722 ?auto_3726 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3722 ?auto_3721 ?auto_3720 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3738 - OBJ
      ?auto_3739 - OBJ
      ?auto_3740 - OBJ
      ?auto_3737 - LOCATION
    )
    :vars
    (
      ?auto_3744 - LOCATION
      ?auto_3741 - CITY
      ?auto_3742 - LOCATION
      ?auto_3743 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_3744 ?auto_3741 ) ( IN-CITY ?auto_3737 ?auto_3741 ) ( not ( = ?auto_3737 ?auto_3744 ) ) ( not ( = ?auto_3740 ?auto_3738 ) ) ( OBJ-AT ?auto_3738 ?auto_3744 ) ( not ( = ?auto_3740 ?auto_3739 ) ) ( not ( = ?auto_3738 ?auto_3739 ) ) ( IN-CITY ?auto_3742 ?auto_3741 ) ( not ( = ?auto_3737 ?auto_3742 ) ) ( not ( = ?auto_3744 ?auto_3742 ) ) ( OBJ-AT ?auto_3739 ?auto_3742 ) ( TRUCK-AT ?auto_3743 ?auto_3737 ) ( IN-TRUCK ?auto_3740 ?auto_3743 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3740 ?auto_3738 ?auto_3737 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_3792 - OBJ
      ?auto_3791 - LOCATION
    )
    :vars
    (
      ?auto_3797 - LOCATION
      ?auto_3794 - CITY
      ?auto_3798 - OBJ
      ?auto_3793 - OBJ
      ?auto_3795 - LOCATION
      ?auto_3796 - TRUCK
      ?auto_3799 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3797 ?auto_3794 ) ( IN-CITY ?auto_3791 ?auto_3794 ) ( not ( = ?auto_3791 ?auto_3797 ) ) ( not ( = ?auto_3798 ?auto_3792 ) ) ( OBJ-AT ?auto_3792 ?auto_3797 ) ( not ( = ?auto_3798 ?auto_3793 ) ) ( not ( = ?auto_3792 ?auto_3793 ) ) ( IN-CITY ?auto_3795 ?auto_3794 ) ( not ( = ?auto_3791 ?auto_3795 ) ) ( not ( = ?auto_3797 ?auto_3795 ) ) ( OBJ-AT ?auto_3793 ?auto_3795 ) ( IN-TRUCK ?auto_3798 ?auto_3796 ) ( TRUCK-AT ?auto_3796 ?auto_3799 ) ( IN-CITY ?auto_3799 ?auto_3794 ) ( not ( = ?auto_3791 ?auto_3799 ) ) ( not ( = ?auto_3797 ?auto_3799 ) ) ( not ( = ?auto_3795 ?auto_3799 ) ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_3796 ?auto_3799 ?auto_3791 ?auto_3794 )
      ( DELIVER-2PKG ?auto_3798 ?auto_3792 ?auto_3791 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3801 - OBJ
      ?auto_3802 - OBJ
      ?auto_3800 - LOCATION
    )
    :vars
    (
      ?auto_3808 - LOCATION
      ?auto_3805 - CITY
      ?auto_3804 - OBJ
      ?auto_3807 - LOCATION
      ?auto_3806 - TRUCK
      ?auto_3803 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3808 ?auto_3805 ) ( IN-CITY ?auto_3800 ?auto_3805 ) ( not ( = ?auto_3800 ?auto_3808 ) ) ( not ( = ?auto_3801 ?auto_3802 ) ) ( OBJ-AT ?auto_3802 ?auto_3808 ) ( not ( = ?auto_3801 ?auto_3804 ) ) ( not ( = ?auto_3802 ?auto_3804 ) ) ( IN-CITY ?auto_3807 ?auto_3805 ) ( not ( = ?auto_3800 ?auto_3807 ) ) ( not ( = ?auto_3808 ?auto_3807 ) ) ( OBJ-AT ?auto_3804 ?auto_3807 ) ( IN-TRUCK ?auto_3801 ?auto_3806 ) ( TRUCK-AT ?auto_3806 ?auto_3803 ) ( IN-CITY ?auto_3803 ?auto_3805 ) ( not ( = ?auto_3800 ?auto_3803 ) ) ( not ( = ?auto_3808 ?auto_3803 ) ) ( not ( = ?auto_3807 ?auto_3803 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_3802 ?auto_3800 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3810 - OBJ
      ?auto_3811 - OBJ
      ?auto_3809 - LOCATION
    )
    :vars
    (
      ?auto_3813 - LOCATION
      ?auto_3812 - CITY
      ?auto_3817 - OBJ
      ?auto_3814 - LOCATION
      ?auto_3815 - TRUCK
      ?auto_3816 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3813 ?auto_3812 ) ( IN-CITY ?auto_3809 ?auto_3812 ) ( not ( = ?auto_3809 ?auto_3813 ) ) ( not ( = ?auto_3817 ?auto_3811 ) ) ( OBJ-AT ?auto_3811 ?auto_3813 ) ( not ( = ?auto_3817 ?auto_3810 ) ) ( not ( = ?auto_3811 ?auto_3810 ) ) ( IN-CITY ?auto_3814 ?auto_3812 ) ( not ( = ?auto_3809 ?auto_3814 ) ) ( not ( = ?auto_3813 ?auto_3814 ) ) ( OBJ-AT ?auto_3810 ?auto_3814 ) ( IN-TRUCK ?auto_3817 ?auto_3815 ) ( TRUCK-AT ?auto_3815 ?auto_3816 ) ( IN-CITY ?auto_3816 ?auto_3812 ) ( not ( = ?auto_3809 ?auto_3816 ) ) ( not ( = ?auto_3813 ?auto_3816 ) ) ( not ( = ?auto_3814 ?auto_3816 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3817 ?auto_3811 ?auto_3809 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3819 - OBJ
      ?auto_3820 - OBJ
      ?auto_3818 - LOCATION
    )
    :vars
    (
      ?auto_3823 - LOCATION
      ?auto_3821 - CITY
      ?auto_3822 - OBJ
      ?auto_3824 - LOCATION
      ?auto_3825 - TRUCK
      ?auto_3826 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3823 ?auto_3821 ) ( IN-CITY ?auto_3818 ?auto_3821 ) ( not ( = ?auto_3818 ?auto_3823 ) ) ( not ( = ?auto_3820 ?auto_3819 ) ) ( OBJ-AT ?auto_3819 ?auto_3823 ) ( not ( = ?auto_3820 ?auto_3822 ) ) ( not ( = ?auto_3819 ?auto_3822 ) ) ( IN-CITY ?auto_3824 ?auto_3821 ) ( not ( = ?auto_3818 ?auto_3824 ) ) ( not ( = ?auto_3823 ?auto_3824 ) ) ( OBJ-AT ?auto_3822 ?auto_3824 ) ( IN-TRUCK ?auto_3820 ?auto_3825 ) ( TRUCK-AT ?auto_3825 ?auto_3826 ) ( IN-CITY ?auto_3826 ?auto_3821 ) ( not ( = ?auto_3818 ?auto_3826 ) ) ( not ( = ?auto_3823 ?auto_3826 ) ) ( not ( = ?auto_3824 ?auto_3826 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3820 ?auto_3819 ?auto_3818 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_3828 - OBJ
      ?auto_3829 - OBJ
      ?auto_3827 - LOCATION
    )
    :vars
    (
      ?auto_3831 - LOCATION
      ?auto_3830 - CITY
      ?auto_3835 - OBJ
      ?auto_3832 - LOCATION
      ?auto_3833 - TRUCK
      ?auto_3834 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3831 ?auto_3830 ) ( IN-CITY ?auto_3827 ?auto_3830 ) ( not ( = ?auto_3827 ?auto_3831 ) ) ( not ( = ?auto_3835 ?auto_3828 ) ) ( OBJ-AT ?auto_3828 ?auto_3831 ) ( not ( = ?auto_3835 ?auto_3829 ) ) ( not ( = ?auto_3828 ?auto_3829 ) ) ( IN-CITY ?auto_3832 ?auto_3830 ) ( not ( = ?auto_3827 ?auto_3832 ) ) ( not ( = ?auto_3831 ?auto_3832 ) ) ( OBJ-AT ?auto_3829 ?auto_3832 ) ( IN-TRUCK ?auto_3835 ?auto_3833 ) ( TRUCK-AT ?auto_3833 ?auto_3834 ) ( IN-CITY ?auto_3834 ?auto_3830 ) ( not ( = ?auto_3827 ?auto_3834 ) ) ( not ( = ?auto_3831 ?auto_3834 ) ) ( not ( = ?auto_3832 ?auto_3834 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3835 ?auto_3828 ?auto_3827 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3857 - OBJ
      ?auto_3858 - OBJ
      ?auto_3859 - OBJ
      ?auto_3856 - LOCATION
    )
    :vars
    (
      ?auto_3861 - LOCATION
      ?auto_3860 - CITY
      ?auto_3862 - LOCATION
      ?auto_3863 - TRUCK
      ?auto_3864 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3861 ?auto_3860 ) ( IN-CITY ?auto_3856 ?auto_3860 ) ( not ( = ?auto_3856 ?auto_3861 ) ) ( not ( = ?auto_3857 ?auto_3859 ) ) ( OBJ-AT ?auto_3859 ?auto_3861 ) ( not ( = ?auto_3857 ?auto_3858 ) ) ( not ( = ?auto_3859 ?auto_3858 ) ) ( IN-CITY ?auto_3862 ?auto_3860 ) ( not ( = ?auto_3856 ?auto_3862 ) ) ( not ( = ?auto_3861 ?auto_3862 ) ) ( OBJ-AT ?auto_3858 ?auto_3862 ) ( IN-TRUCK ?auto_3857 ?auto_3863 ) ( TRUCK-AT ?auto_3863 ?auto_3864 ) ( IN-CITY ?auto_3864 ?auto_3860 ) ( not ( = ?auto_3856 ?auto_3864 ) ) ( not ( = ?auto_3861 ?auto_3864 ) ) ( not ( = ?auto_3862 ?auto_3864 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3857 ?auto_3859 ?auto_3856 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3876 - OBJ
      ?auto_3877 - OBJ
      ?auto_3878 - OBJ
      ?auto_3875 - LOCATION
    )
    :vars
    (
      ?auto_3880 - LOCATION
      ?auto_3879 - CITY
      ?auto_3881 - LOCATION
      ?auto_3882 - TRUCK
      ?auto_3883 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3880 ?auto_3879 ) ( IN-CITY ?auto_3875 ?auto_3879 ) ( not ( = ?auto_3875 ?auto_3880 ) ) ( not ( = ?auto_3876 ?auto_3877 ) ) ( OBJ-AT ?auto_3877 ?auto_3880 ) ( not ( = ?auto_3876 ?auto_3878 ) ) ( not ( = ?auto_3877 ?auto_3878 ) ) ( IN-CITY ?auto_3881 ?auto_3879 ) ( not ( = ?auto_3875 ?auto_3881 ) ) ( not ( = ?auto_3880 ?auto_3881 ) ) ( OBJ-AT ?auto_3878 ?auto_3881 ) ( IN-TRUCK ?auto_3876 ?auto_3882 ) ( TRUCK-AT ?auto_3882 ?auto_3883 ) ( IN-CITY ?auto_3883 ?auto_3879 ) ( not ( = ?auto_3875 ?auto_3883 ) ) ( not ( = ?auto_3880 ?auto_3883 ) ) ( not ( = ?auto_3881 ?auto_3883 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3876 ?auto_3877 ?auto_3875 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3895 - OBJ
      ?auto_3896 - OBJ
      ?auto_3897 - OBJ
      ?auto_3894 - LOCATION
    )
    :vars
    (
      ?auto_3899 - LOCATION
      ?auto_3898 - CITY
      ?auto_3900 - LOCATION
      ?auto_3901 - TRUCK
      ?auto_3902 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3899 ?auto_3898 ) ( IN-CITY ?auto_3894 ?auto_3898 ) ( not ( = ?auto_3894 ?auto_3899 ) ) ( not ( = ?auto_3896 ?auto_3897 ) ) ( OBJ-AT ?auto_3897 ?auto_3899 ) ( not ( = ?auto_3896 ?auto_3895 ) ) ( not ( = ?auto_3897 ?auto_3895 ) ) ( IN-CITY ?auto_3900 ?auto_3898 ) ( not ( = ?auto_3894 ?auto_3900 ) ) ( not ( = ?auto_3899 ?auto_3900 ) ) ( OBJ-AT ?auto_3895 ?auto_3900 ) ( IN-TRUCK ?auto_3896 ?auto_3901 ) ( TRUCK-AT ?auto_3901 ?auto_3902 ) ( IN-CITY ?auto_3902 ?auto_3898 ) ( not ( = ?auto_3894 ?auto_3902 ) ) ( not ( = ?auto_3899 ?auto_3902 ) ) ( not ( = ?auto_3900 ?auto_3902 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3896 ?auto_3897 ?auto_3894 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3914 - OBJ
      ?auto_3915 - OBJ
      ?auto_3916 - OBJ
      ?auto_3913 - LOCATION
    )
    :vars
    (
      ?auto_3918 - LOCATION
      ?auto_3917 - CITY
      ?auto_3919 - LOCATION
      ?auto_3920 - TRUCK
      ?auto_3921 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3918 ?auto_3917 ) ( IN-CITY ?auto_3913 ?auto_3917 ) ( not ( = ?auto_3913 ?auto_3918 ) ) ( not ( = ?auto_3916 ?auto_3915 ) ) ( OBJ-AT ?auto_3915 ?auto_3918 ) ( not ( = ?auto_3916 ?auto_3914 ) ) ( not ( = ?auto_3915 ?auto_3914 ) ) ( IN-CITY ?auto_3919 ?auto_3917 ) ( not ( = ?auto_3913 ?auto_3919 ) ) ( not ( = ?auto_3918 ?auto_3919 ) ) ( OBJ-AT ?auto_3914 ?auto_3919 ) ( IN-TRUCK ?auto_3916 ?auto_3920 ) ( TRUCK-AT ?auto_3920 ?auto_3921 ) ( IN-CITY ?auto_3921 ?auto_3917 ) ( not ( = ?auto_3913 ?auto_3921 ) ) ( not ( = ?auto_3918 ?auto_3921 ) ) ( not ( = ?auto_3919 ?auto_3921 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3916 ?auto_3915 ?auto_3913 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3953 - OBJ
      ?auto_3954 - OBJ
      ?auto_3955 - OBJ
      ?auto_3952 - LOCATION
    )
    :vars
    (
      ?auto_3957 - LOCATION
      ?auto_3956 - CITY
      ?auto_3958 - LOCATION
      ?auto_3959 - TRUCK
      ?auto_3960 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3957 ?auto_3956 ) ( IN-CITY ?auto_3952 ?auto_3956 ) ( not ( = ?auto_3952 ?auto_3957 ) ) ( not ( = ?auto_3954 ?auto_3953 ) ) ( OBJ-AT ?auto_3953 ?auto_3957 ) ( not ( = ?auto_3954 ?auto_3955 ) ) ( not ( = ?auto_3953 ?auto_3955 ) ) ( IN-CITY ?auto_3958 ?auto_3956 ) ( not ( = ?auto_3952 ?auto_3958 ) ) ( not ( = ?auto_3957 ?auto_3958 ) ) ( OBJ-AT ?auto_3955 ?auto_3958 ) ( IN-TRUCK ?auto_3954 ?auto_3959 ) ( TRUCK-AT ?auto_3959 ?auto_3960 ) ( IN-CITY ?auto_3960 ?auto_3956 ) ( not ( = ?auto_3952 ?auto_3960 ) ) ( not ( = ?auto_3957 ?auto_3960 ) ) ( not ( = ?auto_3958 ?auto_3960 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3954 ?auto_3953 ?auto_3952 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_3972 - OBJ
      ?auto_3973 - OBJ
      ?auto_3974 - OBJ
      ?auto_3971 - LOCATION
    )
    :vars
    (
      ?auto_3976 - LOCATION
      ?auto_3975 - CITY
      ?auto_3977 - LOCATION
      ?auto_3978 - TRUCK
      ?auto_3979 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_3976 ?auto_3975 ) ( IN-CITY ?auto_3971 ?auto_3975 ) ( not ( = ?auto_3971 ?auto_3976 ) ) ( not ( = ?auto_3974 ?auto_3972 ) ) ( OBJ-AT ?auto_3972 ?auto_3976 ) ( not ( = ?auto_3974 ?auto_3973 ) ) ( not ( = ?auto_3972 ?auto_3973 ) ) ( IN-CITY ?auto_3977 ?auto_3975 ) ( not ( = ?auto_3971 ?auto_3977 ) ) ( not ( = ?auto_3976 ?auto_3977 ) ) ( OBJ-AT ?auto_3973 ?auto_3977 ) ( IN-TRUCK ?auto_3974 ?auto_3978 ) ( TRUCK-AT ?auto_3978 ?auto_3979 ) ( IN-CITY ?auto_3979 ?auto_3975 ) ( not ( = ?auto_3971 ?auto_3979 ) ) ( not ( = ?auto_3976 ?auto_3979 ) ) ( not ( = ?auto_3977 ?auto_3979 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_3974 ?auto_3972 ?auto_3971 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4032 - OBJ
      ?auto_4031 - LOCATION
    )
    :vars
    (
      ?auto_4035 - LOCATION
      ?auto_4033 - CITY
      ?auto_4039 - OBJ
      ?auto_4034 - OBJ
      ?auto_4036 - LOCATION
      ?auto_4037 - TRUCK
      ?auto_4038 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4035 ?auto_4033 ) ( IN-CITY ?auto_4031 ?auto_4033 ) ( not ( = ?auto_4031 ?auto_4035 ) ) ( not ( = ?auto_4039 ?auto_4032 ) ) ( OBJ-AT ?auto_4032 ?auto_4035 ) ( not ( = ?auto_4039 ?auto_4034 ) ) ( not ( = ?auto_4032 ?auto_4034 ) ) ( IN-CITY ?auto_4036 ?auto_4033 ) ( not ( = ?auto_4031 ?auto_4036 ) ) ( not ( = ?auto_4035 ?auto_4036 ) ) ( OBJ-AT ?auto_4034 ?auto_4036 ) ( TRUCK-AT ?auto_4037 ?auto_4038 ) ( IN-CITY ?auto_4038 ?auto_4033 ) ( not ( = ?auto_4031 ?auto_4038 ) ) ( not ( = ?auto_4035 ?auto_4038 ) ) ( not ( = ?auto_4036 ?auto_4038 ) ) ( OBJ-AT ?auto_4039 ?auto_4038 ) )
    :subtasks
    ( ( !LOAD-TRUCK ?auto_4039 ?auto_4037 ?auto_4038 )
      ( DELIVER-2PKG ?auto_4039 ?auto_4032 ?auto_4031 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4041 - OBJ
      ?auto_4042 - OBJ
      ?auto_4040 - LOCATION
    )
    :vars
    (
      ?auto_4046 - LOCATION
      ?auto_4045 - CITY
      ?auto_4044 - OBJ
      ?auto_4048 - LOCATION
      ?auto_4047 - TRUCK
      ?auto_4043 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4046 ?auto_4045 ) ( IN-CITY ?auto_4040 ?auto_4045 ) ( not ( = ?auto_4040 ?auto_4046 ) ) ( not ( = ?auto_4041 ?auto_4042 ) ) ( OBJ-AT ?auto_4042 ?auto_4046 ) ( not ( = ?auto_4041 ?auto_4044 ) ) ( not ( = ?auto_4042 ?auto_4044 ) ) ( IN-CITY ?auto_4048 ?auto_4045 ) ( not ( = ?auto_4040 ?auto_4048 ) ) ( not ( = ?auto_4046 ?auto_4048 ) ) ( OBJ-AT ?auto_4044 ?auto_4048 ) ( TRUCK-AT ?auto_4047 ?auto_4043 ) ( IN-CITY ?auto_4043 ?auto_4045 ) ( not ( = ?auto_4040 ?auto_4043 ) ) ( not ( = ?auto_4046 ?auto_4043 ) ) ( not ( = ?auto_4048 ?auto_4043 ) ) ( OBJ-AT ?auto_4041 ?auto_4043 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4042 ?auto_4040 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4050 - OBJ
      ?auto_4051 - OBJ
      ?auto_4049 - LOCATION
    )
    :vars
    (
      ?auto_4055 - LOCATION
      ?auto_4052 - CITY
      ?auto_4057 - OBJ
      ?auto_4053 - LOCATION
      ?auto_4054 - TRUCK
      ?auto_4056 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4055 ?auto_4052 ) ( IN-CITY ?auto_4049 ?auto_4052 ) ( not ( = ?auto_4049 ?auto_4055 ) ) ( not ( = ?auto_4057 ?auto_4051 ) ) ( OBJ-AT ?auto_4051 ?auto_4055 ) ( not ( = ?auto_4057 ?auto_4050 ) ) ( not ( = ?auto_4051 ?auto_4050 ) ) ( IN-CITY ?auto_4053 ?auto_4052 ) ( not ( = ?auto_4049 ?auto_4053 ) ) ( not ( = ?auto_4055 ?auto_4053 ) ) ( OBJ-AT ?auto_4050 ?auto_4053 ) ( TRUCK-AT ?auto_4054 ?auto_4056 ) ( IN-CITY ?auto_4056 ?auto_4052 ) ( not ( = ?auto_4049 ?auto_4056 ) ) ( not ( = ?auto_4055 ?auto_4056 ) ) ( not ( = ?auto_4053 ?auto_4056 ) ) ( OBJ-AT ?auto_4057 ?auto_4056 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4057 ?auto_4051 ?auto_4049 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4059 - OBJ
      ?auto_4060 - OBJ
      ?auto_4058 - LOCATION
    )
    :vars
    (
      ?auto_4065 - LOCATION
      ?auto_4062 - CITY
      ?auto_4061 - OBJ
      ?auto_4063 - LOCATION
      ?auto_4064 - TRUCK
      ?auto_4066 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4065 ?auto_4062 ) ( IN-CITY ?auto_4058 ?auto_4062 ) ( not ( = ?auto_4058 ?auto_4065 ) ) ( not ( = ?auto_4060 ?auto_4059 ) ) ( OBJ-AT ?auto_4059 ?auto_4065 ) ( not ( = ?auto_4060 ?auto_4061 ) ) ( not ( = ?auto_4059 ?auto_4061 ) ) ( IN-CITY ?auto_4063 ?auto_4062 ) ( not ( = ?auto_4058 ?auto_4063 ) ) ( not ( = ?auto_4065 ?auto_4063 ) ) ( OBJ-AT ?auto_4061 ?auto_4063 ) ( TRUCK-AT ?auto_4064 ?auto_4066 ) ( IN-CITY ?auto_4066 ?auto_4062 ) ( not ( = ?auto_4058 ?auto_4066 ) ) ( not ( = ?auto_4065 ?auto_4066 ) ) ( not ( = ?auto_4063 ?auto_4066 ) ) ( OBJ-AT ?auto_4060 ?auto_4066 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4060 ?auto_4059 ?auto_4058 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4068 - OBJ
      ?auto_4069 - OBJ
      ?auto_4067 - LOCATION
    )
    :vars
    (
      ?auto_4073 - LOCATION
      ?auto_4070 - CITY
      ?auto_4075 - OBJ
      ?auto_4071 - LOCATION
      ?auto_4072 - TRUCK
      ?auto_4074 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4073 ?auto_4070 ) ( IN-CITY ?auto_4067 ?auto_4070 ) ( not ( = ?auto_4067 ?auto_4073 ) ) ( not ( = ?auto_4075 ?auto_4068 ) ) ( OBJ-AT ?auto_4068 ?auto_4073 ) ( not ( = ?auto_4075 ?auto_4069 ) ) ( not ( = ?auto_4068 ?auto_4069 ) ) ( IN-CITY ?auto_4071 ?auto_4070 ) ( not ( = ?auto_4067 ?auto_4071 ) ) ( not ( = ?auto_4073 ?auto_4071 ) ) ( OBJ-AT ?auto_4069 ?auto_4071 ) ( TRUCK-AT ?auto_4072 ?auto_4074 ) ( IN-CITY ?auto_4074 ?auto_4070 ) ( not ( = ?auto_4067 ?auto_4074 ) ) ( not ( = ?auto_4073 ?auto_4074 ) ) ( not ( = ?auto_4071 ?auto_4074 ) ) ( OBJ-AT ?auto_4075 ?auto_4074 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4075 ?auto_4068 ?auto_4067 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4097 - OBJ
      ?auto_4098 - OBJ
      ?auto_4099 - OBJ
      ?auto_4096 - LOCATION
    )
    :vars
    (
      ?auto_4103 - LOCATION
      ?auto_4100 - CITY
      ?auto_4101 - LOCATION
      ?auto_4102 - TRUCK
      ?auto_4104 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4103 ?auto_4100 ) ( IN-CITY ?auto_4096 ?auto_4100 ) ( not ( = ?auto_4096 ?auto_4103 ) ) ( not ( = ?auto_4097 ?auto_4099 ) ) ( OBJ-AT ?auto_4099 ?auto_4103 ) ( not ( = ?auto_4097 ?auto_4098 ) ) ( not ( = ?auto_4099 ?auto_4098 ) ) ( IN-CITY ?auto_4101 ?auto_4100 ) ( not ( = ?auto_4096 ?auto_4101 ) ) ( not ( = ?auto_4103 ?auto_4101 ) ) ( OBJ-AT ?auto_4098 ?auto_4101 ) ( TRUCK-AT ?auto_4102 ?auto_4104 ) ( IN-CITY ?auto_4104 ?auto_4100 ) ( not ( = ?auto_4096 ?auto_4104 ) ) ( not ( = ?auto_4103 ?auto_4104 ) ) ( not ( = ?auto_4101 ?auto_4104 ) ) ( OBJ-AT ?auto_4097 ?auto_4104 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4097 ?auto_4099 ?auto_4096 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4116 - OBJ
      ?auto_4117 - OBJ
      ?auto_4118 - OBJ
      ?auto_4115 - LOCATION
    )
    :vars
    (
      ?auto_4122 - LOCATION
      ?auto_4119 - CITY
      ?auto_4120 - LOCATION
      ?auto_4121 - TRUCK
      ?auto_4123 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4122 ?auto_4119 ) ( IN-CITY ?auto_4115 ?auto_4119 ) ( not ( = ?auto_4115 ?auto_4122 ) ) ( not ( = ?auto_4116 ?auto_4117 ) ) ( OBJ-AT ?auto_4117 ?auto_4122 ) ( not ( = ?auto_4116 ?auto_4118 ) ) ( not ( = ?auto_4117 ?auto_4118 ) ) ( IN-CITY ?auto_4120 ?auto_4119 ) ( not ( = ?auto_4115 ?auto_4120 ) ) ( not ( = ?auto_4122 ?auto_4120 ) ) ( OBJ-AT ?auto_4118 ?auto_4120 ) ( TRUCK-AT ?auto_4121 ?auto_4123 ) ( IN-CITY ?auto_4123 ?auto_4119 ) ( not ( = ?auto_4115 ?auto_4123 ) ) ( not ( = ?auto_4122 ?auto_4123 ) ) ( not ( = ?auto_4120 ?auto_4123 ) ) ( OBJ-AT ?auto_4116 ?auto_4123 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4116 ?auto_4117 ?auto_4115 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4135 - OBJ
      ?auto_4136 - OBJ
      ?auto_4137 - OBJ
      ?auto_4134 - LOCATION
    )
    :vars
    (
      ?auto_4141 - LOCATION
      ?auto_4138 - CITY
      ?auto_4139 - LOCATION
      ?auto_4140 - TRUCK
      ?auto_4142 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4141 ?auto_4138 ) ( IN-CITY ?auto_4134 ?auto_4138 ) ( not ( = ?auto_4134 ?auto_4141 ) ) ( not ( = ?auto_4136 ?auto_4137 ) ) ( OBJ-AT ?auto_4137 ?auto_4141 ) ( not ( = ?auto_4136 ?auto_4135 ) ) ( not ( = ?auto_4137 ?auto_4135 ) ) ( IN-CITY ?auto_4139 ?auto_4138 ) ( not ( = ?auto_4134 ?auto_4139 ) ) ( not ( = ?auto_4141 ?auto_4139 ) ) ( OBJ-AT ?auto_4135 ?auto_4139 ) ( TRUCK-AT ?auto_4140 ?auto_4142 ) ( IN-CITY ?auto_4142 ?auto_4138 ) ( not ( = ?auto_4134 ?auto_4142 ) ) ( not ( = ?auto_4141 ?auto_4142 ) ) ( not ( = ?auto_4139 ?auto_4142 ) ) ( OBJ-AT ?auto_4136 ?auto_4142 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4136 ?auto_4137 ?auto_4134 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4154 - OBJ
      ?auto_4155 - OBJ
      ?auto_4156 - OBJ
      ?auto_4153 - LOCATION
    )
    :vars
    (
      ?auto_4160 - LOCATION
      ?auto_4157 - CITY
      ?auto_4158 - LOCATION
      ?auto_4159 - TRUCK
      ?auto_4161 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4160 ?auto_4157 ) ( IN-CITY ?auto_4153 ?auto_4157 ) ( not ( = ?auto_4153 ?auto_4160 ) ) ( not ( = ?auto_4156 ?auto_4155 ) ) ( OBJ-AT ?auto_4155 ?auto_4160 ) ( not ( = ?auto_4156 ?auto_4154 ) ) ( not ( = ?auto_4155 ?auto_4154 ) ) ( IN-CITY ?auto_4158 ?auto_4157 ) ( not ( = ?auto_4153 ?auto_4158 ) ) ( not ( = ?auto_4160 ?auto_4158 ) ) ( OBJ-AT ?auto_4154 ?auto_4158 ) ( TRUCK-AT ?auto_4159 ?auto_4161 ) ( IN-CITY ?auto_4161 ?auto_4157 ) ( not ( = ?auto_4153 ?auto_4161 ) ) ( not ( = ?auto_4160 ?auto_4161 ) ) ( not ( = ?auto_4158 ?auto_4161 ) ) ( OBJ-AT ?auto_4156 ?auto_4161 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4156 ?auto_4155 ?auto_4153 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4193 - OBJ
      ?auto_4194 - OBJ
      ?auto_4195 - OBJ
      ?auto_4192 - LOCATION
    )
    :vars
    (
      ?auto_4199 - LOCATION
      ?auto_4196 - CITY
      ?auto_4197 - LOCATION
      ?auto_4198 - TRUCK
      ?auto_4200 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4199 ?auto_4196 ) ( IN-CITY ?auto_4192 ?auto_4196 ) ( not ( = ?auto_4192 ?auto_4199 ) ) ( not ( = ?auto_4194 ?auto_4193 ) ) ( OBJ-AT ?auto_4193 ?auto_4199 ) ( not ( = ?auto_4194 ?auto_4195 ) ) ( not ( = ?auto_4193 ?auto_4195 ) ) ( IN-CITY ?auto_4197 ?auto_4196 ) ( not ( = ?auto_4192 ?auto_4197 ) ) ( not ( = ?auto_4199 ?auto_4197 ) ) ( OBJ-AT ?auto_4195 ?auto_4197 ) ( TRUCK-AT ?auto_4198 ?auto_4200 ) ( IN-CITY ?auto_4200 ?auto_4196 ) ( not ( = ?auto_4192 ?auto_4200 ) ) ( not ( = ?auto_4199 ?auto_4200 ) ) ( not ( = ?auto_4197 ?auto_4200 ) ) ( OBJ-AT ?auto_4194 ?auto_4200 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4194 ?auto_4193 ?auto_4192 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4212 - OBJ
      ?auto_4213 - OBJ
      ?auto_4214 - OBJ
      ?auto_4211 - LOCATION
    )
    :vars
    (
      ?auto_4218 - LOCATION
      ?auto_4215 - CITY
      ?auto_4216 - LOCATION
      ?auto_4217 - TRUCK
      ?auto_4219 - LOCATION
    )
    :precondition
    ( and ( IN-CITY ?auto_4218 ?auto_4215 ) ( IN-CITY ?auto_4211 ?auto_4215 ) ( not ( = ?auto_4211 ?auto_4218 ) ) ( not ( = ?auto_4214 ?auto_4212 ) ) ( OBJ-AT ?auto_4212 ?auto_4218 ) ( not ( = ?auto_4214 ?auto_4213 ) ) ( not ( = ?auto_4212 ?auto_4213 ) ) ( IN-CITY ?auto_4216 ?auto_4215 ) ( not ( = ?auto_4211 ?auto_4216 ) ) ( not ( = ?auto_4218 ?auto_4216 ) ) ( OBJ-AT ?auto_4213 ?auto_4216 ) ( TRUCK-AT ?auto_4217 ?auto_4219 ) ( IN-CITY ?auto_4219 ?auto_4215 ) ( not ( = ?auto_4211 ?auto_4219 ) ) ( not ( = ?auto_4218 ?auto_4219 ) ) ( not ( = ?auto_4216 ?auto_4219 ) ) ( OBJ-AT ?auto_4214 ?auto_4219 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4214 ?auto_4212 ?auto_4211 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_4272 - OBJ
      ?auto_4271 - LOCATION
    )
    :vars
    (
      ?auto_4277 - LOCATION
      ?auto_4274 - CITY
      ?auto_4279 - OBJ
      ?auto_4273 - OBJ
      ?auto_4275 - LOCATION
      ?auto_4278 - LOCATION
      ?auto_4276 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4277 ?auto_4274 ) ( IN-CITY ?auto_4271 ?auto_4274 ) ( not ( = ?auto_4271 ?auto_4277 ) ) ( not ( = ?auto_4279 ?auto_4272 ) ) ( OBJ-AT ?auto_4272 ?auto_4277 ) ( not ( = ?auto_4279 ?auto_4273 ) ) ( not ( = ?auto_4272 ?auto_4273 ) ) ( IN-CITY ?auto_4275 ?auto_4274 ) ( not ( = ?auto_4271 ?auto_4275 ) ) ( not ( = ?auto_4277 ?auto_4275 ) ) ( OBJ-AT ?auto_4273 ?auto_4275 ) ( IN-CITY ?auto_4278 ?auto_4274 ) ( not ( = ?auto_4271 ?auto_4278 ) ) ( not ( = ?auto_4277 ?auto_4278 ) ) ( not ( = ?auto_4275 ?auto_4278 ) ) ( OBJ-AT ?auto_4279 ?auto_4278 ) ( TRUCK-AT ?auto_4276 ?auto_4271 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_4276 ?auto_4271 ?auto_4278 ?auto_4274 )
      ( DELIVER-2PKG ?auto_4279 ?auto_4272 ?auto_4271 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4281 - OBJ
      ?auto_4282 - OBJ
      ?auto_4280 - LOCATION
    )
    :vars
    (
      ?auto_4283 - LOCATION
      ?auto_4287 - CITY
      ?auto_4285 - OBJ
      ?auto_4288 - LOCATION
      ?auto_4286 - LOCATION
      ?auto_4284 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4283 ?auto_4287 ) ( IN-CITY ?auto_4280 ?auto_4287 ) ( not ( = ?auto_4280 ?auto_4283 ) ) ( not ( = ?auto_4281 ?auto_4282 ) ) ( OBJ-AT ?auto_4282 ?auto_4283 ) ( not ( = ?auto_4281 ?auto_4285 ) ) ( not ( = ?auto_4282 ?auto_4285 ) ) ( IN-CITY ?auto_4288 ?auto_4287 ) ( not ( = ?auto_4280 ?auto_4288 ) ) ( not ( = ?auto_4283 ?auto_4288 ) ) ( OBJ-AT ?auto_4285 ?auto_4288 ) ( IN-CITY ?auto_4286 ?auto_4287 ) ( not ( = ?auto_4280 ?auto_4286 ) ) ( not ( = ?auto_4283 ?auto_4286 ) ) ( not ( = ?auto_4288 ?auto_4286 ) ) ( OBJ-AT ?auto_4281 ?auto_4286 ) ( TRUCK-AT ?auto_4284 ?auto_4280 ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_4282 ?auto_4280 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4290 - OBJ
      ?auto_4291 - OBJ
      ?auto_4289 - LOCATION
    )
    :vars
    (
      ?auto_4294 - LOCATION
      ?auto_4295 - CITY
      ?auto_4297 - OBJ
      ?auto_4292 - LOCATION
      ?auto_4293 - LOCATION
      ?auto_4296 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4294 ?auto_4295 ) ( IN-CITY ?auto_4289 ?auto_4295 ) ( not ( = ?auto_4289 ?auto_4294 ) ) ( not ( = ?auto_4297 ?auto_4291 ) ) ( OBJ-AT ?auto_4291 ?auto_4294 ) ( not ( = ?auto_4297 ?auto_4290 ) ) ( not ( = ?auto_4291 ?auto_4290 ) ) ( IN-CITY ?auto_4292 ?auto_4295 ) ( not ( = ?auto_4289 ?auto_4292 ) ) ( not ( = ?auto_4294 ?auto_4292 ) ) ( OBJ-AT ?auto_4290 ?auto_4292 ) ( IN-CITY ?auto_4293 ?auto_4295 ) ( not ( = ?auto_4289 ?auto_4293 ) ) ( not ( = ?auto_4294 ?auto_4293 ) ) ( not ( = ?auto_4292 ?auto_4293 ) ) ( OBJ-AT ?auto_4297 ?auto_4293 ) ( TRUCK-AT ?auto_4296 ?auto_4289 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4297 ?auto_4291 ?auto_4289 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4299 - OBJ
      ?auto_4300 - OBJ
      ?auto_4298 - LOCATION
    )
    :vars
    (
      ?auto_4303 - LOCATION
      ?auto_4305 - CITY
      ?auto_4304 - OBJ
      ?auto_4301 - LOCATION
      ?auto_4302 - LOCATION
      ?auto_4306 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4303 ?auto_4305 ) ( IN-CITY ?auto_4298 ?auto_4305 ) ( not ( = ?auto_4298 ?auto_4303 ) ) ( not ( = ?auto_4300 ?auto_4299 ) ) ( OBJ-AT ?auto_4299 ?auto_4303 ) ( not ( = ?auto_4300 ?auto_4304 ) ) ( not ( = ?auto_4299 ?auto_4304 ) ) ( IN-CITY ?auto_4301 ?auto_4305 ) ( not ( = ?auto_4298 ?auto_4301 ) ) ( not ( = ?auto_4303 ?auto_4301 ) ) ( OBJ-AT ?auto_4304 ?auto_4301 ) ( IN-CITY ?auto_4302 ?auto_4305 ) ( not ( = ?auto_4298 ?auto_4302 ) ) ( not ( = ?auto_4303 ?auto_4302 ) ) ( not ( = ?auto_4301 ?auto_4302 ) ) ( OBJ-AT ?auto_4300 ?auto_4302 ) ( TRUCK-AT ?auto_4306 ?auto_4298 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4300 ?auto_4299 ?auto_4298 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_4308 - OBJ
      ?auto_4309 - OBJ
      ?auto_4307 - LOCATION
    )
    :vars
    (
      ?auto_4312 - LOCATION
      ?auto_4313 - CITY
      ?auto_4315 - OBJ
      ?auto_4310 - LOCATION
      ?auto_4311 - LOCATION
      ?auto_4314 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4312 ?auto_4313 ) ( IN-CITY ?auto_4307 ?auto_4313 ) ( not ( = ?auto_4307 ?auto_4312 ) ) ( not ( = ?auto_4315 ?auto_4308 ) ) ( OBJ-AT ?auto_4308 ?auto_4312 ) ( not ( = ?auto_4315 ?auto_4309 ) ) ( not ( = ?auto_4308 ?auto_4309 ) ) ( IN-CITY ?auto_4310 ?auto_4313 ) ( not ( = ?auto_4307 ?auto_4310 ) ) ( not ( = ?auto_4312 ?auto_4310 ) ) ( OBJ-AT ?auto_4309 ?auto_4310 ) ( IN-CITY ?auto_4311 ?auto_4313 ) ( not ( = ?auto_4307 ?auto_4311 ) ) ( not ( = ?auto_4312 ?auto_4311 ) ) ( not ( = ?auto_4310 ?auto_4311 ) ) ( OBJ-AT ?auto_4315 ?auto_4311 ) ( TRUCK-AT ?auto_4314 ?auto_4307 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4315 ?auto_4308 ?auto_4307 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4337 - OBJ
      ?auto_4338 - OBJ
      ?auto_4339 - OBJ
      ?auto_4336 - LOCATION
    )
    :vars
    (
      ?auto_4342 - LOCATION
      ?auto_4343 - CITY
      ?auto_4340 - LOCATION
      ?auto_4341 - LOCATION
      ?auto_4344 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4342 ?auto_4343 ) ( IN-CITY ?auto_4336 ?auto_4343 ) ( not ( = ?auto_4336 ?auto_4342 ) ) ( not ( = ?auto_4337 ?auto_4339 ) ) ( OBJ-AT ?auto_4339 ?auto_4342 ) ( not ( = ?auto_4337 ?auto_4338 ) ) ( not ( = ?auto_4339 ?auto_4338 ) ) ( IN-CITY ?auto_4340 ?auto_4343 ) ( not ( = ?auto_4336 ?auto_4340 ) ) ( not ( = ?auto_4342 ?auto_4340 ) ) ( OBJ-AT ?auto_4338 ?auto_4340 ) ( IN-CITY ?auto_4341 ?auto_4343 ) ( not ( = ?auto_4336 ?auto_4341 ) ) ( not ( = ?auto_4342 ?auto_4341 ) ) ( not ( = ?auto_4340 ?auto_4341 ) ) ( OBJ-AT ?auto_4337 ?auto_4341 ) ( TRUCK-AT ?auto_4344 ?auto_4336 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4337 ?auto_4339 ?auto_4336 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4356 - OBJ
      ?auto_4357 - OBJ
      ?auto_4358 - OBJ
      ?auto_4355 - LOCATION
    )
    :vars
    (
      ?auto_4361 - LOCATION
      ?auto_4362 - CITY
      ?auto_4359 - LOCATION
      ?auto_4360 - LOCATION
      ?auto_4363 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4361 ?auto_4362 ) ( IN-CITY ?auto_4355 ?auto_4362 ) ( not ( = ?auto_4355 ?auto_4361 ) ) ( not ( = ?auto_4356 ?auto_4357 ) ) ( OBJ-AT ?auto_4357 ?auto_4361 ) ( not ( = ?auto_4356 ?auto_4358 ) ) ( not ( = ?auto_4357 ?auto_4358 ) ) ( IN-CITY ?auto_4359 ?auto_4362 ) ( not ( = ?auto_4355 ?auto_4359 ) ) ( not ( = ?auto_4361 ?auto_4359 ) ) ( OBJ-AT ?auto_4358 ?auto_4359 ) ( IN-CITY ?auto_4360 ?auto_4362 ) ( not ( = ?auto_4355 ?auto_4360 ) ) ( not ( = ?auto_4361 ?auto_4360 ) ) ( not ( = ?auto_4359 ?auto_4360 ) ) ( OBJ-AT ?auto_4356 ?auto_4360 ) ( TRUCK-AT ?auto_4363 ?auto_4355 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4356 ?auto_4357 ?auto_4355 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4375 - OBJ
      ?auto_4376 - OBJ
      ?auto_4377 - OBJ
      ?auto_4374 - LOCATION
    )
    :vars
    (
      ?auto_4380 - LOCATION
      ?auto_4381 - CITY
      ?auto_4378 - LOCATION
      ?auto_4379 - LOCATION
      ?auto_4382 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4380 ?auto_4381 ) ( IN-CITY ?auto_4374 ?auto_4381 ) ( not ( = ?auto_4374 ?auto_4380 ) ) ( not ( = ?auto_4376 ?auto_4377 ) ) ( OBJ-AT ?auto_4377 ?auto_4380 ) ( not ( = ?auto_4376 ?auto_4375 ) ) ( not ( = ?auto_4377 ?auto_4375 ) ) ( IN-CITY ?auto_4378 ?auto_4381 ) ( not ( = ?auto_4374 ?auto_4378 ) ) ( not ( = ?auto_4380 ?auto_4378 ) ) ( OBJ-AT ?auto_4375 ?auto_4378 ) ( IN-CITY ?auto_4379 ?auto_4381 ) ( not ( = ?auto_4374 ?auto_4379 ) ) ( not ( = ?auto_4380 ?auto_4379 ) ) ( not ( = ?auto_4378 ?auto_4379 ) ) ( OBJ-AT ?auto_4376 ?auto_4379 ) ( TRUCK-AT ?auto_4382 ?auto_4374 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4376 ?auto_4377 ?auto_4374 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4394 - OBJ
      ?auto_4395 - OBJ
      ?auto_4396 - OBJ
      ?auto_4393 - LOCATION
    )
    :vars
    (
      ?auto_4399 - LOCATION
      ?auto_4400 - CITY
      ?auto_4397 - LOCATION
      ?auto_4398 - LOCATION
      ?auto_4401 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4399 ?auto_4400 ) ( IN-CITY ?auto_4393 ?auto_4400 ) ( not ( = ?auto_4393 ?auto_4399 ) ) ( not ( = ?auto_4396 ?auto_4395 ) ) ( OBJ-AT ?auto_4395 ?auto_4399 ) ( not ( = ?auto_4396 ?auto_4394 ) ) ( not ( = ?auto_4395 ?auto_4394 ) ) ( IN-CITY ?auto_4397 ?auto_4400 ) ( not ( = ?auto_4393 ?auto_4397 ) ) ( not ( = ?auto_4399 ?auto_4397 ) ) ( OBJ-AT ?auto_4394 ?auto_4397 ) ( IN-CITY ?auto_4398 ?auto_4400 ) ( not ( = ?auto_4393 ?auto_4398 ) ) ( not ( = ?auto_4399 ?auto_4398 ) ) ( not ( = ?auto_4397 ?auto_4398 ) ) ( OBJ-AT ?auto_4396 ?auto_4398 ) ( TRUCK-AT ?auto_4401 ?auto_4393 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4396 ?auto_4395 ?auto_4393 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4433 - OBJ
      ?auto_4434 - OBJ
      ?auto_4435 - OBJ
      ?auto_4432 - LOCATION
    )
    :vars
    (
      ?auto_4438 - LOCATION
      ?auto_4439 - CITY
      ?auto_4436 - LOCATION
      ?auto_4437 - LOCATION
      ?auto_4440 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4438 ?auto_4439 ) ( IN-CITY ?auto_4432 ?auto_4439 ) ( not ( = ?auto_4432 ?auto_4438 ) ) ( not ( = ?auto_4434 ?auto_4433 ) ) ( OBJ-AT ?auto_4433 ?auto_4438 ) ( not ( = ?auto_4434 ?auto_4435 ) ) ( not ( = ?auto_4433 ?auto_4435 ) ) ( IN-CITY ?auto_4436 ?auto_4439 ) ( not ( = ?auto_4432 ?auto_4436 ) ) ( not ( = ?auto_4438 ?auto_4436 ) ) ( OBJ-AT ?auto_4435 ?auto_4436 ) ( IN-CITY ?auto_4437 ?auto_4439 ) ( not ( = ?auto_4432 ?auto_4437 ) ) ( not ( = ?auto_4438 ?auto_4437 ) ) ( not ( = ?auto_4436 ?auto_4437 ) ) ( OBJ-AT ?auto_4434 ?auto_4437 ) ( TRUCK-AT ?auto_4440 ?auto_4432 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4434 ?auto_4433 ?auto_4432 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_4452 - OBJ
      ?auto_4453 - OBJ
      ?auto_4454 - OBJ
      ?auto_4451 - LOCATION
    )
    :vars
    (
      ?auto_4457 - LOCATION
      ?auto_4458 - CITY
      ?auto_4455 - LOCATION
      ?auto_4456 - LOCATION
      ?auto_4459 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_4457 ?auto_4458 ) ( IN-CITY ?auto_4451 ?auto_4458 ) ( not ( = ?auto_4451 ?auto_4457 ) ) ( not ( = ?auto_4454 ?auto_4452 ) ) ( OBJ-AT ?auto_4452 ?auto_4457 ) ( not ( = ?auto_4454 ?auto_4453 ) ) ( not ( = ?auto_4452 ?auto_4453 ) ) ( IN-CITY ?auto_4455 ?auto_4458 ) ( not ( = ?auto_4451 ?auto_4455 ) ) ( not ( = ?auto_4457 ?auto_4455 ) ) ( OBJ-AT ?auto_4453 ?auto_4455 ) ( IN-CITY ?auto_4456 ?auto_4458 ) ( not ( = ?auto_4451 ?auto_4456 ) ) ( not ( = ?auto_4457 ?auto_4456 ) ) ( not ( = ?auto_4455 ?auto_4456 ) ) ( OBJ-AT ?auto_4454 ?auto_4456 ) ( TRUCK-AT ?auto_4459 ?auto_4451 ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_4454 ?auto_4452 ?auto_4451 ) )
  )

)

