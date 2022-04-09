( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1502 - SURFACE
      ?auto_1503 - SURFACE
    )
    :vars
    (
      ?auto_1504 - HOIST
      ?auto_1505 - PLACE
      ?auto_1507 - PLACE
      ?auto_1508 - HOIST
      ?auto_1509 - SURFACE
      ?auto_1506 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1504 ?auto_1505 ) ( SURFACE-AT ?auto_1502 ?auto_1505 ) ( CLEAR ?auto_1502 ) ( IS-CRATE ?auto_1503 ) ( AVAILABLE ?auto_1504 ) ( not ( = ?auto_1507 ?auto_1505 ) ) ( HOIST-AT ?auto_1508 ?auto_1507 ) ( AVAILABLE ?auto_1508 ) ( SURFACE-AT ?auto_1503 ?auto_1507 ) ( ON ?auto_1503 ?auto_1509 ) ( CLEAR ?auto_1503 ) ( TRUCK-AT ?auto_1506 ?auto_1505 ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( not ( = ?auto_1502 ?auto_1509 ) ) ( not ( = ?auto_1503 ?auto_1509 ) ) ( not ( = ?auto_1504 ?auto_1508 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1506 ?auto_1505 ?auto_1507 )
      ( !LIFT ?auto_1508 ?auto_1503 ?auto_1509 ?auto_1507 )
      ( !LOAD ?auto_1508 ?auto_1503 ?auto_1506 ?auto_1507 )
      ( !DRIVE ?auto_1506 ?auto_1507 ?auto_1505 )
      ( !UNLOAD ?auto_1504 ?auto_1503 ?auto_1506 ?auto_1505 )
      ( !DROP ?auto_1504 ?auto_1503 ?auto_1502 ?auto_1505 )
      ( MAKE-1CRATE-VERIFY ?auto_1502 ?auto_1503 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1512 - SURFACE
      ?auto_1513 - SURFACE
    )
    :vars
    (
      ?auto_1514 - HOIST
      ?auto_1515 - PLACE
      ?auto_1517 - PLACE
      ?auto_1518 - HOIST
      ?auto_1519 - SURFACE
      ?auto_1516 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1514 ?auto_1515 ) ( SURFACE-AT ?auto_1512 ?auto_1515 ) ( CLEAR ?auto_1512 ) ( IS-CRATE ?auto_1513 ) ( AVAILABLE ?auto_1514 ) ( not ( = ?auto_1517 ?auto_1515 ) ) ( HOIST-AT ?auto_1518 ?auto_1517 ) ( AVAILABLE ?auto_1518 ) ( SURFACE-AT ?auto_1513 ?auto_1517 ) ( ON ?auto_1513 ?auto_1519 ) ( CLEAR ?auto_1513 ) ( TRUCK-AT ?auto_1516 ?auto_1515 ) ( not ( = ?auto_1512 ?auto_1513 ) ) ( not ( = ?auto_1512 ?auto_1519 ) ) ( not ( = ?auto_1513 ?auto_1519 ) ) ( not ( = ?auto_1514 ?auto_1518 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1516 ?auto_1515 ?auto_1517 )
      ( !LIFT ?auto_1518 ?auto_1513 ?auto_1519 ?auto_1517 )
      ( !LOAD ?auto_1518 ?auto_1513 ?auto_1516 ?auto_1517 )
      ( !DRIVE ?auto_1516 ?auto_1517 ?auto_1515 )
      ( !UNLOAD ?auto_1514 ?auto_1513 ?auto_1516 ?auto_1515 )
      ( !DROP ?auto_1514 ?auto_1513 ?auto_1512 ?auto_1515 )
      ( MAKE-1CRATE-VERIFY ?auto_1512 ?auto_1513 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1523 - SURFACE
      ?auto_1524 - SURFACE
      ?auto_1525 - SURFACE
    )
    :vars
    (
      ?auto_1530 - HOIST
      ?auto_1528 - PLACE
      ?auto_1531 - PLACE
      ?auto_1526 - HOIST
      ?auto_1527 - SURFACE
      ?auto_1533 - PLACE
      ?auto_1534 - HOIST
      ?auto_1532 - SURFACE
      ?auto_1529 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1530 ?auto_1528 ) ( IS-CRATE ?auto_1525 ) ( not ( = ?auto_1531 ?auto_1528 ) ) ( HOIST-AT ?auto_1526 ?auto_1531 ) ( AVAILABLE ?auto_1526 ) ( SURFACE-AT ?auto_1525 ?auto_1531 ) ( ON ?auto_1525 ?auto_1527 ) ( CLEAR ?auto_1525 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( not ( = ?auto_1524 ?auto_1527 ) ) ( not ( = ?auto_1525 ?auto_1527 ) ) ( not ( = ?auto_1530 ?auto_1526 ) ) ( SURFACE-AT ?auto_1523 ?auto_1528 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1524 ) ( AVAILABLE ?auto_1530 ) ( not ( = ?auto_1533 ?auto_1528 ) ) ( HOIST-AT ?auto_1534 ?auto_1533 ) ( AVAILABLE ?auto_1534 ) ( SURFACE-AT ?auto_1524 ?auto_1533 ) ( ON ?auto_1524 ?auto_1532 ) ( CLEAR ?auto_1524 ) ( TRUCK-AT ?auto_1529 ?auto_1528 ) ( not ( = ?auto_1523 ?auto_1524 ) ) ( not ( = ?auto_1523 ?auto_1532 ) ) ( not ( = ?auto_1524 ?auto_1532 ) ) ( not ( = ?auto_1530 ?auto_1534 ) ) ( not ( = ?auto_1523 ?auto_1525 ) ) ( not ( = ?auto_1523 ?auto_1527 ) ) ( not ( = ?auto_1525 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1533 ) ) ( not ( = ?auto_1526 ?auto_1534 ) ) ( not ( = ?auto_1527 ?auto_1532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1523 ?auto_1524 )
      ( MAKE-1CRATE ?auto_1524 ?auto_1525 )
      ( MAKE-2CRATE-VERIFY ?auto_1523 ?auto_1524 ?auto_1525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1537 - SURFACE
      ?auto_1538 - SURFACE
    )
    :vars
    (
      ?auto_1539 - HOIST
      ?auto_1540 - PLACE
      ?auto_1542 - PLACE
      ?auto_1543 - HOIST
      ?auto_1544 - SURFACE
      ?auto_1541 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1539 ?auto_1540 ) ( SURFACE-AT ?auto_1537 ?auto_1540 ) ( CLEAR ?auto_1537 ) ( IS-CRATE ?auto_1538 ) ( AVAILABLE ?auto_1539 ) ( not ( = ?auto_1542 ?auto_1540 ) ) ( HOIST-AT ?auto_1543 ?auto_1542 ) ( AVAILABLE ?auto_1543 ) ( SURFACE-AT ?auto_1538 ?auto_1542 ) ( ON ?auto_1538 ?auto_1544 ) ( CLEAR ?auto_1538 ) ( TRUCK-AT ?auto_1541 ?auto_1540 ) ( not ( = ?auto_1537 ?auto_1538 ) ) ( not ( = ?auto_1537 ?auto_1544 ) ) ( not ( = ?auto_1538 ?auto_1544 ) ) ( not ( = ?auto_1539 ?auto_1543 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1541 ?auto_1540 ?auto_1542 )
      ( !LIFT ?auto_1543 ?auto_1538 ?auto_1544 ?auto_1542 )
      ( !LOAD ?auto_1543 ?auto_1538 ?auto_1541 ?auto_1542 )
      ( !DRIVE ?auto_1541 ?auto_1542 ?auto_1540 )
      ( !UNLOAD ?auto_1539 ?auto_1538 ?auto_1541 ?auto_1540 )
      ( !DROP ?auto_1539 ?auto_1538 ?auto_1537 ?auto_1540 )
      ( MAKE-1CRATE-VERIFY ?auto_1537 ?auto_1538 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1549 - SURFACE
      ?auto_1550 - SURFACE
      ?auto_1551 - SURFACE
      ?auto_1552 - SURFACE
    )
    :vars
    (
      ?auto_1555 - HOIST
      ?auto_1558 - PLACE
      ?auto_1556 - PLACE
      ?auto_1553 - HOIST
      ?auto_1554 - SURFACE
      ?auto_1563 - PLACE
      ?auto_1560 - HOIST
      ?auto_1562 - SURFACE
      ?auto_1559 - PLACE
      ?auto_1561 - HOIST
      ?auto_1564 - SURFACE
      ?auto_1557 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1555 ?auto_1558 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( HOIST-AT ?auto_1553 ?auto_1556 ) ( AVAILABLE ?auto_1553 ) ( SURFACE-AT ?auto_1552 ?auto_1556 ) ( ON ?auto_1552 ?auto_1554 ) ( CLEAR ?auto_1552 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( not ( = ?auto_1551 ?auto_1554 ) ) ( not ( = ?auto_1552 ?auto_1554 ) ) ( not ( = ?auto_1555 ?auto_1553 ) ) ( IS-CRATE ?auto_1551 ) ( not ( = ?auto_1563 ?auto_1558 ) ) ( HOIST-AT ?auto_1560 ?auto_1563 ) ( AVAILABLE ?auto_1560 ) ( SURFACE-AT ?auto_1551 ?auto_1563 ) ( ON ?auto_1551 ?auto_1562 ) ( CLEAR ?auto_1551 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1562 ) ) ( not ( = ?auto_1551 ?auto_1562 ) ) ( not ( = ?auto_1555 ?auto_1560 ) ) ( SURFACE-AT ?auto_1549 ?auto_1558 ) ( CLEAR ?auto_1549 ) ( IS-CRATE ?auto_1550 ) ( AVAILABLE ?auto_1555 ) ( not ( = ?auto_1559 ?auto_1558 ) ) ( HOIST-AT ?auto_1561 ?auto_1559 ) ( AVAILABLE ?auto_1561 ) ( SURFACE-AT ?auto_1550 ?auto_1559 ) ( ON ?auto_1550 ?auto_1564 ) ( CLEAR ?auto_1550 ) ( TRUCK-AT ?auto_1557 ?auto_1558 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1564 ) ) ( not ( = ?auto_1550 ?auto_1564 ) ) ( not ( = ?auto_1555 ?auto_1561 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1562 ) ) ( not ( = ?auto_1551 ?auto_1564 ) ) ( not ( = ?auto_1563 ?auto_1559 ) ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( not ( = ?auto_1562 ?auto_1564 ) ) ( not ( = ?auto_1549 ?auto_1552 ) ) ( not ( = ?auto_1549 ?auto_1554 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( not ( = ?auto_1550 ?auto_1554 ) ) ( not ( = ?auto_1552 ?auto_1562 ) ) ( not ( = ?auto_1552 ?auto_1564 ) ) ( not ( = ?auto_1556 ?auto_1563 ) ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1553 ?auto_1560 ) ) ( not ( = ?auto_1553 ?auto_1561 ) ) ( not ( = ?auto_1554 ?auto_1562 ) ) ( not ( = ?auto_1554 ?auto_1564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549 ?auto_1550 ?auto_1551 )
      ( MAKE-1CRATE ?auto_1551 ?auto_1552 )
      ( MAKE-3CRATE-VERIFY ?auto_1549 ?auto_1550 ?auto_1551 ?auto_1552 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1567 - SURFACE
      ?auto_1568 - SURFACE
    )
    :vars
    (
      ?auto_1569 - HOIST
      ?auto_1570 - PLACE
      ?auto_1572 - PLACE
      ?auto_1573 - HOIST
      ?auto_1574 - SURFACE
      ?auto_1571 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1569 ?auto_1570 ) ( SURFACE-AT ?auto_1567 ?auto_1570 ) ( CLEAR ?auto_1567 ) ( IS-CRATE ?auto_1568 ) ( AVAILABLE ?auto_1569 ) ( not ( = ?auto_1572 ?auto_1570 ) ) ( HOIST-AT ?auto_1573 ?auto_1572 ) ( AVAILABLE ?auto_1573 ) ( SURFACE-AT ?auto_1568 ?auto_1572 ) ( ON ?auto_1568 ?auto_1574 ) ( CLEAR ?auto_1568 ) ( TRUCK-AT ?auto_1571 ?auto_1570 ) ( not ( = ?auto_1567 ?auto_1568 ) ) ( not ( = ?auto_1567 ?auto_1574 ) ) ( not ( = ?auto_1568 ?auto_1574 ) ) ( not ( = ?auto_1569 ?auto_1573 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1571 ?auto_1570 ?auto_1572 )
      ( !LIFT ?auto_1573 ?auto_1568 ?auto_1574 ?auto_1572 )
      ( !LOAD ?auto_1573 ?auto_1568 ?auto_1571 ?auto_1572 )
      ( !DRIVE ?auto_1571 ?auto_1572 ?auto_1570 )
      ( !UNLOAD ?auto_1569 ?auto_1568 ?auto_1571 ?auto_1570 )
      ( !DROP ?auto_1569 ?auto_1568 ?auto_1567 ?auto_1570 )
      ( MAKE-1CRATE-VERIFY ?auto_1567 ?auto_1568 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1580 - SURFACE
      ?auto_1581 - SURFACE
      ?auto_1582 - SURFACE
      ?auto_1583 - SURFACE
      ?auto_1584 - SURFACE
    )
    :vars
    (
      ?auto_1589 - HOIST
      ?auto_1590 - PLACE
      ?auto_1588 - PLACE
      ?auto_1587 - HOIST
      ?auto_1585 - SURFACE
      ?auto_1593 - PLACE
      ?auto_1594 - HOIST
      ?auto_1596 - SURFACE
      ?auto_1591 - PLACE
      ?auto_1598 - HOIST
      ?auto_1592 - SURFACE
      ?auto_1599 - PLACE
      ?auto_1597 - HOIST
      ?auto_1595 - SURFACE
      ?auto_1586 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1589 ?auto_1590 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1588 ?auto_1590 ) ) ( HOIST-AT ?auto_1587 ?auto_1588 ) ( AVAILABLE ?auto_1587 ) ( SURFACE-AT ?auto_1584 ?auto_1588 ) ( ON ?auto_1584 ?auto_1585 ) ( CLEAR ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1583 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1589 ?auto_1587 ) ) ( IS-CRATE ?auto_1583 ) ( not ( = ?auto_1593 ?auto_1590 ) ) ( HOIST-AT ?auto_1594 ?auto_1593 ) ( AVAILABLE ?auto_1594 ) ( SURFACE-AT ?auto_1583 ?auto_1593 ) ( ON ?auto_1583 ?auto_1596 ) ( CLEAR ?auto_1583 ) ( not ( = ?auto_1582 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1596 ) ) ( not ( = ?auto_1583 ?auto_1596 ) ) ( not ( = ?auto_1589 ?auto_1594 ) ) ( IS-CRATE ?auto_1582 ) ( not ( = ?auto_1591 ?auto_1590 ) ) ( HOIST-AT ?auto_1598 ?auto_1591 ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1582 ?auto_1591 ) ( ON ?auto_1582 ?auto_1592 ) ( CLEAR ?auto_1582 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( not ( = ?auto_1581 ?auto_1592 ) ) ( not ( = ?auto_1582 ?auto_1592 ) ) ( not ( = ?auto_1589 ?auto_1598 ) ) ( SURFACE-AT ?auto_1580 ?auto_1590 ) ( CLEAR ?auto_1580 ) ( IS-CRATE ?auto_1581 ) ( AVAILABLE ?auto_1589 ) ( not ( = ?auto_1599 ?auto_1590 ) ) ( HOIST-AT ?auto_1597 ?auto_1599 ) ( AVAILABLE ?auto_1597 ) ( SURFACE-AT ?auto_1581 ?auto_1599 ) ( ON ?auto_1581 ?auto_1595 ) ( CLEAR ?auto_1581 ) ( TRUCK-AT ?auto_1586 ?auto_1590 ) ( not ( = ?auto_1580 ?auto_1581 ) ) ( not ( = ?auto_1580 ?auto_1595 ) ) ( not ( = ?auto_1581 ?auto_1595 ) ) ( not ( = ?auto_1589 ?auto_1597 ) ) ( not ( = ?auto_1580 ?auto_1582 ) ) ( not ( = ?auto_1580 ?auto_1592 ) ) ( not ( = ?auto_1582 ?auto_1595 ) ) ( not ( = ?auto_1591 ?auto_1599 ) ) ( not ( = ?auto_1598 ?auto_1597 ) ) ( not ( = ?auto_1592 ?auto_1595 ) ) ( not ( = ?auto_1580 ?auto_1583 ) ) ( not ( = ?auto_1580 ?auto_1596 ) ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( not ( = ?auto_1581 ?auto_1596 ) ) ( not ( = ?auto_1583 ?auto_1592 ) ) ( not ( = ?auto_1583 ?auto_1595 ) ) ( not ( = ?auto_1593 ?auto_1591 ) ) ( not ( = ?auto_1593 ?auto_1599 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) ( not ( = ?auto_1594 ?auto_1597 ) ) ( not ( = ?auto_1596 ?auto_1592 ) ) ( not ( = ?auto_1596 ?auto_1595 ) ) ( not ( = ?auto_1580 ?auto_1584 ) ) ( not ( = ?auto_1580 ?auto_1585 ) ) ( not ( = ?auto_1581 ?auto_1584 ) ) ( not ( = ?auto_1581 ?auto_1585 ) ) ( not ( = ?auto_1582 ?auto_1584 ) ) ( not ( = ?auto_1582 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1596 ) ) ( not ( = ?auto_1584 ?auto_1592 ) ) ( not ( = ?auto_1584 ?auto_1595 ) ) ( not ( = ?auto_1588 ?auto_1593 ) ) ( not ( = ?auto_1588 ?auto_1591 ) ) ( not ( = ?auto_1588 ?auto_1599 ) ) ( not ( = ?auto_1587 ?auto_1594 ) ) ( not ( = ?auto_1587 ?auto_1598 ) ) ( not ( = ?auto_1587 ?auto_1597 ) ) ( not ( = ?auto_1585 ?auto_1596 ) ) ( not ( = ?auto_1585 ?auto_1592 ) ) ( not ( = ?auto_1585 ?auto_1595 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1580 ?auto_1581 ?auto_1582 ?auto_1583 )
      ( MAKE-1CRATE ?auto_1583 ?auto_1584 )
      ( MAKE-4CRATE-VERIFY ?auto_1580 ?auto_1581 ?auto_1582 ?auto_1583 ?auto_1584 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1602 - SURFACE
      ?auto_1603 - SURFACE
    )
    :vars
    (
      ?auto_1604 - HOIST
      ?auto_1605 - PLACE
      ?auto_1607 - PLACE
      ?auto_1608 - HOIST
      ?auto_1609 - SURFACE
      ?auto_1606 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1604 ?auto_1605 ) ( SURFACE-AT ?auto_1602 ?auto_1605 ) ( CLEAR ?auto_1602 ) ( IS-CRATE ?auto_1603 ) ( AVAILABLE ?auto_1604 ) ( not ( = ?auto_1607 ?auto_1605 ) ) ( HOIST-AT ?auto_1608 ?auto_1607 ) ( AVAILABLE ?auto_1608 ) ( SURFACE-AT ?auto_1603 ?auto_1607 ) ( ON ?auto_1603 ?auto_1609 ) ( CLEAR ?auto_1603 ) ( TRUCK-AT ?auto_1606 ?auto_1605 ) ( not ( = ?auto_1602 ?auto_1603 ) ) ( not ( = ?auto_1602 ?auto_1609 ) ) ( not ( = ?auto_1603 ?auto_1609 ) ) ( not ( = ?auto_1604 ?auto_1608 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1606 ?auto_1605 ?auto_1607 )
      ( !LIFT ?auto_1608 ?auto_1603 ?auto_1609 ?auto_1607 )
      ( !LOAD ?auto_1608 ?auto_1603 ?auto_1606 ?auto_1607 )
      ( !DRIVE ?auto_1606 ?auto_1607 ?auto_1605 )
      ( !UNLOAD ?auto_1604 ?auto_1603 ?auto_1606 ?auto_1605 )
      ( !DROP ?auto_1604 ?auto_1603 ?auto_1602 ?auto_1605 )
      ( MAKE-1CRATE-VERIFY ?auto_1602 ?auto_1603 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1616 - SURFACE
      ?auto_1617 - SURFACE
      ?auto_1618 - SURFACE
      ?auto_1619 - SURFACE
      ?auto_1620 - SURFACE
      ?auto_1621 - SURFACE
    )
    :vars
    (
      ?auto_1622 - HOIST
      ?auto_1623 - PLACE
      ?auto_1624 - PLACE
      ?auto_1627 - HOIST
      ?auto_1626 - SURFACE
      ?auto_1636 - PLACE
      ?auto_1629 - HOIST
      ?auto_1630 - SURFACE
      ?auto_1628 - PLACE
      ?auto_1637 - HOIST
      ?auto_1632 - SURFACE
      ?auto_1634 - SURFACE
      ?auto_1635 - PLACE
      ?auto_1633 - HOIST
      ?auto_1631 - SURFACE
      ?auto_1625 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1622 ?auto_1623 ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1624 ?auto_1623 ) ) ( HOIST-AT ?auto_1627 ?auto_1624 ) ( SURFACE-AT ?auto_1621 ?auto_1624 ) ( ON ?auto_1621 ?auto_1626 ) ( CLEAR ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1626 ) ) ( not ( = ?auto_1621 ?auto_1626 ) ) ( not ( = ?auto_1622 ?auto_1627 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1636 ?auto_1623 ) ) ( HOIST-AT ?auto_1629 ?auto_1636 ) ( AVAILABLE ?auto_1629 ) ( SURFACE-AT ?auto_1620 ?auto_1636 ) ( ON ?auto_1620 ?auto_1630 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1630 ) ) ( not ( = ?auto_1620 ?auto_1630 ) ) ( not ( = ?auto_1622 ?auto_1629 ) ) ( IS-CRATE ?auto_1619 ) ( not ( = ?auto_1628 ?auto_1623 ) ) ( HOIST-AT ?auto_1637 ?auto_1628 ) ( AVAILABLE ?auto_1637 ) ( SURFACE-AT ?auto_1619 ?auto_1628 ) ( ON ?auto_1619 ?auto_1632 ) ( CLEAR ?auto_1619 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1632 ) ) ( not ( = ?auto_1619 ?auto_1632 ) ) ( not ( = ?auto_1622 ?auto_1637 ) ) ( IS-CRATE ?auto_1618 ) ( AVAILABLE ?auto_1627 ) ( SURFACE-AT ?auto_1618 ?auto_1624 ) ( ON ?auto_1618 ?auto_1634 ) ( CLEAR ?auto_1618 ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( not ( = ?auto_1617 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1634 ) ) ( SURFACE-AT ?auto_1616 ?auto_1623 ) ( CLEAR ?auto_1616 ) ( IS-CRATE ?auto_1617 ) ( AVAILABLE ?auto_1622 ) ( not ( = ?auto_1635 ?auto_1623 ) ) ( HOIST-AT ?auto_1633 ?auto_1635 ) ( AVAILABLE ?auto_1633 ) ( SURFACE-AT ?auto_1617 ?auto_1635 ) ( ON ?auto_1617 ?auto_1631 ) ( CLEAR ?auto_1617 ) ( TRUCK-AT ?auto_1625 ?auto_1623 ) ( not ( = ?auto_1616 ?auto_1617 ) ) ( not ( = ?auto_1616 ?auto_1631 ) ) ( not ( = ?auto_1617 ?auto_1631 ) ) ( not ( = ?auto_1622 ?auto_1633 ) ) ( not ( = ?auto_1616 ?auto_1618 ) ) ( not ( = ?auto_1616 ?auto_1634 ) ) ( not ( = ?auto_1618 ?auto_1631 ) ) ( not ( = ?auto_1624 ?auto_1635 ) ) ( not ( = ?auto_1627 ?auto_1633 ) ) ( not ( = ?auto_1634 ?auto_1631 ) ) ( not ( = ?auto_1616 ?auto_1619 ) ) ( not ( = ?auto_1616 ?auto_1632 ) ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1617 ?auto_1632 ) ) ( not ( = ?auto_1619 ?auto_1634 ) ) ( not ( = ?auto_1619 ?auto_1631 ) ) ( not ( = ?auto_1628 ?auto_1624 ) ) ( not ( = ?auto_1628 ?auto_1635 ) ) ( not ( = ?auto_1637 ?auto_1627 ) ) ( not ( = ?auto_1637 ?auto_1633 ) ) ( not ( = ?auto_1632 ?auto_1634 ) ) ( not ( = ?auto_1632 ?auto_1631 ) ) ( not ( = ?auto_1616 ?auto_1620 ) ) ( not ( = ?auto_1616 ?auto_1630 ) ) ( not ( = ?auto_1617 ?auto_1620 ) ) ( not ( = ?auto_1617 ?auto_1630 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1630 ) ) ( not ( = ?auto_1620 ?auto_1632 ) ) ( not ( = ?auto_1620 ?auto_1634 ) ) ( not ( = ?auto_1620 ?auto_1631 ) ) ( not ( = ?auto_1636 ?auto_1628 ) ) ( not ( = ?auto_1636 ?auto_1624 ) ) ( not ( = ?auto_1636 ?auto_1635 ) ) ( not ( = ?auto_1629 ?auto_1637 ) ) ( not ( = ?auto_1629 ?auto_1627 ) ) ( not ( = ?auto_1629 ?auto_1633 ) ) ( not ( = ?auto_1630 ?auto_1632 ) ) ( not ( = ?auto_1630 ?auto_1634 ) ) ( not ( = ?auto_1630 ?auto_1631 ) ) ( not ( = ?auto_1616 ?auto_1621 ) ) ( not ( = ?auto_1616 ?auto_1626 ) ) ( not ( = ?auto_1617 ?auto_1621 ) ) ( not ( = ?auto_1617 ?auto_1626 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1626 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1626 ) ) ( not ( = ?auto_1621 ?auto_1630 ) ) ( not ( = ?auto_1621 ?auto_1632 ) ) ( not ( = ?auto_1621 ?auto_1634 ) ) ( not ( = ?auto_1621 ?auto_1631 ) ) ( not ( = ?auto_1626 ?auto_1630 ) ) ( not ( = ?auto_1626 ?auto_1632 ) ) ( not ( = ?auto_1626 ?auto_1634 ) ) ( not ( = ?auto_1626 ?auto_1631 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 )
      ( MAKE-1CRATE ?auto_1620 ?auto_1621 )
      ( MAKE-5CRATE-VERIFY ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ) )
  )

)

