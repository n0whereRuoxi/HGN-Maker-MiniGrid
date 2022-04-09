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
      ?auto_1529 - HOIST
      ?auto_1526 - PLACE
      ?auto_1528 - PLACE
      ?auto_1530 - HOIST
      ?auto_1531 - SURFACE
      ?auto_1532 - SURFACE
      ?auto_1527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1529 ?auto_1526 ) ( IS-CRATE ?auto_1525 ) ( not ( = ?auto_1528 ?auto_1526 ) ) ( HOIST-AT ?auto_1530 ?auto_1528 ) ( SURFACE-AT ?auto_1525 ?auto_1528 ) ( ON ?auto_1525 ?auto_1531 ) ( CLEAR ?auto_1525 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( not ( = ?auto_1524 ?auto_1531 ) ) ( not ( = ?auto_1525 ?auto_1531 ) ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( SURFACE-AT ?auto_1523 ?auto_1526 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1524 ) ( AVAILABLE ?auto_1529 ) ( AVAILABLE ?auto_1530 ) ( SURFACE-AT ?auto_1524 ?auto_1528 ) ( ON ?auto_1524 ?auto_1532 ) ( CLEAR ?auto_1524 ) ( TRUCK-AT ?auto_1527 ?auto_1526 ) ( not ( = ?auto_1523 ?auto_1524 ) ) ( not ( = ?auto_1523 ?auto_1532 ) ) ( not ( = ?auto_1524 ?auto_1532 ) ) ( not ( = ?auto_1523 ?auto_1525 ) ) ( not ( = ?auto_1523 ?auto_1531 ) ) ( not ( = ?auto_1525 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1532 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1523 ?auto_1524 )
      ( MAKE-1CRATE ?auto_1524 ?auto_1525 )
      ( MAKE-2CRATE-VERIFY ?auto_1523 ?auto_1524 ?auto_1525 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1535 - SURFACE
      ?auto_1536 - SURFACE
    )
    :vars
    (
      ?auto_1537 - HOIST
      ?auto_1538 - PLACE
      ?auto_1540 - PLACE
      ?auto_1541 - HOIST
      ?auto_1542 - SURFACE
      ?auto_1539 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1537 ?auto_1538 ) ( SURFACE-AT ?auto_1535 ?auto_1538 ) ( CLEAR ?auto_1535 ) ( IS-CRATE ?auto_1536 ) ( AVAILABLE ?auto_1537 ) ( not ( = ?auto_1540 ?auto_1538 ) ) ( HOIST-AT ?auto_1541 ?auto_1540 ) ( AVAILABLE ?auto_1541 ) ( SURFACE-AT ?auto_1536 ?auto_1540 ) ( ON ?auto_1536 ?auto_1542 ) ( CLEAR ?auto_1536 ) ( TRUCK-AT ?auto_1539 ?auto_1538 ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1542 ) ) ( not ( = ?auto_1536 ?auto_1542 ) ) ( not ( = ?auto_1537 ?auto_1541 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1539 ?auto_1538 ?auto_1540 )
      ( !LIFT ?auto_1541 ?auto_1536 ?auto_1542 ?auto_1540 )
      ( !LOAD ?auto_1541 ?auto_1536 ?auto_1539 ?auto_1540 )
      ( !DRIVE ?auto_1539 ?auto_1540 ?auto_1538 )
      ( !UNLOAD ?auto_1537 ?auto_1536 ?auto_1539 ?auto_1538 )
      ( !DROP ?auto_1537 ?auto_1536 ?auto_1535 ?auto_1538 )
      ( MAKE-1CRATE-VERIFY ?auto_1535 ?auto_1536 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1547 - SURFACE
      ?auto_1548 - SURFACE
      ?auto_1549 - SURFACE
      ?auto_1550 - SURFACE
    )
    :vars
    (
      ?auto_1552 - HOIST
      ?auto_1554 - PLACE
      ?auto_1556 - PLACE
      ?auto_1555 - HOIST
      ?auto_1553 - SURFACE
      ?auto_1558 - SURFACE
      ?auto_1557 - SURFACE
      ?auto_1551 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1552 ?auto_1554 ) ( IS-CRATE ?auto_1550 ) ( not ( = ?auto_1556 ?auto_1554 ) ) ( HOIST-AT ?auto_1555 ?auto_1556 ) ( SURFACE-AT ?auto_1550 ?auto_1556 ) ( ON ?auto_1550 ?auto_1553 ) ( CLEAR ?auto_1550 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1553 ) ) ( not ( = ?auto_1550 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1555 ) ) ( IS-CRATE ?auto_1549 ) ( SURFACE-AT ?auto_1549 ?auto_1556 ) ( ON ?auto_1549 ?auto_1558 ) ( CLEAR ?auto_1549 ) ( not ( = ?auto_1548 ?auto_1549 ) ) ( not ( = ?auto_1548 ?auto_1558 ) ) ( not ( = ?auto_1549 ?auto_1558 ) ) ( SURFACE-AT ?auto_1547 ?auto_1554 ) ( CLEAR ?auto_1547 ) ( IS-CRATE ?auto_1548 ) ( AVAILABLE ?auto_1552 ) ( AVAILABLE ?auto_1555 ) ( SURFACE-AT ?auto_1548 ?auto_1556 ) ( ON ?auto_1548 ?auto_1557 ) ( CLEAR ?auto_1548 ) ( TRUCK-AT ?auto_1551 ?auto_1554 ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( not ( = ?auto_1547 ?auto_1557 ) ) ( not ( = ?auto_1548 ?auto_1557 ) ) ( not ( = ?auto_1547 ?auto_1549 ) ) ( not ( = ?auto_1547 ?auto_1558 ) ) ( not ( = ?auto_1549 ?auto_1557 ) ) ( not ( = ?auto_1558 ?auto_1557 ) ) ( not ( = ?auto_1547 ?auto_1550 ) ) ( not ( = ?auto_1547 ?auto_1553 ) ) ( not ( = ?auto_1548 ?auto_1550 ) ) ( not ( = ?auto_1548 ?auto_1553 ) ) ( not ( = ?auto_1550 ?auto_1558 ) ) ( not ( = ?auto_1550 ?auto_1557 ) ) ( not ( = ?auto_1553 ?auto_1558 ) ) ( not ( = ?auto_1553 ?auto_1557 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1547 ?auto_1548 ?auto_1549 )
      ( MAKE-1CRATE ?auto_1549 ?auto_1550 )
      ( MAKE-3CRATE-VERIFY ?auto_1547 ?auto_1548 ?auto_1549 ?auto_1550 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1561 - SURFACE
      ?auto_1562 - SURFACE
    )
    :vars
    (
      ?auto_1563 - HOIST
      ?auto_1564 - PLACE
      ?auto_1566 - PLACE
      ?auto_1567 - HOIST
      ?auto_1568 - SURFACE
      ?auto_1565 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1563 ?auto_1564 ) ( SURFACE-AT ?auto_1561 ?auto_1564 ) ( CLEAR ?auto_1561 ) ( IS-CRATE ?auto_1562 ) ( AVAILABLE ?auto_1563 ) ( not ( = ?auto_1566 ?auto_1564 ) ) ( HOIST-AT ?auto_1567 ?auto_1566 ) ( AVAILABLE ?auto_1567 ) ( SURFACE-AT ?auto_1562 ?auto_1566 ) ( ON ?auto_1562 ?auto_1568 ) ( CLEAR ?auto_1562 ) ( TRUCK-AT ?auto_1565 ?auto_1564 ) ( not ( = ?auto_1561 ?auto_1562 ) ) ( not ( = ?auto_1561 ?auto_1568 ) ) ( not ( = ?auto_1562 ?auto_1568 ) ) ( not ( = ?auto_1563 ?auto_1567 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1565 ?auto_1564 ?auto_1566 )
      ( !LIFT ?auto_1567 ?auto_1562 ?auto_1568 ?auto_1566 )
      ( !LOAD ?auto_1567 ?auto_1562 ?auto_1565 ?auto_1566 )
      ( !DRIVE ?auto_1565 ?auto_1566 ?auto_1564 )
      ( !UNLOAD ?auto_1563 ?auto_1562 ?auto_1565 ?auto_1564 )
      ( !DROP ?auto_1563 ?auto_1562 ?auto_1561 ?auto_1564 )
      ( MAKE-1CRATE-VERIFY ?auto_1561 ?auto_1562 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1574 - SURFACE
      ?auto_1575 - SURFACE
      ?auto_1576 - SURFACE
      ?auto_1577 - SURFACE
      ?auto_1578 - SURFACE
    )
    :vars
    (
      ?auto_1581 - HOIST
      ?auto_1584 - PLACE
      ?auto_1583 - PLACE
      ?auto_1579 - HOIST
      ?auto_1582 - SURFACE
      ?auto_1587 - PLACE
      ?auto_1586 - HOIST
      ?auto_1585 - SURFACE
      ?auto_1589 - SURFACE
      ?auto_1588 - SURFACE
      ?auto_1580 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1581 ?auto_1584 ) ( IS-CRATE ?auto_1578 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( HOIST-AT ?auto_1579 ?auto_1583 ) ( AVAILABLE ?auto_1579 ) ( SURFACE-AT ?auto_1578 ?auto_1583 ) ( ON ?auto_1578 ?auto_1582 ) ( CLEAR ?auto_1578 ) ( not ( = ?auto_1577 ?auto_1578 ) ) ( not ( = ?auto_1577 ?auto_1582 ) ) ( not ( = ?auto_1578 ?auto_1582 ) ) ( not ( = ?auto_1581 ?auto_1579 ) ) ( IS-CRATE ?auto_1577 ) ( not ( = ?auto_1587 ?auto_1584 ) ) ( HOIST-AT ?auto_1586 ?auto_1587 ) ( SURFACE-AT ?auto_1577 ?auto_1587 ) ( ON ?auto_1577 ?auto_1585 ) ( CLEAR ?auto_1577 ) ( not ( = ?auto_1576 ?auto_1577 ) ) ( not ( = ?auto_1576 ?auto_1585 ) ) ( not ( = ?auto_1577 ?auto_1585 ) ) ( not ( = ?auto_1581 ?auto_1586 ) ) ( IS-CRATE ?auto_1576 ) ( SURFACE-AT ?auto_1576 ?auto_1587 ) ( ON ?auto_1576 ?auto_1589 ) ( CLEAR ?auto_1576 ) ( not ( = ?auto_1575 ?auto_1576 ) ) ( not ( = ?auto_1575 ?auto_1589 ) ) ( not ( = ?auto_1576 ?auto_1589 ) ) ( SURFACE-AT ?auto_1574 ?auto_1584 ) ( CLEAR ?auto_1574 ) ( IS-CRATE ?auto_1575 ) ( AVAILABLE ?auto_1581 ) ( AVAILABLE ?auto_1586 ) ( SURFACE-AT ?auto_1575 ?auto_1587 ) ( ON ?auto_1575 ?auto_1588 ) ( CLEAR ?auto_1575 ) ( TRUCK-AT ?auto_1580 ?auto_1584 ) ( not ( = ?auto_1574 ?auto_1575 ) ) ( not ( = ?auto_1574 ?auto_1588 ) ) ( not ( = ?auto_1575 ?auto_1588 ) ) ( not ( = ?auto_1574 ?auto_1576 ) ) ( not ( = ?auto_1574 ?auto_1589 ) ) ( not ( = ?auto_1576 ?auto_1588 ) ) ( not ( = ?auto_1589 ?auto_1588 ) ) ( not ( = ?auto_1574 ?auto_1577 ) ) ( not ( = ?auto_1574 ?auto_1585 ) ) ( not ( = ?auto_1575 ?auto_1577 ) ) ( not ( = ?auto_1575 ?auto_1585 ) ) ( not ( = ?auto_1577 ?auto_1589 ) ) ( not ( = ?auto_1577 ?auto_1588 ) ) ( not ( = ?auto_1585 ?auto_1589 ) ) ( not ( = ?auto_1585 ?auto_1588 ) ) ( not ( = ?auto_1574 ?auto_1578 ) ) ( not ( = ?auto_1574 ?auto_1582 ) ) ( not ( = ?auto_1575 ?auto_1578 ) ) ( not ( = ?auto_1575 ?auto_1582 ) ) ( not ( = ?auto_1576 ?auto_1578 ) ) ( not ( = ?auto_1576 ?auto_1582 ) ) ( not ( = ?auto_1578 ?auto_1585 ) ) ( not ( = ?auto_1578 ?auto_1589 ) ) ( not ( = ?auto_1578 ?auto_1588 ) ) ( not ( = ?auto_1583 ?auto_1587 ) ) ( not ( = ?auto_1579 ?auto_1586 ) ) ( not ( = ?auto_1582 ?auto_1585 ) ) ( not ( = ?auto_1582 ?auto_1589 ) ) ( not ( = ?auto_1582 ?auto_1588 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1574 ?auto_1575 ?auto_1576 ?auto_1577 )
      ( MAKE-1CRATE ?auto_1577 ?auto_1578 )
      ( MAKE-4CRATE-VERIFY ?auto_1574 ?auto_1575 ?auto_1576 ?auto_1577 ?auto_1578 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1592 - SURFACE
      ?auto_1593 - SURFACE
    )
    :vars
    (
      ?auto_1594 - HOIST
      ?auto_1595 - PLACE
      ?auto_1597 - PLACE
      ?auto_1598 - HOIST
      ?auto_1599 - SURFACE
      ?auto_1596 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1594 ?auto_1595 ) ( SURFACE-AT ?auto_1592 ?auto_1595 ) ( CLEAR ?auto_1592 ) ( IS-CRATE ?auto_1593 ) ( AVAILABLE ?auto_1594 ) ( not ( = ?auto_1597 ?auto_1595 ) ) ( HOIST-AT ?auto_1598 ?auto_1597 ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1593 ?auto_1597 ) ( ON ?auto_1593 ?auto_1599 ) ( CLEAR ?auto_1593 ) ( TRUCK-AT ?auto_1596 ?auto_1595 ) ( not ( = ?auto_1592 ?auto_1593 ) ) ( not ( = ?auto_1592 ?auto_1599 ) ) ( not ( = ?auto_1593 ?auto_1599 ) ) ( not ( = ?auto_1594 ?auto_1598 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1596 ?auto_1595 ?auto_1597 )
      ( !LIFT ?auto_1598 ?auto_1593 ?auto_1599 ?auto_1597 )
      ( !LOAD ?auto_1598 ?auto_1593 ?auto_1596 ?auto_1597 )
      ( !DRIVE ?auto_1596 ?auto_1597 ?auto_1595 )
      ( !UNLOAD ?auto_1594 ?auto_1593 ?auto_1596 ?auto_1595 )
      ( !DROP ?auto_1594 ?auto_1593 ?auto_1592 ?auto_1595 )
      ( MAKE-1CRATE-VERIFY ?auto_1592 ?auto_1593 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1606 - SURFACE
      ?auto_1607 - SURFACE
      ?auto_1608 - SURFACE
      ?auto_1609 - SURFACE
      ?auto_1610 - SURFACE
      ?auto_1611 - SURFACE
    )
    :vars
    (
      ?auto_1612 - HOIST
      ?auto_1615 - PLACE
      ?auto_1616 - PLACE
      ?auto_1614 - HOIST
      ?auto_1613 - SURFACE
      ?auto_1619 - PLACE
      ?auto_1622 - HOIST
      ?auto_1623 - SURFACE
      ?auto_1620 - SURFACE
      ?auto_1618 - SURFACE
      ?auto_1621 - SURFACE
      ?auto_1617 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1612 ?auto_1615 ) ( IS-CRATE ?auto_1611 ) ( not ( = ?auto_1616 ?auto_1615 ) ) ( HOIST-AT ?auto_1614 ?auto_1616 ) ( SURFACE-AT ?auto_1611 ?auto_1616 ) ( ON ?auto_1611 ?auto_1613 ) ( CLEAR ?auto_1611 ) ( not ( = ?auto_1610 ?auto_1611 ) ) ( not ( = ?auto_1610 ?auto_1613 ) ) ( not ( = ?auto_1611 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1614 ) ) ( IS-CRATE ?auto_1610 ) ( not ( = ?auto_1619 ?auto_1615 ) ) ( HOIST-AT ?auto_1622 ?auto_1619 ) ( AVAILABLE ?auto_1622 ) ( SURFACE-AT ?auto_1610 ?auto_1619 ) ( ON ?auto_1610 ?auto_1623 ) ( CLEAR ?auto_1610 ) ( not ( = ?auto_1609 ?auto_1610 ) ) ( not ( = ?auto_1609 ?auto_1623 ) ) ( not ( = ?auto_1610 ?auto_1623 ) ) ( not ( = ?auto_1612 ?auto_1622 ) ) ( IS-CRATE ?auto_1609 ) ( SURFACE-AT ?auto_1609 ?auto_1616 ) ( ON ?auto_1609 ?auto_1620 ) ( CLEAR ?auto_1609 ) ( not ( = ?auto_1608 ?auto_1609 ) ) ( not ( = ?auto_1608 ?auto_1620 ) ) ( not ( = ?auto_1609 ?auto_1620 ) ) ( IS-CRATE ?auto_1608 ) ( SURFACE-AT ?auto_1608 ?auto_1616 ) ( ON ?auto_1608 ?auto_1618 ) ( CLEAR ?auto_1608 ) ( not ( = ?auto_1607 ?auto_1608 ) ) ( not ( = ?auto_1607 ?auto_1618 ) ) ( not ( = ?auto_1608 ?auto_1618 ) ) ( SURFACE-AT ?auto_1606 ?auto_1615 ) ( CLEAR ?auto_1606 ) ( IS-CRATE ?auto_1607 ) ( AVAILABLE ?auto_1612 ) ( AVAILABLE ?auto_1614 ) ( SURFACE-AT ?auto_1607 ?auto_1616 ) ( ON ?auto_1607 ?auto_1621 ) ( CLEAR ?auto_1607 ) ( TRUCK-AT ?auto_1617 ?auto_1615 ) ( not ( = ?auto_1606 ?auto_1607 ) ) ( not ( = ?auto_1606 ?auto_1621 ) ) ( not ( = ?auto_1607 ?auto_1621 ) ) ( not ( = ?auto_1606 ?auto_1608 ) ) ( not ( = ?auto_1606 ?auto_1618 ) ) ( not ( = ?auto_1608 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1606 ?auto_1609 ) ) ( not ( = ?auto_1606 ?auto_1620 ) ) ( not ( = ?auto_1607 ?auto_1609 ) ) ( not ( = ?auto_1607 ?auto_1620 ) ) ( not ( = ?auto_1609 ?auto_1618 ) ) ( not ( = ?auto_1609 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1618 ) ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1606 ?auto_1610 ) ) ( not ( = ?auto_1606 ?auto_1623 ) ) ( not ( = ?auto_1607 ?auto_1610 ) ) ( not ( = ?auto_1607 ?auto_1623 ) ) ( not ( = ?auto_1608 ?auto_1610 ) ) ( not ( = ?auto_1608 ?auto_1623 ) ) ( not ( = ?auto_1610 ?auto_1620 ) ) ( not ( = ?auto_1610 ?auto_1618 ) ) ( not ( = ?auto_1610 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1616 ) ) ( not ( = ?auto_1622 ?auto_1614 ) ) ( not ( = ?auto_1623 ?auto_1620 ) ) ( not ( = ?auto_1623 ?auto_1618 ) ) ( not ( = ?auto_1623 ?auto_1621 ) ) ( not ( = ?auto_1606 ?auto_1611 ) ) ( not ( = ?auto_1606 ?auto_1613 ) ) ( not ( = ?auto_1607 ?auto_1611 ) ) ( not ( = ?auto_1607 ?auto_1613 ) ) ( not ( = ?auto_1608 ?auto_1611 ) ) ( not ( = ?auto_1608 ?auto_1613 ) ) ( not ( = ?auto_1609 ?auto_1611 ) ) ( not ( = ?auto_1609 ?auto_1613 ) ) ( not ( = ?auto_1611 ?auto_1623 ) ) ( not ( = ?auto_1611 ?auto_1620 ) ) ( not ( = ?auto_1611 ?auto_1618 ) ) ( not ( = ?auto_1611 ?auto_1621 ) ) ( not ( = ?auto_1613 ?auto_1623 ) ) ( not ( = ?auto_1613 ?auto_1620 ) ) ( not ( = ?auto_1613 ?auto_1618 ) ) ( not ( = ?auto_1613 ?auto_1621 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1606 ?auto_1607 ?auto_1608 ?auto_1609 ?auto_1610 )
      ( MAKE-1CRATE ?auto_1610 ?auto_1611 )
      ( MAKE-5CRATE-VERIFY ?auto_1606 ?auto_1607 ?auto_1608 ?auto_1609 ?auto_1610 ?auto_1611 ) )
  )

)

