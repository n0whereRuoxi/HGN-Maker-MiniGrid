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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1541 - BLOCK
      ?auto_1542 - BLOCK
    )
    :vars
    (
      ?auto_1543 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1543 ?auto_1542 ) ( CLEAR ?auto_1543 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1541 ) ( ON ?auto_1542 ?auto_1541 ) ( not ( = ?auto_1541 ?auto_1542 ) ) ( not ( = ?auto_1541 ?auto_1543 ) ) ( not ( = ?auto_1542 ?auto_1543 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1543 ?auto_1542 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1545 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1545 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1546 - BLOCK
    )
    :vars
    (
      ?auto_1547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1546 ?auto_1547 ) ( CLEAR ?auto_1546 ) ( HAND-EMPTY ) ( not ( = ?auto_1546 ?auto_1547 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1546 ?auto_1547 )
      ( MAKE-1PILE ?auto_1546 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1549 - BLOCK
    )
    :vars
    (
      ?auto_1550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1550 ?auto_1549 ) ( CLEAR ?auto_1550 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1549 ) ( not ( = ?auto_1549 ?auto_1550 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1550 ?auto_1549 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1551 - BLOCK
    )
    :vars
    (
      ?auto_1552 - BLOCK
      ?auto_1553 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1552 ?auto_1551 ) ( CLEAR ?auto_1552 ) ( ON-TABLE ?auto_1551 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( HOLDING ?auto_1553 ) ( not ( = ?auto_1551 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1553 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1553 )
      ( MAKE-1PILE ?auto_1551 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1554 - BLOCK
    )
    :vars
    (
      ?auto_1556 - BLOCK
      ?auto_1555 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1556 ?auto_1554 ) ( ON-TABLE ?auto_1554 ) ( not ( = ?auto_1554 ?auto_1556 ) ) ( not ( = ?auto_1554 ?auto_1555 ) ) ( not ( = ?auto_1556 ?auto_1555 ) ) ( ON ?auto_1555 ?auto_1556 ) ( CLEAR ?auto_1555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1554 ?auto_1556 )
      ( MAKE-1PILE ?auto_1554 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1559 - BLOCK
      ?auto_1560 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1560 ) ( CLEAR ?auto_1559 ) ( ON-TABLE ?auto_1559 ) ( not ( = ?auto_1559 ?auto_1560 ) ) )
    :subtasks
    ( ( !STACK ?auto_1560 ?auto_1559 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1561 - BLOCK
      ?auto_1562 - BLOCK
    )
    :vars
    (
      ?auto_1563 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1561 ) ( ON-TABLE ?auto_1561 ) ( not ( = ?auto_1561 ?auto_1562 ) ) ( ON ?auto_1562 ?auto_1563 ) ( CLEAR ?auto_1562 ) ( HAND-EMPTY ) ( not ( = ?auto_1561 ?auto_1563 ) ) ( not ( = ?auto_1562 ?auto_1563 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1562 ?auto_1563 )
      ( MAKE-2PILE ?auto_1561 ?auto_1562 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1564 - BLOCK
      ?auto_1565 - BLOCK
    )
    :vars
    (
      ?auto_1566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1564 ?auto_1565 ) ) ( ON ?auto_1565 ?auto_1566 ) ( CLEAR ?auto_1565 ) ( not ( = ?auto_1564 ?auto_1566 ) ) ( not ( = ?auto_1565 ?auto_1566 ) ) ( HOLDING ?auto_1564 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1564 )
      ( MAKE-2PILE ?auto_1564 ?auto_1565 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1567 - BLOCK
      ?auto_1568 - BLOCK
    )
    :vars
    (
      ?auto_1569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1567 ?auto_1568 ) ) ( ON ?auto_1568 ?auto_1569 ) ( not ( = ?auto_1567 ?auto_1569 ) ) ( not ( = ?auto_1568 ?auto_1569 ) ) ( ON ?auto_1567 ?auto_1568 ) ( CLEAR ?auto_1567 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1569 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1569 ?auto_1568 )
      ( MAKE-2PILE ?auto_1567 ?auto_1568 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1571 - BLOCK
    )
    :vars
    (
      ?auto_1572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1572 ?auto_1571 ) ( CLEAR ?auto_1572 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1571 ) ( not ( = ?auto_1571 ?auto_1572 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1572 ?auto_1571 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1578 - BLOCK
    )
    :vars
    (
      ?auto_1579 - BLOCK
      ?auto_1580 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1578 ?auto_1579 ) ) ( ON ?auto_1579 ?auto_1580 ) ( CLEAR ?auto_1579 ) ( not ( = ?auto_1578 ?auto_1580 ) ) ( not ( = ?auto_1579 ?auto_1580 ) ) ( HOLDING ?auto_1578 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1578 ?auto_1579 )
      ( MAKE-1PILE ?auto_1578 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1581 - BLOCK
    )
    :vars
    (
      ?auto_1582 - BLOCK
      ?auto_1583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1581 ?auto_1582 ) ) ( ON ?auto_1582 ?auto_1583 ) ( not ( = ?auto_1581 ?auto_1583 ) ) ( not ( = ?auto_1582 ?auto_1583 ) ) ( ON ?auto_1581 ?auto_1582 ) ( CLEAR ?auto_1581 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1583 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1583 ?auto_1582 )
      ( MAKE-1PILE ?auto_1581 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1585 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1585 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1586 - BLOCK
    )
    :vars
    (
      ?auto_1587 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1586 ?auto_1587 ) ( CLEAR ?auto_1586 ) ( HAND-EMPTY ) ( not ( = ?auto_1586 ?auto_1587 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1586 ?auto_1587 )
      ( MAKE-1PILE ?auto_1586 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1588 - BLOCK
    )
    :vars
    (
      ?auto_1589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1588 ?auto_1589 ) ) ( HOLDING ?auto_1588 ) ( CLEAR ?auto_1589 ) ( ON-TABLE ?auto_1589 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1589 ?auto_1588 )
      ( MAKE-1PILE ?auto_1588 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1590 - BLOCK
    )
    :vars
    (
      ?auto_1591 - BLOCK
      ?auto_1592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1590 ?auto_1591 ) ) ( CLEAR ?auto_1591 ) ( ON-TABLE ?auto_1591 ) ( ON ?auto_1590 ?auto_1592 ) ( CLEAR ?auto_1590 ) ( HAND-EMPTY ) ( not ( = ?auto_1590 ?auto_1592 ) ) ( not ( = ?auto_1591 ?auto_1592 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1590 ?auto_1592 )
      ( MAKE-1PILE ?auto_1590 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1593 - BLOCK
    )
    :vars
    (
      ?auto_1594 - BLOCK
      ?auto_1595 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1593 ?auto_1594 ) ) ( ON ?auto_1593 ?auto_1595 ) ( CLEAR ?auto_1593 ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( not ( = ?auto_1594 ?auto_1595 ) ) ( HOLDING ?auto_1594 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1594 )
      ( MAKE-1PILE ?auto_1593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1596 - BLOCK
    )
    :vars
    (
      ?auto_1598 - BLOCK
      ?auto_1597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1596 ?auto_1598 ) ) ( ON ?auto_1596 ?auto_1597 ) ( not ( = ?auto_1596 ?auto_1597 ) ) ( not ( = ?auto_1598 ?auto_1597 ) ) ( ON ?auto_1598 ?auto_1596 ) ( CLEAR ?auto_1598 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1597 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1597 ?auto_1596 )
      ( MAKE-1PILE ?auto_1596 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1601 - BLOCK
      ?auto_1602 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1602 ) ( CLEAR ?auto_1601 ) ( ON-TABLE ?auto_1601 ) ( not ( = ?auto_1601 ?auto_1602 ) ) )
    :subtasks
    ( ( !STACK ?auto_1602 ?auto_1601 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1603 - BLOCK
      ?auto_1604 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1603 ) ( ON-TABLE ?auto_1603 ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( ON-TABLE ?auto_1604 ) ( CLEAR ?auto_1604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1604 )
      ( MAKE-2PILE ?auto_1603 ?auto_1604 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1605 - BLOCK
      ?auto_1606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1605 ?auto_1606 ) ) ( ON-TABLE ?auto_1606 ) ( CLEAR ?auto_1606 ) ( HOLDING ?auto_1605 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1605 )
      ( MAKE-2PILE ?auto_1605 ?auto_1606 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1607 - BLOCK
      ?auto_1608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1607 ?auto_1608 ) ) ( ON-TABLE ?auto_1608 ) ( ON ?auto_1607 ?auto_1608 ) ( CLEAR ?auto_1607 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1608 )
      ( MAKE-2PILE ?auto_1607 ?auto_1608 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1609 - BLOCK
      ?auto_1610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1609 ?auto_1610 ) ) ( ON-TABLE ?auto_1610 ) ( HOLDING ?auto_1609 ) ( CLEAR ?auto_1610 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1610 ?auto_1609 )
      ( MAKE-2PILE ?auto_1609 ?auto_1610 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1611 - BLOCK
      ?auto_1612 - BLOCK
    )
    :vars
    (
      ?auto_1613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1611 ?auto_1612 ) ) ( ON-TABLE ?auto_1612 ) ( CLEAR ?auto_1612 ) ( ON ?auto_1611 ?auto_1613 ) ( CLEAR ?auto_1611 ) ( HAND-EMPTY ) ( not ( = ?auto_1611 ?auto_1613 ) ) ( not ( = ?auto_1612 ?auto_1613 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1611 ?auto_1613 )
      ( MAKE-2PILE ?auto_1611 ?auto_1612 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1614 - BLOCK
      ?auto_1615 - BLOCK
    )
    :vars
    (
      ?auto_1616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1614 ?auto_1615 ) ) ( ON ?auto_1614 ?auto_1616 ) ( CLEAR ?auto_1614 ) ( not ( = ?auto_1614 ?auto_1616 ) ) ( not ( = ?auto_1615 ?auto_1616 ) ) ( HOLDING ?auto_1615 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1615 )
      ( MAKE-2PILE ?auto_1614 ?auto_1615 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1617 - BLOCK
      ?auto_1618 - BLOCK
    )
    :vars
    (
      ?auto_1619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1617 ?auto_1618 ) ) ( ON ?auto_1617 ?auto_1619 ) ( not ( = ?auto_1617 ?auto_1619 ) ) ( not ( = ?auto_1618 ?auto_1619 ) ) ( ON ?auto_1618 ?auto_1617 ) ( CLEAR ?auto_1618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1619 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1619 ?auto_1617 )
      ( MAKE-2PILE ?auto_1617 ?auto_1618 ) )
  )

)

