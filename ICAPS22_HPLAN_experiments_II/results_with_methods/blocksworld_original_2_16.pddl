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
      ?auto_1298 - BLOCK
      ?auto_1299 - BLOCK
    )
    :vars
    (
      ?auto_1300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1300 ?auto_1299 ) ( CLEAR ?auto_1300 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1298 ) ( ON ?auto_1299 ?auto_1298 ) ( not ( = ?auto_1298 ?auto_1299 ) ) ( not ( = ?auto_1298 ?auto_1300 ) ) ( not ( = ?auto_1299 ?auto_1300 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1300 ?auto_1299 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1302 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1302 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1302 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1303 - BLOCK
    )
    :vars
    (
      ?auto_1304 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1303 ?auto_1304 ) ( CLEAR ?auto_1303 ) ( HAND-EMPTY ) ( not ( = ?auto_1303 ?auto_1304 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1303 ?auto_1304 )
      ( MAKE-1PILE ?auto_1303 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1306 - BLOCK
    )
    :vars
    (
      ?auto_1307 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1307 ?auto_1306 ) ( CLEAR ?auto_1307 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1306 ) ( not ( = ?auto_1306 ?auto_1307 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1307 ?auto_1306 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1308 - BLOCK
    )
    :vars
    (
      ?auto_1309 - BLOCK
      ?auto_1310 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1309 ?auto_1308 ) ( CLEAR ?auto_1309 ) ( ON-TABLE ?auto_1308 ) ( not ( = ?auto_1308 ?auto_1309 ) ) ( HOLDING ?auto_1310 ) ( not ( = ?auto_1308 ?auto_1310 ) ) ( not ( = ?auto_1309 ?auto_1310 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1310 )
      ( MAKE-1PILE ?auto_1308 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1311 - BLOCK
    )
    :vars
    (
      ?auto_1312 - BLOCK
      ?auto_1313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1312 ?auto_1311 ) ( ON-TABLE ?auto_1311 ) ( not ( = ?auto_1311 ?auto_1312 ) ) ( not ( = ?auto_1311 ?auto_1313 ) ) ( not ( = ?auto_1312 ?auto_1313 ) ) ( ON ?auto_1313 ?auto_1312 ) ( CLEAR ?auto_1313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1311 ?auto_1312 )
      ( MAKE-1PILE ?auto_1311 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1316 - BLOCK
      ?auto_1317 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1317 ) ( CLEAR ?auto_1316 ) ( ON-TABLE ?auto_1316 ) ( not ( = ?auto_1316 ?auto_1317 ) ) )
    :subtasks
    ( ( !STACK ?auto_1317 ?auto_1316 ) )
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
    ( and ( CLEAR ?auto_1318 ) ( ON-TABLE ?auto_1318 ) ( not ( = ?auto_1318 ?auto_1319 ) ) ( ON ?auto_1319 ?auto_1320 ) ( CLEAR ?auto_1319 ) ( HAND-EMPTY ) ( not ( = ?auto_1318 ?auto_1320 ) ) ( not ( = ?auto_1319 ?auto_1320 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1319 ?auto_1320 )
      ( MAKE-2PILE ?auto_1318 ?auto_1319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1321 - BLOCK
      ?auto_1322 - BLOCK
    )
    :vars
    (
      ?auto_1323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1321 ?auto_1322 ) ) ( ON ?auto_1322 ?auto_1323 ) ( CLEAR ?auto_1322 ) ( not ( = ?auto_1321 ?auto_1323 ) ) ( not ( = ?auto_1322 ?auto_1323 ) ) ( HOLDING ?auto_1321 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1321 )
      ( MAKE-2PILE ?auto_1321 ?auto_1322 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1324 - BLOCK
      ?auto_1325 - BLOCK
    )
    :vars
    (
      ?auto_1326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1324 ?auto_1325 ) ) ( ON ?auto_1325 ?auto_1326 ) ( not ( = ?auto_1324 ?auto_1326 ) ) ( not ( = ?auto_1325 ?auto_1326 ) ) ( ON ?auto_1324 ?auto_1325 ) ( CLEAR ?auto_1324 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1326 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1326 ?auto_1325 )
      ( MAKE-2PILE ?auto_1324 ?auto_1325 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1328 - BLOCK
    )
    :vars
    (
      ?auto_1329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1329 ?auto_1328 ) ( CLEAR ?auto_1329 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1328 ) ( not ( = ?auto_1328 ?auto_1329 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1329 ?auto_1328 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1335 - BLOCK
    )
    :vars
    (
      ?auto_1336 - BLOCK
      ?auto_1337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1335 ?auto_1336 ) ) ( ON ?auto_1336 ?auto_1337 ) ( CLEAR ?auto_1336 ) ( not ( = ?auto_1335 ?auto_1337 ) ) ( not ( = ?auto_1336 ?auto_1337 ) ) ( HOLDING ?auto_1335 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1335 ?auto_1336 )
      ( MAKE-1PILE ?auto_1335 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1338 - BLOCK
    )
    :vars
    (
      ?auto_1340 - BLOCK
      ?auto_1339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1338 ?auto_1340 ) ) ( ON ?auto_1340 ?auto_1339 ) ( not ( = ?auto_1338 ?auto_1339 ) ) ( not ( = ?auto_1340 ?auto_1339 ) ) ( ON ?auto_1338 ?auto_1340 ) ( CLEAR ?auto_1338 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1339 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1339 ?auto_1340 )
      ( MAKE-1PILE ?auto_1338 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1342 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1342 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1342 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1343 - BLOCK
    )
    :vars
    (
      ?auto_1344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1343 ?auto_1344 ) ( CLEAR ?auto_1343 ) ( HAND-EMPTY ) ( not ( = ?auto_1343 ?auto_1344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1343 ?auto_1344 )
      ( MAKE-1PILE ?auto_1343 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1345 - BLOCK
    )
    :vars
    (
      ?auto_1346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1345 ?auto_1346 ) ) ( HOLDING ?auto_1345 ) ( CLEAR ?auto_1346 ) ( ON-TABLE ?auto_1346 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1346 ?auto_1345 )
      ( MAKE-1PILE ?auto_1345 ) )
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
    ( and ( not ( = ?auto_1347 ?auto_1348 ) ) ( CLEAR ?auto_1348 ) ( ON-TABLE ?auto_1348 ) ( ON ?auto_1347 ?auto_1349 ) ( CLEAR ?auto_1347 ) ( HAND-EMPTY ) ( not ( = ?auto_1347 ?auto_1349 ) ) ( not ( = ?auto_1348 ?auto_1349 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1347 ?auto_1349 )
      ( MAKE-1PILE ?auto_1347 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1350 - BLOCK
    )
    :vars
    (
      ?auto_1352 - BLOCK
      ?auto_1351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1350 ?auto_1352 ) ) ( ON ?auto_1350 ?auto_1351 ) ( CLEAR ?auto_1350 ) ( not ( = ?auto_1350 ?auto_1351 ) ) ( not ( = ?auto_1352 ?auto_1351 ) ) ( HOLDING ?auto_1352 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1352 )
      ( MAKE-1PILE ?auto_1350 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_1353 - BLOCK
    )
    :vars
    (
      ?auto_1355 - BLOCK
      ?auto_1354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1353 ?auto_1355 ) ) ( ON ?auto_1353 ?auto_1354 ) ( not ( = ?auto_1353 ?auto_1354 ) ) ( not ( = ?auto_1355 ?auto_1354 ) ) ( ON ?auto_1355 ?auto_1353 ) ( CLEAR ?auto_1355 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1354 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1354 ?auto_1353 )
      ( MAKE-1PILE ?auto_1353 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1358 - BLOCK
      ?auto_1359 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1359 ) ( CLEAR ?auto_1358 ) ( ON-TABLE ?auto_1358 ) ( not ( = ?auto_1358 ?auto_1359 ) ) )
    :subtasks
    ( ( !STACK ?auto_1359 ?auto_1358 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1360 - BLOCK
      ?auto_1361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_1360 ) ( ON-TABLE ?auto_1360 ) ( not ( = ?auto_1360 ?auto_1361 ) ) ( ON-TABLE ?auto_1361 ) ( CLEAR ?auto_1361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_1361 )
      ( MAKE-2PILE ?auto_1360 ?auto_1361 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1362 - BLOCK
      ?auto_1363 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1362 ?auto_1363 ) ) ( ON-TABLE ?auto_1363 ) ( CLEAR ?auto_1363 ) ( HOLDING ?auto_1362 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1362 )
      ( MAKE-2PILE ?auto_1362 ?auto_1363 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1364 - BLOCK
      ?auto_1365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1364 ?auto_1365 ) ) ( ON-TABLE ?auto_1365 ) ( ON ?auto_1364 ?auto_1365 ) ( CLEAR ?auto_1364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1365 )
      ( MAKE-2PILE ?auto_1364 ?auto_1365 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1366 - BLOCK
      ?auto_1367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1366 ?auto_1367 ) ) ( ON-TABLE ?auto_1367 ) ( HOLDING ?auto_1366 ) ( CLEAR ?auto_1367 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1367 ?auto_1366 )
      ( MAKE-2PILE ?auto_1366 ?auto_1367 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1368 - BLOCK
      ?auto_1369 - BLOCK
    )
    :vars
    (
      ?auto_1370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1368 ?auto_1369 ) ) ( ON-TABLE ?auto_1369 ) ( CLEAR ?auto_1369 ) ( ON ?auto_1368 ?auto_1370 ) ( CLEAR ?auto_1368 ) ( HAND-EMPTY ) ( not ( = ?auto_1368 ?auto_1370 ) ) ( not ( = ?auto_1369 ?auto_1370 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1368 ?auto_1370 )
      ( MAKE-2PILE ?auto_1368 ?auto_1369 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1371 - BLOCK
      ?auto_1372 - BLOCK
    )
    :vars
    (
      ?auto_1373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1371 ?auto_1372 ) ) ( ON ?auto_1371 ?auto_1373 ) ( CLEAR ?auto_1371 ) ( not ( = ?auto_1371 ?auto_1373 ) ) ( not ( = ?auto_1372 ?auto_1373 ) ) ( HOLDING ?auto_1372 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_1372 )
      ( MAKE-2PILE ?auto_1371 ?auto_1372 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_1374 - BLOCK
      ?auto_1375 - BLOCK
    )
    :vars
    (
      ?auto_1376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_1374 ?auto_1375 ) ) ( ON ?auto_1374 ?auto_1376 ) ( not ( = ?auto_1374 ?auto_1376 ) ) ( not ( = ?auto_1375 ?auto_1376 ) ) ( ON ?auto_1375 ?auto_1374 ) ( CLEAR ?auto_1375 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_1376 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_1376 ?auto_1374 )
      ( MAKE-2PILE ?auto_1374 ?auto_1375 ) )
  )

)

