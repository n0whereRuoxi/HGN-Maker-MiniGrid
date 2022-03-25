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
      ?auto_1379 - BLOCK
      ?auto_1380 - BLOCK
    )
    :vars
    (
      ?auto_1381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1381 ?auto_1380 ) ( CLEAR ?auto_1381 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1379 ) ( ON ?auto_1380 ?auto_1379 ) ( not ( = ?auto_1379 ?auto_1380 ) ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( not ( = ?auto_1380 ?auto_1381 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1381 ?auto_1380 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1383 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1383 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1383 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1384 - BLOCK
    )
    :vars
    (
      ?auto_1385 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1384 ?auto_1385 ) ( CLEAR ?auto_1384 ) ( HAND-EMPTY ) ( not ( = ?auto_1384 ?auto_1385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1384 ?auto_1385 )
      ( MAKE-1PILE ?auto_1384 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1387 - BLOCK
    )
    :vars
    (
      ?auto_1388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1388 ?auto_1387 ) ( CLEAR ?auto_1388 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1387 ) ( not ( = ?auto_1387 ?auto_1388 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1388 ?auto_1387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1389 - BLOCK
    )
    :vars
    (
      ?auto_1390 - BLOCK
      ?auto_1391 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1390 ?auto_1389 ) ( CLEAR ?auto_1390 ) ( ON-TABLE ?auto_1389 ) ( not ( = ?auto_1389 ?auto_1390 ) ) ( HOLDING ?auto_1391 ) ( not ( = ?auto_1389 ?auto_1391 ) ) ( not ( = ?auto_1390 ?auto_1391 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1391 )
      ( MAKE-1PILE ?auto_1389 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1392 - BLOCK
    )
    :vars
    (
      ?auto_1394 - BLOCK
      ?auto_1393 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1394 ?auto_1392 ) ( ON-TABLE ?auto_1392 ) ( not ( = ?auto_1392 ?auto_1394 ) ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( not ( = ?auto_1394 ?auto_1393 ) ) ( ON ?auto_1393 ?auto_1394 ) ( CLEAR ?auto_1393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1392 ?auto_1394 )
      ( MAKE-1PILE ?auto_1392 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1397 - BLOCK
      ?auto_1398 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1398 ) ( CLEAR ?auto_1397 ) ( ON-TABLE ?auto_1397 ) ( not ( = ?auto_1397 ?auto_1398 ) ) )
    :subtasks
    ( ( !STACK ?auto_1398 ?auto_1397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1399 - BLOCK
      ?auto_1400 - BLOCK
    )
    :vars
    (
      ?auto_1401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1399 ) ( ON-TABLE ?auto_1399 ) ( not ( = ?auto_1399 ?auto_1400 ) ) ( ON ?auto_1400 ?auto_1401 ) ( CLEAR ?auto_1400 ) ( HAND-EMPTY ) ( not ( = ?auto_1399 ?auto_1401 ) ) ( not ( = ?auto_1400 ?auto_1401 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1400 ?auto_1401 )
      ( MAKE-2PILE ?auto_1399 ?auto_1400 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1402 - BLOCK
      ?auto_1403 - BLOCK
    )
    :vars
    (
      ?auto_1404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1402 ?auto_1403 ) ) ( ON ?auto_1403 ?auto_1404 ) ( CLEAR ?auto_1403 ) ( not ( = ?auto_1402 ?auto_1404 ) ) ( not ( = ?auto_1403 ?auto_1404 ) ) ( HOLDING ?auto_1402 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1402 )
      ( MAKE-2PILE ?auto_1402 ?auto_1403 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1405 - BLOCK
      ?auto_1406 - BLOCK
    )
    :vars
    (
      ?auto_1407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1405 ?auto_1406 ) ) ( ON ?auto_1406 ?auto_1407 ) ( not ( = ?auto_1405 ?auto_1407 ) ) ( not ( = ?auto_1406 ?auto_1407 ) ) ( ON ?auto_1405 ?auto_1406 ) ( CLEAR ?auto_1405 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1407 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1407 ?auto_1406 )
      ( MAKE-2PILE ?auto_1405 ?auto_1406 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1409 - BLOCK
    )
    :vars
    (
      ?auto_1410 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1410 ?auto_1409 ) ( CLEAR ?auto_1410 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1409 ) ( not ( = ?auto_1409 ?auto_1410 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1410 ?auto_1409 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1416 - BLOCK
    )
    :vars
    (
      ?auto_1417 - BLOCK
      ?auto_1418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1416 ?auto_1417 ) ) ( ON ?auto_1417 ?auto_1418 ) ( CLEAR ?auto_1417 ) ( not ( = ?auto_1416 ?auto_1418 ) ) ( not ( = ?auto_1417 ?auto_1418 ) ) ( HOLDING ?auto_1416 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1416 ?auto_1417 )
      ( MAKE-1PILE ?auto_1416 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1419 - BLOCK
    )
    :vars
    (
      ?auto_1420 - BLOCK
      ?auto_1421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1419 ?auto_1420 ) ) ( ON ?auto_1420 ?auto_1421 ) ( not ( = ?auto_1419 ?auto_1421 ) ) ( not ( = ?auto_1420 ?auto_1421 ) ) ( ON ?auto_1419 ?auto_1420 ) ( CLEAR ?auto_1419 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1421 ?auto_1420 )
      ( MAKE-1PILE ?auto_1419 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1423 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1423 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1424 - BLOCK
    )
    :vars
    (
      ?auto_1425 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1424 ?auto_1425 ) ( CLEAR ?auto_1424 ) ( HAND-EMPTY ) ( not ( = ?auto_1424 ?auto_1425 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1424 ?auto_1425 )
      ( MAKE-1PILE ?auto_1424 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1426 - BLOCK
    )
    :vars
    (
      ?auto_1427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1426 ?auto_1427 ) ) ( HOLDING ?auto_1426 ) ( CLEAR ?auto_1427 ) ( ON-TABLE ?auto_1427 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1427 ?auto_1426 )
      ( MAKE-1PILE ?auto_1426 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1428 - BLOCK
    )
    :vars
    (
      ?auto_1429 - BLOCK
      ?auto_1430 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1428 ?auto_1429 ) ) ( CLEAR ?auto_1429 ) ( ON-TABLE ?auto_1429 ) ( ON ?auto_1428 ?auto_1430 ) ( CLEAR ?auto_1428 ) ( HAND-EMPTY ) ( not ( = ?auto_1428 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1430 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1428 ?auto_1430 )
      ( MAKE-1PILE ?auto_1428 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1431 - BLOCK
    )
    :vars
    (
      ?auto_1433 - BLOCK
      ?auto_1432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1431 ?auto_1433 ) ) ( ON ?auto_1431 ?auto_1432 ) ( CLEAR ?auto_1431 ) ( not ( = ?auto_1431 ?auto_1432 ) ) ( not ( = ?auto_1433 ?auto_1432 ) ) ( HOLDING ?auto_1433 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1433 )
      ( MAKE-1PILE ?auto_1431 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1434 - BLOCK
    )
    :vars
    (
      ?auto_1435 - BLOCK
      ?auto_1436 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1434 ?auto_1435 ) ) ( ON ?auto_1434 ?auto_1436 ) ( not ( = ?auto_1434 ?auto_1436 ) ) ( not ( = ?auto_1435 ?auto_1436 ) ) ( ON ?auto_1435 ?auto_1434 ) ( CLEAR ?auto_1435 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1436 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1436 ?auto_1434 )
      ( MAKE-1PILE ?auto_1434 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1439 - BLOCK
      ?auto_1440 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1440 ) ( CLEAR ?auto_1439 ) ( ON-TABLE ?auto_1439 ) ( not ( = ?auto_1439 ?auto_1440 ) ) )
    :subtasks
    ( ( !STACK ?auto_1440 ?auto_1439 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1441 - BLOCK
      ?auto_1442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1441 ) ( ON-TABLE ?auto_1441 ) ( not ( = ?auto_1441 ?auto_1442 ) ) ( ON-TABLE ?auto_1442 ) ( CLEAR ?auto_1442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1442 )
      ( MAKE-2PILE ?auto_1441 ?auto_1442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1443 - BLOCK
      ?auto_1444 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1443 ?auto_1444 ) ) ( ON-TABLE ?auto_1444 ) ( CLEAR ?auto_1444 ) ( HOLDING ?auto_1443 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1443 )
      ( MAKE-2PILE ?auto_1443 ?auto_1444 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1445 - BLOCK
      ?auto_1446 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1445 ?auto_1446 ) ) ( ON-TABLE ?auto_1446 ) ( ON ?auto_1445 ?auto_1446 ) ( CLEAR ?auto_1445 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1446 )
      ( MAKE-2PILE ?auto_1445 ?auto_1446 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1447 - BLOCK
      ?auto_1448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1447 ?auto_1448 ) ) ( ON-TABLE ?auto_1448 ) ( HOLDING ?auto_1447 ) ( CLEAR ?auto_1448 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1448 ?auto_1447 )
      ( MAKE-2PILE ?auto_1447 ?auto_1448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1449 - BLOCK
      ?auto_1450 - BLOCK
    )
    :vars
    (
      ?auto_1451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1449 ?auto_1450 ) ) ( ON-TABLE ?auto_1450 ) ( CLEAR ?auto_1450 ) ( ON ?auto_1449 ?auto_1451 ) ( CLEAR ?auto_1449 ) ( HAND-EMPTY ) ( not ( = ?auto_1449 ?auto_1451 ) ) ( not ( = ?auto_1450 ?auto_1451 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1449 ?auto_1451 )
      ( MAKE-2PILE ?auto_1449 ?auto_1450 ) )
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
    ( and ( not ( = ?auto_1452 ?auto_1453 ) ) ( ON ?auto_1452 ?auto_1454 ) ( CLEAR ?auto_1452 ) ( not ( = ?auto_1452 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( HOLDING ?auto_1453 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1453 )
      ( MAKE-2PILE ?auto_1452 ?auto_1453 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1455 - BLOCK
      ?auto_1456 - BLOCK
    )
    :vars
    (
      ?auto_1457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1455 ?auto_1456 ) ) ( ON ?auto_1455 ?auto_1457 ) ( not ( = ?auto_1455 ?auto_1457 ) ) ( not ( = ?auto_1456 ?auto_1457 ) ) ( ON ?auto_1456 ?auto_1455 ) ( CLEAR ?auto_1456 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1457 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1457 ?auto_1455 )
      ( MAKE-2PILE ?auto_1455 ?auto_1456 ) )
  )

)

