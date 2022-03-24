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
      ( !PUTDOWN ?auto_1733 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1740 - BLOCK
      ?auto_1741 - BLOCK
    )
    :vars
    (
      ?auto_1742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1740 ) ( ON ?auto_1741 ?auto_1742 ) ( CLEAR ?auto_1741 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1740 ) ( not ( = ?auto_1740 ?auto_1741 ) ) ( not ( = ?auto_1740 ?auto_1742 ) ) ( not ( = ?auto_1741 ?auto_1742 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1741 ?auto_1742 )
      ( !STACK ?auto_1741 ?auto_1740 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1750 - BLOCK
      ?auto_1751 - BLOCK
    )
    :vars
    (
      ?auto_1752 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1751 ?auto_1752 ) ( not ( = ?auto_1750 ?auto_1751 ) ) ( not ( = ?auto_1750 ?auto_1752 ) ) ( not ( = ?auto_1751 ?auto_1752 ) ) ( ON ?auto_1750 ?auto_1751 ) ( CLEAR ?auto_1750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1750 )
      ( MAKE-2PILE ?auto_1750 ?auto_1751 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1761 - BLOCK
      ?auto_1762 - BLOCK
      ?auto_1763 - BLOCK
    )
    :vars
    (
      ?auto_1764 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1762 ) ( ON ?auto_1763 ?auto_1764 ) ( CLEAR ?auto_1763 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1761 ) ( ON ?auto_1762 ?auto_1761 ) ( not ( = ?auto_1761 ?auto_1762 ) ) ( not ( = ?auto_1761 ?auto_1763 ) ) ( not ( = ?auto_1761 ?auto_1764 ) ) ( not ( = ?auto_1762 ?auto_1763 ) ) ( not ( = ?auto_1762 ?auto_1764 ) ) ( not ( = ?auto_1763 ?auto_1764 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1763 ?auto_1764 )
      ( !STACK ?auto_1763 ?auto_1762 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1768 - BLOCK
      ?auto_1769 - BLOCK
      ?auto_1770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1769 ) ( ON-TABLE ?auto_1770 ) ( CLEAR ?auto_1770 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1768 ) ( ON ?auto_1769 ?auto_1768 ) ( not ( = ?auto_1768 ?auto_1769 ) ) ( not ( = ?auto_1768 ?auto_1770 ) ) ( not ( = ?auto_1769 ?auto_1770 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1770 )
      ( !STACK ?auto_1770 ?auto_1769 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1774 - BLOCK
      ?auto_1775 - BLOCK
      ?auto_1776 - BLOCK
    )
    :vars
    (
      ?auto_1777 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1776 ?auto_1777 ) ( ON-TABLE ?auto_1774 ) ( not ( = ?auto_1774 ?auto_1775 ) ) ( not ( = ?auto_1774 ?auto_1776 ) ) ( not ( = ?auto_1774 ?auto_1777 ) ) ( not ( = ?auto_1775 ?auto_1776 ) ) ( not ( = ?auto_1775 ?auto_1777 ) ) ( not ( = ?auto_1776 ?auto_1777 ) ) ( CLEAR ?auto_1774 ) ( ON ?auto_1775 ?auto_1776 ) ( CLEAR ?auto_1775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1774 ?auto_1775 )
      ( MAKE-3PILE ?auto_1774 ?auto_1775 ?auto_1776 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1781 - BLOCK
      ?auto_1782 - BLOCK
      ?auto_1783 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1783 ) ( ON-TABLE ?auto_1781 ) ( not ( = ?auto_1781 ?auto_1782 ) ) ( not ( = ?auto_1781 ?auto_1783 ) ) ( not ( = ?auto_1782 ?auto_1783 ) ) ( CLEAR ?auto_1781 ) ( ON ?auto_1782 ?auto_1783 ) ( CLEAR ?auto_1782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1781 ?auto_1782 )
      ( MAKE-3PILE ?auto_1781 ?auto_1782 ?auto_1783 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1787 - BLOCK
      ?auto_1788 - BLOCK
      ?auto_1789 - BLOCK
    )
    :vars
    (
      ?auto_1790 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1789 ?auto_1790 ) ( not ( = ?auto_1787 ?auto_1788 ) ) ( not ( = ?auto_1787 ?auto_1789 ) ) ( not ( = ?auto_1787 ?auto_1790 ) ) ( not ( = ?auto_1788 ?auto_1789 ) ) ( not ( = ?auto_1788 ?auto_1790 ) ) ( not ( = ?auto_1789 ?auto_1790 ) ) ( ON ?auto_1788 ?auto_1789 ) ( ON ?auto_1787 ?auto_1788 ) ( CLEAR ?auto_1787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1787 )
      ( MAKE-3PILE ?auto_1787 ?auto_1788 ?auto_1789 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1794 - BLOCK
      ?auto_1795 - BLOCK
      ?auto_1796 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1796 ) ( not ( = ?auto_1794 ?auto_1795 ) ) ( not ( = ?auto_1794 ?auto_1796 ) ) ( not ( = ?auto_1795 ?auto_1796 ) ) ( ON ?auto_1795 ?auto_1796 ) ( ON ?auto_1794 ?auto_1795 ) ( CLEAR ?auto_1794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1794 )
      ( MAKE-3PILE ?auto_1794 ?auto_1795 ?auto_1796 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1800 - BLOCK
      ?auto_1801 - BLOCK
      ?auto_1802 - BLOCK
    )
    :vars
    (
      ?auto_1803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1800 ?auto_1801 ) ) ( not ( = ?auto_1800 ?auto_1802 ) ) ( not ( = ?auto_1801 ?auto_1802 ) ) ( ON ?auto_1800 ?auto_1803 ) ( not ( = ?auto_1802 ?auto_1803 ) ) ( not ( = ?auto_1801 ?auto_1803 ) ) ( not ( = ?auto_1800 ?auto_1803 ) ) ( ON ?auto_1801 ?auto_1800 ) ( ON ?auto_1802 ?auto_1801 ) ( CLEAR ?auto_1802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1802 ?auto_1801 ?auto_1800 )
      ( MAKE-3PILE ?auto_1800 ?auto_1801 ?auto_1802 ) )
  )

)

