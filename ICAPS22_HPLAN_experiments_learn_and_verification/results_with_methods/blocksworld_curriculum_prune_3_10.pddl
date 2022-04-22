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
      ?auto_1301 - BLOCK
    )
    :vars
    (
      ?auto_1302 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1301 ?auto_1302 ) ( CLEAR ?auto_1301 ) ( HAND-EMPTY ) ( not ( = ?auto_1301 ?auto_1302 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1301 ?auto_1302 )
      ( !PUTDOWN ?auto_1301 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1308 - BLOCK
      ?auto_1309 - BLOCK
    )
    :vars
    (
      ?auto_1310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1308 ) ( ON ?auto_1309 ?auto_1310 ) ( CLEAR ?auto_1309 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1308 ) ( not ( = ?auto_1308 ?auto_1309 ) ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( not ( = ?auto_1309 ?auto_1310 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1309 ?auto_1310 )
      ( !STACK ?auto_1309 ?auto_1308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1318 - BLOCK
      ?auto_1319 - BLOCK
    )
    :vars
    (
      ?auto_1320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1319 ?auto_1320 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1320 ) ) ( ON ?auto_1318 ?auto_1319 ) ( CLEAR ?auto_1318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1318 )
      ( MAKE-2PILE ?auto_1318 ?auto_1319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1329 - BLOCK
      ?auto_1330 - BLOCK
      ?auto_1331 - BLOCK
    )
    :vars
    (
      ?auto_1332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1330 ) ( ON ?auto_1331 ?auto_1332 ) ( CLEAR ?auto_1331 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1329 ) ( ON ?auto_1330 ?auto_1329 ) ( not ( = ?auto_1329 ?auto_1330 ) ) ( not ( = ?auto_1329 ?auto_1331 ) ) ( not ( = ?auto_1329 ?auto_1332 ) ) ( not ( = ?auto_1330 ?auto_1331 ) ) ( not ( = ?auto_1330 ?auto_1332 ) ) ( not ( = ?auto_1331 ?auto_1332 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1331 ?auto_1332 )
      ( !STACK ?auto_1331 ?auto_1330 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1336 - BLOCK
      ?auto_1337 - BLOCK
      ?auto_1338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1337 ) ( ON-TABLE ?auto_1338 ) ( CLEAR ?auto_1338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1336 ) ( ON ?auto_1337 ?auto_1336 ) ( not ( = ?auto_1336 ?auto_1337 ) ) ( not ( = ?auto_1336 ?auto_1338 ) ) ( not ( = ?auto_1337 ?auto_1338 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_1338 )
      ( !STACK ?auto_1338 ?auto_1337 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1342 - BLOCK
      ?auto_1343 - BLOCK
      ?auto_1344 - BLOCK
    )
    :vars
    (
      ?auto_1345 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1344 ?auto_1345 ) ( ON-TABLE ?auto_1342 ) ( not ( = ?auto_1342 ?auto_1343 ) ) ( not ( = ?auto_1342 ?auto_1344 ) ) ( not ( = ?auto_1342 ?auto_1345 ) ) ( not ( = ?auto_1343 ?auto_1344 ) ) ( not ( = ?auto_1343 ?auto_1345 ) ) ( not ( = ?auto_1344 ?auto_1345 ) ) ( CLEAR ?auto_1342 ) ( ON ?auto_1343 ?auto_1344 ) ( CLEAR ?auto_1343 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1342 ?auto_1343 )
      ( MAKE-3PILE ?auto_1342 ?auto_1343 ?auto_1344 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1349 - BLOCK
      ?auto_1350 - BLOCK
      ?auto_1351 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1351 ) ( ON-TABLE ?auto_1349 ) ( not ( = ?auto_1349 ?auto_1350 ) ) ( not ( = ?auto_1349 ?auto_1351 ) ) ( not ( = ?auto_1350 ?auto_1351 ) ) ( CLEAR ?auto_1349 ) ( ON ?auto_1350 ?auto_1351 ) ( CLEAR ?auto_1350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1349 ?auto_1350 )
      ( MAKE-3PILE ?auto_1349 ?auto_1350 ?auto_1351 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1355 - BLOCK
      ?auto_1356 - BLOCK
      ?auto_1357 - BLOCK
    )
    :vars
    (
      ?auto_1358 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1357 ?auto_1358 ) ( not ( = ?auto_1355 ?auto_1356 ) ) ( not ( = ?auto_1355 ?auto_1357 ) ) ( not ( = ?auto_1355 ?auto_1358 ) ) ( not ( = ?auto_1356 ?auto_1357 ) ) ( not ( = ?auto_1356 ?auto_1358 ) ) ( not ( = ?auto_1357 ?auto_1358 ) ) ( ON ?auto_1356 ?auto_1357 ) ( ON ?auto_1355 ?auto_1356 ) ( CLEAR ?auto_1355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1355 )
      ( MAKE-3PILE ?auto_1355 ?auto_1356 ?auto_1357 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1362 - BLOCK
      ?auto_1363 - BLOCK
      ?auto_1364 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_1364 ) ( not ( = ?auto_1362 ?auto_1363 ) ) ( not ( = ?auto_1362 ?auto_1364 ) ) ( not ( = ?auto_1363 ?auto_1364 ) ) ( ON ?auto_1363 ?auto_1364 ) ( ON ?auto_1362 ?auto_1363 ) ( CLEAR ?auto_1362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1362 )
      ( MAKE-3PILE ?auto_1362 ?auto_1363 ?auto_1364 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_1368 - BLOCK
      ?auto_1369 - BLOCK
      ?auto_1370 - BLOCK
    )
    :vars
    (
      ?auto_1371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1368 ?auto_1369 ) ) ( not ( = ?auto_1368 ?auto_1370 ) ) ( not ( = ?auto_1369 ?auto_1370 ) ) ( ON ?auto_1368 ?auto_1371 ) ( not ( = ?auto_1370 ?auto_1371 ) ) ( not ( = ?auto_1369 ?auto_1371 ) ) ( not ( = ?auto_1368 ?auto_1371 ) ) ( ON ?auto_1369 ?auto_1368 ) ( ON ?auto_1370 ?auto_1369 ) ( CLEAR ?auto_1370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_1370 ?auto_1369 ?auto_1368 )
      ( MAKE-3PILE ?auto_1368 ?auto_1369 ?auto_1370 ) )
  )

)

