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
      ?auto_1398 - OBJ
      ?auto_1397 - LOCATION
    )
    :vars
    (
      ?auto_1400 - LOCATION
      ?auto_1401 - CITY
      ?auto_1399 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1400 ?auto_1401 ) ( IN-CITY ?auto_1397 ?auto_1401 ) ( not ( = ?auto_1397 ?auto_1400 ) ) ( OBJ-AT ?auto_1398 ?auto_1400 ) ( TRUCK-AT ?auto_1399 ?auto_1397 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1399 ?auto_1397 ?auto_1400 ?auto_1401 )
      ( !LOAD-TRUCK ?auto_1398 ?auto_1399 ?auto_1400 )
      ( !DRIVE-TRUCK ?auto_1399 ?auto_1400 ?auto_1397 ?auto_1401 )
      ( !UNLOAD-TRUCK ?auto_1398 ?auto_1399 ?auto_1397 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1405 - OBJ
      ?auto_1404 - LOCATION
    )
    :vars
    (
      ?auto_1407 - LOCATION
      ?auto_1408 - CITY
      ?auto_1406 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1407 ?auto_1408 ) ( IN-CITY ?auto_1404 ?auto_1408 ) ( not ( = ?auto_1404 ?auto_1407 ) ) ( OBJ-AT ?auto_1405 ?auto_1407 ) ( TRUCK-AT ?auto_1406 ?auto_1404 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1406 ?auto_1404 ?auto_1407 ?auto_1408 )
      ( !LOAD-TRUCK ?auto_1405 ?auto_1406 ?auto_1407 )
      ( !DRIVE-TRUCK ?auto_1406 ?auto_1407 ?auto_1404 ?auto_1408 )
      ( !UNLOAD-TRUCK ?auto_1405 ?auto_1406 ?auto_1404 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1419 - OBJ
      ?auto_1420 - OBJ
      ?auto_1418 - LOCATION
    )
    :vars
    (
      ?auto_1423 - LOCATION
      ?auto_1422 - CITY
      ?auto_1424 - LOCATION
      ?auto_1421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1423 ?auto_1422 ) ( IN-CITY ?auto_1418 ?auto_1422 ) ( not ( = ?auto_1418 ?auto_1423 ) ) ( OBJ-AT ?auto_1420 ?auto_1423 ) ( IN-CITY ?auto_1424 ?auto_1422 ) ( not ( = ?auto_1418 ?auto_1424 ) ) ( OBJ-AT ?auto_1419 ?auto_1424 ) ( TRUCK-AT ?auto_1421 ?auto_1418 ) ( not ( = ?auto_1419 ?auto_1420 ) ) ( not ( = ?auto_1423 ?auto_1424 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1419 ?auto_1418 )
      ( DELIVER-1PKG ?auto_1420 ?auto_1418 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1426 - OBJ
      ?auto_1427 - OBJ
      ?auto_1425 - LOCATION
    )
    :vars
    (
      ?auto_1431 - LOCATION
      ?auto_1428 - CITY
      ?auto_1429 - LOCATION
      ?auto_1430 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1431 ?auto_1428 ) ( IN-CITY ?auto_1425 ?auto_1428 ) ( not ( = ?auto_1425 ?auto_1431 ) ) ( OBJ-AT ?auto_1426 ?auto_1431 ) ( IN-CITY ?auto_1429 ?auto_1428 ) ( not ( = ?auto_1425 ?auto_1429 ) ) ( OBJ-AT ?auto_1427 ?auto_1429 ) ( TRUCK-AT ?auto_1430 ?auto_1425 ) ( not ( = ?auto_1427 ?auto_1426 ) ) ( not ( = ?auto_1431 ?auto_1429 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1427 ?auto_1426 ?auto_1425 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1443 - OBJ
      ?auto_1442 - LOCATION
    )
    :vars
    (
      ?auto_1445 - LOCATION
      ?auto_1446 - CITY
      ?auto_1444 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1445 ?auto_1446 ) ( IN-CITY ?auto_1442 ?auto_1446 ) ( not ( = ?auto_1442 ?auto_1445 ) ) ( OBJ-AT ?auto_1443 ?auto_1445 ) ( TRUCK-AT ?auto_1444 ?auto_1442 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1444 ?auto_1442 ?auto_1445 ?auto_1446 )
      ( !LOAD-TRUCK ?auto_1443 ?auto_1444 ?auto_1445 )
      ( !DRIVE-TRUCK ?auto_1444 ?auto_1445 ?auto_1442 ?auto_1446 )
      ( !UNLOAD-TRUCK ?auto_1443 ?auto_1444 ?auto_1442 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1534 - OBJ
      ?auto_1535 - OBJ
      ?auto_1536 - OBJ
      ?auto_1533 - LOCATION
    )
    :vars
    (
      ?auto_1537 - LOCATION
      ?auto_1538 - CITY
      ?auto_1540 - LOCATION
      ?auto_1541 - LOCATION
      ?auto_1539 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1537 ?auto_1538 ) ( IN-CITY ?auto_1533 ?auto_1538 ) ( not ( = ?auto_1533 ?auto_1537 ) ) ( OBJ-AT ?auto_1536 ?auto_1537 ) ( IN-CITY ?auto_1540 ?auto_1538 ) ( not ( = ?auto_1533 ?auto_1540 ) ) ( OBJ-AT ?auto_1535 ?auto_1540 ) ( IN-CITY ?auto_1541 ?auto_1538 ) ( not ( = ?auto_1533 ?auto_1541 ) ) ( OBJ-AT ?auto_1534 ?auto_1541 ) ( TRUCK-AT ?auto_1539 ?auto_1533 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( not ( = ?auto_1540 ?auto_1541 ) ) ( not ( = ?auto_1534 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( not ( = ?auto_1537 ?auto_1540 ) ) ( not ( = ?auto_1537 ?auto_1541 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1535 ?auto_1534 ?auto_1533 )
      ( DELIVER-1PKG ?auto_1536 ?auto_1533 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1553 - OBJ
      ?auto_1554 - OBJ
      ?auto_1555 - OBJ
      ?auto_1552 - LOCATION
    )
    :vars
    (
      ?auto_1560 - LOCATION
      ?auto_1559 - CITY
      ?auto_1557 - LOCATION
      ?auto_1556 - LOCATION
      ?auto_1558 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1560 ?auto_1559 ) ( IN-CITY ?auto_1552 ?auto_1559 ) ( not ( = ?auto_1552 ?auto_1560 ) ) ( OBJ-AT ?auto_1554 ?auto_1560 ) ( IN-CITY ?auto_1557 ?auto_1559 ) ( not ( = ?auto_1552 ?auto_1557 ) ) ( OBJ-AT ?auto_1555 ?auto_1557 ) ( IN-CITY ?auto_1556 ?auto_1559 ) ( not ( = ?auto_1552 ?auto_1556 ) ) ( OBJ-AT ?auto_1553 ?auto_1556 ) ( TRUCK-AT ?auto_1558 ?auto_1552 ) ( not ( = ?auto_1553 ?auto_1555 ) ) ( not ( = ?auto_1557 ?auto_1556 ) ) ( not ( = ?auto_1553 ?auto_1554 ) ) ( not ( = ?auto_1555 ?auto_1554 ) ) ( not ( = ?auto_1560 ?auto_1557 ) ) ( not ( = ?auto_1560 ?auto_1556 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1553 ?auto_1555 ?auto_1554 ?auto_1552 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1572 - OBJ
      ?auto_1573 - OBJ
      ?auto_1574 - OBJ
      ?auto_1571 - LOCATION
    )
    :vars
    (
      ?auto_1575 - LOCATION
      ?auto_1577 - CITY
      ?auto_1579 - LOCATION
      ?auto_1578 - LOCATION
      ?auto_1576 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1575 ?auto_1577 ) ( IN-CITY ?auto_1571 ?auto_1577 ) ( not ( = ?auto_1571 ?auto_1575 ) ) ( OBJ-AT ?auto_1574 ?auto_1575 ) ( IN-CITY ?auto_1579 ?auto_1577 ) ( not ( = ?auto_1571 ?auto_1579 ) ) ( OBJ-AT ?auto_1572 ?auto_1579 ) ( IN-CITY ?auto_1578 ?auto_1577 ) ( not ( = ?auto_1571 ?auto_1578 ) ) ( OBJ-AT ?auto_1573 ?auto_1578 ) ( TRUCK-AT ?auto_1576 ?auto_1571 ) ( not ( = ?auto_1573 ?auto_1572 ) ) ( not ( = ?auto_1579 ?auto_1578 ) ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( not ( = ?auto_1572 ?auto_1574 ) ) ( not ( = ?auto_1575 ?auto_1579 ) ) ( not ( = ?auto_1575 ?auto_1578 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1573 ?auto_1574 ?auto_1572 ?auto_1571 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1591 - OBJ
      ?auto_1592 - OBJ
      ?auto_1593 - OBJ
      ?auto_1590 - LOCATION
    )
    :vars
    (
      ?auto_1594 - LOCATION
      ?auto_1596 - CITY
      ?auto_1598 - LOCATION
      ?auto_1597 - LOCATION
      ?auto_1595 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1594 ?auto_1596 ) ( IN-CITY ?auto_1590 ?auto_1596 ) ( not ( = ?auto_1590 ?auto_1594 ) ) ( OBJ-AT ?auto_1592 ?auto_1594 ) ( IN-CITY ?auto_1598 ?auto_1596 ) ( not ( = ?auto_1590 ?auto_1598 ) ) ( OBJ-AT ?auto_1591 ?auto_1598 ) ( IN-CITY ?auto_1597 ?auto_1596 ) ( not ( = ?auto_1590 ?auto_1597 ) ) ( OBJ-AT ?auto_1593 ?auto_1597 ) ( TRUCK-AT ?auto_1595 ?auto_1590 ) ( not ( = ?auto_1593 ?auto_1591 ) ) ( not ( = ?auto_1598 ?auto_1597 ) ) ( not ( = ?auto_1593 ?auto_1592 ) ) ( not ( = ?auto_1591 ?auto_1592 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) ( not ( = ?auto_1594 ?auto_1597 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1593 ?auto_1592 ?auto_1591 ?auto_1590 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1630 - OBJ
      ?auto_1631 - OBJ
      ?auto_1632 - OBJ
      ?auto_1629 - LOCATION
    )
    :vars
    (
      ?auto_1633 - LOCATION
      ?auto_1635 - CITY
      ?auto_1637 - LOCATION
      ?auto_1636 - LOCATION
      ?auto_1634 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1633 ?auto_1635 ) ( IN-CITY ?auto_1629 ?auto_1635 ) ( not ( = ?auto_1629 ?auto_1633 ) ) ( OBJ-AT ?auto_1630 ?auto_1633 ) ( IN-CITY ?auto_1637 ?auto_1635 ) ( not ( = ?auto_1629 ?auto_1637 ) ) ( OBJ-AT ?auto_1632 ?auto_1637 ) ( IN-CITY ?auto_1636 ?auto_1635 ) ( not ( = ?auto_1629 ?auto_1636 ) ) ( OBJ-AT ?auto_1631 ?auto_1636 ) ( TRUCK-AT ?auto_1634 ?auto_1629 ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( not ( = ?auto_1637 ?auto_1636 ) ) ( not ( = ?auto_1631 ?auto_1630 ) ) ( not ( = ?auto_1632 ?auto_1630 ) ) ( not ( = ?auto_1633 ?auto_1637 ) ) ( not ( = ?auto_1633 ?auto_1636 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1631 ?auto_1630 ?auto_1632 ?auto_1629 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1649 - OBJ
      ?auto_1650 - OBJ
      ?auto_1651 - OBJ
      ?auto_1648 - LOCATION
    )
    :vars
    (
      ?auto_1652 - LOCATION
      ?auto_1654 - CITY
      ?auto_1656 - LOCATION
      ?auto_1655 - LOCATION
      ?auto_1653 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1652 ?auto_1654 ) ( IN-CITY ?auto_1648 ?auto_1654 ) ( not ( = ?auto_1648 ?auto_1652 ) ) ( OBJ-AT ?auto_1649 ?auto_1652 ) ( IN-CITY ?auto_1656 ?auto_1654 ) ( not ( = ?auto_1648 ?auto_1656 ) ) ( OBJ-AT ?auto_1650 ?auto_1656 ) ( IN-CITY ?auto_1655 ?auto_1654 ) ( not ( = ?auto_1648 ?auto_1655 ) ) ( OBJ-AT ?auto_1651 ?auto_1655 ) ( TRUCK-AT ?auto_1653 ?auto_1648 ) ( not ( = ?auto_1651 ?auto_1650 ) ) ( not ( = ?auto_1656 ?auto_1655 ) ) ( not ( = ?auto_1651 ?auto_1649 ) ) ( not ( = ?auto_1650 ?auto_1649 ) ) ( not ( = ?auto_1652 ?auto_1656 ) ) ( not ( = ?auto_1652 ?auto_1655 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1651 ?auto_1649 ?auto_1650 ?auto_1648 ) )
  )

)

