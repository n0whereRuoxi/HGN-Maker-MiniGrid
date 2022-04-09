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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1647 - SURFACE
      ?auto_1648 - SURFACE
      ?auto_1649 - SURFACE
    )
    :vars
    (
      ?auto_1652 - HOIST
      ?auto_1655 - PLACE
      ?auto_1654 - PLACE
      ?auto_1653 - HOIST
      ?auto_1651 - SURFACE
      ?auto_1658 - PLACE
      ?auto_1656 - HOIST
      ?auto_1657 - SURFACE
      ?auto_1650 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1652 ?auto_1655 ) ( IS-CRATE ?auto_1649 ) ( not ( = ?auto_1654 ?auto_1655 ) ) ( HOIST-AT ?auto_1653 ?auto_1654 ) ( AVAILABLE ?auto_1653 ) ( SURFACE-AT ?auto_1649 ?auto_1654 ) ( ON ?auto_1649 ?auto_1651 ) ( CLEAR ?auto_1649 ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( not ( = ?auto_1648 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1651 ) ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( SURFACE-AT ?auto_1647 ?auto_1655 ) ( CLEAR ?auto_1647 ) ( IS-CRATE ?auto_1648 ) ( AVAILABLE ?auto_1652 ) ( not ( = ?auto_1658 ?auto_1655 ) ) ( HOIST-AT ?auto_1656 ?auto_1658 ) ( AVAILABLE ?auto_1656 ) ( SURFACE-AT ?auto_1648 ?auto_1658 ) ( ON ?auto_1648 ?auto_1657 ) ( CLEAR ?auto_1648 ) ( TRUCK-AT ?auto_1650 ?auto_1655 ) ( not ( = ?auto_1647 ?auto_1648 ) ) ( not ( = ?auto_1647 ?auto_1657 ) ) ( not ( = ?auto_1648 ?auto_1657 ) ) ( not ( = ?auto_1652 ?auto_1656 ) ) ( not ( = ?auto_1647 ?auto_1649 ) ) ( not ( = ?auto_1647 ?auto_1651 ) ) ( not ( = ?auto_1649 ?auto_1657 ) ) ( not ( = ?auto_1654 ?auto_1658 ) ) ( not ( = ?auto_1653 ?auto_1656 ) ) ( not ( = ?auto_1651 ?auto_1657 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1647 ?auto_1648 )
      ( MAKE-1CRATE ?auto_1648 ?auto_1649 )
      ( MAKE-2CRATE-VERIFY ?auto_1647 ?auto_1648 ?auto_1649 ) )
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
      ?auto_1680 - HOIST
      ?auto_1677 - PLACE
      ?auto_1682 - PLACE
      ?auto_1679 - HOIST
      ?auto_1681 - SURFACE
      ?auto_1683 - PLACE
      ?auto_1685 - HOIST
      ?auto_1686 - SURFACE
      ?auto_1684 - SURFACE
      ?auto_1678 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1680 ?auto_1677 ) ( IS-CRATE ?auto_1676 ) ( not ( = ?auto_1682 ?auto_1677 ) ) ( HOIST-AT ?auto_1679 ?auto_1682 ) ( SURFACE-AT ?auto_1676 ?auto_1682 ) ( ON ?auto_1676 ?auto_1681 ) ( CLEAR ?auto_1676 ) ( not ( = ?auto_1675 ?auto_1676 ) ) ( not ( = ?auto_1675 ?auto_1681 ) ) ( not ( = ?auto_1676 ?auto_1681 ) ) ( not ( = ?auto_1680 ?auto_1679 ) ) ( IS-CRATE ?auto_1675 ) ( not ( = ?auto_1683 ?auto_1677 ) ) ( HOIST-AT ?auto_1685 ?auto_1683 ) ( AVAILABLE ?auto_1685 ) ( SURFACE-AT ?auto_1675 ?auto_1683 ) ( ON ?auto_1675 ?auto_1686 ) ( CLEAR ?auto_1675 ) ( not ( = ?auto_1674 ?auto_1675 ) ) ( not ( = ?auto_1674 ?auto_1686 ) ) ( not ( = ?auto_1675 ?auto_1686 ) ) ( not ( = ?auto_1680 ?auto_1685 ) ) ( SURFACE-AT ?auto_1673 ?auto_1677 ) ( CLEAR ?auto_1673 ) ( IS-CRATE ?auto_1674 ) ( AVAILABLE ?auto_1680 ) ( AVAILABLE ?auto_1679 ) ( SURFACE-AT ?auto_1674 ?auto_1682 ) ( ON ?auto_1674 ?auto_1684 ) ( CLEAR ?auto_1674 ) ( TRUCK-AT ?auto_1678 ?auto_1677 ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1684 ) ) ( not ( = ?auto_1674 ?auto_1684 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1673 ?auto_1686 ) ) ( not ( = ?auto_1675 ?auto_1684 ) ) ( not ( = ?auto_1683 ?auto_1682 ) ) ( not ( = ?auto_1685 ?auto_1679 ) ) ( not ( = ?auto_1686 ?auto_1684 ) ) ( not ( = ?auto_1673 ?auto_1676 ) ) ( not ( = ?auto_1673 ?auto_1681 ) ) ( not ( = ?auto_1674 ?auto_1676 ) ) ( not ( = ?auto_1674 ?auto_1681 ) ) ( not ( = ?auto_1676 ?auto_1686 ) ) ( not ( = ?auto_1676 ?auto_1684 ) ) ( not ( = ?auto_1681 ?auto_1686 ) ) ( not ( = ?auto_1681 ?auto_1684 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1673 ?auto_1674 ?auto_1675 )
      ( MAKE-1CRATE ?auto_1675 ?auto_1676 )
      ( MAKE-3CRATE-VERIFY ?auto_1673 ?auto_1674 ?auto_1675 ?auto_1676 ) )
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
      ?auto_1710 - HOIST
      ?auto_1711 - PLACE
      ?auto_1707 - PLACE
      ?auto_1709 - HOIST
      ?auto_1712 - SURFACE
      ?auto_1716 - PLACE
      ?auto_1715 - HOIST
      ?auto_1714 - SURFACE
      ?auto_1717 - PLACE
      ?auto_1713 - HOIST
      ?auto_1719 - SURFACE
      ?auto_1718 - SURFACE
      ?auto_1708 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1710 ?auto_1711 ) ( IS-CRATE ?auto_1706 ) ( not ( = ?auto_1707 ?auto_1711 ) ) ( HOIST-AT ?auto_1709 ?auto_1707 ) ( AVAILABLE ?auto_1709 ) ( SURFACE-AT ?auto_1706 ?auto_1707 ) ( ON ?auto_1706 ?auto_1712 ) ( CLEAR ?auto_1706 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1712 ) ) ( not ( = ?auto_1706 ?auto_1712 ) ) ( not ( = ?auto_1710 ?auto_1709 ) ) ( IS-CRATE ?auto_1705 ) ( not ( = ?auto_1716 ?auto_1711 ) ) ( HOIST-AT ?auto_1715 ?auto_1716 ) ( SURFACE-AT ?auto_1705 ?auto_1716 ) ( ON ?auto_1705 ?auto_1714 ) ( CLEAR ?auto_1705 ) ( not ( = ?auto_1704 ?auto_1705 ) ) ( not ( = ?auto_1704 ?auto_1714 ) ) ( not ( = ?auto_1705 ?auto_1714 ) ) ( not ( = ?auto_1710 ?auto_1715 ) ) ( IS-CRATE ?auto_1704 ) ( not ( = ?auto_1717 ?auto_1711 ) ) ( HOIST-AT ?auto_1713 ?auto_1717 ) ( AVAILABLE ?auto_1713 ) ( SURFACE-AT ?auto_1704 ?auto_1717 ) ( ON ?auto_1704 ?auto_1719 ) ( CLEAR ?auto_1704 ) ( not ( = ?auto_1703 ?auto_1704 ) ) ( not ( = ?auto_1703 ?auto_1719 ) ) ( not ( = ?auto_1704 ?auto_1719 ) ) ( not ( = ?auto_1710 ?auto_1713 ) ) ( SURFACE-AT ?auto_1702 ?auto_1711 ) ( CLEAR ?auto_1702 ) ( IS-CRATE ?auto_1703 ) ( AVAILABLE ?auto_1710 ) ( AVAILABLE ?auto_1715 ) ( SURFACE-AT ?auto_1703 ?auto_1716 ) ( ON ?auto_1703 ?auto_1718 ) ( CLEAR ?auto_1703 ) ( TRUCK-AT ?auto_1708 ?auto_1711 ) ( not ( = ?auto_1702 ?auto_1703 ) ) ( not ( = ?auto_1702 ?auto_1718 ) ) ( not ( = ?auto_1703 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1704 ) ) ( not ( = ?auto_1702 ?auto_1719 ) ) ( not ( = ?auto_1704 ?auto_1718 ) ) ( not ( = ?auto_1717 ?auto_1716 ) ) ( not ( = ?auto_1713 ?auto_1715 ) ) ( not ( = ?auto_1719 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1705 ) ) ( not ( = ?auto_1702 ?auto_1714 ) ) ( not ( = ?auto_1703 ?auto_1705 ) ) ( not ( = ?auto_1703 ?auto_1714 ) ) ( not ( = ?auto_1705 ?auto_1719 ) ) ( not ( = ?auto_1705 ?auto_1718 ) ) ( not ( = ?auto_1714 ?auto_1719 ) ) ( not ( = ?auto_1714 ?auto_1718 ) ) ( not ( = ?auto_1702 ?auto_1706 ) ) ( not ( = ?auto_1702 ?auto_1712 ) ) ( not ( = ?auto_1703 ?auto_1706 ) ) ( not ( = ?auto_1703 ?auto_1712 ) ) ( not ( = ?auto_1704 ?auto_1706 ) ) ( not ( = ?auto_1704 ?auto_1712 ) ) ( not ( = ?auto_1706 ?auto_1714 ) ) ( not ( = ?auto_1706 ?auto_1719 ) ) ( not ( = ?auto_1706 ?auto_1718 ) ) ( not ( = ?auto_1707 ?auto_1716 ) ) ( not ( = ?auto_1707 ?auto_1717 ) ) ( not ( = ?auto_1709 ?auto_1715 ) ) ( not ( = ?auto_1709 ?auto_1713 ) ) ( not ( = ?auto_1712 ?auto_1714 ) ) ( not ( = ?auto_1712 ?auto_1719 ) ) ( not ( = ?auto_1712 ?auto_1718 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1702 ?auto_1703 ?auto_1704 ?auto_1705 )
      ( MAKE-1CRATE ?auto_1705 ?auto_1706 )
      ( MAKE-4CRATE-VERIFY ?auto_1702 ?auto_1703 ?auto_1704 ?auto_1705 ?auto_1706 ) )
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
      ?auto_1743 - HOIST
      ?auto_1745 - PLACE
      ?auto_1744 - PLACE
      ?auto_1747 - HOIST
      ?auto_1746 - SURFACE
      ?auto_1748 - SURFACE
      ?auto_1755 - PLACE
      ?auto_1753 - HOIST
      ?auto_1754 - SURFACE
      ?auto_1750 - PLACE
      ?auto_1749 - HOIST
      ?auto_1752 - SURFACE
      ?auto_1751 - SURFACE
      ?auto_1742 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1743 ?auto_1745 ) ( IS-CRATE ?auto_1741 ) ( not ( = ?auto_1744 ?auto_1745 ) ) ( HOIST-AT ?auto_1747 ?auto_1744 ) ( SURFACE-AT ?auto_1741 ?auto_1744 ) ( ON ?auto_1741 ?auto_1746 ) ( CLEAR ?auto_1741 ) ( not ( = ?auto_1740 ?auto_1741 ) ) ( not ( = ?auto_1740 ?auto_1746 ) ) ( not ( = ?auto_1741 ?auto_1746 ) ) ( not ( = ?auto_1743 ?auto_1747 ) ) ( IS-CRATE ?auto_1740 ) ( AVAILABLE ?auto_1747 ) ( SURFACE-AT ?auto_1740 ?auto_1744 ) ( ON ?auto_1740 ?auto_1748 ) ( CLEAR ?auto_1740 ) ( not ( = ?auto_1739 ?auto_1740 ) ) ( not ( = ?auto_1739 ?auto_1748 ) ) ( not ( = ?auto_1740 ?auto_1748 ) ) ( IS-CRATE ?auto_1739 ) ( not ( = ?auto_1755 ?auto_1745 ) ) ( HOIST-AT ?auto_1753 ?auto_1755 ) ( SURFACE-AT ?auto_1739 ?auto_1755 ) ( ON ?auto_1739 ?auto_1754 ) ( CLEAR ?auto_1739 ) ( not ( = ?auto_1738 ?auto_1739 ) ) ( not ( = ?auto_1738 ?auto_1754 ) ) ( not ( = ?auto_1739 ?auto_1754 ) ) ( not ( = ?auto_1743 ?auto_1753 ) ) ( IS-CRATE ?auto_1738 ) ( not ( = ?auto_1750 ?auto_1745 ) ) ( HOIST-AT ?auto_1749 ?auto_1750 ) ( AVAILABLE ?auto_1749 ) ( SURFACE-AT ?auto_1738 ?auto_1750 ) ( ON ?auto_1738 ?auto_1752 ) ( CLEAR ?auto_1738 ) ( not ( = ?auto_1737 ?auto_1738 ) ) ( not ( = ?auto_1737 ?auto_1752 ) ) ( not ( = ?auto_1738 ?auto_1752 ) ) ( not ( = ?auto_1743 ?auto_1749 ) ) ( SURFACE-AT ?auto_1736 ?auto_1745 ) ( CLEAR ?auto_1736 ) ( IS-CRATE ?auto_1737 ) ( AVAILABLE ?auto_1743 ) ( AVAILABLE ?auto_1753 ) ( SURFACE-AT ?auto_1737 ?auto_1755 ) ( ON ?auto_1737 ?auto_1751 ) ( CLEAR ?auto_1737 ) ( TRUCK-AT ?auto_1742 ?auto_1745 ) ( not ( = ?auto_1736 ?auto_1737 ) ) ( not ( = ?auto_1736 ?auto_1751 ) ) ( not ( = ?auto_1737 ?auto_1751 ) ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1736 ?auto_1752 ) ) ( not ( = ?auto_1738 ?auto_1751 ) ) ( not ( = ?auto_1750 ?auto_1755 ) ) ( not ( = ?auto_1749 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1751 ) ) ( not ( = ?auto_1736 ?auto_1739 ) ) ( not ( = ?auto_1736 ?auto_1754 ) ) ( not ( = ?auto_1737 ?auto_1739 ) ) ( not ( = ?auto_1737 ?auto_1754 ) ) ( not ( = ?auto_1739 ?auto_1752 ) ) ( not ( = ?auto_1739 ?auto_1751 ) ) ( not ( = ?auto_1754 ?auto_1752 ) ) ( not ( = ?auto_1754 ?auto_1751 ) ) ( not ( = ?auto_1736 ?auto_1740 ) ) ( not ( = ?auto_1736 ?auto_1748 ) ) ( not ( = ?auto_1737 ?auto_1740 ) ) ( not ( = ?auto_1737 ?auto_1748 ) ) ( not ( = ?auto_1738 ?auto_1740 ) ) ( not ( = ?auto_1738 ?auto_1748 ) ) ( not ( = ?auto_1740 ?auto_1754 ) ) ( not ( = ?auto_1740 ?auto_1752 ) ) ( not ( = ?auto_1740 ?auto_1751 ) ) ( not ( = ?auto_1744 ?auto_1755 ) ) ( not ( = ?auto_1744 ?auto_1750 ) ) ( not ( = ?auto_1747 ?auto_1753 ) ) ( not ( = ?auto_1747 ?auto_1749 ) ) ( not ( = ?auto_1748 ?auto_1754 ) ) ( not ( = ?auto_1748 ?auto_1752 ) ) ( not ( = ?auto_1748 ?auto_1751 ) ) ( not ( = ?auto_1736 ?auto_1741 ) ) ( not ( = ?auto_1736 ?auto_1746 ) ) ( not ( = ?auto_1737 ?auto_1741 ) ) ( not ( = ?auto_1737 ?auto_1746 ) ) ( not ( = ?auto_1738 ?auto_1741 ) ) ( not ( = ?auto_1738 ?auto_1746 ) ) ( not ( = ?auto_1739 ?auto_1741 ) ) ( not ( = ?auto_1739 ?auto_1746 ) ) ( not ( = ?auto_1741 ?auto_1748 ) ) ( not ( = ?auto_1741 ?auto_1754 ) ) ( not ( = ?auto_1741 ?auto_1752 ) ) ( not ( = ?auto_1741 ?auto_1751 ) ) ( not ( = ?auto_1746 ?auto_1748 ) ) ( not ( = ?auto_1746 ?auto_1754 ) ) ( not ( = ?auto_1746 ?auto_1752 ) ) ( not ( = ?auto_1746 ?auto_1751 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1736 ?auto_1737 ?auto_1738 ?auto_1739 ?auto_1740 )
      ( MAKE-1CRATE ?auto_1740 ?auto_1741 )
      ( MAKE-5CRATE-VERIFY ?auto_1736 ?auto_1737 ?auto_1738 ?auto_1739 ?auto_1740 ?auto_1741 ) )
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
      ?auto_1781 - HOIST
      ?auto_1782 - PLACE
      ?auto_1783 - PLACE
      ?auto_1784 - HOIST
      ?auto_1780 - SURFACE
      ?auto_1794 - SURFACE
      ?auto_1786 - SURFACE
      ?auto_1793 - PLACE
      ?auto_1792 - HOIST
      ?auto_1790 - SURFACE
      ?auto_1787 - PLACE
      ?auto_1791 - HOIST
      ?auto_1789 - SURFACE
      ?auto_1788 - SURFACE
      ?auto_1785 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1781 ?auto_1782 ) ( IS-CRATE ?auto_1779 ) ( not ( = ?auto_1783 ?auto_1782 ) ) ( HOIST-AT ?auto_1784 ?auto_1783 ) ( SURFACE-AT ?auto_1779 ?auto_1783 ) ( ON ?auto_1779 ?auto_1780 ) ( CLEAR ?auto_1779 ) ( not ( = ?auto_1778 ?auto_1779 ) ) ( not ( = ?auto_1778 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1780 ) ) ( not ( = ?auto_1781 ?auto_1784 ) ) ( IS-CRATE ?auto_1778 ) ( SURFACE-AT ?auto_1778 ?auto_1783 ) ( ON ?auto_1778 ?auto_1794 ) ( CLEAR ?auto_1778 ) ( not ( = ?auto_1777 ?auto_1778 ) ) ( not ( = ?auto_1777 ?auto_1794 ) ) ( not ( = ?auto_1778 ?auto_1794 ) ) ( IS-CRATE ?auto_1777 ) ( AVAILABLE ?auto_1784 ) ( SURFACE-AT ?auto_1777 ?auto_1783 ) ( ON ?auto_1777 ?auto_1786 ) ( CLEAR ?auto_1777 ) ( not ( = ?auto_1776 ?auto_1777 ) ) ( not ( = ?auto_1776 ?auto_1786 ) ) ( not ( = ?auto_1777 ?auto_1786 ) ) ( IS-CRATE ?auto_1776 ) ( not ( = ?auto_1793 ?auto_1782 ) ) ( HOIST-AT ?auto_1792 ?auto_1793 ) ( SURFACE-AT ?auto_1776 ?auto_1793 ) ( ON ?auto_1776 ?auto_1790 ) ( CLEAR ?auto_1776 ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1790 ) ) ( not ( = ?auto_1776 ?auto_1790 ) ) ( not ( = ?auto_1781 ?auto_1792 ) ) ( IS-CRATE ?auto_1775 ) ( not ( = ?auto_1787 ?auto_1782 ) ) ( HOIST-AT ?auto_1791 ?auto_1787 ) ( AVAILABLE ?auto_1791 ) ( SURFACE-AT ?auto_1775 ?auto_1787 ) ( ON ?auto_1775 ?auto_1789 ) ( CLEAR ?auto_1775 ) ( not ( = ?auto_1774 ?auto_1775 ) ) ( not ( = ?auto_1774 ?auto_1789 ) ) ( not ( = ?auto_1775 ?auto_1789 ) ) ( not ( = ?auto_1781 ?auto_1791 ) ) ( SURFACE-AT ?auto_1773 ?auto_1782 ) ( CLEAR ?auto_1773 ) ( IS-CRATE ?auto_1774 ) ( AVAILABLE ?auto_1781 ) ( AVAILABLE ?auto_1792 ) ( SURFACE-AT ?auto_1774 ?auto_1793 ) ( ON ?auto_1774 ?auto_1788 ) ( CLEAR ?auto_1774 ) ( TRUCK-AT ?auto_1785 ?auto_1782 ) ( not ( = ?auto_1773 ?auto_1774 ) ) ( not ( = ?auto_1773 ?auto_1788 ) ) ( not ( = ?auto_1774 ?auto_1788 ) ) ( not ( = ?auto_1773 ?auto_1775 ) ) ( not ( = ?auto_1773 ?auto_1789 ) ) ( not ( = ?auto_1775 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1793 ) ) ( not ( = ?auto_1791 ?auto_1792 ) ) ( not ( = ?auto_1789 ?auto_1788 ) ) ( not ( = ?auto_1773 ?auto_1776 ) ) ( not ( = ?auto_1773 ?auto_1790 ) ) ( not ( = ?auto_1774 ?auto_1776 ) ) ( not ( = ?auto_1774 ?auto_1790 ) ) ( not ( = ?auto_1776 ?auto_1789 ) ) ( not ( = ?auto_1776 ?auto_1788 ) ) ( not ( = ?auto_1790 ?auto_1789 ) ) ( not ( = ?auto_1790 ?auto_1788 ) ) ( not ( = ?auto_1773 ?auto_1777 ) ) ( not ( = ?auto_1773 ?auto_1786 ) ) ( not ( = ?auto_1774 ?auto_1777 ) ) ( not ( = ?auto_1774 ?auto_1786 ) ) ( not ( = ?auto_1775 ?auto_1777 ) ) ( not ( = ?auto_1775 ?auto_1786 ) ) ( not ( = ?auto_1777 ?auto_1790 ) ) ( not ( = ?auto_1777 ?auto_1789 ) ) ( not ( = ?auto_1777 ?auto_1788 ) ) ( not ( = ?auto_1783 ?auto_1793 ) ) ( not ( = ?auto_1783 ?auto_1787 ) ) ( not ( = ?auto_1784 ?auto_1792 ) ) ( not ( = ?auto_1784 ?auto_1791 ) ) ( not ( = ?auto_1786 ?auto_1790 ) ) ( not ( = ?auto_1786 ?auto_1789 ) ) ( not ( = ?auto_1786 ?auto_1788 ) ) ( not ( = ?auto_1773 ?auto_1778 ) ) ( not ( = ?auto_1773 ?auto_1794 ) ) ( not ( = ?auto_1774 ?auto_1778 ) ) ( not ( = ?auto_1774 ?auto_1794 ) ) ( not ( = ?auto_1775 ?auto_1778 ) ) ( not ( = ?auto_1775 ?auto_1794 ) ) ( not ( = ?auto_1776 ?auto_1778 ) ) ( not ( = ?auto_1776 ?auto_1794 ) ) ( not ( = ?auto_1778 ?auto_1786 ) ) ( not ( = ?auto_1778 ?auto_1790 ) ) ( not ( = ?auto_1778 ?auto_1789 ) ) ( not ( = ?auto_1778 ?auto_1788 ) ) ( not ( = ?auto_1794 ?auto_1786 ) ) ( not ( = ?auto_1794 ?auto_1790 ) ) ( not ( = ?auto_1794 ?auto_1789 ) ) ( not ( = ?auto_1794 ?auto_1788 ) ) ( not ( = ?auto_1773 ?auto_1779 ) ) ( not ( = ?auto_1773 ?auto_1780 ) ) ( not ( = ?auto_1774 ?auto_1779 ) ) ( not ( = ?auto_1774 ?auto_1780 ) ) ( not ( = ?auto_1775 ?auto_1779 ) ) ( not ( = ?auto_1775 ?auto_1780 ) ) ( not ( = ?auto_1776 ?auto_1779 ) ) ( not ( = ?auto_1776 ?auto_1780 ) ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1777 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1794 ) ) ( not ( = ?auto_1779 ?auto_1786 ) ) ( not ( = ?auto_1779 ?auto_1790 ) ) ( not ( = ?auto_1779 ?auto_1789 ) ) ( not ( = ?auto_1779 ?auto_1788 ) ) ( not ( = ?auto_1780 ?auto_1794 ) ) ( not ( = ?auto_1780 ?auto_1786 ) ) ( not ( = ?auto_1780 ?auto_1790 ) ) ( not ( = ?auto_1780 ?auto_1789 ) ) ( not ( = ?auto_1780 ?auto_1788 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1773 ?auto_1774 ?auto_1775 ?auto_1776 ?auto_1777 ?auto_1778 )
      ( MAKE-1CRATE ?auto_1778 ?auto_1779 )
      ( MAKE-6CRATE-VERIFY ?auto_1773 ?auto_1774 ?auto_1775 ?auto_1776 ?auto_1777 ?auto_1778 ?auto_1779 ) )
  )

)

