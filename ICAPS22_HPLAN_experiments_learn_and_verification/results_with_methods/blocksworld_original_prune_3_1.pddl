( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1705 - BLOCK
      ?auto_1706 - BLOCK
      ?auto_1707 - BLOCK
    )
    :vars
    (
      ?auto_1708 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1708 ?auto_1707 ) ( CLEAR ?auto_1708 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1705 ) ( ON ?auto_1706 ?auto_1705 ) ( ON ?auto_1707 ?auto_1706 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( not ( = ?auto_1705 ?auto_1708 ) ) ( not ( = ?auto_1706 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1708 ) ) ( not ( = ?auto_1707 ?auto_1708 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1708 ?auto_1707 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1710 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1710 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1710 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1711 - BLOCK
    )
    :vars
    (
      ?auto_1712 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1711 ?auto_1712 ) ( CLEAR ?auto_1711 ) ( HAND-EMPTY ) ( not ( = ?auto_1711 ?auto_1712 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1711 ?auto_1712 )
      ( MAKE-1PILE ?auto_1711 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1715 - BLOCK
      ?auto_1716 - BLOCK
    )
    :vars
    (
      ?auto_1717 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1717 ?auto_1716 ) ( CLEAR ?auto_1717 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1715 ) ( ON ?auto_1716 ?auto_1715 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1717 ?auto_1716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1718 - BLOCK
      ?auto_1719 - BLOCK
    )
    :vars
    (
      ?auto_1720 - BLOCK
      ?auto_1721 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1720 ?auto_1719 ) ( CLEAR ?auto_1720 ) ( ON-TABLE ?auto_1718 ) ( ON ?auto_1719 ?auto_1718 ) ( not ( = ?auto_1718 ?auto_1719 ) ) ( not ( = ?auto_1718 ?auto_1720 ) ) ( not ( = ?auto_1719 ?auto_1720 ) ) ( HOLDING ?auto_1721 ) ( not ( = ?auto_1718 ?auto_1721 ) ) ( not ( = ?auto_1719 ?auto_1721 ) ) ( not ( = ?auto_1720 ?auto_1721 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1721 )
      ( MAKE-2PILE ?auto_1718 ?auto_1719 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1722 - BLOCK
      ?auto_1723 - BLOCK
    )
    :vars
    (
      ?auto_1724 - BLOCK
      ?auto_1725 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1724 ?auto_1723 ) ( ON-TABLE ?auto_1722 ) ( ON ?auto_1723 ?auto_1722 ) ( not ( = ?auto_1722 ?auto_1723 ) ) ( not ( = ?auto_1722 ?auto_1724 ) ) ( not ( = ?auto_1723 ?auto_1724 ) ) ( not ( = ?auto_1722 ?auto_1725 ) ) ( not ( = ?auto_1723 ?auto_1725 ) ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( ON ?auto_1725 ?auto_1724 ) ( CLEAR ?auto_1725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1722 ?auto_1723 ?auto_1724 )
      ( MAKE-2PILE ?auto_1722 ?auto_1723 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1728 - BLOCK
      ?auto_1729 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1729 ) ( CLEAR ?auto_1728 ) ( ON-TABLE ?auto_1728 ) ( not ( = ?auto_1728 ?auto_1729 ) ) )
    :subtasks
    ( ( !STACK ?auto_1729 ?auto_1728 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1730 - BLOCK
      ?auto_1731 - BLOCK
    )
    :vars
    (
      ?auto_1732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1730 ) ( ON-TABLE ?auto_1730 ) ( not ( = ?auto_1730 ?auto_1731 ) ) ( ON ?auto_1731 ?auto_1732 ) ( CLEAR ?auto_1731 ) ( HAND-EMPTY ) ( not ( = ?auto_1730 ?auto_1732 ) ) ( not ( = ?auto_1731 ?auto_1732 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1731 ?auto_1732 )
      ( MAKE-2PILE ?auto_1730 ?auto_1731 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1733 - BLOCK
      ?auto_1734 - BLOCK
    )
    :vars
    (
      ?auto_1735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1733 ?auto_1734 ) ) ( ON ?auto_1734 ?auto_1735 ) ( CLEAR ?auto_1734 ) ( not ( = ?auto_1733 ?auto_1735 ) ) ( not ( = ?auto_1734 ?auto_1735 ) ) ( HOLDING ?auto_1733 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1733 )
      ( MAKE-2PILE ?auto_1733 ?auto_1734 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1736 - BLOCK
      ?auto_1737 - BLOCK
    )
    :vars
    (
      ?auto_1738 - BLOCK
      ?auto_1739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1736 ?auto_1737 ) ) ( ON ?auto_1737 ?auto_1738 ) ( not ( = ?auto_1736 ?auto_1738 ) ) ( not ( = ?auto_1737 ?auto_1738 ) ) ( ON ?auto_1736 ?auto_1737 ) ( CLEAR ?auto_1736 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1739 ) ( ON ?auto_1738 ?auto_1739 ) ( not ( = ?auto_1739 ?auto_1738 ) ) ( not ( = ?auto_1739 ?auto_1737 ) ) ( not ( = ?auto_1739 ?auto_1736 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1739 ?auto_1738 ?auto_1737 )
      ( MAKE-2PILE ?auto_1736 ?auto_1737 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1741 - BLOCK
    )
    :vars
    (
      ?auto_1742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1742 ?auto_1741 ) ( CLEAR ?auto_1742 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1741 ) ( not ( = ?auto_1741 ?auto_1742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1742 ?auto_1741 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1743 - BLOCK
    )
    :vars
    (
      ?auto_1744 - BLOCK
      ?auto_1745 - BLOCK
      ?auto_1746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1744 ?auto_1743 ) ( CLEAR ?auto_1744 ) ( ON-TABLE ?auto_1743 ) ( not ( = ?auto_1743 ?auto_1744 ) ) ( HOLDING ?auto_1745 ) ( CLEAR ?auto_1746 ) ( not ( = ?auto_1743 ?auto_1745 ) ) ( not ( = ?auto_1743 ?auto_1746 ) ) ( not ( = ?auto_1744 ?auto_1745 ) ) ( not ( = ?auto_1744 ?auto_1746 ) ) ( not ( = ?auto_1745 ?auto_1746 ) ) )
    :subtasks
    ( ( !STACK ?auto_1745 ?auto_1746 )
      ( MAKE-1PILE ?auto_1743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1833 - BLOCK
    )
    :vars
    (
      ?auto_1835 - BLOCK
      ?auto_1834 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1835 ?auto_1833 ) ( ON-TABLE ?auto_1833 ) ( not ( = ?auto_1833 ?auto_1835 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( not ( = ?auto_1835 ?auto_1834 ) ) ( ON ?auto_1834 ?auto_1835 ) ( CLEAR ?auto_1834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1833 ?auto_1835 )
      ( MAKE-1PILE ?auto_1833 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1751 - BLOCK
    )
    :vars
    (
      ?auto_1753 - BLOCK
      ?auto_1754 - BLOCK
      ?auto_1752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1753 ?auto_1751 ) ( ON-TABLE ?auto_1751 ) ( not ( = ?auto_1751 ?auto_1753 ) ) ( not ( = ?auto_1751 ?auto_1754 ) ) ( not ( = ?auto_1751 ?auto_1752 ) ) ( not ( = ?auto_1753 ?auto_1754 ) ) ( not ( = ?auto_1753 ?auto_1752 ) ) ( not ( = ?auto_1754 ?auto_1752 ) ) ( ON ?auto_1754 ?auto_1753 ) ( CLEAR ?auto_1754 ) ( HOLDING ?auto_1752 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1752 )
      ( MAKE-1PILE ?auto_1751 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1755 - BLOCK
    )
    :vars
    (
      ?auto_1756 - BLOCK
      ?auto_1757 - BLOCK
      ?auto_1758 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1756 ?auto_1755 ) ( ON-TABLE ?auto_1755 ) ( not ( = ?auto_1755 ?auto_1756 ) ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( not ( = ?auto_1755 ?auto_1758 ) ) ( not ( = ?auto_1756 ?auto_1757 ) ) ( not ( = ?auto_1756 ?auto_1758 ) ) ( not ( = ?auto_1757 ?auto_1758 ) ) ( ON ?auto_1757 ?auto_1756 ) ( ON ?auto_1758 ?auto_1757 ) ( CLEAR ?auto_1758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1755 ?auto_1756 ?auto_1757 )
      ( MAKE-1PILE ?auto_1755 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1762 - BLOCK
      ?auto_1763 - BLOCK
      ?auto_1764 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1764 ) ( CLEAR ?auto_1763 ) ( ON-TABLE ?auto_1762 ) ( ON ?auto_1763 ?auto_1762 ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1764 ) ) ( not ( = ?auto_1763 ?auto_1764 ) ) )
    :subtasks
    ( ( !STACK ?auto_1764 ?auto_1763 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1765 - BLOCK
      ?auto_1766 - BLOCK
      ?auto_1767 - BLOCK
    )
    :vars
    (
      ?auto_1768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1766 ) ( ON-TABLE ?auto_1765 ) ( ON ?auto_1766 ?auto_1765 ) ( not ( = ?auto_1765 ?auto_1766 ) ) ( not ( = ?auto_1765 ?auto_1767 ) ) ( not ( = ?auto_1766 ?auto_1767 ) ) ( ON ?auto_1767 ?auto_1768 ) ( CLEAR ?auto_1767 ) ( HAND-EMPTY ) ( not ( = ?auto_1765 ?auto_1768 ) ) ( not ( = ?auto_1766 ?auto_1768 ) ) ( not ( = ?auto_1767 ?auto_1768 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1767 ?auto_1768 )
      ( MAKE-3PILE ?auto_1765 ?auto_1766 ?auto_1767 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1769 - BLOCK
      ?auto_1770 - BLOCK
      ?auto_1771 - BLOCK
    )
    :vars
    (
      ?auto_1772 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1769 ) ( not ( = ?auto_1769 ?auto_1770 ) ) ( not ( = ?auto_1769 ?auto_1771 ) ) ( not ( = ?auto_1770 ?auto_1771 ) ) ( ON ?auto_1771 ?auto_1772 ) ( CLEAR ?auto_1771 ) ( not ( = ?auto_1769 ?auto_1772 ) ) ( not ( = ?auto_1770 ?auto_1772 ) ) ( not ( = ?auto_1771 ?auto_1772 ) ) ( HOLDING ?auto_1770 ) ( CLEAR ?auto_1769 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1769 ?auto_1770 )
      ( MAKE-3PILE ?auto_1769 ?auto_1770 ?auto_1771 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1773 - BLOCK
      ?auto_1774 - BLOCK
      ?auto_1775 - BLOCK
    )
    :vars
    (
      ?auto_1776 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1773 ) ( not ( = ?auto_1773 ?auto_1774 ) ) ( not ( = ?auto_1773 ?auto_1775 ) ) ( not ( = ?auto_1774 ?auto_1775 ) ) ( ON ?auto_1775 ?auto_1776 ) ( not ( = ?auto_1773 ?auto_1776 ) ) ( not ( = ?auto_1774 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( CLEAR ?auto_1773 ) ( ON ?auto_1774 ?auto_1775 ) ( CLEAR ?auto_1774 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1776 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1776 ?auto_1775 )
      ( MAKE-3PILE ?auto_1773 ?auto_1774 ?auto_1775 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1777 - BLOCK
      ?auto_1778 - BLOCK
      ?auto_1779 - BLOCK
    )
    :vars
    (
      ?auto_1780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1777 ?auto_1778 ) ) ( not ( = ?auto_1777 ?auto_1779 ) ) ( not ( = ?auto_1778 ?auto_1779 ) ) ( ON ?auto_1779 ?auto_1780 ) ( not ( = ?auto_1777 ?auto_1780 ) ) ( not ( = ?auto_1778 ?auto_1780 ) ) ( not ( = ?auto_1779 ?auto_1780 ) ) ( ON ?auto_1778 ?auto_1779 ) ( CLEAR ?auto_1778 ) ( ON-TABLE ?auto_1780 ) ( HOLDING ?auto_1777 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1777 )
      ( MAKE-3PILE ?auto_1777 ?auto_1778 ?auto_1779 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1781 - BLOCK
      ?auto_1782 - BLOCK
      ?auto_1783 - BLOCK
    )
    :vars
    (
      ?auto_1784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1781 ?auto_1782 ) ) ( not ( = ?auto_1781 ?auto_1783 ) ) ( not ( = ?auto_1782 ?auto_1783 ) ) ( ON ?auto_1783 ?auto_1784 ) ( not ( = ?auto_1781 ?auto_1784 ) ) ( not ( = ?auto_1782 ?auto_1784 ) ) ( not ( = ?auto_1783 ?auto_1784 ) ) ( ON ?auto_1782 ?auto_1783 ) ( ON-TABLE ?auto_1784 ) ( ON ?auto_1781 ?auto_1782 ) ( CLEAR ?auto_1781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1784 ?auto_1783 ?auto_1782 )
      ( MAKE-3PILE ?auto_1781 ?auto_1782 ?auto_1783 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1811 - BLOCK
    )
    :vars
    (
      ?auto_1812 - BLOCK
      ?auto_1813 - BLOCK
      ?auto_1814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1811 ?auto_1812 ) ( CLEAR ?auto_1811 ) ( not ( = ?auto_1811 ?auto_1812 ) ) ( HOLDING ?auto_1813 ) ( CLEAR ?auto_1814 ) ( not ( = ?auto_1811 ?auto_1813 ) ) ( not ( = ?auto_1811 ?auto_1814 ) ) ( not ( = ?auto_1812 ?auto_1813 ) ) ( not ( = ?auto_1812 ?auto_1814 ) ) ( not ( = ?auto_1813 ?auto_1814 ) ) )
    :subtasks
    ( ( !STACK ?auto_1813 ?auto_1814 )
      ( MAKE-1PILE ?auto_1811 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1815 - BLOCK
    )
    :vars
    (
      ?auto_1818 - BLOCK
      ?auto_1816 - BLOCK
      ?auto_1817 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1815 ?auto_1818 ) ( not ( = ?auto_1815 ?auto_1818 ) ) ( CLEAR ?auto_1816 ) ( not ( = ?auto_1815 ?auto_1817 ) ) ( not ( = ?auto_1815 ?auto_1816 ) ) ( not ( = ?auto_1818 ?auto_1817 ) ) ( not ( = ?auto_1818 ?auto_1816 ) ) ( not ( = ?auto_1817 ?auto_1816 ) ) ( ON ?auto_1817 ?auto_1815 ) ( CLEAR ?auto_1817 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1818 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1818 ?auto_1815 )
      ( MAKE-1PILE ?auto_1815 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1819 - BLOCK
    )
    :vars
    (
      ?auto_1822 - BLOCK
      ?auto_1820 - BLOCK
      ?auto_1821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1819 ?auto_1822 ) ( not ( = ?auto_1819 ?auto_1822 ) ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( not ( = ?auto_1819 ?auto_1821 ) ) ( not ( = ?auto_1822 ?auto_1820 ) ) ( not ( = ?auto_1822 ?auto_1821 ) ) ( not ( = ?auto_1820 ?auto_1821 ) ) ( ON ?auto_1820 ?auto_1819 ) ( CLEAR ?auto_1820 ) ( ON-TABLE ?auto_1822 ) ( HOLDING ?auto_1821 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1821 )
      ( MAKE-1PILE ?auto_1819 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1823 - BLOCK
    )
    :vars
    (
      ?auto_1824 - BLOCK
      ?auto_1826 - BLOCK
      ?auto_1825 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1823 ?auto_1824 ) ( not ( = ?auto_1823 ?auto_1824 ) ) ( not ( = ?auto_1823 ?auto_1826 ) ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( not ( = ?auto_1824 ?auto_1826 ) ) ( not ( = ?auto_1824 ?auto_1825 ) ) ( not ( = ?auto_1826 ?auto_1825 ) ) ( ON ?auto_1826 ?auto_1823 ) ( ON-TABLE ?auto_1824 ) ( ON ?auto_1825 ?auto_1826 ) ( CLEAR ?auto_1825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1824 ?auto_1823 ?auto_1826 )
      ( MAKE-1PILE ?auto_1823 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1830 - BLOCK
    )
    :vars
    (
      ?auto_1831 - BLOCK
      ?auto_1832 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1831 ?auto_1830 ) ( CLEAR ?auto_1831 ) ( ON-TABLE ?auto_1830 ) ( not ( = ?auto_1830 ?auto_1831 ) ) ( HOLDING ?auto_1832 ) ( not ( = ?auto_1830 ?auto_1832 ) ) ( not ( = ?auto_1831 ?auto_1832 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1832 )
      ( MAKE-1PILE ?auto_1830 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1855 - BLOCK
      ?auto_1856 - BLOCK
    )
    :vars
    (
      ?auto_1857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1855 ?auto_1856 ) ) ( ON ?auto_1856 ?auto_1857 ) ( not ( = ?auto_1855 ?auto_1857 ) ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( ON ?auto_1855 ?auto_1856 ) ( CLEAR ?auto_1855 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1857 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1857 ?auto_1856 )
      ( MAKE-2PILE ?auto_1855 ?auto_1856 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1860 - BLOCK
      ?auto_1861 - BLOCK
    )
    :vars
    (
      ?auto_1862 - BLOCK
      ?auto_1863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1860 ?auto_1861 ) ) ( ON ?auto_1861 ?auto_1862 ) ( CLEAR ?auto_1861 ) ( not ( = ?auto_1860 ?auto_1862 ) ) ( not ( = ?auto_1861 ?auto_1862 ) ) ( ON ?auto_1860 ?auto_1863 ) ( CLEAR ?auto_1860 ) ( HAND-EMPTY ) ( not ( = ?auto_1860 ?auto_1863 ) ) ( not ( = ?auto_1861 ?auto_1863 ) ) ( not ( = ?auto_1862 ?auto_1863 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1860 ?auto_1863 )
      ( MAKE-2PILE ?auto_1860 ?auto_1861 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1864 - BLOCK
      ?auto_1865 - BLOCK
    )
    :vars
    (
      ?auto_1867 - BLOCK
      ?auto_1866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1864 ?auto_1865 ) ) ( not ( = ?auto_1864 ?auto_1867 ) ) ( not ( = ?auto_1865 ?auto_1867 ) ) ( ON ?auto_1864 ?auto_1866 ) ( CLEAR ?auto_1864 ) ( not ( = ?auto_1864 ?auto_1866 ) ) ( not ( = ?auto_1865 ?auto_1866 ) ) ( not ( = ?auto_1867 ?auto_1866 ) ) ( HOLDING ?auto_1865 ) ( CLEAR ?auto_1867 ) ( ON-TABLE ?auto_1867 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1867 ?auto_1865 )
      ( MAKE-2PILE ?auto_1864 ?auto_1865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1868 - BLOCK
      ?auto_1869 - BLOCK
    )
    :vars
    (
      ?auto_1870 - BLOCK
      ?auto_1871 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1868 ?auto_1869 ) ) ( not ( = ?auto_1868 ?auto_1870 ) ) ( not ( = ?auto_1869 ?auto_1870 ) ) ( ON ?auto_1868 ?auto_1871 ) ( not ( = ?auto_1868 ?auto_1871 ) ) ( not ( = ?auto_1869 ?auto_1871 ) ) ( not ( = ?auto_1870 ?auto_1871 ) ) ( CLEAR ?auto_1870 ) ( ON-TABLE ?auto_1870 ) ( ON ?auto_1869 ?auto_1868 ) ( CLEAR ?auto_1869 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1871 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1871 ?auto_1868 )
      ( MAKE-2PILE ?auto_1868 ?auto_1869 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1872 - BLOCK
      ?auto_1873 - BLOCK
    )
    :vars
    (
      ?auto_1875 - BLOCK
      ?auto_1874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1872 ?auto_1873 ) ) ( not ( = ?auto_1872 ?auto_1875 ) ) ( not ( = ?auto_1873 ?auto_1875 ) ) ( ON ?auto_1872 ?auto_1874 ) ( not ( = ?auto_1872 ?auto_1874 ) ) ( not ( = ?auto_1873 ?auto_1874 ) ) ( not ( = ?auto_1875 ?auto_1874 ) ) ( ON ?auto_1873 ?auto_1872 ) ( CLEAR ?auto_1873 ) ( ON-TABLE ?auto_1874 ) ( HOLDING ?auto_1875 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1875 )
      ( MAKE-2PILE ?auto_1872 ?auto_1873 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1876 - BLOCK
      ?auto_1877 - BLOCK
    )
    :vars
    (
      ?auto_1879 - BLOCK
      ?auto_1878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1876 ?auto_1877 ) ) ( not ( = ?auto_1876 ?auto_1879 ) ) ( not ( = ?auto_1877 ?auto_1879 ) ) ( ON ?auto_1876 ?auto_1878 ) ( not ( = ?auto_1876 ?auto_1878 ) ) ( not ( = ?auto_1877 ?auto_1878 ) ) ( not ( = ?auto_1879 ?auto_1878 ) ) ( ON ?auto_1877 ?auto_1876 ) ( ON-TABLE ?auto_1878 ) ( ON ?auto_1879 ?auto_1877 ) ( CLEAR ?auto_1879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1878 ?auto_1876 ?auto_1877 )
      ( MAKE-2PILE ?auto_1876 ?auto_1877 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1886 - BLOCK
      ?auto_1887 - BLOCK
      ?auto_1888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1887 ) ( ON-TABLE ?auto_1886 ) ( ON ?auto_1887 ?auto_1886 ) ( not ( = ?auto_1886 ?auto_1887 ) ) ( not ( = ?auto_1886 ?auto_1888 ) ) ( not ( = ?auto_1887 ?auto_1888 ) ) ( ON-TABLE ?auto_1888 ) ( CLEAR ?auto_1888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1888 )
      ( MAKE-3PILE ?auto_1886 ?auto_1887 ?auto_1888 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1889 - BLOCK
      ?auto_1890 - BLOCK
      ?auto_1891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1889 ) ( not ( = ?auto_1889 ?auto_1890 ) ) ( not ( = ?auto_1889 ?auto_1891 ) ) ( not ( = ?auto_1890 ?auto_1891 ) ) ( ON-TABLE ?auto_1891 ) ( CLEAR ?auto_1891 ) ( HOLDING ?auto_1890 ) ( CLEAR ?auto_1889 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1889 ?auto_1890 )
      ( MAKE-3PILE ?auto_1889 ?auto_1890 ?auto_1891 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1892 - BLOCK
      ?auto_1893 - BLOCK
      ?auto_1894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1892 ) ( not ( = ?auto_1892 ?auto_1893 ) ) ( not ( = ?auto_1892 ?auto_1894 ) ) ( not ( = ?auto_1893 ?auto_1894 ) ) ( ON-TABLE ?auto_1894 ) ( CLEAR ?auto_1892 ) ( ON ?auto_1893 ?auto_1894 ) ( CLEAR ?auto_1893 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1894 )
      ( MAKE-3PILE ?auto_1892 ?auto_1893 ?auto_1894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1895 - BLOCK
      ?auto_1896 - BLOCK
      ?auto_1897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1895 ?auto_1896 ) ) ( not ( = ?auto_1895 ?auto_1897 ) ) ( not ( = ?auto_1896 ?auto_1897 ) ) ( ON-TABLE ?auto_1897 ) ( ON ?auto_1896 ?auto_1897 ) ( CLEAR ?auto_1896 ) ( HOLDING ?auto_1895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1895 )
      ( MAKE-3PILE ?auto_1895 ?auto_1896 ?auto_1897 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1898 - BLOCK
      ?auto_1899 - BLOCK
      ?auto_1900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1898 ?auto_1899 ) ) ( not ( = ?auto_1898 ?auto_1900 ) ) ( not ( = ?auto_1899 ?auto_1900 ) ) ( ON-TABLE ?auto_1900 ) ( ON ?auto_1899 ?auto_1900 ) ( ON ?auto_1898 ?auto_1899 ) ( CLEAR ?auto_1898 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1900 ?auto_1899 )
      ( MAKE-3PILE ?auto_1898 ?auto_1899 ?auto_1900 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1904 - BLOCK
      ?auto_1905 - BLOCK
      ?auto_1906 - BLOCK
    )
    :vars
    (
      ?auto_1907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1904 ?auto_1905 ) ) ( not ( = ?auto_1904 ?auto_1906 ) ) ( not ( = ?auto_1905 ?auto_1906 ) ) ( ON-TABLE ?auto_1906 ) ( ON ?auto_1905 ?auto_1906 ) ( CLEAR ?auto_1905 ) ( ON ?auto_1904 ?auto_1907 ) ( CLEAR ?auto_1904 ) ( HAND-EMPTY ) ( not ( = ?auto_1904 ?auto_1907 ) ) ( not ( = ?auto_1905 ?auto_1907 ) ) ( not ( = ?auto_1906 ?auto_1907 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1904 ?auto_1907 )
      ( MAKE-3PILE ?auto_1904 ?auto_1905 ?auto_1906 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1908 - BLOCK
      ?auto_1909 - BLOCK
      ?auto_1910 - BLOCK
    )
    :vars
    (
      ?auto_1911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1908 ?auto_1909 ) ) ( not ( = ?auto_1908 ?auto_1910 ) ) ( not ( = ?auto_1909 ?auto_1910 ) ) ( ON-TABLE ?auto_1910 ) ( ON ?auto_1908 ?auto_1911 ) ( CLEAR ?auto_1908 ) ( not ( = ?auto_1908 ?auto_1911 ) ) ( not ( = ?auto_1909 ?auto_1911 ) ) ( not ( = ?auto_1910 ?auto_1911 ) ) ( HOLDING ?auto_1909 ) ( CLEAR ?auto_1910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1910 ?auto_1909 )
      ( MAKE-3PILE ?auto_1908 ?auto_1909 ?auto_1910 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1912 - BLOCK
      ?auto_1913 - BLOCK
      ?auto_1914 - BLOCK
    )
    :vars
    (
      ?auto_1915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1912 ?auto_1913 ) ) ( not ( = ?auto_1912 ?auto_1914 ) ) ( not ( = ?auto_1913 ?auto_1914 ) ) ( ON-TABLE ?auto_1914 ) ( ON ?auto_1912 ?auto_1915 ) ( not ( = ?auto_1912 ?auto_1915 ) ) ( not ( = ?auto_1913 ?auto_1915 ) ) ( not ( = ?auto_1914 ?auto_1915 ) ) ( CLEAR ?auto_1914 ) ( ON ?auto_1913 ?auto_1912 ) ( CLEAR ?auto_1913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1915 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1915 ?auto_1912 )
      ( MAKE-3PILE ?auto_1912 ?auto_1913 ?auto_1914 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1916 - BLOCK
      ?auto_1917 - BLOCK
      ?auto_1918 - BLOCK
    )
    :vars
    (
      ?auto_1919 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1916 ?auto_1917 ) ) ( not ( = ?auto_1916 ?auto_1918 ) ) ( not ( = ?auto_1917 ?auto_1918 ) ) ( ON ?auto_1916 ?auto_1919 ) ( not ( = ?auto_1916 ?auto_1919 ) ) ( not ( = ?auto_1917 ?auto_1919 ) ) ( not ( = ?auto_1918 ?auto_1919 ) ) ( ON ?auto_1917 ?auto_1916 ) ( CLEAR ?auto_1917 ) ( ON-TABLE ?auto_1919 ) ( HOLDING ?auto_1918 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1918 )
      ( MAKE-3PILE ?auto_1916 ?auto_1917 ?auto_1918 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1920 - BLOCK
      ?auto_1921 - BLOCK
      ?auto_1922 - BLOCK
    )
    :vars
    (
      ?auto_1923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1920 ?auto_1921 ) ) ( not ( = ?auto_1920 ?auto_1922 ) ) ( not ( = ?auto_1921 ?auto_1922 ) ) ( ON ?auto_1920 ?auto_1923 ) ( not ( = ?auto_1920 ?auto_1923 ) ) ( not ( = ?auto_1921 ?auto_1923 ) ) ( not ( = ?auto_1922 ?auto_1923 ) ) ( ON ?auto_1921 ?auto_1920 ) ( ON-TABLE ?auto_1923 ) ( ON ?auto_1922 ?auto_1921 ) ( CLEAR ?auto_1922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1923 ?auto_1920 ?auto_1921 )
      ( MAKE-3PILE ?auto_1920 ?auto_1921 ?auto_1922 ) )
  )

)

