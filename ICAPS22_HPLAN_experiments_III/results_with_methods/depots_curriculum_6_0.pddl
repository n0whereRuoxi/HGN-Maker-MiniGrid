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

  ( :method MAKE-6CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
      ?c6 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( ON ?c6 ?c5 ) ( CLEAR ?c6 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1626 - SURFACE
      ?auto_1627 - SURFACE
    )
    :vars
    (
      ?auto_1628 - HOIST
      ?auto_1629 - PLACE
      ?auto_1631 - PLACE
      ?auto_1632 - HOIST
      ?auto_1633 - SURFACE
      ?auto_1630 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1628 ?auto_1629 ) ( SURFACE-AT ?auto_1626 ?auto_1629 ) ( CLEAR ?auto_1626 ) ( IS-CRATE ?auto_1627 ) ( AVAILABLE ?auto_1628 ) ( not ( = ?auto_1631 ?auto_1629 ) ) ( HOIST-AT ?auto_1632 ?auto_1631 ) ( AVAILABLE ?auto_1632 ) ( SURFACE-AT ?auto_1627 ?auto_1631 ) ( ON ?auto_1627 ?auto_1633 ) ( CLEAR ?auto_1627 ) ( TRUCK-AT ?auto_1630 ?auto_1629 ) ( not ( = ?auto_1626 ?auto_1627 ) ) ( not ( = ?auto_1626 ?auto_1633 ) ) ( not ( = ?auto_1627 ?auto_1633 ) ) ( not ( = ?auto_1628 ?auto_1632 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1630 ?auto_1629 ?auto_1631 )
      ( !LIFT ?auto_1632 ?auto_1627 ?auto_1633 ?auto_1631 )
      ( !LOAD ?auto_1632 ?auto_1627 ?auto_1630 ?auto_1631 )
      ( !DRIVE ?auto_1630 ?auto_1631 ?auto_1629 )
      ( !UNLOAD ?auto_1628 ?auto_1627 ?auto_1630 ?auto_1629 )
      ( !DROP ?auto_1628 ?auto_1627 ?auto_1626 ?auto_1629 )
      ( MAKE-1CRATE-VERIFY ?auto_1626 ?auto_1627 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1636 - SURFACE
      ?auto_1637 - SURFACE
    )
    :vars
    (
      ?auto_1638 - HOIST
      ?auto_1639 - PLACE
      ?auto_1641 - PLACE
      ?auto_1642 - HOIST
      ?auto_1643 - SURFACE
      ?auto_1640 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1638 ?auto_1639 ) ( SURFACE-AT ?auto_1636 ?auto_1639 ) ( CLEAR ?auto_1636 ) ( IS-CRATE ?auto_1637 ) ( AVAILABLE ?auto_1638 ) ( not ( = ?auto_1641 ?auto_1639 ) ) ( HOIST-AT ?auto_1642 ?auto_1641 ) ( AVAILABLE ?auto_1642 ) ( SURFACE-AT ?auto_1637 ?auto_1641 ) ( ON ?auto_1637 ?auto_1643 ) ( CLEAR ?auto_1637 ) ( TRUCK-AT ?auto_1640 ?auto_1639 ) ( not ( = ?auto_1636 ?auto_1637 ) ) ( not ( = ?auto_1636 ?auto_1643 ) ) ( not ( = ?auto_1637 ?auto_1643 ) ) ( not ( = ?auto_1638 ?auto_1642 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1640 ?auto_1639 ?auto_1641 )
      ( !LIFT ?auto_1642 ?auto_1637 ?auto_1643 ?auto_1641 )
      ( !LOAD ?auto_1642 ?auto_1637 ?auto_1640 ?auto_1641 )
      ( !DRIVE ?auto_1640 ?auto_1641 ?auto_1639 )
      ( !UNLOAD ?auto_1638 ?auto_1637 ?auto_1640 ?auto_1639 )
      ( !DROP ?auto_1638 ?auto_1637 ?auto_1636 ?auto_1639 )
      ( MAKE-1CRATE-VERIFY ?auto_1636 ?auto_1637 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1647 - SURFACE
      ?auto_1648 - SURFACE
      ?auto_1649 - SURFACE
    )
    :vars
    (
      ?auto_1655 - HOIST
      ?auto_1653 - PLACE
      ?auto_1652 - PLACE
      ?auto_1651 - HOIST
      ?auto_1650 - SURFACE
      ?auto_1656 - PLACE
      ?auto_1658 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1654 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1655 ?auto_1653 ) ( IS-CRATE ?auto_1649 ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( HOIST-AT ?auto_1651 ?auto_1652 ) ( AVAILABLE ?auto_1651 ) ( SURFACE-AT ?auto_1649 ?auto_1652 ) ( ON ?auto_1649 ?auto_1650 ) ( CLEAR ?auto_1649 ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( not ( = ?auto_1648 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1650 ) ) ( not ( = ?auto_1655 ?auto_1651 ) ) ( SURFACE-AT ?auto_1647 ?auto_1653 ) ( CLEAR ?auto_1647 ) ( IS-CRATE ?auto_1648 ) ( AVAILABLE ?auto_1655 ) ( not ( = ?auto_1656 ?auto_1653 ) ) ( HOIST-AT ?auto_1658 ?auto_1656 ) ( AVAILABLE ?auto_1658 ) ( SURFACE-AT ?auto_1648 ?auto_1656 ) ( ON ?auto_1648 ?auto_1657 ) ( CLEAR ?auto_1648 ) ( TRUCK-AT ?auto_1654 ?auto_1653 ) ( not ( = ?auto_1647 ?auto_1648 ) ) ( not ( = ?auto_1647 ?auto_1657 ) ) ( not ( = ?auto_1648 ?auto_1657 ) ) ( not ( = ?auto_1655 ?auto_1658 ) ) ( not ( = ?auto_1647 ?auto_1649 ) ) ( not ( = ?auto_1647 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1656 ) ) ( not ( = ?auto_1651 ?auto_1658 ) ) ( not ( = ?auto_1650 ?auto_1657 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1647 ?auto_1648 )
      ( MAKE-1CRATE ?auto_1648 ?auto_1649 )
      ( MAKE-2CRATE-VERIFY ?auto_1647 ?auto_1648 ?auto_1649 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1661 - SURFACE
      ?auto_1662 - SURFACE
    )
    :vars
    (
      ?auto_1663 - HOIST
      ?auto_1664 - PLACE
      ?auto_1666 - PLACE
      ?auto_1667 - HOIST
      ?auto_1668 - SURFACE
      ?auto_1665 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1663 ?auto_1664 ) ( SURFACE-AT ?auto_1661 ?auto_1664 ) ( CLEAR ?auto_1661 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1663 ) ( not ( = ?auto_1666 ?auto_1664 ) ) ( HOIST-AT ?auto_1667 ?auto_1666 ) ( AVAILABLE ?auto_1667 ) ( SURFACE-AT ?auto_1662 ?auto_1666 ) ( ON ?auto_1662 ?auto_1668 ) ( CLEAR ?auto_1662 ) ( TRUCK-AT ?auto_1665 ?auto_1664 ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( not ( = ?auto_1661 ?auto_1668 ) ) ( not ( = ?auto_1662 ?auto_1668 ) ) ( not ( = ?auto_1663 ?auto_1667 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1665 ?auto_1664 ?auto_1666 )
      ( !LIFT ?auto_1667 ?auto_1662 ?auto_1668 ?auto_1666 )
      ( !LOAD ?auto_1667 ?auto_1662 ?auto_1665 ?auto_1666 )
      ( !DRIVE ?auto_1665 ?auto_1666 ?auto_1664 )
      ( !UNLOAD ?auto_1663 ?auto_1662 ?auto_1665 ?auto_1664 )
      ( !DROP ?auto_1663 ?auto_1662 ?auto_1661 ?auto_1664 )
      ( MAKE-1CRATE-VERIFY ?auto_1661 ?auto_1662 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1673 - SURFACE
      ?auto_1674 - SURFACE
      ?auto_1675 - SURFACE
      ?auto_1676 - SURFACE
    )
    :vars
    (
      ?auto_1682 - HOIST
      ?auto_1680 - PLACE
      ?auto_1677 - PLACE
      ?auto_1678 - HOIST
      ?auto_1681 - SURFACE
      ?auto_1685 - PLACE
      ?auto_1686 - HOIST
      ?auto_1684 - SURFACE
      ?auto_1683 - SURFACE
      ?auto_1679 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1682 ?auto_1680 ) ( IS-CRATE ?auto_1676 ) ( not ( = ?auto_1677 ?auto_1680 ) ) ( HOIST-AT ?auto_1678 ?auto_1677 ) ( SURFACE-AT ?auto_1676 ?auto_1677 ) ( ON ?auto_1676 ?auto_1681 ) ( CLEAR ?auto_1676 ) ( not ( = ?auto_1675 ?auto_1676 ) ) ( not ( = ?auto_1675 ?auto_1681 ) ) ( not ( = ?auto_1676 ?auto_1681 ) ) ( not ( = ?auto_1682 ?auto_1678 ) ) ( IS-CRATE ?auto_1675 ) ( not ( = ?auto_1685 ?auto_1680 ) ) ( HOIST-AT ?auto_1686 ?auto_1685 ) ( AVAILABLE ?auto_1686 ) ( SURFACE-AT ?auto_1675 ?auto_1685 ) ( ON ?auto_1675 ?auto_1684 ) ( CLEAR ?auto_1675 ) ( not ( = ?auto_1674 ?auto_1675 ) ) ( not ( = ?auto_1674 ?auto_1684 ) ) ( not ( = ?auto_1675 ?auto_1684 ) ) ( not ( = ?auto_1682 ?auto_1686 ) ) ( SURFACE-AT ?auto_1673 ?auto_1680 ) ( CLEAR ?auto_1673 ) ( IS-CRATE ?auto_1674 ) ( AVAILABLE ?auto_1682 ) ( AVAILABLE ?auto_1678 ) ( SURFACE-AT ?auto_1674 ?auto_1677 ) ( ON ?auto_1674 ?auto_1683 ) ( CLEAR ?auto_1674 ) ( TRUCK-AT ?auto_1679 ?auto_1680 ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1683 ) ) ( not ( = ?auto_1674 ?auto_1683 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1673 ?auto_1684 ) ) ( not ( = ?auto_1675 ?auto_1683 ) ) ( not ( = ?auto_1685 ?auto_1677 ) ) ( not ( = ?auto_1686 ?auto_1678 ) ) ( not ( = ?auto_1684 ?auto_1683 ) ) ( not ( = ?auto_1673 ?auto_1676 ) ) ( not ( = ?auto_1673 ?auto_1681 ) ) ( not ( = ?auto_1674 ?auto_1676 ) ) ( not ( = ?auto_1674 ?auto_1681 ) ) ( not ( = ?auto_1676 ?auto_1684 ) ) ( not ( = ?auto_1676 ?auto_1683 ) ) ( not ( = ?auto_1681 ?auto_1684 ) ) ( not ( = ?auto_1681 ?auto_1683 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1673 ?auto_1674 ?auto_1675 )
      ( MAKE-1CRATE ?auto_1675 ?auto_1676 )
      ( MAKE-3CRATE-VERIFY ?auto_1673 ?auto_1674 ?auto_1675 ?auto_1676 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1689 - SURFACE
      ?auto_1690 - SURFACE
    )
    :vars
    (
      ?auto_1691 - HOIST
      ?auto_1692 - PLACE
      ?auto_1694 - PLACE
      ?auto_1695 - HOIST
      ?auto_1696 - SURFACE
      ?auto_1693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1691 ?auto_1692 ) ( SURFACE-AT ?auto_1689 ?auto_1692 ) ( CLEAR ?auto_1689 ) ( IS-CRATE ?auto_1690 ) ( AVAILABLE ?auto_1691 ) ( not ( = ?auto_1694 ?auto_1692 ) ) ( HOIST-AT ?auto_1695 ?auto_1694 ) ( AVAILABLE ?auto_1695 ) ( SURFACE-AT ?auto_1690 ?auto_1694 ) ( ON ?auto_1690 ?auto_1696 ) ( CLEAR ?auto_1690 ) ( TRUCK-AT ?auto_1693 ?auto_1692 ) ( not ( = ?auto_1689 ?auto_1690 ) ) ( not ( = ?auto_1689 ?auto_1696 ) ) ( not ( = ?auto_1690 ?auto_1696 ) ) ( not ( = ?auto_1691 ?auto_1695 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1693 ?auto_1692 ?auto_1694 )
      ( !LIFT ?auto_1695 ?auto_1690 ?auto_1696 ?auto_1694 )
      ( !LOAD ?auto_1695 ?auto_1690 ?auto_1693 ?auto_1694 )
      ( !DRIVE ?auto_1693 ?auto_1694 ?auto_1692 )
      ( !UNLOAD ?auto_1691 ?auto_1690 ?auto_1693 ?auto_1692 )
      ( !DROP ?auto_1691 ?auto_1690 ?auto_1689 ?auto_1692 )
      ( MAKE-1CRATE-VERIFY ?auto_1689 ?auto_1690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1702 - SURFACE
      ?auto_1703 - SURFACE
      ?auto_1704 - SURFACE
      ?auto_1705 - SURFACE
      ?auto_1706 - SURFACE
    )
    :vars
    (
      ?auto_1712 - HOIST
      ?auto_1709 - PLACE
      ?auto_1710 - PLACE
      ?auto_1708 - HOIST
      ?auto_1707 - SURFACE
      ?auto_1714 - PLACE
      ?auto_1716 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1715 - PLACE
      ?auto_1717 - HOIST
      ?auto_1713 - SURFACE
      ?auto_1718 - SURFACE
      ?auto_1711 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1712 ?auto_1709 ) ( IS-CRATE ?auto_1706 ) ( not ( = ?auto_1710 ?auto_1709 ) ) ( HOIST-AT ?auto_1708 ?auto_1710 ) ( AVAILABLE ?auto_1708 ) ( SURFACE-AT ?auto_1706 ?auto_1710 ) ( ON ?auto_1706 ?auto_1707 ) ( CLEAR ?auto_1706 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( not ( = ?auto_1712 ?auto_1708 ) ) ( IS-CRATE ?auto_1705 ) ( not ( = ?auto_1714 ?auto_1709 ) ) ( HOIST-AT ?auto_1716 ?auto_1714 ) ( SURFACE-AT ?auto_1705 ?auto_1714 ) ( ON ?auto_1705 ?auto_1719 ) ( CLEAR ?auto_1705 ) ( not ( = ?auto_1704 ?auto_1705 ) ) ( not ( = ?auto_1704 ?auto_1719 ) ) ( not ( = ?auto_1705 ?auto_1719 ) ) ( not ( = ?auto_1712 ?auto_1716 ) ) ( IS-CRATE ?auto_1704 ) ( not ( = ?auto_1715 ?auto_1709 ) ) ( HOIST-AT ?auto_1717 ?auto_1715 ) ( AVAILABLE ?auto_1717 ) ( SURFACE-AT ?auto_1704 ?auto_1715 ) ( ON ?auto_1704 ?auto_1713 ) ( CLEAR ?auto_1704 ) ( not ( = ?auto_1703 ?auto_1704 ) ) ( not ( = ?auto_1703 ?auto_1713 ) ) ( not ( = ?auto_1704 ?auto_1713 ) ) ( not ( = ?auto_1712 ?auto_1717 ) ) ( SURFACE-AT ?auto_1702 ?auto_1709 ) ( CLEAR ?auto_1702 ) ( IS-CRATE ?auto_1703 ) ( AVAILABLE ?auto_1712 ) ( AVAILABLE ?auto_1716 ) ( SURFACE-AT ?auto_1703 ?auto_1714 ) ( ON ?auto_1703 ?auto_1718 ) ( CLEAR ?auto_1703 ) ( TRUCK-AT ?auto_1711 ?auto_1709 ) ( not ( = ?auto_1702 ?auto_1703 ) ) ( not ( = ?auto_1702 ?auto_1718 ) ) ( not ( = ?auto_1703 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1704 ) ) ( not ( = ?auto_1702 ?auto_1713 ) ) ( not ( = ?auto_1704 ?auto_1718 ) ) ( not ( = ?auto_1715 ?auto_1714 ) ) ( not ( = ?auto_1717 ?auto_1716 ) ) ( not ( = ?auto_1713 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1705 ) ) ( not ( = ?auto_1702 ?auto_1719 ) ) ( not ( = ?auto_1703 ?auto_1705 ) ) ( not ( = ?auto_1703 ?auto_1719 ) ) ( not ( = ?auto_1705 ?auto_1713 ) ) ( not ( = ?auto_1705 ?auto_1718 ) ) ( not ( = ?auto_1719 ?auto_1713 ) ) ( not ( = ?auto_1719 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1706 ) ) ( not ( = ?auto_1702 ?auto_1707 ) ) ( not ( = ?auto_1703 ?auto_1706 ) ) ( not ( = ?auto_1703 ?auto_1707 ) ) ( not ( = ?auto_1704 ?auto_1706 ) ) ( not ( = ?auto_1704 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1719 ) ) ( not ( = ?auto_1706 ?auto_1713 ) ) ( not ( = ?auto_1706 ?auto_1718 ) ) ( not ( = ?auto_1710 ?auto_1714 ) ) ( not ( = ?auto_1710 ?auto_1715 ) ) ( not ( = ?auto_1708 ?auto_1716 ) ) ( not ( = ?auto_1708 ?auto_1717 ) ) ( not ( = ?auto_1707 ?auto_1719 ) ) ( not ( = ?auto_1707 ?auto_1713 ) ) ( not ( = ?auto_1707 ?auto_1718 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1702 ?auto_1703 ?auto_1704 ?auto_1705 )
      ( MAKE-1CRATE ?auto_1705 ?auto_1706 )
      ( MAKE-4CRATE-VERIFY ?auto_1702 ?auto_1703 ?auto_1704 ?auto_1705 ?auto_1706 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1722 - SURFACE
      ?auto_1723 - SURFACE
    )
    :vars
    (
      ?auto_1724 - HOIST
      ?auto_1725 - PLACE
      ?auto_1727 - PLACE
      ?auto_1728 - HOIST
      ?auto_1729 - SURFACE
      ?auto_1726 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1724 ?auto_1725 ) ( SURFACE-AT ?auto_1722 ?auto_1725 ) ( CLEAR ?auto_1722 ) ( IS-CRATE ?auto_1723 ) ( AVAILABLE ?auto_1724 ) ( not ( = ?auto_1727 ?auto_1725 ) ) ( HOIST-AT ?auto_1728 ?auto_1727 ) ( AVAILABLE ?auto_1728 ) ( SURFACE-AT ?auto_1723 ?auto_1727 ) ( ON ?auto_1723 ?auto_1729 ) ( CLEAR ?auto_1723 ) ( TRUCK-AT ?auto_1726 ?auto_1725 ) ( not ( = ?auto_1722 ?auto_1723 ) ) ( not ( = ?auto_1722 ?auto_1729 ) ) ( not ( = ?auto_1723 ?auto_1729 ) ) ( not ( = ?auto_1724 ?auto_1728 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1726 ?auto_1725 ?auto_1727 )
      ( !LIFT ?auto_1728 ?auto_1723 ?auto_1729 ?auto_1727 )
      ( !LOAD ?auto_1728 ?auto_1723 ?auto_1726 ?auto_1727 )
      ( !DRIVE ?auto_1726 ?auto_1727 ?auto_1725 )
      ( !UNLOAD ?auto_1724 ?auto_1723 ?auto_1726 ?auto_1725 )
      ( !DROP ?auto_1724 ?auto_1723 ?auto_1722 ?auto_1725 )
      ( MAKE-1CRATE-VERIFY ?auto_1722 ?auto_1723 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1736 - SURFACE
      ?auto_1737 - SURFACE
      ?auto_1738 - SURFACE
      ?auto_1739 - SURFACE
      ?auto_1740 - SURFACE
      ?auto_1741 - SURFACE
    )
    :vars
    (
      ?auto_1742 - HOIST
      ?auto_1746 - PLACE
      ?auto_1747 - PLACE
      ?auto_1744 - HOIST
      ?auto_1743 - SURFACE
      ?auto_1755 - SURFACE
      ?auto_1749 - PLACE
      ?auto_1753 - HOIST
      ?auto_1751 - SURFACE
      ?auto_1752 - PLACE
      ?auto_1750 - HOIST
      ?auto_1754 - SURFACE
      ?auto_1748 - SURFACE
      ?auto_1745 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1742 ?auto_1746 ) ( IS-CRATE ?auto_1741 ) ( not ( = ?auto_1747 ?auto_1746 ) ) ( HOIST-AT ?auto_1744 ?auto_1747 ) ( SURFACE-AT ?auto_1741 ?auto_1747 ) ( ON ?auto_1741 ?auto_1743 ) ( CLEAR ?auto_1741 ) ( not ( = ?auto_1740 ?auto_1741 ) ) ( not ( = ?auto_1740 ?auto_1743 ) ) ( not ( = ?auto_1741 ?auto_1743 ) ) ( not ( = ?auto_1742 ?auto_1744 ) ) ( IS-CRATE ?auto_1740 ) ( AVAILABLE ?auto_1744 ) ( SURFACE-AT ?auto_1740 ?auto_1747 ) ( ON ?auto_1740 ?auto_1755 ) ( CLEAR ?auto_1740 ) ( not ( = ?auto_1739 ?auto_1740 ) ) ( not ( = ?auto_1739 ?auto_1755 ) ) ( not ( = ?auto_1740 ?auto_1755 ) ) ( IS-CRATE ?auto_1739 ) ( not ( = ?auto_1749 ?auto_1746 ) ) ( HOIST-AT ?auto_1753 ?auto_1749 ) ( SURFACE-AT ?auto_1739 ?auto_1749 ) ( ON ?auto_1739 ?auto_1751 ) ( CLEAR ?auto_1739 ) ( not ( = ?auto_1738 ?auto_1739 ) ) ( not ( = ?auto_1738 ?auto_1751 ) ) ( not ( = ?auto_1739 ?auto_1751 ) ) ( not ( = ?auto_1742 ?auto_1753 ) ) ( IS-CRATE ?auto_1738 ) ( not ( = ?auto_1752 ?auto_1746 ) ) ( HOIST-AT ?auto_1750 ?auto_1752 ) ( AVAILABLE ?auto_1750 ) ( SURFACE-AT ?auto_1738 ?auto_1752 ) ( ON ?auto_1738 ?auto_1754 ) ( CLEAR ?auto_1738 ) ( not ( = ?auto_1737 ?auto_1738 ) ) ( not ( = ?auto_1737 ?auto_1754 ) ) ( not ( = ?auto_1738 ?auto_1754 ) ) ( not ( = ?auto_1742 ?auto_1750 ) ) ( SURFACE-AT ?auto_1736 ?auto_1746 ) ( CLEAR ?auto_1736 ) ( IS-CRATE ?auto_1737 ) ( AVAILABLE ?auto_1742 ) ( AVAILABLE ?auto_1753 ) ( SURFACE-AT ?auto_1737 ?auto_1749 ) ( ON ?auto_1737 ?auto_1748 ) ( CLEAR ?auto_1737 ) ( TRUCK-AT ?auto_1745 ?auto_1746 ) ( not ( = ?auto_1736 ?auto_1737 ) ) ( not ( = ?auto_1736 ?auto_1748 ) ) ( not ( = ?auto_1737 ?auto_1748 ) ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1736 ?auto_1754 ) ) ( not ( = ?auto_1738 ?auto_1748 ) ) ( not ( = ?auto_1752 ?auto_1749 ) ) ( not ( = ?auto_1750 ?auto_1753 ) ) ( not ( = ?auto_1754 ?auto_1748 ) ) ( not ( = ?auto_1736 ?auto_1739 ) ) ( not ( = ?auto_1736 ?auto_1751 ) ) ( not ( = ?auto_1737 ?auto_1739 ) ) ( not ( = ?auto_1737 ?auto_1751 ) ) ( not ( = ?auto_1739 ?auto_1754 ) ) ( not ( = ?auto_1739 ?auto_1748 ) ) ( not ( = ?auto_1751 ?auto_1754 ) ) ( not ( = ?auto_1751 ?auto_1748 ) ) ( not ( = ?auto_1736 ?auto_1740 ) ) ( not ( = ?auto_1736 ?auto_1755 ) ) ( not ( = ?auto_1737 ?auto_1740 ) ) ( not ( = ?auto_1737 ?auto_1755 ) ) ( not ( = ?auto_1738 ?auto_1740 ) ) ( not ( = ?auto_1738 ?auto_1755 ) ) ( not ( = ?auto_1740 ?auto_1751 ) ) ( not ( = ?auto_1740 ?auto_1754 ) ) ( not ( = ?auto_1740 ?auto_1748 ) ) ( not ( = ?auto_1747 ?auto_1749 ) ) ( not ( = ?auto_1747 ?auto_1752 ) ) ( not ( = ?auto_1744 ?auto_1753 ) ) ( not ( = ?auto_1744 ?auto_1750 ) ) ( not ( = ?auto_1755 ?auto_1751 ) ) ( not ( = ?auto_1755 ?auto_1754 ) ) ( not ( = ?auto_1755 ?auto_1748 ) ) ( not ( = ?auto_1736 ?auto_1741 ) ) ( not ( = ?auto_1736 ?auto_1743 ) ) ( not ( = ?auto_1737 ?auto_1741 ) ) ( not ( = ?auto_1737 ?auto_1743 ) ) ( not ( = ?auto_1738 ?auto_1741 ) ) ( not ( = ?auto_1738 ?auto_1743 ) ) ( not ( = ?auto_1739 ?auto_1741 ) ) ( not ( = ?auto_1739 ?auto_1743 ) ) ( not ( = ?auto_1741 ?auto_1755 ) ) ( not ( = ?auto_1741 ?auto_1751 ) ) ( not ( = ?auto_1741 ?auto_1754 ) ) ( not ( = ?auto_1741 ?auto_1748 ) ) ( not ( = ?auto_1743 ?auto_1755 ) ) ( not ( = ?auto_1743 ?auto_1751 ) ) ( not ( = ?auto_1743 ?auto_1754 ) ) ( not ( = ?auto_1743 ?auto_1748 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1736 ?auto_1737 ?auto_1738 ?auto_1739 ?auto_1740 )
      ( MAKE-1CRATE ?auto_1740 ?auto_1741 )
      ( MAKE-5CRATE-VERIFY ?auto_1736 ?auto_1737 ?auto_1738 ?auto_1739 ?auto_1740 ?auto_1741 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1758 - SURFACE
      ?auto_1759 - SURFACE
    )
    :vars
    (
      ?auto_1760 - HOIST
      ?auto_1761 - PLACE
      ?auto_1763 - PLACE
      ?auto_1764 - HOIST
      ?auto_1765 - SURFACE
      ?auto_1762 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1760 ?auto_1761 ) ( SURFACE-AT ?auto_1758 ?auto_1761 ) ( CLEAR ?auto_1758 ) ( IS-CRATE ?auto_1759 ) ( AVAILABLE ?auto_1760 ) ( not ( = ?auto_1763 ?auto_1761 ) ) ( HOIST-AT ?auto_1764 ?auto_1763 ) ( AVAILABLE ?auto_1764 ) ( SURFACE-AT ?auto_1759 ?auto_1763 ) ( ON ?auto_1759 ?auto_1765 ) ( CLEAR ?auto_1759 ) ( TRUCK-AT ?auto_1762 ?auto_1761 ) ( not ( = ?auto_1758 ?auto_1759 ) ) ( not ( = ?auto_1758 ?auto_1765 ) ) ( not ( = ?auto_1759 ?auto_1765 ) ) ( not ( = ?auto_1760 ?auto_1764 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1762 ?auto_1761 ?auto_1763 )
      ( !LIFT ?auto_1764 ?auto_1759 ?auto_1765 ?auto_1763 )
      ( !LOAD ?auto_1764 ?auto_1759 ?auto_1762 ?auto_1763 )
      ( !DRIVE ?auto_1762 ?auto_1763 ?auto_1761 )
      ( !UNLOAD ?auto_1760 ?auto_1759 ?auto_1762 ?auto_1761 )
      ( !DROP ?auto_1760 ?auto_1759 ?auto_1758 ?auto_1761 )
      ( MAKE-1CRATE-VERIFY ?auto_1758 ?auto_1759 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1773 - SURFACE
      ?auto_1774 - SURFACE
      ?auto_1775 - SURFACE
      ?auto_1776 - SURFACE
      ?auto_1777 - SURFACE
      ?auto_1778 - SURFACE
      ?auto_1779 - SURFACE
    )
    :vars
    (
      ?auto_1784 - HOIST
      ?auto_1780 - PLACE
      ?auto_1781 - PLACE
      ?auto_1783 - HOIST
      ?auto_1785 - SURFACE
      ?auto_1792 - SURFACE
      ?auto_1787 - SURFACE
      ?auto_1790 - PLACE
      ?auto_1794 - HOIST
      ?auto_1786 - SURFACE
      ?auto_1793 - PLACE
      ?auto_1788 - HOIST
      ?auto_1789 - SURFACE
      ?auto_1791 - SURFACE
      ?auto_1782 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1784 ?auto_1780 ) ( IS-CRATE ?auto_1779 ) ( not ( = ?auto_1781 ?auto_1780 ) ) ( HOIST-AT ?auto_1783 ?auto_1781 ) ( SURFACE-AT ?auto_1779 ?auto_1781 ) ( ON ?auto_1779 ?auto_1785 ) ( CLEAR ?auto_1779 ) ( not ( = ?auto_1778 ?auto_1779 ) ) ( not ( = ?auto_1778 ?auto_1785 ) ) ( not ( = ?auto_1779 ?auto_1785 ) ) ( not ( = ?auto_1784 ?auto_1783 ) ) ( IS-CRATE ?auto_1778 ) ( SURFACE-AT ?auto_1778 ?auto_1781 ) ( ON ?auto_1778 ?auto_1792 ) ( CLEAR ?auto_1778 ) ( not ( = ?auto_1777 ?auto_1778 ) ) ( not ( = ?auto_1777 ?auto_1792 ) ) ( not ( = ?auto_1778 ?auto_1792 ) ) ( IS-CRATE ?auto_1777 ) ( AVAILABLE ?auto_1783 ) ( SURFACE-AT ?auto_1777 ?auto_1781 ) ( ON ?auto_1777 ?auto_1787 ) ( CLEAR ?auto_1777 ) ( not ( = ?auto_1776 ?auto_1777 ) ) ( not ( = ?auto_1776 ?auto_1787 ) ) ( not ( = ?auto_1777 ?auto_1787 ) ) ( IS-CRATE ?auto_1776 ) ( not ( = ?auto_1790 ?auto_1780 ) ) ( HOIST-AT ?auto_1794 ?auto_1790 ) ( SURFACE-AT ?auto_1776 ?auto_1790 ) ( ON ?auto_1776 ?auto_1786 ) ( CLEAR ?auto_1776 ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1786 ) ) ( not ( = ?auto_1776 ?auto_1786 ) ) ( not ( = ?auto_1784 ?auto_1794 ) ) ( IS-CRATE ?auto_1775 ) ( not ( = ?auto_1793 ?auto_1780 ) ) ( HOIST-AT ?auto_1788 ?auto_1793 ) ( AVAILABLE ?auto_1788 ) ( SURFACE-AT ?auto_1775 ?auto_1793 ) ( ON ?auto_1775 ?auto_1789 ) ( CLEAR ?auto_1775 ) ( not ( = ?auto_1774 ?auto_1775 ) ) ( not ( = ?auto_1774 ?auto_1789 ) ) ( not ( = ?auto_1775 ?auto_1789 ) ) ( not ( = ?auto_1784 ?auto_1788 ) ) ( SURFACE-AT ?auto_1773 ?auto_1780 ) ( CLEAR ?auto_1773 ) ( IS-CRATE ?auto_1774 ) ( AVAILABLE ?auto_1784 ) ( AVAILABLE ?auto_1794 ) ( SURFACE-AT ?auto_1774 ?auto_1790 ) ( ON ?auto_1774 ?auto_1791 ) ( CLEAR ?auto_1774 ) ( TRUCK-AT ?auto_1782 ?auto_1780 ) ( not ( = ?auto_1773 ?auto_1774 ) ) ( not ( = ?auto_1773 ?auto_1791 ) ) ( not ( = ?auto_1774 ?auto_1791 ) ) ( not ( = ?auto_1773 ?auto_1775 ) ) ( not ( = ?auto_1773 ?auto_1789 ) ) ( not ( = ?auto_1775 ?auto_1791 ) ) ( not ( = ?auto_1793 ?auto_1790 ) ) ( not ( = ?auto_1788 ?auto_1794 ) ) ( not ( = ?auto_1789 ?auto_1791 ) ) ( not ( = ?auto_1773 ?auto_1776 ) ) ( not ( = ?auto_1773 ?auto_1786 ) ) ( not ( = ?auto_1774 ?auto_1776 ) ) ( not ( = ?auto_1774 ?auto_1786 ) ) ( not ( = ?auto_1776 ?auto_1789 ) ) ( not ( = ?auto_1776 ?auto_1791 ) ) ( not ( = ?auto_1786 ?auto_1789 ) ) ( not ( = ?auto_1786 ?auto_1791 ) ) ( not ( = ?auto_1773 ?auto_1777 ) ) ( not ( = ?auto_1773 ?auto_1787 ) ) ( not ( = ?auto_1774 ?auto_1777 ) ) ( not ( = ?auto_1774 ?auto_1787 ) ) ( not ( = ?auto_1775 ?auto_1777 ) ) ( not ( = ?auto_1775 ?auto_1787 ) ) ( not ( = ?auto_1777 ?auto_1786 ) ) ( not ( = ?auto_1777 ?auto_1789 ) ) ( not ( = ?auto_1777 ?auto_1791 ) ) ( not ( = ?auto_1781 ?auto_1790 ) ) ( not ( = ?auto_1781 ?auto_1793 ) ) ( not ( = ?auto_1783 ?auto_1794 ) ) ( not ( = ?auto_1783 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1786 ) ) ( not ( = ?auto_1787 ?auto_1789 ) ) ( not ( = ?auto_1787 ?auto_1791 ) ) ( not ( = ?auto_1773 ?auto_1778 ) ) ( not ( = ?auto_1773 ?auto_1792 ) ) ( not ( = ?auto_1774 ?auto_1778 ) ) ( not ( = ?auto_1774 ?auto_1792 ) ) ( not ( = ?auto_1775 ?auto_1778 ) ) ( not ( = ?auto_1775 ?auto_1792 ) ) ( not ( = ?auto_1776 ?auto_1778 ) ) ( not ( = ?auto_1776 ?auto_1792 ) ) ( not ( = ?auto_1778 ?auto_1787 ) ) ( not ( = ?auto_1778 ?auto_1786 ) ) ( not ( = ?auto_1778 ?auto_1789 ) ) ( not ( = ?auto_1778 ?auto_1791 ) ) ( not ( = ?auto_1792 ?auto_1787 ) ) ( not ( = ?auto_1792 ?auto_1786 ) ) ( not ( = ?auto_1792 ?auto_1789 ) ) ( not ( = ?auto_1792 ?auto_1791 ) ) ( not ( = ?auto_1773 ?auto_1779 ) ) ( not ( = ?auto_1773 ?auto_1785 ) ) ( not ( = ?auto_1774 ?auto_1779 ) ) ( not ( = ?auto_1774 ?auto_1785 ) ) ( not ( = ?auto_1775 ?auto_1779 ) ) ( not ( = ?auto_1775 ?auto_1785 ) ) ( not ( = ?auto_1776 ?auto_1779 ) ) ( not ( = ?auto_1776 ?auto_1785 ) ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1777 ?auto_1785 ) ) ( not ( = ?auto_1779 ?auto_1792 ) ) ( not ( = ?auto_1779 ?auto_1787 ) ) ( not ( = ?auto_1779 ?auto_1786 ) ) ( not ( = ?auto_1779 ?auto_1789 ) ) ( not ( = ?auto_1779 ?auto_1791 ) ) ( not ( = ?auto_1785 ?auto_1792 ) ) ( not ( = ?auto_1785 ?auto_1787 ) ) ( not ( = ?auto_1785 ?auto_1786 ) ) ( not ( = ?auto_1785 ?auto_1789 ) ) ( not ( = ?auto_1785 ?auto_1791 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1773 ?auto_1774 ?auto_1775 ?auto_1776 ?auto_1777 ?auto_1778 )
      ( MAKE-1CRATE ?auto_1778 ?auto_1779 )
      ( MAKE-6CRATE-VERIFY ?auto_1773 ?auto_1774 ?auto_1775 ?auto_1776 ?auto_1777 ?auto_1778 ?auto_1779 ) )
  )

)

