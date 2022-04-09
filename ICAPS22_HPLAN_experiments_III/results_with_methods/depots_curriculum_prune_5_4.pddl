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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1523 - SURFACE
      ?auto_1524 - SURFACE
      ?auto_1525 - SURFACE
    )
    :vars
    (
      ?auto_1528 - HOIST
      ?auto_1531 - PLACE
      ?auto_1530 - PLACE
      ?auto_1529 - HOIST
      ?auto_1526 - SURFACE
      ?auto_1534 - PLACE
      ?auto_1532 - HOIST
      ?auto_1533 - SURFACE
      ?auto_1527 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1528 ?auto_1531 ) ( IS-CRATE ?auto_1525 ) ( not ( = ?auto_1530 ?auto_1531 ) ) ( HOIST-AT ?auto_1529 ?auto_1530 ) ( AVAILABLE ?auto_1529 ) ( SURFACE-AT ?auto_1525 ?auto_1530 ) ( ON ?auto_1525 ?auto_1526 ) ( CLEAR ?auto_1525 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( not ( = ?auto_1524 ?auto_1526 ) ) ( not ( = ?auto_1525 ?auto_1526 ) ) ( not ( = ?auto_1528 ?auto_1529 ) ) ( SURFACE-AT ?auto_1523 ?auto_1531 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1524 ) ( AVAILABLE ?auto_1528 ) ( not ( = ?auto_1534 ?auto_1531 ) ) ( HOIST-AT ?auto_1532 ?auto_1534 ) ( AVAILABLE ?auto_1532 ) ( SURFACE-AT ?auto_1524 ?auto_1534 ) ( ON ?auto_1524 ?auto_1533 ) ( CLEAR ?auto_1524 ) ( TRUCK-AT ?auto_1527 ?auto_1531 ) ( not ( = ?auto_1523 ?auto_1524 ) ) ( not ( = ?auto_1523 ?auto_1533 ) ) ( not ( = ?auto_1524 ?auto_1533 ) ) ( not ( = ?auto_1528 ?auto_1532 ) ) ( not ( = ?auto_1523 ?auto_1525 ) ) ( not ( = ?auto_1523 ?auto_1526 ) ) ( not ( = ?auto_1525 ?auto_1533 ) ) ( not ( = ?auto_1530 ?auto_1534 ) ) ( not ( = ?auto_1529 ?auto_1532 ) ) ( not ( = ?auto_1526 ?auto_1533 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1523 ?auto_1524 )
      ( MAKE-1CRATE ?auto_1524 ?auto_1525 )
      ( MAKE-2CRATE-VERIFY ?auto_1523 ?auto_1524 ?auto_1525 ) )
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
      ?auto_1554 - HOIST
      ?auto_1555 - PLACE
      ?auto_1558 - PLACE
      ?auto_1556 - HOIST
      ?auto_1557 - SURFACE
      ?auto_1563 - PLACE
      ?auto_1560 - HOIST
      ?auto_1562 - SURFACE
      ?auto_1561 - PLACE
      ?auto_1559 - HOIST
      ?auto_1564 - SURFACE
      ?auto_1553 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1555 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1558 ?auto_1555 ) ) ( HOIST-AT ?auto_1556 ?auto_1558 ) ( AVAILABLE ?auto_1556 ) ( SURFACE-AT ?auto_1552 ?auto_1558 ) ( ON ?auto_1552 ?auto_1557 ) ( CLEAR ?auto_1552 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( not ( = ?auto_1551 ?auto_1557 ) ) ( not ( = ?auto_1552 ?auto_1557 ) ) ( not ( = ?auto_1554 ?auto_1556 ) ) ( IS-CRATE ?auto_1551 ) ( not ( = ?auto_1563 ?auto_1555 ) ) ( HOIST-AT ?auto_1560 ?auto_1563 ) ( AVAILABLE ?auto_1560 ) ( SURFACE-AT ?auto_1551 ?auto_1563 ) ( ON ?auto_1551 ?auto_1562 ) ( CLEAR ?auto_1551 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1562 ) ) ( not ( = ?auto_1551 ?auto_1562 ) ) ( not ( = ?auto_1554 ?auto_1560 ) ) ( SURFACE-AT ?auto_1549 ?auto_1555 ) ( CLEAR ?auto_1549 ) ( IS-CRATE ?auto_1550 ) ( AVAILABLE ?auto_1554 ) ( not ( = ?auto_1561 ?auto_1555 ) ) ( HOIST-AT ?auto_1559 ?auto_1561 ) ( AVAILABLE ?auto_1559 ) ( SURFACE-AT ?auto_1550 ?auto_1561 ) ( ON ?auto_1550 ?auto_1564 ) ( CLEAR ?auto_1550 ) ( TRUCK-AT ?auto_1553 ?auto_1555 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1564 ) ) ( not ( = ?auto_1550 ?auto_1564 ) ) ( not ( = ?auto_1554 ?auto_1559 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1562 ) ) ( not ( = ?auto_1551 ?auto_1564 ) ) ( not ( = ?auto_1563 ?auto_1561 ) ) ( not ( = ?auto_1560 ?auto_1559 ) ) ( not ( = ?auto_1562 ?auto_1564 ) ) ( not ( = ?auto_1549 ?auto_1552 ) ) ( not ( = ?auto_1549 ?auto_1557 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( not ( = ?auto_1550 ?auto_1557 ) ) ( not ( = ?auto_1552 ?auto_1562 ) ) ( not ( = ?auto_1552 ?auto_1564 ) ) ( not ( = ?auto_1558 ?auto_1563 ) ) ( not ( = ?auto_1558 ?auto_1561 ) ) ( not ( = ?auto_1556 ?auto_1560 ) ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1557 ?auto_1562 ) ) ( not ( = ?auto_1557 ?auto_1564 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1549 ?auto_1550 ?auto_1551 )
      ( MAKE-1CRATE ?auto_1551 ?auto_1552 )
      ( MAKE-3CRATE-VERIFY ?auto_1549 ?auto_1550 ?auto_1551 ?auto_1552 ) )
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
      ?auto_1587 - HOIST
      ?auto_1585 - PLACE
      ?auto_1588 - PLACE
      ?auto_1586 - HOIST
      ?auto_1589 - SURFACE
      ?auto_1597 - PLACE
      ?auto_1592 - HOIST
      ?auto_1591 - SURFACE
      ?auto_1595 - PLACE
      ?auto_1599 - HOIST
      ?auto_1596 - SURFACE
      ?auto_1594 - PLACE
      ?auto_1598 - HOIST
      ?auto_1593 - SURFACE
      ?auto_1590 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1587 ?auto_1585 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1588 ?auto_1585 ) ) ( HOIST-AT ?auto_1586 ?auto_1588 ) ( AVAILABLE ?auto_1586 ) ( SURFACE-AT ?auto_1584 ?auto_1588 ) ( ON ?auto_1584 ?auto_1589 ) ( CLEAR ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1583 ?auto_1589 ) ) ( not ( = ?auto_1584 ?auto_1589 ) ) ( not ( = ?auto_1587 ?auto_1586 ) ) ( IS-CRATE ?auto_1583 ) ( not ( = ?auto_1597 ?auto_1585 ) ) ( HOIST-AT ?auto_1592 ?auto_1597 ) ( AVAILABLE ?auto_1592 ) ( SURFACE-AT ?auto_1583 ?auto_1597 ) ( ON ?auto_1583 ?auto_1591 ) ( CLEAR ?auto_1583 ) ( not ( = ?auto_1582 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1591 ) ) ( not ( = ?auto_1583 ?auto_1591 ) ) ( not ( = ?auto_1587 ?auto_1592 ) ) ( IS-CRATE ?auto_1582 ) ( not ( = ?auto_1595 ?auto_1585 ) ) ( HOIST-AT ?auto_1599 ?auto_1595 ) ( AVAILABLE ?auto_1599 ) ( SURFACE-AT ?auto_1582 ?auto_1595 ) ( ON ?auto_1582 ?auto_1596 ) ( CLEAR ?auto_1582 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( not ( = ?auto_1581 ?auto_1596 ) ) ( not ( = ?auto_1582 ?auto_1596 ) ) ( not ( = ?auto_1587 ?auto_1599 ) ) ( SURFACE-AT ?auto_1580 ?auto_1585 ) ( CLEAR ?auto_1580 ) ( IS-CRATE ?auto_1581 ) ( AVAILABLE ?auto_1587 ) ( not ( = ?auto_1594 ?auto_1585 ) ) ( HOIST-AT ?auto_1598 ?auto_1594 ) ( AVAILABLE ?auto_1598 ) ( SURFACE-AT ?auto_1581 ?auto_1594 ) ( ON ?auto_1581 ?auto_1593 ) ( CLEAR ?auto_1581 ) ( TRUCK-AT ?auto_1590 ?auto_1585 ) ( not ( = ?auto_1580 ?auto_1581 ) ) ( not ( = ?auto_1580 ?auto_1593 ) ) ( not ( = ?auto_1581 ?auto_1593 ) ) ( not ( = ?auto_1587 ?auto_1598 ) ) ( not ( = ?auto_1580 ?auto_1582 ) ) ( not ( = ?auto_1580 ?auto_1596 ) ) ( not ( = ?auto_1582 ?auto_1593 ) ) ( not ( = ?auto_1595 ?auto_1594 ) ) ( not ( = ?auto_1599 ?auto_1598 ) ) ( not ( = ?auto_1596 ?auto_1593 ) ) ( not ( = ?auto_1580 ?auto_1583 ) ) ( not ( = ?auto_1580 ?auto_1591 ) ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( not ( = ?auto_1581 ?auto_1591 ) ) ( not ( = ?auto_1583 ?auto_1596 ) ) ( not ( = ?auto_1583 ?auto_1593 ) ) ( not ( = ?auto_1597 ?auto_1595 ) ) ( not ( = ?auto_1597 ?auto_1594 ) ) ( not ( = ?auto_1592 ?auto_1599 ) ) ( not ( = ?auto_1592 ?auto_1598 ) ) ( not ( = ?auto_1591 ?auto_1596 ) ) ( not ( = ?auto_1591 ?auto_1593 ) ) ( not ( = ?auto_1580 ?auto_1584 ) ) ( not ( = ?auto_1580 ?auto_1589 ) ) ( not ( = ?auto_1581 ?auto_1584 ) ) ( not ( = ?auto_1581 ?auto_1589 ) ) ( not ( = ?auto_1582 ?auto_1584 ) ) ( not ( = ?auto_1582 ?auto_1589 ) ) ( not ( = ?auto_1584 ?auto_1591 ) ) ( not ( = ?auto_1584 ?auto_1596 ) ) ( not ( = ?auto_1584 ?auto_1593 ) ) ( not ( = ?auto_1588 ?auto_1597 ) ) ( not ( = ?auto_1588 ?auto_1595 ) ) ( not ( = ?auto_1588 ?auto_1594 ) ) ( not ( = ?auto_1586 ?auto_1592 ) ) ( not ( = ?auto_1586 ?auto_1599 ) ) ( not ( = ?auto_1586 ?auto_1598 ) ) ( not ( = ?auto_1589 ?auto_1591 ) ) ( not ( = ?auto_1589 ?auto_1596 ) ) ( not ( = ?auto_1589 ?auto_1593 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1580 ?auto_1581 ?auto_1582 ?auto_1583 )
      ( MAKE-1CRATE ?auto_1583 ?auto_1584 )
      ( MAKE-4CRATE-VERIFY ?auto_1580 ?auto_1581 ?auto_1582 ?auto_1583 ?auto_1584 ) )
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
      ?auto_1626 - PLACE
      ?auto_1624 - PLACE
      ?auto_1625 - HOIST
      ?auto_1627 - SURFACE
      ?auto_1637 - PLACE
      ?auto_1629 - HOIST
      ?auto_1630 - SURFACE
      ?auto_1636 - PLACE
      ?auto_1633 - HOIST
      ?auto_1631 - SURFACE
      ?auto_1635 - SURFACE
      ?auto_1634 - PLACE
      ?auto_1628 - HOIST
      ?auto_1632 - SURFACE
      ?auto_1623 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1622 ?auto_1626 ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1624 ?auto_1626 ) ) ( HOIST-AT ?auto_1625 ?auto_1624 ) ( SURFACE-AT ?auto_1621 ?auto_1624 ) ( ON ?auto_1621 ?auto_1627 ) ( CLEAR ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1627 ) ) ( not ( = ?auto_1621 ?auto_1627 ) ) ( not ( = ?auto_1622 ?auto_1625 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1637 ?auto_1626 ) ) ( HOIST-AT ?auto_1629 ?auto_1637 ) ( AVAILABLE ?auto_1629 ) ( SURFACE-AT ?auto_1620 ?auto_1637 ) ( ON ?auto_1620 ?auto_1630 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1630 ) ) ( not ( = ?auto_1620 ?auto_1630 ) ) ( not ( = ?auto_1622 ?auto_1629 ) ) ( IS-CRATE ?auto_1619 ) ( not ( = ?auto_1636 ?auto_1626 ) ) ( HOIST-AT ?auto_1633 ?auto_1636 ) ( AVAILABLE ?auto_1633 ) ( SURFACE-AT ?auto_1619 ?auto_1636 ) ( ON ?auto_1619 ?auto_1631 ) ( CLEAR ?auto_1619 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1631 ) ) ( not ( = ?auto_1619 ?auto_1631 ) ) ( not ( = ?auto_1622 ?auto_1633 ) ) ( IS-CRATE ?auto_1618 ) ( AVAILABLE ?auto_1625 ) ( SURFACE-AT ?auto_1618 ?auto_1624 ) ( ON ?auto_1618 ?auto_1635 ) ( CLEAR ?auto_1618 ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( not ( = ?auto_1617 ?auto_1635 ) ) ( not ( = ?auto_1618 ?auto_1635 ) ) ( SURFACE-AT ?auto_1616 ?auto_1626 ) ( CLEAR ?auto_1616 ) ( IS-CRATE ?auto_1617 ) ( AVAILABLE ?auto_1622 ) ( not ( = ?auto_1634 ?auto_1626 ) ) ( HOIST-AT ?auto_1628 ?auto_1634 ) ( AVAILABLE ?auto_1628 ) ( SURFACE-AT ?auto_1617 ?auto_1634 ) ( ON ?auto_1617 ?auto_1632 ) ( CLEAR ?auto_1617 ) ( TRUCK-AT ?auto_1623 ?auto_1626 ) ( not ( = ?auto_1616 ?auto_1617 ) ) ( not ( = ?auto_1616 ?auto_1632 ) ) ( not ( = ?auto_1617 ?auto_1632 ) ) ( not ( = ?auto_1622 ?auto_1628 ) ) ( not ( = ?auto_1616 ?auto_1618 ) ) ( not ( = ?auto_1616 ?auto_1635 ) ) ( not ( = ?auto_1618 ?auto_1632 ) ) ( not ( = ?auto_1624 ?auto_1634 ) ) ( not ( = ?auto_1625 ?auto_1628 ) ) ( not ( = ?auto_1635 ?auto_1632 ) ) ( not ( = ?auto_1616 ?auto_1619 ) ) ( not ( = ?auto_1616 ?auto_1631 ) ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1617 ?auto_1631 ) ) ( not ( = ?auto_1619 ?auto_1635 ) ) ( not ( = ?auto_1619 ?auto_1632 ) ) ( not ( = ?auto_1636 ?auto_1624 ) ) ( not ( = ?auto_1636 ?auto_1634 ) ) ( not ( = ?auto_1633 ?auto_1625 ) ) ( not ( = ?auto_1633 ?auto_1628 ) ) ( not ( = ?auto_1631 ?auto_1635 ) ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( not ( = ?auto_1616 ?auto_1620 ) ) ( not ( = ?auto_1616 ?auto_1630 ) ) ( not ( = ?auto_1617 ?auto_1620 ) ) ( not ( = ?auto_1617 ?auto_1630 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1630 ) ) ( not ( = ?auto_1620 ?auto_1631 ) ) ( not ( = ?auto_1620 ?auto_1635 ) ) ( not ( = ?auto_1620 ?auto_1632 ) ) ( not ( = ?auto_1637 ?auto_1636 ) ) ( not ( = ?auto_1637 ?auto_1624 ) ) ( not ( = ?auto_1637 ?auto_1634 ) ) ( not ( = ?auto_1629 ?auto_1633 ) ) ( not ( = ?auto_1629 ?auto_1625 ) ) ( not ( = ?auto_1629 ?auto_1628 ) ) ( not ( = ?auto_1630 ?auto_1631 ) ) ( not ( = ?auto_1630 ?auto_1635 ) ) ( not ( = ?auto_1630 ?auto_1632 ) ) ( not ( = ?auto_1616 ?auto_1621 ) ) ( not ( = ?auto_1616 ?auto_1627 ) ) ( not ( = ?auto_1617 ?auto_1621 ) ) ( not ( = ?auto_1617 ?auto_1627 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1627 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1627 ) ) ( not ( = ?auto_1621 ?auto_1630 ) ) ( not ( = ?auto_1621 ?auto_1631 ) ) ( not ( = ?auto_1621 ?auto_1635 ) ) ( not ( = ?auto_1621 ?auto_1632 ) ) ( not ( = ?auto_1627 ?auto_1630 ) ) ( not ( = ?auto_1627 ?auto_1631 ) ) ( not ( = ?auto_1627 ?auto_1635 ) ) ( not ( = ?auto_1627 ?auto_1632 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 )
      ( MAKE-1CRATE ?auto_1620 ?auto_1621 )
      ( MAKE-5CRATE-VERIFY ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ) )
  )

)

