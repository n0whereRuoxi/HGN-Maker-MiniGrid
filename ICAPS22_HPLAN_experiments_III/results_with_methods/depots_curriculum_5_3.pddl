( define ( domain depots )
  ( :requirements :strips :typing :equality :htn )
  ( :types hoist place surface truck )
  ( :predicates
    ( SURFACE-AT ?a - SURFACE ?b - PLACE )
    ( ON ?c - SURFACE ?d - SURFACE )
    ( IN ?e - SURFACE ?f - TRUCK )
    ( LIFTING ?g - HOIST ?h - SURFACE )
    ( AVAILABLE ?i - HOIST )
    ( CLEAR ?j - SURFACE )
    ( IS-CRATE ?k - SURFACE )
    ( HOIST-AT ?l - HOIST ?m - PLACE )
    ( TRUCK-AT ?n - TRUCK ?o - PLACE )
  )
  ( :action !DRIVE
    :parameters
    (
      ?truck - TRUCK
      ?old - PLACE
      ?new - PLACE
    )
    :precondition
    ( and ( TRUCK-AT ?truck ?old ) ( not ( = ?old ?new ) ) )
    :effect
    ( and ( not ( TRUCK-AT ?truck ?old ) ) ( TRUCK-AT ?truck ?new ) )
  )
  ( :action !LIFT
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( ON ?crate ?below ) ( CLEAR ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( SURFACE-AT ?crate ?here ) ) ( not ( CLEAR ?crate ) ) ( not ( AVAILABLE ?hoist ) ) ( not ( ON ?crate ?below ) ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) )
  )
  ( :action !DROP
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?below - SURFACE
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( SURFACE-AT ?below ?here ) ( CLEAR ?below ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( not ( CLEAR ?below ) ) ( AVAILABLE ?hoist ) ( SURFACE-AT ?crate ?here ) ( CLEAR ?crate ) ( ON ?crate ?below ) )
  )
  ( :action !LOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( LIFTING ?hoist ?crate ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( LIFTING ?hoist ?crate ) ) ( IN ?crate ?truck ) ( AVAILABLE ?hoist ) )
  )
  ( :action !UNLOAD
    :parameters
    (
      ?hoist - HOIST
      ?crate - SURFACE
      ?truck - TRUCK
      ?here - PLACE
    )
    :precondition
    ( and ( HOIST-AT ?hoist ?here ) ( TRUCK-AT ?truck ?here ) ( AVAILABLE ?hoist ) ( IN ?crate ?truck ) ( IS-CRATE ?crate ) )
    :effect
    ( and ( not ( IN ?crate ?truck ) ) ( not ( AVAILABLE ?hoist ) ) ( LIFTING ?hoist ?crate ) )
  )
  ( :method MAKE-ON
    :parameters
    (
      ?ab - SURFACE
      ?be - SURFACE
    )
    :precondition
    ( and ( ON ?ab ?be ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( CLEAR ?c1 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-2CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( CLEAR ?c2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-3CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( CLEAR ?c3 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-4CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( CLEAR ?c4 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-5CRATE-VERIFY
    :parameters
    (
      ?p0 - SURFACE
      ?c1 - SURFACE
      ?c2 - SURFACE
      ?c3 - SURFACE
      ?c4 - SURFACE
      ?c5 - SURFACE
    )
    :precondition
    ( and ( ON ?c1 ?p0 ) ( ON ?c2 ?c1 ) ( ON ?c3 ?c2 ) ( ON ?c4 ?c3 ) ( ON ?c5 ?c4 ) ( CLEAR ?c5 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1374 - SURFACE
      ?auto_1375 - SURFACE
    )
    :vars
    (
      ?auto_1376 - HOIST
      ?auto_1377 - PLACE
      ?auto_1379 - PLACE
      ?auto_1380 - HOIST
      ?auto_1381 - SURFACE
      ?auto_1378 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1376 ?auto_1377 ) ( SURFACE-AT ?auto_1374 ?auto_1377 ) ( CLEAR ?auto_1374 ) ( IS-CRATE ?auto_1375 ) ( AVAILABLE ?auto_1376 ) ( not ( = ?auto_1379 ?auto_1377 ) ) ( HOIST-AT ?auto_1380 ?auto_1379 ) ( AVAILABLE ?auto_1380 ) ( SURFACE-AT ?auto_1375 ?auto_1379 ) ( ON ?auto_1375 ?auto_1381 ) ( CLEAR ?auto_1375 ) ( TRUCK-AT ?auto_1378 ?auto_1377 ) ( not ( = ?auto_1374 ?auto_1375 ) ) ( not ( = ?auto_1374 ?auto_1381 ) ) ( not ( = ?auto_1375 ?auto_1381 ) ) ( not ( = ?auto_1376 ?auto_1380 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1378 ?auto_1377 ?auto_1379 )
      ( !LIFT ?auto_1380 ?auto_1375 ?auto_1381 ?auto_1379 )
      ( !LOAD ?auto_1380 ?auto_1375 ?auto_1378 ?auto_1379 )
      ( !DRIVE ?auto_1378 ?auto_1379 ?auto_1377 )
      ( !UNLOAD ?auto_1376 ?auto_1375 ?auto_1378 ?auto_1377 )
      ( !DROP ?auto_1376 ?auto_1375 ?auto_1374 ?auto_1377 )
      ( MAKE-1CRATE-VERIFY ?auto_1374 ?auto_1375 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1384 - SURFACE
      ?auto_1385 - SURFACE
    )
    :vars
    (
      ?auto_1386 - HOIST
      ?auto_1387 - PLACE
      ?auto_1389 - PLACE
      ?auto_1390 - HOIST
      ?auto_1391 - SURFACE
      ?auto_1388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1386 ?auto_1387 ) ( SURFACE-AT ?auto_1384 ?auto_1387 ) ( CLEAR ?auto_1384 ) ( IS-CRATE ?auto_1385 ) ( AVAILABLE ?auto_1386 ) ( not ( = ?auto_1389 ?auto_1387 ) ) ( HOIST-AT ?auto_1390 ?auto_1389 ) ( AVAILABLE ?auto_1390 ) ( SURFACE-AT ?auto_1385 ?auto_1389 ) ( ON ?auto_1385 ?auto_1391 ) ( CLEAR ?auto_1385 ) ( TRUCK-AT ?auto_1388 ?auto_1387 ) ( not ( = ?auto_1384 ?auto_1385 ) ) ( not ( = ?auto_1384 ?auto_1391 ) ) ( not ( = ?auto_1385 ?auto_1391 ) ) ( not ( = ?auto_1386 ?auto_1390 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1388 ?auto_1387 ?auto_1389 )
      ( !LIFT ?auto_1390 ?auto_1385 ?auto_1391 ?auto_1389 )
      ( !LOAD ?auto_1390 ?auto_1385 ?auto_1388 ?auto_1389 )
      ( !DRIVE ?auto_1388 ?auto_1389 ?auto_1387 )
      ( !UNLOAD ?auto_1386 ?auto_1385 ?auto_1388 ?auto_1387 )
      ( !DROP ?auto_1386 ?auto_1385 ?auto_1384 ?auto_1387 )
      ( MAKE-1CRATE-VERIFY ?auto_1384 ?auto_1385 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1395 - SURFACE
      ?auto_1396 - SURFACE
      ?auto_1397 - SURFACE
    )
    :vars
    (
      ?auto_1399 - HOIST
      ?auto_1401 - PLACE
      ?auto_1403 - PLACE
      ?auto_1400 - HOIST
      ?auto_1402 - SURFACE
      ?auto_1406 - PLACE
      ?auto_1404 - HOIST
      ?auto_1405 - SURFACE
      ?auto_1398 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1399 ?auto_1401 ) ( IS-CRATE ?auto_1397 ) ( not ( = ?auto_1403 ?auto_1401 ) ) ( HOIST-AT ?auto_1400 ?auto_1403 ) ( AVAILABLE ?auto_1400 ) ( SURFACE-AT ?auto_1397 ?auto_1403 ) ( ON ?auto_1397 ?auto_1402 ) ( CLEAR ?auto_1397 ) ( not ( = ?auto_1396 ?auto_1397 ) ) ( not ( = ?auto_1396 ?auto_1402 ) ) ( not ( = ?auto_1397 ?auto_1402 ) ) ( not ( = ?auto_1399 ?auto_1400 ) ) ( SURFACE-AT ?auto_1395 ?auto_1401 ) ( CLEAR ?auto_1395 ) ( IS-CRATE ?auto_1396 ) ( AVAILABLE ?auto_1399 ) ( not ( = ?auto_1406 ?auto_1401 ) ) ( HOIST-AT ?auto_1404 ?auto_1406 ) ( AVAILABLE ?auto_1404 ) ( SURFACE-AT ?auto_1396 ?auto_1406 ) ( ON ?auto_1396 ?auto_1405 ) ( CLEAR ?auto_1396 ) ( TRUCK-AT ?auto_1398 ?auto_1401 ) ( not ( = ?auto_1395 ?auto_1396 ) ) ( not ( = ?auto_1395 ?auto_1405 ) ) ( not ( = ?auto_1396 ?auto_1405 ) ) ( not ( = ?auto_1399 ?auto_1404 ) ) ( not ( = ?auto_1395 ?auto_1397 ) ) ( not ( = ?auto_1395 ?auto_1402 ) ) ( not ( = ?auto_1397 ?auto_1405 ) ) ( not ( = ?auto_1403 ?auto_1406 ) ) ( not ( = ?auto_1400 ?auto_1404 ) ) ( not ( = ?auto_1402 ?auto_1405 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1395 ?auto_1396 )
      ( MAKE-1CRATE ?auto_1396 ?auto_1397 )
      ( MAKE-2CRATE-VERIFY ?auto_1395 ?auto_1396 ?auto_1397 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1409 - SURFACE
      ?auto_1410 - SURFACE
    )
    :vars
    (
      ?auto_1411 - HOIST
      ?auto_1412 - PLACE
      ?auto_1414 - PLACE
      ?auto_1415 - HOIST
      ?auto_1416 - SURFACE
      ?auto_1413 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1411 ?auto_1412 ) ( SURFACE-AT ?auto_1409 ?auto_1412 ) ( CLEAR ?auto_1409 ) ( IS-CRATE ?auto_1410 ) ( AVAILABLE ?auto_1411 ) ( not ( = ?auto_1414 ?auto_1412 ) ) ( HOIST-AT ?auto_1415 ?auto_1414 ) ( AVAILABLE ?auto_1415 ) ( SURFACE-AT ?auto_1410 ?auto_1414 ) ( ON ?auto_1410 ?auto_1416 ) ( CLEAR ?auto_1410 ) ( TRUCK-AT ?auto_1413 ?auto_1412 ) ( not ( = ?auto_1409 ?auto_1410 ) ) ( not ( = ?auto_1409 ?auto_1416 ) ) ( not ( = ?auto_1410 ?auto_1416 ) ) ( not ( = ?auto_1411 ?auto_1415 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1413 ?auto_1412 ?auto_1414 )
      ( !LIFT ?auto_1415 ?auto_1410 ?auto_1416 ?auto_1414 )
      ( !LOAD ?auto_1415 ?auto_1410 ?auto_1413 ?auto_1414 )
      ( !DRIVE ?auto_1413 ?auto_1414 ?auto_1412 )
      ( !UNLOAD ?auto_1411 ?auto_1410 ?auto_1413 ?auto_1412 )
      ( !DROP ?auto_1411 ?auto_1410 ?auto_1409 ?auto_1412 )
      ( MAKE-1CRATE-VERIFY ?auto_1409 ?auto_1410 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1421 - SURFACE
      ?auto_1422 - SURFACE
      ?auto_1423 - SURFACE
      ?auto_1424 - SURFACE
    )
    :vars
    (
      ?auto_1430 - HOIST
      ?auto_1427 - PLACE
      ?auto_1428 - PLACE
      ?auto_1426 - HOIST
      ?auto_1425 - SURFACE
      ?auto_1431 - PLACE
      ?auto_1433 - HOIST
      ?auto_1432 - SURFACE
      ?auto_1434 - SURFACE
      ?auto_1429 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1430 ?auto_1427 ) ( IS-CRATE ?auto_1424 ) ( not ( = ?auto_1428 ?auto_1427 ) ) ( HOIST-AT ?auto_1426 ?auto_1428 ) ( SURFACE-AT ?auto_1424 ?auto_1428 ) ( ON ?auto_1424 ?auto_1425 ) ( CLEAR ?auto_1424 ) ( not ( = ?auto_1423 ?auto_1424 ) ) ( not ( = ?auto_1423 ?auto_1425 ) ) ( not ( = ?auto_1424 ?auto_1425 ) ) ( not ( = ?auto_1430 ?auto_1426 ) ) ( IS-CRATE ?auto_1423 ) ( not ( = ?auto_1431 ?auto_1427 ) ) ( HOIST-AT ?auto_1433 ?auto_1431 ) ( AVAILABLE ?auto_1433 ) ( SURFACE-AT ?auto_1423 ?auto_1431 ) ( ON ?auto_1423 ?auto_1432 ) ( CLEAR ?auto_1423 ) ( not ( = ?auto_1422 ?auto_1423 ) ) ( not ( = ?auto_1422 ?auto_1432 ) ) ( not ( = ?auto_1423 ?auto_1432 ) ) ( not ( = ?auto_1430 ?auto_1433 ) ) ( SURFACE-AT ?auto_1421 ?auto_1427 ) ( CLEAR ?auto_1421 ) ( IS-CRATE ?auto_1422 ) ( AVAILABLE ?auto_1430 ) ( AVAILABLE ?auto_1426 ) ( SURFACE-AT ?auto_1422 ?auto_1428 ) ( ON ?auto_1422 ?auto_1434 ) ( CLEAR ?auto_1422 ) ( TRUCK-AT ?auto_1429 ?auto_1427 ) ( not ( = ?auto_1421 ?auto_1422 ) ) ( not ( = ?auto_1421 ?auto_1434 ) ) ( not ( = ?auto_1422 ?auto_1434 ) ) ( not ( = ?auto_1421 ?auto_1423 ) ) ( not ( = ?auto_1421 ?auto_1432 ) ) ( not ( = ?auto_1423 ?auto_1434 ) ) ( not ( = ?auto_1431 ?auto_1428 ) ) ( not ( = ?auto_1433 ?auto_1426 ) ) ( not ( = ?auto_1432 ?auto_1434 ) ) ( not ( = ?auto_1421 ?auto_1424 ) ) ( not ( = ?auto_1421 ?auto_1425 ) ) ( not ( = ?auto_1422 ?auto_1424 ) ) ( not ( = ?auto_1422 ?auto_1425 ) ) ( not ( = ?auto_1424 ?auto_1432 ) ) ( not ( = ?auto_1424 ?auto_1434 ) ) ( not ( = ?auto_1425 ?auto_1432 ) ) ( not ( = ?auto_1425 ?auto_1434 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1421 ?auto_1422 ?auto_1423 )
      ( MAKE-1CRATE ?auto_1423 ?auto_1424 )
      ( MAKE-3CRATE-VERIFY ?auto_1421 ?auto_1422 ?auto_1423 ?auto_1424 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1437 - SURFACE
      ?auto_1438 - SURFACE
    )
    :vars
    (
      ?auto_1439 - HOIST
      ?auto_1440 - PLACE
      ?auto_1442 - PLACE
      ?auto_1443 - HOIST
      ?auto_1444 - SURFACE
      ?auto_1441 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1439 ?auto_1440 ) ( SURFACE-AT ?auto_1437 ?auto_1440 ) ( CLEAR ?auto_1437 ) ( IS-CRATE ?auto_1438 ) ( AVAILABLE ?auto_1439 ) ( not ( = ?auto_1442 ?auto_1440 ) ) ( HOIST-AT ?auto_1443 ?auto_1442 ) ( AVAILABLE ?auto_1443 ) ( SURFACE-AT ?auto_1438 ?auto_1442 ) ( ON ?auto_1438 ?auto_1444 ) ( CLEAR ?auto_1438 ) ( TRUCK-AT ?auto_1441 ?auto_1440 ) ( not ( = ?auto_1437 ?auto_1438 ) ) ( not ( = ?auto_1437 ?auto_1444 ) ) ( not ( = ?auto_1438 ?auto_1444 ) ) ( not ( = ?auto_1439 ?auto_1443 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1441 ?auto_1440 ?auto_1442 )
      ( !LIFT ?auto_1443 ?auto_1438 ?auto_1444 ?auto_1442 )
      ( !LOAD ?auto_1443 ?auto_1438 ?auto_1441 ?auto_1442 )
      ( !DRIVE ?auto_1441 ?auto_1442 ?auto_1440 )
      ( !UNLOAD ?auto_1439 ?auto_1438 ?auto_1441 ?auto_1440 )
      ( !DROP ?auto_1439 ?auto_1438 ?auto_1437 ?auto_1440 )
      ( MAKE-1CRATE-VERIFY ?auto_1437 ?auto_1438 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1450 - SURFACE
      ?auto_1451 - SURFACE
      ?auto_1452 - SURFACE
      ?auto_1453 - SURFACE
      ?auto_1454 - SURFACE
    )
    :vars
    (
      ?auto_1458 - HOIST
      ?auto_1455 - PLACE
      ?auto_1459 - PLACE
      ?auto_1457 - HOIST
      ?auto_1456 - SURFACE
      ?auto_1465 - SURFACE
      ?auto_1463 - PLACE
      ?auto_1462 - HOIST
      ?auto_1464 - SURFACE
      ?auto_1461 - SURFACE
      ?auto_1460 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1458 ?auto_1455 ) ( IS-CRATE ?auto_1454 ) ( not ( = ?auto_1459 ?auto_1455 ) ) ( HOIST-AT ?auto_1457 ?auto_1459 ) ( SURFACE-AT ?auto_1454 ?auto_1459 ) ( ON ?auto_1454 ?auto_1456 ) ( CLEAR ?auto_1454 ) ( not ( = ?auto_1453 ?auto_1454 ) ) ( not ( = ?auto_1453 ?auto_1456 ) ) ( not ( = ?auto_1454 ?auto_1456 ) ) ( not ( = ?auto_1458 ?auto_1457 ) ) ( IS-CRATE ?auto_1453 ) ( SURFACE-AT ?auto_1453 ?auto_1459 ) ( ON ?auto_1453 ?auto_1465 ) ( CLEAR ?auto_1453 ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1465 ) ) ( not ( = ?auto_1453 ?auto_1465 ) ) ( IS-CRATE ?auto_1452 ) ( not ( = ?auto_1463 ?auto_1455 ) ) ( HOIST-AT ?auto_1462 ?auto_1463 ) ( AVAILABLE ?auto_1462 ) ( SURFACE-AT ?auto_1452 ?auto_1463 ) ( ON ?auto_1452 ?auto_1464 ) ( CLEAR ?auto_1452 ) ( not ( = ?auto_1451 ?auto_1452 ) ) ( not ( = ?auto_1451 ?auto_1464 ) ) ( not ( = ?auto_1452 ?auto_1464 ) ) ( not ( = ?auto_1458 ?auto_1462 ) ) ( SURFACE-AT ?auto_1450 ?auto_1455 ) ( CLEAR ?auto_1450 ) ( IS-CRATE ?auto_1451 ) ( AVAILABLE ?auto_1458 ) ( AVAILABLE ?auto_1457 ) ( SURFACE-AT ?auto_1451 ?auto_1459 ) ( ON ?auto_1451 ?auto_1461 ) ( CLEAR ?auto_1451 ) ( TRUCK-AT ?auto_1460 ?auto_1455 ) ( not ( = ?auto_1450 ?auto_1451 ) ) ( not ( = ?auto_1450 ?auto_1461 ) ) ( not ( = ?auto_1451 ?auto_1461 ) ) ( not ( = ?auto_1450 ?auto_1452 ) ) ( not ( = ?auto_1450 ?auto_1464 ) ) ( not ( = ?auto_1452 ?auto_1461 ) ) ( not ( = ?auto_1463 ?auto_1459 ) ) ( not ( = ?auto_1462 ?auto_1457 ) ) ( not ( = ?auto_1464 ?auto_1461 ) ) ( not ( = ?auto_1450 ?auto_1453 ) ) ( not ( = ?auto_1450 ?auto_1465 ) ) ( not ( = ?auto_1451 ?auto_1453 ) ) ( not ( = ?auto_1451 ?auto_1465 ) ) ( not ( = ?auto_1453 ?auto_1464 ) ) ( not ( = ?auto_1453 ?auto_1461 ) ) ( not ( = ?auto_1465 ?auto_1464 ) ) ( not ( = ?auto_1465 ?auto_1461 ) ) ( not ( = ?auto_1450 ?auto_1454 ) ) ( not ( = ?auto_1450 ?auto_1456 ) ) ( not ( = ?auto_1451 ?auto_1454 ) ) ( not ( = ?auto_1451 ?auto_1456 ) ) ( not ( = ?auto_1452 ?auto_1454 ) ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( not ( = ?auto_1454 ?auto_1465 ) ) ( not ( = ?auto_1454 ?auto_1464 ) ) ( not ( = ?auto_1454 ?auto_1461 ) ) ( not ( = ?auto_1456 ?auto_1465 ) ) ( not ( = ?auto_1456 ?auto_1464 ) ) ( not ( = ?auto_1456 ?auto_1461 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1450 ?auto_1451 ?auto_1452 ?auto_1453 )
      ( MAKE-1CRATE ?auto_1453 ?auto_1454 )
      ( MAKE-4CRATE-VERIFY ?auto_1450 ?auto_1451 ?auto_1452 ?auto_1453 ?auto_1454 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1468 - SURFACE
      ?auto_1469 - SURFACE
    )
    :vars
    (
      ?auto_1470 - HOIST
      ?auto_1471 - PLACE
      ?auto_1473 - PLACE
      ?auto_1474 - HOIST
      ?auto_1475 - SURFACE
      ?auto_1472 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1470 ?auto_1471 ) ( SURFACE-AT ?auto_1468 ?auto_1471 ) ( CLEAR ?auto_1468 ) ( IS-CRATE ?auto_1469 ) ( AVAILABLE ?auto_1470 ) ( not ( = ?auto_1473 ?auto_1471 ) ) ( HOIST-AT ?auto_1474 ?auto_1473 ) ( AVAILABLE ?auto_1474 ) ( SURFACE-AT ?auto_1469 ?auto_1473 ) ( ON ?auto_1469 ?auto_1475 ) ( CLEAR ?auto_1469 ) ( TRUCK-AT ?auto_1472 ?auto_1471 ) ( not ( = ?auto_1468 ?auto_1469 ) ) ( not ( = ?auto_1468 ?auto_1475 ) ) ( not ( = ?auto_1469 ?auto_1475 ) ) ( not ( = ?auto_1470 ?auto_1474 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1472 ?auto_1471 ?auto_1473 )
      ( !LIFT ?auto_1474 ?auto_1469 ?auto_1475 ?auto_1473 )
      ( !LOAD ?auto_1474 ?auto_1469 ?auto_1472 ?auto_1473 )
      ( !DRIVE ?auto_1472 ?auto_1473 ?auto_1471 )
      ( !UNLOAD ?auto_1470 ?auto_1469 ?auto_1472 ?auto_1471 )
      ( !DROP ?auto_1470 ?auto_1469 ?auto_1468 ?auto_1471 )
      ( MAKE-1CRATE-VERIFY ?auto_1468 ?auto_1469 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1482 - SURFACE
      ?auto_1483 - SURFACE
      ?auto_1484 - SURFACE
      ?auto_1485 - SURFACE
      ?auto_1486 - SURFACE
      ?auto_1487 - SURFACE
    )
    :vars
    (
      ?auto_1488 - HOIST
      ?auto_1492 - PLACE
      ?auto_1493 - PLACE
      ?auto_1491 - HOIST
      ?auto_1490 - SURFACE
      ?auto_1498 - PLACE
      ?auto_1494 - HOIST
      ?auto_1495 - SURFACE
      ?auto_1497 - SURFACE
      ?auto_1496 - SURFACE
      ?auto_1499 - SURFACE
      ?auto_1489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1488 ?auto_1492 ) ( IS-CRATE ?auto_1487 ) ( not ( = ?auto_1493 ?auto_1492 ) ) ( HOIST-AT ?auto_1491 ?auto_1493 ) ( SURFACE-AT ?auto_1487 ?auto_1493 ) ( ON ?auto_1487 ?auto_1490 ) ( CLEAR ?auto_1487 ) ( not ( = ?auto_1486 ?auto_1487 ) ) ( not ( = ?auto_1486 ?auto_1490 ) ) ( not ( = ?auto_1487 ?auto_1490 ) ) ( not ( = ?auto_1488 ?auto_1491 ) ) ( IS-CRATE ?auto_1486 ) ( not ( = ?auto_1498 ?auto_1492 ) ) ( HOIST-AT ?auto_1494 ?auto_1498 ) ( SURFACE-AT ?auto_1486 ?auto_1498 ) ( ON ?auto_1486 ?auto_1495 ) ( CLEAR ?auto_1486 ) ( not ( = ?auto_1485 ?auto_1486 ) ) ( not ( = ?auto_1485 ?auto_1495 ) ) ( not ( = ?auto_1486 ?auto_1495 ) ) ( not ( = ?auto_1488 ?auto_1494 ) ) ( IS-CRATE ?auto_1485 ) ( SURFACE-AT ?auto_1485 ?auto_1498 ) ( ON ?auto_1485 ?auto_1497 ) ( CLEAR ?auto_1485 ) ( not ( = ?auto_1484 ?auto_1485 ) ) ( not ( = ?auto_1484 ?auto_1497 ) ) ( not ( = ?auto_1485 ?auto_1497 ) ) ( IS-CRATE ?auto_1484 ) ( AVAILABLE ?auto_1491 ) ( SURFACE-AT ?auto_1484 ?auto_1493 ) ( ON ?auto_1484 ?auto_1496 ) ( CLEAR ?auto_1484 ) ( not ( = ?auto_1483 ?auto_1484 ) ) ( not ( = ?auto_1483 ?auto_1496 ) ) ( not ( = ?auto_1484 ?auto_1496 ) ) ( SURFACE-AT ?auto_1482 ?auto_1492 ) ( CLEAR ?auto_1482 ) ( IS-CRATE ?auto_1483 ) ( AVAILABLE ?auto_1488 ) ( AVAILABLE ?auto_1494 ) ( SURFACE-AT ?auto_1483 ?auto_1498 ) ( ON ?auto_1483 ?auto_1499 ) ( CLEAR ?auto_1483 ) ( TRUCK-AT ?auto_1489 ?auto_1492 ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1499 ) ) ( not ( = ?auto_1483 ?auto_1499 ) ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( not ( = ?auto_1482 ?auto_1496 ) ) ( not ( = ?auto_1484 ?auto_1499 ) ) ( not ( = ?auto_1493 ?auto_1498 ) ) ( not ( = ?auto_1491 ?auto_1494 ) ) ( not ( = ?auto_1496 ?auto_1499 ) ) ( not ( = ?auto_1482 ?auto_1485 ) ) ( not ( = ?auto_1482 ?auto_1497 ) ) ( not ( = ?auto_1483 ?auto_1485 ) ) ( not ( = ?auto_1483 ?auto_1497 ) ) ( not ( = ?auto_1485 ?auto_1496 ) ) ( not ( = ?auto_1485 ?auto_1499 ) ) ( not ( = ?auto_1497 ?auto_1496 ) ) ( not ( = ?auto_1497 ?auto_1499 ) ) ( not ( = ?auto_1482 ?auto_1486 ) ) ( not ( = ?auto_1482 ?auto_1495 ) ) ( not ( = ?auto_1483 ?auto_1486 ) ) ( not ( = ?auto_1483 ?auto_1495 ) ) ( not ( = ?auto_1484 ?auto_1486 ) ) ( not ( = ?auto_1484 ?auto_1495 ) ) ( not ( = ?auto_1486 ?auto_1497 ) ) ( not ( = ?auto_1486 ?auto_1496 ) ) ( not ( = ?auto_1486 ?auto_1499 ) ) ( not ( = ?auto_1495 ?auto_1497 ) ) ( not ( = ?auto_1495 ?auto_1496 ) ) ( not ( = ?auto_1495 ?auto_1499 ) ) ( not ( = ?auto_1482 ?auto_1487 ) ) ( not ( = ?auto_1482 ?auto_1490 ) ) ( not ( = ?auto_1483 ?auto_1487 ) ) ( not ( = ?auto_1483 ?auto_1490 ) ) ( not ( = ?auto_1484 ?auto_1487 ) ) ( not ( = ?auto_1484 ?auto_1490 ) ) ( not ( = ?auto_1485 ?auto_1487 ) ) ( not ( = ?auto_1485 ?auto_1490 ) ) ( not ( = ?auto_1487 ?auto_1495 ) ) ( not ( = ?auto_1487 ?auto_1497 ) ) ( not ( = ?auto_1487 ?auto_1496 ) ) ( not ( = ?auto_1487 ?auto_1499 ) ) ( not ( = ?auto_1490 ?auto_1495 ) ) ( not ( = ?auto_1490 ?auto_1497 ) ) ( not ( = ?auto_1490 ?auto_1496 ) ) ( not ( = ?auto_1490 ?auto_1499 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1482 ?auto_1483 ?auto_1484 ?auto_1485 ?auto_1486 )
      ( MAKE-1CRATE ?auto_1486 ?auto_1487 )
      ( MAKE-5CRATE-VERIFY ?auto_1482 ?auto_1483 ?auto_1484 ?auto_1485 ?auto_1486 ?auto_1487 ) )
  )

)

