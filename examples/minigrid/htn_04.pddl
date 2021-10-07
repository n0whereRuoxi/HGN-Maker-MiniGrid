0x7ffda6444840
0x7ffda64448d0
starting state: 0
ending state: 3
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_38 - ROBOT
      ?auto_39 - ROOM
    )
    :vars
    (
      ?auto_43 - DOOR
      ?auto_40 - ROOM
      ?auto_46 - ROOM
      ?auto_47 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_43 ?auto_40 ) ( DOOR-ON ?auto_43 ?auto_39 ) ( OPEN ?auto_43 ) ( ROBOT-IN ?auto_38 ?auto_46 ) ( DOOR-ON ?auto_47 ?auto_46 ) ( DOOR-ON ?auto_47 ?auto_40 ) ( OPEN ?auto_47 ) )
    :subtasks
    ( ( MOVE-TO ?auto_38 ?auto_40 )
      ( MOVE-TO ?auto_38 ?auto_39 ) )
  )

0x7ffda6444600
0x7ffda6444690
starting state: 4
ending state: 7
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_225 - ROBOT
      ?auto_226 - ROOM
    )
    :vars
    (
      ?auto_228 - DOOR
      ?auto_227 - ROOM
      ?auto_234 - ROOM
      ?auto_233 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_228 ?auto_227 ) ( DOOR-ON ?auto_228 ?auto_226 ) ( OPEN ?auto_228 ) ( ROBOT-IN ?auto_225 ?auto_234 ) ( DOOR-ON ?auto_233 ?auto_234 ) ( DOOR-ON ?auto_233 ?auto_227 ) ( OPEN ?auto_233 ) )
    :subtasks
    ( ( MOVE-TO ?auto_225 ?auto_227 )
      ( MOVE-TO ?auto_225 ?auto_226 ) )
  )

0x7ffda6444720
starting state: 3
ending state: 7
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_235 - ROBOT
      ?auto_236 - ROOM
    )
    :vars
    (
      ?auto_238 - DOOR
      ?auto_237 - ROOM
      ?auto_245 - ROOM
      ?auto_242 - DOOR
      ?auto_247 - ROBOT
      ?auto_246 - ROOM
      ?auto_241 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_238 ?auto_237 ) ( DOOR-ON ?auto_238 ?auto_236 ) ( OPEN ?auto_238 ) ( ROBOT-IN ?auto_235 ?auto_245 ) ( DOOR-ON ?auto_242 ?auto_245 ) ( DOOR-ON ?auto_242 ?auto_237 ) ( ROBOT-IN ?auto_247 ?auto_246 ) ( DOOR-ON ?auto_242 ?auto_246 ) ( LOCKED ?auto_242 ) ( ON-ROBOT ?auto_241 ?auto_247 ) ( KEY ?auto_241 ) )
    :subtasks
    ( ( MOVE-TO ?auto_235 ?auto_237 )
      ( MOVE-TO ?auto_235 ?auto_236 ) )
  )

0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
starting state: 0
ending state: 7
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_267 - ROBOT
      ?auto_268 - ROOM
    )
    :vars
    (
      ?auto_273 - DOOR
      ?auto_272 - ROOM
      ?auto_271 - DOOR
      ?auto_274 - ROOM
      ?auto_277 - ROOM
      ?auto_278 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_273 ?auto_272 ) ( DOOR-ON ?auto_273 ?auto_268 ) ( OPEN ?auto_273 ) ( DOOR-ON ?auto_271 ?auto_274 ) ( DOOR-ON ?auto_271 ?auto_272 ) ( OPEN ?auto_271 ) ( ROBOT-IN ?auto_267 ?auto_277 ) ( DOOR-ON ?auto_278 ?auto_277 ) ( DOOR-ON ?auto_278 ?auto_274 ) ( OPEN ?auto_278 ) )
    :subtasks
    ( ( MOVE-TO ?auto_267 ?auto_274 )
      ( MOVE-TO ?auto_267 ?auto_268 ) )
  )

0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
starting state: 2
ending state: 9
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_423 - ROBOT
      ?auto_424 - ROOM
    )
    :vars
    (
      ?auto_426 - DOOR
      ?auto_428 - ROOM
      ?auto_430 - DOOR
      ?auto_427 - ROOM
      ?auto_431 - ROOM
      ?auto_432 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_426 ?auto_428 ) ( DOOR-ON ?auto_426 ?auto_424 ) ( OPEN ?auto_426 ) ( DOOR-ON ?auto_430 ?auto_427 ) ( DOOR-ON ?auto_430 ?auto_428 ) ( OPEN ?auto_430 ) ( ROBOT-IN ?auto_423 ?auto_431 ) ( DOOR-ON ?auto_432 ?auto_431 ) ( DOOR-ON ?auto_432 ?auto_427 ) ( OPEN ?auto_432 ) )
    :subtasks
    ( ( MOVE-TO ?auto_423 ?auto_427 )
      ( MOVE-TO ?auto_423 ?auto_424 ) )
  )

0x7ffda6444840
starting state: 1
ending state: 9
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_435 - ROBOT
      ?auto_436 - ROOM
    )
    :vars
    (
      ?auto_438 - DOOR
      ?auto_440 - ROOM
      ?auto_442 - DOOR
      ?auto_439 - ROOM
      ?auto_443 - ROOM
      ?auto_446 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_438 ?auto_440 ) ( DOOR-ON ?auto_438 ?auto_436 ) ( OPEN ?auto_438 ) ( DOOR-ON ?auto_442 ?auto_439 ) ( DOOR-ON ?auto_442 ?auto_440 ) ( OPEN ?auto_442 ) ( ROBOT-IN ?auto_435 ?auto_443 ) ( DOOR-ON ?auto_446 ?auto_443 ) ( DOOR-ON ?auto_446 ?auto_439 ) ( OPEN ?auto_446 ) )
    :subtasks
    ( ( MOVE-TO ?auto_435 ?auto_439 )
      ( MOVE-TO ?auto_435 ?auto_436 ) )
  )

0x7ffda64448d0
0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
0x7ffda64443c0
0x7ffda6444450
starting state: 8
ending state: 11
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_559 - ROBOT
      ?auto_560 - ROOM
    )
    :vars
    (
      ?auto_564 - DOOR
      ?auto_563 - ROOM
      ?auto_566 - ROOM
      ?auto_568 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_564 ?auto_563 ) ( DOOR-ON ?auto_564 ?auto_560 ) ( OPEN ?auto_564 ) ( ROBOT-IN ?auto_559 ?auto_566 ) ( DOOR-ON ?auto_568 ?auto_566 ) ( DOOR-ON ?auto_568 ?auto_563 ) ( OPEN ?auto_568 ) )
    :subtasks
    ( ( MOVE-TO ?auto_559 ?auto_563 )
      ( MOVE-TO ?auto_559 ?auto_560 ) )
  )

0x7ffda64444e0
starting state: 7
ending state: 11
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_569 - ROBOT
      ?auto_570 - ROOM
    )
    :vars
    (
      ?auto_574 - DOOR
      ?auto_573 - ROOM
      ?auto_576 - ROOM
      ?auto_578 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_574 ?auto_573 ) ( DOOR-ON ?auto_574 ?auto_570 ) ( OPEN ?auto_574 ) ( ROBOT-IN ?auto_569 ?auto_576 ) ( DOOR-ON ?auto_578 ?auto_576 ) ( DOOR-ON ?auto_578 ?auto_573 ) ( OPEN ?auto_578 ) )
    :subtasks
    ( ( MOVE-TO ?auto_569 ?auto_573 )
      ( MOVE-TO ?auto_569 ?auto_570 ) )
  )

0x7ffda6444570
0x7ffda6444600
0x7ffda6444690
starting state: 4
ending state: 11
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_595 - ROBOT
      ?auto_596 - ROOM
    )
    :vars
    (
      ?auto_600 - DOOR
      ?auto_599 - ROOM
      ?auto_602 - DOOR
      ?auto_597 - ROOM
      ?auto_606 - ROOM
      ?auto_605 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_600 ?auto_599 ) ( DOOR-ON ?auto_600 ?auto_596 ) ( OPEN ?auto_600 ) ( DOOR-ON ?auto_602 ?auto_597 ) ( DOOR-ON ?auto_602 ?auto_599 ) ( OPEN ?auto_602 ) ( ROBOT-IN ?auto_595 ?auto_606 ) ( DOOR-ON ?auto_605 ?auto_606 ) ( DOOR-ON ?auto_605 ?auto_597 ) ( OPEN ?auto_605 ) )
    :subtasks
    ( ( MOVE-TO ?auto_595 ?auto_597 )
      ( MOVE-TO ?auto_595 ?auto_596 ) )
  )

0x7ffda6444720
starting state: 3
ending state: 11
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_607 - ROBOT
      ?auto_608 - ROOM
    )
    :vars
    (
      ?auto_612 - DOOR
      ?auto_611 - ROOM
      ?auto_614 - DOOR
      ?auto_609 - ROOM
      ?auto_619 - ROOM
      ?auto_616 - DOOR
      ?auto_621 - ROBOT
      ?auto_620 - ROOM
      ?auto_615 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_612 ?auto_611 ) ( DOOR-ON ?auto_612 ?auto_608 ) ( OPEN ?auto_612 ) ( DOOR-ON ?auto_614 ?auto_609 ) ( DOOR-ON ?auto_614 ?auto_611 ) ( OPEN ?auto_614 ) ( ROBOT-IN ?auto_607 ?auto_619 ) ( DOOR-ON ?auto_616 ?auto_619 ) ( DOOR-ON ?auto_616 ?auto_609 ) ( ROBOT-IN ?auto_621 ?auto_620 ) ( DOOR-ON ?auto_616 ?auto_620 ) ( LOCKED ?auto_616 ) ( ON-ROBOT ?auto_615 ?auto_621 ) ( KEY ?auto_615 ) )
    :subtasks
    ( ( MOVE-TO ?auto_607 ?auto_609 )
      ( MOVE-TO ?auto_607 ?auto_608 ) )
  )

0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
starting state: 0
ending state: 11
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_645 - ROBOT
      ?auto_646 - ROOM
    )
    :vars
    (
      ?auto_653 - DOOR
      ?auto_649 - ROOM
      ?auto_652 - DOOR
      ?auto_650 - ROOM
      ?auto_654 - DOOR
      ?auto_648 - ROOM
      ?auto_657 - ROOM
      ?auto_658 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_653 ?auto_649 ) ( DOOR-ON ?auto_653 ?auto_646 ) ( OPEN ?auto_653 ) ( DOOR-ON ?auto_652 ?auto_650 ) ( DOOR-ON ?auto_652 ?auto_649 ) ( OPEN ?auto_652 ) ( DOOR-ON ?auto_654 ?auto_648 ) ( DOOR-ON ?auto_654 ?auto_650 ) ( OPEN ?auto_654 ) ( ROBOT-IN ?auto_645 ?auto_657 ) ( DOOR-ON ?auto_658 ?auto_657 ) ( DOOR-ON ?auto_658 ?auto_648 ) ( OPEN ?auto_658 ) )
    :subtasks
    ( ( MOVE-TO ?auto_645 ?auto_648 )
      ( MOVE-TO ?auto_645 ?auto_646 ) )
  )

0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
0x7ffda64442a0
0x7ffda6444330
starting state: 10
ending state: 13
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_799 - ROBOT
      ?auto_800 - ROOM
    )
    :vars
    (
      ?auto_803 - DOOR
      ?auto_802 - ROOM
      ?auto_807 - ROOM
      ?auto_805 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_803 ?auto_802 ) ( DOOR-ON ?auto_803 ?auto_800 ) ( OPEN ?auto_803 ) ( ROBOT-IN ?auto_799 ?auto_807 ) ( DOOR-ON ?auto_805 ?auto_807 ) ( DOOR-ON ?auto_805 ?auto_802 ) ( OPEN ?auto_805 ) )
    :subtasks
    ( ( MOVE-TO ?auto_799 ?auto_802 )
      ( MOVE-TO ?auto_799 ?auto_800 ) )
  )

0x7ffda64443c0
starting state: 9
ending state: 13
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_809 - ROBOT
      ?auto_810 - ROOM
    )
    :vars
    (
      ?auto_813 - DOOR
      ?auto_812 - ROOM
      ?auto_817 - ROOM
      ?auto_818 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_813 ?auto_812 ) ( DOOR-ON ?auto_813 ?auto_810 ) ( OPEN ?auto_813 ) ( ROBOT-IN ?auto_809 ?auto_817 ) ( DOOR-ON ?auto_818 ?auto_817 ) ( DOOR-ON ?auto_818 ?auto_812 ) ( OPEN ?auto_818 ) )
    :subtasks
    ( ( MOVE-TO ?auto_809 ?auto_812 )
      ( MOVE-TO ?auto_809 ?auto_810 ) )
  )

0x7ffda6444450
0x7ffda64444e0
0x7ffda6444570
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
starting state: 2
ending state: 13
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_867 - ROBOT
      ?auto_868 - ROOM
    )
    :vars
    (
      ?auto_874 - DOOR
      ?auto_871 - ROOM
      ?auto_872 - DOOR
      ?auto_870 - ROOM
      ?auto_875 - ROOM
      ?auto_876 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_874 ?auto_871 ) ( DOOR-ON ?auto_874 ?auto_868 ) ( OPEN ?auto_874 ) ( DOOR-ON ?auto_872 ?auto_870 ) ( DOOR-ON ?auto_872 ?auto_871 ) ( OPEN ?auto_872 ) ( ROBOT-IN ?auto_867 ?auto_875 ) ( DOOR-ON ?auto_876 ?auto_875 ) ( DOOR-ON ?auto_876 ?auto_870 ) ( OPEN ?auto_876 ) )
    :subtasks
    ( ( MOVE-TO ?auto_867 ?auto_870 )
      ( MOVE-TO ?auto_867 ?auto_868 ) )
  )

0x7ffda6444840
starting state: 1
ending state: 13
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_879 - ROBOT
      ?auto_880 - ROOM
    )
    :vars
    (
      ?auto_886 - DOOR
      ?auto_883 - ROOM
      ?auto_884 - DOOR
      ?auto_882 - ROOM
      ?auto_887 - ROOM
      ?auto_890 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_886 ?auto_883 ) ( DOOR-ON ?auto_886 ?auto_880 ) ( OPEN ?auto_886 ) ( DOOR-ON ?auto_884 ?auto_882 ) ( DOOR-ON ?auto_884 ?auto_883 ) ( OPEN ?auto_884 ) ( ROBOT-IN ?auto_879 ?auto_887 ) ( DOOR-ON ?auto_890 ?auto_887 ) ( DOOR-ON ?auto_890 ?auto_882 ) ( OPEN ?auto_890 ) )
    :subtasks
    ( ( MOVE-TO ?auto_879 ?auto_882 )
      ( MOVE-TO ?auto_879 ?auto_880 ) )
  )

0x7ffda64448d0
0x7ffda64442a0
0x7ffda6444330
0x7ffda64443c0
0x7ffda6444450
0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
0x7ffda64442a0
0x7ffda6444330
0x7ffda64443c0
0x7ffda6444450
0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
0x7ffda64442a0
0x7ffda6444330
0x7ffda64443c0
0x7ffda6444450
0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
0x7ffda6444060
0x7ffda64440f0
starting state: 14
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1359 - ROBOT
      ?auto_1360 - ROOM
    )
    :vars
    (
      ?auto_1362 - DOOR
      ?auto_1361 - ROOM
      ?auto_1366 - ROOM
      ?auto_1367 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1362 ?auto_1361 ) ( DOOR-ON ?auto_1362 ?auto_1360 ) ( OPEN ?auto_1362 ) ( ROBOT-IN ?auto_1359 ?auto_1366 ) ( DOOR-ON ?auto_1367 ?auto_1366 ) ( DOOR-ON ?auto_1367 ?auto_1361 ) ( OPEN ?auto_1367 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1359 ?auto_1361 )
      ( MOVE-TO ?auto_1359 ?auto_1360 ) )
  )

0x7ffda6444180
starting state: 13
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1369 - ROBOT
      ?auto_1370 - ROOM
    )
    :vars
    (
      ?auto_1372 - DOOR
      ?auto_1371 - ROOM
      ?auto_1381 - ROOM
      ?auto_1375 - DOOR
      ?auto_1378 - ROBOT
      ?auto_1377 - ROOM
      ?auto_1376 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_1372 ?auto_1371 ) ( DOOR-ON ?auto_1372 ?auto_1370 ) ( OPEN ?auto_1372 ) ( ROBOT-IN ?auto_1369 ?auto_1381 ) ( DOOR-ON ?auto_1375 ?auto_1381 ) ( DOOR-ON ?auto_1375 ?auto_1371 ) ( ROBOT-IN ?auto_1378 ?auto_1377 ) ( DOOR-ON ?auto_1375 ?auto_1377 ) ( LOCKED ?auto_1375 ) ( ON-ROBOT ?auto_1376 ?auto_1378 ) ( KEY ?auto_1376 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1369 ?auto_1371 )
      ( MOVE-TO ?auto_1369 ?auto_1370 ) )
  )

0x7ffda6444210
0x7ffda64442a0
0x7ffda6444330
starting state: 10
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1398 - ROBOT
      ?auto_1399 - ROOM
    )
    :vars
    (
      ?auto_1401 - DOOR
      ?auto_1404 - ROOM
      ?auto_1402 - DOOR
      ?auto_1400 - ROOM
      ?auto_1408 - ROOM
      ?auto_1406 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1401 ?auto_1404 ) ( DOOR-ON ?auto_1401 ?auto_1399 ) ( OPEN ?auto_1401 ) ( DOOR-ON ?auto_1402 ?auto_1400 ) ( DOOR-ON ?auto_1402 ?auto_1404 ) ( OPEN ?auto_1402 ) ( ROBOT-IN ?auto_1398 ?auto_1408 ) ( DOOR-ON ?auto_1406 ?auto_1408 ) ( DOOR-ON ?auto_1406 ?auto_1400 ) ( OPEN ?auto_1406 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1398 ?auto_1400 )
      ( MOVE-TO ?auto_1398 ?auto_1399 ) )
  )

0x7ffda64443c0
starting state: 9
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1410 - ROBOT
      ?auto_1411 - ROOM
    )
    :vars
    (
      ?auto_1413 - DOOR
      ?auto_1416 - ROOM
      ?auto_1414 - DOOR
      ?auto_1412 - ROOM
      ?auto_1420 - ROOM
      ?auto_1421 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1413 ?auto_1416 ) ( DOOR-ON ?auto_1413 ?auto_1411 ) ( OPEN ?auto_1413 ) ( DOOR-ON ?auto_1414 ?auto_1412 ) ( DOOR-ON ?auto_1414 ?auto_1416 ) ( OPEN ?auto_1414 ) ( ROBOT-IN ?auto_1410 ?auto_1420 ) ( DOOR-ON ?auto_1421 ?auto_1420 ) ( DOOR-ON ?auto_1421 ?auto_1412 ) ( OPEN ?auto_1421 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1410 ?auto_1412 )
      ( MOVE-TO ?auto_1410 ?auto_1411 ) )
  )

0x7ffda6444450
0x7ffda64444e0
0x7ffda6444570
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
starting state: 2
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1482 - ROBOT
      ?auto_1483 - ROOM
    )
    :vars
    (
      ?auto_1491 - DOOR
      ?auto_1485 - ROOM
      ?auto_1484 - DOOR
      ?auto_1487 - ROOM
      ?auto_1489 - DOOR
      ?auto_1490 - ROOM
      ?auto_1492 - ROOM
      ?auto_1493 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1491 ?auto_1485 ) ( DOOR-ON ?auto_1491 ?auto_1483 ) ( OPEN ?auto_1491 ) ( DOOR-ON ?auto_1484 ?auto_1487 ) ( DOOR-ON ?auto_1484 ?auto_1485 ) ( OPEN ?auto_1484 ) ( DOOR-ON ?auto_1489 ?auto_1490 ) ( DOOR-ON ?auto_1489 ?auto_1487 ) ( OPEN ?auto_1489 ) ( ROBOT-IN ?auto_1482 ?auto_1492 ) ( DOOR-ON ?auto_1493 ?auto_1492 ) ( DOOR-ON ?auto_1493 ?auto_1490 ) ( OPEN ?auto_1493 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1482 ?auto_1490 )
      ( MOVE-TO ?auto_1482 ?auto_1483 ) )
  )

0x7ffda6444840
starting state: 1
ending state: 17
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1496 - ROBOT
      ?auto_1497 - ROOM
    )
    :vars
    (
      ?auto_1505 - DOOR
      ?auto_1499 - ROOM
      ?auto_1498 - DOOR
      ?auto_1501 - ROOM
      ?auto_1503 - DOOR
      ?auto_1504 - ROOM
      ?auto_1506 - ROOM
      ?auto_1509 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1505 ?auto_1499 ) ( DOOR-ON ?auto_1505 ?auto_1497 ) ( OPEN ?auto_1505 ) ( DOOR-ON ?auto_1498 ?auto_1501 ) ( DOOR-ON ?auto_1498 ?auto_1499 ) ( OPEN ?auto_1498 ) ( DOOR-ON ?auto_1503 ?auto_1504 ) ( DOOR-ON ?auto_1503 ?auto_1501 ) ( OPEN ?auto_1503 ) ( ROBOT-IN ?auto_1496 ?auto_1506 ) ( DOOR-ON ?auto_1509 ?auto_1506 ) ( DOOR-ON ?auto_1509 ?auto_1504 ) ( OPEN ?auto_1509 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1496 ?auto_1504 )
      ( MOVE-TO ?auto_1496 ?auto_1497 ) )
  )

0x7ffda64448d0
0x7ffda6444060
0x7ffda64440f0
0x7ffda6444180
0x7ffda6444210
starting state: 12
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1564 - ROBOT
      ?auto_1565 - ROOM
    )
    :vars
    (
      ?auto_1568 - DOOR
      ?auto_1566 - ROOM
      ?auto_1567 - DOOR
      ?auto_1569 - ROOM
      ?auto_1575 - ROOM
      ?auto_1574 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1568 ?auto_1566 ) ( DOOR-ON ?auto_1568 ?auto_1565 ) ( OPEN ?auto_1568 ) ( DOOR-ON ?auto_1567 ?auto_1569 ) ( DOOR-ON ?auto_1567 ?auto_1566 ) ( OPEN ?auto_1567 ) ( ROBOT-IN ?auto_1564 ?auto_1575 ) ( DOOR-ON ?auto_1574 ?auto_1575 ) ( DOOR-ON ?auto_1574 ?auto_1569 ) ( OPEN ?auto_1574 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1564 ?auto_1569 )
      ( MOVE-TO ?auto_1564 ?auto_1565 ) )
  )

0x7ffda64442a0
starting state: 11
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1576 - ROBOT
      ?auto_1577 - ROOM
    )
    :vars
    (
      ?auto_1580 - DOOR
      ?auto_1578 - ROOM
      ?auto_1579 - DOOR
      ?auto_1581 - ROOM
      ?auto_1585 - ROOM
      ?auto_1586 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1580 ?auto_1578 ) ( DOOR-ON ?auto_1580 ?auto_1577 ) ( OPEN ?auto_1580 ) ( DOOR-ON ?auto_1579 ?auto_1581 ) ( DOOR-ON ?auto_1579 ?auto_1578 ) ( OPEN ?auto_1579 ) ( ROBOT-IN ?auto_1576 ?auto_1585 ) ( DOOR-ON ?auto_1586 ?auto_1585 ) ( DOOR-ON ?auto_1586 ?auto_1581 ) ( OPEN ?auto_1586 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1576 ?auto_1581 )
      ( MOVE-TO ?auto_1576 ?auto_1577 ) )
  )

0x7ffda6444330
0x7ffda64443c0
0x7ffda6444450
starting state: 8
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1608 - ROBOT
      ?auto_1609 - ROOM
    )
    :vars
    (
      ?auto_1613 - DOOR
      ?auto_1611 - ROOM
      ?auto_1617 - DOOR
      ?auto_1616 - ROOM
      ?auto_1615 - DOOR
      ?auto_1610 - ROOM
      ?auto_1619 - ROOM
      ?auto_1621 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1613 ?auto_1611 ) ( DOOR-ON ?auto_1613 ?auto_1609 ) ( OPEN ?auto_1613 ) ( DOOR-ON ?auto_1617 ?auto_1616 ) ( DOOR-ON ?auto_1617 ?auto_1611 ) ( OPEN ?auto_1617 ) ( DOOR-ON ?auto_1615 ?auto_1610 ) ( DOOR-ON ?auto_1615 ?auto_1616 ) ( OPEN ?auto_1615 ) ( ROBOT-IN ?auto_1608 ?auto_1619 ) ( DOOR-ON ?auto_1621 ?auto_1619 ) ( DOOR-ON ?auto_1621 ?auto_1610 ) ( OPEN ?auto_1621 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1608 ?auto_1610 )
      ( MOVE-TO ?auto_1608 ?auto_1609 ) )
  )

0x7ffda64444e0
starting state: 7
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1622 - ROBOT
      ?auto_1623 - ROOM
    )
    :vars
    (
      ?auto_1627 - DOOR
      ?auto_1625 - ROOM
      ?auto_1631 - DOOR
      ?auto_1630 - ROOM
      ?auto_1629 - DOOR
      ?auto_1624 - ROOM
      ?auto_1633 - ROOM
      ?auto_1635 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1627 ?auto_1625 ) ( DOOR-ON ?auto_1627 ?auto_1623 ) ( OPEN ?auto_1627 ) ( DOOR-ON ?auto_1631 ?auto_1630 ) ( DOOR-ON ?auto_1631 ?auto_1625 ) ( OPEN ?auto_1631 ) ( DOOR-ON ?auto_1629 ?auto_1624 ) ( DOOR-ON ?auto_1629 ?auto_1630 ) ( OPEN ?auto_1629 ) ( ROBOT-IN ?auto_1622 ?auto_1633 ) ( DOOR-ON ?auto_1635 ?auto_1633 ) ( DOOR-ON ?auto_1635 ?auto_1624 ) ( OPEN ?auto_1635 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1622 ?auto_1624 )
      ( MOVE-TO ?auto_1622 ?auto_1623 ) )
  )

0x7ffda6444570
0x7ffda6444600
0x7ffda6444690
starting state: 4
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1660 - ROBOT
      ?auto_1661 - ROOM
    )
    :vars
    (
      ?auto_1665 - DOOR
      ?auto_1663 - ROOM
      ?auto_1670 - DOOR
      ?auto_1669 - ROOM
      ?auto_1671 - DOOR
      ?auto_1667 - ROOM
      ?auto_1664 - DOOR
      ?auto_1662 - ROOM
      ?auto_1675 - ROOM
      ?auto_1674 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1665 ?auto_1663 ) ( DOOR-ON ?auto_1665 ?auto_1661 ) ( OPEN ?auto_1665 ) ( DOOR-ON ?auto_1670 ?auto_1669 ) ( DOOR-ON ?auto_1670 ?auto_1663 ) ( OPEN ?auto_1670 ) ( DOOR-ON ?auto_1671 ?auto_1667 ) ( DOOR-ON ?auto_1671 ?auto_1669 ) ( OPEN ?auto_1671 ) ( DOOR-ON ?auto_1664 ?auto_1662 ) ( DOOR-ON ?auto_1664 ?auto_1667 ) ( OPEN ?auto_1664 ) ( ROBOT-IN ?auto_1660 ?auto_1675 ) ( DOOR-ON ?auto_1674 ?auto_1675 ) ( DOOR-ON ?auto_1674 ?auto_1662 ) ( OPEN ?auto_1674 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1660 ?auto_1662 )
      ( MOVE-TO ?auto_1660 ?auto_1661 ) )
  )

0x7ffda6444720
starting state: 3
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1676 - ROBOT
      ?auto_1677 - ROOM
    )
    :vars
    (
      ?auto_1681 - DOOR
      ?auto_1679 - ROOM
      ?auto_1686 - DOOR
      ?auto_1685 - ROOM
      ?auto_1687 - DOOR
      ?auto_1683 - ROOM
      ?auto_1680 - DOOR
      ?auto_1678 - ROOM
      ?auto_1692 - ROOM
      ?auto_1689 - DOOR
      ?auto_1694 - ROBOT
      ?auto_1693 - ROOM
      ?auto_1688 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_1681 ?auto_1679 ) ( DOOR-ON ?auto_1681 ?auto_1677 ) ( OPEN ?auto_1681 ) ( DOOR-ON ?auto_1686 ?auto_1685 ) ( DOOR-ON ?auto_1686 ?auto_1679 ) ( OPEN ?auto_1686 ) ( DOOR-ON ?auto_1687 ?auto_1683 ) ( DOOR-ON ?auto_1687 ?auto_1685 ) ( OPEN ?auto_1687 ) ( DOOR-ON ?auto_1680 ?auto_1678 ) ( DOOR-ON ?auto_1680 ?auto_1683 ) ( OPEN ?auto_1680 ) ( ROBOT-IN ?auto_1676 ?auto_1692 ) ( DOOR-ON ?auto_1689 ?auto_1692 ) ( DOOR-ON ?auto_1689 ?auto_1678 ) ( ROBOT-IN ?auto_1694 ?auto_1693 ) ( DOOR-ON ?auto_1689 ?auto_1693 ) ( LOCKED ?auto_1689 ) ( ON-ROBOT ?auto_1688 ?auto_1694 ) ( KEY ?auto_1688 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1676 ?auto_1678 )
      ( MOVE-TO ?auto_1676 ?auto_1677 ) )
  )

0x7ffda64447b0
0x7ffda6444840
0x7ffda64448d0
starting state: 0
ending state: 18
dropped method: 
  ( :method MOVE-TO
    :parameters
    (
      ?auto_1726 - ROBOT
      ?auto_1727 - ROOM
    )
    :vars
    (
      ?auto_1728 - DOOR
      ?auto_1734 - ROOM
      ?auto_1731 - DOOR
      ?auto_1732 - ROOM
      ?auto_1736 - DOOR
      ?auto_1737 - ROOM
      ?auto_1735 - DOOR
      ?auto_1729 - ROOM
      ?auto_1733 - DOOR
      ?auto_1730 - ROOM
      ?auto_1742 - ROOM
      ?auto_1743 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1728 ?auto_1734 ) ( DOOR-ON ?auto_1728 ?auto_1727 ) ( OPEN ?auto_1728 ) ( DOOR-ON ?auto_1731 ?auto_1732 ) ( DOOR-ON ?auto_1731 ?auto_1734 ) ( OPEN ?auto_1731 ) ( DOOR-ON ?auto_1736 ?auto_1737 ) ( DOOR-ON ?auto_1736 ?auto_1732 ) ( OPEN ?auto_1736 ) ( DOOR-ON ?auto_1735 ?auto_1729 ) ( DOOR-ON ?auto_1735 ?auto_1737 ) ( OPEN ?auto_1735 ) ( DOOR-ON ?auto_1733 ?auto_1730 ) ( DOOR-ON ?auto_1733 ?auto_1729 ) ( OPEN ?auto_1733 ) ( ROBOT-IN ?auto_1726 ?auto_1742 ) ( DOOR-ON ?auto_1743 ?auto_1742 ) ( DOOR-ON ?auto_1743 ?auto_1730 ) ( OPEN ?auto_1743 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1726 ?auto_1730 )
      ( MOVE-TO ?auto_1726 ?auto_1727 ) )
  )

0x7ffda64442a0
0x7ffda6444330
0x7ffda64443c0
0x7ffda6444450
0x7ffda64444e0
0x7ffda6444600
0x7ffda6444690
0x7ffda6444720
0x7ffda64447b0
( define ( domain minigrid )
  ( :requirements :strips :typing :equality :htn )
  ( :types door obj robot room )
  ( :predicates
    ( ROBOT-IN ?a - ROBOT ?b - ROOM )
    ( OBJ-IN ?c - OBJ ?d - ROOM )
    ( ON-ROBOT ?e - OBJ ?f - ROBOT )
    ( DOOR-ON ?g - DOOR ?h - ROOM )
    ( OPEN ?j - DOOR )
    ( LOCKED ?k - DOOR )
    ( KEY ?l - OBJ )
    ( PARCEL ?m - OBJ )
  )
  ( :action !PICK-UP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( OBJ-IN ?obj ?room ) )
    :effect
    ( and ( not ( OBJ-IN ?obj ?room ) ) ( ON-ROBOT ?obj ?robot ) )
  )
  ( :action !MOVE-TO
    :parameters
    (
      ?robot - ROBOT
      ?c1 - ROOM
      ?c2 - ROOM
      ?door - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( DOOR-ON ?door ?c2 ) ( OPEN ?door ) )
    :effect
    ( and ( not ( ROBOT-IN ?robot ?c1 ) ) ( ROBOT-IN ?robot ?c2 ) )
  )
  ( :action !DROP
    :parameters
    (
      ?robot - ROBOT
      ?obj - OBJ
      ?room - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?room ) ( ON-ROBOT ?obj ?robot ) )
    :effect
    ( and ( OBJ-IN ?obj ?room ) ( not ( ON-ROBOT ?obj ?robot ) ) )
  )
  ( :action !OPEN
    :parameters
    (
      ?robot - ROBOT
      ?door - DOOR
      ?c1 - ROOM
      ?key - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?robot ?c1 ) ( DOOR-ON ?door ?c1 ) ( LOCKED ?door ) ( ON-ROBOT ?key ?robot ) ( KEY ?key ) )
    :effect
    ( and ( not ( LOCKED ?door ) ) ( OPEN ?door ) )
  )
  ( :method MOVE-TO
    :parameters
    (
      ?auto_2 - ROBOT
      ?auto_3 - ROOM
    )
    :vars
    (
      ?auto_5 - ROOM
      ?auto_6 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_2 ?auto_5 ) ( DOOR-ON ?auto_6 ?auto_5 ) ( DOOR-ON ?auto_6 ?auto_3 ) ( OPEN ?auto_6 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_2 ?auto_5 ?auto_3 ?auto_6 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_10 - ROBOT
      ?auto_11 - OBJ
    )
    :vars
    (
      ?auto_13 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_10 ?auto_13 ) ( OBJ-IN ?auto_11 ?auto_13 ) )
    :subtasks
    ( ( !PICK-UP ?auto_10 ?auto_11 ?auto_13 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_15 - ROBOT
      ?auto_16 - OBJ
    )
    :vars
    (
      ?auto_17 - ROOM
      ?auto_22 - ROOM
      ?auto_23 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_16 ?auto_17 ) ( ROBOT-IN ?auto_15 ?auto_22 ) ( DOOR-ON ?auto_23 ?auto_22 ) ( DOOR-ON ?auto_23 ?auto_17 ) ( OPEN ?auto_23 ) )
    :subtasks
    ( ( MOVE-TO ?auto_15 ?auto_17 )
      ( PICK-UP-OBJ ?auto_15 ?auto_16 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_26 - ROBOT
      ?auto_27 - ROOM
    )
    :vars
    (
      ?auto_29 - ROOM
      ?auto_30 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_26 ?auto_29 ) ( DOOR-ON ?auto_30 ?auto_29 ) ( DOOR-ON ?auto_30 ?auto_27 ) ( OPEN ?auto_30 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_26 ?auto_29 ?auto_27 ?auto_30 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_38 - ROBOT
      ?auto_39 - ROOM
    )
    :vars
    (
      ?auto_43 - DOOR
      ?auto_40 - ROOM
      ?auto_46 - ROOM
      ?auto_47 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_43 ?auto_40 ) ( DOOR-ON ?auto_43 ?auto_39 ) ( OPEN ?auto_43 ) ( ROBOT-IN ?auto_38 ?auto_46 ) ( DOOR-ON ?auto_47 ?auto_46 ) ( DOOR-ON ?auto_47 ?auto_40 ) ( OPEN ?auto_47 ) )
    :subtasks
    ( ( MOVE-TO ?auto_38 ?auto_40 )
      ( MOVE-TO ?auto_38 ?auto_39 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_49 - DOOR
    )
    :vars
    (
      ?auto_50 - ROBOT
      ?auto_51 - ROOM
      ?auto_53 - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?auto_50 ?auto_51 ) ( DOOR-ON ?auto_49 ?auto_51 ) ( LOCKED ?auto_49 ) ( ON-ROBOT ?auto_53 ?auto_50 ) ( KEY ?auto_53 ) )
    :subtasks
    ( ( !OPEN ?auto_50 ?auto_49 ?auto_51 ?auto_53 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_54 - DOOR
    )
    :vars
    (
      ?auto_57 - ROOM
      ?auto_56 - OBJ
      ?auto_55 - ROBOT
      ?auto_59 - ROOM
      ?auto_60 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_54 ?auto_57 ) ( LOCKED ?auto_54 ) ( ON-ROBOT ?auto_56 ?auto_55 ) ( KEY ?auto_56 ) ( ROBOT-IN ?auto_55 ?auto_59 ) ( DOOR-ON ?auto_60 ?auto_59 ) ( DOOR-ON ?auto_60 ?auto_57 ) ( OPEN ?auto_60 ) )
    :subtasks
    ( ( MOVE-TO ?auto_55 ?auto_57 )
      ( OPEN_DOOR ?auto_54 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_63 - DOOR
    )
    :vars
    (
      ?auto_64 - ROOM
      ?auto_65 - OBJ
      ?auto_68 - ROBOT
      ?auto_67 - ROOM
      ?auto_66 - DOOR
      ?auto_70 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_63 ?auto_64 ) ( LOCKED ?auto_63 ) ( KEY ?auto_65 ) ( ROBOT-IN ?auto_68 ?auto_67 ) ( DOOR-ON ?auto_66 ?auto_67 ) ( DOOR-ON ?auto_66 ?auto_64 ) ( OPEN ?auto_66 ) ( ROBOT-IN ?auto_68 ?auto_70 ) ( OBJ-IN ?auto_65 ?auto_70 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_68 ?auto_65 )
      ( OPEN_DOOR ?auto_63 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_73 - DOOR
    )
    :vars
    (
      ?auto_78 - ROOM
      ?auto_77 - OBJ
      ?auto_74 - DOOR
      ?auto_80 - ROOM
      ?auto_75 - ROBOT
      ?auto_83 - ROOM
      ?auto_84 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_73 ?auto_78 ) ( LOCKED ?auto_73 ) ( KEY ?auto_77 ) ( DOOR-ON ?auto_74 ?auto_80 ) ( DOOR-ON ?auto_74 ?auto_78 ) ( OPEN ?auto_74 ) ( OBJ-IN ?auto_77 ?auto_80 ) ( ROBOT-IN ?auto_75 ?auto_83 ) ( DOOR-ON ?auto_84 ?auto_83 ) ( DOOR-ON ?auto_84 ?auto_80 ) ( OPEN ?auto_84 ) )
    :subtasks
    ( ( MOVE-TO ?auto_75 ?auto_80 )
      ( OPEN_DOOR ?auto_73 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_87 - ROBOT
      ?auto_88 - ROOM
    )
    :vars
    (
      ?auto_90 - ROOM
      ?auto_91 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_87 ?auto_90 ) ( DOOR-ON ?auto_91 ?auto_90 ) ( DOOR-ON ?auto_91 ?auto_88 ) ( OPEN ?auto_91 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_87 ?auto_90 ?auto_88 ?auto_91 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_93 - ROBOT
      ?auto_94 - ROOM
    )
    :vars
    (
      ?auto_98 - ROOM
      ?auto_97 - DOOR
      ?auto_99 - ROBOT
      ?auto_101 - ROOM
      ?auto_100 - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?auto_93 ?auto_98 ) ( DOOR-ON ?auto_97 ?auto_98 ) ( DOOR-ON ?auto_97 ?auto_94 ) ( ROBOT-IN ?auto_99 ?auto_101 ) ( DOOR-ON ?auto_97 ?auto_101 ) ( LOCKED ?auto_97 ) ( ON-ROBOT ?auto_100 ?auto_99 ) ( KEY ?auto_100 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_97 )
      ( MOVE-TO ?auto_93 ?auto_94 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_111 - ROBOT
      ?auto_104 - ROOM
    )
    :vars
    (
      ?auto_106 - DOOR
      ?auto_110 - ROOM
      ?auto_105 - OBJ
      ?auto_112 - ROOM
      ?auto_113 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_106 ?auto_110 ) ( DOOR-ON ?auto_106 ?auto_104 ) ( LOCKED ?auto_106 ) ( ON-ROBOT ?auto_105 ?auto_111 ) ( KEY ?auto_105 ) ( ROBOT-IN ?auto_111 ?auto_112 ) ( DOOR-ON ?auto_113 ?auto_112 ) ( DOOR-ON ?auto_113 ?auto_110 ) ( OPEN ?auto_113 ) )
    :subtasks
    ( ( MOVE-TO ?auto_111 ?auto_110 )
      ( MOVE-TO ?auto_111 ?auto_104 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_116 - ROBOT
      ?auto_117 - ROOM
    )
    :vars
    (
      ?auto_120 - DOOR
      ?auto_121 - ROOM
      ?auto_123 - OBJ
      ?auto_118 - ROOM
      ?auto_119 - DOOR
      ?auto_125 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_120 ?auto_121 ) ( DOOR-ON ?auto_120 ?auto_117 ) ( LOCKED ?auto_120 ) ( KEY ?auto_123 ) ( ROBOT-IN ?auto_116 ?auto_118 ) ( DOOR-ON ?auto_119 ?auto_118 ) ( DOOR-ON ?auto_119 ?auto_121 ) ( OPEN ?auto_119 ) ( ROBOT-IN ?auto_116 ?auto_125 ) ( OBJ-IN ?auto_123 ?auto_125 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_116 ?auto_123 )
      ( MOVE-TO ?auto_116 ?auto_117 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_128 - ROBOT
      ?auto_129 - ROOM
    )
    :vars
    (
      ?auto_134 - DOOR
      ?auto_130 - ROOM
      ?auto_133 - OBJ
      ?auto_135 - DOOR
      ?auto_132 - ROOM
      ?auto_140 - ROOM
      ?auto_141 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_134 ?auto_130 ) ( DOOR-ON ?auto_134 ?auto_129 ) ( LOCKED ?auto_134 ) ( KEY ?auto_133 ) ( DOOR-ON ?auto_135 ?auto_132 ) ( DOOR-ON ?auto_135 ?auto_130 ) ( OPEN ?auto_135 ) ( OBJ-IN ?auto_133 ?auto_132 ) ( ROBOT-IN ?auto_128 ?auto_140 ) ( DOOR-ON ?auto_141 ?auto_140 ) ( DOOR-ON ?auto_141 ?auto_132 ) ( OPEN ?auto_141 ) )
    :subtasks
    ( ( MOVE-TO ?auto_128 ?auto_132 )
      ( MOVE-TO ?auto_128 ?auto_129 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_144 - ROBOT
      ?auto_145 - OBJ
    )
    :vars
    (
      ?auto_147 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_144 ?auto_147 ) ( OBJ-IN ?auto_145 ?auto_147 ) )
    :subtasks
    ( ( !PICK-UP ?auto_144 ?auto_145 ?auto_147 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_149 - ROBOT
      ?auto_150 - OBJ
    )
    :vars
    (
      ?auto_153 - ROOM
      ?auto_157 - ROOM
      ?auto_156 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_150 ?auto_153 ) ( ROBOT-IN ?auto_149 ?auto_157 ) ( DOOR-ON ?auto_156 ?auto_157 ) ( DOOR-ON ?auto_156 ?auto_153 ) ( OPEN ?auto_156 ) )
    :subtasks
    ( ( MOVE-TO ?auto_149 ?auto_153 )
      ( PICK-UP-OBJ ?auto_149 ?auto_150 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_158 - ROBOT
      ?auto_159 - OBJ
    )
    :vars
    (
      ?auto_160 - ROOM
      ?auto_164 - ROOM
      ?auto_163 - DOOR
      ?auto_165 - ROBOT
      ?auto_167 - ROOM
      ?auto_166 - OBJ
    )
    :precondition
    ( and ( OBJ-IN ?auto_159 ?auto_160 ) ( ROBOT-IN ?auto_158 ?auto_164 ) ( DOOR-ON ?auto_163 ?auto_164 ) ( DOOR-ON ?auto_163 ?auto_160 ) ( ROBOT-IN ?auto_165 ?auto_167 ) ( DOOR-ON ?auto_163 ?auto_167 ) ( LOCKED ?auto_163 ) ( ON-ROBOT ?auto_166 ?auto_165 ) ( KEY ?auto_166 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_163 )
      ( PICK-UP-OBJ ?auto_158 ?auto_159 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_177 - ROBOT
      ?auto_170 - OBJ
    )
    :vars
    (
      ?auto_171 - ROOM
      ?auto_173 - DOOR
      ?auto_172 - ROOM
      ?auto_175 - OBJ
      ?auto_179 - ROOM
      ?auto_180 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_170 ?auto_171 ) ( DOOR-ON ?auto_173 ?auto_172 ) ( DOOR-ON ?auto_173 ?auto_171 ) ( LOCKED ?auto_173 ) ( ON-ROBOT ?auto_175 ?auto_177 ) ( KEY ?auto_175 ) ( ROBOT-IN ?auto_177 ?auto_179 ) ( DOOR-ON ?auto_180 ?auto_179 ) ( DOOR-ON ?auto_180 ?auto_172 ) ( OPEN ?auto_180 ) )
    :subtasks
    ( ( MOVE-TO ?auto_177 ?auto_172 )
      ( PICK-UP-OBJ ?auto_177 ?auto_170 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_183 - ROBOT
      ?auto_184 - OBJ
    )
    :vars
    (
      ?auto_192 - ROOM
      ?auto_185 - DOOR
      ?auto_188 - ROOM
      ?auto_187 - OBJ
      ?auto_189 - ROOM
      ?auto_191 - DOOR
      ?auto_193 - ROOM
    )
    :precondition
    ( and ( OBJ-IN ?auto_184 ?auto_192 ) ( DOOR-ON ?auto_185 ?auto_188 ) ( DOOR-ON ?auto_185 ?auto_192 ) ( LOCKED ?auto_185 ) ( KEY ?auto_187 ) ( ROBOT-IN ?auto_183 ?auto_189 ) ( DOOR-ON ?auto_191 ?auto_189 ) ( DOOR-ON ?auto_191 ?auto_188 ) ( OPEN ?auto_191 ) ( ROBOT-IN ?auto_183 ?auto_193 ) ( OBJ-IN ?auto_187 ?auto_193 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_183 ?auto_187 )
      ( PICK-UP-OBJ ?auto_183 ?auto_184 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_196 - ROBOT
      ?auto_197 - OBJ
    )
    :vars
    (
      ?auto_203 - ROOM
      ?auto_201 - DOOR
      ?auto_200 - ROOM
      ?auto_202 - OBJ
      ?auto_198 - DOOR
      ?auto_205 - ROOM
      ?auto_209 - ROOM
      ?auto_210 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_197 ?auto_203 ) ( DOOR-ON ?auto_201 ?auto_200 ) ( DOOR-ON ?auto_201 ?auto_203 ) ( LOCKED ?auto_201 ) ( KEY ?auto_202 ) ( DOOR-ON ?auto_198 ?auto_205 ) ( DOOR-ON ?auto_198 ?auto_200 ) ( OPEN ?auto_198 ) ( OBJ-IN ?auto_202 ?auto_205 ) ( ROBOT-IN ?auto_196 ?auto_209 ) ( DOOR-ON ?auto_210 ?auto_209 ) ( DOOR-ON ?auto_210 ?auto_205 ) ( OPEN ?auto_210 ) )
    :subtasks
    ( ( MOVE-TO ?auto_196 ?auto_205 )
      ( PICK-UP-OBJ ?auto_196 ?auto_197 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_213 - ROBOT
      ?auto_214 - ROOM
    )
    :vars
    (
      ?auto_216 - ROOM
      ?auto_217 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_213 ?auto_216 ) ( DOOR-ON ?auto_217 ?auto_216 ) ( DOOR-ON ?auto_217 ?auto_214 ) ( OPEN ?auto_217 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_213 ?auto_216 ?auto_214 ?auto_217 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_225 - ROBOT
      ?auto_226 - ROOM
    )
    :vars
    (
      ?auto_228 - DOOR
      ?auto_227 - ROOM
      ?auto_234 - ROOM
      ?auto_233 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_228 ?auto_227 ) ( DOOR-ON ?auto_228 ?auto_226 ) ( OPEN ?auto_228 ) ( ROBOT-IN ?auto_225 ?auto_234 ) ( DOOR-ON ?auto_233 ?auto_234 ) ( DOOR-ON ?auto_233 ?auto_227 ) ( OPEN ?auto_233 ) )
    :subtasks
    ( ( MOVE-TO ?auto_225 ?auto_227 )
      ( MOVE-TO ?auto_225 ?auto_226 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_235 - ROBOT
      ?auto_236 - ROOM
    )
    :vars
    (
      ?auto_238 - DOOR
      ?auto_237 - ROOM
      ?auto_245 - ROOM
      ?auto_242 - DOOR
      ?auto_247 - ROBOT
      ?auto_246 - ROOM
      ?auto_241 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_238 ?auto_237 ) ( DOOR-ON ?auto_238 ?auto_236 ) ( OPEN ?auto_238 ) ( ROBOT-IN ?auto_235 ?auto_245 ) ( DOOR-ON ?auto_242 ?auto_245 ) ( DOOR-ON ?auto_242 ?auto_237 ) ( ROBOT-IN ?auto_247 ?auto_246 ) ( DOOR-ON ?auto_242 ?auto_246 ) ( LOCKED ?auto_242 ) ( ON-ROBOT ?auto_241 ?auto_247 ) ( KEY ?auto_241 ) )
    :subtasks
    ( ( MOVE-TO ?auto_235 ?auto_237 )
      ( MOVE-TO ?auto_235 ?auto_236 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_267 - ROBOT
      ?auto_268 - ROOM
    )
    :vars
    (
      ?auto_273 - DOOR
      ?auto_272 - ROOM
      ?auto_271 - DOOR
      ?auto_274 - ROOM
      ?auto_277 - ROOM
      ?auto_278 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_273 ?auto_272 ) ( DOOR-ON ?auto_273 ?auto_268 ) ( OPEN ?auto_273 ) ( DOOR-ON ?auto_271 ?auto_274 ) ( DOOR-ON ?auto_271 ?auto_272 ) ( OPEN ?auto_271 ) ( ROBOT-IN ?auto_267 ?auto_277 ) ( DOOR-ON ?auto_278 ?auto_277 ) ( DOOR-ON ?auto_278 ?auto_274 ) ( OPEN ?auto_278 ) )
    :subtasks
    ( ( MOVE-TO ?auto_267 ?auto_274 )
      ( MOVE-TO ?auto_267 ?auto_268 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_282 - OBJ
      ?auto_281 - ROOM
    )
    :vars
    (
      ?auto_283 - ROBOT
    )
    :precondition
    ( and ( ROBOT-IN ?auto_283 ?auto_281 ) ( ON-ROBOT ?auto_282 ?auto_283 ) )
    :subtasks
    ( ( !DROP ?auto_283 ?auto_282 ?auto_281 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_287 - OBJ
      ?auto_286 - ROOM
    )
    :vars
    (
      ?auto_289 - ROBOT
      ?auto_291 - ROOM
      ?auto_293 - DOOR
    )
    :precondition
    ( and ( ON-ROBOT ?auto_287 ?auto_289 ) ( ROBOT-IN ?auto_289 ?auto_291 ) ( DOOR-ON ?auto_293 ?auto_291 ) ( DOOR-ON ?auto_293 ?auto_286 ) ( OPEN ?auto_293 ) )
    :subtasks
    ( ( MOVE-TO ?auto_289 ?auto_286 )
      ( DELIVER-PKG ?auto_287 ?auto_286 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_296 - OBJ
      ?auto_295 - ROOM
    )
    :vars
    (
      ?auto_298 - ROBOT
      ?auto_299 - ROOM
      ?auto_300 - DOOR
      ?auto_304 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_298 ?auto_299 ) ( DOOR-ON ?auto_300 ?auto_299 ) ( DOOR-ON ?auto_300 ?auto_295 ) ( OPEN ?auto_300 ) ( ROBOT-IN ?auto_298 ?auto_304 ) ( OBJ-IN ?auto_296 ?auto_304 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_298 ?auto_296 )
      ( DELIVER-PKG ?auto_296 ?auto_295 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_306 - OBJ
      ?auto_305 - ROOM
    )
    :vars
    (
      ?auto_309 - DOOR
      ?auto_308 - ROOM
      ?auto_307 - ROBOT
      ?auto_316 - ROOM
      ?auto_315 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_309 ?auto_308 ) ( DOOR-ON ?auto_309 ?auto_305 ) ( OPEN ?auto_309 ) ( OBJ-IN ?auto_306 ?auto_308 ) ( ROBOT-IN ?auto_307 ?auto_316 ) ( DOOR-ON ?auto_315 ?auto_316 ) ( DOOR-ON ?auto_315 ?auto_308 ) ( OPEN ?auto_315 ) )
    :subtasks
    ( ( MOVE-TO ?auto_307 ?auto_308 )
      ( DELIVER-PKG ?auto_306 ?auto_305 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_318 - OBJ
      ?auto_317 - ROOM
    )
    :vars
    (
      ?auto_322 - DOOR
      ?auto_320 - ROOM
      ?auto_319 - ROBOT
      ?auto_321 - ROOM
      ?auto_326 - ROBOT
      ?auto_328 - ROOM
      ?auto_327 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_322 ?auto_320 ) ( DOOR-ON ?auto_322 ?auto_317 ) ( OBJ-IN ?auto_318 ?auto_320 ) ( ROBOT-IN ?auto_319 ?auto_321 ) ( DOOR-ON ?auto_322 ?auto_321 ) ( ROBOT-IN ?auto_326 ?auto_328 ) ( DOOR-ON ?auto_322 ?auto_328 ) ( LOCKED ?auto_322 ) ( ON-ROBOT ?auto_327 ?auto_326 ) ( KEY ?auto_327 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_322 )
      ( DELIVER-PKG ?auto_318 ?auto_317 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_331 - OBJ
      ?auto_330 - ROOM
    )
    :vars
    (
      ?auto_335 - DOOR
      ?auto_334 - ROOM
      ?auto_332 - ROOM
      ?auto_340 - OBJ
      ?auto_333 - ROBOT
      ?auto_341 - ROOM
      ?auto_342 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_335 ?auto_334 ) ( DOOR-ON ?auto_335 ?auto_330 ) ( OBJ-IN ?auto_331 ?auto_334 ) ( DOOR-ON ?auto_335 ?auto_332 ) ( LOCKED ?auto_335 ) ( ON-ROBOT ?auto_340 ?auto_333 ) ( KEY ?auto_340 ) ( ROBOT-IN ?auto_333 ?auto_341 ) ( DOOR-ON ?auto_342 ?auto_341 ) ( DOOR-ON ?auto_342 ?auto_332 ) ( OPEN ?auto_342 ) )
    :subtasks
    ( ( MOVE-TO ?auto_333 ?auto_332 )
      ( DELIVER-PKG ?auto_331 ?auto_330 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_346 - OBJ
      ?auto_345 - ROOM
    )
    :vars
    (
      ?auto_354 - DOOR
      ?auto_348 - ROOM
      ?auto_350 - ROOM
      ?auto_347 - OBJ
      ?auto_349 - ROBOT
      ?auto_351 - ROOM
      ?auto_355 - DOOR
      ?auto_356 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_354 ?auto_348 ) ( DOOR-ON ?auto_354 ?auto_345 ) ( OBJ-IN ?auto_346 ?auto_348 ) ( DOOR-ON ?auto_354 ?auto_350 ) ( LOCKED ?auto_354 ) ( KEY ?auto_347 ) ( ROBOT-IN ?auto_349 ?auto_351 ) ( DOOR-ON ?auto_355 ?auto_351 ) ( DOOR-ON ?auto_355 ?auto_350 ) ( OPEN ?auto_355 ) ( ROBOT-IN ?auto_349 ?auto_356 ) ( OBJ-IN ?auto_347 ?auto_356 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_349 ?auto_347 )
      ( DELIVER-PKG ?auto_346 ?auto_345 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_360 - OBJ
      ?auto_359 - ROOM
    )
    :vars
    (
      ?auto_367 - DOOR
      ?auto_365 - ROOM
      ?auto_363 - ROOM
      ?auto_362 - OBJ
      ?auto_366 - DOOR
      ?auto_368 - ROOM
      ?auto_364 - ROBOT
      ?auto_373 - ROOM
      ?auto_374 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_367 ?auto_365 ) ( DOOR-ON ?auto_367 ?auto_359 ) ( OBJ-IN ?auto_360 ?auto_365 ) ( DOOR-ON ?auto_367 ?auto_363 ) ( LOCKED ?auto_367 ) ( KEY ?auto_362 ) ( DOOR-ON ?auto_366 ?auto_368 ) ( DOOR-ON ?auto_366 ?auto_363 ) ( OPEN ?auto_366 ) ( OBJ-IN ?auto_362 ?auto_368 ) ( ROBOT-IN ?auto_364 ?auto_373 ) ( DOOR-ON ?auto_374 ?auto_373 ) ( DOOR-ON ?auto_374 ?auto_368 ) ( OPEN ?auto_374 ) )
    :subtasks
    ( ( MOVE-TO ?auto_364 ?auto_368 )
      ( DELIVER-PKG ?auto_360 ?auto_359 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_377 - ROBOT
      ?auto_378 - ROOM
    )
    :vars
    (
      ?auto_380 - ROOM
      ?auto_381 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_377 ?auto_380 ) ( DOOR-ON ?auto_381 ?auto_380 ) ( DOOR-ON ?auto_381 ?auto_378 ) ( OPEN ?auto_381 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_377 ?auto_380 ?auto_378 ?auto_381 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_389 - ROBOT
      ?auto_390 - ROOM
    )
    :vars
    (
      ?auto_394 - DOOR
      ?auto_392 - ROOM
      ?auto_395 - ROOM
      ?auto_397 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_394 ?auto_392 ) ( DOOR-ON ?auto_394 ?auto_390 ) ( OPEN ?auto_394 ) ( ROBOT-IN ?auto_389 ?auto_395 ) ( DOOR-ON ?auto_397 ?auto_395 ) ( DOOR-ON ?auto_397 ?auto_392 ) ( OPEN ?auto_397 ) )
    :subtasks
    ( ( MOVE-TO ?auto_389 ?auto_392 )
      ( MOVE-TO ?auto_389 ?auto_390 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_423 - ROBOT
      ?auto_424 - ROOM
    )
    :vars
    (
      ?auto_426 - DOOR
      ?auto_428 - ROOM
      ?auto_430 - DOOR
      ?auto_427 - ROOM
      ?auto_431 - ROOM
      ?auto_432 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_426 ?auto_428 ) ( DOOR-ON ?auto_426 ?auto_424 ) ( OPEN ?auto_426 ) ( DOOR-ON ?auto_430 ?auto_427 ) ( DOOR-ON ?auto_430 ?auto_428 ) ( OPEN ?auto_430 ) ( ROBOT-IN ?auto_423 ?auto_431 ) ( DOOR-ON ?auto_432 ?auto_431 ) ( DOOR-ON ?auto_432 ?auto_427 ) ( OPEN ?auto_432 ) )
    :subtasks
    ( ( MOVE-TO ?auto_423 ?auto_427 )
      ( MOVE-TO ?auto_423 ?auto_424 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_435 - ROBOT
      ?auto_436 - ROOM
    )
    :vars
    (
      ?auto_438 - DOOR
      ?auto_440 - ROOM
      ?auto_442 - DOOR
      ?auto_439 - ROOM
      ?auto_443 - ROOM
      ?auto_446 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_438 ?auto_440 ) ( DOOR-ON ?auto_438 ?auto_436 ) ( OPEN ?auto_438 ) ( DOOR-ON ?auto_442 ?auto_439 ) ( DOOR-ON ?auto_442 ?auto_440 ) ( OPEN ?auto_442 ) ( ROBOT-IN ?auto_435 ?auto_443 ) ( DOOR-ON ?auto_446 ?auto_443 ) ( DOOR-ON ?auto_446 ?auto_439 ) ( OPEN ?auto_446 ) )
    :subtasks
    ( ( MOVE-TO ?auto_435 ?auto_439 )
      ( MOVE-TO ?auto_435 ?auto_436 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_459 - ROBOT
      ?auto_460 - OBJ
    )
    :vars
    (
      ?auto_462 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_459 ?auto_462 ) ( OBJ-IN ?auto_460 ?auto_462 ) )
    :subtasks
    ( ( !PICK-UP ?auto_459 ?auto_460 ?auto_462 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_464 - ROBOT
      ?auto_465 - OBJ
    )
    :vars
    (
      ?auto_468 - ROOM
      ?auto_470 - ROOM
      ?auto_472 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_465 ?auto_468 ) ( ROBOT-IN ?auto_464 ?auto_470 ) ( DOOR-ON ?auto_472 ?auto_470 ) ( DOOR-ON ?auto_472 ?auto_468 ) ( OPEN ?auto_472 ) )
    :subtasks
    ( ( MOVE-TO ?auto_464 ?auto_468 )
      ( PICK-UP-OBJ ?auto_464 ?auto_465 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_480 - ROBOT
      ?auto_481 - OBJ
    )
    :vars
    (
      ?auto_485 - ROOM
      ?auto_486 - DOOR
      ?auto_484 - ROOM
      ?auto_487 - ROOM
      ?auto_489 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_481 ?auto_485 ) ( DOOR-ON ?auto_486 ?auto_484 ) ( DOOR-ON ?auto_486 ?auto_485 ) ( OPEN ?auto_486 ) ( ROBOT-IN ?auto_480 ?auto_487 ) ( DOOR-ON ?auto_489 ?auto_487 ) ( DOOR-ON ?auto_489 ?auto_484 ) ( OPEN ?auto_489 ) )
    :subtasks
    ( ( MOVE-TO ?auto_480 ?auto_484 )
      ( PICK-UP-OBJ ?auto_480 ?auto_481 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_547 - ROBOT
      ?auto_548 - ROOM
    )
    :vars
    (
      ?auto_550 - ROOM
      ?auto_551 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_547 ?auto_550 ) ( DOOR-ON ?auto_551 ?auto_550 ) ( DOOR-ON ?auto_551 ?auto_548 ) ( OPEN ?auto_551 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_547 ?auto_550 ?auto_548 ?auto_551 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_559 - ROBOT
      ?auto_560 - ROOM
    )
    :vars
    (
      ?auto_564 - DOOR
      ?auto_563 - ROOM
      ?auto_566 - ROOM
      ?auto_568 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_564 ?auto_563 ) ( DOOR-ON ?auto_564 ?auto_560 ) ( OPEN ?auto_564 ) ( ROBOT-IN ?auto_559 ?auto_566 ) ( DOOR-ON ?auto_568 ?auto_566 ) ( DOOR-ON ?auto_568 ?auto_563 ) ( OPEN ?auto_568 ) )
    :subtasks
    ( ( MOVE-TO ?auto_559 ?auto_563 )
      ( MOVE-TO ?auto_559 ?auto_560 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_569 - ROBOT
      ?auto_570 - ROOM
    )
    :vars
    (
      ?auto_574 - DOOR
      ?auto_573 - ROOM
      ?auto_576 - ROOM
      ?auto_578 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_574 ?auto_573 ) ( DOOR-ON ?auto_574 ?auto_570 ) ( OPEN ?auto_574 ) ( ROBOT-IN ?auto_569 ?auto_576 ) ( DOOR-ON ?auto_578 ?auto_576 ) ( DOOR-ON ?auto_578 ?auto_573 ) ( OPEN ?auto_578 ) )
    :subtasks
    ( ( MOVE-TO ?auto_569 ?auto_573 )
      ( MOVE-TO ?auto_569 ?auto_570 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_595 - ROBOT
      ?auto_596 - ROOM
    )
    :vars
    (
      ?auto_600 - DOOR
      ?auto_599 - ROOM
      ?auto_602 - DOOR
      ?auto_597 - ROOM
      ?auto_606 - ROOM
      ?auto_605 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_600 ?auto_599 ) ( DOOR-ON ?auto_600 ?auto_596 ) ( OPEN ?auto_600 ) ( DOOR-ON ?auto_602 ?auto_597 ) ( DOOR-ON ?auto_602 ?auto_599 ) ( OPEN ?auto_602 ) ( ROBOT-IN ?auto_595 ?auto_606 ) ( DOOR-ON ?auto_605 ?auto_606 ) ( DOOR-ON ?auto_605 ?auto_597 ) ( OPEN ?auto_605 ) )
    :subtasks
    ( ( MOVE-TO ?auto_595 ?auto_597 )
      ( MOVE-TO ?auto_595 ?auto_596 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_607 - ROBOT
      ?auto_608 - ROOM
    )
    :vars
    (
      ?auto_612 - DOOR
      ?auto_611 - ROOM
      ?auto_614 - DOOR
      ?auto_609 - ROOM
      ?auto_619 - ROOM
      ?auto_616 - DOOR
      ?auto_621 - ROBOT
      ?auto_620 - ROOM
      ?auto_615 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_612 ?auto_611 ) ( DOOR-ON ?auto_612 ?auto_608 ) ( OPEN ?auto_612 ) ( DOOR-ON ?auto_614 ?auto_609 ) ( DOOR-ON ?auto_614 ?auto_611 ) ( OPEN ?auto_614 ) ( ROBOT-IN ?auto_607 ?auto_619 ) ( DOOR-ON ?auto_616 ?auto_619 ) ( DOOR-ON ?auto_616 ?auto_609 ) ( ROBOT-IN ?auto_621 ?auto_620 ) ( DOOR-ON ?auto_616 ?auto_620 ) ( LOCKED ?auto_616 ) ( ON-ROBOT ?auto_615 ?auto_621 ) ( KEY ?auto_615 ) )
    :subtasks
    ( ( MOVE-TO ?auto_607 ?auto_609 )
      ( MOVE-TO ?auto_607 ?auto_608 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_645 - ROBOT
      ?auto_646 - ROOM
    )
    :vars
    (
      ?auto_653 - DOOR
      ?auto_649 - ROOM
      ?auto_652 - DOOR
      ?auto_650 - ROOM
      ?auto_654 - DOOR
      ?auto_648 - ROOM
      ?auto_657 - ROOM
      ?auto_658 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_653 ?auto_649 ) ( DOOR-ON ?auto_653 ?auto_646 ) ( OPEN ?auto_653 ) ( DOOR-ON ?auto_652 ?auto_650 ) ( DOOR-ON ?auto_652 ?auto_649 ) ( OPEN ?auto_652 ) ( DOOR-ON ?auto_654 ?auto_648 ) ( DOOR-ON ?auto_654 ?auto_650 ) ( OPEN ?auto_654 ) ( ROBOT-IN ?auto_645 ?auto_657 ) ( DOOR-ON ?auto_658 ?auto_657 ) ( DOOR-ON ?auto_658 ?auto_648 ) ( OPEN ?auto_658 ) )
    :subtasks
    ( ( MOVE-TO ?auto_645 ?auto_648 )
      ( MOVE-TO ?auto_645 ?auto_646 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_662 - OBJ
      ?auto_661 - ROOM
    )
    :vars
    (
      ?auto_663 - ROBOT
    )
    :precondition
    ( and ( ROBOT-IN ?auto_663 ?auto_661 ) ( ON-ROBOT ?auto_662 ?auto_663 ) )
    :subtasks
    ( ( !DROP ?auto_663 ?auto_662 ?auto_661 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_667 - OBJ
      ?auto_666 - ROOM
    )
    :vars
    (
      ?auto_668 - ROBOT
      ?auto_673 - ROOM
      ?auto_671 - DOOR
    )
    :precondition
    ( and ( ON-ROBOT ?auto_667 ?auto_668 ) ( ROBOT-IN ?auto_668 ?auto_673 ) ( DOOR-ON ?auto_671 ?auto_673 ) ( DOOR-ON ?auto_671 ?auto_666 ) ( OPEN ?auto_671 ) )
    :subtasks
    ( ( MOVE-TO ?auto_668 ?auto_666 )
      ( DELIVER-PKG ?auto_667 ?auto_666 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_676 - OBJ
      ?auto_675 - ROOM
    )
    :vars
    (
      ?auto_681 - ROBOT
      ?auto_678 - ROOM
      ?auto_677 - DOOR
      ?auto_684 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_681 ?auto_678 ) ( DOOR-ON ?auto_677 ?auto_678 ) ( DOOR-ON ?auto_677 ?auto_675 ) ( OPEN ?auto_677 ) ( ROBOT-IN ?auto_681 ?auto_684 ) ( OBJ-IN ?auto_676 ?auto_684 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_681 ?auto_676 )
      ( DELIVER-PKG ?auto_676 ?auto_675 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_686 - OBJ
      ?auto_685 - ROOM
    )
    :vars
    (
      ?auto_687 - DOOR
      ?auto_688 - ROOM
      ?auto_690 - ROBOT
      ?auto_694 - ROOM
      ?auto_696 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_687 ?auto_688 ) ( DOOR-ON ?auto_687 ?auto_685 ) ( OPEN ?auto_687 ) ( OBJ-IN ?auto_686 ?auto_688 ) ( ROBOT-IN ?auto_690 ?auto_694 ) ( DOOR-ON ?auto_696 ?auto_694 ) ( DOOR-ON ?auto_696 ?auto_688 ) ( OPEN ?auto_696 ) )
    :subtasks
    ( ( MOVE-TO ?auto_690 ?auto_688 )
      ( DELIVER-PKG ?auto_686 ?auto_685 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_707 - OBJ
      ?auto_706 - ROOM
    )
    :vars
    (
      ?auto_711 - DOOR
      ?auto_712 - ROOM
      ?auto_713 - DOOR
      ?auto_710 - ROOM
      ?auto_714 - ROBOT
      ?auto_715 - ROOM
      ?auto_717 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_711 ?auto_712 ) ( DOOR-ON ?auto_711 ?auto_706 ) ( OPEN ?auto_711 ) ( OBJ-IN ?auto_707 ?auto_712 ) ( DOOR-ON ?auto_713 ?auto_710 ) ( DOOR-ON ?auto_713 ?auto_712 ) ( OPEN ?auto_713 ) ( ROBOT-IN ?auto_714 ?auto_715 ) ( DOOR-ON ?auto_717 ?auto_715 ) ( DOOR-ON ?auto_717 ?auto_710 ) ( OPEN ?auto_717 ) )
    :subtasks
    ( ( MOVE-TO ?auto_714 ?auto_710 )
      ( DELIVER-PKG ?auto_707 ?auto_706 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_787 - ROBOT
      ?auto_788 - ROOM
    )
    :vars
    (
      ?auto_790 - ROOM
      ?auto_791 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_787 ?auto_790 ) ( DOOR-ON ?auto_791 ?auto_790 ) ( DOOR-ON ?auto_791 ?auto_788 ) ( OPEN ?auto_791 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_787 ?auto_790 ?auto_788 ?auto_791 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_799 - ROBOT
      ?auto_800 - ROOM
    )
    :vars
    (
      ?auto_803 - DOOR
      ?auto_802 - ROOM
      ?auto_807 - ROOM
      ?auto_805 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_803 ?auto_802 ) ( DOOR-ON ?auto_803 ?auto_800 ) ( OPEN ?auto_803 ) ( ROBOT-IN ?auto_799 ?auto_807 ) ( DOOR-ON ?auto_805 ?auto_807 ) ( DOOR-ON ?auto_805 ?auto_802 ) ( OPEN ?auto_805 ) )
    :subtasks
    ( ( MOVE-TO ?auto_799 ?auto_802 )
      ( MOVE-TO ?auto_799 ?auto_800 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_809 - ROBOT
      ?auto_810 - ROOM
    )
    :vars
    (
      ?auto_813 - DOOR
      ?auto_812 - ROOM
      ?auto_817 - ROOM
      ?auto_818 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_813 ?auto_812 ) ( DOOR-ON ?auto_813 ?auto_810 ) ( OPEN ?auto_813 ) ( ROBOT-IN ?auto_809 ?auto_817 ) ( DOOR-ON ?auto_818 ?auto_817 ) ( DOOR-ON ?auto_818 ?auto_812 ) ( OPEN ?auto_818 ) )
    :subtasks
    ( ( MOVE-TO ?auto_809 ?auto_812 )
      ( MOVE-TO ?auto_809 ?auto_810 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_867 - ROBOT
      ?auto_868 - ROOM
    )
    :vars
    (
      ?auto_874 - DOOR
      ?auto_871 - ROOM
      ?auto_872 - DOOR
      ?auto_870 - ROOM
      ?auto_875 - ROOM
      ?auto_876 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_874 ?auto_871 ) ( DOOR-ON ?auto_874 ?auto_868 ) ( OPEN ?auto_874 ) ( DOOR-ON ?auto_872 ?auto_870 ) ( DOOR-ON ?auto_872 ?auto_871 ) ( OPEN ?auto_872 ) ( ROBOT-IN ?auto_867 ?auto_875 ) ( DOOR-ON ?auto_876 ?auto_875 ) ( DOOR-ON ?auto_876 ?auto_870 ) ( OPEN ?auto_876 ) )
    :subtasks
    ( ( MOVE-TO ?auto_867 ?auto_870 )
      ( MOVE-TO ?auto_867 ?auto_868 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_879 - ROBOT
      ?auto_880 - ROOM
    )
    :vars
    (
      ?auto_886 - DOOR
      ?auto_883 - ROOM
      ?auto_884 - DOOR
      ?auto_882 - ROOM
      ?auto_887 - ROOM
      ?auto_890 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_886 ?auto_883 ) ( DOOR-ON ?auto_886 ?auto_880 ) ( OPEN ?auto_886 ) ( DOOR-ON ?auto_884 ?auto_882 ) ( DOOR-ON ?auto_884 ?auto_883 ) ( OPEN ?auto_884 ) ( ROBOT-IN ?auto_879 ?auto_887 ) ( DOOR-ON ?auto_890 ?auto_887 ) ( DOOR-ON ?auto_890 ?auto_882 ) ( OPEN ?auto_890 ) )
    :subtasks
    ( ( MOVE-TO ?auto_879 ?auto_882 )
      ( MOVE-TO ?auto_879 ?auto_880 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_902 - DOOR
    )
    :vars
    (
      ?auto_903 - ROBOT
      ?auto_904 - ROOM
      ?auto_906 - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?auto_903 ?auto_904 ) ( DOOR-ON ?auto_902 ?auto_904 ) ( LOCKED ?auto_902 ) ( ON-ROBOT ?auto_906 ?auto_903 ) ( KEY ?auto_906 ) )
    :subtasks
    ( ( !OPEN ?auto_903 ?auto_902 ?auto_904 ?auto_906 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_907 - DOOR
    )
    :vars
    (
      ?auto_910 - ROOM
      ?auto_909 - OBJ
      ?auto_908 - ROBOT
      ?auto_915 - ROOM
      ?auto_914 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_907 ?auto_910 ) ( LOCKED ?auto_907 ) ( ON-ROBOT ?auto_909 ?auto_908 ) ( KEY ?auto_909 ) ( ROBOT-IN ?auto_908 ?auto_915 ) ( DOOR-ON ?auto_914 ?auto_915 ) ( DOOR-ON ?auto_914 ?auto_910 ) ( OPEN ?auto_914 ) )
    :subtasks
    ( ( MOVE-TO ?auto_908 ?auto_910 )
      ( OPEN_DOOR ?auto_907 ) )
  )

  ( :method OPEN_DOOR
    :parameters
    (
      ?auto_951 - DOOR
    )
    :vars
    (
      ?auto_954 - ROOM
      ?auto_953 - OBJ
      ?auto_955 - ROBOT
      ?auto_952 - DOOR
      ?auto_957 - ROOM
      ?auto_958 - ROOM
      ?auto_960 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_951 ?auto_954 ) ( LOCKED ?auto_951 ) ( ON-ROBOT ?auto_953 ?auto_955 ) ( KEY ?auto_953 ) ( DOOR-ON ?auto_952 ?auto_957 ) ( DOOR-ON ?auto_952 ?auto_954 ) ( OPEN ?auto_952 ) ( ROBOT-IN ?auto_955 ?auto_958 ) ( DOOR-ON ?auto_960 ?auto_958 ) ( DOOR-ON ?auto_960 ?auto_957 ) ( OPEN ?auto_960 ) )
    :subtasks
    ( ( MOVE-TO ?auto_955 ?auto_957 )
      ( OPEN_DOOR ?auto_951 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1017 - ROBOT
      ?auto_1018 - ROOM
    )
    :vars
    (
      ?auto_1020 - ROOM
      ?auto_1021 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1017 ?auto_1020 ) ( DOOR-ON ?auto_1021 ?auto_1020 ) ( DOOR-ON ?auto_1021 ?auto_1018 ) ( OPEN ?auto_1021 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_1017 ?auto_1020 ?auto_1018 ?auto_1021 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1023 - ROBOT
      ?auto_1024 - ROOM
    )
    :vars
    (
      ?auto_1026 - ROOM
      ?auto_1027 - DOOR
      ?auto_1029 - ROBOT
      ?auto_1031 - ROOM
      ?auto_1030 - OBJ
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1023 ?auto_1026 ) ( DOOR-ON ?auto_1027 ?auto_1026 ) ( DOOR-ON ?auto_1027 ?auto_1024 ) ( ROBOT-IN ?auto_1029 ?auto_1031 ) ( DOOR-ON ?auto_1027 ?auto_1031 ) ( LOCKED ?auto_1027 ) ( ON-ROBOT ?auto_1030 ?auto_1029 ) ( KEY ?auto_1030 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_1027 )
      ( MOVE-TO ?auto_1023 ?auto_1024 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1038 - ROBOT
      ?auto_1034 - ROOM
    )
    :vars
    (
      ?auto_1035 - DOOR
      ?auto_1037 - ROOM
      ?auto_1036 - OBJ
      ?auto_1045 - ROOM
      ?auto_1044 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1035 ?auto_1037 ) ( DOOR-ON ?auto_1035 ?auto_1034 ) ( LOCKED ?auto_1035 ) ( ON-ROBOT ?auto_1036 ?auto_1038 ) ( KEY ?auto_1036 ) ( ROBOT-IN ?auto_1038 ?auto_1045 ) ( DOOR-ON ?auto_1044 ?auto_1045 ) ( DOOR-ON ?auto_1044 ?auto_1037 ) ( OPEN ?auto_1044 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1038 ?auto_1037 )
      ( MOVE-TO ?auto_1038 ?auto_1034 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1091 - ROBOT
      ?auto_1092 - ROOM
    )
    :vars
    (
      ?auto_1096 - DOOR
      ?auto_1098 - ROOM
      ?auto_1095 - OBJ
      ?auto_1097 - DOOR
      ?auto_1099 - ROOM
      ?auto_1100 - ROOM
      ?auto_1102 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1096 ?auto_1098 ) ( DOOR-ON ?auto_1096 ?auto_1092 ) ( LOCKED ?auto_1096 ) ( ON-ROBOT ?auto_1095 ?auto_1091 ) ( KEY ?auto_1095 ) ( DOOR-ON ?auto_1097 ?auto_1099 ) ( DOOR-ON ?auto_1097 ?auto_1098 ) ( OPEN ?auto_1097 ) ( ROBOT-IN ?auto_1091 ?auto_1100 ) ( DOOR-ON ?auto_1102 ?auto_1100 ) ( DOOR-ON ?auto_1102 ?auto_1099 ) ( OPEN ?auto_1102 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1091 ?auto_1099 )
      ( MOVE-TO ?auto_1091 ?auto_1092 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_1171 - ROBOT
      ?auto_1172 - OBJ
    )
    :vars
    (
      ?auto_1174 - ROOM
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1171 ?auto_1174 ) ( OBJ-IN ?auto_1172 ?auto_1174 ) )
    :subtasks
    ( ( !PICK-UP ?auto_1171 ?auto_1172 ?auto_1174 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_1176 - ROBOT
      ?auto_1177 - OBJ
    )
    :vars
    (
      ?auto_1178 - ROOM
      ?auto_1182 - ROOM
      ?auto_1183 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_1177 ?auto_1178 ) ( ROBOT-IN ?auto_1176 ?auto_1182 ) ( DOOR-ON ?auto_1183 ?auto_1182 ) ( DOOR-ON ?auto_1183 ?auto_1178 ) ( OPEN ?auto_1183 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1176 ?auto_1178 )
      ( PICK-UP-OBJ ?auto_1176 ?auto_1177 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_1185 - ROBOT
      ?auto_1186 - OBJ
    )
    :vars
    (
      ?auto_1188 - ROOM
      ?auto_1189 - ROOM
      ?auto_1187 - DOOR
      ?auto_1192 - ROBOT
      ?auto_1194 - ROOM
      ?auto_1193 - OBJ
    )
    :precondition
    ( and ( OBJ-IN ?auto_1186 ?auto_1188 ) ( ROBOT-IN ?auto_1185 ?auto_1189 ) ( DOOR-ON ?auto_1187 ?auto_1189 ) ( DOOR-ON ?auto_1187 ?auto_1188 ) ( ROBOT-IN ?auto_1192 ?auto_1194 ) ( DOOR-ON ?auto_1187 ?auto_1194 ) ( LOCKED ?auto_1187 ) ( ON-ROBOT ?auto_1193 ?auto_1192 ) ( KEY ?auto_1193 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_1187 )
      ( PICK-UP-OBJ ?auto_1185 ?auto_1186 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_1204 - ROBOT
      ?auto_1197 - OBJ
    )
    :vars
    (
      ?auto_1199 - ROOM
      ?auto_1198 - DOOR
      ?auto_1200 - ROOM
      ?auto_1202 - OBJ
      ?auto_1209 - ROOM
      ?auto_1208 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_1197 ?auto_1199 ) ( DOOR-ON ?auto_1198 ?auto_1200 ) ( DOOR-ON ?auto_1198 ?auto_1199 ) ( LOCKED ?auto_1198 ) ( ON-ROBOT ?auto_1202 ?auto_1204 ) ( KEY ?auto_1202 ) ( ROBOT-IN ?auto_1204 ?auto_1209 ) ( DOOR-ON ?auto_1208 ?auto_1209 ) ( DOOR-ON ?auto_1208 ?auto_1200 ) ( OPEN ?auto_1208 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1204 ?auto_1200 )
      ( PICK-UP-OBJ ?auto_1204 ?auto_1197 ) )
  )

  ( :method PICK-UP-OBJ
    :parameters
    (
      ?auto_1260 - ROBOT
      ?auto_1261 - OBJ
    )
    :vars
    (
      ?auto_1268 - ROOM
      ?auto_1264 - DOOR
      ?auto_1269 - ROOM
      ?auto_1267 - OBJ
      ?auto_1263 - DOOR
      ?auto_1262 - ROOM
      ?auto_1270 - ROOM
      ?auto_1272 - DOOR
    )
    :precondition
    ( and ( OBJ-IN ?auto_1261 ?auto_1268 ) ( DOOR-ON ?auto_1264 ?auto_1269 ) ( DOOR-ON ?auto_1264 ?auto_1268 ) ( LOCKED ?auto_1264 ) ( ON-ROBOT ?auto_1267 ?auto_1260 ) ( KEY ?auto_1267 ) ( DOOR-ON ?auto_1263 ?auto_1262 ) ( DOOR-ON ?auto_1263 ?auto_1269 ) ( OPEN ?auto_1263 ) ( ROBOT-IN ?auto_1260 ?auto_1270 ) ( DOOR-ON ?auto_1272 ?auto_1270 ) ( DOOR-ON ?auto_1272 ?auto_1262 ) ( OPEN ?auto_1272 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1260 ?auto_1262 )
      ( PICK-UP-OBJ ?auto_1260 ?auto_1261 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1347 - ROBOT
      ?auto_1348 - ROOM
    )
    :vars
    (
      ?auto_1350 - ROOM
      ?auto_1351 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1347 ?auto_1350 ) ( DOOR-ON ?auto_1351 ?auto_1350 ) ( DOOR-ON ?auto_1351 ?auto_1348 ) ( OPEN ?auto_1351 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_1347 ?auto_1350 ?auto_1348 ?auto_1351 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1359 - ROBOT
      ?auto_1360 - ROOM
    )
    :vars
    (
      ?auto_1362 - DOOR
      ?auto_1361 - ROOM
      ?auto_1366 - ROOM
      ?auto_1367 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1362 ?auto_1361 ) ( DOOR-ON ?auto_1362 ?auto_1360 ) ( OPEN ?auto_1362 ) ( ROBOT-IN ?auto_1359 ?auto_1366 ) ( DOOR-ON ?auto_1367 ?auto_1366 ) ( DOOR-ON ?auto_1367 ?auto_1361 ) ( OPEN ?auto_1367 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1359 ?auto_1361 )
      ( MOVE-TO ?auto_1359 ?auto_1360 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1369 - ROBOT
      ?auto_1370 - ROOM
    )
    :vars
    (
      ?auto_1372 - DOOR
      ?auto_1371 - ROOM
      ?auto_1381 - ROOM
      ?auto_1375 - DOOR
      ?auto_1378 - ROBOT
      ?auto_1377 - ROOM
      ?auto_1376 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_1372 ?auto_1371 ) ( DOOR-ON ?auto_1372 ?auto_1370 ) ( OPEN ?auto_1372 ) ( ROBOT-IN ?auto_1369 ?auto_1381 ) ( DOOR-ON ?auto_1375 ?auto_1381 ) ( DOOR-ON ?auto_1375 ?auto_1371 ) ( ROBOT-IN ?auto_1378 ?auto_1377 ) ( DOOR-ON ?auto_1375 ?auto_1377 ) ( LOCKED ?auto_1375 ) ( ON-ROBOT ?auto_1376 ?auto_1378 ) ( KEY ?auto_1376 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1369 ?auto_1371 )
      ( MOVE-TO ?auto_1369 ?auto_1370 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1398 - ROBOT
      ?auto_1399 - ROOM
    )
    :vars
    (
      ?auto_1401 - DOOR
      ?auto_1404 - ROOM
      ?auto_1402 - DOOR
      ?auto_1400 - ROOM
      ?auto_1408 - ROOM
      ?auto_1406 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1401 ?auto_1404 ) ( DOOR-ON ?auto_1401 ?auto_1399 ) ( OPEN ?auto_1401 ) ( DOOR-ON ?auto_1402 ?auto_1400 ) ( DOOR-ON ?auto_1402 ?auto_1404 ) ( OPEN ?auto_1402 ) ( ROBOT-IN ?auto_1398 ?auto_1408 ) ( DOOR-ON ?auto_1406 ?auto_1408 ) ( DOOR-ON ?auto_1406 ?auto_1400 ) ( OPEN ?auto_1406 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1398 ?auto_1400 )
      ( MOVE-TO ?auto_1398 ?auto_1399 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1410 - ROBOT
      ?auto_1411 - ROOM
    )
    :vars
    (
      ?auto_1413 - DOOR
      ?auto_1416 - ROOM
      ?auto_1414 - DOOR
      ?auto_1412 - ROOM
      ?auto_1420 - ROOM
      ?auto_1421 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1413 ?auto_1416 ) ( DOOR-ON ?auto_1413 ?auto_1411 ) ( OPEN ?auto_1413 ) ( DOOR-ON ?auto_1414 ?auto_1412 ) ( DOOR-ON ?auto_1414 ?auto_1416 ) ( OPEN ?auto_1414 ) ( ROBOT-IN ?auto_1410 ?auto_1420 ) ( DOOR-ON ?auto_1421 ?auto_1420 ) ( DOOR-ON ?auto_1421 ?auto_1412 ) ( OPEN ?auto_1421 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1410 ?auto_1412 )
      ( MOVE-TO ?auto_1410 ?auto_1411 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1482 - ROBOT
      ?auto_1483 - ROOM
    )
    :vars
    (
      ?auto_1491 - DOOR
      ?auto_1485 - ROOM
      ?auto_1484 - DOOR
      ?auto_1487 - ROOM
      ?auto_1489 - DOOR
      ?auto_1490 - ROOM
      ?auto_1492 - ROOM
      ?auto_1493 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1491 ?auto_1485 ) ( DOOR-ON ?auto_1491 ?auto_1483 ) ( OPEN ?auto_1491 ) ( DOOR-ON ?auto_1484 ?auto_1487 ) ( DOOR-ON ?auto_1484 ?auto_1485 ) ( OPEN ?auto_1484 ) ( DOOR-ON ?auto_1489 ?auto_1490 ) ( DOOR-ON ?auto_1489 ?auto_1487 ) ( OPEN ?auto_1489 ) ( ROBOT-IN ?auto_1482 ?auto_1492 ) ( DOOR-ON ?auto_1493 ?auto_1492 ) ( DOOR-ON ?auto_1493 ?auto_1490 ) ( OPEN ?auto_1493 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1482 ?auto_1490 )
      ( MOVE-TO ?auto_1482 ?auto_1483 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1496 - ROBOT
      ?auto_1497 - ROOM
    )
    :vars
    (
      ?auto_1505 - DOOR
      ?auto_1499 - ROOM
      ?auto_1498 - DOOR
      ?auto_1501 - ROOM
      ?auto_1503 - DOOR
      ?auto_1504 - ROOM
      ?auto_1506 - ROOM
      ?auto_1509 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1505 ?auto_1499 ) ( DOOR-ON ?auto_1505 ?auto_1497 ) ( OPEN ?auto_1505 ) ( DOOR-ON ?auto_1498 ?auto_1501 ) ( DOOR-ON ?auto_1498 ?auto_1499 ) ( OPEN ?auto_1498 ) ( DOOR-ON ?auto_1503 ?auto_1504 ) ( DOOR-ON ?auto_1503 ?auto_1501 ) ( OPEN ?auto_1503 ) ( ROBOT-IN ?auto_1496 ?auto_1506 ) ( DOOR-ON ?auto_1509 ?auto_1506 ) ( DOOR-ON ?auto_1509 ?auto_1504 ) ( OPEN ?auto_1509 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1496 ?auto_1504 )
      ( MOVE-TO ?auto_1496 ?auto_1497 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1524 - ROBOT
      ?auto_1525 - ROOM
    )
    :vars
    (
      ?auto_1527 - ROOM
      ?auto_1528 - DOOR
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1524 ?auto_1527 ) ( DOOR-ON ?auto_1528 ?auto_1527 ) ( DOOR-ON ?auto_1528 ?auto_1525 ) ( OPEN ?auto_1528 ) )
    :subtasks
    ( ( !MOVE-TO ?auto_1524 ?auto_1527 ?auto_1525 ?auto_1528 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1530 - ROBOT
      ?auto_1531 - ROOM
    )
    :vars
    (
      ?auto_1535 - DOOR
      ?auto_1534 - ROOM
      ?auto_1537 - ROOM
      ?auto_1538 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1535 ?auto_1534 ) ( DOOR-ON ?auto_1535 ?auto_1531 ) ( OPEN ?auto_1535 ) ( ROBOT-IN ?auto_1530 ?auto_1537 ) ( DOOR-ON ?auto_1538 ?auto_1537 ) ( DOOR-ON ?auto_1538 ?auto_1534 ) ( OPEN ?auto_1538 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1530 ?auto_1534 )
      ( MOVE-TO ?auto_1530 ?auto_1531 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1564 - ROBOT
      ?auto_1565 - ROOM
    )
    :vars
    (
      ?auto_1568 - DOOR
      ?auto_1566 - ROOM
      ?auto_1567 - DOOR
      ?auto_1569 - ROOM
      ?auto_1575 - ROOM
      ?auto_1574 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1568 ?auto_1566 ) ( DOOR-ON ?auto_1568 ?auto_1565 ) ( OPEN ?auto_1568 ) ( DOOR-ON ?auto_1567 ?auto_1569 ) ( DOOR-ON ?auto_1567 ?auto_1566 ) ( OPEN ?auto_1567 ) ( ROBOT-IN ?auto_1564 ?auto_1575 ) ( DOOR-ON ?auto_1574 ?auto_1575 ) ( DOOR-ON ?auto_1574 ?auto_1569 ) ( OPEN ?auto_1574 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1564 ?auto_1569 )
      ( MOVE-TO ?auto_1564 ?auto_1565 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1576 - ROBOT
      ?auto_1577 - ROOM
    )
    :vars
    (
      ?auto_1580 - DOOR
      ?auto_1578 - ROOM
      ?auto_1579 - DOOR
      ?auto_1581 - ROOM
      ?auto_1585 - ROOM
      ?auto_1586 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1580 ?auto_1578 ) ( DOOR-ON ?auto_1580 ?auto_1577 ) ( OPEN ?auto_1580 ) ( DOOR-ON ?auto_1579 ?auto_1581 ) ( DOOR-ON ?auto_1579 ?auto_1578 ) ( OPEN ?auto_1579 ) ( ROBOT-IN ?auto_1576 ?auto_1585 ) ( DOOR-ON ?auto_1586 ?auto_1585 ) ( DOOR-ON ?auto_1586 ?auto_1581 ) ( OPEN ?auto_1586 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1576 ?auto_1581 )
      ( MOVE-TO ?auto_1576 ?auto_1577 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1608 - ROBOT
      ?auto_1609 - ROOM
    )
    :vars
    (
      ?auto_1613 - DOOR
      ?auto_1611 - ROOM
      ?auto_1617 - DOOR
      ?auto_1616 - ROOM
      ?auto_1615 - DOOR
      ?auto_1610 - ROOM
      ?auto_1619 - ROOM
      ?auto_1621 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1613 ?auto_1611 ) ( DOOR-ON ?auto_1613 ?auto_1609 ) ( OPEN ?auto_1613 ) ( DOOR-ON ?auto_1617 ?auto_1616 ) ( DOOR-ON ?auto_1617 ?auto_1611 ) ( OPEN ?auto_1617 ) ( DOOR-ON ?auto_1615 ?auto_1610 ) ( DOOR-ON ?auto_1615 ?auto_1616 ) ( OPEN ?auto_1615 ) ( ROBOT-IN ?auto_1608 ?auto_1619 ) ( DOOR-ON ?auto_1621 ?auto_1619 ) ( DOOR-ON ?auto_1621 ?auto_1610 ) ( OPEN ?auto_1621 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1608 ?auto_1610 )
      ( MOVE-TO ?auto_1608 ?auto_1609 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1622 - ROBOT
      ?auto_1623 - ROOM
    )
    :vars
    (
      ?auto_1627 - DOOR
      ?auto_1625 - ROOM
      ?auto_1631 - DOOR
      ?auto_1630 - ROOM
      ?auto_1629 - DOOR
      ?auto_1624 - ROOM
      ?auto_1633 - ROOM
      ?auto_1635 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1627 ?auto_1625 ) ( DOOR-ON ?auto_1627 ?auto_1623 ) ( OPEN ?auto_1627 ) ( DOOR-ON ?auto_1631 ?auto_1630 ) ( DOOR-ON ?auto_1631 ?auto_1625 ) ( OPEN ?auto_1631 ) ( DOOR-ON ?auto_1629 ?auto_1624 ) ( DOOR-ON ?auto_1629 ?auto_1630 ) ( OPEN ?auto_1629 ) ( ROBOT-IN ?auto_1622 ?auto_1633 ) ( DOOR-ON ?auto_1635 ?auto_1633 ) ( DOOR-ON ?auto_1635 ?auto_1624 ) ( OPEN ?auto_1635 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1622 ?auto_1624 )
      ( MOVE-TO ?auto_1622 ?auto_1623 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1660 - ROBOT
      ?auto_1661 - ROOM
    )
    :vars
    (
      ?auto_1665 - DOOR
      ?auto_1663 - ROOM
      ?auto_1670 - DOOR
      ?auto_1669 - ROOM
      ?auto_1671 - DOOR
      ?auto_1667 - ROOM
      ?auto_1664 - DOOR
      ?auto_1662 - ROOM
      ?auto_1675 - ROOM
      ?auto_1674 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1665 ?auto_1663 ) ( DOOR-ON ?auto_1665 ?auto_1661 ) ( OPEN ?auto_1665 ) ( DOOR-ON ?auto_1670 ?auto_1669 ) ( DOOR-ON ?auto_1670 ?auto_1663 ) ( OPEN ?auto_1670 ) ( DOOR-ON ?auto_1671 ?auto_1667 ) ( DOOR-ON ?auto_1671 ?auto_1669 ) ( OPEN ?auto_1671 ) ( DOOR-ON ?auto_1664 ?auto_1662 ) ( DOOR-ON ?auto_1664 ?auto_1667 ) ( OPEN ?auto_1664 ) ( ROBOT-IN ?auto_1660 ?auto_1675 ) ( DOOR-ON ?auto_1674 ?auto_1675 ) ( DOOR-ON ?auto_1674 ?auto_1662 ) ( OPEN ?auto_1674 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1660 ?auto_1662 )
      ( MOVE-TO ?auto_1660 ?auto_1661 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1676 - ROBOT
      ?auto_1677 - ROOM
    )
    :vars
    (
      ?auto_1681 - DOOR
      ?auto_1679 - ROOM
      ?auto_1686 - DOOR
      ?auto_1685 - ROOM
      ?auto_1687 - DOOR
      ?auto_1683 - ROOM
      ?auto_1680 - DOOR
      ?auto_1678 - ROOM
      ?auto_1692 - ROOM
      ?auto_1689 - DOOR
      ?auto_1694 - ROBOT
      ?auto_1693 - ROOM
      ?auto_1688 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_1681 ?auto_1679 ) ( DOOR-ON ?auto_1681 ?auto_1677 ) ( OPEN ?auto_1681 ) ( DOOR-ON ?auto_1686 ?auto_1685 ) ( DOOR-ON ?auto_1686 ?auto_1679 ) ( OPEN ?auto_1686 ) ( DOOR-ON ?auto_1687 ?auto_1683 ) ( DOOR-ON ?auto_1687 ?auto_1685 ) ( OPEN ?auto_1687 ) ( DOOR-ON ?auto_1680 ?auto_1678 ) ( DOOR-ON ?auto_1680 ?auto_1683 ) ( OPEN ?auto_1680 ) ( ROBOT-IN ?auto_1676 ?auto_1692 ) ( DOOR-ON ?auto_1689 ?auto_1692 ) ( DOOR-ON ?auto_1689 ?auto_1678 ) ( ROBOT-IN ?auto_1694 ?auto_1693 ) ( DOOR-ON ?auto_1689 ?auto_1693 ) ( LOCKED ?auto_1689 ) ( ON-ROBOT ?auto_1688 ?auto_1694 ) ( KEY ?auto_1688 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1676 ?auto_1678 )
      ( MOVE-TO ?auto_1676 ?auto_1677 ) )
  )

  ( :method MOVE-TO
    :parameters
    (
      ?auto_1726 - ROBOT
      ?auto_1727 - ROOM
    )
    :vars
    (
      ?auto_1728 - DOOR
      ?auto_1734 - ROOM
      ?auto_1731 - DOOR
      ?auto_1732 - ROOM
      ?auto_1736 - DOOR
      ?auto_1737 - ROOM
      ?auto_1735 - DOOR
      ?auto_1729 - ROOM
      ?auto_1733 - DOOR
      ?auto_1730 - ROOM
      ?auto_1742 - ROOM
      ?auto_1743 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1728 ?auto_1734 ) ( DOOR-ON ?auto_1728 ?auto_1727 ) ( OPEN ?auto_1728 ) ( DOOR-ON ?auto_1731 ?auto_1732 ) ( DOOR-ON ?auto_1731 ?auto_1734 ) ( OPEN ?auto_1731 ) ( DOOR-ON ?auto_1736 ?auto_1737 ) ( DOOR-ON ?auto_1736 ?auto_1732 ) ( OPEN ?auto_1736 ) ( DOOR-ON ?auto_1735 ?auto_1729 ) ( DOOR-ON ?auto_1735 ?auto_1737 ) ( OPEN ?auto_1735 ) ( DOOR-ON ?auto_1733 ?auto_1730 ) ( DOOR-ON ?auto_1733 ?auto_1729 ) ( OPEN ?auto_1733 ) ( ROBOT-IN ?auto_1726 ?auto_1742 ) ( DOOR-ON ?auto_1743 ?auto_1742 ) ( DOOR-ON ?auto_1743 ?auto_1730 ) ( OPEN ?auto_1743 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1726 ?auto_1730 )
      ( MOVE-TO ?auto_1726 ?auto_1727 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1747 - OBJ
      ?auto_1746 - ROOM
    )
    :vars
    (
      ?auto_1748 - ROBOT
    )
    :precondition
    ( and ( ROBOT-IN ?auto_1748 ?auto_1746 ) ( ON-ROBOT ?auto_1747 ?auto_1748 ) )
    :subtasks
    ( ( !DROP ?auto_1748 ?auto_1747 ?auto_1746 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1752 - OBJ
      ?auto_1751 - ROOM
    )
    :vars
    (
      ?auto_1755 - ROBOT
      ?auto_1758 - ROOM
      ?auto_1759 - DOOR
    )
    :precondition
    ( and ( ON-ROBOT ?auto_1752 ?auto_1755 ) ( ROBOT-IN ?auto_1755 ?auto_1758 ) ( DOOR-ON ?auto_1759 ?auto_1758 ) ( DOOR-ON ?auto_1759 ?auto_1751 ) ( OPEN ?auto_1759 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1755 ?auto_1751 )
      ( DELIVER-PKG ?auto_1752 ?auto_1751 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1761 - OBJ
      ?auto_1760 - ROOM
    )
    :vars
    (
      ?auto_1766 - ROBOT
      ?auto_1763 - DOOR
      ?auto_1764 - ROOM
      ?auto_1768 - ROOM
      ?auto_1769 - DOOR
    )
    :precondition
    ( and ( ON-ROBOT ?auto_1761 ?auto_1766 ) ( DOOR-ON ?auto_1763 ?auto_1764 ) ( DOOR-ON ?auto_1763 ?auto_1760 ) ( OPEN ?auto_1763 ) ( ROBOT-IN ?auto_1766 ?auto_1768 ) ( DOOR-ON ?auto_1769 ?auto_1768 ) ( DOOR-ON ?auto_1769 ?auto_1764 ) ( OPEN ?auto_1769 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1766 ?auto_1764 )
      ( DELIVER-PKG ?auto_1761 ?auto_1760 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1772 - OBJ
      ?auto_1771 - ROOM
    )
    :vars
    (
      ?auto_1773 - DOOR
      ?auto_1775 - ROOM
      ?auto_1774 - ROBOT
      ?auto_1777 - ROOM
      ?auto_1776 - DOOR
      ?auto_1780 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_1773 ?auto_1775 ) ( DOOR-ON ?auto_1773 ?auto_1771 ) ( OPEN ?auto_1773 ) ( ROBOT-IN ?auto_1774 ?auto_1777 ) ( DOOR-ON ?auto_1776 ?auto_1777 ) ( DOOR-ON ?auto_1776 ?auto_1775 ) ( OPEN ?auto_1776 ) ( ROBOT-IN ?auto_1774 ?auto_1780 ) ( OBJ-IN ?auto_1772 ?auto_1780 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_1774 ?auto_1772 )
      ( DELIVER-PKG ?auto_1772 ?auto_1771 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1784 - OBJ
      ?auto_1783 - ROOM
    )
    :vars
    (
      ?auto_1786 - DOOR
      ?auto_1787 - ROOM
      ?auto_1789 - DOOR
      ?auto_1785 - ROOM
      ?auto_1788 - ROBOT
      ?auto_1794 - ROOM
      ?auto_1795 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1786 ?auto_1787 ) ( DOOR-ON ?auto_1786 ?auto_1783 ) ( OPEN ?auto_1786 ) ( DOOR-ON ?auto_1789 ?auto_1785 ) ( DOOR-ON ?auto_1789 ?auto_1787 ) ( OPEN ?auto_1789 ) ( OBJ-IN ?auto_1784 ?auto_1785 ) ( ROBOT-IN ?auto_1788 ?auto_1794 ) ( DOOR-ON ?auto_1795 ?auto_1794 ) ( DOOR-ON ?auto_1795 ?auto_1785 ) ( OPEN ?auto_1795 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1788 ?auto_1785 )
      ( DELIVER-PKG ?auto_1784 ?auto_1783 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1798 - OBJ
      ?auto_1797 - ROOM
    )
    :vars
    (
      ?auto_1800 - DOOR
      ?auto_1799 - ROOM
      ?auto_1807 - DOOR
      ?auto_1803 - ROOM
      ?auto_1802 - ROBOT
      ?auto_1804 - ROOM
      ?auto_1808 - ROBOT
      ?auto_1810 - ROOM
      ?auto_1809 - OBJ
    )
    :precondition
    ( and ( DOOR-ON ?auto_1800 ?auto_1799 ) ( DOOR-ON ?auto_1800 ?auto_1797 ) ( OPEN ?auto_1800 ) ( DOOR-ON ?auto_1807 ?auto_1803 ) ( DOOR-ON ?auto_1807 ?auto_1799 ) ( OBJ-IN ?auto_1798 ?auto_1803 ) ( ROBOT-IN ?auto_1802 ?auto_1804 ) ( DOOR-ON ?auto_1807 ?auto_1804 ) ( ROBOT-IN ?auto_1808 ?auto_1810 ) ( DOOR-ON ?auto_1807 ?auto_1810 ) ( LOCKED ?auto_1807 ) ( ON-ROBOT ?auto_1809 ?auto_1808 ) ( KEY ?auto_1809 ) )
    :subtasks
    ( ( OPEN_DOOR ?auto_1807 )
      ( DELIVER-PKG ?auto_1798 ?auto_1797 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1813 - OBJ
      ?auto_1812 - ROOM
    )
    :vars
    (
      ?auto_1814 - DOOR
      ?auto_1822 - ROOM
      ?auto_1824 - DOOR
      ?auto_1815 - ROOM
      ?auto_1819 - ROOM
      ?auto_1820 - OBJ
      ?auto_1816 - ROBOT
      ?auto_1828 - ROOM
      ?auto_1827 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1814 ?auto_1822 ) ( DOOR-ON ?auto_1814 ?auto_1812 ) ( OPEN ?auto_1814 ) ( DOOR-ON ?auto_1824 ?auto_1815 ) ( DOOR-ON ?auto_1824 ?auto_1822 ) ( OBJ-IN ?auto_1813 ?auto_1815 ) ( DOOR-ON ?auto_1824 ?auto_1819 ) ( LOCKED ?auto_1824 ) ( ON-ROBOT ?auto_1820 ?auto_1816 ) ( KEY ?auto_1820 ) ( ROBOT-IN ?auto_1816 ?auto_1828 ) ( DOOR-ON ?auto_1827 ?auto_1828 ) ( DOOR-ON ?auto_1827 ?auto_1819 ) ( OPEN ?auto_1827 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1816 ?auto_1819 )
      ( DELIVER-PKG ?auto_1813 ?auto_1812 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1895 - OBJ
      ?auto_1894 - ROOM
    )
    :vars
    (
      ?auto_1902 - DOOR
      ?auto_1905 - ROOM
      ?auto_1903 - DOOR
      ?auto_1899 - ROOM
      ?auto_1898 - ROOM
      ?auto_1896 - OBJ
      ?auto_1900 - ROBOT
      ?auto_1897 - DOOR
      ?auto_1904 - ROOM
      ?auto_1907 - ROOM
      ?auto_1909 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1902 ?auto_1905 ) ( DOOR-ON ?auto_1902 ?auto_1894 ) ( OPEN ?auto_1902 ) ( DOOR-ON ?auto_1903 ?auto_1899 ) ( DOOR-ON ?auto_1903 ?auto_1905 ) ( OBJ-IN ?auto_1895 ?auto_1899 ) ( DOOR-ON ?auto_1903 ?auto_1898 ) ( LOCKED ?auto_1903 ) ( ON-ROBOT ?auto_1896 ?auto_1900 ) ( KEY ?auto_1896 ) ( DOOR-ON ?auto_1897 ?auto_1904 ) ( DOOR-ON ?auto_1897 ?auto_1898 ) ( OPEN ?auto_1897 ) ( ROBOT-IN ?auto_1900 ?auto_1907 ) ( DOOR-ON ?auto_1909 ?auto_1907 ) ( DOOR-ON ?auto_1909 ?auto_1904 ) ( OPEN ?auto_1909 ) )
    :subtasks
    ( ( MOVE-TO ?auto_1900 ?auto_1904 )
      ( DELIVER-PKG ?auto_1895 ?auto_1894 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1972 - OBJ
      ?auto_1971 - ROOM
    )
    :vars
    (
      ?auto_1973 - DOOR
      ?auto_1984 - ROOM
      ?auto_1982 - DOOR
      ?auto_1975 - ROOM
      ?auto_1979 - ROOM
      ?auto_1981 - OBJ
      ?auto_1974 - DOOR
      ?auto_1983 - ROOM
      ?auto_1977 - ROBOT
      ?auto_1976 - ROOM
      ?auto_1985 - DOOR
      ?auto_1986 - ROOM
    )
    :precondition
    ( and ( DOOR-ON ?auto_1973 ?auto_1984 ) ( DOOR-ON ?auto_1973 ?auto_1971 ) ( OPEN ?auto_1973 ) ( DOOR-ON ?auto_1982 ?auto_1975 ) ( DOOR-ON ?auto_1982 ?auto_1984 ) ( OBJ-IN ?auto_1972 ?auto_1975 ) ( DOOR-ON ?auto_1982 ?auto_1979 ) ( LOCKED ?auto_1982 ) ( KEY ?auto_1981 ) ( DOOR-ON ?auto_1974 ?auto_1983 ) ( DOOR-ON ?auto_1974 ?auto_1979 ) ( OPEN ?auto_1974 ) ( ROBOT-IN ?auto_1977 ?auto_1976 ) ( DOOR-ON ?auto_1985 ?auto_1976 ) ( DOOR-ON ?auto_1985 ?auto_1983 ) ( OPEN ?auto_1985 ) ( ROBOT-IN ?auto_1977 ?auto_1986 ) ( OBJ-IN ?auto_1981 ?auto_1986 ) )
    :subtasks
    ( ( PICK-UP-OBJ ?auto_1977 ?auto_1981 )
      ( DELIVER-PKG ?auto_1972 ?auto_1971 ) )
  )

  ( :method DELIVER-PKG
    :parameters
    (
      ?auto_1990 - OBJ
      ?auto_1989 - ROOM
    )
    :vars
    (
      ?auto_1998 - DOOR
      ?auto_1991 - ROOM
      ?auto_1996 - DOOR
      ?auto_1992 - ROOM
      ?auto_2004 - ROOM
      ?auto_1993 - OBJ
      ?auto_1999 - DOOR
      ?auto_1994 - ROOM
      ?auto_1997 - DOOR
      ?auto_2000 - ROOM
      ?auto_2001 - ROBOT
      ?auto_2007 - ROOM
      ?auto_2008 - DOOR
    )
    :precondition
    ( and ( DOOR-ON ?auto_1998 ?auto_1991 ) ( DOOR-ON ?auto_1998 ?auto_1989 ) ( OPEN ?auto_1998 ) ( DOOR-ON ?auto_1996 ?auto_1992 ) ( DOOR-ON ?auto_1996 ?auto_1991 ) ( OBJ-IN ?auto_1990 ?auto_1992 ) ( DOOR-ON ?auto_1996 ?auto_2004 ) ( LOCKED ?auto_1996 ) ( KEY ?auto_1993 ) ( DOOR-ON ?auto_1999 ?auto_1994 ) ( DOOR-ON ?auto_1999 ?auto_2004 ) ( OPEN ?auto_1999 ) ( DOOR-ON ?auto_1997 ?auto_2000 ) ( DOOR-ON ?auto_1997 ?auto_1994 ) ( OPEN ?auto_1997 ) ( OBJ-IN ?auto_1993 ?auto_2000 ) ( ROBOT-IN ?auto_2001 ?auto_2007 ) ( DOOR-ON ?auto_2008 ?auto_2007 ) ( DOOR-ON ?auto_2008 ?auto_2000 ) ( OPEN ?auto_2008 ) )
    :subtasks
    ( ( MOVE-TO ?auto_2001 ?auto_2000 )
      ( DELIVER-PKG ?auto_1990 ?auto_1989 ) )
  )

)

