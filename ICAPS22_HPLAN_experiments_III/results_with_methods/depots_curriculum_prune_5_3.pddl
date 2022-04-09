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
      ?auto_1364 - SURFACE
      ?auto_1365 - SURFACE
    )
    :vars
    (
      ?auto_1366 - HOIST
      ?auto_1367 - PLACE
      ?auto_1369 - PLACE
      ?auto_1370 - HOIST
      ?auto_1371 - SURFACE
      ?auto_1368 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1366 ?auto_1367 ) ( SURFACE-AT ?auto_1364 ?auto_1367 ) ( CLEAR ?auto_1364 ) ( IS-CRATE ?auto_1365 ) ( AVAILABLE ?auto_1366 ) ( not ( = ?auto_1369 ?auto_1367 ) ) ( HOIST-AT ?auto_1370 ?auto_1369 ) ( AVAILABLE ?auto_1370 ) ( SURFACE-AT ?auto_1365 ?auto_1369 ) ( ON ?auto_1365 ?auto_1371 ) ( CLEAR ?auto_1365 ) ( TRUCK-AT ?auto_1368 ?auto_1367 ) ( not ( = ?auto_1364 ?auto_1365 ) ) ( not ( = ?auto_1364 ?auto_1371 ) ) ( not ( = ?auto_1365 ?auto_1371 ) ) ( not ( = ?auto_1366 ?auto_1370 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1368 ?auto_1367 ?auto_1369 )
      ( !LIFT ?auto_1370 ?auto_1365 ?auto_1371 ?auto_1369 )
      ( !LOAD ?auto_1370 ?auto_1365 ?auto_1368 ?auto_1369 )
      ( !DRIVE ?auto_1368 ?auto_1369 ?auto_1367 )
      ( !UNLOAD ?auto_1366 ?auto_1365 ?auto_1368 ?auto_1367 )
      ( !DROP ?auto_1366 ?auto_1365 ?auto_1364 ?auto_1367 )
      ( MAKE-1CRATE-VERIFY ?auto_1364 ?auto_1365 ) )
  )

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1385 - SURFACE
      ?auto_1386 - SURFACE
      ?auto_1387 - SURFACE
    )
    :vars
    (
      ?auto_1390 - HOIST
      ?auto_1393 - PLACE
      ?auto_1392 - PLACE
      ?auto_1389 - HOIST
      ?auto_1391 - SURFACE
      ?auto_1394 - PLACE
      ?auto_1395 - HOIST
      ?auto_1396 - SURFACE
      ?auto_1388 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1390 ?auto_1393 ) ( IS-CRATE ?auto_1387 ) ( not ( = ?auto_1392 ?auto_1393 ) ) ( HOIST-AT ?auto_1389 ?auto_1392 ) ( AVAILABLE ?auto_1389 ) ( SURFACE-AT ?auto_1387 ?auto_1392 ) ( ON ?auto_1387 ?auto_1391 ) ( CLEAR ?auto_1387 ) ( not ( = ?auto_1386 ?auto_1387 ) ) ( not ( = ?auto_1386 ?auto_1391 ) ) ( not ( = ?auto_1387 ?auto_1391 ) ) ( not ( = ?auto_1390 ?auto_1389 ) ) ( SURFACE-AT ?auto_1385 ?auto_1393 ) ( CLEAR ?auto_1385 ) ( IS-CRATE ?auto_1386 ) ( AVAILABLE ?auto_1390 ) ( not ( = ?auto_1394 ?auto_1393 ) ) ( HOIST-AT ?auto_1395 ?auto_1394 ) ( AVAILABLE ?auto_1395 ) ( SURFACE-AT ?auto_1386 ?auto_1394 ) ( ON ?auto_1386 ?auto_1396 ) ( CLEAR ?auto_1386 ) ( TRUCK-AT ?auto_1388 ?auto_1393 ) ( not ( = ?auto_1385 ?auto_1386 ) ) ( not ( = ?auto_1385 ?auto_1396 ) ) ( not ( = ?auto_1386 ?auto_1396 ) ) ( not ( = ?auto_1390 ?auto_1395 ) ) ( not ( = ?auto_1385 ?auto_1387 ) ) ( not ( = ?auto_1385 ?auto_1391 ) ) ( not ( = ?auto_1387 ?auto_1396 ) ) ( not ( = ?auto_1392 ?auto_1394 ) ) ( not ( = ?auto_1389 ?auto_1395 ) ) ( not ( = ?auto_1391 ?auto_1396 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1385 ?auto_1386 )
      ( MAKE-1CRATE ?auto_1386 ?auto_1387 )
      ( MAKE-2CRATE-VERIFY ?auto_1385 ?auto_1386 ?auto_1387 ) )
  )

  ( :method MAKE-3CRATE
    :parameters
    (
      ?auto_1411 - SURFACE
      ?auto_1412 - SURFACE
      ?auto_1413 - SURFACE
      ?auto_1414 - SURFACE
    )
    :vars
    (
      ?auto_1416 - HOIST
      ?auto_1415 - PLACE
      ?auto_1420 - PLACE
      ?auto_1417 - HOIST
      ?auto_1418 - SURFACE
      ?auto_1424 - PLACE
      ?auto_1423 - HOIST
      ?auto_1425 - SURFACE
      ?auto_1422 - PLACE
      ?auto_1426 - HOIST
      ?auto_1421 - SURFACE
      ?auto_1419 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1416 ?auto_1415 ) ( IS-CRATE ?auto_1414 ) ( not ( = ?auto_1420 ?auto_1415 ) ) ( HOIST-AT ?auto_1417 ?auto_1420 ) ( AVAILABLE ?auto_1417 ) ( SURFACE-AT ?auto_1414 ?auto_1420 ) ( ON ?auto_1414 ?auto_1418 ) ( CLEAR ?auto_1414 ) ( not ( = ?auto_1413 ?auto_1414 ) ) ( not ( = ?auto_1413 ?auto_1418 ) ) ( not ( = ?auto_1414 ?auto_1418 ) ) ( not ( = ?auto_1416 ?auto_1417 ) ) ( IS-CRATE ?auto_1413 ) ( not ( = ?auto_1424 ?auto_1415 ) ) ( HOIST-AT ?auto_1423 ?auto_1424 ) ( AVAILABLE ?auto_1423 ) ( SURFACE-AT ?auto_1413 ?auto_1424 ) ( ON ?auto_1413 ?auto_1425 ) ( CLEAR ?auto_1413 ) ( not ( = ?auto_1412 ?auto_1413 ) ) ( not ( = ?auto_1412 ?auto_1425 ) ) ( not ( = ?auto_1413 ?auto_1425 ) ) ( not ( = ?auto_1416 ?auto_1423 ) ) ( SURFACE-AT ?auto_1411 ?auto_1415 ) ( CLEAR ?auto_1411 ) ( IS-CRATE ?auto_1412 ) ( AVAILABLE ?auto_1416 ) ( not ( = ?auto_1422 ?auto_1415 ) ) ( HOIST-AT ?auto_1426 ?auto_1422 ) ( AVAILABLE ?auto_1426 ) ( SURFACE-AT ?auto_1412 ?auto_1422 ) ( ON ?auto_1412 ?auto_1421 ) ( CLEAR ?auto_1412 ) ( TRUCK-AT ?auto_1419 ?auto_1415 ) ( not ( = ?auto_1411 ?auto_1412 ) ) ( not ( = ?auto_1411 ?auto_1421 ) ) ( not ( = ?auto_1412 ?auto_1421 ) ) ( not ( = ?auto_1416 ?auto_1426 ) ) ( not ( = ?auto_1411 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1425 ) ) ( not ( = ?auto_1413 ?auto_1421 ) ) ( not ( = ?auto_1424 ?auto_1422 ) ) ( not ( = ?auto_1423 ?auto_1426 ) ) ( not ( = ?auto_1425 ?auto_1421 ) ) ( not ( = ?auto_1411 ?auto_1414 ) ) ( not ( = ?auto_1411 ?auto_1418 ) ) ( not ( = ?auto_1412 ?auto_1414 ) ) ( not ( = ?auto_1412 ?auto_1418 ) ) ( not ( = ?auto_1414 ?auto_1425 ) ) ( not ( = ?auto_1414 ?auto_1421 ) ) ( not ( = ?auto_1420 ?auto_1424 ) ) ( not ( = ?auto_1420 ?auto_1422 ) ) ( not ( = ?auto_1417 ?auto_1423 ) ) ( not ( = ?auto_1417 ?auto_1426 ) ) ( not ( = ?auto_1418 ?auto_1425 ) ) ( not ( = ?auto_1418 ?auto_1421 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411 ?auto_1412 ?auto_1413 )
      ( MAKE-1CRATE ?auto_1413 ?auto_1414 )
      ( MAKE-3CRATE-VERIFY ?auto_1411 ?auto_1412 ?auto_1413 ?auto_1414 ) )
  )

  ( :method MAKE-4CRATE
    :parameters
    (
      ?auto_1442 - SURFACE
      ?auto_1443 - SURFACE
      ?auto_1444 - SURFACE
      ?auto_1445 - SURFACE
      ?auto_1446 - SURFACE
    )
    :vars
    (
      ?auto_1447 - HOIST
      ?auto_1449 - PLACE
      ?auto_1452 - PLACE
      ?auto_1450 - HOIST
      ?auto_1451 - SURFACE
      ?auto_1456 - PLACE
      ?auto_1454 - HOIST
      ?auto_1455 - SURFACE
      ?auto_1458 - PLACE
      ?auto_1460 - HOIST
      ?auto_1459 - SURFACE
      ?auto_1453 - PLACE
      ?auto_1461 - HOIST
      ?auto_1457 - SURFACE
      ?auto_1448 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1447 ?auto_1449 ) ( IS-CRATE ?auto_1446 ) ( not ( = ?auto_1452 ?auto_1449 ) ) ( HOIST-AT ?auto_1450 ?auto_1452 ) ( AVAILABLE ?auto_1450 ) ( SURFACE-AT ?auto_1446 ?auto_1452 ) ( ON ?auto_1446 ?auto_1451 ) ( CLEAR ?auto_1446 ) ( not ( = ?auto_1445 ?auto_1446 ) ) ( not ( = ?auto_1445 ?auto_1451 ) ) ( not ( = ?auto_1446 ?auto_1451 ) ) ( not ( = ?auto_1447 ?auto_1450 ) ) ( IS-CRATE ?auto_1445 ) ( not ( = ?auto_1456 ?auto_1449 ) ) ( HOIST-AT ?auto_1454 ?auto_1456 ) ( AVAILABLE ?auto_1454 ) ( SURFACE-AT ?auto_1445 ?auto_1456 ) ( ON ?auto_1445 ?auto_1455 ) ( CLEAR ?auto_1445 ) ( not ( = ?auto_1444 ?auto_1445 ) ) ( not ( = ?auto_1444 ?auto_1455 ) ) ( not ( = ?auto_1445 ?auto_1455 ) ) ( not ( = ?auto_1447 ?auto_1454 ) ) ( IS-CRATE ?auto_1444 ) ( not ( = ?auto_1458 ?auto_1449 ) ) ( HOIST-AT ?auto_1460 ?auto_1458 ) ( AVAILABLE ?auto_1460 ) ( SURFACE-AT ?auto_1444 ?auto_1458 ) ( ON ?auto_1444 ?auto_1459 ) ( CLEAR ?auto_1444 ) ( not ( = ?auto_1443 ?auto_1444 ) ) ( not ( = ?auto_1443 ?auto_1459 ) ) ( not ( = ?auto_1444 ?auto_1459 ) ) ( not ( = ?auto_1447 ?auto_1460 ) ) ( SURFACE-AT ?auto_1442 ?auto_1449 ) ( CLEAR ?auto_1442 ) ( IS-CRATE ?auto_1443 ) ( AVAILABLE ?auto_1447 ) ( not ( = ?auto_1453 ?auto_1449 ) ) ( HOIST-AT ?auto_1461 ?auto_1453 ) ( AVAILABLE ?auto_1461 ) ( SURFACE-AT ?auto_1443 ?auto_1453 ) ( ON ?auto_1443 ?auto_1457 ) ( CLEAR ?auto_1443 ) ( TRUCK-AT ?auto_1448 ?auto_1449 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( not ( = ?auto_1442 ?auto_1457 ) ) ( not ( = ?auto_1443 ?auto_1457 ) ) ( not ( = ?auto_1447 ?auto_1461 ) ) ( not ( = ?auto_1442 ?auto_1444 ) ) ( not ( = ?auto_1442 ?auto_1459 ) ) ( not ( = ?auto_1444 ?auto_1457 ) ) ( not ( = ?auto_1458 ?auto_1453 ) ) ( not ( = ?auto_1460 ?auto_1461 ) ) ( not ( = ?auto_1459 ?auto_1457 ) ) ( not ( = ?auto_1442 ?auto_1445 ) ) ( not ( = ?auto_1442 ?auto_1455 ) ) ( not ( = ?auto_1443 ?auto_1445 ) ) ( not ( = ?auto_1443 ?auto_1455 ) ) ( not ( = ?auto_1445 ?auto_1459 ) ) ( not ( = ?auto_1445 ?auto_1457 ) ) ( not ( = ?auto_1456 ?auto_1458 ) ) ( not ( = ?auto_1456 ?auto_1453 ) ) ( not ( = ?auto_1454 ?auto_1460 ) ) ( not ( = ?auto_1454 ?auto_1461 ) ) ( not ( = ?auto_1455 ?auto_1459 ) ) ( not ( = ?auto_1455 ?auto_1457 ) ) ( not ( = ?auto_1442 ?auto_1446 ) ) ( not ( = ?auto_1442 ?auto_1451 ) ) ( not ( = ?auto_1443 ?auto_1446 ) ) ( not ( = ?auto_1443 ?auto_1451 ) ) ( not ( = ?auto_1444 ?auto_1446 ) ) ( not ( = ?auto_1444 ?auto_1451 ) ) ( not ( = ?auto_1446 ?auto_1455 ) ) ( not ( = ?auto_1446 ?auto_1459 ) ) ( not ( = ?auto_1446 ?auto_1457 ) ) ( not ( = ?auto_1452 ?auto_1456 ) ) ( not ( = ?auto_1452 ?auto_1458 ) ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1450 ?auto_1454 ) ) ( not ( = ?auto_1450 ?auto_1460 ) ) ( not ( = ?auto_1450 ?auto_1461 ) ) ( not ( = ?auto_1451 ?auto_1455 ) ) ( not ( = ?auto_1451 ?auto_1459 ) ) ( not ( = ?auto_1451 ?auto_1457 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1442 ?auto_1443 ?auto_1444 ?auto_1445 )
      ( MAKE-1CRATE ?auto_1445 ?auto_1446 )
      ( MAKE-4CRATE-VERIFY ?auto_1442 ?auto_1443 ?auto_1444 ?auto_1445 ?auto_1446 ) )
  )

  ( :method MAKE-5CRATE
    :parameters
    (
      ?auto_1478 - SURFACE
      ?auto_1479 - SURFACE
      ?auto_1480 - SURFACE
      ?auto_1481 - SURFACE
      ?auto_1482 - SURFACE
      ?auto_1483 - SURFACE
    )
    :vars
    (
      ?auto_1488 - HOIST
      ?auto_1489 - PLACE
      ?auto_1485 - PLACE
      ?auto_1486 - HOIST
      ?auto_1487 - SURFACE
      ?auto_1491 - PLACE
      ?auto_1490 - HOIST
      ?auto_1493 - SURFACE
      ?auto_1498 - PLACE
      ?auto_1497 - HOIST
      ?auto_1496 - SURFACE
      ?auto_1494 - PLACE
      ?auto_1492 - HOIST
      ?auto_1495 - SURFACE
      ?auto_1499 - SURFACE
      ?auto_1484 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1488 ?auto_1489 ) ( IS-CRATE ?auto_1483 ) ( not ( = ?auto_1485 ?auto_1489 ) ) ( HOIST-AT ?auto_1486 ?auto_1485 ) ( SURFACE-AT ?auto_1483 ?auto_1485 ) ( ON ?auto_1483 ?auto_1487 ) ( CLEAR ?auto_1483 ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1487 ) ) ( not ( = ?auto_1483 ?auto_1487 ) ) ( not ( = ?auto_1488 ?auto_1486 ) ) ( IS-CRATE ?auto_1482 ) ( not ( = ?auto_1491 ?auto_1489 ) ) ( HOIST-AT ?auto_1490 ?auto_1491 ) ( AVAILABLE ?auto_1490 ) ( SURFACE-AT ?auto_1482 ?auto_1491 ) ( ON ?auto_1482 ?auto_1493 ) ( CLEAR ?auto_1482 ) ( not ( = ?auto_1481 ?auto_1482 ) ) ( not ( = ?auto_1481 ?auto_1493 ) ) ( not ( = ?auto_1482 ?auto_1493 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( IS-CRATE ?auto_1481 ) ( not ( = ?auto_1498 ?auto_1489 ) ) ( HOIST-AT ?auto_1497 ?auto_1498 ) ( AVAILABLE ?auto_1497 ) ( SURFACE-AT ?auto_1481 ?auto_1498 ) ( ON ?auto_1481 ?auto_1496 ) ( CLEAR ?auto_1481 ) ( not ( = ?auto_1480 ?auto_1481 ) ) ( not ( = ?auto_1480 ?auto_1496 ) ) ( not ( = ?auto_1481 ?auto_1496 ) ) ( not ( = ?auto_1488 ?auto_1497 ) ) ( IS-CRATE ?auto_1480 ) ( not ( = ?auto_1494 ?auto_1489 ) ) ( HOIST-AT ?auto_1492 ?auto_1494 ) ( AVAILABLE ?auto_1492 ) ( SURFACE-AT ?auto_1480 ?auto_1494 ) ( ON ?auto_1480 ?auto_1495 ) ( CLEAR ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1480 ) ) ( not ( = ?auto_1479 ?auto_1495 ) ) ( not ( = ?auto_1480 ?auto_1495 ) ) ( not ( = ?auto_1488 ?auto_1492 ) ) ( SURFACE-AT ?auto_1478 ?auto_1489 ) ( CLEAR ?auto_1478 ) ( IS-CRATE ?auto_1479 ) ( AVAILABLE ?auto_1488 ) ( AVAILABLE ?auto_1486 ) ( SURFACE-AT ?auto_1479 ?auto_1485 ) ( ON ?auto_1479 ?auto_1499 ) ( CLEAR ?auto_1479 ) ( TRUCK-AT ?auto_1484 ?auto_1489 ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( not ( = ?auto_1478 ?auto_1499 ) ) ( not ( = ?auto_1479 ?auto_1499 ) ) ( not ( = ?auto_1478 ?auto_1480 ) ) ( not ( = ?auto_1478 ?auto_1495 ) ) ( not ( = ?auto_1480 ?auto_1499 ) ) ( not ( = ?auto_1494 ?auto_1485 ) ) ( not ( = ?auto_1492 ?auto_1486 ) ) ( not ( = ?auto_1495 ?auto_1499 ) ) ( not ( = ?auto_1478 ?auto_1481 ) ) ( not ( = ?auto_1478 ?auto_1496 ) ) ( not ( = ?auto_1479 ?auto_1481 ) ) ( not ( = ?auto_1479 ?auto_1496 ) ) ( not ( = ?auto_1481 ?auto_1495 ) ) ( not ( = ?auto_1481 ?auto_1499 ) ) ( not ( = ?auto_1498 ?auto_1494 ) ) ( not ( = ?auto_1498 ?auto_1485 ) ) ( not ( = ?auto_1497 ?auto_1492 ) ) ( not ( = ?auto_1497 ?auto_1486 ) ) ( not ( = ?auto_1496 ?auto_1495 ) ) ( not ( = ?auto_1496 ?auto_1499 ) ) ( not ( = ?auto_1478 ?auto_1482 ) ) ( not ( = ?auto_1478 ?auto_1493 ) ) ( not ( = ?auto_1479 ?auto_1482 ) ) ( not ( = ?auto_1479 ?auto_1493 ) ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( not ( = ?auto_1480 ?auto_1493 ) ) ( not ( = ?auto_1482 ?auto_1496 ) ) ( not ( = ?auto_1482 ?auto_1495 ) ) ( not ( = ?auto_1482 ?auto_1499 ) ) ( not ( = ?auto_1491 ?auto_1498 ) ) ( not ( = ?auto_1491 ?auto_1494 ) ) ( not ( = ?auto_1491 ?auto_1485 ) ) ( not ( = ?auto_1490 ?auto_1497 ) ) ( not ( = ?auto_1490 ?auto_1492 ) ) ( not ( = ?auto_1490 ?auto_1486 ) ) ( not ( = ?auto_1493 ?auto_1496 ) ) ( not ( = ?auto_1493 ?auto_1495 ) ) ( not ( = ?auto_1493 ?auto_1499 ) ) ( not ( = ?auto_1478 ?auto_1483 ) ) ( not ( = ?auto_1478 ?auto_1487 ) ) ( not ( = ?auto_1479 ?auto_1483 ) ) ( not ( = ?auto_1479 ?auto_1487 ) ) ( not ( = ?auto_1480 ?auto_1483 ) ) ( not ( = ?auto_1480 ?auto_1487 ) ) ( not ( = ?auto_1481 ?auto_1483 ) ) ( not ( = ?auto_1481 ?auto_1487 ) ) ( not ( = ?auto_1483 ?auto_1493 ) ) ( not ( = ?auto_1483 ?auto_1496 ) ) ( not ( = ?auto_1483 ?auto_1495 ) ) ( not ( = ?auto_1483 ?auto_1499 ) ) ( not ( = ?auto_1487 ?auto_1493 ) ) ( not ( = ?auto_1487 ?auto_1496 ) ) ( not ( = ?auto_1487 ?auto_1495 ) ) ( not ( = ?auto_1487 ?auto_1499 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1478 ?auto_1479 ?auto_1480 ?auto_1481 ?auto_1482 )
      ( MAKE-1CRATE ?auto_1482 ?auto_1483 )
      ( MAKE-5CRATE-VERIFY ?auto_1478 ?auto_1479 ?auto_1480 ?auto_1481 ?auto_1482 ?auto_1483 ) )
  )

)

