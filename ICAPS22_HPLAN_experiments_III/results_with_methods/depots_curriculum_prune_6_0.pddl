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
      ?auto_1640 - SURFACE
      ?auto_1641 - SURFACE
    )
    :vars
    (
      ?auto_1642 - HOIST
      ?auto_1643 - PLACE
      ?auto_1645 - PLACE
      ?auto_1646 - HOIST
      ?auto_1647 - SURFACE
      ?auto_1644 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1642 ?auto_1643 ) ( SURFACE-AT ?auto_1640 ?auto_1643 ) ( CLEAR ?auto_1640 ) ( IS-CRATE ?auto_1641 ) ( AVAILABLE ?auto_1642 ) ( not ( = ?auto_1645 ?auto_1643 ) ) ( HOIST-AT ?auto_1646 ?auto_1645 ) ( AVAILABLE ?auto_1646 ) ( SURFACE-AT ?auto_1641 ?auto_1645 ) ( ON ?auto_1641 ?auto_1647 ) ( CLEAR ?auto_1641 ) ( TRUCK-AT ?auto_1644 ?auto_1643 ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1647 ) ) ( not ( = ?auto_1641 ?auto_1647 ) ) ( not ( = ?auto_1642 ?auto_1646 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1644 ?auto_1643 ?auto_1645 )
      ( !LIFT ?auto_1646 ?auto_1641 ?auto_1647 ?auto_1645 )
      ( !LOAD ?auto_1646 ?auto_1641 ?auto_1644 ?auto_1645 )
      ( !DRIVE ?auto_1644 ?auto_1645 ?auto_1643 )
      ( !UNLOAD ?auto_1642 ?auto_1641 ?auto_1644 ?auto_1643 )
      ( !DROP ?auto_1642 ?auto_1641 ?auto_1640 ?auto_1643 )
      ( MAKE-1CRATE-VERIFY ?auto_1640 ?auto_1641 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1661 - SURFACE
      ?auto_1662 - SURFACE
      ?auto_1663 - SURFACE
    )
    :vars
    (
      ?auto_1667 - HOIST
      ?auto_1664 - PLACE
      ?auto_1665 - PLACE
      ?auto_1668 - HOIST
      ?auto_1669 - SURFACE
      ?auto_1670 - PLACE
      ?auto_1672 - HOIST
      ?auto_1671 - SURFACE
      ?auto_1666 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1667 ?auto_1664 ) ( IS-CRATE ?auto_1663 ) ( not ( = ?auto_1665 ?auto_1664 ) ) ( HOIST-AT ?auto_1668 ?auto_1665 ) ( AVAILABLE ?auto_1668 ) ( SURFACE-AT ?auto_1663 ?auto_1665 ) ( ON ?auto_1663 ?auto_1669 ) ( CLEAR ?auto_1663 ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1662 ?auto_1669 ) ) ( not ( = ?auto_1663 ?auto_1669 ) ) ( not ( = ?auto_1667 ?auto_1668 ) ) ( SURFACE-AT ?auto_1661 ?auto_1664 ) ( CLEAR ?auto_1661 ) ( IS-CRATE ?auto_1662 ) ( AVAILABLE ?auto_1667 ) ( not ( = ?auto_1670 ?auto_1664 ) ) ( HOIST-AT ?auto_1672 ?auto_1670 ) ( AVAILABLE ?auto_1672 ) ( SURFACE-AT ?auto_1662 ?auto_1670 ) ( ON ?auto_1662 ?auto_1671 ) ( CLEAR ?auto_1662 ) ( TRUCK-AT ?auto_1666 ?auto_1664 ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( not ( = ?auto_1661 ?auto_1671 ) ) ( not ( = ?auto_1662 ?auto_1671 ) ) ( not ( = ?auto_1667 ?auto_1672 ) ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( not ( = ?auto_1661 ?auto_1669 ) ) ( not ( = ?auto_1663 ?auto_1671 ) ) ( not ( = ?auto_1665 ?auto_1670 ) ) ( not ( = ?auto_1668 ?auto_1672 ) ) ( not ( = ?auto_1669 ?auto_1671 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1661 ?auto_1662 )
      ( MAKE-1CRATE ?auto_1662 ?auto_1663 )
      ( MAKE-2CRATE-VERIFY ?auto_1661 ?auto_1662 ?auto_1663 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1687 - SURFACE
      ?auto_1688 - SURFACE
      ?auto_1689 - SURFACE
      ?auto_1690 - SURFACE
    )
    :vars
    (
      ?auto_1696 - HOIST
      ?auto_1691 - PLACE
      ?auto_1695 - PLACE
      ?auto_1694 - HOIST
      ?auto_1692 - SURFACE
      ?auto_1698 - PLACE
      ?auto_1700 - HOIST
      ?auto_1699 - SURFACE
      ?auto_1697 - PLACE
      ?auto_1702 - HOIST
      ?auto_1701 - SURFACE
      ?auto_1693 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1696 ?auto_1691 ) ( IS-CRATE ?auto_1690 ) ( not ( = ?auto_1695 ?auto_1691 ) ) ( HOIST-AT ?auto_1694 ?auto_1695 ) ( AVAILABLE ?auto_1694 ) ( SURFACE-AT ?auto_1690 ?auto_1695 ) ( ON ?auto_1690 ?auto_1692 ) ( CLEAR ?auto_1690 ) ( not ( = ?auto_1689 ?auto_1690 ) ) ( not ( = ?auto_1689 ?auto_1692 ) ) ( not ( = ?auto_1690 ?auto_1692 ) ) ( not ( = ?auto_1696 ?auto_1694 ) ) ( IS-CRATE ?auto_1689 ) ( not ( = ?auto_1698 ?auto_1691 ) ) ( HOIST-AT ?auto_1700 ?auto_1698 ) ( AVAILABLE ?auto_1700 ) ( SURFACE-AT ?auto_1689 ?auto_1698 ) ( ON ?auto_1689 ?auto_1699 ) ( CLEAR ?auto_1689 ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1699 ) ) ( not ( = ?auto_1689 ?auto_1699 ) ) ( not ( = ?auto_1696 ?auto_1700 ) ) ( SURFACE-AT ?auto_1687 ?auto_1691 ) ( CLEAR ?auto_1687 ) ( IS-CRATE ?auto_1688 ) ( AVAILABLE ?auto_1696 ) ( not ( = ?auto_1697 ?auto_1691 ) ) ( HOIST-AT ?auto_1702 ?auto_1697 ) ( AVAILABLE ?auto_1702 ) ( SURFACE-AT ?auto_1688 ?auto_1697 ) ( ON ?auto_1688 ?auto_1701 ) ( CLEAR ?auto_1688 ) ( TRUCK-AT ?auto_1693 ?auto_1691 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1701 ) ) ( not ( = ?auto_1688 ?auto_1701 ) ) ( not ( = ?auto_1696 ?auto_1702 ) ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1687 ?auto_1699 ) ) ( not ( = ?auto_1689 ?auto_1701 ) ) ( not ( = ?auto_1698 ?auto_1697 ) ) ( not ( = ?auto_1700 ?auto_1702 ) ) ( not ( = ?auto_1699 ?auto_1701 ) ) ( not ( = ?auto_1687 ?auto_1690 ) ) ( not ( = ?auto_1687 ?auto_1692 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1692 ) ) ( not ( = ?auto_1690 ?auto_1699 ) ) ( not ( = ?auto_1690 ?auto_1701 ) ) ( not ( = ?auto_1695 ?auto_1698 ) ) ( not ( = ?auto_1695 ?auto_1697 ) ) ( not ( = ?auto_1694 ?auto_1700 ) ) ( not ( = ?auto_1694 ?auto_1702 ) ) ( not ( = ?auto_1692 ?auto_1699 ) ) ( not ( = ?auto_1692 ?auto_1701 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1687 ?auto_1688 ?auto_1689 )
      ( MAKE-1CRATE ?auto_1689 ?auto_1690 )
      ( MAKE-3CRATE-VERIFY ?auto_1687 ?auto_1688 ?auto_1689 ?auto_1690 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1718 - SURFACE
      ?auto_1719 - SURFACE
      ?auto_1720 - SURFACE
      ?auto_1721 - SURFACE
      ?auto_1722 - SURFACE
    )
    :vars
    (
      ?auto_1724 - HOIST
      ?auto_1728 - PLACE
      ?auto_1727 - PLACE
      ?auto_1723 - HOIST
      ?auto_1726 - SURFACE
      ?auto_1737 - PLACE
      ?auto_1734 - HOIST
      ?auto_1735 - SURFACE
      ?auto_1730 - PLACE
      ?auto_1733 - HOIST
      ?auto_1731 - SURFACE
      ?auto_1729 - PLACE
      ?auto_1736 - HOIST
      ?auto_1732 - SURFACE
      ?auto_1725 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1724 ?auto_1728 ) ( IS-CRATE ?auto_1722 ) ( not ( = ?auto_1727 ?auto_1728 ) ) ( HOIST-AT ?auto_1723 ?auto_1727 ) ( AVAILABLE ?auto_1723 ) ( SURFACE-AT ?auto_1722 ?auto_1727 ) ( ON ?auto_1722 ?auto_1726 ) ( CLEAR ?auto_1722 ) ( not ( = ?auto_1721 ?auto_1722 ) ) ( not ( = ?auto_1721 ?auto_1726 ) ) ( not ( = ?auto_1722 ?auto_1726 ) ) ( not ( = ?auto_1724 ?auto_1723 ) ) ( IS-CRATE ?auto_1721 ) ( not ( = ?auto_1737 ?auto_1728 ) ) ( HOIST-AT ?auto_1734 ?auto_1737 ) ( AVAILABLE ?auto_1734 ) ( SURFACE-AT ?auto_1721 ?auto_1737 ) ( ON ?auto_1721 ?auto_1735 ) ( CLEAR ?auto_1721 ) ( not ( = ?auto_1720 ?auto_1721 ) ) ( not ( = ?auto_1720 ?auto_1735 ) ) ( not ( = ?auto_1721 ?auto_1735 ) ) ( not ( = ?auto_1724 ?auto_1734 ) ) ( IS-CRATE ?auto_1720 ) ( not ( = ?auto_1730 ?auto_1728 ) ) ( HOIST-AT ?auto_1733 ?auto_1730 ) ( AVAILABLE ?auto_1733 ) ( SURFACE-AT ?auto_1720 ?auto_1730 ) ( ON ?auto_1720 ?auto_1731 ) ( CLEAR ?auto_1720 ) ( not ( = ?auto_1719 ?auto_1720 ) ) ( not ( = ?auto_1719 ?auto_1731 ) ) ( not ( = ?auto_1720 ?auto_1731 ) ) ( not ( = ?auto_1724 ?auto_1733 ) ) ( SURFACE-AT ?auto_1718 ?auto_1728 ) ( CLEAR ?auto_1718 ) ( IS-CRATE ?auto_1719 ) ( AVAILABLE ?auto_1724 ) ( not ( = ?auto_1729 ?auto_1728 ) ) ( HOIST-AT ?auto_1736 ?auto_1729 ) ( AVAILABLE ?auto_1736 ) ( SURFACE-AT ?auto_1719 ?auto_1729 ) ( ON ?auto_1719 ?auto_1732 ) ( CLEAR ?auto_1719 ) ( TRUCK-AT ?auto_1725 ?auto_1728 ) ( not ( = ?auto_1718 ?auto_1719 ) ) ( not ( = ?auto_1718 ?auto_1732 ) ) ( not ( = ?auto_1719 ?auto_1732 ) ) ( not ( = ?auto_1724 ?auto_1736 ) ) ( not ( = ?auto_1718 ?auto_1720 ) ) ( not ( = ?auto_1718 ?auto_1731 ) ) ( not ( = ?auto_1720 ?auto_1732 ) ) ( not ( = ?auto_1730 ?auto_1729 ) ) ( not ( = ?auto_1733 ?auto_1736 ) ) ( not ( = ?auto_1731 ?auto_1732 ) ) ( not ( = ?auto_1718 ?auto_1721 ) ) ( not ( = ?auto_1718 ?auto_1735 ) ) ( not ( = ?auto_1719 ?auto_1721 ) ) ( not ( = ?auto_1719 ?auto_1735 ) ) ( not ( = ?auto_1721 ?auto_1731 ) ) ( not ( = ?auto_1721 ?auto_1732 ) ) ( not ( = ?auto_1737 ?auto_1730 ) ) ( not ( = ?auto_1737 ?auto_1729 ) ) ( not ( = ?auto_1734 ?auto_1733 ) ) ( not ( = ?auto_1734 ?auto_1736 ) ) ( not ( = ?auto_1735 ?auto_1731 ) ) ( not ( = ?auto_1735 ?auto_1732 ) ) ( not ( = ?auto_1718 ?auto_1722 ) ) ( not ( = ?auto_1718 ?auto_1726 ) ) ( not ( = ?auto_1719 ?auto_1722 ) ) ( not ( = ?auto_1719 ?auto_1726 ) ) ( not ( = ?auto_1720 ?auto_1722 ) ) ( not ( = ?auto_1720 ?auto_1726 ) ) ( not ( = ?auto_1722 ?auto_1735 ) ) ( not ( = ?auto_1722 ?auto_1731 ) ) ( not ( = ?auto_1722 ?auto_1732 ) ) ( not ( = ?auto_1727 ?auto_1737 ) ) ( not ( = ?auto_1727 ?auto_1730 ) ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( not ( = ?auto_1723 ?auto_1734 ) ) ( not ( = ?auto_1723 ?auto_1733 ) ) ( not ( = ?auto_1723 ?auto_1736 ) ) ( not ( = ?auto_1726 ?auto_1735 ) ) ( not ( = ?auto_1726 ?auto_1731 ) ) ( not ( = ?auto_1726 ?auto_1732 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1718 ?auto_1719 ?auto_1720 ?auto_1721 )
      ( MAKE-1CRATE ?auto_1721 ?auto_1722 )
      ( MAKE-4CRATE-VERIFY ?auto_1718 ?auto_1719 ?auto_1720 ?auto_1721 ?auto_1722 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1754 - SURFACE
      ?auto_1755 - SURFACE
      ?auto_1756 - SURFACE
      ?auto_1757 - SURFACE
      ?auto_1758 - SURFACE
      ?auto_1759 - SURFACE
    )
    :vars
    (
      ?auto_1765 - HOIST
      ?auto_1763 - PLACE
      ?auto_1762 - PLACE
      ?auto_1761 - HOIST
      ?auto_1760 - SURFACE
      ?auto_1775 - SURFACE
      ?auto_1769 - PLACE
      ?auto_1772 - HOIST
      ?auto_1773 - SURFACE
      ?auto_1771 - PLACE
      ?auto_1768 - HOIST
      ?auto_1770 - SURFACE
      ?auto_1767 - PLACE
      ?auto_1774 - HOIST
      ?auto_1766 - SURFACE
      ?auto_1764 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1765 ?auto_1763 ) ( IS-CRATE ?auto_1759 ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( HOIST-AT ?auto_1761 ?auto_1762 ) ( SURFACE-AT ?auto_1759 ?auto_1762 ) ( ON ?auto_1759 ?auto_1760 ) ( CLEAR ?auto_1759 ) ( not ( = ?auto_1758 ?auto_1759 ) ) ( not ( = ?auto_1758 ?auto_1760 ) ) ( not ( = ?auto_1759 ?auto_1760 ) ) ( not ( = ?auto_1765 ?auto_1761 ) ) ( IS-CRATE ?auto_1758 ) ( AVAILABLE ?auto_1761 ) ( SURFACE-AT ?auto_1758 ?auto_1762 ) ( ON ?auto_1758 ?auto_1775 ) ( CLEAR ?auto_1758 ) ( not ( = ?auto_1757 ?auto_1758 ) ) ( not ( = ?auto_1757 ?auto_1775 ) ) ( not ( = ?auto_1758 ?auto_1775 ) ) ( IS-CRATE ?auto_1757 ) ( not ( = ?auto_1769 ?auto_1763 ) ) ( HOIST-AT ?auto_1772 ?auto_1769 ) ( AVAILABLE ?auto_1772 ) ( SURFACE-AT ?auto_1757 ?auto_1769 ) ( ON ?auto_1757 ?auto_1773 ) ( CLEAR ?auto_1757 ) ( not ( = ?auto_1756 ?auto_1757 ) ) ( not ( = ?auto_1756 ?auto_1773 ) ) ( not ( = ?auto_1757 ?auto_1773 ) ) ( not ( = ?auto_1765 ?auto_1772 ) ) ( IS-CRATE ?auto_1756 ) ( not ( = ?auto_1771 ?auto_1763 ) ) ( HOIST-AT ?auto_1768 ?auto_1771 ) ( AVAILABLE ?auto_1768 ) ( SURFACE-AT ?auto_1756 ?auto_1771 ) ( ON ?auto_1756 ?auto_1770 ) ( CLEAR ?auto_1756 ) ( not ( = ?auto_1755 ?auto_1756 ) ) ( not ( = ?auto_1755 ?auto_1770 ) ) ( not ( = ?auto_1756 ?auto_1770 ) ) ( not ( = ?auto_1765 ?auto_1768 ) ) ( SURFACE-AT ?auto_1754 ?auto_1763 ) ( CLEAR ?auto_1754 ) ( IS-CRATE ?auto_1755 ) ( AVAILABLE ?auto_1765 ) ( not ( = ?auto_1767 ?auto_1763 ) ) ( HOIST-AT ?auto_1774 ?auto_1767 ) ( AVAILABLE ?auto_1774 ) ( SURFACE-AT ?auto_1755 ?auto_1767 ) ( ON ?auto_1755 ?auto_1766 ) ( CLEAR ?auto_1755 ) ( TRUCK-AT ?auto_1764 ?auto_1763 ) ( not ( = ?auto_1754 ?auto_1755 ) ) ( not ( = ?auto_1754 ?auto_1766 ) ) ( not ( = ?auto_1755 ?auto_1766 ) ) ( not ( = ?auto_1765 ?auto_1774 ) ) ( not ( = ?auto_1754 ?auto_1756 ) ) ( not ( = ?auto_1754 ?auto_1770 ) ) ( not ( = ?auto_1756 ?auto_1766 ) ) ( not ( = ?auto_1771 ?auto_1767 ) ) ( not ( = ?auto_1768 ?auto_1774 ) ) ( not ( = ?auto_1770 ?auto_1766 ) ) ( not ( = ?auto_1754 ?auto_1757 ) ) ( not ( = ?auto_1754 ?auto_1773 ) ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( not ( = ?auto_1755 ?auto_1773 ) ) ( not ( = ?auto_1757 ?auto_1770 ) ) ( not ( = ?auto_1757 ?auto_1766 ) ) ( not ( = ?auto_1769 ?auto_1771 ) ) ( not ( = ?auto_1769 ?auto_1767 ) ) ( not ( = ?auto_1772 ?auto_1768 ) ) ( not ( = ?auto_1772 ?auto_1774 ) ) ( not ( = ?auto_1773 ?auto_1770 ) ) ( not ( = ?auto_1773 ?auto_1766 ) ) ( not ( = ?auto_1754 ?auto_1758 ) ) ( not ( = ?auto_1754 ?auto_1775 ) ) ( not ( = ?auto_1755 ?auto_1758 ) ) ( not ( = ?auto_1755 ?auto_1775 ) ) ( not ( = ?auto_1756 ?auto_1758 ) ) ( not ( = ?auto_1756 ?auto_1775 ) ) ( not ( = ?auto_1758 ?auto_1773 ) ) ( not ( = ?auto_1758 ?auto_1770 ) ) ( not ( = ?auto_1758 ?auto_1766 ) ) ( not ( = ?auto_1762 ?auto_1769 ) ) ( not ( = ?auto_1762 ?auto_1771 ) ) ( not ( = ?auto_1762 ?auto_1767 ) ) ( not ( = ?auto_1761 ?auto_1772 ) ) ( not ( = ?auto_1761 ?auto_1768 ) ) ( not ( = ?auto_1761 ?auto_1774 ) ) ( not ( = ?auto_1775 ?auto_1773 ) ) ( not ( = ?auto_1775 ?auto_1770 ) ) ( not ( = ?auto_1775 ?auto_1766 ) ) ( not ( = ?auto_1754 ?auto_1759 ) ) ( not ( = ?auto_1754 ?auto_1760 ) ) ( not ( = ?auto_1755 ?auto_1759 ) ) ( not ( = ?auto_1755 ?auto_1760 ) ) ( not ( = ?auto_1756 ?auto_1759 ) ) ( not ( = ?auto_1756 ?auto_1760 ) ) ( not ( = ?auto_1757 ?auto_1759 ) ) ( not ( = ?auto_1757 ?auto_1760 ) ) ( not ( = ?auto_1759 ?auto_1775 ) ) ( not ( = ?auto_1759 ?auto_1773 ) ) ( not ( = ?auto_1759 ?auto_1770 ) ) ( not ( = ?auto_1759 ?auto_1766 ) ) ( not ( = ?auto_1760 ?auto_1775 ) ) ( not ( = ?auto_1760 ?auto_1773 ) ) ( not ( = ?auto_1760 ?auto_1770 ) ) ( not ( = ?auto_1760 ?auto_1766 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1754 ?auto_1755 ?auto_1756 ?auto_1757 ?auto_1758 )
      ( MAKE-1CRATE ?auto_1758 ?auto_1759 )
      ( MAKE-5CRATE-VERIFY ?auto_1754 ?auto_1755 ?auto_1756 ?auto_1757 ?auto_1758 ?auto_1759 ) )
  )

  ( :method MAKE-6CRATE
    :parameters
    (
      ?auto_1793 - SURFACE
      ?auto_1794 - SURFACE
      ?auto_1795 - SURFACE
      ?auto_1796 - SURFACE
      ?auto_1797 - SURFACE
      ?auto_1798 - SURFACE
      ?auto_1799 - SURFACE
    )
    :vars
    (
      ?auto_1801 - HOIST
      ?auto_1800 - PLACE
      ?auto_1803 - PLACE
      ?auto_1804 - HOIST
      ?auto_1805 - SURFACE
      ?auto_1813 - PLACE
      ?auto_1817 - HOIST
      ?auto_1807 - SURFACE
      ?auto_1815 - SURFACE
      ?auto_1806 - PLACE
      ?auto_1810 - HOIST
      ?auto_1812 - SURFACE
      ?auto_1811 - PLACE
      ?auto_1809 - HOIST
      ?auto_1814 - SURFACE
      ?auto_1816 - PLACE
      ?auto_1818 - HOIST
      ?auto_1808 - SURFACE
      ?auto_1802 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1801 ?auto_1800 ) ( IS-CRATE ?auto_1799 ) ( not ( = ?auto_1803 ?auto_1800 ) ) ( HOIST-AT ?auto_1804 ?auto_1803 ) ( AVAILABLE ?auto_1804 ) ( SURFACE-AT ?auto_1799 ?auto_1803 ) ( ON ?auto_1799 ?auto_1805 ) ( CLEAR ?auto_1799 ) ( not ( = ?auto_1798 ?auto_1799 ) ) ( not ( = ?auto_1798 ?auto_1805 ) ) ( not ( = ?auto_1799 ?auto_1805 ) ) ( not ( = ?auto_1801 ?auto_1804 ) ) ( IS-CRATE ?auto_1798 ) ( not ( = ?auto_1813 ?auto_1800 ) ) ( HOIST-AT ?auto_1817 ?auto_1813 ) ( SURFACE-AT ?auto_1798 ?auto_1813 ) ( ON ?auto_1798 ?auto_1807 ) ( CLEAR ?auto_1798 ) ( not ( = ?auto_1797 ?auto_1798 ) ) ( not ( = ?auto_1797 ?auto_1807 ) ) ( not ( = ?auto_1798 ?auto_1807 ) ) ( not ( = ?auto_1801 ?auto_1817 ) ) ( IS-CRATE ?auto_1797 ) ( AVAILABLE ?auto_1817 ) ( SURFACE-AT ?auto_1797 ?auto_1813 ) ( ON ?auto_1797 ?auto_1815 ) ( CLEAR ?auto_1797 ) ( not ( = ?auto_1796 ?auto_1797 ) ) ( not ( = ?auto_1796 ?auto_1815 ) ) ( not ( = ?auto_1797 ?auto_1815 ) ) ( IS-CRATE ?auto_1796 ) ( not ( = ?auto_1806 ?auto_1800 ) ) ( HOIST-AT ?auto_1810 ?auto_1806 ) ( AVAILABLE ?auto_1810 ) ( SURFACE-AT ?auto_1796 ?auto_1806 ) ( ON ?auto_1796 ?auto_1812 ) ( CLEAR ?auto_1796 ) ( not ( = ?auto_1795 ?auto_1796 ) ) ( not ( = ?auto_1795 ?auto_1812 ) ) ( not ( = ?auto_1796 ?auto_1812 ) ) ( not ( = ?auto_1801 ?auto_1810 ) ) ( IS-CRATE ?auto_1795 ) ( not ( = ?auto_1811 ?auto_1800 ) ) ( HOIST-AT ?auto_1809 ?auto_1811 ) ( AVAILABLE ?auto_1809 ) ( SURFACE-AT ?auto_1795 ?auto_1811 ) ( ON ?auto_1795 ?auto_1814 ) ( CLEAR ?auto_1795 ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1814 ) ) ( not ( = ?auto_1795 ?auto_1814 ) ) ( not ( = ?auto_1801 ?auto_1809 ) ) ( SURFACE-AT ?auto_1793 ?auto_1800 ) ( CLEAR ?auto_1793 ) ( IS-CRATE ?auto_1794 ) ( AVAILABLE ?auto_1801 ) ( not ( = ?auto_1816 ?auto_1800 ) ) ( HOIST-AT ?auto_1818 ?auto_1816 ) ( AVAILABLE ?auto_1818 ) ( SURFACE-AT ?auto_1794 ?auto_1816 ) ( ON ?auto_1794 ?auto_1808 ) ( CLEAR ?auto_1794 ) ( TRUCK-AT ?auto_1802 ?auto_1800 ) ( not ( = ?auto_1793 ?auto_1794 ) ) ( not ( = ?auto_1793 ?auto_1808 ) ) ( not ( = ?auto_1794 ?auto_1808 ) ) ( not ( = ?auto_1801 ?auto_1818 ) ) ( not ( = ?auto_1793 ?auto_1795 ) ) ( not ( = ?auto_1793 ?auto_1814 ) ) ( not ( = ?auto_1795 ?auto_1808 ) ) ( not ( = ?auto_1811 ?auto_1816 ) ) ( not ( = ?auto_1809 ?auto_1818 ) ) ( not ( = ?auto_1814 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1796 ) ) ( not ( = ?auto_1793 ?auto_1812 ) ) ( not ( = ?auto_1794 ?auto_1796 ) ) ( not ( = ?auto_1794 ?auto_1812 ) ) ( not ( = ?auto_1796 ?auto_1814 ) ) ( not ( = ?auto_1796 ?auto_1808 ) ) ( not ( = ?auto_1806 ?auto_1811 ) ) ( not ( = ?auto_1806 ?auto_1816 ) ) ( not ( = ?auto_1810 ?auto_1809 ) ) ( not ( = ?auto_1810 ?auto_1818 ) ) ( not ( = ?auto_1812 ?auto_1814 ) ) ( not ( = ?auto_1812 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1797 ) ) ( not ( = ?auto_1793 ?auto_1815 ) ) ( not ( = ?auto_1794 ?auto_1797 ) ) ( not ( = ?auto_1794 ?auto_1815 ) ) ( not ( = ?auto_1795 ?auto_1797 ) ) ( not ( = ?auto_1795 ?auto_1815 ) ) ( not ( = ?auto_1797 ?auto_1812 ) ) ( not ( = ?auto_1797 ?auto_1814 ) ) ( not ( = ?auto_1797 ?auto_1808 ) ) ( not ( = ?auto_1813 ?auto_1806 ) ) ( not ( = ?auto_1813 ?auto_1811 ) ) ( not ( = ?auto_1813 ?auto_1816 ) ) ( not ( = ?auto_1817 ?auto_1810 ) ) ( not ( = ?auto_1817 ?auto_1809 ) ) ( not ( = ?auto_1817 ?auto_1818 ) ) ( not ( = ?auto_1815 ?auto_1812 ) ) ( not ( = ?auto_1815 ?auto_1814 ) ) ( not ( = ?auto_1815 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1798 ) ) ( not ( = ?auto_1793 ?auto_1807 ) ) ( not ( = ?auto_1794 ?auto_1798 ) ) ( not ( = ?auto_1794 ?auto_1807 ) ) ( not ( = ?auto_1795 ?auto_1798 ) ) ( not ( = ?auto_1795 ?auto_1807 ) ) ( not ( = ?auto_1796 ?auto_1798 ) ) ( not ( = ?auto_1796 ?auto_1807 ) ) ( not ( = ?auto_1798 ?auto_1815 ) ) ( not ( = ?auto_1798 ?auto_1812 ) ) ( not ( = ?auto_1798 ?auto_1814 ) ) ( not ( = ?auto_1798 ?auto_1808 ) ) ( not ( = ?auto_1807 ?auto_1815 ) ) ( not ( = ?auto_1807 ?auto_1812 ) ) ( not ( = ?auto_1807 ?auto_1814 ) ) ( not ( = ?auto_1807 ?auto_1808 ) ) ( not ( = ?auto_1793 ?auto_1799 ) ) ( not ( = ?auto_1793 ?auto_1805 ) ) ( not ( = ?auto_1794 ?auto_1799 ) ) ( not ( = ?auto_1794 ?auto_1805 ) ) ( not ( = ?auto_1795 ?auto_1799 ) ) ( not ( = ?auto_1795 ?auto_1805 ) ) ( not ( = ?auto_1796 ?auto_1799 ) ) ( not ( = ?auto_1796 ?auto_1805 ) ) ( not ( = ?auto_1797 ?auto_1799 ) ) ( not ( = ?auto_1797 ?auto_1805 ) ) ( not ( = ?auto_1799 ?auto_1807 ) ) ( not ( = ?auto_1799 ?auto_1815 ) ) ( not ( = ?auto_1799 ?auto_1812 ) ) ( not ( = ?auto_1799 ?auto_1814 ) ) ( not ( = ?auto_1799 ?auto_1808 ) ) ( not ( = ?auto_1803 ?auto_1813 ) ) ( not ( = ?auto_1803 ?auto_1806 ) ) ( not ( = ?auto_1803 ?auto_1811 ) ) ( not ( = ?auto_1803 ?auto_1816 ) ) ( not ( = ?auto_1804 ?auto_1817 ) ) ( not ( = ?auto_1804 ?auto_1810 ) ) ( not ( = ?auto_1804 ?auto_1809 ) ) ( not ( = ?auto_1804 ?auto_1818 ) ) ( not ( = ?auto_1805 ?auto_1807 ) ) ( not ( = ?auto_1805 ?auto_1815 ) ) ( not ( = ?auto_1805 ?auto_1812 ) ) ( not ( = ?auto_1805 ?auto_1814 ) ) ( not ( = ?auto_1805 ?auto_1808 ) ) )
    :subtasks
    ( ( MAKE-5CRATE ?auto_1793 ?auto_1794 ?auto_1795 ?auto_1796 ?auto_1797 ?auto_1798 )
      ( MAKE-1CRATE ?auto_1798 ?auto_1799 )
      ( MAKE-6CRATE-VERIFY ?auto_1793 ?auto_1794 ?auto_1795 ?auto_1796 ?auto_1797 ?auto_1798 ?auto_1799 ) )
  )

)

