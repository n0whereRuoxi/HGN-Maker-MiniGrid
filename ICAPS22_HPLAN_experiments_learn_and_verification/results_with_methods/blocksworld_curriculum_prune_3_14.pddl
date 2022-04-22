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
      ?auto_1589 - BLOCK
    )
    :vars
    (
      ?auto_1590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1589 ?auto_1590 ) ( CLEAR ?auto_1589 ) ( HAND-EMPTY ) ( not ( = ?auto_1589 ?auto_1590 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1589 ?auto_1590 )
      ( !PUTDOWN ?auto_1589 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1596 - BLOCK
      ?auto_1597 - BLOCK
    )
    :vars
    (
      ?auto_1598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1596 ) ( ON ?auto_1597 ?auto_1598 ) ( CLEAR ?auto_1597 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1596 ) ( not ( = ?auto_1596 ?auto_1597 ) ) ( not ( = ?auto_1596 ?auto_1598 ) ) ( not ( = ?auto_1597 ?auto_1598 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1597 ?auto_1598 )
      ( !STACK ?auto_1597 ?auto_1596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1606 - BLOCK
      ?auto_1607 - BLOCK
    )
    :vars
    (
      ?auto_1608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1607 ?auto_1608 ) ( not ( = ?auto_1606 ?auto_1607 ) ) ( not ( = ?auto_1606 ?auto_1608 ) ) ( not ( = ?auto_1607 ?auto_1608 ) ) ( ON ?auto_1606 ?auto_1607 ) ( CLEAR ?auto_1606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1606 )
      ( MAKE-2PILE ?auto_1606 ?auto_1607 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1617 - BLOCK
      ?auto_1618 - BLOCK
      ?auto_1619 - BLOCK
    )
    :vars
    (
      ?auto_1620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1618 ) ( ON ?auto_1619 ?auto_1620 ) ( CLEAR ?auto_1619 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1617 ) ( ON ?auto_1618 ?auto_1617 ) ( not ( = ?auto_1617 ?auto_1618 ) ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1617 ?auto_1620 ) ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1620 ) ) ( not ( = ?auto_1619 ?auto_1620 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1619 ?auto_1620 )
      ( !STACK ?auto_1619 ?auto_1618 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1624 - BLOCK
      ?auto_1625 - BLOCK
      ?auto_1626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1625 ) ( ON-TABLE ?auto_1626 ) ( CLEAR ?auto_1626 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1624 ) ( ON ?auto_1625 ?auto_1624 ) ( not ( = ?auto_1624 ?auto_1625 ) ) ( not ( = ?auto_1624 ?auto_1626 ) ) ( not ( = ?auto_1625 ?auto_1626 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1626 )
      ( !STACK ?auto_1626 ?auto_1625 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1630 - BLOCK
      ?auto_1631 - BLOCK
      ?auto_1632 - BLOCK
    )
    :vars
    (
      ?auto_1633 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1632 ?auto_1633 ) ( ON-TABLE ?auto_1630 ) ( not ( = ?auto_1630 ?auto_1631 ) ) ( not ( = ?auto_1630 ?auto_1632 ) ) ( not ( = ?auto_1630 ?auto_1633 ) ) ( not ( = ?auto_1631 ?auto_1632 ) ) ( not ( = ?auto_1631 ?auto_1633 ) ) ( not ( = ?auto_1632 ?auto_1633 ) ) ( CLEAR ?auto_1630 ) ( ON ?auto_1631 ?auto_1632 ) ( CLEAR ?auto_1631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1630 ?auto_1631 )
      ( MAKE-3PILE ?auto_1630 ?auto_1631 ?auto_1632 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1637 - BLOCK
      ?auto_1638 - BLOCK
      ?auto_1639 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1639 ) ( ON-TABLE ?auto_1637 ) ( not ( = ?auto_1637 ?auto_1638 ) ) ( not ( = ?auto_1637 ?auto_1639 ) ) ( not ( = ?auto_1638 ?auto_1639 ) ) ( CLEAR ?auto_1637 ) ( ON ?auto_1638 ?auto_1639 ) ( CLEAR ?auto_1638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1637 ?auto_1638 )
      ( MAKE-3PILE ?auto_1637 ?auto_1638 ?auto_1639 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1643 - BLOCK
      ?auto_1644 - BLOCK
      ?auto_1645 - BLOCK
    )
    :vars
    (
      ?auto_1646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1645 ?auto_1646 ) ( not ( = ?auto_1643 ?auto_1644 ) ) ( not ( = ?auto_1643 ?auto_1645 ) ) ( not ( = ?auto_1643 ?auto_1646 ) ) ( not ( = ?auto_1644 ?auto_1645 ) ) ( not ( = ?auto_1644 ?auto_1646 ) ) ( not ( = ?auto_1645 ?auto_1646 ) ) ( ON ?auto_1644 ?auto_1645 ) ( ON ?auto_1643 ?auto_1644 ) ( CLEAR ?auto_1643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1643 )
      ( MAKE-3PILE ?auto_1643 ?auto_1644 ?auto_1645 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1650 - BLOCK
      ?auto_1651 - BLOCK
      ?auto_1652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1652 ) ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1652 ) ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( ON ?auto_1651 ?auto_1652 ) ( ON ?auto_1650 ?auto_1651 ) ( CLEAR ?auto_1650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1650 )
      ( MAKE-3PILE ?auto_1650 ?auto_1651 ?auto_1652 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1656 - BLOCK
      ?auto_1657 - BLOCK
      ?auto_1658 - BLOCK
    )
    :vars
    (
      ?auto_1659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1656 ?auto_1657 ) ) ( not ( = ?auto_1656 ?auto_1658 ) ) ( not ( = ?auto_1657 ?auto_1658 ) ) ( ON ?auto_1656 ?auto_1659 ) ( not ( = ?auto_1658 ?auto_1659 ) ) ( not ( = ?auto_1657 ?auto_1659 ) ) ( not ( = ?auto_1656 ?auto_1659 ) ) ( ON ?auto_1657 ?auto_1656 ) ( ON ?auto_1658 ?auto_1657 ) ( CLEAR ?auto_1658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1658 ?auto_1657 ?auto_1656 )
      ( MAKE-3PILE ?auto_1656 ?auto_1657 ?auto_1658 ) )
  )

)

