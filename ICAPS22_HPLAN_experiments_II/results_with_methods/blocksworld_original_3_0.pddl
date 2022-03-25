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
      ?auto_1623 - BLOCK
      ?auto_1624 - BLOCK
      ?auto_1625 - BLOCK
    )
    :vars
    (
      ?auto_1626 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1626 ?auto_1625 ) ( CLEAR ?auto_1626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1623 ) ( ON ?auto_1624 ?auto_1623 ) ( ON ?auto_1625 ?auto_1624 ) ( not ( = ?auto_1623 ?auto_1624 ) ) ( not ( = ?auto_1623 ?auto_1625 ) ) ( not ( = ?auto_1623 ?auto_1626 ) ) ( not ( = ?auto_1624 ?auto_1625 ) ) ( not ( = ?auto_1624 ?auto_1626 ) ) ( not ( = ?auto_1625 ?auto_1626 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1626 ?auto_1625 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1628 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1628 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1628 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1629 - BLOCK
    )
    :vars
    (
      ?auto_1630 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1629 ?auto_1630 ) ( CLEAR ?auto_1629 ) ( HAND-EMPTY ) ( not ( = ?auto_1629 ?auto_1630 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1629 ?auto_1630 )
      ( MAKE-1PILE ?auto_1629 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1633 - BLOCK
      ?auto_1634 - BLOCK
    )
    :vars
    (
      ?auto_1635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1635 ?auto_1634 ) ( CLEAR ?auto_1635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1633 ) ( ON ?auto_1634 ?auto_1633 ) ( not ( = ?auto_1633 ?auto_1634 ) ) ( not ( = ?auto_1633 ?auto_1635 ) ) ( not ( = ?auto_1634 ?auto_1635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1635 ?auto_1634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1636 - BLOCK
      ?auto_1637 - BLOCK
    )
    :vars
    (
      ?auto_1638 - BLOCK
      ?auto_1639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1638 ?auto_1637 ) ( CLEAR ?auto_1638 ) ( ON-TABLE ?auto_1636 ) ( ON ?auto_1637 ?auto_1636 ) ( not ( = ?auto_1636 ?auto_1637 ) ) ( not ( = ?auto_1636 ?auto_1638 ) ) ( not ( = ?auto_1637 ?auto_1638 ) ) ( HOLDING ?auto_1639 ) ( not ( = ?auto_1636 ?auto_1639 ) ) ( not ( = ?auto_1637 ?auto_1639 ) ) ( not ( = ?auto_1638 ?auto_1639 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1639 )
      ( MAKE-2PILE ?auto_1636 ?auto_1637 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1640 - BLOCK
      ?auto_1641 - BLOCK
    )
    :vars
    (
      ?auto_1642 - BLOCK
      ?auto_1643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1642 ?auto_1641 ) ( ON-TABLE ?auto_1640 ) ( ON ?auto_1641 ?auto_1640 ) ( not ( = ?auto_1640 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1642 ) ) ( not ( = ?auto_1641 ?auto_1642 ) ) ( not ( = ?auto_1640 ?auto_1643 ) ) ( not ( = ?auto_1641 ?auto_1643 ) ) ( not ( = ?auto_1642 ?auto_1643 ) ) ( ON ?auto_1643 ?auto_1642 ) ( CLEAR ?auto_1643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1640 ?auto_1641 ?auto_1642 )
      ( MAKE-2PILE ?auto_1640 ?auto_1641 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1646 - BLOCK
      ?auto_1647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1647 ) ( CLEAR ?auto_1646 ) ( ON-TABLE ?auto_1646 ) ( not ( = ?auto_1646 ?auto_1647 ) ) )
    :subtasks
    ( ( !STACK ?auto_1647 ?auto_1646 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1648 - BLOCK
      ?auto_1649 - BLOCK
    )
    :vars
    (
      ?auto_1650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1648 ) ( ON-TABLE ?auto_1648 ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( ON ?auto_1649 ?auto_1650 ) ( CLEAR ?auto_1649 ) ( HAND-EMPTY ) ( not ( = ?auto_1648 ?auto_1650 ) ) ( not ( = ?auto_1649 ?auto_1650 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1649 ?auto_1650 )
      ( MAKE-2PILE ?auto_1648 ?auto_1649 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1651 - BLOCK
      ?auto_1652 - BLOCK
    )
    :vars
    (
      ?auto_1653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1651 ?auto_1652 ) ) ( ON ?auto_1652 ?auto_1653 ) ( CLEAR ?auto_1652 ) ( not ( = ?auto_1651 ?auto_1653 ) ) ( not ( = ?auto_1652 ?auto_1653 ) ) ( HOLDING ?auto_1651 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1651 )
      ( MAKE-2PILE ?auto_1651 ?auto_1652 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1654 - BLOCK
      ?auto_1655 - BLOCK
    )
    :vars
    (
      ?auto_1656 - BLOCK
      ?auto_1657 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1654 ?auto_1655 ) ) ( ON ?auto_1655 ?auto_1656 ) ( not ( = ?auto_1654 ?auto_1656 ) ) ( not ( = ?auto_1655 ?auto_1656 ) ) ( ON ?auto_1654 ?auto_1655 ) ( CLEAR ?auto_1654 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1657 ) ( ON ?auto_1656 ?auto_1657 ) ( not ( = ?auto_1657 ?auto_1656 ) ) ( not ( = ?auto_1657 ?auto_1655 ) ) ( not ( = ?auto_1657 ?auto_1654 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1657 ?auto_1656 ?auto_1655 )
      ( MAKE-2PILE ?auto_1654 ?auto_1655 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1659 - BLOCK
    )
    :vars
    (
      ?auto_1660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1660 ?auto_1659 ) ( CLEAR ?auto_1660 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1659 ) ( not ( = ?auto_1659 ?auto_1660 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1660 ?auto_1659 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1661 - BLOCK
    )
    :vars
    (
      ?auto_1662 - BLOCK
      ?auto_1663 - BLOCK
      ?auto_1664 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1662 ?auto_1661 ) ( CLEAR ?auto_1662 ) ( ON-TABLE ?auto_1661 ) ( not ( = ?auto_1661 ?auto_1662 ) ) ( HOLDING ?auto_1663 ) ( CLEAR ?auto_1664 ) ( not ( = ?auto_1661 ?auto_1663 ) ) ( not ( = ?auto_1661 ?auto_1664 ) ) ( not ( = ?auto_1662 ?auto_1663 ) ) ( not ( = ?auto_1662 ?auto_1664 ) ) ( not ( = ?auto_1663 ?auto_1664 ) ) )
    :subtasks
    ( ( !STACK ?auto_1663 ?auto_1664 )
      ( MAKE-1PILE ?auto_1661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1665 - BLOCK
    )
    :vars
    (
      ?auto_1666 - BLOCK
      ?auto_1668 - BLOCK
      ?auto_1667 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1666 ?auto_1665 ) ( ON-TABLE ?auto_1665 ) ( not ( = ?auto_1665 ?auto_1666 ) ) ( CLEAR ?auto_1668 ) ( not ( = ?auto_1665 ?auto_1667 ) ) ( not ( = ?auto_1665 ?auto_1668 ) ) ( not ( = ?auto_1666 ?auto_1667 ) ) ( not ( = ?auto_1666 ?auto_1668 ) ) ( not ( = ?auto_1667 ?auto_1668 ) ) ( ON ?auto_1667 ?auto_1666 ) ( CLEAR ?auto_1667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1665 ?auto_1666 )
      ( MAKE-1PILE ?auto_1665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1669 - BLOCK
    )
    :vars
    (
      ?auto_1671 - BLOCK
      ?auto_1672 - BLOCK
      ?auto_1670 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1671 ?auto_1669 ) ( ON-TABLE ?auto_1669 ) ( not ( = ?auto_1669 ?auto_1671 ) ) ( not ( = ?auto_1669 ?auto_1672 ) ) ( not ( = ?auto_1669 ?auto_1670 ) ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( not ( = ?auto_1671 ?auto_1670 ) ) ( not ( = ?auto_1672 ?auto_1670 ) ) ( ON ?auto_1672 ?auto_1671 ) ( CLEAR ?auto_1672 ) ( HOLDING ?auto_1670 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1670 )
      ( MAKE-1PILE ?auto_1669 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1673 - BLOCK
    )
    :vars
    (
      ?auto_1676 - BLOCK
      ?auto_1674 - BLOCK
      ?auto_1675 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1676 ?auto_1673 ) ( ON-TABLE ?auto_1673 ) ( not ( = ?auto_1673 ?auto_1676 ) ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1676 ?auto_1674 ) ) ( not ( = ?auto_1676 ?auto_1675 ) ) ( not ( = ?auto_1674 ?auto_1675 ) ) ( ON ?auto_1674 ?auto_1676 ) ( ON ?auto_1675 ?auto_1674 ) ( CLEAR ?auto_1675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1673 ?auto_1676 ?auto_1674 )
      ( MAKE-1PILE ?auto_1673 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1680 - BLOCK
      ?auto_1681 - BLOCK
      ?auto_1682 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1682 ) ( CLEAR ?auto_1681 ) ( ON-TABLE ?auto_1680 ) ( ON ?auto_1681 ?auto_1680 ) ( not ( = ?auto_1680 ?auto_1681 ) ) ( not ( = ?auto_1680 ?auto_1682 ) ) ( not ( = ?auto_1681 ?auto_1682 ) ) )
    :subtasks
    ( ( !STACK ?auto_1682 ?auto_1681 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1683 - BLOCK
      ?auto_1684 - BLOCK
      ?auto_1685 - BLOCK
    )
    :vars
    (
      ?auto_1686 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1684 ) ( ON-TABLE ?auto_1683 ) ( ON ?auto_1684 ?auto_1683 ) ( not ( = ?auto_1683 ?auto_1684 ) ) ( not ( = ?auto_1683 ?auto_1685 ) ) ( not ( = ?auto_1684 ?auto_1685 ) ) ( ON ?auto_1685 ?auto_1686 ) ( CLEAR ?auto_1685 ) ( HAND-EMPTY ) ( not ( = ?auto_1683 ?auto_1686 ) ) ( not ( = ?auto_1684 ?auto_1686 ) ) ( not ( = ?auto_1685 ?auto_1686 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1685 ?auto_1686 )
      ( MAKE-3PILE ?auto_1683 ?auto_1684 ?auto_1685 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1687 - BLOCK
      ?auto_1688 - BLOCK
      ?auto_1689 - BLOCK
    )
    :vars
    (
      ?auto_1690 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1687 ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( ON ?auto_1689 ?auto_1690 ) ( CLEAR ?auto_1689 ) ( not ( = ?auto_1687 ?auto_1690 ) ) ( not ( = ?auto_1688 ?auto_1690 ) ) ( not ( = ?auto_1689 ?auto_1690 ) ) ( HOLDING ?auto_1688 ) ( CLEAR ?auto_1687 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1687 ?auto_1688 )
      ( MAKE-3PILE ?auto_1687 ?auto_1688 ?auto_1689 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1691 - BLOCK
      ?auto_1692 - BLOCK
      ?auto_1693 - BLOCK
    )
    :vars
    (
      ?auto_1694 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1691 ) ( not ( = ?auto_1691 ?auto_1692 ) ) ( not ( = ?auto_1691 ?auto_1693 ) ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( ON ?auto_1693 ?auto_1694 ) ( not ( = ?auto_1691 ?auto_1694 ) ) ( not ( = ?auto_1692 ?auto_1694 ) ) ( not ( = ?auto_1693 ?auto_1694 ) ) ( CLEAR ?auto_1691 ) ( ON ?auto_1692 ?auto_1693 ) ( CLEAR ?auto_1692 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1694 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1694 ?auto_1693 )
      ( MAKE-3PILE ?auto_1691 ?auto_1692 ?auto_1693 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1695 - BLOCK
      ?auto_1696 - BLOCK
      ?auto_1697 - BLOCK
    )
    :vars
    (
      ?auto_1698 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1695 ?auto_1696 ) ) ( not ( = ?auto_1695 ?auto_1697 ) ) ( not ( = ?auto_1696 ?auto_1697 ) ) ( ON ?auto_1697 ?auto_1698 ) ( not ( = ?auto_1695 ?auto_1698 ) ) ( not ( = ?auto_1696 ?auto_1698 ) ) ( not ( = ?auto_1697 ?auto_1698 ) ) ( ON ?auto_1696 ?auto_1697 ) ( CLEAR ?auto_1696 ) ( ON-TABLE ?auto_1698 ) ( HOLDING ?auto_1695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1695 )
      ( MAKE-3PILE ?auto_1695 ?auto_1696 ?auto_1697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1699 - BLOCK
      ?auto_1700 - BLOCK
      ?auto_1701 - BLOCK
    )
    :vars
    (
      ?auto_1702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1699 ?auto_1700 ) ) ( not ( = ?auto_1699 ?auto_1701 ) ) ( not ( = ?auto_1700 ?auto_1701 ) ) ( ON ?auto_1701 ?auto_1702 ) ( not ( = ?auto_1699 ?auto_1702 ) ) ( not ( = ?auto_1700 ?auto_1702 ) ) ( not ( = ?auto_1701 ?auto_1702 ) ) ( ON ?auto_1700 ?auto_1701 ) ( ON-TABLE ?auto_1702 ) ( ON ?auto_1699 ?auto_1700 ) ( CLEAR ?auto_1699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1702 ?auto_1701 ?auto_1700 )
      ( MAKE-3PILE ?auto_1699 ?auto_1700 ?auto_1701 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1705 - BLOCK
      ?auto_1706 - BLOCK
    )
    :vars
    (
      ?auto_1707 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1707 ?auto_1706 ) ( CLEAR ?auto_1707 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1705 ) ( ON ?auto_1706 ?auto_1705 ) ( not ( = ?auto_1705 ?auto_1706 ) ) ( not ( = ?auto_1705 ?auto_1707 ) ) ( not ( = ?auto_1706 ?auto_1707 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1707 ?auto_1706 ) )
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
      ?auto_1718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1715 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( ON ?auto_1717 ?auto_1718 ) ( CLEAR ?auto_1717 ) ( not ( = ?auto_1715 ?auto_1718 ) ) ( not ( = ?auto_1716 ?auto_1718 ) ) ( not ( = ?auto_1717 ?auto_1718 ) ) ( HOLDING ?auto_1716 ) ( CLEAR ?auto_1715 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1715 ?auto_1716 ?auto_1717 )
      ( MAKE-2PILE ?auto_1715 ?auto_1716 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1719 - BLOCK
      ?auto_1720 - BLOCK
    )
    :vars
    (
      ?auto_1722 - BLOCK
      ?auto_1721 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1719 ) ( not ( = ?auto_1719 ?auto_1720 ) ) ( not ( = ?auto_1719 ?auto_1722 ) ) ( not ( = ?auto_1720 ?auto_1722 ) ) ( ON ?auto_1722 ?auto_1721 ) ( not ( = ?auto_1719 ?auto_1721 ) ) ( not ( = ?auto_1720 ?auto_1721 ) ) ( not ( = ?auto_1722 ?auto_1721 ) ) ( CLEAR ?auto_1719 ) ( ON ?auto_1720 ?auto_1722 ) ( CLEAR ?auto_1720 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1721 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1721 ?auto_1722 )
      ( MAKE-2PILE ?auto_1719 ?auto_1720 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1723 - BLOCK
      ?auto_1724 - BLOCK
    )
    :vars
    (
      ?auto_1725 - BLOCK
      ?auto_1726 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1723 ?auto_1724 ) ) ( not ( = ?auto_1723 ?auto_1725 ) ) ( not ( = ?auto_1724 ?auto_1725 ) ) ( ON ?auto_1725 ?auto_1726 ) ( not ( = ?auto_1723 ?auto_1726 ) ) ( not ( = ?auto_1724 ?auto_1726 ) ) ( not ( = ?auto_1725 ?auto_1726 ) ) ( ON ?auto_1724 ?auto_1725 ) ( CLEAR ?auto_1724 ) ( ON-TABLE ?auto_1726 ) ( HOLDING ?auto_1723 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1723 )
      ( MAKE-2PILE ?auto_1723 ?auto_1724 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1727 - BLOCK
      ?auto_1728 - BLOCK
    )
    :vars
    (
      ?auto_1729 - BLOCK
      ?auto_1730 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1727 ?auto_1728 ) ) ( not ( = ?auto_1727 ?auto_1729 ) ) ( not ( = ?auto_1728 ?auto_1729 ) ) ( ON ?auto_1729 ?auto_1730 ) ( not ( = ?auto_1727 ?auto_1730 ) ) ( not ( = ?auto_1728 ?auto_1730 ) ) ( not ( = ?auto_1729 ?auto_1730 ) ) ( ON ?auto_1728 ?auto_1729 ) ( ON-TABLE ?auto_1730 ) ( ON ?auto_1727 ?auto_1728 ) ( CLEAR ?auto_1727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1730 ?auto_1729 ?auto_1728 )
      ( MAKE-2PILE ?auto_1727 ?auto_1728 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1732 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1732 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1733 - BLOCK
    )
    :vars
    (
      ?auto_1734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1733 ?auto_1734 ) ( CLEAR ?auto_1733 ) ( HAND-EMPTY ) ( not ( = ?auto_1733 ?auto_1734 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1733 ?auto_1734 )
      ( MAKE-1PILE ?auto_1733 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1735 - BLOCK
    )
    :vars
    (
      ?auto_1736 - BLOCK
      ?auto_1737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1735 ?auto_1736 ) ) ( HOLDING ?auto_1735 ) ( CLEAR ?auto_1736 ) ( ON-TABLE ?auto_1737 ) ( ON ?auto_1736 ?auto_1737 ) ( not ( = ?auto_1737 ?auto_1736 ) ) ( not ( = ?auto_1737 ?auto_1735 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1737 ?auto_1736 ?auto_1735 )
      ( MAKE-1PILE ?auto_1735 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1738 - BLOCK
    )
    :vars
    (
      ?auto_1739 - BLOCK
      ?auto_1740 - BLOCK
      ?auto_1741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1738 ?auto_1739 ) ) ( CLEAR ?auto_1739 ) ( ON-TABLE ?auto_1740 ) ( ON ?auto_1739 ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1739 ) ) ( not ( = ?auto_1740 ?auto_1738 ) ) ( ON ?auto_1738 ?auto_1741 ) ( CLEAR ?auto_1738 ) ( HAND-EMPTY ) ( not ( = ?auto_1738 ?auto_1741 ) ) ( not ( = ?auto_1739 ?auto_1741 ) ) ( not ( = ?auto_1740 ?auto_1741 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1738 ?auto_1741 )
      ( MAKE-1PILE ?auto_1738 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1742 - BLOCK
    )
    :vars
    (
      ?auto_1745 - BLOCK
      ?auto_1744 - BLOCK
      ?auto_1743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1742 ?auto_1745 ) ) ( ON-TABLE ?auto_1744 ) ( not ( = ?auto_1744 ?auto_1745 ) ) ( not ( = ?auto_1744 ?auto_1742 ) ) ( ON ?auto_1742 ?auto_1743 ) ( CLEAR ?auto_1742 ) ( not ( = ?auto_1742 ?auto_1743 ) ) ( not ( = ?auto_1745 ?auto_1743 ) ) ( not ( = ?auto_1744 ?auto_1743 ) ) ( HOLDING ?auto_1745 ) ( CLEAR ?auto_1744 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1744 ?auto_1745 )
      ( MAKE-1PILE ?auto_1742 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1746 - BLOCK
    )
    :vars
    (
      ?auto_1749 - BLOCK
      ?auto_1748 - BLOCK
      ?auto_1747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1746 ?auto_1749 ) ) ( ON-TABLE ?auto_1748 ) ( not ( = ?auto_1748 ?auto_1749 ) ) ( not ( = ?auto_1748 ?auto_1746 ) ) ( ON ?auto_1746 ?auto_1747 ) ( not ( = ?auto_1746 ?auto_1747 ) ) ( not ( = ?auto_1749 ?auto_1747 ) ) ( not ( = ?auto_1748 ?auto_1747 ) ) ( CLEAR ?auto_1748 ) ( ON ?auto_1749 ?auto_1746 ) ( CLEAR ?auto_1749 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1747 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1747 ?auto_1746 )
      ( MAKE-1PILE ?auto_1746 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1750 - BLOCK
    )
    :vars
    (
      ?auto_1753 - BLOCK
      ?auto_1752 - BLOCK
      ?auto_1751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1750 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1753 ) ) ( not ( = ?auto_1752 ?auto_1750 ) ) ( ON ?auto_1750 ?auto_1751 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( not ( = ?auto_1753 ?auto_1751 ) ) ( not ( = ?auto_1752 ?auto_1751 ) ) ( ON ?auto_1753 ?auto_1750 ) ( CLEAR ?auto_1753 ) ( ON-TABLE ?auto_1751 ) ( HOLDING ?auto_1752 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1752 )
      ( MAKE-1PILE ?auto_1750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1754 - BLOCK
    )
    :vars
    (
      ?auto_1757 - BLOCK
      ?auto_1755 - BLOCK
      ?auto_1756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1754 ?auto_1757 ) ) ( not ( = ?auto_1755 ?auto_1757 ) ) ( not ( = ?auto_1755 ?auto_1754 ) ) ( ON ?auto_1754 ?auto_1756 ) ( not ( = ?auto_1754 ?auto_1756 ) ) ( not ( = ?auto_1757 ?auto_1756 ) ) ( not ( = ?auto_1755 ?auto_1756 ) ) ( ON ?auto_1757 ?auto_1754 ) ( ON-TABLE ?auto_1756 ) ( ON ?auto_1755 ?auto_1757 ) ( CLEAR ?auto_1755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1756 ?auto_1754 ?auto_1757 )
      ( MAKE-1PILE ?auto_1754 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1759 - BLOCK
    )
    :vars
    (
      ?auto_1760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1760 ?auto_1759 ) ( CLEAR ?auto_1760 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1759 ) ( not ( = ?auto_1759 ?auto_1760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1760 ?auto_1759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1761 - BLOCK
    )
    :vars
    (
      ?auto_1762 - BLOCK
      ?auto_1763 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1762 ?auto_1761 ) ( CLEAR ?auto_1762 ) ( ON-TABLE ?auto_1761 ) ( not ( = ?auto_1761 ?auto_1762 ) ) ( HOLDING ?auto_1763 ) ( not ( = ?auto_1761 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1763 )
      ( MAKE-1PILE ?auto_1761 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1764 - BLOCK
    )
    :vars
    (
      ?auto_1766 - BLOCK
      ?auto_1765 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1766 ?auto_1764 ) ( ON-TABLE ?auto_1764 ) ( not ( = ?auto_1764 ?auto_1766 ) ) ( not ( = ?auto_1764 ?auto_1765 ) ) ( not ( = ?auto_1766 ?auto_1765 ) ) ( ON ?auto_1765 ?auto_1766 ) ( CLEAR ?auto_1765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1764 ?auto_1766 )
      ( MAKE-1PILE ?auto_1764 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1767 - BLOCK
    )
    :vars
    (
      ?auto_1768 - BLOCK
      ?auto_1769 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1768 ?auto_1767 ) ( ON-TABLE ?auto_1767 ) ( not ( = ?auto_1767 ?auto_1768 ) ) ( not ( = ?auto_1767 ?auto_1769 ) ) ( not ( = ?auto_1768 ?auto_1769 ) ) ( HOLDING ?auto_1769 ) ( CLEAR ?auto_1768 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1767 ?auto_1768 ?auto_1769 )
      ( MAKE-1PILE ?auto_1767 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1770 - BLOCK
    )
    :vars
    (
      ?auto_1771 - BLOCK
      ?auto_1772 - BLOCK
      ?auto_1773 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1771 ?auto_1770 ) ( ON-TABLE ?auto_1770 ) ( not ( = ?auto_1770 ?auto_1771 ) ) ( not ( = ?auto_1770 ?auto_1772 ) ) ( not ( = ?auto_1771 ?auto_1772 ) ) ( CLEAR ?auto_1771 ) ( ON ?auto_1772 ?auto_1773 ) ( CLEAR ?auto_1772 ) ( HAND-EMPTY ) ( not ( = ?auto_1770 ?auto_1773 ) ) ( not ( = ?auto_1771 ?auto_1773 ) ) ( not ( = ?auto_1772 ?auto_1773 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1772 ?auto_1773 )
      ( MAKE-1PILE ?auto_1770 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1782 - BLOCK
    )
    :vars
    (
      ?auto_1783 - BLOCK
      ?auto_1784 - BLOCK
      ?auto_1785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1782 ?auto_1783 ) ) ( not ( = ?auto_1782 ?auto_1784 ) ) ( not ( = ?auto_1783 ?auto_1784 ) ) ( ON ?auto_1784 ?auto_1785 ) ( not ( = ?auto_1782 ?auto_1785 ) ) ( not ( = ?auto_1783 ?auto_1785 ) ) ( not ( = ?auto_1784 ?auto_1785 ) ) ( ON ?auto_1783 ?auto_1784 ) ( CLEAR ?auto_1783 ) ( HOLDING ?auto_1782 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1782 ?auto_1783 )
      ( MAKE-1PILE ?auto_1782 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1786 - BLOCK
    )
    :vars
    (
      ?auto_1789 - BLOCK
      ?auto_1787 - BLOCK
      ?auto_1788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1786 ?auto_1789 ) ) ( not ( = ?auto_1786 ?auto_1787 ) ) ( not ( = ?auto_1789 ?auto_1787 ) ) ( ON ?auto_1787 ?auto_1788 ) ( not ( = ?auto_1786 ?auto_1788 ) ) ( not ( = ?auto_1789 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1788 ) ) ( ON ?auto_1789 ?auto_1787 ) ( ON ?auto_1786 ?auto_1789 ) ( CLEAR ?auto_1786 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1788 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1788 ?auto_1787 ?auto_1789 )
      ( MAKE-1PILE ?auto_1786 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1792 - BLOCK
      ?auto_1793 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1793 ) ( CLEAR ?auto_1792 ) ( ON-TABLE ?auto_1792 ) ( not ( = ?auto_1792 ?auto_1793 ) ) )
    :subtasks
    ( ( !STACK ?auto_1793 ?auto_1792 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1794 - BLOCK
      ?auto_1795 - BLOCK
    )
    :vars
    (
      ?auto_1796 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1794 ) ( ON-TABLE ?auto_1794 ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( ON ?auto_1795 ?auto_1796 ) ( CLEAR ?auto_1795 ) ( HAND-EMPTY ) ( not ( = ?auto_1794 ?auto_1796 ) ) ( not ( = ?auto_1795 ?auto_1796 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1795 ?auto_1796 )
      ( MAKE-2PILE ?auto_1794 ?auto_1795 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1797 - BLOCK
      ?auto_1798 - BLOCK
    )
    :vars
    (
      ?auto_1799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1797 ?auto_1798 ) ) ( ON ?auto_1798 ?auto_1799 ) ( CLEAR ?auto_1798 ) ( not ( = ?auto_1797 ?auto_1799 ) ) ( not ( = ?auto_1798 ?auto_1799 ) ) ( HOLDING ?auto_1797 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1797 )
      ( MAKE-2PILE ?auto_1797 ?auto_1798 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1800 - BLOCK
      ?auto_1801 - BLOCK
    )
    :vars
    (
      ?auto_1802 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1800 ?auto_1801 ) ) ( ON ?auto_1801 ?auto_1802 ) ( not ( = ?auto_1800 ?auto_1802 ) ) ( not ( = ?auto_1801 ?auto_1802 ) ) ( ON ?auto_1800 ?auto_1801 ) ( CLEAR ?auto_1800 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1802 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1802 ?auto_1801 )
      ( MAKE-2PILE ?auto_1800 ?auto_1801 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1803 - BLOCK
      ?auto_1804 - BLOCK
    )
    :vars
    (
      ?auto_1805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1803 ?auto_1804 ) ) ( ON ?auto_1804 ?auto_1805 ) ( not ( = ?auto_1803 ?auto_1805 ) ) ( not ( = ?auto_1804 ?auto_1805 ) ) ( ON-TABLE ?auto_1805 ) ( HOLDING ?auto_1803 ) ( CLEAR ?auto_1804 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1805 ?auto_1804 ?auto_1803 )
      ( MAKE-2PILE ?auto_1803 ?auto_1804 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1806 - BLOCK
      ?auto_1807 - BLOCK
    )
    :vars
    (
      ?auto_1808 - BLOCK
      ?auto_1809 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1806 ?auto_1807 ) ) ( ON ?auto_1807 ?auto_1808 ) ( not ( = ?auto_1806 ?auto_1808 ) ) ( not ( = ?auto_1807 ?auto_1808 ) ) ( ON-TABLE ?auto_1808 ) ( CLEAR ?auto_1807 ) ( ON ?auto_1806 ?auto_1809 ) ( CLEAR ?auto_1806 ) ( HAND-EMPTY ) ( not ( = ?auto_1806 ?auto_1809 ) ) ( not ( = ?auto_1807 ?auto_1809 ) ) ( not ( = ?auto_1808 ?auto_1809 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1806 ?auto_1809 )
      ( MAKE-2PILE ?auto_1806 ?auto_1807 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1810 - BLOCK
      ?auto_1811 - BLOCK
    )
    :vars
    (
      ?auto_1813 - BLOCK
      ?auto_1812 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1810 ?auto_1811 ) ) ( not ( = ?auto_1810 ?auto_1813 ) ) ( not ( = ?auto_1811 ?auto_1813 ) ) ( ON-TABLE ?auto_1813 ) ( ON ?auto_1810 ?auto_1812 ) ( CLEAR ?auto_1810 ) ( not ( = ?auto_1810 ?auto_1812 ) ) ( not ( = ?auto_1811 ?auto_1812 ) ) ( not ( = ?auto_1813 ?auto_1812 ) ) ( HOLDING ?auto_1811 ) ( CLEAR ?auto_1813 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1813 ?auto_1811 )
      ( MAKE-2PILE ?auto_1810 ?auto_1811 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1814 - BLOCK
      ?auto_1815 - BLOCK
    )
    :vars
    (
      ?auto_1817 - BLOCK
      ?auto_1816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1814 ?auto_1815 ) ) ( not ( = ?auto_1814 ?auto_1817 ) ) ( not ( = ?auto_1815 ?auto_1817 ) ) ( ON-TABLE ?auto_1817 ) ( ON ?auto_1814 ?auto_1816 ) ( not ( = ?auto_1814 ?auto_1816 ) ) ( not ( = ?auto_1815 ?auto_1816 ) ) ( not ( = ?auto_1817 ?auto_1816 ) ) ( CLEAR ?auto_1817 ) ( ON ?auto_1815 ?auto_1814 ) ( CLEAR ?auto_1815 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1816 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1816 ?auto_1814 )
      ( MAKE-2PILE ?auto_1814 ?auto_1815 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1818 - BLOCK
      ?auto_1819 - BLOCK
    )
    :vars
    (
      ?auto_1820 - BLOCK
      ?auto_1821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1818 ?auto_1819 ) ) ( not ( = ?auto_1818 ?auto_1820 ) ) ( not ( = ?auto_1819 ?auto_1820 ) ) ( ON ?auto_1818 ?auto_1821 ) ( not ( = ?auto_1818 ?auto_1821 ) ) ( not ( = ?auto_1819 ?auto_1821 ) ) ( not ( = ?auto_1820 ?auto_1821 ) ) ( ON ?auto_1819 ?auto_1818 ) ( CLEAR ?auto_1819 ) ( ON-TABLE ?auto_1821 ) ( HOLDING ?auto_1820 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1820 )
      ( MAKE-2PILE ?auto_1818 ?auto_1819 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1822 - BLOCK
      ?auto_1823 - BLOCK
    )
    :vars
    (
      ?auto_1824 - BLOCK
      ?auto_1825 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1822 ?auto_1823 ) ) ( not ( = ?auto_1822 ?auto_1824 ) ) ( not ( = ?auto_1823 ?auto_1824 ) ) ( ON ?auto_1822 ?auto_1825 ) ( not ( = ?auto_1822 ?auto_1825 ) ) ( not ( = ?auto_1823 ?auto_1825 ) ) ( not ( = ?auto_1824 ?auto_1825 ) ) ( ON ?auto_1823 ?auto_1822 ) ( ON-TABLE ?auto_1825 ) ( ON ?auto_1824 ?auto_1823 ) ( CLEAR ?auto_1824 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1825 ?auto_1822 ?auto_1823 )
      ( MAKE-2PILE ?auto_1822 ?auto_1823 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1829 - BLOCK
      ?auto_1830 - BLOCK
      ?auto_1831 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1831 ) ( CLEAR ?auto_1830 ) ( ON-TABLE ?auto_1829 ) ( ON ?auto_1830 ?auto_1829 ) ( not ( = ?auto_1829 ?auto_1830 ) ) ( not ( = ?auto_1829 ?auto_1831 ) ) ( not ( = ?auto_1830 ?auto_1831 ) ) )
    :subtasks
    ( ( !STACK ?auto_1831 ?auto_1830 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1832 - BLOCK
      ?auto_1833 - BLOCK
      ?auto_1834 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1833 ) ( ON-TABLE ?auto_1832 ) ( ON ?auto_1833 ?auto_1832 ) ( not ( = ?auto_1832 ?auto_1833 ) ) ( not ( = ?auto_1832 ?auto_1834 ) ) ( not ( = ?auto_1833 ?auto_1834 ) ) ( ON-TABLE ?auto_1834 ) ( CLEAR ?auto_1834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1834 )
      ( MAKE-3PILE ?auto_1832 ?auto_1833 ?auto_1834 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1835 - BLOCK
      ?auto_1836 - BLOCK
      ?auto_1837 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1835 ) ( not ( = ?auto_1835 ?auto_1836 ) ) ( not ( = ?auto_1835 ?auto_1837 ) ) ( not ( = ?auto_1836 ?auto_1837 ) ) ( ON-TABLE ?auto_1837 ) ( CLEAR ?auto_1837 ) ( HOLDING ?auto_1836 ) ( CLEAR ?auto_1835 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1835 ?auto_1836 )
      ( MAKE-3PILE ?auto_1835 ?auto_1836 ?auto_1837 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1838 - BLOCK
      ?auto_1839 - BLOCK
      ?auto_1840 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1838 ) ( not ( = ?auto_1838 ?auto_1839 ) ) ( not ( = ?auto_1838 ?auto_1840 ) ) ( not ( = ?auto_1839 ?auto_1840 ) ) ( ON-TABLE ?auto_1840 ) ( CLEAR ?auto_1838 ) ( ON ?auto_1839 ?auto_1840 ) ( CLEAR ?auto_1839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1840 )
      ( MAKE-3PILE ?auto_1838 ?auto_1839 ?auto_1840 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1841 - BLOCK
      ?auto_1842 - BLOCK
      ?auto_1843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1841 ?auto_1842 ) ) ( not ( = ?auto_1841 ?auto_1843 ) ) ( not ( = ?auto_1842 ?auto_1843 ) ) ( ON-TABLE ?auto_1843 ) ( ON ?auto_1842 ?auto_1843 ) ( CLEAR ?auto_1842 ) ( HOLDING ?auto_1841 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1841 )
      ( MAKE-3PILE ?auto_1841 ?auto_1842 ?auto_1843 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1844 - BLOCK
      ?auto_1845 - BLOCK
      ?auto_1846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1844 ?auto_1845 ) ) ( not ( = ?auto_1844 ?auto_1846 ) ) ( not ( = ?auto_1845 ?auto_1846 ) ) ( ON-TABLE ?auto_1846 ) ( ON ?auto_1845 ?auto_1846 ) ( ON ?auto_1844 ?auto_1845 ) ( CLEAR ?auto_1844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1846 ?auto_1845 )
      ( MAKE-3PILE ?auto_1844 ?auto_1845 ?auto_1846 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1847 - BLOCK
      ?auto_1848 - BLOCK
      ?auto_1849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1847 ?auto_1848 ) ) ( not ( = ?auto_1847 ?auto_1849 ) ) ( not ( = ?auto_1848 ?auto_1849 ) ) ( ON-TABLE ?auto_1849 ) ( ON ?auto_1848 ?auto_1849 ) ( HOLDING ?auto_1847 ) ( CLEAR ?auto_1848 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1849 ?auto_1848 ?auto_1847 )
      ( MAKE-3PILE ?auto_1847 ?auto_1848 ?auto_1849 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1850 - BLOCK
      ?auto_1851 - BLOCK
      ?auto_1852 - BLOCK
    )
    :vars
    (
      ?auto_1853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1850 ?auto_1851 ) ) ( not ( = ?auto_1850 ?auto_1852 ) ) ( not ( = ?auto_1851 ?auto_1852 ) ) ( ON-TABLE ?auto_1852 ) ( ON ?auto_1851 ?auto_1852 ) ( CLEAR ?auto_1851 ) ( ON ?auto_1850 ?auto_1853 ) ( CLEAR ?auto_1850 ) ( HAND-EMPTY ) ( not ( = ?auto_1850 ?auto_1853 ) ) ( not ( = ?auto_1851 ?auto_1853 ) ) ( not ( = ?auto_1852 ?auto_1853 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1850 ?auto_1853 )
      ( MAKE-3PILE ?auto_1850 ?auto_1851 ?auto_1852 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1854 - BLOCK
      ?auto_1855 - BLOCK
      ?auto_1856 - BLOCK
    )
    :vars
    (
      ?auto_1857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1854 ?auto_1855 ) ) ( not ( = ?auto_1854 ?auto_1856 ) ) ( not ( = ?auto_1855 ?auto_1856 ) ) ( ON-TABLE ?auto_1856 ) ( ON ?auto_1854 ?auto_1857 ) ( CLEAR ?auto_1854 ) ( not ( = ?auto_1854 ?auto_1857 ) ) ( not ( = ?auto_1855 ?auto_1857 ) ) ( not ( = ?auto_1856 ?auto_1857 ) ) ( HOLDING ?auto_1855 ) ( CLEAR ?auto_1856 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1856 ?auto_1855 )
      ( MAKE-3PILE ?auto_1854 ?auto_1855 ?auto_1856 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1858 - BLOCK
      ?auto_1859 - BLOCK
      ?auto_1860 - BLOCK
    )
    :vars
    (
      ?auto_1861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1858 ?auto_1859 ) ) ( not ( = ?auto_1858 ?auto_1860 ) ) ( not ( = ?auto_1859 ?auto_1860 ) ) ( ON-TABLE ?auto_1860 ) ( ON ?auto_1858 ?auto_1861 ) ( not ( = ?auto_1858 ?auto_1861 ) ) ( not ( = ?auto_1859 ?auto_1861 ) ) ( not ( = ?auto_1860 ?auto_1861 ) ) ( CLEAR ?auto_1860 ) ( ON ?auto_1859 ?auto_1858 ) ( CLEAR ?auto_1859 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1861 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1861 ?auto_1858 )
      ( MAKE-3PILE ?auto_1858 ?auto_1859 ?auto_1860 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1862 - BLOCK
      ?auto_1863 - BLOCK
      ?auto_1864 - BLOCK
    )
    :vars
    (
      ?auto_1865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1862 ?auto_1863 ) ) ( not ( = ?auto_1862 ?auto_1864 ) ) ( not ( = ?auto_1863 ?auto_1864 ) ) ( ON ?auto_1862 ?auto_1865 ) ( not ( = ?auto_1862 ?auto_1865 ) ) ( not ( = ?auto_1863 ?auto_1865 ) ) ( not ( = ?auto_1864 ?auto_1865 ) ) ( ON ?auto_1863 ?auto_1862 ) ( CLEAR ?auto_1863 ) ( ON-TABLE ?auto_1865 ) ( HOLDING ?auto_1864 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1864 )
      ( MAKE-3PILE ?auto_1862 ?auto_1863 ?auto_1864 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1866 - BLOCK
      ?auto_1867 - BLOCK
      ?auto_1868 - BLOCK
    )
    :vars
    (
      ?auto_1869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1866 ?auto_1867 ) ) ( not ( = ?auto_1866 ?auto_1868 ) ) ( not ( = ?auto_1867 ?auto_1868 ) ) ( ON ?auto_1866 ?auto_1869 ) ( not ( = ?auto_1866 ?auto_1869 ) ) ( not ( = ?auto_1867 ?auto_1869 ) ) ( not ( = ?auto_1868 ?auto_1869 ) ) ( ON ?auto_1867 ?auto_1866 ) ( ON-TABLE ?auto_1869 ) ( ON ?auto_1868 ?auto_1867 ) ( CLEAR ?auto_1868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1869 ?auto_1866 ?auto_1867 )
      ( MAKE-3PILE ?auto_1866 ?auto_1867 ?auto_1868 ) )
  )

)

