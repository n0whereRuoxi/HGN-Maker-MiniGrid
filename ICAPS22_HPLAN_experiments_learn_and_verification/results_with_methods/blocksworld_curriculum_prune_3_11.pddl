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
      ?auto_1373 - BLOCK
    )
    :vars
    (
      ?auto_1374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1373 ?auto_1374 ) ( CLEAR ?auto_1373 ) ( HAND-EMPTY ) ( not ( = ?auto_1373 ?auto_1374 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1373 ?auto_1374 )
      ( !PUTDOWN ?auto_1373 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1380 - BLOCK
      ?auto_1381 - BLOCK
    )
    :vars
    (
      ?auto_1382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1380 ) ( ON ?auto_1381 ?auto_1382 ) ( CLEAR ?auto_1381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1380 ) ( not ( = ?auto_1380 ?auto_1381 ) ) ( not ( = ?auto_1380 ?auto_1382 ) ) ( not ( = ?auto_1381 ?auto_1382 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1381 ?auto_1382 )
      ( !STACK ?auto_1381 ?auto_1380 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1390 - BLOCK
      ?auto_1391 - BLOCK
    )
    :vars
    (
      ?auto_1392 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1391 ?auto_1392 ) ( not ( = ?auto_1390 ?auto_1391 ) ) ( not ( = ?auto_1390 ?auto_1392 ) ) ( not ( = ?auto_1391 ?auto_1392 ) ) ( ON ?auto_1390 ?auto_1391 ) ( CLEAR ?auto_1390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1390 )
      ( MAKE-2PILE ?auto_1390 ?auto_1391 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1401 - BLOCK
      ?auto_1402 - BLOCK
      ?auto_1403 - BLOCK
    )
    :vars
    (
      ?auto_1404 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1402 ) ( ON ?auto_1403 ?auto_1404 ) ( CLEAR ?auto_1403 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1401 ) ( ON ?auto_1402 ?auto_1401 ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1403 ) ) ( not ( = ?auto_1401 ?auto_1404 ) ) ( not ( = ?auto_1402 ?auto_1403 ) ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1404 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1403 ?auto_1404 )
      ( !STACK ?auto_1403 ?auto_1402 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1408 - BLOCK
      ?auto_1409 - BLOCK
      ?auto_1410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1409 ) ( ON-TABLE ?auto_1410 ) ( CLEAR ?auto_1410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1408 ) ( ON ?auto_1409 ?auto_1408 ) ( not ( = ?auto_1408 ?auto_1409 ) ) ( not ( = ?auto_1408 ?auto_1410 ) ) ( not ( = ?auto_1409 ?auto_1410 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1410 )
      ( !STACK ?auto_1410 ?auto_1409 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1414 - BLOCK
      ?auto_1415 - BLOCK
      ?auto_1416 - BLOCK
    )
    :vars
    (
      ?auto_1417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1416 ?auto_1417 ) ( ON-TABLE ?auto_1414 ) ( not ( = ?auto_1414 ?auto_1415 ) ) ( not ( = ?auto_1414 ?auto_1416 ) ) ( not ( = ?auto_1414 ?auto_1417 ) ) ( not ( = ?auto_1415 ?auto_1416 ) ) ( not ( = ?auto_1415 ?auto_1417 ) ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( CLEAR ?auto_1414 ) ( ON ?auto_1415 ?auto_1416 ) ( CLEAR ?auto_1415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1414 ?auto_1415 )
      ( MAKE-3PILE ?auto_1414 ?auto_1415 ?auto_1416 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1421 - BLOCK
      ?auto_1422 - BLOCK
      ?auto_1423 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1423 ) ( ON-TABLE ?auto_1421 ) ( not ( = ?auto_1421 ?auto_1422 ) ) ( not ( = ?auto_1421 ?auto_1423 ) ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( CLEAR ?auto_1421 ) ( ON ?auto_1422 ?auto_1423 ) ( CLEAR ?auto_1422 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1421 ?auto_1422 )
      ( MAKE-3PILE ?auto_1421 ?auto_1422 ?auto_1423 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1427 - BLOCK
      ?auto_1428 - BLOCK
      ?auto_1429 - BLOCK
    )
    :vars
    (
      ?auto_1430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1429 ?auto_1430 ) ( not ( = ?auto_1427 ?auto_1428 ) ) ( not ( = ?auto_1427 ?auto_1429 ) ) ( not ( = ?auto_1427 ?auto_1430 ) ) ( not ( = ?auto_1428 ?auto_1429 ) ) ( not ( = ?auto_1428 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( ON ?auto_1428 ?auto_1429 ) ( ON ?auto_1427 ?auto_1428 ) ( CLEAR ?auto_1427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1427 )
      ( MAKE-3PILE ?auto_1427 ?auto_1428 ?auto_1429 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1434 - BLOCK
      ?auto_1435 - BLOCK
      ?auto_1436 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1436 ) ( not ( = ?auto_1434 ?auto_1435 ) ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( not ( = ?auto_1435 ?auto_1436 ) ) ( ON ?auto_1435 ?auto_1436 ) ( ON ?auto_1434 ?auto_1435 ) ( CLEAR ?auto_1434 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1434 )
      ( MAKE-3PILE ?auto_1434 ?auto_1435 ?auto_1436 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1440 - BLOCK
      ?auto_1441 - BLOCK
      ?auto_1442 - BLOCK
    )
    :vars
    (
      ?auto_1443 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1440 ?auto_1441 ) ) ( not ( = ?auto_1440 ?auto_1442 ) ) ( not ( = ?auto_1441 ?auto_1442 ) ) ( ON ?auto_1440 ?auto_1443 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( not ( = ?auto_1441 ?auto_1443 ) ) ( not ( = ?auto_1440 ?auto_1443 ) ) ( ON ?auto_1441 ?auto_1440 ) ( ON ?auto_1442 ?auto_1441 ) ( CLEAR ?auto_1442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1442 ?auto_1441 ?auto_1440 )
      ( MAKE-3PILE ?auto_1440 ?auto_1441 ?auto_1442 ) )
  )

)

