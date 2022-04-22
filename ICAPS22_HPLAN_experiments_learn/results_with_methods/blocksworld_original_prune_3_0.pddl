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
      ?auto_1483 - BLOCK
      ?auto_1484 - BLOCK
      ?auto_1485 - BLOCK
    )
    :vars
    (
      ?auto_1486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1486 ?auto_1485 ) ( CLEAR ?auto_1486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1483 ) ( ON ?auto_1484 ?auto_1483 ) ( ON ?auto_1485 ?auto_1484 ) ( not ( = ?auto_1483 ?auto_1484 ) ) ( not ( = ?auto_1483 ?auto_1485 ) ) ( not ( = ?auto_1483 ?auto_1486 ) ) ( not ( = ?auto_1484 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1486 ) ) ( not ( = ?auto_1485 ?auto_1486 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1486 ?auto_1485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1488 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1488 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1488 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1489 - BLOCK
    )
    :vars
    (
      ?auto_1490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1489 ?auto_1490 ) ( CLEAR ?auto_1489 ) ( HAND-EMPTY ) ( not ( = ?auto_1489 ?auto_1490 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1489 ?auto_1490 )
      ( MAKE-1PILE ?auto_1489 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1493 - BLOCK
      ?auto_1494 - BLOCK
    )
    :vars
    (
      ?auto_1495 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1495 ?auto_1494 ) ( CLEAR ?auto_1495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1493 ) ( ON ?auto_1494 ?auto_1493 ) ( not ( = ?auto_1493 ?auto_1494 ) ) ( not ( = ?auto_1493 ?auto_1495 ) ) ( not ( = ?auto_1494 ?auto_1495 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1495 ?auto_1494 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1496 - BLOCK
      ?auto_1497 - BLOCK
    )
    :vars
    (
      ?auto_1498 - BLOCK
      ?auto_1499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1498 ?auto_1497 ) ( CLEAR ?auto_1498 ) ( ON-TABLE ?auto_1496 ) ( ON ?auto_1497 ?auto_1496 ) ( not ( = ?auto_1496 ?auto_1497 ) ) ( not ( = ?auto_1496 ?auto_1498 ) ) ( not ( = ?auto_1497 ?auto_1498 ) ) ( HOLDING ?auto_1499 ) ( not ( = ?auto_1496 ?auto_1499 ) ) ( not ( = ?auto_1497 ?auto_1499 ) ) ( not ( = ?auto_1498 ?auto_1499 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1499 )
      ( MAKE-2PILE ?auto_1496 ?auto_1497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1500 - BLOCK
      ?auto_1501 - BLOCK
    )
    :vars
    (
      ?auto_1502 - BLOCK
      ?auto_1503 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1502 ?auto_1501 ) ( ON-TABLE ?auto_1500 ) ( ON ?auto_1501 ?auto_1500 ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( not ( = ?auto_1500 ?auto_1502 ) ) ( not ( = ?auto_1501 ?auto_1502 ) ) ( not ( = ?auto_1500 ?auto_1503 ) ) ( not ( = ?auto_1501 ?auto_1503 ) ) ( not ( = ?auto_1502 ?auto_1503 ) ) ( ON ?auto_1503 ?auto_1502 ) ( CLEAR ?auto_1503 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1500 ?auto_1501 ?auto_1502 )
      ( MAKE-2PILE ?auto_1500 ?auto_1501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1506 - BLOCK
      ?auto_1507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1507 ) ( CLEAR ?auto_1506 ) ( ON-TABLE ?auto_1506 ) ( not ( = ?auto_1506 ?auto_1507 ) ) )
    :subtasks
    ( ( !STACK ?auto_1507 ?auto_1506 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1508 - BLOCK
      ?auto_1509 - BLOCK
    )
    :vars
    (
      ?auto_1510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1508 ) ( ON-TABLE ?auto_1508 ) ( not ( = ?auto_1508 ?auto_1509 ) ) ( ON ?auto_1509 ?auto_1510 ) ( CLEAR ?auto_1509 ) ( HAND-EMPTY ) ( not ( = ?auto_1508 ?auto_1510 ) ) ( not ( = ?auto_1509 ?auto_1510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1509 ?auto_1510 )
      ( MAKE-2PILE ?auto_1508 ?auto_1509 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1511 - BLOCK
      ?auto_1512 - BLOCK
    )
    :vars
    (
      ?auto_1513 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1511 ?auto_1512 ) ) ( ON ?auto_1512 ?auto_1513 ) ( CLEAR ?auto_1512 ) ( not ( = ?auto_1511 ?auto_1513 ) ) ( not ( = ?auto_1512 ?auto_1513 ) ) ( HOLDING ?auto_1511 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1511 )
      ( MAKE-2PILE ?auto_1511 ?auto_1512 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1514 - BLOCK
      ?auto_1515 - BLOCK
    )
    :vars
    (
      ?auto_1516 - BLOCK
      ?auto_1517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1514 ?auto_1515 ) ) ( ON ?auto_1515 ?auto_1516 ) ( not ( = ?auto_1514 ?auto_1516 ) ) ( not ( = ?auto_1515 ?auto_1516 ) ) ( ON ?auto_1514 ?auto_1515 ) ( CLEAR ?auto_1514 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1517 ) ( ON ?auto_1516 ?auto_1517 ) ( not ( = ?auto_1517 ?auto_1516 ) ) ( not ( = ?auto_1517 ?auto_1515 ) ) ( not ( = ?auto_1517 ?auto_1514 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1517 ?auto_1516 ?auto_1515 )
      ( MAKE-2PILE ?auto_1514 ?auto_1515 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1519 - BLOCK
    )
    :vars
    (
      ?auto_1520 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1520 ?auto_1519 ) ( CLEAR ?auto_1520 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1519 ) ( not ( = ?auto_1519 ?auto_1520 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1520 ?auto_1519 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1521 - BLOCK
    )
    :vars
    (
      ?auto_1522 - BLOCK
      ?auto_1523 - BLOCK
      ?auto_1524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1522 ?auto_1521 ) ( CLEAR ?auto_1522 ) ( ON-TABLE ?auto_1521 ) ( not ( = ?auto_1521 ?auto_1522 ) ) ( HOLDING ?auto_1523 ) ( CLEAR ?auto_1524 ) ( not ( = ?auto_1521 ?auto_1523 ) ) ( not ( = ?auto_1521 ?auto_1524 ) ) ( not ( = ?auto_1522 ?auto_1523 ) ) ( not ( = ?auto_1522 ?auto_1524 ) ) ( not ( = ?auto_1523 ?auto_1524 ) ) )
    :subtasks
    ( ( !STACK ?auto_1523 ?auto_1524 )
      ( MAKE-1PILE ?auto_1521 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1611 - BLOCK
    )
    :vars
    (
      ?auto_1613 - BLOCK
      ?auto_1612 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1613 ?auto_1611 ) ( ON-TABLE ?auto_1611 ) ( not ( = ?auto_1611 ?auto_1613 ) ) ( not ( = ?auto_1611 ?auto_1612 ) ) ( not ( = ?auto_1613 ?auto_1612 ) ) ( ON ?auto_1612 ?auto_1613 ) ( CLEAR ?auto_1612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1611 ?auto_1613 )
      ( MAKE-1PILE ?auto_1611 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1529 - BLOCK
    )
    :vars
    (
      ?auto_1532 - BLOCK
      ?auto_1530 - BLOCK
      ?auto_1531 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1532 ?auto_1529 ) ( ON-TABLE ?auto_1529 ) ( not ( = ?auto_1529 ?auto_1532 ) ) ( not ( = ?auto_1529 ?auto_1530 ) ) ( not ( = ?auto_1529 ?auto_1531 ) ) ( not ( = ?auto_1532 ?auto_1530 ) ) ( not ( = ?auto_1532 ?auto_1531 ) ) ( not ( = ?auto_1530 ?auto_1531 ) ) ( ON ?auto_1530 ?auto_1532 ) ( CLEAR ?auto_1530 ) ( HOLDING ?auto_1531 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1531 )
      ( MAKE-1PILE ?auto_1529 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1533 - BLOCK
    )
    :vars
    (
      ?auto_1536 - BLOCK
      ?auto_1535 - BLOCK
      ?auto_1534 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1536 ?auto_1533 ) ( ON-TABLE ?auto_1533 ) ( not ( = ?auto_1533 ?auto_1536 ) ) ( not ( = ?auto_1533 ?auto_1535 ) ) ( not ( = ?auto_1533 ?auto_1534 ) ) ( not ( = ?auto_1536 ?auto_1535 ) ) ( not ( = ?auto_1536 ?auto_1534 ) ) ( not ( = ?auto_1535 ?auto_1534 ) ) ( ON ?auto_1535 ?auto_1536 ) ( ON ?auto_1534 ?auto_1535 ) ( CLEAR ?auto_1534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1533 ?auto_1536 ?auto_1535 )
      ( MAKE-1PILE ?auto_1533 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1540 - BLOCK
      ?auto_1541 - BLOCK
      ?auto_1542 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1542 ) ( CLEAR ?auto_1541 ) ( ON-TABLE ?auto_1540 ) ( ON ?auto_1541 ?auto_1540 ) ( not ( = ?auto_1540 ?auto_1541 ) ) ( not ( = ?auto_1540 ?auto_1542 ) ) ( not ( = ?auto_1541 ?auto_1542 ) ) )
    :subtasks
    ( ( !STACK ?auto_1542 ?auto_1541 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1543 - BLOCK
      ?auto_1544 - BLOCK
      ?auto_1545 - BLOCK
    )
    :vars
    (
      ?auto_1546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1544 ) ( ON-TABLE ?auto_1543 ) ( ON ?auto_1544 ?auto_1543 ) ( not ( = ?auto_1543 ?auto_1544 ) ) ( not ( = ?auto_1543 ?auto_1545 ) ) ( not ( = ?auto_1544 ?auto_1545 ) ) ( ON ?auto_1545 ?auto_1546 ) ( CLEAR ?auto_1545 ) ( HAND-EMPTY ) ( not ( = ?auto_1543 ?auto_1546 ) ) ( not ( = ?auto_1544 ?auto_1546 ) ) ( not ( = ?auto_1545 ?auto_1546 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1545 ?auto_1546 )
      ( MAKE-3PILE ?auto_1543 ?auto_1544 ?auto_1545 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1547 - BLOCK
      ?auto_1548 - BLOCK
      ?auto_1549 - BLOCK
    )
    :vars
    (
      ?auto_1550 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1547 ) ( not ( = ?auto_1547 ?auto_1548 ) ) ( not ( = ?auto_1547 ?auto_1549 ) ) ( not ( = ?auto_1548 ?auto_1549 ) ) ( ON ?auto_1549 ?auto_1550 ) ( CLEAR ?auto_1549 ) ( not ( = ?auto_1547 ?auto_1550 ) ) ( not ( = ?auto_1548 ?auto_1550 ) ) ( not ( = ?auto_1549 ?auto_1550 ) ) ( HOLDING ?auto_1548 ) ( CLEAR ?auto_1547 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1547 ?auto_1548 )
      ( MAKE-3PILE ?auto_1547 ?auto_1548 ?auto_1549 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1551 - BLOCK
      ?auto_1552 - BLOCK
      ?auto_1553 - BLOCK
    )
    :vars
    (
      ?auto_1554 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1551 ) ( not ( = ?auto_1551 ?auto_1552 ) ) ( not ( = ?auto_1551 ?auto_1553 ) ) ( not ( = ?auto_1552 ?auto_1553 ) ) ( ON ?auto_1553 ?auto_1554 ) ( not ( = ?auto_1551 ?auto_1554 ) ) ( not ( = ?auto_1552 ?auto_1554 ) ) ( not ( = ?auto_1553 ?auto_1554 ) ) ( CLEAR ?auto_1551 ) ( ON ?auto_1552 ?auto_1553 ) ( CLEAR ?auto_1552 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1554 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1554 ?auto_1553 )
      ( MAKE-3PILE ?auto_1551 ?auto_1552 ?auto_1553 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1555 - BLOCK
      ?auto_1556 - BLOCK
      ?auto_1557 - BLOCK
    )
    :vars
    (
      ?auto_1558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1555 ?auto_1556 ) ) ( not ( = ?auto_1555 ?auto_1557 ) ) ( not ( = ?auto_1556 ?auto_1557 ) ) ( ON ?auto_1557 ?auto_1558 ) ( not ( = ?auto_1555 ?auto_1558 ) ) ( not ( = ?auto_1556 ?auto_1558 ) ) ( not ( = ?auto_1557 ?auto_1558 ) ) ( ON ?auto_1556 ?auto_1557 ) ( CLEAR ?auto_1556 ) ( ON-TABLE ?auto_1558 ) ( HOLDING ?auto_1555 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1555 )
      ( MAKE-3PILE ?auto_1555 ?auto_1556 ?auto_1557 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1559 - BLOCK
      ?auto_1560 - BLOCK
      ?auto_1561 - BLOCK
    )
    :vars
    (
      ?auto_1562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1559 ?auto_1560 ) ) ( not ( = ?auto_1559 ?auto_1561 ) ) ( not ( = ?auto_1560 ?auto_1561 ) ) ( ON ?auto_1561 ?auto_1562 ) ( not ( = ?auto_1559 ?auto_1562 ) ) ( not ( = ?auto_1560 ?auto_1562 ) ) ( not ( = ?auto_1561 ?auto_1562 ) ) ( ON ?auto_1560 ?auto_1561 ) ( ON-TABLE ?auto_1562 ) ( ON ?auto_1559 ?auto_1560 ) ( CLEAR ?auto_1559 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1562 ?auto_1561 ?auto_1560 )
      ( MAKE-3PILE ?auto_1559 ?auto_1560 ?auto_1561 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1589 - BLOCK
    )
    :vars
    (
      ?auto_1590 - BLOCK
      ?auto_1591 - BLOCK
      ?auto_1592 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1589 ?auto_1590 ) ( CLEAR ?auto_1589 ) ( not ( = ?auto_1589 ?auto_1590 ) ) ( HOLDING ?auto_1591 ) ( CLEAR ?auto_1592 ) ( not ( = ?auto_1589 ?auto_1591 ) ) ( not ( = ?auto_1589 ?auto_1592 ) ) ( not ( = ?auto_1590 ?auto_1591 ) ) ( not ( = ?auto_1590 ?auto_1592 ) ) ( not ( = ?auto_1591 ?auto_1592 ) ) )
    :subtasks
    ( ( !STACK ?auto_1591 ?auto_1592 )
      ( MAKE-1PILE ?auto_1589 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1593 - BLOCK
    )
    :vars
    (
      ?auto_1595 - BLOCK
      ?auto_1594 - BLOCK
      ?auto_1596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1593 ?auto_1595 ) ( not ( = ?auto_1593 ?auto_1595 ) ) ( CLEAR ?auto_1594 ) ( not ( = ?auto_1593 ?auto_1596 ) ) ( not ( = ?auto_1593 ?auto_1594 ) ) ( not ( = ?auto_1595 ?auto_1596 ) ) ( not ( = ?auto_1595 ?auto_1594 ) ) ( not ( = ?auto_1596 ?auto_1594 ) ) ( ON ?auto_1596 ?auto_1593 ) ( CLEAR ?auto_1596 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1595 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1595 ?auto_1593 )
      ( MAKE-1PILE ?auto_1593 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1597 - BLOCK
    )
    :vars
    (
      ?auto_1598 - BLOCK
      ?auto_1599 - BLOCK
      ?auto_1600 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1597 ?auto_1598 ) ( not ( = ?auto_1597 ?auto_1598 ) ) ( not ( = ?auto_1597 ?auto_1599 ) ) ( not ( = ?auto_1597 ?auto_1600 ) ) ( not ( = ?auto_1598 ?auto_1599 ) ) ( not ( = ?auto_1598 ?auto_1600 ) ) ( not ( = ?auto_1599 ?auto_1600 ) ) ( ON ?auto_1599 ?auto_1597 ) ( CLEAR ?auto_1599 ) ( ON-TABLE ?auto_1598 ) ( HOLDING ?auto_1600 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1600 )
      ( MAKE-1PILE ?auto_1597 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1601 - BLOCK
    )
    :vars
    (
      ?auto_1603 - BLOCK
      ?auto_1604 - BLOCK
      ?auto_1602 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1601 ?auto_1603 ) ( not ( = ?auto_1601 ?auto_1603 ) ) ( not ( = ?auto_1601 ?auto_1604 ) ) ( not ( = ?auto_1601 ?auto_1602 ) ) ( not ( = ?auto_1603 ?auto_1604 ) ) ( not ( = ?auto_1603 ?auto_1602 ) ) ( not ( = ?auto_1604 ?auto_1602 ) ) ( ON ?auto_1604 ?auto_1601 ) ( ON-TABLE ?auto_1603 ) ( ON ?auto_1602 ?auto_1604 ) ( CLEAR ?auto_1602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1603 ?auto_1601 ?auto_1604 )
      ( MAKE-1PILE ?auto_1601 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1608 - BLOCK
    )
    :vars
    (
      ?auto_1609 - BLOCK
      ?auto_1610 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1609 ?auto_1608 ) ( CLEAR ?auto_1609 ) ( ON-TABLE ?auto_1608 ) ( not ( = ?auto_1608 ?auto_1609 ) ) ( HOLDING ?auto_1610 ) ( not ( = ?auto_1608 ?auto_1610 ) ) ( not ( = ?auto_1609 ?auto_1610 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1610 )
      ( MAKE-1PILE ?auto_1608 ) )
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
    ( and ( not ( = ?auto_1633 ?auto_1634 ) ) ( ON ?auto_1634 ?auto_1635 ) ( not ( = ?auto_1633 ?auto_1635 ) ) ( not ( = ?auto_1634 ?auto_1635 ) ) ( ON ?auto_1633 ?auto_1634 ) ( CLEAR ?auto_1633 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1635 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1635 ?auto_1634 )
      ( MAKE-2PILE ?auto_1633 ?auto_1634 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1638 - BLOCK
      ?auto_1639 - BLOCK
    )
    :vars
    (
      ?auto_1640 - BLOCK
      ?auto_1641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1638 ?auto_1639 ) ) ( ON ?auto_1639 ?auto_1640 ) ( CLEAR ?auto_1639 ) ( not ( = ?auto_1638 ?auto_1640 ) ) ( not ( = ?auto_1639 ?auto_1640 ) ) ( ON ?auto_1638 ?auto_1641 ) ( CLEAR ?auto_1638 ) ( HAND-EMPTY ) ( not ( = ?auto_1638 ?auto_1641 ) ) ( not ( = ?auto_1639 ?auto_1641 ) ) ( not ( = ?auto_1640 ?auto_1641 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1638 ?auto_1641 )
      ( MAKE-2PILE ?auto_1638 ?auto_1639 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1642 - BLOCK
      ?auto_1643 - BLOCK
    )
    :vars
    (
      ?auto_1645 - BLOCK
      ?auto_1644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1642 ?auto_1643 ) ) ( not ( = ?auto_1642 ?auto_1645 ) ) ( not ( = ?auto_1643 ?auto_1645 ) ) ( ON ?auto_1642 ?auto_1644 ) ( CLEAR ?auto_1642 ) ( not ( = ?auto_1642 ?auto_1644 ) ) ( not ( = ?auto_1643 ?auto_1644 ) ) ( not ( = ?auto_1645 ?auto_1644 ) ) ( HOLDING ?auto_1643 ) ( CLEAR ?auto_1645 ) ( ON-TABLE ?auto_1645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1645 ?auto_1643 )
      ( MAKE-2PILE ?auto_1642 ?auto_1643 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1646 - BLOCK
      ?auto_1647 - BLOCK
    )
    :vars
    (
      ?auto_1648 - BLOCK
      ?auto_1649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1646 ?auto_1647 ) ) ( not ( = ?auto_1646 ?auto_1648 ) ) ( not ( = ?auto_1647 ?auto_1648 ) ) ( ON ?auto_1646 ?auto_1649 ) ( not ( = ?auto_1646 ?auto_1649 ) ) ( not ( = ?auto_1647 ?auto_1649 ) ) ( not ( = ?auto_1648 ?auto_1649 ) ) ( CLEAR ?auto_1648 ) ( ON-TABLE ?auto_1648 ) ( ON ?auto_1647 ?auto_1646 ) ( CLEAR ?auto_1647 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1649 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1649 ?auto_1646 )
      ( MAKE-2PILE ?auto_1646 ?auto_1647 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1650 - BLOCK
      ?auto_1651 - BLOCK
    )
    :vars
    (
      ?auto_1653 - BLOCK
      ?auto_1652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1650 ?auto_1651 ) ) ( not ( = ?auto_1650 ?auto_1653 ) ) ( not ( = ?auto_1651 ?auto_1653 ) ) ( ON ?auto_1650 ?auto_1652 ) ( not ( = ?auto_1650 ?auto_1652 ) ) ( not ( = ?auto_1651 ?auto_1652 ) ) ( not ( = ?auto_1653 ?auto_1652 ) ) ( ON ?auto_1651 ?auto_1650 ) ( CLEAR ?auto_1651 ) ( ON-TABLE ?auto_1652 ) ( HOLDING ?auto_1653 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1653 )
      ( MAKE-2PILE ?auto_1650 ?auto_1651 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1654 - BLOCK
      ?auto_1655 - BLOCK
    )
    :vars
    (
      ?auto_1657 - BLOCK
      ?auto_1656 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1654 ?auto_1655 ) ) ( not ( = ?auto_1654 ?auto_1657 ) ) ( not ( = ?auto_1655 ?auto_1657 ) ) ( ON ?auto_1654 ?auto_1656 ) ( not ( = ?auto_1654 ?auto_1656 ) ) ( not ( = ?auto_1655 ?auto_1656 ) ) ( not ( = ?auto_1657 ?auto_1656 ) ) ( ON ?auto_1655 ?auto_1654 ) ( ON-TABLE ?auto_1656 ) ( ON ?auto_1657 ?auto_1655 ) ( CLEAR ?auto_1657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1656 ?auto_1654 ?auto_1655 )
      ( MAKE-2PILE ?auto_1654 ?auto_1655 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1664 - BLOCK
      ?auto_1665 - BLOCK
      ?auto_1666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1665 ) ( ON-TABLE ?auto_1664 ) ( ON ?auto_1665 ?auto_1664 ) ( not ( = ?auto_1664 ?auto_1665 ) ) ( not ( = ?auto_1664 ?auto_1666 ) ) ( not ( = ?auto_1665 ?auto_1666 ) ) ( ON-TABLE ?auto_1666 ) ( CLEAR ?auto_1666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1666 )
      ( MAKE-3PILE ?auto_1664 ?auto_1665 ?auto_1666 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1667 - BLOCK
      ?auto_1668 - BLOCK
      ?auto_1669 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1667 ) ( not ( = ?auto_1667 ?auto_1668 ) ) ( not ( = ?auto_1667 ?auto_1669 ) ) ( not ( = ?auto_1668 ?auto_1669 ) ) ( ON-TABLE ?auto_1669 ) ( CLEAR ?auto_1669 ) ( HOLDING ?auto_1668 ) ( CLEAR ?auto_1667 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1667 ?auto_1668 )
      ( MAKE-3PILE ?auto_1667 ?auto_1668 ?auto_1669 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1670 - BLOCK
      ?auto_1671 - BLOCK
      ?auto_1672 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1670 ) ( not ( = ?auto_1670 ?auto_1671 ) ) ( not ( = ?auto_1670 ?auto_1672 ) ) ( not ( = ?auto_1671 ?auto_1672 ) ) ( ON-TABLE ?auto_1672 ) ( CLEAR ?auto_1670 ) ( ON ?auto_1671 ?auto_1672 ) ( CLEAR ?auto_1671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1672 )
      ( MAKE-3PILE ?auto_1670 ?auto_1671 ?auto_1672 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1673 - BLOCK
      ?auto_1674 - BLOCK
      ?auto_1675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1673 ?auto_1674 ) ) ( not ( = ?auto_1673 ?auto_1675 ) ) ( not ( = ?auto_1674 ?auto_1675 ) ) ( ON-TABLE ?auto_1675 ) ( ON ?auto_1674 ?auto_1675 ) ( CLEAR ?auto_1674 ) ( HOLDING ?auto_1673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1673 )
      ( MAKE-3PILE ?auto_1673 ?auto_1674 ?auto_1675 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1676 - BLOCK
      ?auto_1677 - BLOCK
      ?auto_1678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1676 ?auto_1677 ) ) ( not ( = ?auto_1676 ?auto_1678 ) ) ( not ( = ?auto_1677 ?auto_1678 ) ) ( ON-TABLE ?auto_1678 ) ( ON ?auto_1677 ?auto_1678 ) ( ON ?auto_1676 ?auto_1677 ) ( CLEAR ?auto_1676 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1678 ?auto_1677 )
      ( MAKE-3PILE ?auto_1676 ?auto_1677 ?auto_1678 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1682 - BLOCK
      ?auto_1683 - BLOCK
      ?auto_1684 - BLOCK
    )
    :vars
    (
      ?auto_1685 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1682 ?auto_1683 ) ) ( not ( = ?auto_1682 ?auto_1684 ) ) ( not ( = ?auto_1683 ?auto_1684 ) ) ( ON-TABLE ?auto_1684 ) ( ON ?auto_1683 ?auto_1684 ) ( CLEAR ?auto_1683 ) ( ON ?auto_1682 ?auto_1685 ) ( CLEAR ?auto_1682 ) ( HAND-EMPTY ) ( not ( = ?auto_1682 ?auto_1685 ) ) ( not ( = ?auto_1683 ?auto_1685 ) ) ( not ( = ?auto_1684 ?auto_1685 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1682 ?auto_1685 )
      ( MAKE-3PILE ?auto_1682 ?auto_1683 ?auto_1684 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1686 - BLOCK
      ?auto_1687 - BLOCK
      ?auto_1688 - BLOCK
    )
    :vars
    (
      ?auto_1689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1686 ?auto_1687 ) ) ( not ( = ?auto_1686 ?auto_1688 ) ) ( not ( = ?auto_1687 ?auto_1688 ) ) ( ON-TABLE ?auto_1688 ) ( ON ?auto_1686 ?auto_1689 ) ( CLEAR ?auto_1686 ) ( not ( = ?auto_1686 ?auto_1689 ) ) ( not ( = ?auto_1687 ?auto_1689 ) ) ( not ( = ?auto_1688 ?auto_1689 ) ) ( HOLDING ?auto_1687 ) ( CLEAR ?auto_1688 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1688 ?auto_1687 )
      ( MAKE-3PILE ?auto_1686 ?auto_1687 ?auto_1688 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1690 - BLOCK
      ?auto_1691 - BLOCK
      ?auto_1692 - BLOCK
    )
    :vars
    (
      ?auto_1693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1690 ?auto_1691 ) ) ( not ( = ?auto_1690 ?auto_1692 ) ) ( not ( = ?auto_1691 ?auto_1692 ) ) ( ON-TABLE ?auto_1692 ) ( ON ?auto_1690 ?auto_1693 ) ( not ( = ?auto_1690 ?auto_1693 ) ) ( not ( = ?auto_1691 ?auto_1693 ) ) ( not ( = ?auto_1692 ?auto_1693 ) ) ( CLEAR ?auto_1692 ) ( ON ?auto_1691 ?auto_1690 ) ( CLEAR ?auto_1691 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1693 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1693 ?auto_1690 )
      ( MAKE-3PILE ?auto_1690 ?auto_1691 ?auto_1692 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1694 - BLOCK
      ?auto_1695 - BLOCK
      ?auto_1696 - BLOCK
    )
    :vars
    (
      ?auto_1697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1694 ?auto_1695 ) ) ( not ( = ?auto_1694 ?auto_1696 ) ) ( not ( = ?auto_1695 ?auto_1696 ) ) ( ON ?auto_1694 ?auto_1697 ) ( not ( = ?auto_1694 ?auto_1697 ) ) ( not ( = ?auto_1695 ?auto_1697 ) ) ( not ( = ?auto_1696 ?auto_1697 ) ) ( ON ?auto_1695 ?auto_1694 ) ( CLEAR ?auto_1695 ) ( ON-TABLE ?auto_1697 ) ( HOLDING ?auto_1696 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1696 )
      ( MAKE-3PILE ?auto_1694 ?auto_1695 ?auto_1696 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1698 - BLOCK
      ?auto_1699 - BLOCK
      ?auto_1700 - BLOCK
    )
    :vars
    (
      ?auto_1701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1698 ?auto_1699 ) ) ( not ( = ?auto_1698 ?auto_1700 ) ) ( not ( = ?auto_1699 ?auto_1700 ) ) ( ON ?auto_1698 ?auto_1701 ) ( not ( = ?auto_1698 ?auto_1701 ) ) ( not ( = ?auto_1699 ?auto_1701 ) ) ( not ( = ?auto_1700 ?auto_1701 ) ) ( ON ?auto_1699 ?auto_1698 ) ( ON-TABLE ?auto_1701 ) ( ON ?auto_1700 ?auto_1699 ) ( CLEAR ?auto_1700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1701 ?auto_1698 ?auto_1699 )
      ( MAKE-3PILE ?auto_1698 ?auto_1699 ?auto_1700 ) )
  )

)

