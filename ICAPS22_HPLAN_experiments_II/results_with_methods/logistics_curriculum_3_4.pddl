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
      ?auto_1420 - OBJ
      ?auto_1419 - LOCATION
    )
    :vars
    (
      ?auto_1422 - LOCATION
      ?auto_1423 - CITY
      ?auto_1421 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1422 ?auto_1423 ) ( IN-CITY ?auto_1419 ?auto_1423 ) ( not ( = ?auto_1419 ?auto_1422 ) ) ( OBJ-AT ?auto_1420 ?auto_1422 ) ( TRUCK-AT ?auto_1421 ?auto_1419 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1421 ?auto_1419 ?auto_1422 ?auto_1423 )
      ( !LOAD-TRUCK ?auto_1420 ?auto_1421 ?auto_1422 )
      ( !DRIVE-TRUCK ?auto_1421 ?auto_1422 ?auto_1419 ?auto_1423 )
      ( !UNLOAD-TRUCK ?auto_1420 ?auto_1421 ?auto_1419 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1427 - OBJ
      ?auto_1426 - LOCATION
    )
    :vars
    (
      ?auto_1429 - LOCATION
      ?auto_1430 - CITY
      ?auto_1428 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1429 ?auto_1430 ) ( IN-CITY ?auto_1426 ?auto_1430 ) ( not ( = ?auto_1426 ?auto_1429 ) ) ( OBJ-AT ?auto_1427 ?auto_1429 ) ( TRUCK-AT ?auto_1428 ?auto_1426 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1428 ?auto_1426 ?auto_1429 ?auto_1430 )
      ( !LOAD-TRUCK ?auto_1427 ?auto_1428 ?auto_1429 )
      ( !DRIVE-TRUCK ?auto_1428 ?auto_1429 ?auto_1426 ?auto_1430 )
      ( !UNLOAD-TRUCK ?auto_1427 ?auto_1428 ?auto_1426 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1441 - OBJ
      ?auto_1442 - OBJ
      ?auto_1440 - LOCATION
    )
    :vars
    (
      ?auto_1444 - LOCATION
      ?auto_1443 - CITY
      ?auto_1445 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1444 ?auto_1443 ) ( IN-CITY ?auto_1440 ?auto_1443 ) ( not ( = ?auto_1440 ?auto_1444 ) ) ( OBJ-AT ?auto_1442 ?auto_1444 ) ( OBJ-AT ?auto_1441 ?auto_1444 ) ( TRUCK-AT ?auto_1445 ?auto_1440 ) ( not ( = ?auto_1441 ?auto_1442 ) ) )
    :subtasks
    ( ( DELIVER-1PKG ?auto_1441 ?auto_1440 )
      ( DELIVER-1PKG ?auto_1442 ?auto_1440 ) )
  )

  ( :method DELIVER-2PKG
    :parameters
    (
      ?auto_1447 - OBJ
      ?auto_1448 - OBJ
      ?auto_1446 - LOCATION
    )
    :vars
    (
      ?auto_1449 - LOCATION
      ?auto_1451 - CITY
      ?auto_1450 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1449 ?auto_1451 ) ( IN-CITY ?auto_1446 ?auto_1451 ) ( not ( = ?auto_1446 ?auto_1449 ) ) ( OBJ-AT ?auto_1447 ?auto_1449 ) ( OBJ-AT ?auto_1448 ?auto_1449 ) ( TRUCK-AT ?auto_1450 ?auto_1446 ) ( not ( = ?auto_1448 ?auto_1447 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1448 ?auto_1447 ?auto_1446 ) )
  )

  ( :method DELIVER-1PKG
    :parameters
    (
      ?auto_1462 - OBJ
      ?auto_1461 - LOCATION
    )
    :vars
    (
      ?auto_1464 - LOCATION
      ?auto_1465 - CITY
      ?auto_1463 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1464 ?auto_1465 ) ( IN-CITY ?auto_1461 ?auto_1465 ) ( not ( = ?auto_1461 ?auto_1464 ) ) ( OBJ-AT ?auto_1462 ?auto_1464 ) ( TRUCK-AT ?auto_1463 ?auto_1461 ) )
    :subtasks
    ( ( !DRIVE-TRUCK ?auto_1463 ?auto_1461 ?auto_1464 ?auto_1465 )
      ( !LOAD-TRUCK ?auto_1462 ?auto_1463 ?auto_1464 )
      ( !DRIVE-TRUCK ?auto_1463 ?auto_1464 ?auto_1461 ?auto_1465 )
      ( !UNLOAD-TRUCK ?auto_1462 ?auto_1463 ?auto_1461 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1552 - OBJ
      ?auto_1553 - OBJ
      ?auto_1554 - OBJ
      ?auto_1551 - LOCATION
    )
    :vars
    (
      ?auto_1555 - LOCATION
      ?auto_1557 - CITY
      ?auto_1558 - LOCATION
      ?auto_1556 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1555 ?auto_1557 ) ( IN-CITY ?auto_1551 ?auto_1557 ) ( not ( = ?auto_1551 ?auto_1555 ) ) ( OBJ-AT ?auto_1554 ?auto_1555 ) ( IN-CITY ?auto_1558 ?auto_1557 ) ( not ( = ?auto_1551 ?auto_1558 ) ) ( OBJ-AT ?auto_1553 ?auto_1558 ) ( OBJ-AT ?auto_1552 ?auto_1558 ) ( TRUCK-AT ?auto_1556 ?auto_1551 ) ( not ( = ?auto_1552 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1554 ) ) ( not ( = ?auto_1553 ?auto_1554 ) ) ( not ( = ?auto_1555 ?auto_1558 ) ) )
    :subtasks
    ( ( DELIVER-2PKG ?auto_1553 ?auto_1552 ?auto_1551 )
      ( DELIVER-1PKG ?auto_1554 ?auto_1551 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1569 - OBJ
      ?auto_1570 - OBJ
      ?auto_1571 - OBJ
      ?auto_1568 - LOCATION
    )
    :vars
    (
      ?auto_1575 - LOCATION
      ?auto_1572 - CITY
      ?auto_1574 - LOCATION
      ?auto_1573 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1575 ?auto_1572 ) ( IN-CITY ?auto_1568 ?auto_1572 ) ( not ( = ?auto_1568 ?auto_1575 ) ) ( OBJ-AT ?auto_1570 ?auto_1575 ) ( IN-CITY ?auto_1574 ?auto_1572 ) ( not ( = ?auto_1568 ?auto_1574 ) ) ( OBJ-AT ?auto_1571 ?auto_1574 ) ( OBJ-AT ?auto_1569 ?auto_1574 ) ( TRUCK-AT ?auto_1573 ?auto_1568 ) ( not ( = ?auto_1569 ?auto_1571 ) ) ( not ( = ?auto_1569 ?auto_1570 ) ) ( not ( = ?auto_1571 ?auto_1570 ) ) ( not ( = ?auto_1575 ?auto_1574 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1569 ?auto_1571 ?auto_1570 ?auto_1568 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1586 - OBJ
      ?auto_1587 - OBJ
      ?auto_1588 - OBJ
      ?auto_1585 - LOCATION
    )
    :vars
    (
      ?auto_1592 - LOCATION
      ?auto_1591 - CITY
      ?auto_1589 - LOCATION
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1592 ?auto_1591 ) ( IN-CITY ?auto_1585 ?auto_1591 ) ( not ( = ?auto_1585 ?auto_1592 ) ) ( OBJ-AT ?auto_1588 ?auto_1592 ) ( IN-CITY ?auto_1589 ?auto_1591 ) ( not ( = ?auto_1585 ?auto_1589 ) ) ( OBJ-AT ?auto_1586 ?auto_1589 ) ( OBJ-AT ?auto_1587 ?auto_1589 ) ( TRUCK-AT ?auto_1590 ?auto_1585 ) ( not ( = ?auto_1587 ?auto_1586 ) ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( not ( = ?auto_1586 ?auto_1588 ) ) ( not ( = ?auto_1592 ?auto_1589 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1587 ?auto_1588 ?auto_1586 ?auto_1585 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1603 - OBJ
      ?auto_1604 - OBJ
      ?auto_1605 - OBJ
      ?auto_1602 - LOCATION
    )
    :vars
    (
      ?auto_1609 - LOCATION
      ?auto_1608 - CITY
      ?auto_1606 - LOCATION
      ?auto_1607 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1609 ?auto_1608 ) ( IN-CITY ?auto_1602 ?auto_1608 ) ( not ( = ?auto_1602 ?auto_1609 ) ) ( OBJ-AT ?auto_1604 ?auto_1609 ) ( IN-CITY ?auto_1606 ?auto_1608 ) ( not ( = ?auto_1602 ?auto_1606 ) ) ( OBJ-AT ?auto_1603 ?auto_1606 ) ( OBJ-AT ?auto_1605 ?auto_1606 ) ( TRUCK-AT ?auto_1607 ?auto_1602 ) ( not ( = ?auto_1605 ?auto_1603 ) ) ( not ( = ?auto_1605 ?auto_1604 ) ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( not ( = ?auto_1609 ?auto_1606 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1605 ?auto_1604 ?auto_1603 ?auto_1602 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1638 - OBJ
      ?auto_1639 - OBJ
      ?auto_1640 - OBJ
      ?auto_1637 - LOCATION
    )
    :vars
    (
      ?auto_1644 - LOCATION
      ?auto_1643 - CITY
      ?auto_1641 - LOCATION
      ?auto_1642 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1644 ?auto_1643 ) ( IN-CITY ?auto_1637 ?auto_1643 ) ( not ( = ?auto_1637 ?auto_1644 ) ) ( OBJ-AT ?auto_1638 ?auto_1644 ) ( IN-CITY ?auto_1641 ?auto_1643 ) ( not ( = ?auto_1637 ?auto_1641 ) ) ( OBJ-AT ?auto_1640 ?auto_1641 ) ( OBJ-AT ?auto_1639 ?auto_1641 ) ( TRUCK-AT ?auto_1642 ?auto_1637 ) ( not ( = ?auto_1639 ?auto_1640 ) ) ( not ( = ?auto_1639 ?auto_1638 ) ) ( not ( = ?auto_1640 ?auto_1638 ) ) ( not ( = ?auto_1644 ?auto_1641 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1639 ?auto_1638 ?auto_1640 ?auto_1637 ) )
  )

  ( :method DELIVER-3PKG
    :parameters
    (
      ?auto_1655 - OBJ
      ?auto_1656 - OBJ
      ?auto_1657 - OBJ
      ?auto_1654 - LOCATION
    )
    :vars
    (
      ?auto_1661 - LOCATION
      ?auto_1660 - CITY
      ?auto_1658 - LOCATION
      ?auto_1659 - TRUCK
    )
    :precondition
    ( and ( IN-CITY ?auto_1661 ?auto_1660 ) ( IN-CITY ?auto_1654 ?auto_1660 ) ( not ( = ?auto_1654 ?auto_1661 ) ) ( OBJ-AT ?auto_1655 ?auto_1661 ) ( IN-CITY ?auto_1658 ?auto_1660 ) ( not ( = ?auto_1654 ?auto_1658 ) ) ( OBJ-AT ?auto_1656 ?auto_1658 ) ( OBJ-AT ?auto_1657 ?auto_1658 ) ( TRUCK-AT ?auto_1659 ?auto_1654 ) ( not ( = ?auto_1657 ?auto_1656 ) ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( not ( = ?auto_1656 ?auto_1655 ) ) ( not ( = ?auto_1661 ?auto_1658 ) ) )
    :subtasks
    ( ( DELIVER-3PKG ?auto_1657 ?auto_1655 ?auto_1656 ?auto_1654 ) )
  )

)

