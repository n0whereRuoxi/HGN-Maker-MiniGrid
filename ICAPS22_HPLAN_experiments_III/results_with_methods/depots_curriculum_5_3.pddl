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

  ( :method MAKE-2CRATE
    :parameters
    (
      ?auto_1385 - SURFACE
      ?auto_1386 - SURFACE
      ?auto_1387 - SURFACE
    )
    :vars
    (
      ?auto_1393 - HOIST
      ?auto_1392 - PLACE
      ?auto_1388 - PLACE
      ?auto_1391 - HOIST
      ?auto_1390 - SURFACE
      ?auto_1395 - PLACE
      ?auto_1396 - HOIST
      ?auto_1394 - SURFACE
      ?auto_1389 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1393 ?auto_1392 ) ( IS-CRATE ?auto_1387 ) ( not ( = ?auto_1388 ?auto_1392 ) ) ( HOIST-AT ?auto_1391 ?auto_1388 ) ( AVAILABLE ?auto_1391 ) ( SURFACE-AT ?auto_1387 ?auto_1388 ) ( ON ?auto_1387 ?auto_1390 ) ( CLEAR ?auto_1387 ) ( not ( = ?auto_1386 ?auto_1387 ) ) ( not ( = ?auto_1386 ?auto_1390 ) ) ( not ( = ?auto_1387 ?auto_1390 ) ) ( not ( = ?auto_1393 ?auto_1391 ) ) ( SURFACE-AT ?auto_1385 ?auto_1392 ) ( CLEAR ?auto_1385 ) ( IS-CRATE ?auto_1386 ) ( AVAILABLE ?auto_1393 ) ( not ( = ?auto_1395 ?auto_1392 ) ) ( HOIST-AT ?auto_1396 ?auto_1395 ) ( AVAILABLE ?auto_1396 ) ( SURFACE-AT ?auto_1386 ?auto_1395 ) ( ON ?auto_1386 ?auto_1394 ) ( CLEAR ?auto_1386 ) ( TRUCK-AT ?auto_1389 ?auto_1392 ) ( not ( = ?auto_1385 ?auto_1386 ) ) ( not ( = ?auto_1385 ?auto_1394 ) ) ( not ( = ?auto_1386 ?auto_1394 ) ) ( not ( = ?auto_1393 ?auto_1396 ) ) ( not ( = ?auto_1385 ?auto_1387 ) ) ( not ( = ?auto_1385 ?auto_1390 ) ) ( not ( = ?auto_1387 ?auto_1394 ) ) ( not ( = ?auto_1388 ?auto_1395 ) ) ( not ( = ?auto_1391 ?auto_1396 ) ) ( not ( = ?auto_1390 ?auto_1394 ) ) )
    :subtasks
    ( ( MAKE-1CRATE ?auto_1385 ?auto_1386 )
      ( MAKE-1CRATE ?auto_1386 ?auto_1387 )
      ( MAKE-2CRATE-VERIFY ?auto_1385 ?auto_1386 ?auto_1387 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1399 - SURFACE
      ?auto_1400 - SURFACE
    )
    :vars
    (
      ?auto_1401 - HOIST
      ?auto_1402 - PLACE
      ?auto_1404 - PLACE
      ?auto_1405 - HOIST
      ?auto_1406 - SURFACE
      ?auto_1403 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1401 ?auto_1402 ) ( SURFACE-AT ?auto_1399 ?auto_1402 ) ( CLEAR ?auto_1399 ) ( IS-CRATE ?auto_1400 ) ( AVAILABLE ?auto_1401 ) ( not ( = ?auto_1404 ?auto_1402 ) ) ( HOIST-AT ?auto_1405 ?auto_1404 ) ( AVAILABLE ?auto_1405 ) ( SURFACE-AT ?auto_1400 ?auto_1404 ) ( ON ?auto_1400 ?auto_1406 ) ( CLEAR ?auto_1400 ) ( TRUCK-AT ?auto_1403 ?auto_1402 ) ( not ( = ?auto_1399 ?auto_1400 ) ) ( not ( = ?auto_1399 ?auto_1406 ) ) ( not ( = ?auto_1400 ?auto_1406 ) ) ( not ( = ?auto_1401 ?auto_1405 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1403 ?auto_1402 ?auto_1404 )
      ( !LIFT ?auto_1405 ?auto_1400 ?auto_1406 ?auto_1404 )
      ( !LOAD ?auto_1405 ?auto_1400 ?auto_1403 ?auto_1404 )
      ( !DRIVE ?auto_1403 ?auto_1404 ?auto_1402 )
      ( !UNLOAD ?auto_1401 ?auto_1400 ?auto_1403 ?auto_1402 )
      ( !DROP ?auto_1401 ?auto_1400 ?auto_1399 ?auto_1402 )
      ( MAKE-1CRATE-VERIFY ?auto_1399 ?auto_1400 ) )
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
      ?auto_1419 - PLACE
      ?auto_1417 - PLACE
      ?auto_1418 - HOIST
      ?auto_1415 - SURFACE
      ?auto_1424 - PLACE
      ?auto_1422 - HOIST
      ?auto_1423 - SURFACE
      ?auto_1421 - PLACE
      ?auto_1425 - HOIST
      ?auto_1426 - SURFACE
      ?auto_1420 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1416 ?auto_1419 ) ( IS-CRATE ?auto_1414 ) ( not ( = ?auto_1417 ?auto_1419 ) ) ( HOIST-AT ?auto_1418 ?auto_1417 ) ( AVAILABLE ?auto_1418 ) ( SURFACE-AT ?auto_1414 ?auto_1417 ) ( ON ?auto_1414 ?auto_1415 ) ( CLEAR ?auto_1414 ) ( not ( = ?auto_1413 ?auto_1414 ) ) ( not ( = ?auto_1413 ?auto_1415 ) ) ( not ( = ?auto_1414 ?auto_1415 ) ) ( not ( = ?auto_1416 ?auto_1418 ) ) ( IS-CRATE ?auto_1413 ) ( not ( = ?auto_1424 ?auto_1419 ) ) ( HOIST-AT ?auto_1422 ?auto_1424 ) ( AVAILABLE ?auto_1422 ) ( SURFACE-AT ?auto_1413 ?auto_1424 ) ( ON ?auto_1413 ?auto_1423 ) ( CLEAR ?auto_1413 ) ( not ( = ?auto_1412 ?auto_1413 ) ) ( not ( = ?auto_1412 ?auto_1423 ) ) ( not ( = ?auto_1413 ?auto_1423 ) ) ( not ( = ?auto_1416 ?auto_1422 ) ) ( SURFACE-AT ?auto_1411 ?auto_1419 ) ( CLEAR ?auto_1411 ) ( IS-CRATE ?auto_1412 ) ( AVAILABLE ?auto_1416 ) ( not ( = ?auto_1421 ?auto_1419 ) ) ( HOIST-AT ?auto_1425 ?auto_1421 ) ( AVAILABLE ?auto_1425 ) ( SURFACE-AT ?auto_1412 ?auto_1421 ) ( ON ?auto_1412 ?auto_1426 ) ( CLEAR ?auto_1412 ) ( TRUCK-AT ?auto_1420 ?auto_1419 ) ( not ( = ?auto_1411 ?auto_1412 ) ) ( not ( = ?auto_1411 ?auto_1426 ) ) ( not ( = ?auto_1412 ?auto_1426 ) ) ( not ( = ?auto_1416 ?auto_1425 ) ) ( not ( = ?auto_1411 ?auto_1413 ) ) ( not ( = ?auto_1411 ?auto_1423 ) ) ( not ( = ?auto_1413 ?auto_1426 ) ) ( not ( = ?auto_1424 ?auto_1421 ) ) ( not ( = ?auto_1422 ?auto_1425 ) ) ( not ( = ?auto_1423 ?auto_1426 ) ) ( not ( = ?auto_1411 ?auto_1414 ) ) ( not ( = ?auto_1411 ?auto_1415 ) ) ( not ( = ?auto_1412 ?auto_1414 ) ) ( not ( = ?auto_1412 ?auto_1415 ) ) ( not ( = ?auto_1414 ?auto_1423 ) ) ( not ( = ?auto_1414 ?auto_1426 ) ) ( not ( = ?auto_1417 ?auto_1424 ) ) ( not ( = ?auto_1417 ?auto_1421 ) ) ( not ( = ?auto_1418 ?auto_1422 ) ) ( not ( = ?auto_1418 ?auto_1425 ) ) ( not ( = ?auto_1415 ?auto_1423 ) ) ( not ( = ?auto_1415 ?auto_1426 ) ) )
    :subtasks
    ( ( MAKE-2CRATE ?auto_1411 ?auto_1412 ?auto_1413 )
      ( MAKE-1CRATE ?auto_1413 ?auto_1414 )
      ( MAKE-3CRATE-VERIFY ?auto_1411 ?auto_1412 ?auto_1413 ?auto_1414 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1429 - SURFACE
      ?auto_1430 - SURFACE
    )
    :vars
    (
      ?auto_1431 - HOIST
      ?auto_1432 - PLACE
      ?auto_1434 - PLACE
      ?auto_1435 - HOIST
      ?auto_1436 - SURFACE
      ?auto_1433 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1431 ?auto_1432 ) ( SURFACE-AT ?auto_1429 ?auto_1432 ) ( CLEAR ?auto_1429 ) ( IS-CRATE ?auto_1430 ) ( AVAILABLE ?auto_1431 ) ( not ( = ?auto_1434 ?auto_1432 ) ) ( HOIST-AT ?auto_1435 ?auto_1434 ) ( AVAILABLE ?auto_1435 ) ( SURFACE-AT ?auto_1430 ?auto_1434 ) ( ON ?auto_1430 ?auto_1436 ) ( CLEAR ?auto_1430 ) ( TRUCK-AT ?auto_1433 ?auto_1432 ) ( not ( = ?auto_1429 ?auto_1430 ) ) ( not ( = ?auto_1429 ?auto_1436 ) ) ( not ( = ?auto_1430 ?auto_1436 ) ) ( not ( = ?auto_1431 ?auto_1435 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1433 ?auto_1432 ?auto_1434 )
      ( !LIFT ?auto_1435 ?auto_1430 ?auto_1436 ?auto_1434 )
      ( !LOAD ?auto_1435 ?auto_1430 ?auto_1433 ?auto_1434 )
      ( !DRIVE ?auto_1433 ?auto_1434 ?auto_1432 )
      ( !UNLOAD ?auto_1431 ?auto_1430 ?auto_1433 ?auto_1432 )
      ( !DROP ?auto_1431 ?auto_1430 ?auto_1429 ?auto_1432 )
      ( MAKE-1CRATE-VERIFY ?auto_1429 ?auto_1430 ) )
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
      ?auto_1449 - HOIST
      ?auto_1448 - PLACE
      ?auto_1450 - PLACE
      ?auto_1451 - HOIST
      ?auto_1452 - SURFACE
      ?auto_1455 - PLACE
      ?auto_1454 - HOIST
      ?auto_1453 - SURFACE
      ?auto_1459 - PLACE
      ?auto_1461 - HOIST
      ?auto_1457 - SURFACE
      ?auto_1460 - PLACE
      ?auto_1458 - HOIST
      ?auto_1456 - SURFACE
      ?auto_1447 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1449 ?auto_1448 ) ( IS-CRATE ?auto_1446 ) ( not ( = ?auto_1450 ?auto_1448 ) ) ( HOIST-AT ?auto_1451 ?auto_1450 ) ( AVAILABLE ?auto_1451 ) ( SURFACE-AT ?auto_1446 ?auto_1450 ) ( ON ?auto_1446 ?auto_1452 ) ( CLEAR ?auto_1446 ) ( not ( = ?auto_1445 ?auto_1446 ) ) ( not ( = ?auto_1445 ?auto_1452 ) ) ( not ( = ?auto_1446 ?auto_1452 ) ) ( not ( = ?auto_1449 ?auto_1451 ) ) ( IS-CRATE ?auto_1445 ) ( not ( = ?auto_1455 ?auto_1448 ) ) ( HOIST-AT ?auto_1454 ?auto_1455 ) ( AVAILABLE ?auto_1454 ) ( SURFACE-AT ?auto_1445 ?auto_1455 ) ( ON ?auto_1445 ?auto_1453 ) ( CLEAR ?auto_1445 ) ( not ( = ?auto_1444 ?auto_1445 ) ) ( not ( = ?auto_1444 ?auto_1453 ) ) ( not ( = ?auto_1445 ?auto_1453 ) ) ( not ( = ?auto_1449 ?auto_1454 ) ) ( IS-CRATE ?auto_1444 ) ( not ( = ?auto_1459 ?auto_1448 ) ) ( HOIST-AT ?auto_1461 ?auto_1459 ) ( AVAILABLE ?auto_1461 ) ( SURFACE-AT ?auto_1444 ?auto_1459 ) ( ON ?auto_1444 ?auto_1457 ) ( CLEAR ?auto_1444 ) ( not ( = ?auto_1443 ?auto_1444 ) ) ( not ( = ?auto_1443 ?auto_1457 ) ) ( not ( = ?auto_1444 ?auto_1457 ) ) ( not ( = ?auto_1449 ?auto_1461 ) ) ( SURFACE-AT ?auto_1442 ?auto_1448 ) ( CLEAR ?auto_1442 ) ( IS-CRATE ?auto_1443 ) ( AVAILABLE ?auto_1449 ) ( not ( = ?auto_1460 ?auto_1448 ) ) ( HOIST-AT ?auto_1458 ?auto_1460 ) ( AVAILABLE ?auto_1458 ) ( SURFACE-AT ?auto_1443 ?auto_1460 ) ( ON ?auto_1443 ?auto_1456 ) ( CLEAR ?auto_1443 ) ( TRUCK-AT ?auto_1447 ?auto_1448 ) ( not ( = ?auto_1442 ?auto_1443 ) ) ( not ( = ?auto_1442 ?auto_1456 ) ) ( not ( = ?auto_1443 ?auto_1456 ) ) ( not ( = ?auto_1449 ?auto_1458 ) ) ( not ( = ?auto_1442 ?auto_1444 ) ) ( not ( = ?auto_1442 ?auto_1457 ) ) ( not ( = ?auto_1444 ?auto_1456 ) ) ( not ( = ?auto_1459 ?auto_1460 ) ) ( not ( = ?auto_1461 ?auto_1458 ) ) ( not ( = ?auto_1457 ?auto_1456 ) ) ( not ( = ?auto_1442 ?auto_1445 ) ) ( not ( = ?auto_1442 ?auto_1453 ) ) ( not ( = ?auto_1443 ?auto_1445 ) ) ( not ( = ?auto_1443 ?auto_1453 ) ) ( not ( = ?auto_1445 ?auto_1457 ) ) ( not ( = ?auto_1445 ?auto_1456 ) ) ( not ( = ?auto_1455 ?auto_1459 ) ) ( not ( = ?auto_1455 ?auto_1460 ) ) ( not ( = ?auto_1454 ?auto_1461 ) ) ( not ( = ?auto_1454 ?auto_1458 ) ) ( not ( = ?auto_1453 ?auto_1457 ) ) ( not ( = ?auto_1453 ?auto_1456 ) ) ( not ( = ?auto_1442 ?auto_1446 ) ) ( not ( = ?auto_1442 ?auto_1452 ) ) ( not ( = ?auto_1443 ?auto_1446 ) ) ( not ( = ?auto_1443 ?auto_1452 ) ) ( not ( = ?auto_1444 ?auto_1446 ) ) ( not ( = ?auto_1444 ?auto_1452 ) ) ( not ( = ?auto_1446 ?auto_1453 ) ) ( not ( = ?auto_1446 ?auto_1457 ) ) ( not ( = ?auto_1446 ?auto_1456 ) ) ( not ( = ?auto_1450 ?auto_1455 ) ) ( not ( = ?auto_1450 ?auto_1459 ) ) ( not ( = ?auto_1450 ?auto_1460 ) ) ( not ( = ?auto_1451 ?auto_1454 ) ) ( not ( = ?auto_1451 ?auto_1461 ) ) ( not ( = ?auto_1451 ?auto_1458 ) ) ( not ( = ?auto_1452 ?auto_1453 ) ) ( not ( = ?auto_1452 ?auto_1457 ) ) ( not ( = ?auto_1452 ?auto_1456 ) ) )
    :subtasks
    ( ( MAKE-3CRATE ?auto_1442 ?auto_1443 ?auto_1444 ?auto_1445 )
      ( MAKE-1CRATE ?auto_1445 ?auto_1446 )
      ( MAKE-4CRATE-VERIFY ?auto_1442 ?auto_1443 ?auto_1444 ?auto_1445 ?auto_1446 ) )
  )

  ( :method MAKE-1CRATE
    :parameters
    (
      ?auto_1464 - SURFACE
      ?auto_1465 - SURFACE
    )
    :vars
    (
      ?auto_1466 - HOIST
      ?auto_1467 - PLACE
      ?auto_1469 - PLACE
      ?auto_1470 - HOIST
      ?auto_1471 - SURFACE
      ?auto_1468 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1466 ?auto_1467 ) ( SURFACE-AT ?auto_1464 ?auto_1467 ) ( CLEAR ?auto_1464 ) ( IS-CRATE ?auto_1465 ) ( AVAILABLE ?auto_1466 ) ( not ( = ?auto_1469 ?auto_1467 ) ) ( HOIST-AT ?auto_1470 ?auto_1469 ) ( AVAILABLE ?auto_1470 ) ( SURFACE-AT ?auto_1465 ?auto_1469 ) ( ON ?auto_1465 ?auto_1471 ) ( CLEAR ?auto_1465 ) ( TRUCK-AT ?auto_1468 ?auto_1467 ) ( not ( = ?auto_1464 ?auto_1465 ) ) ( not ( = ?auto_1464 ?auto_1471 ) ) ( not ( = ?auto_1465 ?auto_1471 ) ) ( not ( = ?auto_1466 ?auto_1470 ) ) )
    :subtasks
    ( ( !DRIVE ?auto_1468 ?auto_1467 ?auto_1469 )
      ( !LIFT ?auto_1470 ?auto_1465 ?auto_1471 ?auto_1469 )
      ( !LOAD ?auto_1470 ?auto_1465 ?auto_1468 ?auto_1469 )
      ( !DRIVE ?auto_1468 ?auto_1469 ?auto_1467 )
      ( !UNLOAD ?auto_1466 ?auto_1465 ?auto_1468 ?auto_1467 )
      ( !DROP ?auto_1466 ?auto_1465 ?auto_1464 ?auto_1467 )
      ( MAKE-1CRATE-VERIFY ?auto_1464 ?auto_1465 ) )
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
      ?auto_1486 - PLACE
      ?auto_1487 - PLACE
      ?auto_1485 - HOIST
      ?auto_1484 - SURFACE
      ?auto_1493 - PLACE
      ?auto_1494 - HOIST
      ?auto_1496 - SURFACE
      ?auto_1491 - PLACE
      ?auto_1497 - HOIST
      ?auto_1492 - SURFACE
      ?auto_1499 - PLACE
      ?auto_1490 - HOIST
      ?auto_1495 - SURFACE
      ?auto_1498 - SURFACE
      ?auto_1489 - TRUCK
    )
    :precondition
    ( and ( HOIST-AT ?auto_1488 ?auto_1486 ) ( IS-CRATE ?auto_1483 ) ( not ( = ?auto_1487 ?auto_1486 ) ) ( HOIST-AT ?auto_1485 ?auto_1487 ) ( SURFACE-AT ?auto_1483 ?auto_1487 ) ( ON ?auto_1483 ?auto_1484 ) ( CLEAR ?auto_1483 ) ( not ( = ?auto_1482 ?auto_1483 ) ) ( not ( = ?auto_1482 ?auto_1484 ) ) ( not ( = ?auto_1483 ?auto_1484 ) ) ( not ( = ?auto_1488 ?auto_1485 ) ) ( IS-CRATE ?auto_1482 ) ( not ( = ?auto_1493 ?auto_1486 ) ) ( HOIST-AT ?auto_1494 ?auto_1493 ) ( AVAILABLE ?auto_1494 ) ( SURFACE-AT ?auto_1482 ?auto_1493 ) ( ON ?auto_1482 ?auto_1496 ) ( CLEAR ?auto_1482 ) ( not ( = ?auto_1481 ?auto_1482 ) ) ( not ( = ?auto_1481 ?auto_1496 ) ) ( not ( = ?auto_1482 ?auto_1496 ) ) ( not ( = ?auto_1488 ?auto_1494 ) ) ( IS-CRATE ?auto_1481 ) ( not ( = ?auto_1491 ?auto_1486 ) ) ( HOIST-AT ?auto_1497 ?auto_1491 ) ( AVAILABLE ?auto_1497 ) ( SURFACE-AT ?auto_1481 ?auto_1491 ) ( ON ?auto_1481 ?auto_1492 ) ( CLEAR ?auto_1481 ) ( not ( = ?auto_1480 ?auto_1481 ) ) ( not ( = ?auto_1480 ?auto_1492 ) ) ( not ( = ?auto_1481 ?auto_1492 ) ) ( not ( = ?auto_1488 ?auto_1497 ) ) ( IS-CRATE ?auto_1480 ) ( not ( = ?auto_1499 ?auto_1486 ) ) ( HOIST-AT ?auto_1490 ?auto_1499 ) ( AVAILABLE ?auto_1490 ) ( SURFACE-AT ?auto_1480 ?auto_1499 ) ( ON ?auto_1480 ?auto_1495 ) ( CLEAR ?auto_1480 ) ( not ( = ?auto_1479 ?auto_1480 ) ) ( not ( = ?auto_1479 ?auto_1495 ) ) ( not ( = ?auto_1480 ?auto_1495 ) ) ( not ( = ?auto_1488 ?auto_1490 ) ) ( SURFACE-AT ?auto_1478 ?auto_1486 ) ( CLEAR ?auto_1478 ) ( IS-CRATE ?auto_1479 ) ( AVAILABLE ?auto_1488 ) ( AVAILABLE ?auto_1485 ) ( SURFACE-AT ?auto_1479 ?auto_1487 ) ( ON ?auto_1479 ?auto_1498 ) ( CLEAR ?auto_1479 ) ( TRUCK-AT ?auto_1489 ?auto_1486 ) ( not ( = ?auto_1478 ?auto_1479 ) ) ( not ( = ?auto_1478 ?auto_1498 ) ) ( not ( = ?auto_1479 ?auto_1498 ) ) ( not ( = ?auto_1478 ?auto_1480 ) ) ( not ( = ?auto_1478 ?auto_1495 ) ) ( not ( = ?auto_1480 ?auto_1498 ) ) ( not ( = ?auto_1499 ?auto_1487 ) ) ( not ( = ?auto_1490 ?auto_1485 ) ) ( not ( = ?auto_1495 ?auto_1498 ) ) ( not ( = ?auto_1478 ?auto_1481 ) ) ( not ( = ?auto_1478 ?auto_1492 ) ) ( not ( = ?auto_1479 ?auto_1481 ) ) ( not ( = ?auto_1479 ?auto_1492 ) ) ( not ( = ?auto_1481 ?auto_1495 ) ) ( not ( = ?auto_1481 ?auto_1498 ) ) ( not ( = ?auto_1491 ?auto_1499 ) ) ( not ( = ?auto_1491 ?auto_1487 ) ) ( not ( = ?auto_1497 ?auto_1490 ) ) ( not ( = ?auto_1497 ?auto_1485 ) ) ( not ( = ?auto_1492 ?auto_1495 ) ) ( not ( = ?auto_1492 ?auto_1498 ) ) ( not ( = ?auto_1478 ?auto_1482 ) ) ( not ( = ?auto_1478 ?auto_1496 ) ) ( not ( = ?auto_1479 ?auto_1482 ) ) ( not ( = ?auto_1479 ?auto_1496 ) ) ( not ( = ?auto_1480 ?auto_1482 ) ) ( not ( = ?auto_1480 ?auto_1496 ) ) ( not ( = ?auto_1482 ?auto_1492 ) ) ( not ( = ?auto_1482 ?auto_1495 ) ) ( not ( = ?auto_1482 ?auto_1498 ) ) ( not ( = ?auto_1493 ?auto_1491 ) ) ( not ( = ?auto_1493 ?auto_1499 ) ) ( not ( = ?auto_1493 ?auto_1487 ) ) ( not ( = ?auto_1494 ?auto_1497 ) ) ( not ( = ?auto_1494 ?auto_1490 ) ) ( not ( = ?auto_1494 ?auto_1485 ) ) ( not ( = ?auto_1496 ?auto_1492 ) ) ( not ( = ?auto_1496 ?auto_1495 ) ) ( not ( = ?auto_1496 ?auto_1498 ) ) ( not ( = ?auto_1478 ?auto_1483 ) ) ( not ( = ?auto_1478 ?auto_1484 ) ) ( not ( = ?auto_1479 ?auto_1483 ) ) ( not ( = ?auto_1479 ?auto_1484 ) ) ( not ( = ?auto_1480 ?auto_1483 ) ) ( not ( = ?auto_1480 ?auto_1484 ) ) ( not ( = ?auto_1481 ?auto_1483 ) ) ( not ( = ?auto_1481 ?auto_1484 ) ) ( not ( = ?auto_1483 ?auto_1496 ) ) ( not ( = ?auto_1483 ?auto_1492 ) ) ( not ( = ?auto_1483 ?auto_1495 ) ) ( not ( = ?auto_1483 ?auto_1498 ) ) ( not ( = ?auto_1484 ?auto_1496 ) ) ( not ( = ?auto_1484 ?auto_1492 ) ) ( not ( = ?auto_1484 ?auto_1495 ) ) ( not ( = ?auto_1484 ?auto_1498 ) ) )
    :subtasks
    ( ( MAKE-4CRATE ?auto_1478 ?auto_1479 ?auto_1480 ?auto_1481 ?auto_1482 )
      ( MAKE-1CRATE ?auto_1482 ?auto_1483 )
      ( MAKE-5CRATE-VERIFY ?auto_1478 ?auto_1479 ?auto_1480 ?auto_1481 ?auto_1482 ?auto_1483 ) )
  )

)

