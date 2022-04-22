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
      ?auto_1661 - BLOCK
    )
    :vars
    (
      ?auto_1662 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1661 ?auto_1662 ) ( CLEAR ?auto_1661 ) ( HAND-EMPTY ) ( not ( = ?auto_1661 ?auto_1662 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1661 ?auto_1662 )
      ( !PUTDOWN ?auto_1661 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1664 - BLOCK
    )
    :vars
    (
      ?auto_1665 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1664 ?auto_1665 ) ( CLEAR ?auto_1664 ) ( HAND-EMPTY ) ( not ( = ?auto_1664 ?auto_1665 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1664 ?auto_1665 )
      ( !PUTDOWN ?auto_1664 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1668 - BLOCK
      ?auto_1669 - BLOCK
    )
    :vars
    (
      ?auto_1670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1668 ) ( ON ?auto_1669 ?auto_1670 ) ( CLEAR ?auto_1669 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1668 ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1670 ) ) ( not ( = ?auto_1669 ?auto_1670 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1669 ?auto_1670 )
      ( !STACK ?auto_1669 ?auto_1668 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1673 - BLOCK
      ?auto_1674 - BLOCK
    )
    :vars
    (
      ?auto_1675 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1673 ) ( ON ?auto_1674 ?auto_1675 ) ( CLEAR ?auto_1674 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1673 ) ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1674 ?auto_1675 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1674 ?auto_1675 )
      ( !STACK ?auto_1674 ?auto_1673 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1678 - BLOCK
      ?auto_1679 - BLOCK
    )
    :vars
    (
      ?auto_1680 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1679 ?auto_1680 ) ( not ( = ?auto_1678 ?auto_1679 ) ) ( not ( = ?auto_1678 ?auto_1680 ) ) ( not ( = ?auto_1679 ?auto_1680 ) ) ( ON ?auto_1678 ?auto_1679 ) ( CLEAR ?auto_1678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1678 )
      ( MAKE-2PILE ?auto_1678 ?auto_1679 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1683 - BLOCK
      ?auto_1684 - BLOCK
    )
    :vars
    (
      ?auto_1685 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1684 ?auto_1685 ) ( not ( = ?auto_1683 ?auto_1684 ) ) ( not ( = ?auto_1683 ?auto_1685 ) ) ( not ( = ?auto_1684 ?auto_1685 ) ) ( ON ?auto_1683 ?auto_1684 ) ( CLEAR ?auto_1683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1683 )
      ( MAKE-2PILE ?auto_1683 ?auto_1684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1689 - BLOCK
      ?auto_1690 - BLOCK
      ?auto_1691 - BLOCK
    )
    :vars
    (
      ?auto_1692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1690 ) ( ON ?auto_1691 ?auto_1692 ) ( CLEAR ?auto_1691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1689 ) ( ON ?auto_1690 ?auto_1689 ) ( not ( = ?auto_1689 ?auto_1690 ) ) ( not ( = ?auto_1689 ?auto_1691 ) ) ( not ( = ?auto_1689 ?auto_1692 ) ) ( not ( = ?auto_1690 ?auto_1691 ) ) ( not ( = ?auto_1690 ?auto_1692 ) ) ( not ( = ?auto_1691 ?auto_1692 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1691 ?auto_1692 )
      ( !STACK ?auto_1691 ?auto_1690 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1696 - BLOCK
      ?auto_1697 - BLOCK
      ?auto_1698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1697 ) ( ON-TABLE ?auto_1698 ) ( CLEAR ?auto_1698 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1696 ) ( ON ?auto_1697 ?auto_1696 ) ( not ( = ?auto_1696 ?auto_1697 ) ) ( not ( = ?auto_1696 ?auto_1698 ) ) ( not ( = ?auto_1697 ?auto_1698 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1698 )
      ( !STACK ?auto_1698 ?auto_1697 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1702 - BLOCK
      ?auto_1703 - BLOCK
      ?auto_1704 - BLOCK
    )
    :vars
    (
      ?auto_1705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1704 ?auto_1705 ) ( ON-TABLE ?auto_1702 ) ( not ( = ?auto_1702 ?auto_1703 ) ) ( not ( = ?auto_1702 ?auto_1704 ) ) ( not ( = ?auto_1702 ?auto_1705 ) ) ( not ( = ?auto_1703 ?auto_1704 ) ) ( not ( = ?auto_1703 ?auto_1705 ) ) ( not ( = ?auto_1704 ?auto_1705 ) ) ( CLEAR ?auto_1702 ) ( ON ?auto_1703 ?auto_1704 ) ( CLEAR ?auto_1703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1702 ?auto_1703 )
      ( MAKE-3PILE ?auto_1702 ?auto_1703 ?auto_1704 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1709 - BLOCK
      ?auto_1710 - BLOCK
      ?auto_1711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1711 ) ( ON-TABLE ?auto_1709 ) ( not ( = ?auto_1709 ?auto_1710 ) ) ( not ( = ?auto_1709 ?auto_1711 ) ) ( not ( = ?auto_1710 ?auto_1711 ) ) ( CLEAR ?auto_1709 ) ( ON ?auto_1710 ?auto_1711 ) ( CLEAR ?auto_1710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1709 ?auto_1710 )
      ( MAKE-3PILE ?auto_1709 ?auto_1710 ?auto_1711 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1715 - BLOCK
      ?auto_1716 - BLOCK
      ?auto_1717 - BLOCK
    )
    :vars
    (
      ?auto_1718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1717 ?auto_1718 ) ( not ( = ?auto_1715 ?auto_1716 ) ) ( not ( = ?auto_1715 ?auto_1717 ) ) ( not ( = ?auto_1715 ?auto_1718 ) ) ( not ( = ?auto_1716 ?auto_1717 ) ) ( not ( = ?auto_1716 ?auto_1718 ) ) ( not ( = ?auto_1717 ?auto_1718 ) ) ( ON ?auto_1716 ?auto_1717 ) ( ON ?auto_1715 ?auto_1716 ) ( CLEAR ?auto_1715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1715 )
      ( MAKE-3PILE ?auto_1715 ?auto_1716 ?auto_1717 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1722 - BLOCK
      ?auto_1723 - BLOCK
      ?auto_1724 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1724 ) ( not ( = ?auto_1722 ?auto_1723 ) ) ( not ( = ?auto_1722 ?auto_1724 ) ) ( not ( = ?auto_1723 ?auto_1724 ) ) ( ON ?auto_1723 ?auto_1724 ) ( ON ?auto_1722 ?auto_1723 ) ( CLEAR ?auto_1722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1722 )
      ( MAKE-3PILE ?auto_1722 ?auto_1723 ?auto_1724 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1728 - BLOCK
      ?auto_1729 - BLOCK
      ?auto_1730 - BLOCK
    )
    :vars
    (
      ?auto_1731 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1728 ?auto_1729 ) ) ( not ( = ?auto_1728 ?auto_1730 ) ) ( not ( = ?auto_1729 ?auto_1730 ) ) ( ON ?auto_1728 ?auto_1731 ) ( not ( = ?auto_1730 ?auto_1731 ) ) ( not ( = ?auto_1729 ?auto_1731 ) ) ( not ( = ?auto_1728 ?auto_1731 ) ) ( ON ?auto_1729 ?auto_1728 ) ( ON ?auto_1730 ?auto_1729 ) ( CLEAR ?auto_1730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1730 ?auto_1729 ?auto_1728 )
      ( MAKE-3PILE ?auto_1728 ?auto_1729 ?auto_1730 ) )
  )

)

