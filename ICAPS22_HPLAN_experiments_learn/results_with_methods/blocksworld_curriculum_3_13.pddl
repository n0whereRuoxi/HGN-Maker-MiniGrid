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
      ?auto_1517 - BLOCK
    )
    :vars
    (
      ?auto_1518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1517 ?auto_1518 ) ( CLEAR ?auto_1517 ) ( HAND-EMPTY ) ( not ( = ?auto_1517 ?auto_1518 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1517 ?auto_1518 )
      ( !PUTDOWN ?auto_1517 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1520 - BLOCK
    )
    :vars
    (
      ?auto_1521 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1520 ?auto_1521 ) ( CLEAR ?auto_1520 ) ( HAND-EMPTY ) ( not ( = ?auto_1520 ?auto_1521 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1520 ?auto_1521 )
      ( !PUTDOWN ?auto_1520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1524 - BLOCK
      ?auto_1525 - BLOCK
    )
    :vars
    (
      ?auto_1526 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1524 ) ( ON ?auto_1525 ?auto_1526 ) ( CLEAR ?auto_1525 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1524 ) ( not ( = ?auto_1524 ?auto_1525 ) ) ( not ( = ?auto_1524 ?auto_1526 ) ) ( not ( = ?auto_1525 ?auto_1526 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1525 ?auto_1526 )
      ( !STACK ?auto_1525 ?auto_1524 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1529 - BLOCK
      ?auto_1530 - BLOCK
    )
    :vars
    (
      ?auto_1531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1529 ) ( ON ?auto_1530 ?auto_1531 ) ( CLEAR ?auto_1530 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1529 ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( not ( = ?auto_1529 ?auto_1531 ) ) ( not ( = ?auto_1530 ?auto_1531 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1530 ?auto_1531 )
      ( !STACK ?auto_1530 ?auto_1529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1534 - BLOCK
      ?auto_1535 - BLOCK
    )
    :vars
    (
      ?auto_1536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1535 ?auto_1536 ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( not ( = ?auto_1534 ?auto_1536 ) ) ( not ( = ?auto_1535 ?auto_1536 ) ) ( ON ?auto_1534 ?auto_1535 ) ( CLEAR ?auto_1534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1534 )
      ( MAKE-2PILE ?auto_1534 ?auto_1535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1539 - BLOCK
      ?auto_1540 - BLOCK
    )
    :vars
    (
      ?auto_1541 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1540 ?auto_1541 ) ( not ( = ?auto_1539 ?auto_1540 ) ) ( not ( = ?auto_1539 ?auto_1541 ) ) ( not ( = ?auto_1540 ?auto_1541 ) ) ( ON ?auto_1539 ?auto_1540 ) ( CLEAR ?auto_1539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1539 )
      ( MAKE-2PILE ?auto_1539 ?auto_1540 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1545 - BLOCK
      ?auto_1546 - BLOCK
      ?auto_1547 - BLOCK
    )
    :vars
    (
      ?auto_1548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1546 ) ( ON ?auto_1547 ?auto_1548 ) ( CLEAR ?auto_1547 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1545 ) ( ON ?auto_1546 ?auto_1545 ) ( not ( = ?auto_1545 ?auto_1546 ) ) ( not ( = ?auto_1545 ?auto_1547 ) ) ( not ( = ?auto_1545 ?auto_1548 ) ) ( not ( = ?auto_1546 ?auto_1547 ) ) ( not ( = ?auto_1546 ?auto_1548 ) ) ( not ( = ?auto_1547 ?auto_1548 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1547 ?auto_1548 )
      ( !STACK ?auto_1547 ?auto_1546 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1552 - BLOCK
      ?auto_1553 - BLOCK
      ?auto_1554 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1553 ) ( ON-TABLE ?auto_1554 ) ( CLEAR ?auto_1554 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1552 ) ( ON ?auto_1553 ?auto_1552 ) ( not ( = ?auto_1552 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1554 ) ) ( not ( = ?auto_1553 ?auto_1554 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1554 )
      ( !STACK ?auto_1554 ?auto_1553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1558 - BLOCK
      ?auto_1559 - BLOCK
      ?auto_1560 - BLOCK
    )
    :vars
    (
      ?auto_1561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1560 ?auto_1561 ) ( ON-TABLE ?auto_1558 ) ( not ( = ?auto_1558 ?auto_1559 ) ) ( not ( = ?auto_1558 ?auto_1560 ) ) ( not ( = ?auto_1558 ?auto_1561 ) ) ( not ( = ?auto_1559 ?auto_1560 ) ) ( not ( = ?auto_1559 ?auto_1561 ) ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( CLEAR ?auto_1558 ) ( ON ?auto_1559 ?auto_1560 ) ( CLEAR ?auto_1559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1558 ?auto_1559 )
      ( MAKE-3PILE ?auto_1558 ?auto_1559 ?auto_1560 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1565 - BLOCK
      ?auto_1566 - BLOCK
      ?auto_1567 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1567 ) ( ON-TABLE ?auto_1565 ) ( not ( = ?auto_1565 ?auto_1566 ) ) ( not ( = ?auto_1565 ?auto_1567 ) ) ( not ( = ?auto_1566 ?auto_1567 ) ) ( CLEAR ?auto_1565 ) ( ON ?auto_1566 ?auto_1567 ) ( CLEAR ?auto_1566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1565 ?auto_1566 )
      ( MAKE-3PILE ?auto_1565 ?auto_1566 ?auto_1567 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1571 - BLOCK
      ?auto_1572 - BLOCK
      ?auto_1573 - BLOCK
    )
    :vars
    (
      ?auto_1574 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1573 ?auto_1574 ) ( not ( = ?auto_1571 ?auto_1572 ) ) ( not ( = ?auto_1571 ?auto_1573 ) ) ( not ( = ?auto_1571 ?auto_1574 ) ) ( not ( = ?auto_1572 ?auto_1573 ) ) ( not ( = ?auto_1572 ?auto_1574 ) ) ( not ( = ?auto_1573 ?auto_1574 ) ) ( ON ?auto_1572 ?auto_1573 ) ( ON ?auto_1571 ?auto_1572 ) ( CLEAR ?auto_1571 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1571 )
      ( MAKE-3PILE ?auto_1571 ?auto_1572 ?auto_1573 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1578 - BLOCK
      ?auto_1579 - BLOCK
      ?auto_1580 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1580 ) ( not ( = ?auto_1578 ?auto_1579 ) ) ( not ( = ?auto_1578 ?auto_1580 ) ) ( not ( = ?auto_1579 ?auto_1580 ) ) ( ON ?auto_1579 ?auto_1580 ) ( ON ?auto_1578 ?auto_1579 ) ( CLEAR ?auto_1578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1578 )
      ( MAKE-3PILE ?auto_1578 ?auto_1579 ?auto_1580 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1584 - BLOCK
      ?auto_1585 - BLOCK
      ?auto_1586 - BLOCK
    )
    :vars
    (
      ?auto_1587 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1584 ?auto_1585 ) ) ( not ( = ?auto_1584 ?auto_1586 ) ) ( not ( = ?auto_1585 ?auto_1586 ) ) ( ON ?auto_1584 ?auto_1587 ) ( not ( = ?auto_1586 ?auto_1587 ) ) ( not ( = ?auto_1585 ?auto_1587 ) ) ( not ( = ?auto_1584 ?auto_1587 ) ) ( ON ?auto_1585 ?auto_1584 ) ( ON ?auto_1586 ?auto_1585 ) ( CLEAR ?auto_1586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1586 ?auto_1585 ?auto_1584 )
      ( MAKE-3PILE ?auto_1584 ?auto_1585 ?auto_1586 ) )
  )

)

