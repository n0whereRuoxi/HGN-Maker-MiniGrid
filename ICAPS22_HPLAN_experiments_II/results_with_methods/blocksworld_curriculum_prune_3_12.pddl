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
      ?auto_1445 - BLOCK
    )
    :vars
    (
      ?auto_1446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1445 ?auto_1446 ) ( CLEAR ?auto_1445 ) ( HAND-EMPTY ) ( not ( = ?auto_1445 ?auto_1446 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1445 ?auto_1446 )
      ( !PUTDOWN ?auto_1445 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1452 - BLOCK
      ?auto_1453 - BLOCK
    )
    :vars
    (
      ?auto_1454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1452 ) ( ON ?auto_1453 ?auto_1454 ) ( CLEAR ?auto_1453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1452 ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1453 ?auto_1454 )
      ( !STACK ?auto_1453 ?auto_1452 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1462 - BLOCK
      ?auto_1463 - BLOCK
    )
    :vars
    (
      ?auto_1464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1463 ?auto_1464 ) ( not ( = ?auto_1462 ?auto_1463 ) ) ( not ( = ?auto_1462 ?auto_1464 ) ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( ON ?auto_1462 ?auto_1463 ) ( CLEAR ?auto_1462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1462 )
      ( MAKE-2PILE ?auto_1462 ?auto_1463 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1473 - BLOCK
      ?auto_1474 - BLOCK
      ?auto_1475 - BLOCK
    )
    :vars
    (
      ?auto_1476 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1474 ) ( ON ?auto_1475 ?auto_1476 ) ( CLEAR ?auto_1475 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1473 ) ( ON ?auto_1474 ?auto_1473 ) ( not ( = ?auto_1473 ?auto_1474 ) ) ( not ( = ?auto_1473 ?auto_1475 ) ) ( not ( = ?auto_1473 ?auto_1476 ) ) ( not ( = ?auto_1474 ?auto_1475 ) ) ( not ( = ?auto_1474 ?auto_1476 ) ) ( not ( = ?auto_1475 ?auto_1476 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1475 ?auto_1476 )
      ( !STACK ?auto_1475 ?auto_1474 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1480 - BLOCK
      ?auto_1481 - BLOCK
      ?auto_1482 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1481 ) ( ON-TABLE ?auto_1482 ) ( CLEAR ?auto_1482 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1480 ) ( ON ?auto_1481 ?auto_1480 ) ( not ( = ?auto_1480 ?auto_1481 ) ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( not ( = ?auto_1481 ?auto_1482 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1482 )
      ( !STACK ?auto_1482 ?auto_1481 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1486 - BLOCK
      ?auto_1487 - BLOCK
      ?auto_1488 - BLOCK
    )
    :vars
    (
      ?auto_1489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1488 ?auto_1489 ) ( ON-TABLE ?auto_1486 ) ( not ( = ?auto_1486 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1488 ) ) ( not ( = ?auto_1486 ?auto_1489 ) ) ( not ( = ?auto_1487 ?auto_1488 ) ) ( not ( = ?auto_1487 ?auto_1489 ) ) ( not ( = ?auto_1488 ?auto_1489 ) ) ( CLEAR ?auto_1486 ) ( ON ?auto_1487 ?auto_1488 ) ( CLEAR ?auto_1487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1486 ?auto_1487 )
      ( MAKE-3PILE ?auto_1486 ?auto_1487 ?auto_1488 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1493 - BLOCK
      ?auto_1494 - BLOCK
      ?auto_1495 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1495 ) ( ON-TABLE ?auto_1493 ) ( not ( = ?auto_1493 ?auto_1494 ) ) ( not ( = ?auto_1493 ?auto_1495 ) ) ( not ( = ?auto_1494 ?auto_1495 ) ) ( CLEAR ?auto_1493 ) ( ON ?auto_1494 ?auto_1495 ) ( CLEAR ?auto_1494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1493 ?auto_1494 )
      ( MAKE-3PILE ?auto_1493 ?auto_1494 ?auto_1495 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1499 - BLOCK
      ?auto_1500 - BLOCK
      ?auto_1501 - BLOCK
    )
    :vars
    (
      ?auto_1502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1501 ?auto_1502 ) ( not ( = ?auto_1499 ?auto_1500 ) ) ( not ( = ?auto_1499 ?auto_1501 ) ) ( not ( = ?auto_1499 ?auto_1502 ) ) ( not ( = ?auto_1500 ?auto_1501 ) ) ( not ( = ?auto_1500 ?auto_1502 ) ) ( not ( = ?auto_1501 ?auto_1502 ) ) ( ON ?auto_1500 ?auto_1501 ) ( ON ?auto_1499 ?auto_1500 ) ( CLEAR ?auto_1499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1499 )
      ( MAKE-3PILE ?auto_1499 ?auto_1500 ?auto_1501 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1506 - BLOCK
      ?auto_1507 - BLOCK
      ?auto_1508 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1508 ) ( not ( = ?auto_1506 ?auto_1507 ) ) ( not ( = ?auto_1506 ?auto_1508 ) ) ( not ( = ?auto_1507 ?auto_1508 ) ) ( ON ?auto_1507 ?auto_1508 ) ( ON ?auto_1506 ?auto_1507 ) ( CLEAR ?auto_1506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1506 )
      ( MAKE-3PILE ?auto_1506 ?auto_1507 ?auto_1508 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1512 - BLOCK
      ?auto_1513 - BLOCK
      ?auto_1514 - BLOCK
    )
    :vars
    (
      ?auto_1515 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1512 ?auto_1513 ) ) ( not ( = ?auto_1512 ?auto_1514 ) ) ( not ( = ?auto_1513 ?auto_1514 ) ) ( ON ?auto_1512 ?auto_1515 ) ( not ( = ?auto_1514 ?auto_1515 ) ) ( not ( = ?auto_1513 ?auto_1515 ) ) ( not ( = ?auto_1512 ?auto_1515 ) ) ( ON ?auto_1513 ?auto_1512 ) ( ON ?auto_1514 ?auto_1513 ) ( CLEAR ?auto_1514 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1514 ?auto_1513 ?auto_1512 )
      ( MAKE-3PILE ?auto_1512 ?auto_1513 ?auto_1514 ) )
  )

)

