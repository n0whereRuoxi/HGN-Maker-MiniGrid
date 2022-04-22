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
      ?auto_1408 - BLOCK
      ?auto_1409 - BLOCK
    )
    :vars
    (
      ?auto_1410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1410 ?auto_1409 ) ( CLEAR ?auto_1410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1408 ) ( ON ?auto_1409 ?auto_1408 ) ( not ( = ?auto_1408 ?auto_1409 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1409 ?auto_1410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1410 ?auto_1409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1412 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1412 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1413 - BLOCK
    )
    :vars
    (
      ?auto_1414 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1413 ?auto_1414 ) ( CLEAR ?auto_1413 ) ( HAND-EMPTY ) ( not ( = ?auto_1413 ?auto_1414 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1413 ?auto_1414 )
      ( MAKE-1PILE ?auto_1413 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1416 - BLOCK
    )
    :vars
    (
      ?auto_1417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1417 ?auto_1416 ) ( CLEAR ?auto_1417 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1416 ) ( not ( = ?auto_1416 ?auto_1417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1417 ?auto_1416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1418 - BLOCK
    )
    :vars
    (
      ?auto_1419 - BLOCK
      ?auto_1420 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1419 ?auto_1418 ) ( CLEAR ?auto_1419 ) ( ON-TABLE ?auto_1418 ) ( not ( = ?auto_1418 ?auto_1419 ) ) ( HOLDING ?auto_1420 ) ( not ( = ?auto_1418 ?auto_1420 ) ) ( not ( = ?auto_1419 ?auto_1420 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1420 )
      ( MAKE-1PILE ?auto_1418 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1421 - BLOCK
    )
    :vars
    (
      ?auto_1423 - BLOCK
      ?auto_1422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1423 ?auto_1421 ) ( ON-TABLE ?auto_1421 ) ( not ( = ?auto_1421 ?auto_1423 ) ) ( not ( = ?auto_1421 ?auto_1422 ) ) ( not ( = ?auto_1423 ?auto_1422 ) ) ( ON ?auto_1422 ?auto_1423 ) ( CLEAR ?auto_1422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1421 ?auto_1423 )
      ( MAKE-1PILE ?auto_1421 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1426 - BLOCK
      ?auto_1427 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1427 ) ( CLEAR ?auto_1426 ) ( ON-TABLE ?auto_1426 ) ( not ( = ?auto_1426 ?auto_1427 ) ) )
    :subtasks
    ( ( !STACK ?auto_1427 ?auto_1426 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1428 - BLOCK
      ?auto_1429 - BLOCK
    )
    :vars
    (
      ?auto_1430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1428 ) ( ON-TABLE ?auto_1428 ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( ON ?auto_1429 ?auto_1430 ) ( CLEAR ?auto_1429 ) ( HAND-EMPTY ) ( not ( = ?auto_1428 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1429 ?auto_1430 )
      ( MAKE-2PILE ?auto_1428 ?auto_1429 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1431 - BLOCK
      ?auto_1432 - BLOCK
    )
    :vars
    (
      ?auto_1433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1431 ?auto_1432 ) ) ( ON ?auto_1432 ?auto_1433 ) ( CLEAR ?auto_1432 ) ( not ( = ?auto_1431 ?auto_1433 ) ) ( not ( = ?auto_1432 ?auto_1433 ) ) ( HOLDING ?auto_1431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1431 )
      ( MAKE-2PILE ?auto_1431 ?auto_1432 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1434 - BLOCK
      ?auto_1435 - BLOCK
    )
    :vars
    (
      ?auto_1436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1434 ?auto_1435 ) ) ( ON ?auto_1435 ?auto_1436 ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( not ( = ?auto_1435 ?auto_1436 ) ) ( ON ?auto_1434 ?auto_1435 ) ( CLEAR ?auto_1434 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1436 ?auto_1435 )
      ( MAKE-2PILE ?auto_1434 ?auto_1435 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1453 - BLOCK
    )
    :vars
    (
      ?auto_1454 - BLOCK
      ?auto_1455 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1453 ?auto_1454 ) ( CLEAR ?auto_1453 ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( HOLDING ?auto_1455 ) ( not ( = ?auto_1453 ?auto_1455 ) ) ( not ( = ?auto_1454 ?auto_1455 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1455 )
      ( MAKE-1PILE ?auto_1453 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1456 - BLOCK
    )
    :vars
    (
      ?auto_1458 - BLOCK
      ?auto_1457 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1456 ?auto_1458 ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( not ( = ?auto_1458 ?auto_1457 ) ) ( ON ?auto_1457 ?auto_1456 ) ( CLEAR ?auto_1457 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1458 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1458 ?auto_1456 )
      ( MAKE-1PILE ?auto_1456 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1463 - BLOCK
      ?auto_1464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1463 ) ( ON-TABLE ?auto_1463 ) ( not ( = ?auto_1463 ?auto_1464 ) ) ( ON-TABLE ?auto_1464 ) ( CLEAR ?auto_1464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1464 )
      ( MAKE-2PILE ?auto_1463 ?auto_1464 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1465 - BLOCK
      ?auto_1466 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1465 ?auto_1466 ) ) ( ON-TABLE ?auto_1466 ) ( CLEAR ?auto_1466 ) ( HOLDING ?auto_1465 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1465 )
      ( MAKE-2PILE ?auto_1465 ?auto_1466 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1467 - BLOCK
      ?auto_1468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1467 ?auto_1468 ) ) ( ON-TABLE ?auto_1468 ) ( ON ?auto_1467 ?auto_1468 ) ( CLEAR ?auto_1467 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1468 )
      ( MAKE-2PILE ?auto_1467 ?auto_1468 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1471 - BLOCK
      ?auto_1472 - BLOCK
    )
    :vars
    (
      ?auto_1473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1471 ?auto_1472 ) ) ( ON-TABLE ?auto_1472 ) ( CLEAR ?auto_1472 ) ( ON ?auto_1471 ?auto_1473 ) ( CLEAR ?auto_1471 ) ( HAND-EMPTY ) ( not ( = ?auto_1471 ?auto_1473 ) ) ( not ( = ?auto_1472 ?auto_1473 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1471 ?auto_1473 )
      ( MAKE-2PILE ?auto_1471 ?auto_1472 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1474 - BLOCK
      ?auto_1475 - BLOCK
    )
    :vars
    (
      ?auto_1476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1474 ?auto_1475 ) ) ( ON ?auto_1474 ?auto_1476 ) ( CLEAR ?auto_1474 ) ( not ( = ?auto_1474 ?auto_1476 ) ) ( not ( = ?auto_1475 ?auto_1476 ) ) ( HOLDING ?auto_1475 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1475 )
      ( MAKE-2PILE ?auto_1474 ?auto_1475 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1477 - BLOCK
      ?auto_1478 - BLOCK
    )
    :vars
    (
      ?auto_1479 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1477 ?auto_1478 ) ) ( ON ?auto_1477 ?auto_1479 ) ( not ( = ?auto_1477 ?auto_1479 ) ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( ON ?auto_1478 ?auto_1477 ) ( CLEAR ?auto_1478 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1479 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1479 ?auto_1477 )
      ( MAKE-2PILE ?auto_1477 ?auto_1478 ) )
  )

)

