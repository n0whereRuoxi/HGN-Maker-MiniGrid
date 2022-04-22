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
      ?auto_1334 - BLOCK
      ?auto_1335 - BLOCK
    )
    :vars
    (
      ?auto_1336 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1336 ?auto_1335 ) ( CLEAR ?auto_1336 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1334 ) ( ON ?auto_1335 ?auto_1334 ) ( not ( = ?auto_1334 ?auto_1335 ) ) ( not ( = ?auto_1334 ?auto_1336 ) ) ( not ( = ?auto_1335 ?auto_1336 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1336 ?auto_1335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1338 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1338 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1339 - BLOCK
    )
    :vars
    (
      ?auto_1340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1339 ?auto_1340 ) ( CLEAR ?auto_1339 ) ( HAND-EMPTY ) ( not ( = ?auto_1339 ?auto_1340 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1339 ?auto_1340 )
      ( MAKE-1PILE ?auto_1339 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1342 - BLOCK
    )
    :vars
    (
      ?auto_1343 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1343 ?auto_1342 ) ( CLEAR ?auto_1343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1342 ) ( not ( = ?auto_1342 ?auto_1343 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1343 ?auto_1342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1344 - BLOCK
    )
    :vars
    (
      ?auto_1345 - BLOCK
      ?auto_1346 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1345 ?auto_1344 ) ( CLEAR ?auto_1345 ) ( ON-TABLE ?auto_1344 ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( HOLDING ?auto_1346 ) ( not ( = ?auto_1344 ?auto_1346 ) ) ( not ( = ?auto_1345 ?auto_1346 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1346 )
      ( MAKE-1PILE ?auto_1344 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1347 - BLOCK
    )
    :vars
    (
      ?auto_1348 - BLOCK
      ?auto_1349 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1348 ?auto_1347 ) ( ON-TABLE ?auto_1347 ) ( not ( = ?auto_1347 ?auto_1348 ) ) ( not ( = ?auto_1347 ?auto_1349 ) ) ( not ( = ?auto_1348 ?auto_1349 ) ) ( ON ?auto_1349 ?auto_1348 ) ( CLEAR ?auto_1349 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1347 ?auto_1348 )
      ( MAKE-1PILE ?auto_1347 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1352 - BLOCK
      ?auto_1353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1353 ) ( CLEAR ?auto_1352 ) ( ON-TABLE ?auto_1352 ) ( not ( = ?auto_1352 ?auto_1353 ) ) )
    :subtasks
    ( ( !STACK ?auto_1353 ?auto_1352 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1354 - BLOCK
      ?auto_1355 - BLOCK
    )
    :vars
    (
      ?auto_1356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1354 ) ( ON-TABLE ?auto_1354 ) ( not ( = ?auto_1354 ?auto_1355 ) ) ( ON ?auto_1355 ?auto_1356 ) ( CLEAR ?auto_1355 ) ( HAND-EMPTY ) ( not ( = ?auto_1354 ?auto_1356 ) ) ( not ( = ?auto_1355 ?auto_1356 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1355 ?auto_1356 )
      ( MAKE-2PILE ?auto_1354 ?auto_1355 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1357 - BLOCK
      ?auto_1358 - BLOCK
    )
    :vars
    (
      ?auto_1359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1357 ?auto_1358 ) ) ( ON ?auto_1358 ?auto_1359 ) ( CLEAR ?auto_1358 ) ( not ( = ?auto_1357 ?auto_1359 ) ) ( not ( = ?auto_1358 ?auto_1359 ) ) ( HOLDING ?auto_1357 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1357 )
      ( MAKE-2PILE ?auto_1357 ?auto_1358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1360 - BLOCK
      ?auto_1361 - BLOCK
    )
    :vars
    (
      ?auto_1362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1360 ?auto_1361 ) ) ( ON ?auto_1361 ?auto_1362 ) ( not ( = ?auto_1360 ?auto_1362 ) ) ( not ( = ?auto_1361 ?auto_1362 ) ) ( ON ?auto_1360 ?auto_1361 ) ( CLEAR ?auto_1360 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1362 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1362 ?auto_1361 )
      ( MAKE-2PILE ?auto_1360 ?auto_1361 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1379 - BLOCK
    )
    :vars
    (
      ?auto_1380 - BLOCK
      ?auto_1381 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1379 ?auto_1380 ) ( CLEAR ?auto_1379 ) ( not ( = ?auto_1379 ?auto_1380 ) ) ( HOLDING ?auto_1381 ) ( not ( = ?auto_1379 ?auto_1381 ) ) ( not ( = ?auto_1380 ?auto_1381 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1381 )
      ( MAKE-1PILE ?auto_1379 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1382 - BLOCK
    )
    :vars
    (
      ?auto_1383 - BLOCK
      ?auto_1384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1382 ?auto_1383 ) ( not ( = ?auto_1382 ?auto_1383 ) ) ( not ( = ?auto_1382 ?auto_1384 ) ) ( not ( = ?auto_1383 ?auto_1384 ) ) ( ON ?auto_1384 ?auto_1382 ) ( CLEAR ?auto_1384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1383 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1383 ?auto_1382 )
      ( MAKE-1PILE ?auto_1382 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1389 - BLOCK
      ?auto_1390 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1389 ) ( ON-TABLE ?auto_1389 ) ( not ( = ?auto_1389 ?auto_1390 ) ) ( ON-TABLE ?auto_1390 ) ( CLEAR ?auto_1390 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1390 )
      ( MAKE-2PILE ?auto_1389 ?auto_1390 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1391 - BLOCK
      ?auto_1392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1391 ?auto_1392 ) ) ( ON-TABLE ?auto_1392 ) ( CLEAR ?auto_1392 ) ( HOLDING ?auto_1391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1391 )
      ( MAKE-2PILE ?auto_1391 ?auto_1392 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1393 - BLOCK
      ?auto_1394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1393 ?auto_1394 ) ) ( ON-TABLE ?auto_1394 ) ( ON ?auto_1393 ?auto_1394 ) ( CLEAR ?auto_1393 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1394 )
      ( MAKE-2PILE ?auto_1393 ?auto_1394 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1397 - BLOCK
      ?auto_1398 - BLOCK
    )
    :vars
    (
      ?auto_1399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1397 ?auto_1398 ) ) ( ON-TABLE ?auto_1398 ) ( CLEAR ?auto_1398 ) ( ON ?auto_1397 ?auto_1399 ) ( CLEAR ?auto_1397 ) ( HAND-EMPTY ) ( not ( = ?auto_1397 ?auto_1399 ) ) ( not ( = ?auto_1398 ?auto_1399 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1397 ?auto_1399 )
      ( MAKE-2PILE ?auto_1397 ?auto_1398 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1400 - BLOCK
      ?auto_1401 - BLOCK
    )
    :vars
    (
      ?auto_1402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1400 ?auto_1401 ) ) ( ON ?auto_1400 ?auto_1402 ) ( CLEAR ?auto_1400 ) ( not ( = ?auto_1400 ?auto_1402 ) ) ( not ( = ?auto_1401 ?auto_1402 ) ) ( HOLDING ?auto_1401 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1401 )
      ( MAKE-2PILE ?auto_1400 ?auto_1401 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1403 - BLOCK
      ?auto_1404 - BLOCK
    )
    :vars
    (
      ?auto_1405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1403 ?auto_1404 ) ) ( ON ?auto_1403 ?auto_1405 ) ( not ( = ?auto_1403 ?auto_1405 ) ) ( not ( = ?auto_1404 ?auto_1405 ) ) ( ON ?auto_1404 ?auto_1403 ) ( CLEAR ?auto_1404 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1405 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1405 ?auto_1403 )
      ( MAKE-2PILE ?auto_1403 ?auto_1404 ) )
  )

)

