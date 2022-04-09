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
      ?auto_1530 - HOIST
      ?auto_1527 - PLACE
      ?auto_1528 - PLACE
      ?auto_1529 - HOIST
      ?auto_1531 - SURFACE
      ?auto_1532 - PLACE
      ?auto_1534 - HOIST
      ?auto_1533 - SURFACE
      ?auto_1526 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1530 ?auto_1527 ) ( IS-CRATE ?auto_1525 ) ( not ( = ?auto_1528 ?auto_1527 ) ) ( HOIST-AT ?auto_1529 ?auto_1528 ) ( AVAILABLE ?auto_1529 ) ( SURFACE-AT ?auto_1525 ?auto_1528 ) ( ON ?auto_1525 ?auto_1531 ) ( CLEAR ?auto_1525 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( not ( = ?auto_1524 ?auto_1531 ) ) ( not ( = ?auto_1525 ?auto_1531 ) ) ( not ( = ?auto_1530 ?auto_1529 ) ) ( SURFACE-AT ?auto_1523 ?auto_1527 ) ( CLEAR ?auto_1523 ) ( IS-CRATE ?auto_1524 ) ( AVAILABLE ?auto_1530 ) ( not ( = ?auto_1532 ?auto_1527 ) ) ( HOIST-AT ?auto_1534 ?auto_1532 ) ( AVAILABLE ?auto_1534 ) ( SURFACE-AT ?auto_1524 ?auto_1532 ) ( ON ?auto_1524 ?auto_1533 ) ( CLEAR ?auto_1524 ) ( TRUCK-AT ?auto_1526 ?auto_1527 ) ( not ( = ?auto_1523 ?auto_1524 ) ) ( not ( = ?auto_1523 ?auto_1533 ) ) ( not ( = ?auto_1524 ?auto_1533 ) ) ( not ( = ?auto_1530 ?auto_1534 ) ) ( not ( = ?auto_1523 ?auto_1525 ) ) ( not ( = ?auto_1523 ?auto_1531 ) ) ( not ( = ?auto_1525 ?auto_1533 ) ) ( not ( = ?auto_1528 ?auto_1532 ) ) ( not ( = ?auto_1529 ?auto_1534 ) ) ( not ( = ?auto_1531 ?auto_1533 ) ) )
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
      ?auto_1557 - PLACE
      ?auto_1556 - PLACE
      ?auto_1553 - HOIST
      ?auto_1555 - SURFACE
      ?auto_1560 - PLACE
      ?auto_1561 - HOIST
      ?auto_1564 - SURFACE
      ?auto_1559 - PLACE
      ?auto_1562 - HOIST
      ?auto_1563 - SURFACE
      ?auto_1558 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1554 ?auto_1557 ) ( IS-CRATE ?auto_1552 ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( HOIST-AT ?auto_1553 ?auto_1556 ) ( AVAILABLE ?auto_1553 ) ( SURFACE-AT ?auto_1552 ?auto_1556 ) ( ON ?auto_1552 ?auto_1555 ) ( CLEAR ?auto_1552 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( not ( = ?auto_1551 ?auto_1555 ) ) ( not ( = ?auto_1552 ?auto_1555 ) ) ( not ( = ?auto_1554 ?auto_1553 ) ) ( IS-CRATE ?auto_1551 ) ( not ( = ?auto_1560 ?auto_1557 ) ) ( HOIST-AT ?auto_1561 ?auto_1560 ) ( AVAILABLE ?auto_1561 ) ( SURFACE-AT ?auto_1551 ?auto_1560 ) ( ON ?auto_1551 ?auto_1564 ) ( CLEAR ?auto_1551 ) ( not ( = ?auto_1550 ?auto_1551 ) ) ( not ( = ?auto_1550 ?auto_1564 ) ) ( not ( = ?auto_1551 ?auto_1564 ) ) ( not ( = ?auto_1554 ?auto_1561 ) ) ( SURFACE-AT ?auto_1549 ?auto_1557 ) ( CLEAR ?auto_1549 ) ( IS-CRATE ?auto_1550 ) ( AVAILABLE ?auto_1554 ) ( not ( = ?auto_1559 ?auto_1557 ) ) ( HOIST-AT ?auto_1562 ?auto_1559 ) ( AVAILABLE ?auto_1562 ) ( SURFACE-AT ?auto_1550 ?auto_1559 ) ( ON ?auto_1550 ?auto_1563 ) ( CLEAR ?auto_1550 ) ( TRUCK-AT ?auto_1558 ?auto_1557 ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1563 ) ) ( not ( = ?auto_1550 ?auto_1563 ) ) ( not ( = ?auto_1554 ?auto_1562 ) ) ( not ( = ?auto_1549 ?auto_1551 ) ) ( not ( = ?auto_1549 ?auto_1564 ) ) ( not ( = ?auto_1551 ?auto_1563 ) ) ( not ( = ?auto_1560 ?auto_1559 ) ) ( not ( = ?auto_1561 ?auto_1562 ) ) ( not ( = ?auto_1564 ?auto_1563 ) ) ( not ( = ?auto_1549 ?auto_1552 ) ) ( not ( = ?auto_1549 ?auto_1555 ) ) ( not ( = ?auto_1550 ?auto_1552 ) ) ( not ( = ?auto_1550 ?auto_1555 ) ) ( not ( = ?auto_1552 ?auto_1564 ) ) ( not ( = ?auto_1552 ?auto_1563 ) ) ( not ( = ?auto_1556 ?auto_1560 ) ) ( not ( = ?auto_1556 ?auto_1559 ) ) ( not ( = ?auto_1553 ?auto_1561 ) ) ( not ( = ?auto_1553 ?auto_1562 ) ) ( not ( = ?auto_1555 ?auto_1564 ) ) ( not ( = ?auto_1555 ?auto_1563 ) ) )
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
      ?auto_1586 - PLACE
      ?auto_1585 - PLACE
      ?auto_1588 - HOIST
      ?auto_1590 - SURFACE
      ?auto_1592 - PLACE
      ?auto_1593 - HOIST
      ?auto_1591 - SURFACE
      ?auto_1599 - PLACE
      ?auto_1595 - HOIST
      ?auto_1594 - SURFACE
      ?auto_1598 - PLACE
      ?auto_1597 - HOIST
      ?auto_1596 - SURFACE
      ?auto_1589 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1587 ?auto_1586 ) ( IS-CRATE ?auto_1584 ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( HOIST-AT ?auto_1588 ?auto_1585 ) ( AVAILABLE ?auto_1588 ) ( SURFACE-AT ?auto_1584 ?auto_1585 ) ( ON ?auto_1584 ?auto_1590 ) ( CLEAR ?auto_1584 ) ( not ( = ?auto_1583 ?auto_1584 ) ) ( not ( = ?auto_1583 ?auto_1590 ) ) ( not ( = ?auto_1584 ?auto_1590 ) ) ( not ( = ?auto_1587 ?auto_1588 ) ) ( IS-CRATE ?auto_1583 ) ( not ( = ?auto_1592 ?auto_1586 ) ) ( HOIST-AT ?auto_1593 ?auto_1592 ) ( AVAILABLE ?auto_1593 ) ( SURFACE-AT ?auto_1583 ?auto_1592 ) ( ON ?auto_1583 ?auto_1591 ) ( CLEAR ?auto_1583 ) ( not ( = ?auto_1582 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1591 ) ) ( not ( = ?auto_1583 ?auto_1591 ) ) ( not ( = ?auto_1587 ?auto_1593 ) ) ( IS-CRATE ?auto_1582 ) ( not ( = ?auto_1599 ?auto_1586 ) ) ( HOIST-AT ?auto_1595 ?auto_1599 ) ( AVAILABLE ?auto_1595 ) ( SURFACE-AT ?auto_1582 ?auto_1599 ) ( ON ?auto_1582 ?auto_1594 ) ( CLEAR ?auto_1582 ) ( not ( = ?auto_1581 ?auto_1582 ) ) ( not ( = ?auto_1581 ?auto_1594 ) ) ( not ( = ?auto_1582 ?auto_1594 ) ) ( not ( = ?auto_1587 ?auto_1595 ) ) ( SURFACE-AT ?auto_1580 ?auto_1586 ) ( CLEAR ?auto_1580 ) ( IS-CRATE ?auto_1581 ) ( AVAILABLE ?auto_1587 ) ( not ( = ?auto_1598 ?auto_1586 ) ) ( HOIST-AT ?auto_1597 ?auto_1598 ) ( AVAILABLE ?auto_1597 ) ( SURFACE-AT ?auto_1581 ?auto_1598 ) ( ON ?auto_1581 ?auto_1596 ) ( CLEAR ?auto_1581 ) ( TRUCK-AT ?auto_1589 ?auto_1586 ) ( not ( = ?auto_1580 ?auto_1581 ) ) ( not ( = ?auto_1580 ?auto_1596 ) ) ( not ( = ?auto_1581 ?auto_1596 ) ) ( not ( = ?auto_1587 ?auto_1597 ) ) ( not ( = ?auto_1580 ?auto_1582 ) ) ( not ( = ?auto_1580 ?auto_1594 ) ) ( not ( = ?auto_1582 ?auto_1596 ) ) ( not ( = ?auto_1599 ?auto_1598 ) ) ( not ( = ?auto_1595 ?auto_1597 ) ) ( not ( = ?auto_1594 ?auto_1596 ) ) ( not ( = ?auto_1580 ?auto_1583 ) ) ( not ( = ?auto_1580 ?auto_1591 ) ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( not ( = ?auto_1581 ?auto_1591 ) ) ( not ( = ?auto_1583 ?auto_1594 ) ) ( not ( = ?auto_1583 ?auto_1596 ) ) ( not ( = ?auto_1592 ?auto_1599 ) ) ( not ( = ?auto_1592 ?auto_1598 ) ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( not ( = ?auto_1593 ?auto_1597 ) ) ( not ( = ?auto_1591 ?auto_1594 ) ) ( not ( = ?auto_1591 ?auto_1596 ) ) ( not ( = ?auto_1580 ?auto_1584 ) ) ( not ( = ?auto_1580 ?auto_1590 ) ) ( not ( = ?auto_1581 ?auto_1584 ) ) ( not ( = ?auto_1581 ?auto_1590 ) ) ( not ( = ?auto_1582 ?auto_1584 ) ) ( not ( = ?auto_1582 ?auto_1590 ) ) ( not ( = ?auto_1584 ?auto_1591 ) ) ( not ( = ?auto_1584 ?auto_1594 ) ) ( not ( = ?auto_1584 ?auto_1596 ) ) ( not ( = ?auto_1585 ?auto_1592 ) ) ( not ( = ?auto_1585 ?auto_1599 ) ) ( not ( = ?auto_1585 ?auto_1598 ) ) ( not ( = ?auto_1588 ?auto_1593 ) ) ( not ( = ?auto_1588 ?auto_1595 ) ) ( not ( = ?auto_1588 ?auto_1597 ) ) ( not ( = ?auto_1590 ?auto_1591 ) ) ( not ( = ?auto_1590 ?auto_1594 ) ) ( not ( = ?auto_1590 ?auto_1596 ) ) )
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
      ?auto_1625 - HOIST
      ?auto_1624 - PLACE
      ?auto_1627 - PLACE
      ?auto_1622 - HOIST
      ?auto_1623 - SURFACE
      ?auto_1634 - PLACE
      ?auto_1629 - HOIST
      ?auto_1637 - SURFACE
      ?auto_1632 - PLACE
      ?auto_1631 - HOIST
      ?auto_1630 - SURFACE
      ?auto_1633 - SURFACE
      ?auto_1628 - PLACE
      ?auto_1636 - HOIST
      ?auto_1635 - SURFACE
      ?auto_1626 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1625 ?auto_1624 ) ( IS-CRATE ?auto_1621 ) ( not ( = ?auto_1627 ?auto_1624 ) ) ( HOIST-AT ?auto_1622 ?auto_1627 ) ( SURFACE-AT ?auto_1621 ?auto_1627 ) ( ON ?auto_1621 ?auto_1623 ) ( CLEAR ?auto_1621 ) ( not ( = ?auto_1620 ?auto_1621 ) ) ( not ( = ?auto_1620 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1623 ) ) ( not ( = ?auto_1625 ?auto_1622 ) ) ( IS-CRATE ?auto_1620 ) ( not ( = ?auto_1634 ?auto_1624 ) ) ( HOIST-AT ?auto_1629 ?auto_1634 ) ( AVAILABLE ?auto_1629 ) ( SURFACE-AT ?auto_1620 ?auto_1634 ) ( ON ?auto_1620 ?auto_1637 ) ( CLEAR ?auto_1620 ) ( not ( = ?auto_1619 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1637 ) ) ( not ( = ?auto_1620 ?auto_1637 ) ) ( not ( = ?auto_1625 ?auto_1629 ) ) ( IS-CRATE ?auto_1619 ) ( not ( = ?auto_1632 ?auto_1624 ) ) ( HOIST-AT ?auto_1631 ?auto_1632 ) ( AVAILABLE ?auto_1631 ) ( SURFACE-AT ?auto_1619 ?auto_1632 ) ( ON ?auto_1619 ?auto_1630 ) ( CLEAR ?auto_1619 ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1630 ) ) ( not ( = ?auto_1619 ?auto_1630 ) ) ( not ( = ?auto_1625 ?auto_1631 ) ) ( IS-CRATE ?auto_1618 ) ( AVAILABLE ?auto_1622 ) ( SURFACE-AT ?auto_1618 ?auto_1627 ) ( ON ?auto_1618 ?auto_1633 ) ( CLEAR ?auto_1618 ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( not ( = ?auto_1617 ?auto_1633 ) ) ( not ( = ?auto_1618 ?auto_1633 ) ) ( SURFACE-AT ?auto_1616 ?auto_1624 ) ( CLEAR ?auto_1616 ) ( IS-CRATE ?auto_1617 ) ( AVAILABLE ?auto_1625 ) ( not ( = ?auto_1628 ?auto_1624 ) ) ( HOIST-AT ?auto_1636 ?auto_1628 ) ( AVAILABLE ?auto_1636 ) ( SURFACE-AT ?auto_1617 ?auto_1628 ) ( ON ?auto_1617 ?auto_1635 ) ( CLEAR ?auto_1617 ) ( TRUCK-AT ?auto_1626 ?auto_1624 ) ( not ( = ?auto_1616 ?auto_1617 ) ) ( not ( = ?auto_1616 ?auto_1635 ) ) ( not ( = ?auto_1617 ?auto_1635 ) ) ( not ( = ?auto_1625 ?auto_1636 ) ) ( not ( = ?auto_1616 ?auto_1618 ) ) ( not ( = ?auto_1616 ?auto_1633 ) ) ( not ( = ?auto_1618 ?auto_1635 ) ) ( not ( = ?auto_1627 ?auto_1628 ) ) ( not ( = ?auto_1622 ?auto_1636 ) ) ( not ( = ?auto_1633 ?auto_1635 ) ) ( not ( = ?auto_1616 ?auto_1619 ) ) ( not ( = ?auto_1616 ?auto_1630 ) ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1617 ?auto_1630 ) ) ( not ( = ?auto_1619 ?auto_1633 ) ) ( not ( = ?auto_1619 ?auto_1635 ) ) ( not ( = ?auto_1632 ?auto_1627 ) ) ( not ( = ?auto_1632 ?auto_1628 ) ) ( not ( = ?auto_1631 ?auto_1622 ) ) ( not ( = ?auto_1631 ?auto_1636 ) ) ( not ( = ?auto_1630 ?auto_1633 ) ) ( not ( = ?auto_1630 ?auto_1635 ) ) ( not ( = ?auto_1616 ?auto_1620 ) ) ( not ( = ?auto_1616 ?auto_1637 ) ) ( not ( = ?auto_1617 ?auto_1620 ) ) ( not ( = ?auto_1617 ?auto_1637 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1637 ) ) ( not ( = ?auto_1620 ?auto_1630 ) ) ( not ( = ?auto_1620 ?auto_1633 ) ) ( not ( = ?auto_1620 ?auto_1635 ) ) ( not ( = ?auto_1634 ?auto_1632 ) ) ( not ( = ?auto_1634 ?auto_1627 ) ) ( not ( = ?auto_1634 ?auto_1628 ) ) ( not ( = ?auto_1629 ?auto_1631 ) ) ( not ( = ?auto_1629 ?auto_1622 ) ) ( not ( = ?auto_1629 ?auto_1636 ) ) ( not ( = ?auto_1637 ?auto_1630 ) ) ( not ( = ?auto_1637 ?auto_1633 ) ) ( not ( = ?auto_1637 ?auto_1635 ) ) ( not ( = ?auto_1616 ?auto_1621 ) ) ( not ( = ?auto_1616 ?auto_1623 ) ) ( not ( = ?auto_1617 ?auto_1621 ) ) ( not ( = ?auto_1617 ?auto_1623 ) ) ( not ( = ?auto_1618 ?auto_1621 ) ) ( not ( = ?auto_1618 ?auto_1623 ) ) ( not ( = ?auto_1619 ?auto_1621 ) ) ( not ( = ?auto_1619 ?auto_1623 ) ) ( not ( = ?auto_1621 ?auto_1637 ) ) ( not ( = ?auto_1621 ?auto_1630 ) ) ( not ( = ?auto_1621 ?auto_1633 ) ) ( not ( = ?auto_1621 ?auto_1635 ) ) ( not ( = ?auto_1623 ?auto_1637 ) ) ( not ( = ?auto_1623 ?auto_1630 ) ) ( not ( = ?auto_1623 ?auto_1633 ) ) ( not ( = ?auto_1623 ?auto_1635 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 )
      ( MAKE-1CRATE ?auto_1620 ?auto_1621 )
      ( MAKE-5CRATE-VERIFY ?auto_1616 ?auto_1617 ?auto_1618 ?auto_1619 ?auto_1620 ?auto_1621 ) )
  )

)

