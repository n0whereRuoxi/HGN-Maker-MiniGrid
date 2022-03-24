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
      ?auto_1460 - BLOCK
      ?auto_1461 - BLOCK
    )
    :vars
    (
      ?auto_1462 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1462 ?auto_1461 ) ( CLEAR ?auto_1462 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1460 ) ( ON ?auto_1461 ?auto_1460 ) ( not ( = ?auto_1460 ?auto_1461 ) ) ( not ( = ?auto_1460 ?auto_1462 ) ) ( not ( = ?auto_1461 ?auto_1462 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1462 ?auto_1461 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1464 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1464 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1464 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1465 - BLOCK
    )
    :vars
    (
      ?auto_1466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1465 ?auto_1466 ) ( CLEAR ?auto_1465 ) ( HAND-EMPTY ) ( not ( = ?auto_1465 ?auto_1466 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1465 ?auto_1466 )
      ( MAKE-1PILE ?auto_1465 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1468 - BLOCK
    )
    :vars
    (
      ?auto_1469 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1469 ?auto_1468 ) ( CLEAR ?auto_1469 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1468 ) ( not ( = ?auto_1468 ?auto_1469 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1469 ?auto_1468 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1470 - BLOCK
    )
    :vars
    (
      ?auto_1471 - BLOCK
      ?auto_1472 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1471 ?auto_1470 ) ( CLEAR ?auto_1471 ) ( ON-TABLE ?auto_1470 ) ( not ( = ?auto_1470 ?auto_1471 ) ) ( HOLDING ?auto_1472 ) ( not ( = ?auto_1470 ?auto_1472 ) ) ( not ( = ?auto_1471 ?auto_1472 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1472 )
      ( MAKE-1PILE ?auto_1470 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1473 - BLOCK
    )
    :vars
    (
      ?auto_1475 - BLOCK
      ?auto_1474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1475 ?auto_1473 ) ( ON-TABLE ?auto_1473 ) ( not ( = ?auto_1473 ?auto_1475 ) ) ( not ( = ?auto_1473 ?auto_1474 ) ) ( not ( = ?auto_1475 ?auto_1474 ) ) ( ON ?auto_1474 ?auto_1475 ) ( CLEAR ?auto_1474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1473 ?auto_1475 )
      ( MAKE-1PILE ?auto_1473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1478 - BLOCK
      ?auto_1479 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1479 ) ( CLEAR ?auto_1478 ) ( ON-TABLE ?auto_1478 ) ( not ( = ?auto_1478 ?auto_1479 ) ) )
    :subtasks
    ( ( !STACK ?auto_1479 ?auto_1478 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1480 - BLOCK
      ?auto_1481 - BLOCK
    )
    :vars
    (
      ?auto_1482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1480 ) ( ON-TABLE ?auto_1480 ) ( not ( = ?auto_1480 ?auto_1481 ) ) ( ON ?auto_1481 ?auto_1482 ) ( CLEAR ?auto_1481 ) ( HAND-EMPTY ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( not ( = ?auto_1481 ?auto_1482 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1481 ?auto_1482 )
      ( MAKE-2PILE ?auto_1480 ?auto_1481 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1483 - BLOCK
      ?auto_1484 - BLOCK
    )
    :vars
    (
      ?auto_1485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1483 ?auto_1484 ) ) ( ON ?auto_1484 ?auto_1485 ) ( CLEAR ?auto_1484 ) ( not ( = ?auto_1483 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1485 ) ) ( HOLDING ?auto_1483 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1483 )
      ( MAKE-2PILE ?auto_1483 ?auto_1484 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1486 - BLOCK
      ?auto_1487 - BLOCK
    )
    :vars
    (
      ?auto_1488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1486 ?auto_1487 ) ) ( ON ?auto_1487 ?auto_1488 ) ( not ( = ?auto_1486 ?auto_1488 ) ) ( not ( = ?auto_1487 ?auto_1488 ) ) ( ON ?auto_1486 ?auto_1487 ) ( CLEAR ?auto_1486 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1488 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1488 ?auto_1487 )
      ( MAKE-2PILE ?auto_1486 ?auto_1487 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1490 - BLOCK
    )
    :vars
    (
      ?auto_1491 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1491 ?auto_1490 ) ( CLEAR ?auto_1491 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1490 ) ( not ( = ?auto_1490 ?auto_1491 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1491 ?auto_1490 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1497 - BLOCK
    )
    :vars
    (
      ?auto_1498 - BLOCK
      ?auto_1499 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1497 ?auto_1498 ) ) ( ON ?auto_1498 ?auto_1499 ) ( CLEAR ?auto_1498 ) ( not ( = ?auto_1497 ?auto_1499 ) ) ( not ( = ?auto_1498 ?auto_1499 ) ) ( HOLDING ?auto_1497 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1497 ?auto_1498 )
      ( MAKE-1PILE ?auto_1497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1500 - BLOCK
    )
    :vars
    (
      ?auto_1502 - BLOCK
      ?auto_1501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1500 ?auto_1502 ) ) ( ON ?auto_1502 ?auto_1501 ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( not ( = ?auto_1502 ?auto_1501 ) ) ( ON ?auto_1500 ?auto_1502 ) ( CLEAR ?auto_1500 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1501 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1501 ?auto_1502 )
      ( MAKE-1PILE ?auto_1500 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1504 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1504 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1505 - BLOCK
    )
    :vars
    (
      ?auto_1506 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1505 ?auto_1506 ) ( CLEAR ?auto_1505 ) ( HAND-EMPTY ) ( not ( = ?auto_1505 ?auto_1506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1505 ?auto_1506 )
      ( MAKE-1PILE ?auto_1505 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1507 - BLOCK
    )
    :vars
    (
      ?auto_1508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1507 ?auto_1508 ) ) ( HOLDING ?auto_1507 ) ( CLEAR ?auto_1508 ) ( ON-TABLE ?auto_1508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1508 ?auto_1507 )
      ( MAKE-1PILE ?auto_1507 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1509 - BLOCK
    )
    :vars
    (
      ?auto_1510 - BLOCK
      ?auto_1511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1509 ?auto_1510 ) ) ( CLEAR ?auto_1510 ) ( ON-TABLE ?auto_1510 ) ( ON ?auto_1509 ?auto_1511 ) ( CLEAR ?auto_1509 ) ( HAND-EMPTY ) ( not ( = ?auto_1509 ?auto_1511 ) ) ( not ( = ?auto_1510 ?auto_1511 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1509 ?auto_1511 )
      ( MAKE-1PILE ?auto_1509 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1512 - BLOCK
    )
    :vars
    (
      ?auto_1513 - BLOCK
      ?auto_1514 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1512 ?auto_1513 ) ) ( ON ?auto_1512 ?auto_1514 ) ( CLEAR ?auto_1512 ) ( not ( = ?auto_1512 ?auto_1514 ) ) ( not ( = ?auto_1513 ?auto_1514 ) ) ( HOLDING ?auto_1513 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1513 )
      ( MAKE-1PILE ?auto_1512 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1515 - BLOCK
    )
    :vars
    (
      ?auto_1516 - BLOCK
      ?auto_1517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1515 ?auto_1516 ) ) ( ON ?auto_1515 ?auto_1517 ) ( not ( = ?auto_1515 ?auto_1517 ) ) ( not ( = ?auto_1516 ?auto_1517 ) ) ( ON ?auto_1516 ?auto_1515 ) ( CLEAR ?auto_1516 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1517 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1517 ?auto_1515 )
      ( MAKE-1PILE ?auto_1515 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1520 - BLOCK
      ?auto_1521 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1521 ) ( CLEAR ?auto_1520 ) ( ON-TABLE ?auto_1520 ) ( not ( = ?auto_1520 ?auto_1521 ) ) )
    :subtasks
    ( ( !STACK ?auto_1521 ?auto_1520 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1522 - BLOCK
      ?auto_1523 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1522 ) ( ON-TABLE ?auto_1522 ) ( not ( = ?auto_1522 ?auto_1523 ) ) ( ON-TABLE ?auto_1523 ) ( CLEAR ?auto_1523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1523 )
      ( MAKE-2PILE ?auto_1522 ?auto_1523 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1524 - BLOCK
      ?auto_1525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1524 ?auto_1525 ) ) ( ON-TABLE ?auto_1525 ) ( CLEAR ?auto_1525 ) ( HOLDING ?auto_1524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1524 )
      ( MAKE-2PILE ?auto_1524 ?auto_1525 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1526 - BLOCK
      ?auto_1527 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1526 ?auto_1527 ) ) ( ON-TABLE ?auto_1527 ) ( ON ?auto_1526 ?auto_1527 ) ( CLEAR ?auto_1526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1527 )
      ( MAKE-2PILE ?auto_1526 ?auto_1527 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1528 - BLOCK
      ?auto_1529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1528 ?auto_1529 ) ) ( ON-TABLE ?auto_1529 ) ( HOLDING ?auto_1528 ) ( CLEAR ?auto_1529 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1529 ?auto_1528 )
      ( MAKE-2PILE ?auto_1528 ?auto_1529 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1530 - BLOCK
      ?auto_1531 - BLOCK
    )
    :vars
    (
      ?auto_1532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1530 ?auto_1531 ) ) ( ON-TABLE ?auto_1531 ) ( CLEAR ?auto_1531 ) ( ON ?auto_1530 ?auto_1532 ) ( CLEAR ?auto_1530 ) ( HAND-EMPTY ) ( not ( = ?auto_1530 ?auto_1532 ) ) ( not ( = ?auto_1531 ?auto_1532 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1530 ?auto_1532 )
      ( MAKE-2PILE ?auto_1530 ?auto_1531 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1533 - BLOCK
      ?auto_1534 - BLOCK
    )
    :vars
    (
      ?auto_1535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1533 ?auto_1534 ) ) ( ON ?auto_1533 ?auto_1535 ) ( CLEAR ?auto_1533 ) ( not ( = ?auto_1533 ?auto_1535 ) ) ( not ( = ?auto_1534 ?auto_1535 ) ) ( HOLDING ?auto_1534 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1534 )
      ( MAKE-2PILE ?auto_1533 ?auto_1534 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1536 - BLOCK
      ?auto_1537 - BLOCK
    )
    :vars
    (
      ?auto_1538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1536 ?auto_1537 ) ) ( ON ?auto_1536 ?auto_1538 ) ( not ( = ?auto_1536 ?auto_1538 ) ) ( not ( = ?auto_1537 ?auto_1538 ) ) ( ON ?auto_1537 ?auto_1536 ) ( CLEAR ?auto_1537 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1538 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1538 ?auto_1536 )
      ( MAKE-2PILE ?auto_1536 ?auto_1537 ) )
  )

)

